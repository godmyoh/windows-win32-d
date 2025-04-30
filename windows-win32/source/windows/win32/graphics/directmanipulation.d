module windows.win32.graphics.directmanipulation;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, RECT;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.windowsandmessaging : MSG;

version (Windows):
extern (Windows):

enum DIRECTMANIPULATION_KEYBOARDFOCUS = 0xfffffffe;
enum DIRECTMANIPULATION_MOUSEFOCUS = 0xfffffffd;
enum CLSID_VerticalIndicatorContent = GUID(0xa10b5f17, 0xafe0, 0x4aa2, [0x91, 0xe9, 0x3e, 0x70, 0x1, 0xd2, 0xe6, 0xb4]);
enum CLSID_HorizontalIndicatorContent = GUID(0xe7d18cf5, 0x3ec7, 0x44d5, [0xa7, 0x6b, 0x37, 0x70, 0xf3, 0xcf, 0x90, 0x3d]);
enum CLSID_VirtualViewportContent = GUID(0x3206a19a, 0x86f0, 0x4cb4, [0xa7, 0xf3, 0x16, 0xe3, 0xb7, 0xe2, 0xd8, 0x52]);
enum CLSID_DragDropConfigurationBehavior = GUID(0x9b01b3e, 0xba6c, 0x454d, [0x82, 0xe8, 0x95, 0xe3, 0x52, 0x32, 0x9f, 0x23]);
enum CLSID_AutoScrollBehavior = GUID(0x26126a51, 0x3c70, 0x4c9a, [0xae, 0xc2, 0x94, 0x88, 0x49, 0xee, 0xb0, 0x93]);
enum CLSID_DeferContactService = GUID(0xd7b67cf4, 0x84bb, 0x434e, [0x86, 0xae, 0x65, 0x92, 0xbb, 0xc9, 0xab, 0xd9]);
alias DIRECTMANIPULATION_STATUS = int;
enum : int
{
    DIRECTMANIPULATION_BUILDING  = 0x00000000,
    DIRECTMANIPULATION_ENABLED   = 0x00000001,
    DIRECTMANIPULATION_DISABLED  = 0x00000002,
    DIRECTMANIPULATION_RUNNING   = 0x00000003,
    DIRECTMANIPULATION_INERTIA   = 0x00000004,
    DIRECTMANIPULATION_READY     = 0x00000005,
    DIRECTMANIPULATION_SUSPENDED = 0x00000006,
}

alias DIRECTMANIPULATION_HITTEST_TYPE = int;
enum : int
{
    DIRECTMANIPULATION_HITTEST_TYPE_ASYNCHRONOUS     = 0x00000000,
    DIRECTMANIPULATION_HITTEST_TYPE_SYNCHRONOUS      = 0x00000001,
    DIRECTMANIPULATION_HITTEST_TYPE_AUTO_SYNCHRONOUS = 0x00000002,
}

alias DIRECTMANIPULATION_CONFIGURATION = int;
enum : int
{
    DIRECTMANIPULATION_CONFIGURATION_NONE                = 0x00000000,
    DIRECTMANIPULATION_CONFIGURATION_INTERACTION         = 0x00000001,
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X       = 0x00000002,
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y       = 0x00000004,
    DIRECTMANIPULATION_CONFIGURATION_SCALING             = 0x00000010,
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_INERTIA = 0x00000020,
    DIRECTMANIPULATION_CONFIGURATION_SCALING_INERTIA     = 0x00000080,
    DIRECTMANIPULATION_CONFIGURATION_RAILS_X             = 0x00000100,
    DIRECTMANIPULATION_CONFIGURATION_RAILS_Y             = 0x00000200,
}

alias DIRECTMANIPULATION_GESTURE_CONFIGURATION = int;
enum : int
{
    DIRECTMANIPULATION_GESTURE_NONE                   = 0x00000000,
    DIRECTMANIPULATION_GESTURE_DEFAULT                = 0x00000000,
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_VERTICAL   = 0x00000008,
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_HORIZONTAL = 0x00000010,
    DIRECTMANIPULATION_GESTURE_PINCH_ZOOM             = 0x00000020,
}

alias DIRECTMANIPULATION_MOTION_TYPES = int;
enum : int
{
    DIRECTMANIPULATION_MOTION_NONE       = 0x00000000,
    DIRECTMANIPULATION_MOTION_TRANSLATEX = 0x00000001,
    DIRECTMANIPULATION_MOTION_TRANSLATEY = 0x00000002,
    DIRECTMANIPULATION_MOTION_ZOOM       = 0x00000004,
    DIRECTMANIPULATION_MOTION_CENTERX    = 0x00000010,
    DIRECTMANIPULATION_MOTION_CENTERY    = 0x00000020,
    DIRECTMANIPULATION_MOTION_ALL        = 0x00000037,
}

