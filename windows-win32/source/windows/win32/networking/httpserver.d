module windows.win32.networking.httpserver;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HANDLE, HRESULT, PSTR, PWSTR;
import windows.win32.networking.winsock : SOCKADDR, SOCKADDR_STORAGE;
import windows.win32.security_ : PSECURITY_DESCRIPTOR, SECURITY_ATTRIBUTES;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

alias HTTP_RECEIVE_HTTP_REQUEST_FLAGS = uint;
enum : uint
{
    HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY  = 0x00000001,
    HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY = 0x00000002,
}

alias HTTP_INITIALIZE = uint;
enum : uint
{
    HTTP_INITIALIZE_CONFIG = 0x00000002,
    HTTP_INITIALIZE_SERVER = 0x00000001,
}

uint HttpInitialize(HTTPAPI_VERSION, HTTP_INITIALIZE, void*);
uint HttpTerminate(HTTP_INITIALIZE, void*);
uint HttpCreateHttpHandle(HANDLE*, uint);
uint HttpCreateRequestQueue(HTTPAPI_VERSION, const(wchar)*, SECURITY_ATTRIBUTES*, uint, HANDLE*);
uint HttpCloseRequestQueue(HANDLE);
uint HttpSetRequestQueueProperty(HANDLE, HTTP_SERVER_PROPERTY, void*, uint, uint, void*);
uint HttpQueryRequestQueueProperty(HANDLE, HTTP_SERVER_PROPERTY, void*, uint, uint, uint*, void*);
uint HttpSetRequestProperty(HANDLE, ulong, HTTP_REQUEST_PROPERTY, void*, uint, OVERLAPPED*);
uint HttpShutdownRequestQueue(HANDLE);
uint HttpReceiveClientCertificate(HANDLE, ulong, uint, HTTP_SSL_CLIENT_CERT_INFO*, uint, uint*, OVERLAPPED*);
uint HttpCreateServerSession(HTTPAPI_VERSION, ulong*, uint);
uint HttpCloseServerSession(ulong);
uint HttpQueryServerSessionProperty(ulong, HTTP_SERVER_PROPERTY, void*, uint, uint*);
uint HttpSetServerSessionProperty(ulong, HTTP_SERVER_PROPERTY, void*, uint);
uint HttpAddUrl(HANDLE, const(wchar)*, void*);
uint HttpRemoveUrl(HANDLE, const(wchar)*);
uint HttpCreateUrlGroup(ulong, ulong*, uint);
uint HttpCloseUrlGroup(ulong);
uint HttpAddUrlToUrlGroup(ulong, const(wchar)*, ulong, uint);
uint HttpRemoveUrlFromUrlGroup(ulong, const(wchar)*, uint);
uint HttpSetUrlGroupProperty(ulong, HTTP_SERVER_PROPERTY, void*, uint);
uint HttpQueryUrlGroupProperty(ulong, HTTP_SERVER_PROPERTY, void*, uint, uint*);
uint HttpPrepareUrl(void*, uint, const(wchar)*, PWSTR*);
uint HttpReceiveHttpRequest(HANDLE, ulong, HTTP_RECEIVE_HTTP_REQUEST_FLAGS, HTTP_REQUEST_V2*, uint, uint*, OVERLAPPED*);
uint HttpReceiveRequestEntityBody(HANDLE, ulong, uint, void*, uint, uint*, OVERLAPPED*);
uint HttpSendHttpResponse(HANDLE, ulong, uint, HTTP_RESPONSE_V2*, HTTP_CACHE_POLICY*, uint*, void*, uint, OVERLAPPED*, HTTP_LOG_DATA*);
uint HttpSendResponseEntityBody(HANDLE, ulong, uint, ushort, HTTP_DATA_CHUNK*, uint*, void*, uint, OVERLAPPED*, HTTP_LOG_DATA*);
uint HttpDeclarePush(HANDLE, ulong, HTTP_VERB, const(wchar)*, const(char)*, HTTP_REQUEST_HEADERS*);
uint HttpWaitForDisconnect(HANDLE, ulong, OVERLAPPED*);
uint HttpWaitForDisconnectEx(HANDLE, ulong, uint, OVERLAPPED*);
uint HttpCancelHttpRequest(HANDLE, ulong, OVERLAPPED*);
uint HttpWaitForDemandStart(HANDLE, OVERLAPPED*);
BOOL HttpIsFeatureSupported(HTTP_FEATURE_ID);
uint HttpDelegateRequestEx(HANDLE, HANDLE, ulong, ulong, uint, HTTP_DELEGATE_REQUEST_PROPERTY_INFO*);
uint HttpFindUrlGroupId(const(wchar)*, HANDLE, ulong*);
uint HttpFlushResponseCache(HANDLE, const(wchar)*, uint, OVERLAPPED*);
uint HttpAddFragmentToCache(HANDLE, const(wchar)*, HTTP_DATA_CHUNK*, HTTP_CACHE_POLICY*, OVERLAPPED*);
uint HttpReadFragmentFromCache(HANDLE, const(wchar)*, HTTP_BYTE_RANGE*, void*, uint, uint*, OVERLAPPED*);
uint HttpSetServiceConfiguration(HANDLE, HTTP_SERVICE_CONFIG_ID, void*, uint, OVERLAPPED*);
uint HttpUpdateServiceConfiguration(HANDLE, HTTP_SERVICE_CONFIG_ID, void*, uint, OVERLAPPED*);
uint HttpDeleteServiceConfiguration(HANDLE, HTTP_SERVICE_CONFIG_ID, void*, uint, OVERLAPPED*);
uint HttpQueryServiceConfiguration(HANDLE, HTTP_SERVICE_CONFIG_ID, void*, uint, void*, uint, uint*, OVERLAPPED*);
uint HttpGetExtension(HTTPAPI_VERSION, uint, void*, uint);
enum HTTP_DEMAND_CBT = 0x00000004;
enum HTTP_MAX_SERVER_QUEUE_LENGTH = 0x7fffffff;
enum HTTP_MIN_SERVER_QUEUE_LENGTH = 0x00000001;
enum HTTP_AUTH_ENABLE_BASIC = 0x00000001;
enum HTTP_AUTH_ENABLE_DIGEST = 0x00000002;
enum HTTP_AUTH_ENABLE_NTLM = 0x00000004;
enum HTTP_AUTH_ENABLE_NEGOTIATE = 0x00000008;
enum HTTP_AUTH_ENABLE_KERBEROS = 0x00000010;
enum HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING = 0x00000001;
enum HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL = 0x00000002;
enum HTTP_CHANNEL_BIND_PROXY = 0x00000001;
enum HTTP_CHANNEL_BIND_PROXY_COHOSTING = 0x00000020;
enum HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK = 0x00000002;
enum HTTP_CHANNEL_BIND_DOTLESS_SERVICE = 0x00000004;
enum HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN = 0x00000008;
enum HTTP_CHANNEL_BIND_CLIENT_SERVICE = 0x00000010;
enum HTTP_LOG_FIELD_DATE = 0x00000001;
enum HTTP_LOG_FIELD_TIME = 0x00000002;
enum HTTP_LOG_FIELD_CLIENT_IP = 0x00000004;
enum HTTP_LOG_FIELD_USER_NAME = 0x00000008;
enum HTTP_LOG_FIELD_SITE_NAME = 0x00000010;
enum HTTP_LOG_FIELD_COMPUTER_NAME = 0x00000020;
enum HTTP_LOG_FIELD_SERVER_IP = 0x00000040;
enum HTTP_LOG_FIELD_METHOD = 0x00000080;
enum HTTP_LOG_FIELD_URI_STEM = 0x00000100;
enum HTTP_LOG_FIELD_URI_QUERY = 0x00000200;
enum HTTP_LOG_FIELD_STATUS = 0x00000400;
enum HTTP_LOG_FIELD_WIN32_STATUS = 0x00000800;
enum HTTP_LOG_FIELD_BYTES_SENT = 0x00001000;
enum HTTP_LOG_FIELD_BYTES_RECV = 0x00002000;
enum HTTP_LOG_FIELD_TIME_TAKEN = 0x00004000;
enum HTTP_LOG_FIELD_SERVER_PORT = 0x00008000;
enum HTTP_LOG_FIELD_USER_AGENT = 0x00010000;
enum HTTP_LOG_FIELD_COOKIE = 0x00020000;
enum HTTP_LOG_FIELD_REFERER = 0x00040000;
enum HTTP_LOG_FIELD_VERSION = 0x00080000;
enum HTTP_LOG_FIELD_HOST = 0x00100000;
enum HTTP_LOG_FIELD_SUB_STATUS = 0x00200000;
enum HTTP_LOG_FIELD_STREAM_ID = 0x08000000;
enum HTTP_LOG_FIELD_STREAM_ID_EX = 0x10000000;
enum HTTP_LOG_FIELD_TRANSPORT_TYPE = 0x20000000;
enum HTTP_LOG_FIELD_CLIENT_PORT = 0x00400000;
enum HTTP_LOG_FIELD_URI = 0x00800000;
enum HTTP_LOG_FIELD_SITE_ID = 0x01000000;
enum HTTP_LOG_FIELD_REASON = 0x02000000;
enum HTTP_LOG_FIELD_QUEUE_NAME = 0x04000000;
enum HTTP_LOG_FIELD_CORRELATION_ID = 0x40000000;
enum HTTP_LOG_FIELD_FAULT_CODE = 0x80000000;
enum HTTP_LOGGING_FLAG_LOCAL_TIME_ROLLOVER = 0x00000001;
enum HTTP_LOGGING_FLAG_USE_UTF8_CONVERSION = 0x00000002;
enum HTTP_LOGGING_FLAG_LOG_ERRORS_ONLY = 0x00000004;
enum HTTP_LOGGING_FLAG_LOG_SUCCESS_ONLY = 0x00000008;
enum HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING = 0x00000001;
enum HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER = 0x00000002;
enum HTTP_CREATE_REQUEST_QUEUE_FLAG_DELEGATION = 0x00000008;
enum HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER = 0x00000001;
enum HTTP_SEND_RESPONSE_FLAG_DISCONNECT = 0x00000001;
enum HTTP_SEND_RESPONSE_FLAG_MORE_DATA = 0x00000002;
enum HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA = 0x00000004;
enum HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING = 0x00000008;
enum HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES = 0x00000020;
enum HTTP_SEND_RESPONSE_FLAG_OPAQUE = 0x00000040;
enum HTTP_SEND_RESPONSE_FLAG_GOAWAY = 0x00000100;
enum HTTP_FLUSH_RESPONSE_FLAG_RECURSIVE = 0x00000001;
enum HTTP_URL_FLAG_REMOVE_ALL = 0x00000001;
enum HTTP_RECEIVE_SECURE_CHANNEL_TOKEN = 0x00000001;
enum HTTP_RECEIVE_FULL_CHAIN = 0x00000002;
enum HTTP_REQUEST_SIZING_INFO_FLAG_TCP_FAST_OPEN = 0x00000001;
enum HTTP_REQUEST_SIZING_INFO_FLAG_TLS_SESSION_RESUMPTION = 0x00000002;
enum HTTP_REQUEST_SIZING_INFO_FLAG_TLS_FALSE_START = 0x00000004;
enum HTTP_REQUEST_SIZING_INFO_FLAG_FIRST_REQUEST = 0x00000008;
enum HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED = 0x00000001;
enum HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS = 0x00000001;
enum HTTP_REQUEST_FLAG_IP_ROUTED = 0x00000002;
enum HTTP_REQUEST_FLAG_HTTP2 = 0x00000004;
enum HTTP_REQUEST_FLAG_HTTP3 = 0x00000008;
enum HTTP_RESPONSE_FLAG_MULTIPLE_ENCODINGS_AVAILABLE = 0x00000001;
enum HTTP_RESPONSE_FLAG_MORE_ENTITY_BODY_EXISTS = 0x00000002;
enum HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER = 0x00000001;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER = 0x00000001;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT = 0x00000002;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER = 0x00000004;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_REJECT = 0x00000008;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_HTTP2 = 0x00000010;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_QUIC = 0x00000020;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS13 = 0x00000040;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_OCSP_STAPLING = 0x00000080;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_TOKEN_BINDING = 0x00000100;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_LOG_EXTENDED_EVENTS = 0x00000200;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_LEGACY_TLS = 0x00000400;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_SESSION_TICKET = 0x00000800;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS12 = 0x00001000;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CLIENT_CORRELATION = 0x00002000;
enum HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_SESSION_ID = 0x00004000;
enum HTTP_REQUEST_PROPERTY_SNI_HOST_MAX_LENGTH = 0x000000ff;
enum HTTP_REQUEST_PROPERTY_SNI_FLAG_SNI_USED = 0x00000001;
enum HTTP_REQUEST_PROPERTY_SNI_FLAG_NO_SNI = 0x00000002;
/+ [CONFLICTED] enum HTTP_VERSION = "HTTP/1.0";
+/
alias HTTP_SERVER_PROPERTY = int;
enum : int
{
    HttpServerAuthenticationProperty         = 0x00000000,
    HttpServerLoggingProperty                = 0x00000001,
    HttpServerQosProperty                    = 0x00000002,
    HttpServerTimeoutsProperty               = 0x00000003,
    HttpServerQueueLengthProperty            = 0x00000004,
    HttpServerStateProperty                  = 0x00000005,
    HttpServer503VerbosityProperty           = 0x00000006,
    HttpServerBindingProperty                = 0x00000007,
    HttpServerExtendedAuthenticationProperty = 0x00000008,
    HttpServerListenEndpointProperty         = 0x00000009,
    HttpServerChannelBindProperty            = 0x0000000a,
    HttpServerProtectionLevelProperty        = 0x0000000b,
    HttpServerDelegationProperty             = 0x00000010,
}

