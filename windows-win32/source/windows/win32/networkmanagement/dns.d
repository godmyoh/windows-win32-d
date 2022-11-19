module windows.win32.networkmanagement.dns;

import windows.win32.foundation : BOOL, CHAR, HANDLE, PSTR, PWSTR, WIN32_ERROR;

version (Windows):
extern (Windows):

alias DNS_TYPE = ushort;
enum : ushort
{
    DNS_TYPE_ZERO       = 0x0000,
    DNS_TYPE_A          = 0x0001,
    DNS_TYPE_NS         = 0x0002,
    DNS_TYPE_MD         = 0x0003,
    DNS_TYPE_MF         = 0x0004,
    DNS_TYPE_CNAME      = 0x0005,
    DNS_TYPE_SOA        = 0x0006,
    DNS_TYPE_MB         = 0x0007,
    DNS_TYPE_MG         = 0x0008,
    DNS_TYPE_MR         = 0x0009,
    DNS_TYPE_NULL       = 0x000a,
    DNS_TYPE_WKS        = 0x000b,
    DNS_TYPE_PTR        = 0x000c,
    DNS_TYPE_HINFO      = 0x000d,
    DNS_TYPE_MINFO      = 0x000e,
    DNS_TYPE_MX         = 0x000f,
    DNS_TYPE_TEXT       = 0x0010,
    DNS_TYPE_RP         = 0x0011,
    DNS_TYPE_AFSDB      = 0x0012,
    DNS_TYPE_X25        = 0x0013,
    DNS_TYPE_ISDN       = 0x0014,
    DNS_TYPE_RT         = 0x0015,
    DNS_TYPE_NSAP       = 0x0016,
    DNS_TYPE_NSAPPTR    = 0x0017,
    DNS_TYPE_SIG        = 0x0018,
    DNS_TYPE_KEY        = 0x0019,
    DNS_TYPE_PX         = 0x001a,
    DNS_TYPE_GPOS       = 0x001b,
    DNS_TYPE_AAAA       = 0x001c,
    DNS_TYPE_LOC        = 0x001d,
    DNS_TYPE_NXT        = 0x001e,
    DNS_TYPE_EID        = 0x001f,
    DNS_TYPE_NIMLOC     = 0x0020,
    DNS_TYPE_SRV        = 0x0021,
    DNS_TYPE_ATMA       = 0x0022,
    DNS_TYPE_NAPTR      = 0x0023,
    DNS_TYPE_KX         = 0x0024,
    DNS_TYPE_CERT       = 0x0025,
    DNS_TYPE_A6         = 0x0026,
    DNS_TYPE_DNAME      = 0x0027,
    DNS_TYPE_SINK       = 0x0028,
    DNS_TYPE_OPT        = 0x0029,
    DNS_TYPE_DS         = 0x002b,
    DNS_TYPE_RRSIG      = 0x002e,
    DNS_TYPE_NSEC       = 0x002f,
    DNS_TYPE_DNSKEY     = 0x0030,
    DNS_TYPE_DHCID      = 0x0031,
    DNS_TYPE_NSEC3      = 0x0032,
    DNS_TYPE_NSEC3PARAM = 0x0033,
    DNS_TYPE_TLSA       = 0x0034,
    DNS_TYPE_UINFO      = 0x0064,
    DNS_TYPE_UID        = 0x0065,
    DNS_TYPE_GID        = 0x0066,
    DNS_TYPE_UNSPEC     = 0x0067,
    DNS_TYPE_ADDRS      = 0x00f8,
    DNS_TYPE_TKEY       = 0x00f9,
    DNS_TYPE_TSIG       = 0x00fa,
    DNS_TYPE_IXFR       = 0x00fb,
    DNS_TYPE_AXFR       = 0x00fc,
    DNS_TYPE_MAILB      = 0x00fd,
    DNS_TYPE_MAILA      = 0x00fe,
    DNS_TYPE_ALL        = 0x00ff,
    DNS_TYPE_ANY        = 0x00ff,
    DNS_TYPE_WINS       = 0xff01,
    DNS_TYPE_WINSR      = 0xff02,
    DNS_TYPE_NBSTAT     = 0xff02,
}

alias DNS_QUERY_OPTIONS = uint;
enum : uint
{
    DNS_QUERY_STANDARD                  = 0x00000000,
    DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE = 0x00000001,
    DNS_QUERY_USE_TCP_ONLY              = 0x00000002,
    DNS_QUERY_NO_RECURSION              = 0x00000004,
    DNS_QUERY_BYPASS_CACHE              = 0x00000008,
    DNS_QUERY_NO_WIRE_QUERY             = 0x00000010,
    DNS_QUERY_NO_LOCAL_NAME             = 0x00000020,
    DNS_QUERY_NO_HOSTS_FILE             = 0x00000040,
    DNS_QUERY_NO_NETBT                  = 0x00000080,
    DNS_QUERY_WIRE_ONLY                 = 0x00000100,
    DNS_QUERY_RETURN_MESSAGE            = 0x00000200,
    DNS_QUERY_MULTICAST_ONLY            = 0x00000400,
    DNS_QUERY_NO_MULTICAST              = 0x00000800,
    DNS_QUERY_TREAT_AS_FQDN             = 0x00001000,
    DNS_QUERY_ADDRCONFIG                = 0x00002000,
    DNS_QUERY_DUAL_ADDR                 = 0x00004000,
    DNS_QUERY_DONT_RESET_TTL_VALUES     = 0x00100000,
    DNS_QUERY_DISABLE_IDN_ENCODING      = 0x00200000,
    DNS_QUERY_APPEND_MULTILABEL         = 0x00800000,
    DNS_QUERY_DNSSEC_OK                 = 0x01000000,
    DNS_QUERY_DNSSEC_CHECKING_DISABLED  = 0x02000000,
    DNS_QUERY_RESERVED                  = 0xf0000000,
    DNS_QUERY_CACHE_ONLY                = 0x00000010,
    DNS_QUERY_REQUEST_VERSION1          = 0x00000001,
    DNS_QUERY_REQUEST_VERSION2          = 0x00000002,
    DNS_QUERY_RESULTS_VERSION1          = 0x00000001,
    DNS_QUERY_REQUEST_VERSION3          = 0x00000003,
}

