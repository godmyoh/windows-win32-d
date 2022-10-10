module windows.win32.security.cryptography.ui;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HINSTANCE, HRESULT, HWND, LPARAM, PSTR, PWSTR, WPARAM;
import windows.win32.security.cryptography_ : CERT_CHAIN_CONTEXT, CERT_CONTEXT, CRL_CONTEXT, CRYPTOAPI_BLOB, CRYPT_ATTRIBUTES, CRYPT_KEY_FLAGS, CRYPT_KEY_PROV_INFO, CTL_CONTEXT, HCERTSTORE;
import windows.win32.security.wintrust : CRYPT_PROVIDER_DATA;
import windows.win32.ui.controls_ : PROPSHEETPAGEA, PROPSHEETPAGEW;

version (Windows):
extern (Windows):

alias CRYPTUI_WIZ_FLAGS = uint;
enum : uint
{
    CRYPTUI_WIZ_NO_UI                        = 0x00000001,
    CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS   = 0x00000002,
    CRYPTUI_WIZ_NO_UI_EXCEPT_CSP             = 0x00000003,
    CRYPTUI_WIZ_IMPORT_ALLOW_CERT            = 0x00020000,
    CRYPTUI_WIZ_IMPORT_ALLOW_CRL             = 0x00040000,
    CRYPTUI_WIZ_IMPORT_ALLOW_CTL             = 0x00080000,
    CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE  = 0x00010000,
    CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE       = 0x00100000,
    CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER        = 0x00200000,
    CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE     = 0x00400000,
    CRYPTUI_WIZ_EXPORT_PRIVATE_KEY           = 0x00000100,
    CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY = 0x00000200,
}

alias CRYPTUI_VIEWCERTIFICATE_FLAGS = uint;
enum : uint
{
    CRYPTUI_HIDE_HIERARCHYPAGE                         = 0x00000001,
    CRYPTUI_HIDE_DETAILPAGE                            = 0x00000002,
    CRYPTUI_DISABLE_EDITPROPERTIES                     = 0x00000004,
    CRYPTUI_ENABLE_EDITPROPERTIES                      = 0x00000008,
    CRYPTUI_DISABLE_ADDTOSTORE                         = 0x00000010,
    CRYPTUI_ENABLE_ADDTOSTORE                          = 0x00000020,
    CRYPTUI_ACCEPT_DECLINE_STYLE                       = 0x00000040,
    CRYPTUI_IGNORE_UNTRUSTED_ROOT                      = 0x00000080,
    CRYPTUI_DONT_OPEN_STORES                           = 0x00000100,
    CRYPTUI_ONLY_OPEN_ROOT_STORE                       = 0x00000200,
    CRYPTUI_WARN_UNTRUSTED_ROOT                        = 0x00000400,
    CRYPTUI_ENABLE_REVOCATION_CHECKING                 = 0x00000800,
    CRYPTUI_WARN_REMOTE_TRUST                          = 0x00001000,
    CRYPTUI_DISABLE_EXPORT                             = 0x00002000,
    CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT           = 0x00004000,
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN              = 0x00008000,
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x00000800,
    CRYPTUI_DISABLE_HTMLLINK                           = 0x00010000,
    CRYPTUI_DISABLE_ISSUERSTATEMENT                    = 0x00020000,
    CRYPTUI_CACHE_ONLY_URL_RETRIEVAL                   = 0x00040000,
}

alias CERT_SELECT_STRUCT_FLAGS = uint;
enum : uint
{
    CSS_HIDE_PROPERTIES      = 0x00000001,
    CSS_ENABLEHOOK           = 0x00000002,
    CSS_ALLOWMULTISELECT     = 0x00000004,
    CSS_SHOW_HELP            = 0x00000010,
    CSS_ENABLETEMPLATE       = 0x00000020,
    CSS_ENABLETEMPLATEHANDLE = 0x00000040,
}

alias CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION = uint;
enum : uint
{
    CRYPTUI_WIZ_IMPORT_SUBJECT_FILE         = 0x00000001,
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT = 0x00000002,
    CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT  = 0x00000003,
    CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT  = 0x00000004,
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE   = 0x00000005,
}

alias CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT = uint;
enum : uint
{
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_BLOB = 0x00000002,
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_FILE = 0x00000001,
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_NONE = 0x00000000,
}

