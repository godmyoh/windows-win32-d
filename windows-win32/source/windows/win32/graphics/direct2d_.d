module windows.win32.graphics.direct2d_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, HWND, POINT, PSTR, PWSTR, RECT;
import windows.win32.graphics.direct2d.common : D2D1_ALPHA_MODE, D2D1_BEZIER_SEGMENT, D2D1_BLEND_MODE, D2D1_COLOR_F, D2D1_COMPOSITE_MODE, D2D1_FILL_MODE, D2D1_PIXEL_FORMAT, D2D_MATRIX_3X2_F, D2D_MATRIX_4X4_F, D2D_POINT_2F, D2D_POINT_2U, D2D_RECT_F, D2D_RECT_U, D2D_SIZE_F, D2D_SIZE_U, ID2D1SimplifiedGeometrySink;
import windows.win32.graphics.direct3d_ : D3D_FEATURE_LEVEL;
import windows.win32.graphics.directwrite : DWRITE_GLYPH_IMAGE_FORMATS, DWRITE_GLYPH_RUN, DWRITE_GLYPH_RUN_DESCRIPTION, DWRITE_MEASURING_MODE, IDWriteFontFace, IDWriteRenderingParams, IDWriteTextFormat, IDWriteTextLayout;
import windows.win32.graphics.dxgi_ : IDXGIDevice, IDXGISurface;
import windows.win32.graphics.dxgi.common : DXGI_COLOR_SPACE_TYPE, DXGI_FORMAT;
import windows.win32.graphics.gdi : HDC;
import windows.win32.graphics.imaging_ : IWICBitmap, IWICBitmapSource, IWICColorContext, IWICImagingFactory;
import windows.win32.storage.xps.printing : IPrintDocumentPackageTarget;
import windows.win32.system.com_ : IStream, IUnknown;

version (Windows):
extern (Windows):

HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE, const(GUID)*, const(D2D1_FACTORY_OPTIONS)*, void**);
void D2D1MakeRotateMatrix(float, D2D_POINT_2F, D2D_MATRIX_3X2_F*);
void D2D1MakeSkewMatrix(float, float, D2D_POINT_2F, D2D_MATRIX_3X2_F*);
BOOL D2D1IsMatrixInvertible(const(D2D_MATRIX_3X2_F)*);
BOOL D2D1InvertMatrix(D2D_MATRIX_3X2_F*);
HRESULT D2D1CreateDevice(IDXGIDevice, const(D2D1_CREATION_PROPERTIES)*, ID2D1Device*);
HRESULT D2D1CreateDeviceContext(IDXGISurface, const(D2D1_CREATION_PROPERTIES)*, ID2D1DeviceContext*);
D2D1_COLOR_F D2D1ConvertColorSpace(D2D1_COLOR_SPACE, D2D1_COLOR_SPACE, const(D2D1_COLOR_F)*);
void D2D1SinCos(float, float*, float*);
float D2D1Tan(float);
float D2D1Vec3Length(float, float, float);
float D2D1ComputeMaximumScaleFactor(const(D2D_MATRIX_3X2_F)*);
void D2D1GetGradientMeshInteriorPointsFromCoonsPatch(const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, const(D2D_POINT_2F)*, D2D_POINT_2F*, D2D_POINT_2F*, D2D_POINT_2F*, D2D_POINT_2F*);
enum D2D1_DEFAULT_FLATTENING_TOLERANCE = 0.250000;
enum CLSID_D2D12DAffineTransform = GUID(0x6aa97485, 0x6354, 0x4cfc, [0x90, 0x8c, 0xe4, 0xa7, 0x4f, 0x62, 0xc9, 0x6c]);
enum CLSID_D2D13DPerspectiveTransform = GUID(0xc2844d0b, 0x3d86, 0x46e7, [0x85, 0xba, 0x52, 0x6c, 0x92, 0x40, 0xf3, 0xfb]);
enum CLSID_D2D13DTransform = GUID(0xe8467b04, 0xec61, 0x4b8a, [0xb5, 0xde, 0xd4, 0xd7, 0x3d, 0xeb, 0xea, 0x5a]);
enum CLSID_D2D1ArithmeticComposite = GUID(0xfc151437, 0x49a, 0x4784, [0xa2, 0x4a, 0xf1, 0xc4, 0xda, 0xf2, 0x9, 0x87]);
enum CLSID_D2D1Atlas = GUID(0x913e2be4, 0xfdcf, 0x4fe2, [0xa5, 0xf0, 0x24, 0x54, 0xf1, 0x4f, 0xf4, 0x8]);
enum CLSID_D2D1BitmapSource = GUID(0x5fb6c24d, 0xc6dd, 0x4231, [0x94, 0x4, 0x50, 0xf4, 0xd5, 0xc3, 0x25, 0x2d]);
enum CLSID_D2D1Blend = GUID(0x81c5b77b, 0x13f8, 0x4cdd, [0xad, 0x20, 0xc8, 0x90, 0x54, 0x7a, 0xc6, 0x5d]);
enum CLSID_D2D1Border = GUID(0x2a2d49c0, 0x4acf, 0x43c7, [0x8c, 0x6a, 0x7c, 0x4a, 0x27, 0x87, 0x4d, 0x27]);
enum CLSID_D2D1Brightness = GUID(0x8cea8d1e, 0x77b0, 0x4986, [0xb3, 0xb9, 0x2f, 0xc, 0xe, 0xae, 0x78, 0x87]);
enum CLSID_D2D1ColorManagement = GUID(0x1a28524c, 0xfdd6, 0x4aa4, [0xae, 0x8f, 0x83, 0x7e, 0xb8, 0x26, 0x7b, 0x37]);
enum CLSID_D2D1ColorMatrix = GUID(0x921f03d6, 0x641c, 0x47df, [0x85, 0x2d, 0xb4, 0xbb, 0x61, 0x53, 0xae, 0x11]);
enum CLSID_D2D1Composite = GUID(0x48fc9f51, 0xf6ac, 0x48f1, [0x8b, 0x58, 0x3b, 0x28, 0xac, 0x46, 0xf7, 0x6d]);
enum CLSID_D2D1ConvolveMatrix = GUID(0x407f8c08, 0x5533, 0x4331, [0xa3, 0x41, 0x23, 0xcc, 0x38, 0x77, 0x84, 0x3e]);
enum CLSID_D2D1Crop = GUID(0xe23f7110, 0xe9a, 0x4324, [0xaf, 0x47, 0x6a, 0x2c, 0xc, 0x46, 0xf3, 0x5b]);
enum CLSID_D2D1DirectionalBlur = GUID(0x174319a6, 0x58e9, 0x49b2, [0xbb, 0x63, 0xca, 0xf2, 0xc8, 0x11, 0xa3, 0xdb]);
enum CLSID_D2D1DiscreteTransfer = GUID(0x90866fcd, 0x488e, 0x454b, [0xaf, 0x6, 0xe5, 0x4, 0x1b, 0x66, 0xc3, 0x6c]);
enum CLSID_D2D1DisplacementMap = GUID(0xedc48364, 0x417, 0x4111, [0x94, 0x50, 0x43, 0x84, 0x5f, 0xa9, 0xf8, 0x90]);
enum CLSID_D2D1DistantDiffuse = GUID(0x3e7efd62, 0xa32d, 0x46d4, [0xa8, 0x3c, 0x52, 0x78, 0x88, 0x9a, 0xc9, 0x54]);
enum CLSID_D2D1DistantSpecular = GUID(0x428c1ee5, 0x77b8, 0x4450, [0x8a, 0xb5, 0x72, 0x21, 0x9c, 0x21, 0xab, 0xda]);
enum CLSID_D2D1DpiCompensation = GUID(0x6c26c5c7, 0x34e0, 0x46fc, [0x9c, 0xfd, 0xe5, 0x82, 0x37, 0x6, 0xe2, 0x28]);
enum CLSID_D2D1Flood = GUID(0x61c23c20, 0xae69, 0x4d8e, [0x94, 0xcf, 0x50, 0x7, 0x8d, 0xf6, 0x38, 0xf2]);
enum CLSID_D2D1GammaTransfer = GUID(0x409444c4, 0xc419, 0x41a0, [0xb0, 0xc1, 0x8c, 0xd0, 0xc0, 0xa1, 0x8e, 0x42]);
enum CLSID_D2D1GaussianBlur = GUID(0x1feb6d69, 0x2fe6, 0x4ac9, [0x8c, 0x58, 0x1d, 0x7f, 0x93, 0xe7, 0xa6, 0xa5]);
enum CLSID_D2D1Scale = GUID(0x9daf9369, 0x3846, 0x4d0e, [0xa4, 0x4e, 0xc, 0x60, 0x79, 0x34, 0xa5, 0xd7]);
enum CLSID_D2D1Histogram = GUID(0x881db7d0, 0xf7ee, 0x4d4d, [0xa6, 0xd2, 0x46, 0x97, 0xac, 0xc6, 0x6e, 0xe8]);
enum CLSID_D2D1HueRotation = GUID(0xf4458ec, 0x4b32, 0x491b, [0x9e, 0x85, 0xbd, 0x73, 0xf4, 0x4d, 0x3e, 0xb6]);
enum CLSID_D2D1LinearTransfer = GUID(0xad47c8fd, 0x63ef, 0x4acc, [0x9b, 0x51, 0x67, 0x97, 0x9c, 0x3, 0x6c, 0x6]);
enum CLSID_D2D1LuminanceToAlpha = GUID(0x41251ab7, 0xbeb, 0x46f8, [0x9d, 0xa7, 0x59, 0xe9, 0x3f, 0xcc, 0xe5, 0xde]);
enum CLSID_D2D1Morphology = GUID(0xeae6c40d, 0x626a, 0x4c2d, [0xbf, 0xcb, 0x39, 0x10, 0x1, 0xab, 0xe2, 0x2]);
enum CLSID_D2D1OpacityMetadata = GUID(0x6c53006a, 0x4450, 0x4199, [0xaa, 0x5b, 0xad, 0x16, 0x56, 0xfe, 0xce, 0x5e]);
enum CLSID_D2D1PointDiffuse = GUID(0xb9e303c3, 0xc08c, 0x4f91, [0x8b, 0x7b, 0x38, 0x65, 0x6b, 0xc4, 0x8c, 0x20]);
enum CLSID_D2D1PointSpecular = GUID(0x9c3ca26, 0x3ae2, 0x4f09, [0x9e, 0xbc, 0xed, 0x38, 0x65, 0xd5, 0x3f, 0x22]);
enum CLSID_D2D1Premultiply = GUID(0x6eab419, 0xdeed, 0x4018, [0x80, 0xd2, 0x3e, 0x1d, 0x47, 0x1a, 0xde, 0xb2]);
enum CLSID_D2D1Saturation = GUID(0x5cb2d9cf, 0x327d, 0x459f, [0xa0, 0xce, 0x40, 0xc0, 0xb2, 0x8, 0x6b, 0xf7]);
enum CLSID_D2D1Shadow = GUID(0xc67ea361, 0x1863, 0x4e69, [0x89, 0xdb, 0x69, 0x5d, 0x3e, 0x9a, 0x5b, 0x6b]);
enum CLSID_D2D1SpotDiffuse = GUID(0x818a1105, 0x7932, 0x44f4, [0xaa, 0x86, 0x8, 0xae, 0x7b, 0x2f, 0x2c, 0x93]);
enum CLSID_D2D1SpotSpecular = GUID(0xedae421e, 0x7654, 0x4a37, [0x9d, 0xb8, 0x71, 0xac, 0xc1, 0xbe, 0xb3, 0xc1]);
enum CLSID_D2D1TableTransfer = GUID(0x5bf818c3, 0x5e43, 0x48cb, [0xb6, 0x31, 0x86, 0x83, 0x96, 0xd6, 0xa1, 0xd4]);
enum CLSID_D2D1Tile = GUID(0xb0784138, 0x3b76, 0x4bc5, [0xb1, 0x3b, 0xf, 0xa2, 0xad, 0x2, 0x65, 0x9f]);
enum CLSID_D2D1Turbulence = GUID(0xcf2bb6ae, 0x889a, 0x4ad7, [0xba, 0x29, 0xa2, 0xfd, 0x73, 0x2c, 0x9f, 0xc9]);
enum CLSID_D2D1UnPremultiply = GUID(0xfb9ac489, 0xad8d, 0x41ed, [0x99, 0x99, 0xbb, 0x63, 0x47, 0xd1, 0x10, 0xf7]);
enum CLSID_D2D1YCbCr = GUID(0x99503cc1, 0x66c7, 0x45c9, [0xa8, 0x75, 0x8a, 0xd8, 0xa7, 0x91, 0x44, 0x1]);
enum CLSID_D2D1Contrast = GUID(0xb648a78a, 0xed5, 0x4f80, [0xa9, 0x4a, 0x8e, 0x82, 0x5a, 0xca, 0x6b, 0x77]);
enum CLSID_D2D1RgbToHue = GUID(0x23f3e5ec, 0x91e8, 0x4d3d, [0xad, 0xa, 0xaf, 0xad, 0xc1, 0x0, 0x4a, 0xa1]);
enum CLSID_D2D1HueToRgb = GUID(0x7b78a6bd, 0x141, 0x4def, [0x8a, 0x52, 0x63, 0x56, 0xee, 0xc, 0xbd, 0xd5]);
enum CLSID_D2D1ChromaKey = GUID(0x74c01f5b, 0x2a0d, 0x408c, [0x88, 0xe2, 0xc7, 0xa3, 0xc7, 0x19, 0x77, 0x42]);
enum CLSID_D2D1Emboss = GUID(0xb1c5eb2b, 0x348, 0x43f0, [0x81, 0x7, 0x49, 0x57, 0xca, 0xcb, 0xa2, 0xae]);
enum CLSID_D2D1Exposure = GUID(0xb56c8cfa, 0xf634, 0x41ee, [0xbe, 0xe0, 0xff, 0xa6, 0x17, 0x10, 0x60, 0x4]);
enum CLSID_D2D1Grayscale = GUID(0x36dde0eb, 0x3725, 0x42e0, [0x83, 0x6d, 0x52, 0xfb, 0x20, 0xae, 0xe6, 0x44]);
enum CLSID_D2D1Invert = GUID(0xe0c3784d, 0xcb39, 0x4e84, [0xb6, 0xfd, 0x6b, 0x72, 0xf0, 0x81, 0x2, 0x63]);
enum CLSID_D2D1Posterize = GUID(0x2188945e, 0x33a3, 0x4366, [0xb7, 0xbc, 0x8, 0x6b, 0xd0, 0x2d, 0x8, 0x84]);
enum CLSID_D2D1Sepia = GUID(0x3a1af410, 0x5f1d, 0x4dbe, [0x84, 0xdf, 0x91, 0x5d, 0xa7, 0x9b, 0x71, 0x53]);
enum CLSID_D2D1Sharpen = GUID(0xc9b887cb, 0xc5ff, 0x4dc5, [0x97, 0x79, 0x27, 0x3d, 0xcf, 0x41, 0x7c, 0x7d]);
enum CLSID_D2D1Straighten = GUID(0x4da47b12, 0x79a3, 0x4fb0, [0x82, 0x37, 0xbb, 0xc3, 0xb2, 0xa4, 0xde, 0x8]);
enum CLSID_D2D1TemperatureTint = GUID(0x89176087, 0x8af9, 0x4a08, [0xae, 0xb1, 0x89, 0x5f, 0x38, 0xdb, 0x17, 0x66]);
enum CLSID_D2D1Vignette = GUID(0xc00c40be, 0x5e67, 0x4ca3, [0x95, 0xb4, 0xf4, 0xb0, 0x2c, 0x11, 0x51, 0x35]);
enum CLSID_D2D1EdgeDetection = GUID(0xeff583ca, 0xcb07, 0x4aa9, [0xac, 0x5d, 0x2c, 0xc4, 0x4c, 0x76, 0x46, 0xf]);
enum CLSID_D2D1HighlightsShadows = GUID(0xcadc8384, 0x323f, 0x4c7e, [0xa3, 0x61, 0x2e, 0x2b, 0x24, 0xdf, 0x6e, 0xe4]);
enum CLSID_D2D1LookupTable3D = GUID(0x349e0eda, 0x88, 0x4a79, [0x9c, 0xa3, 0xc7, 0xe3, 0x0, 0x20, 0x20, 0x20]);
enum CLSID_D2D1Opacity = GUID(0x811d79a4, 0xde28, 0x4454, [0x80, 0x94, 0xc6, 0x46, 0x85, 0xf8, 0xbd, 0x4c]);
enum CLSID_D2D1AlphaMask = GUID(0xc80ecff0, 0x3fd5, 0x4f05, [0x83, 0x28, 0xc5, 0xd1, 0x72, 0x4b, 0x4f, 0xa]);
enum CLSID_D2D1CrossFade = GUID(0x12f575e8, 0x4db1, 0x485f, [0x9a, 0x84, 0x3, 0xa0, 0x7d, 0xd3, 0x82, 0x9f]);
enum CLSID_D2D1Tint = GUID(0x36312b17, 0xf7dd, 0x4014, [0x91, 0x5d, 0xff, 0xca, 0x76, 0x8c, 0xf2, 0x11]);
enum D2D1_SCENE_REFERRED_SDR_WHITE_LEVEL = 80.000000;
enum CLSID_D2D1WhiteLevelAdjustment = GUID(0x44a1cadb, 0x6cdd, 0x4818, [0x8f, 0xf4, 0x26, 0xc1, 0xcf, 0xe9, 0x5b, 0xdb]);
enum CLSID_D2D1HdrToneMap = GUID(0x7b0b748d, 0x4610, 0x4486, [0xa9, 0xc, 0x99, 0x9d, 0x9a, 0x2e, 0x2b, 0x11]);
enum D2D1_APPEND_ALIGNED_ELEMENT = 0xffffffff;
enum FACILITY_D2D = 0x00000899;
alias D2D1_INTERPOLATION_MODE_DEFINITION = int;
enum : int
{
    D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR              = 0x00000001,
    D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC               = 0x00000002,
    D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC         = 0x00000004,
    D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_INTERPOLATION_MODE_DEFINITION_FANT                = 0x00000006,
    D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR       = 0x00000007,
}

alias D2D1_GAMMA = uint;
enum : uint
{
    D2D1_GAMMA_2_2         = 0x00000000,
    D2D1_GAMMA_1_0         = 0x00000001,
    D2D1_GAMMA_FORCE_DWORD = 0xffffffff,
}

