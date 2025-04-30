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

BOOL EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded);
BOOL EnumProcessModules(HANDLE hProcess, HMODULE* lphModule, uint cb, uint* lpcbNeeded);
BOOL EnumProcessModulesEx(HANDLE hProcess, HMODULE* lphModule, uint cb, uint* lpcbNeeded, ENUM_PROCESS_MODULES_EX_FLAGS dwFilterFlag);
uint GetModuleBaseNameA(HANDLE hProcess, HMODULE hModule, PSTR lpBaseName, uint nSize);
uint GetModuleBaseNameW(HANDLE hProcess, HMODULE hModule, PWSTR lpBaseName, uint nSize);
uint GetModuleFileNameExA(HANDLE hProcess, HMODULE hModule, PSTR lpFilename, uint nSize);
uint GetModuleFileNameExW(HANDLE hProcess, HMODULE hModule, PWSTR lpFilename, uint nSize);
BOOL GetModuleInformation(HANDLE hProcess, HMODULE hModule, MODULEINFO* lpmodinfo, uint cb);
BOOL EmptyWorkingSet(HANDLE hProcess);
BOOL InitializeProcessForWsWatch(HANDLE hProcess);
BOOL GetWsChanges(HANDLE hProcess, PSAPI_WS_WATCH_INFORMATION* lpWatchInfo, uint cb);
BOOL GetWsChangesEx(HANDLE hProcess, PSAPI_WS_WATCH_INFORMATION_EX* lpWatchInfoEx, uint* cb);
uint GetMappedFileNameW(HANDLE hProcess, void* lpv, PWSTR lpFilename, uint nSize);
uint GetMappedFileNameA(HANDLE hProcess, void* lpv, PSTR lpFilename, uint nSize);
BOOL EnumDeviceDrivers(void** lpImageBase, uint cb, uint* lpcbNeeded);
uint GetDeviceDriverBaseNameA(void* ImageBase, PSTR lpFilename, uint nSize);
uint GetDeviceDriverBaseNameW(void* ImageBase, PWSTR lpBaseName, uint nSize);
uint GetDeviceDriverFileNameA(void* ImageBase, PSTR lpFilename, uint nSize);
uint GetDeviceDriverFileNameW(void* ImageBase, PWSTR lpFilename, uint nSize);
BOOL QueryWorkingSet(HANDLE hProcess, void* pv, uint cb);
BOOL QueryWorkingSetEx(HANDLE hProcess, void* pv, uint cb);
BOOL GetProcessMemoryInfo(HANDLE Process, PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb);
BOOL GetPerformanceInfo(PERFORMANCE_INFORMATION* pPerformanceInformation, uint cb);
BOOL EnumPageFilesW(PENUM_PAGE_FILE_CALLBACKW pCallBackRoutine, void* pContext);
BOOL EnumPageFilesA(PENUM_PAGE_FILE_CALLBACKA pCallBackRoutine, void* pContext);
uint GetProcessImageFileNameA(HANDLE hProcess, PSTR lpImageFileName, uint nSize);
uint GetProcessImageFileNameW(HANDLE hProcess, PWSTR lpImageFileName, uint nSize);
BOOL K32EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded);
BOOL K32EnumProcessModules(HANDLE hProcess, HMODULE* lphModule, uint cb, uint* lpcbNeeded);
BOOL K32EnumProcessModulesEx(HANDLE hProcess, HMODULE* lphModule, uint cb, uint* lpcbNeeded, uint dwFilterFlag);
uint K32GetModuleBaseNameA(HANDLE hProcess, HMODULE hModule, PSTR lpBaseName, uint nSize);
uint K32GetModuleBaseNameW(HANDLE hProcess, HMODULE hModule, PWSTR lpBaseName, uint nSize);
uint K32GetModuleFileNameExA(HANDLE hProcess, HMODULE hModule, PSTR lpFilename, uint nSize);
uint K32GetModuleFileNameExW(HANDLE hProcess, HMODULE hModule, PWSTR lpFilename, uint nSize);
BOOL K32GetModuleInformation(HANDLE hProcess, HMODULE hModule, MODULEINFO* lpmodinfo, uint cb);
BOOL K32EmptyWorkingSet(HANDLE hProcess);
BOOL K32InitializeProcessForWsWatch(HANDLE hProcess);
BOOL K32GetWsChanges(HANDLE hProcess, PSAPI_WS_WATCH_INFORMATION* lpWatchInfo, uint cb);
BOOL K32GetWsChangesEx(HANDLE hProcess, PSAPI_WS_WATCH_INFORMATION_EX* lpWatchInfoEx, uint* cb);
uint K32GetMappedFileNameW(HANDLE hProcess, void* lpv, PWSTR lpFilename, uint nSize);
uint K32GetMappedFileNameA(HANDLE hProcess, void* lpv, PSTR lpFilename, uint nSize);
BOOL K32EnumDeviceDrivers(void** lpImageBase, uint cb, uint* lpcbNeeded);
uint K32GetDeviceDriverBaseNameA(void* ImageBase, PSTR lpFilename, uint nSize);
uint K32GetDeviceDriverBaseNameW(void* ImageBase, PWSTR lpBaseName, uint nSize);
uint K32GetDeviceDriverFileNameA(void* ImageBase, PSTR lpFilename, uint nSize);
uint K32GetDeviceDriverFileNameW(void* ImageBase, PWSTR lpFilename, uint nSize);
BOOL K32QueryWorkingSet(HANDLE hProcess, void* pv, uint cb);
BOOL K32QueryWorkingSetEx(HANDLE hProcess, void* pv, uint cb);
BOOL K32GetProcessMemoryInfo(HANDLE Process, PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb);
BOOL K32GetPerformanceInfo(PERFORMANCE_INFORMATION* pPerformanceInformation, uint cb);
BOOL K32EnumPageFilesW(PENUM_PAGE_FILE_CALLBACKW pCallBackRoutine, void* pContext);
BOOL K32EnumPageFilesA(PENUM_PAGE_FILE_CALLBACKA pCallBackRoutine, void* pContext);
uint K32GetProcessImageFileNameA(HANDLE hProcess, PSTR lpImageFileName, uint nSize);
uint K32GetProcessImageFileNameW(HANDLE hProcess, PWSTR lpImageFileName, uint nSize);
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
alias PENUM_PAGE_FILE_CALLBACKW = BOOL function(void* pContext, ENUM_PAGE_FILE_INFORMATION* pPageFileInfo, const(wchar)* lpFilename);
alias PENUM_PAGE_FILE_CALLBACKA = BOOL function(void* pContext, ENUM_PAGE_FILE_INFORMATION* pPageFileInfo, const(char)* lpFilename);
