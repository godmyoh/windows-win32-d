module windows.win32.system.libraryloader;

import windows.win32.foundation : BOOL, FARPROC, HANDLE, HGLOBAL, HINSTANCE, HRSRC, PSTR, PWSTR;

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

BOOL DisableThreadLibraryCalls(HINSTANCE);
HRSRC FindResourceExW(HINSTANCE, const(wchar)*, const(wchar)*, ushort);
BOOL FreeLibrary(HINSTANCE);
void FreeLibraryAndExitThread(HINSTANCE, uint);
BOOL FreeResource(HGLOBAL);
uint GetModuleFileNameA(HINSTANCE, PSTR, uint);
uint GetModuleFileNameW(HINSTANCE, PWSTR, uint);
HINSTANCE GetModuleHandleA(const(char)*);
HINSTANCE GetModuleHandleW(const(wchar)*);
BOOL GetModuleHandleExA(uint, const(char)*, HINSTANCE*);
BOOL GetModuleHandleExW(uint, const(wchar)*, HINSTANCE*);
FARPROC GetProcAddress(HINSTANCE, const(char)*);
HINSTANCE LoadLibraryExA(const(char)*, HANDLE, LOAD_LIBRARY_FLAGS);
HINSTANCE LoadLibraryExW(const(wchar)*, HANDLE, LOAD_LIBRARY_FLAGS);
HGLOBAL LoadResource(HINSTANCE, HRSRC);
void* LockResource(HGLOBAL);
uint SizeofResource(HINSTANCE, HRSRC);
void* AddDllDirectory(const(wchar)*);
BOOL RemoveDllDirectory(void*);
BOOL SetDefaultDllDirectories(LOAD_LIBRARY_FLAGS);
BOOL EnumResourceLanguagesExA(HINSTANCE, const(char)*, const(char)*, ENUMRESLANGPROCA, long, uint, ushort);
BOOL EnumResourceLanguagesExW(HINSTANCE, const(wchar)*, const(wchar)*, ENUMRESLANGPROCW, long, uint, ushort);
BOOL EnumResourceNamesExA(HINSTANCE, const(char)*, ENUMRESNAMEPROCA, long, uint, ushort);
BOOL EnumResourceNamesExW(HINSTANCE, const(wchar)*, ENUMRESNAMEPROCW, long, uint, ushort);
BOOL EnumResourceTypesExA(HINSTANCE, ENUMRESTYPEPROCA, long, uint, ushort);
BOOL EnumResourceTypesExW(HINSTANCE, ENUMRESTYPEPROCW, long, uint, ushort);
HRSRC FindResourceW(HINSTANCE, const(wchar)*, const(wchar)*);
HINSTANCE LoadLibraryA(const(char)*);
HINSTANCE LoadLibraryW(const(wchar)*);
BOOL EnumResourceNamesW(HINSTANCE, const(wchar)*, ENUMRESNAMEPROCW, long);
BOOL EnumResourceNamesA(HINSTANCE, const(char)*, ENUMRESNAMEPROCA, long);
uint LoadModule(const(char)*, void*);
HINSTANCE LoadPackagedLibrary(const(wchar)*, uint);
HRSRC FindResourceA(HINSTANCE, const(char)*, const(char)*);
HRSRC FindResourceExA(HINSTANCE, const(char)*, const(char)*, ushort);
BOOL EnumResourceTypesA(HINSTANCE, ENUMRESTYPEPROCA, long);
BOOL EnumResourceTypesW(HINSTANCE, ENUMRESTYPEPROCW, long);
BOOL EnumResourceLanguagesA(HINSTANCE, const(char)*, const(char)*, ENUMRESLANGPROCA, long);
BOOL EnumResourceLanguagesW(HINSTANCE, const(wchar)*, const(wchar)*, ENUMRESLANGPROCW, long);
UPDATERESOURCE_HANDLE BeginUpdateResourceA(const(char)*, BOOL);
UPDATERESOURCE_HANDLE BeginUpdateResourceW(const(wchar)*, BOOL);
BOOL UpdateResourceA(UPDATERESOURCE_HANDLE, const(char)*, const(char)*, ushort, void*, uint);
BOOL UpdateResourceW(UPDATERESOURCE_HANDLE, const(wchar)*, const(wchar)*, ushort, void*, uint);
BOOL EndUpdateResourceA(UPDATERESOURCE_HANDLE, BOOL);
BOOL EndUpdateResourceW(UPDATERESOURCE_HANDLE, BOOL);
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
alias UPDATERESOURCE_HANDLE = long;
struct ENUMUILANG
{
    uint NumOfEnumUILang;
    uint SizeOfEnumUIBuffer;
    ushort* pEnumUIBuffer;
}
alias ENUMRESLANGPROCA = BOOL function(HINSTANCE, const(char)*, const(char)*, ushort, long);
alias ENUMRESLANGPROCW = BOOL function(HINSTANCE, const(wchar)*, const(wchar)*, ushort, long);
alias ENUMRESNAMEPROCA = BOOL function(HINSTANCE, const(char)*, PSTR, long);
alias ENUMRESNAMEPROCW = BOOL function(HINSTANCE, const(wchar)*, PWSTR, long);
alias ENUMRESTYPEPROCA = BOOL function(HINSTANCE, PSTR, long);
alias ENUMRESTYPEPROCW = BOOL function(HINSTANCE, PWSTR, long);
alias PGET_MODULE_HANDLE_EXA = BOOL function(uint, const(char)*, HINSTANCE*);
alias PGET_MODULE_HANDLE_EXW = BOOL function(uint, const(wchar)*, HINSTANCE*);
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
