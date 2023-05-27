module windows.win32.system.diagnostics.processsnapshotting;

import windows.win32.foundation : BOOL, FILETIME, HANDLE, PWSTR;
import windows.win32.system.diagnostics.debug_ : CONTEXT;
import windows.win32.system.memory : MEMORY_BASIC_INFORMATION;

version (Windows):
extern (Windows):

uint PssCaptureSnapshot(HANDLE, PSS_CAPTURE_FLAGS, uint, HPSS*);
uint PssFreeSnapshot(HANDLE, HPSS);
uint PssQuerySnapshot(HPSS, PSS_QUERY_INFORMATION_CLASS, void*, uint);
uint PssWalkSnapshot(HPSS, PSS_WALK_INFORMATION_CLASS, HPSSWALK, void*, uint);
uint PssDuplicateSnapshot(HANDLE, HPSS, HANDLE, HPSS*, PSS_DUPLICATE_FLAGS);
uint PssWalkMarkerCreate(const(PSS_ALLOCATOR)*, HPSSWALK*);
uint PssWalkMarkerFree(HPSSWALK);
uint PssWalkMarkerGetPosition(HPSSWALK, ulong*);
uint PssWalkMarkerSetPosition(HPSSWALK, ulong);
uint PssWalkMarkerSeekToBeginning(HPSSWALK);
enum PSS_PERF_RESOLUTION = 0x000f4240;
alias HPSS = void*;
alias HPSSWALK = void*;
alias PSS_HANDLE_FLAGS = int;
enum : int
{
    PSS_HANDLE_NONE                           = 0x00000000,
    PSS_HANDLE_HAVE_TYPE                      = 0x00000001,
    PSS_HANDLE_HAVE_NAME                      = 0x00000002,
    PSS_HANDLE_HAVE_BASIC_INFORMATION         = 0x00000004,
    PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION = 0x00000008,
}

alias PSS_OBJECT_TYPE = int;
enum : int
{
    PSS_OBJECT_TYPE_UNKNOWN   = 0x00000000,
    PSS_OBJECT_TYPE_PROCESS   = 0x00000001,
    PSS_OBJECT_TYPE_THREAD    = 0x00000002,
    PSS_OBJECT_TYPE_MUTANT    = 0x00000003,
    PSS_OBJECT_TYPE_EVENT     = 0x00000004,
    PSS_OBJECT_TYPE_SECTION   = 0x00000005,
    PSS_OBJECT_TYPE_SEMAPHORE = 0x00000006,
}

alias PSS_CAPTURE_FLAGS = uint;
enum : uint
{
    PSS_CAPTURE_NONE                             = 0x00000000,
    PSS_CAPTURE_VA_CLONE                         = 0x00000001,
    PSS_CAPTURE_RESERVED_00000002                = 0x00000002,
    PSS_CAPTURE_HANDLES                          = 0x00000004,
    PSS_CAPTURE_HANDLE_NAME_INFORMATION          = 0x00000008,
    PSS_CAPTURE_HANDLE_BASIC_INFORMATION         = 0x00000010,
    PSS_CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION = 0x00000020,
    PSS_CAPTURE_HANDLE_TRACE                     = 0x00000040,
    PSS_CAPTURE_THREADS                          = 0x00000080,
    PSS_CAPTURE_THREAD_CONTEXT                   = 0x00000100,
    PSS_CAPTURE_THREAD_CONTEXT_EXTENDED          = 0x00000200,
    PSS_CAPTURE_RESERVED_00000400                = 0x00000400,
    PSS_CAPTURE_VA_SPACE                         = 0x00000800,
    PSS_CAPTURE_VA_SPACE_SECTION_INFORMATION     = 0x00001000,
    PSS_CAPTURE_IPT_TRACE                        = 0x00002000,
    PSS_CAPTURE_RESERVED_00004000                = 0x00004000,
    PSS_CREATE_BREAKAWAY_OPTIONAL                = 0x04000000,
    PSS_CREATE_BREAKAWAY                         = 0x08000000,
    PSS_CREATE_FORCE_BREAKAWAY                   = 0x10000000,
    PSS_CREATE_USE_VM_ALLOCATIONS                = 0x20000000,
    PSS_CREATE_MEASURE_PERFORMANCE               = 0x40000000,
    PSS_CREATE_RELEASE_SECTION                   = 0x80000000,
}

