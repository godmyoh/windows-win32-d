module windows.win32.devices.webservicesondevices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;
import windows.win32.networking.winsock : SOCKADDR_STORAGE;
import windows.win32.security.cryptography_ : CERT_CONTEXT, HCERTSTORE;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT WSDCreateUdpMessageParameters(IWSDUdpMessageParameters*);
HRESULT WSDCreateUdpAddress(IWSDUdpAddress*);
HRESULT WSDCreateHttpMessageParameters(IWSDHttpMessageParameters*);
HRESULT WSDCreateHttpAddress(IWSDHttpAddress*);
HRESULT WSDCreateOutboundAttachment(IWSDOutboundAttachment*);
HRESULT WSDXMLGetNameFromBuiltinNamespace(const(wchar)*, const(wchar)*, WSDXML_NAME**);
HRESULT WSDXMLCreateContext(IWSDXMLContext*);
HRESULT WSDCreateDiscoveryProvider(IWSDXMLContext, IWSDiscoveryProvider*);
HRESULT WSDCreateDiscoveryProvider2(IWSDXMLContext, WSD_CONFIG_PARAM*, uint, IWSDiscoveryProvider*);
HRESULT WSDCreateDiscoveryPublisher(IWSDXMLContext, IWSDiscoveryPublisher*);
HRESULT WSDCreateDiscoveryPublisher2(IWSDXMLContext, WSD_CONFIG_PARAM*, uint, IWSDiscoveryPublisher*);
HRESULT WSDCreateDeviceProxy(const(wchar)*, const(wchar)*, IWSDXMLContext, IWSDDeviceProxy*);
HRESULT WSDCreateDeviceProxyAdvanced(const(wchar)*, IWSDAddress, const(wchar)*, IWSDXMLContext, IWSDDeviceProxy*);
HRESULT WSDCreateDeviceProxy2(const(wchar)*, const(wchar)*, IWSDXMLContext, WSD_CONFIG_PARAM*, uint, IWSDDeviceProxy*);
HRESULT WSDCreateDeviceHost(const(wchar)*, IWSDXMLContext, IWSDDeviceHost*);
HRESULT WSDCreateDeviceHostAdvanced(const(wchar)*, IWSDXMLContext, IWSDAddress*, uint, IWSDDeviceHost*);
HRESULT WSDCreateDeviceHost2(const(wchar)*, IWSDXMLContext, WSD_CONFIG_PARAM*, uint, IWSDDeviceHost*);
HRESULT WSDSetConfigurationOption(uint, void*, uint);
HRESULT WSDGetConfigurationOption(uint, void*, uint);
void* WSDAllocateLinkedMemory(void*, ulong);
void WSDFreeLinkedMemory(void*);
void WSDAttachLinkedMemory(void*, void*);
void WSDDetachLinkedMemory(void*);
HRESULT WSDXMLBuildAnyForSingleElement(WSDXML_NAME*, const(wchar)*, WSDXML_ELEMENT**);
HRESULT WSDXMLGetValueFromAny(const(wchar)*, const(wchar)*, WSDXML_ELEMENT*, const(wchar)**);
HRESULT WSDXMLAddSibling(WSDXML_ELEMENT*, WSDXML_ELEMENT*);
HRESULT WSDXMLAddChild(WSDXML_ELEMENT*, WSDXML_ELEMENT*);
HRESULT WSDXMLCleanupElement(WSDXML_ELEMENT*);
HRESULT WSDGenerateFault(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IWSDXMLContext, WSD_SOAP_FAULT**);
HRESULT WSDGenerateFaultEx(WSDXML_NAME*, WSDXML_NAME*, WSD_LOCALIZED_STRING_LIST*, const(wchar)*, WSD_SOAP_FAULT**);
HRESULT WSDUriEncode(const(wchar)*, uint, PWSTR*, uint*);
HRESULT WSDUriDecode(const(wchar)*, uint, PWSTR*, uint*);
enum WSD_DEFAULT_HOSTING_ADDRESS = "http://*:5357/";
enum WSD_DEFAULT_SECURE_HOSTING_ADDRESS = "https://*:5358/";
enum WSD_DEFAULT_EVENTING_ADDRESS = "http://*:5357/";
enum WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE = 0x00000001;
enum WSDAPI_OPTION_TRACE_XML_TO_DEBUGGER = 0x00000002;
enum WSDAPI_OPTION_TRACE_XML_TO_FILE = 0x00000003;
enum WSDAPI_SSL_CERT_APPLY_DEFAULT_CHECKS = 0x00000000;
enum WSDAPI_SSL_CERT_IGNORE_REVOCATION = 0x00000001;
enum WSDAPI_SSL_CERT_IGNORE_EXPIRY = 0x00000002;
enum WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE = 0x00000004;
enum WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA = 0x00000008;
enum WSDAPI_SSL_CERT_IGNORE_INVALID_CN = 0x00000010;
enum WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES = 0x00000001;
enum WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE = 0x00000001;
enum WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM = 0x00000002;
enum WSDAPI_ADDRESSFAMILY_IPV4 = 0x00000001;
enum WSDAPI_ADDRESSFAMILY_IPV6 = 0x00000002;
alias WSD_CONFIG_PARAM_TYPE = int;
enum : int
{
    WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE                  = 0x00000001,
    WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE                 = 0x00000002,
    WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH                = 0x00000003,
    WSD_SECURITY_SSL_SERVER_CERT_VALIDATION              = 0x00000004,
    WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION              = 0x00000005,
    WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT               = 0x00000006,
    WSD_SECURITY_COMPACTSIG_SIGNING_CERT                 = 0x00000007,
    WSD_SECURITY_COMPACTSIG_VALIDATION                   = 0x00000008,
    WSD_CONFIG_HOSTING_ADDRESSES                         = 0x00000009,
    WSD_CONFIG_DEVICE_ADDRESSES                          = 0x0000000a,
    WSD_SECURITY_REQUIRE_HTTP_CLIENT_AUTH                = 0x0000000b,
    WSD_SECURITY_REQUIRE_CLIENT_CERT_OR_HTTP_CLIENT_AUTH = 0x0000000c,
    WSD_SECURITY_USE_HTTP_CLIENT_AUTH                    = 0x0000000d,
}

