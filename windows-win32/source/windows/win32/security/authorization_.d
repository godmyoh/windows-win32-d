module windows.win32.security.authorization_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE, HRESULT, HWND, LUID, PSID, PSTR, PWSTR, VARIANT_BOOL, WIN32_ERROR;
import windows.win32.security_ : ACE_FLAGS, ACE_HEADER, ACL, GENERIC_MAPPING, OBJECT_SECURITY_INFORMATION, OBJECT_TYPE_LIST, PSECURITY_DESCRIPTOR, SID, SID_AND_ATTRIBUTES, SYSTEM_AUDIT_OBJECT_ACE_FLAGS, TOKEN_GROUPS;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE;

version (Windows):
extern (Windows):

alias AUTHZ_RESOURCE_MANAGER_FLAGS = uint;
enum : uint
{
    AUTHZ_RM_FLAG_NO_AUDIT                       = 0x00000001,
    AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION = 0x00000002,
    AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES     = 0x00000004,
}

alias AUTHZ_ACCESS_CHECK_FLAGS = uint;
enum : uint
{
    AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD = 0x00000001,
}

alias AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS = uint;
enum : uint
{
    AUTHZ_NO_SUCCESS_AUDIT = 0x00000001,
    AUTHZ_NO_FAILURE_AUDIT = 0x00000002,
    AUTHZ_NO_ALLOC_STRINGS = 0x00000004,
}

alias TREE_SEC_INFO = uint;
enum : uint
{
    TREE_SEC_INFO_SET                 = 0x00000001,
    TREE_SEC_INFO_RESET               = 0x00000002,
    TREE_SEC_INFO_RESET_KEEP_EXPLICIT = 0x00000003,
}

alias AUTHZ_GENERATE_RESULTS = uint;
enum : uint
{
    AUTHZ_GENERATE_SUCCESS_AUDIT = 0x00000001,
    AUTHZ_GENERATE_FAILURE_AUDIT = 0x00000002,
}

alias ACTRL_ACCESS_ENTRY_ACCESS_FLAGS = uint;
enum : uint
{
    ACTRL_ACCESS_ALLOWED = 0x00000001,
    ACTRL_ACCESS_DENIED  = 0x00000002,
    ACTRL_AUDIT_SUCCESS  = 0x00000004,
    ACTRL_AUDIT_FAILURE  = 0x00000008,
}

alias AUTHZ_SECURITY_ATTRIBUTE_FLAGS = uint;
enum : uint
{
    AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE      = 0x00000001,
    AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 0x00000002,
}

