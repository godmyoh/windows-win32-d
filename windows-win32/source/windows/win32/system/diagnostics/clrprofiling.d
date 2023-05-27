module windows.win32.system.diagnostics.clrprofiling;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt.metadata : ASSEMBLYMETADATA, COR_FIELD_OFFSET, CorElementType;

version (Windows):
extern (Windows):

enum CorDB_CONTROL_Profiling = "Cor_Enable_Profiling";
enum CorDB_CONTROL_ProfilingL = "Cor_Enable_Profiling";
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
alias FunctionIDMapper = ulong function(ulong, BOOL*);
alias FunctionIDMapper2 = ulong function(ulong, void*, BOOL*);
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
alias FunctionEnter = void function(ulong);
alias FunctionLeave = void function(ulong);
alias FunctionTailcall = void function(ulong);
alias FunctionEnter2 = void function(ulong, ulong, ulong, COR_PRF_FUNCTION_ARGUMENT_INFO*);
alias FunctionLeave2 = void function(ulong, ulong, ulong, COR_PRF_FUNCTION_ARGUMENT_RANGE*);
alias FunctionTailcall2 = void function(ulong, ulong, ulong);
alias FunctionEnter3 = void function(FunctionIDOrClientID);
alias FunctionLeave3 = void function(FunctionIDOrClientID);
alias FunctionTailcall3 = void function(FunctionIDOrClientID);
alias FunctionEnter3WithInfo = void function(FunctionIDOrClientID, ulong);
alias FunctionLeave3WithInfo = void function(FunctionIDOrClientID, ulong);
alias FunctionTailcall3WithInfo = void function(FunctionIDOrClientID, ulong);
alias StackSnapshotCallback = HRESULT function(ulong, ulong, ulong, uint, ubyte*, void*);
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
    COR_PRF_ALLOWABLE_AFTER_ATTACH                       = 0x100102fe,
    COR_PRF_MONITOR_IMMUTABLE                            = 0xeefccc00,
}

alias COR_PRF_HIGH_MONITOR = int;
enum : int
{
    COR_PRF_HIGH_MONITOR_NONE                     = 0x00000000,
    COR_PRF_HIGH_ADD_ASSEMBLY_REFERENCES          = 0x00000001,
    COR_PRF_HIGH_IN_MEMORY_SYMBOLS_UPDATED        = 0x00000002,
    COR_PRF_HIGH_MONITOR_DYNAMIC_FUNCTION_UNLOADS = 0x00000004,
    COR_PRF_HIGH_REQUIRE_PROFILE_IMAGE            = 0x00000000,
    COR_PRF_HIGH_ALLOWABLE_AFTER_ATTACH           = 0x00000006,
    COR_PRF_HIGH_MONITOR_IMMUTABLE                = 0x00000000,
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
}

alias COR_PRF_RUNTIME_TYPE = int;
enum : int
{
    COR_PRF_DESKTOP_CLR = 0x00000001,
    COR_PRF_CORE_CLR    = 0x00000002,
}

