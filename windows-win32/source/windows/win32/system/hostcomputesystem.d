module windows.win32.system.hostcomputesystem;

import windows.win32.foundation : HANDLE, HRESULT, PWSTR;
import windows.win32.security : SECURITY_DESCRIPTOR;

version (Windows):
extern (Windows):

alias HCS_OPERATION = void*;
alias HCS_SYSTEM = void*;
alias HCS_PROCESS = void*;
alias HCS_OPERATION_TYPE = int;
enum : int
{
    HcsOperationTypeNone                 = 0xffffffff,
    HcsOperationTypeEnumerate            = 0x00000000,
    HcsOperationTypeCreate               = 0x00000001,
    HcsOperationTypeStart                = 0x00000002,
    HcsOperationTypeShutdown             = 0x00000003,
    HcsOperationTypePause                = 0x00000004,
    HcsOperationTypeResume               = 0x00000005,
    HcsOperationTypeSave                 = 0x00000006,
    HcsOperationTypeTerminate            = 0x00000007,
    HcsOperationTypeModify               = 0x00000008,
    HcsOperationTypeGetProperties        = 0x00000009,
    HcsOperationTypeCreateProcess        = 0x0000000a,
    HcsOperationTypeSignalProcess        = 0x0000000b,
    HcsOperationTypeGetProcessInfo       = 0x0000000c,
    HcsOperationTypeGetProcessProperties = 0x0000000d,
    HcsOperationTypeModifyProcess        = 0x0000000e,
    HcsOperationTypeCrash                = 0x0000000f,
}

alias HCS_OPERATION_COMPLETION = void function(HCS_OPERATION, void*);
alias HCS_EVENT_TYPE = int;
enum : int
{
    HcsEventInvalid                           = 0x00000000,
    HcsEventSystemExited                      = 0x00000001,
    HcsEventSystemCrashInitiated              = 0x00000002,
    HcsEventSystemCrashReport                 = 0x00000003,
    HcsEventSystemRdpEnhancedModeStateChanged = 0x00000004,
    HcsEventSystemSiloJobCreated              = 0x00000005,
    HcsEventSystemGuestConnectionClosed       = 0x00000006,
    HcsEventProcessExited                     = 0x00010000,
    HcsEventOperationCallback                 = 0x01000000,
    HcsEventServiceDisconnect                 = 0x02000000,
    HcsEventGroupVmLifecycle                  = 0x80000002,
    HcsEventGroupOperationInfo                = 0xc0000001,
}

struct HCS_EVENT
{
    HCS_EVENT_TYPE Type;
    const(wchar)* EventData;
    HCS_OPERATION Operation;
}
alias HCS_EVENT_OPTIONS = int;
enum : int
{
    HcsEventOptionNone                     = 0x00000000,
    HcsEventOptionEnableOperationCallbacks = 0x00000001,
    HcsEventOptionEnableVmLifecycle        = 0x00000002,
}

alias HCS_OPERATION_OPTIONS = int;
enum : int
{
    HcsOperationOptionNone           = 0x00000000,
    HcsOperationOptionProgressUpdate = 0x00000001,
}

alias HCS_EVENT_CALLBACK = void function(HCS_EVENT*, void*);
alias HCS_RESOURCE_TYPE = int;
enum : int
{
    HcsResourceTypeNone = 0x00000000,
    HcsResourceTypeFile = 0x00000001,
    HcsResourceTypeJob  = 0x00000002,
}

alias HCS_NOTIFICATION_FLAGS = int;
enum : int
{
    HcsNotificationFlagSuccess = 0x00000000,
    HcsNotificationFlagFailure = 0x80000000,
}

