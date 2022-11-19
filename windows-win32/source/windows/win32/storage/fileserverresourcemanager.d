module windows.win32.storage.fileserverresourcemanager;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT, VARIANT_BOOL;
import windows.win32.system.com_ : IDispatch, IUnknown, SAFEARRAY, VARIANT;

version (Windows):
extern (Windows):

enum FSRM_DISPID_FEATURE_MASK = 0x0f000000;
enum FSRM_DISPID_INTERFACE_A_MASK = 0x00f00000;
enum FSRM_DISPID_INTERFACE_B_MASK = 0x000f0000;
enum FSRM_DISPID_INTERFACE_C_MASK = 0x0000f000;
enum FSRM_DISPID_INTERFACE_D_MASK = 0x00000f00;
enum FSRM_DISPID_IS_PROPERTY = 0x00000080;
enum FSRM_DISPID_METHOD_NUM_MASK = 0x0000007f;
enum FSRM_DISPID_FEATURE_GENERAL = 0x01000000;
enum FSRM_DISPID_FEATURE_QUOTA = 0x02000000;
enum FSRM_DISPID_FEATURE_FILESCREEN = 0x03000000;
enum FSRM_DISPID_FEATURE_REPORTS = 0x04000000;
enum FSRM_DISPID_FEATURE_CLASSIFICATION = 0x05000000;
enum FSRM_DISPID_FEATURE_PIPELINE = 0x06000000;
enum FsrmMaxNumberThresholds = 0x00000010;
enum FsrmMinThresholdValue = 0x00000001;
enum FsrmMaxThresholdValue = 0x000000fa;
enum FsrmMinQuotaLimit = 0x00000400;
enum FsrmMaxExcludeFolders = 0x00000020;
enum FsrmMaxNumberPropertyDefinitions = 0x00000064;
enum MessageSizeLimit = 0x00001000;
enum FsrmDaysNotSpecified = 0xffffffffffffffff;
enum FSRM_S_PARTIAL_BATCH = 0x00045304;
enum FSRM_S_PARTIAL_CLASSIFICATION = 0x00045305;
enum FSRM_S_CLASSIFICATION_SCAN_FAILURES = 0x00045306;
enum FSRM_E_NOT_FOUND = 0xffffffff80045301;
enum FSRM_E_INVALID_SCHEDULER_ARGUMENT = 0xffffffff80045302;
enum FSRM_E_ALREADY_EXISTS = 0xffffffff80045303;
enum FSRM_E_PATH_NOT_FOUND = 0xffffffff80045304;
enum FSRM_E_INVALID_USER = 0xffffffff80045305;
enum FSRM_E_INVALID_PATH = 0xffffffff80045306;
enum FSRM_E_INVALID_LIMIT = 0xffffffff80045307;
enum FSRM_E_INVALID_NAME = 0xffffffff80045308;
enum FSRM_E_FAIL_BATCH = 0xffffffff80045309;
enum FSRM_E_INVALID_TEXT = 0xffffffff8004530a;
enum FSRM_E_INVALID_IMPORT_VERSION = 0xffffffff8004530b;
enum FSRM_E_OUT_OF_RANGE = 0xffffffff8004530d;
enum FSRM_E_REQD_PARAM_MISSING = 0xffffffff8004530e;
enum FSRM_E_INVALID_COMBINATION = 0xffffffff8004530f;
enum FSRM_E_DUPLICATE_NAME = 0xffffffff80045310;
enum FSRM_E_NOT_SUPPORTED = 0xffffffff80045311;
enum FSRM_E_DRIVER_NOT_READY = 0xffffffff80045313;
enum FSRM_E_INSUFFICIENT_DISK = 0xffffffff80045314;
enum FSRM_E_VOLUME_UNSUPPORTED = 0xffffffff80045315;
enum FSRM_E_UNEXPECTED = 0xffffffff80045316;
enum FSRM_E_INSECURE_PATH = 0xffffffff80045317;
enum FSRM_E_INVALID_SMTP_SERVER = 0xffffffff80045318;
enum FSRM_E_AUTO_QUOTA = 0x0004531b;
enum FSRM_E_EMAIL_NOT_SENT = 0xffffffff8004531c;
enum FSRM_E_INVALID_EMAIL_ADDRESS = 0xffffffff8004531e;
enum FSRM_E_FILE_SYSTEM_CORRUPT = 0xffffffff8004531f;
enum FSRM_E_LONG_CMDLINE = 0xffffffff80045320;
enum FSRM_E_INVALID_FILEGROUP_DEFINITION = 0xffffffff80045321;
enum FSRM_E_INVALID_DATASCREEN_DEFINITION = 0xffffffff80045324;
enum FSRM_E_INVALID_REPORT_FORMAT = 0xffffffff80045328;
enum FSRM_E_INVALID_REPORT_DESC = 0xffffffff80045329;
enum FSRM_E_INVALID_FILENAME = 0xffffffff8004532a;
enum FSRM_E_SHADOW_COPY = 0xffffffff8004532c;
enum FSRM_E_XML_CORRUPTED = 0xffffffff8004532d;
enum FSRM_E_CLUSTER_NOT_RUNNING = 0xffffffff8004532e;
enum FSRM_E_STORE_NOT_INSTALLED = 0xffffffff8004532f;
enum FSRM_E_NOT_CLUSTER_VOLUME = 0xffffffff80045330;
enum FSRM_E_DIFFERENT_CLUSTER_GROUP = 0xffffffff80045331;
enum FSRM_E_REPORT_TYPE_ALREADY_EXISTS = 0xffffffff80045332;
enum FSRM_E_REPORT_JOB_ALREADY_RUNNING = 0xffffffff80045333;
enum FSRM_E_REPORT_GENERATION_ERR = 0xffffffff80045334;
enum FSRM_E_REPORT_TASK_TRIGGER = 0xffffffff80045335;
enum FSRM_E_LOADING_DISABLED_MODULE = 0xffffffff80045336;
enum FSRM_E_CANNOT_AGGREGATE = 0xffffffff80045337;
enum FSRM_E_MESSAGE_LIMIT_EXCEEDED = 0xffffffff80045338;
enum FSRM_E_OBJECT_IN_USE = 0xffffffff80045339;
enum FSRM_E_CANNOT_RENAME_PROPERTY = 0xffffffff8004533a;
enum FSRM_E_CANNOT_CHANGE_PROPERTY_TYPE = 0xffffffff8004533b;
enum FSRM_E_MAX_PROPERTY_DEFINITIONS = 0xffffffff8004533c;
enum FSRM_E_CLASSIFICATION_ALREADY_RUNNING = 0xffffffff8004533d;
enum FSRM_E_CLASSIFICATION_NOT_RUNNING = 0xffffffff8004533e;
enum FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_RUNNING = 0xffffffff8004533f;
enum FSRM_E_FILE_MANAGEMENT_JOB_EXPIRATION = 0xffffffff80045340;
enum FSRM_E_FILE_MANAGEMENT_JOB_CUSTOM = 0xffffffff80045341;
enum FSRM_E_FILE_MANAGEMENT_JOB_NOTIFICATION = 0xffffffff80045342;
enum FSRM_E_FILE_OPEN_ERROR = 0xffffffff80045343;
enum FSRM_E_UNSECURE_LINK_TO_HOSTED_MODULE = 0xffffffff80045344;
enum FSRM_E_CACHE_INVALID = 0xffffffff80045345;
enum FSRM_E_CACHE_MODULE_ALREADY_EXISTS = 0xffffffff80045346;
enum FSRM_E_FILE_MANAGEMENT_EXPIRATION_DIR_IN_SCOPE = 0xffffffff80045347;
enum FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_EXISTS = 0xffffffff80045348;
enum FSRM_E_PROPERTY_DELETED = 0xffffffff80045349;
enum FSRM_E_LAST_ACCESS_UPDATE_DISABLED = 0xffffffff80045350;
enum FSRM_E_NO_PROPERTY_VALUE = 0xffffffff80045351;
enum FSRM_E_INPROC_MODULE_BLOCKED = 0xffffffff80045352;
enum FSRM_E_ENUM_PROPERTIES_FAILED = 0xffffffff80045353;
enum FSRM_E_SET_PROPERTY_FAILED = 0xffffffff80045354;
enum FSRM_E_CANNOT_STORE_PROPERTIES = 0xffffffff80045355;
enum FSRM_E_CANNOT_ALLOW_REPARSE_POINT_TAG = 0xffffffff80045356;
enum FSRM_E_PARTIAL_CLASSIFICATION_PROPERTY_NOT_FOUND = 0xffffffff80045357;
enum FSRM_E_TEXTREADER_NOT_INITIALIZED = 0xffffffff80045358;
enum FSRM_E_TEXTREADER_IFILTER_NOT_FOUND = 0xffffffff80045359;
enum FSRM_E_PERSIST_PROPERTIES_FAILED_ENCRYPTED = 0xffffffff8004535a;
enum FSRM_E_TEXTREADER_IFILTER_CLSID_MALFORMED = 0xffffffff80045360;
enum FSRM_E_TEXTREADER_STREAM_ERROR = 0xffffffff80045361;
enum FSRM_E_TEXTREADER_FILENAME_TOO_LONG = 0xffffffff80045362;
enum FSRM_E_INCOMPATIBLE_FORMAT = 0xffffffff80045363;
enum FSRM_E_FILE_ENCRYPTED = 0xffffffff80045364;
enum FSRM_E_PERSIST_PROPERTIES_FAILED = 0xffffffff80045365;
enum FSRM_E_VOLUME_OFFLINE = 0xffffffff80045366;
enum FSRM_E_FILE_MANAGEMENT_ACTION_TIMEOUT = 0xffffffff80045367;
enum FSRM_E_FILE_MANAGEMENT_ACTION_GET_EXITCODE_FAILED = 0xffffffff80045368;
enum FSRM_E_MODULE_INVALID_PARAM = 0xffffffff80045369;
enum FSRM_E_MODULE_INITIALIZATION = 0xffffffff8004536a;
enum FSRM_E_MODULE_SESSION_INITIALIZATION = 0xffffffff8004536b;
enum FSRM_E_CLASSIFICATION_SCAN_FAIL = 0xffffffff8004536c;
enum FSRM_E_FILE_MANAGEMENT_JOB_NOT_LEGACY_ACCESSIBLE = 0xffffffff8004536d;
enum FSRM_E_FILE_MANAGEMENT_JOB_MAX_FILE_CONDITIONS = 0xffffffff8004536e;
enum FSRM_E_CANNOT_USE_DEPRECATED_PROPERTY = 0xffffffff8004536f;
enum FSRM_E_SYNC_TASK_TIMEOUT = 0xffffffff80045370;
enum FSRM_E_CANNOT_USE_DELETED_PROPERTY = 0xffffffff80045371;
enum FSRM_E_INVALID_AD_CLAIM = 0xffffffff80045372;
enum FSRM_E_CLASSIFICATION_CANCELED = 0xffffffff80045373;
enum FSRM_E_INVALID_FOLDER_PROPERTY_STORE = 0xffffffff80045374;
enum FSRM_E_REBUILDING_FODLER_TYPE_INDEX = 0xffffffff80045375;
enum FSRM_E_PROPERTY_MUST_APPLY_TO_FILES = 0xffffffff80045376;
enum FSRM_E_CLASSIFICATION_TIMEOUT = 0xffffffff80045377;
enum FSRM_E_CLASSIFICATION_PARTIAL_BATCH = 0xffffffff80045378;
enum FSRM_E_CANNOT_DELETE_SYSTEM_PROPERTY = 0xffffffff80045379;
enum FSRM_E_FILE_IN_USE = 0xffffffff8004537a;
enum FSRM_E_ERROR_NOT_ENABLED = 0xffffffff8004537b;
enum FSRM_E_CANNOT_CREATE_TEMP_COPY = 0xffffffff8004537c;
enum FSRM_E_NO_EMAIL_ADDRESS = 0xffffffff8004537d;
enum FSRM_E_ADR_MAX_EMAILS_SENT = 0xffffffff8004537e;
enum FSRM_E_PATH_NOT_IN_NAMESPACE = 0xffffffff8004537f;
enum FSRM_E_RMS_TEMPLATE_NOT_FOUND = 0xffffffff80045380;
enum FSRM_E_SECURE_PROPERTIES_NOT_SUPPORTED = 0xffffffff80045381;
enum FSRM_E_RMS_NO_PROTECTORS_INSTALLED = 0xffffffff80045382;
enum FSRM_E_RMS_NO_PROTECTOR_INSTALLED_FOR_FILE = 0xffffffff80045383;
enum FSRM_E_PROPERTY_MUST_APPLY_TO_FOLDERS = 0xffffffff80045384;
enum FSRM_E_PROPERTY_MUST_BE_SECURE = 0xffffffff80045385;
enum FSRM_E_PROPERTY_MUST_BE_GLOBAL = 0xffffffff80045386;
enum FSRM_E_WMI_FAILURE = 0xffffffff80045387;
enum FSRM_E_FILE_MANAGEMENT_JOB_RMS = 0xffffffff80045388;
enum FSRM_E_SYNC_TASK_HAD_ERRORS = 0xffffffff80045389;
enum FSRM_E_ADR_SRV_NOT_SUPPORTED = 0xffffffff80045390;
enum FSRM_E_ADR_PATH_IS_LOCAL = 0xffffffff80045391;
enum FSRM_E_ADR_NOT_DOMAIN_JOINED = 0xffffffff80045392;
enum FSRM_E_CANNOT_REMOVE_READONLY = 0xffffffff80045393;
enum FSRM_E_FILE_MANAGEMENT_JOB_INVALID_CONTINUOUS_CONFIG = 0xffffffff80045394;
enum FSRM_E_LEGACY_SCHEDULE = 0xffffffff80045395;
enum FSRM_E_CSC_PATH_NOT_SUPPORTED = 0xffffffff80045396;
enum FSRM_E_EXPIRATION_PATH_NOT_WRITEABLE = 0xffffffff80045397;
enum FSRM_E_EXPIRATION_PATH_TOO_LONG = 0xffffffff80045398;
enum FSRM_E_EXPIRATION_VOLUME_NOT_NTFS = 0xffffffff80045399;
enum FSRM_E_FILE_MANAGEMENT_JOB_DEPRECATED = 0xffffffff8004539a;
enum FSRM_E_MODULE_TIMEOUT = 0xffffffff8004539b;
alias FsrmQuotaFlags = int;
enum : int
{
    FsrmQuotaFlags_Enforce          = 0x00000100,
    FsrmQuotaFlags_Disable          = 0x00000200,
    FsrmQuotaFlags_StatusIncomplete = 0x00010000,
    FsrmQuotaFlags_StatusRebuilding = 0x00020000,
}

