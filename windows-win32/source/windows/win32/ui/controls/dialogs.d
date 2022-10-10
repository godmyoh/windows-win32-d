module windows.win32.ui.controls.dialogs;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, COLORREF, HINSTANCE, HRESULT, HWND, LPARAM, LRESULT, POINT, PSTR, PWSTR, RECT, WPARAM;
import windows.win32.graphics.gdi : DEVMODEA, HDC, LOGFONTA, LOGFONTW;
import windows.win32.system.com_ : IUnknown;
import windows.win32.ui.controls_ : HPROPSHEETPAGE, NMHDR;

version (Windows):
extern (Windows):

alias COMMON_DLG_ERRORS = uint;
enum : uint
{
    CDERR_DIALOGFAILURE    = 0x0000ffff,
    CDERR_GENERALCODES     = 0x00000000,
    CDERR_STRUCTSIZE       = 0x00000001,
    CDERR_INITIALIZATION   = 0x00000002,
    CDERR_NOTEMPLATE       = 0x00000003,
    CDERR_NOHINSTANCE      = 0x00000004,
    CDERR_LOADSTRFAILURE   = 0x00000005,
    CDERR_FINDRESFAILURE   = 0x00000006,
    CDERR_LOADRESFAILURE   = 0x00000007,
    CDERR_LOCKRESFAILURE   = 0x00000008,
    CDERR_MEMALLOCFAILURE  = 0x00000009,
    CDERR_MEMLOCKFAILURE   = 0x0000000a,
    CDERR_NOHOOK           = 0x0000000b,
    CDERR_REGISTERMSGFAIL  = 0x0000000c,
    PDERR_PRINTERCODES     = 0x00001000,
    PDERR_SETUPFAILURE     = 0x00001001,
    PDERR_PARSEFAILURE     = 0x00001002,
    PDERR_RETDEFFAILURE    = 0x00001003,
    PDERR_LOADDRVFAILURE   = 0x00001004,
    PDERR_GETDEVMODEFAIL   = 0x00001005,
    PDERR_INITFAILURE      = 0x00001006,
    PDERR_NODEVICES        = 0x00001007,
    PDERR_NODEFAULTPRN     = 0x00001008,
    PDERR_DNDMMISMATCH     = 0x00001009,
    PDERR_CREATEICFAILURE  = 0x0000100a,
    PDERR_PRINTERNOTFOUND  = 0x0000100b,
    PDERR_DEFAULTDIFFERENT = 0x0000100c,
    CFERR_CHOOSEFONTCODES  = 0x00002000,
    CFERR_NOFONTS          = 0x00002001,
    CFERR_MAXLESSTHANMIN   = 0x00002002,
    FNERR_FILENAMECODES    = 0x00003000,
    FNERR_SUBCLASSFAILURE  = 0x00003001,
    FNERR_INVALIDFILENAME  = 0x00003002,
    FNERR_BUFFERTOOSMALL   = 0x00003003,
    FRERR_FINDREPLACECODES = 0x00004000,
    FRERR_BUFFERLENGTHZERO = 0x00004001,
    CCERR_CHOOSECOLORCODES = 0x00005000,
}

alias CHOOSECOLOR_FLAGS = uint;
enum : uint
{
    CC_RGBINIT              = 0x00000001,
    CC_FULLOPEN             = 0x00000002,
    CC_PREVENTFULLOPEN      = 0x00000004,
    CC_SHOWHELP             = 0x00000008,
    CC_ENABLEHOOK           = 0x00000010,
    CC_ENABLETEMPLATE       = 0x00000020,
    CC_ENABLETEMPLATEHANDLE = 0x00000040,
    CC_SOLIDCOLOR           = 0x00000080,
    CC_ANYCOLOR             = 0x00000100,
}

