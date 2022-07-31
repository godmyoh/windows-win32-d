module windows.win32.graphics.dxgi.common;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

enum _FACDXGI = 0x0000087a;
enum DXGI_CPU_ACCESS_NONE = 0x00000000;
enum DXGI_CPU_ACCESS_DYNAMIC = 0x00000001;
enum DXGI_CPU_ACCESS_READ_WRITE = 0x00000002;
enum DXGI_CPU_ACCESS_SCRATCH = 0x00000003;
enum DXGI_CPU_ACCESS_FIELD = 0x0000000f;
enum DXGI_FORMAT_DEFINED = 0x00000001;
enum DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN = 0xffffffff;
enum DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN = 0xfffffffe;
struct DXGI_RATIONAL
{
    uint Numerator;
    uint Denominator;
}
struct DXGI_SAMPLE_DESC
{
    uint Count;
    uint Quality;
}
alias DXGI_COLOR_SPACE_TYPE = int;
enum : int
{
    DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709           = 0x00000000,
    DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709           = 0x00000001,
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709         = 0x00000002,
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020        = 0x00000003,
    DXGI_COLOR_SPACE_RESERVED                         = 0x00000004,
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601    = 0x00000005,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601       = 0x00000006,
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601         = 0x00000007,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709       = 0x00000008,
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709         = 0x00000009,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020      = 0x0000000a,
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020        = 0x0000000b,
    DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020        = 0x0000000c,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020    = 0x0000000d,
    DXGI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020      = 0x0000000e,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020   = 0x0000000f,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020 = 0x00000010,
    DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020          = 0x00000011,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  = 0x00000012,
    DXGI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020    = 0x00000013,
    DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709         = 0x00000014,
    DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020        = 0x00000015,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709       = 0x00000016,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020      = 0x00000017,
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020   = 0x00000018,
    DXGI_COLOR_SPACE_CUSTOM                           = 0xffffffff,
}

