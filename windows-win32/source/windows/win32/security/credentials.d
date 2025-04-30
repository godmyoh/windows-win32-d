module windows.win32.security.credentials;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HANDLE, HRESULT, HWND, PSTR, PWSTR, WIN32_ERROR;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

alias CRED_FLAGS = uint;
enum : uint
{
    CRED_FLAGS_PASSWORD_FOR_CERT    = 0x00000001,
    CRED_FLAGS_PROMPT_NOW           = 0x00000002,
    CRED_FLAGS_USERNAME_TARGET      = 0x00000004,
    CRED_FLAGS_OWF_CRED_BLOB        = 0x00000008,
    CRED_FLAGS_REQUIRE_CONFIRMATION = 0x00000010,
    CRED_FLAGS_WILDCARD_MATCH       = 0x00000020,
    CRED_FLAGS_VSM_PROTECTED        = 0x00000040,
    CRED_FLAGS_NGC_CERT             = 0x00000080,
    CRED_FLAGS_VALID_FLAGS          = 0x0000f0ff,
    CRED_FLAGS_VALID_INPUT_FLAGS    = 0x0000f09f,
}

alias CRED_TYPE = uint;
enum : uint
{
    CRED_TYPE_GENERIC                 = 0x00000001,
    CRED_TYPE_DOMAIN_PASSWORD         = 0x00000002,
    CRED_TYPE_DOMAIN_CERTIFICATE      = 0x00000003,
    CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 0x00000004,
    CRED_TYPE_GENERIC_CERTIFICATE     = 0x00000005,
    CRED_TYPE_DOMAIN_EXTENDED         = 0x00000006,
    CRED_TYPE_MAXIMUM                 = 0x00000007,
    CRED_TYPE_MAXIMUM_EX              = 0x000003ef,
}

alias CRED_PERSIST = uint;
enum : uint
{
    CRED_PERSIST_NONE          = 0x00000000,
    CRED_PERSIST_SESSION       = 0x00000001,
    CRED_PERSIST_LOCAL_MACHINE = 0x00000002,
    CRED_PERSIST_ENTERPRISE    = 0x00000003,
}

alias CREDUI_FLAGS = uint;
enum : uint
{
    CREDUI_FLAGS_ALWAYS_SHOW_UI              = 0x00000080,
    CREDUI_FLAGS_COMPLETE_USERNAME           = 0x00000800,
    CREDUI_FLAGS_DO_NOT_PERSIST              = 0x00000002,
    CREDUI_FLAGS_EXCLUDE_CERTIFICATES        = 0x00000008,
    CREDUI_FLAGS_EXPECT_CONFIRMATION         = 0x00020000,
    CREDUI_FLAGS_GENERIC_CREDENTIALS         = 0x00040000,
    CREDUI_FLAGS_INCORRECT_PASSWORD          = 0x00000001,
    CREDUI_FLAGS_KEEP_USERNAME               = 0x00100000,
    CREDUI_FLAGS_PASSWORD_ONLY_OK            = 0x00000200,
    CREDUI_FLAGS_PERSIST                     = 0x00001000,
    CREDUI_FLAGS_REQUEST_ADMINISTRATOR       = 0x00000004,
    CREDUI_FLAGS_REQUIRE_CERTIFICATE         = 0x00000010,
    CREDUI_FLAGS_REQUIRE_SMARTCARD           = 0x00000100,
    CREDUI_FLAGS_SERVER_CREDENTIAL           = 0x00004000,
    CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX         = 0x00000040,
    CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS = 0x00080000,
    CREDUI_FLAGS_VALIDATE_USERNAME           = 0x00000400,
}

alias SCARD_SCOPE = uint;
enum : uint
{
    SCARD_SCOPE_USER   = 0x00000000,
    SCARD_SCOPE_SYSTEM = 0x00000002,
}

alias CRED_ENUMERATE_FLAGS = uint;
enum : uint
{
    CRED_ENUMERATE_ALL_CREDENTIALS = 0x00000001,
}

alias CREDUIWIN_FLAGS = uint;
enum : uint
{
    CREDUIWIN_GENERIC                = 0x00000001,
    CREDUIWIN_CHECKBOX               = 0x00000002,
    CREDUIWIN_AUTHPACKAGE_ONLY       = 0x00000010,
    CREDUIWIN_IN_CRED_ONLY           = 0x00000020,
    CREDUIWIN_ENUMERATE_ADMINS       = 0x00000100,
    CREDUIWIN_ENUMERATE_CURRENT_USER = 0x00000200,
    CREDUIWIN_SECURE_PROMPT          = 0x00001000,
    CREDUIWIN_PREPROMPTING           = 0x00002000,
    CREDUIWIN_PACK_32_WOW            = 0x10000000,
}

alias SCARD_STATE = uint;
enum : uint
{
    SCARD_STATE_UNAWARE     = 0x00000000,
    SCARD_STATE_IGNORE      = 0x00000001,
    SCARD_STATE_UNAVAILABLE = 0x00000008,
    SCARD_STATE_EMPTY       = 0x00000010,
    SCARD_STATE_PRESENT     = 0x00000020,
    SCARD_STATE_ATRMATCH    = 0x00000040,
    SCARD_STATE_EXCLUSIVE   = 0x00000080,
    SCARD_STATE_INUSE       = 0x00000100,
    SCARD_STATE_MUTE        = 0x00000200,
    SCARD_STATE_CHANGED     = 0x00000002,
    SCARD_STATE_UNKNOWN     = 0x00000004,
}

alias CRED_PACK_FLAGS = uint;
enum : uint
{
    CRED_PACK_PROTECTED_CREDENTIALS   = 0x00000001,
    CRED_PACK_WOW_BUFFER              = 0x00000002,
    CRED_PACK_GENERIC_CREDENTIALS     = 0x00000004,
    CRED_PACK_ID_PROVIDER_CREDENTIALS = 0x00000008,
}

