module windows.win32.networkmanagement.qos;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HANDLE, PSTR, PWSTR;
import windows.win32.networkmanagement.ndis : NETWORK_ADDRESS_LIST;
import windows.win32.networking.winsock : FLOWSPEC, IN_ADDR, SOCKADDR, SOCKET;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

BOOL QOSCreateHandle(QOS_VERSION*, HANDLE*);
BOOL QOSCloseHandle(HANDLE);
BOOL QOSStartTrackingClient(HANDLE, SOCKADDR*, uint);
BOOL QOSStopTrackingClient(HANDLE, SOCKADDR*, uint);
BOOL QOSEnumerateFlows(HANDLE, uint*, void*);
BOOL QOSAddSocketToFlow(HANDLE, SOCKET, SOCKADDR*, QOS_TRAFFIC_TYPE, uint, uint*);
BOOL QOSRemoveSocketFromFlow(HANDLE, SOCKET, uint, uint);
BOOL QOSSetFlow(HANDLE, uint, QOS_SET_FLOW, uint, void*, uint, OVERLAPPED*);
BOOL QOSQueryFlow(HANDLE, uint, QOS_QUERY_FLOW, uint*, void*, uint, OVERLAPPED*);
BOOL QOSNotifyFlow(HANDLE, uint, QOS_NOTIFY_FLOW, uint*, void*, uint, OVERLAPPED*);
BOOL QOSCancel(HANDLE, OVERLAPPED*);
uint TcRegisterClient(uint, HANDLE, TCI_CLIENT_FUNC_LIST*, HANDLE*);
uint TcEnumerateInterfaces(HANDLE, uint*, TC_IFC_DESCRIPTOR*);
uint TcOpenInterfaceA(PSTR, HANDLE, HANDLE, HANDLE*);
uint TcOpenInterfaceW(PWSTR, HANDLE, HANDLE, HANDLE*);
uint TcCloseInterface(HANDLE);
uint TcQueryInterface(HANDLE, GUID*, BOOLEAN, uint*, void*);
uint TcSetInterface(HANDLE, GUID*, uint, void*);
uint TcQueryFlowA(PSTR, GUID*, uint*, void*);
uint TcQueryFlowW(PWSTR, GUID*, uint*, void*);
uint TcSetFlowA(PSTR, GUID*, uint, void*);
uint TcSetFlowW(PWSTR, GUID*, uint, void*);
uint TcAddFlow(HANDLE, HANDLE, uint, TC_GEN_FLOW*, HANDLE*);
uint TcGetFlowNameA(HANDLE, uint, PSTR);
uint TcGetFlowNameW(HANDLE, uint, PWSTR);
uint TcModifyFlow(HANDLE, TC_GEN_FLOW*);
uint TcAddFilter(HANDLE, TC_GEN_FILTER*, HANDLE*);
uint TcDeregisterClient(HANDLE);
uint TcDeleteFlow(HANDLE);
uint TcDeleteFilter(HANDLE);
uint TcEnumerateFlows(HANDLE, HANDLE*, uint*, uint*, ENUMERATION_BUFFER*);
enum QOS_MAX_OBJECT_STRING_LENGTH = 0x00000100;
enum QOS_TRAFFIC_GENERAL_ID_BASE = 0x00000fa0;
enum SERVICETYPE_NOTRAFFIC = 0x00000000;
enum SERVICETYPE_BESTEFFORT = 0x00000001;
enum SERVICETYPE_CONTROLLEDLOAD = 0x00000002;
enum SERVICETYPE_GUARANTEED = 0x00000003;
enum SERVICETYPE_NETWORK_UNAVAILABLE = 0x00000004;
enum SERVICETYPE_GENERAL_INFORMATION = 0x00000005;
enum SERVICETYPE_NOCHANGE = 0x00000006;
enum SERVICETYPE_NONCONFORMING = 0x00000009;
enum SERVICETYPE_NETWORK_CONTROL = 0x0000000a;
enum SERVICETYPE_QUALITATIVE = 0x0000000d;
enum SERVICE_BESTEFFORT = 0x80010000;
enum SERVICE_CONTROLLEDLOAD = 0x80020000;
enum SERVICE_GUARANTEED = 0x80040000;
enum SERVICE_QUALITATIVE = 0x80200000;
enum SERVICE_NO_TRAFFIC_CONTROL = 0x81000000;
enum SERVICE_NO_QOS_SIGNALING = 0x40000000;
enum QOS_NOT_SPECIFIED = 0xffffffff;
enum POSITIVE_INFINITY_RATE = 0xfffffffe;
enum QOS_GENERAL_ID_BASE = 0x000007d0;
enum TC_NONCONF_BORROW = 0x00000000;
enum TC_NONCONF_SHAPE = 0x00000001;
enum TC_NONCONF_DISCARD = 0x00000002;
enum TC_NONCONF_BORROW_PLUS = 0x00000003;
enum class_NULL = 0x00000000;
enum class_SESSION = 0x00000001;
enum class_SESSION_GROUP = 0x00000002;
enum class_RSVP_HOP = 0x00000003;
enum class_INTEGRITY = 0x00000004;
enum class_TIME_VALUES = 0x00000005;
enum class_ERROR_SPEC = 0x00000006;
enum class_SCOPE = 0x00000007;
enum class_STYLE = 0x00000008;
enum class_FLOWSPEC = 0x00000009;
enum class_IS_FLOWSPEC = 0x00000009;
enum class_FILTER_SPEC = 0x0000000a;
enum class_SENDER_TEMPLATE = 0x0000000b;
enum class_SENDER_TSPEC = 0x0000000c;
enum class_ADSPEC = 0x0000000d;
enum class_POLICY_DATA = 0x0000000e;
enum class_CONFIRM = 0x0000000f;
enum class_MAX = 0x0000000f;
enum ctype_SESSION_ipv4 = 0x00000001;
enum ctype_SESSION_ipv4GPI = 0x00000003;
enum SESSFLG_E_Police = 0x00000001;
enum ctype_RSVP_HOP_ipv4 = 0x00000001;
enum Opt_Share_mask = 0x00000018;
enum Opt_Distinct = 0x00000008;
enum Opt_Shared = 0x00000010;
enum Opt_SndSel_mask = 0x00000007;
enum Opt_Wildcard = 0x00000001;
enum Opt_Explicit = 0x00000002;
enum ctype_STYLE = 0x00000001;
enum ctype_FILTER_SPEC_ipv4 = 0x00000001;
enum ctype_FILTER_SPEC_ipv4GPI = 0x00000004;
enum ctype_SENDER_TEMPLATE_ipv4 = 0x00000001;
enum ctype_SENDER_TEMPLATE_ipv4GPI = 0x00000004;
enum ctype_SCOPE_list_ipv4 = 0x00000001;
enum ctype_ERROR_SPEC_ipv4 = 0x00000001;
enum ERROR_SPECF_InPlace = 0x00000001;
enum ERROR_SPECF_NotGuilty = 0x00000002;
enum ERR_FORWARD_OK = 0x00008000;
enum ERR_Usage_globl = 0x00000000;
enum ERR_Usage_local = 0x00000010;
enum ERR_Usage_serv = 0x00000011;
enum ERR_global_mask = 0x00000fff;
enum ctype_POLICY_DATA = 0x00000001;
enum GENERAL_INFO = 0x00000001;
enum GUARANTEED_SERV = 0x00000002;
enum PREDICTIVE_SERV = 0x00000003;
enum CONTROLLED_DELAY_SERV = 0x00000004;
enum CONTROLLED_LOAD_SERV = 0x00000005;
enum QUALITATIVE_SERV = 0x00000006;
enum INTSERV_VERS_MASK = 0x000000f0;
enum INTSERV_VERSION0 = 0x00000000;
enum ISSH_BREAK_BIT = 0x00000080;
enum ISPH_FLG_INV = 0x00000080;
enum ctype_SENDER_TSPEC = 0x00000002;
enum ctype_FLOWSPEC_Intserv0 = 0x00000002;
enum ctype_ADSPEC_INTSERV = 0x00000002;
enum RSVP_PATH = 0x00000001;
enum RSVP_RESV = 0x00000002;
enum RSVP_PATH_ERR = 0x00000003;
enum RSVP_RESV_ERR = 0x00000004;
enum RSVP_PATH_TEAR = 0x00000005;
enum RSVP_RESV_TEAR = 0x00000006;
enum RSVP_Err_NONE = 0x00000000;
enum RSVP_Erv_Nonev = 0x00000000;
enum RSVP_Err_ADMISSION = 0x00000001;
enum RSVP_Erv_Other = 0x00000000;
enum RSVP_Erv_DelayBnd = 0x00000001;
enum RSVP_Erv_Bandwidth = 0x00000002;
enum RSVP_Erv_MTU = 0x00000003;
enum RSVP_Erv_Flow_Rate = 0x00008001;
enum RSVP_Erv_Bucket_szie = 0x00008002;
enum RSVP_Erv_Peak_Rate = 0x00008003;
enum RSVP_Erv_Min_Policied_size = 0x00008004;
enum RSVP_Err_POLICY = 0x00000002;
enum POLICY_ERRV_NO_MORE_INFO = 0x00000001;
enum POLICY_ERRV_UNSUPPORTED_CREDENTIAL_TYPE = 0x00000002;
enum POLICY_ERRV_INSUFFICIENT_PRIVILEGES = 0x00000003;
enum POLICY_ERRV_EXPIRED_CREDENTIALS = 0x00000004;
enum POLICY_ERRV_IDENTITY_CHANGED = 0x00000005;
enum POLICY_ERRV_UNKNOWN = 0x00000000;
enum POLICY_ERRV_GLOBAL_DEF_FLOW_COUNT = 0x00000001;
enum POLICY_ERRV_GLOBAL_GRP_FLOW_COUNT = 0x00000002;
enum POLICY_ERRV_GLOBAL_USER_FLOW_COUNT = 0x00000003;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_COUNT = 0x00000004;
enum POLICY_ERRV_SUBNET_DEF_FLOW_COUNT = 0x00000005;
enum POLICY_ERRV_SUBNET_GRP_FLOW_COUNT = 0x00000006;
enum POLICY_ERRV_SUBNET_USER_FLOW_COUNT = 0x00000007;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_COUNT = 0x00000008;
enum POLICY_ERRV_GLOBAL_DEF_FLOW_DURATION = 0x00000009;
enum POLICY_ERRV_GLOBAL_GRP_FLOW_DURATION = 0x0000000a;
enum POLICY_ERRV_GLOBAL_USER_FLOW_DURATION = 0x0000000b;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_DURATION = 0x0000000c;
enum POLICY_ERRV_SUBNET_DEF_FLOW_DURATION = 0x0000000d;
enum POLICY_ERRV_SUBNET_GRP_FLOW_DURATION = 0x0000000e;
enum POLICY_ERRV_SUBNET_USER_FLOW_DURATION = 0x0000000f;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_DURATION = 0x00000010;
enum POLICY_ERRV_GLOBAL_DEF_FLOW_RATE = 0x00000011;
enum POLICY_ERRV_GLOBAL_GRP_FLOW_RATE = 0x00000012;
enum POLICY_ERRV_GLOBAL_USER_FLOW_RATE = 0x00000013;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_RATE = 0x00000014;
enum POLICY_ERRV_SUBNET_DEF_FLOW_RATE = 0x00000015;
enum POLICY_ERRV_SUBNET_GRP_FLOW_RATE = 0x00000016;
enum POLICY_ERRV_SUBNET_USER_FLOW_RATE = 0x00000017;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_RATE = 0x00000018;
enum POLICY_ERRV_GLOBAL_DEF_PEAK_RATE = 0x00000019;
enum POLICY_ERRV_GLOBAL_GRP_PEAK_RATE = 0x0000001a;
enum POLICY_ERRV_GLOBAL_USER_PEAK_RATE = 0x0000001b;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_PEAK_RATE = 0x0000001c;
enum POLICY_ERRV_SUBNET_DEF_PEAK_RATE = 0x0000001d;
enum POLICY_ERRV_SUBNET_GRP_PEAK_RATE = 0x0000001e;
enum POLICY_ERRV_SUBNET_USER_PEAK_RATE = 0x0000001f;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_PEAK_RATE = 0x00000020;
enum POLICY_ERRV_GLOBAL_DEF_SUM_FLOW_RATE = 0x00000021;
enum POLICY_ERRV_GLOBAL_GRP_SUM_FLOW_RATE = 0x00000022;
enum POLICY_ERRV_GLOBAL_USER_SUM_FLOW_RATE = 0x00000023;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_FLOW_RATE = 0x00000024;
enum POLICY_ERRV_SUBNET_DEF_SUM_FLOW_RATE = 0x00000025;
enum POLICY_ERRV_SUBNET_GRP_SUM_FLOW_RATE = 0x00000026;
enum POLICY_ERRV_SUBNET_USER_SUM_FLOW_RATE = 0x00000027;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_FLOW_RATE = 0x00000028;
enum POLICY_ERRV_GLOBAL_DEF_SUM_PEAK_RATE = 0x00000029;
enum POLICY_ERRV_GLOBAL_GRP_SUM_PEAK_RATE = 0x0000002a;
enum POLICY_ERRV_GLOBAL_USER_SUM_PEAK_RATE = 0x0000002b;
enum POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_PEAK_RATE = 0x0000002c;
enum POLICY_ERRV_SUBNET_DEF_SUM_PEAK_RATE = 0x0000002d;
enum POLICY_ERRV_SUBNET_GRP_SUM_PEAK_RATE = 0x0000002e;
enum POLICY_ERRV_SUBNET_USER_SUM_PEAK_RATE = 0x0000002f;
enum POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_PEAK_RATE = 0x00000030;
enum POLICY_ERRV_UNKNOWN_USER = 0x00000031;
enum POLICY_ERRV_NO_PRIVILEGES = 0x00000032;
enum POLICY_ERRV_EXPIRED_USER_TOKEN = 0x00000033;
enum POLICY_ERRV_NO_RESOURCES = 0x00000034;
enum POLICY_ERRV_PRE_EMPTED = 0x00000035;
enum POLICY_ERRV_USER_CHANGED = 0x00000036;
enum POLICY_ERRV_NO_ACCEPTS = 0x00000037;
enum POLICY_ERRV_NO_MEMORY = 0x00000038;
enum POLICY_ERRV_CRAZY_FLOWSPEC = 0x00000039;
enum RSVP_Err_NO_PATH = 0x00000003;
enum RSVP_Err_NO_SENDER = 0x00000004;
enum RSVP_Err_BAD_STYLE = 0x00000005;
enum RSVP_Err_UNKNOWN_STYLE = 0x00000006;
enum RSVP_Err_BAD_DSTPORT = 0x00000007;
enum RSVP_Err_BAD_SNDPORT = 0x00000008;
enum RSVP_Err_AMBIG_FILTER = 0x00000009;
enum RSVP_Err_PREEMPTED = 0x0000000c;
enum RSVP_Err_UNKN_OBJ_CLASS = 0x0000000d;
enum RSVP_Err_UNKNOWN_CTYPE = 0x0000000e;
enum RSVP_Err_API_ERROR = 0x00000014;
enum RSVP_Err_TC_ERROR = 0x00000015;
enum RSVP_Erv_Conflict_Serv = 0x00000001;
enum RSVP_Erv_No_Serv = 0x00000002;
enum RSVP_Erv_Crazy_Flowspec = 0x00000003;
enum RSVP_Erv_Crazy_Tspec = 0x00000004;
enum RSVP_Err_TC_SYS_ERROR = 0x00000016;
enum RSVP_Err_RSVP_SYS_ERROR = 0x00000017;
enum RSVP_Erv_MEMORY = 0x00000001;
enum RSVP_Erv_API = 0x00000002;
enum LPM_PE_USER_IDENTITY = 0x00000002;
enum LPM_PE_APP_IDENTITY = 0x00000003;
enum ERROR_NO_MORE_INFO = 0x00000001;
enum UNSUPPORTED_CREDENTIAL_TYPE = 0x00000002;
enum INSUFFICIENT_PRIVILEGES = 0x00000003;
enum EXPIRED_CREDENTIAL = 0x00000004;
enum IDENTITY_CHANGED = 0x00000005;
enum LPM_OK = 0x00000000;
enum INV_LPM_HANDLE = 0x00000001;
enum LPM_TIME_OUT = 0x00000002;
enum INV_REQ_HANDLE = 0x00000003;
enum DUP_RESULTS = 0x00000004;
enum INV_RESULTS = 0x00000005;
enum LPM_PE_ALL_TYPES = 0x00000000;
enum LPM_API_VERSION_1 = 0x00000001;
enum PCM_VERSION_1 = 0x00000001;
enum LPV_RESERVED = 0x00000000;
enum LPV_MIN_PRIORITY = 0x00000001;
enum LPV_MAX_PRIORITY = 0x0000ff00;
enum LPV_DROP_MSG = 0x0000fffd;
enum LPV_DONT_CARE = 0x0000fffe;
enum LPV_REJECT = 0x0000ffff;
enum FORCE_IMMEDIATE_REFRESH = 0x00000001;
enum LPM_RESULT_READY = 0x00000000;
enum LPM_RESULT_DEFER = 0x00000001;
enum RCVD_PATH_TEAR = 0x00000001;
enum RCVD_RESV_TEAR = 0x00000002;
enum ADM_CTRL_FAILED = 0x00000003;
enum STATE_TIMEOUT = 0x00000004;
enum FLOW_DURATION = 0x00000005;
enum RESOURCES_ALLOCATED = 0x00000001;
enum RESOURCES_MODIFIED = 0x00000002;
enum CURRENT_TCI_VERSION = 0x00000002;
enum TC_NOTIFY_IFC_UP = 0x00000001;
enum TC_NOTIFY_IFC_CLOSE = 0x00000002;
enum TC_NOTIFY_IFC_CHANGE = 0x00000003;
enum TC_NOTIFY_PARAM_CHANGED = 0x00000004;
enum TC_NOTIFY_FLOW_CLOSE = 0x00000005;
enum MAX_STRING_LENGTH = 0x00000100;
enum QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH = 0xffffffff;
enum QOS_QUERYFLOW_FRESH = 0x00000001;
enum QOS_NON_ADAPTIVE_FLOW = 0x00000002;
enum RSVP_OBJECT_ID_BASE = 0x000003e8;
enum RSVP_DEFAULT_STYLE = 0x00000000;
enum RSVP_WILDCARD_STYLE = 0x00000001;
enum RSVP_FIXED_FILTER_STYLE = 0x00000002;
enum RSVP_SHARED_EXPLICIT_STYLE = 0x00000003;
enum AD_FLAG_BREAK_BIT = 0x00000001;
enum mIOC_IN = 0x80000000;
enum mIOC_OUT = 0x40000000;
enum mIOC_VENDOR = 0x04000000;
enum mCOMPANY = 0x18000000;
enum ioctl_code = 0x00000001;
enum QOSSPBASE = 0x0000c350;
enum ALLOWED_TO_SEND_DATA = 0x0000c351;
enum ABLE_TO_RECV_RSVP = 0x0000c352;
enum LINE_RATE = 0x0000c353;
enum LOCAL_TRAFFIC_CONTROL = 0x0000c354;
enum LOCAL_QOSABILITY = 0x0000c355;
enum END_TO_END_QOSABILITY = 0x0000c356;
enum INFO_NOT_AVAILABLE = 0xffffffff;
enum ANY_DEST_ADDR = 0xffffffff;
enum MODERATELY_DELAY_SENSITIVE = 0xfffffffd;
enum HIGHLY_DELAY_SENSITIVE = 0xfffffffe;
enum QOSSP_ERR_BASE = 0x0000dac0;
enum GQOS_NO_ERRORCODE = 0x00000000;
enum GQOS_NO_ERRORVALUE = 0x00000000;
enum GQOS_ERRORCODE_UNKNOWN = 0xffffffff;
enum GQOS_ERRORVALUE_UNKNOWN = 0xffffffff;
enum GQOS_NET_ADMISSION = 0x0000db24;
enum GQOS_NET_POLICY = 0x0000db88;
enum GQOS_RSVP = 0x0000dbec;
enum GQOS_API = 0x0000dc50;
enum GQOS_KERNEL_TC_SYS = 0x0000dcb4;
enum GQOS_RSVP_SYS = 0x0000dd18;
enum GQOS_KERNEL_TC = 0x0000dd7c;
enum PE_TYPE_APPID = 0x00000003;
enum PE_ATTRIB_TYPE_POLICY_LOCATOR = 0x00000001;
enum POLICY_LOCATOR_SUB_TYPE_ASCII_DN = 0x00000001;
enum POLICY_LOCATOR_SUB_TYPE_UNICODE_DN = 0x00000002;
enum POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC = 0x00000003;
enum POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC = 0x00000004;
enum PE_ATTRIB_TYPE_CREDENTIAL = 0x00000002;
enum CREDENTIAL_SUB_TYPE_ASCII_ID = 0x00000001;
enum CREDENTIAL_SUB_TYPE_UNICODE_ID = 0x00000002;
enum CREDENTIAL_SUB_TYPE_KERBEROS_TKT = 0x00000003;
enum CREDENTIAL_SUB_TYPE_X509_V3_CERT = 0x00000004;
enum CREDENTIAL_SUB_TYPE_PGP_CERT = 0x00000005;
enum TCBASE = 0x00001d4c;
enum ERROR_INCOMPATIBLE_TCI_VERSION = 0x00001d4d;
enum ERROR_INVALID_SERVICE_TYPE = 0x00001d4e;
enum ERROR_INVALID_TOKEN_RATE = 0x00001d4f;
enum ERROR_INVALID_PEAK_RATE = 0x00001d50;
enum ERROR_INVALID_SD_MODE = 0x00001d51;
enum ERROR_INVALID_QOS_PRIORITY = 0x00001d52;
enum ERROR_INVALID_TRAFFIC_CLASS = 0x00001d53;
enum ERROR_INVALID_ADDRESS_TYPE = 0x00001d54;
enum ERROR_DUPLICATE_FILTER = 0x00001d55;
enum ERROR_FILTER_CONFLICT = 0x00001d56;
enum ERROR_ADDRESS_TYPE_NOT_SUPPORTED = 0x00001d57;
enum ERROR_TC_SUPPORTED_OBJECTS_EXIST = 0x00001d58;
enum ERROR_INCOMPATABLE_QOS = 0x00001d59;
enum ERROR_TC_NOT_SUPPORTED = 0x00001d5a;
enum ERROR_TC_OBJECT_LENGTH_INVALID = 0x00001d5b;
enum ERROR_INVALID_FLOW_MODE = 0x00001d5c;
enum ERROR_INVALID_DIFFSERV_FLOW = 0x00001d5d;
enum ERROR_DS_MAPPING_EXISTS = 0x00001d5e;
enum ERROR_INVALID_SHAPE_RATE = 0x00001d5f;
enum ERROR_INVALID_DS_CLASS = 0x00001d60;
enum ERROR_TOO_MANY_CLIENTS = 0x00001d61;
enum GUID_QOS_REMAINING_BANDWIDTH = GUID(0xc4c51720, 0x40ec, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_BESTEFFORT_BANDWIDTH = GUID(0xed885290, 0x40ec, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_LATENCY = GUID(0xfc408ef0, 0x40ec, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_FLOW_COUNT = GUID(0x1147f880, 0x40ed, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_NON_BESTEFFORT_LIMIT = GUID(0x185c44e0, 0x40ed, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_MAX_OUTSTANDING_SENDS = GUID(0x161ffa86, 0x6120, 0x11d1, [0x2c, 0x91, 0x0, 0xaa, 0x0, 0x57, 0x49, 0x15]);
enum GUID_QOS_STATISTICS_BUFFER = GUID(0xbb2c0980, 0xe900, 0x11d1, [0xb0, 0x7e, 0x0, 0x80, 0xc7, 0x13, 0x82, 0xbf]);
enum GUID_QOS_FLOW_MODE = GUID(0x5c82290a, 0x515a, 0x11d2, [0x8e, 0x58, 0x0, 0xc0, 0x4f, 0xc9, 0xbf, 0xcb]);
enum GUID_QOS_ISSLOW_FLOW = GUID(0xabf273a4, 0xee07, 0x11d2, [0xbe, 0x1b, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_TIMER_RESOLUTION = GUID(0xba10cc88, 0xf13e, 0x11d2, [0xbe, 0x1b, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_FLOW_IP_CONFORMING = GUID(0x7f99a8b, 0xfcd2, 0x11d2, [0xbe, 0x1e, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_FLOW_IP_NONCONFORMING = GUID(0x87a5987, 0xfcd2, 0x11d2, [0xbe, 0x1e, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_FLOW_8021P_CONFORMING = GUID(0x8c1e013, 0xfcd2, 0x11d2, [0xbe, 0x1e, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_FLOW_8021P_NONCONFORMING = GUID(0x9023f91, 0xfcd2, 0x11d2, [0xbe, 0x1e, 0x0, 0xa0, 0xc9, 0x9e, 0xe6, 0x3b]);
enum GUID_QOS_ENABLE_AVG_STATS = GUID(0xbafb6d11, 0x27c4, 0x4801, [0xa4, 0x6f, 0xef, 0x80, 0x80, 0xc1, 0x88, 0xc8]);
enum GUID_QOS_ENABLE_WINDOW_ADJUSTMENT = GUID(0xaa966725, 0xd3e9, 0x4c55, [0xb3, 0x35, 0x2a, 0x0, 0x27, 0x9a, 0x1e, 0x64]);
enum FSCTL_TCP_BASE = 0x00000012;
enum DD_TCP_DEVICE_NAME = "\\Device\\Tcp";
enum IF_MIB_STATS_ID = 0x00000001;
enum IP_MIB_STATS_ID = 0x00000001;
enum IP_MIB_ADDRTABLE_ENTRY_ID = 0x00000102;
enum IP_INTFC_INFO_ID = 0x00000103;
enum MAX_PHYSADDR_SIZE = 0x00000008;
enum SIPAEV_PREBOOT_CERT = 0x00000000;
enum SIPAEV_POST_CODE = 0x00000001;
enum SIPAEV_UNUSED = 0x00000002;
enum SIPAEV_NO_ACTION = 0x00000003;
enum SIPAEV_SEPARATOR = 0x00000004;
enum SIPAEV_ACTION = 0x00000005;
enum SIPAEV_EVENT_TAG = 0x00000006;
enum SIPAEV_S_CRTM_CONTENTS = 0x00000007;
enum SIPAEV_S_CRTM_VERSION = 0x00000008;
enum SIPAEV_CPU_MICROCODE = 0x00000009;
enum SIPAEV_PLATFORM_CONFIG_FLAGS = 0x0000000a;
enum SIPAEV_TABLE_OF_DEVICES = 0x0000000b;
enum SIPAEV_COMPACT_HASH = 0x0000000c;
enum SIPAEV_IPL = 0x0000000d;
enum SIPAEV_IPL_PARTITION_DATA = 0x0000000e;
enum SIPAEV_NONHOST_CODE = 0x0000000f;
enum SIPAEV_NONHOST_CONFIG = 0x00000010;
enum SIPAEV_NONHOST_INFO = 0x00000011;
enum SIPAEV_OMIT_BOOT_DEVICE_EVENTS = 0x00000012;
enum SIPAEV_EFI_EVENT_BASE = 0x80000000;
enum SIPAEV_EFI_VARIABLE_DRIVER_CONFIG = 0x80000001;
enum SIPAEV_EFI_VARIABLE_BOOT = 0x80000002;
enum SIPAEV_EFI_BOOT_SERVICES_APPLICATION = 0x80000003;
enum SIPAEV_EFI_BOOT_SERVICES_DRIVER = 0x80000004;
enum SIPAEV_EFI_RUNTIME_SERVICES_DRIVER = 0x80000005;
enum SIPAEV_EFI_GPT_EVENT = 0x80000006;
enum SIPAEV_EFI_ACTION = 0x80000007;
enum SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB = 0x80000008;
enum SIPAEV_EFI_HANDOFF_TABLES = 0x80000009;
enum SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 = 0x8000000a;
enum SIPAEV_EFI_HANDOFF_TABLES2 = 0x8000000b;
enum SIPAEV_EFI_VARIABLE_BOOT2 = 0x8000000c;
enum SIPAEV_EFI_HCRTM_EVENT = 0x80000010;
enum SIPAEV_EFI_VARIABLE_AUTHORITY = 0x800000e0;
enum SIPAEV_EFI_SPDM_FIRMWARE_BLOB = 0x800000e1;
enum SIPAEV_EFI_SPDM_FIRMWARE_CONFIG = 0x800000e2;
enum SIPAEV_TXT_EVENT_BASE = 0x00000400;
enum SIPAEV_TXT_PCR_MAPPING = 0x00000401;
enum SIPAEV_TXT_HASH_START = 0x00000402;
enum SIPAEV_TXT_COMBINED_HASH = 0x00000403;
enum SIPAEV_TXT_MLE_HASH = 0x00000404;
enum SIPAEV_TXT_BIOSAC_REG_DATA = 0x0000040a;
enum SIPAEV_TXT_CPU_SCRTM_STAT = 0x0000040b;
enum SIPAEV_TXT_LCP_CONTROL_HASH = 0x0000040c;
enum SIPAEV_TXT_ELEMENTS_HASH = 0x0000040d;
enum SIPAEV_TXT_STM_HASH = 0x0000040e;
enum SIPAEV_TXT_OSSINITDATA_CAP_HASH = 0x0000040f;
enum SIPAEV_TXT_SINIT_PUBKEY_HASH = 0x00000410;
enum SIPAEV_TXT_LCP_HASH = 0x00000411;
enum SIPAEV_TXT_LCP_DETAILS_HASH = 0x00000412;
enum SIPAEV_TXT_LCP_AUTHORITIES_HASH = 0x00000413;
enum SIPAEV_TXT_NV_INFO_HASH = 0x00000414;
enum SIPAEV_TXT_COLD_BOOT_BIOS_HASH = 0x00000415;
enum SIPAEV_TXT_KM_HASH = 0x00000416;
enum SIPAEV_TXT_BPM_HASH = 0x00000417;
enum SIPAEV_TXT_KM_INFO_HASH = 0x00000418;
enum SIPAEV_TXT_BPM_INFO_HASH = 0x00000419;
enum SIPAEV_TXT_BOOT_POL_HASH = 0x0000041a;
enum SIPAEV_TXT_RANDOM_VALUE = 0x000004fe;
enum SIPAEV_TXT_CAP_VALUE = 0x000004ff;
enum SIPAEV_AMD_SL_EVENT_BASE = 0x00008000;
enum SIPAEV_AMD_SL_LOAD = 0x00008001;
enum SIPAEV_AMD_SL_PSP_FW_SPLT = 0x00008002;
enum SIPAEV_AMD_SL_TSME_RB_FUSE = 0x00008003;
enum SIPAEV_AMD_SL_PUB_KEY = 0x00008004;
enum SIPAEV_AMD_SL_SVN = 0x00008005;
enum SIPAEV_AMD_SL_LOAD_1 = 0x00008006;
enum SIPAEV_AMD_SL_SEPARATOR = 0x00008007;
enum SIPAEVENTTYPE_NONMEASURED = 0x80000000;
enum SIPAEVENTTYPE_AGGREGATION = 0x40000000;
enum SIPAEVENTTYPE_CONTAINER = 0x00010000;
enum SIPAEVENTTYPE_INFORMATION = 0x00020000;
enum SIPAEVENTTYPE_ERROR = 0x00030000;
enum SIPAEVENTTYPE_PREOSPARAMETER = 0x00040000;
enum SIPAEVENTTYPE_OSPARAMETER = 0x00050000;
enum SIPAEVENTTYPE_AUTHORITY = 0x00060000;
enum SIPAEVENTTYPE_LOADEDMODULE = 0x00070000;
enum SIPAEVENTTYPE_TRUSTPOINT = 0x00080000;
enum SIPAEVENTTYPE_ELAM = 0x00090000;
enum SIPAEVENTTYPE_VBS = 0x000a0000;
enum SIPAEVENTTYPE_KSR = 0x000b0000;
enum SIPAEVENTTYPE_DRTM = 0x000c0000;
enum SIPAERROR_FIRMWAREFAILURE = 0x00030001;
enum SIPAERROR_INTERNALFAILURE = 0x00030003;
enum SIPAEVENT_INFORMATION = 0x00020001;
enum SIPAEVENT_BOOTCOUNTER = 0x00020002;
enum SIPAEVENT_TRANSFER_CONTROL = 0x00020003;
enum SIPAEVENT_APPLICATION_RETURN = 0x00020004;
enum SIPAEVENT_BITLOCKER_UNLOCK = 0x00020005;
enum SIPAEVENT_EVENTCOUNTER = 0x00020006;
enum SIPAEVENT_COUNTERID = 0x00020007;
enum SIPAEVENT_MORBIT_NOT_CANCELABLE = 0x00020008;
enum SIPAEVENT_APPLICATION_SVN = 0x00020009;
enum SIPAEVENT_SVN_CHAIN_STATUS = 0x0002000a;
enum SIPAEVENT_MORBIT_API_STATUS = 0x0002000b;
enum SIPAEVENT_BOOTDEBUGGING = 0x00040001;
enum SIPAEVENT_BOOT_REVOCATION_LIST = 0x00040002;
enum SIPAEVENT_OSKERNELDEBUG = 0x00050001;
enum SIPAEVENT_CODEINTEGRITY = 0x00050002;
enum SIPAEVENT_TESTSIGNING = 0x00050003;
enum SIPAEVENT_DATAEXECUTIONPREVENTION = 0x00050004;
enum SIPAEVENT_SAFEMODE = 0x00050005;
enum SIPAEVENT_WINPE = 0x00050006;
enum SIPAEVENT_PHYSICALADDRESSEXTENSION = 0x00050007;
enum SIPAEVENT_OSDEVICE = 0x00050008;
enum SIPAEVENT_SYSTEMROOT = 0x00050009;
enum SIPAEVENT_HYPERVISOR_LAUNCH_TYPE = 0x0005000a;
enum SIPAEVENT_HYPERVISOR_PATH = 0x0005000b;
enum SIPAEVENT_HYPERVISOR_IOMMU_POLICY = 0x0005000c;
enum SIPAEVENT_HYPERVISOR_DEBUG = 0x0005000d;
enum SIPAEVENT_DRIVER_LOAD_POLICY = 0x0005000e;
enum SIPAEVENT_SI_POLICY = 0x0005000f;
enum SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY = 0x00050010;
enum SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY = 0x00050011;
enum SIPAEVENT_VSM_LAUNCH_TYPE = 0x00050012;
enum SIPAEVENT_OS_REVOCATION_LIST = 0x00050013;
enum SIPAEVENT_SMT_STATUS = 0x00050014;
enum SIPAEVENT_VSM_IDK_INFO = 0x00050020;
enum SIPAEVENT_FLIGHTSIGNING = 0x00050021;
enum SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED = 0x00050022;
enum SIPAEVENT_VSM_IDKS_INFO = 0x00050023;
enum SIPAEVENT_HIBERNATION_DISABLED = 0x00050024;
enum SIPAEVENT_DUMPS_DISABLED = 0x00050025;
enum SIPAEVENT_DUMP_ENCRYPTION_ENABLED = 0x00050026;
enum SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST = 0x00050027;
enum SIPAEVENT_LSAISO_CONFIG = 0x00050028;
enum SIPAEVENT_SBCP_INFO = 0x00050029;
enum SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION = 0x00050030;
enum SIPAEVENT_NOAUTHORITY = 0x00060001;
enum SIPAEVENT_AUTHORITYPUBKEY = 0x00060002;
enum SIPAEVENT_FILEPATH = 0x00070001;
enum SIPAEVENT_IMAGESIZE = 0x00070002;
enum SIPAEVENT_HASHALGORITHMID = 0x00070003;
enum SIPAEVENT_AUTHENTICODEHASH = 0x00070004;
enum SIPAEVENT_AUTHORITYISSUER = 0x00070005;
enum SIPAEVENT_AUTHORITYSERIAL = 0x00070006;
enum SIPAEVENT_IMAGEBASE = 0x00070007;
enum SIPAEVENT_AUTHORITYPUBLISHER = 0x00070008;
enum SIPAEVENT_AUTHORITYSHA1THUMBPRINT = 0x00070009;
enum SIPAEVENT_IMAGEVALIDATED = 0x0007000a;
enum SIPAEVENT_MODULE_SVN = 0x0007000b;
enum SIPAEVENT_MODULE_HSP = 0x0007000c;
enum SIPAEVENT_ELAM_KEYNAME = 0x00090001;
enum SIPAEVENT_ELAM_CONFIGURATION = 0x00090002;
enum SIPAEVENT_ELAM_POLICY = 0x00090003;
enum SIPAEVENT_ELAM_MEASURED = 0x00090004;
enum SIPAEVENT_VBS_VSM_REQUIRED = 0x000a0001;
enum SIPAEVENT_VBS_SECUREBOOT_REQUIRED = 0x000a0002;
enum SIPAEVENT_VBS_IOMMU_REQUIRED = 0x000a0003;
enum SIPAEVENT_VBS_MMIO_NX_REQUIRED = 0x000a0004;
enum SIPAEVENT_VBS_MSR_FILTERING_REQUIRED = 0x000a0005;
enum SIPAEVENT_VBS_MANDATORY_ENFORCEMENT = 0x000a0006;
enum SIPAEVENT_VBS_HVCI_POLICY = 0x000a0007;
enum SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED = 0x000a0008;
enum SIPAEVENT_VBS_DUMP_USES_AMEROOT = 0x000a0009;
enum SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED = 0x000a000a;
enum SIPAEVENT_KSR_SIGNATURE = 0x000b0001;
enum SIPAEVENT_DRTM_STATE_AUTH = 0x000c0001;
enum SIPAEVENT_DRTM_SMM_LEVEL = 0x000c0002;
enum SIPAEVENT_DRTM_AMD_SMM_HASH = 0x000c0003;
enum SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY = 0x000c0004;
enum FVEB_UNLOCK_FLAG_NONE = 0x00000000;
enum FVEB_UNLOCK_FLAG_CACHED = 0x00000001;
enum FVEB_UNLOCK_FLAG_MEDIA = 0x00000002;
enum FVEB_UNLOCK_FLAG_TPM = 0x00000004;
enum FVEB_UNLOCK_FLAG_PIN = 0x00000010;
enum FVEB_UNLOCK_FLAG_EXTERNAL = 0x00000020;
enum FVEB_UNLOCK_FLAG_RECOVERY = 0x00000040;
enum FVEB_UNLOCK_FLAG_PASSPHRASE = 0x00000080;
enum FVEB_UNLOCK_FLAG_NBP = 0x00000100;
enum FVEB_UNLOCK_FLAG_AUK_OSFVEINFO = 0x00000200;
enum OSDEVICE_TYPE_UNKNOWN = 0x00000000;
enum OSDEVICE_TYPE_BLOCKIO_HARDDISK = 0x00010001;
enum OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK = 0x00010002;
enum OSDEVICE_TYPE_BLOCKIO_CDROM = 0x00010003;
enum OSDEVICE_TYPE_BLOCKIO_PARTITION = 0x00010004;
enum OSDEVICE_TYPE_BLOCKIO_FILE = 0x00010005;
enum OSDEVICE_TYPE_BLOCKIO_RAMDISK = 0x00010006;
enum OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK = 0x00010007;
enum OSDEVICE_TYPE_SERIAL = 0x00020000;
enum OSDEVICE_TYPE_UDP = 0x00030000;
enum OSDEVICE_TYPE_VMBUS = 0x00040000;
enum OSDEVICE_TYPE_COMPOSITE = 0x00050000;
enum OSDEVICE_TYPE_CIMFS = 0x00060000;
enum SIPAHDRSIGNATURE = 0x4c434257;
enum SIPALOGVERSION = 0x00000001;
enum SIPAKSRHDRSIGNATURE = 0x4d52534b;
enum WBCL_DIGEST_ALG_ID_SHA_1 = 0x00000004;
enum WBCL_DIGEST_ALG_ID_SHA_2_256 = 0x0000000b;
enum WBCL_DIGEST_ALG_ID_SHA_2_384 = 0x0000000c;
enum WBCL_DIGEST_ALG_ID_SHA_2_512 = 0x0000000d;
enum WBCL_DIGEST_ALG_ID_SM3_256 = 0x00000012;
enum WBCL_DIGEST_ALG_ID_SHA3_256 = 0x00000027;
enum WBCL_DIGEST_ALG_ID_SHA3_384 = 0x00000028;
enum WBCL_DIGEST_ALG_ID_SHA3_512 = 0x00000029;
enum WBCL_DIGEST_ALG_BITMAP_SHA_1 = 0x00000001;
enum WBCL_DIGEST_ALG_BITMAP_SHA_2_256 = 0x00000002;
enum WBCL_DIGEST_ALG_BITMAP_SHA_2_384 = 0x00000004;
enum WBCL_DIGEST_ALG_BITMAP_SHA_2_512 = 0x00000008;
enum WBCL_DIGEST_ALG_BITMAP_SM3_256 = 0x00000010;
enum WBCL_DIGEST_ALG_BITMAP_SHA3_256 = 0x00000020;
enum WBCL_DIGEST_ALG_BITMAP_SHA3_384 = 0x00000040;
enum WBCL_DIGEST_ALG_BITMAP_SHA3_512 = 0x00000080;
enum MAX_HSP_UPGRADE_FILENAME_LENGTH = 0x00000040;
enum WBCL_MAX_HSP_UPGRADE_HASH_LEN = 0x00000040;
enum WBCL_HASH_LEN_SHA1 = 0x00000014;
enum IS_GUAR_RSPEC = 0x00000082;
enum GUAR_ADSPARM_C = 0x00000083;
enum GUAR_ADSPARM_D = 0x00000084;
enum GUAR_ADSPARM_Ctot = 0x00000085;
enum GUAR_ADSPARM_Dtot = 0x00000086;
enum GUAR_ADSPARM_Csum = 0x00000087;
enum GUAR_ADSPARM_Dsum = 0x00000088;
alias LPM_HANDLE = long;
alias RHANDLE = long;
struct QOS_OBJECT_HDR
{
    uint ObjectType;
    uint ObjectLength;
}
struct QOS_SD_MODE
{
    QOS_OBJECT_HDR ObjectHdr;
    uint ShapeDiscardMode;
}
struct QOS_SHAPING_RATE
{
    QOS_OBJECT_HDR ObjectHdr;
    uint ShapingRate;
}
struct RsvpObjHdr
{
    ushort obj_length;
    ubyte obj_class;
    ubyte obj_ctype;
}
struct Session_IPv4
{
    IN_ADDR sess_destaddr;
    ubyte sess_protid;
    ubyte sess_flags;
    ushort sess_destport;
}
struct RSVP_SESSION
{
    RsvpObjHdr sess_header;
    union _sess_u_e__Union
    {
        Session_IPv4 sess_ipv4;
    }
}
struct Rsvp_Hop_IPv4
{
    IN_ADDR hop_ipaddr;
    uint hop_LIH;
}
struct RSVP_HOP
{
    RsvpObjHdr hop_header;
    union _hop_u_e__Union
    {
        Rsvp_Hop_IPv4 hop_ipv4;
    }
}
struct RESV_STYLE
{
    RsvpObjHdr style_header;
    uint style_word;
}
struct Filter_Spec_IPv4
{
    IN_ADDR filt_ipaddr;
    ushort filt_unused;
    ushort filt_port;
}
struct Filter_Spec_IPv4GPI
{
    IN_ADDR filt_ipaddr;
    uint filt_gpi;
}
struct FILTER_SPEC
{
    RsvpObjHdr filt_header;
    union _filt_u_e__Union
    {
        Filter_Spec_IPv4 filt_ipv4;
        Filter_Spec_IPv4GPI filt_ipv4gpi;
    }
}
struct Scope_list_ipv4
{
    IN_ADDR[1] scopl_ipaddr;
}
struct RSVP_SCOPE
{
    RsvpObjHdr scopl_header;
    union _scope_u_e__Union
    {
        Scope_list_ipv4 scopl_ipv4;
    }
}
struct Error_Spec_IPv4
{
    IN_ADDR errs_errnode;
    ubyte errs_flags;
    ubyte errs_code;
    ushort errs_value;
}
struct ERROR_SPEC
{
    RsvpObjHdr errs_header;
    union _errs_u_e__Union
    {
        Error_Spec_IPv4 errs_ipv4;
    }
}
struct POLICY_DATA
{
    RsvpObjHdr PolicyObjHdr;
    ushort usPeOffset;
    ushort usReserved;
}
struct POLICY_ELEMENT
{
    ushort usPeLength;
    ushort usPeType;
    ubyte[4] ucPeData;
}
alias int_serv_wkp = int;
enum : int
{
    IS_WKP_HOP_CNT      = 0x00000004,
    IS_WKP_PATH_BW      = 0x00000006,
    IS_WKP_MIN_LATENCY  = 0x00000008,
    IS_WKP_COMPOSED_MTU = 0x0000000a,
    IS_WKP_TB_TSPEC     = 0x0000007f,
    IS_WKP_Q_TSPEC      = 0x00000080,
}

struct IntServMainHdr
{
    ubyte ismh_version;
    ubyte ismh_unused;
    ushort ismh_len32b;
}
struct IntServServiceHdr
{
    ubyte issh_service;
    ubyte issh_flags;
    ushort issh_len32b;
}
struct IntServParmHdr
{
    ubyte isph_parm_num;
    ubyte isph_flags;
    ushort isph_len32b;
}
struct GenTspecParms
{
    float TB_Tspec_r;
    float TB_Tspec_b;
    float TB_Tspec_p;
    uint TB_Tspec_m;
    uint TB_Tspec_M;
}
struct GenTspec
{
    IntServServiceHdr gen_Tspec_serv_hdr;
    IntServParmHdr gen_Tspec_parm_hdr;
    GenTspecParms gen_Tspec_parms;
}
struct QualTspecParms
{
    uint TB_Tspec_M;
}
struct QualTspec
{
    IntServServiceHdr qual_Tspec_serv_hdr;
    IntServParmHdr qual_Tspec_parm_hdr;
    QualTspecParms qual_Tspec_parms;
}
struct QualAppFlowSpec
{
    IntServServiceHdr Q_spec_serv_hdr;
    IntServParmHdr Q_spec_parm_hdr;
    QualTspecParms Q_spec_parms;
}
struct IntServTspecBody
{
    IntServMainHdr st_mh;
    union _tspec_u_e__Union
    {
        GenTspec gen_stspec;
        QualTspec qual_stspec;
    }
}
struct SENDER_TSPEC
{
    RsvpObjHdr stspec_header;
    IntServTspecBody stspec_body;
}
struct CtrlLoadFlowspec
{
    IntServServiceHdr CL_spec_serv_hdr;
    IntServParmHdr CL_spec_parm_hdr;
    GenTspecParms CL_spec_parms;
}
struct GuarRspec
{
    float Guar_R;
    uint Guar_S;
}
struct GuarFlowSpec
{
    IntServServiceHdr Guar_serv_hdr;
    IntServParmHdr Guar_Tspec_hdr;
    GenTspecParms Guar_Tspec_parms;
    IntServParmHdr Guar_Rspec_hdr;
    GuarRspec Guar_Rspec;
}
struct IntServFlowSpec
{
    IntServMainHdr spec_mh;
    union _spec_u_e__Union
    {
        CtrlLoadFlowspec CL_spec;
        GuarFlowSpec G_spec;
        QualAppFlowSpec Q_spec;
    }
}
struct IS_FLOWSPEC
{
    RsvpObjHdr flow_header;
    IntServFlowSpec flow_body;
}
struct FLOW_DESC
{
    union _u1_e__Union
    {
        SENDER_TSPEC* stspec;
        IS_FLOWSPEC* isflow;
    }
    union _u2_e__Union
    {
        FILTER_SPEC* stemp;
        FILTER_SPEC* fspec;
    }
}
struct Gads_parms_t
{
    IntServServiceHdr Gads_serv_hdr;
    IntServParmHdr Gads_Ctot_hdr;
    uint Gads_Ctot;
    IntServParmHdr Gads_Dtot_hdr;
    uint Gads_Dtot;
    IntServParmHdr Gads_Csum_hdr;
    uint Gads_Csum;
    IntServParmHdr Gads_Dsum_hdr;
    uint Gads_Dsum;
}
struct GenAdspecParams
{
    IntServServiceHdr gen_parm_hdr;
    IntServParmHdr gen_parm_hopcnt_hdr;
    uint gen_parm_hopcnt;
    IntServParmHdr gen_parm_pathbw_hdr;
    float gen_parm_path_bw;
    IntServParmHdr gen_parm_minlat_hdr;
    uint gen_parm_min_latency;
    IntServParmHdr gen_parm_compmtu_hdr;
    uint gen_parm_composed_MTU;
}
struct IS_ADSPEC_BODY
{
    IntServMainHdr adspec_mh;
    GenAdspecParams adspec_genparms;
}
struct ADSPEC
{
    RsvpObjHdr adspec_header;
    IS_ADSPEC_BODY adspec_body;
}
struct ID_ERROR_OBJECT
{
    ushort usIdErrLength;
    ubyte ucAType;
    ubyte ucSubType;
    ushort usReserved;
    ushort usIdErrorValue;
    ubyte[4] ucIdErrData;
}
struct RSVP_MSG_OBJS
{
    int RsvpMsgType;
    RSVP_SESSION* pRsvpSession;
    RSVP_HOP* pRsvpFromHop;
    RSVP_HOP* pRsvpToHop;
    RESV_STYLE* pResvStyle;
    RSVP_SCOPE* pRsvpScope;
    int FlowDescCount;
    FLOW_DESC* pFlowDescs;
    int PdObjectCount;
    POLICY_DATA** ppPdObjects;
    ERROR_SPEC* pErrorSpec;
    ADSPEC* pAdspec;
}
alias PALLOCMEM = void* function(uint);
alias PFREEMEM = void function(void*);
struct POLICY_DECISION
{
    uint lpvResult;
    ushort wPolicyErrCode;
    ushort wPolicyErrValue;
}
alias CBADMITRESULT = uint* function(LPM_HANDLE, RHANDLE, uint, int, int, POLICY_DECISION*);
alias CBGETRSVPOBJECTS = uint* function(LPM_HANDLE, RHANDLE, int, int, RsvpObjHdr**);
struct LPM_INIT_INFO
{
    uint PcmVersionNumber;
    uint ResultTimeLimit;
    int ConfiguredLpmCount;
    PALLOCMEM AllocMemory;
    PFREEMEM FreeMemory;
    CBADMITRESULT PcmAdmitResultCallback;
    CBGETRSVPOBJECTS GetRsvpObjectsCallback;
}
struct LPMIPTABLE
{
    uint ulIfIndex;
    uint MediaType;
    IN_ADDR IfIpAddr;
    IN_ADDR IfNetMask;
}
alias QOS_TRAFFIC_TYPE = int;
enum : int
{
    QOSTrafficTypeBestEffort      = 0x00000000,
    QOSTrafficTypeBackground      = 0x00000001,
    QOSTrafficTypeExcellentEffort = 0x00000002,
    QOSTrafficTypeAudioVideo      = 0x00000003,
    QOSTrafficTypeVoice           = 0x00000004,
    QOSTrafficTypeControl         = 0x00000005,
}

alias QOS_SET_FLOW = int;
enum : int
{
    QOSSetTrafficType       = 0x00000000,
    QOSSetOutgoingRate      = 0x00000001,
    QOSSetOutgoingDSCPValue = 0x00000002,
}

struct QOS_PACKET_PRIORITY
{
    uint ConformantDSCPValue;
    uint NonConformantDSCPValue;
    uint ConformantL2Value;
    uint NonConformantL2Value;
}
struct QOS_FLOW_FUNDAMENTALS
{
    BOOL BottleneckBandwidthSet;
    ulong BottleneckBandwidth;
    BOOL AvailableBandwidthSet;
    ulong AvailableBandwidth;
    BOOL RTTSet;
    uint RTT;
}
alias QOS_FLOWRATE_REASON = int;
enum : int
{
    QOSFlowRateNotApplicable         = 0x00000000,
    QOSFlowRateContentChange         = 0x00000001,
    QOSFlowRateCongestion            = 0x00000002,
    QOSFlowRateHigherContentEncoding = 0x00000003,
    QOSFlowRateUserCaused            = 0x00000004,
}

alias QOS_SHAPING = int;
enum : int
{
    QOSShapeOnly                = 0x00000000,
    QOSShapeAndMark             = 0x00000001,
    QOSUseNonConformantMarkings = 0x00000002,
}

struct QOS_FLOWRATE_OUTGOING
{
    ulong Bandwidth;
    QOS_SHAPING ShapingBehavior;
    QOS_FLOWRATE_REASON Reason;
}
alias QOS_QUERY_FLOW = int;
enum : int
{
    QOSQueryFlowFundamentals = 0x00000000,
    QOSQueryPacketPriority   = 0x00000001,
    QOSQueryOutgoingRate     = 0x00000002,
}

alias QOS_NOTIFY_FLOW = int;
enum : int
{
    QOSNotifyCongested   = 0x00000000,
    QOSNotifyUncongested = 0x00000001,
    QOSNotifyAvailable   = 0x00000002,
}

struct QOS_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
}
struct QOS_FRIENDLY_NAME
{
    QOS_OBJECT_HDR ObjectHdr;
    wchar[256] FriendlyName;
}
struct QOS_TRAFFIC_CLASS
{
    QOS_OBJECT_HDR ObjectHdr;
    uint TrafficClass;
}
struct QOS_DS_CLASS
{
    QOS_OBJECT_HDR ObjectHdr;
    uint DSField;
}
struct QOS_DIFFSERV
{
    QOS_OBJECT_HDR ObjectHdr;
    uint DSFieldCount;
    ubyte[1] DiffservRule;
}
struct QOS_DIFFSERV_RULE
{
    ubyte InboundDSField;
    ubyte ConformingOutboundDSField;
    ubyte NonConformingOutboundDSField;
    ubyte ConformingUserPriority;
    ubyte NonConformingUserPriority;
}
struct QOS_TCP_TRAFFIC
{
    QOS_OBJECT_HDR ObjectHdr;
}
alias TCI_NOTIFY_HANDLER = void function(HANDLE, HANDLE, uint, HANDLE, uint, void*);
alias TCI_ADD_FLOW_COMPLETE_HANDLER = void function(HANDLE, uint);
alias TCI_MOD_FLOW_COMPLETE_HANDLER = void function(HANDLE, uint);
alias TCI_DEL_FLOW_COMPLETE_HANDLER = void function(HANDLE, uint);
struct TCI_CLIENT_FUNC_LIST
{
    TCI_NOTIFY_HANDLER ClNotifyHandler;
    TCI_ADD_FLOW_COMPLETE_HANDLER ClAddFlowCompleteHandler;
    TCI_MOD_FLOW_COMPLETE_HANDLER ClModifyFlowCompleteHandler;
    TCI_DEL_FLOW_COMPLETE_HANDLER ClDeleteFlowCompleteHandler;
}
struct ADDRESS_LIST_DESCRIPTOR
{
    uint MediaType;
    NETWORK_ADDRESS_LIST AddressList;
}
struct TC_IFC_DESCRIPTOR
{
    uint Length;
    PWSTR pInterfaceName;
    PWSTR pInterfaceID;
    ADDRESS_LIST_DESCRIPTOR AddressListDesc;
}
struct TC_SUPPORTED_INFO_BUFFER
{
    ushort InstanceIDLength;
    wchar[256] InstanceID;
    ulong InterfaceLuid;
    ADDRESS_LIST_DESCRIPTOR AddrListDesc;
}
struct TC_GEN_FILTER
{
    ushort AddressType;
    uint PatternSize;
    void* Pattern;
    void* Mask;
}
struct TC_GEN_FLOW
{
    FLOWSPEC SendingFlowspec;
    FLOWSPEC ReceivingFlowspec;
    uint TcObjectsLength;
    QOS_OBJECT_HDR[1] TcObjects;
}
struct IP_PATTERN
{
    uint Reserved1;
    uint Reserved2;
    uint SrcAddr;
    uint DstAddr;
    union _S_un_e__Union
    {
        struct _S_un_ports_e__Struct
        {
            ushort s_srcport;
            ushort s_dstport;
        }
        struct _S_un_icmp_e__Struct
        {
            ubyte s_type;
            ubyte s_code;
            ushort filler;
        }
        uint S_Spi;
    }
    ubyte ProtocolId;
    ubyte[3] Reserved3;
}
/+ [UNSUPPORTED] struct IPX_PATTERN
{
    struct _Src_e__Struct
    {
        uint NetworkAddress;
        ubyte[6] NodeAddress;
        ushort Socket;
    }
    struct _Src_e__Struct
    {
        uint NetworkAddress;
        ubyte[6] NodeAddress;
        ushort Socket;
    }
}
+/
struct ENUMERATION_BUFFER
{
    uint Length;
    uint OwnerProcessId;
    ushort FlowNameLength;
    wchar[256] FlowName;
    TC_GEN_FLOW* pFlow;
    uint NumberOfFilters;
    TC_GEN_FILTER[1] GenericFilter;
}
union IN_ADDR_IPV4
{
    uint Addr;
    ubyte[4] AddrBytes;
}
struct IN_ADDR_IPV6
{
    ubyte[16] Addr;
}
struct RSVP_FILTERSPEC_V4
{
    IN_ADDR_IPV4 Address;
    ushort Unused;
    ushort Port;
}
struct RSVP_FILTERSPEC_V6
{
    IN_ADDR_IPV6 Address;
    ushort UnUsed;
    ushort Port;
}
struct RSVP_FILTERSPEC_V6_FLOW
{
    IN_ADDR_IPV6 Address;
    ubyte UnUsed;
    ubyte[3] FlowLabel;
}
struct RSVP_FILTERSPEC_V4_GPI
{
    IN_ADDR_IPV4 Address;
    uint GeneralPortId;
}
struct RSVP_FILTERSPEC_V6_GPI
{
    IN_ADDR_IPV6 Address;
    uint GeneralPortId;
}
alias FilterType = int;
enum : int
{
    FILTERSPECV4      = 0x00000001,
    FILTERSPECV6      = 0x00000002,
    FILTERSPECV6_FLOW = 0x00000003,
    FILTERSPECV4_GPI  = 0x00000004,
    FILTERSPECV6_GPI  = 0x00000005,
    FILTERSPEC_END    = 0x00000006,
}

struct RSVP_FILTERSPEC
{
    FilterType Type;
    union
    {
        RSVP_FILTERSPEC_V4 FilterSpecV4;
        RSVP_FILTERSPEC_V6 FilterSpecV6;
        RSVP_FILTERSPEC_V6_FLOW FilterSpecV6Flow;
        RSVP_FILTERSPEC_V4_GPI FilterSpecV4Gpi;
        RSVP_FILTERSPEC_V6_GPI FilterSpecV6Gpi;
    }
}
struct FLOWDESCRIPTOR
{
    FLOWSPEC FlowSpec;
    uint NumFilters;
    RSVP_FILTERSPEC* FilterList;
}
struct RSVP_POLICY
{
    ushort Len;
    ushort Type;
    ubyte[4] Info;
}
struct RSVP_POLICY_INFO
{
    QOS_OBJECT_HDR ObjectHdr;
    uint NumPolicyElement;
    RSVP_POLICY[1] PolicyElement;
}
struct RSVP_RESERVE_INFO
{
    QOS_OBJECT_HDR ObjectHdr;
    uint Style;
    uint ConfirmRequest;
    RSVP_POLICY_INFO* PolicyElementList;
    uint NumFlowDesc;
    FLOWDESCRIPTOR* FlowDescList;
}
struct RSVP_STATUS_INFO
{
    QOS_OBJECT_HDR ObjectHdr;
    uint StatusCode;
    uint ExtendedStatus1;
    uint ExtendedStatus2;
}
struct QOS_DESTADDR
{
    QOS_OBJECT_HDR ObjectHdr;
    const(SOCKADDR)* SocketAddress;
    uint SocketAddressLength;
}
struct AD_GENERAL_PARAMS
{
    uint IntServAwareHopCount;
    uint PathBandwidthEstimate;
    uint MinimumLatency;
    uint PathMTU;
    uint Flags;
}
struct AD_GUARANTEED
{
    uint CTotal;
    uint DTotal;
    uint CSum;
    uint DSum;
}
struct PARAM_BUFFER
{
    uint ParameterId;
    uint Length;
    ubyte[1] Buffer;
}
struct CONTROL_SERVICE
{
    uint Length;
    uint Service;
    AD_GENERAL_PARAMS Overrides;
    union
    {
        AD_GUARANTEED Guaranteed;
        PARAM_BUFFER[1] ParamBuffer;
    }
}
struct RSVP_ADSPEC
{
    QOS_OBJECT_HDR ObjectHdr;
    AD_GENERAL_PARAMS GeneralParams;
    uint NumberOfServices;
    CONTROL_SERVICE[1] Services;
}
struct IDPE_ATTR
{
    ushort PeAttribLength;
    ubyte PeAttribType;
    ubyte PeAttribSubType;
    ubyte[4] PeAttribValue;
}
struct WBCL_Iterator
{
    align (1):
    void* firstElementPtr;
    uint logSize;
    void* currentElementPtr;
    uint currentElementSize;
    ushort digestSize;
    ushort logFormat;
    uint numberOfDigests;
    void* digestSizes;
    uint supportedAlgorithms;
    ushort hashAlgorithm;
}
struct HSP_UPGRADE_IMAGEDATA
{
    align (1):
    ushort hashAlgID;
    ushort digestSize;
    ubyte[64] digest;
    wchar[64] fileName;
}
struct TCG_PCClientPCREventStruct
{
    align (1):
    uint pcrIndex;
    uint eventType;
    ubyte[20] digest;
    uint eventDataSize;
    ubyte[1] event;
}
struct TCG_PCClientTaggedEventStruct
{
    align (1):
    uint EventID;
    uint EventDataSize;
    ubyte[1] EventData;
}
struct WBCL_LogHdr
{
    align (1):
    uint signature;
    uint version_;
    uint entries;
    uint length;
}
struct SIPAEVENT_VSM_IDK_RSA_INFO
{
    align (1):
    uint KeyBitLength;
    uint PublicExpLengthBytes;
    uint ModulusSizeBytes;
    ubyte[1] PublicKeyData;
}
struct SIPAEVENT_VSM_IDK_INFO_PAYLOAD
{
    align (1):
    uint KeyAlgID;
    union
    {
        SIPAEVENT_VSM_IDK_RSA_INFO RsaKeyInfo;
    }
}
struct SIPAEVENT_SI_POLICY_PAYLOAD
{
    align (1):
    ulong PolicyVersion;
    ushort PolicyNameLength;
    ushort HashAlgID;
    uint DigestLength;
    ubyte[1] VarLengthData;
}
struct SIPAEVENT_REVOCATION_LIST_PAYLOAD
{
    align (1):
    long CreationTime;
    uint DigestLength;
    ushort HashAlgID;
    ubyte[1] Digest;
}
struct SIPAEVENT_KSR_SIGNATURE_PAYLOAD
{
    align (1):
    uint SignAlgID;
    uint SignatureLength;
    ubyte[1] Signature;
}
struct SIPAEVENT_SBCP_INFO_PAYLOAD_V1
{
    align (1):
    uint PayloadVersion;
    uint VarDataOffset;
    ushort HashAlgID;
    ushort DigestLength;
    uint Options;
    uint SignersCount;
    ubyte[1] VarData;
}
