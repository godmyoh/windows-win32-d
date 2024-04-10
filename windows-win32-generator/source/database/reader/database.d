module database.reader.database;

public import database.database;

import database.reader.pe;
import std.array, std.conv;


class Database : IDatabase
{
    private
    {
        const(ubyte)[] strings;
        const(ubyte)[] blobs;
        const(ubyte)[] guids;
        const(ubyte)[] tables;
    }

    public
    {
        Table!(TableFormat.TypeRef) TypeRef;
        Table!(TableFormat.GenericParamConstraint) GenericParamConstraint;
        Table!(TableFormat.TypeSpec) TypeSpec;
        Table!(TableFormat.TypeDef) TypeDef;
        Table!(TableFormat.CustomAttribute) CustomAttribute;
        Table!(TableFormat.MethodDef) MethodDef;
        Table!(TableFormat.MemberRef) MemberRef;
        Table!(TableFormat.Module) Module;
        Table!(TableFormat.Param) Param;
        Table!(TableFormat.InterfaceImpl) InterfaceImpl;
        Table!(TableFormat.Constant) Constant;
        Table!(TableFormat.Field) Field;
        Table!(TableFormat.FieldMarshal) FieldMarshal;
        Table!(TableFormat.DeclSecurity) DeclSecurity;
        Table!(TableFormat.ClassLayout) ClassLayout;
        Table!(TableFormat.FieldLayout) FieldLayout;
        Table!(TableFormat.StandAloneSig) StandAloneSig;
        Table!(TableFormat.EventMap) EventMap;
        Table!(TableFormat.Event) Event;
        Table!(TableFormat.PropertyMap) PropertyMap;
        Table!(TableFormat.Property) Property;
        Table!(TableFormat.MethodSemantics) MethodSemantics;
        Table!(TableFormat.MethodImpl) MethodImpl;
        Table!(TableFormat.ModuleRef) ModuleRef;
        Table!(TableFormat.ImplMap) ImplMap;
        Table!(TableFormat.FieldRVA) FieldRVA;
        Table!(TableFormat.Assembly) Assembly;
        Table!(TableFormat.AssemblyProcessor) AssemblyProcessor;
        Table!(TableFormat.AssemblyOS) AssemblyOS;
        Table!(TableFormat.AssemblyRef) AssemblyRef;
        Table!(TableFormat.AssemblyRefProcessor) AssemblyRefProcessor;
        Table!(TableFormat.AssemblyRefOS) AssemblyRefOS;
        Table!(TableFormat.File) File;
        Table!(TableFormat.ExportedType) ExportedType;
        Table!(TableFormat.ManifestResource) ManifestResource;
        Table!(TableFormat.NestedClass) NestedClass;
        Table!(TableFormat.GenericParam) GenericParam;
        Table!(TableFormat.MethodSpec) MethodSpec;
    }

    // IDatabase

    override ITypeRefTable typeRef() => TypeRef;
    override ITypeDefTable typeDef() => TypeDef;
    override IFieldTable field() => Field;
    override IMethodDefTable methodDef() => MethodDef;
    override IParamTable param() => Param;
    override IInterfaceImplTable interfaceImpl() => InterfaceImpl;
    override IMemberRefTable memberRef() => MemberRef;
    override IConstantTable constant() => Constant;
    override ICustomAttributeTable customAttribute() => CustomAttribute;
    override INestedClassTable nestedClass() => NestedClass;
    override IClassLayoutTable classLayout() => ClassLayout;

    private void init(alias table)()
    {
        table = new typeof(table)(this, table.stringof[5..$]/+ this.TABLENAME +/);
    }

