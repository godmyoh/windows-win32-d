module windows.win32.system.js;

import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com_ : VARIANT;
import windows.win32.system.diagnostics.debug__ : IActiveScriptProfilerCallback, IActiveScriptProfilerHeapEnum, IDebugApplication32, IDebugApplication64, PROFILER_EVENT_MASK;

version (Windows):
extern (Windows):

alias JsRuntimeVersion = int;
enum : int
{
    JsRuntimeVersion10   = 0x00000000,
    JsRuntimeVersion11   = 0x00000001,
    JsRuntimeVersionEdge = 0xffffffff,
}

JsErrorCode JsCreateContext(void*, IDebugApplication64, void**);
JsErrorCode JsStartDebugging(IDebugApplication64);
JsErrorCode JsCreateRuntime(JsRuntimeAttributes, JsRuntimeVersion, JsThreadServiceCallback, void**);
JsErrorCode JsCollectGarbage(void*);
JsErrorCode JsDisposeRuntime(void*);
JsErrorCode JsGetRuntimeMemoryUsage(void*, ulong*);
JsErrorCode JsGetRuntimeMemoryLimit(void*, ulong*);
JsErrorCode JsSetRuntimeMemoryLimit(void*, ulong);
JsErrorCode JsSetRuntimeMemoryAllocationCallback(void*, void*, JsMemoryAllocationCallback);
JsErrorCode JsSetRuntimeBeforeCollectCallback(void*, void*, JsBeforeCollectCallback);
JsErrorCode JsAddRef(void*, uint*);
JsErrorCode JsRelease(void*, uint*);
/+ [CONFLICTED] JsErrorCode JsCreateContext(void*, IDebugApplication32, void**);
+/
JsErrorCode JsGetCurrentContext(void**);
JsErrorCode JsSetCurrentContext(void*);
JsErrorCode JsGetRuntime(void*, void**);
/+ [CONFLICTED] JsErrorCode JsStartDebugging(IDebugApplication32);
+/
JsErrorCode JsIdle(uint*);
JsErrorCode JsParseScript(const(wchar)*, ulong, const(wchar)*, void**);
JsErrorCode JsRunScript(const(wchar)*, ulong, const(wchar)*, void**);
JsErrorCode JsSerializeScript(const(wchar)*, ubyte*, uint*);
JsErrorCode JsParseSerializedScript(const(wchar)*, ubyte*, ulong, const(wchar)*, void**);
JsErrorCode JsRunSerializedScript(const(wchar)*, ubyte*, ulong, const(wchar)*, void**);
JsErrorCode JsGetPropertyIdFromName(const(wchar)*, void**);
JsErrorCode JsGetPropertyNameFromId(void*, const(ushort)**);
JsErrorCode JsGetUndefinedValue(void**);
JsErrorCode JsGetNullValue(void**);
JsErrorCode JsGetTrueValue(void**);
JsErrorCode JsGetFalseValue(void**);
JsErrorCode JsBoolToBoolean(ubyte, void**);
JsErrorCode JsBooleanToBool(void*, bool*);
JsErrorCode JsConvertValueToBoolean(void*, void**);
JsErrorCode JsGetValueType(void*, JsValueType*);
JsErrorCode JsDoubleToNumber(double, void**);
JsErrorCode JsIntToNumber(int, void**);
JsErrorCode JsNumberToDouble(void*, double*);
JsErrorCode JsConvertValueToNumber(void*, void**);
JsErrorCode JsGetStringLength(void*, int*);
JsErrorCode JsPointerToString(const(wchar)*, ulong, void**);
JsErrorCode JsStringToPointer(void*, const(ushort)**, ulong*);
JsErrorCode JsConvertValueToString(void*, void**);
JsErrorCode JsVariantToValue(VARIANT*, void**);
JsErrorCode JsValueToVariant(void*, VARIANT*);
JsErrorCode JsGetGlobalObject(void**);
JsErrorCode JsCreateObject(void**);
JsErrorCode JsCreateExternalObject(void*, JsFinalizeCallback, void**);
JsErrorCode JsConvertValueToObject(void*, void**);
JsErrorCode JsGetPrototype(void*, void**);
JsErrorCode JsSetPrototype(void*, void*);
JsErrorCode JsGetExtensionAllowed(void*, bool*);
JsErrorCode JsPreventExtension(void*);
JsErrorCode JsGetProperty(void*, void*, void**);
JsErrorCode JsGetOwnPropertyDescriptor(void*, void*, void**);
JsErrorCode JsGetOwnPropertyNames(void*, void**);
JsErrorCode JsSetProperty(void*, void*, void*, ubyte);
JsErrorCode JsHasProperty(void*, void*, bool*);
JsErrorCode JsDeleteProperty(void*, void*, ubyte, void**);
JsErrorCode JsDefineProperty(void*, void*, void*, bool*);
JsErrorCode JsHasIndexedProperty(void*, void*, bool*);
JsErrorCode JsGetIndexedProperty(void*, void*, void**);
JsErrorCode JsSetIndexedProperty(void*, void*, void*);
JsErrorCode JsDeleteIndexedProperty(void*, void*);
JsErrorCode JsEquals(void*, void*, bool*);
JsErrorCode JsStrictEquals(void*, void*, bool*);
JsErrorCode JsHasExternalData(void*, bool*);
JsErrorCode JsGetExternalData(void*, void**);
JsErrorCode JsSetExternalData(void*, void*);
JsErrorCode JsCreateArray(uint, void**);
JsErrorCode JsCallFunction(void*, void**, ushort, void**);
JsErrorCode JsConstructObject(void*, void**, ushort, void**);
JsErrorCode JsCreateFunction(JsNativeFunction, void*, void**);
JsErrorCode JsCreateError(void*, void**);
JsErrorCode JsCreateRangeError(void*, void**);
JsErrorCode JsCreateReferenceError(void*, void**);
JsErrorCode JsCreateSyntaxError(void*, void**);
JsErrorCode JsCreateTypeError(void*, void**);
JsErrorCode JsCreateURIError(void*, void**);
JsErrorCode JsHasException(bool*);
JsErrorCode JsGetAndClearException(void**);
JsErrorCode JsSetException(void*);
JsErrorCode JsDisableRuntimeExecution(void*);
JsErrorCode JsEnableRuntimeExecution(void*);
JsErrorCode JsIsRuntimeExecutionDisabled(void*, bool*);
JsErrorCode JsStartProfiling(IActiveScriptProfilerCallback, PROFILER_EVENT_MASK, uint);
JsErrorCode JsStopProfiling(HRESULT);
JsErrorCode JsEnumerateHeap(IActiveScriptProfilerHeapEnum*);
JsErrorCode JsIsEnumeratingHeap(bool*);
enum JS_SOURCE_CONTEXT_NONE = 0xffffffffffffffff;
alias JsErrorCode = uint;
enum : uint
{
    JsNoError                         = 0x00000000,
    JsErrorCategoryUsage              = 0x00010000,
    JsErrorInvalidArgument            = 0x00010001,
    JsErrorNullArgument               = 0x00010002,
    JsErrorNoCurrentContext           = 0x00010003,
    JsErrorInExceptionState           = 0x00010004,
    JsErrorNotImplemented             = 0x00010005,
    JsErrorWrongThread                = 0x00010006,
    JsErrorRuntimeInUse               = 0x00010007,
    JsErrorBadSerializedScript        = 0x00010008,
    JsErrorInDisabledState            = 0x00010009,
    JsErrorCannotDisableExecution     = 0x0001000a,
    JsErrorHeapEnumInProgress         = 0x0001000b,
    JsErrorArgumentNotObject          = 0x0001000c,
    JsErrorInProfileCallback          = 0x0001000d,
    JsErrorInThreadServiceCallback    = 0x0001000e,
    JsErrorCannotSerializeDebugScript = 0x0001000f,
    JsErrorAlreadyDebuggingContext    = 0x00010010,
    JsErrorAlreadyProfilingContext    = 0x00010011,
    JsErrorIdleNotEnabled             = 0x00010012,
    JsErrorCategoryEngine             = 0x00020000,
    JsErrorOutOfMemory                = 0x00020001,
    JsErrorCategoryScript             = 0x00030000,
    JsErrorScriptException            = 0x00030001,
    JsErrorScriptCompile              = 0x00030002,
    JsErrorScriptTerminated           = 0x00030003,
    JsErrorScriptEvalDisabled         = 0x00030004,
    JsErrorCategoryFatal              = 0x00040000,
    JsErrorFatal                      = 0x00040001,
}

