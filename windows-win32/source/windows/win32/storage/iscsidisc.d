module windows.win32.storage.iscsidisc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOLEAN, CHAR, LARGE_INTEGER, PSTR, PWSTR;
import windows.win32.system.ioctl : STORAGE_DEVICE_NUMBER;

version (Windows):
extern (Windows):

uint GetIScsiVersionInformation(ISCSI_VERSION_INFO*);
uint GetIScsiTargetInformationW(PWSTR, PWSTR, TARGET_INFORMATION_CLASS, uint*, void*);
uint GetIScsiTargetInformationA(PSTR, PSTR, TARGET_INFORMATION_CLASS, uint*, void*);
uint AddIScsiConnectionW(ISCSI_UNIQUE_SESSION_ID*, void*, uint, ISCSI_TARGET_PORTALW*, ulong, ISCSI_LOGIN_OPTIONS*, uint, PSTR, ISCSI_UNIQUE_SESSION_ID*);
uint AddIScsiConnectionA(ISCSI_UNIQUE_SESSION_ID*, void*, uint, ISCSI_TARGET_PORTALA*, ulong, ISCSI_LOGIN_OPTIONS*, uint, PSTR, ISCSI_UNIQUE_SESSION_ID*);
uint RemoveIScsiConnection(ISCSI_UNIQUE_SESSION_ID*, ISCSI_UNIQUE_SESSION_ID*);
uint ReportIScsiTargetsW(BOOLEAN, uint*, PWSTR);
uint ReportIScsiTargetsA(BOOLEAN, uint*, PSTR);
uint AddIScsiStaticTargetW(PWSTR, PWSTR, uint, BOOLEAN, ISCSI_TARGET_MAPPINGW*, ISCSI_LOGIN_OPTIONS*, ISCSI_TARGET_PORTAL_GROUPW*);
uint AddIScsiStaticTargetA(PSTR, PSTR, uint, BOOLEAN, ISCSI_TARGET_MAPPINGA*, ISCSI_LOGIN_OPTIONS*, ISCSI_TARGET_PORTAL_GROUPA*);
uint RemoveIScsiStaticTargetW(PWSTR);
uint RemoveIScsiStaticTargetA(PSTR);
uint AddIScsiSendTargetPortalW(PWSTR, uint, ISCSI_LOGIN_OPTIONS*, ulong, ISCSI_TARGET_PORTALW*);
uint AddIScsiSendTargetPortalA(PSTR, uint, ISCSI_LOGIN_OPTIONS*, ulong, ISCSI_TARGET_PORTALA*);
uint RemoveIScsiSendTargetPortalW(PWSTR, uint, ISCSI_TARGET_PORTALW*);
uint RemoveIScsiSendTargetPortalA(PSTR, uint, ISCSI_TARGET_PORTALA*);
uint RefreshIScsiSendTargetPortalW(PWSTR, uint, ISCSI_TARGET_PORTALW*);
uint RefreshIScsiSendTargetPortalA(PSTR, uint, ISCSI_TARGET_PORTALA*);
uint ReportIScsiSendTargetPortalsW(uint*, ISCSI_TARGET_PORTAL_INFOW*);
uint ReportIScsiSendTargetPortalsA(uint*, ISCSI_TARGET_PORTAL_INFOA*);
uint ReportIScsiSendTargetPortalsExW(uint*, uint*, ISCSI_TARGET_PORTAL_INFO_EXW*);
uint ReportIScsiSendTargetPortalsExA(uint*, uint*, ISCSI_TARGET_PORTAL_INFO_EXA*);
uint LoginIScsiTargetW(PWSTR, BOOLEAN, PWSTR, uint, ISCSI_TARGET_PORTALW*, ulong, ISCSI_TARGET_MAPPINGW*, ISCSI_LOGIN_OPTIONS*, uint, PSTR, BOOLEAN, ISCSI_UNIQUE_SESSION_ID*, ISCSI_UNIQUE_SESSION_ID*);
uint LoginIScsiTargetA(PSTR, BOOLEAN, PSTR, uint, ISCSI_TARGET_PORTALA*, ulong, ISCSI_TARGET_MAPPINGA*, ISCSI_LOGIN_OPTIONS*, uint, PSTR, BOOLEAN, ISCSI_UNIQUE_SESSION_ID*, ISCSI_UNIQUE_SESSION_ID*);
uint ReportIScsiPersistentLoginsW(uint*, PERSISTENT_ISCSI_LOGIN_INFOW*, uint*);
uint ReportIScsiPersistentLoginsA(uint*, PERSISTENT_ISCSI_LOGIN_INFOA*, uint*);
uint LogoutIScsiTarget(ISCSI_UNIQUE_SESSION_ID*);
uint RemoveIScsiPersistentTargetW(PWSTR, uint, PWSTR, ISCSI_TARGET_PORTALW*);
uint RemoveIScsiPersistentTargetA(PSTR, uint, PSTR, ISCSI_TARGET_PORTALA*);
uint SendScsiInquiry(ISCSI_UNIQUE_SESSION_ID*, ulong, ubyte, ubyte, ubyte*, uint*, ubyte*, uint*, ubyte*);
uint SendScsiReadCapacity(ISCSI_UNIQUE_SESSION_ID*, ulong, ubyte*, uint*, ubyte*, uint*, ubyte*);
uint SendScsiReportLuns(ISCSI_UNIQUE_SESSION_ID*, ubyte*, uint*, ubyte*, uint*, ubyte*);
uint ReportIScsiInitiatorListW(uint*, PWSTR);
uint ReportIScsiInitiatorListA(uint*, PSTR);
uint ReportActiveIScsiTargetMappingsW(uint*, uint*, ISCSI_TARGET_MAPPINGW*);
uint ReportActiveIScsiTargetMappingsA(uint*, uint*, ISCSI_TARGET_MAPPINGA*);
uint SetIScsiTunnelModeOuterAddressW(PWSTR, uint, PWSTR, PWSTR, BOOLEAN);
uint SetIScsiTunnelModeOuterAddressA(PSTR, uint, PSTR, PSTR, BOOLEAN);
uint SetIScsiIKEInfoW(PWSTR, uint, IKE_AUTHENTICATION_INFORMATION*, BOOLEAN);
uint SetIScsiIKEInfoA(PSTR, uint, IKE_AUTHENTICATION_INFORMATION*, BOOLEAN);
uint GetIScsiIKEInfoW(PWSTR, uint, uint*, IKE_AUTHENTICATION_INFORMATION*);
uint GetIScsiIKEInfoA(PSTR, uint, uint*, IKE_AUTHENTICATION_INFORMATION*);
uint SetIScsiGroupPresharedKey(uint, ubyte*, BOOLEAN);
uint SetIScsiInitiatorCHAPSharedSecret(uint, ubyte*);
uint SetIScsiInitiatorRADIUSSharedSecret(uint, ubyte*);
uint SetIScsiInitiatorNodeNameW(PWSTR);
uint SetIScsiInitiatorNodeNameA(PSTR);
uint GetIScsiInitiatorNodeNameW(PWSTR);
uint GetIScsiInitiatorNodeNameA(PSTR);
uint AddISNSServerW(PWSTR);
uint AddISNSServerA(PSTR);
uint RemoveISNSServerW(PWSTR);
uint RemoveISNSServerA(PSTR);
uint RefreshISNSServerW(PWSTR);
uint RefreshISNSServerA(PSTR);
uint ReportISNSServerListW(uint*, PWSTR);
uint ReportISNSServerListA(uint*, PSTR);
uint GetIScsiSessionListW(uint*, uint*, ISCSI_SESSION_INFOW*);
uint GetIScsiSessionListA(uint*, uint*, ISCSI_SESSION_INFOA*);
uint GetIScsiSessionListEx(uint*, uint*, ISCSI_SESSION_INFO_EX*);
uint GetDevicesForIScsiSessionW(ISCSI_UNIQUE_SESSION_ID*, uint*, ISCSI_DEVICE_ON_SESSIONW*);
uint GetDevicesForIScsiSessionA(ISCSI_UNIQUE_SESSION_ID*, uint*, ISCSI_DEVICE_ON_SESSIONA*);
uint SetupPersistentIScsiVolumes();
uint SetupPersistentIScsiDevices();
uint AddPersistentIScsiDeviceW(PWSTR);
uint AddPersistentIScsiDeviceA(PSTR);
uint RemovePersistentIScsiDeviceW(PWSTR);
uint RemovePersistentIScsiDeviceA(PSTR);
uint ClearPersistentIScsiDevices();
uint ReportPersistentIScsiDevicesW(uint*, PWSTR);
uint ReportPersistentIScsiDevicesA(uint*, PSTR);
uint ReportIScsiTargetPortalsW(PWSTR, PWSTR, ushort*, uint*, ISCSI_TARGET_PORTALW*);
uint ReportIScsiTargetPortalsA(PSTR, PSTR, ushort*, uint*, ISCSI_TARGET_PORTALA*);
uint AddRadiusServerW(PWSTR);
uint AddRadiusServerA(PSTR);
uint RemoveRadiusServerW(PWSTR);
uint RemoveRadiusServerA(PSTR);
uint ReportRadiusServerListW(uint*, PWSTR);
uint ReportRadiusServerListA(uint*, PSTR);
enum IOCTL_SCSI_BASE = 0x00000004;
enum ScsiRawInterfaceGuid = GUID(0x53f56309, 0xb6bf, 0x11d0, [0x94, 0xf2, 0x0, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b]);
enum WmiScsiAddressGuid = GUID(0x53f5630f, 0xb6bf, 0x11d0, [0x94, 0xf2, 0x0, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b]);
enum FILE_DEVICE_SCSI = 0x0000001b;
enum DD_SCSI_DEVICE_NAME = "\\Device\\ScsiPort";
enum IOCTL_SCSI_PASS_THROUGH = 0x0004d004;
enum IOCTL_SCSI_MINIPORT = 0x0004d008;
enum IOCTL_SCSI_GET_INQUIRY_DATA = 0x0004100c;
enum IOCTL_SCSI_GET_CAPABILITIES = 0x00041010;
enum IOCTL_SCSI_PASS_THROUGH_DIRECT = 0x0004d014;
enum IOCTL_SCSI_GET_ADDRESS = 0x00041018;
enum IOCTL_SCSI_RESCAN_BUS = 0x0004101c;
enum IOCTL_SCSI_GET_DUMP_POINTERS = 0x00041020;
enum IOCTL_SCSI_FREE_DUMP_POINTERS = 0x00041024;
enum IOCTL_IDE_PASS_THROUGH = 0x0004d028;
enum IOCTL_ATA_PASS_THROUGH = 0x0004d02c;
enum IOCTL_ATA_PASS_THROUGH_DIRECT = 0x0004d030;
enum IOCTL_ATA_MINIPORT = 0x0004d034;
enum IOCTL_MINIPORT_PROCESS_SERVICE_IRP = 0x0004d038;
enum IOCTL_MPIO_PASS_THROUGH_PATH = 0x0004d03c;
enum IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT = 0x0004d040;
enum IOCTL_SCSI_PASS_THROUGH_EX = 0x0004d044;
enum IOCTL_SCSI_PASS_THROUGH_DIRECT_EX = 0x0004d048;
enum IOCTL_MPIO_PASS_THROUGH_PATH_EX = 0x0004d04c;
enum IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT_EX = 0x0004d050;
enum ATA_FLAGS_DRDY_REQUIRED = 0x00000001;
enum ATA_FLAGS_DATA_IN = 0x00000002;
enum ATA_FLAGS_DATA_OUT = 0x00000004;
enum ATA_FLAGS_48BIT_COMMAND = 0x00000008;
enum ATA_FLAGS_USE_DMA = 0x00000010;
enum ATA_FLAGS_NO_MULTIPLE = 0x00000020;
enum IOCTL_MINIPORT_SIGNATURE_SCSIDISK = "SCSIDISK";
enum IOCTL_MINIPORT_SIGNATURE_HYBRDISK = "HYBRDISK";
enum IOCTL_MINIPORT_SIGNATURE_DSM_NOTIFICATION = "MPDSM   ";
enum IOCTL_MINIPORT_SIGNATURE_DSM_GENERAL = "MPDSMGEN";
enum IOCTL_MINIPORT_SIGNATURE_FIRMWARE = "FIRMWARE";
enum IOCTL_MINIPORT_SIGNATURE_QUERY_PROTOCOL = "PROTOCOL";
enum IOCTL_MINIPORT_SIGNATURE_SET_PROTOCOL = "SETPROTO";
enum IOCTL_MINIPORT_SIGNATURE_QUERY_TEMPERATURE = "TEMPERAT";
enum IOCTL_MINIPORT_SIGNATURE_SET_TEMPERATURE_THRESHOLD = "SETTEMPT";
enum IOCTL_MINIPORT_SIGNATURE_QUERY_PHYSICAL_TOPOLOGY = "TOPOLOGY";
enum IOCTL_MINIPORT_SIGNATURE_ENDURANCE_INFO = "ENDURINF";
enum NRB_FUNCTION_NVCACHE_INFO = 0x000000ec;
enum NRB_FUNCTION_SPINDLE_STATUS = 0x000000e5;
enum NRB_FUNCTION_NVCACHE_POWER_MODE_SET = 0x00000000;
enum NRB_FUNCTION_NVCACHE_POWER_MODE_RETURN = 0x00000001;
enum NRB_FUNCTION_FLUSH_NVCACHE = 0x00000014;
enum NRB_FUNCTION_QUERY_PINNED_SET = 0x00000012;
enum NRB_FUNCTION_QUERY_CACHE_MISS = 0x00000013;
enum NRB_FUNCTION_ADD_LBAS_PINNED_SET = 0x00000010;
enum NRB_FUNCTION_REMOVE_LBAS_PINNED_SET = 0x00000011;
enum NRB_FUNCTION_QUERY_ASCENDER_STATUS = 0x000000d0;
enum NRB_FUNCTION_QUERY_HYBRID_DISK_STATUS = 0x000000d1;
enum NRB_FUNCTION_PASS_HINT_PAYLOAD = 0x000000e0;
enum NRB_FUNCTION_NVSEPARATED_INFO = 0x000000c0;
enum NRB_FUNCTION_NVSEPARATED_FLUSH = 0x000000c1;
enum NRB_FUNCTION_NVSEPARATED_WB_DISABLE = 0x000000c2;
enum NRB_FUNCTION_NVSEPARATED_WB_REVERT_DEFAULT = 0x000000c3;
enum NRB_SUCCESS = 0x00000000;
enum NRB_ILLEGAL_REQUEST = 0x00000001;
enum NRB_INVALID_PARAMETER = 0x00000002;
enum NRB_INPUT_DATA_OVERRUN = 0x00000003;
enum NRB_INPUT_DATA_UNDERRUN = 0x00000004;
enum NRB_OUTPUT_DATA_OVERRUN = 0x00000005;
enum NRB_OUTPUT_DATA_UNDERRUN = 0x00000006;
enum NV_SEP_CACHE_PARAMETER_VERSION_1 = 0x00000001;
enum NV_SEP_CACHE_PARAMETER_VERSION = 0x00000001;
enum STORAGE_DIAGNOSTIC_STATUS_SUCCESS = 0x00000000;
enum STORAGE_DIAGNOSTIC_STATUS_BUFFER_TOO_SMALL = 0x00000001;
enum STORAGE_DIAGNOSTIC_STATUS_UNSUPPORTED_VERSION = 0x00000002;
enum STORAGE_DIAGNOSTIC_STATUS_INVALID_PARAMETER = 0x00000003;
enum STORAGE_DIAGNOSTIC_STATUS_INVALID_SIGNATURE = 0x00000004;
enum STORAGE_DIAGNOSTIC_STATUS_INVALID_TARGET_TYPE = 0x00000005;
enum STORAGE_DIAGNOSTIC_STATUS_MORE_DATA = 0x00000006;
enum MINIPORT_DSM_NOTIFICATION_VERSION_1 = 0x00000001;
enum MINIPORT_DSM_NOTIFICATION_VERSION = 0x00000001;
enum MINIPORT_DSM_PROFILE_UNKNOWN = 0x00000000;
enum MINIPORT_DSM_PROFILE_PAGE_FILE = 0x00000001;
enum MINIPORT_DSM_PROFILE_HIBERNATION_FILE = 0x00000002;
enum MINIPORT_DSM_PROFILE_CRASHDUMP_FILE = 0x00000003;
enum MINIPORT_DSM_NOTIFY_FLAG_BEGIN = 0x00000001;
enum MINIPORT_DSM_NOTIFY_FLAG_END = 0x00000002;
enum HYBRID_FUNCTION_GET_INFO = 0x00000001;
enum HYBRID_FUNCTION_DISABLE_CACHING_MEDIUM = 0x00000010;
enum HYBRID_FUNCTION_ENABLE_CACHING_MEDIUM = 0x00000011;
enum HYBRID_FUNCTION_SET_DIRTY_THRESHOLD = 0x00000012;
enum HYBRID_FUNCTION_DEMOTE_BY_SIZE = 0x00000013;
enum HYBRID_STATUS_SUCCESS = 0x00000000;
enum HYBRID_STATUS_ILLEGAL_REQUEST = 0x00000001;
enum HYBRID_STATUS_INVALID_PARAMETER = 0x00000002;
enum HYBRID_STATUS_OUTPUT_BUFFER_TOO_SMALL = 0x00000003;
enum HYBRID_STATUS_ENABLE_REFCOUNT_HOLD = 0x00000010;
enum HYBRID_REQUEST_BLOCK_STRUCTURE_VERSION = 0x00000001;
enum HYBRID_REQUEST_INFO_STRUCTURE_VERSION = 0x00000001;
enum FIRMWARE_FUNCTION_GET_INFO = 0x00000001;
enum FIRMWARE_FUNCTION_DOWNLOAD = 0x00000002;
enum FIRMWARE_FUNCTION_ACTIVATE = 0x00000003;
enum FIRMWARE_STATUS_SUCCESS = 0x00000000;
enum FIRMWARE_STATUS_ERROR = 0x00000001;
enum FIRMWARE_STATUS_ILLEGAL_REQUEST = 0x00000002;
enum FIRMWARE_STATUS_INVALID_PARAMETER = 0x00000003;
enum FIRMWARE_STATUS_INPUT_BUFFER_TOO_BIG = 0x00000004;
enum FIRMWARE_STATUS_OUTPUT_BUFFER_TOO_SMALL = 0x00000005;
enum FIRMWARE_STATUS_INVALID_SLOT = 0x00000006;
enum FIRMWARE_STATUS_INVALID_IMAGE = 0x00000007;
enum FIRMWARE_STATUS_CONTROLLER_ERROR = 0x00000010;
enum FIRMWARE_STATUS_POWER_CYCLE_REQUIRED = 0x00000020;
enum FIRMWARE_STATUS_DEVICE_ERROR = 0x00000040;
enum FIRMWARE_STATUS_INTERFACE_CRC_ERROR = 0x00000080;
enum FIRMWARE_STATUS_UNCORRECTABLE_DATA_ERROR = 0x00000081;
enum FIRMWARE_STATUS_MEDIA_CHANGE = 0x00000082;
enum FIRMWARE_STATUS_ID_NOT_FOUND = 0x00000083;
enum FIRMWARE_STATUS_MEDIA_CHANGE_REQUEST = 0x00000084;
enum FIRMWARE_STATUS_COMMAND_ABORT = 0x00000085;
enum FIRMWARE_STATUS_END_OF_MEDIA = 0x00000086;
enum FIRMWARE_STATUS_ILLEGAL_LENGTH = 0x00000087;
enum FIRMWARE_REQUEST_BLOCK_STRUCTURE_VERSION = 0x00000001;
enum FIRMWARE_REQUEST_FLAG_CONTROLLER = 0x00000001;
enum FIRMWARE_REQUEST_FLAG_LAST_SEGMENT = 0x00000002;
enum FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT = 0x00000004;
enum FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE = 0x80000000;
enum STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION = 0x00000001;
enum STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION_V2 = 0x00000002;
enum STORAGE_FIRMWARE_INFO_INVALID_SLOT = 0x000000ff;
enum STORAGE_FIRMWARE_SLOT_INFO_V2_REVISION_LENGTH = 0x00000010;
enum STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION = 0x00000001;
enum STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION_V2 = 0x00000002;
enum STORAGE_FIRMWARE_ACTIVATE_STRUCTURE_VERSION = 0x00000001;
enum DUMP_POINTERS_VERSION_1 = 0x00000001;
enum DUMP_POINTERS_VERSION_2 = 0x00000002;
enum DUMP_POINTERS_VERSION_3 = 0x00000003;
enum DUMP_POINTERS_VERSION_4 = 0x00000004;
enum DUMP_DRIVER_NAME_LENGTH = 0x0000000f;
enum DUMP_EX_FLAG_SUPPORT_64BITMEMORY = 0x00000001;
enum DUMP_EX_FLAG_SUPPORT_DD_TELEMETRY = 0x00000002;
enum DUMP_EX_FLAG_RESUME_SUPPORT = 0x00000004;
enum DUMP_EX_FLAG_DRIVER_FULL_PATH_SUPPORT = 0x00000008;
enum SCSI_IOCTL_DATA_OUT = 0x00000000;
enum SCSI_IOCTL_DATA_IN = 0x00000001;
enum SCSI_IOCTL_DATA_UNSPECIFIED = 0x00000002;
enum SCSI_IOCTL_DATA_BIDIRECTIONAL = 0x00000003;
enum MPIO_IOCTL_FLAG_USE_PATHID = 0x00000001;
enum MPIO_IOCTL_FLAG_USE_SCSIADDRESS = 0x00000002;
enum MPIO_IOCTL_FLAG_INVOLVE_DSM = 0x00000004;
enum MAX_ISCSI_HBANAME_LEN = 0x00000100;
enum MAX_ISCSI_NAME_LEN = 0x000000df;
enum MAX_ISCSI_ALIAS_LEN = 0x000000ff;
enum MAX_ISCSI_PORTAL_NAME_LEN = 0x00000100;
enum MAX_ISCSI_PORTAL_ALIAS_LEN = 0x00000100;
enum MAX_ISCSI_TEXT_ADDRESS_LEN = 0x00000100;
enum MAX_ISCSI_PORTAL_ADDRESS_LEN = 0x00000100;
enum MAX_ISCSI_DISCOVERY_DOMAIN_LEN = 0x00000100;
enum MAX_RADIUS_ADDRESS_LEN = 0x00000029;
enum ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED = "0x00000040";
enum ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED = "0x00000020";
enum ISCSI_SECURITY_FLAG_PFS_ENABLED = "0x00000010";
enum ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED = "0x00000008";
enum ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED = "0x00000004";
enum ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED = "0x00000002";
enum ISCSI_SECURITY_FLAG_VALID = "0x00000001";
enum ISCSI_LOGIN_OPTIONS_HEADER_DIGEST = "0x00000001";
enum ISCSI_LOGIN_OPTIONS_DATA_DIGEST = "0x00000002";
enum ISCSI_LOGIN_OPTIONS_MAXIMUM_CONNECTIONS = "0x00000004";
enum ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_WAIT = "0x00000008";
enum ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_RETAIN = "0x00000010";
enum ISCSI_LOGIN_OPTIONS_USERNAME = "0x00000020";
enum ISCSI_LOGIN_OPTIONS_PASSWORD = "0x00000040";
enum ISCSI_LOGIN_OPTIONS_AUTH_TYPE = "0x00000080";
enum ID_IPV4_ADDR = "1";
enum ID_FQDN = "2";
enum ID_USER_FQDN = "3";
enum ID_IPV6_ADDR = "5";
enum ISCSI_LOGIN_FLAG_REQUIRE_IPSEC = 0x00000001;
enum ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED = 0x00000002;
enum ISCSI_LOGIN_FLAG_RESERVED1 = 0x00000004;
enum ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING = 0x00000008;
enum ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE = 0x00000010;
enum ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION = 0x00000020;
enum ISCSI_LOGIN_OPTIONS_VERSION = 0x00000000;
enum ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET = 0x00000002;
enum ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION = 0x00000004;
struct _ADAPTER_OBJECT
{
}
struct SCSI_PASS_THROUGH
{
    ushort Length;
    ubyte ScsiStatus;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte CdbLength;
    ubyte SenseInfoLength;
    ubyte DataIn;
    uint DataTransferLength;
    uint TimeOutValue;
    ulong DataBufferOffset;
    uint SenseInfoOffset;
    ubyte[16] Cdb;
}
struct SCSI_PASS_THROUGH_DIRECT
{
    ushort Length;
    ubyte ScsiStatus;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte CdbLength;
    ubyte SenseInfoLength;
    ubyte DataIn;
    uint DataTransferLength;
    uint TimeOutValue;
    void* DataBuffer;
    uint SenseInfoOffset;
    ubyte[16] Cdb;
}
struct SCSI_PASS_THROUGH32
{
    ushort Length;
    ubyte ScsiStatus;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte CdbLength;
    ubyte SenseInfoLength;
    ubyte DataIn;
    uint DataTransferLength;
    uint TimeOutValue;
    uint DataBufferOffset;
    uint SenseInfoOffset;
    ubyte[16] Cdb;
}
struct SCSI_PASS_THROUGH_DIRECT32
{
    ushort Length;
    ubyte ScsiStatus;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte CdbLength;
    ubyte SenseInfoLength;
    ubyte DataIn;
    uint DataTransferLength;
    uint TimeOutValue;
    void* DataBuffer;
    uint SenseInfoOffset;
    ubyte[16] Cdb;
}
struct SCSI_PASS_THROUGH_EX
{
    uint Version;
    uint Length;
    uint CdbLength;
    uint StorAddressLength;
    ubyte ScsiStatus;
    ubyte SenseInfoLength;
    ubyte DataDirection;
    ubyte Reserved;
    uint TimeOutValue;
    uint StorAddressOffset;
    uint SenseInfoOffset;
    uint DataOutTransferLength;
    uint DataInTransferLength;
    ulong DataOutBufferOffset;
    ulong DataInBufferOffset;
    ubyte[1] Cdb;
}
struct SCSI_PASS_THROUGH_DIRECT_EX
{
    uint Version;
    uint Length;
    uint CdbLength;
    uint StorAddressLength;
    ubyte ScsiStatus;
    ubyte SenseInfoLength;
    ubyte DataDirection;
    ubyte Reserved;
    uint TimeOutValue;
    uint StorAddressOffset;
    uint SenseInfoOffset;
    uint DataOutTransferLength;
    uint DataInTransferLength;
    void* DataOutBuffer;
    void* DataInBuffer;
    ubyte[1] Cdb;
}
struct SCSI_PASS_THROUGH32_EX
{
    uint Version;
    uint Length;
    uint CdbLength;
    uint StorAddressLength;
    ubyte ScsiStatus;
    ubyte SenseInfoLength;
    ubyte DataDirection;
    ubyte Reserved;
    uint TimeOutValue;
    uint StorAddressOffset;
    uint SenseInfoOffset;
    uint DataOutTransferLength;
    uint DataInTransferLength;
    uint DataOutBufferOffset;
    uint DataInBufferOffset;
    ubyte[1] Cdb;
}
struct SCSI_PASS_THROUGH_DIRECT32_EX
{
    uint Version;
    uint Length;
    uint CdbLength;
    uint StorAddressLength;
    ubyte ScsiStatus;
    ubyte SenseInfoLength;
    ubyte DataDirection;
    ubyte Reserved;
    uint TimeOutValue;
    uint StorAddressOffset;
    uint SenseInfoOffset;
    uint DataOutTransferLength;
    uint DataInTransferLength;
    void* DataOutBuffer;
    void* DataInBuffer;
    ubyte[1] Cdb;
}
struct ATA_PASS_THROUGH_EX
{
    ushort Length;
    ushort AtaFlags;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte ReservedAsUchar;
    uint DataTransferLength;
    uint TimeOutValue;
    uint ReservedAsUlong;
    ulong DataBufferOffset;
    ubyte[8] PreviousTaskFile;
    ubyte[8] CurrentTaskFile;
}
struct ATA_PASS_THROUGH_DIRECT
{
    ushort Length;
    ushort AtaFlags;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte ReservedAsUchar;
    uint DataTransferLength;
    uint TimeOutValue;
    uint ReservedAsUlong;
    void* DataBuffer;
    ubyte[8] PreviousTaskFile;
    ubyte[8] CurrentTaskFile;
}
struct ATA_PASS_THROUGH_EX32
{
    ushort Length;
    ushort AtaFlags;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte ReservedAsUchar;
    uint DataTransferLength;
    uint TimeOutValue;
    uint ReservedAsUlong;
    uint DataBufferOffset;
    ubyte[8] PreviousTaskFile;
    ubyte[8] CurrentTaskFile;
}
struct ATA_PASS_THROUGH_DIRECT32
{
    ushort Length;
    ushort AtaFlags;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    ubyte ReservedAsUchar;
    uint DataTransferLength;
    uint TimeOutValue;
    uint ReservedAsUlong;
    void* DataBuffer;
    ubyte[8] PreviousTaskFile;
    ubyte[8] CurrentTaskFile;
}
struct IDE_IO_CONTROL
{
    uint HeaderLength;
    ubyte[8] Signature;
    uint Timeout;
    uint ControlCode;
    uint ReturnStatus;
    uint DataLength;
}
struct MPIO_PASS_THROUGH_PATH
{
    SCSI_PASS_THROUGH PassThrough;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH_DIRECT
{
    SCSI_PASS_THROUGH_DIRECT PassThrough;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH_EX
{
    uint PassThroughOffset;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH_DIRECT_EX
{
    uint PassThroughOffset;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH32
{
    SCSI_PASS_THROUGH32 PassThrough;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH_DIRECT32
{
    SCSI_PASS_THROUGH_DIRECT32 PassThrough;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH32_EX
{
    uint PassThroughOffset;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct MPIO_PASS_THROUGH_PATH_DIRECT32_EX
{
    uint PassThroughOffset;
    uint Version;
    ushort Length;
    ubyte Flags;
    ubyte PortNumber;
    ulong MpioPathId;
}
struct SCSI_BUS_DATA
{
    ubyte NumberOfLogicalUnits;
    ubyte InitiatorBusId;
    uint InquiryDataOffset;
}
struct SCSI_ADAPTER_BUS_INFO
{
    ubyte NumberOfBuses;
    SCSI_BUS_DATA[1] BusData;
}
struct SCSI_INQUIRY_DATA
{
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
    BOOLEAN DeviceClaimed;
    uint InquiryDataLength;
    uint NextInquiryDataOffset;
    ubyte[1] InquiryData;
}
struct SRB_IO_CONTROL
{
    uint HeaderLength;
    ubyte[8] Signature;
    uint Timeout;
    uint ControlCode;
    uint ReturnCode;
    uint Length;
}
struct NVCACHE_REQUEST_BLOCK
{
    uint NRBSize;
    ushort Function;
    uint NRBFlags;
    uint NRBStatus;
    uint Count;
    ulong LBA;
    uint DataBufSize;
    uint NVCacheStatus;
    uint NVCacheSubStatus;
}
struct NV_FEATURE_PARAMETER
{
    ushort NVPowerModeEnabled;
    ushort NVParameterReserv1;
    ushort NVCmdEnabled;
    ushort NVParameterReserv2;
    ushort NVPowerModeVer;
    ushort NVCmdVer;
    uint NVSize;
    ushort NVReadSpeed;
    ushort NVWrtSpeed;
    uint DeviceSpinUpTime;
}
struct NVCACHE_HINT_PAYLOAD
{
    ubyte Command;
    ubyte Feature7_0;
    ubyte Feature15_8;
    ubyte Count15_8;
    ubyte LBA7_0;
    ubyte LBA15_8;
    ubyte LBA23_16;
    ubyte LBA31_24;
    ubyte LBA39_32;
    ubyte LBA47_40;
    ubyte Auxiliary7_0;
    ubyte Auxiliary23_16;
    ubyte[4] Reserved;
}
struct NV_SEP_CACHE_PARAMETER
{
    uint Version;
    uint Size;
    union _Flags_e__Union
    {
        struct _CacheFlags_e__Struct
        {
            ubyte _bitfield0;
        }
        ubyte CacheFlagsSet;
    }
    ubyte WriteCacheType;
    ubyte WriteCacheTypeEffective;
    ubyte[3] ParameterReserve1;
}
alias NV_SEP_WRITE_CACHE_TYPE = int;
enum : int
{
    NVSEPWriteCacheTypeUnknown      = 0x00000000,
    NVSEPWriteCacheTypeNone         = 0x00000001,
    NVSEPWriteCacheTypeWriteBack    = 0x00000002,
    NVSEPWriteCacheTypeWriteThrough = 0x00000003,
}

alias MP_STORAGE_DIAGNOSTIC_LEVEL = int;
enum : int
{
    MpStorageDiagnosticLevelDefault = 0x00000000,
    MpStorageDiagnosticLevelMax     = 0x00000001,
}

alias MP_STORAGE_DIAGNOSTIC_TARGET_TYPE = int;
enum : int
{
    MpStorageDiagnosticTargetTypeUndefined   = 0x00000000,
    MpStorageDiagnosticTargetTypeMiniport    = 0x00000002,
    MpStorageDiagnosticTargetTypeHbaFirmware = 0x00000003,
    MpStorageDiagnosticTargetTypeMax         = 0x00000004,
}

struct STORAGE_DIAGNOSTIC_MP_REQUEST
{
    uint Version;
    uint Size;
    MP_STORAGE_DIAGNOSTIC_TARGET_TYPE TargetType;
    MP_STORAGE_DIAGNOSTIC_LEVEL Level;
    GUID ProviderId;
    uint BufferSize;
    uint Reserved;
    ubyte[1] DataBuffer;
}
struct MP_DEVICE_DATA_SET_RANGE
{
    long StartingOffset;
    ulong LengthInBytes;
}
struct DSM_NOTIFICATION_REQUEST_BLOCK
{
    uint Size;
    uint Version;
    uint NotifyFlags;
    uint DataSetProfile;
    uint[3] Reserved;
    uint DataSetRangesCount;
    MP_DEVICE_DATA_SET_RANGE[1] DataSetRanges;
}
struct HYBRID_REQUEST_BLOCK
{
    uint Version;
    uint Size;
    uint Function;
    uint Flags;
    uint DataBufferOffset;
    uint DataBufferLength;
}
alias NVCACHE_TYPE = int;
enum : int
{
    NvCacheTypeUnknown      = 0x00000000,
    NvCacheTypeNone         = 0x00000001,
    NvCacheTypeWriteBack    = 0x00000002,
    NvCacheTypeWriteThrough = 0x00000003,
}

alias NVCACHE_STATUS = int;
enum : int
{
    NvCacheStatusUnknown   = 0x00000000,
    NvCacheStatusDisabling = 0x00000001,
    NvCacheStatusDisabled  = 0x00000002,
    NvCacheStatusEnabled   = 0x00000003,
}

struct NVCACHE_PRIORITY_LEVEL_DESCRIPTOR
{
    ubyte PriorityLevel;
    ubyte[3] Reserved0;
    uint ConsumedNVMSizeFraction;
    uint ConsumedMappingResourcesFraction;
    uint ConsumedNVMSizeForDirtyDataFraction;
    uint ConsumedMappingResourcesForDirtyDataFraction;
    uint Reserved1;
}
struct HYBRID_INFORMATION
{
    uint Version;
    uint Size;
    BOOLEAN HybridSupported;
    NVCACHE_STATUS Status;
    NVCACHE_TYPE CacheTypeEffective;
    NVCACHE_TYPE CacheTypeDefault;
    uint FractionBase;
    ulong CacheSize;
    struct _Attributes_e__Struct
    {
        uint _bitfield0;
    }
    struct _Priorities_e__Struct
    {
        ubyte PriorityLevelCount;
        BOOLEAN MaxPriorityBehavior;
        ubyte OptimalWriteGranularity;
        ubyte Reserved;
        uint DirtyThresholdLow;
        uint DirtyThresholdHigh;
        struct _SupportedCommands_e__Struct
        {
            uint _bitfield1;
            uint MaxEvictCommands;
            uint MaxLbaRangeCountForEvict;
            uint MaxLbaRangeCountForChangeLba;
        }
        NVCACHE_PRIORITY_LEVEL_DESCRIPTOR[1] Priority;
    }
}
struct HYBRID_DIRTY_THRESHOLDS
{
    uint Version;
    uint Size;
    uint DirtyLowThreshold;
    uint DirtyHighThreshold;
}
struct HYBRID_DEMOTE_BY_SIZE
{
    uint Version;
    uint Size;
    ubyte SourcePriority;
    ubyte TargetPriority;
    ushort Reserved0;
    uint Reserved1;
    ulong LbaCount;
}
struct FIRMWARE_REQUEST_BLOCK
{
    uint Version;
    uint Size;
    uint Function;
    uint Flags;
    uint DataBufferOffset;
    uint DataBufferLength;
}
struct STORAGE_FIRMWARE_SLOT_INFO
{
    ubyte SlotNumber;
    BOOLEAN ReadOnly;
    ubyte[6] Reserved;
    union _Revision_e__Union
    {
        ubyte[8] Info;
        ulong AsUlonglong;
    }
}
struct STORAGE_FIRMWARE_SLOT_INFO_V2
{
    ubyte SlotNumber;
    BOOLEAN ReadOnly;
    ubyte[6] Reserved;
    ubyte[16] Revision;
}
struct STORAGE_FIRMWARE_INFO
{
    uint Version;
    uint Size;
    BOOLEAN UpgradeSupport;
    ubyte SlotCount;
    ubyte ActiveSlot;
    ubyte PendingActivateSlot;
    uint Reserved;
    STORAGE_FIRMWARE_SLOT_INFO[1] Slot;
}
struct STORAGE_FIRMWARE_INFO_V2
{
    uint Version;
    uint Size;
    BOOLEAN UpgradeSupport;
    ubyte SlotCount;
    ubyte ActiveSlot;
    ubyte PendingActivateSlot;
    BOOLEAN FirmwareShared;
    ubyte[3] Reserved;
    uint ImagePayloadAlignment;
    uint ImagePayloadMaxSize;
    STORAGE_FIRMWARE_SLOT_INFO_V2[1] Slot;
}
struct STORAGE_FIRMWARE_DOWNLOAD
{
    uint Version;
    uint Size;
    ulong Offset;
    ulong BufferSize;
    ubyte[1] ImageBuffer;
}
struct STORAGE_FIRMWARE_DOWNLOAD_V2
{
    uint Version;
    uint Size;
    ulong Offset;
    ulong BufferSize;
    ubyte Slot;
    ubyte[3] Reserved;
    uint ImageSize;
    ubyte[1] ImageBuffer;
}
struct STORAGE_FIRMWARE_ACTIVATE
{
    uint Version;
    uint Size;
    ubyte SlotToActivate;
    ubyte[3] Reserved0;
}
struct IO_SCSI_CAPABILITIES
{
    uint Length;
    uint MaximumTransferLength;
    uint MaximumPhysicalPages;
    uint SupportedAsynchronousEvents;
    uint AlignmentMask;
    BOOLEAN TaggedQueuing;
    BOOLEAN AdapterScansDown;
    BOOLEAN AdapterUsesPio;
}
struct SCSI_ADDRESS
{
    uint Length;
    ubyte PortNumber;
    ubyte PathId;
    ubyte TargetId;
    ubyte Lun;
}
alias PDUMP_DEVICE_POWERON_ROUTINE = int function(void*);
struct DUMP_POINTERS_VERSION
{
    uint Version;
    uint Size;
}
struct DUMP_POINTERS
{
    _ADAPTER_OBJECT* AdapterObject;
    void* MappedRegisterBase;
    void* DumpData;
    void* CommonBufferVa;
    LARGE_INTEGER CommonBufferPa;
    uint CommonBufferSize;
    BOOLEAN AllocateCommonBuffers;
    BOOLEAN UseDiskDump;
    ubyte[2] Spare1;
    void* DeviceObject;
}
struct DUMP_POINTERS_EX
{
    DUMP_POINTERS_VERSION Header;
    void* DumpData;
    void* CommonBufferVa;
    uint CommonBufferSize;
    BOOLEAN AllocateCommonBuffers;
    void* DeviceObject;
    void* DriverList;
    uint dwPortFlags;
    uint MaxDeviceDumpSectionSize;
    uint MaxDeviceDumpLevel;
    uint MaxTransferSize;
    void* AdapterObject;
    void* MappedRegisterBase;
    BOOLEAN* DeviceReady;
    PDUMP_DEVICE_POWERON_ROUTINE DumpDevicePowerOn;
    void* DumpDevicePowerOnContext;
}
struct DUMP_DRIVER
{
    void* DumpDriverList;
    wchar[15] DriverName;
    wchar[15] BaseName;
}
struct NTSCSI_UNICODE_STRING
{
    ushort Length;
    ushort MaximumLength;
    PWSTR Buffer;
}
struct DUMP_DRIVER_EX
{
    void* DumpDriverList;
    wchar[15] DriverName;
    wchar[15] BaseName;
    NTSCSI_UNICODE_STRING DriverFullPath;
}
struct STORAGE_ENDURANCE_INFO
{
    uint ValidFields;
    uint GroupId;
    struct _Flags_e__Struct
    {
        uint _bitfield0;
    }
    uint LifePercentage;
    ubyte[16] BytesReadCount;
    ubyte[16] ByteWriteCount;
}
struct STORAGE_ENDURANCE_DATA_DESCRIPTOR
{
    uint Version;
    uint Size;
    STORAGE_ENDURANCE_INFO EnduranceInfo;
}
alias ISCSI_DIGEST_TYPES = int;
enum : int
{
    ISCSI_DIGEST_TYPE_NONE   = 0x00000000,
    ISCSI_DIGEST_TYPE_CRC32C = 0x00000001,
}

alias ISCSI_AUTH_TYPES = int;
enum : int
{
    ISCSI_NO_AUTH_TYPE          = 0x00000000,
    ISCSI_CHAP_AUTH_TYPE        = 0x00000001,
    ISCSI_MUTUAL_CHAP_AUTH_TYPE = 0x00000002,
}

struct ISCSI_LOGIN_OPTIONS
{
    uint Version;
    uint InformationSpecified;
    uint LoginFlags;
    ISCSI_AUTH_TYPES AuthType;
    ISCSI_DIGEST_TYPES HeaderDigest;
    ISCSI_DIGEST_TYPES DataDigest;
    uint MaximumConnections;
    uint DefaultTime2Wait;
    uint DefaultTime2Retain;
    uint UsernameLength;
    uint PasswordLength;
    ubyte* Username;
    ubyte* Password;
}
alias IKE_AUTHENTICATION_METHOD = int;
enum : int
{
    IKE_AUTHENTICATION_PRESHARED_KEY_METHOD = 0x00000001,
}

struct IKE_AUTHENTICATION_PRESHARED_KEY
{
    ulong SecurityFlags;
    ubyte IdType;
    uint IdLengthInBytes;
    ubyte* Id;
    uint KeyLengthInBytes;
    ubyte* Key;
}
struct IKE_AUTHENTICATION_INFORMATION
{
    IKE_AUTHENTICATION_METHOD AuthMethod;
    union
    {
        IKE_AUTHENTICATION_PRESHARED_KEY PsKey;
    }
}
struct ISCSI_UNIQUE_SESSION_ID
{
    ulong AdapterUnique;
    ulong AdapterSpecific;
}
struct SCSI_LUN_LIST
{
    uint OSLUN;
    ulong TargetLUN;
}
struct ISCSI_TARGET_MAPPINGW
{
    wchar[256] InitiatorName;
    wchar[224] TargetName;
    wchar[260] OSDeviceName;
    ISCSI_UNIQUE_SESSION_ID SessionId;
    uint OSBusNumber;
    uint OSTargetNumber;
    uint LUNCount;
    SCSI_LUN_LIST* LUNList;
}
struct ISCSI_TARGET_MAPPINGA
{
    CHAR[256] InitiatorName;
    CHAR[224] TargetName;
    CHAR[260] OSDeviceName;
    ISCSI_UNIQUE_SESSION_ID SessionId;
    uint OSBusNumber;
    uint OSTargetNumber;
    uint LUNCount;
    SCSI_LUN_LIST* LUNList;
}
struct ISCSI_TARGET_PORTALW
{
    wchar[256] SymbolicName;
    wchar[256] Address;
    ushort Socket;
}
struct ISCSI_TARGET_PORTALA
{
    CHAR[256] SymbolicName;
    CHAR[256] Address;
    ushort Socket;
}
struct ISCSI_TARGET_PORTAL_INFOW
{
    wchar[256] InitiatorName;
    uint InitiatorPortNumber;
    wchar[256] SymbolicName;
    wchar[256] Address;
    ushort Socket;
}
struct ISCSI_TARGET_PORTAL_INFOA
{
    CHAR[256] InitiatorName;
    uint InitiatorPortNumber;
    CHAR[256] SymbolicName;
    CHAR[256] Address;
    ushort Socket;
}
struct ISCSI_TARGET_PORTAL_INFO_EXW
{
    wchar[256] InitiatorName;
    uint InitiatorPortNumber;
    wchar[256] SymbolicName;
    wchar[256] Address;
    ushort Socket;
    ulong SecurityFlags;
    ISCSI_LOGIN_OPTIONS LoginOptions;
}
struct ISCSI_TARGET_PORTAL_INFO_EXA
{
    CHAR[256] InitiatorName;
    uint InitiatorPortNumber;
    CHAR[256] SymbolicName;
    CHAR[256] Address;
    ushort Socket;
    ulong SecurityFlags;
    ISCSI_LOGIN_OPTIONS LoginOptions;
}
struct ISCSI_TARGET_PORTAL_GROUPW
{
    uint Count;
    ISCSI_TARGET_PORTALW[1] Portals;
}
struct ISCSI_TARGET_PORTAL_GROUPA
{
    uint Count;
    ISCSI_TARGET_PORTALA[1] Portals;
}
struct ISCSI_CONNECTION_INFOW
{
    ISCSI_UNIQUE_SESSION_ID ConnectionId;
    PWSTR InitiatorAddress;
    PWSTR TargetAddress;
    ushort InitiatorSocket;
    ushort TargetSocket;
    ubyte[2] CID;
}
struct ISCSI_SESSION_INFOW
{
    ISCSI_UNIQUE_SESSION_ID SessionId;
    PWSTR InitiatorName;
    PWSTR TargetNodeName;
    PWSTR TargetName;
    ubyte[6] ISID;
    ubyte[2] TSID;
    uint ConnectionCount;
    ISCSI_CONNECTION_INFOW* Connections;
}
struct ISCSI_CONNECTION_INFOA
{
    ISCSI_UNIQUE_SESSION_ID ConnectionId;
    PSTR InitiatorAddress;
    PSTR TargetAddress;
    ushort InitiatorSocket;
    ushort TargetSocket;
    ubyte[2] CID;
}
struct ISCSI_SESSION_INFOA
{
    ISCSI_UNIQUE_SESSION_ID SessionId;
    PSTR InitiatorName;
    PSTR TargetNodeName;
    PSTR TargetName;
    ubyte[6] ISID;
    ubyte[2] TSID;
    uint ConnectionCount;
    ISCSI_CONNECTION_INFOA* Connections;
}
struct ISCSI_CONNECTION_INFO_EX
{
    ISCSI_UNIQUE_SESSION_ID ConnectionId;
    ubyte State;
    ubyte Protocol;
    ubyte HeaderDigest;
    ubyte DataDigest;
    uint MaxRecvDataSegmentLength;
    ISCSI_AUTH_TYPES AuthType;
    ulong EstimatedThroughput;
    uint MaxDatagramSize;
}
struct ISCSI_SESSION_INFO_EX
{
    ISCSI_UNIQUE_SESSION_ID SessionId;
    BOOLEAN InitialR2t;
    BOOLEAN ImmediateData;
    ubyte Type;
    BOOLEAN DataSequenceInOrder;
    BOOLEAN DataPduInOrder;
    ubyte ErrorRecoveryLevel;
    uint MaxOutstandingR2t;
    uint FirstBurstLength;
    uint MaxBurstLength;
    uint MaximumConnections;
    uint ConnectionCount;
    ISCSI_CONNECTION_INFO_EX* Connections;
}
struct ISCSI_DEVICE_ON_SESSIONW
{
    wchar[256] InitiatorName;
    wchar[224] TargetName;
    SCSI_ADDRESS ScsiAddress;
    GUID DeviceInterfaceType;
    wchar[260] DeviceInterfaceName;
    wchar[260] LegacyName;
    STORAGE_DEVICE_NUMBER StorageDeviceNumber;
    uint DeviceInstance;
}
struct ISCSI_DEVICE_ON_SESSIONA
{
    CHAR[256] InitiatorName;
    CHAR[224] TargetName;
    SCSI_ADDRESS ScsiAddress;
    GUID DeviceInterfaceType;
    CHAR[260] DeviceInterfaceName;
    CHAR[260] LegacyName;
    STORAGE_DEVICE_NUMBER StorageDeviceNumber;
    uint DeviceInstance;
}
struct PERSISTENT_ISCSI_LOGIN_INFOW
{
    wchar[224] TargetName;
    BOOLEAN IsInformationalSession;
    wchar[256] InitiatorInstance;
    uint InitiatorPortNumber;
    ISCSI_TARGET_PORTALW TargetPortal;
    ulong SecurityFlags;
    ISCSI_TARGET_MAPPINGW* Mappings;
    ISCSI_LOGIN_OPTIONS LoginOptions;
}
struct PERSISTENT_ISCSI_LOGIN_INFOA
{
    CHAR[224] TargetName;
    BOOLEAN IsInformationalSession;
    CHAR[256] InitiatorInstance;
    uint InitiatorPortNumber;
    ISCSI_TARGET_PORTALA TargetPortal;
    ulong SecurityFlags;
    ISCSI_TARGET_MAPPINGA* Mappings;
    ISCSI_LOGIN_OPTIONS LoginOptions;
}
alias TARGETPROTOCOLTYPE = int;
enum : int
{
    ISCSI_TCP_PROTOCOL_TYPE = 0x00000000,
}

alias TARGET_INFORMATION_CLASS = int;
enum : int
{
    ProtocolType             = 0x00000000,
    TargetAlias              = 0x00000001,
    DiscoveryMechanisms      = 0x00000002,
    PortalGroups             = 0x00000003,
    PersistentTargetMappings = 0x00000004,
    InitiatorName            = 0x00000005,
    TargetFlags              = 0x00000006,
    LoginOptions             = 0x00000007,
}

struct ISCSI_VERSION_INFO
{
    uint MajorVersion;
    uint MinorVersion;
    uint BuildNumber;
}
