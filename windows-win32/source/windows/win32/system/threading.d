module windows.win32.system.threading;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, HANDLE, HINSTANCE, HRESULT, LARGE_INTEGER, NTSTATUS, PAPCFUNC, PSID, PSTR, PWSTR, UNICODE_STRING;
import windows.win32.security_ : SECURITY_ATTRIBUTES, TOKEN_ACCESS_MASK;
import windows.win32.system.kernel : LIST_ENTRY, PROCESSOR_NUMBER, SLIST_ENTRY, SLIST_HEADER;
import windows.win32.system.systeminformation : GROUP_AFFINITY, IMAGE_FILE_MACHINE;
import windows.win32.system.systemservices : RTL_UMS_SCHEDULER_REASON;

version (Windows):
extern (Windows):

alias THREAD_CREATION_FLAGS = uint;
enum : uint
{
    THREAD_CREATE_RUN_IMMEDIATELY     = 0x00000000,
    THREAD_CREATE_SUSPENDED           = 0x00000004,
    STACK_SIZE_PARAM_IS_A_RESERVATION = 0x00010000,
}

alias THREAD_PRIORITY = int;
enum : int
{
    THREAD_MODE_BACKGROUND_BEGIN  = 0x00010000,
    THREAD_MODE_BACKGROUND_END    = 0x00020000,
    THREAD_PRIORITY_ABOVE_NORMAL  = 0x00000001,
    THREAD_PRIORITY_BELOW_NORMAL  = 0xffffffff,
    THREAD_PRIORITY_HIGHEST       = 0x00000002,
    THREAD_PRIORITY_IDLE          = 0xfffffff1,
    THREAD_PRIORITY_MIN           = 0xfffffffe,
    THREAD_PRIORITY_LOWEST        = 0xfffffffe,
    THREAD_PRIORITY_NORMAL        = 0x00000000,
    THREAD_PRIORITY_TIME_CRITICAL = 0x0000000f,
}

alias WORKER_THREAD_FLAGS = uint;
enum : uint
{
    WT_EXECUTEDEFAULT            = 0x00000000,
    WT_EXECUTEINIOTHREAD         = 0x00000001,
    WT_EXECUTEINPERSISTENTTHREAD = 0x00000080,
    WT_EXECUTEINWAITTHREAD       = 0x00000004,
    WT_EXECUTELONGFUNCTION       = 0x00000010,
    WT_EXECUTEONLYONCE           = 0x00000008,
    WT_TRANSFER_IMPERSONATION    = 0x00000100,
    WT_EXECUTEINTIMERTHREAD      = 0x00000020,
}

alias CREATE_EVENT = uint;
enum : uint
{
    CREATE_EVENT_INITIAL_SET  = 0x00000002,
    CREATE_EVENT_MANUAL_RESET = 0x00000001,
}

alias CREATE_PROCESS_LOGON_FLAGS = uint;
enum : uint
{
    LOGON_WITH_PROFILE        = 0x00000001,
    LOGON_NETCREDENTIALS_ONLY = 0x00000002,
}

alias PROCESS_AFFINITY_AUTO_UPDATE_FLAGS = uint;
enum : uint
{
    PROCESS_AFFINITY_DISABLE_AUTO_UPDATE = 0x00000000,
    PROCESS_AFFINITY_ENABLE_AUTO_UPDATE  = 0x00000001,
}

alias PROCESS_DEP_FLAGS = uint;
enum : uint
{
    PROCESS_DEP_ENABLE                      = 0x00000001,
    PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION = 0x00000002,
    PROCESS_DEP_NONE                        = 0x00000000,
}

alias PROCESS_NAME_FORMAT = uint;
enum : uint
{
    PROCESS_NAME_WIN32  = 0x00000000,
    PROCESS_NAME_NATIVE = 0x00000001,
}

alias PROCESSOR_FEATURE_ID = uint;
enum : uint
{
    PF_ARM_64BIT_LOADSTORE_ATOMIC            = 0x00000019,
    PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE      = 0x00000018,
    PF_ARM_EXTERNAL_CACHE_AVAILABLE          = 0x0000001a,
    PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE       = 0x0000001b,
    PF_ARM_VFP_32_REGISTERS_AVAILABLE        = 0x00000012,
    PF_3DNOW_INSTRUCTIONS_AVAILABLE          = 0x00000007,
    PF_CHANNELS_ENABLED                      = 0x00000010,
    PF_COMPARE_EXCHANGE_DOUBLE               = 0x00000002,
    PF_COMPARE_EXCHANGE128                   = 0x0000000e,
    PF_COMPARE64_EXCHANGE128                 = 0x0000000f,
    PF_FASTFAIL_AVAILABLE                    = 0x00000017,
    PF_FLOATING_POINT_EMULATED               = 0x00000001,
    PF_FLOATING_POINT_PRECISION_ERRATA       = 0x00000000,
    PF_MMX_INSTRUCTIONS_AVAILABLE            = 0x00000003,
    PF_NX_ENABLED                            = 0x0000000c,
    PF_PAE_ENABLED                           = 0x00000009,
    PF_RDTSC_INSTRUCTION_AVAILABLE           = 0x00000008,
    PF_RDWRFSGSBASE_AVAILABLE                = 0x00000016,
    PF_SECOND_LEVEL_ADDRESS_TRANSLATION      = 0x00000014,
    PF_SSE3_INSTRUCTIONS_AVAILABLE           = 0x0000000d,
    PF_VIRT_FIRMWARE_ENABLED                 = 0x00000015,
    PF_XMMI_INSTRUCTIONS_AVAILABLE           = 0x00000006,
    PF_XMMI64_INSTRUCTIONS_AVAILABLE         = 0x0000000a,
    PF_XSAVE_ENABLED                         = 0x00000011,
    PF_ARM_V8_INSTRUCTIONS_AVAILABLE         = 0x0000001d,
    PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE  = 0x0000001e,
    PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE   = 0x0000001f,
    PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 0x00000022,
}

alias GET_GUI_RESOURCES_FLAGS = uint;
enum : uint
{
    GR_GDIOBJECTS       = 0x00000000,
    GR_GDIOBJECTS_PEAK  = 0x00000002,
    GR_USEROBJECTS      = 0x00000001,
    GR_USEROBJECTS_PEAK = 0x00000004,
}

alias STARTUPINFOW_FLAGS = uint;
enum : uint
{
    STARTF_FORCEONFEEDBACK  = 0x00000040,
    STARTF_FORCEOFFFEEDBACK = 0x00000080,
    STARTF_PREVENTPINNING   = 0x00002000,
    STARTF_RUNFULLSCREEN    = 0x00000020,
    STARTF_TITLEISAPPID     = 0x00001000,
    STARTF_TITLEISLINKNAME  = 0x00000800,
    STARTF_UNTRUSTEDSOURCE  = 0x00008000,
    STARTF_USECOUNTCHARS    = 0x00000008,
    STARTF_USEFILLATTRIBUTE = 0x00000010,
    STARTF_USEHOTKEY        = 0x00000200,
    STARTF_USEPOSITION      = 0x00000004,
    STARTF_USESHOWWINDOW    = 0x00000001,
    STARTF_USESIZE          = 0x00000002,
    STARTF_USESTDHANDLES    = 0x00000100,
}

alias MEMORY_PRIORITY = uint;
enum : uint
{
    MEMORY_PRIORITY_VERY_LOW     = 0x00000001,
    MEMORY_PRIORITY_LOW          = 0x00000002,
    MEMORY_PRIORITY_MEDIUM       = 0x00000003,
    MEMORY_PRIORITY_BELOW_NORMAL = 0x00000004,
    MEMORY_PRIORITY_NORMAL       = 0x00000005,
}

