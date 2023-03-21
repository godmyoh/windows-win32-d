module windows.win32.system.winrt.storage;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum IID_IRandomAccessStreamFileAccessMode = GUID(0x332e5848, 0x2e15, 0x458e, [0x85, 0xc4, 0xc9, 0x11, 0xc0, 0xc3, 0xd6, 0xf4]);
interface IRandomAccessStreamFileAccessMode : IUnknown
{
    HRESULT GetMode(uint*);
}
enum IID_IUnbufferedFileHandleOplockCallback = GUID(0xd1019a0e, 0x6243, 0x4329, [0x84, 0x97, 0x2e, 0x75, 0x89, 0x4d, 0x77, 0x10]);
interface IUnbufferedFileHandleOplockCallback : IUnknown
{
    HRESULT OnBrokenCallback();
}
enum IID_IUnbufferedFileHandleProvider = GUID(0xa65c9109, 0x42ab, 0x4b94, [0xa7, 0xb1, 0xdd, 0x2e, 0x4e, 0x68, 0x51, 0x5e]);
interface IUnbufferedFileHandleProvider : IUnknown
{
    HRESULT OpenUnbufferedFileHandle(IUnbufferedFileHandleOplockCallback, ulong*);
    HRESULT CloseUnbufferedFileHandle();
}
alias HANDLE_OPTIONS = uint;
enum : uint
{
    HO_NONE                  = 0x00000000,
    HO_OPEN_REQUIRING_OPLOCK = 0x00040000,
    HO_DELETE_ON_CLOSE       = 0x04000000,
    HO_SEQUENTIAL_SCAN       = 0x08000000,
    HO_RANDOM_ACCESS         = 0x10000000,
    HO_NO_BUFFERING          = 0x20000000,
    HO_OVERLAPPED            = 0x40000000,
    HO_WRITE_THROUGH         = 0x80000000,
}

alias HANDLE_ACCESS_OPTIONS = int;
enum : int
{
    HAO_NONE            = 0x00000000,
    HAO_READ_ATTRIBUTES = 0x00000080,
    HAO_READ            = 0x00120089,
    HAO_WRITE           = 0x00120116,
    HAO_DELETE          = 0x00010000,
}

alias HANDLE_SHARING_OPTIONS = int;
enum : int
{
    HSO_SHARE_NONE   = 0x00000000,
    HSO_SHARE_READ   = 0x00000001,
    HSO_SHARE_WRITE  = 0x00000002,
    HSO_SHARE_DELETE = 0x00000004,
}

alias HANDLE_CREATION_OPTIONS = int;
enum : int
{
    HCO_CREATE_NEW        = 0x00000001,
    HCO_CREATE_ALWAYS     = 0x00000002,
    HCO_OPEN_EXISTING     = 0x00000003,
    HCO_OPEN_ALWAYS       = 0x00000004,
    HCO_TRUNCATE_EXISTING = 0x00000005,
}

enum IID_IOplockBreakingHandler = GUID(0x826abe3d, 0x3acd, 0x47d3, [0x84, 0xf2, 0x88, 0xaa, 0xed, 0xcf, 0x63, 0x4]);
interface IOplockBreakingHandler : IUnknown
{
    HRESULT OplockBreaking();
}
enum IID_IStorageItemHandleAccess = GUID(0x5ca296b2, 0x2c25, 0x4d22, [0xb7, 0x85, 0xb8, 0x85, 0xc8, 0x20, 0x1e, 0x6a]);
interface IStorageItemHandleAccess : IUnknown
{
    HRESULT Create(HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, HANDLE*);
}
enum IID_IStorageFolderHandleAccess = GUID(0xdf19938f, 0x5462, 0x48a0, [0xbe, 0x65, 0xd2, 0xa3, 0x27, 0x1a, 0x8, 0xd6]);
interface IStorageFolderHandleAccess : IUnknown
{
    HRESULT Create(const(wchar)*, HANDLE_CREATION_OPTIONS, HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, HANDLE*);
}
