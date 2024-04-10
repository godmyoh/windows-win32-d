module database.relation.customattributeresolver;

import database.schema;


class CustomAttributeResolver
{
    private
    {
        CustomAttributeRID[][FieldRID] fieldMap;
        CustomAttributeRID[][TypeDefRID] typeDefMap;
        CustomAttributeRID[][ParamRID] paramMap;
    }

    this(ICustomAttributeTable table)
    {
        foreach (customAttribute; table.getRows())
        {
            auto parent = customAttribute.parent;
            auto targetRid = parent.index;
            auto customAttributeRid = customAttribute.rid;

            if (parent.type == HasCustomAttribute.Field)
                addRid!(fieldMap, FieldRID)(FieldRID(targetRid), customAttributeRid);
            else if (parent.type == HasCustomAttribute.TypeDef)
                addRid!(typeDefMap, TypeDefRID)(TypeDefRID(targetRid), customAttributeRid);
            else if (parent.type == HasCustomAttribute.Param)
                addRid!(paramMap, ParamRID)(ParamRID(targetRid), customAttributeRid);
        }

        fieldMap.rehash();
        typeDefMap.rehash();
        paramMap.rehash();
    }

    private void addRid(alias targetMap, TRID)(TRID targetRid, CustomAttributeRID customAttributeRid)
    {
        targetMap.require(targetRid, []) ~= customAttributeRid;
    }

    const(CustomAttributeRID)[] getRids(FieldRID rid) const
    {
        if (auto p = rid in fieldMap)
            return *p;
        else
            return [];
    }

    const(CustomAttributeRID)[] getRids(TypeDefRID rid) const
    {
        if (auto p = rid in typeDefMap)
            return *p;
        else
            return [];
    }

    const(CustomAttributeRID)[] getRids(ParamRID rid) const
    {
        if (auto p = rid in paramMap)
            return *p;
        else
            return [];
    }
}
