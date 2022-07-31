module reader.helper.integer;


ulong parseInteger(const(ubyte)[] bytes)
{
    if (bytes.length == 1)
    {
        return *cast(ubyte*)bytes.ptr;
    }
    else if (bytes.length == 2)
    {
        return *cast(ushort*)bytes.ptr;
    }
    else if (bytes.length == 4)
    {
        return *cast(uint*)bytes.ptr;
    }
    else if (bytes.length == 8)
    {
        return *cast(ulong*)bytes.ptr;
    }
    else
    {
        assert(0);
    }
}