struct WSD_CONFIG_PARAM
{
    WSD_CONFIG_PARAM_TYPE configParamType;
    void* pConfigData;
    uint dwConfigDataSize;
}
struct WSD_SECURITY_CERT_VALIDATION_V1
{
    CERT_CONTEXT** certMatchArray;
    uint dwCertMatchArrayCount;
    HCERTSTORE hCertMatchStore;
    HCERTSTORE hCertIssuerStore;
    uint dwCertCheckOptions;
}
struct WSD_SECURITY_CERT_VALIDATION
{
    CERT_CONTEXT** certMatchArray;
    uint dwCertMatchArrayCount;
    HCERTSTORE hCertMatchStore;
    HCERTSTORE hCertIssuerStore;
    uint dwCertCheckOptions;
    const(wchar)* pszCNGHashAlgId;
    ubyte* pbCertHash;
    uint dwCertHashSize;
}
struct WSD_SECURITY_SIGNATURE_VALIDATION
{
    CERT_CONTEXT** signingCertArray;
    uint dwSigningCertArrayCount;
    HCERTSTORE hSigningCertStore;
    uint dwFlags;
}
struct WSD_CONFIG_ADDRESSES
{
    IWSDAddress* addresses;
    uint dwAddressCount;
}
enum IID_IWSDAddress = GUID(0xb9574c6c, 0x12a6, 0x4f74, [0x93, 0xa1, 0x33, 0x18, 0xff, 0x60, 0x57, 0x59]);
interface IWSDAddress : IUnknown
{
    HRESULT Serialize(PWSTR, uint, BOOL);
    HRESULT Deserialize(const(wchar)*);
}
enum IID_IWSDTransportAddress = GUID(0x70d23498, 0x4ee6, 0x4340, [0xa3, 0xdf, 0xd8, 0x45, 0xd2, 0x23, 0x54, 0x67]);
interface IWSDTransportAddress : IWSDAddress
{
    HRESULT GetPort(ushort*);
    HRESULT SetPort(ushort);
    HRESULT GetTransportAddress(const(wchar)**);
    HRESULT GetTransportAddressEx(BOOL, const(wchar)**);
    HRESULT SetTransportAddress(const(wchar)*);
}
enum IID_IWSDMessageParameters = GUID(0x1fafe8a2, 0xe6fc, 0x4b80, [0xb6, 0xcf, 0xb7, 0xd4, 0x5c, 0x41, 0x6d, 0x7c]);
interface IWSDMessageParameters : IUnknown
{
    HRESULT GetLocalAddress(IWSDAddress*);
    HRESULT SetLocalAddress(IWSDAddress);
    HRESULT GetRemoteAddress(IWSDAddress*);
    HRESULT SetRemoteAddress(IWSDAddress);
    HRESULT GetLowerParameters(IWSDMessageParameters*);
}
struct WSDUdpRetransmitParams
{
    uint ulSendDelay;
    uint ulRepeat;
    uint ulRepeatMinDelay;
    uint ulRepeatMaxDelay;
    uint ulRepeatUpperDelay;
}
enum IID_IWSDUdpMessageParameters = GUID(0x9934149f, 0x8f0c, 0x447b, [0xaa, 0xb, 0x73, 0x12, 0x4b, 0xc, 0xa7, 0xf0]);
interface IWSDUdpMessageParameters : IWSDMessageParameters
{
    HRESULT SetRetransmitParams(const(WSDUdpRetransmitParams)*);
    HRESULT GetRetransmitParams(WSDUdpRetransmitParams*);
}
alias WSDUdpMessageType = int;
enum : int
{
    ONE_WAY = 0x00000000,
    TWO_WAY = 0x00000001,
}

