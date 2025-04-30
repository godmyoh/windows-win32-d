module windows.win32.system.io;

import windows.win32.foundation : BOOL, HANDLE, NTSTATUS;

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
alias LPOVERLAPPED_COMPLETION_ROUTINE = void function(uint dwErrorCode, uint dwNumberOfBytesTransfered, OVERLAPPED* lpOverlapped);
HANDLE CreateIoCompletionPort(HANDLE FileHandle, HANDLE ExistingCompletionPort, ulong CompletionKey, uint NumberOfConcurrentThreads);
BOOL GetQueuedCompletionStatus(HANDLE CompletionPort, uint* lpNumberOfBytesTransferred, ulong* lpCompletionKey, OVERLAPPED** lpOverlapped, uint dwMilliseconds);
BOOL GetQueuedCompletionStatusEx(HANDLE CompletionPort, OVERLAPPED_ENTRY* lpCompletionPortEntries, uint ulCount, uint* ulNumEntriesRemoved, uint dwMilliseconds, BOOL fAlertable);
BOOL PostQueuedCompletionStatus(HANDLE CompletionPort, uint dwNumberOfBytesTransferred, ulong dwCompletionKey, OVERLAPPED* lpOverlapped);
BOOL DeviceIoControl(HANDLE hDevice, uint dwIoControlCode, void* lpInBuffer, uint nInBufferSize, void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesReturned, OVERLAPPED* lpOverlapped);
BOOL GetOverlappedResult(HANDLE hFile, OVERLAPPED* lpOverlapped, uint* lpNumberOfBytesTransferred, BOOL bWait);
BOOL CancelIoEx(HANDLE hFile, OVERLAPPED* lpOverlapped);
BOOL CancelIo(HANDLE hFile);
BOOL GetOverlappedResultEx(HANDLE hFile, OVERLAPPED* lpOverlapped, uint* lpNumberOfBytesTransferred, uint dwMilliseconds, BOOL bAlertable);
BOOL CancelSynchronousIo(HANDLE hThread);
BOOL BindIoCompletionCallback(HANDLE FileHandle, LPOVERLAPPED_COMPLETION_ROUTINE Function, uint Flags);
struct IO_STATUS_BLOCK
{
    union
    {
        NTSTATUS Status;
        void* Pointer;
    }
    ulong Information;
}
alias PIO_APC_ROUTINE = void function(void* ApcContext, IO_STATUS_BLOCK* IoStatusBlock, uint Reserved);