    this(void[] winmdFileContent)
    {
        const(ubyte)[] data = cast(ubyte[])winmdFileContent;

        auto dos = peekFront!ImageDosHeader(data);

        assert(dos.e_signature == 0x5A4D, "Invalid DOS signature");

        auto pe = peekFront!ImageNtHeaders32(data[dos.e_lfanew..$]);

        assert(pe.FileHeader.NumberOfSections != 0 && pe.FileHeader.NumberOfSections <= 100, "Invalid PE section count");

        ImageSectionHeader* sections;
        uint comVirtualAddress;
        if (pe.OptionalHeader.Magic == 0x10B) // PE32
        {
            comVirtualAddress = pe.OptionalHeader.DataDirectory[14].VirtualAddress; // IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
            sections = cast(ImageSectionHeader*)(data.ptr + dos.e_lfanew + ImageNtHeaders32.sizeof);
        }
        else if (pe.OptionalHeader.Magic == 0x20B) // PE32+
        {
            auto pePlus = peekFront!ImageNtHeaders32Plus(data[dos.e_lfanew..$]);
            comVirtualAddress = pePlus.OptionalHeader.DataDirectory[14].VirtualAddress; // IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
            sections = cast(ImageSectionHeader*)(data.ptr + dos.e_lfanew + ImageNtHeaders32Plus.sizeof);
        }
        else
        {
            assert(0, "Invalid optional header magic value");
        }
        auto sectionsEnd = sections + pe.FileHeader.NumberOfSections;
        auto section = sectionFromRVA(sections, sectionsEnd, comVirtualAddress);

        assert(section != sectionsEnd, "PE section containing CLI header not found");

        auto offset = offsetFromRVA(*section, comVirtualAddress);

        auto cli = peekFront!ImageCor20Header(data[offset..$]);

        assert(cli.cb == ImageCor20Header.sizeof, "Invalid CLI header");

        section = sectionFromRVA(sections, sectionsEnd, cli.MetaData.VirtualAddress);

        assert(section != sectionsEnd, "PE section containing CLI metadata not found");

        offset = offsetFromRVA(*section, cli.MetaData.VirtualAddress);

        if (peekFront!uint(data[offset..$]) != 0x424a5342)
        {
            throw new Exception("CLI metadata magic signature not found");
        }

        auto versionLength = peekFront!uint(data[offset + 12..$]);
        auto streamCount = peekFront!ushort(data[offset + versionLength + 18..$]);
        const(ubyte)[] view = data[offset + versionLength + 20..$];

        for (int i = 0; i < streamCount; i++)
        {
            auto stream = peekFront!StreamRange(view);
            auto name = parseNullTerminatedString(view[8..$]);

            if (name == "#Strings")
            {
                strings = data[offset + stream.offset..offset + stream.offset + stream.size];
            }
            else if (name == "#Blob")
            {
                blobs = data[offset + stream.offset..offset + stream.offset + stream.size];
            }
            else if (name == "#GUID")
            {
                guids = data[offset + stream.offset..offset + stream.offset + stream.size];
            }
            else if (name == "#~")
            {
                tables = data[offset + stream.offset..offset + stream.offset + stream.size];
            }
            else if (name != "#US")
            {
                throw new Exception("Unknown metadata stream");
            }

            view = view[streamOffset(name)..$];
        }

        ubyte heapSizes = peekFront!ubyte(tables[6..$]);
        ubyte stringIndexSize = (heapSizes & 0x1) ? 4 : 2;
        ubyte guidIndexSize = (heapSizes & 0x2) ? 4 : 2;
        ubyte blobIndexSize = (heapSizes & 0x4) ? 4 : 2;

        ulong validBits = peekFront!ulong(tables[8..$]);
        view = tables[24..$];

        init!(Assembly);
        init!(AssemblyOS);
        init!(AssemblyProcessor);
        init!(AssemblyRef);
        init!(AssemblyRefOS);
        init!(AssemblyRefProcessor);
        init!(ClassLayout);
        init!(Constant);
        init!(CustomAttribute);
        init!(DeclSecurity);
        init!(EventMap);
        init!(Event);
        init!(ExportedType);
        init!(Field);
        init!(FieldLayout);
        init!(FieldMarshal);
        init!(FieldRVA);
        init!(File);
        init!(GenericParam);
        init!(GenericParamConstraint);
        init!(ImplMap);
        init!(InterfaceImpl);
        init!(ManifestResource);
        init!(MemberRef);
        init!(MethodDef);
        init!(MethodImpl);
        init!(MethodSemantics);
        init!(MethodSpec);
        init!(Module);
        init!(ModuleRef);
        init!(NestedClass);
        init!(Param);
        init!(Property);
        init!(PropertyMap);
        init!(StandAloneSig);
        init!(TypeDef);
        init!(TypeRef);
        init!(TypeSpec);

        ulong mask = 1;
        for (int i = 0; i < 64; i++, mask <<= 1)
        {
            if (!(validBits & mask))
                continue;

            auto rowCount = peekFront!uint(view);
            view = view[4..$];

            switch (i)
            {
                case 0x00: Module.setRowCount(rowCount); break;
                case 0x01: TypeRef.setRowCount(rowCount); break;
                case 0x02: TypeDef.setRowCount(rowCount); break;
                case 0x04: Field.setRowCount(rowCount); break;
                case 0x06: MethodDef.setRowCount(rowCount); break;
                case 0x08: Param.setRowCount(rowCount); break;
                case 0x09: InterfaceImpl.setRowCount(rowCount); break;
                case 0x0a: MemberRef.setRowCount(rowCount); break;
                case 0x0b: Constant.setRowCount(rowCount); break;
                case 0x0c: CustomAttribute.setRowCount(rowCount); break;
                case 0x0d: FieldMarshal.setRowCount(rowCount); break;
                case 0x0e: DeclSecurity.setRowCount(rowCount); break;
                case 0x0f: ClassLayout.setRowCount(rowCount); break;
                case 0x10: FieldLayout.setRowCount(rowCount); break;
                case 0x11: StandAloneSig.setRowCount(rowCount); break;
                case 0x12: EventMap.setRowCount(rowCount); break;
                case 0x14: Event.setRowCount(rowCount); break;
                case 0x15: PropertyMap.setRowCount(rowCount); break;
                case 0x17: Property.setRowCount(rowCount); break;
                case 0x18: MethodSemantics.setRowCount(rowCount); break;
                case 0x19: MethodImpl.setRowCount(rowCount); break;
                case 0x1a: ModuleRef.setRowCount(rowCount); break;
                case 0x1b: TypeSpec.setRowCount(rowCount); break;
                case 0x1c: ImplMap.setRowCount(rowCount); break;
                case 0x1d: FieldRVA.setRowCount(rowCount); break;
                case 0x20: Assembly.setRowCount(rowCount); break;
                case 0x21: AssemblyProcessor.setRowCount(rowCount); break;
                case 0x22: AssemblyOS.setRowCount(rowCount); break;
                case 0x23: AssemblyRef.setRowCount(rowCount); break;
                case 0x24: AssemblyRefProcessor.setRowCount(rowCount); break;
                case 0x25: AssemblyRefOS.setRowCount(rowCount); break;
                case 0x26: File.setRowCount(rowCount); break;
                case 0x27: ExportedType.setRowCount(rowCount); break;
                case 0x28: ManifestResource.setRowCount(rowCount); break;
                case 0x29: NestedClass.setRowCount(rowCount); break;
                case 0x2a: GenericParam.setRowCount(rowCount); break;
                case 0x2b: MethodSpec.setRowCount(rowCount); break;
                case 0x2c: GenericParamConstraint.setRowCount(rowCount); break;
                default: throw new Exception("Unknown metadata table");
            }
        }

        auto const TypeDefOrRef = compositeIndexSize(TypeDef, TypeRef, TypeSpec);
        auto const HasConstant = compositeIndexSize(Field, Param, Property);
        auto const HasCustomAttribute = compositeIndexSize(MethodDef, Field, TypeRef, TypeDef, Param, InterfaceImpl, MemberRef, Module, Property, Event, StandAloneSig, ModuleRef, TypeSpec, Assembly, AssemblyRef, File, ExportedType, ManifestResource, GenericParam, GenericParamConstraint, MethodSpec);
        auto const HasFieldMarshal = compositeIndexSize(Field, Param);
        auto const HasDeclSecurity = compositeIndexSize(TypeDef, MethodDef, Assembly);
        auto const MemberRefParent = compositeIndexSize(TypeDef, TypeRef, ModuleRef, MethodDef, TypeSpec);
        auto const HasSemantics = compositeIndexSize(Event, Property);
        auto const MethodDefOrRef = compositeIndexSize(MethodDef, MemberRef);
        auto const MemberForwarded = compositeIndexSize(Field, MethodDef);
        auto const Implementation = compositeIndexSize(File, AssemblyRef, ExportedType);
        auto const CustomAttributeType = compositeIndexSize(MethodDef, MemberRef);
        auto const ResolutionScope = compositeIndexSize(Module, ModuleRef, AssemblyRef, TypeRef);
        auto const TypeOrMethodDef = compositeIndexSize(TypeDef, MethodDef);

        Assembly.setColumns(4, 8, 4, blobIndexSize, stringIndexSize, stringIndexSize);
        AssemblyOS.setColumns(4, 4, 4);
        AssemblyProcessor.setColumns(4);
        AssemblyRef.setColumns(8, 4, blobIndexSize, stringIndexSize, stringIndexSize, blobIndexSize);
        AssemblyRefOS.setColumns(4, 4, 4, AssemblyRef.indexSize());
        AssemblyRefProcessor.setColumns(4, AssemblyRef.indexSize());
        ClassLayout.setColumns(2, 4, TypeDef.indexSize());
        Constant.setColumns(2, HasConstant, blobIndexSize);
        CustomAttribute.setColumns(HasCustomAttribute, CustomAttributeType, blobIndexSize);
        DeclSecurity.setColumns(2, HasDeclSecurity, blobIndexSize);
        EventMap.setColumns(TypeDef.indexSize(), Event.indexSize());
        Event.setColumns(2, stringIndexSize, TypeDefOrRef);
        ExportedType.setColumns(4, 4, stringIndexSize, stringIndexSize, Implementation);
        Field.setColumns(2, stringIndexSize, blobIndexSize);
        FieldLayout.setColumns(4, Field.indexSize());
        FieldMarshal.setColumns(HasFieldMarshal, blobIndexSize);
        FieldRVA.setColumns(4, Field.indexSize());
        File.setColumns(4, stringIndexSize, blobIndexSize);
        GenericParam.setColumns(2, 2, TypeOrMethodDef, stringIndexSize);
        GenericParamConstraint.setColumns(GenericParam.indexSize(), TypeDefOrRef);
        ImplMap.setColumns(2, MemberForwarded, stringIndexSize, ModuleRef.indexSize());
        InterfaceImpl.setColumns(TypeDef.indexSize(), TypeDefOrRef);
        ManifestResource.setColumns(4, 4, stringIndexSize, Implementation);
        MemberRef.setColumns(MemberRefParent, stringIndexSize, blobIndexSize);
        MethodDef.setColumns(4, 2, 2, stringIndexSize, blobIndexSize, Param.indexSize());
        MethodImpl.setColumns(TypeDef.indexSize(), MethodDefOrRef, MethodDefOrRef);
        MethodSemantics.setColumns(2, MethodDef.indexSize(), HasSemantics);
        MethodSpec.setColumns(MethodDefOrRef, blobIndexSize);
        Module.setColumns(2, stringIndexSize, guidIndexSize, guidIndexSize, guidIndexSize);
        ModuleRef.setColumns(stringIndexSize);
        NestedClass.setColumns(TypeDef.indexSize(), TypeDef.indexSize());
        Param.setColumns(2, 2, stringIndexSize);
        Property.setColumns(2, stringIndexSize, blobIndexSize);
        PropertyMap.setColumns(TypeDef.indexSize(), Property.indexSize());
        StandAloneSig.setColumns(blobIndexSize);
        TypeDef.setColumns(4, stringIndexSize, stringIndexSize, TypeDefOrRef, Field.indexSize(), MethodDef.indexSize());
        TypeRef.setColumns(ResolutionScope, stringIndexSize, stringIndexSize);
        TypeSpec.setColumns(blobIndexSize);

        Module.parseData(view);
        TypeRef.parseData(view);
        TypeDef.parseData(view);
        Field.parseData(view);
        MethodDef.parseData(view);
        Param.parseData(view);
        InterfaceImpl.parseData(view);
        MemberRef.parseData(view);
        Constant.parseData(view);
        CustomAttribute.parseData(view);
        FieldMarshal.parseData(view);
        DeclSecurity.parseData(view);
        ClassLayout.parseData(view);
        FieldLayout.parseData(view);
        StandAloneSig.parseData(view);
        EventMap.parseData(view);
        Event.parseData(view);
        PropertyMap.parseData(view);
        Property.parseData(view);
        MethodSemantics.parseData(view);
        MethodImpl.parseData(view);
        ModuleRef.parseData(view);
        TypeSpec.parseData(view);
        ImplMap.parseData(view);
        FieldRVA.parseData(view);
        Assembly.parseData(view);
        AssemblyProcessor.parseData(view);
        AssemblyOS.parseData(view);
        AssemblyRef.parseData(view);
        AssemblyRefProcessor.parseData(view);
        AssemblyRefOS.parseData(view);
        File.parseData(view);
        ExportedType.parseData(view);
        ManifestResource.parseData(view);
        NestedClass.parseData(view);
        GenericParam.parseData(view);
        MethodSpec.parseData(view);
        GenericParamConstraint.parseData(view);
    }

