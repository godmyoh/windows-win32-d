module windows.win32.system.assessmenttool;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMNodeList;
import windows.win32.foundation : BSTR, HRESULT, HWND, PWSTR;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;
import windows.win32.ui.accessibility : IAccessible;

version (Windows):
extern (Windows):

enum CLSID_CInitiateWinSAT = GUID(0x489331dc, 0xf5e0, 0x4528, [0x9f, 0xda, 0x45, 0x33, 0x1b, 0xf4, 0xa5, 0x71]);
struct CInitiateWinSAT
{
}
enum CLSID_CQueryWinSAT = GUID(0xf3bdfad3, 0xf276, 0x49e9, [0x9b, 0x17, 0xc4, 0x74, 0xf4, 0x8f, 0x7, 0x64]);
struct CQueryWinSAT
{
}
enum CLSID_CQueryAllWinSAT = GUID(0x5df8d13, 0xc355, 0x47f4, [0xa1, 0x1e, 0x85, 0x1b, 0x33, 0x8c, 0xef, 0xb8]);
struct CQueryAllWinSAT
{
}
enum CLSID_CProvideWinSATVisuals = GUID(0x9f377d7e, 0xe551, 0x44f8, [0x9f, 0x94, 0x9d, 0xb3, 0x92, 0xb0, 0x3b, 0x7b]);
struct CProvideWinSATVisuals
{
}
enum CLSID_CAccessiblityWinSAT = GUID(0x6e18f9c6, 0xa3eb, 0x495a, [0x89, 0xb7, 0x95, 0x64, 0x82, 0xe1, 0x9f, 0x7a]);
struct CAccessiblityWinSAT
{
}
enum CLSID_CQueryOEMWinSATCustomization = GUID(0xc47a41b7, 0xb729, 0x424f, [0x9a, 0xf9, 0x5c, 0xb3, 0x93, 0x4f, 0x2d, 0xfa]);
struct CQueryOEMWinSATCustomization
{
}
alias WINSAT_OEM_CUSTOMIZATION_STATE = int;
enum : int
{
    WINSAT_OEM_DATA_VALID                = 0x00000000,
    WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH = 0x00000001,
    WINSAT_OEM_DATA_INVALID              = 0x00000002,
    WINSAT_OEM_NO_DATA_SUPPLIED          = 0x00000003,
}

alias WINSAT_ASSESSMENT_STATE = int;
enum : int
{
    WINSAT_ASSESSMENT_STATE_MIN                      = 0x00000000,
    WINSAT_ASSESSMENT_STATE_UNKNOWN                  = 0x00000000,
    WINSAT_ASSESSMENT_STATE_VALID                    = 0x00000001,
    WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE = 0x00000002,
    WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE            = 0x00000003,
    WINSAT_ASSESSMENT_STATE_INVALID                  = 0x00000004,
    WINSAT_ASSESSMENT_STATE_MAX                      = 0x00000004,
}

alias WINSAT_ASSESSMENT_TYPE = int;
enum : int
{
    WINSAT_ASSESSMENT_MEMORY   = 0x00000000,
    WINSAT_ASSESSMENT_CPU      = 0x00000001,
    WINSAT_ASSESSMENT_DISK     = 0x00000002,
    WINSAT_ASSESSMENT_D3D      = 0x00000003,
    WINSAT_ASSESSMENT_GRAPHICS = 0x00000004,
}

alias WINSAT_BITMAP_SIZE = int;
enum : int
{
    WINSAT_BITMAP_SIZE_SMALL  = 0x00000000,
    WINSAT_BITMAP_SIZE_NORMAL = 0x00000001,
}

