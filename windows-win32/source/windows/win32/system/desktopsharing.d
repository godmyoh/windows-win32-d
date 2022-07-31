module windows.win32.system.desktopsharing;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT;
import windows.win32.system.com_ : IDispatch, IUnknown, SAFEARRAY, VARIANT;

version (Windows):
extern (Windows):

enum DISPID_RDPSRAPI_METHOD_OPEN = 0x00000064;
enum DISPID_RDPSRAPI_METHOD_CLOSE = 0x00000065;
enum DISPID_RDPSRAPI_METHOD_SETSHAREDRECT = 0x00000066;
enum DISPID_RDPSRAPI_METHOD_GETSHAREDRECT = 0x00000067;
enum DISPID_RDPSRAPI_METHOD_VIEWERCONNECT = 0x00000068;
enum DISPID_RDPSRAPI_METHOD_VIEWERDISCONNECT = 0x00000069;
enum DISPID_RDPSRAPI_METHOD_TERMINATE_CONNECTION = 0x0000006a;
enum DISPID_RDPSRAPI_METHOD_CREATE_INVITATION = 0x0000006b;
enum DISPID_RDPSRAPI_METHOD_REQUEST_CONTROL = 0x0000006c;
enum DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_CREATE = 0x0000006d;
enum DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SEND_DATA = 0x0000006e;
enum DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SET_ACCESS = 0x0000006f;
enum DISPID_RDPSRAPI_METHOD_PAUSE = 0x00000070;
enum DISPID_RDPSRAPI_METHOD_RESUME = 0x00000071;
enum DISPID_RDPSRAPI_METHOD_SHOW_WINDOW = 0x00000072;
enum DISPID_RDPSRAPI_METHOD_REQUEST_COLOR_DEPTH_CHANGE = 0x00000073;
enum DISPID_RDPSRAPI_METHOD_STARTREVCONNECTLISTENER = 0x00000074;
enum DISPID_RDPSRAPI_METHOD_CONNECTTOCLIENT = 0x00000075;
enum DISPID_RDPSRAPI_METHOD_SET_RENDERING_SURFACE = 0x00000076;
enum DISPID_RDPSRAPI_METHOD_SEND_MOUSE_BUTTON_EVENT = 0x00000077;
enum DISPID_RDPSRAPI_METHOD_SEND_MOUSE_MOVE_EVENT = 0x00000078;
enum DISPID_RDPSRAPI_METHOD_SEND_MOUSE_WHEEL_EVENT = 0x00000079;
enum DISPID_RDPSRAPI_METHOD_SEND_KEYBOARD_EVENT = 0x0000007a;
enum DISPID_RDPSRAPI_METHOD_SEND_SYNC_EVENT = 0x0000007b;
enum DISPID_RDPSRAPI_METHOD_BEGIN_TOUCH_FRAME = 0x0000007c;
enum DISPID_RDPSRAPI_METHOD_ADD_TOUCH_INPUT = 0x0000007d;
enum DISPID_RDPSRAPI_METHOD_END_TOUCH_FRAME = 0x0000007e;
enum DISPID_RDPSRAPI_METHOD_CONNECTUSINGTRANSPORTSTREAM = 0x0000007f;
enum DISPID_RDPSRAPI_METHOD_SENDCONTROLLEVELCHANGERESPONSE = 0x00000094;
enum DISPID_RDPSRAPI_METHOD_GETFRAMEBUFFERBITS = 0x00000095;
enum DISPID_RDPSRAPI_PROP_DISPIDVALUE = 0x000000c8;
enum DISPID_RDPSRAPI_PROP_ID = 0x000000c9;
enum DISPID_RDPSRAPI_PROP_SESSION_PROPERTIES = 0x000000ca;
enum DISPID_RDPSRAPI_PROP_ATTENDEES = 0x000000cb;
enum DISPID_RDPSRAPI_PROP_INVITATIONS = 0x000000cc;
enum DISPID_RDPSRAPI_PROP_INVITATION = 0x000000cd;
enum DISPID_RDPSRAPI_PROP_CHANNELMANAGER = 0x000000ce;
enum DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETNAME = 0x000000cf;
enum DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETFLAGS = 0x000000d0;
enum DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETPRIORITY = 0x000000d1;
enum DISPID_RDPSRAPI_PROP_WINDOWID = 0x000000d2;
enum DISPID_RDPSRAPI_PROP_APPLICATION = 0x000000d3;
enum DISPID_RDPSRAPI_PROP_WINDOWSHARED = 0x000000d4;
enum DISPID_RDPSRAPI_PROP_WINDOWNAME = 0x000000d5;
enum DISPID_RDPSRAPI_PROP_APPNAME = 0x000000d6;
enum DISPID_RDPSRAPI_PROP_APPLICATION_FILTER = 0x000000d7;
enum DISPID_RDPSRAPI_PROP_WINDOW_LIST = 0x000000d8;
enum DISPID_RDPSRAPI_PROP_APPLICATION_LIST = 0x000000d9;
enum DISPID_RDPSRAPI_PROP_APPFILTER_ENABLED = 0x000000da;
enum DISPID_RDPSRAPI_PROP_APPFILTERENABLED = 0x000000db;
enum DISPID_RDPSRAPI_PROP_SHARED = 0x000000dc;
enum DISPID_RDPSRAPI_PROP_INVITATIONITEM = 0x000000dd;
enum DISPID_RDPSRAPI_PROP_DBG_CLX_CMDLINE = 0x000000de;
enum DISPID_RDPSRAPI_PROP_APPFLAGS = 0x000000df;
enum DISPID_RDPSRAPI_PROP_WNDFLAGS = 0x000000e0;
enum DISPID_RDPSRAPI_PROP_PROTOCOL_TYPE = 0x000000e1;
enum DISPID_RDPSRAPI_PROP_LOCAL_PORT = 0x000000e2;
enum DISPID_RDPSRAPI_PROP_LOCAL_IP = 0x000000e3;
enum DISPID_RDPSRAPI_PROP_PEER_PORT = 0x000000e4;
enum DISPID_RDPSRAPI_PROP_PEER_IP = 0x000000e5;
enum DISPID_RDPSRAPI_PROP_ATTENDEE_FLAGS = 0x000000e6;
enum DISPID_RDPSRAPI_PROP_CONINFO = 0x000000e7;
enum DISPID_RDPSRAPI_PROP_CONNECTION_STRING = 0x000000e8;
enum DISPID_RDPSRAPI_PROP_GROUP_NAME = 0x000000e9;
enum DISPID_RDPSRAPI_PROP_PASSWORD = 0x000000ea;
enum DISPID_RDPSRAPI_PROP_ATTENDEELIMIT = 0x000000eb;
enum DISPID_RDPSRAPI_PROP_REVOKED = 0x000000ec;
enum DISPID_RDPSRAPI_PROP_DISCONNECTED_STRING = 0x000000ed;
enum DISPID_RDPSRAPI_PROP_USESMARTSIZING = 0x000000ee;
enum DISPID_RDPSRAPI_PROP_SESSION_COLORDEPTH = 0x000000ef;
enum DISPID_RDPSRAPI_PROP_REASON = 0x000000f0;
enum DISPID_RDPSRAPI_PROP_CODE = 0x000000f1;
enum DISPID_RDPSRAPI_PROP_CTRL_LEVEL = 0x000000f2;
enum DISPID_RDPSRAPI_PROP_REMOTENAME = 0x000000f3;
enum DISPID_RDPSRAPI_PROP_COUNT = 0x000000f4;
enum DISPID_RDPSRAPI_PROP_FRAMEBUFFER_HEIGHT = 0x000000fb;
enum DISPID_RDPSRAPI_PROP_FRAMEBUFFER_WIDTH = 0x000000fc;
enum DISPID_RDPSRAPI_PROP_FRAMEBUFFER_BPP = 0x000000fd;
enum DISPID_RDPSRAPI_PROP_FRAMEBUFFER = 0x000000fe;
enum DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_CONNECTED = 0x0000012d;
enum DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_DISCONNECTED = 0x0000012e;
enum DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_UPDATE = 0x0000012f;
enum DISPID_RDPSRAPI_EVENT_ON_ERROR = 0x00000130;
enum DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTED = 0x00000131;
enum DISPID_RDPSRAPI_EVENT_ON_VIEWER_DISCONNECTED = 0x00000132;
enum DISPID_RDPSRAPI_EVENT_ON_VIEWER_AUTHENTICATED = 0x00000133;
enum DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTFAILED = 0x00000134;
enum DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_REQUEST = 0x00000135;
enum DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_PAUSED = 0x00000136;
enum DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_RESUMED = 0x00000137;
enum DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_JOIN = 0x00000138;
enum DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_LEAVE = 0x00000139;
enum DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_DATARECEIVED = 0x0000013a;
enum DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_SENDCOMPLETED = 0x0000013b;
enum DISPID_RDPSRAPI_EVENT_ON_APPLICATION_OPEN = 0x0000013c;
enum DISPID_RDPSRAPI_EVENT_ON_APPLICATION_CLOSE = 0x0000013d;
enum DISPID_RDPSRAPI_EVENT_ON_APPLICATION_UPDATE = 0x0000013e;
enum DISPID_RDPSRAPI_EVENT_ON_WINDOW_OPEN = 0x0000013f;
enum DISPID_RDPSRAPI_EVENT_ON_WINDOW_CLOSE = 0x00000140;
enum DISPID_RDPSRAPI_EVENT_ON_WINDOW_UPDATE = 0x00000141;
enum DISPID_RDPSRAPI_EVENT_ON_APPFILTER_UPDATE = 0x00000142;
enum DISPID_RDPSRAPI_EVENT_ON_SHARED_RECT_CHANGED = 0x00000143;
enum DISPID_RDPSRAPI_EVENT_ON_FOCUSRELEASED = 0x00000144;
enum DISPID_RDPSRAPI_EVENT_ON_SHARED_DESKTOP_SETTINGS_CHANGED = 0x00000145;
enum DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_RESPONSE = 0x00000152;
enum DISPID_RDPAPI_EVENT_ON_BOUNDING_RECT_CHANGED = 0x00000154;
enum DISPID_RDPSRAPI_METHOD_STREAM_ALLOCBUFFER = 0x000001a5;
enum DISPID_RDPSRAPI_METHOD_STREAM_FREEBUFFER = 0x000001a6;
enum DISPID_RDPSRAPI_METHOD_STREAMSENDDATA = 0x000001a7;
enum DISPID_RDPSRAPI_METHOD_STREAMREADDATA = 0x000001a8;
enum DISPID_RDPSRAPI_METHOD_STREAMOPEN = 0x000001a9;
enum DISPID_RDPSRAPI_METHOD_STREAMCLOSE = 0x000001aa;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORAGE = 0x0000022b;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADSIZE = 0x0000022e;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADOFFSET = 0x0000022f;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_CONTEXT = 0x00000230;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_FLAGS = 0x00000231;
enum DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORESIZE = 0x00000232;
enum DISPID_RDPSRAPI_EVENT_ON_STREAM_SENDCOMPLETED = 0x00000278;
enum DISPID_RDPSRAPI_EVENT_ON_STREAM_DATARECEIVED = 0x00000279;
enum DISPID_RDPSRAPI_EVENT_ON_STREAM_CLOSED = 0x0000027a;
enum DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_BUTTON_RECEIVED = 0x000002bc;
enum DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_MOVE_RECEIVED = 0x000002bd;
enum DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_WHEEL_RECEIVED = 0x000002be;
enum CLSID_RDPViewer = GUID(0x32be5ed2, 0x5c86, 0x480f, [0xa9, 0x14, 0xf, 0xf8, 0x88, 0x5a, 0x1b, 0x3f]);
struct RDPViewer
{
}
enum CLSID_RDPSRAPISessionProperties = GUID(0xdd7594ff, 0xea2a, 0x4c06, [0x8f, 0xdf, 0x13, 0x2d, 0xe4, 0x8b, 0x65, 0x10]);
struct RDPSRAPISessionProperties
{
}
enum CLSID_RDPSRAPIInvitationManager = GUID(0x53d9c9db, 0x75ab, 0x4271, [0x94, 0x8a, 0x4c, 0x4e, 0xb3, 0x6a, 0x8f, 0x2b]);
struct RDPSRAPIInvitationManager
{
}
enum CLSID_RDPSRAPIInvitation = GUID(0x49174dc6, 0x731, 0x4b5e, [0x8e, 0xe1, 0x83, 0xa6, 0x3d, 0x38, 0x68, 0xfa]);
struct RDPSRAPIInvitation
{
}
enum CLSID_RDPSRAPIAttendeeManager = GUID(0xd7b13a01, 0xf7d4, 0x42a6, [0x85, 0x95, 0x12, 0xfc, 0x8c, 0x24, 0xe8, 0x51]);
struct RDPSRAPIAttendeeManager
{
}
enum CLSID_RDPSRAPIAttendee = GUID(0x74f93bb5, 0x755f, 0x488e, [0x8a, 0x29, 0x23, 0x90, 0x10, 0x8a, 0xef, 0x55]);
struct RDPSRAPIAttendee
{
}
enum CLSID_RDPSRAPIAttendeeDisconnectInfo = GUID(0xb47d7250, 0x5bdb, 0x405d, [0xb4, 0x87, 0xca, 0xad, 0x9c, 0x56, 0xf4, 0xf8]);
struct RDPSRAPIAttendeeDisconnectInfo
{
}
enum CLSID_RDPSRAPIApplicationFilter = GUID(0xe35ace89, 0xc7e8, 0x427e, [0xa4, 0xf9, 0xb9, 0xda, 0x7, 0x28, 0x26, 0xbd]);
struct RDPSRAPIApplicationFilter
{
}
enum CLSID_RDPSRAPIApplicationList = GUID(0x9e31c815, 0x7433, 0x4876, [0x97, 0xfb, 0xed, 0x59, 0xfe, 0x2b, 0xaa, 0x22]);
struct RDPSRAPIApplicationList
{
}
enum CLSID_RDPSRAPIApplication = GUID(0xc116a484, 0x4b25, 0x4b9f, [0x8a, 0x54, 0xb9, 0x34, 0xb0, 0x6e, 0x57, 0xfa]);
struct RDPSRAPIApplication
{
}
enum CLSID_RDPSRAPIWindowList = GUID(0x9c21e2b8, 0x5dd4, 0x42cc, [0x81, 0xba, 0x1c, 0x9, 0x98, 0x52, 0xe6, 0xfa]);
struct RDPSRAPIWindowList
{
}
enum CLSID_RDPSRAPIWindow = GUID(0x3cf46db, 0xce45, 0x4d36, [0x86, 0xed, 0xed, 0x28, 0xb7, 0x43, 0x98, 0xbf]);
struct RDPSRAPIWindow
{
}
enum CLSID_RDPSRAPITcpConnectionInfo = GUID(0xbe49db3f, 0xebb6, 0x4278, [0x8c, 0xe0, 0xd5, 0x45, 0x58, 0x33, 0xea, 0xee]);
struct RDPSRAPITcpConnectionInfo
{
}
enum CLSID_RDPSession = GUID(0x9b78f0e6, 0x3e05, 0x4a5b, [0xb2, 0xe8, 0xe7, 0x43, 0xa8, 0x95, 0x6b, 0x65]);
struct RDPSession
{
}
enum CLSID_RDPSRAPIFrameBuffer = GUID(0xa4f66bcc, 0x538e, 0x4101, [0x95, 0x1d, 0x30, 0x84, 0x7a, 0xdb, 0x51, 0x1]);
struct RDPSRAPIFrameBuffer
{
}
enum CLSID_RDPTransportStreamBuffer = GUID(0x8d4a1c69, 0xf17f, 0x4549, [0xa6, 0x99, 0x76, 0x1c, 0x6e, 0x6b, 0x5c, 0xa]);
struct RDPTransportStreamBuffer
{
}
enum CLSID_RDPTransportStreamEvents = GUID(0x31e3ab20, 0x5350, 0x483f, [0x9d, 0xc6, 0x67, 0x48, 0x66, 0x5e, 0xfd, 0xeb]);
struct RDPTransportStreamEvents
{
}
alias CTRL_LEVEL = int;
enum : int
{
    CTRL_LEVEL_MIN                 = 0x00000000,
    CTRL_LEVEL_INVALID             = 0x00000000,
    CTRL_LEVEL_NONE                = 0x00000001,
    CTRL_LEVEL_VIEW                = 0x00000002,
    CTRL_LEVEL_INTERACTIVE         = 0x00000003,
    CTRL_LEVEL_REQCTRL_VIEW        = 0x00000004,
    CTRL_LEVEL_REQCTRL_INTERACTIVE = 0x00000005,
    CTRL_LEVEL_MAX                 = 0x00000005,
}

