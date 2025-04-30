module windows.win32.system.realtimecommunications;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT, VARIANT_BOOL;
import windows.win32.media.directshow : IVideoWindow;
import windows.win32.networking.winsock : TRANSPORT_SETTING_ID;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum RTCCS_FORCE_PROFILE = 0x00000001;
enum RTCCS_FAIL_ON_REDIRECT = 0x00000002;
enum RTCMT_AUDIO_SEND = 0x00000001;
enum RTCMT_AUDIO_RECEIVE = 0x00000002;
enum RTCMT_VIDEO_SEND = 0x00000004;
enum RTCMT_VIDEO_RECEIVE = 0x00000008;
enum RTCMT_T120_SENDRECV = 0x00000010;
enum RTCSI_PC_TO_PC = 0x00000001;
enum RTCSI_PC_TO_PHONE = 0x00000002;
enum RTCSI_PHONE_TO_PHONE = 0x00000004;
enum RTCSI_IM = 0x00000008;
enum RTCSI_MULTIPARTY_IM = 0x00000010;
enum RTCSI_APPLICATION = 0x00000020;
enum RTCTR_UDP = 0x00000001;
enum RTCTR_TCP = 0x00000002;
enum RTCTR_TLS = 0x00000004;
enum RTCAU_BASIC = 0x00000001;
enum RTCAU_DIGEST = 0x00000002;
enum RTCAU_NTLM = 0x00000004;
enum RTCAU_KERBEROS = 0x00000008;
enum RTCAU_USE_LOGON_CRED = 0x00010000;
enum RTCRF_REGISTER_INVITE_SESSIONS = 0x00000001;
enum RTCRF_REGISTER_MESSAGE_SESSIONS = 0x00000002;
enum RTCRF_REGISTER_PRESENCE = 0x00000004;
enum RTCRF_REGISTER_NOTIFY = 0x00000008;
enum RTCRF_REGISTER_ALL = 0x0000000f;
enum RTCRMF_BUDDY_ROAMING = 0x00000001;
enum RTCRMF_WATCHER_ROAMING = 0x00000002;
enum RTCRMF_PRESENCE_ROAMING = 0x00000004;
enum RTCRMF_PROFILE_ROAMING = 0x00000008;
enum RTCRMF_ALL_ROAMING = 0x0000000f;
enum RTCEF_CLIENT = 0x00000001;
enum RTCEF_REGISTRATION_STATE_CHANGE = 0x00000002;
enum RTCEF_SESSION_STATE_CHANGE = 0x00000004;
enum RTCEF_SESSION_OPERATION_COMPLETE = 0x00000008;
enum RTCEF_PARTICIPANT_STATE_CHANGE = 0x00000010;
enum RTCEF_MEDIA = 0x00000020;
enum RTCEF_INTENSITY = 0x00000040;
enum RTCEF_MESSAGING = 0x00000080;
enum RTCEF_BUDDY = 0x00000100;
enum RTCEF_WATCHER = 0x00000200;
enum RTCEF_PROFILE = 0x00000400;
enum RTCEF_USERSEARCH = 0x00000800;
enum RTCEF_INFO = 0x00001000;
enum RTCEF_GROUP = 0x00002000;
enum RTCEF_MEDIA_REQUEST = 0x00004000;
enum RTCEF_ROAMING = 0x00010000;
enum RTCEF_PRESENCE_PROPERTY = 0x00020000;
enum RTCEF_BUDDY2 = 0x00040000;
enum RTCEF_WATCHER2 = 0x00080000;
enum RTCEF_SESSION_REFER_STATUS = 0x00100000;
enum RTCEF_SESSION_REFERRED = 0x00200000;
enum RTCEF_REINVITE = 0x00400000;
enum RTCEF_PRESENCE_DATA = 0x00800000;
enum RTCEF_PRESENCE_STATUS = 0x01000000;
enum RTCEF_ALL = 0x01ffffff;
enum RTCIF_DISABLE_MEDIA = 0x00000001;
enum RTCIF_DISABLE_UPNP = 0x00000002;
enum RTCIF_ENABLE_SERVER_CLASS = 0x00000004;
enum RTCIF_DISABLE_STRICT_DNS = 0x00000008;
enum FACILITY_RTC_INTERFACE = 0x000000ee;
enum FACILITY_SIP_STATUS_CODE = 0x000000ef;
enum FACILITY_PINT_STATUS_CODE = 0x000000f0;
enum STATUS_SEVERITY_RTC_ERROR = 0x00000002;
enum RTC_E_SIP_CODECS_DO_NOT_MATCH = 0xffffffff80ee0000;
enum RTC_E_SIP_STREAM_PRESENT = 0xffffffff80ee0001;
enum RTC_E_SIP_STREAM_NOT_PRESENT = 0xffffffff80ee0002;
enum RTC_E_SIP_NO_STREAM = 0xffffffff80ee0003;
enum RTC_E_SIP_PARSE_FAILED = 0xffffffff80ee0004;
enum RTC_E_SIP_HEADER_NOT_PRESENT = 0xffffffff80ee0005;
enum RTC_E_SDP_NOT_PRESENT = 0xffffffff80ee0006;
enum RTC_E_SDP_PARSE_FAILED = 0xffffffff80ee0007;
enum RTC_E_SDP_UPDATE_FAILED = 0xffffffff80ee0008;
enum RTC_E_SDP_MULTICAST = 0xffffffff80ee0009;
enum RTC_E_SDP_CONNECTION_ADDR = 0xffffffff80ee000a;
enum RTC_E_SDP_NO_MEDIA = 0xffffffff80ee000b;
enum RTC_E_SIP_TIMEOUT = 0xffffffff80ee000c;
enum RTC_E_SDP_FAILED_TO_BUILD = 0xffffffff80ee000d;
enum RTC_E_SIP_INVITE_TRANSACTION_PENDING = 0xffffffff80ee000e;
enum RTC_E_SIP_AUTH_HEADER_SENT = 0xffffffff80ee000f;
enum RTC_E_SIP_AUTH_TYPE_NOT_SUPPORTED = 0xffffffff80ee0010;
enum RTC_E_SIP_AUTH_FAILED = 0xffffffff80ee0011;
enum RTC_E_INVALID_SIP_URL = 0xffffffff80ee0012;
enum RTC_E_DESTINATION_ADDRESS_LOCAL = 0xffffffff80ee0013;
enum RTC_E_INVALID_ADDRESS_LOCAL = 0xffffffff80ee0014;
enum RTC_E_DESTINATION_ADDRESS_MULTICAST = 0xffffffff80ee0015;
enum RTC_E_INVALID_PROXY_ADDRESS = 0xffffffff80ee0016;
enum RTC_E_SIP_TRANSPORT_NOT_SUPPORTED = 0xffffffff80ee0017;
enum RTC_E_SIP_NEED_MORE_DATA = 0xffffffff80ee0018;
enum RTC_E_SIP_CALL_DISCONNECTED = 0xffffffff80ee0019;
enum RTC_E_SIP_REQUEST_DESTINATION_ADDR_NOT_PRESENT = 0xffffffff80ee001a;
enum RTC_E_SIP_UDP_SIZE_EXCEEDED = 0xffffffff80ee001b;
enum RTC_E_SIP_SSL_TUNNEL_FAILED = 0xffffffff80ee001c;
enum RTC_E_SIP_SSL_NEGOTIATION_TIMEOUT = 0xffffffff80ee001d;
enum RTC_E_SIP_STACK_SHUTDOWN = 0xffffffff80ee001e;
enum RTC_E_MEDIA_CONTROLLER_STATE = 0xffffffff80ee001f;
enum RTC_E_MEDIA_NEED_TERMINAL = 0xffffffff80ee0020;
enum RTC_E_MEDIA_AUDIO_DEVICE_NOT_AVAILABLE = 0xffffffff80ee0021;
enum RTC_E_MEDIA_VIDEO_DEVICE_NOT_AVAILABLE = 0xffffffff80ee0022;
enum RTC_E_START_STREAM = 0xffffffff80ee0023;
enum RTC_E_MEDIA_AEC = 0xffffffff80ee0024;
enum RTC_E_CLIENT_NOT_INITIALIZED = 0xffffffff80ee0025;
enum RTC_E_CLIENT_ALREADY_INITIALIZED = 0xffffffff80ee0026;
enum RTC_E_CLIENT_ALREADY_SHUT_DOWN = 0xffffffff80ee0027;
enum RTC_E_PRESENCE_NOT_ENABLED = 0xffffffff80ee0028;
enum RTC_E_INVALID_SESSION_TYPE = 0xffffffff80ee0029;
enum RTC_E_INVALID_SESSION_STATE = 0xffffffff80ee002a;
enum RTC_E_NO_PROFILE = 0xffffffff80ee002b;
enum RTC_E_LOCAL_PHONE_NEEDED = 0xffffffff80ee002c;
enum RTC_E_NO_DEVICE = 0xffffffff80ee002d;
enum RTC_E_INVALID_PROFILE = 0xffffffff80ee002e;
enum RTC_E_PROFILE_NO_PROVISION = 0xffffffff80ee002f;
enum RTC_E_PROFILE_NO_KEY = 0xffffffff80ee0030;
enum RTC_E_PROFILE_NO_NAME = 0xffffffff80ee0031;
enum RTC_E_PROFILE_NO_USER = 0xffffffff80ee0032;
enum RTC_E_PROFILE_NO_USER_URI = 0xffffffff80ee0033;
enum RTC_E_PROFILE_NO_SERVER = 0xffffffff80ee0034;
enum RTC_E_PROFILE_NO_SERVER_ADDRESS = 0xffffffff80ee0035;
enum RTC_E_PROFILE_NO_SERVER_PROTOCOL = 0xffffffff80ee0036;
enum RTC_E_PROFILE_INVALID_SERVER_PROTOCOL = 0xffffffff80ee0037;
enum RTC_E_PROFILE_INVALID_SERVER_AUTHMETHOD = 0xffffffff80ee0038;
enum RTC_E_PROFILE_INVALID_SERVER_ROLE = 0xffffffff80ee0039;
enum RTC_E_PROFILE_MULTIPLE_REGISTRARS = 0xffffffff80ee003a;
enum RTC_E_PROFILE_INVALID_SESSION = 0xffffffff80ee003b;
enum RTC_E_PROFILE_INVALID_SESSION_PARTY = 0xffffffff80ee003c;
enum RTC_E_PROFILE_INVALID_SESSION_TYPE = 0xffffffff80ee003d;
enum RTC_E_OPERATION_WITH_TOO_MANY_PARTICIPANTS = 0xffffffff80ee003e;
enum RTC_E_BASIC_AUTH_SET_TLS = 0xffffffff80ee003f;
enum RTC_E_SIP_HIGH_SECURITY_SET_TLS = 0xffffffff80ee0040;
enum RTC_S_ROAMING_NOT_SUPPORTED = 0x00ee0041;
enum RTC_E_PROFILE_SERVER_UNAUTHORIZED = 0xffffffff80ee0042;
enum RTC_E_DUPLICATE_REALM = 0xffffffff80ee0043;
enum RTC_E_POLICY_NOT_ALLOW = 0xffffffff80ee0044;
enum RTC_E_PORT_MAPPING_UNAVAILABLE = 0xffffffff80ee0045;
enum RTC_E_PORT_MAPPING_FAILED = 0xffffffff80ee0046;
enum RTC_E_SECURITY_LEVEL_NOT_COMPATIBLE = 0xffffffff80ee0047;
enum RTC_E_SECURITY_LEVEL_NOT_DEFINED = 0xffffffff80ee0048;
enum RTC_E_SECURITY_LEVEL_NOT_SUPPORTED_BY_PARTICIPANT = 0xffffffff80ee0049;
enum RTC_E_DUPLICATE_BUDDY = 0xffffffff80ee004a;
enum RTC_E_DUPLICATE_WATCHER = 0xffffffff80ee004b;
enum RTC_E_MALFORMED_XML = 0xffffffff80ee004c;
enum RTC_E_ROAMING_OPERATION_INTERRUPTED = 0xffffffff80ee004d;
enum RTC_E_ROAMING_FAILED = 0xffffffff80ee004e;
enum RTC_E_INVALID_BUDDY_LIST = 0xffffffff80ee004f;
enum RTC_E_INVALID_ACL_LIST = 0xffffffff80ee0050;
enum RTC_E_NO_GROUP = 0xffffffff80ee0051;
enum RTC_E_DUPLICATE_GROUP = 0xffffffff80ee0052;
enum RTC_E_TOO_MANY_GROUPS = 0xffffffff80ee0053;
enum RTC_E_NO_BUDDY = 0xffffffff80ee0054;
enum RTC_E_NO_WATCHER = 0xffffffff80ee0055;
enum RTC_E_NO_REALM = 0xffffffff80ee0056;
enum RTC_E_NO_TRANSPORT = 0xffffffff80ee0057;
enum RTC_E_NOT_EXIST = 0xffffffff80ee0058;
enum RTC_E_INVALID_PREFERENCE_LIST = 0xffffffff80ee0059;
enum RTC_E_MAX_PENDING_OPERATIONS = 0xffffffff80ee005a;
enum RTC_E_TOO_MANY_RETRIES = 0xffffffff80ee005b;
enum RTC_E_INVALID_PORTRANGE = 0xffffffff80ee005c;
enum RTC_E_SIP_CALL_CONNECTION_NOT_ESTABLISHED = 0xffffffff80ee005d;
enum RTC_E_SIP_ADDITIONAL_PARTY_IN_TWO_PARTY_SESSION = 0xffffffff80ee005e;
enum RTC_E_SIP_PARTY_ALREADY_IN_SESSION = 0xffffffff80ee005f;
enum RTC_E_SIP_OTHER_PARTY_JOIN_IN_PROGRESS = 0xffffffff80ee0060;
enum RTC_E_INVALID_OBJECT_STATE = 0xffffffff80ee0061;
enum RTC_E_PRESENCE_ENABLED = 0xffffffff80ee0062;
enum RTC_E_ROAMING_ENABLED = 0xffffffff80ee0063;
enum RTC_E_SIP_TLS_INCOMPATIBLE_ENCRYPTION = 0xffffffff80ee0064;
enum RTC_E_SIP_INVALID_CERTIFICATE = 0xffffffff80ee0065;
enum RTC_E_SIP_DNS_FAIL = 0xffffffff80ee0066;
enum RTC_E_SIP_TCP_FAIL = 0xffffffff80ee0067;
enum RTC_E_TOO_SMALL_EXPIRES_VALUE = 0xffffffff80ee0068;
enum RTC_E_SIP_TLS_FAIL = 0xffffffff80ee0069;
enum RTC_E_NOT_PRESENCE_PROFILE = 0xffffffff80ee006a;
enum RTC_E_SIP_INVITEE_PARTY_TIMEOUT = 0xffffffff80ee006b;
enum RTC_E_SIP_AUTH_TIME_SKEW = 0xffffffff80ee006c;
enum RTC_E_INVALID_REGISTRATION_STATE = 0xffffffff80ee006d;
enum RTC_E_MEDIA_DISABLED = 0xffffffff80ee006e;
enum RTC_E_MEDIA_ENABLED = 0xffffffff80ee006f;
enum RTC_E_REFER_NOT_ACCEPTED = 0xffffffff80ee0070;
enum RTC_E_REFER_NOT_ALLOWED = 0xffffffff80ee0071;
enum RTC_E_REFER_NOT_EXIST = 0xffffffff80ee0072;
enum RTC_E_SIP_HOLD_OPERATION_PENDING = 0xffffffff80ee0073;
enum RTC_E_SIP_UNHOLD_OPERATION_PENDING = 0xffffffff80ee0074;
enum RTC_E_MEDIA_SESSION_NOT_EXIST = 0xffffffff80ee0075;
enum RTC_E_MEDIA_SESSION_IN_HOLD = 0xffffffff80ee0076;
enum RTC_E_ANOTHER_MEDIA_SESSION_ACTIVE = 0xffffffff80ee0077;
enum RTC_E_MAX_REDIRECTS = 0xffffffff80ee0078;
enum RTC_E_REDIRECT_PROCESSING_FAILED = 0xffffffff80ee0079;
enum RTC_E_LISTENING_SOCKET_NOT_EXIST = 0xffffffff80ee007a;
enum RTC_E_INVALID_LISTEN_SOCKET = 0xffffffff80ee007b;
enum RTC_E_PORT_MANAGER_ALREADY_SET = 0xffffffff80ee007c;
enum RTC_E_SECURITY_LEVEL_ALREADY_SET = 0xffffffff80ee007d;
enum RTC_E_UDP_NOT_SUPPORTED = 0xffffffff80ee007e;
enum RTC_E_SIP_REFER_OPERATION_PENDING = 0xffffffff80ee007f;
enum RTC_E_PLATFORM_NOT_SUPPORTED = 0xffffffff80ee0080;
enum RTC_E_SIP_PEER_PARTICIPANT_IN_MULTIPARTY_SESSION = 0xffffffff80ee0081;
enum RTC_E_NOT_ALLOWED = 0xffffffff80ee0082;
enum RTC_E_REGISTRATION_DEACTIVATED = 0xffffffff80ee0083;
enum RTC_E_REGISTRATION_REJECTED = 0xffffffff80ee0084;
enum RTC_E_REGISTRATION_UNREGISTERED = 0xffffffff80ee0085;
enum RTC_E_STATUS_INFO_TRYING = 0x00ef0064;
enum RTC_E_STATUS_INFO_RINGING = 0x00ef00b4;
enum RTC_E_STATUS_INFO_CALL_FORWARDING = 0x00ef00b5;
enum RTC_E_STATUS_INFO_QUEUED = 0x00ef00b6;
enum RTC_E_STATUS_SESSION_PROGRESS = 0x00ef00b7;
enum RTC_E_STATUS_SUCCESS = 0x00ef00c8;
enum RTC_E_STATUS_REDIRECT_MULTIPLE_CHOICES = 0xffffffff80ef012c;
enum RTC_E_STATUS_REDIRECT_MOVED_PERMANENTLY = 0xffffffff80ef012d;
enum RTC_E_STATUS_REDIRECT_MOVED_TEMPORARILY = 0xffffffff80ef012e;
enum RTC_E_STATUS_REDIRECT_SEE_OTHER = 0xffffffff80ef012f;
enum RTC_E_STATUS_REDIRECT_USE_PROXY = 0xffffffff80ef0131;
enum RTC_E_STATUS_REDIRECT_ALTERNATIVE_SERVICE = 0xffffffff80ef017c;
enum RTC_E_STATUS_CLIENT_BAD_REQUEST = 0xffffffff80ef0190;
enum RTC_E_STATUS_CLIENT_UNAUTHORIZED = 0xffffffff80ef0191;
enum RTC_E_STATUS_CLIENT_PAYMENT_REQUIRED = 0xffffffff80ef0192;
enum RTC_E_STATUS_CLIENT_FORBIDDEN = 0xffffffff80ef0193;
enum RTC_E_STATUS_CLIENT_NOT_FOUND = 0xffffffff80ef0194;
enum RTC_E_STATUS_CLIENT_METHOD_NOT_ALLOWED = 0xffffffff80ef0195;
enum RTC_E_STATUS_CLIENT_NOT_ACCEPTABLE = 0xffffffff80ef0196;
enum RTC_E_STATUS_CLIENT_PROXY_AUTHENTICATION_REQUIRED = 0xffffffff80ef0197;
enum RTC_E_STATUS_CLIENT_REQUEST_TIMEOUT = 0xffffffff80ef0198;
enum RTC_E_STATUS_CLIENT_CONFLICT = 0xffffffff80ef0199;
enum RTC_E_STATUS_CLIENT_GONE = 0xffffffff80ef019a;
enum RTC_E_STATUS_CLIENT_LENGTH_REQUIRED = 0xffffffff80ef019b;
enum RTC_E_STATUS_CLIENT_REQUEST_ENTITY_TOO_LARGE = 0xffffffff80ef019d;
enum RTC_E_STATUS_CLIENT_REQUEST_URI_TOO_LARGE = 0xffffffff80ef019e;
enum RTC_E_STATUS_CLIENT_UNSUPPORTED_MEDIA_TYPE = 0xffffffff80ef019f;
enum RTC_E_STATUS_CLIENT_BAD_EXTENSION = 0xffffffff80ef01a4;
enum RTC_E_STATUS_CLIENT_TEMPORARILY_NOT_AVAILABLE = 0xffffffff80ef01e0;
enum RTC_E_STATUS_CLIENT_TRANSACTION_DOES_NOT_EXIST = 0xffffffff80ef01e1;
enum RTC_E_STATUS_CLIENT_LOOP_DETECTED = 0xffffffff80ef01e2;
enum RTC_E_STATUS_CLIENT_TOO_MANY_HOPS = 0xffffffff80ef01e3;
enum RTC_E_STATUS_CLIENT_ADDRESS_INCOMPLETE = 0xffffffff80ef01e4;
enum RTC_E_STATUS_CLIENT_AMBIGUOUS = 0xffffffff80ef01e5;
enum RTC_E_STATUS_CLIENT_BUSY_HERE = 0xffffffff80ef01e6;
enum RTC_E_STATUS_REQUEST_TERMINATED = 0xffffffff80ef01e7;
enum RTC_E_STATUS_NOT_ACCEPTABLE_HERE = 0xffffffff80ef01e8;
enum RTC_E_STATUS_SERVER_INTERNAL_ERROR = 0xffffffff80ef01f4;
enum RTC_E_STATUS_SERVER_NOT_IMPLEMENTED = 0xffffffff80ef01f5;
enum RTC_E_STATUS_SERVER_BAD_GATEWAY = 0xffffffff80ef01f6;
enum RTC_E_STATUS_SERVER_SERVICE_UNAVAILABLE = 0xffffffff80ef01f7;
enum RTC_E_STATUS_SERVER_SERVER_TIMEOUT = 0xffffffff80ef01f8;
enum RTC_E_STATUS_SERVER_VERSION_NOT_SUPPORTED = 0xffffffff80ef01f9;
enum RTC_E_STATUS_GLOBAL_BUSY_EVERYWHERE = 0xffffffff80ef0258;
enum RTC_E_STATUS_GLOBAL_DECLINE = 0xffffffff80ef025b;
enum RTC_E_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE = 0xffffffff80ef025c;
enum RTC_E_STATUS_GLOBAL_NOT_ACCEPTABLE = 0xffffffff80ef025e;
enum RTC_E_PINT_STATUS_REJECTED_BUSY = 0xffffffff80f00005;
enum RTC_E_PINT_STATUS_REJECTED_NO_ANSWER = 0xffffffff80f00006;
enum RTC_E_PINT_STATUS_REJECTED_ALL_BUSY = 0xffffffff80f00007;
enum RTC_E_PINT_STATUS_REJECTED_PL_FAILED = 0xffffffff80f00008;
enum RTC_E_PINT_STATUS_REJECTED_SW_FAILED = 0xffffffff80f00009;
enum RTC_E_PINT_STATUS_REJECTED_CANCELLED = 0xffffffff80f0000a;
enum RTC_E_PINT_STATUS_REJECTED_BADNUMBER = 0xffffffff80f0000b;
alias RTC_AUDIO_DEVICE = int;
enum : int
{
    RTCAD_SPEAKER    = 0x00000000,
    RTCAD_MICROPHONE = 0x00000001,
}

