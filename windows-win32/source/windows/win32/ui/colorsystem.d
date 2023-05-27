module windows.win32.ui.colorsystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, COLORREF, HRESULT, HWND, LPARAM, LUID, PSTR, PWSTR;
import windows.win32.graphics.gdi : CIEXYZ, CIEXYZTRIPLE, EMR, HDC, HPALETTE, RGBTRIPLE;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.windowsandmessaging : DLGPROC;

version (Windows):
extern (Windows):

alias ICM_COMMAND = uint;
enum : uint
{
    ICM_ADDPROFILE          = 0x00000001,
    ICM_DELETEPROFILE       = 0x00000002,
    ICM_QUERYPROFILE        = 0x00000003,
    ICM_SETDEFAULTPROFILE   = 0x00000004,
    ICM_REGISTERICMATCHER   = 0x00000005,
    ICM_UNREGISTERICMATCHER = 0x00000006,
    ICM_QUERYMATCH          = 0x00000007,
}

alias ICM_MODE = int;
enum : int
{
    ICM_OFF            = 0x00000001,
    ICM_ON             = 0x00000002,
    ICM_QUERY          = 0x00000003,
    ICM_DONE_OUTSIDEDC = 0x00000004,
}

alias COLOR_MATCH_TO_TARGET_ACTION = uint;
enum : uint
{
    CS_ENABLE           = 0x00000001,
    CS_DISABLE          = 0x00000002,
    CS_DELETE_TRANSFORM = 0x00000003,
}

