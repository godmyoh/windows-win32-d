module windows.win32.system.console;

import windows.win32.foundation : BOOL, CHAR, COLORREF, HANDLE, HRESULT, HWND, NTSTATUS, PSTR, PWSTR, RECT;
import windows.win32.security : SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

alias CONSOLE_MODE = uint;
enum : uint
{
    ENABLE_PROCESSED_INPUT             = 0x00000001,
    ENABLE_LINE_INPUT                  = 0x00000002,
    ENABLE_ECHO_INPUT                  = 0x00000004,
    ENABLE_WINDOW_INPUT                = 0x00000008,
    ENABLE_MOUSE_INPUT                 = 0x00000010,
    ENABLE_INSERT_MODE                 = 0x00000020,
    ENABLE_QUICK_EDIT_MODE             = 0x00000040,
    ENABLE_EXTENDED_FLAGS              = 0x00000080,
    ENABLE_AUTO_POSITION               = 0x00000100,
    ENABLE_VIRTUAL_TERMINAL_INPUT      = 0x00000200,
    ENABLE_PROCESSED_OUTPUT            = 0x00000001,
    ENABLE_WRAP_AT_EOL_OUTPUT          = 0x00000002,
    ENABLE_VIRTUAL_TERMINAL_PROCESSING = 0x00000004,
    DISABLE_NEWLINE_AUTO_RETURN        = 0x00000008,
    ENABLE_LVB_GRID_WORLDWIDE          = 0x00000010,
}

alias STD_HANDLE = uint;
enum : uint
{
    STD_INPUT_HANDLE  = 0xfffffff6,
    STD_OUTPUT_HANDLE = 0xfffffff5,
    STD_ERROR_HANDLE  = 0xfffffff4,
}

alias CONSOLE_CHARACTER_ATTRIBUTES = ushort;
enum : ushort
{
    FOREGROUND_BLUE            = 0x0001,
    FOREGROUND_GREEN           = 0x0002,
    FOREGROUND_RED             = 0x0004,
    FOREGROUND_INTENSITY       = 0x0008,
    BACKGROUND_BLUE            = 0x0010,
    BACKGROUND_GREEN           = 0x0020,
    BACKGROUND_RED             = 0x0040,
    BACKGROUND_INTENSITY       = 0x0080,
    COMMON_LVB_LEADING_BYTE    = 0x0100,
    COMMON_LVB_TRAILING_BYTE   = 0x0200,
    COMMON_LVB_GRID_HORIZONTAL = 0x0400,
    COMMON_LVB_GRID_LVERTICAL  = 0x0800,
    COMMON_LVB_GRID_RVERTICAL  = 0x1000,
    COMMON_LVB_REVERSE_VIDEO   = 0x4000,
    COMMON_LVB_UNDERSCORE      = 0x8000,
    COMMON_LVB_SBCSDBCS        = 0x0300,
}

