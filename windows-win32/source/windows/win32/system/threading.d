module windows.win32.system.threading;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, HANDLE, HMODULE, HRESULT, HWND, NTSTATUS, PAPCFUNC, PSTR, PWSTR, UNICODE_STRING, WAIT_EVENT;
import windows.win32.security : PSID, SECURITY_ATTRIBUTES, TOKEN_ACCESS_MASK;
import windows.win32.system.com : IUnknown;
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
    PF_FLOATING_POINT_PRECISION_ERRATA       = 0x00000000,
    PF_FLOATING_POINT_EMULATED               = 0x00000001,
    PF_COMPARE_EXCHANGE_DOUBLE               = 0x00000002,
    PF_MMX_INSTRUCTIONS_AVAILABLE            = 0x00000003,
    PF_PPC_MOVEMEM_64BIT_OK                  = 0x00000004,
    PF_ALPHA_BYTE_INSTRUCTIONS               = 0x00000005,
    PF_XMMI_INSTRUCTIONS_AVAILABLE           = 0x00000006,
    PF_3DNOW_INSTRUCTIONS_AVAILABLE          = 0x00000007,
    PF_RDTSC_INSTRUCTION_AVAILABLE           = 0x00000008,
    PF_PAE_ENABLED                           = 0x00000009,
    PF_XMMI64_INSTRUCTIONS_AVAILABLE         = 0x0000000a,
    PF_SSE_DAZ_MODE_AVAILABLE                = 0x0000000b,
    PF_NX_ENABLED                            = 0x0000000c,
    PF_SSE3_INSTRUCTIONS_AVAILABLE           = 0x0000000d,
    PF_COMPARE_EXCHANGE128                   = 0x0000000e,
    PF_COMPARE64_EXCHANGE128                 = 0x0000000f,
    PF_CHANNELS_ENABLED                      = 0x00000010,
    PF_XSAVE_ENABLED                         = 0x00000011,
    PF_ARM_VFP_32_REGISTERS_AVAILABLE        = 0x00000012,
    PF_ARM_NEON_INSTRUCTIONS_AVAILABLE       = 0x00000013,
    PF_SECOND_LEVEL_ADDRESS_TRANSLATION      = 0x00000014,
    PF_VIRT_FIRMWARE_ENABLED                 = 0x00000015,
    PF_RDWRFSGSBASE_AVAILABLE                = 0x00000016,
    PF_FASTFAIL_AVAILABLE                    = 0x00000017,
    PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE      = 0x00000018,
    PF_ARM_64BIT_LOADSTORE_ATOMIC            = 0x00000019,
    PF_ARM_EXTERNAL_CACHE_AVAILABLE          = 0x0000001a,
    PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE       = 0x0000001b,
    PF_RDRAND_INSTRUCTION_AVAILABLE          = 0x0000001c,
    PF_ARM_V8_INSTRUCTIONS_AVAILABLE         = 0x0000001d,
    PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE  = 0x0000001e,
    PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE   = 0x0000001f,
    PF_RDTSCP_INSTRUCTION_AVAILABLE          = 0x00000020,
    PF_RDPID_INSTRUCTION_AVAILABLE           = 0x00000021,
    PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 0x00000022,
    PF_MONITORX_INSTRUCTION_AVAILABLE        = 0x00000023,
    PF_SSSE3_INSTRUCTIONS_AVAILABLE          = 0x00000024,
    PF_SSE4_1_INSTRUCTIONS_AVAILABLE         = 0x00000025,
    PF_SSE4_2_INSTRUCTIONS_AVAILABLE         = 0x00000026,
    PF_AVX_INSTRUCTIONS_AVAILABLE            = 0x00000027,
    PF_AVX2_INSTRUCTIONS_AVAILABLE           = 0x00000028,
    PF_AVX512F_INSTRUCTIONS_AVAILABLE        = 0x00000029,
    PF_ERMS_AVAILABLE                        = 0x0000002a,
    PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE     = 0x0000002b,
    PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE  = 0x0000002c,
    PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE  = 0x0000002d,
}

