module windows.win32.storage.vss;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMDocument;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, PWSTR;
import windows.win32.storage.virtualdiskservice : VDS_LUN_INFORMATION;
import windows.win32.system.com : IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

HRESULT CreateVssExpressWriterInternal(IVssExpressWriter* ppWriter);
enum VSS_ASSOC_NO_MAX_SPACE = 0xffffffffffffffff;
enum VSS_ASSOC_REMOVE = 0x00000000;
enum VSS_E_BAD_STATE = 0xffffffff80042301;
enum VSS_E_UNEXPECTED = 0xffffffff80042302;
enum VSS_E_PROVIDER_ALREADY_REGISTERED = 0xffffffff80042303;
enum VSS_E_PROVIDER_NOT_REGISTERED = 0xffffffff80042304;
enum VSS_E_PROVIDER_VETO = 0xffffffff80042306;
enum VSS_E_PROVIDER_IN_USE = 0xffffffff80042307;
enum VSS_E_OBJECT_NOT_FOUND = 0xffffffff80042308;
enum VSS_S_ASYNC_PENDING = 0x00042309;
enum VSS_S_ASYNC_FINISHED = 0x0004230a;
enum VSS_S_ASYNC_CANCELLED = 0x0004230b;
enum VSS_E_VOLUME_NOT_SUPPORTED = 0xffffffff8004230c;
enum VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER = 0xffffffff8004230e;
enum VSS_E_OBJECT_ALREADY_EXISTS = 0xffffffff8004230d;
enum VSS_E_UNEXPECTED_PROVIDER_ERROR = 0xffffffff8004230f;
enum VSS_E_CORRUPT_XML_DOCUMENT = 0xffffffff80042310;
enum VSS_E_INVALID_XML_DOCUMENT = 0xffffffff80042311;
enum VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED = 0xffffffff80042312;
enum VSS_E_FLUSH_WRITES_TIMEOUT = 0xffffffff80042313;
enum VSS_E_HOLD_WRITES_TIMEOUT = 0xffffffff80042314;
enum VSS_E_UNEXPECTED_WRITER_ERROR = 0xffffffff80042315;
enum VSS_E_SNAPSHOT_SET_IN_PROGRESS = 0xffffffff80042316;
enum VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED = 0xffffffff80042317;
enum VSS_E_WRITER_INFRASTRUCTURE = 0xffffffff80042318;
enum VSS_E_WRITER_NOT_RESPONDING = 0xffffffff80042319;
enum VSS_E_WRITER_ALREADY_SUBSCRIBED = 0xffffffff8004231a;
enum VSS_E_UNSUPPORTED_CONTEXT = 0xffffffff8004231b;
enum VSS_E_VOLUME_IN_USE = 0xffffffff8004231d;
enum VSS_E_MAXIMUM_DIFFAREA_ASSOCIATIONS_REACHED = 0xffffffff8004231e;
enum VSS_E_INSUFFICIENT_STORAGE = 0xffffffff8004231f;
enum VSS_E_NO_SNAPSHOTS_IMPORTED = 0xffffffff80042320;
enum VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED = 0x00042321;
enum VSS_E_SOME_SNAPSHOTS_NOT_IMPORTED = 0xffffffff80042321;
enum VSS_E_MAXIMUM_NUMBER_OF_REMOTE_MACHINES_REACHED = 0xffffffff80042322;
enum VSS_E_REMOTE_SERVER_UNAVAILABLE = 0xffffffff80042323;
enum VSS_E_REMOTE_SERVER_UNSUPPORTED = 0xffffffff80042324;
enum VSS_E_REVERT_IN_PROGRESS = 0xffffffff80042325;
enum VSS_E_REVERT_VOLUME_LOST = 0xffffffff80042326;
enum VSS_E_REBOOT_REQUIRED = 0xffffffff80042327;
enum VSS_E_TRANSACTION_FREEZE_TIMEOUT = 0xffffffff80042328;
enum VSS_E_TRANSACTION_THAW_TIMEOUT = 0xffffffff80042329;
enum VSS_E_VOLUME_NOT_LOCAL = 0xffffffff8004232d;
enum VSS_E_CLUSTER_TIMEOUT = 0xffffffff8004232e;
enum VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT = 0xffffffff800423f0;
enum VSS_E_WRITERERROR_OUTOFRESOURCES = 0xffffffff800423f1;
enum VSS_E_WRITERERROR_TIMEOUT = 0xffffffff800423f2;
enum VSS_E_WRITERERROR_RETRYABLE = 0xffffffff800423f3;
enum VSS_E_WRITERERROR_NONRETRYABLE = 0xffffffff800423f4;
enum VSS_E_WRITERERROR_RECOVERY_FAILED = 0xffffffff800423f5;
enum VSS_E_BREAK_REVERT_ID_FAILED = 0xffffffff800423f6;
enum VSS_E_LEGACY_PROVIDER = 0xffffffff800423f7;
enum VSS_E_MISSING_DISK = 0xffffffff800423f8;
enum VSS_E_MISSING_HIDDEN_VOLUME = 0xffffffff800423f9;
enum VSS_E_MISSING_VOLUME = 0xffffffff800423fa;
enum VSS_E_AUTORECOVERY_FAILED = 0xffffffff800423fb;
enum VSS_E_DYNAMIC_DISK_ERROR = 0xffffffff800423fc;
enum VSS_E_NONTRANSPORTABLE_BCD = 0xffffffff800423fd;
enum VSS_E_CANNOT_REVERT_DISKID = 0xffffffff800423fe;
enum VSS_E_RESYNC_IN_PROGRESS = 0xffffffff800423ff;
enum VSS_E_CLUSTER_ERROR = 0xffffffff80042400;
enum VSS_E_UNSELECTED_VOLUME = 0xffffffff8004232a;
enum VSS_E_SNAPSHOT_NOT_IN_SET = 0xffffffff8004232b;
enum VSS_E_NESTED_VOLUME_LIMIT = 0xffffffff8004232c;
enum VSS_E_NOT_SUPPORTED = 0xffffffff8004232f;
enum VSS_E_WRITERERROR_PARTIAL_FAILURE = 0xffffffff80042336;
enum VSS_E_ASRERROR_DISK_ASSIGNMENT_FAILED = 0xffffffff80042401;
enum VSS_E_ASRERROR_DISK_RECREATION_FAILED = 0xffffffff80042402;
enum VSS_E_ASRERROR_NO_ARCPATH = 0xffffffff80042403;
enum VSS_E_ASRERROR_MISSING_DYNDISK = 0xffffffff80042404;
enum VSS_E_ASRERROR_SHARED_CRIDISK = 0xffffffff80042405;
enum VSS_E_ASRERROR_DATADISK_RDISK0 = 0xffffffff80042406;
enum VSS_E_ASRERROR_RDISK0_TOOSMALL = 0xffffffff80042407;
enum VSS_E_ASRERROR_CRITICAL_DISKS_TOO_SMALL = 0xffffffff80042408;
enum VSS_E_WRITER_STATUS_NOT_AVAILABLE = 0xffffffff80042409;
enum VSS_E_ASRERROR_DYNAMIC_VHD_NOT_SUPPORTED = 0xffffffff8004240a;
enum VSS_E_CRITICAL_VOLUME_ON_INVALID_DISK = 0xffffffff80042411;
enum VSS_E_ASRERROR_RDISK_FOR_SYSTEM_DISK_NOT_FOUND = 0xffffffff80042412;
enum VSS_E_ASRERROR_NO_PHYSICAL_DISK_AVAILABLE = 0xffffffff80042413;
enum VSS_E_ASRERROR_FIXED_PHYSICAL_DISK_AVAILABLE_AFTER_DISK_EXCLUSION = 0xffffffff80042414;
enum VSS_E_ASRERROR_CRITICAL_DISK_CANNOT_BE_EXCLUDED = 0xffffffff80042415;
enum VSS_E_ASRERROR_SYSTEM_PARTITION_HIDDEN = 0xffffffff80042416;
enum VSS_E_FSS_TIMEOUT = 0xffffffff80042417;
alias VSS_OBJECT_TYPE = int;
enum : int
{
    VSS_OBJECT_UNKNOWN      = 0x00000000,
    VSS_OBJECT_NONE         = 0x00000001,
    VSS_OBJECT_SNAPSHOT_SET = 0x00000002,
    VSS_OBJECT_SNAPSHOT     = 0x00000003,
    VSS_OBJECT_PROVIDER     = 0x00000004,
    VSS_OBJECT_TYPE_COUNT   = 0x00000005,
}

