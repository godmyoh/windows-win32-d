module windows.win32.security.authorization.ui;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HINSTANCE, HRESULT, HWND, PSID, PWSTR;
import windows.win32.security_ : ACE_FLAGS, ACL, OBJECT_SECURITY_INFORMATION, OBJECT_TYPE_LIST, PSECURITY_DESCRIPTOR, TOKEN_GROUPS;
import windows.win32.security.authorization_ : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION, AUTHZ_SECURITY_ATTRIBUTE_OPERATION, AUTHZ_SID_OPERATION, INHERITED_FROMA;
import windows.win32.system.com_ : IDataObject, IUnknown;
import windows.win32.ui.controls_ : HPROPSHEETPAGE, PSPCB_MESSAGE;

version (Windows):
extern (Windows):

alias SECURITY_INFO_PAGE_FLAGS = uint;
enum : uint
{
    SI_ADVANCED        = 0x00000010,
    SI_EDIT_AUDITS     = 0x00000002,
    SI_EDIT_PROPERTIES = 0x00000080,
}

alias SI_OBJECT_INFO_FLAGS = uint;
enum : uint
{
    SI_AUDITS_ELEVATION_REQUIRED       = 0x02000000,
    SI_DISABLE_DENY_ACE                = 0x80000000,
    SI_EDIT_EFFECTIVE                  = 0x00020000,
    SI_ENABLE_CENTRAL_POLICY           = 0x40000000,
    SI_ENABLE_EDIT_ATTRIBUTE_CONDITION = 0x20000000,
    SI_MAY_WRITE                       = 0x10000000,
    SI_NO_ADDITIONAL_PERMISSION        = 0x00200000,
    SI_OWNER_ELEVATION_REQUIRED        = 0x04000000,
    SI_PERMS_ELEVATION_REQUIRED        = 0x01000000,
    SI_RESET_DACL                      = 0x00040000,
    SI_RESET_OWNER                     = 0x00100000,
    SI_RESET_SACL                      = 0x00080000,
    SI_SCOPE_ELEVATION_REQUIRED        = 0x08000000,
    SI_VIEW_ONLY                       = 0x00400000,
}

HPROPSHEETPAGE CreateSecurityPage(ISecurityInformation);
BOOL EditSecurity(HWND, ISecurityInformation);
HRESULT EditSecurityAdvanced(HWND, ISecurityInformation, SI_PAGE_TYPE);
enum SI_EDIT_PERMS = 0x00000000;
enum SI_EDIT_OWNER = 0x00000001;
enum SI_CONTAINER = 0x00000004;
enum SI_READONLY = 0x00000008;
enum SI_RESET = 0x00000020;
enum SI_OWNER_READONLY = 0x00000040;
enum SI_OWNER_RECURSE = 0x00000100;
enum SI_NO_ACL_PROTECT = 0x00000200;
enum SI_NO_TREE_APPLY = 0x00000400;
enum SI_PAGE_TITLE = 0x00000800;
enum SI_SERVER_IS_DC = 0x00001000;
enum SI_RESET_DACL_TREE = 0x00004000;
enum SI_RESET_SACL_TREE = 0x00008000;
enum SI_OBJECT_GUID = 0x00010000;
enum SI_ACCESS_SPECIFIC = 0x00010000;
enum SI_ACCESS_GENERAL = 0x00020000;
enum SI_ACCESS_CONTAINER = 0x00040000;
enum SI_ACCESS_PROPERTY = 0x00080000;
enum DOBJ_RES_CONT = 0x00000001;
enum DOBJ_RES_ROOT = 0x00000002;
enum DOBJ_VOL_NTACLS = 0x00000004;
enum DOBJ_COND_NTACLS = 0x00000008;
enum DOBJ_RIBBON_LAUNCH = 0x00000010;
enum CFSTR_ACLUI_SID_INFO_LIST = "CFSTR_ACLUI_SID_INFO_LIST";
enum SECURITY_OBJECT_ID_OBJECT_SD = 0x00000001;
enum SECURITY_OBJECT_ID_SHARE = 0x00000002;
enum SECURITY_OBJECT_ID_CENTRAL_POLICY = 0x00000003;
enum SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE = 0x00000004;
struct SI_OBJECT_INFO
{
    SI_OBJECT_INFO_FLAGS dwFlags;
    HINSTANCE hInstance;
    PWSTR pszServerName;
    PWSTR pszObjectName;
    PWSTR pszPageTitle;
    GUID guidObjectType;
}
struct SI_ACCESS
{
    const(GUID)* pguid;
    uint mask;
    const(wchar)* pszName;
    uint dwFlags;
}
struct SI_INHERIT_TYPE
{
    const(GUID)* pguid;
    ACE_FLAGS dwFlags;
    const(wchar)* pszName;
}
alias SI_PAGE_TYPE = int;
enum : int
{
    SI_PAGE_PERM          = 0x00000000,
    SI_PAGE_ADVPERM       = 0x00000001,
    SI_PAGE_AUDIT         = 0x00000002,
    SI_PAGE_OWNER         = 0x00000003,
    SI_PAGE_EFFECTIVE     = 0x00000004,
    SI_PAGE_TAKEOWNERSHIP = 0x00000005,
    SI_PAGE_SHARE         = 0x00000006,
}

