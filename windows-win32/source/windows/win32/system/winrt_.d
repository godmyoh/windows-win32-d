module windows.win32.system.winrt_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.system.com_ : IStream, IUnknown;
import windows.win32.system.com.marshal : IMarshal;
import windows.win32.ui.shell.propertiessystem : INamedPropertyStore;

version (Windows):
extern (Windows):

HRESULT CoDecodeProxy(uint, ulong, ServerInformation*);
HRESULT RoGetAgileReference(AgileReferenceOptions, const(GUID)*, IUnknown, IAgileReference*);
uint HSTRING_UserSize(uint*, uint, HSTRING*);
ubyte* HSTRING_UserMarshal(uint*, ubyte*, HSTRING*);
ubyte* HSTRING_UserUnmarshal(uint*, ubyte*, HSTRING*);
void HSTRING_UserFree(uint*, HSTRING*);
uint HSTRING_UserSize64(uint*, uint, HSTRING*);
ubyte* HSTRING_UserMarshal64(uint*, ubyte*, HSTRING*);
ubyte* HSTRING_UserUnmarshal64(uint*, ubyte*, HSTRING*);
void HSTRING_UserFree64(uint*, HSTRING*);
HRESULT WindowsCreateString(const(wchar)*, uint, HSTRING*);
HRESULT WindowsCreateStringReference(const(wchar)*, uint, HSTRING_HEADER*, HSTRING*);
HRESULT WindowsDeleteString(HSTRING);
HRESULT WindowsDuplicateString(HSTRING, HSTRING*);
uint WindowsGetStringLen(HSTRING);
PWSTR WindowsGetStringRawBuffer(HSTRING, uint*);
BOOL WindowsIsStringEmpty(HSTRING);
HRESULT WindowsStringHasEmbeddedNull(HSTRING, BOOL*);
HRESULT WindowsCompareStringOrdinal(HSTRING, HSTRING, int*);
HRESULT WindowsSubstring(HSTRING, uint, HSTRING*);
HRESULT WindowsSubstringWithSpecifiedLength(HSTRING, uint, uint, HSTRING*);
HRESULT WindowsConcatString(HSTRING, HSTRING, HSTRING*);
HRESULT WindowsReplaceString(HSTRING, HSTRING, HSTRING, HSTRING*);
HRESULT WindowsTrimStringStart(HSTRING, HSTRING, HSTRING*);
HRESULT WindowsTrimStringEnd(HSTRING, HSTRING, HSTRING*);
HRESULT WindowsPreallocateStringBuffer(uint, ushort**, HSTRING_BUFFER*);
HRESULT WindowsPromoteStringBuffer(HSTRING_BUFFER, HSTRING*);
HRESULT WindowsDeleteStringBuffer(HSTRING_BUFFER);
HRESULT WindowsInspectString(ulong, ushort, PINSPECT_HSTRING_CALLBACK, void*, uint*, ulong*);
HRESULT WindowsInspectString2(ulong, ushort, PINSPECT_HSTRING_CALLBACK2, void*, uint*, ulong*);
/+ [UNSUPPORTED] HRESULT CreateDispatcherQueueController(DispatcherQueueOptions, DispatcherQueueController*);
+/
HRESULT RoInitialize(RO_INIT_TYPE);
void RoUninitialize();
HRESULT RoActivateInstance(HSTRING, IInspectable*);
HRESULT RoRegisterActivationFactories(HSTRING*, long*, uint, long*);
void RoRevokeActivationFactories(long);
HRESULT RoGetActivationFactory(HSTRING, const(GUID)*, void**);
HRESULT RoRegisterForApartmentShutdown(IApartmentShutdown, ulong*, APARTMENT_SHUTDOWN_REGISTRATION_COOKIE*);
HRESULT RoUnregisterForApartmentShutdown(APARTMENT_SHUTDOWN_REGISTRATION_COOKIE);
HRESULT RoGetApartmentIdentifier(ulong*);
HRESULT RoGetBufferMarshaler(IMarshal*);
HRESULT RoGetErrorReportingFlags(uint*);
HRESULT RoSetErrorReportingFlags(uint);
HRESULT RoResolveRestrictedErrorInfoReference(const(wchar)*, IRestrictedErrorInfo*);
HRESULT SetRestrictedErrorInfo(IRestrictedErrorInfo);
HRESULT GetRestrictedErrorInfo(IRestrictedErrorInfo*);
BOOL RoOriginateErrorW(HRESULT, uint, const(wchar)*);
BOOL RoOriginateError(HRESULT, HSTRING);
BOOL RoTransformErrorW(HRESULT, HRESULT, uint, const(wchar)*);
BOOL RoTransformError(HRESULT, HRESULT, HSTRING);
HRESULT RoCaptureErrorContext(HRESULT);
void RoFailFastWithErrorContext(HRESULT);
BOOL RoOriginateLanguageException(HRESULT, HSTRING, IUnknown);
void RoClearError();
HRESULT RoReportUnhandledError(IRestrictedErrorInfo);
HRESULT RoInspectThreadErrorInfo(ulong, ushort, PINSPECT_MEMORY_CALLBACK, void*, ulong*);
HRESULT RoInspectCapturedStackBackTrace(ulong, ushort, PINSPECT_MEMORY_CALLBACK, void*, uint*, ulong*);
HRESULT RoGetMatchingRestrictedErrorInfo(HRESULT, IRestrictedErrorInfo*);
HRESULT RoReportFailedDelegate(IUnknown, IRestrictedErrorInfo);
BOOL IsErrorPropagationEnabled();
HRESULT MetaDataGetDispenser(const(GUID)*, const(GUID)*, void**);
HRESULT RoGetParameterizedTypeInstanceIID(uint, PWSTR*, const(IRoMetaDataLocator), GUID*, ROPARAMIIDHANDLE*);
void RoFreeParameterizedTypeExtra(ROPARAMIIDHANDLE);
PSTR RoParameterizedTypeExtraGetTypeSignature(ROPARAMIIDHANDLE);
HRESULT RoGetServerActivatableClasses(HSTRING, HSTRING**, uint*);
HRESULT CreateRandomAccessStreamOnFile(const(wchar)*, uint, const(GUID)*, void**);
HRESULT CreateRandomAccessStreamOverStream(IStream, BSOS_OPTIONS, const(GUID)*, void**);
HRESULT CreateStreamOverRandomAccessStream(IUnknown, const(GUID)*, void**);
HRESULT CreateControlInput(const(GUID)*, void**);
HRESULT CreateControlInputEx(IUnknown, const(GUID)*, void**);
enum MAX_ERROR_MESSAGE_CHARS = 0x00000200;
enum CastingSourceInfo_Property_PreferredSourceUriScheme = "PreferredSourceUriScheme";
enum CastingSourceInfo_Property_CastingTypes = "CastingTypes";
enum CastingSourceInfo_Property_ProtectedMedia = "ProtectedMedia";
struct EventRegistrationToken
{
    long value;
}
struct HSTRING_HEADER
{
    uint flags;
    uint length;
    uint padding1;
    uint padding2;
    long data;
}
alias HSTRING = void*;
alias HSTRING_BUFFER = void*;
alias ROPARAMIIDHANDLE = long;
alias APARTMENT_SHUTDOWN_REGISTRATION_COOKIE = long;
alias ACTIVATIONTYPE = int;
enum : int
{
    ACTIVATIONTYPE_UNCATEGORIZED = 0x00000000,
    ACTIVATIONTYPE_FROM_MONIKER  = 0x00000001,
    ACTIVATIONTYPE_FROM_DATA     = 0x00000002,
    ACTIVATIONTYPE_FROM_STORAGE  = 0x00000004,
    ACTIVATIONTYPE_FROM_STREAM   = 0x00000008,
    ACTIVATIONTYPE_FROM_FILE     = 0x00000010,
}