alias VSS_SNAPSHOT_STATE = int;
enum : int
{
    VSS_SS_UNKNOWN                    = 0x00000000,
    VSS_SS_PREPARING                  = 0x00000001,
    VSS_SS_PROCESSING_PREPARE         = 0x00000002,
    VSS_SS_PREPARED                   = 0x00000003,
    VSS_SS_PROCESSING_PRECOMMIT       = 0x00000004,
    VSS_SS_PRECOMMITTED               = 0x00000005,
    VSS_SS_PROCESSING_COMMIT          = 0x00000006,
    VSS_SS_COMMITTED                  = 0x00000007,
    VSS_SS_PROCESSING_POSTCOMMIT      = 0x00000008,
    VSS_SS_PROCESSING_PREFINALCOMMIT  = 0x00000009,
    VSS_SS_PREFINALCOMMITTED          = 0x0000000a,
    VSS_SS_PROCESSING_POSTFINALCOMMIT = 0x0000000b,
    VSS_SS_CREATED                    = 0x0000000c,
    VSS_SS_ABORTED                    = 0x0000000d,
    VSS_SS_DELETED                    = 0x0000000e,
    VSS_SS_POSTCOMMITTED              = 0x0000000f,
    VSS_SS_COUNT                      = 0x00000010,
}

alias VSS_VOLUME_SNAPSHOT_ATTRIBUTES = int;
enum : int
{
    VSS_VOLSNAP_ATTR_PERSISTENT           = 0x00000001,
    VSS_VOLSNAP_ATTR_NO_AUTORECOVERY      = 0x00000002,
    VSS_VOLSNAP_ATTR_CLIENT_ACCESSIBLE    = 0x00000004,
    VSS_VOLSNAP_ATTR_NO_AUTO_RELEASE      = 0x00000008,
    VSS_VOLSNAP_ATTR_NO_WRITERS           = 0x00000010,
    VSS_VOLSNAP_ATTR_TRANSPORTABLE        = 0x00000020,
    VSS_VOLSNAP_ATTR_NOT_SURFACED         = 0x00000040,
    VSS_VOLSNAP_ATTR_NOT_TRANSACTED       = 0x00000080,
    VSS_VOLSNAP_ATTR_HARDWARE_ASSISTED    = 0x00010000,
    VSS_VOLSNAP_ATTR_DIFFERENTIAL         = 0x00020000,
    VSS_VOLSNAP_ATTR_PLEX                 = 0x00040000,
    VSS_VOLSNAP_ATTR_IMPORTED             = 0x00080000,
    VSS_VOLSNAP_ATTR_EXPOSED_LOCALLY      = 0x00100000,
    VSS_VOLSNAP_ATTR_EXPOSED_REMOTELY     = 0x00200000,
    VSS_VOLSNAP_ATTR_AUTORECOVER          = 0x00400000,
    VSS_VOLSNAP_ATTR_ROLLBACK_RECOVERY    = 0x00800000,
    VSS_VOLSNAP_ATTR_DELAYED_POSTSNAPSHOT = 0x01000000,
    VSS_VOLSNAP_ATTR_TXF_RECOVERY         = 0x02000000,
    VSS_VOLSNAP_ATTR_FILE_SHARE           = 0x04000000,
}

alias VSS_SNAPSHOT_CONTEXT = int;
enum : int
{
    VSS_CTX_BACKUP                    = 0x00000000,
    VSS_CTX_FILE_SHARE_BACKUP         = 0x00000010,
    VSS_CTX_NAS_ROLLBACK              = 0x00000019,
    VSS_CTX_APP_ROLLBACK              = 0x00000009,
    VSS_CTX_CLIENT_ACCESSIBLE         = 0x0000001d,
    VSS_CTX_CLIENT_ACCESSIBLE_WRITERS = 0x0000000d,
    VSS_CTX_ALL                       = 0xffffffff,
}

alias VSS_PROVIDER_CAPABILITIES = int;
enum : int
{
    VSS_PRV_CAPABILITY_LEGACY           = 0x00000001,
    VSS_PRV_CAPABILITY_COMPLIANT        = 0x00000002,
    VSS_PRV_CAPABILITY_LUN_REPOINT      = 0x00000004,
    VSS_PRV_CAPABILITY_LUN_RESYNC       = 0x00000008,
    VSS_PRV_CAPABILITY_OFFLINE_CREATION = 0x00000010,
    VSS_PRV_CAPABILITY_MULTIPLE_IMPORT  = 0x00000020,
    VSS_PRV_CAPABILITY_RECYCLING        = 0x00000040,
    VSS_PRV_CAPABILITY_PLEX             = 0x00000080,
    VSS_PRV_CAPABILITY_DIFFERENTIAL     = 0x00000100,
    VSS_PRV_CAPABILITY_CLUSTERED        = 0x00000200,
}

alias VSS_HARDWARE_OPTIONS = int;
enum : int
{
    VSS_BREAKEX_FLAG_MASK_LUNS                    = 0x00000001,
    VSS_BREAKEX_FLAG_MAKE_READ_WRITE              = 0x00000002,
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_ALL          = 0x00000004,
    VSS_BREAKEX_FLAG_REVERT_IDENTITY_NONE         = 0x00000008,
    VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE        = 0x00000100,
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY  = 0x00000200,
    VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY = 0x00000400,
    VSS_ONLUNSTATECHANGE_DO_MASK_LUNS             = 0x00000800,
}

