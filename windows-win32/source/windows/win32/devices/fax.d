module windows.win32.devices.fax;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : BOOL, BSTR, CHAR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.graphics.gdi : HDC;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.io : OVERLAPPED;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.controls : HPROPSHEETPAGE;

version (Windows):
extern (Windows):

BOOL FaxConnectFaxServerA(const(char)*, HANDLE*);
BOOL FaxConnectFaxServerW(const(wchar)*, HANDLE*);
BOOL FaxClose(HANDLE);
BOOL FaxOpenPort(HANDLE, uint, uint, HANDLE*);
BOOL FaxCompleteJobParamsA(FAX_JOB_PARAMA**, FAX_COVERPAGE_INFOA**);
BOOL FaxCompleteJobParamsW(FAX_JOB_PARAMW**, FAX_COVERPAGE_INFOW**);
BOOL FaxSendDocumentA(HANDLE, const(char)*, FAX_JOB_PARAMA*, const(FAX_COVERPAGE_INFOA)*, uint*);
BOOL FaxSendDocumentW(HANDLE, const(wchar)*, FAX_JOB_PARAMW*, const(FAX_COVERPAGE_INFOW)*, uint*);
BOOL FaxSendDocumentForBroadcastA(HANDLE, const(char)*, uint*, PFAX_RECIPIENT_CALLBACKA, void*);
BOOL FaxSendDocumentForBroadcastW(HANDLE, const(wchar)*, uint*, PFAX_RECIPIENT_CALLBACKW, void*);
BOOL FaxEnumJobsA(HANDLE, FAX_JOB_ENTRYA**, uint*);
BOOL FaxEnumJobsW(HANDLE, FAX_JOB_ENTRYW**, uint*);
BOOL FaxGetJobA(HANDLE, uint, FAX_JOB_ENTRYA**);
BOOL FaxGetJobW(HANDLE, uint, FAX_JOB_ENTRYW**);
BOOL FaxSetJobA(HANDLE, uint, uint, const(FAX_JOB_ENTRYA)*);
BOOL FaxSetJobW(HANDLE, uint, uint, const(FAX_JOB_ENTRYW)*);
BOOL FaxGetPageData(HANDLE, uint, ubyte**, uint*, uint*, uint*);
BOOL FaxGetDeviceStatusA(HANDLE, FAX_DEVICE_STATUSA**);
BOOL FaxGetDeviceStatusW(HANDLE, FAX_DEVICE_STATUSW**);
BOOL FaxAbort(HANDLE, uint);
BOOL FaxGetConfigurationA(HANDLE, FAX_CONFIGURATIONA**);
BOOL FaxGetConfigurationW(HANDLE, FAX_CONFIGURATIONW**);
BOOL FaxSetConfigurationA(HANDLE, const(FAX_CONFIGURATIONA)*);
BOOL FaxSetConfigurationW(HANDLE, const(FAX_CONFIGURATIONW)*);
BOOL FaxGetLoggingCategoriesA(HANDLE, FAX_LOG_CATEGORYA**, uint*);
BOOL FaxGetLoggingCategoriesW(HANDLE, FAX_LOG_CATEGORYW**, uint*);
BOOL FaxSetLoggingCategoriesA(HANDLE, const(FAX_LOG_CATEGORYA)*, uint);
BOOL FaxSetLoggingCategoriesW(HANDLE, const(FAX_LOG_CATEGORYW)*, uint);
BOOL FaxEnumPortsA(HANDLE, FAX_PORT_INFOA**, uint*);
BOOL FaxEnumPortsW(HANDLE, FAX_PORT_INFOW**, uint*);
BOOL FaxGetPortA(HANDLE, FAX_PORT_INFOA**);
BOOL FaxGetPortW(HANDLE, FAX_PORT_INFOW**);
BOOL FaxSetPortA(HANDLE, const(FAX_PORT_INFOA)*);
BOOL FaxSetPortW(HANDLE, const(FAX_PORT_INFOW)*);
BOOL FaxEnumRoutingMethodsA(HANDLE, FAX_ROUTING_METHODA**, uint*);
BOOL FaxEnumRoutingMethodsW(HANDLE, FAX_ROUTING_METHODW**, uint*);
BOOL FaxEnableRoutingMethodA(HANDLE, const(char)*, BOOL);
BOOL FaxEnableRoutingMethodW(HANDLE, const(wchar)*, BOOL);
BOOL FaxEnumGlobalRoutingInfoA(HANDLE, FAX_GLOBAL_ROUTING_INFOA**, uint*);
BOOL FaxEnumGlobalRoutingInfoW(HANDLE, FAX_GLOBAL_ROUTING_INFOW**, uint*);
BOOL FaxSetGlobalRoutingInfoA(HANDLE, const(FAX_GLOBAL_ROUTING_INFOA)*);
BOOL FaxSetGlobalRoutingInfoW(HANDLE, const(FAX_GLOBAL_ROUTING_INFOW)*);
BOOL FaxGetRoutingInfoA(HANDLE, const(char)*, ubyte**, uint*);
BOOL FaxGetRoutingInfoW(HANDLE, const(wchar)*, ubyte**, uint*);
BOOL FaxSetRoutingInfoA(HANDLE, const(char)*, const(ubyte)*, uint);
BOOL FaxSetRoutingInfoW(HANDLE, const(wchar)*, const(ubyte)*, uint);
BOOL FaxInitializeEventQueue(HANDLE, HANDLE, ulong, HWND, uint);
void FaxFreeBuffer(void*);
BOOL FaxStartPrintJobA(const(char)*, const(FAX_PRINT_INFOA)*, uint*, FAX_CONTEXT_INFOA*);
BOOL FaxStartPrintJobW(const(wchar)*, const(FAX_PRINT_INFOW)*, uint*, FAX_CONTEXT_INFOW*);
BOOL FaxPrintCoverPageA(const(FAX_CONTEXT_INFOA)*, const(FAX_COVERPAGE_INFOA)*);
BOOL FaxPrintCoverPageW(const(FAX_CONTEXT_INFOW)*, const(FAX_COVERPAGE_INFOW)*);
BOOL FaxRegisterServiceProviderW(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL FaxUnregisterServiceProviderW(const(wchar)*);
BOOL FaxRegisterRoutingExtensionW(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, PFAX_ROUTING_INSTALLATION_CALLBACKW, void*);
BOOL FaxAccessCheck(HANDLE, uint);
BOOL CanSendToFaxRecipient();
uint SendToFaxRecipient(SendToMode, const(wchar)*);
HRESULT StiCreateInstanceW(HINSTANCE, uint, IStillImageW*, IUnknown);
enum prv_DEFAULT_PREFETCH_SIZE = 0x00000064;
enum FS_INITIALIZING = 0x20000000;
enum FS_DIALING = 0x20000001;
enum FS_TRANSMITTING = 0x20000002;
enum FS_RECEIVING = 0x20000004;
enum FS_COMPLETED = 0x20000008;
enum FS_HANDLED = 0x20000010;
enum FS_LINE_UNAVAILABLE = 0x20000020;
enum FS_BUSY = 0x20000040;
enum FS_NO_ANSWER = 0x20000080;
enum FS_BAD_ADDRESS = 0x20000100;
enum FS_NO_DIAL_TONE = 0x20000200;
enum FS_DISCONNECTED = 0x20000400;
enum FS_FATAL_ERROR = 0x20000800;
enum FS_NOT_FAX_CALL = 0x20001000;
enum FS_CALL_DELAYED = 0x20002000;
enum FS_CALL_BLACKLISTED = 0x20004000;
enum FS_USER_ABORT = 0x20200000;
enum FS_ANSWERED = 0x20800000;
enum FAXDEVRECEIVE_SIZE = 0x00001000;
enum FAXDEVREPORTSTATUS_SIZE = 0x00001000;
enum MS_FAXROUTE_PRINTING_GUID = "{aec1b37c-9af2-11d0-abf7-00c04fd91a4e}";
enum MS_FAXROUTE_FOLDER_GUID = "{92041a90-9af2-11d0-abf7-00c04fd91a4e}";
enum MS_FAXROUTE_EMAIL_GUID = "{6bbf7bfe-9af2-11d0-abf7-00c04fd91a4e}";
enum FAX_ERR_START = 0x00001b59;
enum FAX_ERR_SRV_OUTOFMEMORY = 0x00001b59;
enum FAX_ERR_GROUP_NOT_FOUND = 0x00001b5a;
enum FAX_ERR_BAD_GROUP_CONFIGURATION = 0x00001b5b;
enum FAX_ERR_GROUP_IN_USE = 0x00001b5c;
enum FAX_ERR_RULE_NOT_FOUND = 0x00001b5d;
enum FAX_ERR_NOT_NTFS = 0x00001b5e;
enum FAX_ERR_DIRECTORY_IN_USE = 0x00001b5f;
enum FAX_ERR_FILE_ACCESS_DENIED = 0x00001b60;
enum FAX_ERR_MESSAGE_NOT_FOUND = 0x00001b61;
enum FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED = 0x00001b62;
enum FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU = 0x00001b63;
enum FAX_ERR_VERSION_MISMATCH = 0x00001b64;
enum FAX_ERR_RECIPIENTS_LIMIT = 0x00001b65;
enum FAX_ERR_END = 0x00001b65;
enum FAX_E_SRV_OUTOFMEMORY = 0xffffffff80041b59;
enum FAX_E_GROUP_NOT_FOUND = 0xffffffff80041b5a;
enum FAX_E_BAD_GROUP_CONFIGURATION = 0xffffffff80041b5b;
enum FAX_E_GROUP_IN_USE = 0xffffffff80041b5c;
enum FAX_E_RULE_NOT_FOUND = 0xffffffff80041b5d;
enum FAX_E_NOT_NTFS = 0xffffffff80041b5e;
enum FAX_E_DIRECTORY_IN_USE = 0xffffffff80041b5f;
enum FAX_E_FILE_ACCESS_DENIED = 0xffffffff80041b60;
enum FAX_E_MESSAGE_NOT_FOUND = 0xffffffff80041b61;
enum FAX_E_DEVICE_NUM_LIMIT_EXCEEDED = 0xffffffff80041b62;
enum FAX_E_NOT_SUPPORTED_ON_THIS_SKU = 0xffffffff80041b63;
enum FAX_E_VERSION_MISMATCH = 0xffffffff80041b64;
enum FAX_E_RECIPIENTS_LIMIT = 0xffffffff80041b65;
enum JT_UNKNOWN = 0x00000000;
enum JT_SEND = 0x00000001;
enum JT_RECEIVE = 0x00000002;
enum JT_ROUTING = 0x00000003;
enum JT_FAIL_RECEIVE = 0x00000004;
enum JS_PENDING = 0x00000000;
enum JS_INPROGRESS = 0x00000001;
enum JS_DELETING = 0x00000002;
enum JS_FAILED = 0x00000004;
enum JS_PAUSED = 0x00000008;
enum JS_NOLINE = 0x00000010;
enum JS_RETRYING = 0x00000020;
enum JS_RETRIES_EXCEEDED = 0x00000040;
enum FPS_DIALING = 0x20000001;
enum FPS_SENDING = 0x20000002;
enum FPS_RECEIVING = 0x20000004;
enum FPS_COMPLETED = 0x20000008;
enum FPS_HANDLED = 0x20000010;
enum FPS_UNAVAILABLE = 0x20000020;
enum FPS_BUSY = 0x20000040;
enum FPS_NO_ANSWER = 0x20000080;
enum FPS_BAD_ADDRESS = 0x20000100;
enum FPS_NO_DIAL_TONE = 0x20000200;
enum FPS_DISCONNECTED = 0x20000400;
enum FPS_FATAL_ERROR = 0x20000800;
enum FPS_NOT_FAX_CALL = 0x20001000;
enum FPS_CALL_DELAYED = 0x20002000;
enum FPS_CALL_BLACKLISTED = 0x20004000;
enum FPS_INITIALIZING = 0x20008000;
enum FPS_OFFLINE = 0x20010000;
enum FPS_RINGING = 0x20020000;
enum FPS_AVAILABLE = 0x20100000;
enum FPS_ABORTING = 0x20200000;
enum FPS_ROUTING = 0x20400000;
enum FPS_ANSWERED = 0x20800000;
enum FPF_RECEIVE = 0x00000001;
enum FPF_SEND = 0x00000002;
enum FPF_VIRTUAL = 0x00000004;
enum FEI_DIALING = 0x00000001;
enum FEI_SENDING = 0x00000002;
enum FEI_RECEIVING = 0x00000003;
enum FEI_COMPLETED = 0x00000004;
enum FEI_BUSY = 0x00000005;
enum FEI_NO_ANSWER = 0x00000006;
enum FEI_BAD_ADDRESS = 0x00000007;
enum FEI_NO_DIAL_TONE = 0x00000008;
enum FEI_DISCONNECTED = 0x00000009;
enum FEI_FATAL_ERROR = 0x0000000a;
enum FEI_NOT_FAX_CALL = 0x0000000b;
enum FEI_CALL_DELAYED = 0x0000000c;
enum FEI_CALL_BLACKLISTED = 0x0000000d;
enum FEI_RINGING = 0x0000000e;
enum FEI_ABORTING = 0x0000000f;
enum FEI_ROUTING = 0x00000010;
enum FEI_MODEM_POWERED_ON = 0x00000011;
enum FEI_MODEM_POWERED_OFF = 0x00000012;
enum FEI_IDLE = 0x00000013;
enum FEI_FAXSVC_ENDED = 0x00000014;
enum FEI_ANSWERED = 0x00000015;
enum FEI_JOB_QUEUED = 0x00000016;
enum FEI_DELETED = 0x00000017;
enum FEI_INITIALIZING = 0x00000018;
enum FEI_LINE_UNAVAILABLE = 0x00000019;
enum FEI_HANDLED = 0x0000001a;
enum FEI_FAXSVC_STARTED = 0x0000001b;
enum FEI_NEVENTS = 0x0000001b;
enum FAX_JOB_SUBMIT = 0x00000001;
enum FAX_JOB_QUERY = 0x00000002;
enum FAX_CONFIG_QUERY = 0x00000004;
enum FAX_CONFIG_SET = 0x00000008;
enum FAX_PORT_QUERY = 0x00000010;
enum FAX_PORT_SET = 0x00000020;
enum FAX_JOB_MANAGE = 0x00000040;
enum FAXSRV_DEVICE_NODETYPE_GUID = GUID(0x3115a19a, 0x6251, 0x46ac, [0x94, 0x25, 0x14, 0x78, 0x28, 0x58, 0xb8, 0xc9]);
enum FAXSRV_DEVICE_PROVIDER_NODETYPE_GUID = GUID(0xbd38e2ac, 0xb926, 0x4161, [0x86, 0x40, 0xf, 0x69, 0x56, 0xee, 0x2b, 0xa3]);
enum FAXSRV_ROUTING_METHOD_NODETYPE_GUID = GUID(0x220d2cb0, 0x85a9, 0x4a43, [0xb6, 0xe8, 0x9d, 0x66, 0xb4, 0x4f, 0x1a, 0xf5]);
enum CF_MSFAXSRV_DEVICE_ID = "FAXSRV_DeviceID";
enum CF_MSFAXSRV_FSP_GUID = "FAXSRV_FSPGuid";
enum CF_MSFAXSRV_SERVER_NAME = "FAXSRV_ServerName";
enum CF_MSFAXSRV_ROUTEEXT_NAME = "FAXSRV_RoutingExtName";
enum CF_MSFAXSRV_ROUTING_METHOD_GUID = "FAXSRV_RoutingMethodGuid";
enum STI_UNICODE = 0x00000001;
enum CLSID_Sti = GUID(0xb323f8e0, 0x2e68, 0x11d0, [0x90, 0xea, 0x0, 0xaa, 0x0, 0x60, 0xf8, 0x6c]);
enum GUID_DeviceArrivedLaunch = GUID(0x740d9ee6, 0x70f1, 0x11d1, [0xad, 0x10, 0x0, 0xa0, 0x24, 0x38, 0xad, 0x48]);
enum GUID_ScanImage = GUID(0xa6c5a715, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum GUID_ScanPrintImage = GUID(0xb441f425, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum GUID_ScanFaxImage = GUID(0xc00eb793, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum GUID_STIUserDefined1 = GUID(0xc00eb795, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum GUID_STIUserDefined2 = GUID(0xc77ae9c5, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum GUID_STIUserDefined3 = GUID(0xc77ae9c6, 0x8c6e, 0x11d2, [0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f]);
enum STI_VERSION_FLAG_MASK = 0xff000000;
enum STI_VERSION_FLAG_UNICODE = 0x01000000;
enum STI_VERSION_REAL = 0x00000002;
enum STI_VERSION_MIN_ALLOWED = 0x00000002;
enum STI_VERSION = 0x00000002;
enum STI_MAX_INTERNAL_NAME_LENGTH = 0x00000080;
enum STI_GENCAP_COMMON_MASK = 0x000000ff;
enum STI_GENCAP_NOTIFICATIONS = 0x00000001;
enum STI_GENCAP_POLLING_NEEDED = 0x00000002;
enum STI_GENCAP_GENERATE_ARRIVALEVENT = 0x00000004;
enum STI_GENCAP_AUTO_PORTSELECT = 0x00000008;
enum STI_GENCAP_WIA = 0x00000010;
enum STI_GENCAP_SUBSET = 0x00000020;
enum WIA_INCOMPAT_XP = 0x00000001;
enum STI_HW_CONFIG_UNKNOWN = 0x00000001;
enum STI_HW_CONFIG_SCSI = 0x00000002;
enum STI_HW_CONFIG_USB = 0x00000004;
enum STI_HW_CONFIG_SERIAL = 0x00000008;
enum STI_HW_CONFIG_PARALLEL = 0x00000010;
enum STI_DEVSTATUS_ONLINE_STATE = 0x00000001;
enum STI_DEVSTATUS_EVENTS_STATE = 0x00000002;
enum STI_ONLINESTATE_OPERATIONAL = 0x00000001;
enum STI_ONLINESTATE_PENDING = 0x00000002;
enum STI_ONLINESTATE_ERROR = 0x00000004;
enum STI_ONLINESTATE_PAUSED = 0x00000008;
enum STI_ONLINESTATE_PAPER_JAM = 0x00000010;
enum STI_ONLINESTATE_PAPER_PROBLEM = 0x00000020;
enum STI_ONLINESTATE_OFFLINE = 0x00000040;
enum STI_ONLINESTATE_IO_ACTIVE = 0x00000080;
enum STI_ONLINESTATE_BUSY = 0x00000100;
enum STI_ONLINESTATE_TRANSFERRING = 0x00000200;
enum STI_ONLINESTATE_INITIALIZING = 0x00000400;
enum STI_ONLINESTATE_WARMING_UP = 0x00000800;
enum STI_ONLINESTATE_USER_INTERVENTION = 0x00001000;
enum STI_ONLINESTATE_POWER_SAVE = 0x00002000;
enum STI_EVENTHANDLING_ENABLED = 0x00000001;
enum STI_EVENTHANDLING_POLLING = 0x00000002;
enum STI_EVENTHANDLING_PENDING = 0x00000004;
enum STI_DIAGCODE_HWPRESENCE = 0x00000001;
enum STI_TRACE_INFORMATION = 0x00000001;
enum STI_TRACE_WARNING = 0x00000002;
enum STI_TRACE_ERROR = 0x00000004;
enum STI_SUBSCRIBE_FLAG_WINDOW = 0x00000001;
enum STI_SUBSCRIBE_FLAG_EVENT = 0x00000002;
enum MAX_NOTIFICATION_DATA = 0x00000040;
enum STI_ADD_DEVICE_BROADCAST_ACTION = "Arrival";
enum STI_REMOVE_DEVICE_BROADCAST_ACTION = "Removal";
enum STI_ADD_DEVICE_BROADCAST_STRING = "STI\\";
enum STI_REMOVE_DEVICE_BROADCAST_STRING = "STI\\";
enum STI_DEVICE_CREATE_STATUS = 0x00000001;
enum STI_DEVICE_CREATE_DATA = 0x00000002;
enum STI_DEVICE_CREATE_BOTH = 0x00000003;
enum STI_DEVICE_CREATE_MASK = 0x0000ffff;
enum STIEDFL_ALLDEVICES = 0x00000000;
enum STIEDFL_ATTACHEDONLY = 0x00000001;
enum STI_RAW_RESERVED = 0x00001000;
enum STI_OK = 0x00000000;
enum STI_ERROR_NO_ERROR = 0x00000000;
enum STI_NOTCONNECTED = 0x00000001;
enum STI_CHANGENOEFFECT = 0x00000001;
enum STIERR_OLD_VERSION = 0xffffffff8007047e;
enum STIERR_BETA_VERSION = 0xffffffff80070481;
enum STIERR_BADDRIVER = 0xffffffff80070077;
enum STIERR_DEVICENOTREG = 0xffffffff80040154;
enum STIERR_OBJECTNOTFOUND = 0xffffffff80070002;
enum STIERR_INVALID_PARAM = 0xffffffff80070057;
enum STIERR_NOINTERFACE = 0xffffffff80004002;
enum STIERR_GENERIC = 0xffffffff80004005;
enum STIERR_OUTOFMEMORY = 0xffffffff8007000e;
enum STIERR_UNSUPPORTED = 0xffffffff80004001;
enum STIERR_NOT_INITIALIZED = 0xffffffff80070015;
enum STIERR_ALREADY_INITIALIZED = 0xffffffff800704df;
enum STIERR_DEVICE_LOCKED = 0xffffffff80070021;
enum STIERR_READONLY = 0xffffffff80070005;
enum STIERR_NOTINITIALIZED = 0xffffffff80070005;
enum STIERR_NEEDS_LOCK = 0xffffffff8007009e;
enum STIERR_SHARING_VIOLATION = 0xffffffff80070020;
enum STIERR_HANDLEEXISTS = 0xffffffff800700b7;
enum STIERR_INVALID_DEVICE_NAME = 0xffffffff8007007b;
enum STIERR_INVALID_HW_TYPE = 0xffffffff8007000d;
enum STIERR_NOEVENTS = 0xffffffff80070103;
enum STIERR_DEVICE_NOTREADY = 0xffffffff80070015;
enum REGSTR_VAL_TYPE_W = "Type";
enum REGSTR_VAL_VENDOR_NAME_W = "Vendor";
enum REGSTR_VAL_DEVICETYPE_W = "DeviceType";
enum REGSTR_VAL_DEVICESUBTYPE_W = "DeviceSubType";
enum REGSTR_VAL_DEV_NAME_W = "DeviceName";
enum REGSTR_VAL_DRIVER_DESC_W = "DriverDesc";
enum REGSTR_VAL_FRIENDLY_NAME_W = "FriendlyName";
enum REGSTR_VAL_GENERIC_CAPS_W = "Capabilities";
enum REGSTR_VAL_HARDWARE_W = "HardwareConfig";
enum REGSTR_VAL_HARDWARE = "HardwareConfig";
enum REGSTR_VAL_DEVICE_NAME_W = "DriverDesc";
enum REGSTR_VAL_DATA_W = "DeviceData";
enum REGSTR_VAL_GUID_W = "GUID";
enum REGSTR_VAL_GUID = "GUID";
enum REGSTR_VAL_LAUNCH_APPS_W = "LaunchApplications";
enum REGSTR_VAL_LAUNCH_APPS = "LaunchApplications";
enum REGSTR_VAL_LAUNCHABLE_W = "Launchable";
enum REGSTR_VAL_LAUNCHABLE = "Launchable";
enum REGSTR_VAL_SHUTDOWNDELAY_W = "ShutdownIfUnusedDelay";
enum REGSTR_VAL_SHUTDOWNDELAY = "ShutdownIfUnusedDelay";
enum IS_DIGITAL_CAMERA_STR = "IsDigitalCamera";
enum IS_DIGITAL_CAMERA_VAL = 0x00000001;
enum SUPPORTS_MSCPLUS_STR = "SupportsMSCPlus";
enum SUPPORTS_MSCPLUS_VAL = 0x00000001;
enum STI_DEVICE_VALUE_TWAIN_NAME = "TwainDS";
enum STI_DEVICE_VALUE_ISIS_NAME = "ISISDriverName";
enum STI_DEVICE_VALUE_ICM_PROFILE = "ICMProfile";
enum STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP = "DefaultLaunchApp";
enum STI_DEVICE_VALUE_TIMEOUT = "PollTimeout";
enum STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS = "DisableNotifications";
enum REGSTR_VAL_BAUDRATE = "BaudRate";
enum STI_DEVICE_VALUE_TWAIN_NAME_A = "TwainDS";
enum STI_DEVICE_VALUE_ISIS_NAME_A = "ISISDriverName";
enum STI_DEVICE_VALUE_ICM_PROFILE_A = "ICMProfile";
enum STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP_A = "DefaultLaunchApp";
enum STI_DEVICE_VALUE_TIMEOUT_A = "PollTimeout";
enum STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS_A = "DisableNotifications";
enum REGSTR_VAL_BAUDRATE_A = "BaudRate";
enum DEVPKEY_WIA_DeviceType = DEVPROPKEY(GUID(1809653702, 33039, 4560, [190, 199, 8, 0, 43, 226, 9, 47]), 2);
enum DEVPKEY_WIA_USDClassId = DEVPROPKEY(GUID(1809653702, 33039, 4560, [190, 199, 8, 0, 43, 226, 9, 47]), 3);
enum STI_USD_GENCAP_NATIVE_PUSHSUPPORT = 0x00000001;
enum STI_DEVICE_CREATE_FOR_MONITOR = 0x01000000;
enum lDEFAULT_PREFETCH_SIZE = 0x00000064;
enum wcharREASSIGN_RECIPIENTS_DELIMITER = 0x003b;
alias FAX_ENUM_LOG_LEVELS = int;
enum : int
{
    FAXLOG_LEVEL_NONE = 0x00000000,
    FAXLOG_LEVEL_MIN  = 0x00000001,
    FAXLOG_LEVEL_MED  = 0x00000002,
    FAXLOG_LEVEL_MAX  = 0x00000003,
}

alias FAX_ENUM_LOG_CATEGORIES = int;
enum : int
{
    FAXLOG_CATEGORY_INIT     = 0x00000001,
    FAXLOG_CATEGORY_OUTBOUND = 0x00000002,
    FAXLOG_CATEGORY_INBOUND  = 0x00000003,
    FAXLOG_CATEGORY_UNKNOWN  = 0x00000004,
}

struct FAX_LOG_CATEGORYA
{
    const(char)* Name;
    uint Category;
    uint Level;
}
struct FAX_LOG_CATEGORYW
{
    const(wchar)* Name;
    uint Category;
    uint Level;
}
struct FAX_TIME
{
    ushort Hour;
    ushort Minute;
}
struct FAX_CONFIGURATIONA
{
    uint SizeOfStruct;
    uint Retries;
    uint RetryDelay;
    uint DirtyDays;
    BOOL Branding;
    BOOL UseDeviceTsid;
    BOOL ServerCp;
    BOOL PauseServerQueue;
    FAX_TIME StartCheapTime;
    FAX_TIME StopCheapTime;
    BOOL ArchiveOutgoingFaxes;
    const(char)* ArchiveDirectory;
    const(char)* Reserved;
}
struct FAX_CONFIGURATIONW
{
    uint SizeOfStruct;
    uint Retries;
    uint RetryDelay;
    uint DirtyDays;
    BOOL Branding;
    BOOL UseDeviceTsid;
    BOOL ServerCp;
    BOOL PauseServerQueue;
    FAX_TIME StartCheapTime;
    FAX_TIME StopCheapTime;
    BOOL ArchiveOutgoingFaxes;
    const(wchar)* ArchiveDirectory;
    const(wchar)* Reserved;
}
alias FAX_ENUM_JOB_COMMANDS = int;
enum : int
{
    JC_UNKNOWN = 0x00000000,
    JC_DELETE  = 0x00000001,
    JC_PAUSE   = 0x00000002,
    JC_RESUME  = 0x00000003,
}

struct FAX_DEVICE_STATUSA
{
    uint SizeOfStruct;
    const(char)* CallerId;
    const(char)* Csid;
    uint CurrentPage;
    uint DeviceId;
    const(char)* DeviceName;
    const(char)* DocumentName;
    uint JobType;
    const(char)* PhoneNumber;
    const(char)* RoutingString;
    const(char)* SenderName;
    const(char)* RecipientName;
    uint Size;
    FILETIME StartTime;
    uint Status;
    const(char)* StatusString;
    FILETIME SubmittedTime;
    uint TotalPages;
    const(char)* Tsid;
    const(char)* UserName;
}
struct FAX_DEVICE_STATUSW
{
    uint SizeOfStruct;
    const(wchar)* CallerId;
    const(wchar)* Csid;
    uint CurrentPage;
    uint DeviceId;
    const(wchar)* DeviceName;
    const(wchar)* DocumentName;
    uint JobType;
    const(wchar)* PhoneNumber;
    const(wchar)* RoutingString;
    const(wchar)* SenderName;
    const(wchar)* RecipientName;
    uint Size;
    FILETIME StartTime;
    uint Status;
    const(wchar)* StatusString;
    FILETIME SubmittedTime;
    uint TotalPages;
    const(wchar)* Tsid;
    const(wchar)* UserName;
}
struct FAX_JOB_ENTRYA
{
    uint SizeOfStruct;
    uint JobId;
    const(char)* UserName;
    uint JobType;
    uint QueueStatus;
    uint Status;
    uint Size;
    uint PageCount;
    const(char)* RecipientNumber;
    const(char)* RecipientName;
    const(char)* Tsid;
    const(char)* SenderName;
    const(char)* SenderCompany;
    const(char)* SenderDept;
    const(char)* BillingCode;
    uint ScheduleAction;
    SYSTEMTIME ScheduleTime;
    uint DeliveryReportType;
    const(char)* DeliveryReportAddress;
    const(char)* DocumentName;
}
struct FAX_JOB_ENTRYW
{
    uint SizeOfStruct;
    uint JobId;
    const(wchar)* UserName;
    uint JobType;
    uint QueueStatus;
    uint Status;
    uint Size;
    uint PageCount;
    const(wchar)* RecipientNumber;
    const(wchar)* RecipientName;
    const(wchar)* Tsid;
    const(wchar)* SenderName;
    const(wchar)* SenderCompany;
    const(wchar)* SenderDept;
    const(wchar)* BillingCode;
    uint ScheduleAction;
    SYSTEMTIME ScheduleTime;
    uint DeliveryReportType;
    const(wchar)* DeliveryReportAddress;
    const(wchar)* DocumentName;
}
struct FAX_PORT_INFOA
{
    uint SizeOfStruct;
    uint DeviceId;
    uint State;
    uint Flags;
    uint Rings;
    uint Priority;
    const(char)* DeviceName;
    const(char)* Tsid;
    const(char)* Csid;
}
struct FAX_PORT_INFOW
{
    uint SizeOfStruct;
    uint DeviceId;
    uint State;
    uint Flags;
    uint Rings;
    uint Priority;
    const(wchar)* DeviceName;
    const(wchar)* Tsid;
    const(wchar)* Csid;
}
struct FAX_ROUTING_METHODA
{
    uint SizeOfStruct;
    uint DeviceId;
    BOOL Enabled;
    const(char)* DeviceName;
    const(char)* Guid;
    const(char)* FriendlyName;
    const(char)* FunctionName;
    const(char)* ExtensionImageName;
    const(char)* ExtensionFriendlyName;
}
struct FAX_ROUTING_METHODW
{
    uint SizeOfStruct;
    uint DeviceId;
    BOOL Enabled;
    const(wchar)* DeviceName;
    const(wchar)* Guid;
    const(wchar)* FriendlyName;
    const(wchar)* FunctionName;
    const(wchar)* ExtensionImageName;
    const(wchar)* ExtensionFriendlyName;
}
struct FAX_GLOBAL_ROUTING_INFOA
{
    uint SizeOfStruct;
    uint Priority;
    const(char)* Guid;
    const(char)* FriendlyName;
    const(char)* FunctionName;
    const(char)* ExtensionImageName;
    const(char)* ExtensionFriendlyName;
}
struct FAX_GLOBAL_ROUTING_INFOW
{
    uint SizeOfStruct;
    uint Priority;
    const(wchar)* Guid;
    const(wchar)* FriendlyName;
    const(wchar)* FunctionName;
    const(wchar)* ExtensionImageName;
    const(wchar)* ExtensionFriendlyName;
}
struct FAX_COVERPAGE_INFOA
{
    uint SizeOfStruct;
    const(char)* CoverPageName;
    BOOL UseServerCoverPage;
    const(char)* RecName;
    const(char)* RecFaxNumber;
    const(char)* RecCompany;
    const(char)* RecStreetAddress;
    const(char)* RecCity;
    const(char)* RecState;
    const(char)* RecZip;
    const(char)* RecCountry;
    const(char)* RecTitle;
    const(char)* RecDepartment;
    const(char)* RecOfficeLocation;
    const(char)* RecHomePhone;
    const(char)* RecOfficePhone;
    const(char)* SdrName;
    const(char)* SdrFaxNumber;
    const(char)* SdrCompany;
    const(char)* SdrAddress;
    const(char)* SdrTitle;
    const(char)* SdrDepartment;
    const(char)* SdrOfficeLocation;
    const(char)* SdrHomePhone;
    const(char)* SdrOfficePhone;
    const(char)* Note;
    const(char)* Subject;
    SYSTEMTIME TimeSent;
    uint PageCount;
}
struct FAX_COVERPAGE_INFOW
{
    uint SizeOfStruct;
    const(wchar)* CoverPageName;
    BOOL UseServerCoverPage;
    const(wchar)* RecName;
    const(wchar)* RecFaxNumber;
    const(wchar)* RecCompany;
    const(wchar)* RecStreetAddress;
    const(wchar)* RecCity;
    const(wchar)* RecState;
    const(wchar)* RecZip;
    const(wchar)* RecCountry;
    const(wchar)* RecTitle;
    const(wchar)* RecDepartment;
    const(wchar)* RecOfficeLocation;
    const(wchar)* RecHomePhone;
    const(wchar)* RecOfficePhone;
    const(wchar)* SdrName;
    const(wchar)* SdrFaxNumber;
    const(wchar)* SdrCompany;
    const(wchar)* SdrAddress;
    const(wchar)* SdrTitle;
    const(wchar)* SdrDepartment;
    const(wchar)* SdrOfficeLocation;
    const(wchar)* SdrHomePhone;
    const(wchar)* SdrOfficePhone;
    const(wchar)* Note;
    const(wchar)* Subject;
    SYSTEMTIME TimeSent;
    uint PageCount;
}
alias FAX_ENUM_JOB_SEND_ATTRIBUTES = int;
enum : int
{
    JSA_NOW             = 0x00000000,
    JSA_SPECIFIC_TIME   = 0x00000001,
    JSA_DISCOUNT_PERIOD = 0x00000002,
}

alias FAX_ENUM_DELIVERY_REPORT_TYPES = int;
enum : int
{
    DRT_NONE  = 0x00000000,
    DRT_EMAIL = 0x00000001,
    DRT_INBOX = 0x00000002,
}

struct FAX_JOB_PARAMA
{
    uint SizeOfStruct;
    const(char)* RecipientNumber;
    const(char)* RecipientName;
    const(char)* Tsid;
    const(char)* SenderName;
    const(char)* SenderCompany;
    const(char)* SenderDept;
    const(char)* BillingCode;
    uint ScheduleAction;
    SYSTEMTIME ScheduleTime;
    uint DeliveryReportType;
    const(char)* DeliveryReportAddress;
    const(char)* DocumentName;
    uint CallHandle;
    ulong[3] Reserved;
}
struct FAX_JOB_PARAMW
{
    uint SizeOfStruct;
    const(wchar)* RecipientNumber;
    const(wchar)* RecipientName;
    const(wchar)* Tsid;
    const(wchar)* SenderName;
    const(wchar)* SenderCompany;
    const(wchar)* SenderDept;
    const(wchar)* BillingCode;
    uint ScheduleAction;
    SYSTEMTIME ScheduleTime;
    uint DeliveryReportType;
    const(wchar)* DeliveryReportAddress;
    const(wchar)* DocumentName;
    uint CallHandle;
    ulong[3] Reserved;
}
struct FAX_EVENTA
{
    uint SizeOfStruct;
    FILETIME TimeStamp;
    uint DeviceId;
    uint EventId;
    uint JobId;
}
struct FAX_EVENTW
{
    uint SizeOfStruct;
    FILETIME TimeStamp;
    uint DeviceId;
    uint EventId;
    uint JobId;
}
struct FAX_PRINT_INFOA
{
    uint SizeOfStruct;
    const(char)* DocName;
    const(char)* RecipientName;
    const(char)* RecipientNumber;
    const(char)* SenderName;
    const(char)* SenderCompany;
    const(char)* SenderDept;
    const(char)* SenderBillingCode;
    const(char)* Reserved;
    const(char)* DrEmailAddress;
    const(char)* OutputFileName;
}
struct FAX_PRINT_INFOW
{
    uint SizeOfStruct;
    const(wchar)* DocName;
    const(wchar)* RecipientName;
    const(wchar)* RecipientNumber;
    const(wchar)* SenderName;
    const(wchar)* SenderCompany;
    const(wchar)* SenderDept;
    const(wchar)* SenderBillingCode;
    const(wchar)* Reserved;
    const(wchar)* DrEmailAddress;
    const(wchar)* OutputFileName;
}
struct FAX_CONTEXT_INFOA
{
    uint SizeOfStruct;
    HDC hDC;
    CHAR[16] ServerName;
}
struct FAX_CONTEXT_INFOW
{
    uint SizeOfStruct;
    HDC hDC;
    wchar[16] ServerName;
}
alias PFAXCONNECTFAXSERVERA = BOOL function(const(char)*, HANDLE*);
alias PFAXCONNECTFAXSERVERW = BOOL function(const(wchar)*, HANDLE*);
alias PFAXCLOSE = BOOL function(HANDLE);
alias FAX_ENUM_PORT_OPEN_TYPE = int;
enum : int
{
    PORT_OPEN_QUERY  = 0x00000001,
    PORT_OPEN_MODIFY = 0x00000002,
}

alias PFAXOPENPORT = BOOL function(HANDLE, uint, uint, HANDLE*);
alias PFAXCOMPLETEJOBPARAMSA = BOOL function(FAX_JOB_PARAMA**, FAX_COVERPAGE_INFOA**);
alias PFAXCOMPLETEJOBPARAMSW = BOOL function(FAX_JOB_PARAMW**, FAX_COVERPAGE_INFOW**);
alias PFAXSENDDOCUMENTA = BOOL function(HANDLE, const(char)*, FAX_JOB_PARAMA*, const(FAX_COVERPAGE_INFOA)*, uint*);
alias PFAXSENDDOCUMENTW = BOOL function(HANDLE, const(wchar)*, FAX_JOB_PARAMW*, const(FAX_COVERPAGE_INFOW)*, uint*);
alias PFAX_RECIPIENT_CALLBACKA = BOOL function(HANDLE, uint, void*, FAX_JOB_PARAMA*, FAX_COVERPAGE_INFOA*);
alias PFAX_RECIPIENT_CALLBACKW = BOOL function(HANDLE, uint, void*, FAX_JOB_PARAMW*, FAX_COVERPAGE_INFOW*);
alias PFAXSENDDOCUMENTFORBROADCASTA = BOOL function(HANDLE, const(char)*, uint*, PFAX_RECIPIENT_CALLBACKA, void*);
alias PFAXSENDDOCUMENTFORBROADCASTW = BOOL function(HANDLE, const(wchar)*, uint*, PFAX_RECIPIENT_CALLBACKW, void*);
alias PFAXENUMJOBSA = BOOL function(HANDLE, FAX_JOB_ENTRYA**, uint*);
alias PFAXENUMJOBSW = BOOL function(HANDLE, FAX_JOB_ENTRYW**, uint*);
alias PFAXGETJOBA = BOOL function(HANDLE, uint, FAX_JOB_ENTRYA**);
alias PFAXGETJOBW = BOOL function(HANDLE, uint, FAX_JOB_ENTRYW**);
alias PFAXSETJOBA = BOOL function(HANDLE, uint, uint, const(FAX_JOB_ENTRYA)*);
alias PFAXSETJOBW = BOOL function(HANDLE, uint, uint, const(FAX_JOB_ENTRYW)*);
alias PFAXGETPAGEDATA = BOOL function(HANDLE, uint, ubyte**, uint*, uint*, uint*);
alias PFAXGETDEVICESTATUSA = BOOL function(HANDLE, FAX_DEVICE_STATUSA**);
alias PFAXGETDEVICESTATUSW = BOOL function(HANDLE, FAX_DEVICE_STATUSW**);
alias PFAXABORT = BOOL function(HANDLE, uint);
alias PFAXGETCONFIGURATIONA = BOOL function(HANDLE, FAX_CONFIGURATIONA**);
alias PFAXGETCONFIGURATIONW = BOOL function(HANDLE, FAX_CONFIGURATIONW**);
alias PFAXSETCONFIGURATIONA = BOOL function(HANDLE, const(FAX_CONFIGURATIONA)*);
alias PFAXSETCONFIGURATIONW = BOOL function(HANDLE, const(FAX_CONFIGURATIONW)*);
alias PFAXGETLOGGINGCATEGORIESA = BOOL function(HANDLE, FAX_LOG_CATEGORYA**, uint*);
alias PFAXGETLOGGINGCATEGORIESW = BOOL function(HANDLE, FAX_LOG_CATEGORYW**, uint*);
alias PFAXSETLOGGINGCATEGORIESA = BOOL function(HANDLE, const(FAX_LOG_CATEGORYA)*, uint);
alias PFAXSETLOGGINGCATEGORIESW = BOOL function(HANDLE, const(FAX_LOG_CATEGORYW)*, uint);
alias PFAXENUMPORTSA = BOOL function(HANDLE, FAX_PORT_INFOA**, uint*);
alias PFAXENUMPORTSW = BOOL function(HANDLE, FAX_PORT_INFOW**, uint*);
alias PFAXGETPORTA = BOOL function(HANDLE, FAX_PORT_INFOA**);
alias PFAXGETPORTW = BOOL function(HANDLE, FAX_PORT_INFOW**);
alias PFAXSETPORTA = BOOL function(HANDLE, const(FAX_PORT_INFOA)*);
alias PFAXSETPORTW = BOOL function(HANDLE, const(FAX_PORT_INFOW)*);
alias PFAXENUMROUTINGMETHODSA = BOOL function(HANDLE, FAX_ROUTING_METHODA**, uint*);
alias PFAXENUMROUTINGMETHODSW = BOOL function(HANDLE, FAX_ROUTING_METHODW**, uint*);
alias PFAXENABLEROUTINGMETHODA = BOOL function(HANDLE, const(char)*, BOOL);
alias PFAXENABLEROUTINGMETHODW = BOOL function(HANDLE, const(wchar)*, BOOL);
alias PFAXENUMGLOBALROUTINGINFOA = BOOL function(HANDLE, FAX_GLOBAL_ROUTING_INFOA**, uint*);
alias PFAXENUMGLOBALROUTINGINFOW = BOOL function(HANDLE, FAX_GLOBAL_ROUTING_INFOW**, uint*);
alias PFAXSETGLOBALROUTINGINFOA = BOOL function(HANDLE, const(FAX_GLOBAL_ROUTING_INFOA)*);
alias PFAXSETGLOBALROUTINGINFOW = BOOL function(HANDLE, const(FAX_GLOBAL_ROUTING_INFOW)*);
alias PFAXGETROUTINGINFOA = BOOL function(HANDLE, const(char)*, ubyte**, uint*);
alias PFAXGETROUTINGINFOW = BOOL function(HANDLE, const(wchar)*, ubyte**, uint*);
alias PFAXSETROUTINGINFOA = BOOL function(HANDLE, const(char)*, const(ubyte)*, uint);
alias PFAXSETROUTINGINFOW = BOOL function(HANDLE, const(wchar)*, const(ubyte)*, uint);
alias PFAXINITIALIZEEVENTQUEUE = BOOL function(HANDLE, HANDLE, ulong, HWND, uint);
alias PFAXFREEBUFFER = void function(void*);
alias PFAXSTARTPRINTJOBA = BOOL function(const(char)*, const(FAX_PRINT_INFOA)*, uint*, FAX_CONTEXT_INFOA*);
alias PFAXSTARTPRINTJOBW = BOOL function(const(wchar)*, const(FAX_PRINT_INFOW)*, uint*, FAX_CONTEXT_INFOW*);
alias PFAXPRINTCOVERPAGEA = BOOL function(const(FAX_CONTEXT_INFOA)*, const(FAX_COVERPAGE_INFOA)*);
alias PFAXPRINTCOVERPAGEW = BOOL function(const(FAX_CONTEXT_INFOW)*, const(FAX_COVERPAGE_INFOW)*);
alias PFAXREGISTERSERVICEPROVIDERW = BOOL function(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
alias PFAXUNREGISTERSERVICEPROVIDERW = BOOL function(const(wchar)*);
alias PFAX_ROUTING_INSTALLATION_CALLBACKW = BOOL function(HANDLE, void*, PWSTR, PWSTR, PWSTR, PWSTR);
alias PFAXREGISTERROUTINGEXTENSIONW = BOOL function(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, PFAX_ROUTING_INSTALLATION_CALLBACKW, void*);
alias PFAXACCESSCHECK = BOOL function(HANDLE, uint);
struct FAX_SEND
{
    uint SizeOfStruct;
    PWSTR FileName;
    PWSTR CallerName;
    PWSTR CallerNumber;
    PWSTR ReceiverName;
    PWSTR ReceiverNumber;
    BOOL Branding;
    uint CallHandle;
    uint[3] Reserved;
}
struct FAX_RECEIVE
{
    uint SizeOfStruct;
    PWSTR FileName;
    PWSTR ReceiverName;
    PWSTR ReceiverNumber;
    uint[4] Reserved;
}
struct FAX_DEV_STATUS
{
    uint SizeOfStruct;
    uint StatusId;
    uint StringId;
    uint PageCount;
    PWSTR CSI;
    PWSTR CallerId;
    PWSTR RoutingInfo;
    uint ErrorCode;
    uint[3] Reserved;
}
alias PFAX_SERVICE_CALLBACK = BOOL function(HANDLE, uint, ulong, ulong, ulong);
alias PFAX_LINECALLBACK = void function(HANDLE, uint, uint, ulong, ulong, ulong, ulong);
alias PFAX_SEND_CALLBACK = BOOL function(HANDLE, uint, uint, uint);
alias PFAXDEVINITIALIZE = BOOL function(uint, HANDLE, PFAX_LINECALLBACK*, PFAX_SERVICE_CALLBACK);
alias PFAXDEVVIRTUALDEVICECREATION = BOOL function(uint*, PWSTR, uint*, HANDLE, ulong);
alias PFAXDEVSTARTJOB = BOOL function(uint, uint, HANDLE*, HANDLE, ulong);
alias PFAXDEVENDJOB = BOOL function(HANDLE);
alias PFAXDEVSEND = BOOL function(HANDLE, FAX_SEND*, PFAX_SEND_CALLBACK);
alias PFAXDEVRECEIVE = BOOL function(HANDLE, uint, FAX_RECEIVE*);
alias PFAXDEVREPORTSTATUS = BOOL function(HANDLE, FAX_DEV_STATUS*, uint, uint*);
alias PFAXDEVABORTOPERATION = BOOL function(HANDLE);
alias PFAXDEVCONFIGURE = BOOL function(HPROPSHEETPAGE*);
alias PFAXDEVSHUTDOWN = HRESULT function();
alias FAX_JOB_STATUS_ENUM = int;
enum : int
{
    fjsPENDING          = 0x00000001,
    fjsINPROGRESS       = 0x00000002,
    fjsFAILED           = 0x00000008,
    fjsPAUSED           = 0x00000010,
    fjsNOLINE           = 0x00000020,
    fjsRETRYING         = 0x00000040,
    fjsRETRIES_EXCEEDED = 0x00000080,
    fjsCOMPLETED        = 0x00000100,
    fjsCANCELED         = 0x00000200,
    fjsCANCELING        = 0x00000400,
    fjsROUTING          = 0x00000800,
}

alias FAX_JOB_EXTENDED_STATUS_ENUM = int;
enum : int
{
    fjesNONE               = 0x00000000,
    fjesDISCONNECTED       = 0x00000001,
    fjesINITIALIZING       = 0x00000002,
    fjesDIALING            = 0x00000003,
    fjesTRANSMITTING       = 0x00000004,
    fjesANSWERED           = 0x00000005,
    fjesRECEIVING          = 0x00000006,
    fjesLINE_UNAVAILABLE   = 0x00000007,
    fjesBUSY               = 0x00000008,
    fjesNO_ANSWER          = 0x00000009,
    fjesBAD_ADDRESS        = 0x0000000a,
    fjesNO_DIAL_TONE       = 0x0000000b,
    fjesFATAL_ERROR        = 0x0000000c,
    fjesCALL_DELAYED       = 0x0000000d,
    fjesCALL_BLACKLISTED   = 0x0000000e,
    fjesNOT_FAX_CALL       = 0x0000000f,
    fjesPARTIALLY_RECEIVED = 0x00000010,
    fjesHANDLED            = 0x00000011,
    fjesCALL_COMPLETED     = 0x00000012,
    fjesCALL_ABORTED       = 0x00000013,
    fjesPROPRIETARY        = 0x01000000,
}

alias FAX_JOB_OPERATIONS_ENUM = int;
enum : int
{
    fjoVIEW           = 0x00000001,
    fjoPAUSE          = 0x00000002,
    fjoRESUME         = 0x00000004,
    fjoRESTART        = 0x00000008,
    fjoDELETE         = 0x00000010,
    fjoRECIPIENT_INFO = 0x00000020,
    fjoSENDER_INFO    = 0x00000040,
}

alias FAX_JOB_TYPE_ENUM = int;
enum : int
{
    fjtSEND    = 0x00000000,
    fjtRECEIVE = 0x00000001,
    fjtROUTING = 0x00000002,
}

enum IID_IFaxJobStatus = GUID(0x8b86f485, 0xfd7f, 0x4824, [0x88, 0x6b, 0x40, 0xc5, 0xca, 0xa6, 0x17, 0xcc]);
interface IFaxJobStatus : IDispatch
{
    HRESULT get_Status(FAX_JOB_STATUS_ENUM*);
    HRESULT get_Pages(int*);
    HRESULT get_Size(int*);
    HRESULT get_CurrentPage(int*);
    HRESULT get_DeviceId(int*);
    HRESULT get_CSID(BSTR*);
    HRESULT get_TSID(BSTR*);
    HRESULT get_ExtendedStatusCode(FAX_JOB_EXTENDED_STATUS_ENUM*);
    HRESULT get_ExtendedStatus(BSTR*);
    HRESULT get_AvailableOperations(FAX_JOB_OPERATIONS_ENUM*);
    HRESULT get_Retries(int*);
    HRESULT get_JobType(FAX_JOB_TYPE_ENUM*);
    HRESULT get_ScheduledTime(double*);
    HRESULT get_TransmissionStart(double*);
    HRESULT get_TransmissionEnd(double*);
    HRESULT get_CallerId(BSTR*);
    HRESULT get_RoutingInformation(BSTR*);
}
alias FAX_SERVER_EVENTS_TYPE_ENUM = int;
enum : int
{
    fsetNONE          = 0x00000000,
    fsetIN_QUEUE      = 0x00000001,
    fsetOUT_QUEUE     = 0x00000002,
    fsetCONFIG        = 0x00000004,
    fsetACTIVITY      = 0x00000008,
    fsetQUEUE_STATE   = 0x00000010,
    fsetIN_ARCHIVE    = 0x00000020,
    fsetOUT_ARCHIVE   = 0x00000040,
    fsetFXSSVC_ENDED  = 0x00000080,
    fsetDEVICE_STATUS = 0x00000100,
    fsetINCOMING_CALL = 0x00000200,
}

alias FAX_SERVER_APIVERSION_ENUM = int;
enum : int
{
    fsAPI_VERSION_0 = 0x00000000,
    fsAPI_VERSION_1 = 0x00010000,
    fsAPI_VERSION_2 = 0x00020000,
    fsAPI_VERSION_3 = 0x00030000,
}

enum IID_IFaxServer = GUID(0x475b6469, 0x90a5, 0x4878, [0xa5, 0x77, 0x17, 0xa8, 0x6e, 0x8e, 0x34, 0x62]);
interface IFaxServer : IDispatch
{
    HRESULT Connect(BSTR);
    HRESULT get_ServerName(BSTR*);
    HRESULT GetDeviceProviders(IFaxDeviceProviders*);
    HRESULT GetDevices(IFaxDevices*);
    HRESULT get_InboundRouting(IFaxInboundRouting*);
    HRESULT get_Folders(IFaxFolders*);
    HRESULT get_LoggingOptions(IFaxLoggingOptions*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
    HRESULT get_MajorBuild(int*);
    HRESULT get_MinorBuild(int*);
    HRESULT get_Debug(VARIANT_BOOL*);
    HRESULT get_Activity(IFaxActivity*);
    HRESULT get_OutboundRouting(IFaxOutboundRouting*);
    HRESULT get_ReceiptOptions(IFaxReceiptOptions*);
    HRESULT get_Security(IFaxSecurity*);
    HRESULT Disconnect();
    HRESULT GetExtensionProperty(BSTR, VARIANT*);
    HRESULT SetExtensionProperty(BSTR, VARIANT);
    HRESULT ListenToServerEvents(FAX_SERVER_EVENTS_TYPE_ENUM);
    HRESULT RegisterDeviceProvider(BSTR, BSTR, BSTR, BSTR, int);
    HRESULT UnregisterDeviceProvider(BSTR);
    HRESULT RegisterInboundRoutingExtension(BSTR, BSTR, BSTR, VARIANT);
    HRESULT UnregisterInboundRoutingExtension(BSTR);
    HRESULT get_RegisteredEvents(FAX_SERVER_EVENTS_TYPE_ENUM*);
    HRESULT get_APIVersion(FAX_SERVER_APIVERSION_ENUM*);
}
enum IID_IFaxDeviceProviders = GUID(0x9fb76f62, 0x4c7e, 0x43a5, [0xb6, 0xfd, 0x50, 0x28, 0x93, 0xf7, 0xe1, 0x3e]);
interface IFaxDeviceProviders : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxDeviceProvider*);
    HRESULT get_Count(int*);
}
enum IID_IFaxDevices = GUID(0x9e46783e, 0xf34f, 0x482e, [0xa3, 0x60, 0x4, 0x16, 0xbe, 0xcb, 0xbd, 0x96]);
interface IFaxDevices : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxDevice*);
    HRESULT get_Count(int*);
    HRESULT get_ItemById(int, IFaxDevice*);
}
enum IID_IFaxInboundRouting = GUID(0x8148c20f, 0x9d52, 0x45b1, [0xbf, 0x96, 0x38, 0xfc, 0x12, 0x71, 0x35, 0x27]);
interface IFaxInboundRouting : IDispatch
{
    HRESULT GetExtensions(IFaxInboundRoutingExtensions*);
    HRESULT GetMethods(IFaxInboundRoutingMethods*);
}
enum IID_IFaxFolders = GUID(0xdce3b2a8, 0xa7ab, 0x42bc, [0x9d, 0xa, 0x31, 0x49, 0x45, 0x72, 0x61, 0xa0]);
interface IFaxFolders : IDispatch
{
    HRESULT get_OutgoingQueue(IFaxOutgoingQueue*);
    HRESULT get_IncomingQueue(IFaxIncomingQueue*);
    HRESULT get_IncomingArchive(IFaxIncomingArchive*);
    HRESULT get_OutgoingArchive(IFaxOutgoingArchive*);
}
enum IID_IFaxLoggingOptions = GUID(0x34e64fb9, 0x6b31, 0x4d32, [0x8b, 0x27, 0xd2, 0x86, 0xc0, 0xc3, 0x36, 0x6]);
interface IFaxLoggingOptions : IDispatch
{
    HRESULT get_EventLogging(IFaxEventLogging*);
    HRESULT get_ActivityLogging(IFaxActivityLogging*);
}
enum IID_IFaxActivity = GUID(0x4b106f97, 0x3df5, 0x40f2, [0xbc, 0x3c, 0x44, 0xcb, 0x81, 0x15, 0xeb, 0xdf]);
interface IFaxActivity : IDispatch
{
    HRESULT get_IncomingMessages(int*);
    HRESULT get_RoutingMessages(int*);
    HRESULT get_OutgoingMessages(int*);
    HRESULT get_QueuedMessages(int*);
    HRESULT Refresh();
}
enum IID_IFaxOutboundRouting = GUID(0x25dc05a4, 0x9909, 0x41bd, [0xa9, 0x5b, 0x7e, 0x5d, 0x1d, 0xec, 0x1d, 0x43]);
interface IFaxOutboundRouting : IDispatch
{
    HRESULT GetGroups(IFaxOutboundRoutingGroups*);
    HRESULT GetRules(IFaxOutboundRoutingRules*);
}
alias FAX_SMTP_AUTHENTICATION_TYPE_ENUM = int;
enum : int
{
    fsatANONYMOUS = 0x00000000,
    fsatBASIC     = 0x00000001,
    fsatNTLM      = 0x00000002,
}

alias FAX_RECEIPT_TYPE_ENUM = int;
enum : int
{
    frtNONE   = 0x00000000,
    frtMAIL   = 0x00000001,
    frtMSGBOX = 0x00000004,
}

enum IID_IFaxReceiptOptions = GUID(0x378efaeb, 0x5fcb, 0x4afb, [0xb2, 0xee, 0xe1, 0x6e, 0x80, 0x61, 0x44, 0x87]);
interface IFaxReceiptOptions : IDispatch
{
    HRESULT get_AuthenticationType(FAX_SMTP_AUTHENTICATION_TYPE_ENUM*);
    HRESULT put_AuthenticationType(FAX_SMTP_AUTHENTICATION_TYPE_ENUM);
    HRESULT get_SMTPServer(BSTR*);
    HRESULT put_SMTPServer(BSTR);
    HRESULT get_SMTPPort(int*);
    HRESULT put_SMTPPort(int);
    HRESULT get_SMTPSender(BSTR*);
    HRESULT put_SMTPSender(BSTR);
    HRESULT get_SMTPUser(BSTR*);
    HRESULT put_SMTPUser(BSTR);
    HRESULT get_AllowedReceipts(FAX_RECEIPT_TYPE_ENUM*);
    HRESULT put_AllowedReceipts(FAX_RECEIPT_TYPE_ENUM);
    HRESULT get_SMTPPassword(BSTR*);
    HRESULT put_SMTPPassword(BSTR);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT get_UseForInboundRouting(VARIANT_BOOL*);
    HRESULT put_UseForInboundRouting(VARIANT_BOOL);
}
alias FAX_ACCESS_RIGHTS_ENUM = int;
enum : int
{
    farSUBMIT_LOW         = 0x00000001,
    farSUBMIT_NORMAL      = 0x00000002,
    farSUBMIT_HIGH        = 0x00000004,
    farQUERY_JOBS         = 0x00000008,
    farMANAGE_JOBS        = 0x00000010,
    farQUERY_CONFIG       = 0x00000020,
    farMANAGE_CONFIG      = 0x00000040,
    farQUERY_IN_ARCHIVE   = 0x00000080,
    farMANAGE_IN_ARCHIVE  = 0x00000100,
    farQUERY_OUT_ARCHIVE  = 0x00000200,
    farMANAGE_OUT_ARCHIVE = 0x00000400,
}

enum IID_IFaxSecurity = GUID(0x77b508c1, 0x9c0, 0x47a2, [0x91, 0xeb, 0xfc, 0xe7, 0xfd, 0xf2, 0x69, 0xe]);
interface IFaxSecurity : IDispatch
{
    HRESULT get_Descriptor(VARIANT*);
    HRESULT put_Descriptor(VARIANT);
    HRESULT get_GrantedRights(FAX_ACCESS_RIGHTS_ENUM*);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT get_InformationType(int*);
    HRESULT put_InformationType(int);
}
alias FAX_PRIORITY_TYPE_ENUM = int;
enum : int
{
    fptLOW    = 0x00000000,
    fptNORMAL = 0x00000001,
    fptHIGH   = 0x00000002,
}

alias FAX_COVERPAGE_TYPE_ENUM = int;
enum : int
{
    fcptNONE   = 0x00000000,
    fcptLOCAL  = 0x00000001,
    fcptSERVER = 0x00000002,
}

alias FAX_SCHEDULE_TYPE_ENUM = int;
enum : int
{
    fstNOW             = 0x00000000,
    fstSPECIFIC_TIME   = 0x00000001,
    fstDISCOUNT_PERIOD = 0x00000002,
}

enum IID_IFaxDocument = GUID(0xb207a246, 0x9e3, 0x4a4e, [0xa7, 0xdc, 0xfe, 0xa3, 0x1d, 0x29, 0x45, 0x8f]);
interface IFaxDocument : IDispatch
{
    HRESULT get_Body(BSTR*);
    HRESULT put_Body(BSTR);
    HRESULT get_Sender(IFaxSender*);
    HRESULT get_Recipients(IFaxRecipients*);
    HRESULT get_CoverPage(BSTR*);
    HRESULT put_CoverPage(BSTR);
    HRESULT get_Subject(BSTR*);
    HRESULT put_Subject(BSTR);
    HRESULT get_Note(BSTR*);
    HRESULT put_Note(BSTR);
    HRESULT get_ScheduleTime(double*);
    HRESULT put_ScheduleTime(double);
    HRESULT get_ReceiptAddress(BSTR*);
    HRESULT put_ReceiptAddress(BSTR);
    HRESULT get_DocumentName(BSTR*);
    HRESULT put_DocumentName(BSTR);
    HRESULT get_CallHandle(int*);
    HRESULT put_CallHandle(int);
    HRESULT get_CoverPageType(FAX_COVERPAGE_TYPE_ENUM*);
    HRESULT put_CoverPageType(FAX_COVERPAGE_TYPE_ENUM);
    HRESULT get_ScheduleType(FAX_SCHEDULE_TYPE_ENUM*);
    HRESULT put_ScheduleType(FAX_SCHEDULE_TYPE_ENUM);
    HRESULT get_ReceiptType(FAX_RECEIPT_TYPE_ENUM*);
    HRESULT put_ReceiptType(FAX_RECEIPT_TYPE_ENUM);
    HRESULT get_GroupBroadcastReceipts(VARIANT_BOOL*);
    HRESULT put_GroupBroadcastReceipts(VARIANT_BOOL);
    HRESULT get_Priority(FAX_PRIORITY_TYPE_ENUM*);
    HRESULT put_Priority(FAX_PRIORITY_TYPE_ENUM);
    HRESULT get_TapiConnection(IDispatch*);
    HRESULT putref_TapiConnection(IDispatch);
    HRESULT Submit(BSTR, VARIANT*);
    HRESULT ConnectedSubmit(IFaxServer, VARIANT*);
    HRESULT get_AttachFaxToReceipt(VARIANT_BOOL*);
    HRESULT put_AttachFaxToReceipt(VARIANT_BOOL);
}
enum IID_IFaxSender = GUID(0xd879d7d, 0xf57a, 0x4cc6, [0xa6, 0xf9, 0x3e, 0xe5, 0xd5, 0x27, 0xb4, 0x6a]);
interface IFaxSender : IDispatch
{
    HRESULT get_BillingCode(BSTR*);
    HRESULT put_BillingCode(BSTR);
    HRESULT get_City(BSTR*);
    HRESULT put_City(BSTR);
    HRESULT get_Company(BSTR*);
    HRESULT put_Company(BSTR);
    HRESULT get_Country(BSTR*);
    HRESULT put_Country(BSTR);
    HRESULT get_Department(BSTR*);
    HRESULT put_Department(BSTR);
    HRESULT get_Email(BSTR*);
    HRESULT put_Email(BSTR);
    HRESULT get_FaxNumber(BSTR*);
    HRESULT put_FaxNumber(BSTR);
    HRESULT get_HomePhone(BSTR*);
    HRESULT put_HomePhone(BSTR);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_TSID(BSTR*);
    HRESULT put_TSID(BSTR);
    HRESULT get_OfficePhone(BSTR*);
    HRESULT put_OfficePhone(BSTR);
    HRESULT get_OfficeLocation(BSTR*);
    HRESULT put_OfficeLocation(BSTR);
    HRESULT get_State(BSTR*);
    HRESULT put_State(BSTR);
    HRESULT get_StreetAddress(BSTR*);
    HRESULT put_StreetAddress(BSTR);
    HRESULT get_Title(BSTR*);
    HRESULT put_Title(BSTR);
    HRESULT get_ZipCode(BSTR*);
    HRESULT put_ZipCode(BSTR);
    HRESULT LoadDefaultSender();
    HRESULT SaveDefaultSender();
}
enum IID_IFaxRecipient = GUID(0x9a3da3a0, 0x538d, 0x42b6, [0x94, 0x44, 0xaa, 0xa5, 0x7d, 0xc, 0xe2, 0xbc]);
interface IFaxRecipient : IDispatch
{
    HRESULT get_FaxNumber(BSTR*);
    HRESULT put_FaxNumber(BSTR);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
}
enum IID_IFaxRecipients = GUID(0xb9c9de5a, 0x894e, 0x4492, [0x9f, 0xa3, 0x8, 0xc6, 0x27, 0xc1, 0x1d, 0x5d]);
interface IFaxRecipients : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IFaxRecipient*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, BSTR, IFaxRecipient*);
    HRESULT Remove(int);
}
enum IID_IFaxIncomingArchive = GUID(0x76062cc7, 0xf714, 0x4fbd, [0xaa, 0x6, 0xed, 0x6e, 0x4a, 0x4b, 0x70, 0xf3]);
interface IFaxIncomingArchive : IDispatch
{
    HRESULT get_UseArchive(VARIANT_BOOL*);
    HRESULT put_UseArchive(VARIANT_BOOL);
    HRESULT get_ArchiveFolder(BSTR*);
    HRESULT put_ArchiveFolder(BSTR);
    HRESULT get_SizeQuotaWarning(VARIANT_BOOL*);
    HRESULT put_SizeQuotaWarning(VARIANT_BOOL);
    HRESULT get_HighQuotaWaterMark(int*);
    HRESULT put_HighQuotaWaterMark(int);
    HRESULT get_LowQuotaWaterMark(int*);
    HRESULT put_LowQuotaWaterMark(int);
    HRESULT get_AgeLimit(int*);
    HRESULT put_AgeLimit(int);
    HRESULT get_SizeLow(int*);
    HRESULT get_SizeHigh(int*);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT GetMessages(int, IFaxIncomingMessageIterator*);
    HRESULT GetMessage(BSTR, IFaxIncomingMessage*);
}
enum IID_IFaxIncomingQueue = GUID(0x902e64ef, 0x8fd8, 0x4b75, [0x97, 0x25, 0x60, 0x14, 0xdf, 0x16, 0x15, 0x45]);
interface IFaxIncomingQueue : IDispatch
{
    HRESULT get_Blocked(VARIANT_BOOL*);
    HRESULT put_Blocked(VARIANT_BOOL);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT GetJobs(IFaxIncomingJobs*);
    HRESULT GetJob(BSTR, IFaxIncomingJob*);
}
enum IID_IFaxOutgoingArchive = GUID(0xc9c28f40, 0x8d80, 0x4e53, [0x81, 0xf, 0x9a, 0x79, 0x91, 0x9b, 0x49, 0xfd]);
interface IFaxOutgoingArchive : IDispatch
{
    HRESULT get_UseArchive(VARIANT_BOOL*);
    HRESULT put_UseArchive(VARIANT_BOOL);
    HRESULT get_ArchiveFolder(BSTR*);
    HRESULT put_ArchiveFolder(BSTR);
    HRESULT get_SizeQuotaWarning(VARIANT_BOOL*);
    HRESULT put_SizeQuotaWarning(VARIANT_BOOL);
    HRESULT get_HighQuotaWaterMark(int*);
    HRESULT put_HighQuotaWaterMark(int);
    HRESULT get_LowQuotaWaterMark(int*);
    HRESULT put_LowQuotaWaterMark(int);
    HRESULT get_AgeLimit(int*);
    HRESULT put_AgeLimit(int);
    HRESULT get_SizeLow(int*);
    HRESULT get_SizeHigh(int*);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT GetMessages(int, IFaxOutgoingMessageIterator*);
    HRESULT GetMessage(BSTR, IFaxOutgoingMessage*);
}
enum IID_IFaxOutgoingQueue = GUID(0x80b1df24, 0xd9ac, 0x4333, [0xb3, 0x73, 0x48, 0x7c, 0xed, 0xc8, 0xc, 0xe5]);
interface IFaxOutgoingQueue : IDispatch
{
    HRESULT get_Blocked(VARIANT_BOOL*);
    HRESULT put_Blocked(VARIANT_BOOL);
    HRESULT get_Paused(VARIANT_BOOL*);
    HRESULT put_Paused(VARIANT_BOOL);
    HRESULT get_AllowPersonalCoverPages(VARIANT_BOOL*);
    HRESULT put_AllowPersonalCoverPages(VARIANT_BOOL);
    HRESULT get_UseDeviceTSID(VARIANT_BOOL*);
    HRESULT put_UseDeviceTSID(VARIANT_BOOL);
    HRESULT get_Retries(int*);
    HRESULT put_Retries(int);
    HRESULT get_RetryDelay(int*);
    HRESULT put_RetryDelay(int);
    HRESULT get_DiscountRateStart(double*);
    HRESULT put_DiscountRateStart(double);
    HRESULT get_DiscountRateEnd(double*);
    HRESULT put_DiscountRateEnd(double);
    HRESULT get_AgeLimit(int*);
    HRESULT put_AgeLimit(int);
    HRESULT get_Branding(VARIANT_BOOL*);
    HRESULT put_Branding(VARIANT_BOOL);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT GetJobs(IFaxOutgoingJobs*);
    HRESULT GetJob(BSTR, IFaxOutgoingJob*);
}
enum IID_IFaxIncomingMessageIterator = GUID(0xfd73ecc4, 0x6f06, 0x4f52, [0x82, 0xa8, 0xf7, 0xba, 0x6, 0xae, 0x31, 0x8]);
interface IFaxIncomingMessageIterator : IDispatch
{
    HRESULT get_Message(IFaxIncomingMessage*);
    HRESULT get_PrefetchSize(int*);
    HRESULT put_PrefetchSize(int);
    HRESULT get_AtEOF(VARIANT_BOOL*);
    HRESULT MoveFirst();
    HRESULT MoveNext();
}
enum IID_IFaxIncomingMessage = GUID(0x7cab88fa, 0x2ef9, 0x4851, [0xb2, 0xf3, 0x1d, 0x14, 0x8f, 0xed, 0x84, 0x47]);
interface IFaxIncomingMessage : IDispatch
{
    HRESULT get_Id(BSTR*);
    HRESULT get_Pages(int*);
    HRESULT get_Size(int*);
    HRESULT get_DeviceName(BSTR*);
    HRESULT get_Retries(int*);
    HRESULT get_TransmissionStart(double*);
    HRESULT get_TransmissionEnd(double*);
    HRESULT get_CSID(BSTR*);
    HRESULT get_TSID(BSTR*);
    HRESULT get_CallerId(BSTR*);
    HRESULT get_RoutingInformation(BSTR*);
    HRESULT CopyTiff(BSTR);
    HRESULT Delete();
}
enum IID_IFaxOutgoingJobs = GUID(0x2c56d8e6, 0x8c2f, 0x4573, [0x94, 0x4c, 0xe5, 0x5, 0xf8, 0xf5, 0xae, 0xed]);
interface IFaxOutgoingJobs : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxOutgoingJob*);
    HRESULT get_Count(int*);
}
enum IID_IFaxOutgoingJob = GUID(0x6356daad, 0x6614, 0x4583, [0xbf, 0x7a, 0x3a, 0xd6, 0x7b, 0xbf, 0xc7, 0x1c]);
interface IFaxOutgoingJob : IDispatch
{
    HRESULT get_Subject(BSTR*);
    HRESULT get_DocumentName(BSTR*);
    HRESULT get_Pages(int*);
    HRESULT get_Size(int*);
    HRESULT get_SubmissionId(BSTR*);
    HRESULT get_Id(BSTR*);
    HRESULT get_OriginalScheduledTime(double*);
    HRESULT get_SubmissionTime(double*);
    HRESULT get_ReceiptType(FAX_RECEIPT_TYPE_ENUM*);
    HRESULT get_Priority(FAX_PRIORITY_TYPE_ENUM*);
    HRESULT get_Sender(IFaxSender*);
    HRESULT get_Recipient(IFaxRecipient*);
    HRESULT get_CurrentPage(int*);
    HRESULT get_DeviceId(int*);
    HRESULT get_Status(FAX_JOB_STATUS_ENUM*);
    HRESULT get_ExtendedStatusCode(FAX_JOB_EXTENDED_STATUS_ENUM*);
    HRESULT get_ExtendedStatus(BSTR*);
    HRESULT get_AvailableOperations(FAX_JOB_OPERATIONS_ENUM*);
    HRESULT get_Retries(int*);
    HRESULT get_ScheduledTime(double*);
    HRESULT get_TransmissionStart(double*);
    HRESULT get_TransmissionEnd(double*);
    HRESULT get_CSID(BSTR*);
    HRESULT get_TSID(BSTR*);
    HRESULT get_GroupBroadcastReceipts(VARIANT_BOOL*);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Restart();
    HRESULT CopyTiff(BSTR);
    HRESULT Refresh();
    HRESULT Cancel();
}
enum IID_IFaxOutgoingMessageIterator = GUID(0xf5ec5d4f, 0xb840, 0x432f, [0x99, 0x80, 0x11, 0x2f, 0xe4, 0x2a, 0x9b, 0x7a]);
interface IFaxOutgoingMessageIterator : IDispatch
{
    HRESULT get_Message(IFaxOutgoingMessage*);
    HRESULT get_AtEOF(VARIANT_BOOL*);
    HRESULT get_PrefetchSize(int*);
    HRESULT put_PrefetchSize(int);
    HRESULT MoveFirst();
    HRESULT MoveNext();
}
enum IID_IFaxOutgoingMessage = GUID(0xf0ea35de, 0xcaa5, 0x4a7c, [0x82, 0xc7, 0x2b, 0x60, 0xba, 0x5f, 0x2b, 0xe2]);
interface IFaxOutgoingMessage : IDispatch
{
    HRESULT get_SubmissionId(BSTR*);
    HRESULT get_Id(BSTR*);
    HRESULT get_Subject(BSTR*);
    HRESULT get_DocumentName(BSTR*);
    HRESULT get_Retries(int*);
    HRESULT get_Pages(int*);
    HRESULT get_Size(int*);
    HRESULT get_OriginalScheduledTime(double*);
    HRESULT get_SubmissionTime(double*);
    HRESULT get_Priority(FAX_PRIORITY_TYPE_ENUM*);
    HRESULT get_Sender(IFaxSender*);
    HRESULT get_Recipient(IFaxRecipient*);
    HRESULT get_DeviceName(BSTR*);
    HRESULT get_TransmissionStart(double*);
    HRESULT get_TransmissionEnd(double*);
    HRESULT get_CSID(BSTR*);
    HRESULT get_TSID(BSTR*);
    HRESULT CopyTiff(BSTR);
    HRESULT Delete();
}
enum IID_IFaxIncomingJobs = GUID(0x11f04e9, 0x4fd6, 0x4c23, [0x95, 0x13, 0xb6, 0xb6, 0x6b, 0xb2, 0x6b, 0xe9]);
interface IFaxIncomingJobs : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxIncomingJob*);
    HRESULT get_Count(int*);
}
enum IID_IFaxIncomingJob = GUID(0x207529e6, 0x654a, 0x4916, [0x9f, 0x88, 0x4d, 0x23, 0x2e, 0xe8, 0xa1, 0x7]);
interface IFaxIncomingJob : IDispatch
{
    HRESULT get_Size(int*);
    HRESULT get_Id(BSTR*);
    HRESULT get_CurrentPage(int*);
    HRESULT get_DeviceId(int*);
    HRESULT get_Status(FAX_JOB_STATUS_ENUM*);
    HRESULT get_ExtendedStatusCode(FAX_JOB_EXTENDED_STATUS_ENUM*);
    HRESULT get_ExtendedStatus(BSTR*);
    HRESULT get_AvailableOperations(FAX_JOB_OPERATIONS_ENUM*);
    HRESULT get_Retries(int*);
    HRESULT get_TransmissionStart(double*);
    HRESULT get_TransmissionEnd(double*);
    HRESULT get_CSID(BSTR*);
    HRESULT get_TSID(BSTR*);
    HRESULT get_CallerId(BSTR*);
    HRESULT get_RoutingInformation(BSTR*);
    HRESULT get_JobType(FAX_JOB_TYPE_ENUM*);
    HRESULT Cancel();
    HRESULT Refresh();
    HRESULT CopyTiff(BSTR);
}
alias FAX_PROVIDER_STATUS_ENUM = int;
enum : int
{
    fpsSUCCESS      = 0x00000000,
    fpsSERVER_ERROR = 0x00000001,
    fpsBAD_GUID     = 0x00000002,
    fpsBAD_VERSION  = 0x00000003,
    fpsCANT_LOAD    = 0x00000004,
    fpsCANT_LINK    = 0x00000005,
    fpsCANT_INIT    = 0x00000006,
}

