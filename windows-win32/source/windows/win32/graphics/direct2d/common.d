module windows.win32.graphics.direct2d.common;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.dxgi.common : DXGI_FORMAT;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

struct D2D_COLOR_F
{
    float r;
    float g;
    float b;
    float a;
}
struct D2D1_COLOR_F
{
    float r;
    float g;
    float b;
    float a;
}
alias D2D1_ALPHA_MODE = uint;
enum : uint
{
    D2D1_ALPHA_MODE_UNKNOWN       = 0x00000000,
    D2D1_ALPHA_MODE_PREMULTIPLIED = 0x00000001,
    D2D1_ALPHA_MODE_STRAIGHT      = 0x00000002,
    D2D1_ALPHA_MODE_IGNORE        = 0x00000003,
}

struct D2D1_PIXEL_FORMAT
{
    DXGI_FORMAT format;
    D2D1_ALPHA_MODE alphaMode;
}
struct D2D_POINT_2U
{
    uint x;
    uint y;
}
struct D2D_POINT_2F
{
    float x;
    float y;
}
struct D2D_VECTOR_2F
{
    float x;
    float y;
}
struct D2D_VECTOR_3F
{
    float x;
    float y;
    float z;
}
struct D2D_VECTOR_4F
{
    float x;
    float y;
    float z;
    float w;
}
struct D2D_RECT_F
{
    float left;
    float top;
    float right;
    float bottom;
}
struct D2D_RECT_U
{
    uint left;
    uint top;
    uint right;
    uint bottom;
}
struct D2D_SIZE_F
{
    float width;
    float height;
}
struct D2D_SIZE_U
{
    uint width;
    uint height;
}
struct D2D_MATRIX_3X2_F
{
    union
    {
        struct
        {
            float m11;
            float m12;
            float m21;
            float m22;
            float dx;
            float dy;
        }
        struct
        {
            float _11;
            float _12;
            float _21;
            float _22;
            float _31;
            float _32;
        }
        float[6] m;
    }
}
struct D2D_MATRIX_4X3_F
{
    union
    {
        struct
        {
            float _11;
            float _12;
            float _13;
            float _21;
            float _22;
            float _23;
            float _31;
            float _32;
            float _33;
            float _41;
            float _42;
            float _43;
        }
        float[12] m;
    }
}
struct D2D_MATRIX_4X4_F
{
    union
    {
        struct
        {
            float _11;
            float _12;
            float _13;
            float _14;
            float _21;
            float _22;
            float _23;
            float _24;
            float _31;
            float _32;
            float _33;
            float _34;
            float _41;
            float _42;
            float _43;
            float _44;
        }
        float[16] m;
    }
}
struct D2D_MATRIX_5X4_F
{
    union
    {
        struct
        {
            float _11;
            float _12;
            float _13;
            float _14;
            float _21;
            float _22;
            float _23;
            float _24;
            float _31;
            float _32;
            float _33;
            float _34;
            float _41;
            float _42;
            float _43;
            float _44;
            float _51;
            float _52;
            float _53;
            float _54;
        }
        float[20] m;
    }
}
alias D2D1_FIGURE_BEGIN = uint;
enum : uint
{
    D2D1_FIGURE_BEGIN_FILLED = 0x00000000,
    D2D1_FIGURE_BEGIN_HOLLOW = 0x00000001,
}

alias D2D1_FIGURE_END = uint;
enum : uint
{
    D2D1_FIGURE_END_OPEN   = 0x00000000,
    D2D1_FIGURE_END_CLOSED = 0x00000001,
}

struct D2D1_BEZIER_SEGMENT
{
    D2D_POINT_2F point1;
    D2D_POINT_2F point2;
    D2D_POINT_2F point3;
}
alias D2D1_PATH_SEGMENT = uint;
enum : uint
{
    D2D1_PATH_SEGMENT_NONE                  = 0x00000000,
    D2D1_PATH_SEGMENT_FORCE_UNSTROKED       = 0x00000001,
    D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 0x00000002,
}

alias D2D1_FILL_MODE = uint;
enum : uint
{
    D2D1_FILL_MODE_ALTERNATE = 0x00000000,
    D2D1_FILL_MODE_WINDING   = 0x00000001,
}

enum IID_ID2D1SimplifiedGeometrySink = GUID(0x2cd9069e, 0x12e2, 0x11dc, [0x9f, 0xed, 0x0, 0x11, 0x43, 0xa0, 0x55, 0xf9]);
interface ID2D1SimplifiedGeometrySink : IUnknown
{
    void SetFillMode(D2D1_FILL_MODE);
    void SetSegmentFlags(D2D1_PATH_SEGMENT);
    void BeginFigure(D2D_POINT_2F, D2D1_FIGURE_BEGIN);
    void AddLines(const(D2D_POINT_2F)*, uint);
    void AddBeziers(const(D2D1_BEZIER_SEGMENT)*, uint);
    void EndFigure(D2D1_FIGURE_END);
    HRESULT Close();
}
alias D2D1_BORDER_MODE = uint;
enum : uint
{
    D2D1_BORDER_MODE_SOFT = 0x00000000,
    D2D1_BORDER_MODE_HARD = 0x00000001,
}

