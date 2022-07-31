module generator.resolver.customattributeresolver;

public import reader.database;
import reader.schema;


class CustomAttributeResolver
{
    private
    {
        // TypeDef RID -> array of CustomAttribute RID
        uint[][uint] fieldMap;
        uint[][uint] typeDefMap;
        uint[][uint] paramMap;
    }

    this(Database db)
    {
        foreach (customAttribute; db.CustomAttribute.getRows())
        {
            auto parent = customAttribute.parent;
            auto targetRid = parent.index;
            auto customAttributeRid = customAttribute.rid;

            if (parent.type == HasCustomAttribute.Field)
                addRid!(fieldMap)(targetRid, customAttributeRid);
            else if (parent.type == HasCustomAttribute.TypeDef)
                addRid!(typeDefMap)(targetRid, customAttributeRid);
            else if (parent.type == HasCustomAttribute.Param)
                addRid!(paramMap)(targetRid, customAttributeRid);
        }

        fieldMap.rehash();
        typeDefMap.rehash();
        paramMap.rehash();
    }

    private void addRid(alias targetMap)(uint targetRid, uint customAttributeRid)
    {
        if (auto p = targetRid in targetMap)
        {
            *p ~= customAttributeRid;
        }
        else
        {
            targetMap[targetRid] = [customAttributeRid];
        }
    }

    const(uint)[] getRidsForField(uint rid) const
    {
        if (auto p = rid in fieldMap)
            return *p;
        else
            return [];
    }

    const(uint)[] getRidsForTypeDef(uint rid) const
    {
        if (auto p = rid in typeDefMap)
            return *p;
        else
            return [];
    }

    const(uint)[] getRidsForParam(uint rid) const
    {
        if (auto p = rid in paramMap)
            return *p;
        else
            return [];
    }
}
