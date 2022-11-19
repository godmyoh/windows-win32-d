module windows.win32.security_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, LARGE_INTEGER, LUID, NTSTATUS, PSID, PSTR, PWSTR, UNICODE_STRING;

version (Windows):
extern (Windows):

alias TOKEN_PRIVILEGES_ATTRIBUTES = uint;
enum : uint
{
    SE_PRIVILEGE_ENABLED            = 0x00000002,
    SE_PRIVILEGE_ENABLED_BY_DEFAULT = 0x00000001,
    SE_PRIVILEGE_REMOVED            = 0x00000004,
    SE_PRIVILEGE_USED_FOR_ACCESS    = 0x80000000,
}

alias LOGON32_PROVIDER = uint;
enum : uint
{
    LOGON32_PROVIDER_DEFAULT = 0x00000000,
    LOGON32_PROVIDER_WINNT50 = 0x00000003,
    LOGON32_PROVIDER_WINNT40 = 0x00000002,
}

alias CREATE_RESTRICTED_TOKEN_FLAGS = uint;
enum : uint
{
    DISABLE_MAX_PRIVILEGE = 0x00000001,
    SANDBOX_INERT         = 0x00000002,
    LUA_TOKEN             = 0x00000004,
    WRITE_RESTRICTED      = 0x00000008,
}

alias LOGON32_LOGON = uint;
enum : uint
{
    LOGON32_LOGON_BATCH             = 0x00000004,
    LOGON32_LOGON_INTERACTIVE       = 0x00000002,
    LOGON32_LOGON_NETWORK           = 0x00000003,
    LOGON32_LOGON_NETWORK_CLEARTEXT = 0x00000008,
    LOGON32_LOGON_NEW_CREDENTIALS   = 0x00000009,
    LOGON32_LOGON_SERVICE           = 0x00000005,
    LOGON32_LOGON_UNLOCK            = 0x00000007,
}

alias ACE_FLAGS = uint;
enum : uint
{
    CONTAINER_INHERIT_ACE              = 0x00000002,
    FAILED_ACCESS_ACE_FLAG             = 0x00000080,
    INHERIT_ONLY_ACE                   = 0x00000008,
    INHERITED_ACE                      = 0x00000010,
    NO_PROPAGATE_INHERIT_ACE           = 0x00000004,
    OBJECT_INHERIT_ACE                 = 0x00000001,
    SUCCESSFUL_ACCESS_ACE_FLAG         = 0x00000040,
    SUB_CONTAINERS_AND_OBJECTS_INHERIT = 0x00000003,
    SUB_CONTAINERS_ONLY_INHERIT        = 0x00000002,
    SUB_OBJECTS_ONLY_INHERIT           = 0x00000001,
    INHERIT_NO_PROPAGATE               = 0x00000004,
    INHERIT_ONLY                       = 0x00000008,
    NO_INHERITANCE                     = 0x00000000,
}

alias OBJECT_SECURITY_INFORMATION = uint;
enum : uint
{
    ATTRIBUTE_SECURITY_INFORMATION        = 0x00000020,
    BACKUP_SECURITY_INFORMATION           = 0x00010000,
    DACL_SECURITY_INFORMATION             = 0x00000004,
    GROUP_SECURITY_INFORMATION            = 0x00000002,
    LABEL_SECURITY_INFORMATION            = 0x00000010,
    OWNER_SECURITY_INFORMATION            = 0x00000001,
    PROTECTED_DACL_SECURITY_INFORMATION   = 0x80000000,
    PROTECTED_SACL_SECURITY_INFORMATION   = 0x40000000,
    SACL_SECURITY_INFORMATION             = 0x00000008,
    SCOPE_SECURITY_INFORMATION            = 0x00000040,
    UNPROTECTED_DACL_SECURITY_INFORMATION = 0x20000000,
    UNPROTECTED_SACL_SECURITY_INFORMATION = 0x10000000,
}

alias SECURITY_AUTO_INHERIT_FLAGS = uint;
enum : uint
{
    SEF_AVOID_OWNER_CHECK             = 0x00000010,
    SEF_AVOID_OWNER_RESTRICTION       = 0x00001000,
    SEF_AVOID_PRIVILEGE_CHECK         = 0x00000008,
    SEF_DACL_AUTO_INHERIT             = 0x00000001,
    SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT = 0x00000004,
    SEF_DEFAULT_GROUP_FROM_PARENT     = 0x00000040,
    SEF_DEFAULT_OWNER_FROM_PARENT     = 0x00000020,
    SEF_MACL_NO_EXECUTE_UP            = 0x00000400,
    SEF_MACL_NO_READ_UP               = 0x00000200,
    SEF_MACL_NO_WRITE_UP              = 0x00000100,
    SEF_SACL_AUTO_INHERIT             = 0x00000002,
}

alias ACE_REVISION = uint;
enum : uint
{
    ACL_REVISION    = 0x00000002,
    ACL_REVISION_DS = 0x00000004,
}

alias TOKEN_MANDATORY_POLICY_ID = uint;
enum : uint
{
    TOKEN_MANDATORY_POLICY_OFF             = 0x00000000,
    TOKEN_MANDATORY_POLICY_NO_WRITE_UP     = 0x00000001,
    TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN = 0x00000002,
    TOKEN_MANDATORY_POLICY_VALID_MASK      = 0x00000003,
}

alias SYSTEM_AUDIT_OBJECT_ACE_FLAGS = uint;
enum : uint
{
    ACE_OBJECT_TYPE_PRESENT           = 0x00000001,
    ACE_INHERITED_OBJECT_TYPE_PRESENT = 0x00000002,
}

alias CLAIM_SECURITY_ATTRIBUTE_FLAGS = uint;
enum : uint
{
    CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE      = 0x00000001,
    CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 0x00000002,
    CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY    = 0x00000004,
    CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT  = 0x00000008,
    CLAIM_SECURITY_ATTRIBUTE_DISABLED             = 0x00000010,
    CLAIM_SECURITY_ATTRIBUTE_MANDATORY            = 0x00000020,
}