struct HTTP_PROPERTY_FLAGS
{
    uint _bitfield0;
}
alias HTTP_ENABLED_STATE = int;
enum : int
{
    HttpEnabledStateActive   = 0x00000000,
    HttpEnabledStateInactive = 0x00000001,
}

struct HTTP_STATE_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    HTTP_ENABLED_STATE State;
}
alias HTTP_503_RESPONSE_VERBOSITY = int;
enum : int
{
    Http503ResponseVerbosityBasic   = 0x00000000,
    Http503ResponseVerbosityLimited = 0x00000001,
    Http503ResponseVerbosityFull    = 0x00000002,
}

alias HTTP_QOS_SETTING_TYPE = int;
enum : int
{
    HttpQosSettingTypeBandwidth       = 0x00000000,
    HttpQosSettingTypeConnectionLimit = 0x00000001,
    HttpQosSettingTypeFlowRate        = 0x00000002,
}

struct HTTP_QOS_SETTING_INFO
{
    HTTP_QOS_SETTING_TYPE QosType;
    void* QosSetting;
}
struct HTTP_CONNECTION_LIMIT_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    uint MaxConnections;
}
struct HTTP_BANDWIDTH_LIMIT_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    uint MaxBandwidth;
}
struct HTTP_FLOWRATE_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    uint MaxBandwidth;
    uint MaxPeakBandwidth;
    uint BurstSize;
}
alias HTTP_SERVICE_CONFIG_TIMEOUT_KEY = int;
enum : int
{
    IdleConnectionTimeout = 0x00000000,
    HeaderWaitTimeout     = 0x00000001,
}

