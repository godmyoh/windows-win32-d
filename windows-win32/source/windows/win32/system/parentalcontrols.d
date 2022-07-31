module windows.win32.system.parentalcontrols;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, HWND, PWSTR, SYSTEMTIME;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum ARRAY_SEP_CHAR = 0x00000009;
enum WPCCHANNEL = 0x00000010;
enum WPC_SETTINGS_LOCATE = 0x00000014;
enum WPC_SETTINGS_MODIFY = 0x00000015;
enum WPC_APP_LAUNCH = 0x00000016;
enum WPC_SYSTEM = 0x00000017;
enum WPC_WEB = 0x00000018;
enum WPCPROV_TASK_SettingChange = 0x00000001;
enum WPCPROV_TASK_GameStart = 0x00000002;
enum WPCPROV_TASK_UrlVisit = 0x00000003;
enum WPCPROV_TASK_EmailReceived = 0x00000004;
enum WPCPROV_TASK_EmailSent = 0x00000005;
enum WPCPROV_TASK_MediaPlayback = 0x00000006;
enum WPCPROV_TASK_IMInvitation = 0x00000007;
enum WPCPROV_TASK_IMJoin = 0x00000008;
enum WPCPROV_TASK_IMLeave = 0x00000009;
enum WPCPROV_TASK_FileDownload = 0x0000000a;
enum WPCPROV_TASK_IMFeature = 0x0000000b;
enum WPCPROV_TASK_Custom = 0x0000000d;
enum WPCPROV_TASK_EmailContact = 0x0000000e;
enum WPCPROV_TASK_IMContact = 0x0000000f;
enum WPCPROV_TASK_AppBlocked = 0x00000010;
enum WPCPROV_TASK_AppOverride = 0x00000011;
enum WPCPROV_TASK_WebOverride = 0x00000012;
enum WPCPROV_TASK_WebsiteVisit = 0x00000013;
enum WPCPROV_TASK_Application = 0x00000014;
enum WPCPROV_TASK_ComputerUsage = 0x00000015;
enum WPCPROV_TASK_ContentUsage = 0x00000016;
enum WPCPROV_KEYWORD_WPC = 0x00000010;
enum WPCPROV_KEYWORD_ThirdParty = 0x00000020;
enum WPCEVENT_SYS_SETTINGCHANGE_value = 0x00000001;
enum WPCEVENT_GAME_START_value = 0x00000002;
enum WPCEVENT_WEB_URLVISIT_value = 0x00000003;
enum WPCEVENT_EMAIL_RECEIVED_value = 0x00000004;
enum WPCEVENT_EMAIL_SENT_value = 0x00000005;
enum WPCEVENT_MEDIA_PLAYBACK_value = 0x00000006;
enum WPCEVENT_IM_INVITATION_value = 0x00000007;
enum WPCEVENT_IM_JOIN_value = 0x00000008;
enum WPCEVENT_IM_LEAVE_value = 0x00000009;
enum WPCEVENT_WEB_FILEDOWNLOAD_value = 0x0000000a;
enum WPCEVENT_IM_FEATURE_value = 0x0000000b;
enum WPCEVENT_CUSTOM_value = 0x0000000d;
enum WPCEVENT_EMAIL_CONTACT_value = 0x0000000e;
enum WPCEVENT_IM_CONTACT_value = 0x0000000f;
enum WPCEVENT_SYSTEM_APPBLOCKED_value = 0x00000010;
enum WPCEVENT_APPOVERRIDE_value = 0x00000011;
enum WPCEVENT_WEBOVERRIDE_value = 0x00000012;
enum WPCEVENT_WEB_WEBSITEVISIT_value = 0x00000013;
enum WPCEVENT_APPLICATION_value = 0x00000014;
enum WPCEVENT_COMPUTERUSAGE_value = 0x00000015;
enum WPCEVENT_CONTENTUSAGE_value = 0x00000016;
enum MSG_Keyword_WPC = 0x10000005;
enum MSG_Keyword_ThirdParty = 0x10000006;
enum MSG_Opcode_Locate = 0x30000014;
enum MSG_Opcode_Modify = 0x30000015;
enum MSG_Opcode_Launch = 0x30000016;
enum MSG_Opcode_System = 0x30000017;
enum MSG_Opcode_Web = 0x30000018;
enum MSG_Task_SettingChange = 0x70000001;
enum MSG_Task_GameStart = 0x70000002;
enum MSG_Task_UrlVisit = 0x70000003;
enum MSG_Task_EmailReceived = 0x70000004;
enum MSG_Task_EmailSent = 0x70000005;
enum MSG_Task_MediaPlayback = 0x70000006;
enum MSG_Task_IMInvitation = 0x70000007;
enum MSG_Task_IMJoin = 0x70000008;
enum MSG_Task_IMLeave = 0x70000009;
enum MSG_Task_FileDownload = 0x7000000a;
enum MSG_Task_IMFeature = 0x7000000b;
enum MSG_Task_Custom = 0x7000000d;
enum MSG_Task_EmailContact = 0x7000000e;
enum MSG_Task_IMContact = 0x7000000f;
enum MSG_Task_AppBlocked = 0x70000010;
enum MSG_Task_AppOverride = 0x70000011;
enum MSG_Task_WebOverride = 0x70000012;
enum MSG_Task_WebsiteVisit = 0x70000013;
enum MSG_Task_Application = 0x70000014;
enum MSG_Task_ComputerUsage = 0x70000015;
enum MSG_Task_ContentUsage = 0x70000016;
enum MSG_Publisher_Name = 0xffffffff90000001;
enum MSG_Event_SettingChange = 0xffffffffb0000001;
enum MSG_Event_GameStart = 0xffffffffb0000002;
enum MSG_Event_UrlVisit = 0xffffffffb0000003;
enum MSG_Event_EmailReceived = 0xffffffffb0000004;
enum MSG_Event_EmailSent = 0xffffffffb0000005;
enum MSG_Event_MediaPlayback = 0xffffffffb0000006;
enum MSG_Event_IMInvitation = 0xffffffffb0000007;
enum MSG_Event_IMJoin = 0xffffffffb0000008;
enum MSG_Event_IMLeave = 0xffffffffb0000009;
enum MSG_Event_FileDownload = 0xffffffffb000000a;
enum MSG_Event_IMFeature = 0xffffffffb000000b;
enum MSG_Event_Custom = 0xffffffffb000000d;
enum MSG_Event_EmailContact = 0xffffffffb000000e;
enum MSG_Event_IMContact = 0xffffffffb000000f;
enum MSG_Event_AppBlocked = 0xffffffffb0000010;
enum MSG_Event_AppOverride = 0xffffffffb0000011;
enum MSG_Event_WebOverride = 0xffffffffb0000012;
enum MSG_Event_WebsiteVisit = 0xffffffffb0000013;
enum MSG_Event_Application = 0xffffffffb0000014;
enum MSG_Event_ComputerUsage = 0xffffffffb0000015;
enum MSG_Event_ContentUsage = 0xffffffffb0000016;
enum FACILITY_WPC = 0x00000999;
enum WPCPROV = GUID(0x1090065, 0xb467, 0x4503, [0x9b, 0x28, 0x53, 0x37, 0x66, 0x76, 0x10, 0x87]);
enum CLSID_WpcSettingsProvider = GUID(0x355dffaa, 0x3b9f, 0x435c, [0xb4, 0x28, 0x5d, 0x44, 0x29, 0xb, 0xc5, 0xf2]);
struct WpcSettingsProvider
{
}
enum CLSID_WpcProviderSupport = GUID(0xbb18c7a0, 0x2186, 0x4be0, [0x97, 0xd8, 0x4, 0x84, 0x7b, 0x62, 0x8e, 0x2]);
struct WpcProviderSupport
{
}
enum CLSID_WindowsParentalControls = GUID(0xe77cc89b, 0x7401, 0x4c04, [0x8c, 0xed, 0x14, 0x9d, 0xb3, 0x5a, 0xdd, 0x4]);
struct WindowsParentalControls
{
}
enum IID_IWPCProviderState = GUID(0x50b6a267, 0xc4bd, 0x450b, [0xad, 0xb5, 0x75, 0x90, 0x73, 0x83, 0x7c, 0x9e]);
interface IWPCProviderState : IUnknown
{
    HRESULT Enable();
    HRESULT Disable();
}
alias WPCFLAG_OVERRIDE = int;
enum : int
{
    WPCFLAG_APPLICATION = 0x00000001,
}

