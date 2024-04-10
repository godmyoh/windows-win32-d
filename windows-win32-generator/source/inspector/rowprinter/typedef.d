module inspector.rowprinter.typedef;

public import inspector.interfaces;
public import database.database;

import database.schema;
import generator.impl.helper.clityperesolver;

import std.stdio, std.array;


class TypeDefPrinter : IRowPrinter
{
    private
    {
        IDatabase db;
        CLITypeResolver cliTypeResolver;
    }

    this(IDatabase db)
    {
        this.db = db;
        this.cliTypeResolver = new CLITypeResolver(db.typeRef, db.typeDef);
    }

    override void print(uint rid)
    {
        auto row = db.typeDef.getRowByRid(TypeDefRID(rid));

        if (rid > db.typeDef.size)
            return;

        writefln("RID:%d Flags:%x TypeName:%s TypeNamespace:%s Extends:%s[%d](%s) FieldList:%d MethodList:%d",
                 row.rid.value,
                 row.flags.flags,
                 row.typeName,
                 row.typeNamespace,
                 row.extends.type,
                 row.extends.index,
                 row.extends != CodedIndex!TypeDefOrRef(0) ? cliTypeResolver.getType(row.extends).toFQTN() : "",
                 db.field.getRows(row.fieldList).array.length,
                 db.methodDef.getRows(row.methodList).array.length);
    }
}
