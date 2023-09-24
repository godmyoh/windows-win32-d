module windows.win32.system.memory;

import windows.win32.foundation : BOOL, BOOLEAN, FARPROC, HANDLE, HGLOBAL, HLOCAL, PSTR, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

alias SECTION_FLAGS = uint;
enum : uint
{
    SECTION_ALL_ACCESS           = 0x000f001f,
    SECTION_QUERY                = 0x00000001,
    SECTION_MAP_WRITE            = 0x00000002,
    SECTION_MAP_READ             = 0x00000004,
    SECTION_MAP_EXECUTE          = 0x00000008,
    SECTION_EXTEND_SIZE          = 0x00000010,
    SECTION_MAP_EXECUTE_EXPLICIT = 0x00000020,
}

alias FILE_MAP = uint;
enum : uint
{
    FILE_MAP_WRITE           = 0x00000002,
    FILE_MAP_READ            = 0x00000004,
    FILE_MAP_ALL_ACCESS      = 0x000f001f,
    FILE_MAP_EXECUTE         = 0x00000020,
    FILE_MAP_COPY            = 0x00000001,
    FILE_MAP_RESERVE         = 0x80000000,
    FILE_MAP_TARGETS_INVALID = 0x40000000,
    FILE_MAP_LARGE_PAGES     = 0x20000000,
}

alias HEAP_FLAGS = uint;
enum : uint
{
    HEAP_NONE                     = 0x00000000,
    HEAP_NO_SERIALIZE             = 0x00000001,
    HEAP_GROWABLE                 = 0x00000002,
    HEAP_GENERATE_EXCEPTIONS      = 0x00000004,
    HEAP_ZERO_MEMORY              = 0x00000008,
    HEAP_REALLOC_IN_PLACE_ONLY    = 0x00000010,
    HEAP_TAIL_CHECKING_ENABLED    = 0x00000020,
    HEAP_FREE_CHECKING_ENABLED    = 0x00000040,
    HEAP_DISABLE_COALESCE_ON_FREE = 0x00000080,
    HEAP_CREATE_ALIGN_16          = 0x00010000,
    HEAP_CREATE_ENABLE_TRACING    = 0x00020000,
    HEAP_CREATE_ENABLE_EXECUTE    = 0x00040000,
    HEAP_MAXIMUM_TAG              = 0x00000fff,
    HEAP_PSEUDO_TAG_FLAG          = 0x00008000,
    HEAP_TAG_SHIFT                = 0x00000012,
    HEAP_CREATE_SEGMENT_HEAP      = 0x00000100,
    HEAP_CREATE_HARDENED          = 0x00000200,
}

alias PAGE_PROTECTION_FLAGS = uint;
enum : uint
{
    PAGE_NOACCESS                   = 0x00000001,
    PAGE_READONLY                   = 0x00000002,
    PAGE_READWRITE                  = 0x00000004,
    PAGE_WRITECOPY                  = 0x00000008,
    PAGE_EXECUTE                    = 0x00000010,
    PAGE_EXECUTE_READ               = 0x00000020,
    PAGE_EXECUTE_READWRITE          = 0x00000040,
    PAGE_EXECUTE_WRITECOPY          = 0x00000080,
    PAGE_GUARD                      = 0x00000100,
    PAGE_NOCACHE                    = 0x00000200,
    PAGE_WRITECOMBINE               = 0x00000400,
    PAGE_GRAPHICS_NOACCESS          = 0x00000800,
    PAGE_GRAPHICS_READONLY          = 0x00001000,
    PAGE_GRAPHICS_READWRITE         = 0x00002000,
    PAGE_GRAPHICS_EXECUTE           = 0x00004000,
    PAGE_GRAPHICS_EXECUTE_READ      = 0x00008000,
    PAGE_GRAPHICS_EXECUTE_READWRITE = 0x00010000,
    PAGE_GRAPHICS_COHERENT          = 0x00020000,
    PAGE_GRAPHICS_NOCACHE           = 0x00040000,
    PAGE_ENCLAVE_THREAD_CONTROL     = 0x80000000,
    PAGE_REVERT_TO_FILE_MAP         = 0x80000000,
    PAGE_TARGETS_NO_UPDATE          = 0x40000000,
    PAGE_TARGETS_INVALID            = 0x40000000,
    PAGE_ENCLAVE_UNVALIDATED        = 0x20000000,
    PAGE_ENCLAVE_MASK               = 0x10000000,
    PAGE_ENCLAVE_DECOMMIT           = 0x10000000,
    PAGE_ENCLAVE_SS_FIRST           = 0x10000001,
    PAGE_ENCLAVE_SS_REST            = 0x10000002,
    SEC_PARTITION_OWNER_HANDLE      = 0x00040000,
    SEC_64K_PAGES                   = 0x00080000,
    SEC_FILE                        = 0x00800000,
    SEC_IMAGE                       = 0x01000000,
    SEC_PROTECTED_IMAGE             = 0x02000000,
    SEC_RESERVE                     = 0x04000000,
    SEC_COMMIT                      = 0x08000000,
    SEC_NOCACHE                     = 0x10000000,
    SEC_WRITECOMBINE                = 0x40000000,
    SEC_LARGE_PAGES                 = 0x80000000,
    SEC_IMAGE_NO_EXECUTE            = 0x11000000,
}

