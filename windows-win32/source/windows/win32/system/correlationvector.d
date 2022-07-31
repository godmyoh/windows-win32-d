module windows.win32.system.correlationvector;

import windows.win32.guid : GUID;
import windows.win32.foundation : CHAR;

version (Windows):
extern (Windows):

uint RtlInitializeCorrelationVector(CORRELATION_VECTOR*, int, const(GUID)*);
uint RtlIncrementCorrelationVector(CORRELATION_VECTOR*);
uint RtlExtendCorrelationVector(CORRELATION_VECTOR*);
uint RtlValidateCorrelationVector(CORRELATION_VECTOR*);
enum RTL_CORRELATION_VECTOR_STRING_LENGTH = 0x00000081;
enum RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH = 0x00000010;
enum RTL_CORRELATION_VECTOR_V1_LENGTH = 0x00000040;
enum RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH = 0x00000016;
enum RTL_CORRELATION_VECTOR_V2_LENGTH = 0x00000080;
struct CORRELATION_VECTOR
{
    CHAR Version;
    CHAR[129] Vector;
}
