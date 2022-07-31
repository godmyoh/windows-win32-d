module windows.win32.system.sideshow;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR, SYSTEMTIME;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

enum SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT = GUID(0xa9a5353f, 0x2d4b, 0x47ce, [0x93, 0xee, 0x75, 0x9f, 0x3a, 0x7d, 0xda, 0x4f]);
enum SIDESHOW_ENDPOINT_ICAL = GUID(0x4dff36b5, 0x9dde, 0x4f76, [0x9a, 0x2a, 0x96, 0x43, 0x50, 0x47, 0x6, 0x3d]);
enum SIDESHOW_CAPABILITY_DEVICE_PROPERTIES = GUID(0x8abc88a8, 0x857b, 0x4ad7, [0xa3, 0x5a, 0xb5, 0x94, 0x2f, 0x49, 0x2b, 0x99]);
//enum SIDESHOW_CAPABILITY_DEVICE_ID = [MISSING];
//enum SIDESHOW_CAPABILITY_SCREEN_TYPE = [MISSING];
//enum SIDESHOW_CAPABILITY_SCREEN_WIDTH = [MISSING];
//enum SIDESHOW_CAPABILITY_SCREEN_HEIGHT = [MISSING];
//enum SIDESHOW_CAPABILITY_COLOR_DEPTH = [MISSING];
//enum SIDESHOW_CAPABILITY_COLOR_TYPE = [MISSING];
//enum SIDESHOW_CAPABILITY_DATA_CACHE = [MISSING];
//enum SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES = [MISSING];
//enum SIDESHOW_CAPABILITY_CURRENT_LANGUAGE = [MISSING];
//enum SIDESHOW_CAPABILITY_SUPPORTED_THEMES = [MISSING];
//enum SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS = [MISSING];
//enum SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH = [MISSING];
//enum SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT = [MISSING];
enum GUID_DEVINTERFACE_SIDESHOW = GUID(0x152e5811, 0xfeb9, 0x4b00, [0x90, 0xf4, 0xd3, 0x29, 0x47, 0xae, 0x16, 0x81]);
enum SIDESHOW_CONTENT_MISSING_EVENT = GUID(0x5007fba8, 0xd313, 0x439f, [0xbe, 0xa2, 0xa5, 0x2, 0x1, 0xd3, 0xe9, 0xa8]);
enum SIDESHOW_APPLICATION_EVENT = GUID(0x4cb572fa, 0x1d3b, 0x49b3, [0xa1, 0x7a, 0x2e, 0x6b, 0xff, 0x5, 0x28, 0x54]);
enum SIDESHOW_USER_CHANGE_REQUEST_EVENT = GUID(0x5009673c, 0x3f7d, 0x4c7e, [0x99, 0x71, 0xea, 0xa2, 0xe9, 0x1f, 0x15, 0x75]);
enum SIDESHOW_NEW_EVENT_DATA_AVAILABLE = GUID(0x57813854, 0x2fc1, 0x411c, [0xa5, 0x9f, 0xf2, 0x49, 0x27, 0x60, 0x88, 0x4]);
enum CONTENT_ID_GLANCE = 0x00000000;
enum SIDESHOW_EVENTID_APPLICATION_ENTER = 0xffff0000;
enum SIDESHOW_EVENTID_APPLICATION_EXIT = 0xffff0001;
enum CONTENT_ID_HOME = 0x00000001;
enum VERSION_1_WINDOWS_7 = 0x00000000;
enum CLSID_SideShowSession = GUID(0xe20543b9, 0xf785, 0x4ea2, [0x98, 0x1e, 0xc4, 0xff, 0xa7, 0x6b, 0xbc, 0x7c]);
struct SideShowSession
{
}
enum CLSID_SideShowNotification = GUID(0xce3e86f, 0xd5cd, 0x4525, [0xa7, 0x66, 0x1a, 0xba, 0xb1, 0xa7, 0x52, 0xf5]);
struct SideShowNotification
{
}
enum CLSID_SideShowKeyCollection = GUID(0xdfbbdbf8, 0x18de, 0x49b8, [0x83, 0xdc, 0xeb, 0xc7, 0x27, 0xc6, 0x2d, 0x94]);
struct SideShowKeyCollection
{
}
enum CLSID_SideShowPropVariantCollection = GUID(0xe640f415, 0x539e, 0x4923, [0x96, 0xcd, 0x5f, 0x9, 0x3b, 0xc2, 0x50, 0xcd]);
struct SideShowPropVariantCollection
{
}
enum IID_ISideShowSession = GUID(0xe22331ee, 0x9e7d, 0x4922, [0x9f, 0xc2, 0xab, 0x7a, 0xa4, 0x1c, 0xe4, 0x91]);
interface ISideShowSession : IUnknown
{
    HRESULT RegisterContent(GUID*, GUID*, ISideShowContentManager*);
    HRESULT RegisterNotifications(GUID*, ISideShowNotificationManager*);
}
enum IID_ISideShowNotificationManager = GUID(0x63cea909, 0xf2b9, 0x4302, [0xb5, 0xe1, 0xc6, 0x8e, 0x6d, 0x9a, 0xb8, 0x33]);
interface ISideShowNotificationManager : IUnknown
{
    HRESULT Show(ISideShowNotification);
    HRESULT Revoke(const(uint));
    HRESULT RevokeAll();
}
enum IID_ISideShowNotification = GUID(0x3c93300, 0x8ab2, 0x41c5, [0x9b, 0x79, 0x46, 0x12, 0x7a, 0x30, 0xe1, 0x48]);
interface ISideShowNotification : IUnknown
{
    HRESULT get_NotificationId(uint*);
    HRESULT put_NotificationId(uint);
    HRESULT get_Title(PWSTR*);
    HRESULT put_Title(PWSTR);
    HRESULT get_Message(PWSTR*);
    HRESULT put_Message(PWSTR);
    HRESULT get_Image(HICON*);
    HRESULT put_Image(HICON);
    HRESULT get_ExpirationTime(SYSTEMTIME*);
    HRESULT put_ExpirationTime(SYSTEMTIME*);
}
enum IID_ISideShowContentManager = GUID(0xa5d5b66b, 0xeef9, 0x41db, [0x8d, 0x7e, 0xe1, 0x7c, 0x33, 0xab, 0x10, 0xb0]);
interface ISideShowContentManager : IUnknown
{
    HRESULT Add(ISideShowContent);
    HRESULT Remove(const(uint));
    HRESULT RemoveAll();
    HRESULT SetEventSink(ISideShowEvents);
    HRESULT GetDeviceCapabilities(ISideShowCapabilitiesCollection*);
}
enum IID_ISideShowContent = GUID(0xc18552ed, 0x74ff, 0x4fec, [0xbe, 0x7, 0x4c, 0xfe, 0xd2, 0x9d, 0x48, 0x87]);
interface ISideShowContent : IUnknown
{
    HRESULT GetContent(ISideShowCapabilities, uint*, ubyte**);
    HRESULT get_ContentId(uint*);
    HRESULT get_DifferentiateContent(BOOL*);
}
enum IID_ISideShowEvents = GUID(0x61feca4c, 0xdeb4, 0x4a7e, [0x8d, 0x75, 0x51, 0xf1, 0x13, 0x2d, 0x61, 0x5b]);
interface ISideShowEvents : IUnknown
{
    HRESULT ContentMissing(const(uint), ISideShowContent*);
    HRESULT ApplicationEvent(ISideShowCapabilities, const(uint), const(uint), const(ubyte)*);
    HRESULT DeviceAdded(ISideShowCapabilities);
    HRESULT DeviceRemoved(ISideShowCapabilities);
}
enum IID_ISideShowCapabilities = GUID(0x535e1379, 0xc09e, 0x4a54, [0xa5, 0x11, 0x59, 0x7b, 0xab, 0x3a, 0x72, 0xb8]);
interface ISideShowCapabilities : IUnknown
{
    HRESULT GetCapability(const(PROPERTYKEY)*, PROPVARIANT*);
}
enum IID_ISideShowCapabilitiesCollection = GUID(0x50305597, 0x5e0d, 0x4ff7, [0xb3, 0xaf, 0x33, 0xd0, 0xd9, 0xbd, 0x52, 0xdd]);
interface ISideShowCapabilitiesCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, ISideShowCapabilities*);
}
enum IID_ISideShowBulkCapabilities = GUID(0x3a2b7fbc, 0x3ad5, 0x48bd, [0xbb, 0xf1, 0xe, 0x6c, 0xfb, 0xd1, 0x8, 0x7]);
interface ISideShowBulkCapabilities : ISideShowCapabilities
{
    HRESULT GetCapabilities(ISideShowKeyCollection, ISideShowPropVariantCollection*);
}
enum IID_ISideShowKeyCollection = GUID(0x45473bc, 0xa37b, 0x4957, [0xb1, 0x44, 0x68, 0x10, 0x54, 0x11, 0xed, 0x8e]);
interface ISideShowKeyCollection : IUnknown
{
    HRESULT Add(const(PROPERTYKEY)*);
    HRESULT Clear();
    HRESULT GetAt(const(uint), PROPERTYKEY*);
    HRESULT GetCount(uint*);
    HRESULT RemoveAt(const(uint));
}
enum IID_ISideShowPropVariantCollection = GUID(0x2ea7a549, 0x7bff, 0x4aae, [0xba, 0xb0, 0x22, 0xd4, 0x31, 0x11, 0xde, 0x49]);
interface ISideShowPropVariantCollection : IUnknown
{
    HRESULT Add(const(PROPVARIANT)*);
    HRESULT Clear();
    HRESULT GetAt(const(uint), PROPVARIANT*);
    HRESULT GetCount(uint*);
    HRESULT RemoveAt(const(uint));
}
alias SIDESHOW_SCREEN_TYPE = int;
enum : int
{
    SIDESHOW_SCREEN_TYPE_BITMAP = 0x00000000,
    SIDESHOW_SCREEN_TYPE_TEXT   = 0x00000001,
}

