module reader.schema;

public import reader.database;
public import reader.signature;

import reader.helper.integer;
import std.array, std.conv;
import std.variant;

alias TypeRefRow = Row!(Database.TableFormat.TypeRef);
alias TypeDefRow = Row!(Database.TableFormat.TypeDef);
alias FieldRow = Row!(Database.TableFormat.Field);
alias MethodDefRow = Row!(Database.TableFormat.MethodDef);
alias ParamRow = Row!(Database.TableFormat.Param);
alias InterfaceImplRow = Row!(Database.TableFormat.InterfaceImpl);
alias ConstantRow = Row!(Database.TableFormat.Constant);


Row!t getRowByRid(Database.TableFormat t)(Table!t table, uint rid)
{
    Row!t row = {{ table, rid }};
    return row;
}


RangeOfRows!t getRows(Database.TableFormat t)(Table!t table)
{
    return RangeOfRows!t(table);
}


RangeOfRows!t getRows(Database.TableFormat t)(Table!t table, RidRange ridRange)
{
    if (ridRange.end == 0)
        ridRange.end = table.size + 1;

    return RangeOfRows!t(table, ridRange.begin - 1, ridRange.end - 1);
}


struct RangeOfRows(Database.TableFormat t)
{
    private
    {
        Table!t table;
        int nextRowIndex = 0;
        int endRowIndex;
    }

    this(Table!t table)
    {
        this.table = table;
        this.nextRowIndex = 0;
        this.endRowIndex = table.size;
    }

    this(Table!t table, int beginIndex, int endIndex)
    {
        this.table = table;
        this.nextRowIndex = beginIndex;
        this.endRowIndex = endIndex;
    }

    Row!t front()
    {
        Row!t row;
        row.rid = nextRowIndex + 1;
        row.table = table;
        return row;
    }

    void popFront()
    {
        nextRowIndex++;
    }

    bool empty()
    {
        return endRowIndex <= nextRowIndex;
    }
}


struct Row(Database.TableFormat t)
{
    RowBase base;
    alias base this;

    static assert(this.sizeof == base.sizeof);

    static if (t == Database.TableFormat.TypeRef) // 0x01
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
    else static if (t == Database.TableFormat.TypeDef) // 0x02
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
        FieldRow[] fieldList()
        {
            enum column = 4;
            auto ridRange = getRidRange(column);
            return table.db.Field.getRows(ridRange).array;
        }

        // 5:MethodList
        MethodDefRow[] methodList()
        {
            enum column = 5;
            auto ridRange = getRidRange(column);
            return table.db.MethodDef.getRows(ridRange).array;
        }

        // helper

        bool isEnum()
        {
            auto superTypeCodedIndex = extends;

            if (superTypeCodedIndex.type == TypeDefOrRef.TypeRef)
            {
                auto typeRefRow = cast(TypeRefRow)table.db.TypeRef.getRowByRid(superTypeCodedIndex.index);

                return (typeRefRow.typeName == "Enum") & (typeRefRow.typeNamespace == "System");
            }

            return false;
        }

        bool isAlias()
        {
            auto fields = fieldList();

            if (fields.length != 1)
                return false;

            return fields[0].name == "Value";
        }

        bool isFunctionPointer()
        {
            auto superTypeCodedIndex = extends;

            if (superTypeCodedIndex.type == TypeDefOrRef.TypeRef)
            {
                auto typeRefRow = cast(TypeRefRow)table.db.TypeRef.getRowByRid(superTypeCodedIndex.index);

                return (typeRefRow.typeName == "MulticastDelegate") & (typeRefRow.typeNamespace == "System");
            }

            return false;
        }

        bool isUnion()
        {
            return flags.explicitLayout;
        }

