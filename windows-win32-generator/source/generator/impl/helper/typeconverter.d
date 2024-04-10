module generator.impl.helper.typeconverter;

public import generator.type;
public import generator.impl.interfaces;
public import database.type.valuetype;
public import database.type.signature;
public import database.schema;

import generator.impl.helper.clityperesolver;

import std.format;


struct ConvertedType
{
    constr dlangType;
    constr dlangTypeUnqual;
    CLIType cliType;
    int ptrCount;
}


class TypeConverter
{
    private
    {
        IDlangTypeResolver dlangTypeResolver;
        CLITypeResolver cliTypeResolver;
        string pointerString = "***";
    }

    this(IDlangTypeResolver dlangTypeResolver, CLITypeResolver cliTypeResolver)
    {
        this.dlangTypeResolver = dlangTypeResolver;
        this.cliTypeResolver = cliTypeResolver;
    }

    ConvertedType convert(TypeDefRow typeDef)
    {
        auto cliType = cliTypeResolver.getType(typeDef);
        auto dlangTypeName = dlangTypeResolver.toDlangType(cliType);

        return ConvertedType(dlangTypeName, dlangTypeName, cliType, 0);
    }

    ConvertedType convert(TypeSig typeSig, bool withConst = false)
    {
        auto ptrs = typeSig.ptrCount;

        string arrayString = "";
        int arraySize = -1;
        if (typeSig.isArray)
        {
            assert(typeSig.arrayRank == 1);
            arrayString = format("[%d]", typeSig.arraySizes[0]);
        }

        auto cliType = cliTypeResolver.getType(typeSig.valueType);
        auto dlangTypeName = dlangTypeResolver.toDlangType(cliType, withConst) ~ getPointerString(ptrs) ~ arrayString;

        return ConvertedType(dlangTypeName, dlangTypeResolver.toDlangType(cliType, false), cliType, ptrs);
    }

    private constr getPointerString(uint n)
    {
        assert(n <= pointerString.length);
        return pointerString[0..n];
    }
}