alias DXGI_FORMAT = uint;
enum : uint
{
    DXGI_FORMAT_UNKNOWN                                 = 0x00000000,
    DXGI_FORMAT_R32G32B32A32_TYPELESS                   = 0x00000001,
    DXGI_FORMAT_R32G32B32A32_FLOAT                      = 0x00000002,
    DXGI_FORMAT_R32G32B32A32_UINT                       = 0x00000003,
    DXGI_FORMAT_R32G32B32A32_SINT                       = 0x00000004,
    DXGI_FORMAT_R32G32B32_TYPELESS                      = 0x00000005,
    DXGI_FORMAT_R32G32B32_FLOAT                         = 0x00000006,
    DXGI_FORMAT_R32G32B32_UINT                          = 0x00000007,
    DXGI_FORMAT_R32G32B32_SINT                          = 0x00000008,
    DXGI_FORMAT_R16G16B16A16_TYPELESS                   = 0x00000009,
    DXGI_FORMAT_R16G16B16A16_FLOAT                      = 0x0000000a,
    DXGI_FORMAT_R16G16B16A16_UNORM                      = 0x0000000b,
    DXGI_FORMAT_R16G16B16A16_UINT                       = 0x0000000c,
    DXGI_FORMAT_R16G16B16A16_SNORM                      = 0x0000000d,
    DXGI_FORMAT_R16G16B16A16_SINT                       = 0x0000000e,
    DXGI_FORMAT_R32G32_TYPELESS                         = 0x0000000f,
    DXGI_FORMAT_R32G32_FLOAT                            = 0x00000010,
    DXGI_FORMAT_R32G32_UINT                             = 0x00000011,
    DXGI_FORMAT_R32G32_SINT                             = 0x00000012,
    DXGI_FORMAT_R32G8X24_TYPELESS                       = 0x00000013,
    DXGI_FORMAT_D32_FLOAT_S8X24_UINT                    = 0x00000014,
    DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS                = 0x00000015,
    DXGI_FORMAT_X32_TYPELESS_G8X24_UINT                 = 0x00000016,
    DXGI_FORMAT_R10G10B10A2_TYPELESS                    = 0x00000017,
    DXGI_FORMAT_R10G10B10A2_UNORM                       = 0x00000018,
    DXGI_FORMAT_R10G10B10A2_UINT                        = 0x00000019,
    DXGI_FORMAT_R11G11B10_FLOAT                         = 0x0000001a,
    DXGI_FORMAT_R8G8B8A8_TYPELESS                       = 0x0000001b,
    DXGI_FORMAT_R8G8B8A8_UNORM                          = 0x0000001c,
    DXGI_FORMAT_R8G8B8A8_UNORM_SRGB                     = 0x0000001d,
    DXGI_FORMAT_R8G8B8A8_UINT                           = 0x0000001e,
    DXGI_FORMAT_R8G8B8A8_SNORM                          = 0x0000001f,
    DXGI_FORMAT_R8G8B8A8_SINT                           = 0x00000020,
    DXGI_FORMAT_R16G16_TYPELESS                         = 0x00000021,
    DXGI_FORMAT_R16G16_FLOAT                            = 0x00000022,
    DXGI_FORMAT_R16G16_UNORM                            = 0x00000023,
    DXGI_FORMAT_R16G16_UINT                             = 0x00000024,
    DXGI_FORMAT_R16G16_SNORM                            = 0x00000025,
    DXGI_FORMAT_R16G16_SINT                             = 0x00000026,
    DXGI_FORMAT_R32_TYPELESS                            = 0x00000027,
    DXGI_FORMAT_D32_FLOAT                               = 0x00000028,
    DXGI_FORMAT_R32_FLOAT                               = 0x00000029,
    DXGI_FORMAT_R32_UINT                                = 0x0000002a,
    DXGI_FORMAT_R32_SINT                                = 0x0000002b,
    DXGI_FORMAT_R24G8_TYPELESS                          = 0x0000002c,
    DXGI_FORMAT_D24_UNORM_S8_UINT                       = 0x0000002d,
    DXGI_FORMAT_R24_UNORM_X8_TYPELESS                   = 0x0000002e,
    DXGI_FORMAT_X24_TYPELESS_G8_UINT                    = 0x0000002f,
    DXGI_FORMAT_R8G8_TYPELESS                           = 0x00000030,
    DXGI_FORMAT_R8G8_UNORM                              = 0x00000031,
    DXGI_FORMAT_R8G8_UINT                               = 0x00000032,
    DXGI_FORMAT_R8G8_SNORM                              = 0x00000033,
    DXGI_FORMAT_R8G8_SINT                               = 0x00000034,
    DXGI_FORMAT_R16_TYPELESS                            = 0x00000035,
    DXGI_FORMAT_R16_FLOAT                               = 0x00000036,
    DXGI_FORMAT_D16_UNORM                               = 0x00000037,
    DXGI_FORMAT_R16_UNORM                               = 0x00000038,
    DXGI_FORMAT_R16_UINT                                = 0x00000039,
    DXGI_FORMAT_R16_SNORM                               = 0x0000003a,
    DXGI_FORMAT_R16_SINT                                = 0x0000003b,
    DXGI_FORMAT_R8_TYPELESS                             = 0x0000003c,
    DXGI_FORMAT_R8_UNORM                                = 0x0000003d,
    DXGI_FORMAT_R8_UINT                                 = 0x0000003e,
    DXGI_FORMAT_R8_SNORM                                = 0x0000003f,
    DXGI_FORMAT_R8_SINT                                 = 0x00000040,
    DXGI_FORMAT_A8_UNORM                                = 0x00000041,
    DXGI_FORMAT_R1_UNORM                                = 0x00000042,
    DXGI_FORMAT_R9G9B9E5_SHAREDEXP                      = 0x00000043,
    DXGI_FORMAT_R8G8_B8G8_UNORM                         = 0x00000044,
    DXGI_FORMAT_G8R8_G8B8_UNORM                         = 0x00000045,
    DXGI_FORMAT_BC1_TYPELESS                            = 0x00000046,
    DXGI_FORMAT_BC1_UNORM                               = 0x00000047,
    DXGI_FORMAT_BC1_UNORM_SRGB                          = 0x00000048,
    DXGI_FORMAT_BC2_TYPELESS                            = 0x00000049,
    DXGI_FORMAT_BC2_UNORM                               = 0x0000004a,
    DXGI_FORMAT_BC2_UNORM_SRGB                          = 0x0000004b,
    DXGI_FORMAT_BC3_TYPELESS                            = 0x0000004c,
    DXGI_FORMAT_BC3_UNORM                               = 0x0000004d,
    DXGI_FORMAT_BC3_UNORM_SRGB                          = 0x0000004e,
    DXGI_FORMAT_BC4_TYPELESS                            = 0x0000004f,
    DXGI_FORMAT_BC4_UNORM                               = 0x00000050,
    DXGI_FORMAT_BC4_SNORM                               = 0x00000051,
    DXGI_FORMAT_BC5_TYPELESS                            = 0x00000052,
    DXGI_FORMAT_BC5_UNORM                               = 0x00000053,
    DXGI_FORMAT_BC5_SNORM                               = 0x00000054,
    DXGI_FORMAT_B5G6R5_UNORM                            = 0x00000055,
    DXGI_FORMAT_B5G5R5A1_UNORM                          = 0x00000056,
    DXGI_FORMAT_B8G8R8A8_UNORM                          = 0x00000057,
    DXGI_FORMAT_B8G8R8X8_UNORM                          = 0x00000058,
    DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM              = 0x00000059,
    DXGI_FORMAT_B8G8R8A8_TYPELESS                       = 0x0000005a,
    DXGI_FORMAT_B8G8R8A8_UNORM_SRGB                     = 0x0000005b,
    DXGI_FORMAT_B8G8R8X8_TYPELESS                       = 0x0000005c,
    DXGI_FORMAT_B8G8R8X8_UNORM_SRGB                     = 0x0000005d,
    DXGI_FORMAT_BC6H_TYPELESS                           = 0x0000005e,
    DXGI_FORMAT_BC6H_UF16                               = 0x0000005f,
    DXGI_FORMAT_BC6H_SF16                               = 0x00000060,
    DXGI_FORMAT_BC7_TYPELESS                            = 0x00000061,
    DXGI_FORMAT_BC7_UNORM                               = 0x00000062,
    DXGI_FORMAT_BC7_UNORM_SRGB                          = 0x00000063,
    DXGI_FORMAT_AYUV                                    = 0x00000064,
    DXGI_FORMAT_Y410                                    = 0x00000065,
    DXGI_FORMAT_Y416                                    = 0x00000066,
    DXGI_FORMAT_NV12                                    = 0x00000067,
    DXGI_FORMAT_P010                                    = 0x00000068,
    DXGI_FORMAT_P016                                    = 0x00000069,
    DXGI_FORMAT_420_OPAQUE                              = 0x0000006a,
    DXGI_FORMAT_YUY2                                    = 0x0000006b,
    DXGI_FORMAT_Y210                                    = 0x0000006c,
    DXGI_FORMAT_Y216                                    = 0x0000006d,
    DXGI_FORMAT_NV11                                    = 0x0000006e,
    DXGI_FORMAT_AI44                                    = 0x0000006f,
    DXGI_FORMAT_IA44                                    = 0x00000070,
    DXGI_FORMAT_P8                                      = 0x00000071,
    DXGI_FORMAT_A8P8                                    = 0x00000072,
    DXGI_FORMAT_B4G4R4A4_UNORM                          = 0x00000073,
    DXGI_FORMAT_P208                                    = 0x00000082,
    DXGI_FORMAT_V208                                    = 0x00000083,
    DXGI_FORMAT_V408                                    = 0x00000084,
    DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE         = 0x000000bd,
    DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE = 0x000000be,
    DXGI_FORMAT_FORCE_UINT                              = 0xffffffff,
}