enum IID_IFaxDeviceProvider = GUID(0x290eac63, 0x83ec, 0x449c, [0x84, 0x17, 0xf1, 0x48, 0xdf, 0x8c, 0x68, 0x2a]);
interface IFaxDeviceProvider : IDispatch
{
    HRESULT get_FriendlyName(BSTR*);
    HRESULT get_ImageName(BSTR*);
    HRESULT get_UniqueName(BSTR*);
    HRESULT get_TapiProviderName(BSTR*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
    HRESULT get_MajorBuild(int*);
    HRESULT get_MinorBuild(int*);
    HRESULT get_Debug(VARIANT_BOOL*);
    HRESULT get_Status(FAX_PROVIDER_STATUS_ENUM*);
    HRESULT get_InitErrorCode(int*);
    HRESULT get_DeviceIds(VARIANT*);
}
alias FAX_DEVICE_RECEIVE_MODE_ENUM = int;
enum : int
{
    fdrmNO_ANSWER     = 0x00000000,
    fdrmAUTO_ANSWER   = 0x00000001,
    fdrmMANUAL_ANSWER = 0x00000002,
}

enum IID_IFaxDevice = GUID(0x49306c59, 0xb52e, 0x4867, [0x9d, 0xf4, 0xca, 0x58, 0x41, 0xc9, 0x56, 0xd0]);
interface IFaxDevice : IDispatch
{
    HRESULT get_Id(int*);
    HRESULT get_DeviceName(BSTR*);
    HRESULT get_ProviderUniqueName(BSTR*);
    HRESULT get_PoweredOff(VARIANT_BOOL*);
    HRESULT get_ReceivingNow(VARIANT_BOOL*);
    HRESULT get_SendingNow(VARIANT_BOOL*);
    HRESULT get_UsedRoutingMethods(VARIANT*);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_SendEnabled(VARIANT_BOOL*);
    HRESULT put_SendEnabled(VARIANT_BOOL);
    HRESULT get_ReceiveMode(FAX_DEVICE_RECEIVE_MODE_ENUM*);
    HRESULT put_ReceiveMode(FAX_DEVICE_RECEIVE_MODE_ENUM);
    HRESULT get_RingsBeforeAnswer(int*);
    HRESULT put_RingsBeforeAnswer(int);
    HRESULT get_CSID(BSTR*);
    HRESULT put_CSID(BSTR);
    HRESULT get_TSID(BSTR*);
    HRESULT put_TSID(BSTR);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT GetExtensionProperty(BSTR, VARIANT*);
    HRESULT SetExtensionProperty(BSTR, VARIANT);
    HRESULT UseRoutingMethod(BSTR, VARIANT_BOOL);
    HRESULT get_RingingNow(VARIANT_BOOL*);
    HRESULT AnswerCall();
}
enum IID_IFaxActivityLogging = GUID(0x1e29078b, 0x5a69, 0x497b, [0x95, 0x92, 0x49, 0xb7, 0xe7, 0xfa, 0xdd, 0xb5]);
interface IFaxActivityLogging : IDispatch
{
    HRESULT get_LogIncoming(VARIANT_BOOL*);
    HRESULT put_LogIncoming(VARIANT_BOOL);
    HRESULT get_LogOutgoing(VARIANT_BOOL*);
    HRESULT put_LogOutgoing(VARIANT_BOOL);
    HRESULT get_DatabasePath(BSTR*);
    HRESULT put_DatabasePath(BSTR);
    HRESULT Refresh();
    HRESULT Save();
}
alias FAX_LOG_LEVEL_ENUM = int;
enum : int
{
    fllNONE = 0x00000000,
    fllMIN  = 0x00000001,
    fllMED  = 0x00000002,
    fllMAX  = 0x00000003,
}

enum IID_IFaxEventLogging = GUID(0x880d965, 0x20e8, 0x42e4, [0x8e, 0x17, 0x94, 0x4f, 0x19, 0x2c, 0xaa, 0xd4]);
interface IFaxEventLogging : IDispatch
{
    HRESULT get_InitEventsLevel(FAX_LOG_LEVEL_ENUM*);
    HRESULT put_InitEventsLevel(FAX_LOG_LEVEL_ENUM);
    HRESULT get_InboundEventsLevel(FAX_LOG_LEVEL_ENUM*);
    HRESULT put_InboundEventsLevel(FAX_LOG_LEVEL_ENUM);
    HRESULT get_OutboundEventsLevel(FAX_LOG_LEVEL_ENUM*);
    HRESULT put_OutboundEventsLevel(FAX_LOG_LEVEL_ENUM);
    HRESULT get_GeneralEventsLevel(FAX_LOG_LEVEL_ENUM*);
    HRESULT put_GeneralEventsLevel(FAX_LOG_LEVEL_ENUM);
    HRESULT Refresh();
    HRESULT Save();
}
enum IID_IFaxOutboundRoutingGroups = GUID(0x235cbef7, 0xc2de, 0x4bfd, [0xb8, 0xda, 0x75, 0x9, 0x7c, 0x82, 0xc8, 0x7f]);
interface IFaxOutboundRoutingGroups : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxOutboundRoutingGroup*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, IFaxOutboundRoutingGroup*);
    HRESULT Remove(VARIANT);
}
alias FAX_GROUP_STATUS_ENUM = int;
enum : int
{
    fgsALL_DEV_VALID      = 0x00000000,
    fgsEMPTY              = 0x00000001,
    fgsALL_DEV_NOT_VALID  = 0x00000002,
    fgsSOME_DEV_NOT_VALID = 0x00000003,
}

