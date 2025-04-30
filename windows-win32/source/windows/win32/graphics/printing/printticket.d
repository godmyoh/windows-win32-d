module windows.win32.graphics.printing.printticket;

import windows.win32.foundation : BSTR, HRESULT, PWSTR;
import windows.win32.graphics.gdi : DEVMODEA;
import windows.win32.system.com : IStream;

version (Windows):
extern (Windows):

HRESULT PTQuerySchemaVersionSupport(const(wchar)* pszPrinterName, uint* pMaxVersion);
HRESULT PTOpenProvider(const(wchar)* pszPrinterName, uint dwVersion, HPTPROVIDER* phProvider);
HRESULT PTOpenProviderEx(const(wchar)* pszPrinterName, uint dwMaxVersion, uint dwPrefVersion, HPTPROVIDER* phProvider, uint* pUsedVersion);
HRESULT PTCloseProvider(HPTPROVIDER hProvider);
HRESULT PTReleaseMemory(void* pBuffer);
HRESULT PTGetPrintCapabilities(HPTPROVIDER hProvider, IStream pPrintTicket, IStream pCapabilities, BSTR* pbstrErrorMessage);
HRESULT PTGetPrintDeviceCapabilities(HPTPROVIDER hProvider, IStream pPrintTicket, IStream pDeviceCapabilities, BSTR* pbstrErrorMessage);
HRESULT PTGetPrintDeviceResources(HPTPROVIDER hProvider, const(wchar)* pszLocaleName, IStream pPrintTicket, IStream pDeviceResources, BSTR* pbstrErrorMessage);
HRESULT PTMergeAndValidatePrintTicket(HPTPROVIDER hProvider, IStream pBaseTicket, IStream pDeltaTicket, EPrintTicketScope scope_, IStream pResultTicket, BSTR* pbstrErrorMessage);
HRESULT PTConvertPrintTicketToDevMode(HPTPROVIDER hProvider, IStream pPrintTicket, EDefaultDevmodeType baseDevmodeType, EPrintTicketScope scope_, uint* pcbDevmode, DEVMODEA** ppDevmode, BSTR* pbstrErrorMessage);
HRESULT PTConvertDevModeToPrintTicket(HPTPROVIDER hProvider, uint cbDevmode, DEVMODEA* pDevmode, EPrintTicketScope scope_, IStream pPrintTicket);
enum PRINTTICKET_ISTREAM_APIS = 0x00000001;
enum S_PT_NO_CONFLICT = 0x00040001;
enum S_PT_CONFLICT_RESOLVED = 0x00040002;
enum E_PRINTTICKET_FORMAT = 0x80040003;
enum E_PRINTCAPABILITIES_FORMAT = 0x80040004;
enum E_DELTA_PRINTTICKET_FORMAT = 0x80040005;
enum E_PRINTDEVICECAPABILITIES_FORMAT = 0x80040006;
alias HPTPROVIDER = void*;
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

