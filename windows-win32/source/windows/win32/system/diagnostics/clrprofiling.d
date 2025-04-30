module windows.win32.system.diagnostics.clrprofiling;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt.metadata : ASSEMBLYMETADATA, COR_FIELD_OFFSET, CorElementType;

version (Windows):
extern (Windows):

struct COR_IL_MAP
{
    uint oldOffset;
    uint newOffset;
    BOOL fAccurate;
}
alias CorDebugIlToNativeMappingTypes = int;
enum : int
{
    NO_MAPPING = 0xffffffff,
    PROLOG     = 0xfffffffe,
    EPILOG     = 0xfffffffd,
}

struct COR_DEBUG_IL_TO_NATIVE_MAP
{
    uint ilOffset;
    uint nativeStartOffset;
    uint nativeEndOffset;
}
union FunctionIDOrClientID
{
    ulong functionID;
    ulong clientID;
}
alias FunctionIDMapper = ulong function(ulong funcId, BOOL* pbHookFunction);
alias FunctionIDMapper2 = ulong function(ulong funcId, void* clientData, BOOL* pbHookFunction);
alias COR_PRF_SNAPSHOT_INFO = int;
enum : int
{
    COR_PRF_SNAPSHOT_DEFAULT          = 0x00000000,
    COR_PRF_SNAPSHOT_REGISTER_CONTEXT = 0x00000001,
    COR_PRF_SNAPSHOT_X86_OPTIMIZED    = 0x00000002,
}

struct COR_PRF_FUNCTION_ARGUMENT_RANGE
{
    ulong startAddress;
    uint length;
}
struct COR_PRF_FUNCTION_ARGUMENT_INFO
{
    uint numRanges;
    uint totalArgumentSize;
    COR_PRF_FUNCTION_ARGUMENT_RANGE[1] ranges;
}
struct COR_PRF_CODE_INFO
{
    ulong startAddress;
    ulong size;
}
alias COR_PRF_STATIC_TYPE = int;
enum : int
{
    COR_PRF_FIELD_NOT_A_STATIC      = 0x00000000,
    COR_PRF_FIELD_APP_DOMAIN_STATIC = 0x00000001,
    COR_PRF_FIELD_THREAD_STATIC     = 0x00000002,
    COR_PRF_FIELD_CONTEXT_STATIC    = 0x00000004,
    COR_PRF_FIELD_RVA_STATIC        = 0x00000008,
}

struct COR_PRF_FUNCTION
{
    ulong functionId;
    ulong reJitId;
}
struct COR_PRF_ASSEMBLY_REFERENCE_INFO
{
    void* pbPublicKeyOrToken;
    uint cbPublicKeyOrToken;
    const(wchar)* szName;
    ASSEMBLYMETADATA* pMetaData;
    void* pbHashValue;
    uint cbHashValue;
    uint dwAssemblyRefFlags;
}
struct COR_PRF_METHOD
{
    ulong moduleId;
    uint methodId;
}
alias FunctionEnter = void function(ulong funcID);
alias FunctionLeave = void function(ulong funcID);
alias FunctionTailcall = void function(ulong funcID);
alias FunctionEnter2 = void function(ulong funcId, ulong clientData, ulong func, COR_PRF_FUNCTION_ARGUMENT_INFO* argumentInfo);
alias FunctionLeave2 = void function(ulong funcId, ulong clientData, ulong func, COR_PRF_FUNCTION_ARGUMENT_RANGE* retvalRange);
alias FunctionTailcall2 = void function(ulong funcId, ulong clientData, ulong func);
alias FunctionEnter3 = void function(FunctionIDOrClientID functionIDOrClientID);
alias FunctionLeave3 = void function(FunctionIDOrClientID functionIDOrClientID);
alias FunctionTailcall3 = void function(FunctionIDOrClientID functionIDOrClientID);
alias FunctionEnter3WithInfo = void function(FunctionIDOrClientID functionIDOrClientID, ulong eltInfo);
alias FunctionLeave3WithInfo = void function(FunctionIDOrClientID functionIDOrClientID, ulong eltInfo);
alias FunctionTailcall3WithInfo = void function(FunctionIDOrClientID functionIDOrClientID, ulong eltInfo);
alias StackSnapshotCallback = HRESULT function(ulong funcId, ulong ip, ulong frameInfo, uint contextSize, ubyte* context, void* clientData);
alias ObjectReferenceCallback = BOOL function(ulong root, ulong* reference, void* clientData);
alias COR_PRF_MONITOR = int;
enum : int
{
    COR_PRF_MONITOR_NONE                                 = 0x00000000,
    COR_PRF_MONITOR_FUNCTION_UNLOADS                     = 0x00000001,
    COR_PRF_MONITOR_CLASS_LOADS                          = 0x00000002,
    COR_PRF_MONITOR_MODULE_LOADS                         = 0x00000004,
    COR_PRF_MONITOR_ASSEMBLY_LOADS                       = 0x00000008,
    COR_PRF_MONITOR_APPDOMAIN_LOADS                      = 0x00000010,
    COR_PRF_MONITOR_JIT_COMPILATION                      = 0x00000020,
    COR_PRF_MONITOR_EXCEPTIONS                           = 0x00000040,
    COR_PRF_MONITOR_GC                                   = 0x00000080,
    COR_PRF_MONITOR_OBJECT_ALLOCATED                     = 0x00000100,
    COR_PRF_MONITOR_THREADS                              = 0x00000200,
    COR_PRF_MONITOR_REMOTING                             = 0x00000400,
    COR_PRF_MONITOR_CODE_TRANSITIONS                     = 0x00000800,
    COR_PRF_MONITOR_ENTERLEAVE                           = 0x00001000,
    COR_PRF_MONITOR_CCW                                  = 0x00002000,
    COR_PRF_MONITOR_REMOTING_COOKIE                      = 0x00004400,
    COR_PRF_MONITOR_REMOTING_ASYNC                       = 0x00008400,
    COR_PRF_MONITOR_SUSPENDS                             = 0x00010000,
    COR_PRF_MONITOR_CACHE_SEARCHES                       = 0x00020000,
    COR_PRF_ENABLE_REJIT                                 = 0x00040000,
    COR_PRF_ENABLE_INPROC_DEBUGGING                      = 0x00080000,
    COR_PRF_ENABLE_JIT_MAPS                              = 0x00100000,
    COR_PRF_DISABLE_INLINING                             = 0x00200000,
    COR_PRF_DISABLE_OPTIMIZATIONS                        = 0x00400000,
    COR_PRF_ENABLE_OBJECT_ALLOCATED                      = 0x00800000,
    COR_PRF_MONITOR_CLR_EXCEPTIONS                       = 0x01000000,
    COR_PRF_MONITOR_ALL                                  = 0x0107ffff,
    COR_PRF_ENABLE_FUNCTION_ARGS                         = 0x02000000,
    COR_PRF_ENABLE_FUNCTION_RETVAL                       = 0x04000000,
    COR_PRF_ENABLE_FRAME_INFO                            = 0x08000000,
    COR_PRF_ENABLE_STACK_SNAPSHOT                        = 0x10000000,
    COR_PRF_USE_PROFILE_IMAGES                           = 0x20000000,
    COR_PRF_DISABLE_TRANSPARENCY_CHECKS_UNDER_FULL_TRUST = 0x40000000,
    COR_PRF_DISABLE_ALL_NGEN_IMAGES                      = 0x80000000,
    COR_PRF_ALL                                          = 0x8fffffff,
    COR_PRF_REQUIRE_PROFILE_IMAGE                        = 0x20001800,
    COR_PRF_ALLOWABLE_AFTER_ATTACH                       = 0x100502fe,
    COR_PRF_ALLOWABLE_NOTIFICATION_PROFILER              = 0xb1e32b7f,
    COR_PRF_MONITOR_IMMUTABLE                            = 0xeef8cc00,
}