BOOL AuthzAccessCheck(AUTHZ_ACCESS_CHECK_FLAGS, AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_ACCESS_REQUEST*, AUTHZ_AUDIT_EVENT_HANDLE, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, uint, AUTHZ_ACCESS_REPLY*, long*);
BOOL AuthzCachedAccessCheck(uint, AUTHZ_ACCESS_CHECK_RESULTS_HANDLE, AUTHZ_ACCESS_REQUEST*, AUTHZ_AUDIT_EVENT_HANDLE, AUTHZ_ACCESS_REPLY*);
BOOL AuthzOpenObjectAudit(uint, AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_ACCESS_REQUEST*, AUTHZ_AUDIT_EVENT_HANDLE, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, uint, AUTHZ_ACCESS_REPLY*);
BOOL AuthzFreeHandle(AUTHZ_ACCESS_CHECK_RESULTS_HANDLE);
BOOL AuthzInitializeResourceManager(uint, PFN_AUTHZ_DYNAMIC_ACCESS_CHECK, PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS, PFN_AUTHZ_FREE_DYNAMIC_GROUPS, const(wchar)*, AUTHZ_RESOURCE_MANAGER_HANDLE*);
BOOL AuthzInitializeResourceManagerEx(AUTHZ_RESOURCE_MANAGER_FLAGS, AUTHZ_INIT_INFO*, AUTHZ_RESOURCE_MANAGER_HANDLE*);
BOOL AuthzInitializeRemoteResourceManager(AUTHZ_RPC_INIT_INFO_CLIENT*, AUTHZ_RESOURCE_MANAGER_HANDLE*);
BOOL AuthzFreeResourceManager(AUTHZ_RESOURCE_MANAGER_HANDLE);
BOOL AuthzInitializeContextFromToken(uint, HANDLE, AUTHZ_RESOURCE_MANAGER_HANDLE, long*, LUID, void*, AUTHZ_CLIENT_CONTEXT_HANDLE*);
BOOL AuthzInitializeContextFromSid(uint, PSID, AUTHZ_RESOURCE_MANAGER_HANDLE, long*, LUID, void*, AUTHZ_CLIENT_CONTEXT_HANDLE*);
BOOL AuthzInitializeContextFromAuthzContext(uint, AUTHZ_CLIENT_CONTEXT_HANDLE, long*, LUID, void*, AUTHZ_CLIENT_CONTEXT_HANDLE*);
BOOL AuthzInitializeCompoundContext(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_CLIENT_CONTEXT_HANDLE*);
BOOL AuthzAddSidsToContext(AUTHZ_CLIENT_CONTEXT_HANDLE, SID_AND_ATTRIBUTES*, uint, SID_AND_ATTRIBUTES*, uint, AUTHZ_CLIENT_CONTEXT_HANDLE*);
BOOL AuthzModifySecurityAttributes(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*);
BOOL AuthzModifyClaims(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_CONTEXT_INFORMATION_CLASS, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*);
BOOL AuthzModifySids(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_CONTEXT_INFORMATION_CLASS, AUTHZ_SID_OPERATION*, TOKEN_GROUPS*);
BOOL AuthzSetAppContainerInformation(AUTHZ_CLIENT_CONTEXT_HANDLE, PSID, uint, SID_AND_ATTRIBUTES*);
BOOL AuthzGetInformationFromContext(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_CONTEXT_INFORMATION_CLASS, uint, uint*, void*);
BOOL AuthzFreeContext(AUTHZ_CLIENT_CONTEXT_HANDLE);
BOOL AuthzInitializeObjectAccessAuditEvent(AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS, AUTHZ_AUDIT_EVENT_TYPE_HANDLE, PWSTR, PWSTR, PWSTR, PWSTR, long*, uint);
BOOL AuthzInitializeObjectAccessAuditEvent2(uint, AUTHZ_AUDIT_EVENT_TYPE_HANDLE, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, long*, uint);
BOOL AuthzFreeAuditEvent(AUTHZ_AUDIT_EVENT_HANDLE);
BOOL AuthzEvaluateSacl(AUTHZ_CLIENT_CONTEXT_HANDLE, AUTHZ_ACCESS_REQUEST*, ACL*, uint, BOOL, BOOL*);
BOOL AuthzInstallSecurityEventSource(uint, AUTHZ_SOURCE_SCHEMA_REGISTRATION*);
BOOL AuthzUninstallSecurityEventSource(uint, const(wchar)*);
BOOL AuthzEnumerateSecurityEventSources(uint, AUTHZ_SOURCE_SCHEMA_REGISTRATION*, uint*, uint*);
BOOL AuthzRegisterSecurityEventSource(uint, const(wchar)*, long*);
BOOL AuthzUnregisterSecurityEventSource(uint, long*);
BOOL AuthzReportSecurityEvent(uint, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, uint, PSID, uint);
BOOL AuthzReportSecurityEventFromParams(uint, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE, uint, PSID, AUDIT_PARAMS*);
BOOL AuthzRegisterCapChangeNotification(AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__**, LPTHREAD_START_ROUTINE, void*);
BOOL AuthzUnregisterCapChangeNotification(AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__*);
BOOL AuthzFreeCentralAccessPolicyCache();
WIN32_ERROR SetEntriesInAclA(uint, EXPLICIT_ACCESS_A*, ACL*, ACL**);
WIN32_ERROR SetEntriesInAclW(uint, EXPLICIT_ACCESS_W*, ACL*, ACL**);
WIN32_ERROR GetExplicitEntriesFromAclA(ACL*, uint*, EXPLICIT_ACCESS_A**);
WIN32_ERROR GetExplicitEntriesFromAclW(ACL*, uint*, EXPLICIT_ACCESS_W**);
WIN32_ERROR GetEffectiveRightsFromAclA(ACL*, TRUSTEE_A*, uint*);
WIN32_ERROR GetEffectiveRightsFromAclW(ACL*, TRUSTEE_W*, uint*);
WIN32_ERROR GetAuditedPermissionsFromAclA(ACL*, TRUSTEE_A*, uint*, uint*);
WIN32_ERROR GetAuditedPermissionsFromAclW(ACL*, TRUSTEE_W*, uint*, uint*);
WIN32_ERROR GetNamedSecurityInfoA(const(char)*, SE_OBJECT_TYPE, OBJECT_SECURITY_INFORMATION, PSID*, PSID*, ACL**, ACL**, PSECURITY_DESCRIPTOR*);
WIN32_ERROR GetNamedSecurityInfoW(const(wchar)*, SE_OBJECT_TYPE, OBJECT_SECURITY_INFORMATION, PSID*, PSID*, ACL**, ACL**, PSECURITY_DESCRIPTOR*);
WIN32_ERROR GetSecurityInfo(HANDLE, SE_OBJECT_TYPE, uint, PSID*, PSID*, ACL**, ACL**, PSECURITY_DESCRIPTOR*);
WIN32_ERROR SetNamedSecurityInfoA(PSTR, SE_OBJECT_TYPE, OBJECT_SECURITY_INFORMATION, PSID, PSID, ACL*, ACL*);
WIN32_ERROR SetNamedSecurityInfoW(PWSTR, SE_OBJECT_TYPE, OBJECT_SECURITY_INFORMATION, PSID, PSID, ACL*, ACL*);
WIN32_ERROR SetSecurityInfo(HANDLE, SE_OBJECT_TYPE, uint, PSID, PSID, ACL*, ACL*);
WIN32_ERROR GetInheritanceSourceA(PSTR, SE_OBJECT_TYPE, uint, BOOL, GUID**, uint, ACL*, FN_OBJECT_MGR_FUNCTS*, GENERIC_MAPPING*, INHERITED_FROMA*);
WIN32_ERROR GetInheritanceSourceW(PWSTR, SE_OBJECT_TYPE, uint, BOOL, GUID**, uint, ACL*, FN_OBJECT_MGR_FUNCTS*, GENERIC_MAPPING*, INHERITED_FROMW*);
WIN32_ERROR FreeInheritedFromArray(INHERITED_FROMW*, ushort, FN_OBJECT_MGR_FUNCTS*);
WIN32_ERROR TreeResetNamedSecurityInfoA(PSTR, SE_OBJECT_TYPE, uint, PSID, PSID, ACL*, ACL*, BOOL, FN_PROGRESS, PROG_INVOKE_SETTING, void*);
WIN32_ERROR TreeResetNamedSecurityInfoW(PWSTR, SE_OBJECT_TYPE, uint, PSID, PSID, ACL*, ACL*, BOOL, FN_PROGRESS, PROG_INVOKE_SETTING, void*);
WIN32_ERROR TreeSetNamedSecurityInfoA(PSTR, SE_OBJECT_TYPE, uint, PSID, PSID, ACL*, ACL*, TREE_SEC_INFO, FN_PROGRESS, PROG_INVOKE_SETTING, void*);
WIN32_ERROR TreeSetNamedSecurityInfoW(PWSTR, SE_OBJECT_TYPE, uint, PSID, PSID, ACL*, ACL*, TREE_SEC_INFO, FN_PROGRESS, PROG_INVOKE_SETTING, void*);
WIN32_ERROR BuildSecurityDescriptorA(TRUSTEE_A*, TRUSTEE_A*, uint, EXPLICIT_ACCESS_A*, uint, EXPLICIT_ACCESS_A*, PSECURITY_DESCRIPTOR, uint*, PSECURITY_DESCRIPTOR*);
WIN32_ERROR BuildSecurityDescriptorW(TRUSTEE_W*, TRUSTEE_W*, uint, EXPLICIT_ACCESS_W*, uint, EXPLICIT_ACCESS_W*, PSECURITY_DESCRIPTOR, uint*, PSECURITY_DESCRIPTOR*);
WIN32_ERROR LookupSecurityDescriptorPartsA(TRUSTEE_A**, TRUSTEE_A**, uint*, EXPLICIT_ACCESS_A**, uint*, EXPLICIT_ACCESS_A**, PSECURITY_DESCRIPTOR);
WIN32_ERROR LookupSecurityDescriptorPartsW(TRUSTEE_W**, TRUSTEE_W**, uint*, EXPLICIT_ACCESS_W**, uint*, EXPLICIT_ACCESS_W**, PSECURITY_DESCRIPTOR);
void BuildExplicitAccessWithNameA(EXPLICIT_ACCESS_A*, PSTR, uint, ACCESS_MODE, ACE_FLAGS);
void BuildExplicitAccessWithNameW(EXPLICIT_ACCESS_W*, PWSTR, uint, ACCESS_MODE, ACE_FLAGS);
void BuildImpersonateExplicitAccessWithNameA(EXPLICIT_ACCESS_A*, PSTR, TRUSTEE_A*, uint, ACCESS_MODE, uint);
void BuildImpersonateExplicitAccessWithNameW(EXPLICIT_ACCESS_W*, PWSTR, TRUSTEE_W*, uint, ACCESS_MODE, uint);
void BuildTrusteeWithNameA(TRUSTEE_A*, PSTR);
void BuildTrusteeWithNameW(TRUSTEE_W*, PWSTR);
void BuildImpersonateTrusteeA(TRUSTEE_A*, TRUSTEE_A*);
void BuildImpersonateTrusteeW(TRUSTEE_W*, TRUSTEE_W*);
void BuildTrusteeWithSidA(TRUSTEE_A*, PSID);
void BuildTrusteeWithSidW(TRUSTEE_W*, PSID);
void BuildTrusteeWithObjectsAndSidA(TRUSTEE_A*, OBJECTS_AND_SID*, GUID*, GUID*, PSID);
void BuildTrusteeWithObjectsAndSidW(TRUSTEE_W*, OBJECTS_AND_SID*, GUID*, GUID*, PSID);
void BuildTrusteeWithObjectsAndNameA(TRUSTEE_A*, OBJECTS_AND_NAME_A*, SE_OBJECT_TYPE, PSTR, PSTR, PSTR);
void BuildTrusteeWithObjectsAndNameW(TRUSTEE_W*, OBJECTS_AND_NAME_W*, SE_OBJECT_TYPE, PWSTR, PWSTR, PWSTR);
PSTR GetTrusteeNameA(TRUSTEE_A*);
PWSTR GetTrusteeNameW(TRUSTEE_W*);
TRUSTEE_TYPE GetTrusteeTypeA(TRUSTEE_A*);
TRUSTEE_TYPE GetTrusteeTypeW(TRUSTEE_W*);
TRUSTEE_FORM GetTrusteeFormA(TRUSTEE_A*);
TRUSTEE_FORM GetTrusteeFormW(TRUSTEE_W*);
MULTIPLE_TRUSTEE_OPERATION GetMultipleTrusteeOperationA(TRUSTEE_A*);
MULTIPLE_TRUSTEE_OPERATION GetMultipleTrusteeOperationW(TRUSTEE_W*);
TRUSTEE_A* GetMultipleTrusteeA(TRUSTEE_A*);
TRUSTEE_W* GetMultipleTrusteeW(TRUSTEE_W*);
BOOL ConvertSidToStringSidA(PSID, PSTR*);
BOOL ConvertSidToStringSidW(PSID, PWSTR*);
BOOL ConvertStringSidToSidA(const(char)*, PSID*);
BOOL ConvertStringSidToSidW(const(wchar)*, PSID*);
BOOL ConvertStringSecurityDescriptorToSecurityDescriptorA(const(char)*, uint, PSECURITY_DESCRIPTOR*, uint*);
BOOL ConvertStringSecurityDescriptorToSecurityDescriptorW(const(wchar)*, uint, PSECURITY_DESCRIPTOR*, uint*);
BOOL ConvertSecurityDescriptorToStringSecurityDescriptorA(PSECURITY_DESCRIPTOR, uint, uint, PSTR*, uint*);
BOOL ConvertSecurityDescriptorToStringSecurityDescriptorW(PSECURITY_DESCRIPTOR, uint, uint, PWSTR*, uint*);
enum SDDL_REVISION_1 = 0x00000001;
enum SDDL_REVISION = 0x00000001;
enum SDDL_OWNER = "O";
enum SDDL_GROUP = "G";
enum SDDL_DACL = "D";
enum SDDL_SACL = "S";
enum SDDL_PROTECTED = "P";
enum SDDL_AUTO_INHERIT_REQ = "AR";
enum SDDL_AUTO_INHERITED = "AI";
enum SDDL_NULL_ACL = "NO_ACCESS_CONTROL";
enum SDDL_ACCESS_ALLOWED = "A";
enum SDDL_ACCESS_DENIED = "D";
enum SDDL_OBJECT_ACCESS_ALLOWED = "OA";
enum SDDL_OBJECT_ACCESS_DENIED = "OD";
enum SDDL_AUDIT = "AU";
enum SDDL_ALARM = "AL";
enum SDDL_OBJECT_AUDIT = "OU";
enum SDDL_OBJECT_ALARM = "OL";
enum SDDL_MANDATORY_LABEL = "ML";
enum SDDL_PROCESS_TRUST_LABEL = "TL";
enum SDDL_CALLBACK_ACCESS_ALLOWED = "XA";
enum SDDL_CALLBACK_ACCESS_DENIED = "XD";
enum SDDL_RESOURCE_ATTRIBUTE = "RA";
enum SDDL_SCOPED_POLICY_ID = "SP";
enum SDDL_CALLBACK_AUDIT = "XU";
enum SDDL_CALLBACK_OBJECT_ACCESS_ALLOWED = "ZA";
enum SDDL_ACCESS_FILTER = "FL";
enum SDDL_INT = "TI";
enum SDDL_UINT = "TU";
enum SDDL_WSTRING = "TS";
enum SDDL_SID = "TD";
enum SDDL_BLOB = "TX";
enum SDDL_BOOLEAN = "TB";
enum SDDL_CONTAINER_INHERIT = "CI";
enum SDDL_OBJECT_INHERIT = "OI";
enum SDDL_NO_PROPAGATE = "NP";
enum SDDL_INHERIT_ONLY = "IO";
enum SDDL_INHERITED = "ID";
enum SDDL_CRITICAL = "CR";
enum SDDL_TRUST_PROTECTED_FILTER = "TP";
enum SDDL_AUDIT_SUCCESS = "SA";
enum SDDL_AUDIT_FAILURE = "FA";
enum SDDL_READ_PROPERTY = "RP";
enum SDDL_WRITE_PROPERTY = "WP";
enum SDDL_CREATE_CHILD = "CC";
enum SDDL_DELETE_CHILD = "DC";
enum SDDL_LIST_CHILDREN = "LC";
enum SDDL_SELF_WRITE = "SW";
enum SDDL_LIST_OBJECT = "LO";
enum SDDL_DELETE_TREE = "DT";
enum SDDL_CONTROL_ACCESS = "CR";
enum SDDL_READ_CONTROL = "RC";
enum SDDL_WRITE_DAC = "WD";
enum SDDL_WRITE_OWNER = "WO";
enum SDDL_STANDARD_DELETE = "SD";
enum SDDL_GENERIC_ALL = "GA";
enum SDDL_GENERIC_READ = "GR";
enum SDDL_GENERIC_WRITE = "GW";
enum SDDL_GENERIC_EXECUTE = "GX";
enum SDDL_FILE_ALL = "FA";
enum SDDL_FILE_READ = "FR";
enum SDDL_FILE_WRITE = "FW";
enum SDDL_FILE_EXECUTE = "FX";
enum SDDL_KEY_ALL = "KA";
enum SDDL_KEY_READ = "KR";
enum SDDL_KEY_WRITE = "KW";
enum SDDL_KEY_EXECUTE = "KX";
enum SDDL_NO_WRITE_UP = "NW";
enum SDDL_NO_READ_UP = "NR";
enum SDDL_NO_EXECUTE_UP = "NX";
enum SDDL_ALIAS_SIZE = 0x00000002;
enum SDDL_DOMAIN_ADMINISTRATORS = "DA";
enum SDDL_DOMAIN_GUESTS = "DG";
enum SDDL_DOMAIN_USERS = "DU";
enum SDDL_ENTERPRISE_DOMAIN_CONTROLLERS = "ED";
enum SDDL_DOMAIN_DOMAIN_CONTROLLERS = "DD";
enum SDDL_DOMAIN_COMPUTERS = "DC";
enum SDDL_BUILTIN_ADMINISTRATORS = "BA";
enum SDDL_BUILTIN_GUESTS = "BG";
enum SDDL_BUILTIN_USERS = "BU";
enum SDDL_LOCAL_ADMIN = "LA";
enum SDDL_LOCAL_GUEST = "LG";
enum SDDL_ACCOUNT_OPERATORS = "AO";
enum SDDL_BACKUP_OPERATORS = "BO";
enum SDDL_PRINTER_OPERATORS = "PO";
enum SDDL_SERVER_OPERATORS = "SO";
enum SDDL_AUTHENTICATED_USERS = "AU";
enum SDDL_PERSONAL_SELF = "PS";
enum SDDL_CREATOR_OWNER = "CO";
enum SDDL_CREATOR_GROUP = "CG";
enum SDDL_LOCAL_SYSTEM = "SY";
enum SDDL_POWER_USERS = "PU";
enum SDDL_EVERYONE = "WD";
enum SDDL_REPLICATOR = "RE";
enum SDDL_INTERACTIVE = "IU";
enum SDDL_NETWORK = "NU";
enum SDDL_SERVICE = "SU";
enum SDDL_RESTRICTED_CODE = "RC";
enum SDDL_WRITE_RESTRICTED_CODE = "WR";
enum SDDL_ANONYMOUS = "AN";
enum SDDL_SCHEMA_ADMINISTRATORS = "SA";
enum SDDL_CERT_SERV_ADMINISTRATORS = "CA";
enum SDDL_RAS_SERVERS = "RS";
enum SDDL_ENTERPRISE_ADMINS = "EA";
enum SDDL_GROUP_POLICY_ADMINS = "PA";
enum SDDL_ALIAS_PREW2KCOMPACC = "RU";
enum SDDL_LOCAL_SERVICE = "LS";
enum SDDL_NETWORK_SERVICE = "NS";
enum SDDL_REMOTE_DESKTOP = "RD";
enum SDDL_NETWORK_CONFIGURATION_OPS = "NO";
enum SDDL_PERFMON_USERS = "MU";
enum SDDL_PERFLOG_USERS = "LU";
enum SDDL_IIS_USERS = "IS";
enum SDDL_CRYPTO_OPERATORS = "CY";
enum SDDL_OWNER_RIGHTS = "OW";
enum SDDL_EVENT_LOG_READERS = "ER";
enum SDDL_ENTERPRISE_RO_DCs = "RO";
enum SDDL_CERTSVC_DCOM_ACCESS = "CD";
enum SDDL_ALL_APP_PACKAGES = "AC";
enum SDDL_RDS_REMOTE_ACCESS_SERVERS = "RA";
enum SDDL_RDS_ENDPOINT_SERVERS = "ES";
enum SDDL_RDS_MANAGEMENT_SERVERS = "MS";
enum SDDL_USER_MODE_DRIVERS = "UD";
enum SDDL_HYPER_V_ADMINS = "HA";
enum SDDL_CLONEABLE_CONTROLLERS = "CN";
enum SDDL_ACCESS_CONTROL_ASSISTANCE_OPS = "AA";
enum SDDL_REMOTE_MANAGEMENT_USERS = "RM";
enum SDDL_AUTHORITY_ASSERTED = "AS";
enum SDDL_SERVICE_ASSERTED = "SS";
enum SDDL_PROTECTED_USERS = "AP";
enum SDDL_KEY_ADMINS = "KA";
enum SDDL_ENTERPRISE_KEY_ADMINS = "EK";
enum SDDL_ML_LOW = "LW";
enum SDDL_ML_MEDIUM = "ME";
enum SDDL_ML_MEDIUM_PLUS = "MP";
enum SDDL_ML_HIGH = "HI";
enum SDDL_ML_SYSTEM = "SI";
enum SDDL_SEPERATOR = ";";
enum SDDL_DELIMINATOR = ":";
enum SDDL_ACE_BEGIN = "(";
enum SDDL_ACE_END = ")";
enum SDDL_ACE_COND_BEGIN = "(";
enum SDDL_ACE_COND_END = ")";
enum SDDL_SPACE = " ";
enum SDDL_ACE_COND_BLOB_PREFIX = "#";
enum SDDL_ACE_COND_SID_PREFIX = "SID";
enum SDDL_ACE_COND_ATTRIBUTE_PREFIX = "@";
enum SDDL_ACE_COND_USER_ATTRIBUTE_PREFIX = "@USER.";
enum SDDL_ACE_COND_RESOURCE_ATTRIBUTE_PREFIX = "@RESOURCE.";
enum SDDL_ACE_COND_DEVICE_ATTRIBUTE_PREFIX = "@DEVICE.";
enum SDDL_ACE_COND_TOKEN_ATTRIBUTE_PREFIX = "@TOKEN.";
enum INHERITED_ACCESS_ENTRY = 0x00000010;
enum INHERITED_PARENT = 0x10000000;
enum INHERITED_GRANDPARENT = 0x20000000;
enum ACCCTRL_DEFAULT_PROVIDERA = "Windows NT Access Provider";
enum ACCCTRL_DEFAULT_PROVIDERW = "Windows NT Access Provider";
enum ACCCTRL_DEFAULT_PROVIDER = "Windows NT Access Provider";
enum TRUSTEE_ACCESS_ALLOWED = 0x00000001;
enum TRUSTEE_ACCESS_READ = 0x00000002;
enum TRUSTEE_ACCESS_WRITE = 0x00000004;
enum TRUSTEE_ACCESS_EXPLICIT = 0x00000001;
enum TRUSTEE_ACCESS_ALL = 0xffffffffffffffff;
enum ACTRL_RESERVED = 0x00000000;
enum ACTRL_PERM_1 = 0x00000001;
enum ACTRL_PERM_2 = 0x00000002;
enum ACTRL_PERM_3 = 0x00000004;
enum ACTRL_PERM_4 = 0x00000008;
enum ACTRL_PERM_5 = 0x00000010;
enum ACTRL_PERM_6 = 0x00000020;
enum ACTRL_PERM_7 = 0x00000040;
enum ACTRL_PERM_8 = 0x00000080;
enum ACTRL_PERM_9 = 0x00000100;
enum ACTRL_PERM_10 = 0x00000200;
enum ACTRL_PERM_11 = 0x00000400;
enum ACTRL_PERM_12 = 0x00000800;
enum ACTRL_PERM_13 = 0x00001000;
enum ACTRL_PERM_14 = 0x00002000;
enum ACTRL_PERM_15 = 0x00004000;
enum ACTRL_PERM_16 = 0x00008000;
enum ACTRL_PERM_17 = 0x00010000;
enum ACTRL_PERM_18 = 0x00020000;
enum ACTRL_PERM_19 = 0x00040000;
enum ACTRL_PERM_20 = 0x00080000;
enum ACTRL_ACCESS_PROTECTED = 0x00000001;
enum ACTRL_SYSTEM_ACCESS = 0x04000000;
enum ACTRL_DELETE = 0x08000000;
enum ACTRL_READ_CONTROL = 0x10000000;
enum ACTRL_CHANGE_ACCESS = 0x20000000;
enum ACTRL_CHANGE_OWNER = 0x40000000;
enum ACTRL_SYNCHRONIZE = 0x80000000;
enum ACTRL_STD_RIGHTS_ALL = 0xf8000000;
enum ACTRL_FILE_READ = 0x00000001;
enum ACTRL_FILE_WRITE = 0x00000002;
enum ACTRL_FILE_APPEND = 0x00000004;
enum ACTRL_FILE_READ_PROP = 0x00000008;
enum ACTRL_FILE_WRITE_PROP = 0x00000010;
enum ACTRL_FILE_EXECUTE = 0x00000020;
enum ACTRL_FILE_READ_ATTRIB = 0x00000080;
enum ACTRL_FILE_WRITE_ATTRIB = 0x00000100;
enum ACTRL_FILE_CREATE_PIPE = 0x00000200;
enum ACTRL_DIR_LIST = 0x00000001;
enum ACTRL_DIR_CREATE_OBJECT = 0x00000002;
enum ACTRL_DIR_CREATE_CHILD = 0x00000004;
enum ACTRL_DIR_DELETE_CHILD = 0x00000040;
enum ACTRL_DIR_TRAVERSE = 0x00000020;
enum ACTRL_KERNEL_TERMINATE = 0x00000001;
enum ACTRL_KERNEL_THREAD = 0x00000002;
enum ACTRL_KERNEL_VM = 0x00000004;
enum ACTRL_KERNEL_VM_READ = 0x00000008;
enum ACTRL_KERNEL_VM_WRITE = 0x00000010;
enum ACTRL_KERNEL_DUP_HANDLE = 0x00000020;
enum ACTRL_KERNEL_PROCESS = 0x00000040;
enum ACTRL_KERNEL_SET_INFO = 0x00000080;
enum ACTRL_KERNEL_GET_INFO = 0x00000100;
enum ACTRL_KERNEL_CONTROL = 0x00000200;
enum ACTRL_KERNEL_ALERT = 0x00000400;
enum ACTRL_KERNEL_GET_CONTEXT = 0x00000800;
enum ACTRL_KERNEL_SET_CONTEXT = 0x00001000;
enum ACTRL_KERNEL_TOKEN = 0x00002000;
enum ACTRL_KERNEL_IMPERSONATE = 0x00004000;
enum ACTRL_KERNEL_DIMPERSONATE = 0x00008000;
enum ACTRL_PRINT_SADMIN = 0x00000001;
enum ACTRL_PRINT_SLIST = 0x00000002;
enum ACTRL_PRINT_PADMIN = 0x00000004;
enum ACTRL_PRINT_PUSE = 0x00000008;
enum ACTRL_PRINT_JADMIN = 0x00000010;
enum ACTRL_SVC_GET_INFO = 0x00000001;
enum ACTRL_SVC_SET_INFO = 0x00000002;
enum ACTRL_SVC_STATUS = 0x00000004;
enum ACTRL_SVC_LIST = 0x00000008;
enum ACTRL_SVC_START = 0x00000010;
enum ACTRL_SVC_STOP = 0x00000020;
enum ACTRL_SVC_PAUSE = 0x00000040;
enum ACTRL_SVC_INTERROGATE = 0x00000080;
enum ACTRL_SVC_UCONTROL = 0x00000100;
enum ACTRL_REG_QUERY = 0x00000001;
enum ACTRL_REG_SET = 0x00000002;
enum ACTRL_REG_CREATE_CHILD = 0x00000004;
enum ACTRL_REG_LIST = 0x00000008;
enum ACTRL_REG_NOTIFY = 0x00000010;
enum ACTRL_REG_LINK = 0x00000020;
enum ACTRL_WIN_CLIPBRD = 0x00000001;
enum ACTRL_WIN_GLOBAL_ATOMS = 0x00000002;
enum ACTRL_WIN_CREATE = 0x00000004;
enum ACTRL_WIN_LIST_DESK = 0x00000008;
enum ACTRL_WIN_LIST = 0x00000010;
enum ACTRL_WIN_READ_ATTRIBS = 0x00000020;
enum ACTRL_WIN_WRITE_ATTRIBS = 0x00000040;
enum ACTRL_WIN_SCREEN = 0x00000080;
enum ACTRL_WIN_EXIT = 0x00000100;
enum ACTRL_ACCESS_NO_OPTIONS = 0x00000000;
enum ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES = 0x00000001;
enum AUDIT_TYPE_LEGACY = 0x00000001;
enum AUDIT_TYPE_WMI = 0x00000002;
enum AP_ParamTypeBits = 0x00000008;
enum AP_ParamTypeMask = 0x000000ff;
enum _AUTHZ_SS_MAXSIZE = 0x00000080;
enum APF_AuditFailure = 0x00000000;
enum APF_AuditSuccess = 0x00000001;
enum APF_ValidFlags = 0x00000001;
enum AUTHZP_WPD_EVENT = 0x00000010;
enum AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES = 0x00000001;
enum AUTHZ_MIGRATED_LEGACY_PUBLISHER = 0x00000002;
enum AUTHZ_AUDIT_INSTANCE_INFORMATION = 0x00000002;
enum AUTHZ_SKIP_TOKEN_GROUPS = 0x00000002;
enum AUTHZ_REQUIRE_S4U_LOGON = 0x00000004;
enum AUTHZ_COMPUTE_PRIVILEGES = 0x00000008;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID = 0x00000000;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64 = 0x00000001;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64 = 0x00000002;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING = 0x00000003;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN = 0x00000004;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID = 0x00000005;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 0x00000006;
enum AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 0x00000010;
enum AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 = 0x00000001;
enum AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION = 0x00000001;
enum AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1 = 0x00000001;
enum AUTHZ_INIT_INFO_VERSION_V1 = 0x00000001;
enum AUTHZ_WPD_CATEGORY_FLAG = 0x00000010;
enum AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES = 0x00000001;
enum OLESCRIPT_E_SYNTAX = 0xffffffff80020101;
alias SE_OBJECT_TYPE = int;
enum : int
{
    SE_UNKNOWN_OBJECT_TYPE     = 0x00000000,
    SE_FILE_OBJECT             = 0x00000001,
    SE_SERVICE                 = 0x00000002,
    SE_PRINTER                 = 0x00000003,
    SE_REGISTRY_KEY            = 0x00000004,
    SE_LMSHARE                 = 0x00000005,
    SE_KERNEL_OBJECT           = 0x00000006,
    SE_WINDOW_OBJECT           = 0x00000007,
    SE_DS_OBJECT               = 0x00000008,
    SE_DS_OBJECT_ALL           = 0x00000009,
    SE_PROVIDER_DEFINED_OBJECT = 0x0000000a,
    SE_WMIGUID_OBJECT          = 0x0000000b,
    SE_REGISTRY_WOW64_32KEY    = 0x0000000c,
    SE_REGISTRY_WOW64_64KEY    = 0x0000000d,
}

