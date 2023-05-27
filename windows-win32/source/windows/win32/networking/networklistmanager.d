module windows.win32.networking.networklistmanager;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, VARIANT_BOOL;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.ole : IEnumVARIANT;

version (Windows):
extern (Windows):

enum NA_DomainAuthenticationFailed = "NA_DomainAuthenticationFailed";
enum NA_NetworkClass = "NA_NetworkClass";
enum NA_NameSetByPolicy = "NA_NameSetByPolicy";
enum NA_IconSetByPolicy = "NA_IconSetByPolicy";
enum NA_DescriptionSetByPolicy = "NA_DescriptionSetByPolicy";
enum NA_CategorySetByPolicy = "NA_CategorySetByPolicy";
enum NA_NameReadOnly = "NA_NameReadOnly";
enum NA_IconReadOnly = "NA_IconReadOnly";
enum NA_DescriptionReadOnly = "NA_DescriptionReadOnly";
enum NA_CategoryReadOnly = "NA_CategoryReadOnly";
enum NA_AllowMerge = "NA_AllowMerge";
enum NA_InternetConnectivityV4 = "NA_InternetConnectivityV4";
enum NA_InternetConnectivityV6 = "NA_InternetConnectivityV6";
enum NLM_MAX_ADDRESS_LIST_SIZE = 0x0000000a;
enum NLM_UNKNOWN_DATAPLAN_STATUS = 0xffffffff;
alias NLM_CONNECTION_COST = int;
enum : int
{
    NLM_CONNECTION_COST_UNKNOWN              = 0x00000000,
    NLM_CONNECTION_COST_UNRESTRICTED         = 0x00000001,
    NLM_CONNECTION_COST_FIXED                = 0x00000002,
    NLM_CONNECTION_COST_VARIABLE             = 0x00000004,
    NLM_CONNECTION_COST_OVERDATALIMIT        = 0x00010000,
    NLM_CONNECTION_COST_CONGESTED            = 0x00020000,
    NLM_CONNECTION_COST_ROAMING              = 0x00040000,
    NLM_CONNECTION_COST_APPROACHINGDATALIMIT = 0x00080000,
}

struct NLM_USAGE_DATA
{
    uint UsageInMegabytes;
    FILETIME LastSyncTime;
}
struct NLM_DATAPLAN_STATUS
{
    GUID InterfaceGuid;
    NLM_USAGE_DATA UsageData;
    uint DataLimitInMegabytes;
    uint InboundBandwidthInKbps;
    uint OutboundBandwidthInKbps;
    FILETIME NextBillingCycle;
    uint MaxTransferSizeInMegabytes;
    uint Reserved;
}
struct NLM_SOCKADDR
{
    ubyte[128] data;
}
alias NLM_NETWORK_CLASS = int;
enum : int
{
    NLM_NETWORK_IDENTIFYING  = 0x00000001,
    NLM_NETWORK_IDENTIFIED   = 0x00000002,
    NLM_NETWORK_UNIDENTIFIED = 0x00000003,
}

struct NLM_SIMULATED_PROFILE_INFO
{
    wchar[256] ProfileName;
    NLM_CONNECTION_COST cost;
    uint UsageInMegabytes;
    uint DataLimitInMegabytes;
}
alias NLM_INTERNET_CONNECTIVITY = int;
enum : int
{
    NLM_INTERNET_CONNECTIVITY_WEBHIJACK = 0x00000001,
    NLM_INTERNET_CONNECTIVITY_PROXIED   = 0x00000002,
    NLM_INTERNET_CONNECTIVITY_CORPORATE = 0x00000004,
}

alias NLM_CONNECTIVITY = int;
enum : int
{
    NLM_CONNECTIVITY_DISCONNECTED      = 0x00000000,
    NLM_CONNECTIVITY_IPV4_NOTRAFFIC    = 0x00000001,
    NLM_CONNECTIVITY_IPV6_NOTRAFFIC    = 0x00000002,
    NLM_CONNECTIVITY_IPV4_SUBNET       = 0x00000010,
    NLM_CONNECTIVITY_IPV4_LOCALNETWORK = 0x00000020,
    NLM_CONNECTIVITY_IPV4_INTERNET     = 0x00000040,
    NLM_CONNECTIVITY_IPV6_SUBNET       = 0x00000100,
    NLM_CONNECTIVITY_IPV6_LOCALNETWORK = 0x00000200,
    NLM_CONNECTIVITY_IPV6_INTERNET     = 0x00000400,
}

