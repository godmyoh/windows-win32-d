module windows.win32.networkmanagement.wnet;

import windows.win32.foundation : BOOL, HANDLE, HWND, LUID, PSTR, PWSTR, WIN32_ERROR;

version (Windows):
extern (Windows):

alias UNC_INFO_LEVEL = uint;
enum : uint
{
    UNIVERSAL_NAME_INFO_LEVEL = 0x00000001,
    REMOTE_NAME_INFO_LEVEL    = 0x00000002,
}

alias WNPERM_DLG = uint;
enum : uint
{
    WNPERM_DLG_PERM  = 0x00000000,
    WNPERM_DLG_AUDIT = 0x00000001,
    WNPERM_DLG_OWNER = 0x00000002,
}

alias WNET_OPEN_ENUM_USAGE = uint;
enum : uint
{
    RESOURCEUSAGE_NONE        = 0x00000000,
    RESOURCEUSAGE_CONNECTABLE = 0x00000001,
    RESOURCEUSAGE_CONTAINER   = 0x00000002,
    RESOURCEUSAGE_ATTACHED    = 0x00000010,
    RESOURCEUSAGE_ALL         = 0x00000013,
}

alias NET_USE_CONNECT_FLAGS = uint;
enum : uint
{
    CONNECT_INTERACTIVE    = 0x00000008,
    CONNECT_PROMPT         = 0x00000010,
    CONNECT_REDIRECT       = 0x00000080,
    CONNECT_UPDATE_PROFILE = 0x00000001,
    CONNECT_COMMANDLINE    = 0x00000800,
    CONNECT_CMD_SAVECRED   = 0x00001000,
    CONNECT_TEMPORARY      = 0x00000004,
    CONNECT_DEFERRED       = 0x00000400,
    CONNECT_UPDATE_RECENT  = 0x00000002,
}

alias NP_PROPERTY_DIALOG_SELECTION = uint;
enum : uint
{
    WNPS_FILE = 0x00000000,
    WNPS_DIR  = 0x00000001,
    WNPS_MULT = 0x00000002,
}

alias NPDIRECTORY_NOTIFY_OPERATION = uint;
enum : uint
{
    WNDN_MKDIR = 0x00000001,
    WNDN_RMDIR = 0x00000002,
    WNDN_MVDIR = 0x00000003,
}

alias NET_RESOURCE_TYPE = uint;
enum : uint
{
    RESOURCETYPE_ANY   = 0x00000000,
    RESOURCETYPE_DISK  = 0x00000001,
    RESOURCETYPE_PRINT = 0x00000002,
}

alias NETWORK_NAME_FORMAT_FLAGS = uint;
enum : uint
{
    WNFMT_MULTILINE   = 0x00000001,
    WNFMT_ABBREVIATED = 0x00000002,
}

alias NET_RESOURCE_SCOPE = uint;
enum : uint
{
    RESOURCE_CONNECTED  = 0x00000001,
    RESOURCE_CONTEXT    = 0x00000005,
    RESOURCE_GLOBALNET  = 0x00000002,
    RESOURCE_REMEMBERED = 0x00000003,
}

alias NETINFOSTRUCT_CHARACTERISTICS = uint;
enum : uint
{
    NETINFO_DLL16      = 0x00000001,
    NETINFO_DISKRED    = 0x00000004,
    NETINFO_PRINTERRED = 0x00000008,
}

alias CONNECTDLGSTRUCT_FLAGS = uint;
enum : uint
{
    CONNDLG_RO_PATH     = 0x00000001,
    CONNDLG_CONN_POINT  = 0x00000002,
    CONNDLG_USE_MRU     = 0x00000004,
    CONNDLG_HIDE_BOX    = 0x00000008,
    CONNDLG_PERSIST     = 0x00000010,
    CONNDLG_NOT_PERSIST = 0x00000020,
}

alias DISCDLGSTRUCT_FLAGS = uint;
enum : uint
{
    DISC_UPDATE_PROFILE = 0x00000001,
    DISC_NO_FORCE       = 0x00000040,
}