alias TRUSTEE_TYPE = int;
enum : int
{
    TRUSTEE_IS_UNKNOWN          = 0x00000000,
    TRUSTEE_IS_USER             = 0x00000001,
    TRUSTEE_IS_GROUP            = 0x00000002,
    TRUSTEE_IS_DOMAIN           = 0x00000003,
    TRUSTEE_IS_ALIAS            = 0x00000004,
    TRUSTEE_IS_WELL_KNOWN_GROUP = 0x00000005,
    TRUSTEE_IS_DELETED          = 0x00000006,
    TRUSTEE_IS_INVALID          = 0x00000007,
    TRUSTEE_IS_COMPUTER         = 0x00000008,
}

alias TRUSTEE_FORM = int;
enum : int
{
    TRUSTEE_IS_SID              = 0x00000000,
    TRUSTEE_IS_NAME             = 0x00000001,
    TRUSTEE_BAD_FORM            = 0x00000002,
    TRUSTEE_IS_OBJECTS_AND_SID  = 0x00000003,
    TRUSTEE_IS_OBJECTS_AND_NAME = 0x00000004,
}

alias MULTIPLE_TRUSTEE_OPERATION = int;
enum : int
{
    NO_MULTIPLE_TRUSTEE    = 0x00000000,
    TRUSTEE_IS_IMPERSONATE = 0x00000001,
}