alias NLM_DOMAIN_TYPE = int;
enum : int
{
    NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK   = 0x00000000,
    NLM_DOMAIN_TYPE_DOMAIN_NETWORK       = 0x00000001,
    NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED = 0x00000002,
}

alias NLM_DOMAIN_AUTHENTICATION_KIND = int;
enum : int
{
    NLM_DOMAIN_AUTHENTICATION_KIND_NONE = 0x00000000,
    NLM_DOMAIN_AUTHENTICATION_KIND_LDAP = 0x00000001,
    NLM_DOMAIN_AUTHENTICATION_KIND_TLS  = 0x00000002,
}

alias NLM_ENUM_NETWORK = int;
enum : int
{
    NLM_ENUM_NETWORK_CONNECTED    = 0x00000001,
    NLM_ENUM_NETWORK_DISCONNECTED = 0x00000002,
    NLM_ENUM_NETWORK_ALL          = 0x00000003,
}

enum IID_INetworkListManager = GUID(0xdcb00000, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkListManager : IDispatch
{
    HRESULT GetNetworks(NLM_ENUM_NETWORK, IEnumNetworks*);
    HRESULT GetNetwork(GUID, INetwork*);
    HRESULT GetNetworkConnections(IEnumNetworkConnections*);
    HRESULT GetNetworkConnection(GUID, INetworkConnection*);
    HRESULT get_IsConnectedToInternet(VARIANT_BOOL*);
    HRESULT get_IsConnected(VARIANT_BOOL*);
    HRESULT GetConnectivity(NLM_CONNECTIVITY*);
    HRESULT SetSimulatedProfileInfo(NLM_SIMULATED_PROFILE_INFO*);
    HRESULT ClearSimulatedProfileInfo();
}
enum IID_INetworkListManagerEvents = GUID(0xdcb00001, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkListManagerEvents : IUnknown
{
    HRESULT ConnectivityChanged(NLM_CONNECTIVITY);
}
alias NLM_NETWORK_CATEGORY = int;
enum : int
{
    NLM_NETWORK_CATEGORY_PUBLIC               = 0x00000000,
    NLM_NETWORK_CATEGORY_PRIVATE              = 0x00000001,
    NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED = 0x00000002,
}

enum IID_INetwork = GUID(0xdcb00002, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetwork : IDispatch
{
    HRESULT GetName(BSTR*);
    HRESULT SetName(BSTR);
    HRESULT GetDescription(BSTR*);
    HRESULT SetDescription(BSTR);
    HRESULT GetNetworkId(GUID*);
    HRESULT GetDomainType(NLM_DOMAIN_TYPE*);
    HRESULT GetNetworkConnections(IEnumNetworkConnections*);
    HRESULT GetTimeCreatedAndConnected(uint*, uint*, uint*, uint*);
    HRESULT get_IsConnectedToInternet(VARIANT_BOOL*);
    HRESULT get_IsConnected(VARIANT_BOOL*);
    HRESULT GetConnectivity(NLM_CONNECTIVITY*);
    HRESULT GetCategory(NLM_NETWORK_CATEGORY*);
    HRESULT SetCategory(NLM_NETWORK_CATEGORY);
}
enum IID_INetwork2 = GUID(0xb5550abb, 0x3391, 0x4310, [0x80, 0x4f, 0x25, 0xdc, 0xc3, 0x25, 0xed, 0x81]);
interface INetwork2 : INetwork
{
    HRESULT IsDomainAuthenticatedBy(NLM_DOMAIN_AUTHENTICATION_KIND, BOOL*);
}
enum IID_IEnumNetworks = GUID(0xdcb00003, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface IEnumNetworks : IDispatch
{
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT Next(uint, INetwork*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetworks*);
}
alias NLM_NETWORK_PROPERTY_CHANGE = int;
enum : int
{
    NLM_NETWORK_PROPERTY_CHANGE_CONNECTION     = 0x00000001,
    NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION    = 0x00000002,
    NLM_NETWORK_PROPERTY_CHANGE_NAME           = 0x00000004,
    NLM_NETWORK_PROPERTY_CHANGE_ICON           = 0x00000008,
    NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE = 0x00000010,
}

enum IID_INetworkEvents = GUID(0xdcb00004, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkEvents : IUnknown
{
    HRESULT NetworkAdded(GUID);
    HRESULT NetworkDeleted(GUID);
    HRESULT NetworkConnectivityChanged(GUID, NLM_CONNECTIVITY);
    HRESULT NetworkPropertyChanged(GUID, NLM_NETWORK_PROPERTY_CHANGE);
}
enum IID_INetworkConnection = GUID(0xdcb00005, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkConnection : IDispatch
{
    HRESULT GetNetwork(INetwork*);
    HRESULT get_IsConnectedToInternet(VARIANT_BOOL*);
    HRESULT get_IsConnected(VARIANT_BOOL*);
    HRESULT GetConnectivity(NLM_CONNECTIVITY*);
    HRESULT GetConnectionId(GUID*);
    HRESULT GetAdapterId(GUID*);
    HRESULT GetDomainType(NLM_DOMAIN_TYPE*);
}
enum IID_INetworkConnection2 = GUID(0xe676ed, 0x5a35, 0x4738, [0x92, 0xeb, 0x85, 0x81, 0x73, 0x8d, 0xf, 0xa]);
interface INetworkConnection2 : INetworkConnection
{
    HRESULT IsDomainAuthenticatedBy(NLM_DOMAIN_AUTHENTICATION_KIND, BOOL*);
}
enum IID_IEnumNetworkConnections = GUID(0xdcb00006, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface IEnumNetworkConnections : IDispatch
{
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT Next(uint, INetworkConnection*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetworkConnections*);
}
alias NLM_CONNECTION_PROPERTY_CHANGE = int;
enum : int
{
    NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION = 0x00000001,
}

enum IID_INetworkConnectionEvents = GUID(0xdcb00007, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkConnectionEvents : IUnknown
{
    HRESULT NetworkConnectionConnectivityChanged(GUID, NLM_CONNECTIVITY);
    HRESULT NetworkConnectionPropertyChanged(GUID, NLM_CONNECTION_PROPERTY_CHANGE);
}
enum IID_INetworkCostManager = GUID(0xdcb00008, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkCostManager : IUnknown
{
    HRESULT GetCost(uint*, NLM_SOCKADDR*);
    HRESULT GetDataPlanStatus(NLM_DATAPLAN_STATUS*, NLM_SOCKADDR*);
    HRESULT SetDestinationAddresses(uint, NLM_SOCKADDR*, VARIANT_BOOL);
}
enum IID_INetworkCostManagerEvents = GUID(0xdcb00009, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkCostManagerEvents : IUnknown
{
    HRESULT CostChanged(uint, NLM_SOCKADDR*);
    HRESULT DataPlanStatusChanged(NLM_SOCKADDR*);
}
enum IID_INetworkConnectionCost = GUID(0xdcb0000a, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkConnectionCost : IUnknown
{
    HRESULT GetCost(uint*);
    HRESULT GetDataPlanStatus(NLM_DATAPLAN_STATUS*);
}
enum IID_INetworkConnectionCostEvents = GUID(0xdcb0000b, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
interface INetworkConnectionCostEvents : IUnknown
{
    HRESULT ConnectionCostChanged(GUID, uint);
    HRESULT ConnectionDataPlanStatusChanged(GUID);
}
enum CLSID_NetworkListManager = GUID(0xdcb00c01, 0x570f, 0x4a9b, [0x8d, 0x69, 0x19, 0x9f, 0xdb, 0xa5, 0x72, 0x3b]);
struct NetworkListManager
{
}
