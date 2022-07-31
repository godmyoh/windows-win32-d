module windows.win32.system.io;

import windows.win32.foundation : BOOL, HANDLE;

version (Windows):
extern (Windows):

struct OVERLAPPED
{
    ulong Internal;
    ulong InternalHigh;
    union
    {
        struct
        {
            uint Offset;
            uint OffsetHigh;
        }
        void* Pointer;
    }
    HANDLE hEvent;
}
struct OVERLAPPED_ENTRY
{
    ulong lpCompletionKey;
    OVERLAPPED* lpOverlapped;
    ulong Internal;
    uint dwNumberOfBytesTransferred;
}
alias LPOVERLAPPED_COMPLETION_ROUTINE = void function(uint, uint, OVERLAPPED*);
HANDLE CreateIoCompletionPort(HANDLE, HANDLE, ulong, uint);
BOOL GetQueuedCompletionStatus(HANDLE, uint*, ulong*, OVERLAPPED**, uint);
BOOL GetQueuedCompletionStatusEx(HANDLE, OVERLAPPED_ENTRY*, uint, uint*, uint, BOOL);
BOOL PostQueuedCompletionStatus(HANDLE, uint, ulong, OVERLAPPED*);
BOOL DeviceIoControl(HANDLE, uint, void*, uint, void*, uint, uint*, OVERLAPPED*);
BOOL GetOverlappedResult(HANDLE, OVERLAPPED*, uint*, BOOL);
BOOL CancelIoEx(HANDLE, OVERLAPPED*);
BOOL CancelIo(HANDLE);
BOOL GetOverlappedResultEx(HANDLE, OVERLAPPED*, uint*, uint, BOOL);
BOOL CancelSynchronousIo(HANDLE);
BOOL BindIoCompletionCallback(HANDLE, LPOVERLAPPED_COMPLETION_ROUTINE, uint);
