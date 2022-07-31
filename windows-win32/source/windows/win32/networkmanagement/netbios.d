module windows.win32.networkmanagement.netbios;

import windows.win32.foundation : HANDLE;

version (Windows):
extern (Windows):

ubyte Netbios(NCB*);
enum NCBNAMSZ = 0x00000010;
enum MAX_LANA = 0x000000fe;
enum NAME_FLAGS_MASK = 0x00000087;
enum GROUP_NAME = 0x00000080;
enum UNIQUE_NAME = 0x00000000;
enum REGISTERING = 0x00000000;
enum REGISTERED = 0x00000004;
enum DEREGISTERED = 0x00000005;
enum DUPLICATE = 0x00000006;
enum DUPLICATE_DEREG = 0x00000007;
enum LISTEN_OUTSTANDING = 0x00000001;
enum CALL_PENDING = 0x00000002;
enum SESSION_ESTABLISHED = 0x00000003;
enum HANGUP_PENDING = 0x00000004;
enum HANGUP_COMPLETE = 0x00000005;
enum SESSION_ABORTED = 0x00000006;
enum ALL_TRANSPORTS = "M\0\0\0";
enum MS_NBF = "MNBF";
enum NCBCALL = 0x00000010;
enum NCBLISTEN = 0x00000011;
enum NCBHANGUP = 0x00000012;
enum NCBSEND = 0x00000014;
enum NCBRECV = 0x00000015;
enum NCBRECVANY = 0x00000016;
enum NCBCHAINSEND = 0x00000017;
enum NCBDGSEND = 0x00000020;
enum NCBDGRECV = 0x00000021;
enum NCBDGSENDBC = 0x00000022;
enum NCBDGRECVBC = 0x00000023;
enum NCBADDNAME = 0x00000030;
enum NCBDELNAME = 0x00000031;
enum NCBRESET = 0x00000032;
enum NCBASTAT = 0x00000033;
enum NCBSSTAT = 0x00000034;
enum NCBCANCEL = 0x00000035;
enum NCBADDGRNAME = 0x00000036;
enum NCBENUM = 0x00000037;
enum NCBUNLINK = 0x00000070;
enum NCBSENDNA = 0x00000071;
enum NCBCHAINSENDNA = 0x00000072;
enum NCBLANSTALERT = 0x00000073;
enum NCBACTION = 0x00000077;
enum NCBFINDNAME = 0x00000078;
enum NCBTRACE = 0x00000079;
enum ASYNCH = 0x00000080;
enum NRC_GOODRET = 0x00000000;
enum NRC_BUFLEN = 0x00000001;
enum NRC_ILLCMD = 0x00000003;
enum NRC_CMDTMO = 0x00000005;
enum NRC_INCOMP = 0x00000006;
enum NRC_BADDR = 0x00000007;
enum NRC_SNUMOUT = 0x00000008;
enum NRC_NORES = 0x00000009;
enum NRC_SCLOSED = 0x0000000a;
enum NRC_CMDCAN = 0x0000000b;
enum NRC_DUPNAME = 0x0000000d;
enum NRC_NAMTFUL = 0x0000000e;
enum NRC_ACTSES = 0x0000000f;
enum NRC_LOCTFUL = 0x00000011;
enum NRC_REMTFUL = 0x00000012;
enum NRC_ILLNN = 0x00000013;
enum NRC_NOCALL = 0x00000014;
enum NRC_NOWILD = 0x00000015;
enum NRC_INUSE = 0x00000016;
enum NRC_NAMERR = 0x00000017;
enum NRC_SABORT = 0x00000018;
enum NRC_NAMCONF = 0x00000019;
enum NRC_IFBUSY = 0x00000021;
enum NRC_TOOMANY = 0x00000022;
enum NRC_BRIDGE = 0x00000023;
enum NRC_CANOCCR = 0x00000024;
enum NRC_CANCEL = 0x00000026;
enum NRC_DUPENV = 0x00000030;
enum NRC_ENVNOTDEF = 0x00000034;
enum NRC_OSRESNOTAV = 0x00000035;
enum NRC_MAXAPPS = 0x00000036;
enum NRC_NOSAPS = 0x00000037;
enum NRC_NORESOURCES = 0x00000038;
enum NRC_INVADDRESS = 0x00000039;
enum NRC_INVDDID = 0x0000003b;
enum NRC_LOCKFAIL = 0x0000003c;
enum NRC_OPENERR = 0x0000003f;
enum NRC_SYSTEM = 0x00000040;
enum NRC_PENDING = 0x000000ff;
struct NCB
{
    ubyte ncb_command;
    ubyte ncb_retcode;
    ubyte ncb_lsn;
    ubyte ncb_num;
    ubyte* ncb_buffer;
    ushort ncb_length;
    ubyte[16] ncb_callname;
    ubyte[16] ncb_name;
    ubyte ncb_rto;
    ubyte ncb_sto;
    long ncb_post;
    ubyte ncb_lana_num;
    ubyte ncb_cmd_cplt;
    ubyte[18] ncb_reserve;
    HANDLE ncb_event;
}
struct ADAPTER_STATUS
{
    ubyte[6] adapter_address;
    ubyte rev_major;
    ubyte reserved0;
    ubyte adapter_type;
    ubyte rev_minor;
    ushort duration;
    ushort frmr_recv;
    ushort frmr_xmit;
    ushort iframe_recv_err;
    ushort xmit_aborts;
    uint xmit_success;
    uint recv_success;
    ushort iframe_xmit_err;
    ushort recv_buff_unavail;
    ushort t1_timeouts;
    ushort ti_timeouts;
    uint reserved1;
    ushort free_ncbs;
    ushort max_cfg_ncbs;
    ushort max_ncbs;
    ushort xmit_buf_unavail;
    ushort max_dgram_size;
    ushort pending_sess;
    ushort max_cfg_sess;
    ushort max_sess;
    ushort max_sess_pkt_size;
    ushort name_count;
}
struct NAME_BUFFER
{
    ubyte[16] name;
    ubyte name_num;
    ubyte name_flags;
}
struct SESSION_HEADER
{
    ubyte sess_name;
    ubyte num_sess;
    ubyte rcv_dg_outstanding;
    ubyte rcv_any_outstanding;
}
struct SESSION_BUFFER
{
    ubyte lsn;
    ubyte state;
    ubyte[16] local_name;
    ubyte[16] remote_name;
    ubyte rcvs_outstanding;
    ubyte sends_outstanding;
}
struct LANA_ENUM
{
    ubyte length;
    ubyte[255] lana;
}
struct FIND_NAME_HEADER
{
    ushort node_count;
    ubyte reserved;
    ubyte unique_group;
}
struct FIND_NAME_BUFFER
{
    ubyte length;
    ubyte access_control;
    ubyte frame_control;
    ubyte[6] destination_addr;
    ubyte[6] source_addr;
    ubyte[18] routing_info;
}
struct ACTION_HEADER
{
    uint transport_id;
    ushort action_code;
    ushort reserved;
}
/+ [CONFLICTED] struct NCB
{
    ubyte ncb_command;
    ubyte ncb_retcode;
    ubyte ncb_lsn;
    ubyte ncb_num;
    ubyte* ncb_buffer;
    ushort ncb_length;
    ubyte[16] ncb_callname;
    ubyte[16] ncb_name;
    ubyte ncb_rto;
    ubyte ncb_sto;
    long ncb_post;
    ubyte ncb_lana_num;
    ubyte ncb_cmd_cplt;
    ubyte[10] ncb_reserve;
    HANDLE ncb_event;
}
+/
