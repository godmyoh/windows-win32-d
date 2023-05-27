module windows.win32.security.extensibleauthenticationprotocol;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMDocument2, IXMLDOMNode;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, PWSTR;
import windows.win32.security.cryptography : NCRYPT_KEY_HANDLE;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

uint EapHostPeerGetMethods(EAP_METHOD_INFO_ARRAY*, EAP_ERROR**);
uint EapHostPeerGetMethodProperties(uint, uint, EAP_METHOD_TYPE, HANDLE, uint, const(ubyte)*, uint, const(ubyte)*, EAP_METHOD_PROPERTY_ARRAY*, EAP_ERROR**);
uint EapHostPeerInvokeConfigUI(HWND, uint, EAP_METHOD_TYPE, uint, const(ubyte)*, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerQueryCredentialInputFields(HANDLE, EAP_METHOD_TYPE, uint, uint, const(ubyte)*, EAP_CONFIG_INPUT_FIELD_ARRAY*, EAP_ERROR**);
uint EapHostPeerQueryUserBlobFromCredentialInputFields(HANDLE, EAP_METHOD_TYPE, uint, uint, const(ubyte)*, const(EAP_CONFIG_INPUT_FIELD_ARRAY)*, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerInvokeIdentityUI(uint, EAP_METHOD_TYPE, uint, HWND, uint, const(ubyte)*, uint, const(ubyte)*, uint*, ubyte**, PWSTR*, EAP_ERROR**, void**);
uint EapHostPeerInvokeInteractiveUI(HWND, uint, const(ubyte)*, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerQueryInteractiveUIInputFields(uint, uint, uint, const(ubyte)*, EAP_INTERACTIVE_UI_DATA*, EAP_ERROR**, void**);
uint EapHostPeerQueryUIBlobFromInteractiveUIInputFields(uint, uint, uint, const(ubyte)*, const(EAP_INTERACTIVE_UI_DATA)*, uint*, ubyte**, EAP_ERROR**, void**);
uint EapHostPeerConfigXml2Blob(uint, IXMLDOMNode, uint*, ubyte**, EAP_METHOD_TYPE*, EAP_ERROR**);
uint EapHostPeerCredentialsXml2Blob(uint, IXMLDOMNode, uint, ubyte*, uint*, ubyte**, EAP_METHOD_TYPE*, EAP_ERROR**);
uint EapHostPeerConfigBlob2Xml(uint, EAP_METHOD_TYPE, uint, ubyte*, IXMLDOMDocument2*, EAP_ERROR**);
void EapHostPeerFreeMemory(ubyte*);
void EapHostPeerFreeErrorMemory(EAP_ERROR*);
uint EapHostPeerInitialize();
void EapHostPeerUninitialize();
uint EapHostPeerBeginSession(uint, EAP_METHOD_TYPE, const(EAP_ATTRIBUTES)*, HANDLE, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(GUID)*, NotificationHandler, void*, uint*, EAP_ERROR**);
uint EapHostPeerProcessReceivedPacket(uint, uint, const(ubyte)*, EapHostPeerResponseAction*, EAP_ERROR**);
uint EapHostPeerGetSendPacket(uint, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerGetResult(uint, EapHostPeerMethodResultReason, EapHostPeerMethodResult*, EAP_ERROR**);
uint EapHostPeerGetUIContext(uint, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerSetUIContext(uint, uint, const(ubyte)*, EapHostPeerResponseAction*, EAP_ERROR**);
uint EapHostPeerGetResponseAttributes(uint, EAP_ATTRIBUTES*, EAP_ERROR**);
uint EapHostPeerSetResponseAttributes(uint, const(EAP_ATTRIBUTES)*, EapHostPeerResponseAction*, EAP_ERROR**);
uint EapHostPeerGetAuthStatus(uint, EapHostPeerAuthParams, uint*, ubyte**, EAP_ERROR**);
uint EapHostPeerEndSession(uint, EAP_ERROR**);
uint EapHostPeerGetDataToUnplumbCredentials(GUID*, long*, uint, EAP_ERROR**, BOOL*);
uint EapHostPeerClearConnection(GUID*, EAP_ERROR**);
void EapHostPeerFreeEapError(EAP_ERROR*);
uint EapHostPeerGetIdentity(uint, uint, EAP_METHOD_TYPE, uint, const(ubyte)*, uint, const(ubyte)*, HANDLE, BOOL*, uint*, ubyte**, PWSTR*, EAP_ERROR**, ubyte**);
uint EapHostPeerGetEncryptedPassword(uint, PWSTR, PWSTR*);
void EapHostPeerFreeRuntimeMemory(ubyte*);
enum FACILITY_EAP_MESSAGE = 0x00000842;
enum EAP_GROUP_MASK = 0x0000ff00;
enum EAP_E_EAPHOST_FIRST = 0xffffffff80420000;
enum EAP_E_EAPHOST_LAST = 0xffffffff804200ff;
enum EAP_I_EAPHOST_FIRST = 0xffffffff80420000;
enum EAP_I_EAPHOST_LAST = 0xffffffff804200ff;
enum EAP_E_CERT_STORE_INACCESSIBLE = 0x80420010;
enum EAP_E_EAPHOST_METHOD_NOT_INSTALLED = 0x80420011;
enum EAP_E_EAPHOST_THIRDPARTY_METHOD_HOST_RESET = 0x80420012;
enum EAP_E_EAPHOST_EAPQEC_INACCESSIBLE = 0x80420013;
enum EAP_E_EAPHOST_IDENTITY_UNKNOWN = 0x80420014;
enum EAP_E_AUTHENTICATION_FAILED = 0x80420015;
enum EAP_I_EAPHOST_EAP_NEGOTIATION_FAILED = 0x40420016;
enum EAP_E_EAPHOST_METHOD_INVALID_PACKET = 0x80420017;
enum EAP_E_EAPHOST_REMOTE_INVALID_PACKET = 0x80420018;
enum EAP_E_EAPHOST_XML_MALFORMED = 0x80420019;
enum EAP_E_METHOD_CONFIG_DOES_NOT_SUPPORT_SSO = 0x8042001a;
enum EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED = 0x80420020;
enum EAP_E_USER_FIRST = 0xffffffff80420100;
enum EAP_E_USER_LAST = 0xffffffff804201ff;
enum EAP_I_USER_FIRST = 0x40420100;
enum EAP_I_USER_LAST = 0x404201ff;
enum EAP_E_USER_CERT_NOT_FOUND = 0x80420100;
enum EAP_E_USER_CERT_INVALID = 0x80420101;
enum EAP_E_USER_CERT_EXPIRED = 0x80420102;
enum EAP_E_USER_CERT_REVOKED = 0x80420103;
enum EAP_E_USER_CERT_OTHER_ERROR = 0x80420104;
enum EAP_E_USER_CERT_REJECTED = 0x80420105;
enum EAP_I_USER_ACCOUNT_OTHER_ERROR = 0x40420110;
enum EAP_E_USER_CREDENTIALS_REJECTED = 0x80420111;
enum EAP_E_USER_NAME_PASSWORD_REJECTED = 0x80420112;
enum EAP_E_NO_SMART_CARD_READER = 0x80420113;
enum EAP_E_SERVER_FIRST = 0xffffffff80420200;
enum EAP_E_SERVER_LAST = 0xffffffff804202ff;
enum EAP_E_SERVER_CERT_NOT_FOUND = 0x80420200;
enum EAP_E_SERVER_CERT_INVALID = 0x80420201;
enum EAP_E_SERVER_CERT_EXPIRED = 0x80420202;
enum EAP_E_SERVER_CERT_REVOKED = 0x80420203;
enum EAP_E_SERVER_CERT_OTHER_ERROR = 0x80420204;
enum EAP_E_USER_ROOT_CERT_FIRST = 0xffffffff80420300;
enum EAP_E_USER_ROOT_CERT_LAST = 0xffffffff804203ff;
enum EAP_E_USER_ROOT_CERT_NOT_FOUND = 0x80420300;
enum EAP_E_USER_ROOT_CERT_INVALID = 0x80420301;
enum EAP_E_USER_ROOT_CERT_EXPIRED = 0x80420302;
enum EAP_E_SERVER_ROOT_CERT_FIRST = 0xffffffff80420400;
enum EAP_E_SERVER_ROOT_CERT_LAST = 0xffffffff804204ff;
enum EAP_E_SERVER_ROOT_CERT_NOT_FOUND = 0x80420400;
enum EAP_E_SERVER_ROOT_CERT_INVALID = 0x80420401;
enum EAP_E_SERVER_ROOT_CERT_NAME_REQUIRED = 0x80420406;
enum EAP_E_SIM_NOT_VALID = 0x80420500;
enum EAP_METHOD_INVALID_PACKET = 0x80420017;
enum EAP_INVALID_PACKET = 0x80420018;
enum EAP_PEER_FLAG_GUEST_ACCESS = 0x00000040;
enum eapPropCipherSuiteNegotiation = 0x00000001;
enum eapPropMutualAuth = 0x00000002;
enum eapPropIntegrity = 0x00000004;
enum eapPropReplayProtection = 0x00000008;
enum eapPropConfidentiality = 0x00000010;
enum eapPropKeyDerivation = 0x00000020;
enum eapPropKeyStrength64 = 0x00000040;
enum eapPropKeyStrength128 = 0x00000080;
enum eapPropKeyStrength256 = 0x00000100;
enum eapPropKeyStrength512 = 0x00000200;
enum eapPropKeyStrength1024 = 0x00000400;
enum eapPropDictionaryAttackResistance = 0x00000800;
enum eapPropFastReconnect = 0x00001000;
enum eapPropCryptoBinding = 0x00002000;
enum eapPropSessionIndependence = 0x00004000;
enum eapPropFragmentation = 0x00008000;
enum eapPropChannelBinding = 0x00010000;
enum eapPropNap = 0x00020000;
enum eapPropStandalone = 0x00040000;
enum eapPropMppeEncryption = 0x00080000;
enum eapPropTunnelMethod = 0x00100000;
enum eapPropSupportsConfig = 0x00200000;
enum eapPropCertifiedMethod = 0x00400000;
enum eapPropHiddenMethod = 0x00800000;
enum eapPropMachineAuth = 0x01000000;
enum eapPropUserAuth = 0x02000000;
enum eapPropIdentityPrivacy = 0x04000000;
enum eapPropMethodChaining = 0x08000000;
enum eapPropSharedStateEquivalence = 0x10000000;
enum eapPropReserved = 0x80000000;
enum EAP_VALUENAME_PROPERTIES = "Properties";
enum EAP_FLAG_Reserved1 = 0x00000001;
enum EAP_FLAG_NON_INTERACTIVE = 0x00000002;
enum EAP_FLAG_LOGON = 0x00000004;
enum EAP_FLAG_PREVIEW = 0x00000008;
enum EAP_FLAG_Reserved2 = 0x00000010;
enum EAP_FLAG_MACHINE_AUTH = 0x00000020;
enum EAP_FLAG_GUEST_ACCESS = 0x00000040;
enum EAP_FLAG_Reserved3 = 0x00000080;
enum EAP_FLAG_Reserved4 = 0x00000100;
enum EAP_FLAG_RESUME_FROM_HIBERNATE = 0x00000200;
enum EAP_FLAG_Reserved5 = 0x00000400;
enum EAP_FLAG_Reserved6 = 0x00000800;
enum EAP_FLAG_FULL_AUTH = 0x00001000;
enum EAP_FLAG_PREFER_ALT_CREDENTIALS = 0x00002000;
enum EAP_FLAG_Reserved7 = 0x00004000;
enum EAP_PEER_FLAG_HEALTH_STATE_CHANGE = 0x00008000;
enum EAP_FLAG_SUPRESS_UI = 0x00010000;
enum EAP_FLAG_PRE_LOGON = 0x00020000;
enum EAP_FLAG_USER_AUTH = 0x00040000;
enum EAP_FLAG_CONFG_READONLY = 0x00080000;
enum EAP_FLAG_Reserved8 = 0x00100000;
enum EAP_FLAG_Reserved9 = 0x00400000;
enum EAP_FLAG_VPN = 0x00800000;
enum EAP_FLAG_ONLY_EAP_TLS = 0x01000000;
enum EAP_FLAG_SERVER_VALIDATION_REQUIRED = 0x02000000;
enum EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT = 0x00000000;
enum EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 0x00000001;
enum EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST = 0x00000002;
enum EAP_UI_INPUT_FIELD_PROPS_DEFAULT = 0x00000000;
enum EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 0x00000001;
enum EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST = 0x00000002;
enum EAP_UI_INPUT_FIELD_PROPS_READ_ONLY = 0x00000004;
enum EAP_CREDENTIAL_VERSION = 0x00000001;
enum EAP_INTERACTIVE_UI_DATA_VERSION = 0x00000001;
enum EAPHOST_PEER_API_VERSION = 0x00000001;
enum EAPHOST_METHOD_API_VERSION = 0x00000001;
enum MAX_EAP_CONFIG_INPUT_FIELD_LENGTH = 0x00000100;
enum MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH = 0x00000400;
enum CERTIFICATE_HASH_LENGTH = 0x00000014;
enum NCRYPT_PIN_CACHE_PIN_BYTE_LENGTH = 0x0000005a;
enum EAP_REGISTRY_LOCATION = "System\\CurrentControlSet\\Services\\EapHost\\Methods";
enum EAP_PEER_VALUENAME_DLL_PATH = "PeerDllPath";
enum EAP_PEER_VALUENAME_FRIENDLY_NAME = "PeerFriendlyName";
enum EAP_PEER_VALUENAME_CONFIGUI = "PeerConfigUIPath";
enum EAP_PEER_VALUENAME_REQUIRE_CONFIGUI = "PeerRequireConfigUI";
enum EAP_PEER_VALUENAME_IDENTITY = "PeerIdentityPath";
enum EAP_PEER_VALUENAME_INTERACTIVEUI = "PeerInteractiveUIPath";
enum EAP_PEER_VALUENAME_INVOKE_NAMEDLG = "PeerInvokeUsernameDialog";
enum EAP_PEER_VALUENAME_INVOKE_PWDDLG = "PeerInvokePasswordDialog";
enum EAP_PEER_VALUENAME_PROPERTIES = "Properties";
enum EAP_AUTHENTICATOR_VALUENAME_DLL_PATH = "AuthenticatorDllPath";
enum EAP_AUTHENTICATOR_VALUENAME_FRIENDLY_NAME = "AuthenticatorFriendlyName";
enum EAP_AUTHENTICATOR_VALUENAME_PROPERTIES = "Properties";
enum EAP_AUTHENTICATOR_VALUENAME_CONFIGUI = "AuthenticatorConfigUIPath";
enum EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY = 0x00000001;
enum RAS_EAP_REGISTRY_LOCATION = "System\\CurrentControlSet\\Services\\Rasman\\PPP\\EAP";
enum RAS_EAP_VALUENAME_PATH = "Path";
enum RAS_EAP_VALUENAME_CONFIGUI = "ConfigUIPath";
enum RAS_EAP_VALUENAME_INTERACTIVEUI = "InteractiveUIPath";
enum RAS_EAP_VALUENAME_IDENTITY = "IdentityPath";
enum RAS_EAP_VALUENAME_FRIENDLY_NAME = "FriendlyName";
enum RAS_EAP_VALUENAME_DEFAULT_DATA = "ConfigData";
enum RAS_EAP_VALUENAME_REQUIRE_CONFIGUI = "RequireConfigUI";
enum RAS_EAP_VALUENAME_ENCRYPTION = "MPPEEncryptionSupported";
enum RAS_EAP_VALUENAME_INVOKE_NAMEDLG = "InvokeUsernameDialog";
enum RAS_EAP_VALUENAME_INVOKE_PWDDLG = "InvokePasswordDialog";
enum RAS_EAP_VALUENAME_CONFIG_CLSID = "ConfigCLSID";
enum RAS_EAP_VALUENAME_STANDALONE_SUPPORTED = "StandaloneSupported";
enum RAS_EAP_VALUENAME_ROLES_SUPPORTED = "RolesSupported";
enum RAS_EAP_VALUENAME_PER_POLICY_CONFIG = "PerPolicyConfig";
enum RAS_EAP_VALUENAME_ISTUNNEL_METHOD = "IsTunnelMethod";
enum RAS_EAP_VALUENAME_FILTER_INNERMETHODS = "FilterInnerMethods";
enum RAS_EAP_ROLE_AUTHENTICATOR = 0x00000001;
enum RAS_EAP_ROLE_AUTHENTICATEE = 0x00000002;
enum RAS_EAP_ROLE_EXCLUDE_IN_EAP = 0x00000004;
enum RAS_EAP_ROLE_EXCLUDE_IN_PEAP = 0x00000008;
enum RAS_EAP_ROLE_EXCLUDE_IN_VPN = 0x00000010;
enum raatARAPChallenge = 0x00000021;
enum raatARAPOldPassword = 0x00000013;
enum raatARAPNewPassword = 0x00000014;
enum raatARAPPasswordChangeReason = 0x00000015;
enum EAPCODE_Request = 0x00000001;
enum EAPCODE_Response = 0x00000002;
enum EAPCODE_Success = 0x00000003;
enum EAPCODE_Failure = 0x00000004;
enum MAXEAPCODE = 0x00000004;
enum RAS_EAP_FLAG_ROUTER = 0x00000001;
enum RAS_EAP_FLAG_NON_INTERACTIVE = 0x00000002;
enum RAS_EAP_FLAG_LOGON = 0x00000004;
enum RAS_EAP_FLAG_PREVIEW = 0x00000008;
enum RAS_EAP_FLAG_FIRST_LINK = 0x00000010;
enum RAS_EAP_FLAG_MACHINE_AUTH = 0x00000020;
enum RAS_EAP_FLAG_GUEST_ACCESS = 0x00000040;
enum RAS_EAP_FLAG_8021X_AUTH = 0x00000080;
enum RAS_EAP_FLAG_HOSTED_IN_PEAP = 0x00000100;
enum RAS_EAP_FLAG_RESUME_FROM_HIBERNATE = 0x00000200;
enum RAS_EAP_FLAG_PEAP_UPFRONT = 0x00000400;
enum RAS_EAP_FLAG_ALTERNATIVE_USER_DB = 0x00000800;
enum RAS_EAP_FLAG_PEAP_FORCE_FULL_AUTH = 0x00001000;
enum RAS_EAP_FLAG_PRE_LOGON = 0x00020000;
enum RAS_EAP_FLAG_CONFG_READONLY = 0x00080000;
enum RAS_EAP_FLAG_RESERVED = 0x00100000;
enum RAS_EAP_FLAG_SAVE_CREDMAN = 0x00200000;
enum RAS_EAP_FLAG_SERVER_VALIDATION_REQUIRED = 0x02000000;
enum GUID_EapHost_Default = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum GUID_EapHost_Cause_MethodDLLNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1]);
enum GUID_EapHost_Repair_ContactSysadmin = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2]);
enum GUID_EapHost_Cause_CertStoreInaccessible = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x4]);
enum GUID_EapHost_Cause_Generic_AuthFailure = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x1, 0x4]);
enum GUID_EapHost_Cause_IdentityUnknown = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x2, 0x4]);
enum GUID_EapHost_Cause_SimNotValid = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x3, 0x4]);
enum GUID_EapHost_Cause_Server_CertExpired = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x5]);
enum GUID_EapHost_Cause_Server_CertInvalid = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x6]);
enum GUID_EapHost_Cause_Server_CertNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x7]);
enum GUID_EapHost_Cause_Server_CertRevoked = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x8]);
enum GUID_EapHost_Cause_Server_CertOtherError = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x1, 0x8]);
enum GUID_EapHost_Cause_User_CertExpired = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x9]);
enum GUID_EapHost_Cause_User_CertInvalid = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xa]);
enum GUID_EapHost_Cause_User_CertNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xb]);
enum GUID_EapHost_Cause_User_CertOtherError = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xc]);
enum GUID_EapHost_Cause_User_CertRejected = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xd]);
enum GUID_EapHost_Cause_User_CertRevoked = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xe]);
enum GUID_EapHost_Cause_User_Account_OtherProblem = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x1, 0xe]);
enum GUID_EapHost_Cause_User_CredsRejected = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x2, 0xe]);
enum GUID_EapHost_Cause_User_Root_CertExpired = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0xf]);
enum GUID_EapHost_Cause_User_Root_CertInvalid = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x10]);
enum GUID_EapHost_Cause_User_Root_CertNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x11]);
enum GUID_EapHost_Cause_Server_Root_CertNameRequired = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x12]);
enum GUID_EapHost_Cause_Server_Root_CertNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x1, 0x12]);
enum GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x2, 0x12]);
enum GUID_EapHost_Cause_EapQecInaccessible = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x3, 0x12]);
enum GUID_EapHost_Repair_Server_ClientSelectServerCert = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x18]);
enum GUID_EapHost_Repair_User_AuthFailure = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x19]);
enum GUID_EapHost_Repair_User_GetNewCert = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1a]);
enum GUID_EapHost_Repair_User_SelectValidCert = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1b]);
enum GUID_EapHost_Repair_Retry_Authentication = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x1, 0x1b]);
enum GUID_EapHost_Cause_EapNegotiationFailed = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1c]);
enum GUID_EapHost_Cause_XmlMalformed = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1d]);
enum GUID_EapHost_Cause_MethodDoesNotSupportOperation = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1e]);
enum GUID_EapHost_Repair_ContactAdmin_AuthFailure = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x1f]);
enum GUID_EapHost_Repair_ContactAdmin_IdentityUnknown = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x20]);
enum GUID_EapHost_Repair_ContactAdmin_NegotiationFailed = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x21]);
enum GUID_EapHost_Repair_ContactAdmin_MethodNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x22]);
enum GUID_EapHost_Repair_RestartNap = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x23]);
enum GUID_EapHost_Repair_ContactAdmin_CertStoreInaccessible = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x24]);
enum GUID_EapHost_Repair_ContactAdmin_InvalidUserAccount = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x25]);
enum GUID_EapHost_Repair_ContactAdmin_RootCertInvalid = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x26]);
enum GUID_EapHost_Repair_ContactAdmin_RootCertNotFound = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x27]);
enum GUID_EapHost_Repair_ContactAdmin_RootExpired = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x28]);
enum GUID_EapHost_Repair_ContactAdmin_CertNameAbsent = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x29]);
enum GUID_EapHost_Repair_ContactAdmin_NoSmartCardReader = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2a]);
enum GUID_EapHost_Cause_No_SmartCardReader_Found = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2b]);
enum GUID_EapHost_Repair_ContactAdmin_InvalidUserCert = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2c]);
enum GUID_EapHost_Repair_Method_Not_Support_Sso = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2d]);
enum GUID_EapHost_Repair_No_ValidSim_Found = GUID(0x9612fc67, 0x6150, 0x4209, [0xa8, 0x5e, 0xa8, 0xd8, 0x0, 0x0, 0x0, 0x2e]);
enum GUID_EapHost_Help_ObtainingCerts = GUID(0xf535eea3, 0x1bdd, 0x46ca, [0xa2, 0xfc, 0xa6, 0x65, 0x59, 0x39, 0xb7, 0xe8]);
enum GUID_EapHost_Help_Troubleshooting = GUID(0x33307acf, 0x698, 0x41ba, [0xb0, 0x14, 0xea, 0xa, 0x2e, 0xb8, 0xd0, 0xa8]);
enum GUID_EapHost_Cause_Method_Config_Does_Not_Support_Sso = GUID(0xda18bd32, 0x4f, 0x41fa, [0xae, 0x8, 0xb, 0xc8, 0x5e, 0x58, 0x45, 0xac]);
alias RAS_AUTH_ATTRIBUTE_TYPE = int;
enum : int
{
    raatMinimum                = 0x00000000,
    raatUserName               = 0x00000001,
    raatUserPassword           = 0x00000002,
    raatMD5CHAPPassword        = 0x00000003,
    raatNASIPAddress           = 0x00000004,
    raatNASPort                = 0x00000005,
    raatServiceType            = 0x00000006,
    raatFramedProtocol         = 0x00000007,
    raatFramedIPAddress        = 0x00000008,
    raatFramedIPNetmask        = 0x00000009,
    raatFramedRouting          = 0x0000000a,
    raatFilterId               = 0x0000000b,
    raatFramedMTU              = 0x0000000c,
    raatFramedCompression      = 0x0000000d,
    raatLoginIPHost            = 0x0000000e,
    raatLoginService           = 0x0000000f,
    raatLoginTCPPort           = 0x00000010,
    raatUnassigned17           = 0x00000011,
    raatReplyMessage           = 0x00000012,
    raatCallbackNumber         = 0x00000013,
    raatCallbackId             = 0x00000014,
    raatUnassigned21           = 0x00000015,
    raatFramedRoute            = 0x00000016,
    raatFramedIPXNetwork       = 0x00000017,
    raatState                  = 0x00000018,
    raatClass                  = 0x00000019,
    raatVendorSpecific         = 0x0000001a,
    raatSessionTimeout         = 0x0000001b,
    raatIdleTimeout            = 0x0000001c,
    raatTerminationAction      = 0x0000001d,
    raatCalledStationId        = 0x0000001e,
    raatCallingStationId       = 0x0000001f,
    raatNASIdentifier          = 0x00000020,
    raatProxyState             = 0x00000021,
    raatLoginLATService        = 0x00000022,
    raatLoginLATNode           = 0x00000023,
    raatLoginLATGroup          = 0x00000024,
    raatFramedAppleTalkLink    = 0x00000025,
    raatFramedAppleTalkNetwork = 0x00000026,
    raatFramedAppleTalkZone    = 0x00000027,
    raatAcctStatusType         = 0x00000028,
    raatAcctDelayTime          = 0x00000029,
    raatAcctInputOctets        = 0x0000002a,
    raatAcctOutputOctets       = 0x0000002b,
    raatAcctSessionId          = 0x0000002c,
    raatAcctAuthentic          = 0x0000002d,
    raatAcctSessionTime        = 0x0000002e,
    raatAcctInputPackets       = 0x0000002f,
    raatAcctOutputPackets      = 0x00000030,
    raatAcctTerminateCause     = 0x00000031,
    raatAcctMultiSessionId     = 0x00000032,
    raatAcctLinkCount          = 0x00000033,
    raatAcctEventTimeStamp     = 0x00000037,
    raatMD5CHAPChallenge       = 0x0000003c,
    raatNASPortType            = 0x0000003d,
    raatPortLimit              = 0x0000003e,
    raatLoginLATPort           = 0x0000003f,
    raatTunnelType             = 0x00000040,
    raatTunnelMediumType       = 0x00000041,
    raatTunnelClientEndpoint   = 0x00000042,
    raatTunnelServerEndpoint   = 0x00000043,
    raatARAPPassword           = 0x00000046,
    raatARAPFeatures           = 0x00000047,
    raatARAPZoneAccess         = 0x00000048,
    raatARAPSecurity           = 0x00000049,
    raatARAPSecurityData       = 0x0000004a,
    raatPasswordRetry          = 0x0000004b,
    raatPrompt                 = 0x0000004c,
    raatConnectInfo            = 0x0000004d,
    raatConfigurationToken     = 0x0000004e,
    raatEAPMessage             = 0x0000004f,
    raatSignature              = 0x00000050,
    raatARAPChallengeResponse  = 0x00000054,
    raatAcctInterimInterval    = 0x00000055,
    raatNASIPv6Address         = 0x0000005f,
    raatFramedInterfaceId      = 0x00000060,
    raatFramedIPv6Prefix       = 0x00000061,
    raatLoginIPv6Host          = 0x00000062,
    raatFramedIPv6Route        = 0x00000063,
    raatFramedIPv6Pool         = 0x00000064,
    raatARAPGuestLogon         = 0x00001fa0,
    raatCertificateOID         = 0x00001fa1,
    raatEAPConfiguration       = 0x00001fa2,
    raatPEAPEmbeddedEAPTypeId  = 0x00001fa3,
    raatInnerEAPTypeId         = 0x00001fa3,
    raatPEAPFastRoamedSession  = 0x00001fa4,
    raatFastRoamedSession      = 0x00001fa4,
    raatEAPTLV                 = 0x00001fa6,
    raatCredentialsChanged     = 0x00001fa7,
    raatCertificateThumbprint  = 0x0000203a,
    raatPeerId                 = 0x00002328,
    raatServerId               = 0x00002329,
    raatMethodId               = 0x0000232a,
    raatEMSK                   = 0x0000232b,
    raatSessionId              = 0x0000232c,
    raatReserved               = 0xffffffff,
}