alias D2D1_OPACITY_MASK_CONTENT = uint;
enum : uint
{
    D2D1_OPACITY_MASK_CONTENT_GRAPHICS            = 0x00000000,
    D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL        = 0x00000001,
    D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE = 0x00000002,
    D2D1_OPACITY_MASK_CONTENT_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_EXTEND_MODE = uint;
enum : uint
{
    D2D1_EXTEND_MODE_CLAMP       = 0x00000000,
    D2D1_EXTEND_MODE_WRAP        = 0x00000001,
    D2D1_EXTEND_MODE_MIRROR      = 0x00000002,
    D2D1_EXTEND_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_ANTIALIAS_MODE = uint;
enum : uint
{
    D2D1_ANTIALIAS_MODE_PER_PRIMITIVE = 0x00000000,
    D2D1_ANTIALIAS_MODE_ALIASED       = 0x00000001,
    D2D1_ANTIALIAS_MODE_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_TEXT_ANTIALIAS_MODE = uint;
enum : uint
{
    D2D1_TEXT_ANTIALIAS_MODE_DEFAULT     = 0x00000000,
    D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE   = 0x00000001,
    D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE   = 0x00000002,
    D2D1_TEXT_ANTIALIAS_MODE_ALIASED     = 0x00000003,
    D2D1_TEXT_ANTIALIAS_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BITMAP_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0x00000000,
    D2D1_BITMAP_INTERPOLATION_MODE_LINEAR           = 0x00000001,
    D2D1_BITMAP_INTERPOLATION_MODE_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_DRAW_TEXT_OPTIONS = uint;
enum : uint
{
    D2D1_DRAW_TEXT_OPTIONS_NO_SNAP                       = 0x00000001,
    D2D1_DRAW_TEXT_OPTIONS_CLIP                          = 0x00000002,
    D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT             = 0x00000004,
    D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING = 0x00000008,
    D2D1_DRAW_TEXT_OPTIONS_NONE                          = 0x00000000,
    D2D1_DRAW_TEXT_OPTIONS_FORCE_DWORD                   = 0xffffffff,
}

struct D2D1_BITMAP_PROPERTIES
{
    D2D1_PIXEL_FORMAT pixelFormat;
    float dpiX;
    float dpiY;
}
struct D2D1_GRADIENT_STOP
{
    float position;
    D2D1_COLOR_F color;
}
struct D2D1_BRUSH_PROPERTIES
{
    float opacity;
    D2D_MATRIX_3X2_F transform;
}
struct D2D1_BITMAP_BRUSH_PROPERTIES
{
    D2D1_EXTEND_MODE extendModeX;
    D2D1_EXTEND_MODE extendModeY;
    D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
}
struct D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES
{
    D2D_POINT_2F startPoint;
    D2D_POINT_2F endPoint;
}
struct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES
{
    D2D_POINT_2F center;
    D2D_POINT_2F gradientOriginOffset;
    float radiusX;
    float radiusY;
}
alias D2D1_ARC_SIZE = uint;
enum : uint
{
    D2D1_ARC_SIZE_SMALL       = 0x00000000,
    D2D1_ARC_SIZE_LARGE       = 0x00000001,
    D2D1_ARC_SIZE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_CAP_STYLE = uint;
enum : uint
{
    D2D1_CAP_STYLE_FLAT        = 0x00000000,
    D2D1_CAP_STYLE_SQUARE      = 0x00000001,
    D2D1_CAP_STYLE_ROUND       = 0x00000002,
    D2D1_CAP_STYLE_TRIANGLE    = 0x00000003,
    D2D1_CAP_STYLE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_DASH_STYLE = uint;
enum : uint
{
    D2D1_DASH_STYLE_SOLID        = 0x00000000,
    D2D1_DASH_STYLE_DASH         = 0x00000001,
    D2D1_DASH_STYLE_DOT          = 0x00000002,
    D2D1_DASH_STYLE_DASH_DOT     = 0x00000003,
    D2D1_DASH_STYLE_DASH_DOT_DOT = 0x00000004,
    D2D1_DASH_STYLE_CUSTOM       = 0x00000005,
    D2D1_DASH_STYLE_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_LINE_JOIN = uint;
enum : uint
{
    D2D1_LINE_JOIN_MITER          = 0x00000000,
    D2D1_LINE_JOIN_BEVEL          = 0x00000001,
    D2D1_LINE_JOIN_ROUND          = 0x00000002,
    D2D1_LINE_JOIN_MITER_OR_BEVEL = 0x00000003,
    D2D1_LINE_JOIN_FORCE_DWORD    = 0xffffffff,
}

alias D2D1_COMBINE_MODE = uint;
enum : uint
{
    D2D1_COMBINE_MODE_UNION       = 0x00000000,
    D2D1_COMBINE_MODE_INTERSECT   = 0x00000001,
    D2D1_COMBINE_MODE_XOR         = 0x00000002,
    D2D1_COMBINE_MODE_EXCLUDE     = 0x00000003,
    D2D1_COMBINE_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_GEOMETRY_RELATION = uint;
enum : uint
{
    D2D1_GEOMETRY_RELATION_UNKNOWN      = 0x00000000,
    D2D1_GEOMETRY_RELATION_DISJOINT     = 0x00000001,
    D2D1_GEOMETRY_RELATION_IS_CONTAINED = 0x00000002,
    D2D1_GEOMETRY_RELATION_CONTAINS     = 0x00000003,
    D2D1_GEOMETRY_RELATION_OVERLAP      = 0x00000004,
    D2D1_GEOMETRY_RELATION_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_GEOMETRY_SIMPLIFICATION_OPTION = uint;
enum : uint
{
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES = 0x00000000,
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES            = 0x00000001,
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_FORCE_DWORD      = 0xffffffff,
}

struct D2D1_TRIANGLE
{
    D2D_POINT_2F point1;
    D2D_POINT_2F point2;
    D2D_POINT_2F point3;
}
alias D2D1_SWEEP_DIRECTION = uint;
enum : uint
{
    D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE = 0x00000000,
    D2D1_SWEEP_DIRECTION_CLOCKWISE         = 0x00000001,
    D2D1_SWEEP_DIRECTION_FORCE_DWORD       = 0xffffffff,
}

struct D2D1_ARC_SEGMENT
{
    D2D_POINT_2F point;
    D2D_SIZE_F size;
    float rotationAngle;
    D2D1_SWEEP_DIRECTION sweepDirection;
    D2D1_ARC_SIZE arcSize;
}
struct D2D1_QUADRATIC_BEZIER_SEGMENT
{
    D2D_POINT_2F point1;
    D2D_POINT_2F point2;
}
struct D2D1_ELLIPSE
{
    D2D_POINT_2F point;
    float radiusX;
    float radiusY;
}
struct D2D1_ROUNDED_RECT
{
    D2D_RECT_F rect;
    float radiusX;
    float radiusY;
}
struct D2D1_STROKE_STYLE_PROPERTIES
{
    D2D1_CAP_STYLE startCap;
    D2D1_CAP_STYLE endCap;
    D2D1_CAP_STYLE dashCap;
    D2D1_LINE_JOIN lineJoin;
    float miterLimit;
    D2D1_DASH_STYLE dashStyle;
    float dashOffset;
}
alias D2D1_LAYER_OPTIONS = uint;
enum : uint
{
    D2D1_LAYER_OPTIONS_NONE                     = 0x00000000,
    D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE = 0x00000001,
    D2D1_LAYER_OPTIONS_FORCE_DWORD              = 0xffffffff,
}

struct D2D1_LAYER_PARAMETERS
{
    D2D_RECT_F contentBounds;
    ID2D1Geometry geometricMask;
    D2D1_ANTIALIAS_MODE maskAntialiasMode;
    D2D_MATRIX_3X2_F maskTransform;
    float opacity;
    ID2D1Brush opacityBrush;
    D2D1_LAYER_OPTIONS layerOptions;
}
alias D2D1_WINDOW_STATE = uint;
enum : uint
{
    D2D1_WINDOW_STATE_NONE        = 0x00000000,
    D2D1_WINDOW_STATE_OCCLUDED    = 0x00000001,
    D2D1_WINDOW_STATE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_RENDER_TARGET_TYPE = uint;
enum : uint
{
    D2D1_RENDER_TARGET_TYPE_DEFAULT     = 0x00000000,
    D2D1_RENDER_TARGET_TYPE_SOFTWARE    = 0x00000001,
    D2D1_RENDER_TARGET_TYPE_HARDWARE    = 0x00000002,
    D2D1_RENDER_TARGET_TYPE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_FEATURE_LEVEL = uint;
enum : uint
{
    D2D1_FEATURE_LEVEL_DEFAULT     = 0x00000000,
    D2D1_FEATURE_LEVEL_9           = 0x00009100,
    D2D1_FEATURE_LEVEL_10          = 0x0000a000,
    D2D1_FEATURE_LEVEL_FORCE_DWORD = 0xffffffff,
}

alias D2D1_RENDER_TARGET_USAGE = uint;
enum : uint
{
    D2D1_RENDER_TARGET_USAGE_NONE                  = 0x00000000,
    D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING = 0x00000001,
    D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE        = 0x00000002,
    D2D1_RENDER_TARGET_USAGE_FORCE_DWORD           = 0xffffffff,
}

alias D2D1_PRESENT_OPTIONS = uint;
enum : uint
{
    D2D1_PRESENT_OPTIONS_NONE            = 0x00000000,
    D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS = 0x00000001,
    D2D1_PRESENT_OPTIONS_IMMEDIATELY     = 0x00000002,
    D2D1_PRESENT_OPTIONS_FORCE_DWORD     = 0xffffffff,
}

struct D2D1_RENDER_TARGET_PROPERTIES
{
    D2D1_RENDER_TARGET_TYPE type;
    D2D1_PIXEL_FORMAT pixelFormat;
    float dpiX;
    float dpiY;
    D2D1_RENDER_TARGET_USAGE usage;
    D2D1_FEATURE_LEVEL minLevel;
}
struct D2D1_HWND_RENDER_TARGET_PROPERTIES
{
    HWND hwnd;
    D2D_SIZE_U pixelSize;
    D2D1_PRESENT_OPTIONS presentOptions;
}
alias D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS = uint;
enum : uint
{
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE           = 0x00000000,
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE = 0x00000001,
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_FORCE_DWORD    = 0xffffffff,
}

struct D2D1_DRAWING_STATE_DESCRIPTION
{
    D2D1_ANTIALIAS_MODE antialiasMode;
    D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
    ulong tag1;
    ulong tag2;
    D2D_MATRIX_3X2_F transform;
}
alias D2D1_DC_INITIALIZE_MODE = uint;
enum : uint
{
    D2D1_DC_INITIALIZE_MODE_COPY        = 0x00000000,
    D2D1_DC_INITIALIZE_MODE_CLEAR       = 0x00000001,
    D2D1_DC_INITIALIZE_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_DEBUG_LEVEL = uint;
enum : uint
{
    D2D1_DEBUG_LEVEL_NONE        = 0x00000000,
    D2D1_DEBUG_LEVEL_ERROR       = 0x00000001,
    D2D1_DEBUG_LEVEL_WARNING     = 0x00000002,
    D2D1_DEBUG_LEVEL_INFORMATION = 0x00000003,
    D2D1_DEBUG_LEVEL_FORCE_DWORD = 0xffffffff,
}

alias D2D1_FACTORY_TYPE = uint;
enum : uint
{
    D2D1_FACTORY_TYPE_SINGLE_THREADED = 0x00000000,
    D2D1_FACTORY_TYPE_MULTI_THREADED  = 0x00000001,
    D2D1_FACTORY_TYPE_FORCE_DWORD     = 0xffffffff,
}

struct D2D1_FACTORY_OPTIONS
{
    D2D1_DEBUG_LEVEL debugLevel;
}
enum IID_ID2D1Resource = GUID(0x2cd90691, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1Resource : IUnknown
{
    void GetFactory(ID2D1Factory*);
}
enum IID_ID2D1Image = GUID(0x65019f75, 0x8da2, 0x497c, [0xb3, 0x2c, 0xdf, 0xa3, 0x4e, 0x48, 0xed, 0xe6]);
interface ID2D1Image : ID2D1Resource
{
}
enum IID_ID2D1Bitmap = GUID(0xa2296057, 0xea42, 0x4099, [0x98, 0x3b, 0x53, 0x9f, 0xb6, 0x50, 0x54, 0x26]);
interface ID2D1Bitmap : ID2D1Image
{
    void GetSize(D2D_SIZE_F*); // ABI bug workaround
    void GetPixelSize(D2D_SIZE_U*); // ABI bug workaround
    void GetPixelFormat(D2D1_PIXEL_FORMAT*); // ABI bug workaround
    void GetDpi(float*, float*);
    HRESULT CopyFromBitmap(const(D2D_POINT_2U)*, ID2D1Bitmap, const(D2D_RECT_U)*);
    HRESULT CopyFromRenderTarget(const(D2D_POINT_2U)*, ID2D1RenderTarget, const(D2D_RECT_U)*);
    HRESULT CopyFromMemory(const(D2D_RECT_U)*, const(void)*, uint);
}
enum IID_ID2D1GradientStopCollection = GUID(0x2cd906a7, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1GradientStopCollection : ID2D1Resource
{
    uint GetGradientStopCount();
    void GetGradientStops(D2D1_GRADIENT_STOP*, uint);
    D2D1_GAMMA GetColorInterpolationGamma();
    D2D1_EXTEND_MODE GetExtendMode();
}
enum IID_ID2D1Brush = GUID(0x2cd906a8, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1Brush : ID2D1Resource
{
    void SetOpacity(float);
    void SetTransform(const(D2D_MATRIX_3X2_F)*);
    float GetOpacity();
    void GetTransform(D2D_MATRIX_3X2_F*);
}
enum IID_ID2D1BitmapBrush = GUID(0x2cd906aa, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1BitmapBrush : ID2D1Brush
{
    void SetExtendModeX(D2D1_EXTEND_MODE);
    void SetExtendModeY(D2D1_EXTEND_MODE);
    void SetInterpolationMode(D2D1_BITMAP_INTERPOLATION_MODE);
    void SetBitmap(ID2D1Bitmap);
    D2D1_EXTEND_MODE GetExtendModeX();
    D2D1_EXTEND_MODE GetExtendModeY();
    D2D1_BITMAP_INTERPOLATION_MODE GetInterpolationMode();
    void GetBitmap(ID2D1Bitmap*);
}
enum IID_ID2D1SolidColorBrush = GUID(0x2cd906a9, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1SolidColorBrush : ID2D1Brush
{
    void SetColor(const(D2D1_COLOR_F)*);
    D2D1_COLOR_F GetColor();
}
enum IID_ID2D1LinearGradientBrush = GUID(0x2cd906ab, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1LinearGradientBrush : ID2D1Brush
{
    void SetStartPoint(D2D_POINT_2F);
    void SetEndPoint(D2D_POINT_2F);
    D2D_POINT_2F GetStartPoint();
    D2D_POINT_2F GetEndPoint();
    void GetGradientStopCollection(ID2D1GradientStopCollection*);
}
enum IID_ID2D1RadialGradientBrush = GUID(0x2cd906ac, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1RadialGradientBrush : ID2D1Brush
{
    void SetCenter(D2D_POINT_2F);
    void SetGradientOriginOffset(D2D_POINT_2F);
    void SetRadiusX(float);
    void SetRadiusY(float);
    D2D_POINT_2F GetCenter();
    D2D_POINT_2F GetGradientOriginOffset();
    float GetRadiusX();
    float GetRadiusY();
    void GetGradientStopCollection(ID2D1GradientStopCollection*);
}
enum IID_ID2D1StrokeStyle = GUID(0x2cd9069d, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1StrokeStyle : ID2D1Resource
{
    D2D1_CAP_STYLE GetStartCap();
    D2D1_CAP_STYLE GetEndCap();
    D2D1_CAP_STYLE GetDashCap();
    float GetMiterLimit();
    D2D1_LINE_JOIN GetLineJoin();
    float GetDashOffset();
    D2D1_DASH_STYLE GetDashStyle();
    uint GetDashesCount();
    void GetDashes(float*, uint);
}
enum IID_ID2D1Geometry = GUID(0x2cd906a1, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1Geometry : ID2D1Resource
{
    HRESULT GetBounds(const(D2D_MATRIX_3X2_F)*, D2D_RECT_F*);
    HRESULT GetWidenedBounds(float, ID2D1StrokeStyle, const(D2D_MATRIX_3X2_F)*, float, D2D_RECT_F*);
    HRESULT StrokeContainsPoint(D2D_POINT_2F, float, ID2D1StrokeStyle, const(D2D_MATRIX_3X2_F)*, float, BOOL*);
    HRESULT FillContainsPoint(D2D_POINT_2F, const(D2D_MATRIX_3X2_F)*, float, BOOL*);
    HRESULT CompareWithGeometry(ID2D1Geometry, const(D2D_MATRIX_3X2_F)*, float, D2D1_GEOMETRY_RELATION*);
    HRESULT Simplify(D2D1_GEOMETRY_SIMPLIFICATION_OPTION, const(D2D_MATRIX_3X2_F)*, float, ID2D1SimplifiedGeometrySink);
    HRESULT Tessellate(const(D2D_MATRIX_3X2_F)*, float, ID2D1TessellationSink);
    HRESULT CombineWithGeometry(ID2D1Geometry, D2D1_COMBINE_MODE, const(D2D_MATRIX_3X2_F)*, float, ID2D1SimplifiedGeometrySink);
    HRESULT Outline(const(D2D_MATRIX_3X2_F)*, float, ID2D1SimplifiedGeometrySink);
    HRESULT ComputeArea(const(D2D_MATRIX_3X2_F)*, float, float*);
    HRESULT ComputeLength(const(D2D_MATRIX_3X2_F)*, float, float*);
    HRESULT ComputePointAtLength(float, const(D2D_MATRIX_3X2_F)*, float, D2D_POINT_2F*, D2D_POINT_2F*);
    HRESULT Widen(float, ID2D1StrokeStyle, const(D2D_MATRIX_3X2_F)*, float, ID2D1SimplifiedGeometrySink);
}
enum IID_ID2D1RectangleGeometry = GUID(0x2cd906a2, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1RectangleGeometry : ID2D1Geometry
{
    void GetRect(D2D_RECT_F*);
}
enum IID_ID2D1RoundedRectangleGeometry = GUID(0x2cd906a3, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1RoundedRectangleGeometry : ID2D1Geometry
{
    void GetRoundedRect(D2D1_ROUNDED_RECT*);
}
enum IID_ID2D1EllipseGeometry = GUID(0x2cd906a4, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1EllipseGeometry : ID2D1Geometry
{
    void GetEllipse(D2D1_ELLIPSE*);
}
enum IID_ID2D1GeometryGroup = GUID(0x2cd906a6, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1GeometryGroup : ID2D1Geometry
{
    D2D1_FILL_MODE GetFillMode();
    uint GetSourceGeometryCount();
    void GetSourceGeometries(ID2D1Geometry*, uint);
}
enum IID_ID2D1TransformedGeometry = GUID(0x2cd906bb, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1TransformedGeometry : ID2D1Geometry
{
    void GetSourceGeometry(ID2D1Geometry*);
    void GetTransform(D2D_MATRIX_3X2_F*);
}
enum IID_ID2D1GeometrySink = GUID(0x2cd9069f, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1GeometrySink : ID2D1SimplifiedGeometrySink
{
    void AddLine(D2D_POINT_2F);
    void AddBezier(const(D2D1_BEZIER_SEGMENT)*);
    void AddQuadraticBezier(const(D2D1_QUADRATIC_BEZIER_SEGMENT)*);
    void AddQuadraticBeziers(const(D2D1_QUADRATIC_BEZIER_SEGMENT)*, uint);
    void AddArc(const(D2D1_ARC_SEGMENT)*);
}
enum IID_ID2D1TessellationSink = GUID(0x2cd906c1, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1TessellationSink : IUnknown
{
    void AddTriangles(const(D2D1_TRIANGLE)*, uint);
    HRESULT Close();
}
enum IID_ID2D1PathGeometry = GUID(0x2cd906a5, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1PathGeometry : ID2D1Geometry
{
    HRESULT Open(ID2D1GeometrySink*);
    HRESULT Stream(ID2D1GeometrySink);
    HRESULT GetSegmentCount(uint*);
    HRESULT GetFigureCount(uint*);
}
enum IID_ID2D1Mesh = GUID(0x2cd906c2, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1Mesh : ID2D1Resource
{
    HRESULT Open(ID2D1TessellationSink*);
}
enum IID_ID2D1Layer = GUID(0x2cd9069b, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1Layer : ID2D1Resource
{
    D2D_SIZE_F GetSize();
}
enum IID_ID2D1DrawingStateBlock = GUID(0x28506e39, 0xebf6, 0x46a1, [0xbb, 0x47, 0xfd, 0x85, 0x56, 0x5a, 0xb9, 0x57]);
interface ID2D1DrawingStateBlock : ID2D1Resource
{
    void GetDescription(D2D1_DRAWING_STATE_DESCRIPTION*);
    void SetDescription(const(D2D1_DRAWING_STATE_DESCRIPTION)*);
    void SetTextRenderingParams(IDWriteRenderingParams);
    void GetTextRenderingParams(IDWriteRenderingParams*);
}
enum IID_ID2D1RenderTarget = GUID(0x2cd90694, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1RenderTarget : ID2D1Resource
{
    HRESULT CreateBitmap(D2D_SIZE_U, const(void)*, uint, const(D2D1_BITMAP_PROPERTIES)*, ID2D1Bitmap*);
    HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource, const(D2D1_BITMAP_PROPERTIES)*, ID2D1Bitmap*);
    HRESULT CreateSharedBitmap(const(GUID)*, void*, const(D2D1_BITMAP_PROPERTIES)*, ID2D1Bitmap*);
    HRESULT CreateBitmapBrush(ID2D1Bitmap, const(D2D1_BITMAP_BRUSH_PROPERTIES)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1BitmapBrush*);
    HRESULT CreateSolidColorBrush(const(D2D1_COLOR_F)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1SolidColorBrush*);
    HRESULT CreateGradientStopCollection(const(D2D1_GRADIENT_STOP)*, uint, D2D1_GAMMA, D2D1_EXTEND_MODE, ID2D1GradientStopCollection*);
    HRESULT CreateLinearGradientBrush(const(D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1GradientStopCollection, ID2D1LinearGradientBrush*);
    HRESULT CreateRadialGradientBrush(const(D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1GradientStopCollection, ID2D1RadialGradientBrush*);
    HRESULT CreateCompatibleRenderTarget(const(D2D_SIZE_F)*, const(D2D_SIZE_U)*, const(D2D1_PIXEL_FORMAT)*, D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS, ID2D1BitmapRenderTarget*);
    HRESULT CreateLayer(const(D2D_SIZE_F)*, ID2D1Layer*);
    HRESULT CreateMesh(ID2D1Mesh*);
    void DrawLine(D2D_POINT_2F, D2D_POINT_2F, ID2D1Brush, float, ID2D1StrokeStyle);
    void DrawRectangle(const(D2D_RECT_F)*, ID2D1Brush, float, ID2D1StrokeStyle);
    void FillRectangle(const(D2D_RECT_F)*, ID2D1Brush);
    void DrawRoundedRectangle(const(D2D1_ROUNDED_RECT)*, ID2D1Brush, float, ID2D1StrokeStyle);
    void FillRoundedRectangle(const(D2D1_ROUNDED_RECT)*, ID2D1Brush);
    void DrawEllipse(const(D2D1_ELLIPSE)*, ID2D1Brush, float, ID2D1StrokeStyle);
    void FillEllipse(const(D2D1_ELLIPSE)*, ID2D1Brush);
    void DrawGeometry(ID2D1Geometry, ID2D1Brush, float, ID2D1StrokeStyle);
    void FillGeometry(ID2D1Geometry, ID2D1Brush, ID2D1Brush);
    void FillMesh(ID2D1Mesh, ID2D1Brush);
    void FillOpacityMask(ID2D1Bitmap, ID2D1Brush, D2D1_OPACITY_MASK_CONTENT, const(D2D_RECT_F)*, const(D2D_RECT_F)*);
    void DrawBitmap(ID2D1Bitmap, const(D2D_RECT_F)*, float, D2D1_BITMAP_INTERPOLATION_MODE, const(D2D_RECT_F)*);
    void DrawText(const(wchar)*, uint, IDWriteTextFormat, const(D2D_RECT_F)*, ID2D1Brush, D2D1_DRAW_TEXT_OPTIONS, DWRITE_MEASURING_MODE);
    void DrawTextLayout(D2D_POINT_2F, IDWriteTextLayout, ID2D1Brush, D2D1_DRAW_TEXT_OPTIONS);
    void DrawGlyphRun(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, ID2D1Brush, DWRITE_MEASURING_MODE);
    void SetTransform(const(D2D_MATRIX_3X2_F)*);
    void GetTransform(D2D_MATRIX_3X2_F*);
    void SetAntialiasMode(D2D1_ANTIALIAS_MODE);
    D2D1_ANTIALIAS_MODE GetAntialiasMode();
    void SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE);
    D2D1_TEXT_ANTIALIAS_MODE GetTextAntialiasMode();
    void SetTextRenderingParams(IDWriteRenderingParams);
    void GetTextRenderingParams(IDWriteRenderingParams*);
    void SetTags(ulong, ulong);
    void GetTags(ulong*, ulong*);
    void PushLayer(const(D2D1_LAYER_PARAMETERS)*, ID2D1Layer);
    void PopLayer();
    HRESULT Flush(ulong*, ulong*);
    void SaveDrawingState(ID2D1DrawingStateBlock);
    void RestoreDrawingState(ID2D1DrawingStateBlock);
    void PushAxisAlignedClip(const(D2D_RECT_F)*, D2D1_ANTIALIAS_MODE);
    void PopAxisAlignedClip();
    void Clear(const(D2D1_COLOR_F)*);
    void BeginDraw();
    HRESULT EndDraw(ulong*, ulong*);
    void GetPixelFormat(D2D1_PIXEL_FORMAT*); // ABI bug workaround
    void SetDpi(float, float);
    void GetDpi(float*, float*);
    void GetSize(D2D_SIZE_F*); // ABI bug workaround
    void GetPixelSize(D2D_SIZE_U*); // ABI bug workaround
    uint GetMaximumBitmapSize();
    BOOL IsSupported(const(D2D1_RENDER_TARGET_PROPERTIES)*);
}
enum IID_ID2D1BitmapRenderTarget = GUID(0x2cd90695, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1BitmapRenderTarget : ID2D1RenderTarget
{
    HRESULT GetBitmap(ID2D1Bitmap*);
}
enum IID_ID2D1HwndRenderTarget = GUID(0x2cd90698, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1HwndRenderTarget : ID2D1RenderTarget
{
    D2D1_WINDOW_STATE CheckWindowState();
    HRESULT Resize(const(D2D_SIZE_U)*);
    HWND GetHwnd();
}
enum IID_ID2D1GdiInteropRenderTarget = GUID(0xe0db51c3, 0x6f77, 0x4bae, [0xb3, 0xd5, 0xe4, 0x75, 0x9, 0xb3, 0x58, 0x38]);
interface ID2D1GdiInteropRenderTarget : IUnknown
{
    HRESULT GetDC(D2D1_DC_INITIALIZE_MODE, HDC*);
    HRESULT ReleaseDC(const(RECT)*);
}
enum IID_ID2D1DCRenderTarget = GUID(0x1c51bc64, 0xde61, 0x46fd, [0x98, 0x99, 0x63, 0xa5, 0xd8, 0xf0, 0x39, 0x50]);
interface ID2D1DCRenderTarget : ID2D1RenderTarget
{
    HRESULT BindDC(const(HDC), const(RECT)*);
}
enum IID_ID2D1Factory = GUID(0x6152247, 0x6f50, 0x465a, [0x92, 0x45, 0x11, 0x8b, 0xfd, 0x3b, 0x60, 0x7]);
interface ID2D1Factory : IUnknown
{
    HRESULT ReloadSystemMetrics();
    void GetDesktopDpi(float*, float*);
    HRESULT CreateRectangleGeometry(const(D2D_RECT_F)*, ID2D1RectangleGeometry*);
    HRESULT CreateRoundedRectangleGeometry(const(D2D1_ROUNDED_RECT)*, ID2D1RoundedRectangleGeometry*);
    HRESULT CreateEllipseGeometry(const(D2D1_ELLIPSE)*, ID2D1EllipseGeometry*);
    HRESULT CreateGeometryGroup(D2D1_FILL_MODE, ID2D1Geometry*, uint, ID2D1GeometryGroup*);
    HRESULT CreateTransformedGeometry(ID2D1Geometry, const(D2D_MATRIX_3X2_F)*, ID2D1TransformedGeometry*);
    HRESULT CreatePathGeometry(ID2D1PathGeometry*);
    HRESULT CreateStrokeStyle(const(D2D1_STROKE_STYLE_PROPERTIES)*, const(float)*, uint, ID2D1StrokeStyle*);
    HRESULT CreateDrawingStateBlock(const(D2D1_DRAWING_STATE_DESCRIPTION)*, IDWriteRenderingParams, ID2D1DrawingStateBlock*);
    HRESULT CreateWicBitmapRenderTarget(IWICBitmap, const(D2D1_RENDER_TARGET_PROPERTIES)*, ID2D1RenderTarget*);
    HRESULT CreateHwndRenderTarget(const(D2D1_RENDER_TARGET_PROPERTIES)*, const(D2D1_HWND_RENDER_TARGET_PROPERTIES)*, ID2D1HwndRenderTarget*);
    HRESULT CreateDxgiSurfaceRenderTarget(IDXGISurface, const(D2D1_RENDER_TARGET_PROPERTIES)*, ID2D1RenderTarget*);
    HRESULT CreateDCRenderTarget(const(D2D1_RENDER_TARGET_PROPERTIES)*, ID2D1DCRenderTarget*);
}
alias D2D1_CHANNEL_SELECTOR = uint;
enum : uint
{
    D2D1_CHANNEL_SELECTOR_R           = 0x00000000,
    D2D1_CHANNEL_SELECTOR_G           = 0x00000001,
    D2D1_CHANNEL_SELECTOR_B           = 0x00000002,
    D2D1_CHANNEL_SELECTOR_A           = 0x00000003,
    D2D1_CHANNEL_SELECTOR_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BITMAPSOURCE_ORIENTATION = uint;
enum : uint
{
    D2D1_BITMAPSOURCE_ORIENTATION_DEFAULT                             = 0x00000001,
    D2D1_BITMAPSOURCE_ORIENTATION_FLIP_HORIZONTAL                     = 0x00000002,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE180                 = 0x00000003,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 0x00000004,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 0x00000005,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE90                  = 0x00000006,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE90_FLIP_HORIZONTAL  = 0x00000007,
    D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE270                 = 0x00000008,
    D2D1_BITMAPSOURCE_ORIENTATION_FORCE_DWORD                         = 0xffffffff,
}

alias D2D1_GAUSSIANBLUR_PROP = uint;
enum : uint
{
    D2D1_GAUSSIANBLUR_PROP_STANDARD_DEVIATION = 0x00000000,
    D2D1_GAUSSIANBLUR_PROP_OPTIMIZATION       = 0x00000001,
    D2D1_GAUSSIANBLUR_PROP_BORDER_MODE        = 0x00000002,
    D2D1_GAUSSIANBLUR_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_GAUSSIANBLUR_OPTIMIZATION = uint;
enum : uint
{
    D2D1_GAUSSIANBLUR_OPTIMIZATION_SPEED       = 0x00000000,
    D2D1_GAUSSIANBLUR_OPTIMIZATION_BALANCED    = 0x00000001,
    D2D1_GAUSSIANBLUR_OPTIMIZATION_QUALITY     = 0x00000002,
    D2D1_GAUSSIANBLUR_OPTIMIZATION_FORCE_DWORD = 0xffffffff,
}

alias D2D1_DIRECTIONALBLUR_PROP = uint;
enum : uint
{
    D2D1_DIRECTIONALBLUR_PROP_STANDARD_DEVIATION = 0x00000000,
    D2D1_DIRECTIONALBLUR_PROP_ANGLE              = 0x00000001,
    D2D1_DIRECTIONALBLUR_PROP_OPTIMIZATION       = 0x00000002,
    D2D1_DIRECTIONALBLUR_PROP_BORDER_MODE        = 0x00000003,
    D2D1_DIRECTIONALBLUR_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_DIRECTIONALBLUR_OPTIMIZATION = uint;
enum : uint
{
    D2D1_DIRECTIONALBLUR_OPTIMIZATION_SPEED       = 0x00000000,
    D2D1_DIRECTIONALBLUR_OPTIMIZATION_BALANCED    = 0x00000001,
    D2D1_DIRECTIONALBLUR_OPTIMIZATION_QUALITY     = 0x00000002,
    D2D1_DIRECTIONALBLUR_OPTIMIZATION_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SHADOW_PROP = uint;
enum : uint
{
    D2D1_SHADOW_PROP_BLUR_STANDARD_DEVIATION = 0x00000000,
    D2D1_SHADOW_PROP_COLOR                   = 0x00000001,
    D2D1_SHADOW_PROP_OPTIMIZATION            = 0x00000002,
    D2D1_SHADOW_PROP_FORCE_DWORD             = 0xffffffff,
}

alias D2D1_SHADOW_OPTIMIZATION = uint;
enum : uint
{
    D2D1_SHADOW_OPTIMIZATION_SPEED       = 0x00000000,
    D2D1_SHADOW_OPTIMIZATION_BALANCED    = 0x00000001,
    D2D1_SHADOW_OPTIMIZATION_QUALITY     = 0x00000002,
    D2D1_SHADOW_OPTIMIZATION_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BLEND_PROP = uint;
enum : uint
{
    D2D1_BLEND_PROP_MODE        = 0x00000000,
    D2D1_BLEND_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SATURATION_PROP = uint;
enum : uint
{
    D2D1_SATURATION_PROP_SATURATION  = 0x00000000,
    D2D1_SATURATION_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_HUEROTATION_PROP = uint;
enum : uint
{
    D2D1_HUEROTATION_PROP_ANGLE       = 0x00000000,
    D2D1_HUEROTATION_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_COLORMATRIX_PROP = uint;
enum : uint
{
    D2D1_COLORMATRIX_PROP_COLOR_MATRIX = 0x00000000,
    D2D1_COLORMATRIX_PROP_ALPHA_MODE   = 0x00000001,
    D2D1_COLORMATRIX_PROP_CLAMP_OUTPUT = 0x00000002,
    D2D1_COLORMATRIX_PROP_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_BITMAPSOURCE_PROP = uint;
enum : uint
{
    D2D1_BITMAPSOURCE_PROP_WIC_BITMAP_SOURCE     = 0x00000000,
    D2D1_BITMAPSOURCE_PROP_SCALE                 = 0x00000001,
    D2D1_BITMAPSOURCE_PROP_INTERPOLATION_MODE    = 0x00000002,
    D2D1_BITMAPSOURCE_PROP_ENABLE_DPI_CORRECTION = 0x00000003,
    D2D1_BITMAPSOURCE_PROP_ALPHA_MODE            = 0x00000004,
    D2D1_BITMAPSOURCE_PROP_ORIENTATION           = 0x00000005,
    D2D1_BITMAPSOURCE_PROP_FORCE_DWORD           = 0xffffffff,
}

alias D2D1_BITMAPSOURCE_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0x00000000,
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_LINEAR           = 0x00000001,
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_CUBIC            = 0x00000002,
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_FANT             = 0x00000006,
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_MIPMAP_LINEAR    = 0x00000007,
    D2D1_BITMAPSOURCE_INTERPOLATION_MODE_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_BITMAPSOURCE_ALPHA_MODE = uint;
enum : uint
{
    D2D1_BITMAPSOURCE_ALPHA_MODE_PREMULTIPLIED = 0x00000001,
    D2D1_BITMAPSOURCE_ALPHA_MODE_STRAIGHT      = 0x00000002,
    D2D1_BITMAPSOURCE_ALPHA_MODE_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_COMPOSITE_PROP = uint;
enum : uint
{
    D2D1_COMPOSITE_PROP_MODE        = 0x00000000,
    D2D1_COMPOSITE_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_3DTRANSFORM_PROP = uint;
enum : uint
{
    D2D1_3DTRANSFORM_PROP_INTERPOLATION_MODE = 0x00000000,
    D2D1_3DTRANSFORM_PROP_BORDER_MODE        = 0x00000001,
    D2D1_3DTRANSFORM_PROP_TRANSFORM_MATRIX   = 0x00000002,
    D2D1_3DTRANSFORM_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_3DTRANSFORM_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_3DTRANSFORM_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_3DPERSPECTIVETRANSFORM_PROP = uint;
enum : uint
{
    D2D1_3DPERSPECTIVETRANSFORM_PROP_INTERPOLATION_MODE = 0x00000000,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_BORDER_MODE        = 0x00000001,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_DEPTH              = 0x00000002,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_PERSPECTIVE_ORIGIN = 0x00000003,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_LOCAL_OFFSET       = 0x00000004,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_GLOBAL_OFFSET      = 0x00000005,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_ROTATION_ORIGIN    = 0x00000006,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_ROTATION           = 0x00000007,
    D2D1_3DPERSPECTIVETRANSFORM_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_2DAFFINETRANSFORM_PROP = uint;
enum : uint
{
    D2D1_2DAFFINETRANSFORM_PROP_INTERPOLATION_MODE = 0x00000000,
    D2D1_2DAFFINETRANSFORM_PROP_BORDER_MODE        = 0x00000001,
    D2D1_2DAFFINETRANSFORM_PROP_TRANSFORM_MATRIX   = 0x00000002,
    D2D1_2DAFFINETRANSFORM_PROP_SHARPNESS          = 0x00000003,
    D2D1_2DAFFINETRANSFORM_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_DPICOMPENSATION_PROP = uint;
enum : uint
{
    D2D1_DPICOMPENSATION_PROP_INTERPOLATION_MODE = 0x00000000,
    D2D1_DPICOMPENSATION_PROP_BORDER_MODE        = 0x00000001,
    D2D1_DPICOMPENSATION_PROP_INPUT_DPI          = 0x00000002,
    D2D1_DPICOMPENSATION_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_DPICOMPENSATION_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_DPICOMPENSATION_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SCALE_PROP = uint;
enum : uint
{
    D2D1_SCALE_PROP_SCALE              = 0x00000000,
    D2D1_SCALE_PROP_CENTER_POINT       = 0x00000001,
    D2D1_SCALE_PROP_INTERPOLATION_MODE = 0x00000002,
    D2D1_SCALE_PROP_BORDER_MODE        = 0x00000003,
    D2D1_SCALE_PROP_SHARPNESS          = 0x00000004,
    D2D1_SCALE_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_SCALE_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_SCALE_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_SCALE_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_SCALE_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_SCALE_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_SCALE_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_SCALE_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_SCALE_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_TURBULENCE_PROP = uint;
enum : uint
{
    D2D1_TURBULENCE_PROP_OFFSET         = 0x00000000,
    D2D1_TURBULENCE_PROP_SIZE           = 0x00000001,
    D2D1_TURBULENCE_PROP_BASE_FREQUENCY = 0x00000002,
    D2D1_TURBULENCE_PROP_NUM_OCTAVES    = 0x00000003,
    D2D1_TURBULENCE_PROP_SEED           = 0x00000004,
    D2D1_TURBULENCE_PROP_NOISE          = 0x00000005,
    D2D1_TURBULENCE_PROP_STITCHABLE     = 0x00000006,
    D2D1_TURBULENCE_PROP_FORCE_DWORD    = 0xffffffff,
}

alias D2D1_DISPLACEMENTMAP_PROP = uint;
enum : uint
{
    D2D1_DISPLACEMENTMAP_PROP_SCALE            = 0x00000000,
    D2D1_DISPLACEMENTMAP_PROP_X_CHANNEL_SELECT = 0x00000001,
    D2D1_DISPLACEMENTMAP_PROP_Y_CHANNEL_SELECT = 0x00000002,
    D2D1_DISPLACEMENTMAP_PROP_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_COLORMANAGEMENT_PROP = uint;
enum : uint
{
    D2D1_COLORMANAGEMENT_PROP_SOURCE_COLOR_CONTEXT         = 0x00000000,
    D2D1_COLORMANAGEMENT_PROP_SOURCE_RENDERING_INTENT      = 0x00000001,
    D2D1_COLORMANAGEMENT_PROP_DESTINATION_COLOR_CONTEXT    = 0x00000002,
    D2D1_COLORMANAGEMENT_PROP_DESTINATION_RENDERING_INTENT = 0x00000003,
    D2D1_COLORMANAGEMENT_PROP_ALPHA_MODE                   = 0x00000004,
    D2D1_COLORMANAGEMENT_PROP_QUALITY                      = 0x00000005,
    D2D1_COLORMANAGEMENT_PROP_FORCE_DWORD                  = 0xffffffff,
}

alias D2D1_COLORMANAGEMENT_ALPHA_MODE = uint;
enum : uint
{
    D2D1_COLORMANAGEMENT_ALPHA_MODE_PREMULTIPLIED = 0x00000001,
    D2D1_COLORMANAGEMENT_ALPHA_MODE_STRAIGHT      = 0x00000002,
    D2D1_COLORMANAGEMENT_ALPHA_MODE_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_COLORMANAGEMENT_QUALITY = uint;
enum : uint
{
    D2D1_COLORMANAGEMENT_QUALITY_PROOF       = 0x00000000,
    D2D1_COLORMANAGEMENT_QUALITY_NORMAL      = 0x00000001,
    D2D1_COLORMANAGEMENT_QUALITY_BEST        = 0x00000002,
    D2D1_COLORMANAGEMENT_QUALITY_FORCE_DWORD = 0xffffffff,
}

alias D2D1_COLORMANAGEMENT_RENDERING_INTENT = uint;
enum : uint
{
    D2D1_COLORMANAGEMENT_RENDERING_INTENT_PERCEPTUAL            = 0x00000000,
    D2D1_COLORMANAGEMENT_RENDERING_INTENT_RELATIVE_COLORIMETRIC = 0x00000001,
    D2D1_COLORMANAGEMENT_RENDERING_INTENT_SATURATION            = 0x00000002,
    D2D1_COLORMANAGEMENT_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC = 0x00000003,
    D2D1_COLORMANAGEMENT_RENDERING_INTENT_FORCE_DWORD           = 0xffffffff,
}

alias D2D1_HISTOGRAM_PROP = uint;
enum : uint
{
    D2D1_HISTOGRAM_PROP_NUM_BINS         = 0x00000000,
    D2D1_HISTOGRAM_PROP_CHANNEL_SELECT   = 0x00000001,
    D2D1_HISTOGRAM_PROP_HISTOGRAM_OUTPUT = 0x00000002,
    D2D1_HISTOGRAM_PROP_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_POINTSPECULAR_PROP = uint;
enum : uint
{
    D2D1_POINTSPECULAR_PROP_LIGHT_POSITION     = 0x00000000,
    D2D1_POINTSPECULAR_PROP_SPECULAR_EXPONENT  = 0x00000001,
    D2D1_POINTSPECULAR_PROP_SPECULAR_CONSTANT  = 0x00000002,
    D2D1_POINTSPECULAR_PROP_SURFACE_SCALE      = 0x00000003,
    D2D1_POINTSPECULAR_PROP_COLOR              = 0x00000004,
    D2D1_POINTSPECULAR_PROP_KERNEL_UNIT_LENGTH = 0x00000005,
    D2D1_POINTSPECULAR_PROP_SCALE_MODE         = 0x00000006,
    D2D1_POINTSPECULAR_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_POINTSPECULAR_SCALE_MODE = uint;
enum : uint
{
    D2D1_POINTSPECULAR_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_POINTSPECULAR_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_POINTSPECULAR_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_POINTSPECULAR_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_POINTSPECULAR_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_POINTSPECULAR_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_POINTSPECULAR_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SPOTSPECULAR_PROP = uint;
enum : uint
{
    D2D1_SPOTSPECULAR_PROP_LIGHT_POSITION      = 0x00000000,
    D2D1_SPOTSPECULAR_PROP_POINTS_AT           = 0x00000001,
    D2D1_SPOTSPECULAR_PROP_FOCUS               = 0x00000002,
    D2D1_SPOTSPECULAR_PROP_LIMITING_CONE_ANGLE = 0x00000003,
    D2D1_SPOTSPECULAR_PROP_SPECULAR_EXPONENT   = 0x00000004,
    D2D1_SPOTSPECULAR_PROP_SPECULAR_CONSTANT   = 0x00000005,
    D2D1_SPOTSPECULAR_PROP_SURFACE_SCALE       = 0x00000006,
    D2D1_SPOTSPECULAR_PROP_COLOR               = 0x00000007,
    D2D1_SPOTSPECULAR_PROP_KERNEL_UNIT_LENGTH  = 0x00000008,
    D2D1_SPOTSPECULAR_PROP_SCALE_MODE          = 0x00000009,
    D2D1_SPOTSPECULAR_PROP_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SPOTSPECULAR_SCALE_MODE = uint;
enum : uint
{
    D2D1_SPOTSPECULAR_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_SPOTSPECULAR_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_SPOTSPECULAR_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_SPOTSPECULAR_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_SPOTSPECULAR_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_SPOTSPECULAR_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_SPOTSPECULAR_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_DISTANTSPECULAR_PROP = uint;
enum : uint
{
    D2D1_DISTANTSPECULAR_PROP_AZIMUTH            = 0x00000000,
    D2D1_DISTANTSPECULAR_PROP_ELEVATION          = 0x00000001,
    D2D1_DISTANTSPECULAR_PROP_SPECULAR_EXPONENT  = 0x00000002,
    D2D1_DISTANTSPECULAR_PROP_SPECULAR_CONSTANT  = 0x00000003,
    D2D1_DISTANTSPECULAR_PROP_SURFACE_SCALE      = 0x00000004,
    D2D1_DISTANTSPECULAR_PROP_COLOR              = 0x00000005,
    D2D1_DISTANTSPECULAR_PROP_KERNEL_UNIT_LENGTH = 0x00000006,
    D2D1_DISTANTSPECULAR_PROP_SCALE_MODE         = 0x00000007,
    D2D1_DISTANTSPECULAR_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_DISTANTSPECULAR_SCALE_MODE = uint;
enum : uint
{
    D2D1_DISTANTSPECULAR_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_DISTANTSPECULAR_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_DISTANTSPECULAR_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_DISTANTSPECULAR_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_DISTANTSPECULAR_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_DISTANTSPECULAR_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_DISTANTSPECULAR_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_POINTDIFFUSE_PROP = uint;
enum : uint
{
    D2D1_POINTDIFFUSE_PROP_LIGHT_POSITION     = 0x00000000,
    D2D1_POINTDIFFUSE_PROP_DIFFUSE_CONSTANT   = 0x00000001,
    D2D1_POINTDIFFUSE_PROP_SURFACE_SCALE      = 0x00000002,
    D2D1_POINTDIFFUSE_PROP_COLOR              = 0x00000003,
    D2D1_POINTDIFFUSE_PROP_KERNEL_UNIT_LENGTH = 0x00000004,
    D2D1_POINTDIFFUSE_PROP_SCALE_MODE         = 0x00000005,
    D2D1_POINTDIFFUSE_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_POINTDIFFUSE_SCALE_MODE = uint;
enum : uint
{
    D2D1_POINTDIFFUSE_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_POINTDIFFUSE_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_POINTDIFFUSE_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_POINTDIFFUSE_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_POINTDIFFUSE_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_POINTDIFFUSE_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_POINTDIFFUSE_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SPOTDIFFUSE_PROP = uint;
enum : uint
{
    D2D1_SPOTDIFFUSE_PROP_LIGHT_POSITION      = 0x00000000,
    D2D1_SPOTDIFFUSE_PROP_POINTS_AT           = 0x00000001,
    D2D1_SPOTDIFFUSE_PROP_FOCUS               = 0x00000002,
    D2D1_SPOTDIFFUSE_PROP_LIMITING_CONE_ANGLE = 0x00000003,
    D2D1_SPOTDIFFUSE_PROP_DIFFUSE_CONSTANT    = 0x00000004,
    D2D1_SPOTDIFFUSE_PROP_SURFACE_SCALE       = 0x00000005,
    D2D1_SPOTDIFFUSE_PROP_COLOR               = 0x00000006,
    D2D1_SPOTDIFFUSE_PROP_KERNEL_UNIT_LENGTH  = 0x00000007,
    D2D1_SPOTDIFFUSE_PROP_SCALE_MODE          = 0x00000008,
    D2D1_SPOTDIFFUSE_PROP_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SPOTDIFFUSE_SCALE_MODE = uint;
enum : uint
{
    D2D1_SPOTDIFFUSE_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_SPOTDIFFUSE_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_SPOTDIFFUSE_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_SPOTDIFFUSE_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_SPOTDIFFUSE_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_SPOTDIFFUSE_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_SPOTDIFFUSE_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_DISTANTDIFFUSE_PROP = uint;
enum : uint
{
    D2D1_DISTANTDIFFUSE_PROP_AZIMUTH            = 0x00000000,
    D2D1_DISTANTDIFFUSE_PROP_ELEVATION          = 0x00000001,
    D2D1_DISTANTDIFFUSE_PROP_DIFFUSE_CONSTANT   = 0x00000002,
    D2D1_DISTANTDIFFUSE_PROP_SURFACE_SCALE      = 0x00000003,
    D2D1_DISTANTDIFFUSE_PROP_COLOR              = 0x00000004,
    D2D1_DISTANTDIFFUSE_PROP_KERNEL_UNIT_LENGTH = 0x00000005,
    D2D1_DISTANTDIFFUSE_PROP_SCALE_MODE         = 0x00000006,
    D2D1_DISTANTDIFFUSE_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_DISTANTDIFFUSE_SCALE_MODE = uint;
enum : uint
{
    D2D1_DISTANTDIFFUSE_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_DISTANTDIFFUSE_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_FLOOD_PROP = uint;
enum : uint
{
    D2D1_FLOOD_PROP_COLOR       = 0x00000000,
    D2D1_FLOOD_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_LINEARTRANSFER_PROP = uint;
enum : uint
{
    D2D1_LINEARTRANSFER_PROP_RED_Y_INTERCEPT   = 0x00000000,
    D2D1_LINEARTRANSFER_PROP_RED_SLOPE         = 0x00000001,
    D2D1_LINEARTRANSFER_PROP_RED_DISABLE       = 0x00000002,
    D2D1_LINEARTRANSFER_PROP_GREEN_Y_INTERCEPT = 0x00000003,
    D2D1_LINEARTRANSFER_PROP_GREEN_SLOPE       = 0x00000004,
    D2D1_LINEARTRANSFER_PROP_GREEN_DISABLE     = 0x00000005,
    D2D1_LINEARTRANSFER_PROP_BLUE_Y_INTERCEPT  = 0x00000006,
    D2D1_LINEARTRANSFER_PROP_BLUE_SLOPE        = 0x00000007,
    D2D1_LINEARTRANSFER_PROP_BLUE_DISABLE      = 0x00000008,
    D2D1_LINEARTRANSFER_PROP_ALPHA_Y_INTERCEPT = 0x00000009,
    D2D1_LINEARTRANSFER_PROP_ALPHA_SLOPE       = 0x0000000a,
    D2D1_LINEARTRANSFER_PROP_ALPHA_DISABLE     = 0x0000000b,
    D2D1_LINEARTRANSFER_PROP_CLAMP_OUTPUT      = 0x0000000c,
    D2D1_LINEARTRANSFER_PROP_FORCE_DWORD       = 0xffffffff,
}

alias D2D1_GAMMATRANSFER_PROP = uint;
enum : uint
{
    D2D1_GAMMATRANSFER_PROP_RED_AMPLITUDE   = 0x00000000,
    D2D1_GAMMATRANSFER_PROP_RED_EXPONENT    = 0x00000001,
    D2D1_GAMMATRANSFER_PROP_RED_OFFSET      = 0x00000002,
    D2D1_GAMMATRANSFER_PROP_RED_DISABLE     = 0x00000003,
    D2D1_GAMMATRANSFER_PROP_GREEN_AMPLITUDE = 0x00000004,
    D2D1_GAMMATRANSFER_PROP_GREEN_EXPONENT  = 0x00000005,
    D2D1_GAMMATRANSFER_PROP_GREEN_OFFSET    = 0x00000006,
    D2D1_GAMMATRANSFER_PROP_GREEN_DISABLE   = 0x00000007,
    D2D1_GAMMATRANSFER_PROP_BLUE_AMPLITUDE  = 0x00000008,
    D2D1_GAMMATRANSFER_PROP_BLUE_EXPONENT   = 0x00000009,
    D2D1_GAMMATRANSFER_PROP_BLUE_OFFSET     = 0x0000000a,
    D2D1_GAMMATRANSFER_PROP_BLUE_DISABLE    = 0x0000000b,
    D2D1_GAMMATRANSFER_PROP_ALPHA_AMPLITUDE = 0x0000000c,
    D2D1_GAMMATRANSFER_PROP_ALPHA_EXPONENT  = 0x0000000d,
    D2D1_GAMMATRANSFER_PROP_ALPHA_OFFSET    = 0x0000000e,
    D2D1_GAMMATRANSFER_PROP_ALPHA_DISABLE   = 0x0000000f,
    D2D1_GAMMATRANSFER_PROP_CLAMP_OUTPUT    = 0x00000010,
    D2D1_GAMMATRANSFER_PROP_FORCE_DWORD     = 0xffffffff,
}

alias D2D1_TABLETRANSFER_PROP = uint;
enum : uint
{
    D2D1_TABLETRANSFER_PROP_RED_TABLE     = 0x00000000,
    D2D1_TABLETRANSFER_PROP_RED_DISABLE   = 0x00000001,
    D2D1_TABLETRANSFER_PROP_GREEN_TABLE   = 0x00000002,
    D2D1_TABLETRANSFER_PROP_GREEN_DISABLE = 0x00000003,
    D2D1_TABLETRANSFER_PROP_BLUE_TABLE    = 0x00000004,
    D2D1_TABLETRANSFER_PROP_BLUE_DISABLE  = 0x00000005,
    D2D1_TABLETRANSFER_PROP_ALPHA_TABLE   = 0x00000006,
    D2D1_TABLETRANSFER_PROP_ALPHA_DISABLE = 0x00000007,
    D2D1_TABLETRANSFER_PROP_CLAMP_OUTPUT  = 0x00000008,
    D2D1_TABLETRANSFER_PROP_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_DISCRETETRANSFER_PROP = uint;
enum : uint
{
    D2D1_DISCRETETRANSFER_PROP_RED_TABLE     = 0x00000000,
    D2D1_DISCRETETRANSFER_PROP_RED_DISABLE   = 0x00000001,
    D2D1_DISCRETETRANSFER_PROP_GREEN_TABLE   = 0x00000002,
    D2D1_DISCRETETRANSFER_PROP_GREEN_DISABLE = 0x00000003,
    D2D1_DISCRETETRANSFER_PROP_BLUE_TABLE    = 0x00000004,
    D2D1_DISCRETETRANSFER_PROP_BLUE_DISABLE  = 0x00000005,
    D2D1_DISCRETETRANSFER_PROP_ALPHA_TABLE   = 0x00000006,
    D2D1_DISCRETETRANSFER_PROP_ALPHA_DISABLE = 0x00000007,
    D2D1_DISCRETETRANSFER_PROP_CLAMP_OUTPUT  = 0x00000008,
    D2D1_DISCRETETRANSFER_PROP_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_CONVOLVEMATRIX_PROP = uint;
enum : uint
{
    D2D1_CONVOLVEMATRIX_PROP_KERNEL_UNIT_LENGTH = 0x00000000,
    D2D1_CONVOLVEMATRIX_PROP_SCALE_MODE         = 0x00000001,
    D2D1_CONVOLVEMATRIX_PROP_KERNEL_SIZE_X      = 0x00000002,
    D2D1_CONVOLVEMATRIX_PROP_KERNEL_SIZE_Y      = 0x00000003,
    D2D1_CONVOLVEMATRIX_PROP_KERNEL_MATRIX      = 0x00000004,
    D2D1_CONVOLVEMATRIX_PROP_DIVISOR            = 0x00000005,
    D2D1_CONVOLVEMATRIX_PROP_BIAS               = 0x00000006,
    D2D1_CONVOLVEMATRIX_PROP_KERNEL_OFFSET      = 0x00000007,
    D2D1_CONVOLVEMATRIX_PROP_PRESERVE_ALPHA     = 0x00000008,
    D2D1_CONVOLVEMATRIX_PROP_BORDER_MODE        = 0x00000009,
    D2D1_CONVOLVEMATRIX_PROP_CLAMP_OUTPUT       = 0x0000000a,
    D2D1_CONVOLVEMATRIX_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_CONVOLVEMATRIX_SCALE_MODE = uint;
enum : uint
{
    D2D1_CONVOLVEMATRIX_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_CONVOLVEMATRIX_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_BRIGHTNESS_PROP = uint;
enum : uint
{
    D2D1_BRIGHTNESS_PROP_WHITE_POINT = 0x00000000,
    D2D1_BRIGHTNESS_PROP_BLACK_POINT = 0x00000001,
    D2D1_BRIGHTNESS_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_ARITHMETICCOMPOSITE_PROP = uint;
enum : uint
{
    D2D1_ARITHMETICCOMPOSITE_PROP_COEFFICIENTS = 0x00000000,
    D2D1_ARITHMETICCOMPOSITE_PROP_CLAMP_OUTPUT = 0x00000001,
    D2D1_ARITHMETICCOMPOSITE_PROP_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_CROP_PROP = uint;
enum : uint
{
    D2D1_CROP_PROP_RECT        = 0x00000000,
    D2D1_CROP_PROP_BORDER_MODE = 0x00000001,
    D2D1_CROP_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BORDER_PROP = uint;
enum : uint
{
    D2D1_BORDER_PROP_EDGE_MODE_X = 0x00000000,
    D2D1_BORDER_PROP_EDGE_MODE_Y = 0x00000001,
    D2D1_BORDER_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BORDER_EDGE_MODE = uint;
enum : uint
{
    D2D1_BORDER_EDGE_MODE_CLAMP       = 0x00000000,
    D2D1_BORDER_EDGE_MODE_WRAP        = 0x00000001,
    D2D1_BORDER_EDGE_MODE_MIRROR      = 0x00000002,
    D2D1_BORDER_EDGE_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_MORPHOLOGY_PROP = uint;
enum : uint
{
    D2D1_MORPHOLOGY_PROP_MODE        = 0x00000000,
    D2D1_MORPHOLOGY_PROP_WIDTH       = 0x00000001,
    D2D1_MORPHOLOGY_PROP_HEIGHT      = 0x00000002,
    D2D1_MORPHOLOGY_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_MORPHOLOGY_MODE = uint;
enum : uint
{
    D2D1_MORPHOLOGY_MODE_ERODE       = 0x00000000,
    D2D1_MORPHOLOGY_MODE_DILATE      = 0x00000001,
    D2D1_MORPHOLOGY_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_TILE_PROP = uint;
enum : uint
{
    D2D1_TILE_PROP_RECT        = 0x00000000,
    D2D1_TILE_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_ATLAS_PROP = uint;
enum : uint
{
    D2D1_ATLAS_PROP_INPUT_RECT         = 0x00000000,
    D2D1_ATLAS_PROP_INPUT_PADDING_RECT = 0x00000001,
    D2D1_ATLAS_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_OPACITYMETADATA_PROP = uint;
enum : uint
{
    D2D1_OPACITYMETADATA_PROP_INPUT_OPAQUE_RECT = 0x00000000,
    D2D1_OPACITYMETADATA_PROP_FORCE_DWORD       = 0xffffffff,
}

alias PD2D1_EFFECT_FACTORY = HRESULT function(IUnknown*);
alias D2D1_PROPERTY_TYPE = uint;
enum : uint
{
    D2D1_PROPERTY_TYPE_UNKNOWN       = 0x00000000,
    D2D1_PROPERTY_TYPE_STRING        = 0x00000001,
    D2D1_PROPERTY_TYPE_BOOL          = 0x00000002,
    D2D1_PROPERTY_TYPE_UINT32        = 0x00000003,
    D2D1_PROPERTY_TYPE_INT32         = 0x00000004,
    D2D1_PROPERTY_TYPE_FLOAT         = 0x00000005,
    D2D1_PROPERTY_TYPE_VECTOR2       = 0x00000006,
    D2D1_PROPERTY_TYPE_VECTOR3       = 0x00000007,
    D2D1_PROPERTY_TYPE_VECTOR4       = 0x00000008,
    D2D1_PROPERTY_TYPE_BLOB          = 0x00000009,
    D2D1_PROPERTY_TYPE_IUNKNOWN      = 0x0000000a,
    D2D1_PROPERTY_TYPE_ENUM          = 0x0000000b,
    D2D1_PROPERTY_TYPE_ARRAY         = 0x0000000c,
    D2D1_PROPERTY_TYPE_CLSID         = 0x0000000d,
    D2D1_PROPERTY_TYPE_MATRIX_3X2    = 0x0000000e,
    D2D1_PROPERTY_TYPE_MATRIX_4X3    = 0x0000000f,
    D2D1_PROPERTY_TYPE_MATRIX_4X4    = 0x00000010,
    D2D1_PROPERTY_TYPE_MATRIX_5X4    = 0x00000011,
    D2D1_PROPERTY_TYPE_COLOR_CONTEXT = 0x00000012,
    D2D1_PROPERTY_TYPE_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_PROPERTY = uint;
enum : uint
{
    D2D1_PROPERTY_CLSID       = 0x80000000,
    D2D1_PROPERTY_DISPLAYNAME = 0x80000001,
    D2D1_PROPERTY_AUTHOR      = 0x80000002,
    D2D1_PROPERTY_CATEGORY    = 0x80000003,
    D2D1_PROPERTY_DESCRIPTION = 0x80000004,
    D2D1_PROPERTY_INPUTS      = 0x80000005,
    D2D1_PROPERTY_CACHED      = 0x80000006,
    D2D1_PROPERTY_PRECISION   = 0x80000007,
    D2D1_PROPERTY_MIN_INPUTS  = 0x80000008,
    D2D1_PROPERTY_MAX_INPUTS  = 0x80000009,
    D2D1_PROPERTY_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SUBPROPERTY = uint;
enum : uint
{
    D2D1_SUBPROPERTY_DISPLAYNAME = 0x80000000,
    D2D1_SUBPROPERTY_ISREADONLY  = 0x80000001,
    D2D1_SUBPROPERTY_MIN         = 0x80000002,
    D2D1_SUBPROPERTY_MAX         = 0x80000003,
    D2D1_SUBPROPERTY_DEFAULT     = 0x80000004,
    D2D1_SUBPROPERTY_FIELDS      = 0x80000005,
    D2D1_SUBPROPERTY_INDEX       = 0x80000006,
    D2D1_SUBPROPERTY_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BITMAP_OPTIONS = uint;
enum : uint
{
    D2D1_BITMAP_OPTIONS_NONE           = 0x00000000,
    D2D1_BITMAP_OPTIONS_TARGET         = 0x00000001,
    D2D1_BITMAP_OPTIONS_CANNOT_DRAW    = 0x00000002,
    D2D1_BITMAP_OPTIONS_CPU_READ       = 0x00000004,
    D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE = 0x00000008,
    D2D1_BITMAP_OPTIONS_FORCE_DWORD    = 0xffffffff,
}

alias D2D1_BUFFER_PRECISION = uint;
enum : uint
{
    D2D1_BUFFER_PRECISION_UNKNOWN         = 0x00000000,
    D2D1_BUFFER_PRECISION_8BPC_UNORM      = 0x00000001,
    D2D1_BUFFER_PRECISION_8BPC_UNORM_SRGB = 0x00000002,
    D2D1_BUFFER_PRECISION_16BPC_UNORM     = 0x00000003,
    D2D1_BUFFER_PRECISION_16BPC_FLOAT     = 0x00000004,
    D2D1_BUFFER_PRECISION_32BPC_FLOAT     = 0x00000005,
    D2D1_BUFFER_PRECISION_FORCE_DWORD     = 0xffffffff,
}

alias D2D1_MAP_OPTIONS = uint;
enum : uint
{
    D2D1_MAP_OPTIONS_NONE        = 0x00000000,
    D2D1_MAP_OPTIONS_READ        = 0x00000001,
    D2D1_MAP_OPTIONS_WRITE       = 0x00000002,
    D2D1_MAP_OPTIONS_DISCARD     = 0x00000004,
    D2D1_MAP_OPTIONS_FORCE_DWORD = 0xffffffff,
}

alias D2D1_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_UNIT_MODE = uint;
enum : uint
{
    D2D1_UNIT_MODE_DIPS        = 0x00000000,
    D2D1_UNIT_MODE_PIXELS      = 0x00000001,
    D2D1_UNIT_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_COLOR_SPACE = uint;
enum : uint
{
    D2D1_COLOR_SPACE_CUSTOM      = 0x00000000,
    D2D1_COLOR_SPACE_SRGB        = 0x00000001,
    D2D1_COLOR_SPACE_SCRGB       = 0x00000002,
    D2D1_COLOR_SPACE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_DEVICE_CONTEXT_OPTIONS = uint;
enum : uint
{
    D2D1_DEVICE_CONTEXT_OPTIONS_NONE                               = 0x00000000,
    D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS = 0x00000001,
    D2D1_DEVICE_CONTEXT_OPTIONS_FORCE_DWORD                        = 0xffffffff,
}

alias D2D1_STROKE_TRANSFORM_TYPE = uint;
enum : uint
{
    D2D1_STROKE_TRANSFORM_TYPE_NORMAL      = 0x00000000,
    D2D1_STROKE_TRANSFORM_TYPE_FIXED       = 0x00000001,
    D2D1_STROKE_TRANSFORM_TYPE_HAIRLINE    = 0x00000002,
    D2D1_STROKE_TRANSFORM_TYPE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_PRIMITIVE_BLEND = uint;
enum : uint
{
    D2D1_PRIMITIVE_BLEND_SOURCE_OVER = 0x00000000,
    D2D1_PRIMITIVE_BLEND_COPY        = 0x00000001,
    D2D1_PRIMITIVE_BLEND_MIN         = 0x00000002,
    D2D1_PRIMITIVE_BLEND_ADD         = 0x00000003,
    D2D1_PRIMITIVE_BLEND_MAX         = 0x00000004,
    D2D1_PRIMITIVE_BLEND_FORCE_DWORD = 0xffffffff,
}

alias D2D1_THREADING_MODE = uint;
enum : uint
{
    D2D1_THREADING_MODE_SINGLE_THREADED = 0x00000000,
    D2D1_THREADING_MODE_MULTI_THREADED  = 0x00000001,
    D2D1_THREADING_MODE_FORCE_DWORD     = 0xffffffff,
}

alias D2D1_COLOR_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT      = 0x00000000,
    D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED = 0x00000001,
    D2D1_COLOR_INTERPOLATION_MODE_FORCE_DWORD   = 0xffffffff,
}

struct D2D1_BITMAP_PROPERTIES1
{
    D2D1_PIXEL_FORMAT pixelFormat;
    float dpiX;
    float dpiY;
    D2D1_BITMAP_OPTIONS bitmapOptions;
    ID2D1ColorContext colorContext;
}
struct D2D1_MAPPED_RECT
{
    uint pitch;
    ubyte* bits;
}
struct D2D1_RENDERING_CONTROLS
{
    D2D1_BUFFER_PRECISION bufferPrecision;
    D2D_SIZE_U tileSize;
}
struct D2D1_EFFECT_INPUT_DESCRIPTION
{
    ID2D1Effect effect;
    uint inputIndex;
    D2D_RECT_F inputRectangle;
}
struct D2D1_POINT_DESCRIPTION
{
    D2D_POINT_2F point;
    D2D_POINT_2F unitTangentVector;
    uint endSegment;
    uint endFigure;
    float lengthToEndSegment;
}
struct D2D1_IMAGE_BRUSH_PROPERTIES
{
    D2D_RECT_F sourceRectangle;
    D2D1_EXTEND_MODE extendModeX;
    D2D1_EXTEND_MODE extendModeY;
    D2D1_INTERPOLATION_MODE interpolationMode;
}
struct D2D1_BITMAP_BRUSH_PROPERTIES1
{
    D2D1_EXTEND_MODE extendModeX;
    D2D1_EXTEND_MODE extendModeY;
    D2D1_INTERPOLATION_MODE interpolationMode;
}
struct D2D1_STROKE_STYLE_PROPERTIES1
{
    D2D1_CAP_STYLE startCap;
    D2D1_CAP_STYLE endCap;
    D2D1_CAP_STYLE dashCap;
    D2D1_LINE_JOIN lineJoin;
    float miterLimit;
    D2D1_DASH_STYLE dashStyle;
    float dashOffset;
    D2D1_STROKE_TRANSFORM_TYPE transformType;
}
alias D2D1_LAYER_OPTIONS1 = uint;
enum : uint
{
    D2D1_LAYER_OPTIONS1_NONE                       = 0x00000000,
    D2D1_LAYER_OPTIONS1_INITIALIZE_FROM_BACKGROUND = 0x00000001,
    D2D1_LAYER_OPTIONS1_IGNORE_ALPHA               = 0x00000002,
    D2D1_LAYER_OPTIONS1_FORCE_DWORD                = 0xffffffff,
}

struct D2D1_LAYER_PARAMETERS1
{
    D2D_RECT_F contentBounds;
    ID2D1Geometry geometricMask;
    D2D1_ANTIALIAS_MODE maskAntialiasMode;
    D2D_MATRIX_3X2_F maskTransform;
    float opacity;
    ID2D1Brush opacityBrush;
    D2D1_LAYER_OPTIONS1 layerOptions;
}
alias D2D1_PRINT_FONT_SUBSET_MODE = uint;
enum : uint
{
    D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT     = 0x00000000,
    D2D1_PRINT_FONT_SUBSET_MODE_EACHPAGE    = 0x00000001,
    D2D1_PRINT_FONT_SUBSET_MODE_NONE        = 0x00000002,
    D2D1_PRINT_FONT_SUBSET_MODE_FORCE_DWORD = 0xffffffff,
}

struct D2D1_DRAWING_STATE_DESCRIPTION1
{
    D2D1_ANTIALIAS_MODE antialiasMode;
    D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
    ulong tag1;
    ulong tag2;
    D2D_MATRIX_3X2_F transform;
    D2D1_PRIMITIVE_BLEND primitiveBlend;
    D2D1_UNIT_MODE unitMode;
}
struct D2D1_PRINT_CONTROL_PROPERTIES
{
    D2D1_PRINT_FONT_SUBSET_MODE fontSubset;
    float rasterDPI;
    D2D1_COLOR_SPACE colorSpace;
}
struct D2D1_CREATION_PROPERTIES
{
    D2D1_THREADING_MODE threadingMode;
    D2D1_DEBUG_LEVEL debugLevel;
    D2D1_DEVICE_CONTEXT_OPTIONS options;
}
enum IID_ID2D1GdiMetafileSink = GUID(0x82237326, 0x8111, 0x4f7c, [0xbc, 0xf4, 0xb5, 0xc1, 0x17, 0x55, 0x64, 0xfe]);
interface ID2D1GdiMetafileSink : IUnknown
{
    HRESULT ProcessRecord(uint, const(void)*, uint);
}
enum IID_ID2D1GdiMetafile = GUID(0x2f543dc3, 0xcfc1, 0x4211, [0x86, 0x4f, 0xcf, 0xd9, 0x1c, 0x6f, 0x33, 0x95]);
interface ID2D1GdiMetafile : ID2D1Resource
{
    HRESULT Stream(ID2D1GdiMetafileSink);
    HRESULT GetBounds(D2D_RECT_F*);
}
enum IID_ID2D1CommandSink = GUID(0x54d7898a, 0xa061, 0x40a7, [0xbe, 0xc7, 0xe4, 0x65, 0xbc, 0xba, 0x2c, 0x4f]);
interface ID2D1CommandSink : IUnknown
{
    HRESULT BeginDraw();
    HRESULT EndDraw();
    HRESULT SetAntialiasMode(D2D1_ANTIALIAS_MODE);
    HRESULT SetTags(ulong, ulong);
    HRESULT SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE);
    HRESULT SetTextRenderingParams(IDWriteRenderingParams);
    HRESULT SetTransform(const(D2D_MATRIX_3X2_F)*);
    HRESULT SetPrimitiveBlend(D2D1_PRIMITIVE_BLEND);
    HRESULT SetUnitMode(D2D1_UNIT_MODE);
    HRESULT Clear(const(D2D1_COLOR_F)*);
    HRESULT DrawGlyphRun(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, ID2D1Brush, DWRITE_MEASURING_MODE);
    HRESULT DrawLine(D2D_POINT_2F, D2D_POINT_2F, ID2D1Brush, float, ID2D1StrokeStyle);
    HRESULT DrawGeometry(ID2D1Geometry, ID2D1Brush, float, ID2D1StrokeStyle);
    HRESULT DrawRectangle(const(D2D_RECT_F)*, ID2D1Brush, float, ID2D1StrokeStyle);
    HRESULT DrawBitmap(ID2D1Bitmap, const(D2D_RECT_F)*, float, D2D1_INTERPOLATION_MODE, const(D2D_RECT_F)*, const(D2D_MATRIX_4X4_F)*);
    HRESULT DrawImage(ID2D1Image, const(D2D_POINT_2F)*, const(D2D_RECT_F)*, D2D1_INTERPOLATION_MODE, D2D1_COMPOSITE_MODE);
    HRESULT DrawGdiMetafile(ID2D1GdiMetafile, const(D2D_POINT_2F)*);
    HRESULT FillMesh(ID2D1Mesh, ID2D1Brush);
    HRESULT FillOpacityMask(ID2D1Bitmap, ID2D1Brush, const(D2D_RECT_F)*, const(D2D_RECT_F)*);
    HRESULT FillGeometry(ID2D1Geometry, ID2D1Brush, ID2D1Brush);
    HRESULT FillRectangle(const(D2D_RECT_F)*, ID2D1Brush);
    HRESULT PushAxisAlignedClip(const(D2D_RECT_F)*, D2D1_ANTIALIAS_MODE);
    HRESULT PushLayer(const(D2D1_LAYER_PARAMETERS1)*, ID2D1Layer);
    HRESULT PopAxisAlignedClip();
    HRESULT PopLayer();
}
enum IID_ID2D1CommandList = GUID(0xb4f34a19, 0x2383, 0x4d76, [0x94, 0xf6, 0xec, 0x34, 0x36, 0x57, 0xc3, 0xdc]);
interface ID2D1CommandList : ID2D1Image
{
    HRESULT Stream(ID2D1CommandSink);
    HRESULT Close();
}
enum IID_ID2D1PrintControl = GUID(0x2c1d867d, 0xc290, 0x41c8, [0xae, 0x7e, 0x34, 0xa9, 0x87, 0x2, 0xe9, 0xa5]);
interface ID2D1PrintControl : IUnknown
{
    HRESULT AddPage(ID2D1CommandList, D2D_SIZE_F, IStream, ulong*, ulong*);
    HRESULT Close();
}
enum IID_ID2D1ImageBrush = GUID(0xfe9e984d, 0x3f95, 0x407c, [0xb5, 0xdb, 0xcb, 0x94, 0xd4, 0xe8, 0xf8, 0x7c]);
interface ID2D1ImageBrush : ID2D1Brush
{
    void SetImage(ID2D1Image);
    void SetExtendModeX(D2D1_EXTEND_MODE);
    void SetExtendModeY(D2D1_EXTEND_MODE);
    void SetInterpolationMode(D2D1_INTERPOLATION_MODE);
    void SetSourceRectangle(const(D2D_RECT_F)*);
    void GetImage(ID2D1Image*);
    D2D1_EXTEND_MODE GetExtendModeX();
    D2D1_EXTEND_MODE GetExtendModeY();
    D2D1_INTERPOLATION_MODE GetInterpolationMode();
    void GetSourceRectangle(D2D_RECT_F*);
}
enum IID_ID2D1BitmapBrush1 = GUID(0x41343a53, 0xe41a, 0x49a2, [0x91, 0xcd, 0x21, 0x79, 0x3b, 0xbb, 0x62, 0xe5]);
interface ID2D1BitmapBrush1 : ID2D1BitmapBrush
{
    void SetInterpolationMode1(D2D1_INTERPOLATION_MODE);
    D2D1_INTERPOLATION_MODE GetInterpolationMode1();
}
enum IID_ID2D1StrokeStyle1 = GUID(0x10a72a66, 0xe91c, 0x43f4, [0x99, 0x3f, 0xdd, 0xf4, 0xb8, 0x2b, 0xb, 0x4a]);
interface ID2D1StrokeStyle1 : ID2D1StrokeStyle
{
    D2D1_STROKE_TRANSFORM_TYPE GetStrokeTransformType();
}
enum IID_ID2D1PathGeometry1 = GUID(0x62baa2d2, 0xab54, 0x41b7, [0xb8, 0x72, 0x78, 0x7e, 0x1, 0x6, 0xa4, 0x21]);
interface ID2D1PathGeometry1 : ID2D1PathGeometry
{
    HRESULT ComputePointAndSegmentAtLength(float, uint, const(D2D_MATRIX_3X2_F)*, float, D2D1_POINT_DESCRIPTION*);
}
enum IID_ID2D1Properties = GUID(0x483473d7, 0xcd46, 0x4f9d, [0x9d, 0x3a, 0x31, 0x12, 0xaa, 0x80, 0x15, 0x9d]);
interface ID2D1Properties : IUnknown
{
    uint GetPropertyCount();
    HRESULT GetPropertyName(uint, PWSTR, uint);
    uint GetPropertyNameLength(uint);
    D2D1_PROPERTY_TYPE GetType(uint);
    uint GetPropertyIndex(const(wchar)*);
    HRESULT SetValueByName(const(wchar)*, D2D1_PROPERTY_TYPE, const(ubyte)*, uint);
    HRESULT SetValue(uint, D2D1_PROPERTY_TYPE, const(ubyte)*, uint);
    HRESULT GetValueByName(const(wchar)*, D2D1_PROPERTY_TYPE, ubyte*, uint);
    HRESULT GetValue(uint, D2D1_PROPERTY_TYPE, ubyte*, uint);
    uint GetValueSize(uint);
    HRESULT GetSubProperties(uint, ID2D1Properties*);
}
enum IID_ID2D1Effect = GUID(0x28211a43, 0x7d89, 0x476f, [0x81, 0x81, 0x2d, 0x61, 0x59, 0xb2, 0x20, 0xad]);
interface ID2D1Effect : ID2D1Properties
{
    void SetInput(uint, ID2D1Image, BOOL);
    HRESULT SetInputCount(uint);
    void GetInput(uint, ID2D1Image*);
    uint GetInputCount();
    void GetOutput(ID2D1Image*);
}
enum IID_ID2D1Bitmap1 = GUID(0xa898a84c, 0x3873, 0x4588, [0xb0, 0x8b, 0xeb, 0xbf, 0x97, 0x8d, 0xf0, 0x41]);
interface ID2D1Bitmap1 : ID2D1Bitmap
{
    void GetColorContext(ID2D1ColorContext*);
    D2D1_BITMAP_OPTIONS GetOptions();
    HRESULT GetSurface(IDXGISurface*);
    HRESULT Map(D2D1_MAP_OPTIONS, D2D1_MAPPED_RECT*);
    HRESULT Unmap();
}
enum IID_ID2D1ColorContext = GUID(0x1c4820bb, 0x5771, 0x4518, [0xa5, 0x81, 0x2f, 0xe4, 0xdd, 0xe, 0xc6, 0x57]);
interface ID2D1ColorContext : ID2D1Resource
{
    D2D1_COLOR_SPACE GetColorSpace();
    uint GetProfileSize();
    HRESULT GetProfile(ubyte*, uint);
}
enum IID_ID2D1GradientStopCollection1 = GUID(0xae1572f4, 0x5dd0, 0x4777, [0x99, 0x8b, 0x92, 0x79, 0x47, 0x2a, 0xe6, 0x3b]);
interface ID2D1GradientStopCollection1 : ID2D1GradientStopCollection
{
    void GetGradientStops1(D2D1_GRADIENT_STOP*, uint);
    D2D1_COLOR_SPACE GetPreInterpolationSpace();
    D2D1_COLOR_SPACE GetPostInterpolationSpace();
    D2D1_BUFFER_PRECISION GetBufferPrecision();
    D2D1_COLOR_INTERPOLATION_MODE GetColorInterpolationMode();
}
enum IID_ID2D1DrawingStateBlock1 = GUID(0x689f1f85, 0xc72e, 0x4e33, [0x8f, 0x19, 0x85, 0x75, 0x4e, 0xfd, 0x5a, 0xce]);
interface ID2D1DrawingStateBlock1 : ID2D1DrawingStateBlock
{
    void GetDescription(D2D1_DRAWING_STATE_DESCRIPTION1*);
    void SetDescription(const(D2D1_DRAWING_STATE_DESCRIPTION1)*);
}
enum IID_ID2D1DeviceContext = GUID(0xe8f7fe7a, 0x191c, 0x466d, [0xad, 0x95, 0x97, 0x56, 0x78, 0xbd, 0xa9, 0x98]);
interface ID2D1DeviceContext : ID2D1RenderTarget
{
    HRESULT CreateBitmap(D2D_SIZE_U, const(void)*, uint, const(D2D1_BITMAP_PROPERTIES1)*, ID2D1Bitmap1*);
    HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource, const(D2D1_BITMAP_PROPERTIES1)*, ID2D1Bitmap1*);
    HRESULT CreateColorContext(D2D1_COLOR_SPACE, const(ubyte)*, uint, ID2D1ColorContext*);
    HRESULT CreateColorContextFromFilename(const(wchar)*, ID2D1ColorContext*);
    HRESULT CreateColorContextFromWicColorContext(IWICColorContext, ID2D1ColorContext*);
    HRESULT CreateBitmapFromDxgiSurface(IDXGISurface, const(D2D1_BITMAP_PROPERTIES1)*, ID2D1Bitmap1*);
    HRESULT CreateEffect(const(GUID)*, ID2D1Effect*);
    HRESULT CreateGradientStopCollection(const(D2D1_GRADIENT_STOP)*, uint, D2D1_COLOR_SPACE, D2D1_COLOR_SPACE, D2D1_BUFFER_PRECISION, D2D1_EXTEND_MODE, D2D1_COLOR_INTERPOLATION_MODE, ID2D1GradientStopCollection1*);
    HRESULT CreateImageBrush(ID2D1Image, const(D2D1_IMAGE_BRUSH_PROPERTIES)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1ImageBrush*);
    HRESULT CreateBitmapBrush(ID2D1Bitmap, const(D2D1_BITMAP_BRUSH_PROPERTIES1)*, const(D2D1_BRUSH_PROPERTIES)*, ID2D1BitmapBrush1*);
    HRESULT CreateCommandList(ID2D1CommandList*);
    BOOL IsDxgiFormatSupported(DXGI_FORMAT);
    BOOL IsBufferPrecisionSupported(D2D1_BUFFER_PRECISION);
    HRESULT GetImageLocalBounds(ID2D1Image, D2D_RECT_F*);
    HRESULT GetImageWorldBounds(ID2D1Image, D2D_RECT_F*);
    HRESULT GetGlyphRunWorldBounds(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, DWRITE_MEASURING_MODE, D2D_RECT_F*);
    void GetDevice(ID2D1Device*);
    void SetTarget(ID2D1Image);
    void GetTarget(ID2D1Image*);
    void SetRenderingControls(const(D2D1_RENDERING_CONTROLS)*);
    void GetRenderingControls(D2D1_RENDERING_CONTROLS*);
    void SetPrimitiveBlend(D2D1_PRIMITIVE_BLEND);
    D2D1_PRIMITIVE_BLEND GetPrimitiveBlend();
    void SetUnitMode(D2D1_UNIT_MODE);
    D2D1_UNIT_MODE GetUnitMode();
    void DrawGlyphRun(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, ID2D1Brush, DWRITE_MEASURING_MODE);
    void DrawImage(ID2D1Image, const(D2D_POINT_2F)*, const(D2D_RECT_F)*, D2D1_INTERPOLATION_MODE, D2D1_COMPOSITE_MODE);
    void DrawGdiMetafile(ID2D1GdiMetafile, const(D2D_POINT_2F)*);
    void DrawBitmap(ID2D1Bitmap, const(D2D_RECT_F)*, float, D2D1_INTERPOLATION_MODE, const(D2D_RECT_F)*, const(D2D_MATRIX_4X4_F)*);
    void PushLayer(const(D2D1_LAYER_PARAMETERS1)*, ID2D1Layer);
    HRESULT InvalidateEffectInputRectangle(ID2D1Effect, uint, const(D2D_RECT_F)*);
    HRESULT GetEffectInvalidRectangleCount(ID2D1Effect, uint*);
    HRESULT GetEffectInvalidRectangles(ID2D1Effect, D2D_RECT_F*, uint);
    HRESULT GetEffectRequiredInputRectangles(ID2D1Effect, const(D2D_RECT_F)*, const(D2D1_EFFECT_INPUT_DESCRIPTION)*, D2D_RECT_F*, uint);
    void FillOpacityMask(ID2D1Bitmap, ID2D1Brush, const(D2D_RECT_F)*, const(D2D_RECT_F)*);
}
enum IID_ID2D1Device = GUID(0x47dd575d, 0xac05, 0x4cdd, [0x80, 0x49, 0x9b, 0x2, 0xcd, 0x16, 0xf4, 0x4c]);
interface ID2D1Device : ID2D1Resource
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext*);
    HRESULT CreatePrintControl(IWICImagingFactory, IPrintDocumentPackageTarget, const(D2D1_PRINT_CONTROL_PROPERTIES)*, ID2D1PrintControl*);
    void SetMaximumTextureMemory(ulong);
    ulong GetMaximumTextureMemory();
    void ClearResources(uint);
}
enum IID_ID2D1Factory1 = GUID(0xbb12d362, 0xdaee, 0x4b9a, [0xaa, 0x1d, 0x14, 0xba, 0x40, 0x1c, 0xfa, 0x1f]);
interface ID2D1Factory1 : ID2D1Factory
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device*);
    HRESULT CreateStrokeStyle(const(D2D1_STROKE_STYLE_PROPERTIES1)*, const(float)*, uint, ID2D1StrokeStyle1*);
    HRESULT CreatePathGeometry(ID2D1PathGeometry1*);
    HRESULT CreateDrawingStateBlock(const(D2D1_DRAWING_STATE_DESCRIPTION1)*, IDWriteRenderingParams, ID2D1DrawingStateBlock1*);
    HRESULT CreateGdiMetafile(IStream, ID2D1GdiMetafile*);
    HRESULT RegisterEffectFromStream(const(GUID)*, IStream, const(D2D1_PROPERTY_BINDING)*, uint, const(PD2D1_EFFECT_FACTORY));
    HRESULT RegisterEffectFromString(const(GUID)*, const(wchar)*, const(D2D1_PROPERTY_BINDING)*, uint, const(PD2D1_EFFECT_FACTORY));
    HRESULT UnregisterEffect(const(GUID)*);
    HRESULT GetRegisteredEffects(GUID*, uint, uint*, uint*);
    HRESULT GetEffectProperties(const(GUID)*, ID2D1Properties*);
}
enum IID_ID2D1Multithread = GUID(0x31e6e7bc, 0xe0ff, 0x4d46, [0x8c, 0x64, 0xa0, 0xa8, 0xc4, 0x1c, 0x15, 0xd3]);
interface ID2D1Multithread : IUnknown
{
    BOOL GetMultithreadProtected();
    void Enter();
    void Leave();
}
alias PD2D1_PROPERTY_SET_FUNCTION = HRESULT function(IUnknown, const(ubyte)*, uint);
alias PD2D1_PROPERTY_GET_FUNCTION = HRESULT function(const(IUnknown), ubyte*, uint, uint*);
alias D2D1_CHANGE_TYPE = uint;
enum : uint
{
    D2D1_CHANGE_TYPE_NONE        = 0x00000000,
    D2D1_CHANGE_TYPE_PROPERTIES  = 0x00000001,
    D2D1_CHANGE_TYPE_CONTEXT     = 0x00000002,
    D2D1_CHANGE_TYPE_GRAPH       = 0x00000003,
    D2D1_CHANGE_TYPE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_PIXEL_OPTIONS = uint;
enum : uint
{
    D2D1_PIXEL_OPTIONS_NONE             = 0x00000000,
    D2D1_PIXEL_OPTIONS_TRIVIAL_SAMPLING = 0x00000001,
    D2D1_PIXEL_OPTIONS_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_VERTEX_OPTIONS = uint;
enum : uint
{
    D2D1_VERTEX_OPTIONS_NONE              = 0x00000000,
    D2D1_VERTEX_OPTIONS_DO_NOT_CLEAR      = 0x00000001,
    D2D1_VERTEX_OPTIONS_USE_DEPTH_BUFFER  = 0x00000002,
    D2D1_VERTEX_OPTIONS_ASSUME_NO_OVERLAP = 0x00000004,
    D2D1_VERTEX_OPTIONS_FORCE_DWORD       = 0xffffffff,
}

alias D2D1_VERTEX_USAGE = uint;
enum : uint
{
    D2D1_VERTEX_USAGE_STATIC      = 0x00000000,
    D2D1_VERTEX_USAGE_DYNAMIC     = 0x00000001,
    D2D1_VERTEX_USAGE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_BLEND_OPERATION = uint;
enum : uint
{
    D2D1_BLEND_OPERATION_ADD          = 0x00000001,
    D2D1_BLEND_OPERATION_SUBTRACT     = 0x00000002,
    D2D1_BLEND_OPERATION_REV_SUBTRACT = 0x00000003,
    D2D1_BLEND_OPERATION_MIN          = 0x00000004,
    D2D1_BLEND_OPERATION_MAX          = 0x00000005,
    D2D1_BLEND_OPERATION_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_BLEND = uint;
enum : uint
{
    D2D1_BLEND_ZERO             = 0x00000001,
    D2D1_BLEND_ONE              = 0x00000002,
    D2D1_BLEND_SRC_COLOR        = 0x00000003,
    D2D1_BLEND_INV_SRC_COLOR    = 0x00000004,
    D2D1_BLEND_SRC_ALPHA        = 0x00000005,
    D2D1_BLEND_INV_SRC_ALPHA    = 0x00000006,
    D2D1_BLEND_DEST_ALPHA       = 0x00000007,
    D2D1_BLEND_INV_DEST_ALPHA   = 0x00000008,
    D2D1_BLEND_DEST_COLOR       = 0x00000009,
    D2D1_BLEND_INV_DEST_COLOR   = 0x0000000a,
    D2D1_BLEND_SRC_ALPHA_SAT    = 0x0000000b,
    D2D1_BLEND_BLEND_FACTOR     = 0x0000000e,
    D2D1_BLEND_INV_BLEND_FACTOR = 0x0000000f,
    D2D1_BLEND_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_CHANNEL_DEPTH = uint;
enum : uint
{
    D2D1_CHANNEL_DEPTH_DEFAULT     = 0x00000000,
    D2D1_CHANNEL_DEPTH_1           = 0x00000001,
    D2D1_CHANNEL_DEPTH_4           = 0x00000004,
    D2D1_CHANNEL_DEPTH_FORCE_DWORD = 0xffffffff,
}

alias D2D1_FILTER = uint;
enum : uint
{
    D2D1_FILTER_MIN_MAG_MIP_POINT               = 0x00000000,
    D2D1_FILTER_MIN_MAG_POINT_MIP_LINEAR        = 0x00000001,
    D2D1_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT  = 0x00000004,
    D2D1_FILTER_MIN_POINT_MAG_MIP_LINEAR        = 0x00000005,
    D2D1_FILTER_MIN_LINEAR_MAG_MIP_POINT        = 0x00000010,
    D2D1_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 0x00000011,
    D2D1_FILTER_MIN_MAG_LINEAR_MIP_POINT        = 0x00000014,
    D2D1_FILTER_MIN_MAG_MIP_LINEAR              = 0x00000015,
    D2D1_FILTER_ANISOTROPIC                     = 0x00000055,
    D2D1_FILTER_FORCE_DWORD                     = 0xffffffff,
}

alias D2D1_FEATURE = uint;
enum : uint
{
    D2D1_FEATURE_DOUBLES                  = 0x00000000,
    D2D1_FEATURE_D3D10_X_HARDWARE_OPTIONS = 0x00000001,
    D2D1_FEATURE_FORCE_DWORD              = 0xffffffff,
}

struct D2D1_PROPERTY_BINDING
{
    const(wchar)* propertyName;
    PD2D1_PROPERTY_SET_FUNCTION setFunction;
    PD2D1_PROPERTY_GET_FUNCTION getFunction;
}
struct D2D1_RESOURCE_TEXTURE_PROPERTIES
{
    const(uint)* extents;
    uint dimensions;
    D2D1_BUFFER_PRECISION bufferPrecision;
    D2D1_CHANNEL_DEPTH channelDepth;
    D2D1_FILTER filter;
    const(D2D1_EXTEND_MODE)* extendModes;
}
struct D2D1_INPUT_ELEMENT_DESC
{
    const(char)* semanticName;
    uint semanticIndex;
    DXGI_FORMAT format;
    uint inputSlot;
    uint alignedByteOffset;
}
struct D2D1_VERTEX_BUFFER_PROPERTIES
{
    uint inputCount;
    D2D1_VERTEX_USAGE usage;
    const(ubyte)* data;
    uint byteWidth;
}
struct D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES
{
    const(ubyte)* shaderBufferWithInputSignature;
    uint shaderBufferSize;
    const(D2D1_INPUT_ELEMENT_DESC)* inputElements;
    uint elementCount;
    uint stride;
}
struct D2D1_VERTEX_RANGE
{
    uint startVertex;
    uint vertexCount;
}
struct D2D1_BLEND_DESCRIPTION
{
    D2D1_BLEND sourceBlend;
    D2D1_BLEND destinationBlend;
    D2D1_BLEND_OPERATION blendOperation;
    D2D1_BLEND sourceBlendAlpha;
    D2D1_BLEND destinationBlendAlpha;
    D2D1_BLEND_OPERATION blendOperationAlpha;
    float[4] blendFactor;
}
struct D2D1_INPUT_DESCRIPTION
{
    D2D1_FILTER filter;
    uint levelOfDetailCount;
}
struct D2D1_FEATURE_DATA_DOUBLES
{
    BOOL doublePrecisionFloatShaderOps;
}
struct D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS
{
    BOOL computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x;
}
enum IID_ID2D1VertexBuffer = GUID(0x9b8b1336, 0xa5, 0x4668, [0x92, 0xb7, 0xce, 0xd5, 0xd8, 0xbf, 0x9b, 0x7b]);
interface ID2D1VertexBuffer : IUnknown
{
    HRESULT Map(ubyte**, uint);
    HRESULT Unmap();
}
enum IID_ID2D1ResourceTexture = GUID(0x688d15c3, 0x2b0, 0x438d, [0xb1, 0x3a, 0xd1, 0xb4, 0x4c, 0x32, 0xc3, 0x9a]);
interface ID2D1ResourceTexture : IUnknown
{
    HRESULT Update(const(uint)*, const(uint)*, const(uint)*, uint, const(ubyte)*, uint);
}
enum IID_ID2D1RenderInfo = GUID(0x519ae1bd, 0xd19a, 0x420d, [0xb8, 0x49, 0x36, 0x4f, 0x59, 0x47, 0x76, 0xb7]);
interface ID2D1RenderInfo : IUnknown
{
    HRESULT SetInputDescription(uint, D2D1_INPUT_DESCRIPTION);
    HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION, D2D1_CHANNEL_DEPTH);
    void SetCached(BOOL);
    void SetInstructionCountHint(uint);
}
enum IID_ID2D1DrawInfo = GUID(0x693ce632, 0x7f2f, 0x45de, [0x93, 0xfe, 0x18, 0xd8, 0x8b, 0x37, 0xaa, 0x21]);
interface ID2D1DrawInfo : ID2D1RenderInfo
{
    HRESULT SetPixelShaderConstantBuffer(const(ubyte)*, uint);
    HRESULT SetResourceTexture(uint, ID2D1ResourceTexture);
    HRESULT SetVertexShaderConstantBuffer(const(ubyte)*, uint);
    HRESULT SetPixelShader(const(GUID)*, D2D1_PIXEL_OPTIONS);
    HRESULT SetVertexProcessing(ID2D1VertexBuffer, D2D1_VERTEX_OPTIONS, const(D2D1_BLEND_DESCRIPTION)*, const(D2D1_VERTEX_RANGE)*, const(GUID)*);
}
enum IID_ID2D1ComputeInfo = GUID(0x5598b14b, 0x9fd7, 0x48b7, [0x9b, 0xdb, 0x8f, 0x9, 0x64, 0xeb, 0x38, 0xbc]);
interface ID2D1ComputeInfo : ID2D1RenderInfo
{
    HRESULT SetComputeShaderConstantBuffer(const(ubyte)*, uint);
    HRESULT SetComputeShader(const(GUID)*);
    HRESULT SetResourceTexture(uint, ID2D1ResourceTexture);
}
enum IID_ID2D1TransformNode = GUID(0xb2efe1e7, 0x729f, 0x4102, [0x94, 0x9f, 0x50, 0x5f, 0xa2, 0x1b, 0xf6, 0x66]);
interface ID2D1TransformNode : IUnknown
{
    uint GetInputCount();
}
enum IID_ID2D1TransformGraph = GUID(0x13d29038, 0xc3e6, 0x4034, [0x90, 0x81, 0x13, 0xb5, 0x3a, 0x41, 0x79, 0x92]);
interface ID2D1TransformGraph : IUnknown
{
    uint GetInputCount();
    HRESULT SetSingleTransformNode(ID2D1TransformNode);
    HRESULT AddNode(ID2D1TransformNode);
    HRESULT RemoveNode(ID2D1TransformNode);
    HRESULT SetOutputNode(ID2D1TransformNode);
    HRESULT ConnectNode(ID2D1TransformNode, ID2D1TransformNode, uint);
    HRESULT ConnectToEffectInput(uint, ID2D1TransformNode, uint);
    void Clear();
    HRESULT SetPassthroughGraph(uint);
}
enum IID_ID2D1Transform = GUID(0xef1a287d, 0x342a, 0x4f76, [0x8f, 0xdb, 0xda, 0xd, 0x6e, 0xa9, 0xf9, 0x2b]);
interface ID2D1Transform : ID2D1TransformNode
{
    HRESULT MapOutputRectToInputRects(const(RECT)*, RECT*, uint);
    HRESULT MapInputRectsToOutputRect(const(RECT)*, const(RECT)*, uint, RECT*, RECT*);
    HRESULT MapInvalidRect(uint, RECT, RECT*);
}
enum IID_ID2D1DrawTransform = GUID(0x36bfdcb6, 0x9739, 0x435d, [0xa3, 0xd, 0xa6, 0x53, 0xbe, 0xff, 0x6a, 0x6f]);
interface ID2D1DrawTransform : ID2D1Transform
{
    HRESULT SetDrawInfo(ID2D1DrawInfo);
}
enum IID_ID2D1ComputeTransform = GUID(0xd85573c, 0x1e3, 0x4f7d, [0xbf, 0xd9, 0xd, 0x60, 0x60, 0x8b, 0xf3, 0xc3]);
interface ID2D1ComputeTransform : ID2D1Transform
{
    HRESULT SetComputeInfo(ID2D1ComputeInfo);
    HRESULT CalculateThreadgroups(const(RECT)*, uint*, uint*, uint*);
}
enum IID_ID2D1AnalysisTransform = GUID(0x359dc30, 0x95e6, 0x4568, [0x90, 0x55, 0x27, 0x72, 0xd, 0x13, 0xe, 0x93]);
interface ID2D1AnalysisTransform : IUnknown
{
    HRESULT ProcessAnalysisResults(const(ubyte)*, uint);
}
enum IID_ID2D1SourceTransform = GUID(0xdb1800dd, 0xc34, 0x4cf9, [0xbe, 0x90, 0x31, 0xcc, 0xa, 0x56, 0x53, 0xe1]);
interface ID2D1SourceTransform : ID2D1Transform
{
    HRESULT SetRenderInfo(ID2D1RenderInfo);
    HRESULT Draw(ID2D1Bitmap1, const(RECT)*, D2D_POINT_2U);
}
enum IID_ID2D1ConcreteTransform = GUID(0x1a799d8a, 0x69f7, 0x4e4c, [0x9f, 0xed, 0x43, 0x7c, 0xcc, 0x66, 0x84, 0xcc]);
interface ID2D1ConcreteTransform : ID2D1TransformNode
{
    HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION, D2D1_CHANNEL_DEPTH);
    void SetCached(BOOL);
}
enum IID_ID2D1BlendTransform = GUID(0x63ac0b32, 0xba44, 0x450f, [0x88, 0x6, 0x7f, 0x4c, 0xa1, 0xff, 0x2f, 0x1b]);
interface ID2D1BlendTransform : ID2D1ConcreteTransform
{
    void SetDescription(const(D2D1_BLEND_DESCRIPTION)*);
    void GetDescription(D2D1_BLEND_DESCRIPTION*);
}
enum IID_ID2D1BorderTransform = GUID(0x4998735c, 0x3a19, 0x473c, [0x97, 0x81, 0x65, 0x68, 0x47, 0xe3, 0xa3, 0x47]);
interface ID2D1BorderTransform : ID2D1ConcreteTransform
{
    void SetExtendModeX(D2D1_EXTEND_MODE);
    void SetExtendModeY(D2D1_EXTEND_MODE);
    D2D1_EXTEND_MODE GetExtendModeX();
    D2D1_EXTEND_MODE GetExtendModeY();
}
enum IID_ID2D1OffsetTransform = GUID(0x3fe6adea, 0x7643, 0x4f53, [0xbd, 0x14, 0xa0, 0xce, 0x63, 0xf2, 0x40, 0x42]);
interface ID2D1OffsetTransform : ID2D1TransformNode
{
    void SetOffset(POINT);
    POINT GetOffset();
}
enum IID_ID2D1BoundsAdjustmentTransform = GUID(0x90f732e2, 0x5092, 0x4606, [0xa8, 0x19, 0x86, 0x51, 0x97, 0xb, 0xac, 0xcd]);
interface ID2D1BoundsAdjustmentTransform : ID2D1TransformNode
{
    void SetOutputBounds(const(RECT)*);
    void GetOutputBounds(RECT*);
}
enum IID_ID2D1EffectImpl = GUID(0xa248fd3f, 0x3e6c, 0x4e63, [0x9f, 0x3, 0x7f, 0x68, 0xec, 0xc9, 0x1d, 0xb9]);
interface ID2D1EffectImpl : IUnknown
{
    HRESULT Initialize(ID2D1EffectContext, ID2D1TransformGraph);
    HRESULT PrepareForRender(D2D1_CHANGE_TYPE);
    HRESULT SetGraph(ID2D1TransformGraph);
}
enum IID_ID2D1EffectContext = GUID(0x3d9f916b, 0x27dc, 0x4ad7, [0xb4, 0xf1, 0x64, 0x94, 0x53, 0x40, 0xf5, 0x63]);
interface ID2D1EffectContext : IUnknown
{
    void GetDpi(float*, float*);
    HRESULT CreateEffect(const(GUID)*, ID2D1Effect*);
    HRESULT GetMaximumSupportedFeatureLevel(const(D3D_FEATURE_LEVEL)*, uint, D3D_FEATURE_LEVEL*);
    HRESULT CreateTransformNodeFromEffect(ID2D1Effect, ID2D1TransformNode*);
    HRESULT CreateBlendTransform(uint, const(D2D1_BLEND_DESCRIPTION)*, ID2D1BlendTransform*);
    HRESULT CreateBorderTransform(D2D1_EXTEND_MODE, D2D1_EXTEND_MODE, ID2D1BorderTransform*);
    HRESULT CreateOffsetTransform(POINT, ID2D1OffsetTransform*);
    HRESULT CreateBoundsAdjustmentTransform(const(RECT)*, ID2D1BoundsAdjustmentTransform*);
    HRESULT LoadPixelShader(const(GUID)*, const(ubyte)*, uint);
    HRESULT LoadVertexShader(const(GUID)*, const(ubyte)*, uint);
    HRESULT LoadComputeShader(const(GUID)*, const(ubyte)*, uint);
    BOOL IsShaderLoaded(const(GUID)*);
    HRESULT CreateResourceTexture(const(GUID)*, const(D2D1_RESOURCE_TEXTURE_PROPERTIES)*, const(ubyte)*, const(uint)*, uint, ID2D1ResourceTexture*);
    HRESULT FindResourceTexture(const(GUID)*, ID2D1ResourceTexture*);
    HRESULT CreateVertexBuffer(const(D2D1_VERTEX_BUFFER_PROPERTIES)*, const(GUID)*, const(D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES)*, ID2D1VertexBuffer*);
    HRESULT FindVertexBuffer(const(GUID)*, ID2D1VertexBuffer*);
    HRESULT CreateColorContext(D2D1_COLOR_SPACE, const(ubyte)*, uint, ID2D1ColorContext*);
    HRESULT CreateColorContextFromFilename(const(wchar)*, ID2D1ColorContext*);
    HRESULT CreateColorContextFromWicColorContext(IWICColorContext, ID2D1ColorContext*);
    HRESULT CheckFeatureSupport(D2D1_FEATURE, void*, uint);
    BOOL IsBufferPrecisionSupported(D2D1_BUFFER_PRECISION);
}
alias D2D1_YCBCR_PROP = uint;
enum : uint
{
    D2D1_YCBCR_PROP_CHROMA_SUBSAMPLING = 0x00000000,
    D2D1_YCBCR_PROP_TRANSFORM_MATRIX   = 0x00000001,
    D2D1_YCBCR_PROP_INTERPOLATION_MODE = 0x00000002,
    D2D1_YCBCR_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_YCBCR_CHROMA_SUBSAMPLING = uint;
enum : uint
{
    D2D1_YCBCR_CHROMA_SUBSAMPLING_AUTO        = 0x00000000,
    D2D1_YCBCR_CHROMA_SUBSAMPLING_420         = 0x00000001,
    D2D1_YCBCR_CHROMA_SUBSAMPLING_422         = 0x00000002,
    D2D1_YCBCR_CHROMA_SUBSAMPLING_444         = 0x00000003,
    D2D1_YCBCR_CHROMA_SUBSAMPLING_440         = 0x00000004,
    D2D1_YCBCR_CHROMA_SUBSAMPLING_FORCE_DWORD = 0xffffffff,
}

alias D2D1_YCBCR_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_YCBCR_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_YCBCR_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_YCBCR_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_YCBCR_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_YCBCR_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_YCBCR_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
    D2D1_YCBCR_INTERPOLATION_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_CONTRAST_PROP = uint;
enum : uint
{
    D2D1_CONTRAST_PROP_CONTRAST    = 0x00000000,
    D2D1_CONTRAST_PROP_CLAMP_INPUT = 0x00000001,
    D2D1_CONTRAST_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_RGBTOHUE_PROP = uint;
enum : uint
{
    D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE = 0x00000000,
    D2D1_RGBTOHUE_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE = uint;
enum : uint
{
    D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_VALUE     = 0x00000000,
    D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS = 0x00000001,
    D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_FORCE_DWORD              = 0xffffffff,
}

alias D2D1_HUETORGB_PROP = uint;
enum : uint
{
    D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE = 0x00000000,
    D2D1_HUETORGB_PROP_FORCE_DWORD       = 0xffffffff,
}

alias D2D1_HUETORGB_INPUT_COLOR_SPACE = uint;
enum : uint
{
    D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_VALUE     = 0x00000000,
    D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS = 0x00000001,
    D2D1_HUETORGB_INPUT_COLOR_SPACE_FORCE_DWORD              = 0xffffffff,
}

alias D2D1_CHROMAKEY_PROP = uint;
enum : uint
{
    D2D1_CHROMAKEY_PROP_COLOR        = 0x00000000,
    D2D1_CHROMAKEY_PROP_TOLERANCE    = 0x00000001,
    D2D1_CHROMAKEY_PROP_INVERT_ALPHA = 0x00000002,
    D2D1_CHROMAKEY_PROP_FEATHER      = 0x00000003,
    D2D1_CHROMAKEY_PROP_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_EMBOSS_PROP = uint;
enum : uint
{
    D2D1_EMBOSS_PROP_HEIGHT      = 0x00000000,
    D2D1_EMBOSS_PROP_DIRECTION   = 0x00000001,
    D2D1_EMBOSS_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_EXPOSURE_PROP = uint;
enum : uint
{
    D2D1_EXPOSURE_PROP_EXPOSURE_VALUE = 0x00000000,
    D2D1_EXPOSURE_PROP_FORCE_DWORD    = 0xffffffff,
}

alias D2D1_POSTERIZE_PROP = uint;
enum : uint
{
    D2D1_POSTERIZE_PROP_RED_VALUE_COUNT   = 0x00000000,
    D2D1_POSTERIZE_PROP_GREEN_VALUE_COUNT = 0x00000001,
    D2D1_POSTERIZE_PROP_BLUE_VALUE_COUNT  = 0x00000002,
    D2D1_POSTERIZE_PROP_FORCE_DWORD       = 0xffffffff,
}

alias D2D1_SEPIA_PROP = uint;
enum : uint
{
    D2D1_SEPIA_PROP_INTENSITY   = 0x00000000,
    D2D1_SEPIA_PROP_ALPHA_MODE  = 0x00000001,
    D2D1_SEPIA_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SHARPEN_PROP = uint;
enum : uint
{
    D2D1_SHARPEN_PROP_SHARPNESS   = 0x00000000,
    D2D1_SHARPEN_PROP_THRESHOLD   = 0x00000001,
    D2D1_SHARPEN_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_STRAIGHTEN_PROP = uint;
enum : uint
{
    D2D1_STRAIGHTEN_PROP_ANGLE         = 0x00000000,
    D2D1_STRAIGHTEN_PROP_MAINTAIN_SIZE = 0x00000001,
    D2D1_STRAIGHTEN_PROP_SCALE_MODE    = 0x00000002,
    D2D1_STRAIGHTEN_PROP_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_STRAIGHTEN_SCALE_MODE = uint;
enum : uint
{
    D2D1_STRAIGHTEN_SCALE_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_STRAIGHTEN_SCALE_MODE_LINEAR              = 0x00000001,
    D2D1_STRAIGHTEN_SCALE_MODE_CUBIC               = 0x00000002,
    D2D1_STRAIGHTEN_SCALE_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_STRAIGHTEN_SCALE_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_STRAIGHTEN_SCALE_MODE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_TEMPERATUREANDTINT_PROP = uint;
enum : uint
{
    D2D1_TEMPERATUREANDTINT_PROP_TEMPERATURE = 0x00000000,
    D2D1_TEMPERATUREANDTINT_PROP_TINT        = 0x00000001,
    D2D1_TEMPERATUREANDTINT_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_VIGNETTE_PROP = uint;
enum : uint
{
    D2D1_VIGNETTE_PROP_COLOR           = 0x00000000,
    D2D1_VIGNETTE_PROP_TRANSITION_SIZE = 0x00000001,
    D2D1_VIGNETTE_PROP_STRENGTH        = 0x00000002,
    D2D1_VIGNETTE_PROP_FORCE_DWORD     = 0xffffffff,
}

alias D2D1_EDGEDETECTION_PROP = uint;
enum : uint
{
    D2D1_EDGEDETECTION_PROP_STRENGTH      = 0x00000000,
    D2D1_EDGEDETECTION_PROP_BLUR_RADIUS   = 0x00000001,
    D2D1_EDGEDETECTION_PROP_MODE          = 0x00000002,
    D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES = 0x00000003,
    D2D1_EDGEDETECTION_PROP_ALPHA_MODE    = 0x00000004,
    D2D1_EDGEDETECTION_PROP_FORCE_DWORD   = 0xffffffff,
}

alias D2D1_EDGEDETECTION_MODE = uint;
enum : uint
{
    D2D1_EDGEDETECTION_MODE_SOBEL       = 0x00000000,
    D2D1_EDGEDETECTION_MODE_PREWITT     = 0x00000001,
    D2D1_EDGEDETECTION_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_HIGHLIGHTSANDSHADOWS_PROP = uint;
enum : uint
{
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_HIGHLIGHTS       = 0x00000000,
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_SHADOWS          = 0x00000001,
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_CLARITY          = 0x00000002,
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA      = 0x00000003,
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_MASK_BLUR_RADIUS = 0x00000004,
    D2D1_HIGHLIGHTSANDSHADOWS_PROP_FORCE_DWORD      = 0xffffffff,
}

alias D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA = uint;
enum : uint
{
    D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_LINEAR      = 0x00000000,
    D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_SRGB        = 0x00000001,
    D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_FORCE_DWORD = 0xffffffff,
}

alias D2D1_LOOKUPTABLE3D_PROP = uint;
enum : uint
{
    D2D1_LOOKUPTABLE3D_PROP_LUT         = 0x00000000,
    D2D1_LOOKUPTABLE3D_PROP_ALPHA_MODE  = 0x00000001,
    D2D1_LOOKUPTABLE3D_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_OPACITY_PROP = uint;
enum : uint
{
    D2D1_OPACITY_PROP_OPACITY     = 0x00000000,
    D2D1_OPACITY_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_CROSSFADE_PROP = uint;
enum : uint
{
    D2D1_CROSSFADE_PROP_WEIGHT      = 0x00000000,
    D2D1_CROSSFADE_PROP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_TINT_PROP = uint;
enum : uint
{
    D2D1_TINT_PROP_COLOR        = 0x00000000,
    D2D1_TINT_PROP_CLAMP_OUTPUT = 0x00000001,
    D2D1_TINT_PROP_FORCE_DWORD  = 0xffffffff,
}

alias D2D1_WHITELEVELADJUSTMENT_PROP = uint;
enum : uint
{
    D2D1_WHITELEVELADJUSTMENT_PROP_INPUT_WHITE_LEVEL  = 0x00000000,
    D2D1_WHITELEVELADJUSTMENT_PROP_OUTPUT_WHITE_LEVEL = 0x00000001,
    D2D1_WHITELEVELADJUSTMENT_PROP_FORCE_DWORD        = 0xffffffff,
}

alias D2D1_HDRTONEMAP_PROP = uint;
enum : uint
{
    D2D1_HDRTONEMAP_PROP_INPUT_MAX_LUMINANCE  = 0x00000000,
    D2D1_HDRTONEMAP_PROP_OUTPUT_MAX_LUMINANCE = 0x00000001,
    D2D1_HDRTONEMAP_PROP_DISPLAY_MODE         = 0x00000002,
    D2D1_HDRTONEMAP_PROP_FORCE_DWORD          = 0xffffffff,
}

alias D2D1_HDRTONEMAP_DISPLAY_MODE = uint;
enum : uint
{
    D2D1_HDRTONEMAP_DISPLAY_MODE_SDR         = 0x00000000,
    D2D1_HDRTONEMAP_DISPLAY_MODE_HDR         = 0x00000001,
    D2D1_HDRTONEMAP_DISPLAY_MODE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_RENDERING_PRIORITY = uint;
enum : uint
{
    D2D1_RENDERING_PRIORITY_NORMAL      = 0x00000000,
    D2D1_RENDERING_PRIORITY_LOW         = 0x00000001,
    D2D1_RENDERING_PRIORITY_FORCE_DWORD = 0xffffffff,
}

enum IID_ID2D1GeometryRealization = GUID(0xa16907d7, 0xbc02, 0x4801, [0x99, 0xe8, 0x8c, 0xf7, 0xf4, 0x85, 0xf7, 0x74]);
interface ID2D1GeometryRealization : ID2D1Resource
{
}
enum IID_ID2D1DeviceContext1 = GUID(0xd37f57e4, 0x6908, 0x459f, [0xa1, 0x99, 0xe7, 0x2f, 0x24, 0xf7, 0x99, 0x87]);
interface ID2D1DeviceContext1 : ID2D1DeviceContext
{
    HRESULT CreateFilledGeometryRealization(ID2D1Geometry, float, ID2D1GeometryRealization*);
    HRESULT CreateStrokedGeometryRealization(ID2D1Geometry, float, float, ID2D1StrokeStyle, ID2D1GeometryRealization*);
    void DrawGeometryRealization(ID2D1GeometryRealization, ID2D1Brush);
}
enum IID_ID2D1Device1 = GUID(0xd21768e1, 0x23a4, 0x4823, [0xa1, 0x4b, 0x7c, 0x3e, 0xba, 0x85, 0xd6, 0x58]);
interface ID2D1Device1 : ID2D1Device
{
    D2D1_RENDERING_PRIORITY GetRenderingPriority();
    void SetRenderingPriority(D2D1_RENDERING_PRIORITY);
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext1*);
}
enum IID_ID2D1Factory2 = GUID(0x94f81a73, 0x9212, 0x4376, [0x9c, 0x58, 0xb1, 0x6a, 0x3a, 0xd, 0x39, 0x92]);
interface ID2D1Factory2 : ID2D1Factory1
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device1*);
}
enum IID_ID2D1CommandSink1 = GUID(0x9eb767fd, 0x4269, 0x4467, [0xb8, 0xc2, 0xeb, 0x30, 0xcb, 0x30, 0x57, 0x43]);
interface ID2D1CommandSink1 : ID2D1CommandSink
{
    HRESULT SetPrimitiveBlend1(D2D1_PRIMITIVE_BLEND);
}
alias D2D1_SVG_PAINT_TYPE = uint;
enum : uint
{
    D2D1_SVG_PAINT_TYPE_NONE              = 0x00000000,
    D2D1_SVG_PAINT_TYPE_COLOR             = 0x00000001,
    D2D1_SVG_PAINT_TYPE_CURRENT_COLOR     = 0x00000002,
    D2D1_SVG_PAINT_TYPE_URI               = 0x00000003,
    D2D1_SVG_PAINT_TYPE_URI_NONE          = 0x00000004,
    D2D1_SVG_PAINT_TYPE_URI_COLOR         = 0x00000005,
    D2D1_SVG_PAINT_TYPE_URI_CURRENT_COLOR = 0x00000006,
    D2D1_SVG_PAINT_TYPE_FORCE_DWORD       = 0xffffffff,
}

alias D2D1_SVG_LENGTH_UNITS = uint;
enum : uint
{
    D2D1_SVG_LENGTH_UNITS_NUMBER      = 0x00000000,
    D2D1_SVG_LENGTH_UNITS_PERCENTAGE  = 0x00000001,
    D2D1_SVG_LENGTH_UNITS_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_DISPLAY = uint;
enum : uint
{
    D2D1_SVG_DISPLAY_INLINE      = 0x00000000,
    D2D1_SVG_DISPLAY_NONE        = 0x00000001,
    D2D1_SVG_DISPLAY_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_VISIBILITY = uint;
enum : uint
{
    D2D1_SVG_VISIBILITY_VISIBLE     = 0x00000000,
    D2D1_SVG_VISIBILITY_HIDDEN      = 0x00000001,
    D2D1_SVG_VISIBILITY_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_OVERFLOW = uint;
enum : uint
{
    D2D1_SVG_OVERFLOW_VISIBLE     = 0x00000000,
    D2D1_SVG_OVERFLOW_HIDDEN      = 0x00000001,
    D2D1_SVG_OVERFLOW_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_LINE_CAP = uint;
enum : uint
{
    D2D1_SVG_LINE_CAP_BUTT        = 0x00000000,
    D2D1_SVG_LINE_CAP_SQUARE      = 0x00000001,
    D2D1_SVG_LINE_CAP_ROUND       = 0x00000002,
    D2D1_SVG_LINE_CAP_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_LINE_JOIN = uint;
enum : uint
{
    D2D1_SVG_LINE_JOIN_BEVEL       = 0x00000001,
    D2D1_SVG_LINE_JOIN_MITER       = 0x00000003,
    D2D1_SVG_LINE_JOIN_ROUND       = 0x00000002,
    D2D1_SVG_LINE_JOIN_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_ASPECT_ALIGN = uint;
enum : uint
{
    D2D1_SVG_ASPECT_ALIGN_NONE        = 0x00000000,
    D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MIN = 0x00000001,
    D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MIN = 0x00000002,
    D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MIN = 0x00000003,
    D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MID = 0x00000004,
    D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MID = 0x00000005,
    D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MID = 0x00000006,
    D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MAX = 0x00000007,
    D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MAX = 0x00000008,
    D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MAX = 0x00000009,
    D2D1_SVG_ASPECT_ALIGN_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_ASPECT_SCALING = uint;
enum : uint
{
    D2D1_SVG_ASPECT_SCALING_MEET        = 0x00000000,
    D2D1_SVG_ASPECT_SCALING_SLICE       = 0x00000001,
    D2D1_SVG_ASPECT_SCALING_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_PATH_COMMAND = uint;
enum : uint
{
    D2D1_SVG_PATH_COMMAND_CLOSE_PATH                = 0x00000000,
    D2D1_SVG_PATH_COMMAND_MOVE_ABSOLUTE             = 0x00000001,
    D2D1_SVG_PATH_COMMAND_MOVE_RELATIVE             = 0x00000002,
    D2D1_SVG_PATH_COMMAND_LINE_ABSOLUTE             = 0x00000003,
    D2D1_SVG_PATH_COMMAND_LINE_RELATIVE             = 0x00000004,
    D2D1_SVG_PATH_COMMAND_CUBIC_ABSOLUTE            = 0x00000005,
    D2D1_SVG_PATH_COMMAND_CUBIC_RELATIVE            = 0x00000006,
    D2D1_SVG_PATH_COMMAND_QUADRADIC_ABSOLUTE        = 0x00000007,
    D2D1_SVG_PATH_COMMAND_QUADRADIC_RELATIVE        = 0x00000008,
    D2D1_SVG_PATH_COMMAND_ARC_ABSOLUTE              = 0x00000009,
    D2D1_SVG_PATH_COMMAND_ARC_RELATIVE              = 0x0000000a,
    D2D1_SVG_PATH_COMMAND_HORIZONTAL_ABSOLUTE       = 0x0000000b,
    D2D1_SVG_PATH_COMMAND_HORIZONTAL_RELATIVE       = 0x0000000c,
    D2D1_SVG_PATH_COMMAND_VERTICAL_ABSOLUTE         = 0x0000000d,
    D2D1_SVG_PATH_COMMAND_VERTICAL_RELATIVE         = 0x0000000e,
    D2D1_SVG_PATH_COMMAND_CUBIC_SMOOTH_ABSOLUTE     = 0x0000000f,
    D2D1_SVG_PATH_COMMAND_CUBIC_SMOOTH_RELATIVE     = 0x00000010,
    D2D1_SVG_PATH_COMMAND_QUADRADIC_SMOOTH_ABSOLUTE = 0x00000011,
    D2D1_SVG_PATH_COMMAND_QUADRADIC_SMOOTH_RELATIVE = 0x00000012,
    D2D1_SVG_PATH_COMMAND_FORCE_DWORD               = 0xffffffff,
}

alias D2D1_SVG_UNIT_TYPE = uint;
enum : uint
{
    D2D1_SVG_UNIT_TYPE_USER_SPACE_ON_USE   = 0x00000000,
    D2D1_SVG_UNIT_TYPE_OBJECT_BOUNDING_BOX = 0x00000001,
    D2D1_SVG_UNIT_TYPE_FORCE_DWORD         = 0xffffffff,
}

alias D2D1_SVG_ATTRIBUTE_STRING_TYPE = uint;
enum : uint
{
    D2D1_SVG_ATTRIBUTE_STRING_TYPE_SVG         = 0x00000000,
    D2D1_SVG_ATTRIBUTE_STRING_TYPE_ID          = 0x00000001,
    D2D1_SVG_ATTRIBUTE_STRING_TYPE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_SVG_ATTRIBUTE_POD_TYPE = uint;
enum : uint
{
    D2D1_SVG_ATTRIBUTE_POD_TYPE_FLOAT                 = 0x00000000,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_COLOR                 = 0x00000001,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_FILL_MODE             = 0x00000002,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_DISPLAY               = 0x00000003,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_OVERFLOW              = 0x00000004,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_CAP              = 0x00000005,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_JOIN             = 0x00000006,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_VISIBILITY            = 0x00000007,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_MATRIX                = 0x00000008,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_UNIT_TYPE             = 0x00000009,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_EXTEND_MODE           = 0x0000000a,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_PRESERVE_ASPECT_RATIO = 0x0000000b,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_VIEWBOX               = 0x0000000c,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_LENGTH                = 0x0000000d,
    D2D1_SVG_ATTRIBUTE_POD_TYPE_FORCE_DWORD           = 0xffffffff,
}

struct D2D1_SVG_LENGTH
{
    float value;
    D2D1_SVG_LENGTH_UNITS units;
}
struct D2D1_SVG_PRESERVE_ASPECT_RATIO
{
    BOOL defer;
    D2D1_SVG_ASPECT_ALIGN align_;
    D2D1_SVG_ASPECT_SCALING meetOrSlice;
}
struct D2D1_SVG_VIEWBOX
{
    float x;
    float y;
    float width;
    float height;
}
enum IID_ID2D1SvgAttribute = GUID(0xc9cdb0dd, 0xf8c9, 0x4e70, [0xb7, 0xc2, 0x30, 0x1c, 0x80, 0x29, 0x2c, 0x5e]);
interface ID2D1SvgAttribute : ID2D1Resource
{
    void GetElement(ID2D1SvgElement*);
    HRESULT Clone(ID2D1SvgAttribute*);
}
enum IID_ID2D1SvgPaint = GUID(0xd59bab0a, 0x68a2, 0x455b, [0xa5, 0xdc, 0x9e, 0xb2, 0x85, 0x4e, 0x24, 0x90]);
interface ID2D1SvgPaint : ID2D1SvgAttribute
{
    HRESULT SetPaintType(D2D1_SVG_PAINT_TYPE);
    D2D1_SVG_PAINT_TYPE GetPaintType();
    HRESULT SetColor(const(D2D1_COLOR_F)*);
    void GetColor(D2D1_COLOR_F*);
    HRESULT SetId(const(wchar)*);
    HRESULT GetId(PWSTR, uint);
    uint GetIdLength();
}
enum IID_ID2D1SvgStrokeDashArray = GUID(0xf1c0ca52, 0x92a3, 0x4f00, [0xb4, 0xce, 0xf3, 0x56, 0x91, 0xef, 0xd9, 0xd9]);
interface ID2D1SvgStrokeDashArray : ID2D1SvgAttribute
{
    HRESULT RemoveDashesAtEnd(uint);
    HRESULT UpdateDashes(const(D2D1_SVG_LENGTH)*, uint, uint);
    HRESULT UpdateDashes(const(float)*, uint, uint);
    HRESULT GetDashes(D2D1_SVG_LENGTH*, uint, uint);
    HRESULT GetDashes(float*, uint, uint);
    uint GetDashesCount();
}
enum IID_ID2D1SvgPointCollection = GUID(0x9dbe4c0d, 0x3572, 0x4dd9, [0x98, 0x25, 0x55, 0x30, 0x81, 0x3b, 0xb7, 0x12]);
interface ID2D1SvgPointCollection : ID2D1SvgAttribute
{
    HRESULT RemovePointsAtEnd(uint);
    HRESULT UpdatePoints(const(D2D_POINT_2F)*, uint, uint);
    HRESULT GetPoints(D2D_POINT_2F*, uint, uint);
    uint GetPointsCount();
}
enum IID_ID2D1SvgPathData = GUID(0xc095e4f4, 0xbb98, 0x43d6, [0x97, 0x45, 0x4d, 0x1b, 0x84, 0xec, 0x98, 0x88]);
interface ID2D1SvgPathData : ID2D1SvgAttribute
{
    HRESULT RemoveSegmentDataAtEnd(uint);
    HRESULT UpdateSegmentData(const(float)*, uint, uint);
    HRESULT GetSegmentData(float*, uint, uint);
    uint GetSegmentDataCount();
    HRESULT RemoveCommandsAtEnd(uint);
    HRESULT UpdateCommands(const(D2D1_SVG_PATH_COMMAND)*, uint, uint);
    HRESULT GetCommands(D2D1_SVG_PATH_COMMAND*, uint, uint);
    uint GetCommandsCount();
    HRESULT CreatePathGeometry(D2D1_FILL_MODE, ID2D1PathGeometry1*);
}
enum IID_ID2D1SvgElement = GUID(0xac7b67a6, 0x183e, 0x49c1, [0xa8, 0x23, 0xe, 0xbe, 0x40, 0xb0, 0xdb, 0x29]);
interface ID2D1SvgElement : ID2D1Resource
{
    void GetDocument(ID2D1SvgDocument*);
    HRESULT GetTagName(PWSTR, uint);
    uint GetTagNameLength();
    BOOL IsTextContent();
    void GetParent(ID2D1SvgElement*);
    BOOL HasChildren();
    void GetFirstChild(ID2D1SvgElement*);
    void GetLastChild(ID2D1SvgElement*);
    HRESULT GetPreviousChild(ID2D1SvgElement, ID2D1SvgElement*);
    HRESULT GetNextChild(ID2D1SvgElement, ID2D1SvgElement*);
    HRESULT InsertChildBefore(ID2D1SvgElement, ID2D1SvgElement);
    HRESULT AppendChild(ID2D1SvgElement);
    HRESULT ReplaceChild(ID2D1SvgElement, ID2D1SvgElement);
    HRESULT RemoveChild(ID2D1SvgElement);
    HRESULT CreateChild(const(wchar)*, ID2D1SvgElement*);
    BOOL IsAttributeSpecified(const(wchar)*, BOOL*);
    uint GetSpecifiedAttributeCount();
    HRESULT GetSpecifiedAttributeName(uint, PWSTR, uint, BOOL*);
    HRESULT GetSpecifiedAttributeNameLength(uint, uint*, BOOL*);
    HRESULT RemoveAttribute(const(wchar)*);
    HRESULT SetTextValue(const(wchar)*, uint);
    HRESULT GetTextValue(PWSTR, uint);
    uint GetTextValueLength();
    HRESULT SetAttributeValue(const(wchar)*, ID2D1SvgAttribute);
    HRESULT SetAttributeValue(const(wchar)*, D2D1_SVG_ATTRIBUTE_POD_TYPE, const(void)*, uint);
    HRESULT SetAttributeValue(const(wchar)*, D2D1_SVG_ATTRIBUTE_STRING_TYPE, const(wchar)*);
    HRESULT GetAttributeValue(const(wchar)*, const(GUID)*, void**);
    HRESULT GetAttributeValue(const(wchar)*, D2D1_SVG_ATTRIBUTE_POD_TYPE, void*, uint);
    HRESULT GetAttributeValue(const(wchar)*, D2D1_SVG_ATTRIBUTE_STRING_TYPE, PWSTR, uint);
    HRESULT GetAttributeValueLength(const(wchar)*, D2D1_SVG_ATTRIBUTE_STRING_TYPE, uint*);
}
enum IID_ID2D1SvgDocument = GUID(0x86b88e4d, 0xafa4, 0x4d7b, [0x88, 0xe4, 0x68, 0xa5, 0x1c, 0x4a, 0xa, 0xec]);
interface ID2D1SvgDocument : ID2D1Resource
{
    HRESULT SetViewportSize(D2D_SIZE_F);
    D2D_SIZE_F GetViewportSize();
    HRESULT SetRoot(ID2D1SvgElement);
    void GetRoot(ID2D1SvgElement*);
    HRESULT FindElementById(const(wchar)*, ID2D1SvgElement*);
    HRESULT Serialize(IStream, ID2D1SvgElement);
    HRESULT Deserialize(IStream, ID2D1SvgElement*);
    HRESULT CreatePaint(D2D1_SVG_PAINT_TYPE, const(D2D1_COLOR_F)*, const(wchar)*, ID2D1SvgPaint*);
    HRESULT CreateStrokeDashArray(const(D2D1_SVG_LENGTH)*, uint, ID2D1SvgStrokeDashArray*);
    HRESULT CreatePointCollection(const(D2D_POINT_2F)*, uint, ID2D1SvgPointCollection*);
    HRESULT CreatePathData(const(float)*, uint, const(D2D1_SVG_PATH_COMMAND)*, uint, ID2D1SvgPathData*);
}
alias D2D1_INK_NIB_SHAPE = uint;
enum : uint
{
    D2D1_INK_NIB_SHAPE_ROUND       = 0x00000000,
    D2D1_INK_NIB_SHAPE_SQUARE      = 0x00000001,
    D2D1_INK_NIB_SHAPE_FORCE_DWORD = 0xffffffff,
}

alias D2D1_ORIENTATION = uint;
enum : uint
{
    D2D1_ORIENTATION_DEFAULT                             = 0x00000001,
    D2D1_ORIENTATION_FLIP_HORIZONTAL                     = 0x00000002,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE180                 = 0x00000003,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 0x00000004,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE90_FLIP_HORIZONTAL  = 0x00000005,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE270                 = 0x00000006,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 0x00000007,
    D2D1_ORIENTATION_ROTATE_CLOCKWISE90                  = 0x00000008,
    D2D1_ORIENTATION_FORCE_DWORD                         = 0xffffffff,
}

alias D2D1_IMAGE_SOURCE_LOADING_OPTIONS = uint;
enum : uint
{
    D2D1_IMAGE_SOURCE_LOADING_OPTIONS_NONE            = 0x00000000,
    D2D1_IMAGE_SOURCE_LOADING_OPTIONS_RELEASE_SOURCE  = 0x00000001,
    D2D1_IMAGE_SOURCE_LOADING_OPTIONS_CACHE_ON_DEMAND = 0x00000002,
    D2D1_IMAGE_SOURCE_LOADING_OPTIONS_FORCE_DWORD     = 0xffffffff,
}

alias D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS = uint;
enum : uint
{
    D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_NONE                           = 0x00000000,
    D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_LOW_QUALITY_PRIMARY_CONVERSION = 0x00000001,
    D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_FORCE_DWORD                    = 0xffffffff,
}

alias D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS = uint;
enum : uint
{
    D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS_NONE              = 0x00000000,
    D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS_DISABLE_DPI_SCALE = 0x00000001,
    D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS_FORCE_DWORD       = 0xffffffff,
}

struct D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES
{
    D2D1_ORIENTATION orientation;
    float scaleX;
    float scaleY;
    D2D1_INTERPOLATION_MODE interpolationMode;
    D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS options;
}
struct D2D1_INK_POINT
{
    float x;
    float y;
    float radius;
}
struct D2D1_INK_BEZIER_SEGMENT
{
    D2D1_INK_POINT point1;
    D2D1_INK_POINT point2;
    D2D1_INK_POINT point3;
}
struct D2D1_INK_STYLE_PROPERTIES
{
    D2D1_INK_NIB_SHAPE nibShape;
    D2D_MATRIX_3X2_F nibTransform;
}
alias D2D1_PATCH_EDGE_MODE = uint;
enum : uint
{
    D2D1_PATCH_EDGE_MODE_ALIASED          = 0x00000000,
    D2D1_PATCH_EDGE_MODE_ANTIALIASED      = 0x00000001,
    D2D1_PATCH_EDGE_MODE_ALIASED_INFLATED = 0x00000002,
    D2D1_PATCH_EDGE_MODE_FORCE_DWORD      = 0xffffffff,
}

struct D2D1_GRADIENT_MESH_PATCH
{
    D2D_POINT_2F point00;
    D2D_POINT_2F point01;
    D2D_POINT_2F point02;
    D2D_POINT_2F point03;
    D2D_POINT_2F point10;
    D2D_POINT_2F point11;
    D2D_POINT_2F point12;
    D2D_POINT_2F point13;
    D2D_POINT_2F point20;
    D2D_POINT_2F point21;
    D2D_POINT_2F point22;
    D2D_POINT_2F point23;
    D2D_POINT_2F point30;
    D2D_POINT_2F point31;
    D2D_POINT_2F point32;
    D2D_POINT_2F point33;
    D2D1_COLOR_F color00;
    D2D1_COLOR_F color03;
    D2D1_COLOR_F color30;
    D2D1_COLOR_F color33;
    D2D1_PATCH_EDGE_MODE topEdgeMode;
    D2D1_PATCH_EDGE_MODE leftEdgeMode;
    D2D1_PATCH_EDGE_MODE bottomEdgeMode;
    D2D1_PATCH_EDGE_MODE rightEdgeMode;
}
alias D2D1_SPRITE_OPTIONS = uint;
enum : uint
{
    D2D1_SPRITE_OPTIONS_NONE                      = 0x00000000,
    D2D1_SPRITE_OPTIONS_CLAMP_TO_SOURCE_RECTANGLE = 0x00000001,
    D2D1_SPRITE_OPTIONS_FORCE_DWORD               = 0xffffffff,
}

alias D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION = uint;
enum : uint
{
    D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION_DEFAULT     = 0x00000000,
    D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION_DISABLE     = 0x00000001,
    D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION_FORCE_DWORD = 0xffffffff,
}

alias D2D1_GAMMA1 = uint;
enum : uint
{
    D2D1_GAMMA1_G22         = 0x00000000,
    D2D1_GAMMA1_G10         = 0x00000001,
    D2D1_GAMMA1_G2084       = 0x00000002,
    D2D1_GAMMA1_FORCE_DWORD = 0xffffffff,
}

struct D2D1_SIMPLE_COLOR_PROFILE
{
    D2D_POINT_2F redPrimary;
    D2D_POINT_2F greenPrimary;
    D2D_POINT_2F bluePrimary;
    D2D_POINT_2F whitePointXZ;
    D2D1_GAMMA1 gamma;
}
alias D2D1_COLOR_CONTEXT_TYPE = uint;
enum : uint
{
    D2D1_COLOR_CONTEXT_TYPE_ICC         = 0x00000000,
    D2D1_COLOR_CONTEXT_TYPE_SIMPLE      = 0x00000001,
    D2D1_COLOR_CONTEXT_TYPE_DXGI        = 0x00000002,
    D2D1_COLOR_CONTEXT_TYPE_FORCE_DWORD = 0xffffffff,
}

enum IID_ID2D1InkStyle = GUID(0xbae8b344, 0x23fc, 0x4071, [0x8c, 0xb5, 0xd0, 0x5d, 0x6f, 0x7, 0x38, 0x48]);
interface ID2D1InkStyle : ID2D1Resource
{
    void SetNibTransform(const(D2D_MATRIX_3X2_F)*);
    void GetNibTransform(D2D_MATRIX_3X2_F*);
    void SetNibShape(D2D1_INK_NIB_SHAPE);
    D2D1_INK_NIB_SHAPE GetNibShape();
}
enum IID_ID2D1Ink = GUID(0xb499923b, 0x7029, 0x478f, [0xa8, 0xb3, 0x43, 0x2c, 0x7c, 0x5f, 0x53, 0x12]);
interface ID2D1Ink : ID2D1Resource
{
    void SetStartPoint(const(D2D1_INK_POINT)*);
    D2D1_INK_POINT GetStartPoint();
    HRESULT AddSegments(const(D2D1_INK_BEZIER_SEGMENT)*, uint);
    HRESULT RemoveSegmentsAtEnd(uint);
    HRESULT SetSegments(uint, const(D2D1_INK_BEZIER_SEGMENT)*, uint);
    HRESULT SetSegmentAtEnd(const(D2D1_INK_BEZIER_SEGMENT)*);
    uint GetSegmentCount();
    HRESULT GetSegments(uint, D2D1_INK_BEZIER_SEGMENT*, uint);
    HRESULT StreamAsGeometry(ID2D1InkStyle, const(D2D_MATRIX_3X2_F)*, float, ID2D1SimplifiedGeometrySink);
    HRESULT GetBounds(ID2D1InkStyle, const(D2D_MATRIX_3X2_F)*, D2D_RECT_F*);
}
enum IID_ID2D1GradientMesh = GUID(0xf292e401, 0xc050, 0x4cde, [0x83, 0xd7, 0x4, 0x96, 0x2d, 0x3b, 0x23, 0xc2]);
interface ID2D1GradientMesh : ID2D1Resource
{
    uint GetPatchCount();
    HRESULT GetPatches(uint, D2D1_GRADIENT_MESH_PATCH*, uint);
}
enum IID_ID2D1ImageSource = GUID(0xc9b664e5, 0x74a1, 0x4378, [0x9a, 0xc2, 0xee, 0xfc, 0x37, 0xa3, 0xf4, 0xd8]);
interface ID2D1ImageSource : ID2D1Image
{
    HRESULT OfferResources();
    HRESULT TryReclaimResources(BOOL*);
}
enum IID_ID2D1ImageSourceFromWic = GUID(0x77395441, 0x1c8f, 0x4555, [0x86, 0x83, 0xf5, 0xd, 0xab, 0xf, 0xe7, 0x92]);
interface ID2D1ImageSourceFromWic : ID2D1ImageSource
{
    HRESULT EnsureCached(const(D2D_RECT_U)*);
    HRESULT TrimCache(const(D2D_RECT_U)*);
    void GetSource(IWICBitmapSource*);
}
enum IID_ID2D1TransformedImageSource = GUID(0x7f1f79e5, 0x2796, 0x416c, [0x8f, 0x55, 0x70, 0xf, 0x91, 0x14, 0x45, 0xe5]);
interface ID2D1TransformedImageSource : ID2D1Image
{
    void GetSource(ID2D1ImageSource*);
    void GetProperties(D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES*);
}
enum IID_ID2D1LookupTable3D = GUID(0x53dd9855, 0xa3b0, 0x4d5b, [0x82, 0xe1, 0x26, 0xe2, 0x5c, 0x5e, 0x57, 0x97]);
interface ID2D1LookupTable3D : ID2D1Resource
{
}
enum IID_ID2D1DeviceContext2 = GUID(0x394ea6a3, 0xc34, 0x4321, [0x95, 0xb, 0x6c, 0xa2, 0xf, 0xb, 0xe6, 0xc7]);
interface ID2D1DeviceContext2 : ID2D1DeviceContext1
{
    HRESULT CreateInk(const(D2D1_INK_POINT)*, ID2D1Ink*);
    HRESULT CreateInkStyle(const(D2D1_INK_STYLE_PROPERTIES)*, ID2D1InkStyle*);
    HRESULT CreateGradientMesh(const(D2D1_GRADIENT_MESH_PATCH)*, uint, ID2D1GradientMesh*);
    HRESULT CreateImageSourceFromWic(IWICBitmapSource, D2D1_IMAGE_SOURCE_LOADING_OPTIONS, D2D1_ALPHA_MODE, ID2D1ImageSourceFromWic*);
    HRESULT CreateLookupTable3D(D2D1_BUFFER_PRECISION, const(uint)*, const(ubyte)*, uint, const(uint)*, ID2D1LookupTable3D*);
    HRESULT CreateImageSourceFromDxgi(IDXGISurface*, uint, DXGI_COLOR_SPACE_TYPE, D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS, ID2D1ImageSource*);
    HRESULT GetGradientMeshWorldBounds(ID2D1GradientMesh, D2D_RECT_F*);
    void DrawInk(ID2D1Ink, ID2D1Brush, ID2D1InkStyle);
    void DrawGradientMesh(ID2D1GradientMesh);
    void DrawGdiMetafile(ID2D1GdiMetafile, const(D2D_RECT_F)*, const(D2D_RECT_F)*);
    HRESULT CreateTransformedImageSource(ID2D1ImageSource, const(D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES)*, ID2D1TransformedImageSource*);
}
enum IID_ID2D1Device2 = GUID(0xa44472e1, 0x8dfb, 0x4e60, [0x84, 0x92, 0x6e, 0x28, 0x61, 0xc9, 0xca, 0x8b]);
interface ID2D1Device2 : ID2D1Device1
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext2*);
    void FlushDeviceContexts(ID2D1Bitmap);
    HRESULT GetDxgiDevice(IDXGIDevice*);
}
enum IID_ID2D1Factory3 = GUID(0x869759f, 0x4f00, 0x413f, [0xb0, 0x3e, 0x2b, 0xda, 0x45, 0x40, 0x4d, 0xf]);
interface ID2D1Factory3 : ID2D1Factory2
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device2*);
}
enum IID_ID2D1CommandSink2 = GUID(0x3bab440e, 0x417e, 0x47df, [0xa2, 0xe2, 0xbc, 0xb, 0xe6, 0xa0, 0x9, 0x16]);
interface ID2D1CommandSink2 : ID2D1CommandSink1
{
    HRESULT DrawInk(ID2D1Ink, ID2D1Brush, ID2D1InkStyle);
    HRESULT DrawGradientMesh(ID2D1GradientMesh);
    HRESULT DrawGdiMetafile(ID2D1GdiMetafile, const(D2D_RECT_F)*, const(D2D_RECT_F)*);
}
enum IID_ID2D1GdiMetafile1 = GUID(0x2e69f9e8, 0xdd3f, 0x4bf9, [0x95, 0xba, 0xc0, 0x4f, 0x49, 0xd7, 0x88, 0xdf]);
interface ID2D1GdiMetafile1 : ID2D1GdiMetafile
{
    HRESULT GetDpi(float*, float*);
    HRESULT GetSourceBounds(D2D_RECT_F*);
}
enum IID_ID2D1GdiMetafileSink1 = GUID(0xfd0ecb6b, 0x91e6, 0x411e, [0x86, 0x55, 0x39, 0x5e, 0x76, 0xf, 0x91, 0xb4]);
interface ID2D1GdiMetafileSink1 : ID2D1GdiMetafileSink
{
    HRESULT ProcessRecord(uint, const(void)*, uint, uint);
}
enum IID_ID2D1SpriteBatch = GUID(0x4dc583bf, 0x3a10, 0x438a, [0x87, 0x22, 0xe9, 0x76, 0x52, 0x24, 0xf1, 0xf1]);
interface ID2D1SpriteBatch : ID2D1Resource
{
    HRESULT AddSprites(uint, const(D2D_RECT_F)*, const(D2D_RECT_U)*, const(D2D1_COLOR_F)*, const(D2D_MATRIX_3X2_F)*, uint, uint, uint, uint);
    HRESULT SetSprites(uint, uint, const(D2D_RECT_F)*, const(D2D_RECT_U)*, const(D2D1_COLOR_F)*, const(D2D_MATRIX_3X2_F)*, uint, uint, uint, uint);
    HRESULT GetSprites(uint, uint, D2D_RECT_F*, D2D_RECT_U*, D2D1_COLOR_F*, D2D_MATRIX_3X2_F*);
    uint GetSpriteCount();
    void Clear();
}
enum IID_ID2D1DeviceContext3 = GUID(0x235a7496, 0x8351, 0x414c, [0xbc, 0xd4, 0x66, 0x72, 0xab, 0x2d, 0x8e, 0x0]);
interface ID2D1DeviceContext3 : ID2D1DeviceContext2
{
    HRESULT CreateSpriteBatch(ID2D1SpriteBatch*);
    void DrawSpriteBatch(ID2D1SpriteBatch, uint, uint, ID2D1Bitmap, D2D1_BITMAP_INTERPOLATION_MODE, D2D1_SPRITE_OPTIONS);
}
enum IID_ID2D1Device3 = GUID(0x852f2087, 0x802c, 0x4037, [0xab, 0x60, 0xff, 0x2e, 0x7e, 0xe6, 0xfc, 0x1]);
interface ID2D1Device3 : ID2D1Device2
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext3*);
}
enum IID_ID2D1Factory4 = GUID(0xbd4ec2d2, 0x662, 0x4bee, [0xba, 0x8e, 0x6f, 0x29, 0xf0, 0x32, 0xe0, 0x96]);
interface ID2D1Factory4 : ID2D1Factory3
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device3*);
}
enum IID_ID2D1CommandSink3 = GUID(0x18079135, 0x4cf3, 0x4868, [0xbc, 0x8e, 0x6, 0x6, 0x7e, 0x6d, 0x24, 0x2d]);
interface ID2D1CommandSink3 : ID2D1CommandSink2
{
    HRESULT DrawSpriteBatch(ID2D1SpriteBatch, uint, uint, ID2D1Bitmap, D2D1_BITMAP_INTERPOLATION_MODE, D2D1_SPRITE_OPTIONS);
}
enum IID_ID2D1SvgGlyphStyle = GUID(0xaf671749, 0xd241, 0x4db8, [0x8e, 0x41, 0xdc, 0xc2, 0xe5, 0xc1, 0xa4, 0x38]);
interface ID2D1SvgGlyphStyle : ID2D1Resource
{
    HRESULT SetFill(ID2D1Brush);
    void GetFill(ID2D1Brush*);
    HRESULT SetStroke(ID2D1Brush, float, const(float)*, uint, float);
    uint GetStrokeDashesCount();
    void GetStroke(ID2D1Brush*, float*, float*, uint, float*);
}
enum IID_ID2D1DeviceContext4 = GUID(0x8c427831, 0x3d90, 0x4476, [0xb6, 0x47, 0xc4, 0xfa, 0xe3, 0x49, 0xe4, 0xdb]);
interface ID2D1DeviceContext4 : ID2D1DeviceContext3
{
    HRESULT CreateSvgGlyphStyle(ID2D1SvgGlyphStyle*);
    void DrawText(const(wchar)*, uint, IDWriteTextFormat, const(D2D_RECT_F)*, ID2D1Brush, ID2D1SvgGlyphStyle, uint, D2D1_DRAW_TEXT_OPTIONS, DWRITE_MEASURING_MODE);
    void DrawTextLayout(D2D_POINT_2F, IDWriteTextLayout, ID2D1Brush, ID2D1SvgGlyphStyle, uint, D2D1_DRAW_TEXT_OPTIONS);
    void DrawColorBitmapGlyphRun(DWRITE_GLYPH_IMAGE_FORMATS, D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, DWRITE_MEASURING_MODE, D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION);
    void DrawSvgGlyphRun(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, ID2D1Brush, ID2D1SvgGlyphStyle, uint, DWRITE_MEASURING_MODE);
    HRESULT GetColorBitmapGlyphImage(DWRITE_GLYPH_IMAGE_FORMATS, D2D_POINT_2F, IDWriteFontFace, float, ushort, BOOL, const(D2D_MATRIX_3X2_F)*, float, float, D2D_MATRIX_3X2_F*, ID2D1Image*);
    HRESULT GetSvgGlyphImage(D2D_POINT_2F, IDWriteFontFace, float, ushort, BOOL, const(D2D_MATRIX_3X2_F)*, ID2D1Brush, ID2D1SvgGlyphStyle, uint, D2D_MATRIX_3X2_F*, ID2D1CommandList*);
}
enum IID_ID2D1Device4 = GUID(0xd7bdb159, 0x5683, 0x4a46, [0xbc, 0x9c, 0x72, 0xdc, 0x72, 0xb, 0x85, 0x8b]);
interface ID2D1Device4 : ID2D1Device3
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext4*);
    void SetMaximumColorGlyphCacheMemory(ulong);
    ulong GetMaximumColorGlyphCacheMemory();
}
enum IID_ID2D1Factory5 = GUID(0xc4349994, 0x838e, 0x4b0f, [0x8c, 0xab, 0x44, 0x99, 0x7d, 0x9e, 0xea, 0xcc]);
interface ID2D1Factory5 : ID2D1Factory4
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device4*);
}
enum IID_ID2D1CommandSink4 = GUID(0xc78a6519, 0x40d6, 0x4218, [0xb2, 0xde, 0xbe, 0xee, 0xb7, 0x44, 0xbb, 0x3e]);
interface ID2D1CommandSink4 : ID2D1CommandSink3
{
    HRESULT SetPrimitiveBlend2(D2D1_PRIMITIVE_BLEND);
}
enum IID_ID2D1ColorContext1 = GUID(0x1ab42875, 0xc57f, 0x4be9, [0xbd, 0x85, 0x9c, 0xd7, 0x8d, 0x6f, 0x55, 0xee]);
interface ID2D1ColorContext1 : ID2D1ColorContext
{
    D2D1_COLOR_CONTEXT_TYPE GetColorContextType();
    DXGI_COLOR_SPACE_TYPE GetDXGIColorSpace();
    HRESULT GetSimpleColorProfile(D2D1_SIMPLE_COLOR_PROFILE*);
}
enum IID_ID2D1DeviceContext5 = GUID(0x7836d248, 0x68cc, 0x4df6, [0xb9, 0xe8, 0xde, 0x99, 0x1b, 0xf6, 0x2e, 0xb7]);
interface ID2D1DeviceContext5 : ID2D1DeviceContext4
{
    HRESULT CreateSvgDocument(IStream, D2D_SIZE_F, ID2D1SvgDocument*);
    void DrawSvgDocument(ID2D1SvgDocument);
    HRESULT CreateColorContextFromDxgiColorSpace(DXGI_COLOR_SPACE_TYPE, ID2D1ColorContext1*);
    HRESULT CreateColorContextFromSimpleColorProfile(const(D2D1_SIMPLE_COLOR_PROFILE)*, ID2D1ColorContext1*);
}
enum IID_ID2D1Device5 = GUID(0xd55ba0a4, 0x6405, 0x4694, [0xae, 0xf5, 0x8, 0xee, 0x1a, 0x43, 0x58, 0xb4]);
interface ID2D1Device5 : ID2D1Device4
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext5*);
}
enum IID_ID2D1Factory6 = GUID(0xf9976f46, 0xf642, 0x44c1, [0x97, 0xca, 0xda, 0x32, 0xea, 0x2a, 0x26, 0x35]);
interface ID2D1Factory6 : ID2D1Factory5
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device5*);
}
enum IID_ID2D1CommandSink5 = GUID(0x7047dd26, 0xb1e7, 0x44a7, [0x95, 0x9a, 0x83, 0x49, 0xe2, 0x14, 0x4f, 0xa8]);
interface ID2D1CommandSink5 : ID2D1CommandSink4
{
    HRESULT BlendImage(ID2D1Image, D2D1_BLEND_MODE, const(D2D_POINT_2F)*, const(D2D_RECT_F)*, D2D1_INTERPOLATION_MODE);
}
enum IID_ID2D1DeviceContext6 = GUID(0x985f7e37, 0x4ed0, 0x4a19, [0x98, 0xa3, 0x15, 0xb0, 0xed, 0xfd, 0xe3, 0x6]);
interface ID2D1DeviceContext6 : ID2D1DeviceContext5
{
    void BlendImage(ID2D1Image, D2D1_BLEND_MODE, const(D2D_POINT_2F)*, const(D2D_RECT_F)*, D2D1_INTERPOLATION_MODE);
}
enum IID_ID2D1Device6 = GUID(0x7bfef914, 0x2d75, 0x4bad, [0xbe, 0x87, 0xe1, 0x8d, 0xdb, 0x7, 0x7b, 0x6d]);
interface ID2D1Device6 : ID2D1Device5
{
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS, ID2D1DeviceContext6*);
}
enum IID_ID2D1Factory7 = GUID(0xbdc2bdd3, 0xb96c, 0x4de6, [0xbd, 0xf7, 0x99, 0xd4, 0x74, 0x54, 0x54, 0xde]);
interface ID2D1Factory7 : ID2D1Factory6
{
    HRESULT CreateDevice(IDXGIDevice, ID2D1Device6*);
}
enum IID_ID2D1EffectContext1 = GUID(0x84ab595a, 0xfc81, 0x4546, [0xba, 0xcd, 0xe8, 0xef, 0x4d, 0x8a, 0xbe, 0x7a]);
interface ID2D1EffectContext1 : ID2D1EffectContext
{
    HRESULT CreateLookupTable3D(D2D1_BUFFER_PRECISION, const(uint)*, const(ubyte)*, uint, const(uint)*, ID2D1LookupTable3D*);
}
enum IID_ID2D1EffectContext2 = GUID(0x577ad2a0, 0x9fc7, 0x4dda, [0x8b, 0x18, 0xda, 0xb8, 0x10, 0x14, 0x0, 0x52]);
interface ID2D1EffectContext2 : ID2D1EffectContext1
{
    HRESULT CreateColorContextFromDxgiColorSpace(DXGI_COLOR_SPACE_TYPE, ID2D1ColorContext1*);
    HRESULT CreateColorContextFromSimpleColorProfile(const(D2D1_SIMPLE_COLOR_PROFILE)*, ID2D1ColorContext1*);
}
