module windows.win32.system.environment;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSTR, PWSTR;

version (Windows):
extern (Windows):

BOOL SetEnvironmentStringsW(PWSTR);
PSTR GetCommandLineA();
PWSTR GetCommandLineW();
PSTR GetEnvironmentStrings();
PWSTR GetEnvironmentStringsW();
BOOL FreeEnvironmentStringsA(PSTR);
BOOL FreeEnvironmentStringsW(PWSTR);
uint GetEnvironmentVariableA(const(char)*, PSTR, uint);
uint GetEnvironmentVariableW(const(wchar)*, PWSTR, uint);
BOOL SetEnvironmentVariableA(const(char)*, const(char)*);
BOOL SetEnvironmentVariableW(const(wchar)*, const(wchar)*);
uint ExpandEnvironmentStringsA(const(char)*, PSTR, uint);
uint ExpandEnvironmentStringsW(const(wchar)*, PWSTR, uint);
BOOL SetCurrentDirectoryA(const(char)*);
BOOL SetCurrentDirectoryW(const(wchar)*);
uint GetCurrentDirectoryA(uint, PSTR);
uint GetCurrentDirectoryW(uint, PWSTR);
BOOL NeedCurrentDirectoryForExePathA(const(char)*);
BOOL NeedCurrentDirectoryForExePathW(const(wchar)*);
BOOL CreateEnvironmentBlock(void**, HANDLE, BOOL);
BOOL DestroyEnvironmentBlock(void*);
BOOL ExpandEnvironmentStringsForUserA(HANDLE, const(char)*, PSTR, uint);
BOOL ExpandEnvironmentStringsForUserW(HANDLE, const(wchar)*, PWSTR, uint);
BOOL IsEnclaveTypeSupported(uint);
void* CreateEnclave(HANDLE, void*, ulong, ulong, uint, const(void)*, uint, uint*);
BOOL LoadEnclaveData(HANDLE, void*, const(void)*, ulong, uint, const(void)*, uint, ulong*, uint*);
BOOL InitializeEnclave(HANDLE, void*, const(void)*, uint, uint*);
BOOL LoadEnclaveImageA(void*, const(char)*);
BOOL LoadEnclaveImageW(void*, const(wchar)*);
BOOL CallEnclave(long, void*, BOOL, void**);
BOOL TerminateEnclave(void*, BOOL);
BOOL DeleteEnclave(void*);
HRESULT EnclaveGetAttestationReport(const(ubyte)*, void*, uint, uint*);
HRESULT EnclaveVerifyAttestationReport(uint, const(void)*, uint);
HRESULT EnclaveSealData(const(void)*, uint, ENCLAVE_SEALING_IDENTITY_POLICY, uint, void*, uint, uint*);
HRESULT EnclaveUnsealData(const(void)*, uint, void*, uint, uint*, ENCLAVE_IDENTITY*, uint*);
HRESULT EnclaveGetEnclaveInformation(uint, ENCLAVE_INFORMATION*);
enum ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG = 0x00000001;
enum ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG = 0x00000002;
enum ENCLAVE_UNSEAL_FLAG_STALE_KEY = 0x00000001;
enum ENCLAVE_FLAG_FULL_DEBUG_ENABLED = 0x00000001;
enum ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED = 0x00000002;
enum ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE = 0x00000004;
enum VBS_ENCLAVE_REPORT_PKG_HEADER_VERSION_CURRENT = 0x00000001;
enum VBS_ENCLAVE_REPORT_SIGNATURE_SCHEME_SHA256_RSA_PSS_SHA256 = 0x00000001;
enum VBS_ENCLAVE_REPORT_VERSION_CURRENT = 0x00000001;
enum ENCLAVE_REPORT_DATA_LENGTH = 0x00000040;
enum VBS_ENCLAVE_VARDATA_INVALID = 0x00000000;
enum VBS_ENCLAVE_VARDATA_MODULE = 0x00000001;
enum ENCLAVE_VBS_BASIC_KEY_FLAG_MEASUREMENT = 0x00000001;
enum ENCLAVE_VBS_BASIC_KEY_FLAG_FAMILY_ID = 0x00000002;
enum ENCLAVE_VBS_BASIC_KEY_FLAG_IMAGE_ID = 0x00000004;
enum ENCLAVE_VBS_BASIC_KEY_FLAG_DEBUG_KEY = 0x00000008;
alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = int function(VBS_BASIC_ENCLAVE_EXCEPTION_AMD64*);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*);
alias ENCLAVE_SEALING_IDENTITY_POLICY = int;
enum : int
{
    ENCLAVE_IDENTITY_POLICY_SEAL_INVALID           = 0x00000000,
    ENCLAVE_IDENTITY_POLICY_SEAL_EXACT_CODE        = 0x00000001,
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_PRIMARY_CODE = 0x00000002,
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_IMAGE        = 0x00000003,
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_FAMILY       = 0x00000004,
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_AUTHOR       = 0x00000005,
}