alias RTC_VIDEO_DEVICE = int;
enum : int
{
    RTCVD_RECEIVE = 0x00000000,
    RTCVD_PREVIEW = 0x00000001,
}

alias RTC_EVENT = int;
enum : int
{
    RTCE_CLIENT                     = 0x00000000,
    RTCE_REGISTRATION_STATE_CHANGE  = 0x00000001,
    RTCE_SESSION_STATE_CHANGE       = 0x00000002,
    RTCE_SESSION_OPERATION_COMPLETE = 0x00000003,
    RTCE_PARTICIPANT_STATE_CHANGE   = 0x00000004,
    RTCE_MEDIA                      = 0x00000005,
    RTCE_INTENSITY                  = 0x00000006,
    RTCE_MESSAGING                  = 0x00000007,
    RTCE_BUDDY                      = 0x00000008,
    RTCE_WATCHER                    = 0x00000009,
    RTCE_PROFILE                    = 0x0000000a,
    RTCE_USERSEARCH                 = 0x0000000b,
    RTCE_INFO                       = 0x0000000c,
    RTCE_GROUP                      = 0x0000000d,
    RTCE_MEDIA_REQUEST              = 0x0000000e,
    RTCE_ROAMING                    = 0x0000000f,
    RTCE_PRESENCE_PROPERTY          = 0x00000010,
    RTCE_PRESENCE_DATA              = 0x00000011,
    RTCE_PRESENCE_STATUS            = 0x00000012,
    RTCE_SESSION_REFER_STATUS       = 0x00000013,
    RTCE_SESSION_REFERRED           = 0x00000014,
    RTCE_REINVITE                   = 0x00000015,
}