alias DIRECTMANIPULATION_VIEWPORT_OPTIONS = int;
enum : int
{
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DEFAULT              = 0x00000000,
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_AUTODISABLE          = 0x00000001,
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_MANUALUPDATE         = 0x00000002,
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT                = 0x00000004,
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_EXPLICITHITTEST      = 0x00000008,
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DISABLEPIXELSNAPPING = 0x00000010,
}

alias DIRECTMANIPULATION_SNAPPOINT_TYPE = int;
enum : int
{
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY        = 0x00000000,
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL         = 0x00000001,
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE = 0x00000002,
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE  = 0x00000003,
}

alias DIRECTMANIPULATION_SNAPPOINT_COORDINATE = int;
enum : int
{
    DIRECTMANIPULATION_COORDINATE_BOUNDARY = 0x00000000,
    DIRECTMANIPULATION_COORDINATE_ORIGIN   = 0x00000001,
    DIRECTMANIPULATION_COORDINATE_MIRRORED = 0x00000010,
}

alias DIRECTMANIPULATION_HORIZONTALALIGNMENT = int;
enum : int
{
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE         = 0x00000000,
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT         = 0x00000001,
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_CENTER       = 0x00000002,
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT        = 0x00000004,
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER = 0x00000008,
}

alias DIRECTMANIPULATION_VERTICALALIGNMENT = int;
enum : int
{
    DIRECTMANIPULATION_VERTICALALIGNMENT_NONE         = 0x00000000,
    DIRECTMANIPULATION_VERTICALALIGNMENT_TOP          = 0x00000001,
    DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER       = 0x00000002,
    DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM       = 0x00000004,
    DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER = 0x00000008,
}

alias DIRECTMANIPULATION_INPUT_MODE = int;
enum : int
{
    DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC = 0x00000000,
    DIRECTMANIPULATION_INPUT_MODE_MANUAL    = 0x00000001,
}

