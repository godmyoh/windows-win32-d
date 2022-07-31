module windows.win32.ui.tabletpc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE_PTR, HRESULT, HWND, POINT, PWSTR, RECT;
import windows.win32.graphics.gdi : XFORM;
import windows.win32.system.com_ : IDataObject, IDispatch, IUnknown, SAFEARRAY, VARIANT;
import windows.win32.system.ole : IFontDisp, IPictureDisp;
import windows.win32.ui.controls_ : NMHDR;

version (Windows):
extern (Windows):

alias PfnRecoCallback = HRESULT function(uint, ubyte*, HRECOCONTEXT);
HRESULT CreateRecognizer(GUID*, HRECOGNIZER*);
HRESULT DestroyRecognizer(HRECOGNIZER);
HRESULT GetRecoAttributes(HRECOGNIZER, RECO_ATTRS*);
HRESULT CreateContext(HRECOGNIZER, HRECOCONTEXT*);
HRESULT DestroyContext(HRECOCONTEXT);
HRESULT GetResultPropertyList(HRECOGNIZER, uint*, GUID*);
HRESULT GetUnicodeRanges(HRECOGNIZER, uint*, CHARACTER_RANGE*);
HRESULT AddStroke(HRECOCONTEXT, const(PACKET_DESCRIPTION)*, uint, const(ubyte)*, const(XFORM)*);
HRESULT GetBestResultString(HRECOCONTEXT, uint*, PWSTR);
HRESULT SetGuide(HRECOCONTEXT, const(RECO_GUIDE)*, uint);
HRESULT AdviseInkChange(HRECOCONTEXT, BOOL);
HRESULT EndInkInput(HRECOCONTEXT);
HRESULT Process(HRECOCONTEXT, BOOL*);
HRESULT SetFactoid(HRECOCONTEXT, uint, const(wchar)*);
HRESULT SetFlags(HRECOCONTEXT, uint);
HRESULT GetLatticePtr(HRECOCONTEXT, RECO_LATTICE**);
HRESULT SetTextContext(HRECOCONTEXT, uint, const(wchar)*, uint, const(wchar)*);
HRESULT SetEnabledUnicodeRanges(HRECOCONTEXT, uint, CHARACTER_RANGE*);
HRESULT IsStringSupported(HRECOCONTEXT, uint, const(wchar)*);
HRESULT SetWordList(HRECOCONTEXT, HRECOWORDLIST);
HRESULT GetRightSeparator(HRECOCONTEXT, uint*, PWSTR);
HRESULT GetLeftSeparator(HRECOCONTEXT, uint*, PWSTR);
HRESULT DestroyWordList(HRECOWORDLIST);
HRESULT AddWordsToWordList(HRECOWORDLIST, PWSTR);
HRESULT MakeWordList(HRECOGNIZER, PWSTR, HRECOWORDLIST*);
HRESULT GetAllRecognizers(GUID**, uint*);
HRESULT LoadCachedAttributes(GUID, RECO_ATTRS*);
enum MICROSOFT_URL_EXPERIENCE_PROPERTY = "Microsoft TIP URL Experience";
enum MICROSOFT_TIP_NO_INSERT_BUTTON_PROPERTY = "Microsoft TIP No Insert Option";
enum MICROSOFT_TIP_COMBOBOXLIST_PROPERTY = "Microsoft TIP ComboBox List Window Identifier";
enum MICROSOFT_TIP_OPENING_MSG = "TabletInputPanelOpening";
enum SAFE_PARTIAL = 0x00000001;
enum BEST_COMPLETE = 0x00000002;
enum MAX_VENDORNAME = 0x00000020;
enum MAX_FRIENDLYNAME = 0x00000040;
enum MAX_LANGUAGES = 0x00000040;
enum CAC_FULL = 0x00000000;
enum CAC_PREFIX = 0x00000001;
enum CAC_RANDOM = 0x00000002;
enum ASYNC_RECO_INTERRUPTED = 0x00000001;
enum ASYNC_RECO_PROCESS_FAILED = 0x00000002;
enum ASYNC_RECO_ADDSTROKE_FAILED = 0x00000004;
enum ASYNC_RECO_SETCACMODE_FAILED = 0x00000008;
enum ASYNC_RECO_RESETCONTEXT_FAILED = 0x00000010;
enum ASYNC_RECO_SETGUIDE_FAILED = 0x00000020;
enum ASYNC_RECO_SETFLAGS_FAILED = 0x00000040;
enum ASYNC_RECO_SETFACTOID_FAILED = 0x00000080;
enum ASYNC_RECO_SETTEXTCONTEXT_FAILED = 0x00000100;
enum ASYNC_RECO_SETWORDLIST_FAILED = 0x00000200;
enum RF_DONTCARE = 0x00000001;
enum RF_OBJECT = 0x00000002;
enum RF_FREE_INPUT = 0x00000004;
enum RF_LINED_INPUT = 0x00000008;
enum RF_BOXED_INPUT = 0x00000010;
enum RF_CAC_INPUT = 0x00000020;
enum RF_RIGHT_AND_DOWN = 0x00000040;
enum RF_LEFT_AND_DOWN = 0x00000080;
enum RF_DOWN_AND_LEFT = 0x00000100;
enum RF_DOWN_AND_RIGHT = 0x00000200;
enum RF_ARBITRARY_ANGLE = 0x00000400;
enum RF_LATTICE = 0x00000800;
enum RF_ADVISEINKCHANGE = 0x00001000;
enum RF_STROKEREORDER = 0x00002000;
enum RF_PERSONALIZABLE = 0x00004000;
enum RF_PERFORMSLINEBREAKING = 0x00010000;
enum RF_REQUIRESSEGMENTATIONBREAKING = 0x00020000;
enum FLICK_WM_HANDLED_MASK = 0x00000001;
enum NUM_FLICK_DIRECTIONS = 0x00000008;
enum WM_TABLET_DEFBASE = 0x000002c0;
enum WM_TABLET_MAXOFFSET = 0x00000020;
enum WM_TABLET_ADDED = 0x000002c8;
enum WM_TABLET_DELETED = 0x000002c9;
enum WM_TABLET_FLICK = 0x000002cb;
enum WM_TABLET_QUERYSYSTEMGESTURESTATUS = 0x000002cc;
enum TABLET_DISABLE_PRESSANDHOLD = 0x00000001;
enum TABLET_DISABLE_PENTAPFEEDBACK = 0x00000008;
enum TABLET_DISABLE_PENBARRELFEEDBACK = 0x00000010;
enum TABLET_DISABLE_TOUCHUIFORCEON = 0x00000100;
enum TABLET_DISABLE_TOUCHUIFORCEOFF = 0x00000200;
enum TABLET_DISABLE_TOUCHSWITCH = 0x00008000;
enum TABLET_DISABLE_FLICKS = 0x00010000;
enum TABLET_ENABLE_FLICKSONCONTEXT = 0x00020000;
enum TABLET_ENABLE_FLICKLEARNINGMODE = 0x00040000;
enum TABLET_DISABLE_SMOOTHSCROLLING = 0x00080000;
enum TABLET_DISABLE_FLICKFALLBACKKEYS = 0x00100000;
enum TABLET_ENABLE_MULTITOUCHDATA = 0x01000000;
enum MAX_PACKET_PROPERTY_COUNT = 0x00000020;
enum MAX_PACKET_BUTTON_COUNT = 0x00000020;
enum IP_CURSOR_DOWN = 0x00000001;
enum IP_INVERTED = 0x00000002;
enum IP_MARGIN = 0x00000004;
enum INK_SERIALIZED_FORMAT = "Ink Serialized Format";
enum STR_GUID_X = "{598A6A8F-52C0-4BA0-93AF-AF357411A561}";
enum STR_GUID_Y = "{B53F9F75-04E0-4498-A7EE-C30DBB5A9011}";
enum STR_GUID_Z = "{735ADB30-0EBB-4788-A0E4-0F316490055D}";
enum STR_GUID_PAKETSTATUS = "{6E0E07BF-AFE7-4CF7-87D1-AF6446208418}";
enum STR_GUID_TIMERTICK = "{436510C5-FED3-45D1-8B76-71D3EA7A829D}";
enum STR_GUID_SERIALNUMBER = "{78A81B56-0935-4493-BAAE-00541A8A16C4}";
enum STR_GUID_NORMALPRESSURE = "{7307502D-F9F4-4E18-B3F2-2CE1B1A3610C}";
enum STR_GUID_TANGENTPRESSURE = "{6DA4488B-5244-41EC-905B-32D89AB80809}";
enum STR_GUID_BUTTONPRESSURE = "{8B7FEFC4-96AA-4BFE-AC26-8A5F0BE07BF5}";
enum STR_GUID_XTILTORIENTATION = "{A8D07B3A-8BF0-40B0-95A9-B80A6BB787BF}";
enum STR_GUID_YTILTORIENTATION = "{0E932389-1D77-43AF-AC00-5B950D6D4B2D}";
enum STR_GUID_AZIMUTHORIENTATION = "{029123B4-8828-410B-B250-A0536595E5DC}";
enum STR_GUID_ALTITUDEORIENTATION = "{82DEC5C7-F6BA-4906-894F-66D68DFC456C}";
enum STR_GUID_TWISTORIENTATION = "{0D324960-13B2-41E4-ACE6-7AE9D43D2D3B}";
enum STR_GUID_PITCHROTATION = "{7F7E57B7-BE37-4BE1-A356-7A84160E1893}";
enum STR_GUID_ROLLROTATION = "{5D5D5E56-6BA9-4C5B-9FB0-851C91714E56}";
enum STR_GUID_YAWROTATION = "{6A849980-7C3A-45B7-AA82-90A262950E89}";
enum STR_GUID_WIDTH = "{BAABE94D-2712-48F5-BE9D-8F8B5EA0711A}";
enum STR_GUID_HEIGHT = "{E61858D2-E447-4218-9D3F-18865C203DF4}";
enum STR_GUID_FINGERCONTACTCONFIDENCE = "{E706C804-57F0-4F00-8A0C-853D57789BE9}";
enum STR_GUID_DEVICE_CONTACT_ID = "{02585B91-049B-4750-9615-DF8948AB3C9C}";
enum INKRECOGNITIONPROPERTY_LINENUMBER = "{DBF29F2C-5289-4BE8-B3D8-6EF63246253E}";
enum INKRECOGNITIONPROPERTY_BOXNUMBER = "{2C243E3A-F733-4EB6-B1F8-B5DC5C2C4CDA}";
enum INKRECOGNITIONPROPERTY_SEGMENTATION = "{B3C0FE6C-FB51-4164-BA2F-844AF8F983DA}";
enum INKRECOGNITIONPROPERTY_HOTPOINT = "{CA6F40DC-5292-452a-91FB-2181C0BEC0DE}";
enum INKRECOGNITIONPROPERTY_MAXIMUMSTROKECOUNT = "{BF0EEC4E-4B7D-47a9-8CFA-234DD24BD22A}";
enum INKRECOGNITIONPROPERTY_POINTSPERINCH = "{7ED16B76-889C-468e-8276-0021B770187E}";
enum INKRECOGNITIONPROPERTY_CONFIDENCELEVEL = "{7DFE11A7-FB5D-4958-8765-154ADF0D833F}";
enum INKRECOGNITIONPROPERTY_LINEMETRICS = "{8CC24B27-30A9-4b96-9056-2D3A90DA0727}";
enum FACTOID_NONE = "NONE";
enum FACTOID_DEFAULT = "DEFAULT";
enum FACTOID_SYSTEMDICTIONARY = "SYSDICT";
enum FACTOID_WORDLIST = "WORDLIST";
enum FACTOID_EMAIL = "EMAIL";
enum FACTOID_WEB = "WEB";
enum FACTOID_ONECHAR = "ONECHAR";
enum FACTOID_NUMBER = "NUMBER";
enum FACTOID_DIGIT = "DIGIT";
enum FACTOID_NUMBERSIMPLE = "NUMSIMPLE";
enum FACTOID_CURRENCY = "CURRENCY";
enum FACTOID_POSTALCODE = "POSTALCODE";
enum FACTOID_PERCENT = "PERCENT";
enum FACTOID_DATE = "DATE";
enum FACTOID_TIME = "TIME";
enum FACTOID_TELEPHONE = "TELEPHONE";
enum FACTOID_FILENAME = "FILENAME";
enum FACTOID_UPPERCHAR = "UPPERCHAR";
enum FACTOID_LOWERCHAR = "LOWERCHAR";
enum FACTOID_PUNCCHAR = "PUNCCHAR";
enum FACTOID_JAPANESECOMMON = "JPN_COMMON";
enum FACTOID_CHINESESIMPLECOMMON = "CHS_COMMON";
enum FACTOID_CHINESETRADITIONALCOMMON = "CHT_COMMON";
enum FACTOID_KOREANCOMMON = "KOR_COMMON";
enum FACTOID_HIRAGANA = "HIRAGANA";
enum FACTOID_KATAKANA = "KATAKANA";
enum FACTOID_KANJICOMMON = "KANJI_COMMON";
enum FACTOID_KANJIRARE = "KANJI_RARE";
enum FACTOID_BOPOMOFO = "BOPOMOFO";
enum FACTOID_JAMO = "JAMO";
enum FACTOID_HANGULCOMMON = "HANGUL_COMMON";
enum FACTOID_HANGULRARE = "HANGUL_RARE";
enum MICROSOFT_PENINPUT_PANEL_PROPERTY_T = "Microsoft PenInputPanel 1.5";
enum INKEDIT_CLASSW = "INKEDIT";
enum INKEDIT_CLASS = "INKEDIT";
enum IEC__BASE = 0x00000600;
enum EM_GETINKMODE = 0x00000601;
enum EM_SETINKMODE = 0x00000602;
enum EM_GETINKINSERTMODE = 0x00000603;
enum EM_SETINKINSERTMODE = 0x00000604;
enum EM_GETDRAWATTR = 0x00000605;
enum EM_SETDRAWATTR = 0x00000606;
enum EM_GETRECOTIMEOUT = 0x00000607;
enum EM_SETRECOTIMEOUT = 0x00000608;
enum EM_GETGESTURESTATUS = 0x00000609;
enum EM_SETGESTURESTATUS = 0x0000060a;
enum EM_GETRECOGNIZER = 0x0000060b;
enum EM_SETRECOGNIZER = 0x0000060c;
enum EM_GETFACTOID = 0x0000060d;
enum EM_SETFACTOID = 0x0000060e;
enum EM_GETSELINK = 0x0000060f;
enum EM_SETSELINK = 0x00000610;
enum EM_GETMOUSEICON = 0x00000611;
enum EM_SETMOUSEICON = 0x00000612;
enum EM_GETMOUSEPOINTER = 0x00000613;
enum EM_SETMOUSEPOINTER = 0x00000614;
enum EM_GETSTATUS = 0x00000615;
enum EM_RECOGNIZE = 0x00000616;
enum EM_GETUSEMOUSEFORINPUT = 0x00000617;
enum EM_SETUSEMOUSEFORINPUT = 0x00000618;
enum EM_SETSELINKDISPLAYMODE = 0x00000619;
enum EM_GETSELINKDISPLAYMODE = 0x0000061a;
enum IECN__BASE = 0x00000800;
enum IECN_STROKE = 0x00000801;
enum IECN_GESTURE = 0x00000802;
enum IECN_RECOGNITIONRESULT = 0x00000803;
enum RECOFLAG_WORDMODE = 0x00000001;
enum RECOFLAG_COERCE = 0x00000002;
enum RECOFLAG_SINGLESEG = 0x00000004;
enum RECOFLAG_PREFIXOK = 0x00000008;
enum RECOFLAG_LINEMODE = 0x00000010;
enum RECOFLAG_DISABLEPERSONALIZATION = 0x00000020;
enum RECOFLAG_AUTOSPACE = 0x00000040;
enum RECOCONF_LOWCONFIDENCE = 0xffffffffffffffff;
enum RECOCONF_MEDIUMCONFIDENCE = 0x00000000;
enum RECOCONF_HIGHCONFIDENCE = 0x00000001;
enum RECOCONF_NOTSET = 0x00000080;
enum GESTURE_NULL = 0x0000f000;
enum GESTURE_SCRATCHOUT = 0x0000f001;
enum GESTURE_TRIANGLE = 0x0000f002;
enum GESTURE_SQUARE = 0x0000f003;
enum GESTURE_STAR = 0x0000f004;
enum GESTURE_CHECK = 0x0000f005;
enum GESTURE_INFINITY = 0x0000f006;
enum GESTURE_CROSS = 0x0000f007;
enum GESTURE_PARAGRAPH = 0x0000f008;
enum GESTURE_SECTION = 0x0000f009;
enum GESTURE_BULLET = 0x0000f00a;
enum GESTURE_BULLET_CROSS = 0x0000f00b;
enum GESTURE_SQUIGGLE = 0x0000f00c;
enum GESTURE_SWAP = 0x0000f00d;
enum GESTURE_OPENUP = 0x0000f00e;
enum GESTURE_CLOSEUP = 0x0000f00f;
enum GESTURE_CURLICUE = 0x0000f010;
enum GESTURE_DOUBLE_CURLICUE = 0x0000f011;
enum GESTURE_RECTANGLE = 0x0000f012;
enum GESTURE_CIRCLE = 0x0000f020;
enum GESTURE_DOUBLE_CIRCLE = 0x0000f021;
enum GESTURE_CIRCLE_TAP = 0x0000f022;
enum GESTURE_CIRCLE_CIRCLE = 0x0000f023;
enum GESTURE_CIRCLE_CROSS = 0x0000f025;
enum GESTURE_CIRCLE_LINE_VERT = 0x0000f026;
enum GESTURE_CIRCLE_LINE_HORZ = 0x0000f027;
enum GESTURE_SEMICIRCLE_LEFT = 0x0000f028;
enum GESTURE_SEMICIRCLE_RIGHT = 0x0000f029;
enum GESTURE_CHEVRON_UP = 0x0000f030;
enum GESTURE_CHEVRON_DOWN = 0x0000f031;
enum GESTURE_CHEVRON_LEFT = 0x0000f032;
enum GESTURE_CHEVRON_RIGHT = 0x0000f033;
enum GESTURE_ARROW_UP = 0x0000f038;
enum GESTURE_ARROW_DOWN = 0x0000f039;
enum GESTURE_ARROW_LEFT = 0x0000f03a;
enum GESTURE_ARROW_RIGHT = 0x0000f03b;
enum GESTURE_DOUBLE_ARROW_UP = 0x0000f03c;
enum GESTURE_DOUBLE_ARROW_DOWN = 0x0000f03d;
enum GESTURE_DOUBLE_ARROW_LEFT = 0x0000f03e;
enum GESTURE_DOUBLE_ARROW_RIGHT = 0x0000f03f;
enum GESTURE_UP_ARROW_LEFT = 0x0000f040;
enum GESTURE_UP_ARROW_RIGHT = 0x0000f041;
enum GESTURE_DOWN_ARROW_LEFT = 0x0000f042;
enum GESTURE_DOWN_ARROW_RIGHT = 0x0000f043;
enum GESTURE_LEFT_ARROW_UP = 0x0000f044;
enum GESTURE_LEFT_ARROW_DOWN = 0x0000f045;
enum GESTURE_RIGHT_ARROW_UP = 0x0000f046;
enum GESTURE_RIGHT_ARROW_DOWN = 0x0000f047;
enum GESTURE_UP = 0x0000f058;
enum GESTURE_DOWN = 0x0000f059;
enum GESTURE_LEFT = 0x0000f05a;
enum GESTURE_RIGHT = 0x0000f05b;
enum GESTURE_DIAGONAL_LEFTUP = 0x0000f05c;
enum GESTURE_DIAGONAL_RIGHTUP = 0x0000f05d;
enum GESTURE_DIAGONAL_LEFTDOWN = 0x0000f05e;
enum GESTURE_DIAGONAL_RIGHTDOWN = 0x0000f05f;
enum GESTURE_UP_DOWN = 0x0000f060;
enum GESTURE_DOWN_UP = 0x0000f061;
enum GESTURE_LEFT_RIGHT = 0x0000f062;
enum GESTURE_RIGHT_LEFT = 0x0000f063;
enum GESTURE_UP_LEFT_LONG = 0x0000f064;
enum GESTURE_UP_RIGHT_LONG = 0x0000f065;
enum GESTURE_DOWN_LEFT_LONG = 0x0000f066;
enum GESTURE_DOWN_RIGHT_LONG = 0x0000f067;
enum GESTURE_UP_LEFT = 0x0000f068;
enum GESTURE_UP_RIGHT = 0x0000f069;
enum GESTURE_DOWN_LEFT = 0x0000f06a;
enum GESTURE_DOWN_RIGHT = 0x0000f06b;
enum GESTURE_LEFT_UP = 0x0000f06c;
enum GESTURE_LEFT_DOWN = 0x0000f06d;
enum GESTURE_RIGHT_UP = 0x0000f06e;
enum GESTURE_RIGHT_DOWN = 0x0000f06f;
enum GESTURE_LETTER_A = 0x0000f080;
enum GESTURE_LETTER_B = 0x0000f081;
enum GESTURE_LETTER_C = 0x0000f082;
enum GESTURE_LETTER_D = 0x0000f083;
enum GESTURE_LETTER_E = 0x0000f084;
enum GESTURE_LETTER_F = 0x0000f085;
enum GESTURE_LETTER_G = 0x0000f086;
enum GESTURE_LETTER_H = 0x0000f087;
enum GESTURE_LETTER_I = 0x0000f088;
enum GESTURE_LETTER_J = 0x0000f089;
enum GESTURE_LETTER_K = 0x0000f08a;
enum GESTURE_LETTER_L = 0x0000f08b;
enum GESTURE_LETTER_M = 0x0000f08c;
enum GESTURE_LETTER_N = 0x0000f08d;
enum GESTURE_LETTER_O = 0x0000f08e;
enum GESTURE_LETTER_P = 0x0000f08f;
enum GESTURE_LETTER_Q = 0x0000f090;
enum GESTURE_LETTER_R = 0x0000f091;
enum GESTURE_LETTER_S = 0x0000f092;
enum GESTURE_LETTER_T = 0x0000f093;
enum GESTURE_LETTER_U = 0x0000f094;
enum GESTURE_LETTER_V = 0x0000f095;
enum GESTURE_LETTER_W = 0x0000f096;
enum GESTURE_LETTER_X = 0x0000f097;
enum GESTURE_LETTER_Y = 0x0000f098;
enum GESTURE_LETTER_Z = 0x0000f099;
enum GESTURE_DIGIT_0 = 0x0000f09a;
enum GESTURE_DIGIT_1 = 0x0000f09b;
enum GESTURE_DIGIT_2 = 0x0000f09c;
enum GESTURE_DIGIT_3 = 0x0000f09d;
enum GESTURE_DIGIT_4 = 0x0000f09e;
enum GESTURE_DIGIT_5 = 0x0000f09f;
enum GESTURE_DIGIT_6 = 0x0000f0a0;
enum GESTURE_DIGIT_7 = 0x0000f0a1;
enum GESTURE_DIGIT_8 = 0x0000f0a2;
enum GESTURE_DIGIT_9 = 0x0000f0a3;
enum GESTURE_EXCLAMATION = 0x0000f0a4;
enum GESTURE_QUESTION = 0x0000f0a5;
enum GESTURE_SHARP = 0x0000f0a6;
enum GESTURE_DOLLAR = 0x0000f0a7;
enum GESTURE_ASTERISK = 0x0000f0a8;
enum GESTURE_PLUS = 0x0000f0a9;
enum GESTURE_DOUBLE_UP = 0x0000f0b8;
enum GESTURE_DOUBLE_DOWN = 0x0000f0b9;
enum GESTURE_DOUBLE_LEFT = 0x0000f0ba;
enum GESTURE_DOUBLE_RIGHT = 0x0000f0bb;
enum GESTURE_TRIPLE_UP = 0x0000f0bc;
enum GESTURE_TRIPLE_DOWN = 0x0000f0bd;
enum GESTURE_TRIPLE_LEFT = 0x0000f0be;
enum GESTURE_TRIPLE_RIGHT = 0x0000f0bf;
enum GESTURE_BRACKET_OVER = 0x0000f0e4;
enum GESTURE_BRACKET_UNDER = 0x0000f0e5;
enum GESTURE_BRACKET_LEFT = 0x0000f0e6;
enum GESTURE_BRACKET_RIGHT = 0x0000f0e7;
enum GESTURE_BRACE_OVER = 0x0000f0e8;
enum GESTURE_BRACE_UNDER = 0x0000f0e9;
enum GESTURE_BRACE_LEFT = 0x0000f0ea;
enum GESTURE_BRACE_RIGHT = 0x0000f0eb;
enum GESTURE_TAP = 0x0000f0f0;
enum GESTURE_DOUBLE_TAP = 0x0000f0f1;
enum GESTURE_TRIPLE_TAP = 0x0000f0f2;
enum GESTURE_QUAD_TAP = 0x0000f0f3;
enum FACILITY_INK = 0x00000028;
enum GUID_PACKETPROPERTY_GUID_X = GUID(0x598a6a8f, 0x52c0, 0x4ba0, [0x93, 0xaf, 0xaf, 0x35, 0x74, 0x11, 0xa5, 0x61]);
enum GUID_PACKETPROPERTY_GUID_Y = GUID(0xb53f9f75, 0x4e0, 0x4498, [0xa7, 0xee, 0xc3, 0xd, 0xbb, 0x5a, 0x90, 0x11]);
enum GUID_PACKETPROPERTY_GUID_Z = GUID(0x735adb30, 0xebb, 0x4788, [0xa0, 0xe4, 0xf, 0x31, 0x64, 0x90, 0x5, 0x5d]);
enum GUID_PACKETPROPERTY_GUID_PACKET_STATUS = GUID(0x6e0e07bf, 0xafe7, 0x4cf7, [0x87, 0xd1, 0xaf, 0x64, 0x46, 0x20, 0x84, 0x18]);
enum GUID_PACKETPROPERTY_GUID_TIMER_TICK = GUID(0x436510c5, 0xfed3, 0x45d1, [0x8b, 0x76, 0x71, 0xd3, 0xea, 0x7a, 0x82, 0x9d]);
enum GUID_PACKETPROPERTY_GUID_SERIAL_NUMBER = GUID(0x78a81b56, 0x935, 0x4493, [0xba, 0xae, 0x0, 0x54, 0x1a, 0x8a, 0x16, 0xc4]);
enum GUID_PACKETPROPERTY_GUID_NORMAL_PRESSURE = GUID(0x7307502d, 0xf9f4, 0x4e18, [0xb3, 0xf2, 0x2c, 0xe1, 0xb1, 0xa3, 0x61, 0xc]);
enum GUID_PACKETPROPERTY_GUID_TANGENT_PRESSURE = GUID(0x6da4488b, 0x5244, 0x41ec, [0x90, 0x5b, 0x32, 0xd8, 0x9a, 0xb8, 0x8, 0x9]);
enum GUID_PACKETPROPERTY_GUID_BUTTON_PRESSURE = GUID(0x8b7fefc4, 0x96aa, 0x4bfe, [0xac, 0x26, 0x8a, 0x5f, 0xb, 0xe0, 0x7b, 0xf5]);
enum GUID_PACKETPROPERTY_GUID_X_TILT_ORIENTATION = GUID(0xa8d07b3a, 0x8bf0, 0x40b0, [0x95, 0xa9, 0xb8, 0xa, 0x6b, 0xb7, 0x87, 0xbf]);
enum GUID_PACKETPROPERTY_GUID_Y_TILT_ORIENTATION = GUID(0xe932389, 0x1d77, 0x43af, [0xac, 0x0, 0x5b, 0x95, 0xd, 0x6d, 0x4b, 0x2d]);
enum GUID_PACKETPROPERTY_GUID_AZIMUTH_ORIENTATION = GUID(0x29123b4, 0x8828, 0x410b, [0xb2, 0x50, 0xa0, 0x53, 0x65, 0x95, 0xe5, 0xdc]);
enum GUID_PACKETPROPERTY_GUID_ALTITUDE_ORIENTATION = GUID(0x82dec5c7, 0xf6ba, 0x4906, [0x89, 0x4f, 0x66, 0xd6, 0x8d, 0xfc, 0x45, 0x6c]);
enum GUID_PACKETPROPERTY_GUID_TWIST_ORIENTATION = GUID(0xd324960, 0x13b2, 0x41e4, [0xac, 0xe6, 0x7a, 0xe9, 0xd4, 0x3d, 0x2d, 0x3b]);
enum GUID_PACKETPROPERTY_GUID_PITCH_ROTATION = GUID(0x7f7e57b7, 0xbe37, 0x4be1, [0xa3, 0x56, 0x7a, 0x84, 0x16, 0xe, 0x18, 0x93]);
enum GUID_PACKETPROPERTY_GUID_ROLL_ROTATION = GUID(0x5d5d5e56, 0x6ba9, 0x4c5b, [0x9f, 0xb0, 0x85, 0x1c, 0x91, 0x71, 0x4e, 0x56]);
enum GUID_PACKETPROPERTY_GUID_YAW_ROTATION = GUID(0x6a849980, 0x7c3a, 0x45b7, [0xaa, 0x82, 0x90, 0xa2, 0x62, 0x95, 0xe, 0x89]);
enum GUID_PACKETPROPERTY_GUID_WIDTH = GUID(0xbaabe94d, 0x2712, 0x48f5, [0xbe, 0x9d, 0x8f, 0x8b, 0x5e, 0xa0, 0x71, 0x1a]);
enum GUID_PACKETPROPERTY_GUID_HEIGHT = GUID(0xe61858d2, 0xe447, 0x4218, [0x9d, 0x3f, 0x18, 0x86, 0x5c, 0x20, 0x3d, 0xf4]);
enum GUID_PACKETPROPERTY_GUID_FINGERCONTACTCONFIDENCE = GUID(0xe706c804, 0x57f0, 0x4f00, [0x8a, 0xc, 0x85, 0x3d, 0x57, 0x78, 0x9b, 0xe9]);
enum GUID_PACKETPROPERTY_GUID_DEVICE_CONTACT_ID = GUID(0x2585b91, 0x49b, 0x4750, [0x96, 0x15, 0xdf, 0x89, 0x48, 0xab, 0x3c, 0x9c]);
enum InkMinTransparencyValue = 0x00000000;
enum InkMaxTransparencyValue = 0x000000ff;
enum InkCollectorClipInkToMargin = 0x00000000;
enum InkCollectorDefaultMargin = 0xffffffff80000000;
enum GUID_GESTURE_DATA = GUID(0x41e4ec0f, 0x26aa, 0x455a, [0x9a, 0xa5, 0x2c, 0xd3, 0x6c, 0xf6, 0x3f, 0xb9]);
enum GUID_DYNAMIC_RENDERER_CACHED_DATA = GUID(0xbf531b92, 0x25bf, 0x4a95, [0x89, 0xad, 0xe, 0x47, 0x6b, 0x34, 0xb4, 0xf5]);
alias HRECOALT = void*;
alias HRECOCONTEXT = void*;
alias HRECOGNIZER = void*;
alias HRECOLATTICE = void*;
alias HRECOWORDLIST = void*;
enum CLSID_InkDisp = GUID(0x937c1a34, 0x151d, 0x4610, [0x9c, 0xa6, 0xa8, 0xcc, 0x9b, 0xdb, 0x5d, 0x83]);
struct InkDisp
{
}
enum CLSID_InkOverlay = GUID(0x65d00646, 0xcde3, 0x4a88, [0x91, 0x63, 0x67, 0x69, 0xf0, 0xf1, 0xa9, 0x7d]);
struct InkOverlay
{
}
enum CLSID_InkPicture = GUID(0x4a1e553, 0xfe36, 0x4fde, [0x86, 0x5e, 0x34, 0x41, 0x94, 0xe6, 0x94, 0x24]);
struct InkPicture
{
}
enum CLSID_InkCollector = GUID(0x43fb1553, 0xad74, 0x4ee8, [0x88, 0xe4, 0x3e, 0x6d, 0xaa, 0xc9, 0x15, 0xdb]);
struct InkCollector
{
}
enum CLSID_InkDrawingAttributes = GUID(0xd8bf32a2, 0x5a5, 0x44c3, [0xb3, 0xaa, 0x5e, 0x80, 0xac, 0x7d, 0x25, 0x76]);
struct InkDrawingAttributes
{
}
enum CLSID_InkRectangle = GUID(0x43b07326, 0xaae0, 0x4b62, [0xa8, 0x3d, 0x5f, 0xd7, 0x68, 0xb7, 0x35, 0x3c]);
struct InkRectangle
{
}
enum CLSID_InkRenderer = GUID(0x9c1cc6e4, 0xd7eb, 0x4eeb, [0x90, 0x91, 0x15, 0xa7, 0xc8, 0x79, 0x1e, 0xd9]);
struct InkRenderer
{
}
enum CLSID_InkTransform = GUID(0xe3d5d93c, 0x1663, 0x4a78, [0xa1, 0xa7, 0x22, 0x37, 0x5d, 0xfe, 0xba, 0xee]);
struct InkTransform
{
}
enum CLSID_InkRecognizers = GUID(0x9fd4e808, 0xf6e6, 0x4e65, [0x98, 0xd3, 0xaa, 0x39, 0x5, 0x4c, 0x12, 0x55]);
struct InkRecognizers
{
}
enum CLSID_InkRecognizerContext = GUID(0xaac46a37, 0x9229, 0x4fc0, [0x8c, 0xce, 0x44, 0x97, 0x56, 0x9b, 0xf4, 0xd1]);
struct InkRecognizerContext
{
}
enum CLSID_InkRecognizerGuide = GUID(0x8770d941, 0xa63a, 0x4671, [0xa3, 0x75, 0x28, 0x55, 0xa1, 0x8e, 0xba, 0x73]);
struct InkRecognizerGuide
{
}
enum CLSID_InkTablets = GUID(0x6e4fcb12, 0x510a, 0x4d40, [0x93, 0x4, 0x1d, 0xa1, 0xa, 0xe9, 0x14, 0x7c]);
struct InkTablets
{
}
enum CLSID_InkWordList = GUID(0x9de85094, 0xf71f, 0x44f1, [0x84, 0x71, 0x15, 0xa2, 0xfa, 0x76, 0xfc, 0xf3]);
struct InkWordList
{
}
enum CLSID_InkStrokes = GUID(0x48f491bc, 0x240e, 0x4860, [0xb0, 0x79, 0xa1, 0xe9, 0x4d, 0x3d, 0x2c, 0x86]);
struct InkStrokes
{
}
enum CLSID_Ink = GUID(0x13de4a42, 0x8d21, 0x4c8e, [0xbf, 0x9c, 0x8f, 0x69, 0xcb, 0x6, 0x8f, 0xca]);
struct Ink
{
}
enum CLSID_SketchInk = GUID(0xf0291081, 0xe87c, 0x4e07, [0x97, 0xda, 0xa0, 0xa0, 0x37, 0x61, 0xe5, 0x86]);
struct SketchInk
{
}
alias PROPERTY_UNITS = int;
enum : int
{
    PROPERTY_UNITS_DEFAULT     = 0x00000000,
    PROPERTY_UNITS_INCHES      = 0x00000001,
    PROPERTY_UNITS_CENTIMETERS = 0x00000002,
    PROPERTY_UNITS_DEGREES     = 0x00000003,
    PROPERTY_UNITS_RADIANS     = 0x00000004,
    PROPERTY_UNITS_SECONDS     = 0x00000005,
    PROPERTY_UNITS_POUNDS      = 0x00000006,
    PROPERTY_UNITS_GRAMS       = 0x00000007,
    PROPERTY_UNITS_SILINEAR    = 0x00000008,
    PROPERTY_UNITS_SIROTATION  = 0x00000009,
    PROPERTY_UNITS_ENGLINEAR   = 0x0000000a,
    PROPERTY_UNITS_ENGROTATION = 0x0000000b,
    PROPERTY_UNITS_SLUGS       = 0x0000000c,
    PROPERTY_UNITS_KELVIN      = 0x0000000d,
    PROPERTY_UNITS_FAHRENHEIT  = 0x0000000e,
    PROPERTY_UNITS_AMPERE      = 0x0000000f,
    PROPERTY_UNITS_CANDELA     = 0x00000010,
}

