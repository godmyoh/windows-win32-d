module windows.win32.networking.websocket;

import windows.win32.foundation : HRESULT, PSTR;

version (Windows):
extern (Windows):

HRESULT WebSocketCreateClientHandle(const(WEB_SOCKET_PROPERTY)* pProperties, uint ulPropertyCount, WEB_SOCKET_HANDLE* phWebSocket);
HRESULT WebSocketBeginClientHandshake(WEB_SOCKET_HANDLE hWebSocket, const(char)** pszSubprotocols, uint ulSubprotocolCount, const(char)** pszExtensions, uint ulExtensionCount, const(WEB_SOCKET_HTTP_HEADER)* pInitialHeaders, uint ulInitialHeaderCount, WEB_SOCKET_HTTP_HEADER** pAdditionalHeaders, uint* pulAdditionalHeaderCount);
HRESULT WebSocketEndClientHandshake(WEB_SOCKET_HANDLE hWebSocket, const(WEB_SOCKET_HTTP_HEADER)* pResponseHeaders, uint ulReponseHeaderCount, uint* pulSelectedExtensions, uint* pulSelectedExtensionCount, uint* pulSelectedSubprotocol);
HRESULT WebSocketCreateServerHandle(const(WEB_SOCKET_PROPERTY)* pProperties, uint ulPropertyCount, WEB_SOCKET_HANDLE* phWebSocket);
HRESULT WebSocketBeginServerHandshake(WEB_SOCKET_HANDLE hWebSocket, const(char)* pszSubprotocolSelected, const(char)** pszExtensionSelected, uint ulExtensionSelectedCount, const(WEB_SOCKET_HTTP_HEADER)* pRequestHeaders, uint ulRequestHeaderCount, WEB_SOCKET_HTTP_HEADER** pResponseHeaders, uint* pulResponseHeaderCount);
HRESULT WebSocketEndServerHandshake(WEB_SOCKET_HANDLE hWebSocket);
HRESULT WebSocketSend(WEB_SOCKET_HANDLE hWebSocket, WEB_SOCKET_BUFFER_TYPE BufferType, WEB_SOCKET_BUFFER* pBuffer, void* Context);
HRESULT WebSocketReceive(WEB_SOCKET_HANDLE hWebSocket, WEB_SOCKET_BUFFER* pBuffer, void* pvContext);
HRESULT WebSocketGetAction(WEB_SOCKET_HANDLE hWebSocket, WEB_SOCKET_ACTION_QUEUE eActionQueue, WEB_SOCKET_BUFFER* pDataBuffers, uint* pulDataBufferCount, WEB_SOCKET_ACTION* pAction, WEB_SOCKET_BUFFER_TYPE* pBufferType, void** pvApplicationContext, void** pvActionContext);
void WebSocketCompleteAction(WEB_SOCKET_HANDLE hWebSocket, void* pvActionContext, uint ulBytesTransferred);
void WebSocketAbortHandle(WEB_SOCKET_HANDLE hWebSocket);
void WebSocketDeleteHandle(WEB_SOCKET_HANDLE hWebSocket);
HRESULT WebSocketGetGlobalProperty(WEB_SOCKET_PROPERTY_TYPE eType, void* pvValue, uint* ulSize);
enum WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 0x0000007b;
alias WEB_SOCKET_HANDLE = void*;
alias WEB_SOCKET_CLOSE_STATUS = int;
enum : int
{
    WEB_SOCKET_SUCCESS_CLOSE_STATUS                = 0x000003e8,
    WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS   = 0x000003e9,
    WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS         = 0x000003ea,
    WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS      = 0x000003eb,
    WEB_SOCKET_EMPTY_CLOSE_STATUS                  = 0x000003ed,
    WEB_SOCKET_ABORTED_CLOSE_STATUS                = 0x000003ee,
    WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS        = 0x000003ef,
    WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS       = 0x000003f0,
    WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS        = 0x000003f1,
    WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 0x000003f2,
    WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS           = 0x000003f3,
    WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 0x000003f7,
}

alias WEB_SOCKET_PROPERTY_TYPE = int;
enum : int
{
    WEB_SOCKET_RECEIVE_BUFFER_SIZE_PROPERTY_TYPE       = 0x00000000,
    WEB_SOCKET_SEND_BUFFER_SIZE_PROPERTY_TYPE          = 0x00000001,
    WEB_SOCKET_DISABLE_MASKING_PROPERTY_TYPE           = 0x00000002,
    WEB_SOCKET_ALLOCATED_BUFFER_PROPERTY_TYPE          = 0x00000003,
    WEB_SOCKET_DISABLE_UTF8_VERIFICATION_PROPERTY_TYPE = 0x00000004,
    WEB_SOCKET_KEEPALIVE_INTERVAL_PROPERTY_TYPE        = 0x00000005,
    WEB_SOCKET_SUPPORTED_VERSIONS_PROPERTY_TYPE        = 0x00000006,
}

alias WEB_SOCKET_ACTION_QUEUE = int;
enum : int
{
    WEB_SOCKET_SEND_ACTION_QUEUE    = 0x00000001,
    WEB_SOCKET_RECEIVE_ACTION_QUEUE = 0x00000002,
    WEB_SOCKET_ALL_ACTION_QUEUE     = 0x00000003,
}

alias WEB_SOCKET_BUFFER_TYPE = int;
enum : int
{
    WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE     = 0x80000000,
    WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE    = 0x80000001,
    WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE   = 0x80000002,
    WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE  = 0x80000003,
    WEB_SOCKET_CLOSE_BUFFER_TYPE            = 0x80000004,
    WEB_SOCKET_PING_PONG_BUFFER_TYPE        = 0x80000005,
    WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE = 0x80000006,
}

alias WEB_SOCKET_ACTION = int;
enum : int
{
    WEB_SOCKET_NO_ACTION                        = 0x00000000,
    WEB_SOCKET_SEND_TO_NETWORK_ACTION           = 0x00000001,
    WEB_SOCKET_INDICATE_SEND_COMPLETE_ACTION    = 0x00000002,
    WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION      = 0x00000003,
    WEB_SOCKET_INDICATE_RECEIVE_COMPLETE_ACTION = 0x00000004,
}

struct WEB_SOCKET_PROPERTY
{
    WEB_SOCKET_PROPERTY_TYPE Type;
    void* pvValue;
    uint ulValueSize;
}
struct WEB_SOCKET_HTTP_HEADER
{
    PSTR pcName;
    uint ulNameLength;
    PSTR pcValue;
    uint ulValueLength;
}
union WEB_SOCKET_BUFFER
{
    struct Data
    {
        ubyte* pbBuffer;
        uint ulBufferLength;
    }
    struct CloseStatus
    {
        ubyte* pbReason;
        uint ulReasonLength;
        ushort usStatus;
    }
}