struct NgcTicketContext
{
    wchar[45] wszTicket;
    NCRYPT_KEY_HANDLE hKey;
    HANDLE hImpersonateToken;
}
struct RAS_AUTH_ATTRIBUTE
{
    RAS_AUTH_ATTRIBUTE_TYPE raaType;
    uint dwLength;
    void* Value;
}
struct PPP_EAP_PACKET
{
    ubyte Code;
    ubyte Id;
    ubyte[2] Length;
    ubyte[1] Data;
}
struct PPP_EAP_INPUT
{
    uint dwSizeInBytes;
    uint fFlags;
    BOOL fAuthenticator;
    PWSTR pwszIdentity;
    PWSTR pwszPassword;
    ubyte bInitialId;
    RAS_AUTH_ATTRIBUTE* pUserAttributes;
    BOOL fAuthenticationComplete;
    uint dwAuthResultCode;
    HANDLE hTokenImpersonateUser;
    BOOL fSuccessPacketReceived;
    BOOL fDataReceivedFromInteractiveUI;
    ubyte* pDataFromInteractiveUI;
    uint dwSizeOfDataFromInteractiveUI;
    ubyte* pConnectionData;
    uint dwSizeOfConnectionData;
    ubyte* pUserData;
    uint dwSizeOfUserData;
    HANDLE hReserved;
    GUID guidConnectionId;
    BOOL isVpn;
}
alias PPP_EAP_ACTION = int;
enum : int
{
    EAPACTION_NoAction                   = 0x00000000,
    EAPACTION_Authenticate               = 0x00000001,
    EAPACTION_Done                       = 0x00000002,
    EAPACTION_SendAndDone                = 0x00000003,
    EAPACTION_Send                       = 0x00000004,
    EAPACTION_SendWithTimeout            = 0x00000005,
    EAPACTION_SendWithTimeoutInteractive = 0x00000006,
    EAPACTION_IndicateTLV                = 0x00000007,
    EAPACTION_IndicateIdentity           = 0x00000008,
}