alias PROCESS_PROTECTION_LEVEL = uint;
enum : uint
{
    PROTECTION_LEVEL_WINTCB_LIGHT      = 0x00000000,
    PROTECTION_LEVEL_WINDOWS           = 0x00000001,
    PROTECTION_LEVEL_WINDOWS_LIGHT     = 0x00000002,
    PROTECTION_LEVEL_ANTIMALWARE_LIGHT = 0x00000003,
    PROTECTION_LEVEL_LSA_LIGHT         = 0x00000004,
    PROTECTION_LEVEL_WINTCB            = 0x00000005,
    PROTECTION_LEVEL_CODEGEN_LIGHT     = 0x00000006,
    PROTECTION_LEVEL_AUTHENTICODE      = 0x00000007,
    PROTECTION_LEVEL_PPL_APP           = 0x00000008,
    PROTECTION_LEVEL_NONE              = 0xfffffffe,
}

alias POWER_REQUEST_CONTEXT_FLAGS = uint;
enum : uint
{
    POWER_REQUEST_CONTEXT_DETAILED_STRING = 0x00000002,
    POWER_REQUEST_CONTEXT_SIMPLE_STRING   = 0x00000001,
}

alias THREAD_ACCESS_RIGHTS = uint;
enum : uint
{
    THREAD_TERMINATE                 = 0x00000001,
    THREAD_SUSPEND_RESUME            = 0x00000002,
    THREAD_GET_CONTEXT               = 0x00000008,
    THREAD_SET_CONTEXT               = 0x00000010,
    THREAD_SET_INFORMATION           = 0x00000020,
    THREAD_QUERY_INFORMATION         = 0x00000040,
    THREAD_SET_THREAD_TOKEN          = 0x00000080,
    THREAD_IMPERSONATE               = 0x00000100,
    THREAD_DIRECT_IMPERSONATION      = 0x00000200,
    THREAD_SET_LIMITED_INFORMATION   = 0x00000400,
    THREAD_QUERY_LIMITED_INFORMATION = 0x00000800,
    THREAD_RESUME                    = 0x00001000,
    THREAD_ALL_ACCESS                = 0x001fffff,
    THREAD_DELETE                    = 0x00010000,
    THREAD_READ_CONTROL              = 0x00020000,
    THREAD_WRITE_DAC                 = 0x00040000,
    THREAD_WRITE_OWNER               = 0x00080000,
    THREAD_SYNCHRONIZE               = 0x00100000,
    THREAD_STANDARD_RIGHTS_REQUIRED  = 0x000f0000,
}

alias SYNCHRONIZATION_ACCESS_RIGHTS = uint;
enum : uint
{
    EVENT_ALL_ACCESS             = 0x001f0003,
    EVENT_MODIFY_STATE           = 0x00000002,
    MUTEX_ALL_ACCESS             = 0x001f0001,
    MUTEX_MODIFY_STATE           = 0x00000001,
    SEMAPHORE_ALL_ACCESS         = 0x001f0003,
    SEMAPHORE_MODIFY_STATE       = 0x00000002,
    TIMER_ALL_ACCESS             = 0x001f0003,
    TIMER_MODIFY_STATE           = 0x00000002,
    TIMER_QUERY_STATE            = 0x00000001,
    SYNCHRONIZATION_DELETE       = 0x00010000,
    SYNCHRONIZATION_READ_CONTROL = 0x00020000,
    SYNCHRONIZATION_WRITE_DAC    = 0x00040000,
    SYNCHRONIZATION_WRITE_OWNER  = 0x00080000,
    SYNCHRONIZATION_SYNCHRONIZE  = 0x00100000,
}

