module windows.win32.system.deploymentservices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE, HRESULT, LPARAM, PWSTR, SYSTEMTIME, ULARGE_INTEGER, WPARAM;
import windows.win32.system.com_ : IDispatch, IUnknown;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

alias CPU_ARCHITECTURE = uint;
enum : uint
{
    CPU_ARCHITECTURE_AMD64 = 0x00000009,
    CPU_ARCHITECTURE_IA64  = 0x00000006,
    CPU_ARCHITECTURE_INTEL = 0x00000000,
}

alias PFN_WDS_CLI_CALLBACK_MESSAGE_ID = uint;
enum : uint
{
    WDS_CLI_MSG_START    = 0x00000000,
    WDS_CLI_MSG_COMPLETE = 0x00000001,
    WDS_CLI_MSG_PROGRESS = 0x00000002,
    WDS_CLI_MSG_TEXT     = 0x00000003,
}

alias WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL = uint;
enum : uint
{
    WDS_TRANSPORTCLIENT_AUTH    = 0x00000001,
    WDS_TRANSPORTCLIENT_NO_AUTH = 0x00000002,
}

HRESULT WdsCliClose(HANDLE);
HRESULT WdsCliRegisterTrace(PFN_WdsCliTraceFunction);
HRESULT WdsCliFreeStringArray(PWSTR*, uint);
HRESULT WdsCliFindFirstImage(HANDLE, HANDLE*);
HRESULT WdsCliFindNextImage(HANDLE);
HRESULT WdsCliGetEnumerationFlags(HANDLE, uint*);
HRESULT WdsCliGetImageHandleFromFindHandle(HANDLE, HANDLE*);
HRESULT WdsCliGetImageHandleFromTransferHandle(HANDLE, HANDLE*);
HRESULT WdsCliCreateSession(PWSTR, WDS_CLI_CRED*, HANDLE*);
HRESULT WdsCliAuthorizeSession(HANDLE, WDS_CLI_CRED*);
HRESULT WdsCliInitializeLog(HANDLE, CPU_ARCHITECTURE, PWSTR, PWSTR);
HRESULT WdsCliLog(HANDLE, uint, uint);
HRESULT WdsCliGetImageName(HANDLE, PWSTR*);
HRESULT WdsCliGetImageDescription(HANDLE, PWSTR*);
HRESULT WdsCliGetImageType(HANDLE, WDS_CLI_IMAGE_TYPE*);
HRESULT WdsCliGetImageFiles(HANDLE, PWSTR**, uint*);
HRESULT WdsCliGetImageLanguage(HANDLE, PWSTR*);
HRESULT WdsCliGetImageLanguages(HANDLE, byte***, uint*);
HRESULT WdsCliGetImageVersion(HANDLE, PWSTR*);
HRESULT WdsCliGetImagePath(HANDLE, PWSTR*);
HRESULT WdsCliGetImageIndex(HANDLE, uint*);
HRESULT WdsCliGetImageArchitecture(HANDLE, CPU_ARCHITECTURE*);
HRESULT WdsCliGetImageLastModifiedTime(HANDLE, SYSTEMTIME**);
HRESULT WdsCliGetImageSize(HANDLE, ulong*);
HRESULT WdsCliGetImageHalName(HANDLE, PWSTR*);
HRESULT WdsCliGetImageGroup(HANDLE, PWSTR*);
HRESULT WdsCliGetImageNamespace(HANDLE, PWSTR*);
HRESULT WdsCliGetImageParameter(HANDLE, WDS_CLI_IMAGE_PARAM_TYPE, void*, uint);
HRESULT WdsCliGetTransferSize(HANDLE, ulong*);
void WdsCliSetTransferBufferSize(uint);
HRESULT WdsCliTransferImage(HANDLE, PWSTR, uint, uint, PFN_WdsCliCallback, void*, HANDLE*);
HRESULT WdsCliTransferFile(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, PFN_WdsCliCallback, void*, HANDLE*);
HRESULT WdsCliCancelTransfer(HANDLE);
HRESULT WdsCliWaitForTransfer(HANDLE);
HRESULT WdsCliObtainDriverPackages(HANDLE, PWSTR*, PWSTR**, uint*);
HRESULT WdsCliObtainDriverPackagesEx(HANDLE, PWSTR, PWSTR*, PWSTR**, uint*);
HRESULT WdsCliGetDriverQueryXml(PWSTR, PWSTR*);
uint PxeProviderRegister(const(wchar)*, const(wchar)*, uint, BOOL, HKEY*);
uint PxeProviderUnRegister(const(wchar)*);
uint PxeProviderQueryIndex(const(wchar)*, uint*);
uint PxeProviderEnumFirst(HANDLE*);
uint PxeProviderEnumNext(HANDLE, PXE_PROVIDER**);
uint PxeProviderEnumClose(HANDLE);
uint PxeProviderFreeInfo(PXE_PROVIDER*);
uint PxeRegisterCallback(HANDLE, uint, void*, void*);
uint PxeSendReply(HANDLE, void*, uint, PXE_ADDRESS*);
uint PxeAsyncRecvDone(HANDLE, uint);
uint PxeTrace(HANDLE, uint, const(wchar)*);
uint PxeTraceV(HANDLE, uint, const(wchar)*, byte*);
void* PxePacketAllocate(HANDLE, HANDLE, uint);
uint PxePacketFree(HANDLE, HANDLE, void*);
uint PxeProviderSetAttribute(HANDLE, uint, void*, uint);
uint PxeDhcpInitialize(void*, uint, void*, uint, uint*);
uint PxeDhcpv6Initialize(void*, uint, void*, uint, uint*);
uint PxeDhcpAppendOption(void*, uint, uint*, ubyte, ubyte, void*);
uint PxeDhcpv6AppendOption(void*, uint, uint*, ushort, ushort, void*);
uint PxeDhcpAppendOptionRaw(void*, uint, uint*, ushort, void*);
uint PxeDhcpv6AppendOptionRaw(void*, uint, uint*, ushort, void*);
uint PxeDhcpIsValid(void*, uint, BOOL, BOOL*);
uint PxeDhcpv6IsValid(void*, uint, BOOL, BOOL*);
uint PxeDhcpGetOptionValue(void*, uint, uint, ubyte, ubyte*, void**);
uint PxeDhcpv6GetOptionValue(void*, uint, uint, ushort, ushort*, void**);
uint PxeDhcpGetVendorOptionValue(void*, uint, ubyte, uint, ubyte*, void**);
uint PxeDhcpv6GetVendorOptionValue(void*, uint, uint, ushort, uint, ushort*, void**);
uint PxeDhcpv6ParseRelayForw(void*, uint, PXE_DHCPV6_NESTED_RELAY_MESSAGE*, uint, uint*, ubyte**, uint*);
uint PxeDhcpv6CreateRelayRepl(PXE_DHCPV6_NESTED_RELAY_MESSAGE*, uint, ubyte*, uint, void*, uint, uint*);
uint PxeGetServerInfo(uint, void*, uint);
uint PxeGetServerInfoEx(uint, void*, uint, uint*);
HRESULT WdsTransportServerRegisterCallback(HANDLE, TRANSPORTPROVIDER_CALLBACK_ID, void*);
HRESULT WdsTransportServerCompleteRead(HANDLE, uint, void*, HRESULT);
HRESULT WdsTransportServerTrace(HANDLE, uint, const(wchar)*);
HRESULT WdsTransportServerTraceV(HANDLE, uint, const(wchar)*, byte*);
void* WdsTransportServerAllocateBuffer(HANDLE, uint);
HRESULT WdsTransportServerFreeBuffer(HANDLE, void*);
uint WdsTransportClientInitialize();
uint WdsTransportClientInitializeSession(WDS_TRANSPORTCLIENT_REQUEST*, void*, HANDLE*);
uint WdsTransportClientRegisterCallback(HANDLE, TRANSPORTCLIENT_CALLBACK_ID, void*);
uint WdsTransportClientStartSession(HANDLE);
uint WdsTransportClientCompleteReceive(HANDLE, uint, ULARGE_INTEGER*);
uint WdsTransportClientCancelSession(HANDLE);
uint WdsTransportClientCancelSessionEx(HANDLE, uint);
uint WdsTransportClientWaitForCompletion(HANDLE, uint);
uint WdsTransportClientQueryStatus(HANDLE, uint*, uint*);
uint WdsTransportClientCloseSession(HANDLE);
uint WdsTransportClientAddRefBuffer(void*);
uint WdsTransportClientReleaseBuffer(void*);
uint WdsTransportClientShutdown();
uint WdsBpParseInitialize(void*, uint, ubyte*, HANDLE*);
uint WdsBpParseInitializev6(void*, uint, ubyte*, HANDLE*);
uint WdsBpInitialize(ubyte, HANDLE*);
uint WdsBpCloseHandle(HANDLE);
uint WdsBpQueryOption(HANDLE, uint, uint, void*, uint*);
uint WdsBpAddOption(HANDLE, uint, uint, void*);
uint WdsBpGetOptionBuffer(HANDLE, uint, void*, uint*);
enum WDS_CLI_TRANSFER_ASYNCHRONOUS = 0x00000001;
enum WDS_CLI_NO_SPARSE_FILE = 0x00000002;
enum PXE_DHCP_SERVER_PORT = 0x00000043;
enum PXE_DHCP_CLIENT_PORT = 0x00000044;
enum PXE_SERVER_PORT = 0x00000fab;
enum PXE_DHCPV6_SERVER_PORT = 0x00000223;
enum PXE_DHCPV6_CLIENT_PORT = 0x00000222;
enum PXE_DHCP_FILE_SIZE = 0x00000080;
enum PXE_DHCP_SERVER_SIZE = 0x00000040;
enum PXE_DHCP_HWAADR_SIZE = 0x00000010;
enum PXE_DHCP_MAGIC_COOKIE_SIZE = 0x00000004;
enum PXE_REG_INDEX_TOP = 0x00000000;
enum PXE_REG_INDEX_BOTTOM = 0xffffffff;
enum PXE_CALLBACK_RECV_REQUEST = 0x00000000;
enum PXE_CALLBACK_SHUTDOWN = 0x00000001;
enum PXE_CALLBACK_SERVICE_CONTROL = 0x00000002;
enum PXE_CALLBACK_MAX = 0x00000003;
enum PXE_GSI_TRACE_ENABLED = 0x00000001;
enum PXE_GSI_SERVER_DUID = 0x00000002;
enum PXE_MAX_ADDRESS = 0x00000010;
enum PXE_ADDR_BROADCAST = 0x00000001;
enum PXE_ADDR_USE_PORT = 0x00000002;
enum PXE_ADDR_USE_ADDR = 0x00000004;
enum PXE_ADDR_USE_DHCP_RULES = 0x00000008;
enum PXE_DHCPV6_RELAY_HOP_COUNT_LIMIT = 0x00000020;
enum PXE_BA_NBP = 0x00000001;
enum PXE_BA_CUSTOM = 0x00000002;
enum PXE_BA_IGNORE = 0x00000003;
enum PXE_BA_REJECTED = 0x00000004;
enum PXE_TRACE_VERBOSE = 0x00010000;
enum PXE_TRACE_INFO = 0x00020000;
enum PXE_TRACE_WARNING = 0x00040000;
enum PXE_TRACE_ERROR = 0x00080000;
enum PXE_TRACE_FATAL = 0x00100000;
enum PXE_PROV_ATTR_FILTER = 0x00000000;
enum PXE_PROV_ATTR_FILTER_IPV6 = 0x00000001;
enum PXE_PROV_ATTR_IPV6_CAPABLE = 0x00000002;
enum PXE_PROV_FILTER_ALL = 0x00000000;
enum PXE_PROV_FILTER_DHCP_ONLY = 0x00000001;
enum PXE_PROV_FILTER_PXE_ONLY = 0x00000002;
enum MC_SERVER_CURRENT_VERSION = 0x00000001;
enum TRANSPORTPROVIDER_CURRENT_VERSION = 0x00000001;
enum WDS_MC_TRACE_VERBOSE = 0x00010000;
enum WDS_MC_TRACE_INFO = 0x00020000;
enum WDS_MC_TRACE_WARNING = 0x00040000;
enum WDS_MC_TRACE_ERROR = 0x00080000;
enum WDS_MC_TRACE_FATAL = 0x00100000;
enum WDS_TRANSPORTCLIENT_CURRENT_API_VERSION = 0x00000001;
enum WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST = 0x00000001;
enum WDS_TRANSPORTCLIENT_NO_CACHE = 0x00000000;
enum WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS = 0x00000001;
enum WDS_TRANSPORTCLIENT_STATUS_SUCCESS = 0x00000002;
enum WDS_TRANSPORTCLIENT_STATUS_FAILURE = 0x00000003;
enum WDSTRANSPORT_RESOURCE_UTILIZATION_UNKNOWN = 0x000000ff;
enum WDSBP_PK_TYPE_DHCP = 0x00000001;
enum WDSBP_PK_TYPE_WDSNBP = 0x00000002;
enum WDSBP_PK_TYPE_BCD = 0x00000004;
enum WDSBP_PK_TYPE_DHCPV6 = 0x00000008;
enum WDSBP_OPT_TYPE_NONE = 0x00000000;
enum WDSBP_OPT_TYPE_BYTE = 0x00000001;
enum WDSBP_OPT_TYPE_USHORT = 0x00000002;
enum WDSBP_OPT_TYPE_ULONG = 0x00000003;
enum WDSBP_OPT_TYPE_WSTR = 0x00000004;
enum WDSBP_OPT_TYPE_STR = 0x00000005;
enum WDSBP_OPT_TYPE_IP4 = 0x00000006;
enum WDSBP_OPT_TYPE_IP6 = 0x00000007;
enum WDSBP_OPTVAL_ACTION_APPROVAL = 0x00000001;
enum WDSBP_OPTVAL_ACTION_REFERRAL = 0x00000003;
enum WDSBP_OPTVAL_ACTION_ABORT = 0x00000005;
enum WDSBP_OPTVAL_PXE_PROMPT_OPTIN = 0x00000001;
enum WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT = 0x00000002;
enum WDSBP_OPTVAL_PXE_PROMPT_OPTOUT = 0x00000003;
enum WDSBP_OPTVAL_NBP_VER_7 = 0x00000700;
enum WDSBP_OPTVAL_NBP_VER_8 = 0x00000800;
enum FACILITY_WDSMCSERVER = 0x00000121;
enum FACILITY_WDSMCCLIENT = 0x00000122;
enum WDSMCSERVER_CATEGORY = 0x00000001;
enum WDSMCCLIENT_CATEGORY = 0x00000002;
enum WDSMCS_E_SESSION_SHUTDOWN_IN_PROGRESS = 0xffffffffc1210100;
enum WDSMCS_E_REQCALLBACKS_NOT_REG = 0xffffffffc1210101;
enum WDSMCS_E_INCOMPATIBLE_VERSION = 0xffffffffc1210102;
enum WDSMCS_E_CONTENT_NOT_FOUND = 0xffffffffc1210103;
enum WDSMCS_E_CLIENT_NOT_FOUND = 0xffffffffc1210104;
enum WDSMCS_E_NAMESPACE_NOT_FOUND = 0xffffffffc1210105;
enum WDSMCS_E_CONTENT_PROVIDER_NOT_FOUND = 0xffffffffc1210106;
enum WDSMCS_E_NAMESPACE_ALREADY_EXISTS = 0xffffffffc1210107;
enum WDSMCS_E_NAMESPACE_SHUTDOWN_IN_PROGRESS = 0xffffffffc1210108;
enum WDSMCS_E_NAMESPACE_ALREADY_STARTED = 0xffffffffc1210109;
enum WDSMCS_E_NS_START_FAILED_NO_CLIENTS = 0xffffffffc121010a;
enum WDSMCS_E_START_TIME_IN_PAST = 0xffffffffc121010b;
enum WDSMCS_E_PACKET_NOT_HASHED = 0xffffffffc121010c;
enum WDSMCS_E_PACKET_NOT_SIGNED = 0xffffffffc121010d;
enum WDSMCS_E_PACKET_HAS_SECURITY = 0xffffffffc121010e;
enum WDSMCS_E_PACKET_NOT_CHECKSUMED = 0xffffffffc121010f;
enum WDSMCS_E_CLIENT_DOESNOT_SUPPORT_SECURITY_MODE = 0xffffffffc1210110;
enum EVT_WDSMCS_S_PARAMETERS_READ = 0x41210200;
enum EVT_WDSMCS_E_PARAMETERS_READ_FAILED = 0xffffffffc1210201;
enum EVT_WDSMCS_E_DUPLICATE_MULTICAST_ADDR = 0xffffffffc1210202;
enum EVT_WDSMCS_E_NON_WDS_DUPLICATE_MULTICAST_ADDR = 0xffffffffc1210203;
enum EVT_WDSMCS_E_CP_DLL_LOAD_FAILED = 0xffffffffc1210250;
enum EVT_WDSMCS_E_CP_INIT_FUNC_MISSING = 0xffffffffc1210251;
enum EVT_WDSMCS_E_CP_INIT_FUNC_FAILED = 0xffffffffc1210252;
enum EVT_WDSMCS_E_CP_INCOMPATIBLE_SERVER_VERSION = 0xffffffffc1210253;
enum EVT_WDSMCS_E_CP_CALLBACKS_NOT_REG = 0xffffffffc1210254;
enum EVT_WDSMCS_E_CP_SHUTDOWN_FUNC_FAILED = 0xffffffffc1210255;
enum EVT_WDSMCS_E_CP_MEMORY_LEAK = 0xffffffffc1210256;
enum EVT_WDSMCS_E_CP_OPEN_INSTANCE_FAILED = 0xffffffffc1210257;
enum EVT_WDSMCS_E_CP_CLOSE_INSTANCE_FAILED = 0xffffffffc1210258;
enum EVT_WDSMCS_E_CP_OPEN_CONTENT_FAILED = 0xffffffffc1210259;
enum EVT_WDSMCS_W_CP_DLL_LOAD_FAILED_NOT_CRITICAL = 0xffffffff8121025a;
enum EVT_WDSMCS_E_CP_DLL_LOAD_FAILED_CRITICAL = 0xffffffffc121025b;
enum EVT_WDSMCS_E_NSREG_START_TIME_IN_PAST = 0xffffffffc1210300;
enum EVT_WDSMCS_E_NSREG_CONTENT_PROVIDER_NOT_REG = 0xffffffffc1210301;
enum EVT_WDSMCS_E_NSREG_NAMESPACE_EXISTS = 0xffffffffc1210302;
enum EVT_WDSMCS_E_NSREG_FAILURE = 0xffffffffc1210303;
enum WDSTPC_E_CALLBACKS_NOT_REG = 0xffffffffc1220300;
enum WDSTPC_E_ALREADY_COMPLETED = 0xffffffffc1220301;
enum WDSTPC_E_ALREADY_IN_PROGRESS = 0xffffffffc1220302;
enum WDSTPC_E_UNKNOWN_ERROR = 0xffffffffc1220303;
enum WDSTPC_E_NOT_INITIALIZED = 0xffffffffc1220304;
enum WDSTPC_E_KICKED_POLICY_NOT_MET = 0xffffffffc1220305;
enum WDSTPC_E_KICKED_FALLBACK = 0xffffffffc1220306;
enum WDSTPC_E_KICKED_FAIL = 0xffffffffc1220307;
enum WDSTPC_E_KICKED_UNKNOWN = 0xffffffffc1220308;
enum WDSTPC_E_MULTISTREAM_NOT_ENABLED = 0xffffffffc1220309;
enum WDSTPC_E_ALREADY_IN_LOWEST_SESSION = 0xffffffffc122030a;
enum WDSTPC_E_CLIENT_DEMOTE_NOT_SUPPORTED = 0xffffffffc122030b;
enum WDSTPC_E_NO_IP4_INTERFACE = 0xffffffffc122030c;
enum WDSTPTC_E_WIM_APPLY_REQUIRES_REFERENCE_IMAGE = 0xffffffffc122030d;
enum FACILITY_WDSTPTMGMT = 0x00000110;
enum WDSTPTMGMT_CATEGORY = 0x00000001;
enum WDSTPTMGMT_E_INVALID_PROPERTY = 0xffffffffc1100100;
enum WDSTPTMGMT_E_INVALID_OPERATION = 0xffffffffc1100101;
enum WDSTPTMGMT_E_INVALID_CLASS = 0xffffffffc1100102;
enum WDSTPTMGMT_E_CONTENT_PROVIDER_ALREADY_REGISTERED = 0xffffffffc1100103;
enum WDSTPTMGMT_E_CONTENT_PROVIDER_NOT_REGISTERED = 0xffffffffc1100104;
enum WDSTPTMGMT_E_INVALID_CONTENT_PROVIDER_NAME = 0xffffffffc1100105;
enum WDSTPTMGMT_E_TRANSPORT_SERVER_ROLE_NOT_CONFIGURED = 0xffffffffc1100106;
enum WDSTPTMGMT_E_NAMESPACE_ALREADY_REGISTERED = 0xffffffffc1100107;
enum WDSTPTMGMT_E_NAMESPACE_NOT_REGISTERED = 0xffffffffc1100108;
enum WDSTPTMGMT_E_CANNOT_REINITIALIZE_OBJECT = 0xffffffffc1100109;
enum WDSTPTMGMT_E_INVALID_NAMESPACE_NAME = 0xffffffffc110010a;
enum WDSTPTMGMT_E_INVALID_NAMESPACE_DATA = 0xffffffffc110010b;
enum WDSTPTMGMT_E_NAMESPACE_READ_ONLY = 0xffffffffc110010c;
enum WDSTPTMGMT_E_INVALID_NAMESPACE_START_TIME = 0xffffffffc110010d;
enum WDSTPTMGMT_E_INVALID_DIAGNOSTICS_COMPONENTS = 0xffffffffc110010e;
enum WDSTPTMGMT_E_CANNOT_REFRESH_DIRTY_OBJECT = 0xffffffffc110010f;
enum WDSTPTMGMT_E_INVALID_SERVICE_IP_ADDRESS_RANGE = 0xffffffffc1100110;
enum WDSTPTMGMT_E_INVALID_SERVICE_PORT_RANGE = 0xffffffffc1100111;
enum WDSTPTMGMT_E_INVALID_NAMESPACE_START_PARAMETERS = 0xffffffffc1100112;
enum WDSTPTMGMT_E_TRANSPORT_SERVER_UNAVAILABLE = 0xffffffffc1100113;
enum WDSTPTMGMT_E_NAMESPACE_NOT_ON_SERVER = 0xffffffffc1100114;
enum WDSTPTMGMT_E_NAMESPACE_REMOVED_FROM_SERVER = 0xffffffffc1100115;
enum WDSTPTMGMT_E_INVALID_IP_ADDRESS = 0xffffffffc1100116;
enum WDSTPTMGMT_E_INVALID_IPV4_MULTICAST_ADDRESS = 0xffffffffc1100117;
enum WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS = 0xffffffffc1100118;
enum WDSTPTMGMT_E_IPV6_NOT_SUPPORTED = 0xffffffffc1100119;
enum WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS_SOURCE = 0xffffffffc110011a;
enum WDSTPTMGMT_E_INVALID_MULTISTREAM_STREAM_COUNT = 0xffffffffc110011b;
enum WDSTPTMGMT_E_INVALID_AUTO_DISCONNECT_THRESHOLD = 0xffffffffc110011c;
enum WDSTPTMGMT_E_MULTICAST_SESSION_POLICY_NOT_SUPPORTED = 0xffffffffc110011d;
enum WDSTPTMGMT_E_INVALID_SLOW_CLIENT_HANDLING_TYPE = 0xffffffffc110011e;
enum WDSTPTMGMT_E_NETWORK_PROFILES_NOT_SUPPORTED = 0xffffffffc110011f;
enum WDSTPTMGMT_E_UDP_PORT_POLICY_NOT_SUPPORTED = 0xffffffffc1100120;
enum WDSTPTMGMT_E_TFTP_MAX_BLOCKSIZE_NOT_SUPPORTED = 0xffffffffc1100121;
enum WDSTPTMGMT_E_TFTP_VAR_WINDOW_NOT_SUPPORTED = 0xffffffffc1100122;
enum WDSTPTMGMT_E_INVALID_TFTP_MAX_BLOCKSIZE = 0xffffffffc1100123;
enum WdsCliFlagEnumFilterVersion = 0x00000001;
enum WdsCliFlagEnumFilterFirmware = 0x00000002;
enum WDS_LOG_TYPE_CLIENT_ERROR = 0x00000001;
enum WDS_LOG_TYPE_CLIENT_STARTED = 0x00000002;
enum WDS_LOG_TYPE_CLIENT_FINISHED = 0x00000003;
enum WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED = 0x00000004;
enum WDS_LOG_TYPE_CLIENT_APPLY_STARTED = 0x00000005;
enum WDS_LOG_TYPE_CLIENT_APPLY_FINISHED = 0x00000006;
enum WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE = 0x00000007;
enum WDS_LOG_TYPE_CLIENT_UNATTEND_MODE = 0x00000008;
enum WDS_LOG_TYPE_CLIENT_TRANSFER_START = 0x00000009;
enum WDS_LOG_TYPE_CLIENT_TRANSFER_END = 0x0000000a;
enum WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE = 0x0000000b;
enum WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR = 0x0000000c;
enum WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START = 0x0000000d;
enum WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END = 0x0000000e;
enum WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2 = 0x0000000f;
enum WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2 = 0x00000010;
enum WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2 = 0x00000011;
enum WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE = 0x00000012;
enum WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START = 0x00000013;
enum WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END = 0x00000014;
enum WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE = 0x00000015;
enum WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2 = 0x00000016;
enum WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED3 = 0x00000017;
enum WDS_LOG_TYPE_CLIENT_MAX_CODE = 0x00000018;
enum WDS_LOG_LEVEL_DISABLED = 0x00000000;
enum WDS_LOG_LEVEL_ERROR = 0x00000001;
enum WDS_LOG_LEVEL_WARNING = 0x00000002;
enum WDS_LOG_LEVEL_INFO = 0x00000003;
struct WDS_CLI_CRED
{
    const(wchar)* pwszUserName;
    const(wchar)* pwszDomain;
    const(wchar)* pwszPassword;
}
alias PFN_WdsCliTraceFunction = void function(const(wchar)*, byte*);
alias WDS_CLI_IMAGE_TYPE = int;
enum : int
{
    WDS_CLI_IMAGE_TYPE_UNKNOWN = 0x00000000,
    WDS_CLI_IMAGE_TYPE_WIM     = 0x00000001,
    WDS_CLI_IMAGE_TYPE_VHD     = 0x00000002,
    WDS_CLI_IMAGE_TYPE_VHDX    = 0x00000003,
}