enum IID_IDirectManipulationManager = GUID(0xfbf5d3b4, 0x70c7, 0x4163, [0x93, 0x22, 0x5a, 0x6f, 0x66, 0xd, 0x6f, 0xbc]);
interface IDirectManipulationManager : IUnknown
{
    HRESULT Activate(HWND window);
    HRESULT Deactivate(HWND window);
    HRESULT RegisterHitTestTarget(HWND window, HWND hitTestWindow, DIRECTMANIPULATION_HITTEST_TYPE type);
    HRESULT ProcessInput(const(MSG)* message, BOOL* handled);
    HRESULT GetUpdateManager(const(GUID)* riid, void** object);
    HRESULT CreateViewport(IDirectManipulationFrameInfoProvider frameInfo, HWND window, const(GUID)* riid, void** object);
    HRESULT CreateContent(IDirectManipulationFrameInfoProvider frameInfo, const(GUID)* clsid, const(GUID)* riid, void** object);
}
enum IID_IDirectManipulationManager2 = GUID(0xfa1005e9, 0x3d16, 0x484c, [0xbf, 0xc9, 0x62, 0xb6, 0x1e, 0x56, 0xec, 0x4e]);
interface IDirectManipulationManager2 : IDirectManipulationManager
{
    HRESULT CreateBehavior(const(GUID)* clsid, const(GUID)* riid, void** object);
}
enum IID_IDirectManipulationManager3 = GUID(0x2cb6b33d, 0xffe8, 0x488c, [0xb7, 0x50, 0xfb, 0xdf, 0xe8, 0x8d, 0xca, 0x8c]);
interface IDirectManipulationManager3 : IDirectManipulationManager2
{
    HRESULT GetService(const(GUID)* clsid, const(GUID)* riid, void** object);
}
enum IID_IDirectManipulationViewport = GUID(0x28b85a3d, 0x60a0, 0x48bd, [0x9b, 0xa1, 0x5c, 0xe8, 0xd9, 0xea, 0x3a, 0x6d]);
interface IDirectManipulationViewport : IUnknown
{
    HRESULT Enable();
    HRESULT Disable();
    HRESULT SetContact(uint pointerId);
    HRESULT ReleaseContact(uint pointerId);
    HRESULT ReleaseAllContacts();
    HRESULT GetStatus(DIRECTMANIPULATION_STATUS* status);
    HRESULT GetTag(const(GUID)* riid, void** object, uint* id);
    HRESULT SetTag(IUnknown object, uint id);
    HRESULT GetViewportRect(RECT* viewport);
    HRESULT SetViewportRect(const(RECT)* viewport);
    HRESULT ZoomToRect(const(float) left, const(float) top, const(float) right, const(float) bottom, BOOL animate);
    HRESULT SetViewportTransform(const(float)* matrix, uint pointCount);
    HRESULT SyncDisplayTransform(const(float)* matrix, uint pointCount);
    HRESULT GetPrimaryContent(const(GUID)* riid, void** object);
    HRESULT AddContent(IDirectManipulationContent content);
    HRESULT RemoveContent(IDirectManipulationContent content);
    HRESULT SetViewportOptions(DIRECTMANIPULATION_VIEWPORT_OPTIONS options);
    HRESULT AddConfiguration(DIRECTMANIPULATION_CONFIGURATION configuration);
    HRESULT RemoveConfiguration(DIRECTMANIPULATION_CONFIGURATION configuration);
    HRESULT ActivateConfiguration(DIRECTMANIPULATION_CONFIGURATION configuration);
    HRESULT SetManualGesture(DIRECTMANIPULATION_GESTURE_CONFIGURATION configuration);
    HRESULT SetChaining(DIRECTMANIPULATION_MOTION_TYPES enabledTypes);
    HRESULT AddEventHandler(HWND window, IDirectManipulationViewportEventHandler eventHandler, uint* cookie);
    HRESULT RemoveEventHandler(uint cookie);
    HRESULT SetInputMode(DIRECTMANIPULATION_INPUT_MODE mode);
    HRESULT SetUpdateMode(DIRECTMANIPULATION_INPUT_MODE mode);
    HRESULT Stop();
    HRESULT Abandon();
}
enum IID_IDirectManipulationViewport2 = GUID(0x923ccaac, 0x61e1, 0x4385, [0xb7, 0x26, 0x1, 0x7a, 0xf1, 0x89, 0x88, 0x2a]);
interface IDirectManipulationViewport2 : IDirectManipulationViewport
{
    HRESULT AddBehavior(IUnknown behavior, uint* cookie);
    HRESULT RemoveBehavior(uint cookie);
    HRESULT RemoveAllBehaviors();
}
enum IID_IDirectManipulationViewportEventHandler = GUID(0x952121da, 0xd69f, 0x45f9, [0xb0, 0xf9, 0xf2, 0x39, 0x44, 0x32, 0x1a, 0x6d]);
interface IDirectManipulationViewportEventHandler : IUnknown
{
    HRESULT OnViewportStatusChanged(IDirectManipulationViewport viewport, DIRECTMANIPULATION_STATUS current, DIRECTMANIPULATION_STATUS previous);
    HRESULT OnViewportUpdated(IDirectManipulationViewport viewport);
    HRESULT OnContentUpdated(IDirectManipulationViewport viewport, IDirectManipulationContent content);
}
enum IID_IDirectManipulationContent = GUID(0xb89962cb, 0x3d89, 0x442b, [0xbb, 0x58, 0x50, 0x98, 0xfa, 0xf, 0x9f, 0x16]);
interface IDirectManipulationContent : IUnknown
{
    HRESULT GetContentRect(RECT* contentSize);
    HRESULT SetContentRect(const(RECT)* contentSize);
    HRESULT GetViewport(const(GUID)* riid, void** object);
    HRESULT GetTag(const(GUID)* riid, void** object, uint* id);
    HRESULT SetTag(IUnknown object, uint id);
    HRESULT GetOutputTransform(float* matrix, uint pointCount);
    HRESULT GetContentTransform(float* matrix, uint pointCount);
    HRESULT SyncContentTransform(const(float)* matrix, uint pointCount);
}
enum IID_IDirectManipulationPrimaryContent = GUID(0xc12851e4, 0x1698, 0x4625, [0xb9, 0xb1, 0x7c, 0xa3, 0xec, 0x18, 0x63, 0xb]);
interface IDirectManipulationPrimaryContent : IUnknown
{
    HRESULT SetSnapInterval(DIRECTMANIPULATION_MOTION_TYPES motion, float interval, float offset);
    HRESULT SetSnapPoints(DIRECTMANIPULATION_MOTION_TYPES motion, const(float)* points, uint pointCount);
    HRESULT SetSnapType(DIRECTMANIPULATION_MOTION_TYPES motion, DIRECTMANIPULATION_SNAPPOINT_TYPE type);
    HRESULT SetSnapCoordinate(DIRECTMANIPULATION_MOTION_TYPES motion, DIRECTMANIPULATION_SNAPPOINT_COORDINATE coordinate, float origin);
    HRESULT SetZoomBoundaries(float zoomMinimum, float zoomMaximum);
    HRESULT SetHorizontalAlignment(DIRECTMANIPULATION_HORIZONTALALIGNMENT alignment);
    HRESULT SetVerticalAlignment(DIRECTMANIPULATION_VERTICALALIGNMENT alignment);
    HRESULT GetInertiaEndTransform(float* matrix, uint pointCount);
    HRESULT GetCenterPoint(float* centerX, float* centerY);
}
alias DIRECTMANIPULATION_DRAG_DROP_STATUS = int;
enum : int
{
    DIRECTMANIPULATION_DRAG_DROP_READY     = 0x00000000,
    DIRECTMANIPULATION_DRAG_DROP_PRESELECT = 0x00000001,
    DIRECTMANIPULATION_DRAG_DROP_SELECTING = 0x00000002,
    DIRECTMANIPULATION_DRAG_DROP_DRAGGING  = 0x00000003,
    DIRECTMANIPULATION_DRAG_DROP_CANCELLED = 0x00000004,
    DIRECTMANIPULATION_DRAG_DROP_COMMITTED = 0x00000005,
}

