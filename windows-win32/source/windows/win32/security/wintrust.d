module windows.win32.security.wintrust;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, HANDLE, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.security.cryptography : CERT_CHAIN_CONTEXT, CERT_CHAIN_ELEMENT, CERT_CHAIN_PARA, CERT_CONTEXT, CERT_INFO, CERT_STRONG_SIGN_PARA, CERT_USAGE_MATCH, CMSG_SIGNER_INFO, CRYPT_ALGORITHM_IDENTIFIER, CRYPT_ATTRIBUTE_TYPE_VALUE, CRYPT_BIT_BLOB, CRYPT_INTEGER_BLOB, CTL_CONTEXT, HCERTCHAINENGINE, HCERTSTORE;
import windows.win32.security.cryptography.sip : SIP_DISPATCH_INFO, SIP_INDIRECT_DATA, SIP_SUBJECTINFO;

version (Windows):
extern (Windows):

alias WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION = uint;
enum : uint
{
    DWACTION_ALLOCANDFILL = 0x00000001,
    DWACTION_FREE         = 0x00000002,
}

alias WINTRUST_POLICY_FLAGS = uint;
enum : uint
{
    WTPF_TRUSTTEST            = 0x00000020,
    WTPF_TESTCANBEVALID       = 0x00000080,
    WTPF_IGNOREEXPIRATION     = 0x00000100,
    WTPF_IGNOREREVOKATION     = 0x00000200,
    WTPF_OFFLINEOK_IND        = 0x00000400,
    WTPF_OFFLINEOK_COM        = 0x00000800,
    WTPF_OFFLINEOKNBU_IND     = 0x00001000,
    WTPF_OFFLINEOKNBU_COM     = 0x00002000,
    WTPF_VERIFY_V1_OFF        = 0x00010000,
    WTPF_IGNOREREVOCATIONONTS = 0x00020000,
    WTPF_ALLOWONLYPERTRUST    = 0x00040000,
}

alias WINTRUST_DATA_PROVIDER_FLAGS = uint;
enum : uint
{
    WTD_USE_IE4_TRUST_FLAG                  = 0x00000001,
    WTD_NO_IE4_CHAIN_FLAG                   = 0x00000002,
    WTD_NO_POLICY_USAGE_FLAG                = 0x00000004,
    WTD_REVOCATION_CHECK_NONE               = 0x00000010,
    WTD_REVOCATION_CHECK_END_CERT           = 0x00000020,
    WTD_REVOCATION_CHECK_CHAIN              = 0x00000040,
    WTD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x00000080,
    WTD_SAFER_FLAG                          = 0x00000100,
    WTD_HASH_ONLY_FLAG                      = 0x00000200,
    WTD_USE_DEFAULT_OSVER_CHECK             = 0x00000400,
    WTD_LIFETIME_SIGNING_FLAG               = 0x00000800,
    WTD_CACHE_ONLY_URL_RETRIEVAL            = 0x00001000,
    WTD_DISABLE_MD2_MD4                     = 0x00002000,
    WTD_MOTW                                = 0x00004000,
}

alias WINTRUST_DATA_UICHOICE = uint;
enum : uint
{
    WTD_UI_ALL    = 0x00000001,
    WTD_UI_NONE   = 0x00000002,
    WTD_UI_NOBAD  = 0x00000003,
    WTD_UI_NOGOOD = 0x00000004,
}

alias WINTRUST_SIGNATURE_SETTINGS_FLAGS = uint;
enum : uint
{
    WSS_VERIFY_SPECIFIC         = 0x00000001,
    WSS_GET_SECONDARY_SIG_COUNT = 0x00000002,
}

alias WINTRUST_DATA_STATE_ACTION = uint;
enum : uint
{
    WTD_STATEACTION_IGNORE           = 0x00000000,
    WTD_STATEACTION_VERIFY           = 0x00000001,
    WTD_STATEACTION_CLOSE            = 0x00000002,
    WTD_STATEACTION_AUTO_CACHE       = 0x00000003,
    WTD_STATEACTION_AUTO_CACHE_FLUSH = 0x00000004,
}

alias WINTRUST_DATA_UNION_CHOICE = uint;
enum : uint
{
    WTD_CHOICE_FILE    = 0x00000001,
    WTD_CHOICE_CATALOG = 0x00000002,
    WTD_CHOICE_BLOB    = 0x00000003,
    WTD_CHOICE_SIGNER  = 0x00000004,
    WTD_CHOICE_CERT    = 0x00000005,
}

alias WINTRUST_DATA_REVOCATION_CHECKS = uint;
enum : uint
{
    WTD_REVOKE_NONE       = 0x00000000,
    WTD_REVOKE_WHOLECHAIN = 0x00000001,
}

alias WINTRUST_DATA_UICONTEXT = uint;
enum : uint
{
    WTD_UICONTEXT_EXECUTE = 0x00000000,
    WTD_UICONTEXT_INSTALL = 0x00000001,
}