enum IID_IWPCProviderConfig = GUID(0xbef54196, 0x2d02, 0x4a26, [0xb6, 0xe5, 0xd6, 0x5a, 0xf2, 0x95, 0xd0, 0xf1]);
interface IWPCProviderConfig : IUnknown
{
    HRESULT GetUserSummary(BSTR, BSTR*);
    HRESULT Configure(HWND, BSTR);
    HRESULT RequestOverride(HWND, BSTR, WPCFLAG_RESTRICTION);
}
alias WPCFLAG_RESTRICTION = int;
enum : int
{
    WPCFLAG_NO_RESTRICTION            = 0x00000000,
    WPCFLAG_LOGGING_REQUIRED          = 0x00000001,
    WPCFLAG_WEB_FILTERED              = 0x00000002,
    WPCFLAG_HOURS_RESTRICTED          = 0x00000004,
    WPCFLAG_GAMES_BLOCKED             = 0x00000008,
    WPCFLAG_APPS_RESTRICTED           = 0x00000010,
    WPCFLAG_TIME_ALLOWANCE_RESTRICTED = 0x00000020,
    WPCFLAG_GAMES_RESTRICTED          = 0x00000040,
}

enum IID_IWPCSettings = GUID(0x8fdf6ca1, 0x189, 0x47e4, [0xb6, 0x70, 0x1a, 0x8a, 0x46, 0x36, 0xe3, 0x40]);
interface IWPCSettings : IUnknown
{
    HRESULT IsLoggingRequired(BOOL*);
    HRESULT GetLastSettingsChangeTime(SYSTEMTIME*);
    HRESULT GetRestrictions(WPCFLAG_RESTRICTION*);
}
enum IID_IWPCGamesSettings = GUID(0x95e87780, 0xe158, 0x489e, [0xb4, 0x52, 0xbb, 0xb8, 0x50, 0x79, 0x7, 0x15]);
interface IWPCGamesSettings : IWPCSettings
{
    HRESULT IsBlocked(GUID, uint*);
}
alias WPCFLAG_WEB_SETTING = int;
enum : int
{
    WPCFLAG_WEB_SETTING_NOTBLOCKED       = 0x00000000,
    WPCFLAG_WEB_SETTING_DOWNLOADSBLOCKED = 0x00000001,
}

