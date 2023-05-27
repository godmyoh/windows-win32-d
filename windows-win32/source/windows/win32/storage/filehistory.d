module windows.win32.storage.filehistory;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT;
import windows.win32.system.com : IUnknown;
import windows.win32.system.windowsprogramming : FH_SERVICE_PIPE_HANDLE;

version (Windows):
extern (Windows):

HRESULT FhServiceOpenPipe(BOOL, FH_SERVICE_PIPE_HANDLE*);
HRESULT FhServiceClosePipe(FH_SERVICE_PIPE_HANDLE);
HRESULT FhServiceStartBackup(FH_SERVICE_PIPE_HANDLE, BOOL);
HRESULT FhServiceStopBackup(FH_SERVICE_PIPE_HANDLE, BOOL);
HRESULT FhServiceReloadConfiguration(FH_SERVICE_PIPE_HANDLE);
HRESULT FhServiceBlockBackup(FH_SERVICE_PIPE_HANDLE);
HRESULT FhServiceUnblockBackup(FH_SERVICE_PIPE_HANDLE);
enum FHCFG_E_CORRUPT_CONFIG_FILE = 0xffffffff80040300;
enum FHCFG_E_CONFIG_FILE_NOT_FOUND = 0xffffffff80040301;
enum FHCFG_E_CONFIG_ALREADY_EXISTS = 0xffffffff80040302;
enum FHCFG_E_NO_VALID_CONFIGURATION_LOADED = 0xffffffff80040303;
enum FHCFG_E_TARGET_NOT_CONNECTED = 0xffffffff80040304;
enum FHCFG_E_CONFIGURATION_PREVIOUSLY_LOADED = 0xffffffff80040305;
enum FHCFG_E_TARGET_VERIFICATION_FAILED = 0xffffffff80040306;
enum FHCFG_E_TARGET_NOT_CONFIGURED = 0xffffffff80040307;
enum FHCFG_E_TARGET_NOT_ENOUGH_FREE_SPACE = 0xffffffff80040308;
enum FHCFG_E_TARGET_CANNOT_BE_USED = 0xffffffff80040309;
enum FHCFG_E_INVALID_REHYDRATION_STATE = 0xffffffff8004030a;
enum FHCFG_E_RECOMMENDATION_CHANGE_NOT_ALLOWED = 0xffffffff80040310;
enum FHCFG_E_TARGET_REHYDRATED_ELSEWHERE = 0xffffffff80040311;
enum FHCFG_E_LEGACY_TARGET_UNSUPPORTED = 0xffffffff80040312;
enum FHCFG_E_LEGACY_TARGET_VALIDATION_UNSUPPORTED = 0xffffffff80040313;
enum FHCFG_E_LEGACY_BACKUP_USER_EXCLUDED = 0xffffffff80040314;
enum FHCFG_E_LEGACY_BACKUP_NOT_FOUND = 0xffffffff80040315;
enum FHSVC_E_BACKUP_BLOCKED = 0xffffffff80040600;
enum FHSVC_E_NOT_CONFIGURED = 0xffffffff80040601;
enum FHSVC_E_CONFIG_DISABLED = 0xffffffff80040602;
enum FHSVC_E_CONFIG_DISABLED_GP = 0xffffffff80040603;
enum FHSVC_E_FATAL_CONFIG_ERROR = 0xffffffff80040604;
enum FHSVC_E_CONFIG_REHYDRATING = 0xffffffff80040605;
enum FH_STATE_NOT_TRACKED = 0x00000000;
enum FH_STATE_OFF = 0x00000001;
enum FH_STATE_DISABLED_BY_GP = 0x00000002;
enum FH_STATE_FATAL_CONFIG_ERROR = 0x00000003;
enum FH_STATE_MIGRATING = 0x00000004;
enum FH_STATE_REHYDRATING = 0x00000005;
enum FH_STATE_TARGET_FS_LIMITATION = 0x0000000d;
enum FH_STATE_TARGET_ACCESS_DENIED = 0x0000000e;
enum FH_STATE_TARGET_VOLUME_DIRTY = 0x0000000f;
enum FH_STATE_TARGET_FULL_RETENTION_MAX = 0x00000010;
enum FH_STATE_TARGET_FULL = 0x00000011;
enum FH_STATE_STAGING_FULL = 0x00000012;
enum FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX = 0x00000013;
enum FH_STATE_TARGET_LOW_SPACE = 0x00000014;
enum FH_STATE_TARGET_ABSENT = 0x00000015;
enum FH_STATE_TOO_MUCH_BEHIND = 0x000000f0;
enum FH_STATE_NO_ERROR = 0x000000ff;
enum FH_STATE_BACKUP_NOT_SUPPORTED = 0x00000810;
enum FH_STATE_RUNNING = 0x00000100;
alias FH_TARGET_PROPERTY_TYPE = int;
enum : int
{
    FH_TARGET_NAME       = 0x00000000,
    FH_TARGET_URL        = 0x00000001,
    FH_TARGET_DRIVE_TYPE = 0x00000002,
    MAX_TARGET_PROPERTY  = 0x00000003,
}

alias FH_TARGET_DRIVE_TYPES = int;
enum : int
{
    FH_DRIVE_UNKNOWN   = 0x00000000,
    FH_DRIVE_REMOVABLE = 0x00000002,
    FH_DRIVE_FIXED     = 0x00000003,
    FH_DRIVE_REMOTE    = 0x00000004,
}