alias WDS_CLI_FIRMWARE_TYPE = int;
enum : int
{
    WDS_CLI_FIRMWARE_UNKNOWN = 0x00000000,
    WDS_CLI_FIRMWARE_BIOS    = 0x00000001,
    WDS_CLI_FIRMWARE_EFI     = 0x00000002,
}

alias WDS_CLI_IMAGE_PARAM_TYPE = int;
enum : int
{
    WDS_CLI_IMAGE_PARAM_UNKNOWN             = 0x00000000,
    WDS_CLI_IMAGE_PARAM_SPARSE_FILE         = 0x00000001,
    WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES = 0x00000002,
}

alias PFN_WdsCliCallback = void function(PFN_WDS_CLI_CALLBACK_MESSAGE_ID, WPARAM, LPARAM, void*);
struct PXE_DHCP_OPTION
{
    ubyte OptionType;
    ubyte OptionLength;
    ubyte[1] OptionValue;
}
struct PXE_DHCP_MESSAGE
{
    align (1):
    ubyte Operation;
    ubyte HardwareAddressType;
    ubyte HardwareAddressLength;
    ubyte HopCount;
    uint TransactionID;
    ushort SecondsSinceBoot;
    ushort Reserved;
    uint ClientIpAddress;
    uint YourIpAddress;
    uint BootstrapServerAddress;
    uint RelayAgentIpAddress;
    ubyte[16] HardwareAddress;
    ubyte[64] HostName;
    ubyte[128] BootFileName;
    union
    {
        align (1):
        ubyte[4] bMagicCookie;
        uint uMagicCookie;
    }
    PXE_DHCP_OPTION Option;
}
struct PXE_DHCPV6_OPTION
{
    align (1):
    ushort OptionCode;
    ushort DataLength;
    ubyte[1] Data;
}
struct PXE_DHCPV6_MESSAGE_HEADER
{
    ubyte MessageType;
    ubyte[1] Message;
}
struct PXE_DHCPV6_MESSAGE
{
    ubyte MessageType;
    ubyte TransactionIDByte1;
    ubyte TransactionIDByte2;
    ubyte TransactionIDByte3;
    PXE_DHCPV6_OPTION[1] Options;
}
struct PXE_DHCPV6_RELAY_MESSAGE
{
    ubyte MessageType;
    ubyte HopCount;
    ubyte[16] LinkAddress;
    ubyte[16] PeerAddress;
    PXE_DHCPV6_OPTION[1] Options;
}
struct PXE_PROVIDER
{
    uint uSizeOfStruct;
    PWSTR pwszName;
    PWSTR pwszFilePath;
    BOOL bIsCritical;
    uint uIndex;
}
struct PXE_ADDRESS
{
    uint uFlags;
    union
    {
        ubyte[16] bAddress;
        uint uIpAddress;
    }
    uint uAddrLen;
    ushort uPort;
}
struct PXE_DHCPV6_NESTED_RELAY_MESSAGE
{
    PXE_DHCPV6_RELAY_MESSAGE* pRelayMessage;
    uint cbRelayMessage;
    void* pInterfaceIdOption;
    ushort cbInterfaceIdOption;
}
alias TRANSPORTPROVIDER_CALLBACK_ID = int;
enum : int
{
    WDS_TRANSPORTPROVIDER_CREATE_INSTANCE      = 0x00000000,
    WDS_TRANSPORTPROVIDER_COMPARE_CONTENT      = 0x00000001,
    WDS_TRANSPORTPROVIDER_OPEN_CONTENT         = 0x00000002,
    WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK    = 0x00000003,
    WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE     = 0x00000004,
    WDS_TRANSPORTPROVIDER_READ_CONTENT         = 0x00000005,
    WDS_TRANSPORTPROVIDER_CLOSE_CONTENT        = 0x00000006,
    WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE       = 0x00000007,
    WDS_TRANSPORTPROVIDER_SHUTDOWN             = 0x00000008,
    WDS_TRANSPORTPROVIDER_DUMP_STATE           = 0x00000009,
    WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS     = 0x0000000a,
    WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA = 0x0000000b,
    WDS_TRANSPORTPROVIDER_MAX_CALLBACKS        = 0x0000000c,
}