enum IID_IFaxOutboundRoutingGroup = GUID(0xca6289a1, 0x7e25, 0x4f87, [0x9a, 0xb, 0x93, 0x36, 0x57, 0x34, 0x96, 0x2c]);
interface IFaxOutboundRoutingGroup : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Status(FAX_GROUP_STATUS_ENUM*);
    HRESULT get_DeviceIds(IFaxDeviceIds*);
}
enum IID_IFaxDeviceIds = GUID(0x2f0f813f, 0x4ce9, 0x443e, [0x8c, 0xa1, 0x73, 0x8c, 0xfa, 0xee, 0xe1, 0x49]);
interface IFaxDeviceIds : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, int*);
    HRESULT get_Count(int*);
    HRESULT Add(int);
    HRESULT Remove(int);
    HRESULT SetOrder(int, int);
}
enum IID_IFaxOutboundRoutingRules = GUID(0xdcefa1e7, 0xae7d, 0x4ed6, [0x85, 0x21, 0x36, 0x9e, 0xdc, 0xca, 0x51, 0x20]);
interface IFaxOutboundRoutingRules : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IFaxOutboundRoutingRule*);
    HRESULT get_Count(int*);
    HRESULT ItemByCountryAndArea(int, int, IFaxOutboundRoutingRule*);
    HRESULT RemoveByCountryAndArea(int, int);
    HRESULT Remove(int);
    HRESULT Add(int, int, VARIANT_BOOL, BSTR, int, IFaxOutboundRoutingRule*);
}
alias FAX_RULE_STATUS_ENUM = int;
enum : int
{
    frsVALID                    = 0x00000000,
    frsEMPTY_GROUP              = 0x00000001,
    frsALL_GROUP_DEV_NOT_VALID  = 0x00000002,
    frsSOME_GROUP_DEV_NOT_VALID = 0x00000003,
    frsBAD_DEVICE               = 0x00000004,
}