HRESULT KeyCredentialManagerGetOperationErrorStates(KeyCredentialManagerOperationType keyCredentialManagerOperationType, BOOL* isReady, KeyCredentialManagerOperationErrorStates* keyCredentialManagerOperationErrorStates);
HRESULT KeyCredentialManagerShowUIOperation(HWND hWndOwner, KeyCredentialManagerOperationType keyCredentialManagerOperationType);
HRESULT KeyCredentialManagerGetInformation(KeyCredentialManagerInfo** keyCredentialManagerInfo);
void KeyCredentialManagerFreeInformation(KeyCredentialManagerInfo* keyCredentialManagerInfo);
BOOL CredWriteW(CREDENTIALW* Credential, uint Flags);
BOOL CredWriteA(CREDENTIALA* Credential, uint Flags);
BOOL CredReadW(const(wchar)* TargetName, CRED_TYPE Type, uint Flags, CREDENTIALW** Credential);
BOOL CredReadA(const(char)* TargetName, CRED_TYPE Type, uint Flags, CREDENTIALA** Credential);
BOOL CredEnumerateW(const(wchar)* Filter, CRED_ENUMERATE_FLAGS Flags, uint* Count, CREDENTIALW*** Credential);
BOOL CredEnumerateA(const(char)* Filter, CRED_ENUMERATE_FLAGS Flags, uint* Count, CREDENTIALA*** Credential);
BOOL CredWriteDomainCredentialsW(CREDENTIAL_TARGET_INFORMATIONW* TargetInfo, CREDENTIALW* Credential, uint Flags);
BOOL CredWriteDomainCredentialsA(CREDENTIAL_TARGET_INFORMATIONA* TargetInfo, CREDENTIALA* Credential, uint Flags);
BOOL CredReadDomainCredentialsW(CREDENTIAL_TARGET_INFORMATIONW* TargetInfo, uint Flags, uint* Count, CREDENTIALW*** Credential);
BOOL CredReadDomainCredentialsA(CREDENTIAL_TARGET_INFORMATIONA* TargetInfo, uint Flags, uint* Count, CREDENTIALA*** Credential);
BOOL CredDeleteW(const(wchar)* TargetName, CRED_TYPE Type, uint Flags);
BOOL CredDeleteA(const(char)* TargetName, CRED_TYPE Type, uint Flags);
BOOL CredRenameW(const(wchar)* OldTargetName, const(wchar)* NewTargetName, CRED_TYPE Type, uint Flags);
BOOL CredRenameA(const(char)* OldTargetName, const(char)* NewTargetName, CRED_TYPE Type, uint Flags);
BOOL CredGetTargetInfoW(const(wchar)* TargetName, uint Flags, CREDENTIAL_TARGET_INFORMATIONW** TargetInfo);
BOOL CredGetTargetInfoA(const(char)* TargetName, uint Flags, CREDENTIAL_TARGET_INFORMATIONA** TargetInfo);
BOOL CredMarshalCredentialW(CRED_MARSHAL_TYPE CredType, void* Credential, PWSTR* MarshaledCredential);
BOOL CredMarshalCredentialA(CRED_MARSHAL_TYPE CredType, void* Credential, PSTR* MarshaledCredential);
BOOL CredUnmarshalCredentialW(const(wchar)* MarshaledCredential, CRED_MARSHAL_TYPE* CredType, void** Credential);
BOOL CredUnmarshalCredentialA(const(char)* MarshaledCredential, CRED_MARSHAL_TYPE* CredType, void** Credential);
BOOL CredIsMarshaledCredentialW(const(wchar)* MarshaledCredential);
BOOL CredIsMarshaledCredentialA(const(char)* MarshaledCredential);
BOOL CredUnPackAuthenticationBufferW(CRED_PACK_FLAGS dwFlags, void* pAuthBuffer, uint cbAuthBuffer, PWSTR pszUserName, uint* pcchMaxUserName, PWSTR pszDomainName, uint* pcchMaxDomainName, PWSTR pszPassword, uint* pcchMaxPassword);
BOOL CredUnPackAuthenticationBufferA(CRED_PACK_FLAGS dwFlags, void* pAuthBuffer, uint cbAuthBuffer, PSTR pszUserName, uint* pcchlMaxUserName, PSTR pszDomainName, uint* pcchMaxDomainName, PSTR pszPassword, uint* pcchMaxPassword);
BOOL CredPackAuthenticationBufferW(CRED_PACK_FLAGS dwFlags, PWSTR pszUserName, PWSTR pszPassword, ubyte* pPackedCredentials, uint* pcbPackedCredentials);
BOOL CredPackAuthenticationBufferA(CRED_PACK_FLAGS dwFlags, PSTR pszUserName, PSTR pszPassword, ubyte* pPackedCredentials, uint* pcbPackedCredentials);
BOOL CredProtectW(BOOL fAsSelf, PWSTR pszCredentials, uint cchCredentials, PWSTR pszProtectedCredentials, uint* pcchMaxChars, CRED_PROTECTION_TYPE* ProtectionType);
BOOL CredProtectA(BOOL fAsSelf, PSTR pszCredentials, uint cchCredentials, PSTR pszProtectedCredentials, uint* pcchMaxChars, CRED_PROTECTION_TYPE* ProtectionType);
BOOL CredUnprotectW(BOOL fAsSelf, PWSTR pszProtectedCredentials, uint cchProtectedCredentials, PWSTR pszCredentials, uint* pcchMaxChars);
BOOL CredUnprotectA(BOOL fAsSelf, PSTR pszProtectedCredentials, uint cchProtectedCredentials, PSTR pszCredentials, uint* pcchMaxChars);
BOOL CredIsProtectedW(PWSTR pszProtectedCredentials, CRED_PROTECTION_TYPE* pProtectionType);
BOOL CredIsProtectedA(PSTR pszProtectedCredentials, CRED_PROTECTION_TYPE* pProtectionType);
BOOL CredFindBestCredentialW(const(wchar)* TargetName, uint Type, uint Flags, CREDENTIALW** Credential);
BOOL CredFindBestCredentialA(const(char)* TargetName, uint Type, uint Flags, CREDENTIALA** Credential);
BOOL CredGetSessionTypes(uint MaximumPersistCount, uint* MaximumPersist);
void CredFree(void* Buffer);
WIN32_ERROR CredUIPromptForCredentialsW(CREDUI_INFOW* pUiInfo, const(wchar)* pszTargetName, SecHandle* pContext, uint dwAuthError, PWSTR pszUserName, uint ulUserNameBufferSize, PWSTR pszPassword, uint ulPasswordBufferSize, BOOL* save, CREDUI_FLAGS dwFlags);
WIN32_ERROR CredUIPromptForCredentialsA(CREDUI_INFOA* pUiInfo, const(char)* pszTargetName, SecHandle* pContext, uint dwAuthError, PSTR pszUserName, uint ulUserNameBufferSize, PSTR pszPassword, uint ulPasswordBufferSize, BOOL* save, CREDUI_FLAGS dwFlags);
uint CredUIPromptForWindowsCredentialsW(CREDUI_INFOW* pUiInfo, uint dwAuthError, uint* pulAuthPackage, const(void)* pvInAuthBuffer, uint ulInAuthBufferSize, void** ppvOutAuthBuffer, uint* pulOutAuthBufferSize, BOOL* pfSave, CREDUIWIN_FLAGS dwFlags);
uint CredUIPromptForWindowsCredentialsA(CREDUI_INFOA* pUiInfo, uint dwAuthError, uint* pulAuthPackage, const(void)* pvInAuthBuffer, uint ulInAuthBufferSize, void** ppvOutAuthBuffer, uint* pulOutAuthBufferSize, BOOL* pfSave, CREDUIWIN_FLAGS dwFlags);
WIN32_ERROR CredUIParseUserNameW(const(wchar)* UserName, PWSTR user, uint userBufferSize, PWSTR domain, uint domainBufferSize);
WIN32_ERROR CredUIParseUserNameA(const(char)* userName, PSTR user, uint userBufferSize, PSTR domain, uint domainBufferSize);
uint CredUICmdLinePromptForCredentialsW(const(wchar)* pszTargetName, SecHandle* pContext, uint dwAuthError, PWSTR UserName, uint ulUserBufferSize, PWSTR pszPassword, uint ulPasswordBufferSize, BOOL* pfSave, CREDUI_FLAGS dwFlags);
uint CredUICmdLinePromptForCredentialsA(const(char)* pszTargetName, SecHandle* pContext, uint dwAuthError, PSTR UserName, uint ulUserBufferSize, PSTR pszPassword, uint ulPasswordBufferSize, BOOL* pfSave, CREDUI_FLAGS dwFlags);
uint CredUIConfirmCredentialsW(const(wchar)* pszTargetName, BOOL bConfirm);
uint CredUIConfirmCredentialsA(const(char)* pszTargetName, BOOL bConfirm);
uint CredUIStoreSSOCredW(const(wchar)* pszRealm, const(wchar)* pszUsername, const(wchar)* pszPassword, BOOL bPersist);
uint CredUIReadSSOCredW(const(wchar)* pszRealm, PWSTR* ppszUsername);
int SCardEstablishContext(SCARD_SCOPE dwScope, const(void)* pvReserved1, const(void)* pvReserved2, ulong* phContext);
int SCardReleaseContext(ulong hContext);
int SCardIsValidContext(ulong hContext);
int SCardListReaderGroupsA(ulong hContext, PSTR mszGroups, uint* pcchGroups);
int SCardListReaderGroupsW(ulong hContext, PWSTR mszGroups, uint* pcchGroups);
int SCardListReadersA(ulong hContext, const(char)* mszGroups, PSTR mszReaders, uint* pcchReaders);
int SCardListReadersW(ulong hContext, const(wchar)* mszGroups, PWSTR mszReaders, uint* pcchReaders);
int SCardListCardsA(ulong hContext, ubyte* pbAtr, const(GUID)* rgquidInterfaces, uint cguidInterfaceCount, PSTR mszCards, uint* pcchCards);
int SCardListCardsW(ulong hContext, ubyte* pbAtr, const(GUID)* rgquidInterfaces, uint cguidInterfaceCount, PWSTR mszCards, uint* pcchCards);
int SCardListInterfacesA(ulong hContext, const(char)* szCard, GUID* pguidInterfaces, uint* pcguidInterfaces);
int SCardListInterfacesW(ulong hContext, const(wchar)* szCard, GUID* pguidInterfaces, uint* pcguidInterfaces);
int SCardGetProviderIdA(ulong hContext, const(char)* szCard, GUID* pguidProviderId);
int SCardGetProviderIdW(ulong hContext, const(wchar)* szCard, GUID* pguidProviderId);
int SCardGetCardTypeProviderNameA(ulong hContext, const(char)* szCardName, uint dwProviderId, PSTR szProvider, uint* pcchProvider);
int SCardGetCardTypeProviderNameW(ulong hContext, const(wchar)* szCardName, uint dwProviderId, PWSTR szProvider, uint* pcchProvider);
int SCardIntroduceReaderGroupA(ulong hContext, const(char)* szGroupName);
int SCardIntroduceReaderGroupW(ulong hContext, const(wchar)* szGroupName);
int SCardForgetReaderGroupA(ulong hContext, const(char)* szGroupName);
int SCardForgetReaderGroupW(ulong hContext, const(wchar)* szGroupName);
int SCardIntroduceReaderA(ulong hContext, const(char)* szReaderName, const(char)* szDeviceName);
int SCardIntroduceReaderW(ulong hContext, const(wchar)* szReaderName, const(wchar)* szDeviceName);
int SCardForgetReaderA(ulong hContext, const(char)* szReaderName);
int SCardForgetReaderW(ulong hContext, const(wchar)* szReaderName);
int SCardAddReaderToGroupA(ulong hContext, const(char)* szReaderName, const(char)* szGroupName);
int SCardAddReaderToGroupW(ulong hContext, const(wchar)* szReaderName, const(wchar)* szGroupName);
int SCardRemoveReaderFromGroupA(ulong hContext, const(char)* szReaderName, const(char)* szGroupName);
int SCardRemoveReaderFromGroupW(ulong hContext, const(wchar)* szReaderName, const(wchar)* szGroupName);
int SCardIntroduceCardTypeA(ulong hContext, const(char)* szCardName, const(GUID)* pguidPrimaryProvider, const(GUID)* rgguidInterfaces, uint dwInterfaceCount, ubyte* pbAtr, ubyte* pbAtrMask, uint cbAtrLen);
int SCardIntroduceCardTypeW(ulong hContext, const(wchar)* szCardName, const(GUID)* pguidPrimaryProvider, const(GUID)* rgguidInterfaces, uint dwInterfaceCount, ubyte* pbAtr, ubyte* pbAtrMask, uint cbAtrLen);
int SCardSetCardTypeProviderNameA(ulong hContext, const(char)* szCardName, uint dwProviderId, const(char)* szProvider);
int SCardSetCardTypeProviderNameW(ulong hContext, const(wchar)* szCardName, uint dwProviderId, const(wchar)* szProvider);
int SCardForgetCardTypeA(ulong hContext, const(char)* szCardName);
int SCardForgetCardTypeW(ulong hContext, const(wchar)* szCardName);
int SCardFreeMemory(ulong hContext, const(void)* pvMem);
HANDLE SCardAccessStartedEvent();
void SCardReleaseStartedEvent();
int SCardLocateCardsA(ulong hContext, const(char)* mszCards, SCARD_READERSTATEA* rgReaderStates, uint cReaders);
int SCardLocateCardsW(ulong hContext, const(wchar)* mszCards, SCARD_READERSTATEW* rgReaderStates, uint cReaders);
int SCardLocateCardsByATRA(ulong hContext, SCARD_ATRMASK* rgAtrMasks, uint cAtrs, SCARD_READERSTATEA* rgReaderStates, uint cReaders);
int SCardLocateCardsByATRW(ulong hContext, SCARD_ATRMASK* rgAtrMasks, uint cAtrs, SCARD_READERSTATEW* rgReaderStates, uint cReaders);
int SCardGetStatusChangeA(ulong hContext, uint dwTimeout, SCARD_READERSTATEA* rgReaderStates, uint cReaders);
int SCardGetStatusChangeW(ulong hContext, uint dwTimeout, SCARD_READERSTATEW* rgReaderStates, uint cReaders);
int SCardCancel(ulong hContext);
int SCardConnectA(ulong hContext, const(char)* szReader, uint dwShareMode, uint dwPreferredProtocols, ulong* phCard, uint* pdwActiveProtocol);
int SCardConnectW(ulong hContext, const(wchar)* szReader, uint dwShareMode, uint dwPreferredProtocols, ulong* phCard, uint* pdwActiveProtocol);
int SCardReconnect(ulong hCard, uint dwShareMode, uint dwPreferredProtocols, uint dwInitialization, uint* pdwActiveProtocol);
int SCardDisconnect(ulong hCard, uint dwDisposition);
int SCardBeginTransaction(ulong hCard);
int SCardEndTransaction(ulong hCard, uint dwDisposition);
int SCardState(ulong hCard, uint* pdwState, uint* pdwProtocol, ubyte* pbAtr, uint* pcbAtrLen);
int SCardStatusA(ulong hCard, PSTR mszReaderNames, uint* pcchReaderLen, uint* pdwState, uint* pdwProtocol, ubyte* pbAtr, uint* pcbAtrLen);
int SCardStatusW(ulong hCard, PWSTR mszReaderNames, uint* pcchReaderLen, uint* pdwState, uint* pdwProtocol, ubyte* pbAtr, uint* pcbAtrLen);
int SCardTransmit(ulong hCard, SCARD_IO_REQUEST* pioSendPci, ubyte* pbSendBuffer, uint cbSendLength, SCARD_IO_REQUEST* pioRecvPci, ubyte* pbRecvBuffer, uint* pcbRecvLength);
int SCardGetTransmitCount(ulong hCard, uint* pcTransmitCount);
int SCardControl(ulong hCard, uint dwControlCode, const(void)* lpInBuffer, uint cbInBufferSize, void* lpOutBuffer, uint cbOutBufferSize, uint* lpBytesReturned);
int SCardGetAttrib(ulong hCard, uint dwAttrId, ubyte* pbAttr, uint* pcbAttrLen);
int SCardSetAttrib(ulong hCard, uint dwAttrId, ubyte* pbAttr, uint cbAttrLen);
int SCardUIDlgSelectCardA(OPENCARDNAME_EXA* param0);
int SCardUIDlgSelectCardW(OPENCARDNAME_EXW* param0);
int GetOpenCardNameA(OPENCARDNAMEA* param0);
int GetOpenCardNameW(OPENCARDNAMEW* param0);
int SCardDlgExtendedError();
int SCardReadCacheA(ulong hContext, GUID* CardIdentifier, uint FreshnessCounter, PSTR LookupName, ubyte* Data, uint* DataLen);
int SCardReadCacheW(ulong hContext, GUID* CardIdentifier, uint FreshnessCounter, PWSTR LookupName, ubyte* Data, uint* DataLen);
int SCardWriteCacheA(ulong hContext, GUID* CardIdentifier, uint FreshnessCounter, PSTR LookupName, ubyte* Data, uint DataLen);
int SCardWriteCacheW(ulong hContext, GUID* CardIdentifier, uint FreshnessCounter, PWSTR LookupName, ubyte* Data, uint DataLen);
int SCardGetReaderIconA(ulong hContext, const(char)* szReaderName, ubyte* pbIcon, uint* pcbIcon);
int SCardGetReaderIconW(ulong hContext, const(wchar)* szReaderName, ubyte* pbIcon, uint* pcbIcon);
int SCardGetDeviceTypeIdA(ulong hContext, const(char)* szReaderName, uint* pdwDeviceTypeId);
int SCardGetDeviceTypeIdW(ulong hContext, const(wchar)* szReaderName, uint* pdwDeviceTypeId);
int SCardGetReaderDeviceInstanceIdA(ulong hContext, const(char)* szReaderName, PSTR szDeviceInstanceId, uint* pcchDeviceInstanceId);
int SCardGetReaderDeviceInstanceIdW(ulong hContext, const(wchar)* szReaderName, PWSTR szDeviceInstanceId, uint* pcchDeviceInstanceId);
int SCardListReadersWithDeviceInstanceIdA(ulong hContext, const(char)* szDeviceInstanceId, PSTR mszReaders, uint* pcchReaders);
int SCardListReadersWithDeviceInstanceIdW(ulong hContext, const(wchar)* szDeviceInstanceId, PWSTR mszReaders, uint* pcchReaders);
int SCardAudit(ulong hContext, uint dwEvent);
enum CRED_MAX_CREDENTIAL_BLOB_SIZE = 0x00000a00;
enum CRED_MAX_USERNAME_LENGTH = 0x00000201;
enum CRED_MAX_DOMAIN_TARGET_NAME_LENGTH = 0x00000151;
enum FILE_DEVICE_SMARTCARD = 0x00000031;
enum GUID_DEVINTERFACE_SMARTCARD_READER = GUID(0x50dd5230, 0xba8a, 0x11d1, [0xbf, 0x5d, 0x0, 0x0, 0xf8, 0x5, 0xf5, 0x30]);
enum SCARD_ATR_LENGTH = 0x00000021;
enum SCARD_PROTOCOL_UNDEFINED = 0x00000000;
enum SCARD_PROTOCOL_T0 = 0x00000001;
enum SCARD_PROTOCOL_T1 = 0x00000002;
enum SCARD_PROTOCOL_RAW = 0x00010000;
enum SCARD_PROTOCOL_DEFAULT = 0x80000000;
enum SCARD_PROTOCOL_OPTIMAL = 0x00000000;
enum SCARD_POWER_DOWN = 0x00000000;
enum SCARD_COLD_RESET = 0x00000001;
enum SCARD_WARM_RESET = 0x00000002;
enum MAXIMUM_ATTR_STRING_LENGTH = 0x00000020;
enum MAXIMUM_SMARTCARD_READERS = 0x0000000a;
enum SCARD_CLASS_VENDOR_INFO = 0x00000001;
enum SCARD_CLASS_COMMUNICATIONS = 0x00000002;
enum SCARD_CLASS_PROTOCOL = 0x00000003;
enum SCARD_CLASS_POWER_MGMT = 0x00000004;
enum SCARD_CLASS_SECURITY = 0x00000005;
enum SCARD_CLASS_MECHANICAL = 0x00000006;
enum SCARD_CLASS_VENDOR_DEFINED = 0x00000007;
enum SCARD_CLASS_IFD_PROTOCOL = 0x00000008;
enum SCARD_CLASS_ICC_STATE = 0x00000009;
enum SCARD_CLASS_PERF = 0x00007ffe;
enum SCARD_CLASS_SYSTEM = 0x00007fff;
enum SCARD_T0_HEADER_LENGTH = 0x00000007;
enum SCARD_T0_CMD_LENGTH = 0x00000005;
enum SCARD_T1_PROLOGUE_LENGTH = 0x00000003;
enum SCARD_T1_EPILOGUE_LENGTH = 0x00000002;
enum SCARD_T1_EPILOGUE_LENGTH_LRC = 0x00000001;
enum SCARD_T1_MAX_IFS = 0x000000fe;
enum SCARD_UNKNOWN = 0x00000000;
enum SCARD_ABSENT = 0x00000001;
enum SCARD_PRESENT = 0x00000002;
enum SCARD_SWALLOWED = 0x00000003;
enum SCARD_POWERED = 0x00000004;
enum SCARD_NEGOTIABLE = 0x00000005;
enum SCARD_SPECIFIC = 0x00000006;
enum SCARD_READER_SWALLOWS = 0x00000001;
enum SCARD_READER_EJECTS = 0x00000002;
enum SCARD_READER_CONFISCATES = 0x00000004;
enum SCARD_READER_CONTACTLESS = 0x00000008;
enum SCARD_READER_TYPE_SERIAL = 0x00000001;
enum SCARD_READER_TYPE_PARALELL = 0x00000002;
enum SCARD_READER_TYPE_KEYBOARD = 0x00000004;
enum SCARD_READER_TYPE_SCSI = 0x00000008;
enum SCARD_READER_TYPE_IDE = 0x00000010;
enum SCARD_READER_TYPE_USB = 0x00000020;
enum SCARD_READER_TYPE_PCMCIA = 0x00000040;
enum SCARD_READER_TYPE_TPM = 0x00000080;
enum SCARD_READER_TYPE_NFC = 0x00000100;
enum SCARD_READER_TYPE_UICC = 0x00000200;
enum SCARD_READER_TYPE_NGC = 0x00000400;
enum SCARD_READER_TYPE_EMBEDDEDSE = 0x00000800;
enum SCARD_READER_TYPE_VENDOR = 0x000000f0;
enum STATUS_LOGON_FAILURE = 0xffffffffc000006d;
enum STATUS_WRONG_PASSWORD = 0xffffffffc000006a;
enum STATUS_PASSWORD_EXPIRED = 0xffffffffc0000071;
enum STATUS_PASSWORD_MUST_CHANGE = 0xffffffffc0000224;
enum STATUS_DOWNGRADE_DETECTED = 0xffffffffc0000388;
enum STATUS_AUTHENTICATION_FIREWALL_FAILED = 0xffffffffc0000413;
enum STATUS_ACCOUNT_DISABLED = 0xffffffffc0000072;
enum STATUS_ACCOUNT_RESTRICTION = 0xffffffffc000006e;
enum STATUS_ACCOUNT_LOCKED_OUT = 0xffffffffc0000234;
enum STATUS_ACCOUNT_EXPIRED = 0xffffffffc0000193;
enum STATUS_LOGON_TYPE_NOT_GRANTED = 0xffffffffc000015b;
enum STATUS_NO_SUCH_LOGON_SESSION = 0xffffffffc000005f;
enum STATUS_NO_SUCH_USER = 0xffffffffc0000064;
enum CRED_MAX_STRING_LENGTH = 0x00000100;
enum CRED_MAX_GENERIC_TARGET_NAME_LENGTH = 0x00007fff;
enum CRED_MAX_TARGETNAME_NAMESPACE_LENGTH = 0x00000100;
enum CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH = 0x00000100;
enum CRED_MAX_VALUE_SIZE = 0x00000100;
enum CRED_MAX_ATTRIBUTES = 0x00000040;
enum CRED_SESSION_WILDCARD_NAME_W = "*Session";
enum CRED_SESSION_WILDCARD_NAME_A = "*Session";
enum CRED_TARGETNAME_DOMAIN_NAMESPACE_W = "Domain";
enum CRED_TARGETNAME_DOMAIN_NAMESPACE_A = "Domain";
enum CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W = "LegacyGeneric";
enum CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A = "LegacyGeneric";
enum CRED_TARGETNAME_ATTRIBUTE_TARGET_W = "target";
enum CRED_TARGETNAME_ATTRIBUTE_TARGET_A = "target";
enum CRED_TARGETNAME_ATTRIBUTE_NAME_W = "name";
enum CRED_TARGETNAME_ATTRIBUTE_NAME_A = "name";
enum CRED_TARGETNAME_ATTRIBUTE_BATCH_W = "batch";
enum CRED_TARGETNAME_ATTRIBUTE_BATCH_A = "batch";
enum CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W = "interactive";
enum CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A = "interactive";
enum CRED_TARGETNAME_ATTRIBUTE_SERVICE_W = "service";
enum CRED_TARGETNAME_ATTRIBUTE_SERVICE_A = "service";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORK_W = "network";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORK_A = "network";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W = "networkcleartext";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A = "networkcleartext";
enum CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W = "remoteinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A = "remoteinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W = "cachedinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A = "cachedinteractive";
enum CRED_SESSION_WILDCARD_NAME = "*Session";
enum CRED_TARGETNAME_DOMAIN_NAMESPACE = "Domain";
enum CRED_TARGETNAME_ATTRIBUTE_NAME = "name";
enum CRED_TARGETNAME_ATTRIBUTE_TARGET = "target";
enum CRED_TARGETNAME_ATTRIBUTE_BATCH = "batch";
enum CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE = "interactive";
enum CRED_TARGETNAME_ATTRIBUTE_SERVICE = "service";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORK = "network";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT = "networkcleartext";
enum CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE = "remoteinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE = "cachedinteractive";
enum CRED_LOGON_TYPES_MASK = 0x0000f000;
enum CRED_TI_SERVER_FORMAT_UNKNOWN = 0x00000001;
enum CRED_TI_DOMAIN_FORMAT_UNKNOWN = 0x00000002;
enum CRED_TI_ONLY_PASSWORD_REQUIRED = 0x00000004;
enum CRED_TI_USERNAME_TARGET = 0x00000008;
enum CRED_TI_CREATE_EXPLICIT_CRED = 0x00000010;
enum CRED_TI_WORKGROUP_MEMBER = 0x00000020;
enum CRED_TI_DNSTREE_IS_DFS_SERVER = 0x00000040;
enum CRED_TI_VALID_FLAGS = 0x0000f07f;
enum CERT_HASH_LENGTH = 0x00000014;
enum CREDUI_MAX_MESSAGE_LENGTH = 0x00000400;
enum CREDUI_MAX_CAPTION_LENGTH = 0x00000080;
enum CREDUI_MAX_GENERIC_TARGET_LENGTH = 0x00007fff;
enum CREDUI_MAX_DOMAIN_TARGET_LENGTH = 0x00000151;
enum CREDUI_MAX_USERNAME_LENGTH = 0x00000201;
enum CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME = 0x00040000;
enum CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD = 0x80000000;
enum CRED_PRESERVE_CREDENTIAL_BLOB = 0x00000001;
enum CRED_CACHE_TARGET_INFORMATION = 0x00000001;
enum CRED_ALLOW_NAME_RESOLUTION = 0x00000001;
enum CRED_PROTECT_AS_SELF = 0x00000001;
enum CRED_PROTECT_TO_SYSTEM = 0x00000002;
enum CRED_UNPROTECT_AS_SELF = 0x00000001;
enum CRED_UNPROTECT_ALLOW_TO_SYSTEM = 0x00000002;
enum SCARD_SCOPE_TERMINAL = 0x00000001;
enum SCARD_ALL_READERS = "SCard$AllReaders\000";
enum SCARD_DEFAULT_READERS = "SCard$DefaultReaders\000";
enum SCARD_LOCAL_READERS = "SCard$LocalReaders\000";
enum SCARD_SYSTEM_READERS = "SCard$SystemReaders\000";
enum SCARD_PROVIDER_PRIMARY = 0x00000001;
enum SCARD_PROVIDER_CSP = 0x00000002;
enum SCARD_PROVIDER_KSP = 0x00000003;
enum SCARD_STATE_UNPOWERED = 0x00000400;
enum SCARD_SHARE_EXCLUSIVE = 0x00000001;
enum SCARD_SHARE_SHARED = 0x00000002;
enum SCARD_SHARE_DIRECT = 0x00000003;
enum SCARD_LEAVE_CARD = 0x00000000;
enum SCARD_RESET_CARD = 0x00000001;
enum SCARD_UNPOWER_CARD = 0x00000002;
enum SCARD_EJECT_CARD = 0x00000003;
enum SC_DLG_MINIMAL_UI = 0x00000001;
enum SC_DLG_NO_UI = 0x00000002;
enum SC_DLG_FORCE_UI = 0x00000004;
enum SCERR_NOCARDNAME = 0x00004000;
enum SCERR_NOGUIDS = 0x00008000;
enum SCARD_AUDIT_CHV_FAILURE = 0x00000000;
enum SCARD_AUDIT_CHV_SUCCESS = 0x00000001;
enum CREDSSP_NAME = "CREDSSP";
enum TS_SSP_NAME_A = "TSSSP";
enum TS_SSP_NAME = "TSSSP";
enum szOID_TS_KP_TS_SERVER_AUTH = "1.3.6.1.4.1.311.54.1.2";
enum CREDSSP_SERVER_AUTH_NEGOTIATE = 0x00000001;
enum CREDSSP_SERVER_AUTH_CERTIFICATE = 0x00000002;
enum CREDSSP_SERVER_AUTH_LOOPBACK = 0x00000004;
enum SECPKG_ALT_ATTR = 0x80000000;
enum SECPKG_ATTR_C_FULL_IDENT_TOKEN = 0x80000085;
enum CREDSSP_CRED_EX_VERSION = 0x00000000;
enum CREDSSP_FLAG_REDIRECT = 0x00000001;
alias KeyCredentialManagerOperationErrorStates = int;
enum : int
{
    KeyCredentialManagerOperationErrorStateNone                 = 0x00000000,
    KeyCredentialManagerOperationErrorStateDeviceJoinFailure    = 0x00000001,
    KeyCredentialManagerOperationErrorStateTokenFailure         = 0x00000002,
    KeyCredentialManagerOperationErrorStateCertificateFailure   = 0x00000004,
    KeyCredentialManagerOperationErrorStateRemoteSessionFailure = 0x00000008,
    KeyCredentialManagerOperationErrorStatePolicyFailure        = 0x00000010,
    KeyCredentialManagerOperationErrorStateHardwareFailure      = 0x00000020,
    KeyCredentialManagerOperationErrorStatePinExistsFailure     = 0x00000040,
}