alias UNMAP_VIEW_OF_FILE_FLAGS = uint;
enum : uint
{
    MEM_UNMAP_NONE                 = 0x00000000,
    MEM_UNMAP_WITH_TRANSIENT_BOOST = 0x00000001,
    MEM_PRESERVE_PLACEHOLDER       = 0x00000002,
}

alias VIRTUAL_FREE_TYPE = uint;
enum : uint
{
    MEM_DECOMMIT = 0x00004000,
    MEM_RELEASE  = 0x00008000,
}

alias VIRTUAL_ALLOCATION_TYPE = uint;
enum : uint
{
    MEM_COMMIT              = 0x00001000,
    MEM_RESERVE             = 0x00002000,
    MEM_RESET               = 0x00080000,
    MEM_RESET_UNDO          = 0x01000000,
    MEM_REPLACE_PLACEHOLDER = 0x00004000,
    MEM_LARGE_PAGES         = 0x20000000,
    MEM_RESERVE_PLACEHOLDER = 0x00040000,
    MEM_FREE                = 0x00010000,
}

alias LOCAL_ALLOC_FLAGS = uint;
enum : uint
{
    LHND          = 0x00000042,
    LMEM_FIXED    = 0x00000000,
    LMEM_MOVEABLE = 0x00000002,
    LMEM_ZEROINIT = 0x00000040,
    LPTR          = 0x00000040,
    NONZEROLHND   = 0x00000002,
    NONZEROLPTR   = 0x00000000,
}

alias GLOBAL_ALLOC_FLAGS = uint;
enum : uint
{
    GHND          = 0x00000042,
    GMEM_FIXED    = 0x00000000,
    GMEM_MOVEABLE = 0x00000002,
    GMEM_ZEROINIT = 0x00000040,
    GPTR          = 0x00000040,
}

alias PAGE_TYPE = uint;
enum : uint
{
    MEM_PRIVATE = 0x00020000,
    MEM_MAPPED  = 0x00040000,
    MEM_IMAGE   = 0x01000000,
}

alias SETPROCESSWORKINGSETSIZEEX_FLAGS = uint;
enum : uint
{
    QUOTA_LIMITS_HARDWS_MIN_ENABLE  = 0x00000001,
    QUOTA_LIMITS_HARDWS_MIN_DISABLE = 0x00000002,
    QUOTA_LIMITS_HARDWS_MAX_ENABLE  = 0x00000004,
    QUOTA_LIMITS_HARDWS_MAX_DISABLE = 0x00000008,
}