struct ENCLAVE_IDENTITY
{
    align (1):
    ubyte[32] OwnerId;
    ubyte[32] UniqueId;
    ubyte[32] AuthorId;
    ubyte[16] FamilyId;
    ubyte[16] ImageId;
    uint EnclaveSvn;
    uint SecureKernelSvn;
    uint PlatformSvn;
    uint Flags;
    uint SigningLevel;
    uint EnclaveType;
}
struct VBS_ENCLAVE_REPORT_PKG_HEADER
{
    align (1):
    uint PackageSize;
    uint Version;
    uint SignatureScheme;
    uint SignedStatementSize;
    uint SignatureSize;
    uint Reserved;
}
struct VBS_ENCLAVE_REPORT
{
    align (1):
    uint ReportSize;
    uint ReportVersion;
    ubyte[64] EnclaveData;
    ENCLAVE_IDENTITY EnclaveIdentity;
}
struct VBS_ENCLAVE_REPORT_VARDATA_HEADER
{
    align (1):
    uint DataType;
    uint Size;
}
struct VBS_ENCLAVE_REPORT_MODULE
{
    align (1):
    VBS_ENCLAVE_REPORT_VARDATA_HEADER Header;
    ubyte[32] UniqueId;
    ubyte[32] AuthorId;
    ubyte[16] FamilyId;
    ubyte[16] ImageId;
    uint Svn;
    wchar[1] ModuleName;
}
struct ENCLAVE_INFORMATION
{
    uint EnclaveType;
    uint Reserved;
    void* BaseAddress;
    ulong Size;
    ENCLAVE_IDENTITY Identity;
}
struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32
{
    uint[4] ThreadContext;
    uint EntryPoint;
    uint StackPointer;
    uint ExceptionEntryPoint;
    uint ExceptionStack;
    uint ExceptionActive;
}
struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64
{
    ulong[4] ThreadContext;
    ulong EntryPoint;
    ulong StackPointer;
    ulong ExceptionEntryPoint;
    ulong ExceptionStack;
    uint ExceptionActive;
}
struct VBS_BASIC_ENCLAVE_EXCEPTION_AMD64
{
    uint ExceptionCode;
    uint NumberParameters;
    ulong[3] ExceptionInformation;
    ulong ExceptionRAX;
    ulong ExceptionRCX;
    ulong ExceptionRIP;
    ulong ExceptionRFLAGS;
    ulong ExceptionRSP;
}
alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE = void function(ulong);
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = int function(void*);
+/
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*);
+/
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*);
+/
alias VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES = int function(void*, ulong, void*, uint);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES = int function(void*, ulong);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES = int function(void*, ulong, uint);
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*);
+/
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION = int function(ENCLAVE_INFORMATION*);
struct ENCLAVE_VBS_BASIC_KEY_REQUEST
{
    uint RequestSize;
    uint Flags;
    uint EnclaveSVN;
    uint SystemKeyID;
    uint CurrentSystemKeyID;
}
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY = int function(ENCLAVE_VBS_BASIC_KEY_REQUEST*, uint, ubyte*);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT = int function(const(ubyte)*, void*, uint, uint*);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT = int function(const(void)*, uint);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA = int function(ubyte*, uint, ulong*);
struct VBS_BASIC_ENCLAVE_SYSCALL_PAGE
{
    VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE ReturnFromEnclave;
    VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION ReturnFromException;
    VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD TerminateThread;
    VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD InterruptThread;
    VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES CommitPages;
    VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES DecommitPages;
    VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES ProtectPages;
    VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD CreateThread;
    VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION GetEnclaveInformation;
    VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY GenerateKey;
    VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT GenerateReport;
    VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT VerifyReport;
    VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA GenerateRandomData;
}