BOOL GetProcessWorkingSetSize(HANDLE, ulong*, ulong*);
BOOL SetProcessWorkingSetSize(HANDLE, ulong, ulong);
uint FlsAlloc(PFLS_CALLBACK_FUNCTION);
void* FlsGetValue(uint);
BOOL FlsSetValue(uint, void*);
BOOL FlsFree(uint);
BOOL IsThreadAFiber();
void InitializeSRWLock(RTL_SRWLOCK*);
void ReleaseSRWLockExclusive(RTL_SRWLOCK*);
void ReleaseSRWLockShared(RTL_SRWLOCK*);
void AcquireSRWLockExclusive(RTL_SRWLOCK*);
void AcquireSRWLockShared(RTL_SRWLOCK*);
BOOLEAN TryAcquireSRWLockExclusive(RTL_SRWLOCK*);
BOOLEAN TryAcquireSRWLockShared(RTL_SRWLOCK*);
void InitializeCriticalSection(RTL_CRITICAL_SECTION*);
void EnterCriticalSection(RTL_CRITICAL_SECTION*);
void LeaveCriticalSection(RTL_CRITICAL_SECTION*);
BOOL InitializeCriticalSectionAndSpinCount(RTL_CRITICAL_SECTION*, uint);
BOOL InitializeCriticalSectionEx(RTL_CRITICAL_SECTION*, uint, uint);
uint SetCriticalSectionSpinCount(RTL_CRITICAL_SECTION*, uint);
BOOL TryEnterCriticalSection(RTL_CRITICAL_SECTION*);
void DeleteCriticalSection(RTL_CRITICAL_SECTION*);
void InitOnceInitialize(RTL_RUN_ONCE*);
BOOL InitOnceExecuteOnce(RTL_RUN_ONCE*, PINIT_ONCE_FN, void*, void**);
BOOL InitOnceBeginInitialize(RTL_RUN_ONCE*, uint, BOOL*, void**);
BOOL InitOnceComplete(RTL_RUN_ONCE*, uint, void*);
void InitializeConditionVariable(RTL_CONDITION_VARIABLE*);
void WakeConditionVariable(RTL_CONDITION_VARIABLE*);
void WakeAllConditionVariable(RTL_CONDITION_VARIABLE*);
BOOL SleepConditionVariableCS(RTL_CONDITION_VARIABLE*, RTL_CRITICAL_SECTION*, uint);
BOOL SleepConditionVariableSRW(RTL_CONDITION_VARIABLE*, RTL_SRWLOCK*, uint, uint);
BOOL SetEvent(HANDLE);
BOOL ResetEvent(HANDLE);
BOOL ReleaseSemaphore(HANDLE, int, int*);
BOOL ReleaseMutex(HANDLE);
uint WaitForSingleObject(HANDLE, uint);
uint SleepEx(uint, BOOL);
uint WaitForSingleObjectEx(HANDLE, uint, BOOL);
uint WaitForMultipleObjectsEx(uint, const(HANDLE)*, BOOL, uint, BOOL);
HANDLE CreateMutexA(SECURITY_ATTRIBUTES*, BOOL, const(char)*);
HANDLE CreateMutexW(SECURITY_ATTRIBUTES*, BOOL, const(wchar)*);
HANDLE OpenMutexW(SYNCHRONIZATION_ACCESS_RIGHTS, BOOL, const(wchar)*);
HANDLE CreateEventA(SECURITY_ATTRIBUTES*, BOOL, BOOL, const(char)*);
HANDLE CreateEventW(SECURITY_ATTRIBUTES*, BOOL, BOOL, const(wchar)*);
HANDLE OpenEventA(SYNCHRONIZATION_ACCESS_RIGHTS, BOOL, const(char)*);
HANDLE OpenEventW(SYNCHRONIZATION_ACCESS_RIGHTS, BOOL, const(wchar)*);
HANDLE OpenSemaphoreW(SYNCHRONIZATION_ACCESS_RIGHTS, BOOL, const(wchar)*);
HANDLE OpenWaitableTimerW(SYNCHRONIZATION_ACCESS_RIGHTS, BOOL, const(wchar)*);
BOOL SetWaitableTimerEx(HANDLE, const(LARGE_INTEGER)*, int, PTIMERAPCROUTINE, void*, REASON_CONTEXT*, uint);
BOOL SetWaitableTimer(HANDLE, const(LARGE_INTEGER)*, int, PTIMERAPCROUTINE, void*, BOOL);
BOOL CancelWaitableTimer(HANDLE);
HANDLE CreateMutexExA(SECURITY_ATTRIBUTES*, const(char)*, uint, uint);
HANDLE CreateMutexExW(SECURITY_ATTRIBUTES*, const(wchar)*, uint, uint);
HANDLE CreateEventExA(SECURITY_ATTRIBUTES*, const(char)*, CREATE_EVENT, uint);
HANDLE CreateEventExW(SECURITY_ATTRIBUTES*, const(wchar)*, CREATE_EVENT, uint);
HANDLE CreateSemaphoreExW(SECURITY_ATTRIBUTES*, int, int, const(wchar)*, uint, uint);
HANDLE CreateWaitableTimerExW(SECURITY_ATTRIBUTES*, const(wchar)*, uint, uint);
BOOL EnterSynchronizationBarrier(RTL_BARRIER*, uint);
BOOL InitializeSynchronizationBarrier(RTL_BARRIER*, int, int);
BOOL DeleteSynchronizationBarrier(RTL_BARRIER*);
void Sleep(uint);
BOOL WaitOnAddress(void*, void*, ulong, uint);
void WakeByAddressSingle(void*);
void WakeByAddressAll(void*);
uint WaitForMultipleObjects(uint, const(HANDLE)*, BOOL, uint);
HANDLE CreateSemaphoreW(SECURITY_ATTRIBUTES*, int, int, const(wchar)*);
HANDLE CreateWaitableTimerW(SECURITY_ATTRIBUTES*, BOOL, const(wchar)*);
void InitializeSListHead(SLIST_HEADER*);
SLIST_ENTRY* InterlockedPopEntrySList(SLIST_HEADER*);
SLIST_ENTRY* InterlockedPushEntrySList(SLIST_HEADER*, SLIST_ENTRY*);
SLIST_ENTRY* InterlockedPushListSListEx(SLIST_HEADER*, SLIST_ENTRY*, SLIST_ENTRY*, uint);
SLIST_ENTRY* InterlockedFlushSList(SLIST_HEADER*);
ushort QueryDepthSList(SLIST_HEADER*);
uint QueueUserAPC(PAPCFUNC, HANDLE, ulong);
BOOL QueueUserAPC2(PAPCFUNC, HANDLE, ulong, QUEUE_USER_APC_FLAGS);
BOOL GetProcessTimes(HANDLE, FILETIME*, FILETIME*, FILETIME*, FILETIME*);
HANDLE GetCurrentProcess();
uint GetCurrentProcessId();
void ExitProcess(uint);
BOOL TerminateProcess(HANDLE, uint);
BOOL GetExitCodeProcess(HANDLE, uint*);
BOOL SwitchToThread();
HANDLE CreateThread(SECURITY_ATTRIBUTES*, ulong, LPTHREAD_START_ROUTINE, void*, THREAD_CREATION_FLAGS, uint*);
HANDLE CreateRemoteThread(HANDLE, SECURITY_ATTRIBUTES*, ulong, LPTHREAD_START_ROUTINE, void*, uint, uint*);
HANDLE GetCurrentThread();
uint GetCurrentThreadId();
HANDLE OpenThread(THREAD_ACCESS_RIGHTS, BOOL, uint);
BOOL SetThreadPriority(HANDLE, THREAD_PRIORITY);
BOOL SetThreadPriorityBoost(HANDLE, BOOL);
BOOL GetThreadPriorityBoost(HANDLE, BOOL*);
int GetThreadPriority(HANDLE);
void ExitThread(uint);
BOOL TerminateThread(HANDLE, uint);
BOOL GetExitCodeThread(HANDLE, uint*);
uint SuspendThread(HANDLE);
uint ResumeThread(HANDLE);
uint TlsAlloc();
void* TlsGetValue(uint);
BOOL TlsSetValue(uint, void*);
BOOL TlsFree(uint);
BOOL CreateProcessA(const(char)*, PSTR, SECURITY_ATTRIBUTES*, SECURITY_ATTRIBUTES*, BOOL, PROCESS_CREATION_FLAGS, void*, const(char)*, STARTUPINFOA*, PROCESS_INFORMATION*);
BOOL CreateProcessW(const(wchar)*, PWSTR, SECURITY_ATTRIBUTES*, SECURITY_ATTRIBUTES*, BOOL, PROCESS_CREATION_FLAGS, void*, const(wchar)*, STARTUPINFOW*, PROCESS_INFORMATION*);
BOOL SetProcessShutdownParameters(uint, uint);
uint GetProcessVersion(uint);
void GetStartupInfoW(STARTUPINFOW*);
BOOL CreateProcessAsUserW(HANDLE, const(wchar)*, PWSTR, SECURITY_ATTRIBUTES*, SECURITY_ATTRIBUTES*, BOOL, uint, void*, const(wchar)*, STARTUPINFOW*, PROCESS_INFORMATION*);
BOOL SetThreadToken(HANDLE*, HANDLE);
BOOL OpenProcessToken(HANDLE, TOKEN_ACCESS_MASK, HANDLE*);
BOOL OpenThreadToken(HANDLE, TOKEN_ACCESS_MASK, BOOL, HANDLE*);
BOOL SetPriorityClass(HANDLE, PROCESS_CREATION_FLAGS);
uint GetPriorityClass(HANDLE);
BOOL SetThreadStackGuarantee(uint*);
uint GetProcessId(HANDLE);
uint GetThreadId(HANDLE);
void FlushProcessWriteBuffers();
uint GetProcessIdOfThread(HANDLE);
BOOL InitializeProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST, uint, uint, ulong*);
void DeleteProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST);
BOOL UpdateProcThreadAttribute(LPPROC_THREAD_ATTRIBUTE_LIST, uint, ulong, void*, ulong, void*, ulong*);
BOOL SetProcessDynamicEHContinuationTargets(HANDLE, ushort, PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*);
BOOL SetProcessDynamicEnforcedCetCompatibleRanges(HANDLE, ushort, PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*);
BOOL SetProcessAffinityUpdateMode(HANDLE, PROCESS_AFFINITY_AUTO_UPDATE_FLAGS);
BOOL QueryProcessAffinityUpdateMode(HANDLE, PROCESS_AFFINITY_AUTO_UPDATE_FLAGS*);
HANDLE CreateRemoteThreadEx(HANDLE, SECURITY_ATTRIBUTES*, ulong, LPTHREAD_START_ROUTINE, void*, uint, LPPROC_THREAD_ATTRIBUTE_LIST, uint*);
void GetCurrentThreadStackLimits(ulong*, ulong*);
BOOL GetProcessMitigationPolicy(HANDLE, PROCESS_MITIGATION_POLICY, void*, ulong);
BOOL SetProcessMitigationPolicy(PROCESS_MITIGATION_POLICY, void*, ulong);
BOOL GetThreadTimes(HANDLE, FILETIME*, FILETIME*, FILETIME*, FILETIME*);
HANDLE OpenProcess(PROCESS_ACCESS_RIGHTS, BOOL, uint);
BOOL IsProcessorFeaturePresent(PROCESSOR_FEATURE_ID);
BOOL GetProcessHandleCount(HANDLE, uint*);
uint GetCurrentProcessorNumber();
BOOL SetThreadIdealProcessorEx(HANDLE, PROCESSOR_NUMBER*, PROCESSOR_NUMBER*);
BOOL GetThreadIdealProcessorEx(HANDLE, PROCESSOR_NUMBER*);
void GetCurrentProcessorNumberEx(PROCESSOR_NUMBER*);
BOOL GetProcessPriorityBoost(HANDLE, BOOL*);
BOOL SetProcessPriorityBoost(HANDLE, BOOL);
BOOL GetThreadIOPendingFlag(HANDLE, BOOL*);
BOOL GetSystemTimes(FILETIME*, FILETIME*, FILETIME*);
BOOL GetThreadInformation(HANDLE, THREAD_INFORMATION_CLASS, void*, uint);
BOOL SetThreadInformation(HANDLE, THREAD_INFORMATION_CLASS, void*, uint);
BOOL IsProcessCritical(HANDLE, BOOL*);
BOOL SetProtectedPolicy(const(GUID)*, ulong, ulong*);
BOOL QueryProtectedPolicy(const(GUID)*, ulong*);
uint SetThreadIdealProcessor(HANDLE, uint);
BOOL SetProcessInformation(HANDLE, PROCESS_INFORMATION_CLASS, void*, uint);
BOOL GetProcessInformation(HANDLE, PROCESS_INFORMATION_CLASS, void*, uint);
BOOL GetProcessDefaultCpuSets(HANDLE, uint*, uint, uint*);
BOOL SetProcessDefaultCpuSets(HANDLE, const(uint)*, uint);
BOOL GetThreadSelectedCpuSets(HANDLE, uint*, uint, uint*);
BOOL SetThreadSelectedCpuSets(HANDLE, const(uint)*, uint);
BOOL CreateProcessAsUserA(HANDLE, const(char)*, PSTR, SECURITY_ATTRIBUTES*, SECURITY_ATTRIBUTES*, BOOL, uint, void*, const(char)*, STARTUPINFOA*, PROCESS_INFORMATION*);
BOOL GetProcessShutdownParameters(uint*, uint*);
BOOL GetProcessDefaultCpuSetMasks(HANDLE, GROUP_AFFINITY*, ushort, ushort*);
BOOL SetProcessDefaultCpuSetMasks(HANDLE, GROUP_AFFINITY*, ushort);
BOOL GetThreadSelectedCpuSetMasks(HANDLE, GROUP_AFFINITY*, ushort, ushort*);
BOOL SetThreadSelectedCpuSetMasks(HANDLE, GROUP_AFFINITY*, ushort);
HRESULT GetMachineTypeAttributes(ushort, MACHINE_ATTRIBUTES*);
HRESULT SetThreadDescription(HANDLE, const(wchar)*);
HRESULT GetThreadDescription(HANDLE, PWSTR*);
BOOL QueueUserWorkItem(LPTHREAD_START_ROUTINE, void*, WORKER_THREAD_FLAGS);
BOOL UnregisterWaitEx(HANDLE, HANDLE);
HANDLE CreateTimerQueue();
BOOL CreateTimerQueueTimer(HANDLE*, HANDLE, WAITORTIMERCALLBACK, void*, uint, uint, WORKER_THREAD_FLAGS);
BOOL ChangeTimerQueueTimer(HANDLE, HANDLE, uint, uint);
BOOL DeleteTimerQueueTimer(HANDLE, HANDLE, HANDLE);
BOOL DeleteTimerQueue(HANDLE);
BOOL DeleteTimerQueueEx(HANDLE, HANDLE);
PTP_POOL CreateThreadpool(void*);
void SetThreadpoolThreadMaximum(PTP_POOL, uint);
BOOL SetThreadpoolThreadMinimum(PTP_POOL, uint);
BOOL SetThreadpoolStackInformation(PTP_POOL, TP_POOL_STACK_INFORMATION*);
BOOL QueryThreadpoolStackInformation(PTP_POOL, TP_POOL_STACK_INFORMATION*);
void CloseThreadpool(PTP_POOL);
long CreateThreadpoolCleanupGroup();
void CloseThreadpoolCleanupGroupMembers(long, BOOL, void*);
void CloseThreadpoolCleanupGroup(long);
void SetEventWhenCallbackReturns(TP_CALLBACK_INSTANCE*, HANDLE);
void ReleaseSemaphoreWhenCallbackReturns(TP_CALLBACK_INSTANCE*, HANDLE, uint);
void ReleaseMutexWhenCallbackReturns(TP_CALLBACK_INSTANCE*, HANDLE);
void LeaveCriticalSectionWhenCallbackReturns(TP_CALLBACK_INSTANCE*, RTL_CRITICAL_SECTION*);
void FreeLibraryWhenCallbackReturns(TP_CALLBACK_INSTANCE*, HINSTANCE);
BOOL CallbackMayRunLong(TP_CALLBACK_INSTANCE*);
void DisassociateCurrentThreadFromCallback(TP_CALLBACK_INSTANCE*);
BOOL TrySubmitThreadpoolCallback(PTP_SIMPLE_CALLBACK, void*, TP_CALLBACK_ENVIRON_V3*);
TP_WORK* CreateThreadpoolWork(PTP_WORK_CALLBACK, void*, TP_CALLBACK_ENVIRON_V3*);
void SubmitThreadpoolWork(TP_WORK*);
void WaitForThreadpoolWorkCallbacks(TP_WORK*, BOOL);
void CloseThreadpoolWork(TP_WORK*);
TP_TIMER* CreateThreadpoolTimer(PTP_TIMER_CALLBACK, void*, TP_CALLBACK_ENVIRON_V3*);
void SetThreadpoolTimer(TP_TIMER*, FILETIME*, uint, uint);
BOOL IsThreadpoolTimerSet(TP_TIMER*);
void WaitForThreadpoolTimerCallbacks(TP_TIMER*, BOOL);
void CloseThreadpoolTimer(TP_TIMER*);
TP_WAIT* CreateThreadpoolWait(PTP_WAIT_CALLBACK, void*, TP_CALLBACK_ENVIRON_V3*);
void SetThreadpoolWait(TP_WAIT*, HANDLE, FILETIME*);
void WaitForThreadpoolWaitCallbacks(TP_WAIT*, BOOL);
void CloseThreadpoolWait(TP_WAIT*);
TP_IO* CreateThreadpoolIo(HANDLE, PTP_WIN32_IO_CALLBACK, void*, TP_CALLBACK_ENVIRON_V3*);
void StartThreadpoolIo(TP_IO*);
void CancelThreadpoolIo(TP_IO*);
void WaitForThreadpoolIoCallbacks(TP_IO*, BOOL);
void CloseThreadpoolIo(TP_IO*);
BOOL SetThreadpoolTimerEx(TP_TIMER*, FILETIME*, uint, uint);
BOOL SetThreadpoolWaitEx(TP_WAIT*, HANDLE, FILETIME*, void*);
BOOL IsWow64Process(HANDLE, BOOL*);
ushort Wow64SetThreadDefaultGuestMachine(ushort);
BOOL IsWow64Process2(HANDLE, IMAGE_FILE_MACHINE*, IMAGE_FILE_MACHINE*);
uint Wow64SuspendThread(HANDLE);
NamespaceHandle CreatePrivateNamespaceW(SECURITY_ATTRIBUTES*, void*, const(wchar)*);
NamespaceHandle OpenPrivateNamespaceW(void*, const(wchar)*);
BOOLEAN ClosePrivateNamespace(NamespaceHandle, uint);
BoundaryDescriptorHandle CreateBoundaryDescriptorW(const(wchar)*, uint);
BOOL AddSIDToBoundaryDescriptor(HANDLE*, PSID);
void DeleteBoundaryDescriptor(BoundaryDescriptorHandle);
BOOL GetNumaHighestNodeNumber(uint*);
BOOL GetNumaNodeProcessorMaskEx(ushort, GROUP_AFFINITY*);
BOOL GetNumaNodeProcessorMask2(ushort, GROUP_AFFINITY*, ushort, ushort*);
BOOL GetNumaProximityNodeEx(uint, ushort*);
BOOL GetProcessGroupAffinity(HANDLE, ushort*, ushort*);
BOOL GetThreadGroupAffinity(HANDLE, GROUP_AFFINITY*);
BOOL SetThreadGroupAffinity(HANDLE, const(GROUP_AFFINITY)*, GROUP_AFFINITY*);
HANDLE AvSetMmThreadCharacteristicsA(const(char)*, uint*);
HANDLE AvSetMmThreadCharacteristicsW(const(wchar)*, uint*);
HANDLE AvSetMmMaxThreadCharacteristicsA(const(char)*, const(char)*, uint*);
HANDLE AvSetMmMaxThreadCharacteristicsW(const(wchar)*, const(wchar)*, uint*);
BOOL AvRevertMmThreadCharacteristics(HANDLE);
BOOL AvSetMmThreadPriority(HANDLE, AVRT_PRIORITY);
BOOL AvRtCreateThreadOrderingGroup(HANDLE*, LARGE_INTEGER*, GUID*, LARGE_INTEGER*);
BOOL AvRtCreateThreadOrderingGroupExA(HANDLE*, LARGE_INTEGER*, GUID*, LARGE_INTEGER*, const(char)*);
BOOL AvRtCreateThreadOrderingGroupExW(HANDLE*, LARGE_INTEGER*, GUID*, LARGE_INTEGER*, const(wchar)*);
BOOL AvRtJoinThreadOrderingGroup(HANDLE*, GUID*, BOOL);
BOOL AvRtWaitOnThreadOrderingGroup(HANDLE);
BOOL AvRtLeaveThreadOrderingGroup(HANDLE);
BOOL AvRtDeleteThreadOrderingGroup(HANDLE);
BOOL AvQuerySystemResponsiveness(HANDLE, uint*);
BOOL AttachThreadInput(uint, uint, BOOL);
uint WaitForInputIdle(HANDLE, uint);
uint GetGuiResources(HANDLE, GET_GUI_RESOURCES_FLAGS);
BOOL IsImmersiveProcess(HANDLE);
BOOL SetProcessRestrictionExemption(BOOL);
BOOL GetProcessAffinityMask(HANDLE, ulong*, ulong*);
BOOL SetProcessAffinityMask(HANDLE, ulong);
BOOL GetProcessIoCounters(HANDLE, IO_COUNTERS*);
void SwitchToFiber(void*);
void DeleteFiber(void*);
BOOL ConvertFiberToThread();
void* CreateFiberEx(ulong, ulong, uint, LPFIBER_START_ROUTINE, void*);
void* ConvertThreadToFiberEx(void*, uint);
void* CreateFiber(ulong, LPFIBER_START_ROUTINE, void*);
void* ConvertThreadToFiber(void*);
BOOL CreateUmsCompletionList(void**);
BOOL DequeueUmsCompletionListItems(void*, uint, void**);
BOOL GetUmsCompletionListEvent(void*, HANDLE*);
BOOL ExecuteUmsThread(void*);
BOOL UmsThreadYield(void*);
BOOL DeleteUmsCompletionList(void*);
void* GetCurrentUmsThread();
void* GetNextUmsListItem(void*);
BOOL QueryUmsThreadInformation(void*, RTL_UMS_THREAD_INFO_CLASS, void*, uint, uint*);
BOOL SetUmsThreadInformation(void*, RTL_UMS_THREAD_INFO_CLASS, void*, uint);
BOOL DeleteUmsThreadContext(void*);
BOOL CreateUmsThreadContext(void**);
BOOL EnterUmsSchedulingMode(UMS_SCHEDULER_STARTUP_INFO*);
BOOL GetUmsSystemThreadInformation(HANDLE, UMS_SYSTEM_THREAD_INFORMATION*);
ulong SetThreadAffinityMask(HANDLE, ulong);
BOOL SetProcessDEPPolicy(PROCESS_DEP_FLAGS);
BOOL GetProcessDEPPolicy(HANDLE, uint*, BOOL*);
BOOL PulseEvent(HANDLE);
uint WinExec(const(char)*, uint);
HANDLE CreateSemaphoreA(SECURITY_ATTRIBUTES*, int, int, const(char)*);
HANDLE CreateSemaphoreExA(SECURITY_ATTRIBUTES*, int, int, const(char)*, uint, uint);
BOOL QueryFullProcessImageNameA(HANDLE, PROCESS_NAME_FORMAT, PSTR, uint*);
BOOL QueryFullProcessImageNameW(HANDLE, PROCESS_NAME_FORMAT, PWSTR, uint*);
void GetStartupInfoA(STARTUPINFOA*);
BOOL CreateProcessWithLogonW(const(wchar)*, const(wchar)*, const(wchar)*, CREATE_PROCESS_LOGON_FLAGS, const(wchar)*, PWSTR, uint, void*, const(wchar)*, STARTUPINFOW*, PROCESS_INFORMATION*);
BOOL CreateProcessWithTokenW(HANDLE, CREATE_PROCESS_LOGON_FLAGS, const(wchar)*, PWSTR, uint, void*, const(wchar)*, STARTUPINFOW*, PROCESS_INFORMATION*);
BOOL RegisterWaitForSingleObject(HANDLE*, HANDLE, WAITORTIMERCALLBACK, void*, uint, WORKER_THREAD_FLAGS);
BOOL UnregisterWait(HANDLE);
HANDLE SetTimerQueueTimer(HANDLE, WAITORTIMERCALLBACK, void*, uint, uint, BOOL);
NamespaceHandle CreatePrivateNamespaceA(SECURITY_ATTRIBUTES*, void*, const(char)*);
NamespaceHandle OpenPrivateNamespaceA(void*, const(char)*);
BoundaryDescriptorHandle CreateBoundaryDescriptorA(const(char)*, uint);
BOOL AddIntegrityLabelToBoundaryDescriptor(HANDLE*, PSID);
ushort GetActiveProcessorGroupCount();
ushort GetMaximumProcessorGroupCount();
uint GetActiveProcessorCount(ushort);
uint GetMaximumProcessorCount(ushort);
BOOL GetNumaProcessorNode(ubyte, ubyte*);
BOOL GetNumaNodeNumberFromHandle(HANDLE, ushort*);
BOOL GetNumaProcessorNodeEx(PROCESSOR_NUMBER*, ushort*);
BOOL GetNumaNodeProcessorMask(ubyte, ulong*);
BOOL GetNumaAvailableMemoryNode(ubyte, ulong*);
BOOL GetNumaAvailableMemoryNodeEx(ushort, ulong*);
BOOL GetNumaProximityNode(uint, ubyte*);
NTSTATUS NtQueryInformationProcess(HANDLE, PROCESSINFOCLASS, void*, uint, uint*);
NTSTATUS NtQueryInformationThread(HANDLE, THREADINFOCLASS, void*, uint, uint*);
NTSTATUS NtSetInformationThread(HANDLE, THREADINFOCLASS, void*, uint);
enum PRIVATE_NAMESPACE_FLAG_DESTROY = 0x00000001;
enum PROC_THREAD_ATTRIBUTE_REPLACE_VALUE = 0x00000001;
enum THREAD_POWER_THROTTLING_CURRENT_VERSION = 0x00000001;
enum THREAD_POWER_THROTTLING_EXECUTION_SPEED = 0x00000001;
enum THREAD_POWER_THROTTLING_VALID_FLAGS = 0x00000001;
enum PME_CURRENT_VERSION = 0x00000001;
enum PME_FAILFAST_ON_COMMIT_FAIL_DISABLE = 0x00000000;
enum PME_FAILFAST_ON_COMMIT_FAIL_ENABLE = 0x00000001;
enum PROCESS_POWER_THROTTLING_CURRENT_VERSION = 0x00000001;
enum PROCESS_POWER_THROTTLING_EXECUTION_SPEED = 0x00000001;
enum PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION = 0x00000004;
enum PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND = 0x00000001;
enum PROCESS_LEAP_SECOND_INFO_VALID_FLAGS = 0x00000001;
enum INIT_ONCE_CHECK_ONLY = 0x00000001;
enum INIT_ONCE_ASYNC = 0x00000002;
enum INIT_ONCE_INIT_FAILED = 0x00000004;
enum INIT_ONCE_CTX_RESERVED_BITS = 0x00000002;
enum CONDITION_VARIABLE_LOCKMODE_SHARED = 0x00000001;
enum CREATE_MUTEX_INITIAL_OWNER = 0x00000001;
enum CREATE_WAITABLE_TIMER_MANUAL_RESET = 0x00000001;
enum CREATE_WAITABLE_TIMER_HIGH_RESOLUTION = 0x00000002;
enum SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY = 0x00000001;
enum SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY = 0x00000002;
enum SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE = 0x00000004;
enum PROC_THREAD_ATTRIBUTE_PARENT_PROCESS = 0x00020000;
enum PROC_THREAD_ATTRIBUTE_HANDLE_LIST = 0x00020002;
enum PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY = 0x00030003;
enum PROC_THREAD_ATTRIBUTE_PREFERRED_NODE = 0x00020004;
enum PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR = 0x00030005;
enum PROC_THREAD_ATTRIBUTE_UMS_THREAD = 0x00030006;
enum PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY = 0x00020007;
enum PROC_THREAD_ATTRIBUTE_SECURITY_CAPABILITIES = 0x00020009;
enum PROC_THREAD_ATTRIBUTE_PROTECTION_LEVEL = 0x0002000b;
enum PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE = 0x00020016;
enum PROC_THREAD_ATTRIBUTE_MACHINE_TYPE = 0x00020019;
enum PROC_THREAD_ATTRIBUTE_ENABLE_OPTIONAL_XSTATE_FEATURES = 0x0003001b;
enum PROC_THREAD_ATTRIBUTE_WIN32K_FILTER = 0x00020010;
enum PROC_THREAD_ATTRIBUTE_JOB_LIST = 0x0002000d;
enum PROC_THREAD_ATTRIBUTE_CHILD_PROCESS_POLICY = 0x0002000e;
enum PROC_THREAD_ATTRIBUTE_ALL_APPLICATION_PACKAGES_POLICY = 0x0002000f;
enum PROC_THREAD_ATTRIBUTE_DESKTOP_APP_POLICY = 0x00020012;
enum PROC_THREAD_ATTRIBUTE_MITIGATION_AUDIT_POLICY = 0x00020018;
enum PROC_THREAD_ATTRIBUTE_COMPONENT_FILTER = 0x0002001a;
alias PROCESS_CREATION_FLAGS = uint;
enum : uint
{
    DEBUG_PROCESS                    = 0x00000001,
    DEBUG_ONLY_THIS_PROCESS          = 0x00000002,
    CREATE_SUSPENDED                 = 0x00000004,
    DETACHED_PROCESS                 = 0x00000008,
    CREATE_NEW_CONSOLE               = 0x00000010,
    NORMAL_PRIORITY_CLASS            = 0x00000020,
    IDLE_PRIORITY_CLASS              = 0x00000040,
    HIGH_PRIORITY_CLASS              = 0x00000080,
    REALTIME_PRIORITY_CLASS          = 0x00000100,
    CREATE_NEW_PROCESS_GROUP         = 0x00000200,
    CREATE_UNICODE_ENVIRONMENT       = 0x00000400,
    CREATE_SEPARATE_WOW_VDM          = 0x00000800,
    CREATE_SHARED_WOW_VDM            = 0x00001000,
    CREATE_FORCEDOS                  = 0x00002000,
    BELOW_NORMAL_PRIORITY_CLASS      = 0x00004000,
    ABOVE_NORMAL_PRIORITY_CLASS      = 0x00008000,
    INHERIT_PARENT_AFFINITY          = 0x00010000,
    INHERIT_CALLER_PRIORITY          = 0x00020000,
    CREATE_PROTECTED_PROCESS         = 0x00040000,
    EXTENDED_STARTUPINFO_PRESENT     = 0x00080000,
    PROCESS_MODE_BACKGROUND_BEGIN    = 0x00100000,
    PROCESS_MODE_BACKGROUND_END      = 0x00200000,
    CREATE_SECURE_PROCESS            = 0x00400000,
    CREATE_BREAKAWAY_FROM_JOB        = 0x01000000,
    CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 0x02000000,
    CREATE_DEFAULT_ERROR_MODE        = 0x04000000,
    CREATE_NO_WINDOW                 = 0x08000000,
    PROFILE_USER                     = 0x10000000,
    PROFILE_KERNEL                   = 0x20000000,
    PROFILE_SERVER                   = 0x40000000,
    CREATE_IGNORE_SYSTEM_DEFAULT     = 0x80000000,
}

