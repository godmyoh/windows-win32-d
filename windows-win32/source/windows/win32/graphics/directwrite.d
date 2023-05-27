module windows.win32.graphics.directwrite;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, COLORREF, FILETIME, HANDLE, HRESULT, POINT, PWSTR, RECT, SIZE;
import windows.win32.globalization : FONTSIGNATURE;
import windows.win32.graphics.direct2d.common : D2D_POINT_2F, D2D_SIZE_U, ID2D1SimplifiedGeometrySink;
import windows.win32.graphics.gdi : HDC, HMONITOR, LOGFONTA, LOGFONTW;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

HRESULT DWriteCreateFactory(DWRITE_FACTORY_TYPE, const(GUID)*, void**);
enum DWRITE_ALPHA_MAX = 0x000000ff;
enum FACILITY_DWRITE = 0x00000898;
enum DWRITE_ERR_BASE = 0x00005000;
enum DWRITE_E_REMOTEFONT = 0xffffffff8898500d;
enum DWRITE_E_DOWNLOADCANCELLED = 0xffffffff8898500e;
enum DWRITE_E_DOWNLOADFAILED = 0xffffffff8898500f;
enum DWRITE_E_TOOMANYDOWNLOADS = 0xffffffff88985010;
enum DWRITE_STANDARD_FONT_AXIS_COUNT = 0x00000005;
alias DWRITE_FONT_AXIS_TAG = uint;
enum : uint
{
    DWRITE_FONT_AXIS_TAG_WEIGHT       = 0x74686777,
    DWRITE_FONT_AXIS_TAG_WIDTH        = 0x68746477,
    DWRITE_FONT_AXIS_TAG_SLANT        = 0x746e6c73,
    DWRITE_FONT_AXIS_TAG_OPTICAL_SIZE = 0x7a73706f,
    DWRITE_FONT_AXIS_TAG_ITALIC       = 0x6c617469,
}

struct DWRITE_COLOR_F
{
    float r;
    float g;
    float b;
    float a;
}
alias DWRITE_MEASURING_MODE = int;
enum : int
{
    DWRITE_MEASURING_MODE_NATURAL     = 0x00000000,
    DWRITE_MEASURING_MODE_GDI_CLASSIC = 0x00000001,
    DWRITE_MEASURING_MODE_GDI_NATURAL = 0x00000002,
}

alias DWRITE_GLYPH_IMAGE_FORMATS = int;
enum : int
{
    DWRITE_GLYPH_IMAGE_FORMATS_NONE                   = 0x00000000,
    DWRITE_GLYPH_IMAGE_FORMATS_TRUETYPE               = 0x00000001,
    DWRITE_GLYPH_IMAGE_FORMATS_CFF                    = 0x00000002,
    DWRITE_GLYPH_IMAGE_FORMATS_COLR                   = 0x00000004,
    DWRITE_GLYPH_IMAGE_FORMATS_SVG                    = 0x00000008,
    DWRITE_GLYPH_IMAGE_FORMATS_PNG                    = 0x00000010,
    DWRITE_GLYPH_IMAGE_FORMATS_JPEG                   = 0x00000020,
    DWRITE_GLYPH_IMAGE_FORMATS_TIFF                   = 0x00000040,
    DWRITE_GLYPH_IMAGE_FORMATS_PREMULTIPLIED_B8G8R8A8 = 0x00000080,
}

alias DWRITE_FONT_FILE_TYPE = int;
enum : int
{
    DWRITE_FONT_FILE_TYPE_UNKNOWN             = 0x00000000,
    DWRITE_FONT_FILE_TYPE_CFF                 = 0x00000001,
    DWRITE_FONT_FILE_TYPE_TRUETYPE            = 0x00000002,
    DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION = 0x00000003,
    DWRITE_FONT_FILE_TYPE_TYPE1_PFM           = 0x00000004,
    DWRITE_FONT_FILE_TYPE_TYPE1_PFB           = 0x00000005,
    DWRITE_FONT_FILE_TYPE_VECTOR              = 0x00000006,
    DWRITE_FONT_FILE_TYPE_BITMAP              = 0x00000007,
    DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION = 0x00000003,
}

alias DWRITE_FONT_FACE_TYPE = int;
enum : int
{
    DWRITE_FONT_FACE_TYPE_CFF                 = 0x00000000,
    DWRITE_FONT_FACE_TYPE_TRUETYPE            = 0x00000001,
    DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION = 0x00000002,
    DWRITE_FONT_FACE_TYPE_TYPE1               = 0x00000003,
    DWRITE_FONT_FACE_TYPE_VECTOR              = 0x00000004,
    DWRITE_FONT_FACE_TYPE_BITMAP              = 0x00000005,
    DWRITE_FONT_FACE_TYPE_UNKNOWN             = 0x00000006,
    DWRITE_FONT_FACE_TYPE_RAW_CFF             = 0x00000007,
    DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION = 0x00000002,
}

alias DWRITE_FONT_SIMULATIONS = int;
enum : int
{
    DWRITE_FONT_SIMULATIONS_NONE    = 0x00000000,
    DWRITE_FONT_SIMULATIONS_BOLD    = 0x00000001,
    DWRITE_FONT_SIMULATIONS_OBLIQUE = 0x00000002,
}

alias DWRITE_FONT_WEIGHT = int;
enum : int
{
    DWRITE_FONT_WEIGHT_THIN        = 0x00000064,
    DWRITE_FONT_WEIGHT_EXTRA_LIGHT = 0x000000c8,
    DWRITE_FONT_WEIGHT_ULTRA_LIGHT = 0x000000c8,
    DWRITE_FONT_WEIGHT_LIGHT       = 0x0000012c,
    DWRITE_FONT_WEIGHT_SEMI_LIGHT  = 0x0000015e,
    DWRITE_FONT_WEIGHT_NORMAL      = 0x00000190,
    DWRITE_FONT_WEIGHT_REGULAR     = 0x00000190,
    DWRITE_FONT_WEIGHT_MEDIUM      = 0x000001f4,
    DWRITE_FONT_WEIGHT_DEMI_BOLD   = 0x00000258,
    DWRITE_FONT_WEIGHT_SEMI_BOLD   = 0x00000258,
    DWRITE_FONT_WEIGHT_BOLD        = 0x000002bc,
    DWRITE_FONT_WEIGHT_EXTRA_BOLD  = 0x00000320,
    DWRITE_FONT_WEIGHT_ULTRA_BOLD  = 0x00000320,
    DWRITE_FONT_WEIGHT_BLACK       = 0x00000384,
    DWRITE_FONT_WEIGHT_HEAVY       = 0x00000384,
    DWRITE_FONT_WEIGHT_EXTRA_BLACK = 0x000003b6,
    DWRITE_FONT_WEIGHT_ULTRA_BLACK = 0x000003b6,
}

alias DWRITE_FONT_STRETCH = int;
enum : int
{
    DWRITE_FONT_STRETCH_UNDEFINED       = 0x00000000,
    DWRITE_FONT_STRETCH_ULTRA_CONDENSED = 0x00000001,
    DWRITE_FONT_STRETCH_EXTRA_CONDENSED = 0x00000002,
    DWRITE_FONT_STRETCH_CONDENSED       = 0x00000003,
    DWRITE_FONT_STRETCH_SEMI_CONDENSED  = 0x00000004,
    DWRITE_FONT_STRETCH_NORMAL          = 0x00000005,
    DWRITE_FONT_STRETCH_MEDIUM          = 0x00000005,
    DWRITE_FONT_STRETCH_SEMI_EXPANDED   = 0x00000006,
    DWRITE_FONT_STRETCH_EXPANDED        = 0x00000007,
    DWRITE_FONT_STRETCH_EXTRA_EXPANDED  = 0x00000008,
    DWRITE_FONT_STRETCH_ULTRA_EXPANDED  = 0x00000009,
}

alias DWRITE_FONT_STYLE = int;
enum : int
{
    DWRITE_FONT_STYLE_NORMAL  = 0x00000000,
    DWRITE_FONT_STYLE_OBLIQUE = 0x00000001,
    DWRITE_FONT_STYLE_ITALIC  = 0x00000002,
}

alias DWRITE_INFORMATIONAL_STRING_ID = int;
enum : int
{
    DWRITE_INFORMATIONAL_STRING_NONE                             = 0x00000000,
    DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE                 = 0x00000001,
    DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS                  = 0x00000002,
    DWRITE_INFORMATIONAL_STRING_TRADEMARK                        = 0x00000003,
    DWRITE_INFORMATIONAL_STRING_MANUFACTURER                     = 0x00000004,
    DWRITE_INFORMATIONAL_STRING_DESIGNER                         = 0x00000005,
    DWRITE_INFORMATIONAL_STRING_DESIGNER_URL                     = 0x00000006,
    DWRITE_INFORMATIONAL_STRING_DESCRIPTION                      = 0x00000007,
    DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL                  = 0x00000008,
    DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION              = 0x00000009,
    DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL                 = 0x0000000a,
    DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES               = 0x0000000b,
    DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES            = 0x0000000c,
    DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES         = 0x0000000d,
    DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES      = 0x0000000e,
    DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT                      = 0x0000000f,
    DWRITE_INFORMATIONAL_STRING_FULL_NAME                        = 0x00000010,
    DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME                  = 0x00000011,
    DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME              = 0x00000012,
    DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME = 0x00000013,
    DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG       = 0x00000014,
    DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG    = 0x00000015,
    DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES           = 0x0000000d,
    DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES        = 0x0000000e,
    DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME                  = 0x00000013,
}

struct DWRITE_FONT_METRICS
{
    ushort designUnitsPerEm;
    ushort ascent;
    ushort descent;
    short lineGap;
    ushort capHeight;
    ushort xHeight;
    short underlinePosition;
    ushort underlineThickness;
    short strikethroughPosition;
    ushort strikethroughThickness;
}
struct DWRITE_GLYPH_METRICS
{
    int leftSideBearing;
    uint advanceWidth;
    int rightSideBearing;
    int topSideBearing;
    uint advanceHeight;
    int bottomSideBearing;
    int verticalOriginY;
}
struct DWRITE_GLYPH_OFFSET
{
    float advanceOffset;
    float ascenderOffset;
}
alias DWRITE_FACTORY_TYPE = int;
enum : int
{
    DWRITE_FACTORY_TYPE_SHARED   = 0x00000000,
    DWRITE_FACTORY_TYPE_ISOLATED = 0x00000001,
}

enum IID_IDWriteFontFileLoader = GUID(0x727cad4e, 0xd6af, 0x4c9e, [0x8a, 0x8, 0xd6, 0x95, 0xb1, 0x1c, 0xaa, 0x49]);
interface IDWriteFontFileLoader : IUnknown
{
    HRESULT CreateStreamFromKey(const(void)*, uint, IDWriteFontFileStream*);
}
enum IID_IDWriteLocalFontFileLoader = GUID(0xb2d9f3ec, 0xc9fe, 0x4a11, [0xa2, 0xec, 0xd8, 0x62, 0x8, 0xf7, 0xc0, 0xa2]);
interface IDWriteLocalFontFileLoader : IDWriteFontFileLoader
{
    HRESULT GetFilePathLengthFromKey(const(void)*, uint, uint*);
    HRESULT GetFilePathFromKey(const(void)*, uint, PWSTR, uint);
    HRESULT GetLastWriteTimeFromKey(const(void)*, uint, FILETIME*);
}
enum IID_IDWriteFontFileStream = GUID(0x6d4865fe, 0xab8, 0x4d91, [0x8f, 0x62, 0x5d, 0xd6, 0xbe, 0x34, 0xa3, 0xe0]);
interface IDWriteFontFileStream : IUnknown
{
    HRESULT ReadFileFragment(const(void)**, ulong, ulong, void**);
    void ReleaseFileFragment(void*);
    HRESULT GetFileSize(ulong*);
    HRESULT GetLastWriteTime(ulong*);
}
enum IID_IDWriteFontFile = GUID(0x739d886a, 0xcef5, 0x47dc, [0x87, 0x69, 0x1a, 0x8b, 0x41, 0xbe, 0xbb, 0xb0]);
interface IDWriteFontFile : IUnknown
{
    HRESULT GetReferenceKey(const(void)**, uint*);
    HRESULT GetLoader(IDWriteFontFileLoader*);
    HRESULT Analyze(BOOL*, DWRITE_FONT_FILE_TYPE*, DWRITE_FONT_FACE_TYPE*, uint*);
}
alias DWRITE_PIXEL_GEOMETRY = int;
enum : int
{
    DWRITE_PIXEL_GEOMETRY_FLAT = 0x00000000,
    DWRITE_PIXEL_GEOMETRY_RGB  = 0x00000001,
    DWRITE_PIXEL_GEOMETRY_BGR  = 0x00000002,
}

alias DWRITE_RENDERING_MODE = int;
enum : int
{
    DWRITE_RENDERING_MODE_DEFAULT                     = 0x00000000,
    DWRITE_RENDERING_MODE_ALIASED                     = 0x00000001,
    DWRITE_RENDERING_MODE_GDI_CLASSIC                 = 0x00000002,
    DWRITE_RENDERING_MODE_GDI_NATURAL                 = 0x00000003,
    DWRITE_RENDERING_MODE_NATURAL                     = 0x00000004,
    DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC           = 0x00000005,
    DWRITE_RENDERING_MODE_OUTLINE                     = 0x00000006,
    DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC       = 0x00000002,
    DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL       = 0x00000003,
    DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL           = 0x00000004,
    DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC = 0x00000005,
}

