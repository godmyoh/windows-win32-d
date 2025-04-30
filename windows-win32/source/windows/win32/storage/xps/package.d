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

int DeviceCapabilitiesA(const(char)* pDevice, const(char)* pPort, PRINTER_DEVICE_CAPABILITIES fwCapability, PSTR pOutput, const(DEVMODEA)* pDevMode);
int DeviceCapabilitiesW(const(wchar)* pDevice, const(wchar)* pPort, PRINTER_DEVICE_CAPABILITIES fwCapability, PWSTR pOutput, const(DEVMODEW)* pDevMode);
int Escape(HDC hdc, int iEscape, int cjIn, const(char)* pvIn, void* pvOut);
int ExtEscape(HDC hdc, int iEscape, int cjInput, const(char)* lpInData, int cjOutput, PSTR lpOutData);
int StartDocA(HDC hdc, const(DOCINFOA)* lpdi);
int StartDocW(HDC hdc, const(DOCINFOW)* lpdi);
int EndDoc(HDC hdc);
int StartPage(HDC hdc);
int EndPage(HDC hdc);
int AbortDoc(HDC hdc);
int SetAbortProc(HDC hdc, ABORTPROC proc);
BOOL PrintWindow(HWND hwnd, HDC hdcBlt, PRINT_WINDOW_FLAGS nFlags);
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
alias ABORTPROC = BOOL function(HDC param0, int param1);
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
        struct sRGB
        {
            ubyte alpha;
            ubyte red;
            ubyte green;
            ubyte blue;
        }
        struct scRGB
        {
            float alpha;
            float red;
            float green;
            float blue;
        }
        struct context
        {
            ubyte channelCount;
            float[9] channels;
        }
    }
}
enum IID_IXpsOMShareable = GUID(0x7137398f, 0x2fc1, 0x454d, [0x8c, 0x6a, 0x2c, 0x31, 0x15, 0xa1, 0x6e, 0xce]);
interface IXpsOMShareable : IUnknown
{
    HRESULT GetOwner(IUnknown* owner);
    HRESULT GetType(XPS_OBJECT_TYPE* type);
}
enum IID_IXpsOMVisual = GUID(0xbc3e7333, 0xfb0b, 0x4af3, [0xa8, 0x19, 0xb, 0x4e, 0xaa, 0xd0, 0xd2, 0xfd]);
interface IXpsOMVisual : IXpsOMShareable
{
    HRESULT GetTransform(IXpsOMMatrixTransform* matrixTransform);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform* matrixTransform);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform matrixTransform);
    HRESULT GetTransformLookup(PWSTR* key);
    HRESULT SetTransformLookup(const(wchar)* key);
    HRESULT GetClipGeometry(IXpsOMGeometry* clipGeometry);
    HRESULT GetClipGeometryLocal(IXpsOMGeometry* clipGeometry);
    HRESULT SetClipGeometryLocal(IXpsOMGeometry clipGeometry);
    HRESULT GetClipGeometryLookup(PWSTR* key);
    HRESULT SetClipGeometryLookup(const(wchar)* key);
    HRESULT GetOpacity(float* opacity);
    HRESULT SetOpacity(float opacity);
    HRESULT GetOpacityMaskBrush(IXpsOMBrush* opacityMaskBrush);
    HRESULT GetOpacityMaskBrushLocal(IXpsOMBrush* opacityMaskBrush);
    HRESULT SetOpacityMaskBrushLocal(IXpsOMBrush opacityMaskBrush);
    HRESULT GetOpacityMaskBrushLookup(PWSTR* key);
    HRESULT SetOpacityMaskBrushLookup(const(wchar)* key);
    HRESULT GetName(PWSTR* name);
    HRESULT SetName(const(wchar)* name);
    HRESULT GetIsHyperlinkTarget(BOOL* isHyperlink);
    HRESULT SetIsHyperlinkTarget(BOOL isHyperlink);
    HRESULT GetHyperlinkNavigateUri(IUri* hyperlinkUri);
    HRESULT SetHyperlinkNavigateUri(IUri hyperlinkUri);
    HRESULT GetLanguage(PWSTR* language);
    HRESULT SetLanguage(const(wchar)* language);
}
enum IID_IXpsOMPart = GUID(0x74eb2f0b, 0xa91e, 0x4486, [0xaf, 0xac, 0xf, 0xab, 0xec, 0xa3, 0xdf, 0xc6]);
interface IXpsOMPart : IUnknown
{
    HRESULT GetPartName(IOpcPartUri* partUri);
    HRESULT SetPartName(IOpcPartUri partUri);
}
enum IID_IXpsOMGlyphsEditor = GUID(0xa5ab8616, 0x5b16, 0x4b9f, [0x96, 0x29, 0x89, 0xb3, 0x23, 0xed, 0x79, 0x9]);
interface IXpsOMGlyphsEditor : IUnknown
{
    HRESULT ApplyEdits();
    HRESULT GetUnicodeString(PWSTR* unicodeString);
    HRESULT SetUnicodeString(const(wchar)* unicodeString);
    HRESULT GetGlyphIndexCount(uint* indexCount);
    HRESULT GetGlyphIndices(uint* indexCount, XPS_GLYPH_INDEX* glyphIndices);
    HRESULT SetGlyphIndices(uint indexCount, const(XPS_GLYPH_INDEX)* glyphIndices);
    HRESULT GetGlyphMappingCount(uint* glyphMappingCount);
    HRESULT GetGlyphMappings(uint* glyphMappingCount, XPS_GLYPH_MAPPING* glyphMappings);
    HRESULT SetGlyphMappings(uint glyphMappingCount, const(XPS_GLYPH_MAPPING)* glyphMappings);
    HRESULT GetProhibitedCaretStopCount(uint* prohibitedCaretStopCount);
    HRESULT GetProhibitedCaretStops(uint* count, uint* prohibitedCaretStops);
    HRESULT SetProhibitedCaretStops(uint count, const(uint)* prohibitedCaretStops);
    HRESULT GetBidiLevel(uint* bidiLevel);
    HRESULT SetBidiLevel(uint bidiLevel);
    HRESULT GetIsSideways(BOOL* isSideways);
    HRESULT SetIsSideways(BOOL isSideways);
    HRESULT GetDeviceFontName(PWSTR* deviceFontName);
    HRESULT SetDeviceFontName(const(wchar)* deviceFontName);
}
enum IID_IXpsOMGlyphs = GUID(0x819b3199, 0xa5a, 0x4b64, [0xbe, 0xc7, 0xa9, 0xe1, 0x7e, 0x78, 0xd, 0xe2]);
interface IXpsOMGlyphs : IXpsOMVisual
{
    HRESULT GetUnicodeString(PWSTR* unicodeString);
    HRESULT GetGlyphIndexCount(uint* indexCount);
    HRESULT GetGlyphIndices(uint* indexCount, XPS_GLYPH_INDEX* glyphIndices);
    HRESULT GetGlyphMappingCount(uint* glyphMappingCount);
    HRESULT GetGlyphMappings(uint* glyphMappingCount, XPS_GLYPH_MAPPING* glyphMappings);
    HRESULT GetProhibitedCaretStopCount(uint* prohibitedCaretStopCount);
    HRESULT GetProhibitedCaretStops(uint* prohibitedCaretStopCount, uint* prohibitedCaretStops);
    HRESULT GetBidiLevel(uint* bidiLevel);
    HRESULT GetIsSideways(BOOL* isSideways);
    HRESULT GetDeviceFontName(PWSTR* deviceFontName);
    HRESULT GetStyleSimulations(XPS_STYLE_SIMULATION* styleSimulations);
    HRESULT SetStyleSimulations(XPS_STYLE_SIMULATION styleSimulations);
    HRESULT GetOrigin(XPS_POINT* origin);
    HRESULT SetOrigin(const(XPS_POINT)* origin);
    HRESULT GetFontRenderingEmSize(float* fontRenderingEmSize);
    HRESULT SetFontRenderingEmSize(float fontRenderingEmSize);
    HRESULT GetFontResource(IXpsOMFontResource* fontResource);
    HRESULT SetFontResource(IXpsOMFontResource fontResource);
    HRESULT GetFontFaceIndex(short* fontFaceIndex);
    HRESULT SetFontFaceIndex(short fontFaceIndex);
    HRESULT GetFillBrush(IXpsOMBrush* fillBrush);
    HRESULT GetFillBrushLocal(IXpsOMBrush* fillBrush);
    HRESULT SetFillBrushLocal(IXpsOMBrush fillBrush);
    HRESULT GetFillBrushLookup(PWSTR* key);
    HRESULT SetFillBrushLookup(const(wchar)* key);
    HRESULT GetGlyphsEditor(IXpsOMGlyphsEditor* editor);
    HRESULT Clone(IXpsOMGlyphs* glyphs);
}
enum IID_IXpsOMDashCollection = GUID(0x81613f4, 0x74eb, 0x48f2, [0x83, 0xb3, 0x37, 0xa9, 0xce, 0x2d, 0x7d, 0xc6]);
interface IXpsOMDashCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, XPS_DASH* dash);
    HRESULT InsertAt(uint index, const(XPS_DASH)* dash);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, const(XPS_DASH)* dash);
    HRESULT Append(const(XPS_DASH)* dash);
}
enum IID_IXpsOMMatrixTransform = GUID(0xb77330ff, 0xbb37, 0x4501, [0xa9, 0x3e, 0xf1, 0xb1, 0xe5, 0xb, 0xfc, 0x46]);
interface IXpsOMMatrixTransform : IXpsOMShareable
{
    HRESULT GetMatrix(XPS_MATRIX* matrix);
    HRESULT SetMatrix(const(XPS_MATRIX)* matrix);
    HRESULT Clone(IXpsOMMatrixTransform* matrixTransform);
}
enum IID_IXpsOMGeometry = GUID(0x64fcf3d7, 0x4d58, 0x44ba, [0xad, 0x73, 0xa1, 0x3a, 0xf6, 0x49, 0x20, 0x72]);
interface IXpsOMGeometry : IXpsOMShareable
{
    HRESULT GetFigures(IXpsOMGeometryFigureCollection* figures);
    HRESULT GetFillRule(XPS_FILL_RULE* fillRule);
    HRESULT SetFillRule(XPS_FILL_RULE fillRule);
    HRESULT GetTransform(IXpsOMMatrixTransform* transform);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform* transform);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform transform);
    HRESULT GetTransformLookup(PWSTR* lookup);
    HRESULT SetTransformLookup(const(wchar)* lookup);
    HRESULT Clone(IXpsOMGeometry* geometry);
}
enum IID_IXpsOMGeometryFigure = GUID(0xd410dc83, 0x908c, 0x443e, [0x89, 0x47, 0xb1, 0x79, 0x5d, 0x3c, 0x16, 0x5a]);
interface IXpsOMGeometryFigure : IUnknown
{
    HRESULT GetOwner(IXpsOMGeometry* owner);
    HRESULT GetSegmentData(uint* dataCount, float* segmentData);
    HRESULT GetSegmentTypes(uint* segmentCount, XPS_SEGMENT_TYPE* segmentTypes);
    HRESULT GetSegmentStrokes(uint* segmentCount, BOOL* segmentStrokes);
    HRESULT SetSegments(uint segmentCount, uint segmentDataCount, const(XPS_SEGMENT_TYPE)* segmentTypes, const(float)* segmentData, const(BOOL)* segmentStrokes);
    HRESULT GetStartPoint(XPS_POINT* startPoint);
    HRESULT SetStartPoint(const(XPS_POINT)* startPoint);
    HRESULT GetIsClosed(BOOL* isClosed);
    HRESULT SetIsClosed(BOOL isClosed);
    HRESULT GetIsFilled(BOOL* isFilled);
    HRESULT SetIsFilled(BOOL isFilled);
    HRESULT GetSegmentCount(uint* segmentCount);
    HRESULT GetSegmentDataCount(uint* segmentDataCount);
    HRESULT GetSegmentStrokePattern(XPS_SEGMENT_STROKE_PATTERN* segmentStrokePattern);
    HRESULT Clone(IXpsOMGeometryFigure* geometryFigure);
}
enum IID_IXpsOMGeometryFigureCollection = GUID(0xfd48c3f3, 0xa58e, 0x4b5a, [0x88, 0x26, 0x1d, 0xe5, 0x4a, 0xbe, 0x72, 0xb2]);
interface IXpsOMGeometryFigureCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMGeometryFigure* geometryFigure);
    HRESULT InsertAt(uint index, IXpsOMGeometryFigure geometryFigure);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMGeometryFigure geometryFigure);
    HRESULT Append(IXpsOMGeometryFigure geometryFigure);
}
enum IID_IXpsOMPath = GUID(0x37d38bb6, 0x3ee9, 0x4110, [0x93, 0x12, 0x14, 0xb1, 0x94, 0x16, 0x33, 0x37]);
interface IXpsOMPath : IXpsOMVisual
{
    HRESULT GetGeometry(IXpsOMGeometry* geometry);
    HRESULT GetGeometryLocal(IXpsOMGeometry* geometry);
    HRESULT SetGeometryLocal(IXpsOMGeometry geometry);
    HRESULT GetGeometryLookup(PWSTR* lookup);
    HRESULT SetGeometryLookup(const(wchar)* lookup);
    HRESULT GetAccessibilityShortDescription(PWSTR* shortDescription);
    HRESULT SetAccessibilityShortDescription(const(wchar)* shortDescription);
    HRESULT GetAccessibilityLongDescription(PWSTR* longDescription);
    HRESULT SetAccessibilityLongDescription(const(wchar)* longDescription);
    HRESULT GetSnapsToPixels(BOOL* snapsToPixels);
    HRESULT SetSnapsToPixels(BOOL snapsToPixels);
    HRESULT GetStrokeBrush(IXpsOMBrush* brush);
    HRESULT GetStrokeBrushLocal(IXpsOMBrush* brush);
    HRESULT SetStrokeBrushLocal(IXpsOMBrush brush);
    HRESULT GetStrokeBrushLookup(PWSTR* lookup);
    HRESULT SetStrokeBrushLookup(const(wchar)* lookup);
    HRESULT GetStrokeDashes(IXpsOMDashCollection* strokeDashes);
    HRESULT GetStrokeDashCap(XPS_DASH_CAP* strokeDashCap);
    HRESULT SetStrokeDashCap(XPS_DASH_CAP strokeDashCap);
    HRESULT GetStrokeDashOffset(float* strokeDashOffset);
    HRESULT SetStrokeDashOffset(float strokeDashOffset);
    HRESULT GetStrokeStartLineCap(XPS_LINE_CAP* strokeStartLineCap);
    HRESULT SetStrokeStartLineCap(XPS_LINE_CAP strokeStartLineCap);
    HRESULT GetStrokeEndLineCap(XPS_LINE_CAP* strokeEndLineCap);
    HRESULT SetStrokeEndLineCap(XPS_LINE_CAP strokeEndLineCap);
    HRESULT GetStrokeLineJoin(XPS_LINE_JOIN* strokeLineJoin);
    HRESULT SetStrokeLineJoin(XPS_LINE_JOIN strokeLineJoin);
    HRESULT GetStrokeMiterLimit(float* strokeMiterLimit);
    HRESULT SetStrokeMiterLimit(float strokeMiterLimit);
    HRESULT GetStrokeThickness(float* strokeThickness);
    HRESULT SetStrokeThickness(float strokeThickness);
    HRESULT GetFillBrush(IXpsOMBrush* brush);
    HRESULT GetFillBrushLocal(IXpsOMBrush* brush);
    HRESULT SetFillBrushLocal(IXpsOMBrush brush);
    HRESULT GetFillBrushLookup(PWSTR* lookup);
    HRESULT SetFillBrushLookup(const(wchar)* lookup);
    HRESULT Clone(IXpsOMPath* path);
}
enum IID_IXpsOMBrush = GUID(0x56a3f80c, 0xea4c, 0x4187, [0xa5, 0x7b, 0xa2, 0xa4, 0x73, 0xb2, 0xb4, 0x2b]);
interface IXpsOMBrush : IXpsOMShareable
{
    HRESULT GetOpacity(float* opacity);
    HRESULT SetOpacity(float opacity);
}
enum IID_IXpsOMGradientStopCollection = GUID(0xc9174c3a, 0x3cd3, 0x4319, [0xbd, 0xa4, 0x11, 0xa3, 0x93, 0x92, 0xce, 0xef]);
interface IXpsOMGradientStopCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMGradientStop* stop);
    HRESULT InsertAt(uint index, IXpsOMGradientStop stop);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMGradientStop stop);
    HRESULT Append(IXpsOMGradientStop stop);
}
enum IID_IXpsOMSolidColorBrush = GUID(0xa06f9f05, 0x3be9, 0x4763, [0x98, 0xa8, 0x9, 0x4f, 0xc6, 0x72, 0xe4, 0x88]);
interface IXpsOMSolidColorBrush : IXpsOMBrush
{
    HRESULT GetColor(XPS_COLOR* color, IXpsOMColorProfileResource* colorProfile);
    HRESULT SetColor(const(XPS_COLOR)* color, IXpsOMColorProfileResource colorProfile);
    HRESULT Clone(IXpsOMSolidColorBrush* solidColorBrush);
}
enum IID_IXpsOMTileBrush = GUID(0xfc2328d, 0xd722, 0x4a54, [0xb2, 0xec, 0xbe, 0x90, 0x21, 0x8a, 0x78, 0x9e]);
interface IXpsOMTileBrush : IXpsOMBrush
{
    HRESULT GetTransform(IXpsOMMatrixTransform* transform);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform* transform);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform transform);
    HRESULT GetTransformLookup(PWSTR* key);
    HRESULT SetTransformLookup(const(wchar)* key);
    HRESULT GetViewbox(XPS_RECT* viewbox);
    HRESULT SetViewbox(const(XPS_RECT)* viewbox);
    HRESULT GetViewport(XPS_RECT* viewport);
    HRESULT SetViewport(const(XPS_RECT)* viewport);
    HRESULT GetTileMode(XPS_TILE_MODE* tileMode);
    HRESULT SetTileMode(XPS_TILE_MODE tileMode);
}
enum IID_IXpsOMVisualBrush = GUID(0x97e294af, 0x5b37, 0x46b4, [0x80, 0x57, 0x87, 0x4d, 0x2f, 0x64, 0x11, 0x9b]);
interface IXpsOMVisualBrush : IXpsOMTileBrush
{
    HRESULT GetVisual(IXpsOMVisual* visual);
    HRESULT GetVisualLocal(IXpsOMVisual* visual);
    HRESULT SetVisualLocal(IXpsOMVisual visual);
    HRESULT GetVisualLookup(PWSTR* lookup);
    HRESULT SetVisualLookup(const(wchar)* lookup);
    HRESULT Clone(IXpsOMVisualBrush* visualBrush);
}
enum IID_IXpsOMImageBrush = GUID(0x3df0b466, 0xd382, 0x49ef, [0x85, 0x50, 0xdd, 0x94, 0xc8, 0x2, 0x42, 0xe4]);
interface IXpsOMImageBrush : IXpsOMTileBrush
{
    HRESULT GetImageResource(IXpsOMImageResource* imageResource);
    HRESULT SetImageResource(IXpsOMImageResource imageResource);
    HRESULT GetColorProfileResource(IXpsOMColorProfileResource* colorProfileResource);
    HRESULT SetColorProfileResource(IXpsOMColorProfileResource colorProfileResource);
    HRESULT Clone(IXpsOMImageBrush* imageBrush);
}
enum IID_IXpsOMGradientStop = GUID(0x5cf4f5cc, 0x3969, 0x49b5, [0xa7, 0xa, 0x55, 0x50, 0xb6, 0x18, 0xfe, 0x49]);
interface IXpsOMGradientStop : IUnknown
{
    HRESULT GetOwner(IXpsOMGradientBrush* owner);
    HRESULT GetOffset(float* offset);
    HRESULT SetOffset(float offset);
    HRESULT GetColor(XPS_COLOR* color, IXpsOMColorProfileResource* colorProfile);
    HRESULT SetColor(const(XPS_COLOR)* color, IXpsOMColorProfileResource colorProfile);
    HRESULT Clone(IXpsOMGradientStop* gradientStop);
}
enum IID_IXpsOMGradientBrush = GUID(0xedb59622, 0x61a2, 0x42c3, [0xba, 0xce, 0xac, 0xf2, 0x28, 0x6c, 0x6, 0xbf]);
interface IXpsOMGradientBrush : IXpsOMBrush
{
    HRESULT GetGradientStops(IXpsOMGradientStopCollection* gradientStops);
    HRESULT GetTransform(IXpsOMMatrixTransform* transform);
    HRESULT GetTransformLocal(IXpsOMMatrixTransform* transform);
    HRESULT SetTransformLocal(IXpsOMMatrixTransform transform);
    HRESULT GetTransformLookup(PWSTR* key);
    HRESULT SetTransformLookup(const(wchar)* key);
    HRESULT GetSpreadMethod(XPS_SPREAD_METHOD* spreadMethod);
    HRESULT SetSpreadMethod(XPS_SPREAD_METHOD spreadMethod);
    HRESULT GetColorInterpolationMode(XPS_COLOR_INTERPOLATION* colorInterpolationMode);
    HRESULT SetColorInterpolationMode(XPS_COLOR_INTERPOLATION colorInterpolationMode);
}
enum IID_IXpsOMLinearGradientBrush = GUID(0x5e279f, 0xc30d, 0x40ff, [0x93, 0xec, 0x19, 0x50, 0xd3, 0xc5, 0x28, 0xdb]);
interface IXpsOMLinearGradientBrush : IXpsOMGradientBrush
{
    HRESULT GetStartPoint(XPS_POINT* startPoint);
    HRESULT SetStartPoint(const(XPS_POINT)* startPoint);
    HRESULT GetEndPoint(XPS_POINT* endPoint);
    HRESULT SetEndPoint(const(XPS_POINT)* endPoint);
    HRESULT Clone(IXpsOMLinearGradientBrush* linearGradientBrush);
}
enum IID_IXpsOMRadialGradientBrush = GUID(0x75f207e5, 0x8bf, 0x413c, [0x96, 0xb1, 0xb8, 0x2b, 0x40, 0x64, 0x17, 0x6b]);
interface IXpsOMRadialGradientBrush : IXpsOMGradientBrush
{
    HRESULT GetCenter(XPS_POINT* center);
    HRESULT SetCenter(const(XPS_POINT)* center);
    HRESULT GetRadiiSizes(XPS_SIZE* radiiSizes);
    HRESULT SetRadiiSizes(const(XPS_SIZE)* radiiSizes);
    HRESULT GetGradientOrigin(XPS_POINT* origin);
    HRESULT SetGradientOrigin(const(XPS_POINT)* origin);
    HRESULT Clone(IXpsOMRadialGradientBrush* radialGradientBrush);
}
enum IID_IXpsOMResource = GUID(0xda2ac0a2, 0x73a2, 0x4975, [0xad, 0x14, 0x74, 0x9, 0x7c, 0x3f, 0xf3, 0xa5]);
interface IXpsOMResource : IXpsOMPart
{
}
enum IID_IXpsOMPartResources = GUID(0xf4cf7729, 0x4864, 0x4275, [0x99, 0xb3, 0xa8, 0x71, 0x71, 0x63, 0xec, 0xaf]);
interface IXpsOMPartResources : IUnknown
{
    HRESULT GetFontResources(IXpsOMFontResourceCollection* fontResources);
    HRESULT GetImageResources(IXpsOMImageResourceCollection* imageResources);
    HRESULT GetColorProfileResources(IXpsOMColorProfileResourceCollection* colorProfileResources);
    HRESULT GetRemoteDictionaryResources(IXpsOMRemoteDictionaryResourceCollection* dictionaryResources);
}
enum IID_IXpsOMDictionary = GUID(0x897c86b8, 0x8eaf, 0x4ae3, [0xbd, 0xde, 0x56, 0x41, 0x9f, 0xcf, 0x42, 0x36]);
interface IXpsOMDictionary : IUnknown
{
    HRESULT GetOwner(IUnknown* owner);
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, PWSTR* key, IXpsOMShareable* entry);
    HRESULT GetByKey(const(wchar)* key, IXpsOMShareable beforeEntry, IXpsOMShareable* entry);
    HRESULT GetIndex(IXpsOMShareable entry, uint* index);
    HRESULT Append(const(wchar)* key, IXpsOMShareable entry);
    HRESULT InsertAt(uint index, const(wchar)* key, IXpsOMShareable entry);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, const(wchar)* key, IXpsOMShareable entry);
    HRESULT Clone(IXpsOMDictionary* dictionary);
}
enum IID_IXpsOMFontResource = GUID(0xa8c45708, 0x47d9, 0x4af4, [0x8d, 0x20, 0x33, 0xb4, 0x8c, 0x9b, 0x84, 0x85]);
interface IXpsOMFontResource : IXpsOMResource
{
    HRESULT GetStream(IStream* readerStream);
    HRESULT SetContent(IStream sourceStream, XPS_FONT_EMBEDDING embeddingOption, IOpcPartUri partName);
    HRESULT GetEmbeddingOption(XPS_FONT_EMBEDDING* embeddingOption);
}
enum IID_IXpsOMFontResourceCollection = GUID(0x70b4a6bb, 0x88d4, 0x4fa8, [0xaa, 0xf9, 0x6d, 0x9c, 0x59, 0x6f, 0xdb, 0xad]);
interface IXpsOMFontResourceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMFontResource* value);
    HRESULT SetAt(uint index, IXpsOMFontResource value);
    HRESULT InsertAt(uint index, IXpsOMFontResource value);
    HRESULT Append(IXpsOMFontResource value);
    HRESULT RemoveAt(uint index);
    HRESULT GetByPartName(IOpcPartUri partName, IXpsOMFontResource* part);
}
enum IID_IXpsOMImageResource = GUID(0x3db8417d, 0xae50, 0x485e, [0x9a, 0x44, 0xd7, 0x75, 0x8f, 0x78, 0xa2, 0x3f]);
interface IXpsOMImageResource : IXpsOMResource
{
    HRESULT GetStream(IStream* readerStream);
    HRESULT SetContent(IStream sourceStream, XPS_IMAGE_TYPE imageType, IOpcPartUri partName);
    HRESULT GetImageType(XPS_IMAGE_TYPE* imageType);
}
enum IID_IXpsOMImageResourceCollection = GUID(0x7a4a1a71, 0x9cde, 0x4b71, [0xb3, 0x3f, 0x62, 0xde, 0x84, 0x3e, 0xab, 0xfe]);
interface IXpsOMImageResourceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMImageResource* object);
    HRESULT InsertAt(uint index, IXpsOMImageResource object);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMImageResource object);
    HRESULT Append(IXpsOMImageResource object);
    HRESULT GetByPartName(IOpcPartUri partName, IXpsOMImageResource* part);
}
enum IID_IXpsOMColorProfileResource = GUID(0x67bd7d69, 0x1eef, 0x4bb1, [0xb5, 0xe7, 0x6f, 0x4f, 0x87, 0xbe, 0x8a, 0xbe]);
interface IXpsOMColorProfileResource : IXpsOMResource
{
    HRESULT GetStream(IStream* stream);
    HRESULT SetContent(IStream sourceStream, IOpcPartUri partName);
}
enum IID_IXpsOMColorProfileResourceCollection = GUID(0x12759630, 0x5fba, 0x4283, [0x8f, 0x7d, 0xcc, 0xa8, 0x49, 0x80, 0x9e, 0xdb]);
interface IXpsOMColorProfileResourceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMColorProfileResource* object);
    HRESULT InsertAt(uint index, IXpsOMColorProfileResource object);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMColorProfileResource object);
    HRESULT Append(IXpsOMColorProfileResource object);
    HRESULT GetByPartName(IOpcPartUri partName, IXpsOMColorProfileResource* part);
}
enum IID_IXpsOMPrintTicketResource = GUID(0xe7ff32d2, 0x34aa, 0x499b, [0xbb, 0xe9, 0x9c, 0xd4, 0xee, 0x6c, 0x59, 0xf7]);
interface IXpsOMPrintTicketResource : IXpsOMResource
{
    HRESULT GetStream(IStream* stream);
    HRESULT SetContent(IStream sourceStream, IOpcPartUri partName);
}
enum IID_IXpsOMRemoteDictionaryResource = GUID(0xc9bd7cd4, 0xe16a, 0x4bf8, [0x8c, 0x84, 0xc9, 0x50, 0xaf, 0x7a, 0x30, 0x61]);
interface IXpsOMRemoteDictionaryResource : IXpsOMResource
{
    HRESULT GetDictionary(IXpsOMDictionary* dictionary);
    HRESULT SetDictionary(IXpsOMDictionary dictionary);
}
enum IID_IXpsOMRemoteDictionaryResourceCollection = GUID(0x5c38db61, 0x7fec, 0x464a, [0x87, 0xbd, 0x41, 0xe3, 0xbe, 0xf0, 0x18, 0xbe]);
interface IXpsOMRemoteDictionaryResourceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMRemoteDictionaryResource* object);
    HRESULT InsertAt(uint index, IXpsOMRemoteDictionaryResource object);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMRemoteDictionaryResource object);
    HRESULT Append(IXpsOMRemoteDictionaryResource object);
    HRESULT GetByPartName(IOpcPartUri partName, IXpsOMRemoteDictionaryResource* remoteDictionaryResource);
}
enum IID_IXpsOMSignatureBlockResourceCollection = GUID(0xab8f5d8e, 0x351b, 0x4d33, [0xaa, 0xed, 0xfa, 0x56, 0xf0, 0x2, 0x29, 0x31]);
interface IXpsOMSignatureBlockResourceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMSignatureBlockResource* signatureBlockResource);
    HRESULT InsertAt(uint index, IXpsOMSignatureBlockResource signatureBlockResource);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMSignatureBlockResource signatureBlockResource);
    HRESULT Append(IXpsOMSignatureBlockResource signatureBlockResource);
    HRESULT GetByPartName(IOpcPartUri partName, IXpsOMSignatureBlockResource* signatureBlockResource);
}
enum IID_IXpsOMDocumentStructureResource = GUID(0x85febc8a, 0x6b63, 0x48a9, [0xaf, 0x7, 0x70, 0x64, 0xe4, 0xec, 0xff, 0x30]);
interface IXpsOMDocumentStructureResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMDocument* owner);
    HRESULT GetStream(IStream* stream);
    HRESULT SetContent(IStream sourceStream, IOpcPartUri partName);
}
enum IID_IXpsOMStoryFragmentsResource = GUID(0xc2b3ca09, 0x473, 0x4282, [0x87, 0xae, 0x17, 0x80, 0x86, 0x32, 0x23, 0xf0]);
interface IXpsOMStoryFragmentsResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMPageReference* owner);
    HRESULT GetStream(IStream* stream);
    HRESULT SetContent(IStream sourceStream, IOpcPartUri partName);
}
enum IID_IXpsOMSignatureBlockResource = GUID(0x4776ad35, 0x2e04, 0x4357, [0x87, 0x43, 0xeb, 0xf6, 0xc1, 0x71, 0xa9, 0x5]);
interface IXpsOMSignatureBlockResource : IXpsOMResource
{
    HRESULT GetOwner(IXpsOMDocument* owner);
    HRESULT GetStream(IStream* stream);
    HRESULT SetContent(IStream sourceStream, IOpcPartUri partName);
}
enum IID_IXpsOMVisualCollection = GUID(0x94d8abde, 0xab91, 0x46a8, [0x82, 0xb7, 0xf5, 0xb0, 0x5e, 0xf0, 0x1a, 0x96]);
interface IXpsOMVisualCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMVisual* object);
    HRESULT InsertAt(uint index, IXpsOMVisual object);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMVisual object);
    HRESULT Append(IXpsOMVisual object);
}
enum IID_IXpsOMCanvas = GUID(0x221d1452, 0x331e, 0x47c6, [0x87, 0xe9, 0x6c, 0xce, 0xfb, 0x9b, 0x5b, 0xa3]);
interface IXpsOMCanvas : IXpsOMVisual
{
    HRESULT GetVisuals(IXpsOMVisualCollection* visuals);
    HRESULT GetUseAliasedEdgeMode(BOOL* useAliasedEdgeMode);
    HRESULT SetUseAliasedEdgeMode(BOOL useAliasedEdgeMode);
    HRESULT GetAccessibilityShortDescription(PWSTR* shortDescription);
    HRESULT SetAccessibilityShortDescription(const(wchar)* shortDescription);
    HRESULT GetAccessibilityLongDescription(PWSTR* longDescription);
    HRESULT SetAccessibilityLongDescription(const(wchar)* longDescription);
    HRESULT GetDictionary(IXpsOMDictionary* resourceDictionary);
    HRESULT GetDictionaryLocal(IXpsOMDictionary* resourceDictionary);
    HRESULT SetDictionaryLocal(IXpsOMDictionary resourceDictionary);
    HRESULT GetDictionaryResource(IXpsOMRemoteDictionaryResource* remoteDictionaryResource);
    HRESULT SetDictionaryResource(IXpsOMRemoteDictionaryResource remoteDictionaryResource);
    HRESULT Clone(IXpsOMCanvas* canvas);
}
enum IID_IXpsOMPage = GUID(0xd3e18888, 0xf120, 0x4fee, [0x8c, 0x68, 0x35, 0x29, 0x6e, 0xae, 0x91, 0xd4]);
interface IXpsOMPage : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPageReference* pageReference);
    HRESULT GetVisuals(IXpsOMVisualCollection* visuals);
    HRESULT GetPageDimensions(XPS_SIZE* pageDimensions);
    HRESULT SetPageDimensions(const(XPS_SIZE)* pageDimensions);
    HRESULT GetContentBox(XPS_RECT* contentBox);
    HRESULT SetContentBox(const(XPS_RECT)* contentBox);
    HRESULT GetBleedBox(XPS_RECT* bleedBox);
    HRESULT SetBleedBox(const(XPS_RECT)* bleedBox);
    HRESULT GetLanguage(PWSTR* language);
    HRESULT SetLanguage(const(wchar)* language);
    HRESULT GetName(PWSTR* name);
    HRESULT SetName(const(wchar)* name);
    HRESULT GetIsHyperlinkTarget(BOOL* isHyperlinkTarget);
    HRESULT SetIsHyperlinkTarget(BOOL isHyperlinkTarget);
    HRESULT GetDictionary(IXpsOMDictionary* resourceDictionary);
    HRESULT GetDictionaryLocal(IXpsOMDictionary* resourceDictionary);
    HRESULT SetDictionaryLocal(IXpsOMDictionary resourceDictionary);
    HRESULT GetDictionaryResource(IXpsOMRemoteDictionaryResource* remoteDictionaryResource);
    HRESULT SetDictionaryResource(IXpsOMRemoteDictionaryResource remoteDictionaryResource);
    HRESULT Write(ISequentialStream stream, BOOL optimizeMarkupSize);
    HRESULT GenerateUnusedLookupKey(XPS_OBJECT_TYPE type, PWSTR* key);
    HRESULT Clone(IXpsOMPage* page);
}
enum IID_IXpsOMPageReference = GUID(0xed360180, 0x6f92, 0x4998, [0x89, 0xd, 0x2f, 0x20, 0x85, 0x31, 0xa0, 0xa0]);
interface IXpsOMPageReference : IUnknown
{
    HRESULT GetOwner(IXpsOMDocument* document);
    HRESULT GetPage(IXpsOMPage* page);
    HRESULT SetPage(IXpsOMPage page);
    HRESULT DiscardPage();
    HRESULT IsPageLoaded(BOOL* isPageLoaded);
    HRESULT GetAdvisoryPageDimensions(XPS_SIZE* pageDimensions);
    HRESULT SetAdvisoryPageDimensions(const(XPS_SIZE)* pageDimensions);
    HRESULT GetStoryFragmentsResource(IXpsOMStoryFragmentsResource* storyFragmentsResource);
    HRESULT SetStoryFragmentsResource(IXpsOMStoryFragmentsResource storyFragmentsResource);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource* printTicketResource);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource printTicketResource);
    HRESULT GetThumbnailResource(IXpsOMImageResource* imageResource);
    HRESULT SetThumbnailResource(IXpsOMImageResource imageResource);
    HRESULT CollectLinkTargets(IXpsOMNameCollection* linkTargets);
    HRESULT CollectPartResources(IXpsOMPartResources* partResources);
    HRESULT HasRestrictedFonts(BOOL* restrictedFonts);
    HRESULT Clone(IXpsOMPageReference* pageReference);
}
enum IID_IXpsOMPageReferenceCollection = GUID(0xca16ba4d, 0xe7b9, 0x45c5, [0x95, 0x8b, 0xf9, 0x80, 0x22, 0x47, 0x37, 0x45]);
interface IXpsOMPageReferenceCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMPageReference* pageReference);
    HRESULT InsertAt(uint index, IXpsOMPageReference pageReference);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMPageReference pageReference);
    HRESULT Append(IXpsOMPageReference pageReference);
}
enum IID_IXpsOMDocument = GUID(0x2c2c94cb, 0xac5f, 0x4254, [0x8e, 0xe9, 0x23, 0x94, 0x83, 0x9, 0xd9, 0xf0]);
interface IXpsOMDocument : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMDocumentSequence* documentSequence);
    HRESULT GetPageReferences(IXpsOMPageReferenceCollection* pageReferences);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource* printTicketResource);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource printTicketResource);
    HRESULT GetDocumentStructureResource(IXpsOMDocumentStructureResource* documentStructureResource);
    HRESULT SetDocumentStructureResource(IXpsOMDocumentStructureResource documentStructureResource);
    HRESULT GetSignatureBlockResources(IXpsOMSignatureBlockResourceCollection* signatureBlockResources);
    HRESULT Clone(IXpsOMDocument* document);
}
enum IID_IXpsOMDocumentCollection = GUID(0xd1c87f0d, 0xe947, 0x4754, [0x8a, 0x25, 0x97, 0x14, 0x78, 0xf7, 0xe8, 0x3e]);
interface IXpsOMDocumentCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsOMDocument* document);
    HRESULT InsertAt(uint index, IXpsOMDocument document);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IXpsOMDocument document);
    HRESULT Append(IXpsOMDocument document);
}
enum IID_IXpsOMDocumentSequence = GUID(0x56492eb4, 0xd8d5, 0x425e, [0x82, 0x56, 0x4c, 0x2b, 0x64, 0xad, 0x2, 0x64]);
interface IXpsOMDocumentSequence : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPackage* package_);
    HRESULT GetDocuments(IXpsOMDocumentCollection* documents);
    HRESULT GetPrintTicketResource(IXpsOMPrintTicketResource* printTicketResource);
    HRESULT SetPrintTicketResource(IXpsOMPrintTicketResource printTicketResource);
}
enum IID_IXpsOMCoreProperties = GUID(0x3340fe8f, 0x4027, 0x4aa1, [0x8f, 0x5f, 0xd3, 0x5a, 0xe4, 0x5f, 0xe5, 0x97]);
interface IXpsOMCoreProperties : IXpsOMPart
{
    HRESULT GetOwner(IXpsOMPackage* package_);
    HRESULT GetCategory(PWSTR* category);
    HRESULT SetCategory(const(wchar)* category);
    HRESULT GetContentStatus(PWSTR* contentStatus);
    HRESULT SetContentStatus(const(wchar)* contentStatus);
    HRESULT GetContentType(PWSTR* contentType);
    HRESULT SetContentType(const(wchar)* contentType);
    HRESULT GetCreated(SYSTEMTIME* created);
    HRESULT SetCreated(const(SYSTEMTIME)* created);
    HRESULT GetCreator(PWSTR* creator);
    HRESULT SetCreator(const(wchar)* creator);
    HRESULT GetDescription(PWSTR* description);
    HRESULT SetDescription(const(wchar)* description);
    HRESULT GetIdentifier(PWSTR* identifier);
    HRESULT SetIdentifier(const(wchar)* identifier);
    HRESULT GetKeywords(PWSTR* keywords);
    HRESULT SetKeywords(const(wchar)* keywords);
    HRESULT GetLanguage(PWSTR* language);
    HRESULT SetLanguage(const(wchar)* language);
    HRESULT GetLastModifiedBy(PWSTR* lastModifiedBy);
    HRESULT SetLastModifiedBy(const(wchar)* lastModifiedBy);
    HRESULT GetLastPrinted(SYSTEMTIME* lastPrinted);
    HRESULT SetLastPrinted(const(SYSTEMTIME)* lastPrinted);
    HRESULT GetModified(SYSTEMTIME* modified);
    HRESULT SetModified(const(SYSTEMTIME)* modified);
    HRESULT GetRevision(PWSTR* revision);
    HRESULT SetRevision(const(wchar)* revision);
    HRESULT GetSubject(PWSTR* subject);
    HRESULT SetSubject(const(wchar)* subject);
    HRESULT GetTitle(PWSTR* title);
    HRESULT SetTitle(const(wchar)* title);
    HRESULT GetVersion(PWSTR* version_);
    HRESULT SetVersion(const(wchar)* version_);
    HRESULT Clone(IXpsOMCoreProperties* coreProperties);
}
enum IID_IXpsOMPackage = GUID(0x18c3df65, 0x81e1, 0x4674, [0x91, 0xdc, 0xfc, 0x45, 0x2f, 0x5a, 0x41, 0x6f]);
interface IXpsOMPackage : IUnknown
{
    HRESULT GetDocumentSequence(IXpsOMDocumentSequence* documentSequence);
    HRESULT SetDocumentSequence(IXpsOMDocumentSequence documentSequence);
    HRESULT GetCoreProperties(IXpsOMCoreProperties* coreProperties);
    HRESULT SetCoreProperties(IXpsOMCoreProperties coreProperties);
    HRESULT GetDiscardControlPartName(IOpcPartUri* discardControlPartUri);
    HRESULT SetDiscardControlPartName(IOpcPartUri discardControlPartUri);
    HRESULT GetThumbnailResource(IXpsOMImageResource* imageResource);
    HRESULT SetThumbnailResource(IXpsOMImageResource imageResource);
    HRESULT WriteToFile(const(wchar)* fileName, SECURITY_ATTRIBUTES* securityAttributes, uint flagsAndAttributes, BOOL optimizeMarkupSize);
    HRESULT WriteToStream(ISequentialStream stream, BOOL optimizeMarkupSize);
}
enum IID_IXpsOMObjectFactory = GUID(0xf9b2a685, 0xa50d, 0x4fc2, [0xb7, 0x64, 0xb5, 0x6e, 0x9, 0x3e, 0xa0, 0xca]);
interface IXpsOMObjectFactory : IUnknown
{
    HRESULT CreatePackage(IXpsOMPackage* package_);
    HRESULT CreatePackageFromFile(const(wchar)* filename, BOOL reuseObjects, IXpsOMPackage* package_);
    HRESULT CreatePackageFromStream(IStream stream, BOOL reuseObjects, IXpsOMPackage* package_);
    HRESULT CreateStoryFragmentsResource(IStream acquiredStream, IOpcPartUri partUri, IXpsOMStoryFragmentsResource* storyFragmentsResource);
    HRESULT CreateDocumentStructureResource(IStream acquiredStream, IOpcPartUri partUri, IXpsOMDocumentStructureResource* documentStructureResource);
    HRESULT CreateSignatureBlockResource(IStream acquiredStream, IOpcPartUri partUri, IXpsOMSignatureBlockResource* signatureBlockResource);
    HRESULT CreateRemoteDictionaryResource(IXpsOMDictionary dictionary, IOpcPartUri partUri, IXpsOMRemoteDictionaryResource* remoteDictionaryResource);
    HRESULT CreateRemoteDictionaryResourceFromStream(IStream dictionaryMarkupStream, IOpcPartUri dictionaryPartUri, IXpsOMPartResources resources, IXpsOMRemoteDictionaryResource* dictionaryResource);
    HRESULT CreatePartResources(IXpsOMPartResources* partResources);
    HRESULT CreateDocumentSequence(IOpcPartUri partUri, IXpsOMDocumentSequence* documentSequence);
    HRESULT CreateDocument(IOpcPartUri partUri, IXpsOMDocument* document);
    HRESULT CreatePageReference(const(XPS_SIZE)* advisoryPageDimensions, IXpsOMPageReference* pageReference);
    HRESULT CreatePage(const(XPS_SIZE)* pageDimensions, const(wchar)* language, IOpcPartUri partUri, IXpsOMPage* page);
    HRESULT CreatePageFromStream(IStream pageMarkupStream, IOpcPartUri partUri, IXpsOMPartResources resources, BOOL reuseObjects, IXpsOMPage* page);
    HRESULT CreateCanvas(IXpsOMCanvas* canvas);
    HRESULT CreateGlyphs(IXpsOMFontResource fontResource, IXpsOMGlyphs* glyphs);
    HRESULT CreatePath(IXpsOMPath* path);
    HRESULT CreateGeometry(IXpsOMGeometry* geometry);
    HRESULT CreateGeometryFigure(const(XPS_POINT)* startPoint, IXpsOMGeometryFigure* figure);
    HRESULT CreateMatrixTransform(const(XPS_MATRIX)* matrix, IXpsOMMatrixTransform* transform);
    HRESULT CreateSolidColorBrush(const(XPS_COLOR)* color, IXpsOMColorProfileResource colorProfile, IXpsOMSolidColorBrush* solidColorBrush);
    HRESULT CreateColorProfileResource(IStream acquiredStream, IOpcPartUri partUri, IXpsOMColorProfileResource* colorProfileResource);
    HRESULT CreateImageBrush(IXpsOMImageResource image, const(XPS_RECT)* viewBox, const(XPS_RECT)* viewPort, IXpsOMImageBrush* imageBrush);
    HRESULT CreateVisualBrush(const(XPS_RECT)* viewBox, const(XPS_RECT)* viewPort, IXpsOMVisualBrush* visualBrush);
    HRESULT CreateImageResource(IStream acquiredStream, XPS_IMAGE_TYPE contentType, IOpcPartUri partUri, IXpsOMImageResource* imageResource);
    HRESULT CreatePrintTicketResource(IStream acquiredStream, IOpcPartUri partUri, IXpsOMPrintTicketResource* printTicketResource);
    HRESULT CreateFontResource(IStream acquiredStream, XPS_FONT_EMBEDDING fontEmbedding, IOpcPartUri partUri, BOOL isObfSourceStream, IXpsOMFontResource* fontResource);
    HRESULT CreateGradientStop(const(XPS_COLOR)* color, IXpsOMColorProfileResource colorProfile, float offset, IXpsOMGradientStop* gradientStop);
    HRESULT CreateLinearGradientBrush(IXpsOMGradientStop gradStop1, IXpsOMGradientStop gradStop2, const(XPS_POINT)* startPoint, const(XPS_POINT)* endPoint, IXpsOMLinearGradientBrush* linearGradientBrush);
    HRESULT CreateRadialGradientBrush(IXpsOMGradientStop gradStop1, IXpsOMGradientStop gradStop2, const(XPS_POINT)* centerPoint, const(XPS_POINT)* gradientOrigin, const(XPS_SIZE)* radiiSizes, IXpsOMRadialGradientBrush* radialGradientBrush);
    HRESULT CreateCoreProperties(IOpcPartUri partUri, IXpsOMCoreProperties* coreProperties);
    HRESULT CreateDictionary(IXpsOMDictionary* dictionary);
    HRESULT CreatePartUriCollection(IXpsOMPartUriCollection* partUriCollection);
    HRESULT CreatePackageWriterOnFile(const(wchar)* fileName, SECURITY_ATTRIBUTES* securityAttributes, uint flagsAndAttributes, BOOL optimizeMarkupSize, XPS_INTERLEAVING interleaving, IOpcPartUri documentSequencePartName, IXpsOMCoreProperties coreProperties, IXpsOMImageResource packageThumbnail, IXpsOMPrintTicketResource documentSequencePrintTicket, IOpcPartUri discardControlPartName, IXpsOMPackageWriter* packageWriter);
    HRESULT CreatePackageWriterOnStream(ISequentialStream outputStream, BOOL optimizeMarkupSize, XPS_INTERLEAVING interleaving, IOpcPartUri documentSequencePartName, IXpsOMCoreProperties coreProperties, IXpsOMImageResource packageThumbnail, IXpsOMPrintTicketResource documentSequencePrintTicket, IOpcPartUri discardControlPartName, IXpsOMPackageWriter* packageWriter);
    HRESULT CreatePartUri(const(wchar)* uri, IOpcPartUri* partUri);
    HRESULT CreateReadOnlyStreamOnFile(const(wchar)* filename, IStream* stream);
}
enum IID_IXpsOMNameCollection = GUID(0x4bddf8ec, 0xc915, 0x421b, [0xa1, 0x66, 0xd1, 0x73, 0xd2, 0x56, 0x53, 0xd2]);
interface IXpsOMNameCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, PWSTR* name);
}
enum IID_IXpsOMPartUriCollection = GUID(0x57c650d4, 0x67c, 0x4893, [0x8c, 0x33, 0xf6, 0x2a, 0x6, 0x33, 0x73, 0xf]);
interface IXpsOMPartUriCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IOpcPartUri* partUri);
    HRESULT InsertAt(uint index, IOpcPartUri partUri);
    HRESULT RemoveAt(uint index);
    HRESULT SetAt(uint index, IOpcPartUri partUri);
    HRESULT Append(IOpcPartUri partUri);
}
enum IID_IXpsOMPackageWriter = GUID(0x4e2aa182, 0xa443, 0x42c6, [0xb4, 0x1b, 0x4f, 0x8e, 0x9d, 0xe7, 0x3f, 0xf9]);
interface IXpsOMPackageWriter : IUnknown
{
    HRESULT StartNewDocument(IOpcPartUri documentPartName, IXpsOMPrintTicketResource documentPrintTicket, IXpsOMDocumentStructureResource documentStructure, IXpsOMSignatureBlockResourceCollection signatureBlockResources, IXpsOMPartUriCollection restrictedFonts);
    HRESULT AddPage(IXpsOMPage page, const(XPS_SIZE)* advisoryPageDimensions, IXpsOMPartUriCollection discardableResourceParts, IXpsOMStoryFragmentsResource storyFragments, IXpsOMPrintTicketResource pagePrintTicket, IXpsOMImageResource pageThumbnail);
    HRESULT AddResource(IXpsOMResource resource);
    HRESULT Close();
    HRESULT IsClosed(BOOL* isClosed);
}
enum IID_IXpsOMPackageTarget = GUID(0x219a9db0, 0x4959, 0x47d0, [0x80, 0x34, 0xb1, 0xce, 0x84, 0xf4, 0x1a, 0x4d]);
interface IXpsOMPackageTarget : IUnknown
{
    HRESULT CreateXpsOMPackageWriter(IOpcPartUri documentSequencePartName, IXpsOMPrintTicketResource documentSequencePrintTicket, IOpcPartUri discardControlPartName, IXpsOMPackageWriter* packageWriter);
}
enum IID_IXpsOMThumbnailGenerator = GUID(0x15b873d5, 0x1971, 0x41e8, [0x83, 0xa3, 0x65, 0x78, 0x40, 0x30, 0x64, 0xc7]);
interface IXpsOMThumbnailGenerator : IUnknown
{
    HRESULT GenerateThumbnail(IXpsOMPage page, XPS_IMAGE_TYPE thumbnailType, XPS_THUMBNAIL_SIZE thumbnailSize, IOpcPartUri imageResourcePartName, IXpsOMImageResource* imageResource);
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
    HRESULT GetDocumentTypeFromFile(const(wchar)* filename, XPS_DOCUMENT_TYPE* documentType);
    HRESULT GetDocumentTypeFromStream(IStream xpsDocumentStream, XPS_DOCUMENT_TYPE* documentType);
    HRESULT ConvertHDPhotoToJpegXR(IXpsOMImageResource imageResource);
    HRESULT ConvertJpegXRToHDPhoto(IXpsOMImageResource imageResource);
    HRESULT CreatePackageWriterOnFile1(const(wchar)* fileName, SECURITY_ATTRIBUTES* securityAttributes, uint flagsAndAttributes, BOOL optimizeMarkupSize, XPS_INTERLEAVING interleaving, IOpcPartUri documentSequencePartName, IXpsOMCoreProperties coreProperties, IXpsOMImageResource packageThumbnail, IXpsOMPrintTicketResource documentSequencePrintTicket, IOpcPartUri discardControlPartName, XPS_DOCUMENT_TYPE documentType, IXpsOMPackageWriter* packageWriter);
    HRESULT CreatePackageWriterOnStream1(ISequentialStream outputStream, BOOL optimizeMarkupSize, XPS_INTERLEAVING interleaving, IOpcPartUri documentSequencePartName, IXpsOMCoreProperties coreProperties, IXpsOMImageResource packageThumbnail, IXpsOMPrintTicketResource documentSequencePrintTicket, IOpcPartUri discardControlPartName, XPS_DOCUMENT_TYPE documentType, IXpsOMPackageWriter* packageWriter);
    HRESULT CreatePackage1(IXpsOMPackage1* package_);
    HRESULT CreatePackageFromStream1(IStream stream, BOOL reuseObjects, IXpsOMPackage1* package_);
    HRESULT CreatePackageFromFile1(const(wchar)* filename, BOOL reuseObjects, IXpsOMPackage1* package_);
    HRESULT CreatePage1(const(XPS_SIZE)* pageDimensions, const(wchar)* language, IOpcPartUri partUri, IXpsOMPage1* page);
    HRESULT CreatePageFromStream1(IStream pageMarkupStream, IOpcPartUri partUri, IXpsOMPartResources resources, BOOL reuseObjects, IXpsOMPage1* page);
    HRESULT CreateRemoteDictionaryResourceFromStream1(IStream dictionaryMarkupStream, IOpcPartUri partUri, IXpsOMPartResources resources, IXpsOMRemoteDictionaryResource* dictionaryResource);
}
enum IID_IXpsOMPackage1 = GUID(0x95a9435e, 0x12bb, 0x461b, [0x8e, 0x7f, 0xc6, 0xad, 0xb0, 0x4c, 0xd9, 0x6a]);
interface IXpsOMPackage1 : IXpsOMPackage
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE* documentType);
    HRESULT WriteToFile1(const(wchar)* fileName, SECURITY_ATTRIBUTES* securityAttributes, uint flagsAndAttributes, BOOL optimizeMarkupSize, XPS_DOCUMENT_TYPE documentType);
    HRESULT WriteToStream1(ISequentialStream outputStream, BOOL optimizeMarkupSize, XPS_DOCUMENT_TYPE documentType);
}
enum IID_IXpsOMPage1 = GUID(0x305b60ef, 0x6892, 0x4dda, [0x9c, 0xbb, 0x3a, 0xa6, 0x59, 0x74, 0x50, 0x8a]);
interface IXpsOMPage1 : IXpsOMPage
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE* documentType);
    HRESULT Write1(ISequentialStream stream, BOOL optimizeMarkupSize, XPS_DOCUMENT_TYPE documentType);
}
enum IID_IXpsDocumentPackageTarget = GUID(0x3b0b6d38, 0x53ad, 0x41da, [0xb2, 0x12, 0xd3, 0x76, 0x37, 0xa6, 0x71, 0x4e]);
interface IXpsDocumentPackageTarget : IUnknown
{
    HRESULT GetXpsOMPackageWriter(IOpcPartUri documentSequencePartName, IOpcPartUri discardControlPartName, IXpsOMPackageWriter* packageWriter);
    HRESULT GetXpsOMFactory(IXpsOMObjectFactory* xpsFactory);
    HRESULT GetXpsType(XPS_DOCUMENT_TYPE* documentType);
}
enum IID_IXpsOMRemoteDictionaryResource1 = GUID(0xbf8fc1d4, 0x9d46, 0x4141, [0xba, 0x5f, 0x94, 0xbb, 0x92, 0x50, 0xd0, 0x41]);
interface IXpsOMRemoteDictionaryResource1 : IXpsOMRemoteDictionaryResource
{
    HRESULT GetDocumentType(XPS_DOCUMENT_TYPE* documentType);
    HRESULT Write1(ISequentialStream stream, XPS_DOCUMENT_TYPE documentType);
}
enum IID_IXpsOMPackageWriter3D = GUID(0xe8a45033, 0x640e, 0x43fa, [0x9b, 0xdf, 0xfd, 0xde, 0xaa, 0x31, 0xc6, 0xa0]);
interface IXpsOMPackageWriter3D : IXpsOMPackageWriter
{
    HRESULT AddModelTexture(IOpcPartUri texturePartName, IStream textureData);
    HRESULT SetModelPrintTicket(IOpcPartUri printTicketPartName, IStream printTicketData);
}
enum IID_IXpsDocumentPackageTarget3D = GUID(0x60ba71b8, 0x3101, 0x4984, [0x91, 0x99, 0xf4, 0xea, 0x77, 0x5f, 0xf0, 0x1d]);
interface IXpsDocumentPackageTarget3D : IUnknown
{
    HRESULT GetXpsOMPackageWriter3D(IOpcPartUri documentSequencePartName, IOpcPartUri discardControlPartName, IOpcPartUri modelPartName, IStream modelData, IXpsOMPackageWriter3D* packageWriter);
    HRESULT GetXpsOMFactory(IXpsOMObjectFactory* xpsFactory);
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
    HRESULT GetSignatureId(PWSTR* signatureId);
    HRESULT SetSignatureId(const(wchar)* signatureId);
    HRESULT GetSignatureMethod(PWSTR* signatureMethod);
    HRESULT SetSignatureMethod(const(wchar)* signatureMethod);
    HRESULT GetDigestMethod(PWSTR* digestMethod);
    HRESULT SetDigestMethod(const(wchar)* digestMethod);
    HRESULT GetSignaturePartName(IOpcPartUri* signaturePartName);
    HRESULT SetSignaturePartName(IOpcPartUri signaturePartName);
    HRESULT GetPolicy(XPS_SIGN_POLICY* policy);
    HRESULT SetPolicy(XPS_SIGN_POLICY policy);
    HRESULT GetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT* timeFormat);
    HRESULT SetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT timeFormat);
    HRESULT GetCustomObjects(IOpcSignatureCustomObjectSet* customObjectSet);
    HRESULT GetCustomReferences(IOpcSignatureReferenceSet* customReferenceSet);
    HRESULT GetCertificateSet(IOpcCertificateSet* certificateSet);
    HRESULT GetFlags(XPS_SIGN_FLAGS* flags);
    HRESULT SetFlags(XPS_SIGN_FLAGS flags);
}
enum IID_IXpsSignatureCollection = GUID(0xa2d1d95d, 0xadd2, 0x4dff, [0xab, 0x27, 0x6b, 0x9c, 0x64, 0x5f, 0xf3, 0x22]);
interface IXpsSignatureCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsSignature* signature);
    HRESULT RemoveAt(uint index);
}
enum IID_IXpsSignature = GUID(0x6ae4c93e, 0x1ade, 0x42fb, [0x89, 0x8b, 0x3a, 0x56, 0x58, 0x28, 0x48, 0x57]);
interface IXpsSignature : IUnknown
{
    HRESULT GetSignatureId(PWSTR* sigId);
    HRESULT GetSignatureValue(ubyte** signatureHashValue, uint* count);
    HRESULT GetCertificateEnumerator(IOpcCertificateEnumerator* certificateEnumerator);
    HRESULT GetSigningTime(PWSTR* sigDateTimeString);
    HRESULT GetSigningTimeFormat(OPC_SIGNATURE_TIME_FORMAT* timeFormat);
    HRESULT GetSignaturePartName(IOpcPartUri* signaturePartName);
    HRESULT Verify(const(CERT_CONTEXT)* x509Certificate, XPS_SIGNATURE_STATUS* sigStatus);
    HRESULT GetPolicy(XPS_SIGN_POLICY* policy);
    HRESULT GetCustomObjectEnumerator(IOpcSignatureCustomObjectEnumerator* customObjectEnumerator);
    HRESULT GetCustomReferenceEnumerator(IOpcSignatureReferenceEnumerator* customReferenceEnumerator);
    HRESULT GetSignatureXml(ubyte** signatureXml, uint* count);
    HRESULT SetSignatureXml(const(ubyte)* signatureXml, uint count);
}
enum IID_IXpsSignatureBlockCollection = GUID(0x23397050, 0xfe99, 0x467a, [0x8d, 0xce, 0x92, 0x37, 0xf0, 0x74, 0xff, 0xe4]);
interface IXpsSignatureBlockCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsSignatureBlock* signatureBlock);
    HRESULT RemoveAt(uint index);
}
enum IID_IXpsSignatureBlock = GUID(0x151fac09, 0xb97, 0x4ac6, [0xa3, 0x23, 0x5e, 0x42, 0x97, 0xd4, 0x32, 0x2b]);
interface IXpsSignatureBlock : IUnknown
{
    HRESULT GetRequests(IXpsSignatureRequestCollection* requests);
    HRESULT GetPartName(IOpcPartUri* partName);
    HRESULT GetDocumentIndex(uint* fixedDocumentIndex);
    HRESULT GetDocumentName(IOpcPartUri* fixedDocumentName);
    HRESULT CreateRequest(const(wchar)* requestId, IXpsSignatureRequest* signatureRequest);
}
enum IID_IXpsSignatureRequestCollection = GUID(0xf0253e68, 0x9f19, 0x412e, [0x9b, 0x4f, 0x54, 0xd3, 0xb0, 0xac, 0x6c, 0xd9]);
interface IXpsSignatureRequestCollection : IUnknown
{
    HRESULT GetCount(uint* count);
    HRESULT GetAt(uint index, IXpsSignatureRequest* signatureRequest);
    HRESULT RemoveAt(uint index);
}
enum IID_IXpsSignatureRequest = GUID(0xac58950b, 0x7208, 0x4b2d, [0xb2, 0xc4, 0x95, 0x10, 0x83, 0xd3, 0xb8, 0xeb]);
interface IXpsSignatureRequest : IUnknown
{
    HRESULT GetIntent(PWSTR* intent);
    HRESULT SetIntent(const(wchar)* intent);
    HRESULT GetRequestedSigner(PWSTR* signerName);
    HRESULT SetRequestedSigner(const(wchar)* signerName);
    HRESULT GetRequestSignByDate(PWSTR* dateString);
    HRESULT SetRequestSignByDate(const(wchar)* dateString);
    HRESULT GetSigningLocale(PWSTR* place);
    HRESULT SetSigningLocale(const(wchar)* place);
    HRESULT GetSpotLocation(int* pageIndex, IOpcPartUri* pagePartName, float* x, float* y);
    HRESULT SetSpotLocation(int pageIndex, float x, float y);
    HRESULT GetRequestId(PWSTR* requestId);
    HRESULT GetSignature(IXpsSignature* signature);
}
enum IID_IXpsSignatureManager = GUID(0xd3e8d338, 0xfdc4, 0x4afc, [0x80, 0xb5, 0xd5, 0x32, 0xa1, 0x78, 0x2e, 0xe1]);
interface IXpsSignatureManager : IUnknown
{
    HRESULT LoadPackageFile(const(wchar)* fileName);
    HRESULT LoadPackageStream(IStream stream);
    HRESULT Sign(IXpsSigningOptions signOptions, const(CERT_CONTEXT)* x509Certificate, IXpsSignature* signature);
    HRESULT GetSignatureOriginPartName(IOpcPartUri* signatureOriginPartName);
    HRESULT SetSignatureOriginPartName(IOpcPartUri signatureOriginPartName);
    HRESULT GetSignatures(IXpsSignatureCollection* signatures);
    HRESULT AddSignatureBlock(IOpcPartUri partName, uint fixedDocumentIndex, IXpsSignatureBlock* signatureBlock);
    HRESULT GetSignatureBlocks(IXpsSignatureBlockCollection* signatureBlocks);
    HRESULT CreateSigningOptions(IXpsSigningOptions* signingOptions);
    HRESULT SavePackageToFile(const(wchar)* fileName, SECURITY_ATTRIBUTES* securityAttributes, uint flagsAndAttributes);
    HRESULT SavePackageToStream(IStream stream);
}
enum CLSID_XpsSignatureManager = GUID(0xb0c43320, 0x2315, 0x44a2, [0xb7, 0xa, 0x9, 0x43, 0xa1, 0x40, 0xa8, 0xee]);
struct XpsSignatureManager
{
}