enum IID_IWSDUdpAddress = GUID(0x74d6124a, 0xa441, 0x4f78, [0xa1, 0xeb, 0x97, 0xa8, 0xd1, 0x99, 0x68, 0x93]);
interface IWSDUdpAddress : IWSDTransportAddress
{
    HRESULT SetSockaddr(const(SOCKADDR_STORAGE)*);
    HRESULT GetSockaddr(SOCKADDR_STORAGE*);
    HRESULT SetExclusive(BOOL);
    HRESULT GetExclusive();
    HRESULT SetMessageType(WSDUdpMessageType);
    HRESULT GetMessageType(WSDUdpMessageType*);
    HRESULT SetTTL(uint);
    HRESULT GetTTL(uint*);
    HRESULT SetAlias(const(GUID)*);
    HRESULT GetAlias(GUID*);
}
enum IID_IWSDHttpMessageParameters = GUID(0x540bd122, 0x5c83, 0x4dec, [0xb3, 0x96, 0xea, 0x62, 0xa2, 0x69, 0x7f, 0xdf]);
interface IWSDHttpMessageParameters : IWSDMessageParameters
{
    HRESULT SetInboundHttpHeaders(const(wchar)*);
    HRESULT GetInboundHttpHeaders(const(wchar)**);
    HRESULT SetOutboundHttpHeaders(const(wchar)*);
    HRESULT GetOutboundHttpHeaders(const(wchar)**);
    HRESULT SetID(const(wchar)*);
    HRESULT GetID(const(wchar)**);
    HRESULT SetContext(IUnknown);
    HRESULT GetContext(IUnknown*);
    HRESULT Clear();
}
enum IID_IWSDHttpAddress = GUID(0xd09ac7bd, 0x2a3e, 0x4b85, [0x86, 0x5, 0x27, 0x37, 0xff, 0x3e, 0x4e, 0xa0]);
interface IWSDHttpAddress : IWSDTransportAddress
{
    HRESULT GetSecure();
    HRESULT SetSecure(BOOL);
    HRESULT GetPath(const(wchar)**);
    HRESULT SetPath(const(wchar)*);
}
enum IID_IWSDSSLClientCertificate = GUID(0xde105e87, 0xa0da, 0x418e, [0x98, 0xad, 0x27, 0xb9, 0xee, 0xd8, 0x7b, 0xdc]);
interface IWSDSSLClientCertificate : IUnknown
{
    HRESULT GetClientCertificate(CERT_CONTEXT**);
    HRESULT GetMappedAccessToken(HANDLE*);
}
enum IID_IWSDHttpAuthParameters = GUID(0xb476df0, 0x8dac, 0x480d, [0xb0, 0x5c, 0x99, 0x78, 0x1a, 0x58, 0x84, 0xaa]);
interface IWSDHttpAuthParameters : IUnknown
{
    HRESULT GetClientAccessToken(HANDLE*);
    HRESULT GetAuthType(uint*);
}
enum IID_IWSDSignatureProperty = GUID(0x3ce20aa, 0x71c4, 0x45e2, [0xb3, 0x2e, 0x37, 0x66, 0xc6, 0x1c, 0x79, 0xf]);
interface IWSDSignatureProperty : IUnknown
{
    HRESULT IsMessageSigned(BOOL*);
    HRESULT IsMessageSignatureTrusted(BOOL*);
    HRESULT GetKeyInfo(ubyte*, uint*);
    HRESULT GetSignature(ubyte*, uint*);
    HRESULT GetSignedInfoHash(ubyte*, uint*);
}
enum IID_IWSDAttachment = GUID(0x5d55a616, 0x9df8, 0x4b09, [0xb1, 0x56, 0x9b, 0xa3, 0x51, 0xa4, 0x8b, 0x76]);
interface IWSDAttachment : IUnknown
{
}
enum IID_IWSDOutboundAttachment = GUID(0xaa302f8d, 0x5a22, 0x4ba5, [0xb3, 0x92, 0xaa, 0x84, 0x86, 0xf4, 0xc1, 0x5d]);
interface IWSDOutboundAttachment : IWSDAttachment
{
    HRESULT Write(const(ubyte)*, uint, uint*);
    HRESULT Close();
    HRESULT Abort();
}
enum IID_IWSDInboundAttachment = GUID(0x5bd6ca65, 0x233c, 0x4fb8, [0x9f, 0x7a, 0x26, 0x41, 0x61, 0x96, 0x55, 0xc9]);
interface IWSDInboundAttachment : IWSDAttachment
{
    HRESULT Read(ubyte*, uint, uint*);
    HRESULT Close();
}
struct WSD_DATETIME
{
    BOOL isPositive;
    uint year;
    ubyte month;
    ubyte day;
    ubyte hour;
    ubyte minute;
    ubyte second;
    uint millisecond;
    BOOL TZIsLocal;
    BOOL TZIsPositive;
    ubyte TZHour;
    ubyte TZMinute;
}
struct WSD_DURATION
{
    BOOL isPositive;
    uint year;
    uint month;
    uint day;
    uint hour;
    uint minute;
    uint second;
    uint millisecond;
}
alias WSDXML_OP = int;
enum : int
{
    OpNone                  = 0x00000000,
    OpEndOfTable            = 0x00000001,
    OpBeginElement_         = 0x00000002,
    OpBeginAnyElement       = 0x00000003,
    OpEndElement            = 0x00000004,
    OpElement_              = 0x00000005,
    OpAnyElement            = 0x00000006,
    OpAnyElements           = 0x00000007,
    OpAnyText               = 0x00000008,
    OpAttribute_            = 0x00000009,
    OpBeginChoice           = 0x0000000a,
    OpEndChoice             = 0x0000000b,
    OpBeginSequence         = 0x0000000c,
    OpEndSequence           = 0x0000000d,
    OpBeginAll              = 0x0000000e,
    OpEndAll                = 0x0000000f,
    OpAnything              = 0x00000010,
    OpAnyNumber             = 0x00000011,
    OpOneOrMore             = 0x00000012,
    OpOptional              = 0x00000013,
    OpFormatBool_           = 0x00000014,
    OpFormatInt8_           = 0x00000015,
    OpFormatInt16_          = 0x00000016,
    OpFormatInt32_          = 0x00000017,
    OpFormatInt64_          = 0x00000018,
    OpFormatUInt8_          = 0x00000019,
    OpFormatUInt16_         = 0x0000001a,
    OpFormatUInt32_         = 0x0000001b,
    OpFormatUInt64_         = 0x0000001c,
    OpFormatUnicodeString_  = 0x0000001d,
    OpFormatDom_            = 0x0000001e,
    OpFormatStruct_         = 0x0000001f,
    OpFormatUri_            = 0x00000020,
    OpFormatUuidUri_        = 0x00000021,
    OpFormatName_           = 0x00000022,
    OpFormatListInsertTail_ = 0x00000023,
    OpFormatType_           = 0x00000024,
    OpFormatDynamicType_    = 0x00000025,
    OpFormatLookupType_     = 0x00000026,
    OpFormatDuration_       = 0x00000027,
    OpFormatDateTime_       = 0x00000028,
    OpFormatFloat_          = 0x00000029,
    OpFormatDouble_         = 0x0000002a,
    OpProcess_              = 0x0000002b,
    OpQualifiedAttribute_   = 0x0000002c,
    OpFormatXMLDeclaration_ = 0x0000002d,
    OpFormatMax             = 0x0000002e,
}

