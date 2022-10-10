module windows.win32.ui.controls.richedit;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, COLORREF, HANDLE, HRESULT, HWND, LPARAM, LRESULT, POINT, PSTR, PWSTR, RECT, RECTL, SIZE, WPARAM;
import windows.win32.globalization : HIMC;
import windows.win32.graphics.direct2d_ : ID2D1RenderTarget;
import windows.win32.graphics.gdi : EMBED_FONT_CHARSET, HBITMAP, HDC, HPALETTE, HRGN, SYS_COLOR_INDEX, TEXT_ALIGN_OPTIONS;
import windows.win32.system.com_ : DVASPECT, DVTARGETDEVICE, IDataObject, IDispatch, IStream, IUnknown, VARIANT;
import windows.win32.system.com.structuredstorage : IStorage;
import windows.win32.system.ole : DROPEFFECT, IDropTarget, IOleClientSite, IOleInPlaceFrame, IOleInPlaceUIWindow, IOleObject, OLEINPLACEFRAMEINFO;
import windows.win32.system.systemservices : MODIFIERKEYS_FLAGS, RECO_FLAGS;
import windows.win32.ui.controls_ : ENABLE_SCROLL_BAR_ARROWS, NMHDR;
import windows.win32.ui.windowsandmessaging : HCURSOR, HMENU, SCROLLBAR_CONSTANTS, SHOW_WINDOW_CMD;

version (Windows):
extern (Windows):

alias CFM_MASK = uint;
enum : uint
{
    CFM_SUBSCRIPT     = 0x00030000,
    CFM_SUPERSCRIPT   = 0x00030000,
    CFM_EFFECTS       = 0x4000003f,
    CFM_ALL           = 0xf800003f,
    CFM_BOLD          = 0x00000001,
    CFM_CHARSET       = 0x08000000,
    CFM_COLOR         = 0x40000000,
    CFM_FACE          = 0x20000000,
    CFM_ITALIC        = 0x00000002,
    CFM_OFFSET        = 0x10000000,
    CFM_PROTECTED     = 0x00000010,
    CFM_SIZE          = 0x80000000,
    CFM_STRIKEOUT     = 0x00000008,
    CFM_UNDERLINE     = 0x00000004,
    CFM_LINK          = 0x00000020,
    CFM_SMALLCAPS     = 0x00000040,
    CFM_ALLCAPS       = 0x00000080,
    CFM_HIDDEN        = 0x00000100,
    CFM_OUTLINE       = 0x00000200,
    CFM_SHADOW        = 0x00000400,
    CFM_EMBOSS        = 0x00000800,
    CFM_IMPRINT       = 0x00001000,
    CFM_DISABLED      = 0x00002000,
    CFM_REVISED       = 0x00004000,
    CFM_REVAUTHOR     = 0x00008000,
    CFM_ANIMATION     = 0x00040000,
    CFM_STYLE         = 0x00080000,
    CFM_KERNING       = 0x00100000,
    CFM_SPACING       = 0x00200000,
    CFM_WEIGHT        = 0x00400000,
    CFM_UNDERLINETYPE = 0x00800000,
    CFM_COOKIE        = 0x01000000,
    CFM_LCID          = 0x02000000,
    CFM_BACKCOLOR     = 0x04000000,
    CFM_EFFECTS2      = 0x44037fff,
    CFM_ALL2          = 0xffffffff,
    CFM_FONTBOUND     = 0x00100000,
    CFM_LINKPROTECTED = 0x00800000,
    CFM_EXTENDED      = 0x02000000,
    CFM_MATHNOBUILDUP = 0x08000000,
    CFM_MATH          = 0x10000000,
    CFM_MATHORDINARY  = 0x20000000,
    CFM_ALLEFFECTS    = 0x7e137fff,
}

alias CFE_EFFECTS = uint;
enum : uint
{
    CFE_ALLCAPS       = 0x00000080,
    CFE_AUTOBACKCOLOR = 0x04000000,
    CFE_DISABLED      = 0x00002000,
    CFE_EMBOSS        = 0x00000800,
    CFE_HIDDEN        = 0x00000100,
    CFE_IMPRINT       = 0x00001000,
    CFE_OUTLINE       = 0x00000200,
    CFE_REVISED       = 0x00004000,
    CFE_SHADOW        = 0x00000400,
    CFE_SMALLCAPS     = 0x00000040,
    CFE_AUTOCOLOR     = 0x40000000,
    CFE_BOLD          = 0x00000001,
    CFE_ITALIC        = 0x00000002,
    CFE_STRIKEOUT     = 0x00000008,
    CFE_UNDERLINE     = 0x00000004,
    CFE_PROTECTED     = 0x00000010,
    CFE_LINK          = 0x00000020,
    CFE_SUBSCRIPT     = 0x00010000,
    CFE_SUPERSCRIPT   = 0x00020000,
    CFE_FONTBOUND     = 0x00100000,
    CFE_LINKPROTECTED = 0x00800000,
    CFE_EXTENDED      = 0x02000000,
    CFE_MATHNOBUILDUP = 0x08000000,
    CFE_MATH          = 0x10000000,
    CFE_MATHORDINARY  = 0x20000000,
}

alias PARAFORMAT_MASK = uint;
enum : uint
{
    PFM_ALIGNMENT    = 0x00000008,
    PFM_NUMBERING    = 0x00000020,
    PFM_OFFSET       = 0x00000004,
    PFM_OFFSETINDENT = 0x80000000,
    PFM_RIGHTINDENT  = 0x00000002,
    PFM_RTLPARA      = 0x00010000,
    PFM_STARTINDENT  = 0x00000001,
    PFM_TABSTOPS     = 0x00000010,
}

alias RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE = ushort;
enum : ushort
{
    SEL_EMPTY          = 0x0000,
    SEL_TEXT           = 0x0001,
    SEL_OBJECT         = 0x0002,
    SEL_MULTICHAR      = 0x0004,
    SEL_MULTIOBJECT    = 0x0008,
    GCM_RIGHTMOUSEDROP = 0x8000,
}

alias RICH_EDIT_GET_OBJECT_FLAGS = uint;
enum : uint
{
    REO_GETOBJ_POLEOBJ        = 0x00000001,
    REO_GETOBJ_PSTG           = 0x00000002,
    REO_GETOBJ_POLESITE       = 0x00000004,
    REO_GETOBJ_NO_INTERFACES  = 0x00000000,
    REO_GETOBJ_ALL_INTERFACES = 0x00000007,
}

alias PARAFORMAT_BORDERS = ushort;
enum : ushort
{
    PARAFORMAT_BORDERS_LEFT      = 0x0001,
    PARAFORMAT_BORDERS_RIGHT     = 0x0002,
    PARAFORMAT_BORDERS_TOP       = 0x0004,
    PARAFORMAT_BORDERS_BOTTOM    = 0x0008,
    PARAFORMAT_BORDERS_INSIDE    = 0x0010,
    PARAFORMAT_BORDERS_OUTSIDE   = 0x0020,
    PARAFORMAT_BORDERS_AUTOCOLOR = 0x0040,
}

alias PARAFORMAT_SHADING_STYLE = ushort;
enum : ushort
{
    PARAFORMAT_SHADING_STYLE_NONE            = 0x0000,
    PARAFORMAT_SHADING_STYLE_DARK_HORIZ      = 0x0001,
    PARAFORMAT_SHADING_STYLE_DARK_VERT       = 0x0002,
    PARAFORMAT_SHADING_STYLE_DARK_DOWN_DIAG  = 0x0003,
    PARAFORMAT_SHADING_STYLE_DARK_UP_DIAG    = 0x0004,
    PARAFORMAT_SHADING_STYLE_DARK_GRID       = 0x0005,
    PARAFORMAT_SHADING_STYLE_DARK_TRELLIS    = 0x0006,
    PARAFORMAT_SHADING_STYLE_LIGHT_HORZ      = 0x0007,
    PARAFORMAT_SHADING_STYLE_LIGHT_VERT      = 0x0008,
    PARAFORMAT_SHADING_STYLE_LIGHT_DOWN_DIAG = 0x0009,
    PARAFORMAT_SHADING_STYLE_LIGHT_UP_DIAG   = 0x000a,
    PARAFORMAT_SHADING_STYLE_LIGHT_GRID      = 0x000b,
    PARAFORMAT_SHADING_STYLE_LIGHT_TRELLIS   = 0x000c,
}

alias GETTEXTEX_FLAGS = uint;
enum : uint
{
    GT_DEFAULT      = 0x00000000,
    GT_NOHIDDENTEXT = 0x00000008,
    GT_RAWTEXT      = 0x00000004,
    GT_SELECTION    = 0x00000002,
    GT_USECRLF      = 0x00000001,
}

alias ENDCOMPOSITIONNOTIFY_CODE = uint;
enum : uint
{
    ECN_ENDCOMPOSITION = 0x00000001,
    ECN_NEWTEXT        = 0x00000002,
}

alias IMECOMPTEXT_FLAGS = uint;
enum : uint
{
    ICT_RESULTREADSTR = 0x00000001,
}

alias GETTEXTLENGTHEX_FLAGS = uint;
enum : uint
{
    GTL_DEFAULT  = 0x00000000,
    GTL_USECRLF  = 0x00000001,
    GTL_PRECISE  = 0x00000002,
    GTL_CLOSE    = 0x00000004,
    GTL_NUMCHARS = 0x00000008,
    GTL_NUMBYTES = 0x00000010,
}

alias REOBJECT_FLAGS = uint;
enum : uint
{
    REO_ALIGNTORIGHT    = 0x00000100,
    REO_BELOWBASELINE   = 0x00000002,
    REO_BLANK           = 0x00000010,
    REO_CANROTATE       = 0x00000080,
    REO_DONTNEEDPALETTE = 0x00000020,
    REO_DYNAMICSIZE     = 0x00000008,
    REO_GETMETAFILE     = 0x00400000,
    REO_HILITED         = 0x01000000,
    REO_INPLACEACTIVE   = 0x02000000,
    REO_INVERTEDSELECT  = 0x00000004,
    REO_LINK            = 0x80000000,
    REO_LINKAVAILABLE   = 0x00800000,
    REO_OPEN            = 0x04000000,
    REO_OWNERDRAWSELECT = 0x00000040,
    REO_RESIZABLE       = 0x00000001,
    REO_SELECTED        = 0x08000000,
    REO_STATIC          = 0x40000000,
    REO_USEASBACKGROUND = 0x00000400,
    REO_WRAPTEXTAROUND  = 0x00000200,
}

alias PARAFORMAT_NUMBERING_STYLE = ushort;
enum : ushort
{
    PFNS_PAREN     = 0x0000,
    PFNS_PARENS    = 0x0100,
    PFNS_PERIOD    = 0x0200,
    PFNS_PLAIN     = 0x0300,
    PFNS_NONUMBER  = 0x0400,
    PFNS_NEWNUMBER = 0x8000,
}

alias PARAFORMAT_ALIGNMENT = ushort;
enum : ushort
{
    PFA_CENTER = 0x0003,
    PFA_LEFT   = 0x0001,
    PFA_RIGHT  = 0x0002,
}

alias PARAFORMAT_NUMBERING = ushort;
enum : ushort
{
    PFN_BULLET   = 0x0001,
    PFN_ARABIC   = 0x0002,
    PFN_LCLETTER = 0x0003,
    PFN_UCLETTER = 0x0004,
    PFN_LCROMAN  = 0x0005,
    PFN_UCROMAN  = 0x0006,
}