alias PSS_QUERY_INFORMATION_CLASS = int;
enum : int
{
    PSS_QUERY_PROCESS_INFORMATION         = 0x00000000,
    PSS_QUERY_VA_CLONE_INFORMATION        = 0x00000001,
    PSS_QUERY_AUXILIARY_PAGES_INFORMATION = 0x00000002,
    PSS_QUERY_VA_SPACE_INFORMATION        = 0x00000003,
    PSS_QUERY_HANDLE_INFORMATION          = 0x00000004,
    PSS_QUERY_THREAD_INFORMATION          = 0x00000005,
    PSS_QUERY_HANDLE_TRACE_INFORMATION    = 0x00000006,
    PSS_QUERY_PERFORMANCE_COUNTERS        = 0x00000007,
}

alias PSS_WALK_INFORMATION_CLASS = int;
enum : int
{
    PSS_WALK_AUXILIARY_PAGES = 0x00000000,
    PSS_WALK_VA_SPACE        = 0x00000001,
    PSS_WALK_HANDLES         = 0x00000002,
    PSS_WALK_THREADS         = 0x00000003,
}

alias PSS_DUPLICATE_FLAGS = int;
enum : int
{
    PSS_DUPLICATE_NONE         = 0x00000000,
    PSS_DUPLICATE_CLOSE_SOURCE = 0x00000001,
}

alias PSS_PROCESS_FLAGS = int;
enum : int
{
    PSS_PROCESS_FLAGS_NONE        = 0x00000000,
    PSS_PROCESS_FLAGS_PROTECTED   = 0x00000001,
    PSS_PROCESS_FLAGS_WOW64       = 0x00000002,
    PSS_PROCESS_FLAGS_RESERVED_03 = 0x00000004,
    PSS_PROCESS_FLAGS_RESERVED_04 = 0x00000008,
    PSS_PROCESS_FLAGS_FROZEN      = 0x00000010,
}

