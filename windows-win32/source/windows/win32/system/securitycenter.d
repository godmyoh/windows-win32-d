module windows.win32.system.securitycenter;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE, HRESULT, PWSTR;
import windows.win32.system.com : IDispatch;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE;

version (Windows):
extern (Windows):

alias WSC_SECURITY_PRODUCT_SUBSTATUS = int;
enum : int
{
    WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET            = 0x00000000,
    WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION          = 0x00000001,
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED = 0x00000002,
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED      = 0x00000003,
}

alias WSC_SECURITY_PRODUCT_STATE = int;
enum : int
{
    WSC_SECURITY_PRODUCT_STATE_ON      = 0x00000000,
    WSC_SECURITY_PRODUCT_STATE_OFF     = 0x00000001,
    WSC_SECURITY_PRODUCT_STATE_SNOOZED = 0x00000002,
    WSC_SECURITY_PRODUCT_STATE_EXPIRED = 0x00000003,
}

alias SECURITY_PRODUCT_TYPE = int;
enum : int
{
    SECURITY_PRODUCT_TYPE_ANTIVIRUS   = 0x00000000,
    SECURITY_PRODUCT_TYPE_FIREWALL    = 0x00000001,
    SECURITY_PRODUCT_TYPE_ANTISPYWARE = 0x00000002,
}

alias WSC_SECURITY_SIGNATURE_STATUS = int;
enum : int
{
    WSC_SECURITY_PRODUCT_OUT_OF_DATE = 0x00000000,
    WSC_SECURITY_PRODUCT_UP_TO_DATE  = 0x00000001,
}

enum IID_IWscProduct = GUID(0x8c38232e, 0x3a45, 0x4a27, [0x92, 0xb0, 0x1a, 0x16, 0xa9, 0x75, 0xf6, 0x69]);
interface IWscProduct : IDispatch
{
    HRESULT get_ProductName(BSTR*);
    HRESULT get_ProductState(WSC_SECURITY_PRODUCT_STATE*);
    HRESULT get_SignatureStatus(WSC_SECURITY_SIGNATURE_STATUS*);
    HRESULT get_RemediationPath(BSTR*);
    HRESULT get_ProductStateTimestamp(BSTR*);
    HRESULT get_ProductGuid(BSTR*);
    HRESULT get_ProductIsDefault(BOOL*);
}
enum IID_IWscProduct2 = GUID(0xf896ca54, 0xfe09, 0x4403, [0x86, 0xd4, 0x23, 0xcb, 0x48, 0x8d, 0x81, 0xd8]);
interface IWscProduct2 : IWscProduct
{
    HRESULT get_AntivirusScanSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
    HRESULT get_AntivirusSettingsSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
    HRESULT get_AntivirusProtectionUpdateSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
    HRESULT get_FirewallDomainProfileSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
    HRESULT get_FirewallPrivateProfileSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
    HRESULT get_FirewallPublicProfileSubstatus(WSC_SECURITY_PRODUCT_SUBSTATUS*);
}
enum IID_IWscProduct3 = GUID(0x55536524, 0xd1d1, 0x4726, [0x8c, 0x7c, 0x4, 0x99, 0x6a, 0x19, 0x4, 0xe7]);
interface IWscProduct3 : IWscProduct2
{
    HRESULT get_AntivirusDaysUntilExpired(uint*);
}
enum IID_IWSCProductList = GUID(0x722a338c, 0x6e8e, 0x4e72, [0xac, 0x27, 0x14, 0x17, 0xfb, 0xc, 0x81, 0xc2]);
interface IWSCProductList : IDispatch
{
    HRESULT Initialize(uint);
    HRESULT get_Count(int*);
    HRESULT get_Item(uint, IWscProduct*);
}
enum IID_IWSCDefaultProduct = GUID(0x476d69c, 0xf21a, 0x11e5, [0x9c, 0xe9, 0x5e, 0x55, 0x17, 0x50, 0x7c, 0x66]);
interface IWSCDefaultProduct : IDispatch
{
    HRESULT SetDefaultProduct(SECURITY_PRODUCT_TYPE, BSTR);
}
enum CLSID_WSCProductList = GUID(0x17072f7b, 0x9abe, 0x4a74, [0xa2, 0x61, 0x1e, 0xb7, 0x6b, 0x55, 0x10, 0x7a]);
struct WSCProductList
{
}
enum CLSID_WSCDefaultProduct = GUID(0x2981a36e, 0xf22d, 0x11e5, [0x9c, 0xe9, 0x5e, 0x55, 0x17, 0x50, 0x7c, 0x66]);
struct WSCDefaultProduct
{
}
alias WSC_SECURITY_PROVIDER = int;
enum : int
{
    WSC_SECURITY_PROVIDER_FIREWALL             = 0x00000001,
    WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS  = 0x00000002,
    WSC_SECURITY_PROVIDER_ANTIVIRUS            = 0x00000004,
    WSC_SECURITY_PROVIDER_ANTISPYWARE          = 0x00000008,
    WSC_SECURITY_PROVIDER_INTERNET_SETTINGS    = 0x00000010,
    WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL = 0x00000020,
    WSC_SECURITY_PROVIDER_SERVICE              = 0x00000040,
    WSC_SECURITY_PROVIDER_NONE                 = 0x00000000,
    WSC_SECURITY_PROVIDER_ALL                  = 0x0000007f,
}

alias WSC_SECURITY_PROVIDER_HEALTH = int;
enum : int
{
    WSC_SECURITY_PROVIDER_HEALTH_GOOD         = 0x00000000,
    WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED = 0x00000001,
    WSC_SECURITY_PROVIDER_HEALTH_POOR         = 0x00000002,
    WSC_SECURITY_PROVIDER_HEALTH_SNOOZE       = 0x00000003,
}

HRESULT WscRegisterForChanges(void*, HANDLE*, LPTHREAD_START_ROUTINE, void*);
HRESULT WscUnRegisterChanges(HANDLE);
HRESULT WscRegisterForUserNotifications();
HRESULT WscGetSecurityProviderHealth(uint, WSC_SECURITY_PROVIDER_HEALTH*);
HRESULT WscQueryAntiMalwareUri();
HRESULT WscGetAntiMalwareUri(PWSTR*);
