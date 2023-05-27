module windows.win32.storage.xps;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, HWND, POINT, PSTR, PWSTR, SYSTEMTIME;
import windows.win32.graphics.gdi : DEVMODEA, DEVMODEW, HDC;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.security.cryptography : CERT_CONTEXT;
import windows.win32.storage.packaging.opc : IOpcCertificateEnumerator, IOpcCertificateSet, IOpcPartUri, IOpcSignatureCustomObjectEnumerator, IOpcSignatureCustomObjectSet, IOpcSignatureReferenceEnumerator, IOpcSignatureReferenceSet, OPC_SIGNATURE_TIME_FORMAT;
import windows.win32.system.com : ISequentialStream, IStream, IUnknown, IUri;

version (Windows):
extern (Windows):

alias PRINT_WINDOW_FLAGS = uint;
enum : uint
{
    PW_CLIENTONLY = 0x00000001,
}

alias PRINTER_DEVICE_CAPABILITIES = ushort;
enum : ushort
{
    DC_BINNAMES         = 0x000c,
    DC_BINS             = 0x0006,
    DC_COLLATE          = 0x0016,
    DC_COLORDEVICE      = 0x0020,
    DC_COPIES           = 0x0012,
    DC_DRIVER           = 0x000b,
    DC_DUPLEX           = 0x0007,
    DC_ENUMRESOLUTIONS  = 0x000d,
    DC_EXTRA            = 0x0009,
    DC_FIELDS           = 0x0001,
    DC_FILEDEPENDENCIES = 0x000e,
    DC_MAXEXTENT        = 0x0005,
    DC_MEDIAREADY       = 0x001d,
    DC_MEDIATYPENAMES   = 0x0022,
    DC_MEDIATYPES       = 0x0023,
    DC_MINEXTENT        = 0x0004,
    DC_ORIENTATION      = 0x0011,
    DC_NUP              = 0x0021,
    DC_PAPERNAMES       = 0x0010,
    DC_PAPERS           = 0x0002,
    DC_PAPERSIZE        = 0x0003,
    DC_PERSONALITY      = 0x0019,
    DC_PRINTERMEM       = 0x001c,
    DC_PRINTRATE        = 0x001a,
    DC_PRINTRATEPPM     = 0x001f,
    DC_PRINTRATEUNIT    = 0x001b,
    DC_SIZE             = 0x0008,
    DC_STAPLE           = 0x001e,
    DC_TRUETYPE         = 0x000f,
    DC_VERSION          = 0x000a,
}

int DeviceCapabilitiesA(const(char)*, const(char)*, PRINTER_DEVICE_CAPABILITIES, PSTR, const(DEVMODEA)*);
int DeviceCapabilitiesW(const(wchar)*, const(wchar)*, PRINTER_DEVICE_CAPABILITIES, PWSTR, const(DEVMODEW)*);
int Escape(HDC, int, int, const(char)*, void*);
int ExtEscape(HDC, int, int, const(char)*, int, PSTR);
int StartDocA(HDC, const(DOCINFOA)*);
int StartDocW(HDC, const(DOCINFOW)*);
int EndDoc(HDC);
int StartPage(HDC);
int EndPage(HDC);
int AbortDoc(HDC);
int SetAbortProc(HDC, ABORTPROC);
BOOL PrintWindow(HWND, HDC, PRINT_WINDOW_FLAGS);
enum XPS_E_SIGREQUESTID_DUP = 0xffffffff80520385;
enum XPS_E_PACKAGE_NOT_OPENED = 0xffffffff80520386;
enum XPS_E_PACKAGE_ALREADY_OPENED = 0xffffffff80520387;
enum XPS_E_SIGNATUREID_DUP = 0xffffffff80520388;
enum XPS_E_MARKUP_COMPATIBILITY_ELEMENTS = 0xffffffff80520389;
enum XPS_E_OBJECT_DETACHED = 0xffffffff8052038a;
enum XPS_E_INVALID_SIGNATUREBLOCK_MARKUP = 0xffffffff8052038b;
enum XPS_E_INVALID_NUMBER_OF_POINTS_IN_CURVE_SEGMENTS = 0xffffffff80520600;
enum XPS_E_ABSOLUTE_REFERENCE = 0xffffffff80520601;
enum XPS_E_INVALID_NUMBER_OF_COLOR_CHANNELS = 0xffffffff80520602;
enum XPS_E_INVALID_LANGUAGE = 0xffffffff80520000;
enum XPS_E_INVALID_NAME = 0xffffffff80520001;
enum XPS_E_INVALID_RESOURCE_KEY = 0xffffffff80520002;
enum XPS_E_INVALID_PAGE_SIZE = 0xffffffff80520003;
enum XPS_E_INVALID_BLEED_BOX = 0xffffffff80520004;
enum XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE = 0xffffffff80520005;
enum XPS_E_INVALID_LOOKUP_TYPE = 0xffffffff80520006;
enum XPS_E_INVALID_FLOAT = 0xffffffff80520007;
enum XPS_E_UNEXPECTED_CONTENT_TYPE = 0xffffffff80520008;
enum XPS_E_INVALID_FONT_URI = 0xffffffff8052000a;
enum XPS_E_INVALID_CONTENT_BOX = 0xffffffff8052000b;
enum XPS_E_INVALID_MARKUP = 0xffffffff8052000c;
enum XPS_E_INVALID_XML_ENCODING = 0xffffffff8052000d;
enum XPS_E_INVALID_CONTENT_TYPE = 0xffffffff8052000e;
enum XPS_E_INVALID_OBFUSCATED_FONT_URI = 0xffffffff8052000f;
enum XPS_E_UNEXPECTED_RELATIONSHIP_TYPE = 0xffffffff80520010;
enum XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP = 0xffffffff80520011;
enum XPS_E_MISSING_NAME = 0xffffffff80520100;
enum XPS_E_MISSING_LOOKUP = 0xffffffff80520101;
enum XPS_E_MISSING_GLYPHS = 0xffffffff80520102;
enum XPS_E_MISSING_SEGMENT_DATA = 0xffffffff80520103;
enum XPS_E_MISSING_COLORPROFILE = 0xffffffff80520104;
enum XPS_E_MISSING_RELATIONSHIP_TARGET = 0xffffffff80520105;
enum XPS_E_MISSING_RESOURCE_RELATIONSHIP = 0xffffffff80520106;
enum XPS_E_MISSING_FONTURI = 0xffffffff80520107;
enum XPS_E_MISSING_DOCUMENTSEQUENCE_RELATIONSHIP = 0xffffffff80520108;
enum XPS_E_MISSING_DOCUMENT = 0xffffffff80520109;
enum XPS_E_MISSING_REFERRED_DOCUMENT = 0xffffffff8052010a;
enum XPS_E_MISSING_REFERRED_PAGE = 0xffffffff8052010b;
enum XPS_E_MISSING_PAGE_IN_DOCUMENT = 0xffffffff8052010c;
enum XPS_E_MISSING_PAGE_IN_PAGEREFERENCE = 0xffffffff8052010d;
enum XPS_E_MISSING_IMAGE_IN_IMAGEBRUSH = 0xffffffff8052010e;
enum XPS_E_MISSING_RESOURCE_KEY = 0xffffffff8052010f;
enum XPS_E_MISSING_PART_REFERENCE = 0xffffffff80520110;
enum XPS_E_MISSING_RESTRICTED_FONT_RELATIONSHIP = 0xffffffff80520111;
enum XPS_E_MISSING_DISCARDCONTROL = 0xffffffff80520112;
enum XPS_E_MISSING_PART_STREAM = 0xffffffff80520113;
enum XPS_E_UNAVAILABLE_PACKAGE = 0xffffffff80520114;
enum XPS_E_DUPLICATE_RESOURCE_KEYS = 0xffffffff80520200;
enum XPS_E_MULTIPLE_RESOURCES = 0xffffffff80520201;
enum XPS_E_MULTIPLE_DOCUMENTSEQUENCE_RELATIONSHIPS = 0xffffffff80520202;
enum XPS_E_MULTIPLE_THUMBNAILS_ON_PAGE = 0xffffffff80520203;
enum XPS_E_MULTIPLE_THUMBNAILS_ON_PACKAGE = 0xffffffff80520204;
enum XPS_E_MULTIPLE_PRINTTICKETS_ON_PAGE = 0xffffffff80520205;
enum XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENT = 0xffffffff80520206;
enum XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENTSEQUENCE = 0xffffffff80520207;
enum XPS_E_MULTIPLE_REFERENCES_TO_PART = 0xffffffff80520208;
enum XPS_E_DUPLICATE_NAMES = 0xffffffff80520209;
enum XPS_E_STRING_TOO_LONG = 0xffffffff80520300;
enum XPS_E_TOO_MANY_INDICES = 0xffffffff80520301;
enum XPS_E_MAPPING_OUT_OF_ORDER = 0xffffffff80520302;
enum XPS_E_MAPPING_OUTSIDE_STRING = 0xffffffff80520303;
enum XPS_E_MAPPING_OUTSIDE_INDICES = 0xffffffff80520304;
enum XPS_E_CARET_OUTSIDE_STRING = 0xffffffff80520305;
enum XPS_E_CARET_OUT_OF_ORDER = 0xffffffff80520306;
enum XPS_E_ODD_BIDILEVEL = 0xffffffff80520307;
enum XPS_E_ONE_TO_ONE_MAPPING_EXPECTED = 0xffffffff80520308;
enum XPS_E_RESTRICTED_FONT_NOT_OBFUSCATED = 0xffffffff80520309;
enum XPS_E_NEGATIVE_FLOAT = 0xffffffff8052030a;
enum XPS_E_XKEY_ATTR_PRESENT_OUTSIDE_RES_DICT = 0xffffffff80520400;
enum XPS_E_DICTIONARY_ITEM_NAMED = 0xffffffff80520401;
enum XPS_E_NESTED_REMOTE_DICTIONARY = 0xffffffff80520402;
enum XPS_E_INDEX_OUT_OF_RANGE = 0xffffffff80520500;
enum XPS_E_VISUAL_CIRCULAR_REF = 0xffffffff80520501;
enum XPS_E_NO_CUSTOM_OBJECTS = 0xffffffff80520502;
enum XPS_E_ALREADY_OWNED = 0xffffffff80520503;
enum XPS_E_RESOURCE_NOT_OWNED = 0xffffffff80520504;
enum XPS_E_UNEXPECTED_COLORPROFILE = 0xffffffff80520505;
enum XPS_E_COLOR_COMPONENT_OUT_OF_RANGE = 0xffffffff80520506;
enum XPS_E_BOTH_PATHFIGURE_AND_ABBR_SYNTAX_PRESENT = 0xffffffff80520507;
enum XPS_E_BOTH_RESOURCE_AND_SOURCEATTR_PRESENT = 0xffffffff80520508;
enum XPS_E_BLEED_BOX_PAGE_DIMENSIONS_NOT_IN_SYNC = 0xffffffff80520509;
enum XPS_E_RELATIONSHIP_EXTERNAL = 0xffffffff8052050a;
enum XPS_E_NOT_ENOUGH_GRADIENT_STOPS = 0xffffffff8052050b;
enum XPS_E_PACKAGE_WRITER_NOT_CLOSED = 0xffffffff8052050c;
alias PSINJECT_POINT = ushort;
enum : ushort
{
    PSINJECT_BEGINSTREAM                = 0x0001,
    PSINJECT_PSADOBE                    = 0x0002,
    PSINJECT_PAGESATEND                 = 0x0003,
    PSINJECT_PAGES                      = 0x0004,
    PSINJECT_DOCNEEDEDRES               = 0x0005,
    PSINJECT_DOCSUPPLIEDRES             = 0x0006,
    PSINJECT_PAGEORDER                  = 0x0007,
    PSINJECT_ORIENTATION                = 0x0008,
    PSINJECT_BOUNDINGBOX                = 0x0009,
    PSINJECT_DOCUMENTPROCESSCOLORS      = 0x000a,
    PSINJECT_COMMENTS                   = 0x000b,
    PSINJECT_BEGINDEFAULTS              = 0x000c,
    PSINJECT_ENDDEFAULTS                = 0x000d,
    PSINJECT_BEGINPROLOG                = 0x000e,
    PSINJECT_ENDPROLOG                  = 0x000f,
    PSINJECT_BEGINSETUP                 = 0x0010,
    PSINJECT_ENDSETUP                   = 0x0011,
    PSINJECT_TRAILER                    = 0x0012,
    PSINJECT_EOF                        = 0x0013,
    PSINJECT_ENDSTREAM                  = 0x0014,
    PSINJECT_DOCUMENTPROCESSCOLORSATEND = 0x0015,
    PSINJECT_PAGENUMBER                 = 0x0064,
    PSINJECT_BEGINPAGESETUP             = 0x0065,
    PSINJECT_ENDPAGESETUP               = 0x0066,
    PSINJECT_PAGETRAILER                = 0x0067,
    PSINJECT_PLATECOLOR                 = 0x0068,
    PSINJECT_SHOWPAGE                   = 0x0069,
    PSINJECT_PAGEBBOX                   = 0x006a,
    PSINJECT_ENDPAGECOMMENTS            = 0x006b,
    PSINJECT_VMSAVE                     = 0x00c8,
    PSINJECT_VMRESTORE                  = 0x00c9,
}