enum IID_ICorProfilerCallback = GUID(0x176fbed1, 0xa55c, 0x4796, [0x98, 0xca, 0xa9, 0xda, 0xe, 0xf8, 0x83, 0xe7]);
interface ICorProfilerCallback : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT Shutdown();
    HRESULT AppDomainCreationStarted(ulong);
    HRESULT AppDomainCreationFinished(ulong, HRESULT);
    HRESULT AppDomainShutdownStarted(ulong);
    HRESULT AppDomainShutdownFinished(ulong, HRESULT);
    HRESULT AssemblyLoadStarted(ulong);
    HRESULT AssemblyLoadFinished(ulong, HRESULT);
    HRESULT AssemblyUnloadStarted(ulong);
    HRESULT AssemblyUnloadFinished(ulong, HRESULT);
    HRESULT ModuleLoadStarted(ulong);
    HRESULT ModuleLoadFinished(ulong, HRESULT);
    HRESULT ModuleUnloadStarted(ulong);
    HRESULT ModuleUnloadFinished(ulong, HRESULT);
    HRESULT ModuleAttachedToAssembly(ulong, ulong);
    HRESULT ClassLoadStarted(ulong);
    HRESULT ClassLoadFinished(ulong, HRESULT);
    HRESULT ClassUnloadStarted(ulong);
    HRESULT ClassUnloadFinished(ulong, HRESULT);
    HRESULT FunctionUnloadStarted(ulong);
    HRESULT JITCompilationStarted(ulong, BOOL);
    HRESULT JITCompilationFinished(ulong, HRESULT, BOOL);
    HRESULT JITCachedFunctionSearchStarted(ulong, BOOL*);
    HRESULT JITCachedFunctionSearchFinished(ulong, COR_PRF_JIT_CACHE);
    HRESULT JITFunctionPitched(ulong);
    HRESULT JITInlining(ulong, ulong, BOOL*);
    HRESULT ThreadCreated(ulong);
    HRESULT ThreadDestroyed(ulong);
    HRESULT ThreadAssignedToOSThread(ulong, uint);
    HRESULT RemotingClientInvocationStarted();
    HRESULT RemotingClientSendingMessage(GUID*, BOOL);
    HRESULT RemotingClientReceivingReply(GUID*, BOOL);
    HRESULT RemotingClientInvocationFinished();
    HRESULT RemotingServerReceivingMessage(GUID*, BOOL);
    HRESULT RemotingServerInvocationStarted();
    HRESULT RemotingServerInvocationReturned();
    HRESULT RemotingServerSendingReply(GUID*, BOOL);
    HRESULT UnmanagedToManagedTransition(ulong, COR_PRF_TRANSITION_REASON);
    HRESULT ManagedToUnmanagedTransition(ulong, COR_PRF_TRANSITION_REASON);
    HRESULT RuntimeSuspendStarted(COR_PRF_SUSPEND_REASON);
    HRESULT RuntimeSuspendFinished();
    HRESULT RuntimeSuspendAborted();
    HRESULT RuntimeResumeStarted();
    HRESULT RuntimeResumeFinished();
    HRESULT RuntimeThreadSuspended(ulong);
    HRESULT RuntimeThreadResumed(ulong);
    HRESULT MovedReferences(uint, ulong*, ulong*, uint*);
    HRESULT ObjectAllocated(ulong, ulong);
    HRESULT ObjectsAllocatedByClass(uint, ulong*, uint*);
    HRESULT ObjectReferences(ulong, ulong, uint, ulong*);
    HRESULT RootReferences(uint, ulong*);
    HRESULT ExceptionThrown(ulong);
    HRESULT ExceptionSearchFunctionEnter(ulong);
    HRESULT ExceptionSearchFunctionLeave();
    HRESULT ExceptionSearchFilterEnter(ulong);
    HRESULT ExceptionSearchFilterLeave();
    HRESULT ExceptionSearchCatcherFound(ulong);
    HRESULT ExceptionOSHandlerEnter(ulong);
    HRESULT ExceptionOSHandlerLeave(ulong);
    HRESULT ExceptionUnwindFunctionEnter(ulong);
    HRESULT ExceptionUnwindFunctionLeave();
    HRESULT ExceptionUnwindFinallyEnter(ulong);
    HRESULT ExceptionUnwindFinallyLeave();
    HRESULT ExceptionCatcherEnter(ulong, ulong);
    HRESULT ExceptionCatcherLeave();
    HRESULT COMClassicVTableCreated(ulong, const(GUID)*, void*, uint);
    HRESULT COMClassicVTableDestroyed(ulong, const(GUID)*, void*);
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
    COR_PRF_GC_GEN_0             = 0x00000000,
    COR_PRF_GC_GEN_1             = 0x00000001,
    COR_PRF_GC_GEN_2             = 0x00000002,
    COR_PRF_GC_LARGE_OBJECT_HEAP = 0x00000003,
}