alias VSS_RECOVERY_OPTIONS = int;
enum : int
{
    VSS_RECOVERY_REVERT_IDENTITY_ALL = 0x00000100,
    VSS_RECOVERY_NO_VOLUME_CHECK     = 0x00000200,
}

alias VSS_WRITER_STATE = int;
enum : int
{
    VSS_WS_UNKNOWN                     = 0x00000000,
    VSS_WS_STABLE                      = 0x00000001,
    VSS_WS_WAITING_FOR_FREEZE          = 0x00000002,
    VSS_WS_WAITING_FOR_THAW            = 0x00000003,
    VSS_WS_WAITING_FOR_POST_SNAPSHOT   = 0x00000004,
    VSS_WS_WAITING_FOR_BACKUP_COMPLETE = 0x00000005,
    VSS_WS_FAILED_AT_IDENTIFY          = 0x00000006,
    VSS_WS_FAILED_AT_PREPARE_BACKUP    = 0x00000007,
    VSS_WS_FAILED_AT_PREPARE_SNAPSHOT  = 0x00000008,
    VSS_WS_FAILED_AT_FREEZE            = 0x00000009,
    VSS_WS_FAILED_AT_THAW              = 0x0000000a,
    VSS_WS_FAILED_AT_POST_SNAPSHOT     = 0x0000000b,
    VSS_WS_FAILED_AT_BACKUP_COMPLETE   = 0x0000000c,
    VSS_WS_FAILED_AT_PRE_RESTORE       = 0x0000000d,
    VSS_WS_FAILED_AT_POST_RESTORE      = 0x0000000e,
    VSS_WS_FAILED_AT_BACKUPSHUTDOWN    = 0x0000000f,
    VSS_WS_COUNT                       = 0x00000010,
}

alias VSS_BACKUP_TYPE = int;
enum : int
{
    VSS_BT_UNDEFINED    = 0x00000000,
    VSS_BT_FULL         = 0x00000001,
    VSS_BT_INCREMENTAL  = 0x00000002,
    VSS_BT_DIFFERENTIAL = 0x00000003,
    VSS_BT_LOG          = 0x00000004,
    VSS_BT_COPY         = 0x00000005,
    VSS_BT_OTHER        = 0x00000006,
}

alias VSS_RESTORE_TYPE = int;
enum : int
{
    VSS_RTYPE_UNDEFINED = 0x00000000,
    VSS_RTYPE_BY_COPY   = 0x00000001,
    VSS_RTYPE_IMPORT    = 0x00000002,
    VSS_RTYPE_OTHER     = 0x00000003,
}

alias VSS_ROLLFORWARD_TYPE = int;
enum : int
{
    VSS_RF_UNDEFINED = 0x00000000,
    VSS_RF_NONE      = 0x00000001,
    VSS_RF_ALL       = 0x00000002,
    VSS_RF_PARTIAL   = 0x00000003,
}

alias VSS_PROVIDER_TYPE = int;
enum : int
{
    VSS_PROV_UNKNOWN   = 0x00000000,
    VSS_PROV_SYSTEM    = 0x00000001,
    VSS_PROV_SOFTWARE  = 0x00000002,
    VSS_PROV_HARDWARE  = 0x00000003,
    VSS_PROV_FILESHARE = 0x00000004,
}

alias VSS_APPLICATION_LEVEL = int;
enum : int
{
    VSS_APP_UNKNOWN   = 0x00000000,
    VSS_APP_SYSTEM    = 0x00000001,
    VSS_APP_BACK_END  = 0x00000002,
    VSS_APP_FRONT_END = 0x00000003,
    VSS_APP_SYSTEM_RM = 0x00000004,
    VSS_APP_AUTO      = 0xffffffff,
}

alias VSS_SNAPSHOT_COMPATIBILITY = int;
enum : int
{
    VSS_SC_DISABLE_DEFRAG       = 0x00000001,
    VSS_SC_DISABLE_CONTENTINDEX = 0x00000002,
}

alias VSS_SNAPSHOT_PROPERTY_ID = int;
enum : int
{
    VSS_SPROPID_UNKNOWN             = 0x00000000,
    VSS_SPROPID_SNAPSHOT_ID         = 0x00000001,
    VSS_SPROPID_SNAPSHOT_SET_ID     = 0x00000002,
    VSS_SPROPID_SNAPSHOTS_COUNT     = 0x00000003,
    VSS_SPROPID_SNAPSHOT_DEVICE     = 0x00000004,
    VSS_SPROPID_ORIGINAL_VOLUME     = 0x00000005,
    VSS_SPROPID_ORIGINATING_MACHINE = 0x00000006,
    VSS_SPROPID_SERVICE_MACHINE     = 0x00000007,
    VSS_SPROPID_EXPOSED_NAME        = 0x00000008,
    VSS_SPROPID_EXPOSED_PATH        = 0x00000009,
    VSS_SPROPID_PROVIDER_ID         = 0x0000000a,
    VSS_SPROPID_SNAPSHOT_ATTRIBUTES = 0x0000000b,
    VSS_SPROPID_CREATION_TIMESTAMP  = 0x0000000c,
    VSS_SPROPID_STATUS              = 0x0000000d,
}

alias VSS_FILE_SPEC_BACKUP_TYPE = int;
enum : int
{
    VSS_FSBT_FULL_BACKUP_REQUIRED           = 0x00000001,
    VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED   = 0x00000002,
    VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED    = 0x00000004,
    VSS_FSBT_LOG_BACKUP_REQUIRED            = 0x00000008,
    VSS_FSBT_FULL_SNAPSHOT_REQUIRED         = 0x00000100,
    VSS_FSBT_DIFFERENTIAL_SNAPSHOT_REQUIRED = 0x00000200,
    VSS_FSBT_INCREMENTAL_SNAPSHOT_REQUIRED  = 0x00000400,
    VSS_FSBT_LOG_SNAPSHOT_REQUIRED          = 0x00000800,
    VSS_FSBT_CREATED_DURING_BACKUP          = 0x00010000,
    VSS_FSBT_ALL_BACKUP_REQUIRED            = 0x0000000f,
    VSS_FSBT_ALL_SNAPSHOT_REQUIRED          = 0x00000f00,
}

alias VSS_BACKUP_SCHEMA = int;
enum : int
{
    VSS_BS_UNDEFINED                          = 0x00000000,
    VSS_BS_DIFFERENTIAL                       = 0x00000001,
    VSS_BS_INCREMENTAL                        = 0x00000002,
    VSS_BS_EXCLUSIVE_INCREMENTAL_DIFFERENTIAL = 0x00000004,
    VSS_BS_LOG                                = 0x00000008,
    VSS_BS_COPY                               = 0x00000010,
    VSS_BS_TIMESTAMPED                        = 0x00000020,
    VSS_BS_LAST_MODIFY                        = 0x00000040,
    VSS_BS_LSN                                = 0x00000080,
    VSS_BS_WRITER_SUPPORTS_NEW_TARGET         = 0x00000100,
    VSS_BS_WRITER_SUPPORTS_RESTORE_WITH_MOVE  = 0x00000200,
    VSS_BS_INDEPENDENT_SYSTEM_STATE           = 0x00000400,
    VSS_BS_ROLLFORWARD_RESTORE                = 0x00001000,
    VSS_BS_RESTORE_RENAME                     = 0x00002000,
    VSS_BS_AUTHORITATIVE_RESTORE              = 0x00004000,
    VSS_BS_WRITER_SUPPORTS_PARALLEL_RESTORES  = 0x00008000,
}

