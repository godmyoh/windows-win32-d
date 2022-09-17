module generator.resolver.clityperesolver;

import generator.type;

public import reader.database;
import reader.schema;
import reader.valuetype;


class CLITypeResolver
{
    private
    {
        Database db;
    }

    this(Database db)
    {
        this.db = db;
    }

    CLIType getType(ValueType vt)
    {
        return vt.match!((ElementType et) => getType(et),
                         (CodedIndex!TypeDefOrRef ci) => getType(ci),
                         );
    }

    CLIType getType(TypeDefRow typeDef)
    {
        return toTypeName(typeDef);
    }

    CLIType getType(CodedIndex!TypeDefOrRef ci)
    {
        if (ci.type == TypeDefOrRef.TypeDef)
        {
            auto row = db.TypeDef.getRowByRid(ci.index);
            return toTypeName(row);
        }
        else if (ci.type == TypeDefOrRef.TypeRef)
        {
            auto row = db.TypeRef.getRowByRid(ci.index);
            return toTypeName(row);
        }
        else
        {
            assert(0);
        }
    }

    CLIType getType(reader.enum_.ElementType et)
    {
        SupportedElementType set;

        final switch (et) with (ElementType)
        {
            case End:
                assert(0);
            case Void: set = SupportedElementType.Void; break;
            case Boolean: set = SupportedElementType.Boolean; break;
            case Char: set = SupportedElementType.Char; break;
            case I1: set = SupportedElementType.I1; break;
            case U1: set = SupportedElementType.U1; break;
            case I2: set = SupportedElementType.I2; break;
            case U2: set = SupportedElementType.U2; break;
            case I4: set = SupportedElementType.I4; break;
            case U4: set = SupportedElementType.U4; break;
            case I8: set = SupportedElementType.I8; break;
            case U8: set = SupportedElementType.U8; break;
            case R4: set = SupportedElementType.R4; break;
            case R8: set = SupportedElementType.R8; break;
            case String:
            case Ptr:
            case ByRef:
            case ValueType:
            case Class:
            case Var:
            case Array:
            case GenericInst:
            case TypedByRef:
                assert(0);

            case I: set = SupportedElementType.I; break;
            case U: set = SupportedElementType.U; break;

            case FnPtr:
            case Object:
            case SZArray:
            case MVar:
            case CModReqd:
            case CModOpt:
            case Internal:
            case Modifier:
            case Sentinel:
            case Pinned:
            case Type:
            case TaggedObject:
            case Field:
            case Property:
            case Enum:
                assert(0);
        }

        return CLIType(null, null, set, true);
    }
}


import std.conv;
import std.string;

private CLIType toTypeName(TypeDefOrRefRow)(TypeDefOrRefRow row)
{
    return CLIType(row.typeNamespace, row.typeName.to!string, SupportedElementType.None, false);
}