alias OPEN_FILENAME_FLAGS = uint;
enum : uint
{
    OFN_READONLY             = 0x00000001,
    OFN_OVERWRITEPROMPT      = 0x00000002,
    OFN_HIDEREADONLY         = 0x00000004,
    OFN_NOCHANGEDIR          = 0x00000008,
    OFN_SHOWHELP             = 0x00000010,
    OFN_ENABLEHOOK           = 0x00000020,
    OFN_ENABLETEMPLATE       = 0x00000040,
    OFN_ENABLETEMPLATEHANDLE = 0x00000080,
    OFN_NOVALIDATE           = 0x00000100,
    OFN_ALLOWMULTISELECT     = 0x00000200,
    OFN_EXTENSIONDIFFERENT   = 0x00000400,
    OFN_PATHMUSTEXIST        = 0x00000800,
    OFN_FILEMUSTEXIST        = 0x00001000,
    OFN_CREATEPROMPT         = 0x00002000,
    OFN_SHAREAWARE           = 0x00004000,
    OFN_NOREADONLYRETURN     = 0x00008000,
    OFN_NOTESTFILECREATE     = 0x00010000,
    OFN_NONETWORKBUTTON      = 0x00020000,
    OFN_NOLONGNAMES          = 0x00040000,
    OFN_EXPLORER             = 0x00080000,
    OFN_NODEREFERENCELINKS   = 0x00100000,
    OFN_LONGNAMES            = 0x00200000,
    OFN_ENABLEINCLUDENOTIFY  = 0x00400000,
    OFN_ENABLESIZING         = 0x00800000,
    OFN_DONTADDTORECENT      = 0x02000000,
    OFN_FORCESHOWHIDDEN      = 0x10000000,
}

alias OPEN_FILENAME_FLAGS_EX = uint;
enum : uint
{
    OFN_EX_NONE        = 0x00000000,
    OFN_EX_NOPLACESBAR = 0x00000001,
}

alias PAGESETUPDLG_FLAGS = uint;
enum : uint
{
    PSD_DEFAULTMINMARGINS             = 0x00000000,
    PSD_DISABLEMARGINS                = 0x00000010,
    PSD_DISABLEORIENTATION            = 0x00000100,
    PSD_DISABLEPAGEPAINTING           = 0x00080000,
    PSD_DISABLEPAPER                  = 0x00000200,
    PSD_DISABLEPRINTER                = 0x00000020,
    PSD_ENABLEPAGEPAINTHOOK           = 0x00040000,
    PSD_ENABLEPAGESETUPHOOK           = 0x00002000,
    PSD_ENABLEPAGESETUPTEMPLATE       = 0x00008000,
    PSD_ENABLEPAGESETUPTEMPLATEHANDLE = 0x00020000,
    PSD_INHUNDREDTHSOFMILLIMETERS     = 0x00000008,
    PSD_INTHOUSANDTHSOFINCHES         = 0x00000004,
    PSD_INWININIINTLMEASURE           = 0x00000000,
    PSD_MARGINS                       = 0x00000002,
    PSD_MINMARGINS                    = 0x00000001,
    PSD_NONETWORKBUTTON               = 0x00200000,
    PSD_NOWARNING                     = 0x00000080,
    PSD_RETURNDEFAULT                 = 0x00000400,
    PSD_SHOWHELP                      = 0x00000800,
}

alias CHOOSEFONT_FLAGS = uint;
enum : uint
{
    CF_APPLY                = 0x00000200,
    CF_ANSIONLY             = 0x00000400,
    CF_BOTH                 = 0x00000003,
    CF_EFFECTS              = 0x00000100,
    CF_ENABLEHOOK           = 0x00000008,
    CF_ENABLETEMPLATE       = 0x00000010,
    CF_ENABLETEMPLATEHANDLE = 0x00000020,
    CF_FIXEDPITCHONLY       = 0x00004000,
    CF_FORCEFONTEXIST       = 0x00010000,
    CF_INACTIVEFONTS        = 0x02000000,
    CF_INITTOLOGFONTSTRUCT  = 0x00000040,
    CF_LIMITSIZE            = 0x00002000,
    CF_NOOEMFONTS           = 0x00000800,
    CF_NOFACESEL            = 0x00080000,
    CF_NOSCRIPTSEL          = 0x00800000,
    CF_NOSIMULATIONS        = 0x00001000,
    CF_NOSIZESEL            = 0x00200000,
    CF_NOSTYLESEL           = 0x00100000,
    CF_NOVECTORFONTS        = 0x00000800,
    CF_NOVERTFONTS          = 0x01000000,
    CF_PRINTERFONTS         = 0x00000002,
    CF_SCALABLEONLY         = 0x00020000,
    CF_SCREENFONTS          = 0x00000001,
    CF_SCRIPTSONLY          = 0x00000400,
    CF_SELECTSCRIPT         = 0x00400000,
    CF_SHOWHELP             = 0x00000004,
    CF_TTONLY               = 0x00040000,
    CF_USESTYLE             = 0x00000080,
    CF_WYSIWYG              = 0x00008000,
}