alias SIDESHOW_COLOR_TYPE = int;
enum : int
{
    SIDESHOW_COLOR_TYPE_COLOR           = 0x00000000,
    SIDESHOW_COLOR_TYPE_GREYSCALE       = 0x00000001,
    SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE = 0x00000002,
}

alias SCF_EVENT_IDS = int;
enum : int
{
    SCF_EVENT_NAVIGATION  = 0x00000001,
    SCF_EVENT_MENUACTION  = 0x00000002,
    SCF_EVENT_CONTEXTMENU = 0x00000003,
}

alias SCF_BUTTON_IDS = int;
enum : int
{
    SCF_BUTTON_MENU        = 0x00000001,
    SCF_BUTTON_SELECT      = 0x00000002,
    SCF_BUTTON_UP          = 0x00000003,
    SCF_BUTTON_DOWN        = 0x00000004,
    SCF_BUTTON_LEFT        = 0x00000005,
    SCF_BUTTON_RIGHT       = 0x00000006,
    SCF_BUTTON_PLAY        = 0x00000007,
    SCF_BUTTON_PAUSE       = 0x00000008,
    SCF_BUTTON_FASTFORWARD = 0x00000009,
    SCF_BUTTON_REWIND      = 0x0000000a,
    SCF_BUTTON_STOP        = 0x0000000b,
    SCF_BUTTON_BACK        = 0x0000ff00,
}

