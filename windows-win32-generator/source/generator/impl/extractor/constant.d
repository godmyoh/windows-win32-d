module generator.impl.extractor.constant;

import database.database;
import database.schema;
import database.relation.customattributeresolver;
import generator.impl.helper.knowntypes;
import generator.impl.helper.typeconverter;

import std.algorithm, std.array, std.format, std.typecons;


class ConstantExtractor
{
    private
    {
        IDatabase db;
        TypeConverter typeConverter;
        const(KnownTypes) knownTypes;
        const(CustomAttributeResolver) customAttributeResolver;
    }

    this(IDatabase db, TypeConverter typeConverter, const(KnownTypes) knownTypes, const(CustomAttributeResolver) customAttributeResolver)
    {
        this.db = db;
        this.typeConverter = typeConverter;
        this.knownTypes = knownTypes;
        this.customAttributeResolver = customAttributeResolver;
    }

    Nullable!Declaration extractFromConstantAttribute(FieldRow field)
    {
        Nullable!Declaration ret;

        auto str = extractConstantValueString(customAttributeResolver.getRids(field.rid));

        if (!str.isNull)
        {
            {
                auto ci = field.signature.typeSig.valueType.match!((ElementType et) => assert(0), (CodedIndex!TypeDefOrRef ci) => ci);
                assert(ci.type == TypeDefOrRef.TypeRef);
            }

            auto type = typeConverter.convert(field.signature.typeSig);
            ret = toEnumWithStructLiteralDecl(field.name, type.dlangType, type.cliType, str.get);
        }

        return ret;
    }

    /*
    II.23.3 Custom attributes

    ...

    If the parameter kind is System.Type, (also, the middle line in above diagram) its
    value is stored as a SerString (as defined in the previous paragraph), representing its
    canonical name.

    ...
    */
    private Nullable!constr extractConstantValueString(const(CustomAttributeRID)[] customAttributeRids)
    {
        Nullable!constr ret;

        foreach (customAttributeRid; customAttributeRids)
        {
            auto customAttribute = db.customAttribute.getRowByRid(customAttributeRid);
            if (customAttribute.type == knownTypes.constantAttribute)
            {
                auto blob = customAttribute.value;

                assert(blob[0..2] == [1, 0]);
                assert(blob[$-2..$] == [0, 0]);

                auto fixedArgData = blob[2..$-2];

                auto packedLen = fixedArgData[0];
                auto utf8Characters = fixedArgData[1..$];

                assert(utf8Characters.length == packedLen);

                ret = cast(constr)utf8Characters;

                return ret;
            }
        }

        return ret;
    }

    private Declaration toEnumWithStructLiteralDecl(constr declName, constr dlangType, CLIType cliType, constr serString)
    {
        auto tokens = serString.replace("{", "").replace("}", "").split(",").map!(a=>a.strip(' ')).array;

        if (cliType.typeName == "DEVPROPKEY" || cliType.typeName == "PROPERTYKEY" )
        {
            assert(tokens.length == 12);
            return Declaration(declName,
                               format("enum %s = %s(GUID(%s, %s, %s, [%-(%s, %)]), %s);",
                                      declName,
                                      dlangType,
                                      tokens[0], tokens[1], tokens[2], tokens[3..11],
                                      tokens[11]),
                               [cliType, CLIType_Guid]);
        }
        else if (cliType.typeName == "SID_IDENTIFIER_AUTHORITY")
        {
            assert(tokens.length == 6);
            return Declaration(declName,
                               format("enum %s = %s([%-(%s, %)]);",
                                      declName,
                                      dlangType,
                                      tokens));
        }
        else if (cliType.typeName == "CONDITION_VARIABLE" || cliType.typeName == "SRWLOCK" || cliType.typeName == "INIT_ONCE")
        {
            assert(tokens.length == 1);
            assert(tokens[0] == "0");
            return Declaration(declName,
                               format("enum %s = %s(null);",
                                      declName,
                                      dlangType));
        }
        else
            assert(0, cliType.typeName);
    }
}
