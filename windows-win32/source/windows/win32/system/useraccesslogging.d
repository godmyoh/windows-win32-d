module windows.win32.system.useraccesslogging;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.networking.winsock : SOCKADDR_STORAGE;

version (Windows):
extern (Windows):

struct UAL_DATA_BLOB
{
    uint Size;
    GUID RoleGuid;
    GUID TenantId;
    SOCKADDR_STORAGE Address;
    wchar[260] UserName;
}
HRESULT UalStart(UAL_DATA_BLOB* Data);
HRESULT UalStop(UAL_DATA_BLOB* Data);
HRESULT UalInstrument(UAL_DATA_BLOB* Data);
HRESULT UalRegisterProduct(const(wchar)* wszProductName, const(wchar)* wszRoleName, const(wchar)* wszGuid);