struct SCF_EVENT_HEADER
{
    uint PreviousPage;
    uint TargetPage;
}
struct SCF_NAVIGATION_EVENT
{
    uint PreviousPage;
    uint TargetPage;
    uint Button;
}
struct SCF_MENUACTION_EVENT
{
    uint PreviousPage;
    uint TargetPage;
    uint Button;
    uint ItemId;
}
struct SCF_CONTEXTMENU_EVENT
{
    uint PreviousPage;
    uint TargetPage;
    uint PreviousItemId;
    uint MenuPage;
    uint MenuItemId;
}
struct CONTENT_MISSING_EVENT_DATA
{
    align (1):
    uint cbContentMissingEventData;
    GUID ApplicationId;
    GUID EndpointId;
    uint ContentId;
}
struct APPLICATION_EVENT_DATA
{
    align (1):
    uint cbApplicationEventData;
    GUID ApplicationId;
    GUID EndpointId;
    uint dwEventId;
    uint cbEventData;
    ubyte[1] bEventData;
}
struct DEVICE_USER_CHANGE_EVENT_DATA
{
    align (1):
    uint cbDeviceUserChangeEventData;
    wchar wszUser;
}
struct NEW_EVENT_DATA_AVAILABLE
{
    align (1):
    uint cbNewEventDataAvailable;
    uint dwVersion;
}
struct EVENT_DATA_HEADER
{
    align (1):
    uint cbEventDataHeader;
    GUID guidEventType;
    uint dwVersion;
    uint cbEventDataSid;
}
