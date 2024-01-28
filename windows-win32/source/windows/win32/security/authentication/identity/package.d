module windows.win32.security.authentication.identity;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, HRESULT, HWND, LUID, NTSTATUS, PSID, PSTR, PWSTR;
import windows.win32.security : ACL, OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, QUOTA_LIMITS, SECURITY_ATTRIBUTES, SECURITY_IMPERSONATION_LEVEL, SID_NAME_USE, TOKEN_DEFAULT_DACL, TOKEN_DEVICE_CLAIMS, TOKEN_GROUPS, TOKEN_OWNER, TOKEN_PRIMARY_GROUP, TOKEN_PRIVILEGES, TOKEN_SOURCE, TOKEN_USER, TOKEN_USER_CLAIMS;
import windows.win32.security.credentials : CREDENTIALW, CREDENTIAL_TARGET_INFORMATIONW, SecHandle;
import windows.win32.security.cryptography : ALG_ID, CERT_CONTEXT, CRYPT_INTEGER_BLOB, HCERTSTORE;
import windows.win32.system.com : IUnknown;
import windows.win32.system.kernel : LIST_ENTRY;
import windows.win32.system.passwordmanagement : CYPHER_BLOCK, LM_OWF_PASSWORD;
import windows.win32.system.rpc : SEC_WINNT_AUTH_IDENTITY_A, SEC_WINNT_AUTH_IDENTITY_W;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE;

version (Windows):
extern (Windows):

