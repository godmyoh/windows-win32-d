module windows.win32.system.processstatus;

import windows.win32.foundation : BOOL, HANDLE, HINSTANCE, PSTR, PWSTR;

version (Windows):
extern (Windows):

alias ENUM_PROCESS_MODULES_EX_FLAGS = uint;
enum : uint
{
    LIST_MODULES_ALL     = 0x00000003,
    LIST_MODULES_DEFAULT = 0x00000000,
    LIST_MODULES_32BIT   = 0x00000001,
    LIST_MODULES_64BIT   = 0x00000002,
}

BOOL EnumProcesses(uint*, uint, uint*);
BOOL EnumProcessModules(HANDLE, HINSTANCE*, uint, uint*);
BOOL EnumProcessModulesEx(HANDLE, HINSTANCE*, uint, uint*, ENUM_PROCESS_MODULES_EX_FLAGS);
uint GetModuleBaseNameA(HANDLE, HINSTANCE, PSTR, uint);
uint GetModuleBaseNameW(HANDLE, HINSTANCE, PWSTR, uint);
uint GetModuleFileNameExA(HANDLE, HINSTANCE, PSTR, uint);
uint GetModuleFileNameExW(HANDLE, HINSTANCE, PWSTR, uint);
BOOL GetModuleInformation(HANDLE, HINSTANCE, MODULEINFO*, uint);
BOOL EmptyWorkingSet(HANDLE);
BOOL InitializeProcessForWsWatch(HANDLE);
BOOL GetWsChanges(HANDLE, PSAPI_WS_WATCH_INFORMATION*, uint);
BOOL GetWsChangesEx(HANDLE, PSAPI_WS_WATCH_INFORMATION_EX*, uint*);
uint GetMappedFileNameW(HANDLE, void*, PWSTR, uint);
uint GetMappedFileNameA(HANDLE, void*, PSTR, uint);
BOOL EnumDeviceDrivers(void**, uint, uint*);
uint GetDeviceDriverBaseNameA(void*, PSTR, uint);
uint GetDeviceDriverBaseNameW(void*, PWSTR, uint);
uint GetDeviceDriverFileNameA(void*, PSTR, uint);
uint GetDeviceDriverFileNameW(void*, PWSTR, uint);
BOOL QueryWorkingSet(HANDLE, void*, uint);
BOOL QueryWorkingSetEx(HANDLE, void*, uint);
BOOL GetProcessMemoryInfo(HANDLE, PROCESS_MEMORY_COUNTERS*, uint);
BOOL GetPerformanceInfo(PERFORMANCE_INFORMATION*, uint);
BOOL EnumPageFilesW(PENUM_PAGE_FILE_CALLBACKW, void*);
BOOL EnumPageFilesA(PENUM_PAGE_FILE_CALLBACKA, void*);
uint GetProcessImageFileNameA(HANDLE, PSTR, uint);
uint GetProcessImageFileNameW(HANDLE, PWSTR, uint);
enum PSAPI_VERSION = 0x00000002;
struct MODULEINFO
{
    void* lpBaseOfDll;
    uint SizeOfImage;
    void* EntryPoint;
}
struct PSAPI_WS_WATCH_INFORMATION
{
    void* FaultingPc;
    void* FaultingVa;
}
struct PSAPI_WS_WATCH_INFORMATION_EX
{
    PSAPI_WS_WATCH_INFORMATION BasicInfo;
    ulong FaultingThreadId;
    ulong Flags;
}
union PSAPI_WORKING_SET_BLOCK
{
    ulong Flags;
    struct
    {
        ulong _bitfield0;
    }
}
struct PSAPI_WORKING_SET_INFORMATION
{
    ulong NumberOfEntries;
    PSAPI_WORKING_SET_BLOCK[1] WorkingSetInfo;
}
union PSAPI_WORKING_SET_EX_BLOCK
{
    ulong Flags;
    union
    {
        struct
        {
            ulong _bitfield0;
        }
        struct _Invalid_e__Struct
        {
            ulong _bitfield1;
        }
    }
}
struct PSAPI_WORKING_SET_EX_INFORMATION
{
    void* VirtualAddress;
    PSAPI_WORKING_SET_EX_BLOCK VirtualAttributes;
}
struct PROCESS_MEMORY_COUNTERS
{
    uint cb;
    uint PageFaultCount;
    ulong PeakWorkingSetSize;
    ulong WorkingSetSize;
    ulong QuotaPeakPagedPoolUsage;
    ulong QuotaPagedPoolUsage;
    ulong QuotaPeakNonPagedPoolUsage;
    ulong QuotaNonPagedPoolUsage;
    ulong PagefileUsage;
    ulong PeakPagefileUsage;
}
struct PROCESS_MEMORY_COUNTERS_EX
{
    uint cb;
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
}
struct PERFORMANCE_INFORMATION
{
    uint cb;
    ulong CommitTotal;
    ulong CommitLimit;
    ulong CommitPeak;
    ulong PhysicalTotal;
    ulong PhysicalAvailable;
    ulong SystemCache;
    ulong KernelTotal;
    ulong KernelPaged;
    ulong KernelNonpaged;
    ulong PageSize;
    uint HandleCount;
    uint ProcessCount;
    uint ThreadCount;
}
struct ENUM_PAGE_FILE_INFORMATION
{
    uint cb;
    uint Reserved;
    ulong TotalSize;
    ulong TotalInUse;
    ulong PeakUsage;
}
alias PENUM_PAGE_FILE_CALLBACKW = BOOL function(void*, ENUM_PAGE_FILE_INFORMATION*, const(wchar)*);
alias PENUM_PAGE_FILE_CALLBACKA = BOOL function(void*, ENUM_PAGE_FILE_INFORMATION*, const(char)*);
