module windows.win32.ui.input.xboxcontroller;

import windows.win32.foundation : BOOL, PWSTR;

version (Windows):
extern (Windows):

alias XINPUT_VIRTUAL_KEY = ushort;
enum : ushort
{
    VK_PAD_A                = 0x5800,
    VK_PAD_B                = 0x5801,
    VK_PAD_X                = 0x5802,
    VK_PAD_Y                = 0x5803,
    VK_PAD_RSHOULDER        = 0x5804,
    VK_PAD_LSHOULDER        = 0x5805,
    VK_PAD_LTRIGGER         = 0x5806,
    VK_PAD_RTRIGGER         = 0x5807,
    VK_PAD_DPAD_UP          = 0x5810,
    VK_PAD_DPAD_DOWN        = 0x5811,
    VK_PAD_DPAD_LEFT        = 0x5812,
    VK_PAD_DPAD_RIGHT       = 0x5813,
    VK_PAD_START            = 0x5814,
    VK_PAD_BACK             = 0x5815,
    VK_PAD_LTHUMB_PRESS     = 0x5816,
    VK_PAD_RTHUMB_PRESS     = 0x5817,
    VK_PAD_LTHUMB_UP        = 0x5820,
    VK_PAD_LTHUMB_DOWN      = 0x5821,
    VK_PAD_LTHUMB_RIGHT     = 0x5822,
    VK_PAD_LTHUMB_LEFT      = 0x5823,
    VK_PAD_LTHUMB_UPLEFT    = 0x5824,
    VK_PAD_LTHUMB_UPRIGHT   = 0x5825,
    VK_PAD_LTHUMB_DOWNRIGHT = 0x5826,
    VK_PAD_LTHUMB_DOWNLEFT  = 0x5827,
    VK_PAD_RTHUMB_UP        = 0x5830,
    VK_PAD_RTHUMB_DOWN      = 0x5831,
    VK_PAD_RTHUMB_RIGHT     = 0x5832,
    VK_PAD_RTHUMB_LEFT      = 0x5833,
    VK_PAD_RTHUMB_UPLEFT    = 0x5834,
    VK_PAD_RTHUMB_UPRIGHT   = 0x5835,
    VK_PAD_RTHUMB_DOWNRIGHT = 0x5836,
    VK_PAD_RTHUMB_DOWNLEFT  = 0x5837,
}

alias BATTERY_TYPE = uint;
enum : uint
{
    BATTERY_TYPE_DISCONNECTED = 0x00000000,
    BATTERY_TYPE_WIRED        = 0x00000001,
    BATTERY_TYPE_ALKALINE     = 0x00000002,
    BATTERY_TYPE_NIMH         = 0x00000003,
    BATTERY_TYPE_UNKNOWN      = 0x000000ff,
}

alias BATTERY_LEVEL = uint;
enum : uint
{
    BATTERY_LEVEL_EMPTY  = 0x00000000,
    BATTERY_LEVEL_LOW    = 0x00000001,
    BATTERY_LEVEL_MEDIUM = 0x00000002,
    BATTERY_LEVEL_FULL   = 0x00000003,
}

alias BATTERY_DEVTYPE = uint;
enum : uint
{
    BATTERY_DEVTYPE_GAMEPAD = 0x00000000,
    BATTERY_DEVTYPE_HEADSET = 0x00000001,
}

alias XINPUT_DEVTYPE = uint;
enum : uint
{
    XINPUT_DEVTYPE_GAMEPAD = 0x00000001,
}

alias XINPUT_DEVSUBTYPE = uint;
enum : uint
{
    XINPUT_DEVSUBTYPE_GAMEPAD          = 0x00000001,
    XINPUT_DEVSUBTYPE_UNKNOWN          = 0x00000000,
    XINPUT_DEVSUBTYPE_WHEEL            = 0x00000002,
    XINPUT_DEVSUBTYPE_ARCADE_STICK     = 0x00000003,
    XINPUT_DEVSUBTYPE_FLIGHT_STICK     = 0x00000004,
    XINPUT_DEVSUBTYPE_DANCE_PAD        = 0x00000005,
    XINPUT_DEVSUBTYPE_GUITAR           = 0x00000006,
    XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE = 0x00000007,
    XINPUT_DEVSUBTYPE_DRUM_KIT         = 0x00000008,
    XINPUT_DEVSUBTYPE_GUITAR_BASS      = 0x0000000b,
    XINPUT_DEVSUBTYPE_ARCADE_PAD       = 0x00000013,
}