alias CRYPTUI_WIZ_DIGITAL_SIGN = uint;
enum : uint
{
    CRYPTUI_WIZ_DIGITAL_SIGN_CERT  = 0x00000001,
    CRYPTUI_WIZ_DIGITAL_SIGN_STORE = 0x00000002,
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK   = 0x00000003,
    CRYPTUI_WIZ_DIGITAL_SIGN_NONE  = 0x00000000,
}

alias CRYPTUI_WIZ_EXPORT_SUBJECT = uint;
enum : uint
{
    CRYPTUI_WIZ_EXPORT_CERT_CONTEXT                 = 0x00000001,
    CRYPTUI_WIZ_EXPORT_CTL_CONTEXT                  = 0x00000002,
    CRYPTUI_WIZ_EXPORT_CRL_CONTEXT                  = 0x00000003,
    CRYPTUI_WIZ_EXPORT_CERT_STORE                   = 0x00000004,
    CRYPTUI_WIZ_EXPORT_CERT_STORE_CERTIFICATES_ONLY = 0x00000005,
}

alias CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE = uint;
enum : uint
{
    CRYPTUI_WIZ_DIGITAL_SIGN_COMMERCIAL = 0x00000001,
    CRYPTUI_WIZ_DIGITAL_SIGN_INDIVIDUAL = 0x00000002,
}

alias CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION = uint;
enum : uint
{
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE = 0x00000001,
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV = 0x00000002,
}

alias CERT_VIEWPROPERTIES_STRUCT_FLAGS = uint;
enum : uint
{
    CM_ENABLEHOOK       = 0x00000001,
    CM_SHOW_HELP        = 0x00000002,
    CM_SHOW_HELPICON    = 0x00000004,
    CM_ENABLETEMPLATE   = 0x00000008,
    CM_HIDE_ADVANCEPAGE = 0x00000010,
    CM_HIDE_TRUSTPAGE   = 0x00000020,
    CM_NO_NAMECHANGE    = 0x00000040,
    CM_NO_EDITTRUST     = 0x00000080,
    CM_HIDE_DETAILPAGE  = 0x00000100,
    CM_ADD_CERT_STORES  = 0x00000200,
}

alias CRYPTUI_WIZ_EXPORT_FORMAT = uint;
enum : uint
{
    CRYPTUI_WIZ_EXPORT_FORMAT_DER    = 0x00000001,
    CRYPTUI_WIZ_EXPORT_FORMAT_PFX    = 0x00000002,
    CRYPTUI_WIZ_EXPORT_FORMAT_PKCS7  = 0x00000003,
    CRYPTUI_WIZ_EXPORT_FORMAT_BASE64 = 0x00000004,
    CRYPTUI_WIZ_EXPORT_FORMAT_CRL    = 0x00000006,
    CRYPTUI_WIZ_EXPORT_FORMAT_CTL    = 0x00000007,
}

alias CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE = uint;
enum : uint
{
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN         = 0x00000001,
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT = 0x00000002,
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE          = 0x00000000,
}

alias CTL_MODIFY_REQUEST_OPERATION = uint;
enum : uint
{
    CTL_MODIFY_REQUEST_ADD_TRUSTED     = 0x00000003,
    CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED = 0x00000001,
    CTL_MODIFY_REQUEST_REMOVE          = 0x00000002,
}