struct DWRITE_MATRIX
{
    float m11;
    float m12;
    float m21;
    float m22;
    float dx;
    float dy;
}
enum IID_IDWriteRenderingParams = GUID(0x2f0da53a, 0x2add, 0x47cd, [0x82, 0xee, 0xd9, 0xec, 0x34, 0x68, 0x8e, 0x75]);
interface IDWriteRenderingParams : IUnknown
{
    float GetGamma();
    float GetEnhancedContrast();
    float GetClearTypeLevel();
    DWRITE_PIXEL_GEOMETRY GetPixelGeometry();
    DWRITE_RENDERING_MODE GetRenderingMode();
}
enum IID_IDWriteFontFace = GUID(0x5f49804d, 0x7024, 0x4d43, [0xbf, 0xa9, 0xd2, 0x59, 0x84, 0xf5, 0x38, 0x49]);
interface IDWriteFontFace : IUnknown
{
    DWRITE_FONT_FACE_TYPE GetType();
    HRESULT GetFiles(uint*, IDWriteFontFile*);
    uint GetIndex();
    DWRITE_FONT_SIMULATIONS GetSimulations();
    BOOL IsSymbolFont();
    void GetMetrics(DWRITE_FONT_METRICS*);
    ushort GetGlyphCount();
    HRESULT GetDesignGlyphMetrics(const(ushort)*, uint, DWRITE_GLYPH_METRICS*, BOOL);
    HRESULT GetGlyphIndices(const(uint)*, uint, ushort*);
    HRESULT TryGetFontTable(uint, const(void)**, uint*, void**, BOOL*);
    void ReleaseFontTable(void*);
    HRESULT GetGlyphRunOutline(float, const(ushort)*, const(float)*, const(DWRITE_GLYPH_OFFSET)*, uint, BOOL, BOOL, ID2D1SimplifiedGeometrySink);
    HRESULT GetRecommendedRenderingMode(float, float, DWRITE_MEASURING_MODE, IDWriteRenderingParams, DWRITE_RENDERING_MODE*);
    HRESULT GetGdiCompatibleMetrics(float, float, const(DWRITE_MATRIX)*, DWRITE_FONT_METRICS*);
    HRESULT GetGdiCompatibleGlyphMetrics(float, float, const(DWRITE_MATRIX)*, BOOL, const(ushort)*, uint, DWRITE_GLYPH_METRICS*, BOOL);
}
enum IID_IDWriteFontCollectionLoader = GUID(0xcca920e4, 0x52f0, 0x492b, [0xbf, 0xa8, 0x29, 0xc7, 0x2e, 0xe0, 0xa4, 0x68]);
interface IDWriteFontCollectionLoader : IUnknown
{
    HRESULT CreateEnumeratorFromKey(IDWriteFactory, const(void)*, uint, IDWriteFontFileEnumerator*);
}
enum IID_IDWriteFontFileEnumerator = GUID(0x72755049, 0x5ff7, 0x435d, [0x83, 0x48, 0x4b, 0xe9, 0x7c, 0xfa, 0x6c, 0x7c]);
interface IDWriteFontFileEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT GetCurrentFontFile(IDWriteFontFile*);
}
enum IID_IDWriteLocalizedStrings = GUID(0x8256209, 0x99a, 0x4b34, [0xb8, 0x6d, 0xc2, 0x2b, 0x11, 0xe, 0x77, 0x71]);
interface IDWriteLocalizedStrings : IUnknown
{
    uint GetCount();
    HRESULT FindLocaleName(const(wchar)*, uint*, BOOL*);
    HRESULT GetLocaleNameLength(uint, uint*);
    HRESULT GetLocaleName(uint, PWSTR, uint);
    HRESULT GetStringLength(uint, uint*);
    HRESULT GetString(uint, PWSTR, uint);
}
enum IID_IDWriteFontCollection = GUID(0xa84cee02, 0x3eea, 0x4eee, [0xa8, 0x27, 0x87, 0xc1, 0xa0, 0x2a, 0xf, 0xcc]);
interface IDWriteFontCollection : IUnknown
{
    uint GetFontFamilyCount();
    HRESULT GetFontFamily(uint, IDWriteFontFamily*);
    HRESULT FindFamilyName(const(wchar)*, uint*, BOOL*);
    HRESULT GetFontFromFontFace(IDWriteFontFace, IDWriteFont*);
}
enum IID_IDWriteFontList = GUID(0x1a0d8438, 0x1d97, 0x4ec1, [0xae, 0xf9, 0xa2, 0xfb, 0x86, 0xed, 0x6a, 0xcb]);
interface IDWriteFontList : IUnknown
{
    HRESULT GetFontCollection(IDWriteFontCollection*);
    uint GetFontCount();
    HRESULT GetFont(uint, IDWriteFont*);
}
enum IID_IDWriteFontFamily = GUID(0xda20d8ef, 0x812a, 0x4c43, [0x98, 0x2, 0x62, 0xec, 0x4a, 0xbd, 0x7a, 0xdd]);
interface IDWriteFontFamily : IDWriteFontList
{
    HRESULT GetFamilyNames(IDWriteLocalizedStrings*);
    HRESULT GetFirstMatchingFont(DWRITE_FONT_WEIGHT, DWRITE_FONT_STRETCH, DWRITE_FONT_STYLE, IDWriteFont*);
    HRESULT GetMatchingFonts(DWRITE_FONT_WEIGHT, DWRITE_FONT_STRETCH, DWRITE_FONT_STYLE, IDWriteFontList*);
}
enum IID_IDWriteFont = GUID(0xacd16696, 0x8c14, 0x4f5d, [0x87, 0x7e, 0xfe, 0x3f, 0xc1, 0xd3, 0x27, 0x37]);
interface IDWriteFont : IUnknown
{
    HRESULT GetFontFamily(IDWriteFontFamily*);
    DWRITE_FONT_WEIGHT GetWeight();
    DWRITE_FONT_STRETCH GetStretch();
    DWRITE_FONT_STYLE GetStyle();
    BOOL IsSymbolFont();
    HRESULT GetFaceNames(IDWriteLocalizedStrings*);
    HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID, IDWriteLocalizedStrings*, BOOL*);
    DWRITE_FONT_SIMULATIONS GetSimulations();
    void GetMetrics(DWRITE_FONT_METRICS*);
    HRESULT HasCharacter(uint, BOOL*);
    HRESULT CreateFontFace(IDWriteFontFace*);
}
alias DWRITE_READING_DIRECTION = int;
enum : int
{
    DWRITE_READING_DIRECTION_LEFT_TO_RIGHT = 0x00000000,
    DWRITE_READING_DIRECTION_RIGHT_TO_LEFT = 0x00000001,
    DWRITE_READING_DIRECTION_TOP_TO_BOTTOM = 0x00000002,
    DWRITE_READING_DIRECTION_BOTTOM_TO_TOP = 0x00000003,
}

alias DWRITE_FLOW_DIRECTION = int;
enum : int
{
    DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM = 0x00000000,
    DWRITE_FLOW_DIRECTION_BOTTOM_TO_TOP = 0x00000001,
    DWRITE_FLOW_DIRECTION_LEFT_TO_RIGHT = 0x00000002,
    DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT = 0x00000003,
}

alias DWRITE_TEXT_ALIGNMENT = int;
enum : int
{
    DWRITE_TEXT_ALIGNMENT_LEADING   = 0x00000000,
    DWRITE_TEXT_ALIGNMENT_TRAILING  = 0x00000001,
    DWRITE_TEXT_ALIGNMENT_CENTER    = 0x00000002,
    DWRITE_TEXT_ALIGNMENT_JUSTIFIED = 0x00000003,
}

alias DWRITE_PARAGRAPH_ALIGNMENT = int;
enum : int
{
    DWRITE_PARAGRAPH_ALIGNMENT_NEAR   = 0x00000000,
    DWRITE_PARAGRAPH_ALIGNMENT_FAR    = 0x00000001,
    DWRITE_PARAGRAPH_ALIGNMENT_CENTER = 0x00000002,
}

alias DWRITE_WORD_WRAPPING = int;
enum : int
{
    DWRITE_WORD_WRAPPING_WRAP            = 0x00000000,
    DWRITE_WORD_WRAPPING_NO_WRAP         = 0x00000001,
    DWRITE_WORD_WRAPPING_EMERGENCY_BREAK = 0x00000002,
    DWRITE_WORD_WRAPPING_WHOLE_WORD      = 0x00000003,
    DWRITE_WORD_WRAPPING_CHARACTER       = 0x00000004,
}

alias DWRITE_LINE_SPACING_METHOD = int;
enum : int
{
    DWRITE_LINE_SPACING_METHOD_DEFAULT      = 0x00000000,
    DWRITE_LINE_SPACING_METHOD_UNIFORM      = 0x00000001,
    DWRITE_LINE_SPACING_METHOD_PROPORTIONAL = 0x00000002,
}

alias DWRITE_TRIMMING_GRANULARITY = int;
enum : int
{
    DWRITE_TRIMMING_GRANULARITY_NONE      = 0x00000000,
    DWRITE_TRIMMING_GRANULARITY_CHARACTER = 0x00000001,
    DWRITE_TRIMMING_GRANULARITY_WORD      = 0x00000002,
}

alias DWRITE_FONT_FEATURE_TAG = uint;
enum : uint
{
    DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS            = 0x63726661,
    DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS    = 0x63703263,
    DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS     = 0x63733263,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES            = 0x746c6163,
    DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS             = 0x65736163,
    DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION  = 0x706d6363,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES             = 0x67696c63,
    DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING                  = 0x70737063,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH                 = 0x68777363,
    DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING              = 0x73727563,
    DWRITE_FONT_FEATURE_TAG_DEFAULT                          = 0x746c6664,
    DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES          = 0x67696c64,
    DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS                     = 0x74707865,
    DWRITE_FONT_FEATURE_TAG_FRACTIONS                        = 0x63617266,
    DWRITE_FONT_FEATURE_TAG_FULL_WIDTH                       = 0x64697766,
    DWRITE_FONT_FEATURE_TAG_HALF_FORMS                       = 0x666c6168,
    DWRITE_FONT_FEATURE_TAG_HALANT_FORMS                     = 0x6e6c6168,
    DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH             = 0x746c6168,
    DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS                 = 0x74736968,
    DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES       = 0x616e6b68,
    DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES             = 0x67696c68,
    DWRITE_FONT_FEATURE_TAG_HALF_WIDTH                       = 0x64697768,
    DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS                 = 0x6f6a6f68,
    DWRITE_FONT_FEATURE_TAG_JIS04_FORMS                      = 0x3430706a,
    DWRITE_FONT_FEATURE_TAG_JIS78_FORMS                      = 0x3837706a,
    DWRITE_FONT_FEATURE_TAG_JIS83_FORMS                      = 0x3338706a,
    DWRITE_FONT_FEATURE_TAG_JIS90_FORMS                      = 0x3039706a,
    DWRITE_FONT_FEATURE_TAG_KERNING                          = 0x6e72656b,
    DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES               = 0x6167696c,
    DWRITE_FONT_FEATURE_TAG_LINING_FIGURES                   = 0x6d756e6c,
    DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS                  = 0x6c636f6c,
    DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING                 = 0x6b72616d,
    DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK               = 0x6b72676d,
    DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING         = 0x6b6d6b6d,
    DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS       = 0x746c616e,
    DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS                  = 0x6b636c6e,
    DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES                = 0x6d756e6f,
    DWRITE_FONT_FEATURE_TAG_ORDINALS                         = 0x6e64726f,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH     = 0x746c6170,
    DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS                  = 0x70616370,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES             = 0x6d756e70,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS              = 0x64697770,
    DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS                   = 0x64697771,
    DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES               = 0x67696c72,
    DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS              = 0x79627572,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES             = 0x746c6173,
    DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS             = 0x666e6973,
    DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS                   = 0x70636d73,
    DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS                 = 0x6c706d73,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1                  = 0x31307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2                  = 0x32307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3                  = 0x33307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4                  = 0x34307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5                  = 0x35307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6                  = 0x36307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7                  = 0x37307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8                  = 0x38307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9                  = 0x39307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10                 = 0x30317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11                 = 0x31317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12                 = 0x32317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13                 = 0x33317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14                 = 0x34317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15                 = 0x35317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16                 = 0x36317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17                 = 0x37317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18                 = 0x38317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19                 = 0x39317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20                 = 0x30327373,
    DWRITE_FONT_FEATURE_TAG_SUBSCRIPT                        = 0x73627573,
    DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT                      = 0x73707573,
    DWRITE_FONT_FEATURE_TAG_SWASH                            = 0x68737773,
    DWRITE_FONT_FEATURE_TAG_TITLING                          = 0x6c746974,
    DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS           = 0x6d616e74,
    DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES                  = 0x6d756e74,
    DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS                = 0x64617274,
    DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS                     = 0x64697774,
    DWRITE_FONT_FEATURE_TAG_UNICASE                          = 0x63696e75,
    DWRITE_FONT_FEATURE_TAG_VERTICAL_WRITING                 = 0x74726576,
    DWRITE_FONT_FEATURE_TAG_VERTICAL_ALTERNATES_AND_ROTATION = 0x32747276,
    DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO                     = 0x6f72657a,
}

struct DWRITE_TEXT_RANGE
{
    uint startPosition;
    uint length;
}
struct DWRITE_FONT_FEATURE
{
    DWRITE_FONT_FEATURE_TAG nameTag;
    uint parameter;
}
struct DWRITE_TYPOGRAPHIC_FEATURES
{
    DWRITE_FONT_FEATURE* features;
    uint featureCount;
}
struct DWRITE_TRIMMING
{
    DWRITE_TRIMMING_GRANULARITY granularity;
    uint delimiter;
    uint delimiterCount;
}
enum IID_IDWriteTextFormat = GUID(0x9c906818, 0x31d7, 0x4fd3, [0xa1, 0x51, 0x7c, 0x5e, 0x22, 0x5d, 0xb5, 0x5a]);
interface IDWriteTextFormat : IUnknown
{
    HRESULT SetTextAlignment(DWRITE_TEXT_ALIGNMENT);
    HRESULT SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT);
    HRESULT SetWordWrapping(DWRITE_WORD_WRAPPING);
    HRESULT SetReadingDirection(DWRITE_READING_DIRECTION);
    HRESULT SetFlowDirection(DWRITE_FLOW_DIRECTION);
    HRESULT SetIncrementalTabStop(float);
    HRESULT SetTrimming(const(DWRITE_TRIMMING)*, IDWriteInlineObject);
    HRESULT SetLineSpacing(DWRITE_LINE_SPACING_METHOD, float, float);
    DWRITE_TEXT_ALIGNMENT GetTextAlignment();
    DWRITE_PARAGRAPH_ALIGNMENT GetParagraphAlignment();
    DWRITE_WORD_WRAPPING GetWordWrapping();
    DWRITE_READING_DIRECTION GetReadingDirection();
    DWRITE_FLOW_DIRECTION GetFlowDirection();
    float GetIncrementalTabStop();
    HRESULT GetTrimming(DWRITE_TRIMMING*, IDWriteInlineObject*);
    HRESULT GetLineSpacing(DWRITE_LINE_SPACING_METHOD*, float*, float*);
    HRESULT GetFontCollection(IDWriteFontCollection*);
    uint GetFontFamilyNameLength();
    HRESULT GetFontFamilyName(PWSTR, uint);
    DWRITE_FONT_WEIGHT GetFontWeight();
    DWRITE_FONT_STYLE GetFontStyle();
    DWRITE_FONT_STRETCH GetFontStretch();
    float GetFontSize();
    uint GetLocaleNameLength();
    HRESULT GetLocaleName(PWSTR, uint);
}
enum IID_IDWriteTypography = GUID(0x55f1112b, 0x1dc2, 0x4b3c, [0x95, 0x41, 0xf4, 0x68, 0x94, 0xed, 0x85, 0xb6]);
interface IDWriteTypography : IUnknown
{
    HRESULT AddFontFeature(DWRITE_FONT_FEATURE);
    uint GetFontFeatureCount();
    HRESULT GetFontFeature(uint, DWRITE_FONT_FEATURE*);
}
alias DWRITE_SCRIPT_SHAPES = int;
enum : int
{
    DWRITE_SCRIPT_SHAPES_DEFAULT   = 0x00000000,
    DWRITE_SCRIPT_SHAPES_NO_VISUAL = 0x00000001,
}

struct DWRITE_SCRIPT_ANALYSIS
{
    ushort script;
    DWRITE_SCRIPT_SHAPES shapes;
}
alias DWRITE_BREAK_CONDITION = int;
enum : int
{
    DWRITE_BREAK_CONDITION_NEUTRAL       = 0x00000000,
    DWRITE_BREAK_CONDITION_CAN_BREAK     = 0x00000001,
    DWRITE_BREAK_CONDITION_MAY_NOT_BREAK = 0x00000002,
    DWRITE_BREAK_CONDITION_MUST_BREAK    = 0x00000003,
}

struct DWRITE_LINE_BREAKPOINT
{
    ubyte _bitfield0;
}
alias DWRITE_NUMBER_SUBSTITUTION_METHOD = int;
enum : int
{
    DWRITE_NUMBER_SUBSTITUTION_METHOD_FROM_CULTURE = 0x00000000,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_CONTEXTUAL   = 0x00000001,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_NONE         = 0x00000002,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_NATIONAL     = 0x00000003,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL  = 0x00000004,
}