struct PSS_PROCESS_INFORMATION
{
    uint ExitStatus;
    void* PebBaseAddress;
    ulong AffinityMask;
    int BasePriority;
    uint ProcessId;
    uint ParentProcessId;
    PSS_PROCESS_FLAGS Flags;
    FILETIME CreateTime;
    FILETIME ExitTime;
    FILETIME KernelTime;
    FILETIME UserTime;
    uint PriorityClass;
    ulong PeakVirtualSize;
    ulong VirtualSize;
    uint PageFaultCount;
    ulong PeakWorkingSetSize;
    ulong WorkingSetSize;
    ulong QuotaPeakPagedPoolUsage;
    ulong QuotaPagedPoolUsage;
    ulong QuotaPeakNonPagedPoolUsage;
    ulong QuotaNonPagedPoolUsage;
    ulong PagefileUsage;
    ulong PeakPagefileUsage;
    ulong PrivateUsage;
    uint ExecuteFlags;
    wchar[260] ImageFileName;
}
struct PSS_VA_CLONE_INFORMATION
{
    HANDLE VaCloneHandle;
}
struct PSS_AUXILIARY_PAGES_INFORMATION
{
    uint AuxPagesCaptured;
}
struct PSS_VA_SPACE_INFORMATION
{
    uint RegionCount;
}
struct PSS_HANDLE_INFORMATION
{
    uint HandlesCaptured;
}
struct PSS_THREAD_INFORMATION
{
    uint ThreadsCaptured;
    uint ContextLength;
}
struct PSS_HANDLE_TRACE_INFORMATION
{
    HANDLE SectionHandle;
    uint Size;
}
struct PSS_PERFORMANCE_COUNTERS
{
    ulong TotalCycleCount;
    ulong TotalWallClockPeriod;
    ulong VaCloneCycleCount;
    ulong VaCloneWallClockPeriod;
    ulong VaSpaceCycleCount;
    ulong VaSpaceWallClockPeriod;
    ulong AuxPagesCycleCount;
    ulong AuxPagesWallClockPeriod;
    ulong HandlesCycleCount;
    ulong HandlesWallClockPeriod;
    ulong ThreadsCycleCount;
    ulong ThreadsWallClockPeriod;
}
struct PSS_AUXILIARY_PAGE_ENTRY
{
    void* Address;
    MEMORY_BASIC_INFORMATION BasicInformation;
    FILETIME CaptureTime;
    void* PageContents;
    uint PageSize;
}
struct PSS_VA_SPACE_ENTRY
{
    void* BaseAddress;
    void* AllocationBase;
    uint AllocationProtect;
    ulong RegionSize;
    uint State;
    uint Protect;
    uint Type;
    uint TimeDateStamp;
    uint SizeOfImage;
    void* ImageBase;
    uint CheckSum;
    ushort MappedFileNameLength;
    const(wchar)* MappedFileName;
}
struct PSS_HANDLE_ENTRY
{
    HANDLE Handle;
    PSS_HANDLE_FLAGS Flags;
    PSS_OBJECT_TYPE ObjectType;
    FILETIME CaptureTime;
    uint Attributes;
    uint GrantedAccess;
    uint HandleCount;
    uint PointerCount;
    uint PagedPoolCharge;
    uint NonPagedPoolCharge;
    FILETIME CreationTime;
    ushort TypeNameLength;
    const(wchar)* TypeName;
    ushort ObjectNameLength;
    const(wchar)* ObjectName;
    union _TypeSpecificInformation_e__Union
    {
        struct _Process_e__Struct
        {
            uint ExitStatus;
            void* PebBaseAddress;
            ulong AffinityMask;
            int BasePriority;
            uint ProcessId;
            uint ParentProcessId;
            uint Flags;
        }
        struct _Thread_e__Struct
        {
            uint ExitStatus;
            void* TebBaseAddress;
            uint ProcessId;
            uint ThreadId;
            ulong AffinityMask;
            int Priority;
            int BasePriority;
            void* Win32StartAddress;
        }
        struct _Mutant_e__Struct
        {
            int CurrentCount;
            BOOL Abandoned;
            uint OwnerProcessId;
            uint OwnerThreadId;
        }
        struct _Event_e__Struct
        {
            BOOL ManualReset;
            BOOL Signaled;
        }
        struct _Section_e__Struct
        {
            void* BaseAddress;
            uint AllocationAttributes;
            long MaximumSize;
        }
        struct _Semaphore_e__Struct
        {
            int CurrentCount;
            int MaximumCount;
        }
    }
}
alias PSS_THREAD_FLAGS = int;
enum : int
{
    PSS_THREAD_FLAGS_NONE       = 0x00000000,
    PSS_THREAD_FLAGS_TERMINATED = 0x00000001,
}

struct PSS_THREAD_ENTRY
{
    uint ExitStatus;
    void* TebBaseAddress;
    uint ProcessId;
    uint ThreadId;
    ulong AffinityMask;
    int Priority;
    int BasePriority;
    void* LastSyscallFirstArgument;
    ushort LastSyscallNumber;
    FILETIME CreateTime;
    FILETIME ExitTime;
    FILETIME KernelTime;
    FILETIME UserTime;
    void* Win32StartAddress;
    FILETIME CaptureTime;
    PSS_THREAD_FLAGS Flags;
    ushort SuspendCount;
    ushort SizeOfContextRecord;
    CONTEXT* ContextRecord;
}
struct PSS_ALLOCATOR
{
    void* Context;
    long AllocRoutine;
    long FreeRoutine;
}
