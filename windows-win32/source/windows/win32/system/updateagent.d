module windows.win32.system.updateagent;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, DECIMAL, HRESULT, HWND, VARIANT_BOOL;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum LIBID_WUApiLib = GUID(0xb596cc9f, 0x56e5, 0x419e, [0xa6, 0x22, 0xe0, 0x1b, 0xb4, 0x57, 0x43, 0x1e]);
enum UPDATE_LOCKDOWN_WEBSITE_ACCESS = 0x00000001;
enum WU_S_SERVICE_STOP = 0x00240001;
enum WU_S_SELFUPDATE = 0x00240002;
enum WU_S_UPDATE_ERROR = 0x00240003;
enum WU_S_MARKED_FOR_DISCONNECT = 0x00240004;
enum WU_S_REBOOT_REQUIRED = 0x00240005;
enum WU_S_ALREADY_INSTALLED = 0x00240006;
enum WU_S_ALREADY_UNINSTALLED = 0x00240007;
enum WU_S_ALREADY_DOWNLOADED = 0x00240008;
enum WU_S_SOME_UPDATES_SKIPPED_ON_BATTERY = 0x00240009;
enum WU_S_ALREADY_REVERTED = 0x0024000a;
enum WU_S_SEARCH_CRITERIA_NOT_SUPPORTED = 0x00240010;
enum WU_S_UH_INSTALLSTILLPENDING = 0x00242015;
enum WU_S_UH_DOWNLOAD_SIZE_CALCULATED = 0x00242016;
enum WU_S_SIH_NOOP = 0x00245001;
enum WU_S_DM_ALREADYDOWNLOADING = 0x00246001;
enum WU_S_METADATA_SKIPPED_BY_ENFORCEMENTMODE = 0x00247101;
enum WU_S_METADATA_IGNORED_SIGNATURE_VERIFICATION = 0x00247102;
enum WU_S_SEARCH_LOAD_SHEDDING = 0x00248001;
enum WU_E_NO_SERVICE = 0xffffffff80240001;
enum WU_E_MAX_CAPACITY_REACHED = 0xffffffff80240002;
enum WU_E_UNKNOWN_ID = 0xffffffff80240003;
enum WU_E_NOT_INITIALIZED = 0xffffffff80240004;
enum WU_E_RANGEOVERLAP = 0xffffffff80240005;
enum WU_E_TOOMANYRANGES = 0xffffffff80240006;
enum WU_E_INVALIDINDEX = 0xffffffff80240007;
enum WU_E_ITEMNOTFOUND = 0xffffffff80240008;
enum WU_E_OPERATIONINPROGRESS = 0xffffffff80240009;
enum WU_E_COULDNOTCANCEL = 0xffffffff8024000a;
enum WU_E_CALL_CANCELLED = 0xffffffff8024000b;
enum WU_E_NOOP = 0xffffffff8024000c;
enum WU_E_XML_MISSINGDATA = 0xffffffff8024000d;
enum WU_E_XML_INVALID = 0xffffffff8024000e;
enum WU_E_CYCLE_DETECTED = 0xffffffff8024000f;
enum WU_E_TOO_DEEP_RELATION = 0xffffffff80240010;
enum WU_E_INVALID_RELATIONSHIP = 0xffffffff80240011;
enum WU_E_REG_VALUE_INVALID = 0xffffffff80240012;
enum WU_E_DUPLICATE_ITEM = 0xffffffff80240013;
enum WU_E_INVALID_INSTALL_REQUESTED = 0xffffffff80240014;
enum WU_E_INSTALL_NOT_ALLOWED = 0xffffffff80240016;
enum WU_E_NOT_APPLICABLE = 0xffffffff80240017;
enum WU_E_NO_USERTOKEN = 0xffffffff80240018;
enum WU_E_EXCLUSIVE_INSTALL_CONFLICT = 0xffffffff80240019;
enum WU_E_POLICY_NOT_SET = 0xffffffff8024001a;
enum WU_E_SELFUPDATE_IN_PROGRESS = 0xffffffff8024001b;
enum WU_E_INVALID_UPDATE = 0xffffffff8024001d;
enum WU_E_SERVICE_STOP = 0xffffffff8024001e;
enum WU_E_NO_CONNECTION = 0xffffffff8024001f;
enum WU_E_NO_INTERACTIVE_USER = 0xffffffff80240020;
enum WU_E_TIME_OUT = 0xffffffff80240021;
enum WU_E_ALL_UPDATES_FAILED = 0xffffffff80240022;
enum WU_E_EULAS_DECLINED = 0xffffffff80240023;
enum WU_E_NO_UPDATE = 0xffffffff80240024;
enum WU_E_USER_ACCESS_DISABLED = 0xffffffff80240025;
enum WU_E_INVALID_UPDATE_TYPE = 0xffffffff80240026;
enum WU_E_URL_TOO_LONG = 0xffffffff80240027;
enum WU_E_UNINSTALL_NOT_ALLOWED = 0xffffffff80240028;
enum WU_E_INVALID_PRODUCT_LICENSE = 0xffffffff80240029;
enum WU_E_MISSING_HANDLER = 0xffffffff8024002a;
enum WU_E_LEGACYSERVER = 0xffffffff8024002b;
enum WU_E_BIN_SOURCE_ABSENT = 0xffffffff8024002c;
enum WU_E_SOURCE_ABSENT = 0xffffffff8024002d;
enum WU_E_WU_DISABLED = 0xffffffff8024002e;
enum WU_E_CALL_CANCELLED_BY_POLICY = 0xffffffff8024002f;
enum WU_E_INVALID_PROXY_SERVER = 0xffffffff80240030;
enum WU_E_INVALID_FILE = 0xffffffff80240031;
enum WU_E_INVALID_CRITERIA = 0xffffffff80240032;
enum WU_E_EULA_UNAVAILABLE = 0xffffffff80240033;
enum WU_E_DOWNLOAD_FAILED = 0xffffffff80240034;
enum WU_E_UPDATE_NOT_PROCESSED = 0xffffffff80240035;
enum WU_E_INVALID_OPERATION = 0xffffffff80240036;
enum WU_E_NOT_SUPPORTED = 0xffffffff80240037;
enum WU_E_WINHTTP_INVALID_FILE = 0xffffffff80240038;
enum WU_E_TOO_MANY_RESYNC = 0xffffffff80240039;
enum WU_E_NO_SERVER_CORE_SUPPORT = 0xffffffff80240040;
enum WU_E_SYSPREP_IN_PROGRESS = 0xffffffff80240041;
enum WU_E_UNKNOWN_SERVICE = 0xffffffff80240042;
enum WU_E_NO_UI_SUPPORT = 0xffffffff80240043;
enum WU_E_PER_MACHINE_UPDATE_ACCESS_DENIED = 0xffffffff80240044;
enum WU_E_UNSUPPORTED_SEARCHSCOPE = 0xffffffff80240045;
enum WU_E_BAD_FILE_URL = 0xffffffff80240046;
enum WU_E_REVERT_NOT_ALLOWED = 0xffffffff80240047;
enum WU_E_INVALID_NOTIFICATION_INFO = 0xffffffff80240048;
enum WU_E_OUTOFRANGE = 0xffffffff80240049;
enum WU_E_SETUP_IN_PROGRESS = 0xffffffff8024004a;
enum WU_E_ORPHANED_DOWNLOAD_JOB = 0xffffffff8024004b;
enum WU_E_LOW_BATTERY = 0xffffffff8024004c;
enum WU_E_INFRASTRUCTUREFILE_INVALID_FORMAT = 0xffffffff8024004d;
enum WU_E_INFRASTRUCTUREFILE_REQUIRES_SSL = 0xffffffff8024004e;
enum WU_E_IDLESHUTDOWN_OPCOUNT_DISCOVERY = 0xffffffff8024004f;
enum WU_E_IDLESHUTDOWN_OPCOUNT_SEARCH = 0xffffffff80240050;
enum WU_E_IDLESHUTDOWN_OPCOUNT_DOWNLOAD = 0xffffffff80240051;
enum WU_E_IDLESHUTDOWN_OPCOUNT_INSTALL = 0xffffffff80240052;
enum WU_E_IDLESHUTDOWN_OPCOUNT_OTHER = 0xffffffff80240053;
enum WU_E_INTERACTIVE_CALL_CANCELLED = 0xffffffff80240054;
enum WU_E_AU_CALL_CANCELLED = 0xffffffff80240055;
enum WU_E_SYSTEM_UNSUPPORTED = 0xffffffff80240056;
enum WU_E_NO_SUCH_HANDLER_PLUGIN = 0xffffffff80240057;
enum WU_E_INVALID_SERIALIZATION_VERSION = 0xffffffff80240058;
enum WU_E_NETWORK_COST_EXCEEDS_POLICY = 0xffffffff80240059;
enum WU_E_CALL_CANCELLED_BY_HIDE = 0xffffffff8024005a;
enum WU_E_CALL_CANCELLED_BY_INVALID = 0xffffffff8024005b;
enum WU_E_INVALID_VOLUMEID = 0xffffffff8024005c;
enum WU_E_UNRECOGNIZED_VOLUMEID = 0xffffffff8024005d;
enum WU_E_EXTENDEDERROR_NOTSET = 0xffffffff8024005e;
enum WU_E_EXTENDEDERROR_FAILED = 0xffffffff8024005f;
enum WU_E_IDLESHUTDOWN_OPCOUNT_SERVICEREGISTRATION = 0xffffffff80240060;
enum WU_E_FILETRUST_SHA2SIGNATURE_MISSING = 0xffffffff80240061;
enum WU_E_UPDATE_NOT_APPROVED = 0xffffffff80240062;
enum WU_E_CALL_CANCELLED_BY_INTERACTIVE_SEARCH = 0xffffffff80240063;
enum WU_E_INSTALL_JOB_RESUME_NOT_ALLOWED = 0xffffffff80240064;
enum WU_E_INSTALL_JOB_NOT_SUSPENDED = 0xffffffff80240065;
enum WU_E_INSTALL_USERCONTEXT_ACCESSDENIED = 0xffffffff80240066;
enum WU_E_UNEXPECTED = 0xffffffff80240fff;
enum WU_E_MSI_WRONG_VERSION = 0xffffffff80241001;
enum WU_E_MSI_NOT_CONFIGURED = 0xffffffff80241002;
enum WU_E_MSP_DISABLED = 0xffffffff80241003;
enum WU_E_MSI_WRONG_APP_CONTEXT = 0xffffffff80241004;
enum WU_E_MSI_NOT_PRESENT = 0xffffffff80241005;
enum WU_E_MSP_UNEXPECTED = 0xffffffff80241fff;
enum WU_E_PT_SOAPCLIENT_BASE = 0xffffffff80244000;
enum WU_E_PT_SOAPCLIENT_INITIALIZE = 0xffffffff80244001;
enum WU_E_PT_SOAPCLIENT_OUTOFMEMORY = 0xffffffff80244002;
enum WU_E_PT_SOAPCLIENT_GENERATE = 0xffffffff80244003;
enum WU_E_PT_SOAPCLIENT_CONNECT = 0xffffffff80244004;
enum WU_E_PT_SOAPCLIENT_SEND = 0xffffffff80244005;
enum WU_E_PT_SOAPCLIENT_SERVER = 0xffffffff80244006;
enum WU_E_PT_SOAPCLIENT_SOAPFAULT = 0xffffffff80244007;
enum WU_E_PT_SOAPCLIENT_PARSEFAULT = 0xffffffff80244008;
enum WU_E_PT_SOAPCLIENT_READ = 0xffffffff80244009;
enum WU_E_PT_SOAPCLIENT_PARSE = 0xffffffff8024400a;
enum WU_E_PT_SOAP_VERSION = 0xffffffff8024400b;
enum WU_E_PT_SOAP_MUST_UNDERSTAND = 0xffffffff8024400c;
enum WU_E_PT_SOAP_CLIENT = 0xffffffff8024400d;
enum WU_E_PT_SOAP_SERVER = 0xffffffff8024400e;
enum WU_E_PT_WMI_ERROR = 0xffffffff8024400f;
enum WU_E_PT_EXCEEDED_MAX_SERVER_TRIPS = 0xffffffff80244010;
enum WU_E_PT_SUS_SERVER_NOT_SET = 0xffffffff80244011;
enum WU_E_PT_DOUBLE_INITIALIZATION = 0xffffffff80244012;
enum WU_E_PT_INVALID_COMPUTER_NAME = 0xffffffff80244013;
enum WU_E_PT_REFRESH_CACHE_REQUIRED = 0xffffffff80244015;
enum WU_E_PT_HTTP_STATUS_BAD_REQUEST = 0xffffffff80244016;
enum WU_E_PT_HTTP_STATUS_DENIED = 0xffffffff80244017;
enum WU_E_PT_HTTP_STATUS_FORBIDDEN = 0xffffffff80244018;
enum WU_E_PT_HTTP_STATUS_NOT_FOUND = 0xffffffff80244019;
enum WU_E_PT_HTTP_STATUS_BAD_METHOD = 0xffffffff8024401a;
enum WU_E_PT_HTTP_STATUS_PROXY_AUTH_REQ = 0xffffffff8024401b;
enum WU_E_PT_HTTP_STATUS_REQUEST_TIMEOUT = 0xffffffff8024401c;
enum WU_E_PT_HTTP_STATUS_CONFLICT = 0xffffffff8024401d;
enum WU_E_PT_HTTP_STATUS_GONE = 0xffffffff8024401e;
enum WU_E_PT_HTTP_STATUS_SERVER_ERROR = 0xffffffff8024401f;
enum WU_E_PT_HTTP_STATUS_NOT_SUPPORTED = 0xffffffff80244020;
enum WU_E_PT_HTTP_STATUS_BAD_GATEWAY = 0xffffffff80244021;
enum WU_E_PT_HTTP_STATUS_SERVICE_UNAVAIL = 0xffffffff80244022;
enum WU_E_PT_HTTP_STATUS_GATEWAY_TIMEOUT = 0xffffffff80244023;
enum WU_E_PT_HTTP_STATUS_VERSION_NOT_SUP = 0xffffffff80244024;
enum WU_E_PT_FILE_LOCATIONS_CHANGED = 0xffffffff80244025;
enum WU_E_PT_REGISTRATION_NOT_SUPPORTED = 0xffffffff80244026;
enum WU_E_PT_NO_AUTH_PLUGINS_REQUESTED = 0xffffffff80244027;
enum WU_E_PT_NO_AUTH_COOKIES_CREATED = 0xffffffff80244028;
enum WU_E_PT_INVALID_CONFIG_PROP = 0xffffffff80244029;
enum WU_E_PT_CONFIG_PROP_MISSING = 0xffffffff8024402a;
enum WU_E_PT_HTTP_STATUS_NOT_MAPPED = 0xffffffff8024402b;
enum WU_E_PT_WINHTTP_NAME_NOT_RESOLVED = 0xffffffff8024402c;
enum WU_E_PT_LOAD_SHEDDING = 0xffffffff8024402d;
enum WU_E_PT_SAME_REDIR_ID = 0xffffffff8024502d;
enum WU_E_PT_NO_MANAGED_RECOVER = 0xffffffff8024502e;
enum WU_E_PT_ECP_SUCCEEDED_WITH_ERRORS = 0xffffffff8024402f;
enum WU_E_PT_ECP_INIT_FAILED = 0xffffffff80244030;
enum WU_E_PT_ECP_INVALID_FILE_FORMAT = 0xffffffff80244031;
enum WU_E_PT_ECP_INVALID_METADATA = 0xffffffff80244032;
enum WU_E_PT_ECP_FAILURE_TO_EXTRACT_DIGEST = 0xffffffff80244033;
enum WU_E_PT_ECP_FAILURE_TO_DECOMPRESS_CAB_FILE = 0xffffffff80244034;
enum WU_E_PT_ECP_FILE_LOCATION_ERROR = 0xffffffff80244035;
enum WU_E_PT_CATALOG_SYNC_REQUIRED = 0xffffffff80240436;
enum WU_E_PT_SECURITY_VERIFICATION_FAILURE = 0xffffffff80240437;
enum WU_E_PT_ENDPOINT_UNREACHABLE = 0xffffffff80240438;
enum WU_E_PT_INVALID_FORMAT = 0xffffffff80240439;
enum WU_E_PT_INVALID_URL = 0xffffffff8024043a;
enum WU_E_PT_NWS_NOT_LOADED = 0xffffffff8024043b;
enum WU_E_PT_PROXY_AUTH_SCHEME_NOT_SUPPORTED = 0xffffffff8024043c;
enum WU_E_SERVICEPROP_NOTAVAIL = 0xffffffff8024043d;
enum WU_E_PT_ENDPOINT_REFRESH_REQUIRED = 0xffffffff8024043e;
enum WU_E_PT_ENDPOINTURL_NOTAVAIL = 0xffffffff8024043f;
enum WU_E_PT_ENDPOINT_DISCONNECTED = 0xffffffff80240440;
enum WU_E_PT_INVALID_OPERATION = 0xffffffff80240441;
enum WU_E_PT_OBJECT_FAULTED = 0xffffffff80240442;
enum WU_E_PT_NUMERIC_OVERFLOW = 0xffffffff80240443;
enum WU_E_PT_OPERATION_ABORTED = 0xffffffff80240444;
enum WU_E_PT_OPERATION_ABANDONED = 0xffffffff80240445;
enum WU_E_PT_QUOTA_EXCEEDED = 0xffffffff80240446;
enum WU_E_PT_NO_TRANSLATION_AVAILABLE = 0xffffffff80240447;
enum WU_E_PT_ADDRESS_IN_USE = 0xffffffff80240448;
enum WU_E_PT_ADDRESS_NOT_AVAILABLE = 0xffffffff80240449;
enum WU_E_PT_OTHER = 0xffffffff8024044a;
enum WU_E_PT_SECURITY_SYSTEM_FAILURE = 0xffffffff8024044b;
enum WU_E_PT_UNEXPECTED = 0xffffffff80244fff;
enum WU_E_REDIRECTOR_LOAD_XML = 0xffffffff80245001;
enum WU_E_REDIRECTOR_S_FALSE = 0xffffffff80245002;
enum WU_E_REDIRECTOR_ID_SMALLER = 0xffffffff80245003;
enum WU_E_REDIRECTOR_UNKNOWN_SERVICE = 0xffffffff80245004;
enum WU_E_REDIRECTOR_UNSUPPORTED_CONTENTTYPE = 0xffffffff80245005;
enum WU_E_REDIRECTOR_INVALID_RESPONSE = 0xffffffff80245006;
enum WU_E_REDIRECTOR_ATTRPROVIDER_EXCEEDED_MAX_NAMEVALUE = 0xffffffff80245008;
enum WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_NAME = 0xffffffff80245009;
enum WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_VALUE = 0xffffffff8024500a;
enum WU_E_REDIRECTOR_SLS_GENERIC_ERROR = 0xffffffff8024500b;
enum WU_E_REDIRECTOR_CONNECT_POLICY = 0xffffffff8024500c;
enum WU_E_REDIRECTOR_ONLINE_DISALLOWED = 0xffffffff8024500d;
enum WU_E_REDIRECTOR_UNEXPECTED = 0xffffffff802450ff;
enum WU_E_SIH_VERIFY_DOWNLOAD_ENGINE = 0xffffffff80245101;
enum WU_E_SIH_VERIFY_DOWNLOAD_PAYLOAD = 0xffffffff80245102;
enum WU_E_SIH_VERIFY_STAGE_ENGINE = 0xffffffff80245103;
enum WU_E_SIH_VERIFY_STAGE_PAYLOAD = 0xffffffff80245104;
enum WU_E_SIH_ACTION_NOT_FOUND = 0xffffffff80245105;
enum WU_E_SIH_SLS_PARSE = 0xffffffff80245106;
enum WU_E_SIH_INVALIDHASH = 0xffffffff80245107;
enum WU_E_SIH_NO_ENGINE = 0xffffffff80245108;
enum WU_E_SIH_POST_REBOOT_INSTALL_FAILED = 0xffffffff80245109;
enum WU_E_SIH_POST_REBOOT_NO_CACHED_SLS_RESPONSE = 0xffffffff8024510a;
enum WU_E_SIH_PARSE = 0xffffffff8024510b;
enum WU_E_SIH_SECURITY = 0xffffffff8024510c;
enum WU_E_SIH_PPL = 0xffffffff8024510d;
enum WU_E_SIH_POLICY = 0xffffffff8024510e;
enum WU_E_SIH_STDEXCEPTION = 0xffffffff8024510f;
enum WU_E_SIH_NONSTDEXCEPTION = 0xffffffff80245110;
enum WU_E_SIH_ENGINE_EXCEPTION = 0xffffffff80245111;
enum WU_E_SIH_BLOCKED_FOR_PLATFORM = 0xffffffff80245112;
enum WU_E_SIH_ANOTHER_INSTANCE_RUNNING = 0xffffffff80245113;
enum WU_E_SIH_DNSRESILIENCY_OFF = 0xffffffff80245114;
enum WU_E_SIH_UNEXPECTED = 0xffffffff802451ff;
enum WU_E_DRV_PRUNED = 0xffffffff8024c001;
enum WU_E_DRV_NOPROP_OR_LEGACY = 0xffffffff8024c002;
enum WU_E_DRV_REG_MISMATCH = 0xffffffff8024c003;
enum WU_E_DRV_NO_METADATA = 0xffffffff8024c004;
enum WU_E_DRV_MISSING_ATTRIBUTE = 0xffffffff8024c005;
enum WU_E_DRV_SYNC_FAILED = 0xffffffff8024c006;
enum WU_E_DRV_NO_PRINTER_CONTENT = 0xffffffff8024c007;
enum WU_E_DRV_DEVICE_PROBLEM = 0xffffffff8024c008;
enum WU_E_DRV_UNEXPECTED = 0xffffffff8024cfff;
enum WU_E_DS_SHUTDOWN = 0xffffffff80248000;
enum WU_E_DS_INUSE = 0xffffffff80248001;
enum WU_E_DS_INVALID = 0xffffffff80248002;
enum WU_E_DS_TABLEMISSING = 0xffffffff80248003;
enum WU_E_DS_TABLEINCORRECT = 0xffffffff80248004;
enum WU_E_DS_INVALIDTABLENAME = 0xffffffff80248005;
enum WU_E_DS_BADVERSION = 0xffffffff80248006;
enum WU_E_DS_NODATA = 0xffffffff80248007;
enum WU_E_DS_MISSINGDATA = 0xffffffff80248008;
enum WU_E_DS_MISSINGREF = 0xffffffff80248009;
enum WU_E_DS_UNKNOWNHANDLER = 0xffffffff8024800a;
enum WU_E_DS_CANTDELETE = 0xffffffff8024800b;
enum WU_E_DS_LOCKTIMEOUTEXPIRED = 0xffffffff8024800c;
enum WU_E_DS_NOCATEGORIES = 0xffffffff8024800d;
enum WU_E_DS_ROWEXISTS = 0xffffffff8024800e;
enum WU_E_DS_STOREFILELOCKED = 0xffffffff8024800f;
enum WU_E_DS_CANNOTREGISTER = 0xffffffff80248010;
enum WU_E_DS_UNABLETOSTART = 0xffffffff80248011;
enum WU_E_DS_DUPLICATEUPDATEID = 0xffffffff80248013;
enum WU_E_DS_UNKNOWNSERVICE = 0xffffffff80248014;
enum WU_E_DS_SERVICEEXPIRED = 0xffffffff80248015;
enum WU_E_DS_DECLINENOTALLOWED = 0xffffffff80248016;
enum WU_E_DS_TABLESESSIONMISMATCH = 0xffffffff80248017;
enum WU_E_DS_SESSIONLOCKMISMATCH = 0xffffffff80248018;
enum WU_E_DS_NEEDWINDOWSSERVICE = 0xffffffff80248019;
enum WU_E_DS_INVALIDOPERATION = 0xffffffff8024801a;
enum WU_E_DS_SCHEMAMISMATCH = 0xffffffff8024801b;
enum WU_E_DS_RESETREQUIRED = 0xffffffff8024801c;
enum WU_E_DS_IMPERSONATED = 0xffffffff8024801d;
enum WU_E_DS_DATANOTAVAILABLE = 0xffffffff8024801e;
enum WU_E_DS_DATANOTLOADED = 0xffffffff8024801f;
enum WU_E_DS_NODATA_NOSUCHREVISION = 0xffffffff80248020;
enum WU_E_DS_NODATA_NOSUCHUPDATE = 0xffffffff80248021;
enum WU_E_DS_NODATA_EULA = 0xffffffff80248022;
enum WU_E_DS_NODATA_SERVICE = 0xffffffff80248023;
enum WU_E_DS_NODATA_COOKIE = 0xffffffff80248024;
enum WU_E_DS_NODATA_TIMER = 0xffffffff80248025;
enum WU_E_DS_NODATA_CCR = 0xffffffff80248026;
enum WU_E_DS_NODATA_FILE = 0xffffffff80248027;
enum WU_E_DS_NODATA_DOWNLOADJOB = 0xffffffff80248028;
enum WU_E_DS_NODATA_TMI = 0xffffffff80248029;
enum WU_E_DS_UNEXPECTED = 0xffffffff80248fff;
enum WU_E_INVENTORY_PARSEFAILED = 0xffffffff80249001;
enum WU_E_INVENTORY_GET_INVENTORY_TYPE_FAILED = 0xffffffff80249002;
enum WU_E_INVENTORY_RESULT_UPLOAD_FAILED = 0xffffffff80249003;
enum WU_E_INVENTORY_UNEXPECTED = 0xffffffff80249004;
enum WU_E_INVENTORY_WMI_ERROR = 0xffffffff80249005;
enum WU_E_AU_NOSERVICE = 0xffffffff8024a000;
enum WU_E_AU_NONLEGACYSERVER = 0xffffffff8024a002;
enum WU_E_AU_LEGACYCLIENTDISABLED = 0xffffffff8024a003;
enum WU_E_AU_PAUSED = 0xffffffff8024a004;
enum WU_E_AU_NO_REGISTERED_SERVICE = 0xffffffff8024a005;
enum WU_E_AU_DETECT_SVCID_MISMATCH = 0xffffffff8024a006;
enum WU_E_REBOOT_IN_PROGRESS = 0xffffffff8024a007;
enum WU_E_AU_OOBE_IN_PROGRESS = 0xffffffff8024a008;
enum WU_E_AU_UNEXPECTED = 0xffffffff8024afff;
enum WU_E_UH_REMOTEUNAVAILABLE = 0xffffffff80242000;
enum WU_E_UH_LOCALONLY = 0xffffffff80242001;
enum WU_E_UH_UNKNOWNHANDLER = 0xffffffff80242002;
enum WU_E_UH_REMOTEALREADYACTIVE = 0xffffffff80242003;
enum WU_E_UH_DOESNOTSUPPORTACTION = 0xffffffff80242004;
enum WU_E_UH_WRONGHANDLER = 0xffffffff80242005;
enum WU_E_UH_INVALIDMETADATA = 0xffffffff80242006;
enum WU_E_UH_INSTALLERHUNG = 0xffffffff80242007;
enum WU_E_UH_OPERATIONCANCELLED = 0xffffffff80242008;
enum WU_E_UH_BADHANDLERXML = 0xffffffff80242009;
enum WU_E_UH_CANREQUIREINPUT = 0xffffffff8024200a;
enum WU_E_UH_INSTALLERFAILURE = 0xffffffff8024200b;
enum WU_E_UH_FALLBACKTOSELFCONTAINED = 0xffffffff8024200c;
enum WU_E_UH_NEEDANOTHERDOWNLOAD = 0xffffffff8024200d;
enum WU_E_UH_NOTIFYFAILURE = 0xffffffff8024200e;
enum WU_E_UH_INCONSISTENT_FILE_NAMES = 0xffffffff8024200f;
enum WU_E_UH_FALLBACKERROR = 0xffffffff80242010;
enum WU_E_UH_TOOMANYDOWNLOADREQUESTS = 0xffffffff80242011;
enum WU_E_UH_UNEXPECTEDCBSRESPONSE = 0xffffffff80242012;
enum WU_E_UH_BADCBSPACKAGEID = 0xffffffff80242013;
enum WU_E_UH_POSTREBOOTSTILLPENDING = 0xffffffff80242014;
enum WU_E_UH_POSTREBOOTRESULTUNKNOWN = 0xffffffff80242015;
enum WU_E_UH_POSTREBOOTUNEXPECTEDSTATE = 0xffffffff80242016;
enum WU_E_UH_NEW_SERVICING_STACK_REQUIRED = 0xffffffff80242017;
enum WU_E_UH_CALLED_BACK_FAILURE = 0xffffffff80242018;
enum WU_E_UH_CUSTOMINSTALLER_INVALID_SIGNATURE = 0xffffffff80242019;
enum WU_E_UH_UNSUPPORTED_INSTALLCONTEXT = 0xffffffff8024201a;
enum WU_E_UH_INVALID_TARGETSESSION = 0xffffffff8024201b;
enum WU_E_UH_DECRYPTFAILURE = 0xffffffff8024201c;
enum WU_E_UH_HANDLER_DISABLEDUNTILREBOOT = 0xffffffff8024201d;
enum WU_E_UH_APPX_NOT_PRESENT = 0xffffffff8024201e;
enum WU_E_UH_NOTREADYTOCOMMIT = 0xffffffff8024201f;
enum WU_E_UH_APPX_INVALID_PACKAGE_VOLUME = 0xffffffff80242020;
enum WU_E_UH_APPX_DEFAULT_PACKAGE_VOLUME_UNAVAILABLE = 0xffffffff80242021;
enum WU_E_UH_APPX_INSTALLED_PACKAGE_VOLUME_UNAVAILABLE = 0xffffffff80242022;
enum WU_E_UH_APPX_PACKAGE_FAMILY_NOT_FOUND = 0xffffffff80242023;
enum WU_E_UH_APPX_SYSTEM_VOLUME_NOT_FOUND = 0xffffffff80242024;
enum WU_E_UH_UNEXPECTED = 0xffffffff80242fff;
enum WU_E_DM_URLNOTAVAILABLE = 0xffffffff80246001;
enum WU_E_DM_INCORRECTFILEHASH = 0xffffffff80246002;
enum WU_E_DM_UNKNOWNALGORITHM = 0xffffffff80246003;
enum WU_E_DM_NEEDDOWNLOADREQUEST = 0xffffffff80246004;
enum WU_E_DM_NONETWORK = 0xffffffff80246005;
enum WU_E_DM_WRONGBITSVERSION = 0xffffffff80246006;
enum WU_E_DM_NOTDOWNLOADED = 0xffffffff80246007;
enum WU_E_DM_FAILTOCONNECTTOBITS = 0xffffffff80246008;
enum WU_E_DM_BITSTRANSFERERROR = 0xffffffff80246009;
enum WU_E_DM_DOWNLOADLOCATIONCHANGED = 0xffffffff8024600a;
enum WU_E_DM_CONTENTCHANGED = 0xffffffff8024600b;
enum WU_E_DM_DOWNLOADLIMITEDBYUPDATESIZE = 0xffffffff8024600c;
enum WU_E_DM_UNAUTHORIZED = 0xffffffff8024600e;
enum WU_E_DM_BG_ERROR_TOKEN_REQUIRED = 0xffffffff8024600f;
enum WU_E_DM_DOWNLOADSANDBOXNOTFOUND = 0xffffffff80246010;
enum WU_E_DM_DOWNLOADFILEPATHUNKNOWN = 0xffffffff80246011;
enum WU_E_DM_DOWNLOADFILEMISSING = 0xffffffff80246012;
enum WU_E_DM_UPDATEREMOVED = 0xffffffff80246013;
enum WU_E_DM_READRANGEFAILED = 0xffffffff80246014;
enum WU_E_DM_UNAUTHORIZED_NO_USER = 0xffffffff80246016;
enum WU_E_DM_UNAUTHORIZED_LOCAL_USER = 0xffffffff80246017;
enum WU_E_DM_UNAUTHORIZED_DOMAIN_USER = 0xffffffff80246018;
enum WU_E_DM_UNAUTHORIZED_MSA_USER = 0xffffffff80246019;
enum WU_E_DM_FALLINGBACKTOBITS = 0xffffffff8024601a;
enum WU_E_DM_DOWNLOAD_VOLUME_CONFLICT = 0xffffffff8024601b;
enum WU_E_DM_SANDBOX_HASH_MISMATCH = 0xffffffff8024601c;
enum WU_E_DM_HARDRESERVEID_CONFLICT = 0xffffffff8024601d;
enum WU_E_DM_DOSVC_REQUIRED = 0xffffffff8024601e;
enum WU_E_DM_UNEXPECTED = 0xffffffff80246fff;
enum WU_E_SETUP_INVALID_INFDATA = 0xffffffff8024d001;
enum WU_E_SETUP_INVALID_IDENTDATA = 0xffffffff8024d002;
enum WU_E_SETUP_ALREADY_INITIALIZED = 0xffffffff8024d003;
enum WU_E_SETUP_NOT_INITIALIZED = 0xffffffff8024d004;
enum WU_E_SETUP_SOURCE_VERSION_MISMATCH = 0xffffffff8024d005;
enum WU_E_SETUP_TARGET_VERSION_GREATER = 0xffffffff8024d006;
enum WU_E_SETUP_REGISTRATION_FAILED = 0xffffffff8024d007;
enum WU_E_SELFUPDATE_SKIP_ON_FAILURE = 0xffffffff8024d008;
enum WU_E_SETUP_SKIP_UPDATE = 0xffffffff8024d009;
enum WU_E_SETUP_UNSUPPORTED_CONFIGURATION = 0xffffffff8024d00a;
enum WU_E_SETUP_BLOCKED_CONFIGURATION = 0xffffffff8024d00b;
enum WU_E_SETUP_REBOOT_TO_FIX = 0xffffffff8024d00c;
enum WU_E_SETUP_ALREADYRUNNING = 0xffffffff8024d00d;
enum WU_E_SETUP_REBOOTREQUIRED = 0xffffffff8024d00e;
enum WU_E_SETUP_HANDLER_EXEC_FAILURE = 0xffffffff8024d00f;
enum WU_E_SETUP_INVALID_REGISTRY_DATA = 0xffffffff8024d010;
enum WU_E_SELFUPDATE_REQUIRED = 0xffffffff8024d011;
enum WU_E_SELFUPDATE_REQUIRED_ADMIN = 0xffffffff8024d012;
enum WU_E_SETUP_WRONG_SERVER_VERSION = 0xffffffff8024d013;
enum WU_E_SETUP_DEFERRABLE_REBOOT_PENDING = 0xffffffff8024d014;
enum WU_E_SETUP_NON_DEFERRABLE_REBOOT_PENDING = 0xffffffff8024d015;
enum WU_E_SETUP_FAIL = 0xffffffff8024d016;
enum WU_E_SETUP_UNEXPECTED = 0xffffffff8024dfff;
enum WU_E_EE_UNKNOWN_EXPRESSION = 0xffffffff8024e001;
enum WU_E_EE_INVALID_EXPRESSION = 0xffffffff8024e002;
enum WU_E_EE_MISSING_METADATA = 0xffffffff8024e003;
enum WU_E_EE_INVALID_VERSION = 0xffffffff8024e004;
enum WU_E_EE_NOT_INITIALIZED = 0xffffffff8024e005;
enum WU_E_EE_INVALID_ATTRIBUTEDATA = 0xffffffff8024e006;
enum WU_E_EE_CLUSTER_ERROR = 0xffffffff8024e007;
enum WU_E_EE_UNEXPECTED = 0xffffffff8024efff;
enum WU_E_INSTALLATION_RESULTS_UNKNOWN_VERSION = 0xffffffff80243001;
enum WU_E_INSTALLATION_RESULTS_INVALID_DATA = 0xffffffff80243002;
enum WU_E_INSTALLATION_RESULTS_NOT_FOUND = 0xffffffff80243003;
enum WU_E_TRAYICON_FAILURE = 0xffffffff80243004;
enum WU_E_NON_UI_MODE = 0xffffffff80243ffd;
enum WU_E_WUCLTUI_UNSUPPORTED_VERSION = 0xffffffff80243ffe;
enum WU_E_AUCLIENT_UNEXPECTED = 0xffffffff80243fff;
enum WU_E_REPORTER_EVENTCACHECORRUPT = 0xffffffff8024f001;
enum WU_E_REPORTER_EVENTNAMESPACEPARSEFAILED = 0xffffffff8024f002;
enum WU_E_INVALID_EVENT = 0xffffffff8024f003;
enum WU_E_SERVER_BUSY = 0xffffffff8024f004;
enum WU_E_CALLBACK_COOKIE_NOT_FOUND = 0xffffffff8024f005;
enum WU_E_REPORTER_UNEXPECTED = 0xffffffff8024ffff;
enum WU_E_OL_INVALID_SCANFILE = 0xffffffff80247001;
enum WU_E_OL_NEWCLIENT_REQUIRED = 0xffffffff80247002;
enum WU_E_INVALID_EVENT_PAYLOAD = 0xffffffff80247003;
enum WU_E_INVALID_EVENT_PAYLOADSIZE = 0xffffffff80247004;
enum WU_E_SERVICE_NOT_REGISTERED = 0xffffffff80247005;
enum WU_E_OL_UNEXPECTED = 0xffffffff80247fff;
enum WU_E_METADATA_NOOP = 0xffffffff80247100;
enum WU_E_METADATA_CONFIG_INVALID_BINARY_ENCODING = 0xffffffff80247101;
enum WU_E_METADATA_FETCH_CONFIG = 0xffffffff80247102;
enum WU_E_METADATA_INVALID_PARAMETER = 0xffffffff80247104;
enum WU_E_METADATA_UNEXPECTED = 0xffffffff80247105;
enum WU_E_METADATA_NO_VERIFICATION_DATA = 0xffffffff80247106;
enum WU_E_METADATA_BAD_FRAGMENTSIGNING_CONFIG = 0xffffffff80247107;
enum WU_E_METADATA_FAILURE_PROCESSING_FRAGMENTSIGNING_CONFIG = 0xffffffff80247108;
enum WU_E_METADATA_XML_MISSING = 0xffffffff80247120;
enum WU_E_METADATA_XML_FRAGMENTSIGNING_MISSING = 0xffffffff80247121;
enum WU_E_METADATA_XML_MODE_MISSING = 0xffffffff80247122;
enum WU_E_METADATA_XML_MODE_INVALID = 0xffffffff80247123;
enum WU_E_METADATA_XML_VALIDITY_INVALID = 0xffffffff80247124;
enum WU_E_METADATA_XML_LEAFCERT_MISSING = 0xffffffff80247125;
enum WU_E_METADATA_XML_INTERMEDIATECERT_MISSING = 0xffffffff80247126;
enum WU_E_METADATA_XML_LEAFCERT_ID_MISSING = 0xffffffff80247127;
enum WU_E_METADATA_XML_BASE64CERDATA_MISSING = 0xffffffff80247128;
enum WU_E_METADATA_BAD_SIGNATURE = 0xffffffff80247140;
enum WU_E_METADATA_UNSUPPORTED_HASH_ALG = 0xffffffff80247141;
enum WU_E_METADATA_SIGNATURE_VERIFY_FAILED = 0xffffffff80247142;
enum WU_E_METADATATRUST_CERTIFICATECHAIN_VERIFICATION = 0xffffffff80247150;
enum WU_E_METADATATRUST_UNTRUSTED_CERTIFICATECHAIN = 0xffffffff80247151;
enum WU_E_METADATA_TIMESTAMP_TOKEN_MISSING = 0xffffffff80247160;
enum WU_E_METADATA_TIMESTAMP_TOKEN_VERIFICATION_FAILED = 0xffffffff80247161;
enum WU_E_METADATA_TIMESTAMP_TOKEN_UNTRUSTED = 0xffffffff80247162;
enum WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITY_WINDOW = 0xffffffff80247163;
enum WU_E_METADATA_TIMESTAMP_TOKEN_SIGNATURE = 0xffffffff80247164;
enum WU_E_METADATA_TIMESTAMP_TOKEN_CERTCHAIN = 0xffffffff80247165;
enum WU_E_METADATA_TIMESTAMP_TOKEN_REFRESHONLINE = 0xffffffff80247166;
enum WU_E_METADATA_TIMESTAMP_TOKEN_ALL_BAD = 0xffffffff80247167;
enum WU_E_METADATA_TIMESTAMP_TOKEN_NODATA = 0xffffffff80247168;
enum WU_E_METADATA_TIMESTAMP_TOKEN_CACHELOOKUP = 0xffffffff80247169;
enum WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITYWINDOW_UNEXPECTED = 0xffffffff8024717e;
enum WU_E_METADATA_TIMESTAMP_TOKEN_UNEXPECTED = 0xffffffff8024717f;
enum WU_E_METADATA_CERT_MISSING = 0xffffffff80247180;
enum WU_E_METADATA_LEAFCERT_BAD_TRANSPORT_ENCODING = 0xffffffff80247181;
enum WU_E_METADATA_INTCERT_BAD_TRANSPORT_ENCODING = 0xffffffff80247182;
enum WU_E_METADATA_CERT_UNTRUSTED = 0xffffffff80247183;
enum WU_E_WUTASK_INPROGRESS = 0xffffffff8024b001;
enum WU_E_WUTASK_STATUS_DISABLED = 0xffffffff8024b002;
enum WU_E_WUTASK_NOT_STARTED = 0xffffffff8024b003;
enum WU_E_WUTASK_RETRY = 0xffffffff8024b004;
enum WU_E_WUTASK_CANCELINSTALL_DISALLOWED = 0xffffffff8024b005;
enum WU_E_UNKNOWN_HARDWARECAPABILITY = 0xffffffff8024b101;
enum WU_E_BAD_XML_HARDWARECAPABILITY = 0xffffffff8024b102;
enum WU_E_WMI_NOT_SUPPORTED = 0xffffffff8024b103;
enum WU_E_UPDATE_MERGE_NOT_ALLOWED = 0xffffffff8024b104;
enum WU_E_SKIPPED_UPDATE_INSTALLATION = 0xffffffff8024b105;
enum WU_E_SLS_INVALID_REVISION = 0xffffffff8024b201;
enum WU_E_FILETRUST_DUALSIGNATURE_RSA = 0xffffffff8024b301;
enum WU_E_FILETRUST_DUALSIGNATURE_ECC = 0xffffffff8024b302;
enum WU_E_TRUST_SUBJECT_NOT_TRUSTED = 0xffffffff8024b303;
enum WU_E_TRUST_PROVIDER_UNKNOWN = 0xffffffff8024b304;
alias AutomaticUpdatesNotificationLevel = int;
enum : int
{
    aunlNotConfigured            = 0x00000000,
    aunlDisabled                 = 0x00000001,
    aunlNotifyBeforeDownload     = 0x00000002,
    aunlNotifyBeforeInstallation = 0x00000003,
    aunlScheduledInstallation    = 0x00000004,
}