alias COR_PRF_HIGH_MONITOR = int;
enum : int
{
    COR_PRF_HIGH_MONITOR_NONE                     = 0x00000000,
    COR_PRF_HIGH_ADD_ASSEMBLY_REFERENCES          = 0x00000001,
    COR_PRF_HIGH_IN_MEMORY_SYMBOLS_UPDATED        = 0x00000002,
    COR_PRF_HIGH_MONITOR_DYNAMIC_FUNCTION_UNLOADS = 0x00000004,
    COR_PRF_HIGH_DISABLE_TIERED_COMPILATION       = 0x00000008,
    COR_PRF_HIGH_BASIC_GC                         = 0x00000010,
    COR_PRF_HIGH_MONITOR_GC_MOVED_OBJECTS         = 0x00000020,
    COR_PRF_HIGH_REQUIRE_PROFILE_IMAGE            = 0x00000000,
    COR_PRF_HIGH_MONITOR_LARGEOBJECT_ALLOCATED    = 0x00000040,
    COR_PRF_HIGH_MONITOR_EVENT_PIPE               = 0x00000080,
    COR_PRF_HIGH_MONITOR_PINNEDOBJECT_ALLOCATED   = 0x00000100,
    COR_PRF_HIGH_ALLOWABLE_AFTER_ATTACH           = 0x000000f6,
    COR_PRF_HIGH_ALLOWABLE_NOTIFICATION_PROFILER  = 0x000000fe,
    COR_PRF_HIGH_MONITOR_IMMUTABLE                = 0x00000008,
}

alias COR_PRF_MISC = int;
enum : int
{
    PROFILER_PARENT_UNKNOWN = 0xfffffffd,
    PROFILER_GLOBAL_CLASS   = 0xfffffffe,
    PROFILER_GLOBAL_MODULE  = 0xffffffff,
}

alias COR_PRF_JIT_CACHE = int;
enum : int
{
    COR_PRF_CACHED_FUNCTION_FOUND     = 0x00000000,
    COR_PRF_CACHED_FUNCTION_NOT_FOUND = 0x00000001,
}

alias COR_PRF_TRANSITION_REASON = int;
enum : int
{
    COR_PRF_TRANSITION_CALL   = 0x00000000,
    COR_PRF_TRANSITION_RETURN = 0x00000001,
}

alias COR_PRF_SUSPEND_REASON = int;
enum : int
{
    COR_PRF_SUSPEND_OTHER                  = 0x00000000,
    COR_PRF_SUSPEND_FOR_GC                 = 0x00000001,
    COR_PRF_SUSPEND_FOR_APPDOMAIN_SHUTDOWN = 0x00000002,
    COR_PRF_SUSPEND_FOR_CODE_PITCHING      = 0x00000003,
    COR_PRF_SUSPEND_FOR_SHUTDOWN           = 0x00000004,
    COR_PRF_SUSPEND_FOR_INPROC_DEBUGGER    = 0x00000006,
    COR_PRF_SUSPEND_FOR_GC_PREP            = 0x00000007,
    COR_PRF_SUSPEND_FOR_REJIT              = 0x00000008,
    COR_PRF_SUSPEND_FOR_PROFILER           = 0x00000009,
}

alias COR_PRF_RUNTIME_TYPE = int;
enum : int
{
    COR_PRF_DESKTOP_CLR = 0x00000001,
    COR_PRF_CORE_CLR    = 0x00000002,
}

alias COR_PRF_REJIT_FLAGS = int;
enum : int
{
    COR_PRF_REJIT_BLOCK_INLINING     = 0x00000001,
    COR_PRF_REJIT_INLINING_CALLBACKS = 0x00000002,
}

alias COR_PRF_EVENTPIPE_PARAM_TYPE = int;
enum : int
{
    COR_PRF_EVENTPIPE_OBJECT   = 0x00000001,
    COR_PRF_EVENTPIPE_BOOLEAN  = 0x00000003,
    COR_PRF_EVENTPIPE_CHAR     = 0x00000004,
    COR_PRF_EVENTPIPE_SBYTE    = 0x00000005,
    COR_PRF_EVENTPIPE_BYTE     = 0x00000006,
    COR_PRF_EVENTPIPE_INT16    = 0x00000007,
    COR_PRF_EVENTPIPE_UINT16   = 0x00000008,
    COR_PRF_EVENTPIPE_INT32    = 0x00000009,
    COR_PRF_EVENTPIPE_UINT32   = 0x0000000a,
    COR_PRF_EVENTPIPE_INT64    = 0x0000000b,
    COR_PRF_EVENTPIPE_UINT64   = 0x0000000c,
    COR_PRF_EVENTPIPE_SINGLE   = 0x0000000d,
    COR_PRF_EVENTPIPE_DOUBLE   = 0x0000000e,
    COR_PRF_EVENTPIPE_DECIMAL  = 0x0000000f,
    COR_PRF_EVENTPIPE_DATETIME = 0x00000010,
    COR_PRF_EVENTPIPE_GUID     = 0x00000011,
    COR_PRF_EVENTPIPE_STRING   = 0x00000012,
    COR_PRF_EVENTPIPE_ARRAY    = 0x00000013,
}

