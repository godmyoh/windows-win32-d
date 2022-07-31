module windows.win32.system.mixedreality;

import windows.win32.guid : GUID;

version (Windows):
extern (Windows):

enum PERCEPTIONFIELD_StateStream_TimeStamps = GUID(0xaa886119, 0xf32f, 0x49bf, [0x92, 0xca, 0xf9, 0xdd, 0xf7, 0x84, 0xd2, 0x97]);
struct PERCEPTION_PAYLOAD_FIELD
{
    GUID FieldId;
    uint OffsetInBytes;
    uint SizeInBytes;
}
struct PERCEPTION_STATE_STREAM_TIMESTAMPS
{
    long InputTimestampInQpcCounts;
    long AvailableTimestampInQpcCounts;
}