alias GET_GUI_RESOURCES_FLAGS = uint;
enum : uint
{
    GR_GLOBAL           = 0xfffffffe,
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

HANDLE GetCurrentProcessToken();
HANDLE GetCurrentThreadToken();
HANDLE GetCurrentThreadEffectiveToken();
BOOL GetProcessWorkingSetSize(HANDLE hProcess, ulong* lpMinimumWorkingSetSize, ulong* lpMaximumWorkingSetSize);
BOOL SetProcessWorkingSetSize(HANDLE hProcess, ulong dwMinimumWorkingSetSize, ulong dwMaximumWorkingSetSize);
uint FlsAlloc(PFLS_CALLBACK_FUNCTION lpCallback);
void* FlsGetValue(uint dwFlsIndex);
BOOL FlsSetValue(uint dwFlsIndex, void* lpFlsData);
BOOL FlsFree(uint dwFlsIndex);
BOOL IsThreadAFiber();
void InitializeSRWLock(SRWLOCK* SRWLock);
void ReleaseSRWLockExclusive(SRWLOCK* SRWLock);
void ReleaseSRWLockShared(SRWLOCK* SRWLock);
void AcquireSRWLockExclusive(SRWLOCK* SRWLock);
void AcquireSRWLockShared(SRWLOCK* SRWLock);
BOOLEAN TryAcquireSRWLockExclusive(SRWLOCK* SRWLock);
BOOLEAN TryAcquireSRWLockShared(SRWLOCK* SRWLock);
void InitializeCriticalSection(CRITICAL_SECTION* lpCriticalSection);
void EnterCriticalSection(CRITICAL_SECTION* lpCriticalSection);
void LeaveCriticalSection(CRITICAL_SECTION* lpCriticalSection);
BOOL InitializeCriticalSectionAndSpinCount(CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount);
BOOL InitializeCriticalSectionEx(CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount, uint Flags);
uint SetCriticalSectionSpinCount(CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount);
BOOL TryEnterCriticalSection(CRITICAL_SECTION* lpCriticalSection);
void DeleteCriticalSection(CRITICAL_SECTION* lpCriticalSection);
void InitOnceInitialize(INIT_ONCE* InitOnce);
BOOL InitOnceExecuteOnce(INIT_ONCE* InitOnce, PINIT_ONCE_FN InitFn, void* Parameter, void** Context);
BOOL InitOnceBeginInitialize(INIT_ONCE* lpInitOnce, uint dwFlags, BOOL* fPending, void** lpContext);
BOOL InitOnceComplete(INIT_ONCE* lpInitOnce, uint dwFlags, void* lpContext);
void InitializeConditionVariable(CONDITION_VARIABLE* ConditionVariable);
void WakeConditionVariable(CONDITION_VARIABLE* ConditionVariable);
void WakeAllConditionVariable(CONDITION_VARIABLE* ConditionVariable);
BOOL SleepConditionVariableCS(CONDITION_VARIABLE* ConditionVariable, CRITICAL_SECTION* CriticalSection, uint dwMilliseconds);
BOOL SleepConditionVariableSRW(CONDITION_VARIABLE* ConditionVariable, SRWLOCK* SRWLock, uint dwMilliseconds, uint Flags);
BOOL SetEvent(HANDLE hEvent);
BOOL ResetEvent(HANDLE hEvent);
BOOL ReleaseSemaphore(HANDLE hSemaphore, int lReleaseCount, int* lpPreviousCount);
BOOL ReleaseMutex(HANDLE hMutex);
WAIT_EVENT WaitForSingleObject(HANDLE hHandle, uint dwMilliseconds);
uint SleepEx(uint dwMilliseconds, BOOL bAlertable);
WAIT_EVENT WaitForSingleObjectEx(HANDLE hHandle, uint dwMilliseconds, BOOL bAlertable);
WAIT_EVENT WaitForMultipleObjectsEx(uint nCount, const(HANDLE)* lpHandles, BOOL bWaitAll, uint dwMilliseconds, BOOL bAlertable);
HANDLE CreateMutexA(SECURITY_ATTRIBUTES* lpMutexAttributes, BOOL bInitialOwner, const(char)* lpName);
HANDLE CreateMutexW(SECURITY_ATTRIBUTES* lpMutexAttributes, BOOL bInitialOwner, const(wchar)* lpName);
HANDLE OpenMutexW(SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, const(wchar)* lpName);
HANDLE CreateEventA(SECURITY_ATTRIBUTES* lpEventAttributes, BOOL bManualReset, BOOL bInitialState, const(char)* lpName);
HANDLE CreateEventW(SECURITY_ATTRIBUTES* lpEventAttributes, BOOL bManualReset, BOOL bInitialState, const(wchar)* lpName);
HANDLE OpenEventA(SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, const(char)* lpName);
HANDLE OpenEventW(SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, const(wchar)* lpName);
HANDLE OpenSemaphoreW(SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, const(wchar)* lpName);
HANDLE OpenWaitableTimerW(SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, const(wchar)* lpTimerName);
BOOL SetWaitableTimerEx(HANDLE hTimer, const(long)* lpDueTime, int lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, void* lpArgToCompletionRoutine, REASON_CONTEXT* WakeContext, uint TolerableDelay);
BOOL SetWaitableTimer(HANDLE hTimer, const(long)* lpDueTime, int lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, void* lpArgToCompletionRoutine, BOOL fResume);
BOOL CancelWaitableTimer(HANDLE hTimer);
HANDLE CreateMutexExA(SECURITY_ATTRIBUTES* lpMutexAttributes, const(char)* lpName, uint dwFlags, uint dwDesiredAccess);
HANDLE CreateMutexExW(SECURITY_ATTRIBUTES* lpMutexAttributes, const(wchar)* lpName, uint dwFlags, uint dwDesiredAccess);
HANDLE CreateEventExA(SECURITY_ATTRIBUTES* lpEventAttributes, const(char)* lpName, CREATE_EVENT dwFlags, uint dwDesiredAccess);
HANDLE CreateEventExW(SECURITY_ATTRIBUTES* lpEventAttributes, const(wchar)* lpName, CREATE_EVENT dwFlags, uint dwDesiredAccess);
HANDLE CreateSemaphoreExW(SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, const(wchar)* lpName, uint dwFlags, uint dwDesiredAccess);
HANDLE CreateWaitableTimerExW(SECURITY_ATTRIBUTES* lpTimerAttributes, const(wchar)* lpTimerName, uint dwFlags, uint dwDesiredAccess);
BOOL EnterSynchronizationBarrier(SYNCHRONIZATION_BARRIER* lpBarrier, uint dwFlags);
BOOL InitializeSynchronizationBarrier(SYNCHRONIZATION_BARRIER* lpBarrier, int lTotalThreads, int lSpinCount);
BOOL DeleteSynchronizationBarrier(SYNCHRONIZATION_BARRIER* lpBarrier);
void Sleep(uint dwMilliseconds);
BOOL WaitOnAddress(void* Address, void* CompareAddress, ulong AddressSize, uint dwMilliseconds);
void WakeByAddressSingle(void* Address);
void WakeByAddressAll(void* Address);
WAIT_EVENT WaitForMultipleObjects(uint nCount, const(HANDLE)* lpHandles, BOOL bWaitAll, uint dwMilliseconds);
HANDLE CreateSemaphoreW(SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, const(wchar)* lpName);
HANDLE CreateWaitableTimerW(SECURITY_ATTRIBUTES* lpTimerAttributes, BOOL bManualReset, const(wchar)* lpTimerName);
void InitializeSListHead(SLIST_HEADER* ListHead);
SLIST_ENTRY* InterlockedPopEntrySList(SLIST_HEADER* ListHead);
SLIST_ENTRY* InterlockedPushEntrySList(SLIST_HEADER* ListHead, SLIST_ENTRY* ListEntry);
SLIST_ENTRY* InterlockedPushListSListEx(SLIST_HEADER* ListHead, SLIST_ENTRY* List, SLIST_ENTRY* ListEnd, uint Count);
SLIST_ENTRY* InterlockedFlushSList(SLIST_HEADER* ListHead);
ushort QueryDepthSList(SLIST_HEADER* ListHead);
uint QueueUserAPC(PAPCFUNC pfnAPC, HANDLE hThread, ulong dwData);
BOOL QueueUserAPC2(PAPCFUNC ApcRoutine, HANDLE Thread, ulong Data, QUEUE_USER_APC_FLAGS Flags);
BOOL GetProcessTimes(HANDLE hProcess, FILETIME* lpCreationTime, FILETIME* lpExitTime, FILETIME* lpKernelTime, FILETIME* lpUserTime);
HANDLE GetCurrentProcess();
uint GetCurrentProcessId();
void ExitProcess(uint uExitCode);
BOOL TerminateProcess(HANDLE hProcess, uint uExitCode);
BOOL GetExitCodeProcess(HANDLE hProcess, uint* lpExitCode);
BOOL SwitchToThread();
HANDLE CreateThread(SECURITY_ATTRIBUTES* lpThreadAttributes, ulong dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, void* lpParameter, THREAD_CREATION_FLAGS dwCreationFlags, uint* lpThreadId);
HANDLE CreateRemoteThread(HANDLE hProcess, SECURITY_ATTRIBUTES* lpThreadAttributes, ulong dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, void* lpParameter, uint dwCreationFlags, uint* lpThreadId);
HANDLE GetCurrentThread();
uint GetCurrentThreadId();
HANDLE OpenThread(THREAD_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, uint dwThreadId);
BOOL SetThreadPriority(HANDLE hThread, THREAD_PRIORITY nPriority);
BOOL SetThreadPriorityBoost(HANDLE hThread, BOOL bDisablePriorityBoost);
BOOL GetThreadPriorityBoost(HANDLE hThread, BOOL* pDisablePriorityBoost);
int GetThreadPriority(HANDLE hThread);
void ExitThread(uint dwExitCode);
BOOL TerminateThread(HANDLE hThread, uint dwExitCode);
BOOL GetExitCodeThread(HANDLE hThread, uint* lpExitCode);
uint SuspendThread(HANDLE hThread);
uint ResumeThread(HANDLE hThread);
uint TlsAlloc();
void* TlsGetValue(uint dwTlsIndex);
BOOL TlsSetValue(uint dwTlsIndex, void* lpTlsValue);
BOOL TlsFree(uint dwTlsIndex);
BOOL CreateProcessA(const(char)* lpApplicationName, PSTR lpCommandLine, SECURITY_ATTRIBUTES* lpProcessAttributes, SECURITY_ATTRIBUTES* lpThreadAttributes, BOOL bInheritHandles, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(char)* lpCurrentDirectory, STARTUPINFOA* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL CreateProcessW(const(wchar)* lpApplicationName, PWSTR lpCommandLine, SECURITY_ATTRIBUTES* lpProcessAttributes, SECURITY_ATTRIBUTES* lpThreadAttributes, BOOL bInheritHandles, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(wchar)* lpCurrentDirectory, STARTUPINFOW* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL SetProcessShutdownParameters(uint dwLevel, uint dwFlags);
uint GetProcessVersion(uint ProcessId);
void GetStartupInfoW(STARTUPINFOW* lpStartupInfo);
BOOL CreateProcessAsUserW(HANDLE hToken, const(wchar)* lpApplicationName, PWSTR lpCommandLine, SECURITY_ATTRIBUTES* lpProcessAttributes, SECURITY_ATTRIBUTES* lpThreadAttributes, BOOL bInheritHandles, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(wchar)* lpCurrentDirectory, STARTUPINFOW* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL SetThreadToken(HANDLE* Thread, HANDLE Token);
BOOL OpenProcessToken(HANDLE ProcessHandle, TOKEN_ACCESS_MASK DesiredAccess, HANDLE* TokenHandle);
BOOL OpenThreadToken(HANDLE ThreadHandle, TOKEN_ACCESS_MASK DesiredAccess, BOOL OpenAsSelf, HANDLE* TokenHandle);
BOOL SetPriorityClass(HANDLE hProcess, PROCESS_CREATION_FLAGS dwPriorityClass);
uint GetPriorityClass(HANDLE hProcess);
BOOL SetThreadStackGuarantee(uint* StackSizeInBytes);
uint GetProcessId(HANDLE Process);
uint GetThreadId(HANDLE Thread);
void FlushProcessWriteBuffers();
uint GetProcessIdOfThread(HANDLE Thread);
BOOL InitializeProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, uint dwAttributeCount, uint dwFlags, ulong* lpSize);
void DeleteProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList);
BOOL UpdateProcThreadAttribute(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, uint dwFlags, ulong Attribute, void* lpValue, ulong cbSize, void* lpPreviousValue, ulong* lpReturnSize);
BOOL SetProcessDynamicEHContinuationTargets(HANDLE Process, ushort NumberOfTargets, PROCESS_DYNAMIC_EH_CONTINUATION_TARGET* Targets);
BOOL SetProcessDynamicEnforcedCetCompatibleRanges(HANDLE Process, ushort NumberOfRanges, PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE* Ranges);
BOOL SetProcessAffinityUpdateMode(HANDLE hProcess, PROCESS_AFFINITY_AUTO_UPDATE_FLAGS dwFlags);
BOOL QueryProcessAffinityUpdateMode(HANDLE hProcess, PROCESS_AFFINITY_AUTO_UPDATE_FLAGS* lpdwFlags);
HANDLE CreateRemoteThreadEx(HANDLE hProcess, SECURITY_ATTRIBUTES* lpThreadAttributes, ulong dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, void* lpParameter, uint dwCreationFlags, LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, uint* lpThreadId);
void GetCurrentThreadStackLimits(ulong* LowLimit, ulong* HighLimit);
BOOL GetProcessMitigationPolicy(HANDLE hProcess, PROCESS_MITIGATION_POLICY MitigationPolicy, void* lpBuffer, ulong dwLength);
BOOL SetProcessMitigationPolicy(PROCESS_MITIGATION_POLICY MitigationPolicy, void* lpBuffer, ulong dwLength);
BOOL GetThreadTimes(HANDLE hThread, FILETIME* lpCreationTime, FILETIME* lpExitTime, FILETIME* lpKernelTime, FILETIME* lpUserTime);
HANDLE OpenProcess(PROCESS_ACCESS_RIGHTS dwDesiredAccess, BOOL bInheritHandle, uint dwProcessId);
BOOL IsProcessorFeaturePresent(PROCESSOR_FEATURE_ID ProcessorFeature);
BOOL GetProcessHandleCount(HANDLE hProcess, uint* pdwHandleCount);
uint GetCurrentProcessorNumber();
BOOL SetThreadIdealProcessorEx(HANDLE hThread, PROCESSOR_NUMBER* lpIdealProcessor, PROCESSOR_NUMBER* lpPreviousIdealProcessor);
BOOL GetThreadIdealProcessorEx(HANDLE hThread, PROCESSOR_NUMBER* lpIdealProcessor);
void GetCurrentProcessorNumberEx(PROCESSOR_NUMBER* ProcNumber);
BOOL GetProcessPriorityBoost(HANDLE hProcess, BOOL* pDisablePriorityBoost);
BOOL SetProcessPriorityBoost(HANDLE hProcess, BOOL bDisablePriorityBoost);
BOOL GetThreadIOPendingFlag(HANDLE hThread, BOOL* lpIOIsPending);
BOOL GetSystemTimes(FILETIME* lpIdleTime, FILETIME* lpKernelTime, FILETIME* lpUserTime);
BOOL GetThreadInformation(HANDLE hThread, THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize);
BOOL SetThreadInformation(HANDLE hThread, THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize);
BOOL IsProcessCritical(HANDLE hProcess, BOOL* Critical);
BOOL SetProtectedPolicy(const(GUID)* PolicyGuid, ulong PolicyValue, ulong* OldPolicyValue);
BOOL QueryProtectedPolicy(const(GUID)* PolicyGuid, ulong* PolicyValue);
uint SetThreadIdealProcessor(HANDLE hThread, uint dwIdealProcessor);
BOOL SetProcessInformation(HANDLE hProcess, PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize);
BOOL GetProcessInformation(HANDLE hProcess, PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize);
BOOL GetProcessDefaultCpuSets(HANDLE Process, uint* CpuSetIds, uint CpuSetIdCount, uint* RequiredIdCount);
BOOL SetProcessDefaultCpuSets(HANDLE Process, const(uint)* CpuSetIds, uint CpuSetIdCount);
BOOL GetThreadSelectedCpuSets(HANDLE Thread, uint* CpuSetIds, uint CpuSetIdCount, uint* RequiredIdCount);
BOOL SetThreadSelectedCpuSets(HANDLE Thread, const(uint)* CpuSetIds, uint CpuSetIdCount);
BOOL CreateProcessAsUserA(HANDLE hToken, const(char)* lpApplicationName, PSTR lpCommandLine, SECURITY_ATTRIBUTES* lpProcessAttributes, SECURITY_ATTRIBUTES* lpThreadAttributes, BOOL bInheritHandles, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(char)* lpCurrentDirectory, STARTUPINFOA* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL GetProcessShutdownParameters(uint* lpdwLevel, uint* lpdwFlags);
BOOL GetProcessDefaultCpuSetMasks(HANDLE Process, GROUP_AFFINITY* CpuSetMasks, ushort CpuSetMaskCount, ushort* RequiredMaskCount);
BOOL SetProcessDefaultCpuSetMasks(HANDLE Process, GROUP_AFFINITY* CpuSetMasks, ushort CpuSetMaskCount);
BOOL GetThreadSelectedCpuSetMasks(HANDLE Thread, GROUP_AFFINITY* CpuSetMasks, ushort CpuSetMaskCount, ushort* RequiredMaskCount);
BOOL SetThreadSelectedCpuSetMasks(HANDLE Thread, GROUP_AFFINITY* CpuSetMasks, ushort CpuSetMaskCount);
HRESULT GetMachineTypeAttributes(ushort Machine, MACHINE_ATTRIBUTES* MachineTypeAttributes);
HRESULT SetThreadDescription(HANDLE hThread, const(wchar)* lpThreadDescription);
HRESULT GetThreadDescription(HANDLE hThread, PWSTR* ppszThreadDescription);
BOOL QueueUserWorkItem(LPTHREAD_START_ROUTINE Function, void* Context, WORKER_THREAD_FLAGS Flags);
BOOL UnregisterWaitEx(HANDLE WaitHandle, HANDLE CompletionEvent);
HANDLE CreateTimerQueue();
BOOL CreateTimerQueueTimer(HANDLE* phNewTimer, HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, void* Parameter, uint DueTime, uint Period, WORKER_THREAD_FLAGS Flags);
BOOL ChangeTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer, uint DueTime, uint Period);
BOOL DeleteTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);
BOOL DeleteTimerQueue(HANDLE TimerQueue);
BOOL DeleteTimerQueueEx(HANDLE TimerQueue, HANDLE CompletionEvent);
PTP_POOL CreateThreadpool(void* reserved);
void SetThreadpoolThreadMaximum(PTP_POOL ptpp, uint cthrdMost);
BOOL SetThreadpoolThreadMinimum(PTP_POOL ptpp, uint cthrdMic);
BOOL SetThreadpoolStackInformation(PTP_POOL ptpp, TP_POOL_STACK_INFORMATION* ptpsi);
BOOL QueryThreadpoolStackInformation(PTP_POOL ptpp, TP_POOL_STACK_INFORMATION* ptpsi);
void CloseThreadpool(PTP_POOL ptpp);
PTP_CLEANUP_GROUP CreateThreadpoolCleanupGroup();
void CloseThreadpoolCleanupGroupMembers(PTP_CLEANUP_GROUP ptpcg, BOOL fCancelPendingCallbacks, void* pvCleanupContext);
void CloseThreadpoolCleanupGroup(PTP_CLEANUP_GROUP ptpcg);
void SetEventWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE evt);
void ReleaseSemaphoreWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE sem, uint crel);
void ReleaseMutexWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE mut);
void LeaveCriticalSectionWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, CRITICAL_SECTION* pcs);
void FreeLibraryWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HMODULE mod);
BOOL CallbackMayRunLong(PTP_CALLBACK_INSTANCE pci);
void DisassociateCurrentThreadFromCallback(PTP_CALLBACK_INSTANCE pci);
BOOL TrySubmitThreadpoolCallback(PTP_SIMPLE_CALLBACK pfns, void* pv, TP_CALLBACK_ENVIRON_V3* pcbe);
PTP_WORK CreateThreadpoolWork(PTP_WORK_CALLBACK pfnwk, void* pv, TP_CALLBACK_ENVIRON_V3* pcbe);
void SubmitThreadpoolWork(PTP_WORK pwk);
void WaitForThreadpoolWorkCallbacks(PTP_WORK pwk, BOOL fCancelPendingCallbacks);
void CloseThreadpoolWork(PTP_WORK pwk);
PTP_TIMER CreateThreadpoolTimer(PTP_TIMER_CALLBACK pfnti, void* pv, TP_CALLBACK_ENVIRON_V3* pcbe);
void SetThreadpoolTimer(PTP_TIMER pti, FILETIME* pftDueTime, uint msPeriod, uint msWindowLength);
BOOL IsThreadpoolTimerSet(PTP_TIMER pti);
void WaitForThreadpoolTimerCallbacks(PTP_TIMER pti, BOOL fCancelPendingCallbacks);
void CloseThreadpoolTimer(PTP_TIMER pti);
PTP_WAIT CreateThreadpoolWait(PTP_WAIT_CALLBACK pfnwa, void* pv, TP_CALLBACK_ENVIRON_V3* pcbe);
void SetThreadpoolWait(PTP_WAIT pwa, HANDLE h, FILETIME* pftTimeout);
void WaitForThreadpoolWaitCallbacks(PTP_WAIT pwa, BOOL fCancelPendingCallbacks);
void CloseThreadpoolWait(PTP_WAIT pwa);
PTP_IO CreateThreadpoolIo(HANDLE fl, PTP_WIN32_IO_CALLBACK pfnio, void* pv, TP_CALLBACK_ENVIRON_V3* pcbe);
void StartThreadpoolIo(PTP_IO pio);
void CancelThreadpoolIo(PTP_IO pio);
void WaitForThreadpoolIoCallbacks(PTP_IO pio, BOOL fCancelPendingCallbacks);
void CloseThreadpoolIo(PTP_IO pio);
BOOL SetThreadpoolTimerEx(PTP_TIMER pti, FILETIME* pftDueTime, uint msPeriod, uint msWindowLength);
BOOL SetThreadpoolWaitEx(PTP_WAIT pwa, HANDLE h, FILETIME* pftTimeout, void* Reserved);
BOOL IsWow64Process(HANDLE hProcess, BOOL* Wow64Process);
ushort Wow64SetThreadDefaultGuestMachine(ushort Machine);
BOOL IsWow64Process2(HANDLE hProcess, IMAGE_FILE_MACHINE* pProcessMachine, IMAGE_FILE_MACHINE* pNativeMachine);
uint Wow64SuspendThread(HANDLE hThread);
HANDLE CreatePrivateNamespaceW(SECURITY_ATTRIBUTES* lpPrivateNamespaceAttributes, void* lpBoundaryDescriptor, const(wchar)* lpAliasPrefix);
HANDLE OpenPrivateNamespaceW(void* lpBoundaryDescriptor, const(wchar)* lpAliasPrefix);
BOOLEAN ClosePrivateNamespace(HANDLE Handle, uint Flags);
HANDLE CreateBoundaryDescriptorW(const(wchar)* Name, uint Flags);
BOOL AddSIDToBoundaryDescriptor(HANDLE* BoundaryDescriptor, PSID RequiredSid);
void DeleteBoundaryDescriptor(HANDLE BoundaryDescriptor);
BOOL GetNumaHighestNodeNumber(uint* HighestNodeNumber);
BOOL GetNumaNodeProcessorMaskEx(ushort Node, GROUP_AFFINITY* ProcessorMask);
BOOL GetNumaNodeProcessorMask2(ushort NodeNumber, GROUP_AFFINITY* ProcessorMasks, ushort ProcessorMaskCount, ushort* RequiredMaskCount);
BOOL GetNumaProximityNodeEx(uint ProximityId, ushort* NodeNumber);
BOOL GetProcessGroupAffinity(HANDLE hProcess, ushort* GroupCount, ushort* GroupArray);
BOOL GetThreadGroupAffinity(HANDLE hThread, GROUP_AFFINITY* GroupAffinity);
BOOL SetThreadGroupAffinity(HANDLE hThread, const(GROUP_AFFINITY)* GroupAffinity, GROUP_AFFINITY* PreviousGroupAffinity);
HANDLE AvSetMmThreadCharacteristicsA(const(char)* TaskName, uint* TaskIndex);
HANDLE AvSetMmThreadCharacteristicsW(const(wchar)* TaskName, uint* TaskIndex);
HANDLE AvSetMmMaxThreadCharacteristicsA(const(char)* FirstTask, const(char)* SecondTask, uint* TaskIndex);
HANDLE AvSetMmMaxThreadCharacteristicsW(const(wchar)* FirstTask, const(wchar)* SecondTask, uint* TaskIndex);
BOOL AvRevertMmThreadCharacteristics(HANDLE AvrtHandle);
BOOL AvSetMmThreadPriority(HANDLE AvrtHandle, AVRT_PRIORITY Priority);
BOOL AvRtCreateThreadOrderingGroup(HANDLE* Context, long* Period, GUID* ThreadOrderingGuid, long* Timeout);
BOOL AvRtCreateThreadOrderingGroupExA(HANDLE* Context, long* Period, GUID* ThreadOrderingGuid, long* Timeout, const(char)* TaskName);
BOOL AvRtCreateThreadOrderingGroupExW(HANDLE* Context, long* Period, GUID* ThreadOrderingGuid, long* Timeout, const(wchar)* TaskName);
BOOL AvRtJoinThreadOrderingGroup(HANDLE* Context, GUID* ThreadOrderingGuid, BOOL Before);
BOOL AvRtWaitOnThreadOrderingGroup(HANDLE Context);
BOOL AvRtLeaveThreadOrderingGroup(HANDLE Context);
BOOL AvRtDeleteThreadOrderingGroup(HANDLE Context);
BOOL AvQuerySystemResponsiveness(HANDLE AvrtHandle, uint* SystemResponsivenessValue);
HRESULT RtwqStartup();
HRESULT RtwqShutdown();
HRESULT RtwqLockWorkQueue(uint workQueueId);
HRESULT RtwqUnlockWorkQueue(uint workQueueId);
HRESULT RtwqLockSharedWorkQueue(const(wchar)* usageClass, int basePriority, uint* taskId, uint* id);
HRESULT RtwqJoinWorkQueue(uint workQueueId, HANDLE hFile, HANDLE* out_);
HRESULT RtwqUnjoinWorkQueue(uint workQueueId, HANDLE hFile);
HRESULT RtwqCreateAsyncResult(IUnknown appObject, IRtwqAsyncCallback callback, IUnknown appState, IRtwqAsyncResult* asyncResult);
HRESULT RtwqInvokeCallback(IRtwqAsyncResult result);
HRESULT RtwqLockPlatform();
HRESULT RtwqUnlockPlatform();
HRESULT RtwqRegisterPlatformWithMMCSS(const(wchar)* usageClass, uint* taskId, int lPriority);
HRESULT RtwqUnregisterPlatformFromMMCSS();
HRESULT RtwqPutWorkItem(uint dwQueue, int lPriority, IRtwqAsyncResult result);
HRESULT RtwqPutWaitingWorkItem(HANDLE hEvent, int lPriority, IRtwqAsyncResult result, ulong* key);
HRESULT RtwqAllocateSerialWorkQueue(uint workQueueIdIn, uint* workQueueIdOut);
HRESULT RtwqScheduleWorkItem(IRtwqAsyncResult result, long Timeout, ulong* key);
HRESULT RtwqAddPeriodicCallback(RTWQPERIODICCALLBACK Callback, IUnknown context, uint* key);
HRESULT RtwqRemovePeriodicCallback(uint dwKey);
HRESULT RtwqCancelWorkItem(ulong Key);
HRESULT RtwqAllocateWorkQueue(RTWQ_WORKQUEUE_TYPE WorkQueueType, uint* workQueueId);
HRESULT RtwqBeginRegisterWorkQueueWithMMCSS(uint workQueueId, const(wchar)* usageClass, uint dwTaskId, int lPriority, IRtwqAsyncCallback doneCallback, IUnknown doneState);
HRESULT RtwqBeginUnregisterWorkQueueWithMMCSS(uint workQueueId, IRtwqAsyncCallback doneCallback, IUnknown doneState);
HRESULT RtwqEndRegisterWorkQueueWithMMCSS(IRtwqAsyncResult result, uint* taskId);
HRESULT RtwqGetWorkQueueMMCSSClass(uint workQueueId, PWSTR usageClass, uint* usageClassLength);
HRESULT RtwqGetWorkQueueMMCSSTaskId(uint workQueueId, uint* taskId);
HRESULT RtwqGetWorkQueueMMCSSPriority(uint workQueueId, int* priority);
HRESULT RtwqRegisterPlatformEvents(IRtwqPlatformEvents platformEvents);
HRESULT RtwqUnregisterPlatformEvents(IRtwqPlatformEvents platformEvents);
HRESULT RtwqSetLongRunning(uint workQueueId, BOOL enable);
HRESULT RtwqSetDeadline(uint workQueueId, long deadlineInHNS, HANDLE* pRequest);
HRESULT RtwqSetDeadline2(uint workQueueId, long deadlineInHNS, long preDeadlineInHNS, HANDLE* pRequest);
HRESULT RtwqCancelDeadline(HANDLE pRequest);
HANDLE GetProcessHandleFromHwnd(HWND hwnd);
BOOL AttachThreadInput(uint idAttach, uint idAttachTo, BOOL fAttach);
uint WaitForInputIdle(HANDLE hProcess, uint dwMilliseconds);
uint GetGuiResources(HANDLE hProcess, GET_GUI_RESOURCES_FLAGS uiFlags);
BOOL IsImmersiveProcess(HANDLE hProcess);
BOOL SetProcessRestrictionExemption(BOOL fEnableExemption);
BOOL GetProcessAffinityMask(HANDLE hProcess, ulong* lpProcessAffinityMask, ulong* lpSystemAffinityMask);
BOOL SetProcessAffinityMask(HANDLE hProcess, ulong dwProcessAffinityMask);
BOOL GetProcessIoCounters(HANDLE hProcess, IO_COUNTERS* lpIoCounters);
void SwitchToFiber(void* lpFiber);
void DeleteFiber(void* lpFiber);
BOOL ConvertFiberToThread();
void* CreateFiberEx(ulong dwStackCommitSize, ulong dwStackReserveSize, uint dwFlags, LPFIBER_START_ROUTINE lpStartAddress, void* lpParameter);
void* ConvertThreadToFiberEx(void* lpParameter, uint dwFlags);
void* CreateFiber(ulong dwStackSize, LPFIBER_START_ROUTINE lpStartAddress, void* lpParameter);
void* ConvertThreadToFiber(void* lpParameter);
BOOL CreateUmsCompletionList(void** UmsCompletionList);
BOOL DequeueUmsCompletionListItems(void* UmsCompletionList, uint WaitTimeOut, void** UmsThreadList);
BOOL GetUmsCompletionListEvent(void* UmsCompletionList, HANDLE* UmsCompletionEvent);
BOOL ExecuteUmsThread(void* UmsThread);
BOOL UmsThreadYield(void* SchedulerParam);
BOOL DeleteUmsCompletionList(void* UmsCompletionList);
void* GetCurrentUmsThread();
void* GetNextUmsListItem(void* UmsContext);
BOOL QueryUmsThreadInformation(void* UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength, uint* ReturnLength);
BOOL SetUmsThreadInformation(void* UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength);
BOOL DeleteUmsThreadContext(void* UmsThread);
BOOL CreateUmsThreadContext(void** lpUmsThread);
BOOL EnterUmsSchedulingMode(UMS_SCHEDULER_STARTUP_INFO* SchedulerStartupInfo);
BOOL GetUmsSystemThreadInformation(HANDLE ThreadHandle, UMS_SYSTEM_THREAD_INFORMATION* SystemThreadInfo);
ulong SetThreadAffinityMask(HANDLE hThread, ulong dwThreadAffinityMask);
BOOL SetProcessDEPPolicy(PROCESS_DEP_FLAGS dwFlags);
BOOL GetProcessDEPPolicy(HANDLE hProcess, uint* lpFlags, BOOL* lpPermanent);
BOOL PulseEvent(HANDLE hEvent);
uint WinExec(const(char)* lpCmdLine, uint uCmdShow);
WAIT_EVENT SignalObjectAndWait(HANDLE hObjectToSignal, HANDLE hObjectToWaitOn, uint dwMilliseconds, BOOL bAlertable);
HANDLE CreateSemaphoreA(SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, const(char)* lpName);
HANDLE CreateWaitableTimerA(SECURITY_ATTRIBUTES* lpTimerAttributes, BOOL bManualReset, const(char)* lpTimerName);
HANDLE OpenWaitableTimerA(uint dwDesiredAccess, BOOL bInheritHandle, const(char)* lpTimerName);
HANDLE CreateSemaphoreExA(SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, const(char)* lpName, uint dwFlags, uint dwDesiredAccess);
HANDLE CreateWaitableTimerExA(SECURITY_ATTRIBUTES* lpTimerAttributes, const(char)* lpTimerName, uint dwFlags, uint dwDesiredAccess);
BOOL QueryFullProcessImageNameA(HANDLE hProcess, PROCESS_NAME_FORMAT dwFlags, PSTR lpExeName, uint* lpdwSize);
BOOL QueryFullProcessImageNameW(HANDLE hProcess, PROCESS_NAME_FORMAT dwFlags, PWSTR lpExeName, uint* lpdwSize);
void GetStartupInfoA(STARTUPINFOA* lpStartupInfo);
BOOL CreateProcessWithLogonW(const(wchar)* lpUsername, const(wchar)* lpDomain, const(wchar)* lpPassword, CREATE_PROCESS_LOGON_FLAGS dwLogonFlags, const(wchar)* lpApplicationName, PWSTR lpCommandLine, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(wchar)* lpCurrentDirectory, STARTUPINFOW* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL CreateProcessWithTokenW(HANDLE hToken, CREATE_PROCESS_LOGON_FLAGS dwLogonFlags, const(wchar)* lpApplicationName, PWSTR lpCommandLine, PROCESS_CREATION_FLAGS dwCreationFlags, void* lpEnvironment, const(wchar)* lpCurrentDirectory, STARTUPINFOW* lpStartupInfo, PROCESS_INFORMATION* lpProcessInformation);
BOOL RegisterWaitForSingleObject(HANDLE* phNewWaitObject, HANDLE hObject, WAITORTIMERCALLBACK Callback, void* Context, uint dwMilliseconds, WORKER_THREAD_FLAGS dwFlags);
BOOL UnregisterWait(HANDLE WaitHandle);
HANDLE SetTimerQueueTimer(HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, void* Parameter, uint DueTime, uint Period, BOOL PreferIo);
BOOL CancelTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer);
HANDLE CreatePrivateNamespaceA(SECURITY_ATTRIBUTES* lpPrivateNamespaceAttributes, void* lpBoundaryDescriptor, const(char)* lpAliasPrefix);
HANDLE OpenPrivateNamespaceA(void* lpBoundaryDescriptor, const(char)* lpAliasPrefix);
HANDLE CreateBoundaryDescriptorA(const(char)* Name, uint Flags);
BOOL AddIntegrityLabelToBoundaryDescriptor(HANDLE* BoundaryDescriptor, PSID IntegrityLabel);
ushort GetActiveProcessorGroupCount();
ushort GetMaximumProcessorGroupCount();
uint GetActiveProcessorCount(ushort GroupNumber);
uint GetMaximumProcessorCount(ushort GroupNumber);
BOOL GetNumaProcessorNode(ubyte Processor, ubyte* NodeNumber);
BOOL GetNumaNodeNumberFromHandle(HANDLE hFile, ushort* NodeNumber);
BOOL GetNumaProcessorNodeEx(PROCESSOR_NUMBER* Processor, ushort* NodeNumber);
BOOL GetNumaNodeProcessorMask(ubyte Node, ulong* ProcessorMask);
BOOL GetNumaAvailableMemoryNode(ubyte Node, ulong* AvailableBytes);
BOOL GetNumaAvailableMemoryNodeEx(ushort Node, ulong* AvailableBytes);
BOOL GetNumaProximityNode(uint ProximityId, ubyte* NodeNumber);
enum CONDITION_VARIABLE_LOCKMODE_SHARED = 0x00000001;
enum INIT_ONCE_CHECK_ONLY = 0x00000001;
enum INIT_ONCE_ASYNC = 0x00000002;
enum INIT_ONCE_INIT_FAILED = 0x00000004;
enum INIT_ONCE_CTX_RESERVED_BITS = 0x00000002;
enum CONDITION_VARIABLE_INIT = CONDITION_VARIABLE(null);
enum SRWLOCK_INIT = SRWLOCK(null);
enum INIT_ONCE_STATIC_INIT = INIT_ONCE(null);
enum ALL_PROCESSOR_GROUPS = 0xffff;
enum RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO = 0x01000000;
enum RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN = 0x02000000;
enum RTL_CRITICAL_SECTION_FLAG_STATIC_INIT = 0x04000000;
enum RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE = 0x08000000;
enum RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO = 0x10000000;
enum RTL_CRITICAL_SECTION_ALL_FLAG_BITS = 0xff000000;
enum RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT = 0x00000001;
enum FLS_OUT_OF_INDEXES = 0xffffffff;
enum PRIVATE_NAMESPACE_FLAG_DESTROY = 0x00000001;
enum TLS_OUT_OF_INDEXES = 0xffffffff;
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
enum CREATE_MUTEX_INITIAL_OWNER = 0x00000001;
enum CREATE_WAITABLE_TIMER_MANUAL_RESET = 0x00000001;
enum CREATE_WAITABLE_TIMER_HIGH_RESOLUTION = 0x00000002;
enum SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY = 0x00000001;
enum SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY = 0x00000002;
enum SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE = 0x00000004;
enum INFINITE = 0xffffffff;
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
struct PROCESS_BASIC_INFORMATION
{
    NTSTATUS ExitStatus;
    PEB* PebBaseAddress;
    ulong AffinityMask;
    int BasePriority;
    ulong UniqueProcessId;
    ulong InheritedFromUniqueProcessId;
}
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