struct PPP_EAP_OUTPUT
{
    uint dwSizeInBytes;
    PPP_EAP_ACTION Action;
    uint dwAuthResultCode;
    RAS_AUTH_ATTRIBUTE* pUserAttributes;
    BOOL fInvokeInteractiveUI;
    ubyte* pUIContextData;
    uint dwSizeOfUIContextData;
    BOOL fSaveConnectionData;
    ubyte* pConnectionData;
    uint dwSizeOfConnectionData;
    BOOL fSaveUserData;
    ubyte* pUserData;
    uint dwSizeOfUserData;
    NgcTicketContext* pNgcKerbTicket;
    BOOL fSaveToCredMan;
}
struct PPP_EAP_INFO
{
    uint dwSizeInBytes;
    uint dwEapTypeId;
    long RasEapInitialize;
    long RasEapBegin;
    long RasEapEnd;
    long RasEapMakeMessage;
}
struct LEGACY_IDENTITY_UI_PARAMS
{
    uint eapType;
    uint dwFlags;
    uint dwSizeofConnectionData;
    ubyte* pConnectionData;
    uint dwSizeofUserData;
    ubyte* pUserData;
    uint dwSizeofUserDataOut;
    ubyte* pUserDataOut;
    PWSTR pwszIdentity;
    uint dwError;
}
struct LEGACY_INTERACTIVE_UI_PARAMS
{
    uint eapType;
    uint dwSizeofContextData;
    ubyte* pContextData;
    uint dwSizeofInteractiveUIData;
    ubyte* pInteractiveUIData;
    uint dwError;
}
enum IID_IRouterProtocolConfig = GUID(0x66a2db16, 0xd706, 0x11d0, [0xa3, 0x7b, 0x0, 0xc0, 0x4f, 0xc9, 0xda, 0x4]);
interface IRouterProtocolConfig : IUnknown
{
    HRESULT AddProtocol(const(wchar)*, uint, uint, HWND, uint, IUnknown, ulong);
    HRESULT RemoveProtocol(const(wchar)*, uint, uint, HWND, uint, IUnknown, ulong);
}
enum IID_IAuthenticationProviderConfig = GUID(0x66a2db17, 0xd706, 0x11d0, [0xa3, 0x7b, 0x0, 0xc0, 0x4f, 0xc9, 0xda, 0x4]);
interface IAuthenticationProviderConfig : IUnknown
{
    HRESULT Initialize(const(wchar)*, ulong*);
    HRESULT Uninitialize(ulong);
    HRESULT Configure(ulong, HWND, uint, ulong, ulong);
    HRESULT Activate(ulong, ulong, ulong);
    HRESULT Deactivate(ulong, ulong, ulong);
}
enum IID_IAccountingProviderConfig = GUID(0x66a2db18, 0xd706, 0x11d0, [0xa3, 0x7b, 0x0, 0xc0, 0x4f, 0xc9, 0xda, 0x4]);
interface IAccountingProviderConfig : IUnknown
{
    HRESULT Initialize(const(wchar)*, ulong*);
    HRESULT Uninitialize(ulong);
    HRESULT Configure(ulong, HWND, uint, ulong, ulong);
    HRESULT Activate(ulong, ulong, ulong);
    HRESULT Deactivate(ulong, ulong, ulong);
}
enum IID_IEAPProviderConfig = GUID(0x66a2db19, 0xd706, 0x11d0, [0xa3, 0x7b, 0x0, 0xc0, 0x4f, 0xc9, 0xda, 0x4]);
interface IEAPProviderConfig : IUnknown
{
    HRESULT Initialize(const(wchar)*, uint, ulong*);
    HRESULT Uninitialize(uint, ulong);
    HRESULT ServerInvokeConfigUI(uint, ulong, HWND, ulong, ulong);
    HRESULT RouterInvokeConfigUI(uint, ulong, HWND, uint, ubyte*, uint, ubyte**, uint*);
    HRESULT RouterInvokeCredentialsUI(uint, ulong, HWND, uint, ubyte*, uint, ubyte*, uint, ubyte**, uint*);
}
enum IID_IEAPProviderConfig2 = GUID(0xd565917a, 0x85c4, 0x4466, [0x85, 0x6e, 0x67, 0x1c, 0x37, 0x42, 0xea, 0x9a]);
interface IEAPProviderConfig2 : IEAPProviderConfig
{
    HRESULT ServerInvokeConfigUI2(uint, ulong, HWND, const(ubyte)*, uint, ubyte**, uint*);
    HRESULT GetGlobalConfig(uint, ubyte**, uint*);
}
enum IID_IEAPProviderConfig3 = GUID(0xb78ecd12, 0x68bb, 0x4f86, [0x9b, 0xf0, 0x84, 0x38, 0xdd, 0x3b, 0xe9, 0x82]);
interface IEAPProviderConfig3 : IEAPProviderConfig2
{
    HRESULT ServerInvokeCertificateConfigUI(uint, ulong, HWND, const(ubyte)*, uint, ubyte**, uint*, ulong);
}
struct EAP_TYPE
{
    ubyte type;
    uint dwVendorId;
    uint dwVendorType;
}
struct EAP_METHOD_TYPE
{
    EAP_TYPE eapType;
    uint dwAuthorId;
}
struct EAP_METHOD_INFO
{
    EAP_METHOD_TYPE eaptype;
    PWSTR pwszAuthorName;
    PWSTR pwszFriendlyName;
    uint eapProperties;
    EAP_METHOD_INFO* pInnerMethodInfo;
}
struct EAP_METHOD_INFO_EX
{
    EAP_METHOD_TYPE eaptype;
    PWSTR pwszAuthorName;
    PWSTR pwszFriendlyName;
    uint eapProperties;
    EAP_METHOD_INFO_ARRAY_EX* pInnerMethodInfoArray;
}
struct EAP_METHOD_INFO_ARRAY
{
    uint dwNumberOfMethods;
    EAP_METHOD_INFO* pEapMethods;
}
struct EAP_METHOD_INFO_ARRAY_EX
{
    uint dwNumberOfMethods;
    EAP_METHOD_INFO_EX* pEapMethods;
}
struct EAP_ERROR
{
    uint dwWinError;
    EAP_METHOD_TYPE type;
    uint dwReasonCode;
    GUID rootCauseGuid;
    GUID repairGuid;
    GUID helpLinkGuid;
    PWSTR pRootCauseString;
    PWSTR pRepairString;
}
alias EAP_ATTRIBUTE_TYPE = int;
enum : int
{
    eatMinimum                = 0x00000000,
    eatUserName               = 0x00000001,
    eatUserPassword           = 0x00000002,
    eatMD5CHAPPassword        = 0x00000003,
    eatNASIPAddress           = 0x00000004,
    eatNASPort                = 0x00000005,
    eatServiceType            = 0x00000006,
    eatFramedProtocol         = 0x00000007,
    eatFramedIPAddress        = 0x00000008,
    eatFramedIPNetmask        = 0x00000009,
    eatFramedRouting          = 0x0000000a,
    eatFilterId               = 0x0000000b,
    eatFramedMTU              = 0x0000000c,
    eatFramedCompression      = 0x0000000d,
    eatLoginIPHost            = 0x0000000e,
    eatLoginService           = 0x0000000f,
    eatLoginTCPPort           = 0x00000010,
    eatUnassigned17           = 0x00000011,
    eatReplyMessage           = 0x00000012,
    eatCallbackNumber         = 0x00000013,
    eatCallbackId             = 0x00000014,
    eatUnassigned21           = 0x00000015,
    eatFramedRoute            = 0x00000016,
    eatFramedIPXNetwork       = 0x00000017,
    eatState                  = 0x00000018,
    eatClass                  = 0x00000019,
    eatVendorSpecific         = 0x0000001a,
    eatSessionTimeout         = 0x0000001b,
    eatIdleTimeout            = 0x0000001c,
    eatTerminationAction      = 0x0000001d,
    eatCalledStationId        = 0x0000001e,
    eatCallingStationId       = 0x0000001f,
    eatNASIdentifier          = 0x00000020,
    eatProxyState             = 0x00000021,
    eatLoginLATService        = 0x00000022,
    eatLoginLATNode           = 0x00000023,
    eatLoginLATGroup          = 0x00000024,
    eatFramedAppleTalkLink    = 0x00000025,
    eatFramedAppleTalkNetwork = 0x00000026,
    eatFramedAppleTalkZone    = 0x00000027,
    eatAcctStatusType         = 0x00000028,
    eatAcctDelayTime          = 0x00000029,
    eatAcctInputOctets        = 0x0000002a,
    eatAcctOutputOctets       = 0x0000002b,
    eatAcctSessionId          = 0x0000002c,
    eatAcctAuthentic          = 0x0000002d,
    eatAcctSessionTime        = 0x0000002e,
    eatAcctInputPackets       = 0x0000002f,
    eatAcctOutputPackets      = 0x00000030,
    eatAcctTerminateCause     = 0x00000031,
    eatAcctMultiSessionId     = 0x00000032,
    eatAcctLinkCount          = 0x00000033,
    eatAcctEventTimeStamp     = 0x00000037,
    eatMD5CHAPChallenge       = 0x0000003c,
    eatNASPortType            = 0x0000003d,
    eatPortLimit              = 0x0000003e,
    eatLoginLATPort           = 0x0000003f,
    eatTunnelType             = 0x00000040,
    eatTunnelMediumType       = 0x00000041,
    eatTunnelClientEndpoint   = 0x00000042,
    eatTunnelServerEndpoint   = 0x00000043,
    eatARAPPassword           = 0x00000046,
    eatARAPFeatures           = 0x00000047,
    eatARAPZoneAccess         = 0x00000048,
    eatARAPSecurity           = 0x00000049,
    eatARAPSecurityData       = 0x0000004a,
    eatPasswordRetry          = 0x0000004b,
    eatPrompt                 = 0x0000004c,
    eatConnectInfo            = 0x0000004d,
    eatConfigurationToken     = 0x0000004e,
    eatEAPMessage             = 0x0000004f,
    eatSignature              = 0x00000050,
    eatARAPChallengeResponse  = 0x00000054,
    eatAcctInterimInterval    = 0x00000055,
    eatNASIPv6Address         = 0x0000005f,
    eatFramedInterfaceId      = 0x00000060,
    eatFramedIPv6Prefix       = 0x00000061,
    eatLoginIPv6Host          = 0x00000062,
    eatFramedIPv6Route        = 0x00000063,
    eatFramedIPv6Pool         = 0x00000064,
    eatARAPGuestLogon         = 0x00001fa0,
    eatCertificateOID         = 0x00001fa1,
    eatEAPConfiguration       = 0x00001fa2,
    eatPEAPEmbeddedEAPTypeId  = 0x00001fa3,
    eatPEAPFastRoamedSession  = 0x00001fa4,
    eatFastRoamedSession      = 0x00001fa4,
    eatEAPTLV                 = 0x00001fa6,
    eatCredentialsChanged     = 0x00001fa7,
    eatInnerEapMethodType     = 0x00001fa8,
    eatClearTextPassword      = 0x00001fab,
    eatQuarantineSoH          = 0x00001fd6,
    eatCertificateThumbprint  = 0x0000203a,
    eatPeerId                 = 0x00002328,
    eatServerId               = 0x00002329,
    eatMethodId               = 0x0000232a,
    eatEMSK                   = 0x0000232b,
    eatSessionId              = 0x0000232c,
    eatReserved               = 0xffffffff,
}

