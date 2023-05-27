module windows.win32.networkmanagement.snmp;

import windows.win32.foundation : BOOL, CHAR, HANDLE, HWND, LPARAM, PSTR, WPARAM;

version (Windows):
extern (Windows):

alias SNMP_PDU_TYPE = uint;
enum : uint
{
    SNMP_PDU_GET      = 0x000000a0,
    SNMP_PDU_GETNEXT  = 0x000000a1,
    SNMP_PDU_RESPONSE = 0x000000a2,
    SNMP_PDU_SET      = 0x000000a3,
    SNMP_PDU_GETBULK  = 0x000000a5,
    SNMP_PDU_TRAP     = 0x000000a7,
}

alias SNMP_EXTENSION_REQUEST_TYPE = uint;
enum : uint
{
    SNMP_EXTENSION_GET         = 0x000000a0,
    SNMP_EXTENSION_GET_NEXT    = 0x000000a1,
    SNMP_EXTENSION_SET_TEST    = 0x000000e0,
    SNMP_EXTENSION_SET_COMMIT  = 0x000000a3,
    SNMP_EXTENSION_SET_UNDO    = 0x000000e1,
    SNMP_EXTENSION_SET_CLEANUP = 0x000000e2,
}

alias SNMP_API_TRANSLATE_MODE = uint;
enum : uint
{
    SNMPAPI_TRANSLATED      = 0x00000000,
    SNMPAPI_UNTRANSLATED_V1 = 0x00000001,
    SNMPAPI_UNTRANSLATED_V2 = 0x00000002,
}

alias SNMP_GENERICTRAP = uint;
enum : uint
{
    SNMP_GENERICTRAP_COLDSTART     = 0x00000000,
    SNMP_GENERICTRAP_WARMSTART     = 0x00000001,
    SNMP_GENERICTRAP_LINKDOWN      = 0x00000002,
    SNMP_GENERICTRAP_LINKUP        = 0x00000003,
    SNMP_GENERICTRAP_AUTHFAILURE   = 0x00000004,
    SNMP_GENERICTRAP_EGPNEIGHLOSS  = 0x00000005,
    SNMP_GENERICTRAP_ENTERSPECIFIC = 0x00000006,
}

alias SNMP_ERROR_STATUS = uint;
enum : uint
{
    SNMP_ERRORSTATUS_NOERROR             = 0x00000000,
    SNMP_ERRORSTATUS_TOOBIG              = 0x00000001,
    SNMP_ERRORSTATUS_NOSUCHNAME          = 0x00000002,
    SNMP_ERRORSTATUS_BADVALUE            = 0x00000003,
    SNMP_ERRORSTATUS_READONLY            = 0x00000004,
    SNMP_ERRORSTATUS_GENERR              = 0x00000005,
    SNMP_ERRORSTATUS_NOACCESS            = 0x00000006,
    SNMP_ERRORSTATUS_WRONGTYPE           = 0x00000007,
    SNMP_ERRORSTATUS_WRONGLENGTH         = 0x00000008,
    SNMP_ERRORSTATUS_WRONGENCODING       = 0x00000009,
    SNMP_ERRORSTATUS_WRONGVALUE          = 0x0000000a,
    SNMP_ERRORSTATUS_NOCREATION          = 0x0000000b,
    SNMP_ERRORSTATUS_INCONSISTENTVALUE   = 0x0000000c,
    SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE = 0x0000000d,
    SNMP_ERRORSTATUS_COMMITFAILED        = 0x0000000e,
    SNMP_ERRORSTATUS_UNDOFAILED          = 0x0000000f,
    SNMP_ERRORSTATUS_AUTHORIZATIONERROR  = 0x00000010,
    SNMP_ERRORSTATUS_NOTWRITABLE         = 0x00000011,
    SNMP_ERRORSTATUS_INCONSISTENTNAME    = 0x00000012,
}

alias SNMP_STATUS = uint;
enum : uint
{
    SNMPAPI_ON  = 0x00000001,
    SNMPAPI_OFF = 0x00000000,
}

alias SNMP_OUTPUT_LOG_TYPE = uint;
enum : uint
{
    SNMP_OUTPUT_TO_CONSOLE  = 0x00000001,
    SNMP_OUTPUT_TO_LOGFILE  = 0x00000002,
    SNMP_OUTPUT_TO_DEBUGGER = 0x00000008,
}