alias PTP_POOL = long;
alias PTP_CLEANUP_GROUP = long;
alias LPPROC_THREAD_ATTRIBUTE_LIST = void*;
alias PTP_IO = long;
alias PTP_TIMER = long;
alias PTP_WAIT = long;
alias PTP_WORK = long;
alias PTP_CALLBACK_INSTANCE = long;
struct REASON_CONTEXT
{
    uint Version;
    POWER_REQUEST_CONTEXT_FLAGS Flags;
    union Reason
    {
        struct Detailed
        {
            HMODULE LocalizedReasonModule;
            uint LocalizedReasonId;
            uint ReasonStringCount;
            PWSTR* ReasonStrings;
        }
        PWSTR SimpleReasonString;
    }
}
alias LPTHREAD_START_ROUTINE = uint function(void* lpThreadParameter);
alias PINIT_ONCE_FN = BOOL function(INIT_ONCE* InitOnce, void* Parameter, void** Context);
alias PTIMERAPCROUTINE = void function(void* lpArgToCompletionRoutine, uint dwTimerLowValue, uint dwTimerHighValue);
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
    QUEUE_USER_APC_CALLBACK_DATA_CONTEXT  = 0x00010000,
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
    ProcessMemoryPriority                      = 0x00000000,
    ProcessMemoryExhaustionInfo                = 0x00000001,
    ProcessAppMemoryInfo                       = 0x00000002,
    ProcessInPrivateInfo                       = 0x00000003,
    ProcessPowerThrottling                     = 0x00000004,
    ProcessReservedValue1                      = 0x00000005,
    ProcessTelemetryCoverageInfo               = 0x00000006,
    ProcessProtectionLevelInfo                 = 0x00000007,
    ProcessLeapSecondInfo                      = 0x00000008,
    ProcessMachineTypeInfo                     = 0x00000009,
    ProcessOverrideSubsequentPrefetchParameter = 0x0000000a,
    ProcessMaxOverridePrefetchParameter        = 0x0000000b,
    ProcessInformationClassMax                 = 0x0000000c,
}

