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
BOOL AttachConsole(uint dwProcessId);
uint GetConsoleCP();
uint GetConsoleOutputCP();
BOOL GetConsoleMode(HANDLE hConsoleHandle, CONSOLE_MODE* lpMode);
BOOL SetConsoleMode(HANDLE hConsoleHandle, CONSOLE_MODE dwMode);
BOOL GetNumberOfConsoleInputEvents(HANDLE hConsoleInput, uint* lpNumberOfEvents);
BOOL ReadConsoleInputA(HANDLE hConsoleInput, INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead);
BOOL ReadConsoleInputW(HANDLE hConsoleInput, INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead);
BOOL PeekConsoleInputA(HANDLE hConsoleInput, INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead);
BOOL PeekConsoleInputW(HANDLE hConsoleInput, INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead);
BOOL ReadConsoleA(HANDLE hConsoleInput, void* lpBuffer, uint nNumberOfCharsToRead, uint* lpNumberOfCharsRead, CONSOLE_READCONSOLE_CONTROL* pInputControl);
BOOL ReadConsoleW(HANDLE hConsoleInput, void* lpBuffer, uint nNumberOfCharsToRead, uint* lpNumberOfCharsRead, CONSOLE_READCONSOLE_CONTROL* pInputControl);
BOOL WriteConsoleA(HANDLE hConsoleOutput, const(char)* lpBuffer, uint nNumberOfCharsToWrite, uint* lpNumberOfCharsWritten, void* lpReserved);
BOOL WriteConsoleW(HANDLE hConsoleOutput, const(wchar)* lpBuffer, uint nNumberOfCharsToWrite, uint* lpNumberOfCharsWritten, void* lpReserved);
BOOL SetConsoleCtrlHandler(PHANDLER_ROUTINE HandlerRoutine, BOOL Add);
HRESULT CreatePseudoConsole(COORD size, HANDLE hInput, HANDLE hOutput, uint dwFlags, HPCON* phPC);
HRESULT ResizePseudoConsole(HPCON hPC, COORD size);
void ClosePseudoConsole(HPCON hPC);
BOOL FillConsoleOutputCharacterA(HANDLE hConsoleOutput, CHAR cCharacter, uint nLength, COORD dwWriteCoord, uint* lpNumberOfCharsWritten);
BOOL FillConsoleOutputCharacterW(HANDLE hConsoleOutput, wchar cCharacter, uint nLength, COORD dwWriteCoord, uint* lpNumberOfCharsWritten);
BOOL FillConsoleOutputAttribute(HANDLE hConsoleOutput, ushort wAttribute, uint nLength, COORD dwWriteCoord, uint* lpNumberOfAttrsWritten);
BOOL GenerateConsoleCtrlEvent(uint dwCtrlEvent, uint dwProcessGroupId);
HANDLE CreateConsoleScreenBuffer(uint dwDesiredAccess, uint dwShareMode, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, uint dwFlags, void* lpScreenBufferData);
BOOL SetConsoleActiveScreenBuffer(HANDLE hConsoleOutput);
BOOL FlushConsoleInputBuffer(HANDLE hConsoleInput);
BOOL SetConsoleCP(uint wCodePageID);
BOOL SetConsoleOutputCP(uint wCodePageID);
BOOL GetConsoleCursorInfo(HANDLE hConsoleOutput, CONSOLE_CURSOR_INFO* lpConsoleCursorInfo);
BOOL SetConsoleCursorInfo(HANDLE hConsoleOutput, const(CONSOLE_CURSOR_INFO)* lpConsoleCursorInfo);
BOOL GetConsoleScreenBufferInfo(HANDLE hConsoleOutput, CONSOLE_SCREEN_BUFFER_INFO* lpConsoleScreenBufferInfo);
BOOL GetConsoleScreenBufferInfoEx(HANDLE hConsoleOutput, CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx);
BOOL SetConsoleScreenBufferInfoEx(HANDLE hConsoleOutput, CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx);
BOOL SetConsoleScreenBufferSize(HANDLE hConsoleOutput, COORD dwSize);
BOOL SetConsoleCursorPosition(HANDLE hConsoleOutput, COORD dwCursorPosition);
COORD GetLargestConsoleWindowSize(HANDLE hConsoleOutput);
BOOL SetConsoleTextAttribute(HANDLE hConsoleOutput, CONSOLE_CHARACTER_ATTRIBUTES wAttributes);
BOOL SetConsoleWindowInfo(HANDLE hConsoleOutput, BOOL bAbsolute, const(SMALL_RECT)* lpConsoleWindow);
BOOL WriteConsoleOutputCharacterA(HANDLE hConsoleOutput, const(char)* lpCharacter, uint nLength, COORD dwWriteCoord, uint* lpNumberOfCharsWritten);
BOOL WriteConsoleOutputCharacterW(HANDLE hConsoleOutput, const(wchar)* lpCharacter, uint nLength, COORD dwWriteCoord, uint* lpNumberOfCharsWritten);
BOOL WriteConsoleOutputAttribute(HANDLE hConsoleOutput, const(ushort)* lpAttribute, uint nLength, COORD dwWriteCoord, uint* lpNumberOfAttrsWritten);
BOOL ReadConsoleOutputCharacterA(HANDLE hConsoleOutput, PSTR lpCharacter, uint nLength, COORD dwReadCoord, uint* lpNumberOfCharsRead);
BOOL ReadConsoleOutputCharacterW(HANDLE hConsoleOutput, PWSTR lpCharacter, uint nLength, COORD dwReadCoord, uint* lpNumberOfCharsRead);
BOOL ReadConsoleOutputAttribute(HANDLE hConsoleOutput, ushort* lpAttribute, uint nLength, COORD dwReadCoord, uint* lpNumberOfAttrsRead);
BOOL WriteConsoleInputA(HANDLE hConsoleInput, const(INPUT_RECORD)* lpBuffer, uint nLength, uint* lpNumberOfEventsWritten);
BOOL WriteConsoleInputW(HANDLE hConsoleInput, const(INPUT_RECORD)* lpBuffer, uint nLength, uint* lpNumberOfEventsWritten);
BOOL ScrollConsoleScreenBufferA(HANDLE hConsoleOutput, const(SMALL_RECT)* lpScrollRectangle, const(SMALL_RECT)* lpClipRectangle, COORD dwDestinationOrigin, const(CHAR_INFO)* lpFill);
BOOL ScrollConsoleScreenBufferW(HANDLE hConsoleOutput, const(SMALL_RECT)* lpScrollRectangle, const(SMALL_RECT)* lpClipRectangle, COORD dwDestinationOrigin, const(CHAR_INFO)* lpFill);
BOOL WriteConsoleOutputA(HANDLE hConsoleOutput, const(CHAR_INFO)* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, SMALL_RECT* lpWriteRegion);
BOOL WriteConsoleOutputW(HANDLE hConsoleOutput, const(CHAR_INFO)* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, SMALL_RECT* lpWriteRegion);
BOOL ReadConsoleOutputA(HANDLE hConsoleOutput, CHAR_INFO* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, SMALL_RECT* lpReadRegion);
BOOL ReadConsoleOutputW(HANDLE hConsoleOutput, CHAR_INFO* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, SMALL_RECT* lpReadRegion);
uint GetConsoleTitleA(PSTR lpConsoleTitle, uint nSize);
uint GetConsoleTitleW(PWSTR lpConsoleTitle, uint nSize);
uint GetConsoleOriginalTitleA(PSTR lpConsoleTitle, uint nSize);
uint GetConsoleOriginalTitleW(PWSTR lpConsoleTitle, uint nSize);
BOOL SetConsoleTitleA(const(char)* lpConsoleTitle);
BOOL SetConsoleTitleW(const(wchar)* lpConsoleTitle);
BOOL GetNumberOfConsoleMouseButtons(uint* lpNumberOfMouseButtons);
COORD GetConsoleFontSize(HANDLE hConsoleOutput, uint nFont);
BOOL GetCurrentConsoleFont(HANDLE hConsoleOutput, BOOL bMaximumWindow, CONSOLE_FONT_INFO* lpConsoleCurrentFont);
BOOL GetCurrentConsoleFontEx(HANDLE hConsoleOutput, BOOL bMaximumWindow, CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx);
BOOL SetCurrentConsoleFontEx(HANDLE hConsoleOutput, BOOL bMaximumWindow, CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx);
BOOL GetConsoleSelectionInfo(CONSOLE_SELECTION_INFO* lpConsoleSelectionInfo);
BOOL GetConsoleHistoryInfo(CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo);
BOOL SetConsoleHistoryInfo(CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo);
BOOL GetConsoleDisplayMode(uint* lpModeFlags);
BOOL SetConsoleDisplayMode(HANDLE hConsoleOutput, uint dwFlags, COORD* lpNewScreenBufferDimensions);
HWND GetConsoleWindow();
BOOL AddConsoleAliasA(PSTR Source, PSTR Target, PSTR ExeName);
BOOL AddConsoleAliasW(PWSTR Source, PWSTR Target, PWSTR ExeName);
uint GetConsoleAliasA(PSTR Source, PSTR TargetBuffer, uint TargetBufferLength, PSTR ExeName);
uint GetConsoleAliasW(PWSTR Source, PWSTR TargetBuffer, uint TargetBufferLength, PWSTR ExeName);
uint GetConsoleAliasesLengthA(PSTR ExeName);
uint GetConsoleAliasesLengthW(PWSTR ExeName);
uint GetConsoleAliasExesLengthA();
uint GetConsoleAliasExesLengthW();
uint GetConsoleAliasesA(PSTR AliasBuffer, uint AliasBufferLength, PSTR ExeName);
uint GetConsoleAliasesW(PWSTR AliasBuffer, uint AliasBufferLength, PWSTR ExeName);
uint GetConsoleAliasExesA(PSTR ExeNameBuffer, uint ExeNameBufferLength);
uint GetConsoleAliasExesW(PWSTR ExeNameBuffer, uint ExeNameBufferLength);
void ExpungeConsoleCommandHistoryA(PSTR ExeName);
void ExpungeConsoleCommandHistoryW(PWSTR ExeName);
BOOL SetConsoleNumberOfCommandsA(uint Number, PSTR ExeName);
BOOL SetConsoleNumberOfCommandsW(uint Number, PWSTR ExeName);
uint GetConsoleCommandHistoryLengthA(PSTR ExeName);
uint GetConsoleCommandHistoryLengthW(PWSTR ExeName);
uint GetConsoleCommandHistoryA(PSTR Commands, uint CommandBufferLength, PSTR ExeName);
uint GetConsoleCommandHistoryW(PWSTR Commands, uint CommandBufferLength, PWSTR ExeName);
uint GetConsoleProcessList(uint* lpdwProcessList, uint dwProcessCount);
NTSTATUS ConsoleControl(CONSOLECONTROL Command, void* ConsoleInformation, uint ConsoleInformationLength);
HANDLE GetStdHandle(STD_HANDLE nStdHandle);
BOOL SetStdHandle(STD_HANDLE nStdHandle, HANDLE hHandle);
BOOL SetStdHandleEx(STD_HANDLE nStdHandle, HANDLE hHandle, HANDLE* phPrevValue);
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
alias PHANDLER_ROUTINE = BOOL function(uint CtrlType);
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