enum IID_IDWriteNumberSubstitution = GUID(0x14885cc9, 0xbab0, 0x4f90, [0xb6, 0xed, 0x5c, 0x36, 0x6a, 0x2c, 0xd0, 0x3d]);
interface IDWriteNumberSubstitution : IUnknown
{
}
struct DWRITE_SHAPING_TEXT_PROPERTIES
{
    ushort _bitfield0;
}
struct DWRITE_SHAPING_GLYPH_PROPERTIES
{
    ushort _bitfield0;
}
enum IID_IDWriteTextAnalysisSource = GUID(0x688e1a58, 0x5094, 0x47c8, [0xad, 0xc8, 0xfb, 0xce, 0xa6, 0xa, 0xe9, 0x2b]);
interface IDWriteTextAnalysisSource : IUnknown
{
    HRESULT GetTextAtPosition(uint, const(ushort)**, uint*);
    HRESULT GetTextBeforePosition(uint, const(ushort)**, uint*);
    DWRITE_READING_DIRECTION GetParagraphReadingDirection();
    HRESULT GetLocaleName(uint, uint*, const(ushort)**);
    HRESULT GetNumberSubstitution(uint, uint*, IDWriteNumberSubstitution*);
}
enum IID_IDWriteTextAnalysisSink = GUID(0x5810cd44, 0xca0, 0x4701, [0xb3, 0xfa, 0xbe, 0xc5, 0x18, 0x2a, 0xe4, 0xf6]);
interface IDWriteTextAnalysisSink : IUnknown
{
    HRESULT SetScriptAnalysis(uint, uint, const(DWRITE_SCRIPT_ANALYSIS)*);
    HRESULT SetLineBreakpoints(uint, uint, const(DWRITE_LINE_BREAKPOINT)*);
    HRESULT SetBidiLevel(uint, uint, ubyte, ubyte);
    HRESULT SetNumberSubstitution(uint, uint, IDWriteNumberSubstitution);
}
enum IID_IDWriteTextAnalyzer = GUID(0xb7e6163e, 0x7f46, 0x43b4, [0x84, 0xb3, 0xe4, 0xe6, 0x24, 0x9c, 0x36, 0x5d]);
interface IDWriteTextAnalyzer : IUnknown
{
    HRESULT AnalyzeScript(IDWriteTextAnalysisSource, uint, uint, IDWriteTextAnalysisSink);
    HRESULT AnalyzeBidi(IDWriteTextAnalysisSource, uint, uint, IDWriteTextAnalysisSink);
    HRESULT AnalyzeNumberSubstitution(IDWriteTextAnalysisSource, uint, uint, IDWriteTextAnalysisSink);
    HRESULT AnalyzeLineBreakpoints(IDWriteTextAnalysisSource, uint, uint, IDWriteTextAnalysisSink);
    HRESULT GetGlyphs(const(wchar)*, uint, IDWriteFontFace, BOOL, BOOL, const(DWRITE_SCRIPT_ANALYSIS)*, const(wchar)*, IDWriteNumberSubstitution, const(DWRITE_TYPOGRAPHIC_FEATURES)**, const(uint)*, uint, uint, ushort*, DWRITE_SHAPING_TEXT_PROPERTIES*, ushort*, DWRITE_SHAPING_GLYPH_PROPERTIES*, uint*);
    HRESULT GetGlyphPlacements(const(wchar)*, const(ushort)*, DWRITE_SHAPING_TEXT_PROPERTIES*, uint, const(ushort)*, const(DWRITE_SHAPING_GLYPH_PROPERTIES)*, uint, IDWriteFontFace, float, BOOL, BOOL, const(DWRITE_SCRIPT_ANALYSIS)*, const(wchar)*, const(DWRITE_TYPOGRAPHIC_FEATURES)**, const(uint)*, uint, float*, DWRITE_GLYPH_OFFSET*);
    HRESULT GetGdiCompatibleGlyphPlacements(const(wchar)*, const(ushort)*, DWRITE_SHAPING_TEXT_PROPERTIES*, uint, const(ushort)*, const(DWRITE_SHAPING_GLYPH_PROPERTIES)*, uint, IDWriteFontFace, float, float, const(DWRITE_MATRIX)*, BOOL, BOOL, BOOL, const(DWRITE_SCRIPT_ANALYSIS)*, const(wchar)*, const(DWRITE_TYPOGRAPHIC_FEATURES)**, const(uint)*, uint, float*, DWRITE_GLYPH_OFFSET*);
}
struct DWRITE_GLYPH_RUN
{
    IDWriteFontFace fontFace;
    float fontEmSize;
    uint glyphCount;
    const(ushort)* glyphIndices;
    const(float)* glyphAdvances;
    const(DWRITE_GLYPH_OFFSET)* glyphOffsets;
    BOOL isSideways;
    uint bidiLevel;
}
struct DWRITE_GLYPH_RUN_DESCRIPTION
{
    const(wchar)* localeName;
    const(wchar)* string;
    uint stringLength;
    const(ushort)* clusterMap;
    uint textPosition;
}
struct DWRITE_UNDERLINE
{
    float width;
    float thickness;
    float offset;
    float runHeight;
    DWRITE_READING_DIRECTION readingDirection;
    DWRITE_FLOW_DIRECTION flowDirection;
    const(wchar)* localeName;
    DWRITE_MEASURING_MODE measuringMode;
}
struct DWRITE_STRIKETHROUGH
{
    float width;
    float thickness;
    float offset;
    DWRITE_READING_DIRECTION readingDirection;
    DWRITE_FLOW_DIRECTION flowDirection;
    const(wchar)* localeName;
    DWRITE_MEASURING_MODE measuringMode;
}
struct DWRITE_LINE_METRICS
{
    uint length;
    uint trailingWhitespaceLength;
    uint newlineLength;
    float height;
    float baseline;
    BOOL isTrimmed;
}
struct DWRITE_CLUSTER_METRICS
{
    float width;
    ushort length;
    ushort _bitfield0;
}
struct DWRITE_TEXT_METRICS
{
    float left;
    float top;
    float width;
    float widthIncludingTrailingWhitespace;
    float height;
    float layoutWidth;
    float layoutHeight;
    uint maxBidiReorderingDepth;
    uint lineCount;
}
struct DWRITE_INLINE_OBJECT_METRICS
{
    float width;
    float height;
    float baseline;
    BOOL supportsSideways;
}
struct DWRITE_OVERHANG_METRICS
{
    float left;
    float top;
    float right;
    float bottom;
}
struct DWRITE_HIT_TEST_METRICS
{
    uint textPosition;
    uint length;
    float left;
    float top;
    float width;
    float height;
    uint bidiLevel;
    BOOL isText;
    BOOL isTrimmed;
}
enum IID_IDWriteInlineObject = GUID(0x8339fde3, 0x106f, 0x47ab, [0x83, 0x73, 0x1c, 0x62, 0x95, 0xeb, 0x10, 0xb3]);
interface IDWriteInlineObject : IUnknown
{
    HRESULT Draw(void*, IDWriteTextRenderer, float, float, BOOL, BOOL, IUnknown);
    HRESULT GetMetrics(DWRITE_INLINE_OBJECT_METRICS*);
    HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS*);
    HRESULT GetBreakConditions(DWRITE_BREAK_CONDITION*, DWRITE_BREAK_CONDITION*);
}
enum IID_IDWritePixelSnapping = GUID(0xeaf3a2da, 0xecf4, 0x4d24, [0xb6, 0x44, 0xb3, 0x4f, 0x68, 0x42, 0x2, 0x4b]);
interface IDWritePixelSnapping : IUnknown
{
    HRESULT IsPixelSnappingDisabled(void*, BOOL*);
    HRESULT GetCurrentTransform(void*, DWRITE_MATRIX*);
    HRESULT GetPixelsPerDip(void*, float*);
}
enum IID_IDWriteTextRenderer = GUID(0xef8a8135, 0x5cc6, 0x45fe, [0x88, 0x25, 0xc5, 0xa0, 0x72, 0x4e, 0xb8, 0x19]);
interface IDWriteTextRenderer : IDWritePixelSnapping
{
    HRESULT DrawGlyphRun(void*, float, float, DWRITE_MEASURING_MODE, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, IUnknown);
    HRESULT DrawUnderline(void*, float, float, const(DWRITE_UNDERLINE)*, IUnknown);
    HRESULT DrawStrikethrough(void*, float, float, const(DWRITE_STRIKETHROUGH)*, IUnknown);
    HRESULT DrawInlineObject(void*, float, float, IDWriteInlineObject, BOOL, BOOL, IUnknown);
}
enum IID_IDWriteTextLayout = GUID(0x53737037, 0x6d14, 0x410b, [0x9b, 0xfe, 0xb, 0x18, 0x2b, 0xb7, 0x9, 0x61]);
interface IDWriteTextLayout : IDWriteTextFormat
{
    HRESULT SetMaxWidth(float);
    HRESULT SetMaxHeight(float);
    HRESULT SetFontCollection(IDWriteFontCollection, DWRITE_TEXT_RANGE);
    HRESULT SetFontFamilyName(const(wchar)*, DWRITE_TEXT_RANGE);
    HRESULT SetFontWeight(DWRITE_FONT_WEIGHT, DWRITE_TEXT_RANGE);
    HRESULT SetFontStyle(DWRITE_FONT_STYLE, DWRITE_TEXT_RANGE);
    HRESULT SetFontStretch(DWRITE_FONT_STRETCH, DWRITE_TEXT_RANGE);
    HRESULT SetFontSize(float, DWRITE_TEXT_RANGE);
    HRESULT SetUnderline(BOOL, DWRITE_TEXT_RANGE);
    HRESULT SetStrikethrough(BOOL, DWRITE_TEXT_RANGE);
    HRESULT SetDrawingEffect(IUnknown, DWRITE_TEXT_RANGE);
    HRESULT SetInlineObject(IDWriteInlineObject, DWRITE_TEXT_RANGE);
    HRESULT SetTypography(IDWriteTypography, DWRITE_TEXT_RANGE);
    HRESULT SetLocaleName(const(wchar)*, DWRITE_TEXT_RANGE);
    float GetMaxWidth();
    float GetMaxHeight();
    HRESULT GetFontCollection(uint, IDWriteFontCollection*, DWRITE_TEXT_RANGE*);
    HRESULT GetFontFamilyNameLength(uint, uint*, DWRITE_TEXT_RANGE*);
    HRESULT GetFontFamilyName(uint, PWSTR, uint, DWRITE_TEXT_RANGE*);
    HRESULT GetFontWeight(uint, DWRITE_FONT_WEIGHT*, DWRITE_TEXT_RANGE*);
    HRESULT GetFontStyle(uint, DWRITE_FONT_STYLE*, DWRITE_TEXT_RANGE*);
    HRESULT GetFontStretch(uint, DWRITE_FONT_STRETCH*, DWRITE_TEXT_RANGE*);
    HRESULT GetFontSize(uint, float*, DWRITE_TEXT_RANGE*);
    HRESULT GetUnderline(uint, BOOL*, DWRITE_TEXT_RANGE*);
    HRESULT GetStrikethrough(uint, BOOL*, DWRITE_TEXT_RANGE*);
    HRESULT GetDrawingEffect(uint, IUnknown*, DWRITE_TEXT_RANGE*);
    HRESULT GetInlineObject(uint, IDWriteInlineObject*, DWRITE_TEXT_RANGE*);
    HRESULT GetTypography(uint, IDWriteTypography*, DWRITE_TEXT_RANGE*);
    HRESULT GetLocaleNameLength(uint, uint*, DWRITE_TEXT_RANGE*);
    HRESULT GetLocaleName(uint, PWSTR, uint, DWRITE_TEXT_RANGE*);
    HRESULT Draw(void*, IDWriteTextRenderer, float, float);
    HRESULT GetLineMetrics(DWRITE_LINE_METRICS*, uint, uint*);
    HRESULT GetMetrics(DWRITE_TEXT_METRICS*);
    HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS*);
    HRESULT GetClusterMetrics(DWRITE_CLUSTER_METRICS*, uint, uint*);
    HRESULT DetermineMinWidth(float*);
    HRESULT HitTestPoint(float, float, BOOL*, BOOL*, DWRITE_HIT_TEST_METRICS*);
    HRESULT HitTestTextPosition(uint, BOOL, float*, float*, DWRITE_HIT_TEST_METRICS*);
    HRESULT HitTestTextRange(uint, uint, float, float, DWRITE_HIT_TEST_METRICS*, uint, uint*);
}
enum IID_IDWriteBitmapRenderTarget = GUID(0x5e5a32a3, 0x8dff, 0x4773, [0x9f, 0xf6, 0x6, 0x96, 0xea, 0xb7, 0x72, 0x67]);
interface IDWriteBitmapRenderTarget : IUnknown
{
    HRESULT DrawGlyphRun(float, float, DWRITE_MEASURING_MODE, const(DWRITE_GLYPH_RUN)*, IDWriteRenderingParams, COLORREF, RECT*);
    HDC GetMemoryDC();
    float GetPixelsPerDip();
    HRESULT SetPixelsPerDip(float);
    HRESULT GetCurrentTransform(DWRITE_MATRIX*);
    HRESULT SetCurrentTransform(const(DWRITE_MATRIX)*);
    HRESULT GetSize(SIZE*);
    HRESULT Resize(uint, uint);
}
enum IID_IDWriteGdiInterop = GUID(0x1edd9491, 0x9853, 0x4299, [0x89, 0x8f, 0x64, 0x32, 0x98, 0x3b, 0x6f, 0x3a]);
interface IDWriteGdiInterop : IUnknown
{
    HRESULT CreateFontFromLOGFONT(const(LOGFONTW)*, IDWriteFont*);
    HRESULT ConvertFontToLOGFONT(IDWriteFont, LOGFONTW*, BOOL*);
    HRESULT ConvertFontFaceToLOGFONT(IDWriteFontFace, LOGFONTW*);
    HRESULT CreateFontFaceFromHdc(HDC, IDWriteFontFace*);
    HRESULT CreateBitmapRenderTarget(HDC, uint, uint, IDWriteBitmapRenderTarget*);
}
alias DWRITE_TEXTURE_TYPE = int;
enum : int
{
    DWRITE_TEXTURE_ALIASED_1x1   = 0x00000000,
    DWRITE_TEXTURE_CLEARTYPE_3x1 = 0x00000001,
}

enum IID_IDWriteGlyphRunAnalysis = GUID(0x7d97dbf7, 0xe085, 0x42d4, [0x81, 0xe3, 0x6a, 0x88, 0x3b, 0xde, 0xd1, 0x18]);
interface IDWriteGlyphRunAnalysis : IUnknown
{
    HRESULT GetAlphaTextureBounds(DWRITE_TEXTURE_TYPE, RECT*);
    HRESULT CreateAlphaTexture(DWRITE_TEXTURE_TYPE, const(RECT)*, ubyte*, uint);
    HRESULT GetAlphaBlendParams(IDWriteRenderingParams, float*, float*, float*);
}
enum IID_IDWriteFactory = GUID(0xb859ee5a, 0xd838, 0x4b5b, [0xa2, 0xe8, 0x1a, 0xdc, 0x7d, 0x93, 0xdb, 0x48]);
interface IDWriteFactory : IUnknown
{
    HRESULT GetSystemFontCollection(IDWriteFontCollection*, BOOL);
    HRESULT CreateCustomFontCollection(IDWriteFontCollectionLoader, const(void)*, uint, IDWriteFontCollection*);
    HRESULT RegisterFontCollectionLoader(IDWriteFontCollectionLoader);
    HRESULT UnregisterFontCollectionLoader(IDWriteFontCollectionLoader);
    HRESULT CreateFontFileReference(const(wchar)*, const(FILETIME)*, IDWriteFontFile*);
    HRESULT CreateCustomFontFileReference(const(void)*, uint, IDWriteFontFileLoader, IDWriteFontFile*);
    HRESULT CreateFontFace(DWRITE_FONT_FACE_TYPE, uint, IDWriteFontFile*, uint, DWRITE_FONT_SIMULATIONS, IDWriteFontFace*);
    HRESULT CreateRenderingParams(IDWriteRenderingParams*);
    HRESULT CreateMonitorRenderingParams(HMONITOR, IDWriteRenderingParams*);
    HRESULT CreateCustomRenderingParams(float, float, float, DWRITE_PIXEL_GEOMETRY, DWRITE_RENDERING_MODE, IDWriteRenderingParams*);
    HRESULT RegisterFontFileLoader(IDWriteFontFileLoader);
    HRESULT UnregisterFontFileLoader(IDWriteFontFileLoader);
    HRESULT CreateTextFormat(const(wchar)*, IDWriteFontCollection, DWRITE_FONT_WEIGHT, DWRITE_FONT_STYLE, DWRITE_FONT_STRETCH, float, const(wchar)*, IDWriteTextFormat*);
    HRESULT CreateTypography(IDWriteTypography*);
    HRESULT GetGdiInterop(IDWriteGdiInterop*);
    HRESULT CreateTextLayout(const(wchar)*, uint, IDWriteTextFormat, float, float, IDWriteTextLayout*);
    HRESULT CreateGdiCompatibleTextLayout(const(wchar)*, uint, IDWriteTextFormat, float, float, float, const(DWRITE_MATRIX)*, BOOL, IDWriteTextLayout*);
    HRESULT CreateEllipsisTrimmingSign(IDWriteTextFormat, IDWriteInlineObject*);
    HRESULT CreateTextAnalyzer(IDWriteTextAnalyzer*);
    HRESULT CreateNumberSubstitution(DWRITE_NUMBER_SUBSTITUTION_METHOD, const(wchar)*, BOOL, IDWriteNumberSubstitution*);
    HRESULT CreateGlyphRunAnalysis(const(DWRITE_GLYPH_RUN)*, float, const(DWRITE_MATRIX)*, DWRITE_RENDERING_MODE, DWRITE_MEASURING_MODE, float, float, IDWriteGlyphRunAnalysis*);
}
alias DWRITE_PANOSE_FAMILY = int;
enum : int
{
    DWRITE_PANOSE_FAMILY_ANY          = 0x00000000,
    DWRITE_PANOSE_FAMILY_NO_FIT       = 0x00000001,
    DWRITE_PANOSE_FAMILY_TEXT_DISPLAY = 0x00000002,
    DWRITE_PANOSE_FAMILY_SCRIPT       = 0x00000003,
    DWRITE_PANOSE_FAMILY_DECORATIVE   = 0x00000004,
    DWRITE_PANOSE_FAMILY_SYMBOL       = 0x00000005,
    DWRITE_PANOSE_FAMILY_PICTORIAL    = 0x00000005,
}