BOOL CryptUIDlgViewContext(uint, const(void)*, HWND, const(wchar)*, uint, void*);
CERT_CONTEXT* CryptUIDlgSelectCertificateFromStore(HCERTSTORE, HWND, const(wchar)*, const(wchar)*, uint, uint, void*);
HRESULT CertSelectionGetSerializedBlob(CERT_SELECTUI_INPUT*, void**, uint*);
BOOL CryptUIDlgCertMgr(CRYPTUI_CERT_MGR_STRUCT*);
BOOL CryptUIWizDigitalSign(uint, HWND, const(wchar)*, CRYPTUI_WIZ_DIGITAL_SIGN_INFO*, CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT**);
BOOL CryptUIWizFreeDigitalSignContext(CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT*);
BOOL CryptUIDlgViewCertificateW(CRYPTUI_VIEWCERTIFICATE_STRUCTW*, BOOL*);
BOOL CryptUIDlgViewCertificateA(CRYPTUI_VIEWCERTIFICATE_STRUCTA*, BOOL*);
BOOL CryptUIWizExport(CRYPTUI_WIZ_FLAGS, HWND, const(wchar)*, CRYPTUI_WIZ_EXPORT_INFO*, void*);
BOOL CryptUIWizImport(CRYPTUI_WIZ_FLAGS, HWND, const(wchar)*, CRYPTUI_WIZ_IMPORT_SRC_INFO*, HCERTSTORE);
enum CRYTPDLG_FLAGS_MASK = 0xff000000;
enum CRYPTDLG_REVOCATION_DEFAULT = 0x00000000;
enum CRYPTDLG_REVOCATION_ONLINE = 0x80000000;
enum CRYPTDLG_REVOCATION_CACHE = 0x40000000;
enum CRYPTDLG_REVOCATION_NONE = 0x20000000;
enum CRYPTDLG_CACHE_ONLY_URL_RETRIEVAL = 0x10000000;
enum CRYPTDLG_DISABLE_AIA = 0x08000000;
enum CRYPTDLG_POLICY_MASK = 0x0000ffff;
enum POLICY_IGNORE_NON_CRITICAL_BC = 0x00000001;
enum CRYPTDLG_ACTION_MASK = 0xffff0000;
enum ACTION_REVOCATION_DEFAULT_ONLINE = 0x00010000;
enum ACTION_REVOCATION_DEFAULT_CACHE = 0x00020000;
enum CERT_DISPWELL_SELECT = 0x00000001;
enum CERT_DISPWELL_TRUST_CA_CERT = 0x00000002;
enum CERT_DISPWELL_TRUST_LEAF_CERT = 0x00000003;
enum CERT_DISPWELL_TRUST_ADD_CA_CERT = 0x00000004;
enum CERT_DISPWELL_TRUST_ADD_LEAF_CERT = 0x00000005;
enum CERT_DISPWELL_DISTRUST_CA_CERT = 0x00000006;
enum CERT_DISPWELL_DISTRUST_LEAF_CERT = 0x00000007;
enum CERT_DISPWELL_DISTRUST_ADD_CA_CERT = 0x00000008;
enum CERT_DISPWELL_DISTRUST_ADD_LEAF_CERT = 0x00000009;
enum CSS_SELECTCERT_MASK = 0x00ffffff;
enum SELCERT_PROPERTIES = 0x00000064;
enum SELCERT_FINEPRINT = 0x00000065;
enum SELCERT_CERTLIST = 0x00000066;
enum SELCERT_ISSUED_TO = 0x00000067;
enum SELCERT_VALIDITY = 0x00000068;
enum SELCERT_ALGORITHM = 0x00000069;
enum SELCERT_SERIAL_NUM = 0x0000006a;
enum SELCERT_THUMBPRINT = 0x0000006b;
enum CM_VIEWFLAGS_MASK = 0x00ffffff;
enum CERTVIEW_CRYPTUI_LPARAM = 0x00800000;
enum CERT_FILTER_OP_EXISTS = 0x00000001;
enum CERT_FILTER_OP_NOT_EXISTS = 0x00000002;
enum CERT_FILTER_OP_EQUALITY = 0x00000003;
enum CERT_FILTER_INCLUDE_V1_CERTS = 0x00000001;
enum CERT_FILTER_VALID_TIME_RANGE = 0x00000002;
enum CERT_FILTER_VALID_SIGNATURE = 0x00000004;
enum CERT_FILTER_LEAF_CERTS_ONLY = 0x00000008;
enum CERT_FILTER_ISSUER_CERTS_ONLY = 0x00000010;
enum CERT_FILTER_KEY_EXISTS = 0x00000020;
enum szCERT_CERTIFICATE_ACTION_VERIFY = "{7801ebd0-cf4b-11d0-851f-0060979387ea}";
enum CERT_VALIDITY_BEFORE_START = 0x00000001;
enum CERT_VALIDITY_AFTER_END = 0x00000002;
enum CERT_VALIDITY_SIGNATURE_FAILS = 0x00000004;
enum CERT_VALIDITY_CERTIFICATE_REVOKED = 0x00000008;
enum CERT_VALIDITY_KEY_USAGE_EXT_FAILURE = 0x00000010;
enum CERT_VALIDITY_EXTENDED_USAGE_FAILURE = 0x00000020;
enum CERT_VALIDITY_NAME_CONSTRAINTS_FAILURE = 0x00000040;
enum CERT_VALIDITY_UNKNOWN_CRITICAL_EXTENSION = 0x00000080;
enum CERT_VALIDITY_ISSUER_INVALID = 0x00000100;
enum CERT_VALIDITY_OTHER_EXTENSION_FAILURE = 0x00000200;
enum CERT_VALIDITY_PERIOD_NESTING_FAILURE = 0x00000400;
enum CERT_VALIDITY_OTHER_ERROR = 0x00000800;
enum CERT_VALIDITY_ISSUER_DISTRUST = 0x02000000;
enum CERT_VALIDITY_EXPLICITLY_DISTRUSTED = 0x01000000;
enum CERT_VALIDITY_NO_ISSUER_CERT_FOUND = 0x10000000;
enum CERT_VALIDITY_NO_CRL_FOUND = 0x20000000;
enum CERT_VALIDITY_CRL_OUT_OF_DATE = 0x40000000;
enum CERT_VALIDITY_NO_TRUST_DATA = 0x80000000;
enum CERT_VALIDITY_MASK_TRUST = 0xffff0000;
enum CERT_VALIDITY_MASK_VALIDITY = 0x0000ffff;
enum CERT_TRUST_MASK = 0x00ffffff;
enum CERT_TRUST_DO_FULL_SEARCH = 0x00000001;
enum CERT_TRUST_PERMIT_MISSING_CRLS = 0x00000002;
enum CERT_TRUST_DO_FULL_TRUST = 0x00000005;
enum CERT_CREDENTIAL_PROVIDER_ID = 0xfffffffffffffe03;
enum CRYPTUI_SELECT_ISSUEDTO_COLUMN = 0x0000000000000001;
enum CRYPTUI_SELECT_ISSUEDBY_COLUMN = 0x0000000000000002;
enum CRYPTUI_SELECT_INTENDEDUSE_COLUMN = 0x0000000000000004;
enum CRYPTUI_SELECT_FRIENDLYNAME_COLUMN = 0x0000000000000008;
enum CRYPTUI_SELECT_LOCATION_COLUMN = 0x0000000000000010;
enum CRYPTUI_SELECT_EXPIRATION_COLUMN = 0x0000000000000020;
enum CRYPTUI_CERT_MGR_TAB_MASK = 0x0000000f;
enum CRYPTUI_CERT_MGR_PUBLISHER_TAB = 0x00000004;
enum CRYPTUI_CERT_MGR_SINGLE_TAB_FLAG = 0x00008000;
enum CRYPTUI_WIZ_DIGITAL_SIGN_EXCLUDE_PAGE_HASHES = 0x00000002;
enum CRYPTUI_WIZ_DIGITAL_SIGN_INCLUDE_PAGE_HASHES = 0x00000004;
enum CRYPTUI_WIZ_EXPORT_FORMAT_SERIALIZED_CERT_STORE = 0x00000005;
alias PFNCMFILTERPROC = BOOL function(const(CERT_CONTEXT)*, LPARAM, uint, uint);
alias PFNCMHOOKPROC = uint function(HWND, uint, WPARAM, LPARAM);
struct CERT_SELECT_STRUCT_A
{
    uint dwSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    const(char)* pTemplateName;
    CERT_SELECT_STRUCT_FLAGS dwFlags;
    const(char)* szTitle;
    uint cCertStore;
    HCERTSTORE* arrayCertStore;
    const(char)* szPurposeOid;
    uint cCertContext;
    CERT_CONTEXT** arrayCertContext;
    LPARAM lCustData;
    PFNCMHOOKPROC pfnHook;
    PFNCMFILTERPROC pfnFilter;
    const(char)* szHelpFileName;
    uint dwHelpId;
    ulong hprov;
}
struct CERT_SELECT_STRUCT_W
{
    uint dwSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    const(wchar)* pTemplateName;
    CERT_SELECT_STRUCT_FLAGS dwFlags;
    const(wchar)* szTitle;
    uint cCertStore;
    HCERTSTORE* arrayCertStore;
    const(char)* szPurposeOid;
    uint cCertContext;
    CERT_CONTEXT** arrayCertContext;
    LPARAM lCustData;
    PFNCMHOOKPROC pfnHook;
    PFNCMFILTERPROC pfnFilter;
    const(wchar)* szHelpFileName;
    uint dwHelpId;
    ulong hprov;
}
struct CERT_VIEWPROPERTIES_STRUCT_A
{
    uint dwSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    CERT_VIEWPROPERTIES_STRUCT_FLAGS dwFlags;
    const(char)* szTitle;
    const(CERT_CONTEXT)* pCertContext;
    PSTR* arrayPurposes;
    uint cArrayPurposes;
    uint cRootStores;
    HCERTSTORE* rghstoreRoots;
    uint cStores;
    HCERTSTORE* rghstoreCAs;
    uint cTrustStores;
    HCERTSTORE* rghstoreTrust;
    ulong hprov;
    LPARAM lCustData;
    uint dwPad;
    const(char)* szHelpFileName;
    uint dwHelpId;
    uint nStartPage;
    uint cArrayPropSheetPages;
    PROPSHEETPAGEA* arrayPropSheetPages;
}
struct CERT_VIEWPROPERTIES_STRUCT_W
{
    uint dwSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    CERT_VIEWPROPERTIES_STRUCT_FLAGS dwFlags;
    const(wchar)* szTitle;
    const(CERT_CONTEXT)* pCertContext;
    PSTR* arrayPurposes;
    uint cArrayPurposes;
    uint cRootStores;
    HCERTSTORE* rghstoreRoots;
    uint cStores;
    HCERTSTORE* rghstoreCAs;
    uint cTrustStores;
    HCERTSTORE* rghstoreTrust;
    ulong hprov;
    LPARAM lCustData;
    uint dwPad;
    const(wchar)* szHelpFileName;
    uint dwHelpId;
    uint nStartPage;
    uint cArrayPropSheetPages;
    PROPSHEETPAGEA* arrayPropSheetPages;
}
struct CERT_FILTER_EXTENSION_MATCH
{
    const(char)* szExtensionOID;
    uint dwTestOperation;
    ubyte* pbTestData;
    uint cbTestData;
}
struct CERT_FILTER_DATA
{
    uint dwSize;
    uint cExtensionChecks;
    CERT_FILTER_EXTENSION_MATCH* arrayExtensionChecks;
    uint dwCheckingFlags;
}
alias PFNTRUSTHELPER = HRESULT function(const(CERT_CONTEXT)*, LPARAM, BOOL, ubyte*);
struct CERT_VERIFY_CERTIFICATE_TRUST
{
    uint cbSize;
    const(CERT_CONTEXT)* pccert;
    uint dwFlags;
    uint dwIgnoreErr;
    uint* pdwErrors;
    PSTR pszUsageOid;
    ulong hprov;
    uint cRootStores;
    HCERTSTORE* rghstoreRoots;
    uint cStores;
    HCERTSTORE* rghstoreCAs;
    uint cTrustStores;
    HCERTSTORE* rghstoreTrust;
    LPARAM lCustData;
    PFNTRUSTHELPER pfnTrustHelper;
    uint* pcChain;
    CERT_CONTEXT*** prgChain;
    uint** prgdwErrors;
    CRYPTOAPI_BLOB** prgpbTrustInfo;
}
struct CTL_MODIFY_REQUEST
{
    const(CERT_CONTEXT)* pccert;
    CTL_MODIFY_REQUEST_OPERATION dwOperation;
    uint dwError;
}
alias PFNCFILTERPROC = BOOL function(const(CERT_CONTEXT)*, BOOL*, void*);
struct CERT_SELECTUI_INPUT
{
    HCERTSTORE hStore;
    CERT_CHAIN_CONTEXT** prgpChain;
    uint cChain;
}
struct CRYPTUI_CERT_MGR_STRUCT
{
    uint dwSize;
    HWND hwndParent;
    uint dwFlags;
    const(wchar)* pwszTitle;
    const(char)* pszInitUsageOID;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO
{
    uint dwSize;
    GUID* pGuidSubject;
    uint cbBlob;
    ubyte* pbBlob;
    const(wchar)* pwszDisplayName;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO
{
    uint dwSize;
    uint cCertStore;
    HCERTSTORE* rghCertStore;
    PFNCFILTERPROC pFilterCallback;
    void* pvCallbackData;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO
{
    uint dwSize;
    PWSTR pwszPvkFileName;
    PWSTR pwszProvName;
    uint dwProvType;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO
{
    uint dwSize;
    PWSTR pwszSigningCertFileName;
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION dwPvkChoice;
    union
    {
        CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO* pPvkFileInfo;
        CRYPT_KEY_PROV_INFO* pPvkProvInfo;
    }
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO
{
    uint dwSize;
    CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE dwAttrFlags;
    const(wchar)* pwszDescription;
    const(wchar)* pwszMoreInfoLocation;
    const(char)* pszHashAlg;
    const(wchar)* pwszSigningCertDisplayString;
    HCERTSTORE hAdditionalCertStore;
    CRYPT_ATTRIBUTES* psAuthenticated;
    CRYPT_ATTRIBUTES* psUnauthenticated;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_INFO
{
    uint dwSize;
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT dwSubjectChoice;
    union
    {
        const(wchar)* pwszFileName;
        CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO* pSignBlobInfo;
    }
    CRYPTUI_WIZ_DIGITAL_SIGN dwSigningCertChoice;
    union
    {
        const(CERT_CONTEXT)* pSigningCertContext;
        CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO* pSigningCertStore;
        CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO* pSigningCertPvkInfo;
    }
    const(wchar)* pwszTimestampURL;
    CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE dwAdditionalCertChoice;
    CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO* pSignExtInfo;
}
struct CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT
{
    uint dwSize;
    uint cbBlob;
    ubyte* pbBlob;
}
struct CRYPTUI_INITDIALOG_STRUCT
{
    LPARAM lParam;
    const(CERT_CONTEXT)* pCertContext;
}
struct CRYPTUI_VIEWCERTIFICATE_STRUCTW
{
    uint dwSize;
    HWND hwndParent;
    CRYPTUI_VIEWCERTIFICATE_FLAGS dwFlags;
    const(wchar)* szTitle;
    const(CERT_CONTEXT)* pCertContext;
    PSTR* rgszPurposes;
    uint cPurposes;
    union
    {
        const(CRYPT_PROVIDER_DATA)* pCryptProviderData;
        HANDLE hWVTStateData;
    }
    BOOL fpCryptProviderDataTrustedUsage;
    uint idxSigner;
    uint idxCert;
    BOOL fCounterSigner;
    uint idxCounterSigner;
    uint cStores;
    HCERTSTORE* rghStores;
    uint cPropSheetPages;
    PROPSHEETPAGEW* rgPropSheetPages;
    uint nStartPage;
}
struct CRYPTUI_VIEWCERTIFICATE_STRUCTA
{
    uint dwSize;
    HWND hwndParent;
    CRYPTUI_VIEWCERTIFICATE_FLAGS dwFlags;
    const(char)* szTitle;
    const(CERT_CONTEXT)* pCertContext;
    PSTR* rgszPurposes;
    uint cPurposes;
    union
    {
        const(CRYPT_PROVIDER_DATA)* pCryptProviderData;
        HANDLE hWVTStateData;
    }
    BOOL fpCryptProviderDataTrustedUsage;
    uint idxSigner;
    uint idxCert;
    BOOL fCounterSigner;
    uint idxCounterSigner;
    uint cStores;
    HCERTSTORE* rghStores;
    uint cPropSheetPages;
    PROPSHEETPAGEA* rgPropSheetPages;
    uint nStartPage;
}
struct CRYPTUI_WIZ_EXPORT_INFO
{
    uint dwSize;
    const(wchar)* pwszExportFileName;
    CRYPTUI_WIZ_EXPORT_SUBJECT dwSubjectChoice;
    union
    {
        const(CERT_CONTEXT)* pCertContext;
        CTL_CONTEXT* pCTLContext;
        CRL_CONTEXT* pCRLContext;
        HCERTSTORE hCertStore;
    }
    uint cStores;
    HCERTSTORE* rghStores;
}
struct CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO
{
    uint dwSize;
    CRYPTUI_WIZ_EXPORT_FORMAT dwExportFormat;
    BOOL fExportChain;
    BOOL fExportPrivateKeys;
    const(wchar)* pwszPassword;
    BOOL fStrongEncryption;
}
struct CRYPTUI_WIZ_IMPORT_SRC_INFO
{
    uint dwSize;
    CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION dwSubjectChoice;
    union
    {
        const(wchar)* pwszFileName;
        const(CERT_CONTEXT)* pCertContext;
        CTL_CONTEXT* pCTLContext;
        CRL_CONTEXT* pCRLContext;
        HCERTSTORE hCertStore;
    }
    CRYPT_KEY_FLAGS dwFlags;
    const(wchar)* pwszPassword;
}