struct HTTP_SERVICE_CONFIG_TIMEOUT_SET
{
    HTTP_SERVICE_CONFIG_TIMEOUT_KEY KeyDesc;
    ushort ParamDesc;
}
struct HTTP_TIMEOUT_LIMIT_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    ushort EntityBody;
    ushort DrainEntityBody;
    ushort RequestQueue;
    ushort IdleConnection;
    ushort HeaderWait;
    uint MinSendRate;
}
alias HTTP_SERVICE_CONFIG_SETTING_KEY = int;
enum : int
{
    HttpNone        = 0x00000000,
    HttpTlsThrottle = 0x00000001,
}

struct HTTP_SERVICE_CONFIG_SETTING_SET
{
    HTTP_SERVICE_CONFIG_SETTING_KEY KeyDesc;
    uint ParamDesc;
}
struct HTTP_LISTEN_ENDPOINT_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    BOOLEAN EnableSharing;
}
struct HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS
{
    ushort DomainNameLength;
    PWSTR DomainName;
    ushort RealmLength;
    PWSTR Realm;
}
struct HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS
{
    ushort RealmLength;
    PWSTR Realm;
}
struct HTTP_SERVER_AUTHENTICATION_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    uint AuthSchemes;
    BOOLEAN ReceiveMutualAuth;
    BOOLEAN ReceiveContextHandle;
    BOOLEAN DisableNTLMCredentialCaching;
    ubyte ExFlags;
    HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS DigestParams;
    HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS BasicParams;
}
alias HTTP_SERVICE_BINDING_TYPE = int;
enum : int
{
    HttpServiceBindingTypeNone = 0x00000000,
    HttpServiceBindingTypeW    = 0x00000001,
    HttpServiceBindingTypeA    = 0x00000002,
}

struct HTTP_SERVICE_BINDING_BASE
{
    HTTP_SERVICE_BINDING_TYPE Type;
}
struct HTTP_SERVICE_BINDING_A
{
    HTTP_SERVICE_BINDING_BASE Base;
    PSTR Buffer;
    uint BufferSize;
}
struct HTTP_SERVICE_BINDING_W
{
    HTTP_SERVICE_BINDING_BASE Base;
    PWSTR Buffer;
    uint BufferSize;
}
alias HTTP_AUTHENTICATION_HARDENING_LEVELS = int;
enum : int
{
    HttpAuthenticationHardeningLegacy = 0x00000000,
    HttpAuthenticationHardeningMedium = 0x00000001,
    HttpAuthenticationHardeningStrict = 0x00000002,
}

struct HTTP_CHANNEL_BIND_INFO
{
    HTTP_AUTHENTICATION_HARDENING_LEVELS Hardening;
    uint Flags;
    HTTP_SERVICE_BINDING_BASE** ServiceNames;
    uint NumberOfServiceNames;
}
struct HTTP_REQUEST_CHANNEL_BIND_STATUS
{
    HTTP_SERVICE_BINDING_BASE* ServiceName;
    ubyte* ChannelToken;
    uint ChannelTokenSize;
    uint Flags;
}
struct HTTP_REQUEST_TOKEN_BINDING_INFO
{
    ubyte* TokenBinding;
    uint TokenBindingSize;
    ubyte* EKM;
    uint EKMSize;
    ubyte KeyType;
}
alias HTTP_LOGGING_TYPE = int;
enum : int
{
    HttpLoggingTypeW3C  = 0x00000000,
    HttpLoggingTypeIIS  = 0x00000001,
    HttpLoggingTypeNCSA = 0x00000002,
    HttpLoggingTypeRaw  = 0x00000003,
}