int SetICMMode(HDC, ICM_MODE);
BOOL CheckColorsInGamut(HDC, RGBTRIPLE*, void*, uint);
HCOLORSPACE GetColorSpace(HDC);
BOOL GetLogColorSpaceA(HCOLORSPACE, LOGCOLORSPACEA*, uint);
BOOL GetLogColorSpaceW(HCOLORSPACE, LOGCOLORSPACEW*, uint);
HCOLORSPACE CreateColorSpaceA(LOGCOLORSPACEA*);
HCOLORSPACE CreateColorSpaceW(LOGCOLORSPACEW*);
HCOLORSPACE SetColorSpace(HDC, HCOLORSPACE);
BOOL DeleteColorSpace(HCOLORSPACE);
BOOL GetICMProfileA(HDC, uint*, PSTR);
BOOL GetICMProfileW(HDC, uint*, PWSTR);
BOOL SetICMProfileA(HDC, PSTR);
BOOL SetICMProfileW(HDC, PWSTR);
BOOL GetDeviceGammaRamp(HDC, void*);
BOOL SetDeviceGammaRamp(HDC, void*);
BOOL ColorMatchToTarget(HDC, HDC, COLOR_MATCH_TO_TARGET_ACTION);
int EnumICMProfilesA(HDC, ICMENUMPROCA, LPARAM);
int EnumICMProfilesW(HDC, ICMENUMPROCW, LPARAM);
BOOL UpdateICMRegKeyA(uint, PSTR, PSTR, ICM_COMMAND);
BOOL UpdateICMRegKeyW(uint, PWSTR, PWSTR, ICM_COMMAND);
BOOL ColorCorrectPalette(HDC, HPALETTE, uint, uint);
long OpenColorProfileA(PROFILE*, uint, uint, uint);
long OpenColorProfileW(PROFILE*, uint, uint, uint);
BOOL CloseColorProfile(long);
BOOL GetColorProfileFromHandle(long, ubyte*, uint*);
BOOL IsColorProfileValid(long, BOOL*);
BOOL CreateProfileFromLogColorSpaceA(LOGCOLORSPACEA*, ubyte**);
BOOL CreateProfileFromLogColorSpaceW(LOGCOLORSPACEW*, ubyte**);
BOOL GetCountColorProfileElements(long, uint*);
BOOL GetColorProfileHeader(long, PROFILEHEADER*);
BOOL GetColorProfileElementTag(long, uint, uint*);
BOOL IsColorProfileTagPresent(long, uint, BOOL*);
BOOL GetColorProfileElement(long, uint, uint, uint*, void*, BOOL*);
BOOL SetColorProfileHeader(long, PROFILEHEADER*);
BOOL SetColorProfileElementSize(long, uint, uint);
BOOL SetColorProfileElement(long, uint, uint, uint*, void*);
BOOL SetColorProfileElementReference(long, uint, uint);
BOOL GetPS2ColorSpaceArray(long, uint, uint, ubyte*, uint*, BOOL*);
BOOL GetPS2ColorRenderingIntent(long, uint, ubyte*, uint*);
BOOL GetPS2ColorRenderingDictionary(long, uint, ubyte*, uint*, BOOL*);
BOOL GetNamedProfileInfo(long, NAMED_PROFILE_INFO*);
BOOL ConvertColorNameToIndex(long, byte**, uint*, uint);
BOOL ConvertIndexToColorName(long, uint*, byte**, uint);
BOOL CreateDeviceLinkProfile(long*, uint, uint*, uint, uint, ubyte**, uint);
long CreateColorTransformA(LOGCOLORSPACEA*, long, long, uint);
long CreateColorTransformW(LOGCOLORSPACEW*, long, long, uint);
long CreateMultiProfileTransform(long*, uint, uint*, uint, uint, uint);
BOOL DeleteColorTransform(long);
BOOL TranslateBitmapBits(long, void*, BMFORMAT, uint, uint, uint, void*, BMFORMAT, uint, LPBMCALLBACKFN, LPARAM);
BOOL CheckBitmapBits(long, void*, BMFORMAT, uint, uint, uint, ubyte*, LPBMCALLBACKFN, LPARAM);
BOOL TranslateColors(long, COLOR*, uint, COLORTYPE, COLOR*, COLORTYPE);
BOOL CheckColors(long, COLOR*, uint, COLORTYPE, ubyte*);
uint GetCMMInfo(long, uint);
BOOL RegisterCMMA(const(char)*, uint, const(char)*);
BOOL RegisterCMMW(const(wchar)*, uint, const(wchar)*);
BOOL UnregisterCMMA(const(char)*, uint);
BOOL UnregisterCMMW(const(wchar)*, uint);
BOOL SelectCMM(uint);
BOOL GetColorDirectoryA(const(char)*, PSTR, uint*);
BOOL GetColorDirectoryW(const(wchar)*, PWSTR, uint*);
BOOL InstallColorProfileA(const(char)*, const(char)*);
BOOL InstallColorProfileW(const(wchar)*, const(wchar)*);
BOOL UninstallColorProfileA(const(char)*, const(char)*, BOOL);
BOOL UninstallColorProfileW(const(wchar)*, const(wchar)*, BOOL);
BOOL EnumColorProfilesA(const(char)*, ENUMTYPEA*, ubyte*, uint*, uint*);
BOOL EnumColorProfilesW(const(wchar)*, ENUMTYPEW*, ubyte*, uint*, uint*);
BOOL SetStandardColorSpaceProfileA(const(char)*, uint, const(char)*);
BOOL SetStandardColorSpaceProfileW(const(wchar)*, uint, const(wchar)*);
BOOL GetStandardColorSpaceProfileA(const(char)*, uint, PSTR, uint*);
BOOL GetStandardColorSpaceProfileW(const(wchar)*, uint, PWSTR, uint*);
BOOL AssociateColorProfileWithDeviceA(const(char)*, const(char)*, const(char)*);
BOOL AssociateColorProfileWithDeviceW(const(wchar)*, const(wchar)*, const(wchar)*);
BOOL DisassociateColorProfileFromDeviceA(const(char)*, const(char)*, const(char)*);
BOOL DisassociateColorProfileFromDeviceW(const(wchar)*, const(wchar)*, const(wchar)*);
BOOL SetupColorMatchingW(COLORMATCHSETUPW*);
BOOL SetupColorMatchingA(COLORMATCHSETUPA*);
BOOL WcsAssociateColorProfileWithDevice(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, const(wchar)*);
BOOL WcsDisassociateColorProfileFromDevice(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, const(wchar)*);
BOOL WcsEnumColorProfilesSize(WCS_PROFILE_MANAGEMENT_SCOPE, ENUMTYPEW*, uint*);
BOOL WcsEnumColorProfiles(WCS_PROFILE_MANAGEMENT_SCOPE, ENUMTYPEW*, ubyte*, uint, uint*);
BOOL WcsGetDefaultColorProfileSize(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, COLORPROFILETYPE, COLORPROFILESUBTYPE, uint, uint*);
BOOL WcsGetDefaultColorProfile(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, COLORPROFILETYPE, COLORPROFILESUBTYPE, uint, uint, PWSTR);
BOOL WcsSetDefaultColorProfile(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, COLORPROFILETYPE, COLORPROFILESUBTYPE, uint, const(wchar)*);
BOOL WcsSetDefaultRenderingIntent(WCS_PROFILE_MANAGEMENT_SCOPE, uint);
BOOL WcsGetDefaultRenderingIntent(WCS_PROFILE_MANAGEMENT_SCOPE, uint*);
BOOL WcsGetUsePerUserProfiles(const(wchar)*, uint, BOOL*);
BOOL WcsSetUsePerUserProfiles(const(wchar)*, uint, BOOL);
BOOL WcsTranslateColors(long, uint, uint, COLORDATATYPE, uint, void*, uint, COLORDATATYPE, uint, void*);
BOOL WcsCheckColors(long, uint, uint, COLORDATATYPE, uint, void*, ubyte*);
BOOL CMCheckColors(long, COLOR*, uint, COLORTYPE, ubyte*);
BOOL CMCheckRGBs(long, void*, BMFORMAT, uint, uint, uint, ubyte*, LPBMCALLBACKFN, LPARAM);
BOOL CMConvertColorNameToIndex(long, byte**, uint*, uint);
BOOL CMConvertIndexToColorName(long, uint*, byte**, uint);
BOOL CMCreateDeviceLinkProfile(long*, uint, uint*, uint, uint, ubyte**);
long CMCreateMultiProfileTransform(long*, uint, uint*, uint, uint);
BOOL CMCreateProfileW(LOGCOLORSPACEW*, void**);
long CMCreateTransform(LOGCOLORSPACEA*, void*, void*);
long CMCreateTransformW(LOGCOLORSPACEW*, void*, void*);
long CMCreateTransformExt(LOGCOLORSPACEA*, void*, void*, uint);
BOOL CMCheckColorsInGamut(long, RGBTRIPLE*, ubyte*, uint);
BOOL CMCreateProfile(LOGCOLORSPACEA*, void**);
BOOL CMTranslateRGB(long, COLORREF, uint*, uint);
BOOL CMTranslateRGBs(long, void*, BMFORMAT, uint, uint, uint, void*, BMFORMAT, uint);
long CMCreateTransformExtW(LOGCOLORSPACEW*, void*, void*, uint);
BOOL CMDeleteTransform(long);
uint CMGetInfo(uint);
BOOL CMGetNamedProfileInfo(long, NAMED_PROFILE_INFO*);
BOOL CMIsProfileValid(long, int*);
BOOL CMTranslateColors(long, COLOR*, uint, COLORTYPE, COLOR*, COLORTYPE);
BOOL CMTranslateRGBsExt(long, void*, BMFORMAT, uint, uint, uint, void*, BMFORMAT, uint, LPBMCALLBACKFN, LPARAM);
long WcsOpenColorProfileA(PROFILE*, PROFILE*, PROFILE*, uint, uint, uint, uint);
long WcsOpenColorProfileW(PROFILE*, PROFILE*, PROFILE*, uint, uint, uint, uint);
long WcsCreateIccProfile(long, uint);
BOOL WcsGetCalibrationManagementState(BOOL*);
BOOL WcsSetCalibrationManagementState(BOOL);
HRESULT ColorProfileAddDisplayAssociation(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, LUID, uint, BOOL, BOOL);
HRESULT ColorProfileRemoveDisplayAssociation(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, LUID, uint, BOOL);
HRESULT ColorProfileSetDisplayDefaultAssociation(WCS_PROFILE_MANAGEMENT_SCOPE, const(wchar)*, COLORPROFILETYPE, COLORPROFILESUBTYPE, LUID, uint);
HRESULT ColorProfileGetDisplayList(WCS_PROFILE_MANAGEMENT_SCOPE, LUID, uint, PWSTR**, uint*);
HRESULT ColorProfileGetDisplayDefault(WCS_PROFILE_MANAGEMENT_SCOPE, LUID, uint, COLORPROFILETYPE, COLORPROFILESUBTYPE, PWSTR*);
HRESULT ColorProfileGetDisplayUserScope(LUID, uint, WCS_PROFILE_MANAGEMENT_SCOPE*);
enum CATID_WcsPlugin = GUID(0xa0b402e0, 0x8240, 0x405f, [0x8a, 0x16, 0x8a, 0x5b, 0x4d, 0xf2, 0xf0, 0xdd]);
enum MAX_COLOR_CHANNELS = 0x00000008;
enum INTENT_PERCEPTUAL = 0x00000000;
enum INTENT_RELATIVE_COLORIMETRIC = 0x00000001;
enum INTENT_SATURATION = 0x00000002;
enum INTENT_ABSOLUTE_COLORIMETRIC = 0x00000003;
enum FLAG_EMBEDDEDPROFILE = 0x00000001;
enum FLAG_DEPENDENTONDATA = 0x00000002;
enum FLAG_ENABLE_CHROMATIC_ADAPTATION = 0x02000000;
enum ATTRIB_TRANSPARENCY = 0x00000001;
enum ATTRIB_MATTE = 0x00000002;
enum PROFILE_FILENAME = 0x00000001;
enum PROFILE_MEMBUFFER = 0x00000002;
enum PROFILE_READ = 0x00000001;
enum PROFILE_READWRITE = 0x00000002;
enum INDEX_DONT_CARE = 0x00000000;
enum CMM_FROM_PROFILE = 0x00000000;
enum ENUM_TYPE_VERSION = 0x00000300;
enum ET_DEVICENAME = 0x00000001;
enum ET_MEDIATYPE = 0x00000002;
enum ET_DITHERMODE = 0x00000004;
enum ET_RESOLUTION = 0x00000008;
enum ET_CMMTYPE = 0x00000010;
enum ET_CLASS = 0x00000020;
enum ET_DATACOLORSPACE = 0x00000040;
enum ET_CONNECTIONSPACE = 0x00000080;
enum ET_SIGNATURE = 0x00000100;
enum ET_PLATFORM = 0x00000200;
enum ET_PROFILEFLAGS = 0x00000400;
enum ET_MANUFACTURER = 0x00000800;
enum ET_MODEL = 0x00001000;
enum ET_ATTRIBUTES = 0x00002000;
enum ET_RENDERINGINTENT = 0x00004000;
enum ET_CREATOR = 0x00008000;
enum ET_DEVICECLASS = 0x00010000;
enum ET_STANDARDDISPLAYCOLOR = 0x00020000;
enum ET_EXTENDEDDISPLAYCOLOR = 0x00040000;
enum PROOF_MODE = 0x00000001;
enum NORMAL_MODE = 0x00000002;
enum BEST_MODE = 0x00000003;
enum ENABLE_GAMUT_CHECKING = 0x00010000;
enum USE_RELATIVE_COLORIMETRIC = 0x00020000;
enum FAST_TRANSLATE = 0x00040000;
enum PRESERVEBLACK = 0x00100000;
enum WCS_ALWAYS = 0x00200000;
enum SEQUENTIAL_TRANSFORM = 0x80800000;
enum RESERVED = 0x80000000;
enum CSA_A = 0x00000001;
enum CSA_ABC = 0x00000002;
enum CSA_DEF = 0x00000003;
enum CSA_DEFG = 0x00000004;
enum CSA_GRAY = 0x00000005;
enum CSA_RGB = 0x00000006;
enum CSA_CMYK = 0x00000007;
enum CSA_Lab = 0x00000008;
enum CMM_WIN_VERSION = 0x00000000;
enum CMM_IDENT = 0x00000001;
enum CMM_DRIVER_VERSION = 0x00000002;
enum CMM_DLL_VERSION = 0x00000003;
enum CMM_VERSION = 0x00000004;
enum CMM_DESCRIPTION = 0x00000005;
enum CMM_LOGOICON = 0x00000006;
enum CMS_FORWARD = 0x00000000;
enum CMS_BACKWARD = 0x00000001;
enum COLOR_MATCH_VERSION = 0x00000200;
enum CMS_DISABLEICM = 0x00000001;
enum CMS_ENABLEPROOFING = 0x00000002;
enum CMS_SETRENDERINTENT = 0x00000004;
enum CMS_SETPROOFINTENT = 0x00000008;
enum CMS_SETMONITORPROFILE = 0x00000010;
enum CMS_SETPRINTERPROFILE = 0x00000020;
enum CMS_SETTARGETPROFILE = 0x00000040;
enum CMS_USEHOOK = 0x00000080;
enum CMS_USEAPPLYCALLBACK = 0x00000100;
enum CMS_USEDESCRIPTION = 0x00000200;
enum CMS_DISABLEINTENT = 0x00000400;
enum CMS_DISABLERENDERINTENT = 0x00000800;
enum CMS_MONITOROVERFLOW = 0xffffffff80000000;
enum CMS_PRINTEROVERFLOW = 0x40000000;
enum CMS_TARGETOVERFLOW = 0x20000000;
enum DONT_USE_EMBEDDED_WCS_PROFILES = 0x00000001;
enum WCS_DEFAULT = 0x00000000;
enum WCS_ICCONLY = 0x00010000;
alias HCOLORSPACE = void*;
struct LOGCOLORSPACEA
{
    uint lcsSignature;
    uint lcsVersion;
    uint lcsSize;
    int lcsCSType;
    int lcsIntent;
    CIEXYZTRIPLE lcsEndpoints;
    uint lcsGammaRed;
    uint lcsGammaGreen;
    uint lcsGammaBlue;
    CHAR[260] lcsFilename;
}
struct LOGCOLORSPACEW
{
    uint lcsSignature;
    uint lcsVersion;
    uint lcsSize;
    int lcsCSType;
    int lcsIntent;
    CIEXYZTRIPLE lcsEndpoints;
    uint lcsGammaRed;
    uint lcsGammaGreen;
    uint lcsGammaBlue;
    wchar[260] lcsFilename;
}
alias ICMENUMPROCA = int function(PSTR, LPARAM);
alias ICMENUMPROCW = int function(PWSTR, LPARAM);
struct EMRCREATECOLORSPACE
{
    EMR emr;
    uint ihCS;
    LOGCOLORSPACEA lcs;
}
struct EMRCREATECOLORSPACEW
{
    EMR emr;
    uint ihCS;
    LOGCOLORSPACEW lcs;
    uint dwFlags;
    uint cbData;
    ubyte[1] Data;
}
struct XYZColorF
{
    float X;
    float Y;
    float Z;
}
struct JChColorF
{
    float J;
    float C;
    float h;
}
struct JabColorF
{
    float J;
    float a;
    float b;
}
struct GamutShellTriangle
{
    uint[3] aVertexIndex;
}
struct GamutShell
{
    float JMin;
    float JMax;
    uint cVertices;
    uint cTriangles;
    JabColorF* pVertices;
    GamutShellTriangle* pTriangles;
}
struct PrimaryJabColors
{
    JabColorF red;
    JabColorF yellow;
    JabColorF green;
    JabColorF cyan;
    JabColorF blue;
    JabColorF magenta;
    JabColorF black;
    JabColorF white;
}
struct PrimaryXYZColors
{
    XYZColorF red;
    XYZColorF yellow;
    XYZColorF green;
    XYZColorF cyan;
    XYZColorF blue;
    XYZColorF magenta;
    XYZColorF black;
    XYZColorF white;
}
struct GamutBoundaryDescription
{
    PrimaryJabColors* pPrimaries;
    uint cNeutralSamples;
    JabColorF* pNeutralSamples;
    GamutShell* pReferenceShell;
    GamutShell* pPlausibleShell;
    GamutShell* pPossibleShell;
}
struct BlackInformation
{
    BOOL fBlackOnly;
    float blackWeight;
}
enum IID_IDeviceModelPlugIn = GUID(0x1cd63475, 0x7c4, 0x46fe, [0xa9, 0x3, 0xd6, 0x55, 0x31, 0x6d, 0x11, 0xfd]);
interface IDeviceModelPlugIn : IUnknown
{
    HRESULT Initialize(BSTR, uint, uint);
    HRESULT GetNumChannels(uint*);
    HRESULT DeviceToColorimetricColors(uint, uint, const(float)*, XYZColorF*);
    HRESULT ColorimetricToDeviceColors(uint, uint, const(XYZColorF)*, float*);
    HRESULT ColorimetricToDeviceColorsWithBlack(uint, uint, const(XYZColorF)*, const(BlackInformation)*, float*);
    HRESULT SetTransformDeviceModelInfo(uint, IDeviceModelPlugIn);
    HRESULT GetPrimarySamples(PrimaryXYZColors*);
    HRESULT GetGamutBoundaryMeshSize(uint*, uint*);
    HRESULT GetGamutBoundaryMesh(uint, uint, uint, float*, GamutShellTriangle*);
    HRESULT GetNeutralAxisSize(uint*);
    HRESULT GetNeutralAxis(uint, XYZColorF*);
}
enum IID_IGamutMapModelPlugIn = GUID(0x2dd80115, 0xad1e, 0x41f6, [0xa2, 0x19, 0xa4, 0xf4, 0xb5, 0x83, 0xd1, 0xf9]);
interface IGamutMapModelPlugIn : IUnknown
{
    HRESULT Initialize(BSTR, IDeviceModelPlugIn, IDeviceModelPlugIn, GamutBoundaryDescription*, GamutBoundaryDescription*);
    HRESULT SourceToDestinationAppearanceColors(uint, const(JChColorF)*, JChColorF*);
}
struct NAMED_PROFILE_INFO
{
    uint dwFlags;
    uint dwCount;
    uint dwCountDevCoordinates;
    byte[32] szPrefix;
    byte[32] szSuffix;
}
struct GRAYCOLOR
{
    ushort gray;
}
struct RGBCOLOR
{
    ushort red;
    ushort green;
    ushort blue;
}
struct CMYKCOLOR
{
    ushort cyan;
    ushort magenta;
    ushort yellow;
    ushort black;
}
struct XYZCOLOR
{
    ushort X;
    ushort Y;
    ushort Z;
}
struct YxyCOLOR
{
    ushort Y;
    ushort x;
    ushort y;
}
struct LabCOLOR
{
    ushort L;
    ushort a;
    ushort b;
}
struct GENERIC3CHANNEL
{
    ushort ch1;
    ushort ch2;
    ushort ch3;
}
struct NAMEDCOLOR
{
    uint dwIndex;
}
struct HiFiCOLOR
{
    ubyte[8] channel;
}
union COLOR
{
    GRAYCOLOR gray;
    RGBCOLOR rgb;
    CMYKCOLOR cmyk;
    XYZCOLOR XYZ;
    YxyCOLOR Yxy;
    LabCOLOR Lab;
    GENERIC3CHANNEL gen3ch;
    NAMEDCOLOR named;
    HiFiCOLOR hifi;
    struct
    {
        uint reserved1;
        void* reserved2;
    }
}
alias COLORTYPE = int;
enum : int
{
    COLOR_GRAY      = 0x00000001,
    COLOR_RGB       = 0x00000002,
    COLOR_XYZ       = 0x00000003,
    COLOR_Yxy       = 0x00000004,
    COLOR_Lab       = 0x00000005,
    COLOR_3_CHANNEL = 0x00000006,
    COLOR_CMYK      = 0x00000007,
    COLOR_5_CHANNEL = 0x00000008,
    COLOR_6_CHANNEL = 0x00000009,
    COLOR_7_CHANNEL = 0x0000000a,
    COLOR_8_CHANNEL = 0x0000000b,
    COLOR_NAMED     = 0x0000000c,
}

