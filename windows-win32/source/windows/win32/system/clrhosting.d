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

HRESULT GetCORSystemDirectory(PWSTR pbuffer, uint cchBuffer, uint* dwLength);
HRESULT GetCORVersion(PWSTR pbBuffer, uint cchBuffer, uint* dwLength);
HRESULT GetFileVersion(const(wchar)* szFilename, PWSTR szBuffer, uint cchBuffer, uint* dwLength);
HRESULT GetCORRequiredVersion(PWSTR pbuffer, uint cchBuffer, uint* dwLength);
HRESULT GetRequestedRuntimeInfo(const(wchar)* pExe, const(wchar)* pwszVersion, const(wchar)* pConfigurationFile, uint startupFlags, uint runtimeInfoFlags, PWSTR pDirectory, uint dwDirectory, uint* dwDirectoryLength, PWSTR pVersion, uint cchBuffer, uint* dwlength);
HRESULT GetRequestedRuntimeVersion(PWSTR pExe, PWSTR pVersion, uint cchBuffer, uint* dwLength);
HRESULT CorBindToRuntimeHost(const(wchar)* pwszVersion, const(wchar)* pwszBuildFlavor, const(wchar)* pwszHostConfigFile, void* pReserved, uint startupFlags, const(GUID)* rclsid, const(GUID)* riid, void** ppv);
HRESULT CorBindToRuntimeEx(const(wchar)* pwszVersion, const(wchar)* pwszBuildFlavor, uint startupFlags, const(GUID)* rclsid, const(GUID)* riid, void** ppv);
HRESULT CorBindToRuntimeByCfg(IStream pCfgStream, uint reserved, uint startupFlags, const(GUID)* rclsid, const(GUID)* riid, void** ppv);
HRESULT CorBindToRuntime(const(wchar)* pwszVersion, const(wchar)* pwszBuildFlavor, const(GUID)* rclsid, const(GUID)* riid, void** ppv);
HRESULT CorBindToCurrentRuntime(const(wchar)* pwszFileName, const(GUID)* rclsid, const(GUID)* riid, void** ppv);
HRESULT ClrCreateManagedInstance(const(wchar)* pTypeName, const(GUID)* riid, void** ppObject);
void CorMarkThreadInThreadPool();
HRESULT RunDll32ShimW(HWND hwnd, HINSTANCE hinst, const(wchar)* lpszCmdLine, int nCmdShow);
HRESULT LoadLibraryShim(const(wchar)* szDllName, const(wchar)* szVersion, void* pvReserved, HMODULE* phModDll);
HRESULT CallFunctionShim(const(wchar)* szDllName, const(char)* szFunctionName, void* lpvArgument1, void* lpvArgument2, const(wchar)* szVersion, void* pvReserved);
HRESULT GetRealProcAddress(const(char)* pwszProcName, void** ppv);
void CorExitProcess(int exitCode);
HRESULT LoadStringRC(uint iResouceID, PWSTR szBuffer, int iMax, int bQuiet);
HRESULT LoadStringRCEx(uint lcid, uint iResouceID, PWSTR szBuffer, int iMax, int bQuiet, int* pcwchUsed);
HRESULT LockClrVersion(FLockClrVersionCallback hostCallback, FLockClrVersionCallback* pBeginHostSetup, FLockClrVersionCallback* pEndHostSetup);
HRESULT CreateDebuggingInterfaceFromVersion(int iDebuggerVersion, const(wchar)* szDebuggeeVersion, IUnknown* ppCordb);
HRESULT GetVersionFromProcess(HANDLE hProcess, PWSTR pVersion, uint cchBuffer, uint* dwLength);
HRESULT CorLaunchApplication(HOST_TYPE dwClickOnceHost, const(wchar)* pwzAppFullName, uint dwManifestPaths, const(wchar)** ppwzManifestPaths, uint dwActivationData, const(wchar)** ppwzActivationData, PROCESS_INFORMATION* lpProcessInformation);
HRESULT GetRequestedRuntimeVersionForCLSID(const(GUID)* rclsid, PWSTR pVersion, uint cchBuffer, uint* dwLength, CLSID_RESOLUTION_FLAGS dwResolutionFlags);
HRESULT GetCLRIdentityManager(const(GUID)* riid, IUnknown* ppManager);
HRESULT CLRCreateInstance(const(GUID)* clsid, const(GUID)* riid, void** ppInterface);
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
    HRESULT SetGCStartupLimits(uint SegmentSize, uint MaxGen0Size);
    HRESULT Collect(int Generation);
    HRESULT GetStats(COR_GC_STATS* pStats);
    HRESULT GetThreadStats(uint* pFiberCookie, COR_GC_THREAD_STATS* pStats);
    HRESULT SetVirtualMemLimit(ulong sztMaxVirtualMemMB);
}
enum IID_IGCHost2 = GUID(0xa1d70cec, 0x2dbe, 0x4e2f, [0x92, 0x91, 0xfd, 0xf8, 0x14, 0x38, 0xa1, 0xdf]);
interface IGCHost2 : IGCHost
{
    HRESULT SetGCStartupLimitsEx(ulong SegmentSize, ulong MaxGen0Size);
}
alias FLockClrVersionCallback = HRESULT function();
alias HOST_TYPE = int;
enum : int
{
    HOST_TYPE_DEFAULT   = 0x00000000,
    HOST_TYPE_APPLAUNCH = 0x00000001,
    HOST_TYPE_CORFLAG   = 0x00000002,
}

