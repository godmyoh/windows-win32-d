module windows.win32.networkmanagement.windowsconnectionmanager;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HANDLE, HRESULT, PWSTR;

version (Windows):
extern (Windows):

uint WcmQueryProperty(const(GUID)*, const(wchar)*, WCM_PROPERTY, void*, uint*, ubyte**);
uint WcmSetProperty(const(GUID)*, const(wchar)*, WCM_PROPERTY, void*, uint, const(ubyte)*);
uint WcmGetProfileList(void*, WCM_PROFILE_INFO_LIST**);
uint WcmSetProfileList(WCM_PROFILE_INFO_LIST*, uint, BOOL, void*);
void WcmFreeMemory(void*);
HRESULT OnDemandGetRoutingHint(const(wchar)*, uint*);
HRESULT OnDemandRegisterNotification(ONDEMAND_NOTIFICATION_CALLBACK, void*, HANDLE*);
HRESULT OnDemandUnRegisterNotification(HANDLE);
HRESULT GetInterfaceContextTableForHostName(const(wchar)*, const(wchar)*, uint, ubyte*, uint, NET_INTERFACE_CONTEXT_TABLE**);
void FreeInterfaceContextTable(NET_INTERFACE_CONTEXT_TABLE*);
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
alias ONDEMAND_NOTIFICATION_CALLBACK = void function(void*);
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