enum IID_IWPCWebSettings = GUID(0xffccbdb8, 0x992, 0x4c30, [0xb0, 0xf1, 0x1c, 0xbb, 0x9, 0xc2, 0x40, 0xaa]);
interface IWPCWebSettings : IWPCSettings
{
    HRESULT GetSettings(WPCFLAG_WEB_SETTING*);
    HRESULT RequestURLOverride(HWND, const(wchar)*, uint, PWSTR*, BOOL*);
}
alias WPCFLAG_VISIBILITY = int;
enum : int
{
    WPCFLAG_WPC_VISIBLE = 0x00000000,
    WPCFLAG_WPC_HIDDEN  = 0x00000001,
}

enum IID_IWindowsParentalControlsCore = GUID(0x4ff40a0f, 0x3f3b, 0x4d7c, [0xa4, 0x1b, 0x4f, 0x39, 0xd7, 0xb4, 0x4d, 0x5]);
interface IWindowsParentalControlsCore : IUnknown
{
    HRESULT GetVisibility(WPCFLAG_VISIBILITY*);
    HRESULT GetUserSettings(const(wchar)*, IWPCSettings*);
    HRESULT GetWebSettings(const(wchar)*, IWPCWebSettings*);
    HRESULT GetWebFilterInfo(GUID*, PWSTR*);
}
enum IID_IWindowsParentalControls = GUID(0x28b4d88b, 0xe072, 0x49e6, [0x80, 0x4d, 0x26, 0xed, 0xbe, 0x21, 0xa7, 0xb9]);
interface IWindowsParentalControls : IWindowsParentalControlsCore
{
    HRESULT GetGamesSettings(const(wchar)*, IWPCGamesSettings*);
}
enum IID_IWPCProviderSupport = GUID(0x41eba572, 0x23ed, 0x4779, [0xbe, 0xc1, 0x8d, 0xf9, 0x62, 0x6, 0xc4, 0x4c]);
interface IWPCProviderSupport : IUnknown
{
    HRESULT GetCurrent(GUID*);
}
alias WPCFLAG_ISBLOCKED = int;
enum : int
{
    WPCFLAG_ISBLOCKED_NOTBLOCKED            = 0x00000000,
    WPCFLAG_ISBLOCKED_IMBLOCKED             = 0x00000001,
    WPCFLAG_ISBLOCKED_EMAILBLOCKED          = 0x00000002,
    WPCFLAG_ISBLOCKED_MEDIAPLAYBACKBLOCKED  = 0x00000004,
    WPCFLAG_ISBLOCKED_WEBBLOCKED            = 0x00000008,
    WPCFLAG_ISBLOCKED_GAMESBLOCKED          = 0x00000010,
    WPCFLAG_ISBLOCKED_CONTACTBLOCKED        = 0x00000020,
    WPCFLAG_ISBLOCKED_FEATUREBLOCKED        = 0x00000040,
    WPCFLAG_ISBLOCKED_DOWNLOADBLOCKED       = 0x00000080,
    WPCFLAG_ISBLOCKED_RATINGBLOCKED         = 0x00000100,
    WPCFLAG_ISBLOCKED_DESCRIPTORBLOCKED     = 0x00000200,
    WPCFLAG_ISBLOCKED_EXPLICITBLOCK         = 0x00000400,
    WPCFLAG_ISBLOCKED_BADPASS               = 0x00000800,
    WPCFLAG_ISBLOCKED_MAXHOURS              = 0x00001000,
    WPCFLAG_ISBLOCKED_SPECHOURS             = 0x00002000,
    WPCFLAG_ISBLOCKED_SETTINGSCHANGEBLOCKED = 0x00004000,
    WPCFLAG_ISBLOCKED_ATTACHMENTBLOCKED     = 0x00008000,
    WPCFLAG_ISBLOCKED_SENDERBLOCKED         = 0x00010000,
    WPCFLAG_ISBLOCKED_RECEIVERBLOCKED       = 0x00020000,
    WPCFLAG_ISBLOCKED_NOTEXPLICITLYALLOWED  = 0x00040000,
    WPCFLAG_ISBLOCKED_NOTINLIST             = 0x00080000,
    WPCFLAG_ISBLOCKED_CATEGORYBLOCKED       = 0x00100000,
    WPCFLAG_ISBLOCKED_CATEGORYNOTINLIST     = 0x00200000,
    WPCFLAG_ISBLOCKED_NOTKIDS               = 0x00400000,
    WPCFLAG_ISBLOCKED_UNRATED               = 0x00800000,
    WPCFLAG_ISBLOCKED_NOACCESS              = 0x01000000,
    WPCFLAG_ISBLOCKED_INTERNALERROR         = 0xffffffff,
}

