module generator.resolver.classlayoutresolver;

public import reader.database;
import reader.schema;

import std.typecons;


class ClassLayoutResolver
{
    private
    {
        Database db;
        uint[uint] typeDefRidToClassLayoutRid;
    }

    this(Database db)
    {
        this.db = db;

        foreach (row; db.ClassLayout.getRows())
        {
            typeDefRidToClassLayoutRid[row.parent] = row.rid;
        }

        typeDefRidToClassLayoutRid.rehash();
    }

    Nullable!uint getClassLayoutRid(uint typeDefRid)
    {
        Nullable!uint rid;
        if (auto p = typeDefRid in typeDefRidToClassLayoutRid)
            rid = *p;
        else
            rid.nullify();
        return rid;
    }
}
