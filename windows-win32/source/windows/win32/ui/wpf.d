module windows.win32.ui.wpf;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT, VARIANT_BOOL;
import windows.win32.graphics.dwm : MilMatrix3x2D;
import windows.win32.graphics.imaging_ : IWICBitmapSource;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum MILBITMAPEFFECT_SDK_VERSION = 0x01000000;
enum CLSID_MILBitmapEffectGroup = GUID(0xac9c1a9a, 0x7e18, 0x4f64, [0xac, 0x7e, 0x47, 0xcf, 0x7f, 0x5, 0x1e, 0x95]);
enum CLSID_MILBitmapEffectBlur = GUID(0xa924df87, 0x225d, 0x4373, [0x8f, 0x5b, 0xb9, 0xe, 0xc8, 0x5a, 0xe3, 0xde]);
enum CLSID_MILBitmapEffectDropShadow = GUID(0x459a3fbe, 0xd8ac, 0x4692, [0x87, 0x4b, 0x7a, 0x26, 0x57, 0x15, 0xaa, 0x16]);
enum CLSID_MILBitmapEffectOuterGlow = GUID(0xe2161bdd, 0x7eb6, 0x4725, [0x9c, 0xb, 0x8a, 0x2a, 0x1b, 0x4f, 0x6, 0x67]);
enum CLSID_MILBitmapEffectBevel = GUID(0xfd361dbe, 0x6c9b, 0x4de0, [0x82, 0x90, 0xf6, 0x40, 0xc, 0x27, 0x37, 0xed]);
enum CLSID_MILBitmapEffectEmboss = GUID(0xcd299846, 0x824f, 0x47ec, [0xa0, 0x7, 0x12, 0xaa, 0x76, 0x7f, 0x28, 0x16]);
struct MilRectD
{
    double left;
    double top;
    double right;
    double bottom;
}
struct MilPoint2D
{
    double X;
    double Y;
}
struct MILMatrixF
{
    double _11;
    double _12;
    double _13;
    double _14;
    double _21;
    double _22;
    double _23;
    double _24;
    double _31;
    double _32;
    double _33;
    double _34;
    double _41;
    double _42;
    double _43;
    double _44;
}
enum IID_IMILBitmapEffectConnectorInfo = GUID(0xf66d2e4b, 0xb46b, 0x42fc, [0x85, 0x9e, 0x3d, 0xa0, 0xec, 0xdb, 0x3c, 0x43]);
interface IMILBitmapEffectConnectorInfo : IUnknown
{
    HRESULT GetIndex(uint*);
    HRESULT GetOptimalFormat(GUID*);
    HRESULT GetNumberFormats(uint*);
    HRESULT GetFormat(uint, GUID*);
}
enum IID_IMILBitmapEffectConnectionsInfo = GUID(0x476b538a, 0xc765, 0x4237, [0xba, 0x4a, 0xd6, 0xa8, 0x80, 0xff, 0xc, 0xfc]);
interface IMILBitmapEffectConnectionsInfo : IUnknown
{
    HRESULT GetNumberInputs(uint*);
    HRESULT GetNumberOutputs(uint*);
    HRESULT GetInputConnectorInfo(uint, IMILBitmapEffectConnectorInfo*);
    HRESULT GetOutputConnectorInfo(uint, IMILBitmapEffectConnectorInfo*);
}
enum IID_IMILBitmapEffectConnections = GUID(0xc2b5d861, 0x9b1a, 0x4374, [0x89, 0xb0, 0xde, 0xc4, 0x87, 0x4d, 0x6a, 0x81]);
interface IMILBitmapEffectConnections : IUnknown
{
    HRESULT GetInputConnector(uint, IMILBitmapEffectInputConnector*);
    HRESULT GetOutputConnector(uint, IMILBitmapEffectOutputConnector*);
}
enum IID_IMILBitmapEffect = GUID(0x8a6ff321, 0xc944, 0x4a1b, [0x99, 0x44, 0x99, 0x54, 0xaf, 0x30, 0x12, 0x58]);
interface IMILBitmapEffect : IUnknown
{
    HRESULT GetOutput(uint, IMILBitmapEffectRenderContext, IWICBitmapSource*);
    HRESULT GetParentEffect(IMILBitmapEffectGroup*);
    HRESULT SetInputSource(uint, IWICBitmapSource);
}
enum IID_IMILBitmapEffectImpl = GUID(0xcc2468f2, 0x9936, 0x47be, [0xb4, 0xaf, 0x6, 0xb5, 0xdf, 0x5d, 0xbc, 0xbb]);
interface IMILBitmapEffectImpl : IUnknown
{
    HRESULT IsInPlaceModificationAllowed(IMILBitmapEffectOutputConnector, VARIANT_BOOL*);
    HRESULT SetParentEffect(IMILBitmapEffectGroup);
    HRESULT GetInputSource(uint, IWICBitmapSource*);
    HRESULT GetInputSourceBounds(uint, MilRectD*);
    HRESULT GetInputBitmapSource(uint, IMILBitmapEffectRenderContext, VARIANT_BOOL*, IWICBitmapSource*);
    HRESULT GetOutputBitmapSource(uint, IMILBitmapEffectRenderContext, VARIANT_BOOL*, IWICBitmapSource*);
    HRESULT Initialize(IUnknown);
}
enum IID_IMILBitmapEffectGroup = GUID(0x2f952360, 0x698a, 0x4ac6, [0x81, 0xa1, 0xbc, 0xfd, 0xf0, 0x8e, 0xb8, 0xe8]);
interface IMILBitmapEffectGroup : IUnknown
{
    HRESULT GetInteriorInputConnector(uint, IMILBitmapEffectOutputConnector*);
    HRESULT GetInteriorOutputConnector(uint, IMILBitmapEffectInputConnector*);
    HRESULT Add(IMILBitmapEffect);
}
enum IID_IMILBitmapEffectGroupImpl = GUID(0x78fed518, 0x1cfc, 0x4807, [0x8b, 0x85, 0x6b, 0x6e, 0x51, 0x39, 0x8f, 0x62]);
interface IMILBitmapEffectGroupImpl : IUnknown
{
    HRESULT Preprocess(IMILBitmapEffectRenderContext);
    HRESULT GetNumberChildren(uint*);
    HRESULT GetChildren(IMILBitmapEffects*);
}
enum IID_IMILBitmapEffectRenderContext = GUID(0x12a2ec7e, 0x2d33, 0x44b2, [0xb3, 0x34, 0x1a, 0xbb, 0x78, 0x46, 0xe3, 0x90]);
interface IMILBitmapEffectRenderContext : IUnknown
{
    HRESULT SetOutputPixelFormat(GUID*);
    HRESULT GetOutputPixelFormat(GUID*);
    HRESULT SetUseSoftwareRenderer(VARIANT_BOOL);
    HRESULT SetInitialTransform(MILMatrixF*);
    HRESULT GetFinalTransform(MILMatrixF*);
    HRESULT SetOutputDPI(double, double);
    HRESULT GetOutputDPI(double*, double*);
    HRESULT SetRegionOfInterest(MilRectD*);
}
enum IID_IMILBitmapEffectRenderContextImpl = GUID(0x4d25accb, 0x797d, 0x4fd2, [0xb1, 0x28, 0xdf, 0xfe, 0xff, 0x84, 0xfc, 0xc3]);
interface IMILBitmapEffectRenderContextImpl : IUnknown
{
    HRESULT GetUseSoftwareRenderer(VARIANT_BOOL*);
    HRESULT GetTransform(MILMatrixF*);
    HRESULT UpdateTransform(MILMatrixF*);
    HRESULT GetOutputBounds(MilRectD*);
    HRESULT UpdateOutputBounds(MilRectD*);
}
enum IID_IMILBitmapEffectFactory = GUID(0x33a9df34, 0xa403, 0x4ec7, [0xb0, 0x7e, 0xbc, 0x6, 0x82, 0x37, 0x8, 0x45]);
interface IMILBitmapEffectFactory : IUnknown
{
    HRESULT CreateEffect(const(GUID)*, IMILBitmapEffect*);
    HRESULT CreateContext(IMILBitmapEffectRenderContext*);
    HRESULT CreateEffectOuter(IMILBitmapEffect*);
}
enum IID_IMILBitmapEffectPrimitive = GUID(0x67e31025, 0x3091, 0x4dfc, [0x98, 0xd6, 0xdd, 0x49, 0x45, 0x51, 0x46, 0x1d]);
interface IMILBitmapEffectPrimitive : IUnknown
{
    HRESULT GetOutput(uint, IMILBitmapEffectRenderContext, VARIANT_BOOL*, IWICBitmapSource*);
    HRESULT TransformPoint(uint, MilPoint2D*, VARIANT_BOOL, IMILBitmapEffectRenderContext, VARIANT_BOOL*);
    HRESULT TransformRect(uint, MilRectD*, VARIANT_BOOL, IMILBitmapEffectRenderContext);
    HRESULT HasAffineTransform(uint, VARIANT_BOOL*);
    HRESULT HasInverseTransform(uint, VARIANT_BOOL*);
    HRESULT GetAffineMatrix(uint, MilMatrix3x2D*);
}
enum IID_IMILBitmapEffectPrimitiveImpl = GUID(0xce41e00b, 0xefa6, 0x44e7, [0xb0, 0x7, 0xdd, 0x4, 0x2e, 0x3a, 0xe1, 0x26]);
interface IMILBitmapEffectPrimitiveImpl : IUnknown
{
    HRESULT IsDirty(uint, VARIANT_BOOL*);
    HRESULT IsVolatile(uint, VARIANT_BOOL*);
}
enum IID_IMILBitmapEffects = GUID(0x51ac3dce, 0x67c5, 0x448b, [0x91, 0x80, 0xad, 0x3e, 0xab, 0xdd, 0xd5, 0xdd]);
interface IMILBitmapEffects : IUnknown
{
    HRESULT _NewEnum(IUnknown*);
    HRESULT get_Parent(IMILBitmapEffectGroup*);
    HRESULT Item(uint, IMILBitmapEffect*);
    HRESULT get_Count(uint*);
}
enum IID_IMILBitmapEffectConnector = GUID(0xf59567b3, 0x76c1, 0x4d47, [0xba, 0x1e, 0x79, 0xf9, 0x55, 0xe3, 0x50, 0xef]);
interface IMILBitmapEffectConnector : IMILBitmapEffectConnectorInfo
{
    HRESULT IsConnected(VARIANT_BOOL*);
    HRESULT GetBitmapEffect(IMILBitmapEffect*);
}
enum IID_IMILBitmapEffectInputConnector = GUID(0xa9b4ecaa, 0x7a3c, 0x45e7, [0x85, 0x73, 0xf4, 0xb8, 0x1b, 0x60, 0xdd, 0x6c]);
interface IMILBitmapEffectInputConnector : IMILBitmapEffectConnector
{
    HRESULT ConnectTo(IMILBitmapEffectOutputConnector);
    HRESULT GetConnection(IMILBitmapEffectOutputConnector*);
}
enum IID_IMILBitmapEffectOutputConnector = GUID(0x92957aad, 0x841b, 0x4866, [0x82, 0xec, 0x87, 0x52, 0x46, 0x8b, 0x7, 0xfd]);
interface IMILBitmapEffectOutputConnector : IMILBitmapEffectConnector
{
    HRESULT GetNumberConnections(uint*);
    HRESULT GetConnection(uint, IMILBitmapEffectInputConnector*);
}
enum IID_IMILBitmapEffectOutputConnectorImpl = GUID(0x21fae777, 0x8b39, 0x4bfa, [0x9f, 0x2d, 0xf3, 0x94, 0x1e, 0xd3, 0x69, 0x13]);
interface IMILBitmapEffectOutputConnectorImpl : IUnknown
{
    HRESULT AddBackLink(IMILBitmapEffectInputConnector);
    HRESULT RemoveBackLink(IMILBitmapEffectInputConnector);
}
enum IID_IMILBitmapEffectInteriorInputConnector = GUID(0x20287e9e, 0x86a2, 0x4e15, [0x95, 0x3d, 0xeb, 0x14, 0x38, 0xa5, 0xb8, 0x42]);
interface IMILBitmapEffectInteriorInputConnector : IUnknown
{
    HRESULT GetInputConnector(IMILBitmapEffectInputConnector*);
}
enum IID_IMILBitmapEffectInteriorOutputConnector = GUID(0xbbb6dc, 0xacc9, 0x4bfc, [0xb3, 0x44, 0x8b, 0xee, 0x38, 0x3d, 0xfe, 0xfa]);
interface IMILBitmapEffectInteriorOutputConnector : IUnknown
{
    HRESULT GetOutputConnector(IMILBitmapEffectOutputConnector*);
}
enum IID_IMILBitmapEffectEvents = GUID(0x2e880dd8, 0xf8ce, 0x457b, [0x81, 0x99, 0xd6, 0xb, 0xb3, 0xd7, 0xef, 0x98]);
interface IMILBitmapEffectEvents : IUnknown
{
    HRESULT PropertyChange(IMILBitmapEffect, BSTR);
    HRESULT DirtyRegion(IMILBitmapEffect, MilRectD*);
}