enum IID_IFaxOutboundRoutingRule = GUID(0xe1f795d5, 0x7c2, 0x469f, [0xb0, 0x27, 0xac, 0xac, 0xc2, 0x32, 0x19, 0xda]);
interface IFaxOutboundRoutingRule : IDispatch
{
    HRESULT get_CountryCode(int*);
    HRESULT get_AreaCode(int*);
    HRESULT get_Status(FAX_RULE_STATUS_ENUM*);
    HRESULT get_UseDevice(VARIANT_BOOL*);
    HRESULT put_UseDevice(VARIANT_BOOL);
    HRESULT get_DeviceId(int*);
    HRESULT put_DeviceId(int);
    HRESULT get_GroupName(BSTR*);
    HRESULT put_GroupName(BSTR);
    HRESULT Refresh();
    HRESULT Save();
}
enum IID_IFaxInboundRoutingExtensions = GUID(0x2f6c9673, 0x7b26, 0x42de, [0x8e, 0xb0, 0x91, 0x5d, 0xcd, 0x2a, 0x4f, 0x4c]);
interface IFaxInboundRoutingExtensions : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxInboundRoutingExtension*);
    HRESULT get_Count(int*);
}
enum IID_IFaxInboundRoutingExtension = GUID(0x885b5e08, 0xc26c, 0x4ef9, [0xaf, 0x83, 0x51, 0x58, 0xa, 0x75, 0xb, 0xe1]);
interface IFaxInboundRoutingExtension : IDispatch
{
    HRESULT get_FriendlyName(BSTR*);
    HRESULT get_ImageName(BSTR*);
    HRESULT get_UniqueName(BSTR*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
    HRESULT get_MajorBuild(int*);
    HRESULT get_MinorBuild(int*);
    HRESULT get_Debug(VARIANT_BOOL*);
    HRESULT get_Status(FAX_PROVIDER_STATUS_ENUM*);
    HRESULT get_InitErrorCode(int*);
    HRESULT get_Methods(VARIANT*);
}
enum IID_IFaxInboundRoutingMethods = GUID(0x783fca10, 0x8908, 0x4473, [0x9d, 0x69, 0xf6, 0x7f, 0xbe, 0xa0, 0xc6, 0xb9]);
interface IFaxInboundRoutingMethods : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxInboundRoutingMethod*);
    HRESULT get_Count(int*);
}
enum IID_IFaxInboundRoutingMethod = GUID(0x45700061, 0xad9d, 0x4776, [0xa8, 0xc4, 0x64, 0x6, 0x54, 0x92, 0xcf, 0x4b]);
interface IFaxInboundRoutingMethod : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_GUID(BSTR*);
    HRESULT get_FunctionName(BSTR*);
    HRESULT get_ExtensionFriendlyName(BSTR*);
    HRESULT get_ExtensionImageName(BSTR*);
    HRESULT get_Priority(int*);
    HRESULT put_Priority(int);
    HRESULT Refresh();
    HRESULT Save();
}
enum IID_IFaxDocument2 = GUID(0xe1347661, 0xf9ef, 0x4d6d, [0xb4, 0xa5, 0xc0, 0xa0, 0x68, 0xb6, 0x5c, 0xff]);
interface IFaxDocument2 : IFaxDocument
{
    HRESULT get_SubmissionId(BSTR*);
    HRESULT get_Bodies(VARIANT*);
    HRESULT put_Bodies(VARIANT);
    HRESULT Submit2(BSTR, VARIANT*, int*);
    HRESULT ConnectedSubmit2(IFaxServer, VARIANT*, int*);
}
enum IID_IFaxConfiguration = GUID(0x10f4d0f7, 0x994, 0x4543, [0xab, 0x6e, 0x50, 0x69, 0x49, 0x12, 0x8c, 0x40]);
interface IFaxConfiguration : IDispatch
{
    HRESULT get_UseArchive(VARIANT_BOOL*);
    HRESULT put_UseArchive(VARIANT_BOOL);
    HRESULT get_ArchiveLocation(BSTR*);
    HRESULT put_ArchiveLocation(BSTR);
    HRESULT get_SizeQuotaWarning(VARIANT_BOOL*);
    HRESULT put_SizeQuotaWarning(VARIANT_BOOL);
    HRESULT get_HighQuotaWaterMark(int*);
    HRESULT put_HighQuotaWaterMark(int);
    HRESULT get_LowQuotaWaterMark(int*);
    HRESULT put_LowQuotaWaterMark(int);
    HRESULT get_ArchiveAgeLimit(int*);
    HRESULT put_ArchiveAgeLimit(int);
    HRESULT get_ArchiveSizeLow(int*);
    HRESULT get_ArchiveSizeHigh(int*);
    HRESULT get_OutgoingQueueBlocked(VARIANT_BOOL*);
    HRESULT put_OutgoingQueueBlocked(VARIANT_BOOL);
    HRESULT get_OutgoingQueuePaused(VARIANT_BOOL*);
    HRESULT put_OutgoingQueuePaused(VARIANT_BOOL);
    HRESULT get_AllowPersonalCoverPages(VARIANT_BOOL*);
    HRESULT put_AllowPersonalCoverPages(VARIANT_BOOL);
    HRESULT get_UseDeviceTSID(VARIANT_BOOL*);
    HRESULT put_UseDeviceTSID(VARIANT_BOOL);
    HRESULT get_Retries(int*);
    HRESULT put_Retries(int);
    HRESULT get_RetryDelay(int*);
    HRESULT put_RetryDelay(int);
    HRESULT get_DiscountRateStart(double*);
    HRESULT put_DiscountRateStart(double);
    HRESULT get_DiscountRateEnd(double*);
    HRESULT put_DiscountRateEnd(double);
    HRESULT get_OutgoingQueueAgeLimit(int*);
    HRESULT put_OutgoingQueueAgeLimit(int);
    HRESULT get_Branding(VARIANT_BOOL*);
    HRESULT put_Branding(VARIANT_BOOL);
    HRESULT get_IncomingQueueBlocked(VARIANT_BOOL*);
    HRESULT put_IncomingQueueBlocked(VARIANT_BOOL);
    HRESULT get_AutoCreateAccountOnConnect(VARIANT_BOOL*);
    HRESULT put_AutoCreateAccountOnConnect(VARIANT_BOOL);
    HRESULT get_IncomingFaxesArePublic(VARIANT_BOOL*);
    HRESULT put_IncomingFaxesArePublic(VARIANT_BOOL);
    HRESULT Refresh();
    HRESULT Save();
}
enum IID_IFaxServer2 = GUID(0x571ced0f, 0x5609, 0x4f40, [0x91, 0x76, 0x54, 0x7e, 0x3a, 0x72, 0xca, 0x7c]);
interface IFaxServer2 : IFaxServer
{
    HRESULT get_Configuration(IFaxConfiguration*);
    HRESULT get_CurrentAccount(IFaxAccount*);
    HRESULT get_FaxAccountSet(IFaxAccountSet*);
    HRESULT get_Security2(IFaxSecurity2*);
}
enum IID_IFaxAccountSet = GUID(0x7428fbae, 0x841e, 0x47b8, [0x86, 0xf4, 0x22, 0x88, 0x94, 0x6d, 0xca, 0x1b]);
interface IFaxAccountSet : IDispatch
{
    HRESULT GetAccounts(IFaxAccounts*);
    HRESULT GetAccount(BSTR, IFaxAccount*);
    HRESULT AddAccount(BSTR, IFaxAccount*);
    HRESULT RemoveAccount(BSTR);
}
enum IID_IFaxAccounts = GUID(0x93ea8162, 0x8be7, 0x42d1, [0xae, 0x7b, 0xec, 0x74, 0xe2, 0xd9, 0x89, 0xda]);
interface IFaxAccounts : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IFaxAccount*);
    HRESULT get_Count(int*);
}
alias FAX_ACCOUNT_EVENTS_TYPE_ENUM = int;
enum : int
{
    faetNONE         = 0x00000000,
    faetIN_QUEUE     = 0x00000001,
    faetOUT_QUEUE    = 0x00000002,
    faetIN_ARCHIVE   = 0x00000004,
    faetOUT_ARCHIVE  = 0x00000008,
    faetFXSSVC_ENDED = 0x00000010,
}