enum IID_IFhTarget = GUID(0xd87965fd, 0x2bad, 0x4657, [0xbd, 0x3b, 0x95, 0x67, 0xeb, 0x30, 0xc, 0xed]);
interface IFhTarget : IUnknown
{
    HRESULT GetStringProperty(FH_TARGET_PROPERTY_TYPE, BSTR*);
    HRESULT GetNumericalProperty(FH_TARGET_PROPERTY_TYPE, ulong*);
}
enum IID_IFhScopeIterator = GUID(0x3197abce, 0x532a, 0x44c6, [0x86, 0x15, 0xf3, 0x66, 0x65, 0x66, 0xa7, 0x20]);
interface IFhScopeIterator : IUnknown
{
    HRESULT MoveToNextItem();
    HRESULT GetItem(BSTR*);
}
alias FH_PROTECTED_ITEM_CATEGORY = int;
enum : int
{
    FH_FOLDER                   = 0x00000000,
    FH_LIBRARY                  = 0x00000001,
    MAX_PROTECTED_ITEM_CATEGORY = 0x00000002,
}

alias FH_LOCAL_POLICY_TYPE = int;
enum : int
{
    FH_FREQUENCY      = 0x00000000,
    FH_RETENTION_TYPE = 0x00000001,
    FH_RETENTION_AGE  = 0x00000002,
    MAX_LOCAL_POLICY  = 0x00000003,
}

alias FH_RETENTION_TYPES = int;
enum : int
{
    FH_RETENTION_DISABLED  = 0x00000000,
    FH_RETENTION_UNLIMITED = 0x00000001,
    FH_RETENTION_AGE_BASED = 0x00000002,
    MAX_RETENTION_TYPE     = 0x00000003,
}

alias FH_BACKUP_STATUS = int;
enum : int
{
    FH_STATUS_DISABLED       = 0x00000000,
    FH_STATUS_DISABLED_BY_GP = 0x00000001,
    FH_STATUS_ENABLED        = 0x00000002,
    FH_STATUS_REHYDRATING    = 0x00000003,
    MAX_BACKUP_STATUS        = 0x00000004,
}

alias FH_DEVICE_VALIDATION_RESULT = int;
enum : int
{
    FH_ACCESS_DENIED          = 0x00000000,
    FH_INVALID_DRIVE_TYPE     = 0x00000001,
    FH_READ_ONLY_PERMISSION   = 0x00000002,
    FH_CURRENT_DEFAULT        = 0x00000003,
    FH_NAMESPACE_EXISTS       = 0x00000004,
    FH_TARGET_PART_OF_LIBRARY = 0x00000005,
    FH_VALID_TARGET           = 0x00000006,
    MAX_VALIDATION_RESULT     = 0x00000007,
}

enum IID_IFhConfigMgr = GUID(0x6a5fea5b, 0xbf8f, 0x4ee5, [0xb8, 0xc3, 0x44, 0xd8, 0xa0, 0xd7, 0x33, 0x1c]);
interface IFhConfigMgr : IUnknown
{
    HRESULT LoadConfiguration();
    HRESULT CreateDefaultConfiguration(BOOL);
    HRESULT SaveConfiguration();
    HRESULT AddRemoveExcludeRule(BOOL, FH_PROTECTED_ITEM_CATEGORY, BSTR);
    HRESULT GetIncludeExcludeRules(BOOL, FH_PROTECTED_ITEM_CATEGORY, IFhScopeIterator*);
    HRESULT GetLocalPolicy(FH_LOCAL_POLICY_TYPE, ulong*);
    HRESULT SetLocalPolicy(FH_LOCAL_POLICY_TYPE, ulong);
    HRESULT GetBackupStatus(FH_BACKUP_STATUS*);
    HRESULT SetBackupStatus(FH_BACKUP_STATUS);
    HRESULT GetDefaultTarget(IFhTarget*);
    HRESULT ValidateTarget(BSTR, FH_DEVICE_VALIDATION_RESULT*);
    HRESULT ProvisionAndSetNewTarget(BSTR, BSTR);
    HRESULT ChangeDefaultTargetRecommendation(BOOL);
    HRESULT QueryProtectionStatus(uint*, BSTR*);
}
enum IID_IFhReassociation = GUID(0x6544a28a, 0xf68d, 0x47ac, [0x91, 0xef, 0x16, 0xb2, 0xb3, 0x6a, 0xa3, 0xee]);
interface IFhReassociation : IUnknown
{
    HRESULT ValidateTarget(BSTR, FH_DEVICE_VALIDATION_RESULT*);
    HRESULT ScanTargetForConfigurations(BSTR);
    HRESULT GetConfigurationDetails(uint, BSTR*, BSTR*, FILETIME*);
    HRESULT SelectConfiguration(uint);
    HRESULT PerformReassociation(BOOL);
}
enum CLSID_FhConfigMgr = GUID(0xed43bb3c, 0x9e9, 0x498a, [0x9d, 0xf6, 0x21, 0x77, 0x24, 0x4c, 0x6d, 0xb4]);
struct FhConfigMgr
{
}
enum CLSID_FhReassociation = GUID(0x4d728e35, 0x16fa, 0x4320, [0x9e, 0x8b, 0xbf, 0xd7, 0x10, 0xa, 0x88, 0x46]);
struct FhReassociation
{
}
alias FhBackupStopReason = int;
enum : int
{
    BackupInvalidStopReason        = 0x00000000,
    BackupLimitUserBusyMachineOnAC = 0x00000001,
    BackupLimitUserIdleMachineOnDC = 0x00000002,
    BackupLimitUserBusyMachineOnDC = 0x00000003,
    BackupCancelled                = 0x00000004,
}

