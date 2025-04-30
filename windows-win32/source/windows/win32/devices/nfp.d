module windows.win32.devices.nfp;

import windows.win32.guid : GUID;
import windows.win32.foundation : DEVPROPKEY;

version (Windows):
extern (Windows):

enum GUID_DEVINTERFACE_NFP = GUID(0xfb3842cd, 0x9e2a, 0x4f83, [0x8f, 0xcc, 0x4b, 0x7, 0x61, 0x13, 0x9a, 0xe9]);
enum DEVPKEY_NFP_Capabilities = DEVPROPKEY(GUID(4214768333, 40490, 20355, [143, 204, 75, 7, 97, 19, 154, 233]), 2);
enum IOCTL_NFP_GET_NEXT_SUBSCRIBED_MESSAGE = 0x00510040;
enum IOCTL_NFP_SET_PAYLOAD = 0x00510044;
enum IOCTL_NFP_GET_NEXT_TRANSMITTED_MESSAGE = 0x00510048;
enum IOCTL_NFP_DISABLE = 0x0051004c;
enum IOCTL_NFP_ENABLE = 0x00510050;
enum IOCTL_NFP_GET_MAX_MESSAGE_BYTES = 0x00510080;
enum IOCTL_NFP_GET_KILO_BYTES_PER_SECOND = 0x00510084;
struct SUBSCRIBED_MESSAGE
{
    uint cbPayloadHint;
    ubyte[1] payload;
}
