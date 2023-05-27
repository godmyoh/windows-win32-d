module windows.win32.system.winrt.shell;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.shell : IShellItem;

version (Windows):
extern (Windows):

alias CreateProcessMethod = int;
enum : int
{
    CpCreateProcess         = 0x00000000,
    CpCreateProcessAsUser   = 0x00000001,
    CpAicLaunchAdminProcess = 0x00000002,
}

enum IID_IDDEInitializer = GUID(0x30dc931f, 0x33fc, 0x4ffd, [0xa1, 0x68, 0x94, 0x22, 0x58, 0xcf, 0x3c, 0xa4]);
interface IDDEInitializer : IUnknown
{
    HRESULT Initialize(const(wchar)*, CreateProcessMethod, const(wchar)*, IShellItem, IUnknown, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
}