alias AutomaticUpdatesScheduledInstallationDay = int;
enum : int
{
    ausidEveryDay       = 0x00000000,
    ausidEverySunday    = 0x00000001,
    ausidEveryMonday    = 0x00000002,
    ausidEveryTuesday   = 0x00000003,
    ausidEveryWednesday = 0x00000004,
    ausidEveryThursday  = 0x00000005,
    ausidEveryFriday    = 0x00000006,
    ausidEverySaturday  = 0x00000007,
}

alias DownloadPhase = int;
enum : int
{
    dphInitializing = 0x00000001,
    dphDownloading  = 0x00000002,
    dphVerifying    = 0x00000003,
}

alias DownloadPriority = int;
enum : int
{
    dpLow       = 0x00000001,
    dpNormal    = 0x00000002,
    dpHigh      = 0x00000003,
    dpExtraHigh = 0x00000004,
}

alias AutoSelectionMode = int;
enum : int
{
    asLetWindowsUpdateDecide = 0x00000000,
    asAutoSelectIfDownloaded = 0x00000001,
    asNeverAutoSelect        = 0x00000002,
    asAlwaysAutoSelect       = 0x00000003,
}

alias AutoDownloadMode = int;
enum : int
{
    adLetWindowsUpdateDecide = 0x00000000,
    adNeverAutoDownload      = 0x00000001,
    adAlwaysAutoDownload     = 0x00000002,
}

