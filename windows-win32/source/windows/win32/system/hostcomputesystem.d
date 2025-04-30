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

alias HCS_OPERATION_COMPLETION = void function(HCS_OPERATION operation, void* context);
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

alias HCS_EVENT_CALLBACK = void function(HCS_EVENT* event, void* context);
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

alias HCS_NOTIFICATION_CALLBACK = void function(uint notificationType, void* context, HRESULT notificationStatus, const(wchar)* notificationData);
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
HRESULT HcsEnumerateComputeSystems(const(wchar)* query, HCS_OPERATION operation);
HRESULT HcsEnumerateComputeSystemsInNamespace(const(wchar)* idNamespace, const(wchar)* query, HCS_OPERATION operation);
HCS_OPERATION HcsCreateOperation(const(void)* context, HCS_OPERATION_COMPLETION callback);
HCS_OPERATION HcsCreateOperationWithNotifications(HCS_OPERATION_OPTIONS eventTypes, const(void)* context, HCS_EVENT_CALLBACK callback);
void HcsCloseOperation(HCS_OPERATION operation);
void* HcsGetOperationContext(HCS_OPERATION operation);
HRESULT HcsSetOperationContext(HCS_OPERATION operation, const(void)* context);
HCS_SYSTEM HcsGetComputeSystemFromOperation(HCS_OPERATION operation);
HCS_PROCESS HcsGetProcessFromOperation(HCS_OPERATION operation);
HCS_OPERATION_TYPE HcsGetOperationType(HCS_OPERATION operation);
ulong HcsGetOperationId(HCS_OPERATION operation);
HRESULT HcsGetOperationResult(HCS_OPERATION operation, PWSTR* resultDocument);
HRESULT HcsGetOperationResultAndProcessInfo(HCS_OPERATION operation, HCS_PROCESS_INFORMATION* processInformation, PWSTR* resultDocument);
HRESULT HcsAddResourceToOperation(HCS_OPERATION operation, HCS_RESOURCE_TYPE type, const(wchar)* uri, HANDLE handle);
HRESULT HcsGetProcessorCompatibilityFromSavedState(const(wchar)* RuntimeFileName, const(wchar)** ProcessorFeaturesString);
HRESULT HcsWaitForOperationResult(HCS_OPERATION operation, uint timeoutMs, PWSTR* resultDocument);
HRESULT HcsWaitForOperationResultAndProcessInfo(HCS_OPERATION operation, uint timeoutMs, HCS_PROCESS_INFORMATION* processInformation, PWSTR* resultDocument);
HRESULT HcsSetOperationCallback(HCS_OPERATION operation, const(void)* context, HCS_OPERATION_COMPLETION callback);
HRESULT HcsCancelOperation(HCS_OPERATION operation);
HRESULT HcsCreateComputeSystem(const(wchar)* id, const(wchar)* configuration, HCS_OPERATION operation, const(SECURITY_DESCRIPTOR)* securityDescriptor, HCS_SYSTEM* computeSystem);
HRESULT HcsCreateComputeSystemInNamespace(const(wchar)* idNamespace, const(wchar)* id, const(wchar)* configuration, HCS_OPERATION operation, const(HCS_CREATE_OPTIONS)* options, HCS_SYSTEM* computeSystem);
HRESULT HcsOpenComputeSystem(const(wchar)* id, uint requestedAccess, HCS_SYSTEM* computeSystem);
HRESULT HcsOpenComputeSystemInNamespace(const(wchar)* idNamespace, const(wchar)* id, uint requestedAccess, HCS_SYSTEM* computeSystem);
void HcsCloseComputeSystem(HCS_SYSTEM computeSystem);
HRESULT HcsStartComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsShutDownComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsTerminateComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsCrashComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsPauseComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsResumeComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsSaveComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsGetComputeSystemProperties(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* propertyQuery);
HRESULT HcsModifyComputeSystem(HCS_SYSTEM computeSystem, HCS_OPERATION operation, const(wchar)* configuration, HANDLE identity);
HRESULT HcsWaitForComputeSystemExit(HCS_SYSTEM computeSystem, uint timeoutMs, PWSTR* result);
HRESULT HcsSetComputeSystemCallback(HCS_SYSTEM computeSystem, HCS_EVENT_OPTIONS callbackOptions, const(void)* context, HCS_EVENT_CALLBACK callback);
HRESULT HcsCreateProcess(HCS_SYSTEM computeSystem, const(wchar)* processParameters, HCS_OPERATION operation, const(SECURITY_DESCRIPTOR)* securityDescriptor, HCS_PROCESS* process);
HRESULT HcsOpenProcess(HCS_SYSTEM computeSystem, uint processId, uint requestedAccess, HCS_PROCESS* process);
void HcsCloseProcess(HCS_PROCESS process);
HRESULT HcsTerminateProcess(HCS_PROCESS process, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsSignalProcess(HCS_PROCESS process, HCS_OPERATION operation, const(wchar)* options);
HRESULT HcsGetProcessInfo(HCS_PROCESS process, HCS_OPERATION operation);
HRESULT HcsGetProcessProperties(HCS_PROCESS process, HCS_OPERATION operation, const(wchar)* propertyQuery);
HRESULT HcsModifyProcess(HCS_PROCESS process, HCS_OPERATION operation, const(wchar)* settings);
HRESULT HcsSetProcessCallback(HCS_PROCESS process, HCS_EVENT_OPTIONS callbackOptions, void* context, HCS_EVENT_CALLBACK callback);
HRESULT HcsWaitForProcessExit(HCS_PROCESS computeSystem, uint timeoutMs, PWSTR* result);
HRESULT HcsGetServiceProperties(const(wchar)* propertyQuery, PWSTR* result);
HRESULT HcsModifyServiceSettings(const(wchar)* settings, PWSTR* result);
HRESULT HcsSubmitWerReport(const(wchar)* settings);
HRESULT HcsCreateEmptyGuestStateFile(const(wchar)* guestStateFilePath);
HRESULT HcsCreateEmptyRuntimeStateFile(const(wchar)* runtimeStateFilePath);
HRESULT HcsGrantVmAccess(const(wchar)* vmId, const(wchar)* filePath);
HRESULT HcsRevokeVmAccess(const(wchar)* vmId, const(wchar)* filePath);
HRESULT HcsGrantVmGroupAccess(const(wchar)* filePath);
HRESULT HcsRevokeVmGroupAccess(const(wchar)* filePath);
HRESULT HcsImportLayer(const(wchar)* layerPath, const(wchar)* sourceFolderPath, const(wchar)* layerData);
HRESULT HcsExportLayer(const(wchar)* layerPath, const(wchar)* exportFolderPath, const(wchar)* layerData, const(wchar)* options);
HRESULT HcsExportLegacyWritableLayer(const(wchar)* writableLayerMountPath, const(wchar)* writableLayerFolderPath, const(wchar)* exportFolderPath, const(wchar)* layerData);
HRESULT HcsDestroyLayer(const(wchar)* layerPath);
HRESULT HcsSetupBaseOSLayer(const(wchar)* layerPath, HANDLE vhdHandle, const(wchar)* options);
HRESULT HcsInitializeWritableLayer(const(wchar)* writableLayerPath, const(wchar)* layerData, const(wchar)* options);
HRESULT HcsInitializeLegacyWritableLayer(const(wchar)* writableLayerMountPath, const(wchar)* writableLayerFolderPath, const(wchar)* layerData, const(wchar)* options);
HRESULT HcsAttachLayerStorageFilter(const(wchar)* layerPath, const(wchar)* layerData);
HRESULT HcsDetachLayerStorageFilter(const(wchar)* layerPath);
HRESULT HcsFormatWritableLayerVhd(HANDLE vhdHandle);
HRESULT HcsGetLayerVhdMountPath(HANDLE vhdHandle, PWSTR* mountPath);
HRESULT HcsSetupBaseOSVolume(const(wchar)* layerPath, const(wchar)* volumePath, const(wchar)* options);