enum IID_IFaxAccount = GUID(0x68535b33, 0x5dc4, 0x4086, [0xbe, 0x26, 0xb7, 0x6f, 0x9b, 0x71, 0x10, 0x6]);
interface IFaxAccount : IDispatch
{
    HRESULT get_AccountName(BSTR*);
    HRESULT get_Folders(IFaxAccountFolders*);
    HRESULT ListenToAccountEvents(FAX_ACCOUNT_EVENTS_TYPE_ENUM);
    HRESULT get_RegisteredEvents(FAX_ACCOUNT_EVENTS_TYPE_ENUM*);
}
enum IID_IFaxOutgoingJob2 = GUID(0x418a8d96, 0x59a0, 0x4789, [0xb1, 0x76, 0xed, 0xf3, 0xdc, 0x8f, 0xa8, 0xf7]);
interface IFaxOutgoingJob2 : IFaxOutgoingJob
{
    HRESULT get_HasCoverPage(VARIANT_BOOL*);
    HRESULT get_ReceiptAddress(BSTR*);
    HRESULT get_ScheduleType(FAX_SCHEDULE_TYPE_ENUM*);
}
enum IID_IFaxAccountFolders = GUID(0x6463f89d, 0x23d8, 0x46a9, [0x8f, 0x86, 0xc4, 0x7b, 0x77, 0xca, 0x79, 0x26]);
interface IFaxAccountFolders : IDispatch
{
    HRESULT get_OutgoingQueue(IFaxAccountOutgoingQueue*);
    HRESULT get_IncomingQueue(IFaxAccountIncomingQueue*);
    HRESULT get_IncomingArchive(IFaxAccountIncomingArchive*);
    HRESULT get_OutgoingArchive(IFaxAccountOutgoingArchive*);
}
enum IID_IFaxAccountIncomingQueue = GUID(0xdd142d92, 0x186, 0x4a95, [0xa0, 0x90, 0xcb, 0xc3, 0xea, 0xdb, 0xa6, 0xb4]);
interface IFaxAccountIncomingQueue : IDispatch
{
    HRESULT GetJobs(IFaxIncomingJobs*);
    HRESULT GetJob(BSTR, IFaxIncomingJob*);
}
enum IID_IFaxAccountOutgoingQueue = GUID(0xf1424e9, 0xf22d, 0x4553, [0xb7, 0xa5, 0xd, 0x24, 0xbd, 0xd, 0x7e, 0x46]);
interface IFaxAccountOutgoingQueue : IDispatch
{
    HRESULT GetJobs(IFaxOutgoingJobs*);
    HRESULT GetJob(BSTR, IFaxOutgoingJob*);
}
enum IID_IFaxOutgoingMessage2 = GUID(0xb37df687, 0xbc88, 0x4b46, [0xb3, 0xbe, 0xb4, 0x58, 0xb3, 0xea, 0x9e, 0x7f]);
interface IFaxOutgoingMessage2 : IFaxOutgoingMessage
{
    HRESULT get_HasCoverPage(VARIANT_BOOL*);
    HRESULT get_ReceiptType(FAX_RECEIPT_TYPE_ENUM*);
    HRESULT get_ReceiptAddress(BSTR*);
    HRESULT get_Read(VARIANT_BOOL*);
    HRESULT put_Read(VARIANT_BOOL);
    HRESULT Save();
    HRESULT Refresh();
}
enum IID_IFaxAccountIncomingArchive = GUID(0xa8a5b6ef, 0xe0d6, 0x4aee, [0x95, 0x5c, 0x91, 0x62, 0x5b, 0xec, 0x9d, 0xb4]);
interface IFaxAccountIncomingArchive : IDispatch
{
    HRESULT get_SizeLow(int*);
    HRESULT get_SizeHigh(int*);
    HRESULT Refresh();
    HRESULT GetMessages(int, IFaxIncomingMessageIterator*);
    HRESULT GetMessage(BSTR, IFaxIncomingMessage*);
}
enum IID_IFaxAccountOutgoingArchive = GUID(0x5463076d, 0xec14, 0x491f, [0x92, 0x6e, 0xb3, 0xce, 0xda, 0x5e, 0x56, 0x62]);
interface IFaxAccountOutgoingArchive : IDispatch
{
    HRESULT get_SizeLow(int*);
    HRESULT get_SizeHigh(int*);
    HRESULT Refresh();
    HRESULT GetMessages(int, IFaxOutgoingMessageIterator*);
    HRESULT GetMessage(BSTR, IFaxOutgoingMessage*);
}
alias FAX_ACCESS_RIGHTS_ENUM_2 = int;
enum : int
{
    far2SUBMIT_LOW            = 0x00000001,
    far2SUBMIT_NORMAL         = 0x00000002,
    far2SUBMIT_HIGH           = 0x00000004,
    far2QUERY_OUT_JOBS        = 0x00000008,
    far2MANAGE_OUT_JOBS       = 0x00000010,
    far2QUERY_CONFIG          = 0x00000020,
    far2MANAGE_CONFIG         = 0x00000040,
    far2QUERY_ARCHIVES        = 0x00000080,
    far2MANAGE_ARCHIVES       = 0x00000100,
    far2MANAGE_RECEIVE_FOLDER = 0x00000200,
}