alias FINDREPLACE_FLAGS = uint;
enum : uint
{
    FR_DIALOGTERM           = 0x00000040,
    FR_DOWN                 = 0x00000001,
    FR_ENABLEHOOK           = 0x00000100,
    FR_ENABLETEMPLATE       = 0x00000200,
    FR_ENABLETEMPLATEHANDLE = 0x00002000,
    FR_FINDNEXT             = 0x00000008,
    FR_HIDEUPDOWN           = 0x00004000,
    FR_HIDEMATCHCASE        = 0x00008000,
    FR_HIDEWHOLEWORD        = 0x00010000,
    FR_MATCHCASE            = 0x00000004,
    FR_NOMATCHCASE          = 0x00000800,
    FR_NOUPDOWN             = 0x00000400,
    FR_NOWHOLEWORD          = 0x00001000,
    FR_REPLACE              = 0x00000010,
    FR_REPLACEALL           = 0x00000020,
    FR_SHOWHELP             = 0x00000080,
    FR_WHOLEWORD            = 0x00000002,
}

alias PRINTDLGEX_FLAGS = uint;
enum : uint
{
    PD_ALLPAGES                   = 0x00000000,
    PD_COLLATE                    = 0x00000010,
    PD_CURRENTPAGE                = 0x00400000,
    PD_DISABLEPRINTTOFILE         = 0x00080000,
    PD_ENABLEPRINTTEMPLATE        = 0x00004000,
    PD_ENABLEPRINTTEMPLATEHANDLE  = 0x00010000,
    PD_EXCLUSIONFLAGS             = 0x01000000,
    PD_HIDEPRINTTOFILE            = 0x00100000,
    PD_NOCURRENTPAGE              = 0x00800000,
    PD_NOPAGENUMS                 = 0x00000008,
    PD_NOSELECTION                = 0x00000004,
    PD_NOWARNING                  = 0x00000080,
    PD_PAGENUMS                   = 0x00000002,
    PD_PRINTTOFILE                = 0x00000020,
    PD_RETURNDC                   = 0x00000100,
    PD_RETURNDEFAULT              = 0x00000400,
    PD_RETURNIC                   = 0x00000200,
    PD_SELECTION                  = 0x00000001,
    PD_USEDEVMODECOPIES           = 0x00040000,
    PD_USEDEVMODECOPIESANDCOLLATE = 0x00040000,
    PD_USELARGETEMPLATE           = 0x10000000,
    PD_ENABLEPRINTHOOK            = 0x00001000,
    PD_ENABLESETUPHOOK            = 0x00002000,
    PD_ENABLESETUPTEMPLATE        = 0x00008000,
    PD_ENABLESETUPTEMPLATEHANDLE  = 0x00020000,
    PD_NONETWORKBUTTON            = 0x00200000,
    PD_PRINTSETUP                 = 0x00000040,
    PD_SHOWHELP                   = 0x00000800,
}

alias CHOOSEFONT_FONT_TYPE = ushort;
enum : ushort
{
    BOLD_FONTTYPE      = 0x0100,
    ITALIC_FONTTYPE    = 0x0200,
    PRINTER_FONTTYPE   = 0x4000,
    REGULAR_FONTTYPE   = 0x0400,
    SCREEN_FONTTYPE    = 0x2000,
    SIMULATED_FONTTYPE = 0x8000,
}