struct VSS_SNAPSHOT_PROP
{
    GUID m_SnapshotId;
    GUID m_SnapshotSetId;
    int m_lSnapshotsCount;
    ushort* m_pwszSnapshotDeviceObject;
    ushort* m_pwszOriginalVolumeName;
    ushort* m_pwszOriginatingMachine;
    ushort* m_pwszServiceMachine;
    ushort* m_pwszExposedName;
    ushort* m_pwszExposedPath;
    GUID m_ProviderId;
    int m_lSnapshotAttributes;
    long m_tsCreationTimestamp;
    VSS_SNAPSHOT_STATE m_eStatus;
}
struct VSS_PROVIDER_PROP
{
    GUID m_ProviderId;
    ushort* m_pwszProviderName;
    VSS_PROVIDER_TYPE m_eProviderType;
    ushort* m_pwszProviderVersion;
    GUID m_ProviderVersionId;
    GUID m_ClassId;
}
union VSS_OBJECT_UNION
{
    VSS_SNAPSHOT_PROP Snap;
    VSS_PROVIDER_PROP Prov;
}
struct VSS_OBJECT_PROP
{
    VSS_OBJECT_TYPE Type;
    VSS_OBJECT_UNION Obj;
}
enum IID_IVssEnumObject = GUID(0xae1c7110, 0x2f60, 0x11d3, [0x8a, 0x39, 0x0, 0xc0, 0x4f, 0x72, 0xd8, 0xe3]);
interface IVssEnumObject : IUnknown
{
    HRESULT Next(uint celt, VSS_OBJECT_PROP* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IVssEnumObject* ppenum);
}
enum IID_IVssAsync = GUID(0x507c37b4, 0xcf5b, 0x4e95, [0xb0, 0xaf, 0x14, 0xeb, 0x97, 0x67, 0x46, 0x7e]);
interface IVssAsync : IUnknown
{
    HRESULT Cancel();
    HRESULT Wait(uint dwMilliseconds);
    HRESULT QueryStatus(HRESULT* pHrResult, int* pReserved);
}
alias VSS_USAGE_TYPE = int;
enum : int
{
    VSS_UT_UNDEFINED           = 0x00000000,
    VSS_UT_BOOTABLESYSTEMSTATE = 0x00000001,
    VSS_UT_SYSTEMSERVICE       = 0x00000002,
    VSS_UT_USERDATA            = 0x00000003,
    VSS_UT_OTHER               = 0x00000004,
}

alias VSS_SOURCE_TYPE = int;
enum : int
{
    VSS_ST_UNDEFINED       = 0x00000000,
    VSS_ST_TRANSACTEDDB    = 0x00000001,
    VSS_ST_NONTRANSACTEDDB = 0x00000002,
    VSS_ST_OTHER           = 0x00000003,
}

alias VSS_RESTOREMETHOD_ENUM = int;
enum : int
{
    VSS_RME_UNDEFINED                           = 0x00000000,
    VSS_RME_RESTORE_IF_NOT_THERE                = 0x00000001,
    VSS_RME_RESTORE_IF_CAN_REPLACE              = 0x00000002,
    VSS_RME_STOP_RESTORE_START                  = 0x00000003,
    VSS_RME_RESTORE_TO_ALTERNATE_LOCATION       = 0x00000004,
    VSS_RME_RESTORE_AT_REBOOT                   = 0x00000005,
    VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE = 0x00000006,
    VSS_RME_CUSTOM                              = 0x00000007,
    VSS_RME_RESTORE_STOP_START                  = 0x00000008,
}

alias VSS_WRITERRESTORE_ENUM = int;
enum : int
{
    VSS_WRE_UNDEFINED        = 0x00000000,
    VSS_WRE_NEVER            = 0x00000001,
    VSS_WRE_IF_REPLACE_FAILS = 0x00000002,
    VSS_WRE_ALWAYS           = 0x00000003,
}

alias VSS_COMPONENT_TYPE = int;
enum : int
{
    VSS_CT_UNDEFINED = 0x00000000,
    VSS_CT_DATABASE  = 0x00000001,
    VSS_CT_FILEGROUP = 0x00000002,
}

alias VSS_ALTERNATE_WRITER_STATE = int;
enum : int
{
    VSS_AWS_UNDEFINED                = 0x00000000,
    VSS_AWS_NO_ALTERNATE_WRITER      = 0x00000001,
    VSS_AWS_ALTERNATE_WRITER_EXISTS  = 0x00000002,
    VSS_AWS_THIS_IS_ALTERNATE_WRITER = 0x00000003,
}

alias VSS_SUBSCRIBE_MASK = int;
enum : int
{
    VSS_SM_POST_SNAPSHOT_FLAG  = 0x00000001,
    VSS_SM_BACKUP_EVENTS_FLAG  = 0x00000002,
    VSS_SM_RESTORE_EVENTS_FLAG = 0x00000004,
    VSS_SM_IO_THROTTLING_FLAG  = 0x00000008,
    VSS_SM_ALL_FLAGS           = 0xffffffff,
}

alias VSS_RESTORE_TARGET = int;
enum : int
{
    VSS_RT_UNDEFINED         = 0x00000000,
    VSS_RT_ORIGINAL          = 0x00000001,
    VSS_RT_ALTERNATE         = 0x00000002,
    VSS_RT_DIRECTED          = 0x00000003,
    VSS_RT_ORIGINAL_LOCATION = 0x00000004,
}

alias VSS_FILE_RESTORE_STATUS = int;
enum : int
{
    VSS_RS_UNDEFINED = 0x00000000,
    VSS_RS_NONE      = 0x00000001,
    VSS_RS_ALL       = 0x00000002,
    VSS_RS_FAILED    = 0x00000003,
}

alias VSS_COMPONENT_FLAGS = int;
enum : int
{
    VSS_CF_BACKUP_RECOVERY       = 0x00000001,
    VSS_CF_APP_ROLLBACK_RECOVERY = 0x00000002,
    VSS_CF_NOT_SYSTEM_STATE      = 0x00000004,
}