    static ImageSectionHeader* sectionFromRVA(ImageSectionHeader* first, ImageSectionHeader* last, uint rva)
    {
        auto p = first;
        while (p < last)
        {
            auto section = *p;
            if (rva >= section.VirtualAddress && rva < section.VirtualAddress + section.VirtualSize)
                return p;
            p++;
        }
        return last;
    }

    static uint offsetFromRVA(ImageSectionHeader section, uint rva)
    {
        return rva - section.VirtualAddress + section.PointerToRawData;
    }

    static uint streamOffset(const(char)[] name)
    {
        uint padding = 4 - name.length % 4;

        if (padding == 0)
        {
            padding = 4;
        }

        return 8 + cast(uint)name.length + padding;
    }

    static bool canStoreCodedIndexWithin2Bytes(uint rowCount, ubyte bits)
    {
        return rowCount < (1 << (16 - bits));
    }

    static ubyte compositeIndexSize(TableBase[] tables ...)
    {
        foreach (table; tables)
        {
            if (!canStoreCodedIndexWithin2Bytes(cast(uint)table.size(), bitsNeeded(cast(ubyte)tables.length)))
                return 4;
        }
        return 2;
    }

    const(char)[] getString(uint offset) const
    {
        return parseNullTerminatedString(strings[offset..$]);
    }

