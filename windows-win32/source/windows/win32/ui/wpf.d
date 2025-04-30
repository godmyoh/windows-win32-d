module windows.win32.ui.wpf;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT, VARIANT_BOOL;
import windows.win32.graphics.dwm : MilMatrix3x2D;
import windows.win32.graphics.imaging : IWICBitmapSource;
import windows.win32.system.com : IUnknown;

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
    HRESULT GetIndex(uint* puiIndex);
    HRESULT GetOptimalFormat(GUID* pFormat);
    HRESULT GetNumberFormats(uint* pulNumberFormats);
    HRESULT GetFormat(uint ulIndex, GUID* pFormat);
}
enum IID_IMILBitmapEffectConnectionsInfo = GUID(0x476b538a, 0xc765, 0x4237, [0xba, 0x4a, 0xd6, 0xa8, 0x80, 0xff, 0xc, 0xfc]);
interface IMILBitmapEffectConnectionsInfo : IUnknown
{
    HRESULT GetNumberInputs(uint* puiNumInputs);
    HRESULT GetNumberOutputs(uint* puiNumOutputs);
    HRESULT GetInputConnectorInfo(uint uiIndex, IMILBitmapEffectConnectorInfo* ppConnectorInfo);
    HRESULT GetOutputConnectorInfo(uint uiIndex, IMILBitmapEffectConnectorInfo* ppConnectorInfo);
}
enum IID_IMILBitmapEffectConnections = GUID(0xc2b5d861, 0x9b1a, 0x4374, [0x89, 0xb0, 0xde, 0xc4, 0x87, 0x4d, 0x6a, 0x81]);
interface IMILBitmapEffectConnections : IUnknown
{
    HRESULT GetInputConnector(uint uiIndex, IMILBitmapEffectInputConnector* ppConnector);
    HRESULT GetOutputConnector(uint uiIndex, IMILBitmapEffectOutputConnector* ppConnector);
}
enum IID_IMILBitmapEffect = GUID(0x8a6ff321, 0xc944, 0x4a1b, [0x99, 0x44, 0x99, 0x54, 0xaf, 0x30, 0x12, 0x58]);
interface IMILBitmapEffect : IUnknown
{
    HRESULT GetOutput(uint uiIndex, IMILBitmapEffectRenderContext pContext, IWICBitmapSource* ppBitmapSource);
    HRESULT GetParentEffect(IMILBitmapEffectGroup* ppParentEffect);
    HRESULT SetInputSource(uint uiIndex, IWICBitmapSource pBitmapSource);
}
enum IID_IMILBitmapEffectImpl = GUID(0xcc2468f2, 0x9936, 0x47be, [0xb4, 0xaf, 0x6, 0xb5, 0xdf, 0x5d, 0xbc, 0xbb]);
interface IMILBitmapEffectImpl : IUnknown
{
    HRESULT IsInPlaceModificationAllowed(IMILBitmapEffectOutputConnector pOutputConnector, VARIANT_BOOL* pfModifyInPlace);
    HRESULT SetParentEffect(IMILBitmapEffectGroup pParentEffect);
    HRESULT GetInputSource(uint uiIndex, IWICBitmapSource* ppBitmapSource);
    HRESULT GetInputSourceBounds(uint uiIndex, MilRectD* pRect);
    HRESULT GetInputBitmapSource(uint uiIndex, IMILBitmapEffectRenderContext pRenderContext, VARIANT_BOOL* pfModifyInPlace, IWICBitmapSource* ppBitmapSource);
    HRESULT GetOutputBitmapSource(uint uiIndex, IMILBitmapEffectRenderContext pRenderContext, VARIANT_BOOL* pfModifyInPlace, IWICBitmapSource* ppBitmapSource);
    HRESULT Initialize(IUnknown pInner);
}
enum IID_IMILBitmapEffectGroup = GUID(0x2f952360, 0x698a, 0x4ac6, [0x81, 0xa1, 0xbc, 0xfd, 0xf0, 0x8e, 0xb8, 0xe8]);
interface IMILBitmapEffectGroup : IUnknown
{
    HRESULT GetInteriorInputConnector(uint uiIndex, IMILBitmapEffectOutputConnector* ppConnector);
    HRESULT GetInteriorOutputConnector(uint uiIndex, IMILBitmapEffectInputConnector* ppConnector);
    HRESULT Add(IMILBitmapEffect pEffect);
}
enum IID_IMILBitmapEffectGroupImpl = GUID(0x78fed518, 0x1cfc, 0x4807, [0x8b, 0x85, 0x6b, 0x6e, 0x51, 0x39, 0x8f, 0x62]);
interface IMILBitmapEffectGroupImpl : IUnknown
{
    HRESULT Preprocess(IMILBitmapEffectRenderContext pContext);
    HRESULT GetNumberChildren(uint* puiNumberChildren);
    HRESULT GetChildren(IMILBitmapEffects* pChildren);
}
enum IID_IMILBitmapEffectRenderContext = GUID(0x12a2ec7e, 0x2d33, 0x44b2, [0xb3, 0x34, 0x1a, 0xbb, 0x78, 0x46, 0xe3, 0x90]);
interface IMILBitmapEffectRenderContext : IUnknown
{
    HRESULT SetOutputPixelFormat(GUID* format);
    HRESULT GetOutputPixelFormat(GUID* pFormat);
    HRESULT SetUseSoftwareRenderer(VARIANT_BOOL fSoftware);
    HRESULT SetInitialTransform(MILMatrixF* pMatrix);
    HRESULT GetFinalTransform(MILMatrixF* pMatrix);
    HRESULT SetOutputDPI(double dblDpiX, double dblDpiY);
    HRESULT GetOutputDPI(double* pdblDpiX, double* pdblDpiY);
    HRESULT SetRegionOfInterest(MilRectD* pRect);
}
enum IID_IMILBitmapEffectRenderContextImpl = GUID(0x4d25accb, 0x797d, 0x4fd2, [0xb1, 0x28, 0xdf, 0xfe, 0xff, 0x84, 0xfc, 0xc3]);
interface IMILBitmapEffectRenderContextImpl : IUnknown
{
    HRESULT GetUseSoftwareRenderer(VARIANT_BOOL* pfSoftware);
    HRESULT GetTransform(MILMatrixF* pMatrix);
    HRESULT UpdateTransform(MILMatrixF* pMatrix);
    HRESULT GetOutputBounds(MilRectD* pRect);
    HRESULT UpdateOutputBounds(MilRectD* pRect);
}
enum IID_IMILBitmapEffectFactory = GUID(0x33a9df34, 0xa403, 0x4ec7, [0xb0, 0x7e, 0xbc, 0x6, 0x82, 0x37, 0x8, 0x45]);
interface IMILBitmapEffectFactory : IUnknown
{
    HRESULT CreateEffect(const(GUID)* pguidEffect, IMILBitmapEffect* ppEffect);
    HRESULT CreateContext(IMILBitmapEffectRenderContext* ppContext);
    HRESULT CreateEffectOuter(IMILBitmapEffect* ppEffect);
}
enum IID_IMILBitmapEffectPrimitive = GUID(0x67e31025, 0x3091, 0x4dfc, [0x98, 0xd6, 0xdd, 0x49, 0x45, 0x51, 0x46, 0x1d]);
interface IMILBitmapEffectPrimitive : IUnknown
{
    HRESULT GetOutput(uint uiIndex, IMILBitmapEffectRenderContext pContext, VARIANT_BOOL* pfModifyInPlace, IWICBitmapSource* ppBitmapSource);
    HRESULT TransformPoint(uint uiIndex, MilPoint2D* p, VARIANT_BOOL fForwardTransform, IMILBitmapEffectRenderContext pContext, VARIANT_BOOL* pfPointTransformed);
    HRESULT TransformRect(uint uiIndex, MilRectD* p, VARIANT_BOOL fForwardTransform, IMILBitmapEffectRenderContext pContext);
    HRESULT HasAffineTransform(uint uiIndex, VARIANT_BOOL* pfAffine);
    HRESULT HasInverseTransform(uint uiIndex, VARIANT_BOOL* pfHasInverse);
    HRESULT GetAffineMatrix(uint uiIndex, MilMatrix3x2D* pMatrix);
}
enum IID_IMILBitmapEffectPrimitiveImpl = GUID(0xce41e00b, 0xefa6, 0x44e7, [0xb0, 0x7, 0xdd, 0x4, 0x2e, 0x3a, 0xe1, 0x26]);
interface IMILBitmapEffectPrimitiveImpl : IUnknown
{
    HRESULT IsDirty(uint uiOutputIndex, VARIANT_BOOL* pfDirty);
    HRESULT IsVolatile(uint uiOutputIndex, VARIANT_BOOL* pfVolatile);
}
enum IID_IMILBitmapEffects = GUID(0x51ac3dce, 0x67c5, 0x448b, [0x91, 0x80, 0xad, 0x3e, 0xab, 0xdd, 0xd5, 0xdd]);
interface IMILBitmapEffects : IUnknown
{
    HRESULT _NewEnum(IUnknown* ppiuReturn);
    HRESULT get_Parent(IMILBitmapEffectGroup* ppEffect);
    HRESULT Item(uint uindex, IMILBitmapEffect* ppEffect);
    HRESULT get_Count(uint* puiCount);
}
enum IID_IMILBitmapEffectConnector = GUID(0xf59567b3, 0x76c1, 0x4d47, [0xba, 0x1e, 0x79, 0xf9, 0x55, 0xe3, 0x50, 0xef]);
interface IMILBitmapEffectConnector : IMILBitmapEffectConnectorInfo
{
    HRESULT IsConnected(VARIANT_BOOL* pfConnected);
    HRESULT GetBitmapEffect(IMILBitmapEffect* ppEffect);
}
enum IID_IMILBitmapEffectInputConnector = GUID(0xa9b4ecaa, 0x7a3c, 0x45e7, [0x85, 0x73, 0xf4, 0xb8, 0x1b, 0x60, 0xdd, 0x6c]);
interface IMILBitmapEffectInputConnector : IMILBitmapEffectConnector
{
    HRESULT ConnectTo(IMILBitmapEffectOutputConnector pConnector);
    HRESULT GetConnection(IMILBitmapEffectOutputConnector* ppConnector);
}
enum IID_IMILBitmapEffectOutputConnector = GUID(0x92957aad, 0x841b, 0x4866, [0x82, 0xec, 0x87, 0x52, 0x46, 0x8b, 0x7, 0xfd]);
interface IMILBitmapEffectOutputConnector : IMILBitmapEffectConnector
{
    HRESULT GetNumberConnections(uint* puiNumberConnections);
    HRESULT GetConnection(uint uiIndex, IMILBitmapEffectInputConnector* ppConnection);
}
enum IID_IMILBitmapEffectOutputConnectorImpl = GUID(0x21fae777, 0x8b39, 0x4bfa, [0x9f, 0x2d, 0xf3, 0x94, 0x1e, 0xd3, 0x69, 0x13]);
interface IMILBitmapEffectOutputConnectorImpl : IUnknown
{
    HRESULT AddBackLink(IMILBitmapEffectInputConnector pConnection);
    HRESULT RemoveBackLink(IMILBitmapEffectInputConnector pConnection);
}
enum IID_IMILBitmapEffectInteriorInputConnector = GUID(0x20287e9e, 0x86a2, 0x4e15, [0x95, 0x3d, 0xeb, 0x14, 0x38, 0xa5, 0xb8, 0x42]);
interface IMILBitmapEffectInteriorInputConnector : IUnknown
{
    HRESULT GetInputConnector(IMILBitmapEffectInputConnector* pInputConnector);
}
enum IID_IMILBitmapEffectInteriorOutputConnector = GUID(0xbbb6dc, 0xacc9, 0x4bfc, [0xb3, 0x44, 0x8b, 0xee, 0x38, 0x3d, 0xfe, 0xfa]);
interface IMILBitmapEffectInteriorOutputConnector : IUnknown
{
    HRESULT GetOutputConnector(IMILBitmapEffectOutputConnector* pOutputConnector);
}
enum IID_IMILBitmapEffectEvents = GUID(0x2e880dd8, 0xf8ce, 0x457b, [0x81, 0x99, 0xd6, 0xb, 0xb3, 0xd7, 0xef, 0x98]);
interface IMILBitmapEffectEvents : IUnknown
{
    HRESULT PropertyChange(IMILBitmapEffect pEffect, BSTR bstrPropertyName);
    HRESULT DirtyRegion(IMILBitmapEffect pEffect, MilRectD* pRect);
}
