module windows.win32.networkmanagement.p2p;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HANDLE, HRESULT, HWND, PWSTR;
import windows.win32.networking.winsock : SOCKADDR, SOCKADDR_IN6, SOCKADDR_STORAGE, SOCKET_ADDRESS, SOCKET_ADDRESS_LIST;
import windows.win32.security.cryptography : CERT_CONTEXT, CERT_PUBLIC_KEY_INFO;
import windows.win32.system.com : BLOB;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

alias PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE = uint;
enum : uint
{
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_1 = 0x00000001,
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_2 = 0x00000002,
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION   = 0x00000002,
}

HRESULT PeerGraphStartup(ushort, PEER_VERSION_DATA*);
HRESULT PeerGraphShutdown();
void PeerGraphFreeData(void*);
HRESULT PeerGraphGetItemCount(void*, uint*);
HRESULT PeerGraphGetNextItem(void*, uint*, void***);
HRESULT PeerGraphEndEnumeration(void*);
HRESULT PeerGraphCreate(PEER_GRAPH_PROPERTIES*, const(wchar)*, PEER_SECURITY_INTERFACE*, void**);
HRESULT PeerGraphOpen(const(wchar)*, const(wchar)*, const(wchar)*, PEER_SECURITY_INTERFACE*, uint, const(GUID)*, void**);
HRESULT PeerGraphListen(void*, uint, uint, ushort);
HRESULT PeerGraphConnect(void*, const(wchar)*, PEER_ADDRESS*, ulong*);
HRESULT PeerGraphClose(void*);
HRESULT PeerGraphDelete(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT PeerGraphGetStatus(void*, uint*);
HRESULT PeerGraphGetProperties(void*, PEER_GRAPH_PROPERTIES**);
HRESULT PeerGraphSetProperties(void*, PEER_GRAPH_PROPERTIES*);
HRESULT PeerGraphRegisterEvent(void*, HANDLE, uint, PEER_GRAPH_EVENT_REGISTRATION*, void**);
HRESULT PeerGraphUnregisterEvent(void*);
HRESULT PeerGraphGetEventData(void*, PEER_GRAPH_EVENT_DATA**);
HRESULT PeerGraphGetRecord(void*, const(GUID)*, PEER_RECORD**);
HRESULT PeerGraphAddRecord(void*, PEER_RECORD*, GUID*);
HRESULT PeerGraphUpdateRecord(void*, PEER_RECORD*);
HRESULT PeerGraphDeleteRecord(void*, const(GUID)*, BOOL);
HRESULT PeerGraphEnumRecords(void*, const(GUID)*, const(wchar)*, void**);
HRESULT PeerGraphSearchRecords(void*, const(wchar)*, void**);
HRESULT PeerGraphExportDatabase(void*, const(wchar)*);
HRESULT PeerGraphImportDatabase(void*, const(wchar)*);
HRESULT PeerGraphValidateDeferredRecords(void*, uint, const(GUID)*);
HRESULT PeerGraphOpenDirectConnection(void*, const(wchar)*, PEER_ADDRESS*, ulong*);
HRESULT PeerGraphSendData(void*, ulong, const(GUID)*, uint, void*);
HRESULT PeerGraphCloseDirectConnection(void*, ulong);
HRESULT PeerGraphEnumConnections(void*, uint, void**);
HRESULT PeerGraphEnumNodes(void*, const(wchar)*, void**);
HRESULT PeerGraphSetPresence(void*, BOOL);
HRESULT PeerGraphGetNodeInfo(void*, ulong, PEER_NODE_INFO**);
HRESULT PeerGraphSetNodeAttributes(void*, const(wchar)*);
HRESULT PeerGraphPeerTimeToUniversalTime(void*, FILETIME*, FILETIME*);
HRESULT PeerGraphUniversalTimeToPeerTime(void*, FILETIME*, FILETIME*);
void PeerFreeData(const(void)*);
HRESULT PeerGetItemCount(void*, uint*);
HRESULT PeerGetNextItem(void*, uint*, void***);
HRESULT PeerEndEnumeration(void*);
HRESULT PeerGroupStartup(ushort, PEER_VERSION_DATA*);
HRESULT PeerGroupShutdown();
HRESULT PeerGroupCreate(PEER_GROUP_PROPERTIES*, void**);
HRESULT PeerGroupOpen(const(wchar)*, const(wchar)*, const(wchar)*, void**);
HRESULT PeerGroupJoin(const(wchar)*, const(wchar)*, const(wchar)*, void**);
HRESULT PeerGroupPasswordJoin(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, void**);
HRESULT PeerGroupConnect(void*);
HRESULT PeerGroupConnectByAddress(void*, uint, PEER_ADDRESS*);
HRESULT PeerGroupClose(void*);
HRESULT PeerGroupDelete(const(wchar)*, const(wchar)*);
HRESULT PeerGroupCreateInvitation(void*, const(wchar)*, FILETIME*, uint, const(GUID)*, PWSTR*);
HRESULT PeerGroupCreatePasswordInvitation(void*, PWSTR*);
HRESULT PeerGroupParseInvitation(const(wchar)*, PEER_INVITATION_INFO**);
HRESULT PeerGroupGetStatus(void*, uint*);
HRESULT PeerGroupGetProperties(void*, PEER_GROUP_PROPERTIES**);
HRESULT PeerGroupSetProperties(void*, PEER_GROUP_PROPERTIES*);
HRESULT PeerGroupEnumMembers(void*, uint, const(wchar)*, void**);
HRESULT PeerGroupOpenDirectConnection(void*, const(wchar)*, PEER_ADDRESS*, ulong*);
HRESULT PeerGroupCloseDirectConnection(void*, ulong);
HRESULT PeerGroupEnumConnections(void*, uint, void**);
HRESULT PeerGroupSendData(void*, ulong, const(GUID)*, uint, void*);
HRESULT PeerGroupRegisterEvent(void*, HANDLE, uint, PEER_GROUP_EVENT_REGISTRATION*, void**);
HRESULT PeerGroupUnregisterEvent(void*);
HRESULT PeerGroupGetEventData(void*, PEER_GROUP_EVENT_DATA**);
HRESULT PeerGroupGetRecord(void*, const(GUID)*, PEER_RECORD**);
HRESULT PeerGroupAddRecord(void*, PEER_RECORD*, GUID*);
HRESULT PeerGroupUpdateRecord(void*, PEER_RECORD*);
HRESULT PeerGroupDeleteRecord(void*, const(GUID)*);
HRESULT PeerGroupEnumRecords(void*, const(GUID)*, void**);
HRESULT PeerGroupSearchRecords(void*, const(wchar)*, void**);
HRESULT PeerGroupExportDatabase(void*, const(wchar)*);
HRESULT PeerGroupImportDatabase(void*, const(wchar)*);
HRESULT PeerGroupIssueCredentials(void*, const(wchar)*, PEER_CREDENTIAL_INFO*, uint, PWSTR*);
HRESULT PeerGroupExportConfig(void*, const(wchar)*, PWSTR*);
HRESULT PeerGroupImportConfig(const(wchar)*, const(wchar)*, BOOL, PWSTR*, PWSTR*);
HRESULT PeerGroupPeerTimeToUniversalTime(void*, FILETIME*, FILETIME*);
HRESULT PeerGroupUniversalTimeToPeerTime(void*, FILETIME*, FILETIME*);
HRESULT PeerGroupResumePasswordAuthentication(void*, void*);
HRESULT PeerIdentityCreate(const(wchar)*, const(wchar)*, ulong, PWSTR*);
HRESULT PeerIdentityGetFriendlyName(const(wchar)*, PWSTR*);
HRESULT PeerIdentitySetFriendlyName(const(wchar)*, const(wchar)*);
HRESULT PeerIdentityGetCryptKey(const(wchar)*, ulong*);
HRESULT PeerIdentityDelete(const(wchar)*);
HRESULT PeerEnumIdentities(void**);
HRESULT PeerEnumGroups(const(wchar)*, void**);
HRESULT PeerCreatePeerName(const(wchar)*, const(wchar)*, PWSTR*);
HRESULT PeerIdentityGetXML(const(wchar)*, PWSTR*);
HRESULT PeerIdentityExport(const(wchar)*, const(wchar)*, PWSTR*);
HRESULT PeerIdentityImport(const(wchar)*, const(wchar)*, PWSTR*);
HRESULT PeerIdentityGetDefault(PWSTR*);
HRESULT PeerCollabStartup(ushort);
HRESULT PeerCollabShutdown();
HRESULT PeerCollabSignin(HWND, uint);
HRESULT PeerCollabSignout(uint);
HRESULT PeerCollabGetSigninOptions(uint*);
HRESULT PeerCollabAsyncInviteContact(PEER_CONTACT*, PEER_ENDPOINT*, PEER_INVITATION*, HANDLE, HANDLE*);
HRESULT PeerCollabGetInvitationResponse(HANDLE, PEER_INVITATION_RESPONSE**);
HRESULT PeerCollabCancelInvitation(HANDLE);
HRESULT PeerCollabCloseHandle(HANDLE);
HRESULT PeerCollabInviteContact(PEER_CONTACT*, PEER_ENDPOINT*, PEER_INVITATION*, PEER_INVITATION_RESPONSE**);
HRESULT PeerCollabAsyncInviteEndpoint(PEER_ENDPOINT*, PEER_INVITATION*, HANDLE, HANDLE*);
HRESULT PeerCollabInviteEndpoint(PEER_ENDPOINT*, PEER_INVITATION*, PEER_INVITATION_RESPONSE**);
HRESULT PeerCollabGetAppLaunchInfo(PEER_APP_LAUNCH_INFO**);
HRESULT PeerCollabRegisterApplication(PEER_APPLICATION_REGISTRATION_INFO*, PEER_APPLICATION_REGISTRATION_TYPE);
HRESULT PeerCollabUnregisterApplication(const(GUID)*, PEER_APPLICATION_REGISTRATION_TYPE);
HRESULT PeerCollabGetApplicationRegistrationInfo(const(GUID)*, PEER_APPLICATION_REGISTRATION_TYPE, PEER_APPLICATION_REGISTRATION_INFO**);
HRESULT PeerCollabEnumApplicationRegistrationInfo(PEER_APPLICATION_REGISTRATION_TYPE, void**);
HRESULT PeerCollabGetPresenceInfo(PEER_ENDPOINT*, PEER_PRESENCE_INFO**);
HRESULT PeerCollabEnumApplications(PEER_ENDPOINT*, const(GUID)*, void**);
HRESULT PeerCollabEnumObjects(PEER_ENDPOINT*, const(GUID)*, void**);
HRESULT PeerCollabEnumEndpoints(PEER_CONTACT*, void**);
HRESULT PeerCollabRefreshEndpointData(PEER_ENDPOINT*);
HRESULT PeerCollabDeleteEndpointData(PEER_ENDPOINT*);
HRESULT PeerCollabQueryContactData(PEER_ENDPOINT*, PWSTR*);
HRESULT PeerCollabSubscribeEndpointData(const(PEER_ENDPOINT)*);
HRESULT PeerCollabUnsubscribeEndpointData(const(PEER_ENDPOINT)*);
HRESULT PeerCollabSetPresenceInfo(PEER_PRESENCE_INFO*);
HRESULT PeerCollabGetEndpointName(PWSTR*);
HRESULT PeerCollabSetEndpointName(const(wchar)*);
HRESULT PeerCollabSetObject(PEER_OBJECT*);
HRESULT PeerCollabDeleteObject(const(GUID)*);
HRESULT PeerCollabRegisterEvent(HANDLE, uint, PEER_COLLAB_EVENT_REGISTRATION*, void**);
HRESULT PeerCollabGetEventData(void*, PEER_COLLAB_EVENT_DATA**);
HRESULT PeerCollabUnregisterEvent(void*);
HRESULT PeerCollabEnumPeopleNearMe(void**);
HRESULT PeerCollabAddContact(const(wchar)*, PEER_CONTACT**);
HRESULT PeerCollabDeleteContact(const(wchar)*);
HRESULT PeerCollabGetContact(const(wchar)*, PEER_CONTACT**);
HRESULT PeerCollabUpdateContact(PEER_CONTACT*);
HRESULT PeerCollabEnumContacts(void**);
HRESULT PeerCollabExportContact(const(wchar)*, PWSTR*);
HRESULT PeerCollabParseContact(const(wchar)*, PEER_CONTACT**);
HRESULT PeerNameToPeerHostName(const(wchar)*, PWSTR*);
HRESULT PeerHostNameToPeerName(const(wchar)*, PWSTR*);
HRESULT PeerPnrpStartup(ushort);
HRESULT PeerPnrpShutdown();
HRESULT PeerPnrpRegister(const(wchar)*, PEER_PNRP_REGISTRATION_INFO*, void**);
HRESULT PeerPnrpUpdateRegistration(void*, PEER_PNRP_REGISTRATION_INFO*);
HRESULT PeerPnrpUnregister(void*);
HRESULT PeerPnrpResolve(const(wchar)*, const(wchar)*, uint*, PEER_PNRP_ENDPOINT_INFO**);
HRESULT PeerPnrpStartResolve(const(wchar)*, const(wchar)*, uint, HANDLE, void**);
HRESULT PeerPnrpGetCloudInfo(uint*, PEER_PNRP_CLOUD_INFO**);
HRESULT PeerPnrpGetEndpoint(void*, PEER_PNRP_ENDPOINT_INFO**);
HRESULT PeerPnrpEndResolve(void*);
HRESULT DrtCreatePnrpBootstrapResolver(BOOL, const(wchar)*, const(wchar)*, const(wchar)*, DRT_BOOTSTRAP_PROVIDER**);
void DrtDeletePnrpBootstrapResolver(DRT_BOOTSTRAP_PROVIDER*);
HRESULT DrtCreateDnsBootstrapResolver(ushort, const(wchar)*, DRT_BOOTSTRAP_PROVIDER**);
void DrtDeleteDnsBootstrapResolver(DRT_BOOTSTRAP_PROVIDER*);
HRESULT DrtCreateIpv6UdpTransport(DRT_SCOPE, uint, uint, ushort*, void**);
HRESULT DrtDeleteIpv6UdpTransport(void*);
HRESULT DrtCreateDerivedKeySecurityProvider(const(CERT_CONTEXT)*, const(CERT_CONTEXT)*, DRT_SECURITY_PROVIDER**);
HRESULT DrtCreateDerivedKey(const(CERT_CONTEXT)*, DRT_DATA*);
void DrtDeleteDerivedKeySecurityProvider(DRT_SECURITY_PROVIDER*);
HRESULT DrtCreateNullSecurityProvider(DRT_SECURITY_PROVIDER**);
void DrtDeleteNullSecurityProvider(DRT_SECURITY_PROVIDER*);
HRESULT DrtOpen(const(DRT_SETTINGS)*, HANDLE, const(void)*, void**);
void DrtClose(void*);
HRESULT DrtGetEventDataSize(void*, uint*);
HRESULT DrtGetEventData(void*, uint, DRT_EVENT_DATA*);
HRESULT DrtRegisterKey(void*, DRT_REGISTRATION*, void*, void**);
HRESULT DrtUpdateKey(void*, DRT_DATA*);
void DrtUnregisterKey(void*);
HRESULT DrtStartSearch(void*, DRT_DATA*, const(DRT_SEARCH_INFO)*, uint, HANDLE, const(void)*, void**);
HRESULT DrtContinueSearch(void*);
HRESULT DrtGetSearchResultSize(void*, uint*);
HRESULT DrtGetSearchResult(void*, uint, DRT_SEARCH_RESULT*);
HRESULT DrtGetSearchPathSize(void*, uint*);
HRESULT DrtGetSearchPath(void*, uint, DRT_ADDRESS_LIST*);
HRESULT DrtEndSearch(void*);
HRESULT DrtGetInstanceName(void*, uint, PWSTR);
HRESULT DrtGetInstanceNameSize(void*, uint*);
uint PeerDistStartup(uint, long*, uint*);
uint PeerDistShutdown(long);
uint PeerDistGetStatus(long, PEERDIST_STATUS*);
uint PeerDistRegisterForStatusChangeNotification(long, HANDLE, ulong, OVERLAPPED*, PEERDIST_STATUS*);
uint PeerDistUnregisterForStatusChangeNotification(long);
uint PeerDistServerPublishStream(long, uint, ubyte*, ulong, PEERDIST_PUBLICATION_OPTIONS*, HANDLE, ulong, long*);
uint PeerDistServerPublishAddToStream(long, long, uint, ubyte*, OVERLAPPED*);
uint PeerDistServerPublishCompleteStream(long, long, OVERLAPPED*);
uint PeerDistServerCloseStreamHandle(long, long);
uint PeerDistServerUnpublish(long, uint, ubyte*);
uint PeerDistServerOpenContentInformation(long, uint, ubyte*, ulong, ulong, HANDLE, ulong, long*);
uint PeerDistServerRetrieveContentInformation(long, long, uint, ubyte*, OVERLAPPED*);
uint PeerDistServerCloseContentInformation(long, long);
uint PeerDistServerCancelAsyncOperation(long, uint, ubyte*, OVERLAPPED*);
uint PeerDistClientOpenContent(long, PEERDIST_CONTENT_TAG*, HANDLE, ulong, long*);
uint PeerDistClientCloseContent(long, long);
uint PeerDistClientAddContentInformation(long, long, uint, ubyte*, OVERLAPPED*);
uint PeerDistClientCompleteContentInformation(long, long, OVERLAPPED*);
uint PeerDistClientAddData(long, long, uint, ubyte*, OVERLAPPED*);
uint PeerDistClientBlockRead(long, long, uint, ubyte*, uint, OVERLAPPED*);
uint PeerDistClientStreamRead(long, long, uint, ubyte*, uint, OVERLAPPED*);
uint PeerDistClientFlushContent(long, PEERDIST_CONTENT_TAG*, HANDLE, ulong, OVERLAPPED*);
uint PeerDistClientCancelAsyncOperation(long, long, OVERLAPPED*);
uint PeerDistGetStatusEx(long, PEERDIST_STATUS_INFO*);
uint PeerDistRegisterForStatusChangeNotificationEx(long, HANDLE, ulong, OVERLAPPED*, PEERDIST_STATUS_INFO*);
BOOL PeerDistGetOverlappedResult(OVERLAPPED*, uint*, BOOL);
uint PeerDistServerOpenContentInformationEx(long, uint, ubyte*, ulong, ulong, PEERDIST_RETRIEVAL_OPTIONS*, HANDLE, ulong, long*);
uint PeerDistClientGetInformationByHandle(long, long, PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS, uint, void*);
enum NS_PNRPNAME = 0x00000026;
enum NS_PNRPCLOUD = 0x00000027;
enum PNRPINFO_HINT = 0x00000001;
enum NS_PROVIDER_PNRPNAME = GUID(0x3fe89cd, 0x766d, 0x4976, [0xb9, 0xc1, 0xbb, 0x9b, 0xc4, 0x2c, 0x7b, 0x4d]);
enum NS_PROVIDER_PNRPCLOUD = GUID(0x3fe89ce, 0x766d, 0x4976, [0xb9, 0xc1, 0xbb, 0x9b, 0xc4, 0x2c, 0x7b, 0x4d]);
enum SVCID_PNRPCLOUD = GUID(0xc2239ce6, 0xc0, 0x4fbf, [0xba, 0xd6, 0x18, 0x13, 0x93, 0x85, 0xa4, 0x9a]);
enum SVCID_PNRPNAME_V1 = GUID(0xc2239ce5, 0xc0, 0x4fbf, [0xba, 0xd6, 0x18, 0x13, 0x93, 0x85, 0xa4, 0x9a]);
enum SVCID_PNRPNAME_V2 = GUID(0xc2239ce7, 0xc0, 0x4fbf, [0xba, 0xd6, 0x18, 0x13, 0x93, 0x85, 0xa4, 0x9a]);
enum PNRP_MAX_ENDPOINT_ADDRESSES = 0x0000000a;
enum WSZ_SCOPE_GLOBAL = "GLOBAL";
enum WSZ_SCOPE_SITELOCAL = "SITELOCAL";
enum WSZ_SCOPE_LINKLOCAL = "LINKLOCAL";
enum PNRP_MAX_EXTENDED_PAYLOAD_BYTES = 0x00001000;
enum PEER_PNRP_ALL_LINK_CLOUDS = "PEER_PNRP_ALL_LINKS";
enum WSA_PNRP_ERROR_BASE = 0x00002cec;
enum WSA_PNRP_CLOUD_NOT_FOUND = 0x00002ced;
enum WSA_PNRP_CLOUD_DISABLED = 0x00002cee;
enum WSA_PNRP_INVALID_IDENTITY = 0x00002cef;
enum WSA_PNRP_TOO_MUCH_LOAD = 0x00002cf0;
enum WSA_PNRP_CLOUD_IS_SEARCH_ONLY = 0x00002cf1;
enum WSA_PNRP_CLIENT_INVALID_COMPARTMENT_ID = 0x00002cf2;
enum WSA_PNRP_DUPLICATE_PEER_NAME = 0x00002cf4;
enum WSA_PNRP_CLOUD_IS_DEAD = 0x00002cf5;
enum PEER_E_CLOUD_NOT_FOUND = 0xffffffff80072ced;
enum PEER_E_CLOUD_DISABLED = 0xffffffff80072cee;
enum PEER_E_INVALID_IDENTITY = 0xffffffff80072cef;
enum PEER_E_TOO_MUCH_LOAD = 0xffffffff80072cf0;
enum PEER_E_CLOUD_IS_SEARCH_ONLY = 0xffffffff80072cf1;
enum PEER_E_CLIENT_INVALID_COMPARTMENT_ID = 0xffffffff80072cf2;
enum PEER_E_DUPLICATE_PEER_NAME = 0xffffffff80072cf4;
enum PEER_E_CLOUD_IS_DEAD = 0xffffffff80072cf5;
enum PEER_E_NOT_FOUND = 0xffffffff80070490;
enum PEER_E_DISK_FULL = 0xffffffff80070070;
enum PEER_E_ALREADY_EXISTS = 0xffffffff800700b7;
enum PEER_GROUP_ROLE_ADMIN = GUID(0x4387127, 0xaa56, 0x450a, [0x8c, 0xe5, 0x4f, 0x56, 0x5c, 0x67, 0x90, 0xf4]);
enum PEER_GROUP_ROLE_MEMBER = GUID(0xf12dc4c7, 0x857, 0x4ca0, [0x93, 0xfc, 0xb1, 0xbb, 0x19, 0xa3, 0xd8, 0xc2]);
enum PEER_GROUP_ROLE_INVITING_MEMBER = GUID(0x4370fd89, 0xdc18, 0x4cfb, [0x8d, 0xbf, 0x98, 0x53, 0xa8, 0xa9, 0xf9, 0x5]);
enum PEER_COLLAB_OBJECTID_USER_PICTURE = GUID(0xdd15f41f, 0xfc4e, 0x4922, [0xb0, 0x35, 0x4c, 0x6, 0xa7, 0x54, 0xd0, 0x1d]);
enum FACILITY_DRT = 0x00000062;
enum DRT_E_TIMEOUT = 0xffffffff80621001;
enum DRT_E_INVALID_KEY_SIZE = 0xffffffff80621002;
enum DRT_E_INVALID_CERT_CHAIN = 0xffffffff80621004;
enum DRT_E_INVALID_MESSAGE = 0xffffffff80621005;
enum DRT_E_NO_MORE = 0xffffffff80621006;
enum DRT_E_INVALID_MAX_ADDRESSES = 0xffffffff80621007;
enum DRT_E_SEARCH_IN_PROGRESS = 0xffffffff80621008;
enum DRT_E_INVALID_KEY = 0xffffffff80621009;
enum DRT_S_RETRY = 0x00621010;
enum DRT_E_INVALID_MAX_ENDPOINTS = 0xffffffff80621011;
enum DRT_E_INVALID_SEARCH_RANGE = 0xffffffff80621012;
enum DRT_E_INVALID_PORT = 0xffffffff80622000;
enum DRT_E_INVALID_TRANSPORT_PROVIDER = 0xffffffff80622001;
enum DRT_E_INVALID_SECURITY_PROVIDER = 0xffffffff80622002;
enum DRT_E_STILL_IN_USE = 0xffffffff80622003;
enum DRT_E_INVALID_BOOTSTRAP_PROVIDER = 0xffffffff80622004;
enum DRT_E_INVALID_ADDRESS = 0xffffffff80622005;
enum DRT_E_INVALID_SCOPE = 0xffffffff80622006;
enum DRT_E_TRANSPORT_SHUTTING_DOWN = 0xffffffff80622007;
enum DRT_E_NO_ADDRESSES_AVAILABLE = 0xffffffff80622008;
enum DRT_E_DUPLICATE_KEY = 0xffffffff80622009;
enum DRT_E_TRANSPORTPROVIDER_IN_USE = 0xffffffff8062200a;
enum DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED = 0xffffffff8062200b;
enum DRT_E_SECURITYPROVIDER_IN_USE = 0xffffffff8062200c;
enum DRT_E_SECURITYPROVIDER_NOT_ATTACHED = 0xffffffff8062200d;
enum DRT_E_BOOTSTRAPPROVIDER_IN_USE = 0xffffffff8062200e;
enum DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED = 0xffffffff8062200f;
enum DRT_E_TRANSPORT_ALREADY_BOUND = 0xffffffff80622101;
enum DRT_E_TRANSPORT_NOT_BOUND = 0xffffffff80622102;
enum DRT_E_TRANSPORT_UNEXPECTED = 0xffffffff80622103;
enum DRT_E_TRANSPORT_INVALID_ARGUMENT = 0xffffffff80622104;
enum DRT_E_TRANSPORT_NO_DEST_ADDRESSES = 0xffffffff80622105;
enum DRT_E_TRANSPORT_EXECUTING_CALLBACK = 0xffffffff80622106;
enum DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE = 0xffffffff80622107;
enum DRT_E_INVALID_SETTINGS = 0xffffffff80622108;
enum DRT_E_INVALID_SEARCH_INFO = 0xffffffff80622109;
enum DRT_E_FAULTED = 0xffffffff8062210a;
enum DRT_E_TRANSPORT_STILL_BOUND = 0xffffffff8062210b;
enum DRT_E_INSUFFICIENT_BUFFER = 0xffffffff8062210c;
enum DRT_E_INVALID_INSTANCE_PREFIX = 0xffffffff8062210d;
enum DRT_E_INVALID_SECURITY_MODE = 0xffffffff8062210e;
enum DRT_E_CAPABILITY_MISMATCH = 0xffffffff8062210f;
enum DRT_PAYLOAD_REVOKED = 0x00000001;
enum DRT_MIN_ROUTING_ADDRESSES = 0x00000001;
enum DRT_MAX_ROUTING_ADDRESSES = 0x00000014;
enum DRT_MAX_PAYLOAD_SIZE = 0x00001400;
enum DRT_MAX_INSTANCE_PREFIX_LEN = 0x00000080;
enum DRT_LINK_LOCAL_ISATAP_SCOPEID = 0xffffffff;
enum PEERDIST_PUBLICATION_OPTIONS_VERSION_1 = 0x00000001;
enum PEERDIST_PUBLICATION_OPTIONS_VERSION = 0x00000002;
enum PEERDIST_PUBLICATION_OPTIONS_VERSION_2 = 0x00000002;
enum PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY = 0x00000000;
enum PEERDIST_READ_TIMEOUT_DEFAULT = 0xfffffffe;
alias PNRP_SCOPE = int;
enum : int
{
    PNRP_SCOPE_ANY        = 0x00000000,
    PNRP_GLOBAL_SCOPE     = 0x00000001,
    PNRP_SITE_LOCAL_SCOPE = 0x00000002,
    PNRP_LINK_LOCAL_SCOPE = 0x00000003,
}

alias PNRP_CLOUD_STATE = int;
enum : int
{
    PNRP_CLOUD_STATE_VIRTUAL       = 0x00000000,
    PNRP_CLOUD_STATE_SYNCHRONISING = 0x00000001,
    PNRP_CLOUD_STATE_ACTIVE        = 0x00000002,
    PNRP_CLOUD_STATE_DEAD          = 0x00000003,
    PNRP_CLOUD_STATE_DISABLED      = 0x00000004,
    PNRP_CLOUD_STATE_NO_NET        = 0x00000005,
    PNRP_CLOUD_STATE_ALONE         = 0x00000006,
}

alias PNRP_CLOUD_FLAGS = int;
enum : int
{
    PNRP_CLOUD_NO_FLAGS         = 0x00000000,
    PNRP_CLOUD_NAME_LOCAL       = 0x00000001,
    PNRP_CLOUD_RESOLVE_ONLY     = 0x00000002,
    PNRP_CLOUD_FULL_PARTICIPANT = 0x00000004,
}

alias PNRP_REGISTERED_ID_STATE = int;
enum : int
{
    PNRP_REGISTERED_ID_STATE_OK      = 0x00000001,
    PNRP_REGISTERED_ID_STATE_PROBLEM = 0x00000002,
}

alias PNRP_RESOLVE_CRITERIA = int;
enum : int
{
    PNRP_RESOLVE_CRITERIA_DEFAULT                               = 0x00000000,
    PNRP_RESOLVE_CRITERIA_REMOTE_PEER_NAME                      = 0x00000001,
    PNRP_RESOLVE_CRITERIA_NEAREST_REMOTE_PEER_NAME              = 0x00000002,
    PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME         = 0x00000003,
    PNRP_RESOLVE_CRITERIA_NEAREST_NON_CURRENT_PROCESS_PEER_NAME = 0x00000004,
    PNRP_RESOLVE_CRITERIA_ANY_PEER_NAME                         = 0x00000005,
    PNRP_RESOLVE_CRITERIA_NEAREST_PEER_NAME                     = 0x00000006,
}

struct PNRP_CLOUD_ID
{
    int AddressFamily;
    PNRP_SCOPE Scope;
    uint ScopeId;
}
alias PNRP_EXTENDED_PAYLOAD_TYPE = int;
enum : int
{
    PNRP_EXTENDED_PAYLOAD_TYPE_NONE   = 0x00000000,
    PNRP_EXTENDED_PAYLOAD_TYPE_BINARY = 0x00000001,
    PNRP_EXTENDED_PAYLOAD_TYPE_STRING = 0x00000002,
}

struct PNRPINFO_V1
{
    uint dwSize;
    PWSTR lpwszIdentity;
    uint nMaxResolve;
    uint dwTimeout;
    uint dwLifetime;
    PNRP_RESOLVE_CRITERIA enResolveCriteria;
    uint dwFlags;
    SOCKET_ADDRESS saHint;
    PNRP_REGISTERED_ID_STATE enNameState;
}
struct PNRPINFO_V2
{
    uint dwSize;
    PWSTR lpwszIdentity;
    uint nMaxResolve;
    uint dwTimeout;
    uint dwLifetime;
    PNRP_RESOLVE_CRITERIA enResolveCriteria;
    uint dwFlags;
    SOCKET_ADDRESS saHint;
    PNRP_REGISTERED_ID_STATE enNameState;
    PNRP_EXTENDED_PAYLOAD_TYPE enExtendedPayloadType;
    union
    {
        BLOB blobPayload;
        PWSTR pwszPayload;
    }
}
struct PNRPCLOUDINFO
{
    uint dwSize;
    PNRP_CLOUD_ID Cloud;
    PNRP_CLOUD_STATE enCloudState;
    PNRP_CLOUD_FLAGS enCloudFlags;
}
alias PEER_RECORD_CHANGE_TYPE = int;
enum : int
{
    PEER_RECORD_ADDED   = 0x00000001,
    PEER_RECORD_UPDATED = 0x00000002,
    PEER_RECORD_DELETED = 0x00000003,
    PEER_RECORD_EXPIRED = 0x00000004,
}

alias PEER_CONNECTION_STATUS = int;
enum : int
{
    PEER_CONNECTED         = 0x00000001,
    PEER_DISCONNECTED      = 0x00000002,
    PEER_CONNECTION_FAILED = 0x00000003,
}

alias PEER_CONNECTION_FLAGS = int;
enum : int
{
    PEER_CONNECTION_NEIGHBOR = 0x00000001,
    PEER_CONNECTION_DIRECT   = 0x00000002,
}

alias PEER_RECORD_FLAGS = int;
enum : int
{
    PEER_RECORD_FLAG_AUTOREFRESH = 0x00000001,
    PEER_RECORD_FLAG_DELETED     = 0x00000002,
}

struct PEER_VERSION_DATA
{
    ushort wVersion;
    ushort wHighestVersion;
}
struct PEER_DATA
{
    uint cbData;
    ubyte* pbData;
}
struct PEER_RECORD
{
    uint dwSize;
    GUID type;
    GUID id;
    uint dwVersion;
    uint dwFlags;
    PWSTR pwzCreatorId;
    PWSTR pwzModifiedById;
    PWSTR pwzAttributes;
    FILETIME ftCreation;
    FILETIME ftExpiration;
    FILETIME ftLastModified;
    PEER_DATA securityData;
    PEER_DATA data;
}
struct PEER_ADDRESS
{
    uint dwSize;
    SOCKADDR_IN6 sin6;
}
struct PEER_CONNECTION_INFO
{
    uint dwSize;
    uint dwFlags;
    ulong ullConnectionId;
    ulong ullNodeId;
    PWSTR pwzPeerId;
    PEER_ADDRESS address;
}
struct PEER_EVENT_INCOMING_DATA
{
    uint dwSize;
    ulong ullConnectionId;
    GUID type;
    PEER_DATA data;
}
struct PEER_EVENT_RECORD_CHANGE_DATA
{
    uint dwSize;
    PEER_RECORD_CHANGE_TYPE changeType;
    GUID recordId;
    GUID recordType;
}
struct PEER_EVENT_CONNECTION_CHANGE_DATA
{
    uint dwSize;
    PEER_CONNECTION_STATUS status;
    ulong ullConnectionId;
    ulong ullNodeId;
    ulong ullNextConnectionId;
    HRESULT hrConnectionFailedReason;
}
struct PEER_EVENT_SYNCHRONIZED_DATA
{
    uint dwSize;
    GUID recordType;
}
alias PEER_GRAPH_EVENT_TYPE = int;
enum : int
{
    PEER_GRAPH_EVENT_STATUS_CHANGED      = 0x00000001,
    PEER_GRAPH_EVENT_PROPERTY_CHANGED    = 0x00000002,
    PEER_GRAPH_EVENT_RECORD_CHANGED      = 0x00000003,
    PEER_GRAPH_EVENT_DIRECT_CONNECTION   = 0x00000004,
    PEER_GRAPH_EVENT_NEIGHBOR_CONNECTION = 0x00000005,
    PEER_GRAPH_EVENT_INCOMING_DATA       = 0x00000006,
    PEER_GRAPH_EVENT_CONNECTION_REQUIRED = 0x00000007,
    PEER_GRAPH_EVENT_NODE_CHANGED        = 0x00000008,
    PEER_GRAPH_EVENT_SYNCHRONIZED        = 0x00000009,
}

alias PEER_NODE_CHANGE_TYPE = int;
enum : int
{
    PEER_NODE_CHANGE_CONNECTED    = 0x00000001,
    PEER_NODE_CHANGE_DISCONNECTED = 0x00000002,
    PEER_NODE_CHANGE_UPDATED      = 0x00000003,
}

alias PEER_GRAPH_STATUS_FLAGS = int;
enum : int
{
    PEER_GRAPH_STATUS_LISTENING       = 0x00000001,
    PEER_GRAPH_STATUS_HAS_CONNECTIONS = 0x00000002,
    PEER_GRAPH_STATUS_SYNCHRONIZED    = 0x00000004,
}

alias PEER_GRAPH_PROPERTY_FLAGS = int;
enum : int
{
    PEER_GRAPH_PROPERTY_HEARTBEATS       = 0x00000001,
    PEER_GRAPH_PROPERTY_DEFER_EXPIRATION = 0x00000002,
}

alias PEER_GRAPH_SCOPE = int;
enum : int
{
    PEER_GRAPH_SCOPE_ANY       = 0x00000000,
    PEER_GRAPH_SCOPE_GLOBAL    = 0x00000001,
    PEER_GRAPH_SCOPE_SITELOCAL = 0x00000002,
    PEER_GRAPH_SCOPE_LINKLOCAL = 0x00000003,
    PEER_GRAPH_SCOPE_LOOPBACK  = 0x00000004,
}

struct PEER_GRAPH_PROPERTIES
{
    uint dwSize;
    uint dwFlags;
    uint dwScope;
    uint dwMaxRecordSize;
    PWSTR pwzGraphId;
    PWSTR pwzCreatorId;
    PWSTR pwzFriendlyName;
    PWSTR pwzComment;
    uint ulPresenceLifetime;
    uint cPresenceMax;
}
struct PEER_NODE_INFO
{
    uint dwSize;
    ulong ullNodeId;
    PWSTR pwzPeerId;
    uint cAddresses;
    PEER_ADDRESS* pAddresses;
    PWSTR pwzAttributes;
}
struct PEER_EVENT_NODE_CHANGE_DATA
{
    uint dwSize;
    PEER_NODE_CHANGE_TYPE changeType;
    ulong ullNodeId;
    PWSTR pwzPeerId;
}
struct PEER_GRAPH_EVENT_REGISTRATION
{
    PEER_GRAPH_EVENT_TYPE eventType;
    GUID* pType;
}
struct PEER_GRAPH_EVENT_DATA
{
    PEER_GRAPH_EVENT_TYPE eventType;
    union
    {
        PEER_GRAPH_STATUS_FLAGS dwStatus;
        PEER_EVENT_INCOMING_DATA incomingData;
        PEER_EVENT_RECORD_CHANGE_DATA recordChangeData;
        PEER_EVENT_CONNECTION_CHANGE_DATA connectionChangeData;
        PEER_EVENT_NODE_CHANGE_DATA nodeChangeData;
        PEER_EVENT_SYNCHRONIZED_DATA synchronizedData;
    }
}
alias PFNPEER_VALIDATE_RECORD = HRESULT function(void*, void*, PEER_RECORD*, PEER_RECORD_CHANGE_TYPE);
alias PFNPEER_SECURE_RECORD = HRESULT function(void*, void*, PEER_RECORD*, PEER_RECORD_CHANGE_TYPE, PEER_DATA**);
alias PFNPEER_FREE_SECURITY_DATA = HRESULT function(void*, void*, PEER_DATA*);
alias PFNPEER_ON_PASSWORD_AUTH_FAILED = HRESULT function(void*, void*);
struct PEER_SECURITY_INTERFACE
{
    uint dwSize;
    PWSTR pwzSspFilename;
    PWSTR pwzPackageName;
    uint cbSecurityInfo;
    ubyte* pbSecurityInfo;
    void* pvContext;
    PFNPEER_VALIDATE_RECORD pfnValidateRecord;
    PFNPEER_SECURE_RECORD pfnSecureRecord;
    PFNPEER_FREE_SECURITY_DATA pfnFreeSecurityData;
    PFNPEER_ON_PASSWORD_AUTH_FAILED pfnAuthFailed;
}
alias PEER_GROUP_EVENT_TYPE = int;
enum : int
{
    PEER_GROUP_EVENT_STATUS_CHANGED        = 0x00000001,
    PEER_GROUP_EVENT_PROPERTY_CHANGED      = 0x00000002,
    PEER_GROUP_EVENT_RECORD_CHANGED        = 0x00000003,
    PEER_GROUP_EVENT_DIRECT_CONNECTION     = 0x00000004,
    PEER_GROUP_EVENT_NEIGHBOR_CONNECTION   = 0x00000005,
    PEER_GROUP_EVENT_INCOMING_DATA         = 0x00000006,
    PEER_GROUP_EVENT_MEMBER_CHANGED        = 0x00000008,
    PEER_GROUP_EVENT_CONNECTION_FAILED     = 0x0000000a,
    PEER_GROUP_EVENT_AUTHENTICATION_FAILED = 0x0000000b,
}

alias PEER_GROUP_STATUS = int;
enum : int
{
    PEER_GROUP_STATUS_LISTENING       = 0x00000001,
    PEER_GROUP_STATUS_HAS_CONNECTIONS = 0x00000002,
}

alias PEER_GROUP_PROPERTY_FLAGS = int;
enum : int
{
    PEER_MEMBER_DATA_OPTIONAL = 0x00000001,
    PEER_DISABLE_PRESENCE     = 0x00000002,
    PEER_DEFER_EXPIRATION     = 0x00000004,
}

alias PEER_GROUP_AUTHENTICATION_SCHEME = int;
enum : int
{
    PEER_GROUP_GMC_AUTHENTICATION      = 0x00000001,
    PEER_GROUP_PASSWORD_AUTHENTICATION = 0x00000002,
}

alias PEER_MEMBER_FLAGS = int;
enum : int
{
    PEER_MEMBER_PRESENT = 0x00000001,
}

alias PEER_MEMBER_CHANGE_TYPE = int;
enum : int
{
    PEER_MEMBER_CONNECTED    = 0x00000001,
    PEER_MEMBER_DISCONNECTED = 0x00000002,
    PEER_MEMBER_UPDATED      = 0x00000003,
    PEER_MEMBER_JOINED       = 0x00000004,
    PEER_MEMBER_LEFT         = 0x00000005,
}

alias PEER_GROUP_ISSUE_CREDENTIAL_FLAGS = int;
enum : int
{
    PEER_GROUP_STORE_CREDENTIALS = 0x00000001,
}

struct PEER_CREDENTIAL_INFO
{
    uint dwSize;
    uint dwFlags;
    PWSTR pwzFriendlyName;
    CERT_PUBLIC_KEY_INFO* pPublicKey;
    PWSTR pwzIssuerPeerName;
    PWSTR pwzIssuerFriendlyName;
    FILETIME ftValidityStart;
    FILETIME ftValidityEnd;
    uint cRoles;
    GUID* pRoles;
}
struct PEER_MEMBER
{
    uint dwSize;
    uint dwFlags;
    PWSTR pwzIdentity;
    PWSTR pwzAttributes;
    ulong ullNodeId;
    uint cAddresses;
    PEER_ADDRESS* pAddresses;
    PEER_CREDENTIAL_INFO* pCredentialInfo;
}
struct PEER_INVITATION_INFO
{
    uint dwSize;
    uint dwFlags;
    PWSTR pwzCloudName;
    uint dwScope;
    uint dwCloudFlags;
    PWSTR pwzGroupPeerName;
    PWSTR pwzIssuerPeerName;
    PWSTR pwzSubjectPeerName;
    PWSTR pwzGroupFriendlyName;
    PWSTR pwzIssuerFriendlyName;
    PWSTR pwzSubjectFriendlyName;
    FILETIME ftValidityStart;
    FILETIME ftValidityEnd;
    uint cRoles;
    GUID* pRoles;
    uint cClassifiers;
    PWSTR* ppwzClassifiers;
    CERT_PUBLIC_KEY_INFO* pSubjectPublicKey;
    PEER_GROUP_AUTHENTICATION_SCHEME authScheme;
}
struct PEER_GROUP_PROPERTIES
{
    uint dwSize;
    uint dwFlags;
    PWSTR pwzCloud;
    PWSTR pwzClassifier;
    PWSTR pwzGroupPeerName;
    PWSTR pwzCreatorPeerName;
    PWSTR pwzFriendlyName;
    PWSTR pwzComment;
    uint ulMemberDataLifetime;
    uint ulPresenceLifetime;
    uint dwAuthenticationSchemes;
    PWSTR pwzGroupPassword;
    GUID groupPasswordRole;
}
struct PEER_EVENT_MEMBER_CHANGE_DATA
{
    uint dwSize;
    PEER_MEMBER_CHANGE_TYPE changeType;
    PWSTR pwzIdentity;
}
struct PEER_GROUP_EVENT_REGISTRATION
{
    PEER_GROUP_EVENT_TYPE eventType;
    GUID* pType;
}
struct PEER_GROUP_EVENT_DATA
{
    PEER_GROUP_EVENT_TYPE eventType;
    union
    {
        PEER_GROUP_STATUS dwStatus;
        PEER_EVENT_INCOMING_DATA incomingData;
        PEER_EVENT_RECORD_CHANGE_DATA recordChangeData;
        PEER_EVENT_CONNECTION_CHANGE_DATA connectionChangeData;
        PEER_EVENT_MEMBER_CHANGE_DATA memberChangeData;
        HRESULT hrConnectionFailedReason;
    }
}
struct PEER_NAME_PAIR
{
    uint dwSize;
    PWSTR pwzPeerName;
    PWSTR pwzFriendlyName;
}
alias PEER_SIGNIN_FLAGS = int;
enum : int
{
    PEER_SIGNIN_NONE     = 0x00000000,
    PEER_SIGNIN_NEAR_ME  = 0x00000001,
    PEER_SIGNIN_INTERNET = 0x00000002,
    PEER_SIGNIN_ALL      = 0x00000003,
}

alias PEER_WATCH_PERMISSION = int;
enum : int
{
    PEER_WATCH_BLOCKED = 0x00000000,
    PEER_WATCH_ALLOWED = 0x00000001,
}

alias PEER_PUBLICATION_SCOPE = int;
enum : int
{
    PEER_PUBLICATION_SCOPE_NONE     = 0x00000000,
    PEER_PUBLICATION_SCOPE_NEAR_ME  = 0x00000001,
    PEER_PUBLICATION_SCOPE_INTERNET = 0x00000002,
    PEER_PUBLICATION_SCOPE_ALL      = 0x00000003,
}

struct PEER_APPLICATION
{
    GUID id;
    PEER_DATA data;
    PWSTR pwzDescription;
}
struct PEER_OBJECT
{
    GUID id;
    PEER_DATA data;
    uint dwPublicationScope;
}
struct PEER_CONTACT
{
    PWSTR pwzPeerName;
    PWSTR pwzNickName;
    PWSTR pwzDisplayName;
    PWSTR pwzEmailAddress;
    BOOL fWatch;
    PEER_WATCH_PERMISSION WatcherPermissions;
    PEER_DATA credentials;
}
struct PEER_ENDPOINT
{
    PEER_ADDRESS address;
    PWSTR pwzEndpointName;
}
struct PEER_PEOPLE_NEAR_ME
{
    PWSTR pwzNickName;
    PEER_ENDPOINT endpoint;
    GUID id;
}
alias PEER_INVITATION_RESPONSE_TYPE = int;
enum : int
{
    PEER_INVITATION_RESPONSE_DECLINED = 0x00000000,
    PEER_INVITATION_RESPONSE_ACCEPTED = 0x00000001,
    PEER_INVITATION_RESPONSE_EXPIRED  = 0x00000002,
    PEER_INVITATION_RESPONSE_ERROR    = 0x00000003,
}

alias PEER_APPLICATION_REGISTRATION_TYPE = int;
enum : int
{
    PEER_APPLICATION_CURRENT_USER = 0x00000000,
    PEER_APPLICATION_ALL_USERS    = 0x00000001,
}

struct PEER_INVITATION
{
    GUID applicationId;
    PEER_DATA applicationData;
    PWSTR pwzMessage;
}
struct PEER_INVITATION_RESPONSE
{
    PEER_INVITATION_RESPONSE_TYPE action;
    PWSTR pwzMessage;
    HRESULT hrExtendedInfo;
}
struct PEER_APP_LAUNCH_INFO
{
    PEER_CONTACT* pContact;
    PEER_ENDPOINT* pEndpoint;
    PEER_INVITATION* pInvitation;
}
struct PEER_APPLICATION_REGISTRATION_INFO
{
    PEER_APPLICATION application;
    PWSTR pwzApplicationToLaunch;
    PWSTR pwzApplicationArguments;
    uint dwPublicationScope;
}
alias PEER_PRESENCE_STATUS = int;
enum : int
{
    PEER_PRESENCE_OFFLINE       = 0x00000000,
    PEER_PRESENCE_OUT_TO_LUNCH  = 0x00000001,
    PEER_PRESENCE_AWAY          = 0x00000002,
    PEER_PRESENCE_BE_RIGHT_BACK = 0x00000003,
    PEER_PRESENCE_IDLE          = 0x00000004,
    PEER_PRESENCE_BUSY          = 0x00000005,
    PEER_PRESENCE_ON_THE_PHONE  = 0x00000006,
    PEER_PRESENCE_ONLINE        = 0x00000007,
}

struct PEER_PRESENCE_INFO
{
    PEER_PRESENCE_STATUS status;
    PWSTR pwzDescriptiveText;
}
alias PEER_CHANGE_TYPE = int;
enum : int
{
    PEER_CHANGE_ADDED   = 0x00000000,
    PEER_CHANGE_DELETED = 0x00000001,
    PEER_CHANGE_UPDATED = 0x00000002,
}

alias PEER_COLLAB_EVENT_TYPE = int;
enum : int
{
    PEER_EVENT_WATCHLIST_CHANGED            = 0x00000001,
    PEER_EVENT_ENDPOINT_CHANGED             = 0x00000002,
    PEER_EVENT_ENDPOINT_PRESENCE_CHANGED    = 0x00000003,
    PEER_EVENT_ENDPOINT_APPLICATION_CHANGED = 0x00000004,
    PEER_EVENT_ENDPOINT_OBJECT_CHANGED      = 0x00000005,
    PEER_EVENT_MY_ENDPOINT_CHANGED          = 0x00000006,
    PEER_EVENT_MY_PRESENCE_CHANGED          = 0x00000007,
    PEER_EVENT_MY_APPLICATION_CHANGED       = 0x00000008,
    PEER_EVENT_MY_OBJECT_CHANGED            = 0x00000009,
    PEER_EVENT_PEOPLE_NEAR_ME_CHANGED       = 0x0000000a,
    PEER_EVENT_REQUEST_STATUS_CHANGED       = 0x0000000b,
}

struct PEER_COLLAB_EVENT_REGISTRATION
{
    PEER_COLLAB_EVENT_TYPE eventType;
    GUID* pInstance;
}
struct PEER_EVENT_WATCHLIST_CHANGED_DATA
{
    PEER_CONTACT* pContact;
    PEER_CHANGE_TYPE changeType;
}
struct PEER_EVENT_PRESENCE_CHANGED_DATA
{
    PEER_CONTACT* pContact;
    PEER_ENDPOINT* pEndpoint;
    PEER_CHANGE_TYPE changeType;
    PEER_PRESENCE_INFO* pPresenceInfo;
}
struct PEER_EVENT_APPLICATION_CHANGED_DATA
{
    PEER_CONTACT* pContact;
    PEER_ENDPOINT* pEndpoint;
    PEER_CHANGE_TYPE changeType;
    PEER_APPLICATION* pApplication;
}
struct PEER_EVENT_OBJECT_CHANGED_DATA
{
    PEER_CONTACT* pContact;
    PEER_ENDPOINT* pEndpoint;
    PEER_CHANGE_TYPE changeType;
    PEER_OBJECT* pObject;
}
struct PEER_EVENT_ENDPOINT_CHANGED_DATA
{
    PEER_CONTACT* pContact;
    PEER_ENDPOINT* pEndpoint;
}
struct PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA
{
    PEER_CHANGE_TYPE changeType;
    PEER_PEOPLE_NEAR_ME* pPeopleNearMe;
}
struct PEER_EVENT_REQUEST_STATUS_CHANGED_DATA
{
    PEER_ENDPOINT* pEndpoint;
    HRESULT hrChange;
}
struct PEER_COLLAB_EVENT_DATA
{
    PEER_COLLAB_EVENT_TYPE eventType;
    union
    {
        PEER_EVENT_WATCHLIST_CHANGED_DATA watchListChangedData;
        PEER_EVENT_PRESENCE_CHANGED_DATA presenceChangedData;
        PEER_EVENT_APPLICATION_CHANGED_DATA applicationChangedData;
        PEER_EVENT_OBJECT_CHANGED_DATA objectChangedData;
        PEER_EVENT_ENDPOINT_CHANGED_DATA endpointChangedData;
        PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA peopleNearMeChangedData;
        PEER_EVENT_REQUEST_STATUS_CHANGED_DATA requestStatusChangedData;
    }
}
struct PEER_PNRP_ENDPOINT_INFO
{
    PWSTR pwzPeerName;
    uint cAddresses;
    SOCKADDR** ppAddresses;
    PWSTR pwzComment;
    PEER_DATA payload;
}
struct PEER_PNRP_CLOUD_INFO
{
    PWSTR pwzCloudName;
    PNRP_SCOPE dwScope;
    uint dwScopeId;
}
struct PEER_PNRP_REGISTRATION_INFO
{
    PWSTR pwzCloudName;
    PWSTR pwzPublishingIdentity;
    uint cAddresses;
    SOCKADDR** ppAddresses;
    ushort wPort;
    PWSTR pwzComment;
    PEER_DATA payload;
}
alias DRT_SCOPE = int;
enum : int
{
    DRT_GLOBAL_SCOPE     = 0x00000001,
    DRT_SITE_LOCAL_SCOPE = 0x00000002,
    DRT_LINK_LOCAL_SCOPE = 0x00000003,
}

alias DRT_STATUS = int;
enum : int
{
    DRT_ACTIVE     = 0x00000000,
    DRT_ALONE      = 0x00000001,
    DRT_NO_NETWORK = 0x0000000a,
    DRT_FAULTED    = 0x00000014,
}

alias DRT_MATCH_TYPE = int;
enum : int
{
    DRT_MATCH_EXACT        = 0x00000000,
    DRT_MATCH_NEAR         = 0x00000001,
    DRT_MATCH_INTERMEDIATE = 0x00000002,
}

alias DRT_LEAFSET_KEY_CHANGE_TYPE = int;
enum : int
{
    DRT_LEAFSET_KEY_ADDED   = 0x00000000,
    DRT_LEAFSET_KEY_DELETED = 0x00000001,
}

alias DRT_EVENT_TYPE = int;
enum : int
{
    DRT_EVENT_STATUS_CHANGED             = 0x00000000,
    DRT_EVENT_LEAFSET_KEY_CHANGED        = 0x00000001,
    DRT_EVENT_REGISTRATION_STATE_CHANGED = 0x00000002,
}

alias DRT_SECURITY_MODE = int;
enum : int
{
    DRT_SECURE_RESOLVE             = 0x00000000,
    DRT_SECURE_MEMBERSHIP          = 0x00000001,
    DRT_SECURE_CONFIDENTIALPAYLOAD = 0x00000002,
}

alias DRT_REGISTRATION_STATE = int;
enum : int
{
    DRT_REGISTRATION_STATE_UNRESOLVEABLE = 0x00000001,
}

alias DRT_ADDRESS_FLAGS = int;
enum : int
{
    DRT_ADDRESS_FLAG_ACCEPTED                = 0x00000001,
    DRT_ADDRESS_FLAG_REJECTED                = 0x00000002,
    DRT_ADDRESS_FLAG_UNREACHABLE             = 0x00000004,
    DRT_ADDRESS_FLAG_LOOP                    = 0x00000008,
    DRT_ADDRESS_FLAG_TOO_BUSY                = 0x00000010,
    DRT_ADDRESS_FLAG_BAD_VALIDATE_ID         = 0x00000020,
    DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID = 0x00000040,
    DRT_ADDRESS_FLAG_INQUIRE                 = 0x00000080,
}

struct DRT_DATA
{
    uint cb;
    ubyte* pb;
}
struct DRT_REGISTRATION
{
    DRT_DATA key;
    DRT_DATA appData;
}
struct DRT_SECURITY_PROVIDER
{
    void* pvContext;
    long Attach;
    long Detach;
    long RegisterKey;
    long UnregisterKey;
    long ValidateAndUnpackPayload;
    long SecureAndPackPayload;
    long FreeData;
    long EncryptData;
    long DecryptData;
    long GetSerializedCredential;
    long ValidateRemoteCredential;
    long SignData;
    long VerifyData;
}
alias DRT_BOOTSTRAP_RESOLVE_CALLBACK = void function(HRESULT, void*, SOCKET_ADDRESS_LIST*, BOOL);
struct DRT_BOOTSTRAP_PROVIDER
{
    void* pvContext;
    long Attach;
    long Detach;
    long InitResolve;
    long IssueResolve;
    long EndResolve;
    long Register;
    long Unregister;
}
struct DRT_SETTINGS
{
    uint dwSize;
    uint cbKey;
    ubyte bProtocolMajorVersion;
    ubyte bProtocolMinorVersion;
    uint ulMaxRoutingAddresses;
    PWSTR pwzDrtInstancePrefix;
    void* hTransport;
    DRT_SECURITY_PROVIDER* pSecurityProvider;
    DRT_BOOTSTRAP_PROVIDER* pBootstrapProvider;
    DRT_SECURITY_MODE eSecurityMode;
}
struct DRT_SEARCH_INFO
{
    uint dwSize;
    BOOL fIterative;
    BOOL fAllowCurrentInstanceMatch;
    BOOL fAnyMatchInRange;
    uint cMaxEndpoints;
    DRT_DATA* pMaximumKey;
    DRT_DATA* pMinimumKey;
}
struct DRT_ADDRESS
{
    SOCKADDR_STORAGE socketAddress;
    uint flags;
    int nearness;
    uint latency;
}
struct DRT_ADDRESS_LIST
{
    uint AddressCount;
    DRT_ADDRESS[1] AddressList;
}
struct DRT_SEARCH_RESULT
{
    uint dwSize;
    DRT_MATCH_TYPE type;
    void* pvContext;
    DRT_REGISTRATION registration;
}
struct DRT_EVENT_DATA
{
    DRT_EVENT_TYPE type;
    HRESULT hr;
    void* pvContext;
    union
    {
        struct _leafsetKeyChange_e__Struct
        {
            DRT_LEAFSET_KEY_CHANGE_TYPE change;
            DRT_DATA localKey;
            DRT_DATA remoteKey;
        }
        struct _registrationStateChange_e__Struct
        {
            DRT_REGISTRATION_STATE state;
            DRT_DATA localKey;
        }
        struct _statusChange_e__Struct
        {
            DRT_STATUS status;
            struct _bootstrapAddresses_e__Struct
            {
                uint cntAddress;
                SOCKADDR_STORAGE* pAddresses;
            }
        }
    }
}
alias PEERDIST_STATUS = int;
enum : int
{
    PEERDIST_STATUS_DISABLED    = 0x00000000,
    PEERDIST_STATUS_UNAVAILABLE = 0x00000001,
    PEERDIST_STATUS_AVAILABLE   = 0x00000002,
}

struct PEERDIST_PUBLICATION_OPTIONS
{
    uint dwVersion;
    uint dwFlags;
}
struct PEERDIST_CONTENT_TAG
{
    ubyte[16] Data;
}
struct PEERDIST_RETRIEVAL_OPTIONS
{
    uint cbSize;
    uint dwContentInfoMinVersion;
    uint dwContentInfoMaxVersion;
    uint dwReserved;
}
struct PEERDIST_STATUS_INFO
{
    uint cbSize;
    PEERDIST_STATUS status;
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE dwMinVer;
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE dwMaxVer;
}
alias PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS = int;
enum : int
{
    PeerDistClientBasicInfo                 = 0x00000000,
    MaximumPeerDistClientInfoByHandlesClass = 0x00000001,
}

struct PEERDIST_CLIENT_BASIC_INFO
{
    BOOL fFlashCrowd;
}