    const(ubyte)[] getBlob(uint offset) const
    {
        auto view = blobs[offset..$];
        ubyte initialByte = view[0];
        uint blobSizeBytes;

        switch (initialByte >> 5)
        {
            case 0:
            case 1:
            case 2:
            case 3:
                blobSizeBytes = 1;
                initialByte &= 0x7f;
                break;

            case 4:
            case 5:
                blobSizeBytes = 2;
                initialByte &= 0x3f;
                break;

            case 6:
                blobSizeBytes = 4;
                initialByte &= 0x1f;
                break;

            default:
                throw new Exception("Invalid blob encoding");
        }

        uint blobSize = initialByte;

        if (blobSizeBytes > 1)
        {
            foreach (b; view[1..blobSizeBytes])
            {
                blobSize = (blobSize << 8) + b;
            }
        }

        return view[blobSizeBytes..blobSizeBytes+blobSize];
    }
}


private ubyte bitsNeeded(uint value) pure
{
    --value;
    ubyte bits = 1;

    while (value >>= 1)
    {
        ++bits;
    }

    return bits;
}

static assert(bitsNeeded(2) == 1);
static assert(bitsNeeded(3) == 2);
static assert(bitsNeeded(4) == 2);
static assert(bitsNeeded(5) == 3);
static assert(bitsNeeded(22) == 5);