alias DWRITE_PANOSE_SERIF_STYLE = int;
enum : int
{
    DWRITE_PANOSE_SERIF_STYLE_ANY                = 0x00000000,
    DWRITE_PANOSE_SERIF_STYLE_NO_FIT             = 0x00000001,
    DWRITE_PANOSE_SERIF_STYLE_COVE               = 0x00000002,
    DWRITE_PANOSE_SERIF_STYLE_OBTUSE_COVE        = 0x00000003,
    DWRITE_PANOSE_SERIF_STYLE_SQUARE_COVE        = 0x00000004,
    DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SQUARE_COVE = 0x00000005,
    DWRITE_PANOSE_SERIF_STYLE_SQUARE             = 0x00000006,
    DWRITE_PANOSE_SERIF_STYLE_THIN               = 0x00000007,
    DWRITE_PANOSE_SERIF_STYLE_OVAL               = 0x00000008,
    DWRITE_PANOSE_SERIF_STYLE_EXAGGERATED        = 0x00000009,
    DWRITE_PANOSE_SERIF_STYLE_TRIANGLE           = 0x0000000a,
    DWRITE_PANOSE_SERIF_STYLE_NORMAL_SANS        = 0x0000000b,
    DWRITE_PANOSE_SERIF_STYLE_OBTUSE_SANS        = 0x0000000c,
    DWRITE_PANOSE_SERIF_STYLE_PERPENDICULAR_SANS = 0x0000000d,
    DWRITE_PANOSE_SERIF_STYLE_FLARED             = 0x0000000e,
    DWRITE_PANOSE_SERIF_STYLE_ROUNDED            = 0x0000000f,
    DWRITE_PANOSE_SERIF_STYLE_SCRIPT             = 0x00000010,
    DWRITE_PANOSE_SERIF_STYLE_PERP_SANS          = 0x0000000d,
    DWRITE_PANOSE_SERIF_STYLE_BONE               = 0x00000008,
}

alias DWRITE_PANOSE_WEIGHT = int;
enum : int
{
    DWRITE_PANOSE_WEIGHT_ANY         = 0x00000000,
    DWRITE_PANOSE_WEIGHT_NO_FIT      = 0x00000001,
    DWRITE_PANOSE_WEIGHT_VERY_LIGHT  = 0x00000002,
    DWRITE_PANOSE_WEIGHT_LIGHT       = 0x00000003,
    DWRITE_PANOSE_WEIGHT_THIN        = 0x00000004,
    DWRITE_PANOSE_WEIGHT_BOOK        = 0x00000005,
    DWRITE_PANOSE_WEIGHT_MEDIUM      = 0x00000006,
    DWRITE_PANOSE_WEIGHT_DEMI        = 0x00000007,
    DWRITE_PANOSE_WEIGHT_BOLD        = 0x00000008,
    DWRITE_PANOSE_WEIGHT_HEAVY       = 0x00000009,
    DWRITE_PANOSE_WEIGHT_BLACK       = 0x0000000a,
    DWRITE_PANOSE_WEIGHT_EXTRA_BLACK = 0x0000000b,
    DWRITE_PANOSE_WEIGHT_NORD        = 0x0000000b,
}

alias DWRITE_PANOSE_PROPORTION = int;
enum : int
{
    DWRITE_PANOSE_PROPORTION_ANY            = 0x00000000,
    DWRITE_PANOSE_PROPORTION_NO_FIT         = 0x00000001,
    DWRITE_PANOSE_PROPORTION_OLD_STYLE      = 0x00000002,
    DWRITE_PANOSE_PROPORTION_MODERN         = 0x00000003,
    DWRITE_PANOSE_PROPORTION_EVEN_WIDTH     = 0x00000004,
    DWRITE_PANOSE_PROPORTION_EXPANDED       = 0x00000005,
    DWRITE_PANOSE_PROPORTION_CONDENSED      = 0x00000006,
    DWRITE_PANOSE_PROPORTION_VERY_EXPANDED  = 0x00000007,
    DWRITE_PANOSE_PROPORTION_VERY_CONDENSED = 0x00000008,
    DWRITE_PANOSE_PROPORTION_MONOSPACED     = 0x00000009,
}

alias DWRITE_PANOSE_CONTRAST = int;
enum : int
{
    DWRITE_PANOSE_CONTRAST_ANY               = 0x00000000,
    DWRITE_PANOSE_CONTRAST_NO_FIT            = 0x00000001,
    DWRITE_PANOSE_CONTRAST_NONE              = 0x00000002,
    DWRITE_PANOSE_CONTRAST_VERY_LOW          = 0x00000003,
    DWRITE_PANOSE_CONTRAST_LOW               = 0x00000004,
    DWRITE_PANOSE_CONTRAST_MEDIUM_LOW        = 0x00000005,
    DWRITE_PANOSE_CONTRAST_MEDIUM            = 0x00000006,
    DWRITE_PANOSE_CONTRAST_MEDIUM_HIGH       = 0x00000007,
    DWRITE_PANOSE_CONTRAST_HIGH              = 0x00000008,
    DWRITE_PANOSE_CONTRAST_VERY_HIGH         = 0x00000009,
    DWRITE_PANOSE_CONTRAST_HORIZONTAL_LOW    = 0x0000000a,
    DWRITE_PANOSE_CONTRAST_HORIZONTAL_MEDIUM = 0x0000000b,
    DWRITE_PANOSE_CONTRAST_HORIZONTAL_HIGH   = 0x0000000c,
    DWRITE_PANOSE_CONTRAST_BROKEN            = 0x0000000d,
}

alias DWRITE_PANOSE_STROKE_VARIATION = int;
enum : int
{
    DWRITE_PANOSE_STROKE_VARIATION_ANY                  = 0x00000000,
    DWRITE_PANOSE_STROKE_VARIATION_NO_FIT               = 0x00000001,
    DWRITE_PANOSE_STROKE_VARIATION_NO_VARIATION         = 0x00000002,
    DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_DIAGONAL     = 0x00000003,
    DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_TRANSITIONAL = 0x00000004,
    DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_VERTICAL     = 0x00000005,
    DWRITE_PANOSE_STROKE_VARIATION_GRADUAL_HORIZONTAL   = 0x00000006,
    DWRITE_PANOSE_STROKE_VARIATION_RAPID_VERTICAL       = 0x00000007,
    DWRITE_PANOSE_STROKE_VARIATION_RAPID_HORIZONTAL     = 0x00000008,
    DWRITE_PANOSE_STROKE_VARIATION_INSTANT_VERTICAL     = 0x00000009,
    DWRITE_PANOSE_STROKE_VARIATION_INSTANT_HORIZONTAL   = 0x0000000a,
}

alias DWRITE_PANOSE_ARM_STYLE = int;
enum : int
{
    DWRITE_PANOSE_ARM_STYLE_ANY                           = 0x00000000,
    DWRITE_PANOSE_ARM_STYLE_NO_FIT                        = 0x00000001,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORIZONTAL      = 0x00000002,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_WEDGE           = 0x00000003,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERTICAL        = 0x00000004,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_SINGLE_SERIF    = 0x00000005,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_DOUBLE_SERIF    = 0x00000006,
    DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_HORIZONTAL   = 0x00000007,
    DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_WEDGE        = 0x00000008,
    DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_VERTICAL     = 0x00000009,
    DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_SINGLE_SERIF = 0x0000000a,
    DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_DOUBLE_SERIF = 0x0000000b,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORZ            = 0x00000002,
    DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERT            = 0x00000004,
    DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_HORZ                = 0x00000007,
    DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_WEDGE               = 0x00000008,
    DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_VERT                = 0x00000009,
    DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_SINGLE_SERIF        = 0x0000000a,
    DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_DOUBLE_SERIF        = 0x0000000b,
}

alias DWRITE_PANOSE_LETTERFORM = int;
enum : int
{
    DWRITE_PANOSE_LETTERFORM_ANY                = 0x00000000,
    DWRITE_PANOSE_LETTERFORM_NO_FIT             = 0x00000001,
    DWRITE_PANOSE_LETTERFORM_NORMAL_CONTACT     = 0x00000002,
    DWRITE_PANOSE_LETTERFORM_NORMAL_WEIGHTED    = 0x00000003,
    DWRITE_PANOSE_LETTERFORM_NORMAL_BOXED       = 0x00000004,
    DWRITE_PANOSE_LETTERFORM_NORMAL_FLATTENED   = 0x00000005,
    DWRITE_PANOSE_LETTERFORM_NORMAL_ROUNDED     = 0x00000006,
    DWRITE_PANOSE_LETTERFORM_NORMAL_OFF_CENTER  = 0x00000007,
    DWRITE_PANOSE_LETTERFORM_NORMAL_SQUARE      = 0x00000008,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_CONTACT    = 0x00000009,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_WEIGHTED   = 0x0000000a,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_BOXED      = 0x0000000b,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_FLATTENED  = 0x0000000c,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_ROUNDED    = 0x0000000d,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_OFF_CENTER = 0x0000000e,
    DWRITE_PANOSE_LETTERFORM_OBLIQUE_SQUARE     = 0x0000000f,
}

alias DWRITE_PANOSE_MIDLINE = int;
enum : int
{
    DWRITE_PANOSE_MIDLINE_ANY              = 0x00000000,
    DWRITE_PANOSE_MIDLINE_NO_FIT           = 0x00000001,
    DWRITE_PANOSE_MIDLINE_STANDARD_TRIMMED = 0x00000002,
    DWRITE_PANOSE_MIDLINE_STANDARD_POINTED = 0x00000003,
    DWRITE_PANOSE_MIDLINE_STANDARD_SERIFED = 0x00000004,
    DWRITE_PANOSE_MIDLINE_HIGH_TRIMMED     = 0x00000005,
    DWRITE_PANOSE_MIDLINE_HIGH_POINTED     = 0x00000006,
    DWRITE_PANOSE_MIDLINE_HIGH_SERIFED     = 0x00000007,
    DWRITE_PANOSE_MIDLINE_CONSTANT_TRIMMED = 0x00000008,
    DWRITE_PANOSE_MIDLINE_CONSTANT_POINTED = 0x00000009,
    DWRITE_PANOSE_MIDLINE_CONSTANT_SERIFED = 0x0000000a,
    DWRITE_PANOSE_MIDLINE_LOW_TRIMMED      = 0x0000000b,
    DWRITE_PANOSE_MIDLINE_LOW_POINTED      = 0x0000000c,
    DWRITE_PANOSE_MIDLINE_LOW_SERIFED      = 0x0000000d,
}

alias DWRITE_PANOSE_XHEIGHT = int;
enum : int
{
    DWRITE_PANOSE_XHEIGHT_ANY               = 0x00000000,
    DWRITE_PANOSE_XHEIGHT_NO_FIT            = 0x00000001,
    DWRITE_PANOSE_XHEIGHT_CONSTANT_SMALL    = 0x00000002,
    DWRITE_PANOSE_XHEIGHT_CONSTANT_STANDARD = 0x00000003,
    DWRITE_PANOSE_XHEIGHT_CONSTANT_LARGE    = 0x00000004,
    DWRITE_PANOSE_XHEIGHT_DUCKING_SMALL     = 0x00000005,
    DWRITE_PANOSE_XHEIGHT_DUCKING_STANDARD  = 0x00000006,
    DWRITE_PANOSE_XHEIGHT_DUCKING_LARGE     = 0x00000007,
    DWRITE_PANOSE_XHEIGHT_CONSTANT_STD      = 0x00000003,
    DWRITE_PANOSE_XHEIGHT_DUCKING_STD       = 0x00000006,
}

alias DWRITE_PANOSE_TOOL_KIND = int;
enum : int
{
    DWRITE_PANOSE_TOOL_KIND_ANY                = 0x00000000,
    DWRITE_PANOSE_TOOL_KIND_NO_FIT             = 0x00000001,
    DWRITE_PANOSE_TOOL_KIND_FLAT_NIB           = 0x00000002,
    DWRITE_PANOSE_TOOL_KIND_PRESSURE_POINT     = 0x00000003,
    DWRITE_PANOSE_TOOL_KIND_ENGRAVED           = 0x00000004,
    DWRITE_PANOSE_TOOL_KIND_BALL               = 0x00000005,
    DWRITE_PANOSE_TOOL_KIND_BRUSH              = 0x00000006,
    DWRITE_PANOSE_TOOL_KIND_ROUGH              = 0x00000007,
    DWRITE_PANOSE_TOOL_KIND_FELT_PEN_BRUSH_TIP = 0x00000008,
    DWRITE_PANOSE_TOOL_KIND_WILD_BRUSH         = 0x00000009,
}

alias DWRITE_PANOSE_SPACING = int;
enum : int
{
    DWRITE_PANOSE_SPACING_ANY                 = 0x00000000,
    DWRITE_PANOSE_SPACING_NO_FIT              = 0x00000001,
    DWRITE_PANOSE_SPACING_PROPORTIONAL_SPACED = 0x00000002,
    DWRITE_PANOSE_SPACING_MONOSPACED          = 0x00000003,
}

alias DWRITE_PANOSE_ASPECT_RATIO = int;
enum : int
{
    DWRITE_PANOSE_ASPECT_RATIO_ANY            = 0x00000000,
    DWRITE_PANOSE_ASPECT_RATIO_NO_FIT         = 0x00000001,
    DWRITE_PANOSE_ASPECT_RATIO_VERY_CONDENSED = 0x00000002,
    DWRITE_PANOSE_ASPECT_RATIO_CONDENSED      = 0x00000003,
    DWRITE_PANOSE_ASPECT_RATIO_NORMAL         = 0x00000004,
    DWRITE_PANOSE_ASPECT_RATIO_EXPANDED       = 0x00000005,
    DWRITE_PANOSE_ASPECT_RATIO_VERY_EXPANDED  = 0x00000006,
}

alias DWRITE_PANOSE_SCRIPT_TOPOLOGY = int;
enum : int
{
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_ANY                      = 0x00000000,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_NO_FIT                   = 0x00000001,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_DISCONNECTED       = 0x00000002,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_TRAILING           = 0x00000003,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_CONNECTED          = 0x00000004,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_DISCONNECTED     = 0x00000005,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_TRAILING         = 0x00000006,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_CONNECTED        = 0x00000007,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_DISCONNECTED = 0x00000008,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_TRAILING     = 0x00000009,
    DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_CONNECTED    = 0x0000000a,
}

alias DWRITE_PANOSE_SCRIPT_FORM = int;
enum : int
{
    DWRITE_PANOSE_SCRIPT_FORM_ANY                          = 0x00000000,
    DWRITE_PANOSE_SCRIPT_FORM_NO_FIT                       = 0x00000001,
    DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_NO_WRAPPING          = 0x00000002,
    DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_SOME_WRAPPING        = 0x00000003,
    DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_MORE_WRAPPING        = 0x00000004,
    DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_EXTREME_WRAPPING     = 0x00000005,
    DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_NO_WRAPPING          = 0x00000006,
    DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_SOME_WRAPPING        = 0x00000007,
    DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_MORE_WRAPPING        = 0x00000008,
    DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_EXTREME_WRAPPING     = 0x00000009,
    DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_NO_WRAPPING      = 0x0000000a,
    DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_SOME_WRAPPING    = 0x0000000b,
    DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_MORE_WRAPPING    = 0x0000000c,
    DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_EXTREME_WRAPPING = 0x0000000d,
}

alias DWRITE_PANOSE_FINIALS = int;
enum : int
{
    DWRITE_PANOSE_FINIALS_ANY                  = 0x00000000,
    DWRITE_PANOSE_FINIALS_NO_FIT               = 0x00000001,
    DWRITE_PANOSE_FINIALS_NONE_NO_LOOPS        = 0x00000002,
    DWRITE_PANOSE_FINIALS_NONE_CLOSED_LOOPS    = 0x00000003,
    DWRITE_PANOSE_FINIALS_NONE_OPEN_LOOPS      = 0x00000004,
    DWRITE_PANOSE_FINIALS_SHARP_NO_LOOPS       = 0x00000005,
    DWRITE_PANOSE_FINIALS_SHARP_CLOSED_LOOPS   = 0x00000006,
    DWRITE_PANOSE_FINIALS_SHARP_OPEN_LOOPS     = 0x00000007,
    DWRITE_PANOSE_FINIALS_TAPERED_NO_LOOPS     = 0x00000008,
    DWRITE_PANOSE_FINIALS_TAPERED_CLOSED_LOOPS = 0x00000009,
    DWRITE_PANOSE_FINIALS_TAPERED_OPEN_LOOPS   = 0x0000000a,
    DWRITE_PANOSE_FINIALS_ROUND_NO_LOOPS       = 0x0000000b,
    DWRITE_PANOSE_FINIALS_ROUND_CLOSED_LOOPS   = 0x0000000c,
    DWRITE_PANOSE_FINIALS_ROUND_OPEN_LOOPS     = 0x0000000d,
}

