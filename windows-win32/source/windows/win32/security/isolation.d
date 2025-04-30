module windows.win32.security.isolation;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;
import windows.win32.security : PSID, SID_AND_ATTRIBUTES;
import windows.win32.system.com : IUnknown;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

BOOL GetAppContainerNamedObjectPath(HANDLE Token, PSID AppContainerSid, uint ObjectPathLength, PWSTR ObjectPath, uint* ReturnLength);
HRESULT IsProcessInWDAGContainer(void* Reserved, BOOL* isProcessInWDAGContainer);
HRESULT IsProcessInIsolatedContainer(BOOL* isProcessInIsolatedContainer);
HRESULT IsProcessInIsolatedWindowsEnvironment(BOOL* isProcessInIsolatedWindowsEnvironment);
HRESULT IsCrossIsolatedEnvironmentClipboardContent(BOOL* isCrossIsolatedEnvironmentClipboardContent);
HRESULT CreateAppContainerProfile(const(wchar)* pszAppContainerName, const(wchar)* pszDisplayName, const(wchar)* pszDescription, SID_AND_ATTRIBUTES* pCapabilities, uint dwCapabilityCount, PSID* ppSidAppContainerSid);
HRESULT DeleteAppContainerProfile(const(wchar)* pszAppContainerName);
HRESULT GetAppContainerRegistryLocation(uint desiredAccess, HKEY* phAppContainerKey);
HRESULT GetAppContainerFolderPath(const(wchar)* pszAppContainerSid, PWSTR* ppszPath);
HRESULT DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(PSID psidAppContainerSid, const(wchar)* pszRestrictedAppContainerName, PSID* ppsidRestrictedAppContainerSid);
HRESULT DeriveAppContainerSidFromAppContainerName(const(wchar)* pszAppContainerName, PSID* ppsidAppContainerSid);
enum WDAG_CLIPBOARD_TAG = "CrossIsolatedEnvironmentContent";
struct IsolatedAppLauncherTelemetryParameters
{
    BOOL EnableForLaunch;
    GUID CorrelationGUID;
}
enum IID_IIsolatedAppLauncher = GUID(0xf686878f, 0x7b42, 0x4cc4, [0x96, 0xfb, 0xf4, 0xf3, 0xb6, 0xe3, 0xd2, 0x4d]);
interface IIsolatedAppLauncher : IUnknown
{
    HRESULT Launch(const(wchar)* appUserModelId, const(wchar)* arguments, const(IsolatedAppLauncherTelemetryParameters)* telemetryParameters);
}
enum CLSID_IsolatedAppLauncher = GUID(0xbc812430, 0xe75e, 0x4fd1, [0x96, 0x41, 0x1f, 0x9f, 0x1e, 0x2d, 0x9a, 0x1f]);
struct IsolatedAppLauncher
{
}
enum IID_IIsolatedProcessLauncher = GUID(0x1aa24232, 0x9a91, 0x4201, [0x88, 0xcb, 0x12, 0x2f, 0x9d, 0x65, 0x22, 0xe0]);
interface IIsolatedProcessLauncher : IUnknown
{
    HRESULT LaunchProcess(const(wchar)* process, const(wchar)* arguments, const(wchar)* workingDirectory);
    HRESULT ShareDirectory(const(wchar)* hostPath, const(wchar)* containerPath, BOOL readOnly);
    HRESULT GetContainerGuid(GUID* guid);
    HRESULT AllowSetForegroundAccess(uint pid);
    HRESULT IsContainerRunning(BOOL* running);
}
enum IID_IIsolatedProcessLauncher2 = GUID(0x780e4416, 0x5e72, 0x4123, [0x80, 0x8e, 0x66, 0xdc, 0x64, 0x79, 0xfe, 0xef]);
interface IIsolatedProcessLauncher2 : IIsolatedProcessLauncher
{
    HRESULT LaunchProcess2(const(wchar)* process, const(wchar)* arguments, const(wchar)* workingDirectory, const(GUID)* correlationGuid);
}
