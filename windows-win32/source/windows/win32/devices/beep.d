module windows.win32.devices.beep;


version (Windows):
extern (Windows):

enum DD_BEEP_DEVICE_NAME = "\\Device\\Beep";
enum DD_BEEP_DEVICE_NAME_U = "\\Device\\Beep";
enum IOCTL_BEEP_SET = 0x00010000;
enum BEEP_FREQUENCY_MINIMUM = 0x00000025;
enum BEEP_FREQUENCY_MAXIMUM = 0x00007fff;
struct BEEP_SET_PARAMETERS
{
    uint Frequency;
    uint Duration;
}