BOOL GetOpenFileNameA(OPENFILENAMEA*);
BOOL GetOpenFileNameW(OPENFILENAMEW*);
BOOL GetSaveFileNameA(OPENFILENAMEA*);
BOOL GetSaveFileNameW(OPENFILENAMEW*);
short GetFileTitleA(const(char)*, PSTR, ushort);
short GetFileTitleW(const(wchar)*, PWSTR, ushort);
BOOL ChooseColorA(CHOOSECOLORA*);
BOOL ChooseColorW(CHOOSECOLORW*);
HWND FindTextA(FINDREPLACEA*);
HWND FindTextW(FINDREPLACEW*);
HWND ReplaceTextA(FINDREPLACEA*);
HWND ReplaceTextW(FINDREPLACEW*);
BOOL ChooseFontA(CHOOSEFONTA*);
BOOL ChooseFontW(CHOOSEFONTW*);
BOOL PrintDlgA(PRINTDLGA*);
BOOL PrintDlgW(PRINTDLGW*);
HRESULT PrintDlgExA(PRINTDLGEXA*);
HRESULT PrintDlgExW(PRINTDLGEXW*);
COMMON_DLG_ERRORS CommDlgExtendedError();
BOOL PageSetupDlgA(PAGESETUPDLGA*);
BOOL PageSetupDlgW(PAGESETUPDLGW*);
enum OFN_SHAREFALLTHROUGH = 0x00000002;
enum OFN_SHARENOWARN = 0x00000001;
enum OFN_SHAREWARN = 0x00000000;
enum CDM_FIRST = 0x00000464;
enum CDM_LAST = 0x000004c8;
enum CDM_GETSPEC = 0x00000464;
enum CDM_GETFILEPATH = 0x00000465;
enum CDM_GETFOLDERPATH = 0x00000466;
enum CDM_GETFOLDERIDLIST = 0x00000467;
enum CDM_SETCONTROLTEXT = 0x00000468;
enum CDM_HIDECONTROL = 0x00000469;
enum CDM_SETDEFEXT = 0x0000046a;
enum FR_RAW = 0x00020000;
enum FR_SHOWWRAPAROUND = 0x00040000;
enum FR_NOWRAPAROUND = 0x00080000;
enum FR_WRAPAROUND = 0x00100000;
enum FRM_FIRST = 0x00000464;
enum FRM_LAST = 0x000004c8;
enum FRM_SETOPERATIONRESULT = 0x00000464;
enum FRM_SETOPERATIONRESULTTEXT = 0x00000465;
enum PS_OPENTYPE_FONTTYPE = 0x00010000;
enum TT_OPENTYPE_FONTTYPE = 0x00020000;
enum TYPE1_FONTTYPE = 0x00040000;
enum SYMBOL_FONTTYPE = 0x00080000;
enum WM_CHOOSEFONT_GETLOGFONT = 0x00000401;
enum WM_CHOOSEFONT_SETLOGFONT = 0x00000465;
enum WM_CHOOSEFONT_SETFLAGS = 0x00000466;
enum LBSELCHSTRINGA = "commdlg_LBSelChangedNotify";
enum SHAREVISTRINGA = "commdlg_ShareViolation";
enum FILEOKSTRINGA = "commdlg_FileNameOK";
enum COLOROKSTRINGA = "commdlg_ColorOK";
enum SETRGBSTRINGA = "commdlg_SetRGBColor";
enum HELPMSGSTRINGA = "commdlg_help";
enum FINDMSGSTRINGA = "commdlg_FindReplace";
enum LBSELCHSTRINGW = "commdlg_LBSelChangedNotify";
enum SHAREVISTRINGW = "commdlg_ShareViolation";
enum FILEOKSTRINGW = "commdlg_FileNameOK";
enum COLOROKSTRINGW = "commdlg_ColorOK";
enum SETRGBSTRINGW = "commdlg_SetRGBColor";
enum HELPMSGSTRINGW = "commdlg_help";
enum FINDMSGSTRINGW = "commdlg_FindReplace";
enum LBSELCHSTRING = "commdlg_LBSelChangedNotify";
enum SHAREVISTRING = "commdlg_ShareViolation";
enum FILEOKSTRING = "commdlg_FileNameOK";
enum COLOROKSTRING = "commdlg_ColorOK";
enum SETRGBSTRING = "commdlg_SetRGBColor";
enum HELPMSGSTRING = "commdlg_help";
enum FINDMSGSTRING = "commdlg_FindReplace";
enum CD_LBSELNOITEMS = 0xffffffffffffffff;
enum CD_LBSELCHANGE = 0x00000000;
enum CD_LBSELSUB = 0x00000001;
enum CD_LBSELADD = 0x00000002;
enum START_PAGE_GENERAL = 0xffffffff;
enum PD_RESULT_CANCEL = 0x00000000;
enum PD_RESULT_PRINT = 0x00000001;
enum PD_RESULT_APPLY = 0x00000002;
enum DN_DEFAULTPRN = 0x00000001;
enum WM_PSD_FULLPAGERECT = 0x00000401;
enum WM_PSD_MINMARGINRECT = 0x00000402;
enum WM_PSD_MARGINRECT = 0x00000403;
enum WM_PSD_GREEKTEXTRECT = 0x00000404;
enum WM_PSD_ENVSTAMPRECT = 0x00000405;
enum WM_PSD_YAFULLPAGERECT = 0x00000406;
enum DLG_COLOR = 0x0000000a;
enum COLOR_HUESCROLL = 0x000002bc;
enum COLOR_SATSCROLL = 0x000002bd;
enum COLOR_LUMSCROLL = 0x000002be;
enum COLOR_HUE = 0x000002bf;
enum COLOR_SAT = 0x000002c0;
enum COLOR_LUM = 0x000002c1;
enum COLOR_RED = 0x000002c2;
enum COLOR_GREEN = 0x000002c3;
enum COLOR_BLUE = 0x000002c4;
enum COLOR_CURRENT = 0x000002c5;
enum COLOR_RAINBOW = 0x000002c6;
enum COLOR_SAVE = 0x000002c7;
enum COLOR_ADD = 0x000002c8;
enum COLOR_SOLID = 0x000002c9;
enum COLOR_TUNE = 0x000002ca;
enum COLOR_SCHEMES = 0x000002cb;
enum COLOR_ELEMENT = 0x000002cc;
enum COLOR_SAMPLES = 0x000002cd;
enum COLOR_PALETTE = 0x000002ce;
enum COLOR_MIX = 0x000002cf;
enum COLOR_BOX1 = 0x000002d0;
enum COLOR_CUSTOM1 = 0x000002d1;
enum COLOR_HUEACCEL = 0x000002d3;
enum COLOR_SATACCEL = 0x000002d4;
enum COLOR_LUMACCEL = 0x000002d5;
enum COLOR_REDACCEL = 0x000002d6;
enum COLOR_GREENACCEL = 0x000002d7;
enum COLOR_BLUEACCEL = 0x000002d8;
enum COLOR_SOLID_LEFT = 0x000002da;
enum COLOR_SOLID_RIGHT = 0x000002db;
enum NUM_BASIC_COLORS = 0x00000030;
enum NUM_CUSTOM_COLORS = 0x00000010;
struct OPENFILENAME_NT4A
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(char)* lpstrFilter;
    PSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PSTR lpstrFile;
    uint nMaxFile;
    PSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(char)* lpstrInitialDir;
    const(char)* lpstrTitle;
    uint Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(char)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