alias WPCFLAG_LOGOFF_TYPE = int;
enum : int
{
    WPCFLAG_LOGOFF_TYPE_LOGOUT    = 0x00000000,
    WPCFLAG_LOGOFF_TYPE_RESTART   = 0x00000001,
    WPCFLAG_LOGOFF_TYPE_SHUTDOWN  = 0x00000002,
    WPCFLAG_LOGOFF_TYPE_FUS       = 0x00000004,
    WPCFLAG_LOGOFF_TYPE_FORCEDFUS = 0x00000008,
}

alias WPCFLAG_IM_LEAVE = int;
enum : int
{
    WPCFLAG_IM_LEAVE_NORMAL           = 0x00000000,
    WPCFLAG_IM_LEAVE_FORCED           = 0x00000001,
    WPCFLAG_IM_LEAVE_CONVERSATION_END = 0x00000002,
}

alias WPC_ARGS_SETTINGSCHANGEEVENT = int;
enum : int
{
    WPC_ARGS_SETTINGSCHANGEEVENT_CLASS    = 0x00000000,
    WPC_ARGS_SETTINGSCHANGEEVENT_SETTING  = 0x00000001,
    WPC_ARGS_SETTINGSCHANGEEVENT_OWNER    = 0x00000002,
    WPC_ARGS_SETTINGSCHANGEEVENT_OLDVAL   = 0x00000003,
    WPC_ARGS_SETTINGSCHANGEEVENT_NEWVAL   = 0x00000004,
    WPC_ARGS_SETTINGSCHANGEEVENT_REASON   = 0x00000005,
    WPC_ARGS_SETTINGSCHANGEEVENT_OPTIONAL = 0x00000006,
    WPC_ARGS_SETTINGSCHANGEEVENT_CARGS    = 0x00000007,
}

alias WPC_ARGS_SAFERAPPBLOCKED = int;
enum : int
{
    WPC_ARGS_SAFERAPPBLOCKED_TIMESTAMP = 0x00000000,
    WPC_ARGS_SAFERAPPBLOCKED_USERID    = 0x00000001,
    WPC_ARGS_SAFERAPPBLOCKED_PATH      = 0x00000002,
    WPC_ARGS_SAFERAPPBLOCKED_RULEID    = 0x00000003,
    WPC_ARGS_SAFERAPPBLOCKED_CARGS     = 0x00000004,
}

alias WPC_ARGS_EMAILRECEIEVEDEVENT = int;
enum : int
{
    WPC_ARGS_EMAILRECEIEVEDEVENT_SENDER         = 0x00000000,
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPNAME        = 0x00000001,
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPVERSION     = 0x00000002,
    WPC_ARGS_EMAILRECEIEVEDEVENT_SUBJECT        = 0x00000003,
    WPC_ARGS_EMAILRECEIEVEDEVENT_REASON         = 0x00000004,
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPCOUNT     = 0x00000005,
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPIENT      = 0x00000006,
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHCOUNT    = 0x00000007,
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHMENTNAME = 0x00000008,
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECEIVEDTIME   = 0x00000009,
    WPC_ARGS_EMAILRECEIEVEDEVENT_EMAILACCOUNT   = 0x0000000a,
    WPC_ARGS_EMAILRECEIEVEDEVENT_CARGS          = 0x0000000b,
}

alias WPC_ARGS_EMAILSENTEVENT = int;
enum : int
{
    WPC_ARGS_EMAILSENTEVENT_SENDER         = 0x00000000,
    WPC_ARGS_EMAILSENTEVENT_APPNAME        = 0x00000001,
    WPC_ARGS_EMAILSENTEVENT_APPVERSION     = 0x00000002,
    WPC_ARGS_EMAILSENTEVENT_SUBJECT        = 0x00000003,
    WPC_ARGS_EMAILSENTEVENT_REASON         = 0x00000004,
    WPC_ARGS_EMAILSENTEVENT_RECIPCOUNT     = 0x00000005,
    WPC_ARGS_EMAILSENTEVENT_RECIPIENT      = 0x00000006,
    WPC_ARGS_EMAILSENTEVENT_ATTACHCOUNT    = 0x00000007,
    WPC_ARGS_EMAILSENTEVENT_ATTACHMENTNAME = 0x00000008,
    WPC_ARGS_EMAILSENTEVENT_EMAILACCOUNT   = 0x00000009,
    WPC_ARGS_EMAILSENTEVENT_CARGS          = 0x0000000a,
}

