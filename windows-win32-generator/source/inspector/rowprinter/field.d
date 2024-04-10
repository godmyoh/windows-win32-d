module inspector.rowprinter.field;

public import inspector.interfaces;
public import database.database;

import database.schema;
import database.relation.customattributeresolver;
import generator.impl.helper.clityperesolver;

import std.stdio;
import std.format;


class FieldPrinter : IRowPrinter
{
    private
    {
        IDatabase db;
        CustomAttributeResolver customAttributeResolver;
        CLITypeResolver cliTypeResolver;
    }

    this(IDatabase db)
    {
        this.db = db;
        this.customAttributeResolver = new CustomAttributeResolver(db.customAttribute);
        this.cliTypeResolver = new CLITypeResolver(db.typeRef, db.typeDef);
    }

    override void print(uint rid)
    {
        auto row = db.field.getRowByRid(FieldRID(rid));

        if (rid > db.field.size)
            return;

        auto sig = row.signature;
        auto cliType = cliTypeResolver.getType(sig.typeSig.valueType);
        auto attributes = customAttributeResolver.getRids(FieldRID(rid));

        writefln("Flags:%x Name:%s Signature:%s %s | CustomAttribute:%s",
                 row.flags.flags,
                 row.name,
                 sig,
                 cliType.toFQTN(),
                 attributes);
    }
}
