module windows.win32.graphics.printing_;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMDocument2;
import windows.win32.devices.display : FD_KERNINGPAIR;
import windows.win32.foundation : BOOL, BSTR, CHAR, FARPROC, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, LPARAM, LRESULT, POINTL, PSTR, PWSTR, RECT, RECTL, SIZE, SYSTEMTIME, WPARAM;
import windows.win32.graphics.dxgi_ : IDXGISurface;
import windows.win32.graphics.gdi : DEVMODEA, DEVMODEW, HDC, PANOSE;
import windows.win32.graphics.imaging_ : IWICBitmap;
import windows.win32.security_ : PSECURITY_DESCRIPTOR;
import windows.win32.storage.xps_ : DOCINFOW, IXpsOMPage;
import windows.win32.system.com_ : IDispatch, IEnumUnknown, IErrorInfo, IStream, IUnknown, STREAM_SEEK, VARIANT;
import windows.win32.system.ole : ICreateErrorInfo;
import windows.win32.system.registry : HKEY;
import windows.win32.ui.windowsandmessaging : DLGPROC, HICON;

version (Windows):
extern (Windows):

alias PRINTER_ACCESS_RIGHTS = uint;
enum : uint
{
    PRINTER_ALL_ACCESS               = 0x000f000c,
    PRINTER_READ                     = 0x00020008,
    PRINTER_WRITE                    = 0x00020008,
    PRINTER_EXECUTE                  = 0x00020008,
    SERVER_ALL_ACCESS                = 0x000f0003,
    SERVER_READ                      = 0x00020002,
    SERVER_WRITE                     = 0x00020003,
    SERVER_EXECUTE                   = 0x00020002,
    PRINTER_DELETE                   = 0x00010000,
    PRINTER_READ_CONTROL             = 0x00020000,
    PRINTER_WRITE_DAC                = 0x00040000,
    PRINTER_WRITE_OWNER              = 0x00080000,
    PRINTER_SYNCHRONIZE              = 0x00100000,
    PRINTER_STANDARD_RIGHTS_REQUIRED = 0x000f0000,
    PRINTER_STANDARD_RIGHTS_READ     = 0x00020000,
    PRINTER_STANDARD_RIGHTS_WRITE    = 0x00020000,
    PRINTER_STANDARD_RIGHTS_EXECUTE  = 0x00020000,
    SERVER_ACCESS_ADMINISTER         = 0x00000001,
    SERVER_ACCESS_ENUMERATE          = 0x00000002,
    PRINTER_ACCESS_ADMINISTER        = 0x00000004,
    PRINTER_ACCESS_USE               = 0x00000008,
    PRINTER_ACCESS_MANAGE_LIMITED    = 0x00000040,
}