alias XINPUT_CAPABILITIES_FLAGS = ushort;
enum : ushort
{
    XINPUT_CAPS_VOICE_SUPPORTED = 0x0004,
    XINPUT_CAPS_FFB_SUPPORTED   = 0x0001,
    XINPUT_CAPS_WIRELESS        = 0x0002,
    XINPUT_CAPS_PMD_SUPPORTED   = 0x0008,
    XINPUT_CAPS_NO_NAVIGATION   = 0x0010,
}

alias XINPUT_GAMEPAD_BUTTON_FLAGS = ushort;
enum : ushort
{
    XINPUT_GAMEPAD_DPAD_UP              = 0x0001,
    XINPUT_GAMEPAD_DPAD_DOWN            = 0x0002,
    XINPUT_GAMEPAD_DPAD_LEFT            = 0x0004,
    XINPUT_GAMEPAD_DPAD_RIGHT           = 0x0008,
    XINPUT_GAMEPAD_START                = 0x0010,
    XINPUT_GAMEPAD_BACK                 = 0x0020,
    XINPUT_GAMEPAD_LEFT_THUMB           = 0x0040,
    XINPUT_GAMEPAD_RIGHT_THUMB          = 0x0080,
    XINPUT_GAMEPAD_LEFT_SHOULDER        = 0x0100,
    XINPUT_GAMEPAD_RIGHT_SHOULDER       = 0x0200,
    XINPUT_GAMEPAD_A                    = 0x1000,
    XINPUT_GAMEPAD_B                    = 0x2000,
    XINPUT_GAMEPAD_X                    = 0x4000,
    XINPUT_GAMEPAD_Y                    = 0x8000,
    XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE  = 0x1ea9,
    XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE = 0x21f1,
    XINPUT_GAMEPAD_TRIGGER_THRESHOLD    = 0x001e,
}

alias XINPUT_KEYSTROKE_FLAGS = ushort;
enum : ushort
{
    XINPUT_KEYSTROKE_KEYDOWN = 0x0001,
    XINPUT_KEYSTROKE_KEYUP   = 0x0002,
    XINPUT_KEYSTROKE_REPEAT  = 0x0004,
}

alias XINPUT_FLAG = uint;
enum : uint
{
    XINPUT_FLAG_ALL     = 0x00000000,
    XINPUT_FLAG_GAMEPAD = 0x00000001,
}

uint XInputGetState(uint, XINPUT_STATE*);
uint XInputSetState(uint, XINPUT_VIBRATION*);
uint XInputGetCapabilities(uint, XINPUT_FLAG, XINPUT_CAPABILITIES*);
void XInputEnable(BOOL);
uint XInputGetAudioDeviceIds(uint, PWSTR, uint*, PWSTR, uint*);
uint XInputGetBatteryInformation(uint, BATTERY_DEVTYPE, XINPUT_BATTERY_INFORMATION*);
uint XInputGetKeystroke(uint, uint, XINPUT_KEYSTROKE*);
enum XINPUT_DLL_A = "xinput1_4.dll";
enum XINPUT_DLL_W = "xinput1_4.dll";
enum XINPUT_DLL = "xinput1_4.dll";
enum XUSER_MAX_COUNT = 0x00000004;
enum XUSER_INDEX_ANY = 0x000000ff;
struct XINPUT_GAMEPAD
{
    XINPUT_GAMEPAD_BUTTON_FLAGS wButtons;
    ubyte bLeftTrigger;
    ubyte bRightTrigger;
    short sThumbLX;
    short sThumbLY;
    short sThumbRX;
    short sThumbRY;
}
struct XINPUT_STATE
{
    uint dwPacketNumber;
    XINPUT_GAMEPAD Gamepad;
}
struct XINPUT_VIBRATION
{
    ushort wLeftMotorSpeed;
    ushort wRightMotorSpeed;
}
struct XINPUT_CAPABILITIES
{
    XINPUT_DEVTYPE Type;
    XINPUT_DEVSUBTYPE SubType;
    XINPUT_CAPABILITIES_FLAGS Flags;
    XINPUT_GAMEPAD Gamepad;
    XINPUT_VIBRATION Vibration;
}
struct XINPUT_BATTERY_INFORMATION
{
    BATTERY_TYPE BatteryType;
    BATTERY_LEVEL BatteryLevel;
}
struct XINPUT_KEYSTROKE
{
    XINPUT_VIRTUAL_KEY VirtualKey;
    wchar Unicode;
    XINPUT_KEYSTROKE_FLAGS Flags;
    ubyte UserIndex;
    ubyte HidCode;
}