alias ATTENDEE_DISCONNECT_REASON = int;
enum : int
{
    ATTENDEE_DISCONNECT_REASON_MIN = 0x00000000,
    ATTENDEE_DISCONNECT_REASON_APP = 0x00000000,
    ATTENDEE_DISCONNECT_REASON_ERR = 0x00000001,
    ATTENDEE_DISCONNECT_REASON_CLI = 0x00000002,
    ATTENDEE_DISCONNECT_REASON_MAX = 0x00000002,
}

alias CHANNEL_PRIORITY = int;
enum : int
{
    CHANNEL_PRIORITY_LO  = 0x00000000,
    CHANNEL_PRIORITY_MED = 0x00000001,
    CHANNEL_PRIORITY_HI  = 0x00000002,
}

alias CHANNEL_FLAGS = int;
enum : int
{
    CHANNEL_FLAGS_LEGACY       = 0x00000001,
    CHANNEL_FLAGS_UNCOMPRESSED = 0x00000002,
    CHANNEL_FLAGS_DYNAMIC      = 0x00000004,
}

alias CHANNEL_ACCESS_ENUM = int;
enum : int
{
    CHANNEL_ACCESS_ENUM_NONE        = 0x00000000,
    CHANNEL_ACCESS_ENUM_SENDRECEIVE = 0x00000001,
}