BOOLEAN RtlGenRandom(void*, uint);
NTSTATUS RtlEncryptMemory(void*, uint, uint);
NTSTATUS RtlDecryptMemory(void*, uint, uint);
NTSTATUS LsaRegisterLogonProcess(LSA_STRING*, HANDLE*, uint*);
NTSTATUS LsaLogonUser(HANDLE, LSA_STRING*, SECURITY_LOGON_TYPE, uint, void*, uint, TOKEN_GROUPS*, TOKEN_SOURCE*, void**, uint*, LUID*, HANDLE*, QUOTA_LIMITS*, int*);
NTSTATUS LsaLookupAuthenticationPackage(HANDLE, LSA_STRING*, uint*);
NTSTATUS LsaFreeReturnBuffer(void*);
NTSTATUS LsaCallAuthenticationPackage(HANDLE, uint, void*, uint, void**, uint*, int*);
NTSTATUS LsaDeregisterLogonProcess(HANDLE);
NTSTATUS LsaConnectUntrusted(HANDLE*);
NTSTATUS LsaFreeMemory(void*);
NTSTATUS LsaClose(LSA_HANDLE);
NTSTATUS LsaEnumerateLogonSessions(uint*, LUID**);
NTSTATUS LsaGetLogonSessionData(LUID*, SECURITY_LOGON_SESSION_DATA**);
NTSTATUS LsaOpenPolicy(LSA_UNICODE_STRING*, LSA_OBJECT_ATTRIBUTES*, uint, LSA_HANDLE*);
NTSTATUS LsaSetCAPs(LSA_UNICODE_STRING*, uint, uint);
NTSTATUS LsaGetAppliedCAPIDs(LSA_UNICODE_STRING*, PSID**, uint*);
NTSTATUS LsaQueryCAPs(PSID*, uint, CENTRAL_ACCESS_POLICY**, uint*);
NTSTATUS LsaQueryInformationPolicy(LSA_HANDLE, POLICY_INFORMATION_CLASS, void**);
NTSTATUS LsaSetInformationPolicy(LSA_HANDLE, POLICY_INFORMATION_CLASS, void*);
NTSTATUS LsaQueryDomainInformationPolicy(LSA_HANDLE, POLICY_DOMAIN_INFORMATION_CLASS, void**);
NTSTATUS LsaSetDomainInformationPolicy(LSA_HANDLE, POLICY_DOMAIN_INFORMATION_CLASS, void*);
NTSTATUS LsaRegisterPolicyChangeNotification(POLICY_NOTIFICATION_INFORMATION_CLASS, HANDLE);
NTSTATUS LsaUnregisterPolicyChangeNotification(POLICY_NOTIFICATION_INFORMATION_CLASS, HANDLE);
NTSTATUS LsaEnumerateTrustedDomains(LSA_HANDLE, uint*, void**, uint, uint*);
NTSTATUS LsaLookupNames(LSA_HANDLE, uint, LSA_UNICODE_STRING*, LSA_REFERENCED_DOMAIN_LIST**, LSA_TRANSLATED_SID**);
NTSTATUS LsaLookupNames2(LSA_HANDLE, uint, uint, LSA_UNICODE_STRING*, LSA_REFERENCED_DOMAIN_LIST**, LSA_TRANSLATED_SID2**);
NTSTATUS LsaLookupSids(LSA_HANDLE, uint, PSID*, LSA_REFERENCED_DOMAIN_LIST**, LSA_TRANSLATED_NAME**);
NTSTATUS LsaLookupSids2(LSA_HANDLE, uint, uint, PSID*, LSA_REFERENCED_DOMAIN_LIST**, LSA_TRANSLATED_NAME**);
NTSTATUS LsaEnumerateAccountsWithUserRight(LSA_HANDLE, LSA_UNICODE_STRING*, void**, uint*);
NTSTATUS LsaEnumerateAccountRights(LSA_HANDLE, PSID, LSA_UNICODE_STRING**, uint*);
NTSTATUS LsaAddAccountRights(LSA_HANDLE, PSID, LSA_UNICODE_STRING*, uint);
NTSTATUS LsaRemoveAccountRights(LSA_HANDLE, PSID, BOOLEAN, LSA_UNICODE_STRING*, uint);
NTSTATUS LsaOpenTrustedDomainByName(LSA_HANDLE, LSA_UNICODE_STRING*, uint, LSA_HANDLE*);
NTSTATUS LsaQueryTrustedDomainInfo(LSA_HANDLE, PSID, TRUSTED_INFORMATION_CLASS, void**);
NTSTATUS LsaSetTrustedDomainInformation(LSA_HANDLE, PSID, TRUSTED_INFORMATION_CLASS, void*);
NTSTATUS LsaDeleteTrustedDomain(LSA_HANDLE, PSID);
NTSTATUS LsaQueryTrustedDomainInfoByName(LSA_HANDLE, LSA_UNICODE_STRING*, TRUSTED_INFORMATION_CLASS, void**);
NTSTATUS LsaSetTrustedDomainInfoByName(LSA_HANDLE, LSA_UNICODE_STRING*, TRUSTED_INFORMATION_CLASS, void*);
NTSTATUS LsaEnumerateTrustedDomainsEx(LSA_HANDLE, uint*, void**, uint, uint*);
NTSTATUS LsaCreateTrustedDomainEx(LSA_HANDLE, TRUSTED_DOMAIN_INFORMATION_EX*, TRUSTED_DOMAIN_AUTH_INFORMATION*, uint, LSA_HANDLE*);
NTSTATUS LsaQueryForestTrustInformation(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_FOREST_TRUST_INFORMATION**);
NTSTATUS LsaSetForestTrustInformation(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_FOREST_TRUST_INFORMATION*, BOOLEAN, LSA_FOREST_TRUST_COLLISION_INFORMATION**);
NTSTATUS LsaStorePrivateData(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*);
NTSTATUS LsaRetrievePrivateData(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_UNICODE_STRING**);
uint LsaNtStatusToWinError(NTSTATUS);
NTSTATUS LsaQueryForestTrustInformation2(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_FOREST_TRUST_RECORD_TYPE, LSA_FOREST_TRUST_INFORMATION2**);
NTSTATUS LsaSetForestTrustInformation2(LSA_HANDLE, LSA_UNICODE_STRING*, LSA_FOREST_TRUST_RECORD_TYPE, LSA_FOREST_TRUST_INFORMATION2*, BOOLEAN, LSA_FOREST_TRUST_COLLISION_INFORMATION**);
BOOLEAN AuditSetSystemPolicy(AUDIT_POLICY_INFORMATION*, uint);
BOOLEAN AuditSetPerUserPolicy(const(PSID), AUDIT_POLICY_INFORMATION*, uint);
BOOLEAN AuditQuerySystemPolicy(const(GUID)*, uint, AUDIT_POLICY_INFORMATION**);
BOOLEAN AuditQueryPerUserPolicy(const(PSID), const(GUID)*, uint, AUDIT_POLICY_INFORMATION**);
BOOLEAN AuditEnumeratePerUserPolicy(POLICY_AUDIT_SID_ARRAY**);
BOOLEAN AuditComputeEffectivePolicyBySid(const(PSID), const(GUID)*, uint, AUDIT_POLICY_INFORMATION**);
BOOLEAN AuditComputeEffectivePolicyByToken(HANDLE, const(GUID)*, uint, AUDIT_POLICY_INFORMATION**);
BOOLEAN AuditEnumerateCategories(GUID**, uint*);
BOOLEAN AuditEnumerateSubCategories(const(GUID)*, BOOLEAN, GUID**, uint*);
BOOLEAN AuditLookupCategoryNameW(const(GUID)*, PWSTR*);
BOOLEAN AuditLookupCategoryNameA(const(GUID)*, PSTR*);
BOOLEAN AuditLookupSubCategoryNameW(const(GUID)*, PWSTR*);
BOOLEAN AuditLookupSubCategoryNameA(const(GUID)*, PSTR*);
BOOLEAN AuditLookupCategoryIdFromCategoryGuid(const(GUID)*, POLICY_AUDIT_EVENT_TYPE*);
BOOLEAN AuditLookupCategoryGuidFromCategoryId(POLICY_AUDIT_EVENT_TYPE, GUID*);
BOOLEAN AuditSetSecurity(OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
BOOLEAN AuditQuerySecurity(OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR*);
BOOLEAN AuditSetGlobalSaclW(const(wchar)*, ACL*);
BOOLEAN AuditSetGlobalSaclA(const(char)*, ACL*);
BOOLEAN AuditQueryGlobalSaclW(const(wchar)*, ACL**);
BOOLEAN AuditQueryGlobalSaclA(const(char)*, ACL**);
void AuditFree(void*);
HRESULT AcquireCredentialsHandleW(PWSTR, PWSTR, SECPKG_CRED, void*, void*, SEC_GET_KEY_FN, void*, SecHandle*, long*);
HRESULT AcquireCredentialsHandleA(PSTR, PSTR, SECPKG_CRED, void*, void*, SEC_GET_KEY_FN, void*, SecHandle*, long*);
HRESULT FreeCredentialsHandle(SecHandle*);
HRESULT AddCredentialsW(SecHandle*, PWSTR, PWSTR, uint, void*, SEC_GET_KEY_FN, void*, long*);
HRESULT AddCredentialsA(SecHandle*, PSTR, PSTR, uint, void*, SEC_GET_KEY_FN, void*, long*);
HRESULT ChangeAccountPasswordW(ushort*, ushort*, ushort*, ushort*, ushort*, BOOLEAN, uint, SecBufferDesc*);
HRESULT ChangeAccountPasswordA(byte*, byte*, byte*, byte*, byte*, BOOLEAN, uint, SecBufferDesc*);
HRESULT InitializeSecurityContextW(SecHandle*, SecHandle*, ushort*, ISC_REQ_FLAGS, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT InitializeSecurityContextA(SecHandle*, SecHandle*, byte*, ISC_REQ_FLAGS, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT AcceptSecurityContext(SecHandle*, SecHandle*, SecBufferDesc*, ASC_REQ_FLAGS, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT CompleteAuthToken(SecHandle*, SecBufferDesc*);
HRESULT ImpersonateSecurityContext(SecHandle*);
HRESULT RevertSecurityContext(SecHandle*);
HRESULT QuerySecurityContextToken(SecHandle*, void**);
HRESULT DeleteSecurityContext(SecHandle*);
HRESULT ApplyControlToken(SecHandle*, SecBufferDesc*);
HRESULT QueryContextAttributesW(SecHandle*, SECPKG_ATTR, void*);
HRESULT QueryContextAttributesExW(SecHandle*, SECPKG_ATTR, void*, uint);
HRESULT QueryContextAttributesA(SecHandle*, SECPKG_ATTR, void*);
HRESULT QueryContextAttributesExA(SecHandle*, SECPKG_ATTR, void*, uint);
HRESULT SetContextAttributesW(SecHandle*, SECPKG_ATTR, void*, uint);
HRESULT SetContextAttributesA(SecHandle*, SECPKG_ATTR, void*, uint);
HRESULT QueryCredentialsAttributesW(SecHandle*, uint, void*);
HRESULT QueryCredentialsAttributesExW(SecHandle*, uint, void*, uint);
HRESULT QueryCredentialsAttributesA(SecHandle*, uint, void*);
HRESULT QueryCredentialsAttributesExA(SecHandle*, uint, void*, uint);
HRESULT SetCredentialsAttributesW(SecHandle*, uint, void*, uint);
HRESULT SetCredentialsAttributesA(SecHandle*, uint, void*, uint);
HRESULT FreeContextBuffer(void*);
HRESULT MakeSignature(SecHandle*, uint, SecBufferDesc*, uint);
HRESULT VerifySignature(SecHandle*, SecBufferDesc*, uint, uint*);
HRESULT EncryptMessage(SecHandle*, uint, SecBufferDesc*, uint);
HRESULT DecryptMessage(SecHandle*, SecBufferDesc*, uint, uint*);
HRESULT EnumerateSecurityPackagesW(uint*, SecPkgInfoW**);
HRESULT EnumerateSecurityPackagesA(uint*, SecPkgInfoA**);
HRESULT QuerySecurityPackageInfoW(PWSTR, SecPkgInfoW**);
HRESULT QuerySecurityPackageInfoA(PSTR, SecPkgInfoA**);
HRESULT ExportSecurityContext(SecHandle*, EXPORT_SECURITY_CONTEXT_FLAGS, SecBuffer*, void**);
HRESULT ImportSecurityContextW(PWSTR, SecBuffer*, void*, SecHandle*);
HRESULT ImportSecurityContextA(PSTR, SecBuffer*, void*, SecHandle*);
SecurityFunctionTableA* InitSecurityInterfaceA();
SecurityFunctionTableW* InitSecurityInterfaceW();
HRESULT SaslEnumerateProfilesA(PSTR*, uint*);
HRESULT SaslEnumerateProfilesW(PWSTR*, uint*);
HRESULT SaslGetProfilePackageA(PSTR, SecPkgInfoA**);
HRESULT SaslGetProfilePackageW(PWSTR, SecPkgInfoW**);
HRESULT SaslIdentifyPackageA(SecBufferDesc*, SecPkgInfoA**);
HRESULT SaslIdentifyPackageW(SecBufferDesc*, SecPkgInfoW**);
HRESULT SaslInitializeSecurityContextW(SecHandle*, SecHandle*, PWSTR, ISC_REQ_FLAGS, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT SaslInitializeSecurityContextA(SecHandle*, SecHandle*, PSTR, ISC_REQ_FLAGS, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT SaslAcceptSecurityContext(SecHandle*, SecHandle*, SecBufferDesc*, ASC_REQ_FLAGS, uint, SecHandle*, SecBufferDesc*, uint*, long*);
HRESULT SaslSetContextOption(SecHandle*, uint, void*, uint);
HRESULT SaslGetContextOption(SecHandle*, uint, void*, uint, uint*);
uint SspiPromptForCredentialsW(const(wchar)*, void*, uint, const(wchar)*, void*, void**, int*, uint);
uint SspiPromptForCredentialsA(const(char)*, void*, uint, const(char)*, void*, void**, int*, uint);
HRESULT SspiPrepareForCredRead(void*, const(wchar)*, uint*, const(wchar)**);
HRESULT SspiPrepareForCredWrite(void*, const(wchar)*, uint*, const(wchar)**, const(wchar)**, ubyte**, uint*);
HRESULT SspiEncryptAuthIdentity(void*);
HRESULT SspiEncryptAuthIdentityEx(uint, void*);
HRESULT SspiDecryptAuthIdentity(void*);
HRESULT SspiDecryptAuthIdentityEx(uint, void*);
BOOLEAN SspiIsAuthIdentityEncrypted(void*);
HRESULT SspiEncodeAuthIdentityAsStrings(void*, const(wchar)**, const(wchar)**, const(wchar)**);
HRESULT SspiValidateAuthIdentity(void*);
HRESULT SspiCopyAuthIdentity(void*, void**);
void SspiFreeAuthIdentity(void*);
void SspiZeroAuthIdentity(void*);
void SspiLocalFree(void*);
HRESULT SspiEncodeStringsAsAuthIdentity(const(wchar)*, const(wchar)*, const(wchar)*, void**);
HRESULT SspiCompareAuthIdentities(void*, void*, BOOLEAN*, BOOLEAN*);
HRESULT SspiMarshalAuthIdentity(void*, uint*, byte**);
HRESULT SspiUnmarshalAuthIdentity(uint, PSTR, void**);
BOOLEAN SspiIsPromptingNeeded(uint);
HRESULT SspiGetTargetHostName(const(wchar)*, PWSTR*);
HRESULT SspiExcludePackage(void*, const(wchar)*, void**);
HRESULT AddSecurityPackageA(PSTR, SECURITY_PACKAGE_OPTIONS*);
HRESULT AddSecurityPackageW(PWSTR, SECURITY_PACKAGE_OPTIONS*);
HRESULT DeleteSecurityPackageA(PSTR);
HRESULT DeleteSecurityPackageW(PWSTR);
NTSTATUS CredMarshalTargetInfo(CREDENTIAL_TARGET_INFORMATIONW*, ushort**, uint*);
NTSTATUS CredUnmarshalTargetInfo(ushort*, uint, CREDENTIAL_TARGET_INFORMATIONW**, uint*);
BOOL SslEmptyCacheA(PSTR, uint);
BOOL SslEmptyCacheW(PWSTR, uint);
void SslGenerateRandomBits(ubyte*, int);
BOOL SslCrackCertificate(ubyte*, uint, uint, X509Certificate**);
void SslFreeCertificate(X509Certificate*);
uint SslGetMaximumKeySize(uint);
HRESULT SslGetServerIdentity(ubyte*, uint, ubyte**, uint*, uint);
HRESULT SslGetExtensions(const(ubyte)*, uint, SCH_EXTENSION_DATA*, ubyte, uint*, SchGetExtensionsOptions);
HRESULT SslDeserializeCertificateStore(CRYPT_INTEGER_BLOB, CERT_CONTEXT**);
HRESULT TokenBindingGenerateBinding(TOKENBINDING_KEY_PARAMETERS_TYPE, const(wchar)*, TOKENBINDING_TYPE, const(void)*, uint, TOKENBINDING_EXTENSION_FORMAT, const(void)*, void**, uint*, TOKENBINDING_RESULT_DATA**);
HRESULT TokenBindingGenerateMessage(const(void)**, const(uint)*, uint, void**, uint*);
HRESULT TokenBindingVerifyMessage(const(void)*, uint, TOKENBINDING_KEY_PARAMETERS_TYPE, const(void)*, uint, TOKENBINDING_RESULT_LIST**);
HRESULT TokenBindingGetKeyTypesClient(TOKENBINDING_KEY_TYPES**);
HRESULT TokenBindingGetKeyTypesServer(TOKENBINDING_KEY_TYPES**);
HRESULT TokenBindingDeleteBinding(const(wchar)*);
HRESULT TokenBindingDeleteAllBindings();
HRESULT TokenBindingGenerateID(TOKENBINDING_KEY_PARAMETERS_TYPE, const(void)*, uint, TOKENBINDING_RESULT_DATA**);
HRESULT TokenBindingGenerateIDForUri(TOKENBINDING_KEY_PARAMETERS_TYPE, const(wchar)*, TOKENBINDING_RESULT_DATA**);
HRESULT TokenBindingGetHighestSupportedVersion(ubyte*, ubyte*);
BOOLEAN GetUserNameExA(EXTENDED_NAME_FORMAT, PSTR, uint*);
BOOLEAN GetUserNameExW(EXTENDED_NAME_FORMAT, PWSTR, uint*);
BOOLEAN GetComputerObjectNameA(EXTENDED_NAME_FORMAT, PSTR, uint*);
BOOLEAN GetComputerObjectNameW(EXTENDED_NAME_FORMAT, PWSTR, uint*);
BOOLEAN TranslateNameA(const(char)*, EXTENDED_NAME_FORMAT, EXTENDED_NAME_FORMAT, PSTR, uint*);
BOOLEAN TranslateNameW(const(wchar)*, EXTENDED_NAME_FORMAT, EXTENDED_NAME_FORMAT, PWSTR, uint*);
HRESULT SLOpen(void**);
HRESULT SLClose(void*);
HRESULT SLInstallProofOfPurchase(void*, const(wchar)*, const(wchar)*, uint, ubyte*, GUID*);
HRESULT SLUninstallProofOfPurchase(void*, const(GUID)*);
HRESULT SLInstallLicense(void*, uint, const(ubyte)*, GUID*);
HRESULT SLUninstallLicense(void*, const(GUID)*);
HRESULT SLConsumeRight(void*, const(GUID)*, const(GUID)*, const(wchar)*, void*);
HRESULT SLGetProductSkuInformation(void*, const(GUID)*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetPKeyInformation(void*, const(GUID)*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetLicenseInformation(void*, const(GUID)*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetLicensingStatusInformation(void*, const(GUID)*, const(GUID)*, const(wchar)*, uint*, SL_LICENSING_STATUS**);
HRESULT SLGetPolicyInformation(void*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetPolicyInformationDWORD(void*, const(wchar)*, uint*);
HRESULT SLGetServiceInformation(void*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetApplicationInformation(void*, const(GUID)*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLActivateProduct(void*, const(GUID)*, uint, const(void)*, const(SL_ACTIVATION_INFO_HEADER)*, const(wchar)*, ushort);
HRESULT SLGetServerStatus(const(wchar)*, const(wchar)*, const(wchar)*, ushort, HRESULT*);
HRESULT SLGenerateOfflineInstallationId(void*, const(GUID)*, PWSTR*);
HRESULT SLGenerateOfflineInstallationIdEx(void*, const(GUID)*, const(SL_ACTIVATION_INFO_HEADER)*, PWSTR*);
HRESULT SLDepositOfflineConfirmationId(void*, const(GUID)*, const(wchar)*, const(wchar)*);
HRESULT SLDepositOfflineConfirmationIdEx(void*, const(GUID)*, const(SL_ACTIVATION_INFO_HEADER)*, const(wchar)*, const(wchar)*);
HRESULT SLGetPKeyId(void*, const(wchar)*, const(wchar)*, uint, const(ubyte)*, GUID*);
HRESULT SLGetInstalledProductKeyIds(void*, const(GUID)*, uint*, GUID**);
HRESULT SLSetCurrentProductKey(void*, const(GUID)*, const(GUID)*);
HRESULT SLGetSLIDList(void*, SLIDTYPE, const(GUID)*, SLIDTYPE, uint*, GUID**);
HRESULT SLGetLicenseFileId(void*, uint, const(ubyte)*, GUID*);
HRESULT SLGetLicense(void*, const(GUID)*, uint*, ubyte**);
HRESULT SLFireEvent(void*, const(wchar)*, const(GUID)*);
HRESULT SLRegisterEvent(void*, const(wchar)*, const(GUID)*, HANDLE);
HRESULT SLUnregisterEvent(void*, const(wchar)*, const(GUID)*, HANDLE);
HRESULT SLGetWindowsInformation(const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLGetWindowsInformationDWORD(const(wchar)*, uint*);
HRESULT SLIsGenuineLocal(const(GUID)*, SL_GENUINE_STATE*, SL_NONGENUINE_UI_OPTIONS*);
HRESULT SLAcquireGenuineTicket(void**, uint*, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT SLSetGenuineInformation(const(GUID)*, const(wchar)*, SLDATATYPE, uint, const(ubyte)*);
HRESULT SLGetReferralInformation(void*, SLREFERRALTYPE, const(GUID)*, const(wchar)*, PWSTR*);
HRESULT SLGetGenuineInformation(const(GUID)*, const(wchar)*, SLDATATYPE*, uint*, ubyte**);
HRESULT SLQueryLicenseValueFromApp(const(wchar)*, uint*, void*, uint, uint*);
void SendSAS(BOOL);
enum NTLMSP_NAME_A = "NTLM";
enum NTLMSP_NAME = "NTLM";
enum MICROSOFT_KERBEROS_NAME_A = "Kerberos";
enum MICROSOFT_KERBEROS_NAME_W = "Kerberos";
enum MICROSOFT_KERBEROS_NAME = "Kerberos";
enum NEGOSSP_NAME_W = "Negotiate";
enum NEGOSSP_NAME_A = "Negotiate";
enum NEGOSSP_NAME = "Negotiate";
enum CLOUDAP_NAME_W = "CloudAP";
enum ClOUDAP_NAME_A = "CloudAP";
enum CLOUDAP_NAME = "CloudAP";
enum ISSP_LEVEL = 0x00000020;
enum ISSP_MODE = 0x00000001;
enum SECPKG_FLAG_INTEGRITY = 0x00000001;
enum SECPKG_FLAG_PRIVACY = 0x00000002;
enum SECPKG_FLAG_TOKEN_ONLY = 0x00000004;
enum SECPKG_FLAG_DATAGRAM = 0x00000008;
enum SECPKG_FLAG_CONNECTION = 0x00000010;
enum SECPKG_FLAG_MULTI_REQUIRED = 0x00000020;
enum SECPKG_FLAG_CLIENT_ONLY = 0x00000040;
enum SECPKG_FLAG_EXTENDED_ERROR = 0x00000080;
enum SECPKG_FLAG_IMPERSONATION = 0x00000100;
enum SECPKG_FLAG_ACCEPT_WIN32_NAME = 0x00000200;
enum SECPKG_FLAG_STREAM = 0x00000400;
enum SECPKG_FLAG_NEGOTIABLE = 0x00000800;
enum SECPKG_FLAG_GSS_COMPATIBLE = 0x00001000;
enum SECPKG_FLAG_LOGON = 0x00002000;
enum SECPKG_FLAG_ASCII_BUFFERS = 0x00004000;
enum SECPKG_FLAG_FRAGMENT = 0x00008000;
enum SECPKG_FLAG_MUTUAL_AUTH = 0x00010000;
enum SECPKG_FLAG_DELEGATION = 0x00020000;
enum SECPKG_FLAG_READONLY_WITH_CHECKSUM = 0x00040000;
enum SECPKG_FLAG_RESTRICTED_TOKENS = 0x00080000;
enum SECPKG_FLAG_NEGO_EXTENDER = 0x00100000;
enum SECPKG_FLAG_NEGOTIABLE2 = 0x00200000;
enum SECPKG_FLAG_APPCONTAINER_PASSTHROUGH = 0x00400000;
enum SECPKG_FLAG_APPCONTAINER_CHECKS = 0x00800000;
enum SECPKG_FLAG_CREDENTIAL_ISOLATION_ENABLED = 0x01000000;
enum SECPKG_FLAG_APPLY_LOOPBACK = 0x02000000;
enum SECPKG_ID_NONE = 0x0000ffff;
enum SECPKG_CALLFLAGS_APPCONTAINER = 0x00000001;
enum SECPKG_CALLFLAGS_APPCONTAINER_AUTHCAPABLE = 0x00000002;
enum SECPKG_CALLFLAGS_FORCE_SUPPLIED = 0x00000004;
enum SECPKG_CALLFLAGS_APPCONTAINER_UPNCAPABLE = 0x00000008;
enum SECBUFFER_VERSION = 0x00000000;
enum SECBUFFER_EMPTY = 0x00000000;
enum SECBUFFER_DATA = 0x00000001;
enum SECBUFFER_TOKEN = 0x00000002;
enum SECBUFFER_PKG_PARAMS = 0x00000003;
enum SECBUFFER_MISSING = 0x00000004;
enum SECBUFFER_EXTRA = 0x00000005;
enum SECBUFFER_STREAM_TRAILER = 0x00000006;
enum SECBUFFER_STREAM_HEADER = 0x00000007;
enum SECBUFFER_NEGOTIATION_INFO = 0x00000008;
enum SECBUFFER_PADDING = 0x00000009;
enum SECBUFFER_STREAM = 0x0000000a;
enum SECBUFFER_MECHLIST = 0x0000000b;
enum SECBUFFER_MECHLIST_SIGNATURE = 0x0000000c;
enum SECBUFFER_TARGET = 0x0000000d;
enum SECBUFFER_CHANNEL_BINDINGS = 0x0000000e;
enum SECBUFFER_CHANGE_PASS_RESPONSE = 0x0000000f;
enum SECBUFFER_TARGET_HOST = 0x00000010;
enum SECBUFFER_ALERT = 0x00000011;
enum SECBUFFER_APPLICATION_PROTOCOLS = 0x00000012;
enum SECBUFFER_SRTP_PROTECTION_PROFILES = 0x00000013;
enum SECBUFFER_SRTP_MASTER_KEY_IDENTIFIER = 0x00000014;
enum SECBUFFER_TOKEN_BINDING = 0x00000015;
enum SECBUFFER_PRESHARED_KEY = 0x00000016;
enum SECBUFFER_PRESHARED_KEY_IDENTITY = 0x00000017;
enum SECBUFFER_DTLS_MTU = 0x00000018;
enum SECBUFFER_SEND_GENERIC_TLS_EXTENSION = 0x00000019;
enum SECBUFFER_SUBSCRIBE_GENERIC_TLS_EXTENSION = 0x0000001a;
enum SECBUFFER_FLAGS = 0x0000001b;
enum SECBUFFER_TRAFFIC_SECRETS = 0x0000001c;
enum SECBUFFER_CERTIFICATE_REQUEST_CONTEXT = 0x0000001d;
enum SECBUFFER_ATTRMASK = 0xf0000000;
enum SECBUFFER_READONLY = 0x80000000;
enum SECBUFFER_READONLY_WITH_CHECKSUM = 0x10000000;
enum SECBUFFER_RESERVED = 0x60000000;
enum SZ_ALG_MAX_SIZE = 0x00000040;
enum SECURITY_NATIVE_DREP = 0x00000010;
enum SECURITY_NETWORK_DREP = 0x00000000;
enum SECPKG_CRED_BOTH = 0x00000003;
enum SECPKG_CRED_DEFAULT = 0x00000004;
enum SECPKG_CRED_RESERVED = 0xf0000000;
enum SECPKG_CRED_AUTOLOGON_RESTRICTED = 0x00000010;
enum SECPKG_CRED_PROCESS_POLICY_ONLY = 0x00000020;
enum ISC_RET_DELEGATE = 0x00000001;
enum ISC_RET_MUTUAL_AUTH = 0x00000002;
enum ISC_RET_REPLAY_DETECT = 0x00000004;
enum ISC_RET_SEQUENCE_DETECT = 0x00000008;
enum ISC_RET_CONFIDENTIALITY = 0x00000010;
enum ISC_RET_USE_SESSION_KEY = 0x00000020;
enum ISC_RET_USED_COLLECTED_CREDS = 0x00000040;
enum ISC_RET_USED_SUPPLIED_CREDS = 0x00000080;
enum ISC_RET_ALLOCATED_MEMORY = 0x00000100;
enum ISC_RET_USED_DCE_STYLE = 0x00000200;
enum ISC_RET_DATAGRAM = 0x00000400;
enum ISC_RET_CONNECTION = 0x00000800;
enum ISC_RET_INTERMEDIATE_RETURN = 0x00001000;
enum ISC_RET_CALL_LEVEL = 0x00002000;
enum ISC_RET_EXTENDED_ERROR = 0x00004000;
enum ISC_RET_STREAM = 0x00008000;
enum ISC_RET_INTEGRITY = 0x00010000;
enum ISC_RET_IDENTIFY = 0x00020000;
enum ISC_RET_NULL_SESSION = 0x00040000;
enum ISC_RET_MANUAL_CRED_VALIDATION = 0x00080000;
enum ISC_RET_RESERVED1 = 0x00100000;
enum ISC_RET_FRAGMENT_ONLY = 0x00200000;
enum ISC_RET_FORWARD_CREDENTIALS = 0x00400000;
enum ISC_RET_USED_HTTP_STYLE = 0x01000000;
enum ISC_RET_NO_ADDITIONAL_TOKEN = 0x02000000;
enum ISC_RET_REAUTHENTICATION = 0x08000000;
enum ISC_RET_CONFIDENTIALITY_ONLY = 0x40000000;
enum ISC_RET_MESSAGES = 0x0000000100000000;
enum ISC_RET_DEFERRED_CRED_VALIDATION = 0x0000000200000000;
enum ISC_RET_NO_POST_HANDSHAKE_AUTH = 0x0000000400000000;
enum ASC_RET_DELEGATE = 0x00000001;
enum ASC_RET_MUTUAL_AUTH = 0x00000002;
enum ASC_RET_REPLAY_DETECT = 0x00000004;
enum ASC_RET_SEQUENCE_DETECT = 0x00000008;
enum ASC_RET_CONFIDENTIALITY = 0x00000010;
enum ASC_RET_USE_SESSION_KEY = 0x00000020;
enum ASC_RET_SESSION_TICKET = 0x00000040;
enum ASC_RET_ALLOCATED_MEMORY = 0x00000100;
enum ASC_RET_USED_DCE_STYLE = 0x00000200;
enum ASC_RET_DATAGRAM = 0x00000400;
enum ASC_RET_CONNECTION = 0x00000800;
enum ASC_RET_CALL_LEVEL = 0x00002000;
enum ASC_RET_THIRD_LEG_FAILED = 0x00004000;
enum ASC_RET_EXTENDED_ERROR = 0x00008000;
enum ASC_RET_STREAM = 0x00010000;
enum ASC_RET_INTEGRITY = 0x00020000;
enum ASC_RET_LICENSING = 0x00040000;
enum ASC_RET_IDENTIFY = 0x00080000;
enum ASC_RET_NULL_SESSION = 0x00100000;
enum ASC_RET_ALLOW_NON_USER_LOGONS = 0x00200000;
enum ASC_RET_ALLOW_CONTEXT_REPLAY = 0x00400000;
enum ASC_RET_FRAGMENT_ONLY = 0x00800000;
enum ASC_RET_NO_TOKEN = 0x01000000;
enum ASC_RET_NO_ADDITIONAL_TOKEN = 0x02000000;
enum ASC_RET_MESSAGES = 0x0000000100000000;
enum SECPKG_CRED_ATTR_NAMES = 0x00000001;
enum SECPKG_CRED_ATTR_SSI_PROVIDER = 0x00000002;
enum SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS = 0x00000003;
enum SECPKG_CRED_ATTR_CERT = 0x00000004;
enum SECPKG_CRED_ATTR_PAC_BYPASS = 0x00000005;
enum KDC_PROXY_SETTINGS_V1 = 0x00000001;
enum KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY = 0x00000001;
enum SECPKG_ATTR_PROTO_INFO = 0x00000007;
enum SECPKG_ATTR_USER_FLAGS = 0x0000000b;
enum SECPKG_ATTR_USE_VALIDATED = 0x0000000f;
enum SECPKG_ATTR_CREDENTIAL_NAME = 0x00000010;
enum SECPKG_ATTR_TARGET = 0x00000013;
enum SECPKG_ATTR_AUTHENTICATION_ID = 0x00000014;
enum SECPKG_ATTR_LOGOFF_TIME = 0x00000015;
enum SECPKG_ATTR_NEGO_KEYS = 0x00000016;
enum SECPKG_ATTR_PROMPTING_NEEDED = 0x00000018;
enum SECPKG_ATTR_NEGO_PKG_INFO = 0x0000001f;
enum SECPKG_ATTR_NEGO_STATUS = 0x00000020;
enum SECPKG_ATTR_CONTEXT_DELETED = 0x00000021;
enum SECPKG_ATTR_APPLICATION_PROTOCOL = 0x00000023;
enum SECPKG_ATTR_NEGOTIATED_TLS_EXTENSIONS = 0x00000024;
enum SECPKG_ATTR_IS_LOOPBACK = 0x00000025;
enum SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS = 0x00000001;
enum SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM = 0x00000002;
enum SECPKG_NEGOTIATION_COMPLETE = 0x00000000;
enum SECPKG_NEGOTIATION_OPTIMISTIC = 0x00000001;
enum SECPKG_NEGOTIATION_IN_PROGRESS = 0x00000002;
enum SECPKG_NEGOTIATION_DIRECT = 0x00000003;
enum SECPKG_NEGOTIATION_TRY_MULTICRED = 0x00000004;
enum MAX_PROTOCOL_ID_SIZE = 0x000000ff;
enum SECQOP_WRAP_NO_ENCRYPT = 0x80000001;
enum SECQOP_WRAP_OOB_DATA = 0x40000000;
enum SECURITY_ENTRYPOINT_ANSIW = "InitSecurityInterfaceW";
enum SECURITY_ENTRYPOINT_ANSIA = "InitSecurityInterfaceA";
enum SECURITY_ENTRYPOINT16 = "INITSECURITYINTERFACEA";
enum SECURITY_ENTRYPOINT_ANSI = "InitSecurityInterfaceW";
enum SECURITY_ENTRYPOINT = "INITSECURITYINTERFACEA";
enum SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION = 0x00000001;
enum SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 = 0x00000002;
enum SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 = 0x00000003;
enum SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 = 0x00000004;
enum SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_5 = 0x00000005;
enum SASL_OPTION_SEND_SIZE = 0x00000001;
enum SASL_OPTION_RECV_SIZE = 0x00000002;
enum SASL_OPTION_AUTHZ_STRING = 0x00000003;
enum SASL_OPTION_AUTHZ_PROCESSING = 0x00000004;
enum SEC_WINNT_AUTH_IDENTITY_VERSION_2 = 0x00000201;
enum SEC_WINNT_AUTH_IDENTITY_VERSION = 0x00000200;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED = 0x00000010;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED = 0x00000020;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED = 0x00000040;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_ENCRYPTED = 0x00000080;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED = 0x00010000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER = 0x00020000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN = 0x00040000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER = 0x00080000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK = 0xff000000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_SAVE = 0x80000000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER = 0x80000000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED = 0x40000000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_NO_CHECKBOX = 0x20000000;
enum SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_LOAD = 0x10000000;
enum SSPIPFC_CREDPROV_DO_NOT_SAVE = 0x00000001;
enum SSPIPFC_SAVE_CRED_BY_CALLER = 0x00000001;
enum SSPIPFC_NO_CHECKBOX = 0x00000002;
enum SSPIPFC_CREDPROV_DO_NOT_LOAD = 0x00000004;
enum SSPIPFC_USE_CREDUIBROKER = 0x00000008;
enum NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 0x00000001;
enum NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 0x00000002;
enum NGC_DATA_FLAG_IS_SMARTCARD_DATA = 0x00000004;
enum NGC_DATA_FLAG_IS_CLOUD_TRUST_CRED = 0x00000008;
enum SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON = 0x00000001;
enum SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS = 0x00000002;
enum SEC_WINNT_AUTH_IDENTITY_ENCRYPT_FOR_SYSTEM = 0x00000004;
enum SEC_WINNT_AUTH_IDENTITY_MARSHALLED = 0x00000004;
enum SEC_WINNT_AUTH_IDENTITY_ONLY = 0x00000008;
enum SECPKG_OPTIONS_PERMANENT = 0x00000001;
enum LOOKUP_VIEW_LOCAL_INFORMATION = 0x00000001;
enum LOOKUP_TRANSLATE_NAMES = 0x00000800;
enum SECPKG_ATTR_ISSUER_LIST = 0x00000050;
enum SECPKG_ATTR_REMOTE_CRED = 0x00000051;
enum SECPKG_ATTR_SUPPORTED_ALGS = 0x00000056;
enum SECPKG_ATTR_CIPHER_STRENGTHS = 0x00000057;
enum SECPKG_ATTR_SUPPORTED_PROTOCOLS = 0x00000058;
enum SECPKG_ATTR_MAPPED_CRED_ATTR = 0x0000005c;
enum SECPKG_ATTR_REMOTE_CERTIFICATES = 0x0000005f;
enum SECPKG_ATTR_CLIENT_CERT_POLICY = 0x00000060;
enum SECPKG_ATTR_CC_POLICY_RESULT = 0x00000061;
enum SECPKG_ATTR_USE_NCRYPT = 0x00000062;
enum SECPKG_ATTR_LOCAL_CERT_INFO = 0x00000063;
enum SECPKG_ATTR_CIPHER_INFO = 0x00000064;
enum SECPKG_ATTR_REMOTE_CERT_CHAIN = 0x00000067;
enum SECPKG_ATTR_UI_INFO = 0x00000068;
enum SECPKG_ATTR_KEYING_MATERIAL = 0x0000006b;
enum SECPKG_ATTR_SRTP_PARAMETERS = 0x0000006c;
enum SECPKG_ATTR_TOKEN_BINDING = 0x0000006d;
enum SECPKG_ATTR_CONNECTION_INFO_EX = 0x0000006e;
enum SECPKG_ATTR_KEYING_MATERIAL_TOKEN_BINDING = 0x0000006f;
enum SECPKG_ATTR_KEYING_MATERIAL_INPROC = 0x00000070;
enum SECPKG_ATTR_CERT_CHECK_RESULT = 0x00000071;
enum SECPKG_ATTR_CERT_CHECK_RESULT_INPROC = 0x00000072;
enum SECPKG_ATTR_SESSION_TICKET_KEYS = 0x00000073;
enum SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT_INPROC = 0x00000074;
enum SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT = 0x00000075;
enum SESSION_TICKET_INFO_V0 = 0x00000000;
enum SESSION_TICKET_INFO_VERSION = 0x00000000;
enum LSA_MODE_PASSWORD_PROTECTED = 0x00000001;
enum LSA_MODE_INDIVIDUAL_ACCOUNTS = 0x00000002;
enum LSA_MODE_MANDATORY_ACCESS = 0x00000004;
enum LSA_MODE_LOG_FULL = 0x00000008;
enum LSA_MAXIMUM_SID_COUNT = 0x00000100;
enum LSA_MAXIMUM_ENUMERATION_LENGTH = 0x00007d00;
enum LSA_CALL_LICENSE_SERVER = 0x80000000;
enum SE_ADT_OBJECT_ONLY = 0x00000001;
enum SE_MAX_AUDIT_PARAMETERS = 0x00000020;
enum SE_MAX_GENERIC_AUDIT_PARAMETERS = 0x0000001c;
enum SE_ADT_PARAMETERS_SELF_RELATIVE = 0x00000001;
enum SE_ADT_PARAMETERS_SEND_TO_LSA = 0x00000002;
enum SE_ADT_PARAMETER_EXTENSIBLE_AUDIT = 0x00000004;
enum SE_ADT_PARAMETER_GENERIC_AUDIT = 0x00000008;
enum SE_ADT_PARAMETER_WRITE_SYNCHRONOUS = 0x00000010;
enum LSA_ADT_SECURITY_SOURCE_NAME = "Microsoft-Windows-Security-Auditing";
enum LSA_ADT_LEGACY_SECURITY_SOURCE_NAME = "Security";
enum SE_ADT_POLICY_AUDIT_EVENT_TYPE_EX_BEGIN = 0x00000064;
enum POLICY_AUDIT_EVENT_UNCHANGED = 0x00000000;
enum POLICY_AUDIT_EVENT_SUCCESS = 0x00000001;
enum POLICY_AUDIT_EVENT_FAILURE = 0x00000002;
enum POLICY_AUDIT_EVENT_NONE = 0x00000004;
enum LSA_AP_NAME_INITIALIZE_PACKAGE = "LsaApInitializePackage\0";
enum LSA_AP_NAME_LOGON_USER = "LsaApLogonUser\0";
enum LSA_AP_NAME_LOGON_USER_EX = "LsaApLogonUserEx\0";
enum LSA_AP_NAME_CALL_PACKAGE = "LsaApCallPackage\0";
enum LSA_AP_NAME_LOGON_TERMINATED = "LsaApLogonTerminated\0";
enum LSA_AP_NAME_CALL_PACKAGE_UNTRUSTED = "LsaApCallPackageUntrusted\0";
enum LSA_AP_NAME_CALL_PACKAGE_PASSTHROUGH = "LsaApCallPackagePassthrough\0";
enum POLICY_VIEW_LOCAL_INFORMATION = 0x00000001;
enum POLICY_VIEW_AUDIT_INFORMATION = 0x00000002;
enum POLICY_GET_PRIVATE_INFORMATION = 0x00000004;
enum POLICY_TRUST_ADMIN = 0x00000008;
enum POLICY_CREATE_ACCOUNT = 0x00000010;
enum POLICY_CREATE_SECRET = 0x00000020;
enum POLICY_CREATE_PRIVILEGE = 0x00000040;
enum POLICY_SET_DEFAULT_QUOTA_LIMITS = 0x00000080;
enum POLICY_SET_AUDIT_REQUIREMENTS = 0x00000100;
enum POLICY_AUDIT_LOG_ADMIN = 0x00000200;
enum POLICY_SERVER_ADMIN = 0x00000400;
enum POLICY_LOOKUP_NAMES = 0x00000800;
enum POLICY_NOTIFICATION = 0x00001000;
enum LSA_LOOKUP_ISOLATED_AS_LOCAL = 0x80000000;
enum LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID = 0x80000000;
enum LSA_LOOKUP_PREFER_INTERNET_NAMES = 0x40000000;
enum PER_USER_POLICY_UNCHANGED = 0x00000000;
enum PER_USER_AUDIT_SUCCESS_INCLUDE = 0x00000001;
enum PER_USER_AUDIT_SUCCESS_EXCLUDE = 0x00000002;
enum PER_USER_AUDIT_FAILURE_INCLUDE = 0x00000004;
enum PER_USER_AUDIT_FAILURE_EXCLUDE = 0x00000008;
enum PER_USER_AUDIT_NONE = 0x00000010;
enum POLICY_QOS_SCHANNEL_REQUIRED = 0x00000001;
enum POLICY_QOS_OUTBOUND_INTEGRITY = 0x00000002;
enum POLICY_QOS_OUTBOUND_CONFIDENTIALITY = 0x00000004;
enum POLICY_QOS_INBOUND_INTEGRITY = 0x00000008;
enum POLICY_QOS_INBOUND_CONFIDENTIALITY = 0x00000010;
enum POLICY_QOS_ALLOW_LOCAL_ROOT_CERT_STORE = 0x00000020;
enum POLICY_QOS_RAS_SERVER_ALLOWED = 0x00000040;
enum POLICY_QOS_DHCP_SERVER_ALLOWED = 0x00000080;
enum POLICY_KERBEROS_VALIDATE_CLIENT = 0x00000080;
enum ACCOUNT_VIEW = 0x00000001;
enum ACCOUNT_ADJUST_PRIVILEGES = 0x00000002;
enum ACCOUNT_ADJUST_QUOTAS = 0x00000004;
enum ACCOUNT_ADJUST_SYSTEM_ACCESS = 0x00000008;
enum TRUSTED_QUERY_DOMAIN_NAME = 0x00000001;
enum TRUSTED_QUERY_CONTROLLERS = 0x00000002;
enum TRUSTED_SET_CONTROLLERS = 0x00000004;
enum TRUSTED_QUERY_POSIX = 0x00000008;
enum TRUSTED_SET_POSIX = 0x00000010;
enum TRUSTED_SET_AUTH = 0x00000020;
enum TRUSTED_QUERY_AUTH = 0x00000040;
enum LSAD_AES_CRYPT_SHA512_HASH_SIZE = 0x00000040;
enum LSAD_AES_KEY_SIZE = 0x00000010;
enum LSAD_AES_SALT_SIZE = 0x00000010;
enum LSAD_AES_BLOCK_SIZE = 0x00000010;
enum TRUST_ATTRIBUTE_TREE_PARENT = 0x00400000;
enum TRUST_ATTRIBUTE_TREE_ROOT = 0x00800000;
enum TRUST_ATTRIBUTES_VALID = 0xff02ffff;
enum TRUST_ATTRIBUTE_QUARANTINED_DOMAIN = 0x00000004;
enum TRUST_ATTRIBUTE_TRUST_USES_RC4_ENCRYPTION = 0x00000080;
enum TRUST_ATTRIBUTE_TRUST_USES_AES_KEYS = 0x00000100;
enum TRUST_ATTRIBUTE_CROSS_ORGANIZATION_NO_TGT_DELEGATION = 0x00000200;
enum TRUST_ATTRIBUTE_PIM_TRUST = 0x00000400;
enum TRUST_ATTRIBUTE_CROSS_ORGANIZATION_ENABLE_TGT_DELEGATION = 0x00000800;
enum TRUST_ATTRIBUTE_DISABLE_AUTH_TARGET_VALIDATION = 0x00001000;
enum TRUST_ATTRIBUTES_USER = 0xff000000;
enum LSA_FOREST_TRUST_RECORD_TYPE_UNRECOGNIZED = 0x80000000;
enum LSA_FTRECORD_DISABLED_REASONS = 0x0000ffff;
enum LSA_TLN_DISABLED_NEW = 0x00000001;
enum LSA_TLN_DISABLED_ADMIN = 0x00000002;
enum LSA_TLN_DISABLED_CONFLICT = 0x00000004;
enum LSA_SID_DISABLED_ADMIN = 0x00000001;
enum LSA_SID_DISABLED_CONFLICT = 0x00000002;
enum LSA_NB_DISABLED_ADMIN = 0x00000004;
enum LSA_NB_DISABLED_CONFLICT = 0x00000008;
enum LSA_SCANNER_INFO_DISABLE_AUTH_TARGET_VALIDATION = 0x00000001;
enum LSA_SCANNER_INFO_ADMIN_ALL_FLAGS = 0x00000001;
enum MAX_RECORDS_IN_FOREST_TRUST_INFO = 0x00000fa0;
enum SECRET_SET_VALUE = 0x00000001;
enum SECRET_QUERY_VALUE = 0x00000002;
enum LSA_GLOBAL_SECRET_PREFIX = "G$";
enum LSA_GLOBAL_SECRET_PREFIX_LENGTH = 0x00000002;
enum LSA_LOCAL_SECRET_PREFIX = "L$";
enum LSA_LOCAL_SECRET_PREFIX_LENGTH = 0x00000002;
enum LSA_MACHINE_SECRET_PREFIX = "M$";
enum LSA_SECRET_MAXIMUM_COUNT = 0x00001000;
enum LSA_SECRET_MAXIMUM_LENGTH = 0x00000200;
enum MAXIMUM_CAPES_PER_CAP = 0x0000007f;
enum CENTRAL_ACCESS_POLICY_OWNER_RIGHTS_PRESENT_FLAG = 0x00000001;
enum CENTRAL_ACCESS_POLICY_STAGED_OWNER_RIGHTS_PRESENT_FLAG = 0x00000100;
enum CENTRAL_ACCESS_POLICY_STAGED_FLAG = 0x00010000;
enum LSASETCAPS_RELOAD_FLAG = 0x00000001;
enum LSASETCAPS_VALID_FLAG_MASK = 0x00000001;
enum SE_INTERACTIVE_LOGON_NAME = "SeInteractiveLogonRight";
enum SE_NETWORK_LOGON_NAME = "SeNetworkLogonRight";
enum SE_BATCH_LOGON_NAME = "SeBatchLogonRight";
enum SE_SERVICE_LOGON_NAME = "SeServiceLogonRight";
enum SE_DENY_INTERACTIVE_LOGON_NAME = "SeDenyInteractiveLogonRight";
enum SE_DENY_NETWORK_LOGON_NAME = "SeDenyNetworkLogonRight";
enum SE_DENY_BATCH_LOGON_NAME = "SeDenyBatchLogonRight";
enum SE_DENY_SERVICE_LOGON_NAME = "SeDenyServiceLogonRight";
enum SE_REMOTE_INTERACTIVE_LOGON_NAME = "SeRemoteInteractiveLogonRight";
enum SE_DENY_REMOTE_INTERACTIVE_LOGON_NAME = "SeDenyRemoteInteractiveLogonRight";
enum NEGOTIATE_MAX_PREFIX = 0x00000020;
enum NEGOTIATE_ALLOW_NTLM = 0x10000000;
enum NEGOTIATE_NEG_NTLM = 0x20000000;
enum MAX_USER_RECORDS = 0x000003e8;
enum Audit_System_SecurityStateChange = GUID(0xcce9210, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_System_SecuritySubsystemExtension = GUID(0xcce9211, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_System_Integrity = GUID(0xcce9212, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_System_IPSecDriverEvents = GUID(0xcce9213, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_System_Others = GUID(0xcce9214, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_Logon = GUID(0xcce9215, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_Logoff = GUID(0xcce9216, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_AccountLockout = GUID(0xcce9217, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_IPSecMainMode = GUID(0xcce9218, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_IPSecQuickMode = GUID(0xcce9219, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_IPSecUserMode = GUID(0xcce921a, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_SpecialLogon = GUID(0xcce921b, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_Others = GUID(0xcce921c, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_FileSystem = GUID(0xcce921d, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Registry = GUID(0xcce921e, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Kernel = GUID(0xcce921f, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Sam = GUID(0xcce9220, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_CertificationServices = GUID(0xcce9221, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_ApplicationGenerated = GUID(0xcce9222, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Handle = GUID(0xcce9223, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Share = GUID(0xcce9224, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_FirewallPacketDrops = GUID(0xcce9225, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_FirewallConnection = GUID(0xcce9226, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_Other = GUID(0xcce9227, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PrivilegeUse_Sensitive = GUID(0xcce9228, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PrivilegeUse_NonSensitive = GUID(0xcce9229, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PrivilegeUse_Others = GUID(0xcce922a, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_ProcessCreation = GUID(0xcce922b, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_ProcessTermination = GUID(0xcce922c, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_DpapiActivity = GUID(0xcce922d, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_RpcCall = GUID(0xcce922e, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_AuditPolicy = GUID(0xcce922f, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_AuthenticationPolicy = GUID(0xcce9230, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_AuthorizationPolicy = GUID(0xcce9231, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_MpsscvRulePolicy = GUID(0xcce9232, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_WfpIPSecPolicy = GUID(0xcce9233, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange_Others = GUID(0xcce9234, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_UserAccount = GUID(0xcce9235, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_ComputerAccount = GUID(0xcce9236, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_SecurityGroup = GUID(0xcce9237, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_DistributionGroup = GUID(0xcce9238, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_ApplicationGroup = GUID(0xcce9239, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement_Others = GUID(0xcce923a, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DSAccess_DSAccess = GUID(0xcce923b, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DsAccess_AdAuditChanges = GUID(0xcce923c, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Ds_Replication = GUID(0xcce923d, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Ds_DetailedReplication = GUID(0xcce923e, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountLogon_CredentialValidation = GUID(0xcce923f, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountLogon_Kerberos = GUID(0xcce9240, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountLogon_Others = GUID(0xcce9241, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountLogon_KerbCredentialValidation = GUID(0xcce9242, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_NPS = GUID(0xcce9243, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_DetailedFileShare = GUID(0xcce9244, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_RemovableStorage = GUID(0xcce9245, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess_CbacStaging = GUID(0xcce9246, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_Claims = GUID(0xcce9247, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_PnpActivity = GUID(0xcce9248, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon_Groups = GUID(0xcce9249, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking_TokenRightAdjusted = GUID(0xcce924a, 0x69ae, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_System = GUID(0x69979848, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_Logon = GUID(0x69979849, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_ObjectAccess = GUID(0x6997984a, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PrivilegeUse = GUID(0x6997984b, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DetailedTracking = GUID(0x6997984c, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_PolicyChange = GUID(0x6997984d, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountManagement = GUID(0x6997984e, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_DirectoryServiceAccess = GUID(0x6997984f, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum Audit_AccountLogon = GUID(0x69979850, 0x797a, 0x11d9, [0xbe, 0xd3, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
enum DOMAIN_NO_LM_OWF_CHANGE = 0x00000040;
enum SAM_PASSWORD_CHANGE_NOTIFY_ROUTINE = "PasswordChangeNotify";
enum SAM_INIT_NOTIFICATION_ROUTINE = "InitializeChangeNotify";
enum SAM_PASSWORD_FILTER_ROUTINE = "PasswordFilter";
enum MSV1_0_PACKAGE_NAME = "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0";
enum MSV1_0_PACKAGE_NAMEW = "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0";
enum MSV1_0_SUBAUTHENTICATION_KEY = "SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
enum MSV1_0_SUBAUTHENTICATION_VALUE = "Auth";
enum MSV1_0_CHALLENGE_LENGTH = 0x00000008;
enum MSV1_0_USER_SESSION_KEY_LENGTH = 0x00000010;
enum MSV1_0_LANMAN_SESSION_KEY_LENGTH = 0x00000008;
enum MSV1_0_USE_CLIENT_CHALLENGE = 0x00000080;
enum MSV1_0_DISABLE_PERSONAL_FALLBACK = 0x00001000;
enum MSV1_0_ALLOW_FORCE_GUEST = 0x00002000;
enum MSV1_0_CLEARTEXT_PASSWORD_SUPPLIED = 0x00004000;
enum MSV1_0_USE_DOMAIN_FOR_ROUTING_ONLY = 0x00008000;
enum MSV1_0_SUBAUTHENTICATION_DLL_EX = 0x00100000;
enum MSV1_0_ALLOW_MSVCHAPV2 = 0x00010000;
enum MSV1_0_S4U2SELF = 0x00020000;
enum MSV1_0_CHECK_LOGONHOURS_FOR_S4U = 0x00040000;
enum MSV1_0_INTERNET_DOMAIN = 0x00080000;
enum MSV1_0_SUBAUTHENTICATION_DLL = 0xff000000;
enum MSV1_0_SUBAUTHENTICATION_DLL_SHIFT = 0x00000018;
enum MSV1_0_MNS_LOGON = 0x01000000;
enum MSV1_0_SUBAUTHENTICATION_DLL_RAS = 0x00000002;
enum MSV1_0_SUBAUTHENTICATION_DLL_IIS = 0x00000084;
enum MSV1_0_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 0x00000002;
enum LOGON_NTLMV2_ENABLED = 0x00000100;
enum LOGON_NT_V2 = 0x00000800;
enum LOGON_LM_V2 = 0x00001000;
enum LOGON_NTLM_V2 = 0x00002000;
enum LOGON_OPTIMIZED = 0x00004000;
enum LOGON_WINLOGON = 0x00008000;
enum LOGON_PKINIT = 0x00010000;
enum LOGON_NO_OPTIMIZED = 0x00020000;
enum LOGON_NO_ELEVATION = 0x00040000;
enum LOGON_MANAGED_SERVICE = 0x00080000;
enum MSV1_0_SUBAUTHENTICATION_FLAGS = 0xff000000;
enum LOGON_GRACE_LOGON = 0x01000000;
enum MSV1_0_OWF_PASSWORD_LENGTH = 0x00000010;
enum MSV1_0_SHA_PASSWORD_LENGTH = 0x00000014;
enum MSV1_0_CREDENTIAL_KEY_LENGTH = 0x00000014;
enum MSV1_0_CRED_REMOVED = 0x00000004;
enum MSV1_0_CRED_CREDKEY_PRESENT = 0x00000008;
enum MSV1_0_CRED_SHA_PRESENT = 0x00000010;
enum MSV1_0_CRED_VERSION_V2 = 0x00000002;
enum MSV1_0_CRED_VERSION_V3 = 0x00000004;
enum MSV1_0_CRED_VERSION_IUM = 0xffff0001;
enum MSV1_0_CRED_VERSION_REMOTE = 0xffff0002;
enum MSV1_0_CRED_VERSION_ARSO = 0xffff0003;
enum MSV1_0_CRED_VERSION_RESERVED_1 = 0xfffffffe;
enum MSV1_0_CRED_VERSION_INVALID = 0xffffffff;
enum MSV1_0_NTLM3_RESPONSE_LENGTH = 0x00000010;
enum MSV1_0_NTLM3_OWF_LENGTH = 0x00000010;
enum MSV1_0_MAX_NTLM3_LIFE = 0x00000708;
enum MSV1_0_MAX_AVL_SIZE = 0x0000fa00;
enum MSV1_0_AV_FLAG_FORCE_GUEST = 0x00000001;
enum MSV1_0_AV_FLAG_MIC_HANDSHAKE_MESSAGES = 0x00000002;
enum MSV1_0_AV_FLAG_UNVERIFIED_TARGET = 0x00000004;
enum RTL_ENCRYPT_MEMORY_SIZE = 0x00000008;
enum RTL_ENCRYPT_OPTION_CROSS_PROCESS = 0x00000001;
enum RTL_ENCRYPT_OPTION_SAME_LOGON = 0x00000002;
enum RTL_ENCRYPT_OPTION_FOR_SYSTEM = 0x00000004;
enum KERBEROS_VERSION = 0x00000005;
enum KERBEROS_REVISION = 0x00000006;
enum KERB_ETYPE_AES128_CTS_HMAC_SHA1_96 = 0x00000011;
enum KERB_ETYPE_AES256_CTS_HMAC_SHA1_96 = 0x00000012;
enum KERB_ETYPE_RC4_PLAIN2 = 0xffffffffffffff7f;
enum KERB_ETYPE_RC4_LM = 0xffffffffffffff7e;
enum KERB_ETYPE_RC4_SHA = 0xffffffffffffff7d;
enum KERB_ETYPE_DES_PLAIN = 0xffffffffffffff7c;
enum KERB_ETYPE_RC4_HMAC_OLD = 0xffffffffffffff7b;
enum KERB_ETYPE_RC4_PLAIN_OLD = 0xffffffffffffff7a;
enum KERB_ETYPE_RC4_HMAC_OLD_EXP = 0xffffffffffffff79;
enum KERB_ETYPE_RC4_PLAIN_OLD_EXP = 0xffffffffffffff78;
enum KERB_ETYPE_RC4_PLAIN = 0xffffffffffffff74;
enum KERB_ETYPE_RC4_PLAIN_EXP = 0xffffffffffffff73;
enum KERB_ETYPE_AES128_CTS_HMAC_SHA1_96_PLAIN = 0xffffffffffffff6c;
enum KERB_ETYPE_AES256_CTS_HMAC_SHA1_96_PLAIN = 0xffffffffffffff6b;
enum KERB_ETYPE_DSA_SHA1_CMS = 0x00000009;
enum KERB_ETYPE_RSA_MD5_CMS = 0x0000000a;
enum KERB_ETYPE_RSA_SHA1_CMS = 0x0000000b;
enum KERB_ETYPE_RC2_CBC_ENV = 0x0000000c;
enum KERB_ETYPE_RSA_ENV = 0x0000000d;
enum KERB_ETYPE_RSA_ES_OEAP_ENV = 0x0000000e;
enum KERB_ETYPE_DES_EDE3_CBC_ENV = 0x0000000f;
enum KERB_ETYPE_DSA_SIGN = 0x00000008;
enum KERB_ETYPE_RSA_PRIV = 0x00000009;
enum KERB_ETYPE_RSA_PUB = 0x0000000a;
enum KERB_ETYPE_RSA_PUB_MD5 = 0x0000000b;
enum KERB_ETYPE_RSA_PUB_SHA1 = 0x0000000c;
enum KERB_ETYPE_PKCS7_PUB = 0x0000000d;
enum KERB_ETYPE_DES3_CBC_MD5 = 0x00000005;
enum KERB_ETYPE_DES3_CBC_SHA1 = 0x00000007;
enum KERB_ETYPE_DES3_CBC_SHA1_KD = 0x00000010;
enum KERB_ETYPE_DES_CBC_MD5_NT = 0x00000014;
enum KERB_ETYPE_RC4_HMAC_NT_EXP = 0x00000018;
enum KERB_CHECKSUM_NONE = 0x00000000;
enum KERB_CHECKSUM_CRC32 = 0x00000001;
enum KERB_CHECKSUM_MD4 = 0x00000002;
enum KERB_CHECKSUM_KRB_DES_MAC = 0x00000004;
enum KERB_CHECKSUM_KRB_DES_MAC_K = 0x00000005;
enum KERB_CHECKSUM_MD5 = 0x00000007;
enum KERB_CHECKSUM_MD5_DES = 0x00000008;
enum KERB_CHECKSUM_SHA1_NEW = 0x0000000e;
enum KERB_CHECKSUM_HMAC_SHA1_96_AES128 = 0x0000000f;
enum KERB_CHECKSUM_HMAC_SHA1_96_AES256 = 0x00000010;
enum KERB_CHECKSUM_LM = 0xffffffffffffff7e;
enum KERB_CHECKSUM_SHA1 = 0xffffffffffffff7d;
enum KERB_CHECKSUM_REAL_CRC32 = 0xffffffffffffff7c;
enum KERB_CHECKSUM_DES_MAC = 0xffffffffffffff7b;
enum KERB_CHECKSUM_DES_MAC_MD5 = 0xffffffffffffff7a;
enum KERB_CHECKSUM_MD25 = 0xffffffffffffff79;
enum KERB_CHECKSUM_RC4_MD5 = 0xffffffffffffff78;
enum KERB_CHECKSUM_MD5_HMAC = 0xffffffffffffff77;
enum KERB_CHECKSUM_HMAC_MD5 = 0xffffffffffffff76;
enum KERB_CHECKSUM_SHA256 = 0xffffffffffffff75;
enum KERB_CHECKSUM_SHA384 = 0xffffffffffffff74;
enum KERB_CHECKSUM_SHA512 = 0xffffffffffffff73;
enum KERB_CHECKSUM_HMAC_SHA1_96_AES128_Ki = 0xffffffffffffff6a;
enum KERB_CHECKSUM_HMAC_SHA1_96_AES256_Ki = 0xffffffffffffff69;
enum AUTH_REQ_ALLOW_FORWARDABLE = 0x00000001;
enum AUTH_REQ_ALLOW_PROXIABLE = 0x00000002;
enum AUTH_REQ_ALLOW_POSTDATE = 0x00000004;
enum AUTH_REQ_ALLOW_RENEWABLE = 0x00000008;
enum AUTH_REQ_ALLOW_NOADDRESS = 0x00000010;
enum AUTH_REQ_ALLOW_ENC_TKT_IN_SKEY = 0x00000020;
enum AUTH_REQ_ALLOW_VALIDATE = 0x00000040;
enum AUTH_REQ_VALIDATE_CLIENT = 0x00000080;
enum AUTH_REQ_OK_AS_DELEGATE = 0x00000100;
enum AUTH_REQ_PREAUTH_REQUIRED = 0x00000200;
enum AUTH_REQ_TRANSITIVE_TRUST = 0x00000400;
enum AUTH_REQ_ALLOW_S4U_DELEGATE = 0x00000800;
enum KERB_TICKET_FLAGS_name_canonicalize = 0x00010000;
enum KERB_TICKET_FLAGS_cname_in_pa_data = 0x00040000;
enum KERB_TICKET_FLAGS_enc_pa_rep = 0x00010000;
enum KRB_NT_UNKNOWN = 0x00000000;
enum KRB_NT_PRINCIPAL = 0x00000001;
enum KRB_NT_PRINCIPAL_AND_ID = 0xffffffffffffff7d;
enum KRB_NT_SRV_INST = 0x00000002;
enum KRB_NT_SRV_INST_AND_ID = 0xffffffffffffff7c;
enum KRB_NT_SRV_HST = 0x00000003;
enum KRB_NT_SRV_XHST = 0x00000004;
enum KRB_NT_UID = 0x00000005;
enum KRB_NT_ENTERPRISE_PRINCIPAL = 0x0000000a;
enum KRB_NT_WELLKNOWN = 0x0000000b;
enum KRB_NT_ENT_PRINCIPAL_AND_ID = 0xffffffffffffff7e;
enum KRB_NT_MS_PRINCIPAL = 0xffffffffffffff80;
enum KRB_NT_MS_PRINCIPAL_AND_ID = 0xffffffffffffff7f;
enum KRB_NT_MS_BRANCH_ID = 0xffffffffffffff7b;
enum KRB_NT_X500_PRINCIPAL = 0x00000006;
enum KRB_WELLKNOWN_STRING = "WELLKNOWN";
enum KRB_ANONYMOUS_STRING = "ANONYMOUS";
enum KERB_WRAP_NO_ENCRYPT = 0x80000001;
enum KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 0x00000001;
enum KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 0x00000002;
enum KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES = 0x00000001;
enum KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 0x00000002;
enum KERB_CERTIFICATE_S4U_LOGON_FLAG_FAIL_IF_NT_AUTH_POLICY_REQUIRED = 0x00000004;
enum KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY = 0x00000008;
enum KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET = 0x00000001;
enum KERB_LOGON_FLAG_REDIRECTED = 0x00000002;
enum KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 0x00000002;
enum KERB_S4U_LOGON_FLAG_IDENTIFY = 0x00000008;
enum KERB_USE_DEFAULT_TICKET_FLAGS = 0x00000000;
enum KERB_RETRIEVE_TICKET_DEFAULT = 0x00000000;
enum KERB_RETRIEVE_TICKET_DONT_USE_CACHE = 0x00000001;
enum KERB_RETRIEVE_TICKET_USE_CACHE_ONLY = 0x00000002;
enum KERB_RETRIEVE_TICKET_USE_CREDHANDLE = 0x00000004;
enum KERB_RETRIEVE_TICKET_AS_KERB_CRED = 0x00000008;
enum KERB_RETRIEVE_TICKET_WITH_SEC_CRED = 0x00000010;
enum KERB_RETRIEVE_TICKET_CACHE_TICKET = 0x00000020;
enum KERB_RETRIEVE_TICKET_MAX_LIFETIME = 0x00000040;
enum KERB_ETYPE_DEFAULT = 0x00000000;
enum KERB_PURGE_ALL_TICKETS = 0x00000001;
enum KERB_S4U2PROXY_CACHE_ENTRY_INFO_FLAG_NEGATIVE = 0x00000001;
enum KERB_S4U2PROXY_CRED_FLAG_NEGATIVE = 0x00000001;
enum KERB_REFRESH_POLICY_KERBEROS = 0x00000001;
enum KERB_REFRESH_POLICY_KDC = 0x00000002;
enum KERB_CLOUD_KERBEROS_DEBUG_DATA_VERSION = 0x00000001;
enum DS_UNKNOWN_ADDRESS_TYPE = 0x00000000;
enum KERB_SETPASS_USE_LOGONID = 0x00000001;
enum KERB_SETPASS_USE_CREDHANDLE = 0x00000002;
enum KERB_DECRYPT_FLAG_DEFAULT_KEY = 0x00000001;
enum KERB_REFRESH_SCCRED_RELEASE = 0x00000000;
enum KERB_REFRESH_SCCRED_GETTGT = 0x00000001;
enum KERB_TRANSFER_CRED_WITH_TICKETS = 0x00000001;
enum KERB_TRANSFER_CRED_CLEANUP_CREDENTIALS = 0x00000002;
enum KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED = 0x00000001;
enum AUDIT_SET_SYSTEM_POLICY = 0x00000001;
enum AUDIT_QUERY_SYSTEM_POLICY = 0x00000002;
enum AUDIT_SET_USER_POLICY = 0x00000004;
enum AUDIT_QUERY_USER_POLICY = 0x00000008;
enum AUDIT_ENUMERATE_USERS = 0x00000010;
enum AUDIT_SET_MISC_POLICY = 0x00000020;
enum AUDIT_QUERY_MISC_POLICY = 0x00000040;
enum PKU2U_PACKAGE_NAME_A = "pku2u";
enum PKU2U_PACKAGE_NAME = "pku2u";
enum PKU2U_PACKAGE_NAME_W = "pku2u";
enum SAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE = "CredentialUpdateNotify";
enum SAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE = "CredentialUpdateRegister";
enum SAM_CREDENTIAL_UPDATE_FREE_ROUTINE = "CredentialUpdateFree";
enum SAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE = "RegisterMappedEntrypoints";
enum SECPKG_CLIENT_PROCESS_TERMINATED = 0x00000001;
enum SECPKG_CLIENT_THREAD_TERMINATED = 0x00000002;
enum SECPKG_CALL_KERNEL_MODE = 0x00000001;
enum SECPKG_CALL_ANSI = 0x00000002;
enum SECPKG_CALL_URGENT = 0x00000004;
enum SECPKG_CALL_RECURSIVE = 0x00000008;
enum SECPKG_CALL_IN_PROC = 0x00000010;
enum SECPKG_CALL_CLEANUP = 0x00000020;
enum SECPKG_CALL_WOWCLIENT = 0x00000040;
enum SECPKG_CALL_THREAD_TERM = 0x00000080;
enum SECPKG_CALL_PROCESS_TERM = 0x00000100;
enum SECPKG_CALL_IS_TCB = 0x00000200;
enum SECPKG_CALL_NETWORK_ONLY = 0x00000400;
enum SECPKG_CALL_WINLOGON = 0x00000800;
enum SECPKG_CALL_ASYNC_UPDATE = 0x00001000;
enum SECPKG_CALL_SYSTEM_PROC = 0x00002000;
enum SECPKG_CALL_NEGO = 0x00004000;
enum SECPKG_CALL_NEGO_EXTENDER = 0x00008000;
enum SECPKG_CALL_BUFFER_MARSHAL = 0x00010000;
enum SECPKG_CALL_UNLOCK = 0x00020000;
enum SECPKG_CALL_CLOUDAP_CONNECT = 0x00040000;
enum SECPKG_CALL_WOWX86 = 0x00000040;
enum SECPKG_CALL_WOWA32 = 0x00040000;
enum SECPKG_CREDENTIAL_VERSION = 0x000000c9;
enum SECPKG_CREDENTIAL_FLAGS_CALLER_HAS_TCB = 0x00000001;
enum SECPKG_CREDENTIAL_FLAGS_CREDMAN_CRED = 0x00000002;
enum SECPKG_SURROGATE_LOGON_VERSION_1 = 0x00000001;
enum SECBUFFER_UNMAPPED = 0x40000000;
enum SECBUFFER_KERNEL_MAP = 0x20000000;
enum PRIMARY_CRED_CLEAR_PASSWORD = 0x00000001;
enum PRIMARY_CRED_OWF_PASSWORD = 0x00000002;
enum PRIMARY_CRED_UPDATE = 0x00000004;
enum PRIMARY_CRED_CACHED_LOGON = 0x00000008;
enum PRIMARY_CRED_LOGON_NO_TCB = 0x00000010;
enum PRIMARY_CRED_LOGON_LUA = 0x00000020;
enum PRIMARY_CRED_INTERACTIVE_SMARTCARD_LOGON = 0x00000040;
enum PRIMARY_CRED_REFRESH_NEEDED = 0x00000080;
enum PRIMARY_CRED_INTERNET_USER = 0x00000100;
enum PRIMARY_CRED_AUTH_ID = 0x00000200;
enum PRIMARY_CRED_DO_NOT_SPLIT = 0x00000400;
enum PRIMARY_CRED_PROTECTED_USER = 0x00000800;
enum PRIMARY_CRED_EX = 0x00001000;
enum PRIMARY_CRED_TRANSFER = 0x00002000;
enum PRIMARY_CRED_RESTRICTED_TS = 0x00004000;
enum PRIMARY_CRED_PACKED_CREDS = 0x00008000;
enum PRIMARY_CRED_ENTERPRISE_INTERNET_USER = 0x00010000;
enum PRIMARY_CRED_ENCRYPTED_CREDGUARD_PASSWORD = 0x00020000;
enum PRIMARY_CRED_CACHED_INTERACTIVE_LOGON = 0x00040000;
enum PRIMARY_CRED_INTERACTIVE_NGC_LOGON = 0x00080000;
enum PRIMARY_CRED_INTERACTIVE_FIDO_LOGON = 0x00100000;
enum PRIMARY_CRED_ARSO_LOGON = 0x00200000;
enum PRIMARY_CRED_SUPPLEMENTAL = 0x00400000;
enum PRIMARY_CRED_LOGON_PACKAGE_SHIFT = 0x00000018;
enum PRIMARY_CRED_PACKAGE_MASK = 0xff000000;
enum SECPKG_PRIMARY_CRED_EX_FLAGS_EX_DELEGATION_TOKEN = 0x00000001;
enum MAX_CRED_SIZE = 0x00000400;
enum SECPKG_STATE_ENCRYPTION_PERMITTED = 0x00000001;
enum SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED = 0x00000002;
enum SECPKG_STATE_DOMAIN_CONTROLLER = 0x00000004;
enum SECPKG_STATE_WORKSTATION = 0x00000008;
enum SECPKG_STATE_STANDALONE = 0x00000010;
enum SECPKG_STATE_CRED_ISOLATION_ENABLED = 0x00000020;
enum SECPKG_STATE_RESERVED_1 = 0x80000000;
enum SECPKG_MAX_OID_LENGTH = 0x00000020;
enum SECPKG_MSVAV_FLAGS_VALID = 0x00000001;
enum SECPKG_MSVAV_TIMESTAMP_VALID = 0x00000002;
enum SECPKG_ATTR_SASL_CONTEXT = 0x00010000;
enum SECPKG_ATTR_THUNK_ALL = 0x00010000;
enum UNDERSTANDS_LONG_NAMES = 0x00000001;
enum NO_LONG_NAMES = 0x00000002;
enum SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_OPTIMISTIC_LOGON = 0x00000001;
enum SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_CLEANUP_CREDENTIALS = 0x00000002;
enum SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_TO_SSO_SESSION = 0x00000004;
enum SECPKG_REDIRECTED_LOGON_GUID_INITIALIZER = GUID(0xc2be5457, 0x82eb, 0x483e, [0xae, 0x4e, 0x74, 0x68, 0xef, 0x14, 0xd5, 0x9]);
enum NOTIFIER_FLAG_NEW_THREAD = 0x00000001;
enum NOTIFIER_FLAG_ONE_SHOT = 0x00000002;
enum NOTIFIER_FLAG_SECONDS = 0x80000000;
enum NOTIFIER_TYPE_INTERVAL = 0x00000001;
enum NOTIFIER_TYPE_HANDLE_WAIT = 0x00000002;
enum NOTIFIER_TYPE_STATE_CHANGE = 0x00000003;
enum NOTIFIER_TYPE_NOTIFY_EVENT = 0x00000004;
enum NOTIFIER_TYPE_IMMEDIATE = 0x00000010;
enum NOTIFY_CLASS_PACKAGE_CHANGE = 0x00000001;
enum NOTIFY_CLASS_ROLE_CHANGE = 0x00000002;
enum NOTIFY_CLASS_DOMAIN_CHANGE = 0x00000003;
enum NOTIFY_CLASS_REGISTRY_CHANGE = 0x00000004;
enum LSA_QUERY_CLIENT_PRELOGON_SESSION_ID = 0x00000001;
enum CREDP_FLAGS_IN_PROCESS = 0x00000001;
enum CREDP_FLAGS_USE_MIDL_HEAP = 0x00000002;
enum CREDP_FLAGS_DONT_CACHE_TI = 0x00000004;
enum CREDP_FLAGS_CLEAR_PASSWORD = 0x00000008;
enum CREDP_FLAGS_USER_ENCRYPTED_PASSWORD = 0x00000010;
enum CREDP_FLAGS_TRUSTED_CALLER = 0x00000020;
enum CREDP_FLAGS_VALIDATE_PROXY_TARGET = 0x00000040;
enum CRED_MARSHALED_TI_SIZE_SIZE = 0x0000000c;
enum LSA_AP_NAME_LOGON_USER_EX2 = "LsaApLogonUserEx2\0";
enum SP_ACCEPT_CREDENTIALS_NAME = "SpAcceptCredentials\0";
enum SECPKG_UNICODE_ATTRIBUTE = 0x80000000;
enum SECPKG_ANSI_ATTRIBUTE = 0x00000000;
enum SECPKG_CREDENTIAL_ATTRIBUTE = 0x00000000;
enum SECPKG_LSAMODEINIT_NAME = "SpLsaModeInitialize";
enum SECPKG_USERMODEINIT_NAME = "SpUserModeInitialize";
enum SECPKG_INTERFACE_VERSION = 0x00010000;
enum SECPKG_INTERFACE_VERSION_2 = 0x00020000;
enum SECPKG_INTERFACE_VERSION_3 = 0x00040000;
enum SECPKG_INTERFACE_VERSION_4 = 0x00080000;
enum SECPKG_INTERFACE_VERSION_5 = 0x00100000;
enum SECPKG_INTERFACE_VERSION_6 = 0x00200000;
enum SECPKG_INTERFACE_VERSION_7 = 0x00400000;
enum SECPKG_INTERFACE_VERSION_8 = 0x00800000;
enum SECPKG_INTERFACE_VERSION_9 = 0x01000000;
enum SECPKG_INTERFACE_VERSION_10 = 0x02000000;
enum SECPKG_INTERFACE_VERSION_11 = 0x04000000;
enum UNISP_NAME_A = "Microsoft Unified Security Protocol Provider";
enum UNISP_NAME_W = "Microsoft Unified Security Protocol Provider";
enum SSL2SP_NAME_A = "Microsoft SSL 2.0";
enum SSL2SP_NAME_W = "Microsoft SSL 2.0";
enum SSL3SP_NAME_A = "Microsoft SSL 3.0";
enum SSL3SP_NAME_W = "Microsoft SSL 3.0";
enum TLS1SP_NAME_A = "Microsoft TLS 1.0";
enum TLS1SP_NAME_W = "Microsoft TLS 1.0";
enum PCT1SP_NAME_A = "Microsoft PCT 1.0";
enum PCT1SP_NAME_W = "Microsoft PCT 1.0";
enum SCHANNEL_NAME_A = "Schannel";
enum SCHANNEL_NAME_W = "Schannel";
enum DEFAULT_TLS_SSP_NAME_A = "Default TLS SSP";
enum DEFAULT_TLS_SSP_NAME_W = "Default TLS SSP";
enum UNISP_NAME = "Microsoft Unified Security Protocol Provider";
enum PCT1SP_NAME = "Microsoft PCT 1.0";
enum SSL2SP_NAME = "Microsoft SSL 2.0";
enum SSL3SP_NAME = "Microsoft SSL 3.0";
enum TLS1SP_NAME = "Microsoft TLS 1.0";
enum SCHANNEL_NAME = "Schannel";
enum DEFAULT_TLS_SSP_NAME = "Default TLS SSP";
enum UNISP_RPC_ID = 0x0000000e;
enum RCRED_STATUS_NOCRED = 0x00000000;
enum RCRED_CRED_EXISTS = 0x00000001;
enum RCRED_STATUS_UNKNOWN_ISSUER = 0x00000002;
enum LCRED_STATUS_NOCRED = 0x00000000;
enum LCRED_CRED_EXISTS = 0x00000001;
enum LCRED_STATUS_UNKNOWN_ISSUER = 0x00000002;
enum SECPKGCONTEXT_CONNECTION_INFO_EX_V1 = 0x00000001;
enum SECPKGCONTEXT_CIPHERINFO_V1 = 0x00000001;
enum SSL_SESSION_RECONNECT = 0x00000001;
enum KERN_CONTEXT_CERT_INFO_V1 = 0x00000000;
enum ENABLE_TLS_CLIENT_EARLY_START = 0x00000001;
enum SCH_CRED_V1 = 0x00000001;
enum SCH_CRED_V2 = 0x00000002;
enum SCH_CRED_VERSION = 0x00000002;
enum SCH_CRED_V3 = 0x00000003;
enum SCHANNEL_CRED_VERSION = 0x00000004;
enum SCH_CREDENTIALS_VERSION = 0x00000005;
enum TLS_PARAMS_OPTIONAL = 0x00000001;
enum SCH_CRED_MAX_SUPPORTED_PARAMETERS = 0x00000010;
enum SCH_CRED_MAX_SUPPORTED_ALPN_IDS = 0x00000010;
enum SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS = 0x00000010;
enum SCH_CRED_MAX_SUPPORTED_CHAINING_MODES = 0x00000010;
enum SCH_MAX_EXT_SUBSCRIPTIONS = 0x00000002;
enum SCH_CRED_FORMAT_CERT_CONTEXT = 0x00000000;
enum SCH_CRED_FORMAT_CERT_HASH = 0x00000001;
enum SCH_CRED_FORMAT_CERT_HASH_STORE = 0x00000002;
enum SCH_CRED_MAX_STORE_NAME_SIZE = 0x00000080;
enum SCH_CRED_MAX_SUPPORTED_ALGS = 0x00000100;
enum SCH_CRED_MAX_SUPPORTED_CERTS = 0x00000064;
enum SCH_MACHINE_CERT_HASH = 0x00000001;
enum SCH_CRED_DISABLE_RECONNECTS = 0x00000080;
enum SCH_CRED_RESTRICTED_ROOTS = 0x00002000;
enum SCH_CRED_REVOCATION_CHECK_CACHE_ONLY = 0x00004000;
enum SCH_CRED_CACHE_ONLY_URL_RETRIEVAL = 0x00008000;
enum SCH_CRED_MEMORY_STORE_CERT = 0x00010000;
enum SCH_CRED_SNI_CREDENTIAL = 0x00080000;
enum SCH_CRED_SNI_ENABLE_OCSP = 0x00100000;
enum SCH_USE_DTLS_ONLY = 0x01000000;
enum SCH_ALLOW_NULL_ENCRYPTION = 0x02000000;
enum SCH_CRED_DEFERRED_CRED_VALIDATION = 0x04000000;
enum SCHANNEL_RENEGOTIATE = 0x00000000;
enum SCHANNEL_SHUTDOWN = 0x00000001;
enum SCHANNEL_ALERT = 0x00000002;
enum SCHANNEL_SESSION = 0x00000003;
enum TLS1_ALERT_CLOSE_NOTIFY = 0x00000000;
enum TLS1_ALERT_UNEXPECTED_MESSAGE = 0x0000000a;
enum TLS1_ALERT_BAD_RECORD_MAC = 0x00000014;
enum TLS1_ALERT_DECRYPTION_FAILED = 0x00000015;
enum TLS1_ALERT_RECORD_OVERFLOW = 0x00000016;
enum TLS1_ALERT_DECOMPRESSION_FAIL = 0x0000001e;
enum TLS1_ALERT_HANDSHAKE_FAILURE = 0x00000028;
enum TLS1_ALERT_BAD_CERTIFICATE = 0x0000002a;
enum TLS1_ALERT_UNSUPPORTED_CERT = 0x0000002b;
enum TLS1_ALERT_CERTIFICATE_REVOKED = 0x0000002c;
enum TLS1_ALERT_CERTIFICATE_EXPIRED = 0x0000002d;
enum TLS1_ALERT_CERTIFICATE_UNKNOWN = 0x0000002e;
enum TLS1_ALERT_ILLEGAL_PARAMETER = 0x0000002f;
enum TLS1_ALERT_UNKNOWN_CA = 0x00000030;
enum TLS1_ALERT_ACCESS_DENIED = 0x00000031;
enum TLS1_ALERT_DECODE_ERROR = 0x00000032;
enum TLS1_ALERT_DECRYPT_ERROR = 0x00000033;
enum TLS1_ALERT_EXPORT_RESTRICTION = 0x0000003c;
enum TLS1_ALERT_PROTOCOL_VERSION = 0x00000046;
enum TLS1_ALERT_INSUFFIENT_SECURITY = 0x00000047;
enum TLS1_ALERT_INTERNAL_ERROR = 0x00000050;
enum TLS1_ALERT_USER_CANCELED = 0x0000005a;
enum TLS1_ALERT_NO_RENEGOTIATION = 0x00000064;
enum TLS1_ALERT_UNSUPPORTED_EXT = 0x0000006e;
enum TLS1_ALERT_UNKNOWN_PSK_IDENTITY = 0x00000073;
enum TLS1_ALERT_NO_APP_PROTOCOL = 0x00000078;
enum SP_PROT_PCT1_SERVER = 0x00000001;
enum SP_PROT_PCT1_CLIENT = 0x00000002;
enum SP_PROT_SSL2_SERVER = 0x00000004;
enum SP_PROT_SSL2_CLIENT = 0x00000008;
enum SP_PROT_SSL3_SERVER = 0x00000010;
enum SP_PROT_SSL3_CLIENT = 0x00000020;
enum SP_PROT_TLS1_SERVER = 0x00000040;
enum SP_PROT_TLS1_CLIENT = 0x00000080;
enum SP_PROT_UNI_SERVER = 0x40000000;
enum SP_PROT_UNI_CLIENT = 0x80000000;
enum SP_PROT_ALL = 0xffffffff;
enum SP_PROT_NONE = 0x00000000;
enum SP_PROT_TLS1_0_SERVER = 0x00000040;
enum SP_PROT_TLS1_0_CLIENT = 0x00000080;
enum SP_PROT_TLS1_1_SERVER = 0x00000100;
enum SP_PROT_TLS1_1_CLIENT = 0x00000200;
enum SP_PROT_TLS1_2_SERVER = 0x00000400;
enum SP_PROT_TLS1_2_CLIENT = 0x00000800;
enum SP_PROT_TLS1_3_SERVER = 0x00001000;
enum SP_PROT_TLS1_3_CLIENT = 0x00002000;
enum SP_PROT_DTLS_SERVER = 0x00010000;
enum SP_PROT_DTLS_CLIENT = 0x00020000;
enum SP_PROT_DTLS1_0_SERVER = 0x00010000;
enum SP_PROT_DTLS1_0_CLIENT = 0x00020000;
enum SP_PROT_DTLS1_2_SERVER = 0x00040000;
enum SP_PROT_DTLS1_2_CLIENT = 0x00080000;
enum SP_PROT_TLS1_3PLUS_SERVER = 0x00001000;
enum SP_PROT_TLS1_3PLUS_CLIENT = 0x00002000;
enum SCHANNEL_SECRET_TYPE_CAPI = 0x00000001;
enum SCHANNEL_SECRET_PRIVKEY = 0x00000002;
enum SCH_CRED_X509_CERTCHAIN = 0x00000001;
enum SCH_CRED_X509_CAPI = 0x00000002;
enum SCH_CRED_CERT_CONTEXT = 0x00000003;
enum SSL_CRACK_CERTIFICATE_NAME = "SslCrackCertificate";
enum SSL_FREE_CERTIFICATE_NAME = "SslFreeCertificate";
enum SL_INFO_KEY_CHANNEL = "Channel";
enum SL_INFO_KEY_NAME = "Name";
enum SL_INFO_KEY_AUTHOR = "Author";
enum SL_INFO_KEY_DESCRIPTION = "Description";
enum SL_INFO_KEY_LICENSOR_URL = "LicensorUrl";
enum SL_INFO_KEY_DIGITAL_PID = "DigitalPID";
enum SL_INFO_KEY_DIGITAL_PID2 = "DigitalPID2";
enum SL_INFO_KEY_PARTIAL_PRODUCT_KEY = "PartialProductKey";
enum SL_INFO_KEY_PRODUCT_SKU_ID = "ProductSkuId";
enum SL_INFO_KEY_LICENSE_TYPE = "LicenseType";
enum SL_INFO_KEY_VERSION = "Version";
enum SL_INFO_KEY_SYSTEM_STATE = "SystemState";
enum SL_INFO_KEY_ACTIVE_PLUGINS = "ActivePlugins";
enum SL_INFO_KEY_SECURE_STORE_ID = "SecureStoreId";
enum SL_INFO_KEY_BIOS_PKEY = "BiosProductKey";
enum SL_INFO_KEY_BIOS_SLIC_STATE = "BiosSlicState";
enum SL_INFO_KEY_BIOS_OA2_MINOR_VERSION = "BiosOA2MinorVersion";
enum SL_INFO_KEY_BIOS_PKEY_DESCRIPTION = "BiosProductKeyDescription";
enum SL_INFO_KEY_BIOS_PKEY_PKPN = "BiosProductKeyPkPn";
enum SL_INFO_KEY_SECURE_PROCESSOR_ACTIVATION_URL = "SPCURL";
enum SL_INFO_KEY_RIGHT_ACCOUNT_ACTIVATION_URL = "RACURL";
enum SL_INFO_KEY_PRODUCT_KEY_ACTIVATION_URL = "PKCURL";
enum SL_INFO_KEY_USE_LICENSE_ACTIVATION_URL = "EULURL";
enum SL_INFO_KEY_IS_KMS = "IsKeyManagementService";
enum SL_INFO_KEY_KMS_CURRENT_COUNT = "KeyManagementServiceCurrentCount";
enum SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT = "KeyManagementServiceRequiredClientCount";
enum SL_INFO_KEY_KMS_UNLICENSED_REQUESTS = "KeyManagementServiceUnlicensedRequests";
enum SL_INFO_KEY_KMS_LICENSED_REQUESTS = "KeyManagementServiceLicensedRequests";
enum SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS = "KeyManagementServiceOOBGraceRequests";
enum SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS = "KeyManagementServiceOOTGraceRequests";
enum SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS = "KeyManagementServiceNonGenuineGraceRequests";
enum SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS = "KeyManagementServiceNotificationRequests";
enum SL_INFO_KEY_KMS_TOTAL_REQUESTS = "KeyManagementServiceTotalRequests";
enum SL_INFO_KEY_KMS_FAILED_REQUESTS = "KeyManagementServiceFailedRequests";
enum SL_INFO_KEY_IS_PRS = "IsPRS";
enum SL_PKEY_MS2005 = "msft:rm/algorithm/pkey/2005";
enum SL_PKEY_MS2009 = "msft:rm/algorithm/pkey/2009";
enum SL_PKEY_DETECT = "msft:rm/algorithm/pkey/detect";
enum SL_EVENT_LICENSING_STATE_CHANGED = "msft:rm/event/licensingstatechanged";
enum SL_EVENT_POLICY_CHANGED = "msft:rm/event/policychanged";
enum SL_EVENT_USER_NOTIFICATION = "msft:rm/event/usernotification";
enum SL_SYSTEM_STATE_REBOOT_POLICY_FOUND = 0x00000001;
enum SL_SYSTEM_STATE_TAMPERED = 0x00000002;
enum SL_REARM_REBOOT_REQUIRED = 0x00000001;
enum SPP_MIGRATION_GATHER_MIGRATABLE_APPS = 0x00000001;
enum SPP_MIGRATION_GATHER_ACTIVATED_WINDOWS_STATE = 0x00000002;
enum SPP_MIGRATION_GATHER_ALL = 0xffffffff;
enum SL_PROP_BRT_DATA = "SL_BRT_DATA";
enum SL_PROP_BRT_COMMIT = "SL_BRT_COMMIT";
enum SL_PROP_GENUINE_RESULT = "SL_GENUINE_RESULT";
enum SL_PROP_NONGENUINE_GRACE_FLAG = "SL_NONGENUINE_GRACE_FLAG";
enum SL_PROP_GET_GENUINE_AUTHZ = "SL_GET_GENUINE_AUTHZ";
enum SL_PROP_GET_GENUINE_SERVER_AUTHZ = "SL_GET_GENUINE_SERVER_AUTHZ";
enum SL_PROP_LAST_ACT_ATTEMPT_HRESULT = "SL_LAST_ACT_ATTEMPT_HRESULT";
enum SL_PROP_LAST_ACT_ATTEMPT_TIME = "SL_LAST_ACT_ATTEMPT_TIME";
enum SL_PROP_LAST_ACT_ATTEMPT_SERVER_FLAGS = "SL_LAST_ACT_ATTEMPT_SERVER_FLAGS";
enum SL_PROP_ACTIVATION_VALIDATION_IN_PROGRESS = "SL_ACTIVATION_VALIDATION_IN_PROGRESS";
enum SL_POLICY_EVALUATION_MODE_ENABLED = "Security-SPP-EvaluationModeEnabled";
enum SL_DEFAULT_MIGRATION_ENCRYPTOR_URI = "msft:spp/migrationencryptor/tokenact/1.0";
enum ID_CAP_SLAPI = "slapiQueryLicenseValue";
enum USER_ACCOUNT_DISABLED = 0x00000001;
enum USER_HOME_DIRECTORY_REQUIRED = 0x00000002;
enum USER_PASSWORD_NOT_REQUIRED = 0x00000004;
enum USER_TEMP_DUPLICATE_ACCOUNT = 0x00000008;
enum USER_NORMAL_ACCOUNT = 0x00000010;
enum USER_MNS_LOGON_ACCOUNT = 0x00000020;
enum USER_INTERDOMAIN_TRUST_ACCOUNT = 0x00000040;
enum USER_WORKSTATION_TRUST_ACCOUNT = 0x00000080;
enum USER_SERVER_TRUST_ACCOUNT = 0x00000100;
enum USER_DONT_EXPIRE_PASSWORD = 0x00000200;
enum USER_ACCOUNT_AUTO_LOCKED = 0x00000400;
enum USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x00000800;
enum USER_SMARTCARD_REQUIRED = 0x00001000;
enum USER_TRUSTED_FOR_DELEGATION = 0x00002000;
enum USER_NOT_DELEGATED = 0x00004000;
enum USER_USE_DES_KEY_ONLY = 0x00008000;
enum USER_DONT_REQUIRE_PREAUTH = 0x00010000;
enum USER_PASSWORD_EXPIRED = 0x00020000;
enum USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x00040000;
enum USER_NO_AUTH_DATA_REQUIRED = 0x00080000;
enum USER_PARTIAL_SECRETS_ACCOUNT = 0x00100000;
enum USER_USE_AES_KEYS = 0x00200000;
enum SAM_DAYS_PER_WEEK = 0x00000007;
enum USER_ALL_PARAMETERS = 0x00200000;
enum CLEAR_BLOCK_LENGTH = 0x00000008;
enum CYPHER_BLOCK_LENGTH = 0x00000008;
enum MSV1_0_VALIDATION_LOGOFF_TIME = 0x00000001;
enum MSV1_0_VALIDATION_KICKOFF_TIME = 0x00000002;
enum MSV1_0_VALIDATION_LOGON_SERVER = 0x00000004;
enum MSV1_0_VALIDATION_LOGON_DOMAIN = 0x00000008;
enum MSV1_0_VALIDATION_SESSION_KEY = 0x00000010;
enum MSV1_0_VALIDATION_USER_FLAGS = 0x00000020;
enum MSV1_0_VALIDATION_USER_ID = 0x00000040;
enum MSV1_0_SUBAUTH_ACCOUNT_DISABLED = 0x00000001;
enum MSV1_0_SUBAUTH_PASSWORD = 0x00000002;
enum MSV1_0_SUBAUTH_WORKSTATIONS = 0x00000004;
enum MSV1_0_SUBAUTH_LOGON_HOURS = 0x00000008;
enum MSV1_0_SUBAUTH_ACCOUNT_EXPIRY = 0x00000010;
enum MSV1_0_SUBAUTH_PASSWORD_EXPIRY = 0x00000020;
enum MSV1_0_SUBAUTH_ACCOUNT_TYPE = 0x00000040;
enum MSV1_0_SUBAUTH_LOCKOUT = 0x00000080;
enum SL_MDOLLAR_ZONE = 0x0000a000;
enum SL_SERVER_ZONE = 0x0000b000;
enum SL_MSCH_ZONE = 0x0000c000;
enum SL_INTERNAL_ZONE = 0x0000e000;
enum SL_CLIENTAPI_ZONE = 0x0000f000;
enum FACILITY_SL_ITF = 0x00000004;
enum _FACILITY_WINDOWS_STORE = 0x0000003f;
enum SL_E_SRV_INVALID_PUBLISH_LICENSE = 0xffffffffc004b001;
enum SL_E_SRV_INVALID_PRODUCT_KEY_LICENSE = 0xffffffffc004b002;
enum SL_E_SRV_INVALID_RIGHTS_ACCOUNT_LICENSE = 0xffffffffc004b003;
enum SL_E_SRV_INVALID_LICENSE_STRUCTURE = 0xffffffffc004b004;
enum SL_E_SRV_AUTHORIZATION_FAILED = 0xffffffffc004b005;
enum SL_E_SRV_INVALID_BINDING = 0xffffffffc004b006;
enum SL_E_SRV_SERVER_PONG = 0xffffffffc004b007;
enum SL_E_SRV_INVALID_PAYLOAD = 0xffffffffc004b008;
enum SL_E_SRV_INVALID_SECURITY_PROCESSOR_LICENSE = 0xffffffffc004b009;
enum SL_E_SRV_BUSINESS_TOKEN_ENTRY_NOT_FOUND = 0xffffffffc004b010;
enum SL_E_SRV_CLIENT_CLOCK_OUT_OF_SYNC = 0xffffffffc004b011;
enum SL_E_SRV_GENERAL_ERROR = 0xffffffffc004b100;
enum SL_E_CHPA_PRODUCT_KEY_OUT_OF_RANGE = 0xffffffffc004c001;
enum SL_E_CHPA_INVALID_BINDING = 0xffffffffc004c002;
enum SL_E_CHPA_PRODUCT_KEY_BLOCKED = 0xffffffffc004c003;
enum SL_E_CHPA_INVALID_PRODUCT_KEY = 0xffffffffc004c004;
enum SL_E_CHPA_BINDING_NOT_FOUND = 0xffffffffc004c005;
enum SL_E_CHPA_BINDING_MAPPING_NOT_FOUND = 0xffffffffc004c006;
enum SL_E_CHPA_UNSUPPORTED_PRODUCT_KEY = 0xffffffffc004c007;
enum SL_E_CHPA_MAXIMUM_UNLOCK_EXCEEDED = 0xffffffffc004c008;
enum SL_E_CHPA_ACTCONFIG_ID_NOT_FOUND = 0xffffffffc004c009;
enum SL_E_CHPA_INVALID_PRODUCT_DATA_ID = 0xffffffffc004c00a;
enum SL_E_CHPA_INVALID_PRODUCT_DATA = 0xffffffffc004c00b;
enum SL_E_CHPA_SYSTEM_ERROR = 0xffffffffc004c00c;
enum SL_E_CHPA_INVALID_ACTCONFIG_ID = 0xffffffffc004c00d;
enum SL_E_CHPA_INVALID_PRODUCT_KEY_LENGTH = 0xffffffffc004c00e;
enum SL_E_CHPA_INVALID_PRODUCT_KEY_FORMAT = 0xffffffffc004c00f;
enum SL_E_CHPA_INVALID_PRODUCT_KEY_CHAR = 0xffffffffc004c010;
enum SL_E_CHPA_INVALID_BINDING_URI = 0xffffffffc004c011;
enum SL_E_CHPA_NETWORK_ERROR = 0xffffffffc004c012;
enum SL_E_CHPA_DATABASE_ERROR = 0xffffffffc004c013;
enum SL_E_CHPA_INVALID_ARGUMENT = 0xffffffffc004c014;
enum SL_E_CHPA_DMAK_LIMIT_EXCEEDED = 0xffffffffc004c020;
enum SL_E_CHPA_DMAK_EXTENSION_LIMIT_EXCEEDED = 0xffffffffc004c021;
enum SL_E_CHPA_REISSUANCE_LIMIT_NOT_FOUND = 0xffffffffc004c022;
enum SL_E_CHPA_OVERRIDE_REQUEST_NOT_FOUND = 0xffffffffc004c023;
enum SL_E_CHPA_OEM_SLP_COA0 = 0xffffffffc004c016;
enum SL_E_CHPA_PRODUCT_KEY_BLOCKED_IPLOCATION = 0xffffffffc004c017;
enum SL_E_CHPA_RESPONSE_NOT_AVAILABLE = 0xffffffffc004c015;
enum SL_E_CHPA_GENERAL_ERROR = 0xffffffffc004c050;
enum SL_E_CHPA_TIMEBASED_ACTIVATION_BEFORE_START_DATE = 0xffffffffc004c030;
enum SL_E_CHPA_TIMEBASED_ACTIVATION_AFTER_END_DATE = 0xffffffffc004c031;
enum SL_E_CHPA_TIMEBASED_ACTIVATION_NOT_AVAILABLE = 0xffffffffc004c032;
enum SL_E_CHPA_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = 0xffffffffc004c033;
enum SL_E_CHPA_NO_RULES_TO_ACTIVATE = 0xffffffffc004c04f;
enum SL_E_CHPA_DIGITALMARKER_INVALID_BINDING = 0xffffffffc004c051;
enum SL_E_CHPA_DIGITALMARKER_BINDING_NOT_CONFIGURED = 0xffffffffc004c052;
enum SL_E_CHPA_DYNAMICALLY_BLOCKED_PRODUCT_KEY = 0xffffffffc004c060;
enum SL_E_CHPA_MSCH_RESPONSE_NOT_AVAILABLE_VGA = 0xffffffffc004c3ff;
enum SL_E_CHPA_BUSINESS_RULE_INPUT_NOT_FOUND = 0xffffffffc004c700;
enum SL_E_CHPA_NULL_VALUE_FOR_PROPERTY_NAME_OR_ID = 0xffffffffc004c750;
enum SL_E_CHPA_UNKNOWN_PROPERTY_NAME = 0xffffffffc004c751;
enum SL_E_CHPA_UNKNOWN_PROPERTY_ID = 0xffffffffc004c752;
enum SL_E_CHPA_FAILED_TO_UPDATE_PRODUCTKEY_BINDING = 0xffffffffc004c755;
enum SL_E_CHPA_FAILED_TO_INSERT_PRODUCTKEY_BINDING = 0xffffffffc004c756;
enum SL_E_CHPA_FAILED_TO_DELETE_PRODUCTKEY_BINDING = 0xffffffffc004c757;
enum SL_E_CHPA_FAILED_TO_PROCESS_PRODUCT_KEY_BINDINGS_XML = 0xffffffffc004c758;
enum SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_PROPERTY = 0xffffffffc004c75a;
enum SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_PROPERTY = 0xffffffffc004c75b;
enum SL_E_CHPA_FAILED_TO_DELETE_PRODUCT_KEY_PROPERTY = 0xffffffffc004c75c;
enum SL_E_CHPA_UNKNOWN_PRODUCT_KEY_TYPE = 0xffffffffc004c764;
enum SL_E_CHPA_PRODUCT_KEY_BEING_USED = 0xffffffffc004c770;
enum SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_RECORD = 0xffffffffc004c780;
enum SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_RECORD = 0xffffffffc004c781;
enum SL_E_INVALID_LICENSE_STATE_BREACH_GRACE = 0xffffffffc004c291;
enum SL_E_INVALID_LICENSE_STATE_BREACH_GRACE_EXPIRED = 0xffffffffc004c292;
enum SL_E_INVALID_TEMPLATE_ID = 0xffffffffc004c2f6;
enum SL_E_INVALID_XML_BLOB = 0xffffffffc004c2fa;
enum SL_E_VALIDATION_BLOB_PARAM_NOT_FOUND = 0xffffffffc004c327;
enum SL_E_INVALID_CLIENT_TOKEN = 0xffffffffc004c328;
enum SL_E_INVALID_OFFLINE_BLOB = 0xffffffffc004c329;
enum SL_E_OFFLINE_VALIDATION_BLOB_PARAM_NOT_FOUND = 0xffffffffc004c32a;
enum SL_E_INVALID_OSVERSION_TEMPLATEID = 0xffffffffc004c32b;
enum SL_E_OFFLINE_GENUINE_BLOB_REVOKED = 0xffffffffc004c32c;
enum SL_E_OFFLINE_GENUINE_BLOB_NOT_FOUND = 0xffffffffc004c32d;
enum SL_E_INVALID_OS_FOR_PRODUCT_KEY = 0xffffffffc004c401;
enum SL_E_INVALID_FILE_HASH = 0xffffffffc004c4a1;
enum SL_E_VALIDATION_BLOCKED_PRODUCT_KEY = 0xffffffffc004c4a2;
enum SL_E_MISMATCHED_KEY_TYPES = 0xffffffffc004c4a4;
enum SL_E_VALIDATION_INVALID_PRODUCT_KEY = 0xffffffffc004c4a5;
enum SL_E_INVALID_OEM_OR_VOLUME_BINDING_DATA = 0xffffffffc004c4a7;
enum SL_E_INVALID_LICENSE_STATE = 0xffffffffc004c4a8;
enum SL_E_IP_LOCATION_FALIED = 0xffffffffc004c4a9;
enum SL_E_SOFTMOD_EXPLOIT_DETECTED = 0xffffffffc004c4ab;
enum SL_E_INVALID_TOKEN_DATA = 0xffffffffc004c4ac;
enum SL_E_HEALTH_CHECK_FAILED_NEUTRAL_FILES = 0xffffffffc004c4ad;
enum SL_E_HEALTH_CHECK_FAILED_MUI_FILES = 0xffffffffc004c4ae;
enum SL_E_INVALID_AD_DATA = 0xffffffffc004c4af;
enum SL_E_INVALID_RSDP_COUNT = 0xffffffffc004c4b0;
enum SL_E_ENGINE_DETECTED_EXPLOIT = 0xffffffffc004c4b1;
enum SL_E_NON_GENUINE_STATUS_LAST = 0xffffffffc004c600;
enum SL_E_NOTIFICATION_BREACH_DETECTED = 0xffffffffc004c531;
enum SL_E_NOTIFICATION_GRACE_EXPIRED = 0xffffffffc004c532;
enum SL_E_NOTIFICATION_OTHER_REASONS = 0xffffffffc004c533;
enum SL_E_INVALID_CONTEXT = 0xffffffffc004e001;
enum SL_E_TOKEN_STORE_INVALID_STATE = 0xffffffffc004e002;
enum SL_E_EVALUATION_FAILED = 0xffffffffc004e003;
enum SL_E_NOT_EVALUATED = 0xffffffffc004e004;
enum SL_E_NOT_ACTIVATED = 0xffffffffc004e005;
enum SL_E_INVALID_GUID = 0xffffffffc004e006;
enum SL_E_TOKSTO_TOKEN_NOT_FOUND = 0xffffffffc004e007;
enum SL_E_TOKSTO_NO_PROPERTIES = 0xffffffffc004e008;
enum SL_E_TOKSTO_NOT_INITIALIZED = 0xffffffffc004e009;
enum SL_E_TOKSTO_ALREADY_INITIALIZED = 0xffffffffc004e00a;
enum SL_E_TOKSTO_NO_ID_SET = 0xffffffffc004e00b;
enum SL_E_TOKSTO_CANT_CREATE_FILE = 0xffffffffc004e00c;
enum SL_E_TOKSTO_CANT_WRITE_TO_FILE = 0xffffffffc004e00d;
enum SL_E_TOKSTO_CANT_READ_FILE = 0xffffffffc004e00e;
enum SL_E_TOKSTO_CANT_PARSE_PROPERTIES = 0xffffffffc004e00f;
enum SL_E_TOKSTO_PROPERTY_NOT_FOUND = 0xffffffffc004e010;
enum SL_E_TOKSTO_INVALID_FILE = 0xffffffffc004e011;
enum SL_E_TOKSTO_CANT_CREATE_MUTEX = 0xffffffffc004e012;
enum SL_E_TOKSTO_CANT_ACQUIRE_MUTEX = 0xffffffffc004e013;
enum SL_E_TOKSTO_NO_TOKEN_DATA = 0xffffffffc004e014;
enum SL_E_EUL_CONSUMPTION_FAILED = 0xffffffffc004e015;
enum SL_E_PKEY_INVALID_CONFIG = 0xffffffffc004e016;
enum SL_E_PKEY_INVALID_UNIQUEID = 0xffffffffc004e017;
enum SL_E_PKEY_INVALID_ALGORITHM = 0xffffffffc004e018;
enum SL_E_PKEY_INTERNAL_ERROR = 0xffffffffc004e019;
enum SL_E_LICENSE_INVALID_ADDON_INFO = 0xffffffffc004e01a;
enum SL_E_HWID_ERROR = 0xffffffffc004e01b;
enum SL_E_PKEY_INVALID_KEYCHANGE1 = 0xffffffffc004e01c;
enum SL_E_PKEY_INVALID_KEYCHANGE2 = 0xffffffffc004e01d;
enum SL_E_PKEY_INVALID_KEYCHANGE3 = 0xffffffffc004e01e;
enum SL_E_POLICY_OTHERINFO_MISMATCH = 0xffffffffc004e020;
enum SL_E_PRODUCT_UNIQUENESS_GROUP_ID_INVALID = 0xffffffffc004e021;
enum SL_E_SECURE_STORE_ID_MISMATCH = 0xffffffffc004e022;
enum SL_E_INVALID_RULESET_RULE = 0xffffffffc004e023;
enum SL_E_INVALID_CONTEXT_DATA = 0xffffffffc004e024;
enum SL_E_INVALID_HASH = 0xffffffffc004e025;
enum SL_E_INVALID_USE_OF_ADD_ON_PKEY = 0xffffffff8004e026;
enum SL_E_WINDOWS_VERSION_MISMATCH = 0xffffffffc004e027;
enum SL_E_ACTIVATION_IN_PROGRESS = 0xffffffffc004e028;
enum SL_E_STORE_UPGRADE_TOKEN_REQUIRED = 0xffffffffc004e029;
enum SL_E_STORE_UPGRADE_TOKEN_WRONG_EDITION = 0xffffffffc004e02a;
enum SL_E_STORE_UPGRADE_TOKEN_WRONG_PID = 0xffffffffc004e02b;
enum SL_E_STORE_UPGRADE_TOKEN_NOT_PRS_SIGNED = 0xffffffffc004e02c;
enum SL_E_STORE_UPGRADE_TOKEN_WRONG_VERSION = 0xffffffffc004e02d;
enum SL_E_STORE_UPGRADE_TOKEN_NOT_AUTHORIZED = 0xffffffffc004e02e;
enum SL_E_SFS_INVALID_FS_VERSION = 0xffffffff8004e101;
enum SL_E_SFS_INVALID_FD_TABLE = 0xffffffff8004e102;
enum SL_E_SFS_INVALID_SYNC = 0xffffffff8004e103;
enum SL_E_SFS_BAD_TOKEN_NAME = 0xffffffff8004e104;
enum SL_E_SFS_BAD_TOKEN_EXT = 0xffffffff8004e105;
enum SL_E_SFS_DUPLICATE_TOKEN_NAME = 0xffffffff8004e106;
enum SL_E_SFS_TOKEN_SIZE_MISMATCH = 0xffffffff8004e107;
enum SL_E_SFS_INVALID_TOKEN_DATA_HASH = 0xffffffff8004e108;
enum SL_E_SFS_FILE_READ_ERROR = 0xffffffff8004e109;
enum SL_E_SFS_FILE_WRITE_ERROR = 0xffffffff8004e10a;
enum SL_E_SFS_INVALID_FILE_POSITION = 0xffffffff8004e10b;
enum SL_E_SFS_NO_ACTIVE_TRANSACTION = 0xffffffff8004e10c;
enum SL_E_SFS_INVALID_FS_HEADER = 0xffffffff8004e10d;
enum SL_E_SFS_INVALID_TOKEN_DESCRIPTOR = 0xffffffff8004e10e;
enum SL_E_INTERNAL_ERROR = 0xffffffffc004f001;
enum SL_E_RIGHT_NOT_CONSUMED = 0xffffffffc004f002;
enum SL_E_USE_LICENSE_NOT_INSTALLED = 0xffffffffc004f003;
enum SL_E_MISMATCHED_PKEY_RANGE = 0xffffffffc004f004;
enum SL_E_MISMATCHED_PID = 0xffffffffc004f005;
enum SL_E_EXTERNAL_SIGNATURE_NOT_FOUND = 0xffffffffc004f006;
enum SL_E_RAC_NOT_AVAILABLE = 0xffffffffc004f007;
enum SL_E_SPC_NOT_AVAILABLE = 0xffffffffc004f008;
enum SL_E_GRACE_TIME_EXPIRED = 0xffffffffc004f009;
enum SL_E_MISMATCHED_APPID = 0xffffffffc004f00a;
enum SL_E_NO_PID_CONFIG_DATA = 0xffffffffc004f00b;
enum SL_I_OOB_GRACE_PERIOD = 0x4004f00c;
enum SL_I_OOT_GRACE_PERIOD = 0x4004f00d;
enum SL_E_MISMATCHED_SECURITY_PROCESSOR = 0xffffffffc004f00e;
enum SL_E_OUT_OF_TOLERANCE = 0xffffffffc004f00f;
enum SL_E_INVALID_PKEY = 0xffffffffc004f010;
enum SL_E_LICENSE_FILE_NOT_INSTALLED = 0xffffffffc004f011;
enum SL_E_VALUE_NOT_FOUND = 0xffffffffc004f012;
enum SL_E_RIGHT_NOT_GRANTED = 0xffffffffc004f013;
enum SL_E_PKEY_NOT_INSTALLED = 0xffffffffc004f014;
enum SL_E_PRODUCT_SKU_NOT_INSTALLED = 0xffffffffc004f015;
enum SL_E_NOT_SUPPORTED = 0xffffffffc004f016;
enum SL_E_PUBLISHING_LICENSE_NOT_INSTALLED = 0xffffffffc004f017;
enum SL_E_LICENSE_SERVER_URL_NOT_FOUND = 0xffffffffc004f018;
enum SL_E_INVALID_EVENT_ID = 0xffffffffc004f019;
enum SL_E_EVENT_NOT_REGISTERED = 0xffffffffc004f01a;
enum SL_E_EVENT_ALREADY_REGISTERED = 0xffffffffc004f01b;
enum SL_E_DECRYPTION_LICENSES_NOT_AVAILABLE = 0xffffffffc004f01c;
enum SL_E_LICENSE_SIGNATURE_VERIFICATION_FAILED = 0xffffffffc004f01d;
enum SL_E_DATATYPE_MISMATCHED = 0xffffffffc004f01e;
enum SL_E_INVALID_LICENSE = 0xffffffffc004f01f;
enum SL_E_INVALID_PACKAGE = 0xffffffffc004f020;
enum SL_E_VALIDITY_TIME_EXPIRED = 0xffffffffc004f021;
enum SL_E_LICENSE_AUTHORIZATION_FAILED = 0xffffffffc004f022;
enum SL_E_LICENSE_DECRYPTION_FAILED = 0xffffffffc004f023;
enum SL_E_WINDOWS_INVALID_LICENSE_STATE = 0xffffffffc004f024;
enum SL_E_LUA_ACCESSDENIED = 0xffffffffc004f025;
enum SL_E_PROXY_KEY_NOT_FOUND = 0xffffffffc004f026;
enum SL_E_TAMPER_DETECTED = 0xffffffffc004f027;
enum SL_E_POLICY_CACHE_INVALID = 0xffffffffc004f028;
enum SL_E_INVALID_RUNNING_MODE = 0xffffffffc004f029;
enum SL_E_SLP_NOT_SIGNED = 0xffffffffc004f02a;
enum SL_E_CIDIID_INVALID_DATA = 0xffffffffc004f02c;
enum SL_E_CIDIID_INVALID_VERSION = 0xffffffffc004f02d;
enum SL_E_CIDIID_VERSION_NOT_SUPPORTED = 0xffffffffc004f02e;
enum SL_E_CIDIID_INVALID_DATA_LENGTH = 0xffffffffc004f02f;
enum SL_E_CIDIID_NOT_DEPOSITED = 0xffffffffc004f030;
enum SL_E_CIDIID_MISMATCHED = 0xffffffffc004f031;
enum SL_E_INVALID_BINDING_BLOB = 0xffffffffc004f032;
enum SL_E_PRODUCT_KEY_INSTALLATION_NOT_ALLOWED = 0xffffffffc004f033;
enum SL_E_EUL_NOT_AVAILABLE = 0xffffffffc004f034;
enum SL_E_VL_NOT_WINDOWS_SLP = 0xffffffffc004f035;
enum SL_E_VL_NOT_ENOUGH_COUNT = 0xffffffffc004f038;
enum SL_E_VL_BINDING_SERVICE_NOT_ENABLED = 0xffffffffc004f039;
enum SL_E_VL_INFO_PRODUCT_USER_RIGHT = 0x4004f040;
enum SL_E_VL_KEY_MANAGEMENT_SERVICE_NOT_ACTIVATED = 0xffffffffc004f041;
enum SL_E_VL_KEY_MANAGEMENT_SERVICE_ID_MISMATCH = 0xffffffffc004f042;
enum SL_E_PROXY_POLICY_NOT_UPDATED = 0xffffffffc004f047;
enum SL_E_CIDIID_INVALID_CHECK_DIGITS = 0xffffffffc004f04d;
enum SL_E_LICENSE_MANAGEMENT_DATA_NOT_FOUND = 0xffffffffc004f04f;
enum SL_E_INVALID_PRODUCT_KEY = 0xffffffffc004f050;
enum SL_E_BLOCKED_PRODUCT_KEY = 0xffffffffc004f051;
enum SL_E_DUPLICATE_POLICY = 0xffffffffc004f052;
enum SL_E_MISSING_OVERRIDE_ONLY_ATTRIBUTE = 0xffffffffc004f053;
enum SL_E_LICENSE_MANAGEMENT_DATA_DUPLICATED = 0xffffffffc004f054;
enum SL_E_BASE_SKU_NOT_AVAILABLE = 0xffffffffc004f055;
enum SL_E_VL_MACHINE_NOT_BOUND = 0xffffffffc004f056;
enum SL_E_SLP_MISSING_ACPI_SLIC = 0xffffffffc004f057;
enum SL_E_SLP_MISSING_SLP_MARKER = 0xffffffffc004f058;
enum SL_E_SLP_BAD_FORMAT = 0xffffffffc004f059;
enum SL_E_INVALID_PACKAGE_VERSION = 0xffffffffc004f060;
enum SL_E_PKEY_INVALID_UPGRADE = 0xffffffffc004f061;
enum SL_E_ISSUANCE_LICENSE_NOT_INSTALLED = 0xffffffffc004f062;
enum SL_E_SLP_OEM_CERT_MISSING = 0xffffffffc004f063;
enum SL_E_NONGENUINE_GRACE_TIME_EXPIRED = 0xffffffffc004f064;
enum SL_I_NONGENUINE_GRACE_PERIOD = 0x4004f065;
enum SL_E_DEPENDENT_PROPERTY_NOT_SET = 0xffffffffc004f066;
enum SL_E_NONGENUINE_GRACE_TIME_EXPIRED_2 = 0xffffffffc004f067;
enum SL_I_NONGENUINE_GRACE_PERIOD_2 = 0x4004f068;
enum SL_E_MISMATCHED_PRODUCT_SKU = 0xffffffffc004f069;
enum SL_E_OPERATION_NOT_ALLOWED = 0xffffffffc004f06a;
enum SL_E_VL_KEY_MANAGEMENT_SERVICE_VM_NOT_SUPPORTED = 0xffffffffc004f06b;
enum SL_E_VL_INVALID_TIMESTAMP = 0xffffffffc004f06c;
enum SL_E_PLUGIN_INVALID_MANIFEST = 0xffffffffc004f071;
enum SL_E_APPLICATION_POLICIES_MISSING = 0xffffffffc004f072;
enum SL_E_APPLICATION_POLICIES_NOT_LOADED = 0xffffffffc004f073;
enum SL_E_VL_BINDING_SERVICE_UNAVAILABLE = 0xffffffffc004f074;
enum SL_E_SERVICE_STOPPING = 0xffffffffc004f075;
enum SL_E_PLUGIN_NOT_REGISTERED = 0xffffffffc004f076;
enum SL_E_AUTHN_WRONG_VERSION = 0xffffffffc004f077;
enum SL_E_AUTHN_MISMATCHED_KEY = 0xffffffffc004f078;
enum SL_E_AUTHN_CHALLENGE_NOT_SET = 0xffffffffc004f079;
enum SL_E_AUTHN_CANT_VERIFY = 0xffffffffc004f07a;
enum SL_E_SERVICE_RUNNING = 0xffffffffc004f07b;
enum SL_E_SLP_INVALID_MARKER_VERSION = 0xffffffffc004f07c;
enum SL_E_INVALID_PRODUCT_KEY_TYPE = 0xffffffffc004f07d;
enum SL_E_CIDIID_MISMATCHED_PKEY = 0xffffffffc004f07e;
enum SL_E_CIDIID_NOT_BOUND = 0xffffffffc004f07f;
enum SL_E_LICENSE_NOT_BOUND = 0xffffffffc004f080;
enum SL_E_VL_AD_AO_NOT_FOUND = 0xffffffffc004f081;
enum SL_E_VL_AD_AO_NAME_TOO_LONG = 0xffffffffc004f082;
enum SL_E_VL_AD_SCHEMA_VERSION_NOT_SUPPORTED = 0xffffffffc004f083;
enum SL_E_NOT_GENUINE = 0xffffffffc004f200;
enum SL_E_EDITION_MISMATCHED = 0xffffffffc004f210;
enum SL_E_HWID_CHANGED = 0xffffffffc004f211;
enum SL_E_OEM_KEY_EDITION_MISMATCH = 0xffffffffc004f212;
enum SL_E_NO_PRODUCT_KEY_FOUND = 0xffffffffc004f213;
enum SL_E_DOWNLEVEL_SETUP_KEY = 0xffffffffc004f214;
enum SL_E_BIOS_KEY = 0xffffffffc004f215;
enum SL_E_TKA_CHALLENGE_EXPIRED = 0xffffffffc004f301;
enum SL_E_TKA_SILENT_ACTIVATION_FAILURE = 0xffffffffc004f302;
enum SL_E_TKA_INVALID_CERT_CHAIN = 0xffffffffc004f303;
enum SL_E_TKA_GRANT_NOT_FOUND = 0xffffffffc004f304;
enum SL_E_TKA_CERT_NOT_FOUND = 0xffffffffc004f305;
enum SL_E_TKA_INVALID_SKU_ID = 0xffffffffc004f306;
enum SL_E_TKA_INVALID_BLOB = 0xffffffffc004f307;
enum SL_E_TKA_TAMPERED_CERT_CHAIN = 0xffffffffc004f308;
enum SL_E_TKA_CHALLENGE_MISMATCH = 0xffffffffc004f309;
enum SL_E_TKA_INVALID_CERTIFICATE = 0xffffffffc004f30a;
enum SL_E_TKA_INVALID_SMARTCARD = 0xffffffffc004f30b;
enum SL_E_TKA_FAILED_GRANT_PARSING = 0xffffffffc004f30c;
enum SL_E_TKA_INVALID_THUMBPRINT = 0xffffffffc004f30d;
enum SL_E_TKA_THUMBPRINT_CERT_NOT_FOUND = 0xffffffffc004f30e;
enum SL_E_TKA_CRITERIA_MISMATCH = 0xffffffffc004f30f;
enum SL_E_TKA_TPID_MISMATCH = 0xffffffffc004f310;
enum SL_E_TKA_SOFT_CERT_DISALLOWED = 0xffffffffc004f311;
enum SL_E_TKA_SOFT_CERT_INVALID = 0xffffffffc004f312;
enum SL_E_TKA_CERT_CNG_NOT_AVAILABLE = 0xffffffffc004f313;
enum SL_I_STORE_BASED_ACTIVATION = 0x4004f401;
enum E_RM_UNKNOWN_ERROR = 0xffffffffc004fc03;
enum SL_I_TIMEBASED_VALIDITY_PERIOD = 0x4004fc04;
enum SL_I_PERPETUAL_OOB_GRACE_PERIOD = 0x4004fc05;
enum SL_I_TIMEBASED_EXTENDED_GRACE_PERIOD = 0x4004fc06;
enum SL_E_VALIDITY_PERIOD_EXPIRED = 0xffffffffc004fc07;
enum SL_E_IA_THROTTLE_LIMIT_EXCEEDED = 0xffffffffc004fd00;
enum SL_E_IA_INVALID_VIRTUALIZATION_PLATFORM = 0xffffffffc004fd01;
enum SL_E_IA_PARENT_PARTITION_NOT_ACTIVATED = 0xffffffffc004fd02;
enum SL_E_IA_ID_MISMATCH = 0xffffffffc004fd03;
enum SL_E_IA_MACHINE_NOT_BOUND = 0xffffffffc004fd04;
enum SL_E_TAMPER_RECOVERY_REQUIRES_ACTIVATION = 0xffffffffc004fe00;
enum SL_REMAPPING_SP_PUB_GENERAL_NOT_INITIALIZED = 0xffffffffc004d101;
enum SL_REMAPPING_SP_STATUS_SYSTEM_TIME_SKEWED = 0xffffffff8004d102;
enum SL_REMAPPING_SP_STATUS_GENERIC_FAILURE = 0xffffffffc004d103;
enum SL_REMAPPING_SP_STATUS_INVALIDARG = 0xffffffffc004d104;
enum SL_REMAPPING_SP_STATUS_ALREADY_EXISTS = 0xffffffffc004d105;
enum SL_REMAPPING_SP_STATUS_INSUFFICIENT_BUFFER = 0xffffffffc004d107;
enum SL_REMAPPING_SP_STATUS_INVALIDDATA = 0xffffffffc004d108;
enum SL_REMAPPING_SP_STATUS_INVALID_SPAPI_CALL = 0xffffffffc004d109;
enum SL_REMAPPING_SP_STATUS_INVALID_SPAPI_VERSION = 0xffffffffc004d10a;
enum SL_REMAPPING_SP_STATUS_DEBUGGER_DETECTED = 0xffffffff8004d10b;
enum SL_REMAPPING_SP_STATUS_NO_MORE_DATA = 0xffffffffc004d10c;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_KEYLENGTH = 0xffffffffc004d201;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCKLENGTH = 0xffffffffc004d202;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHER = 0xffffffffc004d203;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHERMODE = 0xffffffffc004d204;
enum SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_PROVIDERID = 0xffffffffc004d205;
enum SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_KEYID = 0xffffffffc004d206;
enum SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_HASHID = 0xffffffffc004d207;
enum SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_ATTRIBUTEID = 0xffffffffc004d208;
enum SL_REMAPPING_SP_PUB_CRYPTO_HASH_FINALIZED = 0xffffffffc004d209;
enum SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_AVAILABLE = 0xffffffffc004d20a;
enum SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_FOUND = 0xffffffffc004d20b;
enum SL_REMAPPING_SP_PUB_CRYPTO_NOT_BLOCK_ALIGNED = 0xffffffffc004d20c;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURELENGTH = 0xffffffffc004d20d;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURE = 0xffffffffc004d20e;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCK = 0xffffffffc004d20f;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_FORMAT = 0xffffffffc004d210;
enum SL_REMAPPING_SP_PUB_CRYPTO_INVALID_PADDING = 0xffffffffc004d211;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED = 0xffffffffc004d301;
enum SL_REMAPPING_SP_PUB_TS_REARMED = 0xffffffffc004d302;
enum SL_REMAPPING_SP_PUB_TS_RECREATED = 0xffffffffc004d303;
enum SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_NOT_FOUND = 0xffffffffc004d304;
enum SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_ALREADY_EXISTS = 0xffffffffc004d305;
enum SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_SIZE_TOO_BIG = 0xffffffffc004d306;
enum SL_REMAPPING_SP_PUB_TS_MAX_REARM_REACHED = 0xffffffffc004d307;
enum SL_REMAPPING_SP_PUB_TS_DATA_SIZE_TOO_BIG = 0xffffffffc004d308;
enum SL_REMAPPING_SP_PUB_TS_INVALID_HW_BINDING = 0xffffffffc004d309;
enum SL_REMAPPING_SP_PUB_TIMER_ALREADY_EXISTS = 0xffffffffc004d30a;
enum SL_REMAPPING_SP_PUB_TIMER_NOT_FOUND = 0xffffffffc004d30b;
enum SL_REMAPPING_SP_PUB_TIMER_EXPIRED = 0xffffffffc004d30c;
enum SL_REMAPPING_SP_PUB_TIMER_NAME_SIZE_TOO_BIG = 0xffffffffc004d30d;
enum SL_REMAPPING_SP_PUB_TS_FULL = 0xffffffffc004d30e;
enum SL_REMAPPING_SP_PUB_TRUSTED_TIME_OK = 0x4004d30f;
enum SL_REMAPPING_SP_PUB_TS_ENTRY_READ_ONLY = 0xffffffffc004d310;
enum SL_REMAPPING_SP_PUB_TIMER_READ_ONLY = 0xffffffffc004d311;
enum SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_READ_ONLY = 0xffffffffc004d312;
enum SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_NOT_FOUND = 0xffffffffc004d313;
enum SL_REMAPPING_SP_PUB_TS_ACCESS_DENIED = 0xffffffffc004d314;
enum SL_REMAPPING_SP_PUB_TS_NAMESPACE_NOT_FOUND = 0xffffffffc004d315;
enum SL_REMAPPING_SP_PUB_TS_NAMESPACE_IN_USE = 0xffffffffc004d316;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_LOAD_INVALID = 0xffffffffc004d317;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_GENERATION = 0xffffffffc004d318;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_INVALID_DATA = 0xffffffffc004d319;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_NO_DATA = 0xffffffffc004d31a;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_BREADCRUMB_MISMATCH = 0xffffffffc004d31b;
enum SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_VERSION_MISMATCH = 0xffffffffc004d31c;
enum SL_REMAPPING_SP_PUB_TAMPER_MODULE_AUTHENTICATION = 0xffffffffc004d401;
enum SL_REMAPPING_SP_PUB_TAMPER_SECURITY_PROCESSOR_PATCHED = 0xffffffffc004d402;
enum SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER = 0xffffffffc004d501;
enum SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER_RESTORE_FAILED = 0xffffffffc004d502;
enum SL_REMAPPING_SP_PUB_KM_CACHE_IDENTICAL = 0x4004d601;
enum SL_REMAPPING_SP_PUB_KM_CACHE_POLICY_CHANGED = 0x4004d602;
enum SL_REMAPPING_SP_STATUS_PUSHKEY_CONFLICT = 0xffffffffc004d701;
enum SL_REMAPPING_SP_PUB_PROXY_SOFT_TAMPER = 0xffffffffc004d702;
enum SL_REMAPPING_SP_PUB_API_INVALID_LICENSE = 0xffffffffc004d000;
enum SL_REMAPPING_SP_PUB_API_INVALID_ALGORITHM_TYPE = 0xffffffffc004d009;
enum SL_REMAPPING_SP_PUB_API_TOO_MANY_LOADED_ENVIRONMENTS = 0xffffffffc004d00c;
enum SL_REMAPPING_SP_PUB_API_BAD_GET_INFO_QUERY = 0xffffffffc004d012;
enum SL_REMAPPING_SP_PUB_API_INVALID_HANDLE = 0xffffffffc004d02c;
enum SL_REMAPPING_SP_PUB_API_INVALID_KEY_LENGTH = 0xffffffffc004d055;
enum SL_REMAPPING_SP_PUB_API_NO_AES_PROVIDER = 0xffffffffc004d073;
enum SL_REMAPPING_SP_PUB_API_HANDLE_NOT_COMMITED = 0xffffffffc004d081;
enum SL_REMAPPING_MDOLLAR_PRODUCT_KEY_OUT_OF_RANGE = 0xffffffff803fa065;
enum SL_REMAPPING_MDOLLAR_INVALID_BINDING = 0xffffffff803fa066;
enum SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED = 0xffffffff803fa067;
enum SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY = 0xffffffff803fa068;
enum SL_REMAPPING_MDOLLAR_UNSUPPORTED_PRODUCT_KEY = 0xffffffff803fa06c;
enum SL_REMAPPING_MDOLLAR_MAXIMUM_UNLOCK_EXCEEDED = 0xffffffff803fa071;
enum SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA_ID = 0xffffffff803fa073;
enum SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA = 0xffffffff803fa074;
enum SL_REMAPPING_MDOLLAR_INVALID_ACTCONFIG_ID = 0xffffffff803fa076;
enum SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_LENGTH = 0xffffffff803fa077;
enum SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_FORMAT = 0xffffffff803fa078;
enum SL_REMAPPING_MDOLLAR_INVALID_BINDING_URI = 0xffffffff803fa07a;
enum SL_REMAPPING_MDOLLAR_INVALID_ARGUMENT = 0xffffffff803fa07d;
enum SL_REMAPPING_MDOLLAR_DMAK_LIMIT_EXCEEDED = 0xffffffff803fa07f;
enum SL_REMAPPING_MDOLLAR_DMAK_EXTENSION_LIMIT_EXCEEDED = 0xffffffff803fa080;
enum SL_REMAPPING_MDOLLAR_OEM_SLP_COA0 = 0xffffffff803fa083;
enum SL_REMAPPING_MDOLLAR_CIDIID_INVALID_VERSION = 0xffffffff803fa08d;
enum SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA = 0xffffffff803fa08e;
enum SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA_LENGTH = 0xffffffff803fa08f;
enum SL_REMAPPING_MDOLLAR_CIDIID_INVALID_CHECK_DIGITS = 0xffffffff803fa090;
enum SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_BEFORE_START_DATE = 0xffffffff803fa097;
enum SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_AFTER_END_DATE = 0xffffffff803fa098;
enum SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_NOT_AVAILABLE = 0xffffffff803fa099;
enum SL_REMAPPING_MDOLLAR_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = 0xffffffff803fa09a;
enum SL_REMAPPING_MDOLLAR_NO_RULES_TO_ACTIVATE = 0xffffffff803fa0c8;
enum SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED_IPLOCATION = 0xffffffff803fa0cb;
enum SL_REMAPPING_MDOLLAR_DIGITALMARKER_INVALID_BINDING = 0xffffffff803fa0d3;
enum SL_REMAPPING_MDOLLAR_DIGITALMARKER_BINDING_NOT_CONFIGURED = 0xffffffff803fa0d4;
enum SL_REMAPPING_MDOLLAR_ROT_OVERRIDE_LIMIT_REACHED = 0xffffffff803fa0d5;
enum SL_REMAPPING_MDOLLAR_DMAK_OVERRIDE_LIMIT_REACHED = 0xffffffff803fa0d6;
enum SL_REMAPPING_MDOLLAR_FREE_OFFER_EXPIRED = 0xffffffff803fa400;
enum SL_REMAPPING_MDOLLAR_OSR_DONOR_HWID_NO_ENTITLEMENT = 0xffffffff803fabb8;
enum SL_REMAPPING_MDOLLAR_OSR_GENERIC_ERROR = 0xffffffff803fabb9;
enum SL_REMAPPING_MDOLLAR_OSR_NO_ASSOCIATION = 0xffffffff803fabba;
enum SL_REMAPPING_MDOLLAR_OSR_NOT_ADMIN = 0xffffffff803fabbb;
enum SL_REMAPPING_MDOLLAR_OSR_USER_THROTTLED = 0xffffffff803fabbc;
enum SL_REMAPPING_MDOLLAR_OSR_LICENSE_THROTTLED = 0xffffffff803fabbd;
enum SL_REMAPPING_MDOLLAR_OSR_DEVICE_THROTTLED = 0xffffffff803fabbe;
enum SL_REMAPPING_MDOLLAR_OSR_GP_DISABLED = 0xffffffff803fabbf;
enum SL_REMAPPING_MDOLLAR_OSR_HARDWARE_BLOCKED = 0xffffffff803fabc0;
enum SL_REMAPPING_MDOLLAR_OSR_USER_BLOCKED = 0xffffffff803fabc1;
enum SL_REMAPPING_MDOLLAR_OSR_LICENSE_BLOCKED = 0xffffffff803fabc2;
enum SL_REMAPPING_MDOLLAR_OSR_DEVICE_BLOCKED = 0xffffffff803fabc3;
enum WINDOWS_SLID = GUID(0x55c92734, 0xd682, 0x4d71, [0x98, 0x3e, 0xd6, 0xec, 0x3f, 0x16, 0x5, 0x9f]);
enum WDIGEST_SP_NAME_A = "WDigest";
enum WDIGEST_SP_NAME_W = "WDigest";
enum WDIGEST_SP_NAME = "WDigest";
alias SECPKG_ATTR = uint;
enum : uint
{
    SECPKG_ATTR_C_ACCESS_TOKEN              = 0x80000012,
    SECPKG_ATTR_C_FULL_ACCESS_TOKEN         = 0x80000082,
    SECPKG_ATTR_CERT_TRUST_STATUS           = 0x80000084,
    SECPKG_ATTR_CREDS                       = 0x80000080,
    SECPKG_ATTR_CREDS_2                     = 0x80000086,
    SECPKG_ATTR_NEGOTIATION_PACKAGE         = 0x80000081,
    SECPKG_ATTR_PACKAGE_INFO                = 0x0000000a,
    SECPKG_ATTR_SERVER_AUTH_FLAGS           = 0x80000083,
    SECPKG_ATTR_SIZES                       = 0x00000000,
    SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES = 0x0000007c,
    SECPKG_ATTR_APP_DATA                    = 0x0000005e,
    SECPKG_ATTR_EAP_PRF_INFO                = 0x00000065,
    SECPKG_ATTR_EARLY_START                 = 0x00000069,
    SECPKG_ATTR_DTLS_MTU                    = 0x00000022,
    SECPKG_ATTR_KEYING_MATERIAL_INFO        = 0x0000006a,
    SECPKG_ATTR_ACCESS_TOKEN                = 0x00000012,
    SECPKG_ATTR_AUTHORITY                   = 0x00000006,
    SECPKG_ATTR_CLIENT_SPECIFIED_TARGET     = 0x0000001b,
    SECPKG_ATTR_CONNECTION_INFO             = 0x0000005a,
    SECPKG_ATTR_DCE_INFO                    = 0x00000003,
    SECPKG_ATTR_ENDPOINT_BINDINGS           = 0x0000001a,
    SECPKG_ATTR_EAP_KEY_BLOCK               = 0x0000005b,
    SECPKG_ATTR_FLAGS                       = 0x0000000e,
    SECPKG_ATTR_ISSUER_LIST_EX              = 0x00000059,
    SECPKG_ATTR_KEY_INFO                    = 0x00000005,
    SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS    = 0x0000001e,
    SECPKG_ATTR_LIFESPAN                    = 0x00000002,
    SECPKG_ATTR_LOCAL_CERT_CONTEXT          = 0x00000054,
    SECPKG_ATTR_LOCAL_CRED                  = 0x00000052,
    SECPKG_ATTR_NAMES                       = 0x00000001,
    SECPKG_ATTR_NATIVE_NAMES                = 0x0000000d,
    SECPKG_ATTR_NEGOTIATION_INFO            = 0x0000000c,
    SECPKG_ATTR_PASSWORD_EXPIRY             = 0x00000008,
    SECPKG_ATTR_REMOTE_CERT_CONTEXT         = 0x00000053,
    SECPKG_ATTR_ROOT_STORE                  = 0x00000055,
    SECPKG_ATTR_SESSION_KEY                 = 0x00000009,
    SECPKG_ATTR_SESSION_INFO                = 0x0000005d,
    SECPKG_ATTR_STREAM_SIZES                = 0x00000004,
    SECPKG_ATTR_SUPPORTED_SIGNATURES        = 0x00000066,
    SECPKG_ATTR_TARGET_INFORMATION          = 0x00000011,
    SECPKG_ATTR_UNIQUE_BINDINGS             = 0x00000019,
}

alias MSV1_0 = uint;
enum : uint
{
    MSV1_0_PASSTHRU    = 0x00000001,
    MSV1_0_GUEST_LOGON = 0x00000002,
}

alias SECPKG_CRED = uint;
enum : uint
{
    SECPKG_CRED_INBOUND  = 0x00000001,
    SECPKG_CRED_OUTBOUND = 0x00000002,
}

alias MSV_SUB_AUTHENTICATION_FILTER = uint;
enum : uint
{
    LOGON_GUEST                 = 0x00000001,
    LOGON_NOENCRYPTION          = 0x00000002,
    LOGON_CACHED_ACCOUNT        = 0x00000004,
    LOGON_USED_LM_PASSWORD      = 0x00000008,
    LOGON_EXTRA_SIDS            = 0x00000020,
    LOGON_SUBAUTH_SESSION_KEY   = 0x00000040,
    LOGON_SERVER_TRUST_ACCOUNT  = 0x00000080,
    LOGON_PROFILE_PATH_RETURNED = 0x00000400,
    LOGON_RESOURCE_GROUPS       = 0x00000200,
}

alias EXPORT_SECURITY_CONTEXT_FLAGS = uint;
enum : uint
{
    SECPKG_CONTEXT_EXPORT_RESET_NEW  = 0x00000001,
    SECPKG_CONTEXT_EXPORT_DELETE_OLD = 0x00000002,
    SECPKG_CONTEXT_EXPORT_TO_KERNEL  = 0x00000004,
}

alias KERB_TICKET_FLAGS = uint;
enum : uint
{
    KERB_TICKET_FLAGS_forwardable    = 0x40000000,
    KERB_TICKET_FLAGS_forwarded      = 0x20000000,
    KERB_TICKET_FLAGS_hw_authent     = 0x00100000,
    KERB_TICKET_FLAGS_initial        = 0x00400000,
    KERB_TICKET_FLAGS_invalid        = 0x01000000,
    KERB_TICKET_FLAGS_may_postdate   = 0x04000000,
    KERB_TICKET_FLAGS_ok_as_delegate = 0x00040000,
    KERB_TICKET_FLAGS_postdated      = 0x02000000,
    KERB_TICKET_FLAGS_pre_authent    = 0x00200000,
    KERB_TICKET_FLAGS_proxiable      = 0x10000000,
    KERB_TICKET_FLAGS_proxy          = 0x08000000,
    KERB_TICKET_FLAGS_renewable      = 0x00800000,
    KERB_TICKET_FLAGS_reserved       = 0x80000000,
    KERB_TICKET_FLAGS_reserved1      = 0x00000001,
}

alias KERB_ADDRESS_TYPE = uint;
enum : uint
{
    DS_INET_ADDRESS    = 0x00000001,
    DS_NETBIOS_ADDRESS = 0x00000002,
}

alias SCHANNEL_CRED_FLAGS = uint;
enum : uint
{
    SCH_CRED_AUTO_CRED_VALIDATION                = 0x00000020,
    SCH_CRED_CACHE_ONLY_URL_RETRIEVAL_ON_CREATE  = 0x00020000,
    SCH_DISABLE_RECONNECTS                       = 0x00000080,
    SCH_CRED_IGNORE_NO_REVOCATION_CHECK          = 0x00000800,
    SCH_CRED_IGNORE_REVOCATION_OFFLINE           = 0x00001000,
    SCH_CRED_MANUAL_CRED_VALIDATION              = 0x00000008,
    SCH_CRED_NO_DEFAULT_CREDS                    = 0x00000010,
    SCH_CRED_NO_SERVERNAME_CHECK                 = 0x00000004,
    SCH_CRED_NO_SYSTEM_MAPPER                    = 0x00000002,
    SCH_CRED_REVOCATION_CHECK_CHAIN              = 0x00000200,
    SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x00000400,
    SCH_CRED_REVOCATION_CHECK_END_CERT           = 0x00000100,
    SCH_CRED_USE_DEFAULT_CREDS                   = 0x00000040,
    SCH_SEND_AUX_RECORD                          = 0x00200000,
    SCH_SEND_ROOT_CERT                           = 0x00040000,
    SCH_USE_STRONG_CRYPTO                        = 0x00400000,
    SCH_USE_PRESHAREDKEY_ONLY                    = 0x00800000,
}

alias DOMAIN_PASSWORD_PROPERTIES = uint;
enum : uint
{
    DOMAIN_PASSWORD_COMPLEX         = 0x00000001,
    DOMAIN_PASSWORD_NO_ANON_CHANGE  = 0x00000002,
    DOMAIN_PASSWORD_NO_CLEAR_CHANGE = 0x00000004,
    DOMAIN_LOCKOUT_ADMINS           = 0x00000008,
    DOMAIN_PASSWORD_STORE_CLEARTEXT = 0x00000010,
    DOMAIN_REFUSE_PASSWORD_CHANGE   = 0x00000020,
}

alias SCHANNEL_ALERT_TOKEN_ALERT_TYPE = uint;
enum : uint
{
    TLS1_ALERT_WARNING = 0x00000001,
    TLS1_ALERT_FATAL   = 0x00000002,
}

alias TRUSTED_DOMAIN_TRUST_TYPE = uint;
enum : uint
{
    TRUST_TYPE_DOWNLEVEL = 0x00000001,
    TRUST_TYPE_UPLEVEL   = 0x00000002,
    TRUST_TYPE_MIT       = 0x00000003,
    TRUST_TYPE_DCE       = 0x00000004,
}

alias MSV_SUBAUTH_LOGON_PARAMETER_CONTROL = uint;
enum : uint
{
    MSV1_0_CLEARTEXT_PASSWORD_ALLOWED      = 0x00000002,
    MSV1_0_UPDATE_LOGON_STATISTICS         = 0x00000004,
    MSV1_0_RETURN_USER_PARAMETERS          = 0x00000008,
    MSV1_0_DONT_TRY_GUEST_ACCOUNT          = 0x00000010,
    MSV1_0_ALLOW_SERVER_TRUST_ACCOUNT      = 0x00000020,
    MSV1_0_RETURN_PASSWORD_EXPIRY          = 0x00000040,
    MSV1_0_ALLOW_WORKSTATION_TRUST_ACCOUNT = 0x00000800,
    MSV1_0_TRY_GUEST_ACCOUNT_ONLY          = 0x00000100,
    MSV1_0_RETURN_PROFILE_PATH             = 0x00000200,
    MSV1_0_TRY_SPECIFIED_DOMAIN_ONLY       = 0x00000400,
}

alias KERB_REQUEST_FLAGS = uint;
enum : uint
{
    KERB_REQUEST_ADD_CREDENTIAL     = 0x00000001,
    KERB_REQUEST_REPLACE_CREDENTIAL = 0x00000002,
    KERB_REQUEST_REMOVE_CREDENTIAL  = 0x00000004,
}

alias TRUSTED_DOMAIN_TRUST_DIRECTION = uint;
enum : uint
{
    TRUST_DIRECTION_DISABLED      = 0x00000000,
    TRUST_DIRECTION_INBOUND       = 0x00000001,
    TRUST_DIRECTION_OUTBOUND      = 0x00000002,
    TRUST_DIRECTION_BIDIRECTIONAL = 0x00000003,
}

alias MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS = uint;
enum : uint
{
    MSV1_0_CRED_LM_PRESENT = 0x00000001,
    MSV1_0_CRED_NT_PRESENT = 0x00000002,
    MSV1_0_CRED_VERSION    = 0x00000000,
}

alias SECURITY_PACKAGE_OPTIONS_TYPE = uint;
enum : uint
{
    SECPKG_OPTIONS_TYPE_UNKNOWN = 0x00000000,
    SECPKG_OPTIONS_TYPE_LSA     = 0x00000001,
    SECPKG_OPTIONS_TYPE_SSPI    = 0x00000002,
}

alias SCHANNEL_SESSION_TOKEN_FLAGS = uint;
enum : uint
{
    SSL_SESSION_ENABLE_RECONNECTS  = 0x00000001,
    SSL_SESSION_DISABLE_RECONNECTS = 0x00000002,
}

alias KERB_CRYPTO_KEY_TYPE = int;
enum : int
{
    KERB_ETYPE_DES_CBC_CRC = 0x00000001,
    KERB_ETYPE_DES_CBC_MD4 = 0x00000002,
    KERB_ETYPE_DES_CBC_MD5 = 0x00000003,
    KERB_ETYPE_NULL        = 0x00000000,
    KERB_ETYPE_RC4_HMAC_NT = 0x00000017,
    KERB_ETYPE_RC4_MD4     = 0xffffff80,
}

alias LSA_AUTH_INFORMATION_AUTH_TYPE = uint;
enum : uint
{
    TRUST_AUTH_TYPE_NONE    = 0x00000000,
    TRUST_AUTH_TYPE_NT4OWF  = 0x00000001,
    TRUST_AUTH_TYPE_CLEAR   = 0x00000002,
    TRUST_AUTH_TYPE_VERSION = 0x00000003,
}

alias SECPKG_PACKAGE_CHANGE_TYPE = uint;
enum : uint
{
    SECPKG_PACKAGE_CHANGE_LOAD   = 0x00000000,
    SECPKG_PACKAGE_CHANGE_UNLOAD = 0x00000001,
    SECPKG_PACKAGE_CHANGE_SELECT = 0x00000002,
}

alias TRUSTED_DOMAIN_TRUST_ATTRIBUTES = uint;
enum : uint
{
    TRUST_ATTRIBUTE_NON_TRANSITIVE     = 0x00000001,
    TRUST_ATTRIBUTE_UPLEVEL_ONLY       = 0x00000002,
    TRUST_ATTRIBUTE_FILTER_SIDS        = 0x00000004,
    TRUST_ATTRIBUTE_FOREST_TRANSITIVE  = 0x00000008,
    TRUST_ATTRIBUTE_CROSS_ORGANIZATION = 0x00000010,
    TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL  = 0x00000040,
    TRUST_ATTRIBUTE_WITHIN_FOREST      = 0x00000020,
}

alias ISC_REQ_HIGH_FLAGS = ulong;
enum : ulong
{
    ISC_REQ_MESSAGES                 = 0x0000000100000000,
    ISC_REQ_DEFERRED_CRED_VALIDATION = 0x0000000200000000,
    ISC_REQ_NO_POST_HANDSHAKE_AUTH   = 0x0000000400000000,
}

alias ISC_REQ_FLAGS = uint;
enum : uint
{
    ISC_REQ_DELEGATE               = 0x00000001,
    ISC_REQ_MUTUAL_AUTH            = 0x00000002,
    ISC_REQ_REPLAY_DETECT          = 0x00000004,
    ISC_REQ_SEQUENCE_DETECT        = 0x00000008,
    ISC_REQ_CONFIDENTIALITY        = 0x00000010,
    ISC_REQ_USE_SESSION_KEY        = 0x00000020,
    ISC_REQ_PROMPT_FOR_CREDS       = 0x00000040,
    ISC_REQ_USE_SUPPLIED_CREDS     = 0x00000080,
    ISC_REQ_ALLOCATE_MEMORY        = 0x00000100,
    ISC_REQ_USE_DCE_STYLE          = 0x00000200,
    ISC_REQ_DATAGRAM               = 0x00000400,
    ISC_REQ_CONNECTION             = 0x00000800,
    ISC_REQ_CALL_LEVEL             = 0x00001000,
    ISC_REQ_FRAGMENT_SUPPLIED      = 0x00002000,
    ISC_REQ_EXTENDED_ERROR         = 0x00004000,
    ISC_REQ_STREAM                 = 0x00008000,
    ISC_REQ_INTEGRITY              = 0x00010000,
    ISC_REQ_IDENTIFY               = 0x00020000,
    ISC_REQ_NULL_SESSION           = 0x00040000,
    ISC_REQ_MANUAL_CRED_VALIDATION = 0x00080000,
    ISC_REQ_RESERVED1              = 0x00100000,
    ISC_REQ_FRAGMENT_TO_FIT        = 0x00200000,
    ISC_REQ_FORWARD_CREDENTIALS    = 0x00400000,
    ISC_REQ_NO_INTEGRITY           = 0x00800000,
    ISC_REQ_USE_HTTP_STYLE         = 0x01000000,
    ISC_REQ_UNVERIFIED_TARGET_NAME = 0x20000000,
    ISC_REQ_CONFIDENTIALITY_ONLY   = 0x40000000,
}

alias ASC_REQ_HIGH_FLAGS = ulong;
enum : ulong
{
    ASC_REQ_MESSAGES = 0x0000000100000000,
}

alias ASC_REQ_FLAGS = uint;
enum : uint
{
    ASC_REQ_DELEGATE               = 0x00000001,
    ASC_REQ_MUTUAL_AUTH            = 0x00000002,
    ASC_REQ_REPLAY_DETECT          = 0x00000004,
    ASC_REQ_SEQUENCE_DETECT        = 0x00000008,
    ASC_REQ_CONFIDENTIALITY        = 0x00000010,
    ASC_REQ_USE_SESSION_KEY        = 0x00000020,
    ASC_REQ_SESSION_TICKET         = 0x00000040,
    ASC_REQ_ALLOCATE_MEMORY        = 0x00000100,
    ASC_REQ_USE_DCE_STYLE          = 0x00000200,
    ASC_REQ_DATAGRAM               = 0x00000400,
    ASC_REQ_CONNECTION             = 0x00000800,
    ASC_REQ_CALL_LEVEL             = 0x00001000,
    ASC_REQ_FRAGMENT_SUPPLIED      = 0x00002000,
    ASC_REQ_EXTENDED_ERROR         = 0x00008000,
    ASC_REQ_STREAM                 = 0x00010000,
    ASC_REQ_INTEGRITY              = 0x00020000,
    ASC_REQ_LICENSING              = 0x00040000,
    ASC_REQ_IDENTIFY               = 0x00080000,
    ASC_REQ_ALLOW_NULL_SESSION     = 0x00100000,
    ASC_REQ_ALLOW_NON_USER_LOGONS  = 0x00200000,
    ASC_REQ_ALLOW_CONTEXT_REPLAY   = 0x00400000,
    ASC_REQ_FRAGMENT_TO_FIT        = 0x00800000,
    ASC_REQ_NO_TOKEN               = 0x01000000,
    ASC_REQ_PROXY_BINDINGS         = 0x04000000,
    ASC_REQ_ALLOW_MISSING_BINDINGS = 0x10000000,
}

alias LSA_HANDLE = long;
alias _HMAPPER = long;
struct LSA_UNICODE_STRING
{
    ushort Length;
    ushort MaximumLength;
    PWSTR Buffer;
}
struct LSA_STRING
{
    ushort Length;
    ushort MaximumLength;
    PSTR Buffer;
}
struct LSA_OBJECT_ATTRIBUTES
{
    uint Length;
    HANDLE RootDirectory;
    LSA_UNICODE_STRING* ObjectName;
    uint Attributes;
    void* SecurityDescriptor;
    void* SecurityQualityOfService;
}
struct LSA_TRUST_INFORMATION
{
    LSA_UNICODE_STRING Name;
    PSID Sid;
}
struct LSA_REFERENCED_DOMAIN_LIST
{
    uint Entries;
    LSA_TRUST_INFORMATION* Domains;
}
struct LSA_TRANSLATED_SID2
{
    SID_NAME_USE Use;
    PSID Sid;
    int DomainIndex;
    uint Flags;
}
struct LSA_TRANSLATED_NAME
{
    SID_NAME_USE Use;
    LSA_UNICODE_STRING Name;
    int DomainIndex;
}
struct POLICY_ACCOUNT_DOMAIN_INFO
{
    LSA_UNICODE_STRING DomainName;
    PSID DomainSid;
}
struct POLICY_DNS_DOMAIN_INFO
{
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING DnsDomainName;
    LSA_UNICODE_STRING DnsForestName;
    GUID DomainGuid;
    PSID Sid;
}
alias LSA_LOOKUP_DOMAIN_INFO_CLASS = int;
enum : int
{
    AccountDomainInformation = 0x00000005,
    DnsDomainInformation     = 0x0000000c,
}

alias SECURITY_LOGON_TYPE = int;
enum : int
{
    UndefinedLogonType      = 0x00000000,
    Interactive             = 0x00000002,
    Network                 = 0x00000003,
    Batch                   = 0x00000004,
    Service                 = 0x00000005,
    Proxy                   = 0x00000006,
    Unlock                  = 0x00000007,
    NetworkCleartext        = 0x00000008,
    NewCredentials          = 0x00000009,
    RemoteInteractive       = 0x0000000a,
    CachedInteractive       = 0x0000000b,
    CachedRemoteInteractive = 0x0000000c,
    CachedUnlock            = 0x0000000d,
}

alias SE_ADT_PARAMETER_TYPE = int;
enum : int
{
    SeAdtParmTypeNone               = 0x00000000,
    SeAdtParmTypeString             = 0x00000001,
    SeAdtParmTypeFileSpec           = 0x00000002,
    SeAdtParmTypeUlong              = 0x00000003,
    SeAdtParmTypeSid                = 0x00000004,
    SeAdtParmTypeLogonId            = 0x00000005,
    SeAdtParmTypeNoLogonId          = 0x00000006,
    SeAdtParmTypeAccessMask         = 0x00000007,
    SeAdtParmTypePrivs              = 0x00000008,
    SeAdtParmTypeObjectTypes        = 0x00000009,
    SeAdtParmTypeHexUlong           = 0x0000000a,
    SeAdtParmTypePtr                = 0x0000000b,
    SeAdtParmTypeTime               = 0x0000000c,
    SeAdtParmTypeGuid               = 0x0000000d,
    SeAdtParmTypeLuid               = 0x0000000e,
    SeAdtParmTypeHexInt64           = 0x0000000f,
    SeAdtParmTypeStringList         = 0x00000010,
    SeAdtParmTypeSidList            = 0x00000011,
    SeAdtParmTypeDuration           = 0x00000012,
    SeAdtParmTypeUserAccountControl = 0x00000013,
    SeAdtParmTypeNoUac              = 0x00000014,
    SeAdtParmTypeMessage            = 0x00000015,
    SeAdtParmTypeDateTime           = 0x00000016,
    SeAdtParmTypeSockAddr           = 0x00000017,
    SeAdtParmTypeSD                 = 0x00000018,
    SeAdtParmTypeLogonHours         = 0x00000019,
    SeAdtParmTypeLogonIdNoSid       = 0x0000001a,
    SeAdtParmTypeUlongNoConv        = 0x0000001b,
    SeAdtParmTypeSockAddrNoPort     = 0x0000001c,
    SeAdtParmTypeAccessReason       = 0x0000001d,
    SeAdtParmTypeStagingReason      = 0x0000001e,
    SeAdtParmTypeResourceAttribute  = 0x0000001f,
    SeAdtParmTypeClaims             = 0x00000020,
    SeAdtParmTypeLogonIdAsSid       = 0x00000021,
    SeAdtParmTypeMultiSzString      = 0x00000022,
    SeAdtParmTypeLogonIdEx          = 0x00000023,
}

struct SE_ADT_OBJECT_TYPE
{
    GUID ObjectType;
    ushort Flags;
    ushort Level;
    uint AccessMask;
}
struct SE_ADT_PARAMETER_ARRAY_ENTRY
{
    SE_ADT_PARAMETER_TYPE Type;
    uint Length;
    ulong[2] Data;
    void* Address;
}
struct SE_ADT_ACCESS_REASON
{
    uint AccessMask;
    uint[32] AccessReasons;
    uint ObjectTypeIndex;
    uint AccessGranted;
    PSECURITY_DESCRIPTOR SecurityDescriptor;
}
struct SE_ADT_CLAIMS
{
    uint Length;
    void* Claims;
}
struct SE_ADT_PARAMETER_ARRAY
{
    uint CategoryId;
    uint AuditId;
    uint ParameterCount;
    uint Length;
    ushort FlatSubCategoryId;
    ushort Type;
    uint Flags;
    SE_ADT_PARAMETER_ARRAY_ENTRY[32] Parameters;
}
struct SE_ADT_PARAMETER_ARRAY_EX
{
    uint CategoryId;
    uint AuditId;
    uint Version;
    uint ParameterCount;
    uint Length;
    ushort FlatSubCategoryId;
    ushort Type;
    uint Flags;
    SE_ADT_PARAMETER_ARRAY_ENTRY[32] Parameters;
}
alias POLICY_AUDIT_EVENT_TYPE = int;
enum : int
{
    AuditCategorySystem                 = 0x00000000,
    AuditCategoryLogon                  = 0x00000001,
    AuditCategoryObjectAccess           = 0x00000002,
    AuditCategoryPrivilegeUse           = 0x00000003,
    AuditCategoryDetailedTracking       = 0x00000004,
    AuditCategoryPolicyChange           = 0x00000005,
    AuditCategoryAccountManagement      = 0x00000006,
    AuditCategoryDirectoryServiceAccess = 0x00000007,
    AuditCategoryAccountLogon           = 0x00000008,
}

struct LSA_TRANSLATED_SID
{
    SID_NAME_USE Use;
    uint RelativeId;
    int DomainIndex;
}
alias POLICY_LSA_SERVER_ROLE = int;
enum : int
{
    PolicyServerRoleBackup  = 0x00000002,
    PolicyServerRolePrimary = 0x00000003,
}

alias POLICY_INFORMATION_CLASS = int;
enum : int
{
    PolicyAuditLogInformation           = 0x00000001,
    PolicyAuditEventsInformation        = 0x00000002,
    PolicyPrimaryDomainInformation      = 0x00000003,
    PolicyPdAccountInformation          = 0x00000004,
    PolicyAccountDomainInformation      = 0x00000005,
    PolicyLsaServerRoleInformation      = 0x00000006,
    PolicyReplicaSourceInformation      = 0x00000007,
    PolicyDefaultQuotaInformation       = 0x00000008,
    PolicyModificationInformation       = 0x00000009,
    PolicyAuditFullSetInformation       = 0x0000000a,
    PolicyAuditFullQueryInformation     = 0x0000000b,
    PolicyDnsDomainInformation          = 0x0000000c,
    PolicyDnsDomainInformationInt       = 0x0000000d,
    PolicyLocalAccountDomainInformation = 0x0000000e,
    PolicyMachineAccountInformation     = 0x0000000f,
    PolicyLastEntry                     = 0x00000010,
}

struct POLICY_AUDIT_LOG_INFO
{
    uint AuditLogPercentFull;
    uint MaximumLogSize;
    long AuditRetentionPeriod;
    BOOLEAN AuditLogFullShutdownInProgress;
    long TimeToShutdown;
    uint NextAuditRecordId;
}
struct POLICY_AUDIT_EVENTS_INFO
{
    BOOLEAN AuditingMode;
    uint* EventAuditingOptions;
    uint MaximumAuditEventCount;
}
struct POLICY_AUDIT_SUBCATEGORIES_INFO
{
    uint MaximumSubCategoryCount;
    uint* EventAuditingOptions;
}
struct POLICY_AUDIT_CATEGORIES_INFO
{
    uint MaximumCategoryCount;
    POLICY_AUDIT_SUBCATEGORIES_INFO* SubCategoriesInfo;
}
struct POLICY_PRIMARY_DOMAIN_INFO
{
    LSA_UNICODE_STRING Name;
    PSID Sid;
}
struct POLICY_PD_ACCOUNT_INFO
{
    LSA_UNICODE_STRING Name;
}
struct POLICY_LSA_SERVER_ROLE_INFO
{
    POLICY_LSA_SERVER_ROLE LsaServerRole;
}
struct POLICY_REPLICA_SOURCE_INFO
{
    LSA_UNICODE_STRING ReplicaSource;
    LSA_UNICODE_STRING ReplicaAccountName;
}
struct POLICY_DEFAULT_QUOTA_INFO
{
    QUOTA_LIMITS QuotaLimits;
}
struct POLICY_MODIFICATION_INFO
{
    long ModifiedId;
    long DatabaseCreationTime;
}
struct POLICY_AUDIT_FULL_SET_INFO
{
    BOOLEAN ShutDownOnFull;
}
struct POLICY_AUDIT_FULL_QUERY_INFO
{
    BOOLEAN ShutDownOnFull;
    BOOLEAN LogIsFull;
}
alias POLICY_DOMAIN_INFORMATION_CLASS = int;
enum : int
{
    PolicyDomainEfsInformation            = 0x00000002,
    PolicyDomainKerberosTicketInformation = 0x00000003,
}

struct POLICY_DOMAIN_EFS_INFO
{
    uint InfoLength;
    ubyte* EfsBlob;
}
struct POLICY_DOMAIN_KERBEROS_TICKET_INFO
{
    uint AuthenticationOptions;
    long MaxServiceTicketAge;
    long MaxTicketAge;
    long MaxRenewAge;
    long MaxClockSkew;
    long Reserved;
}
struct POLICY_MACHINE_ACCT_INFO
{
    uint Rid;
    PSID Sid;
}
alias POLICY_NOTIFICATION_INFORMATION_CLASS = int;
enum : int
{
    PolicyNotifyAuditEventsInformation            = 0x00000001,
    PolicyNotifyAccountDomainInformation          = 0x00000002,
    PolicyNotifyServerRoleInformation             = 0x00000003,
    PolicyNotifyDnsDomainInformation              = 0x00000004,
    PolicyNotifyDomainEfsInformation              = 0x00000005,
    PolicyNotifyDomainKerberosTicketInformation   = 0x00000006,
    PolicyNotifyMachineAccountPasswordInformation = 0x00000007,
    PolicyNotifyGlobalSaclInformation             = 0x00000008,
    PolicyNotifyMax                               = 0x00000009,
}

alias TRUSTED_INFORMATION_CLASS = int;
enum : int
{
    TrustedDomainNameInformation            = 0x00000001,
    TrustedControllersInformation           = 0x00000002,
    TrustedPosixOffsetInformation           = 0x00000003,
    TrustedPasswordInformation              = 0x00000004,
    TrustedDomainInformationBasic           = 0x00000005,
    TrustedDomainInformationEx              = 0x00000006,
    TrustedDomainAuthInformation            = 0x00000007,
    TrustedDomainFullInformation            = 0x00000008,
    TrustedDomainAuthInformationInternal    = 0x00000009,
    TrustedDomainFullInformationInternal    = 0x0000000a,
    TrustedDomainInformationEx2Internal     = 0x0000000b,
    TrustedDomainFullInformation2Internal   = 0x0000000c,
    TrustedDomainSupportedEncryptionTypes   = 0x0000000d,
    TrustedDomainAuthInformationInternalAes = 0x0000000e,
    TrustedDomainFullInformationInternalAes = 0x0000000f,
}

struct TRUSTED_DOMAIN_NAME_INFO
{
    LSA_UNICODE_STRING Name;
}
struct TRUSTED_CONTROLLERS_INFO
{
    uint Entries;
    LSA_UNICODE_STRING* Names;
}
struct TRUSTED_POSIX_OFFSET_INFO
{
    uint Offset;
}
struct TRUSTED_PASSWORD_INFO
{
    LSA_UNICODE_STRING Password;
    LSA_UNICODE_STRING OldPassword;
}
struct TRUSTED_DOMAIN_INFORMATION_EX
{
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING FlatName;
    PSID Sid;
    TRUSTED_DOMAIN_TRUST_DIRECTION TrustDirection;
    TRUSTED_DOMAIN_TRUST_TYPE TrustType;
    TRUSTED_DOMAIN_TRUST_ATTRIBUTES TrustAttributes;
}
struct TRUSTED_DOMAIN_INFORMATION_EX2
{
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING FlatName;
    PSID Sid;
    uint TrustDirection;
    uint TrustType;
    uint TrustAttributes;
    uint ForestTrustLength;
    ubyte* ForestTrustInfo;
}
struct LSA_AUTH_INFORMATION
{
    long LastUpdateTime;
    LSA_AUTH_INFORMATION_AUTH_TYPE AuthType;
    uint AuthInfoLength;
    ubyte* AuthInfo;
}
struct TRUSTED_DOMAIN_AUTH_INFORMATION
{
    uint IncomingAuthInfos;
    LSA_AUTH_INFORMATION* IncomingAuthenticationInformation;
    LSA_AUTH_INFORMATION* IncomingPreviousAuthenticationInformation;
    uint OutgoingAuthInfos;
    LSA_AUTH_INFORMATION* OutgoingAuthenticationInformation;
    LSA_AUTH_INFORMATION* OutgoingPreviousAuthenticationInformation;
}
struct TRUSTED_DOMAIN_FULL_INFORMATION
{
    TRUSTED_DOMAIN_INFORMATION_EX Information;
    TRUSTED_POSIX_OFFSET_INFO PosixOffset;
    TRUSTED_DOMAIN_AUTH_INFORMATION AuthInformation;
}
struct TRUSTED_DOMAIN_FULL_INFORMATION2
{
    TRUSTED_DOMAIN_INFORMATION_EX2 Information;
    TRUSTED_POSIX_OFFSET_INFO PosixOffset;
    TRUSTED_DOMAIN_AUTH_INFORMATION AuthInformation;
}
struct TRUSTED_DOMAIN_SUPPORTED_ENCRYPTION_TYPES
{
    uint SupportedEncryptionTypes;
}
alias LSA_FOREST_TRUST_RECORD_TYPE = int;
enum : int
{
    ForestTrustTopLevelName   = 0x00000000,
    ForestTrustTopLevelNameEx = 0x00000001,
    ForestTrustDomainInfo     = 0x00000002,
    ForestTrustBinaryInfo     = 0x00000003,
    ForestTrustScannerInfo    = 0x00000004,
    ForestTrustRecordTypeLast = 0x00000004,
}

struct LSA_FOREST_TRUST_DOMAIN_INFO
{
    PSID Sid;
    LSA_UNICODE_STRING DnsName;
    LSA_UNICODE_STRING NetbiosName;
}
struct LSA_FOREST_TRUST_SCANNER_INFO
{
    PSID DomainSid;
    LSA_UNICODE_STRING DnsName;
    LSA_UNICODE_STRING NetbiosName;
}
struct LSA_FOREST_TRUST_BINARY_DATA
{
    uint Length;
    ubyte* Buffer;
}
struct LSA_FOREST_TRUST_RECORD
{
    uint Flags;
    LSA_FOREST_TRUST_RECORD_TYPE ForestTrustType;
    long Time;
    union ForestTrustData
    {
        LSA_UNICODE_STRING TopLevelName;
        LSA_FOREST_TRUST_DOMAIN_INFO DomainInfo;
        LSA_FOREST_TRUST_BINARY_DATA Data;
    }
}
struct LSA_FOREST_TRUST_RECORD2
{
    uint Flags;
    LSA_FOREST_TRUST_RECORD_TYPE ForestTrustType;
    long Time;
    union ForestTrustData
    {
        LSA_UNICODE_STRING TopLevelName;
        LSA_FOREST_TRUST_DOMAIN_INFO DomainInfo;
        LSA_FOREST_TRUST_BINARY_DATA BinaryData;
        LSA_FOREST_TRUST_SCANNER_INFO ScannerInfo;
    }
}
struct LSA_FOREST_TRUST_INFORMATION
{
    uint RecordCount;
    LSA_FOREST_TRUST_RECORD** Entries;
}
struct LSA_FOREST_TRUST_INFORMATION2
{
    uint RecordCount;
    LSA_FOREST_TRUST_RECORD2** Entries;
}
alias LSA_FOREST_TRUST_COLLISION_RECORD_TYPE = int;
enum : int
{
    CollisionTdo   = 0x00000000,
    CollisionXref  = 0x00000001,
    CollisionOther = 0x00000002,
}

struct LSA_FOREST_TRUST_COLLISION_RECORD
{
    uint Index;
    LSA_FOREST_TRUST_COLLISION_RECORD_TYPE Type;
    uint Flags;
    LSA_UNICODE_STRING Name;
}
struct LSA_FOREST_TRUST_COLLISION_INFORMATION
{
    uint RecordCount;
    LSA_FOREST_TRUST_COLLISION_RECORD** Entries;
}
struct LSA_ENUMERATION_INFORMATION
{
    PSID Sid;
}
struct LSA_LAST_INTER_LOGON_INFO
{
    long LastSuccessfulLogon;
    long LastFailedLogon;
    uint FailedAttemptCountSinceLastSuccessfulLogon;
}
struct SECURITY_LOGON_SESSION_DATA
{
    uint Size;
    LUID LogonId;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING LogonDomain;
    LSA_UNICODE_STRING AuthenticationPackage;
    uint LogonType;
    uint Session;
    PSID Sid;
    long LogonTime;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING DnsDomainName;
    LSA_UNICODE_STRING Upn;
    uint UserFlags;
    LSA_LAST_INTER_LOGON_INFO LastLogonInfo;
    LSA_UNICODE_STRING LogonScript;
    LSA_UNICODE_STRING ProfilePath;
    LSA_UNICODE_STRING HomeDirectory;
    LSA_UNICODE_STRING HomeDirectoryDrive;
    long LogoffTime;
    long KickOffTime;
    long PasswordLastSet;
    long PasswordCanChange;
    long PasswordMustChange;
}
struct CENTRAL_ACCESS_POLICY_ENTRY
{
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING Description;
    LSA_UNICODE_STRING ChangeId;
    uint LengthAppliesTo;
    ubyte* AppliesTo;
    uint LengthSD;
    PSECURITY_DESCRIPTOR SD;
    uint LengthStagedSD;
    PSECURITY_DESCRIPTOR StagedSD;
    uint Flags;
}
struct CENTRAL_ACCESS_POLICY
{
    PSID CAPID;
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING Description;
    LSA_UNICODE_STRING ChangeId;
    uint Flags;
    uint CAPECount;
    CENTRAL_ACCESS_POLICY_ENTRY** CAPEs;
}
alias NEGOTIATE_MESSAGES = int;
enum : int
{
    NegEnumPackagePrefixes = 0x00000000,
    NegGetCallerName       = 0x00000001,
    NegTransferCredentials = 0x00000002,
    NegMsgReserved1        = 0x00000003,
    NegCallPackageMax      = 0x00000004,
}

struct NEGOTIATE_PACKAGE_PREFIX
{
    ulong PackageId;
    void* PackageDataA;
    void* PackageDataW;
    ulong PrefixLen;
    ubyte[32] Prefix;
}
struct NEGOTIATE_PACKAGE_PREFIXES
{
    uint MessageType;
    uint PrefixCount;
    uint Offset;
    uint Pad;
}
struct NEGOTIATE_CALLER_NAME_REQUEST
{
    uint MessageType;
    LUID LogonId;
}
struct NEGOTIATE_CALLER_NAME_RESPONSE
{
    uint MessageType;
    PWSTR CallerName;
}
struct DOMAIN_PASSWORD_INFORMATION
{
    ushort MinPasswordLength;
    ushort PasswordHistoryLength;
    DOMAIN_PASSWORD_PROPERTIES PasswordProperties;
    long MaxPasswordAge;
    long MinPasswordAge;
}
alias PSAM_PASSWORD_NOTIFICATION_ROUTINE = NTSTATUS function(LSA_UNICODE_STRING*, uint, LSA_UNICODE_STRING*);
alias PSAM_INIT_NOTIFICATION_ROUTINE = BOOLEAN function();
alias PSAM_PASSWORD_FILTER_ROUTINE = BOOLEAN function(LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, BOOLEAN);
alias MSV1_0_LOGON_SUBMIT_TYPE = int;
enum : int
{
    MsV1_0InteractiveLogon       = 0x00000002,
    MsV1_0Lm20Logon              = 0x00000003,
    MsV1_0NetworkLogon           = 0x00000004,
    MsV1_0SubAuthLogon           = 0x00000005,
    MsV1_0WorkstationUnlockLogon = 0x00000007,
    MsV1_0S4ULogon               = 0x0000000c,
    MsV1_0VirtualLogon           = 0x00000052,
    MsV1_0NoElevationLogon       = 0x00000053,
    MsV1_0LuidLogon              = 0x00000054,
}

alias MSV1_0_PROFILE_BUFFER_TYPE = int;
enum : int
{
    MsV1_0InteractiveProfile = 0x00000002,
    MsV1_0Lm20LogonProfile   = 0x00000003,
    MsV1_0SmartCardProfile   = 0x00000004,
}

struct MSV1_0_INTERACTIVE_LOGON
{
    MSV1_0_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING LogonDomainName;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Password;
}
struct MSV1_0_INTERACTIVE_PROFILE
{
    MSV1_0_PROFILE_BUFFER_TYPE MessageType;
    ushort LogonCount;
    ushort BadPasswordCount;
    long LogonTime;
    long LogoffTime;
    long KickOffTime;
    long PasswordLastSet;
    long PasswordCanChange;
    long PasswordMustChange;
    LSA_UNICODE_STRING LogonScript;
    LSA_UNICODE_STRING HomeDirectory;
    LSA_UNICODE_STRING FullName;
    LSA_UNICODE_STRING ProfilePath;
    LSA_UNICODE_STRING HomeDirectoryDrive;
    LSA_UNICODE_STRING LogonServer;
    uint UserFlags;
}
struct MSV1_0_LM20_LOGON
{
    MSV1_0_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING LogonDomainName;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Workstation;
    ubyte[8] ChallengeToClient;
    LSA_STRING CaseSensitiveChallengeResponse;
    LSA_STRING CaseInsensitiveChallengeResponse;
    uint ParameterControl;
}
struct MSV1_0_SUBAUTH_LOGON
{
    MSV1_0_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING LogonDomainName;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Workstation;
    ubyte[8] ChallengeToClient;
    LSA_STRING AuthenticationInfo1;
    LSA_STRING AuthenticationInfo2;
    MSV_SUBAUTH_LOGON_PARAMETER_CONTROL ParameterControl;
    uint SubAuthPackageId;
}
struct MSV1_0_S4U_LOGON
{
    MSV1_0_LOGON_SUBMIT_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING UserPrincipalName;
    LSA_UNICODE_STRING DomainName;
}
struct MSV1_0_LM20_LOGON_PROFILE
{
    MSV1_0_PROFILE_BUFFER_TYPE MessageType;
    long KickOffTime;
    long LogoffTime;
    MSV_SUB_AUTHENTICATION_FILTER UserFlags;
    ubyte[16] UserSessionKey;
    LSA_UNICODE_STRING LogonDomainName;
    ubyte[8] LanmanSessionKey;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING UserParameters;
}
alias MSV1_0_CREDENTIAL_KEY_TYPE = int;
enum : int
{
    InvalidCredKey            = 0x00000000,
    DeprecatedIUMCredKey      = 0x00000001,
    DomainUserCredKey         = 0x00000002,
    LocalUserCredKey          = 0x00000003,
    ExternallySuppliedCredKey = 0x00000004,
}

struct MSV1_0_CREDENTIAL_KEY
{
    ubyte[20] Data;
}
struct MSV1_0_SUPPLEMENTAL_CREDENTIAL
{
    uint Version;
    MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS Flags;
    ubyte[16] LmPassword;
    ubyte[16] NtPassword;
}
struct MSV1_0_SUPPLEMENTAL_CREDENTIAL_V2
{
    uint Version;
    uint Flags;
    ubyte[16] NtPassword;
    MSV1_0_CREDENTIAL_KEY CredentialKey;
}
struct MSV1_0_SUPPLEMENTAL_CREDENTIAL_V3
{
    uint Version;
    uint Flags;
    MSV1_0_CREDENTIAL_KEY_TYPE CredentialKeyType;
    ubyte[16] NtPassword;
    MSV1_0_CREDENTIAL_KEY CredentialKey;
    ubyte[20] ShaPassword;
}
struct MSV1_0_IUM_SUPPLEMENTAL_CREDENTIAL
{
    uint Version;
    uint EncryptedCredsSize;
    ubyte[1] EncryptedCreds;
}
struct MSV1_0_REMOTE_SUPPLEMENTAL_CREDENTIAL
{
    align (1):
    uint Version;
    uint Flags;
    MSV1_0_CREDENTIAL_KEY CredentialKey;
    MSV1_0_CREDENTIAL_KEY_TYPE CredentialKeyType;
    uint EncryptedCredsSize;
    ubyte[1] EncryptedCreds;
}
struct MSV1_0_NTLM3_RESPONSE
{
    ubyte[16] Response;
    ubyte RespType;
    ubyte HiRespType;
    ushort Flags;
    uint MsgWord;
    ulong TimeStamp;
    ubyte[8] ChallengeFromClient;
    uint AvPairsOff;
    ubyte[1] Buffer;
}
alias MSV1_0_AVID = int;
enum : int
{
    MsvAvEOL             = 0x00000000,
    MsvAvNbComputerName  = 0x00000001,
    MsvAvNbDomainName    = 0x00000002,
    MsvAvDnsComputerName = 0x00000003,
    MsvAvDnsDomainName   = 0x00000004,
    MsvAvDnsTreeName     = 0x00000005,
    MsvAvFlags           = 0x00000006,
    MsvAvTimestamp       = 0x00000007,
    MsvAvRestrictions    = 0x00000008,
    MsvAvTargetName      = 0x00000009,
    MsvAvChannelBindings = 0x0000000a,
}

struct MSV1_0_AV_PAIR
{
    ushort AvId;
    ushort AvLen;
}
alias MSV1_0_PROTOCOL_MESSAGE_TYPE = int;
enum : int
{
    MsV1_0Lm20ChallengeRequest     = 0x00000000,
    MsV1_0Lm20GetChallengeResponse = 0x00000001,
    MsV1_0EnumerateUsers           = 0x00000002,
    MsV1_0GetUserInfo              = 0x00000003,
    MsV1_0ReLogonUsers             = 0x00000004,
    MsV1_0ChangePassword           = 0x00000005,
    MsV1_0ChangeCachedPassword     = 0x00000006,
    MsV1_0GenericPassthrough       = 0x00000007,
    MsV1_0CacheLogon               = 0x00000008,
    MsV1_0SubAuth                  = 0x00000009,
    MsV1_0DeriveCredential         = 0x0000000a,
    MsV1_0CacheLookup              = 0x0000000b,
    MsV1_0SetProcessOption         = 0x0000000c,
    MsV1_0ConfigLocalAliases       = 0x0000000d,
    MsV1_0ClearCachedCredentials   = 0x0000000e,
    MsV1_0LookupToken              = 0x0000000f,
    MsV1_0ValidateAuth             = 0x00000010,
    MsV1_0CacheLookupEx            = 0x00000011,
    MsV1_0GetCredentialKey         = 0x00000012,
    MsV1_0SetThreadOption          = 0x00000013,
    MsV1_0DecryptDpapiMasterKey    = 0x00000014,
    MsV1_0GetStrongCredentialKey   = 0x00000015,
    MsV1_0TransferCred             = 0x00000016,
    MsV1_0ProvisionTbal            = 0x00000017,
    MsV1_0DeleteTbalSecrets        = 0x00000018,
}

struct MSV1_0_CHANGEPASSWORD_REQUEST
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING AccountName;
    LSA_UNICODE_STRING OldPassword;
    LSA_UNICODE_STRING NewPassword;
    BOOLEAN Impersonating;
}
struct MSV1_0_CHANGEPASSWORD_RESPONSE
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    BOOLEAN PasswordInfoValid;
    DOMAIN_PASSWORD_INFORMATION DomainPasswordInfo;
}
struct MSV1_0_PASSTHROUGH_REQUEST
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING PackageName;
    uint DataLength;
    ubyte* LogonData;
    uint Pad;
}
struct MSV1_0_PASSTHROUGH_RESPONSE
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Pad;
    uint DataLength;
    ubyte* ValidationData;
}
struct MSV1_0_SUBAUTH_REQUEST
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    uint SubAuthPackageId;
    uint SubAuthInfoLength;
    ubyte* SubAuthSubmitBuffer;
}
struct MSV1_0_SUBAUTH_RESPONSE
{
    MSV1_0_PROTOCOL_MESSAGE_TYPE MessageType;
    uint SubAuthInfoLength;
    ubyte* SubAuthReturnBuffer;
}
alias KERB_LOGON_SUBMIT_TYPE = int;
enum : int
{
    KerbInteractiveLogon       = 0x00000002,
    KerbSmartCardLogon         = 0x00000006,
    KerbWorkstationUnlockLogon = 0x00000007,
    KerbSmartCardUnlockLogon   = 0x00000008,
    KerbProxyLogon             = 0x00000009,
    KerbTicketLogon            = 0x0000000a,
    KerbTicketUnlockLogon      = 0x0000000b,
    KerbS4ULogon               = 0x0000000c,
    KerbCertificateLogon       = 0x0000000d,
    KerbCertificateS4ULogon    = 0x0000000e,
    KerbCertificateUnlockLogon = 0x0000000f,
    KerbNoElevationLogon       = 0x00000053,
    KerbLuidLogon              = 0x00000054,
}

struct KERB_INTERACTIVE_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING LogonDomainName;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Password;
}
struct KERB_INTERACTIVE_UNLOCK_LOGON
{
    KERB_INTERACTIVE_LOGON Logon;
    LUID LogonId;
}
struct KERB_SMART_CARD_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING Pin;
    uint CspDataLength;
    ubyte* CspData;
}
struct KERB_SMART_CARD_UNLOCK_LOGON
{
    KERB_SMART_CARD_LOGON Logon;
    LUID LogonId;
}
struct KERB_CERTIFICATE_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Pin;
    uint Flags;
    uint CspDataLength;
    ubyte* CspData;
}
struct KERB_CERTIFICATE_UNLOCK_LOGON
{
    KERB_CERTIFICATE_LOGON Logon;
    LUID LogonId;
}
struct KERB_CERTIFICATE_S4U_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING UserPrincipalName;
    LSA_UNICODE_STRING DomainName;
    uint CertificateLength;
    ubyte* Certificate;
}
struct KERB_TICKET_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    uint Flags;
    uint ServiceTicketLength;
    uint TicketGrantingTicketLength;
    ubyte* ServiceTicket;
    ubyte* TicketGrantingTicket;
}
struct KERB_TICKET_UNLOCK_LOGON
{
    KERB_TICKET_LOGON Logon;
    LUID LogonId;
}
struct KERB_S4U_LOGON
{
    KERB_LOGON_SUBMIT_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING ClientUpn;
    LSA_UNICODE_STRING ClientRealm;
}
alias KERB_PROFILE_BUFFER_TYPE = int;
enum : int
{
    KerbInteractiveProfile = 0x00000002,
    KerbSmartCardProfile   = 0x00000004,
    KerbTicketProfile      = 0x00000006,
}

struct KERB_INTERACTIVE_PROFILE
{
    KERB_PROFILE_BUFFER_TYPE MessageType;
    ushort LogonCount;
    ushort BadPasswordCount;
    long LogonTime;
    long LogoffTime;
    long KickOffTime;
    long PasswordLastSet;
    long PasswordCanChange;
    long PasswordMustChange;
    LSA_UNICODE_STRING LogonScript;
    LSA_UNICODE_STRING HomeDirectory;
    LSA_UNICODE_STRING FullName;
    LSA_UNICODE_STRING ProfilePath;
    LSA_UNICODE_STRING HomeDirectoryDrive;
    LSA_UNICODE_STRING LogonServer;
    uint UserFlags;
}
struct KERB_SMART_CARD_PROFILE
{
    KERB_INTERACTIVE_PROFILE Profile;
    uint CertificateSize;
    ubyte* CertificateData;
}
struct KERB_CRYPTO_KEY
{
    KERB_CRYPTO_KEY_TYPE KeyType;
    uint Length;
    ubyte* Value;
}
struct KERB_CRYPTO_KEY32
{
    int KeyType;
    uint Length;
    uint Offset;
}
struct KERB_TICKET_PROFILE
{
    KERB_INTERACTIVE_PROFILE Profile;
    KERB_CRYPTO_KEY SessionKey;
}
alias KERB_PROTOCOL_MESSAGE_TYPE = int;
enum : int
{
    KerbDebugRequestMessage                 = 0x00000000,
    KerbQueryTicketCacheMessage             = 0x00000001,
    KerbChangeMachinePasswordMessage        = 0x00000002,
    KerbVerifyPacMessage                    = 0x00000003,
    KerbRetrieveTicketMessage               = 0x00000004,
    KerbUpdateAddressesMessage              = 0x00000005,
    KerbPurgeTicketCacheMessage             = 0x00000006,
    KerbChangePasswordMessage               = 0x00000007,
    KerbRetrieveEncodedTicketMessage        = 0x00000008,
    KerbDecryptDataMessage                  = 0x00000009,
    KerbAddBindingCacheEntryMessage         = 0x0000000a,
    KerbSetPasswordMessage                  = 0x0000000b,
    KerbSetPasswordExMessage                = 0x0000000c,
    KerbVerifyCredentialsMessage            = 0x0000000d,
    KerbQueryTicketCacheExMessage           = 0x0000000e,
    KerbPurgeTicketCacheExMessage           = 0x0000000f,
    KerbRefreshSmartcardCredentialsMessage  = 0x00000010,
    KerbAddExtraCredentialsMessage          = 0x00000011,
    KerbQuerySupplementalCredentialsMessage = 0x00000012,
    KerbTransferCredentialsMessage          = 0x00000013,
    KerbQueryTicketCacheEx2Message          = 0x00000014,
    KerbSubmitTicketMessage                 = 0x00000015,
    KerbAddExtraCredentialsExMessage        = 0x00000016,
    KerbQueryKdcProxyCacheMessage           = 0x00000017,
    KerbPurgeKdcProxyCacheMessage           = 0x00000018,
    KerbQueryTicketCacheEx3Message          = 0x00000019,
    KerbCleanupMachinePkinitCredsMessage    = 0x0000001a,
    KerbAddBindingCacheEntryExMessage       = 0x0000001b,
    KerbQueryBindingCacheMessage            = 0x0000001c,
    KerbPurgeBindingCacheMessage            = 0x0000001d,
    KerbPinKdcMessage                       = 0x0000001e,
    KerbUnpinAllKdcsMessage                 = 0x0000001f,
    KerbQueryDomainExtendedPoliciesMessage  = 0x00000020,
    KerbQueryS4U2ProxyCacheMessage          = 0x00000021,
    KerbRetrieveKeyTabMessage               = 0x00000022,
    KerbRefreshPolicyMessage                = 0x00000023,
    KerbPrintCloudKerberosDebugMessage      = 0x00000024,
}

struct KERB_QUERY_TKT_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
}
struct KERB_TICKET_CACHE_INFO
{
    LSA_UNICODE_STRING ServerName;
    LSA_UNICODE_STRING RealmName;
    long StartTime;
    long EndTime;
    long RenewTime;
    int EncryptionType;
    KERB_TICKET_FLAGS TicketFlags;
}
struct KERB_TICKET_CACHE_INFO_EX
{
    LSA_UNICODE_STRING ClientName;
    LSA_UNICODE_STRING ClientRealm;
    LSA_UNICODE_STRING ServerName;
    LSA_UNICODE_STRING ServerRealm;
    long StartTime;
    long EndTime;
    long RenewTime;
    int EncryptionType;
    uint TicketFlags;
}
struct KERB_TICKET_CACHE_INFO_EX2
{
    LSA_UNICODE_STRING ClientName;
    LSA_UNICODE_STRING ClientRealm;
    LSA_UNICODE_STRING ServerName;
    LSA_UNICODE_STRING ServerRealm;
    long StartTime;
    long EndTime;
    long RenewTime;
    int EncryptionType;
    uint TicketFlags;
    uint SessionKeyType;
    uint BranchId;
}
struct KERB_TICKET_CACHE_INFO_EX3
{
    LSA_UNICODE_STRING ClientName;
    LSA_UNICODE_STRING ClientRealm;
    LSA_UNICODE_STRING ServerName;
    LSA_UNICODE_STRING ServerRealm;
    long StartTime;
    long EndTime;
    long RenewTime;
    int EncryptionType;
    uint TicketFlags;
    uint SessionKeyType;
    uint BranchId;
    uint CacheFlags;
    LSA_UNICODE_STRING KdcCalled;
}
struct KERB_QUERY_TKT_CACHE_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfTickets;
    KERB_TICKET_CACHE_INFO[1] Tickets;
}
struct KERB_QUERY_TKT_CACHE_EX_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfTickets;
    KERB_TICKET_CACHE_INFO_EX[1] Tickets;
}
struct KERB_QUERY_TKT_CACHE_EX2_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfTickets;
    KERB_TICKET_CACHE_INFO_EX2[1] Tickets;
}
struct KERB_QUERY_TKT_CACHE_EX3_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfTickets;
    KERB_TICKET_CACHE_INFO_EX3[1] Tickets;
}
struct KERB_AUTH_DATA
{
    uint Type;
    uint Length;
    ubyte* Data;
}
struct KERB_NET_ADDRESS
{
    uint Family;
    uint Length;
    PSTR Address;
}
struct KERB_NET_ADDRESSES
{
    uint Number;
    KERB_NET_ADDRESS[1] Addresses;
}
struct KERB_EXTERNAL_NAME
{
    short NameType;
    ushort NameCount;
    LSA_UNICODE_STRING[1] Names;
}
struct KERB_EXTERNAL_TICKET
{
    KERB_EXTERNAL_NAME* ServiceName;
    KERB_EXTERNAL_NAME* TargetName;
    KERB_EXTERNAL_NAME* ClientName;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING TargetDomainName;
    LSA_UNICODE_STRING AltTargetDomainName;
    KERB_CRYPTO_KEY SessionKey;
    KERB_TICKET_FLAGS TicketFlags;
    uint Flags;
    long KeyExpirationTime;
    long StartTime;
    long EndTime;
    long RenewUntil;
    long TimeSkew;
    uint EncodedTicketSize;
    ubyte* EncodedTicket;
}
struct KERB_RETRIEVE_TKT_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    LSA_UNICODE_STRING TargetName;
    uint TicketFlags;
    uint CacheOptions;
    KERB_CRYPTO_KEY_TYPE EncryptionType;
    SecHandle CredentialsHandle;
}
struct KERB_RETRIEVE_TKT_RESPONSE
{
    KERB_EXTERNAL_TICKET Ticket;
}
struct KERB_PURGE_TKT_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    LSA_UNICODE_STRING ServerName;
    LSA_UNICODE_STRING RealmName;
}
struct KERB_PURGE_TKT_CACHE_EX_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    uint Flags;
    KERB_TICKET_CACHE_INFO_EX TicketTemplate;
}
struct KERB_SUBMIT_TKT_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    uint Flags;
    KERB_CRYPTO_KEY32 Key;
    uint KerbCredSize;
    uint KerbCredOffset;
}
struct KERB_QUERY_KDC_PROXY_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    LUID LogonId;
}
struct KDC_PROXY_CACHE_ENTRY_DATA
{
    ulong SinceLastUsed;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING ProxyServerName;
    LSA_UNICODE_STRING ProxyServerVdir;
    ushort ProxyServerPort;
    LUID LogonId;
    LSA_UNICODE_STRING CredUserName;
    LSA_UNICODE_STRING CredDomainName;
    BOOLEAN GlobalCache;
}
struct KERB_QUERY_KDC_PROXY_CACHE_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfEntries;
    KDC_PROXY_CACHE_ENTRY_DATA* Entries;
}
struct KERB_PURGE_KDC_PROXY_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    LUID LogonId;
}
struct KERB_PURGE_KDC_PROXY_CACHE_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfPurged;
}
struct KERB_S4U2PROXY_CACHE_ENTRY_INFO
{
    LSA_UNICODE_STRING ServerName;
    uint Flags;
    NTSTATUS LastStatus;
    long Expiry;
}
struct KERB_S4U2PROXY_CRED
{
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING DomainName;
    uint Flags;
    NTSTATUS LastStatus;
    long Expiry;
    uint CountOfEntries;
    KERB_S4U2PROXY_CACHE_ENTRY_INFO* Entries;
}
struct KERB_QUERY_S4U2PROXY_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    LUID LogonId;
}
struct KERB_QUERY_S4U2PROXY_CACHE_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfCreds;
    KERB_S4U2PROXY_CRED* Creds;
}
struct KERB_RETRIEVE_KEY_TAB_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING Password;
}
struct KERB_RETRIEVE_KEY_TAB_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint KeyTabLength;
    ubyte* KeyTab;
}
struct KERB_REFRESH_POLICY_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
}
struct KERB_REFRESH_POLICY_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
}
struct KERB_CLOUD_KERBEROS_DEBUG_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
}
struct KERB_CLOUD_KERBEROS_DEBUG_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Version;
    uint Length;
    uint[1] Data;
}
struct KERB_CLOUD_KERBEROS_DEBUG_DATA_V0
{
    uint _bitfield0;
}
struct KERB_CLOUD_KERBEROS_DEBUG_DATA
{
    uint _bitfield0;
}
struct KERB_CHANGEPASSWORD_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING AccountName;
    LSA_UNICODE_STRING OldPassword;
    LSA_UNICODE_STRING NewPassword;
    BOOLEAN Impersonating;
}
struct KERB_SETPASSWORD_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    SecHandle CredentialsHandle;
    uint Flags;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING AccountName;
    LSA_UNICODE_STRING Password;
}
struct KERB_SETPASSWORD_EX_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    SecHandle CredentialsHandle;
    uint Flags;
    LSA_UNICODE_STRING AccountRealm;
    LSA_UNICODE_STRING AccountName;
    LSA_UNICODE_STRING Password;
    LSA_UNICODE_STRING ClientRealm;
    LSA_UNICODE_STRING ClientName;
    BOOLEAN Impersonating;
    LSA_UNICODE_STRING KdcAddress;
    uint KdcAddressType;
}
struct KERB_DECRYPT_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
    uint Flags;
    int CryptoType;
    int KeyUsage;
    KERB_CRYPTO_KEY Key;
    uint EncryptedDataSize;
    uint InitialVectorSize;
    ubyte* InitialVector;
    ubyte* EncryptedData;
}
struct KERB_DECRYPT_RESPONSE
{
    ubyte[1] DecryptedData;
}
struct KERB_ADD_BINDING_CACHE_ENTRY_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING RealmName;
    LSA_UNICODE_STRING KdcAddress;
    KERB_ADDRESS_TYPE AddressType;
}
struct KERB_REFRESH_SCCRED_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING CredentialBlob;
    LUID LogonId;
    uint Flags;
}
struct KERB_ADD_CREDENTIALS_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING Password;
    LUID LogonId;
    KERB_REQUEST_FLAGS Flags;
}
struct KERB_ADD_CREDENTIALS_REQUEST_EX
{
    KERB_ADD_CREDENTIALS_REQUEST Credentials;
    uint PrincipalNameCount;
    LSA_UNICODE_STRING[1] PrincipalNames;
}
struct KERB_TRANSFER_CRED_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID OriginLogonId;
    LUID DestinationLogonId;
    uint Flags;
}
struct KERB_CLEANUP_MACHINE_PKINIT_CREDS_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LUID LogonId;
}
struct KERB_BINDING_CACHE_ENTRY_DATA
{
    ulong DiscoveryTime;
    LSA_UNICODE_STRING RealmName;
    LSA_UNICODE_STRING KdcAddress;
    KERB_ADDRESS_TYPE AddressType;
    uint Flags;
    uint DcFlags;
    uint CacheFlags;
    LSA_UNICODE_STRING KdcName;
}
struct KERB_QUERY_BINDING_CACHE_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint CountOfEntries;
    KERB_BINDING_CACHE_ENTRY_DATA* Entries;
}
struct KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    LSA_UNICODE_STRING RealmName;
    LSA_UNICODE_STRING KdcAddress;
    KERB_ADDRESS_TYPE AddressType;
    uint DcFlags;
}
struct KERB_QUERY_BINDING_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
}
struct KERB_PURGE_BINDING_CACHE_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
}
struct KERB_QUERY_DOMAIN_EXTENDED_POLICIES_REQUEST
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING DomainName;
}
struct KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE
{
    KERB_PROTOCOL_MESSAGE_TYPE MessageType;
    uint Flags;
    uint ExtendedPolicies;
    uint DsFlags;
}
alias KERB_CERTIFICATE_INFO_TYPE = int;
enum : int
{
    CertHashInfo = 0x00000001,
}

struct KERB_CERTIFICATE_HASHINFO
{
    ushort StoreNameLength;
    ushort HashLength;
}
struct KERB_CERTIFICATE_INFO
{
    uint CertInfoSize;
    uint InfoType;
}
struct POLICY_AUDIT_SID_ARRAY
{
    uint UsersCount;
    PSID* UserSidArray;
}
struct AUDIT_POLICY_INFORMATION
{
    GUID AuditSubCategoryGuid;
    uint AuditingInformation;
    GUID AuditCategoryGuid;
}
struct PKU2U_CERT_BLOB
{
    uint CertOffset;
    ushort CertLength;
}
struct PKU2U_CREDUI_CONTEXT
{
    ulong Version;
    ushort cbHeaderLength;
    uint cbStructureLength;
    ushort CertArrayCount;
    uint CertArrayOffset;
}
alias PKU2U_LOGON_SUBMIT_TYPE = int;
enum : int
{
    Pku2uCertificateS4ULogon = 0x0000000e,
}

struct PKU2U_CERTIFICATE_S4U_LOGON
{
    PKU2U_LOGON_SUBMIT_TYPE MessageType;
    uint Flags;
    LSA_UNICODE_STRING UserPrincipalName;
    LSA_UNICODE_STRING DomainName;
    uint CertificateLength;
    ubyte* Certificate;
}
struct SECURITY_STRING
{
    ushort Length;
    ushort MaximumLength;
    ushort* Buffer;
}
struct SecPkgInfoW
{
    uint fCapabilities;
    ushort wVersion;
    ushort wRPCID;
    uint cbMaxToken;
    ushort* Name;
    ushort* Comment;
}
struct SecPkgInfoA
{
    uint fCapabilities;
    ushort wVersion;
    ushort wRPCID;
    uint cbMaxToken;
    byte* Name;
    byte* Comment;
}
struct SecBuffer
{
    uint cbBuffer;
    uint BufferType;
    void* pvBuffer;
}
struct SecBufferDesc
{
    uint ulVersion;
    uint cBuffers;
    SecBuffer* pBuffers;
}
struct SEC_NEGOTIATION_INFO
{
    uint Size;
    uint NameLength;
    ushort* Name;
    void* Reserved;
}
struct SEC_CHANNEL_BINDINGS
{
    uint dwInitiatorAddrType;
    uint cbInitiatorLength;
    uint dwInitiatorOffset;
    uint dwAcceptorAddrType;
    uint cbAcceptorLength;
    uint dwAcceptorOffset;
    uint cbApplicationDataLength;
    uint dwApplicationDataOffset;
}
alias SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT = int;
enum : int
{
    SecApplicationProtocolNegotiationExt_None = 0x00000000,
    SecApplicationProtocolNegotiationExt_NPN  = 0x00000001,
    SecApplicationProtocolNegotiationExt_ALPN = 0x00000002,
}

struct SEC_APPLICATION_PROTOCOL_LIST
{
    SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT ProtoNegoExt;
    ushort ProtocolListSize;
    ubyte[1] ProtocolList;
}
struct SEC_APPLICATION_PROTOCOLS
{
    uint ProtocolListsSize;
    SEC_APPLICATION_PROTOCOL_LIST[1] ProtocolLists;
}
struct SEC_SRTP_PROTECTION_PROFILES
{
    ushort ProfilesSize;
    ushort[1] ProfilesList;
}
struct SEC_SRTP_MASTER_KEY_IDENTIFIER
{
    ubyte MasterKeyIdentifierSize;
    ubyte[1] MasterKeyIdentifier;
}
struct SEC_TOKEN_BINDING
{
    ubyte MajorVersion;
    ubyte MinorVersion;
    ushort KeyParametersSize;
    ubyte[1] KeyParameters;
}
struct SEC_PRESHAREDKEY
{
    ushort KeySize;
    ubyte[1] Key;
}
struct SEC_PRESHAREDKEY_IDENTITY
{
    ushort KeyIdentitySize;
    ubyte[1] KeyIdentity;
}
struct SEC_DTLS_MTU
{
    ushort PathMTU;
}
struct SEC_FLAGS
{
    ulong Flags;
}
struct SEC_CERTIFICATE_REQUEST_CONTEXT
{
    ubyte cbCertificateRequestContext;
    ubyte[1] rgCertificateRequestContext;
}
alias SEC_TRAFFIC_SECRET_TYPE = int;
enum : int
{
    SecTrafficSecret_None   = 0x00000000,
    SecTrafficSecret_Client = 0x00000001,
    SecTrafficSecret_Server = 0x00000002,
}

struct SEC_TRAFFIC_SECRETS
{
    wchar[64] SymmetricAlgId;
    wchar[64] ChainingMode;
    wchar[64] HashAlgId;
    ushort KeySize;
    ushort IvSize;
    ushort MsgSequenceStart;
    ushort MsgSequenceEnd;
    SEC_TRAFFIC_SECRET_TYPE TrafficSecretType;
    ushort TrafficSecretSize;
    ubyte[1] TrafficSecret;
}
struct SecPkgCredentials_NamesW
{
    ushort* sUserName;
}
struct SecPkgCredentials_NamesA
{
    byte* sUserName;
}
struct SecPkgCredentials_SSIProviderW
{
    ushort* sProviderName;
    uint ProviderInfoLength;
    PSTR ProviderInfo;
}
struct SecPkgCredentials_SSIProviderA
{
    byte* sProviderName;
    uint ProviderInfoLength;
    PSTR ProviderInfo;
}
struct SecPkgCredentials_KdcProxySettingsW
{
    uint Version;
    uint Flags;
    ushort ProxyServerOffset;
    ushort ProxyServerLength;
    ushort ClientTlsCredOffset;
    ushort ClientTlsCredLength;
}
struct SecPkgCredentials_Cert
{
    uint EncodedCertSize;
    ubyte* EncodedCert;
}
struct SecPkgContext_SubjectAttributes
{
    void* AttributeInfo;
}
alias SECPKG_CRED_CLASS = int;
enum : int
{
    SecPkgCredClass_None              = 0x00000000,
    SecPkgCredClass_Ephemeral         = 0x0000000a,
    SecPkgCredClass_PersistedGeneric  = 0x00000014,
    SecPkgCredClass_PersistedSpecific = 0x0000001e,
    SecPkgCredClass_Explicit          = 0x00000028,
}

struct SecPkgContext_CredInfo
{
    SECPKG_CRED_CLASS CredClass;
    uint IsPromptingNeeded;
}
struct SecPkgContext_NegoPackageInfo
{
    uint PackageMask;
}
struct SecPkgContext_NegoStatus
{
    uint LastStatus;
}
struct SecPkgContext_Sizes
{
    uint cbMaxToken;
    uint cbMaxSignature;
    uint cbBlockSize;
    uint cbSecurityTrailer;
}
struct SecPkgContext_StreamSizes
{
    uint cbHeader;
    uint cbTrailer;
    uint cbMaximumMessage;
    uint cBuffers;
    uint cbBlockSize;
}
struct SecPkgContext_NamesW
{
    ushort* sUserName;
}
alias SECPKG_ATTR_LCT_STATUS = int;
enum : int
{
    SecPkgAttrLastClientTokenYes   = 0x00000000,
    SecPkgAttrLastClientTokenNo    = 0x00000001,
    SecPkgAttrLastClientTokenMaybe = 0x00000002,
}

struct SecPkgContext_LastClientTokenStatus
{
    SECPKG_ATTR_LCT_STATUS LastClientTokenStatus;
}
struct SecPkgContext_NamesA
{
    byte* sUserName;
}
struct SecPkgContext_Lifespan
{
    long tsStart;
    long tsExpiry;
}
struct SecPkgContext_DceInfo
{
    uint AuthzSvc;
    void* pPac;
}
struct SecPkgContext_KeyInfoA
{
    byte* sSignatureAlgorithmName;
    byte* sEncryptAlgorithmName;
    uint KeySize;
    uint SignatureAlgorithm;
    uint EncryptAlgorithm;
}
struct SecPkgContext_KeyInfoW
{
    ushort* sSignatureAlgorithmName;
    ushort* sEncryptAlgorithmName;
    uint KeySize;
    uint SignatureAlgorithm;
    uint EncryptAlgorithm;
}
struct SecPkgContext_AuthorityA
{
    byte* sAuthorityName;
}
struct SecPkgContext_AuthorityW
{
    ushort* sAuthorityName;
}
struct SecPkgContext_ProtoInfoA
{
    byte* sProtocolName;
    uint majorVersion;
    uint minorVersion;
}
struct SecPkgContext_ProtoInfoW
{
    ushort* sProtocolName;
    uint majorVersion;
    uint minorVersion;
}
struct SecPkgContext_PasswordExpiry
{
    long tsPasswordExpires;
}
struct SecPkgContext_LogoffTime
{
    long tsLogoffTime;
}
struct SecPkgContext_SessionKey
{
    uint SessionKeyLength;
    ubyte* SessionKey;
}
struct SecPkgContext_NegoKeys
{
    uint KeyType;
    ushort KeyLength;
    ubyte* KeyValue;
    uint VerifyKeyType;
    ushort VerifyKeyLength;
    ubyte* VerifyKeyValue;
}
struct SecPkgContext_PackageInfoW
{
    SecPkgInfoW* PackageInfo;
}
struct SecPkgContext_PackageInfoA
{
    SecPkgInfoA* PackageInfo;
}
struct SecPkgContext_UserFlags
{
    uint UserFlags;
}
struct SecPkgContext_Flags
{
    uint Flags;
}
struct SecPkgContext_NegotiationInfoA
{
    SecPkgInfoA* PackageInfo;
    uint NegotiationState;
}
struct SecPkgContext_NegotiationInfoW
{
    SecPkgInfoW* PackageInfo;
    uint NegotiationState;
}
struct SecPkgContext_NativeNamesW
{
    ushort* sClientName;
    ushort* sServerName;
}
struct SecPkgContext_NativeNamesA
{
    byte* sClientName;
    byte* sServerName;
}
struct SecPkgContext_CredentialNameW
{
    uint CredentialType;
    ushort* sCredentialName;
}
struct SecPkgContext_CredentialNameA
{
    uint CredentialType;
    byte* sCredentialName;
}
struct SecPkgContext_AccessToken
{
    void* AccessToken;
}
struct SecPkgContext_TargetInformation
{
    uint MarshalledTargetInfoLength;
    ubyte* MarshalledTargetInfo;
}
struct SecPkgContext_AuthzID
{
    uint AuthzIDLength;
    PSTR AuthzID;
}
struct SecPkgContext_Target
{
    uint TargetLength;
    PSTR Target;
}
struct SecPkgContext_ClientSpecifiedTarget
{
    ushort* sTargetName;
}
struct SecPkgContext_Bindings
{
    uint BindingsLength;
    SEC_CHANNEL_BINDINGS* Bindings;
}
alias SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS = int;
enum : int
{
    SecApplicationProtocolNegotiationStatus_None               = 0x00000000,
    SecApplicationProtocolNegotiationStatus_Success            = 0x00000001,
    SecApplicationProtocolNegotiationStatus_SelectedClientOnly = 0x00000002,
}

struct SecPkgContext_ApplicationProtocol
{
    SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS ProtoNegoStatus;
    SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT ProtoNegoExt;
    ubyte ProtocolIdSize;
    ubyte[255] ProtocolId;
}
struct SecPkgContext_NegotiatedTlsExtensions
{
    uint ExtensionsCount;
    ushort* Extensions;
}
struct SECPKG_APP_MODE_INFO
{
    uint UserFunction;
    ulong Argument1;
    ulong Argument2;
    SecBuffer UserData;
    BOOLEAN ReturnToLsa;
}
alias SEC_GET_KEY_FN = void function(void*, void*, uint, void**, HRESULT*);
alias ACQUIRE_CREDENTIALS_HANDLE_FN_W = HRESULT function(ushort*, ushort*, uint, void*, void*, SEC_GET_KEY_FN, void*, SecHandle*, long*);
alias ACQUIRE_CREDENTIALS_HANDLE_FN_A = HRESULT function(byte*, byte*, uint, void*, void*, SEC_GET_KEY_FN, void*, SecHandle*, long*);
alias FREE_CREDENTIALS_HANDLE_FN = HRESULT function(SecHandle*);
alias ADD_CREDENTIALS_FN_W = HRESULT function(SecHandle*, ushort*, ushort*, uint, void*, SEC_GET_KEY_FN, void*, long*);
alias ADD_CREDENTIALS_FN_A = HRESULT function(SecHandle*, byte*, byte*, uint, void*, SEC_GET_KEY_FN, void*, long*);
alias CHANGE_PASSWORD_FN_W = HRESULT function(ushort*, ushort*, ushort*, ushort*, ushort*, BOOLEAN, uint, SecBufferDesc*);
alias CHANGE_PASSWORD_FN_A = HRESULT function(byte*, byte*, byte*, byte*, byte*, BOOLEAN, uint, SecBufferDesc*);
alias INITIALIZE_SECURITY_CONTEXT_FN_W = HRESULT function(SecHandle*, SecHandle*, ushort*, uint, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
alias INITIALIZE_SECURITY_CONTEXT_FN_A = HRESULT function(SecHandle*, SecHandle*, byte*, uint, uint, uint, SecBufferDesc*, uint, SecHandle*, SecBufferDesc*, uint*, long*);
alias ACCEPT_SECURITY_CONTEXT_FN = HRESULT function(SecHandle*, SecHandle*, SecBufferDesc*, uint, uint, SecHandle*, SecBufferDesc*, uint*, long*);
alias COMPLETE_AUTH_TOKEN_FN = HRESULT function(SecHandle*, SecBufferDesc*);
alias IMPERSONATE_SECURITY_CONTEXT_FN = HRESULT function(SecHandle*);
alias REVERT_SECURITY_CONTEXT_FN = HRESULT function(SecHandle*);
alias QUERY_SECURITY_CONTEXT_TOKEN_FN = HRESULT function(SecHandle*, void**);
alias DELETE_SECURITY_CONTEXT_FN = HRESULT function(SecHandle*);
alias APPLY_CONTROL_TOKEN_FN = HRESULT function(SecHandle*, SecBufferDesc*);
alias QUERY_CONTEXT_ATTRIBUTES_FN_W = HRESULT function(SecHandle*, uint, void*);
alias QUERY_CONTEXT_ATTRIBUTES_EX_FN_W = HRESULT function(SecHandle*, uint, void*, uint);
alias QUERY_CONTEXT_ATTRIBUTES_FN_A = HRESULT function(SecHandle*, uint, void*);
alias QUERY_CONTEXT_ATTRIBUTES_EX_FN_A = HRESULT function(SecHandle*, uint, void*, uint);
alias SET_CONTEXT_ATTRIBUTES_FN_W = HRESULT function(SecHandle*, uint, void*, uint);
alias SET_CONTEXT_ATTRIBUTES_FN_A = HRESULT function(SecHandle*, uint, void*, uint);
alias QUERY_CREDENTIALS_ATTRIBUTES_FN_W = HRESULT function(SecHandle*, uint, void*);
alias QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W = HRESULT function(SecHandle*, uint, void*, uint);
alias QUERY_CREDENTIALS_ATTRIBUTES_FN_A = HRESULT function(SecHandle*, uint, void*);
alias QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A = HRESULT function(SecHandle*, uint, void*, uint);
alias SET_CREDENTIALS_ATTRIBUTES_FN_W = HRESULT function(SecHandle*, uint, void*, uint);
alias SET_CREDENTIALS_ATTRIBUTES_FN_A = HRESULT function(SecHandle*, uint, void*, uint);
alias FREE_CONTEXT_BUFFER_FN = HRESULT function(void*);
alias MAKE_SIGNATURE_FN = HRESULT function(SecHandle*, uint, SecBufferDesc*, uint);
alias VERIFY_SIGNATURE_FN = HRESULT function(SecHandle*, SecBufferDesc*, uint, uint*);
alias ENCRYPT_MESSAGE_FN = HRESULT function(SecHandle*, uint, SecBufferDesc*, uint);
alias DECRYPT_MESSAGE_FN = HRESULT function(SecHandle*, SecBufferDesc*, uint, uint*);
alias ENUMERATE_SECURITY_PACKAGES_FN_W = HRESULT function(uint*, SecPkgInfoW**);
alias ENUMERATE_SECURITY_PACKAGES_FN_A = HRESULT function(uint*, SecPkgInfoA**);
alias QUERY_SECURITY_PACKAGE_INFO_FN_W = HRESULT function(ushort*, SecPkgInfoW**);
alias QUERY_SECURITY_PACKAGE_INFO_FN_A = HRESULT function(byte*, SecPkgInfoA**);
alias SecDelegationType = int;
enum : int
{
    SecFull      = 0x00000000,
    SecService   = 0x00000001,
    SecTree      = 0x00000002,
    SecDirectory = 0x00000003,
    SecObject    = 0x00000004,
}

alias EXPORT_SECURITY_CONTEXT_FN = HRESULT function(SecHandle*, uint, SecBuffer*, void**);
alias IMPORT_SECURITY_CONTEXT_FN_W = HRESULT function(ushort*, SecBuffer*, void*, SecHandle*);
alias IMPORT_SECURITY_CONTEXT_FN_A = HRESULT function(byte*, SecBuffer*, void*, SecHandle*);
struct SecurityFunctionTableW
{
    uint dwVersion;
    ENUMERATE_SECURITY_PACKAGES_FN_W EnumerateSecurityPackagesW;
    QUERY_CREDENTIALS_ATTRIBUTES_FN_W QueryCredentialsAttributesW;
    ACQUIRE_CREDENTIALS_HANDLE_FN_W AcquireCredentialsHandleW;
    FREE_CREDENTIALS_HANDLE_FN FreeCredentialsHandle;
    void* Reserved2;
    INITIALIZE_SECURITY_CONTEXT_FN_W InitializeSecurityContextW;
    ACCEPT_SECURITY_CONTEXT_FN AcceptSecurityContext;
    COMPLETE_AUTH_TOKEN_FN CompleteAuthToken;
    DELETE_SECURITY_CONTEXT_FN DeleteSecurityContext;
    APPLY_CONTROL_TOKEN_FN ApplyControlToken;
    QUERY_CONTEXT_ATTRIBUTES_FN_W QueryContextAttributesW;
    IMPERSONATE_SECURITY_CONTEXT_FN ImpersonateSecurityContext;
    REVERT_SECURITY_CONTEXT_FN RevertSecurityContext;
    MAKE_SIGNATURE_FN MakeSignature;
    VERIFY_SIGNATURE_FN VerifySignature;
    FREE_CONTEXT_BUFFER_FN FreeContextBuffer;
    QUERY_SECURITY_PACKAGE_INFO_FN_W QuerySecurityPackageInfoW;
    void* Reserved3;
    void* Reserved4;
    EXPORT_SECURITY_CONTEXT_FN ExportSecurityContext;
    IMPORT_SECURITY_CONTEXT_FN_W ImportSecurityContextW;
    ADD_CREDENTIALS_FN_W AddCredentialsW;
    void* Reserved8;
    QUERY_SECURITY_CONTEXT_TOKEN_FN QuerySecurityContextToken;
    ENCRYPT_MESSAGE_FN EncryptMessage;
    DECRYPT_MESSAGE_FN DecryptMessage;
    SET_CONTEXT_ATTRIBUTES_FN_W SetContextAttributesW;
    SET_CREDENTIALS_ATTRIBUTES_FN_W SetCredentialsAttributesW;
    CHANGE_PASSWORD_FN_W ChangeAccountPasswordW;
    QUERY_CONTEXT_ATTRIBUTES_EX_FN_W QueryContextAttributesExW;
    QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W QueryCredentialsAttributesExW;
}
struct SecurityFunctionTableA
{
    uint dwVersion;
    ENUMERATE_SECURITY_PACKAGES_FN_A EnumerateSecurityPackagesA;
    QUERY_CREDENTIALS_ATTRIBUTES_FN_A QueryCredentialsAttributesA;
    ACQUIRE_CREDENTIALS_HANDLE_FN_A AcquireCredentialsHandleA;
    FREE_CREDENTIALS_HANDLE_FN FreeCredentialsHandle;
    void* Reserved2;
    INITIALIZE_SECURITY_CONTEXT_FN_A InitializeSecurityContextA;
    ACCEPT_SECURITY_CONTEXT_FN AcceptSecurityContext;
    COMPLETE_AUTH_TOKEN_FN CompleteAuthToken;
    DELETE_SECURITY_CONTEXT_FN DeleteSecurityContext;
    APPLY_CONTROL_TOKEN_FN ApplyControlToken;
    QUERY_CONTEXT_ATTRIBUTES_FN_A QueryContextAttributesA;
    IMPERSONATE_SECURITY_CONTEXT_FN ImpersonateSecurityContext;
    REVERT_SECURITY_CONTEXT_FN RevertSecurityContext;
    MAKE_SIGNATURE_FN MakeSignature;
    VERIFY_SIGNATURE_FN VerifySignature;
    FREE_CONTEXT_BUFFER_FN FreeContextBuffer;
    QUERY_SECURITY_PACKAGE_INFO_FN_A QuerySecurityPackageInfoA;
    void* Reserved3;
    void* Reserved4;
    EXPORT_SECURITY_CONTEXT_FN ExportSecurityContext;
    IMPORT_SECURITY_CONTEXT_FN_A ImportSecurityContextA;
    ADD_CREDENTIALS_FN_A AddCredentialsA;
    void* Reserved8;
    QUERY_SECURITY_CONTEXT_TOKEN_FN QuerySecurityContextToken;
    ENCRYPT_MESSAGE_FN EncryptMessage;
    DECRYPT_MESSAGE_FN DecryptMessage;
    SET_CONTEXT_ATTRIBUTES_FN_A SetContextAttributesA;
    SET_CREDENTIALS_ATTRIBUTES_FN_A SetCredentialsAttributesA;
    CHANGE_PASSWORD_FN_A ChangeAccountPasswordA;
    QUERY_CONTEXT_ATTRIBUTES_EX_FN_A QueryContextAttributesExA;
    QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A QueryCredentialsAttributesExA;
}
alias INIT_SECURITY_INTERFACE_A = SecurityFunctionTableA* function();
alias INIT_SECURITY_INTERFACE_W = SecurityFunctionTableW* function();
alias SASL_AUTHZID_STATE = int;
enum : int
{
    Sasl_AuthZIDForbidden = 0x00000000,
    Sasl_AuthZIDProcessed = 0x00000001,
}

struct SEC_WINNT_AUTH_IDENTITY_EX2
{
    uint Version;
    ushort cbHeaderLength;
    uint cbStructureLength;
    uint UserOffset;
    ushort UserLength;
    uint DomainOffset;
    ushort DomainLength;
    uint PackedCredentialsOffset;
    ushort PackedCredentialsLength;
    uint Flags;
    uint PackageListOffset;
    ushort PackageListLength;
}
struct SEC_WINNT_AUTH_IDENTITY_EXW
{
    uint Version;
    uint Length;
    ushort* User;
    uint UserLength;
    ushort* Domain;
    uint DomainLength;
    ushort* Password;
    uint PasswordLength;
    uint Flags;
    ushort* PackageList;
    uint PackageListLength;
}
struct SEC_WINNT_AUTH_IDENTITY_EXA
{
    uint Version;
    uint Length;
    ubyte* User;
    uint UserLength;
    ubyte* Domain;
    uint DomainLength;
    ubyte* Password;
    uint PasswordLength;
    uint Flags;
    ubyte* PackageList;
    uint PackageListLength;
}
union SEC_WINNT_AUTH_IDENTITY_INFO
{
    SEC_WINNT_AUTH_IDENTITY_EXW AuthIdExw;
    SEC_WINNT_AUTH_IDENTITY_EXA AuthIdExa;
    SEC_WINNT_AUTH_IDENTITY_A AuthId_a;
    SEC_WINNT_AUTH_IDENTITY_W AuthId_w;
    SEC_WINNT_AUTH_IDENTITY_EX2 AuthIdEx2;
}
struct SECURITY_PACKAGE_OPTIONS
{
    uint Size;
    SECURITY_PACKAGE_OPTIONS_TYPE Type;
    uint Flags;
    uint SignatureSize;
    void* Signature;
}
alias LSA_TOKEN_INFORMATION_TYPE = int;
enum : int
{
    LsaTokenInformationNull = 0x00000000,
    LsaTokenInformationV1   = 0x00000001,
    LsaTokenInformationV2   = 0x00000002,
    LsaTokenInformationV3   = 0x00000003,
}

struct LSA_TOKEN_INFORMATION_NULL
{
    long ExpirationTime;
    TOKEN_GROUPS* Groups;
}
struct LSA_TOKEN_INFORMATION_V1
{
    long ExpirationTime;
    TOKEN_USER User;
    TOKEN_GROUPS* Groups;
    TOKEN_PRIMARY_GROUP PrimaryGroup;
    TOKEN_PRIVILEGES* Privileges;
    TOKEN_OWNER Owner;
    TOKEN_DEFAULT_DACL DefaultDacl;
}
struct LSA_TOKEN_INFORMATION_V3
{
    long ExpirationTime;
    TOKEN_USER User;
    TOKEN_GROUPS* Groups;
    TOKEN_PRIMARY_GROUP PrimaryGroup;
    TOKEN_PRIVILEGES* Privileges;
    TOKEN_OWNER Owner;
    TOKEN_DEFAULT_DACL DefaultDacl;
    TOKEN_USER_CLAIMS UserClaims;
    TOKEN_DEVICE_CLAIMS DeviceClaims;
    TOKEN_GROUPS* DeviceGroups;
}
alias PLSA_CREATE_LOGON_SESSION = NTSTATUS function(LUID*);
alias PLSA_DELETE_LOGON_SESSION = NTSTATUS function(LUID*);
alias PLSA_ADD_CREDENTIAL = NTSTATUS function(LUID*, uint, LSA_STRING*, LSA_STRING*);
alias PLSA_GET_CREDENTIALS = NTSTATUS function(LUID*, uint, uint*, BOOLEAN, LSA_STRING*, uint*, LSA_STRING*);
alias PLSA_DELETE_CREDENTIAL = NTSTATUS function(LUID*, uint, LSA_STRING*);
alias PLSA_ALLOCATE_LSA_HEAP = void* function(uint);
alias PLSA_FREE_LSA_HEAP = void function(void*);
alias PLSA_ALLOCATE_PRIVATE_HEAP = void* function(ulong);
alias PLSA_FREE_PRIVATE_HEAP = void function(void*);
alias PLSA_ALLOCATE_CLIENT_BUFFER = NTSTATUS function(void**, uint, void**);
alias PLSA_FREE_CLIENT_BUFFER = NTSTATUS function(void**, void*);
alias PLSA_COPY_TO_CLIENT_BUFFER = NTSTATUS function(void**, uint, void*, void*);
alias PLSA_COPY_FROM_CLIENT_BUFFER = NTSTATUS function(void**, uint, void*, void*);
struct LSA_DISPATCH_TABLE
{
    PLSA_CREATE_LOGON_SESSION CreateLogonSession;
    PLSA_DELETE_LOGON_SESSION DeleteLogonSession;
    PLSA_ADD_CREDENTIAL AddCredential;
    PLSA_GET_CREDENTIALS GetCredentials;
    PLSA_DELETE_CREDENTIAL DeleteCredential;
    PLSA_ALLOCATE_LSA_HEAP AllocateLsaHeap;
    PLSA_FREE_LSA_HEAP FreeLsaHeap;
    PLSA_ALLOCATE_CLIENT_BUFFER AllocateClientBuffer;
    PLSA_FREE_CLIENT_BUFFER FreeClientBuffer;
    PLSA_COPY_TO_CLIENT_BUFFER CopyToClientBuffer;
    PLSA_COPY_FROM_CLIENT_BUFFER CopyFromClientBuffer;
}
alias PLSA_AP_INITIALIZE_PACKAGE = NTSTATUS function(uint, LSA_DISPATCH_TABLE*, LSA_STRING*, LSA_STRING*, LSA_STRING**);
alias PLSA_AP_LOGON_USER = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, void**, uint*, LUID*, int*, LSA_TOKEN_INFORMATION_TYPE*, void**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**);
alias PLSA_AP_LOGON_USER_EX = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, void**, uint*, LUID*, int*, LSA_TOKEN_INFORMATION_TYPE*, void**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**);
alias PLSA_AP_CALL_PACKAGE = NTSTATUS function(void**, void*, void*, uint, void**, uint*, int*);
alias PLSA_AP_CALL_PACKAGE_PASSTHROUGH = NTSTATUS function(void**, void*, void*, uint, void**, uint*, int*);
alias PLSA_AP_LOGON_TERMINATED = void function(LUID*);
alias PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE = NTSTATUS function(LSA_UNICODE_STRING*, void*, uint, uint, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, void**, uint*);
alias PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE = BOOLEAN function(LSA_UNICODE_STRING*);
alias PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE = void function(void*);
struct SAM_REGISTER_MAPPING_ELEMENT
{
    PSTR Original;
    PSTR Mapped;
    BOOLEAN Continuable;
}
struct SAM_REGISTER_MAPPING_LIST
{
    uint Count;
    SAM_REGISTER_MAPPING_ELEMENT* Elements;
}
struct SAM_REGISTER_MAPPING_TABLE
{
    uint Count;
    SAM_REGISTER_MAPPING_LIST* Lists;
}
alias PSAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE = NTSTATUS function(SAM_REGISTER_MAPPING_TABLE*);
struct SECPKG_CLIENT_INFO
{
    LUID LogonId;
    uint ProcessID;
    uint ThreadID;
    BOOLEAN HasTcbPrivilege;
    BOOLEAN Impersonating;
    BOOLEAN Restricted;
    ubyte ClientFlags;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    HANDLE ClientToken;
}
struct SECPKG_CLIENT_INFO_EX
{
    LUID LogonId;
    uint ProcessID;
    uint ThreadID;
    BOOLEAN HasTcbPrivilege;
    BOOLEAN Impersonating;
    BOOLEAN Restricted;
    ubyte ClientFlags;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    HANDLE ClientToken;
    LUID IdentificationLogonId;
    HANDLE IdentificationToken;
}
struct SECPKG_CALL_INFO
{
    uint ProcessId;
    uint ThreadId;
    uint Attributes;
    uint CallCount;
    void* MechOid;
}
struct SECPKG_SUPPLEMENTAL_CRED
{
    LSA_UNICODE_STRING PackageName;
    uint CredentialSize;
    ubyte* Credentials;
}
struct SECPKG_BYTE_VECTOR
{
    uint ByteArrayOffset;
    ushort ByteArrayLength;
}
struct SECPKG_SHORT_VECTOR
{
    uint ShortArrayOffset;
    ushort ShortArrayCount;
}
struct SECPKG_SUPPLIED_CREDENTIAL
{
    ushort cbHeaderLength;
    ushort cbStructureLength;
    SECPKG_SHORT_VECTOR UserName;
    SECPKG_SHORT_VECTOR DomainName;
    SECPKG_BYTE_VECTOR PackedCredentials;
    uint CredFlags;
}
struct SECPKG_CREDENTIAL
{
    ulong Version;
    ushort cbHeaderLength;
    uint cbStructureLength;
    uint ClientProcess;
    uint ClientThread;
    LUID LogonId;
    HANDLE ClientToken;
    uint SessionId;
    LUID ModifiedId;
    uint fCredentials;
    uint Flags;
    SECPKG_BYTE_VECTOR PrincipalName;
    SECPKG_BYTE_VECTOR PackageList;
    SECPKG_BYTE_VECTOR MarshaledSuppliedCreds;
}
struct SECPKG_SUPPLEMENTAL_CRED_ARRAY
{
    uint CredentialCount;
    SECPKG_SUPPLEMENTAL_CRED[1] Credentials;
}
struct SECPKG_SURROGATE_LOGON_ENTRY
{
    GUID Type;
    void* Data;
}
struct SECPKG_SURROGATE_LOGON
{
    uint Version;
    LUID SurrogateLogonID;
    uint EntryCount;
    SECPKG_SURROGATE_LOGON_ENTRY* Entries;
}
alias PLSA_CALLBACK_FUNCTION = NTSTATUS function(ulong, ulong, SecBuffer*, SecBuffer*);
struct SECPKG_PRIMARY_CRED
{
    LUID LogonId;
    LSA_UNICODE_STRING DownlevelName;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING Password;
    LSA_UNICODE_STRING OldPassword;
    PSID UserSid;
    uint Flags;
    LSA_UNICODE_STRING DnsDomainName;
    LSA_UNICODE_STRING Upn;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING Spare1;
    LSA_UNICODE_STRING Spare2;
    LSA_UNICODE_STRING Spare3;
    LSA_UNICODE_STRING Spare4;
}
struct SECPKG_PRIMARY_CRED_EX
{
    LUID LogonId;
    LSA_UNICODE_STRING DownlevelName;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING Password;
    LSA_UNICODE_STRING OldPassword;
    PSID UserSid;
    uint Flags;
    LSA_UNICODE_STRING DnsDomainName;
    LSA_UNICODE_STRING Upn;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING Spare1;
    LSA_UNICODE_STRING Spare2;
    LSA_UNICODE_STRING Spare3;
    LSA_UNICODE_STRING Spare4;
    ulong PackageId;
    LUID PrevLogonId;
    uint FlagsEx;
}
struct SECPKG_PARAMETERS
{
    uint Version;
    uint MachineState;
    uint SetupMode;
    PSID DomainSid;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING DnsDomainName;
    GUID DomainGuid;
}
alias SECPKG_EXTENDED_INFORMATION_CLASS = int;
enum : int
{
    SecpkgGssInfo         = 0x00000001,
    SecpkgContextThunks   = 0x00000002,
    SecpkgMutualAuthLevel = 0x00000003,
    SecpkgWowClientDll    = 0x00000004,
    SecpkgExtraOids       = 0x00000005,
    SecpkgMaxInfo         = 0x00000006,
    SecpkgNego2Info       = 0x00000007,
}

struct SECPKG_GSS_INFO
{
    uint EncodedIdLength;
    ubyte[4] EncodedId;
}
struct SECPKG_CONTEXT_THUNKS
{
    uint InfoLevelCount;
    uint[1] Levels;
}
struct SECPKG_MUTUAL_AUTH_LEVEL
{
    uint MutualAuthLevel;
}
struct SECPKG_WOW_CLIENT_DLL
{
    SECURITY_STRING WowClientDllPath;
}
struct SECPKG_SERIALIZED_OID
{
    uint OidLength;
    uint OidAttributes;
    ubyte[32] OidValue;
}
struct SECPKG_EXTRA_OIDS
{
    uint OidCount;
    SECPKG_SERIALIZED_OID[1] Oids;
}
struct SECPKG_NEGO2_INFO
{
    ubyte[16] AuthScheme;
    uint PackageFlags;
}
struct SECPKG_EXTENDED_INFORMATION
{
    SECPKG_EXTENDED_INFORMATION_CLASS Class;
    union Info
    {
        SECPKG_GSS_INFO GssInfo;
        SECPKG_CONTEXT_THUNKS ContextThunks;
        SECPKG_MUTUAL_AUTH_LEVEL MutualAuthLevel;
        SECPKG_WOW_CLIENT_DLL WowClientDll;
        SECPKG_EXTRA_OIDS ExtraOids;
        SECPKG_NEGO2_INFO Nego2Info;
    }
}
struct SECPKG_TARGETINFO
{
    PSID DomainSid;
    const(wchar)* ComputerName;
}
struct SECPKG_NTLM_TARGETINFO
{
    uint Flags;
    PWSTR MsvAvNbComputerName;
    PWSTR MsvAvNbDomainName;
    PWSTR MsvAvDnsComputerName;
    PWSTR MsvAvDnsDomainName;
    PWSTR MsvAvDnsTreeName;
    uint MsvAvFlags;
    FILETIME MsvAvTimestamp;
    PWSTR MsvAvTargetName;
}
struct SecPkgContext_SaslContext
{
    void* SaslContext;
}
struct SECURITY_USER_DATA
{
    SECURITY_STRING UserName;
    SECURITY_STRING LogonDomainName;
    SECURITY_STRING LogonServer;
    PSID pSid;
}
alias SECPKG_CALL_PACKAGE_MESSAGE_TYPE = int;
enum : int
{
    SecPkgCallPackageMinMessage          = 0x00000400,
    SecPkgCallPackagePinDcMessage        = 0x00000400,
    SecPkgCallPackageUnpinAllDcsMessage  = 0x00000401,
    SecPkgCallPackageTransferCredMessage = 0x00000402,
    SecPkgCallPackageMaxMessage          = 0x00000402,
}

struct SECPKG_CALL_PACKAGE_PIN_DC_REQUEST
{
    uint MessageType;
    uint Flags;
    LSA_UNICODE_STRING DomainName;
    LSA_UNICODE_STRING DcName;
    uint DcFlags;
}
struct SECPKG_CALL_PACKAGE_UNPIN_ALL_DCS_REQUEST
{
    uint MessageType;
    uint Flags;
}
struct SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST
{
    uint MessageType;
    LUID OriginLogonId;
    LUID DestinationLogonId;
    uint Flags;
}
alias PLSA_REDIRECTED_LOGON_INIT = NTSTATUS function(HANDLE, const(LSA_UNICODE_STRING)*, uint, const(LUID)*);
alias PLSA_REDIRECTED_LOGON_CALLBACK = NTSTATUS function(HANDLE, void*, uint, void**, uint*);
alias PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK = void function(HANDLE);
alias PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS = NTSTATUS function(HANDLE, ubyte**, uint*);
alias PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS = NTSTATUS function(HANDLE, SECPKG_SUPPLEMENTAL_CRED_ARRAY**);
alias PLSA_REDIRECTED_LOGON_GET_SID = NTSTATUS function(HANDLE, PSID*);
struct SECPKG_REDIRECTED_LOGON_BUFFER
{
    GUID RedirectedLogonGuid;
    HANDLE RedirectedLogonHandle;
    PLSA_REDIRECTED_LOGON_INIT Init;
    PLSA_REDIRECTED_LOGON_CALLBACK Callback;
    PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK CleanupCallback;
    PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS GetLogonCreds;
    PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS GetSupplementalCreds;
    PLSA_REDIRECTED_LOGON_GET_SID GetRedirectedLogonSid;
}
struct SECPKG_POST_LOGON_USER_INFO
{
    uint Flags;
    LUID LogonId;
    LUID LinkedLogonId;
}
alias PLSA_IMPERSONATE_CLIENT = NTSTATUS function();
alias PLSA_UNLOAD_PACKAGE = NTSTATUS function();
alias PLSA_DUPLICATE_HANDLE = NTSTATUS function(HANDLE, HANDLE*);
alias PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS = NTSTATUS function(LUID*, uint, void*, BOOLEAN);
alias PLSA_CREATE_THREAD = HANDLE function(SECURITY_ATTRIBUTES*, uint, LPTHREAD_START_ROUTINE, void*, uint, uint*);
alias PLSA_GET_CLIENT_INFO = NTSTATUS function(SECPKG_CLIENT_INFO*);
alias PLSA_GET_CLIENT_INFO_EX = NTSTATUS function(SECPKG_CLIENT_INFO_EX*, uint);
alias PLSA_REGISTER_NOTIFICATION = HANDLE function(LPTHREAD_START_ROUTINE, void*, uint, uint, uint, uint, HANDLE);
alias PLSA_CANCEL_NOTIFICATION = NTSTATUS function(HANDLE);
alias PLSA_MAP_BUFFER = NTSTATUS function(SecBuffer*, SecBuffer*);
alias PLSA_CREATE_TOKEN = NTSTATUS function(LUID*, TOKEN_SOURCE*, SECURITY_LOGON_TYPE, SECURITY_IMPERSONATION_LEVEL, LSA_TOKEN_INFORMATION_TYPE, void*, TOKEN_GROUPS*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, HANDLE*, int*);
alias SECPKG_SESSIONINFO_TYPE = int;
enum : int
{
    SecSessionPrimaryCred = 0x00000000,
}

alias PLSA_CREATE_TOKEN_EX = NTSTATUS function(LUID*, TOKEN_SOURCE*, SECURITY_LOGON_TYPE, SECURITY_IMPERSONATION_LEVEL, LSA_TOKEN_INFORMATION_TYPE, void*, TOKEN_GROUPS*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, void*, SECPKG_SESSIONINFO_TYPE, HANDLE*, int*);
alias PLSA_AUDIT_LOGON = void function(NTSTATUS, NTSTATUS, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, PSID, SECURITY_LOGON_TYPE, TOKEN_SOURCE*, LUID*);
alias PLSA_CALL_PACKAGE = NTSTATUS function(LSA_UNICODE_STRING*, void*, uint, void**, uint*, int*);
alias PLSA_CALL_PACKAGEEX = NTSTATUS function(LSA_UNICODE_STRING*, void*, void*, uint, void**, uint*, int*);
alias PLSA_CALL_PACKAGE_PASSTHROUGH = NTSTATUS function(LSA_UNICODE_STRING*, void*, void*, uint, void**, uint*, int*);
alias PLSA_GET_CALL_INFO = BOOLEAN function(SECPKG_CALL_INFO*);
alias PLSA_CREATE_SHARED_MEMORY = void* function(uint, uint);
alias PLSA_ALLOCATE_SHARED_MEMORY = void* function(void*, uint);
alias PLSA_FREE_SHARED_MEMORY = void function(void*, void*);
alias PLSA_DELETE_SHARED_MEMORY = BOOLEAN function(void*);
alias PLSA_GET_APP_MODE_INFO = NTSTATUS function(uint*, ulong*, ulong*, SecBuffer*, BOOLEAN*);
alias PLSA_SET_APP_MODE_INFO = NTSTATUS function(uint, ulong, ulong, SecBuffer*, BOOLEAN);
alias SECPKG_NAME_TYPE = int;
enum : int
{
    SecNameSamCompatible = 0x00000000,
    SecNameAlternateId   = 0x00000001,
    SecNameFlat          = 0x00000002,
    SecNameDN            = 0x00000003,
    SecNameSPN           = 0x00000004,
}

alias PLSA_OPEN_SAM_USER = NTSTATUS function(SECURITY_STRING*, SECPKG_NAME_TYPE, SECURITY_STRING*, BOOLEAN, uint, void**);
alias PLSA_GET_USER_CREDENTIALS = NTSTATUS function(void*, void**, uint*, void**, uint*);
alias PLSA_GET_USER_AUTH_DATA = NTSTATUS function(void*, ubyte**, uint*);
alias PLSA_CLOSE_SAM_USER = NTSTATUS function(void*);
alias PLSA_GET_AUTH_DATA_FOR_USER = NTSTATUS function(SECURITY_STRING*, SECPKG_NAME_TYPE, SECURITY_STRING*, ubyte**, uint*, LSA_UNICODE_STRING*);
alias PLSA_CONVERT_AUTH_DATA_TO_TOKEN = NTSTATUS function(void*, uint, SECURITY_IMPERSONATION_LEVEL, TOKEN_SOURCE*, SECURITY_LOGON_TYPE, LSA_UNICODE_STRING*, HANDLE*, LUID*, LSA_UNICODE_STRING*, int*);
alias PLSA_CRACK_SINGLE_NAME = NTSTATUS function(uint, BOOLEAN, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, uint, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, uint*);
alias PLSA_AUDIT_ACCOUNT_LOGON = NTSTATUS function(uint, BOOLEAN, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, NTSTATUS);
alias PLSA_CLIENT_CALLBACK = NTSTATUS function(PSTR, ulong, ulong, SecBuffer*, SecBuffer*);
alias PLSA_REGISTER_CALLBACK = NTSTATUS function(uint, PLSA_CALLBACK_FUNCTION);
alias PLSA_GET_EXTENDED_CALL_FLAGS = NTSTATUS function(uint*);
struct SECPKG_EVENT_PACKAGE_CHANGE
{
    SECPKG_PACKAGE_CHANGE_TYPE ChangeType;
    ulong PackageId;
    SECURITY_STRING PackageName;
}
struct SECPKG_EVENT_ROLE_CHANGE
{
    uint PreviousRole;
    uint NewRole;
}
struct SECPKG_EVENT_NOTIFY
{
    uint EventClass;
    uint Reserved;
    uint EventDataSize;
    void* EventData;
    void* PackageParameter;
}
alias PLSA_UPDATE_PRIMARY_CREDENTIALS = NTSTATUS function(SECPKG_PRIMARY_CRED*, SECPKG_SUPPLEMENTAL_CRED_ARRAY*);
alias PLSA_PROTECT_MEMORY = void function(void*, uint);
alias PLSA_OPEN_TOKEN_BY_LOGON_ID = NTSTATUS function(LUID*, HANDLE*);
alias PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN = NTSTATUS function(ubyte*, uint, void*, ubyte**, uint*);
alias CRED_FETCH = int;
enum : int
{
    CredFetchDefault = 0x00000000,
    CredFetchDPAPI   = 0x00000001,
    CredFetchForced  = 0x00000002,
}

alias PLSA_GET_SERVICE_ACCOUNT_PASSWORD = NTSTATUS function(LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, CRED_FETCH, FILETIME*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, FILETIME*);
alias PLSA_AUDIT_LOGON_EX = void function(NTSTATUS, NTSTATUS, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, PSID, SECURITY_LOGON_TYPE, SECURITY_IMPERSONATION_LEVEL, TOKEN_SOURCE*, LUID*);
alias PLSA_CHECK_PROTECTED_USER_BY_TOKEN = NTSTATUS function(HANDLE, BOOLEAN*);
alias PLSA_QUERY_CLIENT_REQUEST = NTSTATUS function(void**, uint, void**);
struct ENCRYPTED_CREDENTIALW
{
    CREDENTIALW Cred;
    uint ClearCredentialBlobSize;
}
alias CredReadFn = NTSTATUS function(LUID*, uint, PWSTR, uint, uint, ENCRYPTED_CREDENTIALW**);
alias CredReadDomainCredentialsFn = NTSTATUS function(LUID*, uint, CREDENTIAL_TARGET_INFORMATIONW*, uint, uint*, ENCRYPTED_CREDENTIALW***);
alias CredFreeCredentialsFn = void function(uint, ENCRYPTED_CREDENTIALW**);
alias CredWriteFn = NTSTATUS function(LUID*, uint, ENCRYPTED_CREDENTIALW*, uint);
alias CrediUnmarshalandDecodeStringFn = NTSTATUS function(PWSTR, ubyte**, uint*, ubyte*);
struct SEC_WINNT_AUTH_IDENTITY32
{
    uint User;
    uint UserLength;
    uint Domain;
    uint DomainLength;
    uint Password;
    uint PasswordLength;
    uint Flags;
}
struct SEC_WINNT_AUTH_IDENTITY_EX32
{
    uint Version;
    uint Length;
    uint User;
    uint UserLength;
    uint Domain;
    uint DomainLength;
    uint Password;
    uint PasswordLength;
    uint Flags;
    uint PackageList;
    uint PackageListLength;
}
struct LSA_SECPKG_FUNCTION_TABLE
{
    PLSA_CREATE_LOGON_SESSION CreateLogonSession;
    PLSA_DELETE_LOGON_SESSION DeleteLogonSession;
    PLSA_ADD_CREDENTIAL AddCredential;
    PLSA_GET_CREDENTIALS GetCredentials;
    PLSA_DELETE_CREDENTIAL DeleteCredential;
    PLSA_ALLOCATE_LSA_HEAP AllocateLsaHeap;
    PLSA_FREE_LSA_HEAP FreeLsaHeap;
    PLSA_ALLOCATE_CLIENT_BUFFER AllocateClientBuffer;
    PLSA_FREE_CLIENT_BUFFER FreeClientBuffer;
    PLSA_COPY_TO_CLIENT_BUFFER CopyToClientBuffer;
    PLSA_COPY_FROM_CLIENT_BUFFER CopyFromClientBuffer;
    PLSA_IMPERSONATE_CLIENT ImpersonateClient;
    PLSA_UNLOAD_PACKAGE UnloadPackage;
    PLSA_DUPLICATE_HANDLE DuplicateHandle;
    PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS SaveSupplementalCredentials;
    PLSA_CREATE_THREAD CreateThread;
    PLSA_GET_CLIENT_INFO GetClientInfo;
    PLSA_REGISTER_NOTIFICATION RegisterNotification;
    PLSA_CANCEL_NOTIFICATION CancelNotification;
    PLSA_MAP_BUFFER MapBuffer;
    PLSA_CREATE_TOKEN CreateToken;
    PLSA_AUDIT_LOGON AuditLogon;
    PLSA_CALL_PACKAGE CallPackage;
    PLSA_FREE_LSA_HEAP FreeReturnBuffer;
    PLSA_GET_CALL_INFO GetCallInfo;
    PLSA_CALL_PACKAGEEX CallPackageEx;
    PLSA_CREATE_SHARED_MEMORY CreateSharedMemory;
    PLSA_ALLOCATE_SHARED_MEMORY AllocateSharedMemory;
    PLSA_FREE_SHARED_MEMORY FreeSharedMemory;
    PLSA_DELETE_SHARED_MEMORY DeleteSharedMemory;
    PLSA_OPEN_SAM_USER OpenSamUser;
    PLSA_GET_USER_CREDENTIALS GetUserCredentials;
    PLSA_GET_USER_AUTH_DATA GetUserAuthData;
    PLSA_CLOSE_SAM_USER CloseSamUser;
    PLSA_CONVERT_AUTH_DATA_TO_TOKEN ConvertAuthDataToToken;
    PLSA_CLIENT_CALLBACK ClientCallback;
    PLSA_UPDATE_PRIMARY_CREDENTIALS UpdateCredentials;
    PLSA_GET_AUTH_DATA_FOR_USER GetAuthDataForUser;
    PLSA_CRACK_SINGLE_NAME CrackSingleName;
    PLSA_AUDIT_ACCOUNT_LOGON AuditAccountLogon;
    PLSA_CALL_PACKAGE_PASSTHROUGH CallPackagePassthrough;
    CredReadFn CrediRead;
    CredReadDomainCredentialsFn CrediReadDomainCredentials;
    CredFreeCredentialsFn CrediFreeCredentials;
    PLSA_PROTECT_MEMORY LsaProtectMemory;
    PLSA_PROTECT_MEMORY LsaUnprotectMemory;
    PLSA_OPEN_TOKEN_BY_LOGON_ID OpenTokenByLogonId;
    PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN ExpandAuthDataForDomain;
    PLSA_ALLOCATE_PRIVATE_HEAP AllocatePrivateHeap;
    PLSA_FREE_PRIVATE_HEAP FreePrivateHeap;
    PLSA_CREATE_TOKEN_EX CreateTokenEx;
    CredWriteFn CrediWrite;
    CrediUnmarshalandDecodeStringFn CrediUnmarshalandDecodeString;
    PLSA_PROTECT_MEMORY DummyFunction6;
    PLSA_GET_EXTENDED_CALL_FLAGS GetExtendedCallFlags;
    PLSA_DUPLICATE_HANDLE DuplicateTokenHandle;
    PLSA_GET_SERVICE_ACCOUNT_PASSWORD GetServiceAccountPassword;
    PLSA_PROTECT_MEMORY DummyFunction7;
    PLSA_AUDIT_LOGON_EX AuditLogonEx;
    PLSA_CHECK_PROTECTED_USER_BY_TOKEN CheckProtectedUserByToken;
    PLSA_QUERY_CLIENT_REQUEST QueryClientRequest;
    PLSA_GET_APP_MODE_INFO GetAppModeInfo;
    PLSA_SET_APP_MODE_INFO SetAppModeInfo;
    PLSA_GET_CLIENT_INFO_EX GetClientInfoEx;
}
alias PLSA_LOCATE_PKG_BY_ID = void* function(uint);
struct SECPKG_DLL_FUNCTIONS
{
    PLSA_ALLOCATE_LSA_HEAP AllocateHeap;
    PLSA_FREE_LSA_HEAP FreeHeap;
    PLSA_REGISTER_CALLBACK RegisterCallback;
    PLSA_LOCATE_PKG_BY_ID LocatePackageById;
}
alias SpInitializeFn = NTSTATUS function(ulong, SECPKG_PARAMETERS*, LSA_SECPKG_FUNCTION_TABLE*);
alias SpShutdownFn = NTSTATUS function();
alias SpGetInfoFn = NTSTATUS function(SecPkgInfoA*);
alias SpGetExtendedInformationFn = NTSTATUS function(SECPKG_EXTENDED_INFORMATION_CLASS, SECPKG_EXTENDED_INFORMATION**);
alias SpSetExtendedInformationFn = NTSTATUS function(SECPKG_EXTENDED_INFORMATION_CLASS, SECPKG_EXTENDED_INFORMATION*);
alias PLSA_AP_LOGON_USER_EX2 = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, void**, uint*, LUID*, int*, LSA_TOKEN_INFORMATION_TYPE*, void**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**, SECPKG_PRIMARY_CRED*, SECPKG_SUPPLEMENTAL_CRED_ARRAY**);
alias PLSA_AP_LOGON_USER_EX3 = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, SECPKG_SURROGATE_LOGON*, void**, uint*, LUID*, int*, LSA_TOKEN_INFORMATION_TYPE*, void**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**, LSA_UNICODE_STRING**, SECPKG_PRIMARY_CRED*, SECPKG_SUPPLEMENTAL_CRED_ARRAY**);
alias PLSA_AP_PRE_LOGON_USER_SURROGATE = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, SECPKG_SURROGATE_LOGON*, int*);
alias PLSA_AP_POST_LOGON_USER_SURROGATE = NTSTATUS function(void**, SECURITY_LOGON_TYPE, void*, void*, uint, SECPKG_SURROGATE_LOGON*, void*, uint, LUID*, NTSTATUS, NTSTATUS, LSA_TOKEN_INFORMATION_TYPE, void*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, SECPKG_PRIMARY_CRED*, SECPKG_SUPPLEMENTAL_CRED_ARRAY*);
alias SpAcceptCredentialsFn = NTSTATUS function(SECURITY_LOGON_TYPE, LSA_UNICODE_STRING*, SECPKG_PRIMARY_CRED*, SECPKG_SUPPLEMENTAL_CRED*);
alias SpAcquireCredentialsHandleFn = NTSTATUS function(LSA_UNICODE_STRING*, uint, LUID*, void*, void*, void*, ulong*, long*);
alias SpFreeCredentialsHandleFn = NTSTATUS function(ulong);
alias SpQueryCredentialsAttributesFn = NTSTATUS function(ulong, uint, void*);
alias SpSetCredentialsAttributesFn = NTSTATUS function(ulong, uint, void*, uint);
alias SpAddCredentialsFn = NTSTATUS function(ulong, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, uint, void*, void*, void*, long*);
alias SpSaveCredentialsFn = NTSTATUS function(ulong, SecBuffer*);
alias SpGetCredentialsFn = NTSTATUS function(ulong, SecBuffer*);
alias SpDeleteCredentialsFn = NTSTATUS function(ulong, SecBuffer*);
alias SpInitLsaModeContextFn = NTSTATUS function(ulong, ulong, LSA_UNICODE_STRING*, uint, uint, SecBufferDesc*, ulong*, SecBufferDesc*, uint*, long*, BOOLEAN*, SecBuffer*);
alias SpDeleteContextFn = NTSTATUS function(ulong);
alias SpApplyControlTokenFn = NTSTATUS function(ulong, SecBufferDesc*);
alias SpAcceptLsaModeContextFn = NTSTATUS function(ulong, ulong, SecBufferDesc*, uint, uint, ulong*, SecBufferDesc*, uint*, long*, BOOLEAN*, SecBuffer*);
alias SpGetUserInfoFn = NTSTATUS function(LUID*, uint, SECURITY_USER_DATA**);
alias SpQueryContextAttributesFn = NTSTATUS function(ulong, uint, void*);
alias SpSetContextAttributesFn = NTSTATUS function(ulong, uint, void*, uint);
alias SpChangeAccountPasswordFn = NTSTATUS function(LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, LSA_UNICODE_STRING*, BOOLEAN, SecBufferDesc*);
alias SpQueryMetaDataFn = NTSTATUS function(ulong, LSA_UNICODE_STRING*, uint, uint*, ubyte**, ulong*);
alias SpExchangeMetaDataFn = NTSTATUS function(ulong, LSA_UNICODE_STRING*, uint, uint, ubyte*, ulong*);
alias SpGetCredUIContextFn = NTSTATUS function(ulong, GUID*, uint*, ubyte**);
alias SpUpdateCredentialsFn = NTSTATUS function(ulong, GUID*, uint, ubyte*);
alias SpValidateTargetInfoFn = NTSTATUS function(void**, void*, void*, uint, SECPKG_TARGETINFO*);
alias SpExtractTargetInfoFn = NTSTATUS function(void**, void*, void*, uint, void**, uint*);
alias LSA_AP_POST_LOGON_USER = NTSTATUS function(SECPKG_POST_LOGON_USER_INFO*);
alias SpGetRemoteCredGuardLogonBufferFn = NTSTATUS function(ulong, ulong, const(LSA_UNICODE_STRING)*, HANDLE*, PLSA_REDIRECTED_LOGON_CALLBACK*, PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK*, uint*, void**);
alias SpGetRemoteCredGuardSupplementalCredsFn = NTSTATUS function(ulong, const(LSA_UNICODE_STRING)*, HANDLE*, PLSA_REDIRECTED_LOGON_CALLBACK*, PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK*, uint*, void**);
alias SpGetTbalSupplementalCredsFn = NTSTATUS function(LUID, uint*, void**);
struct SECPKG_FUNCTION_TABLE
{
    PLSA_AP_INITIALIZE_PACKAGE InitializePackage;
    PLSA_AP_LOGON_USER LogonUserA;
    PLSA_AP_CALL_PACKAGE CallPackage;
    PLSA_AP_LOGON_TERMINATED LogonTerminated;
    PLSA_AP_CALL_PACKAGE CallPackageUntrusted;
    PLSA_AP_CALL_PACKAGE_PASSTHROUGH CallPackagePassthrough;
    PLSA_AP_LOGON_USER_EX LogonUserExA;
    PLSA_AP_LOGON_USER_EX2 LogonUserEx2;
    SpInitializeFn Initialize;
    SpShutdownFn Shutdown;
    SpGetInfoFn GetInfo;
    SpAcceptCredentialsFn AcceptCredentials;
    SpAcquireCredentialsHandleFn AcquireCredentialsHandleA;
    SpQueryCredentialsAttributesFn QueryCredentialsAttributesA;
    SpFreeCredentialsHandleFn FreeCredentialsHandle;
    SpSaveCredentialsFn SaveCredentials;
    SpGetCredentialsFn GetCredentials;
    SpDeleteCredentialsFn DeleteCredentials;
    SpInitLsaModeContextFn InitLsaModeContext;
    SpAcceptLsaModeContextFn AcceptLsaModeContext;
    SpDeleteContextFn DeleteContext;
    SpApplyControlTokenFn ApplyControlToken;
    SpGetUserInfoFn GetUserInfo;
    SpGetExtendedInformationFn GetExtendedInformation;
    SpQueryContextAttributesFn QueryContextAttributesA;
    SpAddCredentialsFn AddCredentialsA;
    SpSetExtendedInformationFn SetExtendedInformation;
    SpSetContextAttributesFn SetContextAttributesA;
    SpSetCredentialsAttributesFn SetCredentialsAttributesA;
    SpChangeAccountPasswordFn ChangeAccountPasswordA;
    SpQueryMetaDataFn QueryMetaData;
    SpExchangeMetaDataFn ExchangeMetaData;
    SpGetCredUIContextFn GetCredUIContext;
    SpUpdateCredentialsFn UpdateCredentials;
    SpValidateTargetInfoFn ValidateTargetInfo;
    LSA_AP_POST_LOGON_USER PostLogonUser;
    SpGetRemoteCredGuardLogonBufferFn GetRemoteCredGuardLogonBuffer;
    SpGetRemoteCredGuardSupplementalCredsFn GetRemoteCredGuardSupplementalCreds;
    SpGetTbalSupplementalCredsFn GetTbalSupplementalCreds;
    PLSA_AP_LOGON_USER_EX3 LogonUserEx3;
    PLSA_AP_PRE_LOGON_USER_SURROGATE PreLogonUserSurrogate;
    PLSA_AP_POST_LOGON_USER_SURROGATE PostLogonUserSurrogate;
    SpExtractTargetInfoFn ExtractTargetInfo;
}
alias SpInstanceInitFn = NTSTATUS function(uint, SECPKG_DLL_FUNCTIONS*, void**);
alias SpInitUserModeContextFn = NTSTATUS function(ulong, SecBuffer*);
alias SpMakeSignatureFn = NTSTATUS function(ulong, uint, SecBufferDesc*, uint);
alias SpVerifySignatureFn = NTSTATUS function(ulong, SecBufferDesc*, uint, uint*);
alias SpSealMessageFn = NTSTATUS function(ulong, uint, SecBufferDesc*, uint);
alias SpUnsealMessageFn = NTSTATUS function(ulong, SecBufferDesc*, uint, uint*);
alias SpGetContextTokenFn = NTSTATUS function(ulong, HANDLE*);
alias SpExportSecurityContextFn = NTSTATUS function(ulong, uint, SecBuffer*, HANDLE*);
alias SpImportSecurityContextFn = NTSTATUS function(SecBuffer*, HANDLE, ulong*);
alias SpCompleteAuthTokenFn = NTSTATUS function(ulong, SecBufferDesc*);
alias SpFormatCredentialsFn = NTSTATUS function(SecBuffer*, SecBuffer*);
alias SpMarshallSupplementalCredsFn = NTSTATUS function(uint, ubyte*, uint*, void**);
alias SpMarshalAttributeDataFn = NTSTATUS function(uint, uint, uint, ubyte*, uint*, ubyte**);
struct SECPKG_USER_FUNCTION_TABLE
{
    SpInstanceInitFn InstanceInit;
    SpInitUserModeContextFn InitUserModeContext;
    SpMakeSignatureFn MakeSignature;
    SpVerifySignatureFn VerifySignature;
    SpSealMessageFn SealMessage;
    SpUnsealMessageFn UnsealMessage;
    SpGetContextTokenFn GetContextToken;
    SpQueryContextAttributesFn QueryContextAttributesA;
    SpCompleteAuthTokenFn CompleteAuthToken;
    SpDeleteContextFn DeleteUserModeContext;
    SpFormatCredentialsFn FormatCredentials;
    SpMarshallSupplementalCredsFn MarshallSupplementalCreds;
    SpExportSecurityContextFn ExportContext;
    SpImportSecurityContextFn ImportContext;
    SpMarshalAttributeDataFn MarshalAttributeData;
}
alias SpLsaModeInitializeFn = NTSTATUS function(uint, uint*, SECPKG_FUNCTION_TABLE**, uint*);
alias SpUserModeInitializeFn = NTSTATUS function(uint, uint*, SECPKG_USER_FUNCTION_TABLE**, uint*);
alias KSEC_CONTEXT_TYPE = int;
enum : int
{
    KSecPaged    = 0x00000000,
    KSecNonPaged = 0x00000001,
}

struct KSEC_LIST_ENTRY
{
    LIST_ENTRY List;
    int RefCount;
    uint Signature;
    void* OwningList;
    void* Reserved;
}
alias PKSEC_CREATE_CONTEXT_LIST = void* function(KSEC_CONTEXT_TYPE);
alias PKSEC_INSERT_LIST_ENTRY = void function(void*, KSEC_LIST_ENTRY*);
alias PKSEC_REFERENCE_LIST_ENTRY = NTSTATUS function(KSEC_LIST_ENTRY*, uint, BOOLEAN);
alias PKSEC_DEREFERENCE_LIST_ENTRY = void function(KSEC_LIST_ENTRY*, ubyte*);
alias PKSEC_SERIALIZE_WINNT_AUTH_DATA = NTSTATUS function(void*, uint*, void**);
alias PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA = NTSTATUS function(void*, uint*, void**);
alias PKSEC_LOCATE_PKG_BY_ID = void* function(uint);
struct SECPKG_KERNEL_FUNCTIONS
{
    PLSA_ALLOCATE_LSA_HEAP AllocateHeap;
    PLSA_FREE_LSA_HEAP FreeHeap;
    PKSEC_CREATE_CONTEXT_LIST CreateContextList;
    PKSEC_INSERT_LIST_ENTRY InsertListEntry;
    PKSEC_REFERENCE_LIST_ENTRY ReferenceListEntry;
    PKSEC_DEREFERENCE_LIST_ENTRY DereferenceListEntry;
    PKSEC_SERIALIZE_WINNT_AUTH_DATA SerializeWinntAuthData;
    PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA SerializeSchannelAuthData;
    PKSEC_LOCATE_PKG_BY_ID LocatePackageById;
}
alias KspInitPackageFn = NTSTATUS function(SECPKG_KERNEL_FUNCTIONS*);
alias KspDeleteContextFn = NTSTATUS function(ulong, ulong*);
alias KspInitContextFn = NTSTATUS function(ulong, SecBuffer*, ulong*);
alias KspMakeSignatureFn = NTSTATUS function(ulong, uint, SecBufferDesc*, uint);
alias KspVerifySignatureFn = NTSTATUS function(ulong, SecBufferDesc*, uint, uint*);
alias KspSealMessageFn = NTSTATUS function(ulong, uint, SecBufferDesc*, uint);
alias KspUnsealMessageFn = NTSTATUS function(ulong, SecBufferDesc*, uint, uint*);
alias KspGetTokenFn = NTSTATUS function(ulong, HANDLE*, void**);
alias KspQueryAttributesFn = NTSTATUS function(ulong, uint, void*);
alias KspCompleteTokenFn = NTSTATUS function(ulong, SecBufferDesc*);
alias KspMapHandleFn = NTSTATUS function(ulong, ulong*);
alias KspSetPagingModeFn = NTSTATUS function(BOOLEAN);
alias KspSerializeAuthDataFn = NTSTATUS function(void*, uint*, void**);
struct SECPKG_KERNEL_FUNCTION_TABLE
{
    KspInitPackageFn Initialize;
    KspDeleteContextFn DeleteContext;
    KspInitContextFn InitContext;
    KspMapHandleFn MapHandle;
    KspMakeSignatureFn Sign;
    KspVerifySignatureFn Verify;
    KspSealMessageFn Seal;
    KspUnsealMessageFn Unseal;
    KspGetTokenFn GetToken;
    KspQueryAttributesFn QueryAttributes;
    KspCompleteTokenFn CompleteToken;
    SpExportSecurityContextFn ExportContext;
    SpImportSecurityContextFn ImportContext;
    KspSetPagingModeFn SetPackagePagingMode;
    KspSerializeAuthDataFn SerializeAuthData;
}
struct SecPkgCred_SupportedAlgs
{
    uint cSupportedAlgs;
    ALG_ID* palgSupportedAlgs;
}
struct SecPkgCred_CipherStrengths
{
    uint dwMinimumCipherStrength;
    uint dwMaximumCipherStrength;
}
struct SecPkgCred_SupportedProtocols
{
    uint grbitProtocol;
}
struct SecPkgCred_ClientCertPolicy
{
    uint dwFlags;
    GUID guidPolicyId;
    uint dwCertFlags;
    uint dwUrlRetrievalTimeout;
    BOOL fCheckRevocationFreshnessTime;
    uint dwRevocationFreshnessTime;
    BOOL fOmitUsageCheck;
    PWSTR pwszSslCtlStoreName;
    PWSTR pwszSslCtlIdentifier;
}
struct SecPkgCred_SessionTicketKey
{
    uint TicketInfoVersion;
    ubyte[16] KeyId;
    ubyte[64] KeyingMaterial;
    ubyte KeyingMaterialSize;
}
struct SecPkgCred_SessionTicketKeys
{
    uint cSessionTicketKeys;
    SecPkgCred_SessionTicketKey* pSessionTicketKeys;
}
alias eTlsSignatureAlgorithm = int;
enum : int
{
    TlsSignatureAlgorithm_Anonymous = 0x00000000,
    TlsSignatureAlgorithm_Rsa       = 0x00000001,
    TlsSignatureAlgorithm_Dsa       = 0x00000002,
    TlsSignatureAlgorithm_Ecdsa     = 0x00000003,
}

alias eTlsHashAlgorithm = int;
enum : int
{
    TlsHashAlgorithm_None   = 0x00000000,
    TlsHashAlgorithm_Md5    = 0x00000001,
    TlsHashAlgorithm_Sha1   = 0x00000002,
    TlsHashAlgorithm_Sha224 = 0x00000003,
    TlsHashAlgorithm_Sha256 = 0x00000004,
    TlsHashAlgorithm_Sha384 = 0x00000005,
    TlsHashAlgorithm_Sha512 = 0x00000006,
}

struct SecPkgContext_RemoteCredentialInfo
{
    uint cbCertificateChain;
    ubyte* pbCertificateChain;
    uint cCertificates;
    uint fFlags;
    uint dwBits;
}
struct SecPkgContext_LocalCredentialInfo
{
    uint cbCertificateChain;
    ubyte* pbCertificateChain;
    uint cCertificates;
    uint fFlags;
    uint dwBits;
}
struct SecPkgContext_ClientCertPolicyResult
{
    HRESULT dwPolicyResult;
    GUID guidPolicyId;
}
struct SecPkgContext_IssuerListInfoEx
{
    CRYPT_INTEGER_BLOB* aIssuers;
    uint cIssuers;
}
struct SecPkgContext_ConnectionInfo
{
    uint dwProtocol;
    ALG_ID aiCipher;
    uint dwCipherStrength;
    ALG_ID aiHash;
    uint dwHashStrength;
    ALG_ID aiExch;
    uint dwExchStrength;
}
struct SecPkgContext_ConnectionInfoEx
{
    uint dwVersion;
    uint dwProtocol;
    wchar[64] szCipher;
    uint dwCipherStrength;
    wchar[64] szHash;
    uint dwHashStrength;
    wchar[64] szExchange;
    uint dwExchStrength;
}
struct SecPkgContext_CipherInfo
{
    uint dwVersion;
    uint dwProtocol;
    uint dwCipherSuite;
    uint dwBaseCipherSuite;
    wchar[64] szCipherSuite;
    wchar[64] szCipher;
    uint dwCipherLen;
    uint dwCipherBlockLen;
    wchar[64] szHash;
    uint dwHashLen;
    wchar[64] szExchange;
    uint dwMinExchangeLen;
    uint dwMaxExchangeLen;
    wchar[64] szCertificate;
    uint dwKeyType;
}
struct SecPkgContext_EapKeyBlock
{
    ubyte[128] rgbKeys;
    ubyte[64] rgbIVs;
}
struct SecPkgContext_MappedCredAttr
{
    uint dwAttribute;
    void* pvBuffer;
}
struct SecPkgContext_SessionInfo
{
    uint dwFlags;
    uint cbSessionId;
    ubyte[32] rgbSessionId;
}
struct SecPkgContext_SessionAppData
{
    uint dwFlags;
    uint cbAppData;
    ubyte* pbAppData;
}
struct SecPkgContext_EapPrfInfo
{
    uint dwVersion;
    uint cbPrfData;
    ubyte* pbPrfData;
}
struct SecPkgContext_SupportedSignatures
{
    ushort cSignatureAndHashAlgorithms;
    ushort* pSignatureAndHashAlgorithms;
}
struct SecPkgContext_Certificates
{
    uint cCertificates;
    uint cbCertificateChain;
    ubyte* pbCertificateChain;
}
struct SecPkgContext_CertInfo
{
    uint dwVersion;
    uint cbSubjectName;
    PWSTR pwszSubjectName;
    uint cbIssuerName;
    PWSTR pwszIssuerName;
    uint dwKeySize;
}
struct SecPkgContext_UiInfo
{
    HWND hParentWindow;
}
struct SecPkgContext_EarlyStart
{
    uint dwEarlyStartFlags;
}
struct SecPkgContext_KeyingMaterialInfo
{
    ushort cbLabel;
    PSTR pszLabel;
    ushort cbContextValue;
    ubyte* pbContextValue;
    uint cbKeyingMaterial;
}
struct SecPkgContext_KeyingMaterial
{
    uint cbKeyingMaterial;
    ubyte* pbKeyingMaterial;
}
struct SecPkgContext_KeyingMaterial_Inproc
{
    ushort cbLabel;
    PSTR pszLabel;
    ushort cbContextValue;
    ubyte* pbContextValue;
    uint cbKeyingMaterial;
    ubyte* pbKeyingMaterial;
}
struct SecPkgContext_SrtpParameters
{
    ushort ProtectionProfile;
    ubyte MasterKeyIdentifierSize;
    ubyte* MasterKeyIdentifier;
}
struct SecPkgContext_TokenBinding
{
    ubyte MajorVersion;
    ubyte MinorVersion;
    ushort KeyParametersSize;
    ubyte* KeyParameters;
}
struct SecPkgContext_CertificateValidationResult
{
    uint dwChainErrorStatus;
    HRESULT hrVerifyChainStatus;
}
struct SCHANNEL_CRED
{
    uint dwVersion;
    uint cCreds;
    CERT_CONTEXT** paCred;
    HCERTSTORE hRootStore;
    uint cMappers;
    _HMAPPER** aphMappers;
    uint cSupportedAlgs;
    ALG_ID* palgSupportedAlgs;
    uint grbitEnabledProtocols;
    uint dwMinimumCipherStrength;
    uint dwMaximumCipherStrength;
    uint dwSessionLifespan;
    SCHANNEL_CRED_FLAGS dwFlags;
    uint dwCredFormat;
}
alias eTlsAlgorithmUsage = int;
enum : int
{
    TlsParametersCngAlgUsageKeyExchange = 0x00000000,
    TlsParametersCngAlgUsageSignature   = 0x00000001,
    TlsParametersCngAlgUsageCipher      = 0x00000002,
    TlsParametersCngAlgUsageDigest      = 0x00000003,
    TlsParametersCngAlgUsageCertSig     = 0x00000004,
}

struct CRYPTO_SETTINGS
{
    eTlsAlgorithmUsage eAlgorithmUsage;
    LSA_UNICODE_STRING strCngAlgId;
    uint cChainingModes;
    LSA_UNICODE_STRING* rgstrChainingModes;
    uint dwMinBitLength;
    uint dwMaxBitLength;
}
struct TLS_PARAMETERS
{
    uint cAlpnIds;
    LSA_UNICODE_STRING* rgstrAlpnIds;
    uint grbitDisabledProtocols;
    uint cDisabledCrypto;
    CRYPTO_SETTINGS* pDisabledCrypto;
    uint dwFlags;
}
struct SCH_CREDENTIALS
{
    uint dwVersion;
    uint dwCredFormat;
    uint cCreds;
    CERT_CONTEXT** paCred;
    HCERTSTORE hRootStore;
    uint cMappers;
    _HMAPPER** aphMappers;
    uint dwSessionLifespan;
    uint dwFlags;
    uint cTlsParameters;
    TLS_PARAMETERS* pTlsParameters;
}
struct SEND_GENERIC_TLS_EXTENSION
{
    ushort ExtensionType;
    ushort HandshakeType;
    uint Flags;
    ushort BufferSize;
    ubyte[1] Buffer;
}
struct TLS_EXTENSION_SUBSCRIPTION
{
    ushort ExtensionType;
    ushort HandshakeType;
}
struct SUBSCRIBE_GENERIC_TLS_EXTENSION
{
    uint Flags;
    uint SubscriptionsCount;
    TLS_EXTENSION_SUBSCRIPTION[1] Subscriptions;
}
struct SCHANNEL_CERT_HASH
{
    uint dwLength;
    uint dwFlags;
    ulong hProv;
    ubyte[20] ShaHash;
}
struct SCHANNEL_CERT_HASH_STORE
{
    uint dwLength;
    uint dwFlags;
    ulong hProv;
    ubyte[20] ShaHash;
    wchar[128] pwszStoreName;
}
struct SCHANNEL_ALERT_TOKEN
{
    uint dwTokenType;
    SCHANNEL_ALERT_TOKEN_ALERT_TYPE dwAlertType;
    uint dwAlertNumber;
}
struct SCHANNEL_SESSION_TOKEN
{
    uint dwTokenType;
    SCHANNEL_SESSION_TOKEN_FLAGS dwFlags;
}
struct SCHANNEL_CLIENT_SIGNATURE
{
    uint cbLength;
    ALG_ID aiHash;
    uint cbHash;
    ubyte[36] HashValue;
    ubyte[20] CertThumbprint;
}
alias SSL_EMPTY_CACHE_FN_A = BOOL function(PSTR, uint);
alias SSL_EMPTY_CACHE_FN_W = BOOL function(PWSTR, uint);
struct SSL_CREDENTIAL_CERTIFICATE
{
    uint cbPrivateKey;
    ubyte* pPrivateKey;
    uint cbCertificate;
    ubyte* pCertificate;
    PSTR pszPassword;
}
struct SCH_CRED
{
    uint dwVersion;
    uint cCreds;
    void** paSecret;
    void** paPublic;
    uint cMappers;
    _HMAPPER** aphMappers;
}
struct SCH_CRED_SECRET_CAPI
{
    uint dwType;
    ulong hProv;
}
struct SCH_CRED_SECRET_PRIVKEY
{
    uint dwType;
    ubyte* pPrivateKey;
    uint cbPrivateKey;
    PSTR pszPassword;
}
struct SCH_CRED_PUBLIC_CERTCHAIN
{
    uint dwType;
    uint cbCertChain;
    ubyte* pCertChain;
}
struct PctPublicKey
{
    uint Type;
    uint cbKey;
    ubyte[1] pKey;
}
struct X509Certificate
{
    uint Version;
    uint[4] SerialNumber;
    ALG_ID SignatureAlgorithm;
    FILETIME ValidFrom;
    FILETIME ValidUntil;
    PSTR pszIssuer;
    PSTR pszSubject;
    PctPublicKey* pPublicKey;
}
alias SSL_CRACK_CERTIFICATE_FN = BOOL function(ubyte*, uint, BOOL, X509Certificate**);
alias SSL_FREE_CERTIFICATE_FN = void function(X509Certificate*);
alias SslGetServerIdentityFn = HRESULT function(ubyte*, uint, ubyte**, uint*, uint);
struct SCH_EXTENSION_DATA
{
    ushort ExtensionType;
    const(ubyte)* pExtData;
    uint cbExtData;
}
alias SchGetExtensionsOptions = int;
enum : int
{
    SCH_EXTENSIONS_OPTIONS_NONE = 0x00000000,
    SCH_NO_RECORD_HEADER        = 0x00000001,
}

alias SslGetExtensionsFn = HRESULT function(const(ubyte)*, uint, SCH_EXTENSION_DATA*, ubyte, uint*, SchGetExtensionsOptions);
alias SslDeserializeCertificateStoreFn = HRESULT function(CRYPT_INTEGER_BLOB, CERT_CONTEXT**);
struct LOGON_HOURS
{
    ushort UnitsPerWeek;
    ubyte* LogonHours;
}
struct SR_SECURITY_DESCRIPTOR
{
    uint Length;
    ubyte* SecurityDescriptor;
}
struct USER_ALL_INFORMATION
{
    align (4):
    long LastLogon;
    long LastLogoff;
    long PasswordLastSet;
    long AccountExpires;
    long PasswordCanChange;
    long PasswordMustChange;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING FullName;
    LSA_UNICODE_STRING HomeDirectory;
    LSA_UNICODE_STRING HomeDirectoryDrive;
    LSA_UNICODE_STRING ScriptPath;
    LSA_UNICODE_STRING ProfilePath;
    LSA_UNICODE_STRING AdminComment;
    LSA_UNICODE_STRING WorkStations;
    LSA_UNICODE_STRING UserComment;
    LSA_UNICODE_STRING Parameters;
    LSA_UNICODE_STRING LmPassword;
    LSA_UNICODE_STRING NtPassword;
    LSA_UNICODE_STRING PrivateData;
    SR_SECURITY_DESCRIPTOR SecurityDescriptor;
    uint UserId;
    uint PrimaryGroupId;
    uint UserAccountControl;
    uint WhichFields;
    LOGON_HOURS LogonHours;
    ushort BadPasswordCount;
    ushort LogonCount;
    ushort CountryCode;
    ushort CodePage;
    BOOLEAN LmPasswordPresent;
    BOOLEAN NtPasswordPresent;
    BOOLEAN PasswordExpired;
    BOOLEAN PrivateDataSensitive;
}
struct CLEAR_BLOCK
{
    CHAR[8] data;
}
struct USER_SESSION_KEY
{
    CYPHER_BLOCK[2] data;
}
alias NETLOGON_LOGON_INFO_CLASS = int;
enum : int
{
    NetlogonInteractiveInformation           = 0x00000001,
    NetlogonNetworkInformation               = 0x00000002,
    NetlogonServiceInformation               = 0x00000003,
    NetlogonGenericInformation               = 0x00000004,
    NetlogonInteractiveTransitiveInformation = 0x00000005,
    NetlogonNetworkTransitiveInformation     = 0x00000006,
    NetlogonServiceTransitiveInformation     = 0x00000007,
}

struct NETLOGON_LOGON_IDENTITY_INFO
{
    LSA_UNICODE_STRING LogonDomainName;
    uint ParameterControl;
    long LogonId;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING Workstation;
}
struct NETLOGON_INTERACTIVE_INFO
{
    NETLOGON_LOGON_IDENTITY_INFO Identity;
    LM_OWF_PASSWORD LmOwfPassword;
    LM_OWF_PASSWORD NtOwfPassword;
}
struct NETLOGON_SERVICE_INFO
{
    NETLOGON_LOGON_IDENTITY_INFO Identity;
    LM_OWF_PASSWORD LmOwfPassword;
    LM_OWF_PASSWORD NtOwfPassword;
}
struct NETLOGON_NETWORK_INFO
{
    NETLOGON_LOGON_IDENTITY_INFO Identity;
    CLEAR_BLOCK LmChallenge;
    LSA_STRING NtChallengeResponse;
    LSA_STRING LmChallengeResponse;
}
struct NETLOGON_GENERIC_INFO
{
    NETLOGON_LOGON_IDENTITY_INFO Identity;
    LSA_UNICODE_STRING PackageName;
    uint DataLength;
    ubyte* LogonData;
}
struct MSV1_0_VALIDATION_INFO
{
    long LogoffTime;
    long KickoffTime;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING LogonDomainName;
    USER_SESSION_KEY SessionKey;
    BOOLEAN Authoritative;
    uint UserFlags;
    uint WhichFields;
    uint UserId;
}
alias TOKENBINDING_TYPE = int;
enum : int
{
    TOKENBINDING_TYPE_PROVIDED = 0x00000000,
    TOKENBINDING_TYPE_REFERRED = 0x00000001,
}

alias TOKENBINDING_EXTENSION_FORMAT = int;
enum : int
{
    TOKENBINDING_EXTENSION_FORMAT_UNDEFINED = 0x00000000,
}

alias TOKENBINDING_KEY_PARAMETERS_TYPE = int;
enum : int
{
    TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PKCS = 0x00000000,
    TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PSS  = 0x00000001,
    TOKENBINDING_KEY_PARAMETERS_TYPE_ECDSAP256    = 0x00000002,
    TOKENBINDING_KEY_PARAMETERS_TYPE_ANYEXISTING  = 0x000000ff,
}

struct TOKENBINDING_IDENTIFIER
{
    ubyte keyType;
}
struct TOKENBINDING_RESULT_DATA
{
    TOKENBINDING_TYPE bindingType;
    uint identifierSize;
    TOKENBINDING_IDENTIFIER* identifierData;
    TOKENBINDING_EXTENSION_FORMAT extensionFormat;
    uint extensionSize;
    void* extensionData;
}
struct TOKENBINDING_RESULT_LIST
{
    uint resultCount;
    TOKENBINDING_RESULT_DATA* resultData;
}
struct TOKENBINDING_KEY_TYPES
{
    uint keyCount;
    TOKENBINDING_KEY_PARAMETERS_TYPE* keyType;
}
alias EXTENDED_NAME_FORMAT = int;
enum : int
{
    NameUnknown          = 0x00000000,
    NameFullyQualifiedDN = 0x00000001,
    NameSamCompatible    = 0x00000002,
    NameDisplay          = 0x00000003,
    NameUniqueId         = 0x00000006,
    NameCanonical        = 0x00000007,
    NameUserPrincipal    = 0x00000008,
    NameCanonicalEx      = 0x00000009,
    NameServicePrincipal = 0x0000000a,
    NameDnsDomain        = 0x0000000c,
    NameGivenName        = 0x0000000d,
    NameSurname          = 0x0000000e,
}

alias SLDATATYPE = uint;
enum : uint
{
    SL_DATA_NONE     = 0x00000000,
    SL_DATA_SZ       = 0x00000001,
    SL_DATA_DWORD    = 0x00000004,
    SL_DATA_BINARY   = 0x00000003,
    SL_DATA_MULTI_SZ = 0x00000007,
    SL_DATA_SUM      = 0x00000064,
}

alias SLIDTYPE = int;
enum : int
{
    SL_ID_APPLICATION       = 0x00000000,
    SL_ID_PRODUCT_SKU       = 0x00000001,
    SL_ID_LICENSE_FILE      = 0x00000002,
    SL_ID_LICENSE           = 0x00000003,
    SL_ID_PKEY              = 0x00000004,
    SL_ID_ALL_LICENSES      = 0x00000005,
    SL_ID_ALL_LICENSE_FILES = 0x00000006,
    SL_ID_STORE_TOKEN       = 0x00000007,
    SL_ID_LAST              = 0x00000008,
}

alias SLLICENSINGSTATUS = int;
enum : int
{
    SL_LICENSING_STATUS_UNLICENSED      = 0x00000000,
    SL_LICENSING_STATUS_LICENSED        = 0x00000001,
    SL_LICENSING_STATUS_IN_GRACE_PERIOD = 0x00000002,
    SL_LICENSING_STATUS_NOTIFICATION    = 0x00000003,
    SL_LICENSING_STATUS_LAST            = 0x00000004,
}

struct SL_LICENSING_STATUS
{
    GUID SkuId;
    SLLICENSINGSTATUS eStatus;
    uint dwGraceTime;
    uint dwTotalGraceDays;
    HRESULT hrReason;
    ulong qwValidityExpiration;
}
alias SL_ACTIVATION_TYPE = int;
enum : int
{
    SL_ACTIVATION_TYPE_DEFAULT          = 0x00000000,
    SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY = 0x00000001,
}

struct SL_ACTIVATION_INFO_HEADER
{
    uint cbSize;
    SL_ACTIVATION_TYPE type;
}
struct SL_AD_ACTIVATION_INFO
{
    SL_ACTIVATION_INFO_HEADER header;
    const(wchar)* pwszProductKey;
    const(wchar)* pwszActivationObjectName;
}
alias SLREFERRALTYPE = int;
enum : int
{
    SL_REFERRALTYPE_SKUID          = 0x00000000,
    SL_REFERRALTYPE_APPID          = 0x00000001,
    SL_REFERRALTYPE_OVERRIDE_SKUID = 0x00000002,
    SL_REFERRALTYPE_OVERRIDE_APPID = 0x00000003,
    SL_REFERRALTYPE_BEST_MATCH     = 0x00000004,
}

alias SL_GENUINE_STATE = int;
enum : int
{
    SL_GEN_STATE_IS_GENUINE      = 0x00000000,
    SL_GEN_STATE_INVALID_LICENSE = 0x00000001,
    SL_GEN_STATE_TAMPERED        = 0x00000002,
    SL_GEN_STATE_OFFLINE         = 0x00000003,
    SL_GEN_STATE_LAST            = 0x00000004,
}

struct SL_NONGENUINE_UI_OPTIONS
{
    uint cbSize;
    const(GUID)* pComponentId;
    HRESULT hResultUI;
}
struct SL_SYSTEM_POLICY_INFORMATION
{
    void*[2] Reserved1;
    uint[3] Reserved2;
}
enum IID_ICcgDomainAuthCredentials = GUID(0x6ecda518, 0x2010, 0x4437, [0x8b, 0xc3, 0x46, 0xe7, 0x52, 0xb7, 0xb1, 0x72]);
interface ICcgDomainAuthCredentials : IUnknown
{
    HRESULT GetPasswordCredentials(const(wchar)*, PWSTR*, PWSTR*, PWSTR*);
}
