module windows.win32.security.authentication.identity.provider;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, HWND, PWSTR;
import windows.win32.system.com_ : IBindCtx, IEnumUnknown, IUnknown, VARIANT;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : IPropertyStore, PROPERTYKEY;

version (Windows):
extern (Windows):

enum IDENTITY_KEYWORD_ASSOCIATED = "associated";
enum IDENTITY_KEYWORD_LOCAL = "local";
enum IDENTITY_KEYWORD_HOMEGROUP = "homegroup";
enum IDENTITY_KEYWORD_CONNECTED = "connected";
enum OID_OAssociatedIdentityProviderObject = GUID(0x98c5a3dd, 0xdb68, 0x4f1a, [0x8d, 0x2b, 0x90, 0x79, 0xcd, 0xfe, 0xaf, 0x61]);
enum STR_OUT_OF_BOX_EXPERIENCE = "OutOfBoxExperience";
enum STR_MODERN_SETTINGS_ADD_USER = "ModernSettingsAddUser";
enum STR_OUT_OF_BOX_UPGRADE_EXPERIENCE = "OutOfBoxUpgradeExperience";
enum STR_COMPLETE_ACCOUNT = "CompleteAccount";
enum STR_NTH_USER_FIRST_AUTH = "NthUserFirstAuth";
enum STR_USER_NAME = "Username";
enum STR_PROPERTY_STORE = "PropertyStore";
alias IDENTITY_TYPE = int;
enum : int
{
    IDENTITIES_ALL     = 0x00000000,
    IDENTITIES_ME_ONLY = 0x00000001,
}

alias IdentityUpdateEvent = uint;
enum : uint
{
    IDENTITY_ASSOCIATED    = 0x00000001,
    IDENTITY_DISASSOCIATED = 0x00000002,
    IDENTITY_CREATED       = 0x00000004,
    IDENTITY_IMPORTED      = 0x00000008,
    IDENTITY_DELETED       = 0x00000010,
    IDENTITY_PROPCHANGED   = 0x00000020,
    IDENTITY_CONNECTED     = 0x00000040,
    IDENTITY_DISCONNECTED  = 0x00000080,
}