alias RDPENCOMAPI_ATTENDEE_FLAGS = int;
enum : int
{
    ATTENDEE_FLAGS_LOCAL = 0x00000001,
}

alias RDPSRAPI_WND_FLAGS = int;
enum : int
{
    WND_FLAG_PRIVILEGED = 0x00000001,
}

alias RDPSRAPI_APP_FLAGS = int;
enum : int
{
    APP_FLAG_PRIVILEGED = 0x00000001,
}

alias RDPSRAPI_MOUSE_BUTTON_TYPE = int;
enum : int
{
    RDPSRAPI_MOUSE_BUTTON_BUTTON1  = 0x00000000,
    RDPSRAPI_MOUSE_BUTTON_BUTTON2  = 0x00000001,
    RDPSRAPI_MOUSE_BUTTON_BUTTON3  = 0x00000002,
    RDPSRAPI_MOUSE_BUTTON_XBUTTON1 = 0x00000003,
    RDPSRAPI_MOUSE_BUTTON_XBUTTON2 = 0x00000004,
    RDPSRAPI_MOUSE_BUTTON_XBUTTON3 = 0x00000005,
}

alias RDPSRAPI_KBD_CODE_TYPE = int;
enum : int
{
    RDPSRAPI_KBD_CODE_SCANCODE = 0x00000000,
    RDPSRAPI_KBD_CODE_UNICODE  = 0x00000001,
}