alias FExecuteInAppDomainCallback = HRESULT function(void* cookie);
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
    HRESULT Unwrap(VARIANT* ppv);
}
enum IID_IAppDomainBinding = GUID(0x5c2b07a7, 0x1e98, 0x11d3, [0x87, 0x2f, 0x0, 0xc0, 0x4f, 0x79, 0xed, 0xd]);
interface IAppDomainBinding : IUnknown
{
    HRESULT OnAppDomain(IUnknown pAppdomain);
}
enum IID_IGCThreadControl = GUID(0xf31d1788, 0xc397, 0x4725, [0x87, 0xa5, 0x6a, 0xf3, 0x47, 0x2c, 0x27, 0x91]);
interface IGCThreadControl : IUnknown
{
    HRESULT ThreadIsBlockingForSuspension();
    HRESULT SuspensionStarting();
    HRESULT SuspensionEnding(uint Generation);
}
enum IID_IGCHostControl = GUID(0x5513d564, 0x8374, 0x4cb9, [0xae, 0xd9, 0x0, 0x83, 0xf4, 0x16, 0xa, 0x1d]);
interface IGCHostControl : IUnknown
{
    HRESULT RequestVirtualMemLimit(ulong sztMaxVirtualMemMB, ulong* psztNewMaxVirtualMemMB);
}
alias PTLS_CALLBACK_FUNCTION = void function(void* __MIDL____MIDL_itf_mscoree_0000_00040005);
enum IID_ICorThreadpool = GUID(0x84680d3a, 0xb2c1, 0x46e8, [0xac, 0xc2, 0xdb, 0xc0, 0xa3, 0x59, 0x15, 0x9a]);
interface ICorThreadpool : IUnknown
{
    HRESULT CorRegisterWaitForSingleObject(HANDLE* phNewWaitObject, HANDLE hWaitObject, WAITORTIMERCALLBACK Callback, void* Context, uint timeout, BOOL executeOnlyOnce, BOOL* result);
    HRESULT CorUnregisterWait(HANDLE hWaitObject, HANDLE CompletionEvent, BOOL* result);
    HRESULT CorQueueUserWorkItem(LPTHREAD_START_ROUTINE Function, void* Context, BOOL executeOnlyOnce, BOOL* result);
    HRESULT CorCreateTimer(HANDLE* phNewTimer, WAITORTIMERCALLBACK Callback, void* Parameter, uint DueTime, uint Period, BOOL* result);
    HRESULT CorChangeTimer(HANDLE Timer, uint DueTime, uint Period, BOOL* result);
    HRESULT CorDeleteTimer(HANDLE Timer, HANDLE CompletionEvent, BOOL* result);
    HRESULT CorBindIoCompletionCallback(HANDLE fileHandle, LPOVERLAPPED_COMPLETION_ROUTINE callback);
    HRESULT CorCallOrQueueUserWorkItem(LPTHREAD_START_ROUTINE Function, void* Context, BOOL* result);
    HRESULT CorSetMaxThreads(uint MaxWorkerThreads, uint MaxIOCompletionThreads);
    HRESULT CorGetMaxThreads(uint* MaxWorkerThreads, uint* MaxIOCompletionThreads);
    HRESULT CorGetAvailableThreads(uint* AvailableWorkerThreads, uint* AvailableIOCompletionThreads);
}
enum IID_IDebuggerThreadControl = GUID(0x23d86786, 0xbb5, 0x4774, [0x8f, 0xb5, 0xe3, 0x52, 0x2a, 0xdd, 0x62, 0x46]);
interface IDebuggerThreadControl : IUnknown
{
    HRESULT ThreadIsBlockingForDebugger();
    HRESULT ReleaseAllRuntimeThreads();
    HRESULT StartBlockingForDebugger(uint dwUnused);
}
enum IID_IDebuggerInfo = GUID(0xbf24142d, 0xa47d, 0x4d24, [0xa6, 0x6d, 0x8c, 0x21, 0x41, 0x94, 0x4e, 0x44]);
interface IDebuggerInfo : IUnknown
{
    HRESULT IsDebuggerAttached(BOOL* pbAttached);
}
enum IID_ICorConfiguration = GUID(0x5c2b07a5, 0x1e98, 0x11d3, [0x87, 0x2f, 0x0, 0xc0, 0x4f, 0x79, 0xed, 0xd]);
interface ICorConfiguration : IUnknown
{
    HRESULT SetGCThreadControl(IGCThreadControl pGCThreadControl);
    HRESULT SetGCHostControl(IGCHostControl pGCHostControl);
    HRESULT SetDebuggerThreadControl(IDebuggerThreadControl pDebuggerThreadControl);
    HRESULT AddDebuggerSpecialThread(uint dwSpecialThreadId);
}
enum IID_ICorRuntimeHost = GUID(0xcb2f6722, 0xab3a, 0x11d2, [0x9c, 0x40, 0x0, 0xc0, 0x4f, 0xa3, 0xa, 0x3e]);
interface ICorRuntimeHost : IUnknown
{
    HRESULT CreateLogicalThreadState();
    HRESULT DeleteLogicalThreadState();
    HRESULT SwitchInLogicalThreadState(uint* pFiberCookie);
    HRESULT SwitchOutLogicalThreadState(uint** pFiberCookie);
    HRESULT LocksHeldByLogicalThread(uint* pCount);
    HRESULT MapFile(HANDLE hFile, HMODULE* hMapAddress);
    HRESULT GetConfiguration(ICorConfiguration* pConfiguration);
    HRESULT Start();
    HRESULT Stop();
    HRESULT CreateDomain(const(wchar)* pwzFriendlyName, IUnknown pIdentityArray, IUnknown* pAppDomain);
    HRESULT GetDefaultDomain(IUnknown* pAppDomain);
    HRESULT EnumDomains(void** hEnum);
    HRESULT NextDomain(void* hEnum, IUnknown* pAppDomain);
    HRESULT CloseEnum(void* hEnum);
    HRESULT CreateDomainEx(const(wchar)* pwzFriendlyName, IUnknown pSetup, IUnknown pEvidence, IUnknown* pAppDomain);
    HRESULT CreateDomainSetup(IUnknown* pAppDomainSetup);
    HRESULT CreateEvidence(IUnknown* pEvidence);
    HRESULT UnloadDomain(IUnknown pAppDomain);
    HRESULT CurrentDomain(IUnknown* pAppDomain);
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
    HRESULT OnMemoryNotification(EMemoryAvailable eMemoryAvailable);
}
enum IID_IHostMalloc = GUID(0x1831991c, 0xcc53, 0x4a31, [0xb2, 0x18, 0x4, 0xe9, 0x10, 0x44, 0x64, 0x79]);
interface IHostMalloc : IUnknown
{
    HRESULT Alloc(ulong cbSize, EMemoryCriticalLevel eCriticalLevel, void** ppMem);
    HRESULT DebugAlloc(ulong cbSize, EMemoryCriticalLevel eCriticalLevel, ubyte* pszFileName, int iLineNo, void** ppMem);
    HRESULT Free(void* pMem);
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
    HRESULT CreateMalloc(uint dwMallocType, IHostMalloc* ppMalloc);
    HRESULT VirtualAlloc(void* pAddress, ulong dwSize, uint flAllocationType, uint flProtect, EMemoryCriticalLevel eCriticalLevel, void** ppMem);
    HRESULT VirtualFree(void* lpAddress, ulong dwSize, uint dwFreeType);
    HRESULT VirtualQuery(void* lpAddress, void* lpBuffer, ulong dwLength, ulong* pResult);
    HRESULT VirtualProtect(void* lpAddress, ulong dwSize, uint flNewProtect, uint* pflOldProtect);
    HRESULT GetMemoryLoad(uint* pMemoryLoad, ulong* pAvailableBytes);
    HRESULT RegisterMemoryNotificationCallback(ICLRMemoryNotificationCallback pCallback);
    HRESULT NeedsVirtualAddressSpace(void* startAddress, ulong size);
    HRESULT AcquiredVirtualAddressSpace(void* startAddress, ulong size);
    HRESULT ReleasedVirtualAddressSpace(void* startAddress);
}
enum IID_ICLRTask = GUID(0x28e66a4a, 0x9906, 0x4225, [0xb2, 0x31, 0x91, 0x87, 0xc3, 0xeb, 0x86, 0x11]);
interface ICLRTask : IUnknown
{
    HRESULT SwitchIn(HANDLE threadHandle);
    HRESULT SwitchOut();
    HRESULT GetMemStats(COR_GC_THREAD_STATS* memUsage);
    HRESULT Reset(BOOL fFull);
    HRESULT ExitTask();
    HRESULT Abort();
    HRESULT RudeAbort();
    HRESULT NeedsPriorityScheduling(BOOL* pbNeedsPriorityScheduling);
    HRESULT YieldTask();
    HRESULT LocksHeld(ulong* pLockCount);
    HRESULT SetTaskIdentifier(ulong asked);
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
    HRESULT Join(uint dwMilliseconds, uint option);
    HRESULT SetPriority(int newPriority);
    HRESULT GetPriority(int* pPriority);
    HRESULT SetCLRTask(ICLRTask pCLRTask);
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
    HRESULT CreateTask(ICLRTask* pTask);
    HRESULT GetCurrentTask(ICLRTask* pTask);
    HRESULT SetUILocale(uint lcid);
    HRESULT SetLocale(uint lcid);
    HRESULT GetCurrentTaskType(ETaskType* pTaskType);
}
enum IID_IHostTaskManager = GUID(0x997ff24c, 0x43b7, 0x4352, [0x86, 0x67, 0xd, 0xc0, 0x4f, 0xaf, 0xd3, 0x54]);
interface IHostTaskManager : IUnknown
{
    HRESULT GetCurrentTask(IHostTask* pTask);
    HRESULT CreateTask(uint dwStackSize, LPTHREAD_START_ROUTINE pStartAddress, void* pParameter, IHostTask* ppTask);
    HRESULT Sleep(uint dwMilliseconds, uint option);
    HRESULT SwitchToTask(uint option);
    HRESULT SetUILocale(uint lcid);
    HRESULT SetLocale(uint lcid);
    HRESULT CallNeedsHostHook(ulong target, BOOL* pbCallNeedsHostHook);
    HRESULT LeaveRuntime(ulong target);
    HRESULT EnterRuntime();
    HRESULT ReverseLeaveRuntime();
    HRESULT ReverseEnterRuntime();
    HRESULT BeginDelayAbort();
    HRESULT EndDelayAbort();
    HRESULT BeginThreadAffinity();
    HRESULT EndThreadAffinity();
    HRESULT SetStackGuarantee(uint guarantee);
    HRESULT GetStackGuarantee(uint* pGuarantee);
    HRESULT SetCLRTaskManager(ICLRTaskManager ppManager);
}
enum IID_IHostThreadpoolManager = GUID(0x983d50e2, 0xcb15, 0x466b, [0x80, 0xfc, 0x84, 0x5d, 0xc6, 0xe8, 0xc5, 0xfd]);
interface IHostThreadpoolManager : IUnknown
{
    HRESULT QueueUserWorkItem(LPTHREAD_START_ROUTINE Function, void* Context, uint Flags);
    HRESULT SetMaxThreads(uint dwMaxWorkerThreads);
    HRESULT GetMaxThreads(uint* pdwMaxWorkerThreads);
    HRESULT GetAvailableThreads(uint* pdwAvailableWorkerThreads);
    HRESULT SetMinThreads(uint dwMinIOCompletionThreads);
    HRESULT GetMinThreads(uint* pdwMinIOCompletionThreads);
}
enum IID_ICLRIoCompletionManager = GUID(0x2d74ce86, 0xb8d6, 0x4c84, [0xb3, 0xa7, 0x97, 0x68, 0x93, 0x3b, 0x3c, 0x12]);
interface ICLRIoCompletionManager : IUnknown
{
    HRESULT OnComplete(uint dwErrorCode, uint NumberOfBytesTransferred, void* pvOverlapped);
}
enum IID_IHostIoCompletionManager = GUID(0x8bde9d80, 0xec06, 0x41d6, [0x83, 0xe6, 0x22, 0x58, 0xe, 0xff, 0xcc, 0x20]);
interface IHostIoCompletionManager : IUnknown
{
    HRESULT CreateIoCompletionPort(HANDLE* phPort);
    HRESULT CloseIoCompletionPort(HANDLE hPort);
    HRESULT SetMaxThreads(uint dwMaxIOCompletionThreads);
    HRESULT GetMaxThreads(uint* pdwMaxIOCompletionThreads);
    HRESULT GetAvailableThreads(uint* pdwAvailableIOCompletionThreads);
    HRESULT GetHostOverlappedSize(uint* pcbSize);
    HRESULT SetCLRIoCompletionManager(ICLRIoCompletionManager pManager);
    HRESULT InitializeHostOverlapped(void* pvOverlapped);
    HRESULT Bind(HANDLE hPort, HANDLE hHandle);
    HRESULT SetMinThreads(uint dwMinIOCompletionThreads);
    HRESULT GetMinThreads(uint* pdwMinIOCompletionThreads);
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
    HRESULT BeginConnection(uint dwConnectionId, PWSTR szConnectionName);
    HRESULT SetConnectionTasks(uint id, uint dwCount, ICLRTask* ppCLRTask);
    HRESULT EndConnection(uint dwConnectionId);
    HRESULT SetDacl(ACL* pacl);
    HRESULT GetDacl(ACL** pacl);
    HRESULT IsDebuggerAttached(BOOL* pbAttached);
    HRESULT SetSymbolReadingPolicy(ESymbolReadingPolicy policy);
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
    HRESULT GetBucketParametersForCurrentException(BucketParameters* pParams);
    HRESULT BeginCustomDump(ECustomDumpFlavor dwFlavor, uint dwNumItems, CustomDumpItem* items, uint dwReserved);
    HRESULT EndCustomDump();
}
enum IID_IHostCrst = GUID(0x6df710a6, 0x26a4, 0x4a65, [0x8c, 0xd5, 0x72, 0x37, 0xb8, 0xbd, 0xa8, 0xdc]);
interface IHostCrst : IUnknown
{
    HRESULT Enter(uint option);
    HRESULT Leave();
    HRESULT TryEnter(uint option, BOOL* pbSucceeded);
    HRESULT SetSpinCount(uint dwSpinCount);
}
enum IID_IHostAutoEvent = GUID(0x50b0cfce, 0x4063, 0x4278, [0x96, 0x73, 0xe5, 0xcb, 0x4e, 0xd0, 0xbd, 0xb8]);
interface IHostAutoEvent : IUnknown
{
    HRESULT Wait(uint dwMilliseconds, uint option);
    HRESULT Set();
}
enum IID_IHostManualEvent = GUID(0x1bf4ec38, 0xaffe, 0x4fb9, [0x85, 0xa6, 0x52, 0x52, 0x68, 0xf1, 0x5b, 0x54]);
interface IHostManualEvent : IUnknown
{
    HRESULT Wait(uint dwMilliseconds, uint option);
    HRESULT Reset();
    HRESULT Set();
}
enum IID_IHostSemaphore = GUID(0x855efd47, 0xcc09, 0x463a, [0xa9, 0x7d, 0x16, 0xac, 0xab, 0x88, 0x26, 0x61]);
interface IHostSemaphore : IUnknown
{
    HRESULT Wait(uint dwMilliseconds, uint option);
    HRESULT ReleaseSemaphore(int lReleaseCount, int* lpPreviousCount);
}
enum IID_ICLRSyncManager = GUID(0x55ff199d, 0xad21, 0x48f9, [0xa1, 0x6c, 0xf2, 0x4e, 0xbb, 0xb8, 0x72, 0x7d]);
interface ICLRSyncManager : IUnknown
{
    HRESULT GetMonitorOwner(ulong Cookie, IHostTask* ppOwnerHostTask);
    HRESULT CreateRWLockOwnerIterator(ulong Cookie, ulong* pIterator);
    HRESULT GetRWLockOwnerNext(ulong Iterator, IHostTask* ppOwnerHostTask);
    HRESULT DeleteRWLockOwnerIterator(ulong Iterator);
}
enum IID_IHostSyncManager = GUID(0x234330c7, 0x5f10, 0x4f20, [0x96, 0x15, 0x51, 0x22, 0xda, 0xb7, 0xa0, 0xac]);
interface IHostSyncManager : IUnknown
{
    HRESULT SetCLRSyncManager(ICLRSyncManager pManager);
    HRESULT CreateCrst(IHostCrst* ppCrst);
    HRESULT CreateCrstWithSpinCount(uint dwSpinCount, IHostCrst* ppCrst);
    HRESULT CreateAutoEvent(IHostAutoEvent* ppEvent);
    HRESULT CreateManualEvent(BOOL bInitialState, IHostManualEvent* ppEvent);
    HRESULT CreateMonitorEvent(ulong Cookie, IHostAutoEvent* ppEvent);
    HRESULT CreateRWLockWriterEvent(ulong Cookie, IHostAutoEvent* ppEvent);
    HRESULT CreateRWLockReaderEvent(BOOL bInitialState, ulong Cookie, IHostManualEvent* ppEvent);
    HRESULT CreateSemaphoreA(uint dwInitial, uint dwMax, IHostSemaphore* ppSemaphore);
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
    HRESULT SetDefaultAction(EClrOperation operation, EPolicyAction action);
    HRESULT SetTimeout(EClrOperation operation, uint dwMilliseconds);
    HRESULT SetActionOnTimeout(EClrOperation operation, EPolicyAction action);
    HRESULT SetTimeoutAndAction(EClrOperation operation, uint dwMilliseconds, EPolicyAction action);
    HRESULT SetActionOnFailure(EClrFailure failure, EPolicyAction action);
    HRESULT SetUnhandledExceptionPolicy(EClrUnhandledException policy);
}
enum IID_IHostPolicyManager = GUID(0x7ae49844, 0xb1e3, 0x4683, [0xba, 0x7c, 0x1e, 0x82, 0x12, 0xea, 0x3b, 0x79]);
interface IHostPolicyManager : IUnknown
{
    HRESULT OnDefaultAction(EClrOperation operation, EPolicyAction action);
    HRESULT OnTimeout(EClrOperation operation, EPolicyAction action);
    HRESULT OnFailure(EClrFailure failure, EPolicyAction action);
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
    HRESULT OnEvent(EClrEvent event, void* data);
}
enum IID_ICLROnEventManager = GUID(0x1d0e0132, 0xe64f, 0x493d, [0x92, 0x60, 0x2, 0x5c, 0xe, 0x32, 0xc1, 0x75]);
interface ICLROnEventManager : IUnknown
{
    HRESULT RegisterActionOnEvent(EClrEvent event, IActionOnCLREvent pAction);
    HRESULT UnregisterActionOnEvent(EClrEvent event, IActionOnCLREvent pAction);
}
enum IID_IHostGCManager = GUID(0x5d4ec34e, 0xf248, 0x457b, [0xb6, 0x3, 0x25, 0x5f, 0xaa, 0xba, 0xd, 0x21]);
interface IHostGCManager : IUnknown
{
    HRESULT ThreadIsBlockingForSuspension();
    HRESULT SuspensionStarting();
    HRESULT SuspensionEnding(uint Generation);
}
enum IID_ICLRAssemblyReferenceList = GUID(0x1b2c9750, 0x2e66, 0x4bda, [0x8b, 0x44, 0xa, 0x64, 0x2c, 0x5c, 0xd7, 0x33]);
interface ICLRAssemblyReferenceList : IUnknown
{
    HRESULT IsStringAssemblyReferenceInList(const(wchar)* pwzAssemblyName);
    HRESULT IsAssemblyReferenceInList(IUnknown pName);
}
enum IID_ICLRReferenceAssemblyEnum = GUID(0xd509cb5d, 0xcf32, 0x4876, [0xae, 0x61, 0x67, 0x77, 0xc, 0xf9, 0x19, 0x73]);
interface ICLRReferenceAssemblyEnum : IUnknown
{
    HRESULT Get(uint dwIndex, PWSTR pwzBuffer, uint* pcchBufferSize);
}
enum IID_ICLRProbingAssemblyEnum = GUID(0xd0c5fb1f, 0x416b, 0x4f97, [0x81, 0xf4, 0x7a, 0xc7, 0xdc, 0x24, 0xdd, 0x5d]);
interface ICLRProbingAssemblyEnum : IUnknown
{
    HRESULT Get(uint dwIndex, PWSTR pwzBuffer, uint* pcchBufferSize);
}
alias ECLRAssemblyIdentityFlags = int;
enum : int
{
    CLR_ASSEMBLY_IDENTITY_FLAGS_DEFAULT = 0x00000000,
}