int CommonPropertySheetUIA(HWND, PFNPROPSHEETUI, LPARAM, uint*);
int CommonPropertySheetUIW(HWND, PFNPROPSHEETUI, LPARAM, uint*);
ulong GetCPSUIUserData(HWND);
BOOL SetCPSUIUserData(HWND, ulong);
BOOL EnumPrintersA(uint, PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumPrintersW(uint, PWSTR, uint, ubyte*, uint, uint*, uint*);
HANDLE GetSpoolFileHandle(HANDLE);
HANDLE CommitSpoolData(HANDLE, HANDLE, uint);
BOOL CloseSpoolFileHandle(HANDLE, HANDLE);
BOOL OpenPrinterA(PSTR, HANDLE*, PRINTER_DEFAULTSA*);
BOOL OpenPrinterW(PWSTR, HANDLE*, PRINTER_DEFAULTSW*);
BOOL ResetPrinterA(HANDLE, PRINTER_DEFAULTSA*);
BOOL ResetPrinterW(HANDLE, PRINTER_DEFAULTSW*);
BOOL SetJobA(HANDLE, uint, uint, ubyte*, uint);
BOOL SetJobW(HANDLE, uint, uint, ubyte*, uint);
BOOL GetJobA(HANDLE, uint, uint, ubyte*, uint, uint*);
BOOL GetJobW(HANDLE, uint, uint, ubyte*, uint, uint*);
BOOL EnumJobsA(HANDLE, uint, uint, uint, ubyte*, uint, uint*, uint*);
BOOL EnumJobsW(HANDLE, uint, uint, uint, ubyte*, uint, uint*, uint*);
HANDLE AddPrinterA(PSTR, uint, ubyte*);
HANDLE AddPrinterW(PWSTR, uint, ubyte*);
BOOL DeletePrinter(HANDLE);
BOOL SetPrinterA(HANDLE, uint, ubyte*, uint);
BOOL SetPrinterW(HANDLE, uint, ubyte*, uint);
BOOL GetPrinterA(HANDLE, uint, ubyte*, uint, uint*);
BOOL GetPrinterW(HANDLE, uint, ubyte*, uint, uint*);
BOOL AddPrinterDriverA(PSTR, uint, ubyte*);
BOOL AddPrinterDriverW(PWSTR, uint, ubyte*);
BOOL AddPrinterDriverExA(PSTR, uint, ubyte*, uint);
BOOL AddPrinterDriverExW(PWSTR, uint, ubyte*, uint);
BOOL EnumPrinterDriversA(PSTR, PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumPrinterDriversW(PWSTR, PWSTR, uint, ubyte*, uint, uint*, uint*);
BOOL GetPrinterDriverA(HANDLE, PSTR, uint, ubyte*, uint, uint*);
BOOL GetPrinterDriverW(HANDLE, PWSTR, uint, ubyte*, uint, uint*);
BOOL GetPrinterDriverDirectoryA(PSTR, PSTR, uint, ubyte*, uint, uint*);
BOOL GetPrinterDriverDirectoryW(PWSTR, PWSTR, uint, ubyte*, uint, uint*);
BOOL DeletePrinterDriverA(PSTR, PSTR, PSTR);
BOOL DeletePrinterDriverW(PWSTR, PWSTR, PWSTR);
BOOL DeletePrinterDriverExA(PSTR, PSTR, PSTR, uint, uint);
BOOL DeletePrinterDriverExW(PWSTR, PWSTR, PWSTR, uint, uint);
BOOL AddPrintProcessorA(PSTR, PSTR, PSTR, PSTR);
BOOL AddPrintProcessorW(PWSTR, PWSTR, PWSTR, PWSTR);
BOOL EnumPrintProcessorsA(PSTR, PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumPrintProcessorsW(PWSTR, PWSTR, uint, ubyte*, uint, uint*, uint*);
BOOL GetPrintProcessorDirectoryA(PSTR, PSTR, uint, ubyte*, uint, uint*);
BOOL GetPrintProcessorDirectoryW(PWSTR, PWSTR, uint, ubyte*, uint, uint*);
BOOL EnumPrintProcessorDatatypesA(PSTR, PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumPrintProcessorDatatypesW(PWSTR, PWSTR, uint, ubyte*, uint, uint*, uint*);
BOOL DeletePrintProcessorA(PSTR, PSTR, PSTR);
BOOL DeletePrintProcessorW(PWSTR, PWSTR, PWSTR);
uint StartDocPrinterA(HANDLE, uint, DOC_INFO_1A*);
uint StartDocPrinterW(HANDLE, uint, DOC_INFO_1W*);
BOOL StartPagePrinter(HANDLE);
BOOL WritePrinter(HANDLE, void*, uint, uint*);
BOOL FlushPrinter(HANDLE, void*, uint, uint*, uint);
BOOL EndPagePrinter(HANDLE);
BOOL AbortPrinter(HANDLE);
BOOL ReadPrinter(HANDLE, void*, uint, uint*);
BOOL EndDocPrinter(HANDLE);
BOOL AddJobA(HANDLE, uint, ubyte*, uint, uint*);
BOOL AddJobW(HANDLE, uint, ubyte*, uint, uint*);
BOOL ScheduleJob(HANDLE, uint);
BOOL PrinterProperties(HWND, HANDLE);
int DocumentPropertiesA(HWND, HANDLE, PSTR, DEVMODEA*, DEVMODEA*, uint);
int DocumentPropertiesW(HWND, HANDLE, PWSTR, DEVMODEW*, DEVMODEW*, uint);
int AdvancedDocumentPropertiesA(HWND, HANDLE, PSTR, DEVMODEA*, DEVMODEA*);
int AdvancedDocumentPropertiesW(HWND, HANDLE, PWSTR, DEVMODEW*, DEVMODEW*);
int ExtDeviceMode(HWND, HANDLE, DEVMODEA*, PSTR, PSTR, DEVMODEA*, PSTR, uint);
uint GetPrinterDataA(HANDLE, PSTR, uint*, ubyte*, uint, uint*);
uint GetPrinterDataW(HANDLE, PWSTR, uint*, ubyte*, uint, uint*);
uint GetPrinterDataExA(HANDLE, const(char)*, const(char)*, uint*, ubyte*, uint, uint*);
uint GetPrinterDataExW(HANDLE, const(wchar)*, const(wchar)*, uint*, ubyte*, uint, uint*);
uint EnumPrinterDataA(HANDLE, uint, PSTR, uint, uint*, uint*, ubyte*, uint, uint*);
uint EnumPrinterDataW(HANDLE, uint, PWSTR, uint, uint*, uint*, ubyte*, uint, uint*);
uint EnumPrinterDataExA(HANDLE, const(char)*, ubyte*, uint, uint*, uint*);
uint EnumPrinterDataExW(HANDLE, const(wchar)*, ubyte*, uint, uint*, uint*);
uint EnumPrinterKeyA(HANDLE, const(char)*, PSTR, uint, uint*);
uint EnumPrinterKeyW(HANDLE, const(wchar)*, PWSTR, uint, uint*);
uint SetPrinterDataA(HANDLE, PSTR, uint, ubyte*, uint);
uint SetPrinterDataW(HANDLE, PWSTR, uint, ubyte*, uint);
uint SetPrinterDataExA(HANDLE, const(char)*, const(char)*, uint, ubyte*, uint);
uint SetPrinterDataExW(HANDLE, const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint DeletePrinterDataA(HANDLE, PSTR);
uint DeletePrinterDataW(HANDLE, PWSTR);
uint DeletePrinterDataExA(HANDLE, const(char)*, const(char)*);
uint DeletePrinterDataExW(HANDLE, const(wchar)*, const(wchar)*);
uint DeletePrinterKeyA(HANDLE, const(char)*);
uint DeletePrinterKeyW(HANDLE, const(wchar)*);
uint WaitForPrinterChange(HANDLE, uint);
HANDLE FindFirstPrinterChangeNotification(HANDLE, uint, uint, void*);
BOOL FindNextPrinterChangeNotification(HANDLE, uint*, void*, void**);
BOOL FreePrinterNotifyInfo(PRINTER_NOTIFY_INFO*);
BOOL FindClosePrinterChangeNotification(HANDLE);
uint PrinterMessageBoxA(HANDLE, uint, HWND, PSTR, PSTR, uint);
uint PrinterMessageBoxW(HANDLE, uint, HWND, PWSTR, PWSTR, uint);
BOOL ClosePrinter(HANDLE);
BOOL AddFormA(HANDLE, uint, ubyte*);
BOOL AddFormW(HANDLE, uint, ubyte*);
BOOL DeleteFormA(HANDLE, PSTR);
BOOL DeleteFormW(HANDLE, PWSTR);
BOOL GetFormA(HANDLE, PSTR, uint, ubyte*, uint, uint*);
BOOL GetFormW(HANDLE, PWSTR, uint, ubyte*, uint, uint*);
BOOL SetFormA(HANDLE, PSTR, uint, ubyte*);
BOOL SetFormW(HANDLE, PWSTR, uint, ubyte*);
BOOL EnumFormsA(HANDLE, uint, ubyte*, uint, uint*, uint*);
BOOL EnumFormsW(HANDLE, uint, ubyte*, uint, uint*, uint*);
BOOL EnumMonitorsA(PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumMonitorsW(PWSTR, uint, ubyte*, uint, uint*, uint*);
BOOL AddMonitorA(PSTR, uint, ubyte*);
BOOL AddMonitorW(PWSTR, uint, ubyte*);
BOOL DeleteMonitorA(PSTR, PSTR, PSTR);
BOOL DeleteMonitorW(PWSTR, PWSTR, PWSTR);
BOOL EnumPortsA(PSTR, uint, ubyte*, uint, uint*, uint*);
BOOL EnumPortsW(PWSTR, uint, ubyte*, uint, uint*, uint*);
BOOL AddPortA(PSTR, HWND, PSTR);
BOOL AddPortW(PWSTR, HWND, PWSTR);
BOOL ConfigurePortA(PSTR, HWND, PSTR);
BOOL ConfigurePortW(PWSTR, HWND, PWSTR);
BOOL DeletePortA(PSTR, HWND, PSTR);
BOOL DeletePortW(PWSTR, HWND, PWSTR);
BOOL XcvDataW(HANDLE, const(wchar)*, ubyte*, uint, ubyte*, uint, uint*, uint*);
BOOL GetDefaultPrinterA(PSTR, uint*);
BOOL GetDefaultPrinterW(PWSTR, uint*);
BOOL SetDefaultPrinterA(const(char)*);
BOOL SetDefaultPrinterW(const(wchar)*);
BOOL SetPortA(PSTR, PSTR, uint, ubyte*);
BOOL SetPortW(PWSTR, PWSTR, uint, ubyte*);
BOOL AddPrinterConnectionA(PSTR);
BOOL AddPrinterConnectionW(PWSTR);
BOOL DeletePrinterConnectionA(PSTR);
BOOL DeletePrinterConnectionW(PWSTR);
HANDLE ConnectToPrinterDlg(HWND, uint);
BOOL AddPrintProvidorA(PSTR, uint, ubyte*);
BOOL AddPrintProvidorW(PWSTR, uint, ubyte*);
BOOL DeletePrintProvidorA(PSTR, PSTR, PSTR);
BOOL DeletePrintProvidorW(PWSTR, PWSTR, PWSTR);
BOOL IsValidDevmodeA(DEVMODEA*, ulong);
BOOL IsValidDevmodeW(DEVMODEW*, ulong);
BOOL OpenPrinter2A(const(char)*, HANDLE*, PRINTER_DEFAULTSA*, PRINTER_OPTIONSA*);
BOOL OpenPrinter2W(const(wchar)*, HANDLE*, PRINTER_DEFAULTSW*, PRINTER_OPTIONSW*);
BOOL AddPrinterConnection2A(HWND, const(char)*, uint, void*);
BOOL AddPrinterConnection2W(HWND, const(wchar)*, uint, void*);
HRESULT InstallPrinterDriverFromPackageA(const(char)*, const(char)*, const(char)*, const(char)*, uint);
HRESULT InstallPrinterDriverFromPackageW(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
HRESULT UploadPrinterDriverPackageA(const(char)*, const(char)*, const(char)*, uint, HWND, PSTR, uint*);
HRESULT UploadPrinterDriverPackageW(const(wchar)*, const(wchar)*, const(wchar)*, uint, HWND, PWSTR, uint*);
HRESULT GetCorePrinterDriversA(const(char)*, const(char)*, const(char)*, uint, CORE_PRINTER_DRIVERA*);
HRESULT GetCorePrinterDriversW(const(wchar)*, const(wchar)*, const(wchar)*, uint, CORE_PRINTER_DRIVERW*);
HRESULT CorePrinterDriverInstalledA(const(char)*, const(char)*, GUID, FILETIME, ulong, BOOL*);
HRESULT CorePrinterDriverInstalledW(const(wchar)*, const(wchar)*, GUID, FILETIME, ulong, BOOL*);
HRESULT GetPrinterDriverPackagePathA(const(char)*, const(char)*, const(char)*, const(char)*, PSTR, uint, uint*);
HRESULT GetPrinterDriverPackagePathW(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint, uint*);
HRESULT DeletePrinterDriverPackageA(const(char)*, const(char)*, const(char)*);
HRESULT DeletePrinterDriverPackageW(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT ReportJobProcessingProgress(HANDLE, uint, EPrintXPSJobOperation, EPrintXPSJobProgress);
BOOL GetPrinterDriver2A(HWND, HANDLE, PSTR, uint, ubyte*, uint, uint*);
BOOL GetPrinterDriver2W(HWND, HANDLE, PWSTR, uint, ubyte*, uint, uint*);
BOOL GetPrintExecutionData(PRINT_EXECUTION_DATA*);
uint GetJobNamedPropertyValue(HANDLE, uint, const(wchar)*, PrintPropertyValue*);
void FreePrintPropertyValue(PrintPropertyValue*);
void FreePrintNamedPropertyArray(uint, PrintNamedProperty**);
uint SetJobNamedProperty(HANDLE, uint, const(PrintNamedProperty)*);
uint DeleteJobNamedProperty(HANDLE, uint, const(wchar)*);
uint EnumJobNamedProperties(HANDLE, uint, uint*, PrintNamedProperty**);
HRESULT GetPrintOutputInfo(HWND, const(wchar)*, HANDLE*, PWSTR*);
BOOL DevQueryPrintEx(DEVQUERYPRINT_INFO*);
HRESULT RegisterForPrintAsyncNotifications(const(wchar)*, GUID*, PrintAsyncNotifyUserFilter, PrintAsyncNotifyConversationStyle, IPrintAsyncNotifyCallback, HANDLE*);
HRESULT UnRegisterForPrintAsyncNotifications(HANDLE);
HRESULT CreatePrintAsyncNotifyChannel(const(wchar)*, GUID*, PrintAsyncNotifyUserFilter, PrintAsyncNotifyConversationStyle, IPrintAsyncNotifyCallback, IPrintAsyncNotifyChannel*);
HANDLE GdiGetSpoolFileHandle(PWSTR, DEVMODEW*, PWSTR);
BOOL GdiDeleteSpoolFileHandle(HANDLE);
uint GdiGetPageCount(HANDLE);
HDC GdiGetDC(HANDLE);
HANDLE GdiGetPageHandle(HANDLE, uint, uint*);
BOOL GdiStartDocEMF(HANDLE, DOCINFOW*);
BOOL GdiStartPageEMF(HANDLE);
BOOL GdiPlayPageEMF(HANDLE, HANDLE, RECT*, RECT*, RECT*);
BOOL GdiEndPageEMF(HANDLE, uint);
BOOL GdiEndDocEMF(HANDLE);
BOOL GdiGetDevmodeForPage(HANDLE, uint, DEVMODEW**, DEVMODEW**);
BOOL GdiResetDCEMF(HANDLE, DEVMODEW*);
BOOL GetJobAttributes(PWSTR, DEVMODEW*, ATTRIBUTE_INFO_3*);
BOOL GetJobAttributesEx(PWSTR, DEVMODEW*, uint, ubyte*, uint, uint);
HANDLE CreatePrinterIC(HANDLE, DEVMODEW*);
BOOL PlayGdiScriptOnPrinterIC(HANDLE, ubyte*, uint, ubyte*, uint, uint);
BOOL DeletePrinterIC(HANDLE);
BOOL DevQueryPrint(HANDLE, DEVMODEA*, uint*);
HANDLE RevertToPrinterSelf();
BOOL ImpersonatePrinterClient(HANDLE);
BOOL ReplyPrinterChangeNotification(HANDLE, uint, uint*, void*);
BOOL ReplyPrinterChangeNotificationEx(HANDLE, uint, uint, uint*, void*);
BOOL PartialReplyPrinterChangeNotification(HANDLE, PRINTER_NOTIFY_INFO_DATA*);
PRINTER_NOTIFY_INFO* RouterAllocPrinterNotifyInfo(uint);
BOOL RouterFreePrinterNotifyInfo(PRINTER_NOTIFY_INFO*);
BIDI_RESPONSE_CONTAINER* RouterAllocBidiResponseContainer(uint);
void* RouterAllocBidiMem(ulong);
uint RouterFreeBidiResponseContainer(BIDI_RESPONSE_CONTAINER*);
void RouterFreeBidiMem(void*);
BOOL AppendPrinterNotifyInfoData(PRINTER_NOTIFY_INFO*, PRINTER_NOTIFY_INFO_DATA*, uint);
uint CallRouterFindFirstPrinterChangeNotification(HANDLE, uint, uint, HANDLE, PRINTER_NOTIFY_OPTIONS*);
BOOL ProvidorFindFirstPrinterChangeNotification(HANDLE, uint, uint, HANDLE, void*, void*);
BOOL ProvidorFindClosePrinterChangeNotification(HANDLE);
BOOL SpoolerFindFirstPrinterChangeNotification(HANDLE, uint, uint, void*, void*, void*, HANDLE*, HANDLE*);
BOOL SpoolerFindNextPrinterChangeNotification(HANDLE, uint*, void*, void**);
BOOL SpoolerRefreshPrinterChangeNotification(HANDLE, uint, PRINTER_NOTIFY_OPTIONS*, PRINTER_NOTIFY_INFO**);
void SpoolerFreePrinterNotifyInfo(PRINTER_NOTIFY_INFO*);
BOOL SpoolerFindClosePrinterChangeNotification(HANDLE);
BOOL SpoolerCopyFileEvent(PWSTR, PWSTR, uint);
uint GenerateCopyFilePaths(const(wchar)*, const(wchar)*, ubyte*, uint, PWSTR, uint*, PWSTR, uint*, uint);
BOOL SplPromptUIInUsersSession(HANDLE, uint, SHOWUIPARAMS*, uint*);
uint SplIsSessionZero(HANDLE, uint, BOOL*);
HRESULT AddPrintDeviceObject(HANDLE, HANDLE*);
HRESULT UpdatePrintDeviceObject(HANDLE, HANDLE);
HRESULT RemovePrintDeviceObject(HANDLE);
enum USB_PRINTER_INTERFACE_CLASSIC = 0x00000001;
enum USB_PRINTER_INTERFACE_IPP = 0x00000002;
enum USB_PRINTER_INTERFACE_DUAL = 0x00000003;
enum USBPRINT_IOCTL_INDEX = 0x00000000;
enum IOCTL_USBPRINT_GET_LPT_STATUS = 0x00220030;
enum IOCTL_USBPRINT_GET_1284_ID = 0x00220034;
enum IOCTL_USBPRINT_VENDOR_SET_COMMAND = 0x00220038;
enum IOCTL_USBPRINT_VENDOR_GET_COMMAND = 0x0022003c;
enum IOCTL_USBPRINT_SOFT_RESET = 0x00220040;
enum IOCTL_USBPRINT_GET_PROTOCOL = 0x00220044;
enum IOCTL_USBPRINT_SET_PROTOCOL = 0x00220048;
enum IOCTL_USBPRINT_GET_INTERFACE_TYPE = 0x0022004c;
enum IOCTL_USBPRINT_SET_PORT_NUMBER = 0x00220050;
enum IOCTL_USBPRINT_ADD_MSIPP_COMPAT_ID = 0x00220054;
enum IOCTL_USBPRINT_SET_DEVICE_ID = 0x00220058;
enum IOCTL_USBPRINT_ADD_CHILD_DEVICE = 0x0022005c;
enum IOCTL_USBPRINT_CYCLE_PORT = 0x00220060;
enum TVOT_2STATES = 0x00000000;
enum TVOT_3STATES = 0x00000001;
enum TVOT_UDARROW = 0x00000002;
enum TVOT_TRACKBAR = 0x00000003;
enum TVOT_SCROLLBAR = 0x00000004;
enum TVOT_LISTBOX = 0x00000005;
enum TVOT_COMBOBOX = 0x00000006;
enum TVOT_EDITBOX = 0x00000007;
enum TVOT_PUSHBUTTON = 0x00000008;
enum TVOT_CHKBOX = 0x00000009;
enum TVOT_NSTATES_EX = 0x0000000a;
enum CHKBOXS_FALSE_TRUE = 0x00000000;
enum CHKBOXS_NO_YES = 0x00000001;
enum CHKBOXS_OFF_ON = 0x00000002;
enum CHKBOXS_FALSE_PDATA = 0x00000003;
enum CHKBOXS_NO_PDATA = 0x00000004;
enum CHKBOXS_OFF_PDATA = 0x00000005;
enum CHKBOXS_NONE_PDATA = 0x00000006;
enum PUSHBUTTON_TYPE_DLGPROC = 0x00000000;
enum PUSHBUTTON_TYPE_CALLBACK = 0x00000001;
enum PUSHBUTTON_TYPE_HTCLRADJ = 0x00000002;
enum PUSHBUTTON_TYPE_HTSETUP = 0x00000003;
enum MAX_RES_STR_CHARS = 0x000000a0;
enum OPTPF_HIDE = 0x00000001;
enum OPTPF_DISABLED = 0x00000002;
enum OPTPF_ICONID_AS_HICON = 0x00000004;
enum OPTPF_OVERLAY_WARNING_ICON = 0x00000008;
enum OPTPF_OVERLAY_STOP_ICON = 0x00000010;
enum OPTPF_OVERLAY_NO_ICON = 0x00000020;
enum OPTPF_USE_HDLGTEMPLATE = 0x00000040;
enum OPTPF_MASK = 0x0000007f;
enum OPTCF_HIDE = 0x00000001;
enum OPTCF_MASK = 0x00000001;
enum OPTTF_TYPE_DISABLED = 0x00000001;
enum OPTTF_NOSPACE_BEFORE_POSTFIX = 0x00000002;
enum OPTTF_MASK = 0x00000003;
enum OTS_LBCB_SORT = 0x00000001;
enum OTS_LBCB_PROPPAGE_LBUSECB = 0x00000002;
enum OTS_LBCB_PROPPAGE_CBUSELB = 0x00000004;
enum OTS_LBCB_INCL_ITEM_NONE = 0x00000008;
enum OTS_LBCB_NO_ICON16_IN_ITEM = 0x00000010;
enum OTS_PUSH_INCL_SETUP_TITLE = 0x00000020;
enum OTS_PUSH_NO_DOT_DOT_DOT = 0x00000040;
enum OTS_PUSH_ENABLE_ALWAYS = 0x00000080;
enum OTS_MASK = 0x000000ff;
enum EPF_PUSH_TYPE_DLGPROC = 0x00000001;
enum EPF_INCL_SETUP_TITLE = 0x00000002;
enum EPF_NO_DOT_DOT_DOT = 0x00000004;
enum EPF_ICONID_AS_HICON = 0x00000008;
enum EPF_OVERLAY_WARNING_ICON = 0x00000010;
enum EPF_OVERLAY_STOP_ICON = 0x00000020;
enum EPF_OVERLAY_NO_ICON = 0x00000040;
enum EPF_USE_HDLGTEMPLATE = 0x00000080;
enum EPF_MASK = 0x000000ff;
enum ECBF_CHECKNAME_AT_FRONT = 0x00000001;
enum ECBF_CHECKNAME_ONLY_ENABLED = 0x00000002;
enum ECBF_ICONID_AS_HICON = 0x00000004;
enum ECBF_OVERLAY_WARNING_ICON = 0x00000008;
enum ECBF_OVERLAY_ECBICON_IF_CHECKED = 0x00000010;
enum ECBF_OVERLAY_STOP_ICON = 0x00000020;
enum ECBF_OVERLAY_NO_ICON = 0x00000040;
enum ECBF_CHECKNAME_ONLY = 0x00000080;
enum ECBF_MASK = 0x000000ff;
enum OPTIF_COLLAPSE = 0x00000001;
enum OPTIF_HIDE = 0x00000002;
enum OPTIF_CALLBACK = 0x00000004;
enum OPTIF_CHANGED = 0x00000008;
enum OPTIF_CHANGEONCE = 0x00000010;
enum OPTIF_DISABLED = 0x00000020;
enum OPTIF_ECB_CHECKED = 0x00000040;
enum OPTIF_EXT_HIDE = 0x00000080;
enum OPTIF_EXT_DISABLED = 0x00000100;
enum OPTIF_SEL_AS_HICON = 0x00000200;
enum OPTIF_EXT_IS_EXTPUSH = 0x00000400;
enum OPTIF_NO_GROUPBOX_NAME = 0x00000800;
enum OPTIF_OVERLAY_WARNING_ICON = 0x00001000;
enum OPTIF_OVERLAY_STOP_ICON = 0x00002000;
enum OPTIF_OVERLAY_NO_ICON = 0x00004000;
enum OPTIF_INITIAL_TVITEM = 0x00008000;
enum OPTIF_HAS_POIEXT = 0x00010000;
enum OPTIF_MASK = 0x0001ffff;
enum DMPUB_NONE = 0x00000000;
enum DMPUB_FIRST = 0x00000001;
enum DMPUB_ORIENTATION = 0x00000001;
enum DMPUB_SCALE = 0x00000002;
enum DMPUB_COPIES_COLLATE = 0x00000003;
enum DMPUB_DEFSOURCE = 0x00000004;
enum DMPUB_PRINTQUALITY = 0x00000005;
enum DMPUB_COLOR = 0x00000006;
enum DMPUB_DUPLEX = 0x00000007;
enum DMPUB_TTOPTION = 0x00000008;
enum DMPUB_FORMNAME = 0x00000009;
enum DMPUB_ICMMETHOD = 0x0000000a;
enum DMPUB_ICMINTENT = 0x0000000b;
enum DMPUB_MEDIATYPE = 0x0000000c;
enum DMPUB_DITHERTYPE = 0x0000000d;
enum DMPUB_OUTPUTBIN = 0x0000000e;
enum DMPUB_QUALITY = 0x0000000f;
enum DMPUB_NUP = 0x00000010;
enum DMPUB_PAGEORDER = 0x00000011;
enum DMPUB_NUP_DIRECTION = 0x00000012;
enum DMPUB_MANUAL_DUPLEX = 0x00000013;
enum DMPUB_STAPLE = 0x00000014;
enum DMPUB_BOOKLET_EDGE = 0x00000015;
enum DMPUB_LAST = 0x00000015;
enum DMPUB_OEM_PAPER_ITEM = 0x00000061;
enum DMPUB_OEM_GRAPHIC_ITEM = 0x00000062;
enum DMPUB_OEM_ROOT_ITEM = 0x00000063;
enum DMPUB_USER = 0x00000064;
enum OIEXTF_ANSI_STRING = 0x00000001;
enum CPSUICB_REASON_SEL_CHANGED = 0x00000000;
enum CPSUICB_REASON_PUSHBUTTON = 0x00000001;
enum CPSUICB_REASON_ECB_CHANGED = 0x00000002;
enum CPSUICB_REASON_DLGPROC = 0x00000003;
enum CPSUICB_REASON_UNDO_CHANGES = 0x00000004;
enum CPSUICB_REASON_EXTPUSH = 0x00000005;
enum CPSUICB_REASON_APPLYNOW = 0x00000006;
enum CPSUICB_REASON_OPTITEM_SETFOCUS = 0x00000007;
enum CPSUICB_REASON_ITEMS_REVERTED = 0x00000008;
enum CPSUICB_REASON_ABOUT = 0x00000009;
enum CPSUICB_REASON_SETACTIVE = 0x0000000a;
enum CPSUICB_REASON_KILLACTIVE = 0x0000000b;
enum CPSUICB_ACTION_NONE = 0x00000000;
enum CPSUICB_ACTION_OPTIF_CHANGED = 0x00000001;
enum CPSUICB_ACTION_REINIT_ITEMS = 0x00000002;
enum CPSUICB_ACTION_NO_APPLY_EXIT = 0x00000003;
enum CPSUICB_ACTION_ITEMS_APPLIED = 0x00000004;
enum DP_STD_TREEVIEWPAGE = 0x0000ffff;
enum DP_STD_DOCPROPPAGE2 = 0x0000fffe;
enum DP_STD_DOCPROPPAGE1 = 0x0000fffd;
enum DP_STD_RESERVED_START = 0x0000fff0;
enum MAX_DLGPAGE_COUNT = 0x00000040;
enum DPF_ICONID_AS_HICON = 0x00000001;
enum DPF_USE_HDLGTEMPLATE = 0x00000002;
enum CPSUIF_UPDATE_PERMISSION = 0x00000001;
enum CPSUIF_ICONID_AS_HICON = 0x00000002;
enum CPSUIF_ABOUT_CALLBACK = 0x00000004;
enum CPSFUNC_ADD_HPROPSHEETPAGE = 0x00000000;
enum CPSFUNC_ADD_PROPSHEETPAGEW = 0x00000001;
enum CPSFUNC_ADD_PCOMPROPSHEETUIA = 0x00000002;
enum CPSFUNC_ADD_PCOMPROPSHEETUIW = 0x00000003;
enum CPSFUNC_ADD_PFNPROPSHEETUIA = 0x00000004;
enum CPSFUNC_ADD_PFNPROPSHEETUIW = 0x00000005;
enum CPSFUNC_DELETE_HCOMPROPSHEET = 0x00000006;
enum CPSFUNC_SET_HSTARTPAGE = 0x00000007;
enum CPSFUNC_GET_PAGECOUNT = 0x00000008;
enum CPSFUNC_SET_RESULT = 0x00000009;
enum CPSFUNC_GET_HPSUIPAGES = 0x0000000a;
enum CPSFUNC_LOAD_CPSUI_STRINGA = 0x0000000b;
enum CPSFUNC_LOAD_CPSUI_STRINGW = 0x0000000c;
enum CPSFUNC_LOAD_CPSUI_ICON = 0x0000000d;
enum CPSFUNC_GET_PFNPROPSHEETUI_ICON = 0x0000000e;
enum CPSFUNC_ADD_PROPSHEETPAGEA = 0x0000000f;
enum CPSFUNC_INSERT_PSUIPAGEA = 0x00000010;
enum CPSFUNC_INSERT_PSUIPAGEW = 0x00000011;
enum CPSFUNC_SET_PSUIPAGE_TITLEA = 0x00000012;
enum CPSFUNC_SET_PSUIPAGE_TITLEW = 0x00000013;
enum CPSFUNC_SET_PSUIPAGE_ICON = 0x00000014;
enum CPSFUNC_SET_DATABLOCK = 0x00000015;
enum CPSFUNC_QUERY_DATABLOCK = 0x00000016;
enum CPSFUNC_SET_DMPUB_HIDEBITS = 0x00000017;
enum CPSFUNC_IGNORE_CPSUI_PSN_APPLY = 0x00000018;
enum CPSFUNC_DO_APPLY_CPSUI = 0x00000019;
enum CPSFUNC_SET_FUSION_CONTEXT = 0x0000001a;
enum MAX_CPSFUNC_INDEX = 0x0000001a;
enum CPSFUNC_ADD_PCOMPROPSHEETUI = 0x00000003;
enum CPSFUNC_ADD_PFNPROPSHEETUI = 0x00000005;
enum CPSFUNC_LOAD_CPSUI_STRING = 0x0000000c;
enum CPSFUNC_ADD_PROPSHEETPAGE = 0x00000001;
enum CPSFUNC_INSERT_PSUIPAGE = 0x00000011;
enum CPSFUNC_SET_PSUIPAGE_TITLE = 0x00000013;
enum SR_OWNER = 0x00000000;
enum SR_OWNER_PARENT = 0x00000001;
enum PSUIPAGEINSERT_GROUP_PARENT = 0x00000000;
enum PSUIPAGEINSERT_PCOMPROPSHEETUI = 0x00000001;
enum PSUIPAGEINSERT_PFNPROPSHEETUI = 0x00000002;
enum PSUIPAGEINSERT_PROPSHEETPAGE = 0x00000003;
enum PSUIPAGEINSERT_HPROPSHEETPAGE = 0x00000004;
enum PSUIPAGEINSERT_DLL = 0x00000005;
enum MAX_PSUIPAGEINSERT_INDEX = 0x00000005;
enum INSPSUIPAGE_MODE_BEFORE = 0x00000000;
enum INSPSUIPAGE_MODE_AFTER = 0x00000001;
enum INSPSUIPAGE_MODE_FIRST_CHILD = 0x00000002;
enum INSPSUIPAGE_MODE_LAST_CHILD = 0x00000003;
enum INSPSUIPAGE_MODE_INDEX = 0x00000004;
enum SSP_TVPAGE = 0x00002710;
enum SSP_STDPAGE1 = 0x00002711;
enum SSP_STDPAGE2 = 0x00002712;
enum APPLYCPSUI_NO_NEWDEF = 0x00000001;
enum APPLYCPSUI_OK_CANCEL_BUTTON = 0x00000002;
enum PROPSHEETUI_REASON_INIT = 0x00000000;
enum PROPSHEETUI_REASON_GET_INFO_HEADER = 0x00000001;
enum PROPSHEETUI_REASON_DESTROY = 0x00000002;
enum PROPSHEETUI_REASON_SET_RESULT = 0x00000003;
enum PROPSHEETUI_REASON_GET_ICON = 0x00000004;
enum PROPSHEETUI_REASON_BEFORE_INIT = 0x00000005;
enum MAX_PROPSHEETUI_REASON_INDEX = 0x00000005;
enum PROPSHEETUI_INFO_VERSION = 0x00000100;
enum PSUIINFO_UNICODE = 0x00000001;
enum PSUIHDRF_OBSOLETE = 0x00000001;
enum PSUIHDRF_NOAPPLYNOW = 0x00000002;
enum PSUIHDRF_PROPTITLE = 0x00000004;
enum PSUIHDRF_USEHICON = 0x00000008;
enum PSUIHDRF_DEFTITLE = 0x00000010;
enum PSUIHDRF_EXACT_PTITLE = 0x00000020;
enum CPSUI_CANCEL = 0x00000000;
enum CPSUI_OK = 0x00000001;
enum CPSUI_RESTARTWINDOWS = 0x00000002;
enum CPSUI_REBOOTSYSTEM = 0x00000003;
enum ERR_CPSUI_GETLASTERROR = 0xffffffffffffffff;
enum ERR_CPSUI_ALLOCMEM_FAILED = 0xfffffffffffffffe;
enum ERR_CPSUI_INVALID_PDATA = 0xfffffffffffffffd;
enum ERR_CPSUI_INVALID_LPARAM = 0xfffffffffffffffc;
enum ERR_CPSUI_NULL_HINST = 0xfffffffffffffffb;
enum ERR_CPSUI_NULL_CALLERNAME = 0xfffffffffffffffa;
enum ERR_CPSUI_NULL_OPTITEMNAME = 0xfffffffffffffff9;
enum ERR_CPSUI_NO_PROPSHEETPAGE = 0xfffffffffffffff8;
enum ERR_CPSUI_TOO_MANY_PROPSHEETPAGES = 0xfffffffffffffff7;
enum ERR_CPSUI_CREATEPROPPAGE_FAILED = 0xfffffffffffffff6;
enum ERR_CPSUI_MORE_THAN_ONE_TVPAGE = 0xfffffffffffffff5;
enum ERR_CPSUI_MORE_THAN_ONE_STDPAGE = 0xfffffffffffffff4;
enum ERR_CPSUI_INVALID_PDLGPAGE = 0xfffffffffffffff3;
enum ERR_CPSUI_INVALID_DLGPAGE_CBSIZE = 0xfffffffffffffff2;
enum ERR_CPSUI_TOO_MANY_DLGPAGES = 0xfffffffffffffff1;
enum ERR_CPSUI_INVALID_DLGPAGEIDX = 0xfffffffffffffff0;
enum ERR_CPSUI_SUBITEM_DIFF_DLGPAGEIDX = 0xffffffffffffffef;
enum ERR_CPSUI_NULL_POPTITEM = 0xffffffffffffffee;
enum ERR_CPSUI_INVALID_OPTITEM_CBSIZE = 0xffffffffffffffed;
enum ERR_CPSUI_INVALID_OPTTYPE_CBSIZE = 0xffffffffffffffec;
enum ERR_CPSUI_INVALID_OPTTYPE_COUNT = 0xffffffffffffffeb;
enum ERR_CPSUI_NULL_POPTPARAM = 0xffffffffffffffea;
enum ERR_CPSUI_INVALID_OPTPARAM_CBSIZE = 0xffffffffffffffe9;
enum ERR_CPSUI_INVALID_EDITBOX_PSEL = 0xffffffffffffffe8;
enum ERR_CPSUI_INVALID_EDITBOX_BUF_SIZE = 0xffffffffffffffe7;
enum ERR_CPSUI_INVALID_ECB_CBSIZE = 0xffffffffffffffe6;
enum ERR_CPSUI_NULL_ECB_PTITLE = 0xffffffffffffffe5;
enum ERR_CPSUI_NULL_ECB_PCHECKEDNAME = 0xffffffffffffffe4;
enum ERR_CPSUI_INVALID_DMPUBID = 0xffffffffffffffe3;
enum ERR_CPSUI_INVALID_DMPUB_TVOT = 0xffffffffffffffe2;
enum ERR_CPSUI_CREATE_TRACKBAR_FAILED = 0xffffffffffffffe1;
enum ERR_CPSUI_CREATE_UDARROW_FAILED = 0xffffffffffffffe0;
enum ERR_CPSUI_CREATE_IMAGELIST_FAILED = 0xffffffffffffffdf;
enum ERR_CPSUI_INVALID_TVOT_TYPE = 0xffffffffffffffde;
enum ERR_CPSUI_INVALID_LBCB_TYPE = 0xffffffffffffffdd;
enum ERR_CPSUI_SUBITEM_DIFF_OPTIF_HIDE = 0xffffffffffffffdc;
enum ERR_CPSUI_INVALID_PUSHBUTTON_TYPE = 0xffffffffffffffda;
enum ERR_CPSUI_INVALID_EXTPUSH_CBSIZE = 0xffffffffffffffd9;
enum ERR_CPSUI_NULL_EXTPUSH_DLGPROC = 0xffffffffffffffd8;
enum ERR_CPSUI_NO_EXTPUSH_DLGTEMPLATEID = 0xffffffffffffffd7;
enum ERR_CPSUI_NULL_EXTPUSH_CALLBACK = 0xffffffffffffffd6;
enum ERR_CPSUI_DMCOPIES_USE_EXTPUSH = 0xffffffffffffffd5;
enum ERR_CPSUI_ZERO_OPTITEM = 0xffffffffffffffd4;
enum ERR_CPSUI_FUNCTION_NOT_IMPLEMENTED = 0xffffffffffffd8f1;
enum ERR_CPSUI_INTERNAL_ERROR = 0xffffffffffffd8f0;
enum IDI_CPSUI_ICONID_FIRST = 0x0000fa00;
enum IDI_CPSUI_EMPTY = 0x0000fa00;
enum IDI_CPSUI_SEL_NONE = 0x0000fa01;
enum IDI_CPSUI_WARNING = 0x0000fa02;
enum IDI_CPSUI_NO = 0x0000fa03;
enum IDI_CPSUI_YES = 0x0000fa04;
enum IDI_CPSUI_FALSE = 0x0000fa05;
enum IDI_CPSUI_TRUE = 0x0000fa06;
enum IDI_CPSUI_OFF = 0x0000fa07;
enum IDI_CPSUI_ON = 0x0000fa08;
enum IDI_CPSUI_PAPER_OUTPUT = 0x0000fa09;
enum IDI_CPSUI_ENVELOPE = 0x0000fa0a;
enum IDI_CPSUI_MEM = 0x0000fa0b;
enum IDI_CPSUI_FONTCARTHDR = 0x0000fa0c;
enum IDI_CPSUI_FONTCART = 0x0000fa0d;
enum IDI_CPSUI_STAPLER_ON = 0x0000fa0e;
enum IDI_CPSUI_STAPLER_OFF = 0x0000fa0f;
enum IDI_CPSUI_HT_HOST = 0x0000fa10;
enum IDI_CPSUI_HT_DEVICE = 0x0000fa11;
enum IDI_CPSUI_TT_PRINTASGRAPHIC = 0x0000fa12;
enum IDI_CPSUI_TT_DOWNLOADSOFT = 0x0000fa13;
enum IDI_CPSUI_TT_DOWNLOADVECT = 0x0000fa14;
enum IDI_CPSUI_TT_SUBDEV = 0x0000fa15;
enum IDI_CPSUI_PORTRAIT = 0x0000fa16;
enum IDI_CPSUI_LANDSCAPE = 0x0000fa17;
enum IDI_CPSUI_ROT_LAND = 0x0000fa18;
enum IDI_CPSUI_AUTOSEL = 0x0000fa19;
enum IDI_CPSUI_PAPER_TRAY = 0x0000fa1a;
enum IDI_CPSUI_PAPER_TRAY2 = 0x0000fa1b;
enum IDI_CPSUI_PAPER_TRAY3 = 0x0000fa1c;
enum IDI_CPSUI_TRANSPARENT = 0x0000fa1d;
enum IDI_CPSUI_COLLATE = 0x0000fa1e;
enum IDI_CPSUI_DUPLEX_NONE = 0x0000fa1f;
enum IDI_CPSUI_DUPLEX_HORZ = 0x0000fa20;
enum IDI_CPSUI_DUPLEX_VERT = 0x0000fa21;
enum IDI_CPSUI_RES_DRAFT = 0x0000fa22;
enum IDI_CPSUI_RES_LOW = 0x0000fa23;
enum IDI_CPSUI_RES_MEDIUM = 0x0000fa24;
enum IDI_CPSUI_RES_HIGH = 0x0000fa25;
enum IDI_CPSUI_RES_PRESENTATION = 0x0000fa26;
enum IDI_CPSUI_MONO = 0x0000fa27;
enum IDI_CPSUI_COLOR = 0x0000fa28;
enum IDI_CPSUI_DITHER_NONE = 0x0000fa29;
enum IDI_CPSUI_DITHER_COARSE = 0x0000fa2a;
enum IDI_CPSUI_DITHER_FINE = 0x0000fa2b;
enum IDI_CPSUI_DITHER_LINEART = 0x0000fa2c;
enum IDI_CPSUI_SCALING = 0x0000fa2d;
enum IDI_CPSUI_COPY = 0x0000fa2e;
enum IDI_CPSUI_HTCLRADJ = 0x0000fa2f;
enum IDI_CPSUI_HALFTONE_SETUP = 0x0000fa30;
enum IDI_CPSUI_WATERMARK = 0x0000fa31;
enum IDI_CPSUI_ERROR = 0x0000fa32;
enum IDI_CPSUI_ICM_OPTION = 0x0000fa33;
enum IDI_CPSUI_ICM_METHOD = 0x0000fa34;
enum IDI_CPSUI_ICM_INTENT = 0x0000fa35;
enum IDI_CPSUI_STD_FORM = 0x0000fa36;
enum IDI_CPSUI_OUTBIN = 0x0000fa37;
enum IDI_CPSUI_OUTPUT = 0x0000fa38;
enum IDI_CPSUI_GRAPHIC = 0x0000fa39;
enum IDI_CPSUI_ADVANCE = 0x0000fa3a;
enum IDI_CPSUI_DOCUMENT = 0x0000fa3b;
enum IDI_CPSUI_DEVICE = 0x0000fa3c;
enum IDI_CPSUI_DEVICE2 = 0x0000fa3d;
enum IDI_CPSUI_PRINTER = 0x0000fa3e;
enum IDI_CPSUI_PRINTER2 = 0x0000fa3f;
enum IDI_CPSUI_PRINTER3 = 0x0000fa40;
enum IDI_CPSUI_PRINTER4 = 0x0000fa41;
enum IDI_CPSUI_OPTION = 0x0000fa42;
enum IDI_CPSUI_OPTION2 = 0x0000fa43;
enum IDI_CPSUI_STOP = 0x0000fa44;
enum IDI_CPSUI_NOTINSTALLED = 0x0000fa45;
enum IDI_CPSUI_WARNING_OVERLAY = 0x0000fa46;
enum IDI_CPSUI_STOP_WARNING_OVERLAY = 0x0000fa47;
enum IDI_CPSUI_GENERIC_OPTION = 0x0000fa48;
enum IDI_CPSUI_GENERIC_ITEM = 0x0000fa49;
enum IDI_CPSUI_RUN_DIALOG = 0x0000fa4a;
enum IDI_CPSUI_QUESTION = 0x0000fa4b;
enum IDI_CPSUI_FORMTRAYASSIGN = 0x0000fa4c;
enum IDI_CPSUI_PRINTER_FOLDER = 0x0000fa4d;
enum IDI_CPSUI_INSTALLABLE_OPTION = 0x0000fa4e;
enum IDI_CPSUI_PRINTER_FEATURE = 0x0000fa4f;
enum IDI_CPSUI_DEVICE_FEATURE = 0x0000fa50;
enum IDI_CPSUI_FONTSUB = 0x0000fa51;
enum IDI_CPSUI_POSTSCRIPT = 0x0000fa52;
enum IDI_CPSUI_TELEPHONE = 0x0000fa53;
enum IDI_CPSUI_DUPLEX_NONE_L = 0x0000fa54;
enum IDI_CPSUI_DUPLEX_HORZ_L = 0x0000fa55;
enum IDI_CPSUI_DUPLEX_VERT_L = 0x0000fa56;
enum IDI_CPSUI_LF_PEN_PLOTTER = 0x0000fa57;
enum IDI_CPSUI_SF_PEN_PLOTTER = 0x0000fa58;
enum IDI_CPSUI_LF_RASTER_PLOTTER = 0x0000fa59;
enum IDI_CPSUI_SF_RASTER_PLOTTER = 0x0000fa5a;
enum IDI_CPSUI_ROLL_PAPER = 0x0000fa5b;
enum IDI_CPSUI_PEN_CARROUSEL = 0x0000fa5c;
enum IDI_CPSUI_PLOTTER_PEN = 0x0000fa5d;
enum IDI_CPSUI_MANUAL_FEED = 0x0000fa5e;
enum IDI_CPSUI_FAX = 0x0000fa5f;
enum IDI_CPSUI_PAGE_PROTECT = 0x0000fa60;
enum IDI_CPSUI_ENVELOPE_FEED = 0x0000fa61;
enum IDI_CPSUI_FONTCART_SLOT = 0x0000fa62;
enum IDI_CPSUI_LAYOUT_BMP_PORTRAIT = 0x0000fa63;
enum IDI_CPSUI_LAYOUT_BMP_ARROWL = 0x0000fa64;
enum IDI_CPSUI_LAYOUT_BMP_ARROWS = 0x0000fa65;
enum IDI_CPSUI_LAYOUT_BMP_BOOKLETL = 0x0000fa66;
enum IDI_CPSUI_LAYOUT_BMP_BOOKLETP = 0x0000fa67;
enum IDI_CPSUI_LAYOUT_BMP_ARROWLR = 0x0000fa68;
enum IDI_CPSUI_LAYOUT_BMP_ROT_PORT = 0x0000fa69;
enum IDI_CPSUI_LAYOUT_BMP_BOOKLETL_NB = 0x0000fa6a;
enum IDI_CPSUI_LAYOUT_BMP_BOOKLETP_NB = 0x0000fa6b;
enum IDI_CPSUI_ROT_PORT = 0x0000fa6e;
enum IDI_CPSUI_NUP_BORDER = 0x0000fa6f;
enum IDI_CPSUI_ICONID_LAST = 0x0000fa6f;
enum IDS_CPSUI_STRID_FIRST = 0x0000fcbc;
enum IDS_CPSUI_SETUP = 0x0000fcbc;
enum IDS_CPSUI_MORE = 0x0000fcbd;
enum IDS_CPSUI_CHANGE = 0x0000fcbe;
enum IDS_CPSUI_OPTION = 0x0000fcbf;
enum IDS_CPSUI_OF = 0x0000fcc0;
enum IDS_CPSUI_RANGE_FROM = 0x0000fcc1;
enum IDS_CPSUI_TO = 0x0000fcc2;
enum IDS_CPSUI_COLON_SEP = 0x0000fcc3;
enum IDS_CPSUI_LEFT_ANGLE = 0x0000fcc4;
enum IDS_CPSUI_RIGHT_ANGLE = 0x0000fcc5;
enum IDS_CPSUI_SLASH_SEP = 0x0000fcc6;
enum IDS_CPSUI_PERCENT = 0x0000fcc7;
enum IDS_CPSUI_LBCB_NOSEL = 0x0000fcc8;
enum IDS_CPSUI_PROPERTIES = 0x0000fcc9;
enum IDS_CPSUI_DEFAULTDOCUMENT = 0x0000fcca;
enum IDS_CPSUI_DOCUMENT = 0x0000fccb;
enum IDS_CPSUI_ADVANCEDOCUMENT = 0x0000fccc;
enum IDS_CPSUI_PRINTER = 0x0000fccd;
enum IDS_CPSUI_AUTOSELECT = 0x0000fcce;
enum IDS_CPSUI_PAPER_OUTPUT = 0x0000fccf;
enum IDS_CPSUI_GRAPHIC = 0x0000fcd0;
enum IDS_CPSUI_OPTIONS = 0x0000fcd1;
enum IDS_CPSUI_ADVANCED = 0x0000fcd2;
enum IDS_CPSUI_STDDOCPROPTAB = 0x0000fcd3;
enum IDS_CPSUI_STDDOCPROPTVTAB = 0x0000fcd4;
enum IDS_CPSUI_DEVICEOPTIONS = 0x0000fcd5;
enum IDS_CPSUI_FALSE = 0x0000fcd6;
enum IDS_CPSUI_TRUE = 0x0000fcd7;
enum IDS_CPSUI_NO = 0x0000fcd8;
enum IDS_CPSUI_YES = 0x0000fcd9;
enum IDS_CPSUI_OFF = 0x0000fcda;
enum IDS_CPSUI_ON = 0x0000fcdb;
enum IDS_CPSUI_DEFAULT = 0x0000fcdc;
enum IDS_CPSUI_ERROR = 0x0000fcdd;
enum IDS_CPSUI_NONE = 0x0000fcde;
enum IDS_CPSUI_NOT = 0x0000fcdf;
enum IDS_CPSUI_EXIST = 0x0000fce0;
enum IDS_CPSUI_NOTINSTALLED = 0x0000fce1;
enum IDS_CPSUI_ORIENTATION = 0x0000fce2;
enum IDS_CPSUI_SCALING = 0x0000fce3;
enum IDS_CPSUI_NUM_OF_COPIES = 0x0000fce4;
enum IDS_CPSUI_SOURCE = 0x0000fce5;
enum IDS_CPSUI_PRINTQUALITY = 0x0000fce6;
enum IDS_CPSUI_RESOLUTION = 0x0000fce7;
enum IDS_CPSUI_COLOR_APPERANCE = 0x0000fce8;
enum IDS_CPSUI_DUPLEX = 0x0000fce9;
enum IDS_CPSUI_TTOPTION = 0x0000fcea;
enum IDS_CPSUI_FORMNAME = 0x0000fceb;
enum IDS_CPSUI_ICM = 0x0000fcec;
enum IDS_CPSUI_ICMMETHOD = 0x0000fced;
enum IDS_CPSUI_ICMINTENT = 0x0000fcee;
enum IDS_CPSUI_MEDIA = 0x0000fcef;
enum IDS_CPSUI_DITHERING = 0x0000fcf0;
enum IDS_CPSUI_PORTRAIT = 0x0000fcf1;
enum IDS_CPSUI_LANDSCAPE = 0x0000fcf2;
enum IDS_CPSUI_ROT_LAND = 0x0000fcf3;
enum IDS_CPSUI_COLLATE = 0x0000fcf4;
enum IDS_CPSUI_COLLATED = 0x0000fcf5;
enum IDS_CPSUI_PRINTFLDSETTING = 0x0000fcf6;
enum IDS_CPSUI_DRAFT = 0x0000fcf7;
enum IDS_CPSUI_LOW = 0x0000fcf8;
enum IDS_CPSUI_MEDIUM = 0x0000fcf9;
enum IDS_CPSUI_HIGH = 0x0000fcfa;
enum IDS_CPSUI_PRESENTATION = 0x0000fcfb;
enum IDS_CPSUI_COLOR = 0x0000fcfc;
enum IDS_CPSUI_GRAYSCALE = 0x0000fcfd;
enum IDS_CPSUI_MONOCHROME = 0x0000fcfe;
enum IDS_CPSUI_SIMPLEX = 0x0000fcff;
enum IDS_CPSUI_HORIZONTAL = 0x0000fd00;
enum IDS_CPSUI_VERTICAL = 0x0000fd01;
enum IDS_CPSUI_LONG_SIDE = 0x0000fd02;
enum IDS_CPSUI_SHORT_SIDE = 0x0000fd03;
enum IDS_CPSUI_TT_PRINTASGRAPHIC = 0x0000fd04;
enum IDS_CPSUI_TT_DOWNLOADSOFT = 0x0000fd05;
enum IDS_CPSUI_TT_DOWNLOADVECT = 0x0000fd06;
enum IDS_CPSUI_TT_SUBDEV = 0x0000fd07;
enum IDS_CPSUI_ICM_BLACKWHITE = 0x0000fd08;
enum IDS_CPSUI_ICM_NO = 0x0000fd09;
enum IDS_CPSUI_ICM_YES = 0x0000fd0a;
enum IDS_CPSUI_ICM_SATURATION = 0x0000fd0b;
enum IDS_CPSUI_ICM_CONTRAST = 0x0000fd0c;
enum IDS_CPSUI_ICM_COLORMETRIC = 0x0000fd0d;
enum IDS_CPSUI_STANDARD = 0x0000fd0e;
enum IDS_CPSUI_GLOSSY = 0x0000fd0f;
enum IDS_CPSUI_TRANSPARENCY = 0x0000fd10;
enum IDS_CPSUI_REGULAR = 0x0000fd11;
enum IDS_CPSUI_BOND = 0x0000fd12;
enum IDS_CPSUI_COARSE = 0x0000fd13;
enum IDS_CPSUI_FINE = 0x0000fd14;
enum IDS_CPSUI_LINEART = 0x0000fd15;
enum IDS_CPSUI_ERRDIFFUSE = 0x0000fd16;
enum IDS_CPSUI_HALFTONE = 0x0000fd17;
enum IDS_CPSUI_HTCLRADJ = 0x0000fd18;
enum IDS_CPSUI_USE_HOST_HT = 0x0000fd19;
enum IDS_CPSUI_USE_DEVICE_HT = 0x0000fd1a;
enum IDS_CPSUI_USE_PRINTER_HT = 0x0000fd1b;
enum IDS_CPSUI_OUTBINASSIGN = 0x0000fd1c;
enum IDS_CPSUI_WATERMARK = 0x0000fd1d;
enum IDS_CPSUI_FORMTRAYASSIGN = 0x0000fd1e;
enum IDS_CPSUI_UPPER_TRAY = 0x0000fd1f;
enum IDS_CPSUI_ONLYONE = 0x0000fd20;
enum IDS_CPSUI_LOWER_TRAY = 0x0000fd21;
enum IDS_CPSUI_MIDDLE_TRAY = 0x0000fd22;
enum IDS_CPSUI_MANUAL_TRAY = 0x0000fd23;
enum IDS_CPSUI_ENVELOPE_TRAY = 0x0000fd24;
enum IDS_CPSUI_ENVMANUAL_TRAY = 0x0000fd25;
enum IDS_CPSUI_TRACTOR_TRAY = 0x0000fd26;
enum IDS_CPSUI_SMALLFMT_TRAY = 0x0000fd27;
enum IDS_CPSUI_LARGEFMT_TRAY = 0x0000fd28;
enum IDS_CPSUI_LARGECAP_TRAY = 0x0000fd29;
enum IDS_CPSUI_CASSETTE_TRAY = 0x0000fd2a;
enum IDS_CPSUI_DEFAULT_TRAY = 0x0000fd2b;
enum IDS_CPSUI_FORMSOURCE = 0x0000fd2c;
enum IDS_CPSUI_MANUALFEED = 0x0000fd2d;
enum IDS_CPSUI_PRINTERMEM_KB = 0x0000fd2e;
enum IDS_CPSUI_PRINTERMEM_MB = 0x0000fd2f;
enum IDS_CPSUI_PAGEPROTECT = 0x0000fd30;
enum IDS_CPSUI_HALFTONE_SETUP = 0x0000fd31;
enum IDS_CPSUI_INSTFONTCART = 0x0000fd32;
enum IDS_CPSUI_SLOT1 = 0x0000fd33;
enum IDS_CPSUI_SLOT2 = 0x0000fd34;
enum IDS_CPSUI_SLOT3 = 0x0000fd35;
enum IDS_CPSUI_SLOT4 = 0x0000fd36;
enum IDS_CPSUI_LEFT_SLOT = 0x0000fd37;
enum IDS_CPSUI_RIGHT_SLOT = 0x0000fd38;
enum IDS_CPSUI_STAPLER = 0x0000fd39;
enum IDS_CPSUI_STAPLER_ON = 0x0000fd3a;
enum IDS_CPSUI_STAPLER_OFF = 0x0000fd3b;
enum IDS_CPSUI_STACKER = 0x0000fd3c;
enum IDS_CPSUI_MAILBOX = 0x0000fd3d;
enum IDS_CPSUI_COPY = 0x0000fd3e;
enum IDS_CPSUI_COPIES = 0x0000fd3f;
enum IDS_CPSUI_TOTAL = 0x0000fd40;
enum IDS_CPSUI_MAKE = 0x0000fd41;
enum IDS_CPSUI_PRINT = 0x0000fd42;
enum IDS_CPSUI_FAX = 0x0000fd43;
enum IDS_CPSUI_PLOT = 0x0000fd44;
enum IDS_CPSUI_SLOW = 0x0000fd45;
enum IDS_CPSUI_FAST = 0x0000fd46;
enum IDS_CPSUI_ROTATED = 0x0000fd47;
enum IDS_CPSUI_RESET = 0x0000fd48;
enum IDS_CPSUI_ALL = 0x0000fd49;
enum IDS_CPSUI_DEVICE = 0x0000fd4a;
enum IDS_CPSUI_SETTINGS = 0x0000fd4b;
enum IDS_CPSUI_REVERT = 0x0000fd4c;
enum IDS_CPSUI_CHANGES = 0x0000fd4d;
enum IDS_CPSUI_CHANGED = 0x0000fd4e;
enum IDS_CPSUI_WARNING = 0x0000fd4f;
enum IDS_CPSUI_ABOUT = 0x0000fd50;
enum IDS_CPSUI_VERSION = 0x0000fd51;
enum IDS_CPSUI_NO_NAME = 0x0000fd52;
enum IDS_CPSUI_SETTING = 0x0000fd53;
enum IDS_CPSUI_DEVICE_SETTINGS = 0x0000fd54;
enum IDS_CPSUI_STDDOCPROPTAB1 = 0x0000fd55;
enum IDS_CPSUI_STDDOCPROPTAB2 = 0x0000fd56;
enum IDS_CPSUI_PAGEORDER = 0x0000fd57;
enum IDS_CPSUI_FRONTTOBACK = 0x0000fd58;
enum IDS_CPSUI_BACKTOFRONT = 0x0000fd59;
enum IDS_CPSUI_QUALITY_SETTINGS = 0x0000fd5a;
enum IDS_CPSUI_QUALITY_DRAFT = 0x0000fd5b;
enum IDS_CPSUI_QUALITY_BETTER = 0x0000fd5c;
enum IDS_CPSUI_QUALITY_BEST = 0x0000fd5d;
enum IDS_CPSUI_QUALITY_CUSTOM = 0x0000fd5e;
enum IDS_CPSUI_OUTPUTBIN = 0x0000fd5f;
enum IDS_CPSUI_NUP = 0x0000fd60;
enum IDS_CPSUI_NUP_NORMAL = 0x0000fd61;
enum IDS_CPSUI_NUP_TWOUP = 0x0000fd62;
enum IDS_CPSUI_NUP_FOURUP = 0x0000fd63;
enum IDS_CPSUI_NUP_SIXUP = 0x0000fd64;
enum IDS_CPSUI_NUP_NINEUP = 0x0000fd65;
enum IDS_CPSUI_NUP_SIXTEENUP = 0x0000fd66;
enum IDS_CPSUI_SIDE1 = 0x0000fd67;
enum IDS_CPSUI_SIDE2 = 0x0000fd68;
enum IDS_CPSUI_BOOKLET = 0x0000fd69;
enum IDS_CPSUI_POSTER = 0x0000fd6a;
enum IDS_CPSUI_POSTER_2x2 = 0x0000fd6b;
enum IDS_CPSUI_POSTER_3x3 = 0x0000fd6c;
enum IDS_CPSUI_POSTER_4x4 = 0x0000fd6d;
enum IDS_CPSUI_NUP_DIRECTION = 0x0000fd6e;
enum IDS_CPSUI_RIGHT_THEN_DOWN = 0x0000fd6f;
enum IDS_CPSUI_DOWN_THEN_RIGHT = 0x0000fd70;
enum IDS_CPSUI_LEFT_THEN_DOWN = 0x0000fd71;
enum IDS_CPSUI_DOWN_THEN_LEFT = 0x0000fd72;
enum IDS_CPSUI_MANUAL_DUPLEX = 0x0000fd73;
enum IDS_CPSUI_MANUAL_DUPLEX_ON = 0x0000fd74;
enum IDS_CPSUI_MANUAL_DUPLEX_OFF = 0x0000fd75;
enum IDS_CPSUI_ROT_PORT = 0x0000fd76;
enum IDS_CPSUI_STAPLE = 0x0000fd77;
enum IDS_CPSUI_BOOKLET_EDGE = 0x0000fd78;
enum IDS_CPSUI_BOOKLET_EDGE_LEFT = 0x0000fd79;
enum IDS_CPSUI_BOOKLET_EDGE_RIGHT = 0x0000fd7a;
enum IDS_CPSUI_NUP_BORDER = 0x0000fd7b;
enum IDS_CPSUI_NUP_BORDERED = 0x0000fd7c;
enum IDS_CPSUI_STRID_LAST = 0x0000fd7c;
enum XPS_FP_PRINTER_NAME = "PrinterName";
enum XPS_FP_PROGRESS_REPORT = "ProgressReport";
enum XPS_FP_PRINTER_HANDLE = "PrinterHandle";
enum XPS_FP_USER_PRINT_TICKET = "PerUserPrintTicket";
enum XPS_FP_USER_TOKEN = "UserSecurityToken";
enum XPS_FP_JOB_ID = "PrintJobId";
enum XPS_FP_PRINT_CLASS_FACTORY = "PrintClassFactory";
enum XPS_FP_OUTPUT_FILE = "PrintOutputFileName";
enum XPS_FP_MS_CONTENT_TYPE = "DriverMultiContentType";
enum XPS_FP_MS_CONTENT_TYPE_XPS = "XPS";
enum XPS_FP_MS_CONTENT_TYPE_OPENXPS = "OpenXPS";
enum XPS_FP_DRIVER_PROPERTY_BAG = "DriverPropertyBag";
enum XPS_FP_QUEUE_PROPERTY_BAG = "QueuePropertyBag";
enum XPS_FP_MERGED_DATAFILE_PATH = "MergedDataFilePath";
enum XPS_FP_RESOURCE_DLL_PATHS = "ResourceDLLPaths";
enum XPS_FP_JOB_LEVEL_PRINTTICKET = "JobPrintTicket";
enum XPS_FP_PRINTDEVICECAPABILITIES = "PrintDeviceCapabilities";
enum MXDC_ESCAPE = 0x0000101a;
enum MXDCOP_GET_FILENAME = 0x0000000e;
enum MXDCOP_PRINTTICKET_FIXED_DOC_SEQ = 0x00000016;
enum MXDCOP_PRINTTICKET_FIXED_DOC = 0x00000018;
enum MXDCOP_PRINTTICKET_FIXED_PAGE = 0x0000001a;
enum MXDCOP_SET_S0PAGE = 0x0000001c;
enum MXDCOP_SET_S0PAGE_RESOURCE = 0x0000001e;
enum MXDCOP_SET_XPSPASSTHRU_MODE = 0x00000020;
enum CLSID_OEMRENDER = GUID(0x6d6abf26, 0x9f38, 0x11d1, [0x88, 0x2a, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0xec]);
enum CLSID_OEMUI = GUID(0xabce80d7, 0x9f46, 0x11d1, [0x88, 0x2a, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0xec]);
enum CLSID_OEMUIMXDC = GUID(0x4e144300, 0x5b43, 0x4288, [0x93, 0x2a, 0x5e, 0x4d, 0xd6, 0xd8, 0x2b, 0xed]);
enum CLSID_OEMPTPROVIDER = GUID(0x91723892, 0x45d2, 0x48e2, [0x9e, 0xc9, 0x56, 0x23, 0x79, 0xda, 0xf9, 0x92]);
enum S_DEVCAP_OUTPUT_FULL_REPLACEMENT = 0x0004dc01;
enum CLSID_PTPROVIDER = GUID(0x46ac151b, 0x8490, 0x4531, [0x96, 0xcc, 0x55, 0xbf, 0x2b, 0xf1, 0x9e, 0x11]);
enum E_VERSION_NOT_SUPPORTED = 0x80040001;
enum S_NO_CONFLICT = 0x00040001;
enum S_CONFLICT_RESOLVED = 0x00040002;
enum PRINTER_EXTENSION_DETAILEDREASON_PRINTER_STATUS = GUID(0x5d5a1704, 0xdfd1, 0x4181, [0x8e, 0xee, 0x81, 0x5c, 0x86, 0xed, 0xad, 0x31]);
enum PRINTER_EXTENSION_REASON_PRINT_PREFERENCES = GUID(0xec8f261f, 0x267c, 0x469f, [0xb5, 0xd6, 0x39, 0x33, 0x2, 0x3c, 0x29, 0xcc]);
enum PRINTER_EXTENSION_REASON_DRIVER_EVENT = GUID(0x23bb1328, 0x63de, 0x4293, [0x91, 0x5b, 0xa6, 0xa2, 0x3d, 0x92, 0x9a, 0xcb]);
enum FMTID_PrinterPropertyBag = GUID(0x75f9adca, 0x97d, 0x45c3, [0xa6, 0xe4, 0xba, 0xb2, 0x9e, 0x27, 0x6f, 0x3e]);
enum PRINTER_OEMINTF_VERSION = 0x00010000;
enum OEM_MODE_PUBLISHER = 0x00000001;
enum OEMGI_GETSIGNATURE = 0x00000001;
enum OEMGI_GETINTERFACEVERSION = 0x00000002;
enum OEMGI_GETVERSION = 0x00000003;
enum OEMGI_GETPUBLISHERINFO = 0x00000004;
enum OEMGI_GETREQUESTEDHELPERINTERFACES = 0x00000005;
enum OEMPUBLISH_DEFAULT = 0x00000000;
enum OEMPUBLISH_IPRINTCOREHELPER = 0x00000001;
enum OEMDM_SIZE = 0x00000001;
enum OEMDM_DEFAULT = 0x00000002;
enum OEMDM_CONVERT = 0x00000003;
enum OEMDM_MERGE = 0x00000004;
enum OEMGDS_MIN_DOCSTICKY = 0x00000001;
enum OEMGDS_PSDM_FLAGS = 0x00000001;
enum OEMGDS_PSDM_DIALECT = 0x00000002;
enum OEMGDS_PSDM_TTDLFMT = 0x00000003;
enum OEMGDS_PSDM_NUP = 0x00000004;
enum OEMGDS_PSDM_PSLEVEL = 0x00000005;
enum OEMGDS_PSDM_CUSTOMSIZE = 0x00000006;
enum OEMGDS_UNIDM_GPDVER = 0x00004000;
enum OEMGDS_UNIDM_FLAGS = 0x00004001;
enum OEMGDS_MIN_PRINTERSTICKY = 0x00008000;
enum OEMGDS_PRINTFLAGS = 0x00008000;
enum OEMGDS_FREEMEM = 0x00008001;
enum OEMGDS_JOBTIMEOUT = 0x00008002;
enum OEMGDS_WAITTIMEOUT = 0x00008003;
enum OEMGDS_PROTOCOL = 0x00008004;
enum OEMGDS_MINOUTLINE = 0x00008005;
enum OEMGDS_MAXBITMAP = 0x00008006;
enum OEMGDS_MAX = 0x00010000;
enum GPD_OEMCUSTOMDATA = 0x00000001;
enum MV_UPDATE = 0x00000001;
enum MV_RELATIVE = 0x00000002;
enum MV_GRAPHICS = 0x00000004;
enum MV_PHYSICAL = 0x00000008;
enum MV_SENDXMOVECMD = 0x00000010;
enum MV_SENDYMOVECMD = 0x00000020;
enum OEMTTY_INFO_MARGINS = 0x00000001;
enum OEMTTY_INFO_CODEPAGE = 0x00000002;
enum OEMTTY_INFO_NUM_UFMS = 0x00000003;
enum OEMTTY_INFO_UFM_IDS = 0x00000004;
enum UFOFLAG_TTFONT = 0x00000001;
enum UFOFLAG_TTDOWNLOAD_BITMAP = 0x00000002;
enum UFOFLAG_TTDOWNLOAD_TTOUTLINE = 0x00000004;
enum UFOFLAG_TTOUTLINE_BOLD_SIM = 0x00000008;
enum UFOFLAG_TTOUTLINE_ITALIC_SIM = 0x00000010;
enum UFOFLAG_TTOUTLINE_VERTICAL = 0x00000020;
enum UFOFLAG_TTSUBSTITUTED = 0x00000040;
enum UFO_GETINFO_FONTOBJ = 0x00000001;
enum UFO_GETINFO_GLYPHSTRING = 0x00000002;
enum UFO_GETINFO_GLYPHBITMAP = 0x00000003;
enum UFO_GETINFO_GLYPHWIDTH = 0x00000004;
enum UFO_GETINFO_MEMORY = 0x00000005;
enum UFO_GETINFO_STDVARIABLE = 0x00000006;
enum FNT_INFO_PRINTDIRINCCDEGREES = 0x00000000;
enum FNT_INFO_GRAYPERCENTAGE = 0x00000001;
enum FNT_INFO_NEXTFONTID = 0x00000002;
enum FNT_INFO_NEXTGLYPH = 0x00000003;
enum FNT_INFO_FONTHEIGHT = 0x00000004;
enum FNT_INFO_FONTWIDTH = 0x00000005;
enum FNT_INFO_FONTBOLD = 0x00000006;
enum FNT_INFO_FONTITALIC = 0x00000007;
enum FNT_INFO_FONTUNDERLINE = 0x00000008;
enum FNT_INFO_FONTSTRIKETHRU = 0x00000009;
enum FNT_INFO_CURRENTFONTID = 0x0000000a;
enum FNT_INFO_TEXTYRES = 0x0000000b;
enum FNT_INFO_TEXTXRES = 0x0000000c;
enum FNT_INFO_FONTMAXWIDTH = 0x0000000d;
enum FNT_INFO_MAX = 0x0000000e;
enum TTDOWNLOAD_DONTCARE = 0x00000000;
enum TTDOWNLOAD_GRAPHICS = 0x00000001;
enum TTDOWNLOAD_BITMAP = 0x00000002;
enum TTDOWNLOAD_TTOUTLINE = 0x00000003;
enum TYPE_UNICODE = 0x00000001;
enum TYPE_TRANSDATA = 0x00000002;
enum TYPE_GLYPHHANDLE = 0x00000003;
enum TYPE_GLYPHID = 0x00000004;
enum PDEV_ADJUST_PAPER_MARGIN_TYPE = 0x00000001;
enum PDEV_HOSTFONT_ENABLED_TYPE = 0x00000002;
enum PDEV_USE_TRUE_COLOR_TYPE = 0x00000003;
enum OEMCUIP_DOCPROP = 0x00000001;
enum OEMCUIP_PRNPROP = 0x00000002;
enum CUSTOMPARAM_WIDTH = 0x00000000;
enum CUSTOMPARAM_HEIGHT = 0x00000001;
enum CUSTOMPARAM_WIDTHOFFSET = 0x00000002;
enum CUSTOMPARAM_HEIGHTOFFSET = 0x00000003;
enum CUSTOMPARAM_ORIENTATION = 0x00000004;
enum CUSTOMPARAM_MAX = 0x00000005;
enum SETOPTIONS_FLAG_RESOLVE_CONFLICT = 0x00000001;
enum SETOPTIONS_FLAG_KEEP_CONFLICT = 0x00000002;
enum SETOPTIONS_RESULT_NO_CONFLICT = 0x00000000;
enum SETOPTIONS_RESULT_CONFLICT_RESOLVED = 0x00000001;
enum SETOPTIONS_RESULT_CONFLICT_REMAINED = 0x00000002;
enum UNIFM_VERSION_1_0 = 0x00010000;
enum UFM_SOFT = 0x00000001;
enum UFM_CART = 0x00000002;
enum UFM_SCALABLE = 0x00000004;
enum DF_TYPE_HPINTELLIFONT = 0x00000000;
enum DF_TYPE_TRUETYPE = 0x00000001;
enum DF_TYPE_PST1 = 0x00000002;
enum DF_TYPE_CAPSL = 0x00000003;
enum DF_TYPE_OEM1 = 0x00000004;
enum DF_TYPE_OEM2 = 0x00000005;
enum DF_NOITALIC = 0x00000001;
enum DF_NOUNDER = 0x00000002;
enum DF_XM_CR = 0x00000004;
enum DF_NO_BOLD = 0x00000008;
enum DF_NO_DOUBLE_UNDERLINE = 0x00000010;
enum DF_NO_STRIKETHRU = 0x00000020;
enum DF_BKSP_OK = 0x00000040;
enum UNI_GLYPHSETDATA_VERSION_1_0 = 0x00010000;
enum MTYPE_FORMAT_MASK = 0x00000007;
enum MTYPE_COMPOSE = 0x00000001;
enum MTYPE_DIRECT = 0x00000002;
enum MTYPE_PAIRED = 0x00000004;
enum MTYPE_DOUBLEBYTECHAR_MASK = 0x00000018;
enum MTYPE_SINGLE = 0x00000008;
enum MTYPE_DOUBLE = 0x00000010;
enum MTYPE_PREDEFIN_MASK = 0x000000e0;
enum MTYPE_REPLACE = 0x00000020;
enum MTYPE_ADD = 0x00000040;
enum MTYPE_DISABLE = 0x00000080;
enum CC_NOPRECNV = 0x0000ffff;
enum CC_DEFAULT = 0x00000000;
enum CC_CP437 = 0xffffffffffffffff;
enum CC_CP850 = 0xfffffffffffffffe;
enum CC_CP863 = 0xfffffffffffffffd;
enum CC_BIG5 = 0xfffffffffffffff6;
enum CC_ISC = 0xfffffffffffffff5;
enum CC_JIS = 0xfffffffffffffff4;
enum CC_JIS_ANK = 0xfffffffffffffff3;
enum CC_NS86 = 0xfffffffffffffff2;
enum CC_TCA = 0xfffffffffffffff1;
enum CC_GB2312 = 0xfffffffffffffff0;
enum CC_SJIS = 0xffffffffffffffef;
enum CC_WANSUNG = 0xffffffffffffffee;
enum UFF_VERSION_NUMBER = 0x00010001;
enum FONT_DIR_SORTED = 0x00000001;
enum FONT_FL_UFM = 0x00000001;
enum FONT_FL_IFI = 0x00000002;
enum FONT_FL_SOFTFONT = 0x00000004;
enum FONT_FL_PERMANENT_SF = 0x00000008;
enum FONT_FL_DEVICEFONT = 0x00000010;
enum FONT_FL_GLYPHSET_GTT = 0x00000020;
enum FONT_FL_GLYPHSET_RLE = 0x00000040;
enum FONT_FL_RESERVED = 0x00008000;
enum FG_CANCHANGE = 0x00000080;
enum WM_FI_FILENAME = 0x00000384;
enum UNKNOWN_PROTOCOL = 0x00000000;
enum PROTOCOL_UNKNOWN_TYPE = 0x00000000;
enum RAWTCP = 0x00000001;
enum PROTOCOL_RAWTCP_TYPE = 0x00000001;
enum LPR = 0x00000002;
enum PROTOCOL_LPR_TYPE = 0x00000002;
enum MAX_PORTNAME_LEN = 0x00000040;
enum MAX_NETWORKNAME_LEN = 0x00000031;
enum MAX_NETWORKNAME2_LEN = 0x00000080;
enum MAX_SNMP_COMMUNITY_STR_LEN = 0x00000021;
enum MAX_QUEUENAME_LEN = 0x00000021;
enum MAX_IPADDR_STR_LEN = 0x00000010;
enum MAX_ADDRESS_STR_LEN = 0x0000000d;
enum MAX_DEVICEDESCRIPTION_STR_LEN = 0x00000101;
enum DPS_NOPERMISSION = 0x00000001;
enum DM_ADVANCED = 0x00000010;
enum DM_NOPERMISSION = 0x00000020;
enum DM_USER_DEFAULT = 0x00000040;
enum DM_PROMPT_NON_MODAL = 0x40000000;
enum DM_INVALIDATE_DRIVER_CACHE = 0x20000000;
enum DM_RESERVED = 0x80000000;
enum CDM_CONVERT = 0x00000001;
enum CDM_CONVERT351 = 0x00000002;
enum CDM_DRIVER_DEFAULT = 0x00000004;
enum DOCUMENTEVENT_FIRST = 0x00000001;
enum DOCUMENTEVENT_CREATEDCPRE = 0x00000001;
enum DOCUMENTEVENT_CREATEDCPOST = 0x00000002;
enum DOCUMENTEVENT_RESETDCPRE = 0x00000003;
enum DOCUMENTEVENT_RESETDCPOST = 0x00000004;
enum DOCUMENTEVENT_STARTDOC = 0x00000005;
enum DOCUMENTEVENT_STARTDOCPRE = 0x00000005;
enum DOCUMENTEVENT_STARTPAGE = 0x00000006;
enum DOCUMENTEVENT_ENDPAGE = 0x00000007;
enum DOCUMENTEVENT_ENDDOC = 0x00000008;
enum DOCUMENTEVENT_ENDDOCPRE = 0x00000008;
enum DOCUMENTEVENT_ABORTDOC = 0x00000009;
enum DOCUMENTEVENT_DELETEDC = 0x0000000a;
enum DOCUMENTEVENT_ESCAPE = 0x0000000b;
enum DOCUMENTEVENT_ENDDOCPOST = 0x0000000c;
enum DOCUMENTEVENT_STARTDOCPOST = 0x0000000d;
enum DOCUMENTEVENT_QUERYFILTER = 0x0000000e;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRE = 0x00000001;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRE = 0x00000002;
enum DOCUMENTEVENT_XPS_ADDFIXEDPAGEEPRE = 0x00000003;
enum DOCUMENTEVENT_XPS_ADDFIXEDPAGEPOST = 0x00000004;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPOST = 0x00000005;
enum DOCUMENTEVENT_XPS_CANCELJOB = 0x00000006;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPRE = 0x00000007;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPRE = 0x00000008;
enum DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPRE = 0x00000009;
enum DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPOST = 0x0000000a;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPOST = 0x0000000b;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPOST = 0x0000000c;
enum DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPOST = 0x0000000d;
enum DOCUMENTEVENT_LAST = 0x0000000f;
enum DOCUMENTEVENT_SPOOLED = 0x00010000;
enum DOCUMENTEVENT_SUCCESS = 0x00000001;
enum DOCUMENTEVENT_UNSUPPORTED = 0x00000000;
enum DOCUMENTEVENT_FAILURE = 0xffffffffffffffff;
enum PRINTER_EVENT_CONFIGURATION_CHANGE = 0x00000000;
enum PRINTER_EVENT_ADD_CONNECTION = 0x00000001;
enum PRINTER_EVENT_DELETE_CONNECTION = 0x00000002;
enum PRINTER_EVENT_INITIALIZE = 0x00000003;
enum PRINTER_EVENT_DELETE = 0x00000004;
enum PRINTER_EVENT_CACHE_REFRESH = 0x00000005;
enum PRINTER_EVENT_CACHE_DELETE = 0x00000006;
enum PRINTER_EVENT_ATTRIBUTES_CHANGED = 0x00000007;
enum PRINTER_EVENT_CONFIGURATION_UPDATE = 0x00000008;
enum PRINTER_EVENT_ADD_CONNECTION_NO_UI = 0x00000009;
enum PRINTER_EVENT_DELETE_CONNECTION_NO_UI = 0x0000000a;
enum PRINTER_EVENT_FLAG_NO_UI = 0x00000001;
enum DRIVER_EVENT_INITIALIZE = 0x00000001;
enum DRIVER_EVENT_DELETE = 0x00000002;
enum BORDER_PRINT = 0x00000000;
enum NO_BORDER_PRINT = 0x00000001;
enum NORMAL_PRINT = 0x00000000;
enum REVERSE_PRINT = 0x00000001;
enum BOOKLET_PRINT = 0x00000002;
enum NO_COLOR_OPTIMIZATION = 0x00000000;
enum COLOR_OPTIMIZATION = 0x00000001;
enum REVERSE_PAGES_FOR_REVERSE_DUPLEX = 0x00000001;
enum RIGHT_THEN_DOWN = 0x00000001;
enum BOOKLET_EDGE_LEFT = 0x00000000;
enum BOOKLET_EDGE_RIGHT = 0x00000001;
enum QCP_DEVICEPROFILE = 0x00000000;
enum QCP_SOURCEPROFILE = 0x00000001;
enum QCP_PROFILEMEMORY = 0x00000001;
enum QCP_PROFILEDISK = 0x00000002;
enum SPLPRINTER_USER_MODE_PRINTER_DRIVER = "SPLUserModePrinterDriver";
enum EMF_PP_COLOR_OPTIMIZATION = 0x00000001;
enum PRINTER_NOTIFY_STATUS_ENDPOINT = 0x00000001;
enum PRINTER_NOTIFY_STATUS_POLL = 0x00000002;
enum PRINTER_NOTIFY_STATUS_INFO = 0x00000004;
enum ROUTER_UNKNOWN = 0x00000000;
enum ROUTER_SUCCESS = 0x00000001;
enum ROUTER_STOP_ROUTING = 0x00000002;
enum FILL_WITH_DEFAULTS = 0x00000001;
enum PRINTER_NOTIFY_INFO_DATA_COMPACT = 0x00000001;
enum COPYFILE_EVENT_SET_PRINTER_DATAEX = 0x00000001;
enum COPYFILE_EVENT_DELETE_PRINTER = 0x00000002;
enum COPYFILE_EVENT_ADD_PRINTER_CONNECTION = 0x00000003;
enum COPYFILE_EVENT_DELETE_PRINTER_CONNECTION = 0x00000004;
enum COPYFILE_EVENT_FILES_CHANGED = 0x00000005;
enum COPYFILE_FLAG_CLIENT_SPOOLER = 0x00000001;
enum COPYFILE_FLAG_SERVER_SPOOLER = 0x00000002;
enum DSPRINT_PUBLISH = 0x00000001;
enum DSPRINT_UPDATE = 0x00000002;
enum DSPRINT_UNPUBLISH = 0x00000004;
enum DSPRINT_REPUBLISH = 0x00000008;
enum DSPRINT_PENDING = 0x80000000;
enum PRINTER_CONTROL_PAUSE = 0x00000001;
enum PRINTER_CONTROL_RESUME = 0x00000002;
enum PRINTER_CONTROL_PURGE = 0x00000003;
enum PRINTER_CONTROL_SET_STATUS = 0x00000004;
enum PRINTER_STATUS_PAUSED = 0x00000001;
enum PRINTER_STATUS_ERROR = 0x00000002;
enum PRINTER_STATUS_PENDING_DELETION = 0x00000004;
enum PRINTER_STATUS_PAPER_JAM = 0x00000008;
enum PRINTER_STATUS_PAPER_OUT = 0x00000010;
enum PRINTER_STATUS_MANUAL_FEED = 0x00000020;
enum PRINTER_STATUS_PAPER_PROBLEM = 0x00000040;
enum PRINTER_STATUS_OFFLINE = 0x00000080;
enum PRINTER_STATUS_IO_ACTIVE = 0x00000100;
enum PRINTER_STATUS_BUSY = 0x00000200;
enum PRINTER_STATUS_PRINTING = 0x00000400;
enum PRINTER_STATUS_OUTPUT_BIN_FULL = 0x00000800;
enum PRINTER_STATUS_NOT_AVAILABLE = 0x00001000;
enum PRINTER_STATUS_WAITING = 0x00002000;
enum PRINTER_STATUS_PROCESSING = 0x00004000;
enum PRINTER_STATUS_INITIALIZING = 0x00008000;
enum PRINTER_STATUS_WARMING_UP = 0x00010000;
enum PRINTER_STATUS_TONER_LOW = 0x00020000;
enum PRINTER_STATUS_NO_TONER = 0x00040000;
enum PRINTER_STATUS_PAGE_PUNT = 0x00080000;
enum PRINTER_STATUS_USER_INTERVENTION = 0x00100000;
enum PRINTER_STATUS_OUT_OF_MEMORY = 0x00200000;
enum PRINTER_STATUS_DOOR_OPEN = 0x00400000;
enum PRINTER_STATUS_SERVER_UNKNOWN = 0x00800000;
enum PRINTER_STATUS_POWER_SAVE = 0x01000000;
enum PRINTER_STATUS_SERVER_OFFLINE = 0x02000000;
enum PRINTER_STATUS_DRIVER_UPDATE_NEEDED = 0x04000000;
enum PRINTER_ATTRIBUTE_QUEUED = 0x00000001;
enum PRINTER_ATTRIBUTE_DIRECT = 0x00000002;
enum PRINTER_ATTRIBUTE_DEFAULT = 0x00000004;
enum PRINTER_ATTRIBUTE_SHARED = 0x00000008;
enum PRINTER_ATTRIBUTE_NETWORK = 0x00000010;
enum PRINTER_ATTRIBUTE_HIDDEN = 0x00000020;
enum PRINTER_ATTRIBUTE_LOCAL = 0x00000040;
enum PRINTER_ATTRIBUTE_ENABLE_DEVQ = 0x00000080;
enum PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS = 0x00000100;
enum PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST = 0x00000200;
enum PRINTER_ATTRIBUTE_WORK_OFFLINE = 0x00000400;
enum PRINTER_ATTRIBUTE_ENABLE_BIDI = 0x00000800;
enum PRINTER_ATTRIBUTE_RAW_ONLY = 0x00001000;
enum PRINTER_ATTRIBUTE_PUBLISHED = 0x00002000;
enum PRINTER_ATTRIBUTE_FAX = 0x00004000;
enum PRINTER_ATTRIBUTE_TS = 0x00008000;
enum PRINTER_ATTRIBUTE_PUSHED_USER = 0x00020000;
enum PRINTER_ATTRIBUTE_PUSHED_MACHINE = 0x00040000;
enum PRINTER_ATTRIBUTE_MACHINE = 0x00080000;
enum PRINTER_ATTRIBUTE_FRIENDLY_NAME = 0x00100000;
enum PRINTER_ATTRIBUTE_TS_GENERIC_DRIVER = 0x00200000;
enum PRINTER_ATTRIBUTE_PER_USER = 0x00400000;
enum PRINTER_ATTRIBUTE_ENTERPRISE_CLOUD = 0x00800000;
enum NO_PRIORITY = 0x00000000;
enum MAX_PRIORITY = 0x00000063;
enum MIN_PRIORITY = 0x00000001;
enum DEF_PRIORITY = 0x00000001;
enum JOB_CONTROL_PAUSE = 0x00000001;
enum JOB_CONTROL_RESUME = 0x00000002;
enum JOB_CONTROL_CANCEL = 0x00000003;
enum JOB_CONTROL_RESTART = 0x00000004;
enum JOB_CONTROL_DELETE = 0x00000005;
enum JOB_CONTROL_SENT_TO_PRINTER = 0x00000006;
enum JOB_CONTROL_LAST_PAGE_EJECTED = 0x00000007;
enum JOB_CONTROL_RETAIN = 0x00000008;
enum JOB_CONTROL_RELEASE = 0x00000009;
enum JOB_STATUS_PAUSED = 0x00000001;
enum JOB_STATUS_ERROR = 0x00000002;
enum JOB_STATUS_DELETING = 0x00000004;
enum JOB_STATUS_SPOOLING = 0x00000008;
enum JOB_STATUS_PRINTING = 0x00000010;
enum JOB_STATUS_OFFLINE = 0x00000020;
enum JOB_STATUS_PAPEROUT = 0x00000040;
enum JOB_STATUS_PRINTED = 0x00000080;
enum JOB_STATUS_DELETED = 0x00000100;
enum JOB_STATUS_BLOCKED_DEVQ = 0x00000200;
enum JOB_STATUS_USER_INTERVENTION = 0x00000400;
enum JOB_STATUS_RESTART = 0x00000800;
enum JOB_STATUS_COMPLETE = 0x00001000;
enum JOB_STATUS_RETAINED = 0x00002000;
enum JOB_STATUS_RENDERING_LOCALLY = 0x00004000;
enum JOB_POSITION_UNSPECIFIED = 0x00000000;
enum PRINTER_DRIVER_PACKAGE_AWARE = 0x00000001;
enum PRINTER_DRIVER_XPS = 0x00000002;
enum PRINTER_DRIVER_SANDBOX_ENABLED = 0x00000004;
enum PRINTER_DRIVER_CLASS = 0x00000008;
enum PRINTER_DRIVER_DERIVED = 0x00000010;
enum PRINTER_DRIVER_NOT_SHAREABLE = 0x00000020;
enum PRINTER_DRIVER_CATEGORY_FAX = 0x00000040;
enum PRINTER_DRIVER_CATEGORY_FILE = 0x00000080;
enum PRINTER_DRIVER_CATEGORY_VIRTUAL = 0x00000100;
enum PRINTER_DRIVER_CATEGORY_SERVICE = 0x00000200;
enum PRINTER_DRIVER_SOFT_RESET_REQUIRED = 0x00000400;
enum PRINTER_DRIVER_SANDBOX_DISABLED = 0x00000800;
enum PRINTER_DRIVER_CATEGORY_3D = 0x00001000;
enum PRINTER_DRIVER_CATEGORY_CLOUD = 0x00002000;
enum DRIVER_KERNELMODE = 0x00000001;
enum DRIVER_USERMODE = 0x00000002;
enum DPD_DELETE_UNUSED_FILES = 0x00000001;
enum DPD_DELETE_SPECIFIC_VERSION = 0x00000002;
enum DPD_DELETE_ALL_FILES = 0x00000004;
enum APD_STRICT_UPGRADE = 0x00000001;
enum APD_STRICT_DOWNGRADE = 0x00000002;
enum APD_COPY_ALL_FILES = 0x00000004;
enum APD_COPY_NEW_FILES = 0x00000008;
enum APD_COPY_FROM_DIRECTORY = 0x00000010;
enum STRING_NONE = 0x00000001;
enum STRING_MUIDLL = 0x00000002;
enum STRING_LANGPAIR = 0x00000004;
enum MAX_FORM_KEYWORD_LENGTH = 0x00000040;
enum DI_CHANNEL = 0x00000001;
enum DI_READ_SPOOL_JOB = 0x00000003;
enum DI_MEMORYMAP_WRITE = 0x00000001;
enum FORM_USER = 0x00000000;
enum FORM_BUILTIN = 0x00000001;
enum FORM_PRINTER = 0x00000002;
enum PPCAPS_RIGHT_THEN_DOWN = 0x00000001;
enum PPCAPS_BORDER_PRINT = 0x00000001;
enum PPCAPS_BOOKLET_EDGE = 0x00000001;
enum PPCAPS_REVERSE_PAGES_FOR_REVERSE_DUPLEX = 0x00000001;
enum PPCAPS_SQUARE_SCALING = 0x00000001;
enum PORT_TYPE_WRITE = 0x00000001;
enum PORT_TYPE_READ = 0x00000002;
enum PORT_TYPE_REDIRECTED = 0x00000004;
enum PORT_TYPE_NET_ATTACHED = 0x00000008;
enum PORT_STATUS_TYPE_ERROR = 0x00000001;
enum PORT_STATUS_TYPE_WARNING = 0x00000002;
enum PORT_STATUS_TYPE_INFO = 0x00000003;
enum PORT_STATUS_OFFLINE = 0x00000001;
enum PORT_STATUS_PAPER_JAM = 0x00000002;
enum PORT_STATUS_PAPER_OUT = 0x00000003;
enum PORT_STATUS_OUTPUT_BIN_FULL = 0x00000004;
enum PORT_STATUS_PAPER_PROBLEM = 0x00000005;
enum PORT_STATUS_NO_TONER = 0x00000006;
enum PORT_STATUS_DOOR_OPEN = 0x00000007;
enum PORT_STATUS_USER_INTERVENTION = 0x00000008;
enum PORT_STATUS_OUT_OF_MEMORY = 0x00000009;
enum PORT_STATUS_TONER_LOW = 0x0000000a;
enum PORT_STATUS_WARMING_UP = 0x0000000b;
enum PORT_STATUS_POWER_SAVE = 0x0000000c;
enum PRINTER_ENUM_DEFAULT = 0x00000001;
enum PRINTER_ENUM_LOCAL = 0x00000002;
enum PRINTER_ENUM_CONNECTIONS = 0x00000004;
enum PRINTER_ENUM_FAVORITE = 0x00000004;
enum PRINTER_ENUM_NAME = 0x00000008;
enum PRINTER_ENUM_REMOTE = 0x00000010;
enum PRINTER_ENUM_SHARED = 0x00000020;
enum PRINTER_ENUM_NETWORK = 0x00000040;
enum PRINTER_ENUM_EXPAND = 0x00004000;
enum PRINTER_ENUM_CONTAINER = 0x00008000;
enum PRINTER_ENUM_ICONMASK = 0x00ff0000;
enum PRINTER_ENUM_ICON1 = 0x00010000;
enum PRINTER_ENUM_ICON2 = 0x00020000;
enum PRINTER_ENUM_ICON3 = 0x00040000;
enum PRINTER_ENUM_ICON4 = 0x00080000;
enum PRINTER_ENUM_ICON5 = 0x00100000;
enum PRINTER_ENUM_ICON6 = 0x00200000;
enum PRINTER_ENUM_ICON7 = 0x00400000;
enum PRINTER_ENUM_ICON8 = 0x00800000;
enum PRINTER_ENUM_HIDE = 0x01000000;
enum PRINTER_ENUM_CATEGORY_ALL = 0x02000000;
enum PRINTER_ENUM_CATEGORY_3D = 0x04000000;
enum SPOOL_FILE_PERSISTENT = 0x00000001;
enum SPOOL_FILE_TEMPORARY = 0x00000002;
enum PRINTER_NOTIFY_TYPE = 0x00000000;
enum JOB_NOTIFY_TYPE = 0x00000001;
enum SERVER_NOTIFY_TYPE = 0x00000002;
enum PRINTER_NOTIFY_FIELD_SERVER_NAME = 0x00000000;
enum PRINTER_NOTIFY_FIELD_PRINTER_NAME = 0x00000001;
enum PRINTER_NOTIFY_FIELD_SHARE_NAME = 0x00000002;
enum PRINTER_NOTIFY_FIELD_PORT_NAME = 0x00000003;
enum PRINTER_NOTIFY_FIELD_DRIVER_NAME = 0x00000004;
enum PRINTER_NOTIFY_FIELD_COMMENT = 0x00000005;
enum PRINTER_NOTIFY_FIELD_LOCATION = 0x00000006;
enum PRINTER_NOTIFY_FIELD_DEVMODE = 0x00000007;
enum PRINTER_NOTIFY_FIELD_SEPFILE = 0x00000008;
enum PRINTER_NOTIFY_FIELD_PRINT_PROCESSOR = 0x00000009;
enum PRINTER_NOTIFY_FIELD_PARAMETERS = 0x0000000a;
enum PRINTER_NOTIFY_FIELD_DATATYPE = 0x0000000b;
enum PRINTER_NOTIFY_FIELD_SECURITY_DESCRIPTOR = 0x0000000c;
enum PRINTER_NOTIFY_FIELD_ATTRIBUTES = 0x0000000d;
enum PRINTER_NOTIFY_FIELD_PRIORITY = 0x0000000e;
enum PRINTER_NOTIFY_FIELD_DEFAULT_PRIORITY = 0x0000000f;
enum PRINTER_NOTIFY_FIELD_START_TIME = 0x00000010;
enum PRINTER_NOTIFY_FIELD_UNTIL_TIME = 0x00000011;
enum PRINTER_NOTIFY_FIELD_STATUS = 0x00000012;
enum PRINTER_NOTIFY_FIELD_STATUS_STRING = 0x00000013;
enum PRINTER_NOTIFY_FIELD_CJOBS = 0x00000014;
enum PRINTER_NOTIFY_FIELD_AVERAGE_PPM = 0x00000015;
enum PRINTER_NOTIFY_FIELD_TOTAL_PAGES = 0x00000016;
enum PRINTER_NOTIFY_FIELD_PAGES_PRINTED = 0x00000017;
enum PRINTER_NOTIFY_FIELD_TOTAL_BYTES = 0x00000018;
enum PRINTER_NOTIFY_FIELD_BYTES_PRINTED = 0x00000019;
enum PRINTER_NOTIFY_FIELD_OBJECT_GUID = 0x0000001a;
enum PRINTER_NOTIFY_FIELD_FRIENDLY_NAME = 0x0000001b;
enum PRINTER_NOTIFY_FIELD_BRANCH_OFFICE_PRINTING = 0x0000001c;
enum JOB_NOTIFY_FIELD_PRINTER_NAME = 0x00000000;
enum JOB_NOTIFY_FIELD_MACHINE_NAME = 0x00000001;
enum JOB_NOTIFY_FIELD_PORT_NAME = 0x00000002;
enum JOB_NOTIFY_FIELD_USER_NAME = 0x00000003;
enum JOB_NOTIFY_FIELD_NOTIFY_NAME = 0x00000004;
enum JOB_NOTIFY_FIELD_DATATYPE = 0x00000005;
enum JOB_NOTIFY_FIELD_PRINT_PROCESSOR = 0x00000006;
enum JOB_NOTIFY_FIELD_PARAMETERS = 0x00000007;
enum JOB_NOTIFY_FIELD_DRIVER_NAME = 0x00000008;
enum JOB_NOTIFY_FIELD_DEVMODE = 0x00000009;
enum JOB_NOTIFY_FIELD_STATUS = 0x0000000a;
enum JOB_NOTIFY_FIELD_STATUS_STRING = 0x0000000b;
enum JOB_NOTIFY_FIELD_SECURITY_DESCRIPTOR = 0x0000000c;
enum JOB_NOTIFY_FIELD_DOCUMENT = 0x0000000d;
enum JOB_NOTIFY_FIELD_PRIORITY = 0x0000000e;
enum JOB_NOTIFY_FIELD_POSITION = 0x0000000f;
enum JOB_NOTIFY_FIELD_SUBMITTED = 0x00000010;
enum JOB_NOTIFY_FIELD_START_TIME = 0x00000011;
enum JOB_NOTIFY_FIELD_UNTIL_TIME = 0x00000012;
enum JOB_NOTIFY_FIELD_TIME = 0x00000013;
enum JOB_NOTIFY_FIELD_TOTAL_PAGES = 0x00000014;
enum JOB_NOTIFY_FIELD_PAGES_PRINTED = 0x00000015;
enum JOB_NOTIFY_FIELD_TOTAL_BYTES = 0x00000016;
enum JOB_NOTIFY_FIELD_BYTES_PRINTED = 0x00000017;
enum JOB_NOTIFY_FIELD_REMOTE_JOB_ID = 0x00000018;
enum SERVER_NOTIFY_FIELD_PRINT_DRIVER_ISOLATION_GROUP = 0x00000000;
enum PRINTER_NOTIFY_CATEGORY_ALL = 0x00001000;
enum PRINTER_NOTIFY_CATEGORY_3D = 0x00002000;
enum PRINTER_NOTIFY_OPTIONS_REFRESH = 0x00000001;
enum PRINTER_NOTIFY_INFO_DISCARDED = 0x00000001;
enum BIDI_ACTION_ENUM_SCHEMA = "EnumSchema";
enum BIDI_ACTION_GET = "Get";
enum BIDI_ACTION_SET = "Set";
enum BIDI_ACTION_GET_ALL = "GetAll";
enum BIDI_ACTION_GET_WITH_ARGUMENT = "GetWithArgument";
enum BIDI_ACCESS_ADMINISTRATOR = 0x00000001;
enum BIDI_ACCESS_USER = 0x00000002;
enum ERROR_BIDI_STATUS_OK = 0x00000000;
enum ERROR_BIDI_ERROR_BASE = 0x000032c8;
enum ERROR_BIDI_STATUS_WARNING = 0x000032c9;
enum ERROR_BIDI_SCHEMA_READ_ONLY = 0x000032ca;
enum ERROR_BIDI_SERVER_OFFLINE = 0x000032cb;
enum ERROR_BIDI_DEVICE_OFFLINE = 0x000032cc;
enum ERROR_BIDI_SCHEMA_NOT_SUPPORTED = 0x000032cd;
enum ERROR_BIDI_SET_DIFFERENT_TYPE = 0x000032ce;
enum ERROR_BIDI_SET_MULTIPLE_SCHEMAPATH = 0x000032cf;
enum ERROR_BIDI_SET_INVALID_SCHEMAPATH = 0x000032d0;
enum ERROR_BIDI_SET_UNKNOWN_FAILURE = 0x000032d1;
enum ERROR_BIDI_SCHEMA_WRITE_ONLY = 0x000032d2;
enum ERROR_BIDI_GET_REQUIRES_ARGUMENT = 0x000032d3;
enum ERROR_BIDI_GET_ARGUMENT_NOT_SUPPORTED = 0x000032d4;
enum ERROR_BIDI_GET_MISSING_ARGUMENT = 0x000032d5;
enum ERROR_BIDI_DEVICE_CONFIG_UNCHANGED = 0x000032d6;
enum ERROR_BIDI_NO_LOCALIZED_RESOURCES = 0x000032d7;
enum ERROR_BIDI_NO_BIDI_SCHEMA_EXTENSIONS = 0x000032d8;
enum ERROR_BIDI_UNSUPPORTED_CLIENT_LANGUAGE = 0x000032d9;
enum ERROR_BIDI_UNSUPPORTED_RESOURCE_FORMAT = 0x000032da;
enum PRINTER_CHANGE_ADD_PRINTER = 0x00000001;
enum PRINTER_CHANGE_SET_PRINTER = 0x00000002;
enum PRINTER_CHANGE_DELETE_PRINTER = 0x00000004;
enum PRINTER_CHANGE_FAILED_CONNECTION_PRINTER = 0x00000008;
enum PRINTER_CHANGE_PRINTER = 0x000000ff;
enum PRINTER_CHANGE_ADD_JOB = 0x00000100;
enum PRINTER_CHANGE_SET_JOB = 0x00000200;
enum PRINTER_CHANGE_DELETE_JOB = 0x00000400;
enum PRINTER_CHANGE_WRITE_JOB = 0x00000800;
enum PRINTER_CHANGE_JOB = 0x0000ff00;
enum PRINTER_CHANGE_ADD_FORM = 0x00010000;
enum PRINTER_CHANGE_SET_FORM = 0x00020000;
enum PRINTER_CHANGE_DELETE_FORM = 0x00040000;
enum PRINTER_CHANGE_FORM = 0x00070000;
enum PRINTER_CHANGE_ADD_PORT = 0x00100000;
enum PRINTER_CHANGE_CONFIGURE_PORT = 0x00200000;
enum PRINTER_CHANGE_DELETE_PORT = 0x00400000;
enum PRINTER_CHANGE_PORT = 0x00700000;
enum PRINTER_CHANGE_ADD_PRINT_PROCESSOR = 0x01000000;
enum PRINTER_CHANGE_DELETE_PRINT_PROCESSOR = 0x04000000;
enum PRINTER_CHANGE_PRINT_PROCESSOR = 0x07000000;
enum PRINTER_CHANGE_SERVER = 0x08000000;
enum PRINTER_CHANGE_ADD_PRINTER_DRIVER = 0x10000000;
enum PRINTER_CHANGE_SET_PRINTER_DRIVER = 0x20000000;
enum PRINTER_CHANGE_DELETE_PRINTER_DRIVER = 0x40000000;
enum PRINTER_CHANGE_PRINTER_DRIVER = 0x70000000;
enum PRINTER_CHANGE_TIMEOUT = 0x80000000;
enum PRINTER_CHANGE_ALL = 0x7f77ffff;
enum PRINTER_ERROR_INFORMATION = 0x80000000;
enum PRINTER_ERROR_WARNING = 0x40000000;
enum PRINTER_ERROR_SEVERE = 0x20000000;
enum PRINTER_ERROR_OUTOFPAPER = 0x00000001;
enum PRINTER_ERROR_JAM = 0x00000002;
enum PRINTER_ERROR_OUTOFTONER = 0x00000004;
enum SPLREG_DEFAULT_SPOOL_DIRECTORY = "DefaultSpoolDirectory";
enum SPLREG_PORT_THREAD_PRIORITY_DEFAULT = "PortThreadPriorityDefault";
enum SPLREG_PORT_THREAD_PRIORITY = "PortThreadPriority";
enum SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT = "SchedulerThreadPriorityDefault";
enum SPLREG_SCHEDULER_THREAD_PRIORITY = "SchedulerThreadPriority";
enum SPLREG_BEEP_ENABLED = "BeepEnabled";
enum SPLREG_NET_POPUP = "NetPopup";
enum SPLREG_RETRY_POPUP = "RetryPopup";
enum SPLREG_NET_POPUP_TO_COMPUTER = "NetPopupToComputer";
enum SPLREG_EVENT_LOG = "EventLog";
enum SPLREG_MAJOR_VERSION = "MajorVersion";
enum SPLREG_MINOR_VERSION = "MinorVersion";
enum SPLREG_ARCHITECTURE = "Architecture";
enum SPLREG_OS_VERSION = "OSVersion";
enum SPLREG_OS_VERSIONEX = "OSVersionEx";
enum SPLREG_DS_PRESENT = "DsPresent";
enum SPLREG_DS_PRESENT_FOR_USER = "DsPresentForUser";
enum SPLREG_REMOTE_FAX = "RemoteFax";
enum SPLREG_RESTART_JOB_ON_POOL_ERROR = "RestartJobOnPoolError";
enum SPLREG_RESTART_JOB_ON_POOL_ENABLED = "RestartJobOnPoolEnabled";
enum SPLREG_DNS_MACHINE_NAME = "DNSMachineName";
enum SPLREG_ALLOW_USER_MANAGEFORMS = "AllowUserManageForms";
enum SPLREG_WEBSHAREMGMT = "WebShareMgmt";
enum SPLREG_PRINT_DRIVER_ISOLATION_GROUPS = "PrintDriverIsolationGroups";
enum SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE = "PrintDriverIsolationTimeBeforeRecycle";
enum SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE = "PrintDriverIsolationMaxobjsBeforeRecycle";
enum SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT = "PrintDriverIsolationIdleTimeout";
enum SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY = "PrintDriverIsolationExecutionPolicy";
enum SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY = "PrintDriverIsolationOverrideCompat";
enum SPLREG_PRINT_QUEUE_V4_DRIVER_DIRECTORY = "PrintQueueV4DriverDirectory";
enum JOB_ACCESS_ADMINISTER = 0x00000010;
enum JOB_ACCESS_READ = 0x00000020;
enum SPLDS_SPOOLER_KEY = "DsSpooler";
enum SPLDS_DRIVER_KEY = "DsDriver";
enum SPLDS_USER_KEY = "DsUser";
enum SPLDS_ASSET_NUMBER = "assetNumber";
enum SPLDS_BYTES_PER_MINUTE = "bytesPerMinute";
enum SPLDS_DESCRIPTION = "description";
enum SPLDS_DRIVER_NAME = "driverName";
enum SPLDS_DRIVER_VERSION = "driverVersion";
enum SPLDS_LOCATION = "location";
enum SPLDS_PORT_NAME = "portName";
enum SPLDS_PRINT_ATTRIBUTES = "printAttributes";
enum SPLDS_PRINT_BIN_NAMES = "printBinNames";
enum SPLDS_PRINT_COLLATE = "printCollate";
enum SPLDS_PRINT_COLOR = "printColor";
enum SPLDS_PRINT_DUPLEX_SUPPORTED = "printDuplexSupported";
enum SPLDS_PRINT_END_TIME = "printEndTime";
enum SPLDS_PRINTER_CLASS = "printQueue";
enum SPLDS_PRINTER_NAME = "printerName";
enum SPLDS_PRINT_KEEP_PRINTED_JOBS = "printKeepPrintedJobs";
enum SPLDS_PRINT_LANGUAGE = "printLanguage";
enum SPLDS_PRINT_MAC_ADDRESS = "printMACAddress";
enum SPLDS_PRINT_MAX_X_EXTENT = "printMaxXExtent";
enum SPLDS_PRINT_MAX_Y_EXTENT = "printMaxYExtent";
enum SPLDS_PRINT_MAX_RESOLUTION_SUPPORTED = "printMaxResolutionSupported";
enum SPLDS_PRINT_MEDIA_READY = "printMediaReady";
enum SPLDS_PRINT_MEDIA_SUPPORTED = "printMediaSupported";
enum SPLDS_PRINT_MEMORY = "printMemory";
enum SPLDS_PRINT_MIN_X_EXTENT = "printMinXExtent";
enum SPLDS_PRINT_MIN_Y_EXTENT = "printMinYExtent";
enum SPLDS_PRINT_NETWORK_ADDRESS = "printNetworkAddress";
enum SPLDS_PRINT_NOTIFY = "printNotify";
enum SPLDS_PRINT_NUMBER_UP = "printNumberUp";
enum SPLDS_PRINT_ORIENTATIONS_SUPPORTED = "printOrientationsSupported";
enum SPLDS_PRINT_OWNER = "printOwner";
enum SPLDS_PRINT_PAGES_PER_MINUTE = "printPagesPerMinute";
enum SPLDS_PRINT_RATE = "printRate";
enum SPLDS_PRINT_RATE_UNIT = "printRateUnit";
enum SPLDS_PRINT_SEPARATOR_FILE = "printSeparatorFile";
enum SPLDS_PRINT_SHARE_NAME = "printShareName";
enum SPLDS_PRINT_SPOOLING = "printSpooling";
enum SPLDS_PRINT_STAPLING_SUPPORTED = "printStaplingSupported";
enum SPLDS_PRINT_START_TIME = "printStartTime";
enum SPLDS_PRINT_STATUS = "printStatus";
enum SPLDS_PRIORITY = "priority";
enum SPLDS_SERVER_NAME = "serverName";
enum SPLDS_SHORT_SERVER_NAME = "shortServerName";
enum SPLDS_UNC_NAME = "uNCName";
enum SPLDS_URL = "url";
enum SPLDS_FLAGS = "flags";
enum SPLDS_VERSION_NUMBER = "versionNumber";
enum SPLDS_PRINTER_NAME_ALIASES = "printerNameAliases";
enum SPLDS_PRINTER_LOCATIONS = "printerLocations";
enum SPLDS_PRINTER_MODEL = "printerModel";
enum PRINTER_CONNECTION_MISMATCH = 0x00000020;
enum PRINTER_CONNECTION_NO_UI = 0x00000040;
enum IPDFP_COPY_ALL_FILES = 0x00000001;
enum UPDP_SILENT_UPLOAD = 0x00000001;
enum UPDP_UPLOAD_ALWAYS = 0x00000002;
enum UPDP_CHECK_DRIVERSTORE = 0x00000004;
enum MS_PRINT_JOB_OUTPUT_FILE = "MsPrintJobOutputFile";
enum DISPID_PRINTSCHEMA_ELEMENT = 0x00002710;
enum DISPID_PRINTSCHEMA_ELEMENT_XMLNODE = 0x00002711;
enum DISPID_PRINTSCHEMA_ELEMENT_NAME = 0x00002712;
enum DISPID_PRINTSCHEMA_ELEMENT_NAMESPACEURI = 0x00002713;
enum DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT = 0x00002774;
enum DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT_DISPLAYNAME = 0x00002775;
enum DISPID_PRINTSCHEMA_OPTION = 0x000027d8;
enum DISPID_PRINTSCHEMA_OPTION_SELECTED = 0x000027d9;
enum DISPID_PRINTSCHEMA_OPTION_CONSTRAINED = 0x000027da;
enum DISPID_PRINTSCHEMA_OPTION_GETPROPERTYVALUE = 0x000027db;
enum DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION = 0x0000283c;
enum DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_WIDTH = 0x0000283d;
enum DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_HEIGHT = 0x0000283e;
enum DISPID_PRINTSCHEMA_NUPOPTION = 0x000028a0;
enum DISPID_PRINTSCHEMA_NUPOPTION_PAGESPERSHEET = 0x000028a1;
enum DISPID_PRINTSCHEMA_OPTIONCOLLECTION = 0x00002904;
enum DISPID_PRINTSCHEMA_OPTIONCOLLECTION_COUNT = 0x00002905;
enum DISPID_PRINTSCHEMA_OPTIONCOLLECTION_GETAT = 0x00002906;
enum DISPID_PRINTSCHEMA_FEATURE = 0x00002968;
enum DISPID_PRINTSCHEMA_FEATURE_SELECTEDOPTION = 0x00002969;
enum DISPID_PRINTSCHEMA_FEATURE_SELECTIONTYPE = 0x0000296a;
enum DISPID_PRINTSCHEMA_FEATURE_GETOPTION = 0x0000296b;
enum DISPID_PRINTSCHEMA_FEATURE_DISPLAYUI = 0x0000296c;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE = 0x000029cc;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_WIDTH = 0x000029cd;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_HEIGHT = 0x000029ce;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_WIDTH = 0x000029cf;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_HEIGHT = 0x000029d0;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_WIDTH = 0x000029d1;
enum DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_HEIGHT = 0x000029d2;
enum DISPID_PRINTSCHEMA_CAPABILITIES = 0x00002a30;
enum DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE_KEYNAME = 0x00002a31;
enum DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE = 0x00002a32;
enum DISPID_PRINTSCHEMA_CAPABILITIES_PAGEIMAGEABLESIZE = 0x00002a33;
enum DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMINVALUE = 0x00002a34;
enum DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMAXVALUE = 0x00002a35;
enum DISPID_PRINTSCHEMA_CAPABILITIES_GETSELECTEDOPTION = 0x00002a36;
enum DISPID_PRINTSCHEMA_CAPABILITIES_GETOPTIONS = 0x00002a37;
enum DISPID_PRINTSCHEMA_CAPABILITIES_GETPARAMETERDEFINITION = 0x00002a38;
enum DISPID_PRINTSCHEMA_ASYNCOPERATION = 0x00002a94;
enum DISPID_PRINTSCHEMA_ASYNCOPERATION_START = 0x00002a95;
enum DISPID_PRINTSCHEMA_ASYNCOPERATION_CANCEL = 0x00002a96;
enum DISPID_PRINTSCHEMA_TICKET = 0x00002af8;
enum DISPID_PRINTSCHEMA_TICKET_GETFEATURE_KEYNAME = 0x00002af9;
enum DISPID_PRINTSCHEMA_TICKET_GETFEATURE = 0x00002afa;
enum DISPID_PRINTSCHEMA_TICKET_VALIDATEASYNC = 0x00002afb;
enum DISPID_PRINTSCHEMA_TICKET_COMMITASYNC = 0x00002afc;
enum DISPID_PRINTSCHEMA_TICKET_NOTIFYXMLCHANGED = 0x00002afd;
enum DISPID_PRINTSCHEMA_TICKET_GETCAPABILITIES = 0x00002afe;
enum DISPID_PRINTSCHEMA_TICKET_JOBCOPIESALLDOCUMENTS = 0x00002aff;
enum DISPID_PRINTSCHEMA_TICKET_GETPARAMETERINITIALIZER = 0x00002b00;
enum DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT = 0x00002b5c;
enum DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT_COMPLETED = 0x00002b5d;
enum DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM = 0x00002bc0;
enum DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_READ = 0x00002bc1;
enum DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_WRITE = 0x00002bc2;
enum DISPID_PRINTERSCRIPTABLESTREAM = 0x00002c24;
enum DISPID_PRINTERSCRIPTABLESTREAM_COMMIT = 0x00002c25;
enum DISPID_PRINTERSCRIPTABLESTREAM_SEEK = 0x00002c26;
enum DISPID_PRINTERSCRIPTABLESTREAM_SETSIZE = 0x00002c27;
enum DISPID_PRINTERPROPERTYBAG = 0x00002c88;
enum DISPID_PRINTERPROPERTYBAG_GETBOOL = 0x00002c89;
enum DISPID_PRINTERPROPERTYBAG_SETBOOL = 0x00002c8a;
enum DISPID_PRINTERPROPERTYBAG_GETINT32 = 0x00002c8b;
enum DISPID_PRINTERPROPERTYBAG_SETINT32 = 0x00002c8c;
enum DISPID_PRINTERPROPERTYBAG_GETSTRING = 0x00002c8d;
enum DISPID_PRINTERPROPERTYBAG_SETSTRING = 0x00002c8e;
enum DISPID_PRINTERPROPERTYBAG_GETBYTES = 0x00002c8f;
enum DISPID_PRINTERPROPERTYBAG_SETBYTES = 0x00002c90;
enum DISPID_PRINTERPROPERTYBAG_GETREADSTREAM = 0x00002c91;
enum DISPID_PRINTERPROPERTYBAG_GETWRITESTREAM = 0x00002c92;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTREAMASXML = 0x00002c93;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG = 0x00002cec;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBOOL = 0x00002ced;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBOOL = 0x00002cee;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETINT32 = 0x00002cef;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETINT32 = 0x00002cf0;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTRING = 0x00002cf1;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETSTRING = 0x00002cf2;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBYTES = 0x00002cf3;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBYTES = 0x00002cf4;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETREADSTREAM = 0x00002cf5;
enum DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETWRITESTREAM = 0x00002cf6;
enum DISPID_PRINTERQUEUE = 0x00002d50;
enum DISPID_PRINTERQUEUE_HANDLE = 0x00002d51;
enum DISPID_PRINTERQUEUE_NAME = 0x00002d52;
enum DISPID_PRINTERQUEUE_SENDBIDIQUERY = 0x00002d53;
enum DISPID_PRINTERQUEUE_GETPROPERTIES = 0x00002d54;
enum DISPID_PRINTERQUEUE_SENDBIDISETREQUESTASYNC = 0x00002d55;
enum DISPID_PRINTERQUEUE_GETPRINTERQUEUEVIEW = 0x00002d56;
enum DISPID_PRINTERQUEUEEVENT = 0x00002db4;
enum DISPID_PRINTERQUEUEEVENT_ONBIDIRESPONSERECEIVED = 0x00002db5;
enum DISPID_PRINTEREXTENSION_CONTEXT = 0x00002e18;
enum DISPID_PRINTEREXTENSION_CONTEXT_PRINTERQUEUE = 0x00002e19;
enum DISPID_PRINTEREXTENSION_CONTEXT_PRINTSCHEMATICKET = 0x00002e1a;
enum DISPID_PRINTEREXTENSION_CONTEXT_DRIVERPROPERTIES = 0x00002e1b;
enum DISPID_PRINTEREXTENSION_CONTEXT_USERPROPERTIES = 0x00002e1c;
enum DISPID_PRINTEREXTENSION_REQUEST = 0x00002e7c;
enum DISPID_PRINTEREXTENSION_REQUEST_CANCEL = 0x00002e7d;
enum DISPID_PRINTEREXTENSION_REQUEST_COMPLETE = 0x00002e7e;
enum DISPID_PRINTEREXTENSION_EVENTARGS = 0x00002ee0;
enum DISPID_PRINTEREXTENSION_EVENTARGS_BIDINOTIFICATION = 0x00002ee1;
enum DISPID_PRINTEREXTENSION_EVENTARGS_REASONID = 0x00002ee2;
enum DISPID_PRINTEREXTENSION_EVENTARGS_REQUEST = 0x00002ee3;
enum DISPID_PRINTEREXTENSION_EVENTARGS_SOURCEAPPLICATION = 0x00002ee4;
enum DISPID_PRINTEREXTENSION_EVENTARGS_DETAILEDREASONID = 0x00002ee5;
enum DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWMODAL = 0x00002ee6;
enum DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWPARENT = 0x00002ee7;
enum DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION = 0x00002f44;
enum DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_COUNT = 0x00002f45;
enum DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_GETAT = 0x00002f46;
enum DISPID_PRINTEREXTENSION_EVENT = 0x00002fa8;
enum DISPID_PRINTEREXTENSION_EVENT_ONDRIVEREVENT = 0x00002fa9;
enum DISPID_PRINTEREXTENSION_EVENT_ONPRINTERQUEUESENUMERATED = 0x00002faa;
enum DISPID_PRINTERSCRIPTCONTEXT = 0x0000300c;
enum DISPID_PRINTERSCRIPTCONTEXT_DRIVERPROPERTIES = 0x0000300d;
enum DISPID_PRINTERSCRIPTCONTEXT_QUEUEPROPERTIES = 0x0000300e;
enum DISPID_PRINTERSCRIPTCONTEXT_USERPROPERTIES = 0x0000300f;
enum DISPID_PRINTSCHEMA_PARAMETERINITIALIZER = 0x00003070;
enum DISPID_PRINTSCHEMA_PARAMETERINITIALIZER_VALUE = 0x00003071;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION = 0x000030d4;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION_USERINPUTREQUIRED = 0x000030d5;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION_UNITTYPE = 0x000030d6;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION_DATATYPE = 0x000030d7;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMIN = 0x000030d8;
enum DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMAX = 0x000030d9;
enum DISPID_PRINTJOBCOLLECTION = 0x00003138;
enum DISPID_PRINTJOBCOLLECTION_COUNT = 0x00003139;
enum DISPID_PRINTJOBCOLLECTION_GETAT = 0x0000313a;
enum DISPID_PRINTERQUEUEVIEW = 0x0000319c;
enum DISPID_PRINTERQUEUEVIEW_SETVIEWRANGE = 0x0000319d;
enum DISPID_PRINTERQUEUEVIEW_EVENT = 0x00003200;
enum DISPID_PRINTERQUEUEVIEW_EVENT_ONCHANGED = 0x00003201;
enum NOTIFICATION_RELEASE = GUID(0xba9a5027, 0xa70e, 0x4ae7, [0x9b, 0x7d, 0xeb, 0x3e, 0x6, 0xad, 0x41, 0x57]);
enum PRINT_APP_BIDI_NOTIFY_CHANNEL = GUID(0x2abad223, 0xb994, 0x4aca, [0x82, 0xfc, 0x45, 0x71, 0xb1, 0xb5, 0x85, 0xac]);
enum PRINT_PORT_MONITOR_NOTIFY_CHANNEL = GUID(0x25df3b0e, 0x74a9, 0x47f5, [0x80, 0xce, 0x79, 0xb4, 0xb1, 0xeb, 0x5c, 0x58]);
enum GUID_DEVINTERFACE_USBPRINT = GUID(0x28d78fad, 0x5a12, 0x11d1, [0xae, 0x5b, 0x0, 0x0, 0xf8, 0x3, 0xa8, 0xc2]);
enum GUID_DEVINTERFACE_IPPUSB_PRINT = GUID(0xf2f40381, 0xf46d, 0x4e51, [0xbc, 0xe7, 0x62, 0xde, 0x6c, 0xf2, 0xd0, 0x98]);
enum CLSID_XPSRASTERIZER_FACTORY = GUID(0x503e79bf, 0x1d09, 0x4764, [0x9d, 0x72, 0x1e, 0xb0, 0xc6, 0x59, 0x67, 0xc6]);
enum CLSID_BidiRequest = GUID(0xb9162a23, 0x45f9, 0x47cc, [0x80, 0xf5, 0xfe, 0xf, 0xe9, 0xb9, 0xe1, 0xa2]);
struct BidiRequest
{
}
enum CLSID_BidiRequestContainer = GUID(0xfc5b8a24, 0xdb05, 0x4a01, [0x83, 0x88, 0x22, 0xed, 0xf6, 0xc2, 0xbb, 0xba]);
struct BidiRequestContainer
{
}
enum CLSID_BidiSpl = GUID(0x2a614240, 0xa4c5, 0x4c33, [0xbd, 0x87, 0x1b, 0xc7, 0x9, 0x33, 0x16, 0x39]);
struct BidiSpl
{
}
enum IID_IBidiRequest = GUID(0x8f348bd7, 0x4b47, 0x4755, [0x8a, 0x9d, 0xf, 0x42, 0x2d, 0xf3, 0xdc, 0x89]);
interface IBidiRequest : IUnknown
{
    HRESULT SetSchema(const(wchar)*);
    HRESULT SetInputData(const(uint), const(ubyte)*, const(uint));
    HRESULT GetResult(HRESULT*);
    HRESULT GetOutputData(const(uint), PWSTR*, uint*, ubyte**, uint*);
    HRESULT GetEnumCount(uint*);
}
enum IID_IBidiRequestContainer = GUID(0xd752f6c0, 0x94a8, 0x4275, [0xa7, 0x7d, 0x8f, 0x1d, 0x1a, 0x11, 0x21, 0xae]);
interface IBidiRequestContainer : IUnknown
{
    HRESULT AddRequest(IBidiRequest);
    HRESULT GetEnumObject(IEnumUnknown*);
    HRESULT GetRequestCount(uint*);
}
enum IID_IBidiSpl = GUID(0xd580dc0e, 0xde39, 0x4649, [0xba, 0xa8, 0xbf, 0xb, 0x85, 0xa0, 0x3a, 0x97]);
interface IBidiSpl : IUnknown
{
    HRESULT BindDevice(const(wchar)*, const(uint));
    HRESULT UnbindDevice();
    HRESULT SendRecv(const(wchar)*, IBidiRequest);
    HRESULT MultiSendRecv(const(wchar)*, IBidiRequestContainer);
}
enum IID_IBidiSpl2 = GUID(0xe8f51b8, 0x8273, 0x4906, [0x8e, 0x7b, 0xbe, 0x45, 0x3f, 0xfd, 0x2e, 0x2b]);
interface IBidiSpl2 : IUnknown
{
    HRESULT BindDevice(const(wchar)*, const(uint));
    HRESULT UnbindDevice();
    HRESULT SendRecvXMLString(BSTR, BSTR*);
    HRESULT SendRecvXMLStream(IStream, IStream*);
}
struct ImgErrorInfo
{
    BSTR description;
    GUID guid;
    uint helpContext;
    BSTR helpFile;
    BSTR source;
    BSTR devDescription;
    GUID errorID;
    uint cUserParameters;
    BSTR* aUserParameters;
    BSTR userFallback;
    uint exceptionID;
}
enum IID_IImgErrorInfo = GUID(0x2bce4ece, 0xd30e, 0x445a, [0x94, 0x23, 0x68, 0x29, 0xbe, 0x94, 0x5a, 0xd8]);
interface IImgErrorInfo : IErrorInfo
{
    HRESULT GetDeveloperDescription(BSTR*);
    HRESULT GetUserErrorId(GUID*);
    HRESULT GetUserParameterCount(uint*);
    HRESULT GetUserParameter(uint, BSTR*);
    HRESULT GetUserFallback(BSTR*);
    HRESULT GetExceptionId(uint*);
    HRESULT DetachErrorInfo(ImgErrorInfo*);
}
enum IID_IImgCreateErrorInfo = GUID(0x1c55a64c, 0x7cd, 0x4fb5, [0x90, 0xf7, 0xb7, 0x53, 0xd9, 0x1f, 0xc, 0x9e]);
interface IImgCreateErrorInfo : ICreateErrorInfo
{
    HRESULT AttachToErrorInfo(ImgErrorInfo*);
}
alias EXpsCompressionOptions = int;
enum : int
{
    Compression_NotCompressed = 0x00000000,
    Compression_Normal        = 0x00000001,
    Compression_Small         = 0x00000002,
    Compression_Fast          = 0x00000003,
}

alias EXpsFontOptions = int;
enum : int
{
    Font_Normal      = 0x00000000,
    Font_Obfusticate = 0x00000001,
}

alias EXpsJobConsumption = int;
enum : int
{
    XpsJob_DocumentSequenceAdded = 0x00000000,
    XpsJob_FixedDocumentAdded    = 0x00000001,
    XpsJob_FixedPageAdded        = 0x00000002,
}

alias EXpsFontRestriction = int;
enum : int
{
    Xps_Restricted_Font_Installable  = 0x00000000,
    Xps_Restricted_Font_NoEmbedding  = 0x00000002,
    Xps_Restricted_Font_PreviewPrint = 0x00000004,
    Xps_Restricted_Font_Editable     = 0x00000008,
}

enum IID_IPrintReadStream = GUID(0x4d47a67c, 0x66cc, 0x4430, [0x85, 0xe, 0xda, 0xf4, 0x66, 0xfe, 0x5b, 0xc4]);
interface IPrintReadStream : IUnknown
{
    HRESULT Seek(long, uint, ulong*);
    HRESULT ReadBytes(void*, uint, uint*, BOOL*);
}
enum IID_IPrintWriteStream = GUID(0x65bb7f1b, 0x371e, 0x4571, [0x8a, 0xc7, 0x91, 0x2f, 0x51, 0xc, 0x1a, 0x38]);
interface IPrintWriteStream : IUnknown
{
    HRESULT WriteBytes(const(void)*, uint, uint*);
    void Close();
}
enum IID_IPrintWriteStreamFlush = GUID(0x7d11ff8, 0x1753, 0x4873, [0xb7, 0x49, 0x6c, 0xda, 0xf0, 0x68, 0xe4, 0xc3]);
interface IPrintWriteStreamFlush : IUnknown
{
    HRESULT FlushData();
}
enum IID_IInterFilterCommunicator = GUID(0x4daf1e69, 0x81fd, 0x462d, [0x94, 0xf, 0x8c, 0xd3, 0xdd, 0xf5, 0x6f, 0xca]);
interface IInterFilterCommunicator : IUnknown
{
    HRESULT RequestReader(void**);
    HRESULT RequestWriter(void**);
}
enum IID_IPrintPipelineManagerControl = GUID(0xaa3e4910, 0x5889, 0x4681, [0x91, 0xef, 0x82, 0x3a, 0xd4, 0xed, 0x4e, 0x44]);
interface IPrintPipelineManagerControl : IUnknown
{
    HRESULT RequestShutdown(HRESULT, IImgErrorInfo);
    HRESULT FilterFinished();
}
enum IID_IPrintPipelinePropertyBag = GUID(0x8b8c99dc, 0x7892, 0x4a95, [0x8a, 0x4, 0x57, 0x42, 0x2e, 0x9f, 0xbb, 0x47]);
interface IPrintPipelinePropertyBag : IUnknown
{
    HRESULT AddProperty(const(wchar)*, const(VARIANT)*);
    HRESULT GetProperty(const(wchar)*, VARIANT*);
    BOOL DeleteProperty(const(wchar)*);
}
enum IID_IPrintPipelineProgressReport = GUID(0xedc12c7c, 0xed40, 0x4ea5, [0x96, 0xa6, 0x5e, 0x43, 0x97, 0x49, 0x7a, 0x61]);
interface IPrintPipelineProgressReport : IUnknown
{
    HRESULT ReportProgress(EXpsJobConsumption);
}
enum IID_IPrintClassObjectFactory = GUID(0x9af593dd, 0x9b02, 0x48a8, [0x9b, 0xad, 0x69, 0xac, 0xe4, 0x23, 0xf8, 0x8b]);
interface IPrintClassObjectFactory : IUnknown
{
    HRESULT GetPrintClassObject(const(wchar)*, const(GUID)*, void**);
}
enum IID_IPrintPipelineFilter = GUID(0xcdb62fc0, 0x8bed, 0x434e, [0x86, 0xfb, 0xa2, 0xca, 0xe5, 0x5f, 0x19, 0xea]);
interface IPrintPipelineFilter : IUnknown
{
    HRESULT InitializeFilter(IInterFilterCommunicator, IPrintPipelinePropertyBag, IPrintPipelineManagerControl);
    HRESULT ShutdownOperation();
    HRESULT StartOperation();
}
enum IID_IXpsDocumentProvider = GUID(0xb8cf8530, 0x5562, 0x47c4, [0xab, 0x67, 0xb1, 0xf6, 0x9e, 0xcf, 0x96, 0x1e]);
interface IXpsDocumentProvider : IUnknown
{
    HRESULT GetXpsPart(IUnknown*);
}
enum IID_IXpsDocumentConsumer = GUID(0x4368d8a2, 0x4181, 0x4a9f, [0xb2, 0x95, 0x3d, 0x9a, 0x38, 0xbb, 0x9b, 0xa0]);
interface IXpsDocumentConsumer : IUnknown
{
    HRESULT SendXpsUnknown(IUnknown);
    HRESULT SendXpsDocument(IXpsDocument);
    HRESULT SendFixedDocumentSequence(IFixedDocumentSequence);
    HRESULT SendFixedDocument(IFixedDocument);
    HRESULT SendFixedPage(IFixedPage);
    HRESULT CloseSender();
    HRESULT GetNewEmptyPart(const(wchar)*, const(GUID)*, void**, IPrintWriteStream*);
}
enum IID_IXpsDocument = GUID(0xe8d907db, 0x62a9, 0x4a95, [0xab, 0xe7, 0xe0, 0x17, 0x63, 0xdd, 0x30, 0xf8]);
interface IXpsDocument : IUnknown
{
    HRESULT GetThumbnail(IPartThumbnail*);
    HRESULT SetThumbnail(IPartThumbnail);
}
enum IID_IFixedDocumentSequence = GUID(0x8028d181, 0x2c32, 0x4249, [0x84, 0x93, 0x1b, 0xfb, 0x22, 0x4, 0x55, 0x74]);
interface IFixedDocumentSequence : IUnknown
{
    HRESULT GetUri(BSTR*);
    HRESULT GetPrintTicket(IPartPrintTicket*);
    HRESULT SetPrintTicket(IPartPrintTicket);
}
enum IID_IFixedDocument = GUID(0xf222ca9f, 0x9968, 0x4db9, [0x81, 0xbd, 0xab, 0xae, 0xbf, 0x15, 0xf9, 0x3f]);
interface IFixedDocument : IUnknown
{
    HRESULT GetUri(BSTR*);
    HRESULT GetPrintTicket(IPartPrintTicket*);
    HRESULT SetPrintTicket(IPartPrintTicket);
}
enum IID_IPartBase = GUID(0x36d51e28, 0x369e, 0x43ba, [0xa6, 0x66, 0x95, 0x40, 0xc6, 0x2c, 0x3f, 0x58]);
interface IPartBase : IUnknown
{
    HRESULT GetUri(BSTR*);
    HRESULT GetStream(IPrintReadStream*);
    HRESULT GetPartCompression(EXpsCompressionOptions*);
    HRESULT SetPartCompression(EXpsCompressionOptions);
}
enum IID_IFixedPage = GUID(0x3d9f6448, 0x7e95, 0x4cb5, [0x94, 0xfb, 0x1, 0x80, 0xc2, 0x88, 0x3a, 0x57]);
interface IFixedPage : IPartBase
{
    HRESULT GetPrintTicket(IPartPrintTicket*);
    HRESULT GetPagePart(const(wchar)*, IUnknown*);
    HRESULT GetWriteStream(IPrintWriteStream*);
    HRESULT SetPrintTicket(IPartPrintTicket);
    HRESULT SetPagePart(IUnknown);
    HRESULT DeleteResource(const(wchar)*);
    HRESULT GetXpsPartIterator(IXpsPartIterator*);
}
enum IID_IPartImage = GUID(0x725f2e3c, 0x401a, 0x4705, [0x9d, 0xe0, 0xfe, 0x6f, 0x13, 0x53, 0xb8, 0x7f]);
interface IPartImage : IPartBase
{
    HRESULT GetImageProperties(BSTR*);
    HRESULT SetImageContent(const(wchar)*);
}
enum IID_IPartFont = GUID(0xe07fe0ab, 0x1124, 0x43d0, [0xa8, 0x65, 0xe8, 0xff, 0xb6, 0xa3, 0xea, 0x82]);
interface IPartFont : IPartBase
{
    HRESULT GetFontProperties(BSTR*, EXpsFontOptions*);
    HRESULT SetFontContent(const(wchar)*);
    HRESULT SetFontOptions(EXpsFontOptions);
}
enum IID_IPartFont2 = GUID(0x511e025f, 0xd6cb, 0x43be, [0xbf, 0x65, 0x63, 0xfe, 0x88, 0x51, 0x5a, 0x39]);
interface IPartFont2 : IPartFont
{
    HRESULT GetFontRestriction(EXpsFontRestriction*);
}
enum IID_IPartThumbnail = GUID(0x27ed1c9, 0xba39, 0x4cc5, [0xaa, 0x55, 0x7e, 0xc3, 0xa0, 0xde, 0x17, 0x1a]);
interface IPartThumbnail : IPartBase
{
    HRESULT GetThumbnailProperties(BSTR*);
    HRESULT SetThumbnailContent(const(wchar)*);
}
enum IID_IPartPrintTicket = GUID(0x4a0f50f6, 0xf9a2, 0x41f0, [0x99, 0xe7, 0x5a, 0xe9, 0x55, 0xbe, 0x8e, 0x9e]);
interface IPartPrintTicket : IPartBase
{
}
enum IID_IPartColorProfile = GUID(0x63cca95b, 0x7d18, 0x4762, [0xb1, 0x5e, 0x98, 0x65, 0x86, 0x93, 0xd2, 0x4a]);
interface IPartColorProfile : IPartBase
{
}
enum IID_IPartResourceDictionary = GUID(0x16cfce6d, 0xe744, 0x4fb3, [0xb4, 0x74, 0xf1, 0xd5, 0x4f, 0x2, 0x4a, 0x1]);
interface IPartResourceDictionary : IPartBase
{
}
enum IID_IXpsPartIterator = GUID(0x21d3cd, 0xaf6f, 0x42ab, [0x99, 0x99, 0x14, 0xbc, 0x82, 0xa6, 0x2d, 0x2e]);
interface IXpsPartIterator : IUnknown
{
    void Reset();
    HRESULT Current(BSTR*, IUnknown*);
    BOOL IsDone();
    void Next();
}
enum IID_IPrintReadStreamFactory = GUID(0xacb971e3, 0xdf8d, 0x4fc2, [0xbe, 0xe6, 0x6, 0x9, 0xd1, 0x5f, 0x3c, 0xf9]);
interface IPrintReadStreamFactory : IUnknown
{
    HRESULT GetStream(IPrintReadStream*);
}
enum IID_IPartDiscardControl = GUID(0xcc350c00, 0x95b, 0x42a5, [0xbf, 0xf, 0xc8, 0x78, 0xe, 0xda, 0xdb, 0x3c]);
interface IPartDiscardControl : IUnknown
{
    HRESULT GetDiscardProperties(BSTR*, BSTR*);
}
struct OPTPARAM
{
    ushort cbSize;
    ubyte Flags;
    ubyte Style;
    byte* pData;
    ulong IconID;
    LPARAM lParam;
    ulong[2] dwReserved;
}
struct OPTCOMBO
{
    ushort cbSize;
    ubyte Flags;
    ushort cListItem;
    OPTPARAM* pListItem;
    int Sel;
    uint[3] dwReserved;
}
struct OPTTYPE
{
    ushort cbSize;
    ubyte Type;
    ubyte Flags;
    ushort Count;
    ushort BegCtrlID;
    OPTPARAM* pOptParam;
    ushort Style;
    ushort[3] wReserved;
    ulong[3] dwReserved;
}
struct EXTPUSH
{
    ushort cbSize;
    ushort Flags;
    byte* pTitle;
    union
    {
        DLGPROC DlgProc;
        FARPROC pfnCallBack;
    }
    ulong IconID;
    union
    {
        ushort DlgTemplateID;
        HANDLE hDlgTemplate;
    }
    ulong[3] dwReserved;
}
struct EXTCHKBOX
{
    ushort cbSize;
    ushort Flags;
    byte* pTitle;
    byte* pSeparator;
    byte* pCheckedName;
    ulong IconID;
    ushort[4] wReserved;
    ulong[2] dwReserved;
}
struct OIEXT
{
    ushort cbSize;
    ushort Flags;
    HINSTANCE hInstCaller;
    byte* pHelpFile;
    ulong[4] dwReserved;
}
struct OPTITEM
{
    ushort cbSize;
    ubyte Level;
    ubyte DlgPageIdx;
    uint Flags;
    ulong UserData;
    byte* pName;
    union
    {
        int Sel;
        byte* pSel;
    }
    union
    {
        EXTCHKBOX* pExtChkBox;
        EXTPUSH* pExtPush;
    }
    OPTTYPE* pOptType;
    uint HelpIndex;
    ubyte DMPubID;
    ubyte UserItemID;
    ushort wReserved;
    OIEXT* pOIExt;
    ulong[3] dwReserved;
}
struct CPSUICBPARAM
{
    ushort cbSize;
    ushort Reason;
    HWND hDlg;
    OPTITEM* pOptItem;
    ushort cOptItem;
    ushort Flags;
    OPTITEM* pCurItem;
    union
    {
        int OldSel;
        byte* pOldSel;
    }
    ulong UserData;
    ulong Result;
}
alias _CPSUICALLBACK = int function(CPSUICBPARAM*);
struct DLGPAGE
{
    ushort cbSize;
    ushort Flags;
    DLGPROC DlgProc;
    byte* pTabName;
    ulong IconID;
    union
    {
        ushort DlgTemplateID;
        HANDLE hDlgTemplate;
    }
}
struct COMPROPSHEETUI
{
    ushort cbSize;
    ushort Flags;
    HINSTANCE hInstCaller;
    byte* pCallerName;
    ulong UserData;
    byte* pHelpFile;
    _CPSUICALLBACK pfnCallBack;
    OPTITEM* pOptItem;
    DLGPAGE* pDlgPage;
    ushort cOptItem;
    ushort cDlgPage;
    ulong IconID;
    byte* pOptItemName;
    ushort CallerVersion;
    ushort OptItemVersion;
    ulong[4] dwReserved;
}
struct SETRESULT_INFO
{
    ushort cbSize;
    ushort wReserved;
    HANDLE hSetResult;
    LRESULT Result;
}
struct INSERTPSUIPAGE_INFO
{
    ushort cbSize;
    ubyte Type;
    ubyte Mode;
    ulong dwData1;
    ulong dwData2;
    ulong dwData3;
}
alias PFNCOMPROPSHEET = long function(HANDLE, uint, LPARAM, LPARAM);
struct PSPINFO
{
    ushort cbSize;
    ushort wReserved;
    HANDLE hComPropSheet;
    HANDLE hCPSUIPage;
    PFNCOMPROPSHEET pfnComPropSheet;
}
struct CPSUIDATABLOCK
{
    uint cbData;
    ubyte* pbData;
}
struct PROPSHEETUI_INFO
{
    ushort cbSize;
    ushort Version;
    ushort Flags;
    ushort Reason;
    HANDLE hComPropSheet;
    PFNCOMPROPSHEET pfnComPropSheet;
    LPARAM lParamInit;
    ulong UserData;
    ulong Result;
}
struct PROPSHEETUI_GETICON_INFO
{
    ushort cbSize;
    ushort Flags;
    ushort cxIcon;
    ushort cyIcon;
    HICON hIcon;
}
alias PFNPROPSHEETUI = int function(PROPSHEETUI_INFO*, LPARAM);
struct PROPSHEETUI_INFO_HEADER
{
    ushort cbSize;
    ushort Flags;
    byte* pTitle;
    HWND hWndParent;
    HINSTANCE hInst;
    union
    {
        HICON hIcon;
        ulong IconID;
    }
}
struct PRINTER_INFO_1A
{
    uint Flags;
    PSTR pDescription;
    PSTR pName;
    PSTR pComment;
}
struct PRINTER_INFO_1W
{
    uint Flags;
    PWSTR pDescription;
    PWSTR pName;
    PWSTR pComment;
}
struct PRINTER_INFO_2A
{
    PSTR pServerName;
    PSTR pPrinterName;
    PSTR pShareName;
    PSTR pPortName;
    PSTR pDriverName;
    PSTR pComment;
    PSTR pLocation;
    DEVMODEA* pDevMode;
    PSTR pSepFile;
    PSTR pPrintProcessor;
    PSTR pDatatype;
    PSTR pParameters;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Attributes;
    uint Priority;
    uint DefaultPriority;
    uint StartTime;
    uint UntilTime;
    uint Status;
    uint cJobs;
    uint AveragePPM;
}
struct PRINTER_INFO_2W
{
    PWSTR pServerName;
    PWSTR pPrinterName;
    PWSTR pShareName;
    PWSTR pPortName;
    PWSTR pDriverName;
    PWSTR pComment;
    PWSTR pLocation;
    DEVMODEW* pDevMode;
    PWSTR pSepFile;
    PWSTR pPrintProcessor;
    PWSTR pDatatype;
    PWSTR pParameters;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Attributes;
    uint Priority;
    uint DefaultPriority;
    uint StartTime;
    uint UntilTime;
    uint Status;
    uint cJobs;
    uint AveragePPM;
}
struct PRINTER_INFO_3
{
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
}
struct PRINTER_INFO_4A
{
    PSTR pPrinterName;
    PSTR pServerName;
    uint Attributes;
}
struct PRINTER_INFO_4W
{
    PWSTR pPrinterName;
    PWSTR pServerName;
    uint Attributes;
}
struct PRINTER_INFO_5A
{
    PSTR pPrinterName;
    PSTR pPortName;
    uint Attributes;
    uint DeviceNotSelectedTimeout;
    uint TransmissionRetryTimeout;
}
struct PRINTER_INFO_5W
{
    PWSTR pPrinterName;
    PWSTR pPortName;
    uint Attributes;
    uint DeviceNotSelectedTimeout;
    uint TransmissionRetryTimeout;
}
struct PRINTER_INFO_6
{
    uint dwStatus;
}
struct PRINTER_INFO_7A
{
    PSTR pszObjectGUID;
    uint dwAction;
}
struct PRINTER_INFO_7W
{
    PWSTR pszObjectGUID;
    uint dwAction;
}
struct PRINTER_INFO_8A
{
    DEVMODEA* pDevMode;
}
struct PRINTER_INFO_8W
{
    DEVMODEW* pDevMode;
}
struct PRINTER_INFO_9A
{
    DEVMODEA* pDevMode;
}
struct PRINTER_INFO_9W
{
    DEVMODEW* pDevMode;
}
struct JOB_INFO_1A
{
    uint JobId;
    PSTR pPrinterName;
    PSTR pMachineName;
    PSTR pUserName;
    PSTR pDocument;
    PSTR pDatatype;
    PSTR pStatus;
    uint Status;
    uint Priority;
    uint Position;
    uint TotalPages;
    uint PagesPrinted;
    SYSTEMTIME Submitted;
}
struct JOB_INFO_1W
{
    uint JobId;
    PWSTR pPrinterName;
    PWSTR pMachineName;
    PWSTR pUserName;
    PWSTR pDocument;
    PWSTR pDatatype;
    PWSTR pStatus;
    uint Status;
    uint Priority;
    uint Position;
    uint TotalPages;
    uint PagesPrinted;
    SYSTEMTIME Submitted;
}
struct JOB_INFO_2A
{
    uint JobId;
    PSTR pPrinterName;
    PSTR pMachineName;
    PSTR pUserName;
    PSTR pDocument;
    PSTR pNotifyName;
    PSTR pDatatype;
    PSTR pPrintProcessor;
    PSTR pParameters;
    PSTR pDriverName;
    DEVMODEA* pDevMode;
    PSTR pStatus;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Status;
    uint Priority;
    uint Position;
    uint StartTime;
    uint UntilTime;
    uint TotalPages;
    uint Size;
    SYSTEMTIME Submitted;
    uint Time;
    uint PagesPrinted;
}
struct JOB_INFO_2W
{
    uint JobId;
    PWSTR pPrinterName;
    PWSTR pMachineName;
    PWSTR pUserName;
    PWSTR pDocument;
    PWSTR pNotifyName;
    PWSTR pDatatype;
    PWSTR pPrintProcessor;
    PWSTR pParameters;
    PWSTR pDriverName;
    DEVMODEW* pDevMode;
    PWSTR pStatus;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Status;
    uint Priority;
    uint Position;
    uint StartTime;
    uint UntilTime;
    uint TotalPages;
    uint Size;
    SYSTEMTIME Submitted;
    uint Time;
    uint PagesPrinted;
}
struct JOB_INFO_3
{
    uint JobId;
    uint NextJobId;
    uint Reserved;
}
struct JOB_INFO_4A
{
    uint JobId;
    PSTR pPrinterName;
    PSTR pMachineName;
    PSTR pUserName;
    PSTR pDocument;
    PSTR pNotifyName;
    PSTR pDatatype;
    PSTR pPrintProcessor;
    PSTR pParameters;
    PSTR pDriverName;
    DEVMODEA* pDevMode;
    PSTR pStatus;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Status;
    uint Priority;
    uint Position;
    uint StartTime;
    uint UntilTime;
    uint TotalPages;
    uint Size;
    SYSTEMTIME Submitted;
    uint Time;
    uint PagesPrinted;
    int SizeHigh;
}
struct JOB_INFO_4W
{
    uint JobId;
    PWSTR pPrinterName;
    PWSTR pMachineName;
    PWSTR pUserName;
    PWSTR pDocument;
    PWSTR pNotifyName;
    PWSTR pDatatype;
    PWSTR pPrintProcessor;
    PWSTR pParameters;
    PWSTR pDriverName;
    DEVMODEW* pDevMode;
    PWSTR pStatus;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint Status;
    uint Priority;
    uint Position;
    uint StartTime;
    uint UntilTime;
    uint TotalPages;
    uint Size;
    SYSTEMTIME Submitted;
    uint Time;
    uint PagesPrinted;
    int SizeHigh;
}
struct ADDJOB_INFO_1A
{
    PSTR Path;
    uint JobId;
}
struct ADDJOB_INFO_1W
{
    PWSTR Path;
    uint JobId;
}
struct DRIVER_INFO_1A
{
    PSTR pName;
}
struct DRIVER_INFO_1W
{
    PWSTR pName;
}
struct DRIVER_INFO_2A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
}
struct DRIVER_INFO_2W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
}
struct DRIVER_INFO_3A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
    PSTR pHelpFile;
    PSTR pDependentFiles;
    PSTR pMonitorName;
    PSTR pDefaultDataType;
}
struct DRIVER_INFO_3W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
    PWSTR pHelpFile;
    PWSTR pDependentFiles;
    PWSTR pMonitorName;
    PWSTR pDefaultDataType;
}
struct DRIVER_INFO_4A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
    PSTR pHelpFile;
    PSTR pDependentFiles;
    PSTR pMonitorName;
    PSTR pDefaultDataType;
    PSTR pszzPreviousNames;
}
struct DRIVER_INFO_4W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
    PWSTR pHelpFile;
    PWSTR pDependentFiles;
    PWSTR pMonitorName;
    PWSTR pDefaultDataType;
    PWSTR pszzPreviousNames;
}
struct DRIVER_INFO_5A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
    uint dwDriverAttributes;
    uint dwConfigVersion;
    uint dwDriverVersion;
}
struct DRIVER_INFO_5W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
    uint dwDriverAttributes;
    uint dwConfigVersion;
    uint dwDriverVersion;
}
struct DRIVER_INFO_6A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
    PSTR pHelpFile;
    PSTR pDependentFiles;
    PSTR pMonitorName;
    PSTR pDefaultDataType;
    PSTR pszzPreviousNames;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    PSTR pszMfgName;
    PSTR pszOEMUrl;
    PSTR pszHardwareID;
    PSTR pszProvider;
}
struct DRIVER_INFO_6W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
    PWSTR pHelpFile;
    PWSTR pDependentFiles;
    PWSTR pMonitorName;
    PWSTR pDefaultDataType;
    PWSTR pszzPreviousNames;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    PWSTR pszMfgName;
    PWSTR pszOEMUrl;
    PWSTR pszHardwareID;
    PWSTR pszProvider;
}
struct DRIVER_INFO_8A
{
    uint cVersion;
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDriverPath;
    PSTR pDataFile;
    PSTR pConfigFile;
    PSTR pHelpFile;
    PSTR pDependentFiles;
    PSTR pMonitorName;
    PSTR pDefaultDataType;
    PSTR pszzPreviousNames;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    PSTR pszMfgName;
    PSTR pszOEMUrl;
    PSTR pszHardwareID;
    PSTR pszProvider;
    PSTR pszPrintProcessor;
    PSTR pszVendorSetup;
    PSTR pszzColorProfiles;
    PSTR pszInfPath;
    uint dwPrinterDriverAttributes;
    PSTR pszzCoreDriverDependencies;
    FILETIME ftMinInboxDriverVerDate;
    ulong dwlMinInboxDriverVerVersion;
}
struct DRIVER_INFO_8W
{
    uint cVersion;
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDriverPath;
    PWSTR pDataFile;
    PWSTR pConfigFile;
    PWSTR pHelpFile;
    PWSTR pDependentFiles;
    PWSTR pMonitorName;
    PWSTR pDefaultDataType;
    PWSTR pszzPreviousNames;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    PWSTR pszMfgName;
    PWSTR pszOEMUrl;
    PWSTR pszHardwareID;
    PWSTR pszProvider;
    PWSTR pszPrintProcessor;
    PWSTR pszVendorSetup;
    PWSTR pszzColorProfiles;
    PWSTR pszInfPath;
    uint dwPrinterDriverAttributes;
    PWSTR pszzCoreDriverDependencies;
    FILETIME ftMinInboxDriverVerDate;
    ulong dwlMinInboxDriverVerVersion;
}
struct DOC_INFO_1A
{
    PSTR pDocName;
    PSTR pOutputFile;
    PSTR pDatatype;
}
struct DOC_INFO_1W
{
    PWSTR pDocName;
    PWSTR pOutputFile;
    PWSTR pDatatype;
}
struct FORM_INFO_1A
{
    uint Flags;
    PSTR pName;
    SIZE Size;
    RECTL ImageableArea;
}
struct FORM_INFO_1W
{
    uint Flags;
    PWSTR pName;
    SIZE Size;
    RECTL ImageableArea;
}
struct FORM_INFO_2A
{
    uint Flags;
    const(char)* pName;
    SIZE Size;
    RECTL ImageableArea;
    const(char)* pKeyword;
    uint StringType;
    const(char)* pMuiDll;
    uint dwResourceId;
    const(char)* pDisplayName;
    ushort wLangId;
}
struct FORM_INFO_2W
{
    uint Flags;
    const(wchar)* pName;
    SIZE Size;
    RECTL ImageableArea;
    const(char)* pKeyword;
    uint StringType;
    const(wchar)* pMuiDll;
    uint dwResourceId;
    const(wchar)* pDisplayName;
    ushort wLangId;
}
struct DOC_INFO_2A
{
    PSTR pDocName;
    PSTR pOutputFile;
    PSTR pDatatype;
    uint dwMode;
    uint JobId;
}
struct DOC_INFO_2W
{
    PWSTR pDocName;
    PWSTR pOutputFile;
    PWSTR pDatatype;
    uint dwMode;
    uint JobId;
}
struct DOC_INFO_3A
{
    PSTR pDocName;
    PSTR pOutputFile;
    PSTR pDatatype;
    uint dwFlags;
}
struct DOC_INFO_3W
{
    PWSTR pDocName;
    PWSTR pOutputFile;
    PWSTR pDatatype;
    uint dwFlags;
}
struct PRINTPROCESSOR_INFO_1A
{
    PSTR pName;
}
struct PRINTPROCESSOR_INFO_1W
{
    PWSTR pName;
}
struct PRINTPROCESSOR_CAPS_1
{
    uint dwLevel;
    uint dwNupOptions;
    uint dwPageOrderFlags;
    uint dwNumberOfCopies;
}
struct PRINTPROCESSOR_CAPS_2
{
    uint dwLevel;
    uint dwNupOptions;
    uint dwPageOrderFlags;
    uint dwNumberOfCopies;
    uint dwDuplexHandlingCaps;
    uint dwNupDirectionCaps;
    uint dwNupBorderCaps;
    uint dwBookletHandlingCaps;
    uint dwScalingCaps;
}
struct PORT_INFO_1A
{
    PSTR pName;
}
struct PORT_INFO_1W
{
    PWSTR pName;
}
struct PORT_INFO_2A
{
    PSTR pPortName;
    PSTR pMonitorName;
    PSTR pDescription;
    uint fPortType;
    uint Reserved;
}
struct PORT_INFO_2W
{
    PWSTR pPortName;
    PWSTR pMonitorName;
    PWSTR pDescription;
    uint fPortType;
    uint Reserved;
}
struct PORT_INFO_3A
{
    uint dwStatus;
    PSTR pszStatus;
    uint dwSeverity;
}
struct PORT_INFO_3W
{
    uint dwStatus;
    PWSTR pszStatus;
    uint dwSeverity;
}
struct MONITOR_INFO_1A
{
    PSTR pName;
}
struct MONITOR_INFO_1W
{
    PWSTR pName;
}
struct MONITOR_INFO_2A
{
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDLLName;
}
struct MONITOR_INFO_2W
{
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDLLName;
}
struct DATATYPES_INFO_1A
{
    PSTR pName;
}
struct DATATYPES_INFO_1W
{
    PWSTR pName;
}
struct PRINTER_DEFAULTSA
{
    PSTR pDatatype;
    DEVMODEA* pDevMode;
    PRINTER_ACCESS_RIGHTS DesiredAccess;
}
struct PRINTER_DEFAULTSW
{
    PWSTR pDatatype;
    DEVMODEW* pDevMode;
    PRINTER_ACCESS_RIGHTS DesiredAccess;
}
struct PRINTER_ENUM_VALUESA
{
    PSTR pValueName;
    uint cbValueName;
    uint dwType;
    ubyte* pData;
    uint cbData;
}
struct PRINTER_ENUM_VALUESW
{
    PWSTR pValueName;
    uint cbValueName;
    uint dwType;
    ubyte* pData;
    uint cbData;
}
struct PRINTER_NOTIFY_OPTIONS_TYPE
{
    ushort Type;
    ushort Reserved0;
    uint Reserved1;
    uint Reserved2;
    uint Count;
    ushort* pFields;
}
struct PRINTER_NOTIFY_OPTIONS
{
    uint Version;
    uint Flags;
    uint Count;
    PRINTER_NOTIFY_OPTIONS_TYPE* pTypes;
}
struct PRINTER_NOTIFY_INFO_DATA
{
    ushort Type;
    ushort Field;
    uint Reserved;
    uint Id;
    union _NotifyData_e__Union
    {
        uint[2] adwData;
        struct _Data_e__Struct
        {
            uint cbBuf;
            void* pBuf;
        }
    }
}
struct PRINTER_NOTIFY_INFO
{
    uint Version;
    uint Flags;
    uint Count;
    PRINTER_NOTIFY_INFO_DATA[1] aData;
}
struct BINARY_CONTAINER
{
    uint cbBuf;
    ubyte* pData;
}
struct BIDI_DATA
{
    uint dwBidiType;
    union _u_e__Union
    {
        BOOL bData;
        int iData;
        PWSTR sData;
        float fData;
        BINARY_CONTAINER biData;
    }
}
struct BIDI_REQUEST_DATA
{
    uint dwReqNumber;
    PWSTR pSchema;
    BIDI_DATA data;
}
struct BIDI_REQUEST_CONTAINER
{
    uint Version;
    uint Flags;
    uint Count;
    BIDI_REQUEST_DATA[1] aData;
}
struct BIDI_RESPONSE_DATA
{
    uint dwResult;
    uint dwReqNumber;
    PWSTR pSchema;
    BIDI_DATA data;
}
struct BIDI_RESPONSE_CONTAINER
{
    uint Version;
    uint Flags;
    uint Count;
    BIDI_RESPONSE_DATA[1] aData;
}
alias BIDI_TYPE = int;
enum : int
{
    BIDI_NULL   = 0x00000000,
    BIDI_INT    = 0x00000001,
    BIDI_FLOAT  = 0x00000002,
    BIDI_BOOL   = 0x00000003,
    BIDI_STRING = 0x00000004,
    BIDI_TEXT   = 0x00000005,
    BIDI_ENUM   = 0x00000006,
    BIDI_BLOB   = 0x00000007,
}