struct EAP_ATTRIBUTE
{
    EAP_ATTRIBUTE_TYPE eaType;
    uint dwLength;
    ubyte* pValue;
}
struct EAP_ATTRIBUTES
{
    uint dwNumberOfAttributes;
    EAP_ATTRIBUTE* pAttribs;
}
alias EAP_CONFIG_INPUT_FIELD_TYPE = int;
enum : int
{
    EapConfigInputUsername        = 0x00000000,
    EapConfigInputPassword        = 0x00000001,
    EapConfigInputNetworkUsername = 0x00000002,
    EapConfigInputNetworkPassword = 0x00000003,
    EapConfigInputPin             = 0x00000004,
    EapConfigInputPSK             = 0x00000005,
    EapConfigInputEdit            = 0x00000006,
    EapConfigSmartCardUsername    = 0x00000007,
    EapConfigSmartCardError       = 0x00000008,
}

struct EAP_CONFIG_INPUT_FIELD_DATA
{
    uint dwSize;
    EAP_CONFIG_INPUT_FIELD_TYPE Type;
    uint dwFlagProps;
    PWSTR pwszLabel;
    PWSTR pwszData;
    uint dwMinDataLength;
    uint dwMaxDataLength;
}
struct EAP_CONFIG_INPUT_FIELD_ARRAY
{
    uint dwVersion;
    uint dwNumberOfFields;
    EAP_CONFIG_INPUT_FIELD_DATA* pFields;
}
alias EAP_INTERACTIVE_UI_DATA_TYPE = int;
enum : int
{
    EapCredReq        = 0x00000000,
    EapCredResp       = 0x00000001,
    EapCredExpiryReq  = 0x00000002,
    EapCredExpiryResp = 0x00000003,
    EapCredLogonReq   = 0x00000004,
    EapCredLogonResp  = 0x00000005,
}

