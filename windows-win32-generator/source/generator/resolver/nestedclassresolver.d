module generator.resolver.nestedclassresolver;

public import reader.database;
import reader.schema;


class NestedClassResolver
{
    private
    {
        uint[][uint] enclosingClassRidToNestedClassRids;
    }

    this(Database db)
    {
        foreach (nestedClass; db.NestedClass.getRows())
        {
            uint enclosingRid = nestedClass.enclosingClass;
            uint nestedRid = nestedClass.nestedClass;

            if (auto p = enclosingRid in enclosingClassRidToNestedClassRids)
            {
                *p ~= nestedRid;
            }
            else
            {
                enclosingClassRidToNestedClassRids[enclosingRid] = [nestedRid];
            }
        }
    }

    uint[] getNestedClasses(uint enclosingClassRid)
    {
        if (auto p = enclosingClassRid in enclosingClassRidToNestedClassRids)
            return *p;
        else
            return [];
    }
}