alias WPC_ARGS_EMAILCONTACTEVENT = int;
enum : int
{
    WPC_ARGS_EMAILCONTACTEVENT_APPNAME      = 0x00000000,
    WPC_ARGS_EMAILCONTACTEVENT_APPVERSION   = 0x00000001,
    WPC_ARGS_EMAILCONTACTEVENT_OLDNAME      = 0x00000002,
    WPC_ARGS_EMAILCONTACTEVENT_OLDID        = 0x00000003,
    WPC_ARGS_EMAILCONTACTEVENT_NEWNAME      = 0x00000004,
    WPC_ARGS_EMAILCONTACTEVENT_NEWID        = 0x00000005,
    WPC_ARGS_EMAILCONTACTEVENT_REASON       = 0x00000006,
    WPC_ARGS_EMAILCONTACTEVENT_EMAILACCOUNT = 0x00000007,
    WPC_ARGS_EMAILCONTACTEVENT_CARGS        = 0x00000008,
}

alias WPC_MEDIA_TYPE = int;
enum : int
{
    WPC_MEDIA_TYPE_OTHER        = 0x00000000,
    WPC_MEDIA_TYPE_DVD          = 0x00000001,
    WPC_MEDIA_TYPE_RECORDED_TV  = 0x00000002,
    WPC_MEDIA_TYPE_AUDIO_FILE   = 0x00000003,
    WPC_MEDIA_TYPE_CD_AUDIO     = 0x00000004,
    WPC_MEDIA_TYPE_VIDEO_FILE   = 0x00000005,
    WPC_MEDIA_TYPE_PICTURE_FILE = 0x00000006,
    WPC_MEDIA_TYPE_MAX          = 0x00000007,
}

alias WPC_MEDIA_EXPLICIT = int;
enum : int
{
    WPC_MEDIA_EXPLICIT_FALSE   = 0x00000000,
    WPC_MEDIA_EXPLICIT_TRUE    = 0x00000001,
    WPC_MEDIA_EXPLICIT_UNKNOWN = 0x00000002,
}

alias WPC_ARGS_MEDIAPLAYBACKEVENT = int;
enum : int
{
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPNAME    = 0x00000000,
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPVERSION = 0x00000001,
    WPC_ARGS_MEDIAPLAYBACKEVENT_MEDIATYPE  = 0x00000002,
    WPC_ARGS_MEDIAPLAYBACKEVENT_PATH       = 0x00000003,
    WPC_ARGS_MEDIAPLAYBACKEVENT_TITLE      = 0x00000004,
    WPC_ARGS_MEDIAPLAYBACKEVENT_PML        = 0x00000005,
    WPC_ARGS_MEDIAPLAYBACKEVENT_ALBUM      = 0x00000006,
    WPC_ARGS_MEDIAPLAYBACKEVENT_EXPLICIT   = 0x00000007,
    WPC_ARGS_MEDIAPLAYBACKEVENT_REASON     = 0x00000008,
    WPC_ARGS_MEDIAPLAYBACKEVENT_CARGS      = 0x00000009,
}

alias WPC_ARGS_MEDIADOWNLOADEVENT = int;
enum : int
{
    WPC_ARGS_MEDIADOWNLOADEVENT_APPNAME    = 0x00000000,
    WPC_ARGS_MEDIADOWNLOADEVENT_APPVERSION = 0x00000001,
    WPC_ARGS_MEDIADOWNLOADEVENT_MEDIATYPE  = 0x00000002,
    WPC_ARGS_MEDIADOWNLOADEVENT_PATH       = 0x00000003,
    WPC_ARGS_MEDIADOWNLOADEVENT_TITLE      = 0x00000004,
    WPC_ARGS_MEDIADOWNLOADEVENT_PML        = 0x00000005,
    WPC_ARGS_MEDIADOWNLOADEVENT_ALBUM      = 0x00000006,
    WPC_ARGS_MEDIADOWNLOADEVENT_EXPLICIT   = 0x00000007,
    WPC_ARGS_MEDIADOWNLOADEVENT_REASON     = 0x00000008,
    WPC_ARGS_MEDIADOWNLOADEVENT_CARGS      = 0x00000009,
}

alias WPC_ARGS_CONVERSATIONINITEVENT = int;
enum : int
{
    WPC_ARGS_CONVERSATIONINITEVENT_APPNAME      = 0x00000000,
    WPC_ARGS_CONVERSATIONINITEVENT_APPVERSION   = 0x00000001,
    WPC_ARGS_CONVERSATIONINITEVENT_ACCOUNTNAME  = 0x00000002,
    WPC_ARGS_CONVERSATIONINITEVENT_CONVID       = 0x00000003,
    WPC_ARGS_CONVERSATIONINITEVENT_REQUESTINGIP = 0x00000004,
    WPC_ARGS_CONVERSATIONINITEVENT_SENDER       = 0x00000005,
    WPC_ARGS_CONVERSATIONINITEVENT_REASON       = 0x00000006,
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPCOUNT   = 0x00000007,
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPIENT    = 0x00000008,
    WPC_ARGS_CONVERSATIONINITEVENT_CARGS        = 0x00000009,
}

