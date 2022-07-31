module windows.win32.system.diagnostics.toolhelp;

import windows.win32.foundation : BOOL, CHAR, HANDLE, HINSTANCE;

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

HANDLE CreateToolhelp32Snapshot(CREATE_TOOLHELP_SNAPSHOT_FLAGS, uint);
BOOL Heap32ListFirst(HANDLE, HEAPLIST32*);
BOOL Heap32ListNext(HANDLE, HEAPLIST32*);
BOOL Heap32First(HEAPENTRY32*, uint, ulong);
BOOL Heap32Next(HEAPENTRY32*);
BOOL Toolhelp32ReadProcessMemory(uint, const(void)*, void*, ulong, ulong*);
BOOL Process32FirstW(HANDLE, PROCESSENTRY32W*);
BOOL Process32NextW(HANDLE, PROCESSENTRY32W*);
BOOL Process32First(HANDLE, PROCESSENTRY32*);
BOOL Process32Next(HANDLE, PROCESSENTRY32*);
BOOL Thread32First(HANDLE, THREADENTRY32*);
BOOL Thread32Next(HANDLE, THREADENTRY32*);
BOOL Module32FirstW(HANDLE, MODULEENTRY32W*);
BOOL Module32NextW(HANDLE, MODULEENTRY32W*);
BOOL Module32First(HANDLE, MODULEENTRY32*);
BOOL Module32Next(HANDLE, MODULEENTRY32*);
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
    HINSTANCE hModule;
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
    HINSTANCE hModule;
    CHAR[256] szModule;
    CHAR[260] szExePath;
}