enum IID_IProvideWinSATAssessmentInfo = GUID(0xcd1c380, 0x52d3, 0x4678, [0xac, 0x6f, 0xe9, 0x29, 0xe4, 0x80, 0xbe, 0x9e]);
interface IProvideWinSATAssessmentInfo : IDispatch
{
    HRESULT get_Score(float*);
    HRESULT get_Title(BSTR*);
    HRESULT get_Description(BSTR*);
}
enum IID_IProvideWinSATResultsInfo = GUID(0xf8334d5d, 0x568e, 0x4075, [0x87, 0x5f, 0x9d, 0xf3, 0x41, 0x50, 0x66, 0x40]);
interface IProvideWinSATResultsInfo : IDispatch
{
    HRESULT GetAssessmentInfo(WINSAT_ASSESSMENT_TYPE, IProvideWinSATAssessmentInfo*);
    HRESULT get_AssessmentState(WINSAT_ASSESSMENT_STATE*);
    HRESULT get_AssessmentDateTime(VARIANT*);
    HRESULT get_SystemRating(float*);
    HRESULT get_RatingStateDesc(BSTR*);
}
enum IID_IQueryRecentWinSATAssessment = GUID(0xf8ad5d1f, 0x3b47, 0x4bdc, [0x93, 0x75, 0x7c, 0x6b, 0x1d, 0xa4, 0xec, 0xa7]);
interface IQueryRecentWinSATAssessment : IDispatch
{
    HRESULT get_XML(BSTR, BSTR, IXMLDOMNodeList*);
    HRESULT get_Info(IProvideWinSATResultsInfo*);
}
enum IID_IProvideWinSATVisuals = GUID(0xa9f4ade0, 0x871a, 0x42a3, [0xb8, 0x13, 0x30, 0x78, 0xd2, 0x51, 0x62, 0xc9]);
interface IProvideWinSATVisuals : IUnknown
{
    HRESULT get_Bitmap(WINSAT_BITMAP_SIZE, WINSAT_ASSESSMENT_STATE, float, HBITMAP*);
}
enum IID_IQueryAllWinSATAssessments = GUID(0xb89ed1d, 0x6398, 0x4fea, [0x87, 0xfc, 0x56, 0x7d, 0x8d, 0x19, 0x17, 0x6f]);
interface IQueryAllWinSATAssessments : IDispatch
{
    HRESULT get_AllXML(BSTR, BSTR, IXMLDOMNodeList*);
}
enum IID_IWinSATInitiateEvents = GUID(0x262a1918, 0xba0d, 0x41d5, [0x92, 0xc2, 0xfa, 0xb4, 0x63, 0x3e, 0xe7, 0x4f]);
interface IWinSATInitiateEvents : IUnknown
{
    HRESULT WinSATComplete(HRESULT, const(wchar)*);
    HRESULT WinSATUpdate(uint, uint, const(wchar)*);
}
enum IID_IInitiateWinSATAssessment = GUID(0xd983fc50, 0xf5bf, 0x49d5, [0xb5, 0xed, 0xcc, 0xcb, 0x18, 0xaa, 0x7f, 0xc1]);
interface IInitiateWinSATAssessment : IUnknown
{
    HRESULT InitiateAssessment(const(wchar)*, IWinSATInitiateEvents, HWND);
    HRESULT InitiateFormalAssessment(IWinSATInitiateEvents, HWND);
    HRESULT CancelAssessment();
}
enum IID_IAccessibleWinSAT = GUID(0x30e6018a, 0x94a8, 0x4ff8, [0xa6, 0x9a, 0x71, 0xb6, 0x74, 0x13, 0xf0, 0x7b]);
interface IAccessibleWinSAT : IAccessible
{
    HRESULT SetAccessiblityData(const(wchar)*, const(wchar)*, const(wchar)*);
}
enum IID_IQueryOEMWinSATCustomization = GUID(0xbc9a6a9f, 0xad4e, 0x420e, [0x99, 0x53, 0xb3, 0x46, 0x71, 0xe9, 0xdf, 0x22]);
interface IQueryOEMWinSATCustomization : IUnknown
{
    HRESULT GetOEMPrePopulationInfo(WINSAT_OEM_CUSTOMIZATION_STATE*);
}
