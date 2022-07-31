module generator.type;

alias constr = const(char)[];


class CLINamespace
{
    constr namespace;
    uint[] typeDefRids;
}


struct Declaration
{
    // type name or symbol
    constr declaredName;
    constr declString;
    CLIType[] referencedTypes;
}


struct CLIType
{
    constr namespace;
    constr typeName;
    SupportedElementType elementType;
    bool isPremitive;
}


enum SupportedElementType
{
    None,
    Void,
    Boolean,
    Char,
    I1,
    U1,
    I2,
    U2,
    I4,
    U4,
    I8,
    U8,
    R4,
    R8,
    I,
    U,
}


struct GUID
{
    uint Data1;
    ushort Data2;
    ushort Data3;
    ubyte[8] Data4;
}


enum CLIType_Guid = CLIType("System", "Guid", SupportedElementType.None, false);