struct OPENFILENAME_NT4W
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(wchar)* lpstrFilter;
    PWSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PWSTR lpstrFile;
    uint nMaxFile;
    PWSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(wchar)* lpstrInitialDir;
    const(wchar)* lpstrTitle;
    uint Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(wchar)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
struct OPENFILENAMEA
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(char)* lpstrFilter;
    PSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PSTR lpstrFile;
    uint nMaxFile;
    PSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(char)* lpstrInitialDir;
    const(char)* lpstrTitle;
    OPEN_FILENAME_FLAGS Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(char)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
    void* pvReserved;
    uint dwReserved;
    OPEN_FILENAME_FLAGS_EX FlagsEx;
}
struct OPENFILENAMEW
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(wchar)* lpstrFilter;
    PWSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PWSTR lpstrFile;
    uint nMaxFile;
    PWSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(wchar)* lpstrInitialDir;
    const(wchar)* lpstrTitle;
    OPEN_FILENAME_FLAGS Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(wchar)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
    void* pvReserved;
    uint dwReserved;
    OPEN_FILENAME_FLAGS_EX FlagsEx;
}
struct OFNOTIFYA
{
    NMHDR hdr;
    OPENFILENAMEA* lpOFN;
    PSTR pszFile;
}
struct OFNOTIFYW
{
    NMHDR hdr;
    OPENFILENAMEW* lpOFN;
    PWSTR pszFile;
}
struct OFNOTIFYEXA
{
    NMHDR hdr;
    OPENFILENAMEA* lpOFN;
    void* psf;
    void* pidl;
}
struct OFNOTIFYEXW
{
    NMHDR hdr;
    OPENFILENAMEW* lpOFN;
    void* psf;
    void* pidl;
}
struct CHOOSECOLORA
{
    uint lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    CHOOSECOLOR_FLAGS Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
struct CHOOSECOLORW
{
    uint lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    CHOOSECOLOR_FLAGS Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
struct FINDREPLACEA
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    FINDREPLACE_FLAGS Flags;
    PSTR lpstrFindWhat;
    PSTR lpstrReplaceWith;
    ushort wFindWhatLen;
    ushort wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
struct FINDREPLACEW
{
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    FINDREPLACE_FLAGS Flags;
    PWSTR lpstrFindWhat;
    PWSTR lpstrReplaceWith;
    ushort wFindWhatLen;
    ushort wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
struct CHOOSEFONTA
{
    uint lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LOGFONTA* lpLogFont;
    int iPointSize;
    CHOOSEFONT_FLAGS Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
    HINSTANCE hInstance;
    PSTR lpszStyle;
    CHOOSEFONT_FONT_TYPE nFontType;
    ushort ___MISSING_ALIGNMENT__;
    int nSizeMin;
    int nSizeMax;
}
struct CHOOSEFONTW
{
    uint lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LOGFONTW* lpLogFont;
    int iPointSize;
    CHOOSEFONT_FLAGS Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
    HINSTANCE hInstance;
    PWSTR lpszStyle;
    CHOOSEFONT_FONT_TYPE nFontType;
    ushort ___MISSING_ALIGNMENT__;
    int nSizeMin;
    int nSizeMax;
}
struct PRINTDLGA
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    ushort nFromPage;
    ushort nToPage;
    ushort nMinPage;
    ushort nMaxPage;
    ushort nCopies;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPRINTHOOKPROC lpfnPrintHook;
    LPSETUPHOOKPROC lpfnSetupHook;
    const(char)* lpPrintTemplateName;
    const(char)* lpSetupTemplateName;
    long hPrintTemplate;
    long hSetupTemplate;
}
struct PRINTDLGW
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    ushort nFromPage;
    ushort nToPage;
    ushort nMinPage;
    ushort nMaxPage;
    ushort nCopies;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPRINTHOOKPROC lpfnPrintHook;
    LPSETUPHOOKPROC lpfnSetupHook;
    const(wchar)* lpPrintTemplateName;
    const(wchar)* lpSetupTemplateName;
    long hPrintTemplate;
    long hSetupTemplate;
}
struct PRINTPAGERANGE
{
    uint nFromPage;
    uint nToPage;
}
struct PRINTDLGEXA
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    uint Flags2;
    uint ExclusionFlags;
    uint nPageRanges;
    uint nMaxPageRanges;
    PRINTPAGERANGE* lpPageRanges;
    uint nMinPage;
    uint nMaxPage;
    uint nCopies;
    HINSTANCE hInstance;
    const(char)* lpPrintTemplateName;
    IUnknown lpCallback;
    uint nPropertyPages;
    HPROPSHEETPAGE* lphPropertyPages;
    uint nStartPage;
    uint dwResultAction;
}
struct PRINTDLGEXW
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    uint Flags2;
    uint ExclusionFlags;
    uint nPageRanges;
    uint nMaxPageRanges;
    PRINTPAGERANGE* lpPageRanges;
    uint nMinPage;
    uint nMaxPage;
    uint nCopies;
    HINSTANCE hInstance;
    const(wchar)* lpPrintTemplateName;
    IUnknown lpCallback;
    uint nPropertyPages;
    HPROPSHEETPAGE* lphPropertyPages;
    uint nStartPage;
    uint dwResultAction;
}
struct DEVNAMES
{
    ushort wDriverOffset;
    ushort wDeviceOffset;
    ushort wOutputOffset;
    ushort wDefault;
}
struct PAGESETUPDLGA
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    PAGESETUPDLG_FLAGS Flags;
    POINT ptPaperSize;
    RECT rtMinMargin;
    RECT rtMargin;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPAGESETUPHOOK lpfnPageSetupHook;
    LPPAGEPAINTHOOK lpfnPagePaintHook;
    const(char)* lpPageSetupTemplateName;
    long hPageSetupTemplate;
}
struct PAGESETUPDLGW
{
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    PAGESETUPDLG_FLAGS Flags;
    POINT ptPaperSize;
    RECT rtMinMargin;
    RECT rtMargin;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPAGESETUPHOOK lpfnPageSetupHook;
    LPPAGEPAINTHOOK lpfnPagePaintHook;
    const(wchar)* lpPageSetupTemplateName;
    long hPageSetupTemplate;
}
alias LPOFNHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct OPENFILENAME_NT4A
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(char)* lpstrFilter;
    PSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PSTR lpstrFile;
    uint nMaxFile;
    PSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(char)* lpstrInitialDir;
    const(char)* lpstrTitle;
    uint Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(char)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
