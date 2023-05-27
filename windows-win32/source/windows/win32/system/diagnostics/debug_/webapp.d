module windows.win32.system.diagnostics.debug_.webapp;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, HWND, PWSTR;
import windows.win32.system.com : IServiceProvider, IUnknown;
import windows.win32.system.diagnostics.debug_.activescript : IActiveScriptError;
import windows.win32.web.mshtml : IHTMLDocument2, IHTMLWindow2;

version (Windows):
extern (Windows):

enum IID_IWebApplicationScriptEvents = GUID(0x7c3f6998, 0x1567, 0x4bba, [0xb5, 0x2b, 0x48, 0xd3, 0x21, 0x41, 0xd6, 0x13]);
interface IWebApplicationScriptEvents : IUnknown
{
    HRESULT BeforeScriptExecute(IHTMLWindow2);
    HRESULT ScriptError(IHTMLWindow2, IActiveScriptError, const(wchar)*, BOOL);
}
enum IID_IWebApplicationNavigationEvents = GUID(0xc22615d2, 0xd318, 0x4da2, [0x84, 0x22, 0x1f, 0xca, 0xf7, 0x7b, 0x10, 0xe4]);
interface IWebApplicationNavigationEvents : IUnknown
{
    HRESULT BeforeNavigate(IHTMLWindow2, const(wchar)*, uint, const(wchar)*);
    HRESULT NavigateComplete(IHTMLWindow2, const(wchar)*);
    HRESULT NavigateError(IHTMLWindow2, const(wchar)*, const(wchar)*, uint);
    HRESULT DocumentComplete(IHTMLWindow2, const(wchar)*);
    HRESULT DownloadBegin();
    HRESULT DownloadComplete();
}
enum IID_IWebApplicationUIEvents = GUID(0x5b2b3f99, 0x328c, 0x41d5, [0xa6, 0xf7, 0x74, 0x83, 0xed, 0x8e, 0x71, 0xdd]);
interface IWebApplicationUIEvents : IUnknown
{
    HRESULT SecurityProblem(uint, HRESULT*);
}
enum IID_IWebApplicationUpdateEvents = GUID(0x3e59e6b7, 0xc652, 0x4daf, [0xad, 0x5e, 0x16, 0xfe, 0xb3, 0x50, 0xcd, 0xe3]);
interface IWebApplicationUpdateEvents : IUnknown
{
    HRESULT OnPaint();
    HRESULT OnCssChanged();
}
enum IID_IWebApplicationHost = GUID(0xcecbd2c3, 0xa3a5, 0x4749, [0x96, 0x81, 0x20, 0xe9, 0x16, 0x1c, 0x67, 0x94]);
interface IWebApplicationHost : IUnknown
{
    HRESULT get_HWND(HWND*);
    HRESULT get_Document(IHTMLDocument2*);
    HRESULT Refresh();
    HRESULT Advise(const(GUID)*, IUnknown, uint*);
    HRESULT Unadvise(uint);
}
enum IID_IWebApplicationActivation = GUID(0xbcdcd0de, 0x330e, 0x481b, [0xb8, 0x43, 0x48, 0x98, 0xa6, 0xa8, 0xeb, 0xac]);
interface IWebApplicationActivation : IUnknown
{
    HRESULT CancelPendingActivation();
}
enum IID_IWebApplicationAuthoringMode = GUID(0x720aea93, 0x1964, 0x4db0, [0xb0, 0x5, 0x29, 0xeb, 0x9e, 0x2b, 0x18, 0xa9]);
interface IWebApplicationAuthoringMode : IServiceProvider
{
    HRESULT get_AuthoringClientBinary(BSTR*);
}
alias RegisterAuthoringClientFunctionType = HRESULT function(IWebApplicationAuthoringMode, IWebApplicationHost);
alias UnregisterAuthoringClientFunctionType = HRESULT function(IWebApplicationHost);