enum IID_IIdentityAdvise = GUID(0x4e982fed, 0xd14b, 0x440c, [0xb8, 0xd6, 0xbb, 0x38, 0x64, 0x53, 0xd3, 0x86]);
interface IIdentityAdvise : IUnknown
{
    HRESULT IdentityUpdated(IdentityUpdateEvent, const(wchar)*);
}
enum IID_AsyncIIdentityAdvise = GUID(0x3ab4c8da, 0xd038, 0x4830, [0x8d, 0xd9, 0x32, 0x53, 0xc5, 0x5a, 0x12, 0x7f]);
interface AsyncIIdentityAdvise : IUnknown
{
    HRESULT Begin_IdentityUpdated(uint, const(wchar)*);
    HRESULT Finish_IdentityUpdated();
}
enum IID_IIdentityProvider = GUID(0xd1b9e0c, 0xe8ba, 0x4f55, [0xa8, 0x1b, 0xbc, 0xe9, 0x34, 0xb9, 0x48, 0xf5]);
interface IIdentityProvider : IUnknown
{
    HRESULT GetIdentityEnum(const(IDENTITY_TYPE), const(PROPERTYKEY)*, const(PROPVARIANT)*, IEnumUnknown*);
    HRESULT Create(const(wchar)*, IPropertyStore*, const(PROPVARIANT)*);
    HRESULT Import(IPropertyStore);
    HRESULT Delete(const(wchar)*, const(PROPVARIANT)*);
    HRESULT FindByUniqueID(const(wchar)*, IPropertyStore*);
    HRESULT GetProviderPropertyStore(IPropertyStore*);
    HRESULT Advise(IIdentityAdvise, IdentityUpdateEvent, uint*);
    HRESULT UnAdvise(const(uint));
}
enum IID_AsyncIIdentityProvider = GUID(0xc6fc9901, 0xc433, 0x4646, [0x8f, 0x48, 0x4e, 0x46, 0x87, 0xaa, 0xe2, 0xa0]);
interface AsyncIIdentityProvider : IUnknown
{
    HRESULT Begin_GetIdentityEnum(const(IDENTITY_TYPE), const(PROPERTYKEY)*, const(PROPVARIANT)*);
    HRESULT Finish_GetIdentityEnum(IEnumUnknown*);
    HRESULT Begin_Create(const(wchar)*, const(PROPVARIANT)*);
    HRESULT Finish_Create(IPropertyStore*);
    HRESULT Begin_Import(IPropertyStore);
    HRESULT Finish_Import();
    HRESULT Begin_Delete(const(wchar)*, const(PROPVARIANT)*);
    HRESULT Finish_Delete();
    HRESULT Begin_FindByUniqueID(const(wchar)*);
    HRESULT Finish_FindByUniqueID(IPropertyStore*);
    HRESULT Begin_GetProviderPropertyStore();
    HRESULT Finish_GetProviderPropertyStore(IPropertyStore*);
    HRESULT Begin_Advise(IIdentityAdvise, uint);
    HRESULT Finish_Advise(uint*);
    HRESULT Begin_UnAdvise(const(uint));
    HRESULT Finish_UnAdvise();
}
enum IID_IAssociatedIdentityProvider = GUID(0x2af066b3, 0x4cbb, 0x4cba, [0xa7, 0x98, 0x20, 0x4b, 0x6a, 0xf6, 0x8c, 0xc0]);
interface IAssociatedIdentityProvider : IUnknown
{
    HRESULT AssociateIdentity(HWND, IPropertyStore*);
    HRESULT DisassociateIdentity(HWND, const(wchar)*);
    HRESULT ChangeCredential(HWND, const(wchar)*);
}
enum IID_AsyncIAssociatedIdentityProvider = GUID(0x2834d6ed, 0x297e, 0x4e72, [0x8a, 0x51, 0x96, 0x1e, 0x86, 0xf0, 0x51, 0x52]);
interface AsyncIAssociatedIdentityProvider : IUnknown
{
    HRESULT Begin_AssociateIdentity(HWND);
    HRESULT Finish_AssociateIdentity(IPropertyStore*);
    HRESULT Begin_DisassociateIdentity(HWND, const(wchar)*);
    HRESULT Finish_DisassociateIdentity();
    HRESULT Begin_ChangeCredential(HWND, const(wchar)*);
    HRESULT Finish_ChangeCredential();
}
alias IDENTITY_URL = int;
enum : int
{
    IDENTITY_URL_CREATE_ACCOUNT_WIZARD  = 0x00000000,
    IDENTITY_URL_SIGN_IN_WIZARD         = 0x00000001,
    IDENTITY_URL_CHANGE_PASSWORD_WIZARD = 0x00000002,
    IDENTITY_URL_IFEXISTS_WIZARD        = 0x00000003,
    IDENTITY_URL_ACCOUNT_SETTINGS       = 0x00000004,
    IDENTITY_URL_RESTORE_WIZARD         = 0x00000005,
    IDENTITY_URL_CONNECT_WIZARD         = 0x00000006,
}

alias ACCOUNT_STATE = int;
enum : int
{
    NOT_CONNECTED     = 0x00000000,
    CONNECTING        = 0x00000001,
    CONNECT_COMPLETED = 0x00000002,
}