enum IID_IWSDXMLContext = GUID(0x75d8f3ee, 0x3e5a, 0x43b4, [0xa1, 0x5a, 0xbc, 0xf6, 0x88, 0x74, 0x60, 0xc0]);
interface IWSDXMLContext : IUnknown
{
    HRESULT AddNamespace(const(wchar)*, const(wchar)*, WSDXML_NAMESPACE**);
    HRESULT AddNameToNamespace(const(wchar)*, const(wchar)*, WSDXML_NAME**);
    HRESULT SetNamespaces(const(WSDXML_NAMESPACE)**, ushort, ubyte);
    HRESULT SetTypes(const(WSDXML_TYPE)**, uint, ubyte);
}
struct WSDXML_NAMESPACE
{
    const(wchar)* Uri;
    const(wchar)* PreferredPrefix;
    WSDXML_NAME* Names;
    ushort NamesCount;
    ushort Encoding;
}
struct WSDXML_NAME
{
    WSDXML_NAMESPACE* Space;
    PWSTR LocalName;
}
struct WSDXML_TYPE
{
    const(wchar)* Uri;
    const(ubyte)* Table;
}
struct WSDXML_PREFIX_MAPPING
{
    uint Refs;
    WSDXML_PREFIX_MAPPING* Next;
    WSDXML_NAMESPACE* Space;
    PWSTR Prefix;
}
struct WSDXML_ATTRIBUTE
{
    WSDXML_ELEMENT* Element;
    WSDXML_ATTRIBUTE* Next;
    WSDXML_NAME* Name;
    PWSTR Value;
}
struct WSDXML_NODE
{
    int Type;
    WSDXML_ELEMENT* Parent;
    WSDXML_NODE* Next;
    int ElementType;
    int TextType;
}
struct WSDXML_ELEMENT
{
    WSDXML_NODE Node;
    WSDXML_NAME* Name;
    WSDXML_ATTRIBUTE* FirstAttribute;
    WSDXML_NODE* FirstChild;
    WSDXML_PREFIX_MAPPING* PrefixMappings;
}
struct WSDXML_TEXT
{
    WSDXML_NODE Node;
    PWSTR Text;
}
struct WSDXML_ELEMENT_LIST
{
    WSDXML_ELEMENT_LIST* Next;
    WSDXML_ELEMENT* Element;
}
alias WSD_STUB_FUNCTION = HRESULT function(IUnknown, IWSDServiceMessaging, WSD_EVENT*);
alias DeviceDiscoveryMechanism = int;
enum : int
{
    MulticastDiscovery      = 0x00000000,
    DirectedDiscovery       = 0x00000001,
    SecureDirectedDiscovery = 0x00000002,
}

alias WSD_PROTOCOL_TYPE = int;
enum : int
{
    WSD_PT_NONE  = 0x00000000,
    WSD_PT_UDP   = 0x00000001,
    WSD_PT_HTTP  = 0x00000002,
    WSD_PT_HTTPS = 0x00000004,
    WSD_PT_ALL   = 0x000000ff,
}

struct WSD_OPERATION
{
    WSDXML_TYPE* RequestType;
    WSDXML_TYPE* ResponseType;
    WSD_STUB_FUNCTION RequestStubFunction;
}
alias PWSD_SOAP_MESSAGE_HANDLER = HRESULT function(IUnknown, WSD_EVENT*);
struct WSD_HANDLER_CONTEXT
{
    PWSD_SOAP_MESSAGE_HANDLER Handler;
    void* PVoid;
    IUnknown Unknown;
}
alias WSDEventType = int;
enum : int
{
    WSDET_NONE                 = 0x00000000,
    WSDET_INCOMING_MESSAGE     = 0x00000001,
    WSDET_INCOMING_FAULT       = 0x00000002,
    WSDET_TRANSMISSION_FAILURE = 0x00000003,
    WSDET_RESPONSE_TIMEOUT     = 0x00000004,
}