alias WPC_ARGS_CONVERSATIONJOINEVENT = int;
enum : int
{
    WPC_ARGS_CONVERSATIONJOINEVENT_APPNAME     = 0x00000000,
    WPC_ARGS_CONVERSATIONJOINEVENT_APPVERSION  = 0x00000001,
    WPC_ARGS_CONVERSATIONJOINEVENT_ACCOUNTNAME = 0x00000002,
    WPC_ARGS_CONVERSATIONJOINEVENT_CONVID      = 0x00000003,
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGIP   = 0x00000004,
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGUSER = 0x00000005,
    WPC_ARGS_CONVERSATIONJOINEVENT_REASON      = 0x00000006,
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBERCOUNT = 0x00000007,
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBER      = 0x00000008,
    WPC_ARGS_CONVERSATIONJOINEVENT_SENDER      = 0x00000009,
    WPC_ARGS_CONVERSATIONJOINEVENT_CARGS       = 0x0000000a,
}

alias WPC_ARGS_CONVERSATIONLEAVEEVENT = int;
enum : int
{
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPNAME     = 0x00000000,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPVERSION  = 0x00000001,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_ACCOUNTNAME = 0x00000002,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CONVID      = 0x00000003,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGIP   = 0x00000004,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGUSER = 0x00000005,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_REASON      = 0x00000006,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBERCOUNT = 0x00000007,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBER      = 0x00000008,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_FLAGS       = 0x00000009,
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CARGS       = 0x0000000a,
}

alias WPCFLAG_IM_FEATURE = int;
enum : int
{
    WPCFLAG_IM_FEATURE_NONE     = 0x00000000,
    WPCFLAG_IM_FEATURE_VIDEO    = 0x00000001,
    WPCFLAG_IM_FEATURE_AUDIO    = 0x00000002,
    WPCFLAG_IM_FEATURE_GAME     = 0x00000004,
    WPCFLAG_IM_FEATURE_SMS      = 0x00000008,
    WPCFLAG_IM_FEATURE_FILESWAP = 0x00000010,
    WPCFLAG_IM_FEATURE_URLSWAP  = 0x00000020,
    WPCFLAG_IM_FEATURE_SENDING  = 0x80000000,
    WPCFLAG_IM_FEATURE_ALL      = 0xffffffff,
}

alias WPC_ARGS_IMFEATUREEVENT = int;
enum : int
{
    WPC_ARGS_IMFEATUREEVENT_APPNAME     = 0x00000000,
    WPC_ARGS_IMFEATUREEVENT_APPVERSION  = 0x00000001,
    WPC_ARGS_IMFEATUREEVENT_ACCOUNTNAME = 0x00000002,
    WPC_ARGS_IMFEATUREEVENT_CONVID      = 0x00000003,
    WPC_ARGS_IMFEATUREEVENT_MEDIATYPE   = 0x00000004,
    WPC_ARGS_IMFEATUREEVENT_REASON      = 0x00000005,
    WPC_ARGS_IMFEATUREEVENT_RECIPCOUNT  = 0x00000006,
    WPC_ARGS_IMFEATUREEVENT_RECIPIENT   = 0x00000007,
    WPC_ARGS_IMFEATUREEVENT_SENDER      = 0x00000008,
    WPC_ARGS_IMFEATUREEVENT_SENDERIP    = 0x00000009,
    WPC_ARGS_IMFEATUREEVENT_DATA        = 0x0000000a,
    WPC_ARGS_IMFEATUREEVENT_CARGS       = 0x0000000b,
}

alias WPC_ARGS_IMCONTACTEVENT = int;
enum : int
{
    WPC_ARGS_IMCONTACTEVENT_APPNAME     = 0x00000000,
    WPC_ARGS_IMCONTACTEVENT_APPVERSION  = 0x00000001,
    WPC_ARGS_IMCONTACTEVENT_ACCOUNTNAME = 0x00000002,
    WPC_ARGS_IMCONTACTEVENT_OLDNAME     = 0x00000003,
    WPC_ARGS_IMCONTACTEVENT_OLDID       = 0x00000004,
    WPC_ARGS_IMCONTACTEVENT_NEWNAME     = 0x00000005,
    WPC_ARGS_IMCONTACTEVENT_NEWID       = 0x00000006,
    WPC_ARGS_IMCONTACTEVENT_REASON      = 0x00000007,
    WPC_ARGS_IMCONTACTEVENT_CARGS       = 0x00000008,
}

alias WPC_ARGS_GAMESTARTEVENT = int;
enum : int
{
    WPC_ARGS_GAMESTARTEVENT_APPID        = 0x00000000,
    WPC_ARGS_GAMESTARTEVENT_INSTANCEID   = 0x00000001,
    WPC_ARGS_GAMESTARTEVENT_APPVERSION   = 0x00000002,
    WPC_ARGS_GAMESTARTEVENT_PATH         = 0x00000003,
    WPC_ARGS_GAMESTARTEVENT_RATING       = 0x00000004,
    WPC_ARGS_GAMESTARTEVENT_RATINGSYSTEM = 0x00000005,
    WPC_ARGS_GAMESTARTEVENT_REASON       = 0x00000006,
    WPC_ARGS_GAMESTARTEVENT_DESCCOUNT    = 0x00000007,
    WPC_ARGS_GAMESTARTEVENT_DESCRIPTOR   = 0x00000008,
    WPC_ARGS_GAMESTARTEVENT_PID          = 0x00000009,
    WPC_ARGS_GAMESTARTEVENT_CARGS        = 0x0000000a,
}

