module windows.win32.system.subsystemforlinux;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSTR, PWSTR;

version (Windows):
extern (Windows):

alias WSL_DISTRIBUTION_FLAGS = int;
enum : int
{
    WSL_DISTRIBUTION_FLAGS_NONE                  = 0x00000000,
    WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP        = 0x00000001,
    WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH        = 0x00000002,
    WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 0x00000004,
}

BOOL WslIsDistributionRegistered(const(wchar)* distributionName);
HRESULT WslRegisterDistribution(const(wchar)* distributionName, const(wchar)* tarGzFilename);
HRESULT WslUnregisterDistribution(const(wchar)* distributionName);
HRESULT WslConfigureDistribution(const(wchar)* distributionName, uint defaultUID, WSL_DISTRIBUTION_FLAGS wslDistributionFlags);
HRESULT WslGetDistributionConfiguration(const(wchar)* distributionName, uint* distributionVersion, uint* defaultUID, WSL_DISTRIBUTION_FLAGS* wslDistributionFlags, PSTR** defaultEnvironmentVariables, uint* defaultEnvironmentVariableCount);
HRESULT WslLaunchInteractive(const(wchar)* distributionName, const(wchar)* command, BOOL useCurrentWorkingDirectory, uint* exitCode);
HRESULT WslLaunch(const(wchar)* distributionName, const(wchar)* command, BOOL useCurrentWorkingDirectory, HANDLE stdIn, HANDLE stdOut, HANDLE stdErr, HANDLE* process);
