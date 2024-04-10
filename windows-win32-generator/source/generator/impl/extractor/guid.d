module generator.impl.extractor.guid;

public import generator.type;

import database.database;
import database.schema;
import database.relation.customattributeresolver;
import generator.impl.helper.knowntypes;

import std.typecons;


class GuidExtractor
{
    private
    {
        IDatabase db;
        const(KnownTypes) knownTypes;
        const(CustomAttributeResolver) customAttributeResolver;
    }

    this(IDatabase db, const(KnownTypes) knownTypes, const(CustomAttributeResolver) customAttributeResolver)
    {
        this.db = db;
        this.knownTypes = knownTypes;
        this.customAttributeResolver = customAttributeResolver;
    }

    Nullable!GUID extractFromGuidAttribute(TypeDefRID rid)
    {
        return searchGuidAttribute(customAttributeResolver.getRids(rid));
    }

    Nullable!GUID extractFromGuidAttribute(FieldRID rid)
    {
        return searchGuidAttribute(customAttributeResolver.getRids(rid));
    }

    private Nullable!GUID searchGuidAttribute(const(CustomAttributeRID)[] customAttributeRids)
    {
        Nullable!GUID guid;

        foreach (customAttributeRid; customAttributeRids)
        {
            auto customAttribute = db.customAttribute.getRowByRid(customAttributeRid);

            guid = extractFrom(customAttribute);

            if (!guid.isNull)
                break;
        }

        return guid;
    }

    private Nullable!GUID extractFrom(CustomAttributeRow customAttribute)
    {
        Nullable!GUID guid;

        if (customAttribute.type != knownTypes.guidAttribute)
            return guid;

        auto value = customAttribute.value;

        // parse Guid
        {
            MemberRefRow getConstructor(CustomAttributeRow customAttribute)
            {
                auto constructor = customAttribute.type();
                if (constructor.type == CustomAttributeType.MethodDef)
                {
                    assert(0);
                }
                else if (constructor.type == CustomAttributeType.MemberRef)
                {
                    return db.memberRef.getRowByRid(MemberRefRID(constructor.index));
                }
                else
                {
                    assert(0);
                }
            }

            auto ctor = getConstructor(customAttribute);
            auto ctorSig = ctor.signatureAsMethodDef;
            assert(ctorSig.paramSigs.length == 11);
        }

        if (value.length == 20)
        {
            // Prolog
            assert(value[0..2] == [0x01, 0x0]);
            value = value[2..$];

            uint data1 = *(cast(uint*)(value.ptr));
            ushort data2 = *(cast(ushort*)(value.ptr + GUID.Data2.offsetof));
            ushort data3 = *(cast(ushort*)(value.ptr + GUID.Data3.offsetof));
            ubyte[8] data4 = value[GUID.Data4.offsetof..GUID.sizeof].dup;

            guid = GUID(data1, data2, data3, data4);

            return guid;
        }
        else
        {
            assert(0);
        }
    }
}