struct WDS_TRANSPORTPROVIDER_INIT_PARAMS
{
    uint ulLength;
    uint ulMcServerVersion;
    HKEY hRegistryKey;
    HANDLE hProvider;
}
struct WDS_TRANSPORTPROVIDER_SETTINGS
{
    uint ulLength;
    uint ulProviderVersion;
}
alias TRANSPORTCLIENT_CALLBACK_ID = int;
enum : int
{
    WDS_TRANSPORTCLIENT_SESSION_START     = 0x00000000,
    WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS  = 0x00000001,
    WDS_TRANSPORTCLIENT_SESSION_COMPLETE  = 0x00000002,
    WDS_TRANSPORTCLIENT_RECEIVE_METADATA  = 0x00000003,
    WDS_TRANSPORTCLIENT_SESSION_STARTEX   = 0x00000004,
    WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE = 0x00000005,
    WDS_TRANSPORTCLIENT_MAX_CALLBACKS     = 0x00000006,
}

struct TRANSPORTCLIENT_SESSION_INFO
{
    uint ulStructureLength;
    ULARGE_INTEGER ullFileSize;
    uint ulBlockSize;
}
alias PFN_WdsTransportClientSessionStart = void function(HANDLE, void*, ULARGE_INTEGER*);
alias PFN_WdsTransportClientSessionStartEx = void function(HANDLE, void*, TRANSPORTCLIENT_SESSION_INFO*);
alias PFN_WdsTransportClientReceiveMetadata = void function(HANDLE, void*, void*, uint);
alias PFN_WdsTransportClientReceiveContents = void function(HANDLE, void*, void*, uint, ULARGE_INTEGER*);
alias PFN_WdsTransportClientSessionComplete = void function(HANDLE, void*, uint);
alias PFN_WdsTransportClientSessionNegotiate = void function(HANDLE, void*, TRANSPORTCLIENT_SESSION_INFO*, HANDLE);
struct WDS_TRANSPORTCLIENT_REQUEST
{
    uint ulLength;
    uint ulApiVersion;
    WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL ulAuthLevel;
    const(wchar)* pwszServer;
    const(wchar)* pwszNamespace;
    const(wchar)* pwszObjectName;
    uint ulCacheSize;
    uint ulProtocol;
    void* pvProtocolData;
    uint ulProtocolDataLength;
}
struct WDS_TRANSPORTCLIENT_CALLBACKS
{
    PFN_WdsTransportClientSessionStart SessionStart;
    PFN_WdsTransportClientSessionStartEx SessionStartEx;
    PFN_WdsTransportClientReceiveContents ReceiveContents;
    PFN_WdsTransportClientReceiveMetadata ReceiveMetadata;
    PFN_WdsTransportClientSessionComplete SessionComplete;
    PFN_WdsTransportClientSessionNegotiate SessionNegotiate;
}
enum CLSID_WdsTransportCacheable = GUID(0x70590b16, 0xf146, 0x46bd, [0xbd, 0x9d, 0x4a, 0xaa, 0x90, 0x8, 0x4b, 0xf5]);
struct WdsTransportCacheable
{
}
enum CLSID_WdsTransportCollection = GUID(0xc7f18b09, 0x391e, 0x436e, [0xb1, 0xb, 0xc3, 0xef, 0x46, 0xf2, 0xc3, 0x4f]);
struct WdsTransportCollection
{
}
enum CLSID_WdsTransportManager = GUID(0xf21523f6, 0x837c, 0x4a58, [0xaf, 0x99, 0x8a, 0x7e, 0x27, 0xf8, 0xff, 0x59]);
struct WdsTransportManager
{
}
enum CLSID_WdsTransportServer = GUID(0xea19b643, 0x4adf, 0x4413, [0x94, 0x2c, 0x14, 0xf3, 0x79, 0x11, 0x87, 0x60]);
struct WdsTransportServer
{
}
enum CLSID_WdsTransportSetupManager = GUID(0xc7beeaad, 0x9f04, 0x4923, [0x9f, 0xc, 0xfb, 0xf5, 0x2b, 0xc7, 0x59, 0xf]);
struct WdsTransportSetupManager
{
}
enum CLSID_WdsTransportConfigurationManager = GUID(0x8743f674, 0x904c, 0x47ca, [0x85, 0x12, 0x35, 0xfe, 0x98, 0xf6, 0xb0, 0xac]);
struct WdsTransportConfigurationManager
{
}
enum CLSID_WdsTransportNamespaceManager = GUID(0xf08cdb63, 0x85de, 0x4a28, [0xa1, 0xa9, 0x5c, 0xa3, 0xe7, 0xef, 0xda, 0x73]);
struct WdsTransportNamespaceManager
{
}
enum CLSID_WdsTransportServicePolicy = GUID(0x65aceadc, 0x2f0b, 0x4f43, [0x9f, 0x4d, 0x81, 0x18, 0x65, 0xd8, 0xce, 0xad]);
struct WdsTransportServicePolicy
{
}
enum CLSID_WdsTransportDiagnosticsPolicy = GUID(0xeb3333e1, 0xa7ad, 0x46f5, [0x80, 0xd6, 0x6b, 0x74, 0x2, 0x4, 0xe5, 0x9]);
struct WdsTransportDiagnosticsPolicy
{
}
enum CLSID_WdsTransportMulticastSessionPolicy = GUID(0x3c6bc3f4, 0x6418, 0x472a, [0xb6, 0xf1, 0x52, 0xd4, 0x57, 0x19, 0x54, 0x37]);
struct WdsTransportMulticastSessionPolicy
{
}
enum CLSID_WdsTransportNamespace = GUID(0xd8385768, 0x732, 0x4ec1, [0x95, 0xea, 0x16, 0xda, 0x58, 0x19, 0x8, 0xa1]);
struct WdsTransportNamespace
{
}
enum CLSID_WdsTransportNamespaceAutoCast = GUID(0xb091f5a8, 0x6a99, 0x478d, [0xb2, 0x3b, 0x9, 0xe8, 0xfe, 0xe0, 0x45, 0x74]);
struct WdsTransportNamespaceAutoCast
{
}
enum CLSID_WdsTransportNamespaceScheduledCast = GUID(0xbadc1897, 0x7025, 0x44eb, [0x91, 0x8, 0xfb, 0x61, 0xc4, 0x5, 0x57, 0x92]);
struct WdsTransportNamespaceScheduledCast
{
}
enum CLSID_WdsTransportNamespaceScheduledCastManualStart = GUID(0xd3e1a2aa, 0xcaac, 0x460e, [0xb9, 0x8a, 0x47, 0xf9, 0xf3, 0x18, 0xa1, 0xfa]);
struct WdsTransportNamespaceScheduledCastManualStart
{
}
enum CLSID_WdsTransportNamespaceScheduledCastAutoStart = GUID(0xa1107052, 0x122c, 0x4b81, [0x9b, 0x7c, 0x38, 0x6e, 0x68, 0x55, 0x38, 0x3f]);
struct WdsTransportNamespaceScheduledCastAutoStart
{
}
enum CLSID_WdsTransportContent = GUID(0xa891fe7, 0x4a3f, 0x4c65, [0xb6, 0xf2, 0x14, 0x67, 0x61, 0x96, 0x79, 0xea]);
struct WdsTransportContent
{
}
enum CLSID_WdsTransportSession = GUID(0x749ac4e0, 0x67bc, 0x4743, [0xbf, 0xe5, 0xca, 0xcb, 0x1f, 0x26, 0xf5, 0x7f]);
struct WdsTransportSession
{
}
enum CLSID_WdsTransportClient = GUID(0x66d2c5e9, 0xff6, 0x49ec, [0x97, 0x33, 0xda, 0xfb, 0x1e, 0x1, 0xdf, 0x1c]);
struct WdsTransportClient
{
}
enum CLSID_WdsTransportTftpClient = GUID(0x50343925, 0x7c5c, 0x4c8c, [0x96, 0xc4, 0xad, 0x9f, 0xa5, 0x0, 0x5f, 0xba]);
struct WdsTransportTftpClient
{
}
enum CLSID_WdsTransportTftpManager = GUID(0xc8e9dca2, 0x3241, 0x4e4d, [0xb8, 0x6, 0xbc, 0x74, 0x1, 0x9d, 0xfe, 0xda]);
struct WdsTransportTftpManager
{
}
enum CLSID_WdsTransportContentProvider = GUID(0xe0be741f, 0x5a75, 0x4eb9, [0x8a, 0x2d, 0x5e, 0x18, 0x9b, 0x45, 0xf3, 0x27]);
struct WdsTransportContentProvider
{
}
alias WDSTRANSPORT_FEATURE_FLAGS = int;
enum : int
{
    WdsTptFeatureAdminPack        = 0x00000001,
    WdsTptFeatureTransportServer  = 0x00000002,
    WdsTptFeatureDeploymentServer = 0x00000004,
}