alias PROCESS_ACCESS_RIGHTS = uint;
enum : uint
{
    PROCESS_TERMINATE                 = 0x00000001,
    PROCESS_CREATE_THREAD             = 0x00000002,
    PROCESS_SET_SESSIONID             = 0x00000004,
    PROCESS_VM_OPERATION              = 0x00000008,
    PROCESS_VM_READ                   = 0x00000010,
    PROCESS_VM_WRITE                  = 0x00000020,
    PROCESS_DUP_HANDLE                = 0x00000040,
    PROCESS_CREATE_PROCESS            = 0x00000080,
    PROCESS_SET_QUOTA                 = 0x00000100,
    PROCESS_SET_INFORMATION           = 0x00000200,
    PROCESS_QUERY_INFORMATION         = 0x00000400,
    PROCESS_SUSPEND_RESUME            = 0x00000800,
    PROCESS_QUERY_LIMITED_INFORMATION = 0x00001000,
    PROCESS_SET_LIMITED_INFORMATION   = 0x00002000,
    PROCESS_ALL_ACCESS                = 0x001fffff,
    PROCESS_DELETE                    = 0x00010000,
    PROCESS_READ_CONTROL              = 0x00020000,
    PROCESS_WRITE_DAC                 = 0x00040000,
    PROCESS_WRITE_OWNER               = 0x00080000,
    PROCESS_SYNCHRONIZE               = 0x00100000,
    PROCESS_STANDARD_RIGHTS_REQUIRED  = 0x000f0000,
}

