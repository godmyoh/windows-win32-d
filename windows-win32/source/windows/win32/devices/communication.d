module windows.win32.devices.communication;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, CHAR, HANDLE, HWND, PSTR, PWSTR;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

alias MODEM_STATUS_FLAGS = uint;
enum : uint
{
    MS_CTS_ON  = 0x00000010,
    MS_DSR_ON  = 0x00000020,
    MS_RING_ON = 0x00000040,
    MS_RLSD_ON = 0x00000080,
}

alias CLEAR_COMM_ERROR_FLAGS = uint;
enum : uint
{
    CE_BREAK    = 0x00000010,
    CE_FRAME    = 0x00000008,
    CE_OVERRUN  = 0x00000002,
    CE_RXOVER   = 0x00000001,
    CE_RXPARITY = 0x00000004,
}

alias PURGE_COMM_FLAGS = uint;
enum : uint
{
    PURGE_RXABORT = 0x00000002,
    PURGE_RXCLEAR = 0x00000008,
    PURGE_TXABORT = 0x00000001,
    PURGE_TXCLEAR = 0x00000004,
}

alias COMM_EVENT_MASK = uint;
enum : uint
{
    EV_BREAK    = 0x00000040,
    EV_CTS      = 0x00000008,
    EV_DSR      = 0x00000010,
    EV_ERR      = 0x00000080,
    EV_EVENT1   = 0x00000800,
    EV_EVENT2   = 0x00001000,
    EV_PERR     = 0x00000200,
    EV_RING     = 0x00000100,
    EV_RLSD     = 0x00000020,
    EV_RX80FULL = 0x00000400,
    EV_RXCHAR   = 0x00000001,
    EV_RXFLAG   = 0x00000002,
    EV_TXEMPTY  = 0x00000004,
}

alias ESCAPE_COMM_FUNCTION = uint;
enum : uint
{
    CLRBREAK = 0x00000009,
    CLRDTR   = 0x00000006,
    CLRRTS   = 0x00000004,
    SETBREAK = 0x00000008,
    SETDTR   = 0x00000005,
    SETRTS   = 0x00000003,
    SETXOFF  = 0x00000001,
    SETXON   = 0x00000002,
}

alias MODEMDEVCAPS_DIAL_OPTIONS = uint;
enum : uint
{
    DIALOPTION_BILLING  = 0x00000040,
    DIALOPTION_DIALTONE = 0x00000100,
    DIALOPTION_QUIET    = 0x00000080,
}

alias MODEMSETTINGS_SPEAKER_MODE = uint;
enum : uint
{
    MDMSPKR_CALLSETUP = 0x00000008,
    MDMSPKR_DIAL      = 0x00000002,
    MDMSPKR_OFF       = 0x00000001,
    MDMSPKR_ON        = 0x00000004,
}

alias COMMPROP_STOP_PARITY = ushort;
enum : ushort
{
    STOPBITS_10  = 0x0001,
    STOPBITS_15  = 0x0002,
    STOPBITS_20  = 0x0004,
    PARITY_NONE  = 0x0100,
    PARITY_ODD   = 0x0200,
    PARITY_EVEN  = 0x0400,
    PARITY_MARK  = 0x0800,
    PARITY_SPACE = 0x1000,
}

alias MODEM_SPEAKER_VOLUME = uint;
enum : uint
{
    MDMVOL_HIGH   = 0x00000002,
    MDMVOL_LOW    = 0x00000000,
    MDMVOL_MEDIUM = 0x00000001,
}

alias MODEMDEVCAPS_SPEAKER_VOLUME = uint;
enum : uint
{
    MDMVOLFLAG_HIGH   = 0x00000004,
    MDMVOLFLAG_LOW    = 0x00000001,
    MDMVOLFLAG_MEDIUM = 0x00000002,
}

alias MODEMDEVCAPS_SPEAKER_MODE = uint;
enum : uint
{
    MDMSPKRFLAG_CALLSETUP = 0x00000008,
    MDMSPKRFLAG_DIAL      = 0x00000002,
    MDMSPKRFLAG_OFF       = 0x00000001,
    MDMSPKRFLAG_ON        = 0x00000004,
}