alias HTTP_LOGGING_ROLLOVER_TYPE = int;
enum : int
{
    HttpLoggingRolloverSize    = 0x00000000,
    HttpLoggingRolloverDaily   = 0x00000001,
    HttpLoggingRolloverWeekly  = 0x00000002,
    HttpLoggingRolloverMonthly = 0x00000003,
    HttpLoggingRolloverHourly  = 0x00000004,
}

struct HTTP_LOGGING_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    uint LoggingFlags;
    const(wchar)* SoftwareName;
    ushort SoftwareNameLength;
    ushort DirectoryNameLength;
    const(wchar)* DirectoryName;
    HTTP_LOGGING_TYPE Format;
    uint Fields;
    void* pExtFields;
    ushort NumOfExtFields;
    ushort MaxRecordSize;
    HTTP_LOGGING_ROLLOVER_TYPE RolloverType;
    uint RolloverSize;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
}
struct HTTP_BINDING_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    HANDLE RequestQueueHandle;
}
alias HTTP_PROTECTION_LEVEL_TYPE = int;
enum : int
{
    HttpProtectionLevelUnrestricted   = 0x00000000,
    HttpProtectionLevelEdgeRestricted = 0x00000001,
    HttpProtectionLevelRestricted     = 0x00000002,
}

struct HTTP_PROTECTION_LEVEL_INFO
{
    HTTP_PROPERTY_FLAGS Flags;
    HTTP_PROTECTION_LEVEL_TYPE Level;
}
struct HTTP_BYTE_RANGE
{
    ulong StartingOffset;
    ulong Length;
}
struct HTTP_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
}
alias HTTP_SCHEME = int;
enum : int
{
    HttpSchemeHttp    = 0x00000000,
    HttpSchemeHttps   = 0x00000001,
    HttpSchemeMaximum = 0x00000002,
}

alias HTTP_VERB = int;
enum : int
{
    HttpVerbUnparsed  = 0x00000000,
    HttpVerbUnknown   = 0x00000001,
    HttpVerbInvalid   = 0x00000002,
    HttpVerbOPTIONS   = 0x00000003,
    HttpVerbGET       = 0x00000004,
    HttpVerbHEAD      = 0x00000005,
    HttpVerbPOST      = 0x00000006,
    HttpVerbPUT       = 0x00000007,
    HttpVerbDELETE    = 0x00000008,
    HttpVerbTRACE     = 0x00000009,
    HttpVerbCONNECT   = 0x0000000a,
    HttpVerbTRACK     = 0x0000000b,
    HttpVerbMOVE      = 0x0000000c,
    HttpVerbCOPY      = 0x0000000d,
    HttpVerbPROPFIND  = 0x0000000e,
    HttpVerbPROPPATCH = 0x0000000f,
    HttpVerbMKCOL     = 0x00000010,
    HttpVerbLOCK      = 0x00000011,
    HttpVerbUNLOCK    = 0x00000012,
    HttpVerbSEARCH    = 0x00000013,
    HttpVerbMaximum   = 0x00000014,
}

alias HTTP_HEADER_ID = int;
enum : int
{
    HttpHeaderCacheControl       = 0x00000000,
    HttpHeaderConnection         = 0x00000001,
    HttpHeaderDate               = 0x00000002,
    HttpHeaderKeepAlive          = 0x00000003,
    HttpHeaderPragma             = 0x00000004,
    HttpHeaderTrailer            = 0x00000005,
    HttpHeaderTransferEncoding   = 0x00000006,
    HttpHeaderUpgrade            = 0x00000007,
    HttpHeaderVia                = 0x00000008,
    HttpHeaderWarning            = 0x00000009,
    HttpHeaderAllow              = 0x0000000a,
    HttpHeaderContentLength      = 0x0000000b,
    HttpHeaderContentType        = 0x0000000c,
    HttpHeaderContentEncoding    = 0x0000000d,
    HttpHeaderContentLanguage    = 0x0000000e,
    HttpHeaderContentLocation    = 0x0000000f,
    HttpHeaderContentMd5         = 0x00000010,
    HttpHeaderContentRange       = 0x00000011,
    HttpHeaderExpires            = 0x00000012,
    HttpHeaderLastModified       = 0x00000013,
    HttpHeaderAccept             = 0x00000014,
    HttpHeaderAcceptCharset      = 0x00000015,
    HttpHeaderAcceptEncoding     = 0x00000016,
    HttpHeaderAcceptLanguage     = 0x00000017,
    HttpHeaderAuthorization      = 0x00000018,
    HttpHeaderCookie             = 0x00000019,
    HttpHeaderExpect             = 0x0000001a,
    HttpHeaderFrom               = 0x0000001b,
    HttpHeaderHost               = 0x0000001c,
    HttpHeaderIfMatch            = 0x0000001d,
    HttpHeaderIfModifiedSince    = 0x0000001e,
    HttpHeaderIfNoneMatch        = 0x0000001f,
    HttpHeaderIfRange            = 0x00000020,
    HttpHeaderIfUnmodifiedSince  = 0x00000021,
    HttpHeaderMaxForwards        = 0x00000022,
    HttpHeaderProxyAuthorization = 0x00000023,
    HttpHeaderReferer            = 0x00000024,
    HttpHeaderRange              = 0x00000025,
    HttpHeaderTe                 = 0x00000026,
    HttpHeaderTranslate          = 0x00000027,
    HttpHeaderUserAgent          = 0x00000028,
    HttpHeaderRequestMaximum     = 0x00000029,
    HttpHeaderAcceptRanges       = 0x00000014,
    HttpHeaderAge                = 0x00000015,
    HttpHeaderEtag               = 0x00000016,
    HttpHeaderLocation           = 0x00000017,
    HttpHeaderProxyAuthenticate  = 0x00000018,
    HttpHeaderRetryAfter         = 0x00000019,
    HttpHeaderServer             = 0x0000001a,
    HttpHeaderSetCookie          = 0x0000001b,
    HttpHeaderVary               = 0x0000001c,
    HttpHeaderWwwAuthenticate    = 0x0000001d,
    HttpHeaderResponseMaximum    = 0x0000001e,
    HttpHeaderMaximum            = 0x00000029,
}

struct HTTP_KNOWN_HEADER
{
    ushort RawValueLength;
    const(char)* pRawValue;
}
struct HTTP_UNKNOWN_HEADER
{
    ushort NameLength;
    ushort RawValueLength;
    const(char)* pName;
    const(char)* pRawValue;
}
alias HTTP_LOG_DATA_TYPE = int;
enum : int
{
    HttpLogDataTypeFields = 0x00000000,
}