private struct StreamRange
{
    uint offset;
    uint size;
}


private T peekFront(T)(const(ubyte)[] data)
{
    assert(data.length >= T.sizeof);

    T t;

    (cast(ubyte*)&t)[0..T.sizeof] = data[0..T.sizeof];

    return t;
}


private const(char)[] parseNullTerminatedString(const(ubyte)[] data)
{
    int i = 0;
    while (i < data.length && data[i] != 0)
        i++;
    if (i == data.length)
        throw new Exception("Missing string terminator");
    return cast(const(char)[])data[0..i];
}


private class Table(TableFormat t) : TableBase, ITableSummary, ITable!t
{
    private string _name;

    this(Database db, string name)
    {
        this.db = db;
        this._name = name;
    }

    override uint size() const
    {
        return super.size();
    }

    override string name() const
    {
        return _name;
    }

    override uint getUint(uint rid, uint column) const
    {
        return getValue!uint(rid, column);
    }

    override ushort getUshort(uint rid, uint column) const
    {
        return getValue!ushort(rid, column);
    }

    override const(char)[] getString(uint offset) const
    {
        return db.getString(offset);
    }

    override const(ubyte)[] getBlob(uint offset) const
    {
        return db.getBlob(offset);
    }
}


private class TableBase
{
    struct Column
    {
        ubyte offset;
        ubyte size;
    }

