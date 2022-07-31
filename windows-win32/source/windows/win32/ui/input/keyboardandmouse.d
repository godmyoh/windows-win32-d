module windows.win32.ui.input.keyboardandmouse;

import windows.win32.foundation : BOOL, CHAR, HWND, POINT, PSTR, PWSTR;
import windows.win32.ui.textservices : HKL;

version (Windows):
extern (Windows):

alias HOT_KEY_MODIFIERS = uint;
enum : uint
{
    MOD_ALT      = 0x00000001,
    MOD_CONTROL  = 0x00000002,
    MOD_NOREPEAT = 0x00004000,
    MOD_SHIFT    = 0x00000004,
    MOD_WIN      = 0x00000008,
}

alias ACTIVATE_KEYBOARD_LAYOUT_FLAGS = uint;
enum : uint
{
    KLF_REORDER       = 0x00000008,
    KLF_RESET         = 0x40000000,
    KLF_SETFORPROCESS = 0x00000100,
    KLF_SHIFTLOCK     = 0x00010000,
    KLF_ACTIVATE      = 0x00000001,
    KLF_NOTELLSHELL   = 0x00000080,
    KLF_REPLACELANG   = 0x00000010,
    KLF_SUBSTITUTE_OK = 0x00000002,
}

alias GET_MOUSE_MOVE_POINTS_EX_RESOLUTION = uint;
enum : uint
{
    GMMP_USE_DISPLAY_POINTS         = 0x00000001,
    GMMP_USE_HIGH_RESOLUTION_POINTS = 0x00000002,
}

alias KEYBD_EVENT_FLAGS = uint;
enum : uint
{
    KEYEVENTF_EXTENDEDKEY = 0x00000001,
    KEYEVENTF_KEYUP       = 0x00000002,
    KEYEVENTF_SCANCODE    = 0x00000008,
    KEYEVENTF_UNICODE     = 0x00000004,
}

alias MOUSE_EVENT_FLAGS = uint;
enum : uint
{
    MOUSEEVENTF_ABSOLUTE        = 0x00008000,
    MOUSEEVENTF_LEFTDOWN        = 0x00000002,
    MOUSEEVENTF_LEFTUP          = 0x00000004,
    MOUSEEVENTF_MIDDLEDOWN      = 0x00000020,
    MOUSEEVENTF_MIDDLEUP        = 0x00000040,
    MOUSEEVENTF_MOVE            = 0x00000001,
    MOUSEEVENTF_RIGHTDOWN       = 0x00000008,
    MOUSEEVENTF_RIGHTUP         = 0x00000010,
    MOUSEEVENTF_WHEEL           = 0x00000800,
    MOUSEEVENTF_XDOWN           = 0x00000080,
    MOUSEEVENTF_XUP             = 0x00000100,
    MOUSEEVENTF_HWHEEL          = 0x00001000,
    MOUSEEVENTF_MOVE_NOCOALESCE = 0x00002000,
    MOUSEEVENTF_VIRTUALDESK     = 0x00004000,
}

alias INPUT_TYPE = uint;
enum : uint
{
    INPUT_MOUSE    = 0x00000000,
    INPUT_KEYBOARD = 0x00000001,
    INPUT_HARDWARE = 0x00000002,
}

alias TRACKMOUSEEVENT_FLAGS = uint;
enum : uint
{
    TME_CANCEL    = 0x80000000,
    TME_HOVER     = 0x00000001,
    TME_LEAVE     = 0x00000002,
    TME_NONCLIENT = 0x00000010,
    TME_QUERY     = 0x40000000,
}