struct TP_CALLBACK_INSTANCE
{
}
struct TP_WORK
{
}
struct TP_TIMER
{
}
struct TP_WAIT
{
}
struct TP_IO
{
}
alias TimerQueueHandle = long;
alias PTP_POOL = long;
alias NamespaceHandle = long;
alias BoundaryDescriptorHandle = long;
alias LPPROC_THREAD_ATTRIBUTE_LIST = void*;
struct REASON_CONTEXT
{
    uint Version;
    POWER_REQUEST_CONTEXT_FLAGS Flags;
    union _Reason_e__Union
    {
        struct _Detailed_e__Struct
        {
            HINSTANCE LocalizedReasonModule;
            uint LocalizedReasonId;
            uint ReasonStringCount;
            PWSTR* ReasonStrings;
        }
        PWSTR SimpleReasonString;
    }
}
alias LPTHREAD_START_ROUTINE = uint function(void*);
alias PINIT_ONCE_FN = BOOL function(RTL_RUN_ONCE*, void*, void**);
alias PTIMERAPCROUTINE = void function(void*, uint, uint);
struct PROCESS_INFORMATION
{
    HANDLE hProcess;
    HANDLE hThread;
    uint dwProcessId;
    uint dwThreadId;
}
struct STARTUPINFOA
{
    uint cb;
    PSTR lpReserved;
    PSTR lpDesktop;
    PSTR lpTitle;
    uint dwX;
    uint dwY;
    uint dwXSize;
    uint dwYSize;
    uint dwXCountChars;
    uint dwYCountChars;
    uint dwFillAttribute;
    STARTUPINFOW_FLAGS dwFlags;
    ushort wShowWindow;
    ushort cbReserved2;
    ubyte* lpReserved2;
    HANDLE hStdInput;
    HANDLE hStdOutput;
    HANDLE hStdError;
}
struct STARTUPINFOW
{
    uint cb;
    PWSTR lpReserved;
    PWSTR lpDesktop;
    PWSTR lpTitle;
    uint dwX;
    uint dwY;
    uint dwXSize;
    uint dwYSize;
    uint dwXCountChars;
    uint dwYCountChars;
    uint dwFillAttribute;
    STARTUPINFOW_FLAGS dwFlags;
    ushort wShowWindow;
    ushort cbReserved2;
    ubyte* lpReserved2;
    HANDLE hStdInput;
    HANDLE hStdOutput;
    HANDLE hStdError;
}
alias QUEUE_USER_APC_FLAGS = int;
enum : int
{
    QUEUE_USER_APC_FLAGS_NONE             = 0x00000000,
    QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC = 0x00000001,
}

