module windows.win32.ui.tabletpc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, COLORREF, HANDLE_PTR, HRESULT, HWND, POINT, PWSTR, RECT, VARIANT_BOOL;
import windows.win32.graphics.gdi : XFORM;
import windows.win32.system.com : IDataObject, IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.ole : IFontDisp, IPictureDisp, OLE_HANDLE;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.controls : NMHDR;

version (Windows):
extern (Windows):

alias PfnRecoCallback = HRESULT function(uint param0, ubyte* param1, HRECOCONTEXT param2);
HRESULT CreateRecognizer(GUID* pCLSID, HRECOGNIZER* phrec);
HRESULT DestroyRecognizer(HRECOGNIZER hrec);
HRESULT GetRecoAttributes(HRECOGNIZER hrec, RECO_ATTRS* pRecoAttrs);
HRESULT CreateContext(HRECOGNIZER hrec, HRECOCONTEXT* phrc);
HRESULT DestroyContext(HRECOCONTEXT hrc);
HRESULT GetResultPropertyList(HRECOGNIZER hrec, uint* pPropertyCount, GUID* pPropertyGuid);
HRESULT GetUnicodeRanges(HRECOGNIZER hrec, uint* pcRanges, CHARACTER_RANGE* pcr);
HRESULT AddStroke(HRECOCONTEXT hrc, const(PACKET_DESCRIPTION)* pPacketDesc, uint cbPacket, const(ubyte)* pPacket, const(XFORM)* pXForm);
HRESULT GetBestResultString(HRECOCONTEXT hrc, uint* pcSize, PWSTR pwcBestResult);
HRESULT SetGuide(HRECOCONTEXT hrc, const(RECO_GUIDE)* pGuide, uint iIndex);
HRESULT AdviseInkChange(HRECOCONTEXT hrc, BOOL bNewStroke);
HRESULT EndInkInput(HRECOCONTEXT hrc);
HRESULT Process(HRECOCONTEXT hrc, BOOL* pbPartialProcessing);
HRESULT SetFactoid(HRECOCONTEXT hrc, uint cwcFactoid, const(wchar)* pwcFactoid);
HRESULT SetFlags(HRECOCONTEXT hrc, uint dwFlags);
HRESULT GetLatticePtr(HRECOCONTEXT hrc, RECO_LATTICE** ppLattice);
HRESULT SetTextContext(HRECOCONTEXT hrc, uint cwcBefore, const(wchar)* pwcBefore, uint cwcAfter, const(wchar)* pwcAfter);
HRESULT SetEnabledUnicodeRanges(HRECOCONTEXT hrc, uint cRanges, CHARACTER_RANGE* pcr);
HRESULT IsStringSupported(HRECOCONTEXT hrc, uint wcString, const(wchar)* pwcString);
HRESULT SetWordList(HRECOCONTEXT hrc, HRECOWORDLIST hwl);
HRESULT GetRightSeparator(HRECOCONTEXT hrc, uint* pcSize, PWSTR pwcRightSeparator);
HRESULT GetLeftSeparator(HRECOCONTEXT hrc, uint* pcSize, PWSTR pwcLeftSeparator);
HRESULT DestroyWordList(HRECOWORDLIST hwl);
HRESULT AddWordsToWordList(HRECOWORDLIST hwl, PWSTR pwcWords);
HRESULT MakeWordList(HRECOGNIZER hrec, PWSTR pBuffer, HRECOWORDLIST* phwl);
HRESULT GetAllRecognizers(GUID** recognizerClsids, uint* count);
HRESULT LoadCachedAttributes(GUID clsid, RECO_ATTRS* pRecoAttributes);
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
alias INK_METRIC_FLAGS = int;
enum : int
{
    IMF_FONT_SELECTED_IN_HDC = 0x00000001,
    IMF_ITALIC               = 0x00000002,
    IMF_BOLD                 = 0x00000004,
}