HANDLE HeapCreate(HEAP_FLAGS, ulong, ulong);
BOOL HeapDestroy(HANDLE);
void* HeapAlloc(HANDLE, HEAP_FLAGS, ulong);
void* HeapReAlloc(HANDLE, HEAP_FLAGS, void*, ulong);
BOOL HeapFree(HANDLE, HEAP_FLAGS, void*);
ulong HeapSize(HANDLE, HEAP_FLAGS, const(void)*);
HANDLE GetProcessHeap();
ulong HeapCompact(HANDLE, HEAP_FLAGS);
BOOL HeapSetInformation(HANDLE, HEAP_INFORMATION_CLASS, void*, ulong);
BOOL HeapValidate(HANDLE, HEAP_FLAGS, const(void)*);
BOOL HeapSummary(HANDLE, uint, HEAP_SUMMARY*);
uint GetProcessHeaps(uint, HANDLE*);
BOOL HeapLock(HANDLE);
BOOL HeapUnlock(HANDLE);
BOOL HeapWalk(HANDLE, PROCESS_HEAP_ENTRY*);
BOOL HeapQueryInformation(HANDLE, HEAP_INFORMATION_CLASS, void*, ulong, ulong*);
void* VirtualAlloc(void*, ulong, VIRTUAL_ALLOCATION_TYPE, PAGE_PROTECTION_FLAGS);
BOOL VirtualProtect(void*, ulong, PAGE_PROTECTION_FLAGS, PAGE_PROTECTION_FLAGS*);
BOOL VirtualFree(void*, ulong, VIRTUAL_FREE_TYPE);
ulong VirtualQuery(const(void)*, MEMORY_BASIC_INFORMATION*, ulong);
void* VirtualAllocEx(HANDLE, void*, ulong, VIRTUAL_ALLOCATION_TYPE, PAGE_PROTECTION_FLAGS);
BOOL VirtualProtectEx(HANDLE, void*, ulong, PAGE_PROTECTION_FLAGS, PAGE_PROTECTION_FLAGS*);
ulong VirtualQueryEx(HANDLE, const(void)*, MEMORY_BASIC_INFORMATION*, ulong);
HANDLE CreateFileMappingW(HANDLE, SECURITY_ATTRIBUTES*, PAGE_PROTECTION_FLAGS, uint, uint, const(wchar)*);
HANDLE OpenFileMappingW(uint, BOOL, const(wchar)*);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile(HANDLE, FILE_MAP, uint, uint, ulong);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileEx(HANDLE, FILE_MAP, uint, uint, ulong, void*);
BOOL VirtualFreeEx(HANDLE, void*, ulong, VIRTUAL_FREE_TYPE);
BOOL FlushViewOfFile(const(void)*, ulong);
BOOL UnmapViewOfFile(const(MEMORY_MAPPED_VIEW_ADDRESS));
ulong GetLargePageMinimum();
BOOL GetProcessWorkingSetSizeEx(HANDLE, ulong*, ulong*, uint*);
BOOL SetProcessWorkingSetSizeEx(HANDLE, ulong, ulong, SETPROCESSWORKINGSETSIZEEX_FLAGS);
BOOL VirtualLock(void*, ulong);
BOOL VirtualUnlock(void*, ulong);
uint GetWriteWatch(uint, void*, ulong, void**, ulong*, uint*);
uint ResetWriteWatch(void*, ulong);
HANDLE CreateMemoryResourceNotification(MEMORY_RESOURCE_NOTIFICATION_TYPE);
BOOL QueryMemoryResourceNotification(HANDLE, BOOL*);
BOOL GetSystemFileCacheSize(ulong*, ulong*, uint*);
BOOL SetSystemFileCacheSize(ulong, ulong, uint);
HANDLE CreateFileMappingNumaW(HANDLE, SECURITY_ATTRIBUTES*, PAGE_PROTECTION_FLAGS, uint, uint, const(wchar)*, uint);
BOOL PrefetchVirtualMemory(HANDLE, ulong, WIN32_MEMORY_RANGE_ENTRY*, uint);
HANDLE CreateFileMappingFromApp(HANDLE, SECURITY_ATTRIBUTES*, PAGE_PROTECTION_FLAGS, ulong, const(wchar)*);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileFromApp(HANDLE, FILE_MAP, ulong, ulong);
BOOL UnmapViewOfFileEx(MEMORY_MAPPED_VIEW_ADDRESS, UNMAP_VIEW_OF_FILE_FLAGS);
BOOL AllocateUserPhysicalPages(HANDLE, ulong*, ulong*);
BOOL FreeUserPhysicalPages(HANDLE, ulong*, ulong*);
BOOL MapUserPhysicalPages(void*, ulong, ulong*);
BOOL AllocateUserPhysicalPagesNuma(HANDLE, ulong*, ulong*, uint);
void* VirtualAllocExNuma(HANDLE, void*, ulong, VIRTUAL_ALLOCATION_TYPE, uint, uint);
BOOL GetMemoryErrorHandlingCapabilities(uint*);
void* RegisterBadMemoryNotification(PBAD_MEMORY_CALLBACK_ROUTINE);
BOOL UnregisterBadMemoryNotification(void*);
uint OfferVirtualMemory(void*, ulong, OFFER_PRIORITY);
uint ReclaimVirtualMemory(const(void)*, ulong);
uint DiscardVirtualMemory(void*, ulong);
BOOL SetProcessValidCallTargets(HANDLE, void*, ulong, uint, CFG_CALL_TARGET_INFO*);
BOOL SetProcessValidCallTargetsForMappedView(HANDLE, void*, ulong, uint, CFG_CALL_TARGET_INFO*, HANDLE, ulong);
void* VirtualAllocFromApp(void*, ulong, VIRTUAL_ALLOCATION_TYPE, uint);
BOOL VirtualProtectFromApp(void*, ulong, uint, uint*);
HANDLE OpenFileMappingFromApp(uint, BOOL, const(wchar)*);
BOOL QueryVirtualMemoryInformation(HANDLE, const(void)*, WIN32_MEMORY_INFORMATION_CLASS, void*, ulong, ulong*);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileNuma2(HANDLE, HANDLE, ulong, void*, ulong, uint, uint, uint);
BOOL UnmapViewOfFile2(HANDLE, MEMORY_MAPPED_VIEW_ADDRESS, UNMAP_VIEW_OF_FILE_FLAGS);
BOOL VirtualUnlockEx(HANDLE, void*, ulong);
void* VirtualAlloc2(HANDLE, void*, ulong, VIRTUAL_ALLOCATION_TYPE, uint, MEM_EXTENDED_PARAMETER*, uint);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile3(HANDLE, HANDLE, void*, ulong, ulong, VIRTUAL_ALLOCATION_TYPE, uint, MEM_EXTENDED_PARAMETER*, uint);
void* VirtualAlloc2FromApp(HANDLE, void*, ulong, VIRTUAL_ALLOCATION_TYPE, uint, MEM_EXTENDED_PARAMETER*, uint);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile3FromApp(HANDLE, HANDLE, void*, ulong, ulong, VIRTUAL_ALLOCATION_TYPE, uint, MEM_EXTENDED_PARAMETER*, uint);
HANDLE CreateFileMapping2(HANDLE, SECURITY_ATTRIBUTES*, uint, PAGE_PROTECTION_FLAGS, uint, ulong, const(wchar)*, MEM_EXTENDED_PARAMETER*, uint);
BOOL AllocateUserPhysicalPages2(HANDLE, ulong*, ulong*, MEM_EXTENDED_PARAMETER*, uint);
HANDLE OpenDedicatedMemoryPartition(HANDLE, ulong, uint, BOOL);
BOOL QueryPartitionInformation(HANDLE, WIN32_MEMORY_PARTITION_INFORMATION_CLASS, void*, uint);
ulong RtlCompareMemory(const(void)*, const(void)*, ulong);
uint RtlCrc32(const(void)*, ulong, uint);
ulong RtlCrc64(const(void)*, ulong, ulong);
BOOLEAN RtlIsZeroMemory(void*, ulong);
HGLOBAL GlobalAlloc(GLOBAL_ALLOC_FLAGS, ulong);
HGLOBAL GlobalReAlloc(HGLOBAL, ulong, uint);
ulong GlobalSize(HGLOBAL);
BOOL GlobalUnlock(HGLOBAL);
void* GlobalLock(HGLOBAL);
uint GlobalFlags(HGLOBAL);
HGLOBAL GlobalHandle(const(void)*);
HLOCAL LocalAlloc(LOCAL_ALLOC_FLAGS, ulong);
HLOCAL LocalReAlloc(HLOCAL, ulong, uint);
void* LocalLock(HLOCAL);
HLOCAL LocalHandle(const(void)*);
BOOL LocalUnlock(HLOCAL);
ulong LocalSize(HLOCAL);
uint LocalFlags(HLOCAL);
HANDLE CreateFileMappingA(HANDLE, SECURITY_ATTRIBUTES*, PAGE_PROTECTION_FLAGS, uint, uint, const(char)*);
HANDLE CreateFileMappingNumaA(HANDLE, SECURITY_ATTRIBUTES*, PAGE_PROTECTION_FLAGS, uint, uint, const(char)*, uint);
HANDLE OpenFileMappingA(uint, BOOL, const(char)*);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileExNuma(HANDLE, FILE_MAP, uint, uint, ulong, void*, uint);
BOOL IsBadReadPtr(const(void)*, ulong);
BOOL IsBadWritePtr(void*, ulong);
BOOL IsBadCodePtr(FARPROC);
BOOL IsBadStringPtrA(const(char)*, ulong);
BOOL IsBadStringPtrW(const(wchar)*, ulong);
BOOL MapUserPhysicalPagesScatter(void**, ulong, ulong*);
BOOL AddSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK);
BOOL RemoveSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK);
enum FILE_CACHE_MAX_HARD_ENABLE = 0x00000001;
enum FILE_CACHE_MAX_HARD_DISABLE = 0x00000002;
enum FILE_CACHE_MIN_HARD_ENABLE = 0x00000004;
enum FILE_CACHE_MIN_HARD_DISABLE = 0x00000008;
enum MEHC_PATROL_SCRUBBER_PRESENT = 0x00000001;
alias MEMORY_MAPPED_VIEW_ADDRESS = void*;
alias AtlThunkData_t = long;
struct PROCESS_HEAP_ENTRY
{
    void* lpData;
    uint cbData;
    ubyte cbOverhead;
    ubyte iRegionIndex;
    ushort wFlags;
    union
    {
        struct _Block_e__Struct
        {
            HANDLE hMem;
            uint[3] dwReserved;
        }
        struct _Region_e__Struct
        {
            uint dwCommittedSize;
            uint dwUnCommittedSize;
            void* lpFirstBlock;
            void* lpLastBlock;
        }
    }
}
struct HEAP_SUMMARY
{
    uint cb;
    ulong cbAllocated;
    ulong cbCommitted;
    ulong cbReserved;
    ulong cbMaxReserve;
}
alias MEMORY_RESOURCE_NOTIFICATION_TYPE = int;
enum : int
{
    LowMemoryResourceNotification  = 0x00000000,
    HighMemoryResourceNotification = 0x00000001,
}

