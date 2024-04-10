module generator.impl.declarationextractor;

public import generator.interfaces;
public import generator.impl.interfaces;
public import database.database;

import database.schema;
import database.relation.interfaceimplresolver;
import database.relation.constantresolver;
import database.relation.customattributeresolver;

import generator.impl.extractor.constant;
import generator.impl.extractor.function_;
import generator.impl.extractor.guid;
import generator.impl.extractor.struct_;
import generator.impl.helper.clityperesolver;
import generator.impl.helper.knowntypes;
import generator.impl.helper.stringhelper;
import generator.impl.helper.typeconverter;

import std.array, std.algorithm, std.conv, std.format, std.typecons;


class DeclarationExtractor : IDeclarationExtractor
{
    private
    {
        IDatabase db;
        KnownTypes knownTypes;
        CLITypeResolver cliTypeResolver;
        ConstantResolver constantResolver;
        InterfaceImplResolver interfaceImplResolver;

        TypeConverter typeConverter;
        StringHelper helper;

        ConstantExtractor constantExtractor;
        FunctionDeclExtractor functionDeclExtractor;
        GuidExtractor guidExtractor;
        StructDeclExtractor structDeclExtractor;
    }

    this(IDatabase db, IDlangTypeResolver dlangTypeResolver)
    {
        this.db = db;
        this.knownTypes = new KnownTypes(db);
        this.cliTypeResolver = new CLITypeResolver(db.typeRef, db.typeDef);
        this.constantResolver = new ConstantResolver(db.constant, db.field);
        this.interfaceImplResolver = new InterfaceImplResolver(db.interfaceImpl);

        auto customAttributeResolver = new CustomAttributeResolver(db.customAttribute);

        this.typeConverter = new TypeConverter(dlangTypeResolver, cliTypeResolver);
        this.helper = new StringHelper();

        this.constantExtractor = new ConstantExtractor(db, typeConverter, knownTypes, customAttributeResolver);
        this.functionDeclExtractor = new FunctionDeclExtractor(db, typeConverter, knownTypes, customAttributeResolver);
        this.guidExtractor = new GuidExtractor(db, knownTypes, customAttributeResolver);
        this.structDeclExtractor = new StructDeclExtractor(db, typeConverter, knownTypes, customAttributeResolver);
    }

    override Declaration[] extractFromTypeDef(uint typeDefRid)
    {
        Declaration[] decls;

        auto typeDef = db.typeDef.getRowByRid(TypeDefRID(typeDefRid));
        auto name = typeDef.typeName;

        if (typeDef.typeName == "Apis")
        {
            decls ~= extractMethodsFrom(typeDef);
            auto fields = typeDef.fieldList;
            foreach (field; db.field.getRows(fields).array)
            {
                decls ~= extractEnumFrom(field);
            }
        }
        else if (typeDef.flags.interface_)
        {
            decls ~= extractIIDFrom(typeDef);
            decls ~= extractInterfaceFrom(typeDef);
            assert(db.field.getRows(typeDef.fieldList).array.length == 0);
        }
        else if (isEnum(typeDef))
        {
            decls ~= extractEnum(typeDef);
        }
        else if (isAlias(typeDef))
        {
            decls ~= extractAlias(typeDef);
        }
        else if (isFunctionPointer(typeDef))
        {
            decls ~= extractFunctionPointer(typeDef);
            assert(db.field.getRows(typeDef.fieldList).array.length == 0);
        }
        else if (typeDef.flags.class_)
        {
            assert(!isEnum(typeDef));

            decls ~= extractStruct(typeDef);
        }
        else
        {
            assert(0);
        }

        return decls;
    }

    private Declaration[] extractMethodsFrom(TypeDefRow typeDef)
    {
        Declaration[] decls;

        foreach (methodDef; db.methodDef.getRows(typeDef.methodList).array)
        {
            decls ~= functionDeclExtractor.extractFrom(methodDef, methodDef.name);
        }

        return decls;
    }