alias RTC_LISTEN_MODE = int;
enum : int
{
    RTCLM_NONE    = 0x00000000,
    RTCLM_DYNAMIC = 0x00000001,
    RTCLM_BOTH    = 0x00000002,
}

alias RTC_CLIENT_EVENT_TYPE = int;
enum : int
{
    RTCCET_VOLUME_CHANGE          = 0x00000000,
    RTCCET_DEVICE_CHANGE          = 0x00000001,
    RTCCET_NETWORK_QUALITY_CHANGE = 0x00000002,
    RTCCET_ASYNC_CLEANUP_DONE     = 0x00000003,
}

alias RTC_BUDDY_EVENT_TYPE = int;
enum : int
{
    RTCBET_BUDDY_ADD          = 0x00000000,
    RTCBET_BUDDY_REMOVE       = 0x00000001,
    RTCBET_BUDDY_UPDATE       = 0x00000002,
    RTCBET_BUDDY_STATE_CHANGE = 0x00000003,
    RTCBET_BUDDY_ROAMED       = 0x00000004,
    RTCBET_BUDDY_SUBSCRIBED   = 0x00000005,
}

alias RTC_WATCHER_EVENT_TYPE = int;
enum : int
{
    RTCWET_WATCHER_ADD      = 0x00000000,
    RTCWET_WATCHER_REMOVE   = 0x00000001,
    RTCWET_WATCHER_UPDATE   = 0x00000002,
    RTCWET_WATCHER_OFFERING = 0x00000003,
    RTCWET_WATCHER_ROAMED   = 0x00000004,
}

alias RTC_GROUP_EVENT_TYPE = int;
enum : int
{
    RTCGET_GROUP_ADD          = 0x00000000,
    RTCGET_GROUP_REMOVE       = 0x00000001,
    RTCGET_GROUP_UPDATE       = 0x00000002,
    RTCGET_GROUP_BUDDY_ADD    = 0x00000003,
    RTCGET_GROUP_BUDDY_REMOVE = 0x00000004,
    RTCGET_GROUP_ROAMED       = 0x00000005,
}

alias RTC_TERMINATE_REASON = int;
enum : int
{
    RTCTR_NORMAL                      = 0x00000000,
    RTCTR_DND                         = 0x00000001,
    RTCTR_BUSY                        = 0x00000002,
    RTCTR_REJECT                      = 0x00000003,
    RTCTR_TIMEOUT                     = 0x00000004,
    RTCTR_SHUTDOWN                    = 0x00000005,
    RTCTR_INSUFFICIENT_SECURITY_LEVEL = 0x00000006,
    RTCTR_NOT_SUPPORTED               = 0x00000007,
}

alias RTC_REGISTRATION_STATE = int;
enum : int
{
    RTCRS_NOT_REGISTERED       = 0x00000000,
    RTCRS_REGISTERING          = 0x00000001,
    RTCRS_REGISTERED           = 0x00000002,
    RTCRS_REJECTED             = 0x00000003,
    RTCRS_UNREGISTERING        = 0x00000004,
    RTCRS_ERROR                = 0x00000005,
    RTCRS_LOGGED_OFF           = 0x00000006,
    RTCRS_LOCAL_PA_LOGGED_OFF  = 0x00000007,
    RTCRS_REMOTE_PA_LOGGED_OFF = 0x00000008,
}

alias RTC_SESSION_STATE = int;
enum : int
{
    RTCSS_IDLE         = 0x00000000,
    RTCSS_INCOMING     = 0x00000001,
    RTCSS_ANSWERING    = 0x00000002,
    RTCSS_INPROGRESS   = 0x00000003,
    RTCSS_CONNECTED    = 0x00000004,
    RTCSS_DISCONNECTED = 0x00000005,
    RTCSS_HOLD         = 0x00000006,
    RTCSS_REFER        = 0x00000007,
}

alias RTC_PARTICIPANT_STATE = int;
enum : int
{
    RTCPS_IDLE          = 0x00000000,
    RTCPS_PENDING       = 0x00000001,
    RTCPS_INCOMING      = 0x00000002,
    RTCPS_ANSWERING     = 0x00000003,
    RTCPS_INPROGRESS    = 0x00000004,
    RTCPS_ALERTING      = 0x00000005,
    RTCPS_CONNECTED     = 0x00000006,
    RTCPS_DISCONNECTING = 0x00000007,
    RTCPS_DISCONNECTED  = 0x00000008,
}

alias RTC_WATCHER_STATE = int;
enum : int
{
    RTCWS_UNKNOWN  = 0x00000000,
    RTCWS_OFFERING = 0x00000001,
    RTCWS_ALLOWED  = 0x00000002,
    RTCWS_BLOCKED  = 0x00000003,
    RTCWS_DENIED   = 0x00000004,
    RTCWS_PROMPT   = 0x00000005,
}

alias RTC_ACE_SCOPE = int;
enum : int
{
    RTCAS_SCOPE_USER   = 0x00000000,
    RTCAS_SCOPE_DOMAIN = 0x00000001,
    RTCAS_SCOPE_ALL    = 0x00000002,
}

alias RTC_OFFER_WATCHER_MODE = int;
enum : int
{
    RTCOWM_OFFER_WATCHER_EVENT       = 0x00000000,
    RTCOWM_AUTOMATICALLY_ADD_WATCHER = 0x00000001,
}

alias RTC_WATCHER_MATCH_MODE = int;
enum : int
{
    RTCWMM_EXACT_MATCH    = 0x00000000,
    RTCWMM_BEST_ACE_MATCH = 0x00000001,
}

alias RTC_PRIVACY_MODE = int;
enum : int
{
    RTCPM_BLOCK_LIST_EXCLUDED = 0x00000000,
    RTCPM_ALLOW_LIST_ONLY     = 0x00000001,
}

alias RTC_SESSION_TYPE = int;
enum : int
{
    RTCST_PC_TO_PC       = 0x00000000,
    RTCST_PC_TO_PHONE    = 0x00000001,
    RTCST_PHONE_TO_PHONE = 0x00000002,
    RTCST_IM             = 0x00000003,
    RTCST_MULTIPARTY_IM  = 0x00000004,
    RTCST_APPLICATION    = 0x00000005,
}

alias RTC_PRESENCE_STATUS = int;
enum : int
{
    RTCXS_PRESENCE_OFFLINE       = 0x00000000,
    RTCXS_PRESENCE_ONLINE        = 0x00000001,
    RTCXS_PRESENCE_AWAY          = 0x00000002,
    RTCXS_PRESENCE_IDLE          = 0x00000003,
    RTCXS_PRESENCE_BUSY          = 0x00000004,
    RTCXS_PRESENCE_BE_RIGHT_BACK = 0x00000005,
    RTCXS_PRESENCE_ON_THE_PHONE  = 0x00000006,
    RTCXS_PRESENCE_OUT_TO_LUNCH  = 0x00000007,
}