alias HPTPROVIDER = void*;
struct DRAWPATRECT
{
    POINT ptPosition;
    POINT ptSize;
    ushort wStyle;
    ushort wPattern;
}
struct PSINJECTDATA
{
    uint DataBytes;
    PSINJECT_POINT InjectionPoint;
    ushort PageNumber;
}
struct PSFEATURE_OUTPUT
{
    BOOL bPageIndependent;
    BOOL bSetPageDevice;
}
struct PSFEATURE_CUSTPAPER
{
    int lOrientation;
    int lWidth;
    int lHeight;
    int lWidthOffset;
    int lHeightOffset;
}
alias ABORTPROC = BOOL function(HDC, int);
struct DOCINFOA
{
    int cbSize;
    const(char)* lpszDocName;
    const(char)* lpszOutput;
    const(char)* lpszDatatype;
    uint fwType;
}
struct DOCINFOW
{
    int cbSize;
    const(wchar)* lpszDocName;
    const(wchar)* lpszOutput;
    const(wchar)* lpszDatatype;
    uint fwType;
}
alias XPS_TILE_MODE = int;
enum : int
{
    XPS_TILE_MODE_NONE   = 0x00000001,
    XPS_TILE_MODE_TILE   = 0x00000002,
    XPS_TILE_MODE_FLIPX  = 0x00000003,
    XPS_TILE_MODE_FLIPY  = 0x00000004,
    XPS_TILE_MODE_FLIPXY = 0x00000005,
}

alias XPS_COLOR_INTERPOLATION = int;
enum : int
{
    XPS_COLOR_INTERPOLATION_SCRGBLINEAR = 0x00000001,
    XPS_COLOR_INTERPOLATION_SRGBLINEAR  = 0x00000002,
}

alias XPS_SPREAD_METHOD = int;
enum : int
{
    XPS_SPREAD_METHOD_PAD     = 0x00000001,
    XPS_SPREAD_METHOD_REFLECT = 0x00000002,
    XPS_SPREAD_METHOD_REPEAT  = 0x00000003,
}

alias XPS_STYLE_SIMULATION = int;
enum : int
{
    XPS_STYLE_SIMULATION_NONE       = 0x00000001,
    XPS_STYLE_SIMULATION_ITALIC     = 0x00000002,
    XPS_STYLE_SIMULATION_BOLD       = 0x00000003,
    XPS_STYLE_SIMULATION_BOLDITALIC = 0x00000004,
}

alias XPS_LINE_CAP = int;
enum : int
{
    XPS_LINE_CAP_FLAT     = 0x00000001,
    XPS_LINE_CAP_ROUND    = 0x00000002,
    XPS_LINE_CAP_SQUARE   = 0x00000003,
    XPS_LINE_CAP_TRIANGLE = 0x00000004,
}

alias XPS_DASH_CAP = int;
enum : int
{
    XPS_DASH_CAP_FLAT     = 0x00000001,
    XPS_DASH_CAP_ROUND    = 0x00000002,
    XPS_DASH_CAP_SQUARE   = 0x00000003,
    XPS_DASH_CAP_TRIANGLE = 0x00000004,
}

alias XPS_LINE_JOIN = int;
enum : int
{
    XPS_LINE_JOIN_MITER = 0x00000001,
    XPS_LINE_JOIN_BEVEL = 0x00000002,
    XPS_LINE_JOIN_ROUND = 0x00000003,
}

alias XPS_IMAGE_TYPE = int;
enum : int
{
    XPS_IMAGE_TYPE_JPEG = 0x00000001,
    XPS_IMAGE_TYPE_PNG  = 0x00000002,
    XPS_IMAGE_TYPE_TIFF = 0x00000003,
    XPS_IMAGE_TYPE_WDP  = 0x00000004,
    XPS_IMAGE_TYPE_JXR  = 0x00000005,
}

alias XPS_COLOR_TYPE = int;
enum : int
{
    XPS_COLOR_TYPE_SRGB    = 0x00000001,
    XPS_COLOR_TYPE_SCRGB   = 0x00000002,
    XPS_COLOR_TYPE_CONTEXT = 0x00000003,
}

alias XPS_FILL_RULE = int;
enum : int
{
    XPS_FILL_RULE_EVENODD = 0x00000001,
    XPS_FILL_RULE_NONZERO = 0x00000002,
}

alias XPS_SEGMENT_TYPE = int;
enum : int
{
    XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE        = 0x00000001,
    XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE = 0x00000002,
    XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE        = 0x00000003,
    XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE = 0x00000004,
    XPS_SEGMENT_TYPE_BEZIER                     = 0x00000005,
    XPS_SEGMENT_TYPE_LINE                       = 0x00000006,
    XPS_SEGMENT_TYPE_QUADRATIC_BEZIER           = 0x00000007,
}

alias XPS_SEGMENT_STROKE_PATTERN = int;
enum : int
{
    XPS_SEGMENT_STROKE_PATTERN_ALL   = 0x00000001,
    XPS_SEGMENT_STROKE_PATTERN_NONE  = 0x00000002,
    XPS_SEGMENT_STROKE_PATTERN_MIXED = 0x00000003,
}

alias XPS_FONT_EMBEDDING = int;
enum : int
{
    XPS_FONT_EMBEDDING_NORMAL                  = 0x00000001,
    XPS_FONT_EMBEDDING_OBFUSCATED              = 0x00000002,
    XPS_FONT_EMBEDDING_RESTRICTED              = 0x00000003,
    XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED = 0x00000004,
}

alias XPS_OBJECT_TYPE = int;
enum : int
{
    XPS_OBJECT_TYPE_CANVAS                = 0x00000001,
    XPS_OBJECT_TYPE_GLYPHS                = 0x00000002,
    XPS_OBJECT_TYPE_PATH                  = 0x00000003,
    XPS_OBJECT_TYPE_MATRIX_TRANSFORM      = 0x00000004,
    XPS_OBJECT_TYPE_GEOMETRY              = 0x00000005,
    XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH     = 0x00000006,
    XPS_OBJECT_TYPE_IMAGE_BRUSH           = 0x00000007,
    XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH = 0x00000008,
    XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH = 0x00000009,
    XPS_OBJECT_TYPE_VISUAL_BRUSH          = 0x0000000a,
}