struct SYSTEM_EVENT_DATA
{
    ubyte bModifier;
    wchar wKey;
    int xPos;
    int yPos;
    ubyte bCursorMode;
    uint dwButtonState;
}
struct STROKE_RANGE
{
    uint iStrokeBegin;
    uint iStrokeEnd;
}
struct PROPERTY_METRICS
{
    int nLogicalMin;
    int nLogicalMax;
    PROPERTY_UNITS Units;
    float fResolution;
}
struct PACKET_PROPERTY
{
    GUID guid;
    PROPERTY_METRICS PropertyMetrics;
}
struct PACKET_DESCRIPTION
{
    uint cbPacketSize;
    uint cPacketProperties;
    PACKET_PROPERTY* pPacketProperties;
    uint cButtons;
    GUID* pguidButtons;
}
alias enumINKMETRIC_FLAGS = int;
enum : int
{
    IMF_FONT_SELECTED_IN_HDC = 0x00000001,
    IMF_ITALIC               = 0x00000002,
    IMF_BOLD                 = 0x00000004,
}

alias enumGetCandidateFlags = int;
enum : int
{
    TCF_ALLOW_RECOGNITION = 0x00000001,
    TCF_FORCE_RECOGNITION = 0x00000002,
}

struct INKMETRIC
{
    int iHeight;
    int iFontAscent;
    int iFontDescent;
    uint dwFlags;
    uint color;
}
alias InkSelectionConstants = int;
enum : int
{
    ISC_FirstElement = 0x00000000,
    ISC_AllElements  = 0xffffffff,
}