int DnsQueryConfig(DNS_CONFIG_TYPE, uint, const(wchar)*, void*, void*, uint*);
DNS_RECORDA* DnsRecordCopyEx(DNS_RECORDA*, DNS_CHARSET, DNS_CHARSET);
DNS_RECORDA* DnsRecordSetCopyEx(DNS_RECORDA*, DNS_CHARSET, DNS_CHARSET);
BOOL DnsRecordCompare(DNS_RECORDA*, DNS_RECORDA*);
BOOL DnsRecordSetCompare(DNS_RECORDA*, DNS_RECORDA*, DNS_RECORDA**, DNS_RECORDA**);
DNS_RECORDA* DnsRecordSetDetach(DNS_RECORDA*);
void DnsFree(void*, DNS_FREE_TYPE);
WIN32_ERROR DnsQuery_A(const(char)*, DNS_TYPE, DNS_QUERY_OPTIONS, void*, DNS_RECORDA**, void**);
WIN32_ERROR DnsQuery_UTF8(const(char)*, DNS_TYPE, DNS_QUERY_OPTIONS, void*, DNS_RECORDA**, void**);
WIN32_ERROR DnsQuery_W(const(wchar)*, DNS_TYPE, DNS_QUERY_OPTIONS, void*, DNS_RECORDA**, void**);
int DnsQueryEx(DNS_QUERY_REQUEST*, DNS_QUERY_RESULT*, DNS_QUERY_CANCEL*);
int DnsCancelQuery(DNS_QUERY_CANCEL*);
void DnsFreeCustomServers(uint*, DNS_CUSTOM_SERVER**);
uint DnsGetApplicationSettings(uint*, DNS_CUSTOM_SERVER**, DNS_APPLICATION_SETTINGS*);
uint DnsSetApplicationSettings(uint, const(DNS_CUSTOM_SERVER)*, const(DNS_APPLICATION_SETTINGS)*);
int DnsAcquireContextHandle_W(uint, void*, DnsContextHandle*);
int DnsAcquireContextHandle_A(uint, void*, DnsContextHandle*);
void DnsReleaseContextHandle(HANDLE);
int DnsModifyRecordsInSet_W(DNS_RECORDA*, DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsModifyRecordsInSet_A(DNS_RECORDA*, DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsModifyRecordsInSet_UTF8(DNS_RECORDA*, DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsReplaceRecordSetW(DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsReplaceRecordSetA(DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsReplaceRecordSetUTF8(DNS_RECORDA*, uint, HANDLE, void*, void*);
int DnsValidateName_W(const(wchar)*, DNS_NAME_FORMAT);
int DnsValidateName_A(const(char)*, DNS_NAME_FORMAT);
int DnsValidateName_UTF8(const(char)*, DNS_NAME_FORMAT);
BOOL DnsNameCompare_A(const(char)*, const(char)*);
BOOL DnsNameCompare_W(const(wchar)*, const(wchar)*);
BOOL DnsWriteQuestionToBuffer_W(DNS_MESSAGE_BUFFER*, uint*, const(wchar)*, ushort, ushort, BOOL);
BOOL DnsWriteQuestionToBuffer_UTF8(DNS_MESSAGE_BUFFER*, uint*, const(char)*, ushort, ushort, BOOL);
int DnsExtractRecordsFromMessage_W(DNS_MESSAGE_BUFFER*, ushort, DNS_RECORDA**);
int DnsExtractRecordsFromMessage_UTF8(DNS_MESSAGE_BUFFER*, ushort, DNS_RECORDA**);
uint DnsGetProxyInformation(const(wchar)*, DNS_PROXY_INFORMATION*, DNS_PROXY_INFORMATION*, DNS_PROXY_COMPLETION_ROUTINE, void*);
void DnsFreeProxyName(PWSTR);
uint DnsConnectionGetProxyInfoForHostUrl(const(wchar)*, ubyte*, uint, uint, DNS_CONNECTION_PROXY_INFO_EX*);
void DnsConnectionFreeProxyInfoEx(DNS_CONNECTION_PROXY_INFO_EX*);
uint DnsConnectionGetProxyInfo(const(wchar)*, DNS_CONNECTION_PROXY_TYPE, DNS_CONNECTION_PROXY_INFO*);
void DnsConnectionFreeProxyInfo(DNS_CONNECTION_PROXY_INFO*);
uint DnsConnectionSetProxyInfo(const(wchar)*, DNS_CONNECTION_PROXY_TYPE, const(DNS_CONNECTION_PROXY_INFO)*);
uint DnsConnectionDeleteProxyInfo(const(wchar)*, DNS_CONNECTION_PROXY_TYPE);
uint DnsConnectionGetProxyList(const(wchar)*, DNS_CONNECTION_PROXY_LIST*);
void DnsConnectionFreeProxyList(DNS_CONNECTION_PROXY_LIST*);
uint DnsConnectionGetNameList(DNS_CONNECTION_NAME_LIST*);
void DnsConnectionFreeNameList(DNS_CONNECTION_NAME_LIST*);
uint DnsConnectionUpdateIfIndexTable(DNS_CONNECTION_IFINDEX_LIST*);
uint DnsConnectionSetPolicyEntries(DNS_CONNECTION_POLICY_TAG, DNS_CONNECTION_POLICY_ENTRY_LIST*);
uint DnsConnectionDeletePolicyEntries(DNS_CONNECTION_POLICY_TAG);
DNS_SERVICE_INSTANCE* DnsServiceConstructInstance(const(wchar)*, const(wchar)*, uint*, IP6_ADDRESS*, ushort, ushort, ushort, uint, PWSTR*, PWSTR*);
DNS_SERVICE_INSTANCE* DnsServiceCopyInstance(DNS_SERVICE_INSTANCE*);
void DnsServiceFreeInstance(DNS_SERVICE_INSTANCE*);
int DnsServiceBrowse(DNS_SERVICE_BROWSE_REQUEST*, DNS_SERVICE_CANCEL*);
int DnsServiceBrowseCancel(DNS_SERVICE_CANCEL*);
int DnsServiceResolve(DNS_SERVICE_RESOLVE_REQUEST*, DNS_SERVICE_CANCEL*);
int DnsServiceResolveCancel(DNS_SERVICE_CANCEL*);
uint DnsServiceRegister(DNS_SERVICE_REGISTER_REQUEST*, DNS_SERVICE_CANCEL*);
uint DnsServiceDeRegister(DNS_SERVICE_REGISTER_REQUEST*, DNS_SERVICE_CANCEL*);
uint DnsServiceRegisterCancel(DNS_SERVICE_CANCEL*);
int DnsStartMulticastQuery(MDNS_QUERY_REQUEST*, MDNS_QUERY_HANDLE*);
int DnsStopMulticastQuery(MDNS_QUERY_HANDLE*);
enum SIZEOF_IP4_ADDRESS = 0x00000004;
enum IP4_ADDRESS_STRING_LENGTH = 0x00000010;
enum IP4_ADDRESS_STRING_BUFFER_LENGTH = 0x00000010;
enum DNS_ADDR_MAX_SOCKADDR_LENGTH = 0x00000020;
enum IP6_ADDRESS_STRING_LENGTH = 0x00000041;
enum IP6_ADDRESS_STRING_BUFFER_LENGTH = 0x00000041;
enum DNS_ADDRESS_STRING_LENGTH = 0x00000041;
enum DNS_PORT_HOST_ORDER = 0x00000035;
enum DNS_PORT_NET_ORDER = 0x00003500;
enum DNS_RFC_MAX_UDP_PACKET_LENGTH = 0x00000200;
enum DNS_MAX_NAME_LENGTH = 0x000000ff;
enum DNS_MAX_LABEL_LENGTH = 0x0000003f;
enum DNS_MAX_NAME_BUFFER_LENGTH = 0x00000100;
enum DNS_MAX_LABEL_BUFFER_LENGTH = 0x00000040;
enum DNS_MAX_IP4_REVERSE_NAME_LENGTH = 0x0000001f;
enum DNS_MAX_IP6_REVERSE_NAME_LENGTH = 0x0000004b;
enum DNS_MAX_REVERSE_NAME_LENGTH = 0x0000004b;
enum DNS_MAX_IP4_REVERSE_NAME_BUFFER_LENGTH = 0x0000001f;
enum DNS_MAX_IP6_REVERSE_NAME_BUFFER_LENGTH = 0x0000004b;
enum DNS_MAX_REVERSE_NAME_BUFFER_LENGTH = 0x0000004b;
enum DNS_MAX_TEXT_STRING_LENGTH = 0x000000ff;
enum DNS_COMPRESSED_QUESTION_NAME = 0x0000c00c;
enum DNS_OPCODE_QUERY = 0x00000000;
enum DNS_OPCODE_IQUERY = 0x00000001;
enum DNS_OPCODE_SERVER_STATUS = 0x00000002;
enum DNS_OPCODE_UNKNOWN = 0x00000003;
enum DNS_OPCODE_NOTIFY = 0x00000004;
enum DNS_OPCODE_UPDATE = 0x00000005;
enum DNS_RCODE_NOERROR = 0x00000000;
enum DNS_RCODE_FORMERR = 0x00000001;
enum DNS_RCODE_SERVFAIL = 0x00000002;
enum DNS_RCODE_NXDOMAIN = 0x00000003;
enum DNS_RCODE_NOTIMPL = 0x00000004;
enum DNS_RCODE_REFUSED = 0x00000005;
enum DNS_RCODE_YXDOMAIN = 0x00000006;
enum DNS_RCODE_YXRRSET = 0x00000007;
enum DNS_RCODE_NXRRSET = 0x00000008;
enum DNS_RCODE_NOTAUTH = 0x00000009;
enum DNS_RCODE_NOTZONE = 0x0000000a;
enum DNS_RCODE_MAX = 0x0000000f;
enum DNS_RCODE_BADVERS = 0x00000010;
enum DNS_RCODE_BADSIG = 0x00000010;
enum DNS_RCODE_BADKEY = 0x00000011;
enum DNS_RCODE_BADTIME = 0x00000012;
enum DNS_RCODE_NO_ERROR = 0x00000000;
enum DNS_RCODE_FORMAT_ERROR = 0x00000001;
enum DNS_RCODE_SERVER_FAILURE = 0x00000002;
enum DNS_RCODE_NAME_ERROR = 0x00000003;
enum DNS_RCODE_NOT_IMPLEMENTED = 0x00000004;
enum DNS_CLASS_INTERNET = 0x00000001;
enum DNS_CLASS_CSNET = 0x00000002;
enum DNS_CLASS_CHAOS = 0x00000003;
enum DNS_CLASS_HESIOD = 0x00000004;
enum DNS_CLASS_NONE = 0x000000fe;
enum DNS_CLASS_ALL = 0x000000ff;
enum DNS_CLASS_ANY = 0x000000ff;
enum DNS_CLASS_UNICAST_RESPONSE = 0x00008000;
enum DNS_RCLASS_INTERNET = 0x00000100;
enum DNS_RCLASS_CSNET = 0x00000200;
enum DNS_RCLASS_CHAOS = 0x00000300;
enum DNS_RCLASS_HESIOD = 0x00000400;
enum DNS_RCLASS_NONE = 0x0000fe00;
enum DNS_RCLASS_ALL = 0x0000ff00;
enum DNS_RCLASS_ANY = 0x0000ff00;
enum DNS_RCLASS_UNICAST_RESPONSE = 0x00000080;
enum DNS_RTYPE_A = 0x00000100;
enum DNS_RTYPE_NS = 0x00000200;
enum DNS_RTYPE_MD = 0x00000300;
enum DNS_RTYPE_MF = 0x00000400;
enum DNS_RTYPE_CNAME = 0x00000500;
enum DNS_RTYPE_SOA = 0x00000600;
enum DNS_RTYPE_MB = 0x00000700;
enum DNS_RTYPE_MG = 0x00000800;
enum DNS_RTYPE_MR = 0x00000900;
enum DNS_RTYPE_NULL = 0x00000a00;
enum DNS_RTYPE_WKS = 0x00000b00;
enum DNS_RTYPE_PTR = 0x00000c00;
enum DNS_RTYPE_HINFO = 0x00000d00;
enum DNS_RTYPE_MINFO = 0x00000e00;
enum DNS_RTYPE_MX = 0x00000f00;
enum DNS_RTYPE_TEXT = 0x00001000;
enum DNS_RTYPE_RP = 0x00001100;
enum DNS_RTYPE_AFSDB = 0x00001200;
enum DNS_RTYPE_X25 = 0x00001300;
enum DNS_RTYPE_ISDN = 0x00001400;
enum DNS_RTYPE_RT = 0x00001500;
enum DNS_RTYPE_NSAP = 0x00001600;
enum DNS_RTYPE_NSAPPTR = 0x00001700;
enum DNS_RTYPE_SIG = 0x00001800;
enum DNS_RTYPE_KEY = 0x00001900;
enum DNS_RTYPE_PX = 0x00001a00;
enum DNS_RTYPE_GPOS = 0x00001b00;
enum DNS_RTYPE_AAAA = 0x00001c00;
enum DNS_RTYPE_LOC = 0x00001d00;
enum DNS_RTYPE_NXT = 0x00001e00;
enum DNS_RTYPE_EID = 0x00001f00;
enum DNS_RTYPE_NIMLOC = 0x00002000;
enum DNS_RTYPE_SRV = 0x00002100;
enum DNS_RTYPE_ATMA = 0x00002200;
enum DNS_RTYPE_NAPTR = 0x00002300;
enum DNS_RTYPE_KX = 0x00002400;
enum DNS_RTYPE_CERT = 0x00002500;
enum DNS_RTYPE_A6 = 0x00002600;
enum DNS_RTYPE_DNAME = 0x00002700;
enum DNS_RTYPE_SINK = 0x00002800;
enum DNS_RTYPE_OPT = 0x00002900;
enum DNS_RTYPE_DS = 0x00002b00;
enum DNS_RTYPE_RRSIG = 0x00002e00;
enum DNS_RTYPE_NSEC = 0x00002f00;
enum DNS_RTYPE_DNSKEY = 0x00003000;
enum DNS_RTYPE_DHCID = 0x00003100;
enum DNS_RTYPE_NSEC3 = 0x00003200;
enum DNS_RTYPE_NSEC3PARAM = 0x00003300;
enum DNS_RTYPE_TLSA = 0x00003400;
enum DNS_RTYPE_UINFO = 0x00006400;
enum DNS_RTYPE_UID = 0x00006500;
enum DNS_RTYPE_GID = 0x00006600;
enum DNS_RTYPE_UNSPEC = 0x00006700;
enum DNS_RTYPE_TKEY = 0x0000f900;
enum DNS_RTYPE_TSIG = 0x0000fa00;
enum DNS_RTYPE_IXFR = 0x0000fb00;
enum DNS_RTYPE_AXFR = 0x0000fc00;
enum DNS_RTYPE_MAILB = 0x0000fd00;
enum DNS_RTYPE_MAILA = 0x0000fe00;
enum DNS_RTYPE_ALL = 0x0000ff00;
enum DNS_RTYPE_ANY = 0x0000ff00;
enum DNS_RTYPE_WINS = 0x000001ff;
enum DNS_RTYPE_WINSR = 0x000002ff;
enum DNS_ATMA_FORMAT_E164 = 0x00000001;
enum DNS_ATMA_FORMAT_AESA = 0x00000002;
enum DNS_ATMA_MAX_ADDR_LENGTH = 0x00000014;
enum DNS_ATMA_AESA_ADDR_LENGTH = 0x00000014;
enum DNS_ATMA_MAX_RECORD_LENGTH = 0x00000015;
enum DNSSEC_ALGORITHM_RSAMD5 = 0x00000001;
enum DNSSEC_ALGORITHM_RSASHA1 = 0x00000005;
enum DNSSEC_ALGORITHM_RSASHA1_NSEC3 = 0x00000007;
enum DNSSEC_ALGORITHM_RSASHA256 = 0x00000008;
enum DNSSEC_ALGORITHM_RSASHA512 = 0x0000000a;
enum DNSSEC_ALGORITHM_ECDSAP256_SHA256 = 0x0000000d;
enum DNSSEC_ALGORITHM_ECDSAP384_SHA384 = 0x0000000e;
enum DNSSEC_ALGORITHM_NULL = 0x000000fd;
enum DNSSEC_ALGORITHM_PRIVATE = 0x000000fe;
enum DNSSEC_DIGEST_ALGORITHM_SHA1 = 0x00000001;
enum DNSSEC_DIGEST_ALGORITHM_SHA256 = 0x00000002;
enum DNSSEC_DIGEST_ALGORITHM_SHA384 = 0x00000004;
enum DNSSEC_PROTOCOL_NONE = 0x00000000;
enum DNSSEC_PROTOCOL_TLS = 0x00000001;
enum DNSSEC_PROTOCOL_EMAIL = 0x00000002;
enum DNSSEC_PROTOCOL_DNSSEC = 0x00000003;
enum DNSSEC_PROTOCOL_IPSEC = 0x00000004;
enum DNSSEC_KEY_FLAG_NOAUTH = 0x00000001;
enum DNSSEC_KEY_FLAG_NOCONF = 0x00000002;
enum DNSSEC_KEY_FLAG_FLAG2 = 0x00000004;
enum DNSSEC_KEY_FLAG_EXTEND = 0x00000008;
enum DNSSEC_KEY_FLAG_FLAG4 = 0x00000010;
enum DNSSEC_KEY_FLAG_FLAG5 = 0x00000020;
enum DNSSEC_KEY_FLAG_USER = 0x00000000;
enum DNSSEC_KEY_FLAG_ZONE = 0x00000040;
enum DNSSEC_KEY_FLAG_HOST = 0x00000080;
enum DNSSEC_KEY_FLAG_NTPE3 = 0x000000c0;
enum DNSSEC_KEY_FLAG_FLAG8 = 0x00000100;
enum DNSSEC_KEY_FLAG_FLAG9 = 0x00000200;
enum DNSSEC_KEY_FLAG_FLAG10 = 0x00000400;
enum DNSSEC_KEY_FLAG_FLAG11 = 0x00000800;
enum DNSSEC_KEY_FLAG_SIG0 = 0x00000000;
enum DNSSEC_KEY_FLAG_SIG1 = 0x00001000;
enum DNSSEC_KEY_FLAG_SIG2 = 0x00002000;
enum DNSSEC_KEY_FLAG_SIG3 = 0x00003000;
enum DNSSEC_KEY_FLAG_SIG4 = 0x00004000;
enum DNSSEC_KEY_FLAG_SIG5 = 0x00005000;
enum DNSSEC_KEY_FLAG_SIG6 = 0x00006000;
enum DNSSEC_KEY_FLAG_SIG7 = 0x00007000;
enum DNSSEC_KEY_FLAG_SIG8 = 0x00008000;
enum DNSSEC_KEY_FLAG_SIG9 = 0x00009000;
enum DNSSEC_KEY_FLAG_SIG10 = 0x0000a000;
enum DNSSEC_KEY_FLAG_SIG11 = 0x0000b000;
enum DNSSEC_KEY_FLAG_SIG12 = 0x0000c000;
enum DNSSEC_KEY_FLAG_SIG13 = 0x0000d000;
enum DNSSEC_KEY_FLAG_SIG14 = 0x0000e000;
enum DNSSEC_KEY_FLAG_SIG15 = 0x0000f000;
enum DNS_TKEY_MODE_SERVER_ASSIGN = 0x00000001;
enum DNS_TKEY_MODE_DIFFIE_HELLMAN = 0x00000002;
enum DNS_TKEY_MODE_GSS = 0x00000003;
enum DNS_TKEY_MODE_RESOLVER_ASSIGN = 0x00000004;
enum DNS_WINS_FLAG_SCOPE = 0x80000000;
enum DNS_WINS_FLAG_LOCAL = 0x00010000;
enum DNS_CONFIG_FLAG_ALLOC = 0x00000001;
enum DNSREC_SECTION = 0x00000003;
enum DNSREC_QUESTION = 0x00000000;
enum DNSREC_ANSWER = 0x00000001;
enum DNSREC_AUTHORITY = 0x00000002;
enum DNSREC_ADDITIONAL = 0x00000003;
enum DNSREC_ZONE = 0x00000000;
enum DNSREC_PREREQ = 0x00000001;
enum DNSREC_UPDATE = 0x00000002;
enum DNSREC_DELETE = 0x00000004;
enum DNSREC_NOEXIST = 0x00000004;
enum DNS_CUSTOM_SERVER_TYPE_UDP = 0x00000001;
enum DNS_CUSTOM_SERVER_TYPE_DOH = 0x00000002;
enum DNS_CUSTOM_SERVER_UDP_FALLBACK = 0x00000001;
enum DNS_APP_SETTINGS_VERSION1 = 0x00000001;
enum DNS_APP_SETTINGS_EXCLUSIVE_SERVERS = 0x00000001;
enum DNS_UPDATE_SECURITY_USE_DEFAULT = 0x00000000;
enum DNS_UPDATE_SECURITY_OFF = 0x00000010;
enum DNS_UPDATE_SECURITY_ON = 0x00000020;
enum DNS_UPDATE_SECURITY_ONLY = 0x00000100;
enum DNS_UPDATE_CACHE_SECURITY_CONTEXT = 0x00000200;
enum DNS_UPDATE_TEST_USE_LOCAL_SYS_ACCT = 0x00000400;
enum DNS_UPDATE_FORCE_SECURITY_NEGO = 0x00000800;
enum DNS_UPDATE_TRY_ALL_MASTER_SERVERS = 0x00001000;
enum DNS_UPDATE_SKIP_NO_UPDATE_ADAPTERS = 0x00002000;
enum DNS_UPDATE_REMOTE_SERVER = 0x00004000;
enum DNS_UPDATE_RESERVED = 0xffff0000;
enum DNS_VALSVR_ERROR_INVALID_ADDR = 0x00000001;
enum DNS_VALSVR_ERROR_INVALID_NAME = 0x00000002;
enum DNS_VALSVR_ERROR_UNREACHABLE = 0x00000003;
enum DNS_VALSVR_ERROR_NO_RESPONSE = 0x00000004;
enum DNS_VALSVR_ERROR_NO_AUTH = 0x00000005;
enum DNS_VALSVR_ERROR_REFUSED = 0x00000006;
enum DNS_VALSVR_ERROR_NO_TCP = 0x00000010;
enum DNS_VALSVR_ERROR_UNKNOWN = 0x000000ff;
enum DNS_CONNECTION_NAME_MAX_LENGTH = 0x00000040;
enum DNS_CONNECTION_PROXY_INFO_CURRENT_VERSION = 0x00000001;
enum DNS_CONNECTION_PROXY_INFO_SERVER_MAX_LENGTH = 0x00000100;
enum DNS_CONNECTION_PROXY_INFO_FRIENDLY_NAME_MAX_LENGTH = 0x00000040;
enum DNS_CONNECTION_PROXY_INFO_USERNAME_MAX_LENGTH = 0x00000080;
enum DNS_CONNECTION_PROXY_INFO_PASSWORD_MAX_LENGTH = 0x00000080;
enum DNS_CONNECTION_PROXY_INFO_EXCEPTION_MAX_LENGTH = 0x00000400;
enum DNS_CONNECTION_PROXY_INFO_EXTRA_INFO_MAX_LENGTH = 0x00000400;
enum DNS_CONNECTION_PROXY_INFO_FLAG_DISABLED = 0x00000001;
enum DNS_CONNECTION_PROXY_INFO_FLAG_BYPASSLOCAL = 0x00000002;
enum DNS_CONNECTION_POLICY_ENTRY_ONDEMAND = 0x00000001;
alias DnsContextHandle = long;
union IP6_ADDRESS
{
    ulong[2] IP6Qword;
    uint[4] IP6Dword;
    ushort[8] IP6Word;
    ubyte[16] IP6Byte;
}
struct IP4_ARRAY
{
    uint AddrCount;
    uint[1] AddrArray;
}
/+ [CONFLICTED] union IP6_ADDRESS
{
    uint[4] IP6Dword;
    ushort[8] IP6Word;
    ubyte[16] IP6Byte;
}
+/
struct DNS_ADDR
{
    CHAR[32] MaxSa;
    union _Data_e__Union
    {
        align (1):
        uint[8] DnsAddrUserDword;
    }
}
struct DNS_ADDR_ARRAY
{
    align (1):
    uint MaxCount;
    uint AddrCount;
    uint Tag;
    ushort Family;
    ushort WordReserved;
    uint Flags;
    uint MatchFlag;
    uint Reserved1;
    uint Reserved2;
    DNS_ADDR[1] AddrArray;
}
struct DNS_HEADER
{
    align (1):
    ushort Xid;
    ubyte _bitfield1;
    ubyte _bitfield2;
    ushort QuestionCount;
    ushort AnswerCount;
    ushort NameServerCount;
    ushort AdditionalCount;
}
struct DNS_HEADER_EXT
{
    align (1):
    ushort _bitfield0;
    ubyte chRcode;
    ubyte chVersion;
}
struct DNS_WIRE_QUESTION
{
    align (1):
    ushort QuestionType;
    ushort QuestionClass;
}
struct DNS_WIRE_RECORD
{
    align (1):
    ushort RecordType;
    ushort RecordClass;
    uint TimeToLive;
    ushort DataLength;
}
alias DNS_CONFIG_TYPE = int;
enum : int
{
    DnsConfigPrimaryDomainName_W                = 0x00000000,
    DnsConfigPrimaryDomainName_A                = 0x00000001,
    DnsConfigPrimaryDomainName_UTF8             = 0x00000002,
    DnsConfigAdapterDomainName_W                = 0x00000003,
    DnsConfigAdapterDomainName_A                = 0x00000004,
    DnsConfigAdapterDomainName_UTF8             = 0x00000005,
    DnsConfigDnsServerList                      = 0x00000006,
    DnsConfigSearchList                         = 0x00000007,
    DnsConfigAdapterInfo                        = 0x00000008,
    DnsConfigPrimaryHostNameRegistrationEnabled = 0x00000009,
    DnsConfigAdapterHostNameRegistrationEnabled = 0x0000000a,
    DnsConfigAddressRegistrationMaxCount        = 0x0000000b,
    DnsConfigHostName_W                         = 0x0000000c,
    DnsConfigHostName_A                         = 0x0000000d,
    DnsConfigHostName_UTF8                      = 0x0000000e,
    DnsConfigFullHostName_W                     = 0x0000000f,
    DnsConfigFullHostName_A                     = 0x00000010,
    DnsConfigFullHostName_UTF8                  = 0x00000011,
    DnsConfigNameServer                         = 0x00000012,
}

struct DNS_A_DATA
{
    uint IpAddress;
}
struct DNS_PTR_DATAW
{
    PWSTR pNameHost;
}
struct DNS_PTR_DATAA
{
    PSTR pNameHost;
}
struct DNS_SOA_DATAW
{
    PWSTR pNamePrimaryServer;
    PWSTR pNameAdministrator;
    uint dwSerialNo;
    uint dwRefresh;
    uint dwRetry;
    uint dwExpire;
    uint dwDefaultTtl;
}
struct DNS_SOA_DATAA
{
    PSTR pNamePrimaryServer;
    PSTR pNameAdministrator;
    uint dwSerialNo;
    uint dwRefresh;
    uint dwRetry;
    uint dwExpire;
    uint dwDefaultTtl;
}
struct DNS_MINFO_DATAW
{
    PWSTR pNameMailbox;
    PWSTR pNameErrorsMailbox;
}
struct DNS_MINFO_DATAA
{
    PSTR pNameMailbox;
    PSTR pNameErrorsMailbox;
}
struct DNS_MX_DATAW
{
    PWSTR pNameExchange;
    ushort wPreference;
    ushort Pad;
}
struct DNS_MX_DATAA
{
    PSTR pNameExchange;
    ushort wPreference;
    ushort Pad;
}
struct DNS_TXT_DATAW
{
    uint dwStringCount;
    PWSTR[1] pStringArray;
}
struct DNS_TXT_DATAA
{
    uint dwStringCount;
    PSTR[1] pStringArray;
}
struct DNS_NULL_DATA
{
    uint dwByteCount;
    ubyte[1] Data;
}
struct DNS_WKS_DATA
{
    uint IpAddress;
    ubyte chProtocol;
    ubyte[1] BitMask;
}
struct DNS_AAAA_DATA
{
    IP6_ADDRESS Ip6Address;
}
struct DNS_SIG_DATAW
{
    ushort wTypeCovered;
    ubyte chAlgorithm;
    ubyte chLabelCount;
    uint dwOriginalTtl;
    uint dwExpiration;
    uint dwTimeSigned;
    ushort wKeyTag;
    ushort wSignatureLength;
    PWSTR pNameSigner;
    ubyte[1] Signature;
}
struct DNS_SIG_DATAA
{
    ushort wTypeCovered;
    ubyte chAlgorithm;
    ubyte chLabelCount;
    uint dwOriginalTtl;
    uint dwExpiration;
    uint dwTimeSigned;
    ushort wKeyTag;
    ushort wSignatureLength;
    PSTR pNameSigner;
    ubyte[1] Signature;
}
struct DNS_KEY_DATA
{
    ushort wFlags;
    ubyte chProtocol;
    ubyte chAlgorithm;
    ushort wKeyLength;
    ushort wPad;
    ubyte[1] Key;
}
struct DNS_DHCID_DATA
{
    uint dwByteCount;
    ubyte[1] DHCID;
}
struct DNS_NSEC_DATAW
{
    PWSTR pNextDomainName;
    ushort wTypeBitMapsLength;
    ushort wPad;
    ubyte[1] TypeBitMaps;
}
struct DNS_NSEC_DATAA
{
    PSTR pNextDomainName;
    ushort wTypeBitMapsLength;
    ushort wPad;
    ubyte[1] TypeBitMaps;
}
struct DNS_NSEC3_DATA
{
    ubyte chAlgorithm;
    ubyte bFlags;
    ushort wIterations;
    ubyte bSaltLength;
    ubyte bHashLength;
    ushort wTypeBitMapsLength;
    ubyte[1] chData;
}
struct DNS_NSEC3PARAM_DATA
{
    ubyte chAlgorithm;
    ubyte bFlags;
    ushort wIterations;
    ubyte bSaltLength;
    ubyte[3] bPad;
    ubyte[1] pbSalt;
}
struct DNS_TLSA_DATA
{
    ubyte bCertUsage;
    ubyte bSelector;
    ubyte bMatchingType;
    ushort bCertificateAssociationDataLength;
    ubyte[3] bPad;
    ubyte[1] bCertificateAssociationData;
}
struct DNS_DS_DATA
{
    ushort wKeyTag;
    ubyte chAlgorithm;
    ubyte chDigestType;
    ushort wDigestLength;
    ushort wPad;
    ubyte[1] Digest;
}
struct DNS_OPT_DATA
{
    ushort wDataLength;
    ushort wPad;
    ubyte[1] Data;
}
struct DNS_LOC_DATA
{
    ushort wVersion;
    ushort wSize;
    ushort wHorPrec;
    ushort wVerPrec;
    uint dwLatitude;
    uint dwLongitude;
    uint dwAltitude;
}
struct DNS_NXT_DATAW
{
    PWSTR pNameNext;
    ushort wNumTypes;
    ushort[1] wTypes;
}
struct DNS_NXT_DATAA
{
    PSTR pNameNext;
    ushort wNumTypes;
    ushort[1] wTypes;
}
struct DNS_SRV_DATAW
{
    PWSTR pNameTarget;
    ushort wPriority;
    ushort wWeight;
    ushort wPort;
    ushort Pad;
}
struct DNS_SRV_DATAA
{
    PSTR pNameTarget;
    ushort wPriority;
    ushort wWeight;
    ushort wPort;
    ushort Pad;
}
struct DNS_NAPTR_DATAW
{
    ushort wOrder;
    ushort wPreference;
    PWSTR pFlags;
    PWSTR pService;
    PWSTR pRegularExpression;
    PWSTR pReplacement;
}
struct DNS_NAPTR_DATAA
{
    ushort wOrder;
    ushort wPreference;
    PSTR pFlags;
    PSTR pService;
    PSTR pRegularExpression;
    PSTR pReplacement;
}
struct DNS_ATMA_DATA
{
    ubyte AddressType;
    ubyte[20] Address;
}
struct DNS_TKEY_DATAW
{
    PWSTR pNameAlgorithm;
    ubyte* pAlgorithmPacket;
    ubyte* pKey;
    ubyte* pOtherData;
    uint dwCreateTime;
    uint dwExpireTime;
    ushort wMode;
    ushort wError;
    ushort wKeyLength;
    ushort wOtherLength;
    ubyte cAlgNameLength;
    BOOL bPacketPointers;
}
struct DNS_TKEY_DATAA
{
    PSTR pNameAlgorithm;
    ubyte* pAlgorithmPacket;
    ubyte* pKey;
    ubyte* pOtherData;
    uint dwCreateTime;
    uint dwExpireTime;
    ushort wMode;
    ushort wError;
    ushort wKeyLength;
    ushort wOtherLength;
    ubyte cAlgNameLength;
    BOOL bPacketPointers;
}
struct DNS_TSIG_DATAW
{
    PWSTR pNameAlgorithm;
    ubyte* pAlgorithmPacket;
    ubyte* pSignature;
    ubyte* pOtherData;
    long i64CreateTime;
    ushort wFudgeTime;
    ushort wOriginalXid;
    ushort wError;
    ushort wSigLength;
    ushort wOtherLength;
    ubyte cAlgNameLength;
    BOOL bPacketPointers;
}
struct DNS_TSIG_DATAA
{
    PSTR pNameAlgorithm;
    ubyte* pAlgorithmPacket;
    ubyte* pSignature;
    ubyte* pOtherData;
    long i64CreateTime;
    ushort wFudgeTime;
    ushort wOriginalXid;
    ushort wError;
    ushort wSigLength;
    ushort wOtherLength;
    ubyte cAlgNameLength;
    BOOL bPacketPointers;
}
struct DNS_UNKNOWN_DATA
{
    uint dwByteCount;
    ubyte[1] bData;
}
struct DNS_WINS_DATA
{
    uint dwMappingFlag;
    uint dwLookupTimeout;
    uint dwCacheTimeout;
    uint cWinsServerCount;
    uint[1] WinsServers;
}
struct DNS_WINSR_DATAW
{
    uint dwMappingFlag;
    uint dwLookupTimeout;
    uint dwCacheTimeout;
    PWSTR pNameResultDomain;
}
struct DNS_WINSR_DATAA
{
    uint dwMappingFlag;
    uint dwLookupTimeout;
    uint dwCacheTimeout;
    PSTR pNameResultDomain;
}
struct DNS_RECORD_FLAGS
{
    uint _bitfield0;
}
alias DNS_SECTION = int;
enum : int
{
    DnsSectionQuestion  = 0x00000000,
    DnsSectionAnswer    = 0x00000001,
    DnsSectionAuthority = 0x00000002,
    DnsSectionAddtional = 0x00000003,
}

struct DNS_RECORDW
{
    DNS_RECORDW* pNext;
    PWSTR pName;
    ushort wType;
    ushort wDataLength;
    union _Flags_e__Union
    {
        uint DW;
        DNS_RECORD_FLAGS S;
    }
    uint dwTtl;
    uint dwReserved;
    union _Data_e__Union
    {
        DNS_A_DATA A;
        DNS_SOA_DATAW SOA;
        DNS_SOA_DATAW Soa;
        DNS_PTR_DATAW PTR;
        DNS_PTR_DATAW Ptr;
        DNS_PTR_DATAW NS;
        DNS_PTR_DATAW Ns;
        DNS_PTR_DATAW CNAME;
        DNS_PTR_DATAW Cname;
        DNS_PTR_DATAW DNAME;
        DNS_PTR_DATAW Dname;
        DNS_PTR_DATAW MB;
        DNS_PTR_DATAW Mb;
        DNS_PTR_DATAW MD;
        DNS_PTR_DATAW Md;
        DNS_PTR_DATAW MF;
        DNS_PTR_DATAW Mf;
        DNS_PTR_DATAW MG;
        DNS_PTR_DATAW Mg;
        DNS_PTR_DATAW MR;
        DNS_PTR_DATAW Mr;
        DNS_MINFO_DATAW MINFO;
        DNS_MINFO_DATAW Minfo;
        DNS_MINFO_DATAW RP;
        DNS_MINFO_DATAW Rp;
        DNS_MX_DATAW MX;
        DNS_MX_DATAW Mx;
        DNS_MX_DATAW AFSDB;
        DNS_MX_DATAW Afsdb;
        DNS_MX_DATAW RT;
        DNS_MX_DATAW Rt;
        DNS_TXT_DATAW HINFO;
        DNS_TXT_DATAW Hinfo;
        DNS_TXT_DATAW ISDN;
        DNS_TXT_DATAW Isdn;
        DNS_TXT_DATAW TXT;
        DNS_TXT_DATAW Txt;
        DNS_TXT_DATAW X25;
        DNS_NULL_DATA Null;
        DNS_WKS_DATA WKS;
        DNS_WKS_DATA Wks;
        DNS_AAAA_DATA AAAA;
        DNS_KEY_DATA KEY;
        DNS_KEY_DATA Key;
        DNS_SIG_DATAW SIG;
        DNS_SIG_DATAW Sig;
        DNS_ATMA_DATA ATMA;
        DNS_ATMA_DATA Atma;
        DNS_NXT_DATAW NXT;
        DNS_NXT_DATAW Nxt;
        DNS_SRV_DATAW SRV;
        DNS_SRV_DATAW Srv;
        DNS_NAPTR_DATAW NAPTR;
        DNS_NAPTR_DATAW Naptr;
        DNS_OPT_DATA OPT;
        DNS_OPT_DATA Opt;
        DNS_DS_DATA DS;
        DNS_DS_DATA Ds;
        DNS_SIG_DATAW RRSIG;
        DNS_SIG_DATAW Rrsig;
        DNS_NSEC_DATAW NSEC;
        DNS_NSEC_DATAW Nsec;
        DNS_KEY_DATA DNSKEY;
        DNS_KEY_DATA Dnskey;
        DNS_TKEY_DATAW TKEY;
        DNS_TKEY_DATAW Tkey;
        DNS_TSIG_DATAW TSIG;
        DNS_TSIG_DATAW Tsig;
        DNS_WINS_DATA WINS;
        DNS_WINS_DATA Wins;
        DNS_WINSR_DATAW WINSR;
        DNS_WINSR_DATAW WinsR;
        DNS_WINSR_DATAW NBSTAT;
        DNS_WINSR_DATAW Nbstat;
        DNS_DHCID_DATA DHCID;
        DNS_NSEC3_DATA NSEC3;
        DNS_NSEC3_DATA Nsec3;
        DNS_NSEC3PARAM_DATA NSEC3PARAM;
        DNS_NSEC3PARAM_DATA Nsec3Param;
        DNS_TLSA_DATA TLSA;
        DNS_TLSA_DATA Tlsa;
        DNS_UNKNOWN_DATA UNKNOWN;
        DNS_UNKNOWN_DATA Unknown;
        ubyte* pDataPtr;
    }
}
struct DNS_RECORD_OPTW
{
    DNS_RECORDW* pNext;
    PWSTR pName;
    ushort wType;
    ushort wDataLength;
    union _Flags_e__Union
    {
        uint DW;
        DNS_RECORD_FLAGS S;
    }
    DNS_HEADER_EXT ExtHeader;
    ushort wPayloadSize;
    ushort wReserved;
    union _Data_e__Union
    {
        DNS_OPT_DATA OPT;
        DNS_OPT_DATA Opt;
    }
}
struct DNS_RECORDA
{
    DNS_RECORDA* pNext;
    PSTR pName;
    ushort wType;
    ushort wDataLength;
    union _Flags_e__Union
    {
        uint DW;
        DNS_RECORD_FLAGS S;
    }
    uint dwTtl;
    uint dwReserved;
    union _Data_e__Union
    {
        DNS_A_DATA A;
        DNS_SOA_DATAA SOA;
        DNS_SOA_DATAA Soa;
        DNS_PTR_DATAA PTR;
        DNS_PTR_DATAA Ptr;
        DNS_PTR_DATAA NS;
        DNS_PTR_DATAA Ns;
        DNS_PTR_DATAA CNAME;
        DNS_PTR_DATAA Cname;
        DNS_PTR_DATAA DNAME;
        DNS_PTR_DATAA Dname;
        DNS_PTR_DATAA MB;
        DNS_PTR_DATAA Mb;
        DNS_PTR_DATAA MD;
        DNS_PTR_DATAA Md;
        DNS_PTR_DATAA MF;
        DNS_PTR_DATAA Mf;
        DNS_PTR_DATAA MG;
        DNS_PTR_DATAA Mg;
        DNS_PTR_DATAA MR;
        DNS_PTR_DATAA Mr;
        DNS_MINFO_DATAA MINFO;
        DNS_MINFO_DATAA Minfo;
        DNS_MINFO_DATAA RP;
        DNS_MINFO_DATAA Rp;
        DNS_MX_DATAA MX;
        DNS_MX_DATAA Mx;
        DNS_MX_DATAA AFSDB;
        DNS_MX_DATAA Afsdb;
        DNS_MX_DATAA RT;
        DNS_MX_DATAA Rt;
        DNS_TXT_DATAA HINFO;
        DNS_TXT_DATAA Hinfo;
        DNS_TXT_DATAA ISDN;
        DNS_TXT_DATAA Isdn;
        DNS_TXT_DATAA TXT;
        DNS_TXT_DATAA Txt;
        DNS_TXT_DATAA X25;
        DNS_NULL_DATA Null;
        DNS_WKS_DATA WKS;
        DNS_WKS_DATA Wks;
        DNS_AAAA_DATA AAAA;
        DNS_KEY_DATA KEY;
        DNS_KEY_DATA Key;
        DNS_SIG_DATAA SIG;
        DNS_SIG_DATAA Sig;
        DNS_ATMA_DATA ATMA;
        DNS_ATMA_DATA Atma;
        DNS_NXT_DATAA NXT;
        DNS_NXT_DATAA Nxt;
        DNS_SRV_DATAA SRV;
        DNS_SRV_DATAA Srv;
        DNS_NAPTR_DATAA NAPTR;
        DNS_NAPTR_DATAA Naptr;
        DNS_OPT_DATA OPT;
        DNS_OPT_DATA Opt;
        DNS_DS_DATA DS;
        DNS_DS_DATA Ds;
        DNS_SIG_DATAA RRSIG;
        DNS_SIG_DATAA Rrsig;
        DNS_NSEC_DATAA NSEC;
        DNS_NSEC_DATAA Nsec;
        DNS_KEY_DATA DNSKEY;
        DNS_KEY_DATA Dnskey;
        DNS_TKEY_DATAA TKEY;
        DNS_TKEY_DATAA Tkey;
        DNS_TSIG_DATAA TSIG;
        DNS_TSIG_DATAA Tsig;
        DNS_WINS_DATA WINS;
        DNS_WINS_DATA Wins;
        DNS_WINSR_DATAA WINSR;
        DNS_WINSR_DATAA WinsR;
        DNS_WINSR_DATAA NBSTAT;
        DNS_WINSR_DATAA Nbstat;
        DNS_DHCID_DATA DHCID;
        DNS_NSEC3_DATA NSEC3;
        DNS_NSEC3_DATA Nsec3;
        DNS_NSEC3PARAM_DATA NSEC3PARAM;
        DNS_NSEC3PARAM_DATA Nsec3Param;
        DNS_TLSA_DATA TLSA;
        DNS_TLSA_DATA Tlsa;
        DNS_UNKNOWN_DATA UNKNOWN;
        DNS_UNKNOWN_DATA Unknown;
        ubyte* pDataPtr;
    }
}
struct _DnsRecordOptA
{
    DNS_RECORDA* pNext;
    PSTR pName;
    ushort wType;
    ushort wDataLength;
    union _Flags_e__Union
    {
        uint DW;
        DNS_RECORD_FLAGS S;
    }
    DNS_HEADER_EXT ExtHeader;
    ushort wPayloadSize;
    ushort wReserved;
    union _Data_e__Union
    {
        DNS_OPT_DATA OPT;
        DNS_OPT_DATA Opt;
    }
}
struct DNS_RRSET
{
    DNS_RECORDA* pFirstRR;
    DNS_RECORDA* pLastRR;
}
alias DNS_PROXY_COMPLETION_ROUTINE = void function(void*, int);
alias DNS_PROXY_INFORMATION_TYPE = int;
enum : int
{
    DNS_PROXY_INFORMATION_DIRECT           = 0x00000000,
    DNS_PROXY_INFORMATION_DEFAULT_SETTINGS = 0x00000001,
    DNS_PROXY_INFORMATION_PROXY_NAME       = 0x00000002,
    DNS_PROXY_INFORMATION_DOES_NOT_EXIST   = 0x00000003,
}

struct DNS_PROXY_INFORMATION
{
    uint version_;
    DNS_PROXY_INFORMATION_TYPE proxyInformationType;
    PWSTR proxyName;
}
alias DNS_CHARSET = int;
enum : int
{
    DnsCharSetUnknown = 0x00000000,
    DnsCharSetUnicode = 0x00000001,
    DnsCharSetUtf8    = 0x00000002,
    DnsCharSetAnsi    = 0x00000003,
}

alias DNS_FREE_TYPE = int;
enum : int
{
    DnsFreeFlat                = 0x00000000,
    DnsFreeRecordList          = 0x00000001,
    DnsFreeParsedMessageFields = 0x00000002,
}

struct DNS_QUERY_RESULT
{
    uint Version;
    int QueryStatus;
    ulong QueryOptions;
    DNS_RECORDA* pQueryRecords;
    void* Reserved;
}
alias PDNS_QUERY_COMPLETION_ROUTINE = void function(void*, DNS_QUERY_RESULT*);
struct DNS_QUERY_REQUEST
{
    uint Version;
    const(wchar)* QueryName;
    ushort QueryType;
    ulong QueryOptions;
    DNS_ADDR_ARRAY* pDnsServerList;
    uint InterfaceIndex;
    PDNS_QUERY_COMPLETION_ROUTINE pQueryCompletionCallback;
    void* pQueryContext;
}
struct DNS_QUERY_CANCEL
{
    CHAR[32] Reserved;
}
struct DNS_CUSTOM_SERVER
{
    uint dwServerType;
    ulong ullFlags;
    union
    {
        PWSTR pwszTemplate;
    }
    union
    {
        CHAR[32] MaxSa;
    }
}
struct DNS_QUERY_REQUEST3
{
    uint Version;
    const(wchar)* QueryName;
    ushort QueryType;
    ulong QueryOptions;
    DNS_ADDR_ARRAY* pDnsServerList;
    uint InterfaceIndex;
    PDNS_QUERY_COMPLETION_ROUTINE pQueryCompletionCallback;
    void* pQueryContext;
    BOOL IsNetworkQueryRequired;
    uint RequiredNetworkIndex;
    uint cCustomServers;
    DNS_CUSTOM_SERVER* pCustomServers;
}
struct DNS_APPLICATION_SETTINGS
{
    uint Version;
    ulong Flags;
}
alias DNS_NAME_FORMAT = int;
enum : int
{
    DnsNameDomain        = 0x00000000,
    DnsNameDomainLabel   = 0x00000001,
    DnsNameHostnameFull  = 0x00000002,
    DnsNameHostnameLabel = 0x00000003,
    DnsNameWildcard      = 0x00000004,
    DnsNameSrvRecord     = 0x00000005,
    DnsNameValidateTld   = 0x00000006,
}

struct DNS_MESSAGE_BUFFER
{
    DNS_HEADER MessageHead;
    CHAR[1] MessageBody;
}
alias DNS_CONNECTION_PROXY_TYPE = int;
enum : int
{
    DNS_CONNECTION_PROXY_TYPE_NULL   = 0x00000000,
    DNS_CONNECTION_PROXY_TYPE_HTTP   = 0x00000001,
    DNS_CONNECTION_PROXY_TYPE_WAP    = 0x00000002,
    DNS_CONNECTION_PROXY_TYPE_SOCKS4 = 0x00000004,
    DNS_CONNECTION_PROXY_TYPE_SOCKS5 = 0x00000005,
}

alias DNS_CONNECTION_PROXY_INFO_SWITCH = int;
enum : int
{
    DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG = 0x00000000,
    DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT = 0x00000001,
    DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD   = 0x00000002,
}

struct DNS_CONNECTION_PROXY_INFO
{
    uint Version;
    PWSTR pwszFriendlyName;
    uint Flags;
    DNS_CONNECTION_PROXY_INFO_SWITCH Switch;
    union
    {
        struct _DNS_CONNECTION_PROXY_INFO_CONFIG
        {
            PWSTR pwszServer;
            PWSTR pwszUsername;
            PWSTR pwszPassword;
            PWSTR pwszException;
            PWSTR pwszExtraInfo;
            ushort Port;
        }
        struct _DNS_CONNECTION_PROXY_INFO_SCRIPT
        {
            PWSTR pwszScript;
            PWSTR pwszUsername;
            PWSTR pwszPassword;
        }
    }
}
struct DNS_CONNECTION_PROXY_INFO_EX
{
    DNS_CONNECTION_PROXY_INFO ProxyInfo;
    uint dwInterfaceIndex;
    PWSTR pwszConnectionName;
    BOOL fDirectConfiguration;
    HANDLE hConnection;
}
struct DNS_CONNECTION_PROXY_ELEMENT
{
    DNS_CONNECTION_PROXY_TYPE Type;
    DNS_CONNECTION_PROXY_INFO Info;
}
struct DNS_CONNECTION_PROXY_LIST
{
    uint cProxies;
    DNS_CONNECTION_PROXY_ELEMENT* pProxies;
}
struct DNS_CONNECTION_NAME
{
    wchar[65] wszName;
}
struct DNS_CONNECTION_NAME_LIST
{
    uint cNames;
    DNS_CONNECTION_NAME* pNames;
}
struct DNS_CONNECTION_IFINDEX_ENTRY
{
    const(wchar)* pwszConnectionName;
    uint dwIfIndex;
}
struct DNS_CONNECTION_IFINDEX_LIST
{
    DNS_CONNECTION_IFINDEX_ENTRY* pConnectionIfIndexEntries;
    uint nEntries;
}
struct DNS_CONNECTION_POLICY_ENTRY
{
    const(wchar)* pwszHost;
    const(wchar)* pwszAppId;
    uint cbAppSid;
    ubyte* pbAppSid;
    uint nConnections;
    PWSTR* ppwszConnections;
    uint dwPolicyEntryFlags;
}
struct DNS_CONNECTION_POLICY_ENTRY_LIST
{
    DNS_CONNECTION_POLICY_ENTRY* pPolicyEntries;
    uint nEntries;
}
alias DNS_CONNECTION_POLICY_TAG = int;
enum : int
{
    TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT            = 0x00000000,
    TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER = 0x00000001,
    TAG_DNS_CONNECTION_POLICY_TAG_WWWPT              = 0x00000002,
}

struct DNS_SERVICE_INSTANCE
{
    PWSTR pszInstanceName;
    PWSTR pszHostName;
    uint* ip4Address;
    IP6_ADDRESS* ip6Address;
    ushort wPort;
    ushort wPriority;
    ushort wWeight;
    uint dwPropertyCount;
    PWSTR* keys;
    PWSTR* values;
    uint dwInterfaceIndex;
}
struct DNS_SERVICE_CANCEL
{
    void* reserved;
}
alias PDNS_SERVICE_BROWSE_CALLBACK = void function(uint, void*, DNS_RECORDW*);
struct DNS_SERVICE_BROWSE_REQUEST
{
    uint Version;
    uint InterfaceIndex;
    const(wchar)* QueryName;
    union
    {
        PDNS_SERVICE_BROWSE_CALLBACK pBrowseCallback;
        PDNS_QUERY_COMPLETION_ROUTINE pBrowseCallbackV2;
    }
    void* pQueryContext;
}
alias PDNS_SERVICE_RESOLVE_COMPLETE = void function(uint, void*, DNS_SERVICE_INSTANCE*);
struct DNS_SERVICE_RESOLVE_REQUEST
{
    uint Version;
    uint InterfaceIndex;
    PWSTR QueryName;
    PDNS_SERVICE_RESOLVE_COMPLETE pResolveCompletionCallback;
    void* pQueryContext;
}
alias PDNS_SERVICE_REGISTER_COMPLETE = void function(uint, void*, DNS_SERVICE_INSTANCE*);
struct DNS_SERVICE_REGISTER_REQUEST
{
    uint Version;
    uint InterfaceIndex;
    DNS_SERVICE_INSTANCE* pServiceInstance;
    PDNS_SERVICE_REGISTER_COMPLETE pRegisterCompletionCallback;
    void* pQueryContext;
    HANDLE hCredentials;
    BOOL unicastEnabled;
}
struct MDNS_QUERY_HANDLE
{
    wchar[256] nameBuf;
    ushort wType;
    void* pSubscription;
    void* pWnfCallbackParams;
    uint[2] stateNameData;
}
alias PMDNS_QUERY_CALLBACK = void function(void*, MDNS_QUERY_HANDLE*, DNS_QUERY_RESULT*);
struct MDNS_QUERY_REQUEST
{
    uint Version;
    uint ulRefCount;
    const(wchar)* Query;
    ushort QueryType;
    ulong QueryOptions;
    uint InterfaceIndex;
    PMDNS_QUERY_CALLBACK pQueryCallback;
    void* pQueryContext;
    BOOL fAnswerReceived;
    uint ulResendCount;
}
