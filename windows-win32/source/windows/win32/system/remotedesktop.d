module windows.win32.system.remotedesktop;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, FILETIME, HANDLE, HANDLE_PTR, HRESULT, HWND, PSID, PSTR, PWSTR, RECT, VARIANT_BOOL;
import windows.win32.media.audio : WAVEFORMATEX;
import windows.win32.media.audio.apo : APO_CONNECTION_PROPERTY;
import windows.win32.security : PSECURITY_DESCRIPTOR;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.com.structuredstorage : IPropertyBag;
import windows.win32.system.variant : VARIANT;
import windows.win32.system.winrt : HSTRING;
import windows.win32.ui.windowsandmessaging : MESSAGEBOX_RESULT, MESSAGEBOX_STYLE;

version (Windows):
extern (Windows):

BOOL WTSStopRemoteControlSession(uint);
BOOL WTSStartRemoteControlSessionW(PWSTR, uint, ubyte, ushort);
BOOL WTSStartRemoteControlSessionA(PSTR, uint, ubyte, ushort);
BOOL WTSConnectSessionA(uint, uint, PSTR, BOOL);
BOOL WTSConnectSessionW(uint, uint, PWSTR, BOOL);
BOOL WTSEnumerateServersW(PWSTR, uint, uint, WTS_SERVER_INFOW**, uint*);
BOOL WTSEnumerateServersA(PSTR, uint, uint, WTS_SERVER_INFOA**, uint*);
HANDLE WTSOpenServerW(PWSTR);
HANDLE WTSOpenServerA(PSTR);
HANDLE WTSOpenServerExW(PWSTR);
HANDLE WTSOpenServerExA(PSTR);
void WTSCloseServer(HANDLE);
BOOL WTSEnumerateSessionsW(HANDLE, uint, uint, WTS_SESSION_INFOW**, uint*);
BOOL WTSEnumerateSessionsA(HANDLE, uint, uint, WTS_SESSION_INFOA**, uint*);
BOOL WTSEnumerateSessionsExW(HANDLE, uint*, uint, WTS_SESSION_INFO_1W**, uint*);
BOOL WTSEnumerateSessionsExA(HANDLE, uint*, uint, WTS_SESSION_INFO_1A**, uint*);
BOOL WTSEnumerateProcessesW(HANDLE, uint, uint, WTS_PROCESS_INFOW**, uint*);
BOOL WTSEnumerateProcessesA(HANDLE, uint, uint, WTS_PROCESS_INFOA**, uint*);
BOOL WTSTerminateProcess(HANDLE, uint, uint);
BOOL WTSQuerySessionInformationW(HANDLE, uint, WTS_INFO_CLASS, PWSTR*, uint*);
BOOL WTSQuerySessionInformationA(HANDLE, uint, WTS_INFO_CLASS, PSTR*, uint*);
BOOL WTSQueryUserConfigW(PWSTR, PWSTR, WTS_CONFIG_CLASS, PWSTR*, uint*);
BOOL WTSQueryUserConfigA(PSTR, PSTR, WTS_CONFIG_CLASS, PSTR*, uint*);
BOOL WTSSetUserConfigW(PWSTR, PWSTR, WTS_CONFIG_CLASS, PWSTR, uint);
BOOL WTSSetUserConfigA(PSTR, PSTR, WTS_CONFIG_CLASS, PSTR, uint);
BOOL WTSSendMessageW(HANDLE, uint, PWSTR, uint, PWSTR, uint, MESSAGEBOX_STYLE, uint, MESSAGEBOX_RESULT*, BOOL);
BOOL WTSSendMessageA(HANDLE, uint, PSTR, uint, PSTR, uint, MESSAGEBOX_STYLE, uint, MESSAGEBOX_RESULT*, BOOL);
BOOL WTSDisconnectSession(HANDLE, uint, BOOL);
BOOL WTSLogoffSession(HANDLE, uint, BOOL);
BOOL WTSShutdownSystem(HANDLE, uint);
BOOL WTSWaitSystemEvent(HANDLE, uint, uint*);
HANDLE WTSVirtualChannelOpen(HANDLE, uint, PSTR);
HANDLE WTSVirtualChannelOpenEx(uint, PSTR, uint);
BOOL WTSVirtualChannelClose(HANDLE);
BOOL WTSVirtualChannelRead(HANDLE, uint, PSTR, uint, uint*);
BOOL WTSVirtualChannelWrite(HANDLE, PSTR, uint, uint*);
BOOL WTSVirtualChannelPurgeInput(HANDLE);
BOOL WTSVirtualChannelPurgeOutput(HANDLE);
BOOL WTSVirtualChannelQuery(HANDLE, WTS_VIRTUAL_CLASS, void**, uint*);
void WTSFreeMemory(void*);
BOOL WTSRegisterSessionNotification(HWND, uint);
BOOL WTSUnRegisterSessionNotification(HWND);
BOOL WTSRegisterSessionNotificationEx(HANDLE, HWND, uint);
BOOL WTSUnRegisterSessionNotificationEx(HANDLE, HWND);
BOOL WTSQueryUserToken(uint, HANDLE*);
BOOL WTSFreeMemoryExW(WTS_TYPE_CLASS, void*, uint);
BOOL WTSFreeMemoryExA(WTS_TYPE_CLASS, void*, uint);
BOOL WTSEnumerateProcessesExW(HANDLE, uint*, uint, PWSTR*, uint*);
BOOL WTSEnumerateProcessesExA(HANDLE, uint*, uint, PSTR*, uint*);
BOOL WTSEnumerateListenersW(HANDLE, void*, uint, ushort**, uint*);
BOOL WTSEnumerateListenersA(HANDLE, void*, uint, byte**, uint*);
BOOL WTSQueryListenerConfigW(HANDLE, void*, uint, PWSTR, WTSLISTENERCONFIGW*);
BOOL WTSQueryListenerConfigA(HANDLE, void*, uint, PSTR, WTSLISTENERCONFIGA*);
BOOL WTSCreateListenerW(HANDLE, void*, uint, PWSTR, WTSLISTENERCONFIGW*, uint);
BOOL WTSCreateListenerA(HANDLE, void*, uint, PSTR, WTSLISTENERCONFIGA*, uint);
BOOL WTSSetListenerSecurityW(HANDLE, void*, uint, PWSTR, uint, PSECURITY_DESCRIPTOR);
BOOL WTSSetListenerSecurityA(HANDLE, void*, uint, PSTR, uint, PSECURITY_DESCRIPTOR);
BOOL WTSGetListenerSecurityW(HANDLE, void*, uint, PWSTR, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL WTSGetListenerSecurityA(HANDLE, void*, uint, PSTR, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL WTSEnableChildSessions(BOOL);
BOOL WTSIsChildSessionsEnabled(BOOL*);
BOOL WTSGetChildSessionId(uint*);
HRESULT WTSSetRenderHint(ulong*, HWND, uint, uint, ubyte*);
BOOL ProcessIdToSessionId(uint, uint*);
uint WTSGetActiveConsoleSessionId();
enum WTS_CURRENT_SERVER = 0x00000000;
enum WTS_CURRENT_SERVER_HANDLE = 0x00000000;
enum WTS_CURRENT_SERVER_NAME = "";
enum WTS_DOMAIN_LENGTH = 0x000000ff;
enum WTS_USERNAME_LENGTH = 0x000000ff;
enum WTS_PASSWORD_LENGTH = 0x000000ff;
enum WTS_DIRECTORY_LENGTH = 0x00000100;
enum WTS_INITIALPROGRAM_LENGTH = 0x00000100;
enum WTS_PROTOCOL_NAME_LENGTH = 0x00000008;
enum WTS_DRIVER_NAME_LENGTH = 0x00000008;
enum WTS_DEVICE_NAME_LENGTH = 0x00000013;
enum WTS_IMEFILENAME_LENGTH = 0x00000020;
enum WTS_CLIENTNAME_LENGTH = 0x00000014;
enum WTS_CLIENTADDRESS_LENGTH = 0x0000001e;
enum WTS_CLIENT_PRODUCT_ID_LENGTH = 0x00000020;
enum WTS_MAX_PROTOCOL_CACHE = 0x00000004;
enum WTS_MAX_CACHE_RESERVED = 0x00000014;
enum WTS_MAX_RESERVED = 0x00000064;
enum WTS_MAX_COUNTERS = 0x00000064;
enum WTS_MAX_DISPLAY_IOCTL_DATA = 0x00000100;
enum WTS_PERF_DISABLE_NOTHING = 0x00000000;
enum WTS_PERF_DISABLE_WALLPAPER = 0x00000001;
enum WTS_PERF_DISABLE_FULLWINDOWDRAG = 0x00000002;
enum WTS_PERF_DISABLE_MENUANIMATIONS = 0x00000004;
enum WTS_PERF_DISABLE_THEMING = 0x00000008;
enum WTS_PERF_ENABLE_ENHANCED_GRAPHICS = 0x00000010;
enum WTS_PERF_DISABLE_CURSOR_SHADOW = 0x00000020;
enum WTS_PERF_DISABLE_CURSORSETTINGS = 0x00000040;
enum WTS_PERF_ENABLE_FONT_SMOOTHING = 0x00000080;
enum WTS_PERF_ENABLE_DESKTOP_COMPOSITION = 0x00000100;
enum WTS_VALUE_TYPE_ULONG = 0x00000001;
enum WTS_VALUE_TYPE_STRING = 0x00000002;
enum WTS_VALUE_TYPE_BINARY = 0x00000003;
enum WTS_VALUE_TYPE_GUID = 0x00000004;
enum WTS_KEY_EXCHANGE_ALG_RSA = 0x00000001;
enum WTS_KEY_EXCHANGE_ALG_DH = 0x00000002;
enum WTS_LICENSE_PROTOCOL_VERSION = 0x00010000;
enum WTS_LICENSE_PREAMBLE_VERSION = 0x00000003;
enum WRDS_DOMAIN_LENGTH = 0x000000ff;
enum WRDS_USERNAME_LENGTH = 0x000000ff;
enum WRDS_PASSWORD_LENGTH = 0x000000ff;
enum WRDS_DIRECTORY_LENGTH = 0x00000100;
enum WRDS_INITIALPROGRAM_LENGTH = 0x00000100;
enum WRDS_PROTOCOL_NAME_LENGTH = 0x00000008;
enum WRDS_DRIVER_NAME_LENGTH = 0x00000008;
enum WRDS_DEVICE_NAME_LENGTH = 0x00000013;
enum WRDS_IMEFILENAME_LENGTH = 0x00000020;
enum WRDS_CLIENTNAME_LENGTH = 0x00000014;
enum WRDS_CLIENTADDRESS_LENGTH = 0x0000001e;
enum WRDS_CLIENT_PRODUCT_ID_LENGTH = 0x00000020;
enum WRDS_MAX_PROTOCOL_CACHE = 0x00000004;
enum WRDS_MAX_CACHE_RESERVED = 0x00000014;
enum WRDS_MAX_RESERVED = 0x00000064;
enum WRDS_MAX_COUNTERS = 0x00000064;
enum WRDS_MAX_DISPLAY_IOCTL_DATA = 0x00000100;
enum WRDS_PERF_DISABLE_NOTHING = 0x00000000;
enum WRDS_PERF_DISABLE_WALLPAPER = 0x00000001;
enum WRDS_PERF_DISABLE_FULLWINDOWDRAG = 0x00000002;
enum WRDS_PERF_DISABLE_MENUANIMATIONS = 0x00000004;
enum WRDS_PERF_DISABLE_THEMING = 0x00000008;
enum WRDS_PERF_ENABLE_ENHANCED_GRAPHICS = 0x00000010;
enum WRDS_PERF_DISABLE_CURSOR_SHADOW = 0x00000020;
enum WRDS_PERF_DISABLE_CURSORSETTINGS = 0x00000040;
enum WRDS_PERF_ENABLE_FONT_SMOOTHING = 0x00000080;
enum WRDS_PERF_ENABLE_DESKTOP_COMPOSITION = 0x00000100;
enum WRDS_VALUE_TYPE_ULONG = 0x00000001;
enum WRDS_VALUE_TYPE_STRING = 0x00000002;
enum WRDS_VALUE_TYPE_BINARY = 0x00000003;
enum WRDS_VALUE_TYPE_GUID = 0x00000004;
enum WRDS_KEY_EXCHANGE_ALG_RSA = 0x00000001;
enum WRDS_KEY_EXCHANGE_ALG_DH = 0x00000002;
enum WRDS_LICENSE_PROTOCOL_VERSION = 0x00010000;
enum WRDS_LICENSE_PREAMBLE_VERSION = 0x00000003;
enum SINGLE_SESSION = 0x00000001;
enum FORCE_REJOIN = 0x00000002;
enum FORCE_REJOIN_IN_CLUSTERMODE = 0x00000003;
enum RESERVED_FOR_LEGACY = 0x00000004;
enum KEEP_EXISTING_SESSIONS = 0x00000008;
enum CHANNEL_EVENT_INITIALIZED = 0x00000000;
enum CHANNEL_EVENT_CONNECTED = 0x00000001;
enum CHANNEL_EVENT_V1_CONNECTED = 0x00000002;
enum CHANNEL_EVENT_DISCONNECTED = 0x00000003;
enum CHANNEL_EVENT_TERMINATED = 0x00000004;
enum CHANNEL_EVENT_DATA_RECEIVED = 0x0000000a;
enum CHANNEL_EVENT_WRITE_COMPLETE = 0x0000000b;
enum CHANNEL_EVENT_WRITE_CANCELLED = 0x0000000c;
enum CHANNEL_RC_OK = 0x00000000;
enum CHANNEL_RC_ALREADY_INITIALIZED = 0x00000001;
enum CHANNEL_RC_NOT_INITIALIZED = 0x00000002;
enum CHANNEL_RC_ALREADY_CONNECTED = 0x00000003;
enum CHANNEL_RC_NOT_CONNECTED = 0x00000004;
enum CHANNEL_RC_TOO_MANY_CHANNELS = 0x00000005;
enum CHANNEL_RC_BAD_CHANNEL = 0x00000006;
enum CHANNEL_RC_BAD_CHANNEL_HANDLE = 0x00000007;
enum CHANNEL_RC_NO_BUFFER = 0x00000008;
enum CHANNEL_RC_BAD_INIT_HANDLE = 0x00000009;
enum CHANNEL_RC_NOT_OPEN = 0x0000000a;
enum CHANNEL_RC_BAD_PROC = 0x0000000b;
enum CHANNEL_RC_NO_MEMORY = 0x0000000c;
enum CHANNEL_RC_UNKNOWN_CHANNEL_NAME = 0x0000000d;
enum CHANNEL_RC_ALREADY_OPEN = 0x0000000e;
enum CHANNEL_RC_NOT_IN_VIRTUALCHANNELENTRY = 0x0000000f;
enum CHANNEL_RC_NULL_DATA = 0x00000010;
enum CHANNEL_RC_ZERO_LENGTH = 0x00000011;
enum CHANNEL_RC_INVALID_INSTANCE = 0x00000012;
enum CHANNEL_RC_UNSUPPORTED_VERSION = 0x00000013;
enum CHANNEL_RC_INITIALIZATION_ERROR = 0x00000014;
enum VIRTUAL_CHANNEL_VERSION_WIN2000 = 0x00000001;
enum CHANNEL_CHUNK_LENGTH = 0x00000640;
enum CHANNEL_BUFFER_SIZE = 0x0000ffff;
enum CHANNEL_FLAG_FIRST = 0x00000001;
enum CHANNEL_FLAG_LAST = 0x00000002;
enum CHANNEL_FLAG_MIDDLE = 0x00000000;
enum CHANNEL_FLAG_FAIL = 0x00000100;
enum CHANNEL_OPTION_INITIALIZED = 0x80000000;
enum CHANNEL_OPTION_ENCRYPT_RDP = 0x40000000;
enum CHANNEL_OPTION_ENCRYPT_SC = 0x20000000;
enum CHANNEL_OPTION_ENCRYPT_CS = 0x10000000;
enum CHANNEL_OPTION_PRI_HIGH = 0x08000000;
enum CHANNEL_OPTION_PRI_MED = 0x04000000;
enum CHANNEL_OPTION_PRI_LOW = 0x02000000;
enum CHANNEL_OPTION_COMPRESS_RDP = 0x00800000;
enum CHANNEL_OPTION_COMPRESS = 0x00400000;
enum CHANNEL_OPTION_SHOW_PROTOCOL = 0x00200000;
enum CHANNEL_OPTION_REMOTE_CONTROL_PERSISTENT = 0x00100000;
enum CHANNEL_MAX_COUNT = 0x0000001e;
enum CHANNEL_NAME_LEN = 0x00000007;
enum MAX_POLICY_ATTRIBUTES = 0x00000014;
enum WTS_CURRENT_SESSION = 0xffffffff;
enum USERNAME_LENGTH = 0x00000014;
enum CLIENTNAME_LENGTH = 0x00000014;
enum CLIENTADDRESS_LENGTH = 0x0000001e;
enum WTS_WSD_LOGOFF = 0x00000001;
enum WTS_WSD_SHUTDOWN = 0x00000002;
enum WTS_WSD_REBOOT = 0x00000004;
enum WTS_WSD_POWEROFF = 0x00000008;
enum WTS_WSD_FASTREBOOT = 0x00000010;
enum MAX_ELAPSED_TIME_LENGTH = 0x0000000f;
enum MAX_DATE_TIME_LENGTH = 0x00000038;
enum WINSTATIONNAME_LENGTH = 0x00000020;
enum DOMAIN_LENGTH = 0x00000011;
enum WTS_DRIVE_LENGTH = 0x00000003;
enum WTS_LISTENER_NAME_LENGTH = 0x00000020;
enum WTS_COMMENT_LENGTH = 0x0000003c;
enum WTS_LISTENER_CREATE = 0x00000001;
enum WTS_LISTENER_UPDATE = 0x00000010;
enum WTS_PROTOCOL_TYPE_CONSOLE = 0x00000000;
enum WTS_PROTOCOL_TYPE_ICA = 0x00000001;
enum WTS_PROTOCOL_TYPE_RDP = 0x00000002;
enum WTS_SESSIONSTATE_UNKNOWN = 0xffffffff;
enum WTS_SESSIONSTATE_LOCK = 0x00000000;
enum WTS_SESSIONSTATE_UNLOCK = 0x00000001;
enum PRODUCTINFO_COMPANYNAME_LENGTH = 0x00000100;
enum PRODUCTINFO_PRODUCTID_LENGTH = 0x00000004;
enum VALIDATIONINFORMATION_LICENSE_LENGTH = 0x00004000;
enum VALIDATIONINFORMATION_HARDWAREID_LENGTH = 0x00000014;
enum WTS_EVENT_NONE = 0x00000000;
enum WTS_EVENT_CREATE = 0x00000001;
enum WTS_EVENT_DELETE = 0x00000002;
enum WTS_EVENT_RENAME = 0x00000004;
enum WTS_EVENT_CONNECT = 0x00000008;
enum WTS_EVENT_DISCONNECT = 0x00000010;
enum WTS_EVENT_LOGON = 0x00000020;
enum WTS_EVENT_LOGOFF = 0x00000040;
enum WTS_EVENT_STATECHANGE = 0x00000080;
enum WTS_EVENT_LICENSE = 0x00000100;
enum WTS_EVENT_ALL = 0x7fffffff;
enum WTS_EVENT_FLUSH = 0x80000000;
enum REMOTECONTROL_KBDSHIFT_HOTKEY = 0x00000001;
enum REMOTECONTROL_KBDCTRL_HOTKEY = 0x00000002;
enum REMOTECONTROL_KBDALT_HOTKEY = 0x00000004;
enum WTS_CHANNEL_OPTION_DYNAMIC = 0x00000001;
enum WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW = 0x00000000;
enum WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED = 0x00000002;
enum WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH = 0x00000004;
enum WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL = 0x00000006;
enum WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS = 0x00000008;
enum NOTIFY_FOR_ALL_SESSIONS = 0x00000001;
enum NOTIFY_FOR_THIS_SESSION = 0x00000000;
enum WTS_PROCESS_INFO_LEVEL_0 = 0x00000000;
enum WTS_PROCESS_INFO_LEVEL_1 = 0x00000001;
enum PLUGIN_CAPABILITY_EXTERNAL_REDIRECTION = 0x00000001;
enum MaxFQDN_Len = 0x00000100;
enum MaxNetBiosName_Len = 0x00000010;
enum MaxNumOfExposed_IPs = 0x0000000c;
enum MaxUserName_Len = 0x00000068;
enum MaxDomainName_Len = 0x00000100;
enum MaxFarm_Len = 0x00000100;
enum MaxAppName_Len = 0x00000100;
enum WKS_FLAG_CLEAR_CREDS_ON_LAST_RESOURCE = 0x00000001;
enum WKS_FLAG_PASSWORD_ENCRYPTED = 0x00000002;
enum WKS_FLAG_CREDS_AUTHENTICATED = 0x00000004;
enum SB_SYNCH_CONFLICT_MAX_WRITE_ATTEMPTS = 0x00000064;
enum ACQUIRE_TARGET_LOCK_TIMEOUT = 0x000493e0;
enum RENDER_HINT_CLEAR = 0x00000000;
enum RENDER_HINT_VIDEO = 0x00000001;
enum RENDER_HINT_MAPPEDWINDOW = 0x00000002;
enum WTS_PROPERTY_DEFAULT_CONFIG = "DefaultConfig";
enum TS_VC_LISTENER_STATIC_CHANNEL = 0x00000001;
enum WRdsGraphicsChannels_LossyChannelMaxMessageSize = 0x000003dc;
enum RFX_RDP_MSG_PREFIX = 0x00000000;
enum RFX_GFX_MSG_PREFIX = 0x00000030;
enum RFX_GFX_MSG_PREFIX_MASK = 0x00000030;
enum RFX_GFX_MAX_SUPPORTED_MONITORS = 0x00000010;
enum RFX_CLIENT_ID_LENGTH = 0x00000020;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_CONNECT = 0x000002bd;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_DISCONNECT = 0x000002be;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_RECONNECT = 0x000002bf;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_DELETE_SAVED_CREDENTIALS = 0x000002c0;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_UPDATE_SESSION_DISPLAYSETTINGS = 0x000002c1;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_ATTACH_EVENT = 0x000002c2;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_DETACH_EVENT = 0x000002c3;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_SETTINGS = 0x000002c6;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_ACTIONS = 0x000002c7;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCH_POINTER = 0x000002c8;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_SET_RDPPROPERTY = 0x000002d0;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_RDPPROPERTY = 0x000002d1;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_APPLY_SETTINGS = 0x000002d2;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_RETRIEVE_SETTINGS = 0x000002d3;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_SUSPEND_SCREEN_UPDATES = 0x000002da;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_RESUME_SCREEN_UPDATES = 0x000002db;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_EXECUTE_REMOTE_ACTION = 0x000002dc;
enum DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_SNAPSHOT = 0x000002dd;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_ENABLED = 0x000002e4;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_EVENTSENABLED = 0x000002e5;
enum DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_POINTERSPEED = 0x000002e6;
enum DISPID_AX_CONNECTING = 0x000002ee;
enum DISPID_AX_CONNECTED = 0x000002ef;
enum DISPID_AX_LOGINCOMPLETED = 0x000002f0;
enum DISPID_AX_DISCONNECTED = 0x000002f1;
enum DISPID_AX_STATUSCHANGED = 0x000002f2;
enum DISPID_AX_AUTORECONNECTING = 0x000002f3;
enum DISPID_AX_AUTORECONNECTED = 0x000002f4;
enum DISPID_AX_DIALOGDISPLAYING = 0x000002f5;
enum DISPID_AX_DIALOGDISMISSED = 0x000002f6;
enum DISPID_AX_NETWORKSTATUSCHANGED = 0x000002f7;
enum DISPID_AX_ADMINMESSAGERECEIVED = 0x000002f8;
enum DISPID_AX_KEYCOMBINATIONPRESSED = 0x000002f9;
enum DISPID_AX_REMOTEDESKTOPSIZECHANGED = 0x000002fa;
enum DISPID_AX_TOUCHPOINTERCURSORMOVED = 0x00000320;
enum RDCLIENT_BITMAP_RENDER_SERVICE = GUID(0xe4cc08cb, 0x942e, 0x4b19, [0x85, 0x4, 0xbd, 0x5a, 0x89, 0xa7, 0x47, 0xf5]);
enum WTS_QUERY_ALLOWED_INITIAL_APP = GUID(0xc77d1b30, 0x5be1, 0x4c6b, [0xa0, 0xe1, 0xbd, 0x6d, 0x2e, 0x5c, 0x9f, 0xcc]);
enum WTS_QUERY_LOGON_SCREEN_SIZE = GUID(0x8b8e0fe7, 0x804, 0x4a0e, [0xb2, 0x79, 0x86, 0x60, 0xb1, 0xdf, 0x0, 0x49]);
enum WTS_QUERY_AUDIOENUM_DLL = GUID(0x9bf4fa97, 0xc883, 0x4c2a, [0x80, 0xab, 0x5a, 0x39, 0xc9, 0xaf, 0x0, 0xdb]);
enum WTS_QUERY_MF_FORMAT_SUPPORT = GUID(0x41869ad0, 0x6332, 0x4dc8, [0x95, 0xd5, 0xdb, 0x74, 0x9e, 0x2f, 0x1d, 0x94]);
enum WRDS_SERVICE_ID_GRAPHICS_GUID = GUID(0xd2993f4d, 0x2cf, 0x4280, [0x8c, 0x48, 0x16, 0x24, 0xb4, 0x4f, 0x87, 0x6]);
enum PROPERTY_DYNAMIC_TIME_ZONE_INFORMATION = GUID(0xcdfd28e, 0xd0b9, 0x4c1f, [0xa5, 0xeb, 0x6d, 0x1f, 0x6c, 0x65, 0x35, 0xb9]);
enum PROPERTY_TYPE_GET_FAST_RECONNECT = GUID(0x6212d757, 0x43, 0x4862, [0x99, 0xc3, 0x9f, 0x30, 0x59, 0xac, 0x2a, 0x3b]);
enum PROPERTY_TYPE_GET_FAST_RECONNECT_USER_SID = GUID(0x197c427a, 0x135, 0x4b6d, [0x9c, 0x5e, 0xe6, 0x57, 0x9a, 0xa, 0xb6, 0x25]);
enum PROPERTY_TYPE_ENABLE_UNIVERSAL_APPS_FOR_CUSTOM_SHELL = GUID(0xed2c3fda, 0x338d, 0x4d3f, [0x81, 0xa3, 0xe7, 0x67, 0x31, 0xd, 0x90, 0x8e]);
enum CONNECTION_PROPERTY_IDLE_TIME_WARNING = GUID(0x693f7ff5, 0xc4e, 0x4d17, [0xb8, 0xe0, 0x1f, 0x70, 0x32, 0x5e, 0x5d, 0x58]);
enum CONNECTION_PROPERTY_CURSOR_BLINK_DISABLED = GUID(0x4b150580, 0xfea4, 0x4d3c, [0x9d, 0xe4, 0x74, 0x33, 0xa6, 0x66, 0x18, 0xf7]);
alias WTS_SECURITY_FLAGS = uint;
enum : uint
{
    WTS_SECURITY_CURRENT_GUEST_ACCESS = 0x00000048,
    WTS_SECURITY_USER_ACCESS          = 0x00000149,
    WTS_SECURITY_CURRENT_USER_ACCESS  = 0x0000024e,
    WTS_SECURITY_ALL_ACCESS           = 0x000f03bf,
    WTS_SECURITY_QUERY_INFORMATION    = 0x00000001,
    WTS_SECURITY_SET_INFORMATION      = 0x00000002,
    WTS_SECURITY_RESET                = 0x00000004,
    WTS_SECURITY_VIRTUAL_CHANNELS     = 0x00000008,
    WTS_SECURITY_REMOTE_CONTROL       = 0x00000010,
    WTS_SECURITY_LOGON                = 0x00000020,
    WTS_SECURITY_LOGOFF               = 0x00000040,
    WTS_SECURITY_MESSAGE              = 0x00000080,
    WTS_SECURITY_CONNECT              = 0x00000100,
    WTS_SECURITY_DISCONNECT           = 0x00000200,
    WTS_SECURITY_GUEST_ACCESS         = 0x00000020,
}

alias AE_POSITION_FLAGS = int;
enum : int
{
    POSITION_INVALID       = 0x00000000,
    POSITION_DISCONTINUOUS = 0x00000001,
    POSITION_CONTINUOUS    = 0x00000002,
    POSITION_QPC_ERROR     = 0x00000004,
}

struct AE_CURRENT_POSITION
{
    ulong u64DevicePosition;
    ulong u64StreamPosition;
    ulong u64PaddingFrames;
    long hnsQPCPosition;
    float f32FramesPerSecond;
    AE_POSITION_FLAGS Flag;
}
enum IID_IAudioEndpoint = GUID(0x30a99515, 0x1527, 0x4451, [0xaf, 0x9f, 0x0, 0xc5, 0xf0, 0x23, 0x4d, 0xaf]);
interface IAudioEndpoint : IUnknown
{
    HRESULT GetFrameFormat(WAVEFORMATEX**);
    HRESULT GetFramesPerPacket(uint*);
    HRESULT GetLatency(long*);
    HRESULT SetStreamFlags(uint);
    HRESULT SetEventHandle(HANDLE);
}
enum IID_IAudioEndpointRT = GUID(0xdfd2005f, 0xa6e5, 0x4d39, [0xa2, 0x65, 0x93, 0x9a, 0xda, 0x9f, 0xbb, 0x4d]);
interface IAudioEndpointRT : IUnknown
{
    void GetCurrentPadding(long*, AE_CURRENT_POSITION*);
    void ProcessingComplete();
    HRESULT SetPinInactive();
    HRESULT SetPinActive();
}
enum IID_IAudioInputEndpointRT = GUID(0x8026ab61, 0x92b2, 0x43c1, [0xa1, 0xdf, 0x5c, 0x37, 0xeb, 0xd0, 0x8d, 0x82]);
interface IAudioInputEndpointRT : IUnknown
{
    void GetInputDataPointer(APO_CONNECTION_PROPERTY*, AE_CURRENT_POSITION*);
    void ReleaseInputDataPointer(uint, ulong);
    void PulseEndpoint();
}
enum IID_IAudioOutputEndpointRT = GUID(0x8fa906e4, 0xc31c, 0x4e31, [0x93, 0x2e, 0x19, 0xa6, 0x63, 0x85, 0xe9, 0xaa]);
interface IAudioOutputEndpointRT : IUnknown
{
    ulong GetOutputDataPointer(uint, AE_CURRENT_POSITION*);
    void ReleaseOutputDataPointer(const(APO_CONNECTION_PROPERTY)*);
    void PulseEndpoint();
}
enum IID_IAudioDeviceEndpoint = GUID(0xd4952f5a, 0xa0b2, 0x4cc4, [0x8b, 0x82, 0x93, 0x58, 0x48, 0x8d, 0xd8, 0xac]);
interface IAudioDeviceEndpoint : IUnknown
{
    HRESULT SetBuffer(long, uint);
    HRESULT GetRTCaps(BOOL*);
    HRESULT GetEventDrivenCapable(BOOL*);
    HRESULT WriteExclusiveModeParametersToSharedMemory(ulong, long, long, uint, uint*, ulong*);
}
enum IID_IAudioEndpointControl = GUID(0xc684b72a, 0x6df4, 0x4774, [0xbd, 0xf9, 0x76, 0xb7, 0x75, 0x9, 0xb6, 0x53]);
interface IAudioEndpointControl : IUnknown
{
    HRESULT Start();
    HRESULT Reset();
    HRESULT Stop();
}
enum CLSID_TSUserExInterfaces = GUID(0x910dd01, 0xdf8c, 0x11d1, [0xae, 0x27, 0x0, 0xc0, 0x4f, 0xa3, 0x58, 0x13]);
struct TSUserExInterfaces
{
}
enum IID_IADsTSUserEx = GUID(0xc4930e79, 0x2989, 0x4462, [0x8a, 0x60, 0x2f, 0xcf, 0x2f, 0x29, 0x55, 0xef]);
interface IADsTSUserEx : IDispatch
{
    HRESULT get_TerminalServicesProfilePath(BSTR*);
    HRESULT put_TerminalServicesProfilePath(BSTR);
    HRESULT get_TerminalServicesHomeDirectory(BSTR*);
    HRESULT put_TerminalServicesHomeDirectory(BSTR);
    HRESULT get_TerminalServicesHomeDrive(BSTR*);
    HRESULT put_TerminalServicesHomeDrive(BSTR);
    HRESULT get_AllowLogon(int*);
    HRESULT put_AllowLogon(int);
    HRESULT get_EnableRemoteControl(int*);
    HRESULT put_EnableRemoteControl(int);
    HRESULT get_MaxDisconnectionTime(int*);
    HRESULT put_MaxDisconnectionTime(int);
    HRESULT get_MaxConnectionTime(int*);
    HRESULT put_MaxConnectionTime(int);
    HRESULT get_MaxIdleTime(int*);
    HRESULT put_MaxIdleTime(int);
    HRESULT get_ReconnectionAction(int*);
    HRESULT put_ReconnectionAction(int);
    HRESULT get_BrokenConnectionAction(int*);
    HRESULT put_BrokenConnectionAction(int);
    HRESULT get_ConnectClientDrivesAtLogon(int*);
    HRESULT put_ConnectClientDrivesAtLogon(int);
    HRESULT get_ConnectClientPrintersAtLogon(int*);
    HRESULT put_ConnectClientPrintersAtLogon(int);
    HRESULT get_DefaultToMainPrinter(int*);
    HRESULT put_DefaultToMainPrinter(int);
    HRESULT get_TerminalServicesWorkDirectory(BSTR*);
    HRESULT put_TerminalServicesWorkDirectory(BSTR);
    HRESULT get_TerminalServicesInitialProgram(BSTR*);
    HRESULT put_TerminalServicesInitialProgram(BSTR);
}
enum CLSID_ADsTSUserEx = GUID(0xe2e9cae6, 0x1e7b, 0x4b8e, [0xba, 0xbd, 0xe9, 0xbf, 0x62, 0x92, 0xac, 0x29]);
struct ADsTSUserEx
{
}
alias AAAuthSchemes = int;
enum : int
{
    AA_AUTH_MIN                 = 0x00000000,
    AA_AUTH_BASIC               = 0x00000001,
    AA_AUTH_NTLM                = 0x00000002,
    AA_AUTH_SC                  = 0x00000003,
    AA_AUTH_LOGGEDONCREDENTIALS = 0x00000004,
    AA_AUTH_NEGOTIATE           = 0x00000005,
    AA_AUTH_ANY                 = 0x00000006,
    AA_AUTH_COOKIE              = 0x00000007,
    AA_AUTH_DIGEST              = 0x00000008,
    AA_AUTH_ORGID               = 0x00000009,
    AA_AUTH_CONID               = 0x0000000a,
    AA_AUTH_SSPI_NTLM           = 0x0000000b,
    AA_AUTH_MAX                 = 0x0000000c,
}

alias AAAccountingDataType = int;
enum : int
{
    AA_MAIN_SESSION_CREATION = 0x00000000,
    AA_SUB_SESSION_CREATION  = 0x00000001,
    AA_SUB_SESSION_CLOSED    = 0x00000002,
    AA_MAIN_SESSION_CLOSED   = 0x00000003,
}

struct AAAccountingData
{
    BSTR userName;
    BSTR clientName;
    AAAuthSchemes authType;
    BSTR resourceName;
    int portNumber;
    BSTR protocolName;
    int numberOfBytesReceived;
    int numberOfBytesTransfered;
    BSTR reasonForDisconnect;
    GUID mainSessionId;
    int subSessionId;
}
alias SESSION_TIMEOUT_ACTION_TYPE = int;
enum : int
{
    SESSION_TIMEOUT_ACTION_DISCONNECT    = 0x00000000,
    SESSION_TIMEOUT_ACTION_SILENT_REAUTH = 0x00000001,
}

alias PolicyAttributeType = int;
enum : int
{
    EnableAllRedirections        = 0x00000000,
    DisableAllRedirections       = 0x00000001,
    DriveRedirectionDisabled     = 0x00000002,
    PrinterRedirectionDisabled   = 0x00000003,
    PortRedirectionDisabled      = 0x00000004,
    ClipboardRedirectionDisabled = 0x00000005,
    PnpRedirectionDisabled       = 0x00000006,
    AllowOnlySDRServers          = 0x00000007,
}

alias AATrustClassID = int;
enum : int
{
    AA_UNTRUSTED                   = 0x00000000,
    AA_TRUSTEDUSER_UNTRUSTEDCLIENT = 0x00000001,
    AA_TRUSTEDUSER_TRUSTEDCLIENT   = 0x00000002,
}

enum IID_ITSGAuthorizeConnectionSink = GUID(0xc27ece33, 0x7781, 0x4318, [0x98, 0xef, 0x1c, 0xf2, 0xda, 0x7b, 0x70, 0x5]);
interface ITSGAuthorizeConnectionSink : IUnknown
{
    HRESULT OnConnectionAuthorized(HRESULT, GUID, uint, ubyte*, uint, uint, SESSION_TIMEOUT_ACTION_TYPE, AATrustClassID, uint*);
}
enum IID_ITSGAuthorizeResourceSink = GUID(0xfeddfcd4, 0xfa12, 0x4435, [0xae, 0x55, 0x7a, 0xd1, 0xa9, 0x77, 0x9a, 0xf7]);
interface ITSGAuthorizeResourceSink : IUnknown
{
    HRESULT OnChannelAuthorized(HRESULT, GUID, int, BSTR*, uint, BSTR*, uint);
}
enum IID_ITSGPolicyEngine = GUID(0x8bc24f08, 0x6223, 0x42f4, [0xa5, 0xb4, 0x8e, 0x37, 0xcd, 0x13, 0x5b, 0xbd]);
interface ITSGPolicyEngine : IUnknown
{
    HRESULT AuthorizeConnection(GUID, BSTR, AAAuthSchemes, BSTR, BSTR, ubyte*, uint, ubyte*, uint, HANDLE_PTR, ITSGAuthorizeConnectionSink);
    HRESULT AuthorizeResource(GUID, int, BSTR, BSTR*, uint, BSTR*, uint, uint, BSTR, ubyte*, uint, ITSGAuthorizeResourceSink);
    HRESULT Refresh();
    HRESULT IsQuarantineEnabled(BOOL*);
}
enum IID_ITSGAccountingEngine = GUID(0x4ce2a0c9, 0xe874, 0x4f1a, [0x86, 0xf4, 0x6, 0xbb, 0xb9, 0x11, 0x53, 0x38]);
interface ITSGAccountingEngine : IUnknown
{
    HRESULT DoAccounting(AAAccountingDataType, AAAccountingData);
}
enum IID_ITSGAuthenticateUserSink = GUID(0x2c3e2e73, 0xa782, 0x47f9, [0x8d, 0xfb, 0x77, 0xee, 0x1e, 0xd2, 0x7a, 0x3]);
interface ITSGAuthenticateUserSink : IUnknown
{
    HRESULT OnUserAuthenticated(BSTR, BSTR, ulong, HANDLE_PTR);
    HRESULT OnUserAuthenticationFailed(ulong, HRESULT, HRESULT);
    HRESULT ReauthenticateUser(ulong);
    HRESULT DisconnectUser(ulong);
}
enum IID_ITSGAuthenticationEngine = GUID(0x9ee3e5bf, 0x4ab, 0x4691, [0x99, 0x8c, 0xd7, 0xf6, 0x22, 0x32, 0x1a, 0x56]);
interface ITSGAuthenticationEngine : IUnknown
{
    HRESULT AuthenticateUser(GUID, ubyte*, uint, ulong, ITSGAuthenticateUserSink);
    HRESULT CancelAuthentication(GUID, ulong);
}
alias WTS_CONNECTSTATE_CLASS = int;
enum : int
{
    WTSActive       = 0x00000000,
    WTSConnected    = 0x00000001,
    WTSConnectQuery = 0x00000002,
    WTSShadow       = 0x00000003,
    WTSDisconnected = 0x00000004,
    WTSIdle         = 0x00000005,
    WTSListen       = 0x00000006,
    WTSReset        = 0x00000007,
    WTSDown         = 0x00000008,
    WTSInit         = 0x00000009,
}

struct WTS_SERVER_INFOW
{
    PWSTR pServerName;
}
struct WTS_SERVER_INFOA
{
    PSTR pServerName;
}
struct WTS_SESSION_INFOW
{
    uint SessionId;
    PWSTR pWinStationName;
    WTS_CONNECTSTATE_CLASS State;
}
struct WTS_SESSION_INFOA
{
    uint SessionId;
    PSTR pWinStationName;
    WTS_CONNECTSTATE_CLASS State;
}
struct WTS_SESSION_INFO_1W
{
    uint ExecEnvId;
    WTS_CONNECTSTATE_CLASS State;
    uint SessionId;
    PWSTR pSessionName;
    PWSTR pHostName;
    PWSTR pUserName;
    PWSTR pDomainName;
    PWSTR pFarmName;
}
struct WTS_SESSION_INFO_1A
{
    uint ExecEnvId;
    WTS_CONNECTSTATE_CLASS State;
    uint SessionId;
    PSTR pSessionName;
    PSTR pHostName;
    PSTR pUserName;
    PSTR pDomainName;
    PSTR pFarmName;
}
struct WTS_PROCESS_INFOW
{
    uint SessionId;
    uint ProcessId;
    PWSTR pProcessName;
    PSID pUserSid;
}
struct WTS_PROCESS_INFOA
{
    uint SessionId;
    uint ProcessId;
    PSTR pProcessName;
    PSID pUserSid;
}
alias WTS_INFO_CLASS = int;
enum : int
{
    WTSInitialProgram     = 0x00000000,
    WTSApplicationName    = 0x00000001,
    WTSWorkingDirectory   = 0x00000002,
    WTSOEMId              = 0x00000003,
    WTSSessionId          = 0x00000004,
    WTSUserName           = 0x00000005,
    WTSWinStationName     = 0x00000006,
    WTSDomainName         = 0x00000007,
    WTSConnectState       = 0x00000008,
    WTSClientBuildNumber  = 0x00000009,
    WTSClientName         = 0x0000000a,
    WTSClientDirectory    = 0x0000000b,
    WTSClientProductId    = 0x0000000c,
    WTSClientHardwareId   = 0x0000000d,
    WTSClientAddress      = 0x0000000e,
    WTSClientDisplay      = 0x0000000f,
    WTSClientProtocolType = 0x00000010,
    WTSIdleTime           = 0x00000011,
    WTSLogonTime          = 0x00000012,
    WTSIncomingBytes      = 0x00000013,
    WTSOutgoingBytes      = 0x00000014,
    WTSIncomingFrames     = 0x00000015,
    WTSOutgoingFrames     = 0x00000016,
    WTSClientInfo         = 0x00000017,
    WTSSessionInfo        = 0x00000018,
    WTSSessionInfoEx      = 0x00000019,
    WTSConfigInfo         = 0x0000001a,
    WTSValidationInfo     = 0x0000001b,
    WTSSessionAddressV4   = 0x0000001c,
    WTSIsRemoteSession    = 0x0000001d,
}

struct WTSCONFIGINFOW
{
    uint version_;
    uint fConnectClientDrivesAtLogon;
    uint fConnectPrinterAtLogon;
    uint fDisablePrinterRedirection;
    uint fDisableDefaultMainClientPrinter;
    uint ShadowSettings;
    wchar[21] LogonUserName;
    wchar[18] LogonDomain;
    wchar[261] WorkDirectory;
    wchar[261] InitialProgram;
    wchar[261] ApplicationName;
}
struct WTSCONFIGINFOA
{
    uint version_;
    uint fConnectClientDrivesAtLogon;
    uint fConnectPrinterAtLogon;
    uint fDisablePrinterRedirection;
    uint fDisableDefaultMainClientPrinter;
    uint ShadowSettings;
    CHAR[21] LogonUserName;
    CHAR[18] LogonDomain;
    CHAR[261] WorkDirectory;
    CHAR[261] InitialProgram;
    CHAR[261] ApplicationName;
}
struct WTSINFOW
{
    WTS_CONNECTSTATE_CLASS State;
    uint SessionId;
    uint IncomingBytes;
    uint OutgoingBytes;
    uint IncomingFrames;
    uint OutgoingFrames;
    uint IncomingCompressedBytes;
    uint OutgoingCompressedBytes;
    wchar[32] WinStationName;
    wchar[17] Domain;
    wchar[21] UserName;
    long ConnectTime;
    long DisconnectTime;
    long LastInputTime;
    long LogonTime;
    long CurrentTime;
}
struct WTSINFOA
{
    WTS_CONNECTSTATE_CLASS State;
    uint SessionId;
    uint IncomingBytes;
    uint OutgoingBytes;
    uint IncomingFrames;
    uint OutgoingFrames;
    uint IncomingCompressedBytes;
    uint OutgoingCompressedBy;
    CHAR[32] WinStationName;
    CHAR[17] Domain;
    CHAR[21] UserName;
    long ConnectTime;
    long DisconnectTime;
    long LastInputTime;
    long LogonTime;
    long CurrentTime;
}
struct WTSINFOEX_LEVEL1_W
{
    uint SessionId;
    WTS_CONNECTSTATE_CLASS SessionState;
    int SessionFlags;
    wchar[33] WinStationName;
    wchar[21] UserName;
    wchar[18] DomainName;
    long LogonTime;
    long ConnectTime;
    long DisconnectTime;
    long LastInputTime;
    long CurrentTime;
    uint IncomingBytes;
    uint OutgoingBytes;
    uint IncomingFrames;
    uint OutgoingFrames;
    uint IncomingCompressedBytes;
    uint OutgoingCompressedBytes;
}
struct WTSINFOEX_LEVEL1_A
{
    uint SessionId;
    WTS_CONNECTSTATE_CLASS SessionState;
    int SessionFlags;
    CHAR[33] WinStationName;
    CHAR[21] UserName;
    CHAR[18] DomainName;
    long LogonTime;
    long ConnectTime;
    long DisconnectTime;
    long LastInputTime;
    long CurrentTime;
    uint IncomingBytes;
    uint OutgoingBytes;
    uint IncomingFrames;
    uint OutgoingFrames;
    uint IncomingCompressedBytes;
    uint OutgoingCompressedBytes;
}
union WTSINFOEX_LEVEL_W
{
    WTSINFOEX_LEVEL1_W WTSInfoExLevel1;
}
union WTSINFOEX_LEVEL_A
{
    WTSINFOEX_LEVEL1_A WTSInfoExLevel1;
}
struct WTSINFOEXW
{
    uint Level;
    WTSINFOEX_LEVEL_W Data;
}
struct WTSINFOEXA
{
    uint Level;
    WTSINFOEX_LEVEL_A Data;
}
struct WTSCLIENTW
{
    wchar[21] ClientName;
    wchar[18] Domain;
    wchar[21] UserName;
    wchar[261] WorkDirectory;
    wchar[261] InitialProgram;
    ubyte EncryptionLevel;
    uint ClientAddressFamily;
    ushort[31] ClientAddress;
    ushort HRes;
    ushort VRes;
    ushort ColorDepth;
    wchar[261] ClientDirectory;
    uint ClientBuildNumber;
    uint ClientHardwareId;
    ushort ClientProductId;
    ushort OutBufCountHost;
    ushort OutBufCountClient;
    ushort OutBufLength;
    wchar[261] DeviceId;
}
struct WTSCLIENTA
{
    CHAR[21] ClientName;
    CHAR[18] Domain;
    CHAR[21] UserName;
    CHAR[261] WorkDirectory;
    CHAR[261] InitialProgram;
    ubyte EncryptionLevel;
    uint ClientAddressFamily;
    ushort[31] ClientAddress;
    ushort HRes;
    ushort VRes;
    ushort ColorDepth;
    CHAR[261] ClientDirectory;
    uint ClientBuildNumber;
    uint ClientHardwareId;
    ushort ClientProductId;
    ushort OutBufCountHost;
    ushort OutBufCountClient;
    ushort OutBufLength;
    CHAR[261] DeviceId;
}
struct PRODUCT_INFOA
{
    CHAR[256] CompanyName;
    CHAR[4] ProductID;
}
struct PRODUCT_INFOW
{
    wchar[256] CompanyName;
    wchar[4] ProductID;
}
struct WTS_VALIDATION_INFORMATIONA
{
    PRODUCT_INFOA ProductInfo;
    ubyte[16384] License;
    uint LicenseLength;
    ubyte[20] HardwareID;
    uint HardwareIDLength;
}
struct WTS_VALIDATION_INFORMATIONW
{
    PRODUCT_INFOW ProductInfo;
    ubyte[16384] License;
    uint LicenseLength;
    ubyte[20] HardwareID;
    uint HardwareIDLength;
}
struct WTS_CLIENT_ADDRESS
{
    uint AddressFamily;
    ubyte[20] Address;
}
struct WTS_CLIENT_DISPLAY
{
    uint HorizontalResolution;
    uint VerticalResolution;
    uint ColorDepth;
}
alias WTS_CONFIG_CLASS = int;
enum : int
{
    WTSUserConfigInitialProgram                = 0x00000000,
    WTSUserConfigWorkingDirectory              = 0x00000001,
    WTSUserConfigfInheritInitialProgram        = 0x00000002,
    WTSUserConfigfAllowLogonTerminalServer     = 0x00000003,
    WTSUserConfigTimeoutSettingsConnections    = 0x00000004,
    WTSUserConfigTimeoutSettingsDisconnections = 0x00000005,
    WTSUserConfigTimeoutSettingsIdle           = 0x00000006,
    WTSUserConfigfDeviceClientDrives           = 0x00000007,
    WTSUserConfigfDeviceClientPrinters         = 0x00000008,
    WTSUserConfigfDeviceClientDefaultPrinter   = 0x00000009,
    WTSUserConfigBrokenTimeoutSettings         = 0x0000000a,
    WTSUserConfigReconnectSettings             = 0x0000000b,
    WTSUserConfigModemCallbackSettings         = 0x0000000c,
    WTSUserConfigModemCallbackPhoneNumber      = 0x0000000d,
    WTSUserConfigShadowingSettings             = 0x0000000e,
    WTSUserConfigTerminalServerProfilePath     = 0x0000000f,
    WTSUserConfigTerminalServerHomeDir         = 0x00000010,
    WTSUserConfigTerminalServerHomeDirDrive    = 0x00000011,
    WTSUserConfigfTerminalServerRemoteHomeDir  = 0x00000012,
    WTSUserConfigUser                          = 0x00000013,
}

alias WTS_CONFIG_SOURCE = int;
enum : int
{
    WTSUserConfigSourceSAM = 0x00000000,
}

struct WTSUSERCONFIGA
{
    uint Source;
    uint InheritInitialProgram;
    uint AllowLogonTerminalServer;
    uint TimeoutSettingsConnections;
    uint TimeoutSettingsDisconnections;
    uint TimeoutSettingsIdle;
    uint DeviceClientDrives;
    uint DeviceClientPrinters;
    uint ClientDefaultPrinter;
    uint BrokenTimeoutSettings;
    uint ReconnectSettings;
    uint ShadowingSettings;
    uint TerminalServerRemoteHomeDir;
    CHAR[261] InitialProgram;
    CHAR[261] WorkDirectory;
    CHAR[261] TerminalServerProfilePath;
    CHAR[261] TerminalServerHomeDir;
    CHAR[4] TerminalServerHomeDirDrive;
}
struct WTSUSERCONFIGW
{
    uint Source;
    uint InheritInitialProgram;
    uint AllowLogonTerminalServer;
    uint TimeoutSettingsConnections;
    uint TimeoutSettingsDisconnections;
    uint TimeoutSettingsIdle;
    uint DeviceClientDrives;
    uint DeviceClientPrinters;
    uint ClientDefaultPrinter;
    uint BrokenTimeoutSettings;
    uint ReconnectSettings;
    uint ShadowingSettings;
    uint TerminalServerRemoteHomeDir;
    wchar[261] InitialProgram;
    wchar[261] WorkDirectory;
    wchar[261] TerminalServerProfilePath;
    wchar[261] TerminalServerHomeDir;
    wchar[4] TerminalServerHomeDirDrive;
}
alias WTS_VIRTUAL_CLASS = int;
enum : int
{
    WTSVirtualClientData = 0x00000000,
    WTSVirtualFileHandle = 0x00000001,
}

struct WTS_SESSION_ADDRESS
{
    uint AddressFamily;
    ubyte[20] Address;
}
struct WTS_PROCESS_INFO_EXW
{
    uint SessionId;
    uint ProcessId;
    PWSTR pProcessName;
    PSID pUserSid;
    uint NumberOfThreads;
    uint HandleCount;
    uint PagefileUsage;
    uint PeakPagefileUsage;
    uint WorkingSetSize;
    uint PeakWorkingSetSize;
    long UserTime;
    long KernelTime;
}
struct WTS_PROCESS_INFO_EXA
{
    uint SessionId;
    uint ProcessId;
    PSTR pProcessName;
    PSID pUserSid;
    uint NumberOfThreads;
    uint HandleCount;
    uint PagefileUsage;
    uint PeakPagefileUsage;
    uint WorkingSetSize;
    uint PeakWorkingSetSize;
    long UserTime;
    long KernelTime;
}
alias WTS_TYPE_CLASS = int;
enum : int
{
    WTSTypeProcessInfoLevel0 = 0x00000000,
    WTSTypeProcessInfoLevel1 = 0x00000001,
    WTSTypeSessionInfoLevel1 = 0x00000002,
}

struct WTSLISTENERCONFIGW
{
    uint version_;
    uint fEnableListener;
    uint MaxConnectionCount;
    uint fPromptForPassword;
    uint fInheritColorDepth;
    uint ColorDepth;
    uint fInheritBrokenTimeoutSettings;
    uint BrokenTimeoutSettings;
    uint fDisablePrinterRedirection;
    uint fDisableDriveRedirection;
    uint fDisableComPortRedirection;
    uint fDisableLPTPortRedirection;
    uint fDisableClipboardRedirection;
    uint fDisableAudioRedirection;
    uint fDisablePNPRedirection;
    uint fDisableDefaultMainClientPrinter;
    uint LanAdapter;
    uint PortNumber;
    uint fInheritShadowSettings;
    uint ShadowSettings;
    uint TimeoutSettingsConnection;
    uint TimeoutSettingsDisconnection;
    uint TimeoutSettingsIdle;
    uint SecurityLayer;
    uint MinEncryptionLevel;
    uint UserAuthentication;
    wchar[61] Comment;
    wchar[21] LogonUserName;
    wchar[18] LogonDomain;
    wchar[261] WorkDirectory;
    wchar[261] InitialProgram;
}
struct WTSLISTENERCONFIGA
{
    uint version_;
    uint fEnableListener;
    uint MaxConnectionCount;
    uint fPromptForPassword;
    uint fInheritColorDepth;
    uint ColorDepth;
    uint fInheritBrokenTimeoutSettings;
    uint BrokenTimeoutSettings;
    uint fDisablePrinterRedirection;
    uint fDisableDriveRedirection;
    uint fDisableComPortRedirection;
    uint fDisableLPTPortRedirection;
    uint fDisableClipboardRedirection;
    uint fDisableAudioRedirection;
    uint fDisablePNPRedirection;
    uint fDisableDefaultMainClientPrinter;
    uint LanAdapter;
    uint PortNumber;
    uint fInheritShadowSettings;
    uint ShadowSettings;
    uint TimeoutSettingsConnection;
    uint TimeoutSettingsDisconnection;
    uint TimeoutSettingsIdle;
    uint SecurityLayer;
    uint MinEncryptionLevel;
    uint UserAuthentication;
    CHAR[61] Comment;
    CHAR[21] LogonUserName;
    CHAR[18] LogonDomain;
    CHAR[261] WorkDirectory;
    CHAR[261] InitialProgram;
}
alias WTSSBX_MACHINE_DRAIN = int;
enum : int
{
    WTSSBX_MACHINE_DRAIN_UNSPEC = 0x00000000,
    WTSSBX_MACHINE_DRAIN_OFF    = 0x00000001,
    WTSSBX_MACHINE_DRAIN_ON     = 0x00000002,
}

alias WTSSBX_MACHINE_SESSION_MODE = int;
enum : int
{
    WTSSBX_MACHINE_SESSION_MODE_UNSPEC   = 0x00000000,
    WTSSBX_MACHINE_SESSION_MODE_SINGLE   = 0x00000001,
    WTSSBX_MACHINE_SESSION_MODE_MULTIPLE = 0x00000002,
}

alias WTSSBX_ADDRESS_FAMILY = int;
enum : int
{
    WTSSBX_ADDRESS_FAMILY_AF_UNSPEC  = 0x00000000,
    WTSSBX_ADDRESS_FAMILY_AF_INET    = 0x00000001,
    WTSSBX_ADDRESS_FAMILY_AF_INET6   = 0x00000002,
    WTSSBX_ADDRESS_FAMILY_AF_IPX     = 0x00000003,
    WTSSBX_ADDRESS_FAMILY_AF_NETBIOS = 0x00000004,
}

struct WTSSBX_IP_ADDRESS
{
    WTSSBX_ADDRESS_FAMILY AddressFamily;
    ubyte[16] Address;
    ushort PortNumber;
    uint dwScope;
}
alias WTSSBX_MACHINE_STATE = int;
enum : int
{
    WTSSBX_MACHINE_STATE_UNSPEC        = 0x00000000,
    WTSSBX_MACHINE_STATE_READY         = 0x00000001,
    WTSSBX_MACHINE_STATE_SYNCHRONIZING = 0x00000002,
}

struct WTSSBX_MACHINE_CONNECT_INFO
{
    wchar[257] wczMachineFQDN;
    wchar[17] wczMachineNetBiosName;
    uint dwNumOfIPAddr;
    WTSSBX_IP_ADDRESS[12] IPaddr;
}
struct WTSSBX_MACHINE_INFO
{
    WTSSBX_MACHINE_CONNECT_INFO ClientConnectInfo;
    wchar[257] wczFarmName;
    WTSSBX_IP_ADDRESS InternalIPAddress;
    uint dwMaxSessionsLimit;
    uint ServerWeight;
    WTSSBX_MACHINE_SESSION_MODE SingleSessionMode;
    WTSSBX_MACHINE_DRAIN InDrain;
    WTSSBX_MACHINE_STATE MachineState;
}
alias WTSSBX_SESSION_STATE = int;
enum : int
{
    WTSSBX_SESSION_STATE_UNSPEC       = 0x00000000,
    WTSSBX_SESSION_STATE_ACTIVE       = 0x00000001,
    WTSSBX_SESSION_STATE_DISCONNECTED = 0x00000002,
}

struct WTSSBX_SESSION_INFO
{
    wchar[105] wszUserName;
    wchar[257] wszDomainName;
    wchar[257] ApplicationType;
    uint dwSessionId;
    FILETIME CreateTime;
    FILETIME DisconnectTime;
    WTSSBX_SESSION_STATE SessionState;
}
alias WTSSBX_NOTIFICATION_TYPE = int;
enum : int
{
    WTSSBX_NOTIFICATION_REMOVED = 0x00000001,
    WTSSBX_NOTIFICATION_CHANGED = 0x00000002,
    WTSSBX_NOTIFICATION_ADDED   = 0x00000004,
    WTSSBX_NOTIFICATION_RESYNC  = 0x00000008,
}

enum IID_IWTSSBPlugin = GUID(0xdc44be78, 0xb18d, 0x4399, [0xb2, 0x10, 0x64, 0x1b, 0xf6, 0x7a, 0x0, 0x2c]);
interface IWTSSBPlugin : IUnknown
{
    HRESULT Initialize(uint*);
    HRESULT WTSSBX_MachineChangeNotification(WTSSBX_NOTIFICATION_TYPE, int, WTSSBX_MACHINE_INFO*);
    HRESULT WTSSBX_SessionChangeNotification(WTSSBX_NOTIFICATION_TYPE, int, uint, WTSSBX_SESSION_INFO*);
    HRESULT WTSSBX_GetMostSuitableServer(PWSTR, PWSTR, PWSTR, PWSTR, int*);
    HRESULT Terminated();
    HRESULT WTSSBX_GetUserExternalSession(PWSTR, PWSTR, PWSTR, WTSSBX_IP_ADDRESS*, uint*, WTSSBX_MACHINE_CONNECT_INFO*);
}
struct CHANNEL_DEF
{
    align (1):
    CHAR[8] name;
    uint options;
}
struct CHANNEL_PDU_HEADER
{
    uint length;
    uint flags;
}
alias PCHANNEL_INIT_EVENT_FN = void function(void*, uint, void*, uint);
alias PCHANNEL_OPEN_EVENT_FN = void function(uint, uint, void*, uint, uint, uint);
alias PVIRTUALCHANNELINIT = uint function(void**, CHANNEL_DEF*, int, uint, PCHANNEL_INIT_EVENT_FN);
alias PVIRTUALCHANNELOPEN = uint function(void*, uint*, PSTR, PCHANNEL_OPEN_EVENT_FN);
alias PVIRTUALCHANNELCLOSE = uint function(uint);
alias PVIRTUALCHANNELWRITE = uint function(uint, void*, uint, void*);
struct CHANNEL_ENTRY_POINTS
{
    uint cbSize;
    uint protocolVersion;
    PVIRTUALCHANNELINIT pVirtualChannelInit;
    PVIRTUALCHANNELOPEN pVirtualChannelOpen;
    PVIRTUALCHANNELCLOSE pVirtualChannelClose;
    PVIRTUALCHANNELWRITE pVirtualChannelWrite;
}
alias PVIRTUALCHANNELENTRY = BOOL function(CHANNEL_ENTRY_POINTS*);
enum IID_IWorkspaceClientExt = GUID(0x12b952f4, 0x41ca, 0x4f21, [0xa8, 0x29, 0xa6, 0xd0, 0x7d, 0x9a, 0x16, 0xe5]);
interface IWorkspaceClientExt : IUnknown
{
    HRESULT GetResourceId(BSTR*);
    HRESULT GetResourceDisplayName(BSTR*);
    HRESULT IssueDisconnect();
}
enum IID_IWorkspace = GUID(0xb922bbb8, 0x4c55, 0x4fea, [0x84, 0x96, 0xbe, 0xb0, 0xb4, 0x42, 0x85, 0xe5]);
interface IWorkspace : IUnknown
{
    HRESULT GetWorkspaceNames(SAFEARRAY**);
    HRESULT StartRemoteApplication(BSTR, SAFEARRAY*);
    HRESULT GetProcessId(uint*);
}
enum IID_IWorkspace2 = GUID(0x96d8d7cf, 0x783e, 0x4286, [0x83, 0x4c, 0xeb, 0xc0, 0xe9, 0x5f, 0x78, 0x3c]);
interface IWorkspace2 : IWorkspace
{
    HRESULT StartRemoteApplicationEx(BSTR, BSTR, BSTR, VARIANT_BOOL, BSTR, SAFEARRAY*);
}
enum IID_IWorkspace3 = GUID(0x1becbe4a, 0xd654, 0x423b, [0xaf, 0xeb, 0xbe, 0x8d, 0x53, 0x2c, 0x13, 0xc6]);
interface IWorkspace3 : IWorkspace2
{
    HRESULT GetClaimsToken2(BSTR, BSTR, uint, uint, RECT, BSTR*);
    HRESULT SetClaimsToken(BSTR, ulong, BSTR);
}
enum IID_IWorkspaceRegistration = GUID(0xb922bbb8, 0x4c55, 0x4fea, [0x84, 0x96, 0xbe, 0xb0, 0xb4, 0x42, 0x85, 0xe6]);
interface IWorkspaceRegistration : IUnknown
{
    HRESULT AddResource(IWorkspaceClientExt, uint*);
    HRESULT RemoveResource(uint);
}
enum IID_IWorkspaceRegistration2 = GUID(0xcf59f654, 0x39bb, 0x44d8, [0x94, 0xd0, 0x46, 0x35, 0x72, 0x89, 0x57, 0xe9]);
interface IWorkspaceRegistration2 : IWorkspaceRegistration
{
    HRESULT AddResourceEx(IWorkspaceClientExt, BSTR, uint*, GUID);
    HRESULT RemoveResourceEx(uint, GUID);
}
enum IID_IWorkspaceScriptable = GUID(0xefea49a2, 0xdda5, 0x429d, [0x8f, 0x42, 0xb2, 0x3b, 0x92, 0xc4, 0xc3, 0x47]);
interface IWorkspaceScriptable : IDispatch
{
    HRESULT DisconnectWorkspace(BSTR);
    HRESULT StartWorkspace(BSTR, BSTR, BSTR, BSTR, int, int);
    HRESULT IsWorkspaceCredentialSpecified(BSTR, VARIANT_BOOL, VARIANT_BOOL*);
    HRESULT IsWorkspaceSSOEnabled(VARIANT_BOOL*);
    HRESULT ClearWorkspaceCredential(BSTR);
    HRESULT OnAuthenticated(BSTR, BSTR);
    HRESULT DisconnectWorkspaceByFriendlyName(BSTR);
}
enum IID_IWorkspaceScriptable2 = GUID(0xefea49a2, 0xdda5, 0x429d, [0x8f, 0x42, 0xb3, 0x3b, 0xa2, 0xc4, 0xc3, 0x48]);
interface IWorkspaceScriptable2 : IWorkspaceScriptable
{
    HRESULT StartWorkspaceEx(BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, int, int);
    HRESULT ResourceDismissed(BSTR, BSTR);
}
enum IID_IWorkspaceScriptable3 = GUID(0x531e6512, 0x2cbf, 0x4bd2, [0x80, 0xa5, 0xd9, 0xa, 0x71, 0x63, 0x6a, 0x9a]);
interface IWorkspaceScriptable3 : IWorkspaceScriptable2
{
    HRESULT StartWorkspaceEx2(BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, int, int, BSTR, GUID);
}
enum IID_IWorkspaceReportMessage = GUID(0xa7c06739, 0x500f, 0x4e8c, [0x99, 0xa8, 0x2b, 0xd6, 0x95, 0x58, 0x99, 0xeb]);
interface IWorkspaceReportMessage : IUnknown
{
    HRESULT RegisterErrorLogMessage(BSTR);
    HRESULT IsErrorMessageRegistered(BSTR, uint, BSTR, uint, VARIANT_BOOL*);
    HRESULT RegisterErrorEvent(BSTR, uint, BSTR, uint);
}
enum IID__ITSWkspEvents = GUID(0xb922bbb8, 0x4c55, 0x4fea, [0x84, 0x96, 0xbe, 0xb0, 0xb4, 0x42, 0x85, 0xe9]);
interface _ITSWkspEvents : IDispatch
{
}
enum CLSID_Workspace = GUID(0x4f1dfca6, 0x3aad, 0x48e1, [0x84, 0x6, 0x4b, 0xc2, 0x1a, 0x50, 0x1d, 0x7c]);
struct Workspace
{
}
alias TSSD_AddrV46Type = int;
enum : int
{
    TSSD_ADDR_UNDEFINED = 0x00000000,
    TSSD_ADDR_IPv4      = 0x00000004,
    TSSD_ADDR_IPv6      = 0x00000006,
}

alias TSSB_NOTIFICATION_TYPE = int;
enum : int
{
    TSSB_NOTIFY_INVALID                   = 0x00000000,
    TSSB_NOTIFY_TARGET_CHANGE             = 0x00000001,
    TSSB_NOTIFY_SESSION_CHANGE            = 0x00000002,
    TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE = 0x00000004,
}

alias TARGET_STATE = int;
enum : int
{
    TARGET_UNKNOWN      = 0x00000001,
    TARGET_INITIALIZING = 0x00000002,
    TARGET_RUNNING      = 0x00000003,
    TARGET_DOWN         = 0x00000004,
    TARGET_HIBERNATED   = 0x00000005,
    TARGET_CHECKED_OUT  = 0x00000006,
    TARGET_STOPPED      = 0x00000007,
    TARGET_INVALID      = 0x00000008,
    TARGET_STARTING     = 0x00000009,
    TARGET_STOPPING     = 0x0000000a,
    TARGET_MAXSTATE     = 0x0000000b,
}

alias TARGET_CHANGE_TYPE = int;
enum : int
{
    TARGET_CHANGE_UNSPEC           = 0x00000001,
    TARGET_EXTERNALIP_CHANGED      = 0x00000002,
    TARGET_INTERNALIP_CHANGED      = 0x00000004,
    TARGET_JOINED                  = 0x00000008,
    TARGET_REMOVED                 = 0x00000010,
    TARGET_STATE_CHANGED           = 0x00000020,
    TARGET_IDLE                    = 0x00000040,
    TARGET_PENDING                 = 0x00000080,
    TARGET_INUSE                   = 0x00000100,
    TARGET_PATCH_STATE_CHANGED     = 0x00000200,
    TARGET_FARM_MEMBERSHIP_CHANGED = 0x00000400,
}

alias TARGET_TYPE = int;
enum : int
{
    UNKNOWN = 0x00000000,
    FARM    = 0x00000001,
    NONFARM = 0x00000002,
}

alias TARGET_PATCH_STATE = int;
enum : int
{
    TARGET_PATCH_UNKNOWN     = 0x00000000,
    TARGET_PATCH_NOT_STARTED = 0x00000001,
    TARGET_PATCH_IN_PROGRESS = 0x00000002,
    TARGET_PATCH_COMPLETED   = 0x00000003,
    TARGET_PATCH_FAILED      = 0x00000004,
}

alias CLIENT_MESSAGE_TYPE = int;
enum : int
{
    CLIENT_MESSAGE_CONNECTION_INVALID = 0x00000000,
    CLIENT_MESSAGE_CONNECTION_STATUS  = 0x00000001,
    CLIENT_MESSAGE_CONNECTION_ERROR   = 0x00000002,
}

alias CONNECTION_CHANGE_NOTIFICATION = int;
enum : int
{
    CONNECTION_REQUEST_INVALID            = 0x00000000,
    CONNECTION_REQUEST_PENDING            = 0x00000001,
    CONNECTION_REQUEST_FAILED             = 0x00000002,
    CONNECTION_REQUEST_TIMEDOUT           = 0x00000003,
    CONNECTION_REQUEST_SUCCEEDED          = 0x00000004,
    CONNECTION_REQUEST_CANCELLED          = 0x00000005,
    CONNECTION_REQUEST_LB_COMPLETED       = 0x00000006,
    CONNECTION_REQUEST_QUERY_PL_COMPLETED = 0x00000007,
    CONNECTION_REQUEST_ORCH_COMPLETED     = 0x00000008,
}

alias RD_FARM_TYPE = int;
enum : int
{
    RD_FARM_RDSH                 = 0x00000000,
    RD_FARM_TEMP_VM              = 0x00000001,
    RD_FARM_MANUAL_PERSONAL_VM   = 0x00000002,
    RD_FARM_AUTO_PERSONAL_VM     = 0x00000003,
    RD_FARM_MANUAL_PERSONAL_RDSH = 0x00000004,
    RD_FARM_AUTO_PERSONAL_RDSH   = 0x00000005,
    RD_FARM_TYPE_UNKNOWN         = 0xffffffff,
}

alias PLUGIN_TYPE = int;
enum : int
{
    UNKNOWN_PLUGIN        = 0x00000000,
    POLICY_PLUGIN         = 0x00000001,
    RESOURCE_PLUGIN       = 0x00000002,
    LOAD_BALANCING_PLUGIN = 0x00000004,
    PLACEMENT_PLUGIN      = 0x00000008,
    ORCHESTRATION_PLUGIN  = 0x00000010,
    PROVISIONING_PLUGIN   = 0x00000020,
    TASK_PLUGIN           = 0x00000040,
}

alias TSSESSION_STATE = int;
enum : int
{
    STATE_INVALID      = 0xffffffff,
    STATE_ACTIVE       = 0x00000000,
    STATE_CONNECTED    = 0x00000001,
    STATE_CONNECTQUERY = 0x00000002,
    STATE_SHADOW       = 0x00000003,
    STATE_DISCONNECTED = 0x00000004,
    STATE_IDLE         = 0x00000005,
    STATE_LISTEN       = 0x00000006,
    STATE_RESET        = 0x00000007,
    STATE_DOWN         = 0x00000008,
    STATE_INIT         = 0x00000009,
    STATE_MAX          = 0x0000000a,
}

alias TARGET_OWNER = int;
enum : int
{
    OWNER_UNKNOWN      = 0x00000000,
    OWNER_MS_TS_PLUGIN = 0x00000001,
    OWNER_MS_VM_PLUGIN = 0x00000002,
}

struct CLIENT_DISPLAY
{
    uint HorizontalResolution;
    uint VerticalResolution;
    uint ColorDepth;
}
struct TSSD_ConnectionPoint
{
    ubyte[16] ServerAddressB;
    TSSD_AddrV46Type AddressType;
    ushort PortNumber;
    uint AddressScope;
}
alias VM_NOTIFY_STATUS = int;
enum : int
{
    VM_NOTIFY_STATUS_PENDING     = 0x00000000,
    VM_NOTIFY_STATUS_IN_PROGRESS = 0x00000001,
    VM_NOTIFY_STATUS_COMPLETE    = 0x00000002,
    VM_NOTIFY_STATUS_FAILED      = 0x00000003,
    VM_NOTIFY_STATUS_CANCELED    = 0x00000004,
}

struct VM_NOTIFY_ENTRY
{
    wchar[128] VmName;
    wchar[128] VmHost;
}
struct VM_PATCH_INFO
{
    uint dwNumEntries;
    PWSTR* pVmNames;
}
struct VM_NOTIFY_INFO
{
    uint dwNumEntries;
    VM_NOTIFY_ENTRY** ppVmEntries;
}
alias VM_HOST_NOTIFY_STATUS = int;
enum : int
{
    VM_HOST_STATUS_INIT_PENDING     = 0x00000000,
    VM_HOST_STATUS_INIT_IN_PROGRESS = 0x00000001,
    VM_HOST_STATUS_INIT_COMPLETE    = 0x00000002,
    VM_HOST_STATUS_INIT_FAILED      = 0x00000003,
}

alias RDV_TASK_STATUS = int;
enum : int
{
    RDV_TASK_STATUS_UNKNOWN     = 0x00000000,
    RDV_TASK_STATUS_SEARCHING   = 0x00000001,
    RDV_TASK_STATUS_DOWNLOADING = 0x00000002,
    RDV_TASK_STATUS_APPLYING    = 0x00000003,
    RDV_TASK_STATUS_REBOOTING   = 0x00000004,
    RDV_TASK_STATUS_REBOOTED    = 0x00000005,
    RDV_TASK_STATUS_SUCCESS     = 0x00000006,
    RDV_TASK_STATUS_FAILED      = 0x00000007,
    RDV_TASK_STATUS_TIMEOUT     = 0x00000008,
}

alias TS_SB_SORT_BY = int;
enum : int
{
    TS_SB_SORT_BY_NONE = 0x00000000,
    TS_SB_SORT_BY_NAME = 0x00000001,
    TS_SB_SORT_BY_PROP = 0x00000002,
}

enum IID_ITsSbPlugin = GUID(0x48cd7406, 0xcaab, 0x465f, [0xa5, 0xd6, 0xba, 0xa8, 0x63, 0xb9, 0xea, 0x4f]);
interface ITsSbPlugin : IUnknown
{
    HRESULT Initialize(ITsSbProvider, ITsSbPluginNotifySink, ITsSbPluginPropertySet);
    HRESULT Terminate(HRESULT);
}
enum IID_ITsSbResourcePlugin = GUID(0xea8db42c, 0x98ed, 0x4535, [0xa8, 0x8b, 0x2a, 0x16, 0x4f, 0x35, 0x49, 0xf]);
interface ITsSbResourcePlugin : ITsSbPlugin
{
}
enum IID_ITsSbServiceNotification = GUID(0x86cb68ae, 0x86e0, 0x4f57, [0x8a, 0x64, 0xbb, 0x74, 0x6, 0xbc, 0x55, 0x50]);
interface ITsSbServiceNotification : IUnknown
{
    HRESULT NotifyServiceFailure();
    HRESULT NotifyServiceSuccess();
}
enum IID_ITsSbLoadBalancing = GUID(0x24329274, 0x9eb7, 0x11dc, [0xae, 0x98, 0xf2, 0xb4, 0x56, 0xd8, 0x95, 0x93]);
interface ITsSbLoadBalancing : ITsSbPlugin
{
    HRESULT GetMostSuitableTarget(ITsSbClientConnection, ITsSbLoadBalancingNotifySink);
}
enum IID_ITsSbPlacement = GUID(0xdaadee5f, 0x6d32, 0x480e, [0x9e, 0x36, 0xdd, 0xab, 0x23, 0x29, 0xf0, 0x6d]);
interface ITsSbPlacement : ITsSbPlugin
{
    HRESULT QueryEnvironmentForTarget(ITsSbClientConnection, ITsSbPlacementNotifySink);
}
enum IID_ITsSbOrchestration = GUID(0x64fc1172, 0x9eb7, 0x11dc, [0x8b, 0x0, 0x3a, 0xba, 0x56, 0xd8, 0x95, 0x93]);
interface ITsSbOrchestration : ITsSbPlugin
{
    HRESULT PrepareTargetForConnect(ITsSbClientConnection, ITsSbOrchestrationNotifySink);
}
enum IID_ITsSbEnvironment = GUID(0x8c87f7f7, 0xbf51, 0x4a5c, [0x87, 0xbf, 0x8e, 0x94, 0xfb, 0x6e, 0x22, 0x56]);
interface ITsSbEnvironment : IUnknown
{
    HRESULT get_Name(BSTR*);
    HRESULT get_ServerWeight(uint*);
    HRESULT get_EnvironmentPropertySet(ITsSbEnvironmentPropertySet*);
    HRESULT put_EnvironmentPropertySet(ITsSbEnvironmentPropertySet);
}
enum IID_ITsSbLoadBalanceResult = GUID(0x24fdb7ac, 0xfea6, 0x11dc, [0x96, 0x72, 0x9a, 0x89, 0x56, 0xd8, 0x95, 0x93]);
interface ITsSbLoadBalanceResult : IUnknown
{
    HRESULT get_TargetName(BSTR*);
}
enum IID_ITsSbTarget = GUID(0x16616ecc, 0x272d, 0x411d, [0xb3, 0x24, 0x12, 0x68, 0x93, 0x3, 0x38, 0x56]);
interface ITsSbTarget : IUnknown
{
    HRESULT get_TargetName(BSTR*);
    HRESULT put_TargetName(BSTR);
    HRESULT get_FarmName(BSTR*);
    HRESULT put_FarmName(BSTR);
    HRESULT get_TargetFQDN(BSTR*);
    HRESULT put_TargetFQDN(BSTR);
    HRESULT get_TargetNetbios(BSTR*);
    HRESULT put_TargetNetbios(BSTR);
    HRESULT get_IpAddresses(TSSD_ConnectionPoint*, uint*);
    HRESULT put_IpAddresses(TSSD_ConnectionPoint*, uint);
    HRESULT get_TargetState(TARGET_STATE*);
    HRESULT put_TargetState(TARGET_STATE);
    HRESULT get_TargetPropertySet(ITsSbTargetPropertySet*);
    HRESULT put_TargetPropertySet(ITsSbTargetPropertySet);
    HRESULT get_EnvironmentName(BSTR*);
    HRESULT put_EnvironmentName(BSTR);
    HRESULT get_NumSessions(uint*);
    HRESULT get_NumPendingConnections(uint*);
    HRESULT get_TargetLoad(uint*);
}
enum IID_ITsSbSession = GUID(0xd453aac7, 0xb1d8, 0x4c5e, [0xba, 0x34, 0x9a, 0xfb, 0x4c, 0x8c, 0x55, 0x10]);
interface ITsSbSession : IUnknown
{
    HRESULT get_SessionId(uint*);
    HRESULT get_TargetName(BSTR*);
    HRESULT put_TargetName(BSTR);
    HRESULT get_Username(BSTR*);
    HRESULT get_Domain(BSTR*);
    HRESULT get_State(TSSESSION_STATE*);
    HRESULT put_State(TSSESSION_STATE);
    HRESULT get_CreateTime(FILETIME*);
    HRESULT put_CreateTime(FILETIME);
    HRESULT get_DisconnectTime(FILETIME*);
    HRESULT put_DisconnectTime(FILETIME);
    HRESULT get_InitialProgram(BSTR*);
    HRESULT put_InitialProgram(BSTR);
    HRESULT get_ClientDisplay(CLIENT_DISPLAY*);
    HRESULT put_ClientDisplay(CLIENT_DISPLAY);
    HRESULT get_ProtocolType(uint*);
    HRESULT put_ProtocolType(uint);
}
enum IID_ITsSbResourceNotification = GUID(0x65d3e85a, 0xc39b, 0x11dc, [0xb9, 0x2d, 0x3c, 0xd2, 0x55, 0xd8, 0x95, 0x93]);
interface ITsSbResourceNotification : IUnknown
{
    HRESULT NotifySessionChange(TSSESSION_STATE, ITsSbSession);
    HRESULT NotifyTargetChange(uint, ITsSbTarget);
    HRESULT NotifyClientConnectionStateChange(CONNECTION_CHANGE_NOTIFICATION, ITsSbClientConnection);
}
enum IID_ITsSbResourceNotificationEx = GUID(0xa8a47fde, 0xca91, 0x44d2, [0xb8, 0x97, 0x3a, 0xa2, 0x8a, 0x43, 0xb2, 0xb7]);
interface ITsSbResourceNotificationEx : IUnknown
{
    HRESULT NotifySessionChangeEx(BSTR, BSTR, BSTR, uint, TSSESSION_STATE);
    HRESULT NotifyTargetChangeEx(BSTR, uint);
    HRESULT NotifyClientConnectionStateChangeEx(BSTR, BSTR, BSTR, BSTR, BSTR, CONNECTION_CHANGE_NOTIFICATION);
}
enum IID_ITsSbTaskInfo = GUID(0x523d1083, 0x89be, 0x48dd, [0x99, 0xea, 0x4, 0xe8, 0x2f, 0xfa, 0x72, 0x65]);
interface ITsSbTaskInfo : IUnknown
{
    HRESULT get_TargetId(BSTR*);
    HRESULT get_StartTime(FILETIME*);
    HRESULT get_EndTime(FILETIME*);
    HRESULT get_Deadline(FILETIME*);
    HRESULT get_Identifier(BSTR*);
    HRESULT get_Label(BSTR*);
    HRESULT get_Context(SAFEARRAY**);
    HRESULT get_Plugin(BSTR*);
    HRESULT get_Status(RDV_TASK_STATUS*);
}
enum IID_ITsSbTaskPlugin = GUID(0xfa22ef0f, 0x8705, 0x41be, [0x93, 0xbc, 0x44, 0xbd, 0xbc, 0xf1, 0xc9, 0xc4]);
interface ITsSbTaskPlugin : ITsSbPlugin
{
    HRESULT InitializeTaskPlugin(ITsSbTaskPluginNotifySink);
    HRESULT SetTaskQueue(BSTR, uint, ITsSbTaskInfo*);
}
enum IID_ITsSbPropertySet = GUID(0x5c025171, 0xbb1e, 0x4baf, [0xa2, 0x12, 0x6d, 0x5e, 0x97, 0x74, 0xb3, 0x3b]);
interface ITsSbPropertySet : IPropertyBag
{
}
enum IID_ITsSbPluginPropertySet = GUID(0x95006e34, 0x7eff, 0x4b6c, [0xbb, 0x40, 0x49, 0xa4, 0xfd, 0xa7, 0xce, 0xa6]);
interface ITsSbPluginPropertySet : ITsSbPropertySet
{
}
enum IID_ITsSbClientConnectionPropertySet = GUID(0xe51995b0, 0x46d6, 0x11dd, [0xaa, 0x21, 0xce, 0xdc, 0x55, 0xd8, 0x95, 0x93]);
interface ITsSbClientConnectionPropertySet : ITsSbPropertySet
{
}
enum IID_ITsSbTargetPropertySet = GUID(0xf7bda5d6, 0x994c, 0x4e11, [0xa0, 0x79, 0x27, 0x63, 0xb6, 0x18, 0x30, 0xac]);
interface ITsSbTargetPropertySet : ITsSbPropertySet
{
}
enum IID_ITsSbEnvironmentPropertySet = GUID(0xd0d1bf7e, 0x7acf, 0x11dd, [0xa2, 0x43, 0xe5, 0x11, 0x56, 0xd8, 0x95, 0x93]);
interface ITsSbEnvironmentPropertySet : ITsSbPropertySet
{
}
enum IID_ITsSbBaseNotifySink = GUID(0x808a6537, 0x1282, 0x4989, [0x9e, 0x9, 0xf4, 0x39, 0x38, 0xb7, 0x17, 0x22]);
interface ITsSbBaseNotifySink : IUnknown
{
    HRESULT OnError(HRESULT);
    HRESULT OnReportStatus(CLIENT_MESSAGE_TYPE, uint);
}
enum IID_ITsSbPluginNotifySink = GUID(0x44dfe30b, 0xc3be, 0x40f5, [0xbf, 0x82, 0x7a, 0x95, 0xbb, 0x79, 0x5a, 0xdf]);
interface ITsSbPluginNotifySink : ITsSbBaseNotifySink
{
    HRESULT OnInitialized(HRESULT);
    HRESULT OnTerminated();
}
enum IID_ITsSbLoadBalancingNotifySink = GUID(0x5f8a8297, 0x3244, 0x4e6a, [0x95, 0x8a, 0x27, 0xc8, 0x22, 0xc1, 0xe1, 0x41]);
interface ITsSbLoadBalancingNotifySink : ITsSbBaseNotifySink
{
    HRESULT OnGetMostSuitableTarget(ITsSbLoadBalanceResult, BOOL);
}
enum IID_ITsSbPlacementNotifySink = GUID(0x68a0c487, 0x2b4f, 0x46c2, [0x94, 0xa1, 0x6c, 0xe6, 0x85, 0x18, 0x36, 0x34]);
interface ITsSbPlacementNotifySink : ITsSbBaseNotifySink
{
    HRESULT OnQueryEnvironmentCompleted(ITsSbEnvironment);
}
enum IID_ITsSbOrchestrationNotifySink = GUID(0x36c37d61, 0x926b, 0x442f, [0xbc, 0xa5, 0x11, 0x8c, 0x6d, 0x50, 0xdc, 0xf2]);
interface ITsSbOrchestrationNotifySink : ITsSbBaseNotifySink
{
    HRESULT OnReadyToConnect(ITsSbTarget);
}
enum IID_ITsSbTaskPluginNotifySink = GUID(0x6aaf899e, 0xc2ec, 0x45ee, [0xaa, 0x37, 0x45, 0xe6, 0x8, 0x95, 0x26, 0x1a]);
interface ITsSbTaskPluginNotifySink : ITsSbBaseNotifySink
{
    HRESULT OnSetTaskTime(BSTR, FILETIME, FILETIME, FILETIME, BSTR, BSTR, BSTR, uint, SAFEARRAY*);
    HRESULT OnDeleteTaskTime(BSTR, BSTR);
    HRESULT OnUpdateTaskStatus(BSTR, BSTR, RDV_TASK_STATUS);
    HRESULT OnReportTasks(BSTR);
}
enum IID_ITsSbClientConnection = GUID(0x18857499, 0xad61, 0x4b1b, [0xb7, 0xdf, 0xcb, 0xcd, 0x41, 0xfb, 0x83, 0x38]);
interface ITsSbClientConnection : IUnknown
{
    HRESULT get_UserName(BSTR*);
    HRESULT get_Domain(BSTR*);
    HRESULT get_InitialProgram(BSTR*);
    HRESULT get_LoadBalanceResult(ITsSbLoadBalanceResult*);
    HRESULT get_FarmName(BSTR*);
    HRESULT PutContext(BSTR, VARIANT, VARIANT*);
    HRESULT GetContext(BSTR, VARIANT*);
    HRESULT get_Environment(ITsSbEnvironment*);
    HRESULT get_ConnectionError();
    HRESULT get_SamUserAccount(BSTR*);
    HRESULT get_ClientConnectionPropertySet(ITsSbClientConnectionPropertySet*);
    HRESULT get_IsFirstAssignment(BOOL*);
    HRESULT get_RdFarmType(RD_FARM_TYPE*);
    HRESULT get_UserSidString(byte**);
    HRESULT GetDisconnectedSession(ITsSbSession*);
}
enum IID_ITsSbProvider = GUID(0x87a4098f, 0x6d7b, 0x44dd, [0xbc, 0x17, 0x8c, 0xe4, 0x4e, 0x37, 0xd, 0x52]);
interface ITsSbProvider : IUnknown
{
    HRESULT CreateTargetObject(BSTR, BSTR, ITsSbTarget*);
    HRESULT CreateLoadBalanceResultObject(BSTR, ITsSbLoadBalanceResult*);
    HRESULT CreateSessionObject(BSTR, BSTR, BSTR, uint, ITsSbSession*);
    HRESULT CreatePluginPropertySet(ITsSbPluginPropertySet*);
    HRESULT CreateTargetPropertySetObject(ITsSbTargetPropertySet*);
    HRESULT CreateEnvironmentObject(BSTR, uint, ITsSbEnvironment*);
    HRESULT GetResourcePluginStore(ITsSbResourcePluginStore*);
    HRESULT GetFilterPluginStore(ITsSbFilterPluginStore*);
    HRESULT RegisterForNotification(uint, BSTR, ITsSbResourceNotification);
    HRESULT UnRegisterForNotification(uint, BSTR);
    HRESULT GetInstanceOfGlobalStore(ITsSbGlobalStore*);
    HRESULT CreateEnvironmentPropertySetObject(ITsSbEnvironmentPropertySet*);
}
enum IID_ITsSbResourcePluginStore = GUID(0x5c38f65f, 0xbcf1, 0x4036, [0xa6, 0xbf, 0x9e, 0x3c, 0xcc, 0xae, 0xb, 0x63]);
interface ITsSbResourcePluginStore : IUnknown
{
    HRESULT QueryTarget(BSTR, BSTR, ITsSbTarget*);
    HRESULT QuerySessionBySessionId(uint, BSTR, ITsSbSession*);
    HRESULT AddTargetToStore(ITsSbTarget);
    HRESULT AddSessionToStore(ITsSbSession);
    HRESULT AddEnvironmentToStore(ITsSbEnvironment);
    HRESULT RemoveEnvironmentFromStore(BSTR, BOOL);
    HRESULT EnumerateFarms(uint*, SAFEARRAY**);
    HRESULT QueryEnvironment(BSTR, ITsSbEnvironment*);
    HRESULT EnumerateEnvironments(uint*, ITsSbEnvironment**);
    HRESULT SaveTarget(ITsSbTarget, BOOL);
    HRESULT SaveEnvironment(ITsSbEnvironment, BOOL);
    HRESULT SaveSession(ITsSbSession);
    HRESULT SetTargetProperty(BSTR, BSTR, VARIANT*);
    HRESULT SetEnvironmentProperty(BSTR, BSTR, VARIANT*);
    HRESULT SetTargetState(BSTR, TARGET_STATE, TARGET_STATE*);
    HRESULT SetSessionState(ITsSbSession);
    HRESULT EnumerateTargets(BSTR, BSTR, TS_SB_SORT_BY, BSTR, uint*, ITsSbTarget**);
    HRESULT EnumerateSessions(BSTR, BSTR, BSTR, BSTR, BSTR, TSSESSION_STATE*, uint*, ITsSbSession**);
    HRESULT GetFarmProperty(BSTR, BSTR, VARIANT*);
    HRESULT DeleteTarget(BSTR, BSTR);
    HRESULT SetTargetPropertyWithVersionCheck(ITsSbTarget, BSTR, VARIANT*);
    HRESULT SetEnvironmentPropertyWithVersionCheck(ITsSbEnvironment, BSTR, VARIANT*);
    HRESULT AcquireTargetLock(BSTR, uint, IUnknown*);
    HRESULT ReleaseTargetLock(IUnknown);
    HRESULT TestAndSetServerState(BSTR, BSTR, TARGET_STATE, TARGET_STATE, TARGET_STATE*);
    HRESULT SetServerWaitingToStart(BSTR, BSTR);
    HRESULT GetServerState(BSTR, BSTR, TARGET_STATE*);
    HRESULT SetServerDrainMode(BSTR, uint);
}
enum IID_ITsSbFilterPluginStore = GUID(0x85b44b0f, 0xed78, 0x413f, [0x97, 0x2, 0xfa, 0x6d, 0x3b, 0x5e, 0xe7, 0x55]);
interface ITsSbFilterPluginStore : IUnknown
{
    HRESULT SaveProperties(ITsSbPropertySet);
    HRESULT EnumerateProperties(ITsSbPropertySet*);
    HRESULT DeleteProperties(BSTR);
}
enum IID_ITsSbGlobalStore = GUID(0x9ab60f7b, 0xbd72, 0x4d9f, [0x8a, 0x3a, 0xa0, 0xea, 0x55, 0x74, 0xe6, 0x35]);
interface ITsSbGlobalStore : IUnknown
{
    HRESULT QueryTarget(BSTR, BSTR, BSTR, ITsSbTarget*);
    HRESULT QuerySessionBySessionId(BSTR, uint, BSTR, ITsSbSession*);
    HRESULT EnumerateFarms(BSTR, uint*, SAFEARRAY**);
    HRESULT EnumerateTargets(BSTR, BSTR, BSTR, uint*, ITsSbTarget**);
    HRESULT EnumerateEnvironmentsByProvider(BSTR, uint*, ITsSbEnvironment**);
    HRESULT EnumerateSessions(BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, TSSESSION_STATE*, uint*, ITsSbSession**);
    HRESULT GetFarmProperty(BSTR, BSTR, VARIANT*);
}
enum IID_ITsSbProvisioningPluginNotifySink = GUID(0xaca87a8e, 0x818b, 0x4581, [0xa0, 0x32, 0x49, 0xc3, 0xdf, 0xb9, 0xc7, 0x1]);
interface ITsSbProvisioningPluginNotifySink : IUnknown
{
    HRESULT OnJobCreated(VM_NOTIFY_INFO*);
    HRESULT OnVirtualMachineStatusChanged(VM_NOTIFY_ENTRY*, VM_NOTIFY_STATUS, HRESULT, BSTR);
    HRESULT OnJobCompleted(HRESULT, BSTR);
    HRESULT OnJobCancelled();
    HRESULT LockVirtualMachine(VM_NOTIFY_ENTRY*);
    HRESULT OnVirtualMachineHostStatusChanged(BSTR, VM_HOST_NOTIFY_STATUS, HRESULT, BSTR);
}
enum IID_ITsSbProvisioning = GUID(0x2f6f0dbb, 0x9e4f, 0x462b, [0x9c, 0x3f, 0xfc, 0xcc, 0x3d, 0xcb, 0x62, 0x32]);
interface ITsSbProvisioning : ITsSbPlugin
{
    HRESULT CreateVirtualMachines(BSTR, BSTR, ITsSbProvisioningPluginNotifySink);
    HRESULT PatchVirtualMachines(BSTR, BSTR, ITsSbProvisioningPluginNotifySink, VM_PATCH_INFO*);
    HRESULT DeleteVirtualMachines(BSTR, BSTR, ITsSbProvisioningPluginNotifySink);
    HRESULT CancelJob(BSTR);
}
enum IID_ITsSbGenericNotifySink = GUID(0x4c4c8c4f, 0x300b, 0x46ad, [0x91, 0x64, 0x84, 0x68, 0xa7, 0xe7, 0x56, 0x8c]);
interface ITsSbGenericNotifySink : IUnknown
{
    HRESULT OnCompleted(HRESULT);
    HRESULT GetWaitTimeout(FILETIME*);
}
struct pluginResource
{
    wchar[256] alias_;
    wchar[256] name;
    PWSTR resourceFileContents;
    wchar[256] fileExtension;
    wchar[256] resourcePluginType;
    ubyte isDiscoverable;
    int resourceType;
    uint pceIconSize;
    ubyte* iconContents;
    uint pcePluginBlobSize;
    ubyte* blobContents;
}
enum IID_ItsPubPlugin = GUID(0x70c04b05, 0xf347, 0x412b, [0x82, 0x2f, 0x36, 0xc9, 0x9c, 0x54, 0xca, 0x45]);
interface ItsPubPlugin : IUnknown
{
    HRESULT GetResourceList(const(wchar)*, int*, pluginResource**);
    HRESULT GetResource(const(wchar)*, int, pluginResource*);
    HRESULT GetCacheLastUpdateTime(ulong*);
    HRESULT get_pluginName(BSTR*);
    HRESULT get_pluginVersion(BSTR*);
    HRESULT ResolveResource(uint*, PWSTR, PWSTR, PWSTR, PWSTR);
}
struct pluginResource2FileAssociation
{
    wchar[256] extName;
    ubyte primaryHandler;
    uint pceIconSize;
    ubyte* iconContents;
}
struct pluginResource2
{
    pluginResource resourceV1;
    uint pceFileAssocListSize;
    pluginResource2FileAssociation* fileAssocList;
    PWSTR securityDescriptor;
    uint pceFolderListSize;
    ushort** folderList;
}
alias TSPUB_PLUGIN_PD_RESOLUTION_TYPE = int;
enum : int
{
    TSPUB_PLUGIN_PD_QUERY_OR_CREATE = 0x00000000,
    TSPUB_PLUGIN_PD_QUERY_EXISTING  = 0x00000001,
}

alias TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE = int;
enum : int
{
    TSPUB_PLUGIN_PD_ASSIGNMENT_NEW      = 0x00000000,
    TSPUB_PLUGIN_PD_ASSIGNMENT_EXISTING = 0x00000001,
}

enum IID_ItsPubPlugin2 = GUID(0xfa4ce418, 0xaad7, 0x4ec6, [0xba, 0xd1, 0xa, 0x32, 0x1b, 0xa4, 0x65, 0xd5]);
interface ItsPubPlugin2 : ItsPubPlugin
{
    HRESULT GetResource2List(const(wchar)*, int*, pluginResource2**);
    HRESULT GetResource2(const(wchar)*, int, pluginResource2*);
    HRESULT ResolvePersonalDesktop(const(wchar)*, const(wchar)*, TSPUB_PLUGIN_PD_RESOLUTION_TYPE, TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE*, PWSTR);
    HRESULT DeletePersonalDesktopAssignment(const(wchar)*, const(wchar)*, const(wchar)*);
}
enum IID_IWorkspaceResTypeRegistry = GUID(0x1d428c79, 0x6e2e, 0x4351, [0xa3, 0x61, 0xc0, 0x40, 0x1a, 0x3, 0xa0, 0xba]);
interface IWorkspaceResTypeRegistry : IDispatch
{
    HRESULT AddResourceType(VARIANT_BOOL, BSTR, BSTR);
    HRESULT DeleteResourceType(VARIANT_BOOL, BSTR);
    HRESULT GetRegisteredFileExtensions(VARIANT_BOOL, SAFEARRAY**);
    HRESULT GetResourceTypeInfo(VARIANT_BOOL, BSTR, BSTR*);
    HRESULT ModifyResourceType(VARIANT_BOOL, BSTR, BSTR);
}
enum IID_IWTSPlugin = GUID(0xa1230201, 0x1439, 0x4e62, [0xa4, 0x14, 0x19, 0xd, 0xa, 0xc3, 0xd4, 0xe]);
interface IWTSPlugin : IUnknown
{
    HRESULT Initialize(IWTSVirtualChannelManager);
    HRESULT Connected();
    HRESULT Disconnected(uint);
    HRESULT Terminated();
}
enum IID_IWTSListener = GUID(0xa1230206, 0x9a39, 0x4d58, [0x86, 0x74, 0xcd, 0xb4, 0xdf, 0xf4, 0xe7, 0x3b]);
interface IWTSListener : IUnknown
{
    HRESULT GetConfiguration(IPropertyBag*);
}
enum IID_IWTSListenerCallback = GUID(0xa1230203, 0xd6a7, 0x11d8, [0xb9, 0xfd, 0x0, 0xb, 0xdb, 0xd1, 0xf1, 0x98]);
interface IWTSListenerCallback : IUnknown
{
    HRESULT OnNewChannelConnection(IWTSVirtualChannel, BSTR, BOOL*, IWTSVirtualChannelCallback*);
}
enum IID_IWTSVirtualChannelCallback = GUID(0xa1230204, 0xd6a7, 0x11d8, [0xb9, 0xfd, 0x0, 0xb, 0xdb, 0xd1, 0xf1, 0x98]);
interface IWTSVirtualChannelCallback : IUnknown
{
    HRESULT OnDataReceived(uint, ubyte*);
    HRESULT OnClose();
}
enum IID_IWTSVirtualChannelManager = GUID(0xa1230205, 0xd6a7, 0x11d8, [0xb9, 0xfd, 0x0, 0xb, 0xdb, 0xd1, 0xf1, 0x98]);
interface IWTSVirtualChannelManager : IUnknown
{
    HRESULT CreateListener(const(char)*, uint, IWTSListenerCallback, IWTSListener*);
}
enum IID_IWTSVirtualChannel = GUID(0xa1230207, 0xd6a7, 0x11d8, [0xb9, 0xfd, 0x0, 0xb, 0xdb, 0xd1, 0xf1, 0x98]);
interface IWTSVirtualChannel : IUnknown
{
    HRESULT Write(uint, ubyte*, IUnknown);
    HRESULT Close();
}
enum IID_IWTSPluginServiceProvider = GUID(0xd3e07363, 0x87c, 0x476c, [0x86, 0xa7, 0xdb, 0xb1, 0x5f, 0x46, 0xdd, 0xb4]);
interface IWTSPluginServiceProvider : IUnknown
{
    HRESULT GetService(GUID, IUnknown*);
}
struct BITMAP_RENDERER_STATISTICS
{
    uint dwFramesDelivered;
    uint dwFramesDropped;
}
enum IID_IWTSBitmapRenderer = GUID(0x5b7acc97, 0xf3c9, 0x46f7, [0x8c, 0x5b, 0xfa, 0x68, 0x5d, 0x34, 0x41, 0xb1]);
interface IWTSBitmapRenderer : IUnknown
{
    HRESULT Render(GUID, uint, uint, int, uint, ubyte*);
    HRESULT GetRendererStatistics(BITMAP_RENDERER_STATISTICS*);
    HRESULT RemoveMapping();
}
enum IID_IWTSBitmapRendererCallback = GUID(0xd782928e, 0xfe4e, 0x4e77, [0xae, 0x90, 0x9c, 0xd0, 0xb3, 0xe3, 0xb3, 0x53]);
interface IWTSBitmapRendererCallback : IUnknown
{
    HRESULT OnTargetSizeChanged(RECT);
}
enum IID_IWTSBitmapRenderService = GUID(0xea326091, 0x5fe, 0x40c1, [0xb4, 0x9c, 0x3d, 0x2e, 0xf4, 0x62, 0x6a, 0xe]);
interface IWTSBitmapRenderService : IUnknown
{
    HRESULT GetMappedRenderer(ulong, IWTSBitmapRendererCallback, IWTSBitmapRenderer*);
}
enum IID_IWRdsGraphicsChannelEvents = GUID(0x67f2368c, 0xd674, 0x4fae, [0x66, 0xa5, 0xd2, 0x6, 0x28, 0xa6, 0x40, 0xd2]);
interface IWRdsGraphicsChannelEvents : IUnknown
{
    HRESULT OnDataReceived(uint, ubyte*);
    HRESULT OnClose();
    HRESULT OnChannelOpened(HRESULT, IUnknown);
    HRESULT OnDataSent(IUnknown, BOOL, ubyte*, uint);
    HRESULT OnMetricsUpdate(uint, uint, ulong);
}
enum IID_IWRdsGraphicsChannel = GUID(0x684b7a0b, 0xedff, 0x43ad, [0xd5, 0xa2, 0x4a, 0x8d, 0x53, 0x88, 0xf4, 0x1]);
interface IWRdsGraphicsChannel : IUnknown
{
    HRESULT Write(uint, ubyte*, IUnknown);
    HRESULT Close();
    HRESULT Open(IWRdsGraphicsChannelEvents, IUnknown);
}
alias WRdsGraphicsChannelType = int;
enum : int
{
    WRdsGraphicsChannelType_GuaranteedDelivery = 0x00000000,
    WRdsGraphicsChannelType_BestEffortDelivery = 0x00000001,
}

enum IID_IWRdsGraphicsChannelManager = GUID(0xfd57159, 0xe83e, 0x476a, [0xa8, 0xb9, 0x4a, 0x79, 0x76, 0xe7, 0x1e, 0x18]);
interface IWRdsGraphicsChannelManager : IUnknown
{
    HRESULT CreateChannel(const(ubyte)*, WRdsGraphicsChannelType, IWRdsGraphicsChannel*);
}
struct RFX_GFX_RECT
{
    align (1):
    int left;
    int top;
    int right;
    int bottom;
}
struct RFX_GFX_MSG_HEADER
{
    align (1):
    ushort uMSGType;
    ushort cbSize;
}
struct RFX_GFX_MONITOR_INFO
{
    align (1):
    int left;
    int top;
    int right;
    int bottom;
    uint physicalWidth;
    uint physicalHeight;
    uint orientation;
    BOOL primary;
}
struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_REQUEST
{
    RFX_GFX_MSG_HEADER channelHdr;
}
struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_RESPONSE
{
    align (1):
    RFX_GFX_MSG_HEADER channelHdr;
    uint reserved;
    uint monitorCount;
    RFX_GFX_MONITOR_INFO[16] MonitorData;
    wchar[32] clientUniqueId;
}
struct RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_NOTIFY
{
    align (1):
    RFX_GFX_MSG_HEADER channelHdr;
    uint ulWidth;
    uint ulHeight;
    uint ulBpp;
    uint Reserved;
}
struct RFX_GFX_MSG_DESKTOP_CONFIG_CHANGE_CONFIRM
{
    RFX_GFX_MSG_HEADER channelHdr;
}
struct RFX_GFX_MSG_DESKTOP_INPUT_RESET
{
    align (1):
    RFX_GFX_MSG_HEADER channelHdr;
    uint ulWidth;
    uint ulHeight;
}
struct RFX_GFX_MSG_DISCONNECT_NOTIFY
{
    align (1):
    RFX_GFX_MSG_HEADER channelHdr;
    uint DisconnectReason;
}
struct RFX_GFX_MSG_DESKTOP_RESEND_REQUEST
{
    RFX_GFX_MSG_HEADER channelHdr;
    RFX_GFX_RECT RedrawRect;
}
struct RFX_GFX_MSG_RDP_DATA
{
    RFX_GFX_MSG_HEADER channelHdr;
    ubyte[1] rdpData;
}
struct WTS_SOCKADDR
{
    ushort sin_family;
    union _u_e__Union
    {
        struct _ipv4_e__Struct
        {
            ushort sin_port;
            uint IN_ADDR;
            ubyte[8] sin_zero;
        }
        struct _ipv6_e__Struct
        {
            ushort sin6_port;
            uint sin6_flowinfo;
            ushort[8] sin6_addr;
            uint sin6_scope_id;
        }
    }
}
struct WTS_SMALL_RECT
{
    short Left;
    short Top;
    short Right;
    short Bottom;
}
alias WTS_RCM_SERVICE_STATE = int;
enum : int
{
    WTS_SERVICE_NONE  = 0x00000000,
    WTS_SERVICE_START = 0x00000001,
    WTS_SERVICE_STOP  = 0x00000002,
}

alias WTS_RCM_DRAIN_STATE = int;
enum : int
{
    WTS_DRAIN_STATE_NONE   = 0x00000000,
    WTS_DRAIN_IN_DRAIN     = 0x00000001,
    WTS_DRAIN_NOT_IN_DRAIN = 0x00000002,
}

struct WTS_SERVICE_STATE
{
    WTS_RCM_SERVICE_STATE RcmServiceState;
    WTS_RCM_DRAIN_STATE RcmDrainState;
}
struct WTS_SESSION_ID
{
    GUID SessionUniqueGuid;
    uint SessionId;
}
struct WTS_USER_CREDENTIAL
{
    wchar[256] UserName;
    wchar[256] Password;
    wchar[256] Domain;
}
struct WTS_SYSTEMTIME
{
    ushort wYear;
    ushort wMonth;
    ushort wDayOfWeek;
    ushort wDay;
    ushort wHour;
    ushort wMinute;
    ushort wSecond;
    ushort wMilliseconds;
}
struct WTS_TIME_ZONE_INFORMATION
{
    int Bias;
    wchar[32] StandardName;
    WTS_SYSTEMTIME StandardDate;
    int StandardBias;
    wchar[32] DaylightName;
    WTS_SYSTEMTIME DaylightDate;
    int DaylightBias;
}
struct WRDS_DYNAMIC_TIME_ZONE_INFORMATION
{
    int Bias;
    wchar[32] StandardName;
    WTS_SYSTEMTIME StandardDate;
    int StandardBias;
    wchar[32] DaylightName;
    WTS_SYSTEMTIME DaylightDate;
    int DaylightBias;
    wchar[128] TimeZoneKeyName;
    ushort DynamicDaylightTimeDisabled;
}
struct WTS_CLIENT_DATA
{
    BOOLEAN fDisableCtrlAltDel;
    BOOLEAN fDoubleClickDetect;
    BOOLEAN fEnableWindowsKey;
    BOOLEAN fHideTitleBar;
    BOOL fInheritAutoLogon;
    BOOLEAN fPromptForPassword;
    BOOLEAN fUsingSavedCreds;
    wchar[256] Domain;
    wchar[256] UserName;
    wchar[256] Password;
    BOOLEAN fPasswordIsScPin;
    BOOL fInheritInitialProgram;
    wchar[257] WorkDirectory;
    wchar[257] InitialProgram;
    BOOLEAN fMaximizeShell;
    ubyte EncryptionLevel;
    uint PerformanceFlags;
    wchar[9] ProtocolName;
    ushort ProtocolType;
    BOOL fInheritColorDepth;
    ushort HRes;
    ushort VRes;
    ushort ColorDepth;
    wchar[9] DisplayDriverName;
    wchar[20] DisplayDeviceName;
    BOOLEAN fMouse;
    uint KeyboardLayout;
    uint KeyboardType;
    uint KeyboardSubType;
    uint KeyboardFunctionKey;
    wchar[33] imeFileName;
    uint ActiveInputLocale;
    BOOLEAN fNoAudioPlayback;
    BOOLEAN fRemoteConsoleAudio;
    wchar[9] AudioDriverName;
    WTS_TIME_ZONE_INFORMATION ClientTimeZone;
    wchar[21] ClientName;
    uint SerialNumber;
    uint ClientAddressFamily;
    wchar[31] ClientAddress;
    WTS_SOCKADDR ClientSockAddress;
    wchar[257] ClientDirectory;
    uint ClientBuildNumber;
    ushort ClientProductId;
    ushort OutBufCountHost;
    ushort OutBufCountClient;
    ushort OutBufLength;
    uint ClientSessionId;
    wchar[33] ClientDigProductId;
    BOOLEAN fDisableCpm;
    BOOLEAN fDisableCdm;
    BOOLEAN fDisableCcm;
    BOOLEAN fDisableLPT;
    BOOLEAN fDisableClip;
    BOOLEAN fDisablePNP;
}
struct WTS_USER_DATA
{
    wchar[257] WorkDirectory;
    wchar[257] InitialProgram;
    WTS_TIME_ZONE_INFORMATION UserTimeZone;
}
struct WTS_POLICY_DATA
{
    BOOLEAN fDisableEncryption;
    BOOLEAN fDisableAutoReconnect;
    uint ColorDepth;
    ubyte MinEncryptionLevel;
    BOOLEAN fDisableCpm;
    BOOLEAN fDisableCdm;
    BOOLEAN fDisableCcm;
    BOOLEAN fDisableLPT;
    BOOLEAN fDisableClip;
    BOOLEAN fDisablePNPRedir;
}
struct WTS_PROTOCOL_CACHE
{
    uint CacheReads;
    uint CacheHits;
}
union WTS_CACHE_STATS_UN
{
    WTS_PROTOCOL_CACHE[4] ProtocolCache;
    uint TShareCacheStats;
    uint[20] Reserved;
}
struct WTS_CACHE_STATS
{
    uint Specific;
    WTS_CACHE_STATS_UN Data;
    ushort ProtocolType;
    ushort Length;
}
struct WTS_PROTOCOL_COUNTERS
{
    uint WdBytes;
    uint WdFrames;
    uint WaitForOutBuf;
    uint Frames;
    uint Bytes;
    uint CompressedBytes;
    uint CompressFlushes;
    uint Errors;
    uint Timeouts;
    uint AsyncFramingError;
    uint AsyncOverrunError;
    uint AsyncOverflowError;
    uint AsyncParityError;
    uint TdErrors;
    ushort ProtocolType;
    ushort Length;
    ushort Specific;
    uint[100] Reserved;
}
struct WTS_PROTOCOL_STATUS
{
    WTS_PROTOCOL_COUNTERS Output;
    WTS_PROTOCOL_COUNTERS Input;
    WTS_CACHE_STATS Cache;
    uint AsyncSignal;
    uint AsyncSignalMask;
    long[100] Counters;
}
struct WTS_DISPLAY_IOCTL
{
    ubyte[256] pDisplayIOCtlData;
    uint cbDisplayIOCtlData;
}
alias WTS_LOGON_ERROR_REDIRECTOR_RESPONSE = int;
enum : int
{
    WTS_LOGON_ERR_INVALID                      = 0x00000000,
    WTS_LOGON_ERR_NOT_HANDLED                  = 0x00000001,
    WTS_LOGON_ERR_HANDLED_SHOW                 = 0x00000002,
    WTS_LOGON_ERR_HANDLED_DONT_SHOW            = 0x00000003,
    WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER = 0x00000004,
}

struct WTS_PROPERTY_VALUE
{
    ushort Type;
    union _u_e__Union
    {
        uint ulVal;
        struct _strVal_e__Struct
        {
            uint size;
            PWSTR pstrVal;
        }
        struct _bVal_e__Struct
        {
            uint size;
            PSTR pbVal;
        }
        GUID guidVal;
    }
}
alias WTS_CERT_TYPE = int;
enum : int
{
    WTS_CERT_TYPE_INVALID     = 0x00000000,
    WTS_CERT_TYPE_PROPRIETORY = 0x00000001,
    WTS_CERT_TYPE_X509        = 0x00000002,
}

struct WTS_LICENSE_CAPABILITIES
{
    uint KeyExchangeAlg;
    uint ProtocolVer;
    BOOL fAuthenticateServer;
    WTS_CERT_TYPE CertType;
    uint cbClientName;
    ubyte[42] rgbClientName;
}
alias WRDS_CONNECTION_SETTING_LEVEL = int;
enum : int
{
    WRDS_CONNECTION_SETTING_LEVEL_INVALID = 0x00000000,
    WRDS_CONNECTION_SETTING_LEVEL_1       = 0x00000001,
}

alias WRDS_LISTENER_SETTING_LEVEL = int;
enum : int
{
    WRDS_LISTENER_SETTING_LEVEL_INVALID = 0x00000000,
    WRDS_LISTENER_SETTING_LEVEL_1       = 0x00000001,
}

alias WRDS_SETTING_TYPE = int;
enum : int
{
    WRDS_SETTING_TYPE_INVALID = 0x00000000,
    WRDS_SETTING_TYPE_MACHINE = 0x00000001,
    WRDS_SETTING_TYPE_USER    = 0x00000002,
    WRDS_SETTING_TYPE_SAM     = 0x00000003,
}

alias WRDS_SETTING_STATUS = int;
enum : int
{
    WRDS_SETTING_STATUS_NOTAPPLICABLE = 0xffffffff,
    WRDS_SETTING_STATUS_DISABLED      = 0x00000000,
    WRDS_SETTING_STATUS_ENABLED       = 0x00000001,
    WRDS_SETTING_STATUS_NOTCONFIGURED = 0x00000002,
}

alias WRDS_SETTING_LEVEL = int;
enum : int
{
    WRDS_SETTING_LEVEL_INVALID = 0x00000000,
    WRDS_SETTING_LEVEL_1       = 0x00000001,
}

struct WRDS_LISTENER_SETTINGS_1
{
    uint MaxProtocolListenerConnectionCount;
    uint SecurityDescriptorSize;
    ubyte* pSecurityDescriptor;
}
union WRDS_LISTENER_SETTING
{
    WRDS_LISTENER_SETTINGS_1 WRdsListenerSettings1;
}
struct WRDS_LISTENER_SETTINGS
{
    WRDS_LISTENER_SETTING_LEVEL WRdsListenerSettingLevel;
    WRDS_LISTENER_SETTING WRdsListenerSetting;
}
struct WRDS_CONNECTION_SETTINGS_1
{
    BOOLEAN fInheritInitialProgram;
    BOOLEAN fInheritColorDepth;
    BOOLEAN fHideTitleBar;
    BOOLEAN fInheritAutoLogon;
    BOOLEAN fMaximizeShell;
    BOOLEAN fDisablePNP;
    BOOLEAN fPasswordIsScPin;
    BOOLEAN fPromptForPassword;
    BOOLEAN fDisableCpm;
    BOOLEAN fDisableCdm;
    BOOLEAN fDisableCcm;
    BOOLEAN fDisableLPT;
    BOOLEAN fDisableClip;
    BOOLEAN fResetBroken;
    BOOLEAN fDisableEncryption;
    BOOLEAN fDisableAutoReconnect;
    BOOLEAN fDisableCtrlAltDel;
    BOOLEAN fDoubleClickDetect;
    BOOLEAN fEnableWindowsKey;
    BOOLEAN fUsingSavedCreds;
    BOOLEAN fMouse;
    BOOLEAN fNoAudioPlayback;
    BOOLEAN fRemoteConsoleAudio;
    ubyte EncryptionLevel;
    ushort ColorDepth;
    ushort ProtocolType;
    ushort HRes;
    ushort VRes;
    ushort ClientProductId;
    ushort OutBufCountHost;
    ushort OutBufCountClient;
    ushort OutBufLength;
    uint KeyboardLayout;
    uint MaxConnectionTime;
    uint MaxDisconnectionTime;
    uint MaxIdleTime;
    uint PerformanceFlags;
    uint KeyboardType;
    uint KeyboardSubType;
    uint KeyboardFunctionKey;
    uint ActiveInputLocale;
    uint SerialNumber;
    uint ClientAddressFamily;
    uint ClientBuildNumber;
    uint ClientSessionId;
    wchar[257] WorkDirectory;
    wchar[257] InitialProgram;
    wchar[256] UserName;
    wchar[256] Domain;
    wchar[256] Password;
    wchar[9] ProtocolName;
    wchar[9] DisplayDriverName;
    wchar[20] DisplayDeviceName;
    wchar[33] imeFileName;
    wchar[9] AudioDriverName;
    wchar[21] ClientName;
    wchar[31] ClientAddress;
    wchar[257] ClientDirectory;
    wchar[33] ClientDigProductId;
    WTS_SOCKADDR ClientSockAddress;
    WTS_TIME_ZONE_INFORMATION ClientTimeZone;
    WRDS_LISTENER_SETTINGS WRdsListenerSettings;
    GUID EventLogActivityId;
    uint ContextSize;
    ubyte* ContextData;
}
struct WRDS_SETTINGS_1
{
    WRDS_SETTING_STATUS WRdsDisableClipStatus;
    uint WRdsDisableClipValue;
    WRDS_SETTING_STATUS WRdsDisableLPTStatus;
    uint WRdsDisableLPTValue;
    WRDS_SETTING_STATUS WRdsDisableCcmStatus;
    uint WRdsDisableCcmValue;
    WRDS_SETTING_STATUS WRdsDisableCdmStatus;
    uint WRdsDisableCdmValue;
    WRDS_SETTING_STATUS WRdsDisableCpmStatus;
    uint WRdsDisableCpmValue;
    WRDS_SETTING_STATUS WRdsDisablePnpStatus;
    uint WRdsDisablePnpValue;
    WRDS_SETTING_STATUS WRdsEncryptionLevelStatus;
    uint WRdsEncryptionValue;
    WRDS_SETTING_STATUS WRdsColorDepthStatus;
    uint WRdsColorDepthValue;
    WRDS_SETTING_STATUS WRdsDisableAutoReconnecetStatus;
    uint WRdsDisableAutoReconnecetValue;
    WRDS_SETTING_STATUS WRdsDisableEncryptionStatus;
    uint WRdsDisableEncryptionValue;
    WRDS_SETTING_STATUS WRdsResetBrokenStatus;
    uint WRdsResetBrokenValue;
    WRDS_SETTING_STATUS WRdsMaxIdleTimeStatus;
    uint WRdsMaxIdleTimeValue;
    WRDS_SETTING_STATUS WRdsMaxDisconnectTimeStatus;
    uint WRdsMaxDisconnectTimeValue;
    WRDS_SETTING_STATUS WRdsMaxConnectTimeStatus;
    uint WRdsMaxConnectTimeValue;
    WRDS_SETTING_STATUS WRdsKeepAliveStatus;
    BOOLEAN WRdsKeepAliveStartValue;
    uint WRdsKeepAliveIntervalValue;
}
union WRDS_CONNECTION_SETTING
{
    WRDS_CONNECTION_SETTINGS_1 WRdsConnectionSettings1;
}
struct WRDS_CONNECTION_SETTINGS
{
    WRDS_CONNECTION_SETTING_LEVEL WRdsConnectionSettingLevel;
    WRDS_CONNECTION_SETTING WRdsConnectionSetting;
}
union WRDS_SETTING
{
    WRDS_SETTINGS_1 WRdsSettings1;
}
struct WRDS_SETTINGS
{
    WRDS_SETTING_TYPE WRdsSettingType;
    WRDS_SETTING_LEVEL WRdsSettingLevel;
    WRDS_SETTING WRdsSetting;
}
enum IID_IWTSProtocolManager = GUID(0xf9eaf6cc, 0xed79, 0x4f01, [0x82, 0x1d, 0x1f, 0x88, 0x1b, 0x9f, 0x66, 0xcc]);
interface IWTSProtocolManager : IUnknown
{
    HRESULT CreateListener(PWSTR, IWTSProtocolListener*);
    HRESULT NotifyServiceStateChange(WTS_SERVICE_STATE*);
    HRESULT NotifySessionOfServiceStart(WTS_SESSION_ID*);
    HRESULT NotifySessionOfServiceStop(WTS_SESSION_ID*);
    HRESULT NotifySessionStateChange(WTS_SESSION_ID*, uint);
}
enum IID_IWTSProtocolListener = GUID(0x23083765, 0x45f0, 0x4394, [0x8f, 0x69, 0x32, 0xb2, 0xbc, 0xe, 0xf4, 0xca]);
interface IWTSProtocolListener : IUnknown
{
    HRESULT StartListen(IWTSProtocolListenerCallback);
    HRESULT StopListen();
}
enum IID_IWTSProtocolListenerCallback = GUID(0x23083765, 0x1a2d, 0x4de2, [0x97, 0xde, 0x4a, 0x35, 0xf2, 0x60, 0xf0, 0xb3]);
interface IWTSProtocolListenerCallback : IUnknown
{
    HRESULT OnConnected(IWTSProtocolConnection, IWTSProtocolConnectionCallback*);
}
enum IID_IWTSProtocolConnection = GUID(0x23083765, 0x9095, 0x4648, [0x98, 0xbf, 0xef, 0x81, 0xc9, 0x14, 0x3, 0x2d]);
interface IWTSProtocolConnection : IUnknown
{
    HRESULT GetLogonErrorRedirector(IWTSProtocolLogonErrorRedirector*);
    HRESULT SendPolicyData(WTS_POLICY_DATA*);
    HRESULT AcceptConnection();
    HRESULT GetClientData(WTS_CLIENT_DATA*);
    HRESULT GetUserCredentials(WTS_USER_CREDENTIAL*);
    HRESULT GetLicenseConnection(IWTSProtocolLicenseConnection*);
    HRESULT AuthenticateClientToSession(WTS_SESSION_ID*);
    HRESULT NotifySessionId(WTS_SESSION_ID*);
    HRESULT GetProtocolHandles(HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*);
    HRESULT ConnectNotify(uint);
    HRESULT IsUserAllowedToLogon(uint, HANDLE_PTR, PWSTR, PWSTR);
    HRESULT SessionArbitrationEnumeration(HANDLE_PTR, BOOL, uint*, uint*);
    HRESULT LogonNotify(HANDLE_PTR, PWSTR, PWSTR, WTS_SESSION_ID*);
    HRESULT GetUserData(WTS_POLICY_DATA*, WTS_USER_DATA*);
    HRESULT DisconnectNotify();
    HRESULT Close();
    HRESULT GetProtocolStatus(WTS_PROTOCOL_STATUS*);
    HRESULT GetLastInputTime(ulong*);
    HRESULT SetErrorInfo(uint);
    HRESULT SendBeep(uint, uint);
    HRESULT CreateVirtualChannel(PSTR, BOOL, uint, ulong*);
    HRESULT QueryProperty(GUID, uint, uint, WTS_PROPERTY_VALUE*, WTS_PROPERTY_VALUE*);
    HRESULT GetShadowConnection(IWTSProtocolShadowConnection*);
}
enum IID_IWTSProtocolConnectionCallback = GUID(0x23083765, 0x75eb, 0x41fe, [0xb4, 0xfb, 0xe0, 0x86, 0x24, 0x2a, 0xfa, 0xf]);
interface IWTSProtocolConnectionCallback : IUnknown
{
    HRESULT OnReady();
    HRESULT BrokenConnection(uint, uint);
    HRESULT StopScreenUpdates();
    HRESULT RedrawWindow(WTS_SMALL_RECT*);
    HRESULT DisplayIOCtl(WTS_DISPLAY_IOCTL*);
}
enum IID_IWTSProtocolShadowConnection = GUID(0xee3b0c14, 0x37fb, 0x456b, [0xba, 0xb3, 0x6d, 0x6c, 0xd5, 0x1e, 0x13, 0xbf]);
interface IWTSProtocolShadowConnection : IUnknown
{
    HRESULT Start(PWSTR, uint, ubyte, ushort, IWTSProtocolShadowCallback);
    HRESULT Stop();
    HRESULT DoTarget(ubyte*, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, PWSTR);
}
enum IID_IWTSProtocolShadowCallback = GUID(0x503a2504, 0xaae5, 0x4ab1, [0x93, 0xe0, 0x6d, 0x1c, 0x4b, 0xc6, 0xf7, 0x1a]);
interface IWTSProtocolShadowCallback : IUnknown
{
    HRESULT StopShadow();
    HRESULT InvokeTargetShadow(PWSTR, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, PWSTR);
}
enum IID_IWTSProtocolLicenseConnection = GUID(0x23083765, 0x178c, 0x4079, [0x8e, 0x4a, 0xfe, 0xa6, 0x49, 0x6a, 0x4d, 0x70]);
interface IWTSProtocolLicenseConnection : IUnknown
{
    HRESULT RequestLicensingCapabilities(WTS_LICENSE_CAPABILITIES*, uint*);
    HRESULT SendClientLicense(ubyte*, uint);
    HRESULT RequestClientLicense(ubyte*, uint, ubyte*, uint*);
    HRESULT ProtocolComplete(uint);
}
enum IID_IWTSProtocolLogonErrorRedirector = GUID(0xfd9b61a7, 0x2916, 0x4627, [0x8d, 0xee, 0x43, 0x28, 0x71, 0x1a, 0xd6, 0xcb]);
interface IWTSProtocolLogonErrorRedirector : IUnknown
{
    HRESULT OnBeginPainting();
    HRESULT RedirectStatus(const(wchar)*, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
    HRESULT RedirectMessage(const(wchar)*, const(wchar)*, uint, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
    HRESULT RedirectLogonError(int, int, const(wchar)*, const(wchar)*, uint, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
}
enum IID_IWRdsProtocolSettings = GUID(0x654a5a6a, 0x2550, 0x47eb, [0xb6, 0xf7, 0xeb, 0xd6, 0x37, 0x47, 0x52, 0x65]);
interface IWRdsProtocolSettings : IUnknown
{
    HRESULT GetSettings(WRDS_SETTING_TYPE, WRDS_SETTING_LEVEL, WRDS_SETTINGS*);
    HRESULT MergeSettings(WRDS_SETTINGS*, WRDS_CONNECTION_SETTING_LEVEL, WRDS_CONNECTION_SETTINGS*);
}
enum IID_IWRdsProtocolManager = GUID(0xdc796967, 0x3abb, 0x40cd, [0xa4, 0x46, 0x10, 0x52, 0x76, 0xb5, 0x89, 0x50]);
interface IWRdsProtocolManager : IUnknown
{
    HRESULT Initialize(IWRdsProtocolSettings, WRDS_SETTINGS*);
    HRESULT CreateListener(PWSTR, IWRdsProtocolListener*);
    HRESULT NotifyServiceStateChange(WTS_SERVICE_STATE*);
    HRESULT NotifySessionOfServiceStart(WTS_SESSION_ID*);
    HRESULT NotifySessionOfServiceStop(WTS_SESSION_ID*);
    HRESULT NotifySessionStateChange(WTS_SESSION_ID*, uint);
    HRESULT NotifySettingsChange(WRDS_SETTINGS*);
    HRESULT Uninitialize();
}
enum IID_IWRdsProtocolListener = GUID(0xfcbc131b, 0xc686, 0x451d, [0xa7, 0x73, 0xe2, 0x79, 0xe2, 0x30, 0xf5, 0x40]);
interface IWRdsProtocolListener : IUnknown
{
    HRESULT GetSettings(WRDS_LISTENER_SETTING_LEVEL, WRDS_LISTENER_SETTINGS*);
    HRESULT StartListen(IWRdsProtocolListenerCallback);
    HRESULT StopListen();
}
enum IID_IWRdsProtocolListenerCallback = GUID(0x3ab27e5b, 0x4449, 0x4dc1, [0xb7, 0x4a, 0x91, 0x62, 0x1d, 0x4f, 0xe9, 0x84]);
interface IWRdsProtocolListenerCallback : IUnknown
{
    HRESULT OnConnected(IWRdsProtocolConnection, WRDS_CONNECTION_SETTINGS*, IWRdsProtocolConnectionCallback*);
}
enum IID_IWRdsProtocolConnection = GUID(0x324ed94f, 0xfdaf, 0x4ff6, [0x81, 0xa8, 0x42, 0xab, 0xe7, 0x55, 0x83, 0xb]);
interface IWRdsProtocolConnection : IUnknown
{
    HRESULT GetLogonErrorRedirector(IWRdsProtocolLogonErrorRedirector*);
    HRESULT AcceptConnection();
    HRESULT GetClientData(WTS_CLIENT_DATA*);
    HRESULT GetClientMonitorData(uint*, uint*);
    HRESULT GetUserCredentials(WTS_USER_CREDENTIAL*);
    HRESULT GetLicenseConnection(IWRdsProtocolLicenseConnection*);
    HRESULT AuthenticateClientToSession(WTS_SESSION_ID*);
    HRESULT NotifySessionId(WTS_SESSION_ID*, HANDLE_PTR);
    HRESULT GetInputHandles(HANDLE_PTR*, HANDLE_PTR*, HANDLE_PTR*);
    HRESULT GetVideoHandle(HANDLE_PTR*);
    HRESULT ConnectNotify(uint);
    HRESULT IsUserAllowedToLogon(uint, HANDLE_PTR, PWSTR, PWSTR);
    HRESULT SessionArbitrationEnumeration(HANDLE_PTR, BOOL, uint*, uint*);
    HRESULT LogonNotify(HANDLE_PTR, PWSTR, PWSTR, WTS_SESSION_ID*, WRDS_CONNECTION_SETTINGS*);
    HRESULT PreDisconnect(uint);
    HRESULT DisconnectNotify();
    HRESULT Close();
    HRESULT GetProtocolStatus(WTS_PROTOCOL_STATUS*);
    HRESULT GetLastInputTime(ulong*);
    HRESULT SetErrorInfo(uint);
    HRESULT CreateVirtualChannel(PSTR, BOOL, uint, ulong*);
    HRESULT QueryProperty(GUID, uint, uint, WTS_PROPERTY_VALUE*, WTS_PROPERTY_VALUE*);
    HRESULT GetShadowConnection(IWRdsProtocolShadowConnection*);
    HRESULT NotifyCommandProcessCreated(uint);
}
enum IID_IWRdsProtocolConnectionCallback = GUID(0xf1d70332, 0xd070, 0x4ef1, [0xa0, 0x88, 0x78, 0x31, 0x35, 0x36, 0xc2, 0xd6]);
interface IWRdsProtocolConnectionCallback : IUnknown
{
    HRESULT OnReady();
    HRESULT BrokenConnection(uint, uint);
    HRESULT StopScreenUpdates();
    HRESULT RedrawWindow(WTS_SMALL_RECT*);
    HRESULT GetConnectionId(uint*);
}
enum IID_IWRdsProtocolShadowConnection = GUID(0x9ae85ce6, 0xcade, 0x4548, [0x8f, 0xeb, 0x99, 0x1, 0x65, 0x97, 0xf6, 0xa]);
interface IWRdsProtocolShadowConnection : IUnknown
{
    HRESULT Start(PWSTR, uint, ubyte, ushort, IWRdsProtocolShadowCallback);
    HRESULT Stop();
    HRESULT DoTarget(ubyte*, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, PWSTR);
}
enum IID_IWRdsProtocolShadowCallback = GUID(0xe0667ce0, 0x372, 0x40d6, [0xad, 0xb2, 0xa0, 0xf3, 0x32, 0x26, 0x74, 0xd6]);
interface IWRdsProtocolShadowCallback : IUnknown
{
    HRESULT StopShadow();
    HRESULT InvokeTargetShadow(PWSTR, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, ubyte*, uint, PWSTR);
}
enum IID_IWRdsProtocolLicenseConnection = GUID(0x1d6a145f, 0xd095, 0x4424, [0x95, 0x7a, 0x40, 0x7f, 0xae, 0x82, 0x2d, 0x84]);
interface IWRdsProtocolLicenseConnection : IUnknown
{
    HRESULT RequestLicensingCapabilities(WTS_LICENSE_CAPABILITIES*, uint*);
    HRESULT SendClientLicense(ubyte*, uint);
    HRESULT RequestClientLicense(ubyte*, uint, ubyte*, uint*);
    HRESULT ProtocolComplete(uint);
}
enum IID_IWRdsProtocolLogonErrorRedirector = GUID(0x519fe83b, 0x142a, 0x4120, [0xa3, 0xd5, 0xa4, 0x5, 0xd3, 0x15, 0x28, 0x1a]);
interface IWRdsProtocolLogonErrorRedirector : IUnknown
{
    HRESULT OnBeginPainting();
    HRESULT RedirectStatus(const(wchar)*, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
    HRESULT RedirectMessage(const(wchar)*, const(wchar)*, uint, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
    HRESULT RedirectLogonError(int, int, const(wchar)*, const(wchar)*, uint, WTS_LOGON_ERROR_REDIRECTOR_RESPONSE*);
}
enum IID_IWRdsWddmIddProps = GUID(0x1382df4d, 0xa289, 0x43d1, [0xa1, 0x84, 0x14, 0x47, 0x26, 0xf9, 0xaf, 0x90]);
interface IWRdsWddmIddProps : IUnknown
{
    HRESULT GetHardwareId(PWSTR, uint);
    HRESULT OnDriverLoad(uint, HANDLE_PTR);
    HRESULT OnDriverUnload(uint);
    HRESULT EnableWddmIdd(BOOL);
}
enum IID_IWRdsProtocolConnectionSettings = GUID(0x83fcf5d3, 0xf6f4, 0xea94, [0x9c, 0xd2, 0x32, 0xf2, 0x80, 0xe1, 0xe5, 0x10]);
interface IWRdsProtocolConnectionSettings : IUnknown
{
    HRESULT SetConnectionSetting(GUID, WTS_PROPERTY_VALUE*);
    HRESULT GetConnectionSetting(GUID, WTS_PROPERTY_VALUE*);
}
enum IID_IWRdsEnhancedFastReconnectArbitrator = GUID(0x5718ae9b, 0x47f2, 0x499f, [0xb6, 0x34, 0xd8, 0x17, 0x5b, 0xd5, 0x11, 0x31]);
interface IWRdsEnhancedFastReconnectArbitrator : IUnknown
{
    HRESULT GetSessionForEnhancedFastReconnect(int*, uint, int*);
}
alias PasswordEncodingType = int;
enum : int
{
    PasswordEncodingUTF8    = 0x00000000,
    PasswordEncodingUTF16LE = 0x00000001,
    PasswordEncodingUTF16BE = 0x00000002,
}

enum IID_IRemoteDesktopClientSettings = GUID(0x48a0f2a7, 0x2713, 0x431f, [0xbb, 0xac, 0x6f, 0x45, 0x58, 0xe7, 0xd6, 0x4d]);
interface IRemoteDesktopClientSettings : IDispatch
{
    HRESULT ApplySettings(BSTR);
    HRESULT RetrieveSettings(BSTR*);
    HRESULT GetRdpProperty(BSTR, VARIANT*);
    HRESULT SetRdpProperty(BSTR, VARIANT);
}
alias RemoteActionType = int;
enum : int
{
    RemoteActionCharms      = 0x00000000,
    RemoteActionAppbar      = 0x00000001,
    RemoteActionSnap        = 0x00000002,
    RemoteActionStartScreen = 0x00000003,
    RemoteActionAppSwitch   = 0x00000004,
}

alias SnapshotEncodingType = int;
enum : int
{
    SnapshotEncodingDataUri = 0x00000000,
}

alias SnapshotFormatType = int;
enum : int
{
    SnapshotFormatPng  = 0x00000000,
    SnapshotFormatJpeg = 0x00000001,
    SnapshotFormatBmp  = 0x00000002,
}

enum IID_IRemoteDesktopClientActions = GUID(0x7d54bc4e, 0x1028, 0x45d4, [0x8b, 0xa, 0xb9, 0xb6, 0xbf, 0xfb, 0xa1, 0x76]);
interface IRemoteDesktopClientActions : IDispatch
{
    HRESULT SuspendScreenUpdates();
    HRESULT ResumeScreenUpdates();
    HRESULT ExecuteRemoteAction(RemoteActionType);
    HRESULT GetSnapshot(SnapshotEncodingType, SnapshotFormatType, uint, uint, BSTR*);
}
enum IID_IRemoteDesktopClientTouchPointer = GUID(0x260ec22d, 0x8cbc, 0x44b5, [0x9e, 0x88, 0x2a, 0x37, 0xf6, 0xc9, 0x3a, 0xe9]);
interface IRemoteDesktopClientTouchPointer : IDispatch
{
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_EventsEnabled(VARIANT_BOOL);
    HRESULT get_EventsEnabled(VARIANT_BOOL*);
    HRESULT put_PointerSpeed(uint);
    HRESULT get_PointerSpeed(uint*);
}
alias KeyCombinationType = int;
enum : int
{
    KeyCombinationHome   = 0x00000000,
    KeyCombinationLeft   = 0x00000001,
    KeyCombinationUp     = 0x00000002,
    KeyCombinationRight  = 0x00000003,
    KeyCombinationDown   = 0x00000004,
    KeyCombinationScroll = 0x00000005,
}

enum IID_IRemoteDesktopClient = GUID(0x57d25668, 0x625a, 0x4905, [0xbe, 0x4e, 0x30, 0x4c, 0xaa, 0x13, 0xf8, 0x9c]);
interface IRemoteDesktopClient : IDispatch
{
    HRESULT Connect();
    HRESULT Disconnect();
    HRESULT Reconnect(uint, uint);
    HRESULT get_Settings(IRemoteDesktopClientSettings*);
    HRESULT get_Actions(IRemoteDesktopClientActions*);
    HRESULT get_TouchPointer(IRemoteDesktopClientTouchPointer*);
    HRESULT DeleteSavedCredentials(BSTR);
    HRESULT UpdateSessionDisplaySettings(uint, uint);
    HRESULT attachEvent(BSTR, IDispatch);
    HRESULT detachEvent(BSTR, IDispatch);
}
enum IID_IRemoteSystemAdditionalInfoProvider = GUID(0xeeaa3d5f, 0xec63, 0x4d27, [0xaf, 0x38, 0xe8, 0x6b, 0x1d, 0x72, 0x92, 0xcb]);
interface IRemoteSystemAdditionalInfoProvider : IUnknown
{
    HRESULT GetAdditionalInfo(HSTRING*, const(GUID)*, void**);
}
struct WTSSESSION_NOTIFICATION
{
    uint cbSize;
    uint dwSessionId;
}
