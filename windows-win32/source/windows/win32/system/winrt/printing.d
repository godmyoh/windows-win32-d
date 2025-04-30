module windows.win32.system.winrt.printing;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND, PWSTR;
import windows.win32.graphics.printing : IPrinterPropertyBag, IPrinterQueue;
import windows.win32.storage.xps : IXpsDocumentPackageTarget, IXpsOMObjectFactory1, IXpsOMPageReference;
import windows.win32.storage.xps.printing : IPrintDocumentPackageTarget;
import windows.win32.system.com : IStream, IUnknown;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

enum IID_IPrinting3DManagerInterop = GUID(0x9ca31010, 0x1484, 0x4587, [0xb2, 0x6b, 0xdd, 0xdf, 0x9f, 0x9c, 0xae, 0xcd]);
interface IPrinting3DManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND appWindow, const(GUID)* riid, void** printManager);
    HRESULT ShowPrintUIForWindowAsync(HWND appWindow, const(GUID)* riid, void** asyncOperation);
}
enum IID_IPrintManagerInterop = GUID(0xc5435a42, 0x8d43, 0x4e7b, [0xa6, 0x8a, 0xef, 0x31, 0x1e, 0x39, 0x20, 0x87]);
interface IPrintManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND appWindow, const(GUID)* riid, void** printManager);
    HRESULT ShowPrintUIForWindowAsync(HWND appWindow, const(GUID)* riid, void** asyncOperation);
}
enum IID_IPrintPreviewPageCollection = GUID(0xb31cc62, 0xd7ec, 0x4747, [0x9d, 0x6e, 0xf2, 0x53, 0x7d, 0x87, 0xf, 0x2b]);
interface IPrintPreviewPageCollection : IUnknown
{
    HRESULT Paginate(uint currentJobPage, IInspectable printTaskOptions);
    HRESULT MakePage(uint desiredJobPage, float width, float height);
}
enum IID_IPrintDocumentPageSource = GUID(0xa96bb1db, 0x172e, 0x4667, [0x82, 0xb5, 0xad, 0x97, 0xa2, 0x52, 0x31, 0x8f]);
interface IPrintDocumentPageSource : IUnknown
{
    HRESULT GetPreviewPageCollection(IPrintDocumentPackageTarget docPackageTarget, IPrintPreviewPageCollection* docPageCollection);
    HRESULT MakeDocument(IInspectable printTaskOptions, IPrintDocumentPackageTarget docPackageTarget);
}
enum IID_IPrintWorkflowXpsReceiver = GUID(0x4097374, 0x77b8, 0x47f6, [0x81, 0x67, 0xaa, 0xe2, 0x9d, 0x4c, 0xf8, 0x4b]);
interface IPrintWorkflowXpsReceiver : IUnknown
{
    HRESULT SetDocumentSequencePrintTicket(IStream documentSequencePrintTicket);
    HRESULT SetDocumentSequenceUri(const(wchar)* documentSequenceUri);
    HRESULT AddDocumentData(uint documentId, IStream documentPrintTicket, const(wchar)* documentUri);
    HRESULT AddPage(uint documentId, uint pageId, IXpsOMPageReference pageReference, const(wchar)* pageUri);
    HRESULT Close();
}
enum IID_IPrintWorkflowXpsReceiver2 = GUID(0x23bcc0c, 0xdfab, 0x4a61, [0xb0, 0x74, 0x49, 0xc, 0x69, 0x95, 0x58, 0xd]);
interface IPrintWorkflowXpsReceiver2 : IPrintWorkflowXpsReceiver
{
    HRESULT Failed(HRESULT XpsError);
}
enum IID_IPrintWorkflowObjectModelSourceFileContentNative = GUID(0x68c9e477, 0x993e, 0x4052, [0x8a, 0xc6, 0x45, 0x4e, 0xff, 0x58, 0xdb, 0x9d]);
interface IPrintWorkflowObjectModelSourceFileContentNative : IUnknown
{
    HRESULT StartXpsOMGeneration(IPrintWorkflowXpsReceiver receiver);
    HRESULT get_ObjectFactory(IXpsOMObjectFactory1* value);
}
enum IID_IPrintWorkflowXpsObjectModelTargetPackageNative = GUID(0x7d96bc74, 0x9b54, 0x4ca1, [0xad, 0x3a, 0x97, 0x9c, 0x3d, 0x44, 0xdd, 0xac]);
interface IPrintWorkflowXpsObjectModelTargetPackageNative : IUnknown
{
    HRESULT get_DocumentPackageTarget(IXpsDocumentPackageTarget* value);
}
enum IID_IPrintWorkflowConfigurationNative = GUID(0xc056be0a, 0x9ee2, 0x450a, [0x98, 0x23, 0x96, 0x4f, 0x0, 0x6, 0xf2, 0xbb]);
interface IPrintWorkflowConfigurationNative : IUnknown
{
    HRESULT get_PrinterQueue(IPrinterQueue* value);
    HRESULT get_DriverProperties(IPrinterPropertyBag* value);
    HRESULT get_UserProperties(IPrinterPropertyBag* value);
}