alias THREAD_INFORMATION_CLASS = int;
enum : int
{
    ThreadMemoryPriority      = 0x00000000,
    ThreadAbsoluteCpuPriority = 0x00000001,
    ThreadDynamicCodePolicy   = 0x00000002,
    ThreadPowerThrottling     = 0x00000003,
    ThreadInformationClassMax = 0x00000004,
}

struct MEMORY_PRIORITY_INFORMATION
{
    MEMORY_PRIORITY MemoryPriority;
}
struct THREAD_POWER_THROTTLING_STATE
{
    uint Version;
    uint ControlMask;
    uint StateMask;
}
alias PROCESS_INFORMATION_CLASS = int;
enum : int
{
    ProcessMemoryPriority        = 0x00000000,
    ProcessMemoryExhaustionInfo  = 0x00000001,
    ProcessAppMemoryInfo         = 0x00000002,
    ProcessInPrivateInfo         = 0x00000003,
    ProcessPowerThrottling       = 0x00000004,
    ProcessReservedValue1        = 0x00000005,
    ProcessTelemetryCoverageInfo = 0x00000006,
    ProcessProtectionLevelInfo   = 0x00000007,
    ProcessLeapSecondInfo        = 0x00000008,
    ProcessMachineTypeInfo       = 0x00000009,
    ProcessInformationClassMax   = 0x0000000a,
}

