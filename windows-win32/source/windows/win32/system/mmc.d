module windows.win32.system.mmc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, COLORREF, HRESULT, HWND, LPARAM, LRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.graphics.gdi : HBITMAP, HPALETTE;
import windows.win32.system.com_ : IDataObject, IDispatch, IEnumString, IUnknown, VARIANT;
import windows.win32.ui.controls_ : HPROPSHEETPAGE;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

enum MMC_VER = 0x00000200;
enum MMC_PROP_CHANGEAFFECTSUI = 0x00000001;
enum MMC_PROP_MODIFIABLE = 0x00000002;
enum MMC_PROP_REMOVABLE = 0x00000004;
enum MMC_PROP_PERSIST = 0x00000008;
enum MMCLV_AUTO = 0xffffffffffffffff;
enum MMCLV_NOPARAM = 0xfffffffffffffffe;
enum MMCLV_NOICON = 0xffffffffffffffff;
enum MMCLV_VIEWSTYLE_ICON = 0x00000000;
enum MMCLV_VIEWSTYLE_SMALLICON = 0x00000002;
enum MMCLV_VIEWSTYLE_LIST = 0x00000003;
enum MMCLV_VIEWSTYLE_REPORT = 0x00000001;
enum MMCLV_VIEWSTYLE_FILTERED = 0x00000004;
enum MMCLV_NOPTR = 0x00000000;
enum MMCLV_UPDATE_NOINVALIDATEALL = 0x00000001;
enum MMCLV_UPDATE_NOSCROLL = 0x00000002;
enum MMC_IMAGECALLBACK = 0xffffffffffffffff;
enum RDI_STR = 0x00000002;
enum RDI_IMAGE = 0x00000004;
enum RDI_STATE = 0x00000008;
enum RDI_PARAM = 0x00000010;
enum RDI_INDEX = 0x00000020;
enum RDI_INDENT = 0x00000040;
enum MMC_VIEW_OPTIONS_NONE = 0x00000000;
enum MMC_VIEW_OPTIONS_NOLISTVIEWS = 0x00000001;
enum MMC_VIEW_OPTIONS_MULTISELECT = 0x00000002;
enum MMC_VIEW_OPTIONS_OWNERDATALIST = 0x00000004;
enum MMC_VIEW_OPTIONS_FILTERED = 0x00000008;
enum MMC_VIEW_OPTIONS_CREATENEW = 0x00000010;
enum MMC_VIEW_OPTIONS_USEFONTLINKING = 0x00000020;
enum MMC_VIEW_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST = 0x00000040;
enum MMC_VIEW_OPTIONS_LEXICAL_SORT = 0x00000080;
enum MMC_PSO_NOAPPLYNOW = 0x00000001;
enum MMC_PSO_HASHELP = 0x00000002;
enum MMC_PSO_NEWWIZARDTYPE = 0x00000004;
enum MMC_PSO_NO_PROPTITLE = 0x00000008;
enum RFI_PARTIAL = 0x00000001;
enum RFI_WRAP = 0x00000002;
enum RSI_DESCENDING = 0x00000001;
enum RSI_NOSORTICON = 0x00000002;
enum SDI_STR = 0x00000002;
enum SDI_IMAGE = 0x00000004;
enum SDI_OPENIMAGE = 0x00000008;
enum SDI_STATE = 0x00000010;
enum SDI_PARAM = 0x00000020;
enum SDI_CHILDREN = 0x00000040;
enum SDI_PARENT = 0x00000000;
enum SDI_PREVIOUS = 0x10000000;
enum SDI_NEXT = 0x20000000;
enum SDI_FIRST = 0x08000000;
enum MMC_MULTI_SELECT_COOKIE = 0xfffffffffffffffe;
enum MMC_WINDOW_COOKIE = 0xfffffffffffffffd;
enum SPECIAL_COOKIE_MIN = 0xfffffffffffffff6;
enum SPECIAL_COOKIE_MAX = 0xffffffffffffffff;
enum MMC_NW_OPTION_NONE = 0x00000000;
enum MMC_NW_OPTION_NOSCOPEPANE = 0x00000001;
enum MMC_NW_OPTION_NOTOOLBARS = 0x00000002;
enum MMC_NW_OPTION_SHORTTITLE = 0x00000004;
enum MMC_NW_OPTION_CUSTOMTITLE = 0x00000008;
enum MMC_NW_OPTION_NOPERSIST = 0x00000010;
enum MMC_NW_OPTION_NOACTIONPANE = 0x00000020;
enum MMC_NODEID_SLOW_RETRIEVAL = 0x00000001;
enum SPECIAL_DOBJ_MIN = 0xfffffffffffffff6;
enum SPECIAL_DOBJ_MAX = 0x00000000;
enum AUTO_WIDTH = 0xffffffffffffffff;
enum HIDE_COLUMN = 0xfffffffffffffffc;
enum ILSIF_LEAVE_LARGE_ICON = 0x40000000;
enum ILSIF_LEAVE_SMALL_ICON = 0x20000000;
enum HDI_HIDDEN = 0x00000001;
enum RDCI_ScopeItem = 0x80000000;
enum RVTI_MISC_OPTIONS_NOLISTVIEWS = 0x00000001;
enum RVTI_LIST_OPTIONS_NONE = 0x00000000;
enum RVTI_LIST_OPTIONS_OWNERDATALIST = 0x00000002;
enum RVTI_LIST_OPTIONS_MULTISELECT = 0x00000004;
enum RVTI_LIST_OPTIONS_FILTERED = 0x00000008;
enum RVTI_LIST_OPTIONS_USEFONTLINKING = 0x00000020;
enum RVTI_LIST_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST = 0x00000040;
enum RVTI_LIST_OPTIONS_LEXICAL_SORT = 0x00000080;
enum RVTI_LIST_OPTIONS_ALLOWPASTE = 0x00000100;
enum RVTI_HTML_OPTIONS_NONE = 0x00000000;
enum RVTI_HTML_OPTIONS_NOLISTVIEW = 0x00000001;
enum RVTI_OCX_OPTIONS_NONE = 0x00000000;
enum RVTI_OCX_OPTIONS_NOLISTVIEW = 0x00000001;
enum RVTI_OCX_OPTIONS_CACHE_OCX = 0x00000002;
enum MMC_DEFAULT_OPERATION_COPY = 0x00000001;
enum MMC_ITEM_OVERLAY_STATE_MASK = 0x00000f00;
enum MMC_ITEM_OVERLAY_STATE_SHIFT = 0x00000008;
enum MMC_ITEM_STATE_MASK = 0x000000ff;
enum CLSID_Application = GUID(0x49b2791a, 0xb1ae, 0x4c90, [0x9b, 0x8e, 0xe8, 0x60, 0xba, 0x7, 0xf8, 0x89]);
struct Application
{
}
enum CLSID_AppEventsDHTMLConnector = GUID(0xade6444b, 0xc91f, 0x4e37, [0x92, 0xa4, 0x5b, 0xb4, 0x30, 0xa3, 0x33, 0x40]);
struct AppEventsDHTMLConnector
{
}
alias MMC_PROPERTY_ACTION = int;
enum : int
{
    MMC_PROPACT_DELETING    = 0x00000001,
    MMC_PROPACT_CHANGING    = 0x00000002,
    MMC_PROPACT_INITIALIZED = 0x00000003,
}