struct EAP_CRED_EXPIRY_REQ
{
    EAP_CONFIG_INPUT_FIELD_ARRAY curCreds;
    EAP_CONFIG_INPUT_FIELD_ARRAY newCreds;
}
union EAP_UI_DATA_FORMAT
{
    EAP_CONFIG_INPUT_FIELD_ARRAY* credData;
    EAP_CRED_EXPIRY_REQ* credExpiryData;
    EAP_CONFIG_INPUT_FIELD_ARRAY* credLogonData;
}
struct EAP_INTERACTIVE_UI_DATA
{
    uint dwVersion;
    uint dwSize;
    EAP_INTERACTIVE_UI_DATA_TYPE dwDataType;
    uint cbUiData;
    EAP_UI_DATA_FORMAT pbUiData;
}
alias EAP_METHOD_PROPERTY_TYPE = int;
enum : int
{
    emptPropCipherSuiteNegotiation     = 0x00000000,
    emptPropMutualAuth                 = 0x00000001,
    emptPropIntegrity                  = 0x00000002,
    emptPropReplayProtection           = 0x00000003,
    emptPropConfidentiality            = 0x00000004,
    emptPropKeyDerivation              = 0x00000005,
    emptPropKeyStrength64              = 0x00000006,
    emptPropKeyStrength128             = 0x00000007,
    emptPropKeyStrength256             = 0x00000008,
    emptPropKeyStrength512             = 0x00000009,
    emptPropKeyStrength1024            = 0x0000000a,
    emptPropDictionaryAttackResistance = 0x0000000b,
    emptPropFastReconnect              = 0x0000000c,
    emptPropCryptoBinding              = 0x0000000d,
    emptPropSessionIndependence        = 0x0000000e,
    emptPropFragmentation              = 0x0000000f,
    emptPropChannelBinding             = 0x00000010,
    emptPropNap                        = 0x00000011,
    emptPropStandalone                 = 0x00000012,
    emptPropMppeEncryption             = 0x00000013,
    emptPropTunnelMethod               = 0x00000014,
    emptPropSupportsConfig             = 0x00000015,
    emptPropCertifiedMethod            = 0x00000016,
    emptPropHiddenMethod               = 0x00000017,
    emptPropMachineAuth                = 0x00000018,
    emptPropUserAuth                   = 0x00000019,
    emptPropIdentityPrivacy            = 0x0000001a,
    emptPropMethodChaining             = 0x0000001b,
    emptPropSharedStateEquivalence     = 0x0000001c,
    emptLegacyMethodPropertyFlag       = 0x0000001f,
    emptPropVendorSpecific             = 0x000000ff,
}

