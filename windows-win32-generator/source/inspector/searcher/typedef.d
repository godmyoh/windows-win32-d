module inspector.searcher.typedef;

import inspector.interfaces;
import database.database;
import database.schema;

import std.string;


class TypeDefSearcher : ISearcher
{
    private
    {
        IDatabase db;
    }

    this(IDatabase db)
    {
        this.db = db;
    }

    override uint searchNext(string text, uint prevRid)
    {
        auto rid = TypeDefRID(prevRid + 1);

        while (rid.value <= db.typeDef.size)
        {
            import std.stdio;
            auto row = db.typeDef.getRowByRid(rid);
            auto type = row.typeNamespace ~ "." ~ row.typeName;
            if (type.indexOf(text) != -1)
            {
                return row.rid.value;
            }

            rid = rid + 1;
        }

        return 0;
    }
}