struct MMC_SNAPIN_PROPERTY
{
    const(wchar)* pszPropName;
    VARIANT varValue;
    MMC_PROPERTY_ACTION eAction;
}
enum IID_ISnapinProperties = GUID(0xf7889da9, 0x4a02, 0x4837, [0xbf, 0x89, 0x1a, 0x6f, 0x2a, 0x2, 0x10, 0x10]);
interface ISnapinProperties : IUnknown
{
    HRESULT Initialize(Properties);
    HRESULT QueryPropertyNames(ISnapinPropertiesCallback);
    HRESULT PropertiesChanged(int, MMC_SNAPIN_PROPERTY*);
}
enum IID_ISnapinPropertiesCallback = GUID(0xa50fa2e5, 0x7e61, 0x45eb, [0xa8, 0xd4, 0x9a, 0x7, 0xb3, 0xe8, 0x51, 0xa8]);
interface ISnapinPropertiesCallback : IUnknown
{
    HRESULT AddPropertyName(const(wchar)*, uint);
}
alias _DocumentMode = int;
enum : int
{
    DocumentMode_Author   = 0x00000000,
    DocumentMode_User     = 0x00000001,
    DocumentMode_User_MDI = 0x00000002,
    DocumentMode_User_SDI = 0x00000003,
}

alias _ListViewMode = int;
enum : int
{
    ListMode_Small_Icons = 0x00000000,
    ListMode_Large_Icons = 0x00000001,
    ListMode_List        = 0x00000002,
    ListMode_Detail      = 0x00000003,
    ListMode_Filtered    = 0x00000004,
}

alias _ViewOptions = int;
enum : int
{
    ViewOption_Default          = 0x00000000,
    ViewOption_ScopeTreeHidden  = 0x00000001,
    ViewOption_NoToolBars       = 0x00000002,
    ViewOption_NotPersistable   = 0x00000004,
    ViewOption_ActionPaneHidden = 0x00000008,
}

alias _ExportListOptions = int;
enum : int
{
    ExportListOptions_Default           = 0x00000000,
    ExportListOptions_Unicode           = 0x00000001,
    ExportListOptions_TabDelimited      = 0x00000002,
    ExportListOptions_SelectedItemsOnly = 0x00000004,
}