alias WPC_ARGS_FILEDOWNLOADEVENT = int;
enum : int
{
    WPC_ARGS_FILEDOWNLOADEVENT_URL     = 0x00000000,
    WPC_ARGS_FILEDOWNLOADEVENT_APPNAME = 0x00000001,
    WPC_ARGS_FILEDOWNLOADEVENT_VERSION = 0x00000002,
    WPC_ARGS_FILEDOWNLOADEVENT_BLOCKED = 0x00000003,
    WPC_ARGS_FILEDOWNLOADEVENT_PATH    = 0x00000004,
    WPC_ARGS_FILEDOWNLOADEVENT_CARGS   = 0x00000005,
}

alias WPC_ARGS_URLVISITEVENT = int;
enum : int
{
    WPC_ARGS_URLVISITEVENT_URL            = 0x00000000,
    WPC_ARGS_URLVISITEVENT_APPNAME        = 0x00000001,
    WPC_ARGS_URLVISITEVENT_VERSION        = 0x00000002,
    WPC_ARGS_URLVISITEVENT_REASON         = 0x00000003,
    WPC_ARGS_URLVISITEVENT_RATINGSYSTEMID = 0x00000004,
    WPC_ARGS_URLVISITEVENT_CATCOUNT       = 0x00000005,
    WPC_ARGS_URLVISITEVENT_CATEGORY       = 0x00000006,
    WPC_ARGS_URLVISITEVENT_CARGS          = 0x00000007,
}

alias WPC_ARGS_WEBSITEVISITEVENT = int;
enum : int
{
    WPC_ARGS_WEBSITEVISITEVENT_URL                   = 0x00000000,
    WPC_ARGS_WEBSITEVISITEVENT_DECISION              = 0x00000001,
    WPC_ARGS_WEBSITEVISITEVENT_CATEGORIES            = 0x00000002,
    WPC_ARGS_WEBSITEVISITEVENT_BLOCKEDCATEGORIES     = 0x00000003,
    WPC_ARGS_WEBSITEVISITEVENT_SERIALIZEDAPPLICATION = 0x00000004,
    WPC_ARGS_WEBSITEVISITEVENT_TITLE                 = 0x00000005,
    WPC_ARGS_WEBSITEVISITEVENT_CONTENTTYPE           = 0x00000006,
    WPC_ARGS_WEBSITEVISITEVENT_REFERRER              = 0x00000007,
    WPC_ARGS_WEBSITEVISITEVENT_TELEMETRY             = 0x00000008,
    WPC_ARGS_WEBSITEVISITEVENT_CARGS                 = 0x00000009,
}

alias WPC_ARGS_APPLICATIONEVENT = int;
enum : int
{
    WPC_ARGS_APPLICATIONEVENT_SERIALIZEDAPPLICATION = 0x00000000,
    WPC_ARGS_APPLICATIONEVENT_DECISION              = 0x00000001,
    WPC_ARGS_APPLICATIONEVENT_PROCESSID             = 0x00000002,
    WPC_ARGS_APPLICATIONEVENT_CREATIONTIME          = 0x00000003,
    WPC_ARGS_APPLICATIONEVENT_TIMEUSED              = 0x00000004,
    WPC_ARGS_APPLICATIONEVENT_CARGS                 = 0x00000005,
}

alias WPC_ARGS_COMPUTERUSAGEEVENT = int;
enum : int
{
    WPC_ARGS_COMPUTERUSAGEEVENT_ID       = 0x00000000,
    WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED = 0x00000001,
    WPC_ARGS_COMPUTERUSAGEEVENT_CARGS    = 0x00000002,
}

alias WPC_ARGS_CONTENTUSAGEEVENT = int;
enum : int
{
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID    = 0x00000000,
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE = 0x00000001,
    WPC_ARGS_CONTENTUSAGEEVENT_ID                   = 0x00000002,
    WPC_ARGS_CONTENTUSAGEEVENT_TITLE                = 0x00000003,
    WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY             = 0x00000004,
    WPC_ARGS_CONTENTUSAGEEVENT_RATINGS              = 0x00000005,
    WPC_ARGS_CONTENTUSAGEEVENT_DECISION             = 0x00000006,
    WPC_ARGS_CONTENTUSAGEEVENT_CARGS                = 0x00000007,
}

alias WPC_ARGS_CUSTOMEVENT = int;
enum : int
{
    WPC_ARGS_CUSTOMEVENT_PUBLISHER  = 0x00000000,
    WPC_ARGS_CUSTOMEVENT_APPNAME    = 0x00000001,
    WPC_ARGS_CUSTOMEVENT_APPVERSION = 0x00000002,
    WPC_ARGS_CUSTOMEVENT_EVENT      = 0x00000003,
    WPC_ARGS_CUSTOMEVENT_VALUE1     = 0x00000004,
    WPC_ARGS_CUSTOMEVENT_VALUE2     = 0x00000005,
    WPC_ARGS_CUSTOMEVENT_VALUE3     = 0x00000006,
    WPC_ARGS_CUSTOMEVENT_BLOCKED    = 0x00000007,
    WPC_ARGS_CUSTOMEVENT_REASON     = 0x00000008,
    WPC_ARGS_CUSTOMEVENT_CARGS      = 0x00000009,
}

