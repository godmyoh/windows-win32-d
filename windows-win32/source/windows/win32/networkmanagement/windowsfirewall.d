module windows.win32.networkmanagement.windowsfirewall;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE, HRESULT, HWND, PSID, PWSTR, VARIANT_BOOL;
import windows.win32.security_ : SID, SID_AND_ATTRIBUTES;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;

version (Windows):
extern (Windows):

HRESULT NetworkIsolationSetupAppContainerBinaries(PSID, const(wchar)*, const(wchar)*, const(wchar)*, BOOL, const(wchar)**, uint);
uint NetworkIsolationRegisterForAppContainerChanges(uint, PAC_CHANGES_CALLBACK_FN, void*, HANDLE*);
uint NetworkIsolationUnregisterForAppContainerChanges(HANDLE);
uint NetworkIsolationFreeAppContainers(INET_FIREWALL_APP_CONTAINER*);
uint NetworkIsolationEnumAppContainers(uint, uint*, INET_FIREWALL_APP_CONTAINER**);
uint NetworkIsolationGetAppContainerConfig(uint*, SID_AND_ATTRIBUTES**);
uint NetworkIsolationSetAppContainerConfig(uint, SID_AND_ATTRIBUTES*);
uint NetworkIsolationDiagnoseConnectFailureAndGetInfo(const(wchar)*, NETISO_ERROR_TYPE*);
enum NETCON_MAX_NAME_LEN = 0x00000100;
enum S_OBJECT_NO_LONGER_VALID = 0x00000002;
enum NETISO_GEID_FOR_WDAG = 0x00000001;
enum NETISO_GEID_FOR_NEUTRAL_AWARE = 0x00000002;
enum CLSID_UPnPNAT = GUID(0xae1e00aa, 0x3fd5, 0x403c, [0x8a, 0x27, 0x2b, 0xbd, 0xc3, 0xc, 0xd0, 0xe1]);
struct UPnPNAT
{
}
enum IID_IUPnPNAT = GUID(0xb171c812, 0xcc76, 0x485a, [0x94, 0xd8, 0xb6, 0xb3, 0xa2, 0x79, 0x4e, 0x99]);
interface IUPnPNAT : IDispatch
{
    HRESULT get_StaticPortMappingCollection(IStaticPortMappingCollection*);
    HRESULT get_DynamicPortMappingCollection(IDynamicPortMappingCollection*);
    HRESULT get_NATEventManager(INATEventManager*);
}
enum IID_INATEventManager = GUID(0x624bd588, 0x9060, 0x4109, [0xb0, 0xb0, 0x1a, 0xdb, 0xbc, 0xac, 0x32, 0xdf]);
interface INATEventManager : IDispatch
{
    HRESULT put_ExternalIPAddressCallback(IUnknown);
    HRESULT put_NumberOfEntriesCallback(IUnknown);
}
enum IID_INATExternalIPAddressCallback = GUID(0x9c416740, 0xa34e, 0x446f, [0xba, 0x6, 0xab, 0xd0, 0x4c, 0x31, 0x49, 0xae]);
interface INATExternalIPAddressCallback : IUnknown
{
    HRESULT NewExternalIPAddress(BSTR);
}
enum IID_INATNumberOfEntriesCallback = GUID(0xc83a0a74, 0x91ee, 0x41b6, [0xb6, 0x7a, 0x67, 0xe0, 0xf0, 0xb, 0xbd, 0x78]);
interface INATNumberOfEntriesCallback : IUnknown
{
    HRESULT NewNumberOfEntries(int);
}
enum IID_IDynamicPortMappingCollection = GUID(0xb60de00f, 0x156e, 0x4e8d, [0x9e, 0xc1, 0x3a, 0x23, 0x42, 0xc1, 0x8, 0x99]);
interface IDynamicPortMappingCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(BSTR, int, BSTR, IDynamicPortMapping*);
    HRESULT get_Count(int*);
    HRESULT Remove(BSTR, int, BSTR);
    HRESULT Add(BSTR, int, BSTR, int, BSTR, VARIANT_BOOL, BSTR, int, IDynamicPortMapping*);
}
enum IID_IDynamicPortMapping = GUID(0x4fc80282, 0x23b6, 0x4378, [0x9a, 0x27, 0xcd, 0x8f, 0x17, 0xc9, 0x40, 0xc]);
interface IDynamicPortMapping : IDispatch
{
    HRESULT get_ExternalIPAddress(BSTR*);
    HRESULT get_RemoteHost(BSTR*);
    HRESULT get_ExternalPort(int*);
    HRESULT get_Protocol(BSTR*);
    HRESULT get_InternalPort(int*);
    HRESULT get_InternalClient(BSTR*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT get_Description(BSTR*);
    HRESULT get_LeaseDuration(int*);
    HRESULT RenewLease(int, int*);
    HRESULT EditInternalClient(BSTR);
    HRESULT Enable(VARIANT_BOOL);
    HRESULT EditDescription(BSTR);
    HRESULT EditInternalPort(int);
}
enum IID_IStaticPortMappingCollection = GUID(0xcd1f3e77, 0x66d6, 0x4664, [0x82, 0xc7, 0x36, 0xdb, 0xb6, 0x41, 0xd0, 0xf1]);
interface IStaticPortMappingCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, BSTR, IStaticPortMapping*);
    HRESULT get_Count(int*);
    HRESULT Remove(int, BSTR);
    HRESULT Add(int, BSTR, int, BSTR, VARIANT_BOOL, BSTR, IStaticPortMapping*);
}
enum IID_IStaticPortMapping = GUID(0x6f10711f, 0x729b, 0x41e5, [0x93, 0xb8, 0xf2, 0x1d, 0xf, 0x81, 0x8d, 0xf1]);
interface IStaticPortMapping : IDispatch
{
    HRESULT get_ExternalIPAddress(BSTR*);
    HRESULT get_ExternalPort(int*);
    HRESULT get_InternalPort(int*);
    HRESULT get_Protocol(BSTR*);
    HRESULT get_InternalClient(BSTR*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT get_Description(BSTR*);
    HRESULT EditInternalClient(BSTR);
    HRESULT Enable(VARIANT_BOOL);
    HRESULT EditDescription(BSTR);
    HRESULT EditInternalPort(int);
}
enum CLSID_NetSharingManager = GUID(0x5c63c1ad, 0x3956, 0x4ff8, [0x84, 0x86, 0x40, 0x3, 0x47, 0x58, 0x31, 0x5b]);
struct NetSharingManager
{
}
enum IID_IEnumNetConnection = GUID(0xc08956a0, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetConnection : IUnknown
{
    HRESULT Next(uint, INetConnection*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetConnection*);
}
alias NETCON_CHARACTERISTIC_FLAGS = int;
enum : int
{
    NCCF_NONE              = 0x00000000,
    NCCF_ALL_USERS         = 0x00000001,
    NCCF_ALLOW_DUPLICATION = 0x00000002,
    NCCF_ALLOW_REMOVAL     = 0x00000004,
    NCCF_ALLOW_RENAME      = 0x00000008,
    NCCF_INCOMING_ONLY     = 0x00000020,
    NCCF_OUTGOING_ONLY     = 0x00000040,
    NCCF_BRANDED           = 0x00000080,
    NCCF_SHARED            = 0x00000100,
    NCCF_BRIDGED           = 0x00000200,
    NCCF_FIREWALLED        = 0x00000400,
    NCCF_DEFAULT           = 0x00000800,
    NCCF_HOMENET_CAPABLE   = 0x00001000,
    NCCF_SHARED_PRIVATE    = 0x00002000,
    NCCF_QUARANTINED       = 0x00004000,
    NCCF_RESERVED          = 0x00008000,
    NCCF_HOSTED_NETWORK    = 0x00010000,
    NCCF_VIRTUAL_STATION   = 0x00020000,
    NCCF_WIFI_DIRECT       = 0x00040000,
    NCCF_BLUETOOTH_MASK    = 0x000f0000,
    NCCF_LAN_MASK          = 0x00f00000,
}

alias NETCON_STATUS = int;
enum : int
{
    NCS_DISCONNECTED             = 0x00000000,
    NCS_CONNECTING               = 0x00000001,
    NCS_CONNECTED                = 0x00000002,
    NCS_DISCONNECTING            = 0x00000003,
    NCS_HARDWARE_NOT_PRESENT     = 0x00000004,
    NCS_HARDWARE_DISABLED        = 0x00000005,
    NCS_HARDWARE_MALFUNCTION     = 0x00000006,
    NCS_MEDIA_DISCONNECTED       = 0x00000007,
    NCS_AUTHENTICATING           = 0x00000008,
    NCS_AUTHENTICATION_SUCCEEDED = 0x00000009,
    NCS_AUTHENTICATION_FAILED    = 0x0000000a,
    NCS_INVALID_ADDRESS          = 0x0000000b,
    NCS_CREDENTIALS_REQUIRED     = 0x0000000c,
    NCS_ACTION_REQUIRED          = 0x0000000d,
    NCS_ACTION_REQUIRED_RETRY    = 0x0000000e,
    NCS_CONNECT_FAILED           = 0x0000000f,
}

alias NETCON_TYPE = int;
enum : int
{
    NCT_DIRECT_CONNECT = 0x00000000,
    NCT_INBOUND        = 0x00000001,
    NCT_INTERNET       = 0x00000002,
    NCT_LAN            = 0x00000003,
    NCT_PHONE          = 0x00000004,
    NCT_TUNNEL         = 0x00000005,
    NCT_BRIDGE         = 0x00000006,
}

alias NETCON_MEDIATYPE = int;
enum : int
{
    NCM_NONE                 = 0x00000000,
    NCM_DIRECT               = 0x00000001,
    NCM_ISDN                 = 0x00000002,
    NCM_LAN                  = 0x00000003,
    NCM_PHONE                = 0x00000004,
    NCM_TUNNEL               = 0x00000005,
    NCM_PPPOE                = 0x00000006,
    NCM_BRIDGE               = 0x00000007,
    NCM_SHAREDACCESSHOST_LAN = 0x00000008,
    NCM_SHAREDACCESSHOST_RAS = 0x00000009,
}

struct NETCON_PROPERTIES
{
    GUID guidId;
    PWSTR pszwName;
    PWSTR pszwDeviceName;
    NETCON_STATUS Status;
    NETCON_MEDIATYPE MediaType;
    uint dwCharacter;
    GUID clsidThisObject;
    GUID clsidUiObject;
}
enum IID_INetConnection = GUID(0xc08956a1, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetConnection : IUnknown
{
    HRESULT Connect();
    HRESULT Disconnect();
    HRESULT Delete();
    HRESULT Duplicate(const(wchar)*, INetConnection*);
    HRESULT GetProperties(NETCON_PROPERTIES**);
    HRESULT GetUiObjectClassId(GUID*);
    HRESULT Rename(const(wchar)*);
}
alias NETCONMGR_ENUM_FLAGS = int;
enum : int
{
    NCME_DEFAULT = 0x00000000,
    NCME_HIDDEN  = 0x00000001,
}

enum IID_INetConnectionManager = GUID(0xc08956a2, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetConnectionManager : IUnknown
{
    HRESULT EnumConnections(NETCONMGR_ENUM_FLAGS, IEnumNetConnection*);
}
alias NETCONUI_CONNECT_FLAGS = int;
enum : int
{
    NCUC_DEFAULT        = 0x00000000,
    NCUC_NO_UI          = 0x00000001,
    NCUC_ENABLE_DISABLE = 0x00000002,
}

enum IID_INetConnectionConnectUi = GUID(0xc08956a3, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetConnectionConnectUi : IUnknown
{
    HRESULT SetConnection(INetConnection);
    HRESULT Connect(HWND, uint);
    HRESULT Disconnect(HWND, uint);
}
enum IID_IEnumNetSharingPortMapping = GUID(0xc08956b0, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetSharingPortMapping : IUnknown
{
    HRESULT Next(uint, VARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetSharingPortMapping*);
}
enum IID_INetSharingPortMappingProps = GUID(0x24b7e9b5, 0xe38f, 0x4685, [0x85, 0x1b, 0x0, 0x89, 0x2c, 0xf5, 0xf9, 0x40]);
interface INetSharingPortMappingProps : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_IPProtocol(ubyte*);
    HRESULT get_ExternalPort(int*);
    HRESULT get_InternalPort(int*);
    HRESULT get_Options(int*);
    HRESULT get_TargetName(BSTR*);
    HRESULT get_TargetIPAddress(BSTR*);
    HRESULT get_Enabled(VARIANT_BOOL*);
}
enum IID_INetSharingPortMapping = GUID(0xc08956b1, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetSharingPortMapping : IDispatch
{
    HRESULT Disable();
    HRESULT Enable();
    HRESULT get_Properties(INetSharingPortMappingProps*);
    HRESULT Delete();
}
enum IID_IEnumNetSharingEveryConnection = GUID(0xc08956b8, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetSharingEveryConnection : IUnknown
{
    HRESULT Next(uint, VARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetSharingEveryConnection*);
}
enum IID_IEnumNetSharingPublicConnection = GUID(0xc08956b4, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetSharingPublicConnection : IUnknown
{
    HRESULT Next(uint, VARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetSharingPublicConnection*);
}
enum IID_IEnumNetSharingPrivateConnection = GUID(0xc08956b5, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetSharingPrivateConnection : IUnknown
{
    HRESULT Next(uint, VARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetSharingPrivateConnection*);
}
enum IID_INetSharingPortMappingCollection = GUID(0x2e4a2de, 0xda20, 0x4e34, [0x89, 0xc8, 0xac, 0x22, 0x27, 0x5a, 0x1, 0xb]);
interface INetSharingPortMappingCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_INetConnectionProps = GUID(0xf4277c95, 0xce5b, 0x463d, [0x81, 0x67, 0x56, 0x62, 0xd9, 0xbc, 0xaa, 0x72]);
interface INetConnectionProps : IDispatch
{
    HRESULT get_Guid(BSTR*);
    HRESULT get_Name(BSTR*);
    HRESULT get_DeviceName(BSTR*);
    HRESULT get_Status(NETCON_STATUS*);
    HRESULT get_MediaType(NETCON_MEDIATYPE*);
    HRESULT get_Characteristics(uint*);
}
alias SHARINGCONNECTIONTYPE = int;
enum : int
{
    ICSSHARINGTYPE_PUBLIC  = 0x00000000,
    ICSSHARINGTYPE_PRIVATE = 0x00000001,
}

alias SHARINGCONNECTION_ENUM_FLAGS = int;
enum : int
{
    ICSSC_DEFAULT = 0x00000000,
    ICSSC_ENABLED = 0x00000001,
}

alias ICS_TARGETTYPE = int;
enum : int
{
    ICSTT_NAME      = 0x00000000,
    ICSTT_IPADDRESS = 0x00000001,
}

enum IID_INetSharingConfiguration = GUID(0xc08956b6, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetSharingConfiguration : IDispatch
{
    HRESULT get_SharingEnabled(VARIANT_BOOL*);
    HRESULT get_SharingConnectionType(SHARINGCONNECTIONTYPE*);
    HRESULT DisableSharing();
    HRESULT EnableSharing(SHARINGCONNECTIONTYPE);
    HRESULT get_InternetFirewallEnabled(VARIANT_BOOL*);
    HRESULT DisableInternetFirewall();
    HRESULT EnableInternetFirewall();
    HRESULT get_EnumPortMappings(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPortMappingCollection*);
    HRESULT AddPortMapping(BSTR, ubyte, ushort, ushort, uint, BSTR, ICS_TARGETTYPE, INetSharingPortMapping*);
    HRESULT RemovePortMapping(INetSharingPortMapping);
}
enum IID_INetSharingEveryConnectionCollection = GUID(0x33c4643c, 0x7811, 0x46fa, [0xa8, 0x9a, 0x76, 0x85, 0x97, 0xbd, 0x72, 0x23]);
interface INetSharingEveryConnectionCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_INetSharingPublicConnectionCollection = GUID(0x7d7a6355, 0xf372, 0x4971, [0xa1, 0x49, 0xbf, 0xc9, 0x27, 0xbe, 0x76, 0x2a]);
interface INetSharingPublicConnectionCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_INetSharingPrivateConnectionCollection = GUID(0x38ae69e0, 0x4409, 0x402a, [0xa2, 0xcb, 0xe9, 0x65, 0xc7, 0x27, 0xf8, 0x40]);
interface INetSharingPrivateConnectionCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
}
enum IID_INetSharingManager = GUID(0xc08956b7, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetSharingManager : IDispatch
{
    HRESULT get_SharingInstalled(VARIANT_BOOL*);
    HRESULT get_EnumPublicConnections(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPublicConnectionCollection*);
    HRESULT get_EnumPrivateConnections(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPrivateConnectionCollection*);
    HRESULT get_INetSharingConfigurationForINetConnection(INetConnection, INetSharingConfiguration*);
    HRESULT get_EnumEveryConnection(INetSharingEveryConnectionCollection*);
    HRESULT get_NetConnectionProps(INetConnection, INetConnectionProps*);
}
enum CLSID_NetFwRule = GUID(0x2c5bc43e, 0x3369, 0x4c33, [0xab, 0xc, 0xbe, 0x94, 0x69, 0x67, 0x7a, 0xf4]);
struct NetFwRule
{
}
enum CLSID_NetFwOpenPort = GUID(0xca545c6, 0x37ad, 0x4a6c, [0xbf, 0x92, 0x9f, 0x76, 0x10, 0x6, 0x7e, 0xf5]);
struct NetFwOpenPort
{
}
enum CLSID_NetFwAuthorizedApplication = GUID(0xec9846b3, 0x2762, 0x4a6b, [0xa2, 0x14, 0x6a, 0xcb, 0x60, 0x34, 0x62, 0xd2]);
struct NetFwAuthorizedApplication
{
}
enum CLSID_NetFwPolicy2 = GUID(0xe2b3c97f, 0x6ae1, 0x41ac, [0x81, 0x7a, 0xf6, 0xf9, 0x21, 0x66, 0xd7, 0xdd]);
struct NetFwPolicy2
{
}
enum CLSID_NetFwProduct = GUID(0x9d745ed8, 0xc514, 0x4d1d, [0xbf, 0x42, 0x75, 0x1f, 0xed, 0x2d, 0x5a, 0xc7]);
struct NetFwProduct
{
}
enum CLSID_NetFwProducts = GUID(0xcc19079b, 0x8272, 0x4d73, [0xbb, 0x70, 0xcd, 0xb5, 0x33, 0x52, 0x7b, 0x61]);
struct NetFwProducts
{
}
enum CLSID_NetFwMgr = GUID(0x304ce942, 0x6e39, 0x40d8, [0x94, 0x3a, 0xb9, 0x13, 0xc4, 0xc, 0x9c, 0xd4]);
struct NetFwMgr
{
}
alias NET_FW_POLICY_TYPE = int;
enum : int
{
    NET_FW_POLICY_GROUP     = 0x00000000,
    NET_FW_POLICY_LOCAL     = 0x00000001,
    NET_FW_POLICY_EFFECTIVE = 0x00000002,
    NET_FW_POLICY_TYPE_MAX  = 0x00000003,
}

alias NET_FW_PROFILE_TYPE = int;
enum : int
{
    NET_FW_PROFILE_DOMAIN   = 0x00000000,
    NET_FW_PROFILE_STANDARD = 0x00000001,
    NET_FW_PROFILE_CURRENT  = 0x00000002,
    NET_FW_PROFILE_TYPE_MAX = 0x00000003,
}

alias NET_FW_PROFILE_TYPE2 = int;
enum : int
{
    NET_FW_PROFILE2_DOMAIN  = 0x00000001,
    NET_FW_PROFILE2_PRIVATE = 0x00000002,
    NET_FW_PROFILE2_PUBLIC  = 0x00000004,
    NET_FW_PROFILE2_ALL     = 0x7fffffff,
}

alias NET_FW_IP_VERSION = int;
enum : int
{
    NET_FW_IP_VERSION_V4  = 0x00000000,
    NET_FW_IP_VERSION_V6  = 0x00000001,
    NET_FW_IP_VERSION_ANY = 0x00000002,
    NET_FW_IP_VERSION_MAX = 0x00000003,
}

alias NET_FW_SCOPE = int;
enum : int
{
    NET_FW_SCOPE_ALL          = 0x00000000,
    NET_FW_SCOPE_LOCAL_SUBNET = 0x00000001,
    NET_FW_SCOPE_CUSTOM       = 0x00000002,
    NET_FW_SCOPE_MAX          = 0x00000003,
}

alias NET_FW_IP_PROTOCOL = int;
enum : int
{
    NET_FW_IP_PROTOCOL_TCP = 0x00000006,
    NET_FW_IP_PROTOCOL_UDP = 0x00000011,
    NET_FW_IP_PROTOCOL_ANY = 0x00000100,
}

alias NET_FW_SERVICE_TYPE = int;
enum : int
{
    NET_FW_SERVICE_FILE_AND_PRINT = 0x00000000,
    NET_FW_SERVICE_UPNP           = 0x00000001,
    NET_FW_SERVICE_REMOTE_DESKTOP = 0x00000002,
    NET_FW_SERVICE_NONE           = 0x00000003,
    NET_FW_SERVICE_TYPE_MAX       = 0x00000004,
}

alias NET_FW_RULE_DIRECTION = int;
enum : int
{
    NET_FW_RULE_DIR_IN  = 0x00000001,
    NET_FW_RULE_DIR_OUT = 0x00000002,
    NET_FW_RULE_DIR_MAX = 0x00000003,
}

alias NET_FW_ACTION = int;
enum : int
{
    NET_FW_ACTION_BLOCK = 0x00000000,
    NET_FW_ACTION_ALLOW = 0x00000001,
    NET_FW_ACTION_MAX   = 0x00000002,
}

alias NET_FW_MODIFY_STATE = int;
enum : int
{
    NET_FW_MODIFY_STATE_OK              = 0x00000000,
    NET_FW_MODIFY_STATE_GP_OVERRIDE     = 0x00000001,
    NET_FW_MODIFY_STATE_INBOUND_BLOCKED = 0x00000002,
}

alias NET_FW_RULE_CATEGORY = int;
enum : int
{
    NET_FW_RULE_CATEGORY_BOOT     = 0x00000000,
    NET_FW_RULE_CATEGORY_STEALTH  = 0x00000001,
    NET_FW_RULE_CATEGORY_FIREWALL = 0x00000002,
    NET_FW_RULE_CATEGORY_CONSEC   = 0x00000003,
    NET_FW_RULE_CATEGORY_MAX      = 0x00000004,
}

alias NET_FW_EDGE_TRAVERSAL_TYPE = int;
enum : int
{
    NET_FW_EDGE_TRAVERSAL_TYPE_DENY          = 0x00000000,
    NET_FW_EDGE_TRAVERSAL_TYPE_ALLOW         = 0x00000001,
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP  = 0x00000002,
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER = 0x00000003,
}

alias NET_FW_AUTHENTICATE_TYPE = int;
enum : int
{
    NET_FW_AUTHENTICATE_NONE                     = 0x00000000,
    NET_FW_AUTHENTICATE_NO_ENCAPSULATION         = 0x00000001,
    NET_FW_AUTHENTICATE_WITH_INTEGRITY           = 0x00000002,
    NET_FW_AUTHENTICATE_AND_NEGOTIATE_ENCRYPTION = 0x00000003,
    NET_FW_AUTHENTICATE_AND_ENCRYPT              = 0x00000004,
}

alias NETISO_FLAG = int;
enum : int
{
    NETISO_FLAG_FORCE_COMPUTE_BINARIES = 0x00000001,
    NETISO_FLAG_MAX                    = 0x00000002,
}

alias INET_FIREWALL_AC_CREATION_TYPE = int;
enum : int
{
    INET_FIREWALL_AC_NONE            = 0x00000000,
    INET_FIREWALL_AC_PACKAGE_ID_ONLY = 0x00000001,
    INET_FIREWALL_AC_BINARY          = 0x00000002,
    INET_FIREWALL_AC_MAX             = 0x00000004,
}

alias INET_FIREWALL_AC_CHANGE_TYPE = int;
enum : int
{
    INET_FIREWALL_AC_CHANGE_INVALID = 0x00000000,
    INET_FIREWALL_AC_CHANGE_CREATE  = 0x00000001,
    INET_FIREWALL_AC_CHANGE_DELETE  = 0x00000002,
    INET_FIREWALL_AC_CHANGE_MAX     = 0x00000003,
}

struct INET_FIREWALL_AC_CAPABILITIES
{
    uint count;
    SID_AND_ATTRIBUTES* capabilities;
}
struct INET_FIREWALL_AC_BINARIES
{
    uint count;
    PWSTR* binaries;
}
struct INET_FIREWALL_AC_CHANGE
{
    INET_FIREWALL_AC_CHANGE_TYPE changeType;
    INET_FIREWALL_AC_CREATION_TYPE createType;
    SID* appContainerSid;
    SID* userSid;
    PWSTR displayName;
    union
    {
        INET_FIREWALL_AC_CAPABILITIES capabilities;
        INET_FIREWALL_AC_BINARIES binaries;
    }
}
struct INET_FIREWALL_APP_CONTAINER
{
    SID* appContainerSid;
    SID* userSid;
    PWSTR appContainerName;
    PWSTR displayName;
    PWSTR description;
    INET_FIREWALL_AC_CAPABILITIES capabilities;
    INET_FIREWALL_AC_BINARIES binaries;
    PWSTR workingDirectory;
    PWSTR packageFullName;
}
alias PAC_CHANGES_CALLBACK_FN = void function(void*, const(INET_FIREWALL_AC_CHANGE)*);
alias NETISO_ERROR_TYPE = int;
enum : int
{
    NETISO_ERROR_TYPE_NONE                   = 0x00000000,
    NETISO_ERROR_TYPE_PRIVATE_NETWORK        = 0x00000001,
    NETISO_ERROR_TYPE_INTERNET_CLIENT        = 0x00000002,
    NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER = 0x00000003,
    NETISO_ERROR_TYPE_MAX                    = 0x00000004,
}

alias PNETISO_EDP_ID_CALLBACK_FN = void function(void*, const(wchar)*, uint);
alias FW_DYNAMIC_KEYWORD_ORIGIN_TYPE = int;
enum : int
{
    FW_DYNAMIC_KEYWORD_ORIGIN_INVALID = 0x00000000,
    FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL   = 0x00000001,
    FW_DYNAMIC_KEYWORD_ORIGIN_MDM     = 0x00000002,
}

struct FW_DYNAMIC_KEYWORD_ADDRESS0
{
    GUID id;
    const(wchar)* keyword;
    uint flags;
    const(wchar)* addresses;
}
struct FW_DYNAMIC_KEYWORD_ADDRESS_DATA0
{
    FW_DYNAMIC_KEYWORD_ADDRESS0 dynamicKeywordAddress;
    FW_DYNAMIC_KEYWORD_ADDRESS_DATA0* next;
    ushort schemaVersion;
    FW_DYNAMIC_KEYWORD_ORIGIN_TYPE originType;
}
alias FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS = int;
enum : int
{
    FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE = 0x00000001,
}

alias FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS = int;
enum : int
{
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE     = 0x00000001,
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE = 0x00000002,
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL              = 0x00000003,
}

alias PFN_FWADDDYNAMICKEYWORDADDRESS0 = uint function(const(FW_DYNAMIC_KEYWORD_ADDRESS0)*);
alias PFN_FWDELETEDYNAMICKEYWORDADDRESS0 = uint function(GUID);
alias PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 = uint function(uint, FW_DYNAMIC_KEYWORD_ADDRESS_DATA0**);
alias PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 = uint function(GUID, FW_DYNAMIC_KEYWORD_ADDRESS_DATA0**);
alias PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 = uint function(FW_DYNAMIC_KEYWORD_ADDRESS_DATA0*);
alias PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 = uint function(GUID, const(wchar)*, BOOL);
enum IID_INetFwRemoteAdminSettings = GUID(0xd4becddf, 0x6f73, 0x4a83, [0xb8, 0x32, 0x9c, 0x66, 0x87, 0x4c, 0xd2, 0xe]);
interface INetFwRemoteAdminSettings : IDispatch
{
    HRESULT get_IpVersion(NET_FW_IP_VERSION*);
    HRESULT put_IpVersion(NET_FW_IP_VERSION);
    HRESULT get_Scope(NET_FW_SCOPE*);
    HRESULT put_Scope(NET_FW_SCOPE);
    HRESULT get_RemoteAddresses(BSTR*);
    HRESULT put_RemoteAddresses(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
}
enum IID_INetFwIcmpSettings = GUID(0xa6207b2e, 0x7cdd, 0x426a, [0x95, 0x1e, 0x5e, 0x1c, 0xbc, 0x5a, 0xfe, 0xad]);
interface INetFwIcmpSettings : IDispatch
{
    HRESULT get_AllowOutboundDestinationUnreachable(VARIANT_BOOL*);
    HRESULT put_AllowOutboundDestinationUnreachable(VARIANT_BOOL);
    HRESULT get_AllowRedirect(VARIANT_BOOL*);
    HRESULT put_AllowRedirect(VARIANT_BOOL);
    HRESULT get_AllowInboundEchoRequest(VARIANT_BOOL*);
    HRESULT put_AllowInboundEchoRequest(VARIANT_BOOL);
    HRESULT get_AllowOutboundTimeExceeded(VARIANT_BOOL*);
    HRESULT put_AllowOutboundTimeExceeded(VARIANT_BOOL);
    HRESULT get_AllowOutboundParameterProblem(VARIANT_BOOL*);
    HRESULT put_AllowOutboundParameterProblem(VARIANT_BOOL);
    HRESULT get_AllowOutboundSourceQuench(VARIANT_BOOL*);
    HRESULT put_AllowOutboundSourceQuench(VARIANT_BOOL);
    HRESULT get_AllowInboundRouterRequest(VARIANT_BOOL*);
    HRESULT put_AllowInboundRouterRequest(VARIANT_BOOL);
    HRESULT get_AllowInboundTimestampRequest(VARIANT_BOOL*);
    HRESULT put_AllowInboundTimestampRequest(VARIANT_BOOL);
    HRESULT get_AllowInboundMaskRequest(VARIANT_BOOL*);
    HRESULT put_AllowInboundMaskRequest(VARIANT_BOOL);
    HRESULT get_AllowOutboundPacketTooBig(VARIANT_BOOL*);
    HRESULT put_AllowOutboundPacketTooBig(VARIANT_BOOL);
}
enum IID_INetFwOpenPort = GUID(0xe0483ba0, 0x47ff, 0x4d9c, [0xa6, 0xd6, 0x77, 0x41, 0xd0, 0xb1, 0x95, 0xf7]);
interface INetFwOpenPort : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_IpVersion(NET_FW_IP_VERSION*);
    HRESULT put_IpVersion(NET_FW_IP_VERSION);
    HRESULT get_Protocol(NET_FW_IP_PROTOCOL*);
    HRESULT put_Protocol(NET_FW_IP_PROTOCOL);
    HRESULT get_Port(int*);
    HRESULT put_Port(int);
    HRESULT get_Scope(NET_FW_SCOPE*);
    HRESULT put_Scope(NET_FW_SCOPE);
    HRESULT get_RemoteAddresses(BSTR*);
    HRESULT put_RemoteAddresses(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_BuiltIn(VARIANT_BOOL*);
}
enum IID_INetFwOpenPorts = GUID(0xc0e9d7fa, 0xe07e, 0x430a, [0xb1, 0x9a, 0x9, 0xc, 0xe8, 0x2d, 0x92, 0xe2]);
interface INetFwOpenPorts : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Add(INetFwOpenPort);
    HRESULT Remove(int, NET_FW_IP_PROTOCOL);
    HRESULT Item(int, NET_FW_IP_PROTOCOL, INetFwOpenPort*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_INetFwService = GUID(0x79fd57c8, 0x908e, 0x4a36, [0x98, 0x88, 0xd5, 0xb3, 0xf0, 0xa4, 0x44, 0xcf]);
interface INetFwService : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Type(NET_FW_SERVICE_TYPE*);
    HRESULT get_Customized(VARIANT_BOOL*);
    HRESULT get_IpVersion(NET_FW_IP_VERSION*);
    HRESULT put_IpVersion(NET_FW_IP_VERSION);
    HRESULT get_Scope(NET_FW_SCOPE*);
    HRESULT put_Scope(NET_FW_SCOPE);
    HRESULT get_RemoteAddresses(BSTR*);
    HRESULT put_RemoteAddresses(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_GloballyOpenPorts(INetFwOpenPorts*);
}
enum IID_INetFwServices = GUID(0x79649bb4, 0x903e, 0x421b, [0x94, 0xc9, 0x79, 0x84, 0x8e, 0x79, 0xf6, 0xee]);
interface INetFwServices : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Item(NET_FW_SERVICE_TYPE, INetFwService*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_INetFwAuthorizedApplication = GUID(0xb5e64ffa, 0xc2c5, 0x444e, [0xa3, 0x1, 0xfb, 0x5e, 0x0, 0x1, 0x80, 0x50]);
interface INetFwAuthorizedApplication : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_ProcessImageFileName(BSTR*);
    HRESULT put_ProcessImageFileName(BSTR);
    HRESULT get_IpVersion(NET_FW_IP_VERSION*);
    HRESULT put_IpVersion(NET_FW_IP_VERSION);
    HRESULT get_Scope(NET_FW_SCOPE*);
    HRESULT put_Scope(NET_FW_SCOPE);
    HRESULT get_RemoteAddresses(BSTR*);
    HRESULT put_RemoteAddresses(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
}
enum IID_INetFwAuthorizedApplications = GUID(0x644efd52, 0xccf9, 0x486c, [0x97, 0xa2, 0x39, 0xf3, 0x52, 0x57, 0xb, 0x30]);
interface INetFwAuthorizedApplications : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Add(INetFwAuthorizedApplication);
    HRESULT Remove(BSTR);
    HRESULT Item(BSTR, INetFwAuthorizedApplication*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_INetFwRule = GUID(0xaf230d27, 0xbaba, 0x4e42, [0xac, 0xed, 0xf5, 0x24, 0xf2, 0x2c, 0xfc, 0xe2]);
interface INetFwRule : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationName(BSTR*);
    HRESULT put_ApplicationName(BSTR);
    HRESULT get_ServiceName(BSTR*);
    HRESULT put_ServiceName(BSTR);
    HRESULT get_Protocol(int*);
    HRESULT put_Protocol(int);
    HRESULT get_LocalPorts(BSTR*);
    HRESULT put_LocalPorts(BSTR);
    HRESULT get_RemotePorts(BSTR*);
    HRESULT put_RemotePorts(BSTR);
    HRESULT get_LocalAddresses(BSTR*);
    HRESULT put_LocalAddresses(BSTR);
    HRESULT get_RemoteAddresses(BSTR*);
    HRESULT put_RemoteAddresses(BSTR);
    HRESULT get_IcmpTypesAndCodes(BSTR*);
    HRESULT put_IcmpTypesAndCodes(BSTR);
    HRESULT get_Direction(NET_FW_RULE_DIRECTION*);
    HRESULT put_Direction(NET_FW_RULE_DIRECTION);
    HRESULT get_Interfaces(VARIANT*);
    HRESULT put_Interfaces(VARIANT);
    HRESULT get_InterfaceTypes(BSTR*);
    HRESULT put_InterfaceTypes(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_Grouping(BSTR*);
    HRESULT put_Grouping(BSTR);
    HRESULT get_Profiles(int*);
    HRESULT put_Profiles(int);
    HRESULT get_EdgeTraversal(VARIANT_BOOL*);
    HRESULT put_EdgeTraversal(VARIANT_BOOL);
    HRESULT get_Action(NET_FW_ACTION*);
    HRESULT put_Action(NET_FW_ACTION);
}
enum IID_INetFwRule2 = GUID(0x9c27c8da, 0x189b, 0x4dde, [0x89, 0xf7, 0x8b, 0x39, 0xa3, 0x16, 0x78, 0x2c]);
interface INetFwRule2 : INetFwRule
{
    HRESULT get_EdgeTraversalOptions(int*);
    HRESULT put_EdgeTraversalOptions(int);
}
enum IID_INetFwRule3 = GUID(0xb21563ff, 0xd696, 0x4222, [0xab, 0x46, 0x4e, 0x89, 0xb7, 0x3a, 0xb3, 0x4a]);
interface INetFwRule3 : INetFwRule2
{
    HRESULT get_LocalAppPackageId(BSTR*);
    HRESULT put_LocalAppPackageId(BSTR);
    HRESULT get_LocalUserOwner(BSTR*);
    HRESULT put_LocalUserOwner(BSTR);
    HRESULT get_LocalUserAuthorizedList(BSTR*);
    HRESULT put_LocalUserAuthorizedList(BSTR);
    HRESULT get_RemoteUserAuthorizedList(BSTR*);
    HRESULT put_RemoteUserAuthorizedList(BSTR);
    HRESULT get_RemoteMachineAuthorizedList(BSTR*);
    HRESULT put_RemoteMachineAuthorizedList(BSTR);
    HRESULT get_SecureFlags(int*);
    HRESULT put_SecureFlags(int);
}
enum IID_INetFwRules = GUID(0x9c4c6277, 0x5027, 0x441e, [0xaf, 0xae, 0xca, 0x1f, 0x54, 0x2d, 0xa0, 0x9]);
interface INetFwRules : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Add(INetFwRule);
    HRESULT Remove(BSTR);
    HRESULT Item(BSTR, INetFwRule*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_INetFwServiceRestriction = GUID(0x8267bbe3, 0xf890, 0x491c, [0xb7, 0xb6, 0x2d, 0xb1, 0xef, 0xe, 0x5d, 0x2b]);
interface INetFwServiceRestriction : IDispatch
{
    HRESULT RestrictService(BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL);
    HRESULT ServiceRestricted(BSTR, BSTR, VARIANT_BOOL*);
    HRESULT get_Rules(INetFwRules*);
}
enum IID_INetFwProfile = GUID(0x174a0dda, 0xe9f9, 0x449d, [0x99, 0x3b, 0x21, 0xab, 0x66, 0x7c, 0xa4, 0x56]);
interface INetFwProfile : IDispatch
{
    HRESULT get_Type(NET_FW_PROFILE_TYPE*);
    HRESULT get_FirewallEnabled(VARIANT_BOOL*);
    HRESULT put_FirewallEnabled(VARIANT_BOOL);
    HRESULT get_ExceptionsNotAllowed(VARIANT_BOOL*);
    HRESULT put_ExceptionsNotAllowed(VARIANT_BOOL);
    HRESULT get_NotificationsDisabled(VARIANT_BOOL*);
    HRESULT put_NotificationsDisabled(VARIANT_BOOL);
    HRESULT get_UnicastResponsesToMulticastBroadcastDisabled(VARIANT_BOOL*);
    HRESULT put_UnicastResponsesToMulticastBroadcastDisabled(VARIANT_BOOL);
    HRESULT get_RemoteAdminSettings(INetFwRemoteAdminSettings*);
    HRESULT get_IcmpSettings(INetFwIcmpSettings*);
    HRESULT get_GloballyOpenPorts(INetFwOpenPorts*);
    HRESULT get_Services(INetFwServices*);
    HRESULT get_AuthorizedApplications(INetFwAuthorizedApplications*);
}
enum IID_INetFwPolicy = GUID(0xd46d2478, 0x9ac9, 0x4008, [0x9d, 0xc7, 0x55, 0x63, 0xce, 0x55, 0x36, 0xcc]);
interface INetFwPolicy : IDispatch
{
    HRESULT get_CurrentProfile(INetFwProfile*);
    HRESULT GetProfileByType(NET_FW_PROFILE_TYPE, INetFwProfile*);
}
enum IID_INetFwPolicy2 = GUID(0x98325047, 0xc671, 0x4174, [0x8d, 0x81, 0xde, 0xfc, 0xd3, 0xf0, 0x31, 0x86]);
interface INetFwPolicy2 : IDispatch
{
    HRESULT get_CurrentProfileTypes(int*);
    HRESULT get_FirewallEnabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL*);
    HRESULT put_FirewallEnabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL);
    HRESULT get_ExcludedInterfaces(NET_FW_PROFILE_TYPE2, VARIANT*);
    HRESULT put_ExcludedInterfaces(NET_FW_PROFILE_TYPE2, VARIANT);
    HRESULT get_BlockAllInboundTraffic(NET_FW_PROFILE_TYPE2, VARIANT_BOOL*);
    HRESULT put_BlockAllInboundTraffic(NET_FW_PROFILE_TYPE2, VARIANT_BOOL);
    HRESULT get_NotificationsDisabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL*);
    HRESULT put_NotificationsDisabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL);
    HRESULT get_UnicastResponsesToMulticastBroadcastDisabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL*);
    HRESULT put_UnicastResponsesToMulticastBroadcastDisabled(NET_FW_PROFILE_TYPE2, VARIANT_BOOL);
    HRESULT get_Rules(INetFwRules*);
    HRESULT get_ServiceRestriction(INetFwServiceRestriction*);
    HRESULT EnableRuleGroup(int, BSTR, VARIANT_BOOL);
    HRESULT IsRuleGroupEnabled(int, BSTR, VARIANT_BOOL*);
    HRESULT RestoreLocalFirewallDefaults();
    HRESULT get_DefaultInboundAction(NET_FW_PROFILE_TYPE2, NET_FW_ACTION*);
    HRESULT put_DefaultInboundAction(NET_FW_PROFILE_TYPE2, NET_FW_ACTION);
    HRESULT get_DefaultOutboundAction(NET_FW_PROFILE_TYPE2, NET_FW_ACTION*);
    HRESULT put_DefaultOutboundAction(NET_FW_PROFILE_TYPE2, NET_FW_ACTION);
    HRESULT get_IsRuleGroupCurrentlyEnabled(BSTR, VARIANT_BOOL*);
    HRESULT get_LocalPolicyModifyState(NET_FW_MODIFY_STATE*);
}
enum IID_INetFwMgr = GUID(0xf7898af5, 0xcac4, 0x4632, [0xa2, 0xec, 0xda, 0x6, 0xe5, 0x11, 0x1a, 0xf2]);
interface INetFwMgr : IDispatch
{
    HRESULT get_LocalPolicy(INetFwPolicy*);
    HRESULT get_CurrentProfileType(NET_FW_PROFILE_TYPE*);
    HRESULT RestoreDefaults();
    HRESULT IsPortAllowed(BSTR, NET_FW_IP_VERSION, int, BSTR, NET_FW_IP_PROTOCOL, VARIANT*, VARIANT*);
    HRESULT IsIcmpTypeAllowed(NET_FW_IP_VERSION, BSTR, ubyte, VARIANT*, VARIANT*);
}
enum IID_INetFwProduct = GUID(0x71881699, 0x18f4, 0x458b, [0xb8, 0x92, 0x3f, 0xfc, 0xe5, 0xe0, 0x7f, 0x75]);
interface INetFwProduct : IDispatch
{
    HRESULT get_RuleCategories(VARIANT*);
    HRESULT put_RuleCategories(VARIANT);
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_PathToSignedProductExe(BSTR*);
}
enum IID_INetFwProducts = GUID(0x39eb36e0, 0x2097, 0x40bd, [0x8a, 0xf2, 0x63, 0xa1, 0x3b, 0x52, 0x53, 0x62]);
interface INetFwProducts : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Register(INetFwProduct, IUnknown*);
    HRESULT Item(int, INetFwProduct*);
    HRESULT get__NewEnum(IUnknown*);
}