alias FsrmFileScreenFlags = int;
enum : int
{
    FsrmFileScreenFlags_Enforce = 0x00000001,
}

alias FsrmCollectionState = int;
enum : int
{
    FsrmCollectionState_Fetching   = 0x00000001,
    FsrmCollectionState_Committing = 0x00000002,
    FsrmCollectionState_Complete   = 0x00000003,
    FsrmCollectionState_Cancelled  = 0x00000004,
}

alias FsrmEnumOptions = int;
enum : int
{
    FsrmEnumOptions_None                     = 0x00000000,
    FsrmEnumOptions_Asynchronous             = 0x00000001,
    FsrmEnumOptions_CheckRecycleBin          = 0x00000002,
    FsrmEnumOptions_IncludeClusterNodes      = 0x00000004,
    FsrmEnumOptions_IncludeDeprecatedObjects = 0x00000008,
}

alias FsrmCommitOptions = int;
enum : int
{
    FsrmCommitOptions_None         = 0x00000000,
    FsrmCommitOptions_Asynchronous = 0x00000001,
}

alias FsrmTemplateApplyOptions = int;
enum : int
{
    FsrmTemplateApplyOptions_ApplyToDerivedMatching = 0x00000001,
    FsrmTemplateApplyOptions_ApplyToDerivedAll      = 0x00000002,
}

alias FsrmActionType = int;
enum : int
{
    FsrmActionType_Unknown  = 0x00000000,
    FsrmActionType_EventLog = 0x00000001,
    FsrmActionType_Email    = 0x00000002,
    FsrmActionType_Command  = 0x00000003,
    FsrmActionType_Report   = 0x00000004,
}

alias FsrmEventType = int;
enum : int
{
    FsrmEventType_Unknown     = 0x00000000,
    FsrmEventType_Information = 0x00000001,
    FsrmEventType_Warning     = 0x00000002,
    FsrmEventType_Error       = 0x00000003,
}

alias FsrmAccountType = int;
enum : int
{
    FsrmAccountType_Unknown        = 0x00000000,
    FsrmAccountType_NetworkService = 0x00000001,
    FsrmAccountType_LocalService   = 0x00000002,
    FsrmAccountType_LocalSystem    = 0x00000003,
    FsrmAccountType_InProc         = 0x00000004,
    FsrmAccountType_External       = 0x00000005,
    FsrmAccountType_Automatic      = 0x000001f4,
}

alias FsrmReportType = int;
enum : int
{
    FsrmReportType_Unknown                 = 0x00000000,
    FsrmReportType_LargeFiles              = 0x00000001,
    FsrmReportType_FilesByType             = 0x00000002,
    FsrmReportType_LeastRecentlyAccessed   = 0x00000003,
    FsrmReportType_MostRecentlyAccessed    = 0x00000004,
    FsrmReportType_QuotaUsage              = 0x00000005,
    FsrmReportType_FilesByOwner            = 0x00000006,
    FsrmReportType_ExportReport            = 0x00000007,
    FsrmReportType_DuplicateFiles          = 0x00000008,
    FsrmReportType_FileScreenAudit         = 0x00000009,
    FsrmReportType_FilesByProperty         = 0x0000000a,
    FsrmReportType_AutomaticClassification = 0x0000000b,
    FsrmReportType_Expiration              = 0x0000000c,
    FsrmReportType_FoldersByProperty       = 0x0000000d,
}

alias FsrmReportFormat = int;
enum : int
{
    FsrmReportFormat_Unknown = 0x00000000,
    FsrmReportFormat_DHtml   = 0x00000001,
    FsrmReportFormat_Html    = 0x00000002,
    FsrmReportFormat_Txt     = 0x00000003,
    FsrmReportFormat_Csv     = 0x00000004,
    FsrmReportFormat_Xml     = 0x00000005,
}

alias FsrmReportRunningStatus = int;
enum : int
{
    FsrmReportRunningStatus_Unknown    = 0x00000000,
    FsrmReportRunningStatus_NotRunning = 0x00000001,
    FsrmReportRunningStatus_Queued     = 0x00000002,
    FsrmReportRunningStatus_Running    = 0x00000003,
}

alias FsrmReportGenerationContext = int;
enum : int
{
    FsrmReportGenerationContext_Undefined         = 0x00000001,
    FsrmReportGenerationContext_ScheduledReport   = 0x00000002,
    FsrmReportGenerationContext_InteractiveReport = 0x00000003,
    FsrmReportGenerationContext_IncidentReport    = 0x00000004,
}

alias FsrmReportFilter = int;
enum : int
{
    FsrmReportFilter_MinSize       = 0x00000001,
    FsrmReportFilter_MinAgeDays    = 0x00000002,
    FsrmReportFilter_MaxAgeDays    = 0x00000003,
    FsrmReportFilter_MinQuotaUsage = 0x00000004,
    FsrmReportFilter_FileGroups    = 0x00000005,
    FsrmReportFilter_Owners        = 0x00000006,
    FsrmReportFilter_NamePattern   = 0x00000007,
    FsrmReportFilter_Property      = 0x00000008,
}