alias EAP_METHOD_PROPERTY_VALUE_TYPE = int;
enum : int
{
    empvtBool   = 0x00000000,
    empvtDword  = 0x00000001,
    empvtString = 0x00000002,
}

struct EAP_METHOD_PROPERTY_VALUE_BOOL
{
    uint length;
    BOOL value;
}
struct EAP_METHOD_PROPERTY_VALUE_DWORD
{
    uint length;
    uint value;
}
struct EAP_METHOD_PROPERTY_VALUE_STRING
{
    uint length;
    ubyte* value;
}
union EAP_METHOD_PROPERTY_VALUE
{
    EAP_METHOD_PROPERTY_VALUE_BOOL empvBool;
    EAP_METHOD_PROPERTY_VALUE_DWORD empvDword;
    EAP_METHOD_PROPERTY_VALUE_STRING empvString;
}
struct EAP_METHOD_PROPERTY
{
    EAP_METHOD_PROPERTY_TYPE eapMethodPropertyType;
    EAP_METHOD_PROPERTY_VALUE_TYPE eapMethodPropertyValueType;
    EAP_METHOD_PROPERTY_VALUE eapMethodPropertyValue;
}
struct EAP_METHOD_PROPERTY_ARRAY
{
    uint dwNumberOfProperties;
    EAP_METHOD_PROPERTY* pMethodProperty;
}
struct EAPHOST_IDENTITY_UI_PARAMS
{
    EAP_METHOD_TYPE eapMethodType;
    uint dwFlags;
    uint dwSizeofConnectionData;
    ubyte* pConnectionData;
    uint dwSizeofUserData;
    ubyte* pUserData;
    uint dwSizeofUserDataOut;
    ubyte* pUserDataOut;
    PWSTR pwszIdentity;
    uint dwError;
    EAP_ERROR* pEapError;
}
struct EAPHOST_INTERACTIVE_UI_PARAMS
{
    uint dwSizeofContextData;
    ubyte* pContextData;
    uint dwSizeofInteractiveUIData;
    ubyte* pInteractiveUIData;
    uint dwError;
    EAP_ERROR* pEapError;
}
alias EapCredentialType = int;
enum : int
{
    EAP_EMPTY_CREDENTIAL             = 0x00000000,
    EAP_USERNAME_PASSWORD_CREDENTIAL = 0x00000001,
    EAP_WINLOGON_CREDENTIAL          = 0x00000002,
    EAP_CERTIFICATE_CREDENTIAL       = 0x00000003,
    EAP_SIM_CREDENTIAL               = 0x00000004,
}