enum IID__Application = GUID(0xa3afb9cc, 0xb653, 0x4741, [0x86, 0xab, 0xf0, 0x47, 0xe, 0xc1, 0x38, 0x4c]);
interface _Application : IDispatch
{
    void Help();
    void Quit();
    HRESULT get_Document(Document*);
    HRESULT Load(BSTR);
    HRESULT get_Frame(Frame*);
    HRESULT get_Visible(BOOL*);
    HRESULT Show();
    HRESULT Hide();
    HRESULT get_UserControl(BOOL*);
    HRESULT put_UserControl(BOOL);
    HRESULT get_VersionMajor(int*);
    HRESULT get_VersionMinor(int*);
}
enum IID__AppEvents = GUID(0xde46cbdd, 0x53f5, 0x4635, [0xaf, 0x54, 0x4f, 0xe7, 0x1e, 0x92, 0x3d, 0x3f]);
interface _AppEvents : IDispatch
{
    HRESULT OnQuit(_Application);
    HRESULT OnDocumentOpen(Document, BOOL);
    HRESULT OnDocumentClose(Document);
    HRESULT OnSnapInAdded(Document, SnapIn);
    HRESULT OnSnapInRemoved(Document, SnapIn);
    HRESULT OnNewView(View);
    HRESULT OnViewClose(View);
    HRESULT OnViewChange(View, Node);
    HRESULT OnSelectionChange(View, Nodes);
    HRESULT OnContextMenuExecuted(MenuItem);
    HRESULT OnToolbarButtonClicked();
    HRESULT OnListUpdated(View);
}
enum IID_AppEvents = GUID(0xfc7a4252, 0x78ac, 0x4532, [0x8c, 0x5a, 0x56, 0x3c, 0xfe, 0x13, 0x88, 0x63]);
interface AppEvents : IDispatch
{
}
enum IID__EventConnector = GUID(0xc0bccd30, 0xde44, 0x4528, [0x84, 0x3, 0xa0, 0x5a, 0x6a, 0x1c, 0xc8, 0xea]);
interface _EventConnector : IDispatch
{
    HRESULT ConnectTo(_Application);
    HRESULT Disconnect();
}
enum IID_Frame = GUID(0xe5e2d970, 0x5bb3, 0x4306, [0x88, 0x4, 0xb0, 0x96, 0x8a, 0x31, 0xc8, 0xe6]);
interface Frame : IDispatch
{
    HRESULT Maximize();
    HRESULT Minimize();
    HRESULT Restore();
    HRESULT get_Top(int*);
    HRESULT put_Top(int);
    HRESULT get_Bottom(int*);
    HRESULT put_Bottom(int);
    HRESULT get_Left(int*);
    HRESULT put_Left(int);
    HRESULT get_Right(int*);
    HRESULT put_Right(int);
}
enum IID_Node = GUID(0xf81ed800, 0x7839, 0x4447, [0x94, 0x5d, 0x8e, 0x15, 0xda, 0x59, 0xca, 0x55]);
interface Node : IDispatch
{
    HRESULT get_Name(ushort**);
    HRESULT get_Property(BSTR, ushort**);
    HRESULT get_Bookmark(ushort**);
    HRESULT IsScopeNode(BOOL*);
    HRESULT get_Nodetype(ushort**);
}
enum IID_ScopeNamespace = GUID(0xebbb48dc, 0x1a3b, 0x4d86, [0xb7, 0x86, 0xc2, 0x1b, 0x28, 0x38, 0x90, 0x12]);
interface ScopeNamespace : IDispatch
{
    HRESULT GetParent(Node, Node*);
    HRESULT GetChild(Node, Node*);
    HRESULT GetNext(Node, Node*);
    HRESULT GetRoot(Node*);
    HRESULT Expand(Node);
}
enum IID_Document = GUID(0x225120d6, 0x1e0f, 0x40a3, [0x93, 0xfe, 0x10, 0x79, 0xe6, 0xa8, 0x1, 0x7b]);
interface Document : IDispatch
{
    HRESULT Save();
    HRESULT SaveAs(BSTR);
    HRESULT Close(BOOL);
    HRESULT get_Views(Views*);
    HRESULT get_SnapIns(SnapIns*);
    HRESULT get_ActiveView(View*);
    HRESULT get_Name(ushort**);
    HRESULT put_Name(BSTR);
    HRESULT get_Location(ushort**);
    HRESULT get_IsSaved(BOOL*);
    HRESULT get_Mode(_DocumentMode*);
    HRESULT put_Mode(_DocumentMode);
    HRESULT get_RootNode(Node*);
    HRESULT get_ScopeNamespace(ScopeNamespace*);
    HRESULT CreateProperties(Properties*);
    HRESULT get_Application(_Application*);
}
enum IID_SnapIn = GUID(0x3be910f6, 0x3459, 0x49c6, [0xa1, 0xbb, 0x41, 0xe6, 0xbe, 0x9d, 0xf3, 0xea]);
interface SnapIn : IDispatch
{
    HRESULT get_Name(ushort**);
    HRESULT get_Vendor(ushort**);
    HRESULT get_Version(ushort**);
    HRESULT get_Extensions(Extensions*);
    HRESULT get_SnapinCLSID(ushort**);
    HRESULT get_Properties(Properties*);
    HRESULT EnableAllExtensions(BOOL);
}
enum IID_SnapIns = GUID(0x2ef3de1d, 0xb12a, 0x49d1, [0x92, 0xc5, 0xb, 0x0, 0x79, 0x87, 0x68, 0xf1]);
interface SnapIns : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, SnapIn*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, VARIANT, VARIANT, SnapIn*);
    HRESULT Remove(SnapIn);
}
enum IID_Extension = GUID(0xad4d6ca6, 0x912f, 0x409b, [0xa2, 0x6e, 0x7f, 0xd2, 0x34, 0xae, 0xf5, 0x42]);
interface Extension : IDispatch
{
    HRESULT get_Name(ushort**);
    HRESULT get_Vendor(ushort**);
    HRESULT get_Version(ushort**);
    HRESULT get_Extensions(Extensions*);
    HRESULT get_SnapinCLSID(ushort**);
    HRESULT EnableAllExtensions(BOOL);
    HRESULT Enable(BOOL);
}
enum IID_Extensions = GUID(0x82dbea43, 0x8ca4, 0x44bc, [0xa2, 0xca, 0xd1, 0x87, 0x41, 0x5, 0x9e, 0xc8]);
interface Extensions : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, Extension*);
    HRESULT get_Count(int*);
}
enum IID_Columns = GUID(0x383d4d97, 0xfc44, 0x478b, [0xb1, 0x39, 0x63, 0x23, 0xdc, 0x48, 0x61, 0x1c]);
interface Columns : IDispatch
{
    HRESULT Item(int, Column*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
alias _ColumnSortOrder = int;
enum : int
{
    SortOrder_Ascending  = 0x00000000,
    SortOrder_Descending = 0x00000001,
}

enum IID_Column = GUID(0xfd1c5f63, 0x2b16, 0x4d06, [0x9a, 0xb3, 0xf4, 0x53, 0x50, 0xb9, 0x40, 0xab]);
interface Column : IDispatch
{
    HRESULT Name(BSTR*);
    HRESULT get_Width(int*);
    HRESULT put_Width(int);
    HRESULT get_DisplayPosition(int*);
    HRESULT put_DisplayPosition(int);
    HRESULT get_Hidden(BOOL*);
    HRESULT put_Hidden(BOOL);
    HRESULT SetAsSortColumn(_ColumnSortOrder);
    HRESULT IsSortColumn(BOOL*);
}
enum IID_Views = GUID(0xd6b8c29d, 0xa1ff, 0x4d72, [0xaa, 0xb0, 0xe3, 0x81, 0xe9, 0xb9, 0x33, 0x8d]);
interface Views : IDispatch
{
    HRESULT Item(int, View*);
    HRESULT get_Count(int*);
    HRESULT Add(Node, _ViewOptions);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_View = GUID(0x6efc2da2, 0xb38c, 0x457e, [0x9a, 0xbb, 0xed, 0x2d, 0x18, 0x9b, 0x8c, 0x38]);
interface View : IDispatch
{
    HRESULT get_ActiveScopeNode(Node*);
    HRESULT put_ActiveScopeNode(Node);
    HRESULT get_Selection(Nodes*);
    HRESULT get_ListItems(Nodes*);
    HRESULT SnapinScopeObject(VARIANT, IDispatch*);
    HRESULT SnapinSelectionObject(IDispatch*);
    HRESULT Is(View, VARIANT_BOOL*);
    HRESULT get_Document(Document*);
    HRESULT SelectAll();
    HRESULT Select(Node);
    HRESULT Deselect(Node);
    HRESULT IsSelected(Node, BOOL*);
    HRESULT DisplayScopeNodePropertySheet(VARIANT);
    HRESULT DisplaySelectionPropertySheet();
    HRESULT CopyScopeNode(VARIANT);
    HRESULT CopySelection();
    HRESULT DeleteScopeNode(VARIANT);
    HRESULT DeleteSelection();
    HRESULT RenameScopeNode(BSTR, VARIANT);
    HRESULT RenameSelectedItem(BSTR);
    HRESULT get_ScopeNodeContextMenu(VARIANT, ContextMenu*);
    HRESULT get_SelectionContextMenu(ContextMenu*);
    HRESULT RefreshScopeNode(VARIANT);
    HRESULT RefreshSelection();
    HRESULT ExecuteSelectionMenuItem(BSTR);
    HRESULT ExecuteScopeNodeMenuItem(BSTR, VARIANT);
    HRESULT ExecuteShellCommand(BSTR, BSTR, BSTR, BSTR);
    HRESULT get_Frame(Frame*);
    HRESULT Close();
    HRESULT get_ScopeTreeVisible(BOOL*);
    HRESULT put_ScopeTreeVisible(BOOL);
    HRESULT Back();
    HRESULT Forward();
    HRESULT put_StatusBarText(BSTR);
    HRESULT get_Memento(ushort**);
    HRESULT ViewMemento(BSTR);
    HRESULT get_Columns(Columns*);
    HRESULT get_CellContents(Node, int, ushort**);
    HRESULT ExportList(BSTR, _ExportListOptions);
    HRESULT get_ListViewMode(_ListViewMode*);
    HRESULT put_ListViewMode(_ListViewMode);
    HRESULT get_ControlObject(IDispatch*);
}
enum IID_Nodes = GUID(0x313b01df, 0xb22f, 0x4d42, [0xb1, 0xb8, 0x48, 0x3c, 0xdc, 0xf5, 0x1d, 0x35]);
interface Nodes : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, Node*);
    HRESULT get_Count(int*);
}
enum IID_ContextMenu = GUID(0xdab39ce0, 0x25e6, 0x4e07, [0x83, 0x62, 0xba, 0x9c, 0x95, 0x70, 0x65, 0x45]);
interface ContextMenu : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, MenuItem*);
    HRESULT get_Count(int*);
}
enum IID_MenuItem = GUID(0x178fad1, 0xb361, 0x4b27, [0x96, 0xad, 0x67, 0xc5, 0x7e, 0xbf, 0x2e, 0x1d]);
interface MenuItem : IDispatch
{
    HRESULT get_DisplayName(ushort**);
    HRESULT get_LanguageIndependentName(ushort**);
    HRESULT get_Path(ushort**);
    HRESULT get_LanguageIndependentPath(ushort**);
    HRESULT Execute();
    HRESULT get_Enabled(BOOL*);
}
enum IID_Properties = GUID(0x2886abc2, 0xa425, 0x42b2, [0x91, 0xc6, 0xe2, 0x5c, 0xe, 0x4, 0x58, 0x1c]);
interface Properties : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, Property*);
    HRESULT get_Count(int*);
    HRESULT Remove(BSTR);
}
enum IID_Property = GUID(0x4600c3a5, 0xe301, 0x41d8, [0xb6, 0xd0, 0xef, 0x2e, 0x42, 0x12, 0xe0, 0xca]);
interface Property : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT);
    HRESULT get_Name(ushort**);
}
enum CLSID_MMCVersionInfo = GUID(0xd6fedb1d, 0xcf21, 0x4bd9, [0xaf, 0x3b, 0xc5, 0x46, 0x8e, 0x9c, 0x66, 0x84]);
struct MMCVersionInfo
{
}
enum CLSID_ConsolePower = GUID(0xf0285374, 0xdff1, 0x11d3, [0xb4, 0x33, 0x0, 0xc0, 0x4f, 0x8e, 0xcd, 0x78]);
struct ConsolePower
{
}
alias MMC_RESULT_VIEW_STYLE = int;
enum : int
{
    MMC_SINGLESEL          = 0x00000001,
    MMC_SHOWSELALWAYS      = 0x00000002,
    MMC_NOSORTHEADER       = 0x00000004,
    MMC_ENSUREFOCUSVISIBLE = 0x00000008,
}