alias COLORPROFILETYPE = int;
enum : int
{
    CPT_ICC  = 0x00000000,
    CPT_DMP  = 0x00000001,
    CPT_CAMP = 0x00000002,
    CPT_GMMP = 0x00000003,
}

alias COLORPROFILESUBTYPE = int;
enum : int
{
    CPST_PERCEPTUAL                  = 0x00000000,
    CPST_RELATIVE_COLORIMETRIC       = 0x00000001,
    CPST_SATURATION                  = 0x00000002,
    CPST_ABSOLUTE_COLORIMETRIC       = 0x00000003,
    CPST_NONE                        = 0x00000004,
    CPST_RGB_WORKING_SPACE           = 0x00000005,
    CPST_CUSTOM_WORKING_SPACE        = 0x00000006,
    CPST_STANDARD_DISPLAY_COLOR_MODE = 0x00000007,
    CPST_EXTENDED_DISPLAY_COLOR_MODE = 0x00000008,
}

alias COLORDATATYPE = int;
enum : int
{
    COLOR_BYTE               = 0x00000001,
    COLOR_WORD               = 0x00000002,
    COLOR_FLOAT              = 0x00000003,
    COLOR_S2DOT13FIXED       = 0x00000004,
    COLOR_10b_R10G10B10A2    = 0x00000005,
    COLOR_10b_R10G10B10A2_XR = 0x00000006,
    COLOR_FLOAT16            = 0x00000007,
}

