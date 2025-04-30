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

alias LCSCSTYPE = int;
enum : int
{
    LCS_CALIBRATED_RGB      = 0x00000000,
    LCS_sRGB                = 0x73524742,
    LCS_WINDOWS_COLOR_SPACE = 0x57696e20,
}

int SetICMMode(HDC hdc, ICM_MODE mode);
BOOL CheckColorsInGamut(HDC hdc, RGBTRIPLE* lpRGBTriple, void* dlpBuffer, uint nCount);
HCOLORSPACE GetColorSpace(HDC hdc);
BOOL GetLogColorSpaceA(HCOLORSPACE hColorSpace, LOGCOLORSPACEA* lpBuffer, uint nSize);
BOOL GetLogColorSpaceW(HCOLORSPACE hColorSpace, LOGCOLORSPACEW* lpBuffer, uint nSize);
HCOLORSPACE CreateColorSpaceA(LOGCOLORSPACEA* lplcs);
HCOLORSPACE CreateColorSpaceW(LOGCOLORSPACEW* lplcs);
HCOLORSPACE SetColorSpace(HDC hdc, HCOLORSPACE hcs);
BOOL DeleteColorSpace(HCOLORSPACE hcs);
BOOL GetICMProfileA(HDC hdc, uint* pBufSize, PSTR pszFilename);
BOOL GetICMProfileW(HDC hdc, uint* pBufSize, PWSTR pszFilename);
BOOL SetICMProfileA(HDC hdc, PSTR lpFileName);
BOOL SetICMProfileW(HDC hdc, PWSTR lpFileName);
BOOL GetDeviceGammaRamp(HDC hdc, void* lpRamp);
BOOL SetDeviceGammaRamp(HDC hdc, void* lpRamp);
BOOL ColorMatchToTarget(HDC hdc, HDC hdcTarget, COLOR_MATCH_TO_TARGET_ACTION action);
int EnumICMProfilesA(HDC hdc, ICMENUMPROCA proc, LPARAM param2);
int EnumICMProfilesW(HDC hdc, ICMENUMPROCW proc, LPARAM param2);
BOOL UpdateICMRegKeyA(uint reserved, PSTR lpszCMID, PSTR lpszFileName, ICM_COMMAND command);
BOOL UpdateICMRegKeyW(uint reserved, PWSTR lpszCMID, PWSTR lpszFileName, ICM_COMMAND command);
BOOL ColorCorrectPalette(HDC hdc, HPALETTE hPal, uint deFirst, uint num);
long OpenColorProfileA(PROFILE* pProfile, uint dwDesiredAccess, uint dwShareMode, uint dwCreationMode);
long OpenColorProfileW(PROFILE* pProfile, uint dwDesiredAccess, uint dwShareMode, uint dwCreationMode);
BOOL CloseColorProfile(long hProfile);
BOOL GetColorProfileFromHandle(long hProfile, ubyte* pProfile, uint* pcbProfile);
BOOL IsColorProfileValid(long hProfile, BOOL* pbValid);
BOOL CreateProfileFromLogColorSpaceA(LOGCOLORSPACEA* pLogColorSpace, ubyte** pProfile);
BOOL CreateProfileFromLogColorSpaceW(LOGCOLORSPACEW* pLogColorSpace, ubyte** pProfile);
BOOL GetCountColorProfileElements(long hProfile, uint* pnElementCount);
BOOL GetColorProfileHeader(long hProfile, PROFILEHEADER* pHeader);
BOOL GetColorProfileElementTag(long hProfile, uint dwIndex, uint* pTag);
BOOL IsColorProfileTagPresent(long hProfile, uint tag, BOOL* pbPresent);
BOOL GetColorProfileElement(long hProfile, uint tag, uint dwOffset, uint* pcbElement, void* pElement, BOOL* pbReference);
BOOL SetColorProfileHeader(long hProfile, PROFILEHEADER* pHeader);
BOOL SetColorProfileElementSize(long hProfile, uint tagType, uint pcbElement);
BOOL SetColorProfileElement(long hProfile, uint tag, uint dwOffset, uint* pcbElement, void* pElement);
BOOL SetColorProfileElementReference(long hProfile, uint newTag, uint refTag);
BOOL GetPS2ColorSpaceArray(long hProfile, uint dwIntent, uint dwCSAType, ubyte* pPS2ColorSpaceArray, uint* pcbPS2ColorSpaceArray, BOOL* pbBinary);
BOOL GetPS2ColorRenderingIntent(long hProfile, uint dwIntent, ubyte* pBuffer, uint* pcbPS2ColorRenderingIntent);
BOOL GetPS2ColorRenderingDictionary(long hProfile, uint dwIntent, ubyte* pPS2ColorRenderingDictionary, uint* pcbPS2ColorRenderingDictionary, BOOL* pbBinary);
BOOL GetNamedProfileInfo(long hProfile, NAMED_PROFILE_INFO* pNamedProfileInfo);
BOOL ConvertColorNameToIndex(long hProfile, byte** paColorName, uint* paIndex, uint dwCount);
BOOL ConvertIndexToColorName(long hProfile, uint* paIndex, byte** paColorName, uint dwCount);
BOOL CreateDeviceLinkProfile(long* hProfile, uint nProfiles, uint* padwIntent, uint nIntents, uint dwFlags, ubyte** pProfileData, uint indexPreferredCMM);
long CreateColorTransformA(LOGCOLORSPACEA* pLogColorSpace, long hDestProfile, long hTargetProfile, uint dwFlags);
long CreateColorTransformW(LOGCOLORSPACEW* pLogColorSpace, long hDestProfile, long hTargetProfile, uint dwFlags);
long CreateMultiProfileTransform(long* pahProfiles, uint nProfiles, uint* padwIntent, uint nIntents, uint dwFlags, uint indexPreferredCMM);
BOOL DeleteColorTransform(long hxform);
BOOL TranslateBitmapBits(long hColorTransform, void* pSrcBits, BMFORMAT bmInput, uint dwWidth, uint dwHeight, uint dwInputStride, void* pDestBits, BMFORMAT bmOutput, uint dwOutputStride, LPBMCALLBACKFN pfnCallBack, LPARAM ulCallbackData);
BOOL CheckBitmapBits(long hColorTransform, void* pSrcBits, BMFORMAT bmInput, uint dwWidth, uint dwHeight, uint dwStride, ubyte* paResult, LPBMCALLBACKFN pfnCallback, LPARAM lpCallbackData);
BOOL TranslateColors(long hColorTransform, COLOR* paInputColors, uint nColors, COLORTYPE ctInput, COLOR* paOutputColors, COLORTYPE ctOutput);
BOOL CheckColors(long hColorTransform, COLOR* paInputColors, uint nColors, COLORTYPE ctInput, ubyte* paResult);
uint GetCMMInfo(long hColorTransform, uint param1);
BOOL RegisterCMMA(const(char)* pMachineName, uint cmmID, const(char)* pCMMdll);
BOOL RegisterCMMW(const(wchar)* pMachineName, uint cmmID, const(wchar)* pCMMdll);
BOOL UnregisterCMMA(const(char)* pMachineName, uint cmmID);
BOOL UnregisterCMMW(const(wchar)* pMachineName, uint cmmID);
BOOL SelectCMM(uint dwCMMType);
BOOL GetColorDirectoryA(const(char)* pMachineName, PSTR pBuffer, uint* pdwSize);
BOOL GetColorDirectoryW(const(wchar)* pMachineName, PWSTR pBuffer, uint* pdwSize);
BOOL InstallColorProfileA(const(char)* pMachineName, const(char)* pProfileName);
BOOL InstallColorProfileW(const(wchar)* pMachineName, const(wchar)* pProfileName);
BOOL UninstallColorProfileA(const(char)* pMachineName, const(char)* pProfileName, BOOL bDelete);
BOOL UninstallColorProfileW(const(wchar)* pMachineName, const(wchar)* pProfileName, BOOL bDelete);
BOOL EnumColorProfilesA(const(char)* pMachineName, ENUMTYPEA* pEnumRecord, ubyte* pEnumerationBuffer, uint* pdwSizeOfEnumerationBuffer, uint* pnProfiles);
BOOL EnumColorProfilesW(const(wchar)* pMachineName, ENUMTYPEW* pEnumRecord, ubyte* pEnumerationBuffer, uint* pdwSizeOfEnumerationBuffer, uint* pnProfiles);
BOOL SetStandardColorSpaceProfileA(const(char)* pMachineName, uint dwProfileID, const(char)* pProfilename);
BOOL SetStandardColorSpaceProfileW(const(wchar)* pMachineName, uint dwProfileID, const(wchar)* pProfileName);
BOOL GetStandardColorSpaceProfileA(const(char)* pMachineName, uint dwSCS, PSTR pBuffer, uint* pcbSize);
BOOL GetStandardColorSpaceProfileW(const(wchar)* pMachineName, uint dwSCS, PWSTR pBuffer, uint* pcbSize);
BOOL AssociateColorProfileWithDeviceA(const(char)* pMachineName, const(char)* pProfileName, const(char)* pDeviceName);
BOOL AssociateColorProfileWithDeviceW(const(wchar)* pMachineName, const(wchar)* pProfileName, const(wchar)* pDeviceName);
BOOL DisassociateColorProfileFromDeviceA(const(char)* pMachineName, const(char)* pProfileName, const(char)* pDeviceName);
BOOL DisassociateColorProfileFromDeviceW(const(wchar)* pMachineName, const(wchar)* pProfileName, const(wchar)* pDeviceName);
BOOL SetupColorMatchingW(COLORMATCHSETUPW* pcms);
BOOL SetupColorMatchingA(COLORMATCHSETUPA* pcms);
BOOL WcsAssociateColorProfileWithDevice(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* pProfileName, const(wchar)* pDeviceName);
BOOL WcsDisassociateColorProfileFromDevice(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* pProfileName, const(wchar)* pDeviceName);
BOOL WcsEnumColorProfilesSize(WCS_PROFILE_MANAGEMENT_SCOPE scope_, ENUMTYPEW* pEnumRecord, uint* pdwSize);
BOOL WcsEnumColorProfiles(WCS_PROFILE_MANAGEMENT_SCOPE scope_, ENUMTYPEW* pEnumRecord, ubyte* pBuffer, uint dwSize, uint* pnProfiles);
BOOL WcsGetDefaultColorProfileSize(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* pDeviceName, COLORPROFILETYPE cptColorProfileType, COLORPROFILESUBTYPE cpstColorProfileSubType, uint dwProfileID, uint* pcbProfileName);
BOOL WcsGetDefaultColorProfile(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* pDeviceName, COLORPROFILETYPE cptColorProfileType, COLORPROFILESUBTYPE cpstColorProfileSubType, uint dwProfileID, uint cbProfileName, PWSTR pProfileName);
BOOL WcsSetDefaultColorProfile(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* pDeviceName, COLORPROFILETYPE cptColorProfileType, COLORPROFILESUBTYPE cpstColorProfileSubType, uint dwProfileID, const(wchar)* pProfileName);
BOOL WcsSetDefaultRenderingIntent(WCS_PROFILE_MANAGEMENT_SCOPE scope_, uint dwRenderingIntent);
BOOL WcsGetDefaultRenderingIntent(WCS_PROFILE_MANAGEMENT_SCOPE scope_, uint* pdwRenderingIntent);
BOOL WcsGetUsePerUserProfiles(const(wchar)* pDeviceName, uint dwDeviceClass, BOOL* pUsePerUserProfiles);
BOOL WcsSetUsePerUserProfiles(const(wchar)* pDeviceName, uint dwDeviceClass, BOOL usePerUserProfiles);
BOOL WcsTranslateColors(long hColorTransform, uint nColors, uint nInputChannels, COLORDATATYPE cdtInput, uint cbInput, void* pInputData, uint nOutputChannels, COLORDATATYPE cdtOutput, uint cbOutput, void* pOutputData);
BOOL WcsCheckColors(long hColorTransform, uint nColors, uint nInputChannels, COLORDATATYPE cdtInput, uint cbInput, void* pInputData, ubyte* paResult);
BOOL CMCheckColors(long hcmTransform, COLOR* lpaInputColors, uint nColors, COLORTYPE ctInput, ubyte* lpaResult);
BOOL CMCheckRGBs(long hcmTransform, void* lpSrcBits, BMFORMAT bmInput, uint dwWidth, uint dwHeight, uint dwStride, ubyte* lpaResult, LPBMCALLBACKFN pfnCallback, LPARAM ulCallbackData);
BOOL CMConvertColorNameToIndex(long hProfile, byte** paColorName, uint* paIndex, uint dwCount);
BOOL CMConvertIndexToColorName(long hProfile, uint* paIndex, byte** paColorName, uint dwCount);
BOOL CMCreateDeviceLinkProfile(long* pahProfiles, uint nProfiles, uint* padwIntents, uint nIntents, uint dwFlags, ubyte** lpProfileData);
long CMCreateMultiProfileTransform(long* pahProfiles, uint nProfiles, uint* padwIntents, uint nIntents, uint dwFlags);
BOOL CMCreateProfileW(LOGCOLORSPACEW* lpColorSpace, void** lpProfileData);
long CMCreateTransform(LOGCOLORSPACEA* lpColorSpace, void* lpDevCharacter, void* lpTargetDevCharacter);
long CMCreateTransformW(LOGCOLORSPACEW* lpColorSpace, void* lpDevCharacter, void* lpTargetDevCharacter);
long CMCreateTransformExt(LOGCOLORSPACEA* lpColorSpace, void* lpDevCharacter, void* lpTargetDevCharacter, uint dwFlags);
BOOL CMCheckColorsInGamut(long hcmTransform, RGBTRIPLE* lpaRGBTriple, ubyte* lpaResult, uint nCount);
BOOL CMCreateProfile(LOGCOLORSPACEA* lpColorSpace, void** lpProfileData);
BOOL CMTranslateRGB(long hcmTransform, COLORREF ColorRef, uint* lpColorRef, uint dwFlags);
BOOL CMTranslateRGBs(long hcmTransform, void* lpSrcBits, BMFORMAT bmInput, uint dwWidth, uint dwHeight, uint dwStride, void* lpDestBits, BMFORMAT bmOutput, uint dwTranslateDirection);
long CMCreateTransformExtW(LOGCOLORSPACEW* lpColorSpace, void* lpDevCharacter, void* lpTargetDevCharacter, uint dwFlags);
BOOL CMDeleteTransform(long hcmTransform);
uint CMGetInfo(uint dwInfo);
BOOL CMGetNamedProfileInfo(long hProfile, NAMED_PROFILE_INFO* pNamedProfileInfo);
BOOL CMIsProfileValid(long hProfile, BOOL* lpbValid);
BOOL CMTranslateColors(long hcmTransform, COLOR* lpaInputColors, uint nColors, COLORTYPE ctInput, COLOR* lpaOutputColors, COLORTYPE ctOutput);
BOOL CMTranslateRGBsExt(long hcmTransform, void* lpSrcBits, BMFORMAT bmInput, uint dwWidth, uint dwHeight, uint dwInputStride, void* lpDestBits, BMFORMAT bmOutput, uint dwOutputStride, LPBMCALLBACKFN lpfnCallback, LPARAM ulCallbackData);
long WcsOpenColorProfileA(PROFILE* pCDMPProfile, PROFILE* pCAMPProfile, PROFILE* pGMMPProfile, uint dwDesireAccess, uint dwShareMode, uint dwCreationMode, uint dwFlags);
long WcsOpenColorProfileW(PROFILE* pCDMPProfile, PROFILE* pCAMPProfile, PROFILE* pGMMPProfile, uint dwDesireAccess, uint dwShareMode, uint dwCreationMode, uint dwFlags);
long WcsCreateIccProfile(long hWcsProfile, uint dwOptions);
BOOL WcsGetCalibrationManagementState(BOOL* pbIsEnabled);
BOOL WcsSetCalibrationManagementState(BOOL bIsEnabled);
HRESULT ColorProfileAddDisplayAssociation(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* profileName, LUID targetAdapterID, uint sourceID, BOOL setAsDefault, BOOL associateAsAdvancedColor);
HRESULT ColorProfileRemoveDisplayAssociation(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* profileName, LUID targetAdapterID, uint sourceID, BOOL dissociateAdvancedColor);
HRESULT ColorProfileSetDisplayDefaultAssociation(WCS_PROFILE_MANAGEMENT_SCOPE scope_, const(wchar)* profileName, COLORPROFILETYPE profileType, COLORPROFILESUBTYPE profileSubType, LUID targetAdapterID, uint sourceID);
HRESULT ColorProfileGetDisplayList(WCS_PROFILE_MANAGEMENT_SCOPE scope_, LUID targetAdapterID, uint sourceID, PWSTR** profileList, uint* profileCount);
HRESULT ColorProfileGetDisplayDefault(WCS_PROFILE_MANAGEMENT_SCOPE scope_, LUID targetAdapterID, uint sourceID, COLORPROFILETYPE profileType, COLORPROFILESUBTYPE profileSubType, PWSTR* profileName);
HRESULT ColorProfileGetDisplayUserScope(LUID targetAdapterID, uint sourceID, WCS_PROFILE_MANAGEMENT_SCOPE* scope_);
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
    LCSCSTYPE lcsCSType;
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
    LCSCSTYPE lcsCSType;
    int lcsIntent;
    CIEXYZTRIPLE lcsEndpoints;
    uint lcsGammaRed;
    uint lcsGammaGreen;
    uint lcsGammaBlue;
    wchar[260] lcsFilename;
}
alias ICMENUMPROCA = int function(PSTR param0, LPARAM param1);
alias ICMENUMPROCW = int function(PWSTR param0, LPARAM param1);
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
    HRESULT Initialize(BSTR bstrXml, uint cNumModels, uint iModelPosition);
    HRESULT GetNumChannels(uint* pNumChannels);
    HRESULT DeviceToColorimetricColors(uint cColors, uint cChannels, const(float)* pDeviceValues, XYZColorF* pXYZColors);
    HRESULT ColorimetricToDeviceColors(uint cColors, uint cChannels, const(XYZColorF)* pXYZColors, float* pDeviceValues);
    HRESULT ColorimetricToDeviceColorsWithBlack(uint cColors, uint cChannels, const(XYZColorF)* pXYZColors, const(BlackInformation)* pBlackInformation, float* pDeviceValues);
    HRESULT SetTransformDeviceModelInfo(uint iModelPosition, IDeviceModelPlugIn pIDeviceModelOther);
    HRESULT GetPrimarySamples(PrimaryXYZColors* pPrimaryColor);
    HRESULT GetGamutBoundaryMeshSize(uint* pNumVertices, uint* pNumTriangles);
    HRESULT GetGamutBoundaryMesh(uint cChannels, uint cVertices, uint cTriangles, float* pVertices, GamutShellTriangle* pTriangles);
    HRESULT GetNeutralAxisSize(uint* pcColors);
    HRESULT GetNeutralAxis(uint cColors, XYZColorF* pXYZColors);
}
enum IID_IGamutMapModelPlugIn = GUID(0x2dd80115, 0xad1e, 0x41f6, [0xa2, 0x19, 0xa4, 0xf4, 0xb5, 0x83, 0xd1, 0xf9]);
interface IGamutMapModelPlugIn : IUnknown
{
    HRESULT Initialize(BSTR bstrXml, IDeviceModelPlugIn pSrcPlugIn, IDeviceModelPlugIn pDestPlugIn, GamutBoundaryDescription* pSrcGBD, GamutBoundaryDescription* pDestGBD);
    HRESULT SourceToDestinationAppearanceColors(uint cColors, const(JChColorF)* pInputColors, JChColorF* pOutputColors);
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

alias LPBMCALLBACKFN = BOOL function(uint param0, uint param1, LPARAM param2);
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

alias PCMSCALLBACKW = BOOL function(COLORMATCHSETUPW* param0, LPARAM param1);
alias PCMSCALLBACKA = BOOL function(COLORMATCHSETUPA* param0, LPARAM param1);
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