struct WIN32_MEMORY_RANGE_ENTRY
{
    void* VirtualAddress;
    ulong NumberOfBytes;
}
alias PBAD_MEMORY_CALLBACK_ROUTINE = void function();
alias OFFER_PRIORITY = int;
enum : int
{
    VmOfferPriorityVeryLow     = 0x00000001,
    VmOfferPriorityLow         = 0x00000002,
    VmOfferPriorityBelowNormal = 0x00000003,
    VmOfferPriorityNormal      = 0x00000004,
}

alias WIN32_MEMORY_INFORMATION_CLASS = int;
enum : int
{
    MemoryRegionInfo = 0x00000000,
}

struct WIN32_MEMORY_REGION_INFORMATION
{
    void* AllocationBase;
    uint AllocationProtect;
    union
    {
        uint Flags;
        struct
        {
            uint _bitfield0;
        }
    }
    ulong RegionSize;
    ulong CommitSize;
}
alias WIN32_MEMORY_PARTITION_INFORMATION_CLASS = int;
enum : int
{
    MemoryPartitionInfo                = 0x00000000,
    MemoryPartitionDedicatedMemoryInfo = 0x00000001,
}

struct WIN32_MEMORY_PARTITION_INFORMATION
{
    uint Flags;
    uint NumaNode;
    uint Channel;
    uint NumberOfNumaNodes;
    ulong ResidentAvailablePages;
    ulong CommittedPages;
    ulong CommitLimit;
    ulong PeakCommitment;
    ulong TotalNumberOfPages;
    ulong AvailablePages;
    ulong ZeroPages;
    ulong FreePages;
    ulong StandbyPages;
    ulong[16] Reserved;
    ulong MaximumCommitLimit;
    ulong Reserved2;
    uint PartitionId;
}
struct MEMORY_BASIC_INFORMATION
{
    void* BaseAddress;
    void* AllocationBase;
    PAGE_PROTECTION_FLAGS AllocationProtect;
    ushort PartitionId;
    ulong RegionSize;
    VIRTUAL_ALLOCATION_TYPE State;
    PAGE_PROTECTION_FLAGS Protect;
    PAGE_TYPE Type;
}
/+ [CONFLICTED] struct MEMORY_BASIC_INFORMATION
{
    void* BaseAddress;
    void* AllocationBase;
    PAGE_PROTECTION_FLAGS AllocationProtect;
    ulong RegionSize;
    VIRTUAL_ALLOCATION_TYPE State;
    PAGE_PROTECTION_FLAGS Protect;
    PAGE_TYPE Type;
}
+/
struct MEMORY_BASIC_INFORMATION32
{
    uint BaseAddress;
    uint AllocationBase;
    PAGE_PROTECTION_FLAGS AllocationProtect;
    uint RegionSize;
    VIRTUAL_ALLOCATION_TYPE State;
    PAGE_PROTECTION_FLAGS Protect;
    PAGE_TYPE Type;
}
struct MEMORY_BASIC_INFORMATION64
{
    ulong BaseAddress;
    ulong AllocationBase;
    PAGE_PROTECTION_FLAGS AllocationProtect;
    uint __alignment1;
    ulong RegionSize;
    VIRTUAL_ALLOCATION_TYPE State;
    PAGE_PROTECTION_FLAGS Protect;
    PAGE_TYPE Type;
    uint __alignment2;
}
struct CFG_CALL_TARGET_INFO
{
    ulong Offset;
    ulong Flags;
}
struct MEM_ADDRESS_REQUIREMENTS
{
    void* LowestStartingAddress;
    void* HighestEndingAddress;
    ulong Alignment;
}
alias MEM_EXTENDED_PARAMETER_TYPE = int;
enum : int
{
    MemExtendedParameterInvalidType         = 0x00000000,
    MemExtendedParameterAddressRequirements = 0x00000001,
    MemExtendedParameterNumaNode            = 0x00000002,
    MemExtendedParameterPartitionHandle     = 0x00000003,
    MemExtendedParameterUserPhysicalHandle  = 0x00000004,
    MemExtendedParameterAttributeFlags      = 0x00000005,
    MemExtendedParameterImageMachine        = 0x00000006,
    MemExtendedParameterMax                 = 0x00000007,
}

