module windows.win32.networkmanagement.netmanagement;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMNodeList;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, FILETIME, HANDLE, HRESULT, HWND, NTSTATUS, PSID, PSTR, PWSTR;
import windows.win32.security_ : SID_NAME_USE;
import windows.win32.security.cryptography_ : CERT_CONTEXT;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

alias NET_REQUEST_PROVISION_OPTIONS = uint;
enum : uint
{
    NETSETUP_PROVISION_ONLINE_CALLER = 0x40000000,
}

alias NET_JOIN_DOMAIN_JOIN_OPTIONS = uint;
enum : uint
{
    NETSETUP_JOIN_DOMAIN              = 0x00000001,
    NETSETUP_ACCT_CREATE              = 0x00000002,
    NETSETUP_WIN9X_UPGRADE            = 0x00000010,
    NETSETUP_DOMAIN_JOIN_IF_JOINED    = 0x00000020,
    NETSETUP_JOIN_UNSECURE            = 0x00000040,
    NETSETUP_MACHINE_PWD_PASSED       = 0x00000080,
    NETSETUP_DEFER_SPN_SET            = 0x00000100,
    NETSETUP_JOIN_DC_ACCOUNT          = 0x00000200,
    NETSETUP_JOIN_WITH_NEW_NAME       = 0x00000400,
    NETSETUP_JOIN_READONLY            = 0x00000800,
    NETSETUP_AMBIGUOUS_DC             = 0x00001000,
    NETSETUP_NO_NETLOGON_CACHE        = 0x00002000,
    NETSETUP_DONT_CONTROL_SERVICES    = 0x00004000,
    NETSETUP_SET_MACHINE_NAME         = 0x00008000,
    NETSETUP_FORCE_SPN_SET            = 0x00010000,
    NETSETUP_NO_ACCT_REUSE            = 0x00020000,
    NETSETUP_IGNORE_UNSUPPORTED_FLAGS = 0x10000000,
}

alias NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS = int;
enum : int
{
    SUPPORTS_REMOTE_ADMIN_PROTOCOL = 0x00000002,
    SUPPORTS_RPC                   = 0x00000004,
    SUPPORTS_SAM_PROTOCOL          = 0x00000008,
    SUPPORTS_UNICODE               = 0x00000010,
    SUPPORTS_LOCAL                 = 0x00000020,
}

alias FORCE_LEVEL_FLAGS = uint;
enum : uint
{
    USE_NOFORCE       = 0x00000000,
    USE_FORCE         = 0x00000001,
    USE_LOTS_OF_FORCE = 0x00000002,
}

alias NET_SERVER_TYPE = uint;
enum : uint
{
    SV_TYPE_WORKSTATION       = 0x00000001,
    SV_TYPE_SERVER            = 0x00000002,
    SV_TYPE_SQLSERVER         = 0x00000004,
    SV_TYPE_DOMAIN_CTRL       = 0x00000008,
    SV_TYPE_DOMAIN_BAKCTRL    = 0x00000010,
    SV_TYPE_TIME_SOURCE       = 0x00000020,
    SV_TYPE_AFP               = 0x00000040,
    SV_TYPE_NOVELL            = 0x00000080,
    SV_TYPE_DOMAIN_MEMBER     = 0x00000100,
    SV_TYPE_PRINTQ_SERVER     = 0x00000200,
    SV_TYPE_DIALIN_SERVER     = 0x00000400,
    SV_TYPE_XENIX_SERVER      = 0x00000800,
    SV_TYPE_SERVER_UNIX       = 0x00000800,
    SV_TYPE_NT                = 0x00001000,
    SV_TYPE_WFW               = 0x00002000,
    SV_TYPE_SERVER_MFPN       = 0x00004000,
    SV_TYPE_SERVER_NT         = 0x00008000,
    SV_TYPE_POTENTIAL_BROWSER = 0x00010000,
    SV_TYPE_BACKUP_BROWSER    = 0x00020000,
    SV_TYPE_MASTER_BROWSER    = 0x00040000,
    SV_TYPE_DOMAIN_MASTER     = 0x00080000,
    SV_TYPE_SERVER_OSF        = 0x00100000,
    SV_TYPE_SERVER_VMS        = 0x00200000,
    SV_TYPE_WINDOWS           = 0x00400000,
    SV_TYPE_DFS               = 0x00800000,
    SV_TYPE_CLUSTER_NT        = 0x01000000,
    SV_TYPE_TERMINALSERVER    = 0x02000000,
    SV_TYPE_CLUSTER_VS_NT     = 0x04000000,
    SV_TYPE_DCE               = 0x10000000,
    SV_TYPE_ALTERNATE_XPORT   = 0x20000000,
    SV_TYPE_LOCAL_LIST_ONLY   = 0x40000000,
    SV_TYPE_DOMAIN_ENUM       = 0x80000000,
    SV_TYPE_ALL               = 0xffffffff,
}

alias NET_USER_ENUM_FILTER_FLAGS = uint;
enum : uint
{
    FILTER_TEMP_DUPLICATE_ACCOUNT    = 0x00000001,
    FILTER_NORMAL_ACCOUNT            = 0x00000002,
    FILTER_INTERDOMAIN_TRUST_ACCOUNT = 0x00000008,
    FILTER_WORKSTATION_TRUST_ACCOUNT = 0x00000010,
    FILTER_SERVER_TRUST_ACCOUNT      = 0x00000020,
}

alias NETSETUP_PROVISION = uint;
enum : uint
{
    NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT = 0x00000001,
    NETSETUP_PROVISION_REUSE_ACCOUNT          = 0x00000002,
    NETSETUP_PROVISION_USE_DEFAULT_PASSWORD   = 0x00000004,
    NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH    = 0x00000008,
    NETSETUP_PROVISION_ROOT_CA_CERTS          = 0x00000010,
}

alias USER_ACCOUNT_FLAGS = uint;
enum : uint
{
    UF_SCRIPT                                 = 0x00000001,
    UF_ACCOUNTDISABLE                         = 0x00000002,
    UF_HOMEDIR_REQUIRED                       = 0x00000008,
    UF_PASSWD_NOTREQD                         = 0x00000020,
    UF_PASSWD_CANT_CHANGE                     = 0x00000040,
    UF_LOCKOUT                                = 0x00000010,
    UF_DONT_EXPIRE_PASSWD                     = 0x00010000,
    UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED        = 0x00000080,
    UF_NOT_DELEGATED                          = 0x00100000,
    UF_SMARTCARD_REQUIRED                     = 0x00040000,
    UF_USE_DES_KEY_ONLY                       = 0x00200000,
    UF_DONT_REQUIRE_PREAUTH                   = 0x00400000,
    UF_TRUSTED_FOR_DELEGATION                 = 0x00080000,
    UF_PASSWORD_EXPIRED                       = 0x00800000,
    UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x01000000,
}

alias AF_OP = uint;
enum : uint
{
    AF_OP_PRINT    = 0x00000001,
    AF_OP_COMM     = 0x00000002,
    AF_OP_SERVER   = 0x00000004,
    AF_OP_ACCOUNTS = 0x00000008,
}

alias SERVER_INFO_SECURITY = uint;
enum : uint
{
    SV_SHARESECURITY = 0x00000000,
    SV_USERSECURITY  = 0x00000001,
}

alias USER_PRIV = uint;
enum : uint
{
    USER_PRIV_GUEST = 0x00000000,
    USER_PRIV_USER  = 0x00000001,
    USER_PRIV_ADMIN = 0x00000002,
}

alias USE_INFO_ASG_TYPE = uint;
enum : uint
{
    USE_WILDCARD = 0xffffffff,
    USE_DISKDEV  = 0x00000000,
    USE_SPOOLDEV = 0x00000001,
    USE_IPC      = 0x00000003,
}

alias SERVER_INFO_HIDDEN = uint;
enum : uint
{
    SV_VISIBLE = 0x00000000,
    SV_HIDDEN  = 0x00000001,
}

alias USER_MODALS_ROLES = uint;
enum : uint
{
    UAS_ROLE_STANDALONE = 0x00000000,
    UAS_ROLE_MEMBER     = 0x00000001,
    UAS_ROLE_BACKUP     = 0x00000002,
    UAS_ROLE_PRIMARY    = 0x00000003,
}

