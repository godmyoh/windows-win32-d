module generator.resolver.constantfieldresolver;

import generator.type;

public import reader.database;
import reader.schema;
import reader.valuetype;

import std.typecons;


class ConstantFieldResolver
{
    private
    {
        Database db;
        uint[] fieldIndexToConstantRid;
    }

    this(Database db)
    {
        this.db = db;
        fieldIndexToConstantRid.length = db.Field.size;

        foreach (row; db.Constant.getRows())
        {
            auto constant = cast(ConstantRow)row;
            auto parent = constant.parent;
            auto fieldRid = parent.index;
            assert(fieldRid != 0);

            if (parent.type != HasConstant.Field)
                continue;

            fieldIndexToConstantRid[fieldRid - 1] = constant.rid;
        }
    }

    Nullable!ConstantValue getConstantValue(uint fieldRid)
    {
        Nullable!ConstantValue ret;

        auto constantRid = fieldIndexToConstantRid[fieldRid - 1];

        if (constantRid == 0)
            return ret;

        auto constant = cast(ConstantRow)db.Constant.getRowByRid(constantRid);
        ret = constant.value;
        return ret;
    }
}
