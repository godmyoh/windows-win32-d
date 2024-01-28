module windows.win32.system.processstatus;

import windows.win32.foundation : BOOL, HANDLE, HMODULE, PSTR, PWSTR;

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
BOOL EnumProcessModules(HANDLE, HMODULE*, uint, uint*);
BOOL EnumProcessModulesEx(HANDLE, HMODULE*, uint, uint*, ENUM_PROCESS_MODULES_EX_FLAGS);
uint GetModuleBaseNameA(HANDLE, HMODULE, PSTR, uint);
uint GetModuleBaseNameW(HANDLE, HMODULE, PWSTR, uint);
uint GetModuleFileNameExA(HANDLE, HMODULE, PSTR, uint);
uint GetModuleFileNameExW(HANDLE, HMODULE, PWSTR, uint);
BOOL GetModuleInformation(HANDLE, HMODULE, MODULEINFO*, uint);
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
BOOL K32EnumProcesses(uint*, uint, uint*);
BOOL K32EnumProcessModules(HANDLE, HMODULE*, uint, uint*);
BOOL K32EnumProcessModulesEx(HANDLE, HMODULE*, uint, uint*, uint);
uint K32GetModuleBaseNameA(HANDLE, HMODULE, PSTR, uint);
uint K32GetModuleBaseNameW(HANDLE, HMODULE, PWSTR, uint);
uint K32GetModuleFileNameExA(HANDLE, HMODULE, PSTR, uint);
uint K32GetModuleFileNameExW(HANDLE, HMODULE, PWSTR, uint);
BOOL K32GetModuleInformation(HANDLE, HMODULE, MODULEINFO*, uint);
BOOL K32EmptyWorkingSet(HANDLE);
BOOL K32InitializeProcessForWsWatch(HANDLE);
BOOL K32GetWsChanges(HANDLE, PSAPI_WS_WATCH_INFORMATION*, uint);
BOOL K32GetWsChangesEx(HANDLE, PSAPI_WS_WATCH_INFORMATION_EX*, uint*);
uint K32GetMappedFileNameW(HANDLE, void*, PWSTR, uint);
uint K32GetMappedFileNameA(HANDLE, void*, PSTR, uint);
BOOL K32EnumDeviceDrivers(void**, uint, uint*);
uint K32GetDeviceDriverBaseNameA(void*, PSTR, uint);
uint K32GetDeviceDriverBaseNameW(void*, PWSTR, uint);
uint K32GetDeviceDriverFileNameA(void*, PSTR, uint);
uint K32GetDeviceDriverFileNameW(void*, PWSTR, uint);
BOOL K32QueryWorkingSet(HANDLE, void*, uint);
BOOL K32QueryWorkingSetEx(HANDLE, void*, uint);
BOOL K32GetProcessMemoryInfo(HANDLE, PROCESS_MEMORY_COUNTERS*, uint);
BOOL K32GetPerformanceInfo(PERFORMANCE_INFORMATION*, uint);
BOOL K32EnumPageFilesW(PENUM_PAGE_FILE_CALLBACKW, void*);
BOOL K32EnumPageFilesA(PENUM_PAGE_FILE_CALLBACKA, void*);
uint K32GetProcessImageFileNameA(HANDLE, PSTR, uint);
uint K32GetProcessImageFileNameW(HANDLE, PWSTR, uint);
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
        struct Invalid
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
struct PROCESS_MEMORY_COUNTERS_EX2
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
    ulong PrivateWorkingSetSize;
    ulong SharedCommitUsage;
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