enum IID_IFaxSecurity2 = GUID(0x17d851f4, 0xd09b, 0x48fc, [0x99, 0xc9, 0x8f, 0x24, 0xc4, 0xdb, 0x9a, 0xb1]);
interface IFaxSecurity2 : IDispatch
{
    HRESULT get_Descriptor(VARIANT*);
    HRESULT put_Descriptor(VARIANT);
    HRESULT get_GrantedRights(FAX_ACCESS_RIGHTS_ENUM_2*);
    HRESULT Refresh();
    HRESULT Save();
    HRESULT get_InformationType(int*);
    HRESULT put_InformationType(int);
}
enum IID_IFaxIncomingMessage2 = GUID(0xf9208503, 0xe2bc, 0x48f3, [0x9e, 0xc0, 0xe6, 0x23, 0x6f, 0x9b, 0x50, 0x9a]);
interface IFaxIncomingMessage2 : IFaxIncomingMessage
{
    HRESULT get_Subject(BSTR*);
    HRESULT put_Subject(BSTR);
    HRESULT get_SenderName(BSTR*);
    HRESULT put_SenderName(BSTR);
    HRESULT get_SenderFaxNumber(BSTR*);
    HRESULT put_SenderFaxNumber(BSTR);
    HRESULT get_HasCoverPage(VARIANT_BOOL*);
    HRESULT put_HasCoverPage(VARIANT_BOOL);
    HRESULT get_Recipients(BSTR*);
    HRESULT put_Recipients(BSTR);
    HRESULT get_WasReAssigned(VARIANT_BOOL*);
    HRESULT get_Read(VARIANT_BOOL*);
    HRESULT put_Read(VARIANT_BOOL);
    HRESULT ReAssign();
    HRESULT Save();
    HRESULT Refresh();
}
alias FAX_ROUTING_RULE_CODE_ENUM = int;
enum : int
{
    frrcANY_CODE = 0x00000000,
}

