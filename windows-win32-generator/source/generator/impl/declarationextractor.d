module generator.impl.declarationextractor;

public import generator.interfaces;
public import generator.impl.interfaces;
import generator.resolver.classlayoutresolver;
import generator.resolver.clityperesolver;
import generator.resolver.customattributeresolver;
import generator.resolver.constantfieldresolver;
import generator.resolver.interfaceresolver;
import generator.resolver.nestedclassresolver;

public import reader.database;
import reader.schema;

import std.array, std.algorithm, std.conv, std.format, std.typecons;


class DeclarationExtractor : IDeclarationExtractor
{
    private
    {
        Database db;
        CLITypeResolver cliTypeResolver;
        CustomAttributeResolver customAttributeResolver;
        ConstantFieldResolver constantFieldResolver;
        InterfaceResolver interfaceResolver;
        NestedClassResolver nestedClassResolver;
        ClassLayoutResolver classLayoutResolver;
        IDlangTypeResolver dlangTypeResolver;

        Indentation indent;

        bool printRid = false;
    }

    this(Database db,
         IDlangTypeResolver dlangTypeResolver)
    {
        this.db = db;
        this.cliTypeResolver = new CLITypeResolver(db);
        this.constantFieldResolver = new ConstantFieldResolver(db);
        this.customAttributeResolver = new CustomAttributeResolver(db);
        this.interfaceResolver = new InterfaceResolver(db);
        this.nestedClassResolver = new NestedClassResolver(db);
        this.classLayoutResolver = new ClassLayoutResolver(db);
        this.dlangTypeResolver = dlangTypeResolver;

        this.indent = Indentation(4);
    }

    private constr toRidCommentString(Database.TableFormat t)(Row!t row)
    {
        if (!printRid)
            return "";

        static if (t == Database.TableFormat.TypeDef)
            return format(" // TypeDef RID:%d", row.rid);
        else static if (t == Database.TableFormat.Field)
            return format(" // Field RID:%d", row.rid);
        else
            assert(0);
    }