alias InstallationImpact = int;
enum : int
{
    iiNormal                    = 0x00000000,
    iiMinor                     = 0x00000001,
    iiRequiresExclusiveHandling = 0x00000002,
}

alias InstallationRebootBehavior = int;
enum : int
{
    irbNeverReboots         = 0x00000000,
    irbAlwaysRequiresReboot = 0x00000001,
    irbCanRequestReboot     = 0x00000002,
}

alias OperationResultCode = int;
enum : int
{
    orcNotStarted          = 0x00000000,
    orcInProgress          = 0x00000001,
    orcSucceeded           = 0x00000002,
    orcSucceededWithErrors = 0x00000003,
    orcFailed              = 0x00000004,
    orcAborted             = 0x00000005,
}

alias ServerSelection = int;
enum : int
{
    ssDefault       = 0x00000000,
    ssManagedServer = 0x00000001,
    ssWindowsUpdate = 0x00000002,
    ssOthers        = 0x00000003,
}

alias UpdateType = int;
enum : int
{
    utSoftware = 0x00000001,
    utDriver   = 0x00000002,
}

alias UpdateOperation = int;
enum : int
{
    uoInstallation   = 0x00000001,
    uoUninstallation = 0x00000002,
}

alias DeploymentAction = int;
enum : int
{
    daNone                 = 0x00000000,
    daInstallation         = 0x00000001,
    daUninstallation       = 0x00000002,
    daDetection            = 0x00000003,
    daOptionalInstallation = 0x00000004,
}