enum IID_IConnectedIdentityProvider = GUID(0xb7417b54, 0xe08c, 0x429b, [0x96, 0xc8, 0x67, 0x8d, 0x13, 0x69, 0xec, 0xb1]);
interface IConnectedIdentityProvider : IUnknown
{
    HRESULT ConnectIdentity(ubyte*, uint);
    HRESULT DisconnectIdentity();
    HRESULT IsConnected(BOOL*);
    HRESULT GetUrl(IDENTITY_URL, IBindCtx, VARIANT*, PWSTR*);
    HRESULT GetAccountState(ACCOUNT_STATE*);
}
enum IID_AsyncIConnectedIdentityProvider = GUID(0x9ce55141, 0xbce9, 0x4e15, [0x82, 0x4d, 0x43, 0xd7, 0x9f, 0x51, 0x2f, 0x93]);
interface AsyncIConnectedIdentityProvider : IUnknown
{
    HRESULT Begin_ConnectIdentity(ubyte*, uint);
    HRESULT Finish_ConnectIdentity();
    HRESULT Begin_DisconnectIdentity();
    HRESULT Finish_DisconnectIdentity();
    HRESULT Begin_IsConnected();
    HRESULT Finish_IsConnected(BOOL*);
    HRESULT Begin_GetUrl(IDENTITY_URL, IBindCtx);
    HRESULT Finish_GetUrl(VARIANT*, PWSTR*);
    HRESULT Begin_GetAccountState();
    HRESULT Finish_GetAccountState(ACCOUNT_STATE*);
}
enum IID_IIdentityAuthentication = GUID(0x5e7ef254, 0x979f, 0x43b5, [0xb7, 0x4e, 0x6, 0xe4, 0xeb, 0x7d, 0xf0, 0xf9]);
interface IIdentityAuthentication : IUnknown
{
    HRESULT SetIdentityCredential(ubyte*, uint);
    HRESULT ValidateIdentityCredential(ubyte*, uint, IPropertyStore*);
}
enum IID_AsyncIIdentityAuthentication = GUID(0xf9a2f918, 0xfeca, 0x4e9c, [0x96, 0x33, 0x61, 0xcb, 0xf1, 0x3e, 0xd3, 0x4d]);
interface AsyncIIdentityAuthentication : IUnknown
{
    HRESULT Begin_SetIdentityCredential(ubyte*, uint);
    HRESULT Finish_SetIdentityCredential();
    HRESULT Begin_ValidateIdentityCredential(ubyte*, uint, IPropertyStore*);
    HRESULT Finish_ValidateIdentityCredential(IPropertyStore*);
}
enum CLSID_CoClassIdentityStore = GUID(0x30d49246, 0xd217, 0x465f, [0xb0, 0xb, 0xac, 0x9d, 0xdd, 0x65, 0x2e, 0xb7]);
struct CoClassIdentityStore
{
}
enum CLSID_CIdentityProfileHandler = GUID(0xecf5bf46, 0xe3b6, 0x449a, [0xb5, 0x6b, 0x43, 0xf5, 0x8f, 0x86, 0x78, 0x14]);
struct CIdentityProfileHandler
{
}
enum IID_IIdentityStore = GUID(0xdf586fa5, 0x6f35, 0x44f1, [0xb2, 0x9, 0xb3, 0x8e, 0x16, 0x97, 0x72, 0xeb]);
interface IIdentityStore : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(const(uint), GUID*, IUnknown*);
    HRESULT AddToCache(const(wchar)*, const(GUID)*);
    HRESULT ConvertToSid(const(wchar)*, const(GUID)*, ushort, ubyte*, ushort*);
    HRESULT EnumerateIdentities(const(IDENTITY_TYPE), const(PROPERTYKEY)*, const(PROPVARIANT)*, IEnumUnknown*);
    HRESULT Reset();
}
enum IID_AsyncIIdentityStore = GUID(0xeefa1616, 0x48de, 0x4872, [0xaa, 0x64, 0x6e, 0x62, 0x6, 0x53, 0x5a, 0x51]);
interface AsyncIIdentityStore : IUnknown
{
    HRESULT Begin_GetCount();
    HRESULT Finish_GetCount(uint*);
    HRESULT Begin_GetAt(const(uint), GUID*);
    HRESULT Finish_GetAt(GUID*, IUnknown*);
    HRESULT Begin_AddToCache(const(wchar)*, const(GUID)*);
    HRESULT Finish_AddToCache();
    HRESULT Begin_ConvertToSid(const(wchar)*, const(GUID)*, ushort, ubyte*);
    HRESULT Finish_ConvertToSid(ubyte*, ushort*);
    HRESULT Begin_EnumerateIdentities(const(IDENTITY_TYPE), const(PROPERTYKEY)*, const(PROPVARIANT)*);
    HRESULT Finish_EnumerateIdentities(IEnumUnknown*);
    HRESULT Begin_Reset();
    HRESULT Finish_Reset();
}
enum IID_IIdentityStoreEx = GUID(0xf9f9eb98, 0x8f7f, 0x4e38, [0x95, 0x77, 0x69, 0x80, 0x11, 0x4c, 0xe3, 0x2b]);
interface IIdentityStoreEx : IUnknown
{
    HRESULT CreateConnectedIdentity(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT DeleteConnectedIdentity(const(wchar)*, const(GUID)*);
}
enum IID_AsyncIIdentityStoreEx = GUID(0xfca3af9a, 0x8a07, 0x4eae, [0x86, 0x32, 0xec, 0x3d, 0xe6, 0x58, 0xa3, 0x6a]);
interface AsyncIIdentityStoreEx : IUnknown
{
    HRESULT Begin_CreateConnectedIdentity(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT Finish_CreateConnectedIdentity();
    HRESULT Begin_DeleteConnectedIdentity(const(wchar)*, const(GUID)*);
    HRESULT Finish_DeleteConnectedIdentity();
}
