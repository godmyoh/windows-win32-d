module windows.win32.security.applocker;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, HANDLE, HWND, PWSTR;
import windows.win32.security : SAFER_LEVEL_HANDLE;
import windows.win32.security.cryptography : ALG_ID;

version (Windows):
extern (Windows):

alias SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS = uint;
enum : uint
{
    SAFER_TOKEN_NULL_IF_EQUAL = 0x00000001,
    SAFER_TOKEN_COMPARE_ONLY  = 0x00000002,
    SAFER_TOKEN_MAKE_INERT    = 0x00000004,
    SAFER_TOKEN_WANT_FLAGS    = 0x00000008,
}

BOOL SaferGetPolicyInformation(uint, SAFER_POLICY_INFO_CLASS, uint, void*, uint*, void*);
BOOL SaferSetPolicyInformation(uint, SAFER_POLICY_INFO_CLASS, uint, void*, void*);
BOOL SaferCreateLevel(uint, uint, uint, SAFER_LEVEL_HANDLE*, void*);
BOOL SaferCloseLevel(SAFER_LEVEL_HANDLE);
BOOL SaferIdentifyLevel(uint, SAFER_CODE_PROPERTIES_V2*, SAFER_LEVEL_HANDLE*, void*);
BOOL SaferComputeTokenFromLevel(SAFER_LEVEL_HANDLE, HANDLE, HANDLE*, SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS, void*);
BOOL SaferGetLevelInformation(SAFER_LEVEL_HANDLE, SAFER_OBJECT_INFO_CLASS, void*, uint, uint*);
BOOL SaferSetLevelInformation(SAFER_LEVEL_HANDLE, SAFER_OBJECT_INFO_CLASS, void*, uint);
BOOL SaferRecordEventLogEntry(SAFER_LEVEL_HANDLE, const(wchar)*, void*);
BOOL SaferiIsExecutableFileType(const(wchar)*, BOOLEAN);
enum SAFER_SCOPEID_MACHINE = 0x00000001;
enum SAFER_SCOPEID_USER = 0x00000002;
enum SAFER_LEVELID_FULLYTRUSTED = 0x00040000;
enum SAFER_LEVELID_NORMALUSER = 0x00020000;
enum SAFER_LEVELID_CONSTRAINED = 0x00010000;
enum SAFER_LEVELID_UNTRUSTED = 0x00001000;
enum SAFER_LEVELID_DISALLOWED = 0x00000000;
enum SAFER_LEVEL_OPEN = 0x00000001;
enum SAFER_MAX_FRIENDLYNAME_SIZE = 0x00000100;
enum SAFER_MAX_DESCRIPTION_SIZE = 0x00000100;
enum SAFER_MAX_HASH_SIZE = 0x00000040;
enum SAFER_CRITERIA_IMAGEPATH = 0x00000001;
enum SAFER_CRITERIA_NOSIGNEDHASH = 0x00000002;
enum SAFER_CRITERIA_IMAGEHASH = 0x00000004;
enum SAFER_CRITERIA_AUTHENTICODE = 0x00000008;
enum SAFER_CRITERIA_URLZONE = 0x00000010;
enum SAFER_CRITERIA_APPX_PACKAGE = 0x00000020;
enum SAFER_CRITERIA_IMAGEPATH_NT = 0x00001000;
enum SAFER_POLICY_JOBID_MASK = 0xff000000;
enum SAFER_POLICY_JOBID_CONSTRAINED = 0x04000000;
enum SAFER_POLICY_JOBID_UNTRUSTED = 0x03000000;
enum SAFER_POLICY_ONLY_EXES = 0x00010000;
enum SAFER_POLICY_SANDBOX_INERT = 0x00020000;
enum SAFER_POLICY_HASH_DUPLICATE = 0x00040000;
enum SAFER_POLICY_ONLY_AUDIT = 0x00001000;
enum SAFER_POLICY_BLOCK_CLIENT_UI = 0x00002000;
enum SAFER_POLICY_UIFLAGS_MASK = 0x000000ff;
enum SAFER_POLICY_UIFLAGS_INFORMATION_PROMPT = 0x00000001;
enum SAFER_POLICY_UIFLAGS_OPTION_PROMPT = 0x00000002;
enum SAFER_POLICY_UIFLAGS_HIDDEN = 0x00000004;
enum SRP_POLICY_EXE = "EXE";
enum SRP_POLICY_DLL = "DLL";
enum SRP_POLICY_MSI = "MSI";
enum SRP_POLICY_SCRIPT = "SCRIPT";
enum SRP_POLICY_SHELL = "SHELL";
enum SRP_POLICY_NOV2 = "IGNORESRPV2";
enum SRP_POLICY_APPX = "APPX";
enum SRP_POLICY_WLDPMSI = "WLDPMSI";
enum SRP_POLICY_WLDPSCRIPT = "WLDPSCRIPT";
enum SRP_POLICY_WLDPCONFIGCI = "WLDPCONFIGCI";
enum SRP_POLICY_MANAGEDINSTALLER = "MANAGEDINSTALLER";
struct SAFER_CODE_PROPERTIES_V1
{
    uint cbSize;
    uint dwCheckFlags;
    const(wchar)* ImagePath;
    HANDLE hImageFileHandle;
    uint UrlZoneId;
    ubyte[64] ImageHash;
    uint dwImageHashSize;
    long ImageSize;
    ALG_ID HashAlgorithm;
    ubyte* pByteBlock;
    HWND hWndParent;
    uint dwWVTUIChoice;
}
struct SAFER_CODE_PROPERTIES_V2
{
    uint cbSize;
    uint dwCheckFlags;
    const(wchar)* ImagePath;
    HANDLE hImageFileHandle;
    uint UrlZoneId;
    ubyte[64] ImageHash;
    uint dwImageHashSize;
    long ImageSize;
    ALG_ID HashAlgorithm;
    ubyte* pByteBlock;
    HWND hWndParent;
    uint dwWVTUIChoice;
    const(wchar)* PackageMoniker;
    const(wchar)* PackagePublisher;
    const(wchar)* PackageName;
    ulong PackageVersion;
    BOOL PackageIsFramework;
}
alias SAFER_POLICY_INFO_CLASS = int;
enum : int
{
    SaferPolicyLevelList                    = 0x00000001,
    SaferPolicyEnableTransparentEnforcement = 0x00000002,
    SaferPolicyDefaultLevel                 = 0x00000003,
    SaferPolicyEvaluateUserScope            = 0x00000004,
    SaferPolicyScopeFlags                   = 0x00000005,
    SaferPolicyDefaultLevelFlags            = 0x00000006,
    SaferPolicyAuthenticodeEnabled          = 0x00000007,
}