struct EapUsernamePasswordCredential
{
    PWSTR username;
    PWSTR password;
}
struct EapCertificateCredential
{
    ubyte[20] certHash;
    PWSTR password;
}
struct EapSimCredential
{
    PWSTR iccID;
}
union EapCredentialTypeData
{
    EapUsernamePasswordCredential username_password;
    EapCertificateCredential certificate;
    EapSimCredential sim;
}
struct EapCredential
{
    EapCredentialType credType;
    EapCredentialTypeData credData;
}
alias EapHostPeerMethodResultReason = int;
enum : int
{
    EapHostPeerMethodResultAltSuccessReceived = 0x00000001,
    EapHostPeerMethodResultTimeout            = 0x00000002,
    EapHostPeerMethodResultFromMethod         = 0x00000003,
}

alias EapHostPeerResponseAction = int;
enum : int
{
    EapHostPeerResponseDiscard             = 0x00000000,
    EapHostPeerResponseSend                = 0x00000001,
    EapHostPeerResponseResult              = 0x00000002,
    EapHostPeerResponseInvokeUi            = 0x00000003,
    EapHostPeerResponseRespond             = 0x00000004,
    EapHostPeerResponseStartAuthentication = 0x00000005,
    EapHostPeerResponseNone                = 0x00000006,
}

