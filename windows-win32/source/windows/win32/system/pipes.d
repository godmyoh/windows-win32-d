module windows.win32.system.pipes;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.storage.filesystem : FILE_FLAGS_AND_ATTRIBUTES;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

alias NAMED_PIPE_MODE = uint;
enum : uint
{
    PIPE_WAIT                  = 0x00000000,
    PIPE_NOWAIT                = 0x00000001,
    PIPE_READMODE_BYTE         = 0x00000000,
    PIPE_READMODE_MESSAGE      = 0x00000002,
    PIPE_CLIENT_END            = 0x00000000,
    PIPE_SERVER_END            = 0x00000001,
    PIPE_TYPE_BYTE             = 0x00000000,
    PIPE_TYPE_MESSAGE          = 0x00000004,
    PIPE_ACCEPT_REMOTE_CLIENTS = 0x00000000,
    PIPE_REJECT_REMOTE_CLIENTS = 0x00000008,
}

BOOL CreatePipe(HANDLE*, HANDLE*, SECURITY_ATTRIBUTES*, uint);
BOOL ConnectNamedPipe(HANDLE, OVERLAPPED*);
BOOL DisconnectNamedPipe(HANDLE);
BOOL SetNamedPipeHandleState(HANDLE, NAMED_PIPE_MODE*, uint*, uint*);
BOOL PeekNamedPipe(HANDLE, void*, uint, uint*, uint*, uint*);
BOOL TransactNamedPipe(HANDLE, void*, uint, void*, uint, uint*, OVERLAPPED*);
HANDLE CreateNamedPipeW(const(wchar)*, FILE_FLAGS_AND_ATTRIBUTES, NAMED_PIPE_MODE, uint, uint, uint, uint, SECURITY_ATTRIBUTES*);
BOOL WaitNamedPipeW(const(wchar)*, uint);
BOOL GetNamedPipeClientComputerNameW(HANDLE, PWSTR, uint);
BOOL ImpersonateNamedPipeClient(HANDLE);
BOOL GetNamedPipeInfo(HANDLE, NAMED_PIPE_MODE*, uint*, uint*, uint*);
BOOL GetNamedPipeHandleStateW(HANDLE, NAMED_PIPE_MODE*, uint*, uint*, uint*, PWSTR, uint);
BOOL CallNamedPipeW(const(wchar)*, void*, uint, void*, uint, uint*, uint);
HANDLE CreateNamedPipeA(const(char)*, FILE_FLAGS_AND_ATTRIBUTES, NAMED_PIPE_MODE, uint, uint, uint, uint, SECURITY_ATTRIBUTES*);
BOOL GetNamedPipeHandleStateA(HANDLE, NAMED_PIPE_MODE*, uint*, uint*, uint*, PSTR, uint);
BOOL CallNamedPipeA(const(char)*, void*, uint, void*, uint, uint*, uint);
BOOL WaitNamedPipeA(const(char)*, uint);
BOOL GetNamedPipeClientComputerNameA(HANDLE, PSTR, uint);
BOOL GetNamedPipeClientProcessId(HANDLE, uint*);
BOOL GetNamedPipeClientSessionId(HANDLE, uint*);
BOOL GetNamedPipeServerProcessId(HANDLE, uint*);
BOOL GetNamedPipeServerSessionId(HANDLE, uint*);
enum PIPE_UNLIMITED_INSTANCES = 0x000000ff;
enum NMPWAIT_WAIT_FOREVER = 0xffffffff;
enum NMPWAIT_NOWAIT = 0x00000001;
enum NMPWAIT_USE_DEFAULT_WAIT = 0x00000000;