struct WSD_SYNCHRONOUS_RESPONSE_CONTEXT
{
    HRESULT hr;
    HANDLE eventHandle;
    IWSDMessageParameters messageParameters;
    void* results;
}
struct WSD_PORT_TYPE
{
    uint EncodedName;
    uint OperationCount;
    WSD_OPERATION* Operations;
    WSD_PROTOCOL_TYPE ProtocolType;
}
struct WSD_RELATIONSHIP_METADATA
{
    const(wchar)* Type;
    WSD_HOST_METADATA* Data;
    WSDXML_ELEMENT* Any;
}
struct WSD_SERVICE_METADATA_LIST
{
    WSD_SERVICE_METADATA_LIST* Next;
    WSD_SERVICE_METADATA* Element;
}
struct WSD_HOST_METADATA
{
    WSD_SERVICE_METADATA* Host;
    WSD_SERVICE_METADATA_LIST* Hosted;
}
struct WSD_ENDPOINT_REFERENCE_LIST
{
    WSD_ENDPOINT_REFERENCE_LIST* Next;
    WSD_ENDPOINT_REFERENCE* Element;
}
struct WSD_SERVICE_METADATA
{
    WSD_ENDPOINT_REFERENCE_LIST* EndpointReference;
    WSD_NAME_LIST* Types;
    const(wchar)* ServiceId;
    WSDXML_ELEMENT* Any;
}
struct WSD_THIS_DEVICE_METADATA
{
    WSD_LOCALIZED_STRING_LIST* FriendlyName;
    const(wchar)* FirmwareVersion;
    const(wchar)* SerialNumber;
    WSDXML_ELEMENT* Any;
}
struct WSD_THIS_MODEL_METADATA
{
    WSD_LOCALIZED_STRING_LIST* Manufacturer;
    const(wchar)* ManufacturerUrl;
    WSD_LOCALIZED_STRING_LIST* ModelName;
    const(wchar)* ModelNumber;
    const(wchar)* ModelUrl;
    const(wchar)* PresentationUrl;
    WSDXML_ELEMENT* Any;
}
struct WSD_LOCALIZED_STRING_LIST
{
    WSD_LOCALIZED_STRING_LIST* Next;
    WSD_LOCALIZED_STRING* Element;
}
struct WSD_SOAP_FAULT_REASON
{
    WSD_LOCALIZED_STRING_LIST* Text;
}
struct WSD_SOAP_FAULT_SUBCODE
{
    WSDXML_NAME* Value;
    WSD_SOAP_FAULT_SUBCODE* Subcode;
}
struct WSD_SOAP_FAULT_CODE
{
    WSDXML_NAME* Value;
    WSD_SOAP_FAULT_SUBCODE* Subcode;
}
struct WSD_SOAP_FAULT
{
    WSD_SOAP_FAULT_CODE* Code;
    WSD_SOAP_FAULT_REASON* Reason;
    const(wchar)* Node;
    const(wchar)* Role;
    WSDXML_ELEMENT* Detail;
}
struct WSD_APP_SEQUENCE
{
    ulong InstanceId;
    const(wchar)* SequenceId;
    ulong MessageNumber;
}
struct WSD_HEADER_RELATESTO
{
    WSDXML_NAME* RelationshipType;
    const(wchar)* MessageID;
}
struct WSD_SOAP_HEADER
{
    const(wchar)* To;
    const(wchar)* Action;
    const(wchar)* MessageID;
    WSD_HEADER_RELATESTO RelatesTo;
    WSD_ENDPOINT_REFERENCE* ReplyTo;
    WSD_ENDPOINT_REFERENCE* From;
    WSD_ENDPOINT_REFERENCE* FaultTo;
    WSD_APP_SEQUENCE* AppSequence;
    WSDXML_ELEMENT* AnyHeaders;
}
struct WSD_SOAP_MESSAGE
{
    WSD_SOAP_HEADER Header;
    void* Body;
    WSDXML_TYPE* BodyType;
}
struct WSD_RESOLVE_MATCHES
{
    WSD_RESOLVE_MATCH* ResolveMatch;
    WSDXML_ELEMENT* Any;
}
struct WSD_RESOLVE_MATCH
{
    WSD_ENDPOINT_REFERENCE* EndpointReference;
    WSD_NAME_LIST* Types;
    WSD_SCOPES* Scopes;
    WSD_URI_LIST* XAddrs;
    ulong MetadataVersion;
    WSDXML_ELEMENT* Any;
}
struct WSD_RESOLVE
{
    WSD_ENDPOINT_REFERENCE* EndpointReference;
    WSDXML_ELEMENT* Any;
}
struct WSD_PROBE_MATCH
{
    WSD_ENDPOINT_REFERENCE* EndpointReference;
    WSD_NAME_LIST* Types;
    WSD_SCOPES* Scopes;
    WSD_URI_LIST* XAddrs;
    ulong MetadataVersion;
    WSDXML_ELEMENT* Any;
}
struct WSD_PROBE_MATCH_LIST
{
    WSD_PROBE_MATCH_LIST* Next;
    WSD_PROBE_MATCH* Element;
}
struct WSD_PROBE_MATCHES
{
    WSD_PROBE_MATCH_LIST* ProbeMatch;
    WSDXML_ELEMENT* Any;
}
struct WSD_PROBE
{
    WSD_NAME_LIST* Types;
    WSD_SCOPES* Scopes;
    WSDXML_ELEMENT* Any;
}
struct WSD_BYE
{
    WSD_ENDPOINT_REFERENCE* EndpointReference;
    WSDXML_ELEMENT* Any;
}
struct WSD_SCOPES
{
    const(wchar)* MatchBy;
    WSD_URI_LIST* Scopes;
}
struct WSD_NAME_LIST
{
    WSD_NAME_LIST* Next;
    WSDXML_NAME* Element;
}
struct WSD_HELLO
{
    WSD_ENDPOINT_REFERENCE* EndpointReference;
    WSD_NAME_LIST* Types;
    WSD_SCOPES* Scopes;
    WSD_URI_LIST* XAddrs;
    ulong MetadataVersion;
    WSDXML_ELEMENT* Any;
}
struct WSD_REFERENCE_PARAMETERS
{
    WSDXML_ELEMENT* Any;
}
struct WSD_REFERENCE_PROPERTIES
{
    WSDXML_ELEMENT* Any;
}
struct WSD_ENDPOINT_REFERENCE
{
    const(wchar)* Address;
    WSD_REFERENCE_PROPERTIES ReferenceProperties;
    WSD_REFERENCE_PARAMETERS ReferenceParameters;
    WSDXML_NAME* PortType;
    WSDXML_NAME* ServiceName;
    WSDXML_ELEMENT* Any;
}
struct WSD_METADATA_SECTION
{
    const(wchar)* Dialect;
    const(wchar)* Identifier;
    void* Data;
    WSD_ENDPOINT_REFERENCE* MetadataReference;
    const(wchar)* Location;
    WSDXML_ELEMENT* Any;
}
struct WSD_METADATA_SECTION_LIST
{
    WSD_METADATA_SECTION_LIST* Next;
    WSD_METADATA_SECTION* Element;
}
struct WSD_URI_LIST
{
    WSD_URI_LIST* Next;
    const(wchar)* Element;
}
struct WSD_EVENTING_FILTER_ACTION
{
    WSD_URI_LIST* Actions;
}
struct WSD_EVENTING_FILTER
{
    const(wchar)* Dialect;
    WSD_EVENTING_FILTER_ACTION* FilterAction;
    void* Data;
}
struct WSD_EVENTING_EXPIRES
{
    WSD_DURATION* Duration;
    WSD_DATETIME* DateTime;
}
struct WSD_EVENTING_DELIVERY_MODE_PUSH
{
    WSD_ENDPOINT_REFERENCE* NotifyTo;
}
struct WSD_EVENTING_DELIVERY_MODE
{
    const(wchar)* Mode;
    WSD_EVENTING_DELIVERY_MODE_PUSH* Push;
    void* Data;
}
struct WSD_LOCALIZED_STRING
{
    const(wchar)* lang;
    const(wchar)* String;
}
struct RESPONSEBODY_GetMetadata
{
    WSD_METADATA_SECTION_LIST* Metadata;
}
struct REQUESTBODY_Subscribe
{
    WSD_ENDPOINT_REFERENCE* EndTo;
    WSD_EVENTING_DELIVERY_MODE* Delivery;
    WSD_EVENTING_EXPIRES* Expires;
    WSD_EVENTING_FILTER* Filter;
    WSDXML_ELEMENT* Any;
}
struct RESPONSEBODY_Subscribe
{
    WSD_ENDPOINT_REFERENCE* SubscriptionManager;
    WSD_EVENTING_EXPIRES* expires;
    WSDXML_ELEMENT* any;
}
struct REQUESTBODY_Renew
{
    WSD_EVENTING_EXPIRES* Expires;
    WSDXML_ELEMENT* Any;
}
struct RESPONSEBODY_Renew
{
    WSD_EVENTING_EXPIRES* expires;
    WSDXML_ELEMENT* any;
}
struct REQUESTBODY_GetStatus
{
    WSDXML_ELEMENT* Any;
}
struct RESPONSEBODY_GetStatus
{
    WSD_EVENTING_EXPIRES* expires;
    WSDXML_ELEMENT* any;
}
struct REQUESTBODY_Unsubscribe
{
    WSDXML_ELEMENT* any;
}
struct RESPONSEBODY_SubscriptionEnd
{
    WSD_ENDPOINT_REFERENCE* SubscriptionManager;
    const(wchar)* Status;
    WSD_LOCALIZED_STRING* Reason;
    WSDXML_ELEMENT* Any;
}
struct WSD_UNKNOWN_LOOKUP
{
    WSDXML_ELEMENT* Any;
}
struct WSD_EVENT
{
    HRESULT Hr;
    uint EventType;
    PWSTR DispatchTag;
    WSD_HANDLER_CONTEXT HandlerContext;
    WSD_SOAP_MESSAGE* Soap;
    WSD_OPERATION* Operation;
    IWSDMessageParameters MessageParameters;
}
enum IID_IWSDiscoveryProvider = GUID(0x8ffc8e55, 0xf0eb, 0x480f, [0x88, 0xb7, 0xb4, 0x35, 0xdd, 0x28, 0x1d, 0x45]);
interface IWSDiscoveryProvider : IUnknown
{
    HRESULT SetAddressFamily(uint);
    HRESULT Attach(IWSDiscoveryProviderNotify);
    HRESULT Detach();
    HRESULT SearchById(const(wchar)*, const(wchar)*);
    HRESULT SearchByAddress(const(wchar)*, const(wchar)*);
    HRESULT SearchByType(const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(wchar)*, const(wchar)*);
    HRESULT GetXMLContext(IWSDXMLContext*);
}
enum IID_IWSDiscoveryProviderNotify = GUID(0x73ee3ced, 0xb6e6, 0x4329, [0xa5, 0x46, 0x3e, 0x8a, 0xd4, 0x65, 0x63, 0xd2]);
interface IWSDiscoveryProviderNotify : IUnknown
{
    HRESULT Add(IWSDiscoveredService);
    HRESULT Remove(IWSDiscoveredService);
    HRESULT SearchFailed(HRESULT, const(wchar)*);
    HRESULT SearchComplete(const(wchar)*);
}
enum IID_IWSDiscoveredService = GUID(0x4bad8a3b, 0xb374, 0x4420, [0x96, 0x32, 0xaa, 0xc9, 0x45, 0xb3, 0x74, 0xaa]);
interface IWSDiscoveredService : IUnknown
{
    HRESULT GetEndpointReference(WSD_ENDPOINT_REFERENCE**);
    HRESULT GetTypes(WSD_NAME_LIST**);
    HRESULT GetScopes(WSD_URI_LIST**);
    HRESULT GetXAddrs(WSD_URI_LIST**);
    HRESULT GetMetadataVersion(ulong*);
    HRESULT GetExtendedDiscoXML(WSDXML_ELEMENT**, WSDXML_ELEMENT**);
    HRESULT GetProbeResolveTag(const(wchar)**);
    HRESULT GetRemoteTransportAddress(const(wchar)**);
    HRESULT GetLocalTransportAddress(const(wchar)**);
    HRESULT GetLocalInterfaceGUID(GUID*);
    HRESULT GetInstanceId(ulong*);
}
enum IID_IWSDiscoveryPublisher = GUID(0xae01e1a8, 0x3ff9, 0x4148, [0x81, 0x16, 0x5, 0x7c, 0xc6, 0x16, 0xfe, 0x13]);
interface IWSDiscoveryPublisher : IUnknown
{
    HRESULT SetAddressFamily(uint);
    HRESULT RegisterNotificationSink(IWSDiscoveryPublisherNotify);
    HRESULT UnRegisterNotificationSink(IWSDiscoveryPublisherNotify);
    HRESULT Publish(const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*);
    HRESULT UnPublish(const(wchar)*, ulong, ulong, const(wchar)*, const(WSDXML_ELEMENT)*);
    HRESULT MatchProbe(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters, const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*);
    HRESULT MatchResolve(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters, const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*);
    HRESULT PublishEx(const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*);
    HRESULT MatchProbeEx(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters, const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*);
    HRESULT MatchResolveEx(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters, const(wchar)*, ulong, ulong, ulong, const(wchar)*, const(WSD_NAME_LIST)*, const(WSD_URI_LIST)*, const(WSD_URI_LIST)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*, const(WSDXML_ELEMENT)*);
    HRESULT RegisterScopeMatchingRule(IWSDScopeMatchingRule);
    HRESULT UnRegisterScopeMatchingRule(IWSDScopeMatchingRule);
    HRESULT GetXMLContext(IWSDXMLContext*);
}
enum IID_IWSDiscoveryPublisherNotify = GUID(0xe67651b0, 0x337a, 0x4b3c, [0x97, 0x58, 0x73, 0x33, 0x88, 0x56, 0x82, 0x51]);
interface IWSDiscoveryPublisherNotify : IUnknown
{
    HRESULT ProbeHandler(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters);
    HRESULT ResolveHandler(const(WSD_SOAP_MESSAGE)*, IWSDMessageParameters);
}
enum IID_IWSDScopeMatchingRule = GUID(0xfcafe424, 0xfef5, 0x481a, [0xbd, 0x9f, 0x33, 0xce, 0x5, 0x74, 0x25, 0x6f]);
interface IWSDScopeMatchingRule : IUnknown
{
    HRESULT GetScopeRule(const(wchar)**);
    HRESULT MatchScopes(const(wchar)*, const(wchar)*, BOOL*);
}
enum IID_IWSDEndpointProxy = GUID(0x1860d430, 0xb24c, 0x4975, [0x9f, 0x90, 0xdb, 0xb3, 0x9b, 0xaa, 0x24, 0xec]);
interface IWSDEndpointProxy : IUnknown
{
    HRESULT SendOneWayRequest(const(void)*, const(WSD_OPERATION)*);
    HRESULT SendTwoWayRequest(const(void)*, const(WSD_OPERATION)*, const(WSD_SYNCHRONOUS_RESPONSE_CONTEXT)*);
    HRESULT SendTwoWayRequestAsync(const(void)*, const(WSD_OPERATION)*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*);
    HRESULT AbortAsyncOperation(IWSDAsyncResult);
    HRESULT ProcessFault(const(WSD_SOAP_FAULT)*);
    HRESULT GetErrorInfo(const(wchar)**);
    HRESULT GetFaultInfo(WSD_SOAP_FAULT**);
}
enum IID_IWSDMetadataExchange = GUID(0x6996d57, 0x1d67, 0x4928, [0x93, 0x7, 0x3d, 0x78, 0x33, 0xfd, 0xb8, 0x46]);
interface IWSDMetadataExchange : IUnknown
{
    HRESULT GetMetadata(WSD_METADATA_SECTION_LIST**);
}
enum IID_IWSDServiceProxy = GUID(0xd4c7fb9c, 0x3ab, 0x4175, [0x9d, 0x67, 0x9, 0x4f, 0xaf, 0xeb, 0xf4, 0x87]);
interface IWSDServiceProxy : IWSDMetadataExchange
{
    HRESULT BeginGetMetadata(IWSDAsyncResult*);
    HRESULT EndGetMetadata(IWSDAsyncResult, WSD_METADATA_SECTION_LIST**);
    HRESULT GetServiceMetadata(WSD_SERVICE_METADATA**);
    HRESULT SubscribeToOperation(const(WSD_OPERATION)*, IUnknown, const(WSDXML_ELEMENT)*, WSDXML_ELEMENT**);
    HRESULT UnsubscribeToOperation(const(WSD_OPERATION)*);
    HRESULT SetEventingStatusCallback(IWSDEventingStatus);
    HRESULT GetEndpointProxy(IWSDEndpointProxy*);
}
enum IID_IWSDServiceProxyEventing = GUID(0xf9279d6d, 0x1012, 0x4a94, [0xb8, 0xcc, 0xfd, 0x35, 0xd2, 0x20, 0x2b, 0xfe]);
interface IWSDServiceProxyEventing : IWSDServiceProxy
{
    HRESULT SubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, IUnknown, const(WSD_EVENTING_EXPIRES)*, const(WSDXML_ELEMENT)*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
    HRESULT BeginSubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, IUnknown, const(WSD_EVENTING_EXPIRES)*, const(WSDXML_ELEMENT)*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*);
    HRESULT EndSubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
    HRESULT UnsubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, const(WSDXML_ELEMENT)*);
    HRESULT BeginUnsubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, const(WSDXML_ELEMENT)*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*);
    HRESULT EndUnsubscribeToMultipleOperations(const(WSD_OPERATION)*, uint, IWSDAsyncResult);
    HRESULT RenewMultipleOperations(const(WSD_OPERATION)*, uint, const(WSD_EVENTING_EXPIRES)*, const(WSDXML_ELEMENT)*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
    HRESULT BeginRenewMultipleOperations(const(WSD_OPERATION)*, uint, const(WSD_EVENTING_EXPIRES)*, const(WSDXML_ELEMENT)*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*);
    HRESULT EndRenewMultipleOperations(const(WSD_OPERATION)*, uint, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
    HRESULT GetStatusForMultipleOperations(const(WSD_OPERATION)*, uint, const(WSDXML_ELEMENT)*, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
    HRESULT BeginGetStatusForMultipleOperations(const(WSD_OPERATION)*, uint, const(WSDXML_ELEMENT)*, IUnknown, IWSDAsyncCallback, IWSDAsyncResult*);
    HRESULT EndGetStatusForMultipleOperations(const(WSD_OPERATION)*, uint, IWSDAsyncResult, WSD_EVENTING_EXPIRES**, WSDXML_ELEMENT**);
}
enum IID_IWSDDeviceProxy = GUID(0xeee0c031, 0xc578, 0x4c0e, [0x9a, 0x3b, 0x97, 0x3c, 0x35, 0xf4, 0x9, 0xdb]);
interface IWSDDeviceProxy : IUnknown
{
    HRESULT Init(const(wchar)*, IWSDAddress, const(wchar)*, IWSDXMLContext, IWSDDeviceProxy);
    HRESULT BeginGetMetadata(IWSDAsyncResult*);
    HRESULT EndGetMetadata(IWSDAsyncResult);
    HRESULT GetHostMetadata(WSD_HOST_METADATA**);
    HRESULT GetThisModelMetadata(WSD_THIS_MODEL_METADATA**);
    HRESULT GetThisDeviceMetadata(WSD_THIS_DEVICE_METADATA**);
    HRESULT GetAllMetadata(WSD_METADATA_SECTION_LIST**);
    HRESULT GetServiceProxyById(const(wchar)*, IWSDServiceProxy*);
    HRESULT GetServiceProxyByType(const(WSDXML_NAME)*, IWSDServiceProxy*);
    HRESULT GetEndpointProxy(IWSDEndpointProxy*);
}
enum IID_IWSDAsyncResult = GUID(0x11a9852a, 0x8dd8, 0x423e, [0xb5, 0x37, 0x93, 0x56, 0xdb, 0x4f, 0xbf, 0xb8]);
interface IWSDAsyncResult : IUnknown
{
    HRESULT SetCallback(IWSDAsyncCallback, IUnknown);
    HRESULT SetWaitHandle(HANDLE);
    HRESULT HasCompleted();
    HRESULT GetAsyncState(IUnknown*);
    HRESULT Abort();
    HRESULT GetEvent(WSD_EVENT*);
    HRESULT GetEndpointProxy(IWSDEndpointProxy*);
}
enum IID_IWSDAsyncCallback = GUID(0xa63e109d, 0xce72, 0x49e2, [0xba, 0x98, 0xe8, 0x45, 0xf5, 0xee, 0x16, 0x66]);
interface IWSDAsyncCallback : IUnknown
{
    HRESULT AsyncOperationComplete(IWSDAsyncResult, IUnknown);
}
enum IID_IWSDEventingStatus = GUID(0x49b17f52, 0x637a, 0x407a, [0xae, 0x99, 0xfb, 0xe8, 0x2a, 0x4d, 0x38, 0xc0]);
interface IWSDEventingStatus : IUnknown
{
    void SubscriptionRenewed(const(wchar)*);
    void SubscriptionRenewalFailed(const(wchar)*, HRESULT);
    void SubscriptionEnded(const(wchar)*);
}
enum IID_IWSDDeviceHost = GUID(0x917fe891, 0x3d13, 0x4138, [0x98, 0x9, 0x93, 0x4c, 0x8a, 0xbe, 0xb1, 0x2c]);
interface IWSDDeviceHost : IUnknown
{
    HRESULT Init(const(wchar)*, IWSDXMLContext, IWSDAddress*, uint);
    HRESULT Start(ulong, const(WSD_URI_LIST)*, IWSDDeviceHostNotify);
    HRESULT Stop();
    HRESULT Terminate();
    HRESULT RegisterPortType(const(WSD_PORT_TYPE)*);
    HRESULT SetMetadata(const(WSD_THIS_MODEL_METADATA)*, const(WSD_THIS_DEVICE_METADATA)*, const(WSD_HOST_METADATA)*, const(WSD_METADATA_SECTION_LIST)*);
    HRESULT RegisterService(const(wchar)*, IUnknown);
    HRESULT RetireService(const(wchar)*);
    HRESULT AddDynamicService(const(wchar)*, const(wchar)*, const(WSD_PORT_TYPE)*, const(WSDXML_NAME)*, const(WSDXML_ELEMENT)*, IUnknown);
    HRESULT RemoveDynamicService(const(wchar)*);
    HRESULT SetServiceDiscoverable(const(wchar)*, BOOL);
    HRESULT SignalEvent(const(wchar)*, const(void)*, const(WSD_OPERATION)*);
}
enum IID_IWSDDeviceHostNotify = GUID(0xb5bee9f9, 0xeeda, 0x41fe, [0x96, 0xf7, 0xf4, 0x5e, 0x14, 0x99, 0xf, 0xb0]);
interface IWSDDeviceHostNotify : IUnknown
{
    HRESULT GetService(const(wchar)*, IUnknown*);
}
enum IID_IWSDServiceMessaging = GUID(0x94974cf4, 0xcab, 0x460d, [0xa3, 0xf6, 0x7a, 0xa, 0xd6, 0x23, 0xc0, 0xe6]);
interface IWSDServiceMessaging : IUnknown
{
    HRESULT SendResponse(void*, WSD_OPERATION*, IWSDMessageParameters);
    HRESULT FaultRequest(WSD_SOAP_HEADER*, IWSDMessageParameters, WSD_SOAP_FAULT*);
}
