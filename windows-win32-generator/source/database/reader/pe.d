module database.reader.pe;


struct ImageDosHeader
{
    ushort e_signature;
    ushort e_cblp;
    ushort e_cp;
    ushort e_crlc;
    ushort e_cparhdr;
    ushort e_minalloc;
    ushort e_maxalloc;
    ushort e_ss;
    ushort e_sp;
    ushort e_csum;
    ushort e_ip;
    ushort e_cs;
    ushort e_lfarlc;
    ushort e_ovno;
    ushort[4] e_res;
    ushort e_oemid;
    ushort e_oeminfo;
    ushort[10] e_res2;
    int  e_lfanew;
}


struct ImageFileHeader
{
    ushort Machine;
    ushort NumberOfSections;
    uint TimeDateStamp;
    uint PointerToSymbolTable;
    uint NumberOfSymbols;
    ushort SizeOfOptionalHeader;
    ushort Characteristics;
}


struct ImageDataDirectory
{
    uint VirtualAddress;
    uint Size;
}


struct ImageOptionalHeader32
{
    ushort Magic;
    ubyte MajorLinkerVersion;
    ubyte MinorLinkerVersion;
    uint SizeOfCode;
    uint SizeOfInitializedData;
    uint SizeOfUninitializedData;
    uint AddressOfEntryPoint;
    uint BaseOfCode;
    uint BaseOfData;
    uint ImageBase;
    uint SectionAlignment;
    uint FileAlignment;
    ushort MajorOperatingSystemVersion;
    ushort MinorOperatingSystemVersion;
    ushort MajorImageVersion;
    ushort MinorImageVersion;
    ushort MajorSubsystemVersion;
    ushort MinorSubsystemVersion;
    uint Win32VersionValue;
    uint SizeOfImage;
    uint SizeOfHeaders;
    uint CheckSum;
    ushort Subsystem;
    ushort DllCharacteristics;
    uint SizeOfStackReserve;
    uint SizeOfStackCommit;
    uint SizeOfHeapReserve;
    uint SizeOfHeapCommit;
    uint LoaderFlags;
    uint NumberOfRvaAndSizes;
    ImageDataDirectory[16] DataDirectory;
}


struct ImageNtHeaders32
{
    uint Signature;
    ImageFileHeader FileHeader;
    ImageOptionalHeader32 OptionalHeader;
}


struct ImageOptionalHeader32Plus
{
    ushort Magic;
    ubyte MajorLinkerVersion;
    ubyte MinorLinkerVersion;
    uint SizeOfCode;
    uint SizeOfInitializedData;
    uint SizeOfUninitializedData;
    uint AddressOfEntryPoint;
    uint BaseOfCode;
    ulong ImageBase;
    uint SectionAlignment;
    uint FileAlignment;
    ushort MajorOperatingSystemVersion;
    ushort MinorOperatingSystemVersion;
    ushort MajorImageVersion;
    ushort MinorImageVersion;
    ushort MajorSubsystemVersion;
    ushort MinorSubsystemVersion;
    uint Win32VersionValue;
    uint SizeOfImage;
    uint SizeOfHeaders;
    uint CheckSum;
    ushort Subsystem;
    ushort DllCharacteristics;
    ulong SizeOfStackReserve;
    ulong SizeOfStackCommit;
    ulong SizeOfHeapReserve;
    ulong SizeOfHeapCommit;
    uint LoaderFlags;
    uint NumberOfRvaAndSizes;
    ImageDataDirectory[16] DataDirectory;
}


struct ImageNtHeaders32Plus
{
    uint Signature;
    ImageFileHeader FileHeader;
    ImageOptionalHeader32Plus OptionalHeader;
}


struct ImageSectionHeader {
    ubyte[8] Name; // IMAGE_SIZEOF_SHORT_NAME
    union
    {
        uint PhysicalAddress;
        uint VirtualSize;
    }
    uint VirtualAddress;
    uint SizeOfRawData;
    uint PointerToRawData;
    uint PointerToRelocations;
    uint PointerToLinenumbers;
    ushort NumberOfRelocations;
    ushort NumberOfLinenumbers;
    uint Characteristics;
}


struct ImageCor20Header
{
    uint cb;
    ushort MajorRuntimeVersion;
    ushort MinorRuntimeVersion;
    ImageDataDirectory MetaData;
    uint Flags;
    union
    {
        uint EntryPointToken;
        uint EntryPointRVA;
    }
    ImageDataDirectory Resources;
    ImageDataDirectory StrongNameSignature;
    ImageDataDirectory CodeManagerTable;
    ImageDataDirectory VTableFixups;
    ImageDataDirectory ExportAddressTableJumps;
    ImageDataDirectory ManagedNativeHeader;
}