struct HTTP_LOG_DATA
{
    HTTP_LOG_DATA_TYPE Type;
}
struct HTTP_LOG_FIELDS_DATA
{
    HTTP_LOG_DATA Base;
    ushort UserNameLength;
    ushort UriStemLength;
    ushort ClientIpLength;
    ushort ServerNameLength;
    ushort ServiceNameLength;
    ushort ServerIpLength;
    ushort MethodLength;
    ushort UriQueryLength;
    ushort HostLength;
    ushort UserAgentLength;
    ushort CookieLength;
    ushort ReferrerLength;
    PWSTR UserName;
    PWSTR UriStem;
    PSTR ClientIp;
    PSTR ServerName;
    PSTR ServiceName;
    PSTR ServerIp;
    PSTR Method;
    PSTR UriQuery;
    PSTR Host;
    PSTR UserAgent;
    PSTR Cookie;
    PSTR Referrer;
    ushort ServerPort;
    ushort ProtocolStatus;
    uint Win32Status;
    HTTP_VERB MethodNum;
    ushort SubStatus;
}
alias HTTP_DATA_CHUNK_TYPE = int;
enum : int
{
    HttpDataChunkFromMemory          = 0x00000000,
    HttpDataChunkFromFileHandle      = 0x00000001,
    HttpDataChunkFromFragmentCache   = 0x00000002,
    HttpDataChunkFromFragmentCacheEx = 0x00000003,
    HttpDataChunkTrailers            = 0x00000004,
    HttpDataChunkMaximum             = 0x00000005,
}

struct HTTP_DATA_CHUNK
{
    HTTP_DATA_CHUNK_TYPE DataChunkType;
    union
    {
        struct _FromMemory_e__Struct
        {
            void* pBuffer;
            uint BufferLength;
        }
        struct _FromFileHandle_e__Struct
        {
            HTTP_BYTE_RANGE ByteRange;
            HANDLE FileHandle;
        }
        struct _FromFragmentCache_e__Struct
        {
            ushort FragmentNameLength;
            const(wchar)* pFragmentName;
        }
        struct _FromFragmentCacheEx_e__Struct
        {
            HTTP_BYTE_RANGE ByteRange;
            const(wchar)* pFragmentName;
        }
        struct _Trailers_e__Struct
        {
            ushort TrailerCount;
            HTTP_UNKNOWN_HEADER* pTrailers;
        }
    }
}
struct HTTP_REQUEST_HEADERS
{
    ushort UnknownHeaderCount;
    HTTP_UNKNOWN_HEADER* pUnknownHeaders;
    ushort TrailerCount;
    HTTP_UNKNOWN_HEADER* pTrailers;
    HTTP_KNOWN_HEADER[41] KnownHeaders;
}
struct HTTP_RESPONSE_HEADERS
{
    ushort UnknownHeaderCount;
    HTTP_UNKNOWN_HEADER* pUnknownHeaders;
    ushort TrailerCount;
    HTTP_UNKNOWN_HEADER* pTrailers;
    HTTP_KNOWN_HEADER[30] KnownHeaders;
}
alias HTTP_DELEGATE_REQUEST_PROPERTY_ID = int;
enum : int
{
    DelegateRequestReservedProperty    = 0x00000000,
    DelegateRequestDelegateUrlProperty = 0x00000001,
}

struct HTTP_DELEGATE_REQUEST_PROPERTY_INFO
{
    HTTP_DELEGATE_REQUEST_PROPERTY_ID PropertyId;
    uint PropertyInfoLength;
    void* PropertyInfo;
}
alias HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID = int;
enum : int
{
    CreateRequestQueueExternalIdProperty = 0x00000001,
    CreateRequestQueueMax                = 0x00000002,
}

struct HTTP_CREATE_REQUEST_QUEUE_PROPERTY_INFO
{
    HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID PropertyId;
    uint PropertyInfoLength;
    void* PropertyInfo;
}
struct HTTP_TRANSPORT_ADDRESS
{
    SOCKADDR* pRemoteAddress;
    SOCKADDR* pLocalAddress;
}
struct HTTP_COOKED_URL
{
    ushort FullUrlLength;
    ushort HostLength;
    ushort AbsPathLength;
    ushort QueryStringLength;
    const(wchar)* pFullUrl;
    const(wchar)* pHost;
    const(wchar)* pAbsPath;
    const(wchar)* pQueryString;
}
alias HTTP_AUTH_STATUS = int;
enum : int
{
    HttpAuthStatusSuccess          = 0x00000000,
    HttpAuthStatusNotAuthenticated = 0x00000001,
    HttpAuthStatusFailure          = 0x00000002,
}

alias HTTP_REQUEST_AUTH_TYPE = int;
enum : int
{
    HttpRequestAuthTypeNone      = 0x00000000,
    HttpRequestAuthTypeBasic     = 0x00000001,
    HttpRequestAuthTypeDigest    = 0x00000002,
    HttpRequestAuthTypeNTLM      = 0x00000003,
    HttpRequestAuthTypeNegotiate = 0x00000004,
    HttpRequestAuthTypeKerberos  = 0x00000005,
}

struct HTTP_SSL_CLIENT_CERT_INFO
{
    uint CertFlags;
    uint CertEncodedSize;
    ubyte* pCertEncoded;
    HANDLE Token;
    BOOLEAN CertDeniedByMapper;
}
struct HTTP_SSL_INFO
{
    ushort ServerCertKeySize;
    ushort ConnectionKeySize;
    uint ServerCertIssuerSize;
    uint ServerCertSubjectSize;
    const(char)* pServerCertIssuer;
    const(char)* pServerCertSubject;
    HTTP_SSL_CLIENT_CERT_INFO* pClientCertInfo;
    uint SslClientCertNegotiated;
}
struct HTTP_SSL_PROTOCOL_INFO
{
    uint Protocol;
    uint CipherType;
    uint CipherStrength;
    uint HashType;
    uint HashStrength;
    uint KeyExchangeType;
    uint KeyExchangeStrength;
}
alias HTTP_REQUEST_SIZING_TYPE = int;
enum : int
{
    HttpRequestSizingTypeTlsHandshakeLeg1ClientData = 0x00000000,
    HttpRequestSizingTypeTlsHandshakeLeg1ServerData = 0x00000001,
    HttpRequestSizingTypeTlsHandshakeLeg2ClientData = 0x00000002,
    HttpRequestSizingTypeTlsHandshakeLeg2ServerData = 0x00000003,
    HttpRequestSizingTypeHeaders                    = 0x00000004,
    HttpRequestSizingTypeMax                        = 0x00000005,
}

