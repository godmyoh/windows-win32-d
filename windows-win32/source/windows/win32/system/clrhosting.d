module windows.win32.system.clrhosting;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, HANDLE, HINSTANCE, HMODULE, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.security : ACL;
import windows.win32.system.com : IEnumUnknown, IStream, IUnknown;
import windows.win32.system.diagnostics.debug_ : EXCEPTION_POINTERS;
import windows.win32.system.io : LPOVERLAPPED_COMPLETION_ROUTINE;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE, PROCESS_INFORMATION, WAITORTIMERCALLBACK;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

HRESULT GetCORSystemDirectory(PWSTR, uint, uint*);
HRESULT GetCORVersion(PWSTR, uint, uint*);
HRESULT GetFileVersion(const(wchar)*, PWSTR, uint, uint*);
HRESULT GetCORRequiredVersion(PWSTR, uint, uint*);
HRESULT GetRequestedRuntimeInfo(const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
HRESULT GetRequestedRuntimeVersion(PWSTR, PWSTR, uint, uint*);
HRESULT CorBindToRuntimeHost(const(wchar)*, const(wchar)*, const(wchar)*, void*, uint, const(GUID)*, const(GUID)*, void**);
HRESULT CorBindToRuntimeEx(const(wchar)*, const(wchar)*, uint, const(GUID)*, const(GUID)*, void**);
HRESULT CorBindToRuntimeByCfg(IStream, uint, uint, const(GUID)*, const(GUID)*, void**);
HRESULT CorBindToRuntime(const(wchar)*, const(wchar)*, const(GUID)*, const(GUID)*, void**);
HRESULT CorBindToCurrentRuntime(const(wchar)*, const(GUID)*, const(GUID)*, void**);
HRESULT ClrCreateManagedInstance(const(wchar)*, const(GUID)*, void**);
void CorMarkThreadInThreadPool();
HRESULT RunDll32ShimW(HWND, HINSTANCE, const(wchar)*, int);
HRESULT LoadLibraryShim(const(wchar)*, const(wchar)*, void*, HMODULE*);
HRESULT CallFunctionShim(const(wchar)*, const(char)*, void*, void*, const(wchar)*, void*);
HRESULT GetRealProcAddress(const(char)*, void**);
void CorExitProcess(int);
HRESULT LoadStringRC(uint, PWSTR, int, int);
HRESULT LoadStringRCEx(uint, uint, PWSTR, int, int, int*);
HRESULT LockClrVersion(FLockClrVersionCallback, FLockClrVersionCallback*, FLockClrVersionCallback*);
HRESULT CreateDebuggingInterfaceFromVersion(int, const(wchar)*, IUnknown*);
HRESULT GetVersionFromProcess(HANDLE, PWSTR, uint, uint*);
HRESULT CorLaunchApplication(HOST_TYPE, const(wchar)*, uint, const(wchar)**, uint, const(wchar)**, PROCESS_INFORMATION*);
HRESULT GetRequestedRuntimeVersionForCLSID(const(GUID)*, PWSTR, uint, uint*, CLSID_RESOLUTION_FLAGS);
HRESULT GetCLRIdentityManager(const(GUID)*, IUnknown*);
HRESULT CLRCreateInstance(const(GUID)*, const(GUID)*, void**);
enum DEPRECATED_CLR_API_MESG = "This API has been deprecated. Refer to https://go.microsoft.com/fwlink/?LinkId=143720 for more details.";
enum CLR_MAJOR_VERSION = 0x00000004;
enum CLR_MINOR_VERSION = 0x00000000;
enum CLR_BUILD_VERSION = 0x000056cc;
enum CLR_ASSEMBLY_MAJOR_VERSION = 0x00000004;
enum CLR_ASSEMBLY_MINOR_VERSION = 0x00000000;
enum CLR_ASSEMBLY_BUILD_VERSION = 0x00000000;
enum BucketParamsCount = 0x0000000a;
enum BucketParamLength = 0x000000ff;
enum LIBID_mscoree = GUID(0x5477469e, 0x83b1, 0x11d2, [0x8b, 0x49, 0x0, 0xa0, 0xc9, 0xb7, 0xc9, 0xc4]);
enum CLSID_CLRStrongName = GUID(0xb79b0acd, 0xf5cd, 0x409b, [0xb5, 0xa5, 0xa1, 0x62, 0x44, 0x61, 0xb, 0x92]);
enum CLSID_CLRMetaHost = GUID(0x9280188d, 0xe8e, 0x4867, [0xb3, 0xc, 0x7f, 0xa8, 0x38, 0x84, 0xe8, 0xde]);
enum CLSID_CLRMetaHostPolicy = GUID(0x2ebcd49a, 0x1b47, 0x4a61, [0xb1, 0x3a, 0x4a, 0x3, 0x70, 0x1e, 0x59, 0x4b]);
enum CLSID_CLRDebugging = GUID(0xbacc578d, 0xfbdd, 0x48a4, [0x96, 0x9f, 0x2, 0xd9, 0x32, 0xb7, 0x46, 0x34]);
enum CLSID_CLRDebuggingLegacy = GUID(0xdf8395b5, 0xa4ba, 0x450b, [0xa7, 0x7c, 0xa9, 0xa4, 0x77, 0x62, 0xc5, 0x20]);
enum CLSID_CLRProfiling = GUID(0xbd097ed8, 0x733e, 0x43fe, [0x8e, 0xd7, 0xa9, 0x5f, 0xf9, 0xa8, 0x44, 0x8c]);
alias COR_GC_STAT_TYPES = int;
enum : int
{
    COR_GC_COUNTS      = 0x00000001,
    COR_GC_MEMORYUSAGE = 0x00000002,
}

alias COR_GC_THREAD_STATS_TYPES = int;
enum : int
{
    COR_GC_THREAD_HAS_PROMOTED_BYTES = 0x00000001,
}

struct COR_GC_STATS
{
    uint Flags;
    ulong ExplicitGCCount;
    ulong[3] GenCollectionsTaken;
    ulong CommittedKBytes;
    ulong ReservedKBytes;
    ulong Gen0HeapSizeKBytes;
    ulong Gen1HeapSizeKBytes;
    ulong Gen2HeapSizeKBytes;
    ulong LargeObjectHeapSizeKBytes;
    ulong KBytesPromotedFromGen0;
    ulong KBytesPromotedFromGen1;
}
struct COR_GC_THREAD_STATS
{
    ulong PerThreadAllocation;
    uint Flags;
}
enum IID_IGCHost = GUID(0xfac34f6e, 0xdcd, 0x47b5, [0x80, 0x21, 0x53, 0x1b, 0xc5, 0xec, 0xca, 0x63]);
interface IGCHost : IUnknown
{
    HRESULT SetGCStartupLimits(uint, uint);
    HRESULT Collect(int);
    HRESULT GetStats(COR_GC_STATS*);
    HRESULT GetThreadStats(uint*, COR_GC_THREAD_STATS*);
    HRESULT SetVirtualMemLimit(ulong);
}
enum IID_IGCHost2 = GUID(0xa1d70cec, 0x2dbe, 0x4e2f, [0x92, 0x91, 0xfd, 0xf8, 0x14, 0x38, 0xa1, 0xdf]);
interface IGCHost2 : IGCHost
{
    HRESULT SetGCStartupLimitsEx(ulong, ulong);
}
alias FLockClrVersionCallback = HRESULT function();
alias HOST_TYPE = int;
enum : int
{
    HOST_TYPE_DEFAULT   = 0x00000000,
    HOST_TYPE_APPLAUNCH = 0x00000001,
    HOST_TYPE_CORFLAG   = 0x00000002,
}

alias FExecuteInAppDomainCallback = HRESULT function(void*);
alias STARTUP_FLAGS = int;
enum : int
{
    STARTUP_CONCURRENT_GC                         = 0x00000001,
    STARTUP_LOADER_OPTIMIZATION_MASK              = 0x00000006,
    STARTUP_LOADER_OPTIMIZATION_SINGLE_DOMAIN     = 0x00000002,
    STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN      = 0x00000004,
    STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST = 0x00000006,
    STARTUP_LOADER_SAFEMODE                       = 0x00000010,
    STARTUP_LOADER_SETPREFERENCE                  = 0x00000100,
    STARTUP_SERVER_GC                             = 0x00001000,
    STARTUP_HOARD_GC_VM                           = 0x00002000,
    STARTUP_SINGLE_VERSION_HOSTING_INTERFACE      = 0x00004000,
    STARTUP_LEGACY_IMPERSONATION                  = 0x00010000,
    STARTUP_DISABLE_COMMITTHREADSTACK             = 0x00020000,
    STARTUP_ALWAYSFLOW_IMPERSONATION              = 0x00040000,
    STARTUP_TRIM_GC_COMMIT                        = 0x00080000,
    STARTUP_ETW                                   = 0x00100000,
    STARTUP_ARM                                   = 0x00400000,
}

alias CLSID_RESOLUTION_FLAGS = int;
enum : int
{
    CLSID_RESOLUTION_DEFAULT    = 0x00000000,
    CLSID_RESOLUTION_REGISTERED = 0x00000001,
}

alias RUNTIME_INFO_FLAGS = int;
enum : int
{
    RUNTIME_INFO_UPGRADE_VERSION        = 0x00000001,
    RUNTIME_INFO_REQUEST_IA64           = 0x00000002,
    RUNTIME_INFO_REQUEST_AMD64          = 0x00000004,
    RUNTIME_INFO_REQUEST_X86            = 0x00000008,
    RUNTIME_INFO_DONT_RETURN_DIRECTORY  = 0x00000010,
    RUNTIME_INFO_DONT_RETURN_VERSION    = 0x00000020,
    RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG = 0x00000040,
    RUNTIME_INFO_IGNORE_ERROR_MODE      = 0x00001000,
    RUNTIME_INFO_REQUEST_ARM64          = 0x00002000,
}

alias APPDOMAIN_SECURITY_FLAGS = int;
enum : int
{
    APPDOMAIN_SECURITY_DEFAULT                        = 0x00000000,
    APPDOMAIN_SECURITY_SANDBOXED                      = 0x00000001,
    APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE = 0x00000002,
    APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS           = 0x00000008,
}

enum IID_IObjectHandle = GUID(0xc460e2b4, 0xe199, 0x412a, [0x84, 0x56, 0x84, 0xdc, 0x3e, 0x48, 0x38, 0xc3]);
interface IObjectHandle : IUnknown
{
    HRESULT Unwrap(VARIANT*);
}
enum IID_IAppDomainBinding = GUID(0x5c2b07a7, 0x1e98, 0x11d3, [0x87, 0x2f, 0x0, 0xc0, 0x4f, 0x79, 0xed, 0xd]);
interface IAppDomainBinding : IUnknown
{
    HRESULT OnAppDomain(IUnknown);
}
enum IID_IGCThreadControl = GUID(0xf31d1788, 0xc397, 0x4725, [0x87, 0xa5, 0x6a, 0xf3, 0x47, 0x2c, 0x27, 0x91]);
interface IGCThreadControl : IUnknown
{
    HRESULT ThreadIsBlockingForSuspension();
    HRESULT SuspensionStarting();
    HRESULT SuspensionEnding(uint);
}
enum IID_IGCHostControl = GUID(0x5513d564, 0x8374, 0x4cb9, [0xae, 0xd9, 0x0, 0x83, 0xf4, 0x16, 0xa, 0x1d]);
interface IGCHostControl : IUnknown
{
    HRESULT RequestVirtualMemLimit(ulong, ulong*);
}
alias PTLS_CALLBACK_FUNCTION = void function(void*);
enum IID_ICorThreadpool = GUID(0x84680d3a, 0xb2c1, 0x46e8, [0xac, 0xc2, 0xdb, 0xc0, 0xa3, 0x59, 0x15, 0x9a]);
interface ICorThreadpool : IUnknown
{
    HRESULT CorRegisterWaitForSingleObject(HANDLE*, HANDLE, WAITORTIMERCALLBACK, void*, uint, BOOL, BOOL*);
    HRESULT CorUnregisterWait(HANDLE, HANDLE, BOOL*);
    HRESULT CorQueueUserWorkItem(LPTHREAD_START_ROUTINE, void*, BOOL, BOOL*);
    HRESULT CorCreateTimer(HANDLE*, WAITORTIMERCALLBACK, void*, uint, uint, BOOL*);
    HRESULT CorChangeTimer(HANDLE, uint, uint, BOOL*);
    HRESULT CorDeleteTimer(HANDLE, HANDLE, BOOL*);
    HRESULT CorBindIoCompletionCallback(HANDLE, LPOVERLAPPED_COMPLETION_ROUTINE);
    HRESULT CorCallOrQueueUserWorkItem(LPTHREAD_START_ROUTINE, void*, BOOL*);
    HRESULT CorSetMaxThreads(uint, uint);
    HRESULT CorGetMaxThreads(uint*, uint*);
    HRESULT CorGetAvailableThreads(uint*, uint*);
}
enum IID_IDebuggerThreadControl = GUID(0x23d86786, 0xbb5, 0x4774, [0x8f, 0xb5, 0xe3, 0x52, 0x2a, 0xdd, 0x62, 0x46]);
interface IDebuggerThreadControl : IUnknown
{
    HRESULT ThreadIsBlockingForDebugger();
    HRESULT ReleaseAllRuntimeThreads();
    HRESULT StartBlockingForDebugger(uint);
}
enum IID_IDebuggerInfo = GUID(0xbf24142d, 0xa47d, 0x4d24, [0xa6, 0x6d, 0x8c, 0x21, 0x41, 0x94, 0x4e, 0x44]);
interface IDebuggerInfo : IUnknown
{
    HRESULT IsDebuggerAttached(BOOL*);
}
enum IID_ICorConfiguration = GUID(0x5c2b07a5, 0x1e98, 0x11d3, [0x87, 0x2f, 0x0, 0xc0, 0x4f, 0x79, 0xed, 0xd]);
interface ICorConfiguration : IUnknown
{
    HRESULT SetGCThreadControl(IGCThreadControl);
    HRESULT SetGCHostControl(IGCHostControl);
    HRESULT SetDebuggerThreadControl(IDebuggerThreadControl);
    HRESULT AddDebuggerSpecialThread(uint);
}
enum IID_ICorRuntimeHost = GUID(0xcb2f6722, 0xab3a, 0x11d2, [0x9c, 0x40, 0x0, 0xc0, 0x4f, 0xa3, 0xa, 0x3e]);
interface ICorRuntimeHost : IUnknown
{
    HRESULT CreateLogicalThreadState();
    HRESULT DeleteLogicalThreadState();
    HRESULT SwitchInLogicalThreadState(uint*);
    HRESULT SwitchOutLogicalThreadState(uint**);
    HRESULT LocksHeldByLogicalThread(uint*);
    HRESULT MapFile(HANDLE, HMODULE*);
    HRESULT GetConfiguration(ICorConfiguration*);
    HRESULT Start();
    HRESULT Stop();
    HRESULT CreateDomain(const(wchar)*, IUnknown, IUnknown*);
    HRESULT GetDefaultDomain(IUnknown*);
    HRESULT EnumDomains(void**);
    HRESULT NextDomain(void*, IUnknown*);
    HRESULT CloseEnum(void*);
    HRESULT CreateDomainEx(const(wchar)*, IUnknown, IUnknown, IUnknown*);
    HRESULT CreateDomainSetup(IUnknown*);
    HRESULT CreateEvidence(IUnknown*);
    HRESULT UnloadDomain(IUnknown);
    HRESULT CurrentDomain(IUnknown*);
}
alias EMemoryAvailable = int;
enum : int
{
    eMemoryAvailableLow     = 0x00000001,
    eMemoryAvailableNeutral = 0x00000002,
    eMemoryAvailableHigh    = 0x00000003,
}

alias EMemoryCriticalLevel = int;
enum : int
{
    eTaskCritical      = 0x00000000,
    eAppDomainCritical = 0x00000001,
    eProcessCritical   = 0x00000002,
}

alias WAIT_OPTION = int;
enum : int
{
    WAIT_MSGPUMP       = 0x00000001,
    WAIT_ALERTABLE     = 0x00000002,
    WAIT_NOTINDEADLOCK = 0x00000004,
}

enum IID_ICLRMemoryNotificationCallback = GUID(0x47eb8e57, 0x846, 0x4546, [0xaf, 0x76, 0x6f, 0x42, 0xfc, 0xfc, 0x26, 0x49]);
interface ICLRMemoryNotificationCallback : IUnknown
{
    HRESULT OnMemoryNotification(EMemoryAvailable);
}
enum IID_IHostMalloc = GUID(0x1831991c, 0xcc53, 0x4a31, [0xb2, 0x18, 0x4, 0xe9, 0x10, 0x44, 0x64, 0x79]);
interface IHostMalloc : IUnknown
{
    HRESULT Alloc(ulong, EMemoryCriticalLevel, void**);
    HRESULT DebugAlloc(ulong, EMemoryCriticalLevel, ubyte*, int, void**);
    HRESULT Free(void*);
}
alias MALLOC_TYPE = int;
enum : int
{
    MALLOC_THREADSAFE = 0x00000001,
    MALLOC_EXECUTABLE = 0x00000002,
}

enum IID_IHostMemoryManager = GUID(0x7bc698d1, 0xf9e3, 0x4460, [0x9c, 0xde, 0xd0, 0x42, 0x48, 0xe9, 0xfa, 0x25]);
interface IHostMemoryManager : IUnknown
{
    HRESULT CreateMalloc(uint, IHostMalloc*);
    HRESULT VirtualAlloc(void*, ulong, uint, uint, EMemoryCriticalLevel, void**);
    HRESULT VirtualFree(void*, ulong, uint);
    HRESULT VirtualQuery(void*, void*, ulong, ulong*);
    HRESULT VirtualProtect(void*, ulong, uint, uint*);
    HRESULT GetMemoryLoad(uint*, ulong*);
    HRESULT RegisterMemoryNotificationCallback(ICLRMemoryNotificationCallback);
    HRESULT NeedsVirtualAddressSpace(void*, ulong);
    HRESULT AcquiredVirtualAddressSpace(void*, ulong);
    HRESULT ReleasedVirtualAddressSpace(void*);
}
enum IID_ICLRTask = GUID(0x28e66a4a, 0x9906, 0x4225, [0xb2, 0x31, 0x91, 0x87, 0xc3, 0xeb, 0x86, 0x11]);
interface ICLRTask : IUnknown
{
    HRESULT SwitchIn(HANDLE);
    HRESULT SwitchOut();
    HRESULT GetMemStats(COR_GC_THREAD_STATS*);
    HRESULT Reset(BOOL);
    HRESULT ExitTask();
    HRESULT Abort();
    HRESULT RudeAbort();
    HRESULT NeedsPriorityScheduling(BOOL*);
    HRESULT YieldTask();
    HRESULT LocksHeld(ulong*);
    HRESULT SetTaskIdentifier(ulong);
}
enum IID_ICLRTask2 = GUID(0x28e66a4a, 0x9906, 0x4225, [0xb2, 0x31, 0x91, 0x87, 0xc3, 0xeb, 0x86, 0x12]);
interface ICLRTask2 : ICLRTask
{
    HRESULT BeginPreventAsyncAbort();
    HRESULT EndPreventAsyncAbort();
}
enum IID_IHostTask = GUID(0xc2275828, 0xc4b1, 0x4b55, [0x82, 0xc9, 0x92, 0x13, 0x5f, 0x74, 0xdf, 0x1a]);
interface IHostTask : IUnknown
{
    HRESULT Start();
    HRESULT Alert();
    HRESULT Join(uint, uint);
    HRESULT SetPriority(int);
    HRESULT GetPriority(int*);
    HRESULT SetCLRTask(ICLRTask);
}
alias ETaskType = int;
enum : int
{
    TT_DEBUGGERHELPER          = 0x00000001,
    TT_GC                      = 0x00000002,
    TT_FINALIZER               = 0x00000004,
    TT_THREADPOOL_TIMER        = 0x00000008,
    TT_THREADPOOL_GATE         = 0x00000010,
    TT_THREADPOOL_WORKER       = 0x00000020,
    TT_THREADPOOL_IOCOMPLETION = 0x00000040,
    TT_ADUNLOAD                = 0x00000080,
    TT_USER                    = 0x00000100,
    TT_THREADPOOL_WAIT         = 0x00000200,
    TT_UNKNOWN                 = 0x80000000,
}

enum IID_ICLRTaskManager = GUID(0x4862efbe, 0x3ae5, 0x44f8, [0x8f, 0xeb, 0x34, 0x61, 0x90, 0xee, 0x8a, 0x34]);
interface ICLRTaskManager : IUnknown
{
    HRESULT CreateTask(ICLRTask*);
    HRESULT GetCurrentTask(ICLRTask*);
    HRESULT SetUILocale(uint);
    HRESULT SetLocale(uint);
    HRESULT GetCurrentTaskType(ETaskType*);
}
enum IID_IHostTaskManager = GUID(0x997ff24c, 0x43b7, 0x4352, [0x86, 0x67, 0xd, 0xc0, 0x4f, 0xaf, 0xd3, 0x54]);
interface IHostTaskManager : IUnknown
{
    HRESULT GetCurrentTask(IHostTask*);
    HRESULT CreateTask(uint, LPTHREAD_START_ROUTINE, void*, IHostTask*);
    HRESULT Sleep(uint, uint);
    HRESULT SwitchToTask(uint);
    HRESULT SetUILocale(uint);
    HRESULT SetLocale(uint);
    HRESULT CallNeedsHostHook(ulong, BOOL*);
    HRESULT LeaveRuntime(ulong);
    HRESULT EnterRuntime();
    HRESULT ReverseLeaveRuntime();
    HRESULT ReverseEnterRuntime();
    HRESULT BeginDelayAbort();
    HRESULT EndDelayAbort();
    HRESULT BeginThreadAffinity();
    HRESULT EndThreadAffinity();
    HRESULT SetStackGuarantee(uint);
    HRESULT GetStackGuarantee(uint*);
    HRESULT SetCLRTaskManager(ICLRTaskManager);
}
enum IID_IHostThreadpoolManager = GUID(0x983d50e2, 0xcb15, 0x466b, [0x80, 0xfc, 0x84, 0x5d, 0xc6, 0xe8, 0xc5, 0xfd]);
interface IHostThreadpoolManager : IUnknown
{
    HRESULT QueueUserWorkItem(LPTHREAD_START_ROUTINE, void*, uint);
    HRESULT SetMaxThreads(uint);
    HRESULT GetMaxThreads(uint*);
    HRESULT GetAvailableThreads(uint*);
    HRESULT SetMinThreads(uint);
    HRESULT GetMinThreads(uint*);
}
enum IID_ICLRIoCompletionManager = GUID(0x2d74ce86, 0xb8d6, 0x4c84, [0xb3, 0xa7, 0x97, 0x68, 0x93, 0x3b, 0x3c, 0x12]);
interface ICLRIoCompletionManager : IUnknown
{
    HRESULT OnComplete(uint, uint, void*);
}
enum IID_IHostIoCompletionManager = GUID(0x8bde9d80, 0xec06, 0x41d6, [0x83, 0xe6, 0x22, 0x58, 0xe, 0xff, 0xcc, 0x20]);
interface IHostIoCompletionManager : IUnknown
{
    HRESULT CreateIoCompletionPort(HANDLE*);
    HRESULT CloseIoCompletionPort(HANDLE);
    HRESULT SetMaxThreads(uint);
    HRESULT GetMaxThreads(uint*);
    HRESULT GetAvailableThreads(uint*);
    HRESULT GetHostOverlappedSize(uint*);
    HRESULT SetCLRIoCompletionManager(ICLRIoCompletionManager);
    HRESULT InitializeHostOverlapped(void*);
    HRESULT Bind(HANDLE, HANDLE);
    HRESULT SetMinThreads(uint);
    HRESULT GetMinThreads(uint*);
}
alias ESymbolReadingPolicy = int;
enum : int
{
    eSymbolReadingNever         = 0x00000000,
    eSymbolReadingAlways        = 0x00000001,
    eSymbolReadingFullTrustOnly = 0x00000002,
}

enum IID_ICLRDebugManager = GUID(0xdcaec6, 0x2ac0, 0x43a9, [0xac, 0xf9, 0x1e, 0x36, 0xc1, 0x39, 0xb1, 0xd]);
interface ICLRDebugManager : IUnknown
{
    HRESULT BeginConnection(uint, PWSTR);
    HRESULT SetConnectionTasks(uint, uint, ICLRTask*);
    HRESULT EndConnection(uint);
    HRESULT SetDacl(ACL*);
    HRESULT GetDacl(ACL**);
    HRESULT IsDebuggerAttached(BOOL*);
    HRESULT SetSymbolReadingPolicy(ESymbolReadingPolicy);
}
alias ECustomDumpFlavor = int;
enum : int
{
    DUMP_FLAVOR_Mini             = 0x00000000,
    DUMP_FLAVOR_CriticalCLRState = 0x00000001,
    DUMP_FLAVOR_NonHeapCLRState  = 0x00000002,
    DUMP_FLAVOR_Default          = 0x00000000,
}

alias ECustomDumpItemKind = int;
enum : int
{
    DUMP_ITEM_None = 0x00000000,
}

struct CustomDumpItem
{
    ECustomDumpItemKind itemKind;
    union
    {
        ulong pReserved;
    }
}
alias BucketParameterIndex = int;
enum : int
{
    Parameter1              = 0x00000000,
    Parameter2              = 0x00000001,
    Parameter3              = 0x00000002,
    Parameter4              = 0x00000003,
    Parameter5              = 0x00000004,
    Parameter6              = 0x00000005,
    Parameter7              = 0x00000006,
    Parameter8              = 0x00000007,
    Parameter9              = 0x00000008,
    InvalidBucketParamIndex = 0x00000009,
}

struct BucketParameters
{
    BOOL fInited;
    wchar[255] pszEventTypeName;
    wchar[2550] pszParams;
}
enum IID_ICLRErrorReportingManager = GUID(0x980d2f1a, 0xbf79, 0x4c08, [0x81, 0x2a, 0xbb, 0x97, 0x78, 0x92, 0x8f, 0x78]);
interface ICLRErrorReportingManager : IUnknown
{
    HRESULT GetBucketParametersForCurrentException(BucketParameters*);
    HRESULT BeginCustomDump(ECustomDumpFlavor, uint, CustomDumpItem*, uint);
    HRESULT EndCustomDump();
}
enum IID_IHostCrst = GUID(0x6df710a6, 0x26a4, 0x4a65, [0x8c, 0xd5, 0x72, 0x37, 0xb8, 0xbd, 0xa8, 0xdc]);
interface IHostCrst : IUnknown
{
    HRESULT Enter(uint);
    HRESULT Leave();
    HRESULT TryEnter(uint, BOOL*);
    HRESULT SetSpinCount(uint);
}
enum IID_IHostAutoEvent = GUID(0x50b0cfce, 0x4063, 0x4278, [0x96, 0x73, 0xe5, 0xcb, 0x4e, 0xd0, 0xbd, 0xb8]);
interface IHostAutoEvent : IUnknown
{
    HRESULT Wait(uint, uint);
    HRESULT Set();
}
enum IID_IHostManualEvent = GUID(0x1bf4ec38, 0xaffe, 0x4fb9, [0x85, 0xa6, 0x52, 0x52, 0x68, 0xf1, 0x5b, 0x54]);
interface IHostManualEvent : IUnknown
{
    HRESULT Wait(uint, uint);
    HRESULT Reset();
    HRESULT Set();
}
enum IID_IHostSemaphore = GUID(0x855efd47, 0xcc09, 0x463a, [0xa9, 0x7d, 0x16, 0xac, 0xab, 0x88, 0x26, 0x61]);
interface IHostSemaphore : IUnknown
{
    HRESULT Wait(uint, uint);
    HRESULT ReleaseSemaphore(int, int*);
}
enum IID_ICLRSyncManager = GUID(0x55ff199d, 0xad21, 0x48f9, [0xa1, 0x6c, 0xf2, 0x4e, 0xbb, 0xb8, 0x72, 0x7d]);
interface ICLRSyncManager : IUnknown
{
    HRESULT GetMonitorOwner(ulong, IHostTask*);
    HRESULT CreateRWLockOwnerIterator(ulong, ulong*);
    HRESULT GetRWLockOwnerNext(ulong, IHostTask*);
    HRESULT DeleteRWLockOwnerIterator(ulong);
}
enum IID_IHostSyncManager = GUID(0x234330c7, 0x5f10, 0x4f20, [0x96, 0x15, 0x51, 0x22, 0xda, 0xb7, 0xa0, 0xac]);
interface IHostSyncManager : IUnknown
{
    HRESULT SetCLRSyncManager(ICLRSyncManager);
    HRESULT CreateCrst(IHostCrst*);
    HRESULT CreateCrstWithSpinCount(uint, IHostCrst*);
    HRESULT CreateAutoEvent(IHostAutoEvent*);
    HRESULT CreateManualEvent(BOOL, IHostManualEvent*);
    HRESULT CreateMonitorEvent(ulong, IHostAutoEvent*);
    HRESULT CreateRWLockWriterEvent(ulong, IHostAutoEvent*);
    HRESULT CreateRWLockReaderEvent(BOOL, ulong, IHostManualEvent*);
    HRESULT CreateSemaphoreA(uint, uint, IHostSemaphore*);
}
alias EClrOperation = int;
enum : int
{
    OPR_ThreadAbort                        = 0x00000000,
    OPR_ThreadRudeAbortInNonCriticalRegion = 0x00000001,
    OPR_ThreadRudeAbortInCriticalRegion    = 0x00000002,
    OPR_AppDomainUnload                    = 0x00000003,
    OPR_AppDomainRudeUnload                = 0x00000004,
    OPR_ProcessExit                        = 0x00000005,
    OPR_FinalizerRun                       = 0x00000006,
    MaxClrOperation                        = 0x00000007,
}

alias EClrFailure = int;
enum : int
{
    FAIL_NonCriticalResource = 0x00000000,
    FAIL_CriticalResource    = 0x00000001,
    FAIL_FatalRuntime        = 0x00000002,
    FAIL_OrphanedLock        = 0x00000003,
    FAIL_StackOverflow       = 0x00000004,
    FAIL_AccessViolation     = 0x00000005,
    FAIL_CodeContract        = 0x00000006,
    MaxClrFailure            = 0x00000007,
}

alias EClrUnhandledException = int;
enum : int
{
    eRuntimeDeterminedPolicy = 0x00000000,
    eHostDeterminedPolicy    = 0x00000001,
}

alias EPolicyAction = int;
enum : int
{
    eNoAction            = 0x00000000,
    eThrowException      = 0x00000001,
    eAbortThread         = 0x00000002,
    eRudeAbortThread     = 0x00000003,
    eUnloadAppDomain     = 0x00000004,
    eRudeUnloadAppDomain = 0x00000005,
    eExitProcess         = 0x00000006,
    eFastExitProcess     = 0x00000007,
    eRudeExitProcess     = 0x00000008,
    eDisableRuntime      = 0x00000009,
    MaxPolicyAction      = 0x0000000a,
}

enum IID_ICLRPolicyManager = GUID(0x7d290010, 0xd781, 0x45da, [0xa6, 0xf8, 0xaa, 0x5d, 0x71, 0x1a, 0x73, 0xe]);
interface ICLRPolicyManager : IUnknown
{
    HRESULT SetDefaultAction(EClrOperation, EPolicyAction);
    HRESULT SetTimeout(EClrOperation, uint);
    HRESULT SetActionOnTimeout(EClrOperation, EPolicyAction);
    HRESULT SetTimeoutAndAction(EClrOperation, uint, EPolicyAction);
    HRESULT SetActionOnFailure(EClrFailure, EPolicyAction);
    HRESULT SetUnhandledExceptionPolicy(EClrUnhandledException);
}
enum IID_IHostPolicyManager = GUID(0x7ae49844, 0xb1e3, 0x4683, [0xba, 0x7c, 0x1e, 0x82, 0x12, 0xea, 0x3b, 0x79]);
interface IHostPolicyManager : IUnknown
{
    HRESULT OnDefaultAction(EClrOperation, EPolicyAction);
    HRESULT OnTimeout(EClrOperation, EPolicyAction);
    HRESULT OnFailure(EClrFailure, EPolicyAction);
}
alias EClrEvent = int;
enum : int
{
    Event_DomainUnload  = 0x00000000,
    Event_ClrDisabled   = 0x00000001,
    Event_MDAFired      = 0x00000002,
    Event_StackOverflow = 0x00000003,
    MaxClrEvent         = 0x00000004,
}

struct MDAInfo
{
    const(wchar)* lpMDACaption;
    const(wchar)* lpMDAMessage;
    const(wchar)* lpStackTrace;
}
alias StackOverflowType = int;
enum : int
{
    SO_Managed   = 0x00000000,
    SO_ClrEngine = 0x00000001,
    SO_Other     = 0x00000002,
}

struct StackOverflowInfo
{
    StackOverflowType soType;
    EXCEPTION_POINTERS* pExceptionInfo;
}
enum IID_IActionOnCLREvent = GUID(0x607be24b, 0xd91b, 0x4e28, [0xa2, 0x42, 0x61, 0x87, 0x1c, 0xe5, 0x6e, 0x35]);
interface IActionOnCLREvent : IUnknown
{
    HRESULT OnEvent(EClrEvent, void*);
}
enum IID_ICLROnEventManager = GUID(0x1d0e0132, 0xe64f, 0x493d, [0x92, 0x60, 0x2, 0x5c, 0xe, 0x32, 0xc1, 0x75]);
interface ICLROnEventManager : IUnknown
{
    HRESULT RegisterActionOnEvent(EClrEvent, IActionOnCLREvent);
    HRESULT UnregisterActionOnEvent(EClrEvent, IActionOnCLREvent);
}
enum IID_IHostGCManager = GUID(0x5d4ec34e, 0xf248, 0x457b, [0xb6, 0x3, 0x25, 0x5f, 0xaa, 0xba, 0xd, 0x21]);
interface IHostGCManager : IUnknown
{
    HRESULT ThreadIsBlockingForSuspension();
    HRESULT SuspensionStarting();
    HRESULT SuspensionEnding(uint);
}
enum IID_ICLRAssemblyReferenceList = GUID(0x1b2c9750, 0x2e66, 0x4bda, [0x8b, 0x44, 0xa, 0x64, 0x2c, 0x5c, 0xd7, 0x33]);
interface ICLRAssemblyReferenceList : IUnknown
{
    HRESULT IsStringAssemblyReferenceInList(const(wchar)*);
    HRESULT IsAssemblyReferenceInList(IUnknown);
}
enum IID_ICLRReferenceAssemblyEnum = GUID(0xd509cb5d, 0xcf32, 0x4876, [0xae, 0x61, 0x67, 0x77, 0xc, 0xf9, 0x19, 0x73]);
interface ICLRReferenceAssemblyEnum : IUnknown
{
    HRESULT Get(uint, PWSTR, uint*);
}
enum IID_ICLRProbingAssemblyEnum = GUID(0xd0c5fb1f, 0x416b, 0x4f97, [0x81, 0xf4, 0x7a, 0xc7, 0xdc, 0x24, 0xdd, 0x5d]);
interface ICLRProbingAssemblyEnum : IUnknown
{
    HRESULT Get(uint, PWSTR, uint*);
}
alias ECLRAssemblyIdentityFlags = int;
enum : int
{
    CLR_ASSEMBLY_IDENTITY_FLAGS_DEFAULT = 0x00000000,
}

enum IID_ICLRAssemblyIdentityManager = GUID(0x15f0a9da, 0x3ff6, 0x4393, [0x9d, 0xa9, 0xfd, 0xfd, 0x28, 0x4e, 0x69, 0x72]);
interface ICLRAssemblyIdentityManager : IUnknown
{
    HRESULT GetCLRAssemblyReferenceList(const(wchar)**, uint, ICLRAssemblyReferenceList*);
    HRESULT GetBindingIdentityFromFile(const(wchar)*, uint, PWSTR, uint*);
    HRESULT GetBindingIdentityFromStream(IStream, uint, PWSTR, uint*);
    HRESULT GetReferencedAssembliesFromFile(const(wchar)*, uint, ICLRAssemblyReferenceList, ICLRReferenceAssemblyEnum*);
    HRESULT GetReferencedAssembliesFromStream(IStream, uint, ICLRAssemblyReferenceList, ICLRReferenceAssemblyEnum*);
    HRESULT GetProbingAssembliesFromReference(uint, uint, const(wchar)*, ICLRProbingAssemblyEnum*);
    HRESULT IsStronglyNamed(const(wchar)*, BOOL*);
}
alias EHostBindingPolicyModifyFlags = int;
enum : int
{
    HOST_BINDING_POLICY_MODIFY_DEFAULT = 0x00000000,
    HOST_BINDING_POLICY_MODIFY_CHAIN   = 0x00000001,
    HOST_BINDING_POLICY_MODIFY_REMOVE  = 0x00000002,
    HOST_BINDING_POLICY_MODIFY_MAX     = 0x00000003,
}

enum IID_ICLRHostBindingPolicyManager = GUID(0x4b3545e7, 0x1856, 0x48c9, [0xa8, 0xba, 0x24, 0xb2, 0x1a, 0x75, 0x3c, 0x9]);
interface ICLRHostBindingPolicyManager : IUnknown
{
    HRESULT ModifyApplicationPolicy(const(wchar)*, const(wchar)*, ubyte*, uint, uint, ubyte*, uint*);
    HRESULT EvaluatePolicy(const(wchar)*, ubyte*, uint, PWSTR, uint*, uint*);
}
enum IID_ICLRGCManager = GUID(0x54d9007e, 0xa8e2, 0x4885, [0xb7, 0xbf, 0xf9, 0x98, 0xde, 0xee, 0x4f, 0x2a]);
interface ICLRGCManager : IUnknown
{
    HRESULT Collect(int);
    HRESULT GetStats(COR_GC_STATS*);
    HRESULT SetGCStartupLimits(uint, uint);
}
enum IID_ICLRGCManager2 = GUID(0x603b793, 0xa97a, 0x4712, [0x9c, 0xb4, 0xc, 0xd1, 0xc7, 0x4c, 0xf, 0x7c]);
interface ICLRGCManager2 : ICLRGCManager
{
    HRESULT SetGCStartupLimitsEx(ulong, ulong);
}
alias EBindPolicyLevels = int;
enum : int
{
    ePolicyLevelNone         = 0x00000000,
    ePolicyLevelRetargetable = 0x00000001,
    ePolicyUnifiedToCLR      = 0x00000002,
    ePolicyLevelApp          = 0x00000004,
    ePolicyLevelPublisher    = 0x00000008,
    ePolicyLevelHost         = 0x00000010,
    ePolicyLevelAdmin        = 0x00000020,
    ePolicyPortability       = 0x00000040,
}

struct AssemblyBindInfo
{
    uint dwAppDomainId;
    const(wchar)* lpReferencedIdentity;
    const(wchar)* lpPostPolicyIdentity;
    uint ePolicyLevel;
}
struct ModuleBindInfo
{
    uint dwAppDomainId;
    const(wchar)* lpAssemblyIdentity;
    const(wchar)* lpModuleName;
}
alias EHostApplicationPolicy = int;
enum : int
{
    HOST_APPLICATION_BINDING_POLICY = 0x00000001,
}

enum IID_IHostAssemblyStore = GUID(0x7b102a88, 0x3f7f, 0x496d, [0x8f, 0xa2, 0xc3, 0x53, 0x74, 0xe0, 0x1a, 0xf3]);
interface IHostAssemblyStore : IUnknown
{
    HRESULT ProvideAssembly(AssemblyBindInfo*, ulong*, ulong*, IStream*, IStream*);
    HRESULT ProvideModule(ModuleBindInfo*, uint*, IStream*, IStream*);
}
enum IID_IHostAssemblyManager = GUID(0x613dabd7, 0x62b2, 0x493e, [0x9e, 0x65, 0xc1, 0xe3, 0x2a, 0x1e, 0xc, 0x5e]);
interface IHostAssemblyManager : IUnknown
{
    HRESULT GetNonHostStoreAssemblies(ICLRAssemblyReferenceList*);
    HRESULT GetAssemblyStore(IHostAssemblyStore*);
}
enum IID_IHostControl = GUID(0x2ca073c, 0x7079, 0x4860, [0x88, 0xa, 0xc2, 0xf7, 0xa4, 0x49, 0xc9, 0x91]);
interface IHostControl : IUnknown
{
    HRESULT GetHostManager(const(GUID)*, void**);
    HRESULT SetAppDomainManager(uint, IUnknown);
}
enum IID_ICLRControl = GUID(0x9065597e, 0xd1a1, 0x4fb2, [0xb6, 0xba, 0x7e, 0x1f, 0xce, 0x23, 0xf, 0x61]);
interface ICLRControl : IUnknown
{
    HRESULT GetCLRManager(const(GUID)*, void**);
    HRESULT SetAppDomainManagerType(const(wchar)*, const(wchar)*);
}
enum IID_ICLRRuntimeHost = GUID(0x90f1a06c, 0x7712, 0x4762, [0x86, 0xb5, 0x7a, 0x5e, 0xba, 0x6b, 0xdb, 0x2]);
interface ICLRRuntimeHost : IUnknown
{
    HRESULT Start();
    HRESULT Stop();
    HRESULT SetHostControl(IHostControl);
    HRESULT GetCLRControl(ICLRControl*);
    HRESULT UnloadAppDomain(uint, BOOL);
    HRESULT ExecuteInAppDomain(uint, FExecuteInAppDomainCallback, void*);
    HRESULT GetCurrentAppDomainId(uint*);
    HRESULT ExecuteApplication(const(wchar)*, uint, const(wchar)**, uint, const(wchar)**, int*);
    HRESULT ExecuteInDefaultAppDomain(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint*);
}
alias EApiCategories = int;
enum : int
{
    eNoChecks                 = 0x00000000,
    eSynchronization          = 0x00000001,
    eSharedState              = 0x00000002,
    eExternalProcessMgmt      = 0x00000004,
    eSelfAffectingProcessMgmt = 0x00000008,
    eExternalThreading        = 0x00000010,
    eSelfAffectingThreading   = 0x00000020,
    eSecurityInfrastructure   = 0x00000040,
    eUI                       = 0x00000080,
    eMayLeakOnAbort           = 0x00000100,
    eAll                      = 0x000001ff,
}

enum IID_ICLRHostProtectionManager = GUID(0x89f25f5c, 0xceef, 0x43e1, [0x9c, 0xfa, 0xa6, 0x8c, 0xe8, 0x63, 0xaa, 0xac]);
interface ICLRHostProtectionManager : IUnknown
{
    HRESULT SetProtectedCategories(EApiCategories);
    HRESULT SetEagerSerializeGrantSets();
}
alias EInitializeNewDomainFlags = int;
enum : int
{
    eInitializeNewDomainFlags_None              = 0x00000000,
    eInitializeNewDomainFlags_NoSecurityChanges = 0x00000002,
}

enum IID_ICLRDomainManager = GUID(0x270d00a2, 0x8e15, 0x4d0b, [0xad, 0xeb, 0x37, 0xbc, 0x3e, 0x47, 0xdf, 0x77]);
interface ICLRDomainManager : IUnknown
{
    HRESULT SetAppDomainManagerType(const(wchar)*, const(wchar)*, EInitializeNewDomainFlags);
    HRESULT SetPropertiesForDefaultAppDomain(uint, const(wchar)**, const(wchar)**);
}
enum IID_ITypeName = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x22]);
interface ITypeName : IUnknown
{
    HRESULT GetNameCount(uint*);
    HRESULT GetNames(uint, BSTR*, uint*);
    HRESULT GetTypeArgumentCount(uint*);
    HRESULT GetTypeArguments(uint, ITypeName*, uint*);
    HRESULT GetModifierLength(uint*);
    HRESULT GetModifiers(uint, uint*, uint*);
    HRESULT GetAssemblyName(BSTR*);
}
enum IID_ITypeNameBuilder = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x23]);
interface ITypeNameBuilder : IUnknown
{
    HRESULT OpenGenericArguments();
    HRESULT CloseGenericArguments();
    HRESULT OpenGenericArgument();
    HRESULT CloseGenericArgument();
    HRESULT AddName(const(wchar)*);
    HRESULT AddPointer();
    HRESULT AddByRef();
    HRESULT AddSzArray();
    HRESULT AddArray(uint);
    HRESULT AddAssemblySpec(const(wchar)*);
    HRESULT ToString(BSTR*);
    HRESULT Clear();
}
enum IID_ITypeNameFactory = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x21]);
interface ITypeNameFactory : IUnknown
{
    HRESULT ParseTypeName(const(wchar)*, uint*, ITypeName*);
    HRESULT GetTypeNameBuilder(ITypeNameBuilder*);
}
enum IID_IApartmentCallback = GUID(0x178e5337, 0x1528, 0x4591, [0xb1, 0xc9, 0x1c, 0x6e, 0x48, 0x46, 0x86, 0xd8]);
interface IApartmentCallback : IUnknown
{
    HRESULT DoCallback(ulong, ulong);
}
enum IID_IManagedObject = GUID(0xc3fcc19e, 0xa970, 0x11d2, [0x8b, 0x5a, 0x0, 0xa0, 0xc9, 0xb7, 0xc9, 0xc4]);
interface IManagedObject : IUnknown
{
    HRESULT GetSerializedBuffer(BSTR*);
    HRESULT GetObjectIdentity(BSTR*, int*, int*);
}
enum IID_ICatalogServices = GUID(0x4c6be1e, 0x1db1, 0x4058, [0xab, 0x7a, 0x70, 0xc, 0xcc, 0xfb, 0xf2, 0x54]);
interface ICatalogServices : IUnknown
{
    HRESULT Autodone();
    HRESULT NotAutodone();
}
enum CLSID_ComCallUnmarshal = GUID(0x3f281000, 0xe95a, 0x11d2, [0x88, 0x6b, 0x0, 0xc0, 0x4f, 0x86, 0x9f, 0x4]);
struct ComCallUnmarshal
{
}
enum CLSID_ComCallUnmarshalV4 = GUID(0x45fb4600, 0xe6e8, 0x4928, [0xb2, 0x5e, 0x50, 0x47, 0x6f, 0xf7, 0x94, 0x25]);
struct ComCallUnmarshalV4
{
}
enum CLSID_CorRuntimeHost = GUID(0xcb2f6723, 0xab3a, 0x11d2, [0x9c, 0x40, 0x0, 0xc0, 0x4f, 0xa3, 0xa, 0x3e]);
struct CorRuntimeHost
{
}
enum CLSID_CLRRuntimeHost = GUID(0x90f1a06e, 0x7712, 0x4762, [0x86, 0xb5, 0x7a, 0x5e, 0xba, 0x6b, 0xdb, 0x2]);
struct CLRRuntimeHost
{
}
enum CLSID_TypeNameFactory = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x25]);
struct TypeNameFactory
{
}
alias EContextType = int;
enum : int
{
    eCurrentContext    = 0x00000000,
    eRestrictedContext = 0x00000001,
}