uint NetUserAdd(const(wchar)*, uint, ubyte*, uint*);
uint NetUserEnum(const(wchar)*, uint, NET_USER_ENUM_FILTER_FLAGS, ubyte**, uint, uint*, uint*, uint*);
uint NetUserGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetUserSetInfo(const(wchar)*, const(wchar)*, uint, ubyte*, uint*);
uint NetUserDel(const(wchar)*, const(wchar)*);
uint NetUserGetGroups(const(wchar)*, const(wchar)*, uint, ubyte**, uint, uint*, uint*);
uint NetUserSetGroups(const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint NetUserGetLocalGroups(const(wchar)*, const(wchar)*, uint, uint, ubyte**, uint, uint*, uint*);
uint NetUserModalsGet(const(wchar)*, uint, ubyte**);
uint NetUserModalsSet(const(wchar)*, uint, ubyte*, uint*);
uint NetUserChangePassword(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
uint NetGroupAdd(const(wchar)*, uint, ubyte*, uint*);
uint NetGroupAddUser(const(wchar)*, const(wchar)*, const(wchar)*);
uint NetGroupEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, ulong*);
uint NetGroupGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetGroupSetInfo(const(wchar)*, const(wchar)*, uint, ubyte*, uint*);
uint NetGroupDel(const(wchar)*, const(wchar)*);
uint NetGroupDelUser(const(wchar)*, const(wchar)*, const(wchar)*);
uint NetGroupGetUsers(const(wchar)*, const(wchar)*, uint, ubyte**, uint, uint*, uint*, ulong*);
uint NetGroupSetUsers(const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint NetLocalGroupAdd(const(wchar)*, uint, ubyte*, uint*);
uint NetLocalGroupAddMember(const(wchar)*, const(wchar)*, PSID);
uint NetLocalGroupEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, ulong*);
uint NetLocalGroupGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetLocalGroupSetInfo(const(wchar)*, const(wchar)*, uint, ubyte*, uint*);
uint NetLocalGroupDel(const(wchar)*, const(wchar)*);
uint NetLocalGroupDelMember(const(wchar)*, const(wchar)*, PSID);
uint NetLocalGroupGetMembers(const(wchar)*, const(wchar)*, uint, ubyte**, uint, uint*, uint*, ulong*);
uint NetLocalGroupSetMembers(const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint NetLocalGroupAddMembers(const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint NetLocalGroupDelMembers(const(wchar)*, const(wchar)*, uint, ubyte*, uint);
uint NetQueryDisplayInformation(const(wchar)*, uint, uint, uint, uint, uint*, void**);
uint NetGetDisplayInformationIndex(const(wchar)*, uint, const(wchar)*, uint*);
uint NetAccessAdd(const(wchar)*, uint, ubyte*, uint*);
uint NetAccessEnum(const(wchar)*, const(wchar)*, uint, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetAccessGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetAccessSetInfo(const(wchar)*, const(wchar)*, uint, ubyte*, uint*);
uint NetAccessDel(const(wchar)*, const(wchar)*);
uint NetAccessGetUserPerms(const(wchar)*, const(wchar)*, const(wchar)*, uint*);
uint NetValidatePasswordPolicy(const(wchar)*, void*, NET_VALIDATE_PASSWORD_TYPE, void*, void**);
uint NetValidatePasswordPolicyFree(void**);
uint NetGetDCName(const(wchar)*, const(wchar)*, ubyte**);
uint NetGetAnyDCName(const(wchar)*, const(wchar)*, ubyte**);
uint I_NetLogonControl2(const(wchar)*, uint, uint, ubyte*, ubyte**);
NTSTATUS NetAddServiceAccount(PWSTR, PWSTR, PWSTR, uint);
NTSTATUS NetRemoveServiceAccount(PWSTR, PWSTR, uint);
NTSTATUS NetEnumerateServiceAccounts(PWSTR, uint, uint*, ushort***);
NTSTATUS NetIsServiceAccount(PWSTR, PWSTR, BOOL*);
NTSTATUS NetQueryServiceAccount(PWSTR, PWSTR, uint, ubyte**);
uint NetAlertRaise(const(wchar)*, void*, uint);
uint NetAlertRaiseEx(const(wchar)*, void*, uint, const(wchar)*);
uint NetMessageNameAdd(const(wchar)*, const(wchar)*);
uint NetMessageNameEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetMessageNameGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetMessageNameDel(const(wchar)*, const(wchar)*);
uint NetMessageBufferSend(const(wchar)*, const(wchar)*, const(wchar)*, ubyte*, uint);
uint NetRemoteTOD(const(wchar)*, ubyte**);
uint NetRemoteComputerSupports(const(wchar)*, NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS, uint*);
uint NetReplGetInfo(const(wchar)*, uint, ubyte**);
uint NetReplSetInfo(const(wchar)*, uint, const(ubyte)*, uint*);
uint NetReplExportDirAdd(const(wchar)*, uint, const(ubyte)*, uint*);
uint NetReplExportDirDel(const(wchar)*, const(wchar)*);
uint NetReplExportDirEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetReplExportDirGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetReplExportDirSetInfo(const(wchar)*, const(wchar)*, uint, const(ubyte)*, uint*);
uint NetReplExportDirLock(const(wchar)*, const(wchar)*);
uint NetReplExportDirUnlock(const(wchar)*, const(wchar)*, uint);
uint NetReplImportDirAdd(const(wchar)*, uint, const(ubyte)*, uint*);
uint NetReplImportDirDel(const(wchar)*, const(wchar)*);
uint NetReplImportDirEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetReplImportDirGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetReplImportDirLock(const(wchar)*, const(wchar)*);
uint NetReplImportDirUnlock(const(wchar)*, const(wchar)*, uint);
uint NetServerEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, NET_SERVER_TYPE, const(wchar)*, uint*);
uint NetServerGetInfo(PWSTR, uint, ubyte**);
uint NetServerSetInfo(PWSTR, uint, ubyte*, uint*);
uint NetServerDiskEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetServerComputerNameAdd(PWSTR, PWSTR, PWSTR);
uint NetServerComputerNameDel(PWSTR, PWSTR);
uint NetServerTransportAdd(PWSTR, uint, ubyte*);
uint NetServerTransportAddEx(PWSTR, uint, ubyte*);
uint NetServerTransportDel(PWSTR, uint, ubyte*);
uint NetServerTransportEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetServiceControl(const(wchar)*, const(wchar)*, uint, uint, ubyte**);
uint NetServiceEnum(const(wchar)*, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetServiceGetInfo(const(wchar)*, const(wchar)*, uint, ubyte**);
uint NetServiceInstall(const(wchar)*, const(wchar)*, uint, const(wchar)**, ubyte**);
uint NetUseAdd(byte*, uint, ubyte*, uint*);
uint NetUseDel(PWSTR, PWSTR, FORCE_LEVEL_FLAGS);
uint NetUseEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetUseGetInfo(PWSTR, PWSTR, uint, ubyte**);
uint NetWkstaGetInfo(PWSTR, uint, ubyte**);
uint NetWkstaSetInfo(PWSTR, uint, ubyte*, uint*);
uint NetWkstaUserGetInfo(PWSTR, uint, ubyte**);
uint NetWkstaUserSetInfo(PWSTR, uint, ubyte*, uint*);
uint NetWkstaUserEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetWkstaTransportAdd(byte*, uint, ubyte*, uint*);
uint NetWkstaTransportDel(PWSTR, PWSTR, FORCE_LEVEL_FLAGS);
uint NetWkstaTransportEnum(byte*, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetApiBufferAllocate(uint, void**);
uint NetApiBufferFree(void*);
uint NetApiBufferReallocate(void*, uint, void**);
uint NetApiBufferSize(void*, uint*);
uint NetErrorLogClear(const(wchar)*, const(wchar)*, ubyte*);
uint NetErrorLogRead(const(wchar)*, PWSTR, HLOG*, uint, uint*, uint, uint, ubyte**, uint, uint*, uint*);
uint NetErrorLogWrite(ubyte*, uint, const(wchar)*, ubyte*, uint, ubyte*, uint, ubyte*);
uint NetConfigGet(const(wchar)*, const(wchar)*, const(wchar)*, ubyte**);
uint NetConfigGetAll(const(wchar)*, const(wchar)*, ubyte**);
uint NetConfigSet(const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, ubyte*, uint);
uint NetAuditClear(const(wchar)*, const(wchar)*, const(wchar)*);
uint NetAuditRead(const(wchar)*, const(wchar)*, HLOG*, uint, uint*, uint, uint, ubyte**, uint, uint*, uint*);
uint NetAuditWrite(uint, ubyte*, uint, const(wchar)*, ubyte*);
uint NetJoinDomain(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, NET_JOIN_DOMAIN_JOIN_OPTIONS);
uint NetUnjoinDomain(const(wchar)*, const(wchar)*, const(wchar)*, uint);
uint NetRenameMachineInDomain(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
uint NetValidateName(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, NETSETUP_NAME_TYPE);
uint NetGetJoinableOUs(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint*, PWSTR**);
uint NetAddAlternateComputerName(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
uint NetRemoveAlternateComputerName(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
uint NetSetPrimaryComputerName(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
uint NetEnumerateComputerNames(const(wchar)*, NET_COMPUTER_NAME_TYPE, uint, uint*, PWSTR**);
uint NetProvisionComputerAccount(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, NETSETUP_PROVISION, ubyte**, uint*, PWSTR*);
uint NetRequestOfflineDomainJoin(ubyte*, uint, NET_REQUEST_PROVISION_OPTIONS, const(wchar)*);
uint NetCreateProvisioningPackage(NETSETUP_PROVISIONING_PARAMS*, ubyte**, uint*, PWSTR*);
uint NetRequestProvisioningPackageInstall(ubyte*, uint, NET_REQUEST_PROVISION_OPTIONS, const(wchar)*, void*);
HRESULT NetGetAadJoinInformation(const(wchar)*, DSREG_JOIN_INFO**);
void NetFreeAadJoinInformation(DSREG_JOIN_INFO*);
uint NetGetJoinInformation(const(wchar)*, PWSTR*, NETSETUP_JOIN_STATUS*);
HRESULT GetNetScheduleAccountInformation(const(wchar)*, uint, PWSTR);
HRESULT SetNetScheduleAccountInformation(const(wchar)*, const(wchar)*, const(wchar)*);
uint NetScheduleJobAdd(const(wchar)*, ubyte*, uint*);
uint NetScheduleJobDel(const(wchar)*, uint, uint);
uint NetScheduleJobEnum(const(wchar)*, ubyte**, uint, uint*, uint*, uint*);
uint NetScheduleJobGetInfo(const(wchar)*, uint, ubyte**);
uint TraceRegisterExA(const(char)*, uint);
uint TraceDeregisterA(uint);
uint TraceDeregisterExA(uint, uint);
uint TraceGetConsoleA(uint, HANDLE*);
uint TracePrintfA(uint, const(char)*);
uint TracePrintfExA(uint, uint, const(char)*);
uint TraceVprintfExA(uint, uint, const(char)*, byte*);
uint TracePutsExA(uint, uint, const(char)*);
uint TraceDumpExA(uint, uint, ubyte*, uint, uint, BOOL, const(char)*);
uint TraceRegisterExW(const(wchar)*, uint);
uint TraceDeregisterW(uint);
uint TraceDeregisterExW(uint, uint);
uint TraceGetConsoleW(uint, HANDLE*);
uint TracePrintfW(uint, const(wchar)*);
uint TracePrintfExW(uint, uint, const(wchar)*);
uint TraceVprintfExW(uint, uint, const(wchar)*, byte*);
uint TracePutsExW(uint, uint, const(wchar)*);
uint TraceDumpExW(uint, uint, ubyte*, uint, uint, BOOL, const(wchar)*);
void LogErrorA(uint, uint, PSTR*, uint);
void LogEventA(uint, uint, uint, PSTR*);
void LogErrorW(uint, uint, PWSTR*, uint);
void LogEventW(uint, uint, uint, PWSTR*);
HANDLE RouterLogRegisterA(const(char)*);
void RouterLogDeregisterA(HANDLE);
void RouterLogEventA(HANDLE, uint, uint, uint, PSTR*, uint);
void RouterLogEventDataA(HANDLE, uint, uint, uint, PSTR*, uint, ubyte*);
void RouterLogEventStringA(HANDLE, uint, uint, uint, PSTR*, uint, uint);
void RouterLogEventExA(HANDLE, uint, uint, uint, const(char)*);
void RouterLogEventValistExA(HANDLE, uint, uint, uint, const(char)*, byte*);
uint RouterGetErrorStringA(uint, PSTR*);
HANDLE RouterLogRegisterW(const(wchar)*);
void RouterLogDeregisterW(HANDLE);
void RouterLogEventW(HANDLE, uint, uint, uint, PWSTR*, uint);
void RouterLogEventDataW(HANDLE, uint, uint, uint, PWSTR*, uint, ubyte*);
void RouterLogEventStringW(HANDLE, uint, uint, uint, PWSTR*, uint, uint);
void RouterLogEventExW(HANDLE, uint, uint, uint, const(wchar)*);
void RouterLogEventValistExW(HANDLE, uint, uint, uint, const(wchar)*, byte*);
uint RouterGetErrorStringW(uint, PWSTR*);
void RouterAssert(PSTR, PSTR, uint, PSTR);
uint MprSetupProtocolEnum(uint, ubyte**, uint*);
uint MprSetupProtocolFree(void*);
enum NERR_BASE = 0x00000834;
enum NERR_PasswordExpired = 0x000008c2;
enum CNLEN = 0x0000000f;
enum LM20_CNLEN = 0x0000000f;
enum DNLEN = 0x0000000f;
enum LM20_DNLEN = 0x0000000f;
enum UNCLEN = 0x00000011;
enum LM20_UNCLEN = 0x00000011;
enum LM20_NNLEN = 0x0000000c;
enum SNLEN = 0x00000050;
enum LM20_SNLEN = 0x0000000f;
enum STXTLEN = 0x00000100;
enum LM20_STXTLEN = 0x0000003f;
enum PATHLEN = 0x00000100;
enum LM20_PATHLEN = 0x00000100;
enum DEVLEN = 0x00000050;
enum LM20_DEVLEN = 0x00000008;
enum EVLEN = 0x00000010;
enum UNLEN = 0x00000100;
enum LM20_UNLEN = 0x00000014;
enum GNLEN = 0x00000100;
enum LM20_GNLEN = 0x00000014;
enum PWLEN = 0x00000100;
enum LM20_PWLEN = 0x0000000e;
enum SHPWLEN = 0x00000008;
enum CLTYPE_LEN = 0x0000000c;
enum MAXCOMMENTSZ = 0x00000100;
enum LM20_MAXCOMMENTSZ = 0x00000030;
enum QNLEN = 0x00000050;
enum LM20_QNLEN = 0x0000000c;
enum ALERTSZ = 0x00000080;
enum NETBIOS_NAME_LEN = 0x00000010;
enum MAX_PREFERRED_LENGTH = 0xffffffff;
enum CRYPT_KEY_LEN = 0x00000007;
enum CRYPT_TXT_LEN = 0x00000008;
enum ENCRYPTED_PWLEN = 0x00000010;
enum SESSION_PWLEN = 0x00000018;
enum SESSION_CRYPT_KLEN = 0x00000015;
enum PARMNUM_ALL = 0x00000000;
enum PARM_ERROR_UNKNOWN = 0xffffffff;
enum PARM_ERROR_NONE = 0x00000000;
enum PARMNUM_BASE_INFOLEVEL = 0x000003e8;
enum MESSAGE_FILENAME = "NETMSG";
enum OS2MSG_FILENAME = "BASE";
enum HELP_MSG_FILENAME = "NETH";
enum BACKUP_MSG_FILENAME = "BAK.MSG";
enum PLATFORM_ID_DOS = 0x0000012c;
enum PLATFORM_ID_OS2 = 0x00000190;
enum PLATFORM_ID_NT = 0x000001f4;
enum PLATFORM_ID_OSF = 0x00000258;
enum PLATFORM_ID_VMS = 0x000002bc;
enum MIN_LANMAN_MESSAGE_ID = 0x00000834;
enum MAX_LANMAN_MESSAGE_ID = 0x0000170b;
enum NERR_Success = 0x00000000;
enum NERR_NetNotStarted = 0x00000836;
enum NERR_UnknownServer = 0x00000837;
enum NERR_ShareMem = 0x00000838;
enum NERR_NoNetworkResource = 0x00000839;
enum NERR_RemoteOnly = 0x0000083a;
enum NERR_DevNotRedirected = 0x0000083b;
enum NERR_ServerNotStarted = 0x00000842;
enum NERR_ItemNotFound = 0x00000843;
enum NERR_UnknownDevDir = 0x00000844;
enum NERR_RedirectedPath = 0x00000845;
enum NERR_DuplicateShare = 0x00000846;
enum NERR_NoRoom = 0x00000847;
enum NERR_TooManyItems = 0x00000849;
enum NERR_InvalidMaxUsers = 0x0000084a;
enum NERR_BufTooSmall = 0x0000084b;
enum NERR_RemoteErr = 0x0000084f;
enum NERR_LanmanIniError = 0x00000853;
enum NERR_NetworkError = 0x00000858;
enum NERR_WkstaInconsistentState = 0x00000859;
enum NERR_WkstaNotStarted = 0x0000085a;
enum NERR_BrowserNotStarted = 0x0000085b;
enum NERR_InternalError = 0x0000085c;
enum NERR_BadTransactConfig = 0x0000085d;
enum NERR_InvalidAPI = 0x0000085e;
enum NERR_BadEventName = 0x0000085f;
enum NERR_DupNameReboot = 0x00000860;
enum NERR_CfgCompNotFound = 0x00000862;
enum NERR_CfgParamNotFound = 0x00000863;
enum NERR_LineTooLong = 0x00000865;
enum NERR_QNotFound = 0x00000866;
enum NERR_JobNotFound = 0x00000867;
enum NERR_DestNotFound = 0x00000868;
enum NERR_DestExists = 0x00000869;
enum NERR_QExists = 0x0000086a;
enum NERR_QNoRoom = 0x0000086b;
enum NERR_JobNoRoom = 0x0000086c;
enum NERR_DestNoRoom = 0x0000086d;
enum NERR_DestIdle = 0x0000086e;
enum NERR_DestInvalidOp = 0x0000086f;
enum NERR_ProcNoRespond = 0x00000870;
enum NERR_SpoolerNotLoaded = 0x00000871;
enum NERR_DestInvalidState = 0x00000872;
enum NERR_QInvalidState = 0x00000873;
enum NERR_JobInvalidState = 0x00000874;
enum NERR_SpoolNoMemory = 0x00000875;
enum NERR_DriverNotFound = 0x00000876;
enum NERR_DataTypeInvalid = 0x00000877;
enum NERR_ProcNotFound = 0x00000878;
enum NERR_ServiceTableLocked = 0x00000884;
enum NERR_ServiceTableFull = 0x00000885;
enum NERR_ServiceInstalled = 0x00000886;
enum NERR_ServiceEntryLocked = 0x00000887;
enum NERR_ServiceNotInstalled = 0x00000888;
enum NERR_BadServiceName = 0x00000889;
enum NERR_ServiceCtlTimeout = 0x0000088a;
enum NERR_ServiceCtlBusy = 0x0000088b;
enum NERR_BadServiceProgName = 0x0000088c;
enum NERR_ServiceNotCtrl = 0x0000088d;
enum NERR_ServiceKillProc = 0x0000088e;
enum NERR_ServiceCtlNotValid = 0x0000088f;
enum NERR_NotInDispatchTbl = 0x00000890;
enum NERR_BadControlRecv = 0x00000891;
enum NERR_ServiceNotStarting = 0x00000892;
enum NERR_AlreadyLoggedOn = 0x00000898;
enum NERR_NotLoggedOn = 0x00000899;
enum NERR_BadUsername = 0x0000089a;
enum NERR_BadPassword = 0x0000089b;
enum NERR_UnableToAddName_W = 0x0000089c;
enum NERR_UnableToAddName_F = 0x0000089d;
enum NERR_UnableToDelName_W = 0x0000089e;
enum NERR_UnableToDelName_F = 0x0000089f;
enum NERR_LogonsPaused = 0x000008a1;
enum NERR_LogonServerConflict = 0x000008a2;
enum NERR_LogonNoUserPath = 0x000008a3;
enum NERR_LogonScriptError = 0x000008a4;
enum NERR_StandaloneLogon = 0x000008a6;
enum NERR_LogonServerNotFound = 0x000008a7;
enum NERR_LogonDomainExists = 0x000008a8;
enum NERR_NonValidatedLogon = 0x000008a9;
enum NERR_ACFNotFound = 0x000008ab;
enum NERR_GroupNotFound = 0x000008ac;
enum NERR_UserNotFound = 0x000008ad;
enum NERR_ResourceNotFound = 0x000008ae;
enum NERR_GroupExists = 0x000008af;
enum NERR_UserExists = 0x000008b0;
enum NERR_ResourceExists = 0x000008b1;
enum NERR_NotPrimary = 0x000008b2;
enum NERR_ACFNotLoaded = 0x000008b3;
enum NERR_ACFNoRoom = 0x000008b4;
enum NERR_ACFFileIOFail = 0x000008b5;
enum NERR_ACFTooManyLists = 0x000008b6;
enum NERR_UserLogon = 0x000008b7;
enum NERR_ACFNoParent = 0x000008b8;
enum NERR_CanNotGrowSegment = 0x000008b9;
enum NERR_SpeGroupOp = 0x000008ba;
enum NERR_NotInCache = 0x000008bb;
enum NERR_UserInGroup = 0x000008bc;
enum NERR_UserNotInGroup = 0x000008bd;
enum NERR_AccountUndefined = 0x000008be;
enum NERR_AccountExpired = 0x000008bf;
enum NERR_InvalidWorkstation = 0x000008c0;
enum NERR_InvalidLogonHours = 0x000008c1;
enum NERR_PasswordCantChange = 0x000008c3;
enum NERR_PasswordHistConflict = 0x000008c4;
enum NERR_PasswordTooShort = 0x000008c5;
enum NERR_PasswordTooRecent = 0x000008c6;
enum NERR_InvalidDatabase = 0x000008c7;
enum NERR_DatabaseUpToDate = 0x000008c8;
enum NERR_SyncRequired = 0x000008c9;
enum NERR_UseNotFound = 0x000008ca;
enum NERR_BadAsgType = 0x000008cb;
enum NERR_DeviceIsShared = 0x000008cc;
enum NERR_SameAsComputerName = 0x000008cd;
enum NERR_NoComputerName = 0x000008de;
enum NERR_MsgAlreadyStarted = 0x000008df;
enum NERR_MsgInitFailed = 0x000008e0;
enum NERR_NameNotFound = 0x000008e1;
enum NERR_AlreadyForwarded = 0x000008e2;
enum NERR_AddForwarded = 0x000008e3;
enum NERR_AlreadyExists = 0x000008e4;
enum NERR_TooManyNames = 0x000008e5;
enum NERR_DelComputerName = 0x000008e6;
enum NERR_LocalForward = 0x000008e7;
enum NERR_GrpMsgProcessor = 0x000008e8;
enum NERR_PausedRemote = 0x000008e9;
enum NERR_BadReceive = 0x000008ea;
enum NERR_NameInUse = 0x000008eb;
enum NERR_MsgNotStarted = 0x000008ec;
enum NERR_NotLocalName = 0x000008ed;
enum NERR_NoForwardName = 0x000008ee;
enum NERR_RemoteFull = 0x000008ef;
enum NERR_NameNotForwarded = 0x000008f0;
enum NERR_TruncatedBroadcast = 0x000008f1;
enum NERR_InvalidDevice = 0x000008f6;
enum NERR_WriteFault = 0x000008f7;
enum NERR_DuplicateName = 0x000008f9;
enum NERR_DeleteLater = 0x000008fa;
enum NERR_IncompleteDel = 0x000008fb;
enum NERR_MultipleNets = 0x000008fc;
enum NERR_NetNameNotFound = 0x00000906;
enum NERR_DeviceNotShared = 0x00000907;
enum NERR_ClientNameNotFound = 0x00000908;
enum NERR_FileIdNotFound = 0x0000090a;
enum NERR_ExecFailure = 0x0000090b;
enum NERR_TmpFile = 0x0000090c;
enum NERR_TooMuchData = 0x0000090d;
enum NERR_DeviceShareConflict = 0x0000090e;
enum NERR_BrowserTableIncomplete = 0x0000090f;
enum NERR_NotLocalDomain = 0x00000910;
enum NERR_IsDfsShare = 0x00000911;
enum NERR_DevInvalidOpCode = 0x0000091b;
enum NERR_DevNotFound = 0x0000091c;
enum NERR_DevNotOpen = 0x0000091d;
enum NERR_BadQueueDevString = 0x0000091e;
enum NERR_BadQueuePriority = 0x0000091f;
enum NERR_NoCommDevs = 0x00000921;
enum NERR_QueueNotFound = 0x00000922;
enum NERR_BadDevString = 0x00000924;
enum NERR_BadDev = 0x00000925;
enum NERR_InUseBySpooler = 0x00000926;
enum NERR_CommDevInUse = 0x00000927;
enum NERR_InvalidComputer = 0x0000092f;
enum NERR_MaxLenExceeded = 0x00000932;
enum NERR_BadComponent = 0x00000934;
enum NERR_CantType = 0x00000935;
enum NERR_TooManyEntries = 0x0000093a;
enum NERR_ProfileFileTooBig = 0x00000942;
enum NERR_ProfileOffset = 0x00000943;
enum NERR_ProfileCleanup = 0x00000944;
enum NERR_ProfileUnknownCmd = 0x00000945;
enum NERR_ProfileLoadErr = 0x00000946;
enum NERR_ProfileSaveErr = 0x00000947;
enum NERR_LogOverflow = 0x00000949;
enum NERR_LogFileChanged = 0x0000094a;
enum NERR_LogFileCorrupt = 0x0000094b;
enum NERR_SourceIsDir = 0x0000094c;
enum NERR_BadSource = 0x0000094d;
enum NERR_BadDest = 0x0000094e;
enum NERR_DifferentServers = 0x0000094f;
enum NERR_RunSrvPaused = 0x00000951;
enum NERR_ErrCommRunSrv = 0x00000955;
enum NERR_ErrorExecingGhost = 0x00000957;
enum NERR_ShareNotFound = 0x00000958;
enum NERR_InvalidLana = 0x00000960;
enum NERR_OpenFiles = 0x00000961;
enum NERR_ActiveConns = 0x00000962;
enum NERR_BadPasswordCore = 0x00000963;
enum NERR_DevInUse = 0x00000964;
enum NERR_LocalDrive = 0x00000965;
enum NERR_AlertExists = 0x0000097e;
enum NERR_TooManyAlerts = 0x0000097f;
enum NERR_NoSuchAlert = 0x00000980;
enum NERR_BadRecipient = 0x00000981;
enum NERR_AcctLimitExceeded = 0x00000982;
enum NERR_InvalidLogSeek = 0x00000988;
enum NERR_BadUasConfig = 0x00000992;
enum NERR_InvalidUASOp = 0x00000993;
enum NERR_LastAdmin = 0x00000994;
enum NERR_DCNotFound = 0x00000995;
enum NERR_LogonTrackingError = 0x00000996;
enum NERR_NetlogonNotStarted = 0x00000997;
enum NERR_CanNotGrowUASFile = 0x00000998;
enum NERR_TimeDiffAtDC = 0x00000999;
enum NERR_PasswordMismatch = 0x0000099a;
enum NERR_NoSuchServer = 0x0000099c;
enum NERR_NoSuchSession = 0x0000099d;
enum NERR_NoSuchConnection = 0x0000099e;
enum NERR_TooManyServers = 0x0000099f;
enum NERR_TooManySessions = 0x000009a0;
enum NERR_TooManyConnections = 0x000009a1;
enum NERR_TooManyFiles = 0x000009a2;
enum NERR_NoAlternateServers = 0x000009a3;
enum NERR_TryDownLevel = 0x000009a6;
enum NERR_UPSDriverNotStarted = 0x000009b0;
enum NERR_UPSInvalidConfig = 0x000009b1;
enum NERR_UPSInvalidCommPort = 0x000009b2;
enum NERR_UPSSignalAsserted = 0x000009b3;
enum NERR_UPSShutdownFailed = 0x000009b4;
enum NERR_BadDosRetCode = 0x000009c4;
enum NERR_ProgNeedsExtraMem = 0x000009c5;
enum NERR_BadDosFunction = 0x000009c6;
enum NERR_RemoteBootFailed = 0x000009c7;
enum NERR_BadFileCheckSum = 0x000009c8;
enum NERR_NoRplBootSystem = 0x000009c9;
enum NERR_RplLoadrNetBiosErr = 0x000009ca;
enum NERR_RplLoadrDiskErr = 0x000009cb;
enum NERR_ImageParamErr = 0x000009cc;
enum NERR_TooManyImageParams = 0x000009cd;
enum NERR_NonDosFloppyUsed = 0x000009ce;
enum NERR_RplBootRestart = 0x000009cf;
enum NERR_RplSrvrCallFailed = 0x000009d0;
enum NERR_CantConnectRplSrvr = 0x000009d1;
enum NERR_CantOpenImageFile = 0x000009d2;
enum NERR_CallingRplSrvr = 0x000009d3;
enum NERR_StartingRplBoot = 0x000009d4;
enum NERR_RplBootServiceTerm = 0x000009d5;
enum NERR_RplBootStartFailed = 0x000009d6;
enum NERR_RPL_CONNECTED = 0x000009d7;
enum NERR_BrowserConfiguredToNotRun = 0x000009f6;
enum NERR_RplNoAdaptersStarted = 0x00000a32;
enum NERR_RplBadRegistry = 0x00000a33;
enum NERR_RplBadDatabase = 0x00000a34;
enum NERR_RplRplfilesShare = 0x00000a35;
enum NERR_RplNotRplServer = 0x00000a36;
enum NERR_RplCannotEnum = 0x00000a37;
enum NERR_RplWkstaInfoCorrupted = 0x00000a38;
enum NERR_RplWkstaNotFound = 0x00000a39;
enum NERR_RplWkstaNameUnavailable = 0x00000a3a;
enum NERR_RplProfileInfoCorrupted = 0x00000a3b;
enum NERR_RplProfileNotFound = 0x00000a3c;
enum NERR_RplProfileNameUnavailable = 0x00000a3d;
enum NERR_RplProfileNotEmpty = 0x00000a3e;
enum NERR_RplConfigInfoCorrupted = 0x00000a3f;
enum NERR_RplConfigNotFound = 0x00000a40;
enum NERR_RplAdapterInfoCorrupted = 0x00000a41;
enum NERR_RplInternal = 0x00000a42;
enum NERR_RplVendorInfoCorrupted = 0x00000a43;
enum NERR_RplBootInfoCorrupted = 0x00000a44;
enum NERR_RplWkstaNeedsUserAcct = 0x00000a45;
enum NERR_RplNeedsRPLUSERAcct = 0x00000a46;
enum NERR_RplBootNotFound = 0x00000a47;
enum NERR_RplIncompatibleProfile = 0x00000a48;
enum NERR_RplAdapterNameUnavailable = 0x00000a49;
enum NERR_RplConfigNotEmpty = 0x00000a4a;
enum NERR_RplBootInUse = 0x00000a4b;
enum NERR_RplBackupDatabase = 0x00000a4c;
enum NERR_RplAdapterNotFound = 0x00000a4d;
enum NERR_RplVendorNotFound = 0x00000a4e;
enum NERR_RplVendorNameUnavailable = 0x00000a4f;
enum NERR_RplBootNameUnavailable = 0x00000a50;
enum NERR_RplConfigNameUnavailable = 0x00000a51;
enum NERR_DfsInternalCorruption = 0x00000a64;
enum NERR_DfsVolumeDataCorrupt = 0x00000a65;
enum NERR_DfsNoSuchVolume = 0x00000a66;
enum NERR_DfsVolumeAlreadyExists = 0x00000a67;
enum NERR_DfsAlreadyShared = 0x00000a68;
enum NERR_DfsNoSuchShare = 0x00000a69;
enum NERR_DfsNotALeafVolume = 0x00000a6a;
enum NERR_DfsLeafVolume = 0x00000a6b;
enum NERR_DfsVolumeHasMultipleServers = 0x00000a6c;
enum NERR_DfsCantCreateJunctionPoint = 0x00000a6d;
enum NERR_DfsServerNotDfsAware = 0x00000a6e;
enum NERR_DfsBadRenamePath = 0x00000a6f;
enum NERR_DfsVolumeIsOffline = 0x00000a70;
enum NERR_DfsNoSuchServer = 0x00000a71;
enum NERR_DfsCyclicalName = 0x00000a72;
enum NERR_DfsNotSupportedInServerDfs = 0x00000a73;
enum NERR_DfsDuplicateService = 0x00000a74;
enum NERR_DfsCantRemoveLastServerShare = 0x00000a75;
enum NERR_DfsVolumeIsInterDfs = 0x00000a76;
enum NERR_DfsInconsistent = 0x00000a77;
enum NERR_DfsServerUpgraded = 0x00000a78;
enum NERR_DfsDataIsIdentical = 0x00000a79;
enum NERR_DfsCantRemoveDfsRoot = 0x00000a7a;
enum NERR_DfsChildOrParentInDfs = 0x00000a7b;
enum NERR_DfsInternalError = 0x00000a82;
enum NERR_SetupAlreadyJoined = 0x00000a83;
enum NERR_SetupNotJoined = 0x00000a84;
enum NERR_SetupDomainController = 0x00000a85;
enum NERR_DefaultJoinRequired = 0x00000a86;
enum NERR_InvalidWorkgroupName = 0x00000a87;
enum NERR_NameUsesIncompatibleCodePage = 0x00000a88;
enum NERR_ComputerAccountNotFound = 0x00000a89;
enum NERR_PersonalSku = 0x00000a8a;
enum NERR_SetupCheckDNSConfig = 0x00000a8b;
enum NERR_AlreadyCloudDomainJoined = 0x00000a8c;
enum NERR_PasswordMustChange = 0x00000a8d;
enum NERR_AccountLockedOut = 0x00000a8e;
enum NERR_PasswordTooLong = 0x00000a8f;
enum NERR_PasswordNotComplexEnough = 0x00000a90;
enum NERR_PasswordFilterError = 0x00000a91;
enum NERR_NoOfflineJoinInfo = 0x00000a95;
enum NERR_BadOfflineJoinInfo = 0x00000a96;
enum NERR_CantCreateJoinInfo = 0x00000a97;
enum NERR_BadDomainJoinInfo = 0x00000a98;
enum NERR_JoinPerformedMustRestart = 0x00000a99;
enum NERR_NoJoinPending = 0x00000a9a;
enum NERR_ValuesNotSet = 0x00000a9b;
enum NERR_CantVerifyHostname = 0x00000a9c;
enum NERR_CantLoadOfflineHive = 0x00000a9d;
enum NERR_ConnectionInsecure = 0x00000a9e;
enum NERR_ProvisioningBlobUnsupported = 0x00000a9f;
enum NERR_DS8DCRequired = 0x00000aa0;
enum NERR_LDAPCapableDCRequired = 0x00000aa1;
enum NERR_DS8DCNotFound = 0x00000aa2;
enum NERR_TargetVersionUnsupported = 0x00000aa3;
enum NERR_InvalidMachineNameForJoin = 0x00000aa4;
enum NERR_DS9DCNotFound = 0x00000aa5;
enum NERR_PlainTextSecretsRequired = 0x00000aa6;
enum NERR_CannotUnjoinAadDomain = 0x00000aa7;
enum NERR_CannotUpdateAadHostName = 0x00000aa8;
enum NERR_DuplicateHostName = 0x00000aa9;
enum NERR_HostNameTooLong = 0x00000aaa;
enum NERR_TooManyHostNames = 0x00000aab;
enum NERR_AccountReuseBlockedByPolicy = 0x00000aac;
enum MAX_NERR = 0x00000bb7;
enum UF_TEMP_DUPLICATE_ACCOUNT = 0x00000100;
enum UF_NORMAL_ACCOUNT = 0x00000200;
enum UF_INTERDOMAIN_TRUST_ACCOUNT = 0x00000800;
enum UF_WORKSTATION_TRUST_ACCOUNT = 0x00001000;
enum UF_SERVER_TRUST_ACCOUNT = 0x00002000;
enum UF_MNS_LOGON_ACCOUNT = 0x00020000;
enum UF_NO_AUTH_DATA_REQUIRED = 0x02000000;
enum UF_PARTIAL_SECRETS_ACCOUNT = 0x04000000;
enum UF_USE_AES_KEYS = 0x08000000;
enum LG_INCLUDE_INDIRECT = 0x00000001;
enum USER_NAME_PARMNUM = 0x00000001;
enum USER_PASSWORD_PARMNUM = 0x00000003;
enum USER_PASSWORD_AGE_PARMNUM = 0x00000004;
enum USER_PRIV_PARMNUM = 0x00000005;
enum USER_HOME_DIR_PARMNUM = 0x00000006;
enum USER_COMMENT_PARMNUM = 0x00000007;
enum USER_FLAGS_PARMNUM = 0x00000008;
enum USER_SCRIPT_PATH_PARMNUM = 0x00000009;
enum USER_AUTH_FLAGS_PARMNUM = 0x0000000a;
enum USER_FULL_NAME_PARMNUM = 0x0000000b;
enum USER_USR_COMMENT_PARMNUM = 0x0000000c;
enum USER_PARMS_PARMNUM = 0x0000000d;
enum USER_WORKSTATIONS_PARMNUM = 0x0000000e;
enum USER_LAST_LOGON_PARMNUM = 0x0000000f;
enum USER_LAST_LOGOFF_PARMNUM = 0x00000010;
enum USER_ACCT_EXPIRES_PARMNUM = 0x00000011;
enum USER_MAX_STORAGE_PARMNUM = 0x00000012;
enum USER_UNITS_PER_WEEK_PARMNUM = 0x00000013;
enum USER_LOGON_HOURS_PARMNUM = 0x00000014;
enum USER_PAD_PW_COUNT_PARMNUM = 0x00000015;
enum USER_NUM_LOGONS_PARMNUM = 0x00000016;
enum USER_LOGON_SERVER_PARMNUM = 0x00000017;
enum USER_COUNTRY_CODE_PARMNUM = 0x00000018;
enum USER_CODE_PAGE_PARMNUM = 0x00000019;
enum USER_PRIMARY_GROUP_PARMNUM = 0x00000033;
enum USER_PROFILE = 0x00000034;
enum USER_PROFILE_PARMNUM = 0x00000034;
enum USER_HOME_DIR_DRIVE_PARMNUM = 0x00000035;
enum NULL_USERSETINFO_PASSWD = "              ";
enum UNITS_PER_DAY = 0x00000018;
enum USER_PRIV_MASK = 0x00000003;
enum MAX_PASSWD_LEN = 0x00000100;
enum DEF_MIN_PWLEN = 0x00000006;
enum DEF_PWUNIQUENESS = 0x00000005;
enum DEF_MAX_PWHIST = 0x00000008;
enum DEF_MAX_BADPW = 0x00000000;
enum VALIDATED_LOGON = 0x00000000;
enum PASSWORD_EXPIRED = 0x00000002;
enum NON_VALIDATED_LOGON = 0x00000003;
enum VALID_LOGOFF = 0x00000001;
enum MODALS_MIN_PASSWD_LEN_PARMNUM = 0x00000001;
enum MODALS_MAX_PASSWD_AGE_PARMNUM = 0x00000002;
enum MODALS_MIN_PASSWD_AGE_PARMNUM = 0x00000003;
enum MODALS_FORCE_LOGOFF_PARMNUM = 0x00000004;
enum MODALS_PASSWD_HIST_LEN_PARMNUM = 0x00000005;
enum MODALS_ROLE_PARMNUM = 0x00000006;
enum MODALS_PRIMARY_PARMNUM = 0x00000007;
enum MODALS_DOMAIN_NAME_PARMNUM = 0x00000008;
enum MODALS_DOMAIN_ID_PARMNUM = 0x00000009;
enum MODALS_LOCKOUT_DURATION_PARMNUM = 0x0000000a;
enum MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM = 0x0000000b;
enum MODALS_LOCKOUT_THRESHOLD_PARMNUM = 0x0000000c;
enum GROUPIDMASK = 0x00008000;
enum GROUP_SPECIALGRP_USERS = "USERS";
enum GROUP_SPECIALGRP_ADMINS = "ADMINS";
enum GROUP_SPECIALGRP_GUESTS = "GUESTS";
enum GROUP_SPECIALGRP_LOCAL = "LOCAL";
enum GROUP_ALL_PARMNUM = 0x00000000;
enum GROUP_NAME_PARMNUM = 0x00000001;
enum GROUP_COMMENT_PARMNUM = 0x00000002;
enum GROUP_ATTRIBUTES_PARMNUM = 0x00000003;
enum LOCALGROUP_NAME_PARMNUM = 0x00000001;
enum LOCALGROUP_COMMENT_PARMNUM = 0x00000002;
enum MAXPERMENTRIES = 0x00000040;
enum ACCESS_NONE = 0x00000000;
enum ACCESS_GROUP = 0x00008000;
enum ACCESS_AUDIT = 0x00000001;
enum ACCESS_SUCCESS_OPEN = 0x00000010;
enum ACCESS_SUCCESS_WRITE = 0x00000020;
enum ACCESS_SUCCESS_DELETE = 0x00000040;
enum ACCESS_SUCCESS_ACL = 0x00000080;
enum ACCESS_SUCCESS_MASK = 0x000000f0;
enum ACCESS_FAIL_OPEN = 0x00000100;
enum ACCESS_FAIL_WRITE = 0x00000200;
enum ACCESS_FAIL_DELETE = 0x00000400;
enum ACCESS_FAIL_ACL = 0x00000800;
enum ACCESS_FAIL_MASK = 0x00000f00;
enum ACCESS_FAIL_SHIFT = 0x00000004;
enum ACCESS_RESOURCE_NAME_PARMNUM = 0x00000001;
enum ACCESS_ATTR_PARMNUM = 0x00000002;
enum ACCESS_COUNT_PARMNUM = 0x00000003;
enum ACCESS_ACCESS_LIST_PARMNUM = 0x00000004;
enum ACCESS_LETTERS = "RWCXDAP         ";
enum NET_VALIDATE_PASSWORD_LAST_SET = 0x00000001;
enum NET_VALIDATE_BAD_PASSWORD_TIME = 0x00000002;
enum NET_VALIDATE_LOCKOUT_TIME = 0x00000004;
enum NET_VALIDATE_BAD_PASSWORD_COUNT = 0x00000008;
enum NET_VALIDATE_PASSWORD_HISTORY_LENGTH = 0x00000010;
enum NET_VALIDATE_PASSWORD_HISTORY = 0x00000020;
enum NETLOGON_CONTROL_QUERY = 0x00000001;
enum NETLOGON_CONTROL_REPLICATE = 0x00000002;
enum NETLOGON_CONTROL_SYNCHRONIZE = 0x00000003;
enum NETLOGON_CONTROL_PDC_REPLICATE = 0x00000004;
enum NETLOGON_CONTROL_REDISCOVER = 0x00000005;
enum NETLOGON_CONTROL_TC_QUERY = 0x00000006;
enum NETLOGON_CONTROL_TRANSPORT_NOTIFY = 0x00000007;
enum NETLOGON_CONTROL_FIND_USER = 0x00000008;
enum NETLOGON_CONTROL_CHANGE_PASSWORD = 0x00000009;
enum NETLOGON_CONTROL_TC_VERIFY = 0x0000000a;
enum NETLOGON_CONTROL_FORCE_DNS_REG = 0x0000000b;
enum NETLOGON_CONTROL_QUERY_DNS_REG = 0x0000000c;
enum NETLOGON_CONTROL_QUERY_ENC_TYPES = 0x0000000d;
enum NETLOGON_CONTROL_UNLOAD_NETLOGON_DLL = 0x0000fffb;
enum NETLOGON_CONTROL_BACKUP_CHANGE_LOG = 0x0000fffc;
enum NETLOGON_CONTROL_TRUNCATE_LOG = 0x0000fffd;
enum NETLOGON_CONTROL_SET_DBFLAG = 0x0000fffe;
enum NETLOGON_CONTROL_BREAKPOINT = 0x0000ffff;
enum NETLOGON_REPLICATION_NEEDED = 0x00000001;
enum NETLOGON_REPLICATION_IN_PROGRESS = 0x00000002;
enum NETLOGON_FULL_SYNC_REPLICATION = 0x00000004;
enum NETLOGON_REDO_NEEDED = 0x00000008;
enum NETLOGON_HAS_IP = 0x00000010;
enum NETLOGON_HAS_TIMESERV = 0x00000020;
enum NETLOGON_DNS_UPDATE_FAILURE = 0x00000040;
enum NETLOGON_VERIFY_STATUS_RETURNED = 0x00000080;
enum SERVICE_ACCOUNT_PASSWORD = "_SA_{262E99C9-6160-4871-ACEC-4E61736B6F21}";
enum SERVICE_ACCOUNT_SECRET_PREFIX = "_SC_{262E99C9-6160-4871-ACEC-4E61736B6F21}_";
enum ServiceAccountPasswordGUID = GUID(0x262e99c9, 0x6160, 0x4871, [0xac, 0xec, 0x4e, 0x61, 0x73, 0x6b, 0x6f, 0x21]);
enum SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY = 0x00000001;
enum SERVICE_ACCOUNT_FLAG_ADD_AGAINST_RODC = 0x00000002;
enum SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY = 0x00000001;
enum SERVICE_ACCOUNT_FLAG_REMOVE_OFFLINE = 0x00000002;
enum ALERTER_MAILSLOT = "\\\\.\\MAILSLOT\\Alerter";
enum ALERT_PRINT_EVENT = "PRINTING";
enum ALERT_MESSAGE_EVENT = "MESSAGE";
enum ALERT_ERRORLOG_EVENT = "ERRORLOG";
enum ALERT_ADMIN_EVENT = "ADMIN";
enum ALERT_USER_EVENT = "USER";
enum PRJOB_QSTATUS = 0x00000003;
enum PRJOB_DEVSTATUS = 0x000001fc;
enum PRJOB_COMPLETE = 0x00000004;
enum PRJOB_INTERV = 0x00000008;
enum PRJOB_ERROR = 0x00000010;
enum PRJOB_DESTOFFLINE = 0x00000020;
enum PRJOB_DESTPAUSED = 0x00000040;
enum PRJOB_NOTIFY = 0x00000080;
enum PRJOB_DESTNOPAPER = 0x00000100;
enum PRJOB_DELETED = 0x00008000;
enum PRJOB_QS_QUEUED = 0x00000000;
enum PRJOB_QS_PAUSED = 0x00000001;
enum PRJOB_QS_SPOOLING = 0x00000002;
enum PRJOB_QS_PRINTING = 0x00000003;
enum JOB_RUN_PERIODICALLY = 0x00000001;
enum JOB_EXEC_ERROR = 0x00000002;
enum JOB_RUNS_TODAY = 0x00000004;
enum JOB_ADD_CURRENT_DATE = 0x00000008;
enum JOB_NONINTERACTIVE = 0x00000010;
enum LOGFLAGS_FORWARD = 0x00000000;
enum LOGFLAGS_BACKWARD = 0x00000001;
enum LOGFLAGS_SEEK = 0x00000002;
enum ACTION_LOCKOUT = 0x00000000;
enum ACTION_ADMINUNLOCK = 0x00000001;
enum AE_SRVSTATUS = 0x00000000;
enum AE_SESSLOGON = 0x00000001;
enum AE_SESSLOGOFF = 0x00000002;
enum AE_SESSPWERR = 0x00000003;
enum AE_CONNSTART = 0x00000004;
enum AE_CONNSTOP = 0x00000005;
enum AE_CONNREJ = 0x00000006;
enum AE_RESACCESS = 0x00000007;
enum AE_RESACCESSREJ = 0x00000008;
enum AE_CLOSEFILE = 0x00000009;
enum AE_SERVICESTAT = 0x0000000b;
enum AE_ACLMOD = 0x0000000c;
enum AE_UASMOD = 0x0000000d;
enum AE_NETLOGON = 0x0000000e;
enum AE_NETLOGOFF = 0x0000000f;
enum AE_NETLOGDENIED = 0x00000010;
enum AE_ACCLIMITEXCD = 0x00000011;
enum AE_RESACCESS2 = 0x00000012;
enum AE_ACLMODFAIL = 0x00000013;
enum AE_LOCKOUT = 0x00000014;
enum AE_GENERIC_TYPE = 0x00000015;
enum AE_SRVSTART = 0x00000000;
enum AE_SRVPAUSED = 0x00000001;
enum AE_SRVCONT = 0x00000002;
enum AE_SRVSTOP = 0x00000003;
enum AE_GUEST = 0x00000000;
enum AE_USER = 0x00000001;
enum AE_ADMIN = 0x00000002;
enum AE_NORMAL = 0x00000000;
enum AE_USERLIMIT = 0x00000000;
enum AE_GENERAL = 0x00000000;
enum AE_ERROR = 0x00000001;
enum AE_SESSDIS = 0x00000001;
enum AE_BADPW = 0x00000001;
enum AE_AUTODIS = 0x00000002;
enum AE_UNSHARE = 0x00000002;
enum AE_ADMINPRIVREQD = 0x00000002;
enum AE_ADMINDIS = 0x00000003;
enum AE_NOACCESSPERM = 0x00000003;
enum AE_ACCRESTRICT = 0x00000004;
enum AE_NORMAL_CLOSE = 0x00000000;
enum AE_SES_CLOSE = 0x00000001;
enum AE_ADMIN_CLOSE = 0x00000002;
enum AE_LIM_UNKNOWN = 0x00000000;
enum AE_LIM_LOGONHOURS = 0x00000001;
enum AE_LIM_EXPIRED = 0x00000002;
enum AE_LIM_INVAL_WKSTA = 0x00000003;
enum AE_LIM_DISABLED = 0x00000004;
enum AE_LIM_DELETED = 0x00000005;
enum AE_MOD = 0x00000000;
enum AE_DELETE = 0x00000001;
enum AE_ADD = 0x00000002;
enum AE_UAS_USER = 0x00000000;
enum AE_UAS_GROUP = 0x00000001;
enum AE_UAS_MODALS = 0x00000002;
enum SVAUD_SERVICE = 0x00000001;
enum SVAUD_GOODSESSLOGON = 0x00000006;
enum SVAUD_BADSESSLOGON = 0x00000018;
enum SVAUD_GOODNETLOGON = 0x00000060;
enum SVAUD_BADNETLOGON = 0x00000180;
enum SVAUD_GOODUSE = 0x00000600;
enum SVAUD_BADUSE = 0x00001800;
enum SVAUD_USERLIST = 0x00002000;
enum SVAUD_PERMISSIONS = 0x00004000;
enum SVAUD_RESOURCE = 0x00008000;
enum SVAUD_LOGONLIM = 0x00010000;
enum AA_AUDIT_ALL = 0x00000001;
enum AA_A_OWNER = 0x00000004;
enum AA_CLOSE = 0x00000008;
enum AA_S_OPEN = 0x00000010;
enum AA_S_WRITE = 0x00000020;
enum AA_S_CREATE = 0x00000020;
enum AA_S_DELETE = 0x00000040;
enum AA_S_ACL = 0x00000080;
enum AA_F_OPEN = 0x00000100;
enum AA_F_WRITE = 0x00000200;
enum AA_F_CREATE = 0x00000200;
enum AA_F_DELETE = 0x00000400;
enum AA_F_ACL = 0x00000800;
enum AA_A_OPEN = 0x00001000;
enum AA_A_WRITE = 0x00002000;
enum AA_A_CREATE = 0x00002000;
enum AA_A_DELETE = 0x00004000;
enum AA_A_ACL = 0x00008000;
enum ERRLOG_BASE = 0x00000c1c;
enum NELOG_Internal_Error = 0x00000c1c;
enum NELOG_Resource_Shortage = 0x00000c1d;
enum NELOG_Unable_To_Lock_Segment = 0x00000c1e;
enum NELOG_Unable_To_Unlock_Segment = 0x00000c1f;
enum NELOG_Uninstall_Service = 0x00000c20;
enum NELOG_Init_Exec_Fail = 0x00000c21;
enum NELOG_Ncb_Error = 0x00000c22;
enum NELOG_Net_Not_Started = 0x00000c23;
enum NELOG_Ioctl_Error = 0x00000c24;
enum NELOG_System_Semaphore = 0x00000c25;
enum NELOG_Init_OpenCreate_Err = 0x00000c26;
enum NELOG_NetBios = 0x00000c27;
enum NELOG_SMB_Illegal = 0x00000c28;
enum NELOG_Service_Fail = 0x00000c29;
enum NELOG_Entries_Lost = 0x00000c2a;
enum NELOG_Init_Seg_Overflow = 0x00000c30;
enum NELOG_Srv_No_Mem_Grow = 0x00000c31;
enum NELOG_Access_File_Bad = 0x00000c32;
enum NELOG_Srvnet_Not_Started = 0x00000c33;
enum NELOG_Init_Chardev_Err = 0x00000c34;
enum NELOG_Remote_API = 0x00000c35;
enum NELOG_Ncb_TooManyErr = 0x00000c36;
enum NELOG_Mailslot_err = 0x00000c37;
enum NELOG_ReleaseMem_Alert = 0x00000c38;
enum NELOG_AT_cannot_write = 0x00000c39;
enum NELOG_Cant_Make_Msg_File = 0x00000c3a;
enum NELOG_Exec_Netservr_NoMem = 0x00000c3b;
enum NELOG_Server_Lock_Failure = 0x00000c3c;
enum NELOG_Msg_Shutdown = 0x00000c44;
enum NELOG_Msg_Sem_Shutdown = 0x00000c45;
enum NELOG_Msg_Log_Err = 0x00000c4e;
enum NELOG_VIO_POPUP_ERR = 0x00000c4f;
enum NELOG_Msg_Unexpected_SMB_Type = 0x00000c50;
enum NELOG_Wksta_Infoseg = 0x00000c58;
enum NELOG_Wksta_Compname = 0x00000c59;
enum NELOG_Wksta_BiosThreadFailure = 0x00000c5a;
enum NELOG_Wksta_IniSeg = 0x00000c5b;
enum NELOG_Wksta_HostTab_Full = 0x00000c5c;
enum NELOG_Wksta_Bad_Mailslot_SMB = 0x00000c5d;
enum NELOG_Wksta_UASInit = 0x00000c5e;
enum NELOG_Wksta_SSIRelogon = 0x00000c5f;
enum NELOG_Build_Name = 0x00000c62;
enum NELOG_Name_Expansion = 0x00000c63;
enum NELOG_Message_Send = 0x00000c64;
enum NELOG_Mail_Slt_Err = 0x00000c65;
enum NELOG_AT_cannot_read = 0x00000c66;
enum NELOG_AT_sched_err = 0x00000c67;
enum NELOG_AT_schedule_file_created = 0x00000c68;
enum NELOG_Srvnet_NB_Open = 0x00000c69;
enum NELOG_AT_Exec_Err = 0x00000c6a;
enum NELOG_Lazy_Write_Err = 0x00000c6c;
enum NELOG_HotFix = 0x00000c6d;
enum NELOG_HardErr_From_Server = 0x00000c6e;
enum NELOG_LocalSecFail1 = 0x00000c6f;
enum NELOG_LocalSecFail2 = 0x00000c70;
enum NELOG_LocalSecFail3 = 0x00000c71;
enum NELOG_LocalSecGeneralFail = 0x00000c72;
enum NELOG_NetWkSta_Internal_Error = 0x00000c76;
enum NELOG_NetWkSta_No_Resource = 0x00000c77;
enum NELOG_NetWkSta_SMB_Err = 0x00000c78;
enum NELOG_NetWkSta_VC_Err = 0x00000c79;
enum NELOG_NetWkSta_Stuck_VC_Err = 0x00000c7a;
enum NELOG_NetWkSta_NCB_Err = 0x00000c7b;
enum NELOG_NetWkSta_Write_Behind_Err = 0x00000c7c;
enum NELOG_NetWkSta_Reset_Err = 0x00000c7d;
enum NELOG_NetWkSta_Too_Many = 0x00000c7e;
enum NELOG_Srv_Thread_Failure = 0x00000c84;
enum NELOG_Srv_Close_Failure = 0x00000c85;
enum NELOG_ReplUserCurDir = 0x00000c86;
enum NELOG_ReplCannotMasterDir = 0x00000c87;
enum NELOG_ReplUpdateError = 0x00000c88;
enum NELOG_ReplLostMaster = 0x00000c89;
enum NELOG_NetlogonAuthDCFail = 0x00000c8a;
enum NELOG_ReplLogonFailed = 0x00000c8b;
enum NELOG_ReplNetErr = 0x00000c8c;
enum NELOG_ReplMaxFiles = 0x00000c8d;
enum NELOG_ReplMaxTreeDepth = 0x00000c8e;
enum NELOG_ReplBadMsg = 0x00000c8f;
enum NELOG_ReplSysErr = 0x00000c90;
enum NELOG_ReplUserLoged = 0x00000c91;
enum NELOG_ReplBadImport = 0x00000c92;
enum NELOG_ReplBadExport = 0x00000c93;
enum NELOG_ReplSignalFileErr = 0x00000c94;
enum NELOG_DiskFT = 0x00000c95;
enum NELOG_ReplAccessDenied = 0x00000c96;
enum NELOG_NetlogonFailedPrimary = 0x00000c97;
enum NELOG_NetlogonPasswdSetFailed = 0x00000c98;
enum NELOG_NetlogonTrackingError = 0x00000c99;
enum NELOG_NetlogonSyncError = 0x00000c9a;
enum NELOG_NetlogonRequireSignOrSealError = 0x00000c9b;
enum NELOG_UPS_PowerOut = 0x00000c9e;
enum NELOG_UPS_Shutdown = 0x00000c9f;
enum NELOG_UPS_CmdFileError = 0x00000ca0;
enum NELOG_UPS_CannotOpenDriver = 0x00000ca1;
enum NELOG_UPS_PowerBack = 0x00000ca2;
enum NELOG_UPS_CmdFileConfig = 0x00000ca3;
enum NELOG_UPS_CmdFileExec = 0x00000ca4;
enum NELOG_Missing_Parameter = 0x00000cb2;
enum NELOG_Invalid_Config_Line = 0x00000cb3;
enum NELOG_Invalid_Config_File = 0x00000cb4;
enum NELOG_File_Changed = 0x00000cb5;
enum NELOG_Files_Dont_Fit = 0x00000cb6;
enum NELOG_Wrong_DLL_Version = 0x00000cb7;
enum NELOG_Error_in_DLL = 0x00000cb8;
enum NELOG_System_Error = 0x00000cb9;
enum NELOG_FT_ErrLog_Too_Large = 0x00000cba;
enum NELOG_FT_Update_In_Progress = 0x00000cbb;
enum NELOG_Joined_Domain = 0x00000cbc;
enum NELOG_Joined_Workgroup = 0x00000cbd;
enum NELOG_OEM_Code = 0x00000ce3;
enum ERRLOG2_BASE = 0x00001644;
enum NELOG_NetlogonSSIInitError = 0x00001644;
enum NELOG_NetlogonFailedToUpdateTrustList = 0x00001645;
enum NELOG_NetlogonFailedToAddRpcInterface = 0x00001646;
enum NELOG_NetlogonFailedToReadMailslot = 0x00001647;
enum NELOG_NetlogonFailedToRegisterSC = 0x00001648;
enum NELOG_NetlogonChangeLogCorrupt = 0x00001649;
enum NELOG_NetlogonFailedToCreateShare = 0x0000164a;
enum NELOG_NetlogonDownLevelLogonFailed = 0x0000164b;
enum NELOG_NetlogonDownLevelLogoffFailed = 0x0000164c;
enum NELOG_NetlogonNTLogonFailed = 0x0000164d;
enum NELOG_NetlogonNTLogoffFailed = 0x0000164e;
enum NELOG_NetlogonPartialSyncCallSuccess = 0x0000164f;
enum NELOG_NetlogonPartialSyncCallFailed = 0x00001650;
enum NELOG_NetlogonFullSyncCallSuccess = 0x00001651;
enum NELOG_NetlogonFullSyncCallFailed = 0x00001652;
enum NELOG_NetlogonPartialSyncSuccess = 0x00001653;
enum NELOG_NetlogonPartialSyncFailed = 0x00001654;
enum NELOG_NetlogonFullSyncSuccess = 0x00001655;
enum NELOG_NetlogonFullSyncFailed = 0x00001656;
enum NELOG_NetlogonAuthNoDomainController = 0x00001657;
enum NELOG_NetlogonAuthNoTrustLsaSecret = 0x00001658;
enum NELOG_NetlogonAuthNoTrustSamAccount = 0x00001659;
enum NELOG_NetlogonServerAuthFailed = 0x0000165a;
enum NELOG_NetlogonServerAuthNoTrustSamAccount = 0x0000165b;
enum NELOG_FailedToRegisterSC = 0x0000165c;
enum NELOG_FailedToSetServiceStatus = 0x0000165d;
enum NELOG_FailedToGetComputerName = 0x0000165e;
enum NELOG_DriverNotLoaded = 0x0000165f;
enum NELOG_NoTranportLoaded = 0x00001660;
enum NELOG_NetlogonFailedDomainDelta = 0x00001661;
enum NELOG_NetlogonFailedGlobalGroupDelta = 0x00001662;
enum NELOG_NetlogonFailedLocalGroupDelta = 0x00001663;
enum NELOG_NetlogonFailedUserDelta = 0x00001664;
enum NELOG_NetlogonFailedPolicyDelta = 0x00001665;
enum NELOG_NetlogonFailedTrustedDomainDelta = 0x00001666;
enum NELOG_NetlogonFailedAccountDelta = 0x00001667;
enum NELOG_NetlogonFailedSecretDelta = 0x00001668;
enum NELOG_NetlogonSystemError = 0x00001669;
enum NELOG_NetlogonDuplicateMachineAccounts = 0x0000166a;
enum NELOG_NetlogonTooManyGlobalGroups = 0x0000166b;
enum NELOG_NetlogonBrowserDriver = 0x0000166c;
enum NELOG_NetlogonAddNameFailure = 0x0000166d;
enum NELOG_RplMessages = 0x0000166e;
enum NELOG_RplXnsBoot = 0x0000166f;
enum NELOG_RplSystem = 0x00001670;
enum NELOG_RplWkstaTimeout = 0x00001671;
enum NELOG_RplWkstaFileOpen = 0x00001672;
enum NELOG_RplWkstaFileRead = 0x00001673;
enum NELOG_RplWkstaMemory = 0x00001674;
enum NELOG_RplWkstaFileChecksum = 0x00001675;
enum NELOG_RplWkstaFileLineCount = 0x00001676;
enum NELOG_RplWkstaBbcFile = 0x00001677;
enum NELOG_RplWkstaFileSize = 0x00001678;
enum NELOG_RplWkstaInternal = 0x00001679;
enum NELOG_RplWkstaWrongVersion = 0x0000167a;
enum NELOG_RplWkstaNetwork = 0x0000167b;
enum NELOG_RplAdapterResource = 0x0000167c;
enum NELOG_RplFileCopy = 0x0000167d;
enum NELOG_RplFileDelete = 0x0000167e;
enum NELOG_RplFilePerms = 0x0000167f;
enum NELOG_RplCheckConfigs = 0x00001680;
enum NELOG_RplCreateProfiles = 0x00001681;
enum NELOG_RplRegistry = 0x00001682;
enum NELOG_RplReplaceRPLDISK = 0x00001683;
enum NELOG_RplCheckSecurity = 0x00001684;
enum NELOG_RplBackupDatabase = 0x00001685;
enum NELOG_RplInitDatabase = 0x00001686;
enum NELOG_RplRestoreDatabaseFailure = 0x00001687;
enum NELOG_RplRestoreDatabaseSuccess = 0x00001688;
enum NELOG_RplInitRestoredDatabase = 0x00001689;
enum NELOG_NetlogonSessionTypeWrong = 0x0000168a;
enum NELOG_RplUpgradeDBTo40 = 0x0000168b;
enum NELOG_NetlogonLanmanBdcsNotAllowed = 0x0000168c;
enum NELOG_NetlogonNoDynamicDns = 0x0000168d;
enum NELOG_NetlogonDynamicDnsRegisterFailure = 0x0000168e;
enum NELOG_NetlogonDynamicDnsDeregisterFailure = 0x0000168f;
enum NELOG_NetlogonFailedFileCreate = 0x00001690;
enum NELOG_NetlogonGetSubnetToSite = 0x00001691;
enum NELOG_NetlogonNoSiteForClient = 0x00001692;
enum NELOG_NetlogonBadSiteName = 0x00001693;
enum NELOG_NetlogonBadSubnetName = 0x00001694;
enum NELOG_NetlogonDynamicDnsServerFailure = 0x00001695;
enum NELOG_NetlogonDynamicDnsFailure = 0x00001696;
enum NELOG_NetlogonRpcCallCancelled = 0x00001697;
enum NELOG_NetlogonDcSiteCovered = 0x00001698;
enum NELOG_NetlogonDcSiteNotCovered = 0x00001699;
enum NELOG_NetlogonGcSiteCovered = 0x0000169a;
enum NELOG_NetlogonGcSiteNotCovered = 0x0000169b;
enum NELOG_NetlogonFailedSpnUpdate = 0x0000169c;
enum NELOG_NetlogonFailedDnsHostNameUpdate = 0x0000169d;
enum NELOG_NetlogonAuthNoUplevelDomainController = 0x0000169e;
enum NELOG_NetlogonAuthDomainDowngraded = 0x0000169f;
enum NELOG_NetlogonNdncSiteCovered = 0x000016a0;
enum NELOG_NetlogonNdncSiteNotCovered = 0x000016a1;
enum NELOG_NetlogonDcOldSiteCovered = 0x000016a2;
enum NELOG_NetlogonDcSiteNotCoveredAuto = 0x000016a3;
enum NELOG_NetlogonGcOldSiteCovered = 0x000016a4;
enum NELOG_NetlogonGcSiteNotCoveredAuto = 0x000016a5;
enum NELOG_NetlogonNdncOldSiteCovered = 0x000016a6;
enum NELOG_NetlogonNdncSiteNotCoveredAuto = 0x000016a7;
enum NELOG_NetlogonSpnMultipleSamAccountNames = 0x000016a8;
enum NELOG_NetlogonSpnCrackNamesFailure = 0x000016a9;
enum NELOG_NetlogonNoAddressToSiteMapping = 0x000016aa;
enum NELOG_NetlogonInvalidGenericParameterValue = 0x000016ab;
enum NELOG_NetlogonInvalidDwordParameterValue = 0x000016ac;
enum NELOG_NetlogonServerAuthFailedNoAccount = 0x000016ad;
enum NELOG_NetlogonNoDynamicDnsManual = 0x000016ae;
enum NELOG_NetlogonNoSiteForClients = 0x000016af;
enum NELOG_NetlogonDnsDeregAborted = 0x000016b0;
enum NELOG_NetlogonRpcPortRequestFailure = 0x000016b1;
enum NELOG_NetlogonPartialSiteMappingForClients = 0x000016b2;
enum NELOG_NetlogonRemoteDynamicDnsRegisterFailure = 0x000016b3;
enum NELOG_NetlogonRemoteDynamicDnsDeregisterFailure = 0x000016b4;
enum NELOG_NetlogonRejectedRemoteDynamicDnsRegister = 0x000016b5;
enum NELOG_NetlogonRejectedRemoteDynamicDnsDeregister = 0x000016b6;
enum NELOG_NetlogonRemoteDynamicDnsUpdateRequestFailure = 0x000016b7;
enum NELOG_NetlogonUserValidationReqInitialTimeOut = 0x000016b8;
enum NELOG_NetlogonUserValidationReqRecurringTimeOut = 0x000016b9;
enum NELOG_NetlogonUserValidationReqWaitInitialWarning = 0x000016ba;
enum NELOG_NetlogonUserValidationReqWaitRecurringWarning = 0x000016bb;
enum NELOG_NetlogonFailedToAddAuthzRpcInterface = 0x000016bc;
enum NELOG_NetLogonFailedToInitializeAuthzRm = 0x000016bd;
enum NELOG_NetLogonFailedToInitializeRPCSD = 0x000016be;
enum NELOG_NetlogonMachinePasswdSetSucceeded = 0x000016bf;
enum NELOG_NetlogonMsaPasswdSetSucceeded = 0x000016c0;
enum NELOG_NetlogonDnsHostNameLowerCasingFailed = 0x000016c1;
enum NETLOG_NetlogonNonWindowsSupportsSecureRpc = 0x000016c2;
enum NETLOG_NetlogonUnsecureRpcClient = 0x000016c3;
enum NETLOG_NetlogonUnsecureRpcTrust = 0x000016c4;
enum NETLOG_NetlogonUnsecuredRpcMachineTemporarilyAllowed = 0x000016c5;
enum NETLOG_NetlogonUnsecureRpcMachineAllowedBySsdl = 0x000016c6;
enum NETLOG_NetlogonUnsecureRpcTrustAllowedBySsdl = 0x000016c7;
enum NETLOG_PassThruFilterError_Summary_AdminOverride = 0x000016c8;
enum NETLOG_PassThruFilterError_Summary_Blocked = 0x000016c9;
enum NETLOG_PassThruFilterError_Request_AdminOverride = 0x000016ca;
enum NETLOG_PassThruFilterError_Request_Blocked = 0x000016cb;
enum NETLOG_NetlogonRpcBacklogLimitSet = 0x000016cc;
enum NETLOG_NetlogonRpcBacklogLimitFailure = 0x000016cd;
enum NETSETUP_ACCT_DELETE = 0x00000004;
enum NETSETUP_DNS_NAME_CHANGES_ONLY = 0x00001000;
enum NETSETUP_INSTALL_INVOCATION = 0x00040000;
enum NETSETUP_ALT_SAMACCOUNTNAME = 0x00020000;
enum NET_IGNORE_UNSUPPORTED_FLAGS = 0x00000001;
enum NETSETUP_PROVISION_PERSISTENTSITE = 0x00000020;
enum NETSETUP_PROVISION_CHECK_PWD_ONLY = 0x80000000;
enum NETSETUP_PROVISIONING_PARAMS_WIN8_VERSION = 0x00000001;
enum NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION = 0x00000002;
enum MSGNAME_NOT_FORWARDED = 0x00000000;
enum MSGNAME_FORWARDED_TO = 0x00000004;
enum MSGNAME_FORWARDED_FROM = 0x00000010;
enum SUPPORTS_ANY = 0xffffffffffffffff;
enum NO_PERMISSION_REQUIRED = 0x00000001;
enum ALLOCATE_RESPONSE = 0x00000002;
enum USE_SPECIFIC_TRANSPORT = 0x80000000;
enum SV_PLATFORM_ID_OS2 = 0x00000190;
enum SV_PLATFORM_ID_NT = 0x000001f4;
enum MAJOR_VERSION_MASK = 0x0000000f;
enum SV_NODISC = 0xffffffffffffffff;
enum SV_PLATFORM_ID_PARMNUM = 0x00000065;
enum SV_NAME_PARMNUM = 0x00000066;
enum SV_VERSION_MAJOR_PARMNUM = 0x00000067;
enum SV_VERSION_MINOR_PARMNUM = 0x00000068;
enum SV_TYPE_PARMNUM = 0x00000069;
enum SV_COMMENT_PARMNUM = 0x00000005;
enum SV_USERS_PARMNUM = 0x0000006b;
enum SV_DISC_PARMNUM = 0x0000000a;
enum SV_HIDDEN_PARMNUM = 0x00000010;
enum SV_ANNOUNCE_PARMNUM = 0x00000011;
enum SV_ANNDELTA_PARMNUM = 0x00000012;
enum SV_USERPATH_PARMNUM = 0x00000070;
enum SV_ULIST_MTIME_PARMNUM = 0x00000191;
enum SV_GLIST_MTIME_PARMNUM = 0x00000192;
enum SV_ALIST_MTIME_PARMNUM = 0x00000193;
enum SV_ALERTS_PARMNUM = 0x0000000b;
enum SV_SECURITY_PARMNUM = 0x00000195;
enum SV_NUMADMIN_PARMNUM = 0x00000196;
enum SV_LANMASK_PARMNUM = 0x00000197;
enum SV_GUESTACC_PARMNUM = 0x00000198;
enum SV_CHDEVQ_PARMNUM = 0x0000019a;
enum SV_CHDEVJOBS_PARMNUM = 0x0000019b;
enum SV_CONNECTIONS_PARMNUM = 0x0000019c;
enum SV_SHARES_PARMNUM = 0x0000019d;
enum SV_OPENFILES_PARMNUM = 0x0000019e;
enum SV_SESSREQS_PARMNUM = 0x000001a1;
enum SV_ACTIVELOCKS_PARMNUM = 0x000001a3;
enum SV_NUMREQBUF_PARMNUM = 0x000001a4;
enum SV_NUMBIGBUF_PARMNUM = 0x000001a6;
enum SV_NUMFILETASKS_PARMNUM = 0x000001a7;
enum SV_ALERTSCHED_PARMNUM = 0x00000025;
enum SV_ERRORALERT_PARMNUM = 0x00000026;
enum SV_LOGONALERT_PARMNUM = 0x00000027;
enum SV_ACCESSALERT_PARMNUM = 0x00000028;
enum SV_DISKALERT_PARMNUM = 0x00000029;
enum SV_NETIOALERT_PARMNUM = 0x0000002a;
enum SV_MAXAUDITSZ_PARMNUM = 0x0000002b;
enum SV_SRVHEURISTICS_PARMNUM = 0x000001af;
enum SV_SESSOPENS_PARMNUM = 0x000001f5;
enum SV_SESSVCS_PARMNUM = 0x000001f6;
enum SV_OPENSEARCH_PARMNUM = 0x000001f7;
enum SV_SIZREQBUF_PARMNUM = 0x000001f8;
enum SV_INITWORKITEMS_PARMNUM = 0x000001f9;
enum SV_MAXWORKITEMS_PARMNUM = 0x000001fa;
enum SV_RAWWORKITEMS_PARMNUM = 0x000001fb;
enum SV_IRPSTACKSIZE_PARMNUM = 0x000001fc;
enum SV_MAXRAWBUFLEN_PARMNUM = 0x000001fd;
enum SV_SESSUSERS_PARMNUM = 0x000001fe;
enum SV_SESSCONNS_PARMNUM = 0x000001ff;
enum SV_MAXNONPAGEDMEMORYUSAGE_PARMNUM = 0x00000200;
enum SV_MAXPAGEDMEMORYUSAGE_PARMNUM = 0x00000201;
enum SV_ENABLESOFTCOMPAT_PARMNUM = 0x00000202;
enum SV_ENABLEFORCEDLOGOFF_PARMNUM = 0x00000203;
enum SV_TIMESOURCE_PARMNUM = 0x00000204;
enum SV_ACCEPTDOWNLEVELAPIS_PARMNUM = 0x00000205;
enum SV_LMANNOUNCE_PARMNUM = 0x00000206;
enum SV_DOMAIN_PARMNUM = 0x00000207;
enum SV_MAXCOPYREADLEN_PARMNUM = 0x00000208;
enum SV_MAXCOPYWRITELEN_PARMNUM = 0x00000209;
enum SV_MINKEEPSEARCH_PARMNUM = 0x0000020a;
enum SV_MAXKEEPSEARCH_PARMNUM = 0x0000020b;
enum SV_MINKEEPCOMPLSEARCH_PARMNUM = 0x0000020c;
enum SV_MAXKEEPCOMPLSEARCH_PARMNUM = 0x0000020d;
enum SV_THREADCOUNTADD_PARMNUM = 0x0000020e;
enum SV_NUMBLOCKTHREADS_PARMNUM = 0x0000020f;
enum SV_SCAVTIMEOUT_PARMNUM = 0x00000210;
enum SV_MINRCVQUEUE_PARMNUM = 0x00000211;
enum SV_MINFREEWORKITEMS_PARMNUM = 0x00000212;
enum SV_XACTMEMSIZE_PARMNUM = 0x00000213;
enum SV_THREADPRIORITY_PARMNUM = 0x00000214;
enum SV_MAXMPXCT_PARMNUM = 0x00000215;
enum SV_OPLOCKBREAKWAIT_PARMNUM = 0x00000216;
enum SV_OPLOCKBREAKRESPONSEWAIT_PARMNUM = 0x00000217;
enum SV_ENABLEOPLOCKS_PARMNUM = 0x00000218;
enum SV_ENABLEOPLOCKFORCECLOSE_PARMNUM = 0x00000219;
enum SV_ENABLEFCBOPENS_PARMNUM = 0x0000021a;
enum SV_ENABLERAW_PARMNUM = 0x0000021b;
enum SV_ENABLESHAREDNETDRIVES_PARMNUM = 0x0000021c;
enum SV_MINFREECONNECTIONS_PARMNUM = 0x0000021d;
enum SV_MAXFREECONNECTIONS_PARMNUM = 0x0000021e;
enum SV_INITSESSTABLE_PARMNUM = 0x0000021f;
enum SV_INITCONNTABLE_PARMNUM = 0x00000220;
enum SV_INITFILETABLE_PARMNUM = 0x00000221;
enum SV_INITSEARCHTABLE_PARMNUM = 0x00000222;
enum SV_ALERTSCHEDULE_PARMNUM = 0x00000223;
enum SV_ERRORTHRESHOLD_PARMNUM = 0x00000224;
enum SV_NETWORKERRORTHRESHOLD_PARMNUM = 0x00000225;
enum SV_DISKSPACETHRESHOLD_PARMNUM = 0x00000226;
enum SV_MAXLINKDELAY_PARMNUM = 0x00000228;
enum SV_MINLINKTHROUGHPUT_PARMNUM = 0x00000229;
enum SV_LINKINFOVALIDTIME_PARMNUM = 0x0000022a;
enum SV_SCAVQOSINFOUPDATETIME_PARMNUM = 0x0000022b;
enum SV_MAXWORKITEMIDLETIME_PARMNUM = 0x0000022c;
enum SV_MAXRAWWORKITEMS_PARMNUM = 0x0000022d;
enum SV_PRODUCTTYPE_PARMNUM = 0x00000230;
enum SV_SERVERSIZE_PARMNUM = 0x00000231;
enum SV_CONNECTIONLESSAUTODISC_PARMNUM = 0x00000232;
enum SV_SHARINGVIOLATIONRETRIES_PARMNUM = 0x00000233;
enum SV_SHARINGVIOLATIONDELAY_PARMNUM = 0x00000234;
enum SV_MAXGLOBALOPENSEARCH_PARMNUM = 0x00000235;
enum SV_REMOVEDUPLICATESEARCHES_PARMNUM = 0x00000236;
enum SV_LOCKVIOLATIONRETRIES_PARMNUM = 0x00000237;
enum SV_LOCKVIOLATIONOFFSET_PARMNUM = 0x00000238;
enum SV_LOCKVIOLATIONDELAY_PARMNUM = 0x00000239;
enum SV_MDLREADSWITCHOVER_PARMNUM = 0x0000023a;
enum SV_CACHEDOPENLIMIT_PARMNUM = 0x0000023b;
enum SV_CRITICALTHREADS_PARMNUM = 0x0000023c;
enum SV_RESTRICTNULLSESSACCESS_PARMNUM = 0x0000023d;
enum SV_ENABLEWFW311DIRECTIPX_PARMNUM = 0x0000023e;
enum SV_OTHERQUEUEAFFINITY_PARMNUM = 0x0000023f;
enum SV_QUEUESAMPLESECS_PARMNUM = 0x00000240;
enum SV_BALANCECOUNT_PARMNUM = 0x00000241;
enum SV_PREFERREDAFFINITY_PARMNUM = 0x00000242;
enum SV_MAXFREERFCBS_PARMNUM = 0x00000243;
enum SV_MAXFREEMFCBS_PARMNUM = 0x00000244;
enum SV_MAXFREELFCBS_PARMNUM = 0x00000245;
enum SV_MAXFREEPAGEDPOOLCHUNKS_PARMNUM = 0x00000246;
enum SV_MINPAGEDPOOLCHUNKSIZE_PARMNUM = 0x00000247;
enum SV_MAXPAGEDPOOLCHUNKSIZE_PARMNUM = 0x00000248;
enum SV_SENDSFROMPREFERREDPROCESSOR_PARMNUM = 0x00000249;
enum SV_MAXTHREADSPERQUEUE_PARMNUM = 0x0000024a;
enum SV_CACHEDDIRECTORYLIMIT_PARMNUM = 0x0000024b;
enum SV_MAXCOPYLENGTH_PARMNUM = 0x0000024c;
enum SV_ENABLECOMPRESSION_PARMNUM = 0x0000024e;
enum SV_AUTOSHAREWKS_PARMNUM = 0x0000024f;
enum SV_AUTOSHARESERVER_PARMNUM = 0x00000250;
enum SV_ENABLESECURITYSIGNATURE_PARMNUM = 0x00000251;
enum SV_REQUIRESECURITYSIGNATURE_PARMNUM = 0x00000252;
enum SV_MINCLIENTBUFFERSIZE_PARMNUM = 0x00000253;
enum SV_CONNECTIONNOSESSIONSTIMEOUT_PARMNUM = 0x00000254;
enum SV_IDLETHREADTIMEOUT_PARMNUM = 0x00000255;
enum SV_ENABLEW9XSECURITYSIGNATURE_PARMNUM = 0x00000256;
enum SV_ENFORCEKERBEROSREAUTHENTICATION_PARMNUM = 0x00000257;
enum SV_DISABLEDOS_PARMNUM = 0x00000258;
enum SV_LOWDISKSPACEMINIMUM_PARMNUM = 0x00000259;
enum SV_DISABLESTRICTNAMECHECKING_PARMNUM = 0x0000025a;
enum SV_ENABLEAUTHENTICATEUSERSHARING_PARMNUM = 0x0000025b;
enum SVI1_NUM_ELEMENTS = 0x00000005;
enum SVI2_NUM_ELEMENTS = 0x00000028;
enum SVI3_NUM_ELEMENTS = 0x0000002c;
enum SV_MAX_CMD_LEN = 0x00000100;
enum SW_AUTOPROF_LOAD_MASK = 0x00000001;
enum SW_AUTOPROF_SAVE_MASK = 0x00000002;
enum SV_MAX_SRV_HEUR_LEN = 0x00000020;
enum SV_USERS_PER_LICENSE = 0x00000005;
enum SVTI2_REMAP_PIPE_NAMES = 0x00000002;
enum SVTI2_SCOPED_NAME = 0x00000004;
enum SVTI2_CLUSTER_NAME = 0x00000008;
enum SVTI2_CLUSTER_DNN_NAME = 0x00000010;
enum SVTI2_UNICODE_TRANSPORT_ADDRESS = 0x00000020;
enum SVTI2_RESERVED1 = 0x00001000;
enum SVTI2_RESERVED2 = 0x00002000;
enum SVTI2_RESERVED3 = 0x00004000;
enum SRV_SUPPORT_HASH_GENERATION = 0x00000001;
enum SRV_HASH_GENERATION_ACTIVE = 0x00000002;
enum SERVICE_INSTALL_STATE = 0x00000003;
enum SERVICE_UNINSTALLED = 0x00000000;
enum SERVICE_INSTALL_PENDING = 0x00000001;
enum SERVICE_UNINSTALL_PENDING = 0x00000002;
enum SERVICE_INSTALLED = 0x00000003;
enum SERVICE_PAUSE_STATE = 0x0000000c;
enum LM20_SERVICE_ACTIVE = 0x00000000;
enum LM20_SERVICE_CONTINUE_PENDING = 0x00000004;
enum LM20_SERVICE_PAUSE_PENDING = 0x00000008;
enum LM20_SERVICE_PAUSED = 0x0000000c;
enum SERVICE_NOT_UNINSTALLABLE = 0x00000000;
enum SERVICE_UNINSTALLABLE = 0x00000010;
enum SERVICE_NOT_PAUSABLE = 0x00000000;
enum SERVICE_PAUSABLE = 0x00000020;
enum SERVICE_REDIR_PAUSED = 0x00000700;
enum SERVICE_REDIR_DISK_PAUSED = 0x00000100;
enum SERVICE_REDIR_PRINT_PAUSED = 0x00000200;
enum SERVICE_REDIR_COMM_PAUSED = 0x00000400;
enum SERVICE_DOS_ENCRYPTION = "ENCRYPT";
enum SERVICE_CTRL_INTERROGATE = 0x00000000;
enum SERVICE_CTRL_PAUSE = 0x00000001;
enum SERVICE_CTRL_CONTINUE = 0x00000002;
enum SERVICE_CTRL_UNINSTALL = 0x00000003;
enum SERVICE_CTRL_REDIR_DISK = 0x00000001;
enum SERVICE_CTRL_REDIR_PRINT = 0x00000002;
enum SERVICE_CTRL_REDIR_COMM = 0x00000004;
enum SERVICE_IP_NO_HINT = 0x00000000;
enum SERVICE_CCP_NO_HINT = 0x00000000;
enum SERVICE_IP_QUERY_HINT = 0x00010000;
enum SERVICE_CCP_QUERY_HINT = 0x00010000;
enum SERVICE_IP_CHKPT_NUM = 0x000000ff;
enum SERVICE_CCP_CHKPT_NUM = 0x000000ff;
enum SERVICE_IP_WAIT_TIME = 0x0000ff00;
enum SERVICE_CCP_WAIT_TIME = 0x0000ff00;
enum SERVICE_IP_WAITTIME_SHIFT = 0x00000008;
enum SERVICE_NTIP_WAITTIME_SHIFT = 0x0000000c;
enum UPPER_HINT_MASK = 0x0000ff00;
enum LOWER_HINT_MASK = 0x000000ff;
enum UPPER_GET_HINT_MASK = 0x0ff00000;
enum LOWER_GET_HINT_MASK = 0x0000ff00;
enum SERVICE_NT_MAXTIME = 0x0000ffff;
enum SERVICE_RESRV_MASK = 0x0001ffff;
enum SERVICE_MAXTIME = 0x000000ff;
enum SERVICE_BASE = 0x00000bea;
enum SERVICE_UIC_NORMAL = 0x00000000;
enum SERVICE_UIC_BADPARMVAL = 0x00000beb;
enum SERVICE_UIC_MISSPARM = 0x00000bec;
enum SERVICE_UIC_UNKPARM = 0x00000bed;
enum SERVICE_UIC_RESOURCE = 0x00000bee;
enum SERVICE_UIC_CONFIG = 0x00000bef;
enum SERVICE_UIC_SYSTEM = 0x00000bf0;
enum SERVICE_UIC_INTERNAL = 0x00000bf1;
enum SERVICE_UIC_AMBIGPARM = 0x00000bf2;
enum SERVICE_UIC_DUPPARM = 0x00000bf3;
enum SERVICE_UIC_KILL = 0x00000bf4;
enum SERVICE_UIC_EXEC = 0x00000bf5;
enum SERVICE_UIC_SUBSERV = 0x00000bf6;
enum SERVICE_UIC_CONFLPARM = 0x00000bf7;
enum SERVICE_UIC_FILE = 0x00000bf8;
enum SERVICE_UIC_M_NULL = 0x00000000;
enum SERVICE_UIC_M_MEMORY = 0x00000bfe;
enum SERVICE_UIC_M_DISK = 0x00000bff;
enum SERVICE_UIC_M_THREADS = 0x00000c00;
enum SERVICE_UIC_M_PROCESSES = 0x00000c01;
enum SERVICE_UIC_M_SECURITY = 0x00000c02;
enum SERVICE_UIC_M_LANROOT = 0x00000c03;
enum SERVICE_UIC_M_REDIR = 0x00000c04;
enum SERVICE_UIC_M_SERVER = 0x00000c05;
enum SERVICE_UIC_M_SEC_FILE_ERR = 0x00000c06;
enum SERVICE_UIC_M_FILES = 0x00000c07;
enum SERVICE_UIC_M_LOGS = 0x00000c08;
enum SERVICE_UIC_M_LANGROUP = 0x00000c09;
enum SERVICE_UIC_M_MSGNAME = 0x00000c0a;
enum SERVICE_UIC_M_ANNOUNCE = 0x00000c0b;
enum SERVICE_UIC_M_UAS = 0x00000c0c;
enum SERVICE_UIC_M_SERVER_SEC_ERR = 0x00000c0d;
enum SERVICE_UIC_M_WKSTA = 0x00000c0f;
enum SERVICE_UIC_M_ERRLOG = 0x00000c10;
enum SERVICE_UIC_M_FILE_UW = 0x00000c11;
enum SERVICE_UIC_M_ADDPAK = 0x00000c12;
enum SERVICE_UIC_M_LAZY = 0x00000c13;
enum SERVICE_UIC_M_UAS_MACHINE_ACCT = 0x00000c14;
enum SERVICE_UIC_M_UAS_SERVERS_NMEMB = 0x00000c15;
enum SERVICE_UIC_M_UAS_SERVERS_NOGRP = 0x00000c16;
enum SERVICE_UIC_M_UAS_INVALID_ROLE = 0x00000c17;
enum SERVICE_UIC_M_NETLOGON_NO_DC = 0x00000c18;
enum SERVICE_UIC_M_NETLOGON_DC_CFLCT = 0x00000c19;
enum SERVICE_UIC_M_NETLOGON_AUTH = 0x00000c1a;
enum SERVICE_UIC_M_UAS_PROLOG = 0x00000c1b;
enum SERVICE2_BASE = 0x000015e0;
enum SERVICE_UIC_M_NETLOGON_MPATH = 0x000015e0;
enum SERVICE_UIC_M_LSA_MACHINE_ACCT = 0x000015e1;
enum SERVICE_UIC_M_DATABASE_ERROR = 0x000015e2;
enum USE_FLAG_GLOBAL_MAPPING = 0x00010000;
enum USE_LOCAL_PARMNUM = 0x00000001;
enum USE_REMOTE_PARMNUM = 0x00000002;
enum USE_PASSWORD_PARMNUM = 0x00000003;
enum USE_ASGTYPE_PARMNUM = 0x00000004;
enum USE_USERNAME_PARMNUM = 0x00000005;
enum USE_DOMAINNAME_PARMNUM = 0x00000006;
enum USE_FLAGS_PARMNUM = 0x00000007;
enum USE_AUTHIDENTITY_PARMNUM = 0x00000008;
enum USE_SD_PARMNUM = 0x00000009;
enum USE_OPTIONS_PARMNUM = 0x0000000a;
enum USE_OK = 0x00000000;
enum USE_PAUSED = 0x00000001;
enum USE_SESSLOST = 0x00000002;
enum USE_DISCONN = 0x00000002;
enum USE_NETERR = 0x00000003;
enum USE_CONN = 0x00000004;
enum USE_RECONN = 0x00000005;
enum USE_CHARDEV = 0x00000002;
enum CREATE_NO_CONNECT = 0x00000001;
enum CREATE_BYPASS_CSC = 0x00000002;
enum CREATE_CRED_RESET = 0x00000004;
enum USE_DEFAULT_CREDENTIALS = 0x00000004;
enum CREATE_REQUIRE_CONNECTION_INTEGRITY = 0x00000008;
enum CREATE_REQUIRE_CONNECTION_PRIVACY = 0x00000010;
enum CREATE_PERSIST_MAPPING = 0x00000020;
enum CREATE_WRITE_THROUGH_SEMANTICS = 0x00000040;
enum CREATE_GLOBAL_MAPPING = 0x00000100;
enum WKSTA_PLATFORM_ID_PARMNUM = 0x00000064;
enum WKSTA_COMPUTERNAME_PARMNUM = 0x00000001;
enum WKSTA_LANGROUP_PARMNUM = 0x00000002;
enum WKSTA_VER_MAJOR_PARMNUM = 0x00000004;
enum WKSTA_VER_MINOR_PARMNUM = 0x00000005;
enum WKSTA_LOGGED_ON_USERS_PARMNUM = 0x00000006;
enum WKSTA_LANROOT_PARMNUM = 0x00000007;
enum WKSTA_LOGON_DOMAIN_PARMNUM = 0x00000008;
enum WKSTA_LOGON_SERVER_PARMNUM = 0x00000009;
enum WKSTA_CHARWAIT_PARMNUM = 0x0000000a;
enum WKSTA_CHARTIME_PARMNUM = 0x0000000b;
enum WKSTA_CHARCOUNT_PARMNUM = 0x0000000c;
enum WKSTA_KEEPCONN_PARMNUM = 0x0000000d;
enum WKSTA_KEEPSEARCH_PARMNUM = 0x0000000e;
enum WKSTA_MAXCMDS_PARMNUM = 0x0000000f;
enum WKSTA_NUMWORKBUF_PARMNUM = 0x00000010;
enum WKSTA_MAXWRKCACHE_PARMNUM = 0x00000011;
enum WKSTA_SESSTIMEOUT_PARMNUM = 0x00000012;
enum WKSTA_SIZERROR_PARMNUM = 0x00000013;
enum WKSTA_NUMALERTS_PARMNUM = 0x00000014;
enum WKSTA_NUMSERVICES_PARMNUM = 0x00000015;
enum WKSTA_NUMCHARBUF_PARMNUM = 0x00000016;
enum WKSTA_SIZCHARBUF_PARMNUM = 0x00000017;
enum WKSTA_ERRLOGSZ_PARMNUM = 0x0000001b;
enum WKSTA_PRINTBUFTIME_PARMNUM = 0x0000001c;
enum WKSTA_SIZWORKBUF_PARMNUM = 0x0000001d;
enum WKSTA_MAILSLOTS_PARMNUM = 0x0000001e;
enum WKSTA_NUMDGRAMBUF_PARMNUM = 0x0000001f;
enum WKSTA_WRKHEURISTICS_PARMNUM = 0x00000020;
enum WKSTA_MAXTHREADS_PARMNUM = 0x00000021;
enum WKSTA_LOCKQUOTA_PARMNUM = 0x00000029;
enum WKSTA_LOCKINCREMENT_PARMNUM = 0x0000002a;
enum WKSTA_LOCKMAXIMUM_PARMNUM = 0x0000002b;
enum WKSTA_PIPEINCREMENT_PARMNUM = 0x0000002c;
enum WKSTA_PIPEMAXIMUM_PARMNUM = 0x0000002d;
enum WKSTA_DORMANTFILELIMIT_PARMNUM = 0x0000002e;
enum WKSTA_CACHEFILETIMEOUT_PARMNUM = 0x0000002f;
enum WKSTA_USEOPPORTUNISTICLOCKING_PARMNUM = 0x00000030;
enum WKSTA_USEUNLOCKBEHIND_PARMNUM = 0x00000031;
enum WKSTA_USECLOSEBEHIND_PARMNUM = 0x00000032;
enum WKSTA_BUFFERNAMEDPIPES_PARMNUM = 0x00000033;
enum WKSTA_USELOCKANDREADANDUNLOCK_PARMNUM = 0x00000034;
enum WKSTA_UTILIZENTCACHING_PARMNUM = 0x00000035;
enum WKSTA_USERAWREAD_PARMNUM = 0x00000036;
enum WKSTA_USERAWWRITE_PARMNUM = 0x00000037;
enum WKSTA_USEWRITERAWWITHDATA_PARMNUM = 0x00000038;
enum WKSTA_USEENCRYPTION_PARMNUM = 0x00000039;
enum WKSTA_BUFFILESWITHDENYWRITE_PARMNUM = 0x0000003a;
enum WKSTA_BUFFERREADONLYFILES_PARMNUM = 0x0000003b;
enum WKSTA_FORCECORECREATEMODE_PARMNUM = 0x0000003c;
enum WKSTA_USE512BYTESMAXTRANSFER_PARMNUM = 0x0000003d;
enum WKSTA_READAHEADTHRUPUT_PARMNUM = 0x0000003e;
enum WKSTA_OTH_DOMAINS_PARMNUM = 0x00000065;
enum TRANSPORT_QUALITYOFSERVICE_PARMNUM = 0x000000c9;
enum TRANSPORT_NAME_PARMNUM = 0x000000ca;
enum EVENT_SRV_SERVICE_FAILED = 0xffffffffc00007d0;
enum EVENT_SRV_RESOURCE_SHORTAGE = 0xffffffffc00007d1;
enum EVENT_SRV_CANT_CREATE_DEVICE = 0xffffffffc00007d2;
enum EVENT_SRV_CANT_CREATE_PROCESS = 0xffffffffc00007d3;
enum EVENT_SRV_CANT_CREATE_THREAD = 0xffffffffc00007d4;
enum EVENT_SRV_UNEXPECTED_DISC = 0xffffffffc00007d5;
enum EVENT_SRV_INVALID_REQUEST = 0xffffffffc00007d6;
enum EVENT_SRV_CANT_OPEN_NPFS = 0xffffffffc00007d7;
enum EVENT_SRV_CANT_GROW_TABLE = 0xffffffff800007d9;
enum EVENT_SRV_CANT_START_SCAVENGER = 0xffffffffc00007da;
enum EVENT_SRV_IRP_STACK_SIZE = 0xffffffffc00007db;
enum EVENT_SRV_NETWORK_ERROR = 0xffffffff800007dc;
enum EVENT_SRV_DISK_FULL = 0xffffffff800007dd;
enum EVENT_SRV_NO_VIRTUAL_MEMORY = 0xffffffffc00007e0;
enum EVENT_SRV_NONPAGED_POOL_LIMIT = 0xffffffffc00007e1;
enum EVENT_SRV_PAGED_POOL_LIMIT = 0xffffffffc00007e2;
enum EVENT_SRV_NO_NONPAGED_POOL = 0xffffffffc00007e3;
enum EVENT_SRV_NO_PAGED_POOL = 0xffffffffc00007e4;
enum EVENT_SRV_NO_WORK_ITEM = 0xffffffff800007e5;
enum EVENT_SRV_NO_FREE_CONNECTIONS = 0xffffffff800007e6;
enum EVENT_SRV_NO_FREE_RAW_WORK_ITEM = 0xffffffff800007e7;
enum EVENT_SRV_NO_BLOCKING_IO = 0xffffffff800007e8;
enum EVENT_SRV_DOS_ATTACK_DETECTED = 0xffffffff800007e9;
enum EVENT_SRV_TOO_MANY_DOS = 0xffffffff800007ea;
enum EVENT_SRV_OUT_OF_WORK_ITEM_DOS = 0xffffffff800007eb;
enum EVENT_SRV_KEY_NOT_FOUND = 0xffffffffc00009c5;
enum EVENT_SRV_KEY_NOT_CREATED = 0xffffffffc00009c6;
enum EVENT_SRV_NO_TRANSPORTS_BOUND = 0xffffffffc00009c7;
enum EVENT_SRV_CANT_BIND_TO_TRANSPORT = 0xffffffff800009c8;
enum EVENT_SRV_CANT_BIND_DUP_NAME = 0xffffffffc00009c9;
enum EVENT_SRV_INVALID_REGISTRY_VALUE = 0xffffffff800009ca;
enum EVENT_SRV_INVALID_SD = 0xffffffff800009cb;
enum EVENT_SRV_CANT_LOAD_DRIVER = 0xffffffff800009cc;
enum EVENT_SRV_CANT_UNLOAD_DRIVER = 0xffffffff800009cd;
enum EVENT_SRV_CANT_MAP_ERROR = 0xffffffff800009ce;
enum EVENT_SRV_CANT_RECREATE_SHARE = 0xffffffff800009cf;
enum EVENT_SRV_CANT_CHANGE_DOMAIN_NAME = 0xffffffff800009d0;
enum EVENT_SRV_TXF_INIT_FAILED = 0xffffffff800009d1;
enum EVENT_RDR_RESOURCE_SHORTAGE = 0xffffffff80000bb9;
enum EVENT_RDR_CANT_CREATE_DEVICE = 0xffffffff80000bba;
enum EVENT_RDR_CANT_CREATE_THREAD = 0xffffffff80000bbb;
enum EVENT_RDR_CANT_SET_THREAD = 0xffffffff80000bbc;
enum EVENT_RDR_INVALID_REPLY = 0xffffffff80000bbd;
enum EVENT_RDR_INVALID_SMB = 0xffffffff80000bbe;
enum EVENT_RDR_INVALID_LOCK_REPLY = 0xffffffff80000bbf;
enum EVENT_RDR_FAILED_UNLOCK = 0xffffffff80000bc1;
enum EVENT_RDR_CLOSE_BEHIND = 0xffffffff80000bc3;
enum EVENT_RDR_UNEXPECTED_ERROR = 0xffffffff80000bc4;
enum EVENT_RDR_TIMEOUT = 0xffffffff80000bc5;
enum EVENT_RDR_INVALID_OPLOCK = 0xffffffff80000bc6;
enum EVENT_RDR_CONNECTION_REFERENCE = 0xffffffff80000bc7;
enum EVENT_RDR_SERVER_REFERENCE = 0xffffffff80000bc8;
enum EVENT_RDR_SMB_REFERENCE = 0xffffffff80000bc9;
enum EVENT_RDR_ENCRYPT = 0xffffffff80000bca;
enum EVENT_RDR_CONNECTION = 0xffffffff80000bcb;
enum EVENT_RDR_MAXCMDS = 0xffffffff80000bcd;
enum EVENT_RDR_OPLOCK_SMB = 0xffffffff80000bce;
enum EVENT_RDR_DISPOSITION = 0xffffffff80000bcf;
enum EVENT_RDR_CONTEXTS = 0xffffffff80000bd0;
enum EVENT_RDR_WRITE_BEHIND_FLUSH_FAILED = 0xffffffff80000bd1;
enum EVENT_RDR_AT_THREAD_MAX = 0xffffffff80000bd2;
enum EVENT_RDR_CANT_READ_REGISTRY = 0xffffffff80000bd3;
enum EVENT_RDR_TIMEZONE_BIAS_TOO_LARGE = 0xffffffff80000bd4;
enum EVENT_RDR_PRIMARY_TRANSPORT_CONNECT_FAILED = 0xffffffff80000bd5;
enum EVENT_RDR_DELAYED_SET_ATTRIBUTES_FAILED = 0xffffffff80000bd6;
enum EVENT_RDR_DELETEONCLOSE_FAILED = 0xffffffff80000bd7;
enum EVENT_RDR_CANT_BIND_TRANSPORT = 0xffffffff80000bd8;
enum EVENT_RDR_CANT_REGISTER_ADDRESS = 0xffffffff80000bd9;
enum EVENT_RDR_CANT_GET_SECURITY_CONTEXT = 0xffffffff80000bda;
enum EVENT_RDR_CANT_BUILD_SMB_HEADER = 0xffffffff80000bdb;
enum EVENT_RDR_SECURITY_SIGNATURE_MISMATCH = 0xffffffff80000bdc;
enum EVENT_TCPIP6_STARTED = 0x40000c1c;
enum EVENT_STREAMS_STRLOG = 0xffffffffc0000fa0;
enum EVENT_STREAMS_ALLOCB_FAILURE = 0xffffffff80000fa1;
enum EVENT_STREAMS_ALLOCB_FAILURE_CNT = 0xffffffff80000fa2;
enum EVENT_STREAMS_ESBALLOC_FAILURE = 0xffffffff80000fa3;
enum EVENT_STREAMS_ESBALLOC_FAILURE_CNT = 0xffffffff80000fa4;
enum EVENT_TCPIP_CREATE_DEVICE_FAILED = 0xffffffffc0001004;
enum EVENT_TCPIP_NO_RESOURCES_FOR_INIT = 0xffffffffc0001005;
enum EVENT_TCPIP_TOO_MANY_NETS = 0xffffffffc0001059;
enum EVENT_TCPIP_NO_MASK = 0xffffffffc000105a;
enum EVENT_TCPIP_INVALID_ADDRESS = 0xffffffffc000105b;
enum EVENT_TCPIP_INVALID_MASK = 0xffffffffc000105c;
enum EVENT_TCPIP_NO_ADAPTER_RESOURCES = 0xffffffffc000105d;
enum EVENT_TCPIP_DHCP_INIT_FAILED = 0xffffffff8000105e;
enum EVENT_TCPIP_ADAPTER_REG_FAILURE = 0xffffffffc000105f;
enum EVENT_TCPIP_INVALID_DEFAULT_GATEWAY = 0xffffffff80001060;
enum EVENT_TCPIP_NO_ADDRESS_LIST = 0xffffffffc0001061;
enum EVENT_TCPIP_NO_MASK_LIST = 0xffffffffc0001062;
enum EVENT_TCPIP_NO_BINDINGS = 0xffffffffc0001063;
enum EVENT_TCPIP_IP_INIT_FAILED = 0xffffffffc0001064;
enum EVENT_TCPIP_TOO_MANY_GATEWAYS = 0xffffffff80001065;
enum EVENT_TCPIP_ADDRESS_CONFLICT1 = 0xffffffffc0001066;
enum EVENT_TCPIP_ADDRESS_CONFLICT2 = 0xffffffffc0001067;
enum EVENT_TCPIP_NTE_CONTEXT_LIST_FAILURE = 0xffffffffc0001068;
enum EVENT_TCPIP_MEDIA_CONNECT = 0x40001069;
enum EVENT_TCPIP_MEDIA_DISCONNECT = 0x4000106a;
enum EVENT_TCPIP_IPV4_UNINSTALLED = 0x4000106b;
enum EVENT_TCPIP_AUTOCONFIGURED_ADDRESS_LIMIT_REACHED = 0xffffffff8000106c;
enum EVENT_TCPIP_AUTOCONFIGURED_ROUTE_LIMIT_REACHED = 0xffffffff8000106d;
enum EVENT_TCPIP_OUT_OF_ORDER_FRAGMENTS_EXCEEDED = 0xffffffff8000106e;
enum EVENT_TCPIP_INTERFACE_BIND_FAILURE = 0xffffffffc000106f;
enum EVENT_TCPIP_TCP_INIT_FAILED = 0xffffffffc0001081;
enum EVENT_TCPIP_TCP_CONNECT_LIMIT_REACHED = 0xffffffff80001082;
enum EVENT_TCPIP_TCP_TIME_WAIT_COLLISION = 0xffffffff80001083;
enum EVENT_TCPIP_TCP_WSD_WS_RESTRICTED = 0xffffffff80001084;
enum EVENT_TCPIP_TCP_MPP_ATTACKS_DETECTED = 0xffffffff80001085;
enum EVENT_TCPIP_TCP_CONNECTIONS_PERF_IMPACTED = 0xffffffff80001086;
enum EVENT_TCPIP_TCP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED = 0xffffffff80001087;
enum EVENT_TCPIP_UDP_LIMIT_REACHED = 0xffffffff800010a9;
enum EVENT_TCPIP_UDP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED = 0xffffffff800010aa;
enum EVENT_TCPIP_PCF_MULTICAST_OID_ISSUE = 0xffffffff800010c2;
enum EVENT_TCPIP_PCF_MISSING_CAPABILITY = 0xffffffff800010c3;
enum EVENT_TCPIP_PCF_SET_FILTER_FAILURE = 0xffffffff800010c4;
enum EVENT_TCPIP_PCF_NO_ARP_FILTER = 0xffffffff800010c5;
enum EVENT_TCPIP_PCF_CLEAR_FILTER_FAILURE = 0xffffffffc00010c6;
enum EVENT_NBT_CREATE_DRIVER = 0xffffffffc00010cc;
enum EVENT_NBT_OPEN_REG_PARAMS = 0xffffffffc00010cd;
enum EVENT_NBT_NO_BACKUP_WINS = 0xffffffff800010ce;
enum EVENT_NBT_NO_WINS = 0xffffffff800010cf;
enum EVENT_NBT_BAD_BACKUP_WINS_ADDR = 0xffffffff800010d0;
enum EVENT_NBT_BAD_PRIMARY_WINS_ADDR = 0xffffffff800010d1;
enum EVENT_NBT_NAME_SERVER_ADDRS = 0xffffffffc00010d2;
enum EVENT_NBT_CREATE_ADDRESS = 0xffffffffc00010d3;
enum EVENT_NBT_CREATE_CONNECTION = 0xffffffffc00010d4;
enum EVENT_NBT_NON_OS_INIT = 0xffffffffc00010d5;
enum EVENT_NBT_TIMERS = 0xffffffffc00010d6;
enum EVENT_NBT_CREATE_DEVICE = 0xffffffffc00010d7;
enum EVENT_NBT_NO_DEVICES = 0xffffffff800010d8;
enum EVENT_NBT_OPEN_REG_LINKAGE = 0xffffffffc00010d9;
enum EVENT_NBT_READ_BIND = 0xffffffffc00010da;
enum EVENT_NBT_READ_EXPORT = 0xffffffffc00010db;
enum EVENT_NBT_OPEN_REG_NAMESERVER = 0xffffffff800010dc;
enum EVENT_SCOPE_LABEL_TOO_LONG = 0xffffffff800010dd;
enum EVENT_SCOPE_TOO_LONG = 0xffffffff800010de;
enum EVENT_NBT_DUPLICATE_NAME = 0xffffffffc00010df;
enum EVENT_NBT_NAME_RELEASE = 0xffffffffc00010e0;
enum EVENT_NBT_DUPLICATE_NAME_ERROR = 0xffffffffc00010e1;
enum EVENT_NBT_NO_RESOURCES = 0xffffffffc00010e2;
enum EVENT_NDIS_RESOURCE_CONFLICT = 0xffffffffc0001388;
enum EVENT_NDIS_OUT_OF_RESOURCE = 0xffffffffc0001389;
enum EVENT_NDIS_HARDWARE_FAILURE = 0xffffffffc000138a;
enum EVENT_NDIS_ADAPTER_NOT_FOUND = 0xffffffffc000138b;
enum EVENT_NDIS_INTERRUPT_CONNECT = 0xffffffffc000138c;
enum EVENT_NDIS_DRIVER_FAILURE = 0xffffffffc000138d;
enum EVENT_NDIS_BAD_VERSION = 0xffffffffc000138e;
enum EVENT_NDIS_TIMEOUT = 0xffffffff8000138f;
enum EVENT_NDIS_NETWORK_ADDRESS = 0xffffffffc0001390;
enum EVENT_NDIS_UNSUPPORTED_CONFIGURATION = 0xffffffffc0001391;
enum EVENT_NDIS_INVALID_VALUE_FROM_ADAPTER = 0xffffffffc0001392;
enum EVENT_NDIS_MISSING_CONFIGURATION_PARAMETER = 0xffffffffc0001393;
enum EVENT_NDIS_BAD_IO_BASE_ADDRESS = 0xffffffffc0001394;
enum EVENT_NDIS_RECEIVE_SPACE_SMALL = 0x40001395;
enum EVENT_NDIS_ADAPTER_DISABLED = 0xffffffff80001396;
enum EVENT_NDIS_IO_PORT_CONFLICT = 0xffffffff80001397;
enum EVENT_NDIS_PORT_OR_DMA_CONFLICT = 0xffffffff80001398;
enum EVENT_NDIS_MEMORY_CONFLICT = 0xffffffff80001399;
enum EVENT_NDIS_INTERRUPT_CONFLICT = 0xffffffff8000139a;
enum EVENT_NDIS_DMA_CONFLICT = 0xffffffff8000139b;
enum EVENT_NDIS_INVALID_DOWNLOAD_FILE_ERROR = 0xffffffffc000139c;
enum EVENT_NDIS_MAXRECEIVES_ERROR = 0xffffffff8000139d;
enum EVENT_NDIS_MAXTRANSMITS_ERROR = 0xffffffff8000139e;
enum EVENT_NDIS_MAXFRAMESIZE_ERROR = 0xffffffff8000139f;
enum EVENT_NDIS_MAXINTERNALBUFS_ERROR = 0xffffffff800013a0;
enum EVENT_NDIS_MAXMULTICAST_ERROR = 0xffffffff800013a1;
enum EVENT_NDIS_PRODUCTID_ERROR = 0xffffffff800013a2;
enum EVENT_NDIS_LOBE_FAILUE_ERROR = 0xffffffff800013a3;
enum EVENT_NDIS_SIGNAL_LOSS_ERROR = 0xffffffff800013a4;
enum EVENT_NDIS_REMOVE_RECEIVED_ERROR = 0xffffffff800013a5;
enum EVENT_NDIS_TOKEN_RING_CORRECTION = 0x400013a6;
enum EVENT_NDIS_ADAPTER_CHECK_ERROR = 0xffffffffc00013a7;
enum EVENT_NDIS_RESET_FAILURE_ERROR = 0xffffffff800013a8;
enum EVENT_NDIS_CABLE_DISCONNECTED_ERROR = 0xffffffff800013a9;
enum EVENT_NDIS_RESET_FAILURE_CORRECTION = 0xffffffff800013aa;
enum EVENT_EventlogStarted = 0xffffffff80001775;
enum EVENT_EventlogStopped = 0xffffffff80001776;
enum EVENT_EventlogAbnormalShutdown = 0xffffffff80001778;
enum EVENT_EventLogProductInfo = 0xffffffff80001779;
enum EVENT_ComputerNameChange = 0xffffffff8000177b;
enum EVENT_DNSDomainNameChange = 0xffffffff8000177c;
enum EVENT_EventlogUptime = 0xffffffff8000177d;
enum EVENT_UP_DRIVER_ON_MP = 0xffffffffc00017d4;
enum EVENT_SERVICE_START_FAILED = 0xffffffffc0001b58;
enum EVENT_SERVICE_START_FAILED_II = 0xffffffffc0001b59;
enum EVENT_SERVICE_START_FAILED_GROUP = 0xffffffffc0001b5a;
enum EVENT_SERVICE_START_FAILED_NONE = 0xffffffffc0001b5b;
enum EVENT_CALL_TO_FUNCTION_FAILED = 0xffffffffc0001b5d;
enum EVENT_CALL_TO_FUNCTION_FAILED_II = 0xffffffffc0001b5e;
enum EVENT_REVERTED_TO_LASTKNOWNGOOD = 0xffffffffc0001b5f;
enum EVENT_BAD_ACCOUNT_NAME = 0xffffffffc0001b60;
enum EVENT_CONNECTION_TIMEOUT = 0xffffffffc0001b61;
enum EVENT_READFILE_TIMEOUT = 0xffffffffc0001b62;
enum EVENT_TRANSACT_TIMEOUT = 0xffffffffc0001b63;
enum EVENT_TRANSACT_INVALID = 0xffffffffc0001b64;
enum EVENT_FIRST_LOGON_FAILED = 0xffffffffc0001b65;
enum EVENT_SECOND_LOGON_FAILED = 0xffffffffc0001b66;
enum EVENT_INVALID_DRIVER_DEPENDENCY = 0xffffffffc0001b67;
enum EVENT_BAD_SERVICE_STATE = 0xffffffffc0001b68;
enum EVENT_CIRCULAR_DEPENDENCY_DEMAND = 0xffffffffc0001b69;
enum EVENT_CIRCULAR_DEPENDENCY_AUTO = 0xffffffffc0001b6a;
enum EVENT_DEPEND_ON_LATER_SERVICE = 0xffffffffc0001b6b;
enum EVENT_DEPEND_ON_LATER_GROUP = 0xffffffffc0001b6c;
enum EVENT_SEVERE_SERVICE_FAILED = 0xffffffffc0001b6d;
enum EVENT_SERVICE_START_HUNG = 0xffffffffc0001b6e;
enum EVENT_SERVICE_EXIT_FAILED = 0xffffffffc0001b6f;
enum EVENT_SERVICE_EXIT_FAILED_SPECIFIC = 0xffffffffc0001b70;
enum EVENT_SERVICE_START_AT_BOOT_FAILED = 0xffffffffc0001b71;
enum EVENT_BOOT_SYSTEM_DRIVERS_FAILED = 0xffffffffc0001b72;
enum EVENT_RUNNING_LASTKNOWNGOOD = 0xffffffffc0001b73;
enum EVENT_TAKE_OWNERSHIP = 0xffffffffc0001b74;
enum TITLE_SC_MESSAGE_BOX = 0xffffffffc0001b75;
enum EVENT_SERVICE_NOT_INTERACTIVE = 0xffffffffc0001b76;
enum EVENT_SERVICE_CRASH = 0xffffffffc0001b77;
enum EVENT_SERVICE_RECOVERY_FAILED = 0xffffffffc0001b78;
enum EVENT_SERVICE_SCESRV_FAILED = 0xffffffffc0001b79;
enum EVENT_SERVICE_CRASH_NO_ACTION = 0xffffffffc0001b7a;
enum EVENT_SERVICE_CONTROL_SUCCESS = 0x40001b7b;
enum EVENT_SERVICE_STATUS_SUCCESS = 0x40001b7c;
enum EVENT_SERVICE_CONFIG_BACKOUT_FAILED = 0xffffffffc0001b7d;
enum EVENT_FIRST_LOGON_FAILED_II = 0xffffffffc0001b7e;
enum EVENT_SERVICE_DIFFERENT_PID_CONNECTED = 0xffffffff80001b7f;
enum EVENT_SERVICE_START_TYPE_CHANGED = 0x40001b80;
enum EVENT_SERVICE_LOGON_TYPE_NOT_GRANTED = 0xffffffffc0001b81;
enum EVENT_SERVICE_STOP_SUCCESS_WITH_REASON = 0x40001b82;
enum EVENT_SERVICE_SHUTDOWN_FAILED = 0xffffffffc0001b83;
enum EVENT_COMMAND_NOT_INTERACTIVE = 0xffffffffc0001edc;
enum EVENT_COMMAND_START_FAILED = 0xffffffffc0001edd;
enum EVENT_BOWSER_OTHER_MASTER_ON_NET = 0xffffffffc0001f43;
enum EVENT_BOWSER_PROMOTED_WHILE_ALREADY_MASTER = 0xffffffff80001f44;
enum EVENT_BOWSER_NON_MASTER_MASTER_ANNOUNCE = 0xffffffff80001f45;
enum EVENT_BOWSER_ILLEGAL_DATAGRAM = 0xffffffff80001f46;
enum EVENT_BROWSER_STATUS_BITS_UPDATE_FAILED = 0xffffffffc0001f47;
enum EVENT_BROWSER_ROLE_CHANGE_FAILED = 0xffffffffc0001f48;
enum EVENT_BROWSER_MASTER_PROMOTION_FAILED = 0xffffffffc0001f49;
enum EVENT_BOWSER_NAME_CONVERSION_FAILED = 0xffffffffc0001f4a;
enum EVENT_BROWSER_OTHERDOMAIN_ADD_FAILED = 0xffffffffc0001f4b;
enum EVENT_BOWSER_ELECTION_RECEIVED = 0x00001f4c;
enum EVENT_BOWSER_ELECTION_SENT_GETBLIST_FAILED = 0x40001f4d;
enum EVENT_BOWSER_ELECTION_SENT_FIND_MASTER_FAILED = 0x40001f4e;
enum EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STARTED = 0x40001f4f;
enum EVENT_BOWSER_ILLEGAL_DATAGRAM_THRESHOLD = 0xffffffffc0001f50;
enum EVENT_BROWSER_DEPENDANT_SERVICE_FAILED = 0xffffffffc0001f51;
enum EVENT_BROWSER_MASTER_PROMOTION_FAILED_STOPPING = 0xffffffffc0001f53;
enum EVENT_BROWSER_MASTER_PROMOTION_FAILED_NO_MASTER = 0xffffffffc0001f54;
enum EVENT_BROWSER_SERVER_LIST_FAILED = 0xffffffff80001f55;
enum EVENT_BROWSER_DOMAIN_LIST_FAILED = 0xffffffff80001f56;
enum EVENT_BROWSER_ILLEGAL_CONFIG = 0xffffffff80001f57;
enum EVENT_BOWSER_OLD_BACKUP_FOUND = 0x40001f58;
enum EVENT_BROWSER_SERVER_LIST_RETRIEVED = 0x00001f59;
enum EVENT_BROWSER_DOMAIN_LIST_RETRIEVED = 0x00001f5a;
enum EVENT_BOWSER_PDC_LOST_ELECTION = 0x40001f5b;
enum EVENT_BOWSER_NON_PDC_WON_ELECTION = 0x40001f5c;
enum EVENT_BOWSER_CANT_READ_REGISTRY = 0x40001f5d;
enum EVENT_BOWSER_MAILSLOT_DATAGRAM_THRESHOLD_EXCEEDED = 0x40001f5e;
enum EVENT_BOWSER_GETBROWSERLIST_THRESHOLD_EXCEEDED = 0x40001f5f;
enum EVENT_BROWSER_BACKUP_STOPPED = 0xffffffffc0001f60;
enum EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STOPPED = 0x40001f61;
enum EVENT_BROWSER_GETBLIST_RECEIVED_NOT_MASTER = 0xffffffffc0001f62;
enum EVENT_BROWSER_ELECTION_SENT_ROLE_CHANGED = 0x40001f63;
enum EVENT_BROWSER_NOT_STARTED_IPX_CONFIG_MISMATCH = 0xffffffffc0001f64;
enum NWSAP_EVENT_KEY_NOT_FOUND = 0xffffffffc0002134;
enum NWSAP_EVENT_WSASTARTUP_FAILED = 0xffffffffc0002135;
enum NWSAP_EVENT_SOCKET_FAILED = 0xffffffffc0002136;
enum NWSAP_EVENT_SETOPTBCAST_FAILED = 0xffffffffc0002137;
enum NWSAP_EVENT_BIND_FAILED = 0xffffffffc0002138;
enum NWSAP_EVENT_GETSOCKNAME_FAILED = 0xffffffffc0002139;
enum NWSAP_EVENT_OPTEXTENDEDADDR_FAILED = 0xffffffffc000213a;
enum NWSAP_EVENT_OPTBCASTINADDR_FAILED = 0xffffffffc000213b;
enum NWSAP_EVENT_CARDMALLOC_FAILED = 0xffffffffc000213c;
enum NWSAP_EVENT_NOCARDS = 0xffffffffc000213d;
enum NWSAP_EVENT_THREADEVENT_FAIL = 0xffffffffc000213e;
enum NWSAP_EVENT_RECVSEM_FAIL = 0xffffffffc000213f;
enum NWSAP_EVENT_SENDEVENT_FAIL = 0xffffffffc0002140;
enum NWSAP_EVENT_STARTRECEIVE_ERROR = 0xffffffffc0002141;
enum NWSAP_EVENT_STARTWORKER_ERROR = 0xffffffffc0002142;
enum NWSAP_EVENT_TABLE_MALLOC_FAILED = 0xffffffffc0002143;
enum NWSAP_EVENT_HASHTABLE_MALLOC_FAILED = 0xffffffffc0002144;
enum NWSAP_EVENT_STARTLPCWORKER_ERROR = 0xffffffffc0002145;
enum NWSAP_EVENT_CREATELPCPORT_ERROR = 0xffffffffc0002146;
enum NWSAP_EVENT_CREATELPCEVENT_ERROR = 0xffffffffc0002147;
enum NWSAP_EVENT_LPCLISTENMEMORY_ERROR = 0xffffffffc0002148;
enum NWSAP_EVENT_LPCHANDLEMEMORY_ERROR = 0xffffffffc0002149;
enum NWSAP_EVENT_BADWANFILTER_VALUE = 0xffffffffc000214a;
enum NWSAP_EVENT_CARDLISTEVENT_FAIL = 0xffffffffc000214b;
enum NWSAP_EVENT_SDMDEVENT_FAIL = 0xffffffffc000214c;
enum NWSAP_EVENT_INVALID_FILTERNAME = 0xffffffff8000214d;
enum NWSAP_EVENT_WANSEM_FAIL = 0xffffffffc000214e;
enum NWSAP_EVENT_WANSOCKET_FAILED = 0xffffffffc000214f;
enum NWSAP_EVENT_WANBIND_FAILED = 0xffffffffc0002150;
enum NWSAP_EVENT_STARTWANWORKER_ERROR = 0xffffffffc0002151;
enum NWSAP_EVENT_STARTWANCHECK_ERROR = 0xffffffffc0002152;
enum NWSAP_EVENT_OPTMAXADAPTERNUM_ERROR = 0xffffffffc0002153;
enum NWSAP_EVENT_WANHANDLEMEMORY_ERROR = 0xffffffffc0002154;
enum NWSAP_EVENT_WANEVENT_ERROR = 0xffffffffc0002155;
enum EVENT_TRANSPORT_RESOURCE_POOL = 0xffffffff80002329;
enum EVENT_TRANSPORT_RESOURCE_LIMIT = 0xffffffff8000232a;
enum EVENT_TRANSPORT_RESOURCE_SPECIFIC = 0xffffffff8000232b;
enum EVENT_TRANSPORT_REGISTER_FAILED = 0xffffffffc000232c;
enum EVENT_TRANSPORT_BINDING_FAILED = 0xffffffffc000232d;
enum EVENT_TRANSPORT_ADAPTER_NOT_FOUND = 0xffffffffc000232e;
enum EVENT_TRANSPORT_SET_OID_FAILED = 0xffffffffc000232f;
enum EVENT_TRANSPORT_QUERY_OID_FAILED = 0xffffffffc0002330;
enum EVENT_TRANSPORT_TRANSFER_DATA = 0x40002331;
enum EVENT_TRANSPORT_TOO_MANY_LINKS = 0x40002332;
enum EVENT_TRANSPORT_BAD_PROTOCOL = 0x40002333;
enum EVENT_IPX_NEW_DEFAULT_TYPE = 0x4000251d;
enum EVENT_IPX_SAP_ANNOUNCE = 0xffffffff8000251e;
enum EVENT_IPX_ILLEGAL_CONFIG = 0xffffffff8000251f;
enum EVENT_IPX_INTERNAL_NET_INVALID = 0xffffffffc0002520;
enum EVENT_IPX_NO_FRAME_TYPES = 0xffffffffc0002521;
enum EVENT_IPX_CREATE_DEVICE = 0xffffffffc0002522;
enum EVENT_IPX_NO_ADAPTERS = 0xffffffffc0002523;
enum EVENT_RPCSS_CREATEPROCESS_FAILURE = 0xffffffffc0002710;
enum EVENT_RPCSS_RUNAS_CREATEPROCESS_FAILURE = 0xffffffffc0002711;
enum EVENT_RPCSS_LAUNCH_ACCESS_DENIED = 0xffffffffc0002712;
enum EVENT_RPCSS_DEFAULT_LAUNCH_ACCESS_DENIED = 0xffffffffc0002713;
enum EVENT_RPCSS_RUNAS_CANT_LOGIN = 0xffffffffc0002714;
enum EVENT_RPCSS_START_SERVICE_FAILURE = 0xffffffffc0002715;
enum EVENT_RPCSS_REMOTE_SIDE_ERROR = 0xffffffffc0002716;
enum EVENT_RPCSS_ACTIVATION_ERROR = 0xffffffffc0002717;
enum EVENT_RPCSS_REMOTE_SIDE_ERROR_WITH_FILE = 0xffffffffc0002718;
enum EVENT_RPCSS_REMOTE_SIDE_UNAVAILABLE = 0xffffffffc0002719;
enum EVENT_RPCSS_SERVER_START_TIMEOUT = 0xffffffffc000271a;
enum EVENT_RPCSS_SERVER_NOT_RESPONDING = 0xffffffffc000271b;
enum EVENT_DCOM_ASSERTION_FAILURE = 0xffffffffc000271c;
enum EVENT_DCOM_INVALID_ENDPOINT_DATA = 0xffffffffc000271d;
enum EVENT_DCOM_COMPLUS_DISABLED = 0xffffffffc000271e;
enum EVENT_RPCSS_STOP_SERVICE_FAILURE = 0xffffffffc000272d;
enum EVENT_RPCSS_CREATEDEBUGGERPROCESS_FAILURE = 0xffffffffc000272e;
enum EVENT_DNS_CACHE_START_FAILURE_NO_DLL = 0xffffffffc0002af8;
enum EVENT_DNS_CACHE_START_FAILURE_NO_ENTRY = 0xffffffffc0002af9;
enum EVENT_DNS_CACHE_START_FAILURE_NO_CONTROL = 0xffffffffc0002afa;
enum EVENT_DNS_CACHE_START_FAILURE_NO_DONE_EVENT = 0xffffffffc0002afb;
enum EVENT_DNS_CACHE_START_FAILURE_NO_RPC = 0xffffffffc0002afc;
enum EVENT_DNS_CACHE_START_FAILURE_NO_SHUTDOWN_NOTIFY = 0xffffffffc0002afd;
enum EVENT_DNS_CACHE_START_FAILURE_NO_UPDATE = 0xffffffffc0002afe;
enum EVENT_DNS_CACHE_START_FAILURE_LOW_MEMORY = 0xffffffffc0002aff;
enum EVENT_DNS_CACHE_NETWORK_PERF_WARNING = 0xffffffff80002b2a;
enum EVENT_DNS_CACHE_UNABLE_TO_REACH_SERVER_WARNING = 0xffffffff80002b2b;
enum EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT = 0xffffffff80002b8e;
enum EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL = 0xffffffff80002b8f;
enum EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP = 0xffffffff80002b90;
enum EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED = 0xffffffff80002b91;
enum EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY = 0xffffffff80002b92;
enum EVENT_DNSAPI_REGISTRATION_FAILED_OTHER = 0xffffffff80002b93;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_TIMEOUT = 0xffffffff80002b94;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SERVERFAIL = 0xffffffff80002b95;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_NOTSUPP = 0xffffffff80002b96;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_REFUSED = 0xffffffff80002b97;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SECURITY = 0xffffffff80002b98;
enum EVENT_DNSAPI_PTR_REGISTRATION_FAILED_OTHER = 0xffffffff80002b99;
enum EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT_PRIMARY_DN = 0xffffffff80002b9a;
enum EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN = 0xffffffff80002b9b;
enum EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP_PRIMARY_DN = 0xffffffff80002b9c;
enum EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED_PRIMARY_DN = 0xffffffff80002b9d;
enum EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY_PRIMARY_DN = 0xffffffff80002b9e;
enum EVENT_DNSAPI_REGISTRATION_FAILED_OTHER_PRIMARY_DN = 0xffffffff80002b9f;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT = 0xffffffff80002bac;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL = 0xffffffff80002bad;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP = 0xffffffff80002bae;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED = 0xffffffff80002baf;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY = 0xffffffff80002bb0;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER = 0xffffffff80002bb1;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_TIMEOUT = 0xffffffff80002bb2;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SERVERFAIL = 0xffffffff80002bb3;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_NOTSUPP = 0xffffffff80002bb4;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_REFUSED = 0xffffffff80002bb5;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SECURITY = 0xffffffff80002bb6;
enum EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_OTHER = 0xffffffff80002bb7;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT_PRIMARY_DN = 0xffffffff80002bb8;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN = 0xffffffff80002bb9;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP_PRIMARY_DN = 0xffffffff80002bba;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED_PRIMARY_DN = 0xffffffff80002bbb;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY_PRIMARY_DN = 0xffffffff80002bbc;
enum EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER_PRIMARY_DN = 0xffffffff80002bbd;
enum EVENT_DNSAPI_REGISTERED_ADAPTER = 0x40002bc0;
enum EVENT_DNSAPI_REGISTERED_PTR = 0x40002bc1;
enum EVENT_DNSAPI_REGISTERED_ADAPTER_PRIMARY_DN = 0x40002bc2;
enum EVENT_TRK_INTERNAL_ERROR = 0xffffffffc00030d4;
enum EVENT_TRK_SERVICE_START_SUCCESS = 0x400030d5;
enum EVENT_TRK_SERVICE_START_FAILURE = 0xffffffffc00030d6;
enum EVENT_TRK_SERVICE_CORRUPT_LOG = 0xffffffffc00030d7;
enum EVENT_TRK_SERVICE_VOL_QUOTA_EXCEEDED = 0xffffffff800030d8;
enum EVENT_TRK_SERVICE_VOLUME_CREATE = 0x400030d9;
enum EVENT_TRK_SERVICE_VOLUME_CLAIM = 0x400030da;
enum EVENT_TRK_SERVICE_DUPLICATE_VOLIDS = 0x400030db;
enum EVENT_TRK_SERVICE_MOVE_QUOTA_EXCEEDED = 0xffffffff800030dc;
enum EVENT_FRS_ERROR = 0xffffffffc00034bc;
enum EVENT_FRS_STARTING = 0x400034bd;
enum EVENT_FRS_STOPPING = 0x400034be;
enum EVENT_FRS_STOPPED = 0x400034bf;
enum EVENT_FRS_STOPPED_FORCE = 0xffffffffc00034c0;
enum EVENT_FRS_STOPPED_ASSERT = 0xffffffffc00034c1;
enum EVENT_FRS_ASSERT = 0xffffffffc00034c2;
enum EVENT_FRS_VOLUME_NOT_SUPPORTED = 0xffffffffc00034c3;
enum EVENT_FRS_LONG_JOIN = 0xffffffff800034c4;
enum EVENT_FRS_LONG_JOIN_DONE = 0xffffffff800034c5;
enum EVENT_FRS_CANNOT_COMMUNICATE = 0xffffffffc00034c6;
enum EVENT_FRS_DATABASE_SPACE = 0xffffffffc00034c7;
enum EVENT_FRS_DISK_WRITE_CACHE_ENABLED = 0xffffffff800034c8;
enum EVENT_FRS_JET_1414 = 0xffffffffc00034c9;
enum EVENT_FRS_SYSVOL_NOT_READY = 0xffffffff800034ca;
enum EVENT_FRS_SYSVOL_NOT_READY_PRIMARY = 0xffffffff800034cb;
enum EVENT_FRS_SYSVOL_READY = 0x400034cc;
enum EVENT_FRS_ACCESS_CHECKS_DISABLED = 0xffffffff800034cd;
enum EVENT_FRS_ACCESS_CHECKS_FAILED_USER = 0xffffffff800034ce;
enum EVENT_FRS_ACCESS_CHECKS_FAILED_UNKNOWN = 0xffffffffc00034cf;
enum EVENT_FRS_MOVED_PREEXISTING = 0xffffffff800034d0;
enum EVENT_FRS_CANNOT_START_BACKUP_RESTORE_IN_PROGRESS = 0xffffffffc00034d1;
enum EVENT_FRS_STAGING_AREA_FULL = 0xffffffff800034d2;
enum EVENT_FRS_HUGE_FILE = 0xffffffff800034d3;
enum EVENT_FRS_CANNOT_CREATE_UUID = 0xffffffffc00034d4;
enum EVENT_FRS_NO_DNS_ATTRIBUTE = 0xffffffff800034d5;
enum EVENT_FRS_NO_SID = 0xffffffffc00034d6;
enum NTFRSPRF_OPEN_RPC_BINDING_ERROR_SET = 0xffffffffc00034d7;
enum NTFRSPRF_OPEN_RPC_BINDING_ERROR_CONN = 0xffffffffc00034d8;
enum NTFRSPRF_OPEN_RPC_CALL_ERROR_SET = 0xffffffffc00034d9;
enum NTFRSPRF_OPEN_RPC_CALL_ERROR_CONN = 0xffffffffc00034da;
enum NTFRSPRF_COLLECT_RPC_BINDING_ERROR_SET = 0xffffffffc00034db;
enum NTFRSPRF_COLLECT_RPC_BINDING_ERROR_CONN = 0xffffffffc00034dc;
enum NTFRSPRF_COLLECT_RPC_CALL_ERROR_SET = 0xffffffffc00034dd;
enum NTFRSPRF_COLLECT_RPC_CALL_ERROR_CONN = 0xffffffffc00034de;
enum NTFRSPRF_VIRTUALALLOC_ERROR_SET = 0xffffffffc00034df;
enum NTFRSPRF_VIRTUALALLOC_ERROR_CONN = 0xffffffffc00034e0;
enum NTFRSPRF_REGISTRY_ERROR_SET = 0xffffffffc00034e1;
enum NTFRSPRF_REGISTRY_ERROR_CONN = 0xffffffffc00034e2;
enum EVENT_FRS_ROOT_NOT_VALID = 0xffffffffc00034e3;
enum EVENT_FRS_STAGE_NOT_VALID = 0xffffffffc00034e4;
enum EVENT_FRS_OVERLAPS_LOGGING = 0xffffffffc00034e5;
enum EVENT_FRS_OVERLAPS_WORKING = 0xffffffffc00034e6;
enum EVENT_FRS_OVERLAPS_STAGE = 0xffffffffc00034e7;
enum EVENT_FRS_OVERLAPS_ROOT = 0xffffffffc00034e8;
enum EVENT_FRS_OVERLAPS_OTHER_STAGE = 0xffffffffc00034e9;
enum EVENT_FRS_PREPARE_ROOT_FAILED = 0xffffffffc00034ea;
enum EVENT_FRS_BAD_REG_DATA = 0xffffffff800034eb;
enum EVENT_FRS_JOIN_FAIL_TIME_SKEW = 0xffffffffc00034ec;
enum EVENT_FRS_RMTCO_TIME_SKEW = 0xffffffffc00034ed;
enum EVENT_FRS_CANT_OPEN_STAGE = 0xffffffffc00034ee;
enum EVENT_FRS_CANT_OPEN_PREINSTALL = 0xffffffffc00034ef;
enum EVENT_FRS_REPLICA_SET_CREATE_FAIL = 0xffffffffc00034f0;
enum EVENT_FRS_REPLICA_SET_CREATE_OK = 0x400034f1;
enum EVENT_FRS_REPLICA_SET_CXTIONS = 0x400034f2;
enum EVENT_FRS_IN_ERROR_STATE = 0xffffffffc00034f3;
enum EVENT_FRS_REPLICA_NO_ROOT_CHANGE = 0xffffffffc00034f4;
enum EVENT_FRS_DUPLICATE_IN_CXTION_SYSVOL = 0xffffffffc00034f5;
enum EVENT_FRS_DUPLICATE_IN_CXTION = 0xffffffffc00034f6;
enum EVENT_FRS_ROOT_HAS_MOVED = 0xffffffffc00034f7;
enum EVENT_FRS_ERROR_REPLICA_SET_DELETED = 0xffffffff800034f8;
enum EVENT_FRS_REPLICA_IN_JRNL_WRAP_ERROR = 0xffffffffc00034f9;
enum EVENT_FRS_DS_POLL_ERROR_SUMMARY = 0xffffffff800034fa;
enum EVENT_PS_GPC_REGISTER_FAILED = 0xffffffffc00036b0;
enum EVENT_PS_NO_RESOURCES_FOR_INIT = 0xffffffffc00036b1;
enum EVENT_PS_REGISTER_PROTOCOL_FAILED = 0xffffffffc00036b2;
enum EVENT_PS_REGISTER_MINIPORT_FAILED = 0xffffffffc00036b3;
enum EVENT_PS_BAD_BESTEFFORT_LIMIT = 0xffffffff80003714;
enum EVENT_PS_QUERY_OID_GEN_MAXIMUM_FRAME_SIZE = 0xffffffffc0003715;
enum EVENT_PS_QUERY_OID_GEN_MAXIMUM_TOTAL_SIZE = 0xffffffffc0003716;
enum EVENT_PS_QUERY_OID_GEN_LINK_SPEED = 0xffffffffc0003717;
enum EVENT_PS_BINDING_FAILED = 0xffffffffc0003718;
enum EVENT_PS_MISSING_ADAPTER_REGISTRY_DATA = 0xffffffffc0003719;
enum EVENT_PS_REGISTER_ADDRESS_FAMILY_FAILED = 0xffffffffc000371a;
enum EVENT_PS_INIT_DEVICE_FAILED = 0xffffffffc000371b;
enum EVENT_PS_WMI_INSTANCE_NAME_FAILED = 0xffffffffc000371c;
enum EVENT_PS_WAN_LIMITED_BESTEFFORT = 0xffffffff8000371d;
enum EVENT_PS_RESOURCE_POOL = 0xffffffffc000371e;
enum EVENT_PS_ADMISSIONCONTROL_OVERFLOW = 0xffffffff8000371f;
enum EVENT_PS_NETWORK_ADDRESS_FAIL = 0xffffffffc0003720;
enum EXTRA_EXIT_POINT = 0xffffffffc00037dc;
enum MISSING_EXIT_POINT = 0xffffffffc00037dd;
enum MISSING_VOLUME = 0xffffffffc00037de;
enum EXTRA_VOLUME = 0xffffffffc00037df;
enum EXTRA_EXIT_POINT_DELETED = 0xffffffffc00037e0;
enum EXTRA_EXIT_POINT_NOT_DELETED = 0xffffffffc00037e1;
enum MISSING_EXIT_POINT_CREATED = 0xffffffffc00037e2;
enum MISSING_EXIT_POINT_NOT_CREATED = 0xffffffffc00037e3;
enum MISSING_VOLUME_CREATED = 0xffffffffc00037e4;
enum MISSING_VOLUME_NOT_CREATED = 0xffffffffc00037e5;
enum EXTRA_VOLUME_DELETED = 0xffffffffc00037e6;
enum EXTRA_VOLUME_NOT_DELETED = 0xffffffffc00037e7;
enum COULD_NOT_VERIFY_VOLUMES = 0xffffffffc00037e8;
enum KNOWLEDGE_INCONSISTENCY_DETECTED = 0xffffffffc00037e9;
enum PREFIX_MISMATCH = 0xffffffffc00037ea;
enum PREFIX_MISMATCH_FIXED = 0xffffffffc00037eb;
enum PREFIX_MISMATCH_NOT_FIXED = 0xffffffffc00037ec;
enum MACHINE_UNJOINED = 0xffffffffc00037ed;
enum DFS_REFERRAL_REQUEST = 0x400037ee;
enum NOT_A_DFS_PATH = 0x40003840;
enum LM_REDIR_FAILURE = 0x40003841;
enum DFS_CONNECTION_FAILURE = 0x40003842;
enum DFS_REFERRAL_FAILURE = 0x40003843;
enum DFS_REFERRAL_SUCCESS = 0x40003844;
enum DFS_MAX_DNR_ATTEMPTS = 0x40003845;
enum DFS_SPECIAL_REFERRAL_FAILURE = 0x40003846;
enum DFS_OPEN_FAILURE = 0x40003847;
enum NET_DFS_ENUM = 0x400038a4;
enum NET_DFS_ENUMEX = 0x400038a5;
enum DFS_ERROR_CREATE_REPARSEPOINT_FAILURE = 0xffffffffc00038a7;
enum DFS_ERROR_UNSUPPORTED_FILESYSTEM = 0xffffffffc00038a8;
enum DFS_ERROR_OVERLAPPING_DIRECTORIES = 0xffffffffc00038a9;
enum DFS_INFO_ACTIVEDIRECTORY_ONLINE = 0x400038ac;
enum DFS_ERROR_TOO_MANY_ERRORS = 0xffffffffc00038ad;
enum DFS_ERROR_WINSOCKINIT_FAILED = 0xffffffffc00038ae;
enum DFS_ERROR_SECURITYINIT_FAILED = 0xffffffffc00038af;
enum DFS_ERROR_THREADINIT_FAILED = 0xffffffffc00038b0;
enum DFS_ERROR_SITECACHEINIT_FAILED = 0xffffffffc00038b1;
enum DFS_ERROR_ROOTSYNCINIT_FAILED = 0xffffffffc00038b2;
enum DFS_ERROR_CREATEEVENT_FAILED = 0xffffffffc00038b3;
enum DFS_ERROR_COMPUTERINFO_FAILED = 0xffffffffc00038b4;
enum DFS_ERROR_CLUSTERINFO_FAILED = 0xffffffffc00038b5;
enum DFS_ERROR_DCINFO_FAILED = 0xffffffffc00038b6;
enum DFS_ERROR_PREFIXTABLE_FAILED = 0xffffffffc00038b7;
enum DFS_ERROR_HANDLENAMESPACE_FAILED = 0xffffffffc00038b8;
enum DFS_ERROR_REGISTERSTORE_FAILED = 0xffffffffc00038b9;
enum DFS_ERROR_REFLECTIONENGINE_FAILED = 0xffffffffc00038ba;
enum DFS_ERROR_ACTIVEDIRECTORY_OFFLINE = 0xffffffffc00038bb;
enum DFS_ERROR_SITESUPPOR_FAILED = 0xffffffffc00038bc;
enum DFS_ERROR_DSCONNECT_FAILED = 0xffffffff800038be;
enum DFS_INFO_DS_RECONNECTED = 0x400038c1;
enum DFS_ERROR_NO_DFS_DATA = 0xffffffffc00038c2;
enum DFS_INFO_FINISH_INIT = 0x400038c3;
enum DFS_INFO_RECONNECT_DATA = 0x400038c4;
enum DFS_INFO_FINISH_BUILDING_NAMESPACE = 0x400038c5;
enum DFS_ERROR_ON_ROOT = 0xffffffff800038c6;
enum DFS_ERROR_MUTLIPLE_ROOTS_NOT_SUPPORTED = 0xffffffffc00038c7;
enum DFS_WARN_DOMAIN_REFERRAL_OVERFLOW = 0xffffffff800038c8;
enum DFS_INFO_DOMAIN_REFERRAL_MIN_OVERFLOW = 0x400038c9;
enum DFS_WARN_INCOMPLETE_MOVE = 0xffffffff800038ca;
enum DFS_ERROR_RESYNCHRONIZE_FAILED = 0xffffffffc00038cb;
enum DFS_ERROR_REMOVE_LINK_FAILED = 0xffffffffc00038cc;
enum DFS_WARN_METADATA_LINK_TYPE_INCORRECT = 0xffffffff800038cd;
enum DFS_WARN_METADATA_LINK_INFO_INVALID = 0xffffffff800038ce;
enum DFS_ERROR_TARGET_LIST_INCORRECT = 0xffffffffc00038cf;
enum DFS_ERROR_LINKS_OVERLAP = 0xffffffffc00038d0;
enum DFS_ERROR_LINK_OVERLAP = 0xffffffffc00038d1;
enum DFS_ERROR_CREATE_REPARSEPOINT_SUCCESS = 0x400038d2;
enum DFS_ERROR_DUPLICATE_LINK = 0xffffffffc00038d3;
enum DFS_ERROR_TRUSTED_DOMAIN_INFO_FAILED = 0xffffffffc00038d4;
enum DFS_INFO_TRUSTED_DOMAIN_INFO_SUCCESS = 0x400038d5;
enum DFS_ERROR_CROSS_FOREST_TRUST_INFO_FAILED = 0xffffffffc00038d6;
enum DFS_INFO_CROSS_FOREST_TRUST_INFO_SUCCESS = 0x400038d7;
enum DFS_INIT_SUCCESS = 0x400038d8;
enum DFS_ROOT_SHARE_ACQUIRE_FAILED = 0xffffffff800038d9;
enum DFS_ROOT_SHARE_ACQUIRE_SUCCESS = 0x400038da;
enum EVENT_BRIDGE_PROTOCOL_REGISTER_FAILED = 0xffffffffc0003908;
enum EVENT_BRIDGE_MINIPROT_DEVNAME_MISSING = 0xffffffffc0003909;
enum EVENT_BRIDGE_MINIPORT_REGISTER_FAILED = 0xffffffffc000390a;
enum EVENT_BRIDGE_DEVICE_CREATION_FAILED = 0xffffffffc000390b;
enum EVENT_BRIDGE_NO_BRIDGE_MAC_ADDR = 0xffffffffc000390c;
enum EVENT_BRIDGE_MINIPORT_INIT_FAILED = 0xffffffffc000390d;
enum EVENT_BRIDGE_ETHERNET_NOT_OFFERED = 0xffffffffc000390e;
enum EVENT_BRIDGE_THREAD_CREATION_FAILED = 0xffffffffc000390f;
enum EVENT_BRIDGE_THREAD_REF_FAILED = 0xffffffffc0003910;
enum EVENT_BRIDGE_PACKET_POOL_CREATION_FAILED = 0xffffffffc0003911;
enum EVENT_BRIDGE_BUFFER_POOL_CREATION_FAILED = 0xffffffffc0003912;
enum EVENT_BRIDGE_INIT_MALLOC_FAILED = 0xffffffffc0003913;
enum EVENT_BRIDGE_ADAPTER_LINK_SPEED_QUERY_FAILED = 0xffffffffc000396c;
enum EVENT_BRIDGE_ADAPTER_MAC_ADDR_QUERY_FAILED = 0xffffffffc000396d;
enum EVENT_BRIDGE_ADAPTER_FILTER_FAILED = 0xffffffffc000396e;
enum EVENT_BRIDGE_ADAPTER_NAME_QUERY_FAILED = 0xffffffffc000396f;
enum EVENT_BRIDGE_ADAPTER_BIND_FAILED = 0xffffffffc0003970;
enum EVENT_DAV_REDIR_DELAYED_WRITE_FAILED = 0xffffffff800039d0;
enum EVENT_WEBCLIENT_CLOSE_PUT_FAILED = 0xffffffff80003a35;
enum EVENT_WEBCLIENT_CLOSE_DELETE_FAILED = 0xffffffff80003a36;
enum EVENT_WEBCLIENT_CLOSE_PROPPATCH_FAILED = 0xffffffff80003a37;
enum EVENT_WEBCLIENT_SETINFO_PROPPATCH_FAILED = 0xffffffff80003a38;
enum EVENT_WSK_OWNINGTHREAD_PARAMETER_IGNORED = 0xffffffffc0003e80;
enum EVENT_WINSOCK_TDI_FILTER_DETECTED = 0xffffffff80003e81;
enum EVENT_WINSOCK_CLOSESOCKET_STUCK = 0xffffffff80003e82;
enum EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_NO_CHANGE = 0x40004074;
enum EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_WITH_CHANGE = 0x40004075;
enum EVENT_EQOS_INFO_USER_POLICY_REFRESH_NO_CHANGE = 0x40004076;
enum EVENT_EQOS_INFO_USER_POLICY_REFRESH_WITH_CHANGE = 0x40004077;
enum EVENT_EQOS_INFO_TCP_AUTOTUNING_NOT_CONFIGURED = 0x40004078;
enum EVENT_EQOS_INFO_TCP_AUTOTUNING_OFF = 0x40004079;
enum EVENT_EQOS_INFO_TCP_AUTOTUNING_HIGHLY_RESTRICTED = 0x4000407a;
enum EVENT_EQOS_INFO_TCP_AUTOTUNING_RESTRICTED = 0x4000407b;
enum EVENT_EQOS_INFO_TCP_AUTOTUNING_NORMAL = 0x4000407c;
enum EVENT_EQOS_INFO_APP_MARKING_NOT_CONFIGURED = 0x4000407d;
enum EVENT_EQOS_INFO_APP_MARKING_IGNORED = 0x4000407e;
enum EVENT_EQOS_INFO_APP_MARKING_ALLOWED = 0x4000407f;
enum EVENT_EQOS_INFO_LOCAL_SETTING_DONT_USE_NLA = 0x40004080;
enum EVENT_EQOS_URL_QOS_APPLICATION_CONFLICT = 0x40004081;
enum EVENT_EQOS_WARNING_TEST_1 = 0xffffffff800040d8;
enum EVENT_EQOS_WARNING_TEST_2 = 0xffffffff800040d9;
enum EVENT_EQOS_WARNING_MACHINE_POLICY_VERSION = 0xffffffff800040da;
enum EVENT_EQOS_WARNING_USER_POLICY_VERSION = 0xffffffff800040db;
enum EVENT_EQOS_WARNING_MACHINE_POLICY_PROFILE_NOT_SPECIFIED = 0xffffffff800040dc;
enum EVENT_EQOS_WARNING_USER_POLICY_PROFILE_NOT_SPECIFIED = 0xffffffff800040dd;
enum EVENT_EQOS_WARNING_MACHINE_POLICY_QUOTA_EXCEEDED = 0xffffffff800040de;
enum EVENT_EQOS_WARNING_USER_POLICY_QUOTA_EXCEEDED = 0xffffffff800040df;
enum EVENT_EQOS_WARNING_MACHINE_POLICY_CONFLICT = 0xffffffff800040e0;
enum EVENT_EQOS_WARNING_USER_POLICY_CONFLICT = 0xffffffff800040e1;
enum EVENT_EQOS_WARNING_MACHINE_POLICY_NO_FULLPATH_APPNAME = 0xffffffff800040e2;
enum EVENT_EQOS_WARNING_USER_POLICY_NO_FULLPATH_APPNAME = 0xffffffff800040e3;
enum EVENT_EQOS_ERROR_MACHINE_POLICY_REFERESH = 0xffffffffc000413c;
enum EVENT_EQOS_ERROR_USER_POLICY_REFERESH = 0xffffffffc000413d;
enum EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_ROOT_KEY = 0xffffffffc000413e;
enum EVENT_EQOS_ERROR_OPENING_USER_POLICY_ROOT_KEY = 0xffffffffc000413f;
enum EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_TOO_LONG = 0xffffffffc0004140;
enum EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_TOO_LONG = 0xffffffffc0004141;
enum EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_SIZE_ZERO = 0xffffffffc0004142;
enum EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_SIZE_ZERO = 0xffffffffc0004143;
enum EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_SUBKEY = 0xffffffffc0004144;
enum EVENT_EQOS_ERROR_OPENING_USER_POLICY_SUBKEY = 0xffffffffc0004145;
enum EVENT_EQOS_ERROR_PROCESSING_MACHINE_POLICY_FIELD = 0xffffffffc0004146;
enum EVENT_EQOS_ERROR_PROCESSING_USER_POLICY_FIELD = 0xffffffffc0004147;
enum EVENT_EQOS_ERROR_SETTING_TCP_AUTOTUNING = 0xffffffffc0004148;
enum EVENT_EQOS_ERROR_SETTING_APP_MARKING = 0xffffffffc0004149;
enum EVENT_WINNAT_SESSION_LIMIT_REACHED = 0xffffffff80004268;
enum HARDWARE_ADDRESS_LENGTH = 0x00000006;
enum NETMAN_VARTYPE_ULONG = 0x00000000;
enum NETMAN_VARTYPE_HARDWARE_ADDRESS = 0x00000001;
enum NETMAN_VARTYPE_STRING = 0x00000002;
enum REPL_ROLE_EXPORT = 0x00000001;
enum REPL_ROLE_IMPORT = 0x00000002;
enum REPL_ROLE_BOTH = 0x00000003;
enum REPL_INTERVAL_INFOLEVEL = 0x000003e8;
enum REPL_PULSE_INFOLEVEL = 0x000003e9;
enum REPL_GUARDTIME_INFOLEVEL = 0x000003ea;
enum REPL_RANDOM_INFOLEVEL = 0x000003eb;
enum REPL_INTEGRITY_FILE = 0x00000001;
enum REPL_INTEGRITY_TREE = 0x00000002;
enum REPL_EXTENT_FILE = 0x00000001;
enum REPL_EXTENT_TREE = 0x00000002;
enum REPL_EXPORT_INTEGRITY_INFOLEVEL = 0x000003e8;
enum REPL_EXPORT_EXTENT_INFOLEVEL = 0x000003e9;
enum REPL_UNLOCK_NOFORCE = 0x00000000;
enum REPL_UNLOCK_FORCE = 0x00000001;
enum REPL_STATE_OK = 0x00000000;
enum REPL_STATE_NO_MASTER = 0x00000001;
enum REPL_STATE_NO_SYNC = 0x00000002;
enum REPL_STATE_NEVER_REPLICATED = 0x00000003;
enum SERVICE_WORKSTATION = "LanmanWorkstation";
enum SERVICE_LM20_WORKSTATION = "WORKSTATION";
enum WORKSTATION_DISPLAY_NAME = "Workstation";
enum SERVICE_SERVER = "LanmanServer";
enum SERVICE_LM20_SERVER = "SERVER";
enum SERVER_DISPLAY_NAME = "Server";
enum SERVICE_BROWSER = "BROWSER";
enum SERVICE_LM20_BROWSER = "BROWSER";
enum SERVICE_MESSENGER = "MESSENGER";
enum SERVICE_LM20_MESSENGER = "MESSENGER";
enum SERVICE_NETRUN = "NETRUN";
enum SERVICE_LM20_NETRUN = "NETRUN";
enum SERVICE_SPOOLER = "SPOOLER";
enum SERVICE_LM20_SPOOLER = "SPOOLER";
enum SERVICE_ALERTER = "ALERTER";
enum SERVICE_LM20_ALERTER = "ALERTER";
enum SERVICE_NETLOGON = "NETLOGON";
enum SERVICE_LM20_NETLOGON = "NETLOGON";
enum SERVICE_NETPOPUP = "NETPOPUP";
enum SERVICE_LM20_NETPOPUP = "NETPOPUP";
enum SERVICE_SQLSERVER = "SQLSERVER";
enum SERVICE_LM20_SQLSERVER = "SQLSERVER";
enum SERVICE_REPL = "REPLICATOR";
enum SERVICE_LM20_REPL = "REPLICATOR";
enum SERVICE_RIPL = "REMOTEBOOT";
enum SERVICE_LM20_RIPL = "REMOTEBOOT";
enum SERVICE_TIMESOURCE = "TIMESOURCE";
enum SERVICE_LM20_TIMESOURCE = "TIMESOURCE";
enum SERVICE_AFP = "AFP";
enum SERVICE_LM20_AFP = "AFP";
enum SERVICE_UPS = "UPS";
enum SERVICE_LM20_UPS = "UPS";
enum SERVICE_XACTSRV = "XACTSRV";
enum SERVICE_LM20_XACTSRV = "XACTSRV";
enum SERVICE_TCPIP = "TCPIP";
enum SERVICE_LM20_TCPIP = "TCPIP";
enum SERVICE_NBT = "NBT";
enum SERVICE_LM20_NBT = "NBT";
enum SERVICE_LMHOSTS = "LMHOSTS";
enum SERVICE_LM20_LMHOSTS = "LMHOSTS";
enum SERVICE_TELNET = "Telnet";
enum SERVICE_LM20_TELNET = "Telnet";
enum SERVICE_SCHEDULE = "Schedule";
enum SERVICE_LM20_SCHEDULE = "Schedule";
enum SERVICE_NTLMSSP = "NtLmSsp";
enum SERVICE_DHCP = "DHCP";
enum SERVICE_LM20_DHCP = "DHCP";
enum SERVICE_NWSAP = "NwSapAgent";
enum SERVICE_LM20_NWSAP = "NwSapAgent";
enum NWSAP_DISPLAY_NAME = "NW Sap Agent";
enum SERVICE_NWCS = "NWCWorkstation";
enum SERVICE_DNS_CACHE = "DnsCache";
enum SERVICE_W32TIME = "w32time";
enum SERVCE_LM20_W32TIME = "w32time";
enum SERVICE_KDC = "kdc";
enum SERVICE_LM20_KDC = "kdc";
enum SERVICE_RPCLOCATOR = "RPCLOCATOR";
enum SERVICE_LM20_RPCLOCATOR = "RPCLOCATOR";
enum SERVICE_TRKSVR = "TrkSvr";
enum SERVICE_LM20_TRKSVR = "TrkSvr";
enum SERVICE_TRKWKS = "TrkWks";
enum SERVICE_LM20_TRKWKS = "TrkWks";
enum SERVICE_NTFRS = "NtFrs";
enum SERVICE_LM20_NTFRS = "NtFrs";
enum SERVICE_ISMSERV = "IsmServ";
enum SERVICE_LM20_ISMSERV = "IsmServ";
enum SERVICE_NTDS = "NTDS";
enum SERVICE_LM20_NTDS = "NTDS";
enum SERVICE_ADWS = "ADWS";
enum SERVICE_DSROLE = "DsRoleSvc";
enum SERVICE_LM20_DSROLE = "DsRoleSvc";
enum NETCFG_E_ALREADY_INITIALIZED = 0xffffffff8004a020;
enum NETCFG_E_NOT_INITIALIZED = 0xffffffff8004a021;
enum NETCFG_E_IN_USE = 0xffffffff8004a022;
enum NETCFG_E_NO_WRITE_LOCK = 0xffffffff8004a024;
enum NETCFG_E_NEED_REBOOT = 0xffffffff8004a025;
enum NETCFG_E_ACTIVE_RAS_CONNECTIONS = 0xffffffff8004a026;
enum NETCFG_E_ADAPTER_NOT_FOUND = 0xffffffff8004a027;
enum NETCFG_E_COMPONENT_REMOVED_PENDING_REBOOT = 0xffffffff8004a028;
enum NETCFG_E_MAX_FILTER_LIMIT = 0xffffffff8004a029;
enum NETCFG_E_VMSWITCH_ACTIVE_OVER_ADAPTER = 0xffffffff8004a02a;
enum NETCFG_E_DUPLICATE_INSTANCEID = 0xffffffff8004a02b;
enum NETCFG_S_REBOOT = 0x0004a020;
enum NETCFG_S_DISABLE_QUERY = 0x0004a022;
enum NETCFG_S_STILL_REFERENCED = 0x0004a023;
enum NETCFG_S_CAUSED_SETUP_CHANGE = 0x0004a024;
enum NETCFG_S_COMMIT_NOW = 0x0004a025;
enum NETCFG_CLIENT_CID_MS_MSClient = "ms_msclient";
enum NETCFG_SERVICE_CID_MS_SERVER = "ms_server";
enum NETCFG_SERVICE_CID_MS_NETBIOS = "ms_netbios";
enum NETCFG_SERVICE_CID_MS_PSCHED = "ms_pschedpc";
enum NETCFG_SERVICE_CID_MS_WLBS = "ms_wlbs";
enum NETCFG_TRANS_CID_MS_APPLETALK = "ms_appletalk";
enum NETCFG_TRANS_CID_MS_NETBEUI = "ms_netbeui";
enum NETCFG_TRANS_CID_MS_NETMON = "ms_netmon";
enum NETCFG_TRANS_CID_MS_NWIPX = "ms_nwipx";
enum NETCFG_TRANS_CID_MS_NWSPX = "ms_nwspx";
enum NETCFG_TRANS_CID_MS_TCPIP = "ms_tcpip";
enum WZC_PROFILE_SUCCESS = 0x00000000;
enum WZC_PROFILE_XML_ERROR_NO_VERSION = 0x00000001;
enum WZC_PROFILE_XML_ERROR_BAD_VERSION = 0x00000002;
enum WZC_PROFILE_XML_ERROR_UNSUPPORTED_VERSION = 0x00000003;
enum WZC_PROFILE_XML_ERROR_SSID_NOT_FOUND = 0x00000004;
enum WZC_PROFILE_XML_ERROR_BAD_SSID = 0x00000005;
enum WZC_PROFILE_XML_ERROR_CONNECTION_TYPE = 0x00000006;
enum WZC_PROFILE_XML_ERROR_AUTHENTICATION = 0x00000007;
enum WZC_PROFILE_XML_ERROR_ENCRYPTION = 0x00000008;
enum WZC_PROFILE_XML_ERROR_KEY_PROVIDED_AUTOMATICALLY = 0x00000009;
enum WZC_PROFILE_XML_ERROR_1X_ENABLED = 0x0000000a;
enum WZC_PROFILE_XML_ERROR_EAP_METHOD = 0x0000000b;
enum WZC_PROFILE_XML_ERROR_BAD_KEY_INDEX = 0x0000000c;
enum WZC_PROFILE_XML_ERROR_KEY_INDEX_RANGE = 0x0000000d;
enum WZC_PROFILE_XML_ERROR_BAD_NETWORK_KEY = 0x0000000e;
enum WZC_PROFILE_CONFIG_ERROR_INVALID_AUTH_FOR_CONNECTION_TYPE = 0x0000000f;
enum WZC_PROFILE_CONFIG_ERROR_INVALID_ENCRYPTION_FOR_AUTHMODE = 0x00000010;
enum WZC_PROFILE_CONFIG_ERROR_KEY_REQUIRED = 0x00000011;
enum WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_REQUIRED = 0x00000012;
enum WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_NOT_APPLICABLE = 0x00000013;
enum WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED = 0x00000014;
enum WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED_KEY_REQUIRED = 0x00000015;
enum WZC_PROFILE_CONFIG_ERROR_1X_NOT_ENABLED_KEY_PROVIDED = 0x00000016;
enum WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_REQUIRED = 0x00000017;
enum WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_NOT_APPLICABLE = 0x00000018;
enum WZC_PROFILE_CONFIG_ERROR_WPA_NOT_SUPPORTED = 0x00000019;
enum WZC_PROFILE_CONFIG_ERROR_WPA_ENCRYPTION_NOT_SUPPORTED = 0x0000001a;
enum WZC_PROFILE_SET_ERROR_DUPLICATE_NETWORK = 0x0000001b;
enum WZC_PROFILE_SET_ERROR_MEMORY_ALLOCATION = 0x0000001c;
enum WZC_PROFILE_SET_ERROR_READING_1X_CONFIG = 0x0000001d;
enum WZC_PROFILE_SET_ERROR_WRITING_1X_CONFIG = 0x0000001e;
enum WZC_PROFILE_SET_ERROR_WRITING_WZC_CFG = 0x0000001f;
enum WZC_PROFILE_API_ERROR_NOT_SUPPORTED = 0x00000020;
enum WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_XML = 0x00000021;
enum WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_SCHEMA = 0x00000022;
enum WZC_PROFILE_API_ERROR_XML_VALIDATION_FAILED = 0x00000023;
enum WZC_PROFILE_API_ERROR_INTERNAL = 0x00000024;
enum RF_ROUTING = 0x00000001;
enum RF_ROUTINGV6 = 0x00000002;
enum RF_DEMAND_UPDATE_ROUTES = 0x00000004;
enum RF_ADD_ALL_INTERFACES = 0x00000010;
enum RF_MULTICAST = 0x00000020;
enum RF_POWER = 0x00000040;
enum MS_ROUTER_VERSION = 0x00000600;
enum ROUTING_DOMAIN_INFO_REVISION_1 = 0x00000001;
enum INTERFACE_INFO_REVISION_1 = 0x00000001;
enum IR_PROMISCUOUS = 0x00000000;
enum IR_PROMISCUOUS_MULTICAST = 0x00000001;
enum PROTO_IP_MSDP = 0x00000009;
enum PROTO_IP_IGMP = 0x0000000a;
enum PROTO_IP_BGMP = 0x0000000b;
enum PROTO_IP_VRRP = 0x00000070;
enum PROTO_IP_BOOTP = 0x0000270f;
enum PROTO_IPV6_DHCP = 0x000003e7;
enum PROTO_IP_DNS_PROXY = 0x00002713;
enum PROTO_IP_DHCP_ALLOCATOR = 0x00002714;
enum PROTO_IP_NAT = 0x00002715;
enum PROTO_IP_DIFFSERV = 0x00002718;
enum PROTO_IP_MGM = 0x00002719;
enum PROTO_IP_ALG = 0x0000271a;
enum PROTO_IP_H323 = 0x0000271b;
enum PROTO_IP_FTP = 0x0000271c;
enum PROTO_IP_DTP = 0x0000271d;
enum PROTO_TYPE_UCAST = 0x00000000;
enum PROTO_TYPE_MCAST = 0x00000001;
enum PROTO_TYPE_MS0 = 0x00000002;
enum PROTO_TYPE_MS1 = 0x00000003;
enum PROTO_VENDOR_MS0 = 0x00000000;
enum PROTO_VENDOR_MS1 = 0x00000137;
enum PROTO_VENDOR_MS2 = 0x00003fff;
enum IPX_PROTOCOL_BASE = 0x0001ffff;
enum IPX_PROTOCOL_RIP = 0x00020000;
enum RIS_INTERFACE_ADDRESS_CHANGE = 0x00000000;
enum RIS_INTERFACE_ENABLED = 0x00000001;
enum RIS_INTERFACE_DISABLED = 0x00000002;
enum RIS_INTERFACE_MEDIA_PRESENT = 0x00000003;
enum RIS_INTERFACE_MEDIA_ABSENT = 0x00000004;
enum MRINFO_TUNNEL_FLAG = 0x00000001;
enum MRINFO_PIM_FLAG = 0x00000004;
enum MRINFO_DOWN_FLAG = 0x00000010;
enum MRINFO_DISABLED_FLAG = 0x00000020;
enum MRINFO_QUERIER_FLAG = 0x00000040;
enum MRINFO_LEAF_FLAG = 0x00000080;
enum MFE_NO_ERROR = 0x00000000;
enum MFE_REACHED_CORE = 0x00000001;
enum MFE_OIF_PRUNED = 0x00000005;
enum MFE_PRUNED_UPSTREAM = 0x00000004;
enum MFE_OLD_ROUTER = 0x0000000b;
enum MFE_NOT_FORWARDING = 0x00000002;
enum MFE_WRONG_IF = 0x00000003;
enum MFE_BOUNDARY_REACHED = 0x00000006;
enum MFE_NO_MULTICAST = 0x00000007;
enum MFE_IIF = 0x00000008;
enum MFE_NO_ROUTE = 0x00000009;
enum MFE_NOT_LAST_HOP = 0x0000000a;
enum MFE_PROHIBITED = 0x0000000c;
enum MFE_NO_SPACE = 0x0000000d;
enum REGISTER_PROTOCOL_ENTRY_POINT_STRING = "RegisterProtocol";
enum ALIGN_SIZE = 0x00000008;
enum RTR_INFO_BLOCK_VERSION = 0x00000001;
enum TRACE_USE_FILE = 0x00000001;
enum TRACE_USE_CONSOLE = 0x00000002;
enum TRACE_NO_SYNCH = 0x00000004;
enum TRACE_NO_STDINFO = 0x00000001;
enum TRACE_USE_MASK = 0x00000002;
enum TRACE_USE_MSEC = 0x00000004;
enum TRACE_USE_DATE = 0x00000008;
enum INVALID_TRACEID = 0xffffffff;
enum RTUTILS_MAX_PROTOCOL_NAME_LEN = 0x00000028;
enum RTUTILS_MAX_PROTOCOL_DLL_LEN = 0x00000030;
enum MAX_PROTOCOL_NAME_LEN = 0x00000028;
enum MAX_PROTOCOL_DLL_LEN = 0x00000030;
struct USER_INFO_0
{
    PWSTR usri0_name;
}
struct USER_INFO_1
{
    PWSTR usri1_name;
    PWSTR usri1_password;
    uint usri1_password_age;
    USER_PRIV usri1_priv;
    PWSTR usri1_home_dir;
    PWSTR usri1_comment;
    USER_ACCOUNT_FLAGS usri1_flags;
    PWSTR usri1_script_path;
}
struct USER_INFO_2
{
    PWSTR usri2_name;
    PWSTR usri2_password;
    uint usri2_password_age;
    USER_PRIV usri2_priv;
    PWSTR usri2_home_dir;
    PWSTR usri2_comment;
    USER_ACCOUNT_FLAGS usri2_flags;
    PWSTR usri2_script_path;
    AF_OP usri2_auth_flags;
    PWSTR usri2_full_name;
    PWSTR usri2_usr_comment;
    PWSTR usri2_parms;
    PWSTR usri2_workstations;
    uint usri2_last_logon;
    uint usri2_last_logoff;
    uint usri2_acct_expires;
    uint usri2_max_storage;
    uint usri2_units_per_week;
    ubyte* usri2_logon_hours;
    uint usri2_bad_pw_count;
    uint usri2_num_logons;
    PWSTR usri2_logon_server;
    uint usri2_country_code;
    uint usri2_code_page;
}
struct USER_INFO_3
{
    PWSTR usri3_name;
    PWSTR usri3_password;
    uint usri3_password_age;
    USER_PRIV usri3_priv;
    PWSTR usri3_home_dir;
    PWSTR usri3_comment;
    USER_ACCOUNT_FLAGS usri3_flags;
    PWSTR usri3_script_path;
    AF_OP usri3_auth_flags;
    PWSTR usri3_full_name;
    PWSTR usri3_usr_comment;
    PWSTR usri3_parms;
    PWSTR usri3_workstations;
    uint usri3_last_logon;
    uint usri3_last_logoff;
    uint usri3_acct_expires;
    uint usri3_max_storage;
    uint usri3_units_per_week;
    ubyte* usri3_logon_hours;
    uint usri3_bad_pw_count;
    uint usri3_num_logons;
    PWSTR usri3_logon_server;
    uint usri3_country_code;
    uint usri3_code_page;
    uint usri3_user_id;
    uint usri3_primary_group_id;
    PWSTR usri3_profile;
    PWSTR usri3_home_dir_drive;
    uint usri3_password_expired;
}
struct USER_INFO_4
{
    PWSTR usri4_name;
    PWSTR usri4_password;
    uint usri4_password_age;
    USER_PRIV usri4_priv;
    PWSTR usri4_home_dir;
    PWSTR usri4_comment;
    USER_ACCOUNT_FLAGS usri4_flags;
    PWSTR usri4_script_path;
    AF_OP usri4_auth_flags;
    PWSTR usri4_full_name;
    PWSTR usri4_usr_comment;
    PWSTR usri4_parms;
    PWSTR usri4_workstations;
    uint usri4_last_logon;
    uint usri4_last_logoff;
    uint usri4_acct_expires;
    uint usri4_max_storage;
    uint usri4_units_per_week;
    ubyte* usri4_logon_hours;
    uint usri4_bad_pw_count;
    uint usri4_num_logons;
    PWSTR usri4_logon_server;
    uint usri4_country_code;
    uint usri4_code_page;
    PSID usri4_user_sid;
    uint usri4_primary_group_id;
    PWSTR usri4_profile;
    PWSTR usri4_home_dir_drive;
    uint usri4_password_expired;
}
struct USER_INFO_10
{
    PWSTR usri10_name;
    PWSTR usri10_comment;
    PWSTR usri10_usr_comment;
    PWSTR usri10_full_name;
}
struct USER_INFO_11
{
    PWSTR usri11_name;
    PWSTR usri11_comment;
    PWSTR usri11_usr_comment;
    PWSTR usri11_full_name;
    USER_PRIV usri11_priv;
    AF_OP usri11_auth_flags;
    uint usri11_password_age;
    PWSTR usri11_home_dir;
    PWSTR usri11_parms;
    uint usri11_last_logon;
    uint usri11_last_logoff;
    uint usri11_bad_pw_count;
    uint usri11_num_logons;
    PWSTR usri11_logon_server;
    uint usri11_country_code;
    PWSTR usri11_workstations;
    uint usri11_max_storage;
    uint usri11_units_per_week;
    ubyte* usri11_logon_hours;
    uint usri11_code_page;
}
struct USER_INFO_20
{
    PWSTR usri20_name;
    PWSTR usri20_full_name;
    PWSTR usri20_comment;
    USER_ACCOUNT_FLAGS usri20_flags;
    uint usri20_user_id;
}
struct USER_INFO_21
{
    ubyte[16] usri21_password;
}
struct USER_INFO_22
{
    PWSTR usri22_name;
    ubyte[16] usri22_password;
    uint usri22_password_age;
    USER_PRIV usri22_priv;
    PWSTR usri22_home_dir;
    PWSTR usri22_comment;
    USER_ACCOUNT_FLAGS usri22_flags;
    PWSTR usri22_script_path;
    AF_OP usri22_auth_flags;
    PWSTR usri22_full_name;
    PWSTR usri22_usr_comment;
    PWSTR usri22_parms;
    PWSTR usri22_workstations;
    uint usri22_last_logon;
    uint usri22_last_logoff;
    uint usri22_acct_expires;
    uint usri22_max_storage;
    uint usri22_units_per_week;
    ubyte* usri22_logon_hours;
    uint usri22_bad_pw_count;
    uint usri22_num_logons;
    PWSTR usri22_logon_server;
    uint usri22_country_code;
    uint usri22_code_page;
}
struct USER_INFO_23
{
    PWSTR usri23_name;
    PWSTR usri23_full_name;
    PWSTR usri23_comment;
    USER_ACCOUNT_FLAGS usri23_flags;
    PSID usri23_user_sid;
}
struct USER_INFO_24
{
    BOOL usri24_internet_identity;
    uint usri24_flags;
    PWSTR usri24_internet_provider_name;
    PWSTR usri24_internet_principal_name;
    PSID usri24_user_sid;
}
struct USER_INFO_1003
{
    PWSTR usri1003_password;
}
struct USER_INFO_1005
{
    USER_PRIV usri1005_priv;
}
struct USER_INFO_1006
{
    PWSTR usri1006_home_dir;
}
struct USER_INFO_1007
{
    PWSTR usri1007_comment;
}
struct USER_INFO_1008
{
    USER_ACCOUNT_FLAGS usri1008_flags;
}
struct USER_INFO_1009
{
    PWSTR usri1009_script_path;
}
struct USER_INFO_1010
{
    AF_OP usri1010_auth_flags;
}
struct USER_INFO_1011
{
    PWSTR usri1011_full_name;
}
struct USER_INFO_1012
{
    PWSTR usri1012_usr_comment;
}
struct USER_INFO_1013
{
    PWSTR usri1013_parms;
}
struct USER_INFO_1014
{
    PWSTR usri1014_workstations;
}
struct USER_INFO_1017
{
    uint usri1017_acct_expires;
}
struct USER_INFO_1018
{
    uint usri1018_max_storage;
}
struct USER_INFO_1020
{
    uint usri1020_units_per_week;
    ubyte* usri1020_logon_hours;
}
struct USER_INFO_1023
{
    PWSTR usri1023_logon_server;
}
struct USER_INFO_1024
{
    uint usri1024_country_code;
}
struct USER_INFO_1025
{
    uint usri1025_code_page;
}
struct USER_INFO_1051
{
    uint usri1051_primary_group_id;
}
struct USER_INFO_1052
{
    PWSTR usri1052_profile;
}
struct USER_INFO_1053
{
    PWSTR usri1053_home_dir_drive;
}
struct USER_MODALS_INFO_0
{
    uint usrmod0_min_passwd_len;
    uint usrmod0_max_passwd_age;
    uint usrmod0_min_passwd_age;
    uint usrmod0_force_logoff;
    uint usrmod0_password_hist_len;
}
struct USER_MODALS_INFO_1
{
    uint usrmod1_role;
    PWSTR usrmod1_primary;
}
struct USER_MODALS_INFO_2
{
    PWSTR usrmod2_domain_name;
    PSID usrmod2_domain_id;
}
struct USER_MODALS_INFO_3
{
    uint usrmod3_lockout_duration;
    uint usrmod3_lockout_observation_window;
    uint usrmod3_lockout_threshold;
}
struct USER_MODALS_INFO_1001
{
    uint usrmod1001_min_passwd_len;
}
struct USER_MODALS_INFO_1002
{
    uint usrmod1002_max_passwd_age;
}
struct USER_MODALS_INFO_1003
{
    uint usrmod1003_min_passwd_age;
}
struct USER_MODALS_INFO_1004
{
    uint usrmod1004_force_logoff;
}
struct USER_MODALS_INFO_1005
{
    uint usrmod1005_password_hist_len;
}
struct USER_MODALS_INFO_1006
{
    USER_MODALS_ROLES usrmod1006_role;
}
struct USER_MODALS_INFO_1007
{
    PWSTR usrmod1007_primary;
}
struct GROUP_INFO_0
{
    PWSTR grpi0_name;
}
struct GROUP_INFO_1
{
    PWSTR grpi1_name;
    PWSTR grpi1_comment;
}
struct GROUP_INFO_2
{
    PWSTR grpi2_name;
    PWSTR grpi2_comment;
    uint grpi2_group_id;
    uint grpi2_attributes;
}
struct GROUP_INFO_3
{
    PWSTR grpi3_name;
    PWSTR grpi3_comment;
    PSID grpi3_group_sid;
    uint grpi3_attributes;
}
struct GROUP_INFO_1002
{
    PWSTR grpi1002_comment;
}
struct GROUP_INFO_1005
{
    uint grpi1005_attributes;
}
struct GROUP_USERS_INFO_0
{
    PWSTR grui0_name;
}
struct GROUP_USERS_INFO_1
{
    PWSTR grui1_name;
    uint grui1_attributes;
}
struct LOCALGROUP_INFO_0
{
    PWSTR lgrpi0_name;
}
struct LOCALGROUP_INFO_1
{
    PWSTR lgrpi1_name;
    PWSTR lgrpi1_comment;
}
struct LOCALGROUP_INFO_1002
{
    PWSTR lgrpi1002_comment;
}
struct LOCALGROUP_MEMBERS_INFO_0
{
    PSID lgrmi0_sid;
}
struct LOCALGROUP_MEMBERS_INFO_1
{
    PSID lgrmi1_sid;
    SID_NAME_USE lgrmi1_sidusage;
    PWSTR lgrmi1_name;
}
struct LOCALGROUP_MEMBERS_INFO_2
{
    PSID lgrmi2_sid;
    SID_NAME_USE lgrmi2_sidusage;
    PWSTR lgrmi2_domainandname;
}
struct LOCALGROUP_MEMBERS_INFO_3
{
    PWSTR lgrmi3_domainandname;
}
struct LOCALGROUP_USERS_INFO_0
{
    PWSTR lgrui0_name;
}
struct NET_DISPLAY_USER
{
    PWSTR usri1_name;
    PWSTR usri1_comment;
    USER_ACCOUNT_FLAGS usri1_flags;
    PWSTR usri1_full_name;
    uint usri1_user_id;
    uint usri1_next_index;
}
struct NET_DISPLAY_MACHINE
{
    PWSTR usri2_name;
    PWSTR usri2_comment;
    USER_ACCOUNT_FLAGS usri2_flags;
    uint usri2_user_id;
    uint usri2_next_index;
}
struct NET_DISPLAY_GROUP
{
    PWSTR grpi3_name;
    PWSTR grpi3_comment;
    uint grpi3_group_id;
    uint grpi3_attributes;
    uint grpi3_next_index;
}
struct ACCESS_INFO_0
{
    PWSTR acc0_resource_name;
}
struct ACCESS_INFO_1
{
    PWSTR acc1_resource_name;
    uint acc1_attr;
    uint acc1_count;
}
struct ACCESS_INFO_1002
{
    uint acc1002_attr;
}
struct ACCESS_LIST
{
    PWSTR acl_ugname;
    uint acl_access;
}
alias NET_VALIDATE_PASSWORD_TYPE = int;
enum : int
{
    NetValidateAuthentication = 0x00000001,
    NetValidatePasswordChange = 0x00000002,
    NetValidatePasswordReset  = 0x00000003,
}

struct NET_VALIDATE_PASSWORD_HASH
{
    uint Length;
    ubyte* Hash;
}
struct NET_VALIDATE_PERSISTED_FIELDS
{
    uint PresentFields;
    FILETIME PasswordLastSet;
    FILETIME BadPasswordTime;
    FILETIME LockoutTime;
    uint BadPasswordCount;
    uint PasswordHistoryLength;
    NET_VALIDATE_PASSWORD_HASH* PasswordHistory;
}
struct NET_VALIDATE_OUTPUT_ARG
{
    NET_VALIDATE_PERSISTED_FIELDS ChangedPersistedFields;
    uint ValidationStatus;
}
struct NET_VALIDATE_AUTHENTICATION_INPUT_ARG
{
    NET_VALIDATE_PERSISTED_FIELDS InputPersistedFields;
    BOOLEAN PasswordMatched;
}
struct NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG
{
    NET_VALIDATE_PERSISTED_FIELDS InputPersistedFields;
    PWSTR ClearPassword;
    PWSTR UserAccountName;
    NET_VALIDATE_PASSWORD_HASH HashedPassword;
    BOOLEAN PasswordMatch;
}
struct NET_VALIDATE_PASSWORD_RESET_INPUT_ARG
{
    NET_VALIDATE_PERSISTED_FIELDS InputPersistedFields;
    PWSTR ClearPassword;
    PWSTR UserAccountName;
    NET_VALIDATE_PASSWORD_HASH HashedPassword;
    BOOLEAN PasswordMustChangeAtNextLogon;
    BOOLEAN ClearLockout;
}
struct NETLOGON_INFO_1
{
    uint netlog1_flags;
    uint netlog1_pdc_connection_status;
}
struct NETLOGON_INFO_2
{
    uint netlog2_flags;
    uint netlog2_pdc_connection_status;
    PWSTR netlog2_trusted_dc_name;
    uint netlog2_tc_connection_status;
}
struct NETLOGON_INFO_3
{
    uint netlog3_flags;
    uint netlog3_logon_attempts;
    uint netlog3_reserved1;
    uint netlog3_reserved2;
    uint netlog3_reserved3;
    uint netlog3_reserved4;
    uint netlog3_reserved5;
}
struct NETLOGON_INFO_4
{
    PWSTR netlog4_trusted_dc_name;
    PWSTR netlog4_trusted_domain_name;
}
alias MSA_INFO_LEVEL = int;
enum : int
{
    MsaInfoLevel0   = 0x00000000,
    MsaInfoLevelMax = 0x00000001,
}

alias MSA_INFO_STATE = int;
enum : int
{
    MsaInfoNotExist      = 0x00000001,
    MsaInfoNotService    = 0x00000002,
    MsaInfoCannotInstall = 0x00000003,
    MsaInfoCanInstall    = 0x00000004,
    MsaInfoInstalled     = 0x00000005,
}

struct MSA_INFO_0
{
    MSA_INFO_STATE State;
}
struct STD_ALERT
{
    uint alrt_timestamp;
    wchar[17] alrt_eventname;
    wchar[81] alrt_servicename;
}
struct ADMIN_OTHER_INFO
{
    uint alrtad_errcode;
    uint alrtad_numstrings;
}
struct ERRLOG_OTHER_INFO
{
    uint alrter_errcode;
    uint alrter_offset;
}
struct PRINT_OTHER_INFO
{
    uint alrtpr_jobid;
    uint alrtpr_status;
    uint alrtpr_submitted;
    uint alrtpr_size;
}
struct USER_OTHER_INFO
{
    uint alrtus_errcode;
    uint alrtus_numstrings;
}
struct MSG_INFO_0
{
    PWSTR msgi0_name;
}
struct MSG_INFO_1
{
    PWSTR msgi1_name;
    uint msgi1_forward_flag;
    PWSTR msgi1_forward;
}
struct TIME_OF_DAY_INFO
{
    uint tod_elapsedt;
    uint tod_msecs;
    uint tod_hours;
    uint tod_mins;
    uint tod_secs;
    uint tod_hunds;
    int tod_timezone;
    uint tod_tinterval;
    uint tod_day;
    uint tod_month;
    uint tod_year;
    uint tod_weekday;
}
struct REPL_INFO_0
{
    uint rp0_role;
    PWSTR rp0_exportpath;
    PWSTR rp0_exportlist;
    PWSTR rp0_importpath;
    PWSTR rp0_importlist;
    PWSTR rp0_logonusername;
    uint rp0_interval;
    uint rp0_pulse;
    uint rp0_guardtime;
    uint rp0_random;
}
struct REPL_INFO_1000
{
    uint rp1000_interval;
}
struct REPL_INFO_1001
{
    uint rp1001_pulse;
}
struct REPL_INFO_1002
{
    uint rp1002_guardtime;
}
struct REPL_INFO_1003
{
    uint rp1003_random;
}
struct REPL_EDIR_INFO_0
{
    PWSTR rped0_dirname;
}
struct REPL_EDIR_INFO_1
{
    PWSTR rped1_dirname;
    uint rped1_integrity;
    uint rped1_extent;
}
struct REPL_EDIR_INFO_2
{
    PWSTR rped2_dirname;
    uint rped2_integrity;
    uint rped2_extent;
    uint rped2_lockcount;
    uint rped2_locktime;
}
struct REPL_EDIR_INFO_1000
{
    uint rped1000_integrity;
}
struct REPL_EDIR_INFO_1001
{
    uint rped1001_extent;
}
struct REPL_IDIR_INFO_0
{
    PWSTR rpid0_dirname;
}
struct REPL_IDIR_INFO_1
{
    PWSTR rpid1_dirname;
    uint rpid1_state;
    PWSTR rpid1_mastername;
    uint rpid1_last_update_time;
    uint rpid1_lockcount;
    uint rpid1_locktime;
}
struct SERVER_INFO_100
{
    uint sv100_platform_id;
    PWSTR sv100_name;
}
struct SERVER_INFO_101
{
    uint sv101_platform_id;
    PWSTR sv101_name;
    uint sv101_version_major;
    uint sv101_version_minor;
    NET_SERVER_TYPE sv101_type;
    PWSTR sv101_comment;
}
struct SERVER_INFO_102
{
    uint sv102_platform_id;
    PWSTR sv102_name;
    uint sv102_version_major;
    uint sv102_version_minor;
    NET_SERVER_TYPE sv102_type;
    PWSTR sv102_comment;
    uint sv102_users;
    int sv102_disc;
    SERVER_INFO_HIDDEN sv102_hidden;
    uint sv102_announce;
    uint sv102_anndelta;
    uint sv102_licenses;
    PWSTR sv102_userpath;
}
struct SERVER_INFO_103
{
    uint sv103_platform_id;
    PWSTR sv103_name;
    uint sv103_version_major;
    uint sv103_version_minor;
    uint sv103_type;
    PWSTR sv103_comment;
    uint sv103_users;
    int sv103_disc;
    BOOL sv103_hidden;
    uint sv103_announce;
    uint sv103_anndelta;
    uint sv103_licenses;
    PWSTR sv103_userpath;
    uint sv103_capabilities;
}
struct SERVER_INFO_402
{
    uint sv402_ulist_mtime;
    uint sv402_glist_mtime;
    uint sv402_alist_mtime;
    PWSTR sv402_alerts;
    SERVER_INFO_SECURITY sv402_security;
    uint sv402_numadmin;
    uint sv402_lanmask;
    PWSTR sv402_guestacct;
    uint sv402_chdevs;
    uint sv402_chdevq;
    uint sv402_chdevjobs;
    uint sv402_connections;
    uint sv402_shares;
    uint sv402_openfiles;
    uint sv402_sessopens;
    uint sv402_sessvcs;
    uint sv402_sessreqs;
    uint sv402_opensearch;
    uint sv402_activelocks;
    uint sv402_numreqbuf;
    uint sv402_sizreqbuf;
    uint sv402_numbigbuf;
    uint sv402_numfiletasks;
    uint sv402_alertsched;
    uint sv402_erroralert;
    uint sv402_logonalert;
    uint sv402_accessalert;
    uint sv402_diskalert;
    uint sv402_netioalert;
    uint sv402_maxauditsz;
    PWSTR sv402_srvheuristics;
}
struct SERVER_INFO_403
{
    uint sv403_ulist_mtime;
    uint sv403_glist_mtime;
    uint sv403_alist_mtime;
    PWSTR sv403_alerts;
    SERVER_INFO_SECURITY sv403_security;
    uint sv403_numadmin;
    uint sv403_lanmask;
    PWSTR sv403_guestacct;
    uint sv403_chdevs;
    uint sv403_chdevq;
    uint sv403_chdevjobs;
    uint sv403_connections;
    uint sv403_shares;
    uint sv403_openfiles;
    uint sv403_sessopens;
    uint sv403_sessvcs;
    uint sv403_sessreqs;
    uint sv403_opensearch;
    uint sv403_activelocks;
    uint sv403_numreqbuf;
    uint sv403_sizreqbuf;
    uint sv403_numbigbuf;
    uint sv403_numfiletasks;
    uint sv403_alertsched;
    uint sv403_erroralert;
    uint sv403_logonalert;
    uint sv403_accessalert;
    uint sv403_diskalert;
    uint sv403_netioalert;
    uint sv403_maxauditsz;
    PWSTR sv403_srvheuristics;
    uint sv403_auditedevents;
    uint sv403_autoprofile;
    PWSTR sv403_autopath;
}
struct SERVER_INFO_502
{
    uint sv502_sessopens;
    uint sv502_sessvcs;
    uint sv502_opensearch;
    uint sv502_sizreqbuf;
    uint sv502_initworkitems;
    uint sv502_maxworkitems;
    uint sv502_rawworkitems;
    uint sv502_irpstacksize;
    uint sv502_maxrawbuflen;
    uint sv502_sessusers;
    uint sv502_sessconns;
    uint sv502_maxpagedmemoryusage;
    uint sv502_maxnonpagedmemoryusage;
    BOOL sv502_enablesoftcompat;
    BOOL sv502_enableforcedlogoff;
    BOOL sv502_timesource;
    BOOL sv502_acceptdownlevelapis;
    BOOL sv502_lmannounce;
}
struct SERVER_INFO_503
{
    uint sv503_sessopens;
    uint sv503_sessvcs;
    uint sv503_opensearch;
    uint sv503_sizreqbuf;
    uint sv503_initworkitems;
    uint sv503_maxworkitems;
    uint sv503_rawworkitems;
    uint sv503_irpstacksize;
    uint sv503_maxrawbuflen;
    uint sv503_sessusers;
    uint sv503_sessconns;
    uint sv503_maxpagedmemoryusage;
    uint sv503_maxnonpagedmemoryusage;
    BOOL sv503_enablesoftcompat;
    BOOL sv503_enableforcedlogoff;
    BOOL sv503_timesource;
    BOOL sv503_acceptdownlevelapis;
    BOOL sv503_lmannounce;
    PWSTR sv503_domain;
    uint sv503_maxcopyreadlen;
    uint sv503_maxcopywritelen;
    uint sv503_minkeepsearch;
    uint sv503_maxkeepsearch;
    uint sv503_minkeepcomplsearch;
    uint sv503_maxkeepcomplsearch;
    uint sv503_threadcountadd;
    uint sv503_numblockthreads;
    uint sv503_scavtimeout;
    uint sv503_minrcvqueue;
    uint sv503_minfreeworkitems;
    uint sv503_xactmemsize;
    uint sv503_threadpriority;
    uint sv503_maxmpxct;
    uint sv503_oplockbreakwait;
    uint sv503_oplockbreakresponsewait;
    BOOL sv503_enableoplocks;
    BOOL sv503_enableoplockforceclose;
    BOOL sv503_enablefcbopens;
    BOOL sv503_enableraw;
    BOOL sv503_enablesharednetdrives;
    uint sv503_minfreeconnections;
    uint sv503_maxfreeconnections;
}
struct SERVER_INFO_599
{
    uint sv599_sessopens;
    uint sv599_sessvcs;
    uint sv599_opensearch;
    uint sv599_sizreqbuf;
    uint sv599_initworkitems;
    uint sv599_maxworkitems;
    uint sv599_rawworkitems;
    uint sv599_irpstacksize;
    uint sv599_maxrawbuflen;
    uint sv599_sessusers;
    uint sv599_sessconns;
    uint sv599_maxpagedmemoryusage;
    uint sv599_maxnonpagedmemoryusage;
    BOOL sv599_enablesoftcompat;
    BOOL sv599_enableforcedlogoff;
    BOOL sv599_timesource;
    BOOL sv599_acceptdownlevelapis;
    BOOL sv599_lmannounce;
    PWSTR sv599_domain;
    uint sv599_maxcopyreadlen;
    uint sv599_maxcopywritelen;
    uint sv599_minkeepsearch;
    uint sv599_maxkeepsearch;
    uint sv599_minkeepcomplsearch;
    uint sv599_maxkeepcomplsearch;
    uint sv599_threadcountadd;
    uint sv599_numblockthreads;
    uint sv599_scavtimeout;
    uint sv599_minrcvqueue;
    uint sv599_minfreeworkitems;
    uint sv599_xactmemsize;
    uint sv599_threadpriority;
    uint sv599_maxmpxct;
    uint sv599_oplockbreakwait;
    uint sv599_oplockbreakresponsewait;
    BOOL sv599_enableoplocks;
    BOOL sv599_enableoplockforceclose;
    BOOL sv599_enablefcbopens;
    BOOL sv599_enableraw;
    BOOL sv599_enablesharednetdrives;
    uint sv599_minfreeconnections;
    uint sv599_maxfreeconnections;
    uint sv599_initsesstable;
    uint sv599_initconntable;
    uint sv599_initfiletable;
    uint sv599_initsearchtable;
    uint sv599_alertschedule;
    uint sv599_errorthreshold;
    uint sv599_networkerrorthreshold;
    uint sv599_diskspacethreshold;
    uint sv599_reserved;
    uint sv599_maxlinkdelay;
    uint sv599_minlinkthroughput;
    uint sv599_linkinfovalidtime;
    uint sv599_scavqosinfoupdatetime;
    uint sv599_maxworkitemidletime;
}
struct SERVER_INFO_598
{
    uint sv598_maxrawworkitems;
    uint sv598_maxthreadsperqueue;
    uint sv598_producttype;
    uint sv598_serversize;
    uint sv598_connectionlessautodisc;
    uint sv598_sharingviolationretries;
    uint sv598_sharingviolationdelay;
    uint sv598_maxglobalopensearch;
    uint sv598_removeduplicatesearches;
    uint sv598_lockviolationoffset;
    uint sv598_lockviolationdelay;
    uint sv598_mdlreadswitchover;
    uint sv598_cachedopenlimit;
    uint sv598_otherqueueaffinity;
    BOOL sv598_restrictnullsessaccess;
    BOOL sv598_enablewfw311directipx;
    uint sv598_queuesamplesecs;
    uint sv598_balancecount;
    uint sv598_preferredaffinity;
    uint sv598_maxfreerfcbs;
    uint sv598_maxfreemfcbs;
    uint sv598_maxfreelfcbs;
    uint sv598_maxfreepagedpoolchunks;
    uint sv598_minpagedpoolchunksize;
    uint sv598_maxpagedpoolchunksize;
    BOOL sv598_sendsfrompreferredprocessor;
    uint sv598_cacheddirectorylimit;
    uint sv598_maxcopylength;
    BOOL sv598_enablecompression;
    BOOL sv598_autosharewks;
    BOOL sv598_autoshareserver;
    BOOL sv598_enablesecuritysignature;
    BOOL sv598_requiresecuritysignature;
    uint sv598_minclientbuffersize;
    GUID sv598_serverguid;
    uint sv598_ConnectionNoSessionsTimeout;
    uint sv598_IdleThreadTimeOut;
    BOOL sv598_enableW9xsecuritysignature;
    BOOL sv598_enforcekerberosreauthentication;
    BOOL sv598_disabledos;
    uint sv598_lowdiskspaceminimum;
    BOOL sv598_disablestrictnamechecking;
    BOOL sv598_enableauthenticateusersharing;
}
struct SERVER_INFO_1005
{
    PWSTR sv1005_comment;
}
struct SERVER_INFO_1107
{
    uint sv1107_users;
}
struct SERVER_INFO_1010
{
    int sv1010_disc;
}
struct SERVER_INFO_1016
{
    SERVER_INFO_HIDDEN sv1016_hidden;
}
struct SERVER_INFO_1017
{
    uint sv1017_announce;
}
struct SERVER_INFO_1018
{
    uint sv1018_anndelta;
}
struct SERVER_INFO_1501
{
    uint sv1501_sessopens;
}
struct SERVER_INFO_1502
{
    uint sv1502_sessvcs;
}
struct SERVER_INFO_1503
{
    uint sv1503_opensearch;
}
struct SERVER_INFO_1506
{
    uint sv1506_maxworkitems;
}
struct SERVER_INFO_1509
{
    uint sv1509_maxrawbuflen;
}
struct SERVER_INFO_1510
{
    uint sv1510_sessusers;
}
struct SERVER_INFO_1511
{
    uint sv1511_sessconns;
}
struct SERVER_INFO_1512
{
    uint sv1512_maxnonpagedmemoryusage;
}
struct SERVER_INFO_1513
{
    uint sv1513_maxpagedmemoryusage;
}
struct SERVER_INFO_1514
{
    BOOL sv1514_enablesoftcompat;
}
struct SERVER_INFO_1515
{
    BOOL sv1515_enableforcedlogoff;
}
struct SERVER_INFO_1516
{
    BOOL sv1516_timesource;
}
struct SERVER_INFO_1518
{
    BOOL sv1518_lmannounce;
}
struct SERVER_INFO_1520
{
    uint sv1520_maxcopyreadlen;
}
struct SERVER_INFO_1521
{
    uint sv1521_maxcopywritelen;
}
struct SERVER_INFO_1522
{
    uint sv1522_minkeepsearch;
}
struct SERVER_INFO_1523
{
    uint sv1523_maxkeepsearch;
}
struct SERVER_INFO_1524
{
    uint sv1524_minkeepcomplsearch;
}
struct SERVER_INFO_1525
{
    uint sv1525_maxkeepcomplsearch;
}
struct SERVER_INFO_1528
{
    uint sv1528_scavtimeout;
}
struct SERVER_INFO_1529
{
    uint sv1529_minrcvqueue;
}
struct SERVER_INFO_1530
{
    uint sv1530_minfreeworkitems;
}
struct SERVER_INFO_1533
{
    uint sv1533_maxmpxct;
}
struct SERVER_INFO_1534
{
    uint sv1534_oplockbreakwait;
}
struct SERVER_INFO_1535
{
    uint sv1535_oplockbreakresponsewait;
}
struct SERVER_INFO_1536
{
    BOOL sv1536_enableoplocks;
}
struct SERVER_INFO_1537
{
    BOOL sv1537_enableoplockforceclose;
}
struct SERVER_INFO_1538
{
    BOOL sv1538_enablefcbopens;
}
struct SERVER_INFO_1539
{
    BOOL sv1539_enableraw;
}
struct SERVER_INFO_1540
{
    BOOL sv1540_enablesharednetdrives;
}
struct SERVER_INFO_1541
{
    BOOL sv1541_minfreeconnections;
}
struct SERVER_INFO_1542
{
    BOOL sv1542_maxfreeconnections;
}
struct SERVER_INFO_1543
{
    uint sv1543_initsesstable;
}
struct SERVER_INFO_1544
{
    uint sv1544_initconntable;
}
struct SERVER_INFO_1545
{
    uint sv1545_initfiletable;
}
struct SERVER_INFO_1546
{
    uint sv1546_initsearchtable;
}
struct SERVER_INFO_1547
{
    uint sv1547_alertschedule;
}
struct SERVER_INFO_1548
{
    uint sv1548_errorthreshold;
}
struct SERVER_INFO_1549
{
    uint sv1549_networkerrorthreshold;
}
struct SERVER_INFO_1550
{
    uint sv1550_diskspacethreshold;
}
struct SERVER_INFO_1552
{
    uint sv1552_maxlinkdelay;
}
struct SERVER_INFO_1553
{
    uint sv1553_minlinkthroughput;
}
struct SERVER_INFO_1554
{
    uint sv1554_linkinfovalidtime;
}
struct SERVER_INFO_1555
{
    uint sv1555_scavqosinfoupdatetime;
}
struct SERVER_INFO_1556
{
    uint sv1556_maxworkitemidletime;
}
struct SERVER_INFO_1557
{
    uint sv1557_maxrawworkitems;
}
struct SERVER_INFO_1560
{
    uint sv1560_producttype;
}
struct SERVER_INFO_1561
{
    uint sv1561_serversize;
}
struct SERVER_INFO_1562
{
    uint sv1562_connectionlessautodisc;
}
struct SERVER_INFO_1563
{
    uint sv1563_sharingviolationretries;
}
struct SERVER_INFO_1564
{
    uint sv1564_sharingviolationdelay;
}
struct SERVER_INFO_1565
{
    uint sv1565_maxglobalopensearch;
}
struct SERVER_INFO_1566
{
    BOOL sv1566_removeduplicatesearches;
}
struct SERVER_INFO_1567
{
    uint sv1567_lockviolationretries;
}
struct SERVER_INFO_1568
{
    uint sv1568_lockviolationoffset;
}
struct SERVER_INFO_1569
{
    uint sv1569_lockviolationdelay;
}
struct SERVER_INFO_1570
{
    uint sv1570_mdlreadswitchover;
}
struct SERVER_INFO_1571
{
    uint sv1571_cachedopenlimit;
}
struct SERVER_INFO_1572
{
    uint sv1572_criticalthreads;
}
struct SERVER_INFO_1573
{
    uint sv1573_restrictnullsessaccess;
}
struct SERVER_INFO_1574
{
    uint sv1574_enablewfw311directipx;
}
struct SERVER_INFO_1575
{
    uint sv1575_otherqueueaffinity;
}
struct SERVER_INFO_1576
{
    uint sv1576_queuesamplesecs;
}
struct SERVER_INFO_1577
{
    uint sv1577_balancecount;
}
struct SERVER_INFO_1578
{
    uint sv1578_preferredaffinity;
}
struct SERVER_INFO_1579
{
    uint sv1579_maxfreerfcbs;
}
struct SERVER_INFO_1580
{
    uint sv1580_maxfreemfcbs;
}
struct SERVER_INFO_1581
{
    uint sv1581_maxfreemlcbs;
}
struct SERVER_INFO_1582
{
    uint sv1582_maxfreepagedpoolchunks;
}
struct SERVER_INFO_1583
{
    uint sv1583_minpagedpoolchunksize;
}
struct SERVER_INFO_1584
{
    uint sv1584_maxpagedpoolchunksize;
}
struct SERVER_INFO_1585
{
    BOOL sv1585_sendsfrompreferredprocessor;
}
struct SERVER_INFO_1586
{
    uint sv1586_maxthreadsperqueue;
}
struct SERVER_INFO_1587
{
    uint sv1587_cacheddirectorylimit;
}
struct SERVER_INFO_1588
{
    uint sv1588_maxcopylength;
}
struct SERVER_INFO_1590
{
    uint sv1590_enablecompression;
}
struct SERVER_INFO_1591
{
    uint sv1591_autosharewks;
}
struct SERVER_INFO_1592
{
    uint sv1592_autosharewks;
}
struct SERVER_INFO_1593
{
    uint sv1593_enablesecuritysignature;
}
struct SERVER_INFO_1594
{
    uint sv1594_requiresecuritysignature;
}
struct SERVER_INFO_1595
{
    uint sv1595_minclientbuffersize;
}
struct SERVER_INFO_1596
{
    uint sv1596_ConnectionNoSessionsTimeout;
}
struct SERVER_INFO_1597
{
    uint sv1597_IdleThreadTimeOut;
}
struct SERVER_INFO_1598
{
    uint sv1598_enableW9xsecuritysignature;
}
struct SERVER_INFO_1599
{
    BOOLEAN sv1598_enforcekerberosreauthentication;
}
struct SERVER_INFO_1600
{
    BOOLEAN sv1598_disabledos;
}
struct SERVER_INFO_1601
{
    uint sv1598_lowdiskspaceminimum;
}
struct SERVER_INFO_1602
{
    BOOL sv_1598_disablestrictnamechecking;
}
struct SERVER_TRANSPORT_INFO_0
{
    uint svti0_numberofvcs;
    PWSTR svti0_transportname;
    ubyte* svti0_transportaddress;
    uint svti0_transportaddresslength;
    PWSTR svti0_networkaddress;
}
struct SERVER_TRANSPORT_INFO_1
{
    uint svti1_numberofvcs;
    PWSTR svti1_transportname;
    ubyte* svti1_transportaddress;
    uint svti1_transportaddresslength;
    PWSTR svti1_networkaddress;
    PWSTR svti1_domain;
}
struct SERVER_TRANSPORT_INFO_2
{
    uint svti2_numberofvcs;
    PWSTR svti2_transportname;
    ubyte* svti2_transportaddress;
    uint svti2_transportaddresslength;
    PWSTR svti2_networkaddress;
    PWSTR svti2_domain;
    uint svti2_flags;
}
struct SERVER_TRANSPORT_INFO_3
{
    uint svti3_numberofvcs;
    PWSTR svti3_transportname;
    ubyte* svti3_transportaddress;
    uint svti3_transportaddresslength;
    PWSTR svti3_networkaddress;
    PWSTR svti3_domain;
    uint svti3_flags;
    uint svti3_passwordlength;
    ubyte[256] svti3_password;
}
struct SERVICE_INFO_0
{
    PWSTR svci0_name;
}
struct SERVICE_INFO_1
{
    PWSTR svci1_name;
    uint svci1_status;
    uint svci1_code;
    uint svci1_pid;
}
struct SERVICE_INFO_2
{
    PWSTR svci2_name;
    uint svci2_status;
    uint svci2_code;
    uint svci2_pid;
    PWSTR svci2_text;
    uint svci2_specific_error;
    PWSTR svci2_display_name;
}
struct USE_INFO_0
{
    PWSTR ui0_local;
    PWSTR ui0_remote;
}
struct USE_INFO_1
{
    PWSTR ui1_local;
    PWSTR ui1_remote;
    PWSTR ui1_password;
    uint ui1_status;
    USE_INFO_ASG_TYPE ui1_asg_type;
    uint ui1_refcount;
    uint ui1_usecount;
}
struct USE_INFO_2
{
    PWSTR ui2_local;
    PWSTR ui2_remote;
    PWSTR ui2_password;
    uint ui2_status;
    USE_INFO_ASG_TYPE ui2_asg_type;
    uint ui2_refcount;
    uint ui2_usecount;
    PWSTR ui2_username;
    PWSTR ui2_domainname;
}
struct USE_INFO_3
{
    USE_INFO_2 ui3_ui2;
    uint ui3_flags;
}
struct USE_INFO_4
{
    USE_INFO_3 ui4_ui3;
    uint ui4_auth_identity_length;
    ubyte* ui4_auth_identity;
}
struct USE_INFO_5
{
    USE_INFO_3 ui4_ui3;
    uint ui4_auth_identity_length;
    ubyte* ui4_auth_identity;
    uint ui5_security_descriptor_length;
    ubyte* ui5_security_descriptor;
    uint ui5_use_options_length;
    ubyte* ui5_use_options;
}
struct USE_OPTION_GENERIC
{
    uint Tag;
    ushort Length;
    ushort Reserved;
}
struct USE_OPTION_DEFERRED_CONNECTION_PARAMETERS
{
    uint Tag;
    ushort Length;
    ushort Reserved;
}
alias TRANSPORT_TYPE = int;
enum : int
{
    UseTransportType_None = 0x00000000,
    UseTransportType_Wsk  = 0x00000001,
    UseTransportType_Quic = 0x00000002,
}

struct TRANSPORT_INFO
{
    TRANSPORT_TYPE Type;
    BOOLEAN SkipCertificateCheck;
}
struct USE_OPTION_TRANSPORT_PARAMETERS
{
    uint Tag;
    ushort Length;
    ushort Reserved;
}
struct SMB_COMPRESSION_INFO
{
    BOOLEAN Switch;
    ubyte Reserved1;
    ushort Reserved2;
    uint Reserved3;
}
struct SMB_USE_OPTION_COMPRESSION_PARAMETERS
{
    uint Tag;
    ushort Length;
    ushort Reserved;
}
struct SMB_TREE_CONNECT_PARAMETERS
{
    uint EABufferOffset;
    uint EABufferLen;
    uint CreateOptions;
    uint TreeConnectAttributes;
}
struct USE_OPTION_PROPERTIES
{
    uint Tag;
    void* pInfo;
    ulong Length;
}
struct WKSTA_INFO_100
{
    uint wki100_platform_id;
    PWSTR wki100_computername;
    PWSTR wki100_langroup;
    uint wki100_ver_major;
    uint wki100_ver_minor;
}
struct WKSTA_INFO_101
{
    uint wki101_platform_id;
    PWSTR wki101_computername;
    PWSTR wki101_langroup;
    uint wki101_ver_major;
    uint wki101_ver_minor;
    PWSTR wki101_lanroot;
}
struct WKSTA_INFO_102
{
    uint wki102_platform_id;
    PWSTR wki102_computername;
    PWSTR wki102_langroup;
    uint wki102_ver_major;
    uint wki102_ver_minor;
    PWSTR wki102_lanroot;
    uint wki102_logged_on_users;
}
struct WKSTA_INFO_302
{
    uint wki302_char_wait;
    uint wki302_collection_time;
    uint wki302_maximum_collection_count;
    uint wki302_keep_conn;
    uint wki302_keep_search;
    uint wki302_max_cmds;
    uint wki302_num_work_buf;
    uint wki302_siz_work_buf;
    uint wki302_max_wrk_cache;
    uint wki302_sess_timeout;
    uint wki302_siz_error;
    uint wki302_num_alerts;
    uint wki302_num_services;
    uint wki302_errlog_sz;
    uint wki302_print_buf_time;
    uint wki302_num_char_buf;
    uint wki302_siz_char_buf;
    PWSTR wki302_wrk_heuristics;
    uint wki302_mailslots;
    uint wki302_num_dgram_buf;
}
struct WKSTA_INFO_402
{
    uint wki402_char_wait;
    uint wki402_collection_time;
    uint wki402_maximum_collection_count;
    uint wki402_keep_conn;
    uint wki402_keep_search;
    uint wki402_max_cmds;
    uint wki402_num_work_buf;
    uint wki402_siz_work_buf;
    uint wki402_max_wrk_cache;
    uint wki402_sess_timeout;
    uint wki402_siz_error;
    uint wki402_num_alerts;
    uint wki402_num_services;
    uint wki402_errlog_sz;
    uint wki402_print_buf_time;
    uint wki402_num_char_buf;
    uint wki402_siz_char_buf;
    PWSTR wki402_wrk_heuristics;
    uint wki402_mailslots;
    uint wki402_num_dgram_buf;
    uint wki402_max_threads;
}
struct WKSTA_INFO_502
{
    uint wki502_char_wait;
    uint wki502_collection_time;
    uint wki502_maximum_collection_count;
    uint wki502_keep_conn;
    uint wki502_max_cmds;
    uint wki502_sess_timeout;
    uint wki502_siz_char_buf;
    uint wki502_max_threads;
    uint wki502_lock_quota;
    uint wki502_lock_increment;
    uint wki502_lock_maximum;
    uint wki502_pipe_increment;
    uint wki502_pipe_maximum;
    uint wki502_cache_file_timeout;
    uint wki502_dormant_file_limit;
    uint wki502_read_ahead_throughput;
    uint wki502_num_mailslot_buffers;
    uint wki502_num_srv_announce_buffers;
    uint wki502_max_illegal_datagram_events;
    uint wki502_illegal_datagram_event_reset_frequency;
    BOOL wki502_log_election_packets;
    BOOL wki502_use_opportunistic_locking;
    BOOL wki502_use_unlock_behind;
    BOOL wki502_use_close_behind;
    BOOL wki502_buf_named_pipes;
    BOOL wki502_use_lock_read_unlock;
    BOOL wki502_utilize_nt_caching;
    BOOL wki502_use_raw_read;
    BOOL wki502_use_raw_write;
    BOOL wki502_use_write_raw_data;
    BOOL wki502_use_encryption;
    BOOL wki502_buf_files_deny_write;
    BOOL wki502_buf_read_only_files;
    BOOL wki502_force_core_create_mode;
    BOOL wki502_use_512_byte_max_transfer;
}
struct WKSTA_INFO_1010
{
    uint wki1010_char_wait;
}
struct WKSTA_INFO_1011
{
    uint wki1011_collection_time;
}
struct WKSTA_INFO_1012
{
    uint wki1012_maximum_collection_count;
}
struct WKSTA_INFO_1027
{
    uint wki1027_errlog_sz;
}
struct WKSTA_INFO_1028
{
    uint wki1028_print_buf_time;
}
struct WKSTA_INFO_1032
{
    uint wki1032_wrk_heuristics;
}
struct WKSTA_INFO_1013
{
    uint wki1013_keep_conn;
}
struct WKSTA_INFO_1018
{
    uint wki1018_sess_timeout;
}
struct WKSTA_INFO_1023
{
    uint wki1023_siz_char_buf;
}
struct WKSTA_INFO_1033
{
    uint wki1033_max_threads;
}
struct WKSTA_INFO_1041
{
    uint wki1041_lock_quota;
}
struct WKSTA_INFO_1042
{
    uint wki1042_lock_increment;
}
struct WKSTA_INFO_1043
{
    uint wki1043_lock_maximum;
}
struct WKSTA_INFO_1044
{
    uint wki1044_pipe_increment;
}
struct WKSTA_INFO_1045
{
    uint wki1045_pipe_maximum;
}
struct WKSTA_INFO_1046
{
    uint wki1046_dormant_file_limit;
}
struct WKSTA_INFO_1047
{
    uint wki1047_cache_file_timeout;
}
struct WKSTA_INFO_1048
{
    BOOL wki1048_use_opportunistic_locking;
}
struct WKSTA_INFO_1049
{
    BOOL wki1049_use_unlock_behind;
}
struct WKSTA_INFO_1050
{
    BOOL wki1050_use_close_behind;
}
struct WKSTA_INFO_1051
{
    BOOL wki1051_buf_named_pipes;
}
struct WKSTA_INFO_1052
{
    BOOL wki1052_use_lock_read_unlock;
}
struct WKSTA_INFO_1053
{
    BOOL wki1053_utilize_nt_caching;
}
struct WKSTA_INFO_1054
{
    BOOL wki1054_use_raw_read;
}
struct WKSTA_INFO_1055
{
    BOOL wki1055_use_raw_write;
}
struct WKSTA_INFO_1056
{
    BOOL wki1056_use_write_raw_data;
}
struct WKSTA_INFO_1057
{
    BOOL wki1057_use_encryption;
}
struct WKSTA_INFO_1058
{
    BOOL wki1058_buf_files_deny_write;
}
struct WKSTA_INFO_1059
{
    BOOL wki1059_buf_read_only_files;
}
struct WKSTA_INFO_1060
{
    BOOL wki1060_force_core_create_mode;
}
struct WKSTA_INFO_1061
{
    BOOL wki1061_use_512_byte_max_transfer;
}
struct WKSTA_INFO_1062
{
    uint wki1062_read_ahead_throughput;
}
struct WKSTA_USER_INFO_0
{
    PWSTR wkui0_username;
}
struct WKSTA_USER_INFO_1
{
    PWSTR wkui1_username;
    PWSTR wkui1_logon_domain;
    PWSTR wkui1_oth_domains;
    PWSTR wkui1_logon_server;
}
struct WKSTA_USER_INFO_1101
{
    PWSTR wkui1101_oth_domains;
}
struct WKSTA_TRANSPORT_INFO_0
{
    uint wkti0_quality_of_service;
    uint wkti0_number_of_vcs;
    PWSTR wkti0_transport_name;
    PWSTR wkti0_transport_address;
    BOOL wkti0_wan_ish;
}
struct ERROR_LOG
{
    uint el_len;
    uint el_reserved;
    uint el_time;
    uint el_error;
    PWSTR el_name;
    PWSTR el_text;
    ubyte* el_data;
    uint el_data_size;
    uint el_nstrings;
}
struct HLOG
{
    uint time;
    uint last_flags;
    uint offset;
    uint rec_offset;
}
struct CONFIG_INFO_0
{
    PWSTR cfgi0_key;
    PWSTR cfgi0_data;
}
struct AUDIT_ENTRY
{
    uint ae_len;
    uint ae_reserved;
    uint ae_time;
    uint ae_type;
    uint ae_data_offset;
    uint ae_data_size;
}
/+ [CONFLICTED] struct AE_SRVSTATUS
{
    uint ae_sv_status;
}
+/
/+ [CONFLICTED] struct AE_SESSLOGON
{
    uint ae_so_compname;
    uint ae_so_username;
    uint ae_so_privilege;
}
+/
/+ [CONFLICTED] struct AE_SESSLOGOFF
{
    uint ae_sf_compname;
    uint ae_sf_username;
    uint ae_sf_reason;
}
+/
/+ [CONFLICTED] struct AE_SESSPWERR
{
    uint ae_sp_compname;
    uint ae_sp_username;
}
+/
/+ [CONFLICTED] struct AE_CONNSTART
{
    uint ae_ct_compname;
    uint ae_ct_username;
    uint ae_ct_netname;
    uint ae_ct_connid;
}
+/
/+ [CONFLICTED] struct AE_CONNSTOP
{
    uint ae_cp_compname;
    uint ae_cp_username;
    uint ae_cp_netname;
    uint ae_cp_connid;
    uint ae_cp_reason;
}
+/
/+ [CONFLICTED] struct AE_CONNREJ
{
    uint ae_cr_compname;
    uint ae_cr_username;
    uint ae_cr_netname;
    uint ae_cr_reason;
}
+/
/+ [CONFLICTED] struct AE_RESACCESS
{
    uint ae_ra_compname;
    uint ae_ra_username;
    uint ae_ra_resname;
    uint ae_ra_operation;
    uint ae_ra_returncode;
    uint ae_ra_restype;
    uint ae_ra_fileid;
}
+/
/+ [CONFLICTED] struct AE_RESACCESSREJ
{
    uint ae_rr_compname;
    uint ae_rr_username;
    uint ae_rr_resname;
    uint ae_rr_operation;
}
+/
/+ [CONFLICTED] struct AE_CLOSEFILE
{
    uint ae_cf_compname;
    uint ae_cf_username;
    uint ae_cf_resname;
    uint ae_cf_fileid;
    uint ae_cf_duration;
    uint ae_cf_reason;
}
+/
/+ [CONFLICTED] struct AE_SERVICESTAT
{
    uint ae_ss_compname;
    uint ae_ss_username;
    uint ae_ss_svcname;
    uint ae_ss_status;
    uint ae_ss_code;
    uint ae_ss_text;
    uint ae_ss_returnval;
}
+/
/+ [CONFLICTED] struct AE_ACLMOD
{
    uint ae_am_compname;
    uint ae_am_username;
    uint ae_am_resname;
    uint ae_am_action;
    uint ae_am_datalen;
}
+/
/+ [CONFLICTED] struct AE_UASMOD
{
    uint ae_um_compname;
    uint ae_um_username;
    uint ae_um_resname;
    uint ae_um_rectype;
    uint ae_um_action;
    uint ae_um_datalen;
}
+/
/+ [CONFLICTED] struct AE_NETLOGON
{
    uint ae_no_compname;
    uint ae_no_username;
    uint ae_no_privilege;
    uint ae_no_authflags;
}
+/
/+ [CONFLICTED] struct AE_NETLOGOFF
{
    uint ae_nf_compname;
    uint ae_nf_username;
    uint ae_nf_reserved1;
    uint ae_nf_reserved2;
}
+/
struct AE_ACCLIM
{
    uint ae_al_compname;
    uint ae_al_username;
    uint ae_al_resname;
    uint ae_al_limit;
}
/+ [CONFLICTED] struct AE_LOCKOUT
{
    uint ae_lk_compname;
    uint ae_lk_username;
    uint ae_lk_action;
    uint ae_lk_bad_pw_count;
}
+/
struct AE_GENERIC
{
    uint ae_ge_msgfile;
    uint ae_ge_msgnum;
    uint ae_ge_params;
    uint ae_ge_param1;
    uint ae_ge_param2;
    uint ae_ge_param3;
    uint ae_ge_param4;
    uint ae_ge_param5;
    uint ae_ge_param6;
    uint ae_ge_param7;
    uint ae_ge_param8;
    uint ae_ge_param9;
}
alias NETSETUP_NAME_TYPE = int;
enum : int
{
    NetSetupUnknown           = 0x00000000,
    NetSetupMachine           = 0x00000001,
    NetSetupWorkgroup         = 0x00000002,
    NetSetupDomain            = 0x00000003,
    NetSetupNonExistentDomain = 0x00000004,
    NetSetupDnsMachine        = 0x00000005,
}

alias DSREG_JOIN_TYPE = int;
enum : int
{
    DSREG_UNKNOWN_JOIN   = 0x00000000,
    DSREG_DEVICE_JOIN    = 0x00000001,
    DSREG_WORKPLACE_JOIN = 0x00000002,
}

struct DSREG_USER_INFO
{
    PWSTR pszUserEmail;
    PWSTR pszUserKeyId;
    PWSTR pszUserKeyName;
}
struct DSREG_JOIN_INFO
{
    DSREG_JOIN_TYPE joinType;
    const(CERT_CONTEXT)* pJoinCertificate;
    PWSTR pszDeviceId;
    PWSTR pszIdpDomain;
    PWSTR pszTenantId;
    PWSTR pszJoinUserEmail;
    PWSTR pszTenantDisplayName;
    PWSTR pszMdmEnrollmentUrl;
    PWSTR pszMdmTermsOfUseUrl;
    PWSTR pszMdmComplianceUrl;
    PWSTR pszUserSettingSyncUrl;
    DSREG_USER_INFO* pUserInfo;
}
alias NET_COMPUTER_NAME_TYPE = int;
enum : int
{
    NetPrimaryComputerName    = 0x00000000,
    NetAlternateComputerNames = 0x00000001,
    NetAllComputerNames       = 0x00000002,
    NetComputerNameTypeMax    = 0x00000003,
}

struct NETSETUP_PROVISIONING_PARAMS
{
    uint dwVersion;
    const(wchar)* lpDomain;
    const(wchar)* lpHostName;
    const(wchar)* lpMachineAccountOU;
    const(wchar)* lpDcName;
    NETSETUP_PROVISION dwProvisionOptions;
    const(wchar)** aCertTemplateNames;
    uint cCertTemplateNames;
    const(wchar)** aMachinePolicyNames;
    uint cMachinePolicyNames;
    const(wchar)** aMachinePolicyPaths;
    uint cMachinePolicyPaths;
    PWSTR lpNetbiosName;
    PWSTR lpSiteName;
    PWSTR lpPrimaryDNSDomain;
}
alias NETSETUP_JOIN_STATUS = int;
enum : int
{
    NetSetupUnknownStatus = 0x00000000,
    NetSetupUnjoined      = 0x00000001,
    NetSetupWorkgroupName = 0x00000002,
    NetSetupDomainName    = 0x00000003,
}

struct AT_INFO
{
    ulong JobTime;
    uint DaysOfMonth;
    ubyte DaysOfWeek;
    ubyte Flags;
    PWSTR Command;
}
struct AT_ENUM
{
    uint JobId;
    ulong JobTime;
    uint DaysOfMonth;
    ubyte DaysOfWeek;
    ubyte Flags;
    PWSTR Command;
}
struct FLAT_STRING
{
    short MaximumLength;
    short Length;
    CHAR[1] Buffer;
}
struct NETWORK_NAME
{
    FLAT_STRING Name;
}
struct HARDWARE_ADDRESS
{
    ubyte[6] Address;
}
enum IID_IEnumNetCfgBindingInterface = GUID(0xc0e8ae90, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetCfgBindingInterface : IUnknown
{
    HRESULT Next(uint, INetCfgBindingInterface*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetCfgBindingInterface*);
}
enum IID_IEnumNetCfgBindingPath = GUID(0xc0e8ae91, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetCfgBindingPath : IUnknown
{
    HRESULT Next(uint, INetCfgBindingPath*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetCfgBindingPath*);
}
enum IID_IEnumNetCfgComponent = GUID(0xc0e8ae92, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface IEnumNetCfgComponent : IUnknown
{
    HRESULT Next(uint, INetCfgComponent*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNetCfgComponent*);
}
enum IID_INetCfg = GUID(0xc0e8ae93, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfg : IUnknown
{
    HRESULT Initialize(void*);
    HRESULT Uninitialize();
    HRESULT Apply();
    HRESULT Cancel();
    HRESULT EnumComponents(const(GUID)*, IEnumNetCfgComponent*);
    HRESULT FindComponent(const(wchar)*, INetCfgComponent*);
    HRESULT QueryNetCfgClass(const(GUID)*, const(GUID)*, void**);
}
enum IID_INetCfgLock = GUID(0xc0e8ae9f, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgLock : IUnknown
{
    HRESULT AcquireWriteLock(uint, const(wchar)*, PWSTR*);
    HRESULT ReleaseWriteLock();
    HRESULT IsWriteLocked(PWSTR*);
}
enum IID_INetCfgBindingInterface = GUID(0xc0e8ae94, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgBindingInterface : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetUpperComponent(INetCfgComponent*);
    HRESULT GetLowerComponent(INetCfgComponent*);
}
enum IID_INetCfgBindingPath = GUID(0xc0e8ae96, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgBindingPath : IUnknown
{
    HRESULT IsSamePathAs(INetCfgBindingPath);
    HRESULT IsSubPathOf(INetCfgBindingPath);
    HRESULT IsEnabled();
    HRESULT Enable(BOOL);
    HRESULT GetPathToken(PWSTR*);
    HRESULT GetOwner(INetCfgComponent*);
    HRESULT GetDepth(uint*);
    HRESULT EnumBindingInterfaces(IEnumNetCfgBindingInterface*);
}
enum IID_INetCfgClass = GUID(0xc0e8ae97, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgClass : IUnknown
{
    HRESULT FindComponent(const(wchar)*, INetCfgComponent*);
    HRESULT EnumComponents(IEnumNetCfgComponent*);
}
alias OBO_TOKEN_TYPE = int;
enum : int
{
    OBO_USER      = 0x00000001,
    OBO_COMPONENT = 0x00000002,
    OBO_SOFTWARE  = 0x00000003,
}

struct OBO_TOKEN
{
    OBO_TOKEN_TYPE Type;
    INetCfgComponent pncc;
    const(wchar)* pszwManufacturer;
    const(wchar)* pszwProduct;
    const(wchar)* pszwDisplayName;
    BOOL fRegistered;
}
enum IID_INetCfgClassSetup = GUID(0xc0e8ae9d, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgClassSetup : IUnknown
{
    HRESULT SelectAndInstall(HWND, OBO_TOKEN*, INetCfgComponent*);
    HRESULT Install(const(wchar)*, OBO_TOKEN*, uint, uint, const(wchar)*, const(wchar)*, INetCfgComponent*);
    HRESULT DeInstall(INetCfgComponent, OBO_TOKEN*, PWSTR*);
}
enum IID_INetCfgClassSetup2 = GUID(0xc0e8aea0, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgClassSetup2 : INetCfgClassSetup
{
    HRESULT UpdateNonEnumeratedComponent(INetCfgComponent, uint, uint);
}
alias COMPONENT_CHARACTERISTICS = int;
enum : int
{
    NCF_VIRTUAL                     = 0x00000001,
    NCF_SOFTWARE_ENUMERATED         = 0x00000002,
    NCF_PHYSICAL                    = 0x00000004,
    NCF_HIDDEN                      = 0x00000008,
    NCF_NO_SERVICE                  = 0x00000010,
    NCF_NOT_USER_REMOVABLE          = 0x00000020,
    NCF_MULTIPORT_INSTANCED_ADAPTER = 0x00000040,
    NCF_HAS_UI                      = 0x00000080,
    NCF_SINGLE_INSTANCE             = 0x00000100,
    NCF_FILTER                      = 0x00000400,
    NCF_DONTEXPOSELOWER             = 0x00001000,
    NCF_HIDE_BINDING                = 0x00002000,
    NCF_NDIS_PROTOCOL               = 0x00004000,
    NCF_FIXED_BINDING               = 0x00020000,
    NCF_LW_FILTER                   = 0x00040000,
}

alias NCRP_FLAGS = int;
enum : int
{
    NCRP_QUERY_PROPERTY_UI = 0x00000001,
    NCRP_SHOW_PROPERTY_UI  = 0x00000002,
}

enum IID_INetCfgComponent = GUID(0xc0e8ae99, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgComponent : IUnknown
{
    HRESULT GetDisplayName(PWSTR*);
    HRESULT SetDisplayName(const(wchar)*);
    HRESULT GetHelpText(PWSTR*);
    HRESULT GetId(PWSTR*);
    HRESULT GetCharacteristics(uint*);
    HRESULT GetInstanceGuid(GUID*);
    HRESULT GetPnpDevNodeId(PWSTR*);
    HRESULT GetClassGuid(GUID*);
    HRESULT GetBindName(PWSTR*);
    HRESULT GetDeviceStatus(uint*);
    HRESULT OpenParamKey(HKEY*);
    HRESULT RaisePropertyUi(HWND, uint, IUnknown);
}
alias SUPPORTS_BINDING_INTERFACE_FLAGS = int;
enum : int
{
    NCF_LOWER = 0x00000001,
    NCF_UPPER = 0x00000002,
}

alias ENUM_BINDING_PATHS_FLAGS = int;
enum : int
{
    EBP_ABOVE = 0x00000001,
    EBP_BELOW = 0x00000002,
}

enum IID_INetCfgComponentBindings = GUID(0xc0e8ae9e, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgComponentBindings : IUnknown
{
    HRESULT BindTo(INetCfgComponent);
    HRESULT UnbindFrom(INetCfgComponent);
    HRESULT SupportsBindingInterface(uint, const(wchar)*);
    HRESULT IsBoundTo(INetCfgComponent);
    HRESULT IsBindableTo(INetCfgComponent);
    HRESULT EnumBindingPaths(uint, IEnumNetCfgBindingPath*);
    HRESULT MoveBefore(INetCfgBindingPath, INetCfgBindingPath);
    HRESULT MoveAfter(INetCfgBindingPath, INetCfgBindingPath);
}
enum IID_INetCfgSysPrep = GUID(0xc0e8ae98, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgSysPrep : IUnknown
{
    HRESULT HrSetupSetFirstDword(const(wchar)*, const(wchar)*, uint);
    HRESULT HrSetupSetFirstString(const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT HrSetupSetFirstStringAsBool(const(wchar)*, const(wchar)*, BOOL);
    HRESULT HrSetupSetFirstMultiSzField(const(wchar)*, const(wchar)*, const(wchar)*);
}
alias NCPNP_RECONFIG_LAYER = int;
enum : int
{
    NCRL_NDIS = 0x00000001,
    NCRL_TDI  = 0x00000002,
}

enum IID_INetCfgPnpReconfigCallback = GUID(0x8d84bd35, 0xe227, 0x11d2, [0xb7, 0x0, 0x0, 0xa0, 0xc9, 0x8a, 0x6a, 0x85]);
interface INetCfgPnpReconfigCallback : IUnknown
{
    HRESULT SendPnpReconfig(NCPNP_RECONFIG_LAYER, const(wchar)*, const(wchar)*, void*, uint);
}
enum IID_INetCfgComponentControl = GUID(0x932238df, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentControl : IUnknown
{
    HRESULT Initialize(INetCfgComponent, INetCfg, BOOL);
    HRESULT ApplyRegistryChanges();
    HRESULT ApplyPnpChanges(INetCfgPnpReconfigCallback);
    HRESULT CancelChanges();
}
alias NETWORK_INSTALL_TIME = int;
enum : int
{
    NSF_PRIMARYINSTALL = 0x00000001,
    NSF_POSTSYSINSTALL = 0x00000002,
}

alias NETWORK_UPGRADE_TYPE = int;
enum : int
{
    NSF_WIN16_UPGRADE     = 0x00000010,
    NSF_WIN95_UPGRADE     = 0x00000020,
    NSF_WINNT_WKS_UPGRADE = 0x00000040,
    NSF_WINNT_SVR_UPGRADE = 0x00000080,
    NSF_WINNT_SBS_UPGRADE = 0x00000100,
    NSF_COMPONENT_UPDATE  = 0x00000200,
}

enum IID_INetCfgComponentSetup = GUID(0x932238e3, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentSetup : IUnknown
{
    HRESULT Install(uint);
    HRESULT Upgrade(uint, uint);
    HRESULT ReadAnswerFile(const(wchar)*, const(wchar)*);
    HRESULT Removing();
}
alias DEFAULT_PAGES = int;
enum : int
{
    DPP_ADVANCED = 0x00000001,
}

enum IID_INetCfgComponentPropertyUi = GUID(0x932238e0, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentPropertyUi : IUnknown
{
    HRESULT QueryPropertyUi(IUnknown);
    HRESULT SetContext(IUnknown);
    HRESULT MergePropPages(uint*, ubyte**, uint*, HWND, const(wchar)**);
    HRESULT ValidateProperties(HWND);
    HRESULT ApplyProperties();
    HRESULT CancelProperties();
}
alias BIND_FLAGS1 = int;
enum : int
{
    NCN_ADD            = 0x00000001,
    NCN_REMOVE         = 0x00000002,
    NCN_UPDATE         = 0x00000004,
    NCN_ENABLE         = 0x00000010,
    NCN_DISABLE        = 0x00000020,
    NCN_BINDING_PATH   = 0x00000100,
    NCN_PROPERTYCHANGE = 0x00000200,
    NCN_NET            = 0x00010000,
    NCN_NETTRANS       = 0x00020000,
    NCN_NETCLIENT      = 0x00040000,
    NCN_NETSERVICE     = 0x00080000,
}

enum IID_INetCfgComponentNotifyBinding = GUID(0x932238e1, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentNotifyBinding : IUnknown
{
    HRESULT QueryBindingPath(uint, INetCfgBindingPath);
    HRESULT NotifyBindingPath(uint, INetCfgBindingPath);
}
enum IID_INetCfgComponentNotifyGlobal = GUID(0x932238e2, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentNotifyGlobal : IUnknown
{
    HRESULT GetSupportedNotifications(uint*);
    HRESULT SysQueryBindingPath(uint, INetCfgBindingPath);
    HRESULT SysNotifyBindingPath(uint, INetCfgBindingPath);
    HRESULT SysNotifyComponent(uint, INetCfgComponent);
}
enum IID_INetCfgComponentUpperEdge = GUID(0x932238e4, 0xbea1, 0x11d0, [0x92, 0x98, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0xcf]);
interface INetCfgComponentUpperEdge : IUnknown
{
    HRESULT GetInterfaceIdsForAdapter(INetCfgComponent, uint*, GUID**);
    HRESULT AddInterfacesToAdapter(INetCfgComponent, uint);
    HRESULT RemoveInterfacesFromAdapter(INetCfgComponent, uint, const(GUID)*);
}
enum IID_INetLanConnectionUiInfo = GUID(0xc08956a6, 0x1cd3, 0x11d1, [0xb1, 0xc5, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetLanConnectionUiInfo : IUnknown
{
    HRESULT GetDeviceGuid(GUID*);
}
alias RASCON_UIINFO_FLAGS = int;
enum : int
{
    RCUIF_VPN                       = 0x00000001,
    RCUIF_DEMAND_DIAL               = 0x00000002,
    RCUIF_NOT_ADMIN                 = 0x00000004,
    RCUIF_USE_IPv4_STATICADDRESS    = 0x00000008,
    RCUIF_USE_IPv4_NAME_SERVERS     = 0x00000010,
    RCUIF_USE_IPv4_REMOTE_GATEWAY   = 0x00000020,
    RCUIF_USE_IPv4_EXPLICIT_METRIC  = 0x00000040,
    RCUIF_USE_HEADER_COMPRESSION    = 0x00000080,
    RCUIF_USE_DISABLE_REGISTER_DNS  = 0x00000100,
    RCUIF_USE_PRIVATE_DNS_SUFFIX    = 0x00000200,
    RCUIF_ENABLE_NBT                = 0x00000400,
    RCUIF_USE_IPv6_STATICADDRESS    = 0x00000800,
    RCUIF_USE_IPv6_NAME_SERVERS     = 0x00001000,
    RCUIF_USE_IPv6_REMOTE_GATEWAY   = 0x00002000,
    RCUIF_USE_IPv6_EXPLICIT_METRIC  = 0x00004000,
    RCUIF_DISABLE_CLASS_BASED_ROUTE = 0x00008000,
}

struct RASCON_IPUI
{
    GUID guidConnection;
    BOOL fIPv6Cfg;
    uint dwFlags;
    wchar[16] pszwIpAddr;
    wchar[16] pszwDnsAddr;
    wchar[16] pszwDns2Addr;
    wchar[16] pszwWinsAddr;
    wchar[16] pszwWins2Addr;
    wchar[256] pszwDnsSuffix;
    wchar[65] pszwIpv6Addr;
    uint dwIpv6PrefixLength;
    wchar[65] pszwIpv6DnsAddr;
    wchar[65] pszwIpv6Dns2Addr;
    uint dwIPv4InfMetric;
    uint dwIPv6InfMetric;
}
enum IID_INetRasConnectionIpUiInfo = GUID(0xfaedcf58, 0x31fe, 0x11d1, [0xaa, 0xd2, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetRasConnectionIpUiInfo : IUnknown
{
    HRESULT GetUiInfo(RASCON_IPUI*);
}
enum IID_INetCfgComponentSysPrep = GUID(0xc0e8ae9a, 0x306e, 0x11d1, [0xaa, 0xcf, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
interface INetCfgComponentSysPrep : IUnknown
{
    HRESULT SaveAdapterParameters(INetCfgSysPrep, const(wchar)*, GUID*);
    HRESULT RestoreAdapterParameters(const(wchar)*, const(wchar)*, GUID*);
}
enum CLSID_NetProvisioning = GUID(0x2aa2b5fe, 0xb846, 0x4d07, [0x81, 0xc, 0xb2, 0x1e, 0xe4, 0x53, 0x20, 0xe3]);
struct NetProvisioning
{
}
enum IID_IProvisioningDomain = GUID(0xc96fbd50, 0x24dd, 0x11d8, [0x89, 0xfb, 0x0, 0x90, 0x4b, 0x2e, 0xa9, 0xc6]);
interface IProvisioningDomain : IUnknown
{
    HRESULT Add(const(wchar)*);
    HRESULT Query(const(wchar)*, const(wchar)*, const(wchar)*, IXMLDOMNodeList*);
}
enum IID_IProvisioningProfileWireless = GUID(0xc96fbd51, 0x24dd, 0x11d8, [0x89, 0xfb, 0x0, 0x90, 0x4b, 0x2e, 0xa9, 0xc6]);
interface IProvisioningProfileWireless : IUnknown
{
    HRESULT CreateProfile(BSTR, BSTR, GUID*, uint*);
}
struct RTR_TOC_ENTRY
{
    uint InfoType;
    uint InfoSize;
    uint Count;
    uint Offset;
}
struct RTR_INFO_BLOCK_HEADER
{
    uint Version;
    uint Size;
    uint TocEntriesCount;
    RTR_TOC_ENTRY[1] TocEntry;
}
alias WORKERFUNCTION = void function(void*);
struct MPR_PROTOCOL_0
{
    uint dwProtocolId;
    wchar[41] wszProtocol;
    wchar[49] wszDLLName;
}
