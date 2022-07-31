module windows.win32.graphics.compositionswapchain;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT, LUID, RECT;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_COLOR_SPACE_TYPE;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

struct SystemInterruptTime
{
    ulong value;
}
struct PresentationTransform
{
    float M11;
    float M12;
    float M21;
    float M22;
    float M31;
    float M32;
}
alias PresentStatisticsKind = int;
enum : int
{
    PresentStatisticsKind_PresentStatus        = 0x00000001,
    PresentStatisticsKind_CompositionFrame     = 0x00000002,
    PresentStatisticsKind_IndependentFlipFrame = 0x00000003,
}

enum IID_IPresentationBuffer = GUID(0x2e217d3a, 0x5abb, 0x4138, [0x9a, 0x13, 0xa7, 0x75, 0x59, 0x3c, 0x89, 0xca]);
interface IPresentationBuffer : IUnknown
{
    HRESULT GetAvailableEvent(HANDLE*);
    HRESULT IsAvailable(ubyte*);
}
enum IID_IPresentationContent = GUID(0x5668bb79, 0x3d8e, 0x415c, [0xb2, 0x15, 0xf3, 0x80, 0x20, 0xf2, 0xd2, 0x52]);
interface IPresentationContent : IUnknown
{
    void SetTag(ulong);
}
enum IID_IPresentationSurface = GUID(0x956710fb, 0xea40, 0x4eba, [0xa3, 0xeb, 0x43, 0x75, 0xa0, 0xeb, 0x4e, 0xdc]);
interface IPresentationSurface : IPresentationContent
{
    HRESULT SetBuffer(IPresentationBuffer);
    HRESULT SetColorSpace(DXGI_COLOR_SPACE_TYPE);
    HRESULT SetAlphaMode(DXGI_ALPHA_MODE);
    HRESULT SetSourceRect(const(RECT)*);
    HRESULT SetTransform(PresentationTransform*);
    HRESULT RestrictToOutput(IUnknown);
    HRESULT SetDisableReadback(ubyte);
    HRESULT SetLetterboxingMargins(float, float, float, float);
}
enum IID_IPresentStatistics = GUID(0xb44b8bda, 0x7282, 0x495d, [0x9d, 0xd7, 0xce, 0xad, 0xd8, 0xb4, 0xbb, 0x86]);
interface IPresentStatistics : IUnknown
{
    ulong GetPresentId();
    PresentStatisticsKind GetKind();
}
enum IID_IPresentationManager = GUID(0xfb562f82, 0x6292, 0x470a, [0x88, 0xb1, 0x84, 0x36, 0x61, 0xe7, 0xf2, 0xc]);
interface IPresentationManager : IUnknown
{
    HRESULT AddBufferFromResource(IUnknown, IPresentationBuffer*);
    HRESULT CreatePresentationSurface(HANDLE, IPresentationSurface*);
    ulong GetNextPresentId();
    HRESULT SetTargetTime(SystemInterruptTime);
    HRESULT SetPreferredPresentDuration(SystemInterruptTime, SystemInterruptTime);
    HRESULT ForceVSyncInterrupt(ubyte);
    HRESULT Present();
    HRESULT GetPresentRetiringFence(const(GUID)*, void**);
    HRESULT CancelPresentsFrom(ulong);
    HRESULT GetLostEvent(HANDLE*);
    HRESULT GetPresentStatisticsAvailableEvent(HANDLE*);
    HRESULT EnablePresentStatisticsKind(PresentStatisticsKind, ubyte);
    HRESULT GetNextPresentStatistics(IPresentStatistics*);
}
enum IID_IPresentationFactory = GUID(0x8fb37b58, 0x1d74, 0x4f64, [0xa4, 0x9c, 0x1f, 0x97, 0xa8, 0xa, 0x2e, 0xc0]);
interface IPresentationFactory : IUnknown
{
    ubyte IsPresentationSupported();
    ubyte IsPresentationSupportedWithIndependentFlip();
    HRESULT CreatePresentationManager(IPresentationManager*);
}
alias PresentStatus = int;
enum : int
{
    PresentStatus_Queued   = 0x00000000,
    PresentStatus_Skipped  = 0x00000001,
    PresentStatus_Canceled = 0x00000002,
}

enum IID_IPresentStatusPresentStatistics = GUID(0xc9ed2a41, 0x79cb, 0x435e, [0x96, 0x4e, 0xc8, 0x55, 0x30, 0x55, 0x42, 0xc]);
interface IPresentStatusPresentStatistics : IPresentStatistics
{
    ulong GetCompositionFrameId();
    PresentStatus GetPresentStatus();
}
alias CompositionFrameInstanceKind = int;
enum : int
{
    CompositionFrameInstanceKind_ComposedOnScreen       = 0x00000000,
    CompositionFrameInstanceKind_ScanoutOnScreen        = 0x00000001,
    CompositionFrameInstanceKind_ComposedToIntermediate = 0x00000002,
}

struct CompositionFrameDisplayInstance
{
    LUID displayAdapterLUID;
    uint displayVidPnSourceId;
    uint displayUniqueId;
    LUID renderAdapterLUID;
    CompositionFrameInstanceKind instanceKind;
    PresentationTransform finalTransform;
    ubyte requiredCrossAdapterCopy;
    DXGI_COLOR_SPACE_TYPE colorSpace;
}
enum IID_ICompositionFramePresentStatistics = GUID(0xab41d127, 0xc101, 0x4c0a, [0x91, 0x1d, 0xf9, 0xf2, 0xe9, 0xd0, 0x8e, 0x64]);
interface ICompositionFramePresentStatistics : IPresentStatistics
{
    ulong GetContentTag();
    ulong GetCompositionFrameId();
    void GetDisplayInstanceArray(uint*, const(CompositionFrameDisplayInstance)**);
}
enum IID_IIndependentFlipFramePresentStatistics = GUID(0x8c93be27, 0xad94, 0x4da0, [0x8f, 0xd4, 0x24, 0x13, 0x13, 0x2d, 0x12, 0x4e]);
interface IIndependentFlipFramePresentStatistics : IPresentStatistics
{
    LUID GetOutputAdapterLUID();
    uint GetOutputVidPnSourceId();
    ulong GetContentTag();
    SystemInterruptTime GetDisplayedTime();
    SystemInterruptTime GetPresentDuration();
}
HRESULT CreatePresentationFactory(IUnknown, const(GUID)*, void**);
