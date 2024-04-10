module inspector.helper.customattribute;

import database.database;
import database.schema;


class CustomAttributeHelper
{
    private IDatabase db;

    this(IDatabase db)
    {
        this.db = db;
    }

    const(char)[] getTypeName(CustomAttributeRow row)
    {
        auto constructor = row.type();
        if (constructor.type == CustomAttributeType.MethodDef)
        {
            assert(0);
        }
        else if (constructor.type == CustomAttributeType.MemberRef)
        {
            auto memberRef = db.memberRef.getRowByRid(MemberRefRID(constructor.index));
            auto memberClass = memberRef.class_;
            if (memberClass.type == MemberRefParent.TypeDef)
            {
                auto typeDef = db.typeDef.getRowByRid(TypeDefRID(memberClass.index));
                return typeDef.typeName;
            }
            else if (memberClass.type == MemberRefParent.TypeRef)
            {
                auto typeRef = db.typeRef.getRowByRid(TypeRefRID(memberClass.index));
                return typeRef.typeName;
            }
            else
            {
                assert(0);
            }
        }
        else
        {
            assert(0);
        }
    }
}