alias SNMP_LOG = int;
enum : int
{
    SNMP_LOG_SILENT  = 0x00000000,
    SNMP_LOG_FATAL   = 0x00000001,
    SNMP_LOG_ERROR   = 0x00000002,
    SNMP_LOG_WARNING = 0x00000003,
    SNMP_LOG_TRACE   = 0x00000004,
    SNMP_LOG_VERBOSE = 0x00000005,
}

alias SNMP_ERROR = uint;
enum : uint
{
    SNMP_ERROR_NOERROR             = 0x00000000,
    SNMP_ERROR_TOOBIG              = 0x00000001,
    SNMP_ERROR_NOSUCHNAME          = 0x00000002,
    SNMP_ERROR_BADVALUE            = 0x00000003,
    SNMP_ERROR_READONLY            = 0x00000004,
    SNMP_ERROR_GENERR              = 0x00000005,
    SNMP_ERROR_NOACCESS            = 0x00000006,
    SNMP_ERROR_WRONGTYPE           = 0x00000007,
    SNMP_ERROR_WRONGLENGTH         = 0x00000008,
    SNMP_ERROR_WRONGENCODING       = 0x00000009,
    SNMP_ERROR_WRONGVALUE          = 0x0000000a,
    SNMP_ERROR_NOCREATION          = 0x0000000b,
    SNMP_ERROR_INCONSISTENTVALUE   = 0x0000000c,
    SNMP_ERROR_RESOURCEUNAVAILABLE = 0x0000000d,
    SNMP_ERROR_COMMITFAILED        = 0x0000000e,
    SNMP_ERROR_UNDOFAILED          = 0x0000000f,
    SNMP_ERROR_AUTHORIZATIONERROR  = 0x00000010,
    SNMP_ERROR_NOTWRITABLE         = 0x00000011,
    SNMP_ERROR_INCONSISTENTNAME    = 0x00000012,
}

