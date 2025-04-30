module windows.win32.system.diagnostics.toolhelp;

import windows.win32.foundation : BOOL, CHAR, HANDLE, HMODULE;

version (Windows):
extern (Windows):

alias CREATE_TOOLHELP_SNAPSHOT_FLAGS = uint;
enum : uint
{
    TH32CS_INHERIT      = 0x80000000,
    TH32CS_SNAPALL      = 0x0000000f,
    TH32CS_SNAPHEAPLIST = 0x00000001,
    TH32CS_SNAPMODULE   = 0x00000008,
    TH32CS_SNAPMODULE32 = 0x00000010,
    TH32CS_SNAPPROCESS  = 0x00000002,
    TH32CS_SNAPTHREAD   = 0x00000004,
}

alias HEAPENTRY32_FLAGS = uint;
enum : uint
{
    LF32_FIXED    = 0x00000001,
    LF32_FREE     = 0x00000002,
    LF32_MOVEABLE = 0x00000004,
}

HANDLE CreateToolhelp32Snapshot(CREATE_TOOLHELP_SNAPSHOT_FLAGS dwFlags, uint th32ProcessID);
BOOL Heap32ListFirst(HANDLE hSnapshot, HEAPLIST32* lphl);
BOOL Heap32ListNext(HANDLE hSnapshot, HEAPLIST32* lphl);
BOOL Heap32First(HEAPENTRY32* lphe, uint th32ProcessID, ulong th32HeapID);
BOOL Heap32Next(HEAPENTRY32* lphe);
BOOL Toolhelp32ReadProcessMemory(uint th32ProcessID, const(void)* lpBaseAddress, void* lpBuffer, ulong cbRead, ulong* lpNumberOfBytesRead);
BOOL Process32FirstW(HANDLE hSnapshot, PROCESSENTRY32W* lppe);
BOOL Process32NextW(HANDLE hSnapshot, PROCESSENTRY32W* lppe);
BOOL Process32First(HANDLE hSnapshot, PROCESSENTRY32* lppe);
BOOL Process32Next(HANDLE hSnapshot, PROCESSENTRY32* lppe);
BOOL Thread32First(HANDLE hSnapshot, THREADENTRY32* lpte);
BOOL Thread32Next(HANDLE hSnapshot, THREADENTRY32* lpte);
BOOL Module32FirstW(HANDLE hSnapshot, MODULEENTRY32W* lpme);
BOOL Module32NextW(HANDLE hSnapshot, MODULEENTRY32W* lpme);
BOOL Module32First(HANDLE hSnapshot, MODULEENTRY32* lpme);
BOOL Module32Next(HANDLE hSnapshot, MODULEENTRY32* lpme);
enum MAX_MODULE_NAME32 = 0x000000ff;
enum HF32_DEFAULT = 0x00000001;
enum HF32_SHARED = 0x00000002;
struct HEAPLIST32
{
    ulong dwSize;
    uint th32ProcessID;
    ulong th32HeapID;
    uint dwFlags;
}
struct HEAPENTRY32
{
    ulong dwSize;
    HANDLE hHandle;
    ulong dwAddress;
    ulong dwBlockSize;
    HEAPENTRY32_FLAGS dwFlags;
    uint dwLockCount;
    uint dwResvd;
    uint th32ProcessID;
    ulong th32HeapID;
}
struct PROCESSENTRY32W
{
    uint dwSize;
    uint cntUsage;
    uint th32ProcessID;
    ulong th32DefaultHeapID;
    uint th32ModuleID;
    uint cntThreads;
    uint th32ParentProcessID;
    int pcPriClassBase;
    uint dwFlags;
    wchar[260] szExeFile;
}
struct PROCESSENTRY32
{
    uint dwSize;
    uint cntUsage;
    uint th32ProcessID;
    ulong th32DefaultHeapID;
    uint th32ModuleID;
    uint cntThreads;
    uint th32ParentProcessID;
    int pcPriClassBase;
    uint dwFlags;
    CHAR[260] szExeFile;
}
struct THREADENTRY32
{
    uint dwSize;
    uint cntUsage;
    uint th32ThreadID;
    uint th32OwnerProcessID;
    int tpBasePri;
    int tpDeltaPri;
    uint dwFlags;
}
struct MODULEENTRY32W
{
    uint dwSize;
    uint th32ModuleID;
    uint th32ProcessID;
    uint GlblcntUsage;
    uint ProccntUsage;
    ubyte* modBaseAddr;
    uint modBaseSize;
    HMODULE hModule;
    wchar[256] szModule;
    wchar[260] szExePath;
}
struct MODULEENTRY32
{
    uint dwSize;
    uint th32ModuleID;
    uint th32ProcessID;
    uint GlblcntUsage;
    uint ProccntUsage;
    ubyte* modBaseAddr;
    uint modBaseSize;
    HMODULE hModule;
    CHAR[256] szModule;
    CHAR[260] szExePath;
}