    Database db;

    private const(ubyte)[] data;
    private uint rowCount;
    private ubyte rowSize;
    private Column[6] columns;

    abstract string name() const;

    uint size() const
    {
        return rowCount;
    }

    private T getValue(T)(uint rid, uint column) const
    {
        if (rid == 0 || rid > size())
        {
            throw new Exception("Invalid row index:" ~ name() ~ "[" ~ rid.to!string ~ "]");
        }

        uint row = rid - 1;
        uint dataSize = columns[column].size;
        assert(dataSize == 1 || dataSize == 2 || dataSize == 4 || dataSize == 8);
        assert(dataSize <= T.sizeof);

        auto rowView = data[row * rowSize..(row+1) * rowSize];
        auto dataView = rowView[columns[column].offset..columns[column].offset+dataSize];

        const(ubyte)* ptr = data.ptr + row * rowSize + columns[column].offset;
        switch (dataSize)
        {
            case 1:
                {
                    ubyte temp = *ptr;
                    return cast(T)temp;
                }
            case 2:
                {
                    ushort temp = *cast(ushort*)ptr;
                    return cast(T)temp;
                }
            case 4:
                {
                    uint temp = *cast(uint*)ptr;
                    return cast(T)temp;
                }
            default:
                {
                    ulong temp = *cast(ulong*)ptr;
                    return cast(T)temp;
                }
        }
    }

    void setRowCount(uint rowCount)
    {
        assert(this.rowCount == 0);
        this.rowCount = rowCount;
    }

    void setColumns(ubyte a, ubyte b = 0, ubyte c = 0, ubyte d = 0, ubyte e = 0, ubyte f = 0)
    {
        assert(a);
        assert(a <= 8);
        assert(b <= 8);
        assert(c <= 8);
        assert(d <= 8);
        assert(e <= 8);
        assert(f <= 8);

        assert(!rowSize);
        rowSize = cast(ubyte)(a + b + c + d + e + f);
        assert(rowSize < ubyte.max);

        columns[0] = Column(0, a);
        if (b) { columns[1] = Column(a, b); }
        if (c) { columns[2] = Column(cast(ubyte)(a + b), c); }
        if (d) { columns[3] = Column(cast(ubyte)(a + b + c), d); }
        if (e) { columns[4] = Column(cast(ubyte)(a + b + c + d), e); }
        if (f) { columns[5] = Column(cast(ubyte)(a + b + c + d + e), f); }
    }

    void parseData(ref const(ubyte)[] view)
    {
        assert(!data);

        if (rowCount)
        {
            assert(rowSize);
            data = view[0..rowCount * rowSize];
            view = view[rowCount * rowSize..$];
        }
    }

    ubyte indexSize() const
    {
        return rowCount < (1 << 16) ? 2 : 4;
    }
}