enum IID_IAgileReference = GUID(0xc03f6a43, 0x65a4, 0x9818, [0x98, 0x7e, 0xe0, 0xb8, 0x10, 0xd2, 0xa6, 0xf2]);
interface IAgileReference : IUnknown
{
    HRESULT Resolve(const(GUID)*, void**);
}
enum IID_IApartmentShutdown = GUID(0xa2f05a09, 0x27a2, 0x42b5, [0xbc, 0xe, 0xac, 0x16, 0x3e, 0xf4, 0x9d, 0x9b]);
interface IApartmentShutdown : IUnknown
{
    void OnUninitialize(ulong);
}
struct ServerInformation
{
    uint dwServerPid;
    uint dwServerTid;
    ulong ui64ServerAddress;
}
alias AgileReferenceOptions = int;
enum : int
{
    AGILEREFERENCE_DEFAULT        = 0x00000000,
    AGILEREFERENCE_DELAYEDMARSHAL = 0x00000001,
}

enum IID_ISpatialInteractionManagerInterop = GUID(0x5c4ee536, 0x6a98, 0x4b86, [0xa1, 0x70, 0x58, 0x70, 0x13, 0xd6, 0xfd, 0x4b]);
interface ISpatialInteractionManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IHolographicSpaceInterop = GUID(0x5c4ee536, 0x6a98, 0x4b86, [0xa1, 0x70, 0x58, 0x70, 0x13, 0xd6, 0xfd, 0x4b]);
interface IHolographicSpaceInterop : IInspectable
{
    HRESULT CreateForWindow(HWND, const(GUID)*, void**);
}
alias TrustLevel = int;
enum : int
{
    BaseTrust    = 0x00000000,
    PartialTrust = 0x00000001,
    FullTrust    = 0x00000002,
}