        struct TypeAttributes
        {
            uint flags;
            bool class_() { return !interface_; }
            bool interface_() { return (flags & 0x00000020) != 0; }
            bool explicitLayout() { return (flags & 0x00000010) != 0; }
        }
    }
    else static if (t == Database.TableFormat.Field) // 0x04
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
    else static if (t == Database.TableFormat.MethodDef) // 0x06
    {
        // 0:RVA

        // 1:ImplFlags
        ushort implFlags() const
        {
            return getUshort(1);
        }

        // 2:Flags
        ushort flags() const
        {
            return getUshort(2);
        }

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
        ParamRow[] paramList()
        {
            enum column = 5;
            auto ridRange = getRidRange(column);
            return table.db.Param.getRows(ridRange).array;
        }
    }
    else static if (t == Database.TableFormat.Param) // 0x08
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
    else static if (t == Database.TableFormat.InterfaceImpl) // 0x09
    {
        // 0:Class
        uint class_() const
        {
            return getUint(0);
        }

        // 1:Interface
        CodedIndex!TypeDefOrRef interface_() const
        {
            auto codedIndex = getUint(1);
            return CodedIndex!TypeDefOrRef(codedIndex);
        }
    }
    else static if (t == Database.TableFormat.MemberRef) // 0x0A
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
    else static if (t == Database.TableFormat.Constant) // 0x0B
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
    }
    else static if (t == Database.TableFormat.CustomAttribute) // 0x0C
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

        // helper

        const(char)[] typeName()
        {
            auto constructor = type();
            if (constructor.type == CustomAttributeType.MethodDef)
            {
                assert(0);
            }
            else if (constructor.type == CustomAttributeType.MemberRef)
            {
                auto memberRef = table.db.MemberRef.getRowByRid(constructor.index);
                auto memberClass = memberRef.class_;
                if (memberClass.type == MemberRefParent.TypeDef)
                {
                    auto typeDef = table.db.TypeDef.getRowByRid(memberClass.index);
                    return typeDef.typeName;
                }
                else if (memberClass.type == MemberRefParent.TypeRef)
                {
                    auto typeRef = table.db.TypeRef.getRowByRid(memberClass.index);
                    return typeRef.typeName;
                }
                else
                {
                    assert(0);
                }
            }
            else
            {
                assert(0);
            }
        }

        Row!(Database.TableFormat.MemberRef) getConstructor()
        {
            auto constructor = type();
            if (constructor.type == CustomAttributeType.MethodDef)
            {
                assert(0);
            }
            else if (constructor.type == CustomAttributeType.MemberRef)
            {
               return table.db.MemberRef.getRowByRid(constructor.index);
            }
            else
            {
                assert(0);
            }
        }
    }
    else static if (t == Database.TableFormat.ClassLayout) // 0x0F
    {
        // 0:PackingSize
        ushort packingSize() const
        {
            return getUshort(0);
        }

        // 1:ClassSize

        // 2:Parent
        uint parent() const
        {
            return getUint(2);
        }
    }
    else static if (t == Database.TableFormat.NestedClass) // 0x29
    {
        // 0:NestedClass
        uint nestedClass() const
        {
            return getUint(0);
        }

        // 1:EnclosingClass
        uint enclosingClass() const
        {
            return getUint(1);
        }
    }
    else
    {
        static assert(0);
    }
}


struct RowBase
{
    TableBase table;
    uint rid;

    const(char)[] getString(uint columnIndex) const
    {
        auto stringOffset = table.getValue!uint(rid - 1, columnIndex);
        return table.db.getString(stringOffset);
    }

    const(ubyte)[] getBlob(uint columnIndex) const
    {
        auto blobOffset = table.getValue!uint(rid - 1, columnIndex);
        return table.db.getBlob(blobOffset);
    }

    ushort getUshort(uint columnIndex) const
    {
        return table.getValue!ushort(rid - 1, columnIndex);
    }

    uint getUint(uint columnIndex) const
    {
        return table.getValue!uint(rid - 1, columnIndex);
    }

    RidRange getRidRange(uint columnIndex) const
    {
        auto beginRid = table.getValue!uint(rid - 1, columnIndex);
        auto endRid = 0;
        if (rid + 1 <= table.size)
            endRid = table.getValue!uint(rid - 1 + 1, columnIndex);

        return RidRange(beginRid, endRid);
    }
}


struct RidRange
{
    uint begin;
    uint end;

    uint size() const
    {
        return end - begin;
    }
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