alias HCS_NOTIFICATIONS = int;
enum : int
{
    HcsNotificationInvalid                           = 0x00000000,
    HcsNotificationSystemExited                      = 0x00000001,
    HcsNotificationSystemCreateCompleted             = 0x00000002,
    HcsNotificationSystemStartCompleted              = 0x00000003,
    HcsNotificationSystemPauseCompleted              = 0x00000004,
    HcsNotificationSystemResumeCompleted             = 0x00000005,
    HcsNotificationSystemCrashReport                 = 0x00000006,
    HcsNotificationSystemSiloJobCreated              = 0x00000007,
    HcsNotificationSystemSaveCompleted               = 0x00000008,
    HcsNotificationSystemRdpEnhancedModeStateChanged = 0x00000009,
    HcsNotificationSystemShutdownFailed              = 0x0000000a,
    HcsNotificationSystemShutdownCompleted           = 0x0000000a,
    HcsNotificationSystemGetPropertiesCompleted      = 0x0000000b,
    HcsNotificationSystemModifyCompleted             = 0x0000000c,
    HcsNotificationSystemCrashInitiated              = 0x0000000d,
    HcsNotificationSystemGuestConnectionClosed       = 0x0000000e,
    HcsNotificationSystemOperationCompletion         = 0x0000000f,
    HcsNotificationSystemPassThru                    = 0x00000010,
    HcsNotificationOperationProgressUpdate           = 0x00000100,
    HcsNotificationProcessExited                     = 0x00010000,
    HcsNotificationServiceDisconnect                 = 0x01000000,
    HcsNotificationFlagsReserved                     = 0xf0000000,
}

alias HCS_NOTIFICATION_CALLBACK = void function(uint, void*, HRESULT, const(wchar)*);
struct HCS_PROCESS_INFORMATION
{
    uint ProcessId;
    uint Reserved;
    HANDLE StdInput;
    HANDLE StdOutput;
    HANDLE StdError;
}
alias HCS_CREATE_OPTIONS = int;
enum : int
{
    HcsCreateOptions_1 = 0x00010000,
}

