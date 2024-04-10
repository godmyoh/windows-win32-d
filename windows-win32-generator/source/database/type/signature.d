module database.type.signature;

public import database.type.codedindex;
public import database.type.enum_;
public import database.type.valuetype;

import std.typecons;


struct TypeSig
{
    private bool isSzArray;
    bool isArray;
    int ptrCount;
    private CustomModSig[] cmods;
    ElementType elementType;
    ValueType valueType;
    uint arrayRank;
    uint[] arraySizes;

    this(ref const(ubyte)[] view)
    {
        isSzArray = parseSzarray(view);
        assert(isSzArray == false);
        isArray = parseArray(view);
        ptrCount = parsePtr(view);
        cmods = parseCmods(view);
        elementType = parseElementType(view);
        valueType = parseType(view);
        if (isArray)
        {
            auto sizes = parseArraySizes(view);
            arrayRank = sizes[0];
            arraySizes = sizes[1];
        }
    }

    private static bool parseSzarray(ref const(ubyte)[] view)
    {
        auto cursor = view;
        if (parseEnum!ElementType(cursor) == ElementType.SZArray)
        {
            view = cursor;
            return true;
        }
        return false;
    }

    private static bool parseArray(ref const(ubyte)[] view)
    {
        auto cursor = view;
        if (parseEnum!ElementType(cursor) == ElementType.Array)
        {
            view = cursor;
            return true;
        }
        return false;
    }

    private static int parsePtr(ref const(ubyte)[] view)
    {
        auto cursor = view;
        int result = 0;
        while(parseEnum!ElementType(cursor) == ElementType.Ptr)
        {
            ++result;
            view = cursor;
        }
        return result;
    }

    private static ElementType parseElementType(ref const(ubyte)[] view)
    {
        auto cursor = view;
        return parseEnum!ElementType(cursor);
    }

    private static Tuple!(uint, uint[]) parseArraySizes(ref const(ubyte)[] view)
    {
        uint rank = parseUnsigned(view);
        uint numSizes = parseUnsigned(view);
        uint[] sizes;
        sizes.length = numSizes;
        for (uint i = 0; i < numSizes; ++i)
        {
            auto size = parseUnsigned(view);
            sizes[i] = size;
        }
        Tuple!(uint, uint[]) ret;
        ret[0] = rank;
        ret[1] = sizes;
        return ret;
    }
}


struct ParamSig
{
    private CustomModSig[] cmods;
    private bool byRef;
    TypeSig typeSig;

    this(ref const(ubyte)[] view)
    {
        cmods = parseCmods(view);
        byRef = parseByRef(view);
        typeSig = TypeSig(view);
    }
}


struct RetTypeSig
{
    private CustomModSig[] cmods;
    private bool byRef;
    Nullable!TypeSig typeSig;

    this(ref const(ubyte)[] view)
    {
        cmods = parseCmods(view);
        byRef = parseByRef(view);
        auto cursor = view;
        auto elementType = parseEnum!ElementType(cursor);
        if (elementType == ElementType.Void)
        {
            view = cursor;
        }
        else
        {
            typeSig = TypeSig(view);
        }
    }
}


struct MethodDefSig
{
    private CallingConvention callingConvention;
    private uint genericParamCount;
    private uint paramCount;
    RetTypeSig retTypeSig;
    ParamSig[] paramSigs;

    this(ref const(ubyte)[] view)
    {
        callingConvention = parseEnum!CallingConvention(view);
        genericParamCount = (callingConvention & CallingConvention.Generic) ? parseUnsigned(view) : 0;
        paramCount = parseUnsigned(view);
        retTypeSig = RetTypeSig(view);
        assert(paramCount <= view.length, "Invalid blob array size");
        paramSigs.length = paramCount;
        for (int i = 0; i < paramCount; ++i)
        {
            paramSigs[i] = ParamSig(view);
        }
    }
}


struct FieldSig
{
    private CallingConvention callingConvention;
    private CustomModSig[] cmods;
    TypeSig typeSig;

    this(ref const(ubyte)[] view)
    {
        callingConvention = parseEnum!CallingConvention(view);
        assert((callingConvention & CallingConvention.Field) == CallingConvention.Field);
        cmods = parseCmods(view);
        typeSig = TypeSig(view);
    }
}


private struct CustomModSig
{
    ElementType cmods;
    CodedIndex!TypeDefOrRef type;

    this(ref const(ubyte)[] view)
    {
        cmods = parseEnum!ElementType(view);
        type = CodedIndex!TypeDefOrRef(parseUnsigned(view));
    }
}


private ValueType parseType(ref const(ubyte)[] view)
{
    ValueType ret;
    auto elementType = parseEnum!ElementType(view);
    switch (elementType)
    {
        case ElementType.Boolean:
        case ElementType.Char:
        case ElementType.I1:
        case ElementType.U1:
        case ElementType.I2:
        case ElementType.U2:
        case ElementType.I4:
        case ElementType.U4:
        case ElementType.I8:
        case ElementType.U8:
        case ElementType.R4:
        case ElementType.R8:
        case ElementType.String:
        case ElementType.Object:
        case ElementType.U:
        case ElementType.I:
        case ElementType.Void:
            ret = elementType;
            return ret;

        case ElementType.Class:
        case ElementType.ValueType:
            ret = CodedIndex!TypeDefOrRef(parseUnsigned(view));
            return ret;

        case ElementType.GenericInst:
        case ElementType.Var:
        case ElementType.MVar:
            assert(0);

        default:
            assert(0, "Unrecognized ELEMENT_TYPE encountered");
    }
}


private uint parseUnsigned(ref const(ubyte)[] view)
{
    auto data = view.ptr;
    uint value;
    uint length;
    if ((*data & 0x80) == 0x00)
    {
        length = 1;
        value = *data;
    }
    else if ((*data & 0xc0) == 0x80)
    {
        length = 2;
        value = (*data++ & 0x3f) << 8;
        value |= *data;
    }
    else if ((*data & 0xe0) == 0xc0)
    {
        length = 4;
        value = (*data++ & 0x1f) << 24;
        value |= *data++ << 16;
        value |= *data++ << 8;
        value |= *data;
    }
    else
    {
        assert(0, "Invalid compressed integer in blob");
    }
    view = view[length..$];
    return value;
}


private T parseEnum(T)(ref const(ubyte)[] view)
if (is(T == enum))
{
    return cast(T)parseUnsigned(view);
}


private CustomModSig[] parseCmods(ref const(ubyte)[] view)
{
    CustomModSig[] result;

    auto cursor = view;

    while (true)
    {
        auto elementType = parseEnum!ElementType(cursor);

        if (elementType != ElementType.CModOpt && elementType != ElementType.CModReqd)
            break;

        auto cmod = CustomModSig(view);
        result ~= cmod;

        cursor = view;
    }

    return result;
}


private bool parseByRef(ref const(ubyte)[] view)
{
    auto cursor = view;
    auto elementType = parseEnum!ElementType(cursor);
    if (elementType == ElementType.ByRef)
    {
        view = cursor;
        return true;
    }
    else
    {
        assert(elementType != ElementType.TypedByRef);
        return false;
    }
}