uint WNetAddConnectionA(const(char)*, const(char)*, const(char)*);
uint WNetAddConnectionW(const(wchar)*, const(wchar)*, const(wchar)*);
uint WNetAddConnection2A(NETRESOURCEA*, const(char)*, const(char)*, uint);
uint WNetAddConnection2W(NETRESOURCEW*, const(wchar)*, const(wchar)*, uint);
uint WNetAddConnection3A(HWND, NETRESOURCEA*, const(char)*, const(char)*, uint);
uint WNetAddConnection3W(HWND, NETRESOURCEW*, const(wchar)*, const(wchar)*, uint);
uint WNetAddConnection4A(HWND, NETRESOURCEA*, void*, uint, uint, ubyte*, uint);
uint WNetAddConnection4W(HWND, NETRESOURCEW*, void*, uint, uint, ubyte*, uint);
uint WNetCancelConnectionA(const(char)*, BOOL);
uint WNetCancelConnectionW(const(wchar)*, BOOL);
uint WNetCancelConnection2A(const(char)*, uint, BOOL);
uint WNetCancelConnection2W(const(wchar)*, uint, BOOL);
uint WNetGetConnectionA(const(char)*, PSTR, uint*);
uint WNetGetConnectionW(const(wchar)*, PWSTR, uint*);
uint WNetUseConnectionA(HWND, NETRESOURCEA*, const(char)*, const(char)*, NET_USE_CONNECT_FLAGS, PSTR, uint*, uint*);
uint WNetUseConnectionW(HWND, NETRESOURCEW*, const(wchar)*, const(wchar)*, NET_USE_CONNECT_FLAGS, PWSTR, uint*, uint*);
uint WNetUseConnection4A(HWND, NETRESOURCEA*, void*, uint, uint, ubyte*, uint, PSTR, uint*, uint*);
uint WNetUseConnection4W(HWND, NETRESOURCEW*, void*, uint, uint, ubyte*, uint, PWSTR, uint*, uint*);
uint WNetConnectionDialog(HWND, uint);
uint WNetDisconnectDialog(HWND, uint);
uint WNetConnectionDialog1A(CONNECTDLGSTRUCTA*);
uint WNetConnectionDialog1W(CONNECTDLGSTRUCTW*);
uint WNetDisconnectDialog1A(DISCDLGSTRUCTA*);
uint WNetDisconnectDialog1W(DISCDLGSTRUCTW*);
uint WNetOpenEnumA(NET_RESOURCE_SCOPE, NET_RESOURCE_TYPE, WNET_OPEN_ENUM_USAGE, NETRESOURCEA*, NetEnumHandle*);
uint WNetOpenEnumW(NET_RESOURCE_SCOPE, NET_RESOURCE_TYPE, WNET_OPEN_ENUM_USAGE, NETRESOURCEW*, NetEnumHandle*);
uint WNetEnumResourceA(HANDLE, uint*, void*, uint*);
uint WNetEnumResourceW(HANDLE, uint*, void*, uint*);
uint WNetCloseEnum(HANDLE);
uint WNetGetResourceParentA(NETRESOURCEA*, void*, uint*);
uint WNetGetResourceParentW(NETRESOURCEW*, void*, uint*);
uint WNetGetResourceInformationA(NETRESOURCEA*, void*, uint*, PSTR*);
uint WNetGetResourceInformationW(NETRESOURCEW*, void*, uint*, PWSTR*);
uint WNetGetUniversalNameA(const(char)*, UNC_INFO_LEVEL, void*, uint*);
uint WNetGetUniversalNameW(const(wchar)*, UNC_INFO_LEVEL, void*, uint*);
uint WNetGetUserA(const(char)*, PSTR, uint*);
uint WNetGetUserW(const(wchar)*, PWSTR, uint*);
uint WNetGetProviderNameA(uint, PSTR, uint*);
uint WNetGetProviderNameW(uint, PWSTR, uint*);
uint WNetGetNetworkInformationA(const(char)*, NETINFOSTRUCT*);
uint WNetGetNetworkInformationW(const(wchar)*, NETINFOSTRUCT*);
uint WNetGetLastErrorA(uint*, PSTR, uint, PSTR, uint);
uint WNetGetLastErrorW(uint*, PWSTR, uint, PWSTR, uint);
uint MultinetGetConnectionPerformanceA(NETRESOURCEA*, NETCONNECTINFOSTRUCT*);
uint MultinetGetConnectionPerformanceW(NETRESOURCEW*, NETCONNECTINFOSTRUCT*);
uint NPAddConnection(NETRESOURCEW*, PWSTR, PWSTR);
uint NPAddConnection3(HWND, NETRESOURCEW*, PWSTR, PWSTR, NET_USE_CONNECT_FLAGS);
uint NPAddConnection4(HWND, NETRESOURCEW*, void*, uint, uint, ubyte*, uint);
uint NPCancelConnection(PWSTR, BOOL);
uint NPCancelConnection2(PWSTR, BOOL, uint);
uint NPGetConnection(PWSTR, PWSTR, uint*);
uint NPGetConnection3(const(wchar)*, uint, void*, uint*);
uint NPGetUniversalName(const(wchar)*, UNC_INFO_LEVEL, void*, uint*);
uint NPGetConnectionPerformance(const(wchar)*, NETCONNECTINFOSTRUCT*);
uint NPOpenEnum(uint, uint, uint, NETRESOURCEW*, HANDLE*);
uint NPEnumResource(HANDLE, uint*, void*, uint*);
uint NPCloseEnum(HANDLE);
uint NPGetCaps(uint);
uint NPGetUser(PWSTR, PWSTR, uint*);
uint NPGetPersistentUseOptionsForConnection(PWSTR, ubyte*, uint, ubyte*, uint*);
uint NPGetResourceParent(NETRESOURCEW*, void*, uint*);
uint NPGetResourceInformation(NETRESOURCEW*, void*, uint*, PWSTR*);
uint NPFormatNetworkName(PWSTR, PWSTR, uint*, NETWORK_NAME_FORMAT_FLAGS, uint);
void WNetSetLastErrorA(uint, PSTR, PSTR);
void WNetSetLastErrorW(uint, PWSTR, PWSTR);
enum WNGETCON_CONNECTED = 0x00000000;
enum WNGETCON_DISCONNECTED = 0x00000001;
enum WNNC_SPEC_VERSION = 0x00000001;
enum WNNC_SPEC_VERSION51 = 0x00050001;
enum WNNC_NET_TYPE = 0x00000002;
enum WNNC_NET_NONE = 0x00000000;
enum WNNC_DRIVER_VERSION = 0x00000003;
enum WNNC_USER = 0x00000004;
enum WNNC_USR_GETUSER = 0x00000001;
enum WNNC_CONNECTION = 0x00000006;
enum WNNC_CON_ADDCONNECTION = 0x00000001;
enum WNNC_CON_CANCELCONNECTION = 0x00000002;
enum WNNC_CON_GETCONNECTIONS = 0x00000004;
enum WNNC_CON_ADDCONNECTION3 = 0x00000008;
enum WNNC_CON_ADDCONNECTION4 = 0x00000010;
enum WNNC_CON_CANCELCONNECTION2 = 0x00000020;
enum WNNC_CON_GETPERFORMANCE = 0x00000040;
enum WNNC_CON_DEFER = 0x00000080;
enum WNNC_DIALOG = 0x00000008;
enum WNNC_DLG_DEVICEMODE = 0x00000001;
enum WNNC_DLG_PROPERTYDIALOG = 0x00000020;
enum WNNC_DLG_SEARCHDIALOG = 0x00000040;
enum WNNC_DLG_FORMATNETWORKNAME = 0x00000080;
enum WNNC_DLG_PERMISSIONEDITOR = 0x00000100;
enum WNNC_DLG_GETRESOURCEPARENT = 0x00000200;
enum WNNC_DLG_GETRESOURCEINFORMATION = 0x00000800;
enum WNNC_ADMIN = 0x00000009;
enum WNNC_ADM_GETDIRECTORYTYPE = 0x00000001;
enum WNNC_ADM_DIRECTORYNOTIFY = 0x00000002;
enum WNNC_ENUMERATION = 0x0000000b;
enum WNNC_ENUM_GLOBAL = 0x00000001;
enum WNNC_ENUM_LOCAL = 0x00000002;
enum WNNC_ENUM_CONTEXT = 0x00000004;
enum WNNC_ENUM_SHAREABLE = 0x00000008;
enum WNNC_START = 0x0000000c;
enum WNNC_WAIT_FOR_START = 0x00000001;
enum WNNC_CONNECTION_FLAGS = 0x0000000d;
enum WNTYPE_DRIVE = 0x00000001;
enum WNTYPE_FILE = 0x00000002;
enum WNTYPE_PRINTER = 0x00000003;
enum WNTYPE_COMM = 0x00000004;
enum WNSRCH_REFRESH_FIRST_LEVEL = 0x00000001;
enum WNDT_NORMAL = 0x00000000;
enum WNDT_NETWORK = 0x00000001;
enum WN_NETWORK_CLASS = 0x00000001;
enum WN_CREDENTIAL_CLASS = 0x00000002;
enum WN_PRIMARY_AUTHENT_CLASS = 0x00000004;
enum WN_SERVICE_CLASS = 0x00000008;
enum WN_VALID_LOGON_ACCOUNT = 0x00000001;
enum WN_NT_PASSWORD_CHANGED = 0x00000002;
enum NOTIFY_PRE = 0x00000001;
enum NOTIFY_POST = 0x00000002;
enum WNPERMC_PERM = 0x00000001;
enum WNPERMC_AUDIT = 0x00000002;
enum WNPERMC_OWNER = 0x00000004;
enum RESOURCE_RECENT = 0x00000004;
enum RESOURCETYPE_RESERVED = 0x00000008;
enum RESOURCETYPE_UNKNOWN = 0xffffffff;
enum RESOURCEUSAGE_NOLOCALDEVICE = 0x00000004;
enum RESOURCEUSAGE_SIBLING = 0x00000008;
enum RESOURCEUSAGE_RESERVED = 0x80000000;
enum RESOURCEDISPLAYTYPE_NETWORK = 0x00000006;
enum RESOURCEDISPLAYTYPE_ROOT = 0x00000007;
enum RESOURCEDISPLAYTYPE_SHAREADMIN = 0x00000008;
enum RESOURCEDISPLAYTYPE_DIRECTORY = 0x00000009;
enum RESOURCEDISPLAYTYPE_NDSCONTAINER = 0x0000000b;
enum NETPROPERTY_PERSISTENT = 0x00000001;
enum CONNECT_NEED_DRIVE = 0x00000020;
enum CONNECT_REFCOUNT = 0x00000040;
enum CONNECT_LOCALDRIVE = 0x00000100;
enum CONNECT_CURRENT_MEDIA = 0x00000200;
enum CONNECT_RESERVED = 0xff000000;
enum CONNECT_CRED_RESET = 0x00002000;
enum CONNECT_REQUIRE_INTEGRITY = 0x00004000;
enum CONNECT_REQUIRE_PRIVACY = 0x00008000;
enum CONNECT_WRITE_THROUGH_SEMANTICS = 0x00010000;
enum CONNECT_GLOBAL_MAPPING = 0x00040000;
enum WNFMT_INENUM = 0x00000010;
enum WNFMT_CONNECTION = 0x00000020;
enum WNCON_FORNETCARD = 0x00000001;
enum WNCON_NOTROUTED = 0x00000002;
enum WNCON_SLOWLINK = 0x00000004;
enum WNCON_DYNAMIC = 0x00000008;
alias NetEnumHandle = long;
struct NETRESOURCEA
{
    NET_RESOURCE_SCOPE dwScope;
    NET_RESOURCE_TYPE dwType;
    uint dwDisplayType;
    uint dwUsage;
    PSTR lpLocalName;
    PSTR lpRemoteName;
    PSTR lpComment;
    PSTR lpProvider;
}
struct NETRESOURCEW
{
    NET_RESOURCE_SCOPE dwScope;
    NET_RESOURCE_TYPE dwType;
    uint dwDisplayType;
    uint dwUsage;
    PWSTR lpLocalName;
    PWSTR lpRemoteName;
    PWSTR lpComment;
    PWSTR lpProvider;
}
struct CONNECTDLGSTRUCTA
{
    uint cbStructure;
    HWND hwndOwner;
    NETRESOURCEA* lpConnRes;
    CONNECTDLGSTRUCT_FLAGS dwFlags;
    uint dwDevNum;
}
struct CONNECTDLGSTRUCTW
{
    uint cbStructure;
    HWND hwndOwner;
    NETRESOURCEW* lpConnRes;
    CONNECTDLGSTRUCT_FLAGS dwFlags;
    uint dwDevNum;
}
struct DISCDLGSTRUCTA
{
    uint cbStructure;
    HWND hwndOwner;
    PSTR lpLocalName;
    PSTR lpRemoteName;
    DISCDLGSTRUCT_FLAGS dwFlags;
}
struct DISCDLGSTRUCTW
{
    uint cbStructure;
    HWND hwndOwner;
    PWSTR lpLocalName;
    PWSTR lpRemoteName;
    DISCDLGSTRUCT_FLAGS dwFlags;
}
struct UNIVERSAL_NAME_INFOA
{
    PSTR lpUniversalName;
}
struct UNIVERSAL_NAME_INFOW
{
    PWSTR lpUniversalName;
}
struct REMOTE_NAME_INFOA
{
    PSTR lpUniversalName;
    PSTR lpConnectionName;
    PSTR lpRemainingPath;
}
struct REMOTE_NAME_INFOW
{
    PWSTR lpUniversalName;
    PWSTR lpConnectionName;
    PWSTR lpRemainingPath;
}
struct NETINFOSTRUCT
{
    uint cbStructure;
    uint dwProviderVersion;
    WIN32_ERROR dwStatus;
    NETINFOSTRUCT_CHARACTERISTICS dwCharacteristics;
    ulong dwHandle;
    ushort wNetType;
    uint dwPrinters;
    uint dwDrives;
}
struct NETCONNECTINFOSTRUCT
{
    uint cbStructure;
    uint dwFlags;
    uint dwSpeed;
    uint dwDelay;
    uint dwOptDataSize;
}
alias PF_NPAddConnection = uint function(NETRESOURCEW*, PWSTR, PWSTR);
alias PF_NPAddConnection3 = uint function(HWND, NETRESOURCEW*, PWSTR, PWSTR, uint);
alias PF_NPAddConnection4 = uint function(HWND, NETRESOURCEW*, void*, uint, uint, ubyte*, uint);
alias PF_NPCancelConnection = uint function(PWSTR, BOOL);
alias PF_NPCancelConnection2 = uint function(PWSTR, BOOL, uint);
alias PF_NPGetConnection = uint function(PWSTR, PWSTR, uint*);
alias PF_NPGetConnection3 = uint function(const(wchar)*, uint, void*, uint*);
alias PF_NPGetUniversalName = uint function(const(wchar)*, uint, void*, uint*);
alias PF_NPGetConnectionPerformance = uint function(const(wchar)*, NETCONNECTINFOSTRUCT*);
alias PF_NPOpenEnum = uint function(uint, uint, uint, NETRESOURCEW*, HANDLE*);
alias PF_NPEnumResource = uint function(HANDLE, uint*, void*, uint*);
alias PF_NPCloseEnum = uint function(HANDLE);
alias PF_NPGetCaps = uint function(uint);
alias PF_NPGetUser = uint function(PWSTR, PWSTR, uint*);
alias PF_NPGetPersistentUseOptionsForConnection = uint function(PWSTR, ubyte*, uint, ubyte*, uint*);
alias PF_NPDeviceMode = uint function(HWND);
alias PF_NPSearchDialog = uint function(HWND, NETRESOURCEW*, void*, uint, uint*);
alias PF_NPGetResourceParent = uint function(NETRESOURCEW*, void*, uint*);
alias PF_NPGetResourceInformation = uint function(NETRESOURCEW*, void*, uint*, PWSTR*);
alias PF_NPFormatNetworkName = uint function(PWSTR, PWSTR, uint*, uint, uint);
alias PF_NPGetPropertyText = uint function(uint, uint, PWSTR, PWSTR, uint, uint);
alias PF_NPPropertyDialog = uint function(HWND, uint, uint, PWSTR, uint);
alias PF_NPGetDirectoryType = uint function(PWSTR, int*, BOOL);
alias PF_NPDirectoryNotify = uint function(HWND, PWSTR, uint);
alias PF_NPLogonNotify = uint function(LUID*, const(wchar)*, void*, const(wchar)*, void*, PWSTR, void*, PWSTR*);
alias PF_NPPasswordChangeNotify = uint function(const(wchar)*, void*, const(wchar)*, void*, PWSTR, void*, uint);
struct NOTIFYINFO
{
    uint dwNotifyStatus;
    uint dwOperationStatus;
    void* lpContext;
}
struct NOTIFYADD
{
    HWND hwndOwner;
    NETRESOURCEA NetResource;
    NET_USE_CONNECT_FLAGS dwAddFlags;
}
struct NOTIFYCANCEL
{
    PWSTR lpName;
    PWSTR lpProvider;
    uint dwFlags;
    BOOL fForce;
}
alias PF_AddConnectNotify = uint function(NOTIFYINFO*, NOTIFYADD*);
alias PF_CancelConnectNotify = uint function(NOTIFYINFO*, NOTIFYCANCEL*);
alias PF_NPFMXGetPermCaps = uint function(PWSTR);
alias PF_NPFMXEditPerm = uint function(PWSTR, HWND, uint);
alias PF_NPFMXGetPermHelp = uint function(PWSTR, uint, BOOL, void*, uint*, uint*);
