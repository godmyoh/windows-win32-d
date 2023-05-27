module windows.win32.system.libraryloader;

import windows.win32.foundation : BOOL, FARPROC, HANDLE, HGLOBAL, HMODULE, HRSRC, PSTR, PWSTR;

version (Windows):
extern (Windows):

alias LOAD_LIBRARY_FLAGS = uint;
enum : uint
{
    DONT_RESOLVE_DLL_REFERENCES               = 0x00000001,
    LOAD_LIBRARY_AS_DATAFILE                  = 0x00000002,
    LOAD_WITH_ALTERED_SEARCH_PATH             = 0x00000008,
    LOAD_IGNORE_CODE_AUTHZ_LEVEL              = 0x00000010,
    LOAD_LIBRARY_AS_IMAGE_RESOURCE            = 0x00000020,
    LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE        = 0x00000040,
    LOAD_LIBRARY_REQUIRE_SIGNED_TARGET        = 0x00000080,
    LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR          = 0x00000100,
    LOAD_LIBRARY_SEARCH_APPLICATION_DIR       = 0x00000200,
    LOAD_LIBRARY_SEARCH_USER_DIRS             = 0x00000400,
    LOAD_LIBRARY_SEARCH_SYSTEM32              = 0x00000800,
    LOAD_LIBRARY_SEARCH_DEFAULT_DIRS          = 0x00001000,
    LOAD_LIBRARY_SAFE_CURRENT_DIRS            = 0x00002000,
    LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER = 0x00004000,
}