alias GET_DANDIDATE_FLAGS = int;
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
    COLORREF color;
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
    HRESULT get_Top(int* Units);
    HRESULT put_Top(int Units);
    HRESULT get_Left(int* Units);
    HRESULT put_Left(int Units);
    HRESULT get_Bottom(int* Units);
    HRESULT put_Bottom(int Units);
    HRESULT get_Right(int* Units);
    HRESULT put_Right(int Units);
    HRESULT get_Data(RECT* Rect);
    HRESULT put_Data(RECT Rect);
    HRESULT GetRectangle(int* Top, int* Left, int* Bottom, int* Right);
    HRESULT SetRectangle(int Top, int Left, int Bottom, int Right);
}
enum IID_IInkExtendedProperty = GUID(0xdb489209, 0xb7c3, 0x411d, [0x90, 0xf6, 0x15, 0x48, 0xcf, 0xff, 0x27, 0x1e]);
interface IInkExtendedProperty : IDispatch
{
    HRESULT get_Guid(BSTR* Guid);
    HRESULT get_Data(VARIANT* Data);
    HRESULT put_Data(VARIANT Data);
}
enum IID_IInkExtendedProperties = GUID(0x89f2a8be, 0x95a9, 0x4530, [0x8b, 0x8f, 0x88, 0xe9, 0x71, 0xe3, 0xe2, 0x5f]);
interface IInkExtendedProperties : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT Item(VARIANT Identifier, IInkExtendedProperty* Item);
    HRESULT Add(BSTR Guid, VARIANT Data, IInkExtendedProperty* InkExtendedProperty);
    HRESULT Remove(VARIANT Identifier);
    HRESULT Clear();
    HRESULT DoesPropertyExist(BSTR Guid, VARIANT_BOOL* DoesPropertyExist);
}
enum IID_IInkDrawingAttributes = GUID(0xbf519b75, 0xa15, 0x4623, [0xad, 0xc9, 0xc0, 0xd, 0x43, 0x6a, 0x80, 0x92]);
interface IInkDrawingAttributes : IDispatch
{
    HRESULT get_Color(int* CurrentColor);
    HRESULT put_Color(int NewColor);
    HRESULT get_Width(float* CurrentWidth);
    HRESULT put_Width(float NewWidth);
    HRESULT get_Height(float* CurrentHeight);
    HRESULT put_Height(float NewHeight);
    HRESULT get_FitToCurve(VARIANT_BOOL* Flag);
    HRESULT put_FitToCurve(VARIANT_BOOL Flag);
    HRESULT get_IgnorePressure(VARIANT_BOOL* Flag);
    HRESULT put_IgnorePressure(VARIANT_BOOL Flag);
    HRESULT get_AntiAliased(VARIANT_BOOL* Flag);
    HRESULT put_AntiAliased(VARIANT_BOOL Flag);
    HRESULT get_Transparency(int* CurrentTransparency);
    HRESULT put_Transparency(int NewTransparency);
    HRESULT get_RasterOperation(InkRasterOperation* CurrentRasterOperation);
    HRESULT put_RasterOperation(InkRasterOperation NewRasterOperation);
    HRESULT get_PenTip(InkPenTip* CurrentPenTip);
    HRESULT put_PenTip(InkPenTip NewPenTip);
    HRESULT get_ExtendedProperties(IInkExtendedProperties* Properties);
    HRESULT Clone(IInkDrawingAttributes* DrawingAttributes);
}
enum IID_IInkTransform = GUID(0x615f1d43, 0x8703, 0x4565, [0x88, 0xe2, 0x82, 0x1, 0xd2, 0xec, 0xd7, 0xb7]);
interface IInkTransform : IDispatch
{
    HRESULT Reset();
    HRESULT Translate(float HorizontalComponent, float VerticalComponent);
    HRESULT Rotate(float Degrees, float x, float y);
    HRESULT Reflect(VARIANT_BOOL Horizontally, VARIANT_BOOL Vertically);
    HRESULT Shear(float HorizontalComponent, float VerticalComponent);
    HRESULT ScaleTransform(float HorizontalMultiplier, float VerticalMultiplier);
    HRESULT GetTransform(float* eM11, float* eM12, float* eM21, float* eM22, float* eDx, float* eDy);
    HRESULT SetTransform(float eM11, float eM12, float eM21, float eM22, float eDx, float eDy);
    HRESULT get_eM11(float* Value);
    HRESULT put_eM11(float Value);
    HRESULT get_eM12(float* Value);
    HRESULT put_eM12(float Value);
    HRESULT get_eM21(float* Value);
    HRESULT put_eM21(float Value);
    HRESULT get_eM22(float* Value);
    HRESULT put_eM22(float Value);
    HRESULT get_eDx(float* Value);
    HRESULT put_eDx(float Value);
    HRESULT get_eDy(float* Value);
    HRESULT put_eDy(float Value);
    HRESULT get_Data(XFORM* XForm);
    HRESULT put_Data(XFORM XForm);
}
enum IID_IInkGesture = GUID(0x3bdc0a97, 0x4e5, 0x4e26, [0xb8, 0x13, 0x18, 0xf0, 0x52, 0xd4, 0x1d, 0xef]);
interface IInkGesture : IDispatch
{
    HRESULT get_Confidence(InkRecognitionConfidence* Confidence);
    HRESULT get_Id(InkApplicationGesture* Id);
    HRESULT GetHotPoint(int* X, int* Y);
}
enum IID_IInkCursor = GUID(0xad30c630, 0x40c5, 0x4350, [0x84, 0x5, 0x9c, 0x71, 0x1, 0x2f, 0xc5, 0x58]);
interface IInkCursor : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Id(int* Id);
    HRESULT get_Inverted(VARIANT_BOOL* Status);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes* Attributes);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes Attributes);
    HRESULT get_Tablet(IInkTablet* Tablet);
    HRESULT get_Buttons(IInkCursorButtons* Buttons);
}
enum IID_IInkCursors = GUID(0xa248c1ac, 0xc698, 0x4e06, [0x9e, 0x5c, 0xd5, 0x7f, 0x77, 0xc7, 0xe6, 0x47]);
interface IInkCursors : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT Item(int Index, IInkCursor* Cursor);
}
enum IID_IInkCursorButton = GUID(0x85ef9417, 0x1d59, 0x49b2, [0xa1, 0x3c, 0x70, 0x2c, 0x85, 0x43, 0x8, 0x94]);
interface IInkCursorButton : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Id(BSTR* Id);
    HRESULT get_State(InkCursorButtonState* CurrentState);
}
enum IID_IInkCursorButtons = GUID(0x3671cc40, 0xb624, 0x4671, [0x9f, 0xa0, 0xdb, 0x11, 0x9d, 0x95, 0x2d, 0x54]);
interface IInkCursorButtons : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT Item(VARIANT Identifier, IInkCursorButton* Button);
}
enum IID_IInkTablet = GUID(0x2de25eaa, 0x6ef8, 0x42d5, [0xae, 0xe9, 0x18, 0x5b, 0xc8, 0x1b, 0x91, 0x2d]);
interface IInkTablet : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_PlugAndPlayId(BSTR* Id);
    HRESULT get_MaximumInputRectangle(IInkRectangle* Rectangle);
    HRESULT get_HardwareCapabilities(TabletHardwareCapabilities* Capabilities);
    HRESULT IsPacketPropertySupported(BSTR packetPropertyName, VARIANT_BOOL* Supported);
    HRESULT GetPropertyMetrics(BSTR propertyName, int* Minimum, int* Maximum, TabletPropertyMetricUnit* Units, float* Resolution);
}
enum IID_IInkTablet2 = GUID(0x90c91ad2, 0xfa36, 0x49d6, [0x95, 0x16, 0xce, 0x8d, 0x57, 0xf, 0x6f, 0x85]);
interface IInkTablet2 : IDispatch
{
    HRESULT get_DeviceKind(TabletDeviceKind* Kind);
}
enum IID_IInkTablet3 = GUID(0x7e313997, 0x1327, 0x41dd, [0x8c, 0xa9, 0x79, 0xf2, 0x4b, 0xe1, 0x72, 0x50]);
interface IInkTablet3 : IDispatch
{
    HRESULT get_IsMultiTouch(VARIANT_BOOL* pIsMultiTouch);
    HRESULT get_MaximumCursors(uint* pMaximumCursors);
}
enum IID_IInkTablets = GUID(0x112086d9, 0x7779, 0x4535, [0xa6, 0x99, 0x86, 0x2b, 0x43, 0xac, 0x18, 0x63]);
interface IInkTablets : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT get_DefaultTablet(IInkTablet* DefaultTablet);
    HRESULT Item(int Index, IInkTablet* Tablet);
    HRESULT IsPacketPropertySupported(BSTR packetPropertyName, VARIANT_BOOL* Supported);
}
enum IID_IInkStrokeDisp = GUID(0x43242fea, 0x91d1, 0x4a72, [0x96, 0x3e, 0xfb, 0xb9, 0x18, 0x29, 0xcf, 0xa2]);
interface IInkStrokeDisp : IDispatch
{
    HRESULT get_ID(int* ID);
    HRESULT get_BezierPoints(VARIANT* Points);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes* DrawAttrs);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes DrawAttrs);
    HRESULT get_Ink(IInkDisp* Ink);
    HRESULT get_ExtendedProperties(IInkExtendedProperties* Properties);
    HRESULT get_PolylineCusps(VARIANT* Cusps);
    HRESULT get_BezierCusps(VARIANT* Cusps);
    HRESULT get_SelfIntersections(VARIANT* Intersections);
    HRESULT get_PacketCount(int* plCount);
    HRESULT get_PacketSize(int* plSize);
    HRESULT get_PacketDescription(VARIANT* PacketDescription);
    HRESULT get_Deleted(VARIANT_BOOL* Deleted);
    HRESULT GetBoundingBox(InkBoundingBoxMode BoundingBoxMode, IInkRectangle* Rectangle);
    HRESULT FindIntersections(IInkStrokes Strokes, VARIANT* Intersections);
    HRESULT GetRectangleIntersections(IInkRectangle Rectangle, VARIANT* Intersections);
    HRESULT Clip(IInkRectangle Rectangle);
    HRESULT HitTestCircle(int X, int Y, float Radius, VARIANT_BOOL* Intersects);
    HRESULT NearestPoint(int X, int Y, float* Distance, float* Point);
    HRESULT Split(float SplitAt, IInkStrokeDisp* NewStroke);
    HRESULT GetPacketDescriptionPropertyMetrics(BSTR PropertyName, int* Minimum, int* Maximum, TabletPropertyMetricUnit* Units, float* Resolution);
    HRESULT GetPoints(int Index, int Count, VARIANT* Points);
    HRESULT SetPoints(VARIANT Points, int Index, int Count, int* NumberOfPointsSet);
    HRESULT GetPacketData(int Index, int Count, VARIANT* PacketData);
    HRESULT GetPacketValuesByProperty(BSTR PropertyName, int Index, int Count, VARIANT* PacketValues);
    HRESULT SetPacketValuesByProperty(BSTR bstrPropertyName, VARIANT PacketValues, int Index, int Count, int* NumberOfPacketsSet);
    HRESULT GetFlattenedBezierPoints(int FittingError, VARIANT* FlattenedBezierPoints);
    HRESULT Transform(IInkTransform Transform, VARIANT_BOOL ApplyOnPenWidth);
    HRESULT ScaleToRectangle(IInkRectangle Rectangle);
    HRESULT Move(float HorizontalComponent, float VerticalComponent);
    HRESULT Rotate(float Degrees, float x, float y);
    HRESULT Shear(float HorizontalMultiplier, float VerticalMultiplier);
    HRESULT ScaleTransform(float HorizontalMultiplier, float VerticalMultiplier);
}
enum IID_IInkStrokes = GUID(0xf1f4c9d8, 0x590a, 0x4963, [0xb3, 0xae, 0x19, 0x35, 0x67, 0x1b, 0xb6, 0xf3]);
interface IInkStrokes : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT get_Ink(IInkDisp* Ink);
    HRESULT get_RecognitionResult(IInkRecognitionResult* RecognitionResult);
    HRESULT ToString(BSTR* ToString);
    HRESULT Item(int Index, IInkStrokeDisp* Stroke);
    HRESULT Add(IInkStrokeDisp InkStroke);
    HRESULT AddStrokes(IInkStrokes InkStrokes);
    HRESULT Remove(IInkStrokeDisp InkStroke);
    HRESULT RemoveStrokes(IInkStrokes InkStrokes);
    HRESULT ModifyDrawingAttributes(IInkDrawingAttributes DrawAttrs);
    HRESULT GetBoundingBox(InkBoundingBoxMode BoundingBoxMode, IInkRectangle* BoundingBox);
    HRESULT Transform(IInkTransform Transform, VARIANT_BOOL ApplyOnPenWidth);
    HRESULT ScaleToRectangle(IInkRectangle Rectangle);
    HRESULT Move(float HorizontalComponent, float VerticalComponent);
    HRESULT Rotate(float Degrees, float x, float y);
    HRESULT Shear(float HorizontalMultiplier, float VerticalMultiplier);
    HRESULT ScaleTransform(float HorizontalMultiplier, float VerticalMultiplier);
    HRESULT Clip(IInkRectangle Rectangle);
    HRESULT RemoveRecognitionResult();
}
enum IID_IInkCustomStrokes = GUID(0x7e23a88f, 0xc30e, 0x420f, [0x9b, 0xdb, 0x28, 0x90, 0x25, 0x43, 0xf0, 0xc1]);
interface IInkCustomStrokes : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT Item(VARIANT Identifier, IInkStrokes* Strokes);
    HRESULT Add(BSTR Name, IInkStrokes Strokes);
    HRESULT Remove(VARIANT Identifier);
    HRESULT Clear();
}
enum IID__IInkStrokesEvents = GUID(0xf33053ec, 0x5d25, 0x430a, [0x92, 0x8f, 0x76, 0xa6, 0x49, 0x1d, 0xde, 0x15]);
interface _IInkStrokesEvents : IDispatch
{
}
enum IID_IInkDisp = GUID(0x9d398fa0, 0xc4e2, 0x4fcd, [0x99, 0x73, 0x97, 0x5c, 0xaa, 0xf4, 0x7e, 0xa6]);
interface IInkDisp : IDispatch
{
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT get_ExtendedProperties(IInkExtendedProperties* Properties);
    HRESULT get_Dirty(VARIANT_BOOL* Dirty);
    HRESULT put_Dirty(VARIANT_BOOL Dirty);
    HRESULT get_CustomStrokes(IInkCustomStrokes* ppunkInkCustomStrokes);
    HRESULT GetBoundingBox(InkBoundingBoxMode BoundingBoxMode, IInkRectangle* Rectangle);
    HRESULT DeleteStrokes(IInkStrokes Strokes);
    HRESULT DeleteStroke(IInkStrokeDisp Stroke);
    HRESULT ExtractStrokes(IInkStrokes Strokes, InkExtractFlags ExtractFlags, IInkDisp* ExtractedInk);
    HRESULT ExtractWithRectangle(IInkRectangle Rectangle, InkExtractFlags extractFlags, IInkDisp* ExtractedInk);
    HRESULT Clip(IInkRectangle Rectangle);
    HRESULT Clone(IInkDisp* NewInk);
    HRESULT HitTestCircle(int X, int Y, float radius, IInkStrokes* Strokes);
    HRESULT HitTestWithRectangle(IInkRectangle SelectionRectangle, float IntersectPercent, IInkStrokes* Strokes);
    HRESULT HitTestWithLasso(VARIANT Points, float IntersectPercent, VARIANT* LassoPoints, IInkStrokes* Strokes);
    HRESULT NearestPoint(int X, int Y, float* PointOnStroke, float* DistanceFromPacket, IInkStrokeDisp* Stroke);
    HRESULT CreateStrokes(VARIANT StrokeIds, IInkStrokes* Strokes);
    HRESULT AddStrokesAtRectangle(IInkStrokes SourceStrokes, IInkRectangle TargetRectangle);
    HRESULT Save(InkPersistenceFormat PersistenceFormat, InkPersistenceCompressionMode CompressionMode, VARIANT* Data);
    HRESULT Load(VARIANT Data);
    HRESULT CreateStroke(VARIANT PacketData, VARIANT PacketDescription, IInkStrokeDisp* Stroke);
    HRESULT ClipboardCopyWithRectangle(IInkRectangle Rectangle, InkClipboardFormats ClipboardFormats, InkClipboardModes ClipboardModes, IDataObject* DataObject);
    HRESULT ClipboardCopy(IInkStrokes strokes, InkClipboardFormats ClipboardFormats, InkClipboardModes ClipboardModes, IDataObject* DataObject);
    HRESULT CanPaste(IDataObject DataObject, VARIANT_BOOL* CanPaste);
    HRESULT ClipboardPaste(int x, int y, IDataObject DataObject, IInkStrokes* Strokes);
}
enum IID__IInkEvents = GUID(0x427b1865, 0xca3f, 0x479a, [0x83, 0xa9, 0xf, 0x42, 0xf, 0x2a, 0x0, 0x73]);
interface _IInkEvents : IDispatch
{
}
enum IID_IInkRenderer = GUID(0xe6257a9c, 0xb511, 0x4f4c, [0xa8, 0xb0, 0xa7, 0xdb, 0xc9, 0x50, 0x6b, 0x83]);
interface IInkRenderer : IDispatch
{
    HRESULT GetViewTransform(IInkTransform ViewTransform);
    HRESULT SetViewTransform(IInkTransform ViewTransform);
    HRESULT GetObjectTransform(IInkTransform ObjectTransform);
    HRESULT SetObjectTransform(IInkTransform ObjectTransform);
    HRESULT Draw(long hDC, IInkStrokes Strokes);
    HRESULT DrawStroke(long hDC, IInkStrokeDisp Stroke, IInkDrawingAttributes DrawingAttributes);
    HRESULT PixelToInkSpace(long hDC, int* x, int* y);
    HRESULT InkSpaceToPixel(long hdcDisplay, int* x, int* y);
    HRESULT PixelToInkSpaceFromPoints(long hDC, VARIANT* Points);
    HRESULT InkSpaceToPixelFromPoints(long hDC, VARIANT* Points);
    HRESULT Measure(IInkStrokes Strokes, IInkRectangle* Rectangle);
    HRESULT MeasureStroke(IInkStrokeDisp Stroke, IInkDrawingAttributes DrawingAttributes, IInkRectangle* Rectangle);
    HRESULT Move(float HorizontalComponent, float VerticalComponent);
    HRESULT Rotate(float Degrees, float x, float y);
    HRESULT ScaleTransform(float HorizontalMultiplier, float VerticalMultiplier, VARIANT_BOOL ApplyOnPenWidth);
}
enum IID_IInkCollector = GUID(0xf0f060b5, 0x8b1f, 0x4a7c, [0x89, 0xec, 0x88, 0x6, 0x92, 0x58, 0x8a, 0x4f]);
interface IInkCollector : IDispatch
{
    HRESULT get_hWnd(long* CurrentWindow);
    HRESULT put_hWnd(long NewWindow);
    HRESULT get_Enabled(VARIANT_BOOL* Collecting);
    HRESULT put_Enabled(VARIANT_BOOL Collecting);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes* CurrentAttributes);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes NewAttributes);
    HRESULT get_Renderer(IInkRenderer* CurrentInkRenderer);
    HRESULT putref_Renderer(IInkRenderer NewInkRenderer);
    HRESULT get_Ink(IInkDisp* Ink);
    HRESULT putref_Ink(IInkDisp NewInk);
    HRESULT get_AutoRedraw(VARIANT_BOOL* AutoRedraw);
    HRESULT put_AutoRedraw(VARIANT_BOOL AutoRedraw);
    HRESULT get_CollectingInk(VARIANT_BOOL* Collecting);
    HRESULT get_CollectionMode(InkCollectionMode* Mode);
    HRESULT put_CollectionMode(InkCollectionMode Mode);
    HRESULT get_DynamicRendering(VARIANT_BOOL* Enabled);
    HRESULT put_DynamicRendering(VARIANT_BOOL Enabled);
    HRESULT get_DesiredPacketDescription(VARIANT* PacketGuids);
    HRESULT put_DesiredPacketDescription(VARIANT PacketGuids);
    HRESULT get_MouseIcon(IPictureDisp* MouseIcon);
    HRESULT put_MouseIcon(IPictureDisp MouseIcon);
    HRESULT putref_MouseIcon(IPictureDisp MouseIcon);
    HRESULT get_MousePointer(InkMousePointer* MousePointer);
    HRESULT put_MousePointer(InkMousePointer MousePointer);
    HRESULT get_Cursors(IInkCursors* Cursors);
    HRESULT get_MarginX(int* MarginX);
    HRESULT put_MarginX(int MarginX);
    HRESULT get_MarginY(int* MarginY);
    HRESULT put_MarginY(int MarginY);
    HRESULT get_Tablet(IInkTablet* SingleTablet);
    HRESULT get_SupportHighContrastInk(VARIANT_BOOL* Support);
    HRESULT put_SupportHighContrastInk(VARIANT_BOOL Support);
    HRESULT SetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL Listen);
    HRESULT GetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL* Listening);
    HRESULT GetWindowInputRectangle(IInkRectangle* WindowInputRectangle);
    HRESULT SetWindowInputRectangle(IInkRectangle WindowInputRectangle);
    HRESULT SetAllTabletsMode(VARIANT_BOOL UseMouseForInput);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet Tablet);
    HRESULT GetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL* Listen);
    HRESULT SetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL Listen);
}
enum IID__IInkCollectorEvents = GUID(0x11a583f2, 0x712d, 0x4fea, [0xab, 0xcf, 0xab, 0x4a, 0xf3, 0x8e, 0xa0, 0x6b]);
interface _IInkCollectorEvents : IDispatch
{
}
enum IID_IInkOverlay = GUID(0xb82a463b, 0xc1c5, 0x45a3, [0x99, 0x7c, 0xde, 0xab, 0x56, 0x51, 0xb6, 0x7a]);
interface IInkOverlay : IDispatch
{
    HRESULT get_hWnd(long* CurrentWindow);
    HRESULT put_hWnd(long NewWindow);
    HRESULT get_Enabled(VARIANT_BOOL* Collecting);
    HRESULT put_Enabled(VARIANT_BOOL Collecting);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes* CurrentAttributes);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes NewAttributes);
    HRESULT get_Renderer(IInkRenderer* CurrentInkRenderer);
    HRESULT putref_Renderer(IInkRenderer NewInkRenderer);
    HRESULT get_Ink(IInkDisp* Ink);
    HRESULT putref_Ink(IInkDisp NewInk);
    HRESULT get_AutoRedraw(VARIANT_BOOL* AutoRedraw);
    HRESULT put_AutoRedraw(VARIANT_BOOL AutoRedraw);
    HRESULT get_CollectingInk(VARIANT_BOOL* Collecting);
    HRESULT get_CollectionMode(InkCollectionMode* Mode);
    HRESULT put_CollectionMode(InkCollectionMode Mode);
    HRESULT get_DynamicRendering(VARIANT_BOOL* Enabled);
    HRESULT put_DynamicRendering(VARIANT_BOOL Enabled);
    HRESULT get_DesiredPacketDescription(VARIANT* PacketGuids);
    HRESULT put_DesiredPacketDescription(VARIANT PacketGuids);
    HRESULT get_MouseIcon(IPictureDisp* MouseIcon);
    HRESULT put_MouseIcon(IPictureDisp MouseIcon);
    HRESULT putref_MouseIcon(IPictureDisp MouseIcon);
    HRESULT get_MousePointer(InkMousePointer* MousePointer);
    HRESULT put_MousePointer(InkMousePointer MousePointer);
    HRESULT get_EditingMode(InkOverlayEditingMode* EditingMode);
    HRESULT put_EditingMode(InkOverlayEditingMode EditingMode);
    HRESULT get_Selection(IInkStrokes* Selection);
    HRESULT put_Selection(IInkStrokes Selection);
    HRESULT get_EraserMode(InkOverlayEraserMode* EraserMode);
    HRESULT put_EraserMode(InkOverlayEraserMode EraserMode);
    HRESULT get_EraserWidth(int* EraserWidth);
    HRESULT put_EraserWidth(int newEraserWidth);
    HRESULT get_AttachMode(InkOverlayAttachMode* AttachMode);
    HRESULT put_AttachMode(InkOverlayAttachMode AttachMode);
    HRESULT get_Cursors(IInkCursors* Cursors);
    HRESULT get_MarginX(int* MarginX);
    HRESULT put_MarginX(int MarginX);
    HRESULT get_MarginY(int* MarginY);
    HRESULT put_MarginY(int MarginY);
    HRESULT get_Tablet(IInkTablet* SingleTablet);
    HRESULT get_SupportHighContrastInk(VARIANT_BOOL* Support);
    HRESULT put_SupportHighContrastInk(VARIANT_BOOL Support);
    HRESULT get_SupportHighContrastSelectionUI(VARIANT_BOOL* Support);
    HRESULT put_SupportHighContrastSelectionUI(VARIANT_BOOL Support);
    HRESULT HitTestSelection(int x, int y, SelectionHitResult* SelArea);
    HRESULT Draw(IInkRectangle Rect);
    HRESULT SetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL Listen);
    HRESULT GetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL* Listening);
    HRESULT GetWindowInputRectangle(IInkRectangle* WindowInputRectangle);
    HRESULT SetWindowInputRectangle(IInkRectangle WindowInputRectangle);
    HRESULT SetAllTabletsMode(VARIANT_BOOL UseMouseForInput);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet Tablet);
    HRESULT GetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL* Listen);
    HRESULT SetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL Listen);
}
enum IID__IInkOverlayEvents = GUID(0x31179b69, 0xe563, 0x489e, [0xb1, 0x6f, 0x71, 0x2f, 0x1e, 0x8a, 0x6, 0x51]);
interface _IInkOverlayEvents : IDispatch
{
}
enum IID_IInkPicture = GUID(0xe85662e0, 0x379a, 0x40d7, [0x9b, 0x5c, 0x75, 0x7d, 0x23, 0x3f, 0x99, 0x23]);
interface IInkPicture : IDispatch
{
    HRESULT get_hWnd(long* CurrentWindow);
    HRESULT get_DefaultDrawingAttributes(IInkDrawingAttributes* CurrentAttributes);
    HRESULT putref_DefaultDrawingAttributes(IInkDrawingAttributes NewAttributes);
    HRESULT get_Renderer(IInkRenderer* CurrentInkRenderer);
    HRESULT putref_Renderer(IInkRenderer NewInkRenderer);
    HRESULT get_Ink(IInkDisp* Ink);
    HRESULT putref_Ink(IInkDisp NewInk);
    HRESULT get_AutoRedraw(VARIANT_BOOL* AutoRedraw);
    HRESULT put_AutoRedraw(VARIANT_BOOL AutoRedraw);
    HRESULT get_CollectingInk(VARIANT_BOOL* Collecting);
    HRESULT get_CollectionMode(InkCollectionMode* Mode);
    HRESULT put_CollectionMode(InkCollectionMode Mode);
    HRESULT get_DynamicRendering(VARIANT_BOOL* Enabled);
    HRESULT put_DynamicRendering(VARIANT_BOOL Enabled);
    HRESULT get_DesiredPacketDescription(VARIANT* PacketGuids);
    HRESULT put_DesiredPacketDescription(VARIANT PacketGuids);
    HRESULT get_MouseIcon(IPictureDisp* MouseIcon);
    HRESULT put_MouseIcon(IPictureDisp MouseIcon);
    HRESULT putref_MouseIcon(IPictureDisp MouseIcon);
    HRESULT get_MousePointer(InkMousePointer* MousePointer);
    HRESULT put_MousePointer(InkMousePointer MousePointer);
    HRESULT get_EditingMode(InkOverlayEditingMode* EditingMode);
    HRESULT put_EditingMode(InkOverlayEditingMode EditingMode);
    HRESULT get_Selection(IInkStrokes* Selection);
    HRESULT put_Selection(IInkStrokes Selection);
    HRESULT get_EraserMode(InkOverlayEraserMode* EraserMode);
    HRESULT put_EraserMode(InkOverlayEraserMode EraserMode);
    HRESULT get_EraserWidth(int* EraserWidth);
    HRESULT put_EraserWidth(int newEraserWidth);
    HRESULT putref_Picture(IPictureDisp pPicture);
    HRESULT put_Picture(IPictureDisp pPicture);
    HRESULT get_Picture(IPictureDisp* ppPicture);
    HRESULT put_SizeMode(InkPictureSizeMode smNewSizeMode);
    HRESULT get_SizeMode(InkPictureSizeMode* smSizeMode);
    HRESULT put_BackColor(uint newColor);
    HRESULT get_BackColor(uint* pColor);
    HRESULT get_Cursors(IInkCursors* Cursors);
    HRESULT get_MarginX(int* MarginX);
    HRESULT put_MarginX(int MarginX);
    HRESULT get_MarginY(int* MarginY);
    HRESULT put_MarginY(int MarginY);
    HRESULT get_Tablet(IInkTablet* SingleTablet);
    HRESULT get_SupportHighContrastInk(VARIANT_BOOL* Support);
    HRESULT put_SupportHighContrastInk(VARIANT_BOOL Support);
    HRESULT get_SupportHighContrastSelectionUI(VARIANT_BOOL* Support);
    HRESULT put_SupportHighContrastSelectionUI(VARIANT_BOOL Support);
    HRESULT HitTestSelection(int x, int y, SelectionHitResult* SelArea);
    HRESULT SetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL Listen);
    HRESULT GetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL* Listening);
    HRESULT GetWindowInputRectangle(IInkRectangle* WindowInputRectangle);
    HRESULT SetWindowInputRectangle(IInkRectangle WindowInputRectangle);
    HRESULT SetAllTabletsMode(VARIANT_BOOL UseMouseForInput);
    HRESULT SetSingleTabletIntegratedMode(IInkTablet Tablet);
    HRESULT GetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL* Listen);
    HRESULT SetEventInterest(InkCollectorEventInterest EventId, VARIANT_BOOL Listen);
    HRESULT get_InkEnabled(VARIANT_BOOL* Collecting);
    HRESULT put_InkEnabled(VARIANT_BOOL Collecting);
    HRESULT get_Enabled(VARIANT_BOOL* pbool);
    HRESULT put_Enabled(VARIANT_BOOL vbool);
}
enum IID__IInkPictureEvents = GUID(0x60ff4fee, 0x22ff, 0x4484, [0xac, 0xc1, 0xd3, 0x8, 0xd9, 0xcd, 0x7e, 0xa3]);
interface _IInkPictureEvents : IDispatch
{
}
enum IID_IInkRecognizer = GUID(0x782bf7cf, 0x34b, 0x4396, [0x8a, 0x32, 0x3a, 0x18, 0x33, 0xcf, 0x6b, 0x56]);
interface IInkRecognizer : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Vendor(BSTR* Vendor);
    HRESULT get_Capabilities(InkRecognizerCapabilities* CapabilitiesFlags);
    HRESULT get_Languages(VARIANT* Languages);
    HRESULT get_SupportedProperties(VARIANT* SupportedProperties);
    HRESULT get_PreferredPacketDescription(VARIANT* PreferredPacketDescription);
    HRESULT CreateRecognizerContext(IInkRecognizerContext* Context);
}
enum IID_IInkRecognizer2 = GUID(0x6110118a, 0x3a75, 0x4ad6, [0xb2, 0xaa, 0x4, 0xb2, 0xb7, 0x2b, 0xbe, 0x65]);
interface IInkRecognizer2 : IDispatch
{
    HRESULT get_Id(BSTR* pbstrId);
    HRESULT get_UnicodeRanges(VARIANT* UnicodeRanges);
}
enum IID_IInkRecognizers = GUID(0x9ccc4f12, 0xb0b7, 0x4a8b, [0xbf, 0x58, 0x4a, 0xec, 0xa4, 0xe8, 0xce, 0xfd]);
interface IInkRecognizers : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT GetDefaultRecognizer(int lcid, IInkRecognizer* DefaultRecognizer);
    HRESULT Item(int Index, IInkRecognizer* InkRecognizer);
}
enum IID__IInkRecognitionEvents = GUID(0x17bce92f, 0x2e21, 0x47fd, [0x9d, 0x33, 0x3c, 0x6a, 0xfb, 0xfd, 0x8c, 0x59]);
interface _IInkRecognitionEvents : IDispatch
{
}
enum IID_IInkRecognizerContext = GUID(0xc68f52f9, 0x32a3, 0x4625, [0x90, 0x6c, 0x44, 0xfc, 0x23, 0xb4, 0x9, 0x58]);
interface IInkRecognizerContext : IDispatch
{
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT putref_Strokes(IInkStrokes Strokes);
    HRESULT get_CharacterAutoCompletionMode(InkRecognizerCharacterAutoCompletionMode* Mode);
    HRESULT put_CharacterAutoCompletionMode(InkRecognizerCharacterAutoCompletionMode Mode);
    HRESULT get_Factoid(BSTR* Factoid);
    HRESULT put_Factoid(BSTR factoid);
    HRESULT get_Guide(IInkRecognizerGuide* RecognizerGuide);
    HRESULT putref_Guide(IInkRecognizerGuide RecognizerGuide);
    HRESULT get_PrefixText(BSTR* Prefix);
    HRESULT put_PrefixText(BSTR Prefix);
    HRESULT get_SuffixText(BSTR* Suffix);
    HRESULT put_SuffixText(BSTR Suffix);
    HRESULT get_RecognitionFlags(InkRecognitionModes* Modes);
    HRESULT put_RecognitionFlags(InkRecognitionModes Modes);
    HRESULT get_WordList(IInkWordList* WordList);
    HRESULT putref_WordList(IInkWordList WordList);
    HRESULT get_Recognizer(IInkRecognizer* Recognizer);
    HRESULT Recognize(InkRecognitionStatus* RecognitionStatus, IInkRecognitionResult* RecognitionResult);
    HRESULT StopBackgroundRecognition();
    HRESULT EndInkInput();
    HRESULT BackgroundRecognize(VARIANT CustomData);
    HRESULT BackgroundRecognizeWithAlternates(VARIANT CustomData);
    HRESULT Clone(IInkRecognizerContext* RecoContext);
    HRESULT IsStringSupported(BSTR String, VARIANT_BOOL* Supported);
}
enum IID_IInkRecognizerContext2 = GUID(0xd6f0e32f, 0x73d8, 0x408e, [0x8e, 0x9f, 0x5f, 0xea, 0x59, 0x2c, 0x36, 0x3f]);
interface IInkRecognizerContext2 : IDispatch
{
    HRESULT get_EnabledUnicodeRanges(VARIANT* UnicodeRanges);
    HRESULT put_EnabledUnicodeRanges(VARIANT UnicodeRanges);
}
enum IID_IInkRecognitionResult = GUID(0x3bc129a8, 0x86cd, 0x45ad, [0xbd, 0xe8, 0xe0, 0xd3, 0x2d, 0x61, 0xc1, 0x6d]);
interface IInkRecognitionResult : IDispatch
{
    HRESULT get_TopString(BSTR* TopString);
    HRESULT get_TopAlternate(IInkRecognitionAlternate* TopAlternate);
    HRESULT get_TopConfidence(InkRecognitionConfidence* TopConfidence);
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT AlternatesFromSelection(int selectionStart, int selectionLength, int maximumAlternates, IInkRecognitionAlternates* AlternatesFromSelection);
    HRESULT ModifyTopAlternate(IInkRecognitionAlternate Alternate);
    HRESULT SetResultOnStrokes();
}
enum IID_IInkRecognitionAlternate = GUID(0xb7e660ad, 0x77e4, 0x429b, [0xad, 0xda, 0x87, 0x37, 0x80, 0xd1, 0xfc, 0x4a]);
interface IInkRecognitionAlternate : IDispatch
{
    HRESULT get_String(BSTR* RecoString);
    HRESULT get_Confidence(InkRecognitionConfidence* Confidence);
    HRESULT get_Baseline(VARIANT* Baseline);
    HRESULT get_Midline(VARIANT* Midline);
    HRESULT get_Ascender(VARIANT* Ascender);
    HRESULT get_Descender(VARIANT* Descender);
    HRESULT get_LineNumber(int* LineNumber);
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT get_LineAlternates(IInkRecognitionAlternates* LineAlternates);
    HRESULT get_ConfidenceAlternates(IInkRecognitionAlternates* ConfidenceAlternates);
    HRESULT GetStrokesFromStrokeRanges(IInkStrokes Strokes, IInkStrokes* GetStrokesFromStrokeRanges);
    HRESULT GetStrokesFromTextRange(int* selectionStart, int* selectionLength, IInkStrokes* GetStrokesFromTextRange);
    HRESULT GetTextRangeFromStrokes(IInkStrokes Strokes, int* selectionStart, int* selectionLength);
    HRESULT AlternatesWithConstantPropertyValues(BSTR PropertyType, IInkRecognitionAlternates* AlternatesWithConstantPropertyValues);
    HRESULT GetPropertyValue(BSTR PropertyType, VARIANT* PropertyValue);
}
enum IID_IInkRecognitionAlternates = GUID(0x286a167f, 0x9f19, 0x4c61, [0x9d, 0x53, 0x4f, 0x7, 0xbe, 0x62, 0x2b, 0x84]);
interface IInkRecognitionAlternates : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT Item(int Index, IInkRecognitionAlternate* InkRecoAlternate);
}
enum IID_IInkRecognizerGuide = GUID(0xd934be07, 0x7b84, 0x4208, [0x91, 0x36, 0x83, 0xc2, 0x9, 0x94, 0xe9, 0x5]);
interface IInkRecognizerGuide : IDispatch
{
    HRESULT get_WritingBox(IInkRectangle* Rectangle);
    HRESULT put_WritingBox(IInkRectangle Rectangle);
    HRESULT get_DrawnBox(IInkRectangle* Rectangle);
    HRESULT put_DrawnBox(IInkRectangle Rectangle);
    HRESULT get_Rows(int* Units);
    HRESULT put_Rows(int Units);
    HRESULT get_Columns(int* Units);
    HRESULT put_Columns(int Units);
    HRESULT get_Midline(int* Units);
    HRESULT put_Midline(int Units);
    HRESULT get_GuideData(InkRecoGuide* pRecoGuide);
    HRESULT put_GuideData(InkRecoGuide recoGuide);
}
enum IID_IInkWordList = GUID(0x76ba3491, 0xcb2f, 0x406b, [0x99, 0x61, 0xe, 0xc, 0x4c, 0xda, 0xae, 0xf2]);
interface IInkWordList : IDispatch
{
    HRESULT AddWord(BSTR NewWord);
    HRESULT RemoveWord(BSTR RemoveWord);
    HRESULT Merge(IInkWordList MergeWordList);
}
enum IID_IInkWordList2 = GUID(0x14542586, 0x11bf, 0x4f5f, [0xb6, 0xe7, 0x49, 0xd0, 0x74, 0x4a, 0xab, 0x6e]);
interface IInkWordList2 : IDispatch
{
    HRESULT AddWords(BSTR NewWords);
}
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
enum IID_IInk = GUID(0x3f8e511, 0x43a1, 0x11d3, [0x8b, 0xb6, 0x0, 0x80, 0xc7, 0xd6, 0xba, 0xd5]);
interface IInk : IDispatch
{
}
enum IID_IInkLineInfo = GUID(0x9c1c5ad6, 0xf22f, 0x4de4, [0xb4, 0x53, 0xa2, 0xcc, 0x48, 0x2e, 0x7c, 0x33]);
interface IInkLineInfo : IUnknown
{
    HRESULT SetFormat(INKMETRIC* pim);
    HRESULT GetFormat(INKMETRIC* pim);
    HRESULT GetInkExtent(INKMETRIC* pim, uint* pnWidth);
    HRESULT GetCandidate(uint nCandidateNum, PWSTR pwcRecogWord, uint* pcwcRecogWord, uint dwFlags);
    HRESULT SetCandidate(uint nCandidateNum, PWSTR strRecogWord);
    HRESULT Recognize();
}
enum IID_ISketchInk = GUID(0xb4563688, 0x98eb, 0x4646, [0xb2, 0x79, 0x44, 0xda, 0x14, 0xd4, 0x57, 0x48]);
interface ISketchInk : IDispatch
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
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT putref_Strokes(IInkStrokes Strokes);
    HRESULT get_RecognizerContext(IInkRecognizerContext* RecognizerContext);
    HRESULT putref_RecognizerContext(IInkRecognizerContext RecognizerContext);
    HRESULT get_LineHeight(int* LineHeight);
    HRESULT put_LineHeight(int LineHeight);
    HRESULT Divide(IInkDivisionResult* InkDivisionResult);
}
enum IID_IInkDivisionResult = GUID(0x2dbec0a7, 0x74c7, 0x4b38, [0x81, 0xeb, 0xaa, 0x8e, 0xf0, 0xc2, 0x49, 0x0]);
interface IInkDivisionResult : IDispatch
{
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT ResultByType(InkDivisionType divisionType, IInkDivisionUnits* InkDivisionUnits);
}
enum IID_IInkDivisionUnit = GUID(0x85aee342, 0x48b0, 0x4244, [0x9d, 0xd5, 0x1e, 0xd4, 0x35, 0x41, 0xf, 0xab]);
interface IInkDivisionUnit : IDispatch
{
    HRESULT get_Strokes(IInkStrokes* Strokes);
    HRESULT get_DivisionType(InkDivisionType* divisionType);
    HRESULT get_RecognizedString(BSTR* RecoString);
    HRESULT get_RotationTransform(IInkTransform* RotationTransform);
}
enum IID_IInkDivisionUnits = GUID(0x1bb5ddc2, 0x31cc, 0x4135, [0xab, 0x82, 0x2c, 0x66, 0xc9, 0xf0, 0xc, 0x41]);
interface IInkDivisionUnits : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT get__NewEnum(IUnknown* _NewEnum);
    HRESULT Item(int Index, IInkDivisionUnit* InkDivisionUnit);
}
enum CLSID_InkDivider = GUID(0x8854f6a0, 0x4683, 0x4ae7, [0x91, 0x91, 0x75, 0x2f, 0xe6, 0x46, 0x12, 0xc3]);
struct InkDivider
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
    HRESULT get_Busy(VARIANT_BOOL* Busy);
    HRESULT get_Factoid(BSTR* Factoid);
    HRESULT put_Factoid(BSTR Factoid);
    HRESULT get_AttachedEditWindow(int* AttachedEditWindow);
    HRESULT put_AttachedEditWindow(int AttachedEditWindow);
    HRESULT get_CurrentPanel(PanelType* CurrentPanel);
    HRESULT put_CurrentPanel(PanelType CurrentPanel);
    HRESULT get_DefaultPanel(PanelType* pDefaultPanel);
    HRESULT put_DefaultPanel(PanelType DefaultPanel);
    HRESULT get_Visible(VARIANT_BOOL* Visible);
    HRESULT put_Visible(VARIANT_BOOL Visible);
    HRESULT get_Top(int* Top);
    HRESULT get_Left(int* Left);
    HRESULT get_Width(int* Width);
    HRESULT get_Height(int* Height);
    HRESULT get_VerticalOffset(int* VerticalOffset);
    HRESULT put_VerticalOffset(int VerticalOffset);
    HRESULT get_HorizontalOffset(int* HorizontalOffset);
    HRESULT put_HorizontalOffset(int HorizontalOffset);
    HRESULT get_AutoShow(VARIANT_BOOL* pAutoShow);
    HRESULT put_AutoShow(VARIANT_BOOL AutoShow);
    HRESULT MoveTo(int Left, int Top);
    HRESULT CommitPendingInput();
    HRESULT Refresh();
    HRESULT EnableTsf(VARIANT_BOOL Enable);
}
enum IID__IPenInputPanelEvents = GUID(0xb7e489da, 0x3719, 0x439f, [0x84, 0x8f, 0xe7, 0xac, 0xbd, 0x82, 0xf, 0x17]);
interface _IPenInputPanelEvents : IDispatch
{
}
enum IID_IHandwrittenTextInsertion = GUID(0x56fdea97, 0xecd6, 0x43e7, [0xaa, 0x3a, 0x81, 0x6b, 0xe7, 0x78, 0x58, 0x60]);
interface IHandwrittenTextInsertion : IUnknown
{
    HRESULT InsertRecognitionResultsArray(SAFEARRAY* psaAlternates, uint locale, BOOL fAlternateContainsAutoSpacingInformation);
    HRESULT InsertInkRecognitionResult(IInkRecognitionResult pIInkRecoResult, uint locale, BOOL fAlternateContainsAutoSpacingInformation);
}
enum CLSID_HandwrittenTextInsertion = GUID(0x9f074ee2, 0xe6e9, 0x4d8a, [0xa0, 0x47, 0xeb, 0x5b, 0x5c, 0x3c, 0x55, 0xda]);
struct HandwrittenTextInsertion
{
}
enum CLSID_PenInputPanel = GUID(0xf744e496, 0x1b5a, 0x489e, [0x81, 0xdc, 0xfb, 0xd7, 0xac, 0x62, 0x98, 0xa8]);
struct PenInputPanel
{
}
enum IID_ITextInputPanelEventSink = GUID(0x27560408, 0x8e64, 0x4fe1, [0x80, 0x4e, 0x42, 0x12, 0x1, 0x58, 0x4b, 0x31]);
interface ITextInputPanelEventSink : IUnknown
{
    HRESULT InPlaceStateChanging(InPlaceState oldInPlaceState, InPlaceState newInPlaceState);
    HRESULT InPlaceStateChanged(InPlaceState oldInPlaceState, InPlaceState newInPlaceState);
    HRESULT InPlaceSizeChanging(RECT oldBoundingRectangle, RECT newBoundingRectangle);
    HRESULT InPlaceSizeChanged(RECT oldBoundingRectangle, RECT newBoundingRectangle);
    HRESULT InputAreaChanging(PanelInputArea oldInputArea, PanelInputArea newInputArea);
    HRESULT InputAreaChanged(PanelInputArea oldInputArea, PanelInputArea newInputArea);
    HRESULT CorrectionModeChanging(CorrectionMode oldCorrectionMode, CorrectionMode newCorrectionMode);
    HRESULT CorrectionModeChanged(CorrectionMode oldCorrectionMode, CorrectionMode newCorrectionMode);
    HRESULT InPlaceVisibilityChanging(BOOL oldVisible, BOOL newVisible);
    HRESULT InPlaceVisibilityChanged(BOOL oldVisible, BOOL newVisible);
    HRESULT TextInserting(SAFEARRAY* Ink);
    HRESULT TextInserted(SAFEARRAY* Ink);
}
enum IID_ITextInputPanel = GUID(0x6b6a65a5, 0x6af3, 0x46c2, [0xb6, 0xea, 0x56, 0xcd, 0x1f, 0x80, 0xdf, 0x71]);
interface ITextInputPanel : IUnknown
{
    HRESULT get_AttachedEditWindow(HWND* AttachedEditWindow);
    HRESULT put_AttachedEditWindow(HWND AttachedEditWindow);
    HRESULT get_CurrentInteractionMode(InteractionMode* CurrentInteractionMode);
    HRESULT get_DefaultInPlaceState(InPlaceState* State);
    HRESULT put_DefaultInPlaceState(InPlaceState State);
    HRESULT get_CurrentInPlaceState(InPlaceState* State);
    HRESULT get_DefaultInputArea(PanelInputArea* Area);
    HRESULT put_DefaultInputArea(PanelInputArea Area);
    HRESULT get_CurrentInputArea(PanelInputArea* Area);
    HRESULT get_CurrentCorrectionMode(CorrectionMode* Mode);
    HRESULT get_PreferredInPlaceDirection(InPlaceDirection* Direction);
    HRESULT put_PreferredInPlaceDirection(InPlaceDirection Direction);
    HRESULT get_ExpandPostInsertionCorrection(BOOL* Expand);
    HRESULT put_ExpandPostInsertionCorrection(BOOL Expand);
    HRESULT get_InPlaceVisibleOnFocus(BOOL* Visible);
    HRESULT put_InPlaceVisibleOnFocus(BOOL Visible);
    HRESULT get_InPlaceBoundingRectangle(RECT* BoundingRectangle);
    HRESULT get_PopUpCorrectionHeight(int* Height);
    HRESULT get_PopDownCorrectionHeight(int* Height);
    HRESULT CommitPendingInput();
    HRESULT SetInPlaceVisibility(BOOL Visible);
    HRESULT SetInPlacePosition(int xPosition, int yPosition, CorrectionPosition position);
    HRESULT SetInPlaceHoverTargetPosition(int xPosition, int yPosition);
    HRESULT Advise(ITextInputPanelEventSink EventSink, uint EventMask);
    HRESULT Unadvise(ITextInputPanelEventSink EventSink);
}
enum IID_IInputPanelWindowHandle = GUID(0x4af81847, 0xfdc4, 0x4fc3, [0xad, 0xb, 0x42, 0x24, 0x79, 0xc1, 0xb9, 0x35]);
interface IInputPanelWindowHandle : IUnknown
{
    HRESULT get_AttachedEditWindow32(int* AttachedEditWindow);
    HRESULT put_AttachedEditWindow32(int AttachedEditWindow);
    HRESULT get_AttachedEditWindow64(long* AttachedEditWindow);
    HRESULT put_AttachedEditWindow64(long AttachedEditWindow);
}
enum IID_ITextInputPanelRunInfo = GUID(0x9f424568, 0x1920, 0x48cc, [0x98, 0x11, 0xa9, 0x93, 0xcb, 0xf5, 0xad, 0xba]);
interface ITextInputPanelRunInfo : IUnknown
{
    HRESULT IsTipRunning(BOOL* pfRunning);
}
enum CLSID_TextInputPanel = GUID(0xf9b189d7, 0x228b, 0x4f2b, [0x86, 0x50, 0xb9, 0x7f, 0x59, 0xe0, 0x2c, 0x8c]);
struct TextInputPanel
{
}
enum CLSID_PenInputPanel_Internal = GUID(0x802b1fb9, 0x56b, 0x4720, [0xb0, 0xcc, 0x80, 0xd2, 0x3b, 0x71, 0x17, 0x1e]);
struct PenInputPanel_Internal
{
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
    HRESULT get_Status(InkEditStatus* pStatus);
    HRESULT get_UseMouseForInput(VARIANT_BOOL* pVal);
    HRESULT put_UseMouseForInput(VARIANT_BOOL newVal);
    HRESULT get_InkMode(InkMode* pVal);
    HRESULT put_InkMode(InkMode newVal);
    HRESULT get_InkInsertMode(InkInsertMode* pVal);
    HRESULT put_InkInsertMode(InkInsertMode newVal);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes* pVal);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes newVal);
    HRESULT get_RecognitionTimeout(int* pVal);
    HRESULT put_RecognitionTimeout(int newVal);
    HRESULT get_Recognizer(IInkRecognizer* pVal);
    HRESULT putref_Recognizer(IInkRecognizer newVal);
    HRESULT get_Factoid(BSTR* pVal);
    HRESULT put_Factoid(BSTR newVal);
    HRESULT get_SelInks(VARIANT* pSelInk);
    HRESULT put_SelInks(VARIANT SelInk);
    HRESULT get_SelInksDisplayMode(InkDisplayMode* pInkDisplayMode);
    HRESULT put_SelInksDisplayMode(InkDisplayMode InkDisplayMode);
    HRESULT Recognize();
    HRESULT GetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL* pListen);
    HRESULT SetGestureStatus(InkApplicationGesture Gesture, VARIANT_BOOL Listen);
    HRESULT put_BackColor(uint clr);
    HRESULT get_BackColor(uint* pclr);
    HRESULT get_Appearance(AppearanceConstants* pAppearance);
    HRESULT put_Appearance(AppearanceConstants pAppearance);
    HRESULT get_BorderStyle(BorderStyleConstants* pBorderStyle);
    HRESULT put_BorderStyle(BorderStyleConstants pBorderStyle);
    HRESULT get_Hwnd(OLE_HANDLE* pohHwnd);
    HRESULT get_Font(IFontDisp* ppFont);
    HRESULT putref_Font(IFontDisp ppFont);
    HRESULT get_Text(BSTR* pbstrText);
    HRESULT put_Text(BSTR pbstrText);
    HRESULT get_MouseIcon(IPictureDisp* MouseIcon);
    HRESULT put_MouseIcon(IPictureDisp MouseIcon);
    HRESULT putref_MouseIcon(IPictureDisp MouseIcon);
    HRESULT get_MousePointer(InkMousePointer* MousePointer);
    HRESULT put_MousePointer(InkMousePointer MousePointer);
    HRESULT get_Locked(VARIANT_BOOL* pVal);
    HRESULT put_Locked(VARIANT_BOOL newVal);
    HRESULT get_Enabled(VARIANT_BOOL* pVal);
    HRESULT put_Enabled(VARIANT_BOOL newVal);
    HRESULT get_MaxLength(int* plMaxLength);
    HRESULT put_MaxLength(int lMaxLength);
    HRESULT get_MultiLine(VARIANT_BOOL* pVal);
    HRESULT put_MultiLine(VARIANT_BOOL newVal);
    HRESULT get_ScrollBars(ScrollBarsConstants* pVal);
    HRESULT put_ScrollBars(ScrollBarsConstants newVal);
    HRESULT get_DisableNoScroll(VARIANT_BOOL* pVal);
    HRESULT put_DisableNoScroll(VARIANT_BOOL newVal);
    HRESULT get_SelAlignment(VARIANT* pvarSelAlignment);
    HRESULT put_SelAlignment(VARIANT pvarSelAlignment);
    HRESULT get_SelBold(VARIANT* pvarSelBold);
    HRESULT put_SelBold(VARIANT pvarSelBold);
    HRESULT get_SelItalic(VARIANT* pvarSelItalic);
    HRESULT put_SelItalic(VARIANT pvarSelItalic);
    HRESULT get_SelUnderline(VARIANT* pvarSelUnderline);
    HRESULT put_SelUnderline(VARIANT pvarSelUnderline);
    HRESULT get_SelColor(VARIANT* pvarSelColor);
    HRESULT put_SelColor(VARIANT pvarSelColor);
    HRESULT get_SelFontName(VARIANT* pvarSelFontName);
    HRESULT put_SelFontName(VARIANT pvarSelFontName);
    HRESULT get_SelFontSize(VARIANT* pvarSelFontSize);
    HRESULT put_SelFontSize(VARIANT pvarSelFontSize);
    HRESULT get_SelCharOffset(VARIANT* pvarSelCharOffset);
    HRESULT put_SelCharOffset(VARIANT pvarSelCharOffset);
    HRESULT get_TextRTF(BSTR* pbstrTextRTF);
    HRESULT put_TextRTF(BSTR pbstrTextRTF);
    HRESULT get_SelStart(int* plSelStart);
    HRESULT put_SelStart(int plSelStart);
    HRESULT get_SelLength(int* plSelLength);
    HRESULT put_SelLength(int plSelLength);
    HRESULT get_SelText(BSTR* pbstrSelText);
    HRESULT put_SelText(BSTR pbstrSelText);
    HRESULT get_SelRTF(BSTR* pbstrSelRTF);
    HRESULT put_SelRTF(BSTR pbstrSelRTF);
    HRESULT Refresh();
}
enum IID__IInkEditEvents = GUID(0xe3b0b797, 0xa72e, 0x46db, [0xa0, 0xd7, 0x6c, 0x9e, 0xba, 0x8e, 0x9b, 0xbc]);
interface _IInkEditEvents : IDispatch
{
}
enum CLSID_InkEdit = GUID(0xe5ca59f5, 0x57c4, 0x4dd8, [0x9b, 0xd6, 0x1d, 0xee, 0xed, 0xd2, 0x7a, 0xf4]);
struct InkEdit
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
    HRESULT IsVisible(VARIANT_BOOL* pvbShown);
    HRESULT GetPosition(int* Left, int* Top, int* Right, int* Bottom);
    HRESULT SetPosition(int Left, int Top, int Right, int Bottom);
    HRESULT Clear();
    HRESULT SetCustomPaint(int Element, VARIANT_BOOL Paint);
    HRESULT SetCaptionText(BSTR CaptionText);
    HRESULT LoadInk(IInkDisp Ink);
    HRESULT SetOwnerWindow(long OwnerWindow);
    HRESULT EnableExtendedButtons(VARIANT_BOOL Extended);
    HRESULT GetPreviewHeight(int* Height);
    HRESULT SetPreviewHeight(int Height);
    HRESULT EnableAutoGrow(VARIANT_BOOL AutoGrow);
    HRESULT AddFunctionName(BSTR FunctionName);
    HRESULT RemoveFunctionName(BSTR FunctionName);
    HRESULT GetHoverIcon(IPictureDisp* HoverImage);
}
enum IID__IMathInputControlEvents = GUID(0x683336b5, 0xa47d, 0x4358, [0x96, 0xf9, 0x87, 0x5a, 0x47, 0x2a, 0xe7, 0xa]);
interface _IMathInputControlEvents : IDispatch
{
}
enum CLSID_MathInputControl = GUID(0xc561816c, 0x14d8, 0x4090, [0x83, 0xc, 0x98, 0xd9, 0x94, 0xb2, 0x1c, 0x7b]);
struct MathInputControl
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
    HRESULT get_Enabled(BOOL* pfEnable);
    HRESULT put_Enabled(BOOL fEnable);
    HRESULT get_HWND(HANDLE_PTR* phwnd);
    HRESULT put_HWND(HANDLE_PTR hwnd);
    HRESULT get_WindowInputRectangle(RECT* prcWndInputRect);
    HRESULT put_WindowInputRectangle(const(RECT)* prcWndInputRect);
    HRESULT AddStylusSyncPlugin(uint iIndex, IStylusSyncPlugin piPlugin);
    HRESULT RemoveStylusSyncPlugin(uint iIndex, IStylusSyncPlugin* ppiPlugin);
    HRESULT RemoveAllStylusSyncPlugins();
    HRESULT GetStylusSyncPlugin(uint iIndex, IStylusSyncPlugin* ppiPlugin);
    HRESULT GetStylusSyncPluginCount(uint* pcPlugins);
    HRESULT AddStylusAsyncPlugin(uint iIndex, IStylusAsyncPlugin piPlugin);
    HRESULT RemoveStylusAsyncPlugin(uint iIndex, IStylusAsyncPlugin* ppiPlugin);
    HRESULT RemoveAllStylusAsyncPlugins();
    HRESULT GetStylusAsyncPlugin(uint iIndex, IStylusAsyncPlugin* ppiPlugin);
    HRESULT GetStylusAsyncPluginCount(uint* pcPlugins);
    HRESULT get_ChildRealTimeStylusPlugin(IRealTimeStylus* ppiRTS);
    HRESULT putref_ChildRealTimeStylusPlugin(IRealTimeStylus piRTS);
    HRESULT AddCustomStylusDataToQueue(StylusQueue sq, const(GUID)* pGuidId, uint cbData, ubyte* pbData);
    HRESULT ClearStylusQueues();
    HRESULT SetAllTabletsMode(BOOL fUseMouseForInput);
    HRESULT SetSingleTabletMode(IInkTablet piTablet);
    HRESULT GetTablet(IInkTablet* ppiSingleTablet);
    HRESULT GetTabletContextIdFromTablet(IInkTablet piTablet, uint* ptcid);
    HRESULT GetTabletFromTabletContextId(uint tcid, IInkTablet* ppiTablet);
    HRESULT GetAllTabletContextIds(uint* pcTcidCount, uint** ppTcids);
    HRESULT GetStyluses(IInkCursors* ppiInkCursors);
    HRESULT GetStylusForId(uint sid, IInkCursor* ppiInkCursor);
    HRESULT SetDesiredPacketDescription(uint cProperties, const(GUID)* pPropertyGuids);
    HRESULT GetDesiredPacketDescription(uint* pcProperties, GUID** ppPropertyGuids);
    HRESULT GetPacketDescriptionData(uint tcid, float* pfInkToDeviceScaleX, float* pfInkToDeviceScaleY, uint* pcPacketProperties, PACKET_PROPERTY** ppPacketProperties);
}
enum IID_IRealTimeStylus2 = GUID(0xb5f2a6cd, 0x3179, 0x4a3e, [0xb9, 0xc4, 0xbb, 0x58, 0x65, 0x96, 0x2b, 0xe2]);
interface IRealTimeStylus2 : IUnknown
{
    HRESULT get_FlicksEnabled(BOOL* pfEnable);
    HRESULT put_FlicksEnabled(BOOL fEnable);
}
enum IID_IRealTimeStylus3 = GUID(0xd70230a3, 0x6986, 0x4051, [0xb5, 0x7a, 0x1c, 0xf6, 0x9f, 0x4d, 0x9d, 0xb5]);
interface IRealTimeStylus3 : IUnknown
{
    HRESULT get_MultiTouchEnabled(BOOL* pfEnable);
    HRESULT put_MultiTouchEnabled(BOOL fEnable);
}
enum IID_IRealTimeStylusSynchronization = GUID(0xaa87eab8, 0xab4a, 0x4cea, [0xb5, 0xcb, 0x46, 0xd8, 0x4c, 0x6a, 0x25, 0x9]);
interface IRealTimeStylusSynchronization : IUnknown
{
    HRESULT AcquireLock(RealTimeStylusLockType lock);
    HRESULT ReleaseLock(RealTimeStylusLockType lock);
}
enum IID_IStrokeBuilder = GUID(0xa5fd4e2d, 0xc44b, 0x4092, [0x91, 0x77, 0x26, 0x9, 0x5, 0xeb, 0x67, 0x2b]);
interface IStrokeBuilder : IUnknown
{
    HRESULT CreateStroke(uint cPktBuffLength, const(int)* pPackets, uint cPacketProperties, const(PACKET_PROPERTY)* pPacketProperties, float fInkToDeviceScaleX, float fInkToDeviceScaleY, IInkStrokeDisp* ppIInkStroke);
    HRESULT BeginStroke(uint tcid, uint sid, const(int)* pPacket, uint cPacketProperties, PACKET_PROPERTY* pPacketProperties, float fInkToDeviceScaleX, float fInkToDeviceScaleY, IInkStrokeDisp* ppIInkStroke);
    HRESULT AppendPackets(uint tcid, uint sid, uint cPktBuffLength, const(int)* pPackets);
    HRESULT EndStroke(uint tcid, uint sid, IInkStrokeDisp* ppIInkStroke, RECT* pDirtyRect);
    HRESULT get_Ink(IInkDisp* ppiInkObj);
    HRESULT putref_Ink(IInkDisp piInkObj);
}
enum IID_IStylusPlugin = GUID(0xa81436d8, 0x4757, 0x4fd1, [0xa1, 0x85, 0x13, 0x3f, 0x97, 0xc6, 0xc5, 0x45]);
interface IStylusPlugin : IUnknown
{
    HRESULT RealTimeStylusEnabled(IRealTimeStylus piRtsSrc, uint cTcidCount, const(uint)* pTcids);
    HRESULT RealTimeStylusDisabled(IRealTimeStylus piRtsSrc, uint cTcidCount, const(uint)* pTcids);
    HRESULT StylusInRange(IRealTimeStylus piRtsSrc, uint tcid, uint sid);
    HRESULT StylusOutOfRange(IRealTimeStylus piRtsSrc, uint tcid, uint sid);
    HRESULT StylusDown(IRealTimeStylus piRtsSrc, const(StylusInfo)* pStylusInfo, uint cPropCountPerPkt, int* pPacket, int** ppInOutPkt);
    HRESULT StylusUp(IRealTimeStylus piRtsSrc, const(StylusInfo)* pStylusInfo, uint cPropCountPerPkt, int* pPacket, int** ppInOutPkt);
    HRESULT StylusButtonDown(IRealTimeStylus piRtsSrc, uint sid, const(GUID)* pGuidStylusButton, POINT* pStylusPos);
    HRESULT StylusButtonUp(IRealTimeStylus piRtsSrc, uint sid, const(GUID)* pGuidStylusButton, POINT* pStylusPos);
    HRESULT InAirPackets(IRealTimeStylus piRtsSrc, const(StylusInfo)* pStylusInfo, uint cPktCount, uint cPktBuffLength, int* pPackets, uint* pcInOutPkts, int** ppInOutPkts);
    HRESULT Packets(IRealTimeStylus piRtsSrc, const(StylusInfo)* pStylusInfo, uint cPktCount, uint cPktBuffLength, int* pPackets, uint* pcInOutPkts, int** ppInOutPkts);
    HRESULT CustomStylusDataAdded(IRealTimeStylus piRtsSrc, const(GUID)* pGuidId, uint cbData, const(ubyte)* pbData);
    HRESULT SystemEvent(IRealTimeStylus piRtsSrc, uint tcid, uint sid, ushort event, SYSTEM_EVENT_DATA eventdata);
    HRESULT TabletAdded(IRealTimeStylus piRtsSrc, IInkTablet piTablet);
    HRESULT TabletRemoved(IRealTimeStylus piRtsSrc, int iTabletIndex);
    HRESULT Error(IRealTimeStylus piRtsSrc, IStylusPlugin piPlugin, RealTimeStylusDataInterest dataInterest, HRESULT hrErrorCode, long* lptrKey);
    HRESULT UpdateMapping(IRealTimeStylus piRtsSrc);
    HRESULT DataInterest(RealTimeStylusDataInterest* pDataInterest);
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
    HRESULT get_Enabled(BOOL* bEnabled);
    HRESULT put_Enabled(BOOL bEnabled);
    HRESULT get_HWND(HANDLE_PTR* hwnd);
    HRESULT put_HWND(HANDLE_PTR hwnd);
    HRESULT get_ClipRectangle(RECT* prcClipRect);
    HRESULT put_ClipRectangle(const(RECT)* prcClipRect);
    HRESULT get_ClipRegion(HANDLE_PTR* phClipRgn);
    HRESULT put_ClipRegion(HANDLE_PTR hClipRgn);
    HRESULT get_DrawingAttributes(IInkDrawingAttributes* ppiDA);
    HRESULT putref_DrawingAttributes(IInkDrawingAttributes piDA);
    HRESULT get_DataCacheEnabled(BOOL* pfCacheData);
    HRESULT put_DataCacheEnabled(BOOL fCacheData);
    HRESULT ReleaseCachedData(uint strokeId);
    HRESULT Refresh();
    HRESULT Draw(HANDLE_PTR hDC);
}
enum IID_IGestureRecognizer = GUID(0xae9ef86b, 0x7054, 0x45e3, [0xae, 0x22, 0x31, 0x74, 0xdc, 0x88, 0x11, 0xb7]);
interface IGestureRecognizer : IUnknown
{
    HRESULT get_Enabled(BOOL* pfEnabled);
    HRESULT put_Enabled(BOOL fEnabled);
    HRESULT get_MaxStrokeCount(int* pcStrokes);
    HRESULT put_MaxStrokeCount(int cStrokes);
    HRESULT EnableGestures(uint cGestures, const(int)* pGestures);
    HRESULT Reset();
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

alias RECO_TYPE = int;
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
enum IID_ITipAutoCompleteProvider = GUID(0x7c6cf46d, 0x8404, 0x46b9, [0xad, 0x33, 0xf5, 0xb6, 0x3, 0x6d, 0x40, 0x7]);
interface ITipAutoCompleteProvider : IUnknown
{
    HRESULT UpdatePendingText(BSTR bstrPendingText);
    HRESULT Show(BOOL fShow);
}
enum IID_ITipAutoCompleteClient = GUID(0x5e078e03, 0x8265, 0x4bbe, [0x94, 0x87, 0xd2, 0x42, 0xed, 0xbe, 0xf9, 0x10]);
interface ITipAutoCompleteClient : IUnknown
{
    HRESULT AdviseProvider(HWND hWndField, ITipAutoCompleteProvider pIProvider);
    HRESULT UnadviseProvider(HWND hWndField, ITipAutoCompleteProvider pIProvider);
    HRESULT UserSelection();
    HRESULT PreferredRects(RECT* prcACList, RECT* prcField, RECT* prcModifiedACList, BOOL* pfShownAboveTip);
    HRESULT RequestShowUI(HWND hWndList, BOOL* pfAllowShowing);
}
enum CLSID_TipAutoCompleteClient = GUID(0x807c1e6c, 0x1d00, 0x453f, [0xb9, 0x20, 0xb6, 0x1b, 0xb7, 0xcd, 0xd9, 0x97]);
struct TipAutoCompleteClient
{
}