struct HTTP_REQUEST_SIZING_INFO
{
    ulong Flags;
    uint RequestIndex;
    uint RequestSizingCount;
    ulong[5] RequestSizing;
}
alias HTTP_REQUEST_TIMING_TYPE = int;
enum : int
{
    HttpRequestTimingTypeConnectionStart                = 0x00000000,
    HttpRequestTimingTypeDataStart                      = 0x00000001,
    HttpRequestTimingTypeTlsCertificateLoadStart        = 0x00000002,
    HttpRequestTimingTypeTlsCertificateLoadEnd          = 0x00000003,
    HttpRequestTimingTypeTlsHandshakeLeg1Start          = 0x00000004,
    HttpRequestTimingTypeTlsHandshakeLeg1End            = 0x00000005,
    HttpRequestTimingTypeTlsHandshakeLeg2Start          = 0x00000006,
    HttpRequestTimingTypeTlsHandshakeLeg2End            = 0x00000007,
    HttpRequestTimingTypeTlsAttributesQueryStart        = 0x00000008,
    HttpRequestTimingTypeTlsAttributesQueryEnd          = 0x00000009,
    HttpRequestTimingTypeTlsClientCertQueryStart        = 0x0000000a,
    HttpRequestTimingTypeTlsClientCertQueryEnd          = 0x0000000b,
    HttpRequestTimingTypeHttp2StreamStart               = 0x0000000c,
    HttpRequestTimingTypeHttp2HeaderDecodeStart         = 0x0000000d,
    HttpRequestTimingTypeHttp2HeaderDecodeEnd           = 0x0000000e,
    HttpRequestTimingTypeRequestHeaderParseStart        = 0x0000000f,
    HttpRequestTimingTypeRequestHeaderParseEnd          = 0x00000010,
    HttpRequestTimingTypeRequestRoutingStart            = 0x00000011,
    HttpRequestTimingTypeRequestRoutingEnd              = 0x00000012,
    HttpRequestTimingTypeRequestQueuedForInspection     = 0x00000013,
    HttpRequestTimingTypeRequestDeliveredForInspection  = 0x00000014,
    HttpRequestTimingTypeRequestReturnedAfterInspection = 0x00000015,
    HttpRequestTimingTypeRequestQueuedForDelegation     = 0x00000016,
    HttpRequestTimingTypeRequestDeliveredForDelegation  = 0x00000017,
    HttpRequestTimingTypeRequestReturnedAfterDelegation = 0x00000018,
    HttpRequestTimingTypeRequestQueuedForIO             = 0x00000019,
    HttpRequestTimingTypeRequestDeliveredForIO          = 0x0000001a,
    HttpRequestTimingTypeHttp3StreamStart               = 0x0000001b,
    HttpRequestTimingTypeHttp3HeaderDecodeStart         = 0x0000001c,
    HttpRequestTimingTypeHttp3HeaderDecodeEnd           = 0x0000001d,
    HttpRequestTimingTypeMax                            = 0x0000001e,
}

struct HTTP_REQUEST_TIMING_INFO
{
    uint RequestTimingCount;
    ulong[30] RequestTiming;
}
alias HTTP_REQUEST_INFO_TYPE = int;
enum : int
{
    HttpRequestInfoTypeAuth                 = 0x00000000,
    HttpRequestInfoTypeChannelBind          = 0x00000001,
    HttpRequestInfoTypeSslProtocol          = 0x00000002,
    HttpRequestInfoTypeSslTokenBindingDraft = 0x00000003,
    HttpRequestInfoTypeSslTokenBinding      = 0x00000004,
    HttpRequestInfoTypeRequestTiming        = 0x00000005,
    HttpRequestInfoTypeTcpInfoV0            = 0x00000006,
    HttpRequestInfoTypeRequestSizing        = 0x00000007,
    HttpRequestInfoTypeQuicStats            = 0x00000008,
    HttpRequestInfoTypeTcpInfoV1            = 0x00000009,
}

struct HTTP_REQUEST_INFO
{
    HTTP_REQUEST_INFO_TYPE InfoType;
    uint InfoLength;
    void* pInfo;
}
struct HTTP_REQUEST_AUTH_INFO
{
    HTTP_AUTH_STATUS AuthStatus;
    HRESULT SecStatus;
    uint Flags;
    HTTP_REQUEST_AUTH_TYPE AuthType;
    HANDLE AccessToken;
    uint ContextAttributes;
    uint PackedContextLength;
    uint PackedContextType;
    void* PackedContext;
    uint MutualAuthDataLength;
    PSTR pMutualAuthData;
    ushort PackageNameLength;
    PWSTR pPackageName;
}
struct HTTP_REQUEST_V1
{
    uint Flags;
    ulong ConnectionId;
    ulong RequestId;
    ulong UrlContext;
    HTTP_VERSION Version;
    HTTP_VERB Verb;
    ushort UnknownVerbLength;
    ushort RawUrlLength;
    const(char)* pUnknownVerb;
    const(char)* pRawUrl;
    HTTP_COOKED_URL CookedUrl;
    HTTP_TRANSPORT_ADDRESS Address;
    HTTP_REQUEST_HEADERS Headers;
    ulong BytesReceived;
    ushort EntityChunkCount;
    HTTP_DATA_CHUNK* pEntityChunks;
    ulong RawConnectionId;
    HTTP_SSL_INFO* pSslInfo;
}
struct HTTP_REQUEST_V2
{
    HTTP_REQUEST_V1 Base;
    ushort RequestInfoCount;
    HTTP_REQUEST_INFO* pRequestInfo;
}
struct HTTP_RESPONSE_V1
{
    uint Flags;
    HTTP_VERSION Version;
    ushort StatusCode;
    ushort ReasonLength;
    const(char)* pReason;
    HTTP_RESPONSE_HEADERS Headers;
    ushort EntityChunkCount;
    HTTP_DATA_CHUNK* pEntityChunks;
}
alias HTTP_RESPONSE_INFO_TYPE = int;
enum : int
{
    HttpResponseInfoTypeMultipleKnownHeaders   = 0x00000000,
    HttpResponseInfoTypeAuthenticationProperty = 0x00000001,
    HttpResponseInfoTypeQoSProperty            = 0x00000002,
    HttpResponseInfoTypeChannelBind            = 0x00000003,
}