struct HCS_CREATE_OPTIONS_1
{
    HCS_CREATE_OPTIONS Version;
    HANDLE UserToken;
    SECURITY_DESCRIPTOR* SecurityDescriptor;
    HCS_EVENT_OPTIONS CallbackOptions;
    void* CallbackContext;
    HCS_EVENT_CALLBACK Callback;
}
HRESULT HcsEnumerateComputeSystems(const(wchar)*, HCS_OPERATION);
HRESULT HcsEnumerateComputeSystemsInNamespace(const(wchar)*, const(wchar)*, HCS_OPERATION);
HCS_OPERATION HcsCreateOperation(const(void)*, HCS_OPERATION_COMPLETION);
HCS_OPERATION HcsCreateOperationWithNotifications(HCS_OPERATION_OPTIONS, const(void)*, HCS_EVENT_CALLBACK);
void HcsCloseOperation(HCS_OPERATION);
void* HcsGetOperationContext(HCS_OPERATION);
HRESULT HcsSetOperationContext(HCS_OPERATION, const(void)*);
HCS_SYSTEM HcsGetComputeSystemFromOperation(HCS_OPERATION);
HCS_PROCESS HcsGetProcessFromOperation(HCS_OPERATION);
HCS_OPERATION_TYPE HcsGetOperationType(HCS_OPERATION);
ulong HcsGetOperationId(HCS_OPERATION);
HRESULT HcsGetOperationResult(HCS_OPERATION, PWSTR*);
HRESULT HcsGetOperationResultAndProcessInfo(HCS_OPERATION, HCS_PROCESS_INFORMATION*, PWSTR*);
HRESULT HcsAddResourceToOperation(HCS_OPERATION, HCS_RESOURCE_TYPE, const(wchar)*, HANDLE);
HRESULT HcsGetProcessorCompatibilityFromSavedState(const(wchar)*, const(wchar)**);
HRESULT HcsWaitForOperationResult(HCS_OPERATION, uint, PWSTR*);
HRESULT HcsWaitForOperationResultAndProcessInfo(HCS_OPERATION, uint, HCS_PROCESS_INFORMATION*, PWSTR*);
HRESULT HcsSetOperationCallback(HCS_OPERATION, const(void)*, HCS_OPERATION_COMPLETION);
HRESULT HcsCancelOperation(HCS_OPERATION);
HRESULT HcsCreateComputeSystem(const(wchar)*, const(wchar)*, HCS_OPERATION, const(SECURITY_DESCRIPTOR)*, HCS_SYSTEM*);
HRESULT HcsCreateComputeSystemInNamespace(const(wchar)*, const(wchar)*, const(wchar)*, HCS_OPERATION, const(HCS_CREATE_OPTIONS)*, HCS_SYSTEM*);
HRESULT HcsOpenComputeSystem(const(wchar)*, uint, HCS_SYSTEM*);
HRESULT HcsOpenComputeSystemInNamespace(const(wchar)*, const(wchar)*, uint, HCS_SYSTEM*);
void HcsCloseComputeSystem(HCS_SYSTEM);
HRESULT HcsStartComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsShutDownComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsTerminateComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsCrashComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsPauseComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsResumeComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsSaveComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsGetComputeSystemProperties(HCS_SYSTEM, HCS_OPERATION, const(wchar)*);
HRESULT HcsModifyComputeSystem(HCS_SYSTEM, HCS_OPERATION, const(wchar)*, HANDLE);
HRESULT HcsWaitForComputeSystemExit(HCS_SYSTEM, uint, PWSTR*);
HRESULT HcsSetComputeSystemCallback(HCS_SYSTEM, HCS_EVENT_OPTIONS, const(void)*, HCS_EVENT_CALLBACK);
HRESULT HcsCreateProcess(HCS_SYSTEM, const(wchar)*, HCS_OPERATION, const(SECURITY_DESCRIPTOR)*, HCS_PROCESS*);
HRESULT HcsOpenProcess(HCS_SYSTEM, uint, uint, HCS_PROCESS*);
void HcsCloseProcess(HCS_PROCESS);
HRESULT HcsTerminateProcess(HCS_PROCESS, HCS_OPERATION, const(wchar)*);
HRESULT HcsSignalProcess(HCS_PROCESS, HCS_OPERATION, const(wchar)*);
HRESULT HcsGetProcessInfo(HCS_PROCESS, HCS_OPERATION);
HRESULT HcsGetProcessProperties(HCS_PROCESS, HCS_OPERATION, const(wchar)*);
HRESULT HcsModifyProcess(HCS_PROCESS, HCS_OPERATION, const(wchar)*);
HRESULT HcsSetProcessCallback(HCS_PROCESS, HCS_EVENT_OPTIONS, void*, HCS_EVENT_CALLBACK);
HRESULT HcsWaitForProcessExit(HCS_PROCESS, uint, PWSTR*);
HRESULT HcsGetServiceProperties(const(wchar)*, PWSTR*);
HRESULT HcsModifyServiceSettings(const(wchar)*, PWSTR*);
HRESULT HcsSubmitWerReport(const(wchar)*);
HRESULT HcsCreateEmptyGuestStateFile(const(wchar)*);
HRESULT HcsCreateEmptyRuntimeStateFile(const(wchar)*);
HRESULT HcsGrantVmAccess(const(wchar)*, const(wchar)*);
HRESULT HcsRevokeVmAccess(const(wchar)*, const(wchar)*);
HRESULT HcsGrantVmGroupAccess(const(wchar)*);
HRESULT HcsRevokeVmGroupAccess(const(wchar)*);
HRESULT HcsImportLayer(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT HcsExportLayer(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT HcsExportLegacyWritableLayer(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT HcsDestroyLayer(const(wchar)*);
HRESULT HcsSetupBaseOSLayer(const(wchar)*, HANDLE, const(wchar)*);
HRESULT HcsInitializeWritableLayer(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT HcsInitializeLegacyWritableLayer(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT HcsAttachLayerStorageFilter(const(wchar)*, const(wchar)*);
HRESULT HcsDetachLayerStorageFilter(const(wchar)*);
HRESULT HcsFormatWritableLayerVhd(HANDLE);
HRESULT HcsGetLayerVhdMountPath(HANDLE, PWSTR*);
HRESULT HcsSetupBaseOSVolume(const(wchar)*, const(wchar)*, const(wchar)*);
