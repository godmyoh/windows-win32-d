module generator.impl.extractor.function_;

import database.database;
import database.schema;
import database.relation.customattributeresolver;
import database.type.signature;
import generator.type;
import generator.impl.helper.stringhelper;
import generator.impl.helper.knowntypes;
import generator.impl.helper.typeconverter;

import std.array, std.string;


class FunctionDeclExtractor
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

    Declaration extractFrom(MethodDefRow methodDef, constr functionName)
    {
        Declaration decl;

        MethodDefSig sig = methodDef.signature;

        constr retTypeName;
        auto typeSig = sig.retTypeSig.typeSig;
        if (typeSig.isNull)
            retTypeName = "void";
        else
        {
            auto type = typeConverter.convert(typeSig.get);
            retTypeName = type.dlangType;
            if (!type.cliType.namespace.empty)
                decl.referencedTypes ~= type.cliType;
        }

        auto params = db.param.getRows(methodDef.paramList).array;
        if (params.length == sig.paramSigs.length + 1)
            params = params[1..$];
        else
            assert(params.length == sig.paramSigs.length);

        assert(params.length == sig.paramSigs.length);
        constr[] paramNames;
        paramNames.length = sig.paramSigs.length;
        foreach (pi, p; sig.paramSigs)
        {
            auto type = typeConverter.convert(p.typeSig, isConst(params[pi]));
            paramNames[pi] = type.dlangType;
            if (!type.cliType.namespace.empty)
                decl.referencedTypes ~= type.cliType;
        }

        decl.declaredName = functionName;
        decl.declString = format("%s %s(%-(%s, %));", retTypeName, functionName, paramNames);

        return decl;
    }

    private bool isConst(ParamRow paramRow)
    {
        foreach (attrRid; customAttributeResolver.getRids(paramRow.rid))
        {
            auto attr = db.customAttribute.getRowByRid(attrRid);
            if (attr.type == knownTypes.constAttribute)
                return true;
        }

        return false;
    }
}