enum cchTextLimitDefault = 0x00007fff;
enum MSFTEDIT_CLASS = "RICHEDIT50W";
enum CERICHEDIT_CLASSA = "RichEditCEA";
enum CERICHEDIT_CLASSW = "RichEditCEW";
enum RICHEDIT_CLASSA = "RichEdit20A";
enum RICHEDIT_CLASS10A = "RICHEDIT";
enum RICHEDIT_CLASSW = "RichEdit20W";
enum RICHEDIT_CLASS = "RichEdit20W";
enum EM_CANPASTE = 0x00000432;
enum EM_DISPLAYBAND = 0x00000433;
enum EM_EXGETSEL = 0x00000434;
enum EM_EXLIMITTEXT = 0x00000435;
enum EM_EXLINEFROMCHAR = 0x00000436;
enum EM_EXSETSEL = 0x00000437;
enum EM_FINDTEXT = 0x00000438;
enum EM_FORMATRANGE = 0x00000439;
enum EM_GETCHARFORMAT = 0x0000043a;
enum EM_GETEVENTMASK = 0x0000043b;
enum EM_GETOLEINTERFACE = 0x0000043c;
enum EM_GETPARAFORMAT = 0x0000043d;
enum EM_GETSELTEXT = 0x0000043e;
enum EM_HIDESELECTION = 0x0000043f;
enum EM_PASTESPECIAL = 0x00000440;
enum EM_REQUESTRESIZE = 0x00000441;
enum EM_SELECTIONTYPE = 0x00000442;
enum EM_SETBKGNDCOLOR = 0x00000443;
enum EM_SETCHARFORMAT = 0x00000444;
enum EM_SETEVENTMASK = 0x00000445;
enum EM_SETOLECALLBACK = 0x00000446;
enum EM_SETPARAFORMAT = 0x00000447;
enum EM_SETTARGETDEVICE = 0x00000448;
enum EM_STREAMIN = 0x00000449;
enum EM_STREAMOUT = 0x0000044a;
enum EM_GETTEXTRANGE = 0x0000044b;
enum EM_FINDWORDBREAK = 0x0000044c;
enum EM_SETOPTIONS = 0x0000044d;
enum EM_GETOPTIONS = 0x0000044e;
enum EM_FINDTEXTEX = 0x0000044f;
enum EM_GETWORDBREAKPROCEX = 0x00000450;
enum EM_SETWORDBREAKPROCEX = 0x00000451;
enum EM_SETUNDOLIMIT = 0x00000452;
enum EM_REDO = 0x00000454;
enum EM_CANREDO = 0x00000455;
enum EM_GETUNDONAME = 0x00000456;
enum EM_GETREDONAME = 0x00000457;
enum EM_STOPGROUPTYPING = 0x00000458;
enum EM_SETTEXTMODE = 0x00000459;
enum EM_GETTEXTMODE = 0x0000045a;
enum EM_AUTOURLDETECT = 0x0000045b;
enum AURL_ENABLEURL = 0x00000001;
enum AURL_ENABLEEMAILADDR = 0x00000002;
enum AURL_ENABLETELNO = 0x00000004;
enum AURL_ENABLEEAURLS = 0x00000008;
enum AURL_ENABLEDRIVELETTERS = 0x00000010;
enum AURL_DISABLEMIXEDLGC = 0x00000020;
enum EM_GETAUTOURLDETECT = 0x0000045c;
enum EM_SETPALETTE = 0x0000045d;
enum EM_GETTEXTEX = 0x0000045e;
enum EM_GETTEXTLENGTHEX = 0x0000045f;
enum EM_SHOWSCROLLBAR = 0x00000460;
enum EM_SETTEXTEX = 0x00000461;
enum EM_SETPUNCTUATION = 0x00000464;
enum EM_GETPUNCTUATION = 0x00000465;
enum EM_SETWORDWRAPMODE = 0x00000466;
enum EM_GETWORDWRAPMODE = 0x00000467;
enum EM_SETIMECOLOR = 0x00000468;
enum EM_GETIMECOLOR = 0x00000469;
enum EM_SETIMEOPTIONS = 0x0000046a;
enum EM_GETIMEOPTIONS = 0x0000046b;
enum EM_CONVPOSITION = 0x0000046c;
enum EM_SETLANGOPTIONS = 0x00000478;
enum EM_GETLANGOPTIONS = 0x00000479;
enum EM_GETIMECOMPMODE = 0x0000047a;
enum EM_FINDTEXTW = 0x0000047b;
enum EM_FINDTEXTEXW = 0x0000047c;
enum EM_RECONVERSION = 0x0000047d;
enum EM_SETIMEMODEBIAS = 0x0000047e;
enum EM_GETIMEMODEBIAS = 0x0000047f;
enum EM_SETBIDIOPTIONS = 0x000004c8;
enum EM_GETBIDIOPTIONS = 0x000004c9;
enum EM_SETTYPOGRAPHYOPTIONS = 0x000004ca;
enum EM_GETTYPOGRAPHYOPTIONS = 0x000004cb;
enum EM_SETEDITSTYLE = 0x000004cc;
enum EM_GETEDITSTYLE = 0x000004cd;
enum SES_EMULATESYSEDIT = 0x00000001;
enum SES_BEEPONMAXTEXT = 0x00000002;
enum SES_EXTENDBACKCOLOR = 0x00000004;
enum SES_MAPCPS = 0x00000008;
enum SES_HYPERLINKTOOLTIPS = 0x00000008;
enum SES_EMULATE10 = 0x00000010;
enum SES_DEFAULTLATINLIGA = 0x00000010;
enum SES_USECRLF = 0x00000020;
enum SES_NOFOCUSLINKNOTIFY = 0x00000020;
enum SES_USEAIMM = 0x00000040;
enum SES_NOIME = 0x00000080;
enum SES_ALLOWBEEPS = 0x00000100;
enum SES_UPPERCASE = 0x00000200;
enum SES_LOWERCASE = 0x00000400;
enum SES_NOINPUTSEQUENCECHK = 0x00000800;
enum SES_BIDI = 0x00001000;
enum SES_SCROLLONKILLFOCUS = 0x00002000;
enum SES_XLTCRCRLFTOCR = 0x00004000;
enum SES_DRAFTMODE = 0x00008000;
enum SES_USECTF = 0x00010000;
enum SES_HIDEGRIDLINES = 0x00020000;
enum SES_USEATFONT = 0x00040000;
enum SES_CUSTOMLOOK = 0x00080000;
enum SES_LBSCROLLNOTIFY = 0x00100000;
enum SES_CTFALLOWEMBED = 0x00200000;
enum SES_CTFALLOWSMARTTAG = 0x00400000;
enum SES_CTFALLOWPROOFING = 0x00800000;
enum SES_LOGICALCARET = 0x01000000;
enum SES_WORDDRAGDROP = 0x02000000;
enum SES_SMARTDRAGDROP = 0x04000000;
enum SES_MULTISELECT = 0x08000000;
enum SES_CTFNOLOCK = 0x10000000;
enum SES_NOEALINEHEIGHTADJUST = 0x20000000;
enum SES_MAX = 0x20000000;
enum IMF_AUTOKEYBOARD = 0x00000001;
enum IMF_AUTOFONT = 0x00000002;
enum IMF_IMECANCELCOMPLETE = 0x00000004;
enum IMF_IMEALWAYSSENDNOTIFY = 0x00000008;
enum IMF_AUTOFONTSIZEADJUST = 0x00000010;
enum IMF_UIFONTS = 0x00000020;
enum IMF_NOIMPLICITLANG = 0x00000040;
enum IMF_DUALFONT = 0x00000080;
enum IMF_NOKBDLIDFIXUP = 0x00000200;
enum IMF_NORTFFONTSUBSTITUTE = 0x00000400;
enum IMF_SPELLCHECKING = 0x00000800;
enum IMF_TKBPREDICTION = 0x00001000;
enum IMF_IMEUIINTEGRATION = 0x00002000;
enum ICM_NOTOPEN = 0x00000000;
enum ICM_LEVEL3 = 0x00000001;
enum ICM_LEVEL2 = 0x00000002;
enum ICM_LEVEL2_5 = 0x00000003;
enum ICM_LEVEL2_SUI = 0x00000004;
enum ICM_CTF = 0x00000005;
enum TO_ADVANCEDTYPOGRAPHY = 0x00000001;
enum TO_SIMPLELINEBREAK = 0x00000002;
enum TO_DISABLECUSTOMTEXTOUT = 0x00000004;
enum TO_ADVANCEDLAYOUT = 0x00000008;
enum EM_OUTLINE = 0x000004dc;
enum EM_GETSCROLLPOS = 0x000004dd;
enum EM_SETSCROLLPOS = 0x000004de;
enum EM_SETFONTSIZE = 0x000004df;
enum EM_GETZOOM = 0x000004e0;
enum EM_SETZOOM = 0x000004e1;
enum EM_GETVIEWKIND = 0x000004e2;
enum EM_SETVIEWKIND = 0x000004e3;
enum EM_GETPAGE = 0x000004e4;
enum EM_SETPAGE = 0x000004e5;
enum EM_GETHYPHENATEINFO = 0x000004e6;
enum EM_SETHYPHENATEINFO = 0x000004e7;
enum EM_GETPAGEROTATE = 0x000004eb;
enum EM_SETPAGEROTATE = 0x000004ec;
enum EM_GETCTFMODEBIAS = 0x000004ed;
enum EM_SETCTFMODEBIAS = 0x000004ee;
enum EM_GETCTFOPENSTATUS = 0x000004f0;
enum EM_SETCTFOPENSTATUS = 0x000004f1;
enum EM_GETIMECOMPTEXT = 0x000004f2;
enum EM_ISIME = 0x000004f3;
enum EM_GETIMEPROPERTY = 0x000004f4;
enum EM_GETQUERYRTFOBJ = 0x0000050d;
enum EM_SETQUERYRTFOBJ = 0x0000050e;
enum EPR_0 = 0x00000000;
enum EPR_270 = 0x00000001;
enum EPR_180 = 0x00000002;
enum EPR_90 = 0x00000003;
enum EPR_SE = 0x00000005;
enum CTFMODEBIAS_DEFAULT = 0x00000000;
enum CTFMODEBIAS_FILENAME = 0x00000001;
enum CTFMODEBIAS_NAME = 0x00000002;
enum CTFMODEBIAS_READING = 0x00000003;
enum CTFMODEBIAS_DATETIME = 0x00000004;
enum CTFMODEBIAS_CONVERSATION = 0x00000005;
enum CTFMODEBIAS_NUMERIC = 0x00000006;
enum CTFMODEBIAS_HIRAGANA = 0x00000007;
enum CTFMODEBIAS_KATAKANA = 0x00000008;
enum CTFMODEBIAS_HANGUL = 0x00000009;
enum CTFMODEBIAS_HALFWIDTHKATAKANA = 0x0000000a;
enum CTFMODEBIAS_FULLWIDTHALPHANUMERIC = 0x0000000b;
enum CTFMODEBIAS_HALFWIDTHALPHANUMERIC = 0x0000000c;
enum IMF_SMODE_PLAURALCLAUSE = 0x00000001;
enum IMF_SMODE_NONE = 0x00000002;
enum EMO_EXIT = 0x00000000;
enum EMO_ENTER = 0x00000001;
enum EMO_PROMOTE = 0x00000002;
enum EMO_EXPAND = 0x00000003;
enum EMO_MOVESELECTION = 0x00000004;
enum EMO_GETVIEWMODE = 0x00000005;
enum EMO_EXPANDSELECTION = 0x00000000;
enum EMO_EXPANDDOCUMENT = 0x00000001;
enum VM_NORMAL = 0x00000004;
enum VM_OUTLINE = 0x00000002;
enum VM_PAGE = 0x00000009;
enum EM_INSERTTABLE = 0x000004e8;
enum EM_GETAUTOCORRECTPROC = 0x000004e9;
enum EM_SETAUTOCORRECTPROC = 0x000004ea;
enum EM_CALLAUTOCORRECTPROC = 0x000004ff;
enum ATP_NOCHANGE = 0x00000000;
enum ATP_CHANGE = 0x00000001;
enum ATP_NODELIMITER = 0x00000002;
enum ATP_REPLACEALLTEXT = 0x00000004;
enum EM_GETTABLEPARMS = 0x00000509;
enum EM_SETEDITSTYLEEX = 0x00000513;
enum EM_GETEDITSTYLEEX = 0x00000514;
enum SES_EX_NOTABLE = 0x00000004;
enum SES_EX_NOMATH = 0x00000040;
enum SES_EX_HANDLEFRIENDLYURL = 0x00000100;
enum SES_EX_NOTHEMING = 0x00080000;
enum SES_EX_NOACETATESELECTION = 0x00100000;
enum SES_EX_USESINGLELINE = 0x00200000;
enum SES_EX_MULTITOUCH = 0x08000000;
enum SES_EX_HIDETEMPFORMAT = 0x10000000;
enum SES_EX_USEMOUSEWPARAM = 0x20000000;
enum EM_GETSTORYTYPE = 0x00000522;
enum EM_SETSTORYTYPE = 0x00000523;
enum EM_GETELLIPSISMODE = 0x00000531;
enum EM_SETELLIPSISMODE = 0x00000532;
enum ELLIPSIS_MASK = 0x00000003;
enum ELLIPSIS_NONE = 0x00000000;
enum ELLIPSIS_END = 0x00000001;
enum ELLIPSIS_WORD = 0x00000003;
enum EM_SETTABLEPARMS = 0x00000533;
enum EM_GETTOUCHOPTIONS = 0x00000536;
enum EM_SETTOUCHOPTIONS = 0x00000537;
enum EM_INSERTIMAGE = 0x0000053a;
enum EM_SETUIANAME = 0x00000540;
enum EM_GETELLIPSISSTATE = 0x00000542;
enum RTO_SHOWHANDLES = 0x00000001;
enum RTO_DISABLEHANDLES = 0x00000002;
enum RTO_READINGMODE = 0x00000003;
enum EN_MSGFILTER = 0x00000700;
enum EN_REQUESTRESIZE = 0x00000701;
enum EN_SELCHANGE = 0x00000702;
enum EN_DROPFILES = 0x00000703;
enum EN_PROTECTED = 0x00000704;
enum EN_CORRECTTEXT = 0x00000705;
enum EN_STOPNOUNDO = 0x00000706;
enum EN_IMECHANGE = 0x00000707;
enum EN_SAVECLIPBOARD = 0x00000708;
enum EN_OLEOPFAILED = 0x00000709;
enum EN_OBJECTPOSITIONS = 0x0000070a;
enum EN_LINK = 0x0000070b;
enum EN_DRAGDROPDONE = 0x0000070c;
enum EN_PARAGRAPHEXPANDED = 0x0000070d;
enum EN_PAGECHANGE = 0x0000070e;
enum EN_LOWFIRTF = 0x0000070f;
enum EN_ALIGNLTR = 0x00000710;
enum EN_ALIGNRTL = 0x00000711;
enum EN_CLIPFORMAT = 0x00000712;
enum EN_STARTCOMPOSITION = 0x00000713;
enum EN_ENDCOMPOSITION = 0x00000714;
enum ENM_NONE = 0x00000000;
enum ENM_CHANGE = 0x00000001;
enum ENM_UPDATE = 0x00000002;
enum ENM_SCROLL = 0x00000004;
enum ENM_SCROLLEVENTS = 0x00000008;
enum ENM_DRAGDROPDONE = 0x00000010;
enum ENM_PARAGRAPHEXPANDED = 0x00000020;
enum ENM_PAGECHANGE = 0x00000040;
enum ENM_CLIPFORMAT = 0x00000080;
enum ENM_KEYEVENTS = 0x00010000;
enum ENM_MOUSEEVENTS = 0x00020000;
enum ENM_REQUESTRESIZE = 0x00040000;
enum ENM_SELCHANGE = 0x00080000;
enum ENM_DROPFILES = 0x00100000;
enum ENM_PROTECTED = 0x00200000;
enum ENM_CORRECTTEXT = 0x00400000;
enum ENM_IMECHANGE = 0x00800000;
enum ENM_LANGCHANGE = 0x01000000;
enum ENM_OBJECTPOSITIONS = 0x02000000;
enum ENM_LINK = 0x04000000;
enum ENM_LOWFIRTF = 0x08000000;
enum ENM_STARTCOMPOSITION = 0x10000000;
enum ENM_ENDCOMPOSITION = 0x20000000;
enum ENM_GROUPTYPINGCHANGE = 0x40000000;
enum ENM_HIDELINKTOOLTIP = 0x80000000;
enum ES_SAVESEL = 0x00008000;
enum ES_SUNKEN = 0x00004000;
enum ES_DISABLENOSCROLL = 0x00002000;
enum ES_SELECTIONBAR = 0x01000000;
enum ES_NOOLEDRAGDROP = 0x00000008;
enum ES_EX_NOCALLOLEINIT = 0x00000000;
enum ES_VERTICAL = 0x00400000;
enum ES_NOIME = 0x00080000;
enum ES_SELFIME = 0x00040000;
enum ECO_AUTOWORDSELECTION = 0x00000001;
enum ECO_AUTOVSCROLL = 0x00000040;
enum ECO_AUTOHSCROLL = 0x00000080;
enum ECO_NOHIDESEL = 0x00000100;
enum ECO_READONLY = 0x00000800;
enum ECO_WANTRETURN = 0x00001000;
enum ECO_SAVESEL = 0x00008000;
enum ECO_SELECTIONBAR = 0x01000000;
enum ECO_VERTICAL = 0x00400000;
enum ECOOP_SET = 0x00000001;
enum ECOOP_OR = 0x00000002;
enum ECOOP_AND = 0x00000003;
enum ECOOP_XOR = 0x00000004;
enum WB_MOVEWORDPREV = 0x00000004;
enum WB_MOVEWORDNEXT = 0x00000005;
enum WB_PREVBREAK = 0x00000006;
enum WB_NEXTBREAK = 0x00000007;
enum PC_FOLLOWING = 0x00000001;
enum PC_LEADING = 0x00000002;
enum PC_OVERFLOW = 0x00000003;
enum PC_DELIMITER = 0x00000004;
enum WBF_WORDWRAP = 0x00000010;
enum WBF_WORDBREAK = 0x00000020;
enum WBF_OVERFLOW = 0x00000040;
enum WBF_LEVEL1 = 0x00000080;
enum WBF_LEVEL2 = 0x00000100;
enum WBF_CUSTOM = 0x00000200;
enum IMF_FORCENONE = 0x00000001;
enum IMF_FORCEENABLE = 0x00000002;
enum IMF_FORCEDISABLE = 0x00000004;
enum IMF_CLOSESTATUSWINDOW = 0x00000008;
enum IMF_VERTICAL = 0x00000020;
enum IMF_FORCEACTIVE = 0x00000040;
enum IMF_FORCEINACTIVE = 0x00000080;
enum IMF_FORCEREMEMBER = 0x00000100;
enum IMF_MULTIPLEEDIT = 0x00000400;
enum yHeightCharPtsMost = 0x00000666;
enum SCF_SELECTION = 0x00000001;
enum SCF_WORD = 0x00000002;
enum SCF_DEFAULT = 0x00000000;
enum SCF_ALL = 0x00000004;
enum SCF_USEUIRULES = 0x00000008;
enum SCF_ASSOCIATEFONT = 0x00000010;
enum SCF_NOKBUPDATE = 0x00000020;
enum SCF_ASSOCIATEFONT2 = 0x00000040;
enum SCF_SMARTFONT = 0x00000080;
enum SCF_CHARREPFROMLCID = 0x00000100;
enum SPF_DONTSETDEFAULT = 0x00000002;
enum SPF_SETDEFAULT = 0x00000004;
enum SF_TEXT = 0x00000001;
enum SF_RTF = 0x00000002;
enum SF_RTFNOOBJS = 0x00000003;
enum SF_TEXTIZED = 0x00000004;
enum SF_UNICODE = 0x00000010;
enum SF_USECODEPAGE = 0x00000020;
enum SF_NCRFORNONASCII = 0x00000040;
enum SFF_WRITEXTRAPAR = 0x00000080;
enum SFF_SELECTION = 0x00008000;
enum SFF_PLAINRTF = 0x00004000;
enum SFF_PERSISTVIEWSCALE = 0x00002000;
enum SFF_KEEPDOCINFO = 0x00001000;
enum SFF_PWD = 0x00000800;
enum SF_RTFVAL = 0x00000700;
enum MAX_TAB_STOPS = 0x00000020;
enum lDefaultTab = 0x000002d0;
enum MAX_TABLE_CELLS = 0x0000003f;
enum PFM_SPACEBEFORE = 0x00000040;
enum PFM_SPACEAFTER = 0x00000080;
enum PFM_LINESPACING = 0x00000100;
enum PFM_STYLE = 0x00000400;
enum PFM_BORDER = 0x00000800;
enum PFM_SHADING = 0x00001000;
enum PFM_NUMBERINGSTYLE = 0x00002000;
enum PFM_NUMBERINGTAB = 0x00004000;
enum PFM_NUMBERINGSTART = 0x00008000;
enum PFM_KEEP = 0x00020000;
enum PFM_KEEPNEXT = 0x00040000;
enum PFM_PAGEBREAKBEFORE = 0x00080000;
enum PFM_NOLINENUMBER = 0x00100000;
enum PFM_NOWIDOWCONTROL = 0x00200000;
enum PFM_DONOTHYPHEN = 0x00400000;
enum PFM_SIDEBYSIDE = 0x00800000;
enum PFM_COLLAPSED = 0x01000000;
enum PFM_OUTLINELEVEL = 0x02000000;
enum PFM_BOX = 0x04000000;
enum PFM_RESERVED2 = 0x08000000;
enum PFM_TABLEROWDELIMITER = 0x10000000;
enum PFM_TEXTWRAPPINGBREAK = 0x20000000;
enum PFM_TABLE = 0x40000000;
enum PFA_JUSTIFY = 0x00000004;
enum PFA_FULL_INTERWORD = 0x00000004;
enum GCMF_GRIPPER = 0x00000001;
enum GCMF_SPELLING = 0x00000002;
enum GCMF_TOUCHMENU = 0x00004000;
enum GCMF_MOUSEMENU = 0x00002000;
enum OLEOP_DOVERB = 0x00000001;
enum CF_RTF = "Rich Text Format";
enum CF_RTFNOOBJS = "Rich Text Format Without Objects";
enum CF_RETEXTOBJ = "RichEdit Text and Objects";
enum ST_DEFAULT = 0x00000000;
enum ST_KEEPUNDO = 0x00000001;
enum ST_SELECTION = 0x00000002;
enum ST_NEWCHARS = 0x00000004;
enum ST_UNICODE = 0x00000008;
enum BOM_DEFPARADIR = 0x00000001;
enum BOM_PLAINTEXT = 0x00000002;
enum BOM_NEUTRALOVERRIDE = 0x00000004;
enum BOM_CONTEXTREADING = 0x00000008;
enum BOM_CONTEXTALIGNMENT = 0x00000010;
enum BOM_LEGACYBIDICLASS = 0x00000040;
enum BOM_UNICODEBIDI = 0x00000080;
enum BOE_RTLDIR = 0x00000001;
enum BOE_PLAINTEXT = 0x00000002;
enum BOE_NEUTRALOVERRIDE = 0x00000004;
enum BOE_CONTEXTREADING = 0x00000008;
enum BOE_CONTEXTALIGNMENT = 0x00000010;
enum BOE_FORCERECALC = 0x00000020;
enum BOE_LEGACYBIDICLASS = 0x00000040;
enum BOE_UNICODEBIDI = 0x00000080;
enum FR_MATCHDIAC = 0x20000000;
enum FR_MATCHKASHIDA = 0x40000000;
enum FR_MATCHALEFHAMZA = 0x80000000;
enum RICHEDIT60_CLASS = "RICHEDIT60W";
enum PFA_FULL_NEWSPAPER = 0x00000005;
enum PFA_FULL_INTERLETTER = 0x00000006;
enum PFA_FULL_SCALED = 0x00000007;
enum PFA_FULL_GLYPHS = 0x00000008;
enum AURL_ENABLEEA = 0x00000001;
enum GCM_TOUCHMENU = 0x00004000;
enum GCM_MOUSEMENU = 0x00002000;
enum S_MSG_KEY_IGNORED = 0x00040201;
enum TXTBIT_RICHTEXT = 0x00000001;
enum TXTBIT_MULTILINE = 0x00000002;
enum TXTBIT_READONLY = 0x00000004;
enum TXTBIT_SHOWACCELERATOR = 0x00000008;
enum TXTBIT_USEPASSWORD = 0x00000010;
enum TXTBIT_HIDESELECTION = 0x00000020;
enum TXTBIT_SAVESELECTION = 0x00000040;
enum TXTBIT_AUTOWORDSEL = 0x00000080;
enum TXTBIT_VERTICAL = 0x00000100;
enum TXTBIT_SELBARCHANGE = 0x00000200;
enum TXTBIT_WORDWRAP = 0x00000400;
enum TXTBIT_ALLOWBEEP = 0x00000800;
enum TXTBIT_DISABLEDRAG = 0x00001000;
enum TXTBIT_VIEWINSETCHANGE = 0x00002000;
enum TXTBIT_BACKSTYLECHANGE = 0x00004000;
enum TXTBIT_MAXLENGTHCHANGE = 0x00008000;
enum TXTBIT_SCROLLBARCHANGE = 0x00010000;
enum TXTBIT_CHARFORMATCHANGE = 0x00020000;
enum TXTBIT_PARAFORMATCHANGE = 0x00040000;
enum TXTBIT_EXTENTCHANGE = 0x00080000;
enum TXTBIT_CLIENTRECTCHANGE = 0x00100000;
enum TXTBIT_USECURRENTBKG = 0x00200000;
enum TXTBIT_NOTHREADREFCOUNT = 0x00400000;
enum TXTBIT_SHOWPASSWORD = 0x00800000;
enum TXTBIT_D2DDWRITE = 0x01000000;
enum TXTBIT_D2DSIMPLETYPOGRAPHY = 0x02000000;
enum TXTBIT_D2DPIXELSNAPPED = 0x04000000;
enum TXTBIT_D2DSUBPIXELLINES = 0x08000000;
enum TXTBIT_FLASHLASTPASSWORDCHAR = 0x10000000;
enum TXTBIT_ADVANCEDINPUT = 0x20000000;
enum TXES_ISDIALOG = 0x00000001;
enum REO_NULL = 0x00000000;
enum REO_READWRITEMASK = 0x000007ff;
alias TEXTMODE = int;
enum : int
{
    TM_PLAINTEXT       = 0x00000001,
    TM_RICHTEXT        = 0x00000002,
    TM_SINGLELEVELUNDO = 0x00000004,
    TM_MULTILEVELUNDO  = 0x00000008,
    TM_SINGLECODEPAGE  = 0x00000010,
    TM_MULTICODEPAGE   = 0x00000020,
}