alias SAFER_OBJECT_INFO_CLASS = int;
enum : int
{
    SaferObjectLevelId                 = 0x00000001,
    SaferObjectScopeId                 = 0x00000002,
    SaferObjectFriendlyName            = 0x00000003,
    SaferObjectDescription             = 0x00000004,
    SaferObjectBuiltin                 = 0x00000005,
    SaferObjectDisallowed              = 0x00000006,
    SaferObjectDisableMaxPrivilege     = 0x00000007,
    SaferObjectInvertDeletedPrivileges = 0x00000008,
    SaferObjectDeletedPrivileges       = 0x00000009,
    SaferObjectDefaultOwner            = 0x0000000a,
    SaferObjectSidsToDisable           = 0x0000000b,
    SaferObjectRestrictedSidsInverted  = 0x0000000c,
    SaferObjectRestrictedSidsAdded     = 0x0000000d,
    SaferObjectAllIdentificationGuids  = 0x0000000e,
    SaferObjectSingleIdentification    = 0x0000000f,
    SaferObjectExtendedError           = 0x00000010,
}

alias SAFER_IDENTIFICATION_TYPES = int;
enum : int
{
    SaferIdentityDefault         = 0x00000000,
    SaferIdentityTypeImageName   = 0x00000001,
    SaferIdentityTypeImageHash   = 0x00000002,
    SaferIdentityTypeUrlZone     = 0x00000003,
    SaferIdentityTypeCertificate = 0x00000004,
}

struct SAFER_IDENTIFICATION_HEADER
{
    SAFER_IDENTIFICATION_TYPES dwIdentificationType;
    uint cbStructSize;
    GUID IdentificationGuid;
    FILETIME lastModified;
}
struct SAFER_PATHNAME_IDENTIFICATION
{
    SAFER_IDENTIFICATION_HEADER header;
    wchar[256] Description;
    PWSTR ImageName;
    uint dwSaferFlags;
}
struct SAFER_HASH_IDENTIFICATION
{
    SAFER_IDENTIFICATION_HEADER header;
    wchar[256] Description;
    wchar[256] FriendlyName;
    uint HashSize;
    ubyte[64] ImageHash;
    ALG_ID HashAlgorithm;
    long ImageSize;
    uint dwSaferFlags;
}
struct SAFER_HASH_IDENTIFICATION2
{
    SAFER_HASH_IDENTIFICATION hashIdentification;
    uint HashSize;
    ubyte[64] ImageHash;
    ALG_ID HashAlgorithm;
}
struct SAFER_URLZONE_IDENTIFICATION
{
    SAFER_IDENTIFICATION_HEADER header;
    uint UrlZoneId;
    uint dwSaferFlags;
}