struct APP_MEMORY_INFORMATION
{
    ulong AvailableCommit;
    ulong PrivateCommitUsage;
    ulong PeakPrivateCommitUsage;
    ulong TotalCommitUsage;
}
alias MACHINE_ATTRIBUTES = uint;
enum : uint
{
    UserEnabled    = 0x00000001,
    KernelEnabled  = 0x00000002,
    Wow64Container = 0x00000004,
}

struct PROCESS_MACHINE_INFORMATION
{
    IMAGE_FILE_MACHINE ProcessMachine;
    ushort Res0;
    MACHINE_ATTRIBUTES MachineAttributes;
}
alias PROCESS_MEMORY_EXHAUSTION_TYPE = int;
enum : int
{
    PMETypeFailFastOnCommitFailure = 0x00000000,
    PMETypeMax                     = 0x00000001,
}

struct PROCESS_MEMORY_EXHAUSTION_INFO
{
    ushort Version;
    ushort Reserved;
    PROCESS_MEMORY_EXHAUSTION_TYPE Type;
    ulong Value;
}
struct PROCESS_POWER_THROTTLING_STATE
{
    uint Version;
    uint ControlMask;
    uint StateMask;
}
struct PROCESS_PROTECTION_LEVEL_INFORMATION
{
    PROCESS_PROTECTION_LEVEL ProtectionLevel;
}
struct PROCESS_LEAP_SECOND_INFO
{
    uint Flags;
    uint Reserved;
}
alias PTP_WIN32_IO_CALLBACK = void function(TP_CALLBACK_INSTANCE*, void*, void*, uint, ulong, TP_IO*);
alias AVRT_PRIORITY = int;
enum : int
{
    AVRT_PRIORITY_VERYLOW  = 0xfffffffe,
    AVRT_PRIORITY_LOW      = 0xffffffff,
    AVRT_PRIORITY_NORMAL   = 0x00000000,
    AVRT_PRIORITY_HIGH     = 0x00000001,
    AVRT_PRIORITY_CRITICAL = 0x00000002,
}

struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGET
{
    ulong TargetAddress;
    ulong Flags;
}
struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION
{
    ushort NumberOfTargets;
    ushort Reserved;
    uint Reserved2;
    PROCESS_DYNAMIC_EH_CONTINUATION_TARGET* Targets;
}
struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE
{
    ulong BaseAddress;
    ulong Size;
    uint Flags;
}
struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION
{
    ushort NumberOfRanges;
    ushort Reserved;
    uint Reserved2;
    PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE* Ranges;
}
struct IO_COUNTERS
{
    ulong ReadOperationCount;
    ulong WriteOperationCount;
    ulong OtherOperationCount;
    ulong ReadTransferCount;
    ulong WriteTransferCount;
    ulong OtherTransferCount;
}
alias PROCESS_MITIGATION_POLICY = int;
enum : int
{
    ProcessDEPPolicy                   = 0x00000000,
    ProcessASLRPolicy                  = 0x00000001,
    ProcessDynamicCodePolicy           = 0x00000002,
    ProcessStrictHandleCheckPolicy     = 0x00000003,
    ProcessSystemCallDisablePolicy     = 0x00000004,
    ProcessMitigationOptionsMask       = 0x00000005,
    ProcessExtensionPointDisablePolicy = 0x00000006,
    ProcessControlFlowGuardPolicy      = 0x00000007,
    ProcessSignaturePolicy             = 0x00000008,
    ProcessFontDisablePolicy           = 0x00000009,
    ProcessImageLoadPolicy             = 0x0000000a,
    ProcessSystemCallFilterPolicy      = 0x0000000b,
    ProcessPayloadRestrictionPolicy    = 0x0000000c,
    ProcessChildProcessPolicy          = 0x0000000d,
    ProcessSideChannelIsolationPolicy  = 0x0000000e,
    ProcessUserShadowStackPolicy       = 0x0000000f,
    ProcessRedirectionTrustPolicy      = 0x00000010,
    MaxProcessMitigationPolicy         = 0x00000011,
}