alias RTC_BUDDY_SUBSCRIPTION_TYPE = int;
enum : int
{
    RTCBT_SUBSCRIBED     = 0x00000000,
    RTCBT_ALWAYS_OFFLINE = 0x00000001,
    RTCBT_ALWAYS_ONLINE  = 0x00000002,
    RTCBT_POLL           = 0x00000003,
}

alias RTC_MEDIA_EVENT_TYPE = int;
enum : int
{
    RTCMET_STOPPED = 0x00000000,
    RTCMET_STARTED = 0x00000001,
    RTCMET_FAILED  = 0x00000002,
}

alias RTC_MEDIA_EVENT_REASON = int;
enum : int
{
    RTCMER_NORMAL              = 0x00000000,
    RTCMER_HOLD                = 0x00000001,
    RTCMER_TIMEOUT             = 0x00000002,
    RTCMER_BAD_DEVICE          = 0x00000003,
    RTCMER_NO_PORT             = 0x00000004,
    RTCMER_PORT_MAPPING_FAILED = 0x00000005,
    RTCMER_REMOTE_REQUEST      = 0x00000006,
}

alias RTC_MESSAGING_EVENT_TYPE = int;
enum : int
{
    RTCMSET_MESSAGE = 0x00000000,
    RTCMSET_STATUS  = 0x00000001,
}

alias RTC_MESSAGING_USER_STATUS = int;
enum : int
{
    RTCMUS_IDLE   = 0x00000000,
    RTCMUS_TYPING = 0x00000001,
}

alias RTC_DTMF = int;
enum : int
{
    RTC_DTMF_0     = 0x00000000,
    RTC_DTMF_1     = 0x00000001,
    RTC_DTMF_2     = 0x00000002,
    RTC_DTMF_3     = 0x00000003,
    RTC_DTMF_4     = 0x00000004,
    RTC_DTMF_5     = 0x00000005,
    RTC_DTMF_6     = 0x00000006,
    RTC_DTMF_7     = 0x00000007,
    RTC_DTMF_8     = 0x00000008,
    RTC_DTMF_9     = 0x00000009,
    RTC_DTMF_STAR  = 0x0000000a,
    RTC_DTMF_POUND = 0x0000000b,
    RTC_DTMF_A     = 0x0000000c,
    RTC_DTMF_B     = 0x0000000d,
    RTC_DTMF_C     = 0x0000000e,
    RTC_DTMF_D     = 0x0000000f,
    RTC_DTMF_FLASH = 0x00000010,
}

alias RTC_PROVIDER_URI = int;
enum : int
{
    RTCPU_URIHOMEPAGE          = 0x00000000,
    RTCPU_URIHELPDESK          = 0x00000001,
    RTCPU_URIPERSONALACCOUNT   = 0x00000002,
    RTCPU_URIDISPLAYDURINGCALL = 0x00000003,
    RTCPU_URIDISPLAYDURINGIDLE = 0x00000004,
}

alias RTC_RING_TYPE = int;
enum : int
{
    RTCRT_PHONE    = 0x00000000,
    RTCRT_MESSAGE  = 0x00000001,
    RTCRT_RINGBACK = 0x00000002,
}

alias RTC_T120_APPLET = int;
enum : int
{
    RTCTA_WHITEBOARD = 0x00000000,
    RTCTA_APPSHARING = 0x00000001,
}

alias RTC_PORT_TYPE = int;
enum : int
{
    RTCPT_AUDIO_RTP  = 0x00000000,
    RTCPT_AUDIO_RTCP = 0x00000001,
    RTCPT_VIDEO_RTP  = 0x00000002,
    RTCPT_VIDEO_RTCP = 0x00000003,
    RTCPT_SIP        = 0x00000004,
}

alias RTC_USER_SEARCH_COLUMN = int;
enum : int
{
    RTCUSC_URI         = 0x00000000,
    RTCUSC_DISPLAYNAME = 0x00000001,
    RTCUSC_TITLE       = 0x00000002,
    RTCUSC_OFFICE      = 0x00000003,
    RTCUSC_PHONE       = 0x00000004,
    RTCUSC_COMPANY     = 0x00000005,
    RTCUSC_CITY        = 0x00000006,
    RTCUSC_STATE       = 0x00000007,
    RTCUSC_COUNTRY     = 0x00000008,
    RTCUSC_EMAIL       = 0x00000009,
}

alias RTC_USER_SEARCH_PREFERENCE = int;
enum : int
{
    RTCUSP_MAX_MATCHES = 0x00000000,
    RTCUSP_TIME_LIMIT  = 0x00000001,
}

alias RTC_ROAMING_EVENT_TYPE = int;
enum : int
{
    RTCRET_BUDDY_ROAMING    = 0x00000000,
    RTCRET_WATCHER_ROAMING  = 0x00000001,
    RTCRET_PRESENCE_ROAMING = 0x00000002,
    RTCRET_PROFILE_ROAMING  = 0x00000003,
    RTCRET_WPENDING_ROAMING = 0x00000004,
}

alias RTC_PROFILE_EVENT_TYPE = int;
enum : int
{
    RTCPFET_PROFILE_GET    = 0x00000000,
    RTCPFET_PROFILE_UPDATE = 0x00000001,
}

alias RTC_ANSWER_MODE = int;
enum : int
{
    RTCAM_OFFER_SESSION_EVENT  = 0x00000000,
    RTCAM_AUTOMATICALLY_ACCEPT = 0x00000001,
    RTCAM_AUTOMATICALLY_REJECT = 0x00000002,
    RTCAM_NOT_SUPPORTED        = 0x00000003,
}

alias RTC_SESSION_REFER_STATUS = int;
enum : int
{
    RTCSRS_REFERRING = 0x00000000,
    RTCSRS_ACCEPTED  = 0x00000001,
    RTCSRS_ERROR     = 0x00000002,
    RTCSRS_REJECTED  = 0x00000003,
    RTCSRS_DROPPED   = 0x00000004,
    RTCSRS_DONE      = 0x00000005,
}

alias RTC_PRESENCE_PROPERTY = int;
enum : int
{
    RTCPP_PHONENUMBER = 0x00000000,
    RTCPP_DISPLAYNAME = 0x00000001,
    RTCPP_EMAIL       = 0x00000002,
    RTCPP_DEVICE_NAME = 0x00000003,
    RTCPP_MULTIPLE    = 0x00000004,
}

alias RTC_SECURITY_TYPE = int;
enum : int
{
    RTCSECT_AUDIO_VIDEO_MEDIA_ENCRYPTION = 0x00000000,
    RTCSECT_T120_MEDIA_ENCRYPTION        = 0x00000001,
}

alias RTC_SECURITY_LEVEL = int;
enum : int
{
    RTCSECL_UNSUPPORTED = 0x00000001,
    RTCSECL_SUPPORTED   = 0x00000002,
    RTCSECL_REQUIRED    = 0x00000003,
}

alias RTC_REINVITE_STATE = int;
enum : int
{
    RTCRIN_INCOMING  = 0x00000000,
    RTCRIN_SUCCEEDED = 0x00000001,
    RTCRIN_FAIL      = 0x00000002,
}