alias KeyCredentialManagerOperationType = int;
enum : int
{
    KeyCredentialManagerProvisioning = 0x00000000,
    KeyCredentialManagerPinChange    = 0x00000001,
    KeyCredentialManagerPinReset     = 0x00000002,
}

struct KeyCredentialManagerInfo
{
    GUID containerId;
}
struct SecHandle
{
    ulong dwLower;
    ulong dwUpper;
}
struct CREDENTIAL_ATTRIBUTEA
{
    PSTR Keyword;
    uint Flags;
    uint ValueSize;
    ubyte* Value;
}
struct CREDENTIAL_ATTRIBUTEW
{
    PWSTR Keyword;
    uint Flags;
    uint ValueSize;
    ubyte* Value;
}
struct CREDENTIALA
{
    CRED_FLAGS Flags;
    CRED_TYPE Type;
    PSTR TargetName;
    PSTR Comment;
    FILETIME LastWritten;
    uint CredentialBlobSize;
    ubyte* CredentialBlob;
    CRED_PERSIST Persist;
    uint AttributeCount;
    CREDENTIAL_ATTRIBUTEA* Attributes;
    PSTR TargetAlias;
    PSTR UserName;
}
struct CREDENTIALW
{
    CRED_FLAGS Flags;
    CRED_TYPE Type;
    PWSTR TargetName;
    PWSTR Comment;
    FILETIME LastWritten;
    uint CredentialBlobSize;
    ubyte* CredentialBlob;
    CRED_PERSIST Persist;
    uint AttributeCount;
    CREDENTIAL_ATTRIBUTEW* Attributes;
    PWSTR TargetAlias;
    PWSTR UserName;
}
struct CREDENTIAL_TARGET_INFORMATIONA
{
    PSTR TargetName;
    PSTR NetbiosServerName;
    PSTR DnsServerName;
    PSTR NetbiosDomainName;
    PSTR DnsDomainName;
    PSTR DnsTreeName;
    PSTR PackageName;
    uint Flags;
    uint CredTypeCount;
    uint* CredTypes;
}
struct CREDENTIAL_TARGET_INFORMATIONW
{
    PWSTR TargetName;
    PWSTR NetbiosServerName;
    PWSTR DnsServerName;
    PWSTR NetbiosDomainName;
    PWSTR DnsDomainName;
    PWSTR DnsTreeName;
    PWSTR PackageName;
    uint Flags;
    uint CredTypeCount;
    uint* CredTypes;
}
struct CERT_CREDENTIAL_INFO
{
    uint cbSize;
    ubyte[20] rgbHashOfCert;
}
struct USERNAME_TARGET_CREDENTIAL_INFO
{
    PWSTR UserName;
}
struct BINARY_BLOB_CREDENTIAL_INFO
{
    uint cbBlob;
    ubyte* pbBlob;
}
alias CRED_MARSHAL_TYPE = int;
enum : int
{
    CertCredential               = 0x00000001,
    UsernameTargetCredential     = 0x00000002,
    BinaryBlobCredential         = 0x00000003,
    UsernameForPackedCredentials = 0x00000004,
    BinaryBlobForSystem          = 0x00000005,
}