alias InkBoundingBoxMode = int;
enum : int
{
    IBBM_Default    = 0x00000000,
    IBBM_NoCurveFit = 0x00000001,
    IBBM_CurveFit   = 0x00000002,
    IBBM_PointsOnly = 0x00000003,
    IBBM_Union      = 0x00000004,
}

alias InkExtractFlags = int;
enum : int
{
    IEF_CopyFromOriginal   = 0x00000000,
    IEF_RemoveFromOriginal = 0x00000001,
    IEF_Default            = 0x00000001,
}

alias InkPersistenceFormat = int;
enum : int
{
    IPF_InkSerializedFormat       = 0x00000000,
    IPF_Base64InkSerializedFormat = 0x00000001,
    IPF_GIF                       = 0x00000002,
    IPF_Base64GIF                 = 0x00000003,
}

alias InkPersistenceCompressionMode = int;
enum : int
{
    IPCM_Default            = 0x00000000,
    IPCM_MaximumCompression = 0x00000001,
    IPCM_NoCompression      = 0x00000002,
}

alias InkPenTip = int;
enum : int
{
    IPT_Ball      = 0x00000000,
    IPT_Rectangle = 0x00000001,
}

alias InkRasterOperation = int;
enum : int
{
    IRO_Black       = 0x00000001,
    IRO_NotMergePen = 0x00000002,
    IRO_MaskNotPen  = 0x00000003,
    IRO_NotCopyPen  = 0x00000004,
    IRO_MaskPenNot  = 0x00000005,
    IRO_Not         = 0x00000006,
    IRO_XOrPen      = 0x00000007,
    IRO_NotMaskPen  = 0x00000008,
    IRO_MaskPen     = 0x00000009,
    IRO_NotXOrPen   = 0x0000000a,
    IRO_NoOperation = 0x0000000b,
    IRO_MergeNotPen = 0x0000000c,
    IRO_CopyPen     = 0x0000000d,
    IRO_MergePenNot = 0x0000000e,
    IRO_MergePen    = 0x0000000f,
    IRO_White       = 0x00000010,
}

alias InkMousePointer = int;
enum : int
{
    IMP_Default        = 0x00000000,
    IMP_Arrow          = 0x00000001,
    IMP_Crosshair      = 0x00000002,
    IMP_Ibeam          = 0x00000003,
    IMP_SizeNESW       = 0x00000004,
    IMP_SizeNS         = 0x00000005,
    IMP_SizeNWSE       = 0x00000006,
    IMP_SizeWE         = 0x00000007,
    IMP_UpArrow        = 0x00000008,
    IMP_Hourglass      = 0x00000009,
    IMP_NoDrop         = 0x0000000a,
    IMP_ArrowHourglass = 0x0000000b,
    IMP_ArrowQuestion  = 0x0000000c,
    IMP_SizeAll        = 0x0000000d,
    IMP_Hand           = 0x0000000e,
    IMP_Custom         = 0x00000063,
}

alias InkClipboardModes = int;
enum : int
{
    ICB_Copy        = 0x00000000,
    ICB_Cut         = 0x00000001,
    ICB_ExtractOnly = 0x00000030,
    ICB_DelayedCopy = 0x00000020,
    ICB_Default     = 0x00000000,
}

alias InkClipboardFormats = int;
enum : int
{
    ICF_None                = 0x00000000,
    ICF_InkSerializedFormat = 0x00000001,
    ICF_SketchInk           = 0x00000002,
    ICF_TextInk             = 0x00000006,
    ICF_EnhancedMetafile    = 0x00000008,
    ICF_Metafile            = 0x00000020,
    ICF_Bitmap              = 0x00000040,
    ICF_PasteMask           = 0x00000007,
    ICF_CopyMask            = 0x0000007f,
    ICF_Default             = 0x0000007f,
}

alias SelectionHitResult = int;
enum : int
{
    SHR_None      = 0x00000000,
    SHR_NW        = 0x00000001,
    SHR_SE        = 0x00000002,
    SHR_NE        = 0x00000003,
    SHR_SW        = 0x00000004,
    SHR_E         = 0x00000005,
    SHR_W         = 0x00000006,
    SHR_N         = 0x00000007,
    SHR_S         = 0x00000008,
    SHR_Selection = 0x00000009,
}

alias InkRecognitionStatus = int;
enum : int
{
    IRS_NoError                     = 0x00000000,
    IRS_Interrupted                 = 0x00000001,
    IRS_ProcessFailed               = 0x00000002,
    IRS_InkAddedFailed              = 0x00000004,
    IRS_SetAutoCompletionModeFailed = 0x00000008,
    IRS_SetStrokesFailed            = 0x00000010,
    IRS_SetGuideFailed              = 0x00000020,
    IRS_SetFlagsFailed              = 0x00000040,
    IRS_SetFactoidFailed            = 0x00000080,
    IRS_SetPrefixSuffixFailed       = 0x00000100,
    IRS_SetWordListFailed           = 0x00000200,
}

alias DISPID_InkRectangle = int;
enum : int
{
    DISPID_IRTop          = 0x00000001,
    DISPID_IRLeft         = 0x00000002,
    DISPID_IRBottom       = 0x00000003,
    DISPID_IRRight        = 0x00000004,
    DISPID_IRGetRectangle = 0x00000005,
    DISPID_IRSetRectangle = 0x00000006,
    DISPID_IRData         = 0x00000007,
}

alias DISPID_InkExtendedProperty = int;
enum : int
{
    DISPID_IEPGuid = 0x00000001,
    DISPID_IEPData = 0x00000002,
}

alias DISPID_InkExtendedProperties = int;
enum : int
{
    DISPID_IEPs_NewEnum          = 0xfffffffc,
    DISPID_IEPsItem              = 0x00000000,
    DISPID_IEPsCount             = 0x00000001,
    DISPID_IEPsAdd               = 0x00000002,
    DISPID_IEPsRemove            = 0x00000003,
    DISPID_IEPsClear             = 0x00000004,
    DISPID_IEPsDoesPropertyExist = 0x00000005,
}

alias DISPID_InkDrawingAttributes = int;
enum : int
{
    DISPID_DAHeight             = 0x00000001,
    DISPID_DAColor              = 0x00000002,
    DISPID_DAWidth              = 0x00000003,
    DISPID_DAFitToCurve         = 0x00000004,
    DISPID_DAIgnorePressure     = 0x00000005,
    DISPID_DAAntiAliased        = 0x00000006,
    DISPID_DATransparency       = 0x00000007,
    DISPID_DARasterOperation    = 0x00000008,
    DISPID_DAPenTip             = 0x00000009,
    DISPID_DAClone              = 0x0000000a,
    DISPID_DAExtendedProperties = 0x0000000b,
}

alias DISPID_InkTransform = int;
enum : int
{
    DISPID_ITReset        = 0x00000001,
    DISPID_ITTranslate    = 0x00000002,
    DISPID_ITRotate       = 0x00000003,
    DISPID_ITReflect      = 0x00000004,
    DISPID_ITShear        = 0x00000005,
    DISPID_ITScale        = 0x00000006,
    DISPID_ITeM11         = 0x00000007,
    DISPID_ITeM12         = 0x00000008,
    DISPID_ITeM21         = 0x00000009,
    DISPID_ITeM22         = 0x0000000a,
    DISPID_ITeDx          = 0x0000000b,
    DISPID_ITeDy          = 0x0000000c,
    DISPID_ITGetTransform = 0x0000000d,
    DISPID_ITSetTransform = 0x0000000e,
    DISPID_ITData         = 0x0000000f,
}

alias InkApplicationGesture = int;
enum : int
{
    IAG_AllGestures     = 0x00000000,
    IAG_NoGesture       = 0x0000f000,
    IAG_Scratchout      = 0x0000f001,
    IAG_Triangle        = 0x0000f002,
    IAG_Square          = 0x0000f003,
    IAG_Star            = 0x0000f004,
    IAG_Check           = 0x0000f005,
    IAG_Curlicue        = 0x0000f010,
    IAG_DoubleCurlicue  = 0x0000f011,
    IAG_Circle          = 0x0000f020,
    IAG_DoubleCircle    = 0x0000f021,
    IAG_SemiCircleLeft  = 0x0000f028,
    IAG_SemiCircleRight = 0x0000f029,
    IAG_ChevronUp       = 0x0000f030,
    IAG_ChevronDown     = 0x0000f031,
    IAG_ChevronLeft     = 0x0000f032,
    IAG_ChevronRight    = 0x0000f033,
    IAG_ArrowUp         = 0x0000f038,
    IAG_ArrowDown       = 0x0000f039,
    IAG_ArrowLeft       = 0x0000f03a,
    IAG_ArrowRight      = 0x0000f03b,
    IAG_Up              = 0x0000f058,
    IAG_Down            = 0x0000f059,
    IAG_Left            = 0x0000f05a,
    IAG_Right           = 0x0000f05b,
    IAG_UpDown          = 0x0000f060,
    IAG_DownUp          = 0x0000f061,
    IAG_LeftRight       = 0x0000f062,
    IAG_RightLeft       = 0x0000f063,
    IAG_UpLeftLong      = 0x0000f064,
    IAG_UpRightLong     = 0x0000f065,
    IAG_DownLeftLong    = 0x0000f066,
    IAG_DownRightLong   = 0x0000f067,
    IAG_UpLeft          = 0x0000f068,
    IAG_UpRight         = 0x0000f069,
    IAG_DownLeft        = 0x0000f06a,
    IAG_DownRight       = 0x0000f06b,
    IAG_LeftUp          = 0x0000f06c,
    IAG_LeftDown        = 0x0000f06d,
    IAG_RightUp         = 0x0000f06e,
    IAG_RightDown       = 0x0000f06f,
    IAG_Exclamation     = 0x0000f0a4,
    IAG_Tap             = 0x0000f0f0,
    IAG_DoubleTap       = 0x0000f0f1,
}

alias InkSystemGesture = int;
enum : int
{
    ISG_Tap        = 0x00000010,
    ISG_DoubleTap  = 0x00000011,
    ISG_RightTap   = 0x00000012,
    ISG_Drag       = 0x00000013,
    ISG_RightDrag  = 0x00000014,
    ISG_HoldEnter  = 0x00000015,
    ISG_HoldLeave  = 0x00000016,
    ISG_HoverEnter = 0x00000017,
    ISG_HoverLeave = 0x00000018,
    ISG_Flick      = 0x0000001f,
}

alias InkRecognitionConfidence = int;
enum : int
{
    IRC_Strong       = 0x00000000,
    IRC_Intermediate = 0x00000001,
    IRC_Poor         = 0x00000002,
}

alias DISPID_InkGesture = int;
enum : int
{
    DISPID_IGId          = 0x00000000,
    DISPID_IGGetHotPoint = 0x00000001,
    DISPID_IGConfidence  = 0x00000002,
}

alias DISPID_InkCursor = int;
enum : int
{
    DISPID_ICsrName              = 0x00000000,
    DISPID_ICsrId                = 0x00000001,
    DISPID_ICsrDrawingAttributes = 0x00000002,
    DISPID_ICsrButtons           = 0x00000003,
    DISPID_ICsrInverted          = 0x00000004,
    DISPID_ICsrTablet            = 0x00000005,
}

alias DISPID_InkCursors = int;
enum : int
{
    DISPID_ICs_NewEnum = 0xfffffffc,
    DISPID_ICsItem     = 0x00000000,
    DISPID_ICsCount    = 0x00000001,
}

alias InkCursorButtonState = int;
enum : int
{
    ICBS_Unavailable = 0x00000000,
    ICBS_Up          = 0x00000001,
    ICBS_Down        = 0x00000002,
}

alias DISPID_InkCursorButton = int;
enum : int
{
    DISPID_ICBName  = 0x00000000,
    DISPID_ICBId    = 0x00000001,
    DISPID_ICBState = 0x00000002,
}

alias DISPID_InkCursorButtons = int;
enum : int
{
    DISPID_ICBs_NewEnum = 0xfffffffc,
    DISPID_ICBsItem     = 0x00000000,
    DISPID_ICBsCount    = 0x00000001,
}

alias TabletHardwareCapabilities = int;
enum : int
{
    THWC_Integrated             = 0x00000001,
    THWC_CursorMustTouch        = 0x00000002,
    THWC_HardProximity          = 0x00000004,
    THWC_CursorsHavePhysicalIds = 0x00000008,
}

alias TabletPropertyMetricUnit = int;
enum : int
{
    TPMU_Default     = 0x00000000,
    TPMU_Inches      = 0x00000001,
    TPMU_Centimeters = 0x00000002,
    TPMU_Degrees     = 0x00000003,
    TPMU_Radians     = 0x00000004,
    TPMU_Seconds     = 0x00000005,
    TPMU_Pounds      = 0x00000006,
    TPMU_Grams       = 0x00000007,
}

alias DISPID_InkTablet = int;
enum : int
{
    DISPID_ITName                      = 0x00000000,
    DISPID_ITPlugAndPlayId             = 0x00000001,
    DISPID_ITPropertyMetrics           = 0x00000002,
    DISPID_ITIsPacketPropertySupported = 0x00000003,
    DISPID_ITMaximumInputRectangle     = 0x00000004,
    DISPID_ITHardwareCapabilities      = 0x00000005,
}

alias TabletDeviceKind = int;
enum : int
{
    TDK_Mouse = 0x00000000,
    TDK_Pen   = 0x00000001,
    TDK_Touch = 0x00000002,
}

alias DISPID_InkTablet2 = int;
enum : int
{
    DISPID_IT2DeviceKind = 0x00000000,
}

alias DISPID_InkTablet3 = int;
enum : int
{
    DISPID_IT3IsMultiTouch   = 0x00000000,
    DISPID_IT3MaximumCursors = 0x00000001,
}

alias DISPID_InkTablets = int;
enum : int
{
    DISPID_ITs_NewEnum                  = 0xfffffffc,
    DISPID_ITsItem                      = 0x00000000,
    DISPID_ITsDefaultTablet             = 0x00000001,
    DISPID_ITsCount                     = 0x00000002,
    DISPID_ITsIsPacketPropertySupported = 0x00000003,
}

alias DISPID_InkStrokeDisp = int;
enum : int
{
    DISPID_ISDInkIndex                            = 0x00000001,
    DISPID_ISDID                                  = 0x00000002,
    DISPID_ISDGetBoundingBox                      = 0x00000003,
    DISPID_ISDDrawingAttributes                   = 0x00000004,
    DISPID_ISDFindIntersections                   = 0x00000005,
    DISPID_ISDGetRectangleIntersections           = 0x00000006,
    DISPID_ISDClip                                = 0x00000007,
    DISPID_ISDHitTestCircle                       = 0x00000008,
    DISPID_ISDNearestPoint                        = 0x00000009,
    DISPID_ISDSplit                               = 0x0000000a,
    DISPID_ISDExtendedProperties                  = 0x0000000b,
    DISPID_ISDInk                                 = 0x0000000c,
    DISPID_ISDBezierPoints                        = 0x0000000d,
    DISPID_ISDPolylineCusps                       = 0x0000000e,
    DISPID_ISDBezierCusps                         = 0x0000000f,
    DISPID_ISDSelfIntersections                   = 0x00000010,
    DISPID_ISDPacketCount                         = 0x00000011,
    DISPID_ISDPacketSize                          = 0x00000012,
    DISPID_ISDPacketDescription                   = 0x00000013,
    DISPID_ISDDeleted                             = 0x00000014,
    DISPID_ISDGetPacketDescriptionPropertyMetrics = 0x00000015,
    DISPID_ISDGetPoints                           = 0x00000016,
    DISPID_ISDSetPoints                           = 0x00000017,
    DISPID_ISDGetPacketData                       = 0x00000018,
    DISPID_ISDGetPacketValuesByProperty           = 0x00000019,
    DISPID_ISDSetPacketValuesByProperty           = 0x0000001a,
    DISPID_ISDGetFlattenedBezierPoints            = 0x0000001b,
    DISPID_ISDScaleToRectangle                    = 0x0000001c,
    DISPID_ISDTransform                           = 0x0000001d,
    DISPID_ISDMove                                = 0x0000001e,
    DISPID_ISDRotate                              = 0x0000001f,
    DISPID_ISDShear                               = 0x00000020,
    DISPID_ISDScale                               = 0x00000021,
}

alias DISPID_InkStrokes = int;
enum : int
{
    DISPID_ISs_NewEnum                = 0xfffffffc,
    DISPID_ISsItem                    = 0x00000000,
    DISPID_ISsCount                   = 0x00000001,
    DISPID_ISsValid                   = 0x00000002,
    DISPID_ISsInk                     = 0x00000003,
    DISPID_ISsAdd                     = 0x00000004,
    DISPID_ISsAddStrokes              = 0x00000005,
    DISPID_ISsRemove                  = 0x00000006,
    DISPID_ISsRemoveStrokes           = 0x00000007,
    DISPID_ISsToString                = 0x00000008,
    DISPID_ISsModifyDrawingAttributes = 0x00000009,
    DISPID_ISsGetBoundingBox          = 0x0000000a,
    DISPID_ISsScaleToRectangle        = 0x0000000b,
    DISPID_ISsTransform               = 0x0000000c,
    DISPID_ISsMove                    = 0x0000000d,
    DISPID_ISsRotate                  = 0x0000000e,
    DISPID_ISsShear                   = 0x0000000f,
    DISPID_ISsScale                   = 0x00000010,
    DISPID_ISsClip                    = 0x00000011,
    DISPID_ISsRecognitionResult       = 0x00000012,
    DISPID_ISsRemoveRecognitionResult = 0x00000013,
}

alias DISPID_InkCustomStrokes = int;
enum : int
{
    DISPID_ICSs_NewEnum = 0xfffffffc,
    DISPID_ICSsItem     = 0x00000000,
    DISPID_ICSsCount    = 0x00000001,
    DISPID_ICSsAdd      = 0x00000002,
    DISPID_ICSsRemove   = 0x00000003,
    DISPID_ICSsClear    = 0x00000004,
}

alias DISPID_StrokeEvent = int;
enum : int
{
    DISPID_SEStrokesAdded   = 0x00000001,
    DISPID_SEStrokesRemoved = 0x00000002,
}

alias DISPID_Ink = int;
enum : int
{
    DISPID_IStrokes                    = 0x00000001,
    DISPID_IExtendedProperties         = 0x00000002,
    DISPID_IGetBoundingBox             = 0x00000003,
    DISPID_IDeleteStrokes              = 0x00000004,
    DISPID_IDeleteStroke               = 0x00000005,
    DISPID_IExtractStrokes             = 0x00000006,
    DISPID_IExtractWithRectangle       = 0x00000007,
    DISPID_IDirty                      = 0x00000008,
    DISPID_ICustomStrokes              = 0x00000009,
    DISPID_IClone                      = 0x0000000a,
    DISPID_IHitTestCircle              = 0x0000000b,
    DISPID_IHitTestWithRectangle       = 0x0000000c,
    DISPID_IHitTestWithLasso           = 0x0000000d,
    DISPID_INearestPoint               = 0x0000000e,
    DISPID_ICreateStrokes              = 0x0000000f,
    DISPID_ICreateStroke               = 0x00000010,
    DISPID_IAddStrokesAtRectangle      = 0x00000011,
    DISPID_IClip                       = 0x00000012,
    DISPID_ISave                       = 0x00000013,
    DISPID_ILoad                       = 0x00000014,
    DISPID_ICreateStrokeFromPoints     = 0x00000015,
    DISPID_IClipboardCopyWithRectangle = 0x00000016,
    DISPID_IClipboardCopy              = 0x00000017,
    DISPID_ICanPaste                   = 0x00000018,
    DISPID_IClipboardPaste             = 0x00000019,
}