alias CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE = ushort;
enum : ushort
{
    CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64        = 0x0001,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64       = 0x0002,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING       = 0x0003,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 0x0010,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN         = 0x0004,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_SID          = 0x0005,
    CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN      = 0x0006,
}

alias PLSA_AP_CALL_PACKAGE_UNTRUSTED = NTSTATUS function(void**, void*, void*, uint, void**, uint*, int*);
alias SEC_THREAD_START = uint function(void*);
alias TOKEN_ACCESS_MASK = uint;
enum : uint
{
    TOKEN_DELETE                    = 0x00010000,
    TOKEN_READ_CONTROL              = 0x00020000,
    TOKEN_WRITE_DAC                 = 0x00040000,
    TOKEN_WRITE_OWNER               = 0x00080000,
    TOKEN_ACCESS_SYSTEM_SECURITY    = 0x01000000,
    TOKEN_ASSIGN_PRIMARY            = 0x00000001,
    TOKEN_DUPLICATE                 = 0x00000002,
    TOKEN_IMPERSONATE               = 0x00000004,
    TOKEN_QUERY                     = 0x00000008,
    TOKEN_QUERY_SOURCE              = 0x00000010,
    TOKEN_ADJUST_PRIVILEGES         = 0x00000020,
    TOKEN_ADJUST_GROUPS             = 0x00000040,
    TOKEN_ADJUST_DEFAULT            = 0x00000080,
    TOKEN_ADJUST_SESSIONID          = 0x00000100,
    TOKEN_READ                      = 0x00020008,
    TOKEN_WRITE                     = 0x000200e0,
    TOKEN_EXECUTE                   = 0x00020000,
    TOKEN_TRUST_CONSTRAINT_MASK     = 0x00020018,
    TOKEN_ACCESS_PSEUDO_HANDLE_WIN8 = 0x00000018,
    TOKEN_ACCESS_PSEUDO_HANDLE      = 0x00000018,
    TOKEN_ALL_ACCESS                = 0x000f00ff,
}

