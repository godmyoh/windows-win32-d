module windows.win32.guid;

struct GUID
{
    uint Data1;
    ushort Data2;
    ushort Data3;
    ubyte[8] Data4;
}