alias DISPID_InkEvent = int;
enum : int
{
    DISPID_IEInkAdded   = 0x00000001,
    DISPID_IEInkDeleted = 0x00000002,
}

alias DISPID_InkRenderer = int;
enum : int
{
    DISPID_IRGetViewTransform          = 0x00000001,
    DISPID_IRSetViewTransform          = 0x00000002,
    DISPID_IRGetObjectTransform        = 0x00000003,
    DISPID_IRSetObjectTransform        = 0x00000004,
    DISPID_IRDraw                      = 0x00000005,
    DISPID_IRDrawStroke                = 0x00000006,
    DISPID_IRPixelToInkSpace           = 0x00000007,
    DISPID_IRInkSpaceToPixel           = 0x00000008,
    DISPID_IRPixelToInkSpaceFromPoints = 0x00000009,
    DISPID_IRInkSpaceToPixelFromPoints = 0x0000000a,
    DISPID_IRMeasure                   = 0x0000000b,
    DISPID_IRMeasureStroke             = 0x0000000c,
    DISPID_IRMove                      = 0x0000000d,
    DISPID_IRRotate                    = 0x0000000e,
    DISPID_IRScale                     = 0x0000000f,
}

alias InkCollectorEventInterest = int;
enum : int
{
    ICEI_DefaultEvents    = 0xffffffff,
    ICEI_CursorDown       = 0x00000000,
    ICEI_Stroke           = 0x00000001,
    ICEI_NewPackets       = 0x00000002,
    ICEI_NewInAirPackets  = 0x00000003,
    ICEI_CursorButtonDown = 0x00000004,
    ICEI_CursorButtonUp   = 0x00000005,
    ICEI_CursorInRange    = 0x00000006,
    ICEI_CursorOutOfRange = 0x00000007,
    ICEI_SystemGesture    = 0x00000008,
    ICEI_TabletAdded      = 0x00000009,
    ICEI_TabletRemoved    = 0x0000000a,
    ICEI_MouseDown        = 0x0000000b,
    ICEI_MouseMove        = 0x0000000c,
    ICEI_MouseUp          = 0x0000000d,
    ICEI_MouseWheel       = 0x0000000e,
    ICEI_DblClick         = 0x0000000f,
    ICEI_AllEvents        = 0x00000010,
}

alias InkMouseButton = int;
enum : int
{
    IMF_Left   = 0x00000001,
    IMF_Right  = 0x00000002,
    IMF_Middle = 0x00000004,
}

alias InkShiftKeyModifierFlags = int;
enum : int
{
    IKM_Shift   = 0x00000001,
    IKM_Control = 0x00000002,
    IKM_Alt     = 0x00000004,
}

alias DISPID_InkCollectorEvent = int;
enum : int
{
    DISPID_ICEStroke              = 0x00000001,
    DISPID_ICECursorDown          = 0x00000002,
    DISPID_ICENewPackets          = 0x00000003,
    DISPID_ICENewInAirPackets     = 0x00000004,
    DISPID_ICECursorButtonDown    = 0x00000005,
    DISPID_ICECursorButtonUp      = 0x00000006,
    DISPID_ICECursorInRange       = 0x00000007,
    DISPID_ICECursorOutOfRange    = 0x00000008,
    DISPID_ICESystemGesture       = 0x00000009,
    DISPID_ICEGesture             = 0x0000000a,
    DISPID_ICETabletAdded         = 0x0000000b,
    DISPID_ICETabletRemoved       = 0x0000000c,
    DISPID_IOEPainting            = 0x0000000d,
    DISPID_IOEPainted             = 0x0000000e,
    DISPID_IOESelectionChanging   = 0x0000000f,
    DISPID_IOESelectionChanged    = 0x00000010,
    DISPID_IOESelectionMoving     = 0x00000011,
    DISPID_IOESelectionMoved      = 0x00000012,
    DISPID_IOESelectionResizing   = 0x00000013,
    DISPID_IOESelectionResized    = 0x00000014,
    DISPID_IOEStrokesDeleting     = 0x00000015,
    DISPID_IOEStrokesDeleted      = 0x00000016,
    DISPID_IPEChangeUICues        = 0x00000017,
    DISPID_IPEClick               = 0x00000018,
    DISPID_IPEDblClick            = 0x00000019,
    DISPID_IPEInvalidated         = 0x0000001a,
    DISPID_IPEMouseDown           = 0x0000001b,
    DISPID_IPEMouseEnter          = 0x0000001c,
    DISPID_IPEMouseHover          = 0x0000001d,
    DISPID_IPEMouseLeave          = 0x0000001e,
    DISPID_IPEMouseMove           = 0x0000001f,
    DISPID_IPEMouseUp             = 0x00000020,
    DISPID_IPEMouseWheel          = 0x00000021,
    DISPID_IPESizeModeChanged     = 0x00000022,
    DISPID_IPEStyleChanged        = 0x00000023,
    DISPID_IPESystemColorsChanged = 0x00000024,
    DISPID_IPEKeyDown             = 0x00000025,
    DISPID_IPEKeyPress            = 0x00000026,
    DISPID_IPEKeyUp               = 0x00000027,
    DISPID_IPEResize              = 0x00000028,
    DISPID_IPESizeChanged         = 0x00000029,
}

alias InkOverlayEditingMode = int;
enum : int
{
    IOEM_Ink    = 0x00000000,
    IOEM_Delete = 0x00000001,
    IOEM_Select = 0x00000002,
}

alias InkOverlayAttachMode = int;
enum : int
{
    IOAM_Behind  = 0x00000000,
    IOAM_InFront = 0x00000001,
}

alias InkPictureSizeMode = int;
enum : int
{
    IPSM_AutoSize     = 0x00000000,
    IPSM_CenterImage  = 0x00000001,
    IPSM_Normal       = 0x00000002,
    IPSM_StretchImage = 0x00000003,
}

alias InkOverlayEraserMode = int;
enum : int
{
    IOERM_StrokeErase = 0x00000000,
    IOERM_PointErase  = 0x00000001,
}

alias InkCollectionMode = int;
enum : int
{
    ICM_InkOnly       = 0x00000000,
    ICM_GestureOnly   = 0x00000001,
    ICM_InkAndGesture = 0x00000002,
}

alias DISPID_InkCollector = int;
enum : int
{
    DISPID_ICEnabled                        = 0x00000001,
    DISPID_ICHwnd                           = 0x00000002,
    DISPID_ICPaint                          = 0x00000003,
    DISPID_ICText                           = 0x00000004,
    DISPID_ICDefaultDrawingAttributes       = 0x00000005,
    DISPID_ICRenderer                       = 0x00000006,
    DISPID_ICInk                            = 0x00000007,
    DISPID_ICAutoRedraw                     = 0x00000008,
    DISPID_ICCollectingInk                  = 0x00000009,
    DISPID_ICSetEventInterest               = 0x0000000a,
    DISPID_ICGetEventInterest               = 0x0000000b,
    DISPID_IOEditingMode                    = 0x0000000c,
    DISPID_IOSelection                      = 0x0000000d,
    DISPID_IOAttachMode                     = 0x0000000e,
    DISPID_IOHitTestSelection               = 0x0000000f,
    DISPID_IODraw                           = 0x00000010,
    DISPID_IPPicture                        = 0x00000011,
    DISPID_IPSizeMode                       = 0x00000012,
    DISPID_IPBackColor                      = 0x00000013,
    DISPID_ICCursors                        = 0x00000014,
    DISPID_ICMarginX                        = 0x00000015,
    DISPID_ICMarginY                        = 0x00000016,
    DISPID_ICSetWindowInputRectangle        = 0x00000017,
    DISPID_ICGetWindowInputRectangle        = 0x00000018,
    DISPID_ICTablet                         = 0x00000019,
    DISPID_ICSetAllTabletsMode              = 0x0000001a,
    DISPID_ICSetSingleTabletIntegratedMode  = 0x0000001b,
    DISPID_ICCollectionMode                 = 0x0000001c,
    DISPID_ICSetGestureStatus               = 0x0000001d,
    DISPID_ICGetGestureStatus               = 0x0000001e,
    DISPID_ICDynamicRendering               = 0x0000001f,
    DISPID_ICDesiredPacketDescription       = 0x00000020,
    DISPID_IOEraserMode                     = 0x00000021,
    DISPID_IOEraserWidth                    = 0x00000022,
    DISPID_ICMouseIcon                      = 0x00000023,
    DISPID_ICMousePointer                   = 0x00000024,
    DISPID_IPInkEnabled                     = 0x00000025,
    DISPID_ICSupportHighContrastInk         = 0x00000026,
    DISPID_IOSupportHighContrastSelectionUI = 0x00000027,
}

alias DISPID_InkRecognizer = int;
enum : int
{
    DISPID_RecoClsid                      = 0x00000001,
    DISPID_RecoName                       = 0x00000002,
    DISPID_RecoVendor                     = 0x00000003,
    DISPID_RecoCapabilities               = 0x00000004,
    DISPID_RecoLanguageID                 = 0x00000005,
    DISPID_RecoPreferredPacketDescription = 0x00000006,
    DISPID_RecoCreateRecognizerContext    = 0x00000007,
    DISPID_RecoSupportedProperties        = 0x00000008,
}

alias InkRecognizerCapabilities = int;
enum : int
{
    IRC_DontCare                     = 0x00000001,
    IRC_Object                       = 0x00000002,
    IRC_FreeInput                    = 0x00000004,
    IRC_LinedInput                   = 0x00000008,
    IRC_BoxedInput                   = 0x00000010,
    IRC_CharacterAutoCompletionInput = 0x00000020,
    IRC_RightAndDown                 = 0x00000040,
    IRC_LeftAndDown                  = 0x00000080,
    IRC_DownAndLeft                  = 0x00000100,
    IRC_DownAndRight                 = 0x00000200,
    IRC_ArbitraryAngle               = 0x00000400,
    IRC_Lattice                      = 0x00000800,
    IRC_AdviseInkChange              = 0x00001000,
    IRC_StrokeReorder                = 0x00002000,
    IRC_Personalizable               = 0x00004000,
    IRC_PrefersArbitraryAngle        = 0x00008000,
    IRC_PrefersParagraphBreaking     = 0x00010000,
    IRC_PrefersSegmentation          = 0x00020000,
    IRC_Cursive                      = 0x00040000,
    IRC_TextPrediction               = 0x00080000,
    IRC_Alpha                        = 0x00100000,
    IRC_Beta                         = 0x00200000,
}

alias DISPID_InkRecognizer2 = int;
enum : int
{
    DISPID_RecoId            = 0x00000000,
    DISPID_RecoUnicodeRanges = 0x00000001,
}

alias DISPID_InkRecognizers = int;
enum : int
{
    DISPID_IRecos_NewEnum             = 0xfffffffc,
    DISPID_IRecosItem                 = 0x00000000,
    DISPID_IRecosCount                = 0x00000001,
    DISPID_IRecosGetDefaultRecognizer = 0x00000002,
}

alias InkRecognizerCharacterAutoCompletionMode = int;
enum : int
{
    IRCACM_Full   = 0x00000000,
    IRCACM_Prefix = 0x00000001,
    IRCACM_Random = 0x00000002,
}

alias InkRecognitionModes = int;
enum : int
{
    IRM_None                   = 0x00000000,
    IRM_WordModeOnly           = 0x00000001,
    IRM_Coerce                 = 0x00000002,
    IRM_TopInkBreaksOnly       = 0x00000004,
    IRM_PrefixOk               = 0x00000008,
    IRM_LineMode               = 0x00000010,
    IRM_DisablePersonalization = 0x00000020,
    IRM_AutoSpace              = 0x00000040,
    IRM_Max                    = 0x00000080,
}

alias DISPID_InkRecognitionEvent = int;
enum : int
{
    DISPID_IRERecognitionWithAlternates = 0x00000001,
    DISPID_IRERecognition               = 0x00000002,
}

alias DISPID_InkRecoContext = int;
enum : int
{
    DISPID_IRecoCtx_Strokes                           = 0x00000001,
    DISPID_IRecoCtx_CharacterAutoCompletionMode       = 0x00000002,
    DISPID_IRecoCtx_Factoid                           = 0x00000003,
    DISPID_IRecoCtx_WordList                          = 0x00000004,
    DISPID_IRecoCtx_Recognizer                        = 0x00000005,
    DISPID_IRecoCtx_Guide                             = 0x00000006,
    DISPID_IRecoCtx_Flags                             = 0x00000007,
    DISPID_IRecoCtx_PrefixText                        = 0x00000008,
    DISPID_IRecoCtx_SuffixText                        = 0x00000009,
    DISPID_IRecoCtx_StopRecognition                   = 0x0000000a,
    DISPID_IRecoCtx_Clone                             = 0x0000000b,
    DISPID_IRecoCtx_Recognize                         = 0x0000000c,
    DISPID_IRecoCtx_StopBackgroundRecognition         = 0x0000000d,
    DISPID_IRecoCtx_EndInkInput                       = 0x0000000e,
    DISPID_IRecoCtx_BackgroundRecognize               = 0x0000000f,
    DISPID_IRecoCtx_BackgroundRecognizeWithAlternates = 0x00000010,
    DISPID_IRecoCtx_IsStringSupported                 = 0x00000011,
}

alias DISPID_InkRecoContext2 = int;
enum : int
{
    DISPID_IRecoCtx2_EnabledUnicodeRanges = 0x00000000,
}

alias InkRecognitionAlternatesSelection = int;
enum : int
{
    IRAS_Start        = 0x00000000,
    IRAS_DefaultCount = 0x0000000a,
    IRAS_All          = 0xffffffff,
}

alias DISPID_InkRecognitionResult = int;
enum : int
{
    DISPID_InkRecognitionResult_TopString               = 0x00000001,
    DISPID_InkRecognitionResult_TopAlternate            = 0x00000002,
    DISPID_InkRecognitionResult_Strokes                 = 0x00000003,
    DISPID_InkRecognitionResult_TopConfidence           = 0x00000004,
    DISPID_InkRecognitionResult_AlternatesFromSelection = 0x00000005,
    DISPID_InkRecognitionResult_ModifyTopAlternate      = 0x00000006,
    DISPID_InkRecognitionResult_SetResultOnStrokes      = 0x00000007,
}

alias DISPID_InkRecoAlternate = int;
enum : int
{
    DISPID_InkRecoAlternate_String                               = 0x00000001,
    DISPID_InkRecoAlternate_LineNumber                           = 0x00000002,
    DISPID_InkRecoAlternate_Baseline                             = 0x00000003,
    DISPID_InkRecoAlternate_Midline                              = 0x00000004,
    DISPID_InkRecoAlternate_Ascender                             = 0x00000005,
    DISPID_InkRecoAlternate_Descender                            = 0x00000006,
    DISPID_InkRecoAlternate_Confidence                           = 0x00000007,
    DISPID_InkRecoAlternate_Strokes                              = 0x00000008,
    DISPID_InkRecoAlternate_GetStrokesFromStrokeRanges           = 0x00000009,
    DISPID_InkRecoAlternate_GetStrokesFromTextRange              = 0x0000000a,
    DISPID_InkRecoAlternate_GetTextRangeFromStrokes              = 0x0000000b,
    DISPID_InkRecoAlternate_GetPropertyValue                     = 0x0000000c,
    DISPID_InkRecoAlternate_LineAlternates                       = 0x0000000d,
    DISPID_InkRecoAlternate_ConfidenceAlternates                 = 0x0000000e,
    DISPID_InkRecoAlternate_AlternatesWithConstantPropertyValues = 0x0000000f,
}

alias DISPID_InkRecognitionAlternates = int;
enum : int
{
    DISPID_InkRecognitionAlternates_NewEnum = 0xfffffffc,
    DISPID_InkRecognitionAlternates_Item    = 0x00000000,
    DISPID_InkRecognitionAlternates_Count   = 0x00000001,
    DISPID_InkRecognitionAlternates_Strokes = 0x00000002,
}

struct InkRecoGuide
{
    RECT rectWritingBox;
    RECT rectDrawnBox;
    int cRows;
    int cColumns;
    int midline;
}
alias DISPID_InkRecognizerGuide = int;
enum : int
{
    DISPID_IRGWritingBox = 0x00000001,
    DISPID_IRGDrawnBox   = 0x00000002,
    DISPID_IRGRows       = 0x00000003,
    DISPID_IRGColumns    = 0x00000004,
    DISPID_IRGMidline    = 0x00000005,
    DISPID_IRGGuideData  = 0x00000006,
}

alias DISPID_InkWordList = int;
enum : int
{
    DISPID_InkWordList_AddWord    = 0x00000000,
    DISPID_InkWordList_RemoveWord = 0x00000001,
    DISPID_InkWordList_Merge      = 0x00000002,
}

alias DISPID_InkWordList2 = int;
enum : int
{
    DISPID_InkWordList2_AddWords = 0x00000003,
}