alias XPS_THUMBNAIL_SIZE = int;
enum : int
{
    XPS_THUMBNAIL_SIZE_VERYSMALL = 0x00000001,
    XPS_THUMBNAIL_SIZE_SMALL     = 0x00000002,
    XPS_THUMBNAIL_SIZE_MEDIUM    = 0x00000003,
    XPS_THUMBNAIL_SIZE_LARGE     = 0x00000004,
}

alias XPS_INTERLEAVING = int;
enum : int
{
    XPS_INTERLEAVING_OFF = 0x00000001,
    XPS_INTERLEAVING_ON  = 0x00000002,
}

struct XPS_POINT
{
    float x;
    float y;
}
struct XPS_SIZE
{
    float width;
    float height;
}
struct XPS_RECT
{
    float x;
    float y;
    float width;
    float height;
}
struct XPS_DASH
{
    float length;
    float gap;
}
struct XPS_GLYPH_INDEX
{
    int index;
    float advanceWidth;
    float horizontalOffset;
    float verticalOffset;
}
struct XPS_GLYPH_MAPPING
{
    uint unicodeStringStart;
    ushort unicodeStringLength;
    uint glyphIndicesStart;
    ushort glyphIndicesLength;
}
struct XPS_MATRIX
{
    float m11;
    float m12;
    float m21;
    float m22;
    float m31;
    float m32;
}
struct XPS_COLOR
{
    XPS_COLOR_TYPE colorType;
    union XPS_COLOR_VALUE
    {
        struct _sRGB_e__Struct
        {
            ubyte alpha;
            ubyte red;
            ubyte green;
            ubyte blue;
        }
        struct _scRGB_e__Struct
        {
            float alpha;
            float red;
            float green;
            float blue;
        }
        struct _context_e__Struct
        {
            ubyte channelCount;
            float[9] channels;
        }
    }
}
enum IID_IXpsOMShareable = GUID(0x7137398f, 0x2fc1, 0x454d, [0x8c, 0x6a, 0x2c, 0x31, 0x15, 0xa1, 0x6e, 0xce]);
interface IXpsOMShareable : IUnknown
{
    HRESULT GetOwner(IUnknown*);
    HRESULT GetType(XPS_OBJECT_TYPE*);
}
enum IID_IXpsOMVisual = GUID(0xbc3e7333, 0xfb0b, 0x4af3, [0xa8, 0x19, 0xb, 0x4e, 0xaa, 0xd0, 0xd2, 0xfd]);
interface IXpsOMVisual : IXpsOMShareable
{
    HRESULT GetTransform(IXpsOMMatrixTransform*);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform*);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform);
    HRESULT GetTransformLookup(PWSTR*);
    HRESULT SetTransformLookup(const(wchar)*);
    HRESULT GetClipGeometry(IXpsOMGeometry*);
    HRESULT GetClipGeometryLocal(IXpsOMGeometry*);
    HRESULT SetClipGeometryLocal(IXpsOMGeometry);
    HRESULT GetClipGeometryLookup(PWSTR*);
    HRESULT SetClipGeometryLookup(const(wchar)*);
    HRESULT GetOpacity(float*);
    HRESULT SetOpacity(float);
    HRESULT GetOpacityMaskBrush(IXpsOMBrush*);
    HRESULT GetOpacityMaskBrushLocal(IXpsOMBrush*);
    HRESULT SetOpacityMaskBrushLocal(IXpsOMBrush);
    HRESULT GetOpacityMaskBrushLookup(PWSTR*);
    HRESULT SetOpacityMaskBrushLookup(const(wchar)*);
    HRESULT GetName(PWSTR*);
    HRESULT SetName(const(wchar)*);
    HRESULT GetIsHyperlinkTarget(BOOL*);
    HRESULT SetIsHyperlinkTarget(BOOL);
    HRESULT GetHyperlinkNavigateUri(IUri*);
    HRESULT SetHyperlinkNavigateUri(IUri);
    HRESULT GetLanguage(PWSTR*);
    HRESULT SetLanguage(const(wchar)*);
}
enum IID_IXpsOMPart = GUID(0x74eb2f0b, 0xa91e, 0x4486, [0xaf, 0xac, 0xf, 0xab, 0xec, 0xa3, 0xdf, 0xc6]);
interface IXpsOMPart : IUnknown
{
    HRESULT GetPartName(IOpcPartUri*);
    HRESULT SetPartName(IOpcPartUri);
}
enum IID_IXpsOMGlyphsEditor = GUID(0xa5ab8616, 0x5b16, 0x4b9f, [0x96, 0x29, 0x89, 0xb3, 0x23, 0xed, 0x79, 0x9]);
interface IXpsOMGlyphsEditor : IUnknown
{
    HRESULT ApplyEdits();
    HRESULT GetUnicodeString(PWSTR*);
    HRESULT SetUnicodeString(const(wchar)*);
    HRESULT GetGlyphIndexCount(uint*);
    HRESULT GetGlyphIndices(uint*, XPS_GLYPH_INDEX*);
    HRESULT SetGlyphIndices(uint, const(XPS_GLYPH_INDEX)*);
    HRESULT GetGlyphMappingCount(uint*);
    HRESULT GetGlyphMappings(uint*, XPS_GLYPH_MAPPING*);
    HRESULT SetGlyphMappings(uint, const(XPS_GLYPH_MAPPING)*);
    HRESULT GetProhibitedCaretStopCount(uint*);
    HRESULT GetProhibitedCaretStops(uint*, uint*);
    HRESULT SetProhibitedCaretStops(uint, const(uint)*);
    HRESULT GetBidiLevel(uint*);
    HRESULT SetBidiLevel(uint);
    HRESULT GetIsSideways(BOOL*);
    HRESULT SetIsSideways(BOOL);
    HRESULT GetDeviceFontName(PWSTR*);
    HRESULT SetDeviceFontName(const(wchar)*);
}
enum IID_IXpsOMGlyphs = GUID(0x819b3199, 0xa5a, 0x4b64, [0xbe, 0xc7, 0xa9, 0xe1, 0x7e, 0x78, 0xd, 0xe2]);
interface IXpsOMGlyphs : IXpsOMVisual
{
    HRESULT GetUnicodeString(PWSTR*);
    HRESULT GetGlyphIndexCount(uint*);
    HRESULT GetGlyphIndices(uint*, XPS_GLYPH_INDEX*);
    HRESULT GetGlyphMappingCount(uint*);
    HRESULT GetGlyphMappings(uint*, XPS_GLYPH_MAPPING*);
    HRESULT GetProhibitedCaretStopCount(uint*);
    HRESULT GetProhibitedCaretStops(uint*, uint*);
    HRESULT GetBidiLevel(uint*);
    HRESULT GetIsSideways(BOOL*);
    HRESULT GetDeviceFontName(PWSTR*);
    HRESULT GetStyleSimulations(XPS_STYLE_SIMULATION*);
    HRESULT SetStyleSimulations(XPS_STYLE_SIMULATION);
    HRESULT GetOrigin(XPS_POINT*);
    HRESULT SetOrigin(const(XPS_POINT)*);
    HRESULT GetFontRenderingEmSize(float*);
    HRESULT SetFontRenderingEmSize(float);
    HRESULT GetFontResource(IXpsOMFontResource*);
    HRESULT SetFontResource(IXpsOMFontResource);
    HRESULT GetFontFaceIndex(short*);
    HRESULT SetFontFaceIndex(short);
    HRESULT GetFillBrush(IXpsOMBrush*);
    HRESULT GetFillBrushLocal(IXpsOMBrush*);
    HRESULT SetFillBrushLocal(IXpsOMBrush);
    HRESULT GetFillBrushLookup(PWSTR*);
    HRESULT SetFillBrushLookup(const(wchar)*);
    HRESULT GetGlyphsEditor(IXpsOMGlyphsEditor*);
    HRESULT Clone(IXpsOMGlyphs*);
}
enum IID_IXpsOMDashCollection = GUID(0x81613f4, 0x74eb, 0x48f2, [0x83, 0xb3, 0x37, 0xa9, 0xce, 0x2d, 0x7d, 0xc6]);
interface IXpsOMDashCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, XPS_DASH*);
    HRESULT InsertAt(uint, const(XPS_DASH)*);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, const(XPS_DASH)*);
    HRESULT Append(const(XPS_DASH)*);
}
enum IID_IXpsOMMatrixTransform = GUID(0xb77330ff, 0xbb37, 0x4501, [0xa9, 0x3e, 0xf1, 0xb1, 0xe5, 0xb, 0xfc, 0x46]);
interface IXpsOMMatrixTransform : IXpsOMShareable
{
    HRESULT GetMatrix(XPS_MATRIX*);
    HRESULT SetMatrix(const(XPS_MATRIX)*);
    HRESULT Clone(IXpsOMMatrixTransform*);
}
enum IID_IXpsOMGeometry = GUID(0x64fcf3d7, 0x4d58, 0x44ba, [0xad, 0x73, 0xa1, 0x3a, 0xf6, 0x49, 0x20, 0x72]);
interface IXpsOMGeometry : IXpsOMShareable
{
    HRESULT GetFigures(IXpsOMGeometryFigureCollection*);
    HRESULT GetFillRule(XPS_FILL_RULE*);
    HRESULT SetFillRule(XPS_FILL_RULE);
    HRESULT GetTransform(IXpsOMMatrixTransform*);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform*);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform);
    HRESULT GetTransformLookup(PWSTR*);
    HRESULT SetTransformLookup(const(wchar)*);
    HRESULT Clone(IXpsOMGeometry*);
}
enum IID_IXpsOMGeometryFigure = GUID(0xd410dc83, 0x908c, 0x443e, [0x89, 0x47, 0xb1, 0x79, 0x5d, 0x3c, 0x16, 0x5a]);
interface IXpsOMGeometryFigure : IUnknown
{
    HRESULT GetOwner(IXpsOMGeometry*);
    HRESULT GetSegmentData(uint*, float*);
    HRESULT GetSegmentTypes(uint*, XPS_SEGMENT_TYPE*);
    HRESULT GetSegmentStrokes(uint*, BOOL*);
    HRESULT SetSegments(uint, uint, const(XPS_SEGMENT_TYPE)*, const(float)*, const(BOOL)*);
    HRESULT GetStartPoint(XPS_POINT*);
    HRESULT SetStartPoint(const(XPS_POINT)*);
    HRESULT GetIsClosed(BOOL*);
    HRESULT SetIsClosed(BOOL);
    HRESULT GetIsFilled(BOOL*);
    HRESULT SetIsFilled(BOOL);
    HRESULT GetSegmentCount(uint*);
    HRESULT GetSegmentDataCount(uint*);
    HRESULT GetSegmentStrokePattern(XPS_SEGMENT_STROKE_PATTERN*);
    HRESULT Clone(IXpsOMGeometryFigure*);
}
enum IID_IXpsOMGeometryFigureCollection = GUID(0xfd48c3f3, 0xa58e, 0x4b5a, [0x88, 0x26, 0x1d, 0xe5, 0x4a, 0xbe, 0x72, 0xb2]);
interface IXpsOMGeometryFigureCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMGeometryFigure*);
    HRESULT InsertAt(uint, IXpsOMGeometryFigure);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMGeometryFigure);
    HRESULT Append(IXpsOMGeometryFigure);
}
enum IID_IXpsOMPath = GUID(0x37d38bb6, 0x3ee9, 0x4110, [0x93, 0x12, 0x14, 0xb1, 0x94, 0x16, 0x33, 0x37]);
interface IXpsOMPath : IXpsOMVisual
{
    HRESULT GetGeometry(IXpsOMGeometry*);
    HRESULT GetGeometryLocal(IXpsOMGeometry*);
    HRESULT SetGeometryLocal(IXpsOMGeometry);
    HRESULT GetGeometryLookup(PWSTR*);
    HRESULT SetGeometryLookup(const(wchar)*);
    HRESULT GetAccessibilityShortDescription(PWSTR*);
    HRESULT SetAccessibilityShortDescription(const(wchar)*);
    HRESULT GetAccessibilityLongDescription(PWSTR*);
    HRESULT SetAccessibilityLongDescription(const(wchar)*);
    HRESULT GetSnapsToPixels(BOOL*);
    HRESULT SetSnapsToPixels(BOOL);
    HRESULT GetStrokeBrush(IXpsOMBrush*);
    HRESULT GetStrokeBrushLocal(IXpsOMBrush*);
    HRESULT SetStrokeBrushLocal(IXpsOMBrush);
    HRESULT GetStrokeBrushLookup(PWSTR*);
    HRESULT SetStrokeBrushLookup(const(wchar)*);
    HRESULT GetStrokeDashes(IXpsOMDashCollection*);
    HRESULT GetStrokeDashCap(XPS_DASH_CAP*);
    HRESULT SetStrokeDashCap(XPS_DASH_CAP);
    HRESULT GetStrokeDashOffset(float*);
    HRESULT SetStrokeDashOffset(float);
    HRESULT GetStrokeStartLineCap(XPS_LINE_CAP*);
    HRESULT SetStrokeStartLineCap(XPS_LINE_CAP);
    HRESULT GetStrokeEndLineCap(XPS_LINE_CAP*);
    HRESULT SetStrokeEndLineCap(XPS_LINE_CAP);
    HRESULT GetStrokeLineJoin(XPS_LINE_JOIN*);
    HRESULT SetStrokeLineJoin(XPS_LINE_JOIN);
    HRESULT GetStrokeMiterLimit(float*);
    HRESULT SetStrokeMiterLimit(float);
    HRESULT GetStrokeThickness(float*);
    HRESULT SetStrokeThickness(float);
    HRESULT GetFillBrush(IXpsOMBrush*);
    HRESULT GetFillBrushLocal(IXpsOMBrush*);
    HRESULT SetFillBrushLocal(IXpsOMBrush);
    HRESULT GetFillBrushLookup(PWSTR*);
    HRESULT SetFillBrushLookup(const(wchar)*);
    HRESULT Clone(IXpsOMPath*);
}
enum IID_IXpsOMBrush = GUID(0x56a3f80c, 0xea4c, 0x4187, [0xa5, 0x7b, 0xa2, 0xa4, 0x73, 0xb2, 0xb4, 0x2b]);
interface IXpsOMBrush : IXpsOMShareable
{
    HRESULT GetOpacity(float*);
    HRESULT SetOpacity(float);
}
enum IID_IXpsOMGradientStopCollection = GUID(0xc9174c3a, 0x3cd3, 0x4319, [0xbd, 0xa4, 0x11, 0xa3, 0x93, 0x92, 0xce, 0xef]);
interface IXpsOMGradientStopCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMGradientStop*);
    HRESULT InsertAt(uint, IXpsOMGradientStop);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMGradientStop);
    HRESULT Append(IXpsOMGradientStop);
}
enum IID_IXpsOMSolidColorBrush = GUID(0xa06f9f05, 0x3be9, 0x4763, [0x98, 0xa8, 0x9, 0x4f, 0xc6, 0x72, 0xe4, 0x88]);
interface IXpsOMSolidColorBrush : IXpsOMBrush
{
    HRESULT GetColor(XPS_COLOR*, IXpsOMColorProfileResource*);
    HRESULT SetColor(const(XPS_COLOR)*, IXpsOMColorProfileResource);
    HRESULT Clone(IXpsOMSolidColorBrush*);
}
enum IID_IXpsOMTileBrush = GUID(0xfc2328d, 0xd722, 0x4a54, [0xb2, 0xec, 0xbe, 0x90, 0x21, 0x8a, 0x78, 0x9e]);
interface IXpsOMTileBrush : IXpsOMBrush
{
    HRESULT GetTransform(IXpsOMMatrixTransform*);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform*);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform);
    HRESULT GetTransformLookup(PWSTR*);
    HRESULT SetTransformLookup(const(wchar)*);
    HRESULT GetViewbox(XPS_RECT*);
    HRESULT SetViewbox(const(XPS_RECT)*);
    HRESULT GetViewport(XPS_RECT*);
    HRESULT SetViewport(const(XPS_RECT)*);
    HRESULT GetTileMode(XPS_TILE_MODE*);
    HRESULT SetTileMode(XPS_TILE_MODE);
}
enum IID_IXpsOMVisualBrush = GUID(0x97e294af, 0x5b37, 0x46b4, [0x80, 0x57, 0x87, 0x4d, 0x2f, 0x64, 0x11, 0x9b]);
interface IXpsOMVisualBrush : IXpsOMTileBrush
{
    HRESULT GetVisual(IXpsOMVisual*);
    HRESULT GetVisualLocal(IXpsOMVisual*);
    HRESULT SetVisualLocal(IXpsOMVisual);
    HRESULT GetVisualLookup(PWSTR*);
    HRESULT SetVisualLookup(const(wchar)*);
    HRESULT Clone(IXpsOMVisualBrush*);
}
enum IID_IXpsOMImageBrush = GUID(0x3df0b466, 0xd382, 0x49ef, [0x85, 0x50, 0xdd, 0x94, 0xc8, 0x2, 0x42, 0xe4]);
interface IXpsOMImageBrush : IXpsOMTileBrush
{
    HRESULT GetImageResource(IXpsOMImageResource*);
    HRESULT SetImageResource(IXpsOMImageResource);
    HRESULT GetColorProfileResource(IXpsOMColorProfileResource*);
    HRESULT SetColorProfileResource(IXpsOMColorProfileResource);
    HRESULT Clone(IXpsOMImageBrush*);
}
enum IID_IXpsOMGradientStop = GUID(0x5cf4f5cc, 0x3969, 0x49b5, [0xa7, 0xa, 0x55, 0x50, 0xb6, 0x18, 0xfe, 0x49]);
interface IXpsOMGradientStop : IUnknown
{
    HRESULT GetOwner(IXpsOMGradientBrush*);
    HRESULT GetOffset(float*);
    HRESULT SetOffset(float);
    HRESULT GetColor(XPS_COLOR*, IXpsOMColorProfileResource*);
    HRESULT SetColor(const(XPS_COLOR)*, IXpsOMColorProfileResource);
    HRESULT Clone(IXpsOMGradientStop*);
}
enum IID_IXpsOMGradientBrush = GUID(0xedb59622, 0x61a2, 0x42c3, [0xba, 0xce, 0xac, 0xf2, 0x28, 0x6c, 0x6, 0xbf]);
interface IXpsOMGradientBrush : IXpsOMBrush
{
    HRESULT GetGradientStops(IXpsOMGradientStopCollection*);
    HRESULT GetTransform(IXpsOMMatrixTransform*);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform*);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform);
    HRESULT GetTransformLookup(PWSTR*);
    HRESULT SetTransformLookup(const(wchar)*);
    HRESULT GetSpreadMethod(XPS_SPREAD_METHOD*);
    HRESULT SetSpreadMethod(XPS_SPREAD_METHOD);
    HRESULT GetColorInterpolationMode(XPS_COLOR_INTERPOLATION*);
    HRESULT SetColorInterpolationMode(XPS_COLOR_INTERPOLATION);
}
enum IID_IXpsOMLinearGradientBrush = GUID(0x5e279f, 0xc30d, 0x40ff, [0x93, 0xec, 0x19, 0x50, 0xd3, 0xc5, 0x28, 0xdb]);
interface IXpsOMLinearGradientBrush : IXpsOMGradientBrush
{
    HRESULT GetStartPoint(XPS_POINT*);
    HRESULT SetStartPoint(const(XPS_POINT)*);
    HRESULT GetEndPoint(XPS_POINT*);
    HRESULT SetEndPoint(const(XPS_POINT)*);
    HRESULT Clone(IXpsOMLinearGradientBrush*);
}
enum IID_IXpsOMRadialGradientBrush = GUID(0x75f207e5, 0x8bf, 0x413c, [0x96, 0xb1, 0xb8, 0x2b, 0x40, 0x64, 0x17, 0x6b]);
interface IXpsOMRadialGradientBrush : IXpsOMGradientBrush
{
    HRESULT GetCenter(XPS_POINT*);
    HRESULT SetCenter(const(XPS_POINT)*);
    HRESULT GetRadiiSizes(XPS_SIZE*);
    HRESULT SetRadiiSizes(const(XPS_SIZE)*);
    HRESULT GetGradientOrigin(XPS_POINT*);
    HRESULT SetGradientOrigin(const(XPS_POINT)*);
    HRESULT Clone(IXpsOMRadialGradientBrush*);
}
enum IID_IXpsOMResource = GUID(0xda2ac0a2, 0x73a2, 0x4975, [0xad, 0x14, 0x74, 0x9, 0x7c, 0x3f, 0xf3, 0xa5]);
interface IXpsOMResource : IXpsOMPart
{
}
enum IID_IXpsOMPartResources = GUID(0xf4cf7729, 0x4864, 0x4275, [0x99, 0xb3, 0xa8, 0x71, 0x71, 0x63, 0xec, 0xaf]);
interface IXpsOMPartResources : IUnknown
{
    HRESULT GetFontResources(IXpsOMFontResourceCollection*);
    HRESULT GetImageResources(IXpsOMImageResourceCollection*);
    HRESULT GetColorProfileResources(IXpsOMColorProfileResourceCollection*);
    HRESULT GetRemoteDictionaryResources(IXpsOMRemoteDictionaryResourceCollection*);
}
enum IID_IXpsOMDictionary = GUID(0x897c86b8, 0x8eaf, 0x4ae3, [0xbd, 0xde, 0x56, 0x41, 0x9f, 0xcf, 0x42, 0x36]);
interface IXpsOMDictionary : IUnknown
{
    HRESULT GetOwner(IUnknown*);
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, PWSTR*, IXpsOMShareable*);
    HRESULT GetByKey(const(wchar)*, IXpsOMShareable, IXpsOMShareable*);
    HRESULT GetIndex(IXpsOMShareable, uint*);
    HRESULT Append(const(wchar)*, IXpsOMShareable);
    HRESULT InsertAt(uint, const(wchar)*, IXpsOMShareable);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, const(wchar)*, IXpsOMShareable);
    HRESULT Clone(IXpsOMDictionary*);
}
enum IID_IXpsOMFontResource = GUID(0xa8c45708, 0x47d9, 0x4af4, [0x8d, 0x20, 0x33, 0xb4, 0x8c, 0x9b, 0x84, 0x85]);
interface IXpsOMFontResource : IXpsOMResource
{
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, XPS_FONT_EMBEDDING, IOpcPartUri);
    HRESULT GetEmbeddingOption(XPS_FONT_EMBEDDING*);
}
enum IID_IXpsOMFontResourceCollection = GUID(0x70b4a6bb, 0x88d4, 0x4fa8, [0xaa, 0xf9, 0x6d, 0x9c, 0x59, 0x6f, 0xdb, 0xad]);
interface IXpsOMFontResourceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMFontResource*);
    HRESULT SetAt(uint, IXpsOMFontResource);
    HRESULT InsertAt(uint, IXpsOMFontResource);
    HRESULT Append(IXpsOMFontResource);
    HRESULT RemoveAt(uint);
    HRESULT GetByPartName(IOpcPartUri, IXpsOMFontResource*);
}
enum IID_IXpsOMImageResource = GUID(0x3db8417d, 0xae50, 0x485e, [0x9a, 0x44, 0xd7, 0x75, 0x8f, 0x78, 0xa2, 0x3f]);
interface IXpsOMImageResource : IXpsOMResource
{
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, XPS_IMAGE_TYPE, IOpcPartUri);
    HRESULT GetImageType(XPS_IMAGE_TYPE*);
}
enum IID_IXpsOMImageResourceCollection = GUID(0x7a4a1a71, 0x9cde, 0x4b71, [0xb3, 0x3f, 0x62, 0xde, 0x84, 0x3e, 0xab, 0xfe]);
interface IXpsOMImageResourceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMImageResource*);
    HRESULT InsertAt(uint, IXpsOMImageResource);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMImageResource);
    HRESULT Append(IXpsOMImageResource);
    HRESULT GetByPartName(IOpcPartUri, IXpsOMImageResource*);
}
enum IID_IXpsOMColorProfileResource = GUID(0x67bd7d69, 0x1eef, 0x4bb1, [0xb5, 0xe7, 0x6f, 0x4f, 0x87, 0xbe, 0x8a, 0xbe]);
interface IXpsOMColorProfileResource : IXpsOMResource
{
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, IOpcPartUri);
}
enum IID_IXpsOMColorProfileResourceCollection = GUID(0x12759630, 0x5fba, 0x4283, [0x8f, 0x7d, 0xcc, 0xa8, 0x49, 0x80, 0x9e, 0xdb]);
interface IXpsOMColorProfileResourceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMColorProfileResource*);
    HRESULT InsertAt(uint, IXpsOMColorProfileResource);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMColorProfileResource);
    HRESULT Append(IXpsOMColorProfileResource);
    HRESULT GetByPartName(IOpcPartUri, IXpsOMColorProfileResource*);
}
enum IID_IXpsOMPrintTicketResource = GUID(0xe7ff32d2, 0x34aa, 0x499b, [0xbb, 0xe9, 0x9c, 0xd4, 0xee, 0x6c, 0x59, 0xf7]);
interface IXpsOMPrintTicketResource : IXpsOMResource
{
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, IOpcPartUri);
}
enum IID_IXpsOMRemoteDictionaryResource = GUID(0xc9bd7cd4, 0xe16a, 0x4bf8, [0x8c, 0x84, 0xc9, 0x50, 0xaf, 0x7a, 0x30, 0x61]);
interface IXpsOMRemoteDictionaryResource : IXpsOMResource
{
    HRESULT GetDictionary(IXpsOMDictionary*);
    HRESULT SetDictionary(IXpsOMDictionary);
}
enum IID_IXpsOMRemoteDictionaryResourceCollection = GUID(0x5c38db61, 0x7fec, 0x464a, [0x87, 0xbd, 0x41, 0xe3, 0xbe, 0xf0, 0x18, 0xbe]);
interface IXpsOMRemoteDictionaryResourceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMRemoteDictionaryResource*);
    HRESULT InsertAt(uint, IXpsOMRemoteDictionaryResource);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMRemoteDictionaryResource);
    HRESULT Append(IXpsOMRemoteDictionaryResource);
    HRESULT GetByPartName(IOpcPartUri, IXpsOMRemoteDictionaryResource*);
}
enum IID_IXpsOMSignatureBlockResourceCollection = GUID(0xab8f5d8e, 0x351b, 0x4d33, [0xaa, 0xed, 0xfa, 0x56, 0xf0, 0x2, 0x29, 0x31]);
interface IXpsOMSignatureBlockResourceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMSignatureBlockResource*);
    HRESULT InsertAt(uint, IXpsOMSignatureBlockResource);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMSignatureBlockResource);
    HRESULT Append(IXpsOMSignatureBlockResource);
    HRESULT GetByPartName(IOpcPartUri, IXpsOMSignatureBlockResource*);
}
enum IID_IXpsOMDocumentStructureResource = GUID(0x85febc8a, 0x6b63, 0x48a9, [0xaf, 0x7, 0x70, 0x64, 0xe4, 0xec, 0xff, 0x30]);
interface IXpsOMDocumentStructureResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMDocument*);
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, IOpcPartUri);
}
enum IID_IXpsOMStoryFragmentsResource = GUID(0xc2b3ca09, 0x473, 0x4282, [0x87, 0xae, 0x17, 0x80, 0x86, 0x32, 0x23, 0xf0]);
interface IXpsOMStoryFragmentsResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMPageReference*);
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, IOpcPartUri);
}
enum IID_IXpsOMSignatureBlockResource = GUID(0x4776ad35, 0x2e04, 0x4357, [0x87, 0x43, 0xeb, 0xf6, 0xc1, 0x71, 0xa9, 0x5]);
interface IXpsOMSignatureBlockResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMDocument*);
    HRESULT GetStream(IStream*);
    HRESULT SetContent(IStream, IOpcPartUri);
}
enum IID_IXpsOMVisualCollection = GUID(0x94d8abde, 0xab91, 0x46a8, [0x82, 0xb7, 0xf5, 0xb0, 0x5e, 0xf0, 0x1a, 0x96]);
interface IXpsOMVisualCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMVisual*);
    HRESULT InsertAt(uint, IXpsOMVisual);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMVisual);
    HRESULT Append(IXpsOMVisual);
}
enum IID_IXpsOMCanvas = GUID(0x221d1452, 0x331e, 0x47c6, [0x87, 0xe9, 0x6c, 0xce, 0xfb, 0x9b, 0x5b, 0xa3]);
interface IXpsOMCanvas : IXpsOMVisual
{
    HRESULT GetVisuals(IXpsOMVisualCollection*);
    HRESULT GetUseAliasedEdgeMode(BOOL*);
    HRESULT SetUseAliasedEdgeMode(BOOL);
    HRESULT GetAccessibilityShortDescription(PWSTR*);
    HRESULT SetAccessibilityShortDescription(const(wchar)*);
    HRESULT GetAccessibilityLongDescription(PWSTR*);
    HRESULT SetAccessibilityLongDescription(const(wchar)*);
    HRESULT GetDictionary(IXpsOMDictionary*);
    HRESULT GetDictionaryLocal(IXpsOMDictionary*);
    HRESULT SetDictionaryLocal(IXpsOMDictionary);
    HRESULT GetDictionaryResource(IXpsOMRemoteDictionaryResource*);
    HRESULT SetDictionaryResource(IXpsOMRemoteDictionaryResource);
    HRESULT Clone(IXpsOMCanvas*);
}
enum IID_IXpsOMPage = GUID(0xd3e18888, 0xf120, 0x4fee, [0x8c, 0x68, 0x35, 0x29, 0x6e, 0xae, 0x91, 0xd4]);
interface IXpsOMPage : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPageReference*);
    HRESULT GetVisuals(IXpsOMVisualCollection*);
    HRESULT GetPageDimensions(XPS_SIZE*);
    HRESULT SetPageDimensions(const(XPS_SIZE)*);
    HRESULT GetContentBox(XPS_RECT*);
    HRESULT SetContentBox(const(XPS_RECT)*);
    HRESULT GetBleedBox(XPS_RECT*);
    HRESULT SetBleedBox(const(XPS_RECT)*);
    HRESULT GetLanguage(PWSTR*);
    HRESULT SetLanguage(const(wchar)*);
    HRESULT GetName(PWSTR*);
    HRESULT SetName(const(wchar)*);
    HRESULT GetIsHyperlinkTarget(BOOL*);
    HRESULT SetIsHyperlinkTarget(BOOL);
    HRESULT GetDictionary(IXpsOMDictionary*);
    HRESULT GetDictionaryLocal(IXpsOMDictionary*);
    HRESULT SetDictionaryLocal(IXpsOMDictionary);
    HRESULT GetDictionaryResource(IXpsOMRemoteDictionaryResource*);
    HRESULT SetDictionaryResource(IXpsOMRemoteDictionaryResource);
    HRESULT Write(ISequentialStream, BOOL);
    HRESULT GenerateUnusedLookupKey(XPS_OBJECT_TYPE, PWSTR*);
    HRESULT Clone(IXpsOMPage*);
}
enum IID_IXpsOMPageReference = GUID(0xed360180, 0x6f92, 0x4998, [0x89, 0xd, 0x2f, 0x20, 0x85, 0x31, 0xa0, 0xa0]);
interface IXpsOMPageReference : IUnknown
{
    HRESULT GetOwner(IXpsOMDocument*);
    HRESULT GetPage(IXpsOMPage*);
    HRESULT SetPage(IXpsOMPage);
    HRESULT DiscardPage();
    HRESULT IsPageLoaded(BOOL*);
    HRESULT GetAdvisoryPageDimensions(XPS_SIZE*);
    HRESULT SetAdvisoryPageDimensions(const(XPS_SIZE)*);
    HRESULT GetStoryFragmentsResource(IXpsOMStoryFragmentsResource*);
    HRESULT SetStoryFragmentsResource(IXpsOMStoryFragmentsResource);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource*);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource);
    HRESULT GetThumbnailResource(IXpsOMImageResource*);
    HRESULT SetThumbnailResource(IXpsOMImageResource);
    HRESULT CollectLinkTargets(IXpsOMNameCollection*);
    HRESULT CollectPartResources(IXpsOMPartResources*);
    HRESULT HasRestrictedFonts(BOOL*);
    HRESULT Clone(IXpsOMPageReference*);
}
enum IID_IXpsOMPageReferenceCollection = GUID(0xca16ba4d, 0xe7b9, 0x45c5, [0x95, 0x8b, 0xf9, 0x80, 0x22, 0x47, 0x37, 0x45]);
interface IXpsOMPageReferenceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMPageReference*);
    HRESULT InsertAt(uint, IXpsOMPageReference);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMPageReference);
    HRESULT Append(IXpsOMPageReference);
}
enum IID_IXpsOMDocument = GUID(0x2c2c94cb, 0xac5f, 0x4254, [0x8e, 0xe9, 0x23, 0x94, 0x83, 0x9, 0xd9, 0xf0]);
interface IXpsOMDocument : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMDocumentSequence*);
    HRESULT GetPageReferences(IXpsOMPageReferenceCollection*);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource*);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource);
    HRESULT GetDocumentStructureResource(IXpsOMDocumentStructureResource*);
    HRESULT SetDocumentStructureResource(IXpsOMDocumentStructureResource);
    HRESULT GetSignatureBlockResources(IXpsOMSignatureBlockResourceCollection*);
    HRESULT Clone(IXpsOMDocument*);
}
enum IID_IXpsOMDocumentCollection = GUID(0xd1c87f0d, 0xe947, 0x4754, [0x8a, 0x25, 0x97, 0x14, 0x78, 0xf7, 0xe8, 0x3e]);
interface IXpsOMDocumentCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsOMDocument*);
    HRESULT InsertAt(uint, IXpsOMDocument);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IXpsOMDocument);
    HRESULT Append(IXpsOMDocument);
}
enum IID_IXpsOMDocumentSequence = GUID(0x56492eb4, 0xd8d5, 0x425e, [0x82, 0x56, 0x4c, 0x2b, 0x64, 0xad, 0x2, 0x64]);
interface IXpsOMDocumentSequence : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPackage*);
    HRESULT GetDocuments(IXpsOMDocumentCollection*);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource*);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource);
}
enum IID_IXpsOMCoreProperties = GUID(0x3340fe8f, 0x4027, 0x4aa1, [0x8f, 0x5f, 0xd3, 0x5a, 0xe4, 0x5f, 0xe5, 0x97]);
interface IXpsOMCoreProperties : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPackage*);
    HRESULT GetCategory(PWSTR*);
    HRESULT SetCategory(const(wchar)*);
    HRESULT GetContentStatus(PWSTR*);
    HRESULT SetContentStatus(const(wchar)*);
    HRESULT GetContentType(PWSTR*);
    HRESULT SetContentType(const(wchar)*);
    HRESULT GetCreated(SYSTEMTIME*);
    HRESULT SetCreated(const(SYSTEMTIME)*);
    HRESULT GetCreator(PWSTR*);
    HRESULT SetCreator(const(wchar)*);
    HRESULT GetDescription(PWSTR*);
    HRESULT SetDescription(const(wchar)*);
    HRESULT GetIdentifier(PWSTR*);
    HRESULT SetIdentifier(const(wchar)*);
    HRESULT GetKeywords(PWSTR*);
    HRESULT SetKeywords(const(wchar)*);
    HRESULT GetLanguage(PWSTR*);
    HRESULT SetLanguage(const(wchar)*);
    HRESULT GetLastModifiedBy(PWSTR*);
    HRESULT SetLastModifiedBy(const(wchar)*);
    HRESULT GetLastPrinted(SYSTEMTIME*);
    HRESULT SetLastPrinted(const(SYSTEMTIME)*);
    HRESULT GetModified(SYSTEMTIME*);
    HRESULT SetModified(const(SYSTEMTIME)*);
    HRESULT GetRevision(PWSTR*);
    HRESULT SetRevision(const(wchar)*);
    HRESULT GetSubject(PWSTR*);
    HRESULT SetSubject(const(wchar)*);
    HRESULT GetTitle(PWSTR*);
    HRESULT SetTitle(const(wchar)*);
    HRESULT GetVersion(PWSTR*);
    HRESULT SetVersion(const(wchar)*);
    HRESULT Clone(IXpsOMCoreProperties*);
}
enum IID_IXpsOMPackage = GUID(0x18c3df65, 0x81e1, 0x4674, [0x91, 0xdc, 0xfc, 0x45, 0x2f, 0x5a, 0x41, 0x6f]);
interface IXpsOMPackage : IUnknown
{
    HRESULT GetDocumentSequence(IXpsOMDocumentSequence*);
    HRESULT SetDocumentSequence(IXpsOMDocumentSequence);
    HRESULT GetCoreProperties(IXpsOMCoreProperties*);
    HRESULT SetCoreProperties(IXpsOMCoreProperties);
    HRESULT GetDiscardControlPartName(IOpcPartUri*);
    HRESULT SetDiscardControlPartName(IOpcPartUri);
    HRESULT GetThumbnailResource(IXpsOMImageResource*);
    HRESULT SetThumbnailResource(IXpsOMImageResource);
    HRESULT WriteToFile(const(wchar)*, SECURITY_ATTRIBUTES*, uint, BOOL);
    HRESULT WriteToStream(ISequentialStream, BOOL);
}
enum IID_IXpsOMObjectFactory = GUID(0xf9b2a685, 0xa50d, 0x4fc2, [0xb7, 0x64, 0xb5, 0x6e, 0x9, 0x3e, 0xa0, 0xca]);
interface IXpsOMObjectFactory : IUnknown
{
    HRESULT CreatePackage(IXpsOMPackage*);
    HRESULT CreatePackageFromFile(const(wchar)*, BOOL, IXpsOMPackage*);
    HRESULT CreatePackageFromStream(IStream, BOOL, IXpsOMPackage*);
    HRESULT CreateStoryFragmentsResource(IStream, IOpcPartUri, IXpsOMStoryFragmentsResource*);
    HRESULT CreateDocumentStructureResource(IStream, IOpcPartUri, IXpsOMDocumentStructureResource*);
    HRESULT CreateSignatureBlockResource(IStream, IOpcPartUri, IXpsOMSignatureBlockResource*);
    HRESULT CreateRemoteDictionaryResource(IXpsOMDictionary, IOpcPartUri, IXpsOMRemoteDictionaryResource*);
    HRESULT CreateRemoteDictionaryResourceFromStream(IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*);
    HRESULT CreatePartResources(IXpsOMPartResources*);
    HRESULT CreateDocumentSequence(IOpcPartUri, IXpsOMDocumentSequence*);
    HRESULT CreateDocument(IOpcPartUri, IXpsOMDocument*);
    HRESULT CreatePageReference(const(XPS_SIZE)*, IXpsOMPageReference*);
    HRESULT CreatePage(const(XPS_SIZE)*, const(wchar)*, IOpcPartUri, IXpsOMPage*);
    HRESULT CreatePageFromStream(IStream, IOpcPartUri, IXpsOMPartResources, BOOL, IXpsOMPage*);
    HRESULT CreateCanvas(IXpsOMCanvas*);
    HRESULT CreateGlyphs(IXpsOMFontResource, IXpsOMGlyphs*);
    HRESULT CreatePath(IXpsOMPath*);
    HRESULT CreateGeometry(IXpsOMGeometry*);
    HRESULT CreateGeometryFigure(const(XPS_POINT)*, IXpsOMGeometryFigure*);
    HRESULT CreateMatrixTransform(const(XPS_MATRIX)*, IXpsOMMatrixTransform*);
    HRESULT CreateSolidColorBrush(const(XPS_COLOR)*, IXpsOMColorProfileResource, IXpsOMSolidColorBrush*);
    HRESULT CreateColorProfileResource(IStream, IOpcPartUri, IXpsOMColorProfileResource*);
    HRESULT CreateImageBrush(IXpsOMImageResource, const(XPS_RECT)*, const(XPS_RECT)*, IXpsOMImageBrush*);
    HRESULT CreateVisualBrush(const(XPS_RECT)*, const(XPS_RECT)*, IXpsOMVisualBrush*);
    HRESULT CreateImageResource(IStream, XPS_IMAGE_TYPE, IOpcPartUri, IXpsOMImageResource*);
    HRESULT CreatePrintTicketResource(IStream, IOpcPartUri, IXpsOMPrintTicketResource*);
    HRESULT CreateFontResource(IStream, XPS_FONT_EMBEDDING, IOpcPartUri, BOOL, IXpsOMFontResource*);
    HRESULT CreateGradientStop(const(XPS_COLOR)*, IXpsOMColorProfileResource, float, IXpsOMGradientStop*);
    HRESULT CreateLinearGradientBrush(IXpsOMGradientStop, IXpsOMGradientStop, const(XPS_POINT)*, const(XPS_POINT)*, IXpsOMLinearGradientBrush*);
    HRESULT CreateRadialGradientBrush(IXpsOMGradientStop, IXpsOMGradientStop, const(XPS_POINT)*, const(XPS_POINT)*, const(XPS_SIZE)*, IXpsOMRadialGradientBrush*);
    HRESULT CreateCoreProperties(IOpcPartUri, IXpsOMCoreProperties*);
    HRESULT CreateDictionary(IXpsOMDictionary*);
    HRESULT CreatePartUriCollection(IXpsOMPartUriCollection*);
    HRESULT CreatePackageWriterOnFile(const(wchar)*, SECURITY_ATTRIBUTES*, uint, BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*);
    HRESULT CreatePackageWriterOnStream(ISequentialStream, BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*);
    HRESULT CreatePartUri(const(wchar)*, IOpcPartUri*);
    HRESULT CreateReadOnlyStreamOnFile(const(wchar)*, IStream*);
}
enum IID_IXpsOMNameCollection = GUID(0x4bddf8ec, 0xc915, 0x421b, [0xa1, 0x66, 0xd1, 0x73, 0xd2, 0x56, 0x53, 0xd2]);
interface IXpsOMNameCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, PWSTR*);
}
enum IID_IXpsOMPartUriCollection = GUID(0x57c650d4, 0x67c, 0x4893, [0x8c, 0x33, 0xf6, 0x2a, 0x6, 0x33, 0x73, 0xf]);
interface IXpsOMPartUriCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IOpcPartUri*);
    HRESULT InsertAt(uint, IOpcPartUri);
    HRESULT RemoveAt(uint);
    HRESULT SetAt(uint, IOpcPartUri);
    HRESULT Append(IOpcPartUri);
}
enum IID_IXpsOMPackageWriter = GUID(0x4e2aa182, 0xa443, 0x42c6, [0xb4, 0x1b, 0x4f, 0x8e, 0x9d, 0xe7, 0x3f, 0xf9]);
interface IXpsOMPackageWriter : IUnknown
{
    HRESULT StartNewDocument(IOpcPartUri, IXpsOMPrintTicketResource, IXpsOMDocumentStructureResource, IXpsOMSignatureBlockResourceCollection, IXpsOMPartUriCollection);
    HRESULT AddPage(IXpsOMPage, const(XPS_SIZE)*, IXpsOMPartUriCollection, IXpsOMStoryFragmentsResource, IXpsOMPrintTicketResource, IXpsOMImageResource);
    HRESULT AddResource(IXpsOMResource);
    HRESULT Close();
    HRESULT IsClosed(BOOL*);
}
enum IID_IXpsOMPackageTarget = GUID(0x219a9db0, 0x4959, 0x47d0, [0x80, 0x34, 0xb1, 0xce, 0x84, 0xf4, 0x1a, 0x4d]);
interface IXpsOMPackageTarget : IUnknown
{
    HRESULT CreateXpsOMPackageWriter(IOpcPartUri, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*);
}
enum IID_IXpsOMThumbnailGenerator = GUID(0x15b873d5, 0x1971, 0x41e8, [0x83, 0xa3, 0x65, 0x78, 0x40, 0x30, 0x64, 0xc7]);
interface IXpsOMThumbnailGenerator : IUnknown
{
    HRESULT GenerateThumbnail(IXpsOMPage, XPS_IMAGE_TYPE, XPS_THUMBNAIL_SIZE, IOpcPartUri, IXpsOMImageResource*);
}
enum CLSID_XpsOMObjectFactory = GUID(0xe974d26d, 0x3d9b, 0x4d47, [0x88, 0xcc, 0x38, 0x72, 0xf2, 0xdc, 0x35, 0x85]);
struct XpsOMObjectFactory
{
}
enum CLSID_XpsOMThumbnailGenerator = GUID(0x7e4a23e2, 0xb969, 0x4761, [0xbe, 0x35, 0x1a, 0x8c, 0xed, 0x58, 0xe3, 0x23]);
struct XpsOMThumbnailGenerator
{
}
alias XPS_DOCUMENT_TYPE = int;
enum : int
{
    XPS_DOCUMENT_TYPE_UNSPECIFIED = 0x00000001,
    XPS_DOCUMENT_TYPE_XPS         = 0x00000002,
    XPS_DOCUMENT_TYPE_OPENXPS     = 0x00000003,
}

