module windows.win32.security;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, LUID, NTSTATUS, PSTR, PWSTR, UNICODE_STRING;

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

alias SECURITY_DESCRIPTOR_CONTROL = ushort;
enum : ushort
{
    SE_OWNER_DEFAULTED       = 0x0001,
    SE_GROUP_DEFAULTED       = 0x0002,
    SE_DACL_PRESENT          = 0x0004,
    SE_DACL_DEFAULTED        = 0x0008,
    SE_SACL_PRESENT          = 0x0010,
    SE_SACL_DEFAULTED        = 0x0020,
    SE_DACL_AUTO_INHERIT_REQ = 0x0100,
    SE_SACL_AUTO_INHERIT_REQ = 0x0200,
    SE_DACL_AUTO_INHERITED   = 0x0400,
    SE_SACL_AUTO_INHERITED   = 0x0800,
    SE_DACL_PROTECTED        = 0x1000,
    SE_SACL_PROTECTED        = 0x2000,
    SE_RM_CONTROL_VALID      = 0x4000,
    SE_SELF_RELATIVE         = 0x8000,
}

BOOL AccessCheck(PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, uint DesiredAccess, GENERIC_MAPPING* GenericMapping, PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccess, BOOL* AccessStatus);
BOOL AccessCheckAndAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, PWSTR ObjectTypeName, PWSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, uint DesiredAccess, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, BOOL* AccessStatus, BOOL* pfGenerateOnClose);
BOOL AccessCheckByType(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, uint DesiredAccess, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccess, BOOL* AccessStatus);
BOOL AccessCheckByTypeResultList(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, uint DesiredAccess, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccessList, uint* AccessStatusList);
BOOL AccessCheckByTypeAndAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, const(wchar)* ObjectTypeName, const(wchar)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, BOOL* AccessStatus, BOOL* pfGenerateOnClose);
BOOL AccessCheckByTypeResultListAndAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, const(wchar)* ObjectTypeName, const(wchar)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccessList, uint* AccessStatusList, BOOL* pfGenerateOnClose);
BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleW(const(wchar)* SubsystemName, void* HandleId, HANDLE ClientToken, const(wchar)* ObjectTypeName, const(wchar)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccessList, uint* AccessStatusList, BOOL* pfGenerateOnClose);
BOOL AddAccessAllowedAce(ACL* pAcl, ACE_REVISION dwAceRevision, uint AccessMask, PSID pSid);
BOOL AddAccessAllowedAceEx(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, PSID pSid);
BOOL AddAccessAllowedObjectAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
BOOL AddAccessDeniedAce(ACL* pAcl, ACE_REVISION dwAceRevision, uint AccessMask, PSID pSid);
BOOL AddAccessDeniedAceEx(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, PSID pSid);
BOOL AddAccessDeniedObjectAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
BOOL AddAce(ACL* pAcl, ACE_REVISION dwAceRevision, uint dwStartingAceIndex, void* pAceList, uint nAceListLength);
BOOL AddAuditAccessAce(ACL* pAcl, ACE_REVISION dwAceRevision, uint dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
BOOL AddAuditAccessAceEx(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
BOOL AddAuditAccessObjectAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
BOOL AddMandatoryAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint MandatoryPolicy, PSID pLabelSid);
BOOL AddResourceAttributeAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, PSID pSid, CLAIM_SECURITY_ATTRIBUTES_INFORMATION* pAttributeInfo, uint* pReturnLength);
BOOL AddScopedPolicyIDAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, uint AccessMask, PSID pSid);
BOOL AdjustTokenGroups(HANDLE TokenHandle, BOOL ResetToDefault, TOKEN_GROUPS* NewState, uint BufferLength, TOKEN_GROUPS* PreviousState, uint* ReturnLength);
BOOL AdjustTokenPrivileges(HANDLE TokenHandle, BOOL DisableAllPrivileges, TOKEN_PRIVILEGES* NewState, uint BufferLength, TOKEN_PRIVILEGES* PreviousState, uint* ReturnLength);
BOOL AllocateAndInitializeSid(SID_IDENTIFIER_AUTHORITY* pIdentifierAuthority, ubyte nSubAuthorityCount, uint nSubAuthority0, uint nSubAuthority1, uint nSubAuthority2, uint nSubAuthority3, uint nSubAuthority4, uint nSubAuthority5, uint nSubAuthority6, uint nSubAuthority7, PSID* pSid);
BOOL AllocateLocallyUniqueId(LUID* Luid);
BOOL AreAllAccessesGranted(uint GrantedAccess, uint DesiredAccess);
BOOL AreAnyAccessesGranted(uint GrantedAccess, uint DesiredAccess);
BOOL CheckTokenMembership(HANDLE TokenHandle, PSID SidToCheck, BOOL* IsMember);
BOOL CheckTokenCapability(HANDLE TokenHandle, PSID CapabilitySidToCheck, BOOL* HasCapability);
BOOL GetAppContainerAce(ACL* Acl, uint StartingAceIndex, void** AppContainerAce, uint* AppContainerAceIndex);
BOOL CheckTokenMembershipEx(HANDLE TokenHandle, PSID SidToCheck, uint Flags, BOOL* IsMember);
BOOL ConvertToAutoInheritPrivateObjectSecurity(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CurrentSecurityDescriptor, PSECURITY_DESCRIPTOR* NewSecurityDescriptor, GUID* ObjectType, BOOLEAN IsDirectoryObject, GENERIC_MAPPING* GenericMapping);
BOOL CopySid(uint nDestinationSidLength, PSID pDestinationSid, PSID pSourceSid);
BOOL CreatePrivateObjectSecurity(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, BOOL IsDirectoryObject, HANDLE Token, GENERIC_MAPPING* GenericMapping);
BOOL CreatePrivateObjectSecurityEx(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID* ObjectType, BOOL IsContainerObject, SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, HANDLE Token, GENERIC_MAPPING* GenericMapping);
BOOL CreatePrivateObjectSecurityWithMultipleInheritance(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID** ObjectTypes, uint GuidCount, BOOL IsContainerObject, SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, HANDLE Token, GENERIC_MAPPING* GenericMapping);
BOOL CreateRestrictedToken(HANDLE ExistingTokenHandle, CREATE_RESTRICTED_TOKEN_FLAGS Flags, uint DisableSidCount, SID_AND_ATTRIBUTES* SidsToDisable, uint DeletePrivilegeCount, LUID_AND_ATTRIBUTES* PrivilegesToDelete, uint RestrictedSidCount, SID_AND_ATTRIBUTES* SidsToRestrict, HANDLE* NewTokenHandle);
BOOL CreateWellKnownSid(WELL_KNOWN_SID_TYPE WellKnownSidType, PSID DomainSid, PSID pSid, uint* cbSid);
BOOL EqualDomainSid(PSID pSid1, PSID pSid2, BOOL* pfEqual);
BOOL DeleteAce(ACL* pAcl, uint dwAceIndex);
BOOL DestroyPrivateObjectSecurity(PSECURITY_DESCRIPTOR* ObjectDescriptor);
BOOL DuplicateToken(HANDLE ExistingTokenHandle, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, HANDLE* DuplicateTokenHandle);
BOOL DuplicateTokenEx(HANDLE hExistingToken, TOKEN_ACCESS_MASK dwDesiredAccess, SECURITY_ATTRIBUTES* lpTokenAttributes, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, TOKEN_TYPE TokenType, HANDLE* phNewToken);
BOOL EqualPrefixSid(PSID pSid1, PSID pSid2);
BOOL EqualSid(PSID pSid1, PSID pSid2);
BOOL FindFirstFreeAce(ACL* pAcl, void** pAce);
void* FreeSid(PSID pSid);
BOOL GetAce(ACL* pAcl, uint dwAceIndex, void** pAce);
BOOL GetAclInformation(ACL* pAcl, void* pAclInformation, uint nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
BOOL GetFileSecurityW(const(wchar)* lpFileName, uint RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded);
BOOL GetKernelObjectSecurity(HANDLE Handle, uint RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded);
uint GetLengthSid(PSID pSid);
BOOL GetPrivateObjectSecurity(PSECURITY_DESCRIPTOR ObjectDescriptor, OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ResultantDescriptor, uint DescriptorLength, uint* ReturnLength);
BOOL GetSecurityDescriptorControl(PSECURITY_DESCRIPTOR pSecurityDescriptor, ushort* pControl, uint* lpdwRevision);
BOOL GetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL* lpbDaclPresent, ACL** pDacl, BOOL* lpbDaclDefaulted);
BOOL GetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pGroup, BOOL* lpbGroupDefaulted);
uint GetSecurityDescriptorLength(PSECURITY_DESCRIPTOR pSecurityDescriptor);
BOOL GetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pOwner, BOOL* lpbOwnerDefaulted);
uint GetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR SecurityDescriptor, ubyte* RMControl);
BOOL GetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL* lpbSaclPresent, ACL** pSacl, BOOL* lpbSaclDefaulted);
SID_IDENTIFIER_AUTHORITY* GetSidIdentifierAuthority(PSID pSid);
uint GetSidLengthRequired(ubyte nSubAuthorityCount);
uint* GetSidSubAuthority(PSID pSid, uint nSubAuthority);
ubyte* GetSidSubAuthorityCount(PSID pSid);
BOOL GetTokenInformation(HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, void* TokenInformation, uint TokenInformationLength, uint* ReturnLength);
BOOL GetWindowsAccountDomainSid(PSID pSid, PSID pDomainSid, uint* cbDomainSid);
BOOL ImpersonateAnonymousToken(HANDLE ThreadHandle);
BOOL ImpersonateLoggedOnUser(HANDLE hToken);
BOOL ImpersonateSelf(SECURITY_IMPERSONATION_LEVEL ImpersonationLevel);
BOOL InitializeAcl(ACL* pAcl, uint nAclLength, ACE_REVISION dwAclRevision);
BOOL InitializeSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor, uint dwRevision);
BOOL InitializeSid(PSID Sid, SID_IDENTIFIER_AUTHORITY* pIdentifierAuthority, ubyte nSubAuthorityCount);
BOOL IsTokenRestricted(HANDLE TokenHandle);
BOOL IsValidAcl(ACL* pAcl);
BOOL IsValidSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor);
BOOL IsValidSid(PSID pSid);
BOOL IsWellKnownSid(PSID pSid, WELL_KNOWN_SID_TYPE WellKnownSidType);
BOOL MakeAbsoluteSD(PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, uint* lpdwAbsoluteSecurityDescriptorSize, ACL* pDacl, uint* lpdwDaclSize, ACL* pSacl, uint* lpdwSaclSize, PSID pOwner, uint* lpdwOwnerSize, PSID pPrimaryGroup, uint* lpdwPrimaryGroupSize);
BOOL MakeSelfRelativeSD(PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, uint* lpdwBufferLength);
void MapGenericMask(uint* AccessMask, GENERIC_MAPPING* GenericMapping);
BOOL ObjectCloseAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, BOOL GenerateOnClose);
BOOL ObjectDeleteAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, BOOL GenerateOnClose);
BOOL ObjectOpenAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, PWSTR ObjectTypeName, PWSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, uint DesiredAccess, uint GrantedAccess, PRIVILEGE_SET* Privileges, BOOL ObjectCreation, BOOL AccessGranted, BOOL* GenerateOnClose);
BOOL ObjectPrivilegeAuditAlarmW(const(wchar)* SubsystemName, void* HandleId, HANDLE ClientToken, uint DesiredAccess, PRIVILEGE_SET* Privileges, BOOL AccessGranted);
BOOL PrivilegeCheck(HANDLE ClientToken, PRIVILEGE_SET* RequiredPrivileges, BOOL* pfResult);
BOOL PrivilegedServiceAuditAlarmW(const(wchar)* SubsystemName, const(wchar)* ServiceName, HANDLE ClientToken, PRIVILEGE_SET* Privileges, BOOL AccessGranted);
void QuerySecurityAccessMask(OBJECT_SECURITY_INFORMATION SecurityInformation, uint* DesiredAccess);
BOOL RevertToSelf();
BOOL SetAclInformation(ACL* pAcl, void* pAclInformation, uint nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
BOOL SetFileSecurityW(const(wchar)* lpFileName, OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
BOOL SetKernelObjectSecurity(HANDLE Handle, OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR SecurityDescriptor);
BOOL SetPrivateObjectSecurity(OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, GENERIC_MAPPING* GenericMapping, HANDLE Token);
BOOL SetPrivateObjectSecurityEx(OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, GENERIC_MAPPING* GenericMapping, HANDLE Token);
void SetSecurityAccessMask(OBJECT_SECURITY_INFORMATION SecurityInformation, uint* DesiredAccess);
BOOL SetSecurityDescriptorControl(PSECURITY_DESCRIPTOR pSecurityDescriptor, SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest, SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet);
BOOL SetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bDaclPresent, ACL* pDacl, BOOL bDaclDefaulted);
BOOL SetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pGroup, BOOL bGroupDefaulted);
BOOL SetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pOwner, BOOL bOwnerDefaulted);
uint SetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR SecurityDescriptor, ubyte* RMControl);
BOOL SetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bSaclPresent, ACL* pSacl, BOOL bSaclDefaulted);
BOOL SetTokenInformation(HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, void* TokenInformation, uint TokenInformationLength);
BOOL SetCachedSigningLevel(HANDLE* SourceFiles, uint SourceFileCount, uint Flags, HANDLE TargetFile);
BOOL GetCachedSigningLevel(HANDLE File, uint* Flags, uint* SigningLevel, ubyte* Thumbprint, uint* ThumbprintSize, uint* ThumbprintAlgorithm);
BOOL DeriveCapabilitySidsFromName(const(wchar)* CapName, PSID** CapabilityGroupSids, uint* CapabilityGroupSidCount, PSID** CapabilitySids, uint* CapabilitySidCount);
BOOLEAN RtlNormalizeSecurityDescriptor(PSECURITY_DESCRIPTOR* SecurityDescriptor, uint SecurityDescriptorLength, PSECURITY_DESCRIPTOR* NewSecurityDescriptor, uint* NewSecurityDescriptorLength, BOOLEAN CheckOnly);
BOOL SetUserObjectSecurity(HANDLE hObj, OBJECT_SECURITY_INFORMATION* pSIRequested, PSECURITY_DESCRIPTOR pSID);
BOOL GetUserObjectSecurity(HANDLE hObj, uint* pSIRequested, PSECURITY_DESCRIPTOR pSID, uint nLength, uint* lpnLengthNeeded);
BOOL AccessCheckAndAuditAlarmA(const(char)* SubsystemName, void* HandleId, PSTR ObjectTypeName, PSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, uint DesiredAccess, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, BOOL* AccessStatus, BOOL* pfGenerateOnClose);
BOOL AccessCheckByTypeAndAuditAlarmA(const(char)* SubsystemName, void* HandleId, const(char)* ObjectTypeName, const(char)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, BOOL* AccessStatus, BOOL* pfGenerateOnClose);
BOOL AccessCheckByTypeResultListAndAuditAlarmA(const(char)* SubsystemName, void* HandleId, const(char)* ObjectTypeName, const(char)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, uint* AccessStatusList, BOOL* pfGenerateOnClose);
BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleA(const(char)* SubsystemName, void* HandleId, HANDLE ClientToken, const(char)* ObjectTypeName, const(char)* ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, uint DesiredAccess, AUDIT_EVENT_TYPE AuditType, uint Flags, OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, GENERIC_MAPPING* GenericMapping, BOOL ObjectCreation, uint* GrantedAccess, uint* AccessStatusList, BOOL* pfGenerateOnClose);
BOOL ObjectOpenAuditAlarmA(const(char)* SubsystemName, void* HandleId, PSTR ObjectTypeName, PSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, uint DesiredAccess, uint GrantedAccess, PRIVILEGE_SET* Privileges, BOOL ObjectCreation, BOOL AccessGranted, BOOL* GenerateOnClose);
BOOL ObjectPrivilegeAuditAlarmA(const(char)* SubsystemName, void* HandleId, HANDLE ClientToken, uint DesiredAccess, PRIVILEGE_SET* Privileges, BOOL AccessGranted);
BOOL ObjectCloseAuditAlarmA(const(char)* SubsystemName, void* HandleId, BOOL GenerateOnClose);
BOOL ObjectDeleteAuditAlarmA(const(char)* SubsystemName, void* HandleId, BOOL GenerateOnClose);
BOOL PrivilegedServiceAuditAlarmA(const(char)* SubsystemName, const(char)* ServiceName, HANDLE ClientToken, PRIVILEGE_SET* Privileges, BOOL AccessGranted);
BOOL AddConditionalAce(ACL* pAcl, ACE_REVISION dwAceRevision, ACE_FLAGS AceFlags, ubyte AceType, uint AccessMask, PSID pSid, PWSTR ConditionStr, uint* ReturnLength);
BOOL SetFileSecurityA(const(char)* lpFileName, OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
BOOL GetFileSecurityA(const(char)* lpFileName, uint RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded);
BOOL LookupAccountSidA(const(char)* lpSystemName, PSID Sid, PSTR Name, uint* cchName, PSTR ReferencedDomainName, uint* cchReferencedDomainName, SID_NAME_USE* peUse);
BOOL LookupAccountSidW(const(wchar)* lpSystemName, PSID Sid, PWSTR Name, uint* cchName, PWSTR ReferencedDomainName, uint* cchReferencedDomainName, SID_NAME_USE* peUse);
BOOL LookupAccountNameA(const(char)* lpSystemName, const(char)* lpAccountName, PSID Sid, uint* cbSid, PSTR ReferencedDomainName, uint* cchReferencedDomainName, SID_NAME_USE* peUse);
BOOL LookupAccountNameW(const(wchar)* lpSystemName, const(wchar)* lpAccountName, PSID Sid, uint* cbSid, PWSTR ReferencedDomainName, uint* cchReferencedDomainName, SID_NAME_USE* peUse);
BOOL LookupPrivilegeValueA(const(char)* lpSystemName, const(char)* lpName, LUID* lpLuid);
BOOL LookupPrivilegeValueW(const(wchar)* lpSystemName, const(wchar)* lpName, LUID* lpLuid);
BOOL LookupPrivilegeNameA(const(char)* lpSystemName, LUID* lpLuid, PSTR lpName, uint* cchName);
BOOL LookupPrivilegeNameW(const(wchar)* lpSystemName, LUID* lpLuid, PWSTR lpName, uint* cchName);
BOOL LookupPrivilegeDisplayNameA(const(char)* lpSystemName, const(char)* lpName, PSTR lpDisplayName, uint* cchDisplayName, uint* lpLanguageId);
BOOL LookupPrivilegeDisplayNameW(const(wchar)* lpSystemName, const(wchar)* lpName, PWSTR lpDisplayName, uint* cchDisplayName, uint* lpLanguageId);
BOOL LogonUserA(const(char)* lpszUsername, const(char)* lpszDomain, const(char)* lpszPassword, LOGON32_LOGON dwLogonType, LOGON32_PROVIDER dwLogonProvider, HANDLE* phToken);
BOOL LogonUserW(const(wchar)* lpszUsername, const(wchar)* lpszDomain, const(wchar)* lpszPassword, LOGON32_LOGON dwLogonType, LOGON32_PROVIDER dwLogonProvider, HANDLE* phToken);
BOOL LogonUserExA(const(char)* lpszUsername, const(char)* lpszDomain, const(char)* lpszPassword, LOGON32_LOGON dwLogonType, LOGON32_PROVIDER dwLogonProvider, HANDLE* phToken, PSID* ppLogonSid, void** ppProfileBuffer, uint* pdwProfileLength, QUOTA_LIMITS* pQuotaLimits);
BOOL LogonUserExW(const(wchar)* lpszUsername, const(wchar)* lpszDomain, const(wchar)* lpszPassword, LOGON32_LOGON dwLogonType, LOGON32_PROVIDER dwLogonProvider, HANDLE* phToken, PSID* ppLogonSid, void** ppProfileBuffer, uint* pdwProfileLength, QUOTA_LIMITS* pQuotaLimits);
NTSTATUS RtlConvertSidToUnicodeString(UNICODE_STRING* UnicodeString, PSID Sid, BOOLEAN AllocateDestinationString);
enum SECURITY_DYNAMIC_TRACKING = 0x01;
enum SECURITY_STATIC_TRACKING = 0x00;
enum SECURITY_MAX_SID_SIZE = 0x00000044;
enum SECURITY_NULL_SID_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 0]);
enum SECURITY_WORLD_SID_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 1]);
enum SECURITY_LOCAL_SID_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 2]);
enum SECURITY_CREATOR_SID_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 3]);
enum SECURITY_NON_UNIQUE_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 4]);
enum SECURITY_NT_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 5]);
enum SECURITY_RESOURCE_MANAGER_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 9]);
enum SECURITY_APP_PACKAGE_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 15]);
enum SECURITY_MANDATORY_LABEL_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 16]);
enum SECURITY_SCOPED_POLICY_ID_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 17]);
enum SECURITY_AUTHENTICATION_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 18]);
enum SECURITY_PROCESS_TRUST_AUTHORITY = SID_IDENTIFIER_AUTHORITY([0, 0, 0, 0, 0, 19]);
enum SE_CREATE_TOKEN_NAME = "SeCreateTokenPrivilege";
enum SE_ASSIGNPRIMARYTOKEN_NAME = "SeAssignPrimaryTokenPrivilege";
enum SE_LOCK_MEMORY_NAME = "SeLockMemoryPrivilege";
enum SE_INCREASE_QUOTA_NAME = "SeIncreaseQuotaPrivilege";
enum SE_UNSOLICITED_INPUT_NAME = "SeUnsolicitedInputPrivilege";
enum SE_MACHINE_ACCOUNT_NAME = "SeMachineAccountPrivilege";
enum SE_TCB_NAME = "SeTcbPrivilege";
enum SE_SECURITY_NAME = "SeSecurityPrivilege";
enum SE_TAKE_OWNERSHIP_NAME = "SeTakeOwnershipPrivilege";
enum SE_LOAD_DRIVER_NAME = "SeLoadDriverPrivilege";
enum SE_SYSTEM_PROFILE_NAME = "SeSystemProfilePrivilege";
enum SE_SYSTEMTIME_NAME = "SeSystemtimePrivilege";
enum SE_PROF_SINGLE_PROCESS_NAME = "SeProfileSingleProcessPrivilege";
enum SE_INC_BASE_PRIORITY_NAME = "SeIncreaseBasePriorityPrivilege";
enum SE_CREATE_PAGEFILE_NAME = "SeCreatePagefilePrivilege";
enum SE_CREATE_PERMANENT_NAME = "SeCreatePermanentPrivilege";
enum SE_BACKUP_NAME = "SeBackupPrivilege";
enum SE_RESTORE_NAME = "SeRestorePrivilege";
enum SE_SHUTDOWN_NAME = "SeShutdownPrivilege";
enum SE_DEBUG_NAME = "SeDebugPrivilege";
enum SE_AUDIT_NAME = "SeAuditPrivilege";
enum SE_SYSTEM_ENVIRONMENT_NAME = "SeSystemEnvironmentPrivilege";
enum SE_CHANGE_NOTIFY_NAME = "SeChangeNotifyPrivilege";
enum SE_REMOTE_SHUTDOWN_NAME = "SeRemoteShutdownPrivilege";
enum SE_UNDOCK_NAME = "SeUndockPrivilege";
enum SE_SYNC_AGENT_NAME = "SeSyncAgentPrivilege";
enum SE_ENABLE_DELEGATION_NAME = "SeEnableDelegationPrivilege";
enum SE_MANAGE_VOLUME_NAME = "SeManageVolumePrivilege";
enum SE_IMPERSONATE_NAME = "SeImpersonatePrivilege";
enum SE_CREATE_GLOBAL_NAME = "SeCreateGlobalPrivilege";
enum SE_TRUSTED_CREDMAN_ACCESS_NAME = "SeTrustedCredManAccessPrivilege";
enum SE_RELABEL_NAME = "SeRelabelPrivilege";
enum SE_INC_WORKING_SET_NAME = "SeIncreaseWorkingSetPrivilege";
enum SE_TIME_ZONE_NAME = "SeTimeZonePrivilege";
enum SE_CREATE_SYMBOLIC_LINK_NAME = "SeCreateSymbolicLinkPrivilege";
enum SE_DELEGATE_SESSION_USER_IMPERSONATE_NAME = "SeDelegateSessionUserImpersonatePrivilege";
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
enum SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED = 0x00000001;
enum SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY = 0x00000004;
enum SIGNING_LEVEL_MICROSOFT = 0x00000008;
alias PLSA_AP_CALL_PACKAGE_UNTRUSTED = NTSTATUS function(void** ClientRequest, void* ProtocolSubmitBuffer, void* ClientBufferBase, uint SubmitBufferLength, void** ProtocolReturnBuffer, uint* ReturnBufferLength, int* ProtocolStatus);
alias SEC_THREAD_START = uint function(void* lpThreadParameter);
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
    TOKEN_ALL_ACCESS                = 0x000f01ff,
}

alias PSID = void*;
alias NCRYPT_DESCRIPTOR_HANDLE = void*;
alias NCRYPT_STREAM_HANDLE = void*;
alias SAFER_LEVEL_HANDLE = void*;
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
struct SID_IDENTIFIER_AUTHORITY
{
    ubyte[6] Value;
}
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
struct SECURITY_DESCRIPTOR_RELATIVE
{
    ubyte Revision;
    ubyte Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
    uint Owner;
    uint Group;
    uint Sacl;
    uint Dacl;
}
struct SECURITY_DESCRIPTOR
{
    ubyte Revision;
    ubyte Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
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
    TokenIsAppSilo                       = 0x00000030,
    MaxTokenInfoClass                    = 0x00000031,
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
    long ExpirationTime;
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
    union Values
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
    union Values
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
    union Attribute
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
    long TimeLimit;
}