// [Not Found] IID_IVssWMFiledesc
interface IVssWMFiledesc : IUnknown
{
    HRESULT GetPath(BSTR* pbstrPath);
    HRESULT GetFilespec(BSTR* pbstrFilespec);
    HRESULT GetRecursive(bool* pbRecursive);
    HRESULT GetAlternateLocation(BSTR* pbstrAlternateLocation);
    HRESULT GetBackupTypeMask(uint* pdwTypeMask);
}
// [Not Found] IID_IVssWMDependency
interface IVssWMDependency : IUnknown
{
    HRESULT GetWriterId(GUID* pWriterId);
    HRESULT GetLogicalPath(BSTR* pbstrLogicalPath);
    HRESULT GetComponentName(BSTR* pbstrComponentName);
}
enum IID_IVssComponent = GUID(0xd2c72c96, 0xc121, 0x4518, [0xb6, 0x27, 0xe5, 0xa9, 0x3d, 0x1, 0xe, 0xad]);
interface IVssComponent : IUnknown
{
    HRESULT GetLogicalPath(BSTR* pbstrPath);
    HRESULT GetComponentType(VSS_COMPONENT_TYPE* pct);
    HRESULT GetComponentName(BSTR* pbstrName);
    HRESULT GetBackupSucceeded(bool* pbSucceeded);
    HRESULT GetAlternateLocationMappingCount(uint* pcMappings);
    HRESULT GetAlternateLocationMapping(uint iMapping, IVssWMFiledesc* ppFiledesc);
    HRESULT SetBackupMetadata(const(wchar)* wszData);
    HRESULT GetBackupMetadata(BSTR* pbstrData);
    HRESULT AddPartialFile(const(wchar)* wszPath, const(wchar)* wszFilename, const(wchar)* wszRanges, const(wchar)* wszMetadata);
    HRESULT GetPartialFileCount(uint* pcPartialFiles);
    HRESULT GetPartialFile(uint iPartialFile, BSTR* pbstrPath, BSTR* pbstrFilename, BSTR* pbstrRange, BSTR* pbstrMetadata);
    HRESULT IsSelectedForRestore(bool* pbSelectedForRestore);
    HRESULT GetAdditionalRestores(bool* pbAdditionalRestores);
    HRESULT GetNewTargetCount(uint* pcNewTarget);
    HRESULT GetNewTarget(uint iNewTarget, IVssWMFiledesc* ppFiledesc);
    HRESULT AddDirectedTarget(const(wchar)* wszSourcePath, const(wchar)* wszSourceFilename, const(wchar)* wszSourceRangeList, const(wchar)* wszDestinationPath, const(wchar)* wszDestinationFilename, const(wchar)* wszDestinationRangeList);
    HRESULT GetDirectedTargetCount(uint* pcDirectedTarget);
    HRESULT GetDirectedTarget(uint iDirectedTarget, BSTR* pbstrSourcePath, BSTR* pbstrSourceFileName, BSTR* pbstrSourceRangeList, BSTR* pbstrDestinationPath, BSTR* pbstrDestinationFilename, BSTR* pbstrDestinationRangeList);
    HRESULT SetRestoreMetadata(const(wchar)* wszRestoreMetadata);
    HRESULT GetRestoreMetadata(BSTR* pbstrRestoreMetadata);
    HRESULT SetRestoreTarget(VSS_RESTORE_TARGET target);
    HRESULT GetRestoreTarget(VSS_RESTORE_TARGET* pTarget);
    HRESULT SetPreRestoreFailureMsg(const(wchar)* wszPreRestoreFailureMsg);
    HRESULT GetPreRestoreFailureMsg(BSTR* pbstrPreRestoreFailureMsg);
    HRESULT SetPostRestoreFailureMsg(const(wchar)* wszPostRestoreFailureMsg);
    HRESULT GetPostRestoreFailureMsg(BSTR* pbstrPostRestoreFailureMsg);
    HRESULT SetBackupStamp(const(wchar)* wszBackupStamp);
    HRESULT GetBackupStamp(BSTR* pbstrBackupStamp);
    HRESULT GetPreviousBackupStamp(BSTR* pbstrBackupStamp);
    HRESULT GetBackupOptions(BSTR* pbstrBackupOptions);
    HRESULT GetRestoreOptions(BSTR* pbstrRestoreOptions);
    HRESULT GetRestoreSubcomponentCount(uint* pcRestoreSubcomponent);
    HRESULT GetRestoreSubcomponent(uint iComponent, BSTR* pbstrLogicalPath, BSTR* pbstrComponentName, bool* pbRepair);
    HRESULT GetFileRestoreStatus(VSS_FILE_RESTORE_STATUS* pStatus);
    HRESULT AddDifferencedFilesByLastModifyTime(const(wchar)* wszPath, const(wchar)* wszFilespec, BOOL bRecursive, FILETIME ftLastModifyTime);
    HRESULT AddDifferencedFilesByLastModifyLSN(const(wchar)* wszPath, const(wchar)* wszFilespec, BOOL bRecursive, BSTR bstrLsnString);
    HRESULT GetDifferencedFilesCount(uint* pcDifferencedFiles);
    HRESULT GetDifferencedFile(uint iDifferencedFile, BSTR* pbstrPath, BSTR* pbstrFilespec, BOOL* pbRecursive, BSTR* pbstrLsnString, FILETIME* pftLastModifyTime);
}
// [Not Found] IID_IVssWriterComponents
interface IVssWriterComponents
{
    HRESULT GetComponentCount(uint* pcComponents);
    HRESULT GetWriterInfo(GUID* pidInstance, GUID* pidWriter);
    HRESULT GetComponent(uint iComponent, IVssComponent* ppComponent);
}
enum IID_IVssComponentEx = GUID(0x156c8b5e, 0xf131, 0x4bd7, [0x9c, 0x97, 0xd1, 0x92, 0x3b, 0xe7, 0xe1, 0xfa]);
interface IVssComponentEx : IVssComponent
{
    HRESULT SetPrepareForBackupFailureMsg(const(wchar)* wszFailureMsg);
    HRESULT SetPostSnapshotFailureMsg(const(wchar)* wszFailureMsg);
    HRESULT GetPrepareForBackupFailureMsg(BSTR* pbstrFailureMsg);
    HRESULT GetPostSnapshotFailureMsg(BSTR* pbstrFailureMsg);
    HRESULT GetAuthoritativeRestore(bool* pbAuth);
    HRESULT GetRollForward(VSS_ROLLFORWARD_TYPE* pRollType, BSTR* pbstrPoint);
    HRESULT GetRestoreName(BSTR* pbstrName);
}
enum IID_IVssComponentEx2 = GUID(0x3b5be0f2, 0x7a9, 0x4e4b, [0xbd, 0xd3, 0xcf, 0xdc, 0x8e, 0x2c, 0xd, 0x2d]);
interface IVssComponentEx2 : IVssComponentEx
{
    HRESULT SetFailure(HRESULT hr, HRESULT hrApplication, const(wchar)* wszApplicationMessage, uint dwReserved);
    HRESULT GetFailure(HRESULT* phr, HRESULT* phrApplication, BSTR* pbstrApplicationMessage, uint* pdwReserved);
}
// [Not Found] IID_IVssCreateWriterMetadata
interface IVssCreateWriterMetadata
{
    HRESULT AddIncludeFiles(const(wchar)* wszPath, const(wchar)* wszFilespec, ubyte bRecursive, const(wchar)* wszAlternateLocation);
    HRESULT AddExcludeFiles(const(wchar)* wszPath, const(wchar)* wszFilespec, ubyte bRecursive);
    HRESULT AddComponent(VSS_COMPONENT_TYPE ct, const(wchar)* wszLogicalPath, const(wchar)* wszComponentName, const(wchar)* wszCaption, const(ubyte)* pbIcon, uint cbIcon, ubyte bRestoreMetadata, ubyte bNotifyOnBackupComplete, ubyte bSelectable, ubyte bSelectableForRestore, uint dwComponentFlags);
    HRESULT AddDatabaseFiles(const(wchar)* wszLogicalPath, const(wchar)* wszDatabaseName, const(wchar)* wszPath, const(wchar)* wszFilespec, uint dwBackupTypeMask);
    HRESULT AddDatabaseLogFiles(const(wchar)* wszLogicalPath, const(wchar)* wszDatabaseName, const(wchar)* wszPath, const(wchar)* wszFilespec, uint dwBackupTypeMask);
    HRESULT AddFilesToFileGroup(const(wchar)* wszLogicalPath, const(wchar)* wszGroupName, const(wchar)* wszPath, const(wchar)* wszFilespec, ubyte bRecursive, const(wchar)* wszAlternateLocation, uint dwBackupTypeMask);
    HRESULT SetRestoreMethod(VSS_RESTOREMETHOD_ENUM method, const(wchar)* wszService, const(wchar)* wszUserProcedure, VSS_WRITERRESTORE_ENUM writerRestore, ubyte bRebootRequired);
    HRESULT AddAlternateLocationMapping(const(wchar)* wszSourcePath, const(wchar)* wszSourceFilespec, ubyte bRecursive, const(wchar)* wszDestination);
    HRESULT AddComponentDependency(const(wchar)* wszForLogicalPath, const(wchar)* wszForComponentName, GUID onWriterId, const(wchar)* wszOnLogicalPath, const(wchar)* wszOnComponentName);
    HRESULT SetBackupSchema(uint dwSchemaMask);
    HRESULT GetDocument(IXMLDOMDocument* pDoc);
    HRESULT SaveAsXML(BSTR* pbstrXML);
}
enum IID_IVssCreateExpressWriterMetadata = GUID(0x9c772e77, 0xb26e, 0x427f, [0x92, 0xdd, 0xc9, 0x96, 0xf4, 0x1e, 0xa5, 0xe3]);
interface IVssCreateExpressWriterMetadata : IUnknown
{
    HRESULT AddExcludeFiles(const(wchar)* wszPath, const(wchar)* wszFilespec, ubyte bRecursive);
    HRESULT AddComponent(VSS_COMPONENT_TYPE ct, const(wchar)* wszLogicalPath, const(wchar)* wszComponentName, const(wchar)* wszCaption, const(ubyte)* pbIcon, uint cbIcon, ubyte bRestoreMetadata, ubyte bNotifyOnBackupComplete, ubyte bSelectable, ubyte bSelectableForRestore, uint dwComponentFlags);
    HRESULT AddFilesToFileGroup(const(wchar)* wszLogicalPath, const(wchar)* wszGroupName, const(wchar)* wszPath, const(wchar)* wszFilespec, ubyte bRecursive, const(wchar)* wszAlternateLocation, uint dwBackupTypeMask);
    HRESULT SetRestoreMethod(VSS_RESTOREMETHOD_ENUM method, const(wchar)* wszService, const(wchar)* wszUserProcedure, VSS_WRITERRESTORE_ENUM writerRestore, ubyte bRebootRequired);
    HRESULT AddComponentDependency(const(wchar)* wszForLogicalPath, const(wchar)* wszForComponentName, GUID onWriterId, const(wchar)* wszOnLogicalPath, const(wchar)* wszOnComponentName);
    HRESULT SetBackupSchema(uint dwSchemaMask);
    HRESULT SaveAsXML(BSTR* pbstrXML);
}
enum IID_IVssExpressWriter = GUID(0xe33affdc, 0x59c7, 0x47b1, [0x97, 0xd5, 0x42, 0x66, 0x59, 0x8f, 0x62, 0x35]);
interface IVssExpressWriter : IUnknown
{
    HRESULT CreateMetadata(GUID writerId, const(wchar)* writerName, VSS_USAGE_TYPE usageType, uint versionMajor, uint versionMinor, uint reserved, IVssCreateExpressWriterMetadata* ppMetadata);
    HRESULT LoadMetadata(const(wchar)* metadata, uint reserved);
    HRESULT Register();
    HRESULT Unregister(GUID writerId);
}
alias VSS_MGMT_OBJECT_TYPE = int;
enum : int
{
    VSS_MGMT_OBJECT_UNKNOWN     = 0x00000000,
    VSS_MGMT_OBJECT_VOLUME      = 0x00000001,
    VSS_MGMT_OBJECT_DIFF_VOLUME = 0x00000002,
    VSS_MGMT_OBJECT_DIFF_AREA   = 0x00000003,
}