enum IID_IHostSecurityContext = GUID(0x7e573ce4, 0x343, 0x4423, [0x98, 0xd7, 0x63, 0x18, 0x34, 0x8a, 0x1d, 0x3c]);
interface IHostSecurityContext : IUnknown
{
    HRESULT Capture(IHostSecurityContext*);
}
enum IID_IHostSecurityManager = GUID(0x75ad2468, 0xa349, 0x4d02, [0xa7, 0x64, 0x76, 0xa6, 0x8a, 0xee, 0xc, 0x4f]);
interface IHostSecurityManager : IUnknown
{
    HRESULT ImpersonateLoggedOnUser(HANDLE);
    HRESULT RevertToSelf();
    HRESULT OpenThreadToken(uint, BOOL, HANDLE*);
    HRESULT SetThreadToken(HANDLE);
    HRESULT GetSecurityContext(EContextType, IHostSecurityContext*);
    HRESULT SetSecurityContext(EContextType, IHostSecurityContext);
}
enum IID_ICLRAppDomainResourceMonitor = GUID(0xc62de18c, 0x2e23, 0x4aea, [0x84, 0x23, 0xb4, 0xc, 0x1f, 0xc5, 0x9e, 0xae]);
interface ICLRAppDomainResourceMonitor : IUnknown
{
    HRESULT GetCurrentAllocated(uint, ulong*);
    HRESULT GetCurrentSurvived(uint, ulong*, ulong*);
    HRESULT GetCurrentCpuTime(uint, ulong*);
}
alias CLRCreateInstanceFnPtr = HRESULT function(const(GUID)*, const(GUID)*, void**);
alias CreateInterfaceFnPtr = HRESULT function(const(GUID)*, const(GUID)*, void**);
alias CallbackThreadSetFnPtr = HRESULT function();
alias CallbackThreadUnsetFnPtr = HRESULT function();
alias RuntimeLoadedCallbackFnPtr = void function(ICLRRuntimeInfo, CallbackThreadSetFnPtr, CallbackThreadUnsetFnPtr);
enum IID_ICLRMetaHost = GUID(0xd332db9e, 0xb9b3, 0x4125, [0x82, 0x7, 0xa1, 0x48, 0x84, 0xf5, 0x32, 0x16]);
interface ICLRMetaHost : IUnknown
{
    HRESULT GetRuntime(const(wchar)*, const(GUID)*, void**);
    HRESULT GetVersionFromFile(const(wchar)*, PWSTR, uint*);
    HRESULT EnumerateInstalledRuntimes(IEnumUnknown*);
    HRESULT EnumerateLoadedRuntimes(HANDLE, IEnumUnknown*);
    HRESULT RequestRuntimeLoadedNotification(RuntimeLoadedCallbackFnPtr);
    HRESULT QueryLegacyV2RuntimeBinding(const(GUID)*, void**);
    HRESULT ExitProcess(int);
}
alias METAHOST_POLICY_FLAGS = int;
enum : int
{
    METAHOST_POLICY_HIGHCOMPAT             = 0x00000000,
    METAHOST_POLICY_APPLY_UPGRADE_POLICY   = 0x00000008,
    METAHOST_POLICY_EMULATE_EXE_LAUNCH     = 0x00000010,
    METAHOST_POLICY_SHOW_ERROR_DIALOG      = 0x00000020,
    METAHOST_POLICY_USE_PROCESS_IMAGE_PATH = 0x00000040,
    METAHOST_POLICY_ENSURE_SKU_SUPPORTED   = 0x00000080,
    METAHOST_POLICY_IGNORE_ERROR_MODE      = 0x00001000,
}

