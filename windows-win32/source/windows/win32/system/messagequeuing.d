module windows.win32.system.messagequeuing;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HANDLE, HRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.security : OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.system.distributedtransactioncoordinator : ITransaction;
import windows.win32.system.io : OVERLAPPED;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

alias MQQUEUEACCESSMASK = uint;
enum : uint
{
    MQSEC_DELETE_QUEUE             = 0x00010000,
    MQSEC_GET_QUEUE_PERMISSIONS    = 0x00020000,
    MQSEC_CHANGE_QUEUE_PERMISSIONS = 0x00040000,
    MQSEC_TAKE_QUEUE_OWNERSHIP     = 0x00080000,
    MQSEC_RECEIVE_MESSAGE          = 0x00000003,
    MQSEC_RECEIVE_JOURNAL_MESSAGE  = 0x0000000a,
    MQSEC_QUEUE_GENERIC_READ       = 0x0002002b,
    MQSEC_QUEUE_GENERIC_WRITE      = 0x00020024,
    MQSEC_QUEUE_GENERIC_ALL        = 0x000f003f,
    MQSEC_DELETE_MESSAGE           = 0x00000001,
    MQSEC_PEEK_MESSAGE             = 0x00000002,
    MQSEC_WRITE_MESSAGE            = 0x00000004,
    MQSEC_DELETE_JOURNAL_MESSAGE   = 0x00000008,
    MQSEC_SET_QUEUE_PROPERTIES     = 0x00000010,
    MQSEC_GET_QUEUE_PROPERTIES     = 0x00000020,
    MQSEC_QUEUE_GENERIC_EXECUTE    = 0x00000000,
}