alias MMC_CONTROL_TYPE = int;
enum : int
{
    TOOLBAR     = 0x00000000,
    MENUBUTTON  = 0x00000001,
    COMBOBOXBAR = 0x00000002,
}

alias MMC_CONSOLE_VERB = int;
enum : int
{
    MMC_VERB_NONE       = 0x00000000,
    MMC_VERB_OPEN       = 0x00008000,
    MMC_VERB_COPY       = 0x00008001,
    MMC_VERB_PASTE      = 0x00008002,
    MMC_VERB_DELETE     = 0x00008003,
    MMC_VERB_PROPERTIES = 0x00008004,
    MMC_VERB_RENAME     = 0x00008005,
    MMC_VERB_REFRESH    = 0x00008006,
    MMC_VERB_PRINT      = 0x00008007,
    MMC_VERB_CUT        = 0x00008008,
    MMC_VERB_MAX        = 0x00008009,
    MMC_VERB_FIRST      = 0x00008000,
    MMC_VERB_LAST       = 0x00008008,
}

struct MMCBUTTON
{
    int nBitmap;
    int idCommand;
    ubyte fsState;
    ubyte fsType;
    PWSTR lpButtonText;
    PWSTR lpTooltipText;
}
alias MMC_BUTTON_STATE = int;
enum : int
{
    ENABLED       = 0x00000001,
    CHECKED       = 0x00000002,
    HIDDEN        = 0x00000004,
    INDETERMINATE = 0x00000008,
    BUTTONPRESSED = 0x00000010,
}

struct RESULTDATAITEM
{
    uint mask;
    BOOL bScopeItem;
    long itemID;
    int nIndex;
    int nCol;
    PWSTR str;
    int nImage;
    uint nState;
    LPARAM lParam;
    int iIndent;
}
struct RESULTFINDINFO
{
    PWSTR psz;
    int nStart;
    uint dwOptions;
}
struct SCOPEDATAITEM
{
    uint mask;
    PWSTR displayname;
    int nImage;
    int nOpenImage;
    uint nState;
    int cChildren;
    LPARAM lParam;
    long relativeID;
    long ID;
}
alias MMC_SCOPE_ITEM_STATE = int;
enum : int
{
    MMC_SCOPE_ITEM_STATE_NORMAL       = 0x00000001,
    MMC_SCOPE_ITEM_STATE_BOLD         = 0x00000002,
    MMC_SCOPE_ITEM_STATE_EXPANDEDONCE = 0x00000003,
}

struct CONTEXTMENUITEM
{
    PWSTR strName;
    PWSTR strStatusBarText;
    int lCommandID;
    int lInsertionPointID;
    int fFlags;
    int fSpecialFlags;
}
alias MMC_MENU_COMMAND_IDS = int;
enum : int
{
    MMCC_STANDARD_VIEW_SELECT = 0xffffffff,
}

struct MENUBUTTONDATA
{
    int idCommand;
    int x;
    int y;
}
alias MMC_FILTER_TYPE = int;
enum : int
{
    MMC_STRING_FILTER  = 0x00000000,
    MMC_INT_FILTER     = 0x00000001,
    MMC_FILTER_NOVALUE = 0x00008000,
}

struct MMC_FILTERDATA
{
    PWSTR pszText;
    int cchTextMax;
    int lValue;
}
alias MMC_FILTER_CHANGE_CODE = int;
enum : int
{
    MFCC_DISABLE      = 0x00000000,
    MFCC_ENABLE       = 0x00000001,
    MFCC_VALUE_CHANGE = 0x00000002,
}

struct MMC_RESTORE_VIEW
{
    uint dwSize;
    long cookie;
    PWSTR pViewType;
    int lViewOptions;
}
struct MMC_EXPANDSYNC_STRUCT
{
    BOOL bHandled;
    BOOL bExpanding;
    long hItem;
}
struct MMC_VISIBLE_COLUMNS
{
    int nVisibleColumns;
    int[1] rgVisibleCols;
}
alias MMC_NOTIFY_TYPE = int;
enum : int
{
    MMCN_ACTIVATE           = 0x00008001,
    MMCN_ADD_IMAGES         = 0x00008002,
    MMCN_BTN_CLICK          = 0x00008003,
    MMCN_CLICK              = 0x00008004,
    MMCN_COLUMN_CLICK       = 0x00008005,
    MMCN_CONTEXTMENU        = 0x00008006,
    MMCN_CUTORMOVE          = 0x00008007,
    MMCN_DBLCLICK           = 0x00008008,
    MMCN_DELETE             = 0x00008009,
    MMCN_DESELECT_ALL       = 0x0000800a,
    MMCN_EXPAND             = 0x0000800b,
    MMCN_HELP               = 0x0000800c,
    MMCN_MENU_BTNCLICK      = 0x0000800d,
    MMCN_MINIMIZED          = 0x0000800e,
    MMCN_PASTE              = 0x0000800f,
    MMCN_PROPERTY_CHANGE    = 0x00008010,
    MMCN_QUERY_PASTE        = 0x00008011,
    MMCN_REFRESH            = 0x00008012,
    MMCN_REMOVE_CHILDREN    = 0x00008013,
    MMCN_RENAME             = 0x00008014,
    MMCN_SELECT             = 0x00008015,
    MMCN_SHOW               = 0x00008016,
    MMCN_VIEW_CHANGE        = 0x00008017,
    MMCN_SNAPINHELP         = 0x00008018,
    MMCN_CONTEXTHELP        = 0x00008019,
    MMCN_INITOCX            = 0x0000801a,
    MMCN_FILTER_CHANGE      = 0x0000801b,
    MMCN_FILTERBTN_CLICK    = 0x0000801c,
    MMCN_RESTORE_VIEW       = 0x0000801d,
    MMCN_PRINT              = 0x0000801e,
    MMCN_PRELOAD            = 0x0000801f,
    MMCN_LISTPAD            = 0x00008020,
    MMCN_EXPANDSYNC         = 0x00008021,
    MMCN_COLUMNS_CHANGED    = 0x00008022,
    MMCN_CANPASTE_OUTOFPROC = 0x00008023,
}

