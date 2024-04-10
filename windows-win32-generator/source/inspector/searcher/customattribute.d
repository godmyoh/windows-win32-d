module inspector.searcher.customattribute;

import inspector.interfaces;
import inspector.helper.customattribute;
import database.database;
import database.schema;

import std.string;


class CustomAttributeSearcher : ISearcher
{
    private
    {
        IDatabase db;
        CustomAttributeHelper typeNameResolver;
    }

    this(IDatabase db)
    {
        this.db = db;
        this.typeNameResolver = new CustomAttributeHelper(db);
    }

    override uint searchNext(string text, uint prevRid)
    {
        auto rid = CustomAttributeRID(prevRid + 1);

        while (rid.value <= db.customAttribute.size)
        {
            auto row = db.customAttribute.getRowByRid(rid);

            if (typeNameResolver.getTypeName(row).indexOf(text) != -1)
            {
                return row.rid.value;
            }

            rid = rid + 1;
        }

        return 0;
    }
}
