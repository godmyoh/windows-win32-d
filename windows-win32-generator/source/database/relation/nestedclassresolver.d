module database.relation.nestedclassresolver;

import database.schema;


class NestedClassResolver
{
    private
    {
        TypeDefRID[][TypeDefRID] enclosingClassRidToNestedClassRids;
    }

    this(INestedClassTable table)
    {
        foreach (nestedClass; table.getRows())
        {
            enclosingClassRidToNestedClassRids.require(nestedClass.enclosingClass, []) ~= nestedClass.nestedClass;
        }
    }

    const(TypeDefRID)[] getNestedClasses(TypeDefRID enclosingClassRid) const
    {
        if (auto p = enclosingClassRid in enclosingClassRidToNestedClassRids)
            return *p;
        else
            return [];
    }
}