alias JsRuntimeAttributes = int;
enum : int
{
    JsRuntimeAttributeNone                        = 0x00000000,
    JsRuntimeAttributeDisableBackgroundWork       = 0x00000001,
    JsRuntimeAttributeAllowScriptInterrupt        = 0x00000002,
    JsRuntimeAttributeEnableIdleProcessing        = 0x00000004,
    JsRuntimeAttributeDisableNativeCodeGeneration = 0x00000008,
    JsRuntimeAttributeDisableEval                 = 0x00000010,
}

alias JsMemoryEventType = int;
enum : int
{
    JsMemoryAllocate = 0x00000000,
    JsMemoryFree     = 0x00000001,
    JsMemoryFailure  = 0x00000002,
}

alias JsMemoryAllocationCallback = bool function(void*, JsMemoryEventType, ulong);
alias JsBeforeCollectCallback = void function(void*);
alias JsBackgroundWorkItemCallback = void function(void*);
alias JsThreadServiceCallback = bool function(JsBackgroundWorkItemCallback, void*);
alias JsValueType = int;
enum : int
{
    JsUndefined = 0x00000000,
    JsNull      = 0x00000001,
    JsNumber    = 0x00000002,
    JsString    = 0x00000003,
    JsBoolean   = 0x00000004,
    JsObject    = 0x00000005,
    JsFunction  = 0x00000006,
    JsError     = 0x00000007,
    JsArray     = 0x00000008,
}

alias JsFinalizeCallback = void function(void*);
alias JsNativeFunction = void* function(void*, bool, void**, ushort, void*);
