module windows.win32.system.recovery;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, PWSTR;
import windows.win32.system.windowsprogramming : APPLICATION_RECOVERY_CALLBACK;

version (Windows):
extern (Windows):

alias REGISTER_APPLICATION_RESTART_FLAGS = uint;
enum : uint
{
    RESTART_NO_CRASH  = 0x00000001,
    RESTART_NO_HANG   = 0x00000002,
    RESTART_NO_PATCH  = 0x00000004,
    RESTART_NO_REBOOT = 0x00000008,
}

HRESULT RegisterApplicationRecoveryCallback(APPLICATION_RECOVERY_CALLBACK pRecoveyCallback, void* pvParameter, uint dwPingInterval, uint dwFlags);
HRESULT UnregisterApplicationRecoveryCallback();
HRESULT RegisterApplicationRestart(const(wchar)* pwzCommandline, REGISTER_APPLICATION_RESTART_FLAGS dwFlags);
HRESULT UnregisterApplicationRestart();
HRESULT GetApplicationRecoveryCallback(HANDLE hProcess, APPLICATION_RECOVERY_CALLBACK* pRecoveryCallback, void** ppvParameter, uint* pdwPingInterval, uint* pdwFlags);
HRESULT GetApplicationRestartSettings(HANDLE hProcess, PWSTR pwzCommandline, uint* pcchSize, uint* pdwFlags);
HRESULT ApplicationRecoveryInProgress(BOOL* pbCancelled);
void ApplicationRecoveryFinished(BOOL bSuccess);