struct OBJECTS_AND_SID
{
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS ObjectsPresent;
    GUID ObjectTypeGuid;
    GUID InheritedObjectTypeGuid;
    SID* pSid;
}
struct OBJECTS_AND_NAME_A
{
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS ObjectsPresent;
    SE_OBJECT_TYPE ObjectType;
    PSTR ObjectTypeName;
    PSTR InheritedObjectTypeName;
    PSTR ptstrName;
}
struct OBJECTS_AND_NAME_W
{
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS ObjectsPresent;
    SE_OBJECT_TYPE ObjectType;
    PWSTR ObjectTypeName;
    PWSTR InheritedObjectTypeName;
    PWSTR ptstrName;
}
struct TRUSTEE_A
{
    TRUSTEE_A* pMultipleTrustee;
    MULTIPLE_TRUSTEE_OPERATION MultipleTrusteeOperation;
    TRUSTEE_FORM TrusteeForm;
    TRUSTEE_TYPE TrusteeType;
    PSTR ptstrName;
}
struct TRUSTEE_W
{
    TRUSTEE_W* pMultipleTrustee;
    MULTIPLE_TRUSTEE_OPERATION MultipleTrusteeOperation;
    TRUSTEE_FORM TrusteeForm;
    TRUSTEE_TYPE TrusteeType;
    PWSTR ptstrName;
}
alias ACCESS_MODE = int;
enum : int
{
    NOT_USED_ACCESS   = 0x00000000,
    GRANT_ACCESS      = 0x00000001,
    SET_ACCESS        = 0x00000002,
    DENY_ACCESS       = 0x00000003,
    REVOKE_ACCESS     = 0x00000004,
    SET_AUDIT_SUCCESS = 0x00000005,
    SET_AUDIT_FAILURE = 0x00000006,
}

struct EXPLICIT_ACCESS_A
{
    uint grfAccessPermissions;
    ACCESS_MODE grfAccessMode;
    ACE_FLAGS grfInheritance;
    TRUSTEE_A Trustee;
}
struct EXPLICIT_ACCESS_W
{
    uint grfAccessPermissions;
    ACCESS_MODE grfAccessMode;
    ACE_FLAGS grfInheritance;
    TRUSTEE_W Trustee;
}
struct ACTRL_ACCESS_ENTRYA
{
    TRUSTEE_A Trustee;
    ACTRL_ACCESS_ENTRY_ACCESS_FLAGS fAccessFlags;
    uint Access;
    uint ProvSpecificAccess;
    ACE_FLAGS Inheritance;
    PSTR lpInheritProperty;
}
struct ACTRL_ACCESS_ENTRYW
{
    TRUSTEE_W Trustee;
    ACTRL_ACCESS_ENTRY_ACCESS_FLAGS fAccessFlags;
    uint Access;
    uint ProvSpecificAccess;
    ACE_FLAGS Inheritance;
    PWSTR lpInheritProperty;
}
struct ACTRL_ACCESS_ENTRY_LISTA
{
    uint cEntries;
    ACTRL_ACCESS_ENTRYA* pAccessList;
}
struct ACTRL_ACCESS_ENTRY_LISTW
{
    uint cEntries;
    ACTRL_ACCESS_ENTRYW* pAccessList;
}
struct ACTRL_PROPERTY_ENTRYA
{
    PSTR lpProperty;
    ACTRL_ACCESS_ENTRY_LISTA* pAccessEntryList;
    uint fListFlags;
}
struct ACTRL_PROPERTY_ENTRYW
{
    PWSTR lpProperty;
    ACTRL_ACCESS_ENTRY_LISTW* pAccessEntryList;
    uint fListFlags;
}
struct ACTRL_ACCESSA
{
    uint cEntries;
    ACTRL_PROPERTY_ENTRYA* pPropertyAccessList;
}
struct ACTRL_ACCESSW
{
    uint cEntries;
    ACTRL_PROPERTY_ENTRYW* pPropertyAccessList;
}
struct TRUSTEE_ACCESSA
{
    PSTR lpProperty;
    uint Access;
    uint fAccessFlags;
    uint fReturnedAccess;
}
struct TRUSTEE_ACCESSW
{
    PWSTR lpProperty;
    uint Access;
    uint fAccessFlags;
    uint fReturnedAccess;
}
struct ACTRL_OVERLAPPED
{
    union
    {
        void* Provider;
        uint Reserved1;
    }
    uint Reserved2;
    HANDLE hEvent;
}
struct ACTRL_ACCESS_INFOA
{
    uint fAccessPermission;
    PSTR lpAccessPermissionName;
}
struct ACTRL_ACCESS_INFOW
{
    uint fAccessPermission;
    PWSTR lpAccessPermissionName;
}
struct ACTRL_CONTROL_INFOA
{
    PSTR lpControlId;
    PSTR lpControlName;
}
struct ACTRL_CONTROL_INFOW
{
    PWSTR lpControlId;
    PWSTR lpControlName;
}
alias PROG_INVOKE_SETTING = int;
enum : int
{
    ProgressInvokeNever        = 0x00000001,
    ProgressInvokeEveryObject  = 0x00000002,
    ProgressInvokeOnError      = 0x00000003,
    ProgressCancelOperation    = 0x00000004,
    ProgressRetryOperation     = 0x00000005,
    ProgressInvokePrePostError = 0x00000006,
}

struct FN_OBJECT_MGR_FUNCTS
{
    uint Placeholder;
}
struct INHERITED_FROMA
{
    int GenerationGap;
    PSTR AncestorName;
}
struct INHERITED_FROMW
{
    int GenerationGap;
    PWSTR AncestorName;
}
alias AUDIT_PARAM_TYPE = int;
enum : int
{
    APT_None           = 0x00000001,
    APT_String         = 0x00000002,
    APT_Ulong          = 0x00000003,
    APT_Pointer        = 0x00000004,
    APT_Sid            = 0x00000005,
    APT_LogonId        = 0x00000006,
    APT_ObjectTypeList = 0x00000007,
    APT_Luid           = 0x00000008,
    APT_Guid           = 0x00000009,
    APT_Time           = 0x0000000a,
    APT_Int64          = 0x0000000b,
    APT_IpAddress      = 0x0000000c,
    APT_LogonIdWithSid = 0x0000000d,
}