enum IID_IDirectManipulationDragDropEventHandler = GUID(0x1fa11b10, 0x701b, 0x41ae, [0xb5, 0xf2, 0x49, 0xe3, 0x6b, 0xd5, 0x95, 0xaa]);
interface IDirectManipulationDragDropEventHandler : IUnknown
{
    HRESULT OnDragDropStatusChange(IDirectManipulationViewport2 viewport, DIRECTMANIPULATION_DRAG_DROP_STATUS current, DIRECTMANIPULATION_DRAG_DROP_STATUS previous);
}
alias DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION = int;
enum : int
{
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL    = 0x00000001,
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL  = 0x00000002,
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY = 0x00000010,
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG = 0x00000020,
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG   = 0x00000040,
}

enum IID_IDirectManipulationDragDropBehavior = GUID(0x814b5af5, 0xc2c8, 0x4270, [0xa9, 0xb7, 0xa1, 0x98, 0xce, 0x8d, 0x2, 0xfa]);
interface IDirectManipulationDragDropBehavior : IUnknown
{
    HRESULT SetConfiguration(DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION configuration);
    HRESULT GetStatus(DIRECTMANIPULATION_DRAG_DROP_STATUS* status);
}
alias DIRECTMANIPULATION_INTERACTION_TYPE = int;
enum : int
{
    DIRECTMANIPULATION_INTERACTION_BEGIN                    = 0x00000000,
    DIRECTMANIPULATION_INTERACTION_TYPE_MANIPULATION        = 0x00000001,
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_TAP         = 0x00000002,
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_HOLD        = 0x00000003,
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_CROSS_SLIDE = 0x00000004,
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_PINCH_ZOOM  = 0x00000005,
    DIRECTMANIPULATION_INTERACTION_END                      = 0x00000064,
}