enum IID_IInkRectangle = GUID(0x9794ff82, 0x6071, 0x4717, [0x8a, 0x8b, 0x6a, 0xc7, 0xc6, 0x4a, 0x68, 0x6e]);
interface IInkRectangle : IDispatch
{
    HRESULT get_Top(int*);
    HRESULT put_Top(int);
    HRESULT get_Left(int*);
    HRESULT put_Left(int);
    HRESULT get_Bottom(int*);
    HRESULT put_Bottom(int);
    HRESULT get_Right(int*);
    HRESULT put_Right(int);
    HRESULT get_Data(RECT*);
    HRESULT put_Data(RECT);
    HRESULT GetRectangle(int*, int*, int*, int*);
    HRESULT SetRectangle(int, int, int, int);
}
enum IID_IInkExtendedProperty = GUID(0xdb489209, 0xb7c3, 0x411d, [0x90, 0xf6, 0x15, 0x48, 0xcf, 0xff, 0x27, 0x1e]);
interface IInkExtendedProperty : IDispatch
{
    HRESULT get_Guid(BSTR*);
    HRESULT get_Data(VARIANT*);
    HRESULT put_Data(VARIANT);
}
enum IID_IInkExtendedProperties = GUID(0x89f2a8be, 0x95a9, 0x4530, [0x8b, 0x8f, 0x88, 0xe9, 0x71, 0xe3, 0xe2, 0x5f]);
interface IInkExtendedProperties : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(VARIANT, IInkExtendedProperty*);
    HRESULT Add(BSTR, VARIANT, IInkExtendedProperty*);
    HRESULT Remove(VARIANT);
    HRESULT Clear();
    HRESULT DoesPropertyExist(BSTR, short*);
}
enum IID_IInkDrawingAttributes = GUID(0xbf519b75, 0xa15, 0x4623, [0xad, 0xc9, 0xc0, 0xd, 0x43, 0x6a, 0x80, 0x92]);
interface IInkDrawingAttributes : IDispatch
{
    HRESULT get_Color(int*);
    HRESULT put_Color(int);
    HRESULT get_Width(float*);
    HRESULT put_Width(float);
    HRESULT get_Height(float*);
    HRESULT put_Height(float);
    HRESULT get_FitToCurve(short*);
    HRESULT put_FitToCurve(short);
    HRESULT get_IgnorePressure(short*);
    HRESULT put_IgnorePressure(short);
    HRESULT get_AntiAliased(short*);
    HRESULT put_AntiAliased(short);
    HRESULT get_Transparency(int*);
    HRESULT put_Transparency(int);
    HRESULT get_RasterOperation(InkRasterOperation*);
    HRESULT put_RasterOperation(InkRasterOperation);
    HRESULT get_PenTip(InkPenTip*);
    HRESULT put_PenTip(InkPenTip);
    HRESULT get_ExtendedProperties(IInkExtendedProperties*);
    HRESULT Clone(IInkDrawingAttributes*);
}
enum IID_IInkTransform = GUID(0x615f1d43, 0x8703, 0x4565, [0x88, 0xe2, 0x82, 0x1, 0xd2, 0xec, 0xd7, 0xb7]);
interface IInkTransform : IDispatch
{
    HRESULT Reset();
    HRESULT Translate(float, float);
    HRESULT Rotate(float, float, float);
    HRESULT Reflect(short, short);
    HRESULT Shear(float, float);
    HRESULT ScaleTransform(float, float);
    HRESULT GetTransform(float*, float*, float*, float*, float*, float*);
    HRESULT SetTransform(float, float, float, float, float, float);
    HRESULT get_eM11(float*);
    HRESULT put_eM11(float);
    HRESULT get_eM12(float*);
    HRESULT put_eM12(float);
    HRESULT get_eM21(float*);
    HRESULT put_eM21(float);
    HRESULT get_eM22(float*);
    HRESULT put_eM22(float);
    HRESULT get_eDx(float*);
    HRESULT put_eDx(float);
    HRESULT get_eDy(float*);
    HRESULT put_eDy(float);
    HRESULT get_Data(XFORM*);
    HRESULT put_Data(XFORM);
}
enum IID_IInkGesture = GUID(0x3bdc0a97, 0x4e5, 0x4e26, [0xb8, 0x13, 0x18, 0xf0, 0x52, 0xd4, 0x1d, 0xef]);
interface IInkGesture : IDispatch
{
    HRESULT get_Confidence(InkRecognitionConfidence*);
    HRESULT get_Id(InkApplicationGesture*);
    HRESULT GetHotPoint(int*, int*);
}
enum IID_IInkCursor = GUID(0xad30c630, 0x40c5, 0x4350, [0x84, 0x5, 0x9c, 0x71, 0x1, 0x2f, 0xc5, 0x58]);
interface IInkCursor : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Id(int*);
    HRESULT get_Inverted(short*);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes);
    HRESULT get_Tablet(IInkTablet*);
    HRESULT get_Buttons(IInkCursorButtons*);
}
enum IID_IInkCursors = GUID(0xa248c1ac, 0xc698, 0x4e06, [0x9e, 0x5c, 0xd5, 0x7f, 0x77, 0xc7, 0xe6, 0x47]);
interface IInkCursors : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, IInkCursor*);
}
enum IID_IInkCursorButton = GUID(0x85ef9417, 0x1d59, 0x49b2, [0xa1, 0x3c, 0x70, 0x2c, 0x85, 0x43, 0x8, 0x94]);
interface IInkCursorButton : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Id(BSTR*);
    HRESULT get_State(InkCursorButtonState*);
}
enum IID_IInkCursorButtons = GUID(0x3671cc40, 0xb624, 0x4671, [0x9f, 0xa0, 0xdb, 0x11, 0x9d, 0x95, 0x2d, 0x54]);
interface IInkCursorButtons : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(VARIANT, IInkCursorButton*);
}
enum IID_IInkTablet = GUID(0x2de25eaa, 0x6ef8, 0x42d5, [0xae, 0xe9, 0x18, 0x5b, 0xc8, 0x1b, 0x91, 0x2d]);
interface IInkTablet : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_PlugAndPlayId(BSTR*);
    HRESULT get_MaximumInputRectangle(IInkRectangle*);
    HRESULT get_HardwareCapabilities(TabletHardwareCapabilities*);
    HRESULT IsPacketPropertySupported(BSTR, short*);
    HRESULT GetPropertyMetrics(BSTR, int*, int*, TabletPropertyMetricUnit*, float*);
}
enum IID_IInkTablet2 = GUID(0x90c91ad2, 0xfa36, 0x49d6, [0x95, 0x16, 0xce, 0x8d, 0x57, 0xf, 0x6f, 0x85]);
interface IInkTablet2 : IDispatch
{
    HRESULT get_DeviceKind(TabletDeviceKind*);
}
enum IID_IInkTablet3 = GUID(0x7e313997, 0x1327, 0x41dd, [0x8c, 0xa9, 0x79, 0xf2, 0x4b, 0xe1, 0x72, 0x50]);
interface IInkTablet3 : IDispatch
{
    HRESULT get_IsMultiTouch(short*);
    HRESULT get_MaximumCursors(uint*);
}
enum IID_IInkTablets = GUID(0x112086d9, 0x7779, 0x4535, [0xa6, 0x99, 0x86, 0x2b, 0x43, 0xac, 0x18, 0x63]);
interface IInkTablets : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_DefaultTablet(IInkTablet*);
    HRESULT Item(int, IInkTablet*);
    HRESULT IsPacketPropertySupported(BSTR, short*);
}
enum IID_IInkStrokeDisp = GUID(0x43242fea, 0x91d1, 0x4a72, [0x96, 0x3e, 0xfb, 0xb9, 0x18, 0x29, 0xcf, 0xa2]);
interface IInkStrokeDisp : IDispatch
{
    HRESULT get_ID(int*);
    HRESULT get_BezierPoints(VARIANT*);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes);
    HRESULT get_Ink(IInkDisp*);
    HRESULT get_ExtendedProperties(IInkExtendedProperties*);
    HRESULT get_PolylineCusps(VARIANT*);
    HRESULT get_BezierCusps(VARIANT*);
    HRESULT get_SelfIntersections(VARIANT*);
    HRESULT get_PacketCount(int*);
    HRESULT get_PacketSize(int*);
    HRESULT get_PacketDescription(VARIANT*);
    HRESULT get_Deleted(short*);
    HRESULT GetBoundingBox(InkBoundingBoxMode, IInkRectangle*);
    HRESULT FindIntersections(IInkStrokes, VARIANT*);
    HRESULT GetRectangleIntersections(IInkRectangle, VARIANT*);
    HRESULT Clip(IInkRectangle);
    HRESULT HitTestCircle(int, int, float, short*);
    HRESULT NearestPoint(int, int, float*, float*);
    HRESULT Split(float, IInkStrokeDisp*);
    HRESULT GetPacketDescriptionPropertyMetrics(BSTR, int*, int*, TabletPropertyMetricUnit*, float*);
    HRESULT GetPoints(int, int, VARIANT*);
    HRESULT SetPoints(VARIANT, int, int, int*);
    HRESULT GetPacketData(int, int, VARIANT*);
    HRESULT GetPacketValuesByProperty(BSTR, int, int, VARIANT*);
    HRESULT SetPacketValuesByProperty(BSTR, VARIANT, int, int, int*);
    HRESULT GetFlattenedBezierPoints(int, VARIANT*);
    HRESULT Transform(IInkTransform, short);
    HRESULT ScaleToRectangle(IInkRectangle);
    HRESULT Move(float, float);
    HRESULT Rotate(float, float, float);
    HRESULT Shear(float, float);
    HRESULT ScaleTransform(float, float);
}
enum IID_IInkStrokes = GUID(0xf1f4c9d8, 0x590a, 0x4963, [0xb3, 0xae, 0x19, 0x35, 0x67, 0x1b, 0xb6, 0xf3]);
interface IInkStrokes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Ink(IInkDisp*);
    HRESULT get_RecognitionResult(IInkRecognitionResult*);
    HRESULT ToString(BSTR*);
    HRESULT Item(int, IInkStrokeDisp*);
    HRESULT Add(IInkStrokeDisp);
    HRESULT AddStrokes(IInkStrokes);
    HRESULT Remove(IInkStrokeDisp);
    HRESULT RemoveStrokes(IInkStrokes);
    HRESULT ModifyDrawingAttributes(IInkDrawingAttributes);
    HRESULT GetBoundingBox(InkBoundingBoxMode, IInkRectangle*);
    HRESULT Transform(IInkTransform, short);
    HRESULT ScaleToRectangle(IInkRectangle);
    HRESULT Move(float, float);
    HRESULT Rotate(float, float, float);
    HRESULT Shear(float, float);
    HRESULT ScaleTransform(float, float);
    HRESULT Clip(IInkRectangle);
    HRESULT RemoveRecognitionResult();
}
enum IID_IInkCustomStrokes = GUID(0x7e23a88f, 0xc30e, 0x420f, [0x9b, 0xdb, 0x28, 0x90, 0x25, 0x43, 0xf0, 0xc1]);
interface IInkCustomStrokes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(VARIANT, IInkStrokes*);
    HRESULT Add(BSTR, IInkStrokes);
    HRESULT Remove(VARIANT);
    HRESULT Clear();
}
enum IID__IInkStrokesEvents = GUID(0xf33053ec, 0x5d25, 0x430a, [0x92, 0x8f, 0x76, 0xa6, 0x49, 0x1d, 0xde, 0x15]);
interface _IInkStrokesEvents : IDispatch
{
}
enum IID_IInkDisp = GUID(0x9d398fa0, 0xc4e2, 0x4fcd, [0x99, 0x73, 0x97, 0x5c, 0xaa, 0xf4, 0x7e, 0xa6]);
interface IInkDisp : IDispatch
{
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT get_ExtendedProperties(IInkExtendedProperties*);
    HRESULT get_Dirty(short*);
    HRESULT put_Dirty(short);
    HRESULT get_CustomStrokes(IInkCustomStrokes*);
    HRESULT GetBoundingBox(InkBoundingBoxMode, IInkRectangle*);
    HRESULT DeleteStrokes(IInkStrokes);
    HRESULT DeleteStroke(IInkStrokeDisp);
    HRESULT ExtractStrokes(IInkStrokes, InkExtractFlags, IInkDisp*);
    HRESULT ExtractWithRectangle(IInkRectangle, InkExtractFlags, IInkDisp*);
    HRESULT Clip(IInkRectangle);
    HRESULT Clone(IInkDisp*);
    HRESULT HitTestCircle(int, int, float, IInkStrokes*);
    HRESULT HitTestWithRectangle(IInkRectangle, float, IInkStrokes*);
    HRESULT HitTestWithLasso(VARIANT, float, VARIANT*, IInkStrokes*);
    HRESULT NearestPoint(int, int, float*, float*, IInkStrokeDisp*);
    HRESULT CreateStrokes(VARIANT, IInkStrokes*);
    HRESULT AddStrokesAtRectangle(IInkStrokes, IInkRectangle);
    HRESULT Save(InkPersistenceFormat, InkPersistenceCompressionMode, VARIANT*);
    HRESULT Load(VARIANT);
    HRESULT CreateStroke(VARIANT, VARIANT, IInkStrokeDisp*);
    HRESULT ClipboardCopyWithRectangle(IInkRectangle, InkClipboardFormats, InkClipboardModes, IDataObject*);
    HRESULT ClipboardCopy(IInkStrokes, InkClipboardFormats, InkClipboardModes, IDataObject*);
    HRESULT CanPaste(IDataObject, short*);
    HRESULT ClipboardPaste(int, int, IDataObject, IInkStrokes*);
}
enum IID__IInkEvents = GUID(0x427b1865, 0xca3f, 0x479a, [0x83, 0xa9, 0xf, 0x42, 0xf, 0x2a, 0x0, 0x73]);
interface _IInkEvents : IDispatch
{
}
enum IID_IInkRenderer = GUID(0xe6257a9c, 0xb511, 0x4f4c, [0xa8, 0xb0, 0xa7, 0xdb, 0xc9, 0x50, 0x6b, 0x83]);
interface IInkRenderer : IDispatch
{
    HRESULT GetViewTransform(IInkTransform);
    HRESULT SetViewTransform(IInkTransform);
    HRESULT GetObjectTransform(IInkTransform);
    HRESULT SetObjectTransform(IInkTransform);
    HRESULT Draw(long, IInkStrokes);
    HRESULT DrawStroke(long, IInkStrokeDisp, IInkDrawingAttributes);
    HRESULT PixelToInkSpace(long, int*, int*);
    HRESULT InkSpaceToPixel(long, int*, int*);
    HRESULT PixelToInkSpaceFromPoints(long, VARIANT*);
    HRESULT InkSpaceToPixelFromPoints(long, VARIANT*);
    HRESULT Measure(IInkStrokes, IInkRectangle*);
    HRESULT MeasureStroke(IInkStrokeDisp, IInkDrawingAttributes, IInkRectangle*);
    HRESULT Move(float, float);
    HRESULT Rotate(float, float, float);
    HRESULT ScaleTransform(float, float, short);
}
enum IID_IInkCollector = GUID(0xf0f060b5, 0x8b1f, 0x4a7c, [0x89, 0xec, 0x88, 0x6, 0x92, 0x58, 0x8a, 0x4f]);
interface IInkCollector : IDispatch
{
    HRESULT get_hWnd(long*);
    HRESULT put_hWnd(long);
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes);
    HRESULT get_Renderer(IInkRenderer*);
    HRESULT putref_Renderer(IInkRenderer);
    HRESULT get_Ink(IInkDisp*);
    HRESULT putref_Ink(IInkDisp);
    HRESULT get_AutoRedraw(short*);
    HRESULT put_AutoRedraw(short);
    HRESULT get_CollectingInk(short*);
    HRESULT get_CollectionMode(InkCollectionMode*);
    HRESULT put_CollectionMode(InkCollectionMode);
    HRESULT get_DynamicRendering(short*);
    HRESULT put_DynamicRendering(short);
    HRESULT get_DesiredPacketDescription(VARIANT*);
    HRESULT put_DesiredPacketDescription(VARIANT);
    HRESULT get_MouseIcon(IPictureDisp*);
    HRESULT put_MouseIcon(IPictureDisp);
    HRESULT putref_MouseIcon(IPictureDisp);
    HRESULT get_MousePointer(InkMousePointer*);
    HRESULT put_MousePointer(InkMousePointer);
    HRESULT get_Cursors(IInkCursors*);
    HRESULT get_MarginX(int*);
    HRESULT put_MarginX(int);
    HRESULT get_MarginY(int*);
    HRESULT put_MarginY(int);
    HRESULT get_Tablet(IInkTablet*);
    HRESULT get_SupportHighContrastInk(short*);
    HRESULT put_SupportHighContrastInk(short);
    HRESULT SetGestureStatus(InkApplicationGesture, short);
    HRESULT GetGestureStatus(InkApplicationGesture, short*);
    HRESULT GetWindowInputRectangle(IInkRectangle*);
    HRESULT SetWindowInputRectangle(IInkRectangle);
    HRESULT SetAllTabletsMode(short);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet);
    HRESULT GetEventInterest(InkCollectorEventInterest, short*);
    HRESULT SetEventInterest(InkCollectorEventInterest, short);
}
enum IID__IInkCollectorEvents = GUID(0x11a583f2, 0x712d, 0x4fea, [0xab, 0xcf, 0xab, 0x4a, 0xf3, 0x8e, 0xa0, 0x6b]);
interface _IInkCollectorEvents : IDispatch
{
}
enum IID_IInkOverlay = GUID(0xb82a463b, 0xc1c5, 0x45a3, [0x99, 0x7c, 0xde, 0xab, 0x56, 0x51, 0xb6, 0x7a]);
interface IInkOverlay : IDispatch
{
    HRESULT get_hWnd(long*);
    HRESULT put_hWnd(long);
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes);
    HRESULT get_Renderer(IInkRenderer*);
    HRESULT putref_Renderer(IInkRenderer);
    HRESULT get_Ink(IInkDisp*);
    HRESULT putref_Ink(IInkDisp);
    HRESULT get_AutoRedraw(short*);
    HRESULT put_AutoRedraw(short);
    HRESULT get_CollectingInk(short*);
    HRESULT get_CollectionMode(InkCollectionMode*);
    HRESULT put_CollectionMode(InkCollectionMode);
    HRESULT get_DynamicRendering(short*);
    HRESULT put_DynamicRendering(short);
    HRESULT get_DesiredPacketDescription(VARIANT*);
    HRESULT put_DesiredPacketDescription(VARIANT);
    HRESULT get_MouseIcon(IPictureDisp*);
    HRESULT put_MouseIcon(IPictureDisp);
    HRESULT putref_MouseIcon(IPictureDisp);
    HRESULT get_MousePointer(InkMousePointer*);
    HRESULT put_MousePointer(InkMousePointer);
    HRESULT get_EditingMode(InkOverlayEditingMode*);
    HRESULT put_EditingMode(InkOverlayEditingMode);
    HRESULT get_Selection(IInkStrokes*);
    HRESULT put_Selection(IInkStrokes);
    HRESULT get_EraserMode(InkOverlayEraserMode*);
    HRESULT put_EraserMode(InkOverlayEraserMode);
    HRESULT get_EraserWidth(int*);
    HRESULT put_EraserWidth(int);
    HRESULT get_AttachMode(InkOverlayAttachMode*);
    HRESULT put_AttachMode(InkOverlayAttachMode);
    HRESULT get_Cursors(IInkCursors*);
    HRESULT get_MarginX(int*);
    HRESULT put_MarginX(int);
    HRESULT get_MarginY(int*);
    HRESULT put_MarginY(int);
    HRESULT get_Tablet(IInkTablet*);
    HRESULT get_SupportHighContrastInk(short*);
    HRESULT put_SupportHighContrastInk(short);
    HRESULT get_SupportHighContrastSelectionUI(short*);
    HRESULT put_SupportHighContrastSelectionUI(short);
    HRESULT HitTestSelection(int, int, SelectionHitResult*);
    HRESULT Draw(IInkRectangle);
    HRESULT SetGestureStatus(InkApplicationGesture, short);
    HRESULT GetGestureStatus(InkApplicationGesture, short*);
    HRESULT GetWindowInputRectangle(IInkRectangle*);
    HRESULT SetWindowInputRectangle(IInkRectangle);
    HRESULT SetAllTabletsMode(short);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet);
    HRESULT GetEventInterest(InkCollectorEventInterest, short*);
    HRESULT SetEventInterest(InkCollectorEventInterest, short);
}
enum IID__IInkOverlayEvents = GUID(0x31179b69, 0xe563, 0x489e, [0xb1, 0x6f, 0x71, 0x2f, 0x1e, 0x8a, 0x6, 0x51]);
interface _IInkOverlayEvents : IDispatch
{
}
enum IID_IInkPicture = GUID(0xe85662e0, 0x379a, 0x40d7, [0x9b, 0x5c, 0x75, 0x7d, 0x23, 0x3f, 0x99, 0x23]);
interface IInkPicture : IDispatch
{
    HRESULT get_hWnd(long*);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes);
    HRESULT get_Renderer(IInkRenderer*);
    HRESULT putref_Renderer(IInkRenderer);
    HRESULT get_Ink(IInkDisp*);
    HRESULT putref_Ink(IInkDisp);
    HRESULT get_AutoRedraw(short*);
    HRESULT put_AutoRedraw(short);
    HRESULT get_CollectingInk(short*);
    HRESULT get_CollectionMode(InkCollectionMode*);
    HRESULT put_CollectionMode(InkCollectionMode);
    HRESULT get_DynamicRendering(short*);
    HRESULT put_DynamicRendering(short);
    HRESULT get_DesiredPacketDescription(VARIANT*);
    HRESULT put_DesiredPacketDescription(VARIANT);
    HRESULT get_MouseIcon(IPictureDisp*);
    HRESULT put_MouseIcon(IPictureDisp);
    HRESULT putref_MouseIcon(IPictureDisp);
    HRESULT get_MousePointer(InkMousePointer*);
    HRESULT put_MousePointer(InkMousePointer);
    HRESULT get_EditingMode(InkOverlayEditingMode*);
    HRESULT put_EditingMode(InkOverlayEditingMode);
    HRESULT get_Selection(IInkStrokes*);
    HRESULT put_Selection(IInkStrokes);
    HRESULT get_EraserMode(InkOverlayEraserMode*);
    HRESULT put_EraserMode(InkOverlayEraserMode);
    HRESULT get_EraserWidth(int*);
    HRESULT put_EraserWidth(int);
    HRESULT putref_Picture(IPictureDisp);
    HRESULT put_Picture(IPictureDisp);
    HRESULT get_Picture(IPictureDisp*);
    HRESULT put_SizeMode(InkPictureSizeMode);
    HRESULT get_SizeMode(InkPictureSizeMode*);
    HRESULT put_BackColor(uint);
    HRESULT get_BackColor(uint*);
    HRESULT get_Cursors(IInkCursors*);
    HRESULT get_MarginX(int*);
    HRESULT put_MarginX(int);
    HRESULT get_MarginY(int*);
    HRESULT put_MarginY(int);
    HRESULT get_Tablet(IInkTablet*);
    HRESULT get_SupportHighContrastInk(short*);
    HRESULT put_SupportHighContrastInk(short);
    HRESULT get_SupportHighContrastSelectionUI(short*);
    HRESULT put_SupportHighContrastSelectionUI(short);
    HRESULT HitTestSelection(int, int, SelectionHitResult*);
    HRESULT SetGestureStatus(InkApplicationGesture, short);
    HRESULT GetGestureStatus(InkApplicationGesture, short*);
    HRESULT GetWindowInputRectangle(IInkRectangle*);
    HRESULT SetWindowInputRectangle(IInkRectangle);
    HRESULT SetAllTabletsMode(short);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet);
    HRESULT GetEventInterest(InkCollectorEventInterest, short*);
    HRESULT SetEventInterest(InkCollectorEventInterest, short);
    HRESULT get_InkEnabled(short*);
    HRESULT put_InkEnabled(short);
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
}
enum IID__IInkPictureEvents = GUID(0x60ff4fee, 0x22ff, 0x4484, [0xac, 0xc1, 0xd3, 0x8, 0xd9, 0xcd, 0x7e, 0xa3]);
interface _IInkPictureEvents : IDispatch
{
}
enum IID_IInkRecognizer = GUID(0x782bf7cf, 0x34b, 0x4396, [0x8a, 0x32, 0x3a, 0x18, 0x33, 0xcf, 0x6b, 0x56]);
interface IInkRecognizer : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Vendor(BSTR*);
    HRESULT get_Capabilities(InkRecognizerCapabilities*);
    HRESULT get_Languages(VARIANT*);
    HRESULT get_SupportedProperties(VARIANT*);
    HRESULT get_PreferredPacketDescription(VARIANT*);
    HRESULT CreateRecognizerContext(IInkRecognizerContext*);
}
enum IID_IInkRecognizer2 = GUID(0x6110118a, 0x3a75, 0x4ad6, [0xb2, 0xaa, 0x4, 0xb2, 0xb7, 0x2b, 0xbe, 0x65]);
interface IInkRecognizer2 : IDispatch
{
    HRESULT get_Id(BSTR*);
    HRESULT get_UnicodeRanges(VARIANT*);
}
enum IID_IInkRecognizers = GUID(0x9ccc4f12, 0xb0b7, 0x4a8b, [0xbf, 0x58, 0x4a, 0xec, 0xa4, 0xe8, 0xce, 0xfd]);
interface IInkRecognizers : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT GetDefaultRecognizer(int, IInkRecognizer*);
    HRESULT Item(int, IInkRecognizer*);
}
enum IID__IInkRecognitionEvents = GUID(0x17bce92f, 0x2e21, 0x47fd, [0x9d, 0x33, 0x3c, 0x6a, 0xfb, 0xfd, 0x8c, 0x59]);
interface _IInkRecognitionEvents : IDispatch
{
}
enum IID_IInkRecognizerContext = GUID(0xc68f52f9, 0x32a3, 0x4625, [0x90, 0x6c, 0x44, 0xfc, 0x23, 0xb4, 0x9, 0x58]);
interface IInkRecognizerContext : IDispatch
{
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT putref_Strokes(IInkStrokes);
    HRESULT get_CharacterAutoCompletionMode(InkRecognizerCharacterAutoCompletionMode*);
    HRESULT put_CharacterAutoCompletionMode(InkRecognizerCharacterAutoCompletionMode);
    HRESULT get_Factoid(BSTR*);
    HRESULT put_Factoid(BSTR);
    HRESULT get_Guide(IInkRecognizerGuide*);
    HRESULT putref_Guide(IInkRecognizerGuide);
    HRESULT get_PrefixText(BSTR*);
    HRESULT put_PrefixText(BSTR);
    HRESULT get_SuffixText(BSTR*);
    HRESULT put_SuffixText(BSTR);
    HRESULT get_RecognitionFlags(InkRecognitionModes*);
    HRESULT put_RecognitionFlags(InkRecognitionModes);
    HRESULT get_WordList(IInkWordList*);
    HRESULT putref_WordList(IInkWordList);
    HRESULT get_Recognizer(IInkRecognizer*);
    HRESULT Recognize(InkRecognitionStatus*, IInkRecognitionResult*);
    HRESULT StopBackgroundRecognition();
    HRESULT EndInkInput();
    HRESULT BackgroundRecognize(VARIANT);
    HRESULT BackgroundRecognizeWithAlternates(VARIANT);
    HRESULT Clone(IInkRecognizerContext*);
    HRESULT IsStringSupported(BSTR, short*);
}
enum IID_IInkRecognizerContext2 = GUID(0xd6f0e32f, 0x73d8, 0x408e, [0x8e, 0x9f, 0x5f, 0xea, 0x59, 0x2c, 0x36, 0x3f]);
interface IInkRecognizerContext2 : IDispatch
{
    HRESULT get_EnabledUnicodeRanges(VARIANT*);
    HRESULT put_EnabledUnicodeRanges(VARIANT);
}
enum IID_IInkRecognitionResult = GUID(0x3bc129a8, 0x86cd, 0x45ad, [0xbd, 0xe8, 0xe0, 0xd3, 0x2d, 0x61, 0xc1, 0x6d]);
interface IInkRecognitionResult : IDispatch
{
    HRESULT get_TopString(BSTR*);
    HRESULT get_TopAlternate(IInkRecognitionAlternate*);
    HRESULT get_TopConfidence(InkRecognitionConfidence*);
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT AlternatesFromSelection(int, int, int, IInkRecognitionAlternates*);
    HRESULT ModifyTopAlternate(IInkRecognitionAlternate);
    HRESULT SetResultOnStrokes();
}
enum IID_IInkRecognitionAlternate = GUID(0xb7e660ad, 0x77e4, 0x429b, [0xad, 0xda, 0x87, 0x37, 0x80, 0xd1, 0xfc, 0x4a]);
interface IInkRecognitionAlternate : IDispatch
{
    HRESULT get_String(BSTR*);
    HRESULT get_Confidence(InkRecognitionConfidence*);
    HRESULT get_Baseline(VARIANT*);
    HRESULT get_Midline(VARIANT*);
    HRESULT get_Ascender(VARIANT*);
    HRESULT get_Descender(VARIANT*);
    HRESULT get_LineNumber(int*);
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT get_LineAlternates(IInkRecognitionAlternates*);
    HRESULT get_ConfidenceAlternates(IInkRecognitionAlternates*);
    HRESULT GetStrokesFromStrokeRanges(IInkStrokes, IInkStrokes*);
    HRESULT GetStrokesFromTextRange(int*, int*, IInkStrokes*);
    HRESULT GetTextRangeFromStrokes(IInkStrokes, int*, int*);
    HRESULT AlternatesWithConstantPropertyValues(BSTR, IInkRecognitionAlternates*);
    HRESULT GetPropertyValue(BSTR, VARIANT*);
}
enum IID_IInkRecognitionAlternates = GUID(0x286a167f, 0x9f19, 0x4c61, [0x9d, 0x53, 0x4f, 0x7, 0xbe, 0x62, 0x2b, 0x84]);
interface IInkRecognitionAlternates : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT Item(int, IInkRecognitionAlternate*);
}
enum IID_IInkRecognizerGuide = GUID(0xd934be07, 0x7b84, 0x4208, [0x91, 0x36, 0x83, 0xc2, 0x9, 0x94, 0xe9, 0x5]);
interface IInkRecognizerGuide : IDispatch
{
    HRESULT get_WritingBox(IInkRectangle*);
    HRESULT put_WritingBox(IInkRectangle);
    HRESULT get_DrawnBox(IInkRectangle*);
    HRESULT put_DrawnBox(IInkRectangle);
    HRESULT get_Rows(int*);
    HRESULT put_Rows(int);
    HRESULT get_Columns(int*);
    HRESULT put_Columns(int);
    HRESULT get_Midline(int*);
    HRESULT put_Midline(int);
    HRESULT get_GuideData(InkRecoGuide*);
    HRESULT put_GuideData(InkRecoGuide);
}
enum IID_IInkWordList = GUID(0x76ba3491, 0xcb2f, 0x406b, [0x99, 0x61, 0xe, 0xc, 0x4c, 0xda, 0xae, 0xf2]);
interface IInkWordList : IDispatch
{
    HRESULT AddWord(BSTR);
    HRESULT RemoveWord(BSTR);
    HRESULT Merge(IInkWordList);
}
enum IID_IInkWordList2 = GUID(0x14542586, 0x11bf, 0x4f5f, [0xb6, 0xe7, 0x49, 0xd0, 0x74, 0x4a, 0xab, 0x6e]);
interface IInkWordList2 : IDispatch
{
    HRESULT AddWords(BSTR);
}
enum IID_IInk = GUID(0x3f8e511, 0x43a1, 0x11d3, [0x8b, 0xb6, 0x0, 0x80, 0xc7, 0xd6, 0xba, 0xd5]);
interface IInk : IDispatch
{
}
enum IID_IInkLineInfo = GUID(0x9c1c5ad6, 0xf22f, 0x4de4, [0xb4, 0x53, 0xa2, 0xcc, 0x48, 0x2e, 0x7c, 0x33]);
interface IInkLineInfo : IUnknown
{
    HRESULT SetFormat(INKMETRIC*);
    HRESULT GetFormat(INKMETRIC*);
    HRESULT GetInkExtent(INKMETRIC*, uint*);
    HRESULT GetCandidate(uint, PWSTR, uint*, uint);
    HRESULT SetCandidate(uint, PWSTR);
    HRESULT Recognize();
}
enum IID_ISketchInk = GUID(0xb4563688, 0x98eb, 0x4646, [0xb2, 0x79, 0x44, 0xda, 0x14, 0xd4, 0x57, 0x48]);
interface ISketchInk : IDispatch
{
}
enum CLSID_InkDivider = GUID(0x8854f6a0, 0x4683, 0x4ae7, [0x91, 0x91, 0x75, 0x2f, 0xe6, 0x46, 0x12, 0xc3]);
struct InkDivider
{
}
alias InkDivisionType = int;
enum : int
{
    IDT_Segment   = 0x00000000,
    IDT_Line      = 0x00000001,
    IDT_Paragraph = 0x00000002,
    IDT_Drawing   = 0x00000003,
}

