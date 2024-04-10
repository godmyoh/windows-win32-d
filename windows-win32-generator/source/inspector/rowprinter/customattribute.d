module inspector.rowprinter.customattribute;

public import inspector.interfaces;
public import database.database;

import database.schema;
import inspector.helper.customattribute;

import std.stdio;
import std.format;


class CustomAttributePrinter : IRowPrinter
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

    override void print(uint rid)
    {
        auto row = db.customAttribute.getRowByRid(CustomAttributeRID(rid));

        if (rid > db.customAttribute.size)
            return;

        auto parent = row.parent;
        auto constructor = row.type;

        writefln("RID:%d Parent:%s[%d] Type(constructor):%s[%d](%s %s) Value:(%d bytes)%s",
                 rid,
                 parent.type,
                 parent.index,
                 constructor.type,
                 constructor.index,
                 typeNameResolver.getTypeName(row),
                 peekConstructorName(constructor),
                 row.value.length,
                 toHex(row.value));
    }

    private string toHex(const(ubyte)[] blob)
    {
        string s = "[";
        foreach (i, b; blob)
        {
            s ~= format(i == 0 ? "%02x" : " %02x", b);
        }
        s ~= "]";
        return s;
    }

    private string peekConstructorName(CodedIndex!CustomAttributeType ctor)
    {
        if (ctor.type == CustomAttributeType.MethodDef)
        {
            return db.methodDef.getRowByRid(MethodDefRID(ctor.index)).name.idup;
        }
        else if (ctor.type == CustomAttributeType.MemberRef)
        {
            return db.memberRef.getRowByRid(MemberRefRID(ctor.index)).name.idup;
        }
        else
        {
            assert(0);
        }
    }
}