    private Declaration extractEnumFrom(FieldRow field)
    {
        static string toDlangStringLiteral(string s)
        {
            return s.replace("\\", r"\\").replace("\0", r"\0");
        }

        auto constantRid = constantResolver.getRid(field.rid);
        if (!constantRid.isNull)
        {
            auto constantValue = db.constant.getRowByRid(constantRid).value;
            if (auto p = constantValue.value.peek!float)
                return Declaration(field.name, format("enum %s = %f;", field.name, *p));
            else if (auto p = constantValue.value.peek!double)
                return Declaration(field.name, format("enum %s = %f;", field.name, *p));
            else if (auto p = constantValue.value.peek!string)
                return Declaration(field.name, format(`enum %s = "%s";`, field.name, toDlangStringLiteral(*p)));
            else
            {
                auto bytes = constantValue.integerBytes;

                return Declaration(field.name, format("enum %s = 0x%0" ~ (bytes * 2).to!string ~ "x;", field.name, constantValue.integerValue));
            }
        }

        auto guid = guidExtractor.extractFromGuidAttribute(field.rid);
        if (!guid.isNull)
        {
            return toGUIDDecl(field.name, guid.get);
        }

        auto decl = constantExtractor.extractFromConstantAttribute(field);
        if (!decl.isNull)
            return decl.get;

        assert(0);
    }

    private Declaration extractInterfaceFrom(TypeDefRow typeDef)
    {
        assert(!isEnum(typeDef));
        assert(typeDef.extends.index == 0);

        Declaration interfaceDecl;

        auto name = typeDef.typeName;
        auto rid = typeDef.rid;

        auto interfaces = interfaceImplResolver.getInterfaces(typeDef.rid)
            .map!(typeRefRid => cliTypeResolver.getType(typeRefRid));

        interfaceDecl.referencedTypes ~= interfaces.array;

        auto interfaceNames = interfaces.map!(i => i.typeName).array;

        auto decl = appender!constr;

        if (interfaceNames.empty)
            decl ~= format("interface %s", name);
        else
            decl ~= format("interface %s : %-(%s, %)", name, interfaceNames);

        decl ~= "\n{\n";

        auto indentSpaces = helper.getIndentation(1);
        foreach (methodDef; db.methodDef.getRows(typeDef.methodList).array)
        {
            decl ~= indentSpaces;
            
            auto methodDecl = functionDeclExtractor.extractFrom(methodDef, methodDef.name);
            interfaceDecl.referencedTypes ~= methodDecl.referencedTypes;

            decl ~= methodDecl.declString;
            decl ~= "\n";
        }

        decl ~= "}";

        interfaceDecl.declaredName = name;
        interfaceDecl.declString = decl[];

        return interfaceDecl;
    }

    private Declaration extractIIDFrom(TypeDefRow typeDef)
    {
        auto iidDeclName = "IID_" ~ typeDef.typeName;

        auto guidOrNull = guidExtractor.extractFromGuidAttribute(typeDef.rid);
        if (guidOrNull.isNull)
        {
            return Declaration(iidDeclName, "// [Not Found] " ~ iidDeclName);
        }
        else
        {
            auto guid = guidOrNull.get;
            return toGUIDDecl(iidDeclName, guid);
        }
    }

