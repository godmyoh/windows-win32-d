module windows.win32.ui.input.ink;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

enum IID_IInkCommitRequestHandler = GUID(0xfabea3fc, 0xb108, 0x45b6, [0xa9, 0xfc, 0x8d, 0x8, 0xfa, 0x9f, 0x85, 0xcf]);
interface IInkCommitRequestHandler : IUnknown
{
    HRESULT OnCommitRequested();
}
enum IID_IInkPresenterDesktop = GUID(0x73f3c0d9, 0x2e8b, 0x48f3, [0x89, 0x5e, 0x20, 0xcb, 0xd2, 0x7b, 0x72, 0x3b]);
interface IInkPresenterDesktop : IUnknown
{
    HRESULT SetRootVisual(IUnknown, IUnknown);
    HRESULT SetCommitRequestHandler(IInkCommitRequestHandler);
    HRESULT GetSize(float*, float*);
    HRESULT SetSize(float, float);
    HRESULT OnHighContrastChanged();
}
enum IID_IInkHostWorkItem = GUID(0xccda0a9a, 0x1b78, 0x4632, [0xbb, 0x96, 0x97, 0x80, 0x6, 0x62, 0xe2, 0x6c]);
interface IInkHostWorkItem : IUnknown
{
    HRESULT Invoke();
}
enum IID_IInkDesktopHost = GUID(0x4ce7d875, 0xa981, 0x4140, [0xa1, 0xff, 0xad, 0x93, 0x25, 0x8e, 0x8d, 0x59]);
interface IInkDesktopHost : IUnknown
{
    HRESULT QueueWorkItem(IInkHostWorkItem);
    HRESULT CreateInkPresenter(const(GUID)*, void**);
    HRESULT CreateAndInitializeInkPresenter(IUnknown, float, float, const(GUID)*, void**);
}
enum CLSID_InkDesktopHost = GUID(0x62584a6, 0xf830, 0x4bdc, [0xa4, 0xd2, 0xa, 0x10, 0xab, 0x6, 0x2b, 0x1d]);
struct InkDesktopHost
{
}
alias INK_HIGH_CONTRAST_ADJUSTMENT = int;
enum : int
{
    USE_SYSTEM_COLORS_WHEN_NECESSARY = 0x00000000,
    USE_SYSTEM_COLORS                = 0x00000001,
    USE_ORIGINAL_COLORS              = 0x00000002,
}

enum IID_IInkD2DRenderer = GUID(0x407fb1de, 0xf85a, 0x4150, [0x97, 0xcf, 0xb7, 0xfb, 0x27, 0x4f, 0xb4, 0xf8]);
interface IInkD2DRenderer : IUnknown
{
    HRESULT Draw(IUnknown, IUnknown, BOOL);
}
enum IID_IInkD2DRenderer2 = GUID(0xa95dcd9, 0x4578, 0x4b71, [0xb2, 0xb, 0xbf, 0x66, 0x4d, 0x4b, 0xfe, 0xee]);
interface IInkD2DRenderer2 : IUnknown
{
    HRESULT Draw(IUnknown, IUnknown, INK_HIGH_CONTRAST_ADJUSTMENT);
}
enum CLSID_InkD2DRenderer = GUID(0x4044e60c, 0x7b01, 0x4671, [0xa9, 0x7c, 0x4, 0xe0, 0x21, 0xa, 0x7, 0xa5]);
struct InkD2DRenderer
{
}
