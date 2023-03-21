module windows.win32.networkmanagement.windowsnetworkvirtualization;

import windows.win32.foundation : HANDLE;
import windows.win32.networking.winsock : ADDRESS_FAMILY, DL_EUI48, IN6_ADDR, IN_ADDR, NL_DAD_STATE;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

HANDLE WnvOpen();
uint WnvRequestNotification(HANDLE, WNV_NOTIFICATION_PARAM*, OVERLAPPED*, uint*);
enum WNV_API_MAJOR_VERSION_1 = 0x00000001;
enum WNV_API_MINOR_VERSION_0 = 0x00000000;
alias WNV_NOTIFICATION_TYPE = int;
enum : int
{
    WnvPolicyMismatchType  = 0x00000000,
    WnvRedirectType        = 0x00000001,
    WnvObjectChangeType    = 0x00000002,
    WnvNotificationTypeMax = 0x00000003,
}

alias WNV_OBJECT_TYPE = int;
enum : int
{
    WnvProviderAddressType = 0x00000000,
    WnvCustomerAddressType = 0x00000001,
    WnvObjectTypeMax       = 0x00000002,
}

alias WNV_CA_NOTIFICATION_TYPE = int;
enum : int
{
    WnvCustomerAddressAdded   = 0x00000000,
    WnvCustomerAddressDeleted = 0x00000001,
    WnvCustomerAddressMoved   = 0x00000002,
    WnvCustomerAddressMax     = 0x00000003,
}

struct WNV_OBJECT_HEADER
{
    ubyte MajorVersion;
    ubyte MinorVersion;
    uint Size;
}
struct WNV_NOTIFICATION_PARAM
{
    WNV_OBJECT_HEADER Header;
    WNV_NOTIFICATION_TYPE NotificationType;
    uint PendingNotifications;
    ubyte* Buffer;
}
struct WNV_IP_ADDRESS
{
    union _IP_e__Union
    {
        IN_ADDR v4;
        IN6_ADDR v6;
        ubyte[16] Addr;
    }
}
struct WNV_POLICY_MISMATCH_PARAM
{
    ADDRESS_FAMILY CAFamily;
    ADDRESS_FAMILY PAFamily;
    uint VirtualSubnetId;
    WNV_IP_ADDRESS CA;
    WNV_IP_ADDRESS PA;
}
struct WNV_PROVIDER_ADDRESS_CHANGE_PARAM
{
    ADDRESS_FAMILY PAFamily;
    WNV_IP_ADDRESS PA;
    NL_DAD_STATE AddressState;
}
struct WNV_CUSTOMER_ADDRESS_CHANGE_PARAM
{
    DL_EUI48 MACAddress;
    ADDRESS_FAMILY CAFamily;
    WNV_IP_ADDRESS CA;
    uint VirtualSubnetId;
    ADDRESS_FAMILY PAFamily;
    WNV_IP_ADDRESS PA;
    WNV_CA_NOTIFICATION_TYPE NotificationReason;
}
struct WNV_OBJECT_CHANGE_PARAM
{
    WNV_OBJECT_TYPE ObjectType;
    union _ObjectParam_e__Union
    {
        WNV_PROVIDER_ADDRESS_CHANGE_PARAM ProviderAddressChange;
        WNV_CUSTOMER_ADDRESS_CHANGE_PARAM CustomerAddressChange;
    }
}
struct WNV_REDIRECT_PARAM
{
    ADDRESS_FAMILY CAFamily;
    ADDRESS_FAMILY PAFamily;
    ADDRESS_FAMILY NewPAFamily;
    uint VirtualSubnetId;
    WNV_IP_ADDRESS CA;
    WNV_IP_ADDRESS PA;
    WNV_IP_ADDRESS NewPA;
}