alias WDSTRANSPORT_PROTOCOL_FLAGS = int;
enum : int
{
    WdsTptProtocolUnicast   = 0x00000001,
    WdsTptProtocolMulticast = 0x00000002,
}

alias WDSTRANSPORT_NAMESPACE_TYPE = int;
enum : int
{
    WdsTptNamespaceTypeUnknown                  = 0x00000000,
    WdsTptNamespaceTypeAutoCast                 = 0x00000001,
    WdsTptNamespaceTypeScheduledCastManualStart = 0x00000002,
    WdsTptNamespaceTypeScheduledCastAutoStart   = 0x00000003,
}

alias WDSTRANSPORT_DISCONNECT_TYPE = int;
enum : int
{
    WdsTptDisconnectUnknown  = 0x00000000,
    WdsTptDisconnectFallback = 0x00000001,
    WdsTptDisconnectAbort    = 0x00000002,
}

alias WDSTRANSPORT_SERVICE_NOTIFICATION = int;
enum : int
{
    WdsTptServiceNotifyUnknown      = 0x00000000,
    WdsTptServiceNotifyReadSettings = 0x00000001,
}

alias WDSTRANSPORT_IP_ADDRESS_TYPE = int;
enum : int
{
    WdsTptIpAddressUnknown = 0x00000000,
    WdsTptIpAddressIpv4    = 0x00000001,
    WdsTptIpAddressIpv6    = 0x00000002,
}