alias DCB_STOP_BITS = ubyte;
enum : ubyte
{
    ONESTOPBIT   = 0x00,
    ONE5STOPBITS = 0x01,
    TWOSTOPBITS  = 0x02,
}

alias DCB_PARITY = ubyte;
enum : ubyte
{
    EVENPARITY  = 0x02,
    MARKPARITY  = 0x03,
    NOPARITY    = 0x00,
    ODDPARITY   = 0x01,
    SPACEPARITY = 0x04,
}

BOOL ClearCommBreak(HANDLE);
BOOL ClearCommError(HANDLE, CLEAR_COMM_ERROR_FLAGS*, COMSTAT*);
BOOL SetupComm(HANDLE, uint, uint);
BOOL EscapeCommFunction(HANDLE, ESCAPE_COMM_FUNCTION);
BOOL GetCommConfig(HANDLE, COMMCONFIG*, uint*);
BOOL GetCommMask(HANDLE, COMM_EVENT_MASK*);
BOOL GetCommProperties(HANDLE, COMMPROP*);
BOOL GetCommModemStatus(HANDLE, MODEM_STATUS_FLAGS*);
BOOL GetCommState(HANDLE, DCB*);
BOOL GetCommTimeouts(HANDLE, COMMTIMEOUTS*);
BOOL PurgeComm(HANDLE, PURGE_COMM_FLAGS);
BOOL SetCommBreak(HANDLE);
BOOL SetCommConfig(HANDLE, COMMCONFIG*, uint);
BOOL SetCommMask(HANDLE, COMM_EVENT_MASK);
BOOL SetCommState(HANDLE, DCB*);
BOOL SetCommTimeouts(HANDLE, COMMTIMEOUTS*);
BOOL TransmitCommChar(HANDLE, CHAR);
BOOL WaitCommEvent(HANDLE, COMM_EVENT_MASK*, OVERLAPPED*);
HANDLE OpenCommPort(uint, uint, uint);
uint GetCommPorts(uint*, uint, uint*);
BOOL BuildCommDCBA(const(char)*, DCB*);
BOOL BuildCommDCBW(const(wchar)*, DCB*);
BOOL BuildCommDCBAndTimeoutsA(const(char)*, DCB*, COMMTIMEOUTS*);
BOOL BuildCommDCBAndTimeoutsW(const(wchar)*, DCB*, COMMTIMEOUTS*);
BOOL CommConfigDialogA(const(char)*, HWND, COMMCONFIG*);
BOOL CommConfigDialogW(const(wchar)*, HWND, COMMCONFIG*);
BOOL GetDefaultCommConfigA(const(char)*, COMMCONFIG*, uint*);
BOOL GetDefaultCommConfigW(const(wchar)*, COMMCONFIG*, uint*);
BOOL SetDefaultCommConfigA(const(char)*, COMMCONFIG*, uint);
BOOL SetDefaultCommConfigW(const(wchar)*, COMMCONFIG*, uint);
enum MDM_COMPRESSION = 0x00000001;
enum MDM_ERROR_CONTROL = 0x00000002;
enum MDM_FORCED_EC = 0x00000004;
enum MDM_CELLULAR = 0x00000008;
enum MDM_FLOWCONTROL_HARD = 0x00000010;
enum MDM_FLOWCONTROL_SOFT = 0x00000020;
enum MDM_CCITT_OVERRIDE = 0x00000040;
enum MDM_SPEED_ADJUST = 0x00000080;
enum MDM_TONE_DIAL = 0x00000100;
enum MDM_BLIND_DIAL = 0x00000200;
enum MDM_V23_OVERRIDE = 0x00000400;
enum MDM_DIAGNOSTICS = 0x00000800;
enum MDM_MASK_BEARERMODE = 0x0000f000;
enum MDM_SHIFT_BEARERMODE = 0x0000000c;
enum MDM_MASK_PROTOCOLID = 0x000f0000;
enum MDM_SHIFT_PROTOCOLID = 0x00000010;
enum MDM_MASK_PROTOCOLDATA = 0x0ff00000;
enum MDM_SHIFT_PROTOCOLDATA = 0x00000014;
enum MDM_SHIFT_PROTOCOLINFO = 0x00000010;
enum MDM_SHIFT_EXTENDEDINFO = 0x0000000c;
enum MDM_BEARERMODE_ANALOG = 0x00000000;
enum MDM_BEARERMODE_ISDN = 0x00000001;
enum MDM_BEARERMODE_GSM = 0x00000002;
enum MDM_PROTOCOLID_DEFAULT = 0x00000000;
enum MDM_PROTOCOLID_HDLCPPP = 0x00000001;
enum MDM_PROTOCOLID_V128 = 0x00000002;
enum MDM_PROTOCOLID_X75 = 0x00000003;
enum MDM_PROTOCOLID_V110 = 0x00000004;
enum MDM_PROTOCOLID_V120 = 0x00000005;
enum MDM_PROTOCOLID_AUTO = 0x00000006;
enum MDM_PROTOCOLID_ANALOG = 0x00000007;
enum MDM_PROTOCOLID_GPRS = 0x00000008;
enum MDM_PROTOCOLID_PIAFS = 0x00000009;
enum MDM_SHIFT_HDLCPPP_SPEED = 0x00000000;
enum MDM_MASK_HDLCPPP_SPEED = 0x00000007;
enum MDM_HDLCPPP_SPEED_DEFAULT = 0x00000000;
enum MDM_HDLCPPP_SPEED_64K = 0x00000001;
enum MDM_HDLCPPP_SPEED_56K = 0x00000002;
enum MDM_SHIFT_HDLCPPP_AUTH = 0x00000003;
enum MDM_HDLCPPP_AUTH_DEFAULT = 0x00000000;
enum MDM_HDLCPPP_AUTH_NONE = 0x00000001;
enum MDM_HDLCPPP_AUTH_PAP = 0x00000002;
enum MDM_HDLCPPP_AUTH_CHAP = 0x00000003;
enum MDM_HDLCPPP_AUTH_MSCHAP = 0x00000004;
enum MDM_SHIFT_HDLCPPP_ML = 0x00000006;
enum MDM_HDLCPPP_ML_DEFAULT = 0x00000000;
enum MDM_HDLCPPP_ML_NONE = 0x00000001;
enum MDM_HDLCPPP_ML_2 = 0x00000002;
enum MDM_SHIFT_V120_SPEED = 0x00000000;
enum MDM_MASK_V120_SPEED = 0x00000007;
enum MDM_V120_SPEED_DEFAULT = 0x00000000;
enum MDM_V120_SPEED_64K = 0x00000001;
enum MDM_V120_SPEED_56K = 0x00000002;
enum MDM_SHIFT_V120_ML = 0x00000006;
enum MDM_V120_ML_DEFAULT = 0x00000000;
enum MDM_V120_ML_NONE = 0x00000001;
enum MDM_V120_ML_2 = 0x00000002;
enum MDM_SHIFT_X75_DATA = 0x00000000;
enum MDM_MASK_X75_DATA = 0x00000007;
enum MDM_X75_DATA_DEFAULT = 0x00000000;
enum MDM_X75_DATA_64K = 0x00000001;
enum MDM_X75_DATA_128K = 0x00000002;
enum MDM_X75_DATA_T_70 = 0x00000003;
enum MDM_X75_DATA_BTX = 0x00000004;
enum MDM_SHIFT_V110_SPEED = 0x00000000;
enum MDM_MASK_V110_SPEED = 0x0000000f;
enum MDM_V110_SPEED_DEFAULT = 0x00000000;
enum MDM_V110_SPEED_1DOT2K = 0x00000001;
enum MDM_V110_SPEED_2DOT4K = 0x00000002;
enum MDM_V110_SPEED_4DOT8K = 0x00000003;
enum MDM_V110_SPEED_9DOT6K = 0x00000004;
enum MDM_V110_SPEED_12DOT0K = 0x00000005;
enum MDM_V110_SPEED_14DOT4K = 0x00000006;
enum MDM_V110_SPEED_19DOT2K = 0x00000007;
enum MDM_V110_SPEED_28DOT8K = 0x00000008;
enum MDM_V110_SPEED_38DOT4K = 0x00000009;
enum MDM_V110_SPEED_57DOT6K = 0x0000000a;
enum MDM_SHIFT_AUTO_SPEED = 0x00000000;
enum MDM_MASK_AUTO_SPEED = 0x00000007;
enum MDM_AUTO_SPEED_DEFAULT = 0x00000000;
enum MDM_SHIFT_AUTO_ML = 0x00000006;
enum MDM_AUTO_ML_DEFAULT = 0x00000000;
enum MDM_AUTO_ML_NONE = 0x00000001;
enum MDM_AUTO_ML_2 = 0x00000002;
enum MDM_ANALOG_RLP_ON = 0x00000000;
enum MDM_ANALOG_RLP_OFF = 0x00000001;
enum MDM_ANALOG_V34 = 0x00000002;
enum MDM_PIAFS_INCOMING = 0x00000000;
enum MDM_PIAFS_OUTGOING = 0x00000001;
enum SID_3GPP_SUPSVCMODEL = GUID(0xd7d08e07, 0xd767, 0x4478, [0xb1, 0x4a, 0xee, 0xcc, 0x87, 0xea, 0x12, 0xf7]);
enum MAXLENGTH_NAI = 0x00000048;
enum MAXLENGTH_UICCDATASTORE = 0x0000000a;
struct MODEMDEVCAPS
{
    uint dwActualSize;
    uint dwRequiredSize;
    uint dwDevSpecificOffset;
    uint dwDevSpecificSize;
    uint dwModemProviderVersion;
    uint dwModemManufacturerOffset;
    uint dwModemManufacturerSize;
    uint dwModemModelOffset;
    uint dwModemModelSize;
    uint dwModemVersionOffset;
    uint dwModemVersionSize;
    MODEMDEVCAPS_DIAL_OPTIONS dwDialOptions;
    uint dwCallSetupFailTimer;
    uint dwInactivityTimeout;
    MODEMDEVCAPS_SPEAKER_VOLUME dwSpeakerVolume;
    MODEMDEVCAPS_SPEAKER_MODE dwSpeakerMode;
    uint dwModemOptions;
    uint dwMaxDTERate;
    uint dwMaxDCERate;
    ubyte[1] abVariablePortion;
}
struct MODEMSETTINGS
{
    uint dwActualSize;
    uint dwRequiredSize;
    uint dwDevSpecificOffset;
    uint dwDevSpecificSize;
    uint dwCallSetupFailTimer;
    uint dwInactivityTimeout;
    MODEM_SPEAKER_VOLUME dwSpeakerVolume;
    MODEMSETTINGS_SPEAKER_MODE dwSpeakerMode;
    uint dwPreferredModemOptions;
    uint dwNegotiatedModemOptions;
    uint dwNegotiatedDCERate;
    ubyte[1] abVariablePortion;
}
struct COMMPROP
{
    ushort wPacketLength;
    ushort wPacketVersion;
    uint dwServiceMask;
    uint dwReserved1;
    uint dwMaxTxQueue;
    uint dwMaxRxQueue;
    uint dwMaxBaud;
    uint dwProvSubType;
    uint dwProvCapabilities;
    uint dwSettableParams;
    uint dwSettableBaud;
    ushort wSettableData;
    COMMPROP_STOP_PARITY wSettableStopParity;
    uint dwCurrentTxQueue;
    uint dwCurrentRxQueue;
    uint dwProvSpec1;
    uint dwProvSpec2;
    wchar[1] wcProvChar;
}
struct COMSTAT
{
    uint _bitfield0;
    uint cbInQue;
    uint cbOutQue;
}
struct DCB
{
    uint DCBlength;
    uint BaudRate;
    uint _bitfield0;
    ushort wReserved;
    ushort XonLim;
    ushort XoffLim;
    ubyte ByteSize;
    DCB_PARITY Parity;
    DCB_STOP_BITS StopBits;
    CHAR XonChar;
    CHAR XoffChar;
    CHAR ErrorChar;
    CHAR EofChar;
    CHAR EvtChar;
    ushort wReserved1;
}
struct COMMTIMEOUTS
{
    uint ReadIntervalTimeout;
    uint ReadTotalTimeoutMultiplier;
    uint ReadTotalTimeoutConstant;
    uint WriteTotalTimeoutMultiplier;
    uint WriteTotalTimeoutConstant;
}
struct COMMCONFIG
{
    uint dwSize;
    ushort wVersion;
    ushort wReserved;
    DCB dcb;
    uint dwProviderSubType;
    uint dwProviderOffset;
    uint dwProviderSize;
    wchar[1] wcProviderData;
}