alias DATA_OBJECT_TYPES = int;
enum : int
{
    CCT_SCOPE          = 0x00008000,
    CCT_RESULT         = 0x00008001,
    CCT_SNAPIN_MANAGER = 0x00008002,
    CCT_UNINITIALIZED  = 0x0000ffff,
}

struct SMMCDataObjects
{
    uint count;
    IDataObject[1] lpDataObject;
}
struct SMMCObjectTypes
{
    uint count;
    GUID[1] guid;
}
struct SNodeID
{
    uint cBytes;
    ubyte[1] id;
}
struct SNodeID2
{
    uint dwFlags;
    uint cBytes;
    ubyte[1] id;
}
struct SColumnSetID
{
    uint dwFlags;
    uint cBytes;
    ubyte[1] id;
}
enum IID_IComponentData = GUID(0x955ab28a, 0x5218, 0x11d0, [0xa9, 0x85, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IComponentData : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT CreateComponent(IComponent*);
    HRESULT Notify(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM);
    HRESULT Destroy();
    HRESULT QueryDataObject(long, DATA_OBJECT_TYPES, IDataObject*);
    HRESULT GetDisplayInfo(SCOPEDATAITEM*);
    HRESULT CompareObjects(IDataObject, IDataObject);
}
enum IID_IComponent = GUID(0x43136eb2, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IComponent : IUnknown
{
    HRESULT Initialize(IConsole);
    HRESULT Notify(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM);
    HRESULT Destroy(long);
    HRESULT QueryDataObject(long, DATA_OBJECT_TYPES, IDataObject*);
    HRESULT GetResultViewType(long, PWSTR*, int*);
    HRESULT GetDisplayInfo(RESULTDATAITEM*);
    HRESULT CompareObjects(IDataObject, IDataObject);
}
enum IID_IResultDataCompare = GUID(0xe8315a52, 0x7a1a, 0x11d0, [0xa2, 0xd2, 0x0, 0xc0, 0x4f, 0xd9, 0x9, 0xdd]);
interface IResultDataCompare : IUnknown
{
    HRESULT Compare(LPARAM, long, long, int*);
}
enum IID_IResultOwnerData = GUID(0x9cb396d8, 0xea83, 0x11d0, [0xae, 0xf1, 0x0, 0xc0, 0x4f, 0xb6, 0xdd, 0x2c]);
interface IResultOwnerData : IUnknown
{
    HRESULT FindItem(RESULTFINDINFO*, int*);
    HRESULT CacheHint(int, int);
    HRESULT SortItems(int, uint, LPARAM);
}
enum IID_IConsole = GUID(0x43136eb1, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IConsole : IUnknown
{
    HRESULT SetHeader(IHeaderCtrl);
    HRESULT SetToolbar(IToolbar);
    HRESULT QueryResultView(IUnknown*);
    HRESULT QueryScopeImageList(IImageList*);
    HRESULT QueryResultImageList(IImageList*);
    HRESULT UpdateAllViews(IDataObject, LPARAM, long);
    HRESULT MessageBox(const(wchar)*, const(wchar)*, uint, int*);
    HRESULT QueryConsoleVerb(IConsoleVerb*);
    HRESULT SelectScopeItem(long);
    HRESULT GetMainWindow(HWND*);
    HRESULT NewWindow(long, uint);
}
enum IID_IHeaderCtrl = GUID(0x43136eb3, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IHeaderCtrl : IUnknown
{
    HRESULT InsertColumn(int, const(wchar)*, int, int);
    HRESULT DeleteColumn(int);
    HRESULT SetColumnText(int, const(wchar)*);
    HRESULT GetColumnText(int, PWSTR*);
    HRESULT SetColumnWidth(int, int);
    HRESULT GetColumnWidth(int, int*);
}
alias CCM_INSERTIONPOINTID = int;
enum : int
{
    CCM_INSERTIONPOINTID_MASK_SPECIAL        = 0xffff0000,
    CCM_INSERTIONPOINTID_MASK_SHARED         = 0x80000000,
    CCM_INSERTIONPOINTID_MASK_CREATE_PRIMARY = 0x40000000,
    CCM_INSERTIONPOINTID_MASK_ADD_PRIMARY    = 0x20000000,
    CCM_INSERTIONPOINTID_MASK_ADD_3RDPARTY   = 0x10000000,
    CCM_INSERTIONPOINTID_MASK_RESERVED       = 0x0fff0000,
    CCM_INSERTIONPOINTID_MASK_FLAGINDEX      = 0x0000001f,
    CCM_INSERTIONPOINTID_PRIMARY_TOP         = 0xa0000000,
    CCM_INSERTIONPOINTID_PRIMARY_NEW         = 0xa0000001,
    CCM_INSERTIONPOINTID_PRIMARY_TASK        = 0xa0000002,
    CCM_INSERTIONPOINTID_PRIMARY_VIEW        = 0xa0000003,
    CCM_INSERTIONPOINTID_PRIMARY_HELP        = 0xa0000004,
    CCM_INSERTIONPOINTID_3RDPARTY_NEW        = 0x90000001,
    CCM_INSERTIONPOINTID_3RDPARTY_TASK       = 0x90000002,
    CCM_INSERTIONPOINTID_ROOT_MENU           = 0x80000000,
}

alias CCM_INSERTIONALLOWED = int;
enum : int
{
    CCM_INSERTIONALLOWED_TOP  = 0x00000001,
    CCM_INSERTIONALLOWED_NEW  = 0x00000002,
    CCM_INSERTIONALLOWED_TASK = 0x00000004,
    CCM_INSERTIONALLOWED_VIEW = 0x00000008,
}

alias CCM_COMMANDID_MASK_CONSTANTS = uint;
enum : uint
{
    CCM_COMMANDID_MASK_RESERVED = 0xffff0000,
}

alias CCM_SPECIAL = int;
enum : int
{
    CCM_SPECIAL_SEPARATOR       = 0x00000001,
    CCM_SPECIAL_SUBMENU         = 0x00000002,
    CCM_SPECIAL_DEFAULT_ITEM    = 0x00000004,
    CCM_SPECIAL_INSERTION_POINT = 0x00000008,
    CCM_SPECIAL_TESTONLY        = 0x00000010,
}

enum IID_IContextMenuCallback = GUID(0x43136eb7, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IContextMenuCallback : IUnknown
{
    HRESULT AddItem(CONTEXTMENUITEM*);
}
enum IID_IContextMenuProvider = GUID(0x43136eb6, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IContextMenuProvider : IContextMenuCallback
{
    HRESULT EmptyMenuList();
    HRESULT AddPrimaryExtensionItems(IUnknown, IDataObject);
    HRESULT AddThirdPartyExtensionItems(IDataObject);
    HRESULT ShowContextMenu(HWND, int, int, int*);
}
enum IID_IExtendContextMenu = GUID(0x4f3b7a4f, 0xcfac, 0x11cf, [0xb8, 0xe3, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0xb0]);
interface IExtendContextMenu : IUnknown
{
    HRESULT AddMenuItems(IDataObject, IContextMenuCallback, int*);
    HRESULT Command(int, IDataObject);
}
enum IID_IImageList = GUID(0x43136eb8, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IImageList : IUnknown
{
    HRESULT ImageListSetIcon(long*, int);
    HRESULT ImageListSetStrip(long*, long*, int, COLORREF);
}
enum IID_IResultData = GUID(0x31da5fa0, 0xe0eb, 0x11cf, [0x9f, 0x21, 0x0, 0xaa, 0x0, 0x3c, 0xa9, 0xf6]);
interface IResultData : IUnknown
{
    HRESULT InsertItem(RESULTDATAITEM*);
    HRESULT DeleteItem(long, int);
    HRESULT FindItemByLParam(LPARAM, long*);
    HRESULT DeleteAllRsltItems();
    HRESULT SetItem(RESULTDATAITEM*);
    HRESULT GetItem(RESULTDATAITEM*);
    HRESULT GetNextItem(RESULTDATAITEM*);
    HRESULT ModifyItemState(int, long, uint, uint);
    HRESULT ModifyViewStyle(MMC_RESULT_VIEW_STYLE, MMC_RESULT_VIEW_STYLE);
    HRESULT SetViewMode(int);
    HRESULT GetViewMode(int*);
    HRESULT UpdateItem(long);
    HRESULT Sort(int, uint, LPARAM);
    HRESULT SetDescBarText(PWSTR);
    HRESULT SetItemCount(int, uint);
}
enum IID_IConsoleNameSpace = GUID(0xbedeb620, 0xf24d, 0x11cf, [0x8a, 0xfc, 0x0, 0xaa, 0x0, 0x3c, 0xa9, 0xf6]);
interface IConsoleNameSpace : IUnknown
{
    HRESULT InsertItem(SCOPEDATAITEM*);
    HRESULT DeleteItem(long, int);
    HRESULT SetItem(SCOPEDATAITEM*);
    HRESULT GetItem(SCOPEDATAITEM*);
    HRESULT GetChildItem(long, long*, long*);
    HRESULT GetNextItem(long, long*, long*);
    HRESULT GetParentItem(long, long*, long*);
}
enum IID_IConsoleNameSpace2 = GUID(0x255f18cc, 0x65db, 0x11d1, [0xa7, 0xdc, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IConsoleNameSpace2 : IConsoleNameSpace
{
    HRESULT Expand(long);
    HRESULT AddExtension(long, GUID*);
}
enum IID_IPropertySheetCallback = GUID(0x85de64dd, 0xef21, 0x11cf, [0xa2, 0x85, 0x0, 0xc0, 0x4f, 0xd8, 0xdb, 0xe6]);
interface IPropertySheetCallback : IUnknown
{
    HRESULT AddPage(HPROPSHEETPAGE);
    HRESULT RemovePage(HPROPSHEETPAGE);
}
enum IID_IPropertySheetProvider = GUID(0x85de64de, 0xef21, 0x11cf, [0xa2, 0x85, 0x0, 0xc0, 0x4f, 0xd8, 0xdb, 0xe6]);
interface IPropertySheetProvider : IUnknown
{
    HRESULT CreatePropertySheet(const(wchar)*, ubyte, long, IDataObject, uint);
    HRESULT FindPropertySheet(long, IComponent, IDataObject);
    HRESULT AddPrimaryPages(IUnknown, BOOL, HWND, BOOL);
    HRESULT AddExtensionPages();
    HRESULT Show(long, int);
}
enum IID_IExtendPropertySheet = GUID(0x85de64dc, 0xef21, 0x11cf, [0xa2, 0x85, 0x0, 0xc0, 0x4f, 0xd8, 0xdb, 0xe6]);
interface IExtendPropertySheet : IUnknown
{
    HRESULT CreatePropertyPages(IPropertySheetCallback, long, IDataObject);
    HRESULT QueryPagesFor(IDataObject);
}
enum IID_IControlbar = GUID(0x69fb811e, 0x6c1c, 0x11d0, [0xa2, 0xcb, 0x0, 0xc0, 0x4f, 0xd9, 0x9, 0xdd]);
interface IControlbar : IUnknown
{
    HRESULT Create(MMC_CONTROL_TYPE, IExtendControlbar, IUnknown*);
    HRESULT Attach(MMC_CONTROL_TYPE, IUnknown);
    HRESULT Detach(IUnknown);
}
enum IID_IExtendControlbar = GUID(0x49506520, 0x6f40, 0x11d0, [0xa9, 0x8b, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IExtendControlbar : IUnknown
{
    HRESULT SetControlbar(IControlbar);
    HRESULT ControlbarNotify(MMC_NOTIFY_TYPE, LPARAM, LPARAM);
}
enum IID_IToolbar = GUID(0x43136eb9, 0xd36c, 0x11cf, [0xad, 0xbc, 0x0, 0xaa, 0x0, 0xa8, 0x0, 0x33]);
interface IToolbar : IUnknown
{
    HRESULT AddBitmap(int, HBITMAP, int, int, COLORREF);
    HRESULT AddButtons(int, MMCBUTTON*);
    HRESULT InsertButton(int, MMCBUTTON*);
    HRESULT DeleteButton(int);
    HRESULT GetButtonState(int, MMC_BUTTON_STATE, BOOL*);
    HRESULT SetButtonState(int, MMC_BUTTON_STATE, BOOL);
}
enum IID_IConsoleVerb = GUID(0xe49f7a60, 0x74af, 0x11d0, [0xa2, 0x86, 0x0, 0xc0, 0x4f, 0xd8, 0xfe, 0x93]);
interface IConsoleVerb : IUnknown
{
    HRESULT GetVerbState(MMC_CONSOLE_VERB, MMC_BUTTON_STATE, BOOL*);
    HRESULT SetVerbState(MMC_CONSOLE_VERB, MMC_BUTTON_STATE, BOOL);
    HRESULT SetDefaultVerb(MMC_CONSOLE_VERB);
    HRESULT GetDefaultVerb(MMC_CONSOLE_VERB*);
}
enum IID_ISnapinAbout = GUID(0x1245208c, 0xa151, 0x11d0, [0xa7, 0xd7, 0x0, 0xc0, 0x4f, 0xd9, 0x9, 0xdd]);
interface ISnapinAbout : IUnknown
{
    HRESULT GetSnapinDescription(PWSTR*);
    HRESULT GetProvider(PWSTR*);
    HRESULT GetSnapinVersion(PWSTR*);
    HRESULT GetSnapinImage(HICON*);
    HRESULT GetStaticFolderImage(HBITMAP*, HBITMAP*, HBITMAP*, COLORREF*);
}
enum IID_IMenuButton = GUID(0x951ed750, 0xd080, 0x11d0, [0xb1, 0x97, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
interface IMenuButton : IUnknown
{
    HRESULT AddButton(int, PWSTR, PWSTR);
    HRESULT SetButton(int, PWSTR, PWSTR);
    HRESULT SetButtonState(int, MMC_BUTTON_STATE, BOOL);
}
enum IID_ISnapinHelp = GUID(0xa6b15ace, 0xdf59, 0x11d0, [0xa7, 0xdd, 0x0, 0xc0, 0x4f, 0xd9, 0x9, 0xdd]);
interface ISnapinHelp : IUnknown
{
    HRESULT GetHelpTopic(PWSTR*);
}
enum IID_IExtendPropertySheet2 = GUID(0xb7a87232, 0x4a51, 0x11d1, [0xa7, 0xea, 0x0, 0xc0, 0x4f, 0xd9, 0x9, 0xdd]);
interface IExtendPropertySheet2 : IExtendPropertySheet
{
    HRESULT GetWatermarks(IDataObject, HBITMAP*, HBITMAP*, HPALETTE*, BOOL*);
}
enum IID_IHeaderCtrl2 = GUID(0x9757abb8, 0x1b32, 0x11d1, [0xa7, 0xce, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IHeaderCtrl2 : IHeaderCtrl
{
    HRESULT SetChangeTimeOut(uint);
    HRESULT SetColumnFilter(uint, uint, MMC_FILTERDATA*);
    HRESULT GetColumnFilter(uint, uint*, MMC_FILTERDATA*);
}
enum IID_ISnapinHelp2 = GUID(0x4861a010, 0x20f9, 0x11d2, [0xa5, 0x10, 0x0, 0xc0, 0x4f, 0xb6, 0xdd, 0x2c]);
interface ISnapinHelp2 : ISnapinHelp
{
    HRESULT GetLinkedTopics(PWSTR*);
}
alias MMC_TASK_DISPLAY_TYPE = int;
enum : int
{
    MMC_TASK_DISPLAY_UNINITIALIZED      = 0x00000000,
    MMC_TASK_DISPLAY_TYPE_SYMBOL        = 0x00000001,
    MMC_TASK_DISPLAY_TYPE_VANILLA_GIF   = 0x00000002,
    MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF = 0x00000003,
    MMC_TASK_DISPLAY_TYPE_BITMAP        = 0x00000004,
}

struct MMC_TASK_DISPLAY_SYMBOL
{
    PWSTR szFontFamilyName;
    PWSTR szURLtoEOT;
    PWSTR szSymbolString;
}
struct MMC_TASK_DISPLAY_BITMAP
{
    PWSTR szMouseOverBitmap;
    PWSTR szMouseOffBitmap;
}
struct MMC_TASK_DISPLAY_OBJECT
{
    MMC_TASK_DISPLAY_TYPE eDisplayType;
    union
    {
        MMC_TASK_DISPLAY_BITMAP uBitmap;
        MMC_TASK_DISPLAY_SYMBOL uSymbol;
    }
}
alias MMC_ACTION_TYPE = int;
enum : int
{
    MMC_ACTION_UNINITIALIZED = 0xffffffff,
    MMC_ACTION_ID            = 0x00000000,
    MMC_ACTION_LINK          = 0x00000001,
    MMC_ACTION_SCRIPT        = 0x00000002,
}

struct MMC_TASK
{
    MMC_TASK_DISPLAY_OBJECT sDisplayObject;
    PWSTR szText;
    PWSTR szHelpString;
    MMC_ACTION_TYPE eActionType;
    union
    {
        long nCommandID;
        PWSTR szActionURL;
        PWSTR szScript;
    }
}
struct MMC_LISTPAD_INFO
{
    PWSTR szTitle;
    PWSTR szButtonText;
    long nCommandID;
}
enum IID_IEnumTASK = GUID(0x338698b1, 0x5a02, 0x11d1, [0x9f, 0xec, 0x0, 0x60, 0x8, 0x32, 0xdb, 0x4a]);
interface IEnumTASK : IUnknown
{
    HRESULT Next(uint, MMC_TASK*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumTASK*);
}
enum IID_IExtendTaskPad = GUID(0x8dee6511, 0x554d, 0x11d1, [0x9f, 0xea, 0x0, 0x60, 0x8, 0x32, 0xdb, 0x4a]);
interface IExtendTaskPad : IUnknown
{
    HRESULT TaskNotify(IDataObject, VARIANT*, VARIANT*);
    HRESULT EnumTasks(IDataObject, PWSTR, IEnumTASK*);
    HRESULT GetTitle(PWSTR, PWSTR*);
    HRESULT GetDescriptiveText(PWSTR, PWSTR*);
    HRESULT GetBackground(PWSTR, MMC_TASK_DISPLAY_OBJECT*);
    HRESULT GetListPadInfo(PWSTR, MMC_LISTPAD_INFO*);
}
enum IID_IConsole2 = GUID(0x103d842a, 0xaa63, 0x11d1, [0xa7, 0xe1, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IConsole2 : IConsole
{
    HRESULT Expand(long, BOOL);
    HRESULT IsTaskpadViewPreferred();
    HRESULT SetStatusText(PWSTR);
}
enum IID_IDisplayHelp = GUID(0xcc593830, 0xb926, 0x11d1, [0x80, 0x63, 0x0, 0x0, 0xf8, 0x75, 0xa9, 0xce]);
interface IDisplayHelp : IUnknown
{
    HRESULT ShowTopic(PWSTR);
}
enum IID_IRequiredExtensions = GUID(0x72782d7a, 0xa4a0, 0x11d1, [0xaf, 0xf, 0x0, 0xc0, 0x4f, 0xb6, 0xdd, 0x2c]);
interface IRequiredExtensions : IUnknown
{
    HRESULT EnableAllExtensions();
    HRESULT GetFirstExtension(GUID*);
    HRESULT GetNextExtension(GUID*);
}
enum IID_IStringTable = GUID(0xde40b7a4, 0xf65, 0x11d2, [0x8e, 0x25, 0x0, 0xc0, 0x4f, 0x8e, 0xcd, 0x78]);
interface IStringTable : IUnknown
{
    HRESULT AddString(const(wchar)*, uint*);
    HRESULT GetString(uint, uint, PWSTR, uint*);
    HRESULT GetStringLength(uint, uint*);
    HRESULT DeleteString(uint);
    HRESULT DeleteAllStrings();
    HRESULT FindString(const(wchar)*, uint*);
    HRESULT Enumerate(IEnumString*);
}
struct MMC_COLUMN_DATA
{
    int nColIndex;
    uint dwFlags;
    int nWidth;
    ulong ulReserved;
}
struct MMC_COLUMN_SET_DATA
{
    int cbSize;
    int nNumCols;
    MMC_COLUMN_DATA* pColData;
}
struct MMC_SORT_DATA
{
    int nColIndex;
    uint dwSortOptions;
    ulong ulReserved;
}
struct MMC_SORT_SET_DATA
{
    int cbSize;
    int nNumItems;
    MMC_SORT_DATA* pSortData;
}
enum IID_IColumnData = GUID(0x547c1354, 0x24d, 0x11d3, [0xa7, 0x7, 0x0, 0xc0, 0x4f, 0x8e, 0xf4, 0xcb]);
interface IColumnData : IUnknown
{
    HRESULT SetColumnConfigData(SColumnSetID*, MMC_COLUMN_SET_DATA*);
    HRESULT GetColumnConfigData(SColumnSetID*, MMC_COLUMN_SET_DATA**);
    HRESULT SetColumnSortData(SColumnSetID*, MMC_SORT_SET_DATA*);
    HRESULT GetColumnSortData(SColumnSetID*, MMC_SORT_SET_DATA**);
}
alias IconIdentifier = int;
enum : int
{
    Icon_None        = 0x00000000,
    Icon_Error       = 0x00007f01,
    Icon_Question    = 0x00007f02,
    Icon_Warning     = 0x00007f03,
    Icon_Information = 0x00007f04,
    Icon_First       = 0x00007f01,
    Icon_Last        = 0x00007f04,
}

enum IID_IMessageView = GUID(0x80f94174, 0xfccc, 0x11d2, [0xb9, 0x91, 0x0, 0xc0, 0x4f, 0x8e, 0xcd, 0x78]);
interface IMessageView : IUnknown
{
    HRESULT SetTitleText(const(wchar)*);
    HRESULT SetBodyText(const(wchar)*);
    HRESULT SetIcon(IconIdentifier);
    HRESULT Clear();
}
struct RDITEMHDR
{
    uint dwFlags;
    long cookie;
    LPARAM lpReserved;
}
struct RDCOMPARE
{
    uint cbSize;
    uint dwFlags;
    int nColumn;
    LPARAM lUserParam;
    RDITEMHDR* prdch1;
    RDITEMHDR* prdch2;
}
enum IID_IResultDataCompareEx = GUID(0x96933476, 0x251, 0x11d3, [0xae, 0xb0, 0x0, 0xc0, 0x4f, 0x8e, 0xcd, 0x78]);
interface IResultDataCompareEx : IUnknown
{
    HRESULT Compare(RDCOMPARE*, int*);
}
alias MMC_VIEW_TYPE = int;
enum : int
{
    MMC_VIEW_TYPE_LIST = 0x00000000,
    MMC_VIEW_TYPE_HTML = 0x00000001,
    MMC_VIEW_TYPE_OCX  = 0x00000002,
}

struct RESULT_VIEW_TYPE_INFO
{
    PWSTR pstrPersistableViewDescription;
    MMC_VIEW_TYPE eViewType;
    uint dwMiscOptions;
    union
    {
        uint dwListOptions;
        struct
        {
            uint dwHTMLOptions;
            PWSTR pstrURL;
        }
        struct
        {
            uint dwOCXOptions;
            IUnknown pUnkControl;
        }
    }
}
struct CONTEXTMENUITEM2
{
    PWSTR strName;
    PWSTR strStatusBarText;
    int lCommandID;
    int lInsertionPointID;
    int fFlags;
    int fSpecialFlags;
    PWSTR strLanguageIndependentName;
}
struct MMC_EXT_VIEW_DATA
{
    GUID viewID;
    const(wchar)* pszURL;
    const(wchar)* pszViewTitle;
    const(wchar)* pszTooltipText;
    BOOL bReplacesDefaultView;
}
enum IID_IComponentData2 = GUID(0xcca0f2d2, 0x82de, 0x41b5, [0xbf, 0x47, 0x3b, 0x20, 0x76, 0x27, 0x3d, 0x5c]);
interface IComponentData2 : IComponentData
{
    HRESULT QueryDispatch(long, DATA_OBJECT_TYPES, IDispatch*);
}
enum IID_IComponent2 = GUID(0x79a2d615, 0x4a10, 0x4ed4, [0x8c, 0x65, 0x86, 0x33, 0xf9, 0x33, 0x50, 0x95]);
interface IComponent2 : IComponent
{
    HRESULT QueryDispatch(long, DATA_OBJECT_TYPES, IDispatch*);
    HRESULT GetResultViewType2(long, RESULT_VIEW_TYPE_INFO*);
    HRESULT RestoreResultView(long, RESULT_VIEW_TYPE_INFO*);
}
enum IID_IContextMenuCallback2 = GUID(0xe178bc0e, 0x2ed0, 0x4b5e, [0x80, 0x97, 0x42, 0xc9, 0x8, 0x7e, 0x8b, 0x33]);
interface IContextMenuCallback2 : IUnknown
{
    HRESULT AddItem(CONTEXTMENUITEM2*);
}
enum IID_IMMCVersionInfo = GUID(0xa8d2c5fe, 0xcdcb, 0x4b9d, [0xbd, 0xe5, 0xa2, 0x73, 0x43, 0xff, 0x54, 0xbc]);
interface IMMCVersionInfo : IUnknown
{
    HRESULT GetMMCVersion(int*, int*);
}
enum IID_IExtendView = GUID(0x89995cee, 0xd2ed, 0x4c0e, [0xae, 0x5e, 0xdf, 0x7e, 0x76, 0xf3, 0xfa, 0x53]);
interface IExtendView : IUnknown
{
    HRESULT GetViews(IDataObject, IViewExtensionCallback);
}
enum IID_IViewExtensionCallback = GUID(0x34dd928a, 0x7599, 0x41e5, [0x9f, 0x5e, 0xd6, 0xbc, 0x30, 0x62, 0xc2, 0xda]);
interface IViewExtensionCallback : IUnknown
{
    HRESULT AddView(MMC_EXT_VIEW_DATA*);
}
enum IID_IConsolePower = GUID(0x1cfbdd0e, 0x62ca, 0x49ce, [0xa3, 0xaf, 0xdb, 0xb2, 0xde, 0x61, 0xb0, 0x68]);
interface IConsolePower : IUnknown
{
    HRESULT SetExecutionState(uint, uint);
    HRESULT ResetIdleTimer(uint);
}
enum IID_IConsolePowerSink = GUID(0x3333759f, 0xfe4f, 0x4975, [0xb1, 0x43, 0xfe, 0xc0, 0xa5, 0xdd, 0x6d, 0x65]);
interface IConsolePowerSink : IUnknown
{
    HRESULT OnPowerBroadcast(uint, LPARAM, LRESULT*);
}
enum IID_INodeProperties = GUID(0x15bc4d24, 0xa522, 0x4406, [0xaa, 0x55, 0x7, 0x49, 0x53, 0x7a, 0x68, 0x65]);
interface INodeProperties : IUnknown
{
    HRESULT GetProperty(IDataObject, BSTR, ushort**);
}
enum IID_IConsole3 = GUID(0x4f85efdb, 0xd0e1, 0x498c, [0x8d, 0x4a, 0xd0, 0x10, 0xdf, 0xdd, 0x40, 0x4f]);
interface IConsole3 : IConsole2
{
    HRESULT RenameScopeItem(long);
}
enum IID_IResultData2 = GUID(0xf36e0eb, 0xa7f1, 0x4a81, [0xbe, 0x5a, 0x92, 0x47, 0xf7, 0xde, 0x4b, 0x1b]);
interface IResultData2 : IResultData
{
    HRESULT RenameResultItem(long);
}