struct COR_PRF_GC_GENERATION_RANGE
{
    COR_PRF_GC_GENERATION generation;
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
    HRESULT ThreadNameChanged(ulong, uint, PWSTR);
    HRESULT GarbageCollectionStarted(int, BOOL*, COR_PRF_GC_REASON);
    HRESULT SurvivingReferences(uint, ulong*, uint*);
    HRESULT GarbageCollectionFinished();
    HRESULT FinalizeableObjectQueued(uint, ulong);
    HRESULT RootReferences2(uint, ulong*, COR_PRF_GC_ROOT_KIND*, COR_PRF_GC_ROOT_FLAGS*, ulong*);
    HRESULT HandleCreated(ulong, ulong);
    HRESULT HandleDestroyed(ulong);
}
enum IID_ICorProfilerCallback3 = GUID(0x4fd2ed52, 0x7731, 0x4b8d, [0x94, 0x69, 0x3, 0xd2, 0xcc, 0x30, 0x86, 0xc5]);
interface ICorProfilerCallback3 : ICorProfilerCallback2
{
    HRESULT InitializeForAttach(IUnknown, void*, uint);
    HRESULT ProfilerAttachComplete();
    HRESULT ProfilerDetachSucceeded();
}
enum IID_ICorProfilerCallback4 = GUID(0x7b63b2e3, 0x107d, 0x4d48, [0xb2, 0xf6, 0xf6, 0x1e, 0x22, 0x94, 0x70, 0xd2]);
interface ICorProfilerCallback4 : ICorProfilerCallback3
{
    HRESULT ReJITCompilationStarted(ulong, ulong, BOOL);
    HRESULT GetReJITParameters(ulong, uint, ICorProfilerFunctionControl);
    HRESULT ReJITCompilationFinished(ulong, ulong, HRESULT, BOOL);
    HRESULT ReJITError(ulong, uint, ulong, HRESULT);
    HRESULT MovedReferences2(uint, ulong*, ulong*, ulong*);
    HRESULT SurvivingReferences2(uint, ulong*, ulong*);
}
enum IID_ICorProfilerCallback5 = GUID(0x8dfba405, 0x8c9f, 0x45f8, [0xbf, 0xfa, 0x83, 0xb1, 0x4c, 0xef, 0x78, 0xb5]);
interface ICorProfilerCallback5 : ICorProfilerCallback4
{
    HRESULT ConditionalWeakTableElementReferences(uint, ulong*, ulong*, ulong*);
}
enum IID_ICorProfilerCallback6 = GUID(0xfc13df4b, 0x4448, 0x4f4f, [0x95, 0xc, 0xba, 0x8d, 0x19, 0xd0, 0xc, 0x36]);
interface ICorProfilerCallback6 : ICorProfilerCallback5
{
    HRESULT GetAssemblyReferences(const(wchar)*, ICorProfilerAssemblyReferenceProvider);
}
enum IID_ICorProfilerCallback7 = GUID(0xf76a2dba, 0x1d52, 0x4539, [0x86, 0x6c, 0x2a, 0xa5, 0x18, 0xf9, 0xef, 0xc3]);
interface ICorProfilerCallback7 : ICorProfilerCallback6
{
    HRESULT ModuleInMemorySymbolsUpdated(ulong);
}
enum IID_ICorProfilerCallback8 = GUID(0x5bed9b15, 0xc079, 0x4d47, [0xbf, 0xe2, 0x21, 0x5a, 0x14, 0xc, 0x7, 0xe0]);
interface ICorProfilerCallback8 : ICorProfilerCallback7
{
    HRESULT DynamicMethodJITCompilationStarted(ulong, BOOL, ubyte*, uint);
    HRESULT DynamicMethodJITCompilationFinished(ulong, HRESULT, BOOL);
}
enum IID_ICorProfilerCallback9 = GUID(0x27583ec3, 0xc8f5, 0x482f, [0x80, 0x52, 0x19, 0x4b, 0x8c, 0xe4, 0x70, 0x5a]);
interface ICorProfilerCallback9 : ICorProfilerCallback8
{
    HRESULT DynamicMethodUnloaded(ulong);
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
    HRESULT GetClassFromObject(ulong, ulong*);
    HRESULT GetClassFromToken(ulong, uint, ulong*);
    HRESULT GetCodeInfo(ulong, ubyte**, uint*);
    HRESULT GetEventMask(uint*);
    HRESULT GetFunctionFromIP(ubyte*, ulong*);
    HRESULT GetFunctionFromToken(ulong, uint, ulong*);
    HRESULT GetHandleFromThread(ulong, HANDLE*);
    HRESULT GetObjectSize(ulong, uint*);
    HRESULT IsArrayClass(ulong, CorElementType*, ulong*, uint*);
    HRESULT GetThreadInfo(ulong, uint*);
    HRESULT GetCurrentThreadID(ulong*);
    HRESULT GetClassIDInfo(ulong, ulong*, uint*);
    HRESULT GetFunctionInfo(ulong, ulong*, ulong*, uint*);
    HRESULT SetEventMask(uint);
    HRESULT SetEnterLeaveFunctionHooks(FunctionEnter*, FunctionLeave*, FunctionTailcall*);
    HRESULT SetFunctionIDMapper(FunctionIDMapper*);
    HRESULT GetTokenAndMetaDataFromFunction(ulong, const(GUID)*, IUnknown*, uint*);
    HRESULT GetModuleInfo(ulong, ubyte**, uint, uint*, PWSTR, ulong*);
    HRESULT GetModuleMetaData(ulong, uint, const(GUID)*, IUnknown*);
    HRESULT GetILFunctionBody(ulong, uint, ubyte**, uint*);
    HRESULT GetILFunctionBodyAllocator(ulong, IMethodMalloc*);
    HRESULT SetILFunctionBody(ulong, uint, ubyte*);
    HRESULT GetAppDomainInfo(ulong, uint, uint*, PWSTR, ulong*);
    HRESULT GetAssemblyInfo(ulong, uint, uint*, PWSTR, ulong*, ulong*);
    HRESULT SetFunctionReJIT(ulong);
    HRESULT ForceGC();
    HRESULT SetILInstrumentedCodeMap(ulong, BOOL, uint, COR_IL_MAP*);
    HRESULT GetInprocInspectionInterface(IUnknown*);
    HRESULT GetInprocInspectionIThisThread(IUnknown*);
    HRESULT GetThreadContext(ulong, ulong*);
    HRESULT BeginInprocDebugging(BOOL, uint*);
    HRESULT EndInprocDebugging(uint);
    HRESULT GetILToNativeMapping(ulong, uint, uint*, COR_DEBUG_IL_TO_NATIVE_MAP*);
}
enum IID_ICorProfilerInfo2 = GUID(0xcc0935cd, 0xa518, 0x487d, [0xb0, 0xbb, 0xa9, 0x32, 0x14, 0xe6, 0x54, 0x78]);
interface ICorProfilerInfo2 : ICorProfilerInfo
{
    HRESULT DoStackSnapshot(ulong, StackSnapshotCallback*, uint, void*, ubyte*, uint);
    HRESULT SetEnterLeaveFunctionHooks2(FunctionEnter2*, FunctionLeave2*, FunctionTailcall2*);
    HRESULT GetFunctionInfo2(ulong, ulong, ulong*, ulong*, uint*, uint, uint*, ulong*);
    HRESULT GetStringLayout(uint*, uint*, uint*);
    HRESULT GetClassLayout(ulong, COR_FIELD_OFFSET*, uint, uint*, uint*);
    HRESULT GetClassIDInfo2(ulong, ulong*, uint*, ulong*, uint, uint*, ulong*);
    HRESULT GetCodeInfo2(ulong, uint, uint*, COR_PRF_CODE_INFO*);
    HRESULT GetClassFromTokenAndTypeArgs(ulong, uint, uint, ulong*, ulong*);
    HRESULT GetFunctionFromTokenAndTypeArgs(ulong, uint, ulong, uint, ulong*, ulong*);
    HRESULT EnumModuleFrozenObjects(ulong, ICorProfilerObjectEnum*);
    HRESULT GetArrayObjectInfo(ulong, uint, uint*, int*, ubyte**);
    HRESULT GetBoxClassLayout(ulong, uint*);
    HRESULT GetThreadAppDomain(ulong, ulong*);
    HRESULT GetRVAStaticAddress(ulong, uint, void**);
    HRESULT GetAppDomainStaticAddress(ulong, uint, ulong, void**);
    HRESULT GetThreadStaticAddress(ulong, uint, ulong, void**);
    HRESULT GetContextStaticAddress(ulong, uint, ulong, void**);
    HRESULT GetStaticFieldInfo(ulong, uint, COR_PRF_STATIC_TYPE*);
    HRESULT GetGenerationBounds(uint, uint*, COR_PRF_GC_GENERATION_RANGE*);
    HRESULT GetObjectGeneration(ulong, COR_PRF_GC_GENERATION_RANGE*);
    HRESULT GetNotifiedExceptionClauseInfo(COR_PRF_EX_CLAUSE_INFO*);
}
enum IID_ICorProfilerInfo3 = GUID(0xb555ed4f, 0x452a, 0x4e54, [0x8b, 0x39, 0xb5, 0x36, 0xb, 0xad, 0x32, 0xa0]);
interface ICorProfilerInfo3 : ICorProfilerInfo2
{
    HRESULT EnumJITedFunctions(ICorProfilerFunctionEnum*);
    HRESULT RequestProfilerDetach(uint);
    HRESULT SetFunctionIDMapper2(FunctionIDMapper2*, void*);
    HRESULT GetStringLayout2(uint*, uint*);
    HRESULT SetEnterLeaveFunctionHooks3(FunctionEnter3*, FunctionLeave3*, FunctionTailcall3*);
    HRESULT SetEnterLeaveFunctionHooks3WithInfo(FunctionEnter3WithInfo*, FunctionLeave3WithInfo*, FunctionTailcall3WithInfo*);
    HRESULT GetFunctionEnter3Info(ulong, ulong, ulong*, uint*, COR_PRF_FUNCTION_ARGUMENT_INFO*);
    HRESULT GetFunctionLeave3Info(ulong, ulong, ulong*, COR_PRF_FUNCTION_ARGUMENT_RANGE*);
    HRESULT GetFunctionTailcall3Info(ulong, ulong, ulong*);
    HRESULT EnumModules(ICorProfilerModuleEnum*);
    HRESULT GetRuntimeInformation(ushort*, COR_PRF_RUNTIME_TYPE*, ushort*, ushort*, ushort*, ushort*, uint, uint*, PWSTR);
    HRESULT GetThreadStaticAddress2(ulong, uint, ulong, ulong, void**);
    HRESULT GetAppDomainsContainingModule(ulong, uint, uint*, ulong*);
    HRESULT GetModuleInfo2(ulong, ubyte**, uint, uint*, PWSTR, ulong*, uint*);
}
enum IID_ICorProfilerObjectEnum = GUID(0x2c6269bd, 0x2d13, 0x4321, [0xae, 0x12, 0x66, 0x86, 0x36, 0x5f, 0xd6, 0xaf]);
interface ICorProfilerObjectEnum : IUnknown
{
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerObjectEnum*);
    HRESULT GetCount(uint*);
    HRESULT Next(uint, ulong*, uint*);
}
enum IID_ICorProfilerFunctionEnum = GUID(0xff71301a, 0xb994, 0x429d, [0xa1, 0xb, 0xb3, 0x45, 0xa6, 0x52, 0x80, 0xef]);
interface ICorProfilerFunctionEnum : IUnknown
{
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerFunctionEnum*);
    HRESULT GetCount(uint*);
    HRESULT Next(uint, COR_PRF_FUNCTION*, uint*);
}
enum IID_ICorProfilerModuleEnum = GUID(0xb0266d75, 0x2081, 0x4493, [0xaf, 0x7f, 0x2, 0x8b, 0xa3, 0x4d, 0xb8, 0x91]);
interface ICorProfilerModuleEnum : IUnknown
{
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerModuleEnum*);
    HRESULT GetCount(uint*);
    HRESULT Next(uint, ulong*, uint*);
}
enum IID_IMethodMalloc = GUID(0xa0efb28b, 0x6ee2, 0x4d7b, [0xb9, 0x83, 0xa7, 0x5e, 0xf7, 0xbe, 0xed, 0xb8]);
interface IMethodMalloc : IUnknown
{
    void* Alloc(uint);
}
enum IID_ICorProfilerFunctionControl = GUID(0xf0963021, 0xe1ea, 0x4732, [0x85, 0x81, 0xe0, 0x1b, 0xb, 0xd3, 0xc0, 0xc6]);
interface ICorProfilerFunctionControl : IUnknown
{
    HRESULT SetCodegenFlags(uint);
    HRESULT SetILFunctionBody(uint, ubyte*);
    HRESULT SetILInstrumentedCodeMap(uint, COR_IL_MAP*);
}
enum IID_ICorProfilerInfo4 = GUID(0xd8fdcaa, 0x6257, 0x47bf, [0xb1, 0xbf, 0x94, 0xda, 0xc8, 0x84, 0x66, 0xee]);
interface ICorProfilerInfo4 : ICorProfilerInfo3
{
    HRESULT EnumThreads(ICorProfilerThreadEnum*);
    HRESULT InitializeCurrentThread();
    HRESULT RequestReJIT(uint, ulong*, uint*);
    HRESULT RequestRevert(uint, ulong*, uint*, HRESULT*);
    HRESULT GetCodeInfo3(ulong, ulong, uint, uint*, COR_PRF_CODE_INFO*);
    HRESULT GetFunctionFromIP2(ubyte*, ulong*, ulong*);
    HRESULT GetReJITIDs(ulong, uint, uint*, ulong*);
    HRESULT GetILToNativeMapping2(ulong, ulong, uint, uint*, COR_DEBUG_IL_TO_NATIVE_MAP*);
    HRESULT EnumJITedFunctions2(ICorProfilerFunctionEnum*);
    HRESULT GetObjectSize2(ulong, ulong*);
}
enum IID_ICorProfilerInfo5 = GUID(0x7602928, 0xce38, 0x4b83, [0x81, 0xe7, 0x74, 0xad, 0xaf, 0x78, 0x12, 0x14]);
interface ICorProfilerInfo5 : ICorProfilerInfo4
{
    HRESULT GetEventMask2(uint*, uint*);
    HRESULT SetEventMask2(uint, uint);
}
enum IID_ICorProfilerInfo6 = GUID(0xf30a070d, 0xbffb, 0x46a7, [0xb1, 0xd8, 0x87, 0x81, 0xef, 0x7b, 0x69, 0x8a]);
interface ICorProfilerInfo6 : ICorProfilerInfo5
{
    HRESULT EnumNgenModuleMethodsInliningThisMethod(ulong, ulong, uint, BOOL*, ICorProfilerMethodEnum*);
}
enum IID_ICorProfilerInfo7 = GUID(0x9aeecc0d, 0x63e0, 0x4187, [0x8c, 0x0, 0xe3, 0x12, 0xf5, 0x3, 0xf6, 0x63]);
interface ICorProfilerInfo7 : ICorProfilerInfo6
{
    HRESULT ApplyMetaData(ulong);
    HRESULT GetInMemorySymbolsLength(ulong, uint*);
    HRESULT ReadInMemorySymbols(ulong, uint, ubyte*, uint, uint*);
}
enum IID_ICorProfilerInfo8 = GUID(0xc5ac80a6, 0x782e, 0x4716, [0x80, 0x44, 0x39, 0x59, 0x8c, 0x60, 0xcf, 0xbf]);
interface ICorProfilerInfo8 : ICorProfilerInfo7
{
    HRESULT IsFunctionDynamic(ulong, BOOL*);
    HRESULT GetFunctionFromIP3(ubyte*, ulong*, ulong*);
    HRESULT GetDynamicFunctionInfo(ulong, ulong*, ubyte**, uint*, uint, uint*, PWSTR);
}
enum IID_ICorProfilerMethodEnum = GUID(0xfccee788, 0x88, 0x454b, [0xa8, 0x11, 0xc9, 0x9f, 0x29, 0x8d, 0x19, 0x42]);
interface ICorProfilerMethodEnum : IUnknown
{
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerMethodEnum*);
    HRESULT GetCount(uint*);
    HRESULT Next(uint, COR_PRF_METHOD*, uint*);
}
enum IID_ICorProfilerThreadEnum = GUID(0x571194f7, 0x25ed, 0x419f, [0xaa, 0x8b, 0x70, 0x16, 0xb3, 0x15, 0x97, 0x1]);
interface ICorProfilerThreadEnum : IUnknown
{
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ICorProfilerThreadEnum*);
    HRESULT GetCount(uint*);
    HRESULT Next(uint, ulong*, uint*);
}
enum IID_ICorProfilerAssemblyReferenceProvider = GUID(0x66a78c24, 0x2eef, 0x4f65, [0xb4, 0x5f, 0xdd, 0x1d, 0x80, 0x38, 0xbf, 0x3c]);
interface ICorProfilerAssemblyReferenceProvider : IUnknown
{
    HRESULT AddAssemblyReference(const(COR_PRF_ASSEMBLY_REFERENCE_INFO)*);
}