struct HTTP_RESPONSE_INFO
{
    HTTP_RESPONSE_INFO_TYPE Type;
    uint Length;
    void* pInfo;
}
struct HTTP_MULTIPLE_KNOWN_HEADERS
{
    HTTP_HEADER_ID HeaderId;
    uint Flags;
    ushort KnownHeaderCount;
    HTTP_KNOWN_HEADER* KnownHeaders;
}
struct HTTP_RESPONSE_V2
{
    HTTP_RESPONSE_V1 Base;
    ushort ResponseInfoCount;
    HTTP_RESPONSE_INFO* pResponseInfo;
}
struct HTTPAPI_VERSION
{
    ushort HttpApiMajorVersion;
    ushort HttpApiMinorVersion;
}
alias HTTP_CACHE_POLICY_TYPE = int;
enum : int
{
    HttpCachePolicyNocache         = 0x00000000,
    HttpCachePolicyUserInvalidates = 0x00000001,
    HttpCachePolicyTimeToLive      = 0x00000002,
    HttpCachePolicyMaximum         = 0x00000003,
}

struct HTTP_CACHE_POLICY
{
    HTTP_CACHE_POLICY_TYPE Policy;
    uint SecondsToLive;
}
alias HTTP_SERVICE_CONFIG_ID = int;
enum : int
{
    HttpServiceConfigIPListenList           = 0x00000000,
    HttpServiceConfigSSLCertInfo            = 0x00000001,
    HttpServiceConfigUrlAclInfo             = 0x00000002,
    HttpServiceConfigTimeout                = 0x00000003,
    HttpServiceConfigCache                  = 0x00000004,
    HttpServiceConfigSslSniCertInfo         = 0x00000005,
    HttpServiceConfigSslCcsCertInfo         = 0x00000006,
    HttpServiceConfigSetting                = 0x00000007,
    HttpServiceConfigSslCertInfoEx          = 0x00000008,
    HttpServiceConfigSslSniCertInfoEx       = 0x00000009,
    HttpServiceConfigSslCcsCertInfoEx       = 0x0000000a,
    HttpServiceConfigSslScopedCcsCertInfo   = 0x0000000b,
    HttpServiceConfigSslScopedCcsCertInfoEx = 0x0000000c,
    HttpServiceConfigMax                    = 0x0000000d,
}

alias HTTP_SERVICE_CONFIG_QUERY_TYPE = int;
enum : int
{
    HttpServiceConfigQueryExact = 0x00000000,
    HttpServiceConfigQueryNext  = 0x00000001,
    HttpServiceConfigQueryMax   = 0x00000002,
}

struct HTTP_SERVICE_CONFIG_SSL_KEY
{
    SOCKADDR* pIpPort;
}
struct HTTP_SERVICE_CONFIG_SSL_KEY_EX
{
    SOCKADDR_STORAGE IpPort;
}
struct HTTP_SERVICE_CONFIG_SSL_SNI_KEY
{
    SOCKADDR_STORAGE IpPort;
    PWSTR Host;
}
struct HTTP_SERVICE_CONFIG_SSL_CCS_KEY
{
    SOCKADDR_STORAGE LocalAddress;
}
struct HTTP_SERVICE_CONFIG_SSL_PARAM
{
    uint SslHashLength;
    void* pSslHash;
    GUID AppId;
    PWSTR pSslCertStoreName;
    uint DefaultCertCheckMode;
    uint DefaultRevocationFreshnessTime;
    uint DefaultRevocationUrlRetrievalTimeout;
    PWSTR pDefaultSslCtlIdentifier;
    PWSTR pDefaultSslCtlStoreName;
    uint DefaultFlags;
}
alias HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE = int;
enum : int
{
    ExParamTypeHttp2Window          = 0x00000000,
    ExParamTypeHttp2SettingsLimits  = 0x00000001,
    ExParamTypeHttpPerformance      = 0x00000002,
    ExParamTypeTlsRestrictions      = 0x00000003,
    ExParamTypeErrorHeaders         = 0x00000004,
    ExParamTypeTlsSessionTicketKeys = 0x00000005,
    ExParamTypeMax                  = 0x00000006,
}

struct HTTP2_WINDOW_SIZE_PARAM
{
    uint Http2ReceiveWindowSize;
}
struct HTTP2_SETTINGS_LIMITS_PARAM
{
    uint Http2MaxSettingsPerFrame;
    uint Http2MaxSettingsPerMinute;
}
alias HTTP_PERFORMANCE_PARAM_TYPE = int;
enum : int
{
    PerformanceParamSendBufferingFlags         = 0x00000000,
    PerformanceParamAggressiveICW              = 0x00000001,
    PerformanceParamMaxSendBufferSize          = 0x00000002,
    PerformanceParamMaxConcurrentClientStreams = 0x00000003,
    PerformanceParamMaxReceiveBufferSize       = 0x00000004,
    PerformanceParamDecryptOnSspiThread        = 0x00000005,
    PerformanceParamMax                        = 0x00000006,
}