alias COR_PRF_EVENTPIPE_LEVEL = int;
enum : int
{
    COR_PRF_EVENTPIPE_LOGALWAYS     = 0x00000000,
    COR_PRF_EVENTPIPE_CRITICAL      = 0x00000001,
    COR_PRF_EVENTPIPE_ERROR         = 0x00000002,
    COR_PRF_EVENTPIPE_WARNING       = 0x00000003,
    COR_PRF_EVENTPIPE_INFORMATIONAL = 0x00000004,
    COR_PRF_EVENTPIPE_VERBOSE       = 0x00000005,
}

struct COR_PRF_EVENTPIPE_PROVIDER_CONFIG
{
    const(wchar)* providerName;
    ulong keywords;
    uint loggingLevel;
    const(wchar)* filterData;
}
struct COR_PRF_EVENTPIPE_PARAM_DESC
{
    uint type;
    uint elementType;
    const(wchar)* name;
}
struct COR_PRF_EVENT_DATA
{
    ulong ptr;
    uint size;
    uint reserved;
}
struct COR_PRF_FILTER_DATA
{
    ulong Ptr;
    uint Size;
    uint Type;
}
alias EventPipeProviderCallback = void function(const(ubyte)* source_id, uint is_enabled, ubyte level, ulong match_any_keywords, ulong match_all_keywords, COR_PRF_FILTER_DATA* filter_data, void* callback_data);
alias COR_PRF_HANDLE_TYPE = int;
enum : int
{
    COR_PRF_HANDLE_TYPE_WEAK   = 0x00000001,
    COR_PRF_HANDLE_TYPE_STRONG = 0x00000002,
    COR_PRF_HANDLE_TYPE_PINNED = 0x00000003,
}

enum IID_ICorProfilerCallback = GUID(0x176fbed1, 0xa55c, 0x4796, [0x98, 0xca, 0xa9, 0xda, 0xe, 0xf8, 0x83, 0xe7]);
interface ICorProfilerCallback : IUnknown
{
    HRESULT Initialize(IUnknown pICorProfilerInfoUnk);
    HRESULT Shutdown();
    HRESULT AppDomainCreationStarted(ulong appDomainId);
    HRESULT AppDomainCreationFinished(ulong appDomainId, HRESULT hrStatus);
    HRESULT AppDomainShutdownStarted(ulong appDomainId);
    HRESULT AppDomainShutdownFinished(ulong appDomainId, HRESULT hrStatus);
    HRESULT AssemblyLoadStarted(ulong assemblyId);
    HRESULT AssemblyLoadFinished(ulong assemblyId, HRESULT hrStatus);
    HRESULT AssemblyUnloadStarted(ulong assemblyId);
    HRESULT AssemblyUnloadFinished(ulong assemblyId, HRESULT hrStatus);
    HRESULT ModuleLoadStarted(ulong moduleId);
    HRESULT ModuleLoadFinished(ulong moduleId, HRESULT hrStatus);
    HRESULT ModuleUnloadStarted(ulong moduleId);
    HRESULT ModuleUnloadFinished(ulong moduleId, HRESULT hrStatus);
    HRESULT ModuleAttachedToAssembly(ulong moduleId, ulong AssemblyId);
    HRESULT ClassLoadStarted(ulong classId);
    HRESULT ClassLoadFinished(ulong classId, HRESULT hrStatus);
    HRESULT ClassUnloadStarted(ulong classId);
    HRESULT ClassUnloadFinished(ulong classId, HRESULT hrStatus);
    HRESULT FunctionUnloadStarted(ulong functionId);
    HRESULT JITCompilationStarted(ulong functionId, BOOL fIsSafeToBlock);
    HRESULT JITCompilationFinished(ulong functionId, HRESULT hrStatus, BOOL fIsSafeToBlock);
    HRESULT JITCachedFunctionSearchStarted(ulong functionId, BOOL* pbUseCachedFunction);
    HRESULT JITCachedFunctionSearchFinished(ulong functionId, COR_PRF_JIT_CACHE result);
    HRESULT JITFunctionPitched(ulong functionId);
    HRESULT JITInlining(ulong callerId, ulong calleeId, BOOL* pfShouldInline);
    HRESULT ThreadCreated(ulong threadId);
    HRESULT ThreadDestroyed(ulong threadId);
    HRESULT ThreadAssignedToOSThread(ulong managedThreadId, uint osThreadId);
    HRESULT RemotingClientInvocationStarted();
    HRESULT RemotingClientSendingMessage(GUID* pCookie, BOOL fIsAsync);
    HRESULT RemotingClientReceivingReply(GUID* pCookie, BOOL fIsAsync);
    HRESULT RemotingClientInvocationFinished();
    HRESULT RemotingServerReceivingMessage(GUID* pCookie, BOOL fIsAsync);
    HRESULT RemotingServerInvocationStarted();
    HRESULT RemotingServerInvocationReturned();
    HRESULT RemotingServerSendingReply(GUID* pCookie, BOOL fIsAsync);
    HRESULT UnmanagedToManagedTransition(ulong functionId, COR_PRF_TRANSITION_REASON reason);
    HRESULT ManagedToUnmanagedTransition(ulong functionId, COR_PRF_TRANSITION_REASON reason);
    HRESULT RuntimeSuspendStarted(COR_PRF_SUSPEND_REASON suspendReason);
    HRESULT RuntimeSuspendFinished();
    HRESULT RuntimeSuspendAborted();
    HRESULT RuntimeResumeStarted();
    HRESULT RuntimeResumeFinished();
    HRESULT RuntimeThreadSuspended(ulong threadId);
    HRESULT RuntimeThreadResumed(ulong threadId);
    HRESULT MovedReferences(uint cMovedObjectIDRanges, ulong* oldObjectIDRangeStart, ulong* newObjectIDRangeStart, uint* cObjectIDRangeLength);
    HRESULT ObjectAllocated(ulong objectId, ulong classId);
    HRESULT ObjectsAllocatedByClass(uint cClassCount, ulong* classIds, uint* cObjects);
    HRESULT ObjectReferences(ulong objectId, ulong classId, uint cObjectRefs, ulong* objectRefIds);
    HRESULT RootReferences(uint cRootRefs, ulong* rootRefIds);
    HRESULT ExceptionThrown(ulong thrownObjectId);
    HRESULT ExceptionSearchFunctionEnter(ulong functionId);
    HRESULT ExceptionSearchFunctionLeave();
    HRESULT ExceptionSearchFilterEnter(ulong functionId);
    HRESULT ExceptionSearchFilterLeave();
    HRESULT ExceptionSearchCatcherFound(ulong functionId);
    HRESULT ExceptionOSHandlerEnter(ulong __unused);
    HRESULT ExceptionOSHandlerLeave(ulong __unused);
    HRESULT ExceptionUnwindFunctionEnter(ulong functionId);
    HRESULT ExceptionUnwindFunctionLeave();
    HRESULT ExceptionUnwindFinallyEnter(ulong functionId);
    HRESULT ExceptionUnwindFinallyLeave();
    HRESULT ExceptionCatcherEnter(ulong functionId, ulong objectId);
    HRESULT ExceptionCatcherLeave();
    HRESULT COMClassicVTableCreated(ulong wrappedClassId, const(GUID)* implementedIID, void* pVTable, uint cSlots);
    HRESULT COMClassicVTableDestroyed(ulong wrappedClassId, const(GUID)* implementedIID, void* pVTable);
    HRESULT ExceptionCLRCatcherFound();
    HRESULT ExceptionCLRCatcherExecute();
}
alias COR_PRF_GC_ROOT_KIND = int;
enum : int
{
    COR_PRF_GC_ROOT_STACK     = 0x00000001,
    COR_PRF_GC_ROOT_FINALIZER = 0x00000002,
    COR_PRF_GC_ROOT_HANDLE    = 0x00000003,
    COR_PRF_GC_ROOT_OTHER     = 0x00000000,
}

