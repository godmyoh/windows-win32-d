module windows.win32.system.winrt.graphics.direct2d;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.graphics.direct2d : ID2D1Factory, ID2D1Geometry;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias GRAPHICS_EFFECT_PROPERTY_MAPPING = int;
enum : int
{
    GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN                = 0x00000000,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT                 = 0x00000001,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX                = 0x00000002,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY                = 0x00000003,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ                = 0x00000004,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW                = 0x00000005,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4        = 0x00000006,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES     = 0x00000007,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE = 0x00000008,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3       = 0x00000009,
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4       = 0x0000000a,
}

enum IID_IGraphicsEffectD2D1Interop = GUID(0x2fc57384, 0xa068, 0x44d7, [0xa3, 0x31, 0x30, 0x98, 0x2f, 0xcf, 0x71, 0x77]);
/+ [UNSUPPORTED] interface IGraphicsEffectD2D1Interop : IUnknown
{
    HRESULT GetEffectId(GUID*);
    HRESULT GetNamedPropertyMapping(const(wchar)*, uint*, GRAPHICS_EFFECT_PROPERTY_MAPPING*);
    HRESULT GetPropertyCount(uint*);
    HRESULT GetProperty(uint, IPropertyValue*);
    HRESULT GetSource(uint, IGraphicsEffectSource*);
    HRESULT GetSourceCount(uint*);
}
+/
enum IID_IGeometrySource2DInterop = GUID(0x657af73, 0x53fd, 0x47cf, [0x84, 0xff, 0xc8, 0x49, 0x2d, 0x2a, 0x80, 0xa3]);
interface IGeometrySource2DInterop : IUnknown
{
    HRESULT GetGeometry(ID2D1Geometry*);
    HRESULT TryGetGeometryUsingFactory(ID2D1Factory, ID2D1Geometry*);
}