struct DXGI_RGB
{
    float Red;
    float Green;
    float Blue;
}
struct DXGI_GAMMA_CONTROL
{
    DXGI_RGB Scale;
    DXGI_RGB Offset;
    DXGI_RGB[1025] GammaCurve;
}
struct DXGI_GAMMA_CONTROL_CAPABILITIES
{
    BOOL ScaleAndOffsetSupported;
    float MaxConvertedValue;
    float MinConvertedValue;
    uint NumGammaControlPoints;
    float[1025] ControlPointPositions;
}
alias DXGI_MODE_SCANLINE_ORDER = int;
enum : int
{
    DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED       = 0x00000000,
    DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE       = 0x00000001,
    DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST = 0x00000002,
    DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST = 0x00000003,
}

alias DXGI_MODE_SCALING = int;
enum : int
{
    DXGI_MODE_SCALING_UNSPECIFIED = 0x00000000,
    DXGI_MODE_SCALING_CENTERED    = 0x00000001,
    DXGI_MODE_SCALING_STRETCHED   = 0x00000002,
}

alias DXGI_MODE_ROTATION = int;
enum : int
{
    DXGI_MODE_ROTATION_UNSPECIFIED = 0x00000000,
    DXGI_MODE_ROTATION_IDENTITY    = 0x00000001,
    DXGI_MODE_ROTATION_ROTATE90    = 0x00000002,
    DXGI_MODE_ROTATION_ROTATE180   = 0x00000003,
    DXGI_MODE_ROTATION_ROTATE270   = 0x00000004,
}

struct DXGI_MODE_DESC
{
    uint Width;
    uint Height;
    DXGI_RATIONAL RefreshRate;
    DXGI_FORMAT Format;
    DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
    DXGI_MODE_SCALING Scaling;
}
struct DXGI_JPEG_DC_HUFFMAN_TABLE
{
    ubyte[12] CodeCounts;
    ubyte[12] CodeValues;
}
struct DXGI_JPEG_AC_HUFFMAN_TABLE
{
    ubyte[16] CodeCounts;
    ubyte[162] CodeValues;
}
struct DXGI_JPEG_QUANTIZATION_TABLE
{
    ubyte[64] Elements;
}
alias DXGI_ALPHA_MODE = uint;
enum : uint
{
    DXGI_ALPHA_MODE_UNSPECIFIED   = 0x00000000,
    DXGI_ALPHA_MODE_PREMULTIPLIED = 0x00000001,
    DXGI_ALPHA_MODE_STRAIGHT      = 0x00000002,
    DXGI_ALPHA_MODE_IGNORE        = 0x00000003,
    DXGI_ALPHA_MODE_FORCE_DWORD   = 0xffffffff,
}

