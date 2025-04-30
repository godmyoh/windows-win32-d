module windows.win32.data.rightsmanagement;

import windows.win32.foundation : BOOL, FARPROC, HRESULT, HWND, PWSTR, SYSTEMTIME;

version (Windows):
extern (Windows):

HRESULT DRMSetGlobalOptions(DRMGLOBALOPTIONS eGlobalOptions, void* pvdata, uint dwlen);
HRESULT DRMGetClientVersion(DRM_CLIENT_VERSION_INFO* pDRMClientVersionInfo);
HRESULT DRMInitEnvironment(DRMSECURITYPROVIDERTYPE eSecurityProviderType, DRMSPECTYPE eSpecification, PWSTR wszSecurityProvider, PWSTR wszManifestCredentials, PWSTR wszMachineCredentials, uint* phEnv, uint* phDefaultLibrary);
HRESULT DRMLoadLibrary(uint hEnv, DRMSPECTYPE eSpecification, PWSTR wszLibraryProvider, PWSTR wszCredentials, uint* phLibrary);
HRESULT DRMCreateEnablingPrincipal(uint hEnv, uint hLibrary, PWSTR wszObject, DRMID* pidPrincipal, PWSTR wszCredentials, uint* phEnablingPrincipal);
HRESULT DRMCloseHandle(uint handle);
HRESULT DRMCloseEnvironmentHandle(uint hEnv);
HRESULT DRMDuplicateHandle(uint hToCopy, uint* phCopy);
HRESULT DRMDuplicateEnvironmentHandle(uint hToCopy, uint* phCopy);
HRESULT DRMRegisterRevocationList(uint hEnv, PWSTR wszRevocationList);
HRESULT DRMCheckSecurity(uint hEnv, uint cLevel);
HRESULT DRMRegisterContent(BOOL fRegister);
HRESULT DRMEncrypt(uint hCryptoProvider, uint iPosition, uint cNumInBytes, ubyte* pbInData, uint* pcNumOutBytes, ubyte* pbOutData);
HRESULT DRMDecrypt(uint hCryptoProvider, uint iPosition, uint cNumInBytes, ubyte* pbInData, uint* pcNumOutBytes, ubyte* pbOutData);
HRESULT DRMCreateBoundLicense(uint hEnv, DRMBOUNDLICENSEPARAMS* pParams, PWSTR wszLicenseChain, uint* phBoundLicense, uint* phErrorLog);
HRESULT DRMCreateEnablingBitsDecryptor(uint hBoundLicense, PWSTR wszRight, uint hAuxLib, PWSTR wszAuxPlug, uint* phDecryptor);
HRESULT DRMCreateEnablingBitsEncryptor(uint hBoundLicense, PWSTR wszRight, uint hAuxLib, PWSTR wszAuxPlug, uint* phEncryptor);
HRESULT DRMAttest(uint hEnablingPrincipal, PWSTR wszData, DRMATTESTTYPE eType, uint* pcAttestedBlob, PWSTR wszAttestedBlob);
HRESULT DRMGetTime(uint hEnv, DRMTIMETYPE eTimerIdType, SYSTEMTIME* poTimeObject);
HRESULT DRMGetInfo(uint handle, PWSTR wszAttribute, DRMENCODINGTYPE* peEncoding, uint* pcBuffer, ubyte* pbBuffer);
HRESULT DRMGetEnvironmentInfo(uint handle, PWSTR wszAttribute, DRMENCODINGTYPE* peEncoding, uint* pcBuffer, ubyte* pbBuffer);
HRESULT DRMGetProcAddress(uint hLibrary, PWSTR wszProcName, FARPROC* ppfnProcAddress);
HRESULT DRMGetBoundLicenseObjectCount(uint hQueryRoot, PWSTR wszSubObjectType, uint* pcSubObjects);
HRESULT DRMGetBoundLicenseObject(uint hQueryRoot, PWSTR wszSubObjectType, uint iWhich, uint* phSubObject);
HRESULT DRMGetBoundLicenseAttributeCount(uint hQueryRoot, PWSTR wszAttribute, uint* pcAttributes);
HRESULT DRMGetBoundLicenseAttribute(uint hQueryRoot, PWSTR wszAttribute, uint iWhich, DRMENCODINGTYPE* peEncoding, uint* pcBuffer, ubyte* pbBuffer);
HRESULT DRMCreateClientSession(DRMCALLBACK pfnCallback, uint uCallbackVersion, PWSTR wszGroupIDProviderType, PWSTR wszGroupID, uint* phClient);
HRESULT DRMIsActivated(uint hClient, uint uFlags, DRM_ACTSERV_INFO* pActServInfo);
HRESULT DRMActivate(uint hClient, uint uFlags, uint uLangID, DRM_ACTSERV_INFO* pActServInfo, void* pvContext, HWND hParentWnd);
HRESULT DRMGetServiceLocation(uint hClient, uint uServiceType, uint uServiceLocation, PWSTR wszIssuanceLicense, uint* puServiceURLLength, PWSTR wszServiceURL);
HRESULT DRMCreateLicenseStorageSession(uint hEnv, uint hDefaultLibrary, uint hClient, uint uFlags, PWSTR wszIssuanceLicense, uint* phLicenseStorage);
HRESULT DRMAddLicense(uint hLicenseStorage, uint uFlags, PWSTR wszLicense);
HRESULT DRMAcquireAdvisories(uint hLicenseStorage, PWSTR wszLicense, PWSTR wszURL, void* pvContext);
HRESULT DRMEnumerateLicense(uint hSession, uint uFlags, uint uIndex, BOOL* pfSharedFlag, uint* puCertificateDataLen, PWSTR wszCertificateData);
HRESULT DRMAcquireLicense(uint hSession, uint uFlags, PWSTR wszGroupIdentityCredential, PWSTR wszRequestedRights, PWSTR wszCustomData, PWSTR wszURL, void* pvContext);
HRESULT DRMDeleteLicense(uint hSession, PWSTR wszLicenseId);
HRESULT DRMCloseSession(uint hSession);
HRESULT DRMDuplicateSession(uint hSessionIn, uint* phSessionOut);
HRESULT DRMGetSecurityProvider(uint uFlags, uint* puTypeLen, PWSTR wszType, uint* puPathLen, PWSTR wszPath);
HRESULT DRMEncode(PWSTR wszAlgID, uint uDataLen, ubyte* pbDecodedData, uint* puEncodedStringLen, PWSTR wszEncodedString);
HRESULT DRMDecode(PWSTR wszAlgID, PWSTR wszEncodedString, uint* puDecodedDataLen, ubyte* pbDecodedData);
HRESULT DRMConstructCertificateChain(uint cCertificates, PWSTR* rgwszCertificates, uint* pcChain, PWSTR wszChain);
HRESULT DRMParseUnboundLicense(PWSTR wszCertificate, uint* phQueryRoot);
HRESULT DRMCloseQueryHandle(uint hQuery);
HRESULT DRMGetUnboundLicenseObjectCount(uint hQueryRoot, PWSTR wszSubObjectType, uint* pcSubObjects);
HRESULT DRMGetUnboundLicenseObject(uint hQueryRoot, PWSTR wszSubObjectType, uint iIndex, uint* phSubQuery);
HRESULT DRMGetUnboundLicenseAttributeCount(uint hQueryRoot, PWSTR wszAttributeType, uint* pcAttributes);
HRESULT DRMGetUnboundLicenseAttribute(uint hQueryRoot, PWSTR wszAttributeType, uint iWhich, DRMENCODINGTYPE* peEncoding, uint* pcBuffer, ubyte* pbBuffer);
HRESULT DRMGetCertificateChainCount(PWSTR wszChain, uint* pcCertCount);
HRESULT DRMDeconstructCertificateChain(PWSTR wszChain, uint iWhich, uint* pcCert, PWSTR wszCert);
HRESULT DRMVerify(PWSTR wszData, uint* pcAttestedData, PWSTR wszAttestedData, DRMATTESTTYPE* peType, uint* pcPrincipal, PWSTR wszPrincipal, uint* pcManifest, PWSTR wszManifest);
HRESULT DRMCreateUser(PWSTR wszUserName, PWSTR wszUserId, PWSTR wszUserIdType, uint* phUser);
HRESULT DRMCreateRight(PWSTR wszRightName, SYSTEMTIME* pstFrom, SYSTEMTIME* pstUntil, uint cExtendedInfo, PWSTR* pwszExtendedInfoName, PWSTR* pwszExtendedInfoValue, uint* phRight);
HRESULT DRMCreateIssuanceLicense(SYSTEMTIME* pstTimeFrom, SYSTEMTIME* pstTimeUntil, PWSTR wszReferralInfoName, PWSTR wszReferralInfoURL, uint hOwner, PWSTR wszIssuanceLicense, uint hBoundLicense, uint* phIssuanceLicense);
HRESULT DRMAddRightWithUser(uint hIssuanceLicense, uint hRight, uint hUser);
HRESULT DRMClearAllRights(uint hIssuanceLicense);
HRESULT DRMSetMetaData(uint hIssuanceLicense, PWSTR wszContentId, PWSTR wszContentIdType, PWSTR wszSKUId, PWSTR wszSKUIdType, PWSTR wszContentType, PWSTR wszContentName);
HRESULT DRMSetUsagePolicy(uint hIssuanceLicense, DRM_USAGEPOLICY_TYPE eUsagePolicyType, BOOL fDelete, BOOL fExclusion, PWSTR wszName, PWSTR wszMinVersion, PWSTR wszMaxVersion, PWSTR wszPublicKey, PWSTR wszDigestAlgorithm, ubyte* pbDigest, uint cbDigest);
HRESULT DRMSetRevocationPoint(uint hIssuanceLicense, BOOL fDelete, PWSTR wszId, PWSTR wszIdType, PWSTR wszURL, SYSTEMTIME* pstFrequency, PWSTR wszName, PWSTR wszPublicKey);
HRESULT DRMSetApplicationSpecificData(uint hIssuanceLicense, BOOL fDelete, PWSTR wszName, PWSTR wszValue);
HRESULT DRMSetNameAndDescription(uint hIssuanceLicense, BOOL fDelete, uint lcid, PWSTR wszName, PWSTR wszDescription);
HRESULT DRMSetIntervalTime(uint hIssuanceLicense, uint cDays);
HRESULT DRMGetIssuanceLicenseTemplate(uint hIssuanceLicense, uint* puIssuanceLicenseTemplateLength, PWSTR wszIssuanceLicenseTemplate);
HRESULT DRMGetSignedIssuanceLicense(uint hEnv, uint hIssuanceLicense, uint uFlags, ubyte* pbSymKey, uint cbSymKey, PWSTR wszSymKeyType, PWSTR wszClientLicensorCertificate, DRMCALLBACK pfnCallback, PWSTR wszURL, void* pvContext);
HRESULT DRMGetSignedIssuanceLicenseEx(uint hEnv, uint hIssuanceLicense, uint uFlags, ubyte* pbSymKey, uint cbSymKey, PWSTR wszSymKeyType, void* pvReserved, uint hEnablingPrincipal, uint hBoundLicenseCLC, DRMCALLBACK pfnCallback, void* pvContext);
HRESULT DRMClosePubHandle(uint hPub);
HRESULT DRMDuplicatePubHandle(uint hPubIn, uint* phPubOut);
HRESULT DRMGetUserInfo(uint hUser, uint* puUserNameLength, PWSTR wszUserName, uint* puUserIdLength, PWSTR wszUserId, uint* puUserIdTypeLength, PWSTR wszUserIdType);
HRESULT DRMGetRightInfo(uint hRight, uint* puRightNameLength, PWSTR wszRightName, SYSTEMTIME* pstFrom, SYSTEMTIME* pstUntil);
HRESULT DRMGetRightExtendedInfo(uint hRight, uint uIndex, uint* puExtendedInfoNameLength, PWSTR wszExtendedInfoName, uint* puExtendedInfoValueLength, PWSTR wszExtendedInfoValue);
HRESULT DRMGetUsers(uint hIssuanceLicense, uint uIndex, uint* phUser);
HRESULT DRMGetUserRights(uint hIssuanceLicense, uint hUser, uint uIndex, uint* phRight);
HRESULT DRMGetMetaData(uint hIssuanceLicense, uint* puContentIdLength, PWSTR wszContentId, uint* puContentIdTypeLength, PWSTR wszContentIdType, uint* puSKUIdLength, PWSTR wszSKUId, uint* puSKUIdTypeLength, PWSTR wszSKUIdType, uint* puContentTypeLength, PWSTR wszContentType, uint* puContentNameLength, PWSTR wszContentName);
HRESULT DRMGetApplicationSpecificData(uint hIssuanceLicense, uint uIndex, uint* puNameLength, PWSTR wszName, uint* puValueLength, PWSTR wszValue);
HRESULT DRMGetIssuanceLicenseInfo(uint hIssuanceLicense, SYSTEMTIME* pstTimeFrom, SYSTEMTIME* pstTimeUntil, uint uFlags, uint* puDistributionPointNameLength, PWSTR wszDistributionPointName, uint* puDistributionPointURLLength, PWSTR wszDistributionPointURL, uint* phOwner, BOOL* pfOfficial);
HRESULT DRMGetRevocationPoint(uint hIssuanceLicense, uint* puIdLength, PWSTR wszId, uint* puIdTypeLength, PWSTR wszIdType, uint* puURLLength, PWSTR wszRL, SYSTEMTIME* pstFrequency, uint* puNameLength, PWSTR wszName, uint* puPublicKeyLength, PWSTR wszPublicKey);
HRESULT DRMGetUsagePolicy(uint hIssuanceLicense, uint uIndex, DRM_USAGEPOLICY_TYPE* peUsagePolicyType, BOOL* pfExclusion, uint* puNameLength, PWSTR wszName, uint* puMinVersionLength, PWSTR wszMinVersion, uint* puMaxVersionLength, PWSTR wszMaxVersion, uint* puPublicKeyLength, PWSTR wszPublicKey, uint* puDigestAlgorithmLength, PWSTR wszDigestAlgorithm, uint* pcbDigest, ubyte* pbDigest);
HRESULT DRMGetNameAndDescription(uint hIssuanceLicense, uint uIndex, uint* pulcid, uint* puNameLength, PWSTR wszName, uint* puDescriptionLength, PWSTR wszDescription);
HRESULT DRMGetOwnerLicense(uint hIssuanceLicense, uint* puOwnerLicenseLength, PWSTR wszOwnerLicense);
HRESULT DRMGetIntervalTime(uint hIssuanceLicense, uint* pcDays);
HRESULT DRMRepair();
HRESULT DRMRegisterProtectedWindow(uint hEnv, HWND hwnd);
HRESULT DRMIsWindowProtected(HWND hwnd, BOOL* pfProtected);
HRESULT DRMAcquireIssuanceLicenseTemplate(uint hClient, uint uFlags, void* pvReserved, uint cTemplates, PWSTR* pwszTemplateIds, PWSTR wszUrl, void* pvContext);
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

alias DRMCALLBACK = HRESULT function(DRM_STATUS_MSG param0, HRESULT param1, void* param2, void* param3);
