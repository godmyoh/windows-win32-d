module windows.win32.networkmanagement.windowsconnectionmanager;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HANDLE, HRESULT, PWSTR;

version (Windows):
extern (Windows):

uint WcmQueryProperty(const(GUID)* pInterface, const(wchar)* strProfileName, WCM_PROPERTY Property, void* pReserved, uint* pdwDataSize, ubyte** ppData);
uint WcmSetProperty(const(GUID)* pInterface, const(wchar)* strProfileName, WCM_PROPERTY Property, void* pReserved, uint dwDataSize, const(ubyte)* pbData);
uint WcmGetProfileList(void* pReserved, WCM_PROFILE_INFO_LIST** ppProfileList);
uint WcmSetProfileList(WCM_PROFILE_INFO_LIST* pProfileList, uint dwPosition, BOOL fIgnoreUnknownProfiles, void* pReserved);
void WcmFreeMemory(void* pMemory);
HRESULT OnDemandGetRoutingHint(const(wchar)* destinationHostName, uint* interfaceIndex);
HRESULT OnDemandRegisterNotification(ONDEMAND_NOTIFICATION_CALLBACK callback, void* callbackContext, HANDLE* registrationHandle);
HRESULT OnDemandUnRegisterNotification(HANDLE registrationHandle);
HRESULT GetInterfaceContextTableForHostName(const(wchar)* HostName, const(wchar)* ProxyName, uint Flags, ubyte* ConnectionProfileFilterRawData, uint ConnectionProfileFilterRawDataSize, NET_INTERFACE_CONTEXT_TABLE** InterfaceContextTable);
void FreeInterfaceContextTable(NET_INTERFACE_CONTEXT_TABLE* InterfaceContextTable);
enum WCM_API_VERSION_1_0 = 0x00000001;
enum WCM_API_VERSION = 0x00000001;
enum WCM_UNKNOWN_DATAPLAN_STATUS = 0xffffffff;
enum WCM_MAX_PROFILE_NAME = 0x00000100;
enum NET_INTERFACE_FLAG_NONE = 0x00000000;
enum NET_INTERFACE_FLAG_CONNECT_IF_NEEDED = 0x00000001;
alias WCM_PROPERTY = int;
enum : int
{
    wcm_global_property_domain_policy          = 0x00000000,
    wcm_global_property_minimize_policy        = 0x00000001,
    wcm_global_property_roaming_policy         = 0x00000002,
    wcm_global_property_powermanagement_policy = 0x00000003,
    wcm_intf_property_connection_cost          = 0x00000004,
    wcm_intf_property_dataplan_status          = 0x00000005,
    wcm_intf_property_hotspot_profile          = 0x00000006,
}

alias WCM_MEDIA_TYPE = int;
enum : int
{
    wcm_media_unknown  = 0x00000000,
    wcm_media_ethernet = 0x00000001,
    wcm_media_wlan     = 0x00000002,
    wcm_media_mbn      = 0x00000003,
    wcm_media_invalid  = 0x00000004,
    wcm_media_max      = 0x00000005,
}

struct WCM_POLICY_VALUE
{
    BOOL fValue;
    BOOL fIsGroupPolicy;
}
struct WCM_PROFILE_INFO
{
    wchar[256] strProfileName;
    GUID AdapterGUID;
    WCM_MEDIA_TYPE Media;
}
struct WCM_PROFILE_INFO_LIST
{
    uint dwNumberOfItems;
    WCM_PROFILE_INFO[1] ProfileInfo;
}
alias WCM_CONNECTION_COST = int;
enum : int
{
    WCM_CONNECTION_COST_UNKNOWN              = 0x00000000,
    WCM_CONNECTION_COST_UNRESTRICTED         = 0x00000001,
    WCM_CONNECTION_COST_FIXED                = 0x00000002,
    WCM_CONNECTION_COST_VARIABLE             = 0x00000004,
    WCM_CONNECTION_COST_OVERDATALIMIT        = 0x00010000,
    WCM_CONNECTION_COST_CONGESTED            = 0x00020000,
    WCM_CONNECTION_COST_ROAMING              = 0x00040000,
    WCM_CONNECTION_COST_APPROACHINGDATALIMIT = 0x00080000,
}

alias WCM_CONNECTION_COST_SOURCE = int;
enum : int
{
    WCM_CONNECTION_COST_SOURCE_DEFAULT  = 0x00000000,
    WCM_CONNECTION_COST_SOURCE_GP       = 0x00000001,
    WCM_CONNECTION_COST_SOURCE_USER     = 0x00000002,
    WCM_CONNECTION_COST_SOURCE_OPERATOR = 0x00000003,
}

struct WCM_CONNECTION_COST_DATA
{
    uint ConnectionCost;
    WCM_CONNECTION_COST_SOURCE CostSource;
}
struct WCM_TIME_INTERVAL
{
    ushort wYear;
    ushort wMonth;
    ushort wDay;
    ushort wHour;
    ushort wMinute;
    ushort wSecond;
    ushort wMilliseconds;
}
struct WCM_USAGE_DATA
{
    uint UsageInMegabytes;
    FILETIME LastSyncTime;
}
struct WCM_BILLING_CYCLE_INFO
{
    FILETIME StartDate;
    WCM_TIME_INTERVAL Duration;
    BOOL Reset;
}
struct WCM_DATAPLAN_STATUS
{
    WCM_USAGE_DATA UsageData;
    uint DataLimitInMegabytes;
    uint InboundBandwidthInKbps;
    uint OutboundBandwidthInKbps;
    WCM_BILLING_CYCLE_INFO BillingCycle;
    uint MaxTransferSizeInMegabytes;
    uint Reserved;
}
alias ONDEMAND_NOTIFICATION_CALLBACK = void function(void* param0);
struct NET_INTERFACE_CONTEXT
{
    uint InterfaceIndex;
    PWSTR ConfigurationName;
}
struct NET_INTERFACE_CONTEXT_TABLE
{
    HANDLE InterfaceContextHandle;
    uint NumberOfEntries;
    NET_INTERFACE_CONTEXT* InterfaceContextArray;
}
