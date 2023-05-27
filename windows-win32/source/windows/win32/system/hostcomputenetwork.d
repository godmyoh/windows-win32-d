module windows.win32.system.hostcomputenetwork;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias HCN_NOTIFICATIONS = int;
enum : int
{
    HcnNotificationInvalid                                  = 0x00000000,
    HcnNotificationNetworkPreCreate                         = 0x00000001,
    HcnNotificationNetworkCreate                            = 0x00000002,
    HcnNotificationNetworkPreDelete                         = 0x00000003,
    HcnNotificationNetworkDelete                            = 0x00000004,
    HcnNotificationNamespaceCreate                          = 0x00000005,
    HcnNotificationNamespaceDelete                          = 0x00000006,
    HcnNotificationGuestNetworkServiceCreate                = 0x00000007,
    HcnNotificationGuestNetworkServiceDelete                = 0x00000008,
    HcnNotificationNetworkEndpointAttached                  = 0x00000009,
    HcnNotificationNetworkEndpointDetached                  = 0x00000010,
    HcnNotificationGuestNetworkServiceStateChanged          = 0x00000011,
    HcnNotificationGuestNetworkServiceInterfaceStateChanged = 0x00000012,
    HcnNotificationServiceDisconnect                        = 0x01000000,
    HcnNotificationFlagsReserved                            = 0xf0000000,
}

alias HCN_NOTIFICATION_CALLBACK = void function(uint, void*, HRESULT, const(wchar)*);
alias HCN_PORT_PROTOCOL = int;
enum : int
{
    HCN_PORT_PROTOCOL_TCP  = 0x00000001,
    HCN_PORT_PROTOCOL_UDP  = 0x00000002,
    HCN_PORT_PROTOCOL_BOTH = 0x00000003,
}

alias HCN_PORT_ACCESS = int;
enum : int
{
    HCN_PORT_ACCESS_EXCLUSIVE = 0x00000001,
    HCN_PORT_ACCESS_SHARED    = 0x00000002,
}

struct HCN_PORT_RANGE_RESERVATION
{
    ushort startingPort;
    ushort endingPort;
}
struct HCN_PORT_RANGE_ENTRY
{
    GUID OwningPartitionId;
    GUID TargetPartitionId;
    HCN_PORT_PROTOCOL Protocol;
    ulong Priority;
    uint ReservationType;
    uint SharingFlags;
    uint DeliveryMode;
    ushort StartingPort;
    ushort EndingPort;
}
HRESULT HcnEnumerateNetworks(const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnCreateNetwork(const(GUID)*, const(wchar)*, void**, PWSTR*);
HRESULT HcnOpenNetwork(const(GUID)*, void**, PWSTR*);
HRESULT HcnModifyNetwork(void*, const(wchar)*, PWSTR*);
HRESULT HcnQueryNetworkProperties(void*, const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnDeleteNetwork(const(GUID)*, PWSTR*);
HRESULT HcnCloseNetwork(void*);
HRESULT HcnEnumerateNamespaces(const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnCreateNamespace(const(GUID)*, const(wchar)*, void**, PWSTR*);
HRESULT HcnOpenNamespace(const(GUID)*, void**, PWSTR*);
HRESULT HcnModifyNamespace(void*, const(wchar)*, PWSTR*);
HRESULT HcnQueryNamespaceProperties(void*, const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnDeleteNamespace(const(GUID)*, PWSTR*);
HRESULT HcnCloseNamespace(void*);
HRESULT HcnEnumerateEndpoints(const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnCreateEndpoint(void*, const(GUID)*, const(wchar)*, void**, PWSTR*);
HRESULT HcnOpenEndpoint(const(GUID)*, void**, PWSTR*);
HRESULT HcnModifyEndpoint(void*, const(wchar)*, PWSTR*);
HRESULT HcnQueryEndpointProperties(void*, const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnDeleteEndpoint(const(GUID)*, PWSTR*);
HRESULT HcnCloseEndpoint(void*);
HRESULT HcnEnumerateLoadBalancers(const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnCreateLoadBalancer(const(GUID)*, const(wchar)*, void**, PWSTR*);
HRESULT HcnOpenLoadBalancer(const(GUID)*, void**, PWSTR*);
HRESULT HcnModifyLoadBalancer(void*, const(wchar)*, PWSTR*);
HRESULT HcnQueryLoadBalancerProperties(void*, const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnDeleteLoadBalancer(const(GUID)*, PWSTR*);
HRESULT HcnCloseLoadBalancer(void*);
HRESULT HcnRegisterServiceCallback(HCN_NOTIFICATION_CALLBACK, void*, void**);
HRESULT HcnUnregisterServiceCallback(void*);
HRESULT HcnRegisterGuestNetworkServiceCallback(void*, HCN_NOTIFICATION_CALLBACK, void*, void**);
HRESULT HcnUnregisterGuestNetworkServiceCallback(void*);
HRESULT HcnCreateGuestNetworkService(const(GUID)*, const(wchar)*, void**, PWSTR*);
HRESULT HcnCloseGuestNetworkService(void*);
HRESULT HcnModifyGuestNetworkService(void*, const(wchar)*, PWSTR*);
HRESULT HcnDeleteGuestNetworkService(const(GUID)*, PWSTR*);
HRESULT HcnReserveGuestNetworkServicePort(void*, HCN_PORT_PROTOCOL, HCN_PORT_ACCESS, ushort, HANDLE*);
HRESULT HcnReserveGuestNetworkServicePortRange(void*, ushort, HCN_PORT_RANGE_RESERVATION*, HANDLE*);
HRESULT HcnReleaseGuestNetworkServicePortReservationHandle(HANDLE);
HRESULT HcnEnumerateGuestNetworkPortReservations(uint*, HCN_PORT_RANGE_ENTRY**);
void HcnFreeGuestNetworkPortReservations(HCN_PORT_RANGE_ENTRY*);
HRESULT HcnQueryEndpointStats(void*, const(wchar)*, PWSTR*, PWSTR*);
HRESULT HcnQueryEndpointAddresses(void*, const(wchar)*, PWSTR*, PWSTR*);
