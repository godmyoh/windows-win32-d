module windows.win32.system.search.common;


version (Windows):
extern (Windows):

alias CONDITION_TYPE = int;
enum : int
{
    CT_AND_CONDITION  = 0x00000000,
    CT_OR_CONDITION   = 0x00000001,
    CT_NOT_CONDITION  = 0x00000002,
    CT_LEAF_CONDITION = 0x00000003,
}

alias CONDITION_OPERATION = int;
enum : int
{
    COP_IMPLICIT             = 0x00000000,
    COP_EQUAL                = 0x00000001,
    COP_NOTEQUAL             = 0x00000002,
    COP_LESSTHAN             = 0x00000003,
    COP_GREATERTHAN          = 0x00000004,
    COP_LESSTHANOREQUAL      = 0x00000005,
    COP_GREATERTHANOREQUAL   = 0x00000006,
    COP_VALUE_STARTSWITH     = 0x00000007,
    COP_VALUE_ENDSWITH       = 0x00000008,
    COP_VALUE_CONTAINS       = 0x00000009,
    COP_VALUE_NOTCONTAINS    = 0x0000000a,
    COP_DOSWILDCARDS         = 0x0000000b,
    COP_WORD_EQUAL           = 0x0000000c,
    COP_WORD_STARTSWITH      = 0x0000000d,
    COP_APPLICATION_SPECIFIC = 0x0000000e,
}

