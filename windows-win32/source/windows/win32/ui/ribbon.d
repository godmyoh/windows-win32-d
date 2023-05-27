module windows.win32.ui.ribbon;

import windows.win32.guid : GUID;
import windows.win32.foundation : HINSTANCE, HRESULT, HWND, PWSTR;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.system.com : IStream, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;

version (Windows):
extern (Windows):

enum UI_ALL_COMMANDS = 0x00000000;
enum UI_COLLECTION_INVALIDINDEX = 0xffffffff;
enum LIBID_UIRibbon = GUID(0x942f35c2, 0xe83b, 0x45ef, [0xb0, 0x85, 0xac, 0x29, 0x5d, 0xd6, 0x3d, 0x5b]);
alias UI_CONTEXTAVAILABILITY = int;
enum : int
{
    UI_CONTEXTAVAILABILITY_NOTAVAILABLE = 0x00000000,
    UI_CONTEXTAVAILABILITY_AVAILABLE    = 0x00000001,
    UI_CONTEXTAVAILABILITY_ACTIVE       = 0x00000002,
}

alias UI_FONTPROPERTIES = int;
enum : int
{
    UI_FONTPROPERTIES_NOTAVAILABLE = 0x00000000,
    UI_FONTPROPERTIES_NOTSET       = 0x00000001,
    UI_FONTPROPERTIES_SET          = 0x00000002,
}

alias UI_FONTVERTICALPOSITION = int;
enum : int
{
    UI_FONTVERTICALPOSITION_NOTAVAILABLE = 0x00000000,
    UI_FONTVERTICALPOSITION_NOTSET       = 0x00000001,
    UI_FONTVERTICALPOSITION_SUPERSCRIPT  = 0x00000002,
    UI_FONTVERTICALPOSITION_SUBSCRIPT    = 0x00000003,
}

alias UI_FONTUNDERLINE = int;
enum : int
{
    UI_FONTUNDERLINE_NOTAVAILABLE = 0x00000000,
    UI_FONTUNDERLINE_NOTSET       = 0x00000001,
    UI_FONTUNDERLINE_SET          = 0x00000002,
}

alias UI_FONTDELTASIZE = int;
enum : int
{
    UI_FONTDELTASIZE_GROW   = 0x00000000,
    UI_FONTDELTASIZE_SHRINK = 0x00000001,
}

alias UI_CONTROLDOCK = int;
enum : int
{
    UI_CONTROLDOCK_TOP    = 0x00000001,
    UI_CONTROLDOCK_BOTTOM = 0x00000003,
}

alias UI_SWATCHCOLORTYPE = int;
enum : int
{
    UI_SWATCHCOLORTYPE_NOCOLOR   = 0x00000000,
    UI_SWATCHCOLORTYPE_AUTOMATIC = 0x00000001,
    UI_SWATCHCOLORTYPE_RGB       = 0x00000002,
}

alias UI_SWATCHCOLORMODE = int;
enum : int
{
    UI_SWATCHCOLORMODE_NORMAL     = 0x00000000,
    UI_SWATCHCOLORMODE_MONOCHROME = 0x00000001,
}

alias UI_EVENTTYPE = int;
enum : int
{
    UI_EVENTTYPE_ApplicationMenuOpened   = 0x00000000,
    UI_EVENTTYPE_RibbonMinimized         = 0x00000001,
    UI_EVENTTYPE_RibbonExpanded          = 0x00000002,
    UI_EVENTTYPE_ApplicationModeSwitched = 0x00000003,
    UI_EVENTTYPE_TabActivated            = 0x00000004,
    UI_EVENTTYPE_MenuOpened              = 0x00000005,
    UI_EVENTTYPE_CommandExecuted         = 0x00000006,
    UI_EVENTTYPE_TooltipShown            = 0x00000007,
}

alias UI_EVENTLOCATION = int;
enum : int
{
    UI_EVENTLOCATION_Ribbon          = 0x00000000,
    UI_EVENTLOCATION_QAT             = 0x00000001,
    UI_EVENTLOCATION_ApplicationMenu = 0x00000002,
    UI_EVENTLOCATION_ContextPopup    = 0x00000003,
}