alias WPC_ARGS_WEBOVERRIDEEVENT = int;
enum : int
{
    WPC_ARGS_WEBOVERRIDEEVENT_USERID = 0x00000000,
    WPC_ARGS_WEBOVERRIDEEVENT_URL    = 0x00000001,
    WPC_ARGS_WEBOVERRIDEEVENT_REASON = 0x00000002,
    WPC_ARGS_WEBOVERRIDEEVENT_CARGS  = 0x00000003,
}

alias WPC_ARGS_APPOVERRIDEEVENT = int;
enum : int
{
    WPC_ARGS_APPOVERRIDEEVENT_USERID = 0x00000000,
    WPC_ARGS_APPOVERRIDEEVENT_PATH   = 0x00000001,
    WPC_ARGS_APPOVERRIDEEVENT_REASON = 0x00000002,
    WPC_ARGS_APPOVERRIDEEVENT_CARGS  = 0x00000003,
}

alias WPC_SETTINGS = int;
enum : int
{
    WPC_SETTINGS_WPC_EXTENSION_PATH                = 0x00000000,
    WPC_SETTINGS_WPC_EXTENSION_SILO                = 0x00000001,
    WPC_SETTINGS_WPC_EXTENSION_IMAGE_PATH          = 0x00000002,
    WPC_SETTINGS_WPC_EXTENSION_DISABLEDIMAGE_PATH  = 0x00000003,
    WPC_SETTINGS_WPC_EXTENSION_NAME                = 0x00000004,
    WPC_SETTINGS_WPC_EXTENSION_SUB_TITLE           = 0x00000005,
    WPC_SETTINGS_SYSTEM_CURRENT_RATING_SYSTEM      = 0x00000006,
    WPC_SETTINGS_SYSTEM_LAST_LOG_VIEW              = 0x00000007,
    WPC_SETTINGS_SYSTEM_LOG_VIEW_REMINDER_INTERVAL = 0x00000008,
    WPC_SETTINGS_SYSTEM_HTTP_EXEMPTION_LIST        = 0x00000009,
    WPC_SETTINGS_SYSTEM_URL_EXEMPTION_LIST         = 0x0000000a,
    WPC_SETTINGS_SYSTEM_FILTER_ID                  = 0x0000000b,
    WPC_SETTINGS_SYSTEM_FILTER_NAME                = 0x0000000c,
    WPC_SETTINGS_SYSTEM_LOCALE                     = 0x0000000d,
    WPC_SETTINGS_ALLOW_BLOCK                       = 0x0000000e,
    WPC_SETTINGS_GAME_BLOCKED                      = 0x0000000f,
    WPC_SETTINGS_GAME_ALLOW_UNRATED                = 0x00000010,
    WPC_SETTINGS_GAME_MAX_ALLOWED                  = 0x00000011,
    WPC_SETTINGS_GAME_DENIED_DESCRIPTORS           = 0x00000012,
    WPC_SETTINGS_USER_WPC_ENABLED                  = 0x00000013,
    WPC_SETTINGS_USER_LOGGING_REQUIRED             = 0x00000014,
    WPC_SETTINGS_USER_HOURLY_RESTRICTIONS          = 0x00000015,
    WPC_SETTINGS_USER_OVERRRIDE_REQUESTS           = 0x00000016,
    WPC_SETTINGS_USER_LOGON_HOURS                  = 0x00000017,
    WPC_SETTINGS_USER_APP_RESTRICTIONS             = 0x00000018,
    WPC_SETTINGS_WEB_FILTER_ON                     = 0x00000019,
    WPC_SETTINGS_WEB_DOWNLOAD_BLOCKED              = 0x0000001a,
    WPC_SETTINGS_WEB_FILTER_LEVEL                  = 0x0000001b,
    WPC_SETTINGS_WEB_BLOCKED_CATEGORY_LIST         = 0x0000001c,
    WPC_SETTINGS_WEB_BLOCK_UNRATED                 = 0x0000001d,
    WPC_SETTINGS_WPC_ENABLED                       = 0x0000001e,
    WPC_SETTINGS_WPC_LOGGING_REQUIRED              = 0x0000001f,
    WPC_SETTINGS_RATING_SYSTEM_PATH                = 0x00000020,
    WPC_SETTINGS_WPC_PROVIDER_CURRENT              = 0x00000021,
    WPC_SETTINGS_USER_TIME_ALLOWANCE               = 0x00000022,
    WPC_SETTINGS_USER_TIME_ALLOWANCE_RESTRICTIONS  = 0x00000023,
    WPC_SETTINGS_GAME_RESTRICTED                   = 0x00000024,
    WPC_SETTING_COUNT                              = 0x00000025,
}