enum IID_IFaxServerNotify = GUID(0x2e037b27, 0xcf8a, 0x4abd, [0xb1, 0xe0, 0x57, 0x4, 0x94, 0x3b, 0xea, 0x6f]);
interface IFaxServerNotify : IDispatch
{
}
enum IID_IFaxServerNotify2 = GUID(0xec9c69b9, 0x5fe7, 0x4805, [0x94, 0x67, 0x82, 0xfc, 0xd9, 0x6a, 0xf9, 0x3]);
interface IFaxServerNotify2 : IDispatch
{
    HRESULT OnIncomingJobAdded(IFaxServer2, BSTR);
    HRESULT OnIncomingJobRemoved(IFaxServer2, BSTR);
    HRESULT OnIncomingJobChanged(IFaxServer2, BSTR, IFaxJobStatus);
    HRESULT OnOutgoingJobAdded(IFaxServer2, BSTR);
    HRESULT OnOutgoingJobRemoved(IFaxServer2, BSTR);
    HRESULT OnOutgoingJobChanged(IFaxServer2, BSTR, IFaxJobStatus);
    HRESULT OnIncomingMessageAdded(IFaxServer2, BSTR);
    HRESULT OnIncomingMessageRemoved(IFaxServer2, BSTR);
    HRESULT OnOutgoingMessageAdded(IFaxServer2, BSTR);
    HRESULT OnOutgoingMessageRemoved(IFaxServer2, BSTR);
    HRESULT OnReceiptOptionsChange(IFaxServer2);
    HRESULT OnActivityLoggingConfigChange(IFaxServer2);
    HRESULT OnSecurityConfigChange(IFaxServer2);
    HRESULT OnEventLoggingConfigChange(IFaxServer2);
    HRESULT OnOutgoingQueueConfigChange(IFaxServer2);
    HRESULT OnOutgoingArchiveConfigChange(IFaxServer2);
    HRESULT OnIncomingArchiveConfigChange(IFaxServer2);
    HRESULT OnDevicesConfigChange(IFaxServer2);
    HRESULT OnOutboundRoutingGroupsConfigChange(IFaxServer2);
    HRESULT OnOutboundRoutingRulesConfigChange(IFaxServer2);
    HRESULT OnServerActivityChange(IFaxServer2, int, int, int, int);
    HRESULT OnQueuesStatusChange(IFaxServer2, VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL);
    HRESULT OnNewCall(IFaxServer2, int, int, BSTR);
    HRESULT OnServerShutDown(IFaxServer2);
    HRESULT OnDeviceStatusChange(IFaxServer2, int, VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL);
    HRESULT OnGeneralServerConfigChanged(IFaxServer2);
}
enum IID_IFaxAccountNotify = GUID(0xb9b3bc81, 0xac1b, 0x46f3, [0xb3, 0x9d, 0xa, 0xdc, 0x30, 0xe1, 0xb7, 0x88]);
interface IFaxAccountNotify : IDispatch
{
    HRESULT OnIncomingJobAdded(IFaxAccount, BSTR);
    HRESULT OnIncomingJobRemoved(IFaxAccount, BSTR);
    HRESULT OnIncomingJobChanged(IFaxAccount, BSTR, IFaxJobStatus);
    HRESULT OnOutgoingJobAdded(IFaxAccount, BSTR);
    HRESULT OnOutgoingJobRemoved(IFaxAccount, BSTR);
    HRESULT OnOutgoingJobChanged(IFaxAccount, BSTR, IFaxJobStatus);
    HRESULT OnIncomingMessageAdded(IFaxAccount, BSTR, VARIANT_BOOL);
    HRESULT OnIncomingMessageRemoved(IFaxAccount, BSTR, VARIANT_BOOL);
    HRESULT OnOutgoingMessageAdded(IFaxAccount, BSTR);
    HRESULT OnOutgoingMessageRemoved(IFaxAccount, BSTR);
    HRESULT OnServerShutDown(IFaxServer2);
}
enum CLSID_FaxServer = GUID(0xcda8acb0, 0x8cf5, 0x4f6c, [0x9b, 0xa2, 0x59, 0x31, 0xd4, 0xc, 0x8c, 0xae]);
struct FaxServer
{
}
enum CLSID_FaxDeviceProviders = GUID(0xeb8fe768, 0x875a, 0x4f5f, [0x82, 0xc5, 0x3, 0xf2, 0x3a, 0xac, 0x1b, 0xd7]);
struct FaxDeviceProviders
{
}
enum CLSID_FaxDevices = GUID(0x5589e28e, 0x23cb, 0x4919, [0x88, 0x8, 0xe6, 0x10, 0x18, 0x46, 0xe8, 0xd]);
struct FaxDevices
{
}
enum CLSID_FaxInboundRouting = GUID(0xe80248ed, 0xad65, 0x4218, [0x81, 0x8, 0x99, 0x19, 0x24, 0xd4, 0xe7, 0xed]);
struct FaxInboundRouting
{
}
enum CLSID_FaxFolders = GUID(0xc35211d7, 0x5776, 0x48cb, [0xaf, 0x44, 0xc3, 0x1b, 0xe3, 0xb2, 0xcf, 0xe5]);
struct FaxFolders
{
}
enum CLSID_FaxLoggingOptions = GUID(0x1bf9eea6, 0xece0, 0x4785, [0xa1, 0x8b, 0xde, 0x56, 0xe9, 0xee, 0xf9, 0x6a]);
struct FaxLoggingOptions
{
}
enum CLSID_FaxActivity = GUID(0xcfef5d0e, 0xe84d, 0x462e, [0xaa, 0xbb, 0x87, 0xd3, 0x1e, 0xb0, 0x4f, 0xef]);
struct FaxActivity
{
}
enum CLSID_FaxOutboundRouting = GUID(0xc81b385e, 0xb869, 0x4afd, [0x86, 0xc0, 0x61, 0x64, 0x98, 0xed, 0x9b, 0xe2]);
struct FaxOutboundRouting
{
}
enum CLSID_FaxReceiptOptions = GUID(0x6982487b, 0x227b, 0x4c96, [0xa6, 0x1c, 0x24, 0x83, 0x48, 0xb0, 0x5a, 0xb6]);
struct FaxReceiptOptions
{
}
enum CLSID_FaxSecurity = GUID(0x10c4ddde, 0xabf0, 0x43df, [0x96, 0x4f, 0x7f, 0x3a, 0xc2, 0x1a, 0x4c, 0x7b]);
struct FaxSecurity
{
}
enum CLSID_FaxDocument = GUID(0xf3f9f91, 0xc838, 0x415e, [0xa4, 0xf3, 0x3e, 0x82, 0x8c, 0xa4, 0x45, 0xe0]);
struct FaxDocument
{
}
enum CLSID_FaxSender = GUID(0x265d84d0, 0x1850, 0x4360, [0xb7, 0xc8, 0x75, 0x8b, 0xbb, 0x5f, 0xb, 0x96]);
struct FaxSender
{
}
enum CLSID_FaxRecipients = GUID(0xea9bdf53, 0x10a9, 0x4d4f, [0xa0, 0x67, 0x63, 0xc8, 0xf8, 0x4f, 0x1, 0xb0]);
struct FaxRecipients
{
}
enum CLSID_FaxIncomingArchive = GUID(0x8426c56a, 0x35a1, 0x4c6f, [0xaf, 0x93, 0xfc, 0x95, 0x24, 0x22, 0xe2, 0xc2]);
struct FaxIncomingArchive
{
}
enum CLSID_FaxIncomingQueue = GUID(0x69131717, 0xf3f1, 0x40e3, [0x80, 0x9d, 0xa6, 0xcb, 0xf7, 0xbd, 0x85, 0xe5]);
struct FaxIncomingQueue
{
}
enum CLSID_FaxOutgoingArchive = GUID(0x43c28403, 0xe04f, 0x474d, [0x99, 0xc, 0xb9, 0x46, 0x69, 0x14, 0x8f, 0x59]);
struct FaxOutgoingArchive
{
}
enum CLSID_FaxOutgoingQueue = GUID(0x7421169e, 0x8c43, 0x4b0d, [0xbb, 0x16, 0x64, 0x5c, 0x8f, 0xa4, 0x3, 0x57]);
struct FaxOutgoingQueue
{
}
enum CLSID_FaxIncomingMessageIterator = GUID(0x6088e1d8, 0x3fc8, 0x45c2, [0x87, 0xb1, 0x90, 0x9a, 0x29, 0x60, 0x7e, 0xa9]);
struct FaxIncomingMessageIterator
{
}
enum CLSID_FaxIncomingMessage = GUID(0x1932fcf7, 0x9d43, 0x4d5a, [0x89, 0xff, 0x3, 0x86, 0x1b, 0x32, 0x17, 0x36]);
struct FaxIncomingMessage
{
}
enum CLSID_FaxOutgoingJobs = GUID(0x92bf2a6c, 0x37be, 0x43fa, [0xa3, 0x7d, 0xcb, 0xe, 0x5f, 0x75, 0x3b, 0x35]);
struct FaxOutgoingJobs
{
}
enum CLSID_FaxOutgoingJob = GUID(0x71bb429c, 0xef9, 0x4915, [0xbe, 0xc5, 0xa5, 0xd8, 0x97, 0xa3, 0xe9, 0x24]);
struct FaxOutgoingJob
{
}
enum CLSID_FaxOutgoingMessageIterator = GUID(0x8a3224d0, 0xd30b, 0x49de, [0x98, 0x13, 0xcb, 0x38, 0x57, 0x90, 0xfb, 0xbb]);
struct FaxOutgoingMessageIterator
{
}
enum CLSID_FaxOutgoingMessage = GUID(0x91b4a378, 0x4ad8, 0x4aef, [0xa4, 0xdc, 0x97, 0xd9, 0x6e, 0x93, 0x9a, 0x3a]);
struct FaxOutgoingMessage
{
}
enum CLSID_FaxIncomingJobs = GUID(0xa1bb8a43, 0x8866, 0x4fb7, [0xa1, 0x5d, 0x62, 0x66, 0xc8, 0x75, 0xa5, 0xcc]);
struct FaxIncomingJobs
{
}
enum CLSID_FaxIncomingJob = GUID(0xc47311ec, 0xae32, 0x41b8, [0xae, 0x4b, 0x3e, 0xae, 0x6, 0x29, 0xd0, 0xc9]);
struct FaxIncomingJob
{
}
enum CLSID_FaxDeviceProvider = GUID(0x17cf1aa3, 0xf5eb, 0x484a, [0x9c, 0x9a, 0x44, 0x40, 0xa5, 0xba, 0xab, 0xfc]);
struct FaxDeviceProvider
{
}
enum CLSID_FaxDevice = GUID(0x59e3a5b2, 0xd676, 0x484b, [0xa6, 0xde, 0x72, 0xb, 0xfa, 0x89, 0xb5, 0xaf]);
struct FaxDevice
{
}
enum CLSID_FaxActivityLogging = GUID(0xf0a0294e, 0x3bbd, 0x48b8, [0x8f, 0x13, 0x8c, 0x59, 0x1a, 0x55, 0xbd, 0xbc]);
struct FaxActivityLogging
{
}
enum CLSID_FaxEventLogging = GUID(0xa6850930, 0xa0f6, 0x4a6f, [0x95, 0xb7, 0xdb, 0x2e, 0xbf, 0x3d, 0x2, 0xe3]);
struct FaxEventLogging
{
}
enum CLSID_FaxOutboundRoutingGroups = GUID(0xccbea1a5, 0xe2b4, 0x4b57, [0x94, 0x21, 0xb0, 0x4b, 0x62, 0x89, 0x46, 0x4b]);
struct FaxOutboundRoutingGroups
{
}
enum CLSID_FaxOutboundRoutingGroup = GUID(0x213f3e0, 0x6791, 0x4d77, [0xa2, 0x71, 0x4, 0xd2, 0x35, 0x7c, 0x50, 0xd6]);
struct FaxOutboundRoutingGroup
{
}
enum CLSID_FaxDeviceIds = GUID(0xcdc539ea, 0x7277, 0x460e, [0x8d, 0xe0, 0x48, 0xa0, 0xa5, 0x76, 0xd, 0x1f]);
struct FaxDeviceIds
{
}
enum CLSID_FaxOutboundRoutingRules = GUID(0xd385beca, 0xe624, 0x4473, [0xbf, 0xaa, 0x9f, 0x40, 0x0, 0x83, 0x1f, 0x54]);
struct FaxOutboundRoutingRules
{
}
enum CLSID_FaxOutboundRoutingRule = GUID(0x6549eebf, 0x8d1, 0x475a, [0x82, 0x8b, 0x3b, 0xf1, 0x5, 0x95, 0x2f, 0xa0]);
struct FaxOutboundRoutingRule
{
}
enum CLSID_FaxInboundRoutingExtensions = GUID(0x189a48ed, 0x623c, 0x4c0d, [0x80, 0xf2, 0xd6, 0x6c, 0x7b, 0x9e, 0xfe, 0xc2]);
struct FaxInboundRoutingExtensions
{
}
enum CLSID_FaxInboundRoutingExtension = GUID(0x1d7dfb51, 0x7207, 0x4436, [0xa0, 0xd9, 0x24, 0xe3, 0x2e, 0xe5, 0x69, 0x88]);
struct FaxInboundRoutingExtension
{
}
enum CLSID_FaxInboundRoutingMethods = GUID(0x25fcb76a, 0xb750, 0x4b82, [0x92, 0x66, 0xfb, 0xbb, 0xae, 0x89, 0x22, 0xba]);
struct FaxInboundRoutingMethods
{
}
enum CLSID_FaxInboundRoutingMethod = GUID(0x4b9fd75c, 0x194, 0x4b72, [0x9c, 0xe5, 0x2, 0xa8, 0x20, 0x5a, 0xc7, 0xd4]);
struct FaxInboundRoutingMethod
{
}
enum CLSID_FaxJobStatus = GUID(0x7bf222f4, 0xbe8d, 0x442f, [0x84, 0x1d, 0x61, 0x32, 0x74, 0x24, 0x23, 0xbb]);
struct FaxJobStatus
{
}
enum CLSID_FaxRecipient = GUID(0x60bf3301, 0x7df8, 0x4bd8, [0x91, 0x48, 0x7b, 0x58, 0x1, 0xf9, 0xef, 0xdf]);
struct FaxRecipient
{
}
enum CLSID_FaxConfiguration = GUID(0x5857326f, 0xe7b3, 0x41a7, [0x9c, 0x19, 0xa9, 0x1b, 0x46, 0x3e, 0x2d, 0x56]);
struct FaxConfiguration
{
}
enum CLSID_FaxAccountSet = GUID(0xfbc23c4b, 0x79e0, 0x4291, [0xbc, 0x56, 0xc1, 0x2e, 0x25, 0x3b, 0xbf, 0x3a]);
struct FaxAccountSet
{
}
enum CLSID_FaxAccounts = GUID(0xda1f94aa, 0xee2c, 0x47c0, [0x8f, 0x4f, 0x2a, 0x21, 0x70, 0x75, 0xb7, 0x6e]);
struct FaxAccounts
{
}
enum CLSID_FaxAccount = GUID(0xa7e0647f, 0x4524, 0x4464, [0xa5, 0x6d, 0xb9, 0xfe, 0x66, 0x6f, 0x71, 0x5e]);
struct FaxAccount
{
}
enum CLSID_FaxAccountFolders = GUID(0x85398f49, 0xc034, 0x4a3f, [0x82, 0x1c, 0xdb, 0x7d, 0x68, 0x5e, 0x81, 0x29]);
struct FaxAccountFolders
{
}
enum CLSID_FaxAccountIncomingQueue = GUID(0x9bcf6094, 0xb4da, 0x45f4, [0xb8, 0xd6, 0xdd, 0xeb, 0x21, 0x86, 0x65, 0x2c]);
struct FaxAccountIncomingQueue
{
}
enum CLSID_FaxAccountOutgoingQueue = GUID(0xfeeceefb, 0xc149, 0x48ba, [0xba, 0xb8, 0xb7, 0x91, 0xe1, 0x1, 0xf6, 0x2f]);
struct FaxAccountOutgoingQueue
{
}
enum CLSID_FaxAccountIncomingArchive = GUID(0x14b33db5, 0x4c40, 0x4ecf, [0x9e, 0xf8, 0xa3, 0x60, 0xcb, 0xe8, 0x9, 0xed]);
struct FaxAccountIncomingArchive
{
}
enum CLSID_FaxAccountOutgoingArchive = GUID(0x851e7af5, 0x433a, 0x4739, [0xa2, 0xdf, 0xad, 0x24, 0x5c, 0x2c, 0xb9, 0x8e]);
struct FaxAccountOutgoingArchive
{
}
enum CLSID_FaxSecurity2 = GUID(0x735c1248, 0xec89, 0x4c30, [0xa1, 0x27, 0x65, 0x6e, 0x92, 0xe3, 0xc4, 0xea]);
struct FaxSecurity2
{
}
alias PFAXROUTEADDFILE = int function(uint, const(wchar)*, GUID*);
alias PFAXROUTEDELETEFILE = int function(uint, const(wchar)*);
alias PFAXROUTEGETFILE = BOOL function(uint, uint, PWSTR, uint*);
alias PFAXROUTEENUMFILE = BOOL function(uint, GUID*, GUID*, const(wchar)*, void*);
alias PFAXROUTEENUMFILES = BOOL function(uint, GUID*, PFAXROUTEENUMFILE, void*);
alias PFAXROUTEMODIFYROUTINGDATA = BOOL function(uint, const(wchar)*, ubyte*, uint);
struct FAX_ROUTE_CALLBACKROUTINES
{
    uint SizeOfStruct;
    PFAXROUTEADDFILE FaxRouteAddFile;
    PFAXROUTEDELETEFILE FaxRouteDeleteFile;
    PFAXROUTEGETFILE FaxRouteGetFile;
    PFAXROUTEENUMFILES FaxRouteEnumFiles;
    PFAXROUTEMODIFYROUTINGDATA FaxRouteModifyRoutingData;
}
struct FAX_ROUTE
{
    uint SizeOfStruct;
    uint JobId;
    ulong ElapsedTime;
    ulong ReceiveTime;
    uint PageCount;
    const(wchar)* Csid;
    const(wchar)* Tsid;
    const(wchar)* CallerId;
    const(wchar)* RoutingInfo;
    const(wchar)* ReceiverName;
    const(wchar)* ReceiverNumber;
    const(wchar)* DeviceName;
    uint DeviceId;
    ubyte* RoutingInfoData;
    uint RoutingInfoDataSize;
}
alias FAXROUTE_ENABLE = int;
enum : int
{
    QUERY_STATUS   = 0xffffffff,
    STATUS_DISABLE = 0x00000000,
    STATUS_ENABLE  = 0x00000001,
}

