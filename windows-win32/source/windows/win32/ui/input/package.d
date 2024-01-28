module windows.win32.ui.input;

import windows.win32.foundation : BOOL, HANDLE, HWND, LRESULT, WPARAM;

version (Windows):
extern (Windows):

alias RAW_INPUT_DATA_COMMAND_FLAGS = uint;
enum : uint
{
    RID_HEADER = 0x10000005,
    RID_INPUT  = 0x10000003,
}

alias RAW_INPUT_DEVICE_INFO_COMMAND = uint;
enum : uint
{
    RIDI_PREPARSEDDATA = 0x20000005,
    RIDI_DEVICENAME    = 0x20000007,
    RIDI_DEVICEINFO    = 0x2000000b,
}

alias RID_DEVICE_INFO_TYPE = uint;
enum : uint
{
    RIM_TYPEMOUSE    = 0x00000000,
    RIM_TYPEKEYBOARD = 0x00000001,
    RIM_TYPEHID      = 0x00000002,
}

alias RAWINPUTDEVICE_FLAGS = uint;
enum : uint
{
    RIDEV_REMOVE       = 0x00000001,
    RIDEV_EXCLUDE      = 0x00000010,
    RIDEV_PAGEONLY     = 0x00000020,
    RIDEV_NOLEGACY     = 0x00000030,
    RIDEV_INPUTSINK    = 0x00000100,
    RIDEV_CAPTUREMOUSE = 0x00000200,
    RIDEV_NOHOTKEYS    = 0x00000200,
    RIDEV_APPKEYS      = 0x00000400,
    RIDEV_EXINPUTSINK  = 0x00001000,
    RIDEV_DEVNOTIFY    = 0x00002000,
}

alias HRAWINPUT = void*;
struct RAWINPUTHEADER
{
    uint dwType;
    uint dwSize;
    HANDLE hDevice;
    WPARAM wParam;
}
struct RAWMOUSE
{
    ushort usFlags;
    union
    {
        uint ulButtons;
        struct
        {
            ushort usButtonFlags;
            ushort usButtonData;
        }
    }
    uint ulRawButtons;
    int lLastX;
    int lLastY;
    uint ulExtraInformation;
}
struct RAWKEYBOARD
{
    ushort MakeCode;
    ushort Flags;
    ushort Reserved;
    ushort VKey;
    uint Message;
    uint ExtraInformation;
}
struct RAWHID
{
    uint dwSizeHid;
    uint dwCount;
    ubyte[1] bRawData;
}
struct RAWINPUT
{
    RAWINPUTHEADER header;
    union data
    {
        RAWMOUSE mouse;
        RAWKEYBOARD keyboard;
        RAWHID hid;
    }
}
struct RID_DEVICE_INFO_MOUSE
{
    uint dwId;
    uint dwNumberOfButtons;
    uint dwSampleRate;
    BOOL fHasHorizontalWheel;
}
struct RID_DEVICE_INFO_KEYBOARD
{
    uint dwType;
    uint dwSubType;
    uint dwKeyboardMode;
    uint dwNumberOfFunctionKeys;
    uint dwNumberOfIndicators;
    uint dwNumberOfKeysTotal;
}
struct RID_DEVICE_INFO_HID
{
    uint dwVendorId;
    uint dwProductId;
    uint dwVersionNumber;
    ushort usUsagePage;
    ushort usUsage;
}
struct RID_DEVICE_INFO
{
    uint cbSize;
    RID_DEVICE_INFO_TYPE dwType;
    union
    {
        RID_DEVICE_INFO_MOUSE mouse;
        RID_DEVICE_INFO_KEYBOARD keyboard;
        RID_DEVICE_INFO_HID hid;
    }
}
struct RAWINPUTDEVICE
{
    ushort usUsagePage;
    ushort usUsage;
    RAWINPUTDEVICE_FLAGS dwFlags;
    HWND hwndTarget;
}
struct RAWINPUTDEVICELIST
{
    HANDLE hDevice;
    RID_DEVICE_INFO_TYPE dwType;
}
alias INPUT_MESSAGE_DEVICE_TYPE = int;
enum : int
{
    IMDT_UNAVAILABLE = 0x00000000,
    IMDT_KEYBOARD    = 0x00000001,
    IMDT_MOUSE       = 0x00000002,
    IMDT_TOUCH       = 0x00000004,
    IMDT_PEN         = 0x00000008,
    IMDT_TOUCHPAD    = 0x00000010,
}

alias INPUT_MESSAGE_ORIGIN_ID = int;
enum : int
{
    IMO_UNAVAILABLE = 0x00000000,
    IMO_HARDWARE    = 0x00000001,
    IMO_INJECTED    = 0x00000002,
    IMO_SYSTEM      = 0x00000004,
}

struct INPUT_MESSAGE_SOURCE
{
    INPUT_MESSAGE_DEVICE_TYPE deviceType;
    INPUT_MESSAGE_ORIGIN_ID originId;
}
uint GetRawInputData(HRAWINPUT, RAW_INPUT_DATA_COMMAND_FLAGS, void*, uint*, uint);
uint GetRawInputDeviceInfoA(HANDLE, RAW_INPUT_DEVICE_INFO_COMMAND, void*, uint*);
uint GetRawInputDeviceInfoW(HANDLE, RAW_INPUT_DEVICE_INFO_COMMAND, void*, uint*);
uint GetRawInputBuffer(RAWINPUT*, uint*, uint);
BOOL RegisterRawInputDevices(RAWINPUTDEVICE*, uint, uint);
uint GetRegisteredRawInputDevices(RAWINPUTDEVICE*, uint*, uint);
uint GetRawInputDeviceList(RAWINPUTDEVICELIST*, uint*, uint);
LRESULT DefRawInputProc(RAWINPUT**, int, uint);
BOOL GetCurrentInputMessageSource(INPUT_MESSAGE_SOURCE*);
BOOL GetCIMSSM(INPUT_MESSAGE_SOURCE*);