    override Declaration[] extractFromTypeDef(uint typeDefRid)
    {
        Declaration[] decls;

        auto typeDef = db.TypeDef.getRowByRid(typeDefRid);
        auto name = typeDef.typeName;

        if (typeDef.typeName == "Apis")
        {
            decls ~= extractMethodsFrom(typeDef);
            auto fields = typeDef.fieldList;
            foreach (field; fields)
            {
                auto extracted = extractEnumFrom(field);
                if (!extracted.isNull)
                    decls ~= extracted.get;
            }
        }
        else if (typeDef.flags.interface_)
        {
            decls ~= extractInterfaceAndIIDFrom(typeDef);
            assert(typeDef.fieldList.length == 0);
        }
        else if (typeDef.isEnum)
        {
            decls ~= extractEnum(typeDef);
        }
        else if (typeDef.isAlias)
        {
            decls ~= extractAlias(typeDef);
        }
        else if (typeDef.isFunctionPointer)
        {
            decls ~= extractFunctionPointer(typeDef);
            assert(typeDef.fieldList.length == 0);
        }
        else if (typeDef.flags.class_)
        {
            assert(!typeDef.isEnum);

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

        foreach (methodDef; typeDef.methodList)
        {
            auto decl = toFunctionDecl(methodDef, methodDef.name);
            decl.declString = format("%s;", decl.declString) ~ toRidCommentString(typeDef);
            decls ~= decl;
        }

        return decls;
    }

    private Declaration toFunctionDecl(MethodDefRow methodDef, constr functionName)
    {
        Declaration decl;

        MethodDefSig sig = methodDef.signature;

        constr retTypeName;
        auto type = sig.retTypeSig.typeSig;
        if (type.isNull)
            retTypeName = "void";
        else
        {
            auto vt = type.get.valueType;
            auto ptrs = type.get.ptrCount;
            auto cliType = cliTypeResolver.getType(vt);
            retTypeName = dlangTypeResolver.toDlangType(cliType) ~ (ptrs ? getPointerString(ptrs) : "");
            if (!cliType.namespace.empty)
                decl.referencedTypes ~= cliType;
        }

        auto params = methodDef.paramList;
        if (params.length == sig.paramSigs.length + 1)
            params = params[1..$];
        else
            assert(params.length == sig.paramSigs.length);

        assert(params.length == sig.paramSigs.length);
        constr[] paramNames;
        paramNames.length = sig.paramSigs.length;
        foreach (pi, p; sig.paramSigs)
        {
            auto vt = p.typeSig.valueType;
            auto ptrs = p.typeSig.ptrCount;
            auto cliType = cliTypeResolver.getType(vt);
            auto paramString = dlangTypeResolver.toDlangType(cliType, isConst(params[pi]));
            paramNames[pi] = paramString ~ (ptrs ? getPointerString(ptrs) : "");
            if (!cliType.namespace.empty)
                decl.referencedTypes ~= cliType;
        }

        decl.declaredName = functionName;
        decl.declString = format("%s %s(%-(%s, %))", retTypeName, functionName, paramNames);

        return decl;
    }

    private string pointerString = "***";

    private constr getPointerString(uint n)
    {
        assert(n <= pointerString.length);
        return pointerString[0..n];
    }

    private bool isConst(ParamRow paramRow)
    {
        foreach (attrRid; customAttributeResolver.getRidsForParam(paramRow.rid))
        {
            auto attr = db.CustomAttribute.getRowByRid(attrRid);
            if (attr.typeName == "ConstAttribute")
                return true;
        }

        return false;
    }

    private Nullable!Declaration extractEnumFrom(FieldRow field)
    {
        Nullable!Declaration ret;

        auto et = field.signature.typeSig.elementType;

        auto v = constantFieldResolver.getConstantValue(field.rid);
        if (v.isNull)
        {
            assert(!(ElementType.I1 <= et && et <= ElementType.U8));
            auto guidOrNull = extractGuidFromField(field.rid);
            if (guidOrNull.isNull)
                ret = Declaration(field.name, format("//enum %s = [MISSING];", field.name));
            else
                ret = toGUIDDecl(field.name, guidOrNull.get);
        }
        else
        {
            auto constantValue = v.get;
            if (auto p = constantValue.value.peek!float)
                ret = Declaration(field.name, format("enum %s = %f;", field.name, *p));
            else if (auto p = constantValue.value.peek!double)
                ret = Declaration(field.name, format("enum %s = %f;", field.name, *p));
            else if (auto p = constantValue.value.peek!string)
                ret = Declaration(field.name, format(`enum %s = "%s";`, field.name, toDlangStringLiteral(*p)));
            else
            {
                assert((ElementType.I1 <= et && et <= ElementType.U8) || et == ElementType.ValueType);
                auto bytes = constantValue.integerBytes;

                ret = Declaration(field.name, format("enum %s = 0x%0" ~ (bytes * 2).to!string ~ "x;", field.name, constantValue.integerValue));
            }
        }

        return ret;
    }

    private string toDlangStringLiteral(string s)
    {
        return s.replace("\\", r"\\").replace("\0", r"\0");
    }

    private Declaration[] extractInterfaceAndIIDFrom(TypeDefRow typeDef)
    {
        assert(!typeDef.isEnum);
        assert(typeDef.extends.index == 0);

        Declaration[] decls;

        // interface

        Declaration interfaceDecl;

        auto name = typeDef.typeName;
        auto rid = typeDef.rid;

        auto interfaces = interfaceResolver.getInterfaces(typeDef.rid)
            .map!(codedIndex => cliTypeResolver.getType(codedIndex));

        interfaceDecl.referencedTypes ~= interfaces.array;

        auto interfaceNames = interfaces.map!(i => i.typeName).array;

        auto decl = appender!constr;

        if (interfaceNames.empty)
            decl ~= format("interface %s", name) ~ toRidCommentString(typeDef);
        else
            decl ~= format("interface %s : %-(%s, %)", name, interfaceNames) ~ toRidCommentString(typeDef);

        decl ~= "\n{\n";

        auto indentSpaces = indent.getAsString(1);
        foreach (methodDef; typeDef.methodList)
        {
            decl ~= indentSpaces;
            
            auto methodDecl = toFunctionDecl(methodDef, methodDef.name);
            interfaceDecl.referencedTypes ~= methodDecl.referencedTypes;

            decl ~= methodDecl.declString;
            decl ~= ";" ~ toRidCommentString(typeDef);
            decl ~= "\n";
        }

        decl ~= "}";

        interfaceDecl.declaredName = name;
        interfaceDecl.declString = decl[];

        // IID

        Declaration iidDecl;

        auto iidDeclName = "IID_" ~ name;

        auto guidOrNull = extractGuidFromTypeDef(rid);
        if (guidOrNull.isNull)
        {
            iidDecl = Declaration(iidDeclName, "// [Not Found] " ~ iidDeclName);
        }
        else
        {
            auto guid = guidOrNull.get;
            iidDecl = toGUIDDecl(iidDeclName, guid);
        }

        decls ~= iidDecl;
        decls ~= interfaceDecl;

        return decls;
    }

    private Declaration toGUIDDecl(constr declaredName, GUID guid)
    {
        return Declaration(declaredName, format("enum %s = %s;", declaredName, toGUIDRvalueString(guid)), [ CLIType_Guid ]);
    }

    private string toGUIDRvalueString(GUID guid)
    {
        return format("GUID(0x%0x, 0x%0x, 0x%0x, [%-(0x%0x, %)])", guid.Data1, guid.Data2, guid.Data3, guid.Data4);
    }

    private Nullable!GUID extractGuidFromTypeDef(uint rid)
    {
        return extractFromGuidAttribute(customAttributeResolver.getRidsForTypeDef(rid));
    }

    private Nullable!GUID extractGuidFromField(uint rid)
    {
        return extractFromGuidAttribute(customAttributeResolver.getRidsForField(rid));
    }

    private Nullable!GUID extractFromGuidAttribute(const(uint)[] customAttributeRids)
    {
        Nullable!GUID guid;

        foreach (customAttributeRid; customAttributeRids)
        {
            auto customAttribute = db.CustomAttribute.getRowByRid(customAttributeRid);
            auto n = customAttribute.typeName;
            if (n == "GuidAttribute")
            {
                auto value = customAttribute.value;

                // parse Guid
                auto ctor = customAttribute.getConstructor();
                auto ctorSig = ctor.signatureAsMethodDef;
                assert(ctorSig.paramSigs.length == 11);

                if (value.length == 20)
                {
                    // Prolog
                    assert(value[0..2] == [0x01, 0x0]);
                    value = value[2..$];

                    uint data1 = *(cast(uint*)(value.ptr));
                    ushort data2 = *(cast(ushort*)(value.ptr + GUID.Data2.offsetof));
                    ushort data3 = *(cast(ushort*)(value.ptr + GUID.Data3.offsetof));
                    ubyte[8] data4 = value[GUID.Data4.offsetof..GUID.sizeof].dup;

                    guid = GUID(data1, data2, data3, data4);
                    return guid;
                }
                else
                {
                    assert(0);
                }
            }
        }

        return guid;
    }

    private Declaration extractEnum(TypeDefRow typeDef)
    {
        auto fieldList = typeDef.fieldList;
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

                auto sig = fieldDef.signature;
                fieldTypeName = dlangTypeResolver.toDlangType(cliTypeResolver.getType(sig.typeSig.valueType));

                switch (fieldTypeName)
                {
                    case "byte": case "ubyte": fieldBytes = 1; break;
                    case "short": case "ushort": fieldBytes = 2; break;
                    case "int": case "uint": fieldBytes = 4; break;
                    case "long": case "ulong": fieldBytes = 8; break;
                    default: assert(0);
                }

                signed = fieldTypeName[0] != 'u';

                aliasDeclString = format("alias %s = %s;", typeDef.typeName, fieldTypeName) ~ toRidCommentString(typeDef);
                enumDeclString ~= format("enum : %s\n", fieldTypeName);
                enumDeclString ~= "{\n";

                enumWriteFormat = "    %-" ~ maxFieldNameLength.to!string ~ "s = %s0x%0" ~ (fieldBytes * 2).to!string ~ "x,";
            }
            else
            {
                auto constantValue = constantFieldResolver.getConstantValue(fieldDef.rid).get;
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
                enumDeclString ~= decl ~ toRidCommentString(fieldDef) ~ "\n";
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
        auto fieldList = typeDef.fieldList;
        assert(fieldList.length == 1);
        auto fieldDef = fieldList[0];
        auto typeSig = fieldDef.signature.typeSig;
        auto ptr = typeSig.ptrCount;
        auto fieldTypeName = dlangTypeResolver.toDlangType(cliTypeResolver.getType(typeSig.valueType));
        return Declaration(typeDef.typeName, format("alias %s = %s%s;", typeDef.typeName, fieldTypeName, getPointerString(ptr)) ~ toRidCommentString(typeDef) ~ toRidCommentString(fieldDef));
    }

    private Declaration extractFunctionPointer(TypeDefRow typeDef)
    {
        assert(typeDef.fieldList.empty);

        auto methodList = typeDef.methodList;

        assert(methodList.length == 2);
        assert(methodList[0].name == ".ctor");
        assert(methodList[1].name == "Invoke");

        auto decl = toFunctionDecl(methodList[1], "function");

        return Declaration(typeDef.typeName, format("alias %s = %s;", typeDef.typeName, decl.declString) ~ toRidCommentString(typeDef), decl.referencedTypes);
    }


    private struct ExtractStructContext
    {
        int indentLevel;
        int nBitfields;
    }

    private Declaration[] extractStruct(TypeDefRow typeDef)
    {
        ExtractStructContext context;

        Declaration[] decls;

        auto guidOrNull = extractGuidFromTypeDef(typeDef.rid);
        if (!guidOrNull.isNull)
        {
            auto guid = guidOrNull.get;
            decls ~= toGUIDDecl("CLSID_" ~ typeDef.typeName, guid);
        }

        decls ~= toStructOrUnionDecl(typeDef, &context);

        return decls;
    }

    private Declaration toStructOrUnionDecl(TypeDefRow typeDef, ExtractStructContext* context)
    {
        {
            auto superTypeCodedIndex = typeDef.extends;
            assert(superTypeCodedIndex.index != 0);
            auto superTypeName = dlangTypeResolver.toDlangType(cliTypeResolver.getType(superTypeCodedIndex));
            assert(superTypeName == "ValueType");
        }

        Declaration decl;

        auto declString = appender!string();
        auto indentString = indent.getAsString(context.indentLevel);

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
            declString ~= dlangTypeResolver.toDlangType(cliTypeResolver.getType(typeDef));
        }

        declString ~= toRidCommentString(typeDef);
        declString ~= "\n";
        declString ~= indentString;
        declString ~= "{\n";

        context.indentLevel++;

        Nullable!uint classLayoutRid = classLayoutResolver.getClassLayoutRid(typeDef.rid);
        if (!classLayoutRid.isNull)
        {
            declString ~= indent.getAsString(context.indentLevel);
            auto classLayout = db.ClassLayout.getRowByRid(classLayoutRid.get);
            declString ~= format("align (%d):\n", classLayout.packingSize);
        }

        foreach (field; typeDef.fieldList)
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

    private Declaration toFieldDecl(FieldRow field, uint[] maybeNestedClassRids, ExtractStructContext* context)
    {
        auto indentString = indent.getAsString(context.indentLevel);

        auto toSimpleFieldDecl(CLIType typeName, constr fieldNameString, uint ptrs, Nullable!uint arraySize, FieldRow field)
        {
            auto fieldRid = field.rid;
            string[string] keywordsMap =
            [
                "version": "version_",
                "module": "module_",
                "alias": "alias_",
                "align": "align_",
                "function": "function_",
                "scope": "scope_",
            ];

            auto fieldTypeString = typeName.typeName;

            if (auto p = fieldNameString in keywordsMap)
                fieldNameString = keywordsMap[fieldNameString];

            if (fieldNameString == "_bitfield")
            {
                fieldNameString ~= context.nBitfields.to!constr;
                context.nBitfields++;
            }

            auto dlangTypeName = dlangTypeResolver.toDlangType(typeName, isConst(field));

            string arrayString;
            if (!arraySize.isNull)
                arrayString = format("[%d]", arraySize.get);

            if (dlangTypeName == fieldNameString)
                fieldNameString ~= "_";

            return format("%s%s%s%s %s;", indentString, dlangTypeName, getPointerString(ptrs), arrayString, fieldNameString) ~ toRidCommentString(field);
        }

        auto typeSig = field.signature.typeSig;
        auto vt = typeSig.valueType;
        auto ptr = typeSig.ptrCount;
        Nullable!uint arraySize;
        if (typeSig.isArray)
        {
            assert(typeSig.arrayRank == 1);
            arraySize = typeSig.arraySizes[0];
        }

        auto fieldType = cliTypeResolver.getType(vt);
        auto fieldName = field.name;

        if (fieldType.isPremitive)
        {
            return Declaration(fieldName, toSimpleFieldDecl(fieldType, fieldName, ptr, arraySize, field));
        }

        auto fieldTypeCodedIndex = vt.tryMatch!((CodedIndex!TypeDefOrRef ci) => ci);

        if (fieldTypeCodedIndex.type == TypeDefOrRef.TypeDef)
        {
            return Declaration(fieldName, toSimpleFieldDecl(fieldType, fieldName, ptr, arraySize, field), [ fieldType ]);
        }
        else if (fieldTypeCodedIndex.type == TypeDefOrRef.TypeRef)
        {
            auto typeRef = db.TypeRef.getRowByRid(fieldTypeCodedIndex.index);
            auto resolutionScope = typeRef.resolutionScope;

            if (resolutionScope.type == ResolutionScope.Module || resolutionScope.type == ResolutionScope.AssemblyRef)
            {
                if (resolutionScope.type == ResolutionScope.AssemblyRef)
                    assert(fieldType == CLIType_Guid);

                return Declaration(fieldName, toSimpleFieldDecl(fieldType, fieldName, ptr, arraySize, field), [ fieldType ]);
            }

            assert(resolutionScope.type == ResolutionScope.TypeRef);

            foreach (nestedClassRid; maybeNestedClassRids)
            {
                auto typeDef = db.TypeDef.getRowByRid(nestedClassRid);
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
        foreach (attrRid; customAttributeResolver.getRidsForField(fieldRow.rid))
        {
            auto attr = db.CustomAttribute.getRowByRid(attrRid);
            if (attr.typeName == "ConstAttribute")
                return true;
        }

        return false;
    }
}

private struct Indentation
{
    const char[20] spaces;
    int nSpaces;

    @disable
    this();

    this(int nSpaces)
    {
        spaces[] = ' ';
    }

    constr getAsString(int level) return
    {
        assert(level * 4 <= spaces.length);
        return spaces[0..level*4];
    }
}