alias UpdateExceptionContext = int;
enum : int
{
    uecGeneral          = 0x00000001,
    uecWindowsDriver    = 0x00000002,
    uecWindowsInstaller = 0x00000003,
    uecSearchIncomplete = 0x00000004,
}

alias AutomaticUpdatesUserType = int;
enum : int
{
    auutCurrentUser        = 0x00000001,
    auutLocalAdministrator = 0x00000002,
}

alias AutomaticUpdatesPermissionType = int;
enum : int
{
    auptSetNotificationLevel         = 0x00000001,
    auptDisableAutomaticUpdates      = 0x00000002,
    auptSetIncludeRecommendedUpdates = 0x00000003,
    auptSetFeaturedUpdatesEnabled    = 0x00000004,
    auptSetNonAdministratorsElevated = 0x00000005,
}

alias UpdateServiceRegistrationState = int;
enum : int
{
    usrsNotRegistered       = 0x00000001,
    usrsRegistrationPending = 0x00000002,
    usrsRegistered          = 0x00000003,
}

alias SearchScope = int;
enum : int
{
    searchScopeDefault               = 0x00000000,
    searchScopeMachineOnly           = 0x00000001,
    searchScopeCurrentUserOnly       = 0x00000002,
    searchScopeMachineAndCurrentUser = 0x00000003,
    searchScopeMachineAndAllUsers    = 0x00000004,
    searchScopeAllUsers              = 0x00000005,
}