enum IID_IDirectManipulationInteractionEventHandler = GUID(0xe43f45b8, 0x42b4, 0x403e, [0xb1, 0xf2, 0x27, 0x3b, 0x8f, 0x51, 0x8, 0x30]);
interface IDirectManipulationInteractionEventHandler : IUnknown
{
    HRESULT OnInteraction(IDirectManipulationViewport2 viewport, DIRECTMANIPULATION_INTERACTION_TYPE interaction);
}
enum IID_IDirectManipulationFrameInfoProvider = GUID(0xfb759dba, 0x6f4c, 0x4c01, [0x87, 0x4e, 0x19, 0xc8, 0xa0, 0x59, 0x7, 0xf9]);
interface IDirectManipulationFrameInfoProvider : IUnknown
{
    HRESULT GetNextFrameInfo(ulong* time, ulong* processTime, ulong* compositionTime);
}
enum IID_IDirectManipulationCompositor = GUID(0x537a0825, 0x387, 0x4efa, [0xb6, 0x2f, 0x71, 0xeb, 0x1f, 0x8, 0x5a, 0x7e]);
interface IDirectManipulationCompositor : IUnknown
{
    HRESULT AddContent(IDirectManipulationContent content, IUnknown device, IUnknown parentVisual, IUnknown childVisual);
    HRESULT RemoveContent(IDirectManipulationContent content);
    HRESULT SetUpdateManager(IDirectManipulationUpdateManager updateManager);
    HRESULT Flush();
}
enum IID_IDirectManipulationCompositor2 = GUID(0xd38c7822, 0xf1cb, 0x43cb, [0xb4, 0xb9, 0xac, 0xc, 0x76, 0x7a, 0x41, 0x2e]);
interface IDirectManipulationCompositor2 : IDirectManipulationCompositor
{
    HRESULT AddContentWithCrossProcessChaining(IDirectManipulationPrimaryContent content, IUnknown device, IUnknown parentVisual, IUnknown childVisual);
}
enum IID_IDirectManipulationUpdateHandler = GUID(0x790b6337, 0x64f8, 0x4ff5, [0xa2, 0x69, 0xb3, 0x2b, 0xc2, 0xaf, 0x27, 0xa7]);
interface IDirectManipulationUpdateHandler : IUnknown
{
    HRESULT Update();
}
enum IID_IDirectManipulationUpdateManager = GUID(0xb0ae62fd, 0xbe34, 0x46e7, [0x9c, 0xaa, 0xd3, 0x61, 0xfa, 0xcb, 0xb9, 0xcc]);
interface IDirectManipulationUpdateManager : IUnknown
{
    HRESULT RegisterWaitHandleCallback(HANDLE handle, IDirectManipulationUpdateHandler eventHandler, uint* cookie);
    HRESULT UnregisterWaitHandleCallback(uint cookie);
    HRESULT Update(IDirectManipulationFrameInfoProvider frameInfo);
}
alias DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION = int;
enum : int
{
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP    = 0x00000000,
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_FORWARD = 0x00000001,
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_REVERSE = 0x00000002,
}

enum IID_IDirectManipulationAutoScrollBehavior = GUID(0x6d5954d4, 0x2003, 0x4356, [0x9b, 0x31, 0xd0, 0x51, 0xc9, 0xff, 0xa, 0xf7]);
interface IDirectManipulationAutoScrollBehavior : IUnknown
{
    HRESULT SetConfiguration(DIRECTMANIPULATION_MOTION_TYPES motionTypes, DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION scrollMotion);
}
enum IID_IDirectManipulationDeferContactService = GUID(0x652d5c71, 0xfe60, 0x4a98, [0xbe, 0x70, 0xe5, 0xf2, 0x12, 0x91, 0xe7, 0xf1]);
interface IDirectManipulationDeferContactService : IUnknown
{
    HRESULT DeferContact(uint pointerId, uint timeout);
    HRESULT CancelContact(uint pointerId);
    HRESULT CancelDeferral(uint pointerId);
}
enum CLSID_DirectManipulationViewport = GUID(0x34e211b6, 0x3650, 0x4f75, [0x83, 0x34, 0xfa, 0x35, 0x95, 0x98, 0xe1, 0xc5]);
struct DirectManipulationViewport
{
}
enum CLSID_DirectManipulationUpdateManager = GUID(0x9fc1bfd5, 0x1835, 0x441a, [0xb3, 0xb1, 0xb6, 0xcc, 0x74, 0xb7, 0x27, 0xd0]);
struct DirectManipulationUpdateManager
{
}
enum CLSID_DirectManipulationPrimaryContent = GUID(0xcaa02661, 0xd59e, 0x41c7, [0x83, 0x93, 0x3b, 0xa3, 0xba, 0xcb, 0x6b, 0x57]);
struct DirectManipulationPrimaryContent
{
}
enum CLSID_DirectManipulationManager = GUID(0x54e211b6, 0x3650, 0x4f75, [0x83, 0x34, 0xfa, 0x35, 0x95, 0x98, 0xe1, 0xc5]);
struct DirectManipulationManager
{
}
enum CLSID_DirectManipulationSharedManager = GUID(0x99793286, 0x77cc, 0x4b57, [0x96, 0xdb, 0x3b, 0x35, 0x4f, 0x6f, 0x9f, 0xb5]);
struct DirectManipulationSharedManager
{
}
enum CLSID_DCompManipulationCompositor = GUID(0x79dea627, 0xa08a, 0x43ac, [0x8e, 0xf5, 0x69, 0x0, 0xb9, 0x29, 0x91, 0x26]);
struct DCompManipulationCompositor
{
}
