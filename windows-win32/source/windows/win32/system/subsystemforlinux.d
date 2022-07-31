module windows.win32.system.subsystemforlinux;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSTR, PWSTR;

version (Windows):
extern (Windows):

alias WSL_DISTRIBUTION_FLAGS = uint;
enum : uint
{
    WSL_DISTRIBUTION_FLAGS_NONE                  = 0x00000000,
    WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP        = 0x00000001,
    WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH        = 0x00000002,
    WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 0x00000004,
}

BOOL WslIsDistributionRegistered(const(wchar)*);
HRESULT WslRegisterDistribution(const(wchar)*, const(wchar)*);
HRESULT WslUnregisterDistribution(const(wchar)*);
HRESULT WslConfigureDistribution(const(wchar)*, uint, WSL_DISTRIBUTION_FLAGS);
HRESULT WslGetDistributionConfiguration(const(wchar)*, uint*, uint*, WSL_DISTRIBUTION_FLAGS*, PSTR**, uint*);
HRESULT WslLaunchInteractive(const(wchar)*, const(wchar)*, BOOL, uint*);
HRESULT WslLaunch(const(wchar)*, const(wchar)*, BOOL, HANDLE, HANDLE, HANDLE, HANDLE*);
