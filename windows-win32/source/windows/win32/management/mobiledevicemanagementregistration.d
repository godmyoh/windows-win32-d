module windows.win32.management.mobiledevicemanagementregistration;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;

version (Windows):
extern (Windows):

HRESULT GetDeviceRegistrationInfo(REGISTRATION_INFORMATION_CLASS, void**);
HRESULT IsDeviceRegisteredWithManagement(BOOL*, uint, PWSTR);
HRESULT IsManagementRegistrationAllowed(BOOL*);
HRESULT IsMdmUxWithoutAadAllowed(BOOL*);
HRESULT SetManagedExternally(BOOL);
HRESULT DiscoverManagementService(const(wchar)*, MANAGEMENT_SERVICE_INFO**);
HRESULT RegisterDeviceWithManagementUsingAADCredentials(HANDLE);
HRESULT RegisterDeviceWithManagementUsingAADDeviceCredentials();
HRESULT RegisterDeviceWithManagementUsingAADDeviceCredentials2(const(wchar)*);
HRESULT RegisterDeviceWithManagement(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT UnregisterDeviceWithManagement(const(wchar)*);
HRESULT GetDeviceManagementConfigInfo(const(wchar)*, uint*, PWSTR);
HRESULT SetDeviceManagementConfigInfo(const(wchar)*, const(wchar)*);
HRESULT GetManagementAppHyperlink(uint, PWSTR);
HRESULT DiscoverManagementServiceEx(const(wchar)*, const(wchar)*, MANAGEMENT_SERVICE_INFO**);
HRESULT RegisterDeviceWithLocalManagement(BOOL*);
HRESULT ApplyLocalManagementSyncML(const(wchar)*, PWSTR*);
HRESULT UnregisterDeviceWithLocalManagement();
enum MENROLL_E_DEVICE_MESSAGE_FORMAT_ERROR = 0xffffffff80180001;
enum MENROLL_E_DEVICE_AUTHENTICATION_ERROR = 0xffffffff80180002;
enum MENROLL_E_DEVICE_AUTHORIZATION_ERROR = 0xffffffff80180003;
enum MENROLL_E_DEVICE_CERTIFICATEREQUEST_ERROR = 0xffffffff80180004;
enum MENROLL_E_DEVICE_CONFIGMGRSERVER_ERROR = 0xffffffff80180005;
enum MENROLL_E_DEVICE_INTERNALSERVICE_ERROR = 0xffffffff80180006;
enum MENROLL_E_DEVICE_INVALIDSECURITY_ERROR = 0xffffffff80180007;
enum MENROLL_E_DEVICE_UNKNOWN_ERROR = 0xffffffff80180008;
enum MENROLL_E_ENROLLMENT_IN_PROGRESS = 0xffffffff80180009;
enum MENROLL_E_DEVICE_ALREADY_ENROLLED = 0xffffffff8018000a;
enum MENROLL_E_DISCOVERY_SEC_CERT_DATE_INVALID = 0xffffffff8018000d;
enum MENROLL_E_PASSWORD_NEEDED = 0xffffffff8018000e;
enum MENROLL_E_WAB_ERROR = 0xffffffff8018000f;
enum MENROLL_E_CONNECTIVITY = 0xffffffff80180010;
enum MENROLL_E_INVALIDSSLCERT = 0xffffffff80180012;
enum MENROLL_E_DEVICEAPREACHED = 0xffffffff80180013;
enum MENROLL_E_DEVICENOTSUPPORTED = 0xffffffff80180014;
enum MENROLL_E_NOT_SUPPORTED = 0xffffffff80180015;
enum MENROLL_E_NOTELIGIBLETORENEW = 0xffffffff80180016;
enum MENROLL_E_INMAINTENANCE = 0xffffffff80180017;
enum MENROLL_E_USER_LICENSE = 0xffffffff80180018;
enum MENROLL_E_ENROLLMENTDATAINVALID = 0xffffffff80180019;
enum MENROLL_E_INSECUREREDIRECT = 0xffffffff8018001a;
enum MENROLL_E_PLATFORM_WRONG_STATE = 0xffffffff8018001b;
enum MENROLL_E_PLATFORM_LICENSE_ERROR = 0xffffffff8018001c;
enum MENROLL_E_PLATFORM_UNKNOWN_ERROR = 0xffffffff8018001d;
enum MENROLL_E_PROV_CSP_CERTSTORE = 0xffffffff8018001e;
enum MENROLL_E_PROV_CSP_W7 = 0xffffffff8018001f;
enum MENROLL_E_PROV_CSP_DMCLIENT = 0xffffffff80180020;
enum MENROLL_E_PROV_CSP_PFW = 0xffffffff80180021;
enum MENROLL_E_PROV_CSP_MISC = 0xffffffff80180022;
enum MENROLL_E_PROV_UNKNOWN = 0xffffffff80180023;
enum MENROLL_E_PROV_SSLCERTNOTFOUND = 0xffffffff80180024;
enum MENROLL_E_PROV_CSP_APPMGMT = 0xffffffff80180025;
enum MENROLL_E_DEVICE_MANAGEMENT_BLOCKED = 0xffffffff80180026;
enum MENROLL_E_CERTPOLICY_PRIVATEKEYCREATION_FAILED = 0xffffffff80180027;
enum MENROLL_E_CERTAUTH_FAILED_TO_FIND_CERT = 0xffffffff80180028;
enum MENROLL_E_EMPTY_MESSAGE = 0xffffffff80180029;
enum MENROLL_E_USER_CANCELLED = 0xffffffff80180030;
enum MENROLL_E_MDM_NOT_CONFIGURED = 0xffffffff80180031;
enum MDM_REGISTRATION_FACILITY_CODE = 0x00000019;
enum DEVICE_ENROLLER_FACILITY_CODE = 0x00000018;
enum MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR = 0xffffffff80190001;
enum MREGISTER_E_DEVICE_AUTHENTICATION_ERROR = 0xffffffff80190002;
enum MREGISTER_E_DEVICE_AUTHORIZATION_ERROR = 0xffffffff80190003;
enum MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR = 0xffffffff80190004;
enum MENROLL_E_DEVICE_CERTIFCATEREQUEST_ERROR = 0xffffffff80180004;
enum MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR = 0xffffffff80190005;
enum MREGISTER_E_DEVICE_INTERNALSERVICE_ERROR = 0xffffffff80190006;
enum MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR = 0xffffffff80190007;
enum MREGISTER_E_DEVICE_UNKNOWN_ERROR = 0xffffffff80190008;
enum MREGISTER_E_REGISTRATION_IN_PROGRESS = 0xffffffff80190009;
enum MREGISTER_E_DEVICE_ALREADY_REGISTERED = 0xffffffff8019000a;
enum MREGISTER_E_DEVICE_NOT_REGISTERED = 0xffffffff8019000b;
enum MENROLL_E_DEVICE_NOT_ENROLLED = 0xffffffff8018000b;
enum MREGISTER_E_DISCOVERY_REDIRECTED = 0xffffffff8019000c;
enum MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR = 0xffffffff8019000d;
enum MREGISTER_E_DISCOVERY_FAILED = 0xffffffff8019000e;
enum MENROLL_E_DEVICECAPREACHED = 0xffffffff80180013;
enum MENROLL_E_NOTSUPPORTED = 0xffffffff80180015;
enum MENROLL_E_USERLICENSE = 0xffffffff80180018;
enum MENROLL_E_USER_CANCELED = 0xffffffff8018002a;
enum DEVICEREGISTRATIONTYPE_MDM_ONLY = 0x00000000;
enum DEVICEREGISTRATIONTYPE_MAM = 0x00000005;
enum DEVICEREGISTRATIONTYPE_MDM_DEVICEWIDE_WITH_AAD = 0x00000006;
enum DEVICEREGISTRATIONTYPE_MDM_USERSPECIFIC_WITH_AAD = 0x0000000d;
struct MANAGEMENT_SERVICE_INFO
{
    PWSTR pszMDMServiceUri;
    PWSTR pszAuthenticationUri;
}
struct MANAGEMENT_REGISTRATION_INFO
{
    BOOL fDeviceRegisteredWithManagement;
    uint dwDeviceRegistionKind;
    PWSTR pszUPN;
    PWSTR pszMDMServiceUri;
}
alias REGISTRATION_INFORMATION_CLASS = int;
enum : int
{
    DeviceRegistrationBasicInfo = 0x00000001,
    MaxDeviceInfoClass          = 0x00000002,
}
