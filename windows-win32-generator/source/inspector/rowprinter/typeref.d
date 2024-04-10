module inspector.rowprinter.typeref;

public import inspector.interfaces;
public import database.database;

import database.schema;

import std.stdio;


class TypeRefPrinter : IRowPrinter
{
    private
    {
        IDatabase db;
    }

    this(IDatabase db)
    {
        this.db = db;
    }

    override void print(uint rid)
    {
        auto row = db.typeRef.getRowByRid(TypeRefRID(rid));

        if (rid > db.typeRef.size)
            return;

        writefln("ResolutionScope:%s[%d] TypeName:%s TypeNamespace:%s",
                 row.resolutionScope.type,
                 row.resolutionScope.index,
                 row.typeName,
                 row.typeNamespace);
    }
}