alias BMFORMAT = int;
enum : int
{
    BM_x555RGB             = 0x00000000,
    BM_x555XYZ             = 0x00000101,
    BM_x555Yxy             = 0x00000102,
    BM_x555Lab             = 0x00000103,
    BM_x555G3CH            = 0x00000104,
    BM_RGBTRIPLETS         = 0x00000002,
    BM_BGRTRIPLETS         = 0x00000004,
    BM_XYZTRIPLETS         = 0x00000201,
    BM_YxyTRIPLETS         = 0x00000202,
    BM_LabTRIPLETS         = 0x00000203,
    BM_G3CHTRIPLETS        = 0x00000204,
    BM_5CHANNEL            = 0x00000205,
    BM_6CHANNEL            = 0x00000206,
    BM_7CHANNEL            = 0x00000207,
    BM_8CHANNEL            = 0x00000208,
    BM_GRAY                = 0x00000209,
    BM_xRGBQUADS           = 0x00000008,
    BM_xBGRQUADS           = 0x00000010,
    BM_xG3CHQUADS          = 0x00000304,
    BM_KYMCQUADS           = 0x00000305,
    BM_CMYKQUADS           = 0x00000020,
    BM_10b_RGB             = 0x00000009,
    BM_10b_XYZ             = 0x00000401,
    BM_10b_Yxy             = 0x00000402,
    BM_10b_Lab             = 0x00000403,
    BM_10b_G3CH            = 0x00000404,
    BM_NAMED_INDEX         = 0x00000405,
    BM_16b_RGB             = 0x0000000a,
    BM_16b_XYZ             = 0x00000501,
    BM_16b_Yxy             = 0x00000502,
    BM_16b_Lab             = 0x00000503,
    BM_16b_G3CH            = 0x00000504,
    BM_16b_GRAY            = 0x00000505,
    BM_565RGB              = 0x00000001,
    BM_32b_scRGB           = 0x00000601,
    BM_32b_scARGB          = 0x00000602,
    BM_S2DOT13FIXED_scRGB  = 0x00000603,
    BM_S2DOT13FIXED_scARGB = 0x00000604,
    BM_R10G10B10A2         = 0x00000701,
    BM_R10G10B10A2_XR      = 0x00000702,
    BM_R16G16B16A16_FLOAT  = 0x00000703,
}