alias FsrmReportLimit = int;
enum : int
{
    FsrmReportLimit_MaxFiles                 = 0x00000001,
    FsrmReportLimit_MaxFileGroups            = 0x00000002,
    FsrmReportLimit_MaxOwners                = 0x00000003,
    FsrmReportLimit_MaxFilesPerFileGroup     = 0x00000004,
    FsrmReportLimit_MaxFilesPerOwner         = 0x00000005,
    FsrmReportLimit_MaxFilesPerDuplGroup     = 0x00000006,
    FsrmReportLimit_MaxDuplicateGroups       = 0x00000007,
    FsrmReportLimit_MaxQuotas                = 0x00000008,
    FsrmReportLimit_MaxFileScreenEvents      = 0x00000009,
    FsrmReportLimit_MaxPropertyValues        = 0x0000000a,
    FsrmReportLimit_MaxFilesPerPropertyValue = 0x0000000b,
    FsrmReportLimit_MaxFolders               = 0x0000000c,
}

alias FsrmPropertyDefinitionType = int;
enum : int
{
    FsrmPropertyDefinitionType_Unknown          = 0x00000000,
    FsrmPropertyDefinitionType_OrderedList      = 0x00000001,
    FsrmPropertyDefinitionType_MultiChoiceList  = 0x00000002,
    FsrmPropertyDefinitionType_SingleChoiceList = 0x00000003,
    FsrmPropertyDefinitionType_String           = 0x00000004,
    FsrmPropertyDefinitionType_MultiString      = 0x00000005,
    FsrmPropertyDefinitionType_Int              = 0x00000006,
    FsrmPropertyDefinitionType_Bool             = 0x00000007,
    FsrmPropertyDefinitionType_Date             = 0x00000008,
}

alias FsrmPropertyDefinitionFlags = int;
enum : int
{
    FsrmPropertyDefinitionFlags_Global     = 0x00000001,
    FsrmPropertyDefinitionFlags_Deprecated = 0x00000002,
    FsrmPropertyDefinitionFlags_Secure     = 0x00000004,
}

alias FsrmPropertyDefinitionAppliesTo = int;
enum : int
{
    FsrmPropertyDefinitionAppliesTo_Files   = 0x00000001,
    FsrmPropertyDefinitionAppliesTo_Folders = 0x00000002,
}

alias FsrmRuleType = int;
enum : int
{
    FsrmRuleType_Unknown        = 0x00000000,
    FsrmRuleType_Classification = 0x00000001,
    FsrmRuleType_Generic        = 0x00000002,
}

alias FsrmRuleFlags = int;
enum : int
{
    FsrmRuleFlags_Disabled                             = 0x00000100,
    FsrmRuleFlags_ClearAutomaticallyClassifiedProperty = 0x00000400,
    FsrmRuleFlags_ClearManuallyClassifiedProperty      = 0x00000800,
    FsrmRuleFlags_Invalid                              = 0x00001000,
}

alias FsrmClassificationLoggingFlags = int;
enum : int
{
    FsrmClassificationLoggingFlags_None                       = 0x00000000,
    FsrmClassificationLoggingFlags_ClassificationsInLogFile   = 0x00000001,
    FsrmClassificationLoggingFlags_ErrorsInLogFile            = 0x00000002,
    FsrmClassificationLoggingFlags_ClassificationsInSystemLog = 0x00000004,
    FsrmClassificationLoggingFlags_ErrorsInSystemLog          = 0x00000008,
}

alias FsrmExecutionOption = int;
enum : int
{
    FsrmExecutionOption_Unknown                          = 0x00000000,
    FsrmExecutionOption_EvaluateUnset                    = 0x00000001,
    FsrmExecutionOption_ReEvaluate_ConsiderExistingValue = 0x00000002,
    FsrmExecutionOption_ReEvaluate_IgnoreExistingValue   = 0x00000003,
}

alias FsrmStorageModuleCaps = int;
enum : int
{
    FsrmStorageModuleCaps_Unknown              = 0x00000000,
    FsrmStorageModuleCaps_CanGet               = 0x00000001,
    FsrmStorageModuleCaps_CanSet               = 0x00000002,
    FsrmStorageModuleCaps_CanHandleDirectories = 0x00000004,
    FsrmStorageModuleCaps_CanHandleFiles       = 0x00000008,
}

alias FsrmStorageModuleType = int;
enum : int
{
    FsrmStorageModuleType_Unknown  = 0x00000000,
    FsrmStorageModuleType_Cache    = 0x00000001,
    FsrmStorageModuleType_InFile   = 0x00000002,
    FsrmStorageModuleType_Database = 0x00000003,
    FsrmStorageModuleType_System   = 0x00000064,
}

alias FsrmPropertyBagFlags = int;
enum : int
{
    FsrmPropertyBagFlags_UpdatedByClassifier         = 0x00000001,
    FsrmPropertyBagFlags_FailedLoadingProperties     = 0x00000002,
    FsrmPropertyBagFlags_FailedSavingProperties      = 0x00000004,
    FsrmPropertyBagFlags_FailedClassifyingProperties = 0x00000008,
}

alias FsrmPropertyBagField = int;
enum : int
{
    FsrmPropertyBagField_AccessVolume   = 0x00000000,
    FsrmPropertyBagField_VolumeGuidName = 0x00000001,
}

alias FsrmPropertyFlags = int;
enum : int
{
    FsrmPropertyFlags_None                        = 0x00000000,
    FsrmPropertyFlags_Orphaned                    = 0x00000001,
    FsrmPropertyFlags_RetrievedFromCache          = 0x00000002,
    FsrmPropertyFlags_RetrievedFromStorage        = 0x00000004,
    FsrmPropertyFlags_SetByClassifier             = 0x00000008,
    FsrmPropertyFlags_Deleted                     = 0x00000010,
    FsrmPropertyFlags_Reclassified                = 0x00000020,
    FsrmPropertyFlags_AggregationFailed           = 0x00000040,
    FsrmPropertyFlags_Existing                    = 0x00000080,
    FsrmPropertyFlags_FailedLoadingProperties     = 0x00000100,
    FsrmPropertyFlags_FailedClassifyingProperties = 0x00000200,
    FsrmPropertyFlags_FailedSavingProperties      = 0x00000400,
    FsrmPropertyFlags_Secure                      = 0x00000800,
    FsrmPropertyFlags_PolicyDerived               = 0x00001000,
    FsrmPropertyFlags_Inherited                   = 0x00002000,
    FsrmPropertyFlags_Manual                      = 0x00004000,
    FsrmPropertyFlags_ExplicitValueDeleted        = 0x00008000,
    FsrmPropertyFlags_PropertyDeletedFromClear    = 0x00010000,
    FsrmPropertyFlags_PropertySourceMask          = 0x0000000e,
    FsrmPropertyFlags_PersistentMask              = 0x00005000,
}

alias FsrmPipelineModuleType = int;
enum : int
{
    FsrmPipelineModuleType_Unknown    = 0x00000000,
    FsrmPipelineModuleType_Storage    = 0x00000001,
    FsrmPipelineModuleType_Classifier = 0x00000002,
}

alias FsrmGetFilePropertyOptions = int;
enum : int
{
    FsrmGetFilePropertyOptions_None                = 0x00000000,
    FsrmGetFilePropertyOptions_NoRuleEvaluation    = 0x00000001,
    FsrmGetFilePropertyOptions_Persistent          = 0x00000002,
    FsrmGetFilePropertyOptions_FailOnPersistErrors = 0x00000004,
    FsrmGetFilePropertyOptions_SkipOrphaned        = 0x00000008,
}

alias FsrmFileManagementType = int;
enum : int
{
    FsrmFileManagementType_Unknown    = 0x00000000,
    FsrmFileManagementType_Expiration = 0x00000001,
    FsrmFileManagementType_Custom     = 0x00000002,
    FsrmFileManagementType_Rms        = 0x00000003,
}

alias FsrmFileManagementLoggingFlags = int;
enum : int
{
    FsrmFileManagementLoggingFlags_None        = 0x00000000,
    FsrmFileManagementLoggingFlags_Error       = 0x00000001,
    FsrmFileManagementLoggingFlags_Information = 0x00000002,
    FsrmFileManagementLoggingFlags_Audit       = 0x00000004,
}

alias FsrmPropertyConditionType = int;
enum : int
{
    FsrmPropertyConditionType_Unknown        = 0x00000000,
    FsrmPropertyConditionType_Equal          = 0x00000001,
    FsrmPropertyConditionType_NotEqual       = 0x00000002,
    FsrmPropertyConditionType_GreaterThan    = 0x00000003,
    FsrmPropertyConditionType_LessThan       = 0x00000004,
    FsrmPropertyConditionType_Contain        = 0x00000005,
    FsrmPropertyConditionType_Exist          = 0x00000006,
    FsrmPropertyConditionType_NotExist       = 0x00000007,
    FsrmPropertyConditionType_StartWith      = 0x00000008,
    FsrmPropertyConditionType_EndWith        = 0x00000009,
    FsrmPropertyConditionType_ContainedIn    = 0x0000000a,
    FsrmPropertyConditionType_PrefixOf       = 0x0000000b,
    FsrmPropertyConditionType_SuffixOf       = 0x0000000c,
    FsrmPropertyConditionType_MatchesPattern = 0x0000000d,
}

alias FsrmFileStreamingMode = int;
enum : int
{
    FsrmFileStreamingMode_Unknown = 0x00000000,
    FsrmFileStreamingMode_Read    = 0x00000001,
    FsrmFileStreamingMode_Write   = 0x00000002,
}

