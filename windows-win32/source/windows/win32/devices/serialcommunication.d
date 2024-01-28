module windows.win32.devices.serialcommunication;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : BOOL, BOOLEAN;

version (Windows):
extern (Windows):

int ComDBOpen(HCOMDB*);
int ComDBClose(HCOMDB);
int ComDBGetCurrentPortUsage(HCOMDB, ubyte*, uint, uint, uint*);
int ComDBClaimNextFreePort(HCOMDB, uint*);
int ComDBClaimPort(HCOMDB, uint, BOOL, BOOL*);
int ComDBReleasePort(HCOMDB, uint);
int ComDBResizeDatabase(HCOMDB, uint);
enum DEVPKEY_DeviceInterface_Serial_UsbVendorId = DEVPROPKEY(GUID(1282142556, 19459, 19116, [145, 245, 100, 192, 248, 82, 188, 244]), 2);
enum DEVPKEY_DeviceInterface_Serial_UsbProductId = DEVPROPKEY(GUID(1282142556, 19459, 19116, [145, 245, 100, 192, 248, 82, 188, 244]), 3);
enum DEVPKEY_DeviceInterface_Serial_PortName = DEVPROPKEY(GUID(1282142556, 19459, 19116, [145, 245, 100, 192, 248, 82, 188, 244]), 4);
enum IOCTL_SERIAL_SET_BAUD_RATE = 0x001b0004;
enum IOCTL_SERIAL_SET_QUEUE_SIZE = 0x001b0008;
enum IOCTL_SERIAL_SET_LINE_CONTROL = 0x001b000c;
enum IOCTL_SERIAL_SET_BREAK_ON = 0x001b0010;
enum IOCTL_SERIAL_SET_BREAK_OFF = 0x001b0014;
enum IOCTL_SERIAL_IMMEDIATE_CHAR = 0x001b0018;
enum IOCTL_SERIAL_SET_TIMEOUTS = 0x001b001c;
enum IOCTL_SERIAL_GET_TIMEOUTS = 0x001b0020;
enum IOCTL_SERIAL_SET_DTR = 0x001b0024;
enum IOCTL_SERIAL_CLR_DTR = 0x001b0028;
enum IOCTL_SERIAL_RESET_DEVICE = 0x001b002c;
enum IOCTL_SERIAL_SET_RTS = 0x001b0030;
enum IOCTL_SERIAL_CLR_RTS = 0x001b0034;
enum IOCTL_SERIAL_SET_XOFF = 0x001b0038;
enum IOCTL_SERIAL_SET_XON = 0x001b003c;
enum IOCTL_SERIAL_GET_WAIT_MASK = 0x001b0040;
enum IOCTL_SERIAL_SET_WAIT_MASK = 0x001b0044;
enum IOCTL_SERIAL_WAIT_ON_MASK = 0x001b0048;
enum IOCTL_SERIAL_PURGE = 0x001b004c;
enum IOCTL_SERIAL_GET_BAUD_RATE = 0x001b0050;
enum IOCTL_SERIAL_GET_LINE_CONTROL = 0x001b0054;
enum IOCTL_SERIAL_GET_CHARS = 0x001b0058;
enum IOCTL_SERIAL_SET_CHARS = 0x001b005c;
enum IOCTL_SERIAL_GET_HANDFLOW = 0x001b0060;
enum IOCTL_SERIAL_SET_HANDFLOW = 0x001b0064;
enum IOCTL_SERIAL_GET_MODEMSTATUS = 0x001b0068;
enum IOCTL_SERIAL_GET_COMMSTATUS = 0x001b006c;
enum IOCTL_SERIAL_XOFF_COUNTER = 0x001b0070;
enum IOCTL_SERIAL_GET_PROPERTIES = 0x001b0074;
enum IOCTL_SERIAL_GET_DTRRTS = 0x001b0078;
enum IOCTL_SERIAL_CONFIG_SIZE = 0x001b0080;
enum IOCTL_SERIAL_GET_COMMCONFIG = 0x001b0084;
enum IOCTL_SERIAL_SET_COMMCONFIG = 0x001b0088;
enum IOCTL_SERIAL_GET_STATS = 0x001b008c;
enum IOCTL_SERIAL_CLEAR_STATS = 0x001b0090;
enum IOCTL_SERIAL_GET_MODEM_CONTROL = 0x001b0094;
enum IOCTL_SERIAL_SET_MODEM_CONTROL = 0x001b0098;
enum IOCTL_SERIAL_SET_FIFO_CONTROL = 0x001b009c;
enum IOCTL_SERIAL_APPLY_DEFAULT_CONFIGURATION = 0x001b00a0;
enum IOCTL_SERIAL_SET_INTERVAL_TIMER_RESOLUTION = 0x001b00a4;
enum IOCTL_SERIAL_INTERNAL_DO_WAIT_WAKE = 0x001b0004;
enum IOCTL_SERIAL_INTERNAL_CANCEL_WAIT_WAKE = 0x001b0008;
enum IOCTL_SERIAL_INTERNAL_BASIC_SETTINGS = 0x001b000c;
enum IOCTL_SERIAL_INTERNAL_RESTORE_SETTINGS = 0x001b0010;
enum SERIAL_EV_RXCHAR = 0x00000001;
enum SERIAL_EV_RXFLAG = 0x00000002;
enum SERIAL_EV_TXEMPTY = 0x00000004;
enum SERIAL_EV_CTS = 0x00000008;
enum SERIAL_EV_DSR = 0x00000010;
enum SERIAL_EV_RLSD = 0x00000020;
enum SERIAL_EV_BREAK = 0x00000040;
enum SERIAL_EV_ERR = 0x00000080;
enum SERIAL_EV_RING = 0x00000100;
enum SERIAL_EV_PERR = 0x00000200;
enum SERIAL_EV_RX80FULL = 0x00000400;
enum SERIAL_EV_EVENT1 = 0x00000800;
enum SERIAL_EV_EVENT2 = 0x00001000;
enum SERIAL_PURGE_TXABORT = 0x00000001;
enum SERIAL_PURGE_RXABORT = 0x00000002;
enum SERIAL_PURGE_TXCLEAR = 0x00000004;
enum SERIAL_PURGE_RXCLEAR = 0x00000008;
enum STOP_BIT_1 = 0x00000000;
enum STOP_BITS_1_5 = 0x00000001;
enum STOP_BITS_2 = 0x00000002;
enum NO_PARITY = 0x00000000;
enum ODD_PARITY = 0x00000001;
enum EVEN_PARITY = 0x00000002;
enum MARK_PARITY = 0x00000003;
enum SPACE_PARITY = 0x00000004;
enum SERIAL_LSRMST_ESCAPE = 0x0000;
enum SERIAL_LSRMST_LSR_DATA = 0x0001;
enum SERIAL_LSRMST_LSR_NODATA = 0x0002;
enum SERIAL_LSRMST_MST = 0x0003;
enum IOCTL_INTERNAL_SERENUM_REMOVE_SELF = 0x00370207;
enum COMDB_MIN_PORTS_ARBITRATED = 0x00000100;
enum COMDB_MAX_PORTS_ARBITRATED = 0x00001000;
enum CDB_REPORT_BITS = 0x00000000;
enum CDB_REPORT_BYTES = 0x00000001;
alias HCOMDB = void*;
struct SERIALPERF_STATS
{
    uint ReceivedCount;
    uint TransmittedCount;
    uint FrameErrorCount;
    uint SerialOverrunErrorCount;
    uint BufferOverrunErrorCount;
    uint ParityErrorCount;
}
struct SERIALCONFIG
{
    uint Size;
    ushort Version;
    uint SubType;
    uint ProvOffset;
    uint ProviderSize;
    wchar[1] ProviderData;
}
struct SERIAL_LINE_CONTROL
{
    ubyte StopBits;
    ubyte Parity;
    ubyte WordLength;
}
struct SERIAL_TIMEOUTS
{
    uint ReadIntervalTimeout;
    uint ReadTotalTimeoutMultiplier;
    uint ReadTotalTimeoutConstant;
    uint WriteTotalTimeoutMultiplier;
    uint WriteTotalTimeoutConstant;
}
struct SERIAL_QUEUE_SIZE
{
    uint InSize;
    uint OutSize;
}
struct SERIAL_BAUD_RATE
{
    uint BaudRate;
}
struct SERIAL_CHARS
{
    ubyte EofChar;
    ubyte ErrorChar;
    ubyte BreakChar;
    ubyte EventChar;
    ubyte XonChar;
    ubyte XoffChar;
}
struct SERIAL_HANDFLOW
{
    uint ControlHandShake;
    uint FlowReplace;
    int XonLimit;
    int XoffLimit;
}
struct SERIAL_BASIC_SETTINGS
{
    SERIAL_TIMEOUTS Timeouts;
    SERIAL_HANDFLOW HandFlow;
    uint RxFifo;
    uint TxFifo;
}
struct SERIAL_STATUS
{
    uint Errors;
    uint HoldReasons;
    uint AmountInInQueue;
    uint AmountInOutQueue;
    BOOLEAN EofReceived;
    BOOLEAN WaitForImmediate;
}
struct SERIAL_XOFF_COUNTER
{
    uint Timeout;
    int Counter;
    ubyte XoffChar;
}
struct SERIAL_COMMPROP
{
    ushort PacketLength;
    ushort PacketVersion;
    uint ServiceMask;
    uint Reserved1;
    uint MaxTxQueue;
    uint MaxRxQueue;
    uint MaxBaud;
    uint ProvSubType;
    uint ProvCapabilities;
    uint SettableParams;
    uint SettableBaud;
    ushort SettableData;
    ushort SettableStopParity;
    uint CurrentTxQueue;
    uint CurrentRxQueue;
    uint ProvSpec1;
    uint ProvSpec2;
    wchar[1] ProvChar;
}
struct SERENUM_PORT_DESC
{
    uint Size;
    void* PortHandle;
    long PortAddress;
    ushort[1] Reserved;
}
alias PSERENUM_READPORT = ubyte function(void*);
alias PSERENUM_WRITEPORT = void function(void*, ubyte);
alias SERENUM_PORTION = int;
enum : int
{
    SerenumFirstHalf  = 0x00000000,
    SerenumSecondHalf = 0x00000001,
    SerenumWhole      = 0x00000002,
}

struct SERENUM_PORT_PARAMETERS
{
    uint Size;
    PSERENUM_READPORT ReadAccessor;
    PSERENUM_WRITEPORT WriteAccessor;
    void* SerPortAddress;
    void* HardwareHandle;
    SERENUM_PORTION Portion;
    ushort NumberAxis;
    ushort[3] Reserved;
}