alias WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE = int;
enum : int
{
    WdsTptIpAddressSourceUnknown = 0x00000000,
    WdsTptIpAddressSourceDhcp    = 0x00000001,
    WdsTptIpAddressSourceRange   = 0x00000002,
}

alias WDSTRANSPORT_NETWORK_PROFILE_TYPE = int;
enum : int
{
    WdsTptNetworkProfileUnknown = 0x00000000,
    WdsTptNetworkProfileCustom  = 0x00000001,
    WdsTptNetworkProfile10Mbps  = 0x00000002,
    WdsTptNetworkProfile100Mbps = 0x00000003,
    WdsTptNetworkProfile1Gbps   = 0x00000004,
}

alias WDSTRANSPORT_DIAGNOSTICS_COMPONENT_FLAGS = int;
enum : int
{
    WdsTptDiagnosticsComponentPxe         = 0x00000001,
    WdsTptDiagnosticsComponentTftp        = 0x00000002,
    WdsTptDiagnosticsComponentImageServer = 0x00000004,
    WdsTptDiagnosticsComponentMulticast   = 0x00000008,
}

alias WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE = int;
enum : int
{
    WdsTptSlowClientHandlingUnknown        = 0x00000000,
    WdsTptSlowClientHandlingNone           = 0x00000001,
    WdsTptSlowClientHandlingAutoDisconnect = 0x00000002,
    WdsTptSlowClientHandlingMultistream    = 0x00000003,
}