struct IMECOMPTEXT
{
    int cb;
    IMECOMPTEXT_FLAGS flags;
}
struct TABLEROWPARMS
{
    ubyte cbRow;
    ubyte cbCell;
    ubyte cCell;
    ubyte cRow;
    int dxCellMargin;
    int dxIndent;
    int dyHeight;
    uint _bitfield0;
    int cpStartRow;
    ubyte bTableLevel;
    ubyte iCell;
}
struct TABLECELLPARMS
{
    int dxWidth;
    ushort _bitfield0;
    ushort wShading;
    short dxBrdrLeft;
    short dyBrdrTop;
    short dxBrdrRight;
    short dyBrdrBottom;
    COLORREF crBrdrLeft;
    COLORREF crBrdrTop;
    COLORREF crBrdrRight;
    COLORREF crBrdrBottom;
    COLORREF crBackPat;
    COLORREF crForePat;
}
alias AutoCorrectProc = int function(ushort, const(wchar)*, PWSTR, int, int*);
struct RICHEDIT_IMAGE_PARAMETERS
{
    align (4):
    int xWidth;
    int yHeight;
    int Ascent;
    TEXT_ALIGN_OPTIONS Type;
    const(wchar)* pwszAlternateText;
    IStream pIStream;
}
struct ENDCOMPOSITIONNOTIFY
{
    align (4):
    NMHDR nmhdr;
    ENDCOMPOSITIONNOTIFY_CODE dwCode;
}
alias EDITWORDBREAKPROCEX = int function(PSTR, int, ubyte, int);
struct CHARFORMATA
{
    uint cbSize;
    CFM_MASK dwMask;
    CFE_EFFECTS dwEffects;
    int yHeight;
    int yOffset;
    COLORREF crTextColor;
    EMBED_FONT_CHARSET bCharSet;
    ubyte bPitchAndFamily;
    CHAR[32] szFaceName;
}
struct CHARFORMATW
{
    uint cbSize;
    CFM_MASK dwMask;
    CFE_EFFECTS dwEffects;
    int yHeight;
    int yOffset;
    COLORREF crTextColor;
    EMBED_FONT_CHARSET bCharSet;
    ubyte bPitchAndFamily;
    wchar[32] szFaceName;
}
struct CHARFORMAT2W
{
    CHARFORMATW Base;
    ushort wWeight;
    short sSpacing;
    COLORREF crBackColor;
    uint lcid;
    union
    {
        uint dwReserved;
        uint dwCookie;
    }
    short sStyle;
    ushort wKerning;
    ubyte bUnderlineType;
    ubyte bAnimation;
    ubyte bRevAuthor;
    ubyte bUnderlineColor;
}
struct CHARFORMAT2A
{
    CHARFORMATA Base;
    ushort wWeight;
    short sSpacing;
    COLORREF crBackColor;
    uint lcid;
    union
    {
        uint dwReserved;
        uint dwCookie;
    }
    short sStyle;
    ushort wKerning;
    ubyte bUnderlineType;
    ubyte bAnimation;
    ubyte bRevAuthor;
    ubyte bUnderlineColor;
}
struct CHARRANGE
{
    int cpMin;
    int cpMax;
}
struct TEXTRANGEA
{
    align (4):
    CHARRANGE chrg;
    PSTR lpstrText;
}
struct TEXTRANGEW
{
    align (4):
    CHARRANGE chrg;
    PWSTR lpstrText;
}
alias EDITSTREAMCALLBACK = uint function(ulong, ubyte*, int, int*);
struct EDITSTREAM
{
    align (4):
    ulong dwCookie;
    uint dwError;
    EDITSTREAMCALLBACK pfnCallback;
}
struct FINDTEXTA
{
    align (4):
    CHARRANGE chrg;
    const(char)* lpstrText;
}
struct FINDTEXTW
{
    align (4):
    CHARRANGE chrg;
    const(wchar)* lpstrText;
}
struct FINDTEXTEXA
{
    align (4):
    CHARRANGE chrg;
    const(char)* lpstrText;
    CHARRANGE chrgText;
}
struct FINDTEXTEXW
{
    align (4):
    CHARRANGE chrg;
    const(wchar)* lpstrText;
    CHARRANGE chrgText;
}
struct FORMATRANGE
{
    align (4):
    HDC hdc;
    HDC hdcTarget;
    RECT rc;
    RECT rcPage;
    CHARRANGE chrg;
}
struct PARAFORMAT
{
    uint cbSize;
    PARAFORMAT_MASK dwMask;
    PARAFORMAT_NUMBERING wNumbering;
    union
    {
        ushort wReserved;
        ushort wEffects;
    }
    int dxStartIndent;
    int dxRightIndent;
    int dxOffset;
    PARAFORMAT_ALIGNMENT wAlignment;
    short cTabCount;
    uint[32] rgxTabs;
}
struct PARAFORMAT2
{
    PARAFORMAT Base;
    int dySpaceBefore;
    int dySpaceAfter;
    int dyLineSpacing;
    short sStyle;
    ubyte bLineSpacingRule;
    ubyte bOutlineLevel;
    ushort wShadingWeight;
    PARAFORMAT_SHADING_STYLE wShadingStyle;
    ushort wNumberingStart;
    PARAFORMAT_NUMBERING_STYLE wNumberingStyle;
    ushort wNumberingTab;
    ushort wBorderSpace;
    ushort wBorderWidth;
    PARAFORMAT_BORDERS wBorders;
}
struct MSGFILTER
{
    align (4):
    NMHDR nmhdr;
    uint msg;
    WPARAM wParam;
    LPARAM lParam;
}
struct REQRESIZE
{
    align (4):
    NMHDR nmhdr;
    RECT rc;
}
struct SELCHANGE
{
    align (4):
    NMHDR nmhdr;
    CHARRANGE chrg;
    RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE seltyp;
}
struct GROUPTYPINGCHANGE
{
    align (4):
    NMHDR nmhdr;
    BOOL fGroupTyping;
}
struct CLIPBOARDFORMAT
{
    align (4):
    NMHDR nmhdr;
    ushort cf;
}
struct GETCONTEXTMENUEX
{
    align (4):
    CHARRANGE chrg;
    uint dwFlags;
    POINT pt;
    void* pvReserved;
}
struct ENDROPFILES
{
    align (4):
    NMHDR nmhdr;
    HANDLE hDrop;
    int cp;
    BOOL fProtected;
}
struct ENPROTECTED
{
    align (4):
    NMHDR nmhdr;
    uint msg;
    WPARAM wParam;
    LPARAM lParam;
    CHARRANGE chrg;
}
struct ENSAVECLIPBOARD
{
    align (4):
    NMHDR nmhdr;
    int cObjectCount;
    int cch;
}
struct ENOLEOPFAILED
{
    align (4):
    NMHDR nmhdr;
    int iob;
    int lOper;
    HRESULT hr;
}
struct OBJECTPOSITIONS
{
    align (4):
    NMHDR nmhdr;
    int cObjectCount;
    int* pcpPositions;
}
struct ENLINK
{
    align (4):
    NMHDR nmhdr;
    uint msg;
    WPARAM wParam;
    LPARAM lParam;
    CHARRANGE chrg;
}
struct ENLOWFIRTF
{
    align (4):
    NMHDR nmhdr;
    PSTR szControl;
}
struct ENCORRECTTEXT
{
    align (4):
    NMHDR nmhdr;
    CHARRANGE chrg;
    RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE seltyp;
}
struct PUNCTUATION
{
    align (4):
    uint iSize;
    PSTR szPunctuation;
}
struct COMPCOLOR
{
    COLORREF crText;
    COLORREF crBackground;
    uint dwEffects;
}
struct REPASTESPECIAL
{
    align (4):
    DVASPECT dwAspect;
    ulong dwParam;
}
alias UNDONAMEID = int;
enum : int
{
    UID_UNKNOWN   = 0x00000000,
    UID_TYPING    = 0x00000001,
    UID_DELETE    = 0x00000002,
    UID_DRAGDROP  = 0x00000003,
    UID_CUT       = 0x00000004,
    UID_PASTE     = 0x00000005,
    UID_AUTOTABLE = 0x00000006,
}