struct AUDIT_OBJECT_TYPE
{
    GUID ObjectType;
    ushort Flags;
    ushort Level;
    uint AccessMask;
}
struct AUDIT_OBJECT_TYPES
{
    ushort Count;
    ushort Flags;
    AUDIT_OBJECT_TYPE* pObjectTypes;
}
struct AUDIT_IP_ADDRESS
{
    ubyte[128] pIpAddress;
}
struct AUDIT_PARAM
{
    AUDIT_PARAM_TYPE Type;
    uint Length;
    uint Flags;
    union
    {
        ulong Data0;
        PWSTR String;
        ulong u;
        SID* psid;
        GUID* pguid;
        uint LogonId_LowPart;
        AUDIT_OBJECT_TYPES* pObjectTypes;
        AUDIT_IP_ADDRESS* pIpAddress;
    }
    union
    {
        ulong Data1;
        int LogonId_HighPart;
    }
}
struct AUDIT_PARAMS
{
    uint Length;
    uint Flags;
    ushort Count;
    AUDIT_PARAM* Parameters;
}
struct AUTHZ_AUDIT_EVENT_TYPE_LEGACY
{
    ushort CategoryId;
    ushort AuditId;
    ushort ParameterCount;
}
union AUTHZ_AUDIT_EVENT_TYPE_UNION
{
    AUTHZ_AUDIT_EVENT_TYPE_LEGACY Legacy;
}
struct AUTHZ_AUDIT_EVENT_TYPE_OLD
{
    uint Version;
    uint dwFlags;
    int RefCount;
    ulong hAudit;
    LUID LinkId;
    AUTHZ_AUDIT_EVENT_TYPE_UNION u;
}
struct AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE__
{
    int unused;
}
struct AUTHZ_ACCESS_REQUEST
{
    uint DesiredAccess;
    PSID PrincipalSelfSid;
    OBJECT_TYPE_LIST* ObjectTypeList;
    uint ObjectTypeListLength;
    void* OptionalArguments;
}
struct AUTHZ_ACCESS_REPLY
{
    uint ResultListLength;
    uint* GrantedAccessMask;
    AUTHZ_GENERATE_RESULTS* SaclEvaluationResults;
    uint* Error;
}
alias PFN_AUTHZ_DYNAMIC_ACCESS_CHECK = BOOL function(AUTHZ_CLIENT_CONTEXT_HANDLE, ACE_HEADER*, void*, BOOL*);
alias PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS = BOOL function(AUTHZ_CLIENT_CONTEXT_HANDLE, void*, SID_AND_ATTRIBUTES**, uint*, SID_AND_ATTRIBUTES**, uint*);
alias PFN_AUTHZ_FREE_DYNAMIC_GROUPS = void function(SID_AND_ATTRIBUTES*);
alias PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY = BOOL function(AUTHZ_CLIENT_CONTEXT_HANDLE, PSID, void*, BOOL*, void**);
alias PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY = void function(void*);
struct AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE
{
    ulong Version;
    PWSTR pName;
}
struct AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
{
    void* pValue;
    uint ValueLength;
}
alias AUTHZ_SECURITY_ATTRIBUTE_OPERATION = int;
enum : int
{
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE        = 0x00000000,
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL = 0x00000001,
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD         = 0x00000002,
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE      = 0x00000003,
    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE     = 0x00000004,
}

alias AUTHZ_SID_OPERATION = int;
enum : int
{
    AUTHZ_SID_OPERATION_NONE        = 0x00000000,
    AUTHZ_SID_OPERATION_REPLACE_ALL = 0x00000001,
    AUTHZ_SID_OPERATION_ADD         = 0x00000002,
    AUTHZ_SID_OPERATION_DELETE      = 0x00000003,
    AUTHZ_SID_OPERATION_REPLACE     = 0x00000004,
}

struct AUTHZ_SECURITY_ATTRIBUTE_V1
{
    PWSTR pName;
    ushort ValueType;
    ushort Reserved;
    AUTHZ_SECURITY_ATTRIBUTE_FLAGS Flags;
    uint ValueCount;
    union _Values_e__Union
    {
        long* pInt64;
        ulong* pUint64;
        PWSTR* ppString;
        AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE* pFqbn;
        AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE* pOctetString;
    }
}
struct AUTHZ_SECURITY_ATTRIBUTES_INFORMATION
{
    ushort Version;
    ushort Reserved;
    uint AttributeCount;
    union _Attribute_e__Union
    {
        AUTHZ_SECURITY_ATTRIBUTE_V1* pAttributeV1;
    }
}
struct AUTHZ_RPC_INIT_INFO_CLIENT
{
    ushort version_;
    PWSTR ObjectUuid;
    PWSTR ProtSeq;
    PWSTR NetworkAddr;
    PWSTR Endpoint;
    PWSTR Options;
    PWSTR ServerSpn;
}
struct AUTHZ_INIT_INFO
{
    ushort version_;
    const(wchar)* szResourceManagerName;
    PFN_AUTHZ_DYNAMIC_ACCESS_CHECK pfnDynamicAccessCheck;
    PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS pfnComputeDynamicGroups;
    PFN_AUTHZ_FREE_DYNAMIC_GROUPS pfnFreeDynamicGroups;
    PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY pfnGetCentralAccessPolicy;
    PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY pfnFreeCentralAccessPolicy;
}
alias AUTHZ_CONTEXT_INFORMATION_CLASS = int;
enum : int
{
    AuthzContextInfoUserSid            = 0x00000001,
    AuthzContextInfoGroupsSids         = 0x00000002,
    AuthzContextInfoRestrictedSids     = 0x00000003,
    AuthzContextInfoPrivileges         = 0x00000004,
    AuthzContextInfoExpirationTime     = 0x00000005,
    AuthzContextInfoServerContext      = 0x00000006,
    AuthzContextInfoIdentifier         = 0x00000007,
    AuthzContextInfoSource             = 0x00000008,
    AuthzContextInfoAll                = 0x00000009,
    AuthzContextInfoAuthenticationId   = 0x0000000a,
    AuthzContextInfoSecurityAttributes = 0x0000000b,
    AuthzContextInfoDeviceSids         = 0x0000000c,
    AuthzContextInfoUserClaims         = 0x0000000d,
    AuthzContextInfoDeviceClaims       = 0x0000000e,
    AuthzContextInfoAppContainerSid    = 0x0000000f,
    AuthzContextInfoCapabilitySids     = 0x00000010,
}

alias AUTHZ_AUDIT_EVENT_INFORMATION_CLASS = int;
enum : int
{
    AuthzAuditEventInfoFlags          = 0x00000001,
    AuthzAuditEventInfoOperationType  = 0x00000002,
    AuthzAuditEventInfoObjectType     = 0x00000003,
    AuthzAuditEventInfoObjectName     = 0x00000004,
    AuthzAuditEventInfoAdditionalInfo = 0x00000005,
}