BOOL DisableThreadLibraryCalls(HMODULE);
HRSRC FindResourceExW(HMODULE, const(wchar)*, const(wchar)*, ushort);
void FreeLibraryAndExitThread(HMODULE, uint);
BOOL FreeResource(HGLOBAL);
uint GetModuleFileNameA(HMODULE, PSTR, uint);
uint GetModuleFileNameW(HMODULE, PWSTR, uint);
HMODULE GetModuleHandleA(const(char)*);
HMODULE GetModuleHandleW(const(wchar)*);
BOOL GetModuleHandleExA(uint, const(char)*, HMODULE*);
BOOL GetModuleHandleExW(uint, const(wchar)*, HMODULE*);
FARPROC GetProcAddress(HMODULE, const(char)*);
HMODULE LoadLibraryExA(const(char)*, HANDLE, LOAD_LIBRARY_FLAGS);
HMODULE LoadLibraryExW(const(wchar)*, HANDLE, LOAD_LIBRARY_FLAGS);
HGLOBAL LoadResource(HMODULE, HRSRC);
void* LockResource(HGLOBAL);
uint SizeofResource(HMODULE, HRSRC);
void* AddDllDirectory(const(wchar)*);
BOOL RemoveDllDirectory(void*);
BOOL SetDefaultDllDirectories(LOAD_LIBRARY_FLAGS);
BOOL EnumResourceLanguagesExA(HMODULE, const(char)*, const(char)*, ENUMRESLANGPROCA, long, uint, ushort);
BOOL EnumResourceLanguagesExW(HMODULE, const(wchar)*, const(wchar)*, ENUMRESLANGPROCW, long, uint, ushort);
BOOL EnumResourceNamesExA(HMODULE, const(char)*, ENUMRESNAMEPROCA, long, uint, ushort);
BOOL EnumResourceNamesExW(HMODULE, const(wchar)*, ENUMRESNAMEPROCW, long, uint, ushort);
BOOL EnumResourceTypesExA(HMODULE, ENUMRESTYPEPROCA, long, uint, ushort);
BOOL EnumResourceTypesExW(HMODULE, ENUMRESTYPEPROCW, long, uint, ushort);
HRSRC FindResourceW(HMODULE, const(wchar)*, const(wchar)*);
HMODULE LoadLibraryA(const(char)*);
HMODULE LoadLibraryW(const(wchar)*);
BOOL EnumResourceNamesW(HMODULE, const(wchar)*, ENUMRESNAMEPROCW, long);
BOOL EnumResourceNamesA(HMODULE, const(char)*, ENUMRESNAMEPROCA, long);
uint LoadModule(const(char)*, void*);
HMODULE LoadPackagedLibrary(const(wchar)*, uint);
HRSRC FindResourceA(HMODULE, const(char)*, const(char)*);
HRSRC FindResourceExA(HMODULE, const(char)*, const(char)*, ushort);
BOOL EnumResourceTypesA(HMODULE, ENUMRESTYPEPROCA, long);
BOOL EnumResourceTypesW(HMODULE, ENUMRESTYPEPROCW, long);
BOOL EnumResourceLanguagesA(HMODULE, const(char)*, const(char)*, ENUMRESLANGPROCA, long);
BOOL EnumResourceLanguagesW(HMODULE, const(wchar)*, const(wchar)*, ENUMRESLANGPROCW, long);
HANDLE BeginUpdateResourceA(const(char)*, BOOL);
HANDLE BeginUpdateResourceW(const(wchar)*, BOOL);
BOOL UpdateResourceA(HANDLE, const(char)*, const(char)*, ushort, void*, uint);
BOOL UpdateResourceW(HANDLE, const(wchar)*, const(wchar)*, ushort, void*, uint);
BOOL EndUpdateResourceA(HANDLE, BOOL);
BOOL EndUpdateResourceW(HANDLE, BOOL);
BOOL SetDllDirectoryA(const(char)*);
BOOL SetDllDirectoryW(const(wchar)*);
uint GetDllDirectoryA(uint, PSTR);
uint GetDllDirectoryW(uint, PWSTR);
enum FIND_RESOURCE_DIRECTORY_TYPES = 0x00000100;
enum FIND_RESOURCE_DIRECTORY_NAMES = 0x00000200;
enum FIND_RESOURCE_DIRECTORY_LANGUAGES = 0x00000400;
enum RESOURCE_ENUM_LN = 0x00000001;
enum RESOURCE_ENUM_MUI = 0x00000002;
enum RESOURCE_ENUM_MUI_SYSTEM = 0x00000004;
enum RESOURCE_ENUM_VALIDATE = 0x00000008;
enum RESOURCE_ENUM_MODULE_EXACT = 0x00000010;
enum SUPPORT_LANG_NUMBER = 0x00000020;
enum GET_MODULE_HANDLE_EX_FLAG_PIN = 0x00000001;
enum GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 0x00000002;
enum GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS = 0x00000004;
enum CURRENT_IMPORT_REDIRECTION_VERSION = 0x00000001;
enum LOAD_LIBRARY_OS_INTEGRITY_CONTINUITY = 0x00008000;
struct ENUMUILANG
{
    uint NumOfEnumUILang;
    uint SizeOfEnumUIBuffer;
    ushort* pEnumUIBuffer;
}
alias ENUMRESLANGPROCA = BOOL function(HMODULE, const(char)*, const(char)*, ushort, long);
alias ENUMRESLANGPROCW = BOOL function(HMODULE, const(wchar)*, const(wchar)*, ushort, long);
alias ENUMRESNAMEPROCA = BOOL function(HMODULE, const(char)*, PSTR, long);
alias ENUMRESNAMEPROCW = BOOL function(HMODULE, const(wchar)*, PWSTR, long);
alias ENUMRESTYPEPROCA = BOOL function(HMODULE, PSTR, long);
alias ENUMRESTYPEPROCW = BOOL function(HMODULE, PWSTR, long);
alias PGET_MODULE_HANDLE_EXA = BOOL function(uint, const(char)*, HMODULE*);
alias PGET_MODULE_HANDLE_EXW = BOOL function(uint, const(wchar)*, HMODULE*);
struct REDIRECTION_FUNCTION_DESCRIPTOR
{
    const(char)* DllName;
    const(char)* FunctionName;
    void* RedirectionTarget;
}
struct REDIRECTION_DESCRIPTOR
{
    uint Version;
    uint FunctionCount;
    REDIRECTION_FUNCTION_DESCRIPTOR* Redirections;
}