struct PROVIDOR_INFO_1A
{
    PSTR pName;
    PSTR pEnvironment;
    PSTR pDLLName;
}
struct PROVIDOR_INFO_1W
{
    PWSTR pName;
    PWSTR pEnvironment;
    PWSTR pDLLName;
}
struct PROVIDOR_INFO_2A
{
    PSTR pOrder;
}
struct PROVIDOR_INFO_2W
{
    PWSTR pOrder;
}
alias PRINTER_OPTION_FLAGS = int;
enum : int
{
    PRINTER_OPTION_NO_CACHE       = 0x00000001,
    PRINTER_OPTION_CACHE          = 0x00000002,
    PRINTER_OPTION_CLIENT_CHANGE  = 0x00000004,
    PRINTER_OPTION_NO_CLIENT_DATA = 0x00000008,
}

struct PRINTER_OPTIONSA
{
    uint cbSize;
    PRINTER_OPTION_FLAGS dwFlags;
}
struct PRINTER_OPTIONSW
{
    uint cbSize;
    PRINTER_OPTION_FLAGS dwFlags;
}
struct PRINTER_CONNECTION_INFO_1A
{
    uint dwFlags;
    PSTR pszDriverName;
}
struct PRINTER_CONNECTION_INFO_1W
{
    uint dwFlags;
    PWSTR pszDriverName;
}
struct CORE_PRINTER_DRIVERA
{
    GUID CoreDriverGUID;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    CHAR[260] szPackageID;
}
struct CORE_PRINTER_DRIVERW
{
    GUID CoreDriverGUID;
    FILETIME ftDriverDate;
    ulong dwlDriverVersion;
    wchar[260] szPackageID;
}
alias EPrintPropertyType = int;
enum : int
{
    kPropertyTypeString              = 0x00000001,
    kPropertyTypeInt32               = 0x00000002,
    kPropertyTypeInt64               = 0x00000003,
    kPropertyTypeByte                = 0x00000004,
    kPropertyTypeTime                = 0x00000005,
    kPropertyTypeDevMode             = 0x00000006,
    kPropertyTypeSD                  = 0x00000007,
    kPropertyTypeNotificationReply   = 0x00000008,
    kPropertyTypeNotificationOptions = 0x00000009,
    kPropertyTypeBuffer              = 0x0000000a,
}