struct HTTP_PERFORMANCE_PARAM
{
    HTTP_PERFORMANCE_PARAM_TYPE Type;
    uint BufferSize;
    void* Buffer;
}
struct HTTP_TLS_RESTRICTIONS_PARAM
{
    uint RestrictionCount;
    void* TlsRestrictions;
}
struct HTTP_ERROR_HEADERS_PARAM
{
    ushort StatusCode;
    ushort HeaderCount;
    HTTP_UNKNOWN_HEADER* Headers;
}
struct HTTP_TLS_SESSION_TICKET_KEYS_PARAM
{
    uint SessionTicketKeyCount;
    void* SessionTicketKeys;
}
struct HTTP_SERVICE_CONFIG_SSL_PARAM_EX
{
    HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE ParamType;
    ulong Flags;
    union
    {
        HTTP2_WINDOW_SIZE_PARAM Http2WindowSizeParam;
        HTTP2_SETTINGS_LIMITS_PARAM Http2SettingsLimitsParam;
        HTTP_PERFORMANCE_PARAM HttpPerformanceParam;
        HTTP_TLS_RESTRICTIONS_PARAM HttpTlsRestrictionsParam;
        HTTP_ERROR_HEADERS_PARAM HttpErrorHeadersParam;
        HTTP_TLS_SESSION_TICKET_KEYS_PARAM HttpTlsSessionTicketKeysParam;
    }
}
struct HTTP_SERVICE_CONFIG_SSL_SET
{
    HTTP_SERVICE_CONFIG_SSL_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_SNI_SET
{
    HTTP_SERVICE_CONFIG_SSL_SNI_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_CCS_SET
{
    HTTP_SERVICE_CONFIG_SSL_CCS_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_SET_EX
{
    HTTP_SERVICE_CONFIG_SSL_KEY_EX KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM_EX ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_SNI_SET_EX
{
    HTTP_SERVICE_CONFIG_SSL_SNI_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM_EX ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_CCS_SET_EX
{
    HTTP_SERVICE_CONFIG_SSL_CCS_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_SSL_PARAM_EX ParamDesc;
}
struct HTTP_SERVICE_CONFIG_SSL_QUERY
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_KEY KeyDesc;
    uint dwToken;
}
struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_SNI_KEY KeyDesc;
    uint dwToken;
}
struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_CCS_KEY KeyDesc;
    uint dwToken;
}
struct HTTP_SERVICE_CONFIG_SSL_QUERY_EX
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_KEY_EX KeyDesc;
    uint dwToken;
    HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE ParamType;
}
struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_SNI_KEY KeyDesc;
    uint dwToken;
    HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE ParamType;
}
struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY_EX
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_SSL_CCS_KEY KeyDesc;
    uint dwToken;
    HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE ParamType;
}
struct HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM
{
    ushort AddrLength;
    SOCKADDR* pAddress;
}
struct HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY
{
    uint AddrCount;
    SOCKADDR_STORAGE[1] AddrList;
}
struct HTTP_SERVICE_CONFIG_URLACL_KEY
{
    PWSTR pUrlPrefix;
}
struct HTTP_SERVICE_CONFIG_URLACL_PARAM
{
    PWSTR pStringSecurityDescriptor;
}
struct HTTP_SERVICE_CONFIG_URLACL_SET
{
    HTTP_SERVICE_CONFIG_URLACL_KEY KeyDesc;
    HTTP_SERVICE_CONFIG_URLACL_PARAM ParamDesc;
}
struct HTTP_SERVICE_CONFIG_URLACL_QUERY
{
    HTTP_SERVICE_CONFIG_QUERY_TYPE QueryDesc;
    HTTP_SERVICE_CONFIG_URLACL_KEY KeyDesc;
    uint dwToken;
}
alias HTTP_SERVICE_CONFIG_CACHE_KEY = int;
enum : int
{
    MaxCacheResponseSize = 0x00000000,
    CacheRangeChunkSize  = 0x00000001,
}

struct HTTP_SERVICE_CONFIG_CACHE_SET
{
    HTTP_SERVICE_CONFIG_CACHE_KEY KeyDesc;
    uint ParamDesc;
}
alias HTTP_REQUEST_PROPERTY = int;
enum : int
{
    HttpRequestPropertyIsb            = 0x00000000,
    HttpRequestPropertyTcpInfoV0      = 0x00000001,
    HttpRequestPropertyQuicStats      = 0x00000002,
    HttpRequestPropertyTcpInfoV1      = 0x00000003,
    HttpRequestPropertySni            = 0x00000004,
    HttpRequestPropertyStreamError    = 0x00000005,
    HttpRequestPropertyWskApiTimings  = 0x00000006,
    HttpRequestPropertyQuicApiTimings = 0x00000007,
}

struct HTTP_QUERY_REQUEST_QUALIFIER_TCP
{
    ulong Freshness;
}
struct HTTP_QUERY_REQUEST_QUALIFIER_QUIC
{
    ulong Freshness;
}
struct HTTP_REQUEST_PROPERTY_SNI
{
    wchar[256] Hostname;
    uint Flags;
}
struct HTTP_REQUEST_PROPERTY_STREAM_ERROR
{
    uint ErrorCode;
}
struct HTTP_WSK_API_TIMINGS
{
    ulong ConnectCount;
    ulong ConnectSum;
    ulong DisconnectCount;
    ulong DisconnectSum;
    ulong SendCount;
    ulong SendSum;
    ulong ReceiveCount;
    ulong ReceiveSum;
    ulong ReleaseCount;
    ulong ReleaseSum;
    ulong ControlSocketCount;
    ulong ControlSocketSum;
}
struct HTTP_QUIC_STREAM_API_TIMINGS
{
    ulong OpenCount;
    ulong OpenSum;
    ulong CloseCount;
    ulong CloseSum;
    ulong StartCount;
    ulong StartSum;
    ulong ShutdownCount;
    ulong ShutdownSum;
    ulong SendCount;
    ulong SendSum;
    ulong ReceiveSetEnabledCount;
    ulong ReceiveSetEnabledSum;
    ulong GetParamCount;
    ulong GetParamSum;
    ulong SetParamCount;
    ulong SetParamSum;
    ulong SetCallbackHandlerCount;
    ulong SetCallbackHandlerSum;
}
struct HTTP_QUIC_CONNECTION_API_TIMINGS
{
    ulong OpenTime;
    ulong CloseTime;
    ulong StartTime;
    ulong ShutdownTime;
    ulong SecConfigCreateTime;
    ulong SecConfigDeleteTime;
    ulong GetParamCount;
    ulong GetParamSum;
    ulong SetParamCount;
    ulong SetParamSum;
    ulong SetCallbackHandlerCount;
    ulong SetCallbackHandlerSum;
    HTTP_QUIC_STREAM_API_TIMINGS ControlStreamTimings;
}
struct HTTP_QUIC_API_TIMINGS
{
    HTTP_QUIC_CONNECTION_API_TIMINGS ConnectionTimings;
    HTTP_QUIC_STREAM_API_TIMINGS StreamTimings;
}
struct HTTP_QUIC_STREAM_REQUEST_STATS
{
    ulong StreamWaitStart;
    ulong StreamWaitEnd;
    ulong RequestHeadersCompressionStart;
    ulong RequestHeadersCompressionEnd;
    ulong ResponseHeadersDecompressionStart;
    ulong ResponseHeadersDecompressionEnd;
    ulong RequestHeadersCompressedSize;
    ulong ResponseHeadersCompressedSize;
}
alias HTTP_FEATURE_ID = int;
enum : int
{
    HttpFeatureUnknown          = 0x00000000,
    HttpFeatureResponseTrailers = 0x00000001,
    HttpFeatureApiTimings       = 0x00000002,
    HttpFeatureDelegateEx       = 0x00000003,
    HttpFeatureHttp3            = 0x00000004,
    HttpFeatureLast             = 0x00000005,
    HttpFeaturemax              = 0xffffffff,
}