alias D2D1_BLEND_MODE = uint;
enum : uint
{
    D2D1_BLEND_MODE_MULTIPLY      = 0x00000000,
    D2D1_BLEND_MODE_SCREEN        = 0x00000001,
    D2D1_BLEND_MODE_DARKEN        = 0x00000002,
    D2D1_BLEND_MODE_LIGHTEN       = 0x00000003,
    D2D1_BLEND_MODE_DISSOLVE      = 0x00000004,
    D2D1_BLEND_MODE_COLOR_BURN    = 0x00000005,
    D2D1_BLEND_MODE_LINEAR_BURN   = 0x00000006,
    D2D1_BLEND_MODE_DARKER_COLOR  = 0x00000007,
    D2D1_BLEND_MODE_LIGHTER_COLOR = 0x00000008,
    D2D1_BLEND_MODE_COLOR_DODGE   = 0x00000009,
    D2D1_BLEND_MODE_LINEAR_DODGE  = 0x0000000a,
    D2D1_BLEND_MODE_OVERLAY       = 0x0000000b,
    D2D1_BLEND_MODE_SOFT_LIGHT    = 0x0000000c,
    D2D1_BLEND_MODE_HARD_LIGHT    = 0x0000000d,
    D2D1_BLEND_MODE_VIVID_LIGHT   = 0x0000000e,
    D2D1_BLEND_MODE_LINEAR_LIGHT  = 0x0000000f,
    D2D1_BLEND_MODE_PIN_LIGHT     = 0x00000010,
    D2D1_BLEND_MODE_HARD_MIX      = 0x00000011,
    D2D1_BLEND_MODE_DIFFERENCE    = 0x00000012,
    D2D1_BLEND_MODE_EXCLUSION     = 0x00000013,
    D2D1_BLEND_MODE_HUE           = 0x00000014,
    D2D1_BLEND_MODE_SATURATION    = 0x00000015,
    D2D1_BLEND_MODE_COLOR         = 0x00000016,
    D2D1_BLEND_MODE_LUMINOSITY    = 0x00000017,
    D2D1_BLEND_MODE_SUBTRACT      = 0x00000018,
    D2D1_BLEND_MODE_DIVISION      = 0x00000019,
}

alias D2D1_COLORMATRIX_ALPHA_MODE = uint;
enum : uint
{
    D2D1_COLORMATRIX_ALPHA_MODE_PREMULTIPLIED = 0x00000001,
    D2D1_COLORMATRIX_ALPHA_MODE_STRAIGHT      = 0x00000002,
}

alias D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE = uint;
enum : uint
{
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_NEAREST_NEIGHBOR    = 0x00000000,
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_LINEAR              = 0x00000001,
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_CUBIC               = 0x00000002,
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 0x00000003,
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_ANISOTROPIC         = 0x00000004,
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = 0x00000005,
}

alias D2D1_TURBULENCE_NOISE = uint;
enum : uint
{
    D2D1_TURBULENCE_NOISE_FRACTAL_SUM = 0x00000000,
    D2D1_TURBULENCE_NOISE_TURBULENCE  = 0x00000001,
}

alias D2D1_COMPOSITE_MODE = uint;
enum : uint
{
    D2D1_COMPOSITE_MODE_SOURCE_OVER         = 0x00000000,
    D2D1_COMPOSITE_MODE_DESTINATION_OVER    = 0x00000001,
    D2D1_COMPOSITE_MODE_SOURCE_IN           = 0x00000002,
    D2D1_COMPOSITE_MODE_DESTINATION_IN      = 0x00000003,
    D2D1_COMPOSITE_MODE_SOURCE_OUT          = 0x00000004,
    D2D1_COMPOSITE_MODE_DESTINATION_OUT     = 0x00000005,
    D2D1_COMPOSITE_MODE_SOURCE_ATOP         = 0x00000006,
    D2D1_COMPOSITE_MODE_DESTINATION_ATOP    = 0x00000007,
    D2D1_COMPOSITE_MODE_XOR                 = 0x00000008,
    D2D1_COMPOSITE_MODE_PLUS                = 0x00000009,
    D2D1_COMPOSITE_MODE_SOURCE_COPY         = 0x0000000a,
    D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY = 0x0000000b,
    D2D1_COMPOSITE_MODE_MASK_INVERT         = 0x0000000c,
}

