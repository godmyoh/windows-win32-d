module inspector.rowprinter.interfaceimpl;

public import inspector.interfaces;
public import database.database;

import database.schema;

import std.stdio;


class InterfaceImplPrinter : IRowPrinter
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
        auto table = db.interfaceImpl;
        auto row = table.getRowByRid(InterfaceImplRID(rid));

        if (rid > table.size)
            return;

        string extends;

        writefln("RID:%d Class:%d Interface:%d",
                 row.rid.value,
                 row.class_.value,
                 row.interface_.index,
                 );
    }
}
