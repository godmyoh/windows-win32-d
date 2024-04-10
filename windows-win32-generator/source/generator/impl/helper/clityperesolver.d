module generator.impl.helper.clityperesolver;

import generator.type;

import database.schema;
import database.type.valuetype;


class CLITypeResolver
{
    private
    {
        ITypeRefTable typeRefTable;
        ITypeDefTable typeDefTable;
    }

    this(ITypeRefTable typeRefTable, ITypeDefTable typeDefTable)
    {
        this.typeRefTable = typeRefTable;
        this.typeDefTable = typeDefTable;
    }

    CLIType getType(ValueType vt)
    {
        return vt.match!((ElementType et) => getType(et),
                         (CodedIndex!TypeDefOrRef ci) => getType(ci),
                         );
    }

    CLIType getType(TypeRefRID rid)
    {
        auto row = typeRefTable.getRowByRid(rid);
        return toCLIType(row.typeNamespace, row.typeName);
    }

    CLIType getType(TypeDefRow typeDef)
    {
        return toCLIType(typeDef.typeNamespace, typeDef.typeName);
    }

    CLIType getType(CodedIndex!TypeDefOrRef ci)
    {
        if (ci.type == TypeDefOrRef.TypeDef)
        {
            auto row = typeDefTable.getRowByRid(TypeDefRID(ci.index));
            return toCLIType(row.typeNamespace, row.typeName);
        }
        else if (ci.type == TypeDefOrRef.TypeRef)
        {
            auto row = typeRefTable.getRowByRid(TypeRefRID(ci.index));
            return toCLIType(row.typeNamespace, row.typeName);
        }
        else
            assert(0);
    }

    private CLIType getType(database.type.enum_.ElementType et)
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


private CLIType toCLIType(constr typeNamespace, constr typeName)
{
    return CLIType(typeNamespace, typeName, SupportedElementType.None, false);
}