BOOL AllocConsole();
BOOL FreeConsole();
BOOL AttachConsole(uint);
uint GetConsoleCP();
uint GetConsoleOutputCP();
BOOL GetConsoleMode(HANDLE, CONSOLE_MODE*);
BOOL SetConsoleMode(HANDLE, CONSOLE_MODE);
BOOL GetNumberOfConsoleInputEvents(HANDLE, uint*);
BOOL ReadConsoleInputA(HANDLE, INPUT_RECORD*, uint, uint*);
BOOL ReadConsoleInputW(HANDLE, INPUT_RECORD*, uint, uint*);
BOOL PeekConsoleInputA(HANDLE, INPUT_RECORD*, uint, uint*);
BOOL PeekConsoleInputW(HANDLE, INPUT_RECORD*, uint, uint*);
BOOL ReadConsoleA(HANDLE, void*, uint, uint*, CONSOLE_READCONSOLE_CONTROL*);
BOOL ReadConsoleW(HANDLE, void*, uint, uint*, CONSOLE_READCONSOLE_CONTROL*);
BOOL WriteConsoleA(HANDLE, const(void)*, uint, uint*, void*);
BOOL WriteConsoleW(HANDLE, const(void)*, uint, uint*, void*);
BOOL SetConsoleCtrlHandler(PHANDLER_ROUTINE, BOOL);
HRESULT CreatePseudoConsole(COORD, HANDLE, HANDLE, uint, HPCON*);
HRESULT ResizePseudoConsole(HPCON, COORD);
void ClosePseudoConsole(HPCON);
BOOL FillConsoleOutputCharacterA(HANDLE, CHAR, uint, COORD, uint*);
BOOL FillConsoleOutputCharacterW(HANDLE, wchar, uint, COORD, uint*);
BOOL FillConsoleOutputAttribute(HANDLE, ushort, uint, COORD, uint*);
BOOL GenerateConsoleCtrlEvent(uint, uint);
HANDLE CreateConsoleScreenBuffer(uint, uint, const(SECURITY_ATTRIBUTES)*, uint, void*);
BOOL SetConsoleActiveScreenBuffer(HANDLE);
BOOL FlushConsoleInputBuffer(HANDLE);
BOOL SetConsoleCP(uint);
BOOL SetConsoleOutputCP(uint);
BOOL GetConsoleCursorInfo(HANDLE, CONSOLE_CURSOR_INFO*);
BOOL SetConsoleCursorInfo(HANDLE, const(CONSOLE_CURSOR_INFO)*);
BOOL GetConsoleScreenBufferInfo(HANDLE, CONSOLE_SCREEN_BUFFER_INFO*);
BOOL GetConsoleScreenBufferInfoEx(HANDLE, CONSOLE_SCREEN_BUFFER_INFOEX*);
BOOL SetConsoleScreenBufferInfoEx(HANDLE, CONSOLE_SCREEN_BUFFER_INFOEX*);
BOOL SetConsoleScreenBufferSize(HANDLE, COORD);
BOOL SetConsoleCursorPosition(HANDLE, COORD);
COORD GetLargestConsoleWindowSize(HANDLE);
BOOL SetConsoleTextAttribute(HANDLE, CONSOLE_CHARACTER_ATTRIBUTES);
BOOL SetConsoleWindowInfo(HANDLE, BOOL, const(SMALL_RECT)*);
BOOL WriteConsoleOutputCharacterA(HANDLE, const(char)*, uint, COORD, uint*);
BOOL WriteConsoleOutputCharacterW(HANDLE, const(wchar)*, uint, COORD, uint*);
BOOL WriteConsoleOutputAttribute(HANDLE, const(ushort)*, uint, COORD, uint*);
BOOL ReadConsoleOutputCharacterA(HANDLE, PSTR, uint, COORD, uint*);
BOOL ReadConsoleOutputCharacterW(HANDLE, PWSTR, uint, COORD, uint*);
BOOL ReadConsoleOutputAttribute(HANDLE, ushort*, uint, COORD, uint*);
BOOL WriteConsoleInputA(HANDLE, const(INPUT_RECORD)*, uint, uint*);
BOOL WriteConsoleInputW(HANDLE, const(INPUT_RECORD)*, uint, uint*);
BOOL ScrollConsoleScreenBufferA(HANDLE, const(SMALL_RECT)*, const(SMALL_RECT)*, COORD, const(CHAR_INFO)*);
BOOL ScrollConsoleScreenBufferW(HANDLE, const(SMALL_RECT)*, const(SMALL_RECT)*, COORD, const(CHAR_INFO)*);
BOOL WriteConsoleOutputA(HANDLE, const(CHAR_INFO)*, COORD, COORD, SMALL_RECT*);
BOOL WriteConsoleOutputW(HANDLE, const(CHAR_INFO)*, COORD, COORD, SMALL_RECT*);
BOOL ReadConsoleOutputA(HANDLE, CHAR_INFO*, COORD, COORD, SMALL_RECT*);
BOOL ReadConsoleOutputW(HANDLE, CHAR_INFO*, COORD, COORD, SMALL_RECT*);
uint GetConsoleTitleA(PSTR, uint);
uint GetConsoleTitleW(PWSTR, uint);
uint GetConsoleOriginalTitleA(PSTR, uint);
uint GetConsoleOriginalTitleW(PWSTR, uint);
BOOL SetConsoleTitleA(const(char)*);
BOOL SetConsoleTitleW(const(wchar)*);
BOOL GetNumberOfConsoleMouseButtons(uint*);
COORD GetConsoleFontSize(HANDLE, uint);
BOOL GetCurrentConsoleFont(HANDLE, BOOL, CONSOLE_FONT_INFO*);
BOOL GetCurrentConsoleFontEx(HANDLE, BOOL, CONSOLE_FONT_INFOEX*);
BOOL SetCurrentConsoleFontEx(HANDLE, BOOL, CONSOLE_FONT_INFOEX*);
BOOL GetConsoleSelectionInfo(CONSOLE_SELECTION_INFO*);
BOOL GetConsoleHistoryInfo(CONSOLE_HISTORY_INFO*);
BOOL SetConsoleHistoryInfo(CONSOLE_HISTORY_INFO*);
BOOL GetConsoleDisplayMode(uint*);
BOOL SetConsoleDisplayMode(HANDLE, uint, COORD*);
HWND GetConsoleWindow();
BOOL AddConsoleAliasA(PSTR, PSTR, PSTR);
BOOL AddConsoleAliasW(PWSTR, PWSTR, PWSTR);
uint GetConsoleAliasA(PSTR, PSTR, uint, PSTR);
uint GetConsoleAliasW(PWSTR, PWSTR, uint, PWSTR);
uint GetConsoleAliasesLengthA(PSTR);
uint GetConsoleAliasesLengthW(PWSTR);
uint GetConsoleAliasExesLengthA();
uint GetConsoleAliasExesLengthW();
uint GetConsoleAliasesA(PSTR, uint, PSTR);
uint GetConsoleAliasesW(PWSTR, uint, PWSTR);
uint GetConsoleAliasExesA(PSTR, uint);
uint GetConsoleAliasExesW(PWSTR, uint);
void ExpungeConsoleCommandHistoryA(PSTR);
void ExpungeConsoleCommandHistoryW(PWSTR);
BOOL SetConsoleNumberOfCommandsA(uint, PSTR);
BOOL SetConsoleNumberOfCommandsW(uint, PWSTR);
uint GetConsoleCommandHistoryLengthA(PSTR);
uint GetConsoleCommandHistoryLengthW(PWSTR);
uint GetConsoleCommandHistoryA(PSTR, uint, PSTR);
uint GetConsoleCommandHistoryW(PWSTR, uint, PWSTR);
uint GetConsoleProcessList(uint*, uint);
NTSTATUS ConsoleControl(CONSOLECONTROL, void*, uint);
HANDLE GetStdHandle(STD_HANDLE);
BOOL SetStdHandle(STD_HANDLE, HANDLE);
BOOL SetStdHandleEx(STD_HANDLE, HANDLE, HANDLE*);
enum CONSOLE_TEXTMODE_BUFFER = 0x00000001;
enum ATTACH_PARENT_PROCESS = 0xffffffff;
enum CTRL_C_EVENT = 0x00000000;
enum CTRL_BREAK_EVENT = 0x00000001;
enum CTRL_CLOSE_EVENT = 0x00000002;
enum CTRL_LOGOFF_EVENT = 0x00000005;
enum CTRL_SHUTDOWN_EVENT = 0x00000006;
enum PSEUDOCONSOLE_INHERIT_CURSOR = 0x00000001;
enum CONSOLE_NO_SELECTION = 0x00000000;
enum CONSOLE_SELECTION_IN_PROGRESS = 0x00000001;
enum CONSOLE_SELECTION_NOT_EMPTY = 0x00000002;
enum CONSOLE_MOUSE_SELECTION = 0x00000004;
enum CONSOLE_MOUSE_DOWN = 0x00000008;
enum HISTORY_NO_DUP_FLAG = 0x00000001;
enum CONSOLE_FULLSCREEN = 0x00000001;
enum CONSOLE_FULLSCREEN_HARDWARE = 0x00000002;
enum CONSOLE_FULLSCREEN_MODE = 0x00000001;
enum CONSOLE_WINDOWED_MODE = 0x00000002;
enum RIGHT_ALT_PRESSED = 0x00000001;
enum LEFT_ALT_PRESSED = 0x00000002;
enum RIGHT_CTRL_PRESSED = 0x00000004;
enum LEFT_CTRL_PRESSED = 0x00000008;
enum SHIFT_PRESSED = 0x00000010;
enum NUMLOCK_ON = 0x00000020;
enum SCROLLLOCK_ON = 0x00000040;
enum CAPSLOCK_ON = 0x00000080;
enum ENHANCED_KEY = 0x00000100;
enum NLS_DBCSCHAR = 0x00010000;
enum NLS_ALPHANUMERIC = 0x00000000;
enum NLS_KATAKANA = 0x00020000;
enum NLS_HIRAGANA = 0x00040000;
enum NLS_ROMAN = 0x00400000;
enum NLS_IME_CONVERSION = 0x00800000;
enum ALTNUMPAD_BIT = 0x04000000;
enum NLS_IME_DISABLE = 0x20000000;
enum FROM_LEFT_1ST_BUTTON_PRESSED = 0x00000001;
enum RIGHTMOST_BUTTON_PRESSED = 0x00000002;
enum FROM_LEFT_2ND_BUTTON_PRESSED = 0x00000004;
enum FROM_LEFT_3RD_BUTTON_PRESSED = 0x00000008;
enum FROM_LEFT_4TH_BUTTON_PRESSED = 0x00000010;
enum MOUSE_MOVED = 0x00000001;
enum DOUBLE_CLICK = 0x00000002;
enum MOUSE_WHEELED = 0x00000004;
enum MOUSE_HWHEELED = 0x00000008;
enum KEY_EVENT = 0x00000001;
enum MOUSE_EVENT = 0x00000002;
enum WINDOW_BUFFER_SIZE_EVENT = 0x00000004;
enum MENU_EVENT = 0x00000008;
enum FOCUS_EVENT = 0x00000010;
alias HPCON = void*;
struct COORD
{
    short X;
    short Y;
}
struct SMALL_RECT
{
    short Left;
    short Top;
    short Right;
    short Bottom;
}
struct KEY_EVENT_RECORD
{
    BOOL bKeyDown;
    ushort wRepeatCount;
    ushort wVirtualKeyCode;
    ushort wVirtualScanCode;
    union uChar
    {
        wchar UnicodeChar;
        CHAR AsciiChar;
    }
    uint dwControlKeyState;
}
struct MOUSE_EVENT_RECORD
{
    COORD dwMousePosition;
    uint dwButtonState;
    uint dwControlKeyState;
    uint dwEventFlags;
}
struct WINDOW_BUFFER_SIZE_RECORD
{
    COORD dwSize;
}
struct MENU_EVENT_RECORD
{
    uint dwCommandId;
}
struct FOCUS_EVENT_RECORD
{
    BOOL bSetFocus;
}
struct INPUT_RECORD
{
    ushort EventType;
    union Event
    {
        KEY_EVENT_RECORD KeyEvent;
        MOUSE_EVENT_RECORD MouseEvent;
        WINDOW_BUFFER_SIZE_RECORD WindowBufferSizeEvent;
        MENU_EVENT_RECORD MenuEvent;
        FOCUS_EVENT_RECORD FocusEvent;
    }
}
struct CHAR_INFO
{
    union Char
    {
        wchar UnicodeChar;
        CHAR AsciiChar;
    }
    ushort Attributes;
}
struct CONSOLE_FONT_INFO
{
    uint nFont;
    COORD dwFontSize;
}
struct CONSOLE_READCONSOLE_CONTROL
{
    uint nLength;
    uint nInitialChars;
    uint dwCtrlWakeupMask;
    uint dwControlKeyState;
}
alias PHANDLER_ROUTINE = BOOL function(uint);
struct CONSOLE_CURSOR_INFO
{
    uint dwSize;
    BOOL bVisible;
}
struct CONSOLE_SCREEN_BUFFER_INFO
{
    COORD dwSize;
    COORD dwCursorPosition;
    CONSOLE_CHARACTER_ATTRIBUTES wAttributes;
    SMALL_RECT srWindow;
    COORD dwMaximumWindowSize;
}
struct CONSOLE_SCREEN_BUFFER_INFOEX
{
    uint cbSize;
    COORD dwSize;
    COORD dwCursorPosition;
    CONSOLE_CHARACTER_ATTRIBUTES wAttributes;
    SMALL_RECT srWindow;
    COORD dwMaximumWindowSize;
    ushort wPopupAttributes;
    BOOL bFullscreenSupported;
    COLORREF[16] ColorTable;
}
struct CONSOLE_FONT_INFOEX
{
    uint cbSize;
    uint nFont;
    COORD dwFontSize;
    uint FontFamily;
    uint FontWeight;
    wchar[32] FaceName;
}
struct CONSOLE_SELECTION_INFO
{
    uint dwFlags;
    COORD dwSelectionAnchor;
    SMALL_RECT srSelection;
}
struct CONSOLE_HISTORY_INFO
{
    uint cbSize;
    uint HistoryBufferSize;
    uint NumberOfHistoryBuffers;
    uint dwFlags;
}
alias CONSOLECONTROL = int;
enum : int
{
    Reserved1                       = 0x00000000,
    ConsoleNotifyConsoleApplication = 0x00000001,
    Reserved2                       = 0x00000002,
    ConsoleSetCaretInfo             = 0x00000003,
    Reserved3                       = 0x00000004,
    ConsoleSetForeground            = 0x00000005,
    ConsoleSetWindowOwner           = 0x00000006,
    ConsoleEndTask                  = 0x00000007,
}

struct CONSOLEENDTASK
{
    HANDLE ProcessId;
    HWND hwnd;
    uint ConsoleEventCode;
    uint ConsoleFlags;
}
struct CONSOLEWINDOWOWNER
{
    HWND hwnd;
    uint ProcessId;
    uint ThreadId;
}
struct CONSOLESETFOREGROUND
{
    HANDLE hProcess;
    BOOL bForeground;
}
struct CONSOLE_PROCESS_INFO
{
    uint dwProcessID;
    uint dwFlags;
}
struct CONSOLE_CARET_INFO
{
    HWND hwnd;
    RECT rc;
}