HRESULT MQCreateQueue(PSECURITY_DESCRIPTOR pSecurityDescriptor, MQQUEUEPROPS* pQueueProps, PWSTR lpwcsFormatName, uint* lpdwFormatNameLength);
HRESULT MQDeleteQueue(const(wchar)* lpwcsFormatName);
HRESULT MQLocateBegin(const(wchar)* lpwcsContext, MQRESTRICTION* pRestriction, MQCOLUMNSET* pColumns, MQSORTSET* pSort, HANDLE* phEnum);
HRESULT MQLocateNext(HANDLE hEnum, uint* pcProps, PROPVARIANT* aPropVar);
HRESULT MQLocateEnd(HANDLE hEnum);
HRESULT MQOpenQueue(const(wchar)* lpwcsFormatName, uint dwAccess, uint dwShareMode, long* phQueue);
HRESULT MQSendMessage(long hDestinationQueue, MQMSGPROPS* pMessageProps, ITransaction pTransaction);
HRESULT MQReceiveMessage(long hSource, uint dwTimeout, uint dwAction, MQMSGPROPS* pMessageProps, OVERLAPPED* lpOverlapped, PMQRECEIVECALLBACK fnReceiveCallback, HANDLE hCursor, ITransaction pTransaction);
HRESULT MQReceiveMessageByLookupId(long hSource, ulong ullLookupId, uint dwLookupAction, MQMSGPROPS* pMessageProps, OVERLAPPED* lpOverlapped, PMQRECEIVECALLBACK fnReceiveCallback, ITransaction pTransaction);
HRESULT MQCreateCursor(long hQueue, HANDLE* phCursor);
HRESULT MQCloseCursor(HANDLE hCursor);
HRESULT MQCloseQueue(long hQueue);
HRESULT MQSetQueueProperties(const(wchar)* lpwcsFormatName, MQQUEUEPROPS* pQueueProps);
HRESULT MQGetQueueProperties(const(wchar)* lpwcsFormatName, MQQUEUEPROPS* pQueueProps);
HRESULT MQGetQueueSecurity(const(wchar)* lpwcsFormatName, uint RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded);
HRESULT MQSetQueueSecurity(const(wchar)* lpwcsFormatName, OBJECT_SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
HRESULT MQPathNameToFormatName(const(wchar)* lpwcsPathName, PWSTR lpwcsFormatName, uint* lpdwFormatNameLength);
HRESULT MQHandleToFormatName(long hQueue, PWSTR lpwcsFormatName, uint* lpdwFormatNameLength);
HRESULT MQInstanceToFormatName(GUID* pGuid, PWSTR lpwcsFormatName, uint* lpdwFormatNameLength);
HRESULT MQADsPathToFormatName(const(wchar)* lpwcsADsPath, PWSTR lpwcsFormatName, uint* lpdwFormatNameLength);
void MQFreeMemory(void* pvMemory);
HRESULT MQGetMachineProperties(const(wchar)* lpwcsMachineName, const(GUID)* pguidMachineId, MQQMPROPS* pQMProps);
HRESULT MQGetSecurityContext(void* lpCertBuffer, uint dwCertBufferLength, HANDLE* phSecurityContext);
HRESULT MQGetSecurityContextEx(void* lpCertBuffer, uint dwCertBufferLength, HANDLE* phSecurityContext);
void MQFreeSecurityContext(HANDLE hSecurityContext);
HRESULT MQRegisterCertificate(uint dwFlags, void* lpCertBuffer, uint dwCertBufferLength);
HRESULT MQBeginTransaction(ITransaction* ppTransaction);
HRESULT MQGetOverlappedResult(OVERLAPPED* lpOverlapped);
HRESULT MQGetPrivateComputerInformation(const(wchar)* lpwcsComputerName, MQPRIVATEPROPS* pPrivateProps);
HRESULT MQPurgeQueue(long hQueue);
HRESULT MQMgmtGetInfo(const(wchar)* pComputerName, const(wchar)* pObjectName, MQMGMTPROPS* pMgmtProps);
HRESULT MQMgmtAction(const(wchar)* pComputerName, const(wchar)* pObjectName, const(wchar)* pAction);
HRESULT MQMarkMessageRejected(HANDLE hQueue, ulong ullLookupId);
HRESULT MQMoveMessage(long hSourceQueue, long hDestinationQueue, ulong ullLookupId, ITransaction pTransaction);
enum PRLT = 0x00000000;
enum PRLE = 0x00000001;
enum PRGT = 0x00000002;
enum PRGE = 0x00000003;
enum PREQ = 0x00000004;
enum PRNE = 0x00000005;
enum QUERY_SORTASCEND = 0x00000000;
enum QUERY_SORTDESCEND = 0x00000001;
enum MQ_MOVE_ACCESS = 0x00000004;
enum MQ_ACTION_RECEIVE = 0x00000000;
enum MQ_ACTION_PEEK_CURRENT = 0x80000000;
enum MQ_ACTION_PEEK_NEXT = 0x80000001;
enum MQ_LOOKUP_PEEK_CURRENT = 0x40000010;
enum MQ_LOOKUP_PEEK_NEXT = 0x40000011;
enum MQ_LOOKUP_PEEK_PREV = 0x40000012;
enum MQ_LOOKUP_PEEK_FIRST = 0x40000014;
enum MQ_LOOKUP_PEEK_LAST = 0x40000018;
enum MQ_LOOKUP_RECEIVE_CURRENT = 0x40000020;
enum MQ_LOOKUP_RECEIVE_NEXT = 0x40000021;
enum MQ_LOOKUP_RECEIVE_PREV = 0x40000022;
enum MQ_LOOKUP_RECEIVE_FIRST = 0x40000024;
enum MQ_LOOKUP_RECEIVE_LAST = 0x40000028;
enum MQ_LOOKUP_RECEIVE_ALLOW_PEEK = 0x40000120;
enum PROPID_M_BASE = 0x00000000;
enum PROPID_M_CLASS = 0x00000001;
enum PROPID_M_MSGID = 0x00000002;
enum PROPID_M_CORRELATIONID = 0x00000003;
enum PROPID_M_PRIORITY = 0x00000004;
enum PROPID_M_DELIVERY = 0x00000005;
enum PROPID_M_ACKNOWLEDGE = 0x00000006;
enum PROPID_M_JOURNAL = 0x00000007;
enum PROPID_M_APPSPECIFIC = 0x00000008;
enum PROPID_M_BODY = 0x00000009;
enum PROPID_M_BODY_SIZE = 0x0000000a;
enum PROPID_M_LABEL = 0x0000000b;
enum PROPID_M_LABEL_LEN = 0x0000000c;
enum PROPID_M_TIME_TO_REACH_QUEUE = 0x0000000d;
enum PROPID_M_TIME_TO_BE_RECEIVED = 0x0000000e;
enum PROPID_M_RESP_QUEUE = 0x0000000f;
enum PROPID_M_RESP_QUEUE_LEN = 0x00000010;
enum PROPID_M_ADMIN_QUEUE = 0x00000011;
enum PROPID_M_ADMIN_QUEUE_LEN = 0x00000012;
enum PROPID_M_VERSION = 0x00000013;
enum PROPID_M_SENDERID = 0x00000014;
enum PROPID_M_SENDERID_LEN = 0x00000015;
enum PROPID_M_SENDERID_TYPE = 0x00000016;
enum PROPID_M_PRIV_LEVEL = 0x00000017;
enum PROPID_M_AUTH_LEVEL = 0x00000018;
enum PROPID_M_AUTHENTICATED = 0x00000019;
enum PROPID_M_HASH_ALG = 0x0000001a;
enum PROPID_M_ENCRYPTION_ALG = 0x0000001b;
enum PROPID_M_SENDER_CERT = 0x0000001c;
enum PROPID_M_SENDER_CERT_LEN = 0x0000001d;
enum PROPID_M_SRC_MACHINE_ID = 0x0000001e;
enum PROPID_M_SENTTIME = 0x0000001f;
enum PROPID_M_ARRIVEDTIME = 0x00000020;
enum PROPID_M_DEST_QUEUE = 0x00000021;
enum PROPID_M_DEST_QUEUE_LEN = 0x00000022;
enum PROPID_M_EXTENSION = 0x00000023;
enum PROPID_M_EXTENSION_LEN = 0x00000024;
enum PROPID_M_SECURITY_CONTEXT = 0x00000025;
enum PROPID_M_CONNECTOR_TYPE = 0x00000026;
enum PROPID_M_XACT_STATUS_QUEUE = 0x00000027;
enum PROPID_M_XACT_STATUS_QUEUE_LEN = 0x00000028;
enum PROPID_M_TRACE = 0x00000029;
enum PROPID_M_BODY_TYPE = 0x0000002a;
enum PROPID_M_DEST_SYMM_KEY = 0x0000002b;
enum PROPID_M_DEST_SYMM_KEY_LEN = 0x0000002c;
enum PROPID_M_SIGNATURE = 0x0000002d;
enum PROPID_M_SIGNATURE_LEN = 0x0000002e;
enum PROPID_M_PROV_TYPE = 0x0000002f;
enum PROPID_M_PROV_NAME = 0x00000030;
enum PROPID_M_PROV_NAME_LEN = 0x00000031;
enum PROPID_M_FIRST_IN_XACT = 0x00000032;
enum PROPID_M_LAST_IN_XACT = 0x00000033;
enum PROPID_M_XACTID = 0x00000034;
enum PROPID_M_AUTHENTICATED_EX = 0x00000035;
enum PROPID_M_RESP_FORMAT_NAME = 0x00000036;
enum PROPID_M_RESP_FORMAT_NAME_LEN = 0x00000037;
enum PROPID_M_DEST_FORMAT_NAME = 0x0000003a;
enum PROPID_M_DEST_FORMAT_NAME_LEN = 0x0000003b;
enum PROPID_M_LOOKUPID = 0x0000003c;
enum PROPID_M_SOAP_ENVELOPE = 0x0000003d;
enum PROPID_M_SOAP_ENVELOPE_LEN = 0x0000003e;
enum PROPID_M_COMPOUND_MESSAGE = 0x0000003f;
enum PROPID_M_COMPOUND_MESSAGE_SIZE = 0x00000040;
enum PROPID_M_SOAP_HEADER = 0x00000041;
enum PROPID_M_SOAP_BODY = 0x00000042;
enum PROPID_M_DEADLETTER_QUEUE = 0x00000043;
enum PROPID_M_DEADLETTER_QUEUE_LEN = 0x00000044;
enum PROPID_M_ABORT_COUNT = 0x00000045;
enum PROPID_M_MOVE_COUNT = 0x00000046;
enum PROPID_M_LAST_MOVE_TIME = 0x0000004b;
enum PROPID_M_MSGID_SIZE = 0x00000014;
enum PROPID_M_CORRELATIONID_SIZE = 0x00000014;
enum PROPID_M_XACTID_SIZE = 0x00000014;
enum MQMSG_PRIV_LEVEL_BODY_AES = 0x00000005;
enum MQMSG_AUTHENTICATED_QM_MESSAGE = 0x0000000b;
enum MQMSG_NOT_FIRST_IN_XACT = 0x00000000;
enum MQMSG_FIRST_IN_XACT = 0x00000001;
enum MQMSG_NOT_LAST_IN_XACT = 0x00000000;
enum MQMSG_LAST_IN_XACT = 0x00000001;
enum PROPID_Q_BASE = 0x00000064;
enum PROPID_Q_INSTANCE = 0x00000065;
enum PROPID_Q_TYPE = 0x00000066;
enum PROPID_Q_PATHNAME = 0x00000067;
enum PROPID_Q_JOURNAL = 0x00000068;
enum PROPID_Q_QUOTA = 0x00000069;
enum PROPID_Q_BASEPRIORITY = 0x0000006a;
enum PROPID_Q_JOURNAL_QUOTA = 0x0000006b;
enum PROPID_Q_LABEL = 0x0000006c;
enum PROPID_Q_CREATE_TIME = 0x0000006d;
enum PROPID_Q_MODIFY_TIME = 0x0000006e;
enum PROPID_Q_AUTHENTICATE = 0x0000006f;
enum PROPID_Q_PRIV_LEVEL = 0x00000070;
enum PROPID_Q_TRANSACTION = 0x00000071;
enum PROPID_Q_PATHNAME_DNS = 0x0000007c;
enum PROPID_Q_MULTICAST_ADDRESS = 0x0000007d;
enum PROPID_Q_ADS_PATH = 0x0000007e;
enum MQ_QTYPE_REPORT = GUID(0x55ee8f32, 0xcce9, 0x11cf, [0xb1, 0x8, 0x0, 0x20, 0xaf, 0xd6, 0x1c, 0xe9]);
enum MQ_QTYPE_TEST = GUID(0x55ee8f33, 0xcce9, 0x11cf, [0xb1, 0x8, 0x0, 0x20, 0xaf, 0xd6, 0x1c, 0xe9]);
enum PROPID_QM_BASE = 0x000000c8;
enum PROPID_QM_SITE_ID = 0x000000c9;
enum PROPID_QM_MACHINE_ID = 0x000000ca;
enum PROPID_QM_PATHNAME = 0x000000cb;
enum PROPID_QM_CONNECTION = 0x000000cc;
enum PROPID_QM_ENCRYPTION_PK = 0x000000cd;
enum PROPID_QM_ENCRYPTION_PK_BASE = 0x000000e7;
enum PROPID_QM_ENCRYPTION_PK_ENHANCED = 0x000000e8;
enum PROPID_QM_PATHNAME_DNS = 0x000000e9;
enum PROPID_QM_ENCRYPTION_PK_AES = 0x000000f4;
enum PROPID_PC_BASE = 0x000016a8;
enum PROPID_PC_VERSION = 0x000016a9;
enum PROPID_PC_DS_ENABLED = 0x000016aa;
enum PROPID_MGMT_MSMQ_BASE = 0x00000000;
enum PROPID_MGMT_MSMQ_ACTIVEQUEUES = 0x00000001;
enum PROPID_MGMT_MSMQ_PRIVATEQ = 0x00000002;
enum PROPID_MGMT_MSMQ_DSSERVER = 0x00000003;
enum PROPID_MGMT_MSMQ_CONNECTED = 0x00000004;
enum PROPID_MGMT_MSMQ_TYPE = 0x00000005;
enum PROPID_MGMT_MSMQ_BYTES_IN_ALL_QUEUES = 0x00000006;
enum MSMQ_CONNECTED = "CONNECTED";
enum MSMQ_DISCONNECTED = "DISCONNECTED";
enum PROPID_MGMT_QUEUE_BASE = 0x00000000;
enum PROPID_MGMT_QUEUE_PATHNAME = 0x00000001;
enum PROPID_MGMT_QUEUE_FORMATNAME = 0x00000002;
enum PROPID_MGMT_QUEUE_TYPE = 0x00000003;
enum PROPID_MGMT_QUEUE_LOCATION = 0x00000004;
enum PROPID_MGMT_QUEUE_XACT = 0x00000005;
enum PROPID_MGMT_QUEUE_FOREIGN = 0x00000006;
enum PROPID_MGMT_QUEUE_MESSAGE_COUNT = 0x00000007;
enum PROPID_MGMT_QUEUE_BYTES_IN_QUEUE = 0x00000008;
enum PROPID_MGMT_QUEUE_JOURNAL_MESSAGE_COUNT = 0x00000009;
enum PROPID_MGMT_QUEUE_BYTES_IN_JOURNAL = 0x0000000a;
enum PROPID_MGMT_QUEUE_STATE = 0x0000000b;
enum PROPID_MGMT_QUEUE_NEXTHOPS = 0x0000000c;
enum PROPID_MGMT_QUEUE_EOD_LAST_ACK = 0x0000000d;
enum PROPID_MGMT_QUEUE_EOD_LAST_ACK_TIME = 0x0000000e;
enum PROPID_MGMT_QUEUE_EOD_LAST_ACK_COUNT = 0x0000000f;
enum PROPID_MGMT_QUEUE_EOD_FIRST_NON_ACK = 0x00000010;
enum PROPID_MGMT_QUEUE_EOD_LAST_NON_ACK = 0x00000011;
enum PROPID_MGMT_QUEUE_EOD_NEXT_SEQ = 0x00000012;
enum PROPID_MGMT_QUEUE_EOD_NO_READ_COUNT = 0x00000013;
enum PROPID_MGMT_QUEUE_EOD_NO_ACK_COUNT = 0x00000014;
enum PROPID_MGMT_QUEUE_EOD_RESEND_TIME = 0x00000015;
enum PROPID_MGMT_QUEUE_EOD_RESEND_INTERVAL = 0x00000016;
enum PROPID_MGMT_QUEUE_EOD_RESEND_COUNT = 0x00000017;
enum PROPID_MGMT_QUEUE_EOD_SOURCE_INFO = 0x00000018;
enum PROPID_MGMT_QUEUE_CONNECTION_HISTORY = 0x00000019;
enum PROPID_MGMT_QUEUE_SUBQUEUE_COUNT = 0x0000001a;
enum PROPID_MGMT_QUEUE_SUBQUEUE_NAMES = 0x0000001b;
enum PROPID_MGMT_QUEUE_USED_QUOTA = 0x00000008;
enum PROPID_MGMT_QUEUE_JOURNAL_USED_QUOTA = 0x0000000a;
enum MGMT_QUEUE_TYPE_PUBLIC = "PUBLIC";
enum MGMT_QUEUE_TYPE_PRIVATE = "PRIVATE";
enum MGMT_QUEUE_TYPE_MACHINE = "MACHINE";
enum MGMT_QUEUE_TYPE_CONNECTOR = "CONNECTOR";
enum MGMT_QUEUE_TYPE_MULTICAST = "MULTICAST";
enum MGMT_QUEUE_STATE_LOCAL = "LOCAL CONNECTION";
enum MGMT_QUEUE_STATE_NONACTIVE = "INACTIVE";
enum MGMT_QUEUE_STATE_WAITING = "WAITING";
enum MGMT_QUEUE_STATE_NEED_VALIDATE = "NEED VALIDATION";
enum MGMT_QUEUE_STATE_ONHOLD = "ONHOLD";
enum MGMT_QUEUE_STATE_CONNECTED = "CONNECTED";
enum MGMT_QUEUE_STATE_DISCONNECTING = "DISCONNECTING";
enum MGMT_QUEUE_STATE_DISCONNECTED = "DISCONNECTED";
enum MGMT_QUEUE_STATE_LOCKED = "LOCKED";
enum MGMT_QUEUE_LOCAL_LOCATION = "LOCAL";
enum MGMT_QUEUE_REMOTE_LOCATION = "REMOTE";
enum MGMT_QUEUE_UNKNOWN_TYPE = "UNKNOWN";
enum MGMT_QUEUE_CORRECT_TYPE = "YES";
enum MGMT_QUEUE_INCORRECT_TYPE = "NO";
enum MGMT_QUEUE_TRANSACTIONAL_TYPE = "YES";
enum MGMT_QUEUE_NOT_TRANSACTIONAL_TYPE = "NO";
enum MGMT_QUEUE_FOREIGN_TYPE = "YES";
enum MGMT_QUEUE_NOT_FOREIGN_TYPE = "NO";
enum MO_MACHINE_TOKEN = "MACHINE";
enum MO_QUEUE_TOKEN = "QUEUE";
enum MACHINE_ACTION_CONNECT = "CONNECT";
enum MACHINE_ACTION_DISCONNECT = "DISCONNECT";
enum MACHINE_ACTION_TIDY = "TIDY";
enum QUEUE_ACTION_PAUSE = "PAUSE";
enum QUEUE_ACTION_RESUME = "RESUME";
enum QUEUE_ACTION_EOD_RESEND = "EOD_RESEND";
enum LONG_LIVED = 0xfffffffe;
enum MQ_OK = 0x00000000;
enum MQ_ERROR_RESOLVE_ADDRESS = 0xffffffffc00e0099;
enum MQ_ERROR_TOO_MANY_PROPERTIES = 0xffffffffc00e009a;
enum MQ_ERROR_MESSAGE_NOT_AUTHENTICATED = 0xffffffffc00e009b;
enum MQ_ERROR_MESSAGE_LOCKED_UNDER_TRANSACTION = 0xffffffffc00e009c;
alias MQCALG = int;
enum : int
{
    MQMSG_CALG_MD2      = 0x00008001,
    MQMSG_CALG_MD4      = 0x00008002,
    MQMSG_CALG_MD5      = 0x00008003,
    MQMSG_CALG_SHA      = 0x00008004,
    MQMSG_CALG_SHA1     = 0x00008004,
    MQMSG_CALG_MAC      = 0x00008005,
    MQMSG_CALG_RSA_SIGN = 0x00002400,
    MQMSG_CALG_DSS_SIGN = 0x00002200,
    MQMSG_CALG_RSA_KEYX = 0x0000a400,
    MQMSG_CALG_DES      = 0x00006601,
    MQMSG_CALG_RC2      = 0x00006602,
    MQMSG_CALG_RC4      = 0x00006801,
    MQMSG_CALG_SEAL     = 0x00006802,
}

alias MQTRANSACTION = int;
enum : int
{
    MQ_NO_TRANSACTION  = 0x00000000,
    MQ_MTS_TRANSACTION = 0x00000001,
    MQ_XA_TRANSACTION  = 0x00000002,
    MQ_SINGLE_MESSAGE  = 0x00000003,
}

alias RELOPS = int;
enum : int
{
    REL_NOP = 0x00000000,
    REL_EQ  = 0x00000001,
    REL_NEQ = 0x00000002,
    REL_LT  = 0x00000003,
    REL_GT  = 0x00000004,
    REL_LE  = 0x00000005,
    REL_GE  = 0x00000006,
}

alias MQCERT_REGISTER = int;
enum : int
{
    MQCERT_REGISTER_ALWAYS       = 0x00000001,
    MQCERT_REGISTER_IF_NOT_EXIST = 0x00000002,
}

alias MQMSGCURSOR = int;
enum : int
{
    MQMSG_FIRST   = 0x00000000,
    MQMSG_CURRENT = 0x00000001,
    MQMSG_NEXT    = 0x00000002,
}

alias MQMSGCLASS = int;
enum : int
{
    MQMSG_CLASS_NORMAL                            = 0x00000000,
    MQMSG_CLASS_REPORT                            = 0x00000001,
    MQMSG_CLASS_ACK_REACH_QUEUE                   = 0x00000002,
    MQMSG_CLASS_ACK_RECEIVE                       = 0x00004000,
    MQMSG_CLASS_NACK_BAD_DST_Q                    = 0x00008000,
    MQMSG_CLASS_NACK_PURGED                       = 0x00008001,
    MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT          = 0x00008002,
    MQMSG_CLASS_NACK_Q_EXCEED_QUOTA               = 0x00008003,
    MQMSG_CLASS_NACK_ACCESS_DENIED                = 0x00008004,
    MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED           = 0x00008005,
    MQMSG_CLASS_NACK_BAD_SIGNATURE                = 0x00008006,
    MQMSG_CLASS_NACK_BAD_ENCRYPTION               = 0x00008007,
    MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT            = 0x00008008,
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q          = 0x00008009,
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG        = 0x0000800a,
    MQMSG_CLASS_NACK_UNSUPPORTED_CRYPTO_PROVIDER  = 0x0000800b,
    MQMSG_CLASS_NACK_SOURCE_COMPUTER_GUID_CHANGED = 0x0000800c,
    MQMSG_CLASS_NACK_Q_DELETED                    = 0x0000c000,
    MQMSG_CLASS_NACK_Q_PURGED                     = 0x0000c001,
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT              = 0x0000c002,
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT_AT_SENDER    = 0x0000c003,
}

alias MQMSGDELIVERY = int;
enum : int
{
    MQMSG_DELIVERY_EXPRESS     = 0x00000000,
    MQMSG_DELIVERY_RECOVERABLE = 0x00000001,
}

alias MQMSGACKNOWLEDGEMENT = int;
enum : int
{
    MQMSG_ACKNOWLEDGMENT_NONE             = 0x00000000,
    MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL      = 0x00000001,
    MQMSG_ACKNOWLEDGMENT_POS_RECEIVE      = 0x00000002,
    MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL      = 0x00000004,
    MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE      = 0x00000008,
    MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE = 0x00000004,
    MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE = 0x00000005,
    MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE     = 0x0000000c,
    MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE     = 0x0000000e,
}

alias MQMSGJOURNAL = int;
enum : int
{
    MQMSG_JOURNAL_NONE = 0x00000000,
    MQMSG_DEADLETTER   = 0x00000001,
    MQMSG_JOURNAL      = 0x00000002,
}

alias MQMSGTRACE = int;
enum : int
{
    MQMSG_TRACE_NONE                 = 0x00000000,
    MQMSG_SEND_ROUTE_TO_REPORT_QUEUE = 0x00000001,
}

alias MQMSGSENDERIDTYPE = int;
enum : int
{
    MQMSG_SENDERID_TYPE_NONE = 0x00000000,
    MQMSG_SENDERID_TYPE_SID  = 0x00000001,
}

alias MQMSGPRIVLEVEL = int;
enum : int
{
    MQMSG_PRIV_LEVEL_NONE          = 0x00000000,
    MQMSG_PRIV_LEVEL_BODY_BASE     = 0x00000001,
    MQMSG_PRIV_LEVEL_BODY_ENHANCED = 0x00000003,
}

alias MQMSGAUTHLEVEL = int;
enum : int
{
    MQMSG_AUTH_LEVEL_NONE   = 0x00000000,
    MQMSG_AUTH_LEVEL_ALWAYS = 0x00000001,
    MQMSG_AUTH_LEVEL_MSMQ10 = 0x00000002,
    MQMSG_AUTH_LEVEL_SIG10  = 0x00000002,
    MQMSG_AUTH_LEVEL_MSMQ20 = 0x00000004,
    MQMSG_AUTH_LEVEL_SIG20  = 0x00000004,
    MQMSG_AUTH_LEVEL_SIG30  = 0x00000008,
}

alias MQMSGIDSIZE = int;
enum : int
{
    MQMSG_MSGID_SIZE         = 0x00000014,
    MQMSG_CORRELATIONID_SIZE = 0x00000014,
    MQMSG_XACTID_SIZE        = 0x00000014,
}

alias MQMSGMAX = int;
enum : int
{
    MQ_MAX_MSG_LABEL_LEN = 0x000000f9,
}

alias MQMSGAUTHENTICATION = int;
enum : int
{
    MQMSG_AUTHENTICATION_NOT_REQUESTED = 0x00000000,
    MQMSG_AUTHENTICATION_REQUESTED     = 0x00000001,
    MQMSG_AUTHENTICATED_SIG10          = 0x00000001,
    MQMSG_AUTHENTICATION_REQUESTED_EX  = 0x00000003,
    MQMSG_AUTHENTICATED_SIG20          = 0x00000003,
    MQMSG_AUTHENTICATED_SIG30          = 0x00000005,
    MQMSG_AUTHENTICATED_SIGXML         = 0x00000009,
}

alias MQSHARE = int;
enum : int
{
    MQ_DENY_NONE          = 0x00000000,
    MQ_DENY_RECEIVE_SHARE = 0x00000001,
}

alias MQACCESS = int;
enum : int
{
    MQ_RECEIVE_ACCESS = 0x00000001,
    MQ_SEND_ACCESS    = 0x00000002,
    MQ_PEEK_ACCESS    = 0x00000020,
    MQ_ADMIN_ACCESS   = 0x00000080,
}

alias MQJOURNAL = int;
enum : int
{
    MQ_JOURNAL_NONE = 0x00000000,
    MQ_JOURNAL      = 0x00000001,
}

alias MQTRANSACTIONAL = int;
enum : int
{
    MQ_TRANSACTIONAL_NONE = 0x00000000,
    MQ_TRANSACTIONAL      = 0x00000001,
}

alias MQAUTHENTICATE = int;
enum : int
{
    MQ_AUTHENTICATE_NONE = 0x00000000,
    MQ_AUTHENTICATE      = 0x00000001,
}

alias MQPRIVLEVEL = int;
enum : int
{
    MQ_PRIV_LEVEL_NONE     = 0x00000000,
    MQ_PRIV_LEVEL_OPTIONAL = 0x00000001,
    MQ_PRIV_LEVEL_BODY     = 0x00000002,
}

alias MQPRIORITY = int;
enum : int
{
    MQ_MIN_PRIORITY = 0x00000000,
    MQ_MAX_PRIORITY = 0x00000007,
}

alias MQMAX = int;
enum : int
{
    MQ_MAX_Q_NAME_LEN  = 0x0000007c,
    MQ_MAX_Q_LABEL_LEN = 0x0000007c,
}

alias QUEUE_TYPE = int;
enum : int
{
    MQ_TYPE_PUBLIC    = 0x00000000,
    MQ_TYPE_PRIVATE   = 0x00000001,
    MQ_TYPE_MACHINE   = 0x00000002,
    MQ_TYPE_CONNECTOR = 0x00000003,
    MQ_TYPE_MULTICAST = 0x00000004,
}

alias FOREIGN_STATUS = int;
enum : int
{
    MQ_STATUS_FOREIGN     = 0x00000000,
    MQ_STATUS_NOT_FOREIGN = 0x00000001,
    MQ_STATUS_UNKNOWN     = 0x00000002,
}

alias XACT_STATUS = int;
enum : int
{
    MQ_XACT_STATUS_XACT     = 0x00000000,
    MQ_XACT_STATUS_NOT_XACT = 0x00000001,
    MQ_XACT_STATUS_UNKNOWN  = 0x00000002,
}

alias QUEUE_STATE = int;
enum : int
{
    MQ_QUEUE_STATE_LOCAL_CONNECTION = 0x00000000,
    MQ_QUEUE_STATE_DISCONNECTED     = 0x00000001,
    MQ_QUEUE_STATE_WAITING          = 0x00000002,
    MQ_QUEUE_STATE_NEEDVALIDATE     = 0x00000003,
    MQ_QUEUE_STATE_ONHOLD           = 0x00000004,
    MQ_QUEUE_STATE_NONACTIVE        = 0x00000005,
    MQ_QUEUE_STATE_CONNECTED        = 0x00000006,
    MQ_QUEUE_STATE_DISCONNECTING    = 0x00000007,
    MQ_QUEUE_STATE_LOCKED           = 0x00000008,
}

alias MQDEFAULT = int;
enum : int
{
    DEFAULT_M_PRIORITY      = 0x00000003,
    DEFAULT_M_DELIVERY      = 0x00000000,
    DEFAULT_M_ACKNOWLEDGE   = 0x00000000,
    DEFAULT_M_JOURNAL       = 0x00000000,
    DEFAULT_M_APPSPECIFIC   = 0x00000000,
    DEFAULT_M_PRIV_LEVEL    = 0x00000000,
    DEFAULT_M_AUTH_LEVEL    = 0x00000000,
    DEFAULT_M_SENDERID_TYPE = 0x00000001,
    DEFAULT_Q_JOURNAL       = 0x00000000,
    DEFAULT_Q_BASEPRIORITY  = 0x00000000,
    DEFAULT_Q_QUOTA         = 0xffffffff,
    DEFAULT_Q_JOURNAL_QUOTA = 0xffffffff,
    DEFAULT_Q_TRANSACTION   = 0x00000000,
    DEFAULT_Q_AUTHENTICATE  = 0x00000000,
    DEFAULT_Q_PRIV_LEVEL    = 0x00000001,
    DEFAULT_M_LOOKUPID      = 0x00000000,
}

alias MQERROR = int;
enum : int
{
    MQ_ERROR                                            = 0xc00e0001,
    MQ_ERROR_PROPERTY                                   = 0xc00e0002,
    MQ_ERROR_QUEUE_NOT_FOUND                            = 0xc00e0003,
    MQ_ERROR_QUEUE_NOT_ACTIVE                           = 0xc00e0004,
    MQ_ERROR_QUEUE_EXISTS                               = 0xc00e0005,
    MQ_ERROR_INVALID_PARAMETER                          = 0xc00e0006,
    MQ_ERROR_INVALID_HANDLE                             = 0xc00e0007,
    MQ_ERROR_OPERATION_CANCELLED                        = 0xc00e0008,
    MQ_ERROR_SHARING_VIOLATION                          = 0xc00e0009,
    MQ_ERROR_SERVICE_NOT_AVAILABLE                      = 0xc00e000b,
    MQ_ERROR_MACHINE_NOT_FOUND                          = 0xc00e000d,
    MQ_ERROR_ILLEGAL_SORT                               = 0xc00e0010,
    MQ_ERROR_ILLEGAL_USER                               = 0xc00e0011,
    MQ_ERROR_NO_DS                                      = 0xc00e0013,
    MQ_ERROR_ILLEGAL_QUEUE_PATHNAME                     = 0xc00e0014,
    MQ_ERROR_ILLEGAL_PROPERTY_VALUE                     = 0xc00e0018,
    MQ_ERROR_ILLEGAL_PROPERTY_VT                        = 0xc00e0019,
    MQ_ERROR_BUFFER_OVERFLOW                            = 0xc00e001a,
    MQ_ERROR_IO_TIMEOUT                                 = 0xc00e001b,
    MQ_ERROR_ILLEGAL_CURSOR_ACTION                      = 0xc00e001c,
    MQ_ERROR_MESSAGE_ALREADY_RECEIVED                   = 0xc00e001d,
    MQ_ERROR_ILLEGAL_FORMATNAME                         = 0xc00e001e,
    MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL                = 0xc00e001f,
    MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION           = 0xc00e0020,
    MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR                = 0xc00e0021,
    MQ_ERROR_SENDERID_BUFFER_TOO_SMALL                  = 0xc00e0022,
    MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL              = 0xc00e0023,
    MQ_ERROR_CANNOT_IMPERSONATE_CLIENT                  = 0xc00e0024,
    MQ_ERROR_ACCESS_DENIED                              = 0xc00e0025,
    MQ_ERROR_PRIVILEGE_NOT_HELD                         = 0xc00e0026,
    MQ_ERROR_INSUFFICIENT_RESOURCES                     = 0xc00e0027,
    MQ_ERROR_USER_BUFFER_TOO_SMALL                      = 0xc00e0028,
    MQ_ERROR_MESSAGE_STORAGE_FAILED                     = 0xc00e002a,
    MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL               = 0xc00e002b,
    MQ_ERROR_INVALID_CERTIFICATE                        = 0xc00e002c,
    MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE             = 0xc00e002d,
    MQ_ERROR_INTERNAL_USER_CERT_EXIST                   = 0xc00e002e,
    MQ_ERROR_NO_INTERNAL_USER_CERT                      = 0xc00e002f,
    MQ_ERROR_CORRUPTED_SECURITY_DATA                    = 0xc00e0030,
    MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE              = 0xc00e0031,
    MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION       = 0xc00e0033,
    MQ_ERROR_BAD_SECURITY_CONTEXT                       = 0xc00e0035,
    MQ_ERROR_COULD_NOT_GET_USER_SID                     = 0xc00e0036,
    MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO                 = 0xc00e0037,
    MQ_ERROR_ILLEGAL_MQCOLUMNS                          = 0xc00e0038,
    MQ_ERROR_ILLEGAL_PROPID                             = 0xc00e0039,
    MQ_ERROR_ILLEGAL_RELATION                           = 0xc00e003a,
    MQ_ERROR_ILLEGAL_PROPERTY_SIZE                      = 0xc00e003b,
    MQ_ERROR_ILLEGAL_RESTRICTION_PROPID                 = 0xc00e003c,
    MQ_ERROR_ILLEGAL_MQQUEUEPROPS                       = 0xc00e003d,
    MQ_ERROR_PROPERTY_NOTALLOWED                        = 0xc00e003e,
    MQ_ERROR_INSUFFICIENT_PROPERTIES                    = 0xc00e003f,
    MQ_ERROR_MACHINE_EXISTS                             = 0xc00e0040,
    MQ_ERROR_ILLEGAL_MQQMPROPS                          = 0xc00e0041,
    MQ_ERROR_DS_IS_FULL                                 = 0xc00e0042,
    MQ_ERROR_DS_ERROR                                   = 0xc00e0043,
    MQ_ERROR_INVALID_OWNER                              = 0xc00e0044,
    MQ_ERROR_UNSUPPORTED_ACCESS_MODE                    = 0xc00e0045,
    MQ_ERROR_RESULT_BUFFER_TOO_SMALL                    = 0xc00e0046,
    MQ_ERROR_DELETE_CN_IN_USE                           = 0xc00e0048,
    MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER             = 0xc00e0049,
    MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE                = 0xc00e004a,
    MQ_ERROR_QUEUE_NOT_AVAILABLE                        = 0xc00e004b,
    MQ_ERROR_DTC_CONNECT                                = 0xc00e004c,
    MQ_ERROR_TRANSACTION_IMPORT                         = 0xc00e004e,
    MQ_ERROR_TRANSACTION_USAGE                          = 0xc00e0050,
    MQ_ERROR_TRANSACTION_SEQUENCE                       = 0xc00e0051,
    MQ_ERROR_MISSING_CONNECTOR_TYPE                     = 0xc00e0055,
    MQ_ERROR_STALE_HANDLE                               = 0xc00e0056,
    MQ_ERROR_TRANSACTION_ENLIST                         = 0xc00e0058,
    MQ_ERROR_QUEUE_DELETED                              = 0xc00e005a,
    MQ_ERROR_ILLEGAL_CONTEXT                            = 0xc00e005b,
    MQ_ERROR_ILLEGAL_SORT_PROPID                        = 0xc00e005c,
    MQ_ERROR_LABEL_TOO_LONG                             = 0xc00e005d,
    MQ_ERROR_LABEL_BUFFER_TOO_SMALL                     = 0xc00e005e,
    MQ_ERROR_MQIS_SERVER_EMPTY                          = 0xc00e005f,
    MQ_ERROR_MQIS_READONLY_MODE                         = 0xc00e0060,
    MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL                  = 0xc00e0061,
    MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL                 = 0xc00e0062,
    MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL                 = 0xc00e0063,
    MQ_ERROR_ILLEGAL_OPERATION                          = 0xc00e0064,
    MQ_ERROR_WRITE_NOT_ALLOWED                          = 0xc00e0065,
    MQ_ERROR_WKS_CANT_SERVE_CLIENT                      = 0xc00e0066,
    MQ_ERROR_DEPEND_WKS_LICENSE_OVERFLOW                = 0xc00e0067,
    MQ_CORRUPTED_QUEUE_WAS_DELETED                      = 0xc00e0068,
    MQ_ERROR_REMOTE_MACHINE_NOT_AVAILABLE               = 0xc00e0069,
    MQ_ERROR_UNSUPPORTED_OPERATION                      = 0xc00e006a,
    MQ_ERROR_ENCRYPTION_PROVIDER_NOT_SUPPORTED          = 0xc00e006b,
    MQ_ERROR_CANNOT_SET_CRYPTO_SEC_DESCR                = 0xc00e006c,
    MQ_ERROR_CERTIFICATE_NOT_PROVIDED                   = 0xc00e006d,
    MQ_ERROR_Q_DNS_PROPERTY_NOT_SUPPORTED               = 0xc00e006e,
    MQ_ERROR_CANT_CREATE_CERT_STORE                     = 0xc00e006f,
    MQ_ERROR_CANNOT_CREATE_CERT_STORE                   = 0xc00e006f,
    MQ_ERROR_CANT_OPEN_CERT_STORE                       = 0xc00e0070,
    MQ_ERROR_CANNOT_OPEN_CERT_STORE                     = 0xc00e0070,
    MQ_ERROR_ILLEGAL_ENTERPRISE_OPERATION               = 0xc00e0071,
    MQ_ERROR_CANNOT_GRANT_ADD_GUID                      = 0xc00e0072,
    MQ_ERROR_CANNOT_LOAD_MSMQOCM                        = 0xc00e0073,
    MQ_ERROR_NO_ENTRY_POINT_MSMQOCM                     = 0xc00e0074,
    MQ_ERROR_NO_MSMQ_SERVERS_ON_DC                      = 0xc00e0075,
    MQ_ERROR_CANNOT_JOIN_DOMAIN                         = 0xc00e0076,
    MQ_ERROR_CANNOT_CREATE_ON_GC                        = 0xc00e0077,
    MQ_ERROR_GUID_NOT_MATCHING                          = 0xc00e0078,
    MQ_ERROR_PUBLIC_KEY_NOT_FOUND                       = 0xc00e0079,
    MQ_ERROR_PUBLIC_KEY_DOES_NOT_EXIST                  = 0xc00e007a,
    MQ_ERROR_ILLEGAL_MQPRIVATEPROPS                     = 0xc00e007b,
    MQ_ERROR_NO_GC_IN_DOMAIN                            = 0xc00e007c,
    MQ_ERROR_NO_MSMQ_SERVERS_ON_GC                      = 0xc00e007d,
    MQ_ERROR_CANNOT_GET_DN                              = 0xc00e007e,
    MQ_ERROR_CANNOT_HASH_DATA_EX                        = 0xc00e007f,
    MQ_ERROR_CANNOT_SIGN_DATA_EX                        = 0xc00e0080,
    MQ_ERROR_CANNOT_CREATE_HASH_EX                      = 0xc00e0081,
    MQ_ERROR_FAIL_VERIFY_SIGNATURE_EX                   = 0xc00e0082,
    MQ_ERROR_CANNOT_DELETE_PSC_OBJECTS                  = 0xc00e0083,
    MQ_ERROR_NO_MQUSER_OU                               = 0xc00e0084,
    MQ_ERROR_CANNOT_LOAD_MQAD                           = 0xc00e0085,
    MQ_ERROR_CANNOT_LOAD_MQDSSRV                        = 0xc00e0086,
    MQ_ERROR_PROPERTIES_CONFLICT                        = 0xc00e0087,
    MQ_ERROR_MESSAGE_NOT_FOUND                          = 0xc00e0088,
    MQ_ERROR_CANT_RESOLVE_SITES                         = 0xc00e0089,
    MQ_ERROR_NOT_SUPPORTED_BY_DEPENDENT_CLIENTS         = 0xc00e008a,
    MQ_ERROR_OPERATION_NOT_SUPPORTED_BY_REMOTE_COMPUTER = 0xc00e008b,
    MQ_ERROR_NOT_A_CORRECT_OBJECT_CLASS                 = 0xc00e008c,
    MQ_ERROR_MULTI_SORT_KEYS                            = 0xc00e008d,
    MQ_ERROR_GC_NEEDED                                  = 0xc00e008e,
    MQ_ERROR_DS_BIND_ROOT_FOREST                        = 0xc00e008f,
    MQ_ERROR_DS_LOCAL_USER                              = 0xc00e0090,
    MQ_ERROR_Q_ADS_PROPERTY_NOT_SUPPORTED               = 0xc00e0091,
    MQ_ERROR_BAD_XML_FORMAT                             = 0xc00e0092,
    MQ_ERROR_UNSUPPORTED_CLASS                          = 0xc00e0093,
    MQ_ERROR_UNINITIALIZED_OBJECT                       = 0xc00e0094,
    MQ_ERROR_CANNOT_CREATE_PSC_OBJECTS                  = 0xc00e0095,
    MQ_ERROR_CANNOT_UPDATE_PSC_OBJECTS                  = 0xc00e0096,
}

alias MQWARNING = int;
enum : int
{
    MQ_INFORMATION_PROPERTY                    = 0x400e0001,
    MQ_INFORMATION_ILLEGAL_PROPERTY            = 0x400e0002,
    MQ_INFORMATION_PROPERTY_IGNORED            = 0x400e0003,
    MQ_INFORMATION_UNSUPPORTED_PROPERTY        = 0x400e0004,
    MQ_INFORMATION_DUPLICATE_PROPERTY          = 0x400e0005,
    MQ_INFORMATION_OPERATION_PENDING           = 0x400e0006,
    MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL = 0x400e0009,
    MQ_INFORMATION_INTERNAL_USER_CERT_EXIST    = 0x400e000a,
    MQ_INFORMATION_OWNER_IGNORED               = 0x400e000b,
}

enum IID_IMSMQQuery = GUID(0xd7d6e072, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQQuery : IDispatch
{
    HRESULT LookupQueue(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, IMSMQQueueInfos* ppqinfos);
}
enum IID_IMSMQQueueInfo = GUID(0xd7d6e07b, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQQueueInfo : IDispatch
{
    HRESULT get_QueueGuid(BSTR* pbstrGuidQueue);
    HRESULT get_ServiceTypeGuid(BSTR* pbstrGuidServiceType);
    HRESULT put_ServiceTypeGuid(BSTR bstrGuidServiceType);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_PathName(BSTR* pbstrPathName);
    HRESULT put_PathName(BSTR bstrPathName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT put_FormatName(BSTR bstrFormatName);
    HRESULT get_IsTransactional(short* pisTransactional);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_Quota(int* plQuota);
    HRESULT put_Quota(int lQuota);
    HRESULT get_BasePriority(int* plBasePriority);
    HRESULT put_BasePriority(int lBasePriority);
    HRESULT get_CreateTime(VARIANT* pvarCreateTime);
    HRESULT get_ModifyTime(VARIANT* pvarModifyTime);
    HRESULT get_Authenticate(int* plAuthenticate);
    HRESULT put_Authenticate(int lAuthenticate);
    HRESULT get_JournalQuota(int* plJournalQuota);
    HRESULT put_JournalQuota(int lJournalQuota);
    HRESULT get_IsWorldReadable(short* pisWorldReadable);
    HRESULT Create(VARIANT* IsTransactional, VARIANT* IsWorldReadable);
    HRESULT Delete();
    HRESULT Open(int Access, int ShareMode, IMSMQQueue* ppq);
    HRESULT Refresh();
    HRESULT Update();
}
enum IID_IMSMQQueueInfo2 = GUID(0xfd174a80, 0x89cf, 0x11d2, [0xb0, 0xf2, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfo2 : IDispatch
{
    HRESULT get_QueueGuid(BSTR* pbstrGuidQueue);
    HRESULT get_ServiceTypeGuid(BSTR* pbstrGuidServiceType);
    HRESULT put_ServiceTypeGuid(BSTR bstrGuidServiceType);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_PathName(BSTR* pbstrPathName);
    HRESULT put_PathName(BSTR bstrPathName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT put_FormatName(BSTR bstrFormatName);
    HRESULT get_IsTransactional(short* pisTransactional);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_Quota(int* plQuota);
    HRESULT put_Quota(int lQuota);
    HRESULT get_BasePriority(int* plBasePriority);
    HRESULT put_BasePriority(int lBasePriority);
    HRESULT get_CreateTime(VARIANT* pvarCreateTime);
    HRESULT get_ModifyTime(VARIANT* pvarModifyTime);
    HRESULT get_Authenticate(int* plAuthenticate);
    HRESULT put_Authenticate(int lAuthenticate);
    HRESULT get_JournalQuota(int* plJournalQuota);
    HRESULT put_JournalQuota(int lJournalQuota);
    HRESULT get_IsWorldReadable(short* pisWorldReadable);
    HRESULT Create(VARIANT* IsTransactional, VARIANT* IsWorldReadable);
    HRESULT Delete();
    HRESULT Open(int Access, int ShareMode, IMSMQQueue2* ppq);
    HRESULT Refresh();
    HRESULT Update();
    HRESULT get_PathNameDNS(BSTR* pbstrPathNameDNS);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_Security(VARIANT* pvarSecurity);
    HRESULT put_Security(VARIANT varSecurity);
}
enum IID_IMSMQQueueInfo3 = GUID(0xeba96b1d, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfo3 : IDispatch
{
    HRESULT get_QueueGuid(BSTR* pbstrGuidQueue);
    HRESULT get_ServiceTypeGuid(BSTR* pbstrGuidServiceType);
    HRESULT put_ServiceTypeGuid(BSTR bstrGuidServiceType);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_PathName(BSTR* pbstrPathName);
    HRESULT put_PathName(BSTR bstrPathName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT put_FormatName(BSTR bstrFormatName);
    HRESULT get_IsTransactional(short* pisTransactional);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_Quota(int* plQuota);
    HRESULT put_Quota(int lQuota);
    HRESULT get_BasePriority(int* plBasePriority);
    HRESULT put_BasePriority(int lBasePriority);
    HRESULT get_CreateTime(VARIANT* pvarCreateTime);
    HRESULT get_ModifyTime(VARIANT* pvarModifyTime);
    HRESULT get_Authenticate(int* plAuthenticate);
    HRESULT put_Authenticate(int lAuthenticate);
    HRESULT get_JournalQuota(int* plJournalQuota);
    HRESULT put_JournalQuota(int lJournalQuota);
    HRESULT get_IsWorldReadable(short* pisWorldReadable);
    HRESULT Create(VARIANT* IsTransactional, VARIANT* IsWorldReadable);
    HRESULT Delete();
    HRESULT Open(int Access, int ShareMode, IMSMQQueue3* ppq);
    HRESULT Refresh();
    HRESULT Update();
    HRESULT get_PathNameDNS(BSTR* pbstrPathNameDNS);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_Security(VARIANT* pvarSecurity);
    HRESULT put_Security(VARIANT varSecurity);
    HRESULT get_IsTransactional2(VARIANT_BOOL* pisTransactional);
    HRESULT get_IsWorldReadable2(VARIANT_BOOL* pisWorldReadable);
    HRESULT get_MulticastAddress(BSTR* pbstrMulticastAddress);
    HRESULT put_MulticastAddress(BSTR bstrMulticastAddress);
    HRESULT get_ADsPath(BSTR* pbstrADsPath);
}
enum IID_IMSMQQueueInfo4 = GUID(0xeba96b21, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfo4 : IDispatch
{
    HRESULT get_QueueGuid(BSTR* pbstrGuidQueue);
    HRESULT get_ServiceTypeGuid(BSTR* pbstrGuidServiceType);
    HRESULT put_ServiceTypeGuid(BSTR bstrGuidServiceType);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_PathName(BSTR* pbstrPathName);
    HRESULT put_PathName(BSTR bstrPathName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT put_FormatName(BSTR bstrFormatName);
    HRESULT get_IsTransactional(short* pisTransactional);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_Quota(int* plQuota);
    HRESULT put_Quota(int lQuota);
    HRESULT get_BasePriority(int* plBasePriority);
    HRESULT put_BasePriority(int lBasePriority);
    HRESULT get_CreateTime(VARIANT* pvarCreateTime);
    HRESULT get_ModifyTime(VARIANT* pvarModifyTime);
    HRESULT get_Authenticate(int* plAuthenticate);
    HRESULT put_Authenticate(int lAuthenticate);
    HRESULT get_JournalQuota(int* plJournalQuota);
    HRESULT put_JournalQuota(int lJournalQuota);
    HRESULT get_IsWorldReadable(short* pisWorldReadable);
    HRESULT Create(VARIANT* IsTransactional, VARIANT* IsWorldReadable);
    HRESULT Delete();
    HRESULT Open(int Access, int ShareMode, IMSMQQueue4* ppq);
    HRESULT Refresh();
    HRESULT Update();
    HRESULT get_PathNameDNS(BSTR* pbstrPathNameDNS);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_Security(VARIANT* pvarSecurity);
    HRESULT put_Security(VARIANT varSecurity);
    HRESULT get_IsTransactional2(VARIANT_BOOL* pisTransactional);
    HRESULT get_IsWorldReadable2(VARIANT_BOOL* pisWorldReadable);
    HRESULT get_MulticastAddress(BSTR* pbstrMulticastAddress);
    HRESULT put_MulticastAddress(BSTR bstrMulticastAddress);
    HRESULT get_ADsPath(BSTR* pbstrADsPath);
}
enum IID_IMSMQQueue = GUID(0xd7d6e076, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQQueue : IDispatch
{
    HRESULT get_Access(int* plAccess);
    HRESULT get_ShareMode(int* plShareMode);
    HRESULT get_QueueInfo(IMSMQQueueInfo* ppqinfo);
    HRESULT get_Handle(int* plHandle);
    HRESULT get_IsOpen(short* pisOpen);
    HRESULT Close();
    HRESULT Receive(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Peek(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT EnableNotification(IMSMQEvent Event, VARIANT* Cursor, VARIANT* ReceiveTimeout);
    HRESULT Reset();
    HRESULT ReceiveCurrent(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekNext(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekCurrent(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
}
enum IID_IMSMQQueue2 = GUID(0xef0574e0, 0x6d8, 0x11d3, [0xb1, 0x0, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueue2 : IDispatch
{
    HRESULT get_Access(int* plAccess);
    HRESULT get_ShareMode(int* plShareMode);
    HRESULT get_QueueInfo(IMSMQQueueInfo2* ppqinfo);
    HRESULT get_Handle(int* plHandle);
    HRESULT get_IsOpen(short* pisOpen);
    HRESULT Close();
    HRESULT Receive_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Peek_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT EnableNotification(IMSMQEvent2 Event, VARIANT* Cursor, VARIANT* ReceiveTimeout);
    HRESULT Reset();
    HRESULT ReceiveCurrent_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekNext_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekCurrent_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Receive(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage2* ppmsg);
    HRESULT Peek(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage2* ppmsg);
    HRESULT ReceiveCurrent(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage2* ppmsg);
    HRESULT PeekNext(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage2* ppmsg);
    HRESULT PeekCurrent(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage2* ppmsg);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQQueue3 = GUID(0xeba96b1b, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueue3 : IDispatch
{
    HRESULT get_Access(int* plAccess);
    HRESULT get_ShareMode(int* plShareMode);
    HRESULT get_QueueInfo(IMSMQQueueInfo3* ppqinfo);
    HRESULT get_Handle(int* plHandle);
    HRESULT get_IsOpen(short* pisOpen);
    HRESULT Close();
    HRESULT Receive_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Peek_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT EnableNotification(IMSMQEvent3 Event, VARIANT* Cursor, VARIANT* ReceiveTimeout);
    HRESULT Reset();
    HRESULT ReceiveCurrent_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekNext_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekCurrent_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Receive(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT Peek(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT ReceiveCurrent(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekNext(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekCurrent(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_Handle2(VARIANT* pvarHandle);
    HRESULT ReceiveByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT ReceiveNextByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT ReceivePreviousByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT ReceiveFirstByLookupId(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT ReceiveLastByLookupId(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekNextByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekPreviousByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekFirstByLookupId(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT PeekLastByLookupId(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage3* ppmsg);
    HRESULT Purge();
    HRESULT get_IsOpen2(VARIANT_BOOL* pisOpen);
}
enum IID_IMSMQQueue4 = GUID(0xeba96b20, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueue4 : IDispatch
{
    HRESULT get_Access(int* plAccess);
    HRESULT get_ShareMode(int* plShareMode);
    HRESULT get_QueueInfo(IMSMQQueueInfo4* ppqinfo);
    HRESULT get_Handle(int* plHandle);
    HRESULT get_IsOpen(short* pisOpen);
    HRESULT Close();
    HRESULT Receive_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Peek_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT EnableNotification(IMSMQEvent3 Event, VARIANT* Cursor, VARIANT* ReceiveTimeout);
    HRESULT Reset();
    HRESULT ReceiveCurrent_v1(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekNext_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT PeekCurrent_v1(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, IMSMQMessage* ppmsg);
    HRESULT Receive(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT Peek(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT ReceiveCurrent(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekNext(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekCurrent(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* ReceiveTimeout, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_Handle2(VARIANT* pvarHandle);
    HRESULT ReceiveByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT ReceiveNextByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT ReceivePreviousByLookupId(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT ReceiveFirstByLookupId(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT ReceiveLastByLookupId(VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekNextByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekPreviousByLookupId(VARIANT LookupId, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekFirstByLookupId(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT PeekLastByLookupId(VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
    HRESULT Purge();
    HRESULT get_IsOpen2(VARIANT_BOOL* pisOpen);
    HRESULT ReceiveByLookupIdAllowPeek(VARIANT LookupId, VARIANT* Transaction, VARIANT* WantDestinationQueue, VARIANT* WantBody, VARIANT* WantConnectorType, IMSMQMessage4* ppmsg);
}
enum IID_IMSMQMessage = GUID(0xd7d6e074, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQMessage : IDispatch
{
    HRESULT get_Class(int* plClass);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_AuthLevel(int* plAuthLevel);
    HRESULT put_AuthLevel(int lAuthLevel);
    HRESULT get_IsAuthenticated(short* pisAuthenticated);
    HRESULT get_Delivery(int* plDelivery);
    HRESULT put_Delivery(int lDelivery);
    HRESULT get_Trace(int* plTrace);
    HRESULT put_Trace(int lTrace);
    HRESULT get_Priority(int* plPriority);
    HRESULT put_Priority(int lPriority);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_ResponseQueueInfo(IMSMQQueueInfo* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo(IMSMQQueueInfo pqinfoResponse);
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT put_AppSpecific(int lAppSpecific);
    HRESULT get_SourceMachineGuid(BSTR* pbstrGuidSrcMachine);
    HRESULT get_BodyLength(int* pcbBody);
    HRESULT get_Body(VARIANT* pvarBody);
    HRESULT put_Body(VARIANT varBody);
    HRESULT get_AdminQueueInfo(IMSMQQueueInfo* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo(IMSMQQueueInfo pqinfoAdmin);
    HRESULT get_Id(VARIANT* pvarMsgId);
    HRESULT get_CorrelationId(VARIANT* pvarMsgId);
    HRESULT put_CorrelationId(VARIANT varMsgId);
    HRESULT get_Ack(int* plAck);
    HRESULT put_Ack(int lAck);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_MaxTimeToReachQueue(int* plMaxTimeToReachQueue);
    HRESULT put_MaxTimeToReachQueue(int lMaxTimeToReachQueue);
    HRESULT get_MaxTimeToReceive(int* plMaxTimeToReceive);
    HRESULT put_MaxTimeToReceive(int lMaxTimeToReceive);
    HRESULT get_HashAlgorithm(int* plHashAlg);
    HRESULT put_HashAlgorithm(int lHashAlg);
    HRESULT get_EncryptAlgorithm(int* plEncryptAlg);
    HRESULT put_EncryptAlgorithm(int lEncryptAlg);
    HRESULT get_SentTime(VARIANT* pvarSentTime);
    HRESULT get_ArrivedTime(VARIANT* plArrivedTime);
    HRESULT get_DestinationQueueInfo(IMSMQQueueInfo* ppqinfoDest);
    HRESULT get_SenderCertificate(VARIANT* pvarSenderCert);
    HRESULT put_SenderCertificate(VARIANT varSenderCert);
    HRESULT get_SenderId(VARIANT* pvarSenderId);
    HRESULT get_SenderIdType(int* plSenderIdType);
    HRESULT put_SenderIdType(int lSenderIdType);
    HRESULT Send(IMSMQQueue DestinationQueue, VARIANT* Transaction);
    HRESULT AttachCurrentSecurityContext();
}
enum IID_IMSMQQueueInfos = GUID(0xd7d6e07d, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQQueueInfos : IDispatch
{
    HRESULT Reset();
    HRESULT Next(IMSMQQueueInfo* ppqinfoNext);
}
enum IID_IMSMQQueueInfos2 = GUID(0xeba96b0f, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfos2 : IDispatch
{
    HRESULT Reset();
    HRESULT Next(IMSMQQueueInfo2* ppqinfoNext);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQQueueInfos3 = GUID(0xeba96b1e, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfos3 : IDispatch
{
    HRESULT Reset();
    HRESULT Next(IMSMQQueueInfo3* ppqinfoNext);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQQueueInfos4 = GUID(0xeba96b22, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQueueInfos4 : IDispatch
{
    HRESULT Reset();
    HRESULT Next(IMSMQQueueInfo4* ppqinfoNext);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQEvent = GUID(0xd7d6e077, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQEvent : IDispatch
{
}
enum IID_IMSMQEvent2 = GUID(0xeba96b12, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQEvent2 : IMSMQEvent
{
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQEvent3 = GUID(0xeba96b1c, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQEvent3 : IMSMQEvent2
{
}
enum IID_IMSMQTransaction = GUID(0xd7d6e07f, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQTransaction : IDispatch
{
    HRESULT get_Transaction(int* plTransaction);
    HRESULT Commit(VARIANT* fRetaining, VARIANT* grfTC, VARIANT* grfRM);
    HRESULT Abort(VARIANT* fRetaining, VARIANT* fAsync);
}
enum IID_IMSMQCoordinatedTransactionDispenser = GUID(0xd7d6e081, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQCoordinatedTransactionDispenser : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction* ptransaction);
}
enum IID_IMSMQTransactionDispenser = GUID(0xd7d6e083, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQTransactionDispenser : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction* ptransaction);
}
enum IID_IMSMQQuery2 = GUID(0xeba96b0e, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQuery2 : IDispatch
{
    HRESULT LookupQueue(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, IMSMQQueueInfos2* ppqinfos);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQQuery3 = GUID(0xeba96b19, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQuery3 : IDispatch
{
    HRESULT LookupQueue_v2(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, IMSMQQueueInfos3* ppqinfos);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT LookupQueue(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, VARIANT* MulticastAddress, VARIANT* RelMulticastAddress, IMSMQQueueInfos3* ppqinfos);
}
enum IID_IMSMQQuery4 = GUID(0xeba96b24, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQQuery4 : IDispatch
{
    HRESULT LookupQueue_v2(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, IMSMQQueueInfos4* ppqinfos);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT LookupQueue(VARIANT* QueueGuid, VARIANT* ServiceTypeGuid, VARIANT* Label, VARIANT* CreateTime, VARIANT* ModifyTime, VARIANT* RelServiceType, VARIANT* RelLabel, VARIANT* RelCreateTime, VARIANT* RelModifyTime, VARIANT* MulticastAddress, VARIANT* RelMulticastAddress, IMSMQQueueInfos4* ppqinfos);
}
enum CLSID_MSMQQuery = GUID(0xd7d6e073, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQQuery
{
}
enum IID_IMSMQMessage2 = GUID(0xd9933be0, 0xa567, 0x11d2, [0xb0, 0xf3, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQMessage2 : IDispatch
{
    HRESULT get_Class(int* plClass);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_AuthLevel(int* plAuthLevel);
    HRESULT put_AuthLevel(int lAuthLevel);
    HRESULT get_IsAuthenticated(short* pisAuthenticated);
    HRESULT get_Delivery(int* plDelivery);
    HRESULT put_Delivery(int lDelivery);
    HRESULT get_Trace(int* plTrace);
    HRESULT put_Trace(int lTrace);
    HRESULT get_Priority(int* plPriority);
    HRESULT put_Priority(int lPriority);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_ResponseQueueInfo_v1(IMSMQQueueInfo* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo_v1(IMSMQQueueInfo pqinfoResponse);
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT put_AppSpecific(int lAppSpecific);
    HRESULT get_SourceMachineGuid(BSTR* pbstrGuidSrcMachine);
    HRESULT get_BodyLength(int* pcbBody);
    HRESULT get_Body(VARIANT* pvarBody);
    HRESULT put_Body(VARIANT varBody);
    HRESULT get_AdminQueueInfo_v1(IMSMQQueueInfo* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo_v1(IMSMQQueueInfo pqinfoAdmin);
    HRESULT get_Id(VARIANT* pvarMsgId);
    HRESULT get_CorrelationId(VARIANT* pvarMsgId);
    HRESULT put_CorrelationId(VARIANT varMsgId);
    HRESULT get_Ack(int* plAck);
    HRESULT put_Ack(int lAck);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_MaxTimeToReachQueue(int* plMaxTimeToReachQueue);
    HRESULT put_MaxTimeToReachQueue(int lMaxTimeToReachQueue);
    HRESULT get_MaxTimeToReceive(int* plMaxTimeToReceive);
    HRESULT put_MaxTimeToReceive(int lMaxTimeToReceive);
    HRESULT get_HashAlgorithm(int* plHashAlg);
    HRESULT put_HashAlgorithm(int lHashAlg);
    HRESULT get_EncryptAlgorithm(int* plEncryptAlg);
    HRESULT put_EncryptAlgorithm(int lEncryptAlg);
    HRESULT get_SentTime(VARIANT* pvarSentTime);
    HRESULT get_ArrivedTime(VARIANT* plArrivedTime);
    HRESULT get_DestinationQueueInfo(IMSMQQueueInfo2* ppqinfoDest);
    HRESULT get_SenderCertificate(VARIANT* pvarSenderCert);
    HRESULT put_SenderCertificate(VARIANT varSenderCert);
    HRESULT get_SenderId(VARIANT* pvarSenderId);
    HRESULT get_SenderIdType(int* plSenderIdType);
    HRESULT put_SenderIdType(int lSenderIdType);
    HRESULT Send(IMSMQQueue2 DestinationQueue, VARIANT* Transaction);
    HRESULT AttachCurrentSecurityContext();
    HRESULT get_SenderVersion(int* plSenderVersion);
    HRESULT get_Extension(VARIANT* pvarExtension);
    HRESULT put_Extension(VARIANT varExtension);
    HRESULT get_ConnectorTypeGuid(BSTR* pbstrGuidConnectorType);
    HRESULT put_ConnectorTypeGuid(BSTR bstrGuidConnectorType);
    HRESULT get_TransactionStatusQueueInfo(IMSMQQueueInfo2* ppqinfoXactStatus);
    HRESULT get_DestinationSymmetricKey(VARIANT* pvarDestSymmKey);
    HRESULT put_DestinationSymmetricKey(VARIANT varDestSymmKey);
    HRESULT get_Signature(VARIANT* pvarSignature);
    HRESULT put_Signature(VARIANT varSignature);
    HRESULT get_AuthenticationProviderType(int* plAuthProvType);
    HRESULT put_AuthenticationProviderType(int lAuthProvType);
    HRESULT get_AuthenticationProviderName(BSTR* pbstrAuthProvName);
    HRESULT put_AuthenticationProviderName(BSTR bstrAuthProvName);
    HRESULT put_SenderId(VARIANT varSenderId);
    HRESULT get_MsgClass(int* plMsgClass);
    HRESULT put_MsgClass(int lMsgClass);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_TransactionId(VARIANT* pvarXactId);
    HRESULT get_IsFirstInTransaction(short* pisFirstInXact);
    HRESULT get_IsLastInTransaction(short* pisLastInXact);
    HRESULT get_ResponseQueueInfo(IMSMQQueueInfo2* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo(IMSMQQueueInfo2 pqinfoResponse);
    HRESULT get_AdminQueueInfo(IMSMQQueueInfo2* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo(IMSMQQueueInfo2 pqinfoAdmin);
    HRESULT get_ReceivedAuthenticationLevel(short* psReceivedAuthenticationLevel);
}
enum IID_IMSMQMessage3 = GUID(0xeba96b1a, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQMessage3 : IDispatch
{
    HRESULT get_Class(int* plClass);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_AuthLevel(int* plAuthLevel);
    HRESULT put_AuthLevel(int lAuthLevel);
    HRESULT get_IsAuthenticated(short* pisAuthenticated);
    HRESULT get_Delivery(int* plDelivery);
    HRESULT put_Delivery(int lDelivery);
    HRESULT get_Trace(int* plTrace);
    HRESULT put_Trace(int lTrace);
    HRESULT get_Priority(int* plPriority);
    HRESULT put_Priority(int lPriority);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_ResponseQueueInfo_v1(IMSMQQueueInfo* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo_v1(IMSMQQueueInfo pqinfoResponse);
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT put_AppSpecific(int lAppSpecific);
    HRESULT get_SourceMachineGuid(BSTR* pbstrGuidSrcMachine);
    HRESULT get_BodyLength(int* pcbBody);
    HRESULT get_Body(VARIANT* pvarBody);
    HRESULT put_Body(VARIANT varBody);
    HRESULT get_AdminQueueInfo_v1(IMSMQQueueInfo* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo_v1(IMSMQQueueInfo pqinfoAdmin);
    HRESULT get_Id(VARIANT* pvarMsgId);
    HRESULT get_CorrelationId(VARIANT* pvarMsgId);
    HRESULT put_CorrelationId(VARIANT varMsgId);
    HRESULT get_Ack(int* plAck);
    HRESULT put_Ack(int lAck);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_MaxTimeToReachQueue(int* plMaxTimeToReachQueue);
    HRESULT put_MaxTimeToReachQueue(int lMaxTimeToReachQueue);
    HRESULT get_MaxTimeToReceive(int* plMaxTimeToReceive);
    HRESULT put_MaxTimeToReceive(int lMaxTimeToReceive);
    HRESULT get_HashAlgorithm(int* plHashAlg);
    HRESULT put_HashAlgorithm(int lHashAlg);
    HRESULT get_EncryptAlgorithm(int* plEncryptAlg);
    HRESULT put_EncryptAlgorithm(int lEncryptAlg);
    HRESULT get_SentTime(VARIANT* pvarSentTime);
    HRESULT get_ArrivedTime(VARIANT* plArrivedTime);
    HRESULT get_DestinationQueueInfo(IMSMQQueueInfo3* ppqinfoDest);
    HRESULT get_SenderCertificate(VARIANT* pvarSenderCert);
    HRESULT put_SenderCertificate(VARIANT varSenderCert);
    HRESULT get_SenderId(VARIANT* pvarSenderId);
    HRESULT get_SenderIdType(int* plSenderIdType);
    HRESULT put_SenderIdType(int lSenderIdType);
    HRESULT Send(IDispatch DestinationQueue, VARIANT* Transaction);
    HRESULT AttachCurrentSecurityContext();
    HRESULT get_SenderVersion(int* plSenderVersion);
    HRESULT get_Extension(VARIANT* pvarExtension);
    HRESULT put_Extension(VARIANT varExtension);
    HRESULT get_ConnectorTypeGuid(BSTR* pbstrGuidConnectorType);
    HRESULT put_ConnectorTypeGuid(BSTR bstrGuidConnectorType);
    HRESULT get_TransactionStatusQueueInfo(IMSMQQueueInfo3* ppqinfoXactStatus);
    HRESULT get_DestinationSymmetricKey(VARIANT* pvarDestSymmKey);
    HRESULT put_DestinationSymmetricKey(VARIANT varDestSymmKey);
    HRESULT get_Signature(VARIANT* pvarSignature);
    HRESULT put_Signature(VARIANT varSignature);
    HRESULT get_AuthenticationProviderType(int* plAuthProvType);
    HRESULT put_AuthenticationProviderType(int lAuthProvType);
    HRESULT get_AuthenticationProviderName(BSTR* pbstrAuthProvName);
    HRESULT put_AuthenticationProviderName(BSTR bstrAuthProvName);
    HRESULT put_SenderId(VARIANT varSenderId);
    HRESULT get_MsgClass(int* plMsgClass);
    HRESULT put_MsgClass(int lMsgClass);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_TransactionId(VARIANT* pvarXactId);
    HRESULT get_IsFirstInTransaction(short* pisFirstInXact);
    HRESULT get_IsLastInTransaction(short* pisLastInXact);
    HRESULT get_ResponseQueueInfo_v2(IMSMQQueueInfo2* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo_v2(IMSMQQueueInfo2 pqinfoResponse);
    HRESULT get_AdminQueueInfo_v2(IMSMQQueueInfo2* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo_v2(IMSMQQueueInfo2 pqinfoAdmin);
    HRESULT get_ReceivedAuthenticationLevel(short* psReceivedAuthenticationLevel);
    HRESULT get_ResponseQueueInfo(IMSMQQueueInfo3* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo(IMSMQQueueInfo3 pqinfoResponse);
    HRESULT get_AdminQueueInfo(IMSMQQueueInfo3* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo(IMSMQQueueInfo3 pqinfoAdmin);
    HRESULT get_ResponseDestination(IDispatch* ppdestResponse);
    HRESULT putref_ResponseDestination(IDispatch pdestResponse);
    HRESULT get_Destination(IDispatch* ppdestDestination);
    HRESULT get_LookupId(VARIANT* pvarLookupId);
    HRESULT get_IsAuthenticated2(VARIANT_BOOL* pisAuthenticated);
    HRESULT get_IsFirstInTransaction2(VARIANT_BOOL* pisFirstInXact);
    HRESULT get_IsLastInTransaction2(VARIANT_BOOL* pisLastInXact);
    HRESULT AttachCurrentSecurityContext2();
    HRESULT get_SoapEnvelope(BSTR* pbstrSoapEnvelope);
    HRESULT get_CompoundMessage(VARIANT* pvarCompoundMessage);
    HRESULT put_SoapHeader(BSTR bstrSoapHeader);
    HRESULT put_SoapBody(BSTR bstrSoapBody);
}
enum IID_IMSMQMessage4 = GUID(0xeba96b23, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQMessage4 : IDispatch
{
    HRESULT get_Class(int* plClass);
    HRESULT get_PrivLevel(int* plPrivLevel);
    HRESULT put_PrivLevel(int lPrivLevel);
    HRESULT get_AuthLevel(int* plAuthLevel);
    HRESULT put_AuthLevel(int lAuthLevel);
    HRESULT get_IsAuthenticated(short* pisAuthenticated);
    HRESULT get_Delivery(int* plDelivery);
    HRESULT put_Delivery(int lDelivery);
    HRESULT get_Trace(int* plTrace);
    HRESULT put_Trace(int lTrace);
    HRESULT get_Priority(int* plPriority);
    HRESULT put_Priority(int lPriority);
    HRESULT get_Journal(int* plJournal);
    HRESULT put_Journal(int lJournal);
    HRESULT get_ResponseQueueInfo_v1(IMSMQQueueInfo* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo_v1(IMSMQQueueInfo pqinfoResponse);
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT put_AppSpecific(int lAppSpecific);
    HRESULT get_SourceMachineGuid(BSTR* pbstrGuidSrcMachine);
    HRESULT get_BodyLength(int* pcbBody);
    HRESULT get_Body(VARIANT* pvarBody);
    HRESULT put_Body(VARIANT varBody);
    HRESULT get_AdminQueueInfo_v1(IMSMQQueueInfo* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo_v1(IMSMQQueueInfo pqinfoAdmin);
    HRESULT get_Id(VARIANT* pvarMsgId);
    HRESULT get_CorrelationId(VARIANT* pvarMsgId);
    HRESULT put_CorrelationId(VARIANT varMsgId);
    HRESULT get_Ack(int* plAck);
    HRESULT put_Ack(int lAck);
    HRESULT get_Label(BSTR* pbstrLabel);
    HRESULT put_Label(BSTR bstrLabel);
    HRESULT get_MaxTimeToReachQueue(int* plMaxTimeToReachQueue);
    HRESULT put_MaxTimeToReachQueue(int lMaxTimeToReachQueue);
    HRESULT get_MaxTimeToReceive(int* plMaxTimeToReceive);
    HRESULT put_MaxTimeToReceive(int lMaxTimeToReceive);
    HRESULT get_HashAlgorithm(int* plHashAlg);
    HRESULT put_HashAlgorithm(int lHashAlg);
    HRESULT get_EncryptAlgorithm(int* plEncryptAlg);
    HRESULT put_EncryptAlgorithm(int lEncryptAlg);
    HRESULT get_SentTime(VARIANT* pvarSentTime);
    HRESULT get_ArrivedTime(VARIANT* plArrivedTime);
    HRESULT get_DestinationQueueInfo(IMSMQQueueInfo4* ppqinfoDest);
    HRESULT get_SenderCertificate(VARIANT* pvarSenderCert);
    HRESULT put_SenderCertificate(VARIANT varSenderCert);
    HRESULT get_SenderId(VARIANT* pvarSenderId);
    HRESULT get_SenderIdType(int* plSenderIdType);
    HRESULT put_SenderIdType(int lSenderIdType);
    HRESULT Send(IDispatch DestinationQueue, VARIANT* Transaction);
    HRESULT AttachCurrentSecurityContext();
    HRESULT get_SenderVersion(int* plSenderVersion);
    HRESULT get_Extension(VARIANT* pvarExtension);
    HRESULT put_Extension(VARIANT varExtension);
    HRESULT get_ConnectorTypeGuid(BSTR* pbstrGuidConnectorType);
    HRESULT put_ConnectorTypeGuid(BSTR bstrGuidConnectorType);
    HRESULT get_TransactionStatusQueueInfo(IMSMQQueueInfo4* ppqinfoXactStatus);
    HRESULT get_DestinationSymmetricKey(VARIANT* pvarDestSymmKey);
    HRESULT put_DestinationSymmetricKey(VARIANT varDestSymmKey);
    HRESULT get_Signature(VARIANT* pvarSignature);
    HRESULT put_Signature(VARIANT varSignature);
    HRESULT get_AuthenticationProviderType(int* plAuthProvType);
    HRESULT put_AuthenticationProviderType(int lAuthProvType);
    HRESULT get_AuthenticationProviderName(BSTR* pbstrAuthProvName);
    HRESULT put_AuthenticationProviderName(BSTR bstrAuthProvName);
    HRESULT put_SenderId(VARIANT varSenderId);
    HRESULT get_MsgClass(int* plMsgClass);
    HRESULT put_MsgClass(int lMsgClass);
    HRESULT get_Properties(IDispatch* ppcolProperties);
    HRESULT get_TransactionId(VARIANT* pvarXactId);
    HRESULT get_IsFirstInTransaction(short* pisFirstInXact);
    HRESULT get_IsLastInTransaction(short* pisLastInXact);
    HRESULT get_ResponseQueueInfo_v2(IMSMQQueueInfo2* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo_v2(IMSMQQueueInfo2 pqinfoResponse);
    HRESULT get_AdminQueueInfo_v2(IMSMQQueueInfo2* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo_v2(IMSMQQueueInfo2 pqinfoAdmin);
    HRESULT get_ReceivedAuthenticationLevel(short* psReceivedAuthenticationLevel);
    HRESULT get_ResponseQueueInfo(IMSMQQueueInfo4* ppqinfoResponse);
    HRESULT putref_ResponseQueueInfo(IMSMQQueueInfo4 pqinfoResponse);
    HRESULT get_AdminQueueInfo(IMSMQQueueInfo4* ppqinfoAdmin);
    HRESULT putref_AdminQueueInfo(IMSMQQueueInfo4 pqinfoAdmin);
    HRESULT get_ResponseDestination(IDispatch* ppdestResponse);
    HRESULT putref_ResponseDestination(IDispatch pdestResponse);
    HRESULT get_Destination(IDispatch* ppdestDestination);
    HRESULT get_LookupId(VARIANT* pvarLookupId);
    HRESULT get_IsAuthenticated2(VARIANT_BOOL* pisAuthenticated);
    HRESULT get_IsFirstInTransaction2(VARIANT_BOOL* pisFirstInXact);
    HRESULT get_IsLastInTransaction2(VARIANT_BOOL* pisLastInXact);
    HRESULT AttachCurrentSecurityContext2();
    HRESULT get_SoapEnvelope(BSTR* pbstrSoapEnvelope);
    HRESULT get_CompoundMessage(VARIANT* pvarCompoundMessage);
    HRESULT put_SoapHeader(BSTR bstrSoapHeader);
    HRESULT put_SoapBody(BSTR bstrSoapBody);
}
enum CLSID_MSMQMessage = GUID(0xd7d6e075, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQMessage
{
}
enum CLSID_MSMQQueue = GUID(0xd7d6e079, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQQueue
{
}
enum IID_IMSMQPrivateEvent = GUID(0xd7ab3341, 0xc9d3, 0x11d1, [0xbb, 0x47, 0x0, 0x80, 0xc7, 0xc5, 0xa2, 0xc0]);
interface IMSMQPrivateEvent : IDispatch
{
    HRESULT get_Hwnd(int* phwnd);
    HRESULT FireArrivedEvent(IMSMQQueue pq, int msgcursor);
    HRESULT FireArrivedErrorEvent(IMSMQQueue pq, HRESULT hrStatus, int msgcursor);
}
enum IID__DMSMQEventEvents = GUID(0xd7d6e078, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface _DMSMQEventEvents : IDispatch
{
}
enum CLSID_MSMQEvent = GUID(0xd7d6e07a, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQEvent
{
}
enum CLSID_MSMQQueueInfo = GUID(0xd7d6e07c, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQQueueInfo
{
}
enum CLSID_MSMQQueueInfos = GUID(0xd7d6e07e, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQQueueInfos
{
}
enum IID_IMSMQTransaction2 = GUID(0x2ce0c5b0, 0x6e67, 0x11d2, [0xb0, 0xe6, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQTransaction2 : IMSMQTransaction
{
    HRESULT InitNew(VARIANT varTransaction);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQTransaction3 = GUID(0xeba96b13, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQTransaction3 : IMSMQTransaction2
{
    HRESULT get_ITransaction(VARIANT* pvarITransaction);
}
enum CLSID_MSMQTransaction = GUID(0xd7d6e080, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQTransaction
{
}
enum IID_IMSMQCoordinatedTransactionDispenser2 = GUID(0xeba96b10, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQCoordinatedTransactionDispenser2 : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction2* ptransaction);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQCoordinatedTransactionDispenser3 = GUID(0xeba96b14, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQCoordinatedTransactionDispenser3 : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction3* ptransaction);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum CLSID_MSMQCoordinatedTransactionDispenser = GUID(0xd7d6e082, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQCoordinatedTransactionDispenser
{
}
enum IID_IMSMQTransactionDispenser2 = GUID(0xeba96b11, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQTransactionDispenser2 : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction2* ptransaction);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQTransactionDispenser3 = GUID(0xeba96b15, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQTransactionDispenser3 : IDispatch
{
    HRESULT BeginTransaction(IMSMQTransaction3* ptransaction);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum CLSID_MSMQTransactionDispenser = GUID(0xd7d6e084, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQTransactionDispenser
{
}
enum IID_IMSMQApplication = GUID(0xd7d6e085, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
interface IMSMQApplication : IDispatch
{
    HRESULT MachineIdOfMachineName(BSTR MachineName, BSTR* pbstrGuid);
}
enum IID_IMSMQApplication2 = GUID(0x12a30900, 0x7300, 0x11d2, [0xb0, 0xe6, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQApplication2 : IMSMQApplication
{
    HRESULT RegisterCertificate(VARIANT* Flags, VARIANT* ExternalCertificate);
    HRESULT MachineNameOfMachineId(BSTR bstrGuid, BSTR* pbstrMachineName);
    HRESULT get_MSMQVersionMajor(short* psMSMQVersionMajor);
    HRESULT get_MSMQVersionMinor(short* psMSMQVersionMinor);
    HRESULT get_MSMQVersionBuild(short* psMSMQVersionBuild);
    HRESULT get_IsDsEnabled(VARIANT_BOOL* pfIsDsEnabled);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQApplication3 = GUID(0xeba96b1f, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQApplication3 : IMSMQApplication2
{
    HRESULT get_ActiveQueues(VARIANT* pvActiveQueues);
    HRESULT get_PrivateQueues(VARIANT* pvPrivateQueues);
    HRESULT get_DirectoryServiceServer(BSTR* pbstrDirectoryServiceServer);
    HRESULT get_IsConnected(VARIANT_BOOL* pfIsConnected);
    HRESULT get_BytesInAllQueues(VARIANT* pvBytesInAllQueues);
    HRESULT put_Machine(BSTR bstrMachine);
    HRESULT get_Machine(BSTR* pbstrMachine);
    HRESULT Connect();
    HRESULT Disconnect();
    HRESULT Tidy();
}
enum CLSID_MSMQApplication = GUID(0xd7d6e086, 0xdccd, 0x11d0, [0xaa, 0x4b, 0x0, 0x60, 0x97, 0xd, 0xeb, 0xae]);
struct MSMQApplication
{
}
enum IID_IMSMQDestination = GUID(0xeba96b16, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQDestination : IDispatch
{
    HRESULT Open();
    HRESULT Close();
    HRESULT get_IsOpen(VARIANT_BOOL* pfIsOpen);
    HRESULT get_IADs(IDispatch* ppIADs);
    HRESULT putref_IADs(IDispatch pIADs);
    HRESULT get_ADsPath(BSTR* pbstrADsPath);
    HRESULT put_ADsPath(BSTR bstrADsPath);
    HRESULT get_PathName(BSTR* pbstrPathName);
    HRESULT put_PathName(BSTR bstrPathName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT put_FormatName(BSTR bstrFormatName);
    HRESULT get_Destinations(IDispatch* ppDestinations);
    HRESULT putref_Destinations(IDispatch pDestinations);
    HRESULT get_Properties(IDispatch* ppcolProperties);
}
enum IID_IMSMQPrivateDestination = GUID(0xeba96b17, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
interface IMSMQPrivateDestination : IDispatch
{
    HRESULT get_Handle(VARIANT* pvarHandle);
    HRESULT put_Handle(VARIANT varHandle);
}
enum CLSID_MSMQDestination = GUID(0xeba96b18, 0x2168, 0x11d3, [0x89, 0x8c, 0x0, 0xe0, 0x2c, 0x7, 0x4f, 0x6b]);
struct MSMQDestination
{
}
enum IID_IMSMQCollection = GUID(0x188ac2f, 0xecb3, 0x4173, [0x97, 0x79, 0x63, 0x5c, 0xa2, 0x3, 0x9c, 0x72]);
interface IMSMQCollection : IDispatch
{
    HRESULT Item(VARIANT* Index, VARIANT* pvarRet);
    HRESULT get_Count(int* pCount);
    HRESULT _NewEnum(IUnknown* ppunk);
}
enum CLSID_MSMQCollection = GUID(0xf72b9031, 0x2f0c, 0x43e8, [0x92, 0x4e, 0xe6, 0x5, 0x2c, 0xdc, 0x49, 0x3f]);
struct MSMQCollection
{
}
enum IID_IMSMQManagement = GUID(0xbe5f0241, 0xe489, 0x4957, [0x8c, 0xc4, 0xa4, 0x52, 0xfc, 0xf3, 0xe2, 0x3e]);
interface IMSMQManagement : IDispatch
{
    HRESULT Init(VARIANT* Machine, VARIANT* Pathname, VARIANT* FormatName);
    HRESULT get_FormatName(BSTR* pbstrFormatName);
    HRESULT get_Machine(BSTR* pbstrMachine);
    HRESULT get_MessageCount(int* plMessageCount);
    HRESULT get_ForeignStatus(int* plForeignStatus);
    HRESULT get_QueueType(int* plQueueType);
    HRESULT get_IsLocal(VARIANT_BOOL* pfIsLocal);
    HRESULT get_TransactionalStatus(int* plTransactionalStatus);
    HRESULT get_BytesInQueue(VARIANT* pvBytesInQueue);
}
enum CLSID_MSMQManagement = GUID(0x39ce96fe, 0xf4c5, 0x4484, [0xa1, 0x43, 0x4c, 0x2d, 0x5d, 0x32, 0x42, 0x29]);
struct MSMQManagement
{
}
enum IID_IMSMQOutgoingQueueManagement = GUID(0x64c478fb, 0xf9b0, 0x4695, [0x8a, 0x7f, 0x43, 0x9a, 0xc9, 0x43, 0x26, 0xd3]);
interface IMSMQOutgoingQueueManagement : IMSMQManagement
{
    HRESULT get_State(int* plState);
    HRESULT get_NextHops(VARIANT* pvNextHops);
    HRESULT EodGetSendInfo(IMSMQCollection* ppCollection);
    HRESULT Resume();
    HRESULT Pause();
    HRESULT EodResend();
}
enum CLSID_MSMQOutgoingQueueManagement = GUID(0x188401c, 0x247a, 0x4fed, [0x99, 0xc6, 0xbf, 0x14, 0x11, 0x9d, 0x70, 0x55]);
struct MSMQOutgoingQueueManagement
{
}
enum IID_IMSMQQueueManagement = GUID(0x7fbe7759, 0x5760, 0x444d, [0xb8, 0xa5, 0x5e, 0x7a, 0xb9, 0xa8, 0x4c, 0xce]);
interface IMSMQQueueManagement : IMSMQManagement
{
    HRESULT get_JournalMessageCount(int* plJournalMessageCount);
    HRESULT get_BytesInJournal(VARIANT* pvBytesInJournal);
    HRESULT EodGetReceiveInfo(VARIANT* pvCollection);
}
enum CLSID_MSMQQueueManagement = GUID(0x33b6d07e, 0xf27d, 0x42fa, [0xb2, 0xd7, 0xbf, 0x82, 0xe1, 0x1e, 0x93, 0x74]);
struct MSMQQueueManagement
{
}
struct MQPROPERTYRESTRICTION
{
    uint rel;
    uint prop;
    PROPVARIANT prval;
}
struct MQRESTRICTION
{
    uint cRes;
    MQPROPERTYRESTRICTION* paPropRes;
}
struct MQCOLUMNSET
{
    uint cCol;
    uint* aCol;
}
struct MQSORTKEY
{
    uint propColumn;
    uint dwOrder;
}
struct MQSORTSET
{
    uint cCol;
    MQSORTKEY* aCol;
}
struct MQMSGPROPS
{
    uint cProp;
    uint* aPropID;
    PROPVARIANT* aPropVar;
    HRESULT* aStatus;
}
struct MQQUEUEPROPS
{
    uint cProp;
    uint* aPropID;
    PROPVARIANT* aPropVar;
    HRESULT* aStatus;
}
struct MQQMPROPS
{
    uint cProp;
    uint* aPropID;
    PROPVARIANT* aPropVar;
    HRESULT* aStatus;
}
struct MQPRIVATEPROPS
{
    uint cProp;
    uint* aPropID;
    PROPVARIANT* aPropVar;
    HRESULT* aStatus;
}
struct MQMGMTPROPS
{
    uint cProp;
    uint* aPropID;
    PROPVARIANT* aPropVar;
    HRESULT* aStatus;
}
struct SEQUENCE_INFO
{
    long SeqID;
    uint SeqNo;
    uint PrevNo;
}
alias MQConnectionState = int;
enum : int
{
    MQCONN_NOFAILURE                 = 0x00000000,
    MQCONN_ESTABLISH_PACKET_RECEIVED = 0x00000001,
    MQCONN_READY                     = 0x00000002,
    MQCONN_UNKNOWN_FAILURE           = 0x80000000,
    MQCONN_PING_FAILURE              = 0x80000001,
    MQCONN_CREATE_SOCKET_FAILURE     = 0x80000002,
    MQCONN_BIND_SOCKET_FAILURE       = 0x80000003,
    MQCONN_CONNECT_SOCKET_FAILURE    = 0x80000004,
    MQCONN_TCP_NOT_ENABLED           = 0x80000005,
    MQCONN_SEND_FAILURE              = 0x80000006,
    MQCONN_NOT_READY                 = 0x80000007,
    MQCONN_NAME_RESOLUTION_FAILURE   = 0x80000008,
    MQCONN_INVALID_SERVER_CERT       = 0x80000009,
    MQCONN_LIMIT_REACHED             = 0x8000000a,
    MQCONN_REFUSED_BY_OTHER_SIDE     = 0x8000000b,
    MQCONN_ROUTING_FAILURE           = 0x8000000c,
    MQCONN_OUT_OF_MEMORY             = 0x8000000d,
}

alias PMQRECEIVECALLBACK = void function(HRESULT hrStatus, long hSource, uint dwTimeout, uint dwAction, MQMSGPROPS* pMessageProps, OVERLAPPED* lpOverlapped, HANDLE hCursor);
