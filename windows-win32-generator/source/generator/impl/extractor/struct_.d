module generator.impl.extractor.struct_;

import database.database;
import database.schema;
import database.relation.customattributeresolver;
import database.relation.classlayoutresolver;
import database.relation.nestedclassresolver;
import generator.type;
import generator.impl.helper.stringhelper;
import generator.impl.helper.knowntypes;
import generator.impl.helper.typeconverter;

import std.array, std.conv, std.string, std.typecons;


class StructDeclExtractor
{
    private
    {
        IDatabase db;
        TypeConverter typeConverter;
        const(KnownTypes) knownTypes;
        const(CustomAttributeResolver) customAttributeResolver;
        NestedClassResolver nestedClassResolver;
        ClassLayoutResolver classLayoutResolver;
        StringHelper helper;

        enum string[string] keywordsMap =
        [
            "version": "version_",
            "module": "module_",
            "alias": "alias_",
            "align": "align_",
            "function": "function_",
            "scope": "scope_",
            "out": "out_",
        ];
    }

    this(IDatabase db, TypeConverter typeConverter, const(KnownTypes) knownTypes, const(CustomAttributeResolver) customAttributeResolver)
    {
        this.db = db;
        this.typeConverter = typeConverter;
        this.knownTypes = knownTypes;
        this.customAttributeResolver = customAttributeResolver;
        this.nestedClassResolver = new NestedClassResolver(db.nestedClass);
        this.classLayoutResolver = new ClassLayoutResolver(db.classLayout);
        this.helper = new StringHelper();
    }

    Declaration extractFrom(TypeDefRow typeDef)
    {
        ExtractStructContext context;
        return toStructOrUnionDecl(typeDef, &context);
    }

    private struct ExtractStructContext
    {
        int indentLevel;
        int nBitfields;
    }

    private Declaration toStructOrUnionDecl(TypeDefRow typeDef, ExtractStructContext* context)
    {
        Declaration decl;

        auto declString = appender!string();
        auto indentString = helper.getIndentation(context.indentLevel);

        declString ~= indentString;
        declString ~= typeDef.isUnion ? "union" : "struct";

        auto typeName = typeDef.typeName;

        if (typeName.startsWith("_Anonymous"))
        {
            if (typeDef.isUnion)
                assert(typeName.endsWith("_Union"));
            else
                assert(typeName.endsWith("_Struct"));
        }
        else
        {
            declString ~= " ";
            auto encodedName = typeConverter.convert(typeDef).dlangType;
            auto declName = encodedName;
            if (encodedName.startsWith("_") && encodedName.endsWith("_e__Union"))
                declName = encodedName[1..$-9];
            else if (encodedName.startsWith("_") && encodedName.endsWith("_e__Struct"))
                declName = encodedName[1..$-10];
            declString ~= replaceKeyword(declName);
        }

        declString ~= "\n";
        declString ~= indentString;
        declString ~= "{\n";

        context.indentLevel++;

        auto classLayoutRid = classLayoutResolver.getClassLayoutRid(typeDef.rid);
        if (!classLayoutRid.isNull)
        {
            declString ~= helper.getIndentation(context.indentLevel);
            auto classLayout = db.classLayout.getRowByRid(classLayoutRid);
            declString ~= format("align (%d):\n", classLayout.packingSize);
        }

        foreach (field; db.field.getRows(typeDef.fieldList).array)
        {
            auto nestedClassRids = nestedClassResolver.getNestedClasses(typeDef.rid);
            auto fieldDecl = toFieldDecl(field, nestedClassRids, context);
            declString ~= fieldDecl.declString ~ "\n";
            decl.referencedTypes ~= fieldDecl.referencedTypes;
        }

        context.indentLevel--;

        declString ~= indentString;
        declString ~= "}";

        decl.declaredName = typeName;
        decl.declString = declString[];

        return decl;
    }

    private Declaration toFieldDecl(FieldRow field, const(TypeDefRID)[] maybeNestedClassRids, ExtractStructContext* context)
    {
        auto indentString = helper.getIndentation(context.indentLevel);

        auto toSimpleFieldDecl(FieldRow field)
        {
            auto typeSig = field.signature.typeSig;
            auto type = typeConverter.convert(field.signature.typeSig, isConst(field));

            auto fieldNameString = replaceKeyword(field.name);

            if (fieldNameString == "_bitfield")
            {
                fieldNameString ~= context.nBitfields.to!constr;
                context.nBitfields++;
            }

            if (type.dlangTypeUnqual == fieldNameString)
                fieldNameString ~= "_";

            auto str = format("%s%s %s;", indentString, type.dlangType, fieldNameString);

            return Declaration(field.name, str, type.cliType.isPremitive ? null : [ type.cliType ]);
        }

        auto type = typeConverter.convert(field.signature.typeSig);

        if (type.cliType.isPremitive)
        {
            return toSimpleFieldDecl(field);
        }

        auto fieldTypeCodedIndex = field.signature.typeSig.valueType.tryMatch!((CodedIndex!TypeDefOrRef ci) => ci);

        if (fieldTypeCodedIndex.type == TypeDefOrRef.TypeDef)
        {
            return toSimpleFieldDecl(field);
        }
        else if (fieldTypeCodedIndex.type == TypeDefOrRef.TypeRef)
        {
            auto typeRef = db.typeRef.getRowByRid(TypeRefRID(fieldTypeCodedIndex.index));
            auto resolutionScope = typeRef.resolutionScope;

            if (resolutionScope.type == ResolutionScope.Module || resolutionScope.type == ResolutionScope.AssemblyRef)
            {
                if (resolutionScope.type == ResolutionScope.AssemblyRef)
                    assert(type.cliType == CLIType_Guid);

                return toSimpleFieldDecl(field);
            }

            assert(resolutionScope.type == ResolutionScope.TypeRef);

            foreach (nestedClassRid; maybeNestedClassRids)
            {
                auto typeDef = db.typeDef.getRowByRid(nestedClassRid);
                if (typeDef.typeName == typeRef.typeName)
                {
                    return toStructOrUnionDecl(typeDef, context);
                }
            }

            assert(0);
        }
        else
        {
            assert(0);
        }        
    }

    private bool isConst(FieldRow fieldRow)
    {
        foreach (attrRid; customAttributeResolver.getRids(fieldRow.rid))
        {
            auto attr = db.customAttribute.getRowByRid(attrRid);
            if (attr.type == knownTypes.constAttribute)
                return true;
        }

        return false;
    }

    private constr replaceKeyword(constr name)
    {
        if (auto p = name in keywordsMap)
            return *p;
        return name;
    }
}


private bool isUnion(TypeDefRow row)
{
    return row.flags.explicitLayout;
}