alias METAHOST_CONFIG_FLAGS = int;
enum : int
{
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_UNSET = 0x00000000,
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_TRUE  = 0x00000001,
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_FALSE = 0x00000002,
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_MASK  = 0x00000003,
}

enum IID_ICLRMetaHostPolicy = GUID(0xe2190695, 0x77b2, 0x492e, [0x8e, 0x14, 0xc4, 0xb3, 0xa7, 0xfd, 0xd5, 0x93]);
interface ICLRMetaHostPolicy : IUnknown
{
    HRESULT GetRequestedRuntime(METAHOST_POLICY_FLAGS, const(wchar)*, IStream, PWSTR, uint*, PWSTR, uint*, uint*, const(GUID)*, void**);
}
enum IID_ICLRProfiling = GUID(0xb349abe3, 0xb56f, 0x4689, [0xbf, 0xcd, 0x76, 0xbf, 0x39, 0xd8, 0x88, 0xea]);
interface ICLRProfiling : IUnknown
{
    HRESULT AttachProfiler(uint, uint, const(GUID)*, const(wchar)*, void*, uint);
}
struct CLR_DEBUGGING_VERSION
{
    ushort wStructVersion;
    ushort wMajor;
    ushort wMinor;
    ushort wBuild;
    ushort wRevision;
}
alias CLR_DEBUGGING_PROCESS_FLAGS = int;
enum : int
{
    CLR_DEBUGGING_MANAGED_EVENT_PENDING         = 0x00000001,
    CLR_DEBUGGING_MANAGED_EVENT_DEBUGGER_LAUNCH = 0x00000002,
}