struct SETTEXTEX
{
    uint flags;
    uint codepage;
}
struct GETTEXTEX
{
    align (4):
    uint cb;
    GETTEXTEX_FLAGS flags;
    uint codepage;
    const(char)* lpDefaultChar;
    int* lpUsedDefChar;
}
struct GETTEXTLENGTHEX
{
    GETTEXTLENGTHEX_FLAGS flags;
    uint codepage;
}
struct BIDIOPTIONS
{
    uint cbSize;
    ushort wMask;
    ushort wEffects;
}
alias KHYPH = int;
enum : int
{
    khyphNil          = 0x00000000,
    khyphNormal       = 0x00000001,
    khyphAddBefore    = 0x00000002,
    khyphChangeBefore = 0x00000003,
    khyphDeleteBefore = 0x00000004,
    khyphChangeAfter  = 0x00000005,
    khyphDelAndChange = 0x00000006,
}

struct HYPHRESULT
{
    KHYPH khyph;
    int ichHyph;
    wchar chHyph;
}
struct HYPHENATEINFO
{
    align (4):
    short cbSize;
    short dxHyphenateZone;
    long pfnHyphenate;
}
alias TXTBACKSTYLE = int;
enum : int
{
    TXTBACK_TRANSPARENT = 0x00000000,
    TXTBACK_OPAQUE      = 0x00000001,
}

alias TXTHITRESULT = int;
enum : int
{
    TXTHITRESULT_NOHIT       = 0x00000000,
    TXTHITRESULT_TRANSPARENT = 0x00000001,
    TXTHITRESULT_CLOSE       = 0x00000002,
    TXTHITRESULT_HIT         = 0x00000003,
}

alias TXTNATURALSIZE = int;
enum : int
{
    TXTNS_FITTOCONTENT2   = 0x00000000,
    TXTNS_FITTOCONTENT    = 0x00000001,
    TXTNS_ROUNDTOLINE     = 0x00000002,
    TXTNS_FITTOCONTENT3   = 0x00000003,
    TXTNS_FITTOCONTENTWSP = 0x00000004,
    TXTNS_INCLUDELASTLINE = 0x40000000,
    TXTNS_EMU             = 0x80000000,
}

alias TXTVIEW = int;
enum : int
{
    TXTVIEW_ACTIVE   = 0x00000000,
    TXTVIEW_INACTIVE = 0xffffffff,
}

alias CHANGETYPE = int;
enum : int
{
    CN_GENERIC     = 0x00000000,
    CN_TEXTCHANGED = 0x00000001,
    CN_NEWUNDO     = 0x00000002,
    CN_NEWREDO     = 0x00000004,
}

struct CHANGENOTIFY
{
    CHANGETYPE dwChangeType;
    void* pvCookieData;
}
// [Not Found] IID_ITextServices
interface ITextServices : IUnknown
{
    HRESULT TxSendMessage(uint, WPARAM, LPARAM, LRESULT*);
    HRESULT TxDraw(DVASPECT, int, void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, RECT*, long, uint, int);
    HRESULT TxGetHScroll(int*, int*, int*, int*, BOOL*);
    HRESULT TxGetVScroll(int*, int*, int*, int*, BOOL*);
    HRESULT OnTxSetCursor(DVASPECT, int, void*, DVTARGETDEVICE*, HDC, HDC, RECT*, int, int);
    HRESULT TxQueryHitPoint(DVASPECT, int, void*, DVTARGETDEVICE*, HDC, HDC, RECT*, int, int, uint*);
    HRESULT OnTxInPlaceActivate(RECT*);
    HRESULT OnTxInPlaceDeactivate();
    HRESULT OnTxUIActivate();
    HRESULT OnTxUIDeactivate();
    HRESULT TxGetText(BSTR*);
    HRESULT TxSetText(const(wchar)*);
    HRESULT TxGetCurTargetX(int*);
    HRESULT TxGetBaseLinePos(int*);
    HRESULT TxGetNaturalSize(uint, HDC, HDC, DVTARGETDEVICE*, uint, const(SIZE)*, int*, int*);
    HRESULT TxGetDropTarget(IDropTarget*);
    HRESULT OnTxPropertyBitsChange(uint, uint);
    HRESULT TxGetCachedSize(uint*, uint*);
}
alias CARET_FLAGS = int;
enum : int
{
    CARET_NONE     = 0x00000000,
    CARET_CUSTOM   = 0x00000001,
    CARET_RTL      = 0x00000002,
    CARET_ITALIC   = 0x00000020,
    CARET_NULL     = 0x00000040,
    CARET_ROTATE90 = 0x00000080,
}

