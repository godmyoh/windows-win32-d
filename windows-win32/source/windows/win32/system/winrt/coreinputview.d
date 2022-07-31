module windows.win32.system.winrt.coreinputview;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND;
import windows.win32.system.winrt_ : IInspectable;

version (Windows):
extern (Windows):

enum IID_ICoreFrameworkInputViewInterop = GUID(0xe3da342, 0xb11c, 0x484b, [0x9c, 0x1c, 0xbe, 0xd, 0x61, 0xc2, 0xf6, 0xc5]);
interface ICoreFrameworkInputViewInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