enum IID_IXpsOMObjectFactory1 = GUID(0xa91b617, 0xd612, 0x4181, [0xbf, 0x7c, 0xbe, 0x58, 0x24, 0xe9, 0xcc, 0x8f]);
interface IXpsOMObjectFactory1 : IXpsOMObjectFactory
{
    HRESULT GetDocumentTypeFromFile(const(wchar)*, XPS_DOCUMENT_TYPE*);
    HRESULT GetDocumentTypeFromStream(IStream, XPS_DOCUMENT_TYPE*);
    HRESULT ConvertHDPhotoToJpegXR(IXpsOMImageResource);
    HRESULT ConvertJpegXRToHDPhoto(IXpsOMImageResource);
    HRESULT CreatePackageWriterOnFile1(const(wchar)*, SECURITY_ATTRIBUTES*, uint, BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*);
    HRESULT CreatePackageWriterOnStream1(ISequentialStream, BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*);
    HRESULT CreatePackage1(IXpsOMPackage1*);
    HRESULT CreatePackageFromStream1(IStream, BOOL, IXpsOMPackage1*);
    HRESULT CreatePackageFromFile1(const(wchar)*, BOOL, IXpsOMPackage1*);
    HRESULT CreatePage1(const(XPS_SIZE)*, const(wchar)*, IOpcPartUri, IXpsOMPage1*);
    HRESULT CreatePageFromStream1(IStream, IOpcPartUri, IXpsOMPartResources, BOOL, IXpsOMPage1*);
    HRESULT CreateRemoteDictionaryResourceFromStream1(IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*);
}
enum IID_IXpsOMPackage1 = GUID(0x95a9435e, 0x12bb, 0x461b, [0x8e, 0x7f, 0xc6, 0xad, 0xb0, 0x4c, 0xd9, 0x6a]);
interface IXpsOMPackage1 : IXpsOMPackage
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE*);
    HRESULT WriteToFile1(const(wchar)*, SECURITY_ATTRIBUTES*, uint, BOOL, XPS_DOCUMENT_TYPE);
    HRESULT WriteToStream1(ISequentialStream, BOOL, XPS_DOCUMENT_TYPE);
}
enum IID_IXpsOMPage1 = GUID(0x305b60ef, 0x6892, 0x4dda, [0x9c, 0xbb, 0x3a, 0xa6, 0x59, 0x74, 0x50, 0x8a]);
interface IXpsOMPage1 : IXpsOMPage
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE*);
    HRESULT Write1(ISequentialStream, BOOL, XPS_DOCUMENT_TYPE);
}
enum IID_IXpsDocumentPackageTarget = GUID(0x3b0b6d38, 0x53ad, 0x41da, [0xb2, 0x12, 0xd3, 0x76, 0x37, 0xa6, 0x71, 0x4e]);
interface IXpsDocumentPackageTarget : IUnknown
{
    HRESULT GetXpsOMPackageWriter(IOpcPartUri, IOpcPartUri, IXpsOMPackageWriter*);
    HRESULT GetXpsOMFactory(IXpsOMObjectFactory*);
    HRESULT GetXpsType(XPS_DOCUMENT_TYPE*);
}
enum IID_IXpsOMRemoteDictionaryResource1 = GUID(0xbf8fc1d4, 0x9d46, 0x4141, [0xba, 0x5f, 0x94, 0xbb, 0x92, 0x50, 0xd0, 0x41]);
interface IXpsOMRemoteDictionaryResource1 : IXpsOMRemoteDictionaryResource
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE*);
    HRESULT Write1(ISequentialStream, XPS_DOCUMENT_TYPE);
}
enum IID_IXpsOMPackageWriter3D = GUID(0xe8a45033, 0x640e, 0x43fa, [0x9b, 0xdf, 0xfd, 0xde, 0xaa, 0x31, 0xc6, 0xa0]);
interface IXpsOMPackageWriter3D : IXpsOMPackageWriter
{
    HRESULT AddModelTexture(IOpcPartUri, IStream);
    HRESULT SetModelPrintTicket(IOpcPartUri, IStream);
}
enum IID_IXpsDocumentPackageTarget3D = GUID(0x60ba71b8, 0x3101, 0x4984, [0x91, 0x99, 0xf4, 0xea, 0x77, 0x5f, 0xf0, 0x1d]);
interface IXpsDocumentPackageTarget3D : IUnknown
{
    HRESULT GetXpsOMPackageWriter3D(IOpcPartUri, IOpcPartUri, IOpcPartUri, IStream, IXpsOMPackageWriter3D*);
    HRESULT GetXpsOMFactory(IXpsOMObjectFactory*);
}
alias XPS_SIGNATURE_STATUS = int;
enum : int
{
    XPS_SIGNATURE_STATUS_INCOMPLIANT  = 0x00000001,
    XPS_SIGNATURE_STATUS_INCOMPLETE   = 0x00000002,
    XPS_SIGNATURE_STATUS_BROKEN       = 0x00000003,
    XPS_SIGNATURE_STATUS_QUESTIONABLE = 0x00000004,
    XPS_SIGNATURE_STATUS_VALID        = 0x00000005,
}