alias DISPID_InkDivider = int;
enum : int
{
    DISPID_IInkDivider_Strokes           = 0x00000001,
    DISPID_IInkDivider_RecognizerContext = 0x00000002,
    DISPID_IInkDivider_LineHeight        = 0x00000003,
    DISPID_IInkDivider_Divide            = 0x00000004,
}

alias DISPID_InkDivisionResult = int;
enum : int
{
    DISPID_IInkDivisionResult_Strokes      = 0x00000001,
    DISPID_IInkDivisionResult_ResultByType = 0x00000002,
}

alias DISPID_InkDivisionUnit = int;
enum : int
{
    DISPID_IInkDivisionUnit_Strokes           = 0x00000001,
    DISPID_IInkDivisionUnit_DivisionType      = 0x00000002,
    DISPID_IInkDivisionUnit_RecognizedString  = 0x00000003,
    DISPID_IInkDivisionUnit_RotationTransform = 0x00000004,
}

alias DISPID_InkDivisionUnits = int;
enum : int
{
    DISPID_IInkDivisionUnits_NewEnum = 0xfffffffc,
    DISPID_IInkDivisionUnits_Item    = 0x00000000,
    DISPID_IInkDivisionUnits_Count   = 0x00000001,
}

enum IID_IInkDivider = GUID(0x5de00405, 0xf9a4, 0x4651, [0xb0, 0xc5, 0xc3, 0x17, 0xde, 0xfd, 0x58, 0xb9]);
interface IInkDivider : IDispatch
{
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT putref_Strokes(IInkStrokes);
    HRESULT get_RecognizerContext(IInkRecognizerContext*);
    HRESULT putref_RecognizerContext(IInkRecognizerContext);
    HRESULT get_LineHeight(int*);
    HRESULT put_LineHeight(int);
    HRESULT Divide(IInkDivisionResult*);
}
enum IID_IInkDivisionResult = GUID(0x2dbec0a7, 0x74c7, 0x4b38, [0x81, 0xeb, 0xaa, 0x8e, 0xf0, 0xc2, 0x49, 0x0]);
interface IInkDivisionResult : IDispatch
{
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT ResultByType(InkDivisionType, IInkDivisionUnits*);
}
enum IID_IInkDivisionUnit = GUID(0x85aee342, 0x48b0, 0x4244, [0x9d, 0xd5, 0x1e, 0xd4, 0x35, 0x41, 0xf, 0xab]);
interface IInkDivisionUnit : IDispatch
{
    HRESULT get_Strokes(IInkStrokes*);
    HRESULT get_DivisionType(InkDivisionType*);
    HRESULT get_RecognizedString(BSTR*);
    HRESULT get_RotationTransform(IInkTransform*);
}
enum IID_IInkDivisionUnits = GUID(0x1bb5ddc2, 0x31cc, 0x4135, [0xab, 0x82, 0x2c, 0x66, 0xc9, 0xf0, 0xc, 0x41]);
interface IInkDivisionUnits : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, IInkDivisionUnit*);
}
enum CLSID_HandwrittenTextInsertion = GUID(0x9f074ee2, 0xe6e9, 0x4d8a, [0xa0, 0x47, 0xeb, 0x5b, 0x5c, 0x3c, 0x55, 0xda]);
struct HandwrittenTextInsertion
{
}
enum CLSID_PenInputPanel = GUID(0xf744e496, 0x1b5a, 0x489e, [0x81, 0xdc, 0xfb, 0xd7, 0xac, 0x62, 0x98, 0xa8]);
struct PenInputPanel
{
}
enum CLSID_TextInputPanel = GUID(0xf9b189d7, 0x228b, 0x4f2b, [0x86, 0x50, 0xb9, 0x7f, 0x59, 0xe0, 0x2c, 0x8c]);
struct TextInputPanel
{
}
enum CLSID_PenInputPanel_Internal = GUID(0x802b1fb9, 0x56b, 0x4720, [0xb0, 0xcc, 0x80, 0xd2, 0x3b, 0x71, 0x17, 0x1e]);
struct PenInputPanel_Internal
{
}
alias DISPID_PenInputPanel = int;
enum : int
{
    DISPID_PIPAttachedEditWindow = 0x00000000,
    DISPID_PIPFactoid            = 0x00000001,
    DISPID_PIPCurrentPanel       = 0x00000002,
    DISPID_PIPDefaultPanel       = 0x00000003,
    DISPID_PIPVisible            = 0x00000004,
    DISPID_PIPTop                = 0x00000005,
    DISPID_PIPLeft               = 0x00000006,
    DISPID_PIPWidth              = 0x00000007,
    DISPID_PIPHeight             = 0x00000008,
    DISPID_PIPMoveTo             = 0x00000009,
    DISPID_PIPCommitPendingInput = 0x0000000a,
    DISPID_PIPRefresh            = 0x0000000b,
    DISPID_PIPBusy               = 0x0000000c,
    DISPID_PIPVerticalOffset     = 0x0000000d,
    DISPID_PIPHorizontalOffset   = 0x0000000e,
    DISPID_PIPEnableTsf          = 0x0000000f,
    DISPID_PIPAutoShow           = 0x00000010,
}

alias DISPID_PenInputPanelEvents = int;
enum : int
{
    DISPID_PIPEVisibleChanged = 0x00000000,
    DISPID_PIPEPanelChanged   = 0x00000001,
    DISPID_PIPEInputFailed    = 0x00000002,
    DISPID_PIPEPanelMoving    = 0x00000003,
}

alias VisualState = int;
enum : int
{
    InPlace      = 0x00000000,
    Floating     = 0x00000001,
    DockedTop    = 0x00000002,
    DockedBottom = 0x00000003,
    Closed       = 0x00000004,
}

alias InteractionMode = int;
enum : int
{
    InteractionMode_InPlace      = 0x00000000,
    InteractionMode_Floating     = 0x00000001,
    InteractionMode_DockedTop    = 0x00000002,
    InteractionMode_DockedBottom = 0x00000003,
}

alias InPlaceState = int;
enum : int
{
    InPlaceState_Auto        = 0x00000000,
    InPlaceState_HoverTarget = 0x00000001,
    InPlaceState_Expanded    = 0x00000002,
}

alias PanelInputArea = int;
enum : int
{
    PanelInputArea_Auto         = 0x00000000,
    PanelInputArea_Keyboard     = 0x00000001,
    PanelInputArea_WritingPad   = 0x00000002,
    PanelInputArea_CharacterPad = 0x00000003,
}

alias CorrectionMode = int;
enum : int
{
    CorrectionMode_NotVisible             = 0x00000000,
    CorrectionMode_PreInsertion           = 0x00000001,
    CorrectionMode_PostInsertionCollapsed = 0x00000002,
    CorrectionMode_PostInsertionExpanded  = 0x00000003,
}