enum IID_IUISimplePropertySet = GUID(0xc205bb48, 0x5b1c, 0x4219, [0xa1, 0x6, 0x15, 0xbd, 0xa, 0x5f, 0x24, 0xe2]);
interface IUISimplePropertySet : IUnknown
{
    HRESULT GetValue(const(PROPERTYKEY)*, PROPVARIANT*);
}
enum IID_IUIRibbon = GUID(0x803982ab, 0x370a, 0x4f7e, [0xa9, 0xe7, 0x87, 0x84, 0x3, 0x6a, 0x6e, 0x26]);
interface IUIRibbon : IUnknown
{
    HRESULT GetHeight(uint*);
    HRESULT LoadSettingsFromStream(IStream);
    HRESULT SaveSettingsToStream(IStream);
}
alias UI_INVALIDATIONS = int;
enum : int
{
    UI_INVALIDATIONS_STATE         = 0x00000001,
    UI_INVALIDATIONS_VALUE         = 0x00000002,
    UI_INVALIDATIONS_PROPERTY      = 0x00000004,
    UI_INVALIDATIONS_ALLPROPERTIES = 0x00000008,
}

enum IID_IUIFramework = GUID(0xf4f0385d, 0x6872, 0x43a8, [0xad, 0x9, 0x4c, 0x33, 0x9c, 0xb3, 0xf5, 0xc5]);
interface IUIFramework : IUnknown
{
    HRESULT Initialize(HWND, IUIApplication);
    HRESULT Destroy();
    HRESULT LoadUI(HINSTANCE, const(wchar)*);
    HRESULT GetView(uint, const(GUID)*, void**);
    HRESULT GetUICommandProperty(uint, const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT SetUICommandProperty(uint, const(PROPERTYKEY)*, const(PROPVARIANT)*);
    HRESULT InvalidateUICommand(uint, UI_INVALIDATIONS, const(PROPERTYKEY)*);
    HRESULT FlushPendingInvalidations();
    HRESULT SetModes(int);
}
struct UI_EVENTPARAMS_COMMAND
{
    uint CommandID;
    const(wchar)* CommandName;
    uint ParentCommandID;
    const(wchar)* ParentCommandName;
    uint SelectionIndex;
    UI_EVENTLOCATION Location;
}
struct UI_EVENTPARAMS
{
    UI_EVENTTYPE EventType;
    union
    {
        int Modes;
        UI_EVENTPARAMS_COMMAND Params;
    }
}
enum IID_IUIEventLogger = GUID(0xec3e1034, 0xdbf4, 0x41a1, [0x95, 0xd5, 0x3, 0xe0, 0xf1, 0x2, 0x6e, 0x5]);
interface IUIEventLogger : IUnknown
{
    void OnUIEvent(UI_EVENTPARAMS*);
}
enum IID_IUIEventingManager = GUID(0x3be6ea7f, 0x9a9b, 0x4198, [0x93, 0x68, 0x9b, 0xf, 0x92, 0x3b, 0xd5, 0x34]);
interface IUIEventingManager : IUnknown
{
    HRESULT SetEventLogger(IUIEventLogger);
}
enum IID_IUIContextualUI = GUID(0xeea11f37, 0x7c46, 0x437c, [0x8e, 0x55, 0xb5, 0x21, 0x22, 0xb2, 0x92, 0x93]);
interface IUIContextualUI : IUnknown
{
    HRESULT ShowAtLocation(int, int);
}
enum IID_IUICollection = GUID(0xdf4f45bf, 0x6f9d, 0x4dd7, [0x9d, 0x68, 0xd8, 0xf9, 0xcd, 0x18, 0xc4, 0xdb]);
interface IUICollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetItem(uint, IUnknown*);
    HRESULT Add(IUnknown);
    HRESULT Insert(uint, IUnknown);
    HRESULT RemoveAt(uint);
    HRESULT Replace(uint, IUnknown);
    HRESULT Clear();
}
alias UI_COLLECTIONCHANGE = int;
enum : int
{
    UI_COLLECTIONCHANGE_INSERT  = 0x00000000,
    UI_COLLECTIONCHANGE_REMOVE  = 0x00000001,
    UI_COLLECTIONCHANGE_REPLACE = 0x00000002,
    UI_COLLECTIONCHANGE_RESET   = 0x00000003,
}

enum IID_IUICollectionChangedEvent = GUID(0x6502ae91, 0xa14d, 0x44b5, [0xbb, 0xd0, 0x62, 0xaa, 0xcc, 0x58, 0x1d, 0x52]);
interface IUICollectionChangedEvent : IUnknown
{
    HRESULT OnChanged(UI_COLLECTIONCHANGE, uint, IUnknown, uint, IUnknown);
}
alias UI_EXECUTIONVERB = int;
enum : int
{
    UI_EXECUTIONVERB_EXECUTE       = 0x00000000,
    UI_EXECUTIONVERB_PREVIEW       = 0x00000001,
    UI_EXECUTIONVERB_CANCELPREVIEW = 0x00000002,
}

