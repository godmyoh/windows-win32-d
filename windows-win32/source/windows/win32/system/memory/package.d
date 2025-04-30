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

HANDLE HeapCreate(HEAP_FLAGS flOptions, ulong dwInitialSize, ulong dwMaximumSize);
BOOL HeapDestroy(HANDLE hHeap);
void* HeapAlloc(HANDLE hHeap, HEAP_FLAGS dwFlags, ulong dwBytes);
void* HeapReAlloc(HANDLE hHeap, HEAP_FLAGS dwFlags, void* lpMem, ulong dwBytes);
BOOL HeapFree(HANDLE hHeap, HEAP_FLAGS dwFlags, void* lpMem);
ulong HeapSize(HANDLE hHeap, HEAP_FLAGS dwFlags, const(void)* lpMem);
HANDLE GetProcessHeap();
ulong HeapCompact(HANDLE hHeap, HEAP_FLAGS dwFlags);
BOOL HeapSetInformation(HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, void* HeapInformation, ulong HeapInformationLength);
BOOL HeapValidate(HANDLE hHeap, HEAP_FLAGS dwFlags, const(void)* lpMem);
BOOL HeapSummary(HANDLE hHeap, uint dwFlags, HEAP_SUMMARY* lpSummary);
uint GetProcessHeaps(uint NumberOfHeaps, HANDLE* ProcessHeaps);
BOOL HeapLock(HANDLE hHeap);
BOOL HeapUnlock(HANDLE hHeap);
BOOL HeapWalk(HANDLE hHeap, PROCESS_HEAP_ENTRY* lpEntry);
BOOL HeapQueryInformation(HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, void* HeapInformation, ulong HeapInformationLength, ulong* ReturnLength);
void* VirtualAlloc(void* lpAddress, ulong dwSize, VIRTUAL_ALLOCATION_TYPE flAllocationType, PAGE_PROTECTION_FLAGS flProtect);
BOOL VirtualProtect(void* lpAddress, ulong dwSize, PAGE_PROTECTION_FLAGS flNewProtect, PAGE_PROTECTION_FLAGS* lpflOldProtect);
BOOL VirtualFree(void* lpAddress, ulong dwSize, VIRTUAL_FREE_TYPE dwFreeType);
ulong VirtualQuery(const(void)* lpAddress, MEMORY_BASIC_INFORMATION* lpBuffer, ulong dwLength);
void* VirtualAllocEx(HANDLE hProcess, void* lpAddress, ulong dwSize, VIRTUAL_ALLOCATION_TYPE flAllocationType, PAGE_PROTECTION_FLAGS flProtect);
BOOL VirtualProtectEx(HANDLE hProcess, void* lpAddress, ulong dwSize, PAGE_PROTECTION_FLAGS flNewProtect, PAGE_PROTECTION_FLAGS* lpflOldProtect);
ulong VirtualQueryEx(HANDLE hProcess, const(void)* lpAddress, MEMORY_BASIC_INFORMATION* lpBuffer, ulong dwLength);
HANDLE CreateFileMappingW(HANDLE hFile, SECURITY_ATTRIBUTES* lpFileMappingAttributes, PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, const(wchar)* lpName);
HANDLE OpenFileMappingW(uint dwDesiredAccess, BOOL bInheritHandle, const(wchar)* lpName);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile(HANDLE hFileMappingObject, FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, ulong dwNumberOfBytesToMap);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileEx(HANDLE hFileMappingObject, FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, ulong dwNumberOfBytesToMap, void* lpBaseAddress);
BOOL VirtualFreeEx(HANDLE hProcess, void* lpAddress, ulong dwSize, VIRTUAL_FREE_TYPE dwFreeType);
BOOL FlushViewOfFile(const(void)* lpBaseAddress, ulong dwNumberOfBytesToFlush);
BOOL UnmapViewOfFile(const(MEMORY_MAPPED_VIEW_ADDRESS) lpBaseAddress);
ulong GetLargePageMinimum();
BOOL GetProcessWorkingSetSizeEx(HANDLE hProcess, ulong* lpMinimumWorkingSetSize, ulong* lpMaximumWorkingSetSize, uint* Flags);
BOOL SetProcessWorkingSetSizeEx(HANDLE hProcess, ulong dwMinimumWorkingSetSize, ulong dwMaximumWorkingSetSize, SETPROCESSWORKINGSETSIZEEX_FLAGS Flags);
BOOL VirtualLock(void* lpAddress, ulong dwSize);
BOOL VirtualUnlock(void* lpAddress, ulong dwSize);
uint GetWriteWatch(uint dwFlags, void* lpBaseAddress, ulong dwRegionSize, void** lpAddresses, ulong* lpdwCount, uint* lpdwGranularity);
uint ResetWriteWatch(void* lpBaseAddress, ulong dwRegionSize);
HANDLE CreateMemoryResourceNotification(MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType);
BOOL QueryMemoryResourceNotification(HANDLE ResourceNotificationHandle, BOOL* ResourceState);
BOOL GetSystemFileCacheSize(ulong* lpMinimumFileCacheSize, ulong* lpMaximumFileCacheSize, uint* lpFlags);
BOOL SetSystemFileCacheSize(ulong MinimumFileCacheSize, ulong MaximumFileCacheSize, uint Flags);
HANDLE CreateFileMappingNumaW(HANDLE hFile, SECURITY_ATTRIBUTES* lpFileMappingAttributes, PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, const(wchar)* lpName, uint nndPreferred);
BOOL PrefetchVirtualMemory(HANDLE hProcess, ulong NumberOfEntries, WIN32_MEMORY_RANGE_ENTRY* VirtualAddresses, uint Flags);
HANDLE CreateFileMappingFromApp(HANDLE hFile, SECURITY_ATTRIBUTES* SecurityAttributes, PAGE_PROTECTION_FLAGS PageProtection, ulong MaximumSize, const(wchar)* Name);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileFromApp(HANDLE hFileMappingObject, FILE_MAP DesiredAccess, ulong FileOffset, ulong NumberOfBytesToMap);
BOOL UnmapViewOfFileEx(MEMORY_MAPPED_VIEW_ADDRESS BaseAddress, UNMAP_VIEW_OF_FILE_FLAGS UnmapFlags);
BOOL AllocateUserPhysicalPages(HANDLE hProcess, ulong* NumberOfPages, ulong* PageArray);
BOOL FreeUserPhysicalPages(HANDLE hProcess, ulong* NumberOfPages, ulong* PageArray);
BOOL MapUserPhysicalPages(void* VirtualAddress, ulong NumberOfPages, ulong* PageArray);
BOOL AllocateUserPhysicalPagesNuma(HANDLE hProcess, ulong* NumberOfPages, ulong* PageArray, uint nndPreferred);
void* VirtualAllocExNuma(HANDLE hProcess, void* lpAddress, ulong dwSize, VIRTUAL_ALLOCATION_TYPE flAllocationType, uint flProtect, uint nndPreferred);
BOOL GetMemoryErrorHandlingCapabilities(uint* Capabilities);
void* RegisterBadMemoryNotification(PBAD_MEMORY_CALLBACK_ROUTINE Callback);
BOOL UnregisterBadMemoryNotification(void* RegistrationHandle);
uint OfferVirtualMemory(void* VirtualAddress, ulong Size, OFFER_PRIORITY Priority);
uint ReclaimVirtualMemory(const(void)* VirtualAddress, ulong Size);
uint DiscardVirtualMemory(void* VirtualAddress, ulong Size);
BOOL SetProcessValidCallTargets(HANDLE hProcess, void* VirtualAddress, ulong RegionSize, uint NumberOfOffsets, CFG_CALL_TARGET_INFO* OffsetInformation);
BOOL SetProcessValidCallTargetsForMappedView(HANDLE Process, void* VirtualAddress, ulong RegionSize, uint NumberOfOffsets, CFG_CALL_TARGET_INFO* OffsetInformation, HANDLE Section, ulong ExpectedFileOffset);
void* VirtualAllocFromApp(void* BaseAddress, ulong Size, VIRTUAL_ALLOCATION_TYPE AllocationType, uint Protection);
BOOL VirtualProtectFromApp(void* Address, ulong Size, uint NewProtection, uint* OldProtection);
HANDLE OpenFileMappingFromApp(uint DesiredAccess, BOOL InheritHandle, const(wchar)* Name);
BOOL QueryVirtualMemoryInformation(HANDLE Process, const(void)* VirtualAddress, WIN32_MEMORY_INFORMATION_CLASS MemoryInformationClass, void* MemoryInformation, ulong MemoryInformationSize, ulong* ReturnSize);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileNuma2(HANDLE FileMappingHandle, HANDLE ProcessHandle, ulong Offset, void* BaseAddress, ulong ViewSize, uint AllocationType, uint PageProtection, uint PreferredNode);
BOOL UnmapViewOfFile2(HANDLE Process, MEMORY_MAPPED_VIEW_ADDRESS BaseAddress, UNMAP_VIEW_OF_FILE_FLAGS UnmapFlags);
BOOL VirtualUnlockEx(HANDLE Process, void* Address, ulong Size);
void* VirtualAlloc2(HANDLE Process, void* BaseAddress, ulong Size, VIRTUAL_ALLOCATION_TYPE AllocationType, uint PageProtection, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ParameterCount);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile3(HANDLE FileMapping, HANDLE Process, void* BaseAddress, ulong Offset, ulong ViewSize, VIRTUAL_ALLOCATION_TYPE AllocationType, uint PageProtection, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ParameterCount);
void* VirtualAlloc2FromApp(HANDLE Process, void* BaseAddress, ulong Size, VIRTUAL_ALLOCATION_TYPE AllocationType, uint PageProtection, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ParameterCount);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile3FromApp(HANDLE FileMapping, HANDLE Process, void* BaseAddress, ulong Offset, ulong ViewSize, VIRTUAL_ALLOCATION_TYPE AllocationType, uint PageProtection, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ParameterCount);
HANDLE CreateFileMapping2(HANDLE File, SECURITY_ATTRIBUTES* SecurityAttributes, uint DesiredAccess, PAGE_PROTECTION_FLAGS PageProtection, uint AllocationAttributes, ulong MaximumSize, const(wchar)* Name, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ParameterCount);
BOOL AllocateUserPhysicalPages2(HANDLE ObjectHandle, ulong* NumberOfPages, ulong* PageArray, MEM_EXTENDED_PARAMETER* ExtendedParameters, uint ExtendedParameterCount);
HANDLE OpenDedicatedMemoryPartition(HANDLE Partition, ulong DedicatedMemoryTypeId, uint DesiredAccess, BOOL InheritHandle);
BOOL QueryPartitionInformation(HANDLE Partition, WIN32_MEMORY_PARTITION_INFORMATION_CLASS PartitionInformationClass, void* PartitionInformation, uint PartitionInformationLength);
ulong RtlCompareMemory(const(void)* Source1, const(void)* Source2, ulong Length);
uint RtlCrc32(const(void)* Buffer, ulong Size, uint InitialCrc);
ulong RtlCrc64(const(void)* Buffer, ulong Size, ulong InitialCrc);
BOOLEAN RtlIsZeroMemory(void* Buffer, ulong Length);
HGLOBAL GlobalAlloc(GLOBAL_ALLOC_FLAGS uFlags, ulong dwBytes);
HGLOBAL GlobalReAlloc(HGLOBAL hMem, ulong dwBytes, uint uFlags);
ulong GlobalSize(HGLOBAL hMem);
BOOL GlobalUnlock(HGLOBAL hMem);
void* GlobalLock(HGLOBAL hMem);
uint GlobalFlags(HGLOBAL hMem);
HGLOBAL GlobalHandle(const(void)* pMem);
HLOCAL LocalAlloc(LOCAL_ALLOC_FLAGS uFlags, ulong uBytes);
HLOCAL LocalReAlloc(HLOCAL hMem, ulong uBytes, uint uFlags);
void* LocalLock(HLOCAL hMem);
HLOCAL LocalHandle(const(void)* pMem);
BOOL LocalUnlock(HLOCAL hMem);
ulong LocalSize(HLOCAL hMem);
uint LocalFlags(HLOCAL hMem);
HANDLE CreateFileMappingA(HANDLE hFile, SECURITY_ATTRIBUTES* lpFileMappingAttributes, PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, const(char)* lpName);
HANDLE CreateFileMappingNumaA(HANDLE hFile, SECURITY_ATTRIBUTES* lpFileMappingAttributes, PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, const(char)* lpName, uint nndPreferred);
HANDLE OpenFileMappingA(uint dwDesiredAccess, BOOL bInheritHandle, const(char)* lpName);
MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileExNuma(HANDLE hFileMappingObject, FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, ulong dwNumberOfBytesToMap, void* lpBaseAddress, uint nndPreferred);
BOOL IsBadReadPtr(const(void)* lp, ulong ucb);
BOOL IsBadWritePtr(void* lp, ulong ucb);
BOOL IsBadCodePtr(FARPROC lpfn);
BOOL IsBadStringPtrA(const(char)* lpsz, ulong ucchMax);
BOOL IsBadStringPtrW(const(wchar)* lpsz, ulong ucchMax);
BOOL MapUserPhysicalPagesScatter(void** VirtualAddresses, ulong NumberOfPages, ulong* PageArray);
BOOL AddSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
BOOL RemoveSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
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
        struct Block
        {
            HANDLE hMem;
            uint[3] dwReserved;
        }
        struct Region
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

alias PSECURE_MEMORY_CACHE_CALLBACK = BOOLEAN function(void* Addr, ulong Range);
