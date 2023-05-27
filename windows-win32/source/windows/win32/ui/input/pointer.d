module windows.win32.ui.input.pointer;

import windows.win32.foundation : BOOL, HANDLE, HWND, POINT, RECT;
import windows.win32.ui.controls : HSYNTHETICPOINTERDEVICE, POINTER_DEVICE_CURSOR_INFO, POINTER_DEVICE_INFO, POINTER_DEVICE_PROPERTY, POINTER_TYPE_INFO;
import windows.win32.ui.windowsandmessaging : POINTER_INPUT_TYPE;

version (Windows):
extern (Windows):

alias POINTER_FLAGS = uint;
enum : uint
{
    POINTER_FLAG_NONE           = 0x00000000,
    POINTER_FLAG_NEW            = 0x00000001,
    POINTER_FLAG_INRANGE        = 0x00000002,
    POINTER_FLAG_INCONTACT      = 0x00000004,
    POINTER_FLAG_FIRSTBUTTON    = 0x00000010,
    POINTER_FLAG_SECONDBUTTON   = 0x00000020,
    POINTER_FLAG_THIRDBUTTON    = 0x00000040,
    POINTER_FLAG_FOURTHBUTTON   = 0x00000080,
    POINTER_FLAG_FIFTHBUTTON    = 0x00000100,
    POINTER_FLAG_PRIMARY        = 0x00002000,
    POINTER_FLAG_CONFIDENCE     = 0x00004000,
    POINTER_FLAG_CANCELED       = 0x00008000,
    POINTER_FLAG_DOWN           = 0x00010000,
    POINTER_FLAG_UPDATE         = 0x00020000,
    POINTER_FLAG_UP             = 0x00040000,
    POINTER_FLAG_WHEEL          = 0x00080000,
    POINTER_FLAG_HWHEEL         = 0x00100000,
    POINTER_FLAG_CAPTURECHANGED = 0x00200000,
    POINTER_FLAG_HASTRANSFORM   = 0x00400000,
}

alias TOUCH_FEEDBACK_MODE = uint;
enum : uint
{
    TOUCH_FEEDBACK_DEFAULT  = 0x00000001,
    TOUCH_FEEDBACK_INDIRECT = 0x00000002,
    TOUCH_FEEDBACK_NONE     = 0x00000003,
}

alias POINTER_BUTTON_CHANGE_TYPE = int;
enum : int
{
    POINTER_CHANGE_NONE              = 0x00000000,
    POINTER_CHANGE_FIRSTBUTTON_DOWN  = 0x00000001,
    POINTER_CHANGE_FIRSTBUTTON_UP    = 0x00000002,
    POINTER_CHANGE_SECONDBUTTON_DOWN = 0x00000003,
    POINTER_CHANGE_SECONDBUTTON_UP   = 0x00000004,
    POINTER_CHANGE_THIRDBUTTON_DOWN  = 0x00000005,
    POINTER_CHANGE_THIRDBUTTON_UP    = 0x00000006,
    POINTER_CHANGE_FOURTHBUTTON_DOWN = 0x00000007,
    POINTER_CHANGE_FOURTHBUTTON_UP   = 0x00000008,
    POINTER_CHANGE_FIFTHBUTTON_DOWN  = 0x00000009,
    POINTER_CHANGE_FIFTHBUTTON_UP    = 0x0000000a,
}

struct POINTER_INFO
{
    POINTER_INPUT_TYPE pointerType;
    uint pointerId;
    uint frameId;
    POINTER_FLAGS pointerFlags;
    HANDLE sourceDevice;
    HWND hwndTarget;
    POINT ptPixelLocation;
    POINT ptHimetricLocation;
    POINT ptPixelLocationRaw;
    POINT ptHimetricLocationRaw;
    uint dwTime;
    uint historyCount;
    int InputData;
    uint dwKeyStates;
    ulong PerformanceCount;
    POINTER_BUTTON_CHANGE_TYPE ButtonChangeType;
}
struct POINTER_TOUCH_INFO
{
    POINTER_INFO pointerInfo;
    uint touchFlags;
    uint touchMask;
    RECT rcContact;
    RECT rcContactRaw;
    uint orientation;
    uint pressure;
}
struct POINTER_PEN_INFO
{
    POINTER_INFO pointerInfo;
    uint penFlags;
    uint penMask;
    uint pressure;
    uint rotation;
    int tiltX;
    int tiltY;
}
struct INPUT_INJECTION_VALUE
{
    ushort page;
    ushort usage;
    int value;
    ushort index;
}
struct INPUT_TRANSFORM
{
    union
    {
        struct
        {
            float _11;
            float _12;
            float _13;
            float _14;
            float _21;
            float _22;
            float _23;
            float _24;
            float _31;
            float _32;
            float _33;
            float _34;
            float _41;
            float _42;
            float _43;
            float _44;
        }
        float[16] m;
    }
}
uint GetUnpredictedMessagePos();
BOOL InitializeTouchInjection(uint, TOUCH_FEEDBACK_MODE);
BOOL InjectTouchInput(uint, const(POINTER_TOUCH_INFO)*);
BOOL GetPointerType(uint, POINTER_INPUT_TYPE*);
BOOL GetPointerCursorId(uint, uint*);
BOOL GetPointerInfo(uint, POINTER_INFO*);
BOOL GetPointerInfoHistory(uint, uint*, POINTER_INFO*);
BOOL GetPointerFrameInfo(uint, uint*, POINTER_INFO*);
BOOL GetPointerFrameInfoHistory(uint, uint*, uint*, POINTER_INFO*);
BOOL GetPointerTouchInfo(uint, POINTER_TOUCH_INFO*);
BOOL GetPointerTouchInfoHistory(uint, uint*, POINTER_TOUCH_INFO*);
BOOL GetPointerFrameTouchInfo(uint, uint*, POINTER_TOUCH_INFO*);
BOOL GetPointerFrameTouchInfoHistory(uint, uint*, uint*, POINTER_TOUCH_INFO*);
BOOL GetPointerPenInfo(uint, POINTER_PEN_INFO*);
BOOL GetPointerPenInfoHistory(uint, uint*, POINTER_PEN_INFO*);
BOOL GetPointerFramePenInfo(uint, uint*, POINTER_PEN_INFO*);
BOOL GetPointerFramePenInfoHistory(uint, uint*, uint*, POINTER_PEN_INFO*);
BOOL SkipPointerFrameMessages(uint);
BOOL InjectSyntheticPointerInput(HSYNTHETICPOINTERDEVICE, const(POINTER_TYPE_INFO)*, uint);
BOOL EnableMouseInPointer(BOOL);
BOOL IsMouseInPointerEnabled();
BOOL GetPointerInputTransform(uint, uint, INPUT_TRANSFORM*);
BOOL GetPointerDevices(uint*, POINTER_DEVICE_INFO*);
BOOL GetPointerDevice(HANDLE, POINTER_DEVICE_INFO*);
BOOL GetPointerDeviceProperties(HANDLE, uint*, POINTER_DEVICE_PROPERTY*);
BOOL GetPointerDeviceRects(HANDLE, RECT*, RECT*);
BOOL GetPointerDeviceCursors(HANDLE, uint*, POINTER_DEVICE_CURSOR_INFO*);
BOOL GetRawPointerDeviceData(uint, uint, uint, POINTER_DEVICE_PROPERTY*, int*);