enum IID_IUICommandHandler = GUID(0x75ae0a2d, 0xdc03, 0x4c9f, [0x88, 0x83, 0x6, 0x96, 0x60, 0xd0, 0xbe, 0xb6]);
interface IUICommandHandler : IUnknown
{
    HRESULT Execute(uint, UI_EXECUTIONVERB, const(PROPERTYKEY)*, const(PROPVARIANT)*, IUISimplePropertySet);
    HRESULT UpdateProperty(uint, const(PROPERTYKEY)*, const(PROPVARIANT)*, PROPVARIANT*);
}
alias UI_COMMANDTYPE = int;
enum : int
{
    UI_COMMANDTYPE_UNKNOWN           = 0x00000000,
    UI_COMMANDTYPE_GROUP             = 0x00000001,
    UI_COMMANDTYPE_ACTION            = 0x00000002,
    UI_COMMANDTYPE_ANCHOR            = 0x00000003,
    UI_COMMANDTYPE_CONTEXT           = 0x00000004,
    UI_COMMANDTYPE_COLLECTION        = 0x00000005,
    UI_COMMANDTYPE_COMMANDCOLLECTION = 0x00000006,
    UI_COMMANDTYPE_DECIMAL           = 0x00000007,
    UI_COMMANDTYPE_BOOLEAN           = 0x00000008,
    UI_COMMANDTYPE_FONT              = 0x00000009,
    UI_COMMANDTYPE_RECENTITEMS       = 0x0000000a,
    UI_COMMANDTYPE_COLORANCHOR       = 0x0000000b,
    UI_COMMANDTYPE_COLORCOLLECTION   = 0x0000000c,
}

alias UI_VIEWTYPE = int;
enum : int
{
    UI_VIEWTYPE_RIBBON = 0x00000001,
}

alias UI_VIEWVERB = int;
enum : int
{
    UI_VIEWVERB_CREATE  = 0x00000000,
    UI_VIEWVERB_DESTROY = 0x00000001,
    UI_VIEWVERB_SIZE    = 0x00000002,
    UI_VIEWVERB_ERROR   = 0x00000003,
}

enum IID_IUIApplication = GUID(0xd428903c, 0x729a, 0x491d, [0x91, 0xd, 0x68, 0x2a, 0x8, 0xff, 0x25, 0x22]);
interface IUIApplication : IUnknown
{
    HRESULT OnViewChanged(uint, UI_VIEWTYPE, IUnknown, UI_VIEWVERB, int);
    HRESULT OnCreateUICommand(uint, UI_COMMANDTYPE, IUICommandHandler*);
    HRESULT OnDestroyUICommand(uint, UI_COMMANDTYPE, IUICommandHandler);
}
enum IID_IUIImage = GUID(0x23c8c838, 0x4de6, 0x436b, [0xab, 0x1, 0x55, 0x54, 0xbb, 0x7c, 0x30, 0xdd]);
interface IUIImage : IUnknown
{
    HRESULT GetBitmap(HBITMAP*);
}
alias UI_OWNERSHIP = int;
enum : int
{
    UI_OWNERSHIP_TRANSFER = 0x00000000,
    UI_OWNERSHIP_COPY     = 0x00000001,
}

enum IID_IUIImageFromBitmap = GUID(0x18aba7f3, 0x4c1c, 0x4ba2, [0xbf, 0x6c, 0xf5, 0xc3, 0x32, 0x6f, 0xa8, 0x16]);
interface IUIImageFromBitmap : IUnknown
{
    HRESULT CreateImage(HBITMAP, UI_OWNERSHIP, IUIImage*);
}
enum CLSID_UIRibbonFramework = GUID(0x926749fa, 0x2615, 0x4987, [0x88, 0x45, 0xc3, 0x3e, 0x65, 0xf2, 0xb9, 0x57]);
struct UIRibbonFramework
{
}
enum CLSID_UIRibbonImageFromBitmapFactory = GUID(0xf7434b6, 0x59b6, 0x4250, [0x99, 0x9e, 0xd1, 0x68, 0xd6, 0xae, 0x42, 0x93]);
struct UIRibbonImageFromBitmapFactory
{
}