alias XPS_SIGN_POLICY = int;
enum : int
{
    XPS_SIGN_POLICY_NONE                    = 0x00000000,
    XPS_SIGN_POLICY_CORE_PROPERTIES         = 0x00000001,
    XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS = 0x00000002,
    XPS_SIGN_POLICY_PRINT_TICKET            = 0x00000004,
    XPS_SIGN_POLICY_DISCARD_CONTROL         = 0x00000008,
    XPS_SIGN_POLICY_ALL                     = 0x0000000f,
}

alias XPS_SIGN_FLAGS = int;
enum : int
{
    XPS_SIGN_FLAGS_NONE                        = 0x00000000,
    XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY = 0x00000001,
}

enum IID_IXpsSigningOptions = GUID(0x7718eae4, 0x3215, 0x49be, [0xaf, 0x5b, 0x59, 0x4f, 0xef, 0x7f, 0xcf, 0xa6]);
interface IXpsSigningOptions : IUnknown
{
    HRESULT GetSignatureId(PWSTR*);
    HRESULT SetSignatureId(const(wchar)*);
    HRESULT GetSignatureMethod(PWSTR*);
    HRESULT SetSignatureMethod(const(wchar)*);
    HRESULT GetDigestMethod(PWSTR*);
    HRESULT SetDigestMethod(const(wchar)*);
    HRESULT GetSignaturePartName(IOpcPartUri*);
    HRESULT SetSignaturePartName(IOpcPartUri);
    HRESULT GetPolicy(XPS_SIGN_POLICY*);
    HRESULT SetPolicy(XPS_SIGN_POLICY);
    HRESULT GetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT*);
    HRESULT SetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT);
    HRESULT GetCustomObjects(IOpcSignatureCustomObjectSet*);
    HRESULT GetCustomReferences(IOpcSignatureReferenceSet*);
    HRESULT GetCertificateSet(IOpcCertificateSet*);
    HRESULT GetFlags(XPS_SIGN_FLAGS*);
    HRESULT SetFlags(XPS_SIGN_FLAGS);
}
enum IID_IXpsSignatureCollection = GUID(0xa2d1d95d, 0xadd2, 0x4dff, [0xab, 0x27, 0x6b, 0x9c, 0x64, 0x5f, 0xf3, 0x22]);
interface IXpsSignatureCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsSignature*);
    HRESULT RemoveAt(uint);
}
enum IID_IXpsSignature = GUID(0x6ae4c93e, 0x1ade, 0x42fb, [0x89, 0x8b, 0x3a, 0x56, 0x58, 0x28, 0x48, 0x57]);
interface IXpsSignature : IUnknown
{
    HRESULT GetSignatureId(PWSTR*);
    HRESULT GetSignatureValue(ubyte**, uint*);
    HRESULT GetCertificateEnumerator(IOpcCertificateEnumerator*);
    HRESULT GetSigningTime(PWSTR*);
    HRESULT GetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT*);
    HRESULT GetSignaturePartName(IOpcPartUri*);
    HRESULT Verify(const(CERT_CONTEXT)*, XPS_SIGNATURE_STATUS*);
    HRESULT GetPolicy(XPS_SIGN_POLICY*);
    HRESULT GetCustomObjectEnumerator(IOpcSignatureCustomObjectEnumerator*);
    HRESULT GetCustomReferenceEnumerator(IOpcSignatureReferenceEnumerator*);
    HRESULT GetSignatureXml(ubyte**, uint*);
    HRESULT SetSignatureXml(const(ubyte)*, uint);
}
enum IID_IXpsSignatureBlockCollection = GUID(0x23397050, 0xfe99, 0x467a, [0x8d, 0xce, 0x92, 0x37, 0xf0, 0x74, 0xff, 0xe4]);
interface IXpsSignatureBlockCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsSignatureBlock*);
    HRESULT RemoveAt(uint);
}
enum IID_IXpsSignatureBlock = GUID(0x151fac09, 0xb97, 0x4ac6, [0xa3, 0x23, 0x5e, 0x42, 0x97, 0xd4, 0x32, 0x2b]);
interface IXpsSignatureBlock : IUnknown
{
    HRESULT GetRequests(IXpsSignatureRequestCollection*);
    HRESULT GetPartName(IOpcPartUri*);
    HRESULT GetDocumentIndex(uint*);
    HRESULT GetDocumentName(IOpcPartUri*);
    HRESULT CreateRequest(const(wchar)*, IXpsSignatureRequest*);
}
enum IID_IXpsSignatureRequestCollection = GUID(0xf0253e68, 0x9f19, 0x412e, [0x9b, 0x4f, 0x54, 0xd3, 0xb0, 0xac, 0x6c, 0xd9]);
interface IXpsSignatureRequestCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, IXpsSignatureRequest*);
    HRESULT RemoveAt(uint);
}
enum IID_IXpsSignatureRequest = GUID(0xac58950b, 0x7208, 0x4b2d, [0xb2, 0xc4, 0x95, 0x10, 0x83, 0xd3, 0xb8, 0xeb]);
interface IXpsSignatureRequest : IUnknown
{
    HRESULT GetIntent(PWSTR*);
    HRESULT SetIntent(const(wchar)*);
    HRESULT GetRequestedSigner(PWSTR*);
    HRESULT SetRequestedSigner(const(wchar)*);
    HRESULT GetRequestSignByDate(PWSTR*);
    HRESULT SetRequestSignByDate(const(wchar)*);
    HRESULT GetSigningLocale(PWSTR*);
    HRESULT SetSigningLocale(const(wchar)*);
    HRESULT GetSpotLocation(int*, IOpcPartUri*, float*, float*);
    HRESULT SetSpotLocation(int, float, float);
    HRESULT GetRequestId(PWSTR*);
    HRESULT GetSignature(IXpsSignature*);
}
enum IID_IXpsSignatureManager = GUID(0xd3e8d338, 0xfdc4, 0x4afc, [0x80, 0xb5, 0xd5, 0x32, 0xa1, 0x78, 0x2e, 0xe1]);
interface IXpsSignatureManager : IUnknown
{
    HRESULT LoadPackageFile(const(wchar)*);
    HRESULT LoadPackageStream(IStream);
    HRESULT Sign(IXpsSigningOptions, const(CERT_CONTEXT)*, IXpsSignature*);
    HRESULT GetSignatureOriginPartName(IOpcPartUri*);
    HRESULT SetSignatureOriginPartName(IOpcPartUri);
    HRESULT GetSignatures(IXpsSignatureCollection*);
    HRESULT AddSignatureBlock(IOpcPartUri, uint, IXpsSignatureBlock*);
    HRESULT GetSignatureBlocks(IXpsSignatureBlockCollection*);
    HRESULT CreateSigningOptions(IXpsSigningOptions*);
    HRESULT SavePackageToFile(const(wchar)*, SECURITY_ATTRIBUTES*, uint);
    HRESULT SavePackageToStream(IStream);
}
enum CLSID_XpsSignatureManager = GUID(0xb0c43320, 0x2315, 0x44a2, [0xb7, 0xa, 0x9, 0x43, 0xa1, 0x40, 0xa8, 0xee]);
struct XpsSignatureManager
{
}
