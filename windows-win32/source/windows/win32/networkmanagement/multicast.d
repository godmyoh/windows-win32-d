module windows.win32.networkmanagement.multicast;

import windows.win32.foundation : BOOL, UNICODE_STRING;

version (Windows):
extern (Windows):

uint McastApiStartup(uint* Version);
void McastApiCleanup();
uint McastGenUID(MCAST_CLIENT_UID* pRequestID);
uint McastEnumerateScopes(ushort AddrFamily, BOOL ReQuery, MCAST_SCOPE_ENTRY* pScopeList, uint* pScopeLen, uint* pScopeCount);
uint McastRequestAddress(ushort AddrFamily, MCAST_CLIENT_UID* pRequestID, MCAST_SCOPE_CTX* pScopeCtx, MCAST_LEASE_REQUEST* pAddrRequest, MCAST_LEASE_RESPONSE* pAddrResponse);
uint McastRenewAddress(ushort AddrFamily, MCAST_CLIENT_UID* pRequestID, MCAST_LEASE_REQUEST* pRenewRequest, MCAST_LEASE_RESPONSE* pRenewResponse);
uint McastReleaseAddress(ushort AddrFamily, MCAST_CLIENT_UID* pRequestID, MCAST_LEASE_REQUEST* pReleaseRequest);
enum MCAST_CLIENT_ID_LEN = 0x00000011;
enum MCAST_API_CURRENT_VERSION = 0x00000001;
enum MCAST_API_VERSION_0 = 0x00000000;
enum MCAST_API_VERSION_1 = 0x00000001;
union IPNG_ADDRESS
{
    uint IpAddrV4;
    ubyte[16] IpAddrV6;
}
struct MCAST_CLIENT_UID
{
    ubyte* ClientUID;
    uint ClientUIDLength;
}
struct MCAST_SCOPE_CTX
{
    IPNG_ADDRESS ScopeID;
    IPNG_ADDRESS Interface;
    IPNG_ADDRESS ServerID;
}
struct MCAST_SCOPE_ENTRY
{
    MCAST_SCOPE_CTX ScopeCtx;
    IPNG_ADDRESS LastAddr;
    uint TTL;
    UNICODE_STRING ScopeDesc;
}
struct MCAST_LEASE_REQUEST
{
    int LeaseStartTime;
    int MaxLeaseStartTime;
    uint LeaseDuration;
    uint MinLeaseDuration;
    IPNG_ADDRESS ServerAddress;
    ushort MinAddrCount;
    ushort AddrCount;
    ubyte* pAddrBuf;
}
struct MCAST_LEASE_RESPONSE
{
    int LeaseStartTime;
    int LeaseEndTime;
    IPNG_ADDRESS ServerAddress;
    ushort AddrCount;
    ubyte* pAddrBuf;
}