alias EPrintXPSJobProgress = int;
enum : int
{
    kAddingDocumentSequence = 0x00000000,
    kDocumentSequenceAdded  = 0x00000001,
    kAddingFixedDocument    = 0x00000002,
    kFixedDocumentAdded     = 0x00000003,
    kAddingFixedPage        = 0x00000004,
    kFixedPageAdded         = 0x00000005,
    kResourceAdded          = 0x00000006,
    kFontAdded              = 0x00000007,
    kImageAdded             = 0x00000008,
    kXpsDocumentCommitted   = 0x00000009,
}

alias EPrintXPSJobOperation = int;
enum : int
{
    kJobProduction  = 0x00000001,
    kJobConsumption = 0x00000002,
}

struct PrintPropertyValue
{
    EPrintPropertyType ePropertyType;
    union _value_e__Union
    {
        ubyte propertyByte;
        PWSTR propertyString;
        int propertyInt32;
        long propertyInt64;
        struct _propertyBlob_e__Struct
        {
            uint cbBuf;
            void* pBuf;
        }
    }
}
struct PrintNamedProperty
{
    PWSTR propertyName;
    PrintPropertyValue propertyValue;
}
struct PrintPropertiesCollection
{
    uint numberOfProperties;
    PrintNamedProperty* propertiesCollection;
}
alias PRINT_EXECUTION_CONTEXT = int;
enum : int
{
    PRINT_EXECUTION_CONTEXT_APPLICATION            = 0x00000000,
    PRINT_EXECUTION_CONTEXT_SPOOLER_SERVICE        = 0x00000001,
    PRINT_EXECUTION_CONTEXT_SPOOLER_ISOLATION_HOST = 0x00000002,
    PRINT_EXECUTION_CONTEXT_FILTER_PIPELINE        = 0x00000003,
    PRINT_EXECUTION_CONTEXT_WOW64                  = 0x00000004,
}

