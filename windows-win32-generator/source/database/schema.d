module database.schema;

public import database.table;
public import database.type;

import std.conv;
import std.variant;


alias TypeRefRow = Row!(TableFormat.TypeRef);
alias TypeDefRow = Row!(TableFormat.TypeDef);
alias FieldRow = Row!(TableFormat.Field);
alias MethodDefRow = Row!(TableFormat.MethodDef);
alias ParamRow = Row!(TableFormat.Param);
alias InterfaceImplRow = Row!(TableFormat.InterfaceImpl);
alias MemberRefRow = Row!(TableFormat.MemberRef);
alias ConstantRow = Row!(TableFormat.Constant);
alias CustomAttributeRow = Row!(TableFormat.CustomAttribute);


Row!t getRowByRid(TableFormat t)(ITable!t table, RID!t rid)
{
    Row!t row = { table, rid };
    return row;
}


RangeOfRows!t getRows(TableFormat t)(ITable!t table)
{
    return RangeOfRows!t(table);
}


RangeOfRows!t getRows(TableFormat t)(ITable!t table, RIDRange!t ridRange)
{
    if (ridRange.end.isNull)
        ridRange.end.value = table.size + 1;

    return RangeOfRows!t(table, ridRange.begin, ridRange.end);
}


struct RangeOfRows(TableFormat t)
{
    private
    {
        ITable!t table;
        RID!t nextRid;
        RID!t endRid;
    }

    this(ITable!t table)
    {
        this.table = table;
        this.nextRid.value = 1;
        this.endRid.value = table.size + 1;
    }

    this(ITable!t table, RID!t beginRid, RID!t endRid)
    {
        this.table = table;
        this.nextRid = beginRid;
        this.endRid = endRid;
    }

    Row!t front()
    {
        Row!t row;
        row.rid = nextRid;
        row.table = table;
        return row;
    }

    void popFront()
    {
        nextRid = nextRid + 1;
    }

    bool empty() const
    {
        return endRid.value <= nextRid.value;
    }
}


struct Row(TableFormat t)
{
    ITable!t table;
    RID!t rid;

    private uint getUint(uint columnIndex) const
    {
        return table.getUint(rid.value, columnIndex);
    }

    private ushort getUshort(uint columnIndex) const
    {
        return table.getUshort(rid.value, columnIndex);
    }

    private const(char)[] getString(uint columnIndex) const
    {
        auto stringOffset = getUint(columnIndex);
        return table.getString(stringOffset);
    }

    private const(ubyte)[] getBlob(uint columnIndex) const
    {
        auto blobOffset = getUint(columnIndex);
        return table.getBlob(blobOffset);
    }

    private RIDRange!t2 getRidRange(TableFormat t2)(uint columnIndex) const
    {
        auto beginRid = table.getUint(rid.value, columnIndex);
        auto endRid = 0;
        if (rid.value + 1 <= table.size)
            endRid = table.getUint(rid.value + 1, columnIndex);

        return RIDRange!t2(RID!t2(beginRid), RID!t2(endRid));
    }

