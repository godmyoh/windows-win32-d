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
    HRESULT RequestAccessForWindowAsync(HWND, HSTRING, HSTRING, const(GUID)*, void**);
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IProtectionPolicyManagerInterop2 = GUID(0x157cfbe4, 0xa78d, 0x4156, [0xb3, 0x84, 0x61, 0xfd, 0xac, 0x41, 0xe6, 0x86]);
interface IProtectionPolicyManagerInterop2 : IInspectable
{
    HRESULT RequestAccessForAppWithWindowAsync(HWND, HSTRING, HSTRING, const(GUID)*, void**);
    HRESULT RequestAccessWithAuditingInfoForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, const(GUID)*, void**);
    HRESULT RequestAccessWithMessageForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, HSTRING, const(GUID)*, void**);
    HRESULT RequestAccessForAppWithAuditingInfoForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, const(GUID)*, void**);
    HRESULT RequestAccessForAppWithMessageForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, HSTRING, const(GUID)*, void**);
}
enum IID_IProtectionPolicyManagerInterop3 = GUID(0xc1c03933, 0xb398, 0x4d93, [0xb0, 0xfd, 0x29, 0x72, 0xad, 0xf8, 0x2, 0xc2]);
interface IProtectionPolicyManagerInterop3 : IInspectable
{
    HRESULT RequestAccessWithBehaviorForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, HSTRING, uint, const(GUID)*, void**);
    HRESULT RequestAccessForAppWithBehaviorForWindowAsync(HWND, HSTRING, HSTRING, IUnknown, HSTRING, uint, const(GUID)*, void**);
    HRESULT RequestAccessToFilesForAppForWindowAsync(HWND, IUnknown, HSTRING, IUnknown, const(GUID)*, void**);
    HRESULT RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync(HWND, IUnknown, HSTRING, IUnknown, HSTRING, uint, const(GUID)*, void**);
    HRESULT RequestAccessToFilesForProcessForWindowAsync(HWND, IUnknown, uint, IUnknown, const(GUID)*, void**);
    HRESULT RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync(HWND, IUnknown, uint, IUnknown, HSTRING, uint, const(GUID)*, void**);
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
HRESULT SrpCreateThreadNetworkContext(const(wchar)*, HTHREAD_NETWORK_CONTEXT*);
HRESULT SrpCloseThreadNetworkContext(HTHREAD_NETWORK_CONTEXT*);
HRESULT SrpSetTokenEnterpriseId(HANDLE, const(wchar)*);
HRESULT SrpGetEnterpriseIds(HANDLE, uint*, const(wchar)**, uint*);
HRESULT SrpEnablePermissiveModeFileEncryption(const(wchar)*);
HRESULT SrpDisablePermissiveModeFileEncryption();
HRESULT SrpGetEnterprisePolicy(HANDLE, ENTERPRISE_DATA_POLICIES*);
NTSTATUS SrpIsTokenService(HANDLE, ubyte*);
HRESULT SrpDoesPolicyAllowAppExecution(const(PACKAGE_ID)*, BOOL*);
HRESULT SrpHostingInitialize(SRPHOSTING_VERSION, SRPHOSTING_TYPE, void*, uint);
void SrpHostingTerminate(SRPHOSTING_TYPE);
HRESULT ProtectFileToEnterpriseIdentity(const(wchar)*, const(wchar)*);
HRESULT UnprotectFile(const(wchar)*, const(FILE_UNPROTECT_OPTIONS)*);