enum IID_IInspectable = GUID(0xaf86e2e0, 0xb12d, 0x4c6a, [0x9c, 0x5a, 0xd7, 0xaa, 0x65, 0x10, 0x1e, 0x90]);
interface IInspectable : IUnknown
{
    HRESULT GetIids(uint*, GUID**);
    HRESULT GetRuntimeClassName(HSTRING*);
    HRESULT GetTrustLevel(TrustLevel*);
}
alias PINSPECT_HSTRING_CALLBACK = HRESULT function(void*, ulong, uint, ubyte*);
alias PINSPECT_HSTRING_CALLBACK2 = HRESULT function(void*, ulong, uint, ubyte*);
alias DISPATCHERQUEUE_THREAD_APARTMENTTYPE = int;
enum : int
{
    DQTAT_COM_NONE = 0x00000000,
    DQTAT_COM_ASTA = 0x00000001,
    DQTAT_COM_STA  = 0x00000002,
}

alias DISPATCHERQUEUE_THREAD_TYPE = int;
enum : int
{
    DQTYPE_THREAD_DEDICATED = 0x00000001,
    DQTYPE_THREAD_CURRENT   = 0x00000002,
}

struct DispatcherQueueOptions
{
    uint dwSize;
    DISPATCHERQUEUE_THREAD_TYPE threadType;
    DISPATCHERQUEUE_THREAD_APARTMENTTYPE apartmentType;
}
enum IID_IAccountsSettingsPaneInterop = GUID(0xd3ee12ad, 0x3865, 0x4362, [0x97, 0x46, 0xb7, 0x5a, 0x68, 0x2d, 0xf0, 0xe6]);
interface IAccountsSettingsPaneInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
    HRESULT ShowManageAccountsForWindowAsync(HWND, const(GUID)*, void**);
    HRESULT ShowAddAccountForWindowAsync(HWND, const(GUID)*, void**);
}
enum IID_IAppServiceConnectionExtendedExecution = GUID(0x65219584, 0xf9cb, 0x4ae3, [0x81, 0xf9, 0xa2, 0x8a, 0x6c, 0xa4, 0x50, 0xd9]);
interface IAppServiceConnectionExtendedExecution : IUnknown
{
    HRESULT OpenForExtendedExecutionAsync(const(GUID)*, void**);
}
enum IID_ICorrelationVectorSource = GUID(0x152b8a3b, 0xb9b9, 0x4685, [0xb5, 0x6e, 0x97, 0x48, 0x47, 0xbc, 0x75, 0x45]);
interface ICorrelationVectorSource : IUnknown
{
    HRESULT get_CorrelationVector(HSTRING*);
}
alias CASTING_CONNECTION_ERROR_STATUS = int;
enum : int
{
    CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED                 = 0x00000000,
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND    = 0x00000001,
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR              = 0x00000002,
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED             = 0x00000003,
    CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED = 0x00000004,
    CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE    = 0x00000005,
    CASTING_CONNECTION_ERROR_STATUS_UNKNOWN                   = 0x00000006,
}

alias CASTING_CONNECTION_STATE = int;
enum : int
{
    CASTING_CONNECTION_STATE_DISCONNECTED  = 0x00000000,
    CASTING_CONNECTION_STATE_CONNECTED     = 0x00000001,
    CASTING_CONNECTION_STATE_RENDERING     = 0x00000002,
    CASTING_CONNECTION_STATE_DISCONNECTING = 0x00000003,
    CASTING_CONNECTION_STATE_CONNECTING    = 0x00000004,
}