int SnmpUtilOidCpy(AsnObjectIdentifier*, AsnObjectIdentifier*);
int SnmpUtilOidAppend(AsnObjectIdentifier*, AsnObjectIdentifier*);
int SnmpUtilOidNCmp(AsnObjectIdentifier*, AsnObjectIdentifier*, uint);
int SnmpUtilOidCmp(AsnObjectIdentifier*, AsnObjectIdentifier*);
void SnmpUtilOidFree(AsnObjectIdentifier*);
int SnmpUtilOctetsCmp(AsnOctetString*, AsnOctetString*);
int SnmpUtilOctetsNCmp(AsnOctetString*, AsnOctetString*, uint);
int SnmpUtilOctetsCpy(AsnOctetString*, AsnOctetString*);
void SnmpUtilOctetsFree(AsnOctetString*);
int SnmpUtilAsnAnyCpy(AsnAny*, AsnAny*);
void SnmpUtilAsnAnyFree(AsnAny*);
int SnmpUtilVarBindCpy(SnmpVarBind*, SnmpVarBind*);
void SnmpUtilVarBindFree(SnmpVarBind*);
int SnmpUtilVarBindListCpy(SnmpVarBindList*, SnmpVarBindList*);
void SnmpUtilVarBindListFree(SnmpVarBindList*);
void SnmpUtilMemFree(void*);
void* SnmpUtilMemAlloc(uint);
void* SnmpUtilMemReAlloc(void*, uint);
PSTR SnmpUtilOidToA(AsnObjectIdentifier*);
PSTR SnmpUtilIdsToA(uint*, uint);
void SnmpUtilPrintOid(AsnObjectIdentifier*);
void SnmpUtilPrintAsnAny(AsnAny*);
uint SnmpSvcGetUptime();
void SnmpSvcSetLogLevel(SNMP_LOG);
void SnmpSvcSetLogType(int);
void SnmpUtilDbgPrint(SNMP_LOG, PSTR);
void* SnmpMgrOpen(PSTR, PSTR, int, int);
BOOL SnmpMgrCtl(void*, uint, void*, uint, void*, uint, uint*);
BOOL SnmpMgrClose(void*);
int SnmpMgrRequest(void*, ubyte, SnmpVarBindList*, SNMP_ERROR_STATUS*, int*);
BOOL SnmpMgrStrToOid(PSTR, AsnObjectIdentifier*);
BOOL SnmpMgrOidToStr(AsnObjectIdentifier*, PSTR*);
BOOL SnmpMgrTrapListen(HANDLE*);
BOOL SnmpMgrGetTrap(AsnObjectIdentifier*, AsnOctetString*, SNMP_GENERICTRAP*, int*, uint*, SnmpVarBindList*);
BOOL SnmpMgrGetTrapEx(AsnObjectIdentifier*, AsnOctetString*, AsnOctetString*, SNMP_GENERICTRAP*, int*, AsnOctetString*, uint*, SnmpVarBindList*);
uint SnmpGetTranslateMode(SNMP_API_TRANSLATE_MODE*);
uint SnmpSetTranslateMode(SNMP_API_TRANSLATE_MODE);
uint SnmpGetRetransmitMode(SNMP_STATUS*);
uint SnmpSetRetransmitMode(SNMP_STATUS);
uint SnmpGetTimeout(long, uint*, uint*);
uint SnmpSetTimeout(long, uint);
uint SnmpGetRetry(long, uint*, uint*);
uint SnmpSetRetry(long, uint);
uint SnmpGetVendorInfo(smiVENDORINFO*);
uint SnmpStartup(uint*, uint*, uint*, SNMP_API_TRANSLATE_MODE*, SNMP_STATUS*);
uint SnmpCleanup();
long SnmpOpen(HWND, uint);
uint SnmpClose(long);
uint SnmpSendMsg(long, long, long, long, long);
uint SnmpRecvMsg(long, long*, long*, long*, long*);
uint SnmpRegister(long, long, long, long, smiOID*, SNMP_STATUS);
long SnmpCreateSession(HWND, uint, SNMPAPI_CALLBACK, void*);
uint SnmpListen(long, SNMP_STATUS);
uint SnmpListenEx(long, uint, uint);
uint SnmpCancelMsg(long, int);
uint SnmpStartupEx(uint*, uint*, uint*, SNMP_API_TRANSLATE_MODE*, SNMP_STATUS*);
uint SnmpCleanupEx();
long SnmpStrToEntity(long, const(char)*);
uint SnmpEntityToStr(long, uint, PSTR);
uint SnmpFreeEntity(long);
long SnmpStrToContext(long, smiOCTETS*);
uint SnmpContextToStr(long, smiOCTETS*);
uint SnmpFreeContext(long);
uint SnmpSetPort(long, uint);
long SnmpCreatePdu(long, SNMP_PDU_TYPE, int, int, int, long);
uint SnmpGetPduData(long, SNMP_PDU_TYPE*, int*, SNMP_ERROR*, int*, long*);
uint SnmpSetPduData(long, const(int)*, const(int)*, const(int)*, const(int)*, const(long)*);
long SnmpDuplicatePdu(long, long);
uint SnmpFreePdu(long);
long SnmpCreateVbl(long, smiOID*, smiVALUE*);
long SnmpDuplicateVbl(long, long);
uint SnmpFreeVbl(long);
uint SnmpCountVbl(long);
uint SnmpGetVb(long, uint, smiOID*, smiVALUE*);
uint SnmpSetVb(long, uint, smiOID*, smiVALUE*);
uint SnmpDeleteVb(long, uint);
uint SnmpGetLastError(long);
uint SnmpStrToOid(const(char)*, smiOID*);
uint SnmpOidToStr(smiOID*, uint, PSTR);
uint SnmpOidCopy(smiOID*, smiOID*);
uint SnmpOidCompare(smiOID*, smiOID*, uint, int*);
uint SnmpEncodeMsg(long, long, long, long, long, smiOCTETS*);
uint SnmpDecodeMsg(long, long*, long*, long*, long*, smiOCTETS*);
uint SnmpFreeDescriptor(uint, smiOCTETS*);
enum ASN_UNIVERSAL = 0x00000000;
enum ASN_APPLICATION = 0x00000040;
enum ASN_CONTEXT = 0x00000080;
enum ASN_PRIVATE = 0x000000c0;
enum ASN_PRIMITIVE = 0x00000000;
enum ASN_CONSTRUCTOR = 0x00000020;
enum SNMP_ACCESS_NONE = 0x00000000;
enum SNMP_ACCESS_NOTIFY = 0x00000001;
enum SNMP_ACCESS_READ_ONLY = 0x00000002;
enum SNMP_ACCESS_READ_WRITE = 0x00000003;
enum SNMP_ACCESS_READ_CREATE = 0x00000004;
enum SNMPAPI_NOERROR = 0x00000001;
enum SNMPAPI_ERROR = 0x00000000;
enum SNMP_OUTPUT_TO_EVENTLOG = 0x00000004;
enum DEFAULT_SNMP_PORT_UDP = 0x000000a1;
enum DEFAULT_SNMP_PORT_IPX = 0x0000900f;
enum DEFAULT_SNMPTRAP_PORT_UDP = 0x000000a2;
enum DEFAULT_SNMPTRAP_PORT_IPX = 0x00009010;
enum SNMP_MAX_OID_LEN = 0x00000080;
enum SNMP_MEM_ALLOC_ERROR = 0x00000001;
enum SNMP_BERAPI_INVALID_LENGTH = 0x0000000a;
enum SNMP_BERAPI_INVALID_TAG = 0x0000000b;
enum SNMP_BERAPI_OVERFLOW = 0x0000000c;
enum SNMP_BERAPI_SHORT_BUFFER = 0x0000000d;
enum SNMP_BERAPI_INVALID_OBJELEM = 0x0000000e;
enum SNMP_PDUAPI_UNRECOGNIZED_PDU = 0x00000014;
enum SNMP_PDUAPI_INVALID_ES = 0x00000015;
enum SNMP_PDUAPI_INVALID_GT = 0x00000016;
enum SNMP_AUTHAPI_INVALID_VERSION = 0x0000001e;
enum SNMP_AUTHAPI_INVALID_MSG_TYPE = 0x0000001f;
enum SNMP_AUTHAPI_TRIV_AUTH_FAILED = 0x00000020;
enum ASN_CONTEXTSPECIFIC = 0x00000080;
enum ASN_PRIMATIVE = 0x00000000;
enum SNMP_MGMTAPI_TIMEOUT = 0x00000028;
enum SNMP_MGMTAPI_SELECT_FDERRORS = 0x00000029;
enum SNMP_MGMTAPI_TRAP_ERRORS = 0x0000002a;
enum SNMP_MGMTAPI_TRAP_DUPINIT = 0x0000002b;
enum SNMP_MGMTAPI_NOTRAPS = 0x0000002c;
enum SNMP_MGMTAPI_AGAIN = 0x0000002d;
enum SNMP_MGMTAPI_INVALID_CTL = 0x0000002e;
enum SNMP_MGMTAPI_INVALID_SESSION = 0x0000002f;
enum SNMP_MGMTAPI_INVALID_BUFFER = 0x00000030;
enum MGMCTL_SETAGENTPORT = 0x00000001;
enum MAXOBJIDSIZE = 0x00000080;
enum MAXOBJIDSTRSIZE = 0x00000580;
enum SNMPLISTEN_USEENTITY_ADDR = 0x00000000;
enum SNMPLISTEN_ALL_ADDR = 0x00000001;
enum SNMP_TRAP_COLDSTART = 0x00000000;
enum SNMP_TRAP_WARMSTART = 0x00000001;
enum SNMP_TRAP_LINKDOWN = 0x00000002;
enum SNMP_TRAP_LINKUP = 0x00000003;
enum SNMP_TRAP_AUTHFAIL = 0x00000004;
enum SNMP_TRAP_EGPNEIGHBORLOSS = 0x00000005;
enum SNMP_TRAP_ENTERPRISESPECIFIC = 0x00000006;
enum SNMPAPI_NO_SUPPORT = 0x00000000;
enum SNMPAPI_V1_SUPPORT = 0x00000001;
enum SNMPAPI_V2_SUPPORT = 0x00000002;
enum SNMPAPI_M2M_SUPPORT = 0x00000003;
enum SNMPAPI_FAILURE = 0x00000000;
enum SNMPAPI_SUCCESS = 0x00000001;
enum SNMPAPI_ALLOC_ERROR = 0x00000002;
enum SNMPAPI_CONTEXT_INVALID = 0x00000003;
enum SNMPAPI_CONTEXT_UNKNOWN = 0x00000004;
enum SNMPAPI_ENTITY_INVALID = 0x00000005;
enum SNMPAPI_ENTITY_UNKNOWN = 0x00000006;
enum SNMPAPI_INDEX_INVALID = 0x00000007;
enum SNMPAPI_NOOP = 0x00000008;
enum SNMPAPI_OID_INVALID = 0x00000009;
enum SNMPAPI_OPERATION_INVALID = 0x0000000a;
enum SNMPAPI_OUTPUT_TRUNCATED = 0x0000000b;
enum SNMPAPI_PDU_INVALID = 0x0000000c;
enum SNMPAPI_SESSION_INVALID = 0x0000000d;
enum SNMPAPI_SYNTAX_INVALID = 0x0000000e;
enum SNMPAPI_VBL_INVALID = 0x0000000f;
enum SNMPAPI_MODE_INVALID = 0x00000010;
enum SNMPAPI_SIZE_INVALID = 0x00000011;
enum SNMPAPI_NOT_INITIALIZED = 0x00000012;
enum SNMPAPI_MESSAGE_INVALID = 0x00000013;
enum SNMPAPI_HWND_INVALID = 0x00000014;
enum SNMPAPI_OTHER_ERROR = 0x00000063;
enum SNMPAPI_TL_NOT_INITIALIZED = 0x00000064;
enum SNMPAPI_TL_NOT_SUPPORTED = 0x00000065;
enum SNMPAPI_TL_NOT_AVAILABLE = 0x00000066;
enum SNMPAPI_TL_RESOURCE_ERROR = 0x00000067;
enum SNMPAPI_TL_UNDELIVERABLE = 0x00000068;
enum SNMPAPI_TL_SRC_INVALID = 0x00000069;
enum SNMPAPI_TL_INVALID_PARAM = 0x0000006a;
enum SNMPAPI_TL_IN_USE = 0x0000006b;
enum SNMPAPI_TL_TIMEOUT = 0x0000006c;
enum SNMPAPI_TL_PDU_TOO_BIG = 0x0000006d;
enum SNMPAPI_TL_OTHER = 0x000000c7;
enum MAXVENDORINFO = 0x00000020;
struct AsnOctetString
{
    align (4):
    ubyte* stream;
    uint length;
    BOOL dynamic;
}
struct AsnObjectIdentifier
{
    align (4):
    uint idLength;
    uint* ids;
}
struct SnmpVarBindList
{
    align (4):
    SnmpVarBind* list;
    uint len;
}
/+ [CONFLICTED] struct AsnOctetString
{
    ubyte* stream;
    uint length;
    BOOL dynamic;
}
+/
/+ [CONFLICTED] struct AsnObjectIdentifier
{
    uint idLength;
    uint* ids;
}
+/
struct AsnAny
{
    align (4):
    ubyte asnType;
    union _asnValue_e__Union
    {
        align (4):
        int number;
        uint unsigned32;
        ulong counter64;
        AsnOctetString string;
        AsnOctetString bits;
        AsnObjectIdentifier object;
        AsnOctetString sequence;
        AsnOctetString address;
        uint counter;
        uint gauge;
        uint ticks;
        AsnOctetString arbitrary;
    }
}
struct SnmpVarBind
{
    align (4):
    AsnObjectIdentifier name;
    AsnAny value;
}
/+ [CONFLICTED] struct SnmpVarBindList
{
    SnmpVarBind* list;
    uint len;
}
+/
alias PFNSNMPEXTENSIONINIT = BOOL function(uint, HANDLE*, AsnObjectIdentifier*);
alias PFNSNMPEXTENSIONINITEX = BOOL function(AsnObjectIdentifier*);
alias PFNSNMPEXTENSIONMONITOR = BOOL function(void*);
alias PFNSNMPEXTENSIONQUERY = BOOL function(ubyte, SnmpVarBindList*, int*, int*);
alias PFNSNMPEXTENSIONQUERYEX = BOOL function(uint, uint, SnmpVarBindList*, AsnOctetString*, int*, int*);
alias PFNSNMPEXTENSIONTRAP = BOOL function(AsnObjectIdentifier*, int*, int*, uint*, SnmpVarBindList*);
alias PFNSNMPEXTENSIONCLOSE = void function();
struct smiOCTETS
{
    uint len;
    ubyte* ptr;
}
struct smiOID
{
    uint len;
    uint* ptr;
}
struct smiCNTR64
{
    uint hipart;
    uint lopart;
}
struct smiVALUE
{
    uint syntax;
    union _value_e__Union
    {
        int sNumber;
        uint uNumber;
        smiCNTR64 hNumber;
        smiOCTETS string;
        smiOID oid;
        ubyte empty;
    }
}
struct smiVENDORINFO
{
    CHAR[64] vendorName;
    CHAR[64] vendorContact;
    CHAR[32] vendorVersionId;
    CHAR[32] vendorVersionDate;
    uint vendorEnterprise;
}
alias SNMPAPI_CALLBACK = uint function(long, HWND, uint, WPARAM, LPARAM, void*);
alias PFNSNMPSTARTUPEX = uint function(uint*, uint*, uint*, uint*, uint*);
alias PFNSNMPCLEANUPEX = uint function();