alias CorrectionPosition = int;
enum : int
{
    CorrectionPosition_Auto   = 0x00000000,
    CorrectionPosition_Bottom = 0x00000001,
    CorrectionPosition_Top    = 0x00000002,
}

alias InPlaceDirection = int;
enum : int
{
    InPlaceDirection_Auto   = 0x00000000,
    InPlaceDirection_Bottom = 0x00000001,
    InPlaceDirection_Top    = 0x00000002,
}

alias EventMask = int;
enum : int
{
    EventMask_InPlaceStateChanging      = 0x00000001,
    EventMask_InPlaceStateChanged       = 0x00000002,
    EventMask_InPlaceSizeChanging       = 0x00000004,
    EventMask_InPlaceSizeChanged        = 0x00000008,
    EventMask_InputAreaChanging         = 0x00000010,
    EventMask_InputAreaChanged          = 0x00000020,
    EventMask_CorrectionModeChanging    = 0x00000040,
    EventMask_CorrectionModeChanged     = 0x00000080,
    EventMask_InPlaceVisibilityChanging = 0x00000100,
    EventMask_InPlaceVisibilityChanged  = 0x00000200,
    EventMask_TextInserting             = 0x00000400,
    EventMask_TextInserted              = 0x00000800,
    EventMask_All                       = 0x00000fff,
}

alias PanelType = int;
enum : int
{
    PT_Default     = 0x00000000,
    PT_Inactive    = 0x00000001,
    PT_Handwriting = 0x00000002,
    PT_Keyboard    = 0x00000003,
}

enum IID_IPenInputPanel = GUID(0xfa7a4083, 0x5747, 0x4040, [0xa1, 0x82, 0xb, 0xe, 0x9f, 0xd4, 0xfa, 0xc7]);
interface IPenInputPanel : IDispatch
{
    HRESULT get_Busy(short*);
    HRESULT get_Factoid(BSTR*);
    HRESULT put_Factoid(BSTR);
    HRESULT get_AttachedEditWindow(int*);
    HRESULT put_AttachedEditWindow(int);
    HRESULT get_CurrentPanel(PanelType*);
    HRESULT put_CurrentPanel(PanelType);
    HRESULT get_DefaultPanel(PanelType*);
    HRESULT put_DefaultPanel(PanelType);
    HRESULT get_Visible(short*);
    HRESULT put_Visible(short);
    HRESULT get_Top(int*);
    HRESULT get_Left(int*);
    HRESULT get_Width(int*);
    HRESULT get_Height(int*);
    HRESULT get_VerticalOffset(int*);
    HRESULT put_VerticalOffset(int);
    HRESULT get_HorizontalOffset(int*);
    HRESULT put_HorizontalOffset(int);
    HRESULT get_AutoShow(short*);
    HRESULT put_AutoShow(short);
    HRESULT MoveTo(int, int);
    HRESULT CommitPendingInput();
    HRESULT Refresh();
    HRESULT EnableTsf(short);
}
enum IID__IPenInputPanelEvents = GUID(0xb7e489da, 0x3719, 0x439f, [0x84, 0x8f, 0xe7, 0xac, 0xbd, 0x82, 0xf, 0x17]);
interface _IPenInputPanelEvents : IDispatch
{
}
enum IID_IHandwrittenTextInsertion = GUID(0x56fdea97, 0xecd6, 0x43e7, [0xaa, 0x3a, 0x81, 0x6b, 0xe7, 0x78, 0x58, 0x60]);
interface IHandwrittenTextInsertion : IUnknown
{
    HRESULT InsertRecognitionResultsArray(SAFEARRAY*, uint, BOOL);
    HRESULT InsertInkRecognitionResult(IInkRecognitionResult, uint, BOOL);
}
enum IID_ITextInputPanelEventSink = GUID(0x27560408, 0x8e64, 0x4fe1, [0x80, 0x4e, 0x42, 0x12, 0x1, 0x58, 0x4b, 0x31]);
interface ITextInputPanelEventSink : IUnknown
{
    HRESULT InPlaceStateChanging(InPlaceState, InPlaceState);
    HRESULT InPlaceStateChanged(InPlaceState, InPlaceState);
    HRESULT InPlaceSizeChanging(RECT, RECT);
    HRESULT InPlaceSizeChanged(RECT, RECT);
    HRESULT InputAreaChanging(PanelInputArea, PanelInputArea);
    HRESULT InputAreaChanged(PanelInputArea, PanelInputArea);
    HRESULT CorrectionModeChanging(CorrectionMode, CorrectionMode);
    HRESULT CorrectionModeChanged(CorrectionMode, CorrectionMode);
    HRESULT InPlaceVisibilityChanging(BOOL, BOOL);
    HRESULT InPlaceVisibilityChanged(BOOL, BOOL);
    HRESULT TextInserting(SAFEARRAY*);
    HRESULT TextInserted(SAFEARRAY*);
}
enum IID_ITextInputPanel = GUID(0x6b6a65a5, 0x6af3, 0x46c2, [0xb6, 0xea, 0x56, 0xcd, 0x1f, 0x80, 0xdf, 0x71]);
interface ITextInputPanel : IUnknown
{
    HRESULT get_AttachedEditWindow(HWND*);
    HRESULT put_AttachedEditWindow(HWND);
    HRESULT get_CurrentInteractionMode(InteractionMode*);
    HRESULT get_DefaultInPlaceState(InPlaceState*);
    HRESULT put_DefaultInPlaceState(InPlaceState);
    HRESULT get_CurrentInPlaceState(InPlaceState*);
    HRESULT get_DefaultInputArea(PanelInputArea*);
    HRESULT put_DefaultInputArea(PanelInputArea);
    HRESULT get_CurrentInputArea(PanelInputArea*);
    HRESULT get_CurrentCorrectionMode(CorrectionMode*);
    HRESULT get_PreferredInPlaceDirection(InPlaceDirection*);
    HRESULT put_PreferredInPlaceDirection(InPlaceDirection);
    HRESULT get_ExpandPostInsertionCorrection(BOOL*);
    HRESULT put_ExpandPostInsertionCorrection(BOOL);
    HRESULT get_InPlaceVisibleOnFocus(BOOL*);
    HRESULT put_InPlaceVisibleOnFocus(BOOL);
    HRESULT get_InPlaceBoundingRectangle(RECT*);
    HRESULT get_PopUpCorrectionHeight(int*);
    HRESULT get_PopDownCorrectionHeight(int*);
    HRESULT CommitPendingInput();
    HRESULT SetInPlaceVisibility(BOOL);
    HRESULT SetInPlacePosition(int, int, CorrectionPosition);
    HRESULT SetInPlaceHoverTargetPosition(int, int);
    HRESULT Advise(ITextInputPanelEventSink, uint);
    HRESULT Unadvise(ITextInputPanelEventSink);
}
enum IID_IInputPanelWindowHandle = GUID(0x4af81847, 0xfdc4, 0x4fc3, [0xad, 0xb, 0x42, 0x24, 0x79, 0xc1, 0xb9, 0x35]);
interface IInputPanelWindowHandle : IUnknown
{
    HRESULT get_AttachedEditWindow32(int*);
    HRESULT put_AttachedEditWindow32(int);
    HRESULT get_AttachedEditWindow64(long*);
    HRESULT put_AttachedEditWindow64(long);
}
enum IID_ITextInputPanelRunInfo = GUID(0x9f424568, 0x1920, 0x48cc, [0x98, 0x11, 0xa9, 0x93, 0xcb, 0xf5, 0xad, 0xba]);
interface ITextInputPanelRunInfo : IUnknown
{
    HRESULT IsTipRunning(BOOL*);
}
alias FLICKDIRECTION = int;
enum : int
{
    FLICKDIRECTION_MIN       = 0x00000000,
    FLICKDIRECTION_RIGHT     = 0x00000000,
    FLICKDIRECTION_UPRIGHT   = 0x00000001,
    FLICKDIRECTION_UP        = 0x00000002,
    FLICKDIRECTION_UPLEFT    = 0x00000003,
    FLICKDIRECTION_LEFT      = 0x00000004,
    FLICKDIRECTION_DOWNLEFT  = 0x00000005,
    FLICKDIRECTION_DOWN      = 0x00000006,
    FLICKDIRECTION_DOWNRIGHT = 0x00000007,
    FLICKDIRECTION_INVALID   = 0x00000008,
}

alias FLICKMODE = int;
enum : int
{
    FLICKMODE_MIN      = 0x00000000,
    FLICKMODE_OFF      = 0x00000000,
    FLICKMODE_ON       = 0x00000001,
    FLICKMODE_LEARNING = 0x00000002,
    FLICKMODE_MAX      = 0x00000002,
    FLICKMODE_DEFAULT  = 0x00000001,
}

alias FLICKACTION_COMMANDCODE = int;
enum : int
{
    FLICKACTION_COMMANDCODE_NULL        = 0x00000000,
    FLICKACTION_COMMANDCODE_SCROLL      = 0x00000001,
    FLICKACTION_COMMANDCODE_APPCOMMAND  = 0x00000002,
    FLICKACTION_COMMANDCODE_CUSTOMKEY   = 0x00000003,
    FLICKACTION_COMMANDCODE_KEYMODIFIER = 0x00000004,
}

struct FLICK_POINT
{
    int _bitfield0;
}
struct FLICK_DATA
{
    int _bitfield0;
}
alias SCROLLDIRECTION = int;
enum : int
{
    SCROLLDIRECTION_UP   = 0x00000000,
    SCROLLDIRECTION_DOWN = 0x00000001,
}

alias KEYMODIFIER = int;
enum : int
{
    KEYMODIFIER_CONTROL = 0x00000001,
    KEYMODIFIER_MENU    = 0x00000002,
    KEYMODIFIER_SHIFT   = 0x00000004,
    KEYMODIFIER_WIN     = 0x00000008,
    KEYMODIFIER_ALTGR   = 0x00000010,
    KEYMODIFIER_EXT     = 0x00000020,
}

enum CLSID_InkEdit = GUID(0xe5ca59f5, 0x57c4, 0x4dd8, [0x9b, 0xd6, 0x1d, 0xee, 0xed, 0xd2, 0x7a, 0xf4]);
struct InkEdit
{
}
struct IEC_STROKEINFO
{
    NMHDR nmhdr;
    IInkCursor Cursor;
    IInkStrokeDisp Stroke;
}
struct IEC_GESTUREINFO
{
    NMHDR nmhdr;
    IInkCursor Cursor;
    IInkStrokes Strokes;
    VARIANT Gestures;
}
struct IEC_RECOGNITIONRESULTINFO
{
    NMHDR nmhdr;
    IInkRecognitionResult RecognitionResult;
}
alias MouseButton = int;
enum : int
{
    NO_BUTTON     = 0x00000000,
    LEFT_BUTTON   = 0x00000001,
    RIGHT_BUTTON  = 0x00000002,
    MIDDLE_BUTTON = 0x00000004,
}

alias SelAlignmentConstants = int;
enum : int
{
    rtfLeft   = 0x00000000,
    rtfRight  = 0x00000001,
    rtfCenter = 0x00000002,
}

alias DISPID_InkEdit = int;
enum : int
{
    DISPID_Text               = 0x00000000,
    DISPID_TextRTF            = 0x00000001,
    DISPID_Hwnd               = 0x00000002,
    DISPID_DisableNoScroll    = 0x00000003,
    DISPID_Locked             = 0x00000004,
    DISPID_Enabled            = 0x00000005,
    DISPID_MaxLength          = 0x00000006,
    DISPID_MultiLine          = 0x00000007,
    DISPID_ScrollBars         = 0x00000008,
    DISPID_RTSelStart         = 0x00000009,
    DISPID_RTSelLength        = 0x0000000a,
    DISPID_RTSelText          = 0x0000000b,
    DISPID_SelAlignment       = 0x0000000c,
    DISPID_SelBold            = 0x0000000d,
    DISPID_SelCharOffset      = 0x0000000e,
    DISPID_SelColor           = 0x0000000f,
    DISPID_SelFontName        = 0x00000010,
    DISPID_SelFontSize        = 0x00000011,
    DISPID_SelItalic          = 0x00000012,
    DISPID_SelRTF             = 0x00000013,
    DISPID_SelUnderline       = 0x00000014,
    DISPID_DragIcon           = 0x00000015,
    DISPID_Status             = 0x00000016,
    DISPID_UseMouseForInput   = 0x00000017,
    DISPID_InkMode            = 0x00000018,
    DISPID_InkInsertMode      = 0x00000019,
    DISPID_RecoTimeout        = 0x0000001a,
    DISPID_DrawAttr           = 0x0000001b,
    DISPID_Recognizer         = 0x0000001c,
    DISPID_Factoid            = 0x0000001d,
    DISPID_SelInk             = 0x0000001e,
    DISPID_SelInksDisplayMode = 0x0000001f,
    DISPID_Recognize          = 0x00000020,
    DISPID_GetGestStatus      = 0x00000021,
    DISPID_SetGestStatus      = 0x00000022,
    DISPID_Refresh            = 0x00000023,
}

alias DISPID_InkEditEvents = int;
enum : int
{
    DISPID_IeeChange            = 0x00000001,
    DISPID_IeeSelChange         = 0x00000002,
    DISPID_IeeKeyDown           = 0x00000003,
    DISPID_IeeKeyUp             = 0x00000004,
    DISPID_IeeMouseUp           = 0x00000005,
    DISPID_IeeMouseDown         = 0x00000006,
    DISPID_IeeKeyPress          = 0x00000007,
    DISPID_IeeDblClick          = 0x00000008,
    DISPID_IeeClick             = 0x00000009,
    DISPID_IeeMouseMove         = 0x0000000a,
    DISPID_IeeCursorDown        = 0x00000015,
    DISPID_IeeStroke            = 0x00000016,
    DISPID_IeeGesture           = 0x00000017,
    DISPID_IeeRecognitionResult = 0x00000018,
}

alias InkMode = int;
enum : int
{
    IEM_Disabled      = 0x00000000,
    IEM_Ink           = 0x00000001,
    IEM_InkAndGesture = 0x00000002,
}

alias InkInsertMode = int;
enum : int
{
    IEM_InsertText = 0x00000000,
    IEM_InsertInk  = 0x00000001,
}

alias InkEditStatus = int;
enum : int
{
    IES_Idle        = 0x00000000,
    IES_Collecting  = 0x00000001,
    IES_Recognizing = 0x00000002,
}

alias InkDisplayMode = int;
enum : int
{
    IDM_Ink  = 0x00000000,
    IDM_Text = 0x00000001,
}

alias AppearanceConstants = int;
enum : int
{
    rtfFlat   = 0x00000000,
    rtfThreeD = 0x00000001,
}

alias BorderStyleConstants = int;
enum : int
{
    rtfNoBorder    = 0x00000000,
    rtfFixedSingle = 0x00000001,
}

alias ScrollBarsConstants = int;
enum : int
{
    rtfNone       = 0x00000000,
    rtfHorizontal = 0x00000001,
    rtfVertical   = 0x00000002,
    rtfBoth       = 0x00000003,
}

enum IID_IInkEdit = GUID(0xf2127a19, 0xfbfb, 0x4aed, [0x84, 0x64, 0x3f, 0x36, 0xd7, 0x8c, 0xfe, 0xfb]);
interface IInkEdit : IDispatch
{
    HRESULT get_Status(InkEditStatus*);
    HRESULT get_UseMouseForInput(short*);
    HRESULT put_UseMouseForInput(short);
    HRESULT get_InkMode(InkMode*);
    HRESULT put_InkMode(InkMode);
    HRESULT get_InkInsertMode(InkInsertMode*);
    HRESULT put_InkInsertMode(InkInsertMode);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes);
    HRESULT get_RecognitionTimeout(int*);
    HRESULT put_RecognitionTimeout(int);
    HRESULT get_Recognizer(IInkRecognizer*);
    HRESULT putref_Recognizer(IInkRecognizer);
    HRESULT get_Factoid(BSTR*);
    HRESULT put_Factoid(BSTR);
    HRESULT get_SelInks(VARIANT*);
    HRESULT put_SelInks(VARIANT);
    HRESULT get_SelInksDisplayMode(InkDisplayMode*);
    HRESULT put_SelInksDisplayMode(InkDisplayMode);
    HRESULT Recognize();
    HRESULT GetGestureStatus(InkApplicationGesture, short*);
    HRESULT SetGestureStatus(InkApplicationGesture, short);
    HRESULT put_BackColor(uint);
    HRESULT get_BackColor(uint*);
    HRESULT get_Appearance(AppearanceConstants*);
    HRESULT put_Appearance(AppearanceConstants);
    HRESULT get_BorderStyle(BorderStyleConstants*);
    HRESULT put_BorderStyle(BorderStyleConstants);
    HRESULT get_Hwnd(uint*);
    HRESULT get_Font(IFontDisp*);
    HRESULT putref_Font(IFontDisp);
    HRESULT get_Text(BSTR*);
    HRESULT put_Text(BSTR);
    HRESULT get_MouseIcon(IPictureDisp*);
    HRESULT put_MouseIcon(IPictureDisp);
    HRESULT putref_MouseIcon(IPictureDisp);
    HRESULT get_MousePointer(InkMousePointer*);
    HRESULT put_MousePointer(InkMousePointer);
    HRESULT get_Locked(short*);
    HRESULT put_Locked(short);
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
    HRESULT get_MaxLength(int*);
    HRESULT put_MaxLength(int);
    HRESULT get_MultiLine(short*);
    HRESULT put_MultiLine(short);
    HRESULT get_ScrollBars(ScrollBarsConstants*);
    HRESULT put_ScrollBars(ScrollBarsConstants);
    HRESULT get_DisableNoScroll(short*);
    HRESULT put_DisableNoScroll(short);
    HRESULT get_SelAlignment(VARIANT*);
    HRESULT put_SelAlignment(VARIANT);
    HRESULT get_SelBold(VARIANT*);
    HRESULT put_SelBold(VARIANT);
    HRESULT get_SelItalic(VARIANT*);
    HRESULT put_SelItalic(VARIANT);
    HRESULT get_SelUnderline(VARIANT*);
    HRESULT put_SelUnderline(VARIANT);
    HRESULT get_SelColor(VARIANT*);
    HRESULT put_SelColor(VARIANT);
    HRESULT get_SelFontName(VARIANT*);
    HRESULT put_SelFontName(VARIANT);
    HRESULT get_SelFontSize(VARIANT*);
    HRESULT put_SelFontSize(VARIANT);
    HRESULT get_SelCharOffset(VARIANT*);
    HRESULT put_SelCharOffset(VARIANT);
    HRESULT get_TextRTF(BSTR*);
    HRESULT put_TextRTF(BSTR);
    HRESULT get_SelStart(int*);
    HRESULT put_SelStart(int);
    HRESULT get_SelLength(int*);
    HRESULT put_SelLength(int);
    HRESULT get_SelText(BSTR*);
    HRESULT put_SelText(BSTR);
    HRESULT get_SelRTF(BSTR*);
    HRESULT put_SelRTF(BSTR);
    HRESULT Refresh();
}
enum IID__IInkEditEvents = GUID(0xe3b0b797, 0xa72e, 0x46db, [0xa0, 0xd7, 0x6c, 0x9e, 0xba, 0x8e, 0x9b, 0xbc]);
interface _IInkEditEvents : IDispatch
{
}
enum CLSID_MathInputControl = GUID(0xc561816c, 0x14d8, 0x4090, [0x83, 0xc, 0x98, 0xd9, 0x94, 0xb2, 0x1c, 0x7b]);
struct MathInputControl
{
}
alias MICUIELEMENT = int;
enum : int
{
    MICUIELEMENT_BUTTON_WRITE           = 0x00000001,
    MICUIELEMENT_BUTTON_ERASE           = 0x00000002,
    MICUIELEMENT_BUTTON_CORRECT         = 0x00000004,
    MICUIELEMENT_BUTTON_CLEAR           = 0x00000008,
    MICUIELEMENT_BUTTON_UNDO            = 0x00000010,
    MICUIELEMENT_BUTTON_REDO            = 0x00000020,
    MICUIELEMENT_BUTTON_INSERT          = 0x00000040,
    MICUIELEMENT_BUTTON_CANCEL          = 0x00000080,
    MICUIELEMENT_INKPANEL_BACKGROUND    = 0x00000100,
    MICUIELEMENT_RESULTPANEL_BACKGROUND = 0x00000200,
}

