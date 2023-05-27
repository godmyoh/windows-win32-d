module windows.win32.security.isolation;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSID, PWSTR;
import windows.win32.security : SID_AND_ATTRIBUTES;
import windows.win32.system.com : IUnknown;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

BOOL GetAppContainerNamedObjectPath(HANDLE, PSID, uint, PWSTR, uint*);
HRESULT IsProcessInWDAGContainer(void*, BOOL*);
HRESULT IsProcessInIsolatedContainer(BOOL*);
HRESULT IsProcessInIsolatedWindowsEnvironment(BOOL*);
HRESULT IsCrossIsolatedEnvironmentClipboardContent(BOOL*);
HRESULT CreateAppContainerProfile(const(wchar)*, const(wchar)*, const(wchar)*, SID_AND_ATTRIBUTES*, uint, PSID*);
HRESULT DeleteAppContainerProfile(const(wchar)*);
HRESULT GetAppContainerRegistryLocation(uint, HKEY*);
HRESULT GetAppContainerFolderPath(const(wchar)*, PWSTR*);
HRESULT DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(PSID, const(wchar)*, PSID*);
HRESULT DeriveAppContainerSidFromAppContainerName(const(wchar)*, PSID*);
enum WDAG_CLIPBOARD_TAG = "CrossIsolatedEnvironmentContent";
struct IsolatedAppLauncherTelemetryParameters
{
    BOOL EnableForLaunch;
    GUID CorrelationGUID;
}
enum IID_IIsolatedAppLauncher = GUID(0xf686878f, 0x7b42, 0x4cc4, [0x96, 0xfb, 0xf4, 0xf3, 0xb6, 0xe3, 0xd2, 0x4d]);
interface IIsolatedAppLauncher : IUnknown
{
    HRESULT Launch(const(wchar)*, const(wchar)*, const(IsolatedAppLauncherTelemetryParameters)*);
}
enum CLSID_IsolatedAppLauncher = GUID(0xbc812430, 0xe75e, 0x4fd1, [0x96, 0x41, 0x1f, 0x9f, 0x1e, 0x2d, 0x9a, 0x1f]);
struct IsolatedAppLauncher
{
}
