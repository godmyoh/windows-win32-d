module windows.win32.networkmanagement.multicast;

import windows.win32.foundation : BOOL, UNICODE_STRING;

version (Windows):
extern (Windows):

uint McastApiStartup(uint*);
void McastApiCleanup();
uint McastGenUID(MCAST_CLIENT_UID*);
uint McastEnumerateScopes(ushort, BOOL, MCAST_SCOPE_ENTRY*, uint*, uint*);
uint McastRequestAddress(ushort, MCAST_CLIENT_UID*, MCAST_SCOPE_CTX*, MCAST_LEASE_REQUEST*, MCAST_LEASE_RESPONSE*);
uint McastRenewAddress(ushort, MCAST_CLIENT_UID*, MCAST_LEASE_REQUEST*, MCAST_LEASE_RESPONSE*);
uint McastReleaseAddress(ushort, MCAST_CLIENT_UID*, MCAST_LEASE_REQUEST*);
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