alias VIRTUAL_KEY = ushort;
enum : ushort
{
    VK_0                               = 0x0030,
    VK_1                               = 0x0031,
    VK_2                               = 0x0032,
    VK_3                               = 0x0033,
    VK_4                               = 0x0034,
    VK_5                               = 0x0035,
    VK_6                               = 0x0036,
    VK_7                               = 0x0037,
    VK_8                               = 0x0038,
    VK_9                               = 0x0039,
    VK_A                               = 0x0041,
    VK_B                               = 0x0042,
    VK_C                               = 0x0043,
    VK_D                               = 0x0044,
    VK_E                               = 0x0045,
    VK_F                               = 0x0046,
    VK_G                               = 0x0047,
    VK_H                               = 0x0048,
    VK_I                               = 0x0049,
    VK_J                               = 0x004a,
    VK_K                               = 0x004b,
    VK_L                               = 0x004c,
    VK_M                               = 0x004d,
    VK_N                               = 0x004e,
    VK_O                               = 0x004f,
    VK_P                               = 0x0050,
    VK_Q                               = 0x0051,
    VK_R                               = 0x0052,
    VK_S                               = 0x0053,
    VK_T                               = 0x0054,
    VK_U                               = 0x0055,
    VK_V                               = 0x0056,
    VK_W                               = 0x0057,
    VK_X                               = 0x0058,
    VK_Y                               = 0x0059,
    VK_Z                               = 0x005a,
    VK_LBUTTON                         = 0x0001,
    VK_RBUTTON                         = 0x0002,
    VK_CANCEL                          = 0x0003,
    VK_MBUTTON                         = 0x0004,
    VK_XBUTTON1                        = 0x0005,
    VK_XBUTTON2                        = 0x0006,
    VK_BACK                            = 0x0008,
    VK_TAB                             = 0x0009,
    VK_CLEAR                           = 0x000c,
    VK_RETURN                          = 0x000d,
    VK_SHIFT                           = 0x0010,
    VK_CONTROL                         = 0x0011,
    VK_MENU                            = 0x0012,
    VK_PAUSE                           = 0x0013,
    VK_CAPITAL                         = 0x0014,
    VK_KANA                            = 0x0015,
    VK_HANGEUL                         = 0x0015,
    VK_HANGUL                          = 0x0015,
    VK_IME_ON                          = 0x0016,
    VK_JUNJA                           = 0x0017,
    VK_FINAL                           = 0x0018,
    VK_HANJA                           = 0x0019,
    VK_KANJI                           = 0x0019,
    VK_IME_OFF                         = 0x001a,
    VK_ESCAPE                          = 0x001b,
    VK_CONVERT                         = 0x001c,
    VK_NONCONVERT                      = 0x001d,
    VK_ACCEPT                          = 0x001e,
    VK_MODECHANGE                      = 0x001f,
    VK_SPACE                           = 0x0020,
    VK_PRIOR                           = 0x0021,
    VK_NEXT                            = 0x0022,
    VK_END                             = 0x0023,
    VK_HOME                            = 0x0024,
    VK_LEFT                            = 0x0025,
    VK_UP                              = 0x0026,
    VK_RIGHT                           = 0x0027,
    VK_DOWN                            = 0x0028,
    VK_SELECT                          = 0x0029,
    VK_PRINT                           = 0x002a,
    VK_EXECUTE                         = 0x002b,
    VK_SNAPSHOT                        = 0x002c,
    VK_INSERT                          = 0x002d,
    VK_DELETE                          = 0x002e,
    VK_HELP                            = 0x002f,
    VK_LWIN                            = 0x005b,
    VK_RWIN                            = 0x005c,
    VK_APPS                            = 0x005d,
    VK_SLEEP                           = 0x005f,
    VK_NUMPAD0                         = 0x0060,
    VK_NUMPAD1                         = 0x0061,
    VK_NUMPAD2                         = 0x0062,
    VK_NUMPAD3                         = 0x0063,
    VK_NUMPAD4                         = 0x0064,
    VK_NUMPAD5                         = 0x0065,
    VK_NUMPAD6                         = 0x0066,
    VK_NUMPAD7                         = 0x0067,
    VK_NUMPAD8                         = 0x0068,
    VK_NUMPAD9                         = 0x0069,
    VK_MULTIPLY                        = 0x006a,
    VK_ADD                             = 0x006b,
    VK_SEPARATOR                       = 0x006c,
    VK_SUBTRACT                        = 0x006d,
    VK_DECIMAL                         = 0x006e,
    VK_DIVIDE                          = 0x006f,
    VK_F1                              = 0x0070,
    VK_F2                              = 0x0071,
    VK_F3                              = 0x0072,
    VK_F4                              = 0x0073,
    VK_F5                              = 0x0074,
    VK_F6                              = 0x0075,
    VK_F7                              = 0x0076,
    VK_F8                              = 0x0077,
    VK_F9                              = 0x0078,
    VK_F10                             = 0x0079,
    VK_F11                             = 0x007a,
    VK_F12                             = 0x007b,
    VK_F13                             = 0x007c,
    VK_F14                             = 0x007d,
    VK_F15                             = 0x007e,
    VK_F16                             = 0x007f,
    VK_F17                             = 0x0080,
    VK_F18                             = 0x0081,
    VK_F19                             = 0x0082,
    VK_F20                             = 0x0083,
    VK_F21                             = 0x0084,
    VK_F22                             = 0x0085,
    VK_F23                             = 0x0086,
    VK_F24                             = 0x0087,
    VK_NAVIGATION_VIEW                 = 0x0088,
    VK_NAVIGATION_MENU                 = 0x0089,
    VK_NAVIGATION_UP                   = 0x008a,
    VK_NAVIGATION_DOWN                 = 0x008b,
    VK_NAVIGATION_LEFT                 = 0x008c,
    VK_NAVIGATION_RIGHT                = 0x008d,
    VK_NAVIGATION_ACCEPT               = 0x008e,
    VK_NAVIGATION_CANCEL               = 0x008f,
    VK_NUMLOCK                         = 0x0090,
    VK_SCROLL                          = 0x0091,
    VK_OEM_NEC_EQUAL                   = 0x0092,
    VK_OEM_FJ_JISHO                    = 0x0092,
    VK_OEM_FJ_MASSHOU                  = 0x0093,
    VK_OEM_FJ_TOUROKU                  = 0x0094,
    VK_OEM_FJ_LOYA                     = 0x0095,
    VK_OEM_FJ_ROYA                     = 0x0096,
    VK_LSHIFT                          = 0x00a0,
    VK_RSHIFT                          = 0x00a1,
    VK_LCONTROL                        = 0x00a2,
    VK_RCONTROL                        = 0x00a3,
    VK_LMENU                           = 0x00a4,
    VK_RMENU                           = 0x00a5,
    VK_BROWSER_BACK                    = 0x00a6,
    VK_BROWSER_FORWARD                 = 0x00a7,
    VK_BROWSER_REFRESH                 = 0x00a8,
    VK_BROWSER_STOP                    = 0x00a9,
    VK_BROWSER_SEARCH                  = 0x00aa,
    VK_BROWSER_FAVORITES               = 0x00ab,
    VK_BROWSER_HOME                    = 0x00ac,
    VK_VOLUME_MUTE                     = 0x00ad,
    VK_VOLUME_DOWN                     = 0x00ae,
    VK_VOLUME_UP                       = 0x00af,
    VK_MEDIA_NEXT_TRACK                = 0x00b0,
    VK_MEDIA_PREV_TRACK                = 0x00b1,
    VK_MEDIA_STOP                      = 0x00b2,
    VK_MEDIA_PLAY_PAUSE                = 0x00b3,
    VK_LAUNCH_MAIL                     = 0x00b4,
    VK_LAUNCH_MEDIA_SELECT             = 0x00b5,
    VK_LAUNCH_APP1                     = 0x00b6,
    VK_LAUNCH_APP2                     = 0x00b7,
    VK_OEM_1                           = 0x00ba,
    VK_OEM_PLUS                        = 0x00bb,
    VK_OEM_COMMA                       = 0x00bc,
    VK_OEM_MINUS                       = 0x00bd,
    VK_OEM_PERIOD                      = 0x00be,
    VK_OEM_2                           = 0x00bf,
    VK_OEM_3                           = 0x00c0,
    VK_GAMEPAD_A                       = 0x00c3,
    VK_GAMEPAD_B                       = 0x00c4,
    VK_GAMEPAD_X                       = 0x00c5,
    VK_GAMEPAD_Y                       = 0x00c6,
    VK_GAMEPAD_RIGHT_SHOULDER          = 0x00c7,
    VK_GAMEPAD_LEFT_SHOULDER           = 0x00c8,
    VK_GAMEPAD_LEFT_TRIGGER            = 0x00c9,
    VK_GAMEPAD_RIGHT_TRIGGER           = 0x00ca,
    VK_GAMEPAD_DPAD_UP                 = 0x00cb,
    VK_GAMEPAD_DPAD_DOWN               = 0x00cc,
    VK_GAMEPAD_DPAD_LEFT               = 0x00cd,
    VK_GAMEPAD_DPAD_RIGHT              = 0x00ce,
    VK_GAMEPAD_MENU                    = 0x00cf,
    VK_GAMEPAD_VIEW                    = 0x00d0,
    VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON  = 0x00d1,
    VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON = 0x00d2,
    VK_GAMEPAD_LEFT_THUMBSTICK_UP      = 0x00d3,
    VK_GAMEPAD_LEFT_THUMBSTICK_DOWN    = 0x00d4,
    VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT   = 0x00d5,
    VK_GAMEPAD_LEFT_THUMBSTICK_LEFT    = 0x00d6,
    VK_GAMEPAD_RIGHT_THUMBSTICK_UP     = 0x00d7,
    VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN   = 0x00d8,
    VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT  = 0x00d9,
    VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT   = 0x00da,
    VK_OEM_4                           = 0x00db,
    VK_OEM_5                           = 0x00dc,
    VK_OEM_6                           = 0x00dd,
    VK_OEM_7                           = 0x00de,
    VK_OEM_8                           = 0x00df,
    VK_OEM_AX                          = 0x00e1,
    VK_OEM_102                         = 0x00e2,
    VK_ICO_HELP                        = 0x00e3,
    VK_ICO_00                          = 0x00e4,
    VK_PROCESSKEY                      = 0x00e5,
    VK_ICO_CLEAR                       = 0x00e6,
    VK_PACKET                          = 0x00e7,
    VK_OEM_RESET                       = 0x00e9,
    VK_OEM_JUMP                        = 0x00ea,
    VK_OEM_PA1                         = 0x00eb,
    VK_OEM_PA2                         = 0x00ec,
    VK_OEM_PA3                         = 0x00ed,
    VK_OEM_WSCTRL                      = 0x00ee,
    VK_OEM_CUSEL                       = 0x00ef,
    VK_OEM_ATTN                        = 0x00f0,
    VK_OEM_FINISH                      = 0x00f1,
    VK_OEM_COPY                        = 0x00f2,
    VK_OEM_AUTO                        = 0x00f3,
    VK_OEM_ENLW                        = 0x00f4,
    VK_OEM_BACKTAB                     = 0x00f5,
    VK_ATTN                            = 0x00f6,
    VK_CRSEL                           = 0x00f7,
    VK_EXSEL                           = 0x00f8,
    VK_EREOF                           = 0x00f9,
    VK_PLAY                            = 0x00fa,
    VK_ZOOM                            = 0x00fb,
    VK_NONAME                          = 0x00fc,
    VK_PA1                             = 0x00fd,
    VK_OEM_CLEAR                       = 0x00fe,
}