enum IID_ICLRAssemblyIdentityManager = GUID(0x15f0a9da, 0x3ff6, 0x4393, [0x9d, 0xa9, 0xfd, 0xfd, 0x28, 0x4e, 0x69, 0x72]);
interface ICLRAssemblyIdentityManager : IUnknown
{
    HRESULT GetCLRAssemblyReferenceList(const(wchar)** ppwzAssemblyReferences, uint dwNumOfReferences, ICLRAssemblyReferenceList* ppReferenceList);
    HRESULT GetBindingIdentityFromFile(const(wchar)* pwzFilePath, uint dwFlags, PWSTR pwzBuffer, uint* pcchBufferSize);
    HRESULT GetBindingIdentityFromStream(IStream pStream, uint dwFlags, PWSTR pwzBuffer, uint* pcchBufferSize);
    HRESULT GetReferencedAssembliesFromFile(const(wchar)* pwzFilePath, uint dwFlags, ICLRAssemblyReferenceList pExcludeAssembliesList, ICLRReferenceAssemblyEnum* ppReferenceEnum);
    HRESULT GetReferencedAssembliesFromStream(IStream pStream, uint dwFlags, ICLRAssemblyReferenceList pExcludeAssembliesList, ICLRReferenceAssemblyEnum* ppReferenceEnum);
    HRESULT GetProbingAssembliesFromReference(uint dwMachineType, uint dwFlags, const(wchar)* pwzReferenceIdentity, ICLRProbingAssemblyEnum* ppProbingAssemblyEnum);
    HRESULT IsStronglyNamed(const(wchar)* pwzAssemblyIdentity, BOOL* pbIsStronglyNamed);
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
    HRESULT ModifyApplicationPolicy(const(wchar)* pwzSourceAssemblyIdentity, const(wchar)* pwzTargetAssemblyIdentity, ubyte* pbApplicationPolicy, uint cbAppPolicySize, uint dwPolicyModifyFlags, ubyte* pbNewApplicationPolicy, uint* pcbNewAppPolicySize);
    HRESULT EvaluatePolicy(const(wchar)* pwzReferenceIdentity, ubyte* pbApplicationPolicy, uint cbAppPolicySize, PWSTR pwzPostPolicyReferenceIdentity, uint* pcchPostPolicyReferenceIdentity, uint* pdwPoliciesApplied);
}
enum IID_ICLRGCManager = GUID(0x54d9007e, 0xa8e2, 0x4885, [0xb7, 0xbf, 0xf9, 0x98, 0xde, 0xee, 0x4f, 0x2a]);
interface ICLRGCManager : IUnknown
{
    HRESULT Collect(int Generation);
    HRESULT GetStats(COR_GC_STATS* pStats);
    HRESULT SetGCStartupLimits(uint SegmentSize, uint MaxGen0Size);
}
enum IID_ICLRGCManager2 = GUID(0x603b793, 0xa97a, 0x4712, [0x9c, 0xb4, 0xc, 0xd1, 0xc7, 0x4c, 0xf, 0x7c]);
interface ICLRGCManager2 : ICLRGCManager
{
    HRESULT SetGCStartupLimitsEx(ulong SegmentSize, ulong MaxGen0Size);
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
    HRESULT ProvideAssembly(AssemblyBindInfo* pBindInfo, ulong* pAssemblyId, ulong* pContext, IStream* ppStmAssemblyImage, IStream* ppStmPDB);
    HRESULT ProvideModule(ModuleBindInfo* pBindInfo, uint* pdwModuleId, IStream* ppStmModuleImage, IStream* ppStmPDB);
}
enum IID_IHostAssemblyManager = GUID(0x613dabd7, 0x62b2, 0x493e, [0x9e, 0x65, 0xc1, 0xe3, 0x2a, 0x1e, 0xc, 0x5e]);
interface IHostAssemblyManager : IUnknown
{
    HRESULT GetNonHostStoreAssemblies(ICLRAssemblyReferenceList* ppReferenceList);
    HRESULT GetAssemblyStore(IHostAssemblyStore* ppAssemblyStore);
}
enum IID_IHostControl = GUID(0x2ca073c, 0x7079, 0x4860, [0x88, 0xa, 0xc2, 0xf7, 0xa4, 0x49, 0xc9, 0x91]);
interface IHostControl : IUnknown
{
    HRESULT GetHostManager(const(GUID)* riid, void** ppObject);
    HRESULT SetAppDomainManager(uint dwAppDomainID, IUnknown pUnkAppDomainManager);
}
enum IID_ICLRControl = GUID(0x9065597e, 0xd1a1, 0x4fb2, [0xb6, 0xba, 0x7e, 0x1f, 0xce, 0x23, 0xf, 0x61]);
interface ICLRControl : IUnknown
{
    HRESULT GetCLRManager(const(GUID)* riid, void** ppObject);
    HRESULT SetAppDomainManagerType(const(wchar)* pwzAppDomainManagerAssembly, const(wchar)* pwzAppDomainManagerType);
}
enum IID_ICLRRuntimeHost = GUID(0x90f1a06c, 0x7712, 0x4762, [0x86, 0xb5, 0x7a, 0x5e, 0xba, 0x6b, 0xdb, 0x2]);
interface ICLRRuntimeHost : IUnknown
{
    HRESULT Start();
    HRESULT Stop();
    HRESULT SetHostControl(IHostControl pHostControl);
    HRESULT GetCLRControl(ICLRControl* pCLRControl);
    HRESULT UnloadAppDomain(uint dwAppDomainId, BOOL fWaitUntilDone);
    HRESULT ExecuteInAppDomain(uint dwAppDomainId, FExecuteInAppDomainCallback pCallback, void* cookie);
    HRESULT GetCurrentAppDomainId(uint* pdwAppDomainId);
    HRESULT ExecuteApplication(const(wchar)* pwzAppFullName, uint dwManifestPaths, const(wchar)** ppwzManifestPaths, uint dwActivationData, const(wchar)** ppwzActivationData, int* pReturnValue);
    HRESULT ExecuteInDefaultAppDomain(const(wchar)* pwzAssemblyPath, const(wchar)* pwzTypeName, const(wchar)* pwzMethodName, const(wchar)* pwzArgument, uint* pReturnValue);
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
    HRESULT SetProtectedCategories(EApiCategories categories);
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
    HRESULT SetAppDomainManagerType(const(wchar)* wszAppDomainManagerAssembly, const(wchar)* wszAppDomainManagerType, EInitializeNewDomainFlags dwInitializeDomainFlags);
    HRESULT SetPropertiesForDefaultAppDomain(uint nProperties, const(wchar)** pwszPropertyNames, const(wchar)** pwszPropertyValues);
}
enum IID_ITypeName = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x22]);
interface ITypeName : IUnknown
{
    HRESULT GetNameCount(uint* pCount);
    HRESULT GetNames(uint count, BSTR* rgbszNames, uint* pCount);
    HRESULT GetTypeArgumentCount(uint* pCount);
    HRESULT GetTypeArguments(uint count, ITypeName* rgpArguments, uint* pCount);
    HRESULT GetModifierLength(uint* pCount);
    HRESULT GetModifiers(uint count, uint* rgModifiers, uint* pCount);
    HRESULT GetAssemblyName(BSTR* rgbszAssemblyNames);
}
enum IID_ITypeNameBuilder = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x23]);
interface ITypeNameBuilder : IUnknown
{
    HRESULT OpenGenericArguments();
    HRESULT CloseGenericArguments();
    HRESULT OpenGenericArgument();
    HRESULT CloseGenericArgument();
    HRESULT AddName(const(wchar)* szName);
    HRESULT AddPointer();
    HRESULT AddByRef();
    HRESULT AddSzArray();
    HRESULT AddArray(uint rank);
    HRESULT AddAssemblySpec(const(wchar)* szAssemblySpec);
    HRESULT ToString(BSTR* pszStringRepresentation);
    HRESULT Clear();
}
enum IID_ITypeNameFactory = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x5, 0x21]);
interface ITypeNameFactory : IUnknown
{
    HRESULT ParseTypeName(const(wchar)* szName, uint* pError, ITypeName* ppTypeName);
    HRESULT GetTypeNameBuilder(ITypeNameBuilder* ppTypeBuilder);
}
enum IID_IApartmentCallback = GUID(0x178e5337, 0x1528, 0x4591, [0xb1, 0xc9, 0x1c, 0x6e, 0x48, 0x46, 0x86, 0xd8]);
interface IApartmentCallback : IUnknown
{
    HRESULT DoCallback(ulong pFunc, ulong pData);
}
enum IID_IManagedObject = GUID(0xc3fcc19e, 0xa970, 0x11d2, [0x8b, 0x5a, 0x0, 0xa0, 0xc9, 0xb7, 0xc9, 0xc4]);
interface IManagedObject : IUnknown
{
    HRESULT GetSerializedBuffer(BSTR* pBSTR);
    HRESULT GetObjectIdentity(BSTR* pBSTRGUID, int* AppDomainID, int* pCCW);
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
    HRESULT Capture(IHostSecurityContext* ppClonedContext);
}
enum IID_IHostSecurityManager = GUID(0x75ad2468, 0xa349, 0x4d02, [0xa7, 0x64, 0x76, 0xa6, 0x8a, 0xee, 0xc, 0x4f]);
interface IHostSecurityManager : IUnknown
{
    HRESULT ImpersonateLoggedOnUser(HANDLE hToken);
    HRESULT RevertToSelf();
    HRESULT OpenThreadToken(uint dwDesiredAccess, BOOL bOpenAsSelf, HANDLE* phThreadToken);
    HRESULT SetThreadToken(HANDLE hToken);
    HRESULT GetSecurityContext(EContextType eContextType, IHostSecurityContext* ppSecurityContext);
    HRESULT SetSecurityContext(EContextType eContextType, IHostSecurityContext pSecurityContext);
}
enum IID_ICLRAppDomainResourceMonitor = GUID(0xc62de18c, 0x2e23, 0x4aea, [0x84, 0x23, 0xb4, 0xc, 0x1f, 0xc5, 0x9e, 0xae]);
interface ICLRAppDomainResourceMonitor : IUnknown
{
    HRESULT GetCurrentAllocated(uint dwAppDomainId, ulong* pBytesAllocated);
    HRESULT GetCurrentSurvived(uint dwAppDomainId, ulong* pAppDomainBytesSurvived, ulong* pTotalBytesSurvived);
    HRESULT GetCurrentCpuTime(uint dwAppDomainId, ulong* pMilliseconds);
}
alias CLRCreateInstanceFnPtr = HRESULT function(const(GUID)* clsid, const(GUID)* riid, void** ppInterface);
alias CreateInterfaceFnPtr = HRESULT function(const(GUID)* clsid, const(GUID)* riid, void** ppInterface);
alias CallbackThreadSetFnPtr = HRESULT function();
alias CallbackThreadUnsetFnPtr = HRESULT function();
alias RuntimeLoadedCallbackFnPtr = void function(ICLRRuntimeInfo pRuntimeInfo, CallbackThreadSetFnPtr pfnCallbackThreadSet, CallbackThreadUnsetFnPtr pfnCallbackThreadUnset);
enum IID_ICLRMetaHost = GUID(0xd332db9e, 0xb9b3, 0x4125, [0x82, 0x7, 0xa1, 0x48, 0x84, 0xf5, 0x32, 0x16]);
interface ICLRMetaHost : IUnknown
{
    HRESULT GetRuntime(const(wchar)* pwzVersion, const(GUID)* riid, void** ppRuntime);
    HRESULT GetVersionFromFile(const(wchar)* pwzFilePath, PWSTR pwzBuffer, uint* pcchBuffer);
    HRESULT EnumerateInstalledRuntimes(IEnumUnknown* ppEnumerator);
    HRESULT EnumerateLoadedRuntimes(HANDLE hndProcess, IEnumUnknown* ppEnumerator);
    HRESULT RequestRuntimeLoadedNotification(RuntimeLoadedCallbackFnPtr pCallbackFunction);
    HRESULT QueryLegacyV2RuntimeBinding(const(GUID)* riid, void** ppUnk);
    HRESULT ExitProcess(int iExitCode);
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
    HRESULT GetRequestedRuntime(METAHOST_POLICY_FLAGS dwPolicyFlags, const(wchar)* pwzBinary, IStream pCfgStream, PWSTR pwzVersion, uint* pcchVersion, PWSTR pwzImageVersion, uint* pcchImageVersion, uint* pdwConfigFlags, const(GUID)* riid, void** ppRuntime);
}
enum IID_ICLRProfiling = GUID(0xb349abe3, 0xb56f, 0x4689, [0xbf, 0xcd, 0x76, 0xbf, 0x39, 0xd8, 0x88, 0xea]);
interface ICLRProfiling : IUnknown
{
    HRESULT AttachProfiler(uint dwProfileeProcessID, uint dwMillisecondsMax, const(GUID)* pClsidProfiler, const(wchar)* wszProfilerPath, void* pvClientData, uint cbClientData);
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
    HRESULT ProvideLibrary(const(wchar)* pwszFileName, uint dwTimestamp, uint dwSizeOfImage, HMODULE* phModule);
}
enum IID_ICLRDebugging = GUID(0xd28f3c5a, 0x9634, 0x4206, [0xa5, 0x9, 0x47, 0x75, 0x52, 0xee, 0xfb, 0x10]);
interface ICLRDebugging : IUnknown
{
    HRESULT OpenVirtualProcess(ulong moduleBaseAddress, IUnknown pDataTarget, ICLRDebuggingLibraryProvider pLibraryProvider, CLR_DEBUGGING_VERSION* pMaxDebuggerSupportedVersion, const(GUID)* riidProcess, IUnknown* ppProcess, CLR_DEBUGGING_VERSION* pVersion, CLR_DEBUGGING_PROCESS_FLAGS* pdwFlags);
    HRESULT CanUnloadNow(HMODULE hModule);
}
enum IID_ICLRRuntimeInfo = GUID(0xbd39d1d2, 0xba2f, 0x486a, [0x89, 0xb0, 0xb4, 0xb0, 0xcb, 0x46, 0x68, 0x91]);
interface ICLRRuntimeInfo : IUnknown
{
    HRESULT GetVersionString(PWSTR pwzBuffer, uint* pcchBuffer);
    HRESULT GetRuntimeDirectory(PWSTR pwzBuffer, uint* pcchBuffer);
    HRESULT IsLoaded(HANDLE hndProcess, BOOL* pbLoaded);
    HRESULT LoadErrorString(uint iResourceID, PWSTR pwzBuffer, uint* pcchBuffer, int iLocaleID);
    HRESULT LoadLibraryA(const(wchar)* pwzDllName, HMODULE* phndModule);
    HRESULT GetProcAddress(const(char)* pszProcName, void** ppProc);
    HRESULT GetInterface(const(GUID)* rclsid, const(GUID)* riid, void** ppUnk);
    HRESULT IsLoadable(BOOL* pbLoadable);
    HRESULT SetDefaultStartupFlags(uint dwStartupFlags, const(wchar)* pwzHostConfigFile);
    HRESULT GetDefaultStartupFlags(uint* pdwStartupFlags, PWSTR pwzHostConfigFile, uint* pcchHostConfigFile);
    HRESULT BindAsLegacyV2Runtime();
    HRESULT IsStarted(BOOL* pbStarted, uint* pdwStartupFlags);
}
enum IID_ICLRStrongName = GUID(0x9fd93ccf, 0x3280, 0x4391, [0xb3, 0xa9, 0x96, 0xe1, 0xcd, 0xe7, 0x7c, 0x8d]);
interface ICLRStrongName : IUnknown
{
    HRESULT GetHashFromAssemblyFile(const(char)* pszFilePath, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT GetHashFromAssemblyFileW(const(wchar)* pwzFilePath, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT GetHashFromBlob(ubyte* pbBlob, uint cchBlob, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT GetHashFromFile(const(char)* pszFilePath, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT GetHashFromFileW(const(wchar)* pwzFilePath, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT GetHashFromHandle(HANDLE hFile, uint* piHashAlg, ubyte* pbHash, uint cchHash, uint* pchHash);
    HRESULT StrongNameCompareAssemblies(const(wchar)* pwzAssembly1, const(wchar)* pwzAssembly2, uint* pdwResult);
    HRESULT StrongNameFreeBuffer(ubyte* pbMemory);
    HRESULT StrongNameGetBlob(const(wchar)* pwzFilePath, ubyte* pbBlob, uint* pcbBlob);
    HRESULT StrongNameGetBlobFromImage(ubyte* pbBase, uint dwLength, ubyte* pbBlob, uint* pcbBlob);
    HRESULT StrongNameGetPublicKey(const(wchar)* pwzKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob, ubyte** ppbPublicKeyBlob, uint* pcbPublicKeyBlob);
    HRESULT StrongNameHashSize(uint ulHashAlg, uint* pcbSize);
    HRESULT StrongNameKeyDelete(const(wchar)* pwzKeyContainer);
    HRESULT StrongNameKeyGen(const(wchar)* pwzKeyContainer, uint dwFlags, ubyte** ppbKeyBlob, uint* pcbKeyBlob);
    HRESULT StrongNameKeyGenEx(const(wchar)* pwzKeyContainer, uint dwFlags, uint dwKeySize, ubyte** ppbKeyBlob, uint* pcbKeyBlob);
    HRESULT StrongNameKeyInstall(const(wchar)* pwzKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob);
    HRESULT StrongNameSignatureGeneration(const(wchar)* pwzFilePath, const(wchar)* pwzKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob, ubyte** ppbSignatureBlob, uint* pcbSignatureBlob);
    HRESULT StrongNameSignatureGenerationEx(const(wchar)* wszFilePath, const(wchar)* wszKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob, ubyte** ppbSignatureBlob, uint* pcbSignatureBlob, uint dwFlags);
    HRESULT StrongNameSignatureSize(ubyte* pbPublicKeyBlob, uint cbPublicKeyBlob, uint* pcbSize);
    HRESULT StrongNameSignatureVerification(const(wchar)* pwzFilePath, uint dwInFlags, uint* pdwOutFlags);
    HRESULT StrongNameSignatureVerificationEx(const(wchar)* pwzFilePath, BOOLEAN fForceVerification, ubyte* pfWasVerified);
    HRESULT StrongNameSignatureVerificationFromImage(ubyte* pbBase, uint dwLength, uint dwInFlags, uint* pdwOutFlags);
    HRESULT StrongNameTokenFromAssembly(const(wchar)* pwzFilePath, ubyte** ppbStrongNameToken, uint* pcbStrongNameToken);
    HRESULT StrongNameTokenFromAssemblyEx(const(wchar)* pwzFilePath, ubyte** ppbStrongNameToken, uint* pcbStrongNameToken, ubyte** ppbPublicKeyBlob, uint* pcbPublicKeyBlob);
    HRESULT StrongNameTokenFromPublicKey(ubyte* pbPublicKeyBlob, uint cbPublicKeyBlob, ubyte** ppbStrongNameToken, uint* pcbStrongNameToken);
}
enum IID_ICLRStrongName2 = GUID(0xc22ed5c5, 0x4b59, 0x4975, [0x90, 0xeb, 0x85, 0xea, 0x55, 0xc0, 0x6, 0x9b]);
interface ICLRStrongName2 : IUnknown
{
    HRESULT StrongNameGetPublicKeyEx(const(wchar)* pwzKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob, ubyte** ppbPublicKeyBlob, uint* pcbPublicKeyBlob, uint uHashAlgId, uint uReserved);
    HRESULT StrongNameSignatureVerificationEx2(const(wchar)* wszFilePath, BOOLEAN fForceVerification, ubyte* pbEcmaPublicKey, uint cbEcmaPublicKey, ubyte* pfWasVerified);
}
enum IID_ICLRStrongName3 = GUID(0x22c7089b, 0xbbd3, 0x414a, [0xb6, 0x98, 0x21, 0xf, 0x26, 0x3f, 0x1f, 0xed]);
interface ICLRStrongName3 : IUnknown
{
    HRESULT StrongNameDigestGenerate(const(wchar)* wszFilePath, ubyte** ppbDigestBlob, uint* pcbDigestBlob, uint dwFlags);
    HRESULT StrongNameDigestSign(const(wchar)* wszKeyContainer, ubyte* pbKeyBlob, uint cbKeyBlob, ubyte* pbDigestBlob, uint cbDigestBlob, uint hashAlgId, ubyte** ppbSignatureBlob, uint* pcbSignatureBlob, uint dwFlags);
    HRESULT StrongNameDigestEmbed(const(wchar)* wszFilePath, ubyte* pbSignatureBlob, uint cbSignatureBlob);
}
