module reader.codedindex;

public import reader.enum_;

import std.bitmanip;


struct CodedIndex(T)
{
    private
    {
        static if (is(T == TypeDefOrRef) || is(T == HasConstant) || is (T == ResolutionScope))
        {
            enum typeBits = 2;
        }
        else static if (is(T == MemberRefParent) || is(T == CustomAttributeType))
        {
            enum typeBits = 3;
        }
        else static if (is(T == HasCustomAttribute))
        {
            enum typeBits = 5;
        }
        else static assert(0);

        mixin(bitfields!(T, "_type", typeBits,
                         uint, "_index", 32 - typeBits,
                         ));
    }

    uint index()
    {
        return _index;
    }

    T type()
    {
        return cast(T)_type;
    }

    this(uint value)
    {
        __type__index_bf = value;
    }

    this(T t, uint i)
    {
        _type = t;
        _index = i;
    }
}
