module windows.win32.media.librarysharingservices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT, VARIANT_BOOL;
import windows.win32.system.com : IDispatch;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

alias WindowsMediaLibrarySharingDeviceAuthorizationStatus = int;
enum : int
{
    DEVICE_AUTHORIZATION_UNKNOWN = 0x00000000,
    DEVICE_AUTHORIZATION_ALLOWED = 0x00000001,
    DEVICE_AUTHORIZATION_DENIED  = 0x00000002,
}

enum IID_IWindowsMediaLibrarySharingDeviceProperty = GUID(0x81e26927, 0x7a7d, 0x40a7, [0x81, 0xd4, 0xbd, 0xdc, 0x2, 0x96, 0xe, 0x3e]);
interface IWindowsMediaLibrarySharingDeviceProperty : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Value(VARIANT*);
}
enum IID_IWindowsMediaLibrarySharingDeviceProperties = GUID(0xc4623214, 0x6b06, 0x40c5, [0xa6, 0x23, 0xb2, 0xff, 0x4c, 0x7, 0x6b, 0xfd]);
interface IWindowsMediaLibrarySharingDeviceProperties : IDispatch
{
    HRESULT get_Item(int, IWindowsMediaLibrarySharingDeviceProperty*);
    HRESULT get_Count(int*);
    HRESULT GetProperty(BSTR, IWindowsMediaLibrarySharingDeviceProperty*);
}
enum IID_IWindowsMediaLibrarySharingDevice = GUID(0x3dccc293, 0x4fd9, 0x4191, [0xa2, 0x5b, 0x8e, 0x57, 0xc5, 0xd2, 0x7b, 0xd4]);
interface IWindowsMediaLibrarySharingDevice : IDispatch
{
    HRESULT get_DeviceID(BSTR*);
    HRESULT get_Authorization(WindowsMediaLibrarySharingDeviceAuthorizationStatus*);
    HRESULT put_Authorization(WindowsMediaLibrarySharingDeviceAuthorizationStatus);
    HRESULT get_Properties(IWindowsMediaLibrarySharingDeviceProperties*);
}
enum IID_IWindowsMediaLibrarySharingDevices = GUID(0x1803f9d6, 0xfe6d, 0x4546, [0xbf, 0x5b, 0x99, 0x2f, 0xe8, 0xec, 0x12, 0xd1]);
interface IWindowsMediaLibrarySharingDevices : IDispatch
{
    HRESULT get_Item(int, IWindowsMediaLibrarySharingDevice*);
    HRESULT get_Count(int*);
    HRESULT GetDevice(BSTR, IWindowsMediaLibrarySharingDevice*);
}
enum IID_IWindowsMediaLibrarySharingServices = GUID(0x1f5f85e, 0xa81, 0x40da, [0xa7, 0xc8, 0x21, 0xef, 0x3a, 0xf8, 0x44, 0xc]);
interface IWindowsMediaLibrarySharingServices : IDispatch
{
    HRESULT showShareMediaCPL(BSTR);
    HRESULT get_userHomeMediaSharingState(VARIANT_BOOL*);
    HRESULT put_userHomeMediaSharingState(VARIANT_BOOL);
    HRESULT get_userHomeMediaSharingLibraryName(BSTR*);
    HRESULT put_userHomeMediaSharingLibraryName(BSTR);
    HRESULT get_computerHomeMediaSharingAllowedState(VARIANT_BOOL*);
    HRESULT put_computerHomeMediaSharingAllowedState(VARIANT_BOOL);
    HRESULT get_userInternetMediaSharingState(VARIANT_BOOL*);
    HRESULT put_userInternetMediaSharingState(VARIANT_BOOL);
    HRESULT get_computerInternetMediaSharingAllowedState(VARIANT_BOOL*);
    HRESULT put_computerInternetMediaSharingAllowedState(VARIANT_BOOL);
    HRESULT get_internetMediaSharingSecurityGroup(BSTR*);
    HRESULT put_internetMediaSharingSecurityGroup(BSTR);
    HRESULT get_allowSharingToAllDevices(VARIANT_BOOL*);
    HRESULT put_allowSharingToAllDevices(VARIANT_BOOL);
    HRESULT setDefaultAuthorization(BSTR, BSTR, VARIANT_BOOL);
    HRESULT setAuthorizationState(BSTR, VARIANT_BOOL);
    HRESULT getAllDevices(IWindowsMediaLibrarySharingDevices*);
    HRESULT get_customSettingsApplied(VARIANT_BOOL*);
}
enum CLSID_WindowsMediaLibrarySharingServices = GUID(0xad581b00, 0x7b64, 0x4e59, [0xa3, 0x8d, 0xd2, 0xc5, 0xbf, 0x51, 0xdd, 0xb3]);
struct WindowsMediaLibrarySharingServices
{
}
