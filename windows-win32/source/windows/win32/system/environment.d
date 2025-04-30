module windows.win32.system.environment;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSTR, PWSTR;

version (Windows):
extern (Windows):

BOOL SetEnvironmentStringsW(PWSTR NewEnvironment);
PSTR GetCommandLineA();
PWSTR GetCommandLineW();
PSTR GetEnvironmentStrings();
PWSTR GetEnvironmentStringsW();
BOOL FreeEnvironmentStringsA(PSTR penv);
BOOL FreeEnvironmentStringsW(PWSTR penv);
uint GetEnvironmentVariableA(const(char)* lpName, PSTR lpBuffer, uint nSize);
uint GetEnvironmentVariableW(const(wchar)* lpName, PWSTR lpBuffer, uint nSize);
BOOL SetEnvironmentVariableA(const(char)* lpName, const(char)* lpValue);
BOOL SetEnvironmentVariableW(const(wchar)* lpName, const(wchar)* lpValue);
uint ExpandEnvironmentStringsA(const(char)* lpSrc, PSTR lpDst, uint nSize);
uint ExpandEnvironmentStringsW(const(wchar)* lpSrc, PWSTR lpDst, uint nSize);
BOOL SetCurrentDirectoryA(const(char)* lpPathName);
BOOL SetCurrentDirectoryW(const(wchar)* lpPathName);
uint GetCurrentDirectoryA(uint nBufferLength, PSTR lpBuffer);
uint GetCurrentDirectoryW(uint nBufferLength, PWSTR lpBuffer);
BOOL NeedCurrentDirectoryForExePathA(const(char)* ExeName);
BOOL NeedCurrentDirectoryForExePathW(const(wchar)* ExeName);
BOOL CreateEnvironmentBlock(void** lpEnvironment, HANDLE hToken, BOOL bInherit);
BOOL DestroyEnvironmentBlock(void* lpEnvironment);
BOOL ExpandEnvironmentStringsForUserA(HANDLE hToken, const(char)* lpSrc, PSTR lpDest, uint dwSize);
BOOL ExpandEnvironmentStringsForUserW(HANDLE hToken, const(wchar)* lpSrc, PWSTR lpDest, uint dwSize);
BOOL IsEnclaveTypeSupported(uint flEnclaveType);
void* CreateEnclave(HANDLE hProcess, void* lpAddress, ulong dwSize, ulong dwInitialCommitment, uint flEnclaveType, const(void)* lpEnclaveInformation, uint dwInfoLength, uint* lpEnclaveError);
BOOL LoadEnclaveData(HANDLE hProcess, void* lpAddress, const(void)* lpBuffer, ulong nSize, uint flProtect, const(void)* lpPageInformation, uint dwInfoLength, ulong* lpNumberOfBytesWritten, uint* lpEnclaveError);
BOOL InitializeEnclave(HANDLE hProcess, void* lpAddress, const(void)* lpEnclaveInformation, uint dwInfoLength, uint* lpEnclaveError);
BOOL LoadEnclaveImageA(void* lpEnclaveAddress, const(char)* lpImageName);
BOOL LoadEnclaveImageW(void* lpEnclaveAddress, const(wchar)* lpImageName);
BOOL CallEnclave(long lpRoutine, void* lpParameter, BOOL fWaitForThread, void** lpReturnValue);
BOOL TerminateEnclave(void* lpAddress, BOOL fWait);
BOOL DeleteEnclave(void* lpAddress);
HRESULT EnclaveGetAttestationReport(const(ubyte)* EnclaveData, void* Report, uint BufferSize, uint* OutputSize);
HRESULT EnclaveVerifyAttestationReport(uint EnclaveType, const(void)* Report, uint ReportSize);
HRESULT EnclaveSealData(const(void)* DataToEncrypt, uint DataToEncryptSize, ENCLAVE_SEALING_IDENTITY_POLICY IdentityPolicy, uint RuntimePolicy, void* ProtectedBlob, uint BufferSize, uint* ProtectedBlobSize);
HRESULT EnclaveUnsealData(const(void)* ProtectedBlob, uint ProtectedBlobSize, void* DecryptedData, uint BufferSize, uint* DecryptedDataSize, ENCLAVE_IDENTITY* SealingIdentity, uint* UnsealingFlags);
HRESULT EnclaveGetEnclaveInformation(uint InformationSize, ENCLAVE_INFORMATION* EnclaveInformation);
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
alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = int function(VBS_BASIC_ENCLAVE_EXCEPTION_AMD64* ExceptionRecord);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64* ThreadDescriptor);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64* ThreadDescriptor);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64* ThreadDescriptor);
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
alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE = void function(ulong ReturnValue);
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = int function(void* ExceptionRecord);
+/
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32* ThreadDescriptor);
+/
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32* ThreadDescriptor);
+/
alias VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES = int function(void* EnclaveAddress, ulong NumberOfBytes, void* SourceAddress, uint PageProtection);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES = int function(void* EnclaveAddress, ulong NumberOfBytes);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES = int function(void* EnclaveAddress, ulong NumberOfytes, uint PageProtection);
/+ [CONFLICTED] alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = int function(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32* ThreadDescriptor);
+/
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION = int function(ENCLAVE_INFORMATION* EnclaveInfo);
struct ENCLAVE_VBS_BASIC_KEY_REQUEST
{
    uint RequestSize;
    uint Flags;
    uint EnclaveSVN;
    uint SystemKeyID;
    uint CurrentSystemKeyID;
}
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY = int function(ENCLAVE_VBS_BASIC_KEY_REQUEST* KeyRequest, uint RequestedKeySize, ubyte* ReturnedKey);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT = int function(const(ubyte)* EnclaveData, void* Report, uint BufferSize, uint* OutputSize);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT = int function(const(void)* Report, uint ReportSize);
alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA = int function(ubyte* Buffer, uint NumberOfBytes, ulong* Generation);
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