struct AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET
{
    PWSTR szObjectTypeName;
    uint dwOffset;
}
struct AUTHZ_SOURCE_SCHEMA_REGISTRATION
{
    uint dwFlags;
    PWSTR szEventSourceName;
    PWSTR szEventMessageFile;
    PWSTR szEventSourceXmlSchemaFile;
    PWSTR szEventAccessStringsFile;
    PWSTR szExecutableImagePath;
    union
    {
        void* pReserved;
        GUID* pProviderGuid;
    }
    uint dwObjectTypeNameCount;
    AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET[1] ObjectTypeNames;
}
enum CLSID_AzAuthorizationStore = GUID(0xb2bcff59, 0xa757, 0x4b0b, [0xa1, 0xbc, 0xea, 0x69, 0x98, 0x1d, 0xa6, 0x9e]);
struct AzAuthorizationStore
{
}
enum CLSID_AzBizRuleContext = GUID(0x5c2dc96f, 0x8d51, 0x434b, [0xb3, 0x3c, 0x37, 0x9b, 0xcc, 0xae, 0x77, 0xc3]);
struct AzBizRuleContext
{
}
enum CLSID_AzPrincipalLocator = GUID(0x483afb5d, 0x70df, 0x4e16, [0xab, 0xdc, 0xa1, 0xde, 0x4d, 0x1, 0x5a, 0x3e]);
struct AzPrincipalLocator
{
}
enum IID_IAzAuthorizationStore = GUID(0xedbd9ca9, 0x9b82, 0x4f6a, [0x9e, 0x8b, 0x98, 0x30, 0x1e, 0x45, 0xf, 0x14]);
interface IAzAuthorizationStore : IDispatch
{
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT get_DomainTimeout(int*);
    HRESULT put_DomainTimeout(int);
    HRESULT get_ScriptEngineTimeout(int*);
    HRESULT put_ScriptEngineTimeout(int);
    HRESULT get_MaxScriptEngines(int*);
    HRESULT put_MaxScriptEngines(int);
    HRESULT get_GenerateAudits(BOOL*);
    HRESULT put_GenerateAudits(BOOL);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT AddPropertyItem(AZ_PROP_CONSTANTS, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT get_PolicyAdministrators(VARIANT*);
    HRESULT get_PolicyReaders(VARIANT*);
    HRESULT AddPolicyAdministrator(BSTR, VARIANT);
    HRESULT DeletePolicyAdministrator(BSTR, VARIANT);
    HRESULT AddPolicyReader(BSTR, VARIANT);
    HRESULT DeletePolicyReader(BSTR, VARIANT);
    HRESULT Initialize(AZ_PROP_CONSTANTS, BSTR, VARIANT);
    HRESULT UpdateCache(VARIANT);
    HRESULT Delete(VARIANT);
    HRESULT get_Applications(IAzApplications*);
    HRESULT OpenApplication(BSTR, VARIANT, IAzApplication*);
    HRESULT CreateApplication(BSTR, VARIANT, IAzApplication*);
    HRESULT DeleteApplication(BSTR, VARIANT);
    HRESULT get_ApplicationGroups(IAzApplicationGroups*);
    HRESULT CreateApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT OpenApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT DeleteApplicationGroup(BSTR, VARIANT);
    HRESULT Submit(int, VARIANT);
    HRESULT get_DelegatedPolicyUsers(VARIANT*);
    HRESULT AddDelegatedPolicyUser(BSTR, VARIANT);
    HRESULT DeleteDelegatedPolicyUser(BSTR, VARIANT);
    HRESULT get_TargetMachine(BSTR*);
    HRESULT get_ApplyStoreSacl(BOOL*);
    HRESULT put_ApplyStoreSacl(BOOL);
    HRESULT get_PolicyAdministratorsName(VARIANT*);
    HRESULT get_PolicyReadersName(VARIANT*);
    HRESULT AddPolicyAdministratorName(BSTR, VARIANT);
    HRESULT DeletePolicyAdministratorName(BSTR, VARIANT);
    HRESULT AddPolicyReaderName(BSTR, VARIANT);
    HRESULT DeletePolicyReaderName(BSTR, VARIANT);
    HRESULT get_DelegatedPolicyUsersName(VARIANT*);
    HRESULT AddDelegatedPolicyUserName(BSTR, VARIANT);
    HRESULT DeleteDelegatedPolicyUserName(BSTR, VARIANT);
    HRESULT CloseApplication(BSTR, int);
}
enum IID_IAzAuthorizationStore2 = GUID(0xb11e5584, 0xd577, 0x4273, [0xb6, 0xc5, 0x9, 0x73, 0xe0, 0xf8, 0xe8, 0xd]);
interface IAzAuthorizationStore2 : IAzAuthorizationStore
{
    HRESULT OpenApplication2(BSTR, VARIANT, IAzApplication2*);
    HRESULT CreateApplication2(BSTR, VARIANT, IAzApplication2*);
}
enum IID_IAzAuthorizationStore3 = GUID(0xabc08425, 0xc86, 0x4fa0, [0x9b, 0xe3, 0x71, 0x89, 0x95, 0x6c, 0x92, 0x6e]);
interface IAzAuthorizationStore3 : IAzAuthorizationStore2
{
    HRESULT IsUpdateNeeded(VARIANT_BOOL*);
    HRESULT BizruleGroupSupported(VARIANT_BOOL*);
    HRESULT UpgradeStoresFunctionalLevel(int);
    HRESULT IsFunctionalLevelUpgradeSupported(int, VARIANT_BOOL*);
    HRESULT GetSchemaVersion(int*, int*);
}
enum IID_IAzApplication = GUID(0x987bc7c7, 0xb813, 0x4d27, [0xbe, 0xde, 0x6b, 0xa5, 0xae, 0x86, 0x7e, 0x95]);
interface IAzApplication : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT get_AuthzInterfaceClsid(BSTR*);
    HRESULT put_AuthzInterfaceClsid(BSTR);
    HRESULT get_Version(BSTR*);
    HRESULT put_Version(BSTR);
    HRESULT get_GenerateAudits(BOOL*);
    HRESULT put_GenerateAudits(BOOL);
    HRESULT get_ApplyStoreSacl(BOOL*);
    HRESULT put_ApplyStoreSacl(BOOL);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT get_PolicyAdministrators(VARIANT*);
    HRESULT get_PolicyReaders(VARIANT*);
    HRESULT AddPolicyAdministrator(BSTR, VARIANT);
    HRESULT DeletePolicyAdministrator(BSTR, VARIANT);
    HRESULT AddPolicyReader(BSTR, VARIANT);
    HRESULT DeletePolicyReader(BSTR, VARIANT);
    HRESULT get_Scopes(IAzScopes*);
    HRESULT OpenScope(BSTR, VARIANT, IAzScope*);
    HRESULT CreateScope(BSTR, VARIANT, IAzScope*);
    HRESULT DeleteScope(BSTR, VARIANT);
    HRESULT get_Operations(IAzOperations*);
    HRESULT OpenOperation(BSTR, VARIANT, IAzOperation*);
    HRESULT CreateOperation(BSTR, VARIANT, IAzOperation*);
    HRESULT DeleteOperation(BSTR, VARIANT);
    HRESULT get_Tasks(IAzTasks*);
    HRESULT OpenTask(BSTR, VARIANT, IAzTask*);
    HRESULT CreateTask(BSTR, VARIANT, IAzTask*);
    HRESULT DeleteTask(BSTR, VARIANT);
    HRESULT get_ApplicationGroups(IAzApplicationGroups*);
    HRESULT OpenApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT CreateApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT DeleteApplicationGroup(BSTR, VARIANT);
    HRESULT get_Roles(IAzRoles*);
    HRESULT OpenRole(BSTR, VARIANT, IAzRole*);
    HRESULT CreateRole(BSTR, VARIANT, IAzRole*);
    HRESULT DeleteRole(BSTR, VARIANT);
    HRESULT InitializeClientContextFromToken(ulong, VARIANT, IAzClientContext*);
    HRESULT AddPropertyItem(int, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT Submit(int, VARIANT);
    HRESULT InitializeClientContextFromName(BSTR, BSTR, VARIANT, IAzClientContext*);
    HRESULT get_DelegatedPolicyUsers(VARIANT*);
    HRESULT AddDelegatedPolicyUser(BSTR, VARIANT);
    HRESULT DeleteDelegatedPolicyUser(BSTR, VARIANT);
    HRESULT InitializeClientContextFromStringSid(BSTR, int, VARIANT, IAzClientContext*);
    HRESULT get_PolicyAdministratorsName(VARIANT*);
    HRESULT get_PolicyReadersName(VARIANT*);
    HRESULT AddPolicyAdministratorName(BSTR, VARIANT);
    HRESULT DeletePolicyAdministratorName(BSTR, VARIANT);
    HRESULT AddPolicyReaderName(BSTR, VARIANT);
    HRESULT DeletePolicyReaderName(BSTR, VARIANT);
    HRESULT get_DelegatedPolicyUsersName(VARIANT*);
    HRESULT AddDelegatedPolicyUserName(BSTR, VARIANT);
    HRESULT DeleteDelegatedPolicyUserName(BSTR, VARIANT);
}
enum IID_IAzApplication2 = GUID(0x86a68af, 0xa249, 0x437c, [0xb1, 0x8d, 0xd4, 0xd8, 0x6d, 0x6a, 0x96, 0x60]);
interface IAzApplication2 : IAzApplication
{
    HRESULT InitializeClientContextFromToken2(uint, uint, VARIANT, IAzClientContext2*);
    HRESULT InitializeClientContext2(BSTR, VARIANT, IAzClientContext2*);
}
enum IID_IAzApplications = GUID(0x929b11a9, 0x95c5, 0x4a84, [0xa2, 0x9a, 0x20, 0xad, 0x42, 0xc2, 0xf1, 0x6c]);
interface IAzApplications : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzOperation = GUID(0x5e56b24f, 0xea01, 0x4d61, [0xbe, 0x44, 0xc4, 0x9b, 0x5e, 0x4e, 0xaf, 0x74]);
interface IAzOperation : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT get_OperationID(int*);
    HRESULT put_OperationID(int);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT Submit(int, VARIANT);
}
enum IID_IAzOperations = GUID(0x90ef9c07, 0x9706, 0x49d9, [0xaf, 0x80, 0x4, 0x38, 0xa5, 0xf3, 0xec, 0x35]);
interface IAzOperations : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzTask = GUID(0xcb94e592, 0x2e0e, 0x4a6c, [0xa3, 0x36, 0xb8, 0x9a, 0x6d, 0xc1, 0xe3, 0x88]);
interface IAzTask : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT get_BizRule(BSTR*);
    HRESULT put_BizRule(BSTR);
    HRESULT get_BizRuleLanguage(BSTR*);
    HRESULT put_BizRuleLanguage(BSTR);
    HRESULT get_BizRuleImportedPath(BSTR*);
    HRESULT put_BizRuleImportedPath(BSTR);
    HRESULT get_IsRoleDefinition(BOOL*);
    HRESULT put_IsRoleDefinition(BOOL);
    HRESULT get_Operations(VARIANT*);
    HRESULT get_Tasks(VARIANT*);
    HRESULT AddOperation(BSTR, VARIANT);
    HRESULT DeleteOperation(BSTR, VARIANT);
    HRESULT AddTask(BSTR, VARIANT);
    HRESULT DeleteTask(BSTR, VARIANT);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT AddPropertyItem(int, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT Submit(int, VARIANT);
}
enum IID_IAzTasks = GUID(0xb338ccab, 0x4c85, 0x4388, [0x8c, 0xa, 0xc5, 0x85, 0x92, 0xba, 0xd3, 0x98]);
interface IAzTasks : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzScope = GUID(0xe52487, 0xe08d, 0x4514, [0xb6, 0x2e, 0x87, 0x7d, 0x56, 0x45, 0xf5, 0xab]);
interface IAzScope : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT AddPropertyItem(int, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT get_PolicyAdministrators(VARIANT*);
    HRESULT get_PolicyReaders(VARIANT*);
    HRESULT AddPolicyAdministrator(BSTR, VARIANT);
    HRESULT DeletePolicyAdministrator(BSTR, VARIANT);
    HRESULT AddPolicyReader(BSTR, VARIANT);
    HRESULT DeletePolicyReader(BSTR, VARIANT);
    HRESULT get_ApplicationGroups(IAzApplicationGroups*);
    HRESULT OpenApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT CreateApplicationGroup(BSTR, VARIANT, IAzApplicationGroup*);
    HRESULT DeleteApplicationGroup(BSTR, VARIANT);
    HRESULT get_Roles(IAzRoles*);
    HRESULT OpenRole(BSTR, VARIANT, IAzRole*);
    HRESULT CreateRole(BSTR, VARIANT, IAzRole*);
    HRESULT DeleteRole(BSTR, VARIANT);
    HRESULT get_Tasks(IAzTasks*);
    HRESULT OpenTask(BSTR, VARIANT, IAzTask*);
    HRESULT CreateTask(BSTR, VARIANT, IAzTask*);
    HRESULT DeleteTask(BSTR, VARIANT);
    HRESULT Submit(int, VARIANT);
    HRESULT get_CanBeDelegated(BOOL*);
    HRESULT get_BizrulesWritable(BOOL*);
    HRESULT get_PolicyAdministratorsName(VARIANT*);
    HRESULT get_PolicyReadersName(VARIANT*);
    HRESULT AddPolicyAdministratorName(BSTR, VARIANT);
    HRESULT DeletePolicyAdministratorName(BSTR, VARIANT);
    HRESULT AddPolicyReaderName(BSTR, VARIANT);
    HRESULT DeletePolicyReaderName(BSTR, VARIANT);
}
enum IID_IAzScopes = GUID(0x78e14853, 0x9f5e, 0x406d, [0x9b, 0x91, 0x6b, 0xdb, 0xa6, 0x97, 0x35, 0x10]);
interface IAzScopes : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzApplicationGroup = GUID(0xf1b744cd, 0x58a6, 0x4e06, [0x9f, 0xbf, 0x36, 0xf6, 0xd7, 0x79, 0xe2, 0x1e]);
interface IAzApplicationGroup : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Type(int*);
    HRESULT put_Type(int);
    HRESULT get_LdapQuery(BSTR*);
    HRESULT put_LdapQuery(BSTR);
    HRESULT get_AppMembers(VARIANT*);
    HRESULT get_AppNonMembers(VARIANT*);
    HRESULT get_Members(VARIANT*);
    HRESULT get_NonMembers(VARIANT*);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT AddAppMember(BSTR, VARIANT);
    HRESULT DeleteAppMember(BSTR, VARIANT);
    HRESULT AddAppNonMember(BSTR, VARIANT);
    HRESULT DeleteAppNonMember(BSTR, VARIANT);
    HRESULT AddMember(BSTR, VARIANT);
    HRESULT DeleteMember(BSTR, VARIANT);
    HRESULT AddNonMember(BSTR, VARIANT);
    HRESULT DeleteNonMember(BSTR, VARIANT);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT AddPropertyItem(int, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT Submit(int, VARIANT);
    HRESULT AddMemberName(BSTR, VARIANT);
    HRESULT DeleteMemberName(BSTR, VARIANT);
    HRESULT AddNonMemberName(BSTR, VARIANT);
    HRESULT DeleteNonMemberName(BSTR, VARIANT);
    HRESULT get_MembersName(VARIANT*);
    HRESULT get_NonMembersName(VARIANT*);
}
enum IID_IAzApplicationGroups = GUID(0x4ce66ad5, 0x9f3c, 0x469d, [0xa9, 0x11, 0xb9, 0x98, 0x87, 0xa7, 0xe6, 0x85]);
interface IAzApplicationGroups : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzRole = GUID(0x859e0d8d, 0x62d7, 0x41d8, [0xa0, 0x34, 0xc0, 0xcd, 0x5d, 0x43, 0xfd, 0xfa]);
interface IAzRole : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_ApplicationData(BSTR*);
    HRESULT put_ApplicationData(BSTR);
    HRESULT AddAppMember(BSTR, VARIANT);
    HRESULT DeleteAppMember(BSTR, VARIANT);
    HRESULT AddTask(BSTR, VARIANT);
    HRESULT DeleteTask(BSTR, VARIANT);
    HRESULT AddOperation(BSTR, VARIANT);
    HRESULT DeleteOperation(BSTR, VARIANT);
    HRESULT AddMember(BSTR, VARIANT);
    HRESULT DeleteMember(BSTR, VARIANT);
    HRESULT get_Writable(BOOL*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT SetProperty(int, VARIANT, VARIANT);
    HRESULT get_AppMembers(VARIANT*);
    HRESULT get_Members(VARIANT*);
    HRESULT get_Operations(VARIANT*);
    HRESULT get_Tasks(VARIANT*);
    HRESULT AddPropertyItem(int, VARIANT, VARIANT);
    HRESULT DeletePropertyItem(int, VARIANT, VARIANT);
    HRESULT Submit(int, VARIANT);
    HRESULT AddMemberName(BSTR, VARIANT);
    HRESULT DeleteMemberName(BSTR, VARIANT);
    HRESULT get_MembersName(VARIANT*);
}
enum IID_IAzRoles = GUID(0x95e0f119, 0x13b4, 0x4dae, [0xb6, 0x5f, 0x2f, 0x7d, 0x60, 0xd8, 0x22, 0xe4]);
interface IAzRoles : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzClientContext = GUID(0xeff1f00b, 0x488a, 0x466d, [0xaf, 0xd9, 0xa4, 0x1, 0xc5, 0xf9, 0xee, 0xf5]);
interface IAzClientContext : IDispatch
{
    HRESULT AccessCheck(BSTR, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT, VARIANT*);
    HRESULT GetBusinessRuleString(BSTR*);
    HRESULT get_UserDn(BSTR*);
    HRESULT get_UserSamCompat(BSTR*);
    HRESULT get_UserDisplay(BSTR*);
    HRESULT get_UserGuid(BSTR*);
    HRESULT get_UserCanonical(BSTR*);
    HRESULT get_UserUpn(BSTR*);
    HRESULT get_UserDnsSamCompat(BSTR*);
    HRESULT GetProperty(int, VARIANT, VARIANT*);
    HRESULT GetRoles(BSTR, VARIANT*);
    HRESULT get_RoleForAccessCheck(BSTR*);
    HRESULT put_RoleForAccessCheck(BSTR);
}
enum IID_IAzClientContext2 = GUID(0x2b0c92b8, 0x208a, 0x488a, [0x8f, 0x81, 0xe4, 0xed, 0xb2, 0x21, 0x11, 0xcd]);
interface IAzClientContext2 : IAzClientContext
{
    HRESULT GetAssignedScopesPage(int, int, VARIANT*, VARIANT*);
    HRESULT AddRoles(VARIANT, BSTR);
    HRESULT AddApplicationGroups(VARIANT);
    HRESULT AddStringSids(VARIANT);
    HRESULT put_LDAPQueryDN(BSTR);
    HRESULT get_LDAPQueryDN(BSTR*);
}
enum IID_IAzBizRuleContext = GUID(0xe192f17d, 0xd59f, 0x455e, [0xa1, 0x52, 0x94, 0x3, 0x16, 0xcd, 0x77, 0xb2]);
interface IAzBizRuleContext : IDispatch
{
    HRESULT put_BusinessRuleResult(BOOL);
    HRESULT put_BusinessRuleString(BSTR);
    HRESULT get_BusinessRuleString(BSTR*);
    HRESULT GetParameter(BSTR, VARIANT*);
}
enum IID_IAzBizRuleParameters = GUID(0xfc17685f, 0xe25d, 0x4dcd, [0xba, 0xe1, 0x27, 0x6e, 0xc9, 0x53, 0x3c, 0xb5]);
interface IAzBizRuleParameters : IDispatch
{
    HRESULT AddParameter(BSTR, VARIANT);
    HRESULT AddParameters(VARIANT, VARIANT);
    HRESULT GetParameterValue(BSTR, VARIANT*);
    HRESULT Remove(BSTR);
    HRESULT RemoveAll();
    HRESULT get_Count(uint*);
}
enum IID_IAzBizRuleInterfaces = GUID(0xe94128c7, 0xe9da, 0x44cc, [0xb0, 0xbd, 0x53, 0x3, 0x6f, 0x3a, 0xab, 0x3d]);
interface IAzBizRuleInterfaces : IDispatch
{
    HRESULT AddInterface(BSTR, int, VARIANT);
    HRESULT AddInterfaces(VARIANT, VARIANT, VARIANT);
    HRESULT GetInterfaceValue(BSTR, int*, VARIANT*);
    HRESULT Remove(BSTR);
    HRESULT RemoveAll();
    HRESULT get_Count(uint*);
}
enum IID_IAzClientContext3 = GUID(0x11894fde, 0x1deb, 0x4b4b, [0x89, 0x7, 0x6d, 0x1c, 0xda, 0x1f, 0x5d, 0x4f]);
interface IAzClientContext3 : IAzClientContext2
{
    HRESULT AccessCheck2(BSTR, BSTR, int, uint*);
    HRESULT IsInRoleAssignment(BSTR, BSTR, VARIANT_BOOL*);
    HRESULT GetOperations(BSTR, IAzOperations*);
    HRESULT GetTasks(BSTR, IAzTasks*);
    HRESULT get_BizRuleParameters(IAzBizRuleParameters*);
    HRESULT get_BizRuleInterfaces(IAzBizRuleInterfaces*);
    HRESULT GetGroups(BSTR, AZ_PROP_CONSTANTS, VARIANT*);
    HRESULT get_Sids(VARIANT*);
}
enum IID_IAzScope2 = GUID(0xee9fe8c9, 0xc9f3, 0x40e2, [0xaa, 0x12, 0xd1, 0xd8, 0x59, 0x97, 0x27, 0xfd]);
interface IAzScope2 : IAzScope
{
    HRESULT get_RoleDefinitions(IAzRoleDefinitions*);
    HRESULT CreateRoleDefinition(BSTR, IAzRoleDefinition*);
    HRESULT OpenRoleDefinition(BSTR, IAzRoleDefinition*);
    HRESULT DeleteRoleDefinition(BSTR);
    HRESULT get_RoleAssignments(IAzRoleAssignments*);
    HRESULT CreateRoleAssignment(BSTR, IAzRoleAssignment*);
    HRESULT OpenRoleAssignment(BSTR, IAzRoleAssignment*);
    HRESULT DeleteRoleAssignment(BSTR);
}
enum IID_IAzApplication3 = GUID(0x181c845e, 0x7196, 0x4a7d, [0xac, 0x2e, 0x2, 0xc, 0xb, 0xb7, 0xa3, 0x3]);
interface IAzApplication3 : IAzApplication2
{
    HRESULT ScopeExists(BSTR, VARIANT_BOOL*);
    HRESULT OpenScope2(BSTR, IAzScope2*);
    HRESULT CreateScope2(BSTR, IAzScope2*);
    HRESULT DeleteScope2(BSTR);
    HRESULT get_RoleDefinitions(IAzRoleDefinitions*);
    HRESULT CreateRoleDefinition(BSTR, IAzRoleDefinition*);
    HRESULT OpenRoleDefinition(BSTR, IAzRoleDefinition*);
    HRESULT DeleteRoleDefinition(BSTR);
    HRESULT get_RoleAssignments(IAzRoleAssignments*);
    HRESULT CreateRoleAssignment(BSTR, IAzRoleAssignment*);
    HRESULT OpenRoleAssignment(BSTR, IAzRoleAssignment*);
    HRESULT DeleteRoleAssignment(BSTR);
    HRESULT get_BizRulesEnabled(VARIANT_BOOL*);
    HRESULT put_BizRulesEnabled(VARIANT_BOOL);
}
enum IID_IAzOperation2 = GUID(0x1f5ea01f, 0x44a2, 0x4184, [0x9c, 0x48, 0xa7, 0x5b, 0x4d, 0xcc, 0x8c, 0xcc]);
interface IAzOperation2 : IAzOperation
{
    HRESULT RoleAssignments(BSTR, VARIANT_BOOL, IAzRoleAssignments*);
}
enum IID_IAzRoleDefinitions = GUID(0x881f25a5, 0xd755, 0x4550, [0x95, 0x7a, 0xd5, 0x3, 0xa3, 0xb3, 0x40, 0x1]);
interface IAzRoleDefinitions : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzRoleDefinition = GUID(0xd97fcea1, 0x2599, 0x44f1, [0x9f, 0xc3, 0x58, 0xe9, 0xfb, 0xe0, 0x94, 0x66]);
interface IAzRoleDefinition : IAzTask
{
    HRESULT RoleAssignments(BSTR, VARIANT_BOOL, IAzRoleAssignments*);
    HRESULT AddRoleDefinition(BSTR);
    HRESULT DeleteRoleDefinition(BSTR);
    HRESULT get_RoleDefinitions(IAzRoleDefinitions*);
}
enum IID_IAzRoleAssignment = GUID(0x55647d31, 0xd5a, 0x4fa3, [0xb4, 0xac, 0x2b, 0x5f, 0x9a, 0xd5, 0xab, 0x76]);
interface IAzRoleAssignment : IAzRole
{
    HRESULT AddRoleDefinition(BSTR);
    HRESULT DeleteRoleDefinition(BSTR);
    HRESULT get_RoleDefinitions(IAzRoleDefinitions*);
    HRESULT get_Scope(IAzScope*);
}
enum IID_IAzRoleAssignments = GUID(0x9c80b900, 0xfceb, 0x4d73, [0xa0, 0xf4, 0xc8, 0x3b, 0xb, 0xbf, 0x24, 0x81]);
interface IAzRoleAssignments : IDispatch
{
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IAzPrincipalLocator = GUID(0xe5c3507d, 0xad6a, 0x4992, [0x9c, 0x7f, 0x74, 0xab, 0x48, 0xb, 0x44, 0xcc]);
interface IAzPrincipalLocator : IDispatch
{
    HRESULT get_NameResolver(IAzNameResolver*);
    HRESULT get_ObjectPicker(IAzObjectPicker*);
}
enum IID_IAzNameResolver = GUID(0x504d0f15, 0x73e2, 0x43df, [0xa8, 0x70, 0xa6, 0x4f, 0x40, 0x71, 0x4f, 0x53]);
interface IAzNameResolver : IDispatch
{
    HRESULT NameFromSid(BSTR, int*, BSTR*);
    HRESULT NamesFromSids(VARIANT, VARIANT*, VARIANT*);
}
enum IID_IAzObjectPicker = GUID(0x63130a48, 0x699a, 0x42d8, [0xbf, 0x1, 0xc6, 0x2a, 0xc3, 0xfb, 0x79, 0xf9]);
interface IAzObjectPicker : IDispatch
{
    HRESULT GetPrincipals(HWND, BSTR, VARIANT*, VARIANT*, VARIANT*);
    HRESULT get_Name(BSTR*);
}
enum IID_IAzApplicationGroup2 = GUID(0x3f0613fc, 0xb71a, 0x464e, [0xa1, 0x1d, 0x5b, 0x88, 0x1a, 0x56, 0xce, 0xfa]);
interface IAzApplicationGroup2 : IAzApplicationGroup
{
    HRESULT get_BizRule(BSTR*);
    HRESULT put_BizRule(BSTR);
    HRESULT get_BizRuleLanguage(BSTR*);
    HRESULT put_BizRuleLanguage(BSTR);
    HRESULT get_BizRuleImportedPath(BSTR*);
    HRESULT put_BizRuleImportedPath(BSTR);
    HRESULT RoleAssignments(BSTR, VARIANT_BOOL, IAzRoleAssignments*);
}
enum IID_IAzTask2 = GUID(0x3a9a5ee, 0x48c8, 0x4832, [0x90, 0x25, 0xaa, 0xd5, 0x3, 0xc4, 0x65, 0x26]);
interface IAzTask2 : IAzTask
{
    HRESULT RoleAssignments(BSTR, VARIANT_BOOL, IAzRoleAssignments*);
}
alias AZ_PROP_CONSTANTS = int;
enum : int
{
    AZ_PROP_NAME                                  = 0x00000001,
    AZ_PROP_DESCRIPTION                           = 0x00000002,
    AZ_PROP_WRITABLE                              = 0x00000003,
    AZ_PROP_APPLICATION_DATA                      = 0x00000004,
    AZ_PROP_CHILD_CREATE                          = 0x00000005,
    AZ_MAX_APPLICATION_NAME_LENGTH                = 0x00000200,
    AZ_MAX_OPERATION_NAME_LENGTH                  = 0x00000040,
    AZ_MAX_TASK_NAME_LENGTH                       = 0x00000040,
    AZ_MAX_SCOPE_NAME_LENGTH                      = 0x00010000,
    AZ_MAX_GROUP_NAME_LENGTH                      = 0x00000040,
    AZ_MAX_ROLE_NAME_LENGTH                       = 0x00000040,
    AZ_MAX_NAME_LENGTH                            = 0x00010000,
    AZ_MAX_DESCRIPTION_LENGTH                     = 0x00000400,
    AZ_MAX_APPLICATION_DATA_LENGTH                = 0x00001000,
    AZ_SUBMIT_FLAG_ABORT                          = 0x00000001,
    AZ_SUBMIT_FLAG_FLUSH                          = 0x00000002,
    AZ_MAX_POLICY_URL_LENGTH                      = 0x00010000,
    AZ_AZSTORE_FLAG_CREATE                        = 0x00000001,
    AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY             = 0x00000002,
    AZ_AZSTORE_FLAG_BATCH_UPDATE                  = 0x00000004,
    AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL             = 0x00000008,
    AZ_AZSTORE_FORCE_APPLICATION_CLOSE            = 0x00000010,
    AZ_AZSTORE_NT6_FUNCTION_LEVEL                 = 0x00000020,
    AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT    = 0x00008000,
    AZ_PROP_AZSTORE_DOMAIN_TIMEOUT                = 0x00000064,
    AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT             = 0x00003a98,
    AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT         = 0x00000065,
    AZ_AZSTORE_MIN_DOMAIN_TIMEOUT                 = 0x000001f4,
    AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT          = 0x00001388,
    AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT      = 0x0000afc8,
    AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES            = 0x00000066,
    AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES         = 0x00000078,
    AZ_PROP_AZSTORE_MAJOR_VERSION                 = 0x00000067,
    AZ_PROP_AZSTORE_MINOR_VERSION                 = 0x00000068,
    AZ_PROP_AZSTORE_TARGET_MACHINE                = 0x00000069,
    AZ_PROP_AZTORE_IS_ADAM_INSTANCE               = 0x0000006a,
    AZ_PROP_OPERATION_ID                          = 0x000000c8,
    AZ_PROP_TASK_OPERATIONS                       = 0x0000012c,
    AZ_PROP_TASK_BIZRULE                          = 0x0000012d,
    AZ_PROP_TASK_BIZRULE_LANGUAGE                 = 0x0000012e,
    AZ_PROP_TASK_TASKS                            = 0x0000012f,
    AZ_PROP_TASK_BIZRULE_IMPORTED_PATH            = 0x00000130,
    AZ_PROP_TASK_IS_ROLE_DEFINITION               = 0x00000131,
    AZ_MAX_TASK_BIZRULE_LENGTH                    = 0x00010000,
    AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH           = 0x00000040,
    AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH      = 0x00000200,
    AZ_MAX_BIZRULE_STRING                         = 0x00010000,
    AZ_PROP_GROUP_TYPE                            = 0x00000190,
    AZ_GROUPTYPE_LDAP_QUERY                       = 0x00000001,
    AZ_GROUPTYPE_BASIC                            = 0x00000002,
    AZ_GROUPTYPE_BIZRULE                          = 0x00000003,
    AZ_PROP_GROUP_APP_MEMBERS                     = 0x00000191,
    AZ_PROP_GROUP_APP_NON_MEMBERS                 = 0x00000192,
    AZ_PROP_GROUP_LDAP_QUERY                      = 0x00000193,
    AZ_MAX_GROUP_LDAP_QUERY_LENGTH                = 0x00001000,
    AZ_PROP_GROUP_MEMBERS                         = 0x00000194,
    AZ_PROP_GROUP_NON_MEMBERS                     = 0x00000195,
    AZ_PROP_GROUP_MEMBERS_NAME                    = 0x00000196,
    AZ_PROP_GROUP_NON_MEMBERS_NAME                = 0x00000197,
    AZ_PROP_GROUP_BIZRULE                         = 0x00000198,
    AZ_PROP_GROUP_BIZRULE_LANGUAGE                = 0x00000199,
    AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH           = 0x0000019a,
    AZ_MAX_GROUP_BIZRULE_LENGTH                   = 0x00010000,
    AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH          = 0x00000040,
    AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH     = 0x00000200,
    AZ_PROP_ROLE_APP_MEMBERS                      = 0x000001f4,
    AZ_PROP_ROLE_MEMBERS                          = 0x000001f5,
    AZ_PROP_ROLE_OPERATIONS                       = 0x000001f6,
    AZ_PROP_ROLE_TASKS                            = 0x000001f8,
    AZ_PROP_ROLE_MEMBERS_NAME                     = 0x000001f9,
    AZ_PROP_SCOPE_BIZRULES_WRITABLE               = 0x00000258,
    AZ_PROP_SCOPE_CAN_BE_DELEGATED                = 0x00000259,
    AZ_PROP_CLIENT_CONTEXT_USER_DN                = 0x000002bc,
    AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT        = 0x000002bd,
    AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY           = 0x000002be,
    AZ_PROP_CLIENT_CONTEXT_USER_GUID              = 0x000002bf,
    AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL         = 0x000002c0,
    AZ_PROP_CLIENT_CONTEXT_USER_UPN               = 0x000002c1,
    AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT    = 0x000002c3,
    AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK  = 0x000002c4,
    AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN          = 0x000002c5,
    AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID     = 0x00000320,
    AZ_PROP_APPLICATION_VERSION                   = 0x00000321,
    AZ_MAX_APPLICATION_VERSION_LENGTH             = 0x00000200,
    AZ_PROP_APPLICATION_NAME                      = 0x00000322,
    AZ_PROP_APPLICATION_BIZRULE_ENABLED           = 0x00000323,
    AZ_PROP_APPLY_STORE_SACL                      = 0x00000384,
    AZ_PROP_GENERATE_AUDITS                       = 0x00000385,
    AZ_PROP_POLICY_ADMINS                         = 0x00000386,
    AZ_PROP_POLICY_READERS                        = 0x00000387,
    AZ_PROP_DELEGATED_POLICY_USERS                = 0x00000388,
    AZ_PROP_POLICY_ADMINS_NAME                    = 0x00000389,
    AZ_PROP_POLICY_READERS_NAME                   = 0x0000038a,
    AZ_PROP_DELEGATED_POLICY_USERS_NAME           = 0x0000038b,
    AZ_CLIENT_CONTEXT_SKIP_GROUP                  = 0x00000001,
    AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY             = 0x00000001,
    AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE         = 0x00000002,
    AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY = 0x00000002,
}

alias FN_PROGRESS = void function(PWSTR, uint, PROG_INVOKE_SETTING*, void*, BOOL);
alias AUTHZ_ACCESS_CHECK_RESULTS_HANDLE = long;
alias AUTHZ_CLIENT_CONTEXT_HANDLE = long;
alias AUTHZ_RESOURCE_MANAGER_HANDLE = long;
alias AUTHZ_AUDIT_EVENT_HANDLE = long;
alias AUTHZ_AUDIT_EVENT_TYPE_HANDLE = long;
alias AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE = long;
