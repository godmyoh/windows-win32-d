module windows.win32.data.rightsmanagement;

import windows.win32.foundation : BOOL, FARPROC, HRESULT, HWND, PWSTR, SYSTEMTIME;

version (Windows):
extern (Windows):

HRESULT DRMSetGlobalOptions(DRMGLOBALOPTIONS, void*, uint);
HRESULT DRMGetClientVersion(DRM_CLIENT_VERSION_INFO*);
HRESULT DRMInitEnvironment(DRMSECURITYPROVIDERTYPE, DRMSPECTYPE, PWSTR, PWSTR, PWSTR, uint*, uint*);
HRESULT DRMLoadLibrary(uint, DRMSPECTYPE, PWSTR, PWSTR, uint*);
HRESULT DRMCreateEnablingPrincipal(uint, uint, PWSTR, DRMID*, PWSTR, uint*);
HRESULT DRMCloseHandle(uint);
HRESULT DRMCloseEnvironmentHandle(uint);
HRESULT DRMDuplicateHandle(uint, uint*);
HRESULT DRMDuplicateEnvironmentHandle(uint, uint*);
HRESULT DRMRegisterRevocationList(uint, PWSTR);
HRESULT DRMCheckSecurity(uint, uint);
HRESULT DRMRegisterContent(BOOL);
HRESULT DRMEncrypt(uint, uint, uint, ubyte*, uint*, ubyte*);
HRESULT DRMDecrypt(uint, uint, uint, ubyte*, uint*, ubyte*);
HRESULT DRMCreateBoundLicense(uint, DRMBOUNDLICENSEPARAMS*, PWSTR, uint*, uint*);
HRESULT DRMCreateEnablingBitsDecryptor(uint, PWSTR, uint, PWSTR, uint*);
HRESULT DRMCreateEnablingBitsEncryptor(uint, PWSTR, uint, PWSTR, uint*);
HRESULT DRMAttest(uint, PWSTR, DRMATTESTTYPE, uint*, PWSTR);
HRESULT DRMGetTime(uint, DRMTIMETYPE, SYSTEMTIME*);
HRESULT DRMGetInfo(uint, PWSTR, DRMENCODINGTYPE*, uint*, ubyte*);
HRESULT DRMGetEnvironmentInfo(uint, PWSTR, DRMENCODINGTYPE*, uint*, ubyte*);
HRESULT DRMGetProcAddress(uint, PWSTR, FARPROC*);
HRESULT DRMGetBoundLicenseObjectCount(uint, PWSTR, uint*);
HRESULT DRMGetBoundLicenseObject(uint, PWSTR, uint, uint*);
HRESULT DRMGetBoundLicenseAttributeCount(uint, PWSTR, uint*);
HRESULT DRMGetBoundLicenseAttribute(uint, PWSTR, uint, DRMENCODINGTYPE*, uint*, ubyte*);
HRESULT DRMCreateClientSession(DRMCALLBACK, uint, PWSTR, PWSTR, uint*);
HRESULT DRMIsActivated(uint, uint, DRM_ACTSERV_INFO*);
HRESULT DRMActivate(uint, uint, uint, DRM_ACTSERV_INFO*, void*, HWND);
HRESULT DRMGetServiceLocation(uint, uint, uint, PWSTR, uint*, PWSTR);
HRESULT DRMCreateLicenseStorageSession(uint, uint, uint, uint, PWSTR, uint*);
HRESULT DRMAddLicense(uint, uint, PWSTR);
HRESULT DRMAcquireAdvisories(uint, PWSTR, PWSTR, void*);
HRESULT DRMEnumerateLicense(uint, uint, uint, BOOL*, uint*, PWSTR);
HRESULT DRMAcquireLicense(uint, uint, PWSTR, PWSTR, PWSTR, PWSTR, void*);
HRESULT DRMDeleteLicense(uint, PWSTR);
HRESULT DRMCloseSession(uint);
HRESULT DRMDuplicateSession(uint, uint*);
HRESULT DRMGetSecurityProvider(uint, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMEncode(PWSTR, uint, ubyte*, uint*, PWSTR);
HRESULT DRMDecode(PWSTR, PWSTR, uint*, ubyte*);
HRESULT DRMConstructCertificateChain(uint, PWSTR*, uint*, PWSTR);
HRESULT DRMParseUnboundLicense(PWSTR, uint*);
HRESULT DRMCloseQueryHandle(uint);
HRESULT DRMGetUnboundLicenseObjectCount(uint, PWSTR, uint*);
HRESULT DRMGetUnboundLicenseObject(uint, PWSTR, uint, uint*);
HRESULT DRMGetUnboundLicenseAttributeCount(uint, PWSTR, uint*);
HRESULT DRMGetUnboundLicenseAttribute(uint, PWSTR, uint, DRMENCODINGTYPE*, uint*, ubyte*);
HRESULT DRMGetCertificateChainCount(PWSTR, uint*);
HRESULT DRMDeconstructCertificateChain(PWSTR, uint, uint*, PWSTR);
HRESULT DRMVerify(PWSTR, uint*, PWSTR, DRMATTESTTYPE*, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMCreateUser(PWSTR, PWSTR, PWSTR, uint*);
HRESULT DRMCreateRight(PWSTR, SYSTEMTIME*, SYSTEMTIME*, uint, PWSTR*, PWSTR*, uint*);
HRESULT DRMCreateIssuanceLicense(SYSTEMTIME*, SYSTEMTIME*, PWSTR, PWSTR, uint, PWSTR, uint, uint*);
HRESULT DRMAddRightWithUser(uint, uint, uint);
HRESULT DRMClearAllRights(uint);
HRESULT DRMSetMetaData(uint, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR);
HRESULT DRMSetUsagePolicy(uint, DRM_USAGEPOLICY_TYPE, BOOL, BOOL, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, ubyte*, uint);
HRESULT DRMSetRevocationPoint(uint, BOOL, PWSTR, PWSTR, PWSTR, SYSTEMTIME*, PWSTR, PWSTR);
HRESULT DRMSetApplicationSpecificData(uint, BOOL, PWSTR, PWSTR);
HRESULT DRMSetNameAndDescription(uint, BOOL, uint, PWSTR, PWSTR);
HRESULT DRMSetIntervalTime(uint, uint);
HRESULT DRMGetIssuanceLicenseTemplate(uint, uint*, PWSTR);
HRESULT DRMGetSignedIssuanceLicense(uint, uint, uint, ubyte*, uint, PWSTR, PWSTR, DRMCALLBACK, PWSTR, void*);
HRESULT DRMGetSignedIssuanceLicenseEx(uint, uint, uint, ubyte*, uint, PWSTR, void*, uint, uint, DRMCALLBACK, void*);
HRESULT DRMClosePubHandle(uint);
HRESULT DRMDuplicatePubHandle(uint, uint*);
HRESULT DRMGetUserInfo(uint, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetRightInfo(uint, uint*, PWSTR, SYSTEMTIME*, SYSTEMTIME*);
HRESULT DRMGetRightExtendedInfo(uint, uint, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetUsers(uint, uint, uint*);
HRESULT DRMGetUserRights(uint, uint, uint, uint*);
HRESULT DRMGetMetaData(uint, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetApplicationSpecificData(uint, uint, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetIssuanceLicenseInfo(uint, SYSTEMTIME*, SYSTEMTIME*, uint, uint*, PWSTR, uint*, PWSTR, uint*, BOOL*);
HRESULT DRMGetRevocationPoint(uint, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, SYSTEMTIME*, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetUsagePolicy(uint, uint, DRM_USAGEPOLICY_TYPE*, BOOL*, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, ubyte*);
HRESULT DRMGetNameAndDescription(uint, uint, uint*, uint*, PWSTR, uint*, PWSTR);
HRESULT DRMGetOwnerLicense(uint, uint*, PWSTR);
HRESULT DRMGetIntervalTime(uint, uint*);
HRESULT DRMRepair();
HRESULT DRMRegisterProtectedWindow(uint, HWND);
HRESULT DRMIsWindowProtected(HWND, BOOL*);
HRESULT DRMAcquireIssuanceLicenseTemplate(uint, uint, void*, uint, PWSTR*, PWSTR, void*);
enum DRMHANDLE_INVALID = 0x00000000;
enum DRMENVHANDLE_INVALID = 0x00000000;
enum DRMQUERYHANDLE_INVALID = 0x00000000;
enum DRMHSESSION_INVALID = 0x00000000;
enum DRMPUBHANDLE_INVALID = 0x00000000;
enum DRM_AL_NONSILENT = 0x00000001;
enum DRM_AL_NOPERSIST = 0x00000002;
enum DRM_AL_CANCEL = 0x00000004;
enum DRM_AL_FETCHNOADVISORY = 0x00000008;
enum DRM_AL_NOUI = 0x00000010;
enum DRM_ACTIVATE_MACHINE = 0x00000001;
enum DRM_ACTIVATE_GROUPIDENTITY = 0x00000002;
enum DRM_ACTIVATE_TEMPORARY = 0x00000004;
enum DRM_ACTIVATE_CANCEL = 0x00000008;
enum DRM_ACTIVATE_SILENT = 0x00000010;
enum DRM_ACTIVATE_SHARED_GROUPIDENTITY = 0x00000020;
enum DRM_ACTIVATE_DELAYED = 0x00000040;
enum DRM_EL_MACHINE = 0x00000001;
enum DRM_EL_GROUPIDENTITY = 0x00000002;
enum DRM_EL_GROUPIDENTITY_NAME = 0x00000004;
enum DRM_EL_GROUPIDENTITY_LID = 0x00000008;
enum DRM_EL_SPECIFIED_GROUPIDENTITY = 0x00000010;
enum DRM_EL_EUL = 0x00000020;
enum DRM_EL_EUL_LID = 0x00000040;
enum DRM_EL_CLIENTLICENSOR = 0x00000080;
enum DRM_EL_CLIENTLICENSOR_LID = 0x00000100;
enum DRM_EL_SPECIFIED_CLIENTLICENSOR = 0x00000200;
enum DRM_EL_REVOCATIONLIST = 0x00000400;
enum DRM_EL_REVOCATIONLIST_LID = 0x00000800;
enum DRM_EL_EXPIRED = 0x00001000;
enum DRM_EL_ISSUERNAME = 0x00002000;
enum DRM_EL_ISSUANCELICENSE_TEMPLATE = 0x00004000;
enum DRM_EL_ISSUANCELICENSE_TEMPLATE_LID = 0x00008000;
enum DRM_ADD_LICENSE_NOPERSIST = 0x00000000;
enum DRM_ADD_LICENSE_PERSIST = 0x00000001;
enum DRM_SERVICE_TYPE_ACTIVATION = 0x00000001;
enum DRM_SERVICE_TYPE_CERTIFICATION = 0x00000002;
enum DRM_SERVICE_TYPE_PUBLISHING = 0x00000004;
enum DRM_SERVICE_TYPE_CLIENTLICENSOR = 0x00000008;
enum DRM_SERVICE_TYPE_SILENT = 0x00000010;
enum DRM_SERVICE_LOCATION_INTERNET = 0x00000001;
enum DRM_SERVICE_LOCATION_ENTERPRISE = 0x00000002;
enum DRM_DEFAULTGROUPIDTYPE_WINDOWSAUTH = "WindowsAuthProvider";
enum DRM_DEFAULTGROUPIDTYPE_PASSPORT = "PassportAuthProvider";
enum DRM_SIGN_ONLINE = 0x00000001;
enum DRM_SIGN_OFFLINE = 0x00000002;
enum DRM_SIGN_CANCEL = 0x00000004;
enum DRM_SERVER_ISSUANCELICENSE = 0x00000008;
enum DRM_AUTO_GENERATE_KEY = 0x00000010;
enum DRM_OWNER_LICENSE_NOPERSIST = 0x00000020;
enum DRM_REUSE_KEY = 0x00000040;
enum DRM_LOCKBOXTYPE_NONE = 0x00000000;
enum DRM_LOCKBOXTYPE_WHITEBOX = 0x00000001;
enum DRM_LOCKBOXTYPE_BLACKBOX = 0x00000002;
enum DRM_LOCKBOXTYPE_DEFAULT = 0x00000002;
enum DRM_AILT_NONSILENT = 0x00000001;
enum DRM_AILT_OBTAIN_ALL = 0x00000002;
enum DRM_AILT_CANCEL = 0x00000004;
enum MSDRM_CLIENT_ZONE = 0x0000cf00;
enum MSDRM_POLICY_ZONE = 0x00009300;
enum DRMIDVERSION = 0x00000000;
enum DRMBOUNDLICENSEPARAMSVERSION = 0x00000001;
enum DRMBINDINGFLAGS_IGNORE_VALIDITY_INTERVALS = 0x00000001;
enum DRMLICENSEACQDATAVERSION = 0x00000000;
enum DRMACTSERVINFOVERSION = 0x00000000;
enum DRMCLIENTSTRUCTVERSION = 0x00000001;
enum DRMCALLBACKVERSION = 0x00000001;
struct DRMID
{
    uint uVersion;
    PWSTR wszIDType;
    PWSTR wszID;
}
alias DRMTIMETYPE = int;
enum : int
{
    DRMTIMETYPE_SYSTEMUTC   = 0x00000000,
    DRMTIMETYPE_SYSTEMLOCAL = 0x00000001,
}

alias DRMENCODINGTYPE = int;
enum : int
{
    DRMENCODINGTYPE_BASE64 = 0x00000000,
    DRMENCODINGTYPE_STRING = 0x00000001,
    DRMENCODINGTYPE_LONG   = 0x00000002,
    DRMENCODINGTYPE_TIME   = 0x00000003,
    DRMENCODINGTYPE_UINT   = 0x00000004,
    DRMENCODINGTYPE_RAW    = 0x00000005,
}

alias DRMATTESTTYPE = int;
enum : int
{
    DRMATTESTTYPE_FULLENVIRONMENT = 0x00000000,
    DRMATTESTTYPE_HASHONLY        = 0x00000001,
}

alias DRMSPECTYPE = int;
enum : int
{
    DRMSPECTYPE_UNKNOWN  = 0x00000000,
    DRMSPECTYPE_FILENAME = 0x00000001,
}

alias DRMSECURITYPROVIDERTYPE = int;
enum : int
{
    DRMSECURITYPROVIDERTYPE_SOFTWARESECREP = 0x00000000,
}

alias DRMGLOBALOPTIONS = int;
enum : int
{
    DRMGLOBALOPTIONS_USE_WINHTTP                 = 0x00000000,
    DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR = 0x00000001,
}

struct DRMBOUNDLICENSEPARAMS
{
    uint uVersion;
    uint hEnablingPrincipal;
    uint hSecureStore;
    PWSTR wszRightsRequested;
    PWSTR wszRightsGroup;
    DRMID idResource;
    uint cAuthenticatorCount;
    uint* rghAuthenticators;
    PWSTR wszDefaultEnablingPrincipalCredentials;
    uint dwFlags;
}
struct DRM_LICENSE_ACQ_DATA
{
    uint uVersion;
    PWSTR wszURL;
    PWSTR wszLocalFilename;
    ubyte* pbPostData;
    uint dwPostDataSize;
    PWSTR wszFriendlyName;
}
struct DRM_ACTSERV_INFO
{
    uint uVersion;
    PWSTR wszPubKey;
    PWSTR wszURL;
}
struct DRM_CLIENT_VERSION_INFO
{
    uint uStructVersion;
    uint[4] dwVersion;
    wchar[256] wszHierarchy;
    wchar[256] wszProductId;
    wchar[256] wszProductDescription;
}
alias DRM_STATUS_MSG = int;
enum : int
{
    DRM_MSG_ACTIVATE_MACHINE                  = 0x00000000,
    DRM_MSG_ACTIVATE_GROUPIDENTITY            = 0x00000001,
    DRM_MSG_ACQUIRE_LICENSE                   = 0x00000002,
    DRM_MSG_ACQUIRE_ADVISORY                  = 0x00000003,
    DRM_MSG_SIGN_ISSUANCE_LICENSE             = 0x00000004,
    DRM_MSG_ACQUIRE_CLIENTLICENSOR            = 0x00000005,
    DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE = 0x00000006,
}

alias DRM_USAGEPOLICY_TYPE = int;
enum : int
{
    DRM_USAGEPOLICY_TYPE_BYNAME      = 0x00000000,
    DRM_USAGEPOLICY_TYPE_BYPUBLICKEY = 0x00000001,
    DRM_USAGEPOLICY_TYPE_BYDIGEST    = 0x00000002,
    DRM_USAGEPOLICY_TYPE_OSEXCLUSION = 0x00000003,
}

alias DRM_DISTRIBUTION_POINT_INFO = int;
enum : int
{
    DRM_DISTRIBUTION_POINT_LICENSE_ACQUISITION = 0x00000000,
    DRM_DISTRIBUTION_POINT_PUBLISHING          = 0x00000001,
    DRM_DISTRIBUTION_POINT_REFERRAL_INFO       = 0x00000002,
}

alias DRMCALLBACK = HRESULT function(DRM_STATUS_MSG, HRESULT, void*, void*);
