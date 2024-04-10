module database.relation.interfaceimplresolver;

import database.schema;


class InterfaceImplResolver
{
    private
    {
        TypeRefRID[][TypeDefRID] typeDefIndexToInterfaceRids;
    }

    this(IInterfaceImplTable table)
    {
        foreach (row; table.getRows())
        {
            auto typeDefOrRef = row.interface_;
            assert(typeDefOrRef.type == TypeDefOrRef.TypeRef);
            typeDefIndexToInterfaceRids.require(row.class_, []) ~= TypeRefRID(typeDefOrRef.index);
        }
    }

    const(TypeRefRID)[] getInterfaces(TypeDefRID typeDefRid) const
    {
        if (auto p = typeDefRid in typeDefIndexToInterfaceRids)
            return *p;
        else
            return [];
    }
}