union CARET_INFO
{
    HBITMAP hbitmap;
    CARET_FLAGS caretFlags;
}
// [Not Found] IID_ITextHost
interface ITextHost : IUnknown
{
    HDC TxGetDC();
    int TxReleaseDC(HDC);
    BOOL TxShowScrollBar(int, BOOL);
    BOOL TxEnableScrollBar(SCROLLBAR_CONSTANTS, ENABLE_SCROLL_BAR_ARROWS);
    BOOL TxSetScrollRange(int, int, int, BOOL);
    BOOL TxSetScrollPos(int, int, BOOL);
    void TxInvalidateRect(RECT*, BOOL);
    void TxViewChange(BOOL);
    BOOL TxCreateCaret(HBITMAP, int, int);
    BOOL TxShowCaret(BOOL);
    BOOL TxSetCaretPos(int, int);
    BOOL TxSetTimer(uint, uint);
    void TxKillTimer(uint);
    void TxScrollWindowEx(int, int, RECT*, RECT*, HRGN, RECT*, SHOW_WINDOW_CMD);
    void TxSetCapture(BOOL);
    void TxSetFocus();
    void TxSetCursor(HCURSOR, BOOL);
    BOOL TxScreenToClient(POINT*);
    BOOL TxClientToScreen(POINT*);
    HRESULT TxActivate(int*);
    HRESULT TxDeactivate(int);
    HRESULT TxGetClientRect(RECT*);
    HRESULT TxGetViewInset(RECT*);
    HRESULT TxGetCharFormat(const(CHARFORMATW)**);
    HRESULT TxGetParaFormat(const(PARAFORMAT)**);
    COLORREF TxGetSysColor(SYS_COLOR_INDEX);
    HRESULT TxGetBackStyle(TXTBACKSTYLE*);
    HRESULT TxGetMaxLength(uint*);
    HRESULT TxGetScrollBars(uint*);
    HRESULT TxGetPasswordChar(byte*);
    HRESULT TxGetAcceleratorPos(int*);
    HRESULT TxGetExtent(SIZE*);
    HRESULT OnTxCharFormatChange(const(CHARFORMATW)*);
    HRESULT OnTxParaFormatChange(const(PARAFORMAT)*);
    HRESULT TxGetPropertyBits(uint, uint*);
    HRESULT TxNotify(uint, void*);
    HIMC TxImmGetContext();
    void TxImmReleaseContext(HIMC);
    HRESULT TxGetSelectionBarWidth(int*);
}
// [Not Found] IID_IRicheditUiaOverrides
interface IRicheditUiaOverrides : IUnknown
{
    HRESULT GetPropertyOverrideValue(int, VARIANT*);
}
alias PCreateTextServices = HRESULT function(IUnknown, ITextHost, IUnknown*);
alias PShutdownTextServices = HRESULT function(IUnknown);
// [Not Found] IID_ITextHost2
interface ITextHost2 : ITextHost
{
    BOOL TxIsDoubleClickPending();
    HRESULT TxGetWindow(HWND*);
    HRESULT TxSetForegroundWindow();
    HPALETTE TxGetPalette();
    HRESULT TxGetEastAsianFlags(int*);
    HCURSOR TxSetCursor2(HCURSOR, BOOL);
    void TxFreeTextServicesNotification();
    HRESULT TxGetEditStyle(uint, uint*);
    HRESULT TxGetWindowStyles(uint*, uint*);
    HRESULT TxShowDropCaret(BOOL, HDC, RECT*);
    HRESULT TxDestroyCaret();
    HRESULT TxGetHorzExtent(int*);
}
// [Not Found] IID_ITextServices2
interface ITextServices2 : ITextServices
{
    HRESULT TxGetNaturalSize2(uint, HDC, HDC, DVTARGETDEVICE*, uint, const(SIZE)*, int*, int*, int*);
    HRESULT TxDrawD2D(ID2D1RenderTarget, RECTL*, RECT*, int);
}
struct REOBJECT
{
    uint cbStruct;
    int cp;
    GUID clsid;
    IOleObject poleobj;
    IStorage pstg;
    IOleClientSite polesite;
    SIZE sizel;
    uint dvaspect;
    REOBJECT_FLAGS dwFlags;
    uint dwUser;
}
enum IID_IRichEditOle = GUID(0x20d00, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRichEditOle : IUnknown
{
    HRESULT GetClientSite(IOleClientSite*);
    int GetObjectCount();
    int GetLinkCount();
    HRESULT GetObject(int, REOBJECT*, RICH_EDIT_GET_OBJECT_FLAGS);
    HRESULT InsertObject(REOBJECT*);
    HRESULT ConvertObject(int, const(GUID)*, const(char)*);
    HRESULT ActivateAs(const(GUID)*, const(GUID)*);
    HRESULT SetHostNames(const(char)*, const(char)*);
    HRESULT SetLinkAvailable(int, BOOL);
    HRESULT SetDvaspect(int, uint);
    HRESULT HandsOffStorage(int);
    HRESULT SaveCompleted(int, IStorage);
    HRESULT InPlaceDeactivate();
    HRESULT ContextSensitiveHelp(BOOL);
    HRESULT GetClipboardData(CHARRANGE*, uint, IDataObject*);
    HRESULT ImportDataObject(IDataObject, ushort, long);
}
enum IID_IRichEditOleCallback = GUID(0x20d03, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRichEditOleCallback : IUnknown
{
    HRESULT GetNewStorage(IStorage*);
    HRESULT GetInPlaceContext(IOleInPlaceFrame*, IOleInPlaceUIWindow*, OLEINPLACEFRAMEINFO*);
    HRESULT ShowContainerUI(BOOL);
    HRESULT QueryInsertObject(GUID*, IStorage, int);
    HRESULT DeleteObject(IOleObject);
    HRESULT QueryAcceptData(IDataObject, ushort*, RECO_FLAGS, BOOL, long);
    HRESULT ContextSensitiveHelp(BOOL);
    HRESULT GetClipboardData(CHARRANGE*, uint, IDataObject*);
    HRESULT GetDragDropEffect(BOOL, MODIFIERKEYS_FLAGS, DROPEFFECT*);
    HRESULT GetContextMenu(RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, IOleObject, CHARRANGE*, HMENU*);
}
alias tomConstants = int;
enum : int
{
    tomFalse                           = 0x00000000,
    tomTrue                            = 0xffffffff,
    tomUndefined                       = 0xff676981,
    tomToggle                          = 0xff676982,
    tomAutoColor                       = 0xff676983,
    tomDefault                         = 0xff676984,
    tomSuspend                         = 0xff676985,
    tomResume                          = 0xff676986,
    tomApplyNow                        = 0x00000000,
    tomApplyLater                      = 0x00000001,
    tomTrackParms                      = 0x00000002,
    tomCacheParms                      = 0x00000003,
    tomApplyTmp                        = 0x00000004,
    tomDisableSmartFont                = 0x00000008,
    tomEnableSmartFont                 = 0x00000009,
    tomUsePoints                       = 0x0000000a,
    tomUseTwips                        = 0x0000000b,
    tomBackward                        = 0xc0000001,
    tomForward                         = 0x3fffffff,
    tomMove                            = 0x00000000,
    tomExtend                          = 0x00000001,
    tomNoSelection                     = 0x00000000,
    tomSelectionIP                     = 0x00000001,
    tomSelectionNormal                 = 0x00000002,
    tomSelectionFrame                  = 0x00000003,
    tomSelectionColumn                 = 0x00000004,
    tomSelectionRow                    = 0x00000005,
    tomSelectionBlock                  = 0x00000006,
    tomSelectionInlineShape            = 0x00000007,
    tomSelectionShape                  = 0x00000008,
    tomSelStartActive                  = 0x00000001,
    tomSelAtEOL                        = 0x00000002,
    tomSelOvertype                     = 0x00000004,
    tomSelActive                       = 0x00000008,
    tomSelReplace                      = 0x00000010,
    tomEnd                             = 0x00000000,
    tomStart                           = 0x00000020,
    tomCollapseEnd                     = 0x00000000,
    tomCollapseStart                   = 0x00000001,
    tomClientCoord                     = 0x00000100,
    tomAllowOffClient                  = 0x00000200,
    tomTransform                       = 0x00000400,
    tomObjectArg                       = 0x00000800,
    tomAtEnd                           = 0x00001000,
    tomNone                            = 0x00000000,
    tomSingle                          = 0x00000001,
    tomWords                           = 0x00000002,
    tomDouble                          = 0x00000003,
    tomDotted                          = 0x00000004,
    tomDash                            = 0x00000005,
    tomDashDot                         = 0x00000006,
    tomDashDotDot                      = 0x00000007,
    tomWave                            = 0x00000008,
    tomThick                           = 0x00000009,
    tomHair                            = 0x0000000a,
    tomDoubleWave                      = 0x0000000b,
    tomHeavyWave                       = 0x0000000c,
    tomLongDash                        = 0x0000000d,
    tomThickDash                       = 0x0000000e,
    tomThickDashDot                    = 0x0000000f,
    tomThickDashDotDot                 = 0x00000010,
    tomThickDotted                     = 0x00000011,
    tomThickLongDash                   = 0x00000012,
    tomLineSpaceSingle                 = 0x00000000,
    tomLineSpace1pt5                   = 0x00000001,
    tomLineSpaceDouble                 = 0x00000002,
    tomLineSpaceAtLeast                = 0x00000003,
    tomLineSpaceExactly                = 0x00000004,
    tomLineSpaceMultiple               = 0x00000005,
    tomLineSpacePercent                = 0x00000006,
    tomAlignLeft                       = 0x00000000,
    tomAlignCenter                     = 0x00000001,
    tomAlignRight                      = 0x00000002,
    tomAlignJustify                    = 0x00000003,
    tomAlignDecimal                    = 0x00000003,
    tomAlignBar                        = 0x00000004,
    tomDefaultTab                      = 0x00000005,
    tomAlignInterWord                  = 0x00000003,
    tomAlignNewspaper                  = 0x00000004,
    tomAlignInterLetter                = 0x00000005,
    tomAlignScaled                     = 0x00000006,
    tomSpaces                          = 0x00000000,
    tomDots                            = 0x00000001,
    tomDashes                          = 0x00000002,
    tomLines                           = 0x00000003,
    tomThickLines                      = 0x00000004,
    tomEquals                          = 0x00000005,
    tomTabBack                         = 0xfffffffd,
    tomTabNext                         = 0xfffffffe,
    tomTabHere                         = 0xffffffff,
    tomListNone                        = 0x00000000,
    tomListBullet                      = 0x00000001,
    tomListNumberAsArabic              = 0x00000002,
    tomListNumberAsLCLetter            = 0x00000003,
    tomListNumberAsUCLetter            = 0x00000004,
    tomListNumberAsLCRoman             = 0x00000005,
    tomListNumberAsUCRoman             = 0x00000006,
    tomListNumberAsSequence            = 0x00000007,
    tomListNumberedCircle              = 0x00000008,
    tomListNumberedBlackCircleWingding = 0x00000009,
    tomListNumberedWhiteCircleWingding = 0x0000000a,
    tomListNumberedArabicWide          = 0x0000000b,
    tomListNumberedChS                 = 0x0000000c,
    tomListNumberedChT                 = 0x0000000d,
    tomListNumberedJpnChS              = 0x0000000e,
    tomListNumberedJpnKor              = 0x0000000f,
    tomListNumberedArabic1             = 0x00000010,
    tomListNumberedArabic2             = 0x00000011,
    tomListNumberedHebrew              = 0x00000012,
    tomListNumberedThaiAlpha           = 0x00000013,
    tomListNumberedThaiNum             = 0x00000014,
    tomListNumberedHindiAlpha          = 0x00000015,
    tomListNumberedHindiAlpha1         = 0x00000016,
    tomListNumberedHindiNum            = 0x00000017,
    tomListParentheses                 = 0x00010000,
    tomListPeriod                      = 0x00020000,
    tomListPlain                       = 0x00030000,
    tomListNoNumber                    = 0x00040000,
    tomListMinus                       = 0x00080000,
    tomIgnoreNumberStyle               = 0x01000000,
    tomParaStyleNormal                 = 0xffffffff,
    tomParaStyleHeading1               = 0xfffffffe,
    tomParaStyleHeading2               = 0xfffffffd,
    tomParaStyleHeading3               = 0xfffffffc,
    tomParaStyleHeading4               = 0xfffffffb,
    tomParaStyleHeading5               = 0xfffffffa,
    tomParaStyleHeading6               = 0xfffffff9,
    tomParaStyleHeading7               = 0xfffffff8,
    tomParaStyleHeading8               = 0xfffffff7,
    tomParaStyleHeading9               = 0xfffffff6,
    tomCharacter                       = 0x00000001,
    tomWord                            = 0x00000002,
    tomSentence                        = 0x00000003,
    tomParagraph                       = 0x00000004,
    tomLine                            = 0x00000005,
    tomStory                           = 0x00000006,
    tomScreen                          = 0x00000007,
    tomSection                         = 0x00000008,
    tomTableColumn                     = 0x00000009,
    tomColumn                          = 0x00000009,
    tomRow                             = 0x0000000a,
    tomWindow                          = 0x0000000b,
    tomCell                            = 0x0000000c,
    tomCharFormat                      = 0x0000000d,
    tomParaFormat                      = 0x0000000e,
    tomTable                           = 0x0000000f,
    tomObject                          = 0x00000010,
    tomPage                            = 0x00000011,
    tomHardParagraph                   = 0x00000012,
    tomCluster                         = 0x00000013,
    tomInlineObject                    = 0x00000014,
    tomInlineObjectArg                 = 0x00000015,
    tomLeafLine                        = 0x00000016,
    tomLayoutColumn                    = 0x00000017,
    tomProcessId                       = 0x40000001,
    tomMatchWord                       = 0x00000002,
    tomMatchCase                       = 0x00000004,
    tomMatchPattern                    = 0x00000008,
    tomUnknownStory                    = 0x00000000,
    tomMainTextStory                   = 0x00000001,
    tomFootnotesStory                  = 0x00000002,
    tomEndnotesStory                   = 0x00000003,
    tomCommentsStory                   = 0x00000004,
    tomTextFrameStory                  = 0x00000005,
    tomEvenPagesHeaderStory            = 0x00000006,
    tomPrimaryHeaderStory              = 0x00000007,
    tomEvenPagesFooterStory            = 0x00000008,
    tomPrimaryFooterStory              = 0x00000009,
    tomFirstPageHeaderStory            = 0x0000000a,
    tomFirstPageFooterStory            = 0x0000000b,
    tomScratchStory                    = 0x0000007f,
    tomFindStory                       = 0x00000080,
    tomReplaceStory                    = 0x00000081,
    tomStoryInactive                   = 0x00000000,
    tomStoryActiveDisplay              = 0x00000001,
    tomStoryActiveUI                   = 0x00000002,
    tomStoryActiveDisplayUI            = 0x00000003,
    tomNoAnimation                     = 0x00000000,
    tomLasVegasLights                  = 0x00000001,
    tomBlinkingBackground              = 0x00000002,
    tomSparkleText                     = 0x00000003,
    tomMarchingBlackAnts               = 0x00000004,
    tomMarchingRedAnts                 = 0x00000005,
    tomShimmer                         = 0x00000006,
    tomWipeDown                        = 0x00000007,
    tomWipeRight                       = 0x00000008,
    tomAnimationMax                    = 0x00000008,
    tomLowerCase                       = 0x00000000,
    tomUpperCase                       = 0x00000001,
    tomTitleCase                       = 0x00000002,
    tomSentenceCase                    = 0x00000004,
    tomToggleCase                      = 0x00000005,
    tomReadOnly                        = 0x00000100,
    tomShareDenyRead                   = 0x00000200,
    tomShareDenyWrite                  = 0x00000400,
    tomPasteFile                       = 0x00001000,
    tomCreateNew                       = 0x00000010,
    tomCreateAlways                    = 0x00000020,
    tomOpenExisting                    = 0x00000030,
    tomOpenAlways                      = 0x00000040,
    tomTruncateExisting                = 0x00000050,
    tomRTF                             = 0x00000001,
    tomText                            = 0x00000002,
    tomHTML                            = 0x00000003,
    tomWordDocument                    = 0x00000004,
    tomBold                            = 0x80000001,
    tomItalic                          = 0x80000002,
    tomUnderline                       = 0x80000004,
    tomStrikeout                       = 0x80000008,
    tomProtected                       = 0x80000010,
    tomLink                            = 0x80000020,
    tomSmallCaps                       = 0x80000040,
    tomAllCaps                         = 0x80000080,
    tomHidden                          = 0x80000100,
    tomOutline                         = 0x80000200,
    tomShadow                          = 0x80000400,
    tomEmboss                          = 0x80000800,
    tomImprint                         = 0x80001000,
    tomDisabled                        = 0x80002000,
    tomRevised                         = 0x80004000,
    tomSubscriptCF                     = 0x80010000,
    tomSuperscriptCF                   = 0x80020000,
    tomFontBound                       = 0x80100000,
    tomLinkProtected                   = 0x80800000,
    tomInlineObjectStart               = 0x81000000,
    tomExtendedChar                    = 0x82000000,
    tomAutoBackColor                   = 0x84000000,
    tomMathZoneNoBuildUp               = 0x88000000,
    tomMathZone                        = 0x90000000,
    tomMathZoneOrdinary                = 0xa0000000,
    tomAutoTextColor                   = 0xc0000000,
    tomMathZoneDisplay                 = 0x00040000,
    tomParaEffectRTL                   = 0x00000001,
    tomParaEffectKeep                  = 0x00000002,
    tomParaEffectKeepNext              = 0x00000004,
    tomParaEffectPageBreakBefore       = 0x00000008,
    tomParaEffectNoLineNumber          = 0x00000010,
    tomParaEffectNoWidowControl        = 0x00000020,
    tomParaEffectDoNotHyphen           = 0x00000040,
    tomParaEffectSideBySide            = 0x00000080,
    tomParaEffectCollapsed             = 0x00000100,
    tomParaEffectOutlineLevel          = 0x00000200,
    tomParaEffectBox                   = 0x00000400,
    tomParaEffectTableRowDelimiter     = 0x00001000,
    tomParaEffectTable                 = 0x00004000,
    tomModWidthPairs                   = 0x00000001,
    tomModWidthSpace                   = 0x00000002,
    tomAutoSpaceAlpha                  = 0x00000004,
    tomAutoSpaceNumeric                = 0x00000008,
    tomAutoSpaceParens                 = 0x00000010,
    tomEmbeddedFont                    = 0x00000020,
    tomDoublestrike                    = 0x00000040,
    tomOverlapping                     = 0x00000080,
    tomNormalCaret                     = 0x00000000,
    tomKoreanBlockCaret                = 0x00000001,
    tomNullCaret                       = 0x00000002,
    tomIncludeInset                    = 0x00000001,
    tomUnicodeBiDi                     = 0x00000001,
    tomMathCFCheck                     = 0x00000004,
    tomUnlink                          = 0x00000008,
    tomUnhide                          = 0x00000010,
    tomCheckTextLimit                  = 0x00000020,
    tomIgnoreCurrentFont               = 0x00000000,
    tomMatchCharRep                    = 0x00000001,
    tomMatchFontSignature              = 0x00000002,
    tomMatchAscii                      = 0x00000004,
    tomGetHeightOnly                   = 0x00000008,
    tomMatchMathFont                   = 0x00000010,
    tomCharset                         = 0x80000000,
    tomCharRepFromLcid                 = 0x40000000,
    tomAnsi                            = 0x00000000,
    tomEastEurope                      = 0x00000001,
    tomCyrillic                        = 0x00000002,
    tomGreek                           = 0x00000003,
    tomTurkish                         = 0x00000004,
    tomHebrew                          = 0x00000005,
    tomArabic                          = 0x00000006,
    tomBaltic                          = 0x00000007,
    tomVietnamese                      = 0x00000008,
    tomDefaultCharRep                  = 0x00000009,
    tomSymbol                          = 0x0000000a,
    tomThai                            = 0x0000000b,
    tomShiftJIS                        = 0x0000000c,
    tomGB2312                          = 0x0000000d,
    tomHangul                          = 0x0000000e,
    tomBIG5                            = 0x0000000f,
    tomPC437                           = 0x00000010,
    tomOEM                             = 0x00000011,
    tomMac                             = 0x00000012,
    tomArmenian                        = 0x00000013,
    tomSyriac                          = 0x00000014,
    tomThaana                          = 0x00000015,
    tomDevanagari                      = 0x00000016,
    tomBengali                         = 0x00000017,
    tomGurmukhi                        = 0x00000018,
    tomGujarati                        = 0x00000019,
    tomOriya                           = 0x0000001a,
    tomTamil                           = 0x0000001b,
    tomTelugu                          = 0x0000001c,
    tomKannada                         = 0x0000001d,
    tomMalayalam                       = 0x0000001e,
    tomSinhala                         = 0x0000001f,
    tomLao                             = 0x00000020,
    tomTibetan                         = 0x00000021,
    tomMyanmar                         = 0x00000022,
    tomGeorgian                        = 0x00000023,
    tomJamo                            = 0x00000024,
    tomEthiopic                        = 0x00000025,
    tomCherokee                        = 0x00000026,
    tomAboriginal                      = 0x00000027,
    tomOgham                           = 0x00000028,
    tomRunic                           = 0x00000029,
    tomKhmer                           = 0x0000002a,
    tomMongolian                       = 0x0000002b,
    tomBraille                         = 0x0000002c,
    tomYi                              = 0x0000002d,
    tomLimbu                           = 0x0000002e,
    tomTaiLe                           = 0x0000002f,
    tomNewTaiLue                       = 0x00000030,
    tomSylotiNagri                     = 0x00000031,
    tomKharoshthi                      = 0x00000032,
    tomKayahli                         = 0x00000033,
    tomUsymbol                         = 0x00000034,
    tomEmoji                           = 0x00000035,
    tomGlagolitic                      = 0x00000036,
    tomLisu                            = 0x00000037,
    tomVai                             = 0x00000038,
    tomNKo                             = 0x00000039,
    tomOsmanya                         = 0x0000003a,
    tomPhagsPa                         = 0x0000003b,
    tomGothic                          = 0x0000003c,
    tomDeseret                         = 0x0000003d,
    tomTifinagh                        = 0x0000003e,
    tomCharRepMax                      = 0x0000003f,
    tomRE10Mode                        = 0x00000001,
    tomUseAtFont                       = 0x00000002,
    tomTextFlowMask                    = 0x0000000c,
    tomTextFlowES                      = 0x00000000,
    tomTextFlowSW                      = 0x00000004,
    tomTextFlowWN                      = 0x00000008,
    tomTextFlowNE                      = 0x0000000c,
    tomNoIME                           = 0x00080000,
    tomSelfIME                         = 0x00040000,
    tomNoUpScroll                      = 0x00010000,
    tomNoVpScroll                      = 0x00040000,
    tomNoLink                          = 0x00000000,
    tomClientLink                      = 0x00000001,
    tomFriendlyLinkName                = 0x00000002,
    tomFriendlyLinkAddress             = 0x00000003,
    tomAutoLinkURL                     = 0x00000004,
    tomAutoLinkEmail                   = 0x00000005,
    tomAutoLinkPhone                   = 0x00000006,
    tomAutoLinkPath                    = 0x00000007,
    tomCompressNone                    = 0x00000000,
    tomCompressPunctuation             = 0x00000001,
    tomCompressPunctuationAndKana      = 0x00000002,
    tomCompressMax                     = 0x00000002,
    tomUnderlinePositionAuto           = 0x00000000,
    tomUnderlinePositionBelow          = 0x00000001,
    tomUnderlinePositionAbove          = 0x00000002,
    tomUnderlinePositionMax            = 0x00000002,
    tomFontAlignmentAuto               = 0x00000000,
    tomFontAlignmentTop                = 0x00000001,
    tomFontAlignmentBaseline           = 0x00000002,
    tomFontAlignmentBottom             = 0x00000003,
    tomFontAlignmentCenter             = 0x00000004,
    tomFontAlignmentMax                = 0x00000004,
    tomRubyBelow                       = 0x00000080,
    tomRubyAlignCenter                 = 0x00000000,
    tomRubyAlign010                    = 0x00000001,
    tomRubyAlign121                    = 0x00000002,
    tomRubyAlignLeft                   = 0x00000003,
    tomRubyAlignRight                  = 0x00000004,
    tomLimitsDefault                   = 0x00000000,
    tomLimitsUnderOver                 = 0x00000001,
    tomLimitsSubSup                    = 0x00000002,
    tomUpperLimitAsSuperScript         = 0x00000003,
    tomLimitsOpposite                  = 0x00000004,
    tomShowLLimPlaceHldr               = 0x00000008,
    tomShowULimPlaceHldr               = 0x00000010,
    tomDontGrowWithContent             = 0x00000040,
    tomGrowWithContent                 = 0x00000080,
    tomSubSupAlign                     = 0x00000001,
    tomLimitAlignMask                  = 0x00000003,
    tomLimitAlignCenter                = 0x00000000,
    tomLimitAlignLeft                  = 0x00000001,
    tomLimitAlignRight                 = 0x00000002,
    tomShowDegPlaceHldr                = 0x00000008,
    tomAlignDefault                    = 0x00000000,
    tomAlignMatchAscentDescent         = 0x00000002,
    tomMathVariant                     = 0x00000020,
    tomStyleDefault                    = 0x00000000,
    tomStyleScriptScriptCramped        = 0x00000001,
    tomStyleScriptScript               = 0x00000002,
    tomStyleScriptCramped              = 0x00000003,
    tomStyleScript                     = 0x00000004,
    tomStyleTextCramped                = 0x00000005,
    tomStyleText                       = 0x00000006,
    tomStyleDisplayCramped             = 0x00000007,
    tomStyleDisplay                    = 0x00000008,
    tomMathRelSize                     = 0x00000040,
    tomDecDecSize                      = 0x000000fe,
    tomDecSize                         = 0x000000ff,
    tomIncSize                         = 0x00000041,
    tomIncIncSize                      = 0x00000042,
    tomGravityUI                       = 0x00000000,
    tomGravityBack                     = 0x00000001,
    tomGravityFore                     = 0x00000002,
    tomGravityIn                       = 0x00000003,
    tomGravityOut                      = 0x00000004,
    tomGravityBackward                 = 0x20000000,
    tomGravityForward                  = 0x40000000,
    tomAdjustCRLF                      = 0x00000001,
    tomUseCRLF                         = 0x00000002,
    tomTextize                         = 0x00000004,
    tomAllowFinalEOP                   = 0x00000008,
    tomFoldMathAlpha                   = 0x00000010,
    tomNoHidden                        = 0x00000020,
    tomIncludeNumbering                = 0x00000040,
    tomTranslateTableCell              = 0x00000080,
    tomNoMathZoneBrackets              = 0x00000100,
    tomConvertMathChar                 = 0x00000200,
    tomNoUCGreekItalic                 = 0x00000400,
    tomAllowMathBold                   = 0x00000800,
    tomLanguageTag                     = 0x00001000,
    tomConvertRTF                      = 0x00002000,
    tomApplyRtfDocProps                = 0x00004000,
    tomPhantomShow                     = 0x00000001,
    tomPhantomZeroWidth                = 0x00000002,
    tomPhantomZeroAscent               = 0x00000004,
    tomPhantomZeroDescent              = 0x00000008,
    tomPhantomTransparent              = 0x00000010,
    tomPhantomASmash                   = 0x00000005,
    tomPhantomDSmash                   = 0x00000009,
    tomPhantomHSmash                   = 0x00000003,
    tomPhantomSmash                    = 0x0000000d,
    tomPhantomHorz                     = 0x0000000c,
    tomPhantomVert                     = 0x00000002,
    tomBoxHideTop                      = 0x00000001,
    tomBoxHideBottom                   = 0x00000002,
    tomBoxHideLeft                     = 0x00000004,
    tomBoxHideRight                    = 0x00000008,
    tomBoxStrikeH                      = 0x00000010,
    tomBoxStrikeV                      = 0x00000020,
    tomBoxStrikeTLBR                   = 0x00000040,
    tomBoxStrikeBLTR                   = 0x00000080,
    tomBoxAlignCenter                  = 0x00000001,
    tomSpaceMask                       = 0x0000001c,
    tomSpaceDefault                    = 0x00000000,
    tomSpaceUnary                      = 0x00000004,
    tomSpaceBinary                     = 0x00000008,
    tomSpaceRelational                 = 0x0000000c,
    tomSpaceSkip                       = 0x00000010,
    tomSpaceOrd                        = 0x00000014,
    tomSpaceDifferential               = 0x00000018,
    tomSizeText                        = 0x00000020,
    tomSizeScript                      = 0x00000040,
    tomSizeScriptScript                = 0x00000060,
    tomNoBreak                         = 0x00000080,
    tomTransparentForPositioning       = 0x00000100,
    tomTransparentForSpacing           = 0x00000200,
    tomStretchCharBelow                = 0x00000000,
    tomStretchCharAbove                = 0x00000001,
    tomStretchBaseBelow                = 0x00000002,
    tomStretchBaseAbove                = 0x00000003,
    tomMatrixAlignMask                 = 0x00000003,
    tomMatrixAlignCenter               = 0x00000000,
    tomMatrixAlignTopRow               = 0x00000001,
    tomMatrixAlignBottomRow            = 0x00000003,
    tomShowMatPlaceHldr                = 0x00000008,
    tomEqArrayLayoutWidth              = 0x00000001,
    tomEqArrayAlignMask                = 0x0000000c,
    tomEqArrayAlignCenter              = 0x00000000,
    tomEqArrayAlignTopRow              = 0x00000004,
    tomEqArrayAlignBottomRow           = 0x0000000c,
    tomMathManualBreakMask             = 0x0000007f,
    tomMathBreakLeft                   = 0x0000007d,
    tomMathBreakCenter                 = 0x0000007e,
    tomMathBreakRight                  = 0x0000007f,
    tomMathEqAlign                     = 0x00000080,
    tomMathArgShadingStart             = 0x00000251,
    tomMathArgShadingEnd               = 0x00000252,
    tomMathObjShadingStart             = 0x00000253,
    tomMathObjShadingEnd               = 0x00000254,
    tomFunctionTypeNone                = 0x00000000,
    tomFunctionTypeTakesArg            = 0x00000001,
    tomFunctionTypeTakesLim            = 0x00000002,
    tomFunctionTypeTakesLim2           = 0x00000003,
    tomFunctionTypeIsLim               = 0x00000004,
    tomMathParaAlignDefault            = 0x00000000,
    tomMathParaAlignCenterGroup        = 0x00000001,
    tomMathParaAlignCenter             = 0x00000002,
    tomMathParaAlignLeft               = 0x00000003,
    tomMathParaAlignRight              = 0x00000004,
    tomMathDispAlignMask               = 0x00000003,
    tomMathDispAlignCenterGroup        = 0x00000000,
    tomMathDispAlignCenter             = 0x00000001,
    tomMathDispAlignLeft               = 0x00000002,
    tomMathDispAlignRight              = 0x00000003,
    tomMathDispIntUnderOver            = 0x00000004,
    tomMathDispFracTeX                 = 0x00000008,
    tomMathDispNaryGrow                = 0x00000010,
    tomMathDocEmptyArgMask             = 0x00000060,
    tomMathDocEmptyArgAuto             = 0x00000000,
    tomMathDocEmptyArgAlways           = 0x00000020,
    tomMathDocEmptyArgNever            = 0x00000040,
    tomMathDocSbSpOpUnchanged          = 0x00000080,
    tomMathDocDiffMask                 = 0x00000300,
    tomMathDocDiffDefault              = 0x00000000,
    tomMathDocDiffUpright              = 0x00000100,
    tomMathDocDiffItalic               = 0x00000200,
    tomMathDocDiffOpenItalic           = 0x00000300,
    tomMathDispNarySubSup              = 0x00000400,
    tomMathDispDef                     = 0x00000800,
    tomMathEnableRtl                   = 0x00001000,
    tomMathBrkBinMask                  = 0x00030000,
    tomMathBrkBinBefore                = 0x00000000,
    tomMathBrkBinAfter                 = 0x00010000,
    tomMathBrkBinDup                   = 0x00020000,
    tomMathBrkBinSubMask               = 0x000c0000,
    tomMathBrkBinSubMM                 = 0x00000000,
    tomMathBrkBinSubPM                 = 0x00040000,
    tomMathBrkBinSubMP                 = 0x00080000,
    tomSelRange                        = 0x00000255,
    tomHstring                         = 0x00000254,
    tomFontPropTeXStyle                = 0x0000033c,
    tomFontPropAlign                   = 0x0000033d,
    tomFontStretch                     = 0x0000033e,
    tomFontStyle                       = 0x0000033f,
    tomFontStyleUpright                = 0x00000000,
    tomFontStyleOblique                = 0x00000001,
    tomFontStyleItalic                 = 0x00000002,
    tomFontStretchDefault              = 0x00000000,
    tomFontStretchUltraCondensed       = 0x00000001,
    tomFontStretchExtraCondensed       = 0x00000002,
    tomFontStretchCondensed            = 0x00000003,
    tomFontStretchSemiCondensed        = 0x00000004,
    tomFontStretchNormal               = 0x00000005,
    tomFontStretchSemiExpanded         = 0x00000006,
    tomFontStretchExpanded             = 0x00000007,
    tomFontStretchExtraExpanded        = 0x00000008,
    tomFontStretchUltraExpanded        = 0x00000009,
    tomFontWeightDefault               = 0x00000000,
    tomFontWeightThin                  = 0x00000064,
    tomFontWeightExtraLight            = 0x000000c8,
    tomFontWeightLight                 = 0x0000012c,
    tomFontWeightNormal                = 0x00000190,
    tomFontWeightRegular               = 0x00000190,
    tomFontWeightMedium                = 0x000001f4,
    tomFontWeightSemiBold              = 0x00000258,
    tomFontWeightBold                  = 0x000002bc,
    tomFontWeightExtraBold             = 0x00000320,
    tomFontWeightBlack                 = 0x00000384,
    tomFontWeightHeavy                 = 0x00000384,
    tomFontWeightExtraBlack            = 0x000003b6,
    tomParaPropMathAlign               = 0x00000437,
    tomDocMathBuild                    = 0x00000080,
    tomMathLMargin                     = 0x00000081,
    tomMathRMargin                     = 0x00000082,
    tomMathWrapIndent                  = 0x00000083,
    tomMathWrapRight                   = 0x00000084,
    tomMathPostSpace                   = 0x00000086,
    tomMathPreSpace                    = 0x00000085,
    tomMathInterSpace                  = 0x00000087,
    tomMathIntraSpace                  = 0x00000088,
    tomCanCopy                         = 0x00000089,
    tomCanRedo                         = 0x0000008a,
    tomCanUndo                         = 0x0000008b,
    tomUndoLimit                       = 0x0000008c,
    tomDocAutoLink                     = 0x0000008d,
    tomEllipsisMode                    = 0x0000008e,
    tomEllipsisState                   = 0x0000008f,
    tomEllipsisNone                    = 0x00000000,
    tomEllipsisEnd                     = 0x00000001,
    tomEllipsisWord                    = 0x00000003,
    tomEllipsisPresent                 = 0x00000001,
    tomVTopCell                        = 0x00000001,
    tomVLowCell                        = 0x00000002,
    tomHStartCell                      = 0x00000004,
    tomHContCell                       = 0x00000008,
    tomRowUpdate                       = 0x00000001,
    tomRowApplyDefault                 = 0x00000000,
    tomCellStructureChangeOnly         = 0x00000001,
    tomRowHeightActual                 = 0x0000080b,
}

alias OBJECTTYPE = int;
enum : int
{
    tomSimpleText       = 0x00000000,
    tomRuby             = 0x00000001,
    tomHorzVert         = 0x00000002,
    tomWarichu          = 0x00000003,
    tomEq               = 0x00000009,
    tomMath             = 0x0000000a,
    tomAccent           = 0x0000000a,
    tomBox              = 0x0000000b,
    tomBoxedFormula     = 0x0000000c,
    tomBrackets         = 0x0000000d,
    tomBracketsWithSeps = 0x0000000e,
    tomEquationArray    = 0x0000000f,
    tomFraction         = 0x00000010,
    tomFunctionApply    = 0x00000011,
    tomLeftSubSup       = 0x00000012,
    tomLowerLimit       = 0x00000013,
    tomMatrix           = 0x00000014,
    tomNary             = 0x00000015,
    tomOpChar           = 0x00000016,
    tomOverbar          = 0x00000017,
    tomPhantom          = 0x00000018,
    tomRadical          = 0x00000019,
    tomSlashedFraction  = 0x0000001a,
    tomStack            = 0x0000001b,
    tomStretchStack     = 0x0000001c,
    tomSubscript        = 0x0000001d,
    tomSubSup           = 0x0000001e,
    tomSuperscript      = 0x0000001f,
    tomUnderbar         = 0x00000020,
    tomUpperLimit       = 0x00000021,
    tomObjectMax        = 0x00000021,
}

alias MANCODE = int;
enum : int
{
    MBOLD   = 0x00000010,
    MITAL   = 0x00000020,
    MGREEK  = 0x00000040,
    MROMN   = 0x00000000,
    MSCRP   = 0x00000001,
    MFRAK   = 0x00000002,
    MOPEN   = 0x00000003,
    MSANS   = 0x00000004,
    MMONO   = 0x00000005,
    MMATH   = 0x00000006,
    MISOL   = 0x00000007,
    MINIT   = 0x00000008,
    MTAIL   = 0x00000009,
    MSTRCH  = 0x0000000a,
    MLOOP   = 0x0000000b,
    MOPENA  = 0x0000000c,
}

enum IID_ITextDocument = GUID(0x8cc497c0, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextDocument : IDispatch
{
    HRESULT GetName(BSTR*);
    HRESULT GetSelection(ITextSelection*);
    HRESULT GetStoryCount(int*);
    HRESULT GetStoryRanges(ITextStoryRanges*);
    HRESULT GetSaved(int*);
    HRESULT SetSaved(tomConstants);
    HRESULT GetDefaultTabStop(float*);
    HRESULT SetDefaultTabStop(float);
    HRESULT New();
    HRESULT Open(VARIANT*, tomConstants, int);
    HRESULT Save(VARIANT*, tomConstants, int);
    HRESULT Freeze(int*);
    HRESULT Unfreeze(int*);
    HRESULT BeginEditCollection();
    HRESULT EndEditCollection();
    HRESULT Undo(int, int*);
    HRESULT Redo(int, int*);
    HRESULT Range(int, int, ITextRange*);
    HRESULT RangeFromPoint(int, int, ITextRange*);
}
enum IID_ITextRange = GUID(0x8cc497c2, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextRange : IDispatch
{
    HRESULT GetText(BSTR*);
    HRESULT SetText(BSTR);
    HRESULT GetChar(int*);
    HRESULT SetChar(int);
    HRESULT GetDuplicate(ITextRange*);
    HRESULT GetFormattedText(ITextRange*);
    HRESULT SetFormattedText(ITextRange);
    HRESULT GetStart(int*);
    HRESULT SetStart(int);
    HRESULT GetEnd(int*);
    HRESULT SetEnd(int);
    HRESULT GetFont(ITextFont*);
    HRESULT SetFont(ITextFont);
    HRESULT GetPara(ITextPara*);
    HRESULT SetPara(ITextPara);
    HRESULT GetStoryLength(int*);
    HRESULT GetStoryType(int*);
    HRESULT Collapse(int);
    HRESULT Expand(int, int*);
    HRESULT GetIndex(int, int*);
    HRESULT SetIndex(int, int, int);
    HRESULT SetRange(int, int);
    HRESULT InRange(ITextRange, int*);
    HRESULT InStory(ITextRange, int*);
    HRESULT IsEqual(ITextRange, int*);
    HRESULT Select();
    HRESULT StartOf(int, int, int*);
    HRESULT EndOf(int, int, int*);
    HRESULT Move(int, int, int*);
    HRESULT MoveStart(int, int, int*);
    HRESULT MoveEnd(int, int, int*);
    HRESULT MoveWhile(VARIANT*, int, int*);
    HRESULT MoveStartWhile(VARIANT*, int, int*);
    HRESULT MoveEndWhile(VARIANT*, int, int*);
    HRESULT MoveUntil(VARIANT*, int, int*);
    HRESULT MoveStartUntil(VARIANT*, int, int*);
    HRESULT MoveEndUntil(VARIANT*, int, int*);
    HRESULT FindText(BSTR, int, tomConstants, int*);
    HRESULT FindTextStart(BSTR, int, tomConstants, int*);
    HRESULT FindTextEnd(BSTR, int, tomConstants, int*);
    HRESULT Delete(int, int, int*);
    HRESULT Cut(VARIANT*);
    HRESULT Copy(VARIANT*);
    HRESULT Paste(VARIANT*, int);
    HRESULT CanPaste(VARIANT*, int, int*);
    HRESULT CanEdit(int*);
    HRESULT ChangeCase(tomConstants);
    HRESULT GetPoint(tomConstants, int*, int*);
    HRESULT SetPoint(int, int, tomConstants, int);
    HRESULT ScrollIntoView(int);
    HRESULT GetEmbeddedObject(IUnknown*);
}
enum IID_ITextSelection = GUID(0x8cc497c1, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextSelection : ITextRange
{
    HRESULT GetFlags(int*);
    HRESULT SetFlags(int);
    HRESULT GetType(int*);
    HRESULT MoveLeft(int, int, int, int*);
    HRESULT MoveRight(int, int, int, int*);
    HRESULT MoveUp(int, int, int, int*);
    HRESULT MoveDown(int, int, int, int*);
    HRESULT HomeKey(tomConstants, int, int*);
    HRESULT EndKey(int, int, int*);
    HRESULT TypeText(BSTR);
}
enum IID_ITextFont = GUID(0x8cc497c3, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextFont : IDispatch
{
    HRESULT GetDuplicate(ITextFont*);
    HRESULT SetDuplicate(ITextFont);
    HRESULT CanChange(int*);
    HRESULT IsEqual(ITextFont, int*);
    HRESULT Reset(tomConstants);
    HRESULT GetStyle(int*);
    HRESULT SetStyle(int);
    HRESULT GetAllCaps(int*);
    HRESULT SetAllCaps(int);
    HRESULT GetAnimation(int*);
    HRESULT SetAnimation(int);
    HRESULT GetBackColor(int*);
    HRESULT SetBackColor(int);
    HRESULT GetBold(int*);
    HRESULT SetBold(int);
    HRESULT GetEmboss(int*);
    HRESULT SetEmboss(int);
    HRESULT GetForeColor(int*);
    HRESULT SetForeColor(int);
    HRESULT GetHidden(int*);
    HRESULT SetHidden(int);
    HRESULT GetEngrave(int*);
    HRESULT SetEngrave(int);
    HRESULT GetItalic(int*);
    HRESULT SetItalic(int);
    HRESULT GetKerning(float*);
    HRESULT SetKerning(float);
    HRESULT GetLanguageID(int*);
    HRESULT SetLanguageID(int);
    HRESULT GetName(BSTR*);
    HRESULT SetName(BSTR);
    HRESULT GetOutline(int*);
    HRESULT SetOutline(int);
    HRESULT GetPosition(float*);
    HRESULT SetPosition(float);
    HRESULT GetProtected(int*);
    HRESULT SetProtected(int);
    HRESULT GetShadow(int*);
    HRESULT SetShadow(int);
    HRESULT GetSize(float*);
    HRESULT SetSize(float);
    HRESULT GetSmallCaps(int*);
    HRESULT SetSmallCaps(int);
    HRESULT GetSpacing(float*);
    HRESULT SetSpacing(float);
    HRESULT GetStrikeThrough(int*);
    HRESULT SetStrikeThrough(int);
    HRESULT GetSubscript(int*);
    HRESULT SetSubscript(int);
    HRESULT GetSuperscript(int*);
    HRESULT SetSuperscript(int);
    HRESULT GetUnderline(int*);
    HRESULT SetUnderline(int);
    HRESULT GetWeight(int*);
    HRESULT SetWeight(int);
}
enum IID_ITextPara = GUID(0x8cc497c4, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextPara : IDispatch
{
    HRESULT GetDuplicate(ITextPara*);
    HRESULT SetDuplicate(ITextPara);
    HRESULT CanChange(int*);
    HRESULT IsEqual(ITextPara, int*);
    HRESULT Reset(int);
    HRESULT GetStyle(int*);
    HRESULT SetStyle(int);
    HRESULT GetAlignment(int*);
    HRESULT SetAlignment(int);
    HRESULT GetHyphenation(tomConstants*);
    HRESULT SetHyphenation(int);
    HRESULT GetFirstLineIndent(float*);
    HRESULT GetKeepTogether(tomConstants*);
    HRESULT SetKeepTogether(int);
    HRESULT GetKeepWithNext(tomConstants*);
    HRESULT SetKeepWithNext(int);
    HRESULT GetLeftIndent(float*);
    HRESULT GetLineSpacing(float*);
    HRESULT GetLineSpacingRule(int*);
    HRESULT GetListAlignment(int*);
    HRESULT SetListAlignment(int);
    HRESULT GetListLevelIndex(int*);
    HRESULT SetListLevelIndex(int);
    HRESULT GetListStart(int*);
    HRESULT SetListStart(int);
    HRESULT GetListTab(float*);
    HRESULT SetListTab(float);
    HRESULT GetListType(int*);
    HRESULT SetListType(int);
    HRESULT GetNoLineNumber(int*);
    HRESULT SetNoLineNumber(int);
    HRESULT GetPageBreakBefore(int*);
    HRESULT SetPageBreakBefore(int);
    HRESULT GetRightIndent(float*);
    HRESULT SetRightIndent(float);
    HRESULT SetIndents(float, float, float);
    HRESULT SetLineSpacing(int, float);
    HRESULT GetSpaceAfter(float*);
    HRESULT SetSpaceAfter(float);
    HRESULT GetSpaceBefore(float*);
    HRESULT SetSpaceBefore(float);
    HRESULT GetWidowControl(int*);
    HRESULT SetWidowControl(int);
    HRESULT GetTabCount(int*);
    HRESULT AddTab(float, int, int);
    HRESULT ClearAllTabs();
    HRESULT DeleteTab(float);
    HRESULT GetTab(int, float*, int*, int*);
}
enum IID_ITextStoryRanges = GUID(0x8cc497c5, 0xa1df, 0x11ce, [0x80, 0x98, 0x0, 0xaa, 0x0, 0x47, 0xbe, 0x5d]);
interface ITextStoryRanges : IDispatch
{
    HRESULT _NewEnum(IUnknown*);
    HRESULT Item(int, ITextRange*);
    HRESULT GetCount(int*);
}
enum IID_ITextDocument2 = GUID(0xc241f5e0, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextDocument2 : ITextDocument
{
    HRESULT GetCaretType(int*);
    HRESULT SetCaretType(int);
    HRESULT GetDisplays(ITextDisplays*);
    HRESULT GetDocumentFont(ITextFont2*);
    HRESULT SetDocumentFont(ITextFont2);
    HRESULT GetDocumentPara(ITextPara2*);
    HRESULT SetDocumentPara(ITextPara2);
    HRESULT GetEastAsianFlags(tomConstants*);
    HRESULT GetGenerator(BSTR*);
    HRESULT SetIMEInProgress(int);
    HRESULT GetNotificationMode(int*);
    HRESULT SetNotificationMode(int);
    HRESULT GetSelection2(ITextSelection2*);
    HRESULT GetStoryRanges2(ITextStoryRanges2*);
    HRESULT GetTypographyOptions(int*);
    HRESULT GetVersion(int*);
    HRESULT GetWindow(long*);
    HRESULT AttachMsgFilter(IUnknown);
    HRESULT CheckTextLimit(int, int*);
    HRESULT GetCallManager(IUnknown*);
    HRESULT GetClientRect(tomConstants, int*, int*, int*, int*);
    HRESULT GetEffectColor(int, int*);
    HRESULT GetImmContext(long*);
    HRESULT GetPreferredFont(int, int, int, int, int, BSTR*, int*, int*);
    HRESULT GetProperty(int, int*);
    HRESULT GetStrings(ITextStrings*);
    HRESULT Notify(int);
    HRESULT Range2(int, int, ITextRange2*);
    HRESULT RangeFromPoint2(int, int, int, ITextRange2*);
    HRESULT ReleaseCallManager(IUnknown);
    HRESULT ReleaseImmContext(long);
    HRESULT SetEffectColor(int, int);
    HRESULT SetProperty(int, int);
    HRESULT SetTypographyOptions(int, int);
    HRESULT SysBeep();
    HRESULT Update(int);
    HRESULT UpdateWindow();
    HRESULT GetMathProperties(int*);
    HRESULT SetMathProperties(int, int);
    HRESULT GetActiveStory(ITextStory*);
    HRESULT SetActiveStory(ITextStory);
    HRESULT GetMainStory(ITextStory*);
    HRESULT GetNewStory(ITextStory*);
    HRESULT GetStory(int, ITextStory*);
}
enum IID_ITextRange2 = GUID(0xc241f5e2, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextRange2 : ITextSelection
{
    HRESULT GetCch(int*);
    HRESULT GetCells(IUnknown*);
    HRESULT GetColumn(IUnknown*);
    HRESULT GetCount(int*);
    HRESULT GetDuplicate2(ITextRange2*);
    HRESULT GetFont2(ITextFont2*);
    HRESULT SetFont2(ITextFont2);
    HRESULT GetFormattedText2(ITextRange2*);
    HRESULT SetFormattedText2(ITextRange2);
    HRESULT GetGravity(int*);
    HRESULT SetGravity(int);
    HRESULT GetPara2(ITextPara2*);
    HRESULT SetPara2(ITextPara2);
    HRESULT GetRow(ITextRow*);
    HRESULT GetStartPara(int*);
    HRESULT GetTable(IUnknown*);
    HRESULT GetURL(BSTR*);
    HRESULT SetURL(BSTR);
    HRESULT AddSubrange(int, int, int);
    HRESULT BuildUpMath(int);
    HRESULT DeleteSubrange(int, int);
    HRESULT Find(ITextRange2, int, int, int*);
    HRESULT GetChar2(int*, int);
    HRESULT GetDropCap(int*, int*);
    HRESULT GetInlineObject(int*, int*, int*, int*, int*, int*, int*, int*, int*);
    HRESULT GetProperty(int, int*);
    HRESULT GetRect(int, int*, int*, int*, int*, int*);
    HRESULT GetSubrange(int, int*, int*);
    HRESULT GetText2(int, BSTR*);
    HRESULT HexToUnicode();
    HRESULT InsertTable(int, int, int);
    HRESULT Linearize(int);
    HRESULT SetActiveSubrange(int, int);
    HRESULT SetDropCap(int, int);
    HRESULT SetProperty(int, int);
    HRESULT SetText2(int, BSTR);
    HRESULT UnicodeToHex();
    HRESULT SetInlineObject(int, int, int, int, int, int, int, int);
    HRESULT GetMathFunctionType(BSTR, int*);
    HRESULT InsertImage(int, int, int, TEXT_ALIGN_OPTIONS, BSTR, IStream);
}
enum IID_ITextSelection2 = GUID(0xc241f5e1, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextSelection2 : ITextRange2
{
}
enum IID_ITextFont2 = GUID(0xc241f5e3, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextFont2 : ITextFont
{
    HRESULT GetCount(int*);
    HRESULT GetAutoLigatures(int*);
    HRESULT SetAutoLigatures(int);
    HRESULT GetAutospaceAlpha(int*);
    HRESULT SetAutospaceAlpha(int);
    HRESULT GetAutospaceNumeric(int*);
    HRESULT SetAutospaceNumeric(int);
    HRESULT GetAutospaceParens(int*);
    HRESULT SetAutospaceParens(int);
    HRESULT GetCharRep(int*);
    HRESULT SetCharRep(int);
    HRESULT GetCompressionMode(int*);
    HRESULT SetCompressionMode(int);
    HRESULT GetCookie(int*);
    HRESULT SetCookie(int);
    HRESULT GetDoubleStrike(int*);
    HRESULT SetDoubleStrike(int);
    HRESULT GetDuplicate2(ITextFont2*);
    HRESULT SetDuplicate2(ITextFont2);
    HRESULT GetLinkType(int*);
    HRESULT GetMathZone(int*);
    HRESULT SetMathZone(int);
    HRESULT GetModWidthPairs(int*);
    HRESULT SetModWidthPairs(int);
    HRESULT GetModWidthSpace(int*);
    HRESULT SetModWidthSpace(int);
    HRESULT GetOldNumbers(int*);
    HRESULT SetOldNumbers(int);
    HRESULT GetOverlapping(int*);
    HRESULT SetOverlapping(int);
    HRESULT GetPositionSubSuper(int*);
    HRESULT SetPositionSubSuper(int);
    HRESULT GetScaling(int*);
    HRESULT SetScaling(int);
    HRESULT GetSpaceExtension(float*);
    HRESULT SetSpaceExtension(float);
    HRESULT GetUnderlinePositionMode(int*);
    HRESULT SetUnderlinePositionMode(int);
    HRESULT GetEffects(int*, int*);
    HRESULT GetEffects2(int*, int*);
    HRESULT GetProperty(int, int*);
    HRESULT GetPropertyInfo(int, int*, int*);
    HRESULT IsEqual2(ITextFont2, int*);
    HRESULT SetEffects(int, int);
    HRESULT SetEffects2(int, int);
    HRESULT SetProperty(int, int);
}
enum IID_ITextPara2 = GUID(0xc241f5e4, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextPara2 : ITextPara
{
    HRESULT GetBorders(IUnknown*);
    HRESULT GetDuplicate2(ITextPara2*);
    HRESULT SetDuplicate2(ITextPara2);
    HRESULT GetFontAlignment(int*);
    HRESULT SetFontAlignment(int);
    HRESULT GetHangingPunctuation(int*);
    HRESULT SetHangingPunctuation(int);
    HRESULT GetSnapToGrid(int*);
    HRESULT SetSnapToGrid(int);
    HRESULT GetTrimPunctuationAtStart(int*);
    HRESULT SetTrimPunctuationAtStart(int);
    HRESULT GetEffects(int*, int*);
    HRESULT GetProperty(int, int*);
    HRESULT IsEqual2(ITextPara2, int*);
    HRESULT SetEffects(int, int);
    HRESULT SetProperty(int, int);
}
enum IID_ITextStoryRanges2 = GUID(0xc241f5e5, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextStoryRanges2 : ITextStoryRanges
{
    HRESULT Item2(int, ITextRange2*);
}
enum IID_ITextStory = GUID(0xc241f5f3, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextStory : IUnknown
{
    HRESULT GetActive(int*);
    HRESULT SetActive(int);
    HRESULT GetDisplay(IUnknown*);
    HRESULT GetIndex(int*);
    HRESULT GetType(int*);
    HRESULT SetType(int);
    HRESULT GetProperty(int, int*);
    HRESULT GetRange(int, int, ITextRange2*);
    HRESULT GetText(int, BSTR*);
    HRESULT SetFormattedText(IUnknown);
    HRESULT SetProperty(int, int);
    HRESULT SetText(int, BSTR);
}
enum IID_ITextStrings = GUID(0xc241f5e7, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextStrings : IDispatch
{
    HRESULT Item(int, ITextRange2*);
    HRESULT GetCount(int*);
    HRESULT Add(BSTR);
    HRESULT Append(ITextRange2, int);
    HRESULT Cat2(int);
    HRESULT CatTop2(BSTR);
    HRESULT DeleteRange(ITextRange2);
    HRESULT EncodeFunction(int, int, int, int, int, int, int, int, ITextRange2);
    HRESULT GetCch(int, int*);
    HRESULT InsertNullStr(int);
    HRESULT MoveBoundary(int, int);
    HRESULT PrefixTop(BSTR);
    HRESULT Remove(int, int);
    HRESULT SetFormattedText(ITextRange2, ITextRange2);
    HRESULT SetOpCp(int, int);
    HRESULT SuffixTop(BSTR, ITextRange2);
    HRESULT Swap();
}
enum IID_ITextRow = GUID(0xc241f5ef, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextRow : IDispatch
{
    HRESULT GetAlignment(int*);
    HRESULT SetAlignment(int);
    HRESULT GetCellCount(int*);
    HRESULT SetCellCount(int);
    HRESULT GetCellCountCache(int*);
    HRESULT SetCellCountCache(int);
    HRESULT GetCellIndex(int*);
    HRESULT SetCellIndex(int);
    HRESULT GetCellMargin(int*);
    HRESULT SetCellMargin(int);
    HRESULT GetHeight(int*);
    HRESULT SetHeight(int);
    HRESULT GetIndent(int*);
    HRESULT SetIndent(int);
    HRESULT GetKeepTogether(int*);
    HRESULT SetKeepTogether(int);
    HRESULT GetKeepWithNext(int*);
    HRESULT SetKeepWithNext(int);
    HRESULT GetNestLevel(int*);
    HRESULT GetRTL(int*);
    HRESULT SetRTL(int);
    HRESULT GetCellAlignment(int*);
    HRESULT SetCellAlignment(int);
    HRESULT GetCellColorBack(int*);
    HRESULT SetCellColorBack(int);
    HRESULT GetCellColorFore(int*);
    HRESULT SetCellColorFore(int);
    HRESULT GetCellMergeFlags(int*);
    HRESULT SetCellMergeFlags(int);
    HRESULT GetCellShading(int*);
    HRESULT SetCellShading(int);
    HRESULT GetCellVerticalText(int*);
    HRESULT SetCellVerticalText(int);
    HRESULT GetCellWidth(int*);
    HRESULT SetCellWidth(int);
    HRESULT GetCellBorderColors(int*, int*, int*, int*);
    HRESULT GetCellBorderWidths(int*, int*, int*, int*);
    HRESULT SetCellBorderColors(int, int, int, int);
    HRESULT SetCellBorderWidths(int, int, int, int);
    HRESULT Apply(int, tomConstants);
    HRESULT CanChange(int*);
    HRESULT GetProperty(int, int*);
    HRESULT Insert(int);
    HRESULT IsEqual(ITextRow, int*);
    HRESULT Reset(int);
    HRESULT SetProperty(int, int);
}
enum IID_ITextDisplays = GUID(0xc241f5f2, 0x7206, 0x11d8, [0xa2, 0xc7, 0x0, 0xa0, 0xd1, 0xd6, 0xc6, 0xb3]);
interface ITextDisplays : IDispatch
{
}
enum IID_ITextDocument2Old = GUID(0x1c25500, 0x4268, 0x11d1, [0x88, 0x3a, 0x3c, 0x8b, 0x0, 0xc1, 0x0, 0x0]);
interface ITextDocument2Old : ITextDocument
{
    HRESULT AttachMsgFilter(IUnknown);
    HRESULT SetEffectColor(int, COLORREF);
    HRESULT GetEffectColor(int, COLORREF*);
    HRESULT GetCaretType(int*);
    HRESULT SetCaretType(int);
    HRESULT GetImmContext(long*);
    HRESULT ReleaseImmContext(long);
    HRESULT GetPreferredFont(int, int, int, int, int, BSTR*, int*, int*);
    HRESULT GetNotificationMode(int*);
    HRESULT SetNotificationMode(int);
    HRESULT GetClientRect(int, int*, int*, int*, int*);
    HRESULT GetSelection2(ITextSelection*);
    HRESULT GetWindow(int*);
    HRESULT GetFEFlags(int*);
    HRESULT UpdateWindow();
    HRESULT CheckTextLimit(int, int*);
    HRESULT IMEInProgress(int);
    HRESULT SysBeep();
    HRESULT Update(int);
    HRESULT Notify(int);
    HRESULT GetDocumentFont(ITextFont*);
    HRESULT GetDocumentPara(ITextPara*);
    HRESULT GetCallManager(IUnknown*);
    HRESULT ReleaseCallManager(IUnknown);
}
