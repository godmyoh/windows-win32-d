module windows.win32.gaming;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.winrt_ : HSTRING, IInspectable;

version (Windows):
extern (Windows):

HRESULT HasExpandedResources(BOOL*);
HRESULT GetExpandedResourceExclusiveCpuCount(uint*);
HRESULT ReleaseExclusiveCpuSets();
HRESULT GetGamingDeviceModelInformation(GAMING_DEVICE_MODEL_INFORMATION*);
HRESULT ShowGameInviteUI(HSTRING, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowPlayerPickerUI(HSTRING, const(HSTRING)*, ulong, const(HSTRING)*, ulong, ulong, ulong, PlayerPickerUICompletionRoutine, void*);
HRESULT ShowProfileCardUI(HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowChangeFriendRelationshipUI(HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowTitleAchievementsUI(uint, GameUICompletionRoutine, void*);
HRESULT ProcessPendingGameUI(BOOL);
BOOL TryCancelPendingGameUI();
HRESULT CheckGamingPrivilegeWithUI(uint, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT CheckGamingPrivilegeSilently(uint, HSTRING, HSTRING, BOOL*);
HRESULT ShowGameInviteUIForUser(IInspectable, HSTRING, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowPlayerPickerUIForUser(IInspectable, HSTRING, const(HSTRING)*, ulong, const(HSTRING)*, ulong, ulong, ulong, PlayerPickerUICompletionRoutine, void*);
HRESULT ShowProfileCardUIForUser(IInspectable, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowChangeFriendRelationshipUIForUser(IInspectable, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowTitleAchievementsUIForUser(IInspectable, uint, GameUICompletionRoutine, void*);
HRESULT CheckGamingPrivilegeWithUIForUser(IInspectable, uint, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT CheckGamingPrivilegeSilentlyForUser(IInspectable, uint, HSTRING, HSTRING, BOOL*);
HRESULT ShowGameInviteUIWithContext(HSTRING, HSTRING, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowGameInviteUIWithContextForUser(IInspectable, HSTRING, HSTRING, HSTRING, HSTRING, HSTRING, GameUICompletionRoutine, void*);
HRESULT ShowGameInfoUI(uint, GameUICompletionRoutine, void*);
HRESULT ShowGameInfoUIForUser(IInspectable, uint, GameUICompletionRoutine, void*);
HRESULT ShowFindFriendsUI(GameUICompletionRoutine, void*);
HRESULT ShowFindFriendsUIForUser(IInspectable, GameUICompletionRoutine, void*);
HRESULT ShowCustomizeUserProfileUI(GameUICompletionRoutine, void*);
HRESULT ShowCustomizeUserProfileUIForUser(IInspectable, GameUICompletionRoutine, void*);
HRESULT ShowUserSettingsUI(GameUICompletionRoutine, void*);
HRESULT ShowUserSettingsUIForUser(IInspectable, GameUICompletionRoutine, void*);
enum ID_GDF_XML_STR = "__GDF_XML";
enum ID_GDF_THUMBNAIL_STR = "__GDF_THUMBNAIL";
enum CLSID_GameExplorer = GUID(0x9a5ea990, 0x3034, 0x4d6f, [0x91, 0x28, 0x1, 0xf3, 0xc6, 0x10, 0x22, 0xbc]);
struct GameExplorer
{
}
enum CLSID_GameStatistics = GUID(0xdbc85a2c, 0xc0dc, 0x4961, [0xb6, 0xe2, 0xd2, 0x8b, 0x62, 0xc1, 0x1a, 0xd4]);
struct GameStatistics
{
}
alias GAME_INSTALL_SCOPE = int;
enum : int
{
    GIS_NOT_INSTALLED = 0x00000001,
    GIS_CURRENT_USER  = 0x00000002,
    GIS_ALL_USERS     = 0x00000003,
}

enum IID_IGameExplorer = GUID(0xe7b2fb72, 0xd728, 0x49b3, [0xa5, 0xf2, 0x18, 0xeb, 0xf5, 0xf1, 0x34, 0x9e]);
interface IGameExplorer : IUnknown
{
    HRESULT AddGame(BSTR, BSTR, GAME_INSTALL_SCOPE, GUID*);
    HRESULT RemoveGame(GUID);
    HRESULT UpdateGame(GUID);
    HRESULT VerifyAccess(BSTR, BOOL*);
}
alias GAMESTATS_OPEN_TYPE = int;
enum : int
{
    GAMESTATS_OPEN_OPENORCREATE = 0x00000000,
    GAMESTATS_OPEN_OPENONLY     = 0x00000001,
}

alias GAMESTATS_OPEN_RESULT = int;
enum : int
{
    GAMESTATS_OPEN_CREATED = 0x00000000,
    GAMESTATS_OPEN_OPENED  = 0x00000001,
}

enum IID_IGameStatistics = GUID(0x3887c9ca, 0x4a0, 0x42ae, [0xbc, 0x4c, 0x5f, 0xa6, 0xc7, 0x72, 0x11, 0x45]);
interface IGameStatistics : IUnknown
{
    HRESULT GetMaxCategoryLength(uint*);
    HRESULT GetMaxNameLength(uint*);
    HRESULT GetMaxValueLength(uint*);
    HRESULT GetMaxCategories(ushort*);
    HRESULT GetMaxStatsPerCategory(ushort*);
    HRESULT SetCategoryTitle(ushort, const(wchar)*);
    HRESULT GetCategoryTitle(ushort, PWSTR*);
    HRESULT GetStatistic(ushort, ushort, PWSTR*, PWSTR*);
    HRESULT SetStatistic(ushort, ushort, const(wchar)*, const(wchar)*);
    HRESULT Save(BOOL);
    HRESULT SetLastPlayedCategory(uint);
    HRESULT GetLastPlayedCategory(uint*);
}
enum IID_IGameStatisticsMgr = GUID(0xaff3ea11, 0xe70e, 0x407d, [0x95, 0xdd, 0x35, 0xe6, 0x12, 0xc4, 0x1c, 0xe2]);
interface IGameStatisticsMgr : IUnknown
{
    HRESULT GetGameStatistics(const(wchar)*, GAMESTATS_OPEN_TYPE, GAMESTATS_OPEN_RESULT*, IGameStatistics*);
    HRESULT RemoveGameStatistics(const(wchar)*);
}
enum IID_IGameExplorer2 = GUID(0x86874aa7, 0xa1ed, 0x450d, [0xa7, 0xeb, 0xb8, 0x9e, 0x20, 0xb2, 0xff, 0xf3]);
interface IGameExplorer2 : IUnknown
{
    HRESULT InstallGame(const(wchar)*, const(wchar)*, GAME_INSTALL_SCOPE);
    HRESULT UninstallGame(const(wchar)*);
    HRESULT CheckAccess(const(wchar)*, BOOL*);
}
alias GAMING_DEVICE_VENDOR_ID = int;
enum : int
{
    GAMING_DEVICE_VENDOR_ID_NONE      = 0x00000000,
    GAMING_DEVICE_VENDOR_ID_MICROSOFT = 0xc2ec5032,
}

alias GAMING_DEVICE_DEVICE_ID = int;
enum : int
{
    GAMING_DEVICE_DEVICE_ID_NONE              = 0x00000000,
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE          = 0x768bae26,
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S        = 0x2a7361d9,
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X        = 0x5ad617c7,
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT = 0x10f7cde3,
}

struct GAMING_DEVICE_MODEL_INFORMATION
{
    GAMING_DEVICE_VENDOR_ID vendorId;
    GAMING_DEVICE_DEVICE_ID deviceId;
}
alias GameUICompletionRoutine = void function(HRESULT, void*);
alias PlayerPickerUICompletionRoutine = void function(HRESULT, void*, const(HSTRING)*, ulong);
alias KnownGamingPrivileges = int;
enum : int
{
    XPRIVILEGE_BROADCAST                   = 0x000000be,
    XPRIVILEGE_VIEW_FRIENDS_LIST           = 0x000000c5,
    XPRIVILEGE_GAME_DVR                    = 0x000000c6,
    XPRIVILEGE_SHARE_KINECT_CONTENT        = 0x000000c7,
    XPRIVILEGE_MULTIPLAYER_PARTIES         = 0x000000cb,
    XPRIVILEGE_COMMUNICATION_VOICE_INGAME  = 0x000000cd,
    XPRIVILEGE_COMMUNICATION_VOICE_SKYPE   = 0x000000ce,
    XPRIVILEGE_CLOUD_GAMING_MANAGE_SESSION = 0x000000cf,
    XPRIVILEGE_CLOUD_GAMING_JOIN_SESSION   = 0x000000d0,
    XPRIVILEGE_CLOUD_SAVED_GAMES           = 0x000000d1,
    XPRIVILEGE_SHARE_CONTENT               = 0x000000d3,
    XPRIVILEGE_PREMIUM_CONTENT             = 0x000000d6,
    XPRIVILEGE_SUBSCRIPTION_CONTENT        = 0x000000db,
    XPRIVILEGE_SOCIAL_NETWORK_SHARING      = 0x000000dc,
    XPRIVILEGE_PREMIUM_VIDEO               = 0x000000e0,
    XPRIVILEGE_VIDEO_COMMUNICATIONS        = 0x000000eb,
    XPRIVILEGE_PURCHASE_CONTENT            = 0x000000f5,
    XPRIVILEGE_USER_CREATED_CONTENT        = 0x000000f7,
    XPRIVILEGE_PROFILE_VIEWING             = 0x000000f9,
    XPRIVILEGE_COMMUNICATIONS              = 0x000000fc,
    XPRIVILEGE_MULTIPLAYER_SESSIONS        = 0x000000fe,
    XPRIVILEGE_ADD_FRIEND                  = 0x000000ff,
}

enum CLSID_XblIdpAuthManager = GUID(0xce23534b, 0x56d8, 0x4978, [0x86, 0xa2, 0x7e, 0xe5, 0x70, 0x64, 0x4, 0x68]);
struct XblIdpAuthManager
{
}
enum CLSID_XblIdpAuthTokenResult = GUID(0x9f493441, 0x744a, 0x410c, [0xae, 0x2b, 0x9a, 0x22, 0xf7, 0xc7, 0x73, 0x1f]);
struct XblIdpAuthTokenResult
{
}
alias XBL_IDP_AUTH_TOKEN_STATUS = int;
enum : int
{
    XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS                 = 0x00000000,
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS         = 0x00000001,
    XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET          = 0x00000002,
    XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED = 0x00000003,
    XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO               = 0x00000004,
    XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT           = 0x00000005,
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT      = 0x00000006,
    XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET            = 0x00000007,
    XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN                 = 0xffffffff,
}

enum IID_IXblIdpAuthManager = GUID(0xeb5ddb08, 0x8bbf, 0x449b, [0xac, 0x21, 0xb0, 0x2d, 0xde, 0xb3, 0xb1, 0x36]);
interface IXblIdpAuthManager : IUnknown
{
    HRESULT SetGamerAccount(const(wchar)*, const(wchar)*);
    HRESULT GetGamerAccount(PWSTR*, PWSTR*);
    HRESULT SetAppViewInitialized(const(wchar)*, const(wchar)*);
    HRESULT GetEnvironment(PWSTR*);
    HRESULT GetSandbox(PWSTR*);
    HRESULT GetTokenAndSignatureWithTokenResult(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, ubyte*, uint, BOOL, IXblIdpAuthTokenResult*);
}
enum IID_IXblIdpAuthTokenResult = GUID(0x46ce0225, 0xf267, 0x4d68, [0xb2, 0x99, 0xb2, 0x76, 0x25, 0x52, 0xde, 0xc1]);
interface IXblIdpAuthTokenResult : IUnknown
{
    HRESULT GetStatus(XBL_IDP_AUTH_TOKEN_STATUS*);
    HRESULT GetErrorCode(HRESULT*);
    HRESULT GetToken(PWSTR*);
    HRESULT GetSignature(PWSTR*);
    HRESULT GetSandbox(PWSTR*);
    HRESULT GetEnvironment(PWSTR*);
    HRESULT GetMsaAccountId(PWSTR*);
    HRESULT GetXuid(PWSTR*);
    HRESULT GetGamertag(PWSTR*);
    HRESULT GetAgeGroup(PWSTR*);
    HRESULT GetPrivileges(PWSTR*);
    HRESULT GetMsaTarget(PWSTR*);
    HRESULT GetMsaPolicy(PWSTR*);
    HRESULT GetMsaAppId(PWSTR*);
    HRESULT GetRedirect(PWSTR*);
    HRESULT GetMessage(PWSTR*);
    HRESULT GetHelpId(PWSTR*);
    HRESULT GetEnforcementBans(PWSTR*);
    HRESULT GetRestrictions(PWSTR*);
    HRESULT GetTitleRestrictions(PWSTR*);
}
enum IID_IXblIdpAuthTokenResult2 = GUID(0x75d760b0, 0x60b9, 0x412d, [0x99, 0x4f, 0x26, 0xb2, 0xcd, 0x5f, 0x78, 0x12]);
interface IXblIdpAuthTokenResult2 : IUnknown
{
    HRESULT GetModernGamertag(PWSTR*);
    HRESULT GetModernGamertagSuffix(PWSTR*);
    HRESULT GetUniqueModernGamertag(PWSTR*);
}