alias LPBMCALLBACKFN = BOOL function(uint, uint, LPARAM);
struct PROFILEHEADER
{
    uint phSize;
    uint phCMMType;
    uint phVersion;
    uint phClass;
    uint phDataColorSpace;
    uint phConnectionSpace;
    uint[3] phDateTime;
    uint phSignature;
    uint phPlatform;
    uint phProfileFlags;
    uint phManufacturer;
    uint phModel;
    uint[2] phAttributes;
    uint phRenderingIntent;
    CIEXYZ phIlluminant;
    uint phCreator;
    ubyte[44] phReserved;
}
struct PROFILE
{
    uint dwType;
    void* pProfileData;
    uint cbDataSize;
}
struct ENUMTYPEA
{
    uint dwSize;
    uint dwVersion;
    uint dwFields;
    const(char)* pDeviceName;
    uint dwMediaType;
    uint dwDitheringMode;
    uint[2] dwResolution;
    uint dwCMMType;
    uint dwClass;
    uint dwDataColorSpace;
    uint dwConnectionSpace;
    uint dwSignature;
    uint dwPlatform;
    uint dwProfileFlags;
    uint dwManufacturer;
    uint dwModel;
    uint[2] dwAttributes;
    uint dwRenderingIntent;
    uint dwCreator;
    uint dwDeviceClass;
}
struct ENUMTYPEW
{
    uint dwSize;
    uint dwVersion;
    uint dwFields;
    const(wchar)* pDeviceName;
    uint dwMediaType;
    uint dwDitheringMode;
    uint[2] dwResolution;
    uint dwCMMType;
    uint dwClass;
    uint dwDataColorSpace;
    uint dwConnectionSpace;
    uint dwSignature;
    uint dwPlatform;
    uint dwProfileFlags;
    uint dwManufacturer;
    uint dwModel;
    uint[2] dwAttributes;
    uint dwRenderingIntent;
    uint dwCreator;
    uint dwDeviceClass;
}
alias WCS_PROFILE_MANAGEMENT_SCOPE = int;
enum : int
{
    WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE  = 0x00000000,
    WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER = 0x00000001,
}