    private Declaration extractEnum(TypeDefRow typeDef)
    {
        auto fieldList = db.field.getRows(typeDef.fieldList).array;
        assert(fieldList.length != 0);
        import std.algorithm;
        import std.conv;
        auto maxFieldNameLength = fieldList.maxElement!"a.name.length".name.length;

        constr aliasDeclString;
        auto enumDeclString = appender!constr();

        int fieldBytes;
        string enumWriteFormat;
        constr fieldTypeName;
        bool signed;

        foreach (iFieldDef, fieldDef; fieldList)
        {
            auto fieldName = fieldDef.name;

            if (iFieldDef == 0)
            {
                assert(fieldName == "value__");

                auto type = typeConverter.convert(fieldDef.signature.typeSig);
                fieldTypeName = type.dlangType;

                switch (fieldTypeName)
                {
                    case "byte": case "ubyte": fieldBytes = 1; break;
                    case "short": case "ushort": fieldBytes = 2; break;
                    case "int": case "uint": fieldBytes = 4; break;
                    case "long": case "ulong": fieldBytes = 8; break;
                    default: assert(0);
                }

                signed = fieldTypeName[0] != 'u';

                aliasDeclString = format("alias %s = %s;", typeDef.typeName, fieldTypeName);
                enumDeclString ~= format("enum : %s\n", fieldTypeName);
                enumDeclString ~= "{\n";

                enumWriteFormat = "    %-" ~ maxFieldNameLength.to!string ~ "s = %s0x%0" ~ (fieldBytes * 2).to!string ~ "x,";
            }
            else
            {
                auto constantRid = constantResolver.getRid(fieldDef.rid);
                auto constantValue = db.constant.getRowByRid(constantRid).value;
                auto integerValue = constantValue.integerValue;
                auto castString = (signed && fieldBytes <= 2 && integerValue >= 2 ^^ (fieldBytes * 8 - 1)) ? format("cast(%s)", fieldTypeName) : "";

                string decl;
                switch (fieldBytes)
                {
                    case 1: decl = format(enumWriteFormat, fieldName, castString, cast(ubyte)integerValue); break;
                    case 2: decl = format(enumWriteFormat, fieldName, castString, cast(ushort)integerValue); break;
                    case 4: decl = format(enumWriteFormat, fieldName, castString, cast(uint)integerValue); break;
                    case 8: decl = format(enumWriteFormat, fieldName, castString, cast(ulong)integerValue); break;
                    default: assert(0);
                }
                enumDeclString ~= decl ~ "\n";
            }
        }

        enumDeclString ~= "}\n";

        Declaration decl;
        decl.declaredName = typeDef.typeName;

        assert(fieldList.length > 0);
        if (fieldList.length == 1)
        {
            decl.declString = aliasDeclString;
        }
        else
        {
            decl.declString = aliasDeclString ~ "\n" ~ enumDeclString[];
        }

        return decl;
    }

    private Declaration extractAlias(TypeDefRow typeDef)
    {
        auto fieldList = db.field.getRows(typeDef.fieldList).array;
        assert(fieldList.length == 1);
        auto fieldDef = fieldList[0];

        auto type = typeConverter.convert(fieldDef.signature.typeSig);
        return Declaration(typeDef.typeName, format("alias %s = %s;", typeDef.typeName, type.dlangType));
    }

    private Declaration extractFunctionPointer(TypeDefRow typeDef)
    {
        assert(db.field.getRows(typeDef.fieldList).array.empty);

        auto methodList = db.methodDef.getRows(typeDef.methodList).array;

        assert(methodList.length == 2);
        assert(methodList[0].name == ".ctor");
        assert(methodList[1].name == "Invoke");

        auto decl = functionDeclExtractor.extractFrom(methodList[1], "function");

        return Declaration(typeDef.typeName, format("alias %s = %s", typeDef.typeName, decl.declString), decl.referencedTypes);
    }

    private Declaration[] extractStruct(TypeDefRow typeDef)
    {
        Declaration[] decls;

        auto guidOrNull = guidExtractor.extractFromGuidAttribute(typeDef.rid);
        if (!guidOrNull.isNull)
        {
            auto guid = guidOrNull.get;
            decls ~= toGUIDDecl("CLSID_" ~ typeDef.typeName, guid);
        }

        decls ~= structDeclExtractor.extractFrom(typeDef);

        return decls;
    }

    private Declaration toGUIDDecl(constr declaredName, GUID guid)
    {
        static string toGUIDRvalueString(GUID guid)
        {
            return format("GUID(0x%0x, 0x%0x, 0x%0x, [%-(0x%0x, %)])", guid.Data1, guid.Data2, guid.Data3, guid.Data4);
        }

        return Declaration(declaredName, format("enum %s = %s;", declaredName, toGUIDRvalueString(guid)), [ CLIType_Guid ]);
    }

    private bool isEnum(TypeDefRow row)
    {
        return row.extends == knownTypes.systemEnum;
    }

    private bool isFunctionPointer(TypeDefRow row)
    {
        return row.extends == knownTypes.systemMulticastDelegate;
    }

    private bool isAlias(TypeDefRow row)
    {
        auto fields = db.field.getRows(row.fieldList()).array;

        if (fields.length != 1)
            return false;

        auto field = fields[0];

        return field.name == "Value" && !field.signature.typeSig.isArray;
    }
}