enum IID_ICastingEventHandler = GUID(0xc79a6cb7, 0xbebd, 0x47a6, [0xa2, 0xad, 0x4d, 0x45, 0xad, 0x79, 0xc7, 0xbc]);
interface ICastingEventHandler : IUnknown
{
    HRESULT OnStateChanged(CASTING_CONNECTION_STATE);
    HRESULT OnError(CASTING_CONNECTION_ERROR_STATUS, const(wchar)*);
}
enum IID_ICastingController = GUID(0xf0a56423, 0xa664, 0x4fbd, [0x8b, 0x43, 0x40, 0x9a, 0x45, 0xe8, 0xd9, 0xa1]);
interface ICastingController : IUnknown
{
    HRESULT Initialize(IUnknown, IUnknown);
    HRESULT Connect();
    HRESULT Disconnect();
    HRESULT Advise(ICastingEventHandler, uint*);
    HRESULT UnAdvise(uint);
}
enum IID_ICastingSourceInfo = GUID(0x45101ab7, 0x7c3a, 0x4bce, [0x95, 0x0, 0x12, 0xc0, 0x90, 0x24, 0xb2, 0x98]);
interface ICastingSourceInfo : IUnknown
{
    HRESULT GetController(ICastingController*);
    HRESULT GetProperties(INamedPropertyStore*);
}
enum IID_IDragDropManagerInterop = GUID(0x5ad8cba7, 0x4c01, 0x4dac, [0x90, 0x74, 0x82, 0x78, 0x94, 0x29, 0x2d, 0x63]);
interface IDragDropManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IInputPaneInterop = GUID(0x75cf2c57, 0x9195, 0x4931, [0x83, 0x32, 0xf0, 0xb4, 0x9, 0xe9, 0x16, 0xaf]);
interface IInputPaneInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IPlayToManagerInterop = GUID(0x24394699, 0x1f2c, 0x4eb3, [0x8c, 0xd7, 0xe, 0xc1, 0xda, 0x42, 0xa5, 0x40]);
interface IPlayToManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
    HRESULT ShowPlayToUIForWindow(HWND);
}
enum IID_ICorrelationVectorInformation = GUID(0x83c78b3c, 0xd88b, 0x4950, [0xaa, 0x6e, 0x22, 0xb8, 0xd2, 0x2a, 0xab, 0xd3]);
interface ICorrelationVectorInformation : IInspectable
{
    HRESULT get_LastCorrelationVectorForThread(HSTRING*);
    HRESULT get_NextCorrelationVectorForThread(HSTRING*);
    HRESULT put_NextCorrelationVectorForThread(HSTRING);
}
enum IID_IUIViewSettingsInterop = GUID(0x3694dbf9, 0x8f68, 0x44be, [0x8f, 0xf5, 0x19, 0x5c, 0x98, 0xed, 0xe8, 0xa6]);
interface IUIViewSettingsInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IUserActivityInterop = GUID(0x1ade314d, 0xe0a, 0x40d9, [0x82, 0x4c, 0x9a, 0x8, 0x8a, 0x50, 0x5, 0x9f]);
interface IUserActivityInterop : IInspectable
{
    HRESULT CreateSessionForWindow(HWND, const(GUID)*, void**);
}
enum IID_IUserActivitySourceHostInterop = GUID(0xc15df8bc, 0x8844, 0x487a, [0xb8, 0x5b, 0x75, 0x78, 0xe0, 0xf6, 0x14, 0x19]);
interface IUserActivitySourceHostInterop : IInspectable
{
    HRESULT SetActivitySourceHost(HSTRING);
}
enum IID_IUserActivityRequestManagerInterop = GUID(0xdd69f876, 0x9699, 0x4715, [0x90, 0x95, 0xe3, 0x7e, 0xa3, 0xd, 0xfa, 0x1b]);
interface IUserActivityRequestManagerInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IUserConsentVerifierInterop = GUID(0x39e050c3, 0x4e74, 0x441a, [0x8d, 0xc0, 0xb8, 0x11, 0x4, 0xdf, 0x94, 0x9c]);
interface IUserConsentVerifierInterop : IInspectable
{
    HRESULT RequestVerificationForWindowAsync(HWND, HSTRING, const(GUID)*, void**);
}
enum IID_IWebAuthenticationCoreManagerInterop = GUID(0xf4b8e804, 0x811e, 0x4436, [0xb6, 0x9c, 0x44, 0xcb, 0x67, 0xb7, 0x20, 0x84]);
interface IWebAuthenticationCoreManagerInterop : IInspectable
{
    HRESULT RequestTokenForWindowAsync(HWND, IInspectable, const(GUID)*, void**);
    HRESULT RequestTokenWithWebAccountForWindowAsync(HWND, IInspectable, IInspectable, const(GUID)*, void**);
}
enum IID_IRestrictedErrorInfo = GUID(0x82ba7092, 0x4c88, 0x427d, [0xa7, 0xbc, 0x16, 0xdd, 0x93, 0xfe, 0xb6, 0x7e]);
interface IRestrictedErrorInfo : IUnknown
{
    HRESULT GetErrorDetails(BSTR*, HRESULT*, BSTR*, BSTR*);
    HRESULT GetReference(BSTR*);
}
enum IID_ILanguageExceptionErrorInfo = GUID(0x4a2dbf3, 0xdf83, 0x116c, [0x9, 0x46, 0x8, 0x12, 0xab, 0xf6, 0xe0, 0x7d]);
interface ILanguageExceptionErrorInfo : IUnknown
{
    HRESULT GetLanguageException(IUnknown*);
}
enum IID_ILanguageExceptionTransform = GUID(0xfeb5a271, 0xa6cd, 0x45ce, [0x88, 0xa, 0x69, 0x67, 0x6, 0xba, 0xdc, 0x65]);
interface ILanguageExceptionTransform : IUnknown
{
    HRESULT GetTransformedRestrictedErrorInfo(IRestrictedErrorInfo*);
}
enum IID_ILanguageExceptionStackBackTrace = GUID(0xcbe53fb5, 0xf967, 0x4258, [0x8d, 0x34, 0x42, 0xf5, 0xe2, 0x58, 0x33, 0xde]);
interface ILanguageExceptionStackBackTrace : IUnknown
{
    HRESULT GetStackBackTrace(uint, ulong*, uint*);
}
enum IID_ILanguageExceptionErrorInfo2 = GUID(0x5746e5c4, 0x5b97, 0x424c, [0xb6, 0x20, 0x28, 0x22, 0x91, 0x57, 0x34, 0xdd]);
interface ILanguageExceptionErrorInfo2 : ILanguageExceptionErrorInfo
{
    HRESULT GetPreviousLanguageExceptionErrorInfo(ILanguageExceptionErrorInfo2*);
    HRESULT CapturePropagationContext(IUnknown);
    HRESULT GetPropagationContextHead(ILanguageExceptionErrorInfo2*);
}
enum IID_IActivationFactory = GUID(0x35, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IActivationFactory : IInspectable
{
    HRESULT ActivateInstance(IInspectable*);
}
alias RO_INIT_TYPE = int;
enum : int
{
    RO_INIT_SINGLETHREADED = 0x00000000,
    RO_INIT_MULTITHREADED  = 0x00000001,
}

struct _RO_REGISTRATION_COOKIE
{
}
enum IID_IBufferByteAccess = GUID(0x905a0fef, 0xbc53, 0x11df, [0x8c, 0x49, 0x0, 0x1e, 0x4f, 0xc6, 0x86, 0xda]);
interface IBufferByteAccess : IUnknown
{
    HRESULT Buffer(ubyte**);
}
alias RO_ERROR_REPORTING_FLAGS = uint;
enum : uint
{
    RO_ERROR_REPORTING_NONE                 = 0x00000000,
    RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS   = 0x00000001,
    RO_ERROR_REPORTING_FORCEEXCEPTIONS      = 0x00000002,
    RO_ERROR_REPORTING_USESETERRORINFO      = 0x00000004,
    RO_ERROR_REPORTING_SUPPRESSSETERRORINFO = 0x00000008,
}

alias PINSPECT_MEMORY_CALLBACK = HRESULT function(void*, ulong, uint, ubyte*);
// [Not Found] IID_IRoSimpleMetaDataBuilder
interface IRoSimpleMetaDataBuilder
{
    HRESULT SetWinRtInterface(GUID);
    HRESULT SetDelegate(GUID);
    HRESULT SetInterfaceGroupSimpleDefault(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT SetInterfaceGroupParameterizedDefault(const(wchar)*, uint, PWSTR*);
    HRESULT SetRuntimeClassSimpleDefault(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT SetRuntimeClassParameterizedDefault(const(wchar)*, uint, const(wchar)**);
    HRESULT SetStruct(const(wchar)*, uint, const(wchar)**);
    HRESULT SetEnum(const(wchar)*, const(wchar)*);
    HRESULT SetParameterizedInterface(GUID, uint);
    HRESULT SetParameterizedDelegate(GUID, uint);
}
// [Not Found] IID_IRoMetaDataLocator
interface IRoMetaDataLocator
{
    HRESULT Locate(const(wchar)*, IRoSimpleMetaDataBuilder);
}
alias BSOS_OPTIONS = int;
enum : int
{
    BSOS_DEFAULT                 = 0x00000000,
    BSOS_PREFERDESTINATIONSTREAM = 0x00000001,
}

enum IID_IMemoryBufferByteAccess = GUID(0x5b0d3235, 0x4dba, 0x4d44, [0x86, 0x5e, 0x8f, 0x1d, 0xe, 0x4f, 0xd0, 0x4d]);
interface IMemoryBufferByteAccess : IUnknown
{
    HRESULT GetBuffer(ubyte**, uint*);
}
enum IID_IWeakReference = GUID(0x37, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IWeakReference : IUnknown
{
    HRESULT Resolve(const(GUID)*, void**);
}
enum IID_IWeakReferenceSource = GUID(0x38, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IWeakReferenceSource : IUnknown
{
    HRESULT GetWeakReference(IWeakReference*);
}
enum IID_ISystemMediaTransportControlsInterop = GUID(0xddb0472d, 0xc911, 0x4a1f, [0x86, 0xd9, 0xdc, 0x3d, 0x71, 0xa9, 0x5f, 0x5a]);
interface ISystemMediaTransportControlsInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IShareWindowCommandEventArgsInterop = GUID(0x6571a721, 0x643d, 0x43d4, [0xac, 0xa4, 0x6b, 0x6f, 0x5f, 0x30, 0xf1, 0xad]);
interface IShareWindowCommandEventArgsInterop : IUnknown
{
    HRESULT GetWindow(HWND*);
}
enum IID_IShareWindowCommandSourceInterop = GUID(0x461a191f, 0x8424, 0x43a6, [0xa0, 0xfa, 0x34, 0x51, 0xa2, 0x2f, 0x56, 0xab]);
interface IShareWindowCommandSourceInterop : IUnknown
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IMessageDispatcher = GUID(0xf5f84c8f, 0xcfd0, 0x4cd6, [0xb6, 0x6b, 0xc5, 0xd2, 0x6f, 0xf1, 0x68, 0x9d]);
interface IMessageDispatcher : IInspectable
{
    HRESULT PumpMessages();
}
enum IID_ICoreWindowInterop = GUID(0x45d64a29, 0xa63e, 0x4cb6, [0xb4, 0x98, 0x57, 0x81, 0xd2, 0x98, 0xcb, 0x4f]);
interface ICoreWindowInterop : IUnknown
{
    HRESULT get_WindowHandle(HWND*);
    HRESULT put_MessageHandled(ubyte);
}
enum IID_ICoreInputInterop = GUID(0x40bfe3e3, 0xb75a, 0x4479, [0xac, 0x96, 0x47, 0x53, 0x65, 0x74, 0x9b, 0xb8]);
interface ICoreInputInterop : IUnknown
{
    HRESULT SetInputSource(IUnknown);
    HRESULT put_MessageHandled(ubyte);
}
enum IID_ICoreWindowComponentInterop = GUID(0x576ab31, 0xa310, 0x4c40, [0xba, 0x31, 0xfd, 0x37, 0xe0, 0x29, 0x8d, 0xfa]);
interface ICoreWindowComponentInterop : IUnknown
{
    HRESULT ConfigureComponentInput(uint, HWND, IUnknown);
    HRESULT GetViewInstanceId(uint*);
}
enum IID_ICoreWindowAdapterInterop = GUID(0x7a5b6fd1, 0xcd73, 0x4b6c, [0x9c, 0xf4, 0x2e, 0x86, 0x9e, 0xaf, 0x47, 0xa]);
interface ICoreWindowAdapterInterop : IInspectable
{
    HRESULT get_AppActivationClientAdapter(IUnknown*);
    HRESULT get_ApplicationViewClientAdapter(IUnknown*);
    HRESULT get_CoreApplicationViewClientAdapter(IUnknown*);
    HRESULT get_HoloViewClientAdapter(IUnknown*);
    HRESULT get_PositionerClientAdapter(IUnknown*);
    HRESULT get_SystemNavigationClientAdapter(IUnknown*);
    HRESULT get_TitleBarClientAdapter(IUnknown*);
    HRESULT SetWindowClientAdapter(IUnknown);
}