alias WDSTRANSPORT_UDP_PORT_POLICY = int;
enum : int
{
    WdsTptUdpPortPolicyDynamic = 0x00000000,
    WdsTptUdpPortPolicyFixed   = 0x00000001,
}

alias WDSTRANSPORT_TFTP_CAPABILITY = int;
enum : int
{
    WdsTptTftpCapMaximumBlockSize = 0x00000001,
    WdsTptTftpCapVariableWindow   = 0x00000002,
}

enum IID_IWdsTransportCacheable = GUID(0x46ad894b, 0xbab, 0x47dc, [0x84, 0xb2, 0x7b, 0x55, 0x3f, 0x1d, 0x8f, 0x80]);
interface IWdsTransportCacheable : IDispatch
{
    HRESULT get_Dirty(short*);
    HRESULT Discard();
    HRESULT Refresh();
    HRESULT Commit();
}
enum IID_IWdsTransportCollection = GUID(0xb8ba4b1a, 0x2ff4, 0x43ab, [0x99, 0x6c, 0xb2, 0xb1, 0xa, 0x91, 0xa6, 0xeb]);
interface IWdsTransportCollection : IDispatch
{
    HRESULT get_Count(uint*);
    HRESULT get_Item(uint, IDispatch*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IWdsTransportManager = GUID(0x5b0d35f5, 0x1b13, 0x4afd, [0xb8, 0x78, 0x65, 0x26, 0xdc, 0x34, 0xb, 0x5d]);
interface IWdsTransportManager : IDispatch
{
    HRESULT GetWdsTransportServer(BSTR, IWdsTransportServer*);
}
enum IID_IWdsTransportServer = GUID(0x9ccd093, 0x830d, 0x4344, [0xa3, 0xa, 0x73, 0xae, 0x8e, 0x8f, 0xca, 0x90]);
interface IWdsTransportServer : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_SetupManager(IWdsTransportSetupManager*);
    HRESULT get_ConfigurationManager(IWdsTransportConfigurationManager*);
    HRESULT get_NamespaceManager(IWdsTransportNamespaceManager*);
    HRESULT DisconnectClient(uint, WDSTRANSPORT_DISCONNECT_TYPE);
}
enum IID_IWdsTransportServer2 = GUID(0x256e999f, 0x6df4, 0x4538, [0x81, 0xb9, 0x85, 0x7b, 0x9a, 0xb8, 0xfb, 0x47]);
interface IWdsTransportServer2 : IWdsTransportServer
{
    HRESULT get_TftpManager(IWdsTransportTftpManager*);
}
enum IID_IWdsTransportSetupManager = GUID(0xf7238425, 0xefa8, 0x40a4, [0xae, 0xf9, 0xc9, 0x8d, 0x96, 0x9c, 0xb, 0x75]);
interface IWdsTransportSetupManager : IDispatch
{
    HRESULT get_Version(ulong*);
    HRESULT get_InstalledFeatures(uint*);
    HRESULT get_Protocols(uint*);
    HRESULT RegisterContentProvider(BSTR, BSTR, BSTR, BSTR);
    HRESULT DeregisterContentProvider(BSTR);
}
enum IID_IWdsTransportSetupManager2 = GUID(0x2be79da, 0x7e9e, 0x4366, [0x8b, 0x6e, 0x2a, 0xa9, 0xa9, 0x1b, 0xe4, 0x7f]);
interface IWdsTransportSetupManager2 : IWdsTransportSetupManager
{
    HRESULT get_TftpCapabilities(uint*);
    HRESULT get_ContentProviders(IWdsTransportCollection*);
}
enum IID_IWdsTransportConfigurationManager = GUID(0x84cc4779, 0x42dd, 0x4792, [0x89, 0x1e, 0x13, 0x21, 0xd6, 0xd7, 0x4b, 0x44]);
interface IWdsTransportConfigurationManager : IDispatch
{
    HRESULT get_ServicePolicy(IWdsTransportServicePolicy*);
    HRESULT get_DiagnosticsPolicy(IWdsTransportDiagnosticsPolicy*);
    HRESULT get_WdsTransportServicesRunning(short, short*);
    HRESULT EnableWdsTransportServices();
    HRESULT DisableWdsTransportServices();
    HRESULT StartWdsTransportServices();
    HRESULT StopWdsTransportServices();
    HRESULT RestartWdsTransportServices();
    HRESULT NotifyWdsTransportServices(WDSTRANSPORT_SERVICE_NOTIFICATION);
}
enum IID_IWdsTransportConfigurationManager2 = GUID(0xd0d85caf, 0xa153, 0x4f1d, [0xa9, 0xdd, 0x96, 0xf4, 0x31, 0xc5, 0x7, 0x17]);
interface IWdsTransportConfigurationManager2 : IWdsTransportConfigurationManager
{
    HRESULT get_MulticastSessionPolicy(IWdsTransportMulticastSessionPolicy*);
}
enum IID_IWdsTransportNamespaceManager = GUID(0x3e22d9f6, 0x3777, 0x4d98, [0x83, 0xe1, 0xf9, 0x86, 0x96, 0x71, 0x7b, 0xa3]);
interface IWdsTransportNamespaceManager : IDispatch
{
    HRESULT CreateNamespace(WDSTRANSPORT_NAMESPACE_TYPE, BSTR, BSTR, BSTR, IWdsTransportNamespace*);
    HRESULT RetrieveNamespace(BSTR, IWdsTransportNamespace*);
    HRESULT RetrieveNamespaces(BSTR, BSTR, short, IWdsTransportCollection*);
}
enum IID_IWdsTransportTftpManager = GUID(0x1327a7c8, 0xae8a, 0x4fb3, [0x81, 0x50, 0x13, 0x62, 0x27, 0xc3, 0x7e, 0x9a]);
interface IWdsTransportTftpManager : IDispatch
{
    HRESULT RetrieveTftpClients(IWdsTransportCollection*);
}
enum IID_IWdsTransportServicePolicy = GUID(0xb9468578, 0x9f2b, 0x48cc, [0xb2, 0x7a, 0xa6, 0x7, 0x99, 0xc2, 0x75, 0xc]);
interface IWdsTransportServicePolicy : IWdsTransportCacheable
{
    HRESULT get_IpAddressSource(WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE*);
    HRESULT put_IpAddressSource(WDSTRANSPORT_IP_ADDRESS_TYPE, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE);
    HRESULT get_StartIpAddress(WDSTRANSPORT_IP_ADDRESS_TYPE, BSTR*);
    HRESULT put_StartIpAddress(WDSTRANSPORT_IP_ADDRESS_TYPE, BSTR);
    HRESULT get_EndIpAddress(WDSTRANSPORT_IP_ADDRESS_TYPE, BSTR*);
    HRESULT put_EndIpAddress(WDSTRANSPORT_IP_ADDRESS_TYPE, BSTR);
    HRESULT get_StartPort(uint*);
    HRESULT put_StartPort(uint);
    HRESULT get_EndPort(uint*);
    HRESULT put_EndPort(uint);
    HRESULT get_NetworkProfile(WDSTRANSPORT_NETWORK_PROFILE_TYPE*);
    HRESULT put_NetworkProfile(WDSTRANSPORT_NETWORK_PROFILE_TYPE);
}
enum IID_IWdsTransportServicePolicy2 = GUID(0x65c19e5c, 0xaa7e, 0x4b91, [0x89, 0x44, 0x91, 0xe0, 0xe5, 0x57, 0x27, 0x97]);
interface IWdsTransportServicePolicy2 : IWdsTransportServicePolicy
{
    HRESULT get_UdpPortPolicy(WDSTRANSPORT_UDP_PORT_POLICY*);
    HRESULT put_UdpPortPolicy(WDSTRANSPORT_UDP_PORT_POLICY);
    HRESULT get_TftpMaximumBlockSize(uint*);
    HRESULT put_TftpMaximumBlockSize(uint);
    HRESULT get_EnableTftpVariableWindowExtension(short*);
    HRESULT put_EnableTftpVariableWindowExtension(short);
}
enum IID_IWdsTransportDiagnosticsPolicy = GUID(0x13b33efc, 0x7856, 0x4f61, [0x9a, 0x59, 0x8d, 0xe6, 0x7b, 0x6b, 0x87, 0xb6]);
interface IWdsTransportDiagnosticsPolicy : IWdsTransportCacheable
{
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
    HRESULT get_Components(uint*);
    HRESULT put_Components(uint);
}
enum IID_IWdsTransportMulticastSessionPolicy = GUID(0x4e5753cf, 0x68ec, 0x4504, [0xa9, 0x51, 0x4a, 0x0, 0x32, 0x66, 0x60, 0x6b]);
interface IWdsTransportMulticastSessionPolicy : IWdsTransportCacheable
{
    HRESULT get_SlowClientHandling(WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE*);
    HRESULT put_SlowClientHandling(WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE);
    HRESULT get_AutoDisconnectThreshold(uint*);
    HRESULT put_AutoDisconnectThreshold(uint);
    HRESULT get_MultistreamStreamCount(uint*);
    HRESULT put_MultistreamStreamCount(uint);
    HRESULT get_SlowClientFallback(short*);
    HRESULT put_SlowClientFallback(short);
}
enum IID_IWdsTransportNamespace = GUID(0xfa561f57, 0xfbef, 0x4ed3, [0xb0, 0x56, 0x12, 0x7c, 0xb1, 0xb3, 0x3b, 0x84]);
interface IWdsTransportNamespace : IDispatch
{
    HRESULT get_Type(WDSTRANSPORT_NAMESPACE_TYPE*);
    HRESULT get_Id(uint*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_FriendlyName(BSTR*);
    HRESULT put_FriendlyName(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ContentProvider(BSTR*);
    HRESULT put_ContentProvider(BSTR);
    HRESULT get_Configuration(BSTR*);
    HRESULT put_Configuration(BSTR);
    HRESULT get_Registered(short*);
    HRESULT get_Tombstoned(short*);
    HRESULT get_TombstoneTime(double*);
    HRESULT get_TransmissionStarted(short*);
    HRESULT Register();
    HRESULT Deregister(short);
    HRESULT Clone(IWdsTransportNamespace*);
    HRESULT Refresh();
    HRESULT RetrieveContents(IWdsTransportCollection*);
}
enum IID_IWdsTransportNamespaceAutoCast = GUID(0xad931a72, 0xc4bd, 0x4c41, [0x8f, 0xbc, 0x59, 0xc9, 0xc7, 0x48, 0xdf, 0x9e]);
interface IWdsTransportNamespaceAutoCast : IWdsTransportNamespace
{
}
enum IID_IWdsTransportNamespaceScheduledCast = GUID(0x3840cecf, 0xd76c, 0x416e, [0xa4, 0xcc, 0x31, 0xc7, 0x41, 0xd2, 0x87, 0x4b]);
interface IWdsTransportNamespaceScheduledCast : IWdsTransportNamespace
{
    HRESULT StartTransmission();
}
enum IID_IWdsTransportNamespaceScheduledCastManualStart = GUID(0x13e6e4c, 0xe6a7, 0x4fb5, [0xb7, 0xff, 0xd9, 0xf5, 0xda, 0x80, 0x5c, 0x31]);
interface IWdsTransportNamespaceScheduledCastManualStart : IWdsTransportNamespaceScheduledCast
{
}
enum IID_IWdsTransportNamespaceScheduledCastAutoStart = GUID(0xd606af3d, 0xea9c, 0x4219, [0x96, 0x1e, 0x74, 0x91, 0xd6, 0x18, 0xd9, 0xb9]);
interface IWdsTransportNamespaceScheduledCastAutoStart : IWdsTransportNamespaceScheduledCast
{
    HRESULT get_MinimumClients(uint*);
    HRESULT put_MinimumClients(uint);
    HRESULT get_StartTime(double*);
    HRESULT put_StartTime(double);
}
enum IID_IWdsTransportContent = GUID(0xd405d711, 0x296, 0x4ab4, [0xa8, 0x60, 0xac, 0x7d, 0x32, 0xe6, 0x57, 0x98]);
interface IWdsTransportContent : IDispatch
{
    HRESULT get_Namespace(IWdsTransportNamespace*);
    HRESULT get_Id(uint*);
    HRESULT get_Name(BSTR*);
    HRESULT RetrieveSessions(IWdsTransportCollection*);
    HRESULT Terminate();
}
enum IID_IWdsTransportSession = GUID(0xf4efea88, 0x65b1, 0x4f30, [0xa4, 0xb9, 0x27, 0x93, 0x98, 0x77, 0x96, 0xfb]);
interface IWdsTransportSession : IDispatch
{
    HRESULT get_Content(IWdsTransportContent*);
    HRESULT get_Id(uint*);
    HRESULT get_NetworkInterfaceName(BSTR*);
    HRESULT get_NetworkInterfaceAddress(BSTR*);
    HRESULT get_TransferRate(uint*);
    HRESULT get_MasterClientId(uint*);
    HRESULT RetrieveClients(IWdsTransportCollection*);
    HRESULT Terminate();
}
enum IID_IWdsTransportClient = GUID(0xb5dbc93a, 0xcabe, 0x46ca, [0x83, 0x7f, 0x3e, 0x44, 0xe9, 0x3c, 0x65, 0x45]);
interface IWdsTransportClient : IDispatch
{
    HRESULT get_Session(IWdsTransportSession*);
    HRESULT get_Id(uint*);
    HRESULT get_Name(BSTR*);
    HRESULT get_MacAddress(BSTR*);
    HRESULT get_IpAddress(BSTR*);
    HRESULT get_PercentCompletion(uint*);
    HRESULT get_JoinDuration(uint*);
    HRESULT get_CpuUtilization(uint*);
    HRESULT get_MemoryUtilization(uint*);
    HRESULT get_NetworkUtilization(uint*);
    HRESULT get_UserIdentity(BSTR*);
    HRESULT Disconnect(WDSTRANSPORT_DISCONNECT_TYPE);
}
enum IID_IWdsTransportTftpClient = GUID(0xb022d3ae, 0x884d, 0x4d85, [0xb1, 0x46, 0x53, 0x32, 0xe, 0x76, 0xef, 0x62]);
interface IWdsTransportTftpClient : IDispatch
{
    HRESULT get_FileName(BSTR*);
    HRESULT get_IpAddress(BSTR*);
    HRESULT get_Timeout(uint*);
    HRESULT get_CurrentFileOffset(ulong*);
    HRESULT get_FileSize(ulong*);
    HRESULT get_BlockSize(uint*);
    HRESULT get_WindowSize(uint*);
}
enum IID_IWdsTransportContentProvider = GUID(0xb9489f24, 0xf219, 0x4acf, [0xaa, 0xd7, 0x26, 0x5c, 0x7c, 0x8, 0xa6, 0xae]);
interface IWdsTransportContentProvider : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Description(BSTR*);
    HRESULT get_FilePath(BSTR*);
    HRESULT get_InitializationRoutine(BSTR*);
}