struct PRINT_EXECUTION_DATA
{
    PRINT_EXECUTION_CONTEXT context;
    uint clientAppPID;
}
alias MxdcLandscapeRotationEnums = int;
enum : int
{
    MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_90_DEGREES  = 0x0000005a,
    MXDC_LANDSCAPE_ROTATE_NONE                         = 0x00000000,
    MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_270_DEGREES = 0xffffffa6,
}

alias MxdcImageTypeEnums = int;
enum : int
{
    MXDC_IMAGETYPE_JPEGHIGH_COMPRESSION   = 0x00000001,
    MXDC_IMAGETYPE_JPEGMEDIUM_COMPRESSION = 0x00000002,
    MXDC_IMAGETYPE_JPEGLOW_COMPRESSION    = 0x00000003,
    MXDC_IMAGETYPE_PNG                    = 0x00000004,
}

struct MxdcEscapeHeader
{
    align (1):
    uint cbInput;
    uint cbOutput;
    uint opCode;
}
struct MxdcGetFileNameData
{
    align (1):
    uint cbOutput;
    wchar[1] wszData;
}
struct MxdcS0PageData
{
    align (1):
    uint dwSize;
    ubyte[1] bData;
}
alias MxdcS0PageEnums = int;
enum : int
{
    MXDC_RESOURCE_TTF            = 0x00000000,
    MXDC_RESOURCE_JPEG           = 0x00000001,
    MXDC_RESOURCE_PNG            = 0x00000002,
    MXDC_RESOURCE_TIFF           = 0x00000003,
    MXDC_RESOURCE_WDP            = 0x00000004,
    MXDC_RESOURCE_DICTIONARY     = 0x00000005,
    MXDC_RESOURCE_ICC_PROFILE    = 0x00000006,
    MXDC_RESOURCE_JPEG_THUMBNAIL = 0x00000007,
    MXDC_RESOURCE_PNG_THUMBNAIL  = 0x00000008,
    MXDC_RESOURCE_MAX            = 0x00000009,
}