alias DWRITE_PANOSE_XASCENT = int;
enum : int
{
    DWRITE_PANOSE_XASCENT_ANY       = 0x00000000,
    DWRITE_PANOSE_XASCENT_NO_FIT    = 0x00000001,
    DWRITE_PANOSE_XASCENT_VERY_LOW  = 0x00000002,
    DWRITE_PANOSE_XASCENT_LOW       = 0x00000003,
    DWRITE_PANOSE_XASCENT_MEDIUM    = 0x00000004,
    DWRITE_PANOSE_XASCENT_HIGH      = 0x00000005,
    DWRITE_PANOSE_XASCENT_VERY_HIGH = 0x00000006,
}

alias DWRITE_PANOSE_DECORATIVE_CLASS = int;
enum : int
{
    DWRITE_PANOSE_DECORATIVE_CLASS_ANY                  = 0x00000000,
    DWRITE_PANOSE_DECORATIVE_CLASS_NO_FIT               = 0x00000001,
    DWRITE_PANOSE_DECORATIVE_CLASS_DERIVATIVE           = 0x00000002,
    DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_TOPOLOGY = 0x00000003,
    DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ELEMENTS = 0x00000004,
    DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ASPECT   = 0x00000005,
    DWRITE_PANOSE_DECORATIVE_CLASS_INITIALS             = 0x00000006,
    DWRITE_PANOSE_DECORATIVE_CLASS_CARTOON              = 0x00000007,
    DWRITE_PANOSE_DECORATIVE_CLASS_PICTURE_STEMS        = 0x00000008,
    DWRITE_PANOSE_DECORATIVE_CLASS_ORNAMENTED           = 0x00000009,
    DWRITE_PANOSE_DECORATIVE_CLASS_TEXT_AND_BACKGROUND  = 0x0000000a,
    DWRITE_PANOSE_DECORATIVE_CLASS_COLLAGE              = 0x0000000b,
    DWRITE_PANOSE_DECORATIVE_CLASS_MONTAGE              = 0x0000000c,
}

alias DWRITE_PANOSE_ASPECT = int;
enum : int
{
    DWRITE_PANOSE_ASPECT_ANY             = 0x00000000,
    DWRITE_PANOSE_ASPECT_NO_FIT          = 0x00000001,
    DWRITE_PANOSE_ASPECT_SUPER_CONDENSED = 0x00000002,
    DWRITE_PANOSE_ASPECT_VERY_CONDENSED  = 0x00000003,
    DWRITE_PANOSE_ASPECT_CONDENSED       = 0x00000004,
    DWRITE_PANOSE_ASPECT_NORMAL          = 0x00000005,
    DWRITE_PANOSE_ASPECT_EXTENDED        = 0x00000006,
    DWRITE_PANOSE_ASPECT_VERY_EXTENDED   = 0x00000007,
    DWRITE_PANOSE_ASPECT_SUPER_EXTENDED  = 0x00000008,
    DWRITE_PANOSE_ASPECT_MONOSPACED      = 0x00000009,
}

alias DWRITE_PANOSE_FILL = int;
enum : int
{
    DWRITE_PANOSE_FILL_ANY                 = 0x00000000,
    DWRITE_PANOSE_FILL_NO_FIT              = 0x00000001,
    DWRITE_PANOSE_FILL_STANDARD_SOLID_FILL = 0x00000002,
    DWRITE_PANOSE_FILL_NO_FILL             = 0x00000003,
    DWRITE_PANOSE_FILL_PATTERNED_FILL      = 0x00000004,
    DWRITE_PANOSE_FILL_COMPLEX_FILL        = 0x00000005,
    DWRITE_PANOSE_FILL_SHAPED_FILL         = 0x00000006,
    DWRITE_PANOSE_FILL_DRAWN_DISTRESSED    = 0x00000007,
}

alias DWRITE_PANOSE_LINING = int;
enum : int
{
    DWRITE_PANOSE_LINING_ANY      = 0x00000000,
    DWRITE_PANOSE_LINING_NO_FIT   = 0x00000001,
    DWRITE_PANOSE_LINING_NONE     = 0x00000002,
    DWRITE_PANOSE_LINING_INLINE   = 0x00000003,
    DWRITE_PANOSE_LINING_OUTLINE  = 0x00000004,
    DWRITE_PANOSE_LINING_ENGRAVED = 0x00000005,
    DWRITE_PANOSE_LINING_SHADOW   = 0x00000006,
    DWRITE_PANOSE_LINING_RELIEF   = 0x00000007,
    DWRITE_PANOSE_LINING_BACKDROP = 0x00000008,
}

alias DWRITE_PANOSE_DECORATIVE_TOPOLOGY = int;
enum : int
{
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ANY                      = 0x00000000,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_NO_FIT                   = 0x00000001,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_STANDARD                 = 0x00000002,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SQUARE                   = 0x00000003,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_MULTIPLE_SEGMENT         = 0x00000004,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ART_DECO                 = 0x00000005,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UNEVEN_WEIGHTING         = 0x00000006,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_ARMS             = 0x00000007,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_FORMS            = 0x00000008,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_LOMBARDIC_FORMS          = 0x00000009,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UPPER_CASE_IN_LOWER_CASE = 0x0000000a,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_IMPLIED_TOPOLOGY         = 0x0000000b,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_HORSESHOE_E_AND_A        = 0x0000000c,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_CURSIVE                  = 0x0000000d,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_BLACKLETTER              = 0x0000000e,
    DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SWASH_VARIANCE           = 0x0000000f,
}

alias DWRITE_PANOSE_CHARACTER_RANGES = int;
enum : int
{
    DWRITE_PANOSE_CHARACTER_RANGES_ANY                 = 0x00000000,
    DWRITE_PANOSE_CHARACTER_RANGES_NO_FIT              = 0x00000001,
    DWRITE_PANOSE_CHARACTER_RANGES_EXTENDED_COLLECTION = 0x00000002,
    DWRITE_PANOSE_CHARACTER_RANGES_LITERALS            = 0x00000003,
    DWRITE_PANOSE_CHARACTER_RANGES_NO_LOWER_CASE       = 0x00000004,
    DWRITE_PANOSE_CHARACTER_RANGES_SMALL_CAPS          = 0x00000005,
}

alias DWRITE_PANOSE_SYMBOL_KIND = int;
enum : int
{
    DWRITE_PANOSE_SYMBOL_KIND_ANY               = 0x00000000,
    DWRITE_PANOSE_SYMBOL_KIND_NO_FIT            = 0x00000001,
    DWRITE_PANOSE_SYMBOL_KIND_MONTAGES          = 0x00000002,
    DWRITE_PANOSE_SYMBOL_KIND_PICTURES          = 0x00000003,
    DWRITE_PANOSE_SYMBOL_KIND_SHAPES            = 0x00000004,
    DWRITE_PANOSE_SYMBOL_KIND_SCIENTIFIC        = 0x00000005,
    DWRITE_PANOSE_SYMBOL_KIND_MUSIC             = 0x00000006,
    DWRITE_PANOSE_SYMBOL_KIND_EXPERT            = 0x00000007,
    DWRITE_PANOSE_SYMBOL_KIND_PATTERNS          = 0x00000008,
    DWRITE_PANOSE_SYMBOL_KIND_BOARDERS          = 0x00000009,
    DWRITE_PANOSE_SYMBOL_KIND_ICONS             = 0x0000000a,
    DWRITE_PANOSE_SYMBOL_KIND_LOGOS             = 0x0000000b,
    DWRITE_PANOSE_SYMBOL_KIND_INDUSTRY_SPECIFIC = 0x0000000c,
}

alias DWRITE_PANOSE_SYMBOL_ASPECT_RATIO = int;
enum : int
{
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_ANY                = 0x00000000,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_FIT             = 0x00000001,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_WIDTH           = 0x00000002,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_EXCEPTIONALLY_WIDE = 0x00000003,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_SUPER_WIDE         = 0x00000004,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_WIDE          = 0x00000005,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_WIDE               = 0x00000006,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NORMAL             = 0x00000007,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NARROW             = 0x00000008,
    DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_NARROW        = 0x00000009,
}

alias DWRITE_OUTLINE_THRESHOLD = int;
enum : int
{
    DWRITE_OUTLINE_THRESHOLD_ANTIALIASED = 0x00000000,
    DWRITE_OUTLINE_THRESHOLD_ALIASED     = 0x00000001,
}

alias DWRITE_BASELINE = int;
enum : int
{
    DWRITE_BASELINE_DEFAULT            = 0x00000000,
    DWRITE_BASELINE_ROMAN              = 0x00000001,
    DWRITE_BASELINE_CENTRAL            = 0x00000002,
    DWRITE_BASELINE_MATH               = 0x00000003,
    DWRITE_BASELINE_HANGING            = 0x00000004,
    DWRITE_BASELINE_IDEOGRAPHIC_BOTTOM = 0x00000005,
    DWRITE_BASELINE_IDEOGRAPHIC_TOP    = 0x00000006,
    DWRITE_BASELINE_MINIMUM            = 0x00000007,
    DWRITE_BASELINE_MAXIMUM            = 0x00000008,
}

alias DWRITE_VERTICAL_GLYPH_ORIENTATION = int;
enum : int
{
    DWRITE_VERTICAL_GLYPH_ORIENTATION_DEFAULT = 0x00000000,
    DWRITE_VERTICAL_GLYPH_ORIENTATION_STACKED = 0x00000001,
}

alias DWRITE_GLYPH_ORIENTATION_ANGLE = int;
enum : int
{
    DWRITE_GLYPH_ORIENTATION_ANGLE_0_DEGREES   = 0x00000000,
    DWRITE_GLYPH_ORIENTATION_ANGLE_90_DEGREES  = 0x00000001,
    DWRITE_GLYPH_ORIENTATION_ANGLE_180_DEGREES = 0x00000002,
    DWRITE_GLYPH_ORIENTATION_ANGLE_270_DEGREES = 0x00000003,
}

struct DWRITE_FONT_METRICS1
{
    DWRITE_FONT_METRICS Base;
    short glyphBoxLeft;
    short glyphBoxTop;
    short glyphBoxRight;
    short glyphBoxBottom;
    short subscriptPositionX;
    short subscriptPositionY;
    short subscriptSizeX;
    short subscriptSizeY;
    short superscriptPositionX;
    short superscriptPositionY;
    short superscriptSizeX;
    short superscriptSizeY;
    BOOL hasTypographicMetrics;
}
struct DWRITE_CARET_METRICS
{
    short slopeRise;
    short slopeRun;
    short offset;
}
union DWRITE_PANOSE
{
    ubyte[10] values;
    ubyte familyKind;
    struct _text_e__Struct
    {
        ubyte familyKind;
        ubyte serifStyle;
        ubyte weight;
        ubyte proportion;
        ubyte contrast;
        ubyte strokeVariation;
        ubyte armStyle;
        ubyte letterform;
        ubyte midline;
        ubyte xHeight;
    }
    struct _script_e__Struct
    {
        ubyte familyKind;
        ubyte toolKind;
        ubyte weight;
        ubyte spacing;
        ubyte aspectRatio;
        ubyte contrast;
        ubyte scriptTopology;
        ubyte scriptForm;
        ubyte finials;
        ubyte xAscent;
    }
    struct _decorative_e__Struct
    {
        ubyte familyKind;
        ubyte decorativeClass;
        ubyte weight;
        ubyte aspect;
        ubyte contrast;
        ubyte serifVariant;
        ubyte fill;
        ubyte lining;
        ubyte decorativeTopology;
        ubyte characterRange;
    }
    struct _symbol_e__Struct
    {
        ubyte familyKind;
        ubyte symbolKind;
        ubyte weight;
        ubyte spacing;
        ubyte aspectRatioAndContrast;
        ubyte aspectRatio94;
        ubyte aspectRatio119;
        ubyte aspectRatio157;
        ubyte aspectRatio163;
        ubyte aspectRatio211;
    }
}
struct DWRITE_UNICODE_RANGE
{
    uint first;
    uint last;
}
struct DWRITE_SCRIPT_PROPERTIES
{
    uint isoScriptCode;
    uint isoScriptNumber;
    uint clusterLookahead;
    uint justificationCharacter;
    uint _bitfield0;
}
struct DWRITE_JUSTIFICATION_OPPORTUNITY
{
    float expansionMinimum;
    float expansionMaximum;
    float compressionMaximum;
    uint _bitfield0;
}
enum IID_IDWriteFactory1 = GUID(0x30572f99, 0xdac6, 0x41db, [0xa1, 0x6e, 0x4, 0x86, 0x30, 0x7e, 0x60, 0x6a]);
interface IDWriteFactory1 : IDWriteFactory
{
    HRESULT GetEudcFontCollection(IDWriteFontCollection*, BOOL);
    HRESULT CreateCustomRenderingParams(float, float, float, float, DWRITE_PIXEL_GEOMETRY, DWRITE_RENDERING_MODE, IDWriteRenderingParams1*);
}
enum IID_IDWriteFontFace1 = GUID(0xa71efdb4, 0x9fdb, 0x4838, [0xad, 0x90, 0xcf, 0xc3, 0xbe, 0x8c, 0x3d, 0xaf]);
interface IDWriteFontFace1 : IDWriteFontFace
{
    void GetMetrics(DWRITE_FONT_METRICS1*);
    HRESULT GetGdiCompatibleMetrics(float, float, const(DWRITE_MATRIX)*, DWRITE_FONT_METRICS1*);
    void GetCaretMetrics(DWRITE_CARET_METRICS*);
    HRESULT GetUnicodeRanges(uint, DWRITE_UNICODE_RANGE*, uint*);
    BOOL IsMonospacedFont();
    HRESULT GetDesignGlyphAdvances(uint, const(ushort)*, int*, BOOL);
    HRESULT GetGdiCompatibleGlyphAdvances(float, float, const(DWRITE_MATRIX)*, BOOL, BOOL, uint, const(ushort)*, int*);
    HRESULT GetKerningPairAdjustments(uint, const(ushort)*, int*);
    BOOL HasKerningPairs();
    HRESULT GetRecommendedRenderingMode(float, float, float, const(DWRITE_MATRIX)*, BOOL, DWRITE_OUTLINE_THRESHOLD, DWRITE_MEASURING_MODE, DWRITE_RENDERING_MODE*);
    HRESULT GetVerticalGlyphVariants(uint, const(ushort)*, ushort*);
    BOOL HasVerticalGlyphVariants();
}
enum IID_IDWriteFont1 = GUID(0xacd16696, 0x8c14, 0x4f5d, [0x87, 0x7e, 0xfe, 0x3f, 0xc1, 0xd3, 0x27, 0x38]);
interface IDWriteFont1 : IDWriteFont
{
    void GetMetrics(DWRITE_FONT_METRICS1*);
    void GetPanose(DWRITE_PANOSE*);
    HRESULT GetUnicodeRanges(uint, DWRITE_UNICODE_RANGE*, uint*);
    BOOL IsMonospacedFont();
}
enum IID_IDWriteRenderingParams1 = GUID(0x94413cf4, 0xa6fc, 0x4248, [0x8b, 0x50, 0x66, 0x74, 0x34, 0x8f, 0xca, 0xd3]);
interface IDWriteRenderingParams1 : IDWriteRenderingParams
{
    float GetGrayscaleEnhancedContrast();
}
enum IID_IDWriteTextAnalyzer1 = GUID(0x80dad800, 0xe21f, 0x4e83, [0x96, 0xce, 0xbf, 0xcc, 0xe5, 0x0, 0xdb, 0x7c]);
interface IDWriteTextAnalyzer1 : IDWriteTextAnalyzer
{
    HRESULT ApplyCharacterSpacing(float, float, float, uint, uint, const(ushort)*, const(float)*, const(DWRITE_GLYPH_OFFSET)*, const(DWRITE_SHAPING_GLYPH_PROPERTIES)*, float*, DWRITE_GLYPH_OFFSET*);
    HRESULT GetBaseline(IDWriteFontFace, DWRITE_BASELINE, BOOL, BOOL, DWRITE_SCRIPT_ANALYSIS, const(wchar)*, int*, BOOL*);
    HRESULT AnalyzeVerticalGlyphOrientation(IDWriteTextAnalysisSource1, uint, uint, IDWriteTextAnalysisSink1);
    HRESULT GetGlyphOrientationTransform(DWRITE_GLYPH_ORIENTATION_ANGLE, BOOL, DWRITE_MATRIX*);
    HRESULT GetScriptProperties(DWRITE_SCRIPT_ANALYSIS, DWRITE_SCRIPT_PROPERTIES*);
    HRESULT GetTextComplexity(const(wchar)*, uint, IDWriteFontFace, BOOL*, uint*, ushort*);
    HRESULT GetJustificationOpportunities(IDWriteFontFace, float, DWRITE_SCRIPT_ANALYSIS, uint, uint, const(wchar)*, const(ushort)*, const(DWRITE_SHAPING_GLYPH_PROPERTIES)*, DWRITE_JUSTIFICATION_OPPORTUNITY*);
    HRESULT JustifyGlyphAdvances(float, uint, const(DWRITE_JUSTIFICATION_OPPORTUNITY)*, const(float)*, const(DWRITE_GLYPH_OFFSET)*, float*, DWRITE_GLYPH_OFFSET*);
    HRESULT GetJustifiedGlyphs(IDWriteFontFace, float, DWRITE_SCRIPT_ANALYSIS, uint, uint, uint, const(ushort)*, const(ushort)*, const(float)*, const(float)*, const(DWRITE_GLYPH_OFFSET)*, const(DWRITE_SHAPING_GLYPH_PROPERTIES)*, uint*, ushort*, ushort*, float*, DWRITE_GLYPH_OFFSET*);
}
enum IID_IDWriteTextAnalysisSource1 = GUID(0x639cfad8, 0xfb4, 0x4b21, [0xa5, 0x8a, 0x6, 0x79, 0x20, 0x12, 0x0, 0x9]);
interface IDWriteTextAnalysisSource1 : IDWriteTextAnalysisSource
{
    HRESULT GetVerticalGlyphOrientation(uint, uint*, DWRITE_VERTICAL_GLYPH_ORIENTATION*, ubyte*);
}
enum IID_IDWriteTextAnalysisSink1 = GUID(0xb0d941a0, 0x85e7, 0x4d8b, [0x9f, 0xd3, 0x5c, 0xed, 0x99, 0x34, 0x48, 0x2a]);
interface IDWriteTextAnalysisSink1 : IDWriteTextAnalysisSink
{
    HRESULT SetGlyphOrientation(uint, uint, DWRITE_GLYPH_ORIENTATION_ANGLE, ubyte, BOOL, BOOL);
}
enum IID_IDWriteTextLayout1 = GUID(0x9064d822, 0x80a7, 0x465c, [0xa9, 0x86, 0xdf, 0x65, 0xf7, 0x8b, 0x8f, 0xeb]);
interface IDWriteTextLayout1 : IDWriteTextLayout
{
    HRESULT SetPairKerning(BOOL, DWRITE_TEXT_RANGE);
    HRESULT GetPairKerning(uint, BOOL*, DWRITE_TEXT_RANGE*);
    HRESULT SetCharacterSpacing(float, float, float, DWRITE_TEXT_RANGE);
    HRESULT GetCharacterSpacing(uint, float*, float*, float*, DWRITE_TEXT_RANGE*);
}
alias DWRITE_TEXT_ANTIALIAS_MODE = int;
enum : int
{
    DWRITE_TEXT_ANTIALIAS_MODE_CLEARTYPE = 0x00000000,
    DWRITE_TEXT_ANTIALIAS_MODE_GRAYSCALE = 0x00000001,
}

