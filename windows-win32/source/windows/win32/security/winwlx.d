module windows.win32.security.winwlx;

import windows.win32.foundation : BOOL, HANDLE, HWND, LPARAM, LUID, PWSTR;
import windows.win32.security_ : QUOTA_LIMITS;
import windows.win32.system.stationsanddesktops : HDESK;
import windows.win32.ui.windowsandmessaging : DLGPROC, DLGTEMPLATE;

version (Windows):
extern (Windows):

alias WLX_SHUTDOWN_TYPE = uint;
enum : uint
{
    WLX_SAS_ACTION_SHUTDOWN           = 0x00000005,
    WLX_SAS_ACTION_SHUTDOWN_REBOOT    = 0x0000000b,
    WLX_SAS_ACTION_SHUTDOWN_POWER_OFF = 0x0000000a,
}

enum WLX_VERSION_1_0 = 0x00010000;
enum WLX_VERSION_1_1 = 0x00010001;
enum WLX_VERSION_1_2 = 0x00010002;
enum WLX_VERSION_1_3 = 0x00010003;
enum WLX_VERSION_1_4 = 0x00010004;
enum WLX_CURRENT_VERSION = 0x00010004;
enum WLX_SAS_TYPE_TIMEOUT = 0x00000000;
enum WLX_SAS_TYPE_CTRL_ALT_DEL = 0x00000001;
enum WLX_SAS_TYPE_SCRNSVR_TIMEOUT = 0x00000002;
enum WLX_SAS_TYPE_SCRNSVR_ACTIVITY = 0x00000003;
enum WLX_SAS_TYPE_USER_LOGOFF = 0x00000004;
enum WLX_SAS_TYPE_SC_INSERT = 0x00000005;
enum WLX_SAS_TYPE_SC_REMOVE = 0x00000006;
enum WLX_SAS_TYPE_AUTHENTICATED = 0x00000007;
enum WLX_SAS_TYPE_SC_FIRST_READER_ARRIVED = 0x00000008;
enum WLX_SAS_TYPE_SC_LAST_READER_REMOVED = 0x00000009;
enum WLX_SAS_TYPE_SWITCHUSER = 0x0000000a;
enum WLX_SAS_TYPE_MAX_MSFT_VALUE = 0x0000007f;
enum WLX_LOGON_OPT_NO_PROFILE = 0x00000001;
enum WLX_PROFILE_TYPE_V1_0 = 0x00000001;
enum WLX_PROFILE_TYPE_V2_0 = 0x00000002;
enum WLX_SAS_ACTION_LOGON = 0x00000001;
enum WLX_SAS_ACTION_NONE = 0x00000002;
enum WLX_SAS_ACTION_LOCK_WKSTA = 0x00000003;
enum WLX_SAS_ACTION_LOGOFF = 0x00000004;
enum WLX_SAS_ACTION_PWD_CHANGED = 0x00000006;
enum WLX_SAS_ACTION_TASKLIST = 0x00000007;
enum WLX_SAS_ACTION_UNLOCK_WKSTA = 0x00000008;
enum WLX_SAS_ACTION_FORCE_LOGOFF = 0x00000009;
enum WLX_SAS_ACTION_SHUTDOWN_SLEEP = 0x0000000c;
enum WLX_SAS_ACTION_SHUTDOWN_SLEEP2 = 0x0000000d;
enum WLX_SAS_ACTION_SHUTDOWN_HIBERNATE = 0x0000000e;
enum WLX_SAS_ACTION_RECONNECTED = 0x0000000f;
enum WLX_SAS_ACTION_DELAYED_FORCE_LOGOFF = 0x00000010;
enum WLX_SAS_ACTION_SWITCH_CONSOLE = 0x00000011;
enum WLX_WM_SAS = 0x00000659;
enum WLX_DLG_SAS = 0x00000065;
enum WLX_DLG_INPUT_TIMEOUT = 0x00000066;
enum WLX_DLG_SCREEN_SAVER_TIMEOUT = 0x00000067;
enum WLX_DLG_USER_LOGOFF = 0x00000068;
enum WLX_DIRECTORY_LENGTH = 0x00000100;
enum WLX_CREDENTIAL_TYPE_V1_0 = 0x00000001;
enum WLX_CREDENTIAL_TYPE_V2_0 = 0x00000002;
enum WLX_CONSOLESWITCHCREDENTIAL_TYPE_V1_0 = 0x00000001;
enum STATUSMSG_OPTION_NOANIMATION = 0x00000001;
enum STATUSMSG_OPTION_SETFOREGROUND = 0x00000002;
enum WLX_DESKTOP_NAME = 0x00000001;
enum WLX_DESKTOP_HANDLE = 0x00000002;
enum WLX_CREATE_INSTANCE_ONLY = 0x00000001;
enum WLX_CREATE_USER = 0x00000002;
enum WLX_OPTION_USE_CTRL_ALT_DEL = 0x00000001;
enum WLX_OPTION_CONTEXT_POINTER = 0x00000002;
enum WLX_OPTION_USE_SMART_CARD = 0x00000003;
enum WLX_OPTION_FORCE_LOGOFF_TIME = 0x00000004;
enum WLX_OPTION_IGNORE_AUTO_LOGON = 0x00000008;
enum WLX_OPTION_NO_SWITCH_ON_SAS = 0x00000009;
enum WLX_OPTION_SMART_CARD_PRESENT = 0x00010001;
enum WLX_OPTION_SMART_CARD_INFO = 0x00010002;
enum WLX_OPTION_DISPATCH_TABLE_SIZE = 0x00010003;
struct WLX_SC_NOTIFICATION_INFO
{
    PWSTR pszCard;
    PWSTR pszReader;
    PWSTR pszContainer;
    PWSTR pszCryptoProvider;
}
struct WLX_PROFILE_V1_0
{
    uint dwType;
    PWSTR pszProfile;
}
struct WLX_PROFILE_V2_0
{
    uint dwType;
    PWSTR pszProfile;
    PWSTR pszPolicy;
    PWSTR pszNetworkDefaultUserProfile;
    PWSTR pszServerName;
    PWSTR pszEnvironment;
}
struct WLX_MPR_NOTIFY_INFO
{
    PWSTR pszUserName;
    PWSTR pszDomain;
    PWSTR pszPassword;
    PWSTR pszOldPassword;
}
struct WLX_TERMINAL_SERVICES_DATA
{
    wchar[257] ProfilePath;
    wchar[257] HomeDir;
    wchar[4] HomeDirDrive;
}
struct WLX_CLIENT_CREDENTIALS_INFO_V1_0
{
    uint dwType;
    PWSTR pszUserName;
    PWSTR pszDomain;
    PWSTR pszPassword;
    BOOL fPromptForPassword;
}
struct WLX_CLIENT_CREDENTIALS_INFO_V2_0
{
    uint dwType;
    PWSTR pszUserName;
    PWSTR pszDomain;
    PWSTR pszPassword;
    BOOL fPromptForPassword;
    BOOL fDisconnectOnLogonFailure;
}
struct WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0
{
    uint dwType;
    HANDLE UserToken;
    LUID LogonId;
    QUOTA_LIMITS Quotas;
    PWSTR UserName;
    PWSTR Domain;
    long LogonTime;
    BOOL SmartCardLogon;
    uint ProfileLength;
    uint MessageType;
    ushort LogonCount;
    ushort BadPasswordCount;
    long ProfileLogonTime;
    long LogoffTime;
    long KickOffTime;
    long PasswordLastSet;
    long PasswordCanChange;
    long PasswordMustChange;
    PWSTR LogonScript;
    PWSTR HomeDirectory;
    PWSTR FullName;
    PWSTR ProfilePath;
    PWSTR HomeDirectoryDrive;
    PWSTR LogonServer;
    uint UserFlags;
    uint PrivateDataLen;
    ubyte* PrivateData;
}
struct WLX_DESKTOP
{
    uint Size;
    uint Flags;
    HDESK hDesktop;
    PWSTR pszDesktopName;
}
alias PWLX_USE_CTRL_ALT_DEL = void function(HANDLE);
alias PWLX_SET_CONTEXT_POINTER = void function(HANDLE, void*);
alias PWLX_SAS_NOTIFY = void function(HANDLE, uint);
alias PWLX_SET_TIMEOUT = BOOL function(HANDLE, uint);
alias PWLX_ASSIGN_SHELL_PROTECTION = int function(HANDLE, HANDLE, HANDLE, HANDLE);
alias PWLX_MESSAGE_BOX = int function(HANDLE, HWND, PWSTR, PWSTR, uint);
alias PWLX_DIALOG_BOX = int function(HANDLE, HANDLE, PWSTR, HWND, DLGPROC);
alias PWLX_DIALOG_BOX_INDIRECT = int function(HANDLE, HANDLE, DLGTEMPLATE*, HWND, DLGPROC);
alias PWLX_DIALOG_BOX_PARAM = int function(HANDLE, HANDLE, PWSTR, HWND, DLGPROC, LPARAM);
alias PWLX_DIALOG_BOX_INDIRECT_PARAM = int function(HANDLE, HANDLE, DLGTEMPLATE*, HWND, DLGPROC, LPARAM);
alias PWLX_SWITCH_DESKTOP_TO_USER = int function(HANDLE);
alias PWLX_SWITCH_DESKTOP_TO_WINLOGON = int function(HANDLE);
alias PWLX_CHANGE_PASSWORD_NOTIFY = int function(HANDLE, WLX_MPR_NOTIFY_INFO*, uint);
alias PWLX_GET_SOURCE_DESKTOP = BOOL function(HANDLE, WLX_DESKTOP**);
alias PWLX_SET_RETURN_DESKTOP = BOOL function(HANDLE, WLX_DESKTOP*);
alias PWLX_CREATE_USER_DESKTOP = BOOL function(HANDLE, HANDLE, uint, PWSTR, WLX_DESKTOP**);
alias PWLX_CHANGE_PASSWORD_NOTIFY_EX = int function(HANDLE, WLX_MPR_NOTIFY_INFO*, uint, PWSTR, void*);
alias PWLX_CLOSE_USER_DESKTOP = BOOL function(HANDLE, WLX_DESKTOP*, HANDLE);
alias PWLX_SET_OPTION = BOOL function(HANDLE, uint, ulong, ulong*);
alias PWLX_GET_OPTION = BOOL function(HANDLE, uint, ulong*);
alias PWLX_WIN31_MIGRATE = void function(HANDLE);
alias PWLX_QUERY_CLIENT_CREDENTIALS = BOOL function(WLX_CLIENT_CREDENTIALS_INFO_V1_0*);
alias PWLX_QUERY_IC_CREDENTIALS = BOOL function(WLX_CLIENT_CREDENTIALS_INFO_V1_0*);
alias PWLX_QUERY_TS_LOGON_CREDENTIALS = BOOL function(WLX_CLIENT_CREDENTIALS_INFO_V2_0*);
alias PWLX_DISCONNECT = BOOL function();
alias PWLX_QUERY_TERMINAL_SERVICES_DATA = uint function(HANDLE, WLX_TERMINAL_SERVICES_DATA*, PWSTR, PWSTR);
alias PWLX_QUERY_CONSOLESWITCH_CREDENTIALS = uint function(WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0*);
struct WLX_DISPATCH_VERSION_1_0
{
    PWLX_USE_CTRL_ALT_DEL WlxUseCtrlAltDel;
    PWLX_SET_CONTEXT_POINTER WlxSetContextPointer;
    PWLX_SAS_NOTIFY WlxSasNotify;
    PWLX_SET_TIMEOUT WlxSetTimeout;
    PWLX_ASSIGN_SHELL_PROTECTION WlxAssignShellProtection;
    PWLX_MESSAGE_BOX WlxMessageBox;
    PWLX_DIALOG_BOX WlxDialogBox;
    PWLX_DIALOG_BOX_PARAM WlxDialogBoxParam;
    PWLX_DIALOG_BOX_INDIRECT WlxDialogBoxIndirect;
    PWLX_DIALOG_BOX_INDIRECT_PARAM WlxDialogBoxIndirectParam;
    PWLX_SWITCH_DESKTOP_TO_USER WlxSwitchDesktopToUser;
    PWLX_SWITCH_DESKTOP_TO_WINLOGON WlxSwitchDesktopToWinlogon;
    PWLX_CHANGE_PASSWORD_NOTIFY WlxChangePasswordNotify;
}
struct WLX_DISPATCH_VERSION_1_1
{
    PWLX_USE_CTRL_ALT_DEL WlxUseCtrlAltDel;
    PWLX_SET_CONTEXT_POINTER WlxSetContextPointer;
    PWLX_SAS_NOTIFY WlxSasNotify;
    PWLX_SET_TIMEOUT WlxSetTimeout;
    PWLX_ASSIGN_SHELL_PROTECTION WlxAssignShellProtection;
    PWLX_MESSAGE_BOX WlxMessageBox;
    PWLX_DIALOG_BOX WlxDialogBox;
    PWLX_DIALOG_BOX_PARAM WlxDialogBoxParam;
    PWLX_DIALOG_BOX_INDIRECT WlxDialogBoxIndirect;
    PWLX_DIALOG_BOX_INDIRECT_PARAM WlxDialogBoxIndirectParam;
    PWLX_SWITCH_DESKTOP_TO_USER WlxSwitchDesktopToUser;
    PWLX_SWITCH_DESKTOP_TO_WINLOGON WlxSwitchDesktopToWinlogon;
    PWLX_CHANGE_PASSWORD_NOTIFY WlxChangePasswordNotify;
    PWLX_GET_SOURCE_DESKTOP WlxGetSourceDesktop;
    PWLX_SET_RETURN_DESKTOP WlxSetReturnDesktop;
    PWLX_CREATE_USER_DESKTOP WlxCreateUserDesktop;
    PWLX_CHANGE_PASSWORD_NOTIFY_EX WlxChangePasswordNotifyEx;
}
struct WLX_DISPATCH_VERSION_1_2
{
    PWLX_USE_CTRL_ALT_DEL WlxUseCtrlAltDel;
    PWLX_SET_CONTEXT_POINTER WlxSetContextPointer;
    PWLX_SAS_NOTIFY WlxSasNotify;
    PWLX_SET_TIMEOUT WlxSetTimeout;
    PWLX_ASSIGN_SHELL_PROTECTION WlxAssignShellProtection;
    PWLX_MESSAGE_BOX WlxMessageBox;
    PWLX_DIALOG_BOX WlxDialogBox;
    PWLX_DIALOG_BOX_PARAM WlxDialogBoxParam;
    PWLX_DIALOG_BOX_INDIRECT WlxDialogBoxIndirect;
    PWLX_DIALOG_BOX_INDIRECT_PARAM WlxDialogBoxIndirectParam;
    PWLX_SWITCH_DESKTOP_TO_USER WlxSwitchDesktopToUser;
    PWLX_SWITCH_DESKTOP_TO_WINLOGON WlxSwitchDesktopToWinlogon;
    PWLX_CHANGE_PASSWORD_NOTIFY WlxChangePasswordNotify;
    PWLX_GET_SOURCE_DESKTOP WlxGetSourceDesktop;
    PWLX_SET_RETURN_DESKTOP WlxSetReturnDesktop;
    PWLX_CREATE_USER_DESKTOP WlxCreateUserDesktop;
    PWLX_CHANGE_PASSWORD_NOTIFY_EX WlxChangePasswordNotifyEx;
    PWLX_CLOSE_USER_DESKTOP WlxCloseUserDesktop;
}
struct WLX_DISPATCH_VERSION_1_3
{
    PWLX_USE_CTRL_ALT_DEL WlxUseCtrlAltDel;
    PWLX_SET_CONTEXT_POINTER WlxSetContextPointer;
    PWLX_SAS_NOTIFY WlxSasNotify;
    PWLX_SET_TIMEOUT WlxSetTimeout;
    PWLX_ASSIGN_SHELL_PROTECTION WlxAssignShellProtection;
    PWLX_MESSAGE_BOX WlxMessageBox;
    PWLX_DIALOG_BOX WlxDialogBox;
    PWLX_DIALOG_BOX_PARAM WlxDialogBoxParam;
    PWLX_DIALOG_BOX_INDIRECT WlxDialogBoxIndirect;
    PWLX_DIALOG_BOX_INDIRECT_PARAM WlxDialogBoxIndirectParam;
    PWLX_SWITCH_DESKTOP_TO_USER WlxSwitchDesktopToUser;
    PWLX_SWITCH_DESKTOP_TO_WINLOGON WlxSwitchDesktopToWinlogon;
    PWLX_CHANGE_PASSWORD_NOTIFY WlxChangePasswordNotify;
    PWLX_GET_SOURCE_DESKTOP WlxGetSourceDesktop;
    PWLX_SET_RETURN_DESKTOP WlxSetReturnDesktop;
    PWLX_CREATE_USER_DESKTOP WlxCreateUserDesktop;
    PWLX_CHANGE_PASSWORD_NOTIFY_EX WlxChangePasswordNotifyEx;
    PWLX_CLOSE_USER_DESKTOP WlxCloseUserDesktop;
    PWLX_SET_OPTION WlxSetOption;
    PWLX_GET_OPTION WlxGetOption;
    PWLX_WIN31_MIGRATE WlxWin31Migrate;
    PWLX_QUERY_CLIENT_CREDENTIALS WlxQueryClientCredentials;
    PWLX_QUERY_IC_CREDENTIALS WlxQueryInetConnectorCredentials;
    PWLX_DISCONNECT WlxDisconnect;
    PWLX_QUERY_TERMINAL_SERVICES_DATA WlxQueryTerminalServicesData;
}
struct WLX_DISPATCH_VERSION_1_4
{
    PWLX_USE_CTRL_ALT_DEL WlxUseCtrlAltDel;
    PWLX_SET_CONTEXT_POINTER WlxSetContextPointer;
    PWLX_SAS_NOTIFY WlxSasNotify;
    PWLX_SET_TIMEOUT WlxSetTimeout;
    PWLX_ASSIGN_SHELL_PROTECTION WlxAssignShellProtection;
    PWLX_MESSAGE_BOX WlxMessageBox;
    PWLX_DIALOG_BOX WlxDialogBox;
    PWLX_DIALOG_BOX_PARAM WlxDialogBoxParam;
    PWLX_DIALOG_BOX_INDIRECT WlxDialogBoxIndirect;
    PWLX_DIALOG_BOX_INDIRECT_PARAM WlxDialogBoxIndirectParam;
    PWLX_SWITCH_DESKTOP_TO_USER WlxSwitchDesktopToUser;
    PWLX_SWITCH_DESKTOP_TO_WINLOGON WlxSwitchDesktopToWinlogon;
    PWLX_CHANGE_PASSWORD_NOTIFY WlxChangePasswordNotify;
    PWLX_GET_SOURCE_DESKTOP WlxGetSourceDesktop;
    PWLX_SET_RETURN_DESKTOP WlxSetReturnDesktop;
    PWLX_CREATE_USER_DESKTOP WlxCreateUserDesktop;
    PWLX_CHANGE_PASSWORD_NOTIFY_EX WlxChangePasswordNotifyEx;
    PWLX_CLOSE_USER_DESKTOP WlxCloseUserDesktop;
    PWLX_SET_OPTION WlxSetOption;
    PWLX_GET_OPTION WlxGetOption;
    PWLX_WIN31_MIGRATE WlxWin31Migrate;
    PWLX_QUERY_CLIENT_CREDENTIALS WlxQueryClientCredentials;
    PWLX_QUERY_IC_CREDENTIALS WlxQueryInetConnectorCredentials;
    PWLX_DISCONNECT WlxDisconnect;
    PWLX_QUERY_TERMINAL_SERVICES_DATA WlxQueryTerminalServicesData;
    PWLX_QUERY_CONSOLESWITCH_CREDENTIALS WlxQueryConsoleSwitchCredentials;
    PWLX_QUERY_TS_LOGON_CREDENTIALS WlxQueryTsLogonCredentials;
}
alias PFNMSGECALLBACK = uint function(BOOL, PWSTR);
struct WLX_NOTIFICATION_INFO
{
    uint Size;
    uint Flags;
    PWSTR UserName;
    PWSTR Domain;
    PWSTR WindowStation;
    HANDLE hToken;
    HDESK hDesktop;
    PFNMSGECALLBACK pStatusCallback;
}