enum IID_IUpdateLockdown = GUID(0xa976c28d, 0x75a1, 0x42aa, [0x94, 0xae, 0x8a, 0xf8, 0xb8, 0x72, 0x8, 0x9a]);
interface IUpdateLockdown : IUnknown
{
    HRESULT LockDown(int);
}
enum IID_IStringCollection = GUID(0xeff90582, 0x2ddc, 0x480f, [0xa0, 0x6d, 0x60, 0xf3, 0xfb, 0xc3, 0x62, 0xc3]);
interface IStringCollection : IDispatch
{
    HRESULT get_Item(int, BSTR*);
    HRESULT put_Item(int, BSTR);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
    HRESULT get_ReadOnly(VARIANT_BOOL*);
    HRESULT Add(BSTR, int*);
    HRESULT Clear();
    HRESULT Copy(IStringCollection*);
    HRESULT Insert(int, BSTR);
    HRESULT RemoveAt(int);
}
enum IID_IWebProxy = GUID(0x174c81fe, 0xaecd, 0x4dae, [0xb8, 0xa0, 0x2c, 0x63, 0x18, 0xdd, 0x86, 0xa8]);
interface IWebProxy : IDispatch
{
    HRESULT get_Address(BSTR*);
    HRESULT put_Address(BSTR);
    HRESULT get_BypassList(IStringCollection*);
    HRESULT put_BypassList(IStringCollection);
    HRESULT get_BypassProxyOnLocal(VARIANT_BOOL*);
    HRESULT put_BypassProxyOnLocal(VARIANT_BOOL);
    HRESULT get_ReadOnly(VARIANT_BOOL*);
    HRESULT get_UserName(BSTR*);
    HRESULT put_UserName(BSTR);
    HRESULT SetPassword(BSTR);
    HRESULT PromptForCredentials(IUnknown, BSTR);
    HRESULT PromptForCredentialsFromHwnd(HWND, BSTR);
    HRESULT get_AutoDetect(VARIANT_BOOL*);
    HRESULT put_AutoDetect(VARIANT_BOOL);
}
enum IID_ISystemInformation = GUID(0xade87bf7, 0x7b56, 0x4275, [0x8f, 0xab, 0xb9, 0xb0, 0xe5, 0x91, 0x84, 0x4b]);
interface ISystemInformation : IDispatch
{
    HRESULT get_OemHardwareSupportLink(BSTR*);
    HRESULT get_RebootRequired(VARIANT_BOOL*);
}
enum IID_IWindowsUpdateAgentInfo = GUID(0x85713fa1, 0x7796, 0x4fa2, [0xbe, 0x3b, 0xe2, 0xd6, 0x12, 0x4d, 0xd3, 0x73]);
interface IWindowsUpdateAgentInfo : IDispatch
{
    HRESULT GetInfo(VARIANT, VARIANT*);
}
enum IID_IAutomaticUpdatesResults = GUID(0xe7a4d634, 0x7942, 0x4dd9, [0xa1, 0x11, 0x82, 0x22, 0x8b, 0xa3, 0x39, 0x1]);
interface IAutomaticUpdatesResults : IDispatch
{
    HRESULT get_LastSearchSuccessDate(VARIANT*);
    HRESULT get_LastInstallationSuccessDate(VARIANT*);
}
enum IID_IAutomaticUpdatesSettings = GUID(0x2ee48f22, 0xaf3c, 0x405f, [0x89, 0x70, 0xf7, 0x1b, 0xe1, 0x2e, 0xe9, 0xa2]);
interface IAutomaticUpdatesSettings : IDispatch
{
    HRESULT get_NotificationLevel(AutomaticUpdatesNotificationLevel*);
    HRESULT put_NotificationLevel(AutomaticUpdatesNotificationLevel);
    HRESULT get_ReadOnly(VARIANT_BOOL*);
    HRESULT get_Required(VARIANT_BOOL*);
    HRESULT get_ScheduledInstallationDay(AutomaticUpdatesScheduledInstallationDay*);
    HRESULT put_ScheduledInstallationDay(AutomaticUpdatesScheduledInstallationDay);
    HRESULT get_ScheduledInstallationTime(int*);
    HRESULT put_ScheduledInstallationTime(int);
    HRESULT Refresh();
    HRESULT Save();
}
enum IID_IAutomaticUpdatesSettings2 = GUID(0x6abc136a, 0xc3ca, 0x4384, [0x81, 0x71, 0xcb, 0x2b, 0x1e, 0x59, 0xb8, 0xdc]);
interface IAutomaticUpdatesSettings2 : IAutomaticUpdatesSettings
{
    HRESULT get_IncludeRecommendedUpdates(VARIANT_BOOL*);
    HRESULT put_IncludeRecommendedUpdates(VARIANT_BOOL);
    HRESULT CheckPermission(AutomaticUpdatesUserType, AutomaticUpdatesPermissionType, VARIANT_BOOL*);
}
enum IID_IAutomaticUpdatesSettings3 = GUID(0xb587f5c3, 0xf57e, 0x485f, [0xbb, 0xf5, 0xd, 0x18, 0x1c, 0x5c, 0xd0, 0xdc]);
interface IAutomaticUpdatesSettings3 : IAutomaticUpdatesSettings2
{
    HRESULT get_NonAdministratorsElevated(VARIANT_BOOL*);
    HRESULT put_NonAdministratorsElevated(VARIANT_BOOL);
    HRESULT get_FeaturedUpdatesEnabled(VARIANT_BOOL*);
    HRESULT put_FeaturedUpdatesEnabled(VARIANT_BOOL);
}
enum IID_IAutomaticUpdates = GUID(0x673425bf, 0xc082, 0x4c7c, [0xbd, 0xfd, 0x56, 0x94, 0x64, 0xb8, 0xe0, 0xce]);
interface IAutomaticUpdates : IDispatch
{
    HRESULT DetectNow();
    HRESULT Pause();
    HRESULT Resume();
    HRESULT ShowSettingsDialog();
    HRESULT get_Settings(IAutomaticUpdatesSettings*);
    HRESULT get_ServiceEnabled(VARIANT_BOOL*);
    HRESULT EnableService();
}
enum IID_IAutomaticUpdates2 = GUID(0x4a2f5c31, 0xcfd9, 0x410e, [0xb7, 0xfb, 0x29, 0xa6, 0x53, 0x97, 0x3a, 0xf]);
interface IAutomaticUpdates2 : IAutomaticUpdates
{
    HRESULT get_Results(IAutomaticUpdatesResults*);
}
enum IID_IUpdateIdentity = GUID(0x46297823, 0x9940, 0x4c09, [0xae, 0xd9, 0xcd, 0x3e, 0xa6, 0xd0, 0x59, 0x68]);
interface IUpdateIdentity : IDispatch
{
    HRESULT get_RevisionNumber(int*);
    HRESULT get_UpdateID(BSTR*);
}
enum IID_IImageInformation = GUID(0x7c907864, 0x346c, 0x4aeb, [0x8f, 0x3f, 0x57, 0xda, 0x28, 0x9f, 0x96, 0x9f]);
interface IImageInformation : IDispatch
{
    HRESULT get_AltText(BSTR*);
    HRESULT get_Height(int*);
    HRESULT get_Source(BSTR*);
    HRESULT get_Width(int*);
}
enum IID_ICategory = GUID(0x81ddc1b8, 0x9d35, 0x47a6, [0xb4, 0x71, 0x5b, 0x80, 0xf5, 0x19, 0x22, 0x3b]);
interface ICategory : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_CategoryID(BSTR*);
    HRESULT get_Children(ICategoryCollection*);
    HRESULT get_Description(BSTR*);
    HRESULT get_Image(IImageInformation*);
    HRESULT get_Order(int*);
    HRESULT get_Parent(ICategory*);
    HRESULT get_Type(BSTR*);
    HRESULT get_Updates(IUpdateCollection*);
}
enum IID_ICategoryCollection = GUID(0x3a56bfb8, 0x576c, 0x43f7, [0x93, 0x35, 0xfe, 0x48, 0x38, 0xfd, 0x7e, 0x37]);
interface ICategoryCollection : IDispatch
{
    HRESULT get_Item(int, ICategory*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_IInstallationBehavior = GUID(0xd9a59339, 0xe245, 0x4dbd, [0x96, 0x86, 0x4d, 0x57, 0x63, 0xe3, 0x96, 0x24]);
interface IInstallationBehavior : IDispatch
{
    HRESULT get_CanRequestUserInput(VARIANT_BOOL*);
    HRESULT get_Impact(InstallationImpact*);
    HRESULT get_RebootBehavior(InstallationRebootBehavior*);
    HRESULT get_RequiresNetworkConnectivity(VARIANT_BOOL*);
}
enum IID_IUpdateDownloadContent = GUID(0x54a2cb2d, 0x9a0c, 0x48b6, [0x8a, 0x50, 0x9a, 0xbb, 0x69, 0xee, 0x2d, 0x2]);
interface IUpdateDownloadContent : IDispatch
{
    HRESULT get_DownloadUrl(BSTR*);
}
enum IID_IUpdateDownloadContent2 = GUID(0xc97ad11b, 0xf257, 0x420b, [0x9d, 0x9f, 0x37, 0x7f, 0x73, 0x3f, 0x6f, 0x68]);
interface IUpdateDownloadContent2 : IUpdateDownloadContent
{
    HRESULT get_IsDeltaCompressedContent(VARIANT_BOOL*);
}
enum IID_IUpdateDownloadContentCollection = GUID(0xbc5513c8, 0xb3b8, 0x4bf7, [0xa4, 0xd4, 0x36, 0x1c, 0xd, 0x8c, 0x88, 0xba]);
interface IUpdateDownloadContentCollection : IDispatch
{
    HRESULT get_Item(int, IUpdateDownloadContent*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_IUpdate = GUID(0x6a92b07a, 0xd821, 0x4682, [0xb4, 0x23, 0x5c, 0x80, 0x50, 0x22, 0xcc, 0x4d]);
interface IUpdate : IDispatch
{
    HRESULT get_Title(BSTR*);
    HRESULT get_AutoSelectOnWebSites(VARIANT_BOOL*);
    HRESULT get_BundledUpdates(IUpdateCollection*);
    HRESULT get_CanRequireSource(VARIANT_BOOL*);
    HRESULT get_Categories(ICategoryCollection*);
    HRESULT get_Deadline(VARIANT*);
    HRESULT get_DeltaCompressedContentAvailable(VARIANT_BOOL*);
    HRESULT get_DeltaCompressedContentPreferred(VARIANT_BOOL*);
    HRESULT get_Description(BSTR*);
    HRESULT get_EulaAccepted(VARIANT_BOOL*);
    HRESULT get_EulaText(BSTR*);
    HRESULT get_HandlerID(BSTR*);
    HRESULT get_Identity(IUpdateIdentity*);
    HRESULT get_Image(IImageInformation*);
    HRESULT get_InstallationBehavior(IInstallationBehavior*);
    HRESULT get_IsBeta(VARIANT_BOOL*);
    HRESULT get_IsDownloaded(VARIANT_BOOL*);
    HRESULT get_IsHidden(VARIANT_BOOL*);
    HRESULT put_IsHidden(VARIANT_BOOL);
    HRESULT get_IsInstalled(VARIANT_BOOL*);
    HRESULT get_IsMandatory(VARIANT_BOOL*);
    HRESULT get_IsUninstallable(VARIANT_BOOL*);
    HRESULT get_Languages(IStringCollection*);
    HRESULT get_LastDeploymentChangeTime(double*);
    HRESULT get_MaxDownloadSize(DECIMAL*);
    HRESULT get_MinDownloadSize(DECIMAL*);
    HRESULT get_MoreInfoUrls(IStringCollection*);
    HRESULT get_MsrcSeverity(BSTR*);
    HRESULT get_RecommendedCpuSpeed(int*);
    HRESULT get_RecommendedHardDiskSpace(int*);
    HRESULT get_RecommendedMemory(int*);
    HRESULT get_ReleaseNotes(BSTR*);
    HRESULT get_SecurityBulletinIDs(IStringCollection*);
    HRESULT get_SupersededUpdateIDs(IStringCollection*);
    HRESULT get_SupportUrl(BSTR*);
    HRESULT get_Type(UpdateType*);
    HRESULT get_UninstallationNotes(BSTR*);
    HRESULT get_UninstallationBehavior(IInstallationBehavior*);
    HRESULT get_UninstallationSteps(IStringCollection*);
    HRESULT get_KBArticleIDs(IStringCollection*);
    HRESULT AcceptEula();
    HRESULT get_DeploymentAction(DeploymentAction*);
    HRESULT CopyFromCache(BSTR, VARIANT_BOOL);
    HRESULT get_DownloadPriority(DownloadPriority*);
    HRESULT get_DownloadContents(IUpdateDownloadContentCollection*);
}
enum IID_IWindowsDriverUpdate = GUID(0xb383cd1a, 0x5ce9, 0x4504, [0x9f, 0x63, 0x76, 0x4b, 0x12, 0x36, 0xf1, 0x91]);
interface IWindowsDriverUpdate : IUpdate
{
    HRESULT get_DriverClass(BSTR*);
    HRESULT get_DriverHardwareID(BSTR*);
    HRESULT get_DriverManufacturer(BSTR*);
    HRESULT get_DriverModel(BSTR*);
    HRESULT get_DriverProvider(BSTR*);
    HRESULT get_DriverVerDate(double*);
    HRESULT get_DeviceProblemNumber(int*);
    HRESULT get_DeviceStatus(int*);
}
enum IID_IUpdate2 = GUID(0x144fe9b0, 0xd23d, 0x4a8b, [0x86, 0x34, 0xfb, 0x44, 0x57, 0x53, 0x3b, 0x7a]);
interface IUpdate2 : IUpdate
{
    HRESULT get_RebootRequired(VARIANT_BOOL*);
    HRESULT get_IsPresent(VARIANT_BOOL*);
    HRESULT get_CveIDs(IStringCollection*);
    HRESULT CopyToCache(IStringCollection);
}
enum IID_IUpdate3 = GUID(0x112eda6b, 0x95b3, 0x476f, [0x9d, 0x90, 0xae, 0xe8, 0x2c, 0x6b, 0x81, 0x81]);
interface IUpdate3 : IUpdate2
{
    HRESULT get_BrowseOnly(VARIANT_BOOL*);
}
enum IID_IUpdate4 = GUID(0x27e94b0d, 0x5139, 0x49a2, [0x9a, 0x61, 0x93, 0x52, 0x2d, 0xc5, 0x46, 0x52]);
interface IUpdate4 : IUpdate3
{
    HRESULT get_PerUser(VARIANT_BOOL*);
}
enum IID_IUpdate5 = GUID(0xc1c2f21a, 0xd2f4, 0x4902, [0xb5, 0xc6, 0x8a, 0x8, 0x1c, 0x19, 0xa8, 0x90]);
interface IUpdate5 : IUpdate4
{
    HRESULT get_AutoSelection(AutoSelectionMode*);
    HRESULT get_AutoDownload(AutoDownloadMode*);
}
enum IID_IWindowsDriverUpdate2 = GUID(0x615c4269, 0x7a48, 0x43bd, [0x96, 0xb7, 0xbf, 0x6c, 0xa2, 0x7d, 0x6c, 0x3e]);
interface IWindowsDriverUpdate2 : IWindowsDriverUpdate
{
    HRESULT get_RebootRequired(VARIANT_BOOL*);
    HRESULT get_IsPresent(VARIANT_BOOL*);
    HRESULT get_CveIDs(IStringCollection*);
    HRESULT CopyToCache(IStringCollection);
}
enum IID_IWindowsDriverUpdate3 = GUID(0x49ebd502, 0x4a96, 0x41bd, [0x9e, 0x3e, 0x4c, 0x50, 0x57, 0xf4, 0x25, 0xc]);
interface IWindowsDriverUpdate3 : IWindowsDriverUpdate2
{
    HRESULT get_BrowseOnly(VARIANT_BOOL*);
}
enum IID_IWindowsDriverUpdateEntry = GUID(0xed8bfe40, 0xa60b, 0x42ea, [0x96, 0x52, 0x81, 0x7d, 0xfc, 0xfa, 0x23, 0xec]);
interface IWindowsDriverUpdateEntry : IDispatch
{
    HRESULT get_DriverClass(BSTR*);
    HRESULT get_DriverHardwareID(BSTR*);
    HRESULT get_DriverManufacturer(BSTR*);
    HRESULT get_DriverModel(BSTR*);
    HRESULT get_DriverProvider(BSTR*);
    HRESULT get_DriverVerDate(double*);
    HRESULT get_DeviceProblemNumber(int*);
    HRESULT get_DeviceStatus(int*);
}
enum IID_IWindowsDriverUpdateEntryCollection = GUID(0xd521700, 0xa372, 0x4bef, [0x82, 0x8b, 0x3d, 0x0, 0xc1, 0xa, 0xde, 0xbd]);
interface IWindowsDriverUpdateEntryCollection : IDispatch
{
    HRESULT get_Item(int, IWindowsDriverUpdateEntry*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_IWindowsDriverUpdate4 = GUID(0x4c6a2b, 0xc19, 0x4c69, [0x9f, 0x5c, 0xa2, 0x69, 0xb2, 0x56, 0xd, 0xb9]);
interface IWindowsDriverUpdate4 : IWindowsDriverUpdate3
{
    HRESULT get_WindowsDriverUpdateEntries(IWindowsDriverUpdateEntryCollection*);
    HRESULT get_PerUser(VARIANT_BOOL*);
}
enum IID_IWindowsDriverUpdate5 = GUID(0x70cf5c82, 0x8642, 0x42bb, [0x9d, 0xbc, 0xc, 0xfd, 0x26, 0x3c, 0x6c, 0x4f]);
interface IWindowsDriverUpdate5 : IWindowsDriverUpdate4
{
    HRESULT get_AutoSelection(AutoSelectionMode*);
    HRESULT get_AutoDownload(AutoDownloadMode*);
}
enum IID_IUpdateCollection = GUID(0x7f7438c, 0x7709, 0x4ca5, [0xb5, 0x18, 0x91, 0x27, 0x92, 0x88, 0x13, 0x4e]);
interface IUpdateCollection : IDispatch
{
    HRESULT get_Item(int, IUpdate*);
    HRESULT put_Item(int, IUpdate);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
    HRESULT get_ReadOnly(VARIANT_BOOL*);
    HRESULT Add(IUpdate, int*);
    HRESULT Clear();
    HRESULT Copy(IUpdateCollection*);
    HRESULT Insert(int, IUpdate);
    HRESULT RemoveAt(int);
}
enum IID_IUpdateException = GUID(0xa376dd5e, 0x9d4, 0x427f, [0xaf, 0x7c, 0xfe, 0xd5, 0xb6, 0xe1, 0xc1, 0xd6]);
interface IUpdateException : IDispatch
{
    HRESULT get_Message(BSTR*);
    HRESULT get_HResult(int*);
    HRESULT get_Context(UpdateExceptionContext*);
}
enum IID_IInvalidProductLicenseException = GUID(0xa37d00f5, 0x7bb0, 0x4953, [0xb4, 0x14, 0xf9, 0xe9, 0x83, 0x26, 0xf2, 0xe8]);
interface IInvalidProductLicenseException : IUpdateException
{
    HRESULT get_Product(BSTR*);
}
enum IID_IUpdateExceptionCollection = GUID(0x503626a3, 0x8e14, 0x4729, [0x93, 0x55, 0xf, 0xe6, 0x64, 0xbd, 0x23, 0x21]);
interface IUpdateExceptionCollection : IDispatch
{
    HRESULT get_Item(int, IUpdateException*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_ISearchResult = GUID(0xd40cff62, 0xe08c, 0x4498, [0x94, 0x1a, 0x1, 0xe2, 0x5f, 0xf, 0xd3, 0x3c]);
interface ISearchResult : IDispatch
{
    HRESULT get_ResultCode(OperationResultCode*);
    HRESULT get_RootCategories(ICategoryCollection*);
    HRESULT get_Updates(IUpdateCollection*);
    HRESULT get_Warnings(IUpdateExceptionCollection*);
}
enum IID_ISearchJob = GUID(0x7366ea16, 0x7a1a, 0x4ea2, [0xb0, 0x42, 0x97, 0x3d, 0x3e, 0x9c, 0xd9, 0x9b]);
interface ISearchJob : IDispatch
{
    HRESULT get_AsyncState(VARIANT*);
    HRESULT get_IsCompleted(VARIANT_BOOL*);
    HRESULT CleanUp();
    HRESULT RequestAbort();
}
enum IID_ISearchCompletedCallbackArgs = GUID(0xa700a634, 0x2850, 0x4c47, [0x93, 0x8a, 0x9e, 0x4b, 0x6e, 0x5a, 0xf9, 0xa6]);
interface ISearchCompletedCallbackArgs : IDispatch
{
}
enum IID_ISearchCompletedCallback = GUID(0x88aee058, 0xd4b0, 0x4725, [0xa2, 0xf1, 0x81, 0x4a, 0x67, 0xae, 0x96, 0x4c]);
interface ISearchCompletedCallback : IUnknown
{
    HRESULT Invoke(ISearchJob, ISearchCompletedCallbackArgs);
}
enum IID_IUpdateHistoryEntry = GUID(0xbe56a644, 0xaf0e, 0x4e0e, [0xa3, 0x11, 0xc1, 0xd8, 0xe6, 0x95, 0xcb, 0xff]);
interface IUpdateHistoryEntry : IDispatch
{
    HRESULT get_Operation(UpdateOperation*);
    HRESULT get_ResultCode(OperationResultCode*);
    HRESULT get_HResult(int*);
    HRESULT get_Date(double*);
    HRESULT get_UpdateIdentity(IUpdateIdentity*);
    HRESULT get_Title(BSTR*);
    HRESULT get_Description(BSTR*);
    HRESULT get_UnmappedResultCode(int*);
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT get_ServerSelection(ServerSelection*);
    HRESULT get_ServiceID(BSTR*);
    HRESULT get_UninstallationSteps(IStringCollection*);
    HRESULT get_UninstallationNotes(BSTR*);
    HRESULT get_SupportUrl(BSTR*);
}
enum IID_IUpdateHistoryEntry2 = GUID(0xc2bfb780, 0x4539, 0x4132, [0xab, 0x8c, 0xa, 0x87, 0x72, 0x1, 0x3a, 0xb6]);
interface IUpdateHistoryEntry2 : IUpdateHistoryEntry
{
    HRESULT get_Categories(ICategoryCollection*);
}
enum IID_IUpdateHistoryEntryCollection = GUID(0xa7f04f3c, 0xa290, 0x435b, [0xaa, 0xdf, 0xa1, 0x16, 0xc3, 0x35, 0x7a, 0x5c]);
interface IUpdateHistoryEntryCollection : IDispatch
{
    HRESULT get_Item(int, IUpdateHistoryEntry*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_IUpdateSearcher = GUID(0x8f45abf1, 0xf9ae, 0x4b95, [0xa9, 0x33, 0xf0, 0xf6, 0x6e, 0x50, 0x56, 0xea]);
interface IUpdateSearcher : IDispatch
{
    HRESULT get_CanAutomaticallyUpgradeService(VARIANT_BOOL*);
    HRESULT put_CanAutomaticallyUpgradeService(VARIANT_BOOL);
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT put_ClientApplicationID(BSTR);
    HRESULT get_IncludePotentiallySupersededUpdates(VARIANT_BOOL*);
    HRESULT put_IncludePotentiallySupersededUpdates(VARIANT_BOOL);
    HRESULT get_ServerSelection(ServerSelection*);
    HRESULT put_ServerSelection(ServerSelection);
    HRESULT BeginSearch(BSTR, IUnknown, VARIANT, ISearchJob*);
    HRESULT EndSearch(ISearchJob, ISearchResult*);
    HRESULT EscapeString(BSTR, BSTR*);
    HRESULT QueryHistory(int, int, IUpdateHistoryEntryCollection*);
    HRESULT Search(BSTR, ISearchResult*);
    HRESULT get_Online(VARIANT_BOOL*);
    HRESULT put_Online(VARIANT_BOOL);
    HRESULT GetTotalHistoryCount(int*);
    HRESULT get_ServiceID(BSTR*);
    HRESULT put_ServiceID(BSTR);
}
enum IID_IUpdateSearcher2 = GUID(0x4cbdcb2d, 0x1589, 0x4beb, [0xbd, 0x1c, 0x3e, 0x58, 0x2f, 0xf0, 0xad, 0xd0]);
interface IUpdateSearcher2 : IUpdateSearcher
{
    HRESULT get_IgnoreDownloadPriority(VARIANT_BOOL*);
    HRESULT put_IgnoreDownloadPriority(VARIANT_BOOL);
}
enum IID_IUpdateSearcher3 = GUID(0x4c6895d, 0xeaf2, 0x4034, [0x97, 0xf3, 0x31, 0x1d, 0xe9, 0xbe, 0x41, 0x3a]);
interface IUpdateSearcher3 : IUpdateSearcher2
{
    HRESULT get_SearchScope(SearchScope*);
    HRESULT put_SearchScope(SearchScope);
}
enum IID_IUpdateDownloadResult = GUID(0xbf99af76, 0xb575, 0x42ad, [0x8a, 0xa4, 0x33, 0xcb, 0xb5, 0x47, 0x7a, 0xf1]);
interface IUpdateDownloadResult : IDispatch
{
    HRESULT get_HResult(int*);
    HRESULT get_ResultCode(OperationResultCode*);
}
enum IID_IDownloadResult = GUID(0xdaa4fdd0, 0x4727, 0x4dbe, [0xa1, 0xe7, 0x74, 0x5d, 0xca, 0x31, 0x71, 0x44]);
interface IDownloadResult : IDispatch
{
    HRESULT get_HResult(int*);
    HRESULT get_ResultCode(OperationResultCode*);
    HRESULT GetUpdateResult(int, IUpdateDownloadResult*);
}
enum IID_IDownloadProgress = GUID(0xd31a5bac, 0xf719, 0x4178, [0x9d, 0xbb, 0x5e, 0x2c, 0xb4, 0x7f, 0xd1, 0x8a]);
interface IDownloadProgress : IDispatch
{
    HRESULT get_CurrentUpdateBytesDownloaded(DECIMAL*);
    HRESULT get_CurrentUpdateBytesToDownload(DECIMAL*);
    HRESULT get_CurrentUpdateIndex(int*);
    HRESULT get_PercentComplete(int*);
    HRESULT get_TotalBytesDownloaded(DECIMAL*);
    HRESULT get_TotalBytesToDownload(DECIMAL*);
    HRESULT GetUpdateResult(int, IUpdateDownloadResult*);
    HRESULT get_CurrentUpdateDownloadPhase(DownloadPhase*);
    HRESULT get_CurrentUpdatePercentComplete(int*);
}
enum IID_IDownloadJob = GUID(0xc574de85, 0x7358, 0x43f6, [0xaa, 0xe8, 0x86, 0x97, 0xe6, 0x2d, 0x8b, 0xa7]);
interface IDownloadJob : IDispatch
{
    HRESULT get_AsyncState(VARIANT*);
    HRESULT get_IsCompleted(VARIANT_BOOL*);
    HRESULT get_Updates(IUpdateCollection*);
    HRESULT CleanUp();
    HRESULT GetProgress(IDownloadProgress*);
    HRESULT RequestAbort();
}
enum IID_IDownloadCompletedCallbackArgs = GUID(0xfa565b23, 0x498c, 0x47a0, [0x97, 0x9d, 0xe7, 0xd5, 0xb1, 0x81, 0x33, 0x60]);
interface IDownloadCompletedCallbackArgs : IDispatch
{
}
enum IID_IDownloadCompletedCallback = GUID(0x77254866, 0x9f5b, 0x4c8e, [0xb9, 0xe2, 0xc7, 0x7a, 0x85, 0x30, 0xd6, 0x4b]);
interface IDownloadCompletedCallback : IUnknown
{
    HRESULT Invoke(IDownloadJob, IDownloadCompletedCallbackArgs);
}
enum IID_IDownloadProgressChangedCallbackArgs = GUID(0x324ff2c6, 0x4981, 0x4b04, [0x94, 0x12, 0x57, 0x48, 0x17, 0x45, 0xab, 0x24]);
interface IDownloadProgressChangedCallbackArgs : IDispatch
{
    HRESULT get_Progress(IDownloadProgress*);
}
enum IID_IDownloadProgressChangedCallback = GUID(0x8c3f1cdd, 0x6173, 0x4591, [0xae, 0xbd, 0xa5, 0x6a, 0x53, 0xca, 0x77, 0xc1]);
interface IDownloadProgressChangedCallback : IUnknown
{
    HRESULT Invoke(IDownloadJob, IDownloadProgressChangedCallbackArgs);
}
enum IID_IUpdateDownloader = GUID(0x68f1c6f9, 0x7ecc, 0x4666, [0xa4, 0x64, 0x24, 0x7f, 0xe1, 0x24, 0x96, 0xc3]);
interface IUpdateDownloader : IDispatch
{
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT put_ClientApplicationID(BSTR);
    HRESULT get_IsForced(VARIANT_BOOL*);
    HRESULT put_IsForced(VARIANT_BOOL);
    HRESULT get_Priority(DownloadPriority*);
    HRESULT put_Priority(DownloadPriority);
    HRESULT get_Updates(IUpdateCollection*);
    HRESULT put_Updates(IUpdateCollection);
    HRESULT BeginDownload(IUnknown, IUnknown, VARIANT, IDownloadJob*);
    HRESULT Download(IDownloadResult*);
    HRESULT EndDownload(IDownloadJob, IDownloadResult*);
}
enum IID_IUpdateInstallationResult = GUID(0xd940f0f8, 0x3cbb, 0x4fd0, [0x99, 0x3f, 0x47, 0x1e, 0x7f, 0x23, 0x28, 0xad]);
interface IUpdateInstallationResult : IDispatch
{
    HRESULT get_HResult(int*);
    HRESULT get_RebootRequired(VARIANT_BOOL*);
    HRESULT get_ResultCode(OperationResultCode*);
}
enum IID_IInstallationResult = GUID(0xa43c56d6, 0x7451, 0x48d4, [0xaf, 0x96, 0xb6, 0xcd, 0x2d, 0xd, 0x9b, 0x7a]);
interface IInstallationResult : IDispatch
{
    HRESULT get_HResult(int*);
    HRESULT get_RebootRequired(VARIANT_BOOL*);
    HRESULT get_ResultCode(OperationResultCode*);
    HRESULT GetUpdateResult(int, IUpdateInstallationResult*);
}
enum IID_IInstallationProgress = GUID(0x345c8244, 0x43a3, 0x4e32, [0xa3, 0x68, 0x65, 0xf0, 0x73, 0xb7, 0x6f, 0x36]);
interface IInstallationProgress : IDispatch
{
    HRESULT get_CurrentUpdateIndex(int*);
    HRESULT get_CurrentUpdatePercentComplete(int*);
    HRESULT get_PercentComplete(int*);
    HRESULT GetUpdateResult(int, IUpdateInstallationResult*);
}
enum IID_IInstallationJob = GUID(0x5c209f0b, 0xbad5, 0x432a, [0x95, 0x56, 0x46, 0x99, 0xbe, 0xd2, 0x63, 0x8a]);
interface IInstallationJob : IDispatch
{
    HRESULT get_AsyncState(VARIANT*);
    HRESULT get_IsCompleted(VARIANT_BOOL*);
    HRESULT get_Updates(IUpdateCollection*);
    HRESULT CleanUp();
    HRESULT GetProgress(IInstallationProgress*);
    HRESULT RequestAbort();
}
enum IID_IInstallationCompletedCallbackArgs = GUID(0x250e2106, 0x8efb, 0x4705, [0x96, 0x53, 0xef, 0x13, 0xc5, 0x81, 0xb6, 0xa1]);
interface IInstallationCompletedCallbackArgs : IDispatch
{
}
enum IID_IInstallationCompletedCallback = GUID(0x45f4f6f3, 0xd602, 0x4f98, [0x9a, 0x8a, 0x3e, 0xfa, 0x15, 0x2a, 0xd2, 0xd3]);
interface IInstallationCompletedCallback : IUnknown
{
    HRESULT Invoke(IInstallationJob, IInstallationCompletedCallbackArgs);
}
enum IID_IInstallationProgressChangedCallbackArgs = GUID(0xe4f14e1e, 0x689d, 0x4218, [0xa0, 0xb9, 0xbc, 0x18, 0x9c, 0x48, 0x4a, 0x1]);
interface IInstallationProgressChangedCallbackArgs : IDispatch
{
    HRESULT get_Progress(IInstallationProgress*);
}
enum IID_IInstallationProgressChangedCallback = GUID(0xe01402d5, 0xf8da, 0x43ba, [0xa0, 0x12, 0x38, 0x89, 0x4b, 0xd0, 0x48, 0xf1]);
interface IInstallationProgressChangedCallback : IUnknown
{
    HRESULT Invoke(IInstallationJob, IInstallationProgressChangedCallbackArgs);
}
enum IID_IUpdateInstaller = GUID(0x7b929c68, 0xccdc, 0x4226, [0x96, 0xb1, 0x87, 0x24, 0x60, 0xb, 0x54, 0xc2]);
interface IUpdateInstaller : IDispatch
{
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT put_ClientApplicationID(BSTR);
    HRESULT get_IsForced(VARIANT_BOOL*);
    HRESULT put_IsForced(VARIANT_BOOL);
    HRESULT get_ParentHwnd(HWND*);
    HRESULT put_ParentHwnd(HWND);
    HRESULT put_ParentWindow(IUnknown);
    HRESULT get_ParentWindow(IUnknown*);
    HRESULT get_Updates(IUpdateCollection*);
    HRESULT put_Updates(IUpdateCollection);
    HRESULT BeginInstall(IUnknown, IUnknown, VARIANT, IInstallationJob*);
    HRESULT BeginUninstall(IUnknown, IUnknown, VARIANT, IInstallationJob*);
    HRESULT EndInstall(IInstallationJob, IInstallationResult*);
    HRESULT EndUninstall(IInstallationJob, IInstallationResult*);
    HRESULT Install(IInstallationResult*);
    HRESULT RunWizard(BSTR, IInstallationResult*);
    HRESULT get_IsBusy(VARIANT_BOOL*);
    HRESULT Uninstall(IInstallationResult*);
    HRESULT get_AllowSourcePrompts(VARIANT_BOOL*);
    HRESULT put_AllowSourcePrompts(VARIANT_BOOL);
    HRESULT get_RebootRequiredBeforeInstallation(VARIANT_BOOL*);
}
enum IID_IUpdateInstaller2 = GUID(0x3442d4fe, 0x224d, 0x4cee, [0x98, 0xcf, 0x30, 0xe0, 0xc4, 0xd2, 0x29, 0xe6]);
interface IUpdateInstaller2 : IUpdateInstaller
{
    HRESULT get_ForceQuiet(VARIANT_BOOL*);
    HRESULT put_ForceQuiet(VARIANT_BOOL);
}
enum IID_IUpdateInstaller3 = GUID(0x16d11c35, 0x99a, 0x48d0, [0x83, 0x38, 0x5f, 0xae, 0x64, 0x4, 0x7f, 0x8e]);
interface IUpdateInstaller3 : IUpdateInstaller2
{
    HRESULT get_AttemptCloseAppsIfNecessary(VARIANT_BOOL*);
    HRESULT put_AttemptCloseAppsIfNecessary(VARIANT_BOOL);
}
enum IID_IUpdateInstaller4 = GUID(0xef8208ea, 0x2304, 0x492d, [0x91, 0x9, 0x23, 0x81, 0x3b, 0x9, 0x58, 0xe1]);
interface IUpdateInstaller4 : IUpdateInstaller3
{
    HRESULT Commit(uint);
}
enum IID_IUpdateSession = GUID(0x816858a4, 0x260d, 0x4260, [0x93, 0x3a, 0x25, 0x85, 0xf1, 0xab, 0xc7, 0x6b]);
interface IUpdateSession : IDispatch
{
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT put_ClientApplicationID(BSTR);
    HRESULT get_ReadOnly(VARIANT_BOOL*);
    HRESULT get_WebProxy(IWebProxy*);
    HRESULT put_WebProxy(IWebProxy);
    HRESULT CreateUpdateSearcher(IUpdateSearcher*);
    HRESULT CreateUpdateDownloader(IUpdateDownloader*);
    HRESULT CreateUpdateInstaller(IUpdateInstaller*);
}
enum IID_IUpdateSession2 = GUID(0x91caf7b0, 0xeb23, 0x49ed, [0x99, 0x37, 0xc5, 0x2d, 0x81, 0x7f, 0x46, 0xf7]);
interface IUpdateSession2 : IUpdateSession
{
    HRESULT get_UserLocale(uint*);
    HRESULT put_UserLocale(uint);
}
enum IID_IUpdateSession3 = GUID(0x918efd1e, 0xb5d8, 0x4c90, [0x85, 0x40, 0xae, 0xb9, 0xbd, 0xc5, 0x6f, 0x9d]);
interface IUpdateSession3 : IUpdateSession2
{
    HRESULT CreateUpdateServiceManager(IUpdateServiceManager2*);
    HRESULT QueryHistory(BSTR, int, int, IUpdateHistoryEntryCollection*);
}
enum IID_IUpdateService = GUID(0x76b3b17e, 0xaed6, 0x4da5, [0x85, 0xf0, 0x83, 0x58, 0x7f, 0x81, 0xab, 0xe3]);
interface IUpdateService : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_ContentValidationCert(VARIANT*);
    HRESULT get_ExpirationDate(double*);
    HRESULT get_IsManaged(VARIANT_BOOL*);
    HRESULT get_IsRegisteredWithAU(VARIANT_BOOL*);
    HRESULT get_IssueDate(double*);
    HRESULT get_OffersWindowsUpdates(VARIANT_BOOL*);
    HRESULT get_RedirectUrls(IStringCollection*);
    HRESULT get_ServiceID(BSTR*);
    HRESULT get_IsScanPackageService(VARIANT_BOOL*);
    HRESULT get_CanRegisterWithAU(VARIANT_BOOL*);
    HRESULT get_ServiceUrl(BSTR*);
    HRESULT get_SetupPrefix(BSTR*);
}
enum IID_IUpdateService2 = GUID(0x1518b460, 0x6518, 0x4172, [0x94, 0xf, 0xc7, 0x58, 0x83, 0xb2, 0x4c, 0xeb]);
interface IUpdateService2 : IUpdateService
{
    HRESULT get_IsDefaultAUService(VARIANT_BOOL*);
}
enum IID_IUpdateServiceCollection = GUID(0x9b0353aa, 0xe52, 0x44ff, [0xb8, 0xb0, 0x1f, 0x7f, 0xa0, 0x43, 0x7f, 0x88]);
interface IUpdateServiceCollection : IDispatch
{
    HRESULT get_Item(int, IUpdateService*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_IUpdateServiceRegistration = GUID(0xdde02280, 0x12b3, 0x4e0b, [0x93, 0x7b, 0x67, 0x47, 0xf6, 0xac, 0xb2, 0x86]);
interface IUpdateServiceRegistration : IDispatch
{
    HRESULT get_RegistrationState(UpdateServiceRegistrationState*);
    HRESULT get_ServiceID(BSTR*);
    HRESULT get_IsPendingRegistrationWithAU(VARIANT_BOOL*);
    HRESULT get_Service(IUpdateService2*);
}
enum IID_IUpdateServiceManager = GUID(0x23857e3c, 0x2ba, 0x44a3, [0x94, 0x23, 0xb1, 0xc9, 0x0, 0x80, 0x5f, 0x37]);
interface IUpdateServiceManager : IDispatch
{
    HRESULT get_Services(IUpdateServiceCollection*);
    HRESULT AddService(BSTR, BSTR, IUpdateService*);
    HRESULT RegisterServiceWithAU(BSTR);
    HRESULT RemoveService(BSTR);
    HRESULT UnregisterServiceWithAU(BSTR);
    HRESULT AddScanPackageService(BSTR, BSTR, int, IUpdateService*);
    HRESULT SetOption(BSTR, VARIANT);
}
enum IID_IUpdateServiceManager2 = GUID(0xbb8531d, 0x7e8d, 0x424f, [0x98, 0x6c, 0xa0, 0xb8, 0xf6, 0xa, 0x3e, 0x7b]);
interface IUpdateServiceManager2 : IUpdateServiceManager
{
    HRESULT get_ClientApplicationID(BSTR*);
    HRESULT put_ClientApplicationID(BSTR);
    HRESULT QueryServiceRegistration(BSTR, IUpdateServiceRegistration*);
    HRESULT AddService2(BSTR, int, BSTR, IUpdateServiceRegistration*);
}
enum IID_IInstallationAgent = GUID(0x925cbc18, 0xa2ea, 0x4648, [0xbf, 0x1c, 0xec, 0x8b, 0xad, 0xcf, 0xe2, 0xa]);
interface IInstallationAgent : IDispatch
{
    HRESULT RecordInstallationResult(BSTR, int, IStringCollection);
}
alias UpdateLockdownOption = int;
enum : int
{
    uloForWebsiteAccess = 0x00000001,
}

alias AddServiceFlag = int;
enum : int
{
    asfAllowPendingRegistration = 0x00000001,
    asfAllowOnlineRegistration  = 0x00000002,
    asfRegisterServiceWithAU    = 0x00000004,
}

alias UpdateServiceOption = int;
enum : int
{
    usoNonVolatileService = 0x00000001,
}

enum CLSID_StringCollection = GUID(0x72c97d74, 0x7c3b, 0x40ae, [0xb7, 0x7d, 0xab, 0xdb, 0x22, 0xeb, 0xa6, 0xfb]);
struct StringCollection
{
}
enum CLSID_UpdateSearcher = GUID(0xb699e5e8, 0x67ff, 0x4177, [0x88, 0xb0, 0x36, 0x84, 0xa3, 0x38, 0x8b, 0xfb]);
struct UpdateSearcher
{
}
enum CLSID_WebProxy = GUID(0x650503cf, 0x9108, 0x4ddc, [0xa2, 0xce, 0x6c, 0x23, 0x41, 0xe1, 0xc5, 0x82]);
struct WebProxy
{
}
enum CLSID_SystemInformation = GUID(0xc01b9ba0, 0xbea7, 0x41ba, [0xb6, 0x4, 0xd0, 0xa3, 0x6f, 0x46, 0x91, 0x33]);
struct SystemInformation
{
}
enum CLSID_WindowsUpdateAgentInfo = GUID(0xc2e88c2f, 0x6f5b, 0x4aaa, [0x89, 0x4b, 0x55, 0xc8, 0x47, 0xad, 0x3a, 0x2d]);
struct WindowsUpdateAgentInfo
{
}
enum CLSID_AutomaticUpdates = GUID(0xbfe18e9c, 0x6d87, 0x4450, [0xb3, 0x7c, 0xe0, 0x2f, 0xb, 0x37, 0x38, 0x3]);
struct AutomaticUpdates
{
}
enum CLSID_UpdateCollection = GUID(0x13639463, 0xdb, 0x4646, [0x80, 0x3d, 0x52, 0x80, 0x26, 0x14, 0xd, 0x88]);
struct UpdateCollection
{
}
enum CLSID_UpdateDownloader = GUID(0x5baf654a, 0x5a07, 0x4264, [0xa2, 0x55, 0x9f, 0xf5, 0x4c, 0x71, 0x51, 0xe7]);
struct UpdateDownloader
{
}
enum CLSID_UpdateInstaller = GUID(0xd2e0fe7f, 0xd23e, 0x48e1, [0x93, 0xc0, 0x6f, 0xa8, 0xcc, 0x34, 0x64, 0x74]);
struct UpdateInstaller
{
}
enum CLSID_UpdateSession = GUID(0x4cb43d7f, 0x7eee, 0x4906, [0x86, 0x98, 0x60, 0xda, 0x1c, 0x38, 0xf2, 0xfe]);
struct UpdateSession
{
}
enum CLSID_UpdateServiceManager = GUID(0xf8d253d9, 0x89a4, 0x4daa, [0x87, 0xb6, 0x11, 0x68, 0x36, 0x9f, 0xb, 0x21]);
struct UpdateServiceManager
{
}
enum CLSID_InstallationAgent = GUID(0x317e92fc, 0x1679, 0x46fd, [0xa0, 0xb5, 0xf0, 0x89, 0x14, 0xdd, 0x86, 0x23]);
struct InstallationAgent
{
}