alias CRED_PROTECTION_TYPE = int;
enum : int
{
    CredUnprotected         = 0x00000000,
    CredUserProtection      = 0x00000001,
    CredTrustedProtection   = 0x00000002,
    CredForSystemProtection = 0x00000003,
}

struct CREDUI_INFOA
{
    uint cbSize;
    HWND hwndParent;
    const(char)* pszMessageText;
    const(char)* pszCaptionText;
    HBITMAP hbmBanner;
}
struct CREDUI_INFOW
{
    uint cbSize;
    HWND hwndParent;
    const(wchar)* pszMessageText;
    const(wchar)* pszCaptionText;
    HBITMAP hbmBanner;
}
struct SCARD_IO_REQUEST
{
    uint dwProtocol;
    uint cbPciLength;
}
struct SCARD_T0_COMMAND
{
    ubyte bCla;
    ubyte bIns;
    ubyte bP1;
    ubyte bP2;
    ubyte bP3;
}
struct SCARD_T0_REQUEST
{
    SCARD_IO_REQUEST ioRequest;
    ubyte bSw1;
    ubyte bSw2;
    union
    {
        SCARD_T0_COMMAND CmdBytes;
        ubyte[5] rgbHeader;
    }
}
struct SCARD_T1_REQUEST
{
    SCARD_IO_REQUEST ioRequest;
}
struct SCARD_READERSTATEA
{
    const(char)* szReader;
    void* pvUserData;
    SCARD_STATE dwCurrentState;
    SCARD_STATE dwEventState;
    uint cbAtr;
    ubyte[36] rgbAtr;
}
struct SCARD_READERSTATEW
{
    const(wchar)* szReader;
    void* pvUserData;
    SCARD_STATE dwCurrentState;
    SCARD_STATE dwEventState;
    uint cbAtr;
    ubyte[36] rgbAtr;
}
struct SCARD_ATRMASK
{
    uint cbAtr;
    ubyte[36] rgbAtr;
    ubyte[36] rgbMask;
}
alias LPOCNCONNPROCA = ulong function(ulong param0, PSTR param1, PSTR param2, void* param3);
alias LPOCNCONNPROCW = ulong function(ulong param0, PWSTR param1, PWSTR param2, void* param3);
alias LPOCNCHKPROC = BOOL function(ulong param0, ulong param1, void* param2);
alias LPOCNDSCPROC = void function(ulong param0, ulong param1, void* param2);
struct OPENCARD_SEARCH_CRITERIAA
{
    uint dwStructSize;
    PSTR lpstrGroupNames;
    uint nMaxGroupNames;
    const(GUID)* rgguidInterfaces;
    uint cguidInterfaces;
    PSTR lpstrCardNames;
    uint nMaxCardNames;
    LPOCNCHKPROC lpfnCheck;
    LPOCNCONNPROCA lpfnConnect;
    LPOCNDSCPROC lpfnDisconnect;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
}
struct OPENCARD_SEARCH_CRITERIAW
{
    uint dwStructSize;
    PWSTR lpstrGroupNames;
    uint nMaxGroupNames;
    const(GUID)* rgguidInterfaces;
    uint cguidInterfaces;
    PWSTR lpstrCardNames;
    uint nMaxCardNames;
    LPOCNCHKPROC lpfnCheck;
    LPOCNCONNPROCW lpfnConnect;
    LPOCNDSCPROC lpfnDisconnect;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
}
struct OPENCARDNAME_EXA
{
    uint dwStructSize;
    ulong hSCardContext;
    HWND hwndOwner;
    uint dwFlags;
    const(char)* lpstrTitle;
    const(char)* lpstrSearchDesc;
    HICON hIcon;
    OPENCARD_SEARCH_CRITERIAA* pOpenCardSearchCriteria;
    LPOCNCONNPROCA lpfnConnect;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
    PSTR lpstrRdr;
    uint nMaxRdr;
    PSTR lpstrCard;
    uint nMaxCard;
    uint dwActiveProtocol;
    ulong hCardHandle;
}
struct OPENCARDNAME_EXW
{
    uint dwStructSize;
    ulong hSCardContext;
    HWND hwndOwner;
    uint dwFlags;
    const(wchar)* lpstrTitle;
    const(wchar)* lpstrSearchDesc;
    HICON hIcon;
    OPENCARD_SEARCH_CRITERIAW* pOpenCardSearchCriteria;
    LPOCNCONNPROCW lpfnConnect;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
    PWSTR lpstrRdr;
    uint nMaxRdr;
    PWSTR lpstrCard;
    uint nMaxCard;
    uint dwActiveProtocol;
    ulong hCardHandle;
}
alias READER_SEL_REQUEST_MATCH_TYPE = int;
enum : int
{
    RSR_MATCH_TYPE_READER_AND_CONTAINER = 0x00000001,
    RSR_MATCH_TYPE_SERIAL_NUMBER        = 0x00000002,
    RSR_MATCH_TYPE_ALL_CARDS            = 0x00000003,
}