alias PFAXROUTEINITIALIZE = BOOL function(HANDLE, FAX_ROUTE_CALLBACKROUTINES*);
alias PFAXROUTEMETHOD = BOOL function(const(FAX_ROUTE)*, void**, uint*);
alias PFAXROUTEDEVICEENABLE = BOOL function(const(wchar)*, uint, int);
alias PFAXROUTEDEVICECHANGENOTIFICATION = BOOL function(uint, BOOL);
alias PFAXROUTEGETROUTINGINFO = BOOL function(const(wchar)*, uint, ubyte*, uint*);
alias PFAXROUTESETROUTINGINFO = BOOL function(const(wchar)*, uint, const(ubyte)*, uint);
alias FAX_ENUM_DEVICE_ID_SOURCE = int;
enum : int
{
    DEV_ID_SRC_FAX  = 0x00000000,
    DEV_ID_SRC_TAPI = 0x00000001,
}

alias PFAX_EXT_GET_DATA = uint function(uint, FAX_ENUM_DEVICE_ID_SOURCE, const(wchar)*, ubyte**, uint*);
alias PFAX_EXT_SET_DATA = uint function(HINSTANCE, uint, FAX_ENUM_DEVICE_ID_SOURCE, const(wchar)*, ubyte*, uint);
alias PFAX_EXT_CONFIG_CHANGE = HRESULT function(uint, const(wchar)*, ubyte*, uint);
alias PFAX_EXT_REGISTER_FOR_EVENTS = HANDLE function(HINSTANCE, uint, FAX_ENUM_DEVICE_ID_SOURCE, const(wchar)*, PFAX_EXT_CONFIG_CHANGE);
alias PFAX_EXT_UNREGISTER_FOR_EVENTS = uint function(HANDLE);
alias PFAX_EXT_FREE_BUFFER = void function(void*);
alias PFAX_EXT_INITIALIZE_CONFIG = HRESULT function(PFAX_EXT_GET_DATA, PFAX_EXT_SET_DATA, PFAX_EXT_REGISTER_FOR_EVENTS, PFAX_EXT_UNREGISTER_FOR_EVENTS, PFAX_EXT_FREE_BUFFER);
alias SendToMode = int;
enum : int
{
    SEND_TO_FAX_RECIPIENT_ATTACHMENT = 0x00000000,
}

alias STI_DEVICE_MJ_TYPE = int;
enum : int
{
    StiDeviceTypeDefault        = 0x00000000,
    StiDeviceTypeScanner        = 0x00000001,
    StiDeviceTypeDigitalCamera  = 0x00000002,
    StiDeviceTypeStreamingVideo = 0x00000003,
}

struct STI_DEV_CAPS
{
    uint dwGeneric;
}
struct STI_DEVICE_INFORMATIONW
{
    uint dwSize;
    uint DeviceType;
    wchar[128] szDeviceInternalName;
    STI_DEV_CAPS DeviceCapabilitiesA;
    uint dwHardwareConfiguration;
    PWSTR pszVendorDescription;
    PWSTR pszDeviceDescription;
    PWSTR pszPortName;
    PWSTR pszPropProvider;
    PWSTR pszLocalName;
}
struct STI_WIA_DEVICE_INFORMATIONW
{
    uint dwSize;
    uint DeviceType;
    wchar[128] szDeviceInternalName;
    STI_DEV_CAPS DeviceCapabilitiesA;
    uint dwHardwareConfiguration;
    PWSTR pszVendorDescription;
    PWSTR pszDeviceDescription;
    PWSTR pszPortName;
    PWSTR pszPropProvider;
    PWSTR pszLocalName;
    PWSTR pszUiDll;
    PWSTR pszServer;
}
struct STI_DEVICE_STATUS
{
    uint dwSize;
    uint StatusMask;
    uint dwOnlineState;
    uint dwHardwareStatusCode;
    uint dwEventHandlingState;
    uint dwPollingInterval;
}
struct _ERROR_INFOW
{
    uint dwSize;
    uint dwGenericError;
    uint dwVendorError;
    wchar[255] szExtendedErrorText;
}
struct STI_DIAG
{
    uint dwSize;
    uint dwBasicDiagCode;
    uint dwVendorDiagCode;
    uint dwStatusMask;
    _ERROR_INFOW sErrorInfo;
}
struct STISUBSCRIBE
{
    uint dwSize;
    uint dwFlags;
    uint dwFilter;
    HWND hWndNotify;
    HANDLE hEvent;
    uint uiNotificationMessage;
}
struct STINOTIFY
{
    uint dwSize;
    GUID guidNotificationCode;
    ubyte[64] abNotificationData;
}
enum IID_IStillImageW = GUID(0x641bd880, 0x2dc8, 0x11d0, [0x90, 0xea, 0x0, 0xaa, 0x0, 0x60, 0xf8, 0x6c]);
interface IStillImageW : IUnknown
{
    HRESULT Initialize(HINSTANCE, uint);
    HRESULT GetDeviceList(uint, uint, uint*, void**);
    HRESULT GetDeviceInfo(PWSTR, void**);
    HRESULT CreateDevice(PWSTR, uint, IStiDevice*, IUnknown);
    HRESULT GetDeviceValue(PWSTR, PWSTR, uint*, ubyte*, uint*);
    HRESULT SetDeviceValue(PWSTR, PWSTR, uint, ubyte*, uint);
    HRESULT GetSTILaunchInformation(PWSTR, uint*, PWSTR);
    HRESULT RegisterLaunchApplication(PWSTR, PWSTR);
    HRESULT UnregisterLaunchApplication(PWSTR);
    HRESULT EnableHwNotifications(const(wchar)*, BOOL);
    HRESULT GetHwNotificationState(const(wchar)*, BOOL*);
    HRESULT RefreshDeviceBus(const(wchar)*);
    HRESULT LaunchApplicationForDevice(PWSTR, PWSTR, STINOTIFY*);
    HRESULT SetupDeviceParameters(STI_DEVICE_INFORMATIONW*);
    HRESULT WriteToErrorLog(uint, const(wchar)*);
}
enum IID_IStiDevice = GUID(0x6cfa5a80, 0x2dc8, 0x11d0, [0x90, 0xea, 0x0, 0xaa, 0x0, 0x60, 0xf8, 0x6c]);
interface IStiDevice : IUnknown
{
    HRESULT Initialize(HINSTANCE, const(wchar)*, uint, uint);
    HRESULT GetCapabilities(STI_DEV_CAPS*);
    HRESULT GetStatus(STI_DEVICE_STATUS*);
    HRESULT DeviceReset();
    HRESULT Diagnostic(STI_DIAG*);
    HRESULT Escape(uint, void*, uint, void*, uint, uint*);
    HRESULT GetLastError(uint*);
    HRESULT LockDevice(uint);
    HRESULT UnLockDevice();
    HRESULT RawReadData(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteData(void*, uint, OVERLAPPED*);
    HRESULT RawReadCommand(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteCommand(void*, uint, OVERLAPPED*);
    HRESULT Subscribe(STISUBSCRIBE*);
    HRESULT GetLastNotificationData(STINOTIFY*);
    HRESULT UnSubscribe();
    HRESULT GetLastErrorInfo(_ERROR_INFOW*);
}
struct STI_USD_CAPS
{
    uint dwVersion;
    uint dwGenericCaps;
}
enum IID_IStiDeviceControl = GUID(0x128a9860, 0x52dc, 0x11d0, [0x9e, 0xdf, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IStiDeviceControl : IUnknown
{
    HRESULT Initialize(uint, uint, const(wchar)*, uint);
    HRESULT RawReadData(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteData(void*, uint, OVERLAPPED*);
    HRESULT RawReadCommand(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteCommand(void*, uint, OVERLAPPED*);
    HRESULT RawDeviceControl(uint, void*, uint, void*, uint, uint*);
    HRESULT GetLastError(uint*);
    HRESULT GetMyDevicePortName(PWSTR, uint);
    HRESULT GetMyDeviceHandle(HANDLE*);
    HRESULT GetMyDeviceOpenMode(uint*);
    HRESULT WriteToErrorLog(uint, const(wchar)*, uint);
}
enum IID_IStiUSD = GUID(0xc9bb460, 0x51ac, 0x11d0, [0x90, 0xea, 0x0, 0xaa, 0x0, 0x60, 0xf8, 0x6c]);
interface IStiUSD : IUnknown
{
    HRESULT Initialize(IStiDeviceControl, uint, HKEY);
    HRESULT GetCapabilities(STI_USD_CAPS*);
    HRESULT GetStatus(STI_DEVICE_STATUS*);
    HRESULT DeviceReset();
    HRESULT Diagnostic(STI_DIAG*);
    HRESULT Escape(uint, void*, uint, void*, uint, uint*);
    HRESULT GetLastError(uint*);
    HRESULT LockDevice();
    HRESULT UnLockDevice();
    HRESULT RawReadData(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteData(void*, uint, OVERLAPPED*);
    HRESULT RawReadCommand(void*, uint*, OVERLAPPED*);
    HRESULT RawWriteCommand(void*, uint, OVERLAPPED*);
    HRESULT SetNotificationHandle(HANDLE);
    HRESULT GetNotificationData(STINOTIFY*);
    HRESULT GetLastErrorInfo(_ERROR_INFOW*);
}
