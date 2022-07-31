module windows.win32.storage.xps.printing;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT, PWSTR;
import windows.win32.storage.xps_ : IXpsOMPackageTarget;
import windows.win32.system.com_ : IDispatch, ISequentialStream, IStream, IUnknown;

version (Windows):
extern (Windows):

HRESULT StartXpsPrintJob(const(wchar)*, const(wchar)*, const(wchar)*, HANDLE, HANDLE, ubyte*, uint, IXpsPrintJob*, IXpsPrintJobStream*, IXpsPrintJobStream*);
HRESULT StartXpsPrintJob1(const(wchar)*, const(wchar)*, const(wchar)*, HANDLE, HANDLE, IXpsPrintJob*, IXpsOMPackageTarget*);
enum ID_DOCUMENTPACKAGETARGET_MSXPS = GUID(0x9cae40a8, 0xded1, 0x41c9, [0xa9, 0xfd, 0xd7, 0x35, 0xef, 0x33, 0xae, 0xda]);
enum ID_DOCUMENTPACKAGETARGET_OPENXPS = GUID(0x56bb72, 0x8c9c, 0x4612, [0xbd, 0xf, 0x93, 0x1, 0x2a, 0x87, 0x9, 0x9d]);
enum ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D = GUID(0x63dbd720, 0x8b14, 0x4577, [0xb0, 0x74, 0x7b, 0xb1, 0x1b, 0x59, 0x6d, 0x28]);
alias XPS_JOB_COMPLETION = int;
enum : int
{
    XPS_JOB_IN_PROGRESS = 0x00000000,
    XPS_JOB_COMPLETED   = 0x00000001,
    XPS_JOB_CANCELLED   = 0x00000002,
    XPS_JOB_FAILED      = 0x00000003,
}

struct XPS_JOB_STATUS
{
    uint jobId;
    int currentDocument;
    int currentPage;
    int currentPageTotal;
    XPS_JOB_COMPLETION completion;
    HRESULT jobStatus;
}
enum IID_IXpsPrintJobStream = GUID(0x7a77dc5f, 0x45d6, 0x4dff, [0x93, 0x7, 0xd8, 0xcb, 0x84, 0x63, 0x47, 0xca]);
interface IXpsPrintJobStream : ISequentialStream
{
    HRESULT Close();
}
enum IID_IXpsPrintJob = GUID(0x5ab89b06, 0x8194, 0x425f, [0xab, 0x3b, 0xd7, 0xa9, 0x6e, 0x35, 0x1, 0x61]);
interface IXpsPrintJob : IUnknown
{
    HRESULT Cancel();
    HRESULT GetJobStatus(XPS_JOB_STATUS*);
}
enum CLSID_PrintDocumentPackageTarget = GUID(0x4842669e, 0x9947, 0x46ea, [0x8b, 0xa2, 0xd8, 0xcc, 0xe4, 0x32, 0xc2, 0xca]);
struct PrintDocumentPackageTarget
{
}
enum CLSID_PrintDocumentPackageTargetFactory = GUID(0x348ef17d, 0x6c81, 0x4982, [0x92, 0xb4, 0xee, 0x18, 0x8a, 0x43, 0x86, 0x7a]);
struct PrintDocumentPackageTargetFactory
{
}
enum IID_IPrintDocumentPackageTarget = GUID(0x1b8efec4, 0x3019, 0x4c27, [0x96, 0x4e, 0x36, 0x72, 0x2, 0x15, 0x69, 0x6]);
interface IPrintDocumentPackageTarget : IUnknown
{
    HRESULT GetPackageTargetTypes(uint*, GUID**);
    HRESULT GetPackageTarget(const(GUID)*, const(GUID)*, void**);
    HRESULT Cancel();
}
alias PrintDocumentPackageCompletion = int;
enum : int
{
    PrintDocumentPackageCompletion_InProgress = 0x00000000,
    PrintDocumentPackageCompletion_Completed  = 0x00000001,
    PrintDocumentPackageCompletion_Canceled   = 0x00000002,
    PrintDocumentPackageCompletion_Failed     = 0x00000003,
}

struct PrintDocumentPackageStatus
{
    uint JobId;
    int CurrentDocument;
    int CurrentPage;
    int CurrentPageTotal;
    PrintDocumentPackageCompletion Completion;
    HRESULT PackageStatus;
}
enum IID_IPrintDocumentPackageStatusEvent = GUID(0xed90c8ad, 0x5c34, 0x4d05, [0xa1, 0xec, 0xe, 0x8a, 0x9b, 0x3a, 0xd7, 0xaf]);
interface IPrintDocumentPackageStatusEvent : IDispatch
{
    HRESULT PackageStatusUpdated(PrintDocumentPackageStatus*);
}
enum IID_IPrintDocumentPackageTargetFactory = GUID(0xd2959bf7, 0xb31b, 0x4a3d, [0x96, 0x0, 0x71, 0x2e, 0xb1, 0x33, 0x5b, 0xa4]);
interface IPrintDocumentPackageTargetFactory : IUnknown
{
    HRESULT CreateDocumentPackageTargetForPrintJob(const(wchar)*, const(wchar)*, IStream, IStream, IPrintDocumentPackageTarget*);
}
