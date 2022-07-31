module windows.win32.system.applicationverifier;

import windows.win32.foundation : HANDLE;

version (Windows):
extern (Windows):

alias VERIFIER_ENUM_RESOURCE_FLAGS = uint;
enum : uint
{
    AVRF_ENUM_RESOURCES_FLAGS_DONT_RESOLVE_TRACES = 0x00000002,
    AVRF_ENUM_RESOURCES_FLAGS_SUSPEND             = 0x00000001,
}

uint VerifierEnumerateResource(HANDLE, VERIFIER_ENUM_RESOURCE_FLAGS, eAvrfResourceTypes, AVRF_RESOURCE_ENUMERATE_CALLBACK, void*);
enum AVRF_MAX_TRACES = 0x00000020;
struct AVRF_BACKTRACE_INFORMATION
{
    uint Depth;
    uint Index;
    ulong[32] ReturnAddresses;
}
alias eUserAllocationState = int;
enum : int
{
    AllocationStateUnknown = 0x00000000,
    AllocationStateBusy    = 0x00000001,
    AllocationStateFree    = 0x00000002,
}

alias eHeapAllocationState = int;
enum : int
{
    HeapFullPageHeap = 0x40000000,
    HeapMetadata     = 0x80000000,
    HeapStateMask    = 0xffff0000,
}

alias eHeapEnumerationLevel = int;
enum : int
{
    HeapEnumerationEverything = 0x00000000,
    HeapEnumerationStop       = 0xffffffff,
}

struct AVRF_HEAP_ALLOCATION
{
    ulong HeapHandle;
    ulong UserAllocation;
    ulong UserAllocationSize;
    ulong Allocation;
    ulong AllocationSize;
    uint UserAllocationState;
    uint HeapState;
    ulong HeapContext;
    AVRF_BACKTRACE_INFORMATION* BackTraceInformation;
}
alias eHANDLE_TRACE_OPERATIONS = int;
enum : int
{
    OperationDbUnused = 0x00000000,
    OperationDbOPEN   = 0x00000001,
    OperationDbCLOSE  = 0x00000002,
    OperationDbBADREF = 0x00000003,
}

struct AVRF_HANDLE_OPERATION
{
    ulong Handle;
    uint ProcessId;
    uint ThreadId;
    uint OperationType;
    uint Spare0;
    AVRF_BACKTRACE_INFORMATION BackTraceInformation;
}
alias eAvrfResourceTypes = int;
enum : int
{
    AvrfResourceHeapAllocation = 0x00000000,
    AvrfResourceHandleTrace    = 0x00000001,
    AvrfResourceMax            = 0x00000002,
}

alias AVRF_RESOURCE_ENUMERATE_CALLBACK = uint function(void*, void*, uint*);
alias AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK = uint function(AVRF_HEAP_ALLOCATION*, void*, uint*);
alias AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK = uint function(AVRF_HANDLE_OPERATION*, void*, uint*);