struct MxdcXpsS0PageResource
{
    align (1):
    uint dwSize;
    uint dwResourceType;
    ubyte[260] szUri;
    uint dwDataSize;
    ubyte[1] bData;
}
struct MxdcPrintTicketPassthrough
{
    align (1):
    uint dwDataSize;
    ubyte[1] bData;
}
struct MxdcPrintTicketEscape
{
    MxdcEscapeHeader mxdcEscape;
    MxdcPrintTicketPassthrough printTicketData;
}
struct MxdcS0PagePassthroughEscape
{
    MxdcEscapeHeader mxdcEscape;
    MxdcS0PageData xpsS0PageData;
}
struct MxdcS0PageResourceEscape
{
    MxdcEscapeHeader mxdcEscape;
    MxdcXpsS0PageResource xpsS0PageResourcePassthrough;
}
struct DEVICEPROPERTYHEADER
{
    ushort cbSize;
    ushort Flags;
    HANDLE hPrinter;
    byte* pszPrinterName;
}
struct DOCUMENTPROPERTYHEADER
{
    ushort cbSize;
    ushort Reserved;
    HANDLE hPrinter;
    byte* pszPrinterName;
    DEVMODEA* pdmIn;
    DEVMODEA* pdmOut;
    uint cbOut;
    uint fMode;
}
struct DEVQUERYPRINT_INFO
{
    ushort cbSize;
    ushort Level;
    HANDLE hPrinter;
    DEVMODEA* pDevMode;
    PWSTR pszErrorStr;
    uint cchErrorStr;
    uint cchNeeded;
}
struct DRIVER_UPGRADE_INFO_1
{
    byte* pPrinterName;
    byte* pOldDriverDirectory;
}
struct DRIVER_UPGRADE_INFO_2
{
    byte* pPrinterName;
    byte* pOldDriverDirectory;
    uint cVersion;
    byte* pName;
    byte* pEnvironment;
    byte* pDriverPath;
    byte* pDataFile;
    byte* pConfigFile;
    byte* pHelpFile;
    byte* pDependentFiles;
    byte* pMonitorName;
    byte* pDefaultDataType;
    byte* pszzPreviousNames;
}
struct DOCEVENT_FILTER
{
    uint cbSize;
    uint cElementsAllocated;
    uint cElementsNeeded;
    uint cElementsReturned;
    uint[1] aDocEventCall;
}
struct DOCEVENT_CREATEDCPRE
{
    PWSTR pszDriver;
    PWSTR pszDevice;
    DEVMODEW* pdm;
    BOOL bIC;
}
struct DOCEVENT_ESCAPE
{
    int iEscape;
    int cjInput;
    void* pvInData;
}
struct PRINTER_EVENT_ATTRIBUTES_INFO
{
    uint cbSize;
    uint dwOldAttributes;
    uint dwNewAttributes;
}
struct ATTRIBUTE_INFO_1
{
    uint dwJobNumberOfPagesPerSide;
    uint dwDrvNumberOfPagesPerSide;
    uint dwNupBorderFlags;
    uint dwJobPageOrderFlags;
    uint dwDrvPageOrderFlags;
    uint dwJobNumberOfCopies;
    uint dwDrvNumberOfCopies;
}
struct ATTRIBUTE_INFO_2
{
    uint dwJobNumberOfPagesPerSide;
    uint dwDrvNumberOfPagesPerSide;
    uint dwNupBorderFlags;
    uint dwJobPageOrderFlags;
    uint dwDrvPageOrderFlags;
    uint dwJobNumberOfCopies;
    uint dwDrvNumberOfCopies;
    uint dwColorOptimization;
}
struct ATTRIBUTE_INFO_3
{
    uint dwJobNumberOfPagesPerSide;
    uint dwDrvNumberOfPagesPerSide;
    uint dwNupBorderFlags;
    uint dwJobPageOrderFlags;
    uint dwDrvPageOrderFlags;
    uint dwJobNumberOfCopies;
    uint dwDrvNumberOfCopies;
    uint dwColorOptimization;
    short dmPrintQuality;
    short dmYResolution;
}
struct ATTRIBUTE_INFO_4
{
    uint dwJobNumberOfPagesPerSide;
    uint dwDrvNumberOfPagesPerSide;
    uint dwNupBorderFlags;
    uint dwJobPageOrderFlags;
    uint dwDrvPageOrderFlags;
    uint dwJobNumberOfCopies;
    uint dwDrvNumberOfCopies;
    uint dwColorOptimization;
    short dmPrintQuality;
    short dmYResolution;
    uint dwDuplexFlags;
    uint dwNupDirection;
    uint dwBookletFlags;
    uint dwScalingPercentX;
    uint dwScalingPercentY;
}
struct PSCRIPT5_PRIVATE_DEVMODE
{
    ushort[57] wReserved;
    ushort wSize;
}
struct UNIDRV_PRIVATE_DEVMODE
{
    ushort[4] wReserved;
    ushort wSize;
}
struct PUBLISHERINFO
{
    uint dwMode;
    ushort wMinoutlinePPEM;
    ushort wMaxbitmapPPEM;
}
struct OEMDMPARAM
{
    uint cbSize;
    void* pdriverobj;
    HANDLE hPrinter;
    HANDLE hModule;
    DEVMODEA* pPublicDMIn;
    DEVMODEA* pPublicDMOut;
    void* pOEMDMIn;
    void* pOEMDMOut;
    uint cbBufSize;
}
struct OEM_DMEXTRAHEADER
{
    uint dwSize;
    uint dwSignature;
    uint dwVersion;
}
struct USERDATA
{
    uint dwSize;
    ulong dwItemID;
    PSTR pKeyWordName;
    uint[8] dwReserved;
}
alias PFN_DrvGetDriverSetting = BOOL function(void*, const(char)*, void*, uint, uint*, uint*);
alias PFN_DrvUpgradeRegistrySetting = BOOL function(HANDLE, const(char)*, const(char)*);
alias PFN_DrvUpdateUISetting = BOOL function(void*, void*, uint, uint);
struct SIMULATE_CAPS_1
{
    uint dwLevel;
    uint dwPageOrderFlags;
    uint dwNumberOfCopies;
    uint dwCollate;
    uint dwNupOptions;
}
struct OEMUIPROCS
{
    PFN_DrvGetDriverSetting DrvGetDriverSetting;
    PFN_DrvUpdateUISetting DrvUpdateUISetting;
}
struct OEMUIOBJ
{
    uint cbSize;
    OEMUIPROCS* pOemUIProcs;
}
alias OEMCUIPCALLBACK = int function(CPSUICBPARAM*, OEMCUIPPARAM*);
struct OEMCUIPPARAM
{
    uint cbSize;
    OEMUIOBJ* poemuiobj;
    HANDLE hPrinter;
    PWSTR pPrinterName;
    HANDLE hModule;
    HANDLE hOEMHeap;
    DEVMODEA* pPublicDM;
    void* pOEMDM;
    uint dwFlags;
    OPTITEM* pDrvOptItems;
    uint cDrvOptItems;
    OPTITEM* pOEMOptItems;
    uint cOEMOptItems;
    void* pOEMUserData;
    OEMCUIPCALLBACK OEMCUIPCallback;
}
struct OEMUIPSPARAM
{
    uint cbSize;
    OEMUIOBJ* poemuiobj;
    HANDLE hPrinter;
    PWSTR pPrinterName;
    HANDLE hModule;
    HANDLE hOEMHeap;
    DEVMODEA* pPublicDM;
    void* pOEMDM;
    void* pOEMUserData;
    uint dwFlags;
    void* pOemEntry;
}
alias EATTRIBUTE_DATATYPE = int;
enum : int
{
    kADT_UNKNOWN          = 0x00000000,
    kADT_BOOL             = 0x00000001,
    kADT_INT              = 0x00000002,
    kADT_LONG             = 0x00000003,
    kADT_DWORD            = 0x00000004,
    kADT_ASCII            = 0x00000005,
    kADT_UNICODE          = 0x00000006,
    kADT_BINARY           = 0x00000007,
    kADT_SIZE             = 0x00000008,
    kADT_RECT             = 0x00000009,
    kADT_CUSTOMSIZEPARAMS = 0x0000000a,
}