BOOL AccessCheck(PSECURITY_DESCRIPTOR, HANDLE, uint, GENERIC_MAPPING*, PRIVILEGE_SET*, uint*, uint*, int*);
BOOL AccessCheckAndAuditAlarmW(const(wchar)*, void*, PWSTR, PWSTR, PSECURITY_DESCRIPTOR, uint, GENERIC_MAPPING*, BOOL, uint*, int*, int*);
BOOL AccessCheckByType(PSECURITY_DESCRIPTOR, PSID, HANDLE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, PRIVILEGE_SET*, uint*, uint*, int*);
BOOL AccessCheckByTypeResultList(PSECURITY_DESCRIPTOR, PSID, HANDLE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, PRIVILEGE_SET*, uint*, uint*, uint*);
BOOL AccessCheckByTypeAndAuditAlarmW(const(wchar)*, void*, const(wchar)*, const(wchar)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, int*, int*);
BOOL AccessCheckByTypeResultListAndAuditAlarmW(const(wchar)*, void*, const(wchar)*, const(wchar)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, uint*, int*);
BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleW(const(wchar)*, void*, HANDLE, const(wchar)*, const(wchar)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, uint*, int*);
BOOL AddAccessAllowedAce(ACL*, ACE_REVISION, uint, PSID);
BOOL AddAccessAllowedAceEx(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID);
BOOL AddAccessAllowedObjectAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, GUID*, GUID*, PSID);
BOOL AddAccessDeniedAce(ACL*, ACE_REVISION, uint, PSID);
BOOL AddAccessDeniedAceEx(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID);
BOOL AddAccessDeniedObjectAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, GUID*, GUID*, PSID);
BOOL AddAce(ACL*, ACE_REVISION, uint, void*, uint);
BOOL AddAuditAccessAce(ACL*, ACE_REVISION, uint, PSID, BOOL, BOOL);
BOOL AddAuditAccessAceEx(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID, BOOL, BOOL);
BOOL AddAuditAccessObjectAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, GUID*, GUID*, PSID, BOOL, BOOL);
BOOL AddMandatoryAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID);
BOOL AddResourceAttributeAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID, CLAIM_SECURITY_ATTRIBUTES_INFORMATION*, uint*);
BOOL AddScopedPolicyIDAce(ACL*, ACE_REVISION, ACE_FLAGS, uint, PSID);
BOOL AdjustTokenGroups(HANDLE, BOOL, TOKEN_GROUPS*, uint, TOKEN_GROUPS*, uint*);
BOOL AdjustTokenPrivileges(HANDLE, BOOL, TOKEN_PRIVILEGES*, uint, TOKEN_PRIVILEGES*, uint*);
BOOL AllocateAndInitializeSid(SID_IDENTIFIER_AUTHORITY*, ubyte, uint, uint, uint, uint, uint, uint, uint, uint, PSID*);
BOOL AllocateLocallyUniqueId(LUID*);
BOOL AreAllAccessesGranted(uint, uint);
BOOL AreAnyAccessesGranted(uint, uint);
BOOL CheckTokenMembership(HANDLE, PSID, BOOL*);
BOOL CheckTokenCapability(HANDLE, PSID, BOOL*);
BOOL GetAppContainerAce(ACL*, uint, void**, uint*);
BOOL CheckTokenMembershipEx(HANDLE, PSID, uint, BOOL*);
BOOL ConvertToAutoInheritPrivateObjectSecurity(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, GUID*, BOOLEAN, GENERIC_MAPPING*);
BOOL CopySid(uint, PSID, PSID);
BOOL CreatePrivateObjectSecurity(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, BOOL, HANDLE, GENERIC_MAPPING*);
BOOL CreatePrivateObjectSecurityEx(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, GUID*, BOOL, SECURITY_AUTO_INHERIT_FLAGS, HANDLE, GENERIC_MAPPING*);
BOOL CreatePrivateObjectSecurityWithMultipleInheritance(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, GUID**, uint, BOOL, SECURITY_AUTO_INHERIT_FLAGS, HANDLE, GENERIC_MAPPING*);
BOOL CreateRestrictedToken(HANDLE, CREATE_RESTRICTED_TOKEN_FLAGS, uint, SID_AND_ATTRIBUTES*, uint, LUID_AND_ATTRIBUTES*, uint, SID_AND_ATTRIBUTES*, HANDLE*);
BOOL CreateWellKnownSid(WELL_KNOWN_SID_TYPE, PSID, PSID, uint*);
BOOL EqualDomainSid(PSID, PSID, BOOL*);
BOOL DeleteAce(ACL*, uint);
BOOL DestroyPrivateObjectSecurity(PSECURITY_DESCRIPTOR*);
BOOL DuplicateToken(HANDLE, SECURITY_IMPERSONATION_LEVEL, HANDLE*);
BOOL DuplicateTokenEx(HANDLE, TOKEN_ACCESS_MASK, SECURITY_ATTRIBUTES*, SECURITY_IMPERSONATION_LEVEL, TOKEN_TYPE, HANDLE*);
BOOL EqualPrefixSid(PSID, PSID);
BOOL EqualSid(PSID, PSID);
BOOL FindFirstFreeAce(ACL*, void**);
void* FreeSid(PSID);
BOOL GetAce(ACL*, uint, void**);
BOOL GetAclInformation(ACL*, void*, uint, ACL_INFORMATION_CLASS);
BOOL GetFileSecurityW(const(wchar)*, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL GetKernelObjectSecurity(HANDLE, uint, PSECURITY_DESCRIPTOR, uint, uint*);
uint GetLengthSid(PSID);
BOOL GetPrivateObjectSecurity(PSECURITY_DESCRIPTOR, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL GetSecurityDescriptorControl(PSECURITY_DESCRIPTOR, ushort*, uint*);
BOOL GetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR, int*, ACL**, int*);
BOOL GetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR, PSID*, int*);
uint GetSecurityDescriptorLength(PSECURITY_DESCRIPTOR);
BOOL GetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR, PSID*, int*);
uint GetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR, ubyte*);
BOOL GetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR, int*, ACL**, int*);
SID_IDENTIFIER_AUTHORITY* GetSidIdentifierAuthority(PSID);
uint GetSidLengthRequired(ubyte);
uint* GetSidSubAuthority(PSID, uint);
ubyte* GetSidSubAuthorityCount(PSID);
BOOL GetTokenInformation(HANDLE, TOKEN_INFORMATION_CLASS, void*, uint, uint*);
BOOL GetWindowsAccountDomainSid(PSID, PSID, uint*);
BOOL ImpersonateAnonymousToken(HANDLE);
BOOL ImpersonateLoggedOnUser(HANDLE);
BOOL ImpersonateSelf(SECURITY_IMPERSONATION_LEVEL);
BOOL InitializeAcl(ACL*, uint, ACE_REVISION);
BOOL InitializeSecurityDescriptor(PSECURITY_DESCRIPTOR, uint);
BOOL InitializeSid(PSID, SID_IDENTIFIER_AUTHORITY*, ubyte);
BOOL IsTokenRestricted(HANDLE);
BOOL IsValidAcl(ACL*);
BOOL IsValidSecurityDescriptor(PSECURITY_DESCRIPTOR);
BOOL IsValidSid(PSID);
BOOL IsWellKnownSid(PSID, WELL_KNOWN_SID_TYPE);
BOOL MakeAbsoluteSD(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, uint*, ACL*, uint*, ACL*, uint*, PSID, uint*, PSID, uint*);
BOOL MakeSelfRelativeSD(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, uint*);
void MapGenericMask(uint*, GENERIC_MAPPING*);
BOOL ObjectCloseAuditAlarmW(const(wchar)*, void*, BOOL);
BOOL ObjectDeleteAuditAlarmW(const(wchar)*, void*, BOOL);
BOOL ObjectOpenAuditAlarmW(const(wchar)*, void*, PWSTR, PWSTR, PSECURITY_DESCRIPTOR, HANDLE, uint, uint, PRIVILEGE_SET*, BOOL, BOOL, int*);
BOOL ObjectPrivilegeAuditAlarmW(const(wchar)*, void*, HANDLE, uint, PRIVILEGE_SET*, BOOL);
BOOL PrivilegeCheck(HANDLE, PRIVILEGE_SET*, int*);
BOOL PrivilegedServiceAuditAlarmW(const(wchar)*, const(wchar)*, HANDLE, PRIVILEGE_SET*, BOOL);
void QuerySecurityAccessMask(uint, uint*);
BOOL RevertToSelf();
BOOL SetAclInformation(ACL*, void*, uint, ACL_INFORMATION_CLASS);
BOOL SetFileSecurityW(const(wchar)*, uint, PSECURITY_DESCRIPTOR);
BOOL SetKernelObjectSecurity(HANDLE, uint, PSECURITY_DESCRIPTOR);
BOOL SetPrivateObjectSecurity(uint, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, GENERIC_MAPPING*, HANDLE);
BOOL SetPrivateObjectSecurityEx(uint, PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, SECURITY_AUTO_INHERIT_FLAGS, GENERIC_MAPPING*, HANDLE);
void SetSecurityAccessMask(uint, uint*);
BOOL SetSecurityDescriptorControl(PSECURITY_DESCRIPTOR, ushort, ushort);
BOOL SetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR, BOOL, ACL*, BOOL);
BOOL SetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR, PSID, BOOL);
BOOL SetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR, PSID, BOOL);
uint SetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR, ubyte*);
BOOL SetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR, BOOL, ACL*, BOOL);
BOOL SetTokenInformation(HANDLE, TOKEN_INFORMATION_CLASS, void*, uint);
BOOL SetCachedSigningLevel(HANDLE*, uint, uint, HANDLE);
BOOL GetCachedSigningLevel(HANDLE, uint*, uint*, ubyte*, uint*, uint*);
BOOL DeriveCapabilitySidsFromName(const(wchar)*, PSID**, uint*, PSID**, uint*);
BOOLEAN RtlNormalizeSecurityDescriptor(PSECURITY_DESCRIPTOR*, uint, PSECURITY_DESCRIPTOR*, uint*, BOOLEAN);
BOOL SetUserObjectSecurity(HANDLE, OBJECT_SECURITY_INFORMATION*, PSECURITY_DESCRIPTOR);
BOOL GetUserObjectSecurity(HANDLE, uint*, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL AccessCheckAndAuditAlarmA(const(char)*, void*, PSTR, PSTR, PSECURITY_DESCRIPTOR, uint, GENERIC_MAPPING*, BOOL, uint*, int*, int*);
BOOL AccessCheckByTypeAndAuditAlarmA(const(char)*, void*, const(char)*, const(char)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, int*, int*);
BOOL AccessCheckByTypeResultListAndAuditAlarmA(const(char)*, void*, const(char)*, const(char)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, uint*, int*);
BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleA(const(char)*, void*, HANDLE, const(char)*, const(char)*, PSECURITY_DESCRIPTOR, PSID, uint, AUDIT_EVENT_TYPE, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, BOOL, uint*, uint*, int*);
BOOL ObjectOpenAuditAlarmA(const(char)*, void*, PSTR, PSTR, PSECURITY_DESCRIPTOR, HANDLE, uint, uint, PRIVILEGE_SET*, BOOL, BOOL, int*);
BOOL ObjectPrivilegeAuditAlarmA(const(char)*, void*, HANDLE, uint, PRIVILEGE_SET*, BOOL);
BOOL ObjectCloseAuditAlarmA(const(char)*, void*, BOOL);
BOOL ObjectDeleteAuditAlarmA(const(char)*, void*, BOOL);
BOOL PrivilegedServiceAuditAlarmA(const(char)*, const(char)*, HANDLE, PRIVILEGE_SET*, BOOL);
BOOL AddConditionalAce(ACL*, ACE_REVISION, ACE_FLAGS, ubyte, uint, PSID, PWSTR, uint*);
BOOL SetFileSecurityA(const(char)*, uint, PSECURITY_DESCRIPTOR);
BOOL GetFileSecurityA(const(char)*, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL LookupAccountSidA(const(char)*, PSID, PSTR, uint*, PSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountSidW(const(wchar)*, PSID, PWSTR, uint*, PWSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountNameA(const(char)*, const(char)*, PSID, uint*, PSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountNameW(const(wchar)*, const(wchar)*, PSID, uint*, PWSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountNameLocalA(const(char)*, PSID, uint*, PSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountNameLocalW(const(wchar)*, PSID, uint*, PWSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountSidLocalA(PSID, PSTR, uint*, PSTR, uint*, SID_NAME_USE*);
BOOL LookupAccountSidLocalW(PSID, PWSTR, uint*, PWSTR, uint*, SID_NAME_USE*);
BOOL LookupPrivilegeValueA(const(char)*, const(char)*, LUID*);
BOOL LookupPrivilegeValueW(const(wchar)*, const(wchar)*, LUID*);
BOOL LookupPrivilegeNameA(const(char)*, LUID*, PSTR, uint*);
BOOL LookupPrivilegeNameW(const(wchar)*, LUID*, PWSTR, uint*);
BOOL LookupPrivilegeDisplayNameA(const(char)*, const(char)*, PSTR, uint*, uint*);
BOOL LookupPrivilegeDisplayNameW(const(wchar)*, const(wchar)*, PWSTR, uint*, uint*);
BOOL LogonUserA(const(char)*, const(char)*, const(char)*, LOGON32_LOGON, LOGON32_PROVIDER, HANDLE*);
BOOL LogonUserW(const(wchar)*, const(wchar)*, const(wchar)*, LOGON32_LOGON, LOGON32_PROVIDER, HANDLE*);
BOOL LogonUserExA(const(char)*, const(char)*, const(char)*, LOGON32_LOGON, LOGON32_PROVIDER, HANDLE*, PSID*, void**, uint*, QUOTA_LIMITS*);
BOOL LogonUserExW(const(wchar)*, const(wchar)*, const(wchar)*, LOGON32_LOGON, LOGON32_PROVIDER, HANDLE*, PSID*, void**, uint*, QUOTA_LIMITS*);
NTSTATUS RtlConvertSidToUnicodeString(UNICODE_STRING*, PSID, BOOLEAN);
enum wszCERTENROLLSHAREPATH = "CertSrv\\CertEnroll";
enum cwcHRESULTSTRING = 0x00000028;
enum szLBRACE = "{";
enum szRBRACE = "}";
enum wszLBRACE = "{";
enum wszRBRACE = "}";
enum szLPAREN = "(";
enum szRPAREN = ")";
enum wszLPAREN = "(";
enum wszRPAREN = ")";
enum CVT_SECONDS = 0x00000001;
enum cwcFILENAMESUFFIXMAX = 0x00000014;
enum wszFCSAPARM_SERVERDNSNAME = "%1";
enum wszFCSAPARM_SERVERSHORTNAME = "%2";
enum wszFCSAPARM_SANITIZEDCANAME = "%3";
enum wszFCSAPARM_CERTFILENAMESUFFIX = "%4";
enum wszFCSAPARM_DOMAINDN = "%5";
enum wszFCSAPARM_CONFIGDN = "%6";
enum wszFCSAPARM_SANITIZEDCANAMEHASH = "%7";
enum wszFCSAPARM_CRLFILENAMESUFFIX = "%8";
enum wszFCSAPARM_CRLDELTAFILENAMESUFFIX = "%9";
enum wszFCSAPARM_DSCRLATTRIBUTE = "%10";
enum wszFCSAPARM_DSCACERTATTRIBUTE = "%11";
enum wszFCSAPARM_DSUSERCERTATTRIBUTE = "%12";
enum wszFCSAPARM_DSKRACERTATTRIBUTE = "%13";
enum wszFCSAPARM_DSCROSSCERTPAIRATTRIBUTE = "%14";
alias HDIAGNOSTIC_DATA_QUERY_SESSION = void*;
alias HDIAGNOSTIC_REPORT = void*;
alias HDIAGNOSTIC_EVENT_TAG_DESCRIPTION = void*;
alias HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION = void*;
alias HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION = void*;
alias HDIAGNOSTIC_RECORD = void*;
alias NCRYPT_DESCRIPTOR_HANDLE = long;
alias NCRYPT_STREAM_HANDLE = long;
alias SAFER_LEVEL_HANDLE = long;
alias SC_HANDLE = long;
alias PSECURITY_DESCRIPTOR = void*;
struct SECURITY_ATTRIBUTES
{
    uint nLength;
    void* lpSecurityDescriptor;
    BOOL bInheritHandle;
}
alias ENUM_PERIOD = int;
enum : int
{
    ENUM_PERIOD_INVALID = 0xffffffff,
    ENUM_PERIOD_SECONDS = 0x00000000,
    ENUM_PERIOD_MINUTES = 0x00000001,
    ENUM_PERIOD_HOURS   = 0x00000002,
    ENUM_PERIOD_DAYS    = 0x00000003,
    ENUM_PERIOD_WEEKS   = 0x00000004,
    ENUM_PERIOD_MONTHS  = 0x00000005,
    ENUM_PERIOD_YEARS   = 0x00000006,
}

struct LLFILETIME
{
    union
    {
        long ll;
        FILETIME ft;
    }
}
struct GENERIC_MAPPING
{
    uint GenericRead;
    uint GenericWrite;
    uint GenericExecute;
    uint GenericAll;
}
struct LUID_AND_ATTRIBUTES
{
    LUID Luid;
    TOKEN_PRIVILEGES_ATTRIBUTES Attributes;
}
alias SID_IDENTIFIER_AUTHORITY = ubyte;
struct SID
{
    ubyte Revision;
    ubyte SubAuthorityCount;
    SID_IDENTIFIER_AUTHORITY IdentifierAuthority;
    uint[1] SubAuthority;
}
union SE_SID
{
    SID Sid;
    ubyte[68] Buffer;
}
alias SID_NAME_USE = int;
enum : int
{
    SidTypeUser           = 0x00000001,
    SidTypeGroup          = 0x00000002,
    SidTypeDomain         = 0x00000003,
    SidTypeAlias          = 0x00000004,
    SidTypeWellKnownGroup = 0x00000005,
    SidTypeDeletedAccount = 0x00000006,
    SidTypeInvalid        = 0x00000007,
    SidTypeUnknown        = 0x00000008,
    SidTypeComputer       = 0x00000009,
    SidTypeLabel          = 0x0000000a,
    SidTypeLogonSession   = 0x0000000b,
}

struct SID_AND_ATTRIBUTES
{
    PSID Sid;
    uint Attributes;
}
struct SID_AND_ATTRIBUTES_HASH
{
    uint SidCount;
    SID_AND_ATTRIBUTES* SidAttr;
    ulong[32] Hash;
}
alias WELL_KNOWN_SID_TYPE = int;
enum : int
{
    WinNullSid                                    = 0x00000000,
    WinWorldSid                                   = 0x00000001,
    WinLocalSid                                   = 0x00000002,
    WinCreatorOwnerSid                            = 0x00000003,
    WinCreatorGroupSid                            = 0x00000004,
    WinCreatorOwnerServerSid                      = 0x00000005,
    WinCreatorGroupServerSid                      = 0x00000006,
    WinNtAuthoritySid                             = 0x00000007,
    WinDialupSid                                  = 0x00000008,
    WinNetworkSid                                 = 0x00000009,
    WinBatchSid                                   = 0x0000000a,
    WinInteractiveSid                             = 0x0000000b,
    WinServiceSid                                 = 0x0000000c,
    WinAnonymousSid                               = 0x0000000d,
    WinProxySid                                   = 0x0000000e,
    WinEnterpriseControllersSid                   = 0x0000000f,
    WinSelfSid                                    = 0x00000010,
    WinAuthenticatedUserSid                       = 0x00000011,
    WinRestrictedCodeSid                          = 0x00000012,
    WinTerminalServerSid                          = 0x00000013,
    WinRemoteLogonIdSid                           = 0x00000014,
    WinLogonIdsSid                                = 0x00000015,
    WinLocalSystemSid                             = 0x00000016,
    WinLocalServiceSid                            = 0x00000017,
    WinNetworkServiceSid                          = 0x00000018,
    WinBuiltinDomainSid                           = 0x00000019,
    WinBuiltinAdministratorsSid                   = 0x0000001a,
    WinBuiltinUsersSid                            = 0x0000001b,
    WinBuiltinGuestsSid                           = 0x0000001c,
    WinBuiltinPowerUsersSid                       = 0x0000001d,
    WinBuiltinAccountOperatorsSid                 = 0x0000001e,
    WinBuiltinSystemOperatorsSid                  = 0x0000001f,
    WinBuiltinPrintOperatorsSid                   = 0x00000020,
    WinBuiltinBackupOperatorsSid                  = 0x00000021,
    WinBuiltinReplicatorSid                       = 0x00000022,
    WinBuiltinPreWindows2000CompatibleAccessSid   = 0x00000023,
    WinBuiltinRemoteDesktopUsersSid               = 0x00000024,
    WinBuiltinNetworkConfigurationOperatorsSid    = 0x00000025,
    WinAccountAdministratorSid                    = 0x00000026,
    WinAccountGuestSid                            = 0x00000027,
    WinAccountKrbtgtSid                           = 0x00000028,
    WinAccountDomainAdminsSid                     = 0x00000029,
    WinAccountDomainUsersSid                      = 0x0000002a,
    WinAccountDomainGuestsSid                     = 0x0000002b,
    WinAccountComputersSid                        = 0x0000002c,
    WinAccountControllersSid                      = 0x0000002d,
    WinAccountCertAdminsSid                       = 0x0000002e,
    WinAccountSchemaAdminsSid                     = 0x0000002f,
    WinAccountEnterpriseAdminsSid                 = 0x00000030,
    WinAccountPolicyAdminsSid                     = 0x00000031,
    WinAccountRasAndIasServersSid                 = 0x00000032,
    WinNTLMAuthenticationSid                      = 0x00000033,
    WinDigestAuthenticationSid                    = 0x00000034,
    WinSChannelAuthenticationSid                  = 0x00000035,
    WinThisOrganizationSid                        = 0x00000036,
    WinOtherOrganizationSid                       = 0x00000037,
    WinBuiltinIncomingForestTrustBuildersSid      = 0x00000038,
    WinBuiltinPerfMonitoringUsersSid              = 0x00000039,
    WinBuiltinPerfLoggingUsersSid                 = 0x0000003a,
    WinBuiltinAuthorizationAccessSid              = 0x0000003b,
    WinBuiltinTerminalServerLicenseServersSid     = 0x0000003c,
    WinBuiltinDCOMUsersSid                        = 0x0000003d,
    WinBuiltinIUsersSid                           = 0x0000003e,
    WinIUserSid                                   = 0x0000003f,
    WinBuiltinCryptoOperatorsSid                  = 0x00000040,
    WinUntrustedLabelSid                          = 0x00000041,
    WinLowLabelSid                                = 0x00000042,
    WinMediumLabelSid                             = 0x00000043,
    WinHighLabelSid                               = 0x00000044,
    WinSystemLabelSid                             = 0x00000045,
    WinWriteRestrictedCodeSid                     = 0x00000046,
    WinCreatorOwnerRightsSid                      = 0x00000047,
    WinCacheablePrincipalsGroupSid                = 0x00000048,
    WinNonCacheablePrincipalsGroupSid             = 0x00000049,
    WinEnterpriseReadonlyControllersSid           = 0x0000004a,
    WinAccountReadonlyControllersSid              = 0x0000004b,
    WinBuiltinEventLogReadersGroup                = 0x0000004c,
    WinNewEnterpriseReadonlyControllersSid        = 0x0000004d,
    WinBuiltinCertSvcDComAccessGroup              = 0x0000004e,
    WinMediumPlusLabelSid                         = 0x0000004f,
    WinLocalLogonSid                              = 0x00000050,
    WinConsoleLogonSid                            = 0x00000051,
    WinThisOrganizationCertificateSid             = 0x00000052,
    WinApplicationPackageAuthoritySid             = 0x00000053,
    WinBuiltinAnyPackageSid                       = 0x00000054,
    WinCapabilityInternetClientSid                = 0x00000055,
    WinCapabilityInternetClientServerSid          = 0x00000056,
    WinCapabilityPrivateNetworkClientServerSid    = 0x00000057,
    WinCapabilityPicturesLibrarySid               = 0x00000058,
    WinCapabilityVideosLibrarySid                 = 0x00000059,
    WinCapabilityMusicLibrarySid                  = 0x0000005a,
    WinCapabilityDocumentsLibrarySid              = 0x0000005b,
    WinCapabilitySharedUserCertificatesSid        = 0x0000005c,
    WinCapabilityEnterpriseAuthenticationSid      = 0x0000005d,
    WinCapabilityRemovableStorageSid              = 0x0000005e,
    WinBuiltinRDSRemoteAccessServersSid           = 0x0000005f,
    WinBuiltinRDSEndpointServersSid               = 0x00000060,
    WinBuiltinRDSManagementServersSid             = 0x00000061,
    WinUserModeDriversSid                         = 0x00000062,
    WinBuiltinHyperVAdminsSid                     = 0x00000063,
    WinAccountCloneableControllersSid             = 0x00000064,
    WinBuiltinAccessControlAssistanceOperatorsSid = 0x00000065,
    WinBuiltinRemoteManagementUsersSid            = 0x00000066,
    WinAuthenticationAuthorityAssertedSid         = 0x00000067,
    WinAuthenticationServiceAssertedSid           = 0x00000068,
    WinLocalAccountSid                            = 0x00000069,
    WinLocalAccountAndAdministratorSid            = 0x0000006a,
    WinAccountProtectedUsersSid                   = 0x0000006b,
    WinCapabilityAppointmentsSid                  = 0x0000006c,
    WinCapabilityContactsSid                      = 0x0000006d,
    WinAccountDefaultSystemManagedSid             = 0x0000006e,
    WinBuiltinDefaultSystemManagedGroupSid        = 0x0000006f,
    WinBuiltinStorageReplicaAdminsSid             = 0x00000070,
    WinAccountKeyAdminsSid                        = 0x00000071,
    WinAccountEnterpriseKeyAdminsSid              = 0x00000072,
    WinAuthenticationKeyTrustSid                  = 0x00000073,
    WinAuthenticationKeyPropertyMFASid            = 0x00000074,
    WinAuthenticationKeyPropertyAttestationSid    = 0x00000075,
    WinAuthenticationFreshKeyAuthSid              = 0x00000076,
    WinBuiltinDeviceOwnersSid                     = 0x00000077,
}

struct ACL
{
    ubyte AclRevision;
    ubyte Sbz1;
    ushort AclSize;
    ushort AceCount;
    ushort Sbz2;
}
struct ACE_HEADER
{
    ubyte AceType;
    ubyte AceFlags;
    ushort AceSize;
}
struct ACCESS_ALLOWED_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct ACCESS_DENIED_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_AUDIT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_ALARM_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_RESOURCE_ATTRIBUTE_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_SCOPED_POLICY_ID_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_MANDATORY_LABEL_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_PROCESS_TRUST_LABEL_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_ACCESS_FILTER_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct ACCESS_ALLOWED_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct ACCESS_DENIED_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct SYSTEM_AUDIT_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct SYSTEM_ALARM_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct ACCESS_ALLOWED_CALLBACK_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct ACCESS_DENIED_CALLBACK_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_AUDIT_CALLBACK_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct SYSTEM_ALARM_CALLBACK_ACE
{
    ACE_HEADER Header;
    uint Mask;
    uint SidStart;
}
struct ACCESS_ALLOWED_CALLBACK_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct ACCESS_DENIED_CALLBACK_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct SYSTEM_AUDIT_CALLBACK_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
struct SYSTEM_ALARM_CALLBACK_OBJECT_ACE
{
    ACE_HEADER Header;
    uint Mask;
    SYSTEM_AUDIT_OBJECT_ACE_FLAGS Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    uint SidStart;
}
alias ACL_INFORMATION_CLASS = int;
enum : int
{
    AclRevisionInformation = 0x00000001,
    AclSizeInformation     = 0x00000002,
}

struct ACL_REVISION_INFORMATION
{
    uint AclRevision;
}
struct ACL_SIZE_INFORMATION
{
    uint AceCount;
    uint AclBytesInUse;
    uint AclBytesFree;
}
struct SECURITY_DESCRIPTOR
{
    ubyte Revision;
    ubyte Sbz1;
    ushort Control;
    PSID Owner;
    PSID Group;
    ACL* Sacl;
    ACL* Dacl;
}
struct OBJECT_TYPE_LIST
{
    ushort Level;
    ushort Sbz;
    GUID* ObjectType;
}
alias AUDIT_EVENT_TYPE = int;
enum : int
{
    AuditEventObjectAccess           = 0x00000000,
    AuditEventDirectoryServiceAccess = 0x00000001,
}

struct PRIVILEGE_SET
{
    uint PrivilegeCount;
    uint Control;
    LUID_AND_ATTRIBUTES[1] Privilege;
}
struct ACCESS_REASONS
{
    uint[32] Data;
}
struct SE_SECURITY_DESCRIPTOR
{
    uint Size;
    uint Flags;
    PSECURITY_DESCRIPTOR SecurityDescriptor;
}
struct SE_ACCESS_REQUEST
{
    uint Size;
    SE_SECURITY_DESCRIPTOR* SeSecurityDescriptor;
    uint DesiredAccess;
    uint PreviouslyGrantedAccess;
    PSID PrincipalSelfSid;
    GENERIC_MAPPING* GenericMapping;
    uint ObjectTypeListCount;
    OBJECT_TYPE_LIST* ObjectTypeList;
}
struct SE_ACCESS_REPLY
{
    uint Size;
    uint ResultListCount;
    uint* GrantedAccess;
    uint* AccessStatus;
    ACCESS_REASONS* AccessReason;
    PRIVILEGE_SET** Privileges;
}
alias SECURITY_IMPERSONATION_LEVEL = int;
enum : int
{
    SecurityAnonymous      = 0x00000000,
    SecurityIdentification = 0x00000001,
    SecurityImpersonation  = 0x00000002,
    SecurityDelegation     = 0x00000003,
}

alias TOKEN_TYPE = int;
enum : int
{
    TokenPrimary       = 0x00000001,
    TokenImpersonation = 0x00000002,
}

alias TOKEN_ELEVATION_TYPE = int;
enum : int
{
    TokenElevationTypeDefault = 0x00000001,
    TokenElevationTypeFull    = 0x00000002,
    TokenElevationTypeLimited = 0x00000003,
}

alias TOKEN_INFORMATION_CLASS = int;
enum : int
{
    TokenUser                            = 0x00000001,
    TokenGroups                          = 0x00000002,
    TokenPrivileges                      = 0x00000003,
    TokenOwner                           = 0x00000004,
    TokenPrimaryGroup                    = 0x00000005,
    TokenDefaultDacl                     = 0x00000006,
    TokenSource                          = 0x00000007,
    TokenType                            = 0x00000008,
    TokenImpersonationLevel              = 0x00000009,
    TokenStatistics                      = 0x0000000a,
    TokenRestrictedSids                  = 0x0000000b,
    TokenSessionId                       = 0x0000000c,
    TokenGroupsAndPrivileges             = 0x0000000d,
    TokenSessionReference                = 0x0000000e,
    TokenSandBoxInert                    = 0x0000000f,
    TokenAuditPolicy                     = 0x00000010,
    TokenOrigin                          = 0x00000011,
    TokenElevationType                   = 0x00000012,
    TokenLinkedToken                     = 0x00000013,
    TokenElevation                       = 0x00000014,
    TokenHasRestrictions                 = 0x00000015,
    TokenAccessInformation               = 0x00000016,
    TokenVirtualizationAllowed           = 0x00000017,
    TokenVirtualizationEnabled           = 0x00000018,
    TokenIntegrityLevel                  = 0x00000019,
    TokenUIAccess                        = 0x0000001a,
    TokenMandatoryPolicy                 = 0x0000001b,
    TokenLogonSid                        = 0x0000001c,
    TokenIsAppContainer                  = 0x0000001d,
    TokenCapabilities                    = 0x0000001e,
    TokenAppContainerSid                 = 0x0000001f,
    TokenAppContainerNumber              = 0x00000020,
    TokenUserClaimAttributes             = 0x00000021,
    TokenDeviceClaimAttributes           = 0x00000022,
    TokenRestrictedUserClaimAttributes   = 0x00000023,
    TokenRestrictedDeviceClaimAttributes = 0x00000024,
    TokenDeviceGroups                    = 0x00000025,
    TokenRestrictedDeviceGroups          = 0x00000026,
    TokenSecurityAttributes              = 0x00000027,
    TokenIsRestricted                    = 0x00000028,
    TokenProcessTrustLevel               = 0x00000029,
    TokenPrivateNameSpace                = 0x0000002a,
    TokenSingletonAttributes             = 0x0000002b,
    TokenBnoIsolation                    = 0x0000002c,
    TokenChildProcessFlags               = 0x0000002d,
    TokenIsLessPrivilegedAppContainer    = 0x0000002e,
    TokenIsSandboxed                     = 0x0000002f,
    MaxTokenInfoClass                    = 0x00000030,
}

struct TOKEN_USER
{
    SID_AND_ATTRIBUTES User;
}
struct TOKEN_GROUPS
{
    uint GroupCount;
    SID_AND_ATTRIBUTES[1] Groups;
}
struct TOKEN_PRIVILEGES
{
    uint PrivilegeCount;
    LUID_AND_ATTRIBUTES[1] Privileges;
}
struct TOKEN_OWNER
{
    PSID Owner;
}
struct TOKEN_PRIMARY_GROUP
{
    PSID PrimaryGroup;
}
struct TOKEN_DEFAULT_DACL
{
    ACL* DefaultDacl;
}
struct TOKEN_USER_CLAIMS
{
    void* UserClaims;
}
struct TOKEN_DEVICE_CLAIMS
{
    void* DeviceClaims;
}
struct TOKEN_GROUPS_AND_PRIVILEGES
{
    uint SidCount;
    uint SidLength;
    SID_AND_ATTRIBUTES* Sids;
    uint RestrictedSidCount;
    uint RestrictedSidLength;
    SID_AND_ATTRIBUTES* RestrictedSids;
    uint PrivilegeCount;
    uint PrivilegeLength;
    LUID_AND_ATTRIBUTES* Privileges;
    LUID AuthenticationId;
}
struct TOKEN_LINKED_TOKEN
{
    HANDLE LinkedToken;
}
struct TOKEN_ELEVATION
{
    uint TokenIsElevated;
}
struct TOKEN_MANDATORY_LABEL
{
    SID_AND_ATTRIBUTES Label;
}
struct TOKEN_MANDATORY_POLICY
{
    TOKEN_MANDATORY_POLICY_ID Policy;
}
struct TOKEN_ACCESS_INFORMATION
{
    SID_AND_ATTRIBUTES_HASH* SidHash;
    SID_AND_ATTRIBUTES_HASH* RestrictedSidHash;
    TOKEN_PRIVILEGES* Privileges;
    LUID AuthenticationId;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    TOKEN_MANDATORY_POLICY MandatoryPolicy;
    uint Flags;
    uint AppContainerNumber;
    PSID PackageSid;
    SID_AND_ATTRIBUTES_HASH* CapabilitiesHash;
    PSID TrustLevelSid;
    void* SecurityAttributes;
}
struct TOKEN_AUDIT_POLICY
{
    ubyte[30] PerUserPolicy;
}
struct TOKEN_SOURCE
{
    CHAR[8] SourceName;
    LUID SourceIdentifier;
}
struct TOKEN_STATISTICS
{
    LUID TokenId;
    LUID AuthenticationId;
    LARGE_INTEGER ExpirationTime;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    uint DynamicCharged;
    uint DynamicAvailable;
    uint GroupCount;
    uint PrivilegeCount;
    LUID ModifiedId;
}
struct TOKEN_CONTROL
{
    LUID TokenId;
    LUID AuthenticationId;
    LUID ModifiedId;
    TOKEN_SOURCE TokenSource;
}
struct TOKEN_ORIGIN
{
    LUID OriginatingLogonSession;
}
alias MANDATORY_LEVEL = int;
enum : int
{
    MandatoryLevelUntrusted     = 0x00000000,
    MandatoryLevelLow           = 0x00000001,
    MandatoryLevelMedium        = 0x00000002,
    MandatoryLevelHigh          = 0x00000003,
    MandatoryLevelSystem        = 0x00000004,
    MandatoryLevelSecureProcess = 0x00000005,
    MandatoryLevelCount         = 0x00000006,
}

struct TOKEN_APPCONTAINER_INFORMATION
{
    PSID TokenAppContainer;
}
struct CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
{
    ulong Version;
    PWSTR Name;
}
struct CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
{
    void* pValue;
    uint ValueLength;
}
struct CLAIM_SECURITY_ATTRIBUTE_V1
{
    PWSTR Name;
    CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE ValueType;
    ushort Reserved;
    uint Flags;
    uint ValueCount;
    union _Values_e__Union
    {
        long* pInt64;
        ulong* pUint64;
        PWSTR* ppString;
        CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE* pFqbn;
        CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE* pOctetString;
    }
}
struct CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1
{
    uint Name;
    CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE ValueType;
    ushort Reserved;
    CLAIM_SECURITY_ATTRIBUTE_FLAGS Flags;
    uint ValueCount;
    union _Values_e__Union
    {
        uint[1] pInt64;
        uint[1] pUint64;
        uint[1] ppString;
        uint[1] pFqbn;
        uint[1] pOctetString;
    }
}
struct CLAIM_SECURITY_ATTRIBUTES_INFORMATION
{
    ushort Version;
    ushort Reserved;
    uint AttributeCount;
    union _Attribute_e__Union
    {
        CLAIM_SECURITY_ATTRIBUTE_V1* pAttributeV1;
    }
}
struct SECURITY_QUALITY_OF_SERVICE
{
    uint Length;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    ubyte ContextTrackingMode;
    BOOLEAN EffectiveOnly;
}
struct SE_IMPERSONATION_STATE
{
    void* Token;
    BOOLEAN CopyOnOpen;
    BOOLEAN EffectiveOnly;
    SECURITY_IMPERSONATION_LEVEL Level;
}
struct SECURITY_CAPABILITIES
{
    PSID AppContainerSid;
    SID_AND_ATTRIBUTES* Capabilities;
    uint CapabilityCount;
    uint Reserved;
}
struct QUOTA_LIMITS
{
    ulong PagedPoolLimit;
    ulong NonPagedPoolLimit;
    ulong MinimumWorkingSetSize;
    ulong MaximumWorkingSetSize;
    ulong PagefileLimit;
    LARGE_INTEGER TimeLimit;
}
