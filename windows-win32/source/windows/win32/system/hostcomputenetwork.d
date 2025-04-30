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

alias HCN_NOTIFICATION_CALLBACK = void function(uint NotificationType, void* Context, HRESULT NotificationStatus, const(wchar)* NotificationData);
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
HRESULT HcnEnumerateNetworks(const(wchar)* Query, PWSTR* Networks, PWSTR* ErrorRecord);
HRESULT HcnCreateNetwork(const(GUID)* Id, const(wchar)* Settings, void** Network, PWSTR* ErrorRecord);
HRESULT HcnOpenNetwork(const(GUID)* Id, void** Network, PWSTR* ErrorRecord);
HRESULT HcnModifyNetwork(void* Network, const(wchar)* Settings, PWSTR* ErrorRecord);
HRESULT HcnQueryNetworkProperties(void* Network, const(wchar)* Query, PWSTR* Properties, PWSTR* ErrorRecord);
HRESULT HcnDeleteNetwork(const(GUID)* Id, PWSTR* ErrorRecord);
HRESULT HcnCloseNetwork(void* Network);
HRESULT HcnEnumerateNamespaces(const(wchar)* Query, PWSTR* Namespaces, PWSTR* ErrorRecord);
HRESULT HcnCreateNamespace(const(GUID)* Id, const(wchar)* Settings, void** Namespace, PWSTR* ErrorRecord);
HRESULT HcnOpenNamespace(const(GUID)* Id, void** Namespace, PWSTR* ErrorRecord);
HRESULT HcnModifyNamespace(void* Namespace, const(wchar)* Settings, PWSTR* ErrorRecord);
HRESULT HcnQueryNamespaceProperties(void* Namespace, const(wchar)* Query, PWSTR* Properties, PWSTR* ErrorRecord);
HRESULT HcnDeleteNamespace(const(GUID)* Id, PWSTR* ErrorRecord);
HRESULT HcnCloseNamespace(void* Namespace);
HRESULT HcnEnumerateEndpoints(const(wchar)* Query, PWSTR* Endpoints, PWSTR* ErrorRecord);
HRESULT HcnCreateEndpoint(void* Network, const(GUID)* Id, const(wchar)* Settings, void** Endpoint, PWSTR* ErrorRecord);
HRESULT HcnOpenEndpoint(const(GUID)* Id, void** Endpoint, PWSTR* ErrorRecord);
HRESULT HcnModifyEndpoint(void* Endpoint, const(wchar)* Settings, PWSTR* ErrorRecord);
HRESULT HcnQueryEndpointProperties(void* Endpoint, const(wchar)* Query, PWSTR* Properties, PWSTR* ErrorRecord);
HRESULT HcnDeleteEndpoint(const(GUID)* Id, PWSTR* ErrorRecord);
HRESULT HcnCloseEndpoint(void* Endpoint);
HRESULT HcnEnumerateLoadBalancers(const(wchar)* Query, PWSTR* LoadBalancer, PWSTR* ErrorRecord);
HRESULT HcnCreateLoadBalancer(const(GUID)* Id, const(wchar)* Settings, void** LoadBalancer, PWSTR* ErrorRecord);
HRESULT HcnOpenLoadBalancer(const(GUID)* Id, void** LoadBalancer, PWSTR* ErrorRecord);
HRESULT HcnModifyLoadBalancer(void* LoadBalancer, const(wchar)* Settings, PWSTR* ErrorRecord);
HRESULT HcnQueryLoadBalancerProperties(void* LoadBalancer, const(wchar)* Query, PWSTR* Properties, PWSTR* ErrorRecord);
HRESULT HcnDeleteLoadBalancer(const(GUID)* Id, PWSTR* ErrorRecord);
HRESULT HcnCloseLoadBalancer(void* LoadBalancer);
HRESULT HcnRegisterServiceCallback(HCN_NOTIFICATION_CALLBACK Callback, void* Context, void** CallbackHandle);
HRESULT HcnUnregisterServiceCallback(void* CallbackHandle);
HRESULT HcnRegisterGuestNetworkServiceCallback(void* GuestNetworkService, HCN_NOTIFICATION_CALLBACK Callback, void* Context, void** CallbackHandle);
HRESULT HcnUnregisterGuestNetworkServiceCallback(void* CallbackHandle);
HRESULT HcnCreateGuestNetworkService(const(GUID)* Id, const(wchar)* Settings, void** GuestNetworkService, PWSTR* ErrorRecord);
HRESULT HcnCloseGuestNetworkService(void* GuestNetworkService);
HRESULT HcnModifyGuestNetworkService(void* GuestNetworkService, const(wchar)* Settings, PWSTR* ErrorRecord);
HRESULT HcnDeleteGuestNetworkService(const(GUID)* Id, PWSTR* ErrorRecord);
HRESULT HcnReserveGuestNetworkServicePort(void* GuestNetworkService, HCN_PORT_PROTOCOL Protocol, HCN_PORT_ACCESS Access, ushort Port, HANDLE* PortReservationHandle);
HRESULT HcnReserveGuestNetworkServicePortRange(void* GuestNetworkService, ushort PortCount, HCN_PORT_RANGE_RESERVATION* PortRangeReservation, HANDLE* PortReservationHandle);
HRESULT HcnReleaseGuestNetworkServicePortReservationHandle(HANDLE PortReservationHandle);
HRESULT HcnEnumerateGuestNetworkPortReservations(uint* ReturnCount, HCN_PORT_RANGE_ENTRY** PortEntries);
void HcnFreeGuestNetworkPortReservations(HCN_PORT_RANGE_ENTRY* PortEntries);
HRESULT HcnQueryEndpointStats(void* Endpoint, const(wchar)* Query, PWSTR* Stats, PWSTR* ErrorRecord);
HRESULT HcnQueryEndpointAddresses(void* Endpoint, const(wchar)* Query, PWSTR* Addresses, PWSTR* ErrorRecord);