struct APP_MEMORY_INFORMATION
{
    ulong AvailableCommit;
    ulong PrivateCommitUsage;
    ulong PeakPrivateCommitUsage;
    ulong TotalCommitUsage;
}
alias MACHINE_ATTRIBUTES = int;
enum : int
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
alias OVERRIDE_PREFETCH_PARAMETER = uint;
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
alias PTP_WIN32_IO_CALLBACK = void function(PTP_CALLBACK_INSTANCE Instance, void* Context, void* Overlapped, uint IoResult, ulong NumberOfBytesTransferred, PTP_IO Io);
alias AVRT_PRIORITY = int;
enum : int
{
    AVRT_PRIORITY_VERYLOW  = 0xfffffffe,
    AVRT_PRIORITY_LOW      = 0xffffffff,
    AVRT_PRIORITY_NORMAL   = 0x00000000,
    AVRT_PRIORITY_HIGH     = 0x00000001,
    AVRT_PRIORITY_CRITICAL = 0x00000002,
}

alias RTWQPERIODICCALLBACK = void function(IUnknown context);
alias RTWQ_WORKQUEUE_TYPE = int;
enum : int
{
    RTWQ_STANDARD_WORKQUEUE      = 0x00000000,
    RTWQ_WINDOW_WORKQUEUE        = 0x00000001,
    RTWQ_MULTITHREADED_WORKQUEUE = 0x00000002,
}