enum IID_IRTCClient = GUID(0x7829e45, 0x9a34, 0x408e, [0xa0, 0x11, 0xbd, 0xdf, 0x13, 0x48, 0x7c, 0xd1]);
interface IRTCClient : IUnknown
{
    HRESULT Initialize();
    HRESULT Shutdown();
    HRESULT PrepareForShutdown();
    HRESULT put_EventFilter(int lFilter);
    HRESULT get_EventFilter(int* plFilter);
    HRESULT SetPreferredMediaTypes(int lMediaTypes, VARIANT_BOOL fPersistent);
    HRESULT get_PreferredMediaTypes(int* plMediaTypes);
    HRESULT get_MediaCapabilities(int* plMediaTypes);
    HRESULT CreateSession(RTC_SESSION_TYPE enType, BSTR bstrLocalPhoneURI, IRTCProfile pProfile, int lFlags, IRTCSession* ppSession);
    HRESULT put_ListenForIncomingSessions(RTC_LISTEN_MODE enListen);
    HRESULT get_ListenForIncomingSessions(RTC_LISTEN_MODE* penListen);
    HRESULT get_NetworkAddresses(VARIANT_BOOL fTCP, VARIANT_BOOL fExternal, VARIANT* pvAddresses);
    HRESULT put_Volume(RTC_AUDIO_DEVICE enDevice, int lVolume);
    HRESULT get_Volume(RTC_AUDIO_DEVICE enDevice, int* plVolume);
    HRESULT put_AudioMuted(RTC_AUDIO_DEVICE enDevice, VARIANT_BOOL fMuted);
    HRESULT get_AudioMuted(RTC_AUDIO_DEVICE enDevice, VARIANT_BOOL* pfMuted);
    HRESULT get_IVideoWindow(RTC_VIDEO_DEVICE enDevice, IVideoWindow* ppIVideoWindow);
    HRESULT put_PreferredAudioDevice(RTC_AUDIO_DEVICE enDevice, BSTR bstrDeviceName);
    HRESULT get_PreferredAudioDevice(RTC_AUDIO_DEVICE enDevice, BSTR* pbstrDeviceName);
    HRESULT put_PreferredVolume(RTC_AUDIO_DEVICE enDevice, int lVolume);
    HRESULT get_PreferredVolume(RTC_AUDIO_DEVICE enDevice, int* plVolume);
    HRESULT put_PreferredAEC(VARIANT_BOOL bEnable);
    HRESULT get_PreferredAEC(VARIANT_BOOL* pbEnabled);
    HRESULT put_PreferredVideoDevice(BSTR bstrDeviceName);
    HRESULT get_PreferredVideoDevice(BSTR* pbstrDeviceName);
    HRESULT get_ActiveMedia(int* plMediaType);
    HRESULT put_MaxBitrate(int lMaxBitrate);
    HRESULT get_MaxBitrate(int* plMaxBitrate);
    HRESULT put_TemporalSpatialTradeOff(int lValue);
    HRESULT get_TemporalSpatialTradeOff(int* plValue);
    HRESULT get_NetworkQuality(int* plNetworkQuality);
    HRESULT StartT120Applet(RTC_T120_APPLET enApplet);
    HRESULT StopT120Applets();
    HRESULT get_IsT120AppletRunning(RTC_T120_APPLET enApplet, VARIANT_BOOL* pfRunning);
    HRESULT get_LocalUserURI(BSTR* pbstrUserURI);
    HRESULT put_LocalUserURI(BSTR bstrUserURI);
    HRESULT get_LocalUserName(BSTR* pbstrUserName);
    HRESULT put_LocalUserName(BSTR bstrUserName);
    HRESULT PlayRing(RTC_RING_TYPE enType, VARIANT_BOOL bPlay);
    HRESULT SendDTMF(RTC_DTMF enDTMF);
    HRESULT InvokeTuningWizard(long hwndParent);
    HRESULT get_IsTuned(VARIANT_BOOL* pfTuned);
}
enum IID_IRTCClient2 = GUID(0xc91d71d, 0x1064, 0x42da, [0xbf, 0xa5, 0x57, 0x2b, 0xeb, 0x8e, 0xea, 0x84]);
interface IRTCClient2 : IRTCClient
{
    HRESULT put_AnswerMode(RTC_SESSION_TYPE enType, RTC_ANSWER_MODE enMode);
    HRESULT get_AnswerMode(RTC_SESSION_TYPE enType, RTC_ANSWER_MODE* penMode);
    HRESULT InvokeTuningWizardEx(long hwndParent, VARIANT_BOOL fAllowAudio, VARIANT_BOOL fAllowVideo);
    HRESULT get_Version(int* plVersion);
    HRESULT put_ClientName(BSTR bstrClientName);
    HRESULT put_ClientCurVer(BSTR bstrClientCurVer);
    HRESULT InitializeEx(int lFlags);
    HRESULT CreateSessionWithDescription(BSTR bstrContentType, BSTR bstrSessionDescription, IRTCProfile pProfile, int lFlags, IRTCSession2* ppSession2);
    HRESULT SetSessionDescriptionManager(IRTCSessionDescriptionManager pSessionDescriptionManager);
    HRESULT put_PreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL enSecurityLevel);
    HRESULT get_PreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL* penSecurityLevel);
    HRESULT put_AllowedPorts(int lTransport, RTC_LISTEN_MODE enListenMode);
    HRESULT get_AllowedPorts(int lTransport, RTC_LISTEN_MODE* penListenMode);
}
enum IID_IRTCClientPresence = GUID(0x11c3cbcc, 0x744, 0x42d1, [0x96, 0x8a, 0x51, 0xaa, 0x1b, 0xb2, 0x74, 0xc6]);
interface IRTCClientPresence : IUnknown
{
    HRESULT EnablePresence(VARIANT_BOOL fUseStorage, VARIANT varStorage);
    HRESULT Export(VARIANT varStorage);
    HRESULT Import(VARIANT varStorage, VARIANT_BOOL fReplaceAll);
    HRESULT EnumerateBuddies(IRTCEnumBuddies* ppEnum);
    HRESULT get_Buddies(IRTCCollection* ppCollection);
    HRESULT get_Buddy(BSTR bstrPresentityURI, IRTCBuddy* ppBuddy);
    HRESULT AddBuddy(BSTR bstrPresentityURI, BSTR bstrUserName, BSTR bstrData, VARIANT_BOOL fPersistent, IRTCProfile pProfile, int lFlags, IRTCBuddy* ppBuddy);
    HRESULT RemoveBuddy(IRTCBuddy pBuddy);
    HRESULT EnumerateWatchers(IRTCEnumWatchers* ppEnum);
    HRESULT get_Watchers(IRTCCollection* ppCollection);
    HRESULT get_Watcher(BSTR bstrPresentityURI, IRTCWatcher* ppWatcher);
    HRESULT AddWatcher(BSTR bstrPresentityURI, BSTR bstrUserName, BSTR bstrData, VARIANT_BOOL fBlocked, VARIANT_BOOL fPersistent, IRTCWatcher* ppWatcher);
    HRESULT RemoveWatcher(IRTCWatcher pWatcher);
    HRESULT SetLocalPresenceInfo(RTC_PRESENCE_STATUS enStatus, BSTR bstrNotes);
    HRESULT get_OfferWatcherMode(RTC_OFFER_WATCHER_MODE* penMode);
    HRESULT put_OfferWatcherMode(RTC_OFFER_WATCHER_MODE enMode);
    HRESULT get_PrivacyMode(RTC_PRIVACY_MODE* penMode);
    HRESULT put_PrivacyMode(RTC_PRIVACY_MODE enMode);
}
enum IID_IRTCClientPresence2 = GUID(0xad1809e8, 0x62f7, 0x4783, [0x90, 0x9a, 0x29, 0xc9, 0xd2, 0xcb, 0x1d, 0x34]);
interface IRTCClientPresence2 : IRTCClientPresence
{
    HRESULT EnablePresenceEx(IRTCProfile pProfile, VARIANT varStorage, int lFlags);
    HRESULT DisablePresence();
    HRESULT AddGroup(BSTR bstrGroupName, BSTR bstrData, IRTCProfile pProfile, int lFlags, IRTCBuddyGroup* ppGroup);
    HRESULT RemoveGroup(IRTCBuddyGroup pGroup);
    HRESULT EnumerateGroups(IRTCEnumGroups* ppEnum);
    HRESULT get_Groups(IRTCCollection* ppCollection);
    HRESULT get_Group(BSTR bstrGroupName, IRTCBuddyGroup* ppGroup);
    HRESULT AddWatcherEx(BSTR bstrPresentityURI, BSTR bstrUserName, BSTR bstrData, RTC_WATCHER_STATE enState, VARIANT_BOOL fPersistent, RTC_ACE_SCOPE enScope, IRTCProfile pProfile, int lFlags, IRTCWatcher2* ppWatcher);
    HRESULT get_WatcherEx(RTC_WATCHER_MATCH_MODE enMode, BSTR bstrPresentityURI, IRTCWatcher2* ppWatcher);
    HRESULT put_PresenceProperty(RTC_PRESENCE_PROPERTY enProperty, BSTR bstrProperty);
    HRESULT get_PresenceProperty(RTC_PRESENCE_PROPERTY enProperty, BSTR* pbstrProperty);
    HRESULT SetPresenceData(BSTR bstrNamespace, BSTR bstrData);
    HRESULT GetPresenceData(BSTR* pbstrNamespace, BSTR* pbstrData);
    HRESULT GetLocalPresenceInfo(RTC_PRESENCE_STATUS* penStatus, BSTR* pbstrNotes);
    HRESULT AddBuddyEx(BSTR bstrPresentityURI, BSTR bstrUserName, BSTR bstrData, VARIANT_BOOL fPersistent, RTC_BUDDY_SUBSCRIPTION_TYPE enSubscriptionType, IRTCProfile pProfile, int lFlags, IRTCBuddy2* ppBuddy);
}
enum IID_IRTCClientProvisioning = GUID(0xb9f5cf06, 0x65b9, 0x4a80, [0xa0, 0xe6, 0x73, 0xca, 0xe3, 0xef, 0x38, 0x22]);
interface IRTCClientProvisioning : IUnknown
{
    HRESULT CreateProfile(BSTR bstrProfileXML, IRTCProfile* ppProfile);
    HRESULT EnableProfile(IRTCProfile pProfile, int lRegisterFlags);
    HRESULT DisableProfile(IRTCProfile pProfile);
    HRESULT EnumerateProfiles(IRTCEnumProfiles* ppEnum);
    HRESULT get_Profiles(IRTCCollection* ppCollection);
    HRESULT GetProfile(BSTR bstrUserAccount, BSTR bstrUserPassword, BSTR bstrUserURI, BSTR bstrServer, int lTransport, long lCookie);
    HRESULT get_SessionCapabilities(int* plSupportedSessions);
}
enum IID_IRTCClientProvisioning2 = GUID(0xa70909b5, 0xf40e, 0x4587, [0xbb, 0x75, 0xe6, 0xbc, 0x8, 0x45, 0x2, 0x3e]);
interface IRTCClientProvisioning2 : IRTCClientProvisioning
{
    HRESULT EnableProfileEx(IRTCProfile pProfile, int lRegisterFlags, int lRoamingFlags);
}
enum IID_IRTCProfile = GUID(0xd07eca9e, 0x4062, 0x4dd4, [0x9e, 0x7d, 0x72, 0x2a, 0x49, 0xba, 0x73, 0x3]);
interface IRTCProfile : IUnknown
{
    HRESULT get_Key(BSTR* pbstrKey);
    HRESULT get_Name(BSTR* pbstrName);
    HRESULT get_XML(BSTR* pbstrXML);
    HRESULT get_ProviderName(BSTR* pbstrName);
    HRESULT get_ProviderURI(RTC_PROVIDER_URI enURI, BSTR* pbstrURI);
    HRESULT get_ProviderData(BSTR* pbstrData);
    HRESULT get_ClientName(BSTR* pbstrName);
    HRESULT get_ClientBanner(VARIANT_BOOL* pfBanner);
    HRESULT get_ClientMinVer(BSTR* pbstrMinVer);
    HRESULT get_ClientCurVer(BSTR* pbstrCurVer);
    HRESULT get_ClientUpdateURI(BSTR* pbstrUpdateURI);
    HRESULT get_ClientData(BSTR* pbstrData);
    HRESULT get_UserURI(BSTR* pbstrUserURI);
    HRESULT get_UserName(BSTR* pbstrUserName);
    HRESULT get_UserAccount(BSTR* pbstrUserAccount);
    HRESULT SetCredentials(BSTR bstrUserURI, BSTR bstrUserAccount, BSTR bstrPassword);
    HRESULT get_SessionCapabilities(int* plSupportedSessions);
    HRESULT get_State(RTC_REGISTRATION_STATE* penState);
}
enum IID_IRTCProfile2 = GUID(0x4b81f84e, 0xbdc7, 0x4184, [0x91, 0x54, 0x3c, 0xb2, 0xdd, 0x79, 0x17, 0xfb]);
interface IRTCProfile2 : IRTCProfile
{
    HRESULT get_Realm(BSTR* pbstrRealm);
    HRESULT put_Realm(BSTR bstrRealm);
    HRESULT get_AllowedAuth(int* plAllowedAuth);
    HRESULT put_AllowedAuth(int lAllowedAuth);
}
enum IID_IRTCSession = GUID(0x387c8086, 0x99be, 0x42fb, [0x99, 0x73, 0x7c, 0xf, 0xc0, 0xca, 0x9f, 0xa8]);
interface IRTCSession : IUnknown
{
    HRESULT get_Client(IRTCClient* ppClient);
    HRESULT get_State(RTC_SESSION_STATE* penState);
    HRESULT get_Type(RTC_SESSION_TYPE* penType);
    HRESULT get_Profile(IRTCProfile* ppProfile);
    HRESULT get_Participants(IRTCCollection* ppCollection);
    HRESULT Answer();
    HRESULT Terminate(RTC_TERMINATE_REASON enReason);
    HRESULT Redirect(RTC_SESSION_TYPE enType, BSTR bstrLocalPhoneURI, IRTCProfile pProfile, int lFlags);
    HRESULT AddParticipant(BSTR bstrAddress, BSTR bstrName, IRTCParticipant* ppParticipant);
    HRESULT RemoveParticipant(IRTCParticipant pParticipant);
    HRESULT EnumerateParticipants(IRTCEnumParticipants* ppEnum);
    HRESULT get_CanAddParticipants(VARIANT_BOOL* pfCanAdd);
    HRESULT get_RedirectedUserURI(BSTR* pbstrUserURI);
    HRESULT get_RedirectedUserName(BSTR* pbstrUserName);
    HRESULT NextRedirectedUser();
    HRESULT SendMessage(BSTR bstrMessageHeader, BSTR bstrMessage, long lCookie);
    HRESULT SendMessageStatus(RTC_MESSAGING_USER_STATUS enUserStatus, long lCookie);
    HRESULT AddStream(int lMediaType, long lCookie);
    HRESULT RemoveStream(int lMediaType, long lCookie);
    HRESULT put_EncryptionKey(int lMediaType, BSTR EncryptionKey);
}
enum IID_IRTCSession2 = GUID(0x17d7cdfc, 0xb007, 0x484c, [0x99, 0xd2, 0x86, 0xa8, 0xa8, 0x20, 0x99, 0x1d]);
interface IRTCSession2 : IRTCSession
{
    HRESULT SendInfo(BSTR bstrInfoHeader, BSTR bstrInfo, long lCookie);
    HRESULT put_PreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL enSecurityLevel);
    HRESULT get_PreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL* penSecurityLevel);
    HRESULT IsSecurityEnabled(RTC_SECURITY_TYPE enSecurityType, VARIANT_BOOL* pfSecurityEnabled);
    HRESULT AnswerWithSessionDescription(BSTR bstrContentType, BSTR bstrSessionDescription);
    HRESULT ReInviteWithSessionDescription(BSTR bstrContentType, BSTR bstrSessionDescription, long lCookie);
}
enum IID_IRTCSessionCallControl = GUID(0xe9a50d94, 0x190b, 0x4f82, [0x95, 0x30, 0x3b, 0x8e, 0xbf, 0x60, 0x75, 0x8a]);
interface IRTCSessionCallControl : IUnknown
{
    HRESULT Hold(long lCookie);
    HRESULT UnHold(long lCookie);
    HRESULT Forward(BSTR bstrForwardToURI);
    HRESULT Refer(BSTR bstrReferToURI, BSTR bstrReferCookie);
    HRESULT put_ReferredByURI(BSTR bstrReferredByURI);
    HRESULT get_ReferredByURI(BSTR* pbstrReferredByURI);
    HRESULT put_ReferCookie(BSTR bstrReferCookie);
    HRESULT get_ReferCookie(BSTR* pbstrReferCookie);
    HRESULT get_IsReferred(VARIANT_BOOL* pfIsReferred);
}
enum IID_IRTCParticipant = GUID(0xae86add5, 0x26b1, 0x4414, [0xaf, 0x1d, 0xb9, 0x4c, 0xd9, 0x38, 0xd7, 0x39]);
interface IRTCParticipant : IUnknown
{
    HRESULT get_UserURI(BSTR* pbstrUserURI);
    HRESULT get_Name(BSTR* pbstrName);
    HRESULT get_Removable(VARIANT_BOOL* pfRemovable);
    HRESULT get_State(RTC_PARTICIPANT_STATE* penState);
    HRESULT get_Session(IRTCSession* ppSession);
}
enum IID_IRTCRoamingEvent = GUID(0x79960a6b, 0xcb1, 0x4dc8, [0xa8, 0x5, 0x73, 0x18, 0xe9, 0x99, 0x2, 0xe8]);
interface IRTCRoamingEvent : IDispatch
{
    HRESULT get_EventType(RTC_ROAMING_EVENT_TYPE* pEventType);
    HRESULT get_Profile(IRTCProfile2* ppProfile);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCProfileEvent = GUID(0xd6d5ab3b, 0x770e, 0x43e8, [0x80, 0xa, 0x79, 0xb0, 0x62, 0x39, 0x5f, 0xca]);
interface IRTCProfileEvent : IDispatch
{
    HRESULT get_Profile(IRTCProfile* ppProfile);
    HRESULT get_Cookie(long* plCookie);
    HRESULT get_StatusCode(int* plStatusCode);
}
enum IID_IRTCProfileEvent2 = GUID(0x62e56edc, 0x3fa, 0x4121, [0x94, 0xfb, 0x23, 0x49, 0x3f, 0xd0, 0xae, 0x64]);
interface IRTCProfileEvent2 : IRTCProfileEvent
{
    HRESULT get_EventType(RTC_PROFILE_EVENT_TYPE* pEventType);
}
enum IID_IRTCClientEvent = GUID(0x2b493b7a, 0x3cba, 0x4170, [0x9c, 0x8b, 0x76, 0xa9, 0xda, 0xcd, 0xd6, 0x44]);
interface IRTCClientEvent : IDispatch
{
    HRESULT get_EventType(RTC_CLIENT_EVENT_TYPE* penEventType);
    HRESULT get_Client(IRTCClient* ppClient);
}
enum IID_IRTCRegistrationStateChangeEvent = GUID(0x62d0991b, 0x50ab, 0x4f02, [0xb9, 0x48, 0xca, 0x94, 0xf2, 0x6f, 0x8f, 0x95]);
interface IRTCRegistrationStateChangeEvent : IDispatch
{
    HRESULT get_Profile(IRTCProfile* ppProfile);
    HRESULT get_State(RTC_REGISTRATION_STATE* penState);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCSessionStateChangeEvent = GUID(0xb5bad703, 0x5952, 0x48b3, [0x93, 0x21, 0x7f, 0x45, 0x0, 0x52, 0x15, 0x6]);
interface IRTCSessionStateChangeEvent : IDispatch
{
    HRESULT get_Session(IRTCSession* ppSession);
    HRESULT get_State(RTC_SESSION_STATE* penState);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCSessionStateChangeEvent2 = GUID(0x4f933171, 0x6f95, 0x4880, [0x80, 0xd9, 0x2e, 0xc8, 0xd4, 0x95, 0xd2, 0x61]);
interface IRTCSessionStateChangeEvent2 : IRTCSessionStateChangeEvent
{
    HRESULT get_MediaTypes(int* pMediaTypes);
    HRESULT get_RemotePreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL* penSecurityLevel);
    HRESULT get_IsForked(VARIANT_BOOL* pfIsForked);
    HRESULT GetRemoteSessionDescription(BSTR* pbstrContentType, BSTR* pbstrSessionDescription);
}
enum IID_IRTCSessionOperationCompleteEvent = GUID(0xa6bff4c0, 0xf7c8, 0x4d3c, [0x9a, 0x41, 0x35, 0x50, 0xf7, 0x8a, 0x95, 0xb0]);
interface IRTCSessionOperationCompleteEvent : IDispatch
{
    HRESULT get_Session(IRTCSession* ppSession);
    HRESULT get_Cookie(long* plCookie);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCSessionOperationCompleteEvent2 = GUID(0xf6fc2a9b, 0xd5bc, 0x4241, [0xb4, 0x36, 0x1b, 0x84, 0x60, 0xc1, 0x38, 0x32]);
interface IRTCSessionOperationCompleteEvent2 : IRTCSessionOperationCompleteEvent
{
    HRESULT get_Participant(IRTCParticipant* ppParticipant);
    HRESULT GetRemoteSessionDescription(BSTR* pbstrContentType, BSTR* pbstrSessionDescription);
}
enum IID_IRTCParticipantStateChangeEvent = GUID(0x9bcb597, 0xf0fa, 0x48f9, [0xb4, 0x20, 0x46, 0x8c, 0xea, 0x7f, 0xde, 0x4]);
interface IRTCParticipantStateChangeEvent : IDispatch
{
    HRESULT get_Participant(IRTCParticipant* ppParticipant);
    HRESULT get_State(RTC_PARTICIPANT_STATE* penState);
    HRESULT get_StatusCode(int* plStatusCode);
}
enum IID_IRTCMediaEvent = GUID(0x99944fb, 0xbcda, 0x453e, [0x8c, 0x41, 0xe1, 0x3d, 0xa2, 0xad, 0xf7, 0xf3]);
interface IRTCMediaEvent : IDispatch
{
    HRESULT get_MediaType(int* pMediaType);
    HRESULT get_EventType(RTC_MEDIA_EVENT_TYPE* penEventType);
    HRESULT get_EventReason(RTC_MEDIA_EVENT_REASON* penEventReason);
}
enum IID_IRTCIntensityEvent = GUID(0x4c23bf51, 0x390c, 0x4992, [0xa4, 0x1d, 0x41, 0xee, 0xc0, 0x5b, 0x2a, 0x4b]);
interface IRTCIntensityEvent : IDispatch
{
    HRESULT get_Level(int* plLevel);
    HRESULT get_Min(int* plMin);
    HRESULT get_Max(int* plMax);
    HRESULT get_Direction(RTC_AUDIO_DEVICE* penDirection);
}
enum IID_IRTCMessagingEvent = GUID(0xd3609541, 0x1b29, 0x4de5, [0xa4, 0xad, 0x5a, 0xeb, 0xaf, 0x31, 0x95, 0x12]);
interface IRTCMessagingEvent : IDispatch
{
    HRESULT get_Session(IRTCSession* ppSession);
    HRESULT get_Participant(IRTCParticipant* ppParticipant);
    HRESULT get_EventType(RTC_MESSAGING_EVENT_TYPE* penEventType);
    HRESULT get_Message(BSTR* pbstrMessage);
    HRESULT get_MessageHeader(BSTR* pbstrMessageHeader);
    HRESULT get_UserStatus(RTC_MESSAGING_USER_STATUS* penUserStatus);
}
enum IID_IRTCBuddyEvent = GUID(0xf36d755d, 0x17e6, 0x404e, [0x95, 0x4f, 0xf, 0xc0, 0x75, 0x74, 0xc7, 0x8d]);
interface IRTCBuddyEvent : IDispatch
{
    HRESULT get_Buddy(IRTCBuddy* ppBuddy);
}
enum IID_IRTCBuddyEvent2 = GUID(0x484a7f1e, 0x73f0, 0x4990, [0xbf, 0xc2, 0x60, 0xbc, 0x39, 0x78, 0xa7, 0x20]);
interface IRTCBuddyEvent2 : IRTCBuddyEvent
{
    HRESULT get_EventType(RTC_BUDDY_EVENT_TYPE* pEventType);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCWatcherEvent = GUID(0xf30d7261, 0x587a, 0x424f, [0x82, 0x2c, 0x31, 0x27, 0x88, 0xf4, 0x35, 0x48]);
interface IRTCWatcherEvent : IDispatch
{
    HRESULT get_Watcher(IRTCWatcher* ppWatcher);
}
enum IID_IRTCWatcherEvent2 = GUID(0xe52891e8, 0x188c, 0x49af, [0xb0, 0x5, 0x98, 0xed, 0x13, 0xf8, 0x3f, 0x9c]);
interface IRTCWatcherEvent2 : IRTCWatcherEvent
{
    HRESULT get_EventType(RTC_WATCHER_EVENT_TYPE* pEventType);
    HRESULT get_StatusCode(int* plStatusCode);
}
enum IID_IRTCBuddyGroupEvent = GUID(0x3a79e1d1, 0xb736, 0x4414, [0x96, 0xf8, 0xbb, 0xc7, 0xf0, 0x88, 0x63, 0xe4]);
interface IRTCBuddyGroupEvent : IDispatch
{
    HRESULT get_EventType(RTC_GROUP_EVENT_TYPE* pEventType);
    HRESULT get_Group(IRTCBuddyGroup* ppGroup);
    HRESULT get_Buddy(IRTCBuddy2* ppBuddy);
    HRESULT get_StatusCode(int* plStatusCode);
}
enum IID_IRTCInfoEvent = GUID(0x4e1d68ae, 0x1912, 0x4f49, [0xb2, 0xc3, 0x59, 0x4f, 0xad, 0xfd, 0x42, 0x5f]);
interface IRTCInfoEvent : IDispatch
{
    HRESULT get_Session(IRTCSession2* ppSession);
    HRESULT get_Participant(IRTCParticipant* ppParticipant);
    HRESULT get_Info(BSTR* pbstrInfo);
    HRESULT get_InfoHeader(BSTR* pbstrInfoHeader);
}
enum IID_IRTCMediaRequestEvent = GUID(0x52572d15, 0x148c, 0x4d97, [0xa3, 0x6c, 0x2d, 0xa5, 0x5c, 0x28, 0x9d, 0x63]);
interface IRTCMediaRequestEvent : IDispatch
{
    HRESULT get_Session(IRTCSession2* ppSession);
    HRESULT get_ProposedMedia(int* plMediaTypes);
    HRESULT get_CurrentMedia(int* plMediaTypes);
    HRESULT Accept(int lMediaTypes);
    HRESULT get_RemotePreferredSecurityLevel(RTC_SECURITY_TYPE enSecurityType, RTC_SECURITY_LEVEL* penSecurityLevel);
    HRESULT Reject();
    HRESULT get_State(RTC_REINVITE_STATE* pState);
}
enum IID_IRTCReInviteEvent = GUID(0x11558d84, 0x204c, 0x43e7, [0x99, 0xb0, 0x20, 0x34, 0xe9, 0x41, 0x7f, 0x7d]);
interface IRTCReInviteEvent : IDispatch
{
    HRESULT get_Session(IRTCSession2* ppSession2);
    HRESULT Accept(BSTR bstrContentType, BSTR bstrSessionDescription);
    HRESULT Reject();
    HRESULT get_State(RTC_REINVITE_STATE* pState);
    HRESULT GetRemoteSessionDescription(BSTR* pbstrContentType, BSTR* pbstrSessionDescription);
}
enum IID_IRTCPresencePropertyEvent = GUID(0xf777f570, 0xa820, 0x49d5, [0x86, 0xbd, 0xe0, 0x99, 0x49, 0x3f, 0x15, 0x18]);
interface IRTCPresencePropertyEvent : IDispatch
{
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
    HRESULT get_PresenceProperty(RTC_PRESENCE_PROPERTY* penPresProp);
    HRESULT get_Value(BSTR* pbstrValue);
}
enum IID_IRTCPresenceDataEvent = GUID(0x38f0e78c, 0x8b87, 0x4c04, [0xa8, 0x2d, 0xae, 0xdd, 0x83, 0xc9, 0x9, 0xbb]);
interface IRTCPresenceDataEvent : IDispatch
{
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
    HRESULT GetPresenceData(BSTR* pbstrNamespace, BSTR* pbstrData);
}
enum IID_IRTCPresenceStatusEvent = GUID(0x78673f32, 0x4a0f, 0x462c, [0x89, 0xaa, 0xee, 0x77, 0x6, 0x70, 0x76, 0x78]);
interface IRTCPresenceStatusEvent : IDispatch
{
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
    HRESULT GetLocalPresenceInfo(RTC_PRESENCE_STATUS* penStatus, BSTR* pbstrNotes);
}
enum IID_IRTCCollection = GUID(0xec7c8096, 0xb918, 0x4044, [0x94, 0xf1, 0xe4, 0xfb, 0xa0, 0x36, 0x1d, 0x5c]);
interface IRTCCollection : IDispatch
{
    HRESULT get_Count(int* lCount);
    HRESULT get_Item(int Index, VARIANT* pVariant);
    HRESULT get__NewEnum(IUnknown* ppNewEnum);
}
enum IID_IRTCEnumParticipants = GUID(0xfcd56f29, 0x4a4f, 0x41b2, [0xba, 0x5c, 0xf5, 0xbc, 0xcc, 0x6, 0xb, 0xf6]);
interface IRTCEnumParticipants : IUnknown
{
    HRESULT Next(uint celt, IRTCParticipant* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumParticipants* ppEnum);
}
enum IID_IRTCEnumProfiles = GUID(0x29b7c41c, 0xed82, 0x4bca, [0x84, 0xad, 0x39, 0xd5, 0x10, 0x1b, 0x58, 0xe3]);
interface IRTCEnumProfiles : IUnknown
{
    HRESULT Next(uint celt, IRTCProfile* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumProfiles* ppEnum);
}
enum IID_IRTCEnumBuddies = GUID(0xf7296917, 0x5569, 0x4b3b, [0xb3, 0xaf, 0x98, 0xd1, 0x14, 0x4b, 0x2b, 0x87]);
interface IRTCEnumBuddies : IUnknown
{
    HRESULT Next(uint celt, IRTCBuddy* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumBuddies* ppEnum);
}
enum IID_IRTCEnumWatchers = GUID(0xa87d55d7, 0xdb74, 0x4ed1, [0x9c, 0xa4, 0x77, 0xa0, 0xe4, 0x1b, 0x41, 0x3e]);
interface IRTCEnumWatchers : IUnknown
{
    HRESULT Next(uint celt, IRTCWatcher* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumWatchers* ppEnum);
}
enum IID_IRTCEnumGroups = GUID(0x742378d6, 0xa141, 0x4415, [0x8f, 0x27, 0x35, 0xd9, 0x90, 0x76, 0xcf, 0x5d]);
interface IRTCEnumGroups : IUnknown
{
    HRESULT Next(uint celt, IRTCBuddyGroup* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumGroups* ppEnum);
}
enum IID_IRTCPresenceContact = GUID(0x8b22f92c, 0xcd90, 0x42db, [0xa7, 0x33, 0x21, 0x22, 0x5, 0xc3, 0xe3, 0xdf]);
interface IRTCPresenceContact : IUnknown
{
    HRESULT get_PresentityURI(BSTR* pbstrPresentityURI);
    HRESULT put_PresentityURI(BSTR bstrPresentityURI);
    HRESULT get_Name(BSTR* pbstrName);
    HRESULT put_Name(BSTR bstrName);
    HRESULT get_Data(BSTR* pbstrData);
    HRESULT put_Data(BSTR bstrData);
    HRESULT get_Persistent(VARIANT_BOOL* pfPersistent);
    HRESULT put_Persistent(VARIANT_BOOL fPersistent);
}
enum IID_IRTCBuddy = GUID(0xfcb136c8, 0x7b90, 0x4e0c, [0xbe, 0xfe, 0x56, 0xed, 0xf0, 0xba, 0x6f, 0x1c]);
interface IRTCBuddy : IRTCPresenceContact
{
    HRESULT get_Status(RTC_PRESENCE_STATUS* penStatus);
    HRESULT get_Notes(BSTR* pbstrNotes);
}
enum IID_IRTCBuddy2 = GUID(0x102f9588, 0x23e7, 0x40e3, [0x95, 0x4d, 0xcd, 0x7a, 0x1d, 0x5c, 0x3, 0x61]);
interface IRTCBuddy2 : IRTCBuddy
{
    HRESULT get_Profile(IRTCProfile2* ppProfile);
    HRESULT Refresh();
    HRESULT EnumerateGroups(IRTCEnumGroups* ppEnum);
    HRESULT get_Groups(IRTCCollection* ppCollection);
    HRESULT get_PresenceProperty(RTC_PRESENCE_PROPERTY enProperty, BSTR* pbstrProperty);
    HRESULT EnumeratePresenceDevices(IRTCEnumPresenceDevices* ppEnumDevices);
    HRESULT get_PresenceDevices(IRTCCollection* ppDevicesCollection);
    HRESULT get_SubscriptionType(RTC_BUDDY_SUBSCRIPTION_TYPE* penSubscriptionType);
}
enum IID_IRTCWatcher = GUID(0xc7cedad8, 0x346b, 0x4d1b, [0xac, 0x2, 0xa2, 0x8, 0x8d, 0xf9, 0xbe, 0x4f]);
interface IRTCWatcher : IRTCPresenceContact
{
    HRESULT get_State(RTC_WATCHER_STATE* penState);
    HRESULT put_State(RTC_WATCHER_STATE enState);
}
enum IID_IRTCWatcher2 = GUID(0xd4d9967f, 0xd011, 0x4b1d, [0x91, 0xe3, 0xab, 0xa7, 0x8f, 0x96, 0x39, 0x3d]);
interface IRTCWatcher2 : IRTCWatcher
{
    HRESULT get_Profile(IRTCProfile2* ppProfile);
    HRESULT get_Scope(RTC_ACE_SCOPE* penScope);
}
enum IID_IRTCBuddyGroup = GUID(0x60361e68, 0x9164, 0x4389, [0xa4, 0xc6, 0xd0, 0xb3, 0x92, 0x5b, 0xda, 0x5e]);
interface IRTCBuddyGroup : IUnknown
{
    HRESULT get_Name(BSTR* pbstrGroupName);
    HRESULT put_Name(BSTR bstrGroupName);
    HRESULT AddBuddy(IRTCBuddy pBuddy);
    HRESULT RemoveBuddy(IRTCBuddy pBuddy);
    HRESULT EnumerateBuddies(IRTCEnumBuddies* ppEnum);
    HRESULT get_Buddies(IRTCCollection* ppCollection);
    HRESULT get_Data(BSTR* pbstrData);
    HRESULT put_Data(BSTR bstrData);
    HRESULT get_Profile(IRTCProfile2* ppProfile);
}
enum IID_IRTCEventNotification = GUID(0x13fa24c7, 0x5748, 0x4b21, [0x91, 0xf5, 0x73, 0x97, 0x60, 0x9c, 0xe7, 0x47]);
interface IRTCEventNotification : IUnknown
{
    HRESULT Event(RTC_EVENT RTCEvent, IDispatch pEvent);
}
enum IID_IRTCPortManager = GUID(0xda77c14b, 0x6208, 0x43ca, [0x8d, 0xdf, 0x5b, 0x60, 0xa0, 0xa6, 0x9f, 0xac]);
interface IRTCPortManager : IUnknown
{
    HRESULT GetMapping(BSTR bstrRemoteAddress, RTC_PORT_TYPE enPortType, BSTR* pbstrInternalLocalAddress, int* plInternalLocalPort, BSTR* pbstrExternalLocalAddress, int* plExternalLocalPort);
    HRESULT UpdateRemoteAddress(BSTR bstrRemoteAddress, BSTR bstrInternalLocalAddress, int lInternalLocalPort, BSTR bstrExternalLocalAddress, int lExternalLocalPort);
    HRESULT ReleaseMapping(BSTR bstrInternalLocalAddress, int lInternalLocalPort, BSTR bstrExternalLocalAddress, int lExternalLocalAddress);
}
enum IID_IRTCSessionPortManagement = GUID(0xa072f1d6, 0x286, 0x4e1f, [0x85, 0xf2, 0x17, 0xa2, 0x94, 0x84, 0x56, 0xec]);
interface IRTCSessionPortManagement : IUnknown
{
    HRESULT SetPortManager(IRTCPortManager pPortManager);
}
enum IID_IRTCClientPortManagement = GUID(0xd5df3f03, 0x4bde, 0x4417, [0xae, 0xfe, 0x71, 0x17, 0x7b, 0xda, 0xea, 0x66]);
interface IRTCClientPortManagement : IUnknown
{
    HRESULT StartListenAddressAndPort(BSTR bstrInternalLocalAddress, int lInternalLocalPort);
    HRESULT StopListenAddressAndPort(BSTR bstrInternalLocalAddress, int lInternalLocalPort);
    HRESULT GetPortRange(RTC_PORT_TYPE enPortType, int* plMinValue, int* plMaxValue);
}
enum IID_IRTCUserSearch = GUID(0xb619882b, 0x860c, 0x4db4, [0xbe, 0x1b, 0x69, 0x3b, 0x65, 0x5, 0xbb, 0xe5]);
interface IRTCUserSearch : IUnknown
{
    HRESULT CreateQuery(IRTCUserSearchQuery* ppQuery);
    HRESULT ExecuteSearch(IRTCUserSearchQuery pQuery, IRTCProfile pProfile, long lCookie);
}
enum IID_IRTCUserSearchQuery = GUID(0x288300f5, 0xd23a, 0x4365, [0x9a, 0x73, 0x99, 0x85, 0xc9, 0x8c, 0x28, 0x81]);
interface IRTCUserSearchQuery : IUnknown
{
    HRESULT put_SearchTerm(BSTR bstrName, BSTR bstrValue);
    HRESULT get_SearchTerm(BSTR bstrName, BSTR* pbstrValue);
    HRESULT get_SearchTerms(BSTR* pbstrNames);
    HRESULT put_SearchPreference(RTC_USER_SEARCH_PREFERENCE enPreference, int lValue);
    HRESULT get_SearchPreference(RTC_USER_SEARCH_PREFERENCE enPreference, int* plValue);
    HRESULT put_SearchDomain(BSTR bstrDomain);
    HRESULT get_SearchDomain(BSTR* pbstrDomain);
}
enum IID_IRTCUserSearchResult = GUID(0x851278b2, 0x9592, 0x480f, [0x8d, 0xb5, 0x2d, 0xe8, 0x6b, 0x26, 0xb5, 0x4d]);
interface IRTCUserSearchResult : IUnknown
{
    HRESULT get_Value(RTC_USER_SEARCH_COLUMN enColumn, BSTR* pbstrValue);
}
enum IID_IRTCEnumUserSearchResults = GUID(0x83d4d877, 0xaa5d, 0x4a5b, [0x8d, 0xe, 0x0, 0x2a, 0x80, 0x67, 0xe0, 0xe8]);
interface IRTCEnumUserSearchResults : IUnknown
{
    HRESULT Next(uint celt, IRTCUserSearchResult* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumUserSearchResults* ppEnum);
}
enum IID_IRTCUserSearchResultsEvent = GUID(0xd8c8c3cd, 0x7fac, 0x4088, [0x81, 0xc5, 0xc2, 0x4c, 0xbc, 0x9, 0x38, 0xe3]);
interface IRTCUserSearchResultsEvent : IDispatch
{
    HRESULT EnumerateResults(IRTCEnumUserSearchResults* ppEnum);
    HRESULT get_Results(IRTCCollection* ppCollection);
    HRESULT get_Profile(IRTCProfile2* ppProfile);
    HRESULT get_Query(IRTCUserSearchQuery* ppQuery);
    HRESULT get_Cookie(long* plCookie);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_MoreAvailable(VARIANT_BOOL* pfMoreAvailable);
}
enum IID_IRTCSessionReferStatusEvent = GUID(0x3d8fc2cd, 0x5d76, 0x44ab, [0xbb, 0x68, 0x2a, 0x80, 0x35, 0x3b, 0x34, 0xa2]);
interface IRTCSessionReferStatusEvent : IDispatch
{
    HRESULT get_Session(IRTCSession2* ppSession);
    HRESULT get_ReferStatus(RTC_SESSION_REFER_STATUS* penReferStatus);
    HRESULT get_StatusCode(int* plStatusCode);
    HRESULT get_StatusText(BSTR* pbstrStatusText);
}
enum IID_IRTCSessionReferredEvent = GUID(0x176a6828, 0x4fcc, 0x4f28, [0xa8, 0x62, 0x4, 0x59, 0x7a, 0x6c, 0xf1, 0xc4]);
interface IRTCSessionReferredEvent : IDispatch
{
    HRESULT get_Session(IRTCSession2* ppSession);
    HRESULT get_ReferredByURI(BSTR* pbstrReferredByURI);
    HRESULT get_ReferToURI(BSTR* pbstrReferoURI);
    HRESULT get_ReferCookie(BSTR* pbstrReferCookie);
    HRESULT Accept();
    HRESULT Reject();
    HRESULT SetReferredSessionState(RTC_SESSION_STATE enState);
}
enum IID_IRTCSessionDescriptionManager = GUID(0xba7f518e, 0xd336, 0x4070, [0x93, 0xa6, 0x86, 0x53, 0x95, 0xc8, 0x43, 0xf9]);
interface IRTCSessionDescriptionManager : IUnknown
{
    HRESULT EvaluateSessionDescription(BSTR bstrContentType, BSTR bstrSessionDescription, VARIANT_BOOL* pfApplicationSession);
}
enum IID_IRTCEnumPresenceDevices = GUID(0x708c2ab7, 0x8bf8, 0x42f8, [0x8c, 0x7d, 0x63, 0x51, 0x97, 0xad, 0x55, 0x39]);
interface IRTCEnumPresenceDevices : IUnknown
{
    HRESULT Next(uint celt, IRTCPresenceDevice* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IRTCEnumPresenceDevices* ppEnum);
}
enum IID_IRTCPresenceDevice = GUID(0xbc6a90dd, 0xad9a, 0x48da, [0x9b, 0xc, 0x25, 0x15, 0xe3, 0x85, 0x21, 0xad]);
interface IRTCPresenceDevice : IUnknown
{
    HRESULT get_Status(RTC_PRESENCE_STATUS* penStatus);
    HRESULT get_Notes(BSTR* pbstrNotes);
    HRESULT get_PresenceProperty(RTC_PRESENCE_PROPERTY enProperty, BSTR* pbstrProperty);
    HRESULT GetPresenceData(BSTR* pbstrNamespace, BSTR* pbstrData);
}
enum IID_IRTCDispatchEventNotification = GUID(0x176ddfbe, 0xfec0, 0x4d55, [0xbc, 0x87, 0x84, 0xcf, 0xf1, 0xef, 0x7f, 0x91]);
interface IRTCDispatchEventNotification : IDispatch
{
}
enum CLSID_RTCClient = GUID(0x7a42ea29, 0xa2b7, 0x40c4, [0xb0, 0x91, 0xf6, 0xf0, 0x24, 0xaa, 0x89, 0xbe]);
struct RTCClient
{
}
struct TRANSPORT_SETTING
{
    TRANSPORT_SETTING_ID SettingId;
    uint* Length;
    ubyte* Value;
}
enum IID_ITransportSettingsInternal = GUID(0x5123e076, 0x29e3, 0x4bfd, [0x84, 0xfe, 0x1, 0x92, 0xd4, 0x11, 0xe3, 0xe8]);
interface ITransportSettingsInternal : IUnknown
{
    HRESULT ApplySetting(TRANSPORT_SETTING* Setting);
    HRESULT QuerySetting(TRANSPORT_SETTING* Setting);
}
enum IID_INetworkTransportSettings = GUID(0x5e7abb2c, 0xf2c1, 0x4a61, [0xbd, 0x35, 0xde, 0xb7, 0xa0, 0x8a, 0xb0, 0xf1]);
interface INetworkTransportSettings : IUnknown
{
    HRESULT ApplySetting(const(TRANSPORT_SETTING_ID)* SettingId, uint LengthIn, const(ubyte)* ValueIn, uint* LengthOut, ubyte** ValueOut);
    HRESULT QuerySetting(const(TRANSPORT_SETTING_ID)* SettingId, uint LengthIn, const(ubyte)* ValueIn, uint* LengthOut, ubyte** ValueOut);
}
enum IID_INotificationTransportSync = GUID(0x79eb1402, 0xab8, 0x49c0, [0x9e, 0x14, 0xa1, 0xae, 0x4b, 0xa9, 0x30, 0x58]);
interface INotificationTransportSync : IUnknown
{
    HRESULT CompleteDelivery();
    HRESULT Flush();
}