    static if (t == TableFormat.TypeRef) // 0x01
    {
        // 0:ResolutionScope
        CodedIndex!ResolutionScope resolutionScope() const
        {
            auto codedIndex = getUint(0);
            return CodedIndex!ResolutionScope(codedIndex);
        }

        // 1:TypeName
        const(char)[] typeName() const
        {
            return getString(1);
        }

        // 2:TypeNamespace
        const(char)[] typeNamespace() const
        {
            return getString(2);
        }
    }
    else static if (t == TableFormat.TypeDef) // 0x02
    {
        // 0:Flags
        TypeAttributes flags() const
        {
            TypeAttributes ret = { getUint(0) };
            return ret;
        }

        // 1:TypeName
        const(char)[] typeName() const
        {
            return getString(1);
        }

        // 2:TypeNamespace
        const(char)[] typeNamespace() const
        {
            return getString(2);
        }

        // 3:Extends
        CodedIndex!TypeDefOrRef extends() const
        {
            auto codedIndex = getUint(3);
            return CodedIndex!TypeDefOrRef(codedIndex);
        }

        // 4:FieldList
        auto fieldList()
        {
            enum column = 4;
            return getRidRange!(TableFormat.Field)(column);
        }

        // 5:MethodList
        auto methodList()
        {
            enum column = 5;
            return getRidRange!(TableFormat.MethodDef)(column);
        }

        struct TypeAttributes
        {
            uint flags;
            bool class_() { return !interface_; }
            bool interface_() { return (flags & 0x00000020) != 0; }
            bool explicitLayout() { return (flags & 0x00000010) != 0; }
        }
    }
    else static if (t == TableFormat.Field) // 0x04
    {
        // 0:Flags
        FieldAttributes flags() const
        {
            FieldAttributes ret = { getUshort(0) };
            return ret;
        }

        // 1:Name
        const(char)[] name() const
        {
            return getString(1);
        }

        // 2:Signature
        FieldSig signature() const
        {
            auto blob = getBlob(2);

            return FieldSig(blob);
        }

        struct FieldAttributes
        {
            ushort flags;
        }
    }
    else static if (t == TableFormat.MethodDef) // 0x06
    {
        // 0:RVA

        // 1:ImplFlags

        // 2:Flags

        // 3:Name
        const(char)[] name() const
        {
            return getString(3);
        }

        // 4:Signature
        MethodDefSig signature() const
        {
            auto blob = getBlob(4);

            return MethodDefSig(blob);
        }

        // 5:ParamList
        auto paramList()
        {
            enum column = 5;
            return getRidRange!(TableFormat.Param)(column);
        }
    }
    else static if (t == TableFormat.Param) // 0x08
    {
        // 0:Flags
        ParamAttributes flags() const
        {
            ParamAttributes ret = { getUshort(0) };
            return ret;
        }

        // 1:Sequence

        // 2:Name
        const(char)[] name() const
        {
            return getString(2);
        }

        struct ParamAttributes
        {
            ushort flags;
            bool in_() const { return (flags & 0x1) != 0; }
            bool out_() const { return (flags & 0x2) != 0; }
            bool optional() const { return (flags & 0x10) != 0; }
            bool hasDefault() const { return (flags & 0x1000) != 0; }
            bool hasFieldMarshal() const { return (flags & 0x2000) != 0; }
        }
    }
    else static if (t == TableFormat.InterfaceImpl) // 0x09
    {
        // 0:Class
        TypeDefRID class_() const
        {
            return TypeDefRID(getUint(0));
        }

        // 1:Interface
        CodedIndex!TypeDefOrRef interface_() const
        {
            auto codedIndex = getUint(1);
            return CodedIndex!TypeDefOrRef(codedIndex);
        }
    }
    else static if (t == TableFormat.MemberRef) // 0x0A
    {
        // 0:Class
        CodedIndex!MemberRefParent class_() const
        {
            auto codedIndex = getUint(0);
            return CodedIndex!MemberRefParent(codedIndex);
        }

        // 1:Name
        const(char)[] name() const
        {
            return getString(1);
        }

        // 2:Signature
        MethodDefSig signatureAsMethodDef() const
        {
            auto blob = getBlob(2);

            return MethodDefSig(blob);
        }
    }
    else static if (t == TableFormat.Constant) // 0x0B
    {
        // 0:Type
        ElementType type() const
        {
            return cast(ElementType)getUshort(0);
        }

        // 1:Parent
        CodedIndex!HasConstant parent() const
        {
            auto codedIndex = getUint(1);
            return CodedIndex!HasConstant(codedIndex);
        }

        // 2:Value
        ConstantValue value() const
        {
            ConstantValue ret;

            auto blob = getBlob(2);
            auto et = type();

            with (ElementType)
            {
                if (Char <= et && et <= U8)
                {
                    ulong integerValue = parseInteger(blob);
                    switch (et)
                    {
                        case Char: ret.value = cast(wchar)integerValue; break;
                        case I1: ret.value = cast(byte)integerValue; break;
                        case U1: ret.value = cast(ubyte)integerValue; break;
                        case I2: ret.value = cast(short)integerValue; break;
                        case U2: ret.value = cast(ushort)integerValue; break;
                        case I4: ret.value = cast(int)integerValue; break;
                        case U4: ret.value = cast(uint)integerValue; break;
                        case I8: ret.value = cast(long)integerValue; break;
                        case U8: ret.value = cast(ulong)integerValue; break;
                        default: assert(0);
                    }
                }
                else if (et == R4) // float
                {
                    ret.value = *(cast(float*)blob.ptr);
                }
                else if (et == R8) // double
                {
                    ret.value = *(cast(double*)blob.ptr);
                }
                else if (et == String)
                {
                    auto wstr = cast(const(wchar)[])blob;
                    ret.value = wstr.to!string;
                }
                else
                    assert(0);
            }

            return ret;
        }

        struct ConstantValue
        {
            Variant value;

            int integerBytes() const
            {
                if (value.peek!byte || value.peek!ubyte)
                    return 1;
                if (value.peek!short || value.peek!ushort || value.peek!wchar)
                    return 2;
                if (value.peek!int || value.peek!uint)
                    return 4;
                if (value.peek!long || value.peek!ulong)
                    return 8;
                assert(0);
            }

            ulong integerValue() const
            {
                if (auto p = value.peek!wchar) return *p;
                if (auto p = value.peek!byte) return *p;
                if (auto p = value.peek!ubyte) return *p;
                if (auto p = value.peek!short) return *p;
                if (auto p = value.peek!ushort) return *p;
                if (auto p = value.peek!int) return *p;
                if (auto p = value.peek!uint) return *p;
                if (auto p = value.peek!long) return *p;
                if (auto p = value.peek!ulong) return *p;
                assert(0);
            }
        }

        private static ulong parseInteger(const(ubyte)[] bytes)
        {
            if (bytes.length == 1)
            {
                return *cast(ubyte*)bytes.ptr;
            }
            else if (bytes.length == 2)
            {
                return *cast(ushort*)bytes.ptr;
            }
            else if (bytes.length == 4)
            {
                return *cast(uint*)bytes.ptr;
            }
            else if (bytes.length == 8)
            {
                return *cast(ulong*)bytes.ptr;
            }
            else
            {
                assert(0);
            }
        }
    }
    else static if (t == TableFormat.CustomAttribute) // 0x0C
    {
        // 0:Parent
        CodedIndex!HasCustomAttribute parent() const
        {
            auto codedIndex = getUint(0);
            return CodedIndex!HasCustomAttribute(codedIndex);
        }

        // 1:Type
        // The column called Type is slightly misleading—it actually indexes a constructor method—the owner of that constructor method is the Type of the Custom Attribute.
        CodedIndex!CustomAttributeType type() const
        {
            auto codedIndex = getUint(1);
            return CodedIndex!CustomAttributeType(codedIndex);
        }

        // 2:Value
        auto value() const
        {
            auto blob = getBlob(2);
            return blob;
        }
    }
    else static if (t == TableFormat.ClassLayout) // 0x0F
    {
        // 0:PackingSize
        ushort packingSize() const
        {
            return getUshort(0);
        }

        // 1:ClassSize

        // 2:Parent
        TypeDefRID parent() const
        {
            return TypeDefRID(getUint(2));
        }
    }
    else static if (t == TableFormat.NestedClass) // 0x29
    {
        // 0:NestedClass
        TypeDefRID nestedClass() const
        {
            return TypeDefRID(getUint(0));
        }

        // 1:EnclosingClass
        TypeDefRID enclosingClass() const
        {
            return TypeDefRID(getUint(1));
        }
    }
    else
    {
        static assert(0);
    }
}


struct RIDRange(TableFormat t)
{
    RID!t begin;
    RID!t end; // can be 0
}