alias PCMSCALLBACKW = BOOL function(COLORMATCHSETUPW*, LPARAM);
alias PCMSCALLBACKA = BOOL function(COLORMATCHSETUPA*, LPARAM);
struct COLORMATCHSETUPW
{
    uint dwSize;
    uint dwVersion;
    uint dwFlags;
    HWND hwndOwner;
    const(wchar)* pSourceName;
    const(wchar)* pDisplayName;
    const(wchar)* pPrinterName;
    uint dwRenderIntent;
    uint dwProofingIntent;
    PWSTR pMonitorProfile;
    uint ccMonitorProfile;
    PWSTR pPrinterProfile;
    uint ccPrinterProfile;
    PWSTR pTargetProfile;
    uint ccTargetProfile;
    DLGPROC lpfnHook;
    LPARAM lParam;
    PCMSCALLBACKW lpfnApplyCallback;
    LPARAM lParamApplyCallback;
}
struct COLORMATCHSETUPA
{
    uint dwSize;
    uint dwVersion;
    uint dwFlags;
    HWND hwndOwner;
    const(char)* pSourceName;
    const(char)* pDisplayName;
    const(char)* pPrinterName;
    uint dwRenderIntent;
    uint dwProofingIntent;
    PSTR pMonitorProfile;
    uint ccMonitorProfile;
    PSTR pPrinterProfile;
    uint ccPrinterProfile;
    PSTR pTargetProfile;
    uint ccTargetProfile;
    DLGPROC lpfnHook;
    LPARAM lParam;
    PCMSCALLBACKA lpfnApplyCallback;
    LPARAM lParamApplyCallback;
}
struct WCS_DEVICE_VCGT_CAPABILITIES
{
    uint Size;
    BOOL SupportsVcgt;
}
struct WCS_DEVICE_MHC2_CAPABILITIES
{
    uint Size;
    BOOL SupportsMhc2;
    uint RegammaLutEntryCount;
    uint CscXyzMatrixRows;
    uint CscXyzMatrixColumns;
}
alias WCS_DEVICE_CAPABILITIES_TYPE = int;
enum : int
{
    VideoCardGammaTable      = 0x00000001,
    MicrosoftHardwareColorV2 = 0x00000002,
}