struct VSS_VOLUME_PROP
{
    ushort* m_pwszVolumeName;
    ushort* m_pwszVolumeDisplayName;
}
struct VSS_DIFF_VOLUME_PROP
{
    ushort* m_pwszVolumeName;
    ushort* m_pwszVolumeDisplayName;
    long m_llVolumeFreeSpace;
    long m_llVolumeTotalSpace;
}
struct VSS_DIFF_AREA_PROP
{
    ushort* m_pwszVolumeName;
    ushort* m_pwszDiffAreaVolumeName;
    long m_llMaximumDiffSpace;
    long m_llAllocatedDiffSpace;
    long m_llUsedDiffSpace;
}
union VSS_MGMT_OBJECT_UNION
{
    VSS_VOLUME_PROP Vol;
    VSS_DIFF_VOLUME_PROP DiffVol;
    VSS_DIFF_AREA_PROP DiffArea;
}
struct VSS_MGMT_OBJECT_PROP
{
    VSS_MGMT_OBJECT_TYPE Type;
    VSS_MGMT_OBJECT_UNION Obj;
}
alias VSS_PROTECTION_LEVEL = int;
enum : int
{
    VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME = 0x00000000,
    VSS_PROTECTION_LEVEL_SNAPSHOT        = 0x00000001,
}

alias VSS_PROTECTION_FAULT = int;
enum : int
{
    VSS_PROTECTION_FAULT_NONE                         = 0x00000000,
    VSS_PROTECTION_FAULT_DIFF_AREA_MISSING            = 0x00000001,
    VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE     = 0x00000002,
    VSS_PROTECTION_FAULT_META_DATA_CORRUPTION         = 0x00000003,
    VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE    = 0x00000004,
    VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE        = 0x00000005,
    VSS_PROTECTION_FAULT_COW_READ_FAILURE             = 0x00000006,
    VSS_PROTECTION_FAULT_COW_WRITE_FAILURE            = 0x00000007,
    VSS_PROTECTION_FAULT_DIFF_AREA_FULL               = 0x00000008,
    VSS_PROTECTION_FAULT_GROW_TOO_SLOW                = 0x00000009,
    VSS_PROTECTION_FAULT_GROW_FAILED                  = 0x0000000a,
    VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS        = 0x0000000b,
    VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE          = 0x0000000c,
    VSS_PROTECTION_FAULT_IO_FAILURE                   = 0x0000000d,
    VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED            = 0x0000000e,
    VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA = 0x0000000f,
    VSS_PROTECTION_FAULT_MOUNT_DURING_CLUSTER_OFFLINE = 0x00000010,
}