enum IID_IRtwqAsyncResult = GUID(0xac6b7889, 0x740, 0x4d51, [0x86, 0x19, 0x90, 0x59, 0x94, 0xa5, 0x5c, 0xc6]);
interface IRtwqAsyncResult : IUnknown
{
    HRESULT GetState(IUnknown* ppunkState);
    HRESULT GetStatus();
    HRESULT SetStatus(HRESULT hrStatus);
    HRESULT GetObject(IUnknown* ppObject);
    IUnknown GetStateNoAddRef();
}
enum IID_IRtwqAsyncCallback = GUID(0xa27003cf, 0x2354, 0x4f2a, [0x8d, 0x6a, 0xab, 0x7c, 0xff, 0x15, 0x43, 0x7e]);
interface IRtwqAsyncCallback : IUnknown
{
    HRESULT GetParameters(uint* pdwFlags, uint* pdwQueue);
    HRESULT Invoke(IRtwqAsyncResult pAsyncResult);
}
// [Not Found] IID_RTWQASYNCRESULT
interface RTWQASYNCRESULT : IRtwqAsyncResult
{
}
enum IID_IRtwqPlatformEvents = GUID(0x63d9255a, 0x7ff1, 0x4b61, [0x8f, 0xaf, 0xed, 0x64, 0x60, 0xda, 0xcf, 0x2b]);
interface IRtwqPlatformEvents : IUnknown
{
    HRESULT InitializationComplete();
    HRESULT ShutdownStart();
    HRESULT ShutdownComplete();
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
    ProcessDEPPolicy                    = 0x00000000,
    ProcessASLRPolicy                   = 0x00000001,
    ProcessDynamicCodePolicy            = 0x00000002,
    ProcessStrictHandleCheckPolicy      = 0x00000003,
    ProcessSystemCallDisablePolicy      = 0x00000004,
    ProcessMitigationOptionsMask        = 0x00000005,
    ProcessExtensionPointDisablePolicy  = 0x00000006,
    ProcessControlFlowGuardPolicy       = 0x00000007,
    ProcessSignaturePolicy              = 0x00000008,
    ProcessFontDisablePolicy            = 0x00000009,
    ProcessImageLoadPolicy              = 0x0000000a,
    ProcessSystemCallFilterPolicy       = 0x0000000b,
    ProcessPayloadRestrictionPolicy     = 0x0000000c,
    ProcessChildProcessPolicy           = 0x0000000d,
    ProcessSideChannelIsolationPolicy   = 0x0000000e,
    ProcessUserShadowStackPolicy        = 0x0000000f,
    ProcessRedirectionTrustPolicy       = 0x00000010,
    ProcessUserPointerAuthPolicy        = 0x00000011,
    ProcessSEHOPPolicy                  = 0x00000012,
    ProcessActivationContextTrustPolicy = 0x00000013,
    MaxProcessMitigationPolicy          = 0x00000014,
}