union RTL_RUN_ONCE
{
    void* Ptr;
}
struct RTL_BARRIER
{
    uint Reserved1;
    uint Reserved2;
    ulong[2] Reserved3;
    uint Reserved4;
    uint Reserved5;
}
alias RTL_UMS_THREAD_INFO_CLASS = int;
enum : int
{
    UmsThreadInvalidInfoClass = 0x00000000,
    UmsThreadUserContext      = 0x00000001,
    UmsThreadPriority         = 0x00000002,
    UmsThreadAffinity         = 0x00000003,
    UmsThreadTeb              = 0x00000004,
    UmsThreadIsSuspended      = 0x00000005,
    UmsThreadIsTerminated     = 0x00000006,
    UmsThreadMaxInfoClass     = 0x00000007,
}

alias PRTL_UMS_SCHEDULER_ENTRY_POINT = void function(RTL_UMS_SCHEDULER_REASON, ulong, void*);
struct RTL_CRITICAL_SECTION_DEBUG
{
    ushort Type;
    ushort CreatorBackTraceIndex;
    RTL_CRITICAL_SECTION* CriticalSection;
    LIST_ENTRY ProcessLocksList;
    uint EntryCount;
    uint ContentionCount;
    uint Flags;
    ushort CreatorBackTraceIndexHigh;
    ushort SpareWORD;
}
struct RTL_CRITICAL_SECTION
{
    RTL_CRITICAL_SECTION_DEBUG* DebugInfo;
    int LockCount;
    int RecursionCount;
    HANDLE OwningThread;
    HANDLE LockSemaphore;
    ulong SpinCount;
}
struct RTL_SRWLOCK
{
    void* Ptr;
}
struct RTL_CONDITION_VARIABLE
{
    void* Ptr;
}
alias WAITORTIMERCALLBACK = void function(void*, BOOLEAN);
alias PFLS_CALLBACK_FUNCTION = void function(void*);
alias PTP_SIMPLE_CALLBACK = void function(TP_CALLBACK_INSTANCE*, void*);
alias TP_CALLBACK_PRIORITY = int;
enum : int
{
    TP_CALLBACK_PRIORITY_HIGH    = 0x00000000,
    TP_CALLBACK_PRIORITY_NORMAL  = 0x00000001,
    TP_CALLBACK_PRIORITY_LOW     = 0x00000002,
    TP_CALLBACK_PRIORITY_INVALID = 0x00000003,
    TP_CALLBACK_PRIORITY_COUNT   = 0x00000003,
}

struct TP_POOL_STACK_INFORMATION
{
    ulong StackReserve;
    ulong StackCommit;
}
alias PTP_CLEANUP_GROUP_CANCEL_CALLBACK = void function(void*, void*);
struct TP_CALLBACK_ENVIRON_V3
{
    uint Version;
    PTP_POOL Pool;
    long CleanupGroup;
    PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback;
    void* RaceDll;
    long ActivationContext;
    PTP_SIMPLE_CALLBACK FinalizationCallback;
    union _u_e__Union
    {
        uint Flags;
        struct _s_e__Struct
        {
            uint _bitfield0;
        }
    }
    TP_CALLBACK_PRIORITY CallbackPriority;
    uint Size;
}
alias PTP_WORK_CALLBACK = void function(TP_CALLBACK_INSTANCE*, void*, TP_WORK*);
alias PTP_TIMER_CALLBACK = void function(TP_CALLBACK_INSTANCE*, void*, TP_TIMER*);
alias PTP_WAIT_CALLBACK = void function(TP_CALLBACK_INSTANCE*, void*, TP_WAIT*, uint);
alias LPFIBER_START_ROUTINE = void function(void*);
struct UMS_SCHEDULER_STARTUP_INFO
{
    uint UmsVersion;
    void* CompletionList;
    PRTL_UMS_SCHEDULER_ENTRY_POINT SchedulerProc;
    void* SchedulerParam;
}
struct UMS_SYSTEM_THREAD_INFORMATION
{
    uint UmsVersion;
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint ThreadUmsFlags;
    }
}
struct STARTUPINFOEXA
{
    STARTUPINFOA StartupInfo;
    LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList;
}
struct STARTUPINFOEXW
{
    STARTUPINFOW StartupInfo;
    LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList;
}
alias PROC_THREAD_ATTRIBUTE_NUM = uint;
enum : uint
{
    ProcThreadAttributeParentProcess                = 0x00000000,
    ProcThreadAttributeHandleList                   = 0x00000002,
    ProcThreadAttributeGroupAffinity                = 0x00000003,
    ProcThreadAttributePreferredNode                = 0x00000004,
    ProcThreadAttributeIdealProcessor               = 0x00000005,
    ProcThreadAttributeUmsThread                    = 0x00000006,
    ProcThreadAttributeMitigationPolicy             = 0x00000007,
    ProcThreadAttributeSecurityCapabilities         = 0x00000009,
    ProcThreadAttributeProtectionLevel              = 0x0000000b,
    ProcThreadAttributeJobList                      = 0x0000000d,
    ProcThreadAttributeChildProcessPolicy           = 0x0000000e,
    ProcThreadAttributeAllApplicationPackagesPolicy = 0x0000000f,
    ProcThreadAttributeWin32kFilter                 = 0x00000010,
    ProcThreadAttributeSafeOpenPromptOriginClaim    = 0x00000011,
    ProcThreadAttributeDesktopAppPolicy             = 0x00000012,
    ProcThreadAttributePseudoConsole                = 0x00000016,
    ProcThreadAttributeMitigationAuditPolicy        = 0x00000018,
    ProcThreadAttributeMachineType                  = 0x00000019,
    ProcThreadAttributeComponentFilter              = 0x0000001a,
    ProcThreadAttributeEnableOptionalXStateFeatures = 0x0000001b,
}

struct PEB_LDR_DATA
{
    ubyte[8] Reserved1;
    void*[3] Reserved2;
    LIST_ENTRY InMemoryOrderModuleList;
}
struct RTL_USER_PROCESS_PARAMETERS
{
    ubyte[16] Reserved1;
    void*[10] Reserved2;
    UNICODE_STRING ImagePathName;
    UNICODE_STRING CommandLine;
}
alias PPS_POST_PROCESS_INIT_ROUTINE = void function();
struct PEB
{
    ubyte[2] Reserved1;
    ubyte BeingDebugged;
    ubyte[1] Reserved2;
    void*[2] Reserved3;
    PEB_LDR_DATA* Ldr;
    RTL_USER_PROCESS_PARAMETERS* ProcessParameters;
    void*[3] Reserved4;
    void* AtlThunkSListPtr;
    void* Reserved5;
    uint Reserved6;
    void* Reserved7;
    uint Reserved8;
    uint AtlThunkSListPtr32;
    void*[45] Reserved9;
    ubyte[96] Reserved10;
    PPS_POST_PROCESS_INIT_ROUTINE PostProcessInitRoutine;
    ubyte[128] Reserved11;
    void*[1] Reserved12;
    uint SessionId;
}
struct PROCESS_BASIC_INFORMATION
{
    void* Reserved1;
    PEB* PebBaseAddress;
    void*[2] Reserved2;
    ulong UniqueProcessId;
    void* Reserved3;
}
alias PROCESSINFOCLASS = int;
enum : int
{
    ProcessBasicInformation   = 0x00000000,
    ProcessDebugPort          = 0x00000007,
    ProcessWow64Information   = 0x0000001a,
    ProcessImageFileName      = 0x0000001b,
    ProcessBreakOnTermination = 0x0000001d,
}

alias THREADINFOCLASS = int;
enum : int
{
    ThreadIsIoPending     = 0x00000010,
    ThreadNameInformation = 0x00000026,
}

