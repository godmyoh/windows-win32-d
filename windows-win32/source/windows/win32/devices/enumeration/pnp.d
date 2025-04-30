module windows.win32.devices.enumeration.pnp;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPERTY;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.security : SECURITY_DESCRIPTOR;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

HRESULT SwDeviceCreate(const(wchar)* pszEnumeratorName, const(wchar)* pszParentDeviceInstance, const(SW_DEVICE_CREATE_INFO)* pCreateInfo, uint cPropertyCount, const(DEVPROPERTY)* pProperties, SW_DEVICE_CREATE_CALLBACK pCallback, void* pContext, HSWDEVICE* phSwDevice);
void SwDeviceClose(HSWDEVICE hSwDevice);
HRESULT SwDeviceSetLifetime(HSWDEVICE hSwDevice, SW_DEVICE_LIFETIME Lifetime);
HRESULT SwDeviceGetLifetime(HSWDEVICE hSwDevice, SW_DEVICE_LIFETIME* pLifetime);
HRESULT SwDevicePropertySet(HSWDEVICE hSwDevice, uint cPropertyCount, const(DEVPROPERTY)* pProperties);
HRESULT SwDeviceInterfaceRegister(HSWDEVICE hSwDevice, const(GUID)* pInterfaceClassGuid, const(wchar)* pszReferenceString, uint cPropertyCount, const(DEVPROPERTY)* pProperties, BOOL fEnabled, PWSTR* ppszDeviceInterfaceId);
void SwMemFree(void* pMem);
HRESULT SwDeviceInterfaceSetState(HSWDEVICE hSwDevice, const(wchar)* pszDeviceInterfaceId, BOOL fEnabled);
HRESULT SwDeviceInterfacePropertySet(HSWDEVICE hSwDevice, const(wchar)* pszDeviceInterfaceId, uint cPropertyCount, const(DEVPROPERTY)* pProperties);
enum UPNP_E_ROOT_ELEMENT_EXPECTED = 0xffffffff80040200;
enum UPNP_E_DEVICE_ELEMENT_EXPECTED = 0xffffffff80040201;
enum UPNP_E_SERVICE_ELEMENT_EXPECTED = 0xffffffff80040202;
enum UPNP_E_SERVICE_NODE_INCOMPLETE = 0xffffffff80040203;
enum UPNP_E_DEVICE_NODE_INCOMPLETE = 0xffffffff80040204;
enum UPNP_E_ICON_ELEMENT_EXPECTED = 0xffffffff80040205;
enum UPNP_E_ICON_NODE_INCOMPLETE = 0xffffffff80040206;
enum UPNP_E_INVALID_ACTION = 0xffffffff80040207;
enum UPNP_E_INVALID_ARGUMENTS = 0xffffffff80040208;
enum UPNP_E_OUT_OF_SYNC = 0xffffffff80040209;
enum UPNP_E_ACTION_REQUEST_FAILED = 0xffffffff80040210;
enum UPNP_E_TRANSPORT_ERROR = 0xffffffff80040211;
enum UPNP_E_VARIABLE_VALUE_UNKNOWN = 0xffffffff80040212;
enum UPNP_E_INVALID_VARIABLE = 0xffffffff80040213;
enum UPNP_E_DEVICE_ERROR = 0xffffffff80040214;
enum UPNP_E_PROTOCOL_ERROR = 0xffffffff80040215;
enum UPNP_E_ERROR_PROCESSING_RESPONSE = 0xffffffff80040216;
enum UPNP_E_DEVICE_TIMEOUT = 0xffffffff80040217;
enum UPNP_E_INVALID_DOCUMENT = 0xffffffff80040500;
enum UPNP_E_EVENT_SUBSCRIPTION_FAILED = 0xffffffff80040501;
enum FAULT_INVALID_ACTION = 0x00000191;
enum FAULT_INVALID_ARG = 0x00000192;
enum FAULT_INVALID_SEQUENCE_NUMBER = 0x00000193;
enum FAULT_INVALID_VARIABLE = 0x00000194;
enum FAULT_DEVICE_INTERNAL_ERROR = 0x000001f5;
enum FAULT_ACTION_SPECIFIC_BASE = 0x00000258;
enum FAULT_ACTION_SPECIFIC_MAX = 0x00000383;
enum UPNP_E_ACTION_SPECIFIC_BASE = 0xffffffff80040300;
enum UPNP_ADDRESSFAMILY_IPv4 = 0x00000001;
enum UPNP_ADDRESSFAMILY_IPv6 = 0x00000002;
enum UPNP_ADDRESSFAMILY_BOTH = 0x00000003;
enum UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION = 0x00000001;
enum UPNP_E_REQUIRED_ELEMENT_ERROR = 0xffffffff8004a020;
enum UPNP_E_DUPLICATE_NOT_ALLOWED = 0xffffffff8004a021;
enum UPNP_E_DUPLICATE_SERVICE_ID = 0xffffffff8004a022;
enum UPNP_E_INVALID_DESCRIPTION = 0xffffffff8004a023;
enum UPNP_E_INVALID_SERVICE = 0xffffffff8004a024;
enum UPNP_E_INVALID_ICON = 0xffffffff8004a025;
enum UPNP_E_INVALID_XML = 0xffffffff8004a026;
enum UPNP_E_INVALID_ROOT_NAMESPACE = 0xffffffff8004a027;
enum UPNP_E_SUFFIX_TOO_LONG = 0xffffffff8004a028;
enum UPNP_E_URLBASE_PRESENT = 0xffffffff8004a029;
enum UPNP_E_VALUE_TOO_LONG = 0xffffffff8004a030;
enum UPNP_E_DEVICE_RUNNING = 0xffffffff8004a031;
enum UPNP_E_DEVICE_NOTREGISTERED = 0xffffffff8004a032;
enum REMOTE_ADDRESS_VALUE_NAME = "RemoteAddress";
enum ADDRESS_FAMILY_VALUE_NAME = "AddressFamily";
alias HSWDEVICE = void*;
alias SW_DEVICE_CAPABILITIES = int;
enum : int
{
    SWDeviceCapabilitiesNone           = 0x00000000,
    SWDeviceCapabilitiesRemovable      = 0x00000001,
    SWDeviceCapabilitiesSilentInstall  = 0x00000002,
    SWDeviceCapabilitiesNoDisplayInUI  = 0x00000004,
    SWDeviceCapabilitiesDriverRequired = 0x00000008,
}

