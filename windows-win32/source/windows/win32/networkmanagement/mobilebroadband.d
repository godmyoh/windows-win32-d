module windows.win32.networkmanagement.mobilebroadband;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;

version (Windows):
extern (Windows):

enum IID_IDummyMBNUCMExt = GUID(0xdcbbbab6, 0xffff, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IDummyMBNUCMExt : IDispatch
{
}
alias MBN_SIGNAL_CONSTANTS = int;
enum : int
{
    MBN_RSSI_DEFAULT       = 0xffffffff,
    MBN_RSSI_DISABLE       = 0x00000000,
    MBN_RSSI_UNKNOWN       = 0x00000063,
    MBN_ERROR_RATE_UNKNOWN = 0x00000063,
}

alias MBN_CELLULAR_CLASS = int;
enum : int
{
    MBN_CELLULAR_CLASS_NONE = 0x00000000,
    MBN_CELLULAR_CLASS_GSM  = 0x00000001,
    MBN_CELLULAR_CLASS_CDMA = 0x00000002,
}

alias MBN_VOICE_CLASS = int;
enum : int
{
    MBN_VOICE_CLASS_NONE                    = 0x00000000,
    MBN_VOICE_CLASS_NO_VOICE                = 0x00000001,
    MBN_VOICE_CLASS_SEPARATE_VOICE_DATA     = 0x00000002,
    MBN_VOICE_CLASS_SIMULTANEOUS_VOICE_DATA = 0x00000003,
}

alias MBN_PROVIDER_STATE = int;
enum : int
{
    MBN_PROVIDER_STATE_NONE                   = 0x00000000,
    MBN_PROVIDER_STATE_HOME                   = 0x00000001,
    MBN_PROVIDER_STATE_FORBIDDEN              = 0x00000002,
    MBN_PROVIDER_STATE_PREFERRED              = 0x00000004,
    MBN_PROVIDER_STATE_VISIBLE                = 0x00000008,
    MBN_PROVIDER_STATE_REGISTERED             = 0x00000010,
    MBN_PROVIDER_STATE_PREFERRED_MULTICARRIER = 0x00000020,
}

alias MBN_PROVIDER_CONSTANTS = int;
enum : int
{
    MBN_PROVIDERNAME_LEN = 0x00000014,
    MBN_PROVIDERID_LEN   = 0x00000006,
}

alias MBN_INTERFACE_CAPS_CONSTANTS = int;
enum : int
{
    MBN_DEVICEID_LEN     = 0x00000012,
    MBN_MANUFACTURER_LEN = 0x00000020,
    MBN_MODEL_LEN        = 0x00000020,
    MBN_FIRMWARE_LEN     = 0x00000020,
}

alias MBN_DATA_CLASS = int;
enum : int
{
    MBN_DATA_CLASS_NONE        = 0x00000000,
    MBN_DATA_CLASS_GPRS        = 0x00000001,
    MBN_DATA_CLASS_EDGE        = 0x00000002,
    MBN_DATA_CLASS_UMTS        = 0x00000004,
    MBN_DATA_CLASS_HSDPA       = 0x00000008,
    MBN_DATA_CLASS_HSUPA       = 0x00000010,
    MBN_DATA_CLASS_LTE         = 0x00000020,
    MBN_DATA_CLASS_5G_NSA      = 0x00000040,
    MBN_DATA_CLASS_5G_SA       = 0x00000080,
    MBN_DATA_CLASS_1XRTT       = 0x00010000,
    MBN_DATA_CLASS_1XEVDO      = 0x00020000,
    MBN_DATA_CLASS_1XEVDO_REVA = 0x00040000,
    MBN_DATA_CLASS_1XEVDV      = 0x00080000,
    MBN_DATA_CLASS_3XRTT       = 0x00100000,
    MBN_DATA_CLASS_1XEVDO_REVB = 0x00200000,
    MBN_DATA_CLASS_UMB         = 0x00400000,
    MBN_DATA_CLASS_CUSTOM      = 0x80000000,
}

alias MBN_CTRL_CAPS = int;
enum : int
{
    MBN_CTRL_CAPS_NONE                = 0x00000000,
    MBN_CTRL_CAPS_REG_MANUAL          = 0x00000001,
    MBN_CTRL_CAPS_HW_RADIO_SWITCH     = 0x00000002,
    MBN_CTRL_CAPS_CDMA_MOBILE_IP      = 0x00000004,
    MBN_CTRL_CAPS_CDMA_SIMPLE_IP      = 0x00000008,
    MBN_CTRL_CAPS_PROTECT_UNIQUEID    = 0x00000010,
    MBN_CTRL_CAPS_MODEL_MULTI_CARRIER = 0x00000020,
    MBN_CTRL_CAPS_USSD                = 0x00000040,
    MBN_CTRL_CAPS_MULTI_MODE          = 0x00000080,
}

alias MBN_SMS_CAPS = int;
enum : int
{
    MBN_SMS_CAPS_NONE         = 0x00000000,
    MBN_SMS_CAPS_PDU_RECEIVE  = 0x00000001,
    MBN_SMS_CAPS_PDU_SEND     = 0x00000002,
    MBN_SMS_CAPS_TEXT_RECEIVE = 0x00000004,
    MBN_SMS_CAPS_TEXT_SEND    = 0x00000008,
}

alias MBN_BAND_CLASS = int;
enum : int
{
    MBN_BAND_CLASS_NONE   = 0x00000000,
    MBN_BAND_CLASS_0      = 0x00000001,
    MBN_BAND_CLASS_I      = 0x00000002,
    MBN_BAND_CLASS_II     = 0x00000004,
    MBN_BAND_CLASS_III    = 0x00000008,
    MBN_BAND_CLASS_IV     = 0x00000010,
    MBN_BAND_CLASS_V      = 0x00000020,
    MBN_BAND_CLASS_VI     = 0x00000040,
    MBN_BAND_CLASS_VII    = 0x00000080,
    MBN_BAND_CLASS_VIII   = 0x00000100,
    MBN_BAND_CLASS_IX     = 0x00000200,
    MBN_BAND_CLASS_X      = 0x00000400,
    MBN_BAND_CLASS_XI     = 0x00000800,
    MBN_BAND_CLASS_XII    = 0x00001000,
    MBN_BAND_CLASS_XIII   = 0x00002000,
    MBN_BAND_CLASS_XIV    = 0x00004000,
    MBN_BAND_CLASS_XV     = 0x00008000,
    MBN_BAND_CLASS_XVI    = 0x00010000,
    MBN_BAND_CLASS_XVII   = 0x00020000,
    MBN_BAND_CLASS_CUSTOM = 0x80000000,
}

struct MBN_INTERFACE_CAPS
{
    MBN_CELLULAR_CLASS cellularClass;
    MBN_VOICE_CLASS voiceClass;
    uint dataClass;
    BSTR customDataClass;
    uint gsmBandClass;
    uint cdmaBandClass;
    BSTR customBandClass;
    uint smsCaps;
    uint controlCaps;
    BSTR deviceID;
    BSTR manufacturer;
    BSTR model;
    BSTR firmwareInfo;
}
struct MBN_PROVIDER
{
    BSTR providerID;
    uint providerState;
    BSTR providerName;
    uint dataClass;
}
struct MBN_PROVIDER2
{
    MBN_PROVIDER provider;
    MBN_CELLULAR_CLASS cellularClass;
    uint signalStrength;
    uint signalError;
}
alias MBN_READY_STATE = int;
enum : int
{
    MBN_READY_STATE_OFF              = 0x00000000,
    MBN_READY_STATE_INITIALIZED      = 0x00000001,
    MBN_READY_STATE_SIM_NOT_INSERTED = 0x00000002,
    MBN_READY_STATE_BAD_SIM          = 0x00000003,
    MBN_READY_STATE_FAILURE          = 0x00000004,
    MBN_READY_STATE_NOT_ACTIVATED    = 0x00000005,
    MBN_READY_STATE_DEVICE_LOCKED    = 0x00000006,
    MBN_READY_STATE_DEVICE_BLOCKED   = 0x00000007,
    MBN_READY_STATE_NO_ESIM_PROFILE  = 0x00000008,
}

alias MBN_ACTIVATION_STATE = int;
enum : int
{
    MBN_ACTIVATION_STATE_NONE         = 0x00000000,
    MBN_ACTIVATION_STATE_ACTIVATED    = 0x00000001,
    MBN_ACTIVATION_STATE_ACTIVATING   = 0x00000002,
    MBN_ACTIVATION_STATE_DEACTIVATED  = 0x00000003,
    MBN_ACTIVATION_STATE_DEACTIVATING = 0x00000004,
}

alias MBN_CONNECTION_MODE = int;
enum : int
{
    MBN_CONNECTION_MODE_PROFILE     = 0x00000000,
    MBN_CONNECTION_MODE_TMP_PROFILE = 0x00000001,
}

alias MBN_VOICE_CALL_STATE = int;
enum : int
{
    MBN_VOICE_CALL_STATE_NONE        = 0x00000000,
    MBN_VOICE_CALL_STATE_IN_PROGRESS = 0x00000001,
    MBN_VOICE_CALL_STATE_HANGUP      = 0x00000002,
}

alias MBN_REGISTRATION_CONSTANTS = int;
enum : int
{
    MBN_ROAMTEXT_LEN             = 0x00000040,
    MBN_CDMA_DEFAULT_PROVIDER_ID = 0x00000000,
}

alias MBN_REGISTER_STATE = int;
enum : int
{
    MBN_REGISTER_STATE_NONE         = 0x00000000,
    MBN_REGISTER_STATE_DEREGISTERED = 0x00000001,
    MBN_REGISTER_STATE_SEARCHING    = 0x00000002,
    MBN_REGISTER_STATE_HOME         = 0x00000003,
    MBN_REGISTER_STATE_ROAMING      = 0x00000004,
    MBN_REGISTER_STATE_PARTNER      = 0x00000005,
    MBN_REGISTER_STATE_DENIED       = 0x00000006,
}

alias MBN_REGISTER_MODE = int;
enum : int
{
    MBN_REGISTER_MODE_NONE      = 0x00000000,
    MBN_REGISTER_MODE_AUTOMATIC = 0x00000001,
    MBN_REGISTER_MODE_MANUAL    = 0x00000002,
}

alias MBN_PIN_CONSTANTS = int;
enum : int
{
    MBN_ATTEMPTS_REMAINING_UNKNOWN = 0xffffffff,
    MBN_PIN_LENGTH_UNKNOWN         = 0xffffffff,
}

alias MBN_PIN_STATE = int;
enum : int
{
    MBN_PIN_STATE_NONE    = 0x00000000,
    MBN_PIN_STATE_ENTER   = 0x00000001,
    MBN_PIN_STATE_UNBLOCK = 0x00000002,
}

alias MBN_PIN_TYPE = int;
enum : int
{
    MBN_PIN_TYPE_NONE                 = 0x00000000,
    MBN_PIN_TYPE_CUSTOM               = 0x00000001,
    MBN_PIN_TYPE_PIN1                 = 0x00000002,
    MBN_PIN_TYPE_PIN2                 = 0x00000003,
    MBN_PIN_TYPE_DEVICE_SIM_PIN       = 0x00000004,
    MBN_PIN_TYPE_DEVICE_FIRST_SIM_PIN = 0x00000005,
    MBN_PIN_TYPE_NETWORK_PIN          = 0x00000006,
    MBN_PIN_TYPE_NETWORK_SUBSET_PIN   = 0x00000007,
    MBN_PIN_TYPE_SVC_PROVIDER_PIN     = 0x00000008,
    MBN_PIN_TYPE_CORPORATE_PIN        = 0x00000009,
    MBN_PIN_TYPE_SUBSIDY_LOCK         = 0x0000000a,
}

struct MBN_PIN_INFO
{
    MBN_PIN_STATE pinState;
    MBN_PIN_TYPE pinType;
    uint attemptsRemaining;
}
alias MBN_PIN_MODE = int;
enum : int
{
    MBN_PIN_MODE_ENABLED  = 0x00000001,
    MBN_PIN_MODE_DISABLED = 0x00000002,
}

alias MBN_PIN_FORMAT = int;
enum : int
{
    MBN_PIN_FORMAT_NONE         = 0x00000000,
    MBN_PIN_FORMAT_NUMERIC      = 0x00000001,
    MBN_PIN_FORMAT_ALPHANUMERIC = 0x00000002,
}

alias MBN_CONTEXT_CONSTANTS = int;
enum : int
{
    MBN_ACCESSSTRING_LEN  = 0x00000064,
    MBN_USERNAME_LEN      = 0x000000ff,
    MBN_PASSWORD_LEN      = 0x000000ff,
    MBN_CONTEXT_ID_APPEND = 0xffffffff,
}

alias MBN_AUTH_PROTOCOL = int;
enum : int
{
    MBN_AUTH_PROTOCOL_NONE     = 0x00000000,
    MBN_AUTH_PROTOCOL_PAP      = 0x00000001,
    MBN_AUTH_PROTOCOL_CHAP     = 0x00000002,
    MBN_AUTH_PROTOCOL_MSCHAPV2 = 0x00000003,
}

alias MBN_COMPRESSION = int;
enum : int
{
    MBN_COMPRESSION_NONE   = 0x00000000,
    MBN_COMPRESSION_ENABLE = 0x00000001,
}

alias MBN_CONTEXT_TYPE = int;
enum : int
{
    MBN_CONTEXT_TYPE_NONE        = 0x00000000,
    MBN_CONTEXT_TYPE_INTERNET    = 0x00000001,
    MBN_CONTEXT_TYPE_VPN         = 0x00000002,
    MBN_CONTEXT_TYPE_VOICE       = 0x00000003,
    MBN_CONTEXT_TYPE_VIDEO_SHARE = 0x00000004,
    MBN_CONTEXT_TYPE_CUSTOM      = 0x00000005,
    MBN_CONTEXT_TYPE_PURCHASE    = 0x00000006,
}

struct MBN_CONTEXT
{
    uint contextID;
    MBN_CONTEXT_TYPE contextType;
    BSTR accessString;
    BSTR userName;
    BSTR password;
    MBN_COMPRESSION compression;
    MBN_AUTH_PROTOCOL authType;
}
alias WWAEXT_SMS_CONSTANTS = int;
enum : int
{
    MBN_MESSAGE_INDEX_NONE          = 0x00000000,
    MBN_CDMA_SHORT_MSG_SIZE_UNKNOWN = 0x00000000,
    MBN_CDMA_SHORT_MSG_SIZE_MAX     = 0x000000a0,
}

alias MBN_MSG_STATUS = int;
enum : int
{
    MBN_MSG_STATUS_NEW   = 0x00000000,
    MBN_MSG_STATUS_OLD   = 0x00000001,
    MBN_MSG_STATUS_DRAFT = 0x00000002,
    MBN_MSG_STATUS_SENT  = 0x00000003,
}

alias MBN_SMS_CDMA_LANG = int;
enum : int
{
    MBN_SMS_CDMA_LANG_NONE     = 0x00000000,
    MBN_SMS_CDMA_LANG_ENGLISH  = 0x00000001,
    MBN_SMS_CDMA_LANG_FRENCH   = 0x00000002,
    MBN_SMS_CDMA_LANG_SPANISH  = 0x00000003,
    MBN_SMS_CDMA_LANG_JAPANESE = 0x00000004,
    MBN_SMS_CDMA_LANG_KOREAN   = 0x00000005,
    MBN_SMS_CDMA_LANG_CHINESE  = 0x00000006,
    MBN_SMS_CDMA_LANG_HEBREW   = 0x00000007,
}

alias MBN_SMS_CDMA_ENCODING = int;
enum : int
{
    MBN_SMS_CDMA_ENCODING_OCTET        = 0x00000000,
    MBN_SMS_CDMA_ENCODING_EPM          = 0x00000001,
    MBN_SMS_CDMA_ENCODING_7BIT_ASCII   = 0x00000002,
    MBN_SMS_CDMA_ENCODING_IA5          = 0x00000003,
    MBN_SMS_CDMA_ENCODING_UNICODE      = 0x00000004,
    MBN_SMS_CDMA_ENCODING_SHIFT_JIS    = 0x00000005,
    MBN_SMS_CDMA_ENCODING_KOREAN       = 0x00000006,
    MBN_SMS_CDMA_ENCODING_LATIN_HEBREW = 0x00000007,
    MBN_SMS_CDMA_ENCODING_LATIN        = 0x00000008,
    MBN_SMS_CDMA_ENCODING_GSM_7BIT     = 0x00000009,
}

alias MBN_SMS_FLAG = int;
enum : int
{
    MBN_SMS_FLAG_ALL   = 0x00000000,
    MBN_SMS_FLAG_INDEX = 0x00000001,
    MBN_SMS_FLAG_NEW   = 0x00000002,
    MBN_SMS_FLAG_OLD   = 0x00000003,
    MBN_SMS_FLAG_SENT  = 0x00000004,
    MBN_SMS_FLAG_DRAFT = 0x00000005,
}

struct MBN_SMS_FILTER
{
    MBN_SMS_FLAG flag;
    uint messageIndex;
}
alias MBN_SMS_STATUS_FLAG = int;
enum : int
{
    MBN_SMS_FLAG_NONE               = 0x00000000,
    MBN_SMS_FLAG_MESSAGE_STORE_FULL = 0x00000001,
    MBN_SMS_FLAG_NEW_MESSAGE        = 0x00000002,
}

struct MBN_SMS_STATUS_INFO
{
    uint flag;
    uint messageIndex;
}
alias MBN_SMS_FORMAT = int;
enum : int
{
    MBN_SMS_FORMAT_NONE = 0x00000000,
    MBN_SMS_FORMAT_PDU  = 0x00000001,
    MBN_SMS_FORMAT_TEXT = 0x00000002,
}

alias MBN_RADIO = int;
enum : int
{
    MBN_RADIO_OFF = 0x00000000,
    MBN_RADIO_ON  = 0x00000001,
}

alias MBN_DEVICE_SERVICE_SESSIONS_STATE = int;
enum : int
{
    MBN_DEVICE_SERVICE_SESSIONS_RESTORED = 0x00000000,
}

struct MBN_DEVICE_SERVICE
{
    BSTR deviceServiceID;
    VARIANT_BOOL dataWriteSupported;
    VARIANT_BOOL dataReadSupported;
}
alias MBN_DEVICE_SERVICES_INTERFACE_STATE = int;
enum : int
{
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_ARRIVAL = 0x00000000,
    MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_REMOVAL = 0x00000001,
}

enum IID_IMbnConnection = GUID(0xdcbbbab6, 0x200d, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnection : IUnknown
{
    HRESULT get_ConnectionID(BSTR* ConnectionID);
    HRESULT get_InterfaceID(BSTR* InterfaceID);
    HRESULT Connect(MBN_CONNECTION_MODE connectionMode, const(wchar)* strProfile, uint* requestID);
    HRESULT Disconnect(uint* requestID);
    HRESULT GetConnectionState(MBN_ACTIVATION_STATE* ConnectionState, BSTR* ProfileName);
    HRESULT GetVoiceCallState(MBN_VOICE_CALL_STATE* voiceCallState);
    HRESULT GetActivationNetworkError(uint* networkError);
}
enum IID_IMbnConnectionEvents = GUID(0xdcbbbab6, 0x200e, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionEvents : IUnknown
{
    HRESULT OnConnectComplete(IMbnConnection newConnection, uint requestID, HRESULT status);
    HRESULT OnDisconnectComplete(IMbnConnection newConnection, uint requestID, HRESULT status);
    HRESULT OnConnectStateChange(IMbnConnection newConnection);
    HRESULT OnVoiceCallStateChange(IMbnConnection newConnection);
}
enum IID_IMbnInterface = GUID(0xdcbbbab6, 0x2001, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnInterface : IUnknown
{
    HRESULT get_InterfaceID(BSTR* InterfaceID);
    HRESULT GetInterfaceCapability(MBN_INTERFACE_CAPS* interfaceCaps);
    HRESULT GetSubscriberInformation(IMbnSubscriberInformation* subscriberInformation);
    HRESULT GetReadyState(MBN_READY_STATE* readyState);
    HRESULT InEmergencyMode(VARIANT_BOOL* emergencyMode);
    HRESULT GetHomeProvider(MBN_PROVIDER* homeProvider);
    HRESULT GetPreferredProviders(SAFEARRAY** preferredProviders);
    HRESULT SetPreferredProviders(SAFEARRAY* preferredProviders, uint* requestID);
    HRESULT GetVisibleProviders(uint* age, SAFEARRAY** visibleProviders);
    HRESULT ScanNetwork(uint* requestID);
    HRESULT GetConnection(IMbnConnection* mbnConnection);
}
enum IID_IMbnInterfaceEvents = GUID(0xdcbbbab6, 0x2002, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnInterfaceEvents : IUnknown
{
    HRESULT OnInterfaceCapabilityAvailable(IMbnInterface newInterface);
    HRESULT OnSubscriberInformationChange(IMbnInterface newInterface);
    HRESULT OnReadyStateChange(IMbnInterface newInterface);
    HRESULT OnEmergencyModeChange(IMbnInterface newInterface);
    HRESULT OnHomeProviderAvailable(IMbnInterface newInterface);
    HRESULT OnPreferredProvidersChange(IMbnInterface newInterface);
    HRESULT OnSetPreferredProvidersComplete(IMbnInterface newInterface, uint requestID, HRESULT status);
    HRESULT OnScanNetworkComplete(IMbnInterface newInterface, uint requestID, HRESULT status);
}
enum IID_IMbnInterfaceManager = GUID(0xdcbbbab6, 0x201b, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnInterfaceManager : IUnknown
{
    HRESULT GetInterface(const(wchar)* interfaceID, IMbnInterface* mbnInterface);
    HRESULT GetInterfaces(SAFEARRAY** mbnInterfaces);
}
enum IID_IMbnInterfaceManagerEvents = GUID(0xdcbbbab6, 0x201c, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnInterfaceManagerEvents : IUnknown
{
    HRESULT OnInterfaceArrival(IMbnInterface newInterface);
    HRESULT OnInterfaceRemoval(IMbnInterface oldInterface);
}
enum IID_IMbnRegistration = GUID(0xdcbbbab6, 0x2009, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnRegistration : IUnknown
{
    HRESULT GetRegisterState(MBN_REGISTER_STATE* registerState);
    HRESULT GetRegisterMode(MBN_REGISTER_MODE* registerMode);
    HRESULT GetProviderID(BSTR* providerID);
    HRESULT GetProviderName(BSTR* providerName);
    HRESULT GetRoamingText(BSTR* roamingText);
    HRESULT GetAvailableDataClasses(uint* availableDataClasses);
    HRESULT GetCurrentDataClass(uint* currentDataClass);
    HRESULT GetRegistrationNetworkError(uint* registrationNetworkError);
    HRESULT GetPacketAttachNetworkError(uint* packetAttachNetworkError);
    HRESULT SetRegisterMode(MBN_REGISTER_MODE registerMode, const(wchar)* providerID, uint dataClass, uint* requestID);
}
enum IID_IMbnRegistrationEvents = GUID(0xdcbbbab6, 0x200a, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnRegistrationEvents : IUnknown
{
    HRESULT OnRegisterModeAvailable(IMbnRegistration newInterface);
    HRESULT OnRegisterStateChange(IMbnRegistration newInterface);
    HRESULT OnPacketServiceStateChange(IMbnRegistration newInterface);
    HRESULT OnSetRegisterModeComplete(IMbnRegistration newInterface, uint requestID, HRESULT status);
}
enum IID_IMbnConnectionManager = GUID(0xdcbbbab6, 0x201d, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionManager : IUnknown
{
    HRESULT GetConnection(const(wchar)* connectionID, IMbnConnection* mbnConnection);
    HRESULT GetConnections(SAFEARRAY** mbnConnections);
}
enum IID_IMbnConnectionManagerEvents = GUID(0xdcbbbab6, 0x201e, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionManagerEvents : IUnknown
{
    HRESULT OnConnectionArrival(IMbnConnection newConnection);
    HRESULT OnConnectionRemoval(IMbnConnection oldConnection);
}
enum IID_IMbnPinManager = GUID(0xdcbbbab6, 0x2005, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnPinManager : IUnknown
{
    HRESULT GetPinList(SAFEARRAY** pinList);
    HRESULT GetPin(MBN_PIN_TYPE pinType, IMbnPin* pin);
    HRESULT GetPinState(uint* requestID);
}
enum IID_IMbnPinManagerEvents = GUID(0xdcbbbab6, 0x2006, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnPinManagerEvents : IUnknown
{
    HRESULT OnPinListAvailable(IMbnPinManager pinManager);
    HRESULT OnGetPinStateComplete(IMbnPinManager pinManager, MBN_PIN_INFO pinInfo, uint requestID, HRESULT status);
}
enum IID_IMbnPinEvents = GUID(0xdcbbbab6, 0x2008, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnPinEvents : IUnknown
{
    HRESULT OnEnableComplete(IMbnPin pin, MBN_PIN_INFO* pinInfo, uint requestID, HRESULT status);
    HRESULT OnDisableComplete(IMbnPin pin, MBN_PIN_INFO* pinInfo, uint requestID, HRESULT status);
    HRESULT OnEnterComplete(IMbnPin Pin, MBN_PIN_INFO* pinInfo, uint requestID, HRESULT status);
    HRESULT OnChangeComplete(IMbnPin Pin, MBN_PIN_INFO* pinInfo, uint requestID, HRESULT status);
    HRESULT OnUnblockComplete(IMbnPin Pin, MBN_PIN_INFO* pinInfo, uint requestID, HRESULT status);
}
enum IID_IMbnSubscriberInformation = GUID(0x459ecc43, 0xbcf5, 0x11dc, [0xa8, 0xa8, 0x0, 0x13, 0x21, 0xf1, 0x40, 0x5f]);
interface IMbnSubscriberInformation : IUnknown
{
    HRESULT get_SubscriberID(BSTR* SubscriberID);
    HRESULT get_SimIccID(BSTR* SimIccID);
    HRESULT get_TelephoneNumbers(SAFEARRAY** TelephoneNumbers);
}
enum IID_IMbnSignal = GUID(0xdcbbbab6, 0x2003, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSignal : IUnknown
{
    HRESULT GetSignalStrength(uint* signalStrength);
    HRESULT GetSignalError(uint* signalError);
}
enum IID_IMbnSignalEvents = GUID(0xdcbbbab6, 0x2004, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSignalEvents : IUnknown
{
    HRESULT OnSignalStateChange(IMbnSignal newInterface);
}
enum IID_IMbnConnectionContext = GUID(0xdcbbbab6, 0x200b, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionContext : IUnknown
{
    HRESULT GetProvisionedContexts(SAFEARRAY** provisionedContexts);
    HRESULT SetProvisionedContext(MBN_CONTEXT provisionedContexts, const(wchar)* providerID, uint* requestID);
}
enum IID_IMbnConnectionContextEvents = GUID(0xdcbbbab6, 0x200c, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionContextEvents : IUnknown
{
    HRESULT OnProvisionedContextListChange(IMbnConnectionContext newInterface);
    HRESULT OnSetProvisionedContextComplete(IMbnConnectionContext newInterface, uint requestID, HRESULT status);
}
enum IID_IMbnConnectionProfileManager = GUID(0xdcbbbab6, 0x200f, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionProfileManager : IUnknown
{
    HRESULT GetConnectionProfiles(IMbnInterface mbnInterface, SAFEARRAY** connectionProfiles);
    HRESULT GetConnectionProfile(IMbnInterface mbnInterface, const(wchar)* profileName, IMbnConnectionProfile* connectionProfile);
    HRESULT CreateConnectionProfile(const(wchar)* xmlProfile);
}
enum IID_IMbnConnectionProfile = GUID(0xdcbbbab6, 0x2010, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionProfile : IUnknown
{
    HRESULT GetProfileXmlData(BSTR* profileData);
    HRESULT UpdateProfile(const(wchar)* strProfile);
    HRESULT Delete();
}
enum IID_IMbnConnectionProfileEvents = GUID(0xdcbbbab6, 0x2011, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionProfileEvents : IUnknown
{
    HRESULT OnProfileUpdate(IMbnConnectionProfile newProfile);
}
enum IID_IMbnSmsConfiguration = GUID(0xdcbbbab6, 0x2012, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSmsConfiguration : IUnknown
{
    HRESULT get_ServiceCenterAddress(BSTR* scAddress);
    HRESULT put_ServiceCenterAddress(const(wchar)* scAddress);
    HRESULT get_MaxMessageIndex(uint* index);
    HRESULT get_CdmaShortMsgSize(uint* shortMsgSize);
    HRESULT get_SmsFormat(MBN_SMS_FORMAT* smsFormat);
    HRESULT put_SmsFormat(MBN_SMS_FORMAT smsFormat);
}
enum IID_IMbnSmsReadMsgPdu = GUID(0xdcbbbab6, 0x2013, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSmsReadMsgPdu : IUnknown
{
    HRESULT get_Index(uint* Index);
    HRESULT get_Status(MBN_MSG_STATUS* Status);
    HRESULT get_PduData(BSTR* PduData);
    HRESULT get_Message(SAFEARRAY** Message);
}
enum IID_IMbnSmsReadMsgTextCdma = GUID(0xdcbbbab6, 0x2014, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSmsReadMsgTextCdma : IUnknown
{
    HRESULT get_Index(uint* Index);
    HRESULT get_Status(MBN_MSG_STATUS* Status);
    HRESULT get_Address(BSTR* Address);
    HRESULT get_Timestamp(BSTR* Timestamp);
    HRESULT get_EncodingID(MBN_SMS_CDMA_ENCODING* EncodingID);
    HRESULT get_LanguageID(MBN_SMS_CDMA_LANG* LanguageID);
    HRESULT get_SizeInCharacters(uint* SizeInCharacters);
    HRESULT get_Message(SAFEARRAY** Message);
}
enum IID_IMbnSms = GUID(0xdcbbbab6, 0x2015, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSms : IUnknown
{
    HRESULT GetSmsConfiguration(IMbnSmsConfiguration* smsConfiguration);
    HRESULT SetSmsConfiguration(IMbnSmsConfiguration smsConfiguration, uint* requestID);
    HRESULT SmsSendPdu(const(wchar)* pduData, ubyte size, uint* requestID);
    HRESULT SmsSendCdma(const(wchar)* address, MBN_SMS_CDMA_ENCODING encoding, MBN_SMS_CDMA_LANG language, uint sizeInCharacters, SAFEARRAY* message, uint* requestID);
    HRESULT SmsSendCdmaPdu(SAFEARRAY* message, uint* requestID);
    HRESULT SmsRead(MBN_SMS_FILTER* smsFilter, MBN_SMS_FORMAT smsFormat, uint* requestID);
    HRESULT SmsDelete(MBN_SMS_FILTER* smsFilter, uint* requestID);
    HRESULT GetSmsStatus(MBN_SMS_STATUS_INFO* smsStatusInfo);
}
enum IID_IMbnSmsEvents = GUID(0xdcbbbab6, 0x2016, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnSmsEvents : IUnknown
{
    HRESULT OnSmsConfigurationChange(IMbnSms sms);
    HRESULT OnSetSmsConfigurationComplete(IMbnSms sms, uint requestID, HRESULT status);
    HRESULT OnSmsSendComplete(IMbnSms sms, uint requestID, HRESULT status);
    HRESULT OnSmsReadComplete(IMbnSms sms, MBN_SMS_FORMAT smsFormat, SAFEARRAY* readMsgs, VARIANT_BOOL moreMsgs, uint requestID, HRESULT status);
    HRESULT OnSmsNewClass0Message(IMbnSms sms, MBN_SMS_FORMAT smsFormat, SAFEARRAY* readMsgs);
    HRESULT OnSmsDeleteComplete(IMbnSms sms, uint requestID, HRESULT status);
    HRESULT OnSmsStatusChange(IMbnSms sms);
}
enum IID_IMbnServiceActivation = GUID(0xdcbbbab6, 0x2017, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnServiceActivation : IUnknown
{
    HRESULT Activate(SAFEARRAY* vendorSpecificData, uint* requestID);
}
enum IID_IMbnServiceActivationEvents = GUID(0xdcbbbab6, 0x2018, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnServiceActivationEvents : IUnknown
{
    HRESULT OnActivationComplete(IMbnServiceActivation serviceActivation, SAFEARRAY* vendorSpecificData, uint requestID, HRESULT status, uint networkError);
}
enum IID_IMbnVendorSpecificOperation = GUID(0xdcbbbab6, 0x2019, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnVendorSpecificOperation : IUnknown
{
    HRESULT SetVendorSpecific(SAFEARRAY* vendorSpecificData, uint* requestID);
}
enum IID_IMbnVendorSpecificEvents = GUID(0xdcbbbab6, 0x201a, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnVendorSpecificEvents : IUnknown
{
    HRESULT OnEventNotification(IMbnVendorSpecificOperation vendorOperation, SAFEARRAY* vendorSpecificData);
    HRESULT OnSetVendorSpecificComplete(IMbnVendorSpecificOperation vendorOperation, SAFEARRAY* vendorSpecificData, uint requestID);
}
enum IID_IMbnConnectionProfileManagerEvents = GUID(0xdcbbbab6, 0x201f, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnConnectionProfileManagerEvents : IUnknown
{
    HRESULT OnConnectionProfileArrival(IMbnConnectionProfile newConnectionProfile);
    HRESULT OnConnectionProfileRemoval(IMbnConnectionProfile oldConnectionProfile);
}
enum IID_IMbnRadio = GUID(0xdccccab6, 0x201f, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnRadio : IUnknown
{
    HRESULT get_SoftwareRadioState(MBN_RADIO* SoftwareRadioState);
    HRESULT get_HardwareRadioState(MBN_RADIO* HardwareRadioState);
    HRESULT SetSoftwareRadioState(MBN_RADIO radioState, uint* requestID);
}
enum IID_IMbnRadioEvents = GUID(0xdcdddab6, 0x201f, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnRadioEvents : IUnknown
{
    HRESULT OnRadioStateChange(IMbnRadio newInterface);
    HRESULT OnSetSoftwareRadioStateComplete(IMbnRadio newInterface, uint requestID, HRESULT status);
}
enum IID_IMbnMultiCarrier = GUID(0xdcbbbab6, 0x2020, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnMultiCarrier : IUnknown
{
    HRESULT SetHomeProvider(MBN_PROVIDER2* homeProvider, uint* requestID);
    HRESULT GetPreferredProviders(SAFEARRAY** preferredMulticarrierProviders);
    HRESULT GetVisibleProviders(uint* age, SAFEARRAY** visibleProviders);
    HRESULT GetSupportedCellularClasses(SAFEARRAY** cellularClasses);
    HRESULT GetCurrentCellularClass(MBN_CELLULAR_CLASS* currentCellularClass);
    HRESULT ScanNetwork(uint* requestID);
}
enum IID_IMbnMultiCarrierEvents = GUID(0xdcdddab6, 0x2021, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnMultiCarrierEvents : IUnknown
{
    HRESULT OnSetHomeProviderComplete(IMbnMultiCarrier mbnInterface, uint requestID, HRESULT status);
    HRESULT OnCurrentCellularClassChange(IMbnMultiCarrier mbnInterface);
    HRESULT OnPreferredProvidersChange(IMbnMultiCarrier mbnInterface);
    HRESULT OnScanNetworkComplete(IMbnMultiCarrier mbnInterface, uint requestID, HRESULT status);
    HRESULT OnInterfaceCapabilityChange(IMbnMultiCarrier mbnInterface);
}
enum IID_IMbnDeviceServiceStateEvents = GUID(0x5d3ff196, 0x89ee, 0x49d8, [0x8b, 0x60, 0x33, 0xff, 0xdd, 0xff, 0xc5, 0x8d]);
interface IMbnDeviceServiceStateEvents : IUnknown
{
    HRESULT OnSessionsStateChange(BSTR interfaceID, MBN_DEVICE_SERVICE_SESSIONS_STATE stateChange);
}
enum IID_IMbnDeviceServicesManager = GUID(0x20a26258, 0x6811, 0x4478, [0xac, 0x1d, 0x13, 0x32, 0x4e, 0x45, 0xe4, 0x1c]);
interface IMbnDeviceServicesManager : IUnknown
{
    HRESULT GetDeviceServicesContext(BSTR networkInterfaceID, IMbnDeviceServicesContext* mbnDevicesContext);
}
enum IID_IMbnDeviceServicesContext = GUID(0xfc5ac347, 0x1592, 0x4068, [0x80, 0xbb, 0x6a, 0x57, 0x58, 0x1, 0x50, 0xd8]);
interface IMbnDeviceServicesContext : IUnknown
{
    HRESULT EnumerateDeviceServices(SAFEARRAY** deviceServices);
    HRESULT GetDeviceService(BSTR deviceServiceID, IMbnDeviceService* mbnDeviceService);
    HRESULT get_MaxCommandSize(uint* maxCommandSize);
    HRESULT get_MaxDataSize(uint* maxDataSize);
}
enum IID_IMbnDeviceServicesEvents = GUID(0xa900c19, 0x6824, 0x4e97, [0xb7, 0x6e, 0xcf, 0x23, 0x9d, 0xc, 0xa6, 0x42]);
interface IMbnDeviceServicesEvents : IUnknown
{
    HRESULT OnQuerySupportedCommandsComplete(IMbnDeviceService deviceService, SAFEARRAY* commandIDList, HRESULT status, uint requestID);
    HRESULT OnOpenCommandSessionComplete(IMbnDeviceService deviceService, HRESULT status, uint requestID);
    HRESULT OnCloseCommandSessionComplete(IMbnDeviceService deviceService, HRESULT status, uint requestID);
    HRESULT OnSetCommandComplete(IMbnDeviceService deviceService, uint responseID, SAFEARRAY* deviceServiceData, HRESULT status, uint requestID);
    HRESULT OnQueryCommandComplete(IMbnDeviceService deviceService, uint responseID, SAFEARRAY* deviceServiceData, HRESULT status, uint requestID);
    HRESULT OnEventNotification(IMbnDeviceService deviceService, uint eventID, SAFEARRAY* deviceServiceData);
    HRESULT OnOpenDataSessionComplete(IMbnDeviceService deviceService, HRESULT status, uint requestID);
    HRESULT OnCloseDataSessionComplete(IMbnDeviceService deviceService, HRESULT status, uint requestID);
    HRESULT OnWriteDataComplete(IMbnDeviceService deviceService, HRESULT status, uint requestID);
    HRESULT OnReadData(IMbnDeviceService deviceService, SAFEARRAY* deviceServiceData);
    HRESULT OnInterfaceStateChange(BSTR interfaceID, MBN_DEVICE_SERVICES_INTERFACE_STATE stateChange);
}
enum IID_IMbnDeviceService = GUID(0xb3bb9a71, 0xdc70, 0x4be9, [0xa4, 0xda, 0x78, 0x86, 0xae, 0x8b, 0x19, 0x1b]);
interface IMbnDeviceService : IUnknown
{
    HRESULT QuerySupportedCommands(uint* requestID);
    HRESULT OpenCommandSession(uint* requestID);
    HRESULT CloseCommandSession(uint* requestID);
    HRESULT SetCommand(uint commandID, SAFEARRAY* deviceServiceData, uint* requestID);
    HRESULT QueryCommand(uint commandID, SAFEARRAY* deviceServiceData, uint* requestID);
    HRESULT OpenDataSession(uint* requestID);
    HRESULT CloseDataSession(uint* requestID);
    HRESULT WriteData(SAFEARRAY* deviceServiceData, uint* requestID);
    HRESULT get_InterfaceID(BSTR* InterfaceID);
    HRESULT get_DeviceServiceID(BSTR* DeviceServiceID);
    HRESULT get_IsCommandSessionOpen(BOOL* value);
    HRESULT get_IsDataSessionOpen(BOOL* value);
}
struct __mbnapi_ReferenceRemainingTypes__
{
    MBN_BAND_CLASS bandClass;
    MBN_CONTEXT_CONSTANTS contextConstants;
    MBN_CTRL_CAPS ctrlCaps;
    MBN_DATA_CLASS dataClass;
    MBN_INTERFACE_CAPS_CONSTANTS interfaceCapsConstants;
    MBN_PIN_CONSTANTS pinConstants;
    MBN_PROVIDER_CONSTANTS providerConstants;
    MBN_PROVIDER_STATE providerState;
    MBN_REGISTRATION_CONSTANTS registrationConstants;
    MBN_SIGNAL_CONSTANTS signalConstants;
    MBN_SMS_CAPS smsCaps;
    WWAEXT_SMS_CONSTANTS smsConstants;
    WWAEXT_SMS_CONSTANTS wwaextSmsConstants;
    MBN_SMS_STATUS_FLAG smsStatusFlag;
}
struct __DummyPinType__
{
    uint pinType;
}
enum IID_IMbnPin = GUID(0xdcbbbab6, 0x2007, 0x4bbb, [0xaa, 0xee, 0x33, 0x8e, 0x36, 0x8a, 0xf6, 0xfa]);
interface IMbnPin : IUnknown
{
    HRESULT get_PinType(MBN_PIN_TYPE* PinType);
    HRESULT get_PinFormat(MBN_PIN_FORMAT* PinFormat);
    HRESULT get_PinLengthMin(uint* PinLengthMin);
    HRESULT get_PinLengthMax(uint* PinLengthMax);
    HRESULT get_PinMode(MBN_PIN_MODE* PinMode);
    HRESULT Enable(const(wchar)* pin, uint* requestID);
    HRESULT Disable(const(wchar)* pin, uint* requestID);
    HRESULT Enter(const(wchar)* pin, uint* requestID);
    HRESULT Change(const(wchar)* pin, const(wchar)* newPin, uint* requestID);
    HRESULT Unblock(const(wchar)* puk, const(wchar)* newPin, uint* requestID);
    HRESULT GetPinManager(IMbnPinManager* pinManager);
}
enum CLSID_MbnConnectionProfileManager = GUID(0xbdfee05a, 0x4418, 0x11dd, [0x90, 0xed, 0x0, 0x1c, 0x25, 0x7c, 0xcf, 0xf1]);
struct MbnConnectionProfileManager
{
}
enum CLSID_MbnInterfaceManager = GUID(0xbdfee05b, 0x4418, 0x11dd, [0x90, 0xed, 0x0, 0x1c, 0x25, 0x7c, 0xcf, 0xf1]);
struct MbnInterfaceManager
{
}
enum CLSID_MbnConnectionManager = GUID(0xbdfee05c, 0x4418, 0x11dd, [0x90, 0xed, 0x0, 0x1c, 0x25, 0x7c, 0xcf, 0xf1]);
struct MbnConnectionManager
{
}
enum CLSID_MbnDeviceServicesManager = GUID(0x2269daa3, 0x2a9f, 0x4165, [0xa5, 0x1, 0xce, 0x0, 0xa6, 0xf7, 0xa7, 0x5b]);
struct MbnDeviceServicesManager
{
}