alias RDPSRAPI_KBD_SYNC_FLAG = int;
enum : int
{
    RDPSRAPI_KBD_SYNC_FLAG_SCROLL_LOCK = 0x00000001,
    RDPSRAPI_KBD_SYNC_FLAG_NUM_LOCK    = 0x00000002,
    RDPSRAPI_KBD_SYNC_FLAG_CAPS_LOCK   = 0x00000004,
    RDPSRAPI_KBD_SYNC_FLAG_KANA_LOCK   = 0x00000008,
}

enum IID_IRDPSRAPIDebug = GUID(0xaa1e42b5, 0x496d, 0x4ca4, [0xa6, 0x90, 0x34, 0x8d, 0xcb, 0x2e, 0xc4, 0xad]);
interface IRDPSRAPIDebug : IUnknown
{
    HRESULT put_CLXCmdLine(BSTR);
    HRESULT get_CLXCmdLine(BSTR*);
}
enum IID_IRDPSRAPIPerfCounterLogger = GUID(0x71c2533, 0xfa4, 0x4e8f, [0xae, 0x83, 0x9c, 0x10, 0xb4, 0x30, 0x5a, 0xb5]);
interface IRDPSRAPIPerfCounterLogger : IUnknown
{
    HRESULT LogValue(long);
}
enum IID_IRDPSRAPIPerfCounterLoggingManager = GUID(0x9a512c86, 0xac6e, 0x4a8e, [0xb1, 0xa4, 0xfc, 0xef, 0x36, 0x3f, 0x6e, 0x64]);
interface IRDPSRAPIPerfCounterLoggingManager : IUnknown
{
    HRESULT CreateLogger(BSTR, IRDPSRAPIPerfCounterLogger*);
}
enum IID_IRDPSRAPIAudioStream = GUID(0xe3e30ef9, 0x89c6, 0x4541, [0xba, 0x3b, 0x19, 0x33, 0x6a, 0xc6, 0xd3, 0x1c]);
interface IRDPSRAPIAudioStream : IUnknown
{
    HRESULT Initialize(long*);
    HRESULT Start();
    HRESULT Stop();
    HRESULT GetBuffer(ubyte**, uint*, ulong*);
    HRESULT FreeBuffer();
}
enum IID_IRDPSRAPIClipboardUseEvents = GUID(0xd559f59a, 0x7a27, 0x4138, [0x87, 0x63, 0x24, 0x7c, 0xe5, 0xf6, 0x59, 0xa8]);
interface IRDPSRAPIClipboardUseEvents : IUnknown
{
    HRESULT OnPasteFromClipboard(uint, IDispatch, short*);
}
enum IID_IRDPSRAPIWindow = GUID(0xbeafe0f9, 0xc77b, 0x4933, [0xba, 0x9f, 0xa2, 0x4c, 0xdd, 0xcc, 0x27, 0xcf]);
interface IRDPSRAPIWindow : IDispatch
{
    HRESULT get_Id(int*);
    HRESULT get_Application(IRDPSRAPIApplication*);
    HRESULT get_Shared(short*);
    HRESULT put_Shared(short);
    HRESULT get_Name(BSTR*);
    HRESULT Show();
    HRESULT get_Flags(uint*);
}
enum IID_IRDPSRAPIWindowList = GUID(0x8a05ce44, 0x715a, 0x4116, [0xa1, 0x89, 0xa1, 0x18, 0xf3, 0xa, 0x7, 0xbd]);
interface IRDPSRAPIWindowList : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IRDPSRAPIWindow*);
}
enum IID_IRDPSRAPIApplication = GUID(0x41e7a09d, 0xeb7a, 0x436e, [0x93, 0x5d, 0x78, 0xc, 0xa2, 0x62, 0x83, 0x24]);
interface IRDPSRAPIApplication : IDispatch
{
    HRESULT get_Windows(IRDPSRAPIWindowList*);
    HRESULT get_Id(int*);
    HRESULT get_Shared(short*);
    HRESULT put_Shared(short);
    HRESULT get_Name(BSTR*);
    HRESULT get_Flags(uint*);
}
enum IID_IRDPSRAPIApplicationList = GUID(0xd4b4aeb3, 0x22dc, 0x4837, [0xb3, 0xb6, 0x42, 0xea, 0x25, 0x17, 0x84, 0x9a]);
interface IRDPSRAPIApplicationList : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IRDPSRAPIApplication*);
}
enum IID_IRDPSRAPIApplicationFilter = GUID(0xd20f10ca, 0x6637, 0x4f06, [0xb1, 0xd5, 0x27, 0x7e, 0xa7, 0xe5, 0x16, 0xd]);
interface IRDPSRAPIApplicationFilter : IDispatch
{
    HRESULT get_Applications(IRDPSRAPIApplicationList*);
    HRESULT get_Windows(IRDPSRAPIWindowList*);
    HRESULT get_Enabled(short*);
    HRESULT put_Enabled(short);
}
enum IID_IRDPSRAPISessionProperties = GUID(0x339b24f2, 0x9bc0, 0x4f16, [0x9a, 0xac, 0xf1, 0x65, 0x43, 0x3d, 0x13, 0xd4]);
interface IRDPSRAPISessionProperties : IDispatch
{
    HRESULT get_Property(BSTR, VARIANT*);
    HRESULT put_Property(BSTR, VARIANT);
}
enum IID_IRDPSRAPIInvitation = GUID(0x4fac1d43, 0xfc51, 0x45bb, [0xb1, 0xb4, 0x2b, 0x53, 0xaa, 0x56, 0x2f, 0xa3]);
interface IRDPSRAPIInvitation : IDispatch
{
    HRESULT get_ConnectionString(BSTR*);
    HRESULT get_GroupName(BSTR*);
    HRESULT get_Password(BSTR*);
    HRESULT get_AttendeeLimit(int*);
    HRESULT put_AttendeeLimit(int);
    HRESULT get_Revoked(short*);
    HRESULT put_Revoked(short);
}
enum IID_IRDPSRAPIInvitationManager = GUID(0x4722b049, 0x92c3, 0x4c2d, [0x8a, 0x65, 0xf7, 0x34, 0x8f, 0x64, 0x4d, 0xcf]);
interface IRDPSRAPIInvitationManager : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IRDPSRAPIInvitation*);
    HRESULT get_Count(int*);
    HRESULT CreateInvitation(BSTR, BSTR, BSTR, int, IRDPSRAPIInvitation*);
}
enum IID_IRDPSRAPITcpConnectionInfo = GUID(0xf74049a4, 0x3d06, 0x4028, [0x81, 0x93, 0xa, 0x8c, 0x29, 0xbc, 0x24, 0x52]);
interface IRDPSRAPITcpConnectionInfo : IDispatch
{
    HRESULT get_Protocol(int*);
    HRESULT get_LocalPort(int*);
    HRESULT get_LocalIP(BSTR*);
    HRESULT get_PeerPort(int*);
    HRESULT get_PeerIP(BSTR*);
}
enum IID_IRDPSRAPIAttendee = GUID(0xec0671b3, 0x1b78, 0x4b80, [0xa4, 0x64, 0x91, 0x32, 0x24, 0x75, 0x43, 0xe3]);
interface IRDPSRAPIAttendee : IDispatch
{
    HRESULT get_Id(int*);
    HRESULT get_RemoteName(BSTR*);
    HRESULT get_ControlLevel(CTRL_LEVEL*);
    HRESULT put_ControlLevel(CTRL_LEVEL);
    HRESULT get_Invitation(IRDPSRAPIInvitation*);
    HRESULT TerminateConnection();
    HRESULT get_Flags(int*);
    HRESULT get_ConnectivityInfo(IUnknown*);
}
enum IID_IRDPSRAPIAttendeeManager = GUID(0xba3a37e8, 0x33da, 0x4749, [0x8d, 0xa0, 0x7, 0xfa, 0x34, 0xda, 0x79, 0x44]);
interface IRDPSRAPIAttendeeManager : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IRDPSRAPIAttendee*);
}
enum IID_IRDPSRAPIAttendeeDisconnectInfo = GUID(0xc187689f, 0x447c, 0x44a1, [0x9c, 0x14, 0xff, 0xfb, 0xb3, 0xb7, 0xec, 0x17]);
interface IRDPSRAPIAttendeeDisconnectInfo : IDispatch
{
    HRESULT get_Attendee(IRDPSRAPIAttendee*);
    HRESULT get_Reason(ATTENDEE_DISCONNECT_REASON*);
    HRESULT get_Code(int*);
}
enum IID_IRDPSRAPIVirtualChannel = GUID(0x5e12f95, 0x28b3, 0x4c9a, [0x87, 0x80, 0xd0, 0x24, 0x85, 0x74, 0xa1, 0xe0]);
interface IRDPSRAPIVirtualChannel : IDispatch
{
    HRESULT SendData(BSTR, int, uint);
    HRESULT SetAccess(int, CHANNEL_ACCESS_ENUM);
    HRESULT get_Name(BSTR*);
    HRESULT get_Flags(int*);
    HRESULT get_Priority(CHANNEL_PRIORITY*);
}
enum IID_IRDPSRAPIVirtualChannelManager = GUID(0xd11c661, 0x5d0d, 0x4ee4, [0x89, 0xdf, 0x21, 0x66, 0xae, 0x1f, 0xdf, 0xed]);
interface IRDPSRAPIVirtualChannelManager : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, IRDPSRAPIVirtualChannel*);
    HRESULT CreateVirtualChannel(BSTR, CHANNEL_PRIORITY, uint, IRDPSRAPIVirtualChannel*);
}
enum IID_IRDPSRAPIViewer = GUID(0xc6bfcd38, 0x8ce9, 0x404d, [0x8a, 0xe8, 0xf3, 0x1d, 0x0, 0xc6, 0x5c, 0xb5]);
interface IRDPSRAPIViewer : IDispatch
{
    HRESULT Connect(BSTR, BSTR, BSTR);
    HRESULT Disconnect();
    HRESULT get_Attendees(IRDPSRAPIAttendeeManager*);
    HRESULT get_Invitations(IRDPSRAPIInvitationManager*);
    HRESULT get_ApplicationFilter(IRDPSRAPIApplicationFilter*);
    HRESULT get_VirtualChannelManager(IRDPSRAPIVirtualChannelManager*);
    HRESULT put_SmartSizing(short);
    HRESULT get_SmartSizing(short*);
    HRESULT RequestControl(CTRL_LEVEL);
    HRESULT put_DisconnectedText(BSTR);
    HRESULT get_DisconnectedText(BSTR*);
    HRESULT RequestColorDepthChange(int);
    HRESULT get_Properties(IRDPSRAPISessionProperties*);
    HRESULT StartReverseConnectListener(BSTR, BSTR, BSTR, BSTR*);
}
enum IID_IRDPViewerInputSink = GUID(0xbb590853, 0xa6c5, 0x4a7b, [0x8d, 0xd4, 0x76, 0xb6, 0x9e, 0xea, 0x12, 0xd5]);
interface IRDPViewerInputSink : IUnknown
{
    HRESULT SendMouseButtonEvent(RDPSRAPI_MOUSE_BUTTON_TYPE, short, uint, uint);
    HRESULT SendMouseMoveEvent(uint, uint);
    HRESULT SendMouseWheelEvent(ushort);
    HRESULT SendKeyboardEvent(RDPSRAPI_KBD_CODE_TYPE, ushort, short, short, short);
    HRESULT SendSyncEvent(uint);
    HRESULT BeginTouchFrame();
    HRESULT AddTouchInput(uint, uint, int, int);
    HRESULT EndTouchFrame();
}
enum IID_IRDPSRAPIFrameBuffer = GUID(0x3d67e7d2, 0xb27b, 0x448e, [0x81, 0xb3, 0xc6, 0x11, 0xe, 0xd8, 0xb4, 0xbe]);
interface IRDPSRAPIFrameBuffer : IDispatch
{
    HRESULT get_Width(int*);
    HRESULT get_Height(int*);
    HRESULT get_Bpp(int*);
    HRESULT GetFrameBufferBits(int, int, int, int, SAFEARRAY**);
}
enum IID_IRDPSRAPITransportStreamBuffer = GUID(0x81c80290, 0x5085, 0x44b0, [0xb4, 0x60, 0xf8, 0x65, 0xc3, 0x9c, 0xb4, 0xa9]);
interface IRDPSRAPITransportStreamBuffer : IUnknown
{
    HRESULT get_Storage(ubyte**);
    HRESULT get_StorageSize(int*);
    HRESULT get_PayloadSize(int*);
    HRESULT put_PayloadSize(int);
    HRESULT get_PayloadOffset(int*);
    HRESULT put_PayloadOffset(int);
    HRESULT get_Flags(int*);
    HRESULT put_Flags(int);
    HRESULT get_Context(IUnknown*);
    HRESULT put_Context(IUnknown);
}
enum IID_IRDPSRAPITransportStreamEvents = GUID(0xea81c254, 0xf5af, 0x4e40, [0x98, 0x2e, 0x3e, 0x63, 0xbb, 0x59, 0x52, 0x76]);
interface IRDPSRAPITransportStreamEvents : IUnknown
{
    void OnWriteCompleted(IRDPSRAPITransportStreamBuffer);
    void OnReadCompleted(IRDPSRAPITransportStreamBuffer);
    void OnStreamClosed(HRESULT);
}
enum IID_IRDPSRAPITransportStream = GUID(0x36cfa065, 0x43bb, 0x4ef7, [0xae, 0xd7, 0x9b, 0x88, 0xa5, 0x5, 0x30, 0x36]);
interface IRDPSRAPITransportStream : IUnknown
{
    HRESULT AllocBuffer(int, IRDPSRAPITransportStreamBuffer*);
    HRESULT FreeBuffer(IRDPSRAPITransportStreamBuffer);
    HRESULT WriteBuffer(IRDPSRAPITransportStreamBuffer);
    HRESULT ReadBuffer(IRDPSRAPITransportStreamBuffer);
    HRESULT Open(IRDPSRAPITransportStreamEvents);
    HRESULT Close();
}
enum IID_IRDPSRAPISharingSession = GUID(0xeeb20886, 0xe470, 0x4cf6, [0x84, 0x2b, 0x27, 0x39, 0xc0, 0xec, 0x5c, 0xfb]);
interface IRDPSRAPISharingSession : IDispatch
{
    HRESULT Open();
    HRESULT Close();
    HRESULT put_ColorDepth(int);
    HRESULT get_ColorDepth(int*);
    HRESULT get_Properties(IRDPSRAPISessionProperties*);
    HRESULT get_Attendees(IRDPSRAPIAttendeeManager*);
    HRESULT get_Invitations(IRDPSRAPIInvitationManager*);
    HRESULT get_ApplicationFilter(IRDPSRAPIApplicationFilter*);
    HRESULT get_VirtualChannelManager(IRDPSRAPIVirtualChannelManager*);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT ConnectToClient(BSTR);
    HRESULT SetDesktopSharedRect(int, int, int, int);
    HRESULT GetDesktopSharedRect(int*, int*, int*, int*);
}
enum IID_IRDPSRAPISharingSession2 = GUID(0xfee4ee57, 0xe3e8, 0x4205, [0x8f, 0xb0, 0x8f, 0xd1, 0xd0, 0x67, 0x5c, 0x21]);
interface IRDPSRAPISharingSession2 : IRDPSRAPISharingSession
{
    HRESULT ConnectUsingTransportStream(IRDPSRAPITransportStream, BSTR, BSTR);
    HRESULT get_FrameBuffer(IRDPSRAPIFrameBuffer*);
    HRESULT SendControlLevelChangeResponse(IRDPSRAPIAttendee, CTRL_LEVEL, int);
}
alias RDPENCOMAPI_CONSTANTS = int;
enum : int
{
    CONST_MAX_CHANNEL_MESSAGE_SIZE        = 0x00000400,
    CONST_MAX_CHANNEL_NAME_LEN            = 0x00000008,
    CONST_MAX_LEGACY_CHANNEL_MESSAGE_SIZE = 0x00064000,
    CONST_ATTENDEE_ID_EVERYONE            = 0xffffffff,
    CONST_ATTENDEE_ID_HOST                = 0x00000000,
    CONST_CONN_INTERVAL                   = 0x00000032,
    CONST_ATTENDEE_ID_DEFAULT             = 0xffffffff,
}

struct __ReferenceRemainingTypes__
{
    CTRL_LEVEL __ctrlLevel__;
    ATTENDEE_DISCONNECT_REASON __attendeeDisconnectReason__;
    CHANNEL_PRIORITY __channelPriority__;
    CHANNEL_FLAGS __channelFlags__;
    CHANNEL_ACCESS_ENUM __channelAccessEnum__;
    RDPENCOMAPI_ATTENDEE_FLAGS __rdpencomapiAttendeeFlags__;
    RDPSRAPI_WND_FLAGS __rdpsrapiWndFlags__;
    RDPSRAPI_APP_FLAGS __rdpsrapiAppFlags__;
}
enum IID__IRDPSessionEvents = GUID(0x98a97042, 0x6698, 0x40e9, [0x8e, 0xfd, 0xb3, 0x20, 0x9, 0x90, 0x0, 0x4b]);
interface _IRDPSessionEvents : IDispatch
{
}
