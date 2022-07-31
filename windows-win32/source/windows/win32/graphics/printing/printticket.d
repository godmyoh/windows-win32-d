module windows.win32.graphics.printing.printticket;

import windows.win32.foundation : BSTR, HRESULT, PWSTR;
import windows.win32.graphics.gdi : DEVMODEA;
import windows.win32.storage.xps_ : HPTPROVIDER;
import windows.win32.system.com_ : IStream;

version (Windows):
extern (Windows):

HRESULT PTQuerySchemaVersionSupport(const(wchar)*, uint*);
HRESULT PTOpenProvider(const(wchar)*, uint, HPTPROVIDER*);
HRESULT PTOpenProviderEx(const(wchar)*, uint, uint, HPTPROVIDER*, uint*);
HRESULT PTCloseProvider(HPTPROVIDER);
HRESULT PTReleaseMemory(void*);
HRESULT PTGetPrintCapabilities(HPTPROVIDER, IStream, IStream, BSTR*);
HRESULT PTGetPrintDeviceCapabilities(HPTPROVIDER, IStream, IStream, BSTR*);
HRESULT PTGetPrintDeviceResources(HPTPROVIDER, const(wchar)*, IStream, IStream, BSTR*);
HRESULT PTMergeAndValidatePrintTicket(HPTPROVIDER, IStream, IStream, EPrintTicketScope, IStream, BSTR*);
HRESULT PTConvertPrintTicketToDevMode(HPTPROVIDER, IStream, EDefaultDevmodeType, EPrintTicketScope, uint*, DEVMODEA**, BSTR*);
HRESULT PTConvertDevModeToPrintTicket(HPTPROVIDER, uint, DEVMODEA*, EPrintTicketScope, IStream);
enum PRINTTICKET_ISTREAM_APIS = 0x00000001;
enum S_PT_NO_CONFLICT = 0x00040001;
enum S_PT_CONFLICT_RESOLVED = 0x00040002;
enum E_PRINTTICKET_FORMAT = 0x80040003;
enum E_PRINTCAPABILITIES_FORMAT = 0x80040004;
enum E_DELTA_PRINTTICKET_FORMAT = 0x80040005;
enum E_PRINTDEVICECAPABILITIES_FORMAT = 0x80040006;
alias EDefaultDevmodeType = int;
enum : int
{
    kUserDefaultDevmode    = 0x00000000,
    kPrinterDefaultDevmode = 0x00000001,
}

alias EPrintTicketScope = int;
enum : int
{
    kPTPageScope     = 0x00000000,
    kPTDocumentScope = 0x00000001,
    kPTJobScope      = 0x00000002,
}