+/
/+ [CONFLICTED] struct OPENFILENAME_NT4W
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(wchar)* lpstrFilter;
    PWSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PWSTR lpstrFile;
    uint nMaxFile;
    PWSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(wchar)* lpstrInitialDir;
    const(wchar)* lpstrTitle;
    uint Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(wchar)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
+/
/+ [CONFLICTED] struct OPENFILENAMEA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(char)* lpstrFilter;
    PSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PSTR lpstrFile;
    uint nMaxFile;
    PSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(char)* lpstrInitialDir;
    const(char)* lpstrTitle;
    OPEN_FILENAME_FLAGS Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(char)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
    void* pvReserved;
    uint dwReserved;
    OPEN_FILENAME_FLAGS_EX FlagsEx;
}
+/
/+ [CONFLICTED] struct OPENFILENAMEW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(wchar)* lpstrFilter;
    PWSTR lpstrCustomFilter;
    uint nMaxCustFilter;
    uint nFilterIndex;
    PWSTR lpstrFile;
    uint nMaxFile;
    PWSTR lpstrFileTitle;
    uint nMaxFileTitle;
    const(wchar)* lpstrInitialDir;
    const(wchar)* lpstrTitle;
    OPEN_FILENAME_FLAGS Flags;
    ushort nFileOffset;
    ushort nFileExtension;
    const(wchar)* lpstrDefExt;
    LPARAM lCustData;
    LPOFNHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
    void* pvReserved;
    uint dwReserved;
    OPEN_FILENAME_FLAGS_EX FlagsEx;
}
+/
alias LPCCHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct OFNOTIFYA
{
    align (1):
    NMHDR hdr;
    OPENFILENAMEA* lpOFN;
    PSTR pszFile;
}
+/
/+ [CONFLICTED] struct OFNOTIFYW
{
    align (1):
    NMHDR hdr;
    OPENFILENAMEW* lpOFN;
    PWSTR pszFile;
}
+/
/+ [CONFLICTED] struct OFNOTIFYEXA
{
    align (1):
    NMHDR hdr;
    OPENFILENAMEA* lpOFN;
    void* psf;
    void* pidl;
}
+/
/+ [CONFLICTED] struct OFNOTIFYEXW
{
    align (1):
    NMHDR hdr;
    OPENFILENAMEW* lpOFN;
    void* psf;
    void* pidl;
}
+/
/+ [CONFLICTED] struct CHOOSECOLORA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    CHOOSECOLOR_FLAGS Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
+/
/+ [CONFLICTED] struct CHOOSECOLORW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    CHOOSECOLOR_FLAGS Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
+/
alias LPFRHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct FINDREPLACEA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    FINDREPLACE_FLAGS Flags;
    PSTR lpstrFindWhat;
    PSTR lpstrReplaceWith;
    ushort wFindWhatLen;
    ushort wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
}
+/
/+ [CONFLICTED] struct FINDREPLACEW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    FINDREPLACE_FLAGS Flags;
    PWSTR lpstrFindWhat;
    PWSTR lpstrReplaceWith;
    ushort wFindWhatLen;
    ushort wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
}
+/
alias LPCFHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct CHOOSEFONTA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LOGFONTA* lpLogFont;
    int iPointSize;
    CHOOSEFONT_FLAGS Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    const(char)* lpTemplateName;
    HINSTANCE hInstance;
    PSTR lpszStyle;
    CHOOSEFONT_FONT_TYPE nFontType;
    ushort ___MISSING_ALIGNMENT__;
    int nSizeMin;
    int nSizeMax;
}
+/
/+ [CONFLICTED] struct CHOOSEFONTW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LOGFONTW* lpLogFont;
    int iPointSize;
    CHOOSEFONT_FLAGS Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    const(wchar)* lpTemplateName;
    HINSTANCE hInstance;
    PWSTR lpszStyle;
    CHOOSEFONT_FONT_TYPE nFontType;
    ushort ___MISSING_ALIGNMENT__;
    int nSizeMin;
    int nSizeMax;
}
+/
alias LPPRINTHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
alias LPSETUPHOOKPROC = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct PRINTDLGA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    ushort nFromPage;
    ushort nToPage;
    ushort nMinPage;
    ushort nMaxPage;
    ushort nCopies;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPRINTHOOKPROC lpfnPrintHook;
    LPSETUPHOOKPROC lpfnSetupHook;
    const(char)* lpPrintTemplateName;
    const(char)* lpSetupTemplateName;
    long hPrintTemplate;
    long hSetupTemplate;
}
+/
/+ [CONFLICTED] struct PRINTDLGW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    ushort nFromPage;
    ushort nToPage;
    ushort nMinPage;
    ushort nMaxPage;
    ushort nCopies;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPRINTHOOKPROC lpfnPrintHook;
    LPSETUPHOOKPROC lpfnSetupHook;
    const(wchar)* lpPrintTemplateName;
    const(wchar)* lpSetupTemplateName;
    long hPrintTemplate;
    long hSetupTemplate;
}
+/
enum IID_IPrintDialogCallback = GUID(0x5852a2c3, 0x6530, 0x11d1, [0xb6, 0xa3, 0x0, 0x0, 0xf8, 0x75, 0x7b, 0xf9]);
interface IPrintDialogCallback : IUnknown
{
    HRESULT InitDone();
    HRESULT SelectionChange();
    HRESULT HandleMessage(HWND, uint, WPARAM, LPARAM, LRESULT*);
}
enum IID_IPrintDialogServices = GUID(0x509aaeda, 0x5639, 0x11d1, [0xb6, 0xa1, 0x0, 0x0, 0xf8, 0x75, 0x7b, 0xf9]);
interface IPrintDialogServices : IUnknown
{
    HRESULT GetCurrentDevMode(DEVMODEA*, uint*);
    HRESULT GetCurrentPrinterName(PWSTR, uint*);
    HRESULT GetCurrentPortName(PWSTR, uint*);
}
/+ [CONFLICTED] struct PRINTPAGERANGE
{
    align (1):
    uint nFromPage;
    uint nToPage;
}
+/
/+ [CONFLICTED] struct PRINTDLGEXA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    uint Flags2;
    uint ExclusionFlags;
    uint nPageRanges;
    uint nMaxPageRanges;
    PRINTPAGERANGE* lpPageRanges;
    uint nMinPage;
    uint nMaxPage;
    uint nCopies;
    HINSTANCE hInstance;
    const(char)* lpPrintTemplateName;
    IUnknown lpCallback;
    uint nPropertyPages;
    HPROPSHEETPAGE* lphPropertyPages;
    uint nStartPage;
    uint dwResultAction;
}
+/
/+ [CONFLICTED] struct PRINTDLGEXW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    HDC hDC;
    PRINTDLGEX_FLAGS Flags;
    uint Flags2;
    uint ExclusionFlags;
    uint nPageRanges;
    uint nMaxPageRanges;
    PRINTPAGERANGE* lpPageRanges;
    uint nMinPage;
    uint nMaxPage;
    uint nCopies;
    HINSTANCE hInstance;
    const(wchar)* lpPrintTemplateName;
    IUnknown lpCallback;
    uint nPropertyPages;
    HPROPSHEETPAGE* lphPropertyPages;
    uint nStartPage;
    uint dwResultAction;
}
+/
/+ [CONFLICTED] struct DEVNAMES
{
    align (1):
    ushort wDriverOffset;
    ushort wDeviceOffset;
    ushort wOutputOffset;
    ushort wDefault;
}
+/
alias LPPAGEPAINTHOOK = ulong function(HWND, uint, WPARAM, LPARAM);
alias LPPAGESETUPHOOK = ulong function(HWND, uint, WPARAM, LPARAM);
/+ [CONFLICTED] struct PAGESETUPDLGA
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    PAGESETUPDLG_FLAGS Flags;
    POINT ptPaperSize;
    RECT rtMinMargin;
    RECT rtMargin;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPAGESETUPHOOK lpfnPageSetupHook;
    LPPAGEPAINTHOOK lpfnPagePaintHook;
    const(char)* lpPageSetupTemplateName;
    long hPageSetupTemplate;
}
+/
/+ [CONFLICTED] struct PAGESETUPDLGW
{
    align (1):
    uint lStructSize;
    HWND hwndOwner;
    long hDevMode;
    long hDevNames;
    PAGESETUPDLG_FLAGS Flags;
    POINT ptPaperSize;
    RECT rtMinMargin;
    RECT rtMargin;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPAGESETUPHOOK lpfnPageSetupHook;
    LPPAGEPAINTHOOK lpfnPagePaintHook;
    const(wchar)* lpPageSetupTemplateName;
    long hPageSetupTemplate;
}
+/