BOOL _TrackMouseEvent(TRACKMOUSEEVENT*);
HKL LoadKeyboardLayoutA(const(char)*, ACTIVATE_KEYBOARD_LAYOUT_FLAGS);
HKL LoadKeyboardLayoutW(const(wchar)*, ACTIVATE_KEYBOARD_LAYOUT_FLAGS);
HKL ActivateKeyboardLayout(HKL, ACTIVATE_KEYBOARD_LAYOUT_FLAGS);
int ToUnicodeEx(uint, uint, const(ubyte)*, PWSTR, int, uint, HKL);
BOOL UnloadKeyboardLayout(HKL);
BOOL GetKeyboardLayoutNameA(PSTR);
BOOL GetKeyboardLayoutNameW(PWSTR);
int GetKeyboardLayoutList(int, HKL*);
HKL GetKeyboardLayout(uint);
int GetMouseMovePointsEx(uint, MOUSEMOVEPOINT*, MOUSEMOVEPOINT*, int, GET_MOUSE_MOVE_POINTS_EX_RESOLUTION);
BOOL TrackMouseEvent(TRACKMOUSEEVENT*);
BOOL RegisterHotKey(HWND, int, HOT_KEY_MODIFIERS, uint);
BOOL UnregisterHotKey(HWND, int);
BOOL SwapMouseButton(BOOL);
uint GetDoubleClickTime();
BOOL SetDoubleClickTime(uint);
HWND SetFocus(HWND);
HWND GetActiveWindow();
HWND GetFocus();
uint GetKBCodePage();
short GetKeyState(int);
short GetAsyncKeyState(int);
BOOL GetKeyboardState(ubyte*);
BOOL SetKeyboardState(ubyte*);
int GetKeyNameTextA(int, PSTR, int);
int GetKeyNameTextW(int, PWSTR, int);
int GetKeyboardType(int);
int ToAscii(uint, uint, const(ubyte)*, ushort*, uint);
int ToAsciiEx(uint, uint, const(ubyte)*, ushort*, uint, HKL);
int ToUnicode(uint, uint, const(ubyte)*, PWSTR, int, uint);
uint OemKeyScan(ushort);
short VkKeyScanA(CHAR);
short VkKeyScanW(wchar);
short VkKeyScanExA(CHAR, HKL);
short VkKeyScanExW(wchar, HKL);
void keybd_event(ubyte, ubyte, KEYBD_EVENT_FLAGS, ulong);
void mouse_event(MOUSE_EVENT_FLAGS, int, int, uint, ulong);
uint SendInput(uint, INPUT*, int);
BOOL GetLastInputInfo(LASTINPUTINFO*);
uint MapVirtualKeyA(uint, uint);
uint MapVirtualKeyW(uint, uint);
uint MapVirtualKeyExA(uint, uint, HKL);
uint MapVirtualKeyExW(uint, uint, HKL);
HWND GetCapture();
HWND SetCapture(HWND);
BOOL ReleaseCapture();
BOOL EnableWindow(HWND, BOOL);
BOOL IsWindowEnabled(HWND);
BOOL DragDetect(HWND, POINT);
HWND SetActiveWindow(HWND);
BOOL BlockInput(BOOL);
enum EXTENDED_BIT = 0x01000000;
enum DONTCARE_BIT = 0x02000000;
enum FAKE_KEYSTROKE = 0x02000000;
enum KBDBASE = 0x00000000;
enum KBDSHIFT = 0x00000001;
enum KBDCTRL = 0x00000002;
enum KBDALT = 0x00000004;
enum KBDKANA = 0x00000008;
enum KBDROYA = 0x00000010;
enum KBDLOYA = 0x00000020;
enum KBDGRPSELTAP = 0x00000080;
enum GRAVE = 0x00000300;
enum ACUTE = 0x00000301;
enum CIRCUMFLEX = 0x00000302;
enum TILDE = 0x00000303;
enum MACRON = 0x00000304;
enum OVERSCORE = 0x00000305;
enum BREVE = 0x00000306;
enum DOT_ABOVE = 0x00000307;
enum UMLAUT = 0x00000308;
enum DIARESIS = 0x00000308;
enum HOOK_ABOVE = 0x00000309;
enum RING = 0x0000030a;
enum DOUBLE_ACUTE = 0x0000030b;
enum HACEK = 0x0000030c;
enum CEDILLA = 0x00000327;
enum OGONEK = 0x00000328;
enum TONOS = 0x00000384;
enum DIARESIS_TONOS = 0x00000385;
enum wszGRAVE = "̀";
enum wszACUTE = "́";
enum wszCIRCUMFLEX = "̂";
enum wszTILDE = "̃";
enum wszMACRON = "̄";
enum wszOVERSCORE = "̅";
enum wszBREVE = "̆";
enum wszDOT_ABOVE = "̇";
enum wszUMLAUT = "̈";
enum wszHOOK_ABOVE = "̉";
enum wszRING = "̊";
enum wszDOUBLE_ACUTE = "̋";
enum wszHACEK = "̌";
enum wszCEDILLA = "̧";
enum wszOGONEK = "̨";
enum wszTONOS = "΄";
enum wszDIARESIS_TONOS = "΅";
enum SHFT_INVALID = 0x0000000f;
enum WCH_NONE = 0x0000f000;
enum WCH_DEAD = 0x0000f001;
enum WCH_LGTR = 0x0000f002;
enum CAPLOK = 0x00000001;
enum SGCAPS = 0x00000002;
enum CAPLOKALTGR = 0x00000004;
enum KANALOK = 0x00000008;
enum GRPSELTAP = 0x00000080;
enum DKF_DEAD = 0x00000001;
enum KBD_VERSION = 0x00000001;
enum KLLF_ALTGR = 0x00000001;
enum KLLF_SHIFTLOCK = 0x00000002;
enum KLLF_LRM_RLM = 0x00000004;
enum KLLF_GLOBAL_ATTRS = 0x00000002;
enum KBDTABLE_MULTI_MAX = 0x00000008;
enum KEYBOARD_TYPE_GENERIC_101 = 0x00000004;
enum KEYBOARD_TYPE_JAPAN = 0x00000007;
enum KEYBOARD_TYPE_KOREA = 0x00000008;
enum KEYBOARD_TYPE_UNKNOWN = 0x00000051;
enum NLSKBD_OEM_MICROSOFT = 0x00000000;
enum NLSKBD_OEM_AX = 0x00000001;
enum NLSKBD_OEM_EPSON = 0x00000004;
enum NLSKBD_OEM_FUJITSU = 0x00000005;
enum NLSKBD_OEM_IBM = 0x00000007;
enum NLSKBD_OEM_MATSUSHITA = 0x0000000a;
enum NLSKBD_OEM_NEC = 0x0000000d;
enum NLSKBD_OEM_TOSHIBA = 0x00000012;
enum NLSKBD_OEM_DEC = 0x00000018;
enum MICROSOFT_KBD_101_TYPE = 0x00000000;
enum MICROSOFT_KBD_AX_TYPE = 0x00000001;
enum MICROSOFT_KBD_106_TYPE = 0x00000002;
enum MICROSOFT_KBD_002_TYPE = 0x00000003;
enum MICROSOFT_KBD_001_TYPE = 0x00000004;
enum MICROSOFT_KBD_FUNC = 0x0000000c;
enum AX_KBD_DESKTOP_TYPE = 0x00000001;
enum FMR_KBD_JIS_TYPE = 0x00000000;
enum FMR_KBD_OASYS_TYPE = 0x00000001;
enum FMV_KBD_OASYS_TYPE = 0x00000002;
enum NEC_KBD_NORMAL_TYPE = 0x00000001;
enum NEC_KBD_N_MODE_TYPE = 0x00000002;
enum NEC_KBD_H_MODE_TYPE = 0x00000003;
enum NEC_KBD_LAPTOP_TYPE = 0x00000004;
enum NEC_KBD_106_TYPE = 0x00000005;
enum TOSHIBA_KBD_DESKTOP_TYPE = 0x0000000d;
enum TOSHIBA_KBD_LAPTOP_TYPE = 0x0000000f;
enum DEC_KBD_ANSI_LAYOUT_TYPE = 0x00000001;
enum DEC_KBD_JIS_LAYOUT_TYPE = 0x00000002;
enum MICROSOFT_KBD_101A_TYPE = 0x00000000;
enum MICROSOFT_KBD_101B_TYPE = 0x00000004;
enum MICROSOFT_KBD_101C_TYPE = 0x00000005;
enum MICROSOFT_KBD_103_TYPE = 0x00000006;
enum NLSKBD_INFO_SEND_IME_NOTIFICATION = 0x00000001;
enum NLSKBD_INFO_ACCESSIBILITY_KEYMAP = 0x00000002;
enum NLSKBD_INFO_EMURATE_101_KEYBOARD = 0x00000010;
enum NLSKBD_INFO_EMURATE_106_KEYBOARD = 0x00000020;
enum KBDNLS_TYPE_NULL = 0x00000000;
enum KBDNLS_TYPE_NORMAL = 0x00000001;
enum KBDNLS_TYPE_TOGGLE = 0x00000002;
enum KBDNLS_INDEX_NORMAL = 0x00000001;
enum KBDNLS_INDEX_ALT = 0x00000002;
enum KBDNLS_NULL = 0x00000000;
enum KBDNLS_NOEVENT = 0x00000001;
enum KBDNLS_SEND_BASE_VK = 0x00000002;
enum KBDNLS_SEND_PARAM_VK = 0x00000003;
enum KBDNLS_KANALOCK = 0x00000004;
enum KBDNLS_ALPHANUM = 0x00000005;
enum KBDNLS_HIRAGANA = 0x00000006;
enum KBDNLS_KATAKANA = 0x00000007;
enum KBDNLS_SBCSDBCS = 0x00000008;
enum KBDNLS_ROMAN = 0x00000009;
enum KBDNLS_CODEINPUT = 0x0000000a;
enum KBDNLS_HELP_OR_END = 0x0000000b;
enum KBDNLS_HOME_OR_CLEAR = 0x0000000c;
enum KBDNLS_NUMPAD = 0x0000000d;
enum KBDNLS_KANAEVENT = 0x0000000e;
enum KBDNLS_CONV_OR_NONCONV = 0x0000000f;
enum KBD_TYPE = 0x00000004;
enum VK__none_ = 0x000000ff;
enum VK_ABNT_C1 = 0x000000c1;
enum VK_ABNT_C2 = 0x000000c2;
enum SCANCODE_LSHIFT = 0x0000002a;
enum SCANCODE_RSHIFT = 0x00000036;
enum SCANCODE_CTRL = 0x0000001d;
enum SCANCODE_ALT = 0x00000038;
enum SCANCODE_NUMPAD_FIRST = 0x00000047;
enum SCANCODE_NUMPAD_LAST = 0x00000052;
enum SCANCODE_LWIN = 0x0000005b;
enum SCANCODE_RWIN = 0x0000005c;
enum SCANCODE_THAI_LAYOUT_TOGGLE = 0x00000029;
enum VK_DBE_ALPHANUMERIC = 0x000000f0;
enum VK_DBE_KATAKANA = 0x000000f1;
enum VK_DBE_HIRAGANA = 0x000000f2;
enum VK_DBE_SBCSCHAR = 0x000000f3;
enum VK_DBE_DBCSCHAR = 0x000000f4;
enum VK_DBE_ROMAN = 0x000000f5;
enum VK_DBE_NOROMAN = 0x000000f6;
enum VK_DBE_ENTERWORDREGISTERMODE = 0x000000f7;
enum VK_DBE_ENTERIMECONFIGMODE = 0x000000f8;
enum VK_DBE_FLUSHSTRING = 0x000000f9;
enum VK_DBE_CODEINPUT = 0x000000fa;
enum VK_DBE_NOCODEINPUT = 0x000000fb;
enum VK_DBE_DETERMINESTRING = 0x000000fc;
enum VK_DBE_ENTERDLGCONVERSIONMODE = 0x000000fd;
struct VK_TO_BIT
{
    ubyte Vk;
    ubyte ModBits;
}
struct MODIFIERS
{
    VK_TO_BIT* pVkToBit;
    ushort wMaxModBits;
    ubyte[1] ModNumber;
}
struct VSC_VK
{
    ubyte Vsc;
    ushort Vk;
}
struct VK_VSC
{
    ubyte Vk;
    ubyte Vsc;
}
struct VK_TO_WCHARS1
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[1] wch;
}
struct VK_TO_WCHARS2
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[2] wch;
}
struct VK_TO_WCHARS3
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[3] wch;
}
struct VK_TO_WCHARS4
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[4] wch;
}
struct VK_TO_WCHARS5
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[5] wch;
}
struct VK_TO_WCHARS6
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[6] wch;
}
struct VK_TO_WCHARS7
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[7] wch;
}
struct VK_TO_WCHARS8
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[8] wch;
}
struct VK_TO_WCHARS9
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[9] wch;
}
struct VK_TO_WCHARS10
{
    ubyte VirtualKey;
    ubyte Attributes;
    wchar[10] wch;
}
struct VK_TO_WCHAR_TABLE
{
    VK_TO_WCHARS1* pVkToWchars;
    ubyte nModifications;
    ubyte cbSize;
}
struct DEADKEY
{
    uint dwBoth;
    wchar wchComposed;
    ushort uFlags;
}
struct LIGATURE1
{
    ubyte VirtualKey;
    ushort ModificationNumber;
    wchar[1] wch;
}
struct LIGATURE2
{
    ubyte VirtualKey;
    ushort ModificationNumber;
    wchar[2] wch;
}
struct LIGATURE3
{
    ubyte VirtualKey;
    ushort ModificationNumber;
    wchar[3] wch;
}
struct LIGATURE4
{
    ubyte VirtualKey;
    ushort ModificationNumber;
    wchar[4] wch;
}
struct LIGATURE5
{
    ubyte VirtualKey;
    ushort ModificationNumber;
    wchar[5] wch;
}
struct VSC_LPWSTR
{
    ubyte vsc;
    PWSTR pwsz;
}
struct tagKbdLayer
{
    MODIFIERS* pCharModifiers;
    VK_TO_WCHAR_TABLE* pVkToWcharTable;
    DEADKEY* pDeadKey;
    VSC_LPWSTR* pKeyNames;
    VSC_LPWSTR* pKeyNamesExt;
    ushort** pKeyNamesDead;
    ushort* pusVSCtoVK;
    ubyte bMaxVSCtoVK;
    VSC_VK* pVSCtoVK_E0;
    VSC_VK* pVSCtoVK_E1;
    uint fLocaleFlags;
    ubyte nLgMax;
    ubyte cbLgEntry;
    LIGATURE1* pLigature;
    uint dwType;
    uint dwSubType;
}
struct _VK_FUNCTION_PARAM
{
    ubyte NLSFEProcIndex;
    uint NLSFEProcParam;
}
struct _VK_TO_FUNCTION_TABLE
{
    ubyte Vk;
    ubyte NLSFEProcType;
    ubyte NLSFEProcCurrent;
    ubyte NLSFEProcSwitch;
    _VK_FUNCTION_PARAM[8] NLSFEProc;
    _VK_FUNCTION_PARAM[8] NLSFEProcAlt;
}
struct tagKbdNlsLayer
{
    ushort OEMIdentifier;
    ushort LayoutInformation;
    uint NumOfVkToF;
    _VK_TO_FUNCTION_TABLE* pVkToF;
    int NumOfMouseVKey;
    ushort* pusMouseVKey;
}
struct KBDTABLE_DESC
{
    wchar[32] wszDllName;
    uint dwType;
    uint dwSubType;
}
struct KBDTABLE_MULTI
{
    uint nTables;
    KBDTABLE_DESC[8] aKbdTables;
}
struct KBD_TYPE_INFO
{
    uint dwVersion;
    uint dwType;
    uint dwSubType;
}
struct MOUSEMOVEPOINT
{
    int x;
    int y;
    uint time;
    ulong dwExtraInfo;
}
struct TRACKMOUSEEVENT
{
    uint cbSize;
    TRACKMOUSEEVENT_FLAGS dwFlags;
    HWND hwndTrack;
    uint dwHoverTime;
}
struct MOUSEINPUT
{
    int dx;
    int dy;
    int mouseData;
    MOUSE_EVENT_FLAGS dwFlags;
    uint time;
    ulong dwExtraInfo;
}
struct KEYBDINPUT
{
    VIRTUAL_KEY wVk;
    ushort wScan;
    KEYBD_EVENT_FLAGS dwFlags;
    uint time;
    ulong dwExtraInfo;
}
struct HARDWAREINPUT
{
    uint uMsg;
    ushort wParamL;
    ushort wParamH;
}
struct INPUT
{
    INPUT_TYPE type;
    union
    {
        MOUSEINPUT mi;
        KEYBDINPUT ki;
        HARDWAREINPUT hi;
    }
}
struct LASTINPUTINFO
{
    uint cbSize;
    uint dwTime;
}
