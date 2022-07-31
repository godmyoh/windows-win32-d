module generator.resolver.dlangtyperesolver;

import generator.type;
import generator.impl.interfaces;

import std.array;


class DlangTypeResolver : IDlangTypeResolver
{
    override constr toDlangType(CLIType cliType, bool isConst)
    {
        constr dlangType;

        if (cliType.isPremitive)
        {
            assert(cliType.typeName.empty);

            dlangType = toName(cliType.elementType);
        }
        else
            dlangType = cliType.typeName;

        if (isConst)
            dlangType = "const(" ~ dlangType ~ ")";

        return dlangType;
    }
}


private string toName(SupportedElementType et)
{
    final switch (et) with (SupportedElementType)
    {
        case None: assert(0);
        case Void: return "void";
        case Boolean: return "bool";
        case Char: return "wchar";
        case I1: return "byte";
        case U1: return "ubyte";
        case I2: return "short";
        case U2: return "ushort";
        case I4: return "int";
        case U4: return "uint";
        case I8: return "long";
        case U8: return "ulong";
        case R4: return "float";
        case R8: return "double";
        case I: return "long";
        case U: return "ulong";
    }
}