int WinVerifyTrust(HWND, GUID*, void*);
int WinVerifyTrustEx(HWND, GUID*, WINTRUST_DATA*);
void WintrustGetRegPolicyFlags(WINTRUST_POLICY_FLAGS*);
BOOL WintrustSetRegPolicyFlags(WINTRUST_POLICY_FLAGS);
BOOL WintrustAddActionID(GUID*, uint, CRYPT_REGISTER_ACTIONID*);
BOOL WintrustRemoveActionID(GUID*);
BOOL WintrustLoadFunctionPointers(GUID*, CRYPT_PROVIDER_FUNCTIONS*);
BOOL WintrustAddDefaultForUsage(const(char)*, CRYPT_PROVIDER_REGDEFUSAGE*);
BOOL WintrustGetDefaultForUsage(WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION, const(char)*, CRYPT_PROVIDER_DEFUSAGE*);
CRYPT_PROVIDER_SGNR* WTHelperGetProvSignerFromChain(CRYPT_PROVIDER_DATA*, uint, BOOL, uint);
CRYPT_PROVIDER_CERT* WTHelperGetProvCertFromChain(CRYPT_PROVIDER_SGNR*, uint);
CRYPT_PROVIDER_DATA* WTHelperProvDataFromStateData(HANDLE);
CRYPT_PROVIDER_PRIVDATA* WTHelperGetProvPrivateDataFromChain(CRYPT_PROVIDER_DATA*, GUID*);
BOOL WTHelperCertIsSelfSigned(uint, CERT_INFO*);
HRESULT WTHelperCertCheckValidSignature(CRYPT_PROVIDER_DATA*);
BOOL OpenPersonalTrustDBDialogEx(HWND, uint, void**);
BOOL OpenPersonalTrustDBDialog(HWND);
void WintrustSetDefaultIncludePEPageHashes(BOOL);
enum WINTRUST_CONFIG_REGPATH = "Software\\Microsoft\\Cryptography\\Wintrust\\Config";
enum WINTRUST_MAX_HEADER_BYTES_TO_MAP_VALUE_NAME = "MaxHeaderBytesToMap";
enum WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT = 0x00a00000;
enum WINTRUST_MAX_HASH_BYTES_TO_MAP_VALUE_NAME = "MaxHashBytesToMap";
enum WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT = 0x00100000;
enum WTD_PROV_FLAGS_MASK = 0x0000ffff;
enum WTD_CODE_INTEGRITY_DRIVER_MODE = 0x00008000;
enum WSS_VERIFY_SEALING = 0x00000004;
enum WSS_INPUT_FLAG_MASK = 0x00000007;
enum WSS_OUT_SEALING_STATUS_VERIFIED = 0x80000000;
enum WSS_OUT_HAS_SEALING_INTENT = 0x40000000;
enum WSS_OUT_FILE_SUPPORTS_SEAL = 0x20000000;
enum WSS_OUTPUT_FLAG_MASK = 0xe0000000;
enum WTCI_DONT_OPEN_STORES = 0x00000001;
enum WTCI_OPEN_ONLY_ROOT = 0x00000002;
enum WTCI_USE_LOCAL_MACHINE = 0x00000004;
enum TRUSTERROR_STEP_WVTPARAMS = 0x00000000;
enum TRUSTERROR_STEP_FILEIO = 0x00000002;
enum TRUSTERROR_STEP_SIP = 0x00000003;
enum TRUSTERROR_STEP_SIPSUBJINFO = 0x00000005;
enum TRUSTERROR_STEP_CATALOGFILE = 0x00000006;
enum TRUSTERROR_STEP_CERTSTORE = 0x00000007;
enum TRUSTERROR_STEP_MESSAGE = 0x00000008;
enum TRUSTERROR_STEP_MSG_SIGNERCOUNT = 0x00000009;
enum TRUSTERROR_STEP_MSG_INNERCNTTYPE = 0x0000000a;
enum TRUSTERROR_STEP_MSG_INNERCNT = 0x0000000b;
enum TRUSTERROR_STEP_MSG_STORE = 0x0000000c;
enum TRUSTERROR_STEP_MSG_SIGNERINFO = 0x0000000d;
enum TRUSTERROR_STEP_MSG_SIGNERCERT = 0x0000000e;
enum TRUSTERROR_STEP_MSG_CERTCHAIN = 0x0000000f;
enum TRUSTERROR_STEP_MSG_COUNTERSIGINFO = 0x00000010;
enum TRUSTERROR_STEP_MSG_COUNTERSIGCERT = 0x00000011;
enum TRUSTERROR_STEP_VERIFY_MSGHASH = 0x00000012;
enum TRUSTERROR_STEP_VERIFY_MSGINDIRECTDATA = 0x00000013;
enum TRUSTERROR_STEP_FINAL_WVTINIT = 0x0000001e;
enum TRUSTERROR_STEP_FINAL_INITPROV = 0x0000001f;
enum TRUSTERROR_STEP_FINAL_OBJPROV = 0x00000020;
enum TRUSTERROR_STEP_FINAL_SIGPROV = 0x00000021;
enum TRUSTERROR_STEP_FINAL_CERTPROV = 0x00000022;
enum TRUSTERROR_STEP_FINAL_CERTCHKPROV = 0x00000023;
enum TRUSTERROR_STEP_FINAL_POLICYPROV = 0x00000024;
enum TRUSTERROR_STEP_FINAL_UIPROV = 0x00000025;
enum TRUSTERROR_MAX_STEPS = 0x00000026;
enum CPD_CHOICE_SIP = 0x00000001;
enum CPD_USE_NT5_CHAIN_FLAG = 0x80000000;
enum CPD_REVOCATION_CHECK_NONE = 0x00010000;
enum CPD_REVOCATION_CHECK_END_CERT = 0x00020000;
enum CPD_REVOCATION_CHECK_CHAIN = 0x00040000;
enum CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x00080000;
enum CPD_RETURN_LOWER_QUALITY_CHAINS = 0x00100000;
enum CPD_RFC3161v21 = 0x00200000;
enum CPD_UISTATE_MODE_PROMPT = 0x00000000;
enum CPD_UISTATE_MODE_BLOCK = 0x00000001;
enum CPD_UISTATE_MODE_ALLOW = 0x00000002;
enum CPD_UISTATE_MODE_MASK = 0x00000003;
enum WSS_OBJTRUST_SUPPORT = 0x00000001;
enum WSS_SIGTRUST_SUPPORT = 0x00000002;
enum WSS_CERTTRUST_SUPPORT = 0x00000004;
enum SGNR_TYPE_TIMESTAMP = 0x00000010;
enum CERT_CONFIDENCE_SIG = 0x10000000;
enum CERT_CONFIDENCE_TIME = 0x01000000;
enum CERT_CONFIDENCE_TIMENEST = 0x00100000;
enum CERT_CONFIDENCE_AUTHIDEXT = 0x00010000;
enum CERT_CONFIDENCE_HYGIENE = 0x00001000;
enum CERT_CONFIDENCE_HIGHEST = 0x11111000;
enum WT_CURRENT_VERSION = 0x00000200;
enum WT_PROVIDER_DLL_NAME = "WINTRUST.DLL";
enum WT_PROVIDER_CERTTRUST_FUNCTION = "WintrustCertificateTrust";
enum WT_ADD_ACTION_ID_RET_RESULT_FLAG = 0x00000001;
enum szOID_TRUSTED_CODESIGNING_CA_LIST = "1.3.6.1.4.1.311.2.2.1";
enum szOID_TRUSTED_CLIENT_AUTH_CA_LIST = "1.3.6.1.4.1.311.2.2.2";
enum szOID_TRUSTED_SERVER_AUTH_CA_LIST = "1.3.6.1.4.1.311.2.2.3";
enum SPC_COMMON_NAME_OBJID = "2.5.4.3";
enum SPC_TIME_STAMP_REQUEST_OBJID = "1.3.6.1.4.1.311.3.2.1";
enum SPC_INDIRECT_DATA_OBJID = "1.3.6.1.4.1.311.2.1.4";
enum SPC_SP_AGENCY_INFO_OBJID = "1.3.6.1.4.1.311.2.1.10";
enum SPC_STATEMENT_TYPE_OBJID = "1.3.6.1.4.1.311.2.1.11";
enum SPC_SP_OPUS_INFO_OBJID = "1.3.6.1.4.1.311.2.1.12";
enum SPC_CERT_EXTENSIONS_OBJID = "1.3.6.1.4.1.311.2.1.14";
enum SPC_PE_IMAGE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.15";
enum SPC_RAW_FILE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.18";
enum SPC_STRUCTURED_STORAGE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.19";
enum SPC_JAVA_CLASS_DATA_OBJID = "1.3.6.1.4.1.311.2.1.20";
enum SPC_INDIVIDUAL_SP_KEY_PURPOSE_OBJID = "1.3.6.1.4.1.311.2.1.21";
enum SPC_COMMERCIAL_SP_KEY_PURPOSE_OBJID = "1.3.6.1.4.1.311.2.1.22";
enum SPC_CAB_DATA_OBJID = "1.3.6.1.4.1.311.2.1.25";
enum SPC_GLUE_RDN_OBJID = "1.3.6.1.4.1.311.2.1.25";
enum SPC_MINIMAL_CRITERIA_OBJID = "1.3.6.1.4.1.311.2.1.26";
enum SPC_FINANCIAL_CRITERIA_OBJID = "1.3.6.1.4.1.311.2.1.27";
enum SPC_LINK_OBJID = "1.3.6.1.4.1.311.2.1.28";
enum SPC_SIGINFO_OBJID = "1.3.6.1.4.1.311.2.1.30";
enum SPC_PE_IMAGE_PAGE_HASHES_V1_OBJID = "1.3.6.1.4.1.311.2.3.1";
enum SPC_PE_IMAGE_PAGE_HASHES_V2_OBJID = "1.3.6.1.4.1.311.2.3.2";
enum szOID_NESTED_SIGNATURE = "1.3.6.1.4.1.311.2.4.1";
enum szOID_INTENT_TO_SEAL = "1.3.6.1.4.1.311.2.4.2";
enum szOID_SEALING_SIGNATURE = "1.3.6.1.4.1.311.2.4.3";
enum szOID_SEALING_TIMESTAMP = "1.3.6.1.4.1.311.2.4.4";
enum szOID_ENHANCED_HASH = "1.3.6.1.4.1.311.2.5.1";
enum SPC_RELAXED_PE_MARKER_CHECK_OBJID = "1.3.6.1.4.1.311.2.6.1";
enum SPC_ENCRYPTED_DIGEST_RETRY_COUNT_OBJID = "1.3.6.1.4.1.311.2.6.2";
enum szOID_PKCS_9_SEQUENCE_NUMBER = "1.2.840.113549.1.9.25.4";
enum CAT_NAMEVALUE_OBJID = "1.3.6.1.4.1.311.12.2.1";
enum CAT_MEMBERINFO_OBJID = "1.3.6.1.4.1.311.12.2.2";
enum CAT_MEMBERINFO2_OBJID = "1.3.6.1.4.1.311.12.2.3";
enum SPC_WINDOWS_HELLO_COMPATIBILITY_OBJID = "1.3.6.1.4.1.311.10.41.1";
enum SPC_NATURAL_AUTH_PLUGIN_OBJID = "1.3.6.1.4.1.311.96.1.1";
enum SPC_SP_AGENCY_INFO_STRUCT = 0x000007d0;
enum SPC_MINIMAL_CRITERIA_STRUCT = 0x000007d1;
enum SPC_FINANCIAL_CRITERIA_STRUCT = 0x000007d2;
enum SPC_INDIRECT_DATA_CONTENT_STRUCT = 0x000007d3;
enum SPC_PE_IMAGE_DATA_STRUCT = 0x000007d4;
enum SPC_LINK_STRUCT = 0x000007d5;
enum SPC_STATEMENT_TYPE_STRUCT = 0x000007d6;
enum SPC_SP_OPUS_INFO_STRUCT = 0x000007d7;
enum SPC_CAB_DATA_STRUCT = 0x000007d8;
enum SPC_JAVA_CLASS_DATA_STRUCT = 0x000007d9;
enum INTENT_TO_SEAL_ATTRIBUTE_STRUCT = 0x000007da;
enum SEALING_SIGNATURE_ATTRIBUTE_STRUCT = 0x000007db;
enum SEALING_TIMESTAMP_ATTRIBUTE_STRUCT = 0x000007dc;
enum SPC_SIGINFO_STRUCT = 0x00000852;
enum CAT_NAMEVALUE_STRUCT = 0x000008ad;
enum CAT_MEMBERINFO_STRUCT = 0x000008ae;
enum CAT_MEMBERINFO2_STRUCT = 0x000008af;
enum SPC_UUID_LENGTH = 0x00000010;
enum SPC_URL_LINK_CHOICE = 0x00000001;
enum SPC_MONIKER_LINK_CHOICE = 0x00000002;
enum SPC_FILE_LINK_CHOICE = 0x00000003;
enum WIN_CERT_REVISION_1_0 = 0x00000100;
enum WIN_CERT_REVISION_2_0 = 0x00000200;
enum WIN_CERT_TYPE_X509 = 0x00000001;
enum WIN_CERT_TYPE_PKCS_SIGNED_DATA = 0x00000002;
enum WIN_CERT_TYPE_RESERVED_1 = 0x00000003;
enum WIN_CERT_TYPE_TS_STACK_SIGNED = 0x00000004;
enum WIN_TRUST_SUBJTYPE_RAW_FILE = GUID(0x959dc450, 0x8d9e, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_TRUST_SUBJTYPE_PE_IMAGE = GUID(0x43c9a1e0, 0x8da0, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_TRUST_SUBJTYPE_JAVA_CLASS = GUID(0x8ad3990, 0x8da1, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_TRUST_SUBJTYPE_CABINET = GUID(0xd17c5374, 0xa392, 0x11cf, [0x9d, 0xf5, 0x0, 0xaa, 0x0, 0xc1, 0x84, 0xe0]);
enum WIN_TRUST_SUBJTYPE_RAW_FILEEX = GUID(0x6f458110, 0xc2f1, 0x11cf, [0x8a, 0x69, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
enum WIN_TRUST_SUBJTYPE_PE_IMAGEEX = GUID(0x6f458111, 0xc2f1, 0x11cf, [0x8a, 0x69, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
enum WIN_TRUST_SUBJTYPE_JAVA_CLASSEX = GUID(0x6f458113, 0xc2f1, 0x11cf, [0x8a, 0x69, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
enum WIN_TRUST_SUBJTYPE_CABINETEX = GUID(0x6f458114, 0xc2f1, 0x11cf, [0x8a, 0x69, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
enum WIN_TRUST_SUBJTYPE_OLE_STORAGE = GUID(0xc257e740, 0x8da0, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_SPUB_ACTION_TRUSTED_PUBLISHER = GUID(0x66426730, 0x8da1, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_SPUB_ACTION_NT_ACTIVATE_IMAGE = GUID(0x8bc96b00, 0x8da1, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WIN_SPUB_ACTION_PUBLISHED_SOFTWARE = GUID(0x64b9d180, 0x8da2, 0x11cf, [0x87, 0x36, 0x0, 0xaa, 0x0, 0xa4, 0x85, 0xeb]);
enum WT_TRUSTDBDIALOG_NO_UI_FLAG = 0x00000001;
enum WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG = 0x00000002;
enum WT_TRUSTDBDIALOG_WRITE_LEGACY_REG_FLAG = 0x00000100;
enum WT_TRUSTDBDIALOG_WRITE_IEAK_STORE_FLAG = 0x00000200;
enum SP_POLICY_PROVIDER_DLL_NAME = "WINTRUST.DLL";
enum WINTRUST_ACTION_GENERIC_VERIFY_V2 = GUID(0xaac56b, 0xcd44, 0x11d0, [0x8c, 0xc2, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum SP_INIT_FUNCTION = "SoftpubInitialize";
enum SP_OBJTRUST_FUNCTION = "SoftpubLoadMessage";
enum SP_SIGTRUST_FUNCTION = "SoftpubLoadSignature";
enum SP_CHKCERT_FUNCTION = "SoftpubCheckCert";
enum SP_FINALPOLICY_FUNCTION = "SoftpubAuthenticode";
enum SP_CLEANUPPOLICY_FUNCTION = "SoftpubCleanup";
enum WINTRUST_ACTION_TRUSTPROVIDER_TEST = GUID(0x573e31f8, 0xddba, 0x11d0, [0x8c, 0xcb, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum SP_TESTDUMPPOLICY_FUNCTION_TEST = "SoftpubDumpStructure";
enum WINTRUST_ACTION_GENERIC_CERT_VERIFY = GUID(0x189a3842, 0x3041, 0x11d1, [0x85, 0xe1, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum SP_GENERIC_CERT_INIT_FUNCTION = "SoftpubDefCertInit";
enum WINTRUST_ACTION_GENERIC_CHAIN_VERIFY = GUID(0xfc451c16, 0xac75, 0x11d1, [0xb4, 0xb8, 0x0, 0xc0, 0x4f, 0xb6, 0x6e, 0xa0]);
enum GENERIC_CHAIN_FINALPOLICY_FUNCTION = "GenericChainFinalProv";
enum GENERIC_CHAIN_CERTTRUST_FUNCTION = "GenericChainCertificateTrust";
enum HTTPSPROV_ACTION = GUID(0x573e31f8, 0xaaba, 0x11d0, [0x8c, 0xcb, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum HTTPS_FINALPOLICY_FUNCTION = "HTTPSFinalProv";
enum HTTPS_CHKCERT_FUNCTION = "HTTPSCheckCertProv";
enum HTTPS_CERTTRUST_FUNCTION = "HTTPSCertificateTrust";
enum OFFICESIGN_ACTION_VERIFY = GUID(0x5555c2cd, 0x17fb, 0x11d1, [0x85, 0xc4, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum OFFICE_POLICY_PROVIDER_DLL_NAME = "WINTRUST.DLL";
enum OFFICE_INITPROV_FUNCTION = "OfficeInitializePolicy";
enum OFFICE_CLEANUPPOLICY_FUNCTION = "OfficeCleanupPolicy";
enum DRIVER_ACTION_VERIFY = GUID(0xf750e6c3, 0x38ee, 0x11d1, [0x85, 0xe5, 0x0, 0xc0, 0x4f, 0xc2, 0x95, 0xee]);
enum DRIVER_INITPROV_FUNCTION = "DriverInitializePolicy";
enum DRIVER_FINALPOLPROV_FUNCTION = "DriverFinalPolicy";
enum DRIVER_CLEANUPPOLICY_FUNCTION = "DriverCleanupPolicy";
enum CONFIG_CI_ACTION_VERIFY = GUID(0x6078065b, 0x8f22, 0x4b13, [0xbd, 0x9b, 0x5b, 0x76, 0x27, 0x76, 0xf3, 0x86]);
enum CCPI_RESULT_ALLOW = 0x00000001;
enum CCPI_RESULT_DENY = 0x00000002;
enum CCPI_RESULT_AUDIT = 0x00000003;
struct WINTRUST_DATA
{
    uint cbStruct;
    void* pPolicyCallbackData;
    void* pSIPClientData;
    WINTRUST_DATA_UICHOICE dwUIChoice;
    WINTRUST_DATA_REVOCATION_CHECKS fdwRevocationChecks;
    WINTRUST_DATA_UNION_CHOICE dwUnionChoice;
    union
    {
        WINTRUST_FILE_INFO* pFile;
        WINTRUST_CATALOG_INFO* pCatalog;
        WINTRUST_BLOB_INFO* pBlob;
        WINTRUST_SGNR_INFO* pSgnr;
        WINTRUST_CERT_INFO* pCert;
    }
    WINTRUST_DATA_STATE_ACTION dwStateAction;
    HANDLE hWVTStateData;
    PWSTR pwszURLReference;
    WINTRUST_DATA_PROVIDER_FLAGS dwProvFlags;
    WINTRUST_DATA_UICONTEXT dwUIContext;
    WINTRUST_SIGNATURE_SETTINGS* pSignatureSettings;
}
struct WINTRUST_SIGNATURE_SETTINGS
{
    uint cbStruct;
    uint dwIndex;
    WINTRUST_SIGNATURE_SETTINGS_FLAGS dwFlags;
    uint cSecondarySigs;
    uint dwVerifiedSigIndex;
    CERT_STRONG_SIGN_PARA* pCryptoPolicy;
}
struct WINTRUST_FILE_INFO
{
    uint cbStruct;
    const(wchar)* pcwszFilePath;
    HANDLE hFile;
    GUID* pgKnownSubject;
}
struct WINTRUST_CATALOG_INFO
{
    uint cbStruct;
    uint dwCatalogVersion;
    const(wchar)* pcwszCatalogFilePath;
    const(wchar)* pcwszMemberTag;
    const(wchar)* pcwszMemberFilePath;
    HANDLE hMemberFile;
    ubyte* pbCalculatedFileHash;
    uint cbCalculatedFileHash;
    CTL_CONTEXT* pcCatalogContext;
    long hCatAdmin;
}
struct WINTRUST_BLOB_INFO
{
    uint cbStruct;
    GUID gSubject;
    const(wchar)* pcwszDisplayName;
    uint cbMemObject;
    ubyte* pbMemObject;
    uint cbMemSignedMsg;
    ubyte* pbMemSignedMsg;
}
struct WINTRUST_SGNR_INFO
{
    uint cbStruct;
    const(wchar)* pcwszDisplayName;
    CMSG_SIGNER_INFO* psSignerInfo;
    uint chStores;
    HCERTSTORE* pahStores;
}
struct WINTRUST_CERT_INFO
{
    uint cbStruct;
    const(wchar)* pcwszDisplayName;
    CERT_CONTEXT* psCertContext;
    uint chStores;
    HCERTSTORE* pahStores;
    uint dwFlags;
    FILETIME* psftVerifyAsOf;
}
alias PFN_CPD_MEM_ALLOC = void* function(uint);
alias PFN_CPD_MEM_FREE = void function(void*);
alias PFN_CPD_ADD_STORE = BOOL function(CRYPT_PROVIDER_DATA*, HCERTSTORE);
alias PFN_CPD_ADD_SGNR = BOOL function(CRYPT_PROVIDER_DATA*, BOOL, uint, CRYPT_PROVIDER_SGNR*);
alias PFN_CPD_ADD_CERT = BOOL function(CRYPT_PROVIDER_DATA*, uint, BOOL, uint, const(CERT_CONTEXT)*);
alias PFN_CPD_ADD_PRIVDATA = BOOL function(CRYPT_PROVIDER_DATA*, CRYPT_PROVIDER_PRIVDATA*);
alias PFN_PROVIDER_INIT_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_OBJTRUST_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_SIGTRUST_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_CERTTRUST_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_FINALPOLICY_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_TESTFINALPOLICY_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_CLEANUP_CALL = HRESULT function(CRYPT_PROVIDER_DATA*);
alias PFN_PROVIDER_CERTCHKPOLICY_CALL = BOOL function(CRYPT_PROVIDER_DATA*, uint, BOOL, uint);
struct CRYPT_PROVIDER_DATA
{
    uint cbStruct;
    WINTRUST_DATA* pWintrustData;
    BOOL fOpenedFile;
    HWND hWndParent;
    GUID* pgActionID;
    ulong hProv;
    uint dwError;
    uint dwRegSecuritySettings;
    uint dwRegPolicySettings;
    CRYPT_PROVIDER_FUNCTIONS* psPfns;
    uint cdwTrustStepErrors;
    uint* padwTrustStepErrors;
    uint chStores;
    HCERTSTORE* pahStores;
    uint dwEncoding;
    void* hMsg;
    uint csSigners;
    CRYPT_PROVIDER_SGNR* pasSigners;
    uint csProvPrivData;
    CRYPT_PROVIDER_PRIVDATA* pasProvPrivData;
    uint dwSubjectChoice;
    union
    {
        PROVDATA_SIP* pPDSip;
    }
    PSTR pszUsageOID;
    BOOL fRecallWithState;
    FILETIME sftSystemTime;
    PSTR pszCTLSignerUsageOID;
    uint dwProvFlags;
    uint dwFinalError;
    CERT_USAGE_MATCH* pRequestUsage;
    uint dwTrustPubSettings;
    uint dwUIStateFlags;
    CRYPT_PROVIDER_SIGSTATE* pSigState;
    WINTRUST_SIGNATURE_SETTINGS* pSigSettings;
}
struct CRYPT_PROVIDER_SIGSTATE
{
    uint cbStruct;
    void** rhSecondarySigs;
    void* hPrimarySig;
    BOOL fFirstAttemptMade;
    BOOL fNoMoreSigs;
    uint cSecondarySigs;
    uint dwCurrentIndex;
    BOOL fSupportMultiSig;
    uint dwCryptoPolicySupport;
    uint iAttemptCount;
    BOOL fCheckedSealing;
    SEALING_SIGNATURE_ATTRIBUTE* pSealingSignature;
}
struct CRYPT_PROVIDER_FUNCTIONS
{
    uint cbStruct;
    PFN_CPD_MEM_ALLOC pfnAlloc;
    PFN_CPD_MEM_FREE pfnFree;
    PFN_CPD_ADD_STORE pfnAddStore2Chain;
    PFN_CPD_ADD_SGNR pfnAddSgnr2Chain;
    PFN_CPD_ADD_CERT pfnAddCert2Chain;
    PFN_CPD_ADD_PRIVDATA pfnAddPrivData2Chain;
    PFN_PROVIDER_INIT_CALL pfnInitialize;
    PFN_PROVIDER_OBJTRUST_CALL pfnObjectTrust;
    PFN_PROVIDER_SIGTRUST_CALL pfnSignatureTrust;
    PFN_PROVIDER_CERTTRUST_CALL pfnCertificateTrust;
    PFN_PROVIDER_FINALPOLICY_CALL pfnFinalPolicy;
    PFN_PROVIDER_CERTCHKPOLICY_CALL pfnCertCheckPolicy;
    PFN_PROVIDER_TESTFINALPOLICY_CALL pfnTestFinalPolicy;
    CRYPT_PROVUI_FUNCS* psUIpfns;
    PFN_PROVIDER_CLEANUP_CALL pfnCleanupPolicy;
}
alias PFN_PROVUI_CALL = BOOL function(HWND, CRYPT_PROVIDER_DATA*);
struct CRYPT_PROVUI_FUNCS
{
    uint cbStruct;
    CRYPT_PROVUI_DATA* psUIData;
    PFN_PROVUI_CALL pfnOnMoreInfoClick;
    PFN_PROVUI_CALL pfnOnMoreInfoClickDefault;
    PFN_PROVUI_CALL pfnOnAdvancedClick;
    PFN_PROVUI_CALL pfnOnAdvancedClickDefault;
}
struct CRYPT_PROVUI_DATA
{
    uint cbStruct;
    uint dwFinalError;
    PWSTR pYesButtonText;
    PWSTR pNoButtonText;
    PWSTR pMoreInfoButtonText;
    PWSTR pAdvancedLinkText;
    PWSTR pCopyActionText;
    PWSTR pCopyActionTextNoTS;
    PWSTR pCopyActionTextNotSigned;
}
struct CRYPT_PROVIDER_SGNR
{
    uint cbStruct;
    FILETIME sftVerifyAsOf;
    uint csCertChain;
    CRYPT_PROVIDER_CERT* pasCertChain;
    uint dwSignerType;
    CMSG_SIGNER_INFO* psSigner;
    uint dwError;
    uint csCounterSigners;
    CRYPT_PROVIDER_SGNR* pasCounterSigners;
    CERT_CHAIN_CONTEXT* pChainContext;
}
struct CRYPT_PROVIDER_CERT
{
    uint cbStruct;
    const(CERT_CONTEXT)* pCert;
    BOOL fCommercial;
    BOOL fTrustedRoot;
    BOOL fSelfSigned;
    BOOL fTestCert;
    uint dwRevokedReason;
    uint dwConfidence;
    uint dwError;
    CTL_CONTEXT* pTrustListContext;
    BOOL fTrustListSignerCert;
    CTL_CONTEXT* pCtlContext;
    uint dwCtlError;
    BOOL fIsCyclic;
    CERT_CHAIN_ELEMENT* pChainElement;
}
struct CRYPT_PROVIDER_PRIVDATA
{
    uint cbStruct;
    GUID gProviderID;
    uint cbProvData;
    void* pvProvData;
}
struct PROVDATA_SIP
{
    uint cbStruct;
    GUID gSubject;
    SIP_DISPATCH_INFO* pSip;
    SIP_DISPATCH_INFO* pCATSip;
    SIP_SUBJECTINFO* psSipSubjectInfo;
    SIP_SUBJECTINFO* psSipCATSubjectInfo;
    SIP_INDIRECT_DATA* psIndirectData;
}
struct CRYPT_TRUST_REG_ENTRY
{
    uint cbStruct;
    PWSTR pwszDLLName;
    PWSTR pwszFunctionName;
}
struct CRYPT_REGISTER_ACTIONID
{
    uint cbStruct;
    CRYPT_TRUST_REG_ENTRY sInitProvider;
    CRYPT_TRUST_REG_ENTRY sObjectProvider;
    CRYPT_TRUST_REG_ENTRY sSignatureProvider;
    CRYPT_TRUST_REG_ENTRY sCertificateProvider;
    CRYPT_TRUST_REG_ENTRY sCertificatePolicyProvider;
    CRYPT_TRUST_REG_ENTRY sFinalPolicyProvider;
    CRYPT_TRUST_REG_ENTRY sTestPolicyProvider;
    CRYPT_TRUST_REG_ENTRY sCleanupProvider;
}
alias PFN_ALLOCANDFILLDEFUSAGE = BOOL function(const(char)*, CRYPT_PROVIDER_DEFUSAGE*);
alias PFN_FREEDEFUSAGE = BOOL function(const(char)*, CRYPT_PROVIDER_DEFUSAGE*);
struct CRYPT_PROVIDER_REGDEFUSAGE
{
    uint cbStruct;
    GUID* pgActionID;
    PWSTR pwszDllName;
    PSTR pwszLoadCallbackDataFunctionName;
    PSTR pwszFreeCallbackDataFunctionName;
}
struct CRYPT_PROVIDER_DEFUSAGE
{
    uint cbStruct;
    GUID gActionID;
    void* pDefPolicyCallbackData;
    void* pDefSIPClientData;
}
struct SPC_SERIALIZED_OBJECT
{
    ubyte[16] ClassId;
    CRYPT_INTEGER_BLOB SerializedData;
}
struct SPC_SIGINFO
{
    uint dwSipVersion;
    GUID gSIPGuid;
    uint dwReserved1;
    uint dwReserved2;
    uint dwReserved3;
    uint dwReserved4;
    uint dwReserved5;
}
struct SPC_LINK
{
    uint dwLinkChoice;
    union
    {
        PWSTR pwszUrl;
        SPC_SERIALIZED_OBJECT Moniker;
        PWSTR pwszFile;
    }
}
struct SPC_PE_IMAGE_DATA
{
    CRYPT_BIT_BLOB Flags;
    SPC_LINK* pFile;
}
struct SPC_INDIRECT_DATA_CONTENT
{
    CRYPT_ATTRIBUTE_TYPE_VALUE Data;
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm;
    CRYPT_INTEGER_BLOB Digest;
}
struct SPC_FINANCIAL_CRITERIA
{
    BOOL fFinancialInfoAvailable;
    BOOL fMeetsCriteria;
}
struct SPC_IMAGE
{
    SPC_LINK* pImageLink;
    CRYPT_INTEGER_BLOB Bitmap;
    CRYPT_INTEGER_BLOB Metafile;
    CRYPT_INTEGER_BLOB EnhancedMetafile;
    CRYPT_INTEGER_BLOB GifFile;
}
struct SPC_SP_AGENCY_INFO
{
    SPC_LINK* pPolicyInformation;
    PWSTR pwszPolicyDisplayText;
    SPC_IMAGE* pLogoImage;
    SPC_LINK* pLogoLink;
}
struct SPC_STATEMENT_TYPE
{
    uint cKeyPurposeId;
    PSTR* rgpszKeyPurposeId;
}
struct SPC_SP_OPUS_INFO
{
    const(wchar)* pwszProgramName;
    SPC_LINK* pMoreInfo;
    SPC_LINK* pPublisherInfo;
}
struct CAT_NAMEVALUE
{
    PWSTR pwszTag;
    uint fdwFlags;
    CRYPT_INTEGER_BLOB Value;
}
struct CAT_MEMBERINFO
{
    PWSTR pwszSubjGuid;
    uint dwCertVersion;
}
struct CAT_MEMBERINFO2
{
    GUID SubjectGuid;
    uint dwCertVersion;
}
struct INTENT_TO_SEAL_ATTRIBUTE
{
    uint version_;
    BOOLEAN seal;
}
struct SEALING_SIGNATURE_ATTRIBUTE
{
    uint version_;
    uint signerIndex;
    CRYPT_ALGORITHM_IDENTIFIER signatureAlgorithm;
    CRYPT_INTEGER_BLOB encryptedDigest;
}
struct SEALING_TIMESTAMP_ATTRIBUTE
{
    uint version_;
    uint signerIndex;
    CRYPT_INTEGER_BLOB sealTimeStampToken;
}
struct WIN_CERTIFICATE
{
    uint dwLength;
    ushort wRevision;
    ushort wCertificateType;
    ubyte[1] bCertificate;
}
struct WIN_TRUST_ACTDATA_CONTEXT_WITH_SUBJECT
{
    HANDLE hClientToken;
    GUID* SubjectType;
    void* Subject;
}
struct WIN_TRUST_ACTDATA_SUBJECT_ONLY
{
    GUID* SubjectType;
    void* Subject;
}
struct WIN_TRUST_SUBJECT_FILE
{
    HANDLE hFile;
    const(wchar)* lpPath;
}
struct WIN_TRUST_SUBJECT_FILE_AND_DISPLAY
{
    HANDLE hFile;
    const(wchar)* lpPath;
    const(wchar)* lpDisplayName;
}
struct WIN_SPUB_TRUSTED_PUBLISHER_DATA
{
    HANDLE hClientToken;
    WIN_CERTIFICATE* lpCertificate;
}
struct WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO
{
    union
    {
        uint cbStruct;
        uint cbSize;
    }
    CERT_CHAIN_CONTEXT* pChainContext;
    uint dwSignerType;
    CMSG_SIGNER_INFO* pMsgSignerInfo;
    uint dwError;
    uint cCounterSigner;
    WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO** rgpCounterSigner;
}
alias PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK = HRESULT function(CRYPT_PROVIDER_DATA*, uint, uint, uint, WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO**, void*);
struct WTD_GENERIC_CHAIN_POLICY_CREATE_INFO
{
    union
    {
        uint cbStruct;
        uint cbSize;
    }
    HCERTCHAINENGINE hChainEngine;
    CERT_CHAIN_PARA* pChainPara;
    uint dwFlags;
    void* pvReserved;
}
struct WTD_GENERIC_CHAIN_POLICY_DATA
{
    union
    {
        uint cbStruct;
        uint cbSize;
    }
    WTD_GENERIC_CHAIN_POLICY_CREATE_INFO* pSignerChainInfo;
    WTD_GENERIC_CHAIN_POLICY_CREATE_INFO* pCounterSignerChainInfo;
    PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK pfnPolicyCallback;
    void* pvPolicyArg;
}
struct DRIVER_VER_MAJORMINOR
{
    uint dwMajor;
    uint dwMinor;
}
struct DRIVER_VER_INFO
{
    uint cbStruct;
    ulong dwReserved1;
    ulong dwReserved2;
    uint dwPlatform;
    uint dwVersion;
    wchar[260] wszVersion;
    wchar[260] wszSignedBy;
    const(CERT_CONTEXT)* pcSignerCertContext;
    DRIVER_VER_MAJORMINOR sOSVersionLow;
    DRIVER_VER_MAJORMINOR sOSVersionHigh;
    uint dwBuildNumberLow;
    uint dwBuildNumberHigh;
}
struct CONFIG_CI_PROV_INFO_RESULT
{
    HRESULT hr;
    uint dwResult;
    uint dwPolicyIndex;
    BOOLEAN fIsExplicitDeny;
}
struct CONFIG_CI_PROV_INFO_RESULT2
{
    uint cbSize;
    HRESULT hr;
    uint dwResult;
    uint dwPolicyIndex;
    BOOLEAN fIsExplicitDeny;
    uint cbCalculatedFileHash;
    ubyte* pbCalculatedFileHash;
}
struct CONFIG_CI_PROV_INFO
{
    uint cbSize;
    uint dwPolicies;
    CRYPT_INTEGER_BLOB* pPolicies;
    CONFIG_CI_PROV_INFO_RESULT result;
    uint dwScenario;
    CONFIG_CI_PROV_INFO_RESULT2* result2;
}
