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

int SnmpUtilOidCpy(AsnObjectIdentifier* pOidDst, AsnObjectIdentifier* pOidSrc);
int SnmpUtilOidAppend(AsnObjectIdentifier* pOidDst, AsnObjectIdentifier* pOidSrc);
int SnmpUtilOidNCmp(AsnObjectIdentifier* pOid1, AsnObjectIdentifier* pOid2, uint nSubIds);
int SnmpUtilOidCmp(AsnObjectIdentifier* pOid1, AsnObjectIdentifier* pOid2);
void SnmpUtilOidFree(AsnObjectIdentifier* pOid);
int SnmpUtilOctetsCmp(AsnOctetString* pOctets1, AsnOctetString* pOctets2);
int SnmpUtilOctetsNCmp(AsnOctetString* pOctets1, AsnOctetString* pOctets2, uint nChars);
int SnmpUtilOctetsCpy(AsnOctetString* pOctetsDst, AsnOctetString* pOctetsSrc);
void SnmpUtilOctetsFree(AsnOctetString* pOctets);
int SnmpUtilAsnAnyCpy(AsnAny* pAnyDst, AsnAny* pAnySrc);
void SnmpUtilAsnAnyFree(AsnAny* pAny);
int SnmpUtilVarBindCpy(SnmpVarBind* pVbDst, SnmpVarBind* pVbSrc);
void SnmpUtilVarBindFree(SnmpVarBind* pVb);
int SnmpUtilVarBindListCpy(SnmpVarBindList* pVblDst, SnmpVarBindList* pVblSrc);
void SnmpUtilVarBindListFree(SnmpVarBindList* pVbl);
void SnmpUtilMemFree(void* pMem);
void* SnmpUtilMemAlloc(uint nBytes);
void* SnmpUtilMemReAlloc(void* pMem, uint nBytes);
PSTR SnmpUtilOidToA(AsnObjectIdentifier* Oid);
PSTR SnmpUtilIdsToA(uint* Ids, uint IdLength);
void SnmpUtilPrintOid(AsnObjectIdentifier* Oid);
void SnmpUtilPrintAsnAny(AsnAny* pAny);
uint SnmpSvcGetUptime();
void SnmpSvcSetLogLevel(SNMP_LOG nLogLevel);
void SnmpSvcSetLogType(int nLogType);
void SnmpUtilDbgPrint(SNMP_LOG nLogLevel, PSTR szFormat);
void* SnmpMgrOpen(PSTR lpAgentAddress, PSTR lpAgentCommunity, int nTimeOut, int nRetries);
BOOL SnmpMgrCtl(void* session, uint dwCtlCode, void* lpvInBuffer, uint cbInBuffer, void* lpvOUTBuffer, uint cbOUTBuffer, uint* lpcbBytesReturned);
BOOL SnmpMgrClose(void* session);
int SnmpMgrRequest(void* session, ubyte requestType, SnmpVarBindList* variableBindings, SNMP_ERROR_STATUS* errorStatus, int* errorIndex);
BOOL SnmpMgrStrToOid(PSTR string, AsnObjectIdentifier* oid);
BOOL SnmpMgrOidToStr(AsnObjectIdentifier* oid, PSTR* string);
BOOL SnmpMgrTrapListen(HANDLE* phTrapAvailable);
BOOL SnmpMgrGetTrap(AsnObjectIdentifier* enterprise, AsnOctetString* IPAddress, SNMP_GENERICTRAP* genericTrap, int* specificTrap, uint* timeStamp, SnmpVarBindList* variableBindings);
BOOL SnmpMgrGetTrapEx(AsnObjectIdentifier* enterprise, AsnOctetString* agentAddress, AsnOctetString* sourceAddress, SNMP_GENERICTRAP* genericTrap, int* specificTrap, AsnOctetString* community, uint* timeStamp, SnmpVarBindList* variableBindings);
uint SnmpGetTranslateMode(SNMP_API_TRANSLATE_MODE* nTranslateMode);
uint SnmpSetTranslateMode(SNMP_API_TRANSLATE_MODE nTranslateMode);
uint SnmpGetRetransmitMode(SNMP_STATUS* nRetransmitMode);
uint SnmpSetRetransmitMode(SNMP_STATUS nRetransmitMode);
uint SnmpGetTimeout(long hEntity, uint* nPolicyTimeout, uint* nActualTimeout);
uint SnmpSetTimeout(long hEntity, uint nPolicyTimeout);
uint SnmpGetRetry(long hEntity, uint* nPolicyRetry, uint* nActualRetry);
uint SnmpSetRetry(long hEntity, uint nPolicyRetry);
uint SnmpGetVendorInfo(smiVENDORINFO* vendorInfo);
uint SnmpStartup(uint* nMajorVersion, uint* nMinorVersion, uint* nLevel, SNMP_API_TRANSLATE_MODE* nTranslateMode, SNMP_STATUS* nRetransmitMode);
uint SnmpCleanup();
long SnmpOpen(HWND hWnd, uint wMsg);
uint SnmpClose(long session);
uint SnmpSendMsg(long session, long srcEntity, long dstEntity, long context, long PDU);
uint SnmpRecvMsg(long session, long* srcEntity, long* dstEntity, long* context, long* PDU);
uint SnmpRegister(long session, long srcEntity, long dstEntity, long context, smiOID* notification, SNMP_STATUS state);
long SnmpCreateSession(HWND hWnd, uint wMsg, SNMPAPI_CALLBACK fCallBack, void* lpClientData);
uint SnmpListen(long hEntity, SNMP_STATUS lStatus);
uint SnmpListenEx(long hEntity, uint lStatus, uint nUseEntityAddr);
uint SnmpCancelMsg(long session, int reqId);
uint SnmpStartupEx(uint* nMajorVersion, uint* nMinorVersion, uint* nLevel, SNMP_API_TRANSLATE_MODE* nTranslateMode, SNMP_STATUS* nRetransmitMode);
uint SnmpCleanupEx();
long SnmpStrToEntity(long session, const(char)* string);
uint SnmpEntityToStr(long entity, uint size, PSTR string);
uint SnmpFreeEntity(long entity);
long SnmpStrToContext(long session, smiOCTETS* string);
uint SnmpContextToStr(long context, smiOCTETS* string);
uint SnmpFreeContext(long context);
uint SnmpSetPort(long hEntity, uint nPort);
long SnmpCreatePdu(long session, SNMP_PDU_TYPE PDU_type, int request_id, int error_status, int error_index, long varbindlist);
uint SnmpGetPduData(long PDU, SNMP_PDU_TYPE* PDU_type, int* request_id, SNMP_ERROR* error_status, int* error_index, long* varbindlist);
uint SnmpSetPduData(long PDU, const(int)* PDU_type, const(int)* request_id, const(int)* non_repeaters, const(int)* max_repetitions, const(long)* varbindlist);
long SnmpDuplicatePdu(long session, long PDU);
uint SnmpFreePdu(long PDU);
long SnmpCreateVbl(long session, smiOID* name, smiVALUE* value);
long SnmpDuplicateVbl(long session, long vbl);
uint SnmpFreeVbl(long vbl);
uint SnmpCountVbl(long vbl);
uint SnmpGetVb(long vbl, uint index, smiOID* name, smiVALUE* value);
uint SnmpSetVb(long vbl, uint index, smiOID* name, smiVALUE* value);
uint SnmpDeleteVb(long vbl, uint index);
uint SnmpGetLastError(long session);
uint SnmpStrToOid(const(char)* string, smiOID* dstOID);
uint SnmpOidToStr(smiOID* srcOID, uint size, PSTR string);
uint SnmpOidCopy(smiOID* srcOID, smiOID* dstOID);
uint SnmpOidCompare(smiOID* xOID, smiOID* yOID, uint maxlen, int* result);
uint SnmpEncodeMsg(long session, long srcEntity, long dstEntity, long context, long pdu, smiOCTETS* msgBufDesc);
uint SnmpDecodeMsg(long session, long* srcEntity, long* dstEntity, long* context, long* pdu, smiOCTETS* msgBufDesc);
uint SnmpFreeDescriptor(uint syntax, smiOCTETS* descriptor);
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
    union asnValue
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
alias PFNSNMPEXTENSIONINIT = BOOL function(uint dwUpTimeReference, HANDLE* phSubagentTrapEvent, AsnObjectIdentifier* pFirstSupportedRegion);
alias PFNSNMPEXTENSIONINITEX = BOOL function(AsnObjectIdentifier* pNextSupportedRegion);
alias PFNSNMPEXTENSIONMONITOR = BOOL function(void* pAgentMgmtData);
alias PFNSNMPEXTENSIONQUERY = BOOL function(ubyte bPduType, SnmpVarBindList* pVarBindList, int* pErrorStatus, int* pErrorIndex);
alias PFNSNMPEXTENSIONQUERYEX = BOOL function(uint nRequestType, uint nTransactionId, SnmpVarBindList* pVarBindList, AsnOctetString* pContextInfo, int* pErrorStatus, int* pErrorIndex);
alias PFNSNMPEXTENSIONTRAP = BOOL function(AsnObjectIdentifier* pEnterpriseOid, int* pGenericTrapId, int* pSpecificTrapId, uint* pTimeStamp, SnmpVarBindList* pVarBindList);
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
    union value
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
alias SNMPAPI_CALLBACK = uint function(long hSession, HWND hWnd, uint wMsg, WPARAM wParam, LPARAM lParam, void* lpClientData);
alias PFNSNMPSTARTUPEX = uint function(uint* param0, uint* param1, uint* param2, uint* param3, uint* param4);
alias PFNSNMPCLEANUPEX = uint function();
