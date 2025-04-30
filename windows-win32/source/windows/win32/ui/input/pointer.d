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
BOOL InitializeTouchInjection(uint maxCount, TOUCH_FEEDBACK_MODE dwMode);
BOOL InjectTouchInput(uint count, const(POINTER_TOUCH_INFO)* contacts);
BOOL GetPointerType(uint pointerId, POINTER_INPUT_TYPE* pointerType);
BOOL GetPointerCursorId(uint pointerId, uint* cursorId);
BOOL GetPointerInfo(uint pointerId, POINTER_INFO* pointerInfo);
BOOL GetPointerInfoHistory(uint pointerId, uint* entriesCount, POINTER_INFO* pointerInfo);
BOOL GetPointerFrameInfo(uint pointerId, uint* pointerCount, POINTER_INFO* pointerInfo);
BOOL GetPointerFrameInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, POINTER_INFO* pointerInfo);
BOOL GetPointerTouchInfo(uint pointerId, POINTER_TOUCH_INFO* touchInfo);
BOOL GetPointerTouchInfoHistory(uint pointerId, uint* entriesCount, POINTER_TOUCH_INFO* touchInfo);
BOOL GetPointerFrameTouchInfo(uint pointerId, uint* pointerCount, POINTER_TOUCH_INFO* touchInfo);
BOOL GetPointerFrameTouchInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, POINTER_TOUCH_INFO* touchInfo);
BOOL GetPointerPenInfo(uint pointerId, POINTER_PEN_INFO* penInfo);
BOOL GetPointerPenInfoHistory(uint pointerId, uint* entriesCount, POINTER_PEN_INFO* penInfo);
BOOL GetPointerFramePenInfo(uint pointerId, uint* pointerCount, POINTER_PEN_INFO* penInfo);
BOOL GetPointerFramePenInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, POINTER_PEN_INFO* penInfo);
BOOL SkipPointerFrameMessages(uint pointerId);
BOOL InjectSyntheticPointerInput(HSYNTHETICPOINTERDEVICE device, const(POINTER_TYPE_INFO)* pointerInfo, uint count);
BOOL EnableMouseInPointer(BOOL fEnable);
BOOL IsMouseInPointerEnabled();
BOOL GetPointerInputTransform(uint pointerId, uint historyCount, INPUT_TRANSFORM* inputTransform);
BOOL GetPointerDevices(uint* deviceCount, POINTER_DEVICE_INFO* pointerDevices);
BOOL GetPointerDevice(HANDLE device, POINTER_DEVICE_INFO* pointerDevice);
BOOL GetPointerDeviceProperties(HANDLE device, uint* propertyCount, POINTER_DEVICE_PROPERTY* pointerProperties);
BOOL GetPointerDeviceRects(HANDLE device, RECT* pointerDeviceRect, RECT* displayRect);
BOOL GetPointerDeviceCursors(HANDLE device, uint* cursorCount, POINTER_DEVICE_CURSOR_INFO* deviceCursors);
BOOL GetRawPointerDeviceData(uint pointerId, uint historyCount, uint propertiesCount, POINTER_DEVICE_PROPERTY* pProperties, int* pValues);
