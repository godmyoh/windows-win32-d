module database.relation.classlayoutresolver;

import database.schema;


class ClassLayoutResolver
{
    private
    {
        ClassLayoutRID[TypeDefRID] typeDefRidToClassLayoutRid;
    }

    this(IClassLayoutTable table)
    {
        foreach (row; table.getRows())
        {
            typeDefRidToClassLayoutRid[row.parent] = row.rid;
        }

        typeDefRidToClassLayoutRid.rehash();
    }

    ClassLayoutRID getClassLayoutRid(TypeDefRID typeDefRid)
    {
        if (auto p = typeDefRid in typeDefRidToClassLayoutRid)
            return *p;
        else
            return ClassLayoutRID(0);
    }
}