alias FsrmFileStreamingInterfaceType = int;
enum : int
{
    FsrmFileStreamingInterfaceType_Unknown    = 0x00000000,
    FsrmFileStreamingInterfaceType_ILockBytes = 0x00000001,
    FsrmFileStreamingInterfaceType_IStream    = 0x00000002,
}

alias FsrmFileConditionType = int;
enum : int
{
    FsrmFileConditionType_Unknown  = 0x00000000,
    FsrmFileConditionType_Property = 0x00000001,
}

alias FsrmFileSystemPropertyId = int;
enum : int
{
    FsrmFileSystemPropertyId_Undefined        = 0x00000000,
    FsrmFileSystemPropertyId_FileName         = 0x00000001,
    FsrmFileSystemPropertyId_DateCreated      = 0x00000002,
    FsrmFileSystemPropertyId_DateLastAccessed = 0x00000003,
    FsrmFileSystemPropertyId_DateLastModified = 0x00000004,
    FsrmFileSystemPropertyId_DateNow          = 0x00000005,
}

alias FsrmPropertyValueType = int;
enum : int
{
    FsrmPropertyValueType_Undefined  = 0x00000000,
    FsrmPropertyValueType_Literal    = 0x00000001,
    FsrmPropertyValueType_DateOffset = 0x00000002,
}

alias AdrClientDisplayFlags = int;
enum : int
{
    AdrClientDisplayFlags_AllowEmailRequests        = 0x00000001,
    AdrClientDisplayFlags_ShowDeviceTroubleshooting = 0x00000002,
}

alias AdrEmailFlags = int;
enum : int
{
    AdrEmailFlags_PutDataOwnerOnToLine = 0x00000001,
    AdrEmailFlags_PutAdminOnToLine     = 0x00000002,
    AdrEmailFlags_IncludeDeviceClaims  = 0x00000004,
    AdrEmailFlags_IncludeUserInfo      = 0x00000008,
    AdrEmailFlags_GenerateEventLog     = 0x00000010,
}

alias AdrClientErrorType = int;
enum : int
{
    AdrClientErrorType_Unknown      = 0x00000000,
    AdrClientErrorType_AccessDenied = 0x00000001,
    AdrClientErrorType_FileNotFound = 0x00000002,
}

alias AdrClientFlags = int;
enum : int
{
    AdrClientFlags_None                       = 0x00000000,
    AdrClientFlags_FailForLocalPaths          = 0x00000001,
    AdrClientFlags_FailIfNotSupportedByServer = 0x00000002,
    AdrClientFlags_FailIfNotDomainJoined      = 0x00000004,
}

