module database.relation.constantresolver;

import database.schema;


class ConstantResolver
{
    private
    {
        ConstantRID[] fieldIndexToConstantRid;
    }

    this(IConstantTable constantTable, IFieldTable fieldTable)
    {
        fieldIndexToConstantRid.length = fieldTable.size;

        foreach (row; constantTable.getRows())
        {
            auto parent = row.parent;
            auto fieldRid = parent.index;
            assert(fieldRid != 0);

            if (parent.type != HasConstant.Field)
                continue;

            fieldIndexToConstantRid[fieldRid - 1] = row.rid;
        }
    }

    ConstantRID getRid(FieldRID fieldRid)
    {
        return fieldIndexToConstantRid[fieldRid.value - 1];
    }
}