union INIT_ONCE
{
    void* Ptr;
}
struct SYNCHRONIZATION_BARRIER
{
    uint Reserved1;
    uint Reserved2;
    ulong[2] Reserved3;
    uint Reserved4;
    uint Reserved5;
}
alias UMS_THREAD_INFO_CLASS = int;
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

alias PRTL_UMS_SCHEDULER_ENTRY_POINT = void function(RTL_UMS_SCHEDULER_REASON Reason, ulong ActivationPayload, void* SchedulerParam);
struct CRITICAL_SECTION_DEBUG
{
    ushort Type;
    ushort CreatorBackTraceIndex;
    CRITICAL_SECTION* CriticalSection;
    LIST_ENTRY ProcessLocksList;
    uint EntryCount;
    uint ContentionCount;
    uint Flags;
    ushort CreatorBackTraceIndexHigh;
    ushort Identifier;
}
struct CRITICAL_SECTION
{
    CRITICAL_SECTION_DEBUG* DebugInfo;
    int LockCount;
    int RecursionCount;
    HANDLE OwningThread;
    HANDLE LockSemaphore;
    ulong SpinCount;
}
struct SRWLOCK
{
    void* Ptr;
}
struct CONDITION_VARIABLE
{
    void* Ptr;
}
alias WAITORTIMERCALLBACK = void function(void* param0, BOOLEAN param1);
alias WORKERCALLBACKFUNC = void function(void* param0);
alias APC_CALLBACK_FUNCTION = void function(uint param0, void* param1, void* param2);
alias PFLS_CALLBACK_FUNCTION = void function(void* lpFlsData);
alias PTP_SIMPLE_CALLBACK = void function(PTP_CALLBACK_INSTANCE Instance, void* Context);
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
alias PTP_CLEANUP_GROUP_CANCEL_CALLBACK = void function(void* ObjectContext, void* CleanupContext);
struct TP_CALLBACK_ENVIRON_V3
{
    uint Version;
    PTP_POOL Pool;
    PTP_CLEANUP_GROUP CleanupGroup;
    PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback;
    void* RaceDll;
    long ActivationContext;
    PTP_SIMPLE_CALLBACK FinalizationCallback;
    union u
    {
        uint Flags;
        struct s
        {
            uint _bitfield0;
        }
    }
    TP_CALLBACK_PRIORITY CallbackPriority;
    uint Size;
}
alias PTP_WORK_CALLBACK = void function(PTP_CALLBACK_INSTANCE Instance, void* Context, PTP_WORK Work);
alias PTP_TIMER_CALLBACK = void function(PTP_CALLBACK_INSTANCE Instance, void* Context, PTP_TIMER Timer);
alias PTP_WAIT_CALLBACK = void function(PTP_CALLBACK_INSTANCE Instance, void* Context, PTP_WAIT Wait, uint WaitResult);
alias LPFIBER_START_ROUTINE = void function(void* lpFiberParameter);
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
    ProcThreadAttributeTrustedApp                   = 0x0000001d,
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
struct TEB
{
    void*[12] Reserved1;
    PEB* ProcessEnvironmentBlock;
    void*[399] Reserved2;
    ubyte[1952] Reserved3;
    void*[64] TlsSlots;
    ubyte[8] Reserved4;
    void*[26] Reserved5;
    void* ReservedForOle;
    void*[4] Reserved6;
    void* TlsExpansionSlots;
}