alias COR_PRF_GC_ROOT_FLAGS = int;
enum : int
{
    COR_PRF_GC_ROOT_PINNING    = 0x00000001,
    COR_PRF_GC_ROOT_WEAKREF    = 0x00000002,
    COR_PRF_GC_ROOT_INTERIOR   = 0x00000004,
    COR_PRF_GC_ROOT_REFCOUNTED = 0x00000008,
}

alias COR_PRF_FINALIZER_FLAGS = int;
enum : int
{
    COR_PRF_FINALIZER_CRITICAL = 0x00000001,
}

alias COR_PRF_GC_GENERATION = int;
enum : int
{
    COR_PRF_GC_GEN_0              = 0x00000000,
    COR_PRF_GC_GEN_1              = 0x00000001,
    COR_PRF_GC_GEN_2              = 0x00000002,
    COR_PRF_GC_LARGE_OBJECT_HEAP  = 0x00000003,
    COR_PRF_GC_PINNED_OBJECT_HEAP = 0x00000004,
}

struct COR_PRF_GC_GENERATION_RANGE
{
    COR_PRF_GC_GENERATION generation;
    ulong rangeStart;
    ulong rangeLength;
    ulong rangeLengthReserved;
}
struct COR_PRF_NONGC_HEAP_RANGE
{
    ulong rangeStart;
    ulong rangeLength;
    ulong rangeLengthReserved;
}
alias COR_PRF_CLAUSE_TYPE = int;
enum : int
{
    COR_PRF_CLAUSE_NONE    = 0x00000000,
    COR_PRF_CLAUSE_FILTER  = 0x00000001,
    COR_PRF_CLAUSE_CATCH   = 0x00000002,
    COR_PRF_CLAUSE_FINALLY = 0x00000003,
}

struct COR_PRF_EX_CLAUSE_INFO
{
    COR_PRF_CLAUSE_TYPE clauseType;
    ulong programCounter;
    ulong framePointer;
    ulong shadowStackPointer;
}
alias COR_PRF_GC_REASON = int;
enum : int
{
    COR_PRF_GC_INDUCED = 0x00000001,
    COR_PRF_GC_OTHER   = 0x00000000,
}

alias COR_PRF_MODULE_FLAGS = int;
enum : int
{
    COR_PRF_MODULE_DISK            = 0x00000001,
    COR_PRF_MODULE_NGEN            = 0x00000002,
    COR_PRF_MODULE_DYNAMIC         = 0x00000004,
    COR_PRF_MODULE_COLLECTIBLE     = 0x00000008,
    COR_PRF_MODULE_RESOURCE        = 0x00000010,
    COR_PRF_MODULE_FLAT_LAYOUT     = 0x00000020,
    COR_PRF_MODULE_WINDOWS_RUNTIME = 0x00000040,
}

