module windows.win32.system.js;

import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.diagnostics.debug_.activescript : IActiveScriptProfilerCallback, IActiveScriptProfilerHeapEnum, IDebugApplication32, IDebugApplication64, PROFILER_EVENT_MASK;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

alias JsRuntimeVersion = int;
enum : int
{
    JsRuntimeVersion10   = 0x00000000,
    JsRuntimeVersion11   = 0x00000001,
    JsRuntimeVersionEdge = 0xffffffff,
}

JsErrorCode JsCreateContext(void* runtime, IDebugApplication64 debugApplication, void** newContext);
JsErrorCode JsStartDebugging(IDebugApplication64 debugApplication);
JsErrorCode JsCreateRuntime(JsRuntimeAttributes attributes, JsRuntimeVersion runtimeVersion, JsThreadServiceCallback threadService, void** runtime);
JsErrorCode JsCollectGarbage(void* runtime);
JsErrorCode JsDisposeRuntime(void* runtime);
JsErrorCode JsGetRuntimeMemoryUsage(void* runtime, ulong* memoryUsage);
JsErrorCode JsGetRuntimeMemoryLimit(void* runtime, ulong* memoryLimit);
JsErrorCode JsSetRuntimeMemoryLimit(void* runtime, ulong memoryLimit);
JsErrorCode JsSetRuntimeMemoryAllocationCallback(void* runtime, void* callbackState, JsMemoryAllocationCallback allocationCallback);
JsErrorCode JsSetRuntimeBeforeCollectCallback(void* runtime, void* callbackState, JsBeforeCollectCallback beforeCollectCallback);
JsErrorCode JsAddRef(void* ref_, uint* count);
JsErrorCode JsRelease(void* ref_, uint* count);
/+ [CONFLICTED] JsErrorCode JsCreateContext(void* runtime, IDebugApplication32 debugApplication, void** newContext);
+/
JsErrorCode JsGetCurrentContext(void** currentContext);
JsErrorCode JsSetCurrentContext(void* context);
JsErrorCode JsGetRuntime(void* context, void** runtime);
/+ [CONFLICTED] JsErrorCode JsStartDebugging(IDebugApplication32 debugApplication);
+/
JsErrorCode JsIdle(uint* nextIdleTick);
JsErrorCode JsParseScript(const(wchar)* script, ulong sourceContext, const(wchar)* sourceUrl, void** result);
JsErrorCode JsRunScript(const(wchar)* script, ulong sourceContext, const(wchar)* sourceUrl, void** result);
JsErrorCode JsSerializeScript(const(wchar)* script, ubyte* buffer, uint* bufferSize);
JsErrorCode JsParseSerializedScript(const(wchar)* script, ubyte* buffer, ulong sourceContext, const(wchar)* sourceUrl, void** result);
JsErrorCode JsRunSerializedScript(const(wchar)* script, ubyte* buffer, ulong sourceContext, const(wchar)* sourceUrl, void** result);
JsErrorCode JsGetPropertyIdFromName(const(wchar)* name, void** propertyId);
JsErrorCode JsGetPropertyNameFromId(void* propertyId, const(ushort)** name);
JsErrorCode JsGetUndefinedValue(void** undefinedValue);
JsErrorCode JsGetNullValue(void** nullValue);
JsErrorCode JsGetTrueValue(void** trueValue);
JsErrorCode JsGetFalseValue(void** falseValue);
JsErrorCode JsBoolToBoolean(ubyte value, void** booleanValue);
JsErrorCode JsBooleanToBool(void* value, bool* boolValue);
JsErrorCode JsConvertValueToBoolean(void* value, void** booleanValue);
JsErrorCode JsGetValueType(void* value, JsValueType* type);
JsErrorCode JsDoubleToNumber(double doubleValue, void** value);
JsErrorCode JsIntToNumber(int intValue, void** value);
JsErrorCode JsNumberToDouble(void* value, double* doubleValue);
JsErrorCode JsConvertValueToNumber(void* value, void** numberValue);
JsErrorCode JsGetStringLength(void* stringValue, int* length);
JsErrorCode JsPointerToString(const(wchar)* stringValue, ulong stringLength, void** value);
JsErrorCode JsStringToPointer(void* value, const(ushort)** stringValue, ulong* stringLength);
JsErrorCode JsConvertValueToString(void* value, void** stringValue);
JsErrorCode JsVariantToValue(VARIANT* variant, void** value);
JsErrorCode JsValueToVariant(void* object, VARIANT* variant);
JsErrorCode JsGetGlobalObject(void** globalObject);
JsErrorCode JsCreateObject(void** object);
JsErrorCode JsCreateExternalObject(void* data, JsFinalizeCallback finalizeCallback, void** object);
JsErrorCode JsConvertValueToObject(void* value, void** object);
JsErrorCode JsGetPrototype(void* object, void** prototypeObject);
JsErrorCode JsSetPrototype(void* object, void* prototypeObject);
JsErrorCode JsGetExtensionAllowed(void* object, bool* value);
JsErrorCode JsPreventExtension(void* object);
JsErrorCode JsGetProperty(void* object, void* propertyId, void** value);
JsErrorCode JsGetOwnPropertyDescriptor(void* object, void* propertyId, void** propertyDescriptor);
JsErrorCode JsGetOwnPropertyNames(void* object, void** propertyNames);
JsErrorCode JsSetProperty(void* object, void* propertyId, void* value, ubyte useStrictRules);
JsErrorCode JsHasProperty(void* object, void* propertyId, bool* hasProperty);
JsErrorCode JsDeleteProperty(void* object, void* propertyId, ubyte useStrictRules, void** result);
JsErrorCode JsDefineProperty(void* object, void* propertyId, void* propertyDescriptor, bool* result);
JsErrorCode JsHasIndexedProperty(void* object, void* index, bool* result);
JsErrorCode JsGetIndexedProperty(void* object, void* index, void** result);
JsErrorCode JsSetIndexedProperty(void* object, void* index, void* value);
JsErrorCode JsDeleteIndexedProperty(void* object, void* index);
JsErrorCode JsEquals(void* object1, void* object2, bool* result);
JsErrorCode JsStrictEquals(void* object1, void* object2, bool* result);
JsErrorCode JsHasExternalData(void* object, bool* value);
JsErrorCode JsGetExternalData(void* object, void** externalData);
JsErrorCode JsSetExternalData(void* object, void* externalData);
JsErrorCode JsCreateArray(uint length, void** result);
JsErrorCode JsCallFunction(void* function_, void** arguments, ushort argumentCount, void** result);
JsErrorCode JsConstructObject(void* function_, void** arguments, ushort argumentCount, void** result);
JsErrorCode JsCreateFunction(JsNativeFunction nativeFunction, void* callbackState, void** function_);
JsErrorCode JsCreateError(void* message, void** error);
JsErrorCode JsCreateRangeError(void* message, void** error);
JsErrorCode JsCreateReferenceError(void* message, void** error);
JsErrorCode JsCreateSyntaxError(void* message, void** error);
JsErrorCode JsCreateTypeError(void* message, void** error);
JsErrorCode JsCreateURIError(void* message, void** error);
JsErrorCode JsHasException(bool* hasException);
JsErrorCode JsGetAndClearException(void** exception);
JsErrorCode JsSetException(void* exception);
JsErrorCode JsDisableRuntimeExecution(void* runtime);
JsErrorCode JsEnableRuntimeExecution(void* runtime);
JsErrorCode JsIsRuntimeExecutionDisabled(void* runtime, bool* isDisabled);
JsErrorCode JsStartProfiling(IActiveScriptProfilerCallback callback, PROFILER_EVENT_MASK eventMask, uint context);
JsErrorCode JsStopProfiling(HRESULT reason);
JsErrorCode JsEnumerateHeap(IActiveScriptProfilerHeapEnum* enumerator);
JsErrorCode JsIsEnumeratingHeap(bool* isEnumeratingHeap);
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

alias JsMemoryAllocationCallback = bool function(void* callbackState, JsMemoryEventType allocationEvent, ulong allocationSize);
alias JsBeforeCollectCallback = void function(void* callbackState);
alias JsBackgroundWorkItemCallback = void function(void* callbackState);
alias JsThreadServiceCallback = bool function(JsBackgroundWorkItemCallback callback, void* callbackState);
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

alias JsFinalizeCallback = void function(void* data);
alias JsNativeFunction = void* function(void* callee, bool isConstructCall, void** arguments, ushort argumentCount, void* callbackState);