struct READER_SEL_REQUEST
{
    uint dwShareMode;
    uint dwPreferredProtocols;
    READER_SEL_REQUEST_MATCH_TYPE MatchType;
    union
    {
        struct ReaderAndContainerParameter
        {
            uint cbReaderNameOffset;
            uint cchReaderNameLength;
            uint cbContainerNameOffset;
            uint cchContainerNameLength;
            uint dwDesiredCardModuleVersion;
            uint dwCspFlags;
        }
        struct SerialNumberParameter
        {
            uint cbSerialNumberOffset;
            uint cbSerialNumberLength;
            uint dwDesiredCardModuleVersion;
        }
    }
}
struct READER_SEL_RESPONSE
{
    uint cbReaderNameOffset;
    uint cchReaderNameLength;
    uint cbCardNameOffset;
    uint cchCardNameLength;
}
struct OPENCARDNAMEA
{
    uint dwStructSize;
    HWND hwndOwner;
    ulong hSCardContext;
    PSTR lpstrGroupNames;
    uint nMaxGroupNames;
    PSTR lpstrCardNames;
    uint nMaxCardNames;
    const(GUID)* rgguidInterfaces;
    uint cguidInterfaces;
    PSTR lpstrRdr;
    uint nMaxRdr;
    PSTR lpstrCard;
    uint nMaxCard;
    const(char)* lpstrTitle;
    uint dwFlags;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
    uint dwActiveProtocol;
    LPOCNCONNPROCA lpfnConnect;
    LPOCNCHKPROC lpfnCheck;
    LPOCNDSCPROC lpfnDisconnect;
    ulong hCardHandle;
}
struct OPENCARDNAMEW
{
    uint dwStructSize;
    HWND hwndOwner;
    ulong hSCardContext;
    PWSTR lpstrGroupNames;
    uint nMaxGroupNames;
    PWSTR lpstrCardNames;
    uint nMaxCardNames;
    const(GUID)* rgguidInterfaces;
    uint cguidInterfaces;
    PWSTR lpstrRdr;
    uint nMaxRdr;
    PWSTR lpstrCard;
    uint nMaxCard;
    const(wchar)* lpstrTitle;
    uint dwFlags;
    void* pvUserData;
    uint dwShareMode;
    uint dwPreferredProtocols;
    uint dwActiveProtocol;
    LPOCNCONNPROCW lpfnConnect;
    LPOCNCHKPROC lpfnCheck;
    LPOCNDSCPROC lpfnDisconnect;
    ulong hCardHandle;
}
struct SecPkgContext_ClientCreds
{
    uint AuthBufferLen;
    ubyte* AuthBuffer;
}
alias CREDSPP_SUBMIT_TYPE = int;
enum : int
{
    CredsspPasswordCreds       = 0x00000002,
    CredsspSchannelCreds       = 0x00000004,
    CredsspCertificateCreds    = 0x0000000d,
    CredsspSubmitBufferBoth    = 0x00000032,
    CredsspSubmitBufferBothOld = 0x00000033,
    CredsspCredEx              = 0x00000064,
}

struct CREDSSP_CRED
{
    CREDSPP_SUBMIT_TYPE Type;
    void* pSchannelCred;
    void* pSpnegoCred;
}
struct CREDSSP_CRED_EX
{
    CREDSPP_SUBMIT_TYPE Type;
    uint Version;
    uint Flags;
    uint Reserved;
    CREDSSP_CRED Cred;
}