enum IID_ICorProfilerCallback2 = GUID(0x8a8cc829, 0xccf2, 0x49fe, [0xbb, 0xae, 0xf, 0x2, 0x22, 0x28, 0x7, 0x1a]);
interface ICorProfilerCallback2 : ICorProfilerCallback
{
    HRESULT ThreadNameChanged(ulong threadId, uint cchName, PWSTR name);
    HRESULT GarbageCollectionStarted(int cGenerations, BOOL* generationCollected, COR_PRF_GC_REASON reason);
    HRESULT SurvivingReferences(uint cSurvivingObjectIDRanges, ulong* objectIDRangeStart, uint* cObjectIDRangeLength);
    HRESULT GarbageCollectionFinished();
    HRESULT FinalizeableObjectQueued(uint finalizerFlags, ulong objectID);
    HRESULT RootReferences2(uint cRootRefs, ulong* rootRefIds, COR_PRF_GC_ROOT_KIND* rootKinds, COR_PRF_GC_ROOT_FLAGS* rootFlags, ulong* rootIds);
    HRESULT HandleCreated(ulong handleId, ulong initialObjectId);
    HRESULT HandleDestroyed(ulong handleId);
}
enum IID_ICorProfilerCallback3 = GUID(0x4fd2ed52, 0x7731, 0x4b8d, [0x94, 0x69, 0x3, 0xd2, 0xcc, 0x30, 0x86, 0xc5]);
interface ICorProfilerCallback3 : ICorProfilerCallback2
{
    HRESULT InitializeForAttach(IUnknown pCorProfilerInfoUnk, void* pvClientData, uint cbClientData);
    HRESULT ProfilerAttachComplete();
    HRESULT ProfilerDetachSucceeded();
}
enum IID_ICorProfilerCallback4 = GUID(0x7b63b2e3, 0x107d, 0x4d48, [0xb2, 0xf6, 0xf6, 0x1e, 0x22, 0x94, 0x70, 0xd2]);
interface ICorProfilerCallback4 : ICorProfilerCallback3
{
    HRESULT ReJITCompilationStarted(ulong functionId, ulong rejitId, BOOL fIsSafeToBlock);
    HRESULT GetReJITParameters(ulong moduleId, uint methodId, ICorProfilerFunctionControl pFunctionControl);
    HRESULT ReJITCompilationFinished(ulong functionId, ulong rejitId, HRESULT hrStatus, BOOL fIsSafeToBlock);
    HRESULT ReJITError(ulong moduleId, uint methodId, ulong functionId, HRESULT hrStatus);
    HRESULT MovedReferences2(uint cMovedObjectIDRanges, ulong* oldObjectIDRangeStart, ulong* newObjectIDRangeStart, ulong* cObjectIDRangeLength);
    HRESULT SurvivingReferences2(uint cSurvivingObjectIDRanges, ulong* objectIDRangeStart, ulong* cObjectIDRangeLength);
}
enum IID_ICorProfilerCallback5 = GUID(0x8dfba405, 0x8c9f, 0x45f8, [0xbf, 0xfa, 0x83, 0xb1, 0x4c, 0xef, 0x78, 0xb5]);
interface ICorProfilerCallback5 : ICorProfilerCallback4
{
    HRESULT ConditionalWeakTableElementReferences(uint cRootRefs, ulong* keyRefIds, ulong* valueRefIds, ulong* rootIds);
}
enum IID_ICorProfilerCallback6 = GUID(0xfc13df4b, 0x4448, 0x4f4f, [0x95, 0xc, 0xba, 0x8d, 0x19, 0xd0, 0xc, 0x36]);
interface ICorProfilerCallback6 : ICorProfilerCallback5
{
    HRESULT GetAssemblyReferences(const(wchar)* wszAssemblyPath, ICorProfilerAssemblyReferenceProvider pAsmRefProvider);
}
enum IID_ICorProfilerCallback7 = GUID(0xf76a2dba, 0x1d52, 0x4539, [0x86, 0x6c, 0x2a, 0xa5, 0x18, 0xf9, 0xef, 0xc3]);
interface ICorProfilerCallback7 : ICorProfilerCallback6
{
    HRESULT ModuleInMemorySymbolsUpdated(ulong moduleId);
}
enum IID_ICorProfilerCallback8 = GUID(0x5bed9b15, 0xc079, 0x4d47, [0xbf, 0xe2, 0x21, 0x5a, 0x14, 0xc, 0x7, 0xe0]);
interface ICorProfilerCallback8 : ICorProfilerCallback7
{
    HRESULT DynamicMethodJITCompilationStarted(ulong functionId, BOOL fIsSafeToBlock, ubyte* pILHeader, uint cbILHeader);
    HRESULT DynamicMethodJITCompilationFinished(ulong functionId, HRESULT hrStatus, BOOL fIsSafeToBlock);
}
enum IID_ICorProfilerCallback9 = GUID(0x27583ec3, 0xc8f5, 0x482f, [0x80, 0x52, 0x19, 0x4b, 0x8c, 0xe4, 0x70, 0x5a]);
interface ICorProfilerCallback9 : ICorProfilerCallback8
{
    HRESULT DynamicMethodUnloaded(ulong functionId);
}
enum IID_ICorProfilerCallback10 = GUID(0xcec5b60e, 0xc69c, 0x495f, [0x87, 0xf6, 0x84, 0xd2, 0x8e, 0xe1, 0x6f, 0xfb]);
interface ICorProfilerCallback10 : ICorProfilerCallback9
{
    HRESULT EventPipeEventDelivered(ulong provider, uint eventId, uint eventVersion, uint cbMetadataBlob, ubyte* metadataBlob, uint cbEventData, ubyte* eventData, const(GUID)* pActivityId, const(GUID)* pRelatedActivityId, ulong eventThread, uint numStackFrames, ulong* stackFrames);
    HRESULT EventPipeProviderCreated(ulong provider);
}
enum IID_ICorProfilerCallback11 = GUID(0x42350846, 0xaaed, 0x47f7, [0xb1, 0x28, 0xfd, 0xc, 0x98, 0x88, 0x1c, 0xde]);
interface ICorProfilerCallback11 : ICorProfilerCallback10
{
    HRESULT LoadAsNotificationOnly(BOOL* pbNotificationOnly);
}
alias COR_PRF_CODEGEN_FLAGS = int;
enum : int
{
    COR_PRF_CODEGEN_DISABLE_INLINING          = 0x00000001,
    COR_PRF_CODEGEN_DISABLE_ALL_OPTIMIZATIONS = 0x00000002,
}