alias EapHostPeerAuthParams = int;
enum : int
{
    EapHostPeerAuthStatus           = 0x00000001,
    EapHostPeerIdentity             = 0x00000002,
    EapHostPeerIdentityExtendedInfo = 0x00000003,
    EapHostNapInfo                  = 0x00000004,
}

alias EAPHOST_AUTH_STATUS = int;
enum : int
{
    EapHostInvalidSession       = 0x00000000,
    EapHostAuthNotStarted       = 0x00000001,
    EapHostAuthIdentityExchange = 0x00000002,
    EapHostAuthNegotiatingType  = 0x00000003,
    EapHostAuthInProgress       = 0x00000004,
    EapHostAuthSucceeded        = 0x00000005,
    EapHostAuthFailed           = 0x00000006,
}

struct EAPHOST_AUTH_INFO
{
    EAPHOST_AUTH_STATUS status;
    uint dwErrorCode;
    uint dwReasonCode;
}
alias ISOLATION_STATE = int;
enum : int
{
    ISOLATION_STATE_UNKNOWN           = 0x00000000,
    ISOLATION_STATE_NOT_RESTRICTED    = 0x00000001,
    ISOLATION_STATE_IN_PROBATION      = 0x00000002,
    ISOLATION_STATE_RESTRICTED_ACCESS = 0x00000003,
}

struct EapHostPeerMethodResult
{
    BOOL fIsSuccess;
    uint dwFailureReasonCode;
    BOOL fSaveConnectionData;
    uint dwSizeofConnectionData;
    ubyte* pConnectionData;
    BOOL fSaveUserData;
    uint dwSizeofUserData;
    ubyte* pUserData;
    EAP_ATTRIBUTES* pAttribArray;
    ISOLATION_STATE isolationState;
    EAP_METHOD_INFO* pEapMethodInfo;
    EAP_ERROR* pEapError;
}
struct EapPacket
{
    ubyte Code;
    ubyte Id;
    ubyte[2] Length;
    ubyte[1] Data;
}
alias EapCode = int;
enum : int
{
    EapCodeMinimum  = 0x00000001,
    EapCodeRequest  = 0x00000001,
    EapCodeResponse = 0x00000002,
    EapCodeSuccess  = 0x00000003,
    EapCodeFailure  = 0x00000004,
    EapCodeMaximum  = 0x00000004,
}

alias NotificationHandler = void function(GUID, void*);
alias EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION = int;
enum : int
{
    EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD         = 0x00000000,
    EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND            = 0x00000001,
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT          = 0x00000002,
    EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND         = 0x00000003,
    EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE    = 0x00000004,
    EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY = 0x00000005,
}

struct EAP_METHOD_AUTHENTICATOR_RESULT
{
    BOOL fIsSuccess;
    uint dwFailureReason;
    EAP_ATTRIBUTES* pAuthAttribs;
}
alias EapPeerMethodResponseAction = int;
enum : int
{
    EapPeerMethodResponseActionDiscard  = 0x00000000,
    EapPeerMethodResponseActionSend     = 0x00000001,
    EapPeerMethodResponseActionResult   = 0x00000002,
    EapPeerMethodResponseActionInvokeUI = 0x00000003,
    EapPeerMethodResponseActionRespond  = 0x00000004,
    EapPeerMethodResponseActionNone     = 0x00000005,
}

struct EapPeerMethodOutput
{
    EapPeerMethodResponseAction action;
    BOOL fAllowNotifications;
}
alias EapPeerMethodResultReason = int;
enum : int
{
    EapPeerMethodResultUnknown = 0x00000001,
    EapPeerMethodResultSuccess = 0x00000002,
    EapPeerMethodResultFailure = 0x00000003,
}

struct EapPeerMethodResult
{
    BOOL fIsSuccess;
    uint dwFailureReasonCode;
    BOOL fSaveConnectionData;
    uint dwSizeofConnectionData;
    ubyte* pConnectionData;
    BOOL fSaveUserData;
    uint dwSizeofUserData;
    ubyte* pUserData;
    EAP_ATTRIBUTES* pAttribArray;
    EAP_ERROR* pEapError;
    NgcTicketContext* pNgcKerbTicket;
    BOOL fSaveToCredMan;
}
struct EAP_PEER_METHOD_ROUTINES
{
    uint dwVersion;
    EAP_TYPE* pEapType;
    long EapPeerInitialize;
    long EapPeerGetIdentity;
    long EapPeerBeginSession;
    long EapPeerSetCredentials;
    long EapPeerProcessRequestPacket;
    long EapPeerGetResponsePacket;
    long EapPeerGetResult;
    long EapPeerGetUIContext;
    long EapPeerSetUIContext;
    long EapPeerGetResponseAttributes;
    long EapPeerSetResponseAttributes;
    long EapPeerEndSession;
    long EapPeerShutdown;
}
alias EAP_AUTHENTICATOR_SEND_TIMEOUT = int;
enum : int
{
    EAP_AUTHENTICATOR_SEND_TIMEOUT_NONE        = 0x00000000,
    EAP_AUTHENTICATOR_SEND_TIMEOUT_BASIC       = 0x00000001,
    EAP_AUTHENTICATOR_SEND_TIMEOUT_INTERACTIVE = 0x00000002,
}

struct EAP_AUTHENTICATOR_METHOD_ROUTINES
{
    uint dwSizeInBytes;
    EAP_METHOD_TYPE* pEapType;
    long EapMethodAuthenticatorInitialize;
    long EapMethodAuthenticatorBeginSession;
    long EapMethodAuthenticatorUpdateInnerMethodParams;
    long EapMethodAuthenticatorReceivePacket;
    long EapMethodAuthenticatorSendPacket;
    long EapMethodAuthenticatorGetAttributes;
    long EapMethodAuthenticatorSetAttributes;
    long EapMethodAuthenticatorGetResult;
    long EapMethodAuthenticatorEndSession;
    long EapMethodAuthenticatorShutdown;
}
