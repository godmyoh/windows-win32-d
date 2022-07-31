module windows.win32.storage.operationrecorder;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

alias OPERATION_START_FLAGS = uint;
enum : uint
{
    OPERATION_START_TRACE_CURRENT_THREAD = 0x00000001,
}

alias OPERATION_END_PARAMETERS_FLAGS = uint;
enum : uint
{
    OPERATION_END_DISCARD = 0x00000001,
}

struct OPERATION_START_PARAMETERS
{
    uint Version;
    uint OperationId;
    OPERATION_START_FLAGS Flags;
}
struct OPERATION_END_PARAMETERS
{
    uint Version;
    uint OperationId;
    OPERATION_END_PARAMETERS_FLAGS Flags;
}
BOOL OperationStart(OPERATION_START_PARAMETERS*);
BOOL OperationEnd(OPERATION_END_PARAMETERS*);