enum IID_IDWriteBitmapRenderTarget1 = GUID(0x791e8298, 0x3ef3, 0x4230, [0x98, 0x80, 0xc9, 0xbd, 0xec, 0xc4, 0x20, 0x64]);
interface IDWriteBitmapRenderTarget1 : IDWriteBitmapRenderTarget
{
    DWRITE_TEXT_ANTIALIAS_MODE GetTextAntialiasMode();
    HRESULT SetTextAntialiasMode(DWRITE_TEXT_ANTIALIAS_MODE);
}
alias DWRITE_OPTICAL_ALIGNMENT = int;
enum : int
{
    DWRITE_OPTICAL_ALIGNMENT_NONE             = 0x00000000,
    DWRITE_OPTICAL_ALIGNMENT_NO_SIDE_BEARINGS = 0x00000001,
}

alias DWRITE_GRID_FIT_MODE = int;
enum : int
{
    DWRITE_GRID_FIT_MODE_DEFAULT  = 0x00000000,
    DWRITE_GRID_FIT_MODE_DISABLED = 0x00000001,
    DWRITE_GRID_FIT_MODE_ENABLED  = 0x00000002,
}

struct DWRITE_TEXT_METRICS1
{
    DWRITE_TEXT_METRICS Base;
    float heightIncludingTrailingWhitespace;
}
enum IID_IDWriteTextRenderer1 = GUID(0xd3e0e934, 0x22a0, 0x427e, [0xaa, 0xe4, 0x7d, 0x95, 0x74, 0xb5, 0x9d, 0xb1]);
interface IDWriteTextRenderer1 : IDWriteTextRenderer
{
    HRESULT DrawGlyphRun(void*, float, float, DWRITE_GLYPH_ORIENTATION_ANGLE, DWRITE_MEASURING_MODE, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, IUnknown);
    HRESULT DrawUnderline(void*, float, float, DWRITE_GLYPH_ORIENTATION_ANGLE, const(DWRITE_UNDERLINE)*, IUnknown);
    HRESULT DrawStrikethrough(void*, float, float, DWRITE_GLYPH_ORIENTATION_ANGLE, const(DWRITE_STRIKETHROUGH)*, IUnknown);
    HRESULT DrawInlineObject(void*, float, float, DWRITE_GLYPH_ORIENTATION_ANGLE, IDWriteInlineObject, BOOL, BOOL, IUnknown);
}
enum IID_IDWriteTextFormat1 = GUID(0x5f174b49, 0xd8b, 0x4cfb, [0x8b, 0xca, 0xf1, 0xcc, 0xe9, 0xd0, 0x6c, 0x67]);
interface IDWriteTextFormat1 : IDWriteTextFormat
{
    HRESULT SetVerticalGlyphOrientation(DWRITE_VERTICAL_GLYPH_ORIENTATION);
    DWRITE_VERTICAL_GLYPH_ORIENTATION GetVerticalGlyphOrientation();
    HRESULT SetLastLineWrapping(BOOL);
    BOOL GetLastLineWrapping();
    HRESULT SetOpticalAlignment(DWRITE_OPTICAL_ALIGNMENT);
    DWRITE_OPTICAL_ALIGNMENT GetOpticalAlignment();
    HRESULT SetFontFallback(IDWriteFontFallback);
    HRESULT GetFontFallback(IDWriteFontFallback*);
}
enum IID_IDWriteTextLayout2 = GUID(0x1093c18f, 0x8d5e, 0x43f0, [0xb0, 0x64, 0x9, 0x17, 0x31, 0x1b, 0x52, 0x5e]);
interface IDWriteTextLayout2 : IDWriteTextLayout1
{
    HRESULT GetMetrics(DWRITE_TEXT_METRICS1*);
    HRESULT SetVerticalGlyphOrientation(DWRITE_VERTICAL_GLYPH_ORIENTATION);
    DWRITE_VERTICAL_GLYPH_ORIENTATION GetVerticalGlyphOrientation();
    HRESULT SetLastLineWrapping(BOOL);
    BOOL GetLastLineWrapping();
    HRESULT SetOpticalAlignment(DWRITE_OPTICAL_ALIGNMENT);
    DWRITE_OPTICAL_ALIGNMENT GetOpticalAlignment();
    HRESULT SetFontFallback(IDWriteFontFallback);
    HRESULT GetFontFallback(IDWriteFontFallback*);
}
enum IID_IDWriteTextAnalyzer2 = GUID(0x553a9ff3, 0x5693, 0x4df7, [0xb5, 0x2b, 0x74, 0x80, 0x6f, 0x7f, 0x2e, 0xb9]);
interface IDWriteTextAnalyzer2 : IDWriteTextAnalyzer1
{
    HRESULT GetGlyphOrientationTransform(DWRITE_GLYPH_ORIENTATION_ANGLE, BOOL, float, float, DWRITE_MATRIX*);
    HRESULT GetTypographicFeatures(IDWriteFontFace, DWRITE_SCRIPT_ANALYSIS, const(wchar)*, uint, uint*, DWRITE_FONT_FEATURE_TAG*);
    HRESULT CheckTypographicFeature(IDWriteFontFace, DWRITE_SCRIPT_ANALYSIS, const(wchar)*, DWRITE_FONT_FEATURE_TAG, uint, const(ushort)*, ubyte*);
}
enum IID_IDWriteFontFallback = GUID(0xefa008f9, 0xf7a1, 0x48bf, [0xb0, 0x5c, 0xf2, 0x24, 0x71, 0x3c, 0xc0, 0xff]);
interface IDWriteFontFallback : IUnknown
{
    HRESULT MapCharacters(IDWriteTextAnalysisSource, uint, uint, IDWriteFontCollection, const(wchar)*, DWRITE_FONT_WEIGHT, DWRITE_FONT_STYLE, DWRITE_FONT_STRETCH, uint*, IDWriteFont*, float*);
}
enum IID_IDWriteFontFallbackBuilder = GUID(0xfd882d06, 0x8aba, 0x4fb8, [0xb8, 0x49, 0x8b, 0xe8, 0xb7, 0x3e, 0x14, 0xde]);
interface IDWriteFontFallbackBuilder : IUnknown
{
    HRESULT AddMapping(const(DWRITE_UNICODE_RANGE)*, uint, const(ushort)**, uint, IDWriteFontCollection, const(wchar)*, const(wchar)*, float);
    HRESULT AddMappings(IDWriteFontFallback);
    HRESULT CreateFontFallback(IDWriteFontFallback*);
}
enum IID_IDWriteFont2 = GUID(0x29748ed6, 0x8c9c, 0x4a6a, [0xbe, 0xb, 0xd9, 0x12, 0xe8, 0x53, 0x89, 0x44]);
interface IDWriteFont2 : IDWriteFont1
{
    BOOL IsColorFont();
}
enum IID_IDWriteFontFace2 = GUID(0xd8b768ff, 0x64bc, 0x4e66, [0x98, 0x2b, 0xec, 0x8e, 0x87, 0xf6, 0x93, 0xf7]);
interface IDWriteFontFace2 : IDWriteFontFace1
{
    BOOL IsColorFont();
    uint GetColorPaletteCount();
    uint GetPaletteEntryCount();
    HRESULT GetPaletteEntries(uint, uint, uint, DWRITE_COLOR_F*);
    HRESULT GetRecommendedRenderingMode(float, float, float, const(DWRITE_MATRIX)*, BOOL, DWRITE_OUTLINE_THRESHOLD, DWRITE_MEASURING_MODE, IDWriteRenderingParams, DWRITE_RENDERING_MODE*, DWRITE_GRID_FIT_MODE*);
}
struct DWRITE_COLOR_GLYPH_RUN
{
    DWRITE_GLYPH_RUN glyphRun;
    DWRITE_GLYPH_RUN_DESCRIPTION* glyphRunDescription;
    float baselineOriginX;
    float baselineOriginY;
    DWRITE_COLOR_F runColor;
    ushort paletteIndex;
}
enum IID_IDWriteColorGlyphRunEnumerator = GUID(0xd31fbe17, 0xf157, 0x41a2, [0x8d, 0x24, 0xcb, 0x77, 0x9e, 0x5, 0x60, 0xe8]);
interface IDWriteColorGlyphRunEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT GetCurrentRun(const(DWRITE_COLOR_GLYPH_RUN)**);
}
enum IID_IDWriteRenderingParams2 = GUID(0xf9d711c3, 0x9777, 0x40ae, [0x87, 0xe8, 0x3e, 0x5a, 0xf9, 0xbf, 0x9, 0x48]);
interface IDWriteRenderingParams2 : IDWriteRenderingParams1
{
    DWRITE_GRID_FIT_MODE GetGridFitMode();
}
enum IID_IDWriteFactory2 = GUID(0x439fc60, 0xca44, 0x4994, [0x8d, 0xee, 0x3a, 0x9a, 0xf7, 0xb7, 0x32, 0xec]);
interface IDWriteFactory2 : IDWriteFactory1
{
    HRESULT GetSystemFontFallback(IDWriteFontFallback*);
    HRESULT CreateFontFallbackBuilder(IDWriteFontFallbackBuilder*);
    HRESULT TranslateColorGlyphRun(float, float, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, DWRITE_MEASURING_MODE, const(DWRITE_MATRIX)*, uint, IDWriteColorGlyphRunEnumerator*);
    HRESULT CreateCustomRenderingParams(float, float, float, float, DWRITE_PIXEL_GEOMETRY, DWRITE_RENDERING_MODE, DWRITE_GRID_FIT_MODE, IDWriteRenderingParams2*);
    HRESULT CreateGlyphRunAnalysis(const(DWRITE_GLYPH_RUN)*, const(DWRITE_MATRIX)*, DWRITE_RENDERING_MODE, DWRITE_MEASURING_MODE, DWRITE_GRID_FIT_MODE, DWRITE_TEXT_ANTIALIAS_MODE, float, float, IDWriteGlyphRunAnalysis*);
}
alias DWRITE_FONT_PROPERTY_ID = int;
enum : int
{
    DWRITE_FONT_PROPERTY_ID_NONE                             = 0x00000000,
    DWRITE_FONT_PROPERTY_ID_WEIGHT_STRETCH_STYLE_FAMILY_NAME = 0x00000001,
    DWRITE_FONT_PROPERTY_ID_TYPOGRAPHIC_FAMILY_NAME          = 0x00000002,
    DWRITE_FONT_PROPERTY_ID_WEIGHT_STRETCH_STYLE_FACE_NAME   = 0x00000003,
    DWRITE_FONT_PROPERTY_ID_FULL_NAME                        = 0x00000004,
    DWRITE_FONT_PROPERTY_ID_WIN32_FAMILY_NAME                = 0x00000005,
    DWRITE_FONT_PROPERTY_ID_POSTSCRIPT_NAME                  = 0x00000006,
    DWRITE_FONT_PROPERTY_ID_DESIGN_SCRIPT_LANGUAGE_TAG       = 0x00000007,
    DWRITE_FONT_PROPERTY_ID_SUPPORTED_SCRIPT_LANGUAGE_TAG    = 0x00000008,
    DWRITE_FONT_PROPERTY_ID_SEMANTIC_TAG                     = 0x00000009,
    DWRITE_FONT_PROPERTY_ID_WEIGHT                           = 0x0000000a,
    DWRITE_FONT_PROPERTY_ID_STRETCH                          = 0x0000000b,
    DWRITE_FONT_PROPERTY_ID_STYLE                            = 0x0000000c,
    DWRITE_FONT_PROPERTY_ID_TYPOGRAPHIC_FACE_NAME            = 0x0000000d,
    DWRITE_FONT_PROPERTY_ID_TOTAL                            = 0x0000000d,
    DWRITE_FONT_PROPERTY_ID_TOTAL_RS3                        = 0x0000000e,
    DWRITE_FONT_PROPERTY_ID_PREFERRED_FAMILY_NAME            = 0x00000002,
    DWRITE_FONT_PROPERTY_ID_FAMILY_NAME                      = 0x00000001,
    DWRITE_FONT_PROPERTY_ID_FACE_NAME                        = 0x00000003,
}

struct DWRITE_FONT_PROPERTY
{
    DWRITE_FONT_PROPERTY_ID propertyId;
    const(wchar)* propertyValue;
    const(wchar)* localeName;
}
alias DWRITE_LOCALITY = int;
enum : int
{
    DWRITE_LOCALITY_REMOTE  = 0x00000000,
    DWRITE_LOCALITY_PARTIAL = 0x00000001,
    DWRITE_LOCALITY_LOCAL   = 0x00000002,
}

alias DWRITE_RENDERING_MODE1 = int;
enum : int
{
    DWRITE_RENDERING_MODE1_DEFAULT                       = 0x00000000,
    DWRITE_RENDERING_MODE1_ALIASED                       = 0x00000001,
    DWRITE_RENDERING_MODE1_GDI_CLASSIC                   = 0x00000002,
    DWRITE_RENDERING_MODE1_GDI_NATURAL                   = 0x00000003,
    DWRITE_RENDERING_MODE1_NATURAL                       = 0x00000004,
    DWRITE_RENDERING_MODE1_NATURAL_SYMMETRIC             = 0x00000005,
    DWRITE_RENDERING_MODE1_OUTLINE                       = 0x00000006,
    DWRITE_RENDERING_MODE1_NATURAL_SYMMETRIC_DOWNSAMPLED = 0x00000007,
}