struct VSS_VOLUME_PROTECTION_INFO
{
    VSS_PROTECTION_LEVEL m_protectionLevel;
    BOOL m_volumeIsOfflineForProtection;
    VSS_PROTECTION_FAULT m_protectionFault;
    int m_failureStatus;
    BOOL m_volumeHasUnusedDiffArea;
    uint m_reserved;
}
enum IID_IVssSnapshotMgmt = GUID(0xfa7df749, 0x66e7, 0x4986, [0xa2, 0x7f, 0xe2, 0xf0, 0x4a, 0xe5, 0x37, 0x72]);
interface IVssSnapshotMgmt : IUnknown
{
    HRESULT GetProviderMgmtInterface(GUID ProviderId, const(GUID)* InterfaceId, IUnknown* ppItf);
    HRESULT QueryVolumesSupportedForSnapshots(GUID ProviderId, int lContext, IVssEnumMgmtObject* ppEnum);
    HRESULT QuerySnapshotsByVolume(ushort* pwszVolumeName, GUID ProviderId, IVssEnumObject* ppEnum);
}
enum IID_IVssSnapshotMgmt2 = GUID(0xf61ec39, 0xfe82, 0x45f2, [0xa3, 0xf0, 0x76, 0x8b, 0x5d, 0x42, 0x71, 0x2]);
interface IVssSnapshotMgmt2 : IUnknown
{
    HRESULT GetMinDiffAreaSize(long* pllMinDiffAreaSize);
}
enum IID_IVssDifferentialSoftwareSnapshotMgmt = GUID(0x214a0f28, 0xb737, 0x4026, [0xb8, 0x47, 0x4f, 0x9e, 0x37, 0xd7, 0x95, 0x29]);
interface IVssDifferentialSoftwareSnapshotMgmt : IUnknown
{
    HRESULT AddDiffArea(ushort* pwszVolumeName, ushort* pwszDiffAreaVolumeName, long llMaximumDiffSpace);
    HRESULT ChangeDiffAreaMaximumSize(ushort* pwszVolumeName, ushort* pwszDiffAreaVolumeName, long llMaximumDiffSpace);
    HRESULT QueryVolumesSupportedForDiffAreas(ushort* pwszOriginalVolumeName, IVssEnumMgmtObject* ppEnum);
    HRESULT QueryDiffAreasForVolume(ushort* pwszVolumeName, IVssEnumMgmtObject* ppEnum);
    HRESULT QueryDiffAreasOnVolume(ushort* pwszVolumeName, IVssEnumMgmtObject* ppEnum);
    HRESULT QueryDiffAreasForSnapshot(GUID SnapshotId, IVssEnumMgmtObject* ppEnum);
}
enum IID_IVssDifferentialSoftwareSnapshotMgmt2 = GUID(0x949d7353, 0x675f, 0x4275, [0x89, 0x69, 0xf0, 0x44, 0xc6, 0x27, 0x78, 0x15]);
interface IVssDifferentialSoftwareSnapshotMgmt2 : IVssDifferentialSoftwareSnapshotMgmt
{
    HRESULT ChangeDiffAreaMaximumSizeEx(ushort* pwszVolumeName, ushort* pwszDiffAreaVolumeName, long llMaximumDiffSpace, BOOL bVolatile);
    HRESULT MigrateDiffAreas(ushort* pwszVolumeName, ushort* pwszDiffAreaVolumeName, ushort* pwszNewDiffAreaVolumeName);
    HRESULT QueryMigrationStatus(ushort* pwszVolumeName, ushort* pwszDiffAreaVolumeName, IVssAsync* ppAsync);
    HRESULT SetSnapshotPriority(GUID idSnapshot, ubyte priority);
}
enum IID_IVssDifferentialSoftwareSnapshotMgmt3 = GUID(0x383f7e71, 0xa4c5, 0x401f, [0xb2, 0x7f, 0xf8, 0x26, 0x28, 0x9f, 0x84, 0x58]);
interface IVssDifferentialSoftwareSnapshotMgmt3 : IVssDifferentialSoftwareSnapshotMgmt2
{
    HRESULT SetVolumeProtectLevel(ushort* pwszVolumeName, VSS_PROTECTION_LEVEL protectionLevel);
    HRESULT GetVolumeProtectLevel(ushort* pwszVolumeName, VSS_VOLUME_PROTECTION_INFO* protectionLevel);
    HRESULT ClearVolumeProtectFault(ushort* pwszVolumeName);
    HRESULT DeleteUnusedDiffAreas(ushort* pwszDiffAreaVolumeName);
    HRESULT QuerySnapshotDeltaBitmap(GUID idSnapshotOlder, GUID idSnapshotYounger, uint* pcBlockSizePerBit, uint* pcBitmapLength, ubyte** ppbBitmap);
}
enum IID_IVssEnumMgmtObject = GUID(0x1954e6b, 0x9254, 0x4e6e, [0x80, 0x8c, 0xc9, 0xe0, 0x5d, 0x0, 0x76, 0x96]);
interface IVssEnumMgmtObject : IUnknown
{
    HRESULT Next(uint celt, VSS_MGMT_OBJECT_PROP* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IVssEnumMgmtObject* ppenum);
}
enum CLSID_VssSnapshotMgmt = GUID(0xb5a2c52, 0x3eb9, 0x470a, [0x96, 0xe2, 0x6c, 0x6d, 0x45, 0x70, 0xe4, 0xf]);
struct VssSnapshotMgmt
{
}
enum IID_IVssAdmin = GUID(0x77ed5996, 0x2f63, 0x11d3, [0x8a, 0x39, 0x0, 0xc0, 0x4f, 0x72, 0xd8, 0xe3]);
interface IVssAdmin : IUnknown
{
    HRESULT RegisterProvider(GUID pProviderId, GUID ClassId, ushort* pwszProviderName, VSS_PROVIDER_TYPE eProviderType, ushort* pwszProviderVersion, GUID ProviderVersionId);
    HRESULT UnregisterProvider(GUID ProviderId);
    HRESULT QueryProviders(IVssEnumObject* ppEnum);
    HRESULT AbortAllSnapshotsInProgress();
}
enum IID_IVssAdminEx = GUID(0x7858a9f8, 0xb1fa, 0x41a6, [0x96, 0x4f, 0xb9, 0xb3, 0x6b, 0x8c, 0xd8, 0xd8]);
interface IVssAdminEx : IVssAdmin
{
    HRESULT GetProviderCapability(GUID pProviderId, ulong* pllOriginalCapabilityMask);
    HRESULT GetProviderContext(GUID ProviderId, int* plContext);
    HRESULT SetProviderContext(GUID ProviderId, int lContext);
}
enum CLSID_VSSCoordinator = GUID(0xe579ab5f, 0x1cc4, 0x44b4, [0xbe, 0xd9, 0xde, 0x9, 0x91, 0xff, 0x6, 0x23]);
struct VSSCoordinator
{
}
enum IID_IVssSoftwareSnapshotProvider = GUID(0x609e123e, 0x2c5a, 0x44d3, [0x8f, 0x1, 0xb, 0x1d, 0x9a, 0x47, 0xd1, 0xff]);
interface IVssSoftwareSnapshotProvider : IUnknown
{
    HRESULT SetContext(int lContext);
    HRESULT GetSnapshotProperties(GUID SnapshotId, VSS_SNAPSHOT_PROP* pProp);
    HRESULT Query(GUID QueriedObjectId, VSS_OBJECT_TYPE eQueriedObjectType, VSS_OBJECT_TYPE eReturnedObjectsType, IVssEnumObject* ppEnum);
    HRESULT DeleteSnapshots(GUID SourceObjectId, VSS_OBJECT_TYPE eSourceObjectType, BOOL bForceDelete, int* plDeletedSnapshots, GUID* pNondeletedSnapshotID);
    HRESULT BeginPrepareSnapshot(GUID SnapshotSetId, GUID SnapshotId, ushort* pwszVolumeName, int lNewContext);
    HRESULT IsVolumeSupported(ushort* pwszVolumeName, BOOL* pbSupportedByThisProvider);
    HRESULT IsVolumeSnapshotted(ushort* pwszVolumeName, BOOL* pbSnapshotsPresent, int* plSnapshotCompatibility);
    HRESULT SetSnapshotProperty(GUID SnapshotId, VSS_SNAPSHOT_PROPERTY_ID eSnapshotPropertyId, VARIANT vProperty);
    HRESULT RevertToSnapshot(GUID SnapshotId);
    HRESULT QueryRevertStatus(ushort* pwszVolume, IVssAsync* ppAsync);
}
enum IID_IVssProviderCreateSnapshotSet = GUID(0x5f894e5b, 0x1e39, 0x4778, [0x8e, 0x23, 0x9a, 0xba, 0xd9, 0xf0, 0xe0, 0x8c]);
interface IVssProviderCreateSnapshotSet : IUnknown
{
    HRESULT EndPrepareSnapshots(GUID SnapshotSetId);
    HRESULT PreCommitSnapshots(GUID SnapshotSetId);
    HRESULT CommitSnapshots(GUID SnapshotSetId);
    HRESULT PostCommitSnapshots(GUID SnapshotSetId, int lSnapshotsCount);
    HRESULT PreFinalCommitSnapshots(GUID SnapshotSetId);
    HRESULT PostFinalCommitSnapshots(GUID SnapshotSetId);
    HRESULT AbortSnapshots(GUID SnapshotSetId);
}
enum IID_IVssProviderNotifications = GUID(0xe561901f, 0x3a5, 0x4afe, [0x86, 0xd0, 0x72, 0xba, 0xee, 0xce, 0x70, 0x4]);
interface IVssProviderNotifications : IUnknown
{
    HRESULT OnLoad(IUnknown pCallback);
    HRESULT OnUnload(BOOL bForceUnload);
}
enum IID_IVssHardwareSnapshotProvider = GUID(0x9593a157, 0x44e9, 0x4344, [0xbb, 0xeb, 0x44, 0xfb, 0xf9, 0xb0, 0x6b, 0x10]);
interface IVssHardwareSnapshotProvider : IUnknown
{
    HRESULT AreLunsSupported(int lLunCount, int lContext, ushort** rgwszDevices, VDS_LUN_INFORMATION* pLunInformation, BOOL* pbIsSupported);
    HRESULT FillInLunInfo(ushort* wszDeviceName, VDS_LUN_INFORMATION* pLunInfo, BOOL* pbIsSupported);
    HRESULT BeginPrepareSnapshot(GUID SnapshotSetId, GUID SnapshotId, int lContext, int lLunCount, ushort** rgDeviceNames, VDS_LUN_INFORMATION* rgLunInformation);
    HRESULT GetTargetLuns(int lLunCount, ushort** rgDeviceNames, VDS_LUN_INFORMATION* rgSourceLuns, VDS_LUN_INFORMATION* rgDestinationLuns);
    HRESULT LocateLuns(int lLunCount, VDS_LUN_INFORMATION* rgSourceLuns);
    HRESULT OnLunEmpty(ushort* wszDeviceName, VDS_LUN_INFORMATION* pInformation);
}
enum IID_IVssHardwareSnapshotProviderEx = GUID(0x7f5ba925, 0xcdb1, 0x4d11, [0xa7, 0x1f, 0x33, 0x9e, 0xb7, 0xe7, 0x9, 0xfd]);
interface IVssHardwareSnapshotProviderEx : IVssHardwareSnapshotProvider
{
    HRESULT GetProviderCapabilities(ulong* pllOriginalCapabilityMask);
    HRESULT OnLunStateChange(VDS_LUN_INFORMATION* pSnapshotLuns, VDS_LUN_INFORMATION* pOriginalLuns, uint dwCount, uint dwFlags);
    HRESULT ResyncLuns(VDS_LUN_INFORMATION* pSourceLuns, VDS_LUN_INFORMATION* pTargetLuns, uint dwCount, IVssAsync* ppAsync);
    HRESULT OnReuseLuns(VDS_LUN_INFORMATION* pSnapshotLuns, VDS_LUN_INFORMATION* pOriginalLuns, uint dwCount);
}
enum IID_IVssFileShareSnapshotProvider = GUID(0xc8636060, 0x7c2e, 0x11df, [0x8c, 0x4a, 0x8, 0x0, 0x20, 0xc, 0x9a, 0x66]);
interface IVssFileShareSnapshotProvider : IUnknown
{
    HRESULT SetContext(int lContext);
    HRESULT GetSnapshotProperties(GUID SnapshotId, VSS_SNAPSHOT_PROP* pProp);
    HRESULT Query(GUID QueriedObjectId, VSS_OBJECT_TYPE eQueriedObjectType, VSS_OBJECT_TYPE eReturnedObjectsType, IVssEnumObject* ppEnum);
    HRESULT DeleteSnapshots(GUID SourceObjectId, VSS_OBJECT_TYPE eSourceObjectType, BOOL bForceDelete, int* plDeletedSnapshots, GUID* pNondeletedSnapshotID);
    HRESULT BeginPrepareSnapshot(GUID SnapshotSetId, GUID SnapshotId, ushort* pwszSharePath, int lNewContext, GUID ProviderId);
    HRESULT IsPathSupported(ushort* pwszSharePath, BOOL* pbSupportedByThisProvider);
    HRESULT IsPathSnapshotted(ushort* pwszSharePath, BOOL* pbSnapshotsPresent, int* plSnapshotCompatibility);
    HRESULT SetSnapshotProperty(GUID SnapshotId, VSS_SNAPSHOT_PROPERTY_ID eSnapshotPropertyId, VARIANT vProperty);
}