struct MEM_EXTENDED_PARAMETER
{
    struct
    {
        ulong _bitfield0;
    }
    union
    {
        ulong ULong64;
        void* Pointer;
        ulong Size;
        HANDLE Handle;
        uint ULong;
    }
}
alias MEM_DEDICATED_ATTRIBUTE_TYPE = int;
enum : int
{
    MemDedicatedAttributeReadBandwidth  = 0x00000000,
    MemDedicatedAttributeReadLatency    = 0x00000001,
    MemDedicatedAttributeWriteBandwidth = 0x00000002,
    MemDedicatedAttributeWriteLatency   = 0x00000003,
    MemDedicatedAttributeMax            = 0x00000004,
}

alias MEM_SECTION_EXTENDED_PARAMETER_TYPE = int;
enum : int
{
    MemSectionExtendedParameterInvalidType       = 0x00000000,
    MemSectionExtendedParameterUserPhysicalFlags = 0x00000001,
    MemSectionExtendedParameterNumaNode          = 0x00000002,
    MemSectionExtendedParameterSigningLevel      = 0x00000003,
    MemSectionExtendedParameterMax               = 0x00000004,
}

struct MEMORY_PARTITION_DEDICATED_MEMORY_ATTRIBUTE
{
    MEM_DEDICATED_ATTRIBUTE_TYPE Type;
    uint Reserved;
    ulong Value;
}
struct MEMORY_PARTITION_DEDICATED_MEMORY_INFORMATION
{
    uint NextEntryOffset;
    uint SizeOfInformation;
    uint Flags;
    uint AttributesOffset;
    uint AttributeCount;
    uint Reserved;
    ulong TypeId;
}
alias HEAP_INFORMATION_CLASS = int;
enum : int
{
    HeapCompatibilityInformation      = 0x00000000,
    HeapEnableTerminationOnCorruption = 0x00000001,
    HeapOptimizeResources             = 0x00000003,
    HeapTag                           = 0x00000007,
}

alias PSECURE_MEMORY_CACHE_CALLBACK = BOOLEAN function(void*, ulong);