enum IID_IDWriteRenderingParams3 = GUID(0xb7924baa, 0x391b, 0x412a, [0x8c, 0x5c, 0xe4, 0x4c, 0xc2, 0xd8, 0x67, 0xdc]);
interface IDWriteRenderingParams3 : IDWriteRenderingParams2
{
    DWRITE_RENDERING_MODE1 GetRenderingMode1();
}
enum IID_IDWriteFactory3 = GUID(0x9a1b41c3, 0xd3bb, 0x466a, [0x87, 0xfc, 0xfe, 0x67, 0x55, 0x6a, 0x3b, 0x65]);
interface IDWriteFactory3 : IDWriteFactory2
{
    HRESULT CreateGlyphRunAnalysis(const(DWRITE_GLYPH_RUN)*, const(DWRITE_MATRIX)*, DWRITE_RENDERING_MODE1, DWRITE_MEASURING_MODE, DWRITE_GRID_FIT_MODE, DWRITE_TEXT_ANTIALIAS_MODE, float, float, IDWriteGlyphRunAnalysis*);
    HRESULT CreateCustomRenderingParams(float, float, float, float, DWRITE_PIXEL_GEOMETRY, DWRITE_RENDERING_MODE1, DWRITE_GRID_FIT_MODE, IDWriteRenderingParams3*);
    HRESULT CreateFontFaceReference(IDWriteFontFile, uint, DWRITE_FONT_SIMULATIONS, IDWriteFontFaceReference*);
    HRESULT CreateFontFaceReference(const(wchar)*, const(FILETIME)*, uint, DWRITE_FONT_SIMULATIONS, IDWriteFontFaceReference*);
    HRESULT GetSystemFontSet(IDWriteFontSet*);
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder*);
    HRESULT CreateFontCollectionFromFontSet(IDWriteFontSet, IDWriteFontCollection1*);
    HRESULT GetSystemFontCollection(BOOL, IDWriteFontCollection1*, BOOL);
    HRESULT GetFontDownloadQueue(IDWriteFontDownloadQueue*);
}
enum IID_IDWriteFontSet = GUID(0x53585141, 0xd9f8, 0x4095, [0x83, 0x21, 0xd7, 0x3c, 0xf6, 0xbd, 0x11, 0x6b]);
interface IDWriteFontSet : IUnknown
{
    uint GetFontCount();
    HRESULT GetFontFaceReference(uint, IDWriteFontFaceReference*);
    HRESULT FindFontFaceReference(IDWriteFontFaceReference, uint*, BOOL*);
    HRESULT FindFontFace(IDWriteFontFace, uint*, BOOL*);
    HRESULT GetPropertyValues(DWRITE_FONT_PROPERTY_ID, IDWriteStringList*);
    HRESULT GetPropertyValues(DWRITE_FONT_PROPERTY_ID, const(wchar)*, IDWriteStringList*);
    HRESULT GetPropertyValues(uint, DWRITE_FONT_PROPERTY_ID, BOOL*, IDWriteLocalizedStrings*);
    HRESULT GetPropertyOccurrenceCount(const(DWRITE_FONT_PROPERTY)*, uint*);
    HRESULT GetMatchingFonts(const(wchar)*, DWRITE_FONT_WEIGHT, DWRITE_FONT_STRETCH, DWRITE_FONT_STYLE, IDWriteFontSet*);
    HRESULT GetMatchingFonts(const(DWRITE_FONT_PROPERTY)*, uint, IDWriteFontSet*);
}
enum IID_IDWriteFontSetBuilder = GUID(0x2f642afe, 0x9c68, 0x4f40, [0xb8, 0xbe, 0x45, 0x74, 0x1, 0xaf, 0xcb, 0x3d]);
interface IDWriteFontSetBuilder : IUnknown
{
    HRESULT AddFontFaceReference(IDWriteFontFaceReference, const(DWRITE_FONT_PROPERTY)*, uint);
    HRESULT AddFontFaceReference(IDWriteFontFaceReference);
    HRESULT AddFontSet(IDWriteFontSet);
    HRESULT CreateFontSet(IDWriteFontSet*);
}
enum IID_IDWriteFontCollection1 = GUID(0x53585141, 0xd9f8, 0x4095, [0x83, 0x21, 0xd7, 0x3c, 0xf6, 0xbd, 0x11, 0x6c]);
interface IDWriteFontCollection1 : IDWriteFontCollection
{
    HRESULT GetFontSet(IDWriteFontSet*);
    HRESULT GetFontFamily(uint, IDWriteFontFamily1*);
}
enum IID_IDWriteFontFamily1 = GUID(0xda20d8ef, 0x812a, 0x4c43, [0x98, 0x2, 0x62, 0xec, 0x4a, 0xbd, 0x7a, 0xdf]);
interface IDWriteFontFamily1 : IDWriteFontFamily
{
    DWRITE_LOCALITY GetFontLocality(uint);
    HRESULT GetFont(uint, IDWriteFont3*);
    HRESULT GetFontFaceReference(uint, IDWriteFontFaceReference*);
}
enum IID_IDWriteFontList1 = GUID(0xda20d8ef, 0x812a, 0x4c43, [0x98, 0x2, 0x62, 0xec, 0x4a, 0xbd, 0x7a, 0xde]);
interface IDWriteFontList1 : IDWriteFontList
{
    DWRITE_LOCALITY GetFontLocality(uint);
    HRESULT GetFont(uint, IDWriteFont3*);
    HRESULT GetFontFaceReference(uint, IDWriteFontFaceReference*);
}
enum IID_IDWriteFontFaceReference = GUID(0x5e7fa7ca, 0xdde3, 0x424c, [0x89, 0xf0, 0x9f, 0xcd, 0x6f, 0xed, 0x58, 0xcd]);
interface IDWriteFontFaceReference : IUnknown
{
    HRESULT CreateFontFace(IDWriteFontFace3*);
    HRESULT CreateFontFaceWithSimulations(DWRITE_FONT_SIMULATIONS, IDWriteFontFace3*);
    BOOL Equals(IDWriteFontFaceReference);
    uint GetFontFaceIndex();
    DWRITE_FONT_SIMULATIONS GetSimulations();
    HRESULT GetFontFile(IDWriteFontFile*);
    ulong GetLocalFileSize();
    ulong GetFileSize();
    HRESULT GetFileTime(FILETIME*);
    DWRITE_LOCALITY GetLocality();
    HRESULT EnqueueFontDownloadRequest();
    HRESULT EnqueueCharacterDownloadRequest(const(wchar)*, uint);
    HRESULT EnqueueGlyphDownloadRequest(const(ushort)*, uint);
    HRESULT EnqueueFileFragmentDownloadRequest(ulong, ulong);
}
enum IID_IDWriteFont3 = GUID(0x29748ed6, 0x8c9c, 0x4a6a, [0xbe, 0xb, 0xd9, 0x12, 0xe8, 0x53, 0x89, 0x44]);
interface IDWriteFont3 : IDWriteFont2
{
    HRESULT CreateFontFace(IDWriteFontFace3*);
    BOOL Equals(IDWriteFont);
    HRESULT GetFontFaceReference(IDWriteFontFaceReference*);
    BOOL HasCharacter(uint);
    DWRITE_LOCALITY GetLocality();
}
enum IID_IDWriteFontFace3 = GUID(0xd37d7598, 0x9be, 0x4222, [0xa2, 0x36, 0x20, 0x81, 0x34, 0x1c, 0xc1, 0xf2]);
interface IDWriteFontFace3 : IDWriteFontFace2
{
    HRESULT GetFontFaceReference(IDWriteFontFaceReference*);
    void GetPanose(DWRITE_PANOSE*);
    DWRITE_FONT_WEIGHT GetWeight();
    DWRITE_FONT_STRETCH GetStretch();
    DWRITE_FONT_STYLE GetStyle();
    HRESULT GetFamilyNames(IDWriteLocalizedStrings*);
    HRESULT GetFaceNames(IDWriteLocalizedStrings*);
    HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID, IDWriteLocalizedStrings*, BOOL*);
    BOOL HasCharacter(uint);
    HRESULT GetRecommendedRenderingMode(float, float, float, const(DWRITE_MATRIX)*, BOOL, DWRITE_OUTLINE_THRESHOLD, DWRITE_MEASURING_MODE, IDWriteRenderingParams, DWRITE_RENDERING_MODE1*, DWRITE_GRID_FIT_MODE*);
    BOOL IsCharacterLocal(uint);
    BOOL IsGlyphLocal(ushort);
    HRESULT AreCharactersLocal(const(wchar)*, uint, BOOL, BOOL*);
    HRESULT AreGlyphsLocal(const(ushort)*, uint, BOOL, BOOL*);
}
enum IID_IDWriteStringList = GUID(0xcfee3140, 0x1157, 0x47ca, [0x8b, 0x85, 0x31, 0xbf, 0xcf, 0x3f, 0x2d, 0xe]);
interface IDWriteStringList : IUnknown
{
    uint GetCount();
    HRESULT GetLocaleNameLength(uint, uint*);
    HRESULT GetLocaleName(uint, PWSTR, uint);
    HRESULT GetStringLength(uint, uint*);
    HRESULT GetString(uint, PWSTR, uint);
}
enum IID_IDWriteFontDownloadListener = GUID(0xb06fe5b9, 0x43ec, 0x4393, [0x88, 0x1b, 0xdb, 0xe4, 0xdc, 0x72, 0xfd, 0xa7]);
interface IDWriteFontDownloadListener : IUnknown
{
    void DownloadCompleted(IDWriteFontDownloadQueue, IUnknown, HRESULT);
}
enum IID_IDWriteFontDownloadQueue = GUID(0xb71e6052, 0x5aea, 0x4fa3, [0x83, 0x2e, 0xf6, 0xd, 0x43, 0x1f, 0x7e, 0x91]);
interface IDWriteFontDownloadQueue : IUnknown
{
    HRESULT AddListener(IDWriteFontDownloadListener, uint*);
    HRESULT RemoveListener(uint);
    BOOL IsEmpty();
    HRESULT BeginDownload(IUnknown);
    HRESULT CancelDownload();
    ulong GetGenerationCount();
}
enum IID_IDWriteGdiInterop1 = GUID(0x4556be70, 0x3abd, 0x4f70, [0x90, 0xbe, 0x42, 0x17, 0x80, 0xa6, 0xf5, 0x15]);
interface IDWriteGdiInterop1 : IDWriteGdiInterop
{
    HRESULT CreateFontFromLOGFONT(const(LOGFONTW)*, IDWriteFontCollection, IDWriteFont*);
    HRESULT GetFontSignature(IDWriteFontFace, FONTSIGNATURE*);
    HRESULT GetFontSignature(IDWriteFont, FONTSIGNATURE*);
    HRESULT GetMatchingFontsByLOGFONT(const(LOGFONTA)*, IDWriteFontSet, IDWriteFontSet*);
}
struct DWRITE_LINE_METRICS1
{
    DWRITE_LINE_METRICS Base;
    float leadingBefore;
    float leadingAfter;
}
alias DWRITE_FONT_LINE_GAP_USAGE = int;
enum : int
{
    DWRITE_FONT_LINE_GAP_USAGE_DEFAULT  = 0x00000000,
    DWRITE_FONT_LINE_GAP_USAGE_DISABLED = 0x00000001,
    DWRITE_FONT_LINE_GAP_USAGE_ENABLED  = 0x00000002,
}

struct DWRITE_LINE_SPACING
{
    DWRITE_LINE_SPACING_METHOD method;
    float height;
    float baseline;
    float leadingBefore;
    DWRITE_FONT_LINE_GAP_USAGE fontLineGapUsage;
}
enum IID_IDWriteTextFormat2 = GUID(0xf67e0edd, 0x9e3d, 0x4ecc, [0x8c, 0x32, 0x41, 0x83, 0x25, 0x3d, 0xfe, 0x70]);
interface IDWriteTextFormat2 : IDWriteTextFormat1
{
    HRESULT SetLineSpacing(const(DWRITE_LINE_SPACING)*);
    HRESULT GetLineSpacing(DWRITE_LINE_SPACING*);
}
enum IID_IDWriteTextLayout3 = GUID(0x7ddcd52, 0x20e, 0x4de8, [0xac, 0x33, 0x6c, 0x95, 0x3d, 0x83, 0xf9, 0x2d]);
interface IDWriteTextLayout3 : IDWriteTextLayout2
{
    HRESULT InvalidateLayout();
    HRESULT SetLineSpacing(const(DWRITE_LINE_SPACING)*);
    HRESULT GetLineSpacing(DWRITE_LINE_SPACING*);
    HRESULT GetLineMetrics(DWRITE_LINE_METRICS1*, uint, uint*);
}
struct DWRITE_COLOR_GLYPH_RUN1
{
    DWRITE_COLOR_GLYPH_RUN Base;
    DWRITE_GLYPH_IMAGE_FORMATS glyphImageFormat;
    DWRITE_MEASURING_MODE measuringMode;
}
struct DWRITE_GLYPH_IMAGE_DATA
{
    const(void)* imageData;
    uint imageDataSize;
    uint uniqueDataId;
    uint pixelsPerEm;
    D2D_SIZE_U pixelSize;
    POINT horizontalLeftOrigin;
    POINT horizontalRightOrigin;
    POINT verticalTopOrigin;
    POINT verticalBottomOrigin;
}
enum IID_IDWriteColorGlyphRunEnumerator1 = GUID(0x7c5f86da, 0xc7a1, 0x4f05, [0xb8, 0xe1, 0x55, 0xa1, 0x79, 0xfe, 0x5a, 0x35]);
interface IDWriteColorGlyphRunEnumerator1 : IDWriteColorGlyphRunEnumerator
{
    HRESULT GetCurrentRun(const(DWRITE_COLOR_GLYPH_RUN1)**);
}
enum IID_IDWriteFontFace4 = GUID(0x27f2a904, 0x4eb8, 0x441d, [0x96, 0x78, 0x5, 0x63, 0xf5, 0x3e, 0x3e, 0x2f]);
interface IDWriteFontFace4 : IDWriteFontFace3
{
    HRESULT GetGlyphImageFormats(ushort, uint, uint, DWRITE_GLYPH_IMAGE_FORMATS*);
    DWRITE_GLYPH_IMAGE_FORMATS GetGlyphImageFormats();
    HRESULT GetGlyphImageData(ushort, uint, DWRITE_GLYPH_IMAGE_FORMATS, DWRITE_GLYPH_IMAGE_DATA*, void**);
    void ReleaseGlyphImageData(void*);
}
enum IID_IDWriteFactory4 = GUID(0x4b0b5bd3, 0x797, 0x4549, [0x8a, 0xc5, 0xfe, 0x91, 0x5c, 0xc5, 0x38, 0x56]);
interface IDWriteFactory4 : IDWriteFactory3
{
    HRESULT TranslateColorGlyphRun(D2D_POINT_2F, const(DWRITE_GLYPH_RUN)*, const(DWRITE_GLYPH_RUN_DESCRIPTION)*, DWRITE_GLYPH_IMAGE_FORMATS, DWRITE_MEASURING_MODE, const(DWRITE_MATRIX)*, uint, IDWriteColorGlyphRunEnumerator1*);
    HRESULT ComputeGlyphOrigins(const(DWRITE_GLYPH_RUN)*, D2D_POINT_2F, D2D_POINT_2F*);
    HRESULT ComputeGlyphOrigins(const(DWRITE_GLYPH_RUN)*, DWRITE_MEASURING_MODE, D2D_POINT_2F, const(DWRITE_MATRIX)*, D2D_POINT_2F*);
}
enum IID_IDWriteFontSetBuilder1 = GUID(0x3ff7715f, 0x3cdc, 0x4dc6, [0x9b, 0x72, 0xec, 0x56, 0x21, 0xdc, 0xca, 0xfd]);
interface IDWriteFontSetBuilder1 : IDWriteFontSetBuilder
{
    HRESULT AddFontFile(IDWriteFontFile);
}
enum IID_IDWriteAsyncResult = GUID(0xce25f8fd, 0x863b, 0x4d13, [0x96, 0x51, 0xc1, 0xf8, 0x8d, 0xc7, 0x3f, 0xe2]);
interface IDWriteAsyncResult : IUnknown
{
    HANDLE GetWaitHandle();
    HRESULT GetResult();
}
struct DWRITE_FILE_FRAGMENT
{
    ulong fileOffset;
    ulong fragmentSize;
}
enum IID_IDWriteRemoteFontFileStream = GUID(0x4db3757a, 0x2c72, 0x4ed9, [0xb2, 0xb6, 0x1a, 0xba, 0xbe, 0x1a, 0xff, 0x9c]);
interface IDWriteRemoteFontFileStream : IDWriteFontFileStream
{
    HRESULT GetLocalFileSize(ulong*);
    HRESULT GetFileFragmentLocality(ulong, ulong, BOOL*, ulong*);
    DWRITE_LOCALITY GetLocality();
    HRESULT BeginDownload(const(GUID)*, const(DWRITE_FILE_FRAGMENT)*, uint, IDWriteAsyncResult*);
}
alias DWRITE_CONTAINER_TYPE = int;
enum : int
{
    DWRITE_CONTAINER_TYPE_UNKNOWN = 0x00000000,
    DWRITE_CONTAINER_TYPE_WOFF    = 0x00000001,
    DWRITE_CONTAINER_TYPE_WOFF2   = 0x00000002,
}