struct CUSTOMSIZEPARAM
{
    int dwOrder;
    int lMinVal;
    int lMaxVal;
}
struct PRINT_FEATURE_OPTION
{
    const(char)* pszFeature;
    const(char)* pszOption;
}
enum IID_IPrintCoreHelper = GUID(0xa89ec53e, 0x3905, 0x49c6, [0x9c, 0x1a, 0xc0, 0xa8, 0x81, 0x17, 0xfd, 0xb6]);
interface IPrintCoreHelper : IUnknown
{
    HRESULT GetOption(const(DEVMODEA)*, uint, const(char)*, PSTR*);
    HRESULT SetOptions(DEVMODEA*, uint, BOOL, const(PRINT_FEATURE_OPTION)*, uint, uint*, uint*);
    HRESULT EnumConstrainedOptions(const(DEVMODEA)*, uint, const(char)*, PSTR***, uint*);
    HRESULT WhyConstrained(const(DEVMODEA)*, uint, const(char)*, const(char)*, const(PRINT_FEATURE_OPTION)**, uint*);
    HRESULT EnumFeatures(PSTR***, uint*);
    HRESULT EnumOptions(const(char)*, PSTR***, uint*);
    HRESULT GetFontSubstitution(const(wchar)*, PWSTR*);
    HRESULT SetFontSubstitution(const(wchar)*, const(wchar)*);
    HRESULT CreateInstanceOfMSXMLObject(const(GUID)*, IUnknown, uint, const(GUID)*, void**);
}
enum IID_IPrintCoreHelperUni = GUID(0x7e8e51d6, 0xe5ee, 0x4426, [0x81, 0x7b, 0x95, 0x8b, 0x94, 0x44, 0xeb, 0x79]);
interface IPrintCoreHelperUni : IPrintCoreHelper
{
    HRESULT CreateGDLSnapshot(DEVMODEA*, uint, uint, IStream*);
    HRESULT CreateDefaultGDLSnapshot(uint, IStream*);
}
enum IID_IPrintCoreHelperUni2 = GUID(0x6c8afdfc, 0xead0, 0x4d2d, [0x80, 0x71, 0x9b, 0xf0, 0x17, 0x5a, 0x6c, 0x3a]);
interface IPrintCoreHelperUni2 : IPrintCoreHelperUni
{
    HRESULT GetNamedCommand(DEVMODEA*, uint, const(wchar)*, ubyte**, uint*);
}
enum IID_IPrintCoreHelperPS = GUID(0xc2c14f6f, 0x95d3, 0x4d63, [0x96, 0xcf, 0x6b, 0xd9, 0xe6, 0xc9, 0x7, 0xc2]);
interface IPrintCoreHelperPS : IPrintCoreHelper
{
    HRESULT GetGlobalAttribute(const(char)*, uint*, ubyte**, uint*);
    HRESULT GetFeatureAttribute(const(char)*, const(char)*, uint*, ubyte**, uint*);
    HRESULT GetOptionAttribute(const(char)*, const(char)*, const(char)*, uint*, ubyte**, uint*);
}
enum IID_IPrintOemCommon = GUID(0x7f42285e, 0x91d5, 0x11d1, [0x88, 0x20, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0xec]);
interface IPrintOemCommon : IUnknown
{
    HRESULT GetInfo(uint, void*, uint, uint*);
    HRESULT DevMode(uint, OEMDMPARAM*);
}
enum IID_IPrintOemUI = GUID(0xc6a7a9d0, 0x774c, 0x11d1, [0x94, 0x7f, 0x0, 0xa0, 0xc9, 0x6, 0x40, 0xb8]);
interface IPrintOemUI : IPrintOemCommon
{
    HRESULT PublishDriverInterface(IUnknown);
    HRESULT CommonUIProp(uint, OEMCUIPPARAM*);
    HRESULT DocumentPropertySheets(PROPSHEETUI_INFO*, LPARAM);
    HRESULT DevicePropertySheets(PROPSHEETUI_INFO*, LPARAM);
    HRESULT DevQueryPrintEx(OEMUIOBJ*, DEVQUERYPRINT_INFO*, DEVMODEA*, void*);
    HRESULT DeviceCapabilitiesA(OEMUIOBJ*, HANDLE, PWSTR, ushort, void*, DEVMODEA*, void*, uint, uint*);
    HRESULT UpgradePrinter(uint, ubyte*);
    HRESULT PrinterEvent(PWSTR, int, uint, LPARAM);
    HRESULT DriverEvent(uint, uint, ubyte*, LPARAM);
    HRESULT QueryColorProfile(HANDLE, OEMUIOBJ*, DEVMODEA*, void*, uint, void*, uint*, uint*);
    HRESULT FontInstallerDlgProc(HWND, uint, WPARAM, LPARAM);
    HRESULT UpdateExternalFonts(HANDLE, HANDLE, PWSTR);
}
enum IID_IPrintOemUI2 = GUID(0x292515f9, 0xb54b, 0x489b, [0x92, 0x75, 0xba, 0xb5, 0x68, 0x21, 0x39, 0x5e]);
interface IPrintOemUI2 : IPrintOemUI
{
    HRESULT QueryJobAttributes(HANDLE, DEVMODEA*, uint, ubyte*);
    HRESULT HideStandardUI(uint);
    HRESULT DocumentEvent(HANDLE, HDC, int, uint, void*, uint, void*, int*);
}
enum IID_IPrintOemUIMXDC = GUID(0x7349d725, 0xe2c1, 0x4dca, [0xaf, 0xb5, 0xc1, 0x3e, 0x91, 0xbc, 0x93, 0x6]);
interface IPrintOemUIMXDC : IUnknown
{
    HRESULT AdjustImageableArea(HANDLE, uint, const(DEVMODEA)*, uint, const(void)*, RECTL*);
    HRESULT AdjustImageCompression(HANDLE, uint, const(DEVMODEA)*, uint, const(void)*, int*);
    HRESULT AdjustDPI(HANDLE, uint, const(DEVMODEA)*, uint, const(void)*, int*);
}
enum IID_IPrintOemDriverUI = GUID(0x92b05d50, 0x78bc, 0x11d1, [0x94, 0x80, 0x0, 0xa0, 0xc9, 0x6, 0x40, 0xb8]);
interface IPrintOemDriverUI : IUnknown
{
    HRESULT DrvGetDriverSetting(void*, const(char)*, void*, uint, uint*, uint*);
    HRESULT DrvUpgradeRegistrySetting(HANDLE, const(char)*, const(char)*);
    HRESULT DrvUpdateUISetting(void*, void*, uint, uint);
}
enum IID_IPrintCoreUI2 = GUID(0x85ccfca, 0x3adf, 0x4c9e, [0xb4, 0x91, 0xd8, 0x51, 0xa6, 0xed, 0xc9, 0x97]);
interface IPrintCoreUI2 : IPrintOemDriverUI
{
    HRESULT GetOptions(OEMUIOBJ*, uint, byte*, uint, PSTR, uint, uint*);
    HRESULT SetOptions(OEMUIOBJ*, uint, byte*, uint, uint*);
    HRESULT EnumConstrainedOptions(OEMUIOBJ*, uint, const(char)*, PSTR, uint, uint*);
    HRESULT WhyConstrained(OEMUIOBJ*, uint, const(char)*, const(char)*, PSTR, uint, uint*);
    HRESULT GetGlobalAttribute(OEMUIOBJ*, uint, const(char)*, uint*, ubyte*, uint, uint*);
    HRESULT GetFeatureAttribute(OEMUIOBJ*, uint, const(char)*, const(char)*, uint*, ubyte*, uint, uint*);
    HRESULT GetOptionAttribute(OEMUIOBJ*, uint, const(char)*, const(char)*, const(char)*, uint*, ubyte*, uint, uint*);
    HRESULT EnumFeatures(OEMUIOBJ*, uint, PSTR, uint, uint*);
    HRESULT EnumOptions(OEMUIOBJ*, uint, const(char)*, PSTR, uint, uint*);
    HRESULT QuerySimulationSupport(HANDLE, uint, ubyte*, uint, uint*);
}
alias SHIMOPTS = int;
enum : int
{
    PTSHIM_DEFAULT    = 0x00000000,
    PTSHIM_NOSNAPSHOT = 0x00000001,
}

enum IID_IPrintTicketProvider = GUID(0xbb5116db, 0xa23, 0x4c3a, [0xa6, 0xb6, 0x89, 0xe5, 0x55, 0x8d, 0xfb, 0x5d]);
interface IPrintTicketProvider : IUnknown
{
    HRESULT GetSupportedVersions(HANDLE, int**, int*);
    HRESULT BindPrinter(HANDLE, int, SHIMOPTS*, uint*, int*, BSTR**);
    HRESULT QueryDeviceNamespace(BSTR*);
    HRESULT ConvertPrintTicketToDevMode(IXMLDOMDocument2, uint, DEVMODEA*, uint*, DEVMODEA**);
    HRESULT ConvertDevModeToPrintTicket(uint, DEVMODEA*, IXMLDOMDocument2);
    HRESULT GetPrintCapabilities(IXMLDOMDocument2, IXMLDOMDocument2*);
    HRESULT ValidatePrintTicket(IXMLDOMDocument2);
}
enum IID_IPrintTicketProvider2 = GUID(0xb8a70ab2, 0x3dfc, 0x4fec, [0xa0, 0x74, 0x51, 0x1b, 0x13, 0xc6, 0x51, 0xcb]);
interface IPrintTicketProvider2 : IPrintTicketProvider
{
    HRESULT GetPrintDeviceCapabilities(IXMLDOMDocument2, IXMLDOMDocument2*);
    HRESULT GetPrintDeviceResources(const(wchar)*, IXMLDOMDocument2, IXMLDOMDocument2*);
}
enum CLSID_PrinterQueue = GUID(0xeb54c230, 0x798c, 0x4c9e, [0xb4, 0x61, 0x29, 0xfa, 0xd0, 0x40, 0x39, 0xb1]);
struct PrinterQueue
{
}
enum CLSID_PrinterQueueView = GUID(0xeb54c231, 0x798c, 0x4c9e, [0xb4, 0x61, 0x29, 0xfa, 0xd0, 0x40, 0x39, 0xb1]);
struct PrinterQueueView
{
}
enum CLSID_PrintSchemaAsyncOperation = GUID(0x43b2f83d, 0x10f2, 0x48ab, [0x83, 0x1b, 0x55, 0xfd, 0xbd, 0xbd, 0x34, 0xa4]);
struct PrintSchemaAsyncOperation
{
}
enum CLSID_PrinterExtensionManager = GUID(0x331b60da, 0x9e90, 0x4dd0, [0x9c, 0x84, 0xea, 0xc4, 0xe6, 0x59, 0xb6, 0x1f]);
struct PrinterExtensionManager
{
}
enum IID_IPrintSchemaElement = GUID(0x724c1646, 0xe64b, 0x4bbf, [0x8e, 0xb4, 0xd4, 0x5e, 0x4f, 0xd5, 0x80, 0xda]);
interface IPrintSchemaElement : IDispatch
{
    HRESULT get_XmlNode(IUnknown*);
    HRESULT get_Name(BSTR*);
    HRESULT get_NamespaceUri(BSTR*);
}
enum IID_IPrintSchemaDisplayableElement = GUID(0xaf45af49, 0xd6aa, 0x407d, [0xbf, 0x87, 0x39, 0x12, 0x23, 0x6e, 0x9d, 0x94]);
interface IPrintSchemaDisplayableElement : IPrintSchemaElement
{
    HRESULT get_DisplayName(BSTR*);
}
alias PrintSchemaConstrainedSetting = int;
enum : int
{
    PrintSchemaConstrainedSetting_None        = 0x00000000,
    PrintSchemaConstrainedSetting_PrintTicket = 0x00000001,
    PrintSchemaConstrainedSetting_Admin       = 0x00000002,
    PrintSchemaConstrainedSetting_Device      = 0x00000003,
}

enum IID_IPrintSchemaOption = GUID(0x66bb2f51, 0x5844, 0x4997, [0x8d, 0x70, 0x4b, 0x7c, 0xc2, 0x21, 0xcf, 0x92]);
interface IPrintSchemaOption : IPrintSchemaDisplayableElement
{
    HRESULT get_Selected(BOOL*);
    HRESULT get_Constrained(PrintSchemaConstrainedSetting*);
    HRESULT GetPropertyValue(BSTR, BSTR, IUnknown*);
}
enum IID_IPrintSchemaPageMediaSizeOption = GUID(0x68746729, 0xf493, 0x4830, [0xa1, 0xf, 0x69, 0x2, 0x87, 0x74, 0x60, 0x5d]);
interface IPrintSchemaPageMediaSizeOption : IPrintSchemaOption
{
    HRESULT get_WidthInMicrons(uint*);
    HRESULT get_HeightInMicrons(uint*);
}
enum IID_IPrintSchemaNUpOption = GUID(0x1f6342f2, 0xd848, 0x42e3, [0x89, 0x95, 0xc1, 0xa, 0x9e, 0xf9, 0xa3, 0xba]);
interface IPrintSchemaNUpOption : IPrintSchemaOption
{
    HRESULT get_PagesPerSheet(uint*);
}
alias PrintSchemaSelectionType = int;
enum : int
{
    PrintSchemaSelectionType_PickOne  = 0x00000000,
    PrintSchemaSelectionType_PickMany = 0x00000001,
}

enum IID_IPrintSchemaOptionCollection = GUID(0xbaecb0bd, 0xa946, 0x4771, [0xbc, 0x30, 0xe8, 0xb2, 0x4f, 0x8d, 0x45, 0xc1]);
interface IPrintSchemaOptionCollection : IDispatch
{
    HRESULT get_Count(uint*);
    HRESULT GetAt(uint, IPrintSchemaOption*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IPrintSchemaFeature = GUID(0xef189461, 0x5d62, 0x4626, [0x8e, 0x57, 0xff, 0x83, 0x58, 0x3c, 0x48, 0x26]);
interface IPrintSchemaFeature : IPrintSchemaDisplayableElement
{
    HRESULT get_SelectedOption(IPrintSchemaOption*);
    HRESULT put_SelectedOption(IPrintSchemaOption);
    HRESULT get_SelectionType(PrintSchemaSelectionType*);
    HRESULT GetOption(BSTR, BSTR, IPrintSchemaOption*);
    HRESULT get_DisplayUI(BOOL*);
}
enum IID_IPrintSchemaPageImageableSize = GUID(0x7c85bf5e, 0xdc7c, 0x4f61, [0x83, 0x9b, 0x41, 0x7, 0xe1, 0xc9, 0xb6, 0x8e]);
interface IPrintSchemaPageImageableSize : IPrintSchemaElement
{
    HRESULT get_ImageableSizeWidthInMicrons(uint*);
    HRESULT get_ImageableSizeHeightInMicrons(uint*);
    HRESULT get_OriginWidthInMicrons(uint*);
    HRESULT get_OriginHeightInMicrons(uint*);
    HRESULT get_ExtentWidthInMicrons(uint*);
    HRESULT get_ExtentHeightInMicrons(uint*);
}
alias PrintSchemaParameterDataType = int;
enum : int
{
    PrintSchemaParameterDataType_Integer       = 0x00000000,
    PrintSchemaParameterDataType_NumericString = 0x00000001,
    PrintSchemaParameterDataType_String        = 0x00000002,
}

enum IID_IPrintSchemaParameterDefinition = GUID(0xb5ade81e, 0xe61, 0x4fe1, [0x81, 0xc6, 0xc3, 0x33, 0xe4, 0xff, 0xe0, 0xf1]);
interface IPrintSchemaParameterDefinition : IPrintSchemaDisplayableElement
{
    HRESULT get_UserInputRequired(BOOL*);
    HRESULT get_UnitType(BSTR*);
    HRESULT get_DataType(PrintSchemaParameterDataType*);
    HRESULT get_RangeMin(int*);
    HRESULT get_RangeMax(int*);
}
enum IID_IPrintSchemaParameterInitializer = GUID(0x52027082, 0xb74, 0x4648, [0x95, 0x64, 0x82, 0x8c, 0xc6, 0xcb, 0x65, 0x6c]);
interface IPrintSchemaParameterInitializer : IPrintSchemaElement
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT*);
}
enum IID_IPrintSchemaCapabilities = GUID(0x5a577640, 0x501d, 0x4927, [0xbc, 0xd0, 0x5e, 0xf5, 0x7a, 0x7e, 0xd1, 0x75]);
interface IPrintSchemaCapabilities : IPrintSchemaElement
{
    HRESULT GetFeatureByKeyName(BSTR, IPrintSchemaFeature*);
    HRESULT GetFeature(BSTR, BSTR, IPrintSchemaFeature*);
    HRESULT get_PageImageableSize(IPrintSchemaPageImageableSize*);
    HRESULT get_JobCopiesAllDocumentsMinValue(uint*);
    HRESULT get_JobCopiesAllDocumentsMaxValue(uint*);
    HRESULT GetSelectedOptionInPrintTicket(IPrintSchemaFeature, IPrintSchemaOption*);
    HRESULT GetOptions(IPrintSchemaFeature, IPrintSchemaOptionCollection*);
}
enum IID_IPrintSchemaCapabilities2 = GUID(0xb58845f4, 0x9970, 0x4d87, [0xa6, 0x36, 0x16, 0x9f, 0xb8, 0x2e, 0xd6, 0x42]);
interface IPrintSchemaCapabilities2 : IPrintSchemaCapabilities
{
    HRESULT GetParameterDefinition(BSTR, BSTR, IPrintSchemaParameterDefinition*);
}
enum IID_IPrintSchemaAsyncOperation = GUID(0x143c8dcb, 0xd37f, 0x47f7, [0x88, 0xe8, 0x6b, 0x1d, 0x21, 0xf2, 0xc5, 0xf7]);
interface IPrintSchemaAsyncOperation : IDispatch
{
    HRESULT Start();
    HRESULT Cancel();
}
enum IID_IPrintSchemaTicket = GUID(0xe480b861, 0x4708, 0x4e6d, [0xa5, 0xb4, 0xa2, 0xb4, 0xee, 0xb9, 0xba, 0xa4]);
interface IPrintSchemaTicket : IPrintSchemaElement
{
    HRESULT GetFeatureByKeyName(BSTR, IPrintSchemaFeature*);
    HRESULT GetFeature(BSTR, BSTR, IPrintSchemaFeature*);
    HRESULT ValidateAsync(IPrintSchemaAsyncOperation*);
    HRESULT CommitAsync(IPrintSchemaTicket, IPrintSchemaAsyncOperation*);
    HRESULT NotifyXmlChanged();
    HRESULT GetCapabilities(IPrintSchemaCapabilities*);
    HRESULT get_JobCopiesAllDocuments(uint*);
    HRESULT put_JobCopiesAllDocuments(uint);
}
enum IID_IPrintSchemaTicket2 = GUID(0x2ec1f844, 0x766a, 0x47a1, [0x91, 0xf4, 0x2e, 0xeb, 0x61, 0x90, 0xf8, 0xc]);
interface IPrintSchemaTicket2 : IPrintSchemaTicket
{
    HRESULT GetParameterInitializer(BSTR, BSTR, IPrintSchemaParameterInitializer*);
}
enum IID_IPrintSchemaAsyncOperationEvent = GUID(0x23adbb16, 0x133, 0x4906, [0xb2, 0x9a, 0x1d, 0xce, 0x1d, 0x2, 0x63, 0x79]);
interface IPrintSchemaAsyncOperationEvent : IDispatch
{
    HRESULT Completed(IPrintSchemaTicket, HRESULT);
}
enum IID_IPrinterScriptableSequentialStream = GUID(0x2072838a, 0x316f, 0x467a, [0xa9, 0x49, 0x27, 0xf6, 0x8c, 0x44, 0xa8, 0x54]);
interface IPrinterScriptableSequentialStream : IDispatch
{
    HRESULT Read(int, IDispatch*);
    HRESULT Write(IDispatch, int*);
}
enum IID_IPrinterScriptableStream = GUID(0x7edf9a92, 0x4750, 0x41a5, [0xa1, 0x7f, 0x87, 0x9a, 0x6f, 0x4f, 0x7d, 0xcb]);
interface IPrinterScriptableStream : IPrinterScriptableSequentialStream
{
    HRESULT Commit();
    HRESULT Seek(int, STREAM_SEEK, int*);
    HRESULT SetSize(int);
}
enum IID_IPrinterPropertyBag = GUID(0xfea77364, 0xdf95, 0x4a23, [0xa9, 0x5, 0x1, 0x9b, 0x79, 0xa8, 0xe4, 0x81]);
interface IPrinterPropertyBag : IDispatch
{
    HRESULT GetBool(BSTR, BOOL*);
    HRESULT SetBool(BSTR, BOOL);
    HRESULT GetInt32(BSTR, int*);
    HRESULT SetInt32(BSTR, int);
    HRESULT GetString(BSTR, BSTR*);
    HRESULT SetString(BSTR, BSTR);
    HRESULT GetBytes(BSTR, uint*, ubyte**);
    HRESULT SetBytes(BSTR, uint, ubyte*);
    HRESULT GetReadStream(BSTR, IStream*);
    HRESULT GetWriteStream(BSTR, IStream*);
}
enum IID_IPrinterScriptablePropertyBag = GUID(0x91c7765f, 0xed57, 0x49ad, [0x8b, 0x1, 0xdc, 0x24, 0x81, 0x6a, 0x52, 0x94]);
interface IPrinterScriptablePropertyBag : IDispatch
{
    HRESULT GetBool(BSTR, BOOL*);
    HRESULT SetBool(BSTR, BOOL);
    HRESULT GetInt32(BSTR, int*);
    HRESULT SetInt32(BSTR, int);
    HRESULT GetString(BSTR, BSTR*);
    HRESULT SetString(BSTR, BSTR);
    HRESULT GetBytes(BSTR, IDispatch*);
    HRESULT SetBytes(BSTR, IDispatch);
    HRESULT GetReadStream(BSTR, IPrinterScriptableStream*);
    HRESULT GetWriteStream(BSTR, IPrinterScriptableStream*);
}
enum IID_IPrinterScriptablePropertyBag2 = GUID(0x2a1c53c4, 0x8638, 0x4b3e, [0xb5, 0x18, 0x27, 0x73, 0xc9, 0x45, 0x56, 0xa3]);
interface IPrinterScriptablePropertyBag2 : IPrinterScriptablePropertyBag
{
    HRESULT GetReadStreamAsXML(BSTR, IUnknown*);
}
enum IID_IPrinterQueue = GUID(0x3580a828, 0x7fe, 0x4b94, [0xac, 0x1a, 0x75, 0x7d, 0x9d, 0x2d, 0x30, 0x56]);
interface IPrinterQueue : IDispatch
{
    HRESULT get_Handle(HANDLE*);
    HRESULT get_Name(BSTR*);
    HRESULT SendBidiQuery(BSTR);
    HRESULT GetProperties(IPrinterPropertyBag*);
}
alias PrintJobStatus = int;
enum : int
{
    PrintJobStatus_Paused             = 0x00000001,
    PrintJobStatus_Error              = 0x00000002,
    PrintJobStatus_Deleting           = 0x00000004,
    PrintJobStatus_Spooling           = 0x00000008,
    PrintJobStatus_Printing           = 0x00000010,
    PrintJobStatus_Offline            = 0x00000020,
    PrintJobStatus_PaperOut           = 0x00000040,
    PrintJobStatus_Printed            = 0x00000080,
    PrintJobStatus_Deleted            = 0x00000100,
    PrintJobStatus_BlockedDeviceQueue = 0x00000200,
    PrintJobStatus_UserIntervention   = 0x00000400,
    PrintJobStatus_Restarted          = 0x00000800,
    PrintJobStatus_Complete           = 0x00001000,
    PrintJobStatus_Retained           = 0x00002000,
}