enum IID_ICorProfilerInfo = GUID(0x28b5557d, 0x3f3f, 0x48b4, [0x90, 0xb2, 0x5f, 0x9e, 0xea, 0x2f, 0x6c, 0x48]);
interface ICorProfilerInfo : IUnknown
{
    HRESULT GetClassFromObject(ulong objectId, ulong* pClassId);
    HRESULT GetClassFromToken(ulong moduleId, uint typeDef, ulong* pClassId);
    HRESULT GetCodeInfo(ulong functionId, ubyte** pStart, uint* pcSize);
    HRESULT GetEventMask(uint* pdwEvents);
    HRESULT GetFunctionFromIP(ubyte* ip, ulong* pFunctionId);
    HRESULT GetFunctionFromToken(ulong moduleId, uint token, ulong* pFunctionId);
    HRESULT GetHandleFromThread(ulong threadId, HANDLE* phThread);
    HRESULT GetObjectSize(ulong objectId, uint* pcSize);
    HRESULT IsArrayClass(ulong classId, CorElementType* pBaseElemType, ulong* pBaseClassId, uint* pcRank);
    HRESULT GetThreadInfo(ulong threadId, uint* pdwWin32ThreadId);
    HRESULT GetCurrentThreadID(ulong* pThreadId);
    HRESULT GetClassIDInfo(ulong classId, ulong* pModuleId, uint* pTypeDefToken);
    HRESULT GetFunctionInfo(ulong functionId, ulong* pClassId, ulong* pModuleId, uint* pToken);
    HRESULT SetEventMask(uint dwEvents);
    HRESULT SetEnterLeaveFunctionHooks(FunctionEnter* pFuncEnter, FunctionLeave* pFuncLeave, FunctionTailcall* pFuncTailcall);
    HRESULT SetFunctionIDMapper(FunctionIDMapper* pFunc);
    HRESULT GetTokenAndMetaDataFromFunction(ulong functionId, const(GUID)* riid, IUnknown* ppImport, uint* pToken);
    HRESULT GetModuleInfo(ulong moduleId, ubyte** ppBaseLoadAddress, uint cchName, uint* pcchName, PWSTR szName, ulong* pAssemblyId);
    HRESULT GetModuleMetaData(ulong moduleId, uint dwOpenFlags, const(GUID)* riid, IUnknown* ppOut);
    HRESULT GetILFunctionBody(ulong moduleId, uint methodId, ubyte** ppMethodHeader, uint* pcbMethodSize);
    HRESULT GetILFunctionBodyAllocator(ulong moduleId, IMethodMalloc* ppMalloc);
    HRESULT SetILFunctionBody(ulong moduleId, uint methodid, ubyte* pbNewILMethodHeader);
    HRESULT GetAppDomainInfo(ulong appDomainId, uint cchName, uint* pcchName, PWSTR szName, ulong* pProcessId);
    HRESULT GetAssemblyInfo(ulong assemblyId, uint cchName, uint* pcchName, PWSTR szName, ulong* pAppDomainId, ulong* pModuleId);
    HRESULT SetFunctionReJIT(ulong functionId);
    HRESULT ForceGC();
    HRESULT SetILInstrumentedCodeMap(ulong functionId, BOOL fStartJit, uint cILMapEntries, COR_IL_MAP* rgILMapEntries);
    HRESULT GetInprocInspectionInterface(IUnknown* ppicd);
    HRESULT GetInprocInspectionIThisThread(IUnknown* ppicd);
    HRESULT GetThreadContext(ulong threadId, ulong* pContextId);
    HRESULT BeginInprocDebugging(BOOL fThisThreadOnly, uint* pdwProfilerContext);
    HRESULT EndInprocDebugging(uint dwProfilerContext);
    HRESULT GetILToNativeMapping(ulong functionId, uint cMap, uint* pcMap, COR_DEBUG_IL_TO_NATIVE_MAP* map);
}
enum IID_ICorProfilerInfo2 = GUID(0xcc0935cd, 0xa518, 0x487d, [0xb0, 0xbb, 0xa9, 0x32, 0x14, 0xe6, 0x54, 0x78]);
interface ICorProfilerInfo2 : ICorProfilerInfo
{
    HRESULT DoStackSnapshot(ulong thread, StackSnapshotCallback* callback, uint infoFlags, void* clientData, ubyte* context, uint contextSize);
    HRESULT SetEnterLeaveFunctionHooks2(FunctionEnter2* pFuncEnter, FunctionLeave2* pFuncLeave, FunctionTailcall2* pFuncTailcall);
    HRESULT GetFunctionInfo2(ulong funcId, ulong frameInfo, ulong* pClassId, ulong* pModuleId, uint* pToken, uint cTypeArgs, uint* pcTypeArgs, ulong* typeArgs);
    HRESULT GetStringLayout(uint* pBufferLengthOffset, uint* pStringLengthOffset, uint* pBufferOffset);
    HRESULT GetClassLayout(ulong classID, COR_FIELD_OFFSET* rFieldOffset, uint cFieldOffset, uint* pcFieldOffset, uint* pulClassSize);
    HRESULT GetClassIDInfo2(ulong classId, ulong* pModuleId, uint* pTypeDefToken, ulong* pParentClassId, uint cNumTypeArgs, uint* pcNumTypeArgs, ulong* typeArgs);
    HRESULT GetCodeInfo2(ulong functionID, uint cCodeInfos, uint* pcCodeInfos, COR_PRF_CODE_INFO* codeInfos);
    HRESULT GetClassFromTokenAndTypeArgs(ulong moduleID, uint typeDef, uint cTypeArgs, ulong* typeArgs, ulong* pClassID);
    HRESULT GetFunctionFromTokenAndTypeArgs(ulong moduleID, uint funcDef, ulong classId, uint cTypeArgs, ulong* typeArgs, ulong* pFunctionID);
    HRESULT EnumModuleFrozenObjects(ulong moduleID, ICorProfilerObjectEnum* ppEnum);
    HRESULT GetArrayObjectInfo(ulong objectId, uint cDimensions, uint* pDimensionSizes, int* pDimensionLowerBounds, ubyte** ppData);
    HRESULT GetBoxClassLayout(ulong classId, uint* pBufferOffset);
    HRESULT GetThreadAppDomain(ulong threadId, ulong* pAppDomainId);
    HRESULT GetRVAStaticAddress(ulong classId, uint fieldToken, void** ppAddress);
    HRESULT GetAppDomainStaticAddress(ulong classId, uint fieldToken, ulong appDomainId, void** ppAddress);
    HRESULT GetThreadStaticAddress(ulong classId, uint fieldToken, ulong threadId, void** ppAddress);
    HRESULT GetContextStaticAddress(ulong classId, uint fieldToken, ulong contextId, void** ppAddress);
    HRESULT GetStaticFieldInfo(ulong classId, uint fieldToken, COR_PRF_STATIC_TYPE* pFieldInfo);
    HRESULT GetGenerationBounds(uint cObjectRanges, uint* pcObjectRanges, COR_PRF_GC_GENERATION_RANGE* ranges);
    HRESULT GetObjectGeneration(ulong objectId, COR_PRF_GC_GENERATION_RANGE* range);
    HRESULT GetNotifiedExceptionClauseInfo(COR_PRF_EX_CLAUSE_INFO* pinfo);
}
enum IID_ICorProfilerInfo3 = GUID(0xb555ed4f, 0x452a, 0x4e54, [0x8b, 0x39, 0xb5, 0x36, 0xb, 0xad, 0x32, 0xa0]);
interface ICorProfilerInfo3 : ICorProfilerInfo2
{
    HRESULT EnumJITedFunctions(ICorProfilerFunctionEnum* ppEnum);
    HRESULT RequestProfilerDetach(uint dwExpectedCompletionMilliseconds);
    HRESULT SetFunctionIDMapper2(FunctionIDMapper2* pFunc, void* clientData);
    HRESULT GetStringLayout2(uint* pStringLengthOffset, uint* pBufferOffset);
    HRESULT SetEnterLeaveFunctionHooks3(FunctionEnter3* pFuncEnter3, FunctionLeave3* pFuncLeave3, FunctionTailcall3* pFuncTailcall3);
    HRESULT SetEnterLeaveFunctionHooks3WithInfo(FunctionEnter3WithInfo* pFuncEnter3WithInfo, FunctionLeave3WithInfo* pFuncLeave3WithInfo, FunctionTailcall3WithInfo* pFuncTailcall3WithInfo);
    HRESULT GetFunctionEnter3Info(ulong functionId, ulong eltInfo, ulong* pFrameInfo, uint* pcbArgumentInfo, COR_PRF_FUNCTION_ARGUMENT_INFO* pArgumentInfo);
    HRESULT GetFunctionLeave3Info(ulong functionId, ulong eltInfo, ulong* pFrameInfo, COR_PRF_FUNCTION_ARGUMENT_RANGE* pRetvalRange);
    HRESULT GetFunctionTailcall3Info(ulong functionId, ulong eltInfo, ulong* pFrameInfo);
    HRESULT EnumModules(ICorProfilerModuleEnum* ppEnum);
    HRESULT GetRuntimeInformation(ushort* pClrInstanceId, COR_PRF_RUNTIME_TYPE* pRuntimeType, ushort* pMajorVersion, ushort* pMinorVersion, ushort* pBuildNumber, ushort* pQFEVersion, uint cchVersionString, uint* pcchVersionString, PWSTR szVersionString);
    HRESULT GetThreadStaticAddress2(ulong classId, uint fieldToken, ulong appDomainId, ulong threadId, void** ppAddress);
    HRESULT GetAppDomainsContainingModule(ulong moduleId, uint cAppDomainIds, uint* pcAppDomainIds, ulong* appDomainIds);
    HRESULT GetModuleInfo2(ulong moduleId, ubyte** ppBaseLoadAddress, uint cchName, uint* pcchName, PWSTR szName, ulong* pAssemblyId, uint* pdwModuleFlags);
}
enum IID_ICorProfilerObjectEnum = GUID(0x2c6269bd, 0x2d13, 0x4321, [0xae, 0x12, 0x66, 0x86, 0x36, 0x5f, 0xd6, 0xaf]);
interface ICorProfilerObjectEnum : IUnknown
{
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerObjectEnum* ppEnum);
    HRESULT GetCount(uint* pcelt);
    HRESULT Next(uint celt, ulong* objects, uint* pceltFetched);
}
enum IID_ICorProfilerFunctionEnum = GUID(0xff71301a, 0xb994, 0x429d, [0xa1, 0xb, 0xb3, 0x45, 0xa6, 0x52, 0x80, 0xef]);
interface ICorProfilerFunctionEnum : IUnknown
{
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerFunctionEnum* ppEnum);
    HRESULT GetCount(uint* pcelt);
    HRESULT Next(uint celt, COR_PRF_FUNCTION* ids, uint* pceltFetched);
}
enum IID_ICorProfilerModuleEnum = GUID(0xb0266d75, 0x2081, 0x4493, [0xaf, 0x7f, 0x2, 0x8b, 0xa3, 0x4d, 0xb8, 0x91]);
interface ICorProfilerModuleEnum : IUnknown
{
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerModuleEnum* ppEnum);
    HRESULT GetCount(uint* pcelt);
    HRESULT Next(uint celt, ulong* ids, uint* pceltFetched);
}
enum IID_IMethodMalloc = GUID(0xa0efb28b, 0x6ee2, 0x4d7b, [0xb9, 0x83, 0xa7, 0x5e, 0xf7, 0xbe, 0xed, 0xb8]);
interface IMethodMalloc : IUnknown
{
    void* Alloc(uint cb);
}
enum IID_ICorProfilerFunctionControl = GUID(0xf0963021, 0xe1ea, 0x4732, [0x85, 0x81, 0xe0, 0x1b, 0xb, 0xd3, 0xc0, 0xc6]);
interface ICorProfilerFunctionControl : IUnknown
{
    HRESULT SetCodegenFlags(uint flags);
    HRESULT SetILFunctionBody(uint cbNewILMethodHeader, ubyte* pbNewILMethodHeader);
    HRESULT SetILInstrumentedCodeMap(uint cILMapEntries, COR_IL_MAP* rgILMapEntries);
}
enum IID_ICorProfilerInfo4 = GUID(0xd8fdcaa, 0x6257, 0x47bf, [0xb1, 0xbf, 0x94, 0xda, 0xc8, 0x84, 0x66, 0xee]);
interface ICorProfilerInfo4 : ICorProfilerInfo3
{
    HRESULT EnumThreads(ICorProfilerThreadEnum* ppEnum);
    HRESULT InitializeCurrentThread();
    HRESULT RequestReJIT(uint cFunctions, ulong* moduleIds, uint* methodIds);
    HRESULT RequestRevert(uint cFunctions, ulong* moduleIds, uint* methodIds, HRESULT* status);
    HRESULT GetCodeInfo3(ulong functionID, ulong reJitId, uint cCodeInfos, uint* pcCodeInfos, COR_PRF_CODE_INFO* codeInfos);
    HRESULT GetFunctionFromIP2(ubyte* ip, ulong* pFunctionId, ulong* pReJitId);
    HRESULT GetReJITIDs(ulong functionId, uint cReJitIds, uint* pcReJitIds, ulong* reJitIds);
    HRESULT GetILToNativeMapping2(ulong functionId, ulong reJitId, uint cMap, uint* pcMap, COR_DEBUG_IL_TO_NATIVE_MAP* map);
    HRESULT EnumJITedFunctions2(ICorProfilerFunctionEnum* ppEnum);
    HRESULT GetObjectSize2(ulong objectId, ulong* pcSize);
}
enum IID_ICorProfilerInfo5 = GUID(0x7602928, 0xce38, 0x4b83, [0x81, 0xe7, 0x74, 0xad, 0xaf, 0x78, 0x12, 0x14]);
interface ICorProfilerInfo5 : ICorProfilerInfo4
{
    HRESULT GetEventMask2(uint* pdwEventsLow, uint* pdwEventsHigh);
    HRESULT SetEventMask2(uint dwEventsLow, uint dwEventsHigh);
}
enum IID_ICorProfilerInfo6 = GUID(0xf30a070d, 0xbffb, 0x46a7, [0xb1, 0xd8, 0x87, 0x81, 0xef, 0x7b, 0x69, 0x8a]);
interface ICorProfilerInfo6 : ICorProfilerInfo5
{
    HRESULT EnumNgenModuleMethodsInliningThisMethod(ulong inlinersModuleId, ulong inlineeModuleId, uint inlineeMethodId, BOOL* incompleteData, ICorProfilerMethodEnum* ppEnum);
}
enum IID_ICorProfilerInfo7 = GUID(0x9aeecc0d, 0x63e0, 0x4187, [0x8c, 0x0, 0xe3, 0x12, 0xf5, 0x3, 0xf6, 0x63]);
interface ICorProfilerInfo7 : ICorProfilerInfo6
{
    HRESULT ApplyMetaData(ulong moduleId);
    HRESULT GetInMemorySymbolsLength(ulong moduleId, uint* pCountSymbolBytes);
    HRESULT ReadInMemorySymbols(ulong moduleId, uint symbolsReadOffset, ubyte* pSymbolBytes, uint countSymbolBytes, uint* pCountSymbolBytesRead);
}
enum IID_ICorProfilerInfo8 = GUID(0xc5ac80a6, 0x782e, 0x4716, [0x80, 0x44, 0x39, 0x59, 0x8c, 0x60, 0xcf, 0xbf]);
interface ICorProfilerInfo8 : ICorProfilerInfo7
{
    HRESULT IsFunctionDynamic(ulong functionId, BOOL* isDynamic);
    HRESULT GetFunctionFromIP3(ubyte* ip, ulong* functionId, ulong* pReJitId);
    HRESULT GetDynamicFunctionInfo(ulong functionId, ulong* moduleId, ubyte** ppvSig, uint* pbSig, uint cchName, uint* pcchName, PWSTR wszName);
}
enum IID_ICorProfilerInfo9 = GUID(0x8170db, 0xf8cc, 0x4796, [0x9a, 0x51, 0xdc, 0x8a, 0xa0, 0xb4, 0x70, 0x12]);
interface ICorProfilerInfo9 : ICorProfilerInfo8
{
    HRESULT GetNativeCodeStartAddresses(ulong functionID, ulong reJitId, uint cCodeStartAddresses, uint* pcCodeStartAddresses, ulong* codeStartAddresses);
    HRESULT GetILToNativeMapping3(ulong pNativeCodeStartAddress, uint cMap, uint* pcMap, COR_DEBUG_IL_TO_NATIVE_MAP* map);
    HRESULT GetCodeInfo4(ulong pNativeCodeStartAddress, uint cCodeInfos, uint* pcCodeInfos, COR_PRF_CODE_INFO* codeInfos);
}
enum IID_ICorProfilerInfo10 = GUID(0x2f1b5152, 0xc869, 0x40c9, [0xaa, 0x5f, 0x3a, 0xbe, 0x2, 0x6b, 0xd7, 0x20]);
interface ICorProfilerInfo10 : ICorProfilerInfo9
{
    HRESULT EnumerateObjectReferences(ulong objectId, ObjectReferenceCallback callback, void* clientData);
    HRESULT IsFrozenObject(ulong objectId, BOOL* pbFrozen);
    HRESULT GetLOHObjectSizeThreshold(uint* pThreshold);
    HRESULT RequestReJITWithInliners(uint dwRejitFlags, uint cFunctions, ulong* moduleIds, uint* methodIds);
    HRESULT SuspendRuntime();
    HRESULT ResumeRuntime();
}
enum IID_ICorProfilerInfo11 = GUID(0x6398876, 0x8987, 0x4154, [0xb6, 0x21, 0x40, 0xa0, 0xd, 0x6e, 0x4d, 0x4]);
interface ICorProfilerInfo11 : ICorProfilerInfo10
{
    HRESULT GetEnvironmentVariableA(const(wchar)* szName, uint cchValue, uint* pcchValue, PWSTR szValue);
    HRESULT SetEnvironmentVariable(const(wchar)* szName, const(wchar)* szValue);
}
enum IID_ICorProfilerInfo12 = GUID(0x27b24ccd, 0x1cb1, 0x47c5, [0x96, 0xee, 0x98, 0x19, 0xd, 0xc3, 0x9, 0x59]);
interface ICorProfilerInfo12 : ICorProfilerInfo11
{
    HRESULT EventPipeStartSession(uint cProviderConfigs, COR_PRF_EVENTPIPE_PROVIDER_CONFIG* pProviderConfigs, BOOL requestRundown, ulong* pSession);
    HRESULT EventPipeAddProviderToSession(ulong session, COR_PRF_EVENTPIPE_PROVIDER_CONFIG providerConfig);
    HRESULT EventPipeStopSession(ulong session);
    HRESULT EventPipeCreateProvider(const(wchar)* providerName, ulong* pProvider);
    HRESULT EventPipeGetProviderInfo(ulong provider, uint cchName, uint* pcchName, PWSTR providerName);
    HRESULT EventPipeDefineEvent(ulong provider, const(wchar)* eventName, uint eventID, ulong keywords, uint eventVersion, uint level, ubyte opcode, BOOL needStack, uint cParamDescs, COR_PRF_EVENTPIPE_PARAM_DESC* pParamDescs, ulong* pEvent);
    HRESULT EventPipeWriteEvent(ulong event, uint cData, COR_PRF_EVENT_DATA* data, const(GUID)* pActivityId, const(GUID)* pRelatedActivityId);
}
enum IID_ICorProfilerInfo13 = GUID(0x6e6c7ee2, 0x701, 0x4ec2, [0x9d, 0x29, 0x2e, 0x87, 0x33, 0xb6, 0x69, 0x34]);
interface ICorProfilerInfo13 : ICorProfilerInfo12
{
    HRESULT CreateHandle(ulong object, COR_PRF_HANDLE_TYPE type, void*** pHandle);
    HRESULT DestroyHandle(void** handle);
    HRESULT GetObjectIDFromHandle(void** handle, ulong* pObject);
}
enum IID_ICorProfilerInfo14 = GUID(0xf460e352, 0xd76d, 0x4fe9, [0x83, 0x5f, 0xf6, 0xaf, 0x9d, 0x6e, 0x86, 0x2d]);
interface ICorProfilerInfo14 : ICorProfilerInfo13
{
    HRESULT EnumerateNonGCObjects(ICorProfilerObjectEnum* ppEnum);
    HRESULT GetNonGCHeapBounds(uint cObjectRanges, uint* pcObjectRanges, COR_PRF_NONGC_HEAP_RANGE* ranges);
    HRESULT EventPipeCreateProvider2(const(wchar)* providerName, EventPipeProviderCallback* pCallback, ulong* pProvider);
}
enum IID_ICorProfilerMethodEnum = GUID(0xfccee788, 0x88, 0x454b, [0xa8, 0x11, 0xc9, 0x9f, 0x29, 0x8d, 0x19, 0x42]);
interface ICorProfilerMethodEnum : IUnknown
{
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerMethodEnum* ppEnum);
    HRESULT GetCount(uint* pcelt);
    HRESULT Next(uint celt, COR_PRF_METHOD* elements, uint* pceltFetched);
}
enum IID_ICorProfilerThreadEnum = GUID(0x571194f7, 0x25ed, 0x419f, [0xaa, 0x8b, 0x70, 0x16, 0xb3, 0x15, 0x97, 0x1]);
interface ICorProfilerThreadEnum : IUnknown
{
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerThreadEnum* ppEnum);
    HRESULT GetCount(uint* pcelt);
    HRESULT Next(uint celt, ulong* ids, uint* pceltFetched);
}
enum IID_ICorProfilerAssemblyReferenceProvider = GUID(0x66a78c24, 0x2eef, 0x4f65, [0xb4, 0x5f, 0xdd, 0x1d, 0x80, 0x38, 0xbf, 0x3c]);
interface ICorProfilerAssemblyReferenceProvider : IUnknown
{
    HRESULT AddAssemblyReference(const(COR_PRF_ASSEMBLY_REFERENCE_INFO)* pAssemblyRefInfo);
}
