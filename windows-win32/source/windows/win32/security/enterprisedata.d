module windows.win32.security.enterprisedata;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, NTSTATUS, PWSTR;
import windows.win32.storage.packaging.appx : PACKAGE_ID;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt : HSTRING, IInspectable;

version (Windows):
extern (Windows):

enum IID_IProtectionPolicyManagerInterop = GUID(0x4652651d, 0xc1fe, 0x4ba1, [0x9f, 0xa, 0xc0, 0xf5, 0x65, 0x96, 0xf7, 0x21]);
interface IProtectionPolicyManagerInterop : IInspectable
{
    HRESULT RequestAccessForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING targetIdentity, const(GUID)* riid, void** asyncOperation);
    HRESULT GetForWindow(HWND appWindow, const(GUID)* riid, void** result);
}
enum IID_IProtectionPolicyManagerInterop2 = GUID(0x157cfbe4, 0xa78d, 0x4156, [0xb3, 0x84, 0x61, 0xfd, 0xac, 0x41, 0xe6, 0x86]);
interface IProtectionPolicyManagerInterop2 : IInspectable
{
    HRESULT RequestAccessForAppWithWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING appPackageFamilyName, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessWithAuditingInfoForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING targetIdentity, IUnknown auditInfoUnk, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessWithMessageForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING targetIdentity, IUnknown auditInfoUnk, HSTRING messageFromApp, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessForAppWithAuditingInfoForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING appPackageFamilyName, IUnknown auditInfoUnk, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessForAppWithMessageForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING appPackageFamilyName, IUnknown auditInfoUnk, HSTRING messageFromApp, const(GUID)* riid, void** asyncOperation);
}
enum IID_IProtectionPolicyManagerInterop3 = GUID(0xc1c03933, 0xb398, 0x4d93, [0xb0, 0xfd, 0x29, 0x72, 0xad, 0xf8, 0x2, 0xc2]);
interface IProtectionPolicyManagerInterop3 : IInspectable
{
    HRESULT RequestAccessWithBehaviorForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING targetIdentity, IUnknown auditInfoUnk, HSTRING messageFromApp, uint behavior, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessForAppWithBehaviorForWindowAsync(HWND appWindow, HSTRING sourceIdentity, HSTRING appPackageFamilyName, IUnknown auditInfoUnk, HSTRING messageFromApp, uint behavior, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessToFilesForAppForWindowAsync(HWND appWindow, IUnknown sourceItemListUnk, HSTRING appPackageFamilyName, IUnknown auditInfoUnk, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync(HWND appWindow, IUnknown sourceItemListUnk, HSTRING appPackageFamilyName, IUnknown auditInfoUnk, HSTRING messageFromApp, uint behavior, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessToFilesForProcessForWindowAsync(HWND appWindow, IUnknown sourceItemListUnk, uint processId, IUnknown auditInfoUnk, const(GUID)* riid, void** asyncOperation);
    HRESULT RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync(HWND appWindow, IUnknown sourceItemListUnk, uint processId, IUnknown auditInfoUnk, HSTRING messageFromApp, uint behavior, const(GUID)* riid, void** asyncOperation);
}
struct HTHREAD_NETWORK_CONTEXT
{
    uint ThreadId;
    HANDLE ThreadContext;
}
alias ENTERPRISE_DATA_POLICIES = int;
enum : int
{
    ENTERPRISE_POLICY_NONE        = 0x00000000,
    ENTERPRISE_POLICY_ALLOWED     = 0x00000001,
    ENTERPRISE_POLICY_ENLIGHTENED = 0x00000002,
    ENTERPRISE_POLICY_EXEMPT      = 0x00000004,
}

alias SRPHOSTING_TYPE = int;
enum : int
{
    SRPHOSTING_TYPE_NONE    = 0x00000000,
    SRPHOSTING_TYPE_WINHTTP = 0x00000001,
    SRPHOSTING_TYPE_WININET = 0x00000002,
}

alias SRPHOSTING_VERSION = int;
enum : int
{
    SRPHOSTING_VERSION1 = 0x00000001,
}

struct FILE_UNPROTECT_OPTIONS
{
    ubyte audit;
}
HRESULT SrpCreateThreadNetworkContext(const(wchar)* enterpriseId, HTHREAD_NETWORK_CONTEXT* threadNetworkContext);
HRESULT SrpCloseThreadNetworkContext(HTHREAD_NETWORK_CONTEXT* threadNetworkContext);
HRESULT SrpSetTokenEnterpriseId(HANDLE tokenHandle, const(wchar)* enterpriseId);
HRESULT SrpGetEnterpriseIds(HANDLE tokenHandle, uint* numberOfBytes, const(wchar)** enterpriseIds, uint* enterpriseIdCount);
HRESULT SrpEnablePermissiveModeFileEncryption(const(wchar)* enterpriseId);
HRESULT SrpDisablePermissiveModeFileEncryption();
HRESULT SrpGetEnterprisePolicy(HANDLE tokenHandle, ENTERPRISE_DATA_POLICIES* policyFlags);
NTSTATUS SrpIsTokenService(HANDLE TokenHandle, ubyte* IsTokenService);
HRESULT SrpDoesPolicyAllowAppExecution(const(PACKAGE_ID)* packageId, BOOL* isAllowed);
HRESULT SrpHostingInitialize(SRPHOSTING_VERSION Version, SRPHOSTING_TYPE Type, void* pvData, uint cbData);
void SrpHostingTerminate(SRPHOSTING_TYPE Type);
HRESULT ProtectFileToEnterpriseIdentity(const(wchar)* fileOrFolderPath, const(wchar)* identity);
HRESULT UnprotectFile(const(wchar)* fileOrFolderPath, const(FILE_UNPROTECT_OPTIONS)* options);