enum IID_IDWriteRemoteFontFileLoader = GUID(0x68648c83, 0x6ede, 0x46c0, [0xab, 0x46, 0x20, 0x8, 0x3a, 0x88, 0x7f, 0xde]);
interface IDWriteRemoteFontFileLoader : IDWriteFontFileLoader
{
    HRESULT CreateRemoteStreamFromKey(const(void)*, uint, IDWriteRemoteFontFileStream*);
    HRESULT GetLocalityFromKey(const(void)*, uint, DWRITE_LOCALITY*);
    HRESULT CreateFontFileReferenceFromUrl(IDWriteFactory, const(wchar)*, const(wchar)*, IDWriteFontFile*);
}
enum IID_IDWriteInMemoryFontFileLoader = GUID(0xdc102f47, 0xa12d, 0x4b1c, [0x82, 0x2d, 0x9e, 0x11, 0x7e, 0x33, 0x4, 0x3f]);
interface IDWriteInMemoryFontFileLoader : IDWriteFontFileLoader
{
    HRESULT CreateInMemoryFontFileReference(IDWriteFactory, const(void)*, uint, IUnknown, IDWriteFontFile*);
    uint GetFileCount();
}
enum IID_IDWriteFactory5 = GUID(0x958db99a, 0xbe2a, 0x4f09, [0xaf, 0x7d, 0x65, 0x18, 0x98, 0x3, 0xd1, 0xd3]);
interface IDWriteFactory5 : IDWriteFactory4
{
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder1*);
    HRESULT CreateInMemoryFontFileLoader(IDWriteInMemoryFontFileLoader*);
    HRESULT CreateHttpFontFileLoader(const(wchar)*, const(wchar)*, IDWriteRemoteFontFileLoader*);
    DWRITE_CONTAINER_TYPE AnalyzeContainerType(const(void)*, uint);
    HRESULT UnpackFontFile(DWRITE_CONTAINER_TYPE, const(void)*, uint, IDWriteFontFileStream*);
}
struct DWRITE_FONT_AXIS_VALUE
{
    DWRITE_FONT_AXIS_TAG axisTag;
    float value;
}
struct DWRITE_FONT_AXIS_RANGE
{
    DWRITE_FONT_AXIS_TAG axisTag;
    float minValue;
    float maxValue;
}
alias DWRITE_FONT_FAMILY_MODEL = int;
enum : int
{
    DWRITE_FONT_FAMILY_MODEL_TYPOGRAPHIC          = 0x00000000,
    DWRITE_FONT_FAMILY_MODEL_WEIGHT_STRETCH_STYLE = 0x00000001,
}

alias DWRITE_AUTOMATIC_FONT_AXES = int;
enum : int
{
    DWRITE_AUTOMATIC_FONT_AXES_NONE         = 0x00000000,
    DWRITE_AUTOMATIC_FONT_AXES_OPTICAL_SIZE = 0x00000001,
}

alias DWRITE_FONT_AXIS_ATTRIBUTES = int;
enum : int
{
    DWRITE_FONT_AXIS_ATTRIBUTES_NONE     = 0x00000000,
    DWRITE_FONT_AXIS_ATTRIBUTES_VARIABLE = 0x00000001,
    DWRITE_FONT_AXIS_ATTRIBUTES_HIDDEN   = 0x00000002,
}

enum IID_IDWriteFactory6 = GUID(0xf3744d80, 0x21f7, 0x42eb, [0xb3, 0x5d, 0x99, 0x5b, 0xc7, 0x2f, 0xc2, 0x23]);
interface IDWriteFactory6 : IDWriteFactory5
{
    HRESULT CreateFontFaceReference(IDWriteFontFile, uint, DWRITE_FONT_SIMULATIONS, const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontFaceReference1*);
    HRESULT CreateFontResource(IDWriteFontFile, uint, IDWriteFontResource*);
    HRESULT GetSystemFontSet(BOOL, IDWriteFontSet1*);
    HRESULT GetSystemFontCollection(BOOL, DWRITE_FONT_FAMILY_MODEL, IDWriteFontCollection2*);
    HRESULT CreateFontCollectionFromFontSet(IDWriteFontSet, DWRITE_FONT_FAMILY_MODEL, IDWriteFontCollection2*);
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder2*);
    HRESULT CreateTextFormat(const(wchar)*, IDWriteFontCollection, const(DWRITE_FONT_AXIS_VALUE)*, uint, float, const(wchar)*, IDWriteTextFormat3*);
}
enum IID_IDWriteFontFace5 = GUID(0x98eff3a5, 0xb667, 0x479a, [0xb1, 0x45, 0xe2, 0xfa, 0x5b, 0x9f, 0xdc, 0x29]);
interface IDWriteFontFace5 : IDWriteFontFace4
{
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE*, uint);
    BOOL HasVariations();
    HRESULT GetFontResource(IDWriteFontResource*);
    BOOL Equals(IDWriteFontFace);
}
enum IID_IDWriteFontResource = GUID(0x1f803a76, 0x6871, 0x48e8, [0x98, 0x7f, 0xb9, 0x75, 0x55, 0x1c, 0x50, 0xf2]);
interface IDWriteFontResource : IUnknown
{
    HRESULT GetFontFile(IDWriteFontFile*);
    uint GetFontFaceIndex();
    uint GetFontAxisCount();
    HRESULT GetDefaultFontAxisValues(DWRITE_FONT_AXIS_VALUE*, uint);
    HRESULT GetFontAxisRanges(DWRITE_FONT_AXIS_RANGE*, uint);
    DWRITE_FONT_AXIS_ATTRIBUTES GetFontAxisAttributes(uint);
    HRESULT GetAxisNames(uint, IDWriteLocalizedStrings*);
    uint GetAxisValueNameCount(uint);
    HRESULT GetAxisValueNames(uint, uint, DWRITE_FONT_AXIS_RANGE*, IDWriteLocalizedStrings*);
    BOOL HasVariations();
    HRESULT CreateFontFace(DWRITE_FONT_SIMULATIONS, const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontFace5*);
    HRESULT CreateFontFaceReference(DWRITE_FONT_SIMULATIONS, const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontFaceReference1*);
}
enum IID_IDWriteFontFaceReference1 = GUID(0xc081fe77, 0x2fd1, 0x41ac, [0xa5, 0xa3, 0x34, 0x98, 0x3c, 0x4b, 0xa6, 0x1a]);
interface IDWriteFontFaceReference1 : IDWriteFontFaceReference
{
    HRESULT CreateFontFace(IDWriteFontFace5*);
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE*, uint);
}
enum IID_IDWriteFontSetBuilder2 = GUID(0xee5ba612, 0xb131, 0x463c, [0x8f, 0x4f, 0x31, 0x89, 0xb9, 0x40, 0x1e, 0x45]);
interface IDWriteFontSetBuilder2 : IDWriteFontSetBuilder1
{
    HRESULT AddFont(IDWriteFontFile, uint, DWRITE_FONT_SIMULATIONS, const(DWRITE_FONT_AXIS_VALUE)*, uint, const(DWRITE_FONT_AXIS_RANGE)*, uint, const(DWRITE_FONT_PROPERTY)*, uint);
    HRESULT AddFontFile(const(wchar)*);
}
enum IID_IDWriteFontSet1 = GUID(0x7e9fda85, 0x6c92, 0x4053, [0xbc, 0x47, 0x7a, 0xe3, 0x53, 0xd, 0xb4, 0xd3]);
interface IDWriteFontSet1 : IDWriteFontSet
{
    HRESULT GetMatchingFonts(const(DWRITE_FONT_PROPERTY)*, const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontSet1*);
    HRESULT GetFirstFontResources(IDWriteFontSet1*);
    HRESULT GetFilteredFonts(const(uint)*, uint, IDWriteFontSet1*);
    HRESULT GetFilteredFonts(const(DWRITE_FONT_AXIS_RANGE)*, uint, BOOL, IDWriteFontSet1*);
    HRESULT GetFilteredFonts(const(DWRITE_FONT_PROPERTY)*, uint, BOOL, IDWriteFontSet1*);
    HRESULT GetFilteredFontIndices(const(DWRITE_FONT_AXIS_RANGE)*, uint, BOOL, uint*, uint, uint*);
    HRESULT GetFilteredFontIndices(const(DWRITE_FONT_PROPERTY)*, uint, BOOL, uint*, uint, uint*);
    HRESULT GetFontAxisRanges(uint, DWRITE_FONT_AXIS_RANGE*, uint, uint*);
    HRESULT GetFontAxisRanges(DWRITE_FONT_AXIS_RANGE*, uint, uint*);
    HRESULT GetFontFaceReference(uint, IDWriteFontFaceReference1*);
    HRESULT CreateFontResource(uint, IDWriteFontResource*);
    HRESULT CreateFontFace(uint, IDWriteFontFace5*);
    DWRITE_LOCALITY GetFontLocality(uint);
}
enum IID_IDWriteFontList2 = GUID(0xc0763a34, 0x77af, 0x445a, [0xb7, 0x35, 0x8, 0xc3, 0x7b, 0xa, 0x5b, 0xf5]);
interface IDWriteFontList2 : IDWriteFontList1
{
    HRESULT GetFontSet(IDWriteFontSet1*);
}
enum IID_IDWriteFontFamily2 = GUID(0x3ed49e77, 0xa398, 0x4261, [0xb9, 0xcf, 0xc1, 0x26, 0xc2, 0x13, 0x1e, 0xf3]);
interface IDWriteFontFamily2 : IDWriteFontFamily1
{
    HRESULT GetMatchingFonts(const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontList2*);
    HRESULT GetFontSet(IDWriteFontSet1*);
}
enum IID_IDWriteFontCollection2 = GUID(0x514039c6, 0x4617, 0x4064, [0xbf, 0x8b, 0x92, 0xea, 0x83, 0xe5, 0x6, 0xe0]);
interface IDWriteFontCollection2 : IDWriteFontCollection1
{
    HRESULT GetFontFamily(uint, IDWriteFontFamily2*);
    HRESULT GetMatchingFonts(const(wchar)*, const(DWRITE_FONT_AXIS_VALUE)*, uint, IDWriteFontList2*);
    DWRITE_FONT_FAMILY_MODEL GetFontFamilyModel();
    HRESULT GetFontSet(IDWriteFontSet1*);
}
enum IID_IDWriteTextLayout4 = GUID(0x5a9bf42, 0x223f, 0x4441, [0xb5, 0xfb, 0x82, 0x63, 0x68, 0x5f, 0x55, 0xe9]);
interface IDWriteTextLayout4 : IDWriteTextLayout3
{
    HRESULT SetFontAxisValues(const(DWRITE_FONT_AXIS_VALUE)*, uint, DWRITE_TEXT_RANGE);
    uint GetFontAxisValueCount(uint);
    HRESULT GetFontAxisValues(uint, DWRITE_FONT_AXIS_VALUE*, uint, DWRITE_TEXT_RANGE*);
    DWRITE_AUTOMATIC_FONT_AXES GetAutomaticFontAxes();
    HRESULT SetAutomaticFontAxes(DWRITE_AUTOMATIC_FONT_AXES);
}
enum IID_IDWriteTextFormat3 = GUID(0x6d3b5641, 0xe550, 0x430d, [0xa8, 0x5b, 0xb7, 0xbf, 0x48, 0xa9, 0x34, 0x27]);
interface IDWriteTextFormat3 : IDWriteTextFormat2
{
    HRESULT SetFontAxisValues(const(DWRITE_FONT_AXIS_VALUE)*, uint);
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE*, uint);
    DWRITE_AUTOMATIC_FONT_AXES GetAutomaticFontAxes();
    HRESULT SetAutomaticFontAxes(DWRITE_AUTOMATIC_FONT_AXES);
}
enum IID_IDWriteFontFallback1 = GUID(0x2397599d, 0xdd0d, 0x4681, [0xbd, 0x6a, 0xf4, 0xf3, 0x1e, 0xaa, 0xde, 0x77]);
interface IDWriteFontFallback1 : IDWriteFontFallback
{
    HRESULT MapCharacters(IDWriteTextAnalysisSource, uint, uint, IDWriteFontCollection, const(wchar)*, const(DWRITE_FONT_AXIS_VALUE)*, uint, uint*, float*, IDWriteFontFace5*);
}
enum IID_IDWriteFontSet2 = GUID(0xdc7ead19, 0xe54c, 0x43af, [0xb2, 0xda, 0x4e, 0x2b, 0x79, 0xba, 0x3f, 0x7f]);
interface IDWriteFontSet2 : IDWriteFontSet1
{
    HANDLE GetExpirationEvent();
}
enum IID_IDWriteFontCollection3 = GUID(0xa4d055a6, 0xf9e3, 0x4e25, [0x93, 0xb7, 0x9e, 0x30, 0x9f, 0x3a, 0xf8, 0xe9]);
interface IDWriteFontCollection3 : IDWriteFontCollection2
{
    HANDLE GetExpirationEvent();
}
enum IID_IDWriteFactory7 = GUID(0x35d0e0b3, 0x9076, 0x4d2e, [0xa0, 0x16, 0xa9, 0x1b, 0x56, 0x8a, 0x6, 0xb4]);
interface IDWriteFactory7 : IDWriteFactory6
{
    HRESULT GetSystemFontSet(BOOL, IDWriteFontSet2*);
    HRESULT GetSystemFontCollection(BOOL, DWRITE_FONT_FAMILY_MODEL, IDWriteFontCollection3*);
}
alias DWRITE_FONT_SOURCE_TYPE = int;
enum : int
{
    DWRITE_FONT_SOURCE_TYPE_UNKNOWN              = 0x00000000,
    DWRITE_FONT_SOURCE_TYPE_PER_MACHINE          = 0x00000001,
    DWRITE_FONT_SOURCE_TYPE_PER_USER             = 0x00000002,
    DWRITE_FONT_SOURCE_TYPE_APPX_PACKAGE         = 0x00000003,
    DWRITE_FONT_SOURCE_TYPE_REMOTE_FONT_PROVIDER = 0x00000004,
}

enum IID_IDWriteFontSet3 = GUID(0x7c073ef2, 0xa7f4, 0x4045, [0x8c, 0x32, 0x8a, 0xb8, 0xae, 0x64, 0xf, 0x90]);
interface IDWriteFontSet3 : IDWriteFontSet2
{
    DWRITE_FONT_SOURCE_TYPE GetFontSourceType(uint);
    uint GetFontSourceNameLength(uint);
    HRESULT GetFontSourceName(uint, PWSTR, uint);
}
enum IID_IDWriteFontFace6 = GUID(0xc4b1fe1b, 0x6e84, 0x47d5, [0xb5, 0x4c, 0xa5, 0x97, 0x98, 0x1b, 0x6, 0xad]);
interface IDWriteFontFace6 : IDWriteFontFace5
{
    HRESULT GetFamilyNames(DWRITE_FONT_FAMILY_MODEL, IDWriteLocalizedStrings*);
    HRESULT GetFaceNames(DWRITE_FONT_FAMILY_MODEL, IDWriteLocalizedStrings*);
}
enum IID_IDWriteFontSet4 = GUID(0xeec175fc, 0xbea9, 0x4c86, [0x8b, 0x53, 0xcc, 0xbd, 0xd7, 0xdf, 0xc, 0x82]);
interface IDWriteFontSet4 : IDWriteFontSet3
{
    uint ConvertWeightStretchStyleToFontAxisValues(const(DWRITE_FONT_AXIS_VALUE)*, uint, DWRITE_FONT_WEIGHT, DWRITE_FONT_STRETCH, DWRITE_FONT_STYLE, float, DWRITE_FONT_AXIS_VALUE*);
    HRESULT GetMatchingFonts(const(wchar)*, const(DWRITE_FONT_AXIS_VALUE)*, uint, DWRITE_FONT_SIMULATIONS, IDWriteFontSet4*);
}
