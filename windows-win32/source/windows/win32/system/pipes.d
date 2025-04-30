module windows.win32.system.pipes;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;
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

BOOL CreatePipe(HANDLE* hReadPipe, HANDLE* hWritePipe, SECURITY_ATTRIBUTES* lpPipeAttributes, uint nSize);
BOOL ConnectNamedPipe(HANDLE hNamedPipe, OVERLAPPED* lpOverlapped);
BOOL DisconnectNamedPipe(HANDLE hNamedPipe);
BOOL SetNamedPipeHandleState(HANDLE hNamedPipe, NAMED_PIPE_MODE* lpMode, uint* lpMaxCollectionCount, uint* lpCollectDataTimeout);
BOOL PeekNamedPipe(HANDLE hNamedPipe, void* lpBuffer, uint nBufferSize, uint* lpBytesRead, uint* lpTotalBytesAvail, uint* lpBytesLeftThisMessage);
BOOL TransactNamedPipe(HANDLE hNamedPipe, void* lpInBuffer, uint nInBufferSize, void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, OVERLAPPED* lpOverlapped);
HANDLE CreateNamedPipeW(const(wchar)* lpName, FILE_FLAGS_AND_ATTRIBUTES dwOpenMode, NAMED_PIPE_MODE dwPipeMode, uint nMaxInstances, uint nOutBufferSize, uint nInBufferSize, uint nDefaultTimeOut, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL WaitNamedPipeW(const(wchar)* lpNamedPipeName, uint nTimeOut);
BOOL GetNamedPipeClientComputerNameW(HANDLE Pipe, PWSTR ClientComputerName, uint ClientComputerNameLength);
BOOL ImpersonateNamedPipeClient(HANDLE hNamedPipe);
BOOL GetNamedPipeInfo(HANDLE hNamedPipe, NAMED_PIPE_MODE* lpFlags, uint* lpOutBufferSize, uint* lpInBufferSize, uint* lpMaxInstances);
BOOL GetNamedPipeHandleStateW(HANDLE hNamedPipe, NAMED_PIPE_MODE* lpState, uint* lpCurInstances, uint* lpMaxCollectionCount, uint* lpCollectDataTimeout, PWSTR lpUserName, uint nMaxUserNameSize);
BOOL CallNamedPipeW(const(wchar)* lpNamedPipeName, void* lpInBuffer, uint nInBufferSize, void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, uint nTimeOut);
HANDLE CreateNamedPipeA(const(char)* lpName, FILE_FLAGS_AND_ATTRIBUTES dwOpenMode, NAMED_PIPE_MODE dwPipeMode, uint nMaxInstances, uint nOutBufferSize, uint nInBufferSize, uint nDefaultTimeOut, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL GetNamedPipeHandleStateA(HANDLE hNamedPipe, NAMED_PIPE_MODE* lpState, uint* lpCurInstances, uint* lpMaxCollectionCount, uint* lpCollectDataTimeout, PSTR lpUserName, uint nMaxUserNameSize);
BOOL CallNamedPipeA(const(char)* lpNamedPipeName, void* lpInBuffer, uint nInBufferSize, void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, uint nTimeOut);
BOOL WaitNamedPipeA(const(char)* lpNamedPipeName, uint nTimeOut);
BOOL GetNamedPipeClientComputerNameA(HANDLE Pipe, PSTR ClientComputerName, uint ClientComputerNameLength);
BOOL GetNamedPipeClientProcessId(HANDLE Pipe, uint* ClientProcessId);
BOOL GetNamedPipeClientSessionId(HANDLE Pipe, uint* ClientSessionId);
BOOL GetNamedPipeServerProcessId(HANDLE Pipe, uint* ServerProcessId);
BOOL GetNamedPipeServerSessionId(HANDLE Pipe, uint* ServerSessionId);
enum PIPE_UNLIMITED_INSTANCES = 0x000000ff;
enum NMPWAIT_WAIT_FOREVER = 0xffffffff;
enum NMPWAIT_NOWAIT = 0x00000001;
enum NMPWAIT_USE_DEFAULT_WAIT = 0x00000000;