enum IID_ICLRDebuggingLibraryProvider = GUID(0x3151c08d, 0x4d09, 0x4f9b, [0x88, 0x38, 0x28, 0x80, 0xbf, 0x18, 0xfe, 0x51]);
interface ICLRDebuggingLibraryProvider : IUnknown
{
    HRESULT ProvideLibrary(const(wchar)*, uint, uint, HMODULE*);
}
enum IID_ICLRDebugging = GUID(0xd28f3c5a, 0x9634, 0x4206, [0xa5, 0x9, 0x47, 0x75, 0x52, 0xee, 0xfb, 0x10]);
interface ICLRDebugging : IUnknown
{
    HRESULT OpenVirtualProcess(ulong, IUnknown, ICLRDebuggingLibraryProvider, CLR_DEBUGGING_VERSION*, const(GUID)*, IUnknown*, CLR_DEBUGGING_VERSION*, CLR_DEBUGGING_PROCESS_FLAGS*);
    HRESULT CanUnloadNow(HMODULE);
}
enum IID_ICLRRuntimeInfo = GUID(0xbd39d1d2, 0xba2f, 0x486a, [0x89, 0xb0, 0xb4, 0xb0, 0xcb, 0x46, 0x68, 0x91]);
interface ICLRRuntimeInfo : IUnknown
{
    HRESULT GetVersionString(PWSTR, uint*);
    HRESULT GetRuntimeDirectory(PWSTR, uint*);
    HRESULT IsLoaded(HANDLE, BOOL*);
    HRESULT LoadErrorString(uint, PWSTR, uint*, int);
    HRESULT LoadLibraryA(const(wchar)*, HMODULE*);
    HRESULT GetProcAddress(const(char)*, void**);
    HRESULT GetInterface(const(GUID)*, const(GUID)*, void**);
    HRESULT IsLoadable(BOOL*);
    HRESULT SetDefaultStartupFlags(uint, const(wchar)*);
    HRESULT GetDefaultStartupFlags(uint*, PWSTR, uint*);
    HRESULT BindAsLegacyV2Runtime();
    HRESULT IsStarted(BOOL*, uint*);
}
enum IID_ICLRStrongName = GUID(0x9fd93ccf, 0x3280, 0x4391, [0xb3, 0xa9, 0x96, 0xe1, 0xcd, 0xe7, 0x7c, 0x8d]);
interface ICLRStrongName : IUnknown
{
    HRESULT GetHashFromAssemblyFile(const(char)*, uint*, ubyte*, uint, uint*);
    HRESULT GetHashFromAssemblyFileW(const(wchar)*, uint*, ubyte*, uint, uint*);
    HRESULT GetHashFromBlob(ubyte*, uint, uint*, ubyte*, uint, uint*);
    HRESULT GetHashFromFile(const(char)*, uint*, ubyte*, uint, uint*);
    HRESULT GetHashFromFileW(const(wchar)*, uint*, ubyte*, uint, uint*);
    HRESULT GetHashFromHandle(HANDLE, uint*, ubyte*, uint, uint*);
    HRESULT StrongNameCompareAssemblies(const(wchar)*, const(wchar)*, uint*);
    HRESULT StrongNameFreeBuffer(ubyte*);
    HRESULT StrongNameGetBlob(const(wchar)*, ubyte*, uint*);
    HRESULT StrongNameGetBlobFromImage(ubyte*, uint, ubyte*, uint*);
    HRESULT StrongNameGetPublicKey(const(wchar)*, ubyte*, uint, ubyte**, uint*);
    HRESULT StrongNameHashSize(uint, uint*);
    HRESULT StrongNameKeyDelete(const(wchar)*);
    HRESULT StrongNameKeyGen(const(wchar)*, uint, ubyte**, uint*);
    HRESULT StrongNameKeyGenEx(const(wchar)*, uint, uint, ubyte**, uint*);
    HRESULT StrongNameKeyInstall(const(wchar)*, ubyte*, uint);
    HRESULT StrongNameSignatureGeneration(const(wchar)*, const(wchar)*, ubyte*, uint, ubyte**, uint*);
    HRESULT StrongNameSignatureGenerationEx(const(wchar)*, const(wchar)*, ubyte*, uint, ubyte**, uint*, uint);
    HRESULT StrongNameSignatureSize(ubyte*, uint, uint*);
    HRESULT StrongNameSignatureVerification(const(wchar)*, uint, uint*);
    HRESULT StrongNameSignatureVerificationEx(const(wchar)*, BOOLEAN, ubyte*);
    HRESULT StrongNameSignatureVerificationFromImage(ubyte*, uint, uint, uint*);
    HRESULT StrongNameTokenFromAssembly(const(wchar)*, ubyte**, uint*);
    HRESULT StrongNameTokenFromAssemblyEx(const(wchar)*, ubyte**, uint*, ubyte**, uint*);
    HRESULT StrongNameTokenFromPublicKey(ubyte*, uint, ubyte**, uint*);
}
enum IID_ICLRStrongName2 = GUID(0xc22ed5c5, 0x4b59, 0x4975, [0x90, 0xeb, 0x85, 0xea, 0x55, 0xc0, 0x6, 0x9b]);
interface ICLRStrongName2 : IUnknown
{
    HRESULT StrongNameGetPublicKeyEx(const(wchar)*, ubyte*, uint, ubyte**, uint*, uint, uint);
    HRESULT StrongNameSignatureVerificationEx2(const(wchar)*, BOOLEAN, ubyte*, uint, ubyte*);
}
enum IID_ICLRStrongName3 = GUID(0x22c7089b, 0xbbd3, 0x414a, [0xb6, 0x98, 0x21, 0xf, 0x26, 0x3f, 0x1f, 0xed]);
interface ICLRStrongName3 : IUnknown
{
    HRESULT StrongNameDigestGenerate(const(wchar)*, ubyte**, uint*, uint);
    HRESULT StrongNameDigestSign(const(wchar)*, ubyte*, uint, ubyte*, uint, uint, ubyte**, uint*, uint);
    HRESULT StrongNameDigestEmbed(const(wchar)*, ubyte*, uint);
}
