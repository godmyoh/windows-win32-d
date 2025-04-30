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

alias NET_CONNECT_FLAGS = uint;
enum : uint
{
    CONNECT_UPDATE_PROFILE          = 0x00000001,
    CONNECT_UPDATE_RECENT           = 0x00000002,
    CONNECT_TEMPORARY               = 0x00000004,
    CONNECT_INTERACTIVE             = 0x00000008,
    CONNECT_PROMPT                  = 0x00000010,
    CONNECT_NEED_DRIVE              = 0x00000020,
    CONNECT_REFCOUNT                = 0x00000040,
    CONNECT_REDIRECT                = 0x00000080,
    CONNECT_LOCALDRIVE              = 0x00000100,
    CONNECT_CURRENT_MEDIA           = 0x00000200,
    CONNECT_DEFERRED                = 0x00000400,
    CONNECT_RESERVED                = 0xff000000,
    CONNECT_COMMANDLINE             = 0x00000800,
    CONNECT_CMD_SAVECRED            = 0x00001000,
    CONNECT_CRED_RESET              = 0x00002000,
    CONNECT_REQUIRE_INTEGRITY       = 0x00004000,
    CONNECT_REQUIRE_PRIVACY         = 0x00008000,
    CONNECT_WRITE_THROUGH_SEMANTICS = 0x00010000,
    CONNECT_GLOBAL_MAPPING          = 0x00040000,
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

WIN32_ERROR WNetAddConnectionA(const(char)* lpRemoteName, const(char)* lpPassword, const(char)* lpLocalName);
WIN32_ERROR WNetAddConnectionW(const(wchar)* lpRemoteName, const(wchar)* lpPassword, const(wchar)* lpLocalName);
WIN32_ERROR WNetAddConnection2A(NETRESOURCEA* lpNetResource, const(char)* lpPassword, const(char)* lpUserName, NET_CONNECT_FLAGS dwFlags);
WIN32_ERROR WNetAddConnection2W(NETRESOURCEW* lpNetResource, const(wchar)* lpPassword, const(wchar)* lpUserName, NET_CONNECT_FLAGS dwFlags);
WIN32_ERROR WNetAddConnection3A(HWND hwndOwner, NETRESOURCEA* lpNetResource, const(char)* lpPassword, const(char)* lpUserName, NET_CONNECT_FLAGS dwFlags);
WIN32_ERROR WNetAddConnection3W(HWND hwndOwner, NETRESOURCEW* lpNetResource, const(wchar)* lpPassword, const(wchar)* lpUserName, NET_CONNECT_FLAGS dwFlags);
WIN32_ERROR WNetAddConnection4A(HWND hwndOwner, NETRESOURCEA* lpNetResource, void* pAuthBuffer, uint cbAuthBuffer, NET_CONNECT_FLAGS dwFlags, ubyte* lpUseOptions, uint cbUseOptions);
WIN32_ERROR WNetAddConnection4W(HWND hwndOwner, NETRESOURCEW* lpNetResource, void* pAuthBuffer, uint cbAuthBuffer, NET_CONNECT_FLAGS dwFlags, ubyte* lpUseOptions, uint cbUseOptions);
WIN32_ERROR WNetCancelConnectionA(const(char)* lpName, BOOL fForce);
WIN32_ERROR WNetCancelConnectionW(const(wchar)* lpName, BOOL fForce);
WIN32_ERROR WNetCancelConnection2A(const(char)* lpName, NET_CONNECT_FLAGS dwFlags, BOOL fForce);
WIN32_ERROR WNetCancelConnection2W(const(wchar)* lpName, NET_CONNECT_FLAGS dwFlags, BOOL fForce);
WIN32_ERROR WNetGetConnectionA(const(char)* lpLocalName, PSTR lpRemoteName, uint* lpnLength);
WIN32_ERROR WNetGetConnectionW(const(wchar)* lpLocalName, PWSTR lpRemoteName, uint* lpnLength);
WIN32_ERROR WNetUseConnectionA(HWND hwndOwner, NETRESOURCEA* lpNetResource, const(char)* lpPassword, const(char)* lpUserId, NET_CONNECT_FLAGS dwFlags, PSTR lpAccessName, uint* lpBufferSize, uint* lpResult);
WIN32_ERROR WNetUseConnectionW(HWND hwndOwner, NETRESOURCEW* lpNetResource, const(wchar)* lpPassword, const(wchar)* lpUserId, NET_CONNECT_FLAGS dwFlags, PWSTR lpAccessName, uint* lpBufferSize, uint* lpResult);
WIN32_ERROR WNetUseConnection4A(HWND hwndOwner, NETRESOURCEA* lpNetResource, void* pAuthBuffer, uint cbAuthBuffer, uint dwFlags, ubyte* lpUseOptions, uint cbUseOptions, PSTR lpAccessName, uint* lpBufferSize, uint* lpResult);
WIN32_ERROR WNetUseConnection4W(HWND hwndOwner, NETRESOURCEW* lpNetResource, void* pAuthBuffer, uint cbAuthBuffer, uint dwFlags, ubyte* lpUseOptions, uint cbUseOptions, PWSTR lpAccessName, uint* lpBufferSize, uint* lpResult);
WIN32_ERROR WNetConnectionDialog(HWND hwnd, uint dwType);
WIN32_ERROR WNetDisconnectDialog(HWND hwnd, uint dwType);
WIN32_ERROR WNetConnectionDialog1A(CONNECTDLGSTRUCTA* lpConnDlgStruct);
WIN32_ERROR WNetConnectionDialog1W(CONNECTDLGSTRUCTW* lpConnDlgStruct);
WIN32_ERROR WNetDisconnectDialog1A(DISCDLGSTRUCTA* lpConnDlgStruct);
WIN32_ERROR WNetDisconnectDialog1W(DISCDLGSTRUCTW* lpConnDlgStruct);
WIN32_ERROR WNetOpenEnumA(NET_RESOURCE_SCOPE dwScope, NET_RESOURCE_TYPE dwType, WNET_OPEN_ENUM_USAGE dwUsage, NETRESOURCEA* lpNetResource, HANDLE* lphEnum);
WIN32_ERROR WNetOpenEnumW(NET_RESOURCE_SCOPE dwScope, NET_RESOURCE_TYPE dwType, WNET_OPEN_ENUM_USAGE dwUsage, NETRESOURCEW* lpNetResource, HANDLE* lphEnum);
WIN32_ERROR WNetEnumResourceA(HANDLE hEnum, uint* lpcCount, void* lpBuffer, uint* lpBufferSize);
WIN32_ERROR WNetEnumResourceW(HANDLE hEnum, uint* lpcCount, void* lpBuffer, uint* lpBufferSize);
WIN32_ERROR WNetCloseEnum(HANDLE hEnum);
WIN32_ERROR WNetGetResourceParentA(NETRESOURCEA* lpNetResource, void* lpBuffer, uint* lpcbBuffer);
WIN32_ERROR WNetGetResourceParentW(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpcbBuffer);
WIN32_ERROR WNetGetResourceInformationA(NETRESOURCEA* lpNetResource, void* lpBuffer, uint* lpcbBuffer, PSTR* lplpSystem);
WIN32_ERROR WNetGetResourceInformationW(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpcbBuffer, PWSTR* lplpSystem);
WIN32_ERROR WNetGetUniversalNameA(const(char)* lpLocalPath, UNC_INFO_LEVEL dwInfoLevel, void* lpBuffer, uint* lpBufferSize);
WIN32_ERROR WNetGetUniversalNameW(const(wchar)* lpLocalPath, UNC_INFO_LEVEL dwInfoLevel, void* lpBuffer, uint* lpBufferSize);
WIN32_ERROR WNetGetUserA(const(char)* lpName, PSTR lpUserName, uint* lpnLength);
WIN32_ERROR WNetGetUserW(const(wchar)* lpName, PWSTR lpUserName, uint* lpnLength);
WIN32_ERROR WNetGetProviderNameA(uint dwNetType, PSTR lpProviderName, uint* lpBufferSize);
WIN32_ERROR WNetGetProviderNameW(uint dwNetType, PWSTR lpProviderName, uint* lpBufferSize);
WIN32_ERROR WNetGetNetworkInformationA(const(char)* lpProvider, NETINFOSTRUCT* lpNetInfoStruct);
WIN32_ERROR WNetGetNetworkInformationW(const(wchar)* lpProvider, NETINFOSTRUCT* lpNetInfoStruct);
WIN32_ERROR WNetGetLastErrorA(uint* lpError, PSTR lpErrorBuf, uint nErrorBufSize, PSTR lpNameBuf, uint nNameBufSize);
WIN32_ERROR WNetGetLastErrorW(uint* lpError, PWSTR lpErrorBuf, uint nErrorBufSize, PWSTR lpNameBuf, uint nNameBufSize);
uint MultinetGetConnectionPerformanceA(NETRESOURCEA* lpNetResource, NETCONNECTINFOSTRUCT* lpNetConnectInfoStruct);
uint MultinetGetConnectionPerformanceW(NETRESOURCEW* lpNetResource, NETCONNECTINFOSTRUCT* lpNetConnectInfoStruct);
uint NPAddConnection(NETRESOURCEW* lpNetResource, PWSTR lpPassword, PWSTR lpUserName);
uint NPAddConnection3(HWND hwndOwner, NETRESOURCEW* lpNetResource, PWSTR lpPassword, PWSTR lpUserName, NET_CONNECT_FLAGS dwFlags);
uint NPAddConnection4(HWND hwndOwner, NETRESOURCEW* lpNetResource, void* lpAuthBuffer, uint cbAuthBuffer, uint dwFlags, ubyte* lpUseOptions, uint cbUseOptions);
uint NPCancelConnection(PWSTR lpName, BOOL fForce);
uint NPCancelConnection2(PWSTR lpName, BOOL fForce, uint dwFlags);
uint NPGetConnection(PWSTR lpLocalName, PWSTR lpRemoteName, uint* lpnBufferLen);
uint NPGetConnection3(const(wchar)* lpLocalName, uint dwLevel, void* lpBuffer, uint* lpBufferSize);
uint NPGetUniversalName(const(wchar)* lpLocalPath, UNC_INFO_LEVEL dwInfoLevel, void* lpBuffer, uint* lpBufferSize);
uint NPGetConnectionPerformance(const(wchar)* lpRemoteName, NETCONNECTINFOSTRUCT* lpNetConnectInfo);
uint NPOpenEnum(uint dwScope, uint dwType, uint dwUsage, NETRESOURCEW* lpNetResource, HANDLE* lphEnum);
uint NPEnumResource(HANDLE hEnum, uint* lpcCount, void* lpBuffer, uint* lpBufferSize);
uint NPCloseEnum(HANDLE hEnum);
uint NPGetCaps(uint ndex);
uint NPGetUser(PWSTR lpName, PWSTR lpUserName, uint* lpnBufferLen);
uint NPGetPersistentUseOptionsForConnection(PWSTR lpRemotePath, ubyte* lpReadUseOptions, uint cbReadUseOptions, ubyte* lpWriteUseOptions, uint* lpSizeWriteUseOptions);
uint NPGetResourceParent(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpBufferSize);
uint NPGetResourceInformation(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpBufferSize, PWSTR* lplpSystem);
uint NPFormatNetworkName(PWSTR lpRemoteName, PWSTR lpFormattedName, uint* lpnLength, NETWORK_NAME_FORMAT_FLAGS dwFlags, uint dwAveCharPerLine);
void WNetSetLastErrorA(uint err, PSTR lpError, PSTR lpProviders);
void WNetSetLastErrorW(uint err, PWSTR lpError, PWSTR lpProviders);
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
enum WNFMT_INENUM = 0x00000010;
enum WNFMT_CONNECTION = 0x00000020;
enum WNCON_FORNETCARD = 0x00000001;
enum WNCON_NOTROUTED = 0x00000002;
enum WNCON_SLOWLINK = 0x00000004;
enum WNCON_DYNAMIC = 0x00000008;
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
alias PF_NPAddConnection = uint function(NETRESOURCEW* lpNetResource, PWSTR lpPassword, PWSTR lpUserName);
alias PF_NPAddConnection3 = uint function(HWND hwndOwner, NETRESOURCEW* lpNetResource, PWSTR lpPassword, PWSTR lpUserName, uint dwFlags);
alias PF_NPAddConnection4 = uint function(HWND hwndOwner, NETRESOURCEW* lpNetResource, void* lpAuthBuffer, uint cbAuthBuffer, uint dwFlags, ubyte* lpUseOptions, uint cbUseOptions);
alias PF_NPCancelConnection = uint function(PWSTR lpName, BOOL fForce);
alias PF_NPCancelConnection2 = uint function(PWSTR lpName, BOOL fForce, uint dwFlags);
alias PF_NPGetConnection = uint function(PWSTR lpLocalName, PWSTR lpRemoteName, uint* lpnBufferLen);
alias PF_NPGetConnection3 = uint function(const(wchar)* lpLocalName, uint dwLevel, void* lpBuffer, uint* lpBufferSize);
alias PF_NPGetUniversalName = uint function(const(wchar)* lpLocalPath, uint dwInfoLevel, void* lpBuffer, uint* lpnBufferSize);
alias PF_NPGetConnectionPerformance = uint function(const(wchar)* lpRemoteName, NETCONNECTINFOSTRUCT* lpNetConnectInfo);
alias PF_NPOpenEnum = uint function(uint dwScope, uint dwType, uint dwUsage, NETRESOURCEW* lpNetResource, HANDLE* lphEnum);
alias PF_NPEnumResource = uint function(HANDLE hEnum, uint* lpcCount, void* lpBuffer, uint* lpBufferSize);
alias PF_NPCloseEnum = uint function(HANDLE hEnum);
alias PF_NPGetCaps = uint function(uint ndex);
alias PF_NPGetUser = uint function(PWSTR lpName, PWSTR lpUserName, uint* lpnBufferLen);
alias PF_NPGetPersistentUseOptionsForConnection = uint function(PWSTR lpRemotePath, ubyte* lpReadUseOptions, uint cbReadUseOptions, ubyte* lpWriteUseOptions, uint* lpSizeWriteUseOptions);
alias PF_NPDeviceMode = uint function(HWND hParent);
alias PF_NPSearchDialog = uint function(HWND hwndParent, NETRESOURCEW* lpNetResource, void* lpBuffer, uint cbBuffer, uint* lpnFlags);
alias PF_NPGetResourceParent = uint function(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpBufferSize);
alias PF_NPGetResourceInformation = uint function(NETRESOURCEW* lpNetResource, void* lpBuffer, uint* lpBufferSize, PWSTR* lplpSystem);
alias PF_NPFormatNetworkName = uint function(PWSTR lpRemoteName, PWSTR lpFormattedName, uint* lpnLength, uint dwFlags, uint dwAveCharPerLine);
alias PF_NPGetPropertyText = uint function(uint iButton, uint nPropSel, PWSTR lpName, PWSTR lpButtonName, uint nButtonNameLen, uint nType);
alias PF_NPPropertyDialog = uint function(HWND hwndParent, uint iButtonDlg, uint nPropSel, PWSTR lpFileName, uint nType);
alias PF_NPGetDirectoryType = uint function(PWSTR lpName, int* lpType, BOOL bFlushCache);
alias PF_NPDirectoryNotify = uint function(HWND hwnd, PWSTR lpDir, uint dwOper);
alias PF_NPLogonNotify = uint function(LUID* lpLogonId, const(wchar)* lpAuthentInfoType, void* lpAuthentInfo, const(wchar)* lpPreviousAuthentInfoType, void* lpPreviousAuthentInfo, PWSTR lpStationName, void* StationHandle, PWSTR* lpLogonScript);
alias PF_NPPasswordChangeNotify = uint function(const(wchar)* lpAuthentInfoType, void* lpAuthentInfo, const(wchar)* lpPreviousAuthentInfoType, void* lpPreviousAuthentInfo, PWSTR lpStationName, void* StationHandle, uint dwChangeInfo);
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
    NET_CONNECT_FLAGS dwAddFlags;
}
struct NOTIFYCANCEL
{
    PWSTR lpName;
    PWSTR lpProvider;
    uint dwFlags;
    BOOL fForce;
}
alias PF_AddConnectNotify = uint function(NOTIFYINFO* lpNotifyInfo, NOTIFYADD* lpAddInfo);
alias PF_CancelConnectNotify = uint function(NOTIFYINFO* lpNotifyInfo, NOTIFYCANCEL* lpCancelInfo);
alias PF_NPFMXGetPermCaps = uint function(PWSTR lpDriveName);
alias PF_NPFMXEditPerm = uint function(PWSTR lpDriveName, HWND hwndFMX, uint nDialogType);
alias PF_NPFMXGetPermHelp = uint function(PWSTR lpDriveName, uint nDialogType, BOOL fDirectory, void* lpFileNameBuffer, uint* lpBufferSize, uint* lpnHelpContext);