struct SW_DEVICE_CREATE_INFO
{
    uint cbSize;
    const(wchar)* pszInstanceId;
    const(wchar)* pszzHardwareIds;
    const(wchar)* pszzCompatibleIds;
    const(GUID)* pContainerId;
    uint CapabilityFlags;
    const(wchar)* pszDeviceDescription;
    const(wchar)* pszDeviceLocation;
    const(SECURITY_DESCRIPTOR)* pSecurityDescriptor;
}
alias SW_DEVICE_LIFETIME = int;
enum : int
{
    SWDeviceLifetimeHandle        = 0x00000000,
    SWDeviceLifetimeParentPresent = 0x00000001,
    SWDeviceLifetimeMax           = 0x00000002,
}

alias SW_DEVICE_CREATE_CALLBACK = void function(HSWDEVICE hSwDevice, HRESULT CreateResult, void* pContext, const(wchar)* pszDeviceInstanceId);
enum IID_IUPnPDeviceFinder = GUID(0xadda3d55, 0x6f72, 0x4319, [0xbf, 0xf9, 0x18, 0x60, 0xa, 0x53, 0x9b, 0x10]);
interface IUPnPDeviceFinder : IDispatch
{
    HRESULT FindByType(BSTR bstrTypeURI, uint dwFlags, IUPnPDevices* pDevices);
    HRESULT CreateAsyncFind(BSTR bstrTypeURI, uint dwFlags, IUnknown punkDeviceFinderCallback, int* plFindData);
    HRESULT StartAsyncFind(int lFindData);
    HRESULT CancelAsyncFind(int lFindData);
    HRESULT FindByUDN(BSTR bstrUDN, IUPnPDevice* pDevice);
}
enum IID_IUPnPAddressFamilyControl = GUID(0xe3bf6178, 0x694e, 0x459f, [0xa5, 0xa6, 0x19, 0x1e, 0xa0, 0xff, 0xa1, 0xc7]);
interface IUPnPAddressFamilyControl : IUnknown
{
    HRESULT SetAddressFamily(int dwFlags);
    HRESULT GetAddressFamily(int* pdwFlags);
}
enum IID_IUPnPHttpHeaderControl = GUID(0x405af4f, 0x8b5c, 0x447c, [0x80, 0xf2, 0xb7, 0x59, 0x84, 0xa3, 0x1f, 0x3c]);
interface IUPnPHttpHeaderControl : IUnknown
{
    HRESULT AddRequestHeaders(BSTR bstrHttpHeaders);
}
enum IID_IUPnPDeviceFinderCallback = GUID(0x415a984a, 0x88b3, 0x49f3, [0x92, 0xaf, 0x5, 0x8, 0xbe, 0xdf, 0xd, 0x6c]);
interface IUPnPDeviceFinderCallback : IUnknown
{
    HRESULT DeviceAdded(int lFindData, IUPnPDevice pDevice);
    HRESULT DeviceRemoved(int lFindData, BSTR bstrUDN);
    HRESULT SearchComplete(int lFindData);
}
enum IID_IUPnPServices = GUID(0x3f8c8e9e, 0x9a7a, 0x4dc8, [0xbc, 0x41, 0xff, 0x31, 0xfa, 0x37, 0x49, 0x56]);
interface IUPnPServices : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get__NewEnum(IUnknown* ppunk);
    HRESULT get_Item(BSTR bstrServiceId, IUPnPService* ppService);
}
enum IID_IUPnPService = GUID(0xa295019c, 0xdc65, 0x47dd, [0x90, 0xdc, 0x7f, 0xe9, 0x18, 0xa1, 0xab, 0x44]);
interface IUPnPService : IDispatch
{
    HRESULT QueryStateVariable(BSTR bstrVariableName, VARIANT* pValue);
    HRESULT InvokeAction(BSTR bstrActionName, VARIANT vInActionArgs, VARIANT* pvOutActionArgs, VARIANT* pvRetVal);
    HRESULT get_ServiceTypeIdentifier(BSTR* pVal);
    HRESULT AddCallback(IUnknown pUnkCallback);
    HRESULT get_Id(BSTR* pbstrId);
    HRESULT get_LastTransportStatus(int* plValue);
}
enum IID_IUPnPAsyncResult = GUID(0x4d65fd08, 0xd13e, 0x4274, [0x9c, 0x8b, 0xdd, 0x8d, 0x2, 0x8c, 0x86, 0x44]);
interface IUPnPAsyncResult : IUnknown
{
    HRESULT AsyncOperationComplete(ulong ullRequestID);
}
enum IID_IUPnPServiceAsync = GUID(0x98bdaf5, 0x5ec1, 0x49e7, [0xa2, 0x60, 0xb3, 0xa1, 0x1d, 0xd8, 0x68, 0xc]);
interface IUPnPServiceAsync : IUnknown
{
    HRESULT BeginInvokeAction(BSTR bstrActionName, VARIANT vInActionArgs, IUPnPAsyncResult pAsyncResult, ulong* pullRequestID);
    HRESULT EndInvokeAction(ulong ullRequestID, VARIANT* pvOutActionArgs, VARIANT* pvRetVal);
    HRESULT BeginQueryStateVariable(BSTR bstrVariableName, IUPnPAsyncResult pAsyncResult, ulong* pullRequestID);
    HRESULT EndQueryStateVariable(ulong ullRequestID, VARIANT* pValue);
    HRESULT BeginSubscribeToEvents(IUnknown pUnkCallback, IUPnPAsyncResult pAsyncResult, ulong* pullRequestID);
    HRESULT EndSubscribeToEvents(ulong ullRequestID);
    HRESULT BeginSCPDDownload(IUPnPAsyncResult pAsyncResult, ulong* pullRequestID);
    HRESULT EndSCPDDownload(ulong ullRequestID, BSTR* pbstrSCPDDoc);
    HRESULT CancelAsyncOperation(ulong ullRequestID);
}
enum IID_IUPnPServiceCallback = GUID(0x31fadca9, 0xab73, 0x464b, [0xb6, 0x7d, 0x5c, 0x1d, 0xf, 0x83, 0xc8, 0xb8]);
interface IUPnPServiceCallback : IUnknown
{
    HRESULT StateVariableChanged(IUPnPService pus, const(wchar)* pcwszStateVarName, VARIANT vaValue);
    HRESULT ServiceInstanceDied(IUPnPService pus);
}
enum IID_IUPnPServiceEnumProperty = GUID(0x38873b37, 0x91bb, 0x49f4, [0xb2, 0x49, 0x2e, 0x8e, 0xfb, 0xb8, 0xa8, 0x16]);
interface IUPnPServiceEnumProperty : IUnknown
{
    HRESULT SetServiceEnumProperty(uint dwMask);
}
enum IID_IUPnPServiceDocumentAccess = GUID(0x21905529, 0xa5e, 0x4589, [0x82, 0x5d, 0x7e, 0x6d, 0x87, 0xea, 0x69, 0x98]);
interface IUPnPServiceDocumentAccess : IUnknown
{
    HRESULT GetDocumentURL(BSTR* pbstrDocUrl);
    HRESULT GetDocument(BSTR* pbstrDoc);
}
enum IID_IUPnPDevices = GUID(0xfdbc0c73, 0xbda3, 0x4c66, [0xac, 0x4f, 0xf2, 0xd9, 0x6f, 0xda, 0xd6, 0x8c]);
interface IUPnPDevices : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get__NewEnum(IUnknown* ppunk);
    HRESULT get_Item(BSTR bstrUDN, IUPnPDevice* ppDevice);
}
enum IID_IUPnPDevice = GUID(0x3d44d0d1, 0x98c9, 0x4889, [0xac, 0xd1, 0xf9, 0xd6, 0x74, 0xbf, 0x22, 0x21]);
interface IUPnPDevice : IDispatch
{
    HRESULT get_IsRootDevice(VARIANT_BOOL* pvarb);
    HRESULT get_RootDevice(IUPnPDevice* ppudRootDevice);
    HRESULT get_ParentDevice(IUPnPDevice* ppudDeviceParent);
    HRESULT get_HasChildren(VARIANT_BOOL* pvarb);
    HRESULT get_Children(IUPnPDevices* ppudChildren);
    HRESULT get_UniqueDeviceName(BSTR* pbstr);
    HRESULT get_FriendlyName(BSTR* pbstr);
    HRESULT get_Type(BSTR* pbstr);
    HRESULT get_PresentationURL(BSTR* pbstr);
    HRESULT get_ManufacturerName(BSTR* pbstr);
    HRESULT get_ManufacturerURL(BSTR* pbstr);
    HRESULT get_ModelName(BSTR* pbstr);
    HRESULT get_ModelNumber(BSTR* pbstr);
    HRESULT get_Description(BSTR* pbstr);
    HRESULT get_ModelURL(BSTR* pbstr);
    HRESULT get_UPC(BSTR* pbstr);
    HRESULT get_SerialNumber(BSTR* pbstr);
    HRESULT IconURL(BSTR bstrEncodingFormat, int lSizeX, int lSizeY, int lBitDepth, BSTR* pbstrIconURL);
    HRESULT get_Services(IUPnPServices* ppusServices);
}
enum IID_IUPnPDeviceDocumentAccess = GUID(0xe7772804, 0x3287, 0x418e, [0x90, 0x72, 0xcf, 0x2b, 0x47, 0x23, 0x89, 0x81]);
interface IUPnPDeviceDocumentAccess : IUnknown
{
    HRESULT GetDocumentURL(BSTR* pbstrDocument);
}
enum IID_IUPnPDeviceDocumentAccessEx = GUID(0xc4bc4050, 0x6178, 0x4bd1, [0xa4, 0xb8, 0x63, 0x98, 0x32, 0x1f, 0x32, 0x47]);
interface IUPnPDeviceDocumentAccessEx : IUnknown
{
    HRESULT GetDocument(BSTR* pbstrDocument);
}
enum IID_IUPnPDescriptionDocument = GUID(0x11d1c1b2, 0x7daa, 0x4c9e, [0x95, 0x95, 0x7f, 0x82, 0xed, 0x20, 0x6d, 0x1e]);
interface IUPnPDescriptionDocument : IDispatch
{
    HRESULT get_ReadyState(int* plReadyState);
    HRESULT Load(BSTR bstrUrl);
    HRESULT LoadAsync(BSTR bstrUrl, IUnknown punkCallback);
    HRESULT get_LoadResult(int* phrError);
    HRESULT Abort();
    HRESULT RootDevice(IUPnPDevice* ppudRootDevice);
    HRESULT DeviceByUDN(BSTR bstrUDN, IUPnPDevice* ppudDevice);
}
enum IID_IUPnPDeviceFinderAddCallbackWithInterface = GUID(0x983dfc0b, 0x1796, 0x44df, [0x89, 0x75, 0xca, 0x54, 0x5b, 0x62, 0xe, 0xe5]);
interface IUPnPDeviceFinderAddCallbackWithInterface : IUnknown
{
    HRESULT DeviceAddedWithInterface(int lFindData, IUPnPDevice pDevice, GUID* pguidInterface);
}
enum IID_IUPnPDescriptionDocumentCallback = GUID(0x77394c69, 0x5486, 0x40d6, [0x9b, 0xc3, 0x49, 0x91, 0x98, 0x3e, 0x2, 0xda]);
interface IUPnPDescriptionDocumentCallback : IUnknown
{
    HRESULT LoadComplete(HRESULT hrLoadResult);
}
enum CLSID_UPnPDeviceFinder = GUID(0xe2085f28, 0xfeb7, 0x404a, [0xb8, 0xe7, 0xe6, 0x59, 0xbd, 0xea, 0xaa, 0x2]);
struct UPnPDeviceFinder
{
}
enum CLSID_UPnPDevices = GUID(0xb9e84ffd, 0xad3c, 0x40a4, [0xb8, 0x35, 0x8, 0x82, 0xeb, 0xcb, 0xaa, 0xa8]);
struct UPnPDevices
{
}
enum CLSID_UPnPDevice = GUID(0xa32552c5, 0xba61, 0x457a, [0xb5, 0x9a, 0xa2, 0x56, 0x1e, 0x12, 0x5e, 0x33]);
struct UPnPDevice
{
}
enum CLSID_UPnPServices = GUID(0xc0bc4b4a, 0xa406, 0x4efc, [0x93, 0x2f, 0xb8, 0x54, 0x6b, 0x81, 0x0, 0xcc]);
struct UPnPServices
{
}
enum CLSID_UPnPService = GUID(0xc624ba95, 0xfbcb, 0x4409, [0x8c, 0x3, 0x8c, 0xce, 0xec, 0x53, 0x3e, 0xf1]);
struct UPnPService
{
}
enum CLSID_UPnPDescriptionDocument = GUID(0x1d8a9b47, 0x3a28, 0x4ce2, [0x8a, 0x4b, 0xbd, 0x34, 0xe4, 0x5b, 0xce, 0xeb]);
struct UPnPDescriptionDocument
{
}
enum CLSID_UPnPDeviceFinderEx = GUID(0x181b54fc, 0x380b, 0x4a75, [0xb3, 0xf1, 0x4a, 0xc4, 0x5e, 0x96, 0x5, 0xb0]);
struct UPnPDeviceFinderEx
{
}
enum CLSID_UPnPDescriptionDocumentEx = GUID(0x33fd0563, 0xd81a, 0x4393, [0x83, 0xcc, 0x1, 0x95, 0xb1, 0xda, 0x2f, 0x91]);
struct UPnPDescriptionDocumentEx
{
}
enum IID_IUPnPEventSink = GUID(0x204810b4, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPEventSink : IUnknown
{
    HRESULT OnStateChanged(uint cChanges, int* rgdispidChanges);
    HRESULT OnStateChangedSafe(VARIANT varsadispidChanges);
}
enum IID_IUPnPEventSource = GUID(0x204810b5, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPEventSource : IUnknown
{
    HRESULT Advise(IUPnPEventSink pesSubscriber);
    HRESULT Unadvise(IUPnPEventSink pesSubscriber);
}
enum IID_IUPnPRegistrar = GUID(0x204810b6, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPRegistrar : IUnknown
{
    HRESULT RegisterDevice(BSTR bstrXMLDesc, BSTR bstrProgIDDeviceControlClass, BSTR bstrInitString, BSTR bstrContainerId, BSTR bstrResourcePath, int nLifeTime, BSTR* pbstrDeviceIdentifier);
    HRESULT RegisterRunningDevice(BSTR bstrXMLDesc, IUnknown punkDeviceControl, BSTR bstrInitString, BSTR bstrResourcePath, int nLifeTime, BSTR* pbstrDeviceIdentifier);
    HRESULT RegisterDeviceProvider(BSTR bstrProviderName, BSTR bstrProgIDProviderClass, BSTR bstrInitString, BSTR bstrContainerId);
    HRESULT GetUniqueDeviceName(BSTR bstrDeviceIdentifier, BSTR bstrTemplateUDN, BSTR* pbstrUDN);
    HRESULT UnregisterDevice(BSTR bstrDeviceIdentifier, BOOL fPermanent);
    HRESULT UnregisterDeviceProvider(BSTR bstrProviderName);
}
enum IID_IUPnPReregistrar = GUID(0x204810b7, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPReregistrar : IUnknown
{
    HRESULT ReregisterDevice(BSTR bstrDeviceIdentifier, BSTR bstrXMLDesc, BSTR bstrProgIDDeviceControlClass, BSTR bstrInitString, BSTR bstrContainerId, BSTR bstrResourcePath, int nLifeTime);
    HRESULT ReregisterRunningDevice(BSTR bstrDeviceIdentifier, BSTR bstrXMLDesc, IUnknown punkDeviceControl, BSTR bstrInitString, BSTR bstrResourcePath, int nLifeTime);
}
enum IID_IUPnPDeviceControl = GUID(0x204810ba, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPDeviceControl : IUnknown
{
    HRESULT Initialize(BSTR bstrXMLDesc, BSTR bstrDeviceIdentifier, BSTR bstrInitString);
    HRESULT GetServiceObject(BSTR bstrUDN, BSTR bstrServiceId, IDispatch* ppdispService);
}
enum IID_IUPnPDeviceControlHttpHeaders = GUID(0x204810bb, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPDeviceControlHttpHeaders : IUnknown
{
    HRESULT GetAdditionalResponseHeaders(BSTR* bstrHttpResponseHeaders);
}
enum IID_IUPnPDeviceProvider = GUID(0x204810b8, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
interface IUPnPDeviceProvider : IUnknown
{
    HRESULT Start(BSTR bstrInitString);
    HRESULT Stop();
}
enum IID_IUPnPRemoteEndpointInfo = GUID(0xc92eb863, 0x269, 0x4aff, [0x9c, 0x72, 0x75, 0x32, 0x1b, 0xba, 0x29, 0x52]);
interface IUPnPRemoteEndpointInfo : IUnknown
{
    HRESULT GetDwordValue(BSTR bstrValueName, uint* pdwValue);
    HRESULT GetStringValue(BSTR bstrValueName, BSTR* pbstrValue);
    HRESULT GetGuidValue(BSTR bstrValueName, GUID* pguidValue);
}
enum CLSID_UPnPRegistrar = GUID(0x204810b9, 0x73b2, 0x11d4, [0xbf, 0x42, 0x0, 0xb0, 0xd0, 0x11, 0x8b, 0x56]);
struct UPnPRegistrar
{
}
enum CLSID_UPnPRemoteEndpointInfo = GUID(0x2e5e84e9, 0x4049, 0x4244, [0xb7, 0x28, 0x2d, 0x24, 0x22, 0x71, 0x57, 0xc7]);
struct UPnPRemoteEndpointInfo
{
}