alias MICUIELEMENTSTATE = int;
enum : int
{
    MICUIELEMENTSTATE_NORMAL   = 0x00000001,
    MICUIELEMENTSTATE_HOT      = 0x00000002,
    MICUIELEMENTSTATE_PRESSED  = 0x00000003,
    MICUIELEMENTSTATE_DISABLED = 0x00000004,
}

alias DISPID_MathInputControlEvents = int;
enum : int
{
    DISPID_MICInsert = 0x00000000,
    DISPID_MICClose  = 0x00000001,
    DISPID_MICPaint  = 0x00000002,
    DISPID_MICClear  = 0x00000003,
}

enum IID_IMathInputControl = GUID(0xeba615aa, 0xfac6, 0x4738, [0xba, 0x5f, 0xff, 0x9, 0xe9, 0xfe, 0x47, 0x3e]);
interface IMathInputControl : IDispatch
{
    HRESULT Show();
    HRESULT Hide();
    HRESULT IsVisible(short*);
    HRESULT GetPosition(int*, int*, int*, int*);
    HRESULT SetPosition(int, int, int, int);
    HRESULT Clear();
    HRESULT SetCustomPaint(int, short);
    HRESULT SetCaptionText(BSTR);
    HRESULT LoadInk(IInkDisp);
    HRESULT SetOwnerWindow(long);
    HRESULT EnableExtendedButtons(short);
    HRESULT GetPreviewHeight(int*);
    HRESULT SetPreviewHeight(int);
    HRESULT EnableAutoGrow(short);
    HRESULT AddFunctionName(BSTR);
    HRESULT RemoveFunctionName(BSTR);
    HRESULT GetHoverIcon(IPictureDisp*);
}
enum IID__IMathInputControlEvents = GUID(0x683336b5, 0xa47d, 0x4358, [0x96, 0xf9, 0x87, 0x5a, 0x47, 0x2a, 0xe7, 0xa]);
interface _IMathInputControlEvents : IDispatch
{
}
enum CLSID_RealTimeStylus = GUID(0xe26b366d, 0xf998, 0x43ce, [0x83, 0x6f, 0xcb, 0x6d, 0x90, 0x44, 0x32, 0xb0]);
struct RealTimeStylus
{
}
enum CLSID_DynamicRenderer = GUID(0xecd32aea, 0x746f, 0x4dcb, [0xbf, 0x68, 0x8, 0x27, 0x57, 0xfa, 0xff, 0x18]);
struct DynamicRenderer
{
}
enum CLSID_GestureRecognizer = GUID(0xea30c654, 0xc62c, 0x441f, [0xac, 0x0, 0x95, 0xf9, 0xa1, 0x96, 0x78, 0x2c]);
struct GestureRecognizer
{
}
enum CLSID_StrokeBuilder = GUID(0xe810cee7, 0x6e51, 0x4cb0, [0xaa, 0x3a, 0xb, 0x98, 0x5b, 0x70, 0xda, 0xf7]);
struct StrokeBuilder
{
}
alias RealTimeStylusDataInterest = int;
enum : int
{
    RTSDI_AllData                = 0xffffffff,
    RTSDI_None                   = 0x00000000,
    RTSDI_Error                  = 0x00000001,
    RTSDI_RealTimeStylusEnabled  = 0x00000002,
    RTSDI_RealTimeStylusDisabled = 0x00000004,
    RTSDI_StylusNew              = 0x00000008,
    RTSDI_StylusInRange          = 0x00000010,
    RTSDI_InAirPackets           = 0x00000020,
    RTSDI_StylusOutOfRange       = 0x00000040,
    RTSDI_StylusDown             = 0x00000080,
    RTSDI_Packets                = 0x00000100,
    RTSDI_StylusUp               = 0x00000200,
    RTSDI_StylusButtonUp         = 0x00000400,
    RTSDI_StylusButtonDown       = 0x00000800,
    RTSDI_SystemEvents           = 0x00001000,
    RTSDI_TabletAdded            = 0x00002000,
    RTSDI_TabletRemoved          = 0x00004000,
    RTSDI_CustomStylusDataAdded  = 0x00008000,
    RTSDI_UpdateMapping          = 0x00010000,
    RTSDI_DefaultEvents          = 0x00009386,
}

struct StylusInfo
{
    uint tcid;
    uint cid;
    BOOL bIsInvertedCursor;
}
alias StylusQueue = int;
enum : int
{
    SyncStylusQueue           = 0x00000001,
    AsyncStylusQueueImmediate = 0x00000002,
    AsyncStylusQueue          = 0x00000003,
}

alias RealTimeStylusLockType = int;
enum : int
{
    RTSLT_ObjLock         = 0x00000001,
    RTSLT_SyncEventLock   = 0x00000002,
    RTSLT_AsyncEventLock  = 0x00000004,
    RTSLT_ExcludeCallback = 0x00000008,
    RTSLT_SyncObjLock     = 0x0000000b,
    RTSLT_AsyncObjLock    = 0x0000000d,
}

struct GESTURE_DATA
{
    int gestureId;
    int recoConfidence;
    int strokeCount;
}
struct DYNAMIC_RENDERER_CACHED_DATA
{
    int strokeId;
    IDynamicRenderer dynamicRenderer;
}
enum IID_IRealTimeStylus = GUID(0xa8bb5d22, 0x3144, 0x4a7b, [0x93, 0xcd, 0xf3, 0x4a, 0x16, 0xbe, 0x51, 0x3a]);
interface IRealTimeStylus : IUnknown
{
    HRESULT get_Enabled(BOOL*);
    HRESULT put_Enabled(BOOL);
    HRESULT get_HWND(HANDLE_PTR*);
    HRESULT put_HWND(HANDLE_PTR);
    HRESULT get_WindowInputRectangle(RECT*);
    HRESULT put_WindowInputRectangle(const(RECT)*);
    HRESULT AddStylusSyncPlugin(uint, IStylusSyncPlugin);
    HRESULT RemoveStylusSyncPlugin(uint, IStylusSyncPlugin*);
    HRESULT RemoveAllStylusSyncPlugins();
    HRESULT GetStylusSyncPlugin(uint, IStylusSyncPlugin*);
    HRESULT GetStylusSyncPluginCount(uint*);
    HRESULT AddStylusAsyncPlugin(uint, IStylusAsyncPlugin);
    HRESULT RemoveStylusAsyncPlugin(uint, IStylusAsyncPlugin*);
    HRESULT RemoveAllStylusAsyncPlugins();
    HRESULT GetStylusAsyncPlugin(uint, IStylusAsyncPlugin*);
    HRESULT GetStylusAsyncPluginCount(uint*);
    HRESULT get_ChildRealTimeStylusPlugin(IRealTimeStylus*);
    HRESULT putref_ChildRealTimeStylusPlugin(IRealTimeStylus);
    HRESULT AddCustomStylusDataToQueue(StylusQueue, const(GUID)*, uint, ubyte*);
    HRESULT ClearStylusQueues();
    HRESULT SetAllTabletsMode(BOOL);
    HRESULT SetSingleTabletMode(IInkTablet);
    HRESULT GetTablet(IInkTablet*);
    HRESULT GetTabletContextIdFromTablet(IInkTablet, uint*);
    HRESULT GetTabletFromTabletContextId(uint, IInkTablet*);
    HRESULT GetAllTabletContextIds(uint*, uint**);
    HRESULT GetStyluses(IInkCursors*);
    HRESULT GetStylusForId(uint, IInkCursor*);
    HRESULT SetDesiredPacketDescription(uint, const(GUID)*);
    HRESULT GetDesiredPacketDescription(uint*, GUID**);
    HRESULT GetPacketDescriptionData(uint, float*, float*, uint*, PACKET_PROPERTY**);
}
enum IID_IRealTimeStylus2 = GUID(0xb5f2a6cd, 0x3179, 0x4a3e, [0xb9, 0xc4, 0xbb, 0x58, 0x65, 0x96, 0x2b, 0xe2]);
interface IRealTimeStylus2 : IUnknown
{
    HRESULT get_FlicksEnabled(BOOL*);
    HRESULT put_FlicksEnabled(BOOL);
}
enum IID_IRealTimeStylus3 = GUID(0xd70230a3, 0x6986, 0x4051, [0xb5, 0x7a, 0x1c, 0xf6, 0x9f, 0x4d, 0x9d, 0xb5]);
interface IRealTimeStylus3 : IUnknown
{
    HRESULT get_MultiTouchEnabled(BOOL*);
    HRESULT put_MultiTouchEnabled(BOOL);
}
enum IID_IRealTimeStylusSynchronization = GUID(0xaa87eab8, 0xab4a, 0x4cea, [0xb5, 0xcb, 0x46, 0xd8, 0x4c, 0x6a, 0x25, 0x9]);
interface IRealTimeStylusSynchronization : IUnknown
{
    HRESULT AcquireLock(RealTimeStylusLockType);
    HRESULT ReleaseLock(RealTimeStylusLockType);
}
enum IID_IStrokeBuilder = GUID(0xa5fd4e2d, 0xc44b, 0x4092, [0x91, 0x77, 0x26, 0x9, 0x5, 0xeb, 0x67, 0x2b]);
interface IStrokeBuilder : IUnknown
{
    HRESULT CreateStroke(uint, const(int)*, uint, const(PACKET_PROPERTY)*, float, float, IInkStrokeDisp*);
    HRESULT BeginStroke(uint, uint, const(int)*, uint, PACKET_PROPERTY*, float, float, IInkStrokeDisp*);
    HRESULT AppendPackets(uint, uint, uint, const(int)*);
    HRESULT EndStroke(uint, uint, IInkStrokeDisp*, RECT*);
    HRESULT get_Ink(IInkDisp*);
    HRESULT putref_Ink(IInkDisp);
}
enum IID_IStylusPlugin = GUID(0xa81436d8, 0x4757, 0x4fd1, [0xa1, 0x85, 0x13, 0x3f, 0x97, 0xc6, 0xc5, 0x45]);
interface IStylusPlugin : IUnknown
{
    HRESULT RealTimeStylusEnabled(IRealTimeStylus, uint, const(uint)*);
    HRESULT RealTimeStylusDisabled(IRealTimeStylus, uint, const(uint)*);
    HRESULT StylusInRange(IRealTimeStylus, uint, uint);
    HRESULT StylusOutOfRange(IRealTimeStylus, uint, uint);
    HRESULT StylusDown(IRealTimeStylus, const(StylusInfo)*, uint, int*, int**);
    HRESULT StylusUp(IRealTimeStylus, const(StylusInfo)*, uint, int*, int**);
    HRESULT StylusButtonDown(IRealTimeStylus, uint, const(GUID)*, POINT*);
    HRESULT StylusButtonUp(IRealTimeStylus, uint, const(GUID)*, POINT*);
    HRESULT InAirPackets(IRealTimeStylus, const(StylusInfo)*, uint, uint, int*, uint*, int**);
    HRESULT Packets(IRealTimeStylus, const(StylusInfo)*, uint, uint, int*, uint*, int**);
    HRESULT CustomStylusDataAdded(IRealTimeStylus, const(GUID)*, uint, const(ubyte)*);
    HRESULT SystemEvent(IRealTimeStylus, uint, uint, ushort, SYSTEM_EVENT_DATA);
    HRESULT TabletAdded(IRealTimeStylus, IInkTablet);
    HRESULT TabletRemoved(IRealTimeStylus, int);
    HRESULT Error(IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, long*);
    HRESULT UpdateMapping(IRealTimeStylus);
    HRESULT DataInterest(RealTimeStylusDataInterest*);
}
enum IID_IStylusSyncPlugin = GUID(0xa157b174, 0x482f, 0x4d71, [0xa3, 0xf6, 0x3a, 0x41, 0xdd, 0xd1, 0x1b, 0xe9]);
interface IStylusSyncPlugin : IStylusPlugin
{
}
enum IID_IStylusAsyncPlugin = GUID(0xa7cca85a, 0x31bc, 0x4cd2, [0xaa, 0xdc, 0x32, 0x89, 0xa3, 0xaf, 0x11, 0xc8]);
interface IStylusAsyncPlugin : IStylusPlugin
{
}
enum IID_IDynamicRenderer = GUID(0xa079468e, 0x7165, 0x46f9, [0xb7, 0xaf, 0x98, 0xad, 0x1, 0xa9, 0x30, 0x9]);
interface IDynamicRenderer : IUnknown
{
    HRESULT get_Enabled(BOOL*);
    HRESULT put_Enabled(BOOL);
    HRESULT get_HWND(HANDLE_PTR*);
    HRESULT put_HWND(HANDLE_PTR);
    HRESULT get_ClipRectangle(RECT*);
    HRESULT put_ClipRectangle(const(RECT)*);
    HRESULT get_ClipRegion(HANDLE_PTR*);
    HRESULT put_ClipRegion(HANDLE_PTR);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes*);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes);
    HRESULT get_DataCacheEnabled(BOOL*);
    HRESULT put_DataCacheEnabled(BOOL);
    HRESULT ReleaseCachedData(uint);
    HRESULT Refresh();
    HRESULT Draw(HANDLE_PTR);
}
enum IID_IGestureRecognizer = GUID(0xae9ef86b, 0x7054, 0x45e3, [0xae, 0x22, 0x31, 0x74, 0xdc, 0x88, 0x11, 0xb7]);
interface IGestureRecognizer : IUnknown
{
    HRESULT get_Enabled(BOOL*);
    HRESULT put_Enabled(BOOL);
    HRESULT get_MaxStrokeCount(int*);
    HRESULT put_MaxStrokeCount(int);
    HRESULT EnableGestures(uint, const(int)*);
    HRESULT Reset();
}
struct RECO_GUIDE
{
    int xOrigin;
    int yOrigin;
    int cxBox;
    int cyBox;
    int cxBase;
    int cyBase;
    int cHorzBox;
    int cVertBox;
    int cyMid;
}
struct RECO_ATTRS
{
    uint dwRecoCapabilityFlags;
    wchar[32] awcVendorName;
    wchar[64] awcFriendlyName;
    ushort[64] awLanguageId;
}
struct RECO_RANGE
{
    uint iwcBegin;
    uint cCount;
}
struct LINE_SEGMENT
{
    POINT PtA;
    POINT PtB;
}
struct LATTICE_METRICS
{
    LINE_SEGMENT lsBaseline;
    short iMidlineOffset;
}
alias LINE_METRICS = int;
enum : int
{
    LM_BASELINE  = 0x00000000,
    LM_MIDLINE   = 0x00000001,
    LM_ASCENDER  = 0x00000002,
    LM_DESCENDER = 0x00000003,
}

alias CONFIDENCE_LEVEL = int;
enum : int
{
    CFL_STRONG       = 0x00000000,
    CFL_INTERMEDIATE = 0x00000001,
    CFL_POOR         = 0x00000002,
}

alias ALT_BREAKS = int;
enum : int
{
    ALT_BREAKS_SAME   = 0x00000000,
    ALT_BREAKS_UNIQUE = 0x00000001,
    ALT_BREAKS_FULL   = 0x00000002,
}

alias enumRECO_TYPE = int;
enum : int
{
    RECO_TYPE_WSTRING = 0x00000000,
    RECO_TYPE_WCHAR   = 0x00000001,
}

struct RECO_LATTICE_PROPERTY
{
    GUID guidProperty;
    ushort cbPropertyValue;
    ubyte* pPropertyValue;
}
struct RECO_LATTICE_PROPERTIES
{
    uint cProperties;
    RECO_LATTICE_PROPERTY** apProps;
}
struct RECO_LATTICE_ELEMENT
{
    int score;
    ushort type;
    ubyte* pData;
    uint ulNextColumn;
    uint ulStrokeNumber;
    RECO_LATTICE_PROPERTIES epProp;
}
struct RECO_LATTICE_COLUMN
{
    uint key;
    RECO_LATTICE_PROPERTIES cpProp;
    uint cStrokes;
    uint* pStrokes;
    uint cLatticeElements;
    RECO_LATTICE_ELEMENT* pLatticeElements;
}
struct RECO_LATTICE
{
    uint ulColumnCount;
    RECO_LATTICE_COLUMN* pLatticeColumns;
    uint ulPropertyCount;
    GUID* pGuidProperties;
    uint ulBestResultColumnCount;
    uint* pulBestResultColumns;
    uint* pulBestResultIndexes;
}
struct CHARACTER_RANGE
{
    wchar wcLow;
    ushort cChars;
}
enum CLSID_TipAutoCompleteClient = GUID(0x807c1e6c, 0x1d00, 0x453f, [0xb9, 0x20, 0xb6, 0x1b, 0xb7, 0xcd, 0xd9, 0x97]);
struct TipAutoCompleteClient
{
}
enum IID_ITipAutoCompleteProvider = GUID(0x7c6cf46d, 0x8404, 0x46b9, [0xad, 0x33, 0xf5, 0xb6, 0x3, 0x6d, 0x40, 0x7]);
interface ITipAutoCompleteProvider : IUnknown
{
    HRESULT UpdatePendingText(BSTR);
    HRESULT Show(BOOL);
}
enum IID_ITipAutoCompleteClient = GUID(0x5e078e03, 0x8265, 0x4bbe, [0x94, 0x87, 0xd2, 0x42, 0xed, 0xbe, 0xf9, 0x10]);
interface ITipAutoCompleteClient : IUnknown
{
    HRESULT AdviseProvider(HWND, ITipAutoCompleteProvider);
    HRESULT UnadviseProvider(HWND, ITipAutoCompleteProvider);
    HRESULT UserSelection();
    HRESULT PreferredRects(RECT*, RECT*, RECT*, BOOL*);
    HRESULT RequestShowUI(HWND, BOOL*);
}
