module windows.win32.ui.notifications;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

struct NOTIFICATION_USER_INPUT_DATA
{
    const(wchar)* Key;
    const(wchar)* Value;
}
enum IID_INotificationActivationCallback = GUID(0x53e31837, 0x6600, 0x4a81, [0x93, 0x95, 0x75, 0xcf, 0xfe, 0x74, 0x6f, 0x94]);
interface INotificationActivationCallback : IUnknown
{
    HRESULT Activate(const(wchar)*, const(wchar)*, const(NOTIFICATION_USER_INPUT_DATA)*, uint);
}
