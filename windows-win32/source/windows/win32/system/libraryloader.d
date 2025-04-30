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

BOOL DisableThreadLibraryCalls(HMODULE hLibModule);
HRSRC FindResourceExW(HMODULE hModule, const(wchar)* lpType, const(wchar)* lpName, ushort wLanguage);
void FreeLibraryAndExitThread(HMODULE hLibModule, uint dwExitCode);
BOOL FreeResource(HGLOBAL hResData);
uint GetModuleFileNameA(HMODULE hModule, PSTR lpFilename, uint nSize);
uint GetModuleFileNameW(HMODULE hModule, PWSTR lpFilename, uint nSize);
HMODULE GetModuleHandleA(const(char)* lpModuleName);
HMODULE GetModuleHandleW(const(wchar)* lpModuleName);
BOOL GetModuleHandleExA(uint dwFlags, const(char)* lpModuleName, HMODULE* phModule);
BOOL GetModuleHandleExW(uint dwFlags, const(wchar)* lpModuleName, HMODULE* phModule);
FARPROC GetProcAddress(HMODULE hModule, const(char)* lpProcName);
HMODULE LoadLibraryExA(const(char)* lpLibFileName, HANDLE hFile, LOAD_LIBRARY_FLAGS dwFlags);
HMODULE LoadLibraryExW(const(wchar)* lpLibFileName, HANDLE hFile, LOAD_LIBRARY_FLAGS dwFlags);
HGLOBAL LoadResource(HMODULE hModule, HRSRC hResInfo);
void* LockResource(HGLOBAL hResData);
uint SizeofResource(HMODULE hModule, HRSRC hResInfo);
void* AddDllDirectory(const(wchar)* NewDirectory);
BOOL RemoveDllDirectory(void* Cookie);
BOOL SetDefaultDllDirectories(LOAD_LIBRARY_FLAGS DirectoryFlags);
BOOL EnumResourceLanguagesExA(HMODULE hModule, const(char)* lpType, const(char)* lpName, ENUMRESLANGPROCA lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
BOOL EnumResourceLanguagesExW(HMODULE hModule, const(wchar)* lpType, const(wchar)* lpName, ENUMRESLANGPROCW lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
BOOL EnumResourceNamesExA(HMODULE hModule, const(char)* lpType, ENUMRESNAMEPROCA lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
BOOL EnumResourceNamesExW(HMODULE hModule, const(wchar)* lpType, ENUMRESNAMEPROCW lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
BOOL EnumResourceTypesExA(HMODULE hModule, ENUMRESTYPEPROCA lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
BOOL EnumResourceTypesExW(HMODULE hModule, ENUMRESTYPEPROCW lpEnumFunc, long lParam, uint dwFlags, ushort LangId);
HRSRC FindResourceW(HMODULE hModule, const(wchar)* lpName, const(wchar)* lpType);
HMODULE LoadLibraryA(const(char)* lpLibFileName);
HMODULE LoadLibraryW(const(wchar)* lpLibFileName);
BOOL EnumResourceNamesW(HMODULE hModule, const(wchar)* lpType, ENUMRESNAMEPROCW lpEnumFunc, long lParam);
BOOL EnumResourceNamesA(HMODULE hModule, const(char)* lpType, ENUMRESNAMEPROCA lpEnumFunc, long lParam);
HMODULE LoadPackagedLibrary(const(wchar)* lpwLibFileName, uint Reserved);
BOOL QueryOptionalDelayLoadedAPI(HMODULE hParentModule, const(char)* lpDllName, const(char)* lpProcName, uint Reserved);
uint LoadModule(const(char)* lpModuleName, void* lpParameterBlock);
HRSRC FindResourceA(HMODULE hModule, const(char)* lpName, const(char)* lpType);
HRSRC FindResourceExA(HMODULE hModule, const(char)* lpType, const(char)* lpName, ushort wLanguage);
BOOL EnumResourceTypesA(HMODULE hModule, ENUMRESTYPEPROCA lpEnumFunc, long lParam);
BOOL EnumResourceTypesW(HMODULE hModule, ENUMRESTYPEPROCW lpEnumFunc, long lParam);
BOOL EnumResourceLanguagesA(HMODULE hModule, const(char)* lpType, const(char)* lpName, ENUMRESLANGPROCA lpEnumFunc, long lParam);
BOOL EnumResourceLanguagesW(HMODULE hModule, const(wchar)* lpType, const(wchar)* lpName, ENUMRESLANGPROCW lpEnumFunc, long lParam);
HANDLE BeginUpdateResourceA(const(char)* pFileName, BOOL bDeleteExistingResources);
HANDLE BeginUpdateResourceW(const(wchar)* pFileName, BOOL bDeleteExistingResources);
BOOL UpdateResourceA(HANDLE hUpdate, const(char)* lpType, const(char)* lpName, ushort wLanguage, void* lpData, uint cb);
BOOL UpdateResourceW(HANDLE hUpdate, const(wchar)* lpType, const(wchar)* lpName, ushort wLanguage, void* lpData, uint cb);
BOOL EndUpdateResourceA(HANDLE hUpdate, BOOL fDiscard);
BOOL EndUpdateResourceW(HANDLE hUpdate, BOOL fDiscard);
BOOL SetDllDirectoryA(const(char)* lpPathName);
BOOL SetDllDirectoryW(const(wchar)* lpPathName);
uint GetDllDirectoryA(uint nBufferLength, PSTR lpBuffer);
uint GetDllDirectoryW(uint nBufferLength, PWSTR lpBuffer);
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
alias ENUMRESLANGPROCA = BOOL function(HMODULE hModule, const(char)* lpType, const(char)* lpName, ushort wLanguage, long lParam);
alias ENUMRESLANGPROCW = BOOL function(HMODULE hModule, const(wchar)* lpType, const(wchar)* lpName, ushort wLanguage, long lParam);
alias ENUMRESNAMEPROCA = BOOL function(HMODULE hModule, const(char)* lpType, PSTR lpName, long lParam);
alias ENUMRESNAMEPROCW = BOOL function(HMODULE hModule, const(wchar)* lpType, PWSTR lpName, long lParam);
alias ENUMRESTYPEPROCA = BOOL function(HMODULE hModule, PSTR lpType, long lParam);
alias ENUMRESTYPEPROCW = BOOL function(HMODULE hModule, PWSTR lpType, long lParam);
alias PGET_MODULE_HANDLE_EXA = BOOL function(uint dwFlags, const(char)* lpModuleName, HMODULE* phModule);
alias PGET_MODULE_HANDLE_EXW = BOOL function(uint dwFlags, const(wchar)* lpModuleName, HMODULE* phModule);
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