enum IID_IPrintJob = GUID(0xb771dab8, 0x1282, 0x41b7, [0x85, 0x8c, 0xf2, 0x6, 0xe4, 0xd2, 0x5, 0x77]);
interface IPrintJob : IUnknown
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Id(uint*);
    HRESULT get_PrintedPages(uint*);
    HRESULT get_TotalPages(uint*);
    HRESULT get_Status(PrintJobStatus*);
    HRESULT get_SubmissionTime(double*);
    HRESULT RequestCancel();
}
enum IID_IPrintJobCollection = GUID(0x72b82a24, 0xa598, 0x4e87, [0x89, 0x5f, 0xcd, 0xb2, 0x3a, 0x49, 0xe9, 0xdc]);
interface IPrintJobCollection : IDispatch
{
    HRESULT get_Count(uint*);
    HRESULT GetAt(uint, IPrintJob*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IPrinterQueueViewEvent = GUID(0xc5b6042b, 0xfd21, 0x404a, [0xa0, 0xef, 0xe2, 0xfb, 0xb5, 0x2b, 0x90, 0x80]);
interface IPrinterQueueViewEvent : IDispatch
{
    HRESULT OnChanged(IPrintJobCollection, uint, uint, uint);
}
enum IID_IPrinterQueueView = GUID(0x476e2969, 0x3b2b, 0x4b3f, [0x82, 0x77, 0xcf, 0xf6, 0x5, 0x60, 0x42, 0xaa]);
interface IPrinterQueueView : IDispatch
{
    HRESULT SetViewRange(uint, uint);
}
enum IID_IPrinterQueueEvent = GUID(0x214685f6, 0x7b78, 0x4681, [0x87, 0xe0, 0x49, 0x5f, 0x73, 0x92, 0x73, 0xd1]);
interface IPrinterQueueEvent : IDispatch
{
    HRESULT OnBidiResponseReceived(BSTR, HRESULT);
}
enum IID_IPrinterBidiSetRequestCallback = GUID(0xc52d32dd, 0xf2b4, 0x4052, [0x85, 0x2, 0xec, 0x43, 0x5, 0xec, 0xb7, 0x1f]);
interface IPrinterBidiSetRequestCallback : IUnknown
{
    HRESULT Completed(BSTR, HRESULT);
}
enum IID_IPrinterExtensionAsyncOperation = GUID(0x108d6a23, 0x6a4b, 0x4552, [0x94, 0x48, 0x68, 0xb4, 0x27, 0x18, 0x6a, 0xcd]);
interface IPrinterExtensionAsyncOperation : IUnknown
{
    HRESULT Cancel();
}
enum IID_IPrinterQueue2 = GUID(0x8cd444e8, 0xc9bb, 0x49b3, [0x8e, 0x38, 0xe0, 0x32, 0x9, 0x41, 0x61, 0x31]);
interface IPrinterQueue2 : IPrinterQueue
{
    HRESULT SendBidiSetRequestAsync(BSTR, IPrinterBidiSetRequestCallback, IPrinterExtensionAsyncOperation*);
    HRESULT GetPrinterQueueView(uint, uint, IPrinterQueueView*);
}
enum IID_IPrinterExtensionContext = GUID(0x39843bf2, 0xc4d2, 0x41fd, [0xb4, 0xb2, 0xae, 0xdb, 0xee, 0x5e, 0x19, 0x0]);
interface IPrinterExtensionContext : IDispatch
{
    HRESULT get_PrinterQueue(IPrinterQueue*);
    HRESULT get_PrintSchemaTicket(IPrintSchemaTicket*);
    HRESULT get_DriverProperties(IPrinterPropertyBag*);
    HRESULT get_UserProperties(IPrinterPropertyBag*);
}
enum IID_IPrinterExtensionRequest = GUID(0x39843bf3, 0xc4d2, 0x41fd, [0xb4, 0xb2, 0xae, 0xdb, 0xee, 0x5e, 0x19, 0x0]);
interface IPrinterExtensionRequest : IDispatch
{
    HRESULT Cancel(HRESULT, BSTR);
    HRESULT Complete();
}
enum IID_IPrinterExtensionEventArgs = GUID(0x39843bf4, 0xc4d2, 0x41fd, [0xb4, 0xb2, 0xae, 0xdb, 0xee, 0x5e, 0x19, 0x0]);
interface IPrinterExtensionEventArgs : IPrinterExtensionContext
{
    HRESULT get_BidiNotification(BSTR*);
    HRESULT get_ReasonId(GUID*);
    HRESULT get_Request(IPrinterExtensionRequest*);
    HRESULT get_SourceApplication(BSTR*);
    HRESULT get_DetailedReasonId(GUID*);
    HRESULT get_WindowModal(BOOL*);
    HRESULT get_WindowParent(HANDLE*);
}
enum IID_IPrinterExtensionContextCollection = GUID(0xfb476970, 0x9bab, 0x4861, [0x81, 0x1e, 0x3e, 0x98, 0xb0, 0xc5, 0xad, 0xdf]);
interface IPrinterExtensionContextCollection : IDispatch
{
    HRESULT get_Count(uint*);
    HRESULT GetAt(uint, IPrinterExtensionContext*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IPrinterExtensionEvent = GUID(0xc093cb63, 0x5ef5, 0x4585, [0xaf, 0x8e, 0x4d, 0x56, 0x37, 0x48, 0x7b, 0x57]);
interface IPrinterExtensionEvent : IDispatch
{
    HRESULT OnDriverEvent(IPrinterExtensionEventArgs);
    HRESULT OnPrinterQueuesEnumerated(IPrinterExtensionContextCollection);
}
enum IID_IPrinterExtensionManager = GUID(0x93c6eb8c, 0xb001, 0x4355, [0x96, 0x29, 0x8e, 0x8a, 0x1b, 0x3f, 0x8e, 0x77]);
interface IPrinterExtensionManager : IUnknown
{
    HRESULT EnableEvents(GUID);
    HRESULT DisableEvents();
}
enum IID_IPrinterScriptContext = GUID(0x66acbca, 0x8881, 0x49c9, [0xbb, 0x98, 0xfa, 0xe1, 0x6b, 0x48, 0x89, 0xe1]);
interface IPrinterScriptContext : IDispatch
{
    HRESULT get_DriverProperties(IPrinterScriptablePropertyBag*);
    HRESULT get_QueueProperties(IPrinterScriptablePropertyBag*);
    HRESULT get_UserProperties(IPrinterScriptablePropertyBag*);
}
alias PrintAsyncNotifyUserFilter = int;
enum : int
{
    kPerUser  = 0x00000000,
    kAllUsers = 0x00000001,
}

alias PrintAsyncNotifyConversationStyle = int;
enum : int
{
    kBiDirectional  = 0x00000000,
    kUniDirectional = 0x00000001,
}

enum IID_IPrintAsyncNotifyDataObject = GUID(0x77cf513e, 0x5d49, 0x4789, [0x9f, 0x30, 0xd0, 0x82, 0x2b, 0x33, 0x5c, 0xd]);
interface IPrintAsyncNotifyDataObject : IUnknown
{
    HRESULT AcquireData(ubyte**, uint*, GUID**);
    HRESULT ReleaseData();
}
enum IID_IPrintAsyncNotifyChannel = GUID(0x4a5031b1, 0x1f3f, 0x4db0, [0xa4, 0x62, 0x45, 0x30, 0xed, 0x8b, 0x4, 0x51]);
interface IPrintAsyncNotifyChannel : IUnknown
{
    HRESULT SendNotification(IPrintAsyncNotifyDataObject);
    HRESULT CloseChannel(IPrintAsyncNotifyDataObject);
}
enum IID_IPrintAsyncNotifyCallback = GUID(0x7def34c1, 0x9d92, 0x4c99, [0xb3, 0xb3, 0xdb, 0x94, 0xa9, 0xd4, 0x19, 0x1b]);
interface IPrintAsyncNotifyCallback : IUnknown
{
    HRESULT OnEventNotify(IPrintAsyncNotifyChannel, IPrintAsyncNotifyDataObject);
    HRESULT ChannelClosed(IPrintAsyncNotifyChannel, IPrintAsyncNotifyDataObject);
}
alias PrintAsyncNotifyError = int;
enum : int
{
    CHANNEL_CLOSED_BY_SERVER                = 0x00000001,
    CHANNEL_CLOSED_BY_ANOTHER_LISTENER      = 0x00000002,
    CHANNEL_CLOSED_BY_SAME_LISTENER         = 0x00000003,
    CHANNEL_RELEASED_BY_LISTENER            = 0x00000004,
    UNIRECTIONAL_NOTIFICATION_LOST          = 0x00000005,
    ASYNC_NOTIFICATION_FAILURE              = 0x00000006,
    NO_LISTENERS                            = 0x00000007,
    CHANNEL_ALREADY_CLOSED                  = 0x00000008,
    CHANNEL_ALREADY_OPENED                  = 0x00000009,
    CHANNEL_WAITING_FOR_CLIENT_NOTIFICATION = 0x0000000a,
    CHANNEL_NOT_OPENED                      = 0x0000000b,
    ASYNC_CALL_ALREADY_PARKED               = 0x0000000c,
    NOT_REGISTERED                          = 0x0000000d,
    ALREADY_UNREGISTERED                    = 0x0000000e,
    ALREADY_REGISTERED                      = 0x0000000f,
    CHANNEL_ACQUIRED                        = 0x00000010,
    ASYNC_CALL_IN_PROGRESS                  = 0x00000011,
    MAX_NOTIFICATION_SIZE_EXCEEDED          = 0x00000012,
    INTERNAL_NOTIFICATION_QUEUE_IS_FULL     = 0x00000013,
    INVALID_NOTIFICATION_TYPE               = 0x00000014,
    MAX_REGISTRATION_COUNT_EXCEEDED         = 0x00000015,
    MAX_CHANNEL_COUNT_EXCEEDED              = 0x00000016,
    LOCAL_ONLY_REGISTRATION                 = 0x00000017,
    REMOTE_ONLY_REGISTRATION                = 0x00000018,
}

enum IID_IPrintAsyncNotifyRegistration = GUID(0xf6f27b6, 0x6f86, 0x4591, [0x92, 0x3, 0x64, 0xc3, 0xbf, 0xad, 0xed, 0xfe]);
interface IPrintAsyncNotifyRegistration : IUnknown
{
    HRESULT RegisterForNotifications();
    HRESULT UnregisterForNotifications();
}
enum IID_IPrintAsyncNotify = GUID(0x532818f7, 0x921b, 0x4fb2, [0xbf, 0xf8, 0x2f, 0x4f, 0xd5, 0x2e, 0xbe, 0xbf]);
interface IPrintAsyncNotify : IUnknown
{
    HRESULT CreatePrintAsyncNotifyChannel(uint, GUID*, PrintAsyncNotifyUserFilter, PrintAsyncNotifyConversationStyle, IPrintAsyncNotifyCallback, IPrintAsyncNotifyChannel*);
    HRESULT CreatePrintAsyncNotifyRegistration(GUID*, PrintAsyncNotifyUserFilter, PrintAsyncNotifyConversationStyle, IPrintAsyncNotifyCallback, IPrintAsyncNotifyRegistration*);
}
// [Not Found] IID_IPrintAsyncCookie
interface IPrintAsyncCookie : IUnknown
{
    HRESULT FinishAsyncCall(HRESULT);
    HRESULT CancelAsyncCall(HRESULT);
}
// [Not Found] IID_IPrintAsyncNewChannelCookie
interface IPrintAsyncNewChannelCookie : IPrintAsyncCookie
{
    HRESULT FinishAsyncCallWithData(IPrintAsyncNotifyChannel*, uint);
}
// [Not Found] IID_IAsyncGetSendNotificationCookie
interface IAsyncGetSendNotificationCookie : IPrintAsyncCookie
{
    HRESULT FinishAsyncCallWithData(IPrintAsyncNotifyDataObject, BOOL);
}
// [Not Found] IID_IAsyncGetSrvReferralCookie
interface IAsyncGetSrvReferralCookie : IUnknown
{
    HRESULT FinishAsyncCall(HRESULT);
    HRESULT CancelAsyncCall(HRESULT);
    HRESULT FinishAsyncCallWithData(const(wchar)*);
}
// [Not Found] IID_IPrintBidiAsyncNotifyRegistration
interface IPrintBidiAsyncNotifyRegistration : IPrintAsyncNotifyRegistration
{
    HRESULT AsyncGetNewChannel(IPrintAsyncNewChannelCookie);
}
// [Not Found] IID_IPrintUnidiAsyncNotifyRegistration
interface IPrintUnidiAsyncNotifyRegistration : IPrintAsyncNotifyRegistration
{
    HRESULT AsyncGetNotification(IAsyncGetSendNotificationCookie);
}
// [Not Found] IID_IPrintAsyncNotifyServerReferral
interface IPrintAsyncNotifyServerReferral : IUnknown
{
    HRESULT GetServerReferral(PWSTR*);
    HRESULT AsyncGetServerReferral(IAsyncGetSrvReferralCookie);
    HRESULT SetServerReferral(const(wchar)*);
}
enum IID_IBidiAsyncNotifyChannel = GUID(0x532818f7, 0x921b, 0x4fb2, [0xbf, 0xf8, 0x2f, 0x4f, 0xd5, 0x2e, 0xbe, 0xbf]);
interface IBidiAsyncNotifyChannel : IPrintAsyncNotifyChannel
{
    HRESULT CreateNotificationChannel();
    HRESULT GetPrintName(IPrintAsyncNotifyDataObject*);
    HRESULT GetChannelNotificationType(IPrintAsyncNotifyDataObject*);
    HRESULT AsyncGetNotificationSendResponse(IPrintAsyncNotifyDataObject, IAsyncGetSendNotificationCookie);
    HRESULT AsyncCloseChannel(IPrintAsyncNotifyDataObject, IPrintAsyncCookie);
}
struct UNIFM_HDR
{
    uint dwSize;
    uint dwVersion;
    uint ulDefaultCodepage;
    int lGlyphSetDataRCID;
    uint loUnidrvInfo;
    uint loIFIMetrics;
    uint loExtTextMetric;
    uint loWidthTable;
    uint loKernPair;
    uint[2] dwReserved;
}
struct INVOC
{
    uint dwCount;
    uint loOffset;
}
struct UNIDRVINFO
{
    uint dwSize;
    uint flGenFlags;
    ushort wType;
    ushort fCaps;
    ushort wXRes;
    ushort wYRes;
    short sYAdjust;
    short sYMoved;
    ushort wPrivateData;
    short sShift;
    INVOC SelectFont;
    INVOC UnSelectFont;
    ushort[4] wReserved;
}
struct PRINTIFI32
{
    uint cjThis;
    uint cjIfiExtra;
    int dpwszFamilyName;
    int dpwszStyleName;
    int dpwszFaceName;
    int dpwszUniqueName;
    int dpFontSim;
    int lEmbedId;
    int lItalicAngle;
    int lCharBias;
    int dpCharSets;
    ubyte jWinCharSet;
    ubyte jWinPitchAndFamily;
    ushort usWinWeight;
    uint flInfo;
    ushort fsSelection;
    ushort fsType;
    short fwdUnitsPerEm;
    short fwdLowestPPEm;
    short fwdWinAscender;
    short fwdWinDescender;
    short fwdMacAscender;
    short fwdMacDescender;
    short fwdMacLineGap;
    short fwdTypoAscender;
    short fwdTypoDescender;
    short fwdTypoLineGap;
    short fwdAveCharWidth;
    short fwdMaxCharInc;
    short fwdCapHeight;
    short fwdXHeight;
    short fwdSubscriptXSize;
    short fwdSubscriptYSize;
    short fwdSubscriptXOffset;
    short fwdSubscriptYOffset;
    short fwdSuperscriptXSize;
    short fwdSuperscriptYSize;
    short fwdSuperscriptXOffset;
    short fwdSuperscriptYOffset;
    short fwdUnderscoreSize;
    short fwdUnderscorePosition;
    short fwdStrikeoutSize;
    short fwdStrikeoutPosition;
    ubyte chFirstChar;
    ubyte chLastChar;
    ubyte chDefaultChar;
    ubyte chBreakChar;
    wchar wcFirstChar;
    wchar wcLastChar;
    wchar wcDefaultChar;
    wchar wcBreakChar;
    POINTL ptlBaseline;
    POINTL ptlAspect;
    POINTL ptlCaret;
    RECTL rclFontBox;
    ubyte[4] achVendId;
    uint cKerningPairs;
    uint ulPanoseCulture;
    PANOSE panose;
}
struct EXTTEXTMETRIC
{
    short emSize;
    short emPointSize;
    short emOrientation;
    short emMasterHeight;
    short emMinScale;
    short emMaxScale;
    short emMasterUnits;
    short emCapHeight;
    short emXHeight;
    short emLowerCaseAscent;
    short emLowerCaseDescent;
    short emSlant;
    short emSuperScript;
    short emSubScript;
    short emSuperScriptSize;
    short emSubScriptSize;
    short emUnderlineOffset;
    short emUnderlineWidth;
    short emDoubleUpperUnderlineOffset;
    short emDoubleLowerUnderlineOffset;
    short emDoubleUpperUnderlineWidth;
    short emDoubleLowerUnderlineWidth;
    short emStrikeOutOffset;
    short emStrikeOutWidth;
    ushort emKernPairs;
    ushort emKernTracks;
}
struct WIDTHRUN
{
    ushort wStartGlyph;
    ushort wGlyphCount;
    uint loCharWidthOffset;
}
struct WIDTHTABLE
{
    uint dwSize;
    uint dwRunNum;
    WIDTHRUN[1] WidthRun;
}
struct KERNDATA
{
    uint dwSize;
    uint dwKernPairNum;
    FD_KERNINGPAIR[1] KernPair;
}
struct UNI_GLYPHSETDATA
{
    uint dwSize;
    uint dwVersion;
    uint dwFlags;
    int lPredefinedID;
    uint dwGlyphCount;
    uint dwRunCount;
    uint loRunOffset;
    uint dwCodePageCount;
    uint loCodePageOffset;
    uint loMapTableOffset;
    uint[2] dwReserved;
}
struct UNI_CODEPAGEINFO
{
    uint dwCodePage;
    INVOC SelectSymbolSet;
    INVOC UnSelectSymbolSet;
}
struct GLYPHRUN
{
    wchar wcLow;
    ushort wGlyphCount;
}
struct TRANSDATA
{
    ubyte ubCodePageID;
    ubyte ubType;
    union _uCode_e__Union
    {
        short sCode;
        ubyte ubCode;
        ubyte[2] ubPairs;
    }
}
struct MAPTABLE
{
    uint dwSize;
    uint dwGlyphNum;
    TRANSDATA[1] Trans;
}
struct UFF_FILEHEADER
{
    uint dwSignature;
    uint dwVersion;
    uint dwSize;
    uint nFonts;
    uint nGlyphSets;
    uint nVarData;
    uint offFontDir;
    uint dwFlags;
    uint[4] dwReserved;
}
struct UFF_FONTDIRECTORY
{
    uint dwSignature;
    ushort wSize;
    ushort wFontID;
    short sGlyphID;
    ushort wFlags;
    uint dwInstallerSig;
    uint offFontName;
    uint offCartridgeName;
    uint offFontData;
    uint offGlyphData;
    uint offVarData;
}
struct DATA_HEADER
{
    uint dwSignature;
    ushort wSize;
    ushort wDataID;
    uint dwDataSize;
    uint dwReserved;
}
struct OEMFONTINSTPARAM
{
    uint cbSize;
    HANDLE hPrinter;
    HANDLE hModule;
    HANDLE hHeap;
    uint dwFlags;
    PWSTR pFontInstallerName;
}
struct PORT_DATA_1
{
    wchar[64] sztPortName;
    uint dwVersion;
    uint dwProtocol;
    uint cbSize;
    uint dwReserved;
    wchar[49] sztHostAddress;
    wchar[33] sztSNMPCommunity;
    uint dwDoubleSpool;
    wchar[33] sztQueue;
    wchar[16] sztIPAddress;
    ubyte[540] Reserved;
    uint dwPortNumber;
    uint dwSNMPEnabled;
    uint dwSNMPDevIndex;
}
struct PORT_DATA_2
{
    wchar[64] sztPortName;
    uint dwVersion;
    uint dwProtocol;
    uint cbSize;
    uint dwReserved;
    wchar[128] sztHostAddress;
    wchar[33] sztSNMPCommunity;
    uint dwDoubleSpool;
    wchar[33] sztQueue;
    ubyte[514] Reserved;
    uint dwPortNumber;
    uint dwSNMPEnabled;
    uint dwSNMPDevIndex;
    uint dwPortMonitorMibIndex;
}
struct PORT_DATA_LIST_1
{
    uint dwVersion;
    uint cPortData;
    PORT_DATA_2[1] pPortData;
}
struct DELETE_PORT_DATA_1
{
    wchar[64] psztPortName;
    ubyte[98] Reserved;
    uint dwVersion;
    uint dwReserved;
}
struct CONFIG_INFO_DATA_1
{
    ubyte[128] Reserved;
    uint dwVersion;
}
alias EMFPLAYPROC = int function(HDC, int, HANDLE);
alias EBranchOfficeJobEventType = int;
enum : int
{
    kInvalidJobState     = 0x00000000,
    kLogJobPrinted       = 0x00000001,
    kLogJobRendered      = 0x00000002,
    kLogJobError         = 0x00000003,
    kLogJobPipelineError = 0x00000004,
    kLogOfflineFileFull  = 0x00000005,
}

struct BranchOfficeJobDataPrinted
{
    uint Status;
    PWSTR pDocumentName;
    PWSTR pUserName;
    PWSTR pMachineName;
    PWSTR pPrinterName;
    PWSTR pPortName;
    long Size;
    uint TotalPages;
}
struct BranchOfficeJobDataError
{
    uint LastError;
    PWSTR pDocumentName;
    PWSTR pUserName;
    PWSTR pPrinterName;
    PWSTR pDataType;
    long TotalSize;
    long PrintedSize;
    uint TotalPages;
    uint PrintedPages;
    PWSTR pMachineName;
    PWSTR pJobError;
    PWSTR pErrorDescription;
}
struct BranchOfficeJobDataRendered
{
    long Size;
    uint ICMMethod;
    short Color;
    short PrintQuality;
    short YResolution;
    short Copies;
    short TTOption;
}
struct BranchOfficeJobDataPipelineFailed
{
    PWSTR pDocumentName;
    PWSTR pPrinterName;
    PWSTR pExtraErrorInfo;
}
struct BranchOfficeLogOfflineFileFull
{
    PWSTR pMachineName;
}
struct BranchOfficeJobData
{
    EBranchOfficeJobEventType eEventType;
    uint JobId;
    union _JobInfo_e__Union
    {
        BranchOfficeJobDataPrinted LogJobPrinted;
        BranchOfficeJobDataRendered LogJobRendered;
        BranchOfficeJobDataError LogJobError;
        BranchOfficeJobDataPipelineFailed LogPipelineFailed;
        BranchOfficeLogOfflineFileFull LogOfflineFileFull;
    }
}
struct BranchOfficeJobDataContainer
{
    uint cJobDataEntries;
    BranchOfficeJobData[1] JobData;
}
struct PRINTER_NOTIFY_INIT
{
    uint Size;
    uint Reserved;
    uint PollTime;
}
struct SPLCLIENT_INFO_1
{
    uint dwSize;
    PWSTR pMachineName;
    PWSTR pUserName;
    uint dwBuildNum;
    uint dwMajorVersion;
    uint dwMinorVersion;
    ushort wProcessorArchitecture;
}
struct _SPLCLIENT_INFO_2_V1
{
    ulong hSplPrinter;
}
struct _SPLCLIENT_INFO_2_V2
{
    ulong hSplPrinter;
}
struct _SPLCLIENT_INFO_2_V3
{
    ulong hSplPrinter;
}
struct SPLCLIENT_INFO_3_VISTA
{
    uint cbSize;
    uint dwFlags;
    uint dwSize;
    PWSTR pMachineName;
    PWSTR pUserName;
    uint dwBuildNum;
    uint dwMajorVersion;
    uint dwMinorVersion;
    ushort wProcessorArchitecture;
    ulong hSplPrinter;
}
struct PRINTPROVIDOR
{
    long fpOpenPrinter;
    long fpSetJob;
    long fpGetJob;
    long fpEnumJobs;
    long fpAddPrinter;
    long fpDeletePrinter;
    long fpSetPrinter;
    long fpGetPrinter;
    long fpEnumPrinters;
    long fpAddPrinterDriver;
    long fpEnumPrinterDrivers;
    long fpGetPrinterDriver;
    long fpGetPrinterDriverDirectory;
    long fpDeletePrinterDriver;
    long fpAddPrintProcessor;
    long fpEnumPrintProcessors;
    long fpGetPrintProcessorDirectory;
    long fpDeletePrintProcessor;
    long fpEnumPrintProcessorDatatypes;
    long fpStartDocPrinter;
    long fpStartPagePrinter;
    long fpWritePrinter;
    long fpEndPagePrinter;
    long fpAbortPrinter;
    long fpReadPrinter;
    long fpEndDocPrinter;
    long fpAddJob;
    long fpScheduleJob;
    long fpGetPrinterData;
    long fpSetPrinterData;
    long fpWaitForPrinterChange;
    long fpClosePrinter;
    long fpAddForm;
    long fpDeleteForm;
    long fpGetForm;
    long fpSetForm;
    long fpEnumForms;
    long fpEnumMonitors;
    long fpEnumPorts;
    long fpAddPort;
    long fpConfigurePort;
    long fpDeletePort;
    long fpCreatePrinterIC;
    long fpPlayGdiScriptOnPrinterIC;
    long fpDeletePrinterIC;
    long fpAddPrinterConnection;
    long fpDeletePrinterConnection;
    long fpPrinterMessageBox;
    long fpAddMonitor;
    long fpDeleteMonitor;
    long fpResetPrinter;
    long fpGetPrinterDriverEx;
    long fpFindFirstPrinterChangeNotification;
    long fpFindClosePrinterChangeNotification;
    long fpAddPortEx;
    long fpShutDown;
    long fpRefreshPrinterChangeNotification;
    long fpOpenPrinterEx;
    long fpAddPrinterEx;
    long fpSetPort;
    long fpEnumPrinterData;
    long fpDeletePrinterData;
    long fpClusterSplOpen;
    long fpClusterSplClose;
    long fpClusterSplIsAlive;
    long fpSetPrinterDataEx;
    long fpGetPrinterDataEx;
    long fpEnumPrinterDataEx;
    long fpEnumPrinterKey;
    long fpDeletePrinterDataEx;
    long fpDeletePrinterKey;
    long fpSeekPrinter;
    long fpDeletePrinterDriverEx;
    long fpAddPerMachineConnection;
    long fpDeletePerMachineConnection;
    long fpEnumPerMachineConnections;
    long fpXcvData;
    long fpAddPrinterDriverEx;
    long fpSplReadPrinter;
    long fpDriverUnloadComplete;
    long fpGetSpoolFileInfo;
    long fpCommitSpoolData;
    long fpCloseSpoolFileHandle;
    long fpFlushPrinter;
    long fpSendRecvBidiData;
    long fpAddPrinterConnection2;
    long fpGetPrintClassObject;
    long fpReportJobProcessingProgress;
    long fpEnumAndLogProvidorObjects;
    long fpInternalGetPrinterDriver;
    long fpFindCompatibleDriver;
    long fpGetJobNamedPropertyValue;
    long fpSetJobNamedProperty;
    long fpDeleteJobNamedProperty;
    long fpEnumJobNamedProperties;
    long fpPowerEvent;
    long fpGetUserPropertyBag;
    long fpCanShutdown;
    long fpLogJobInfoForBranchOffice;
    long fpRegeneratePrintDeviceCapabilities;
    long fpPrintSupportOperation;
    long fpIppCreateJobOnPrinter;
    long fpIppGetJobAttributes;
    long fpIppSetJobAttributes;
    long fpIppGetPrinterAttributes;
    long fpIppSetPrinterAttributes;
}
struct PRINTPROCESSOROPENDATA
{
    DEVMODEA* pDevMode;
    PWSTR pDatatype;
    PWSTR pParameters;
    PWSTR pDocumentName;
    uint JobId;
    PWSTR pOutputFile;
    PWSTR pPrinterName;
}
struct MONITORREG
{
    uint cbSize;
    long fpCreateKey;
    long fpOpenKey;
    long fpCloseKey;
    long fpDeleteKey;
    long fpEnumKey;
    long fpQueryInfoKey;
    long fpSetValue;
    long fpDeleteValue;
    long fpEnumValue;
    long fpQueryValue;
}
struct MONITORINIT
{
    uint cbSize;
    HANDLE hSpooler;
    HKEY hckRegistryRoot;
    MONITORREG* pMonitorReg;
    BOOL bLocal;
    const(wchar)* pszServerName;
}
struct MONITOR
{
    long pfnEnumPorts;
    long pfnOpenPort;
    long pfnOpenPortEx;
    long pfnStartDocPort;
    long pfnWritePort;
    long pfnReadPort;
    long pfnEndDocPort;
    long pfnClosePort;
    long pfnAddPort;
    long pfnAddPortEx;
    long pfnConfigurePort;
    long pfnDeletePort;
    long pfnGetPrinterDataFromPort;
    long pfnSetPortTimeOuts;
    long pfnXcvOpenPort;
    long pfnXcvDataPort;
    long pfnXcvClosePort;
}
struct MONITOREX
{
    uint dwMonitorSize;
    MONITOR Monitor;
}
struct MONITOR2
{
    uint cbSize;
    long pfnEnumPorts;
    long pfnOpenPort;
    long pfnOpenPortEx;
    long pfnStartDocPort;
    long pfnWritePort;
    long pfnReadPort;
    long pfnEndDocPort;
    long pfnClosePort;
    long pfnAddPort;
    long pfnAddPortEx;
    long pfnConfigurePort;
    long pfnDeletePort;
    long pfnGetPrinterDataFromPort;
    long pfnSetPortTimeOuts;
    long pfnXcvOpenPort;
    long pfnXcvDataPort;
    long pfnXcvClosePort;
    long pfnShutdown;
    long pfnSendRecvBidiDataFromPort;
    long pfnNotifyUsedPorts;
    long pfnNotifyUnusedPorts;
    long pfnPowerEvent;
}
struct MONITORUI
{
    uint dwMonitorUISize;
    long pfnAddPortUI;
    long pfnConfigurePortUI;
    long pfnDeletePortUI;
}
alias ROUTER_NOTIFY_CALLBACK = BOOL function(uint, void*, uint, PRINTER_NOTIFY_INFO*, uint, uint*);
alias NOTIFICATION_CALLBACK_COMMANDS = int;
enum : int
{
    NOTIFICATION_COMMAND_NOTIFY          = 0x00000000,
    NOTIFICATION_COMMAND_CONTEXT_ACQUIRE = 0x00000001,
    NOTIFICATION_COMMAND_CONTEXT_RELEASE = 0x00000002,
}

struct NOTIFICATION_CONFIG_1
{
    uint cbSize;
    uint fdwFlags;
    ROUTER_NOTIFY_CALLBACK pfnNotifyCallback;
    void* pContext;
}
alias NOTIFICATION_CONFIG_FLAGS = int;
enum : int
{
    NOTIFICATION_CONFIG_CREATE_EVENT      = 0x00000001,
    NOTIFICATION_CONFIG_REGISTER_CALLBACK = 0x00000002,
    NOTIFICATION_CONFIG_EVENT_TRIGGER     = 0x00000004,
    NOTIFICATION_CONFIG_ASYNC_CHANNEL     = 0x00000008,
}

alias UI_TYPE = int;
enum : int
{
    kMessageBox = 0x00000000,
}

struct MESSAGEBOX_PARAMS
{
    uint cbSize;
    PWSTR pTitle;
    PWSTR pMessage;
    uint Style;
    uint dwTimeout;
    BOOL bWait;
}
struct SHOWUIPARAMS
{
    UI_TYPE UIType;
    MESSAGEBOX_PARAMS MessageBoxParams;
}
enum IID_IXpsRasterizerNotificationCallback = GUID(0x9ab8fd0d, 0xcb94, 0x49c2, [0x9c, 0xb0, 0x97, 0xec, 0x1d, 0x54, 0x69, 0xd2]);
interface IXpsRasterizerNotificationCallback : IUnknown
{
    HRESULT Continue();
}
alias XPSRAS_RENDERING_MODE = int;
enum : int
{
    XPSRAS_RENDERING_MODE_ANTIALIASED = 0x00000000,
    XPSRAS_RENDERING_MODE_ALIASED     = 0x00000001,
}

enum IID_IXpsRasterizer = GUID(0x7567cfc8, 0xc156, 0x47a8, [0x9d, 0xac, 0x11, 0xa2, 0xae, 0x5b, 0xdd, 0x6b]);
interface IXpsRasterizer : IUnknown
{
    HRESULT RasterizeRect(int, int, int, int, IXpsRasterizerNotificationCallback, IWICBitmap*);
    HRESULT SetMinimalLineWidth(int);
}
enum IID_IXpsRasterizationFactory = GUID(0xe094808a, 0x24c6, 0x482b, [0xa3, 0xa7, 0xc2, 0x1a, 0xc9, 0xb5, 0x5f, 0x17]);
interface IXpsRasterizationFactory : IUnknown
{
    HRESULT CreateRasterizer(IXpsOMPage, float, XPSRAS_RENDERING_MODE, XPSRAS_RENDERING_MODE, IXpsRasterizer*);
}
alias XPSRAS_PIXEL_FORMAT = int;
enum : int
{
    XPSRAS_PIXEL_FORMAT_32BPP_PBGRA_UINT_SRGB    = 0x00000001,
    XPSRAS_PIXEL_FORMAT_64BPP_PRGBA_HALF_SCRGB   = 0x00000002,
    XPSRAS_PIXEL_FORMAT_128BPP_PRGBA_FLOAT_SCRGB = 0x00000003,
}

enum IID_IXpsRasterizationFactory1 = GUID(0x2d6e5f77, 0x6414, 0x4a1e, [0xa8, 0xe0, 0xd4, 0x19, 0x4c, 0xe6, 0xa2, 0x6f]);
interface IXpsRasterizationFactory1 : IUnknown
{
    HRESULT CreateRasterizer(IXpsOMPage, float, XPSRAS_RENDERING_MODE, XPSRAS_RENDERING_MODE, XPSRAS_PIXEL_FORMAT, IXpsRasterizer*);
}
alias XPSRAS_BACKGROUND_COLOR = int;
enum : int
{
    XPSRAS_BACKGROUND_COLOR_TRANSPARENT = 0x00000000,
    XPSRAS_BACKGROUND_COLOR_OPAQUE      = 0x00000001,
}

enum IID_IXpsRasterizationFactory2 = GUID(0x9c16ce3e, 0x10f5, 0x41fd, [0x9d, 0xdc, 0x68, 0x26, 0x66, 0x9c, 0x2f, 0xf6]);
interface IXpsRasterizationFactory2 : IUnknown
{
    HRESULT CreateRasterizer(IXpsOMPage, float, float, XPSRAS_RENDERING_MODE, XPSRAS_RENDERING_MODE, XPSRAS_PIXEL_FORMAT, XPSRAS_BACKGROUND_COLOR, IXpsRasterizer*);
}
alias PageCountType = int;
enum : int
{
    FinalPageCount        = 0x00000000,
    IntermediatePageCount = 0x00000001,
}

enum IID_IPrintPreviewDxgiPackageTarget = GUID(0x1a6dd0ad, 0x1e2a, 0x4e99, [0xa5, 0xba, 0x91, 0xf1, 0x78, 0x18, 0x29, 0xe]);
interface IPrintPreviewDxgiPackageTarget : IUnknown
{
    HRESULT SetJobPageCount(PageCountType, uint);
    HRESULT DrawPage(uint, IDXGISurface, float, float);
    HRESULT InvalidatePreview();
}
/+ [CONFLICTED] struct _SPLCLIENT_INFO_2_V2
{
    uint hSplPrinter;
}
+/