enum IID_IFsrmObject = GUID(0x22bcef93, 0x4a3f, 0x4183, [0x89, 0xf9, 0x2f, 0x8b, 0x8a, 0x62, 0x8a, 0xee]);
interface IFsrmObject : IDispatch
{
    HRESULT get_Id(GUID*);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT Delete();
    HRESULT Commit();
}
enum IID_IFsrmCollection = GUID(0xf76fbf3b, 0x8ddd, 0x4b42, [0xb0, 0x5a, 0xcb, 0x1c, 0x3f, 0xf1, 0xfe, 0xe8]);
interface IFsrmCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get_State(FsrmCollectionState*);
    HRESULT Cancel();
    HRESULT WaitForCompletion(int, VARIANT_BOOL*);
    HRESULT GetById(GUID, VARIANT*);
}
enum IID_IFsrmMutableCollection = GUID(0x1bb617b8, 0x3886, 0x49dc, [0xaf, 0x82, 0xa6, 0xc9, 0xf, 0xa3, 0x5d, 0xda]);
interface IFsrmMutableCollection : IFsrmCollection
{
    HRESULT Add(VARIANT);
    HRESULT Remove(int);
    HRESULT RemoveById(GUID);
    HRESULT Clone(IFsrmMutableCollection*);
}
enum IID_IFsrmCommittableCollection = GUID(0x96deb3b5, 0x8b91, 0x4a2a, [0x9d, 0x93, 0x80, 0xa3, 0x5d, 0x8a, 0xa8, 0x47]);
interface IFsrmCommittableCollection : IFsrmMutableCollection
{
    HRESULT Commit(FsrmCommitOptions, IFsrmCollection*);
}
enum IID_IFsrmAction = GUID(0x6cd6408a, 0xae60, 0x463b, [0x9e, 0xf1, 0xe1, 0x17, 0x53, 0x4d, 0x69, 0xdc]);
interface IFsrmAction : IDispatch
{
    HRESULT get_Id(GUID*);
    HRESULT get_ActionType(FsrmActionType*);
    HRESULT get_RunLimitInterval(int*);
    HRESULT put_RunLimitInterval(int);
    HRESULT Delete();
}
enum IID_IFsrmActionEmail = GUID(0xd646567d, 0x26ae, 0x4caa, [0x9f, 0x84, 0x4e, 0xa, 0xad, 0x20, 0x7f, 0xca]);
interface IFsrmActionEmail : IFsrmAction
{
    HRESULT get_MailFrom(BSTR*);
    HRESULT put_MailFrom(BSTR);
    HRESULT get_MailReplyTo(BSTR*);
    HRESULT put_MailReplyTo(BSTR);
    HRESULT get_MailTo(BSTR*);
    HRESULT put_MailTo(BSTR);
    HRESULT get_MailCc(BSTR*);
    HRESULT put_MailCc(BSTR);
    HRESULT get_MailBcc(BSTR*);
    HRESULT put_MailBcc(BSTR);
    HRESULT get_MailSubject(BSTR*);
    HRESULT put_MailSubject(BSTR);
    HRESULT get_MessageText(BSTR*);
    HRESULT put_MessageText(BSTR);
}
enum IID_IFsrmActionEmail2 = GUID(0x8276702f, 0x2532, 0x4839, [0x89, 0xbf, 0x48, 0x72, 0x60, 0x9a, 0x2e, 0xa4]);
interface IFsrmActionEmail2 : IFsrmActionEmail
{
    HRESULT get_AttachmentFileListSize(int*);
    HRESULT put_AttachmentFileListSize(int);
}
enum IID_IFsrmActionReport = GUID(0x2dbe63c4, 0xb340, 0x48a0, [0xa5, 0xb0, 0x15, 0x8e, 0x7, 0xfc, 0x56, 0x7e]);
interface IFsrmActionReport : IFsrmAction
{
    HRESULT get_ReportTypes(SAFEARRAY**);
    HRESULT put_ReportTypes(SAFEARRAY*);
    HRESULT get_MailTo(BSTR*);
    HRESULT put_MailTo(BSTR);
}
enum IID_IFsrmActionEventLog = GUID(0x4c8f96c3, 0x5d94, 0x4f37, [0xa4, 0xf4, 0xf5, 0x6a, 0xb4, 0x63, 0x54, 0x6f]);
interface IFsrmActionEventLog : IFsrmAction
{
    HRESULT get_EventType(FsrmEventType*);
    HRESULT put_EventType(FsrmEventType);
    HRESULT get_MessageText(BSTR*);
    HRESULT put_MessageText(BSTR);
}
enum IID_IFsrmActionCommand = GUID(0x12937789, 0xe247, 0x4917, [0x9c, 0x20, 0xf3, 0xee, 0x9c, 0x7e, 0xe7, 0x83]);
interface IFsrmActionCommand : IFsrmAction
{
    HRESULT get_ExecutablePath(BSTR*);
    HRESULT put_ExecutablePath(BSTR);
    HRESULT get_Arguments(BSTR*);
    HRESULT put_Arguments(BSTR);
    HRESULT get_Account(FsrmAccountType*);
    HRESULT put_Account(FsrmAccountType);
    HRESULT get_WorkingDirectory(BSTR*);
    HRESULT put_WorkingDirectory(BSTR);
    HRESULT get_MonitorCommand(VARIANT_BOOL*);
    HRESULT put_MonitorCommand(VARIANT_BOOL);
    HRESULT get_KillTimeOut(int*);
    HRESULT put_KillTimeOut(int);
    HRESULT get_LogResult(VARIANT_BOOL*);
    HRESULT put_LogResult(VARIANT_BOOL);
}
enum IID_IFsrmSetting = GUID(0xf411d4fd, 0x14be, 0x4260, [0x8c, 0x40, 0x3, 0xb7, 0xc9, 0x5e, 0x60, 0x8a]);
interface IFsrmSetting : IDispatch
{
    HRESULT get_SmtpServer(BSTR*);
    HRESULT put_SmtpServer(BSTR);
    HRESULT get_MailFrom(BSTR*);
    HRESULT put_MailFrom(BSTR);
    HRESULT get_AdminEmail(BSTR*);
    HRESULT put_AdminEmail(BSTR);
    HRESULT get_DisableCommandLine(VARIANT_BOOL*);
    HRESULT put_DisableCommandLine(VARIANT_BOOL);
    HRESULT get_EnableScreeningAudit(VARIANT_BOOL*);
    HRESULT put_EnableScreeningAudit(VARIANT_BOOL);
    HRESULT EmailTest(BSTR);
    HRESULT SetActionRunLimitInterval(FsrmActionType, int);
    HRESULT GetActionRunLimitInterval(FsrmActionType, int*);
}
enum IID_IFsrmPathMapper = GUID(0x6f4dbfff, 0x6920, 0x4821, [0xa6, 0xc3, 0xb7, 0xe9, 0x4c, 0x1f, 0xd6, 0xc]);
interface IFsrmPathMapper : IDispatch
{
    HRESULT GetSharePathsForLocalPath(BSTR, SAFEARRAY**);
}
enum IID_IFsrmExportImport = GUID(0xefcb0ab1, 0x16c4, 0x4a79, [0x81, 0x2c, 0x72, 0x56, 0x14, 0xc3, 0x30, 0x6b]);
interface IFsrmExportImport : IDispatch
{
    HRESULT ExportFileGroups(BSTR, VARIANT*, BSTR);
    HRESULT ImportFileGroups(BSTR, VARIANT*, BSTR, IFsrmCommittableCollection*);
    HRESULT ExportFileScreenTemplates(BSTR, VARIANT*, BSTR);
    HRESULT ImportFileScreenTemplates(BSTR, VARIANT*, BSTR, IFsrmCommittableCollection*);
    HRESULT ExportQuotaTemplates(BSTR, VARIANT*, BSTR);
    HRESULT ImportQuotaTemplates(BSTR, VARIANT*, BSTR, IFsrmCommittableCollection*);
}
enum IID_IFsrmDerivedObjectsResult = GUID(0x39322a2d, 0x38ee, 0x4d0d, [0x80, 0x95, 0x42, 0x1a, 0x80, 0x84, 0x9a, 0x82]);
interface IFsrmDerivedObjectsResult : IDispatch
{
    HRESULT get_DerivedObjects(IFsrmCollection*);
    HRESULT get_Results(IFsrmCollection*);
}
enum IID_IFsrmAccessDeniedRemediationClient = GUID(0x40002314, 0x590b, 0x45a5, [0x8e, 0x1b, 0x8c, 0x5, 0xda, 0x52, 0x7e, 0x52]);
interface IFsrmAccessDeniedRemediationClient : IDispatch
{
    HRESULT Show(ulong, BSTR, AdrClientErrorType, int, BSTR, BSTR, int*);
}
enum CLSID_FsrmSetting = GUID(0xf556d708, 0x6d4d, 0x4594, [0x9c, 0x61, 0x7d, 0xbb, 0xd, 0xae, 0x2a, 0x46]);
struct FsrmSetting
{
}
enum CLSID_FsrmPathMapper = GUID(0xf3be42bd, 0x8ac2, 0x409e, [0xbb, 0xd8, 0xfa, 0xf9, 0xb6, 0xb4, 0x1f, 0xeb]);
struct FsrmPathMapper
{
}
enum CLSID_FsrmExportImport = GUID(0x1482dc37, 0xfae9, 0x4787, [0x90, 0x25, 0x8c, 0xe4, 0xe0, 0x24, 0xab, 0x56]);
struct FsrmExportImport
{
}
enum CLSID_FsrmQuotaManager = GUID(0x90dcab7f, 0x347c, 0x4bfc, [0xb5, 0x43, 0x54, 0x3, 0x26, 0x30, 0x5f, 0xbe]);
struct FsrmQuotaManager
{
}
enum CLSID_FsrmQuotaTemplateManager = GUID(0x97d3d443, 0x251c, 0x4337, [0x81, 0xe7, 0xb3, 0x2e, 0x8f, 0x4e, 0xe6, 0x5e]);
struct FsrmQuotaTemplateManager
{
}
enum CLSID_FsrmFileGroupManager = GUID(0x8f1363f6, 0x656f, 0x4496, [0x92, 0x26, 0x13, 0xae, 0xcb, 0xd7, 0x71, 0x8f]);
struct FsrmFileGroupManager
{
}
enum CLSID_FsrmFileScreenManager = GUID(0x95941183, 0xdb53, 0x4c5f, [0xb3, 0x7b, 0x7d, 0x9, 0x21, 0xcf, 0x9d, 0xc7]);
struct FsrmFileScreenManager
{
}
enum CLSID_FsrmFileScreenTemplateManager = GUID(0x243111df, 0xe474, 0x46aa, [0xa0, 0x54, 0xea, 0xa3, 0x3e, 0xdc, 0x29, 0x2a]);
struct FsrmFileScreenTemplateManager
{
}
enum CLSID_FsrmReportManager = GUID(0x58ef37, 0xaa66, 0x4c48, [0xbd, 0x5b, 0x2f, 0xce, 0x43, 0x2a, 0xb0, 0xc8]);
struct FsrmReportManager
{
}
enum CLSID_FsrmReportScheduler = GUID(0xea25f1b8, 0x1b8d, 0x4290, [0x8e, 0xe8, 0xe1, 0x7c, 0x12, 0xc2, 0xfe, 0x20]);
struct FsrmReportScheduler
{
}
enum CLSID_FsrmFileManagementJobManager = GUID(0xeb18f9b2, 0x4c3a, 0x4321, [0xb2, 0x3, 0x20, 0x51, 0x20, 0xcf, 0xf6, 0x14]);
struct FsrmFileManagementJobManager
{
}
enum CLSID_FsrmClassificationManager = GUID(0xb15c0e47, 0xc391, 0x45b9, [0x95, 0xc8, 0xeb, 0x59, 0x6c, 0x85, 0x3f, 0x3a]);
struct FsrmClassificationManager
{
}
enum CLSID_FsrmPipelineModuleConnector = GUID(0xc7643375, 0x1eb5, 0x44de, [0xa0, 0x62, 0x62, 0x35, 0x47, 0xd9, 0x33, 0xbc]);
struct FsrmPipelineModuleConnector
{
}
enum CLSID_AdSyncTask = GUID(0x2ae64751, 0xb728, 0x4d6b, [0x97, 0xa0, 0xb2, 0xda, 0x2e, 0x7d, 0x2a, 0x3b]);
struct AdSyncTask
{
}
enum CLSID_FsrmAccessDeniedRemediationClient = GUID(0x100b4fc8, 0x74c1, 0x470f, [0xb1, 0xb7, 0xdd, 0x7b, 0x6b, 0xae, 0x79, 0xbd]);
struct FsrmAccessDeniedRemediationClient
{
}
enum IID_IFsrmQuotaBase = GUID(0x1568a795, 0x3924, 0x4118, [0xb7, 0x4b, 0x68, 0xd8, 0xf0, 0xfa, 0x5d, 0xaf]);
interface IFsrmQuotaBase : IFsrmObject
{
    HRESULT get_QuotaLimit(VARIANT*);
    HRESULT put_QuotaLimit(VARIANT);
    HRESULT get_QuotaFlags(int*);
    HRESULT put_QuotaFlags(int);
    HRESULT get_Thresholds(SAFEARRAY**);
    HRESULT AddThreshold(int);
    HRESULT DeleteThreshold(int);
    HRESULT ModifyThreshold(int, int);
    HRESULT CreateThresholdAction(int, FsrmActionType, IFsrmAction*);
    HRESULT EnumThresholdActions(int, IFsrmCollection*);
}
enum IID_IFsrmQuotaObject = GUID(0x42dc3511, 0x61d5, 0x48ae, [0xb6, 0xdc, 0x59, 0xfc, 0x0, 0xc0, 0xa8, 0xd6]);
interface IFsrmQuotaObject : IFsrmQuotaBase
{
    HRESULT get_Path(BSTR*);
    HRESULT get_UserSid(BSTR*);
    HRESULT get_UserAccount(BSTR*);
    HRESULT get_SourceTemplateName(BSTR*);
    HRESULT get_MatchesSourceTemplate(VARIANT_BOOL*);
    HRESULT ApplyTemplate(BSTR);
}
enum IID_IFsrmQuota = GUID(0x377f739d, 0x9647, 0x4b8e, [0x97, 0xd2, 0x5f, 0xfc, 0xe6, 0xd7, 0x59, 0xcd]);
interface IFsrmQuota : IFsrmQuotaObject
{
    HRESULT get_QuotaUsed(VARIANT*);
    HRESULT get_QuotaPeakUsage(VARIANT*);
    HRESULT get_QuotaPeakUsageTime(double*);
    HRESULT ResetPeakUsage();
    HRESULT RefreshUsageProperties();
}
enum IID_IFsrmAutoApplyQuota = GUID(0xf82e5729, 0x6aba, 0x4740, [0xbf, 0xc7, 0xc7, 0xf5, 0x8f, 0x75, 0xfb, 0x7b]);
interface IFsrmAutoApplyQuota : IFsrmQuotaObject
{
    HRESULT get_ExcludeFolders(SAFEARRAY**);
    HRESULT put_ExcludeFolders(SAFEARRAY*);
    HRESULT CommitAndUpdateDerived(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*);
}
enum IID_IFsrmQuotaManager = GUID(0x8bb68c7d, 0x19d8, 0x4ffb, [0x80, 0x9e, 0xbe, 0x4f, 0xc1, 0x73, 0x40, 0x14]);
interface IFsrmQuotaManager : IDispatch
{
    HRESULT get_ActionVariables(SAFEARRAY**);
    HRESULT get_ActionVariableDescriptions(SAFEARRAY**);
    HRESULT CreateQuota(BSTR, IFsrmQuota*);
    HRESULT CreateAutoApplyQuota(BSTR, BSTR, IFsrmAutoApplyQuota*);
    HRESULT GetQuota(BSTR, IFsrmQuota*);
    HRESULT GetAutoApplyQuota(BSTR, IFsrmAutoApplyQuota*);
    HRESULT GetRestrictiveQuota(BSTR, IFsrmQuota*);
    HRESULT EnumQuotas(BSTR, FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT EnumAutoApplyQuotas(BSTR, FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT EnumEffectiveQuotas(BSTR, FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT Scan(BSTR);
    HRESULT CreateQuotaCollection(IFsrmCommittableCollection*);
}
enum IID_IFsrmQuotaManagerEx = GUID(0x4846cb01, 0xd430, 0x494f, [0xab, 0xb4, 0xb1, 0x5, 0x49, 0x99, 0xfb, 0x9]);
interface IFsrmQuotaManagerEx : IFsrmQuotaManager
{
    HRESULT IsAffectedByQuota(BSTR, FsrmEnumOptions, VARIANT_BOOL*);
}
enum IID_IFsrmQuotaTemplate = GUID(0xa2efab31, 0x295e, 0x46bb, [0xb9, 0x76, 0xe8, 0x6d, 0x58, 0xb5, 0x2e, 0x8b]);
interface IFsrmQuotaTemplate : IFsrmQuotaBase
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT CopyTemplate(BSTR);
    HRESULT CommitAndUpdateDerived(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*);
}
enum IID_IFsrmQuotaTemplateImported = GUID(0x9a2bf113, 0xa329, 0x44cc, [0x80, 0x9a, 0x5c, 0x0, 0xfc, 0xe8, 0xda, 0x40]);
interface IFsrmQuotaTemplateImported : IFsrmQuotaTemplate
{
    HRESULT get_OverwriteOnCommit(VARIANT_BOOL*);
    HRESULT put_OverwriteOnCommit(VARIANT_BOOL);
}
enum IID_IFsrmQuotaTemplateManager = GUID(0x4173ac41, 0x172d, 0x4d52, [0x96, 0x3c, 0xfd, 0xc7, 0xe4, 0x15, 0xf7, 0x17]);
interface IFsrmQuotaTemplateManager : IDispatch
{
    HRESULT CreateTemplate(IFsrmQuotaTemplate*);
    HRESULT GetTemplate(BSTR, IFsrmQuotaTemplate*);
    HRESULT EnumTemplates(FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT ExportTemplates(VARIANT*, BSTR*);
    HRESULT ImportTemplates(BSTR, VARIANT*, IFsrmCommittableCollection*);
}
enum IID_IFsrmFileGroup = GUID(0x8dd04909, 0xe34, 0x4d55, [0xaf, 0xaa, 0x89, 0xe1, 0xf1, 0xa1, 0xbb, 0xb9]);
interface IFsrmFileGroup : IFsrmObject
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Members(IFsrmMutableCollection*);
    HRESULT put_Members(IFsrmMutableCollection);
    HRESULT get_NonMembers(IFsrmMutableCollection*);
    HRESULT put_NonMembers(IFsrmMutableCollection);
}
enum IID_IFsrmFileGroupImported = GUID(0xad55f10b, 0x5f11, 0x4be7, [0x94, 0xef, 0xd9, 0xee, 0x2e, 0x47, 0xd, 0xed]);
interface IFsrmFileGroupImported : IFsrmFileGroup
{
    HRESULT get_OverwriteOnCommit(VARIANT_BOOL*);
    HRESULT put_OverwriteOnCommit(VARIANT_BOOL);
}
enum IID_IFsrmFileGroupManager = GUID(0x426677d5, 0x18c, 0x485c, [0x8a, 0x51, 0x20, 0xb8, 0x6d, 0x0, 0xbd, 0xc4]);
interface IFsrmFileGroupManager : IDispatch
{
    HRESULT CreateFileGroup(IFsrmFileGroup*);
    HRESULT GetFileGroup(BSTR, IFsrmFileGroup*);
    HRESULT EnumFileGroups(FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT ExportFileGroups(VARIANT*, BSTR*);
    HRESULT ImportFileGroups(BSTR, VARIANT*, IFsrmCommittableCollection*);
}
enum IID_IFsrmFileScreenBase = GUID(0xf3637e80, 0x5b22, 0x4a2b, [0xa6, 0x37, 0xbb, 0xb6, 0x42, 0xb4, 0x1c, 0xfc]);
interface IFsrmFileScreenBase : IFsrmObject
{
    HRESULT get_BlockedFileGroups(IFsrmMutableCollection*);
    HRESULT put_BlockedFileGroups(IFsrmMutableCollection);
    HRESULT get_FileScreenFlags(int*);
    HRESULT put_FileScreenFlags(int);
    HRESULT CreateAction(FsrmActionType, IFsrmAction*);
    HRESULT EnumActions(IFsrmCollection*);
}
enum IID_IFsrmFileScreen = GUID(0x5f6325d3, 0xce88, 0x4733, [0x84, 0xc1, 0x2d, 0x6a, 0xef, 0xc5, 0xea, 0x7]);
interface IFsrmFileScreen : IFsrmFileScreenBase
{
    HRESULT get_Path(BSTR*);
    HRESULT get_SourceTemplateName(BSTR*);
    HRESULT get_MatchesSourceTemplate(VARIANT_BOOL*);
    HRESULT get_UserSid(BSTR*);
    HRESULT get_UserAccount(BSTR*);
    HRESULT ApplyTemplate(BSTR);
}
enum IID_IFsrmFileScreenException = GUID(0xbee7ce02, 0xdf77, 0x4515, [0x93, 0x89, 0x78, 0xf0, 0x1c, 0x5a, 0xfc, 0x1a]);
interface IFsrmFileScreenException : IFsrmObject
{
    HRESULT get_Path(BSTR*);
    HRESULT get_AllowedFileGroups(IFsrmMutableCollection*);
    HRESULT put_AllowedFileGroups(IFsrmMutableCollection);
}
enum IID_IFsrmFileScreenManager = GUID(0xff4fa04e, 0x5a94, 0x4bda, [0xa3, 0xa0, 0xd5, 0xb4, 0xd3, 0xc5, 0x2e, 0xba]);
interface IFsrmFileScreenManager : IDispatch
{
    HRESULT get_ActionVariables(SAFEARRAY**);
    HRESULT get_ActionVariableDescriptions(SAFEARRAY**);
    HRESULT CreateFileScreen(BSTR, IFsrmFileScreen*);
    HRESULT GetFileScreen(BSTR, IFsrmFileScreen*);
    HRESULT EnumFileScreens(BSTR, FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT CreateFileScreenException(BSTR, IFsrmFileScreenException*);
    HRESULT GetFileScreenException(BSTR, IFsrmFileScreenException*);
    HRESULT EnumFileScreenExceptions(BSTR, FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT CreateFileScreenCollection(IFsrmCommittableCollection*);
}
enum IID_IFsrmFileScreenTemplate = GUID(0x205bebf8, 0xdd93, 0x452a, [0x95, 0xa6, 0x32, 0xb5, 0x66, 0xb3, 0x58, 0x28]);
interface IFsrmFileScreenTemplate : IFsrmFileScreenBase
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT CopyTemplate(BSTR);
    HRESULT CommitAndUpdateDerived(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*);
}
enum IID_IFsrmFileScreenTemplateImported = GUID(0xe1010359, 0x3e5d, 0x4ecd, [0x9f, 0xe4, 0xef, 0x48, 0x62, 0x2f, 0xdf, 0x30]);
interface IFsrmFileScreenTemplateImported : IFsrmFileScreenTemplate
{
    HRESULT get_OverwriteOnCommit(VARIANT_BOOL*);
    HRESULT put_OverwriteOnCommit(VARIANT_BOOL);
}
enum IID_IFsrmFileScreenTemplateManager = GUID(0xcfe36cba, 0x1949, 0x4e74, [0xa1, 0x4f, 0xf1, 0xd5, 0x80, 0xce, 0xaf, 0x13]);
interface IFsrmFileScreenTemplateManager : IDispatch
{
    HRESULT CreateTemplate(IFsrmFileScreenTemplate*);
    HRESULT GetTemplate(BSTR, IFsrmFileScreenTemplate*);
    HRESULT EnumTemplates(FsrmEnumOptions, IFsrmCommittableCollection*);
    HRESULT ExportTemplates(VARIANT*, BSTR*);
    HRESULT ImportTemplates(BSTR, VARIANT*, IFsrmCommittableCollection*);
}
enum IID_IFsrmReportManager = GUID(0x27b899fe, 0x6ffa, 0x4481, [0xa1, 0x84, 0xd3, 0xda, 0xad, 0xe8, 0xa0, 0x2b]);
interface IFsrmReportManager : IDispatch
{
    HRESULT EnumReportJobs(FsrmEnumOptions, IFsrmCollection*);
    HRESULT CreateReportJob(IFsrmReportJob*);
    HRESULT GetReportJob(BSTR, IFsrmReportJob*);
    HRESULT GetOutputDirectory(FsrmReportGenerationContext, BSTR*);
    HRESULT SetOutputDirectory(FsrmReportGenerationContext, BSTR);
    HRESULT IsFilterValidForReportType(FsrmReportType, FsrmReportFilter, VARIANT_BOOL*);
    HRESULT GetDefaultFilter(FsrmReportType, FsrmReportFilter, VARIANT*);
    HRESULT SetDefaultFilter(FsrmReportType, FsrmReportFilter, VARIANT);
    HRESULT GetReportSizeLimit(FsrmReportLimit, VARIANT*);
    HRESULT SetReportSizeLimit(FsrmReportLimit, VARIANT);
}
enum IID_IFsrmReportJob = GUID(0x38e87280, 0x715c, 0x4c7d, [0xa2, 0x80, 0xea, 0x16, 0x51, 0xa1, 0x9f, 0xef]);
interface IFsrmReportJob : IFsrmObject
{
    HRESULT get_Task(BSTR*);
    HRESULT put_Task(BSTR);
    HRESULT get_NamespaceRoots(SAFEARRAY**);
    HRESULT put_NamespaceRoots(SAFEARRAY*);
    HRESULT get_Formats(SAFEARRAY**);
    HRESULT put_Formats(SAFEARRAY*);
    HRESULT get_MailTo(BSTR*);
    HRESULT put_MailTo(BSTR);
    HRESULT get_RunningStatus(FsrmReportRunningStatus*);
    HRESULT get_LastRun(double*);
    HRESULT get_LastError(BSTR*);
    HRESULT get_LastGeneratedInDirectory(BSTR*);
    HRESULT EnumReports(IFsrmCollection*);
    HRESULT CreateReport(FsrmReportType, IFsrmReport*);
    HRESULT Run(FsrmReportGenerationContext);
    HRESULT WaitForCompletion(int, VARIANT_BOOL*);
    HRESULT Cancel();
}
enum IID_IFsrmReport = GUID(0xd8cc81d9, 0x46b8, 0x4fa4, [0xbf, 0xa5, 0x4a, 0xa9, 0xde, 0xc9, 0xb6, 0x38]);
interface IFsrmReport : IDispatch
{
    HRESULT get_Type(FsrmReportType*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_LastGeneratedFileNamePrefix(BSTR*);
    HRESULT GetFilter(FsrmReportFilter, VARIANT*);
    HRESULT SetFilter(FsrmReportFilter, VARIANT);
    HRESULT Delete();
}
enum IID_IFsrmReportScheduler = GUID(0x6879caf9, 0x6617, 0x4484, [0x87, 0x19, 0x71, 0xc3, 0xd8, 0x64, 0x5f, 0x94]);
interface IFsrmReportScheduler : IDispatch
{
    HRESULT VerifyNamespaces(VARIANT*);
    HRESULT CreateScheduleTask(BSTR, VARIANT*, BSTR);
    HRESULT ModifyScheduleTask(BSTR, VARIANT*, BSTR);
    HRESULT DeleteScheduleTask(BSTR);
}
enum IID_IFsrmFileManagementJobManager = GUID(0xee321ecb, 0xd95e, 0x48e9, [0x90, 0x7c, 0xc7, 0x68, 0x5a, 0x1, 0x32, 0x35]);
interface IFsrmFileManagementJobManager : IDispatch
{
    HRESULT get_ActionVariables(SAFEARRAY**);
    HRESULT get_ActionVariableDescriptions(SAFEARRAY**);
    HRESULT EnumFileManagementJobs(FsrmEnumOptions, IFsrmCollection*);
    HRESULT CreateFileManagementJob(IFsrmFileManagementJob*);
    HRESULT GetFileManagementJob(BSTR, IFsrmFileManagementJob*);
}
enum IID_IFsrmFileManagementJob = GUID(0x770687e, 0x9f36, 0x4d6f, [0x87, 0x78, 0x59, 0x9d, 0x18, 0x84, 0x61, 0xc9]);
interface IFsrmFileManagementJob : IFsrmObject
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_NamespaceRoots(SAFEARRAY**);
    HRESULT put_NamespaceRoots(SAFEARRAY*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_OperationType(FsrmFileManagementType*);
    HRESULT put_OperationType(FsrmFileManagementType);
    HRESULT get_ExpirationDirectory(BSTR*);
    HRESULT put_ExpirationDirectory(BSTR);
    HRESULT get_CustomAction(IFsrmActionCommand*);
    HRESULT get_Notifications(SAFEARRAY**);
    HRESULT get_Logging(int*);
    HRESULT put_Logging(int);
    HRESULT get_ReportEnabled(VARIANT_BOOL*);
    HRESULT put_ReportEnabled(VARIANT_BOOL);
    HRESULT get_Formats(SAFEARRAY**);
    HRESULT put_Formats(SAFEARRAY*);
    HRESULT get_MailTo(BSTR*);
    HRESULT put_MailTo(BSTR);
    HRESULT get_DaysSinceFileCreated(int*);
    HRESULT put_DaysSinceFileCreated(int);
    HRESULT get_DaysSinceFileLastAccessed(int*);
    HRESULT put_DaysSinceFileLastAccessed(int);
    HRESULT get_DaysSinceFileLastModified(int*);
    HRESULT put_DaysSinceFileLastModified(int);
    HRESULT get_PropertyConditions(IFsrmCollection*);
    HRESULT get_FromDate(double*);
    HRESULT put_FromDate(double);
    HRESULT get_Task(BSTR*);
    HRESULT put_Task(BSTR);
    HRESULT get_Parameters(SAFEARRAY**);
    HRESULT put_Parameters(SAFEARRAY*);
    HRESULT get_RunningStatus(FsrmReportRunningStatus*);
    HRESULT get_LastError(BSTR*);
    HRESULT get_LastReportPathWithoutExtension(BSTR*);
    HRESULT get_LastRun(double*);
    HRESULT get_FileNamePattern(BSTR*);
    HRESULT put_FileNamePattern(BSTR);
    HRESULT Run(FsrmReportGenerationContext);
    HRESULT WaitForCompletion(int, VARIANT_BOOL*);
    HRESULT Cancel();
    HRESULT AddNotification(int);
    HRESULT DeleteNotification(int);
    HRESULT ModifyNotification(int, int);
    HRESULT CreateNotificationAction(int, FsrmActionType, IFsrmAction*);
    HRESULT EnumNotificationActions(int, IFsrmCollection*);
    HRESULT CreatePropertyCondition(BSTR, IFsrmPropertyCondition*);
    HRESULT CreateCustomAction(IFsrmActionCommand*);
}
enum IID_IFsrmPropertyCondition = GUID(0x326af66f, 0x2ac0, 0x4f68, [0xbf, 0x8c, 0x47, 0x59, 0xf0, 0x54, 0xfa, 0x29]);
interface IFsrmPropertyCondition : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Type(FsrmPropertyConditionType*);
    HRESULT put_Type(FsrmPropertyConditionType);
    HRESULT get_Value(BSTR*);
    HRESULT put_Value(BSTR);
    HRESULT Delete();
}
enum IID_IFsrmFileCondition = GUID(0x70684ffc, 0x691a, 0x4a1a, [0xb9, 0x22, 0x97, 0x75, 0x2e, 0x13, 0x8c, 0xc1]);
interface IFsrmFileCondition : IDispatch
{
    HRESULT get_Type(FsrmFileConditionType*);
    HRESULT Delete();
}
enum IID_IFsrmFileConditionProperty = GUID(0x81926775, 0xb981, 0x4479, [0x98, 0x8f, 0xda, 0x17, 0x1d, 0x62, 0x73, 0x60]);
interface IFsrmFileConditionProperty : IFsrmFileCondition
{
    HRESULT get_PropertyName(BSTR*);
    HRESULT put_PropertyName(BSTR);
    HRESULT get_PropertyId(FsrmFileSystemPropertyId*);
    HRESULT put_PropertyId(FsrmFileSystemPropertyId);
    HRESULT get_Operator(FsrmPropertyConditionType*);
    HRESULT put_Operator(FsrmPropertyConditionType);
    HRESULT get_ValueType(FsrmPropertyValueType*);
    HRESULT put_ValueType(FsrmPropertyValueType);
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT);
}
enum IID_IFsrmPropertyDefinition = GUID(0xede0150f, 0xe9a3, 0x419c, [0x87, 0x7c, 0x1, 0xfe, 0x5d, 0x24, 0xc5, 0xd3]);
interface IFsrmPropertyDefinition : IFsrmObject
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Type(FsrmPropertyDefinitionType*);
    HRESULT put_Type(FsrmPropertyDefinitionType);
    HRESULT get_PossibleValues(SAFEARRAY**);
    HRESULT put_PossibleValues(SAFEARRAY*);
    HRESULT get_ValueDescriptions(SAFEARRAY**);
    HRESULT put_ValueDescriptions(SAFEARRAY*);
    HRESULT get_Parameters(SAFEARRAY**);
    HRESULT put_Parameters(SAFEARRAY*);
}
enum IID_IFsrmPropertyDefinition2 = GUID(0x47782152, 0xd16c, 0x4229, [0xb4, 0xe1, 0xd, 0xdf, 0xe3, 0x8, 0xb9, 0xf6]);
interface IFsrmPropertyDefinition2 : IFsrmPropertyDefinition
{
    HRESULT get_PropertyDefinitionFlags(int*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_AppliesTo(int*);
    HRESULT get_ValueDefinitions(IFsrmCollection*);
}
enum IID_IFsrmPropertyDefinitionValue = GUID(0xe946d148, 0xbd67, 0x4178, [0x8e, 0x22, 0x1c, 0x44, 0x92, 0x5e, 0xd7, 0x10]);
interface IFsrmPropertyDefinitionValue : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT get_Description(BSTR*);
    HRESULT get_UniqueID(BSTR*);
}
enum IID_IFsrmProperty = GUID(0x4a73fee4, 0x4102, 0x4fcc, [0x9f, 0xfb, 0x38, 0x61, 0x4f, 0x9e, 0xe7, 0x68]);
interface IFsrmProperty : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Value(BSTR*);
    HRESULT get_Sources(SAFEARRAY**);
    HRESULT get_PropertyFlags(int*);
}
enum IID_IFsrmRule = GUID(0xcb0df960, 0x16f5, 0x4495, [0x90, 0x79, 0x3f, 0x93, 0x60, 0xd8, 0x31, 0xdf]);
interface IFsrmRule : IFsrmObject
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_RuleType(FsrmRuleType*);
    HRESULT get_ModuleDefinitionName(BSTR*);
    HRESULT put_ModuleDefinitionName(BSTR);
    HRESULT get_NamespaceRoots(SAFEARRAY**);
    HRESULT put_NamespaceRoots(SAFEARRAY*);
    HRESULT get_RuleFlags(int*);
    HRESULT put_RuleFlags(int);
    HRESULT get_Parameters(SAFEARRAY**);
    HRESULT put_Parameters(SAFEARRAY*);
    HRESULT get_LastModified(VARIANT*);
}
enum IID_IFsrmClassificationRule = GUID(0xafc052c2, 0x5315, 0x45ab, [0x84, 0x1b, 0xc6, 0xdb, 0xe, 0x12, 0x1, 0x48]);
interface IFsrmClassificationRule : IFsrmRule
{
    HRESULT get_ExecutionOption(FsrmExecutionOption*);
    HRESULT put_ExecutionOption(FsrmExecutionOption);
    HRESULT get_PropertyAffected(BSTR*);
    HRESULT put_PropertyAffected(BSTR);
    HRESULT get_Value(BSTR*);
    HRESULT put_Value(BSTR);
}
enum IID_IFsrmPipelineModuleDefinition = GUID(0x515c1277, 0x2c81, 0x440e, [0x8f, 0xcf, 0x36, 0x79, 0x21, 0xed, 0x4f, 0x59]);
interface IFsrmPipelineModuleDefinition : IFsrmObject
{
    HRESULT get_ModuleClsid(BSTR*);
    HRESULT put_ModuleClsid(BSTR);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Company(BSTR*);
    HRESULT put_Company(BSTR);
    HRESULT get_Version(BSTR*);
    HRESULT put_Version(BSTR);
    HRESULT get_ModuleType(FsrmPipelineModuleType*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_NeedsFileContent(VARIANT_BOOL*);
    HRESULT put_NeedsFileContent(VARIANT_BOOL);
    HRESULT get_Account(FsrmAccountType*);
    HRESULT put_Account(FsrmAccountType);
    HRESULT get_SupportedExtensions(SAFEARRAY**);
    HRESULT put_SupportedExtensions(SAFEARRAY*);
    HRESULT get_Parameters(SAFEARRAY**);
    HRESULT put_Parameters(SAFEARRAY*);
}
enum IID_IFsrmClassifierModuleDefinition = GUID(0xbb36ea26, 0x6318, 0x4b8c, [0x85, 0x92, 0xf7, 0x2d, 0xd6, 0x2, 0xe7, 0xa5]);
interface IFsrmClassifierModuleDefinition : IFsrmPipelineModuleDefinition
{
    HRESULT get_PropertiesAffected(SAFEARRAY**);
    HRESULT put_PropertiesAffected(SAFEARRAY*);
    HRESULT get_PropertiesUsed(SAFEARRAY**);
    HRESULT put_PropertiesUsed(SAFEARRAY*);
    HRESULT get_NeedsExplicitValue(VARIANT_BOOL*);
    HRESULT put_NeedsExplicitValue(VARIANT_BOOL);
}
enum IID_IFsrmStorageModuleDefinition = GUID(0x15a81350, 0x497d, 0x4aba, [0x80, 0xe9, 0xd4, 0xdb, 0xcc, 0x55, 0x21, 0xfe]);
interface IFsrmStorageModuleDefinition : IFsrmPipelineModuleDefinition
{
    HRESULT get_Capabilities(FsrmStorageModuleCaps*);
    HRESULT put_Capabilities(FsrmStorageModuleCaps);
    HRESULT get_StorageType(FsrmStorageModuleType*);
    HRESULT put_StorageType(FsrmStorageModuleType);
    HRESULT get_UpdatesFileContent(VARIANT_BOOL*);
    HRESULT put_UpdatesFileContent(VARIANT_BOOL);
}
enum IID_IFsrmClassificationManager = GUID(0xd2dc89da, 0xee91, 0x48a0, [0x85, 0xd8, 0xcc, 0x72, 0xa5, 0x6f, 0x7d, 0x4]);
interface IFsrmClassificationManager : IDispatch
{
    HRESULT get_ClassificationReportFormats(SAFEARRAY**);
    HRESULT put_ClassificationReportFormats(SAFEARRAY*);
    HRESULT get_Logging(int*);
    HRESULT put_Logging(int);
    HRESULT get_ClassificationReportMailTo(BSTR*);
    HRESULT put_ClassificationReportMailTo(BSTR);
    HRESULT get_ClassificationReportEnabled(VARIANT_BOOL*);
    HRESULT put_ClassificationReportEnabled(VARIANT_BOOL);
    HRESULT get_ClassificationLastReportPathWithoutExtension(BSTR*);
    HRESULT get_ClassificationLastError(BSTR*);
    HRESULT get_ClassificationRunningStatus(FsrmReportRunningStatus*);
    HRESULT EnumPropertyDefinitions(FsrmEnumOptions, IFsrmCollection*);
    HRESULT CreatePropertyDefinition(IFsrmPropertyDefinition*);
    HRESULT GetPropertyDefinition(BSTR, IFsrmPropertyDefinition*);
    HRESULT EnumRules(FsrmRuleType, FsrmEnumOptions, IFsrmCollection*);
    HRESULT CreateRule(FsrmRuleType, IFsrmRule*);
    HRESULT GetRule(BSTR, FsrmRuleType, IFsrmRule*);
    HRESULT EnumModuleDefinitions(FsrmPipelineModuleType, FsrmEnumOptions, IFsrmCollection*);
    HRESULT CreateModuleDefinition(FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*);
    HRESULT GetModuleDefinition(BSTR, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*);
    HRESULT RunClassification(FsrmReportGenerationContext, BSTR);
    HRESULT WaitForClassificationCompletion(int, VARIANT_BOOL*);
    HRESULT CancelClassification();
    HRESULT EnumFileProperties(BSTR, FsrmGetFilePropertyOptions, IFsrmCollection*);
    HRESULT GetFileProperty(BSTR, BSTR, FsrmGetFilePropertyOptions, IFsrmProperty*);
    HRESULT SetFileProperty(BSTR, BSTR, BSTR);
    HRESULT ClearFileProperty(BSTR, BSTR);
}
enum IID_IFsrmClassificationManager2 = GUID(0x4c1c9, 0x127e, 0x4765, [0xba, 0x7, 0x6a, 0x31, 0x47, 0xbc, 0xa1, 0x12]);
interface IFsrmClassificationManager2 : IFsrmClassificationManager
{
    HRESULT ClassifyFiles(SAFEARRAY*, SAFEARRAY*, SAFEARRAY*, FsrmGetFilePropertyOptions);
}
enum IID_IFsrmPropertyBag = GUID(0x774589d1, 0xd300, 0x4f7a, [0x9a, 0x24, 0xf7, 0xb7, 0x66, 0x80, 0x2, 0x50]);
interface IFsrmPropertyBag : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_RelativePath(BSTR*);
    HRESULT get_VolumeName(BSTR*);
    HRESULT get_RelativeNamespaceRoot(BSTR*);
    HRESULT get_VolumeIndex(uint*);
    HRESULT get_FileId(VARIANT*);
    HRESULT get_ParentDirectoryId(VARIANT*);
    HRESULT get_Size(VARIANT*);
    HRESULT get_SizeAllocated(VARIANT*);
    HRESULT get_CreationTime(VARIANT*);
    HRESULT get_LastAccessTime(VARIANT*);
    HRESULT get_LastModificationTime(VARIANT*);
    HRESULT get_Attributes(uint*);
    HRESULT get_OwnerSid(BSTR*);
    HRESULT get_FilePropertyNames(SAFEARRAY**);
    HRESULT get_Messages(SAFEARRAY**);
    HRESULT get_PropertyBagFlags(uint*);
    HRESULT GetFileProperty(BSTR, IFsrmProperty*);
    HRESULT SetFileProperty(BSTR, BSTR);
    HRESULT AddMessage(BSTR);
    HRESULT GetFileStreamInterface(FsrmFileStreamingMode, FsrmFileStreamingInterfaceType, VARIANT*);
}
enum IID_IFsrmPropertyBag2 = GUID(0xe46bdbd, 0x2402, 0x4fed, [0x9c, 0x30, 0x92, 0x66, 0xe6, 0xeb, 0x2c, 0xc9]);
interface IFsrmPropertyBag2 : IFsrmPropertyBag
{
    HRESULT GetFieldValue(FsrmPropertyBagField, VARIANT*);
    HRESULT GetUntrustedInFileProperties(IFsrmCollection*);
}
enum IID_IFsrmPipelineModuleImplementation = GUID(0xb7907906, 0x2b02, 0x4cb5, [0x84, 0xa9, 0xfd, 0xf5, 0x46, 0x13, 0xd6, 0xcd]);
interface IFsrmPipelineModuleImplementation : IDispatch
{
    HRESULT OnLoad(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*);
    HRESULT OnUnload();
}
enum IID_IFsrmClassifierModuleImplementation = GUID(0x4c968fc6, 0x6edb, 0x4051, [0x9c, 0x18, 0x73, 0xb7, 0x29, 0x1a, 0xe1, 0x6]);
interface IFsrmClassifierModuleImplementation : IFsrmPipelineModuleImplementation
{
    HRESULT get_LastModified(VARIANT*);
    HRESULT UseRulesAndDefinitions(IFsrmCollection, IFsrmCollection);
    HRESULT OnBeginFile(IFsrmPropertyBag, SAFEARRAY*);
    HRESULT DoesPropertyValueApply(BSTR, BSTR, VARIANT_BOOL*, GUID, GUID);
    HRESULT GetPropertyValueToApply(BSTR, BSTR*, GUID, GUID);
    HRESULT OnEndFile();
}
enum IID_IFsrmStorageModuleImplementation = GUID(0xaf4a0da, 0x895a, 0x4e50, [0x87, 0x12, 0xa9, 0x67, 0x24, 0xbc, 0xec, 0x64]);
interface IFsrmStorageModuleImplementation : IFsrmPipelineModuleImplementation
{
    HRESULT UseDefinitions(IFsrmCollection);
    HRESULT LoadProperties(IFsrmPropertyBag);
    HRESULT SaveProperties(IFsrmPropertyBag);
}
enum IID_IFsrmPipelineModuleConnector = GUID(0xc16014f3, 0x9aa1, 0x46b3, [0xb0, 0xa7, 0xab, 0x14, 0x6e, 0xb2, 0x5, 0xf2]);
interface IFsrmPipelineModuleConnector : IDispatch
{
    HRESULT get_ModuleImplementation(IFsrmPipelineModuleImplementation*);
    HRESULT get_ModuleName(BSTR*);
    HRESULT get_HostingUserAccount(BSTR*);
    HRESULT get_HostingProcessPid(int*);
    HRESULT Bind(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleImplementation);
}
enum IID_DIFsrmClassificationEvents = GUID(0x26942db0, 0xdabf, 0x41d8, [0xbb, 0xdd, 0xb1, 0x29, 0xa9, 0xf7, 0x4, 0x24]);
interface DIFsrmClassificationEvents : IDispatch
{
}