alias SI_PAGE_ACTIVATED = int;
enum : int
{
    SI_SHOW_DEFAULT                  = 0x00000000,
    SI_SHOW_PERM_ACTIVATED           = 0x00000001,
    SI_SHOW_AUDIT_ACTIVATED          = 0x00000002,
    SI_SHOW_OWNER_ACTIVATED          = 0x00000003,
    SI_SHOW_EFFECTIVE_ACTIVATED      = 0x00000004,
    SI_SHOW_SHARE_ACTIVATED          = 0x00000005,
    SI_SHOW_CENTRAL_POLICY_ACTIVATED = 0x00000006,
}

enum IID_ISecurityInformation = GUID(0x965fc360, 0x16ff, 0x11d0, [0x91, 0xcb, 0x0, 0xaa, 0x0, 0xbb, 0xb7, 0x23]);
interface ISecurityInformation : IUnknown
{
    HRESULT GetObjectInformation(SI_OBJECT_INFO*);
    HRESULT GetSecurity(OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR*, BOOL);
    HRESULT SetSecurity(OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
    HRESULT GetAccessRights(const(GUID)*, SECURITY_INFO_PAGE_FLAGS, SI_ACCESS**, uint*, uint*);
    HRESULT MapGeneric(const(GUID)*, ubyte*, uint*);
    HRESULT GetInheritTypes(SI_INHERIT_TYPE**, uint*);
    HRESULT PropertySheetPageCallback(HWND, PSPCB_MESSAGE, SI_PAGE_TYPE);
}
enum IID_ISecurityInformation2 = GUID(0xc3ccfdb4, 0x6f88, 0x11d2, [0xa3, 0xce, 0x0, 0xc0, 0x4f, 0xb1, 0x78, 0x2a]);
interface ISecurityInformation2 : IUnknown
{
    BOOL IsDaclCanonical(ACL*);
    HRESULT LookupSids(uint, PSID*, IDataObject*);
}
struct SID_INFO
{
    PSID pSid;
    PWSTR pwzCommonName;
    PWSTR pwzClass;
    PWSTR pwzUPN;
}
struct SID_INFO_LIST
{
    uint cItems;
    SID_INFO[1] aSidInfo;
}
enum IID_IEffectivePermission = GUID(0x3853dc76, 0x9f35, 0x407c, [0x88, 0xa1, 0xd1, 0x93, 0x44, 0x36, 0x5f, 0xbc]);
interface IEffectivePermission : IUnknown
{
    HRESULT GetEffectivePermission(const(GUID)*, PSID, const(wchar)*, PSECURITY_DESCRIPTOR, OBJECT_TYPE_LIST**, uint*, uint**, uint*);
}
enum IID_ISecurityObjectTypeInfo = GUID(0xfc3066eb, 0x79ef, 0x444b, [0x91, 0x11, 0xd1, 0x8a, 0x75, 0xeb, 0xf2, 0xfa]);
interface ISecurityObjectTypeInfo : IUnknown
{
    HRESULT GetInheritSource(uint, ACL*, INHERITED_FROMA**);
}
enum IID_ISecurityInformation3 = GUID(0xe2cdc9cc, 0x31bd, 0x4f8f, [0x8c, 0x8b, 0xb6, 0x41, 0xaf, 0x51, 0x6a, 0x1a]);
interface ISecurityInformation3 : IUnknown
{
    HRESULT GetFullResourceName(PWSTR*);
    HRESULT OpenElevatedEditor(HWND, SI_PAGE_TYPE);
}
struct SECURITY_OBJECT
{
    PWSTR pwszName;
    void* pData;
    uint cbData;
    void* pData2;
    uint cbData2;
    uint Id;
    BOOLEAN fWellKnown;
}
struct EFFPERM_RESULT_LIST
{
    BOOLEAN fEvaluated;
    uint cObjectTypeListLength;
    OBJECT_TYPE_LIST* pObjectTypeList;
    uint* pGrantedAccessList;
}
enum IID_ISecurityInformation4 = GUID(0xea961070, 0xcd14, 0x4621, [0xac, 0xe4, 0xf6, 0x3c, 0x3, 0xe5, 0x83, 0xe4]);
interface ISecurityInformation4 : IUnknown
{
    HRESULT GetSecondarySecurity(SECURITY_OBJECT**, uint*);
}
enum IID_IEffectivePermission2 = GUID(0x941fabca, 0xdd47, 0x4fca, [0x90, 0xbb, 0xb0, 0xe1, 0x2, 0x55, 0xf2, 0xd]);
interface IEffectivePermission2 : IUnknown
{
    HRESULT ComputeEffectivePermissionWithSecondarySecurity(PSID, PSID, const(wchar)*, SECURITY_OBJECT*, uint, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, EFFPERM_RESULT_LIST*);
}
