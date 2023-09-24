module windows.win32.networkmanagement.iphelper;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, HANDLE, PSTR, PWSTR, WIN32_ERROR;
import windows.win32.networkmanagement.ndis : IF_OPER_STATUS, NDIS_MEDIUM, NDIS_PHYSICAL_MEDIUM, NET_IF_ACCESS_TYPE, NET_IF_ADMIN_STATUS, NET_IF_CONNECTION_TYPE, NET_IF_DIRECTION_TYPE, NET_IF_MEDIA_CONNECT_STATE, NET_LUID_LH, TUNNEL_TYPE;
import windows.win32.networking.winsock : ADDRESS_FAMILY, IN6_ADDR, NL_BANDWIDTH_INFORMATION, NL_DAD_STATE, NL_INTERFACE_OFFLOAD_ROD, NL_LINK_LOCAL_ADDRESS_BEHAVIOR, NL_NEIGHBOR_STATE, NL_NETWORK_CONNECTIVITY_HINT, NL_PREFIX_ORIGIN, NL_ROUTER_DISCOVERY_BEHAVIOR, NL_ROUTE_ORIGIN, NL_ROUTE_PROTOCOL, NL_SUFFIX_ORIGIN, SCOPE_ID, SOCKADDR, SOCKADDR_IN, SOCKADDR_IN6, SOCKADDR_IN6_PAIR, SOCKADDR_INET, SOCKET_ADDRESS;
import windows.win32.system.io : OVERLAPPED, PIO_APC_ROUTINE;

version (Windows):
extern (Windows):

alias GET_ADAPTERS_ADDRESSES_FLAGS = uint;
enum : uint
{
    GAA_FLAG_SKIP_UNICAST                = 0x00000001,
    GAA_FLAG_SKIP_ANYCAST                = 0x00000002,
    GAA_FLAG_SKIP_MULTICAST              = 0x00000004,
    GAA_FLAG_SKIP_DNS_SERVER             = 0x00000008,
    GAA_FLAG_INCLUDE_PREFIX              = 0x00000010,
    GAA_FLAG_SKIP_FRIENDLY_NAME          = 0x00000020,
    GAA_FLAG_INCLUDE_WINS_INFO           = 0x00000040,
    GAA_FLAG_INCLUDE_GATEWAYS            = 0x00000080,
    GAA_FLAG_INCLUDE_ALL_INTERFACES      = 0x00000100,
    GAA_FLAG_INCLUDE_ALL_COMPARTMENTS    = 0x00000200,
    GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER = 0x00000400,
}

HANDLE IcmpCreateFile();
HANDLE Icmp6CreateFile();
BOOL IcmpCloseHandle(HANDLE);
uint IcmpSendEcho(HANDLE, uint, void*, ushort, IP_OPTION_INFORMATION*, void*, uint, uint);
uint IcmpSendEcho2(HANDLE, HANDLE, PIO_APC_ROUTINE, void*, uint, void*, ushort, IP_OPTION_INFORMATION*, void*, uint, uint);
uint IcmpSendEcho2Ex(HANDLE, HANDLE, PIO_APC_ROUTINE, void*, uint, uint, void*, ushort, IP_OPTION_INFORMATION*, void*, uint, uint);
uint Icmp6SendEcho2(HANDLE, HANDLE, PIO_APC_ROUTINE, void*, SOCKADDR_IN6*, SOCKADDR_IN6*, void*, ushort, IP_OPTION_INFORMATION*, void*, uint, uint);
uint IcmpParseReplies(void*, uint);
uint Icmp6ParseReplies(void*, uint);
uint GetNumberOfInterfaces(uint*);
uint GetIfEntry(MIB_IFROW*);
uint GetIfTable(MIB_IFTABLE*, uint*, BOOL);
uint GetIpAddrTable(MIB_IPADDRTABLE*, uint*, BOOL);
uint GetIpNetTable(MIB_IPNETTABLE*, uint*, BOOL);
uint GetIpForwardTable(MIB_IPFORWARDTABLE*, uint*, BOOL);
uint GetTcpTable(MIB_TCPTABLE*, uint*, BOOL);
uint GetExtendedTcpTable(void*, uint*, BOOL, uint, TCP_TABLE_CLASS, uint);
uint GetOwnerModuleFromTcpEntry(MIB_TCPROW_OWNER_MODULE*, TCPIP_OWNER_MODULE_INFO_CLASS, void*, uint*);
uint GetUdpTable(MIB_UDPTABLE*, uint*, BOOL);
uint GetExtendedUdpTable(void*, uint*, BOOL, uint, UDP_TABLE_CLASS, uint);
uint GetOwnerModuleFromUdpEntry(MIB_UDPROW_OWNER_MODULE*, TCPIP_OWNER_MODULE_INFO_CLASS, void*, uint*);
uint GetTcpTable2(MIB_TCPTABLE2*, uint*, BOOL);
uint GetTcp6Table(MIB_TCP6TABLE*, uint*, BOOL);
uint GetTcp6Table2(MIB_TCP6TABLE2*, uint*, BOOL);
uint GetPerTcpConnectionEStats(MIB_TCPROW_LH*, TCP_ESTATS_TYPE, ubyte*, uint, uint, ubyte*, uint, uint, ubyte*, uint, uint);
uint SetPerTcpConnectionEStats(MIB_TCPROW_LH*, TCP_ESTATS_TYPE, ubyte*, uint, uint, uint);
uint GetPerTcp6ConnectionEStats(MIB_TCP6ROW*, TCP_ESTATS_TYPE, ubyte*, uint, uint, ubyte*, uint, uint, ubyte*, uint, uint);
uint SetPerTcp6ConnectionEStats(MIB_TCP6ROW*, TCP_ESTATS_TYPE, ubyte*, uint, uint, uint);
uint GetOwnerModuleFromTcp6Entry(MIB_TCP6ROW_OWNER_MODULE*, TCPIP_OWNER_MODULE_INFO_CLASS, void*, uint*);
uint GetUdp6Table(MIB_UDP6TABLE*, uint*, BOOL);
uint GetOwnerModuleFromUdp6Entry(MIB_UDP6ROW_OWNER_MODULE*, TCPIP_OWNER_MODULE_INFO_CLASS, void*, uint*);
uint GetOwnerModuleFromPidAndInfo(uint, ulong*, TCPIP_OWNER_MODULE_INFO_CLASS, void*, uint*);
uint GetIpStatistics(MIB_IPSTATS_LH*);
uint GetIcmpStatistics(MIB_ICMP*);
uint GetTcpStatistics(MIB_TCPSTATS_LH*);
uint GetUdpStatistics(MIB_UDPSTATS*);
uint SetIpStatisticsEx(MIB_IPSTATS_LH*, uint);
uint GetIpStatisticsEx(MIB_IPSTATS_LH*, uint);
uint GetIcmpStatisticsEx(MIB_ICMP_EX_XPSP1*, uint);
uint GetTcpStatisticsEx(MIB_TCPSTATS_LH*, uint);
uint GetUdpStatisticsEx(MIB_UDPSTATS*, uint);
uint GetTcpStatisticsEx2(MIB_TCPSTATS2*, uint);
uint GetUdpStatisticsEx2(MIB_UDPSTATS2*, uint);
uint SetIfEntry(MIB_IFROW*);
uint CreateIpForwardEntry(MIB_IPFORWARDROW*);
uint SetIpForwardEntry(MIB_IPFORWARDROW*);
uint DeleteIpForwardEntry(MIB_IPFORWARDROW*);
uint SetIpStatistics(MIB_IPSTATS_LH*);
uint SetIpTTL(uint);
uint CreateIpNetEntry(MIB_IPNETROW_LH*);
uint SetIpNetEntry(MIB_IPNETROW_LH*);
uint DeleteIpNetEntry(MIB_IPNETROW_LH*);
uint FlushIpNetTable(uint);
uint CreateProxyArpEntry(uint, uint, uint);
uint DeleteProxyArpEntry(uint, uint, uint);
uint SetTcpEntry(MIB_TCPROW_LH*);
uint GetInterfaceInfo(IP_INTERFACE_INFO*, uint*);
uint GetUniDirectionalAdapterInfo(IP_UNIDIRECTIONAL_ADAPTER_ADDRESS*, uint*);
uint NhpAllocateAndGetInterfaceInfoFromStack(IP_INTERFACE_NAME_INFO_W2KSP1**, uint*, BOOL, HANDLE, uint);
uint GetBestInterface(uint, uint*);
uint GetBestInterfaceEx(SOCKADDR*, uint*);
uint GetBestRoute(uint, uint, MIB_IPFORWARDROW*);
uint NotifyAddrChange(HANDLE*, OVERLAPPED*);
uint NotifyRouteChange(HANDLE*, OVERLAPPED*);
BOOL CancelIPChangeNotify(OVERLAPPED*);
uint GetAdapterIndex(PWSTR, uint*);
uint AddIPAddress(uint, uint, uint, uint*, uint*);
uint DeleteIPAddress(uint);
WIN32_ERROR GetNetworkParams(FIXED_INFO_W2KSP1*, uint*);
uint GetAdaptersInfo(IP_ADAPTER_INFO*, uint*);
IP_ADAPTER_ORDER_MAP* GetAdapterOrderMap();
uint GetAdaptersAddresses(uint, GET_ADAPTERS_ADDRESSES_FLAGS, void*, IP_ADAPTER_ADDRESSES_LH*, uint*);
uint GetPerAdapterInfo(uint, IP_PER_ADAPTER_INFO_W2KSP1*, uint*);
uint GetInterfaceActiveTimestampCapabilities(const(NET_LUID_LH)*, INTERFACE_TIMESTAMP_CAPABILITIES*);
uint GetInterfaceSupportedTimestampCapabilities(const(NET_LUID_LH)*, INTERFACE_TIMESTAMP_CAPABILITIES*);
uint CaptureInterfaceHardwareCrossTimestamp(const(NET_LUID_LH)*, INTERFACE_HARDWARE_CROSSTIMESTAMP*);
uint RegisterInterfaceTimestampConfigChange(PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK, void*, HIFTIMESTAMPCHANGE*);
void UnregisterInterfaceTimestampConfigChange(HIFTIMESTAMPCHANGE);
uint GetInterfaceCurrentTimestampCapabilities(const(NET_LUID_LH)*, INTERFACE_TIMESTAMP_CAPABILITIES*);
uint GetInterfaceHardwareTimestampCapabilities(const(NET_LUID_LH)*, INTERFACE_TIMESTAMP_CAPABILITIES*);
uint NotifyIfTimestampConfigChange(void*, PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK, HIFTIMESTAMPCHANGE*);
void CancelIfTimestampConfigChange(HIFTIMESTAMPCHANGE);
uint IpReleaseAddress(IP_ADAPTER_INDEX_MAP*);
uint IpRenewAddress(IP_ADAPTER_INDEX_MAP*);
uint SendARP(uint, uint, void*, uint*);
BOOL GetRTTAndHopCount(uint, uint*, uint, uint*);
uint GetFriendlyIfIndex(uint);
uint EnableRouter(HANDLE*, OVERLAPPED*);
uint UnenableRouter(OVERLAPPED*, uint*);
uint DisableMediaSense(HANDLE*, OVERLAPPED*);
uint RestoreMediaSense(OVERLAPPED*, uint*);
uint GetIpErrorString(uint, PWSTR, uint*);
uint ResolveNeighbor(SOCKADDR*, void*, uint*);
uint CreatePersistentTcpPortReservation(ushort, ushort, ulong*);
uint CreatePersistentUdpPortReservation(ushort, ushort, ulong*);
uint DeletePersistentTcpPortReservation(ushort, ushort);
uint DeletePersistentUdpPortReservation(ushort, ushort);
uint LookupPersistentTcpPortReservation(ushort, ushort, ulong*);
uint LookupPersistentUdpPortReservation(ushort, ushort, ulong*);
uint ParseNetworkString(const(wchar)*, uint, NET_ADDRESS_INFO*, ushort*, ubyte*);
WIN32_ERROR GetIfEntry2(MIB_IF_ROW2*);
WIN32_ERROR GetIfEntry2Ex(MIB_IF_ENTRY_LEVEL, MIB_IF_ROW2*);
WIN32_ERROR GetIfTable2(MIB_IF_TABLE2**);
WIN32_ERROR GetIfTable2Ex(MIB_IF_TABLE_LEVEL, MIB_IF_TABLE2**);
WIN32_ERROR GetIfStackTable(MIB_IFSTACK_TABLE**);
WIN32_ERROR GetInvertedIfStackTable(MIB_INVERTEDIFSTACK_TABLE**);
WIN32_ERROR GetIpInterfaceEntry(MIB_IPINTERFACE_ROW*);
WIN32_ERROR GetIpInterfaceTable(ADDRESS_FAMILY, MIB_IPINTERFACE_TABLE**);
void InitializeIpInterfaceEntry(MIB_IPINTERFACE_ROW*);
WIN32_ERROR NotifyIpInterfaceChange(ADDRESS_FAMILY, PIPINTERFACE_CHANGE_CALLBACK, void*, BOOLEAN, HANDLE*);
WIN32_ERROR SetIpInterfaceEntry(MIB_IPINTERFACE_ROW*);
WIN32_ERROR GetIpNetworkConnectionBandwidthEstimates(uint, ADDRESS_FAMILY, MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES*);
WIN32_ERROR CreateUnicastIpAddressEntry(const(MIB_UNICASTIPADDRESS_ROW)*);
WIN32_ERROR DeleteUnicastIpAddressEntry(const(MIB_UNICASTIPADDRESS_ROW)*);
WIN32_ERROR GetUnicastIpAddressEntry(MIB_UNICASTIPADDRESS_ROW*);
WIN32_ERROR GetUnicastIpAddressTable(ADDRESS_FAMILY, MIB_UNICASTIPADDRESS_TABLE**);
void InitializeUnicastIpAddressEntry(MIB_UNICASTIPADDRESS_ROW*);
WIN32_ERROR NotifyUnicastIpAddressChange(ADDRESS_FAMILY, PUNICAST_IPADDRESS_CHANGE_CALLBACK, void*, BOOLEAN, HANDLE*);
WIN32_ERROR NotifyStableUnicastIpAddressTable(ADDRESS_FAMILY, MIB_UNICASTIPADDRESS_TABLE**, PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK, void*, HANDLE*);
WIN32_ERROR SetUnicastIpAddressEntry(const(MIB_UNICASTIPADDRESS_ROW)*);
WIN32_ERROR CreateAnycastIpAddressEntry(const(MIB_ANYCASTIPADDRESS_ROW)*);
WIN32_ERROR DeleteAnycastIpAddressEntry(const(MIB_ANYCASTIPADDRESS_ROW)*);
WIN32_ERROR GetAnycastIpAddressEntry(MIB_ANYCASTIPADDRESS_ROW*);
WIN32_ERROR GetAnycastIpAddressTable(ADDRESS_FAMILY, MIB_ANYCASTIPADDRESS_TABLE**);
WIN32_ERROR GetMulticastIpAddressEntry(MIB_MULTICASTIPADDRESS_ROW*);
WIN32_ERROR GetMulticastIpAddressTable(ADDRESS_FAMILY, MIB_MULTICASTIPADDRESS_TABLE**);
WIN32_ERROR CreateIpForwardEntry2(const(MIB_IPFORWARD_ROW2)*);
WIN32_ERROR DeleteIpForwardEntry2(const(MIB_IPFORWARD_ROW2)*);
WIN32_ERROR GetBestRoute2(NET_LUID_LH*, uint, const(SOCKADDR_INET)*, const(SOCKADDR_INET)*, uint, MIB_IPFORWARD_ROW2*, SOCKADDR_INET*);
WIN32_ERROR GetIpForwardEntry2(MIB_IPFORWARD_ROW2*);
WIN32_ERROR GetIpForwardTable2(ADDRESS_FAMILY, MIB_IPFORWARD_TABLE2**);
void InitializeIpForwardEntry(MIB_IPFORWARD_ROW2*);
WIN32_ERROR NotifyRouteChange2(ADDRESS_FAMILY, PIPFORWARD_CHANGE_CALLBACK, void*, BOOLEAN, HANDLE*);
WIN32_ERROR SetIpForwardEntry2(const(MIB_IPFORWARD_ROW2)*);
WIN32_ERROR FlushIpPathTable(ADDRESS_FAMILY);
WIN32_ERROR GetIpPathEntry(MIB_IPPATH_ROW*);
WIN32_ERROR GetIpPathTable(ADDRESS_FAMILY, MIB_IPPATH_TABLE**);
WIN32_ERROR CreateIpNetEntry2(const(MIB_IPNET_ROW2)*);
WIN32_ERROR DeleteIpNetEntry2(const(MIB_IPNET_ROW2)*);
WIN32_ERROR FlushIpNetTable2(ADDRESS_FAMILY, uint);
WIN32_ERROR GetIpNetEntry2(MIB_IPNET_ROW2*);
WIN32_ERROR GetIpNetTable2(ADDRESS_FAMILY, MIB_IPNET_TABLE2**);
WIN32_ERROR ResolveIpNetEntry2(MIB_IPNET_ROW2*, const(SOCKADDR_INET)*);
WIN32_ERROR SetIpNetEntry2(MIB_IPNET_ROW2*);
WIN32_ERROR NotifyTeredoPortChange(PTEREDO_PORT_CHANGE_CALLBACK, void*, BOOLEAN, HANDLE*);
WIN32_ERROR GetTeredoPort(ushort*);
WIN32_ERROR CancelMibChangeNotify2(HANDLE);
WIN32_ERROR FreeMibTable(void*);
WIN32_ERROR CreateSortedAddressPairs(const(SOCKADDR_IN6)*, uint, const(SOCKADDR_IN6)*, uint, uint, SOCKADDR_IN6_PAIR**, uint*);
WIN32_ERROR ConvertCompartmentGuidToId(const(GUID)*, uint*);
WIN32_ERROR ConvertCompartmentIdToGuid(uint, GUID*);
WIN32_ERROR ConvertInterfaceNameToLuidA(const(char)*, NET_LUID_LH*);
WIN32_ERROR ConvertInterfaceNameToLuidW(const(wchar)*, NET_LUID_LH*);
WIN32_ERROR ConvertInterfaceLuidToNameA(const(NET_LUID_LH)*, PSTR, ulong);
WIN32_ERROR ConvertInterfaceLuidToNameW(const(NET_LUID_LH)*, PWSTR, ulong);
WIN32_ERROR ConvertInterfaceLuidToIndex(const(NET_LUID_LH)*, uint*);
WIN32_ERROR ConvertInterfaceIndexToLuid(uint, NET_LUID_LH*);
WIN32_ERROR ConvertInterfaceLuidToAlias(const(NET_LUID_LH)*, PWSTR, ulong);
WIN32_ERROR ConvertInterfaceAliasToLuid(const(wchar)*, NET_LUID_LH*);
WIN32_ERROR ConvertInterfaceLuidToGuid(const(NET_LUID_LH)*, GUID*);
WIN32_ERROR ConvertInterfaceGuidToLuid(const(GUID)*, NET_LUID_LH*);
uint if_nametoindex(const(char)*);
PSTR if_indextoname(uint, PSTR);
WIN32_ERROR GetCurrentThreadCompartmentId();
WIN32_ERROR SetCurrentThreadCompartmentId(uint);
void GetCurrentThreadCompartmentScope(uint*, uint*);
WIN32_ERROR SetCurrentThreadCompartmentScope(uint);
uint GetJobCompartmentId(HANDLE);
WIN32_ERROR SetJobCompartmentId(HANDLE, uint);
WIN32_ERROR GetSessionCompartmentId(uint);
WIN32_ERROR SetSessionCompartmentId(uint, uint);
WIN32_ERROR GetDefaultCompartmentId();
WIN32_ERROR GetNetworkInformation(const(GUID)*, uint*, uint*, PWSTR, uint);
WIN32_ERROR SetNetworkInformation(const(GUID)*, uint, const(wchar)*);
WIN32_ERROR ConvertLengthToIpv4Mask(uint, uint*);
WIN32_ERROR ConvertIpv4MaskToLength(uint, ubyte*);
WIN32_ERROR GetDnsSettings(DNS_SETTINGS*);
void FreeDnsSettings(DNS_SETTINGS*);
WIN32_ERROR SetDnsSettings(const(DNS_SETTINGS)*);
WIN32_ERROR GetInterfaceDnsSettings(GUID, DNS_INTERFACE_SETTINGS*);
WIN32_ERROR FreeInterfaceDnsSettings(DNS_INTERFACE_SETTINGS*);
WIN32_ERROR SetInterfaceDnsSettings(GUID, const(DNS_INTERFACE_SETTINGS)*);
WIN32_ERROR GetNetworkConnectivityHint(NL_NETWORK_CONNECTIVITY_HINT*);
WIN32_ERROR GetNetworkConnectivityHintForInterface(uint, NL_NETWORK_CONNECTIVITY_HINT*);
WIN32_ERROR NotifyNetworkConnectivityHintChange(PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK, void*, BOOLEAN, HANDLE*);
uint PfCreateInterface(uint, PFFORWARD_ACTION, PFFORWARD_ACTION, BOOL, BOOL, void**);
uint PfDeleteInterface(void*);
uint PfAddFiltersToInterface(void*, uint, PF_FILTER_DESCRIPTOR*, uint, PF_FILTER_DESCRIPTOR*, void**);
uint PfRemoveFiltersFromInterface(void*, uint, PF_FILTER_DESCRIPTOR*, uint, PF_FILTER_DESCRIPTOR*);
uint PfRemoveFilterHandles(void*, uint, void**);
uint PfUnBindInterface(void*);
uint PfBindInterfaceToIndex(void*, uint, PFADDRESSTYPE, ubyte*);
uint PfBindInterfaceToIPAddress(void*, PFADDRESSTYPE, ubyte*);
uint PfRebindFilters(void*, PF_LATEBIND_INFO*);
uint PfAddGlobalFilterToInterface(void*, GLOBAL_FILTER);
uint PfRemoveGlobalFilterFromInterface(void*, GLOBAL_FILTER);
uint PfMakeLog(HANDLE);
uint PfSetLogBuffer(ubyte*, uint, uint, uint, uint*, uint*, uint*);
uint PfDeleteLog();
uint PfGetInterfaceStatistics(void*, PF_INTERFACE_STATS*, uint*, BOOL);
uint PfTestPacket(void*, void*, uint, ubyte*, PFFORWARD_ACTION*);
enum ANY_SIZE = 0x00000001;
enum MAXLEN_PHYSADDR = 0x00000008;
enum MAXLEN_IFDESCR = 0x00000100;
enum MAX_INTERFACE_NAME_LEN = 0x00000100;
enum MIN_IF_TYPE = 0x00000001;
enum IF_TYPE_OTHER = 0x00000001;
enum IF_TYPE_REGULAR_1822 = 0x00000002;
enum IF_TYPE_HDH_1822 = 0x00000003;
enum IF_TYPE_DDN_X25 = 0x00000004;
enum IF_TYPE_RFC877_X25 = 0x00000005;
enum IF_TYPE_ETHERNET_CSMACD = 0x00000006;
enum IF_TYPE_IS088023_CSMACD = 0x00000007;
enum IF_TYPE_ISO88024_TOKENBUS = 0x00000008;
enum IF_TYPE_ISO88025_TOKENRING = 0x00000009;
enum IF_TYPE_ISO88026_MAN = 0x0000000a;
enum IF_TYPE_STARLAN = 0x0000000b;
enum IF_TYPE_PROTEON_10MBIT = 0x0000000c;
enum IF_TYPE_PROTEON_80MBIT = 0x0000000d;
enum IF_TYPE_HYPERCHANNEL = 0x0000000e;
enum IF_TYPE_FDDI = 0x0000000f;
enum IF_TYPE_LAP_B = 0x00000010;
enum IF_TYPE_SDLC = 0x00000011;
enum IF_TYPE_DS1 = 0x00000012;
enum IF_TYPE_E1 = 0x00000013;
enum IF_TYPE_BASIC_ISDN = 0x00000014;
enum IF_TYPE_PRIMARY_ISDN = 0x00000015;
enum IF_TYPE_PROP_POINT2POINT_SERIAL = 0x00000016;
enum IF_TYPE_PPP = 0x00000017;
enum IF_TYPE_SOFTWARE_LOOPBACK = 0x00000018;
enum IF_TYPE_EON = 0x00000019;
enum IF_TYPE_ETHERNET_3MBIT = 0x0000001a;
enum IF_TYPE_NSIP = 0x0000001b;
enum IF_TYPE_SLIP = 0x0000001c;
enum IF_TYPE_ULTRA = 0x0000001d;
enum IF_TYPE_DS3 = 0x0000001e;
enum IF_TYPE_SIP = 0x0000001f;
enum IF_TYPE_FRAMERELAY = 0x00000020;
enum IF_TYPE_RS232 = 0x00000021;
enum IF_TYPE_PARA = 0x00000022;
enum IF_TYPE_ARCNET = 0x00000023;
enum IF_TYPE_ARCNET_PLUS = 0x00000024;
enum IF_TYPE_ATM = 0x00000025;
enum IF_TYPE_MIO_X25 = 0x00000026;
enum IF_TYPE_SONET = 0x00000027;
enum IF_TYPE_X25_PLE = 0x00000028;
enum IF_TYPE_ISO88022_LLC = 0x00000029;
enum IF_TYPE_LOCALTALK = 0x0000002a;
enum IF_TYPE_SMDS_DXI = 0x0000002b;
enum IF_TYPE_FRAMERELAY_SERVICE = 0x0000002c;
enum IF_TYPE_V35 = 0x0000002d;
enum IF_TYPE_HSSI = 0x0000002e;
enum IF_TYPE_HIPPI = 0x0000002f;
enum IF_TYPE_MODEM = 0x00000030;
enum IF_TYPE_AAL5 = 0x00000031;
enum IF_TYPE_SONET_PATH = 0x00000032;
enum IF_TYPE_SONET_VT = 0x00000033;
enum IF_TYPE_SMDS_ICIP = 0x00000034;
enum IF_TYPE_PROP_VIRTUAL = 0x00000035;
enum IF_TYPE_PROP_MULTIPLEXOR = 0x00000036;
enum IF_TYPE_IEEE80212 = 0x00000037;
enum IF_TYPE_FIBRECHANNEL = 0x00000038;
enum IF_TYPE_HIPPIINTERFACE = 0x00000039;
enum IF_TYPE_FRAMERELAY_INTERCONNECT = 0x0000003a;
enum IF_TYPE_AFLANE_8023 = 0x0000003b;
enum IF_TYPE_AFLANE_8025 = 0x0000003c;
enum IF_TYPE_CCTEMUL = 0x0000003d;
enum IF_TYPE_FASTETHER = 0x0000003e;
enum IF_TYPE_ISDN = 0x0000003f;
enum IF_TYPE_V11 = 0x00000040;
enum IF_TYPE_V36 = 0x00000041;
enum IF_TYPE_G703_64K = 0x00000042;
enum IF_TYPE_G703_2MB = 0x00000043;
enum IF_TYPE_QLLC = 0x00000044;
enum IF_TYPE_FASTETHER_FX = 0x00000045;
enum IF_TYPE_CHANNEL = 0x00000046;
enum IF_TYPE_IEEE80211 = 0x00000047;
enum IF_TYPE_IBM370PARCHAN = 0x00000048;
enum IF_TYPE_ESCON = 0x00000049;
enum IF_TYPE_DLSW = 0x0000004a;
enum IF_TYPE_ISDN_S = 0x0000004b;
enum IF_TYPE_ISDN_U = 0x0000004c;
enum IF_TYPE_LAP_D = 0x0000004d;
enum IF_TYPE_IPSWITCH = 0x0000004e;
enum IF_TYPE_RSRB = 0x0000004f;
enum IF_TYPE_ATM_LOGICAL = 0x00000050;
enum IF_TYPE_DS0 = 0x00000051;
enum IF_TYPE_DS0_BUNDLE = 0x00000052;
enum IF_TYPE_BSC = 0x00000053;
enum IF_TYPE_ASYNC = 0x00000054;
enum IF_TYPE_CNR = 0x00000055;
enum IF_TYPE_ISO88025R_DTR = 0x00000056;
enum IF_TYPE_EPLRS = 0x00000057;
enum IF_TYPE_ARAP = 0x00000058;
enum IF_TYPE_PROP_CNLS = 0x00000059;
enum IF_TYPE_HOSTPAD = 0x0000005a;
enum IF_TYPE_TERMPAD = 0x0000005b;
enum IF_TYPE_FRAMERELAY_MPI = 0x0000005c;
enum IF_TYPE_X213 = 0x0000005d;
enum IF_TYPE_ADSL = 0x0000005e;
enum IF_TYPE_RADSL = 0x0000005f;
enum IF_TYPE_SDSL = 0x00000060;
enum IF_TYPE_VDSL = 0x00000061;
enum IF_TYPE_ISO88025_CRFPRINT = 0x00000062;
enum IF_TYPE_MYRINET = 0x00000063;
enum IF_TYPE_VOICE_EM = 0x00000064;
enum IF_TYPE_VOICE_FXO = 0x00000065;
enum IF_TYPE_VOICE_FXS = 0x00000066;
enum IF_TYPE_VOICE_ENCAP = 0x00000067;
enum IF_TYPE_VOICE_OVERIP = 0x00000068;
enum IF_TYPE_ATM_DXI = 0x00000069;
enum IF_TYPE_ATM_FUNI = 0x0000006a;
enum IF_TYPE_ATM_IMA = 0x0000006b;
enum IF_TYPE_PPPMULTILINKBUNDLE = 0x0000006c;
enum IF_TYPE_IPOVER_CDLC = 0x0000006d;
enum IF_TYPE_IPOVER_CLAW = 0x0000006e;
enum IF_TYPE_STACKTOSTACK = 0x0000006f;
enum IF_TYPE_VIRTUALIPADDRESS = 0x00000070;
enum IF_TYPE_MPC = 0x00000071;
enum IF_TYPE_IPOVER_ATM = 0x00000072;
enum IF_TYPE_ISO88025_FIBER = 0x00000073;
enum IF_TYPE_TDLC = 0x00000074;
enum IF_TYPE_GIGABITETHERNET = 0x00000075;
enum IF_TYPE_HDLC = 0x00000076;
enum IF_TYPE_LAP_F = 0x00000077;
enum IF_TYPE_V37 = 0x00000078;
enum IF_TYPE_X25_MLP = 0x00000079;
enum IF_TYPE_X25_HUNTGROUP = 0x0000007a;
enum IF_TYPE_TRANSPHDLC = 0x0000007b;
enum IF_TYPE_INTERLEAVE = 0x0000007c;
enum IF_TYPE_FAST = 0x0000007d;
enum IF_TYPE_IP = 0x0000007e;
enum IF_TYPE_DOCSCABLE_MACLAYER = 0x0000007f;
enum IF_TYPE_DOCSCABLE_DOWNSTREAM = 0x00000080;
enum IF_TYPE_DOCSCABLE_UPSTREAM = 0x00000081;
enum IF_TYPE_A12MPPSWITCH = 0x00000082;
enum IF_TYPE_TUNNEL = 0x00000083;
enum IF_TYPE_COFFEE = 0x00000084;
enum IF_TYPE_CES = 0x00000085;
enum IF_TYPE_ATM_SUBINTERFACE = 0x00000086;
enum IF_TYPE_L2_VLAN = 0x00000087;
enum IF_TYPE_L3_IPVLAN = 0x00000088;
enum IF_TYPE_L3_IPXVLAN = 0x00000089;
enum IF_TYPE_DIGITALPOWERLINE = 0x0000008a;
enum IF_TYPE_MEDIAMAILOVERIP = 0x0000008b;
enum IF_TYPE_DTM = 0x0000008c;
enum IF_TYPE_DCN = 0x0000008d;
enum IF_TYPE_IPFORWARD = 0x0000008e;
enum IF_TYPE_MSDSL = 0x0000008f;
enum IF_TYPE_IEEE1394 = 0x00000090;
enum IF_TYPE_IF_GSN = 0x00000091;
enum IF_TYPE_DVBRCC_MACLAYER = 0x00000092;
enum IF_TYPE_DVBRCC_DOWNSTREAM = 0x00000093;
enum IF_TYPE_DVBRCC_UPSTREAM = 0x00000094;
enum IF_TYPE_ATM_VIRTUAL = 0x00000095;
enum IF_TYPE_MPLS_TUNNEL = 0x00000096;
enum IF_TYPE_SRP = 0x00000097;
enum IF_TYPE_VOICEOVERATM = 0x00000098;
enum IF_TYPE_VOICEOVERFRAMERELAY = 0x00000099;
enum IF_TYPE_IDSL = 0x0000009a;
enum IF_TYPE_COMPOSITELINK = 0x0000009b;
enum IF_TYPE_SS7_SIGLINK = 0x0000009c;
enum IF_TYPE_PROP_WIRELESS_P2P = 0x0000009d;
enum IF_TYPE_FR_FORWARD = 0x0000009e;
enum IF_TYPE_RFC1483 = 0x0000009f;
enum IF_TYPE_USB = 0x000000a0;
enum IF_TYPE_IEEE8023AD_LAG = 0x000000a1;
enum IF_TYPE_BGP_POLICY_ACCOUNTING = 0x000000a2;
enum IF_TYPE_FRF16_MFR_BUNDLE = 0x000000a3;
enum IF_TYPE_H323_GATEKEEPER = 0x000000a4;
enum IF_TYPE_H323_PROXY = 0x000000a5;
enum IF_TYPE_MPLS = 0x000000a6;
enum IF_TYPE_MF_SIGLINK = 0x000000a7;
enum IF_TYPE_HDSL2 = 0x000000a8;
enum IF_TYPE_SHDSL = 0x000000a9;
enum IF_TYPE_DS1_FDL = 0x000000aa;
enum IF_TYPE_POS = 0x000000ab;
enum IF_TYPE_DVB_ASI_IN = 0x000000ac;
enum IF_TYPE_DVB_ASI_OUT = 0x000000ad;
enum IF_TYPE_PLC = 0x000000ae;
enum IF_TYPE_NFAS = 0x000000af;
enum IF_TYPE_TR008 = 0x000000b0;
enum IF_TYPE_GR303_RDT = 0x000000b1;
enum IF_TYPE_GR303_IDT = 0x000000b2;
enum IF_TYPE_ISUP = 0x000000b3;
enum IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER = 0x000000b4;
enum IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM = 0x000000b5;
enum IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM = 0x000000b6;
enum IF_TYPE_HIPERLAN2 = 0x000000b7;
enum IF_TYPE_PROP_BWA_P2MP = 0x000000b8;
enum IF_TYPE_SONET_OVERHEAD_CHANNEL = 0x000000b9;
enum IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL = 0x000000ba;
enum IF_TYPE_AAL2 = 0x000000bb;
enum IF_TYPE_RADIO_MAC = 0x000000bc;
enum IF_TYPE_ATM_RADIO = 0x000000bd;
enum IF_TYPE_IMT = 0x000000be;
enum IF_TYPE_MVL = 0x000000bf;
enum IF_TYPE_REACH_DSL = 0x000000c0;
enum IF_TYPE_FR_DLCI_ENDPT = 0x000000c1;
enum IF_TYPE_ATM_VCI_ENDPT = 0x000000c2;
enum IF_TYPE_OPTICAL_CHANNEL = 0x000000c3;
enum IF_TYPE_OPTICAL_TRANSPORT = 0x000000c4;
enum IF_TYPE_IEEE80216_WMAN = 0x000000ed;
enum IF_TYPE_WWANPP = 0x000000f3;
enum IF_TYPE_WWANPP2 = 0x000000f4;
enum IF_TYPE_IEEE802154 = 0x00000103;
enum IF_TYPE_XBOX_WIRELESS = 0x00000119;
enum MAX_IF_TYPE = 0x00000119;
enum IF_CHECK_NONE = 0x00000000;
enum IF_CHECK_MCAST = 0x00000001;
enum IF_CHECK_SEND = 0x00000002;
enum IF_CONNECTION_DEDICATED = 0x00000001;
enum IF_CONNECTION_PASSIVE = 0x00000002;
enum IF_CONNECTION_DEMAND = 0x00000003;
enum IF_ADMIN_STATUS_UP = 0x00000001;
enum IF_ADMIN_STATUS_DOWN = 0x00000002;
enum IF_ADMIN_STATUS_TESTING = 0x00000003;
enum MIB_IF_TYPE_OTHER = 0x00000001;
enum MIB_IF_TYPE_ETHERNET = 0x00000006;
enum MIB_IF_TYPE_TOKENRING = 0x00000009;
enum MIB_IF_TYPE_FDDI = 0x0000000f;
enum MIB_IF_TYPE_PPP = 0x00000017;
enum MIB_IF_TYPE_LOOPBACK = 0x00000018;
enum MIB_IF_TYPE_SLIP = 0x0000001c;
enum MIB_IF_ADMIN_STATUS_UP = 0x00000001;
enum MIB_IF_ADMIN_STATUS_DOWN = 0x00000002;
enum MIB_IF_ADMIN_STATUS_TESTING = 0x00000003;
enum MIB_IPADDR_PRIMARY = 0x00000001;
enum MIB_IPADDR_DYNAMIC = 0x00000004;
enum MIB_IPADDR_DISCONNECTED = 0x00000008;
enum MIB_IPADDR_DELETED = 0x00000040;
enum MIB_IPADDR_TRANSIENT = 0x00000080;
enum MIB_IPADDR_DNS_ELIGIBLE = 0x00000100;
enum MIB_IPROUTE_METRIC_UNUSED = 0xffffffff;
enum MIB_USE_CURRENT_TTL = 0xffffffff;
enum MIB_USE_CURRENT_FORWARDING = 0xffffffff;
enum ICMP6_INFOMSG_MASK = 0x00000080;
enum IPRTRMGR_PID = 0x00002710;
enum IF_NUMBER = 0x00000000;
enum IF_TABLE = 0x00000001;
enum IF_ROW = 0x00000002;
enum IP_STATS = 0x00000003;
enum IP_ADDRTABLE = 0x00000004;
enum IP_ADDRROW = 0x00000005;
enum IP_FORWARDNUMBER = 0x00000006;
enum IP_FORWARDTABLE = 0x00000007;
enum IP_FORWARDROW = 0x00000008;
enum IP_NETTABLE = 0x00000009;
enum IP_NETROW = 0x0000000a;
enum ICMP_STATS = 0x0000000b;
enum TCP_STATS = 0x0000000c;
enum TCP_TABLE = 0x0000000d;
enum TCP_ROW = 0x0000000e;
enum UDP_STATS = 0x0000000f;
enum UDP_TABLE = 0x00000010;
enum UDP_ROW = 0x00000011;
enum MCAST_MFE = 0x00000012;
enum MCAST_MFE_STATS = 0x00000013;
enum BEST_IF = 0x00000014;
enum BEST_ROUTE = 0x00000015;
enum PROXY_ARP = 0x00000016;
enum MCAST_IF_ENTRY = 0x00000017;
enum MCAST_GLOBAL = 0x00000018;
enum IF_STATUS = 0x00000019;
enum MCAST_BOUNDARY = 0x0000001a;
enum MCAST_SCOPE = 0x0000001b;
enum DEST_MATCHING = 0x0000001c;
enum DEST_LONGER = 0x0000001d;
enum DEST_SHORTER = 0x0000001e;
enum ROUTE_MATCHING = 0x0000001f;
enum ROUTE_LONGER = 0x00000020;
enum ROUTE_SHORTER = 0x00000021;
enum ROUTE_STATE = 0x00000022;
enum MCAST_MFE_STATS_EX = 0x00000023;
enum IP6_STATS = 0x00000024;
enum UDP6_STATS = 0x00000025;
enum TCP6_STATS = 0x00000026;
enum NUMBER_OF_EXPORTED_VARIABLES = 0x00000027;
enum MAX_SCOPE_NAME_LEN = 0x000000ff;
enum MAX_MIB_OFFSET = 0x00000008;
enum MIB_INVALID_TEREDO_PORT_NUMBER = 0x00000000;
enum DNS_SETTINGS_VERSION1 = 0x00000001;
enum DNS_SETTINGS_VERSION2 = 0x00000002;
enum DNS_INTERFACE_SETTINGS_VERSION1 = 0x00000001;
enum DNS_INTERFACE_SETTINGS_VERSION2 = 0x00000002;
enum DNS_INTERFACE_SETTINGS_VERSION3 = 0x00000003;
enum DNS_INTERFACE_SETTINGS_VERSION4 = 0x00000004;
enum DNS_SETTING_IPV6 = 0x00000001;
enum DNS_SETTING_NAMESERVER = 0x00000002;
enum DNS_SETTING_SEARCHLIST = 0x00000004;
enum DNS_SETTING_REGISTRATION_ENABLED = 0x00000008;
enum DNS_SETTING_REGISTER_ADAPTER_NAME = 0x00000010;
enum DNS_SETTING_DOMAIN = 0x00000020;
enum DNS_SETTING_HOSTNAME = 0x00000040;
enum DNS_SETTINGS_ENABLE_LLMNR = 0x00000080;
enum DNS_SETTINGS_QUERY_ADAPTER_NAME = 0x00000100;
enum DNS_SETTING_PROFILE_NAMESERVER = 0x00000200;
enum DNS_SETTING_DISABLE_UNCONSTRAINED_QUERIES = 0x00000400;
enum DNS_SETTING_SUPPLEMENTAL_SEARCH_LIST = 0x00000800;
enum DNS_SETTING_DOH = 0x00001000;
enum DNS_SETTING_DOH_PROFILE = 0x00002000;
enum DNS_SETTING_ENCRYPTED_DNS_ADAPTER_FLAGS = 0x00004000;
enum DNS_SETTING_DDR = 0x00008000;
enum DNS_ENABLE_DOH = 0x00000001;
enum DNS_DOH_POLICY_NOT_CONFIGURED = 0x00000004;
enum DNS_DOH_POLICY_DISABLE = 0x00000008;
enum DNS_DOH_POLICY_AUTO = 0x00000010;
enum DNS_DOH_POLICY_REQUIRED = 0x00000020;
enum DNS_ENABLE_DDR = 0x00000040;
enum DNS_SERVER_PROPERTY_VERSION1 = 0x00000001;
enum DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO = 0x00000001;
enum DNS_DOH_SERVER_SETTINGS_ENABLE = 0x00000002;
enum DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP = 0x00000004;
enum DNS_DOH_AUTO_UPGRADE_SERVER = 0x00000008;
enum DNS_DOH_SERVER_SETTINGS_ENABLE_DDR = 0x00000010;
enum DNS_DDR_ADAPTER_ENABLE_DOH = 0x00000001;
enum DNS_DDR_ADAPTER_ENABLE_UDP_FALLBACK = 0x00000002;
enum TCPIP_OWNING_MODULE_SIZE = 0x00000010;
enum FILTER_ICMP_TYPE_ANY = 0xff;
enum FILTER_ICMP_CODE_ANY = 0xff;
enum FD_FLAGS_NOSYN = 0x00000001;
enum FD_FLAGS_ALLFLAGS = 0x00000001;
enum LB_SRC_ADDR_USE_SRCADDR_FLAG = 0x00000001;
enum LB_SRC_ADDR_USE_DSTADDR_FLAG = 0x00000002;
enum LB_DST_ADDR_USE_SRCADDR_FLAG = 0x00000004;
enum LB_DST_ADDR_USE_DSTADDR_FLAG = 0x00000008;
enum LB_SRC_MASK_LATE_FLAG = 0x00000010;
enum LB_DST_MASK_LATE_FLAG = 0x00000020;
enum ERROR_BASE = 0x000059d8;
enum PFERROR_NO_PF_INTERFACE = 0x000059d8;
enum PFERROR_NO_FILTERS_GIVEN = 0x000059d9;
enum PFERROR_BUFFER_TOO_SMALL = 0x000059da;
enum ERROR_IPV6_NOT_IMPLEMENTED = 0x000059db;
enum IP_EXPORT_INCLUDED = 0x00000001;
enum MAX_ADAPTER_NAME = 0x00000080;
enum IP_STATUS_BASE = 0x00002af8;
enum IP_SUCCESS = 0x00000000;
enum IP_BUF_TOO_SMALL = 0x00002af9;
enum IP_DEST_NET_UNREACHABLE = 0x00002afa;
enum IP_DEST_HOST_UNREACHABLE = 0x00002afb;
enum IP_DEST_PROT_UNREACHABLE = 0x00002afc;
enum IP_DEST_PORT_UNREACHABLE = 0x00002afd;
enum IP_NO_RESOURCES = 0x00002afe;
enum IP_BAD_OPTION = 0x00002aff;
enum IP_HW_ERROR = 0x00002b00;
enum IP_PACKET_TOO_BIG = 0x00002b01;
enum IP_REQ_TIMED_OUT = 0x00002b02;
enum IP_BAD_REQ = 0x00002b03;
enum IP_BAD_ROUTE = 0x00002b04;
enum IP_TTL_EXPIRED_TRANSIT = 0x00002b05;
enum IP_TTL_EXPIRED_REASSEM = 0x00002b06;
enum IP_PARAM_PROBLEM = 0x00002b07;
enum IP_SOURCE_QUENCH = 0x00002b08;
enum IP_OPTION_TOO_BIG = 0x00002b09;
enum IP_BAD_DESTINATION = 0x00002b0a;
enum IP_DEST_NO_ROUTE = 0x00002afa;
enum IP_DEST_ADDR_UNREACHABLE = 0x00002afb;
enum IP_DEST_PROHIBITED = 0x00002afc;
enum IP_HOP_LIMIT_EXCEEDED = 0x00002b05;
enum IP_REASSEMBLY_TIME_EXCEEDED = 0x00002b06;
enum IP_PARAMETER_PROBLEM = 0x00002b07;
enum IP_DEST_UNREACHABLE = 0x00002b20;
enum IP_TIME_EXCEEDED = 0x00002b21;
enum IP_BAD_HEADER = 0x00002b22;
enum IP_UNRECOGNIZED_NEXT_HEADER = 0x00002b23;
enum IP_ICMP_ERROR = 0x00002b24;
enum IP_DEST_SCOPE_MISMATCH = 0x00002b25;
enum IP_ADDR_DELETED = 0x00002b0b;
enum IP_SPEC_MTU_CHANGE = 0x00002b0c;
enum IP_MTU_CHANGE = 0x00002b0d;
enum IP_UNLOAD = 0x00002b0e;
enum IP_ADDR_ADDED = 0x00002b0f;
enum IP_MEDIA_CONNECT = 0x00002b10;
enum IP_MEDIA_DISCONNECT = 0x00002b11;
enum IP_BIND_ADAPTER = 0x00002b12;
enum IP_UNBIND_ADAPTER = 0x00002b13;
enum IP_DEVICE_DOES_NOT_EXIST = 0x00002b14;
enum IP_DUPLICATE_ADDRESS = 0x00002b15;
enum IP_INTERFACE_METRIC_CHANGE = 0x00002b16;
enum IP_RECONFIG_SECFLTR = 0x00002b17;
enum IP_NEGOTIATING_IPSEC = 0x00002b18;
enum IP_INTERFACE_WOL_CAPABILITY_CHANGE = 0x00002b19;
enum IP_DUPLICATE_IPADD = 0x00002b1a;
enum IP_GENERAL_FAILURE = 0x00002b2a;
enum MAX_IP_STATUS = 0x00002b2a;
enum IP_PENDING = 0x00002bf7;
enum IP_FLAG_REVERSE = 0x00000001;
enum IP_FLAG_DF = 0x00000002;
enum MAX_OPT_SIZE = 0x00000028;
enum IOCTL_IP_RTCHANGE_NOTIFY_REQUEST = 0x00000065;
enum IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST = 0x00000066;
enum IOCTL_ARP_SEND_REQUEST = 0x00000067;
enum IOCTL_IP_INTERFACE_INFO = 0x00000068;
enum IOCTL_IP_GET_BEST_INTERFACE = 0x00000069;
enum IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS = 0x0000006a;
enum INTERFACE_TIMESTAMP_CAPABILITIES_VERSION_1 = 0x00000001;
enum INTERFACE_HARDWARE_CROSSTIMESTAMP_VERSION_1 = 0x00000001;
enum NET_STRING_IPV4_ADDRESS = 0x00000001;
enum NET_STRING_IPV4_SERVICE = 0x00000002;
enum NET_STRING_IPV4_NETWORK = 0x00000004;
enum NET_STRING_IPV6_ADDRESS = 0x00000008;
enum NET_STRING_IPV6_ADDRESS_NO_SCOPE = 0x00000010;
enum NET_STRING_IPV6_SERVICE = 0x00000020;
enum NET_STRING_IPV6_SERVICE_NO_SCOPE = 0x00000040;
enum NET_STRING_IPV6_NETWORK = 0x00000080;
enum NET_STRING_NAMED_ADDRESS = 0x00000100;
enum NET_STRING_NAMED_SERVICE = 0x00000200;
enum MAX_ADAPTER_DESCRIPTION_LENGTH = 0x00000080;
enum MAX_ADAPTER_NAME_LENGTH = 0x00000100;
enum MAX_ADAPTER_ADDRESS_LENGTH = 0x00000008;
enum DEFAULT_MINIMUM_ENTITIES = 0x00000020;
enum MAX_HOSTNAME_LEN = 0x00000080;
enum MAX_DOMAIN_NAME_LEN = 0x00000080;
enum MAX_SCOPE_ID_LEN = 0x00000100;
enum MAX_DHCPV6_DUID_LENGTH = 0x00000082;
enum MAX_DNS_SUFFIX_STRING_LENGTH = 0x00000100;
enum BROADCAST_NODETYPE = 0x00000001;
enum PEER_TO_PEER_NODETYPE = 0x00000002;
enum MIXED_NODETYPE = 0x00000004;
enum HYBRID_NODETYPE = 0x00000008;
enum IP_ADAPTER_ADDRESS_DNS_ELIGIBLE = 0x00000001;
enum IP_ADAPTER_ADDRESS_TRANSIENT = 0x00000002;
enum IP_ADAPTER_DDNS_ENABLED = 0x00000001;
enum IP_ADAPTER_REGISTER_ADAPTER_SUFFIX = 0x00000002;
enum IP_ADAPTER_DHCP_ENABLED = 0x00000004;
enum IP_ADAPTER_RECEIVE_ONLY = 0x00000008;
enum IP_ADAPTER_NO_MULTICAST = 0x00000010;
enum IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG = 0x00000020;
enum IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED = 0x00000040;
enum IP_ADAPTER_IPV4_ENABLED = 0x00000080;
enum IP_ADAPTER_IPV6_ENABLED = 0x00000100;
enum IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG = 0x00000200;
enum GAA_FLAG_SKIP_DNS_INFO = 0x00000800;
enum IP_ROUTER_MANAGER_VERSION = 0x00000001;
enum IP_GENERAL_INFO_BASE = 0xffff0000;
enum IP_IN_FILTER_INFO = 0xffff0001;
enum IP_OUT_FILTER_INFO = 0xffff0002;
enum IP_GLOBAL_INFO = 0xffff0003;
enum IP_INTERFACE_STATUS_INFO = 0xffff0004;
enum IP_ROUTE_INFO = 0xffff0005;
enum IP_PROT_PRIORITY_INFO = 0xffff0006;
enum IP_ROUTER_DISC_INFO = 0xffff0007;
enum IP_DEMAND_DIAL_FILTER_INFO = 0xffff0009;
enum IP_MCAST_HEARBEAT_INFO = 0xffff000a;
enum IP_MCAST_BOUNDARY_INFO = 0xffff000b;
enum IP_IPINIP_CFG_INFO = 0xffff000c;
enum IP_IFFILTER_INFO = 0xffff000d;
enum IP_MCAST_LIMIT_INFO = 0xffff000e;
enum IPV6_GLOBAL_INFO = 0xffff000f;
enum IPV6_ROUTE_INFO = 0xffff0010;
enum IP_IN_FILTER_INFO_V6 = 0xffff0011;
enum IP_OUT_FILTER_INFO_V6 = 0xffff0012;
enum IP_DEMAND_DIAL_FILTER_INFO_V6 = 0xffff0013;
enum IP_IFFILTER_INFO_V6 = 0xffff0014;
enum IP_FILTER_ENABLE_INFO = 0xffff0015;
enum IP_FILTER_ENABLE_INFO_V6 = 0xffff0016;
enum IP_PROT_PRIORITY_INFO_EX = 0xffff0017;
alias HIFTIMESTAMPCHANGE = void*;
struct IP_OPTION_INFORMATION32
{
    ubyte Ttl;
    ubyte Tos;
    ubyte Flags;
    ubyte OptionsSize;
    ubyte* OptionsData;
}
struct ICMP_ECHO_REPLY32
{
    uint Address;
    uint Status;
    uint RoundTripTime;
    ushort DataSize;
    ushort Reserved;
    void* Data;
    IP_OPTION_INFORMATION32 Options;
}
struct IP_OPTION_INFORMATION
{
    ubyte Ttl;
    ubyte Tos;
    ubyte Flags;
    ubyte OptionsSize;
    ubyte* OptionsData;
}
struct ICMP_ECHO_REPLY
{
    uint Address;
    uint Status;
    uint RoundTripTime;
    ushort DataSize;
    ushort Reserved;
    void* Data;
    IP_OPTION_INFORMATION Options;
}
struct IPV6_ADDRESS_EX
{
    align (1):
    ushort sin6_port;
    uint sin6_flowinfo;
    ushort[8] sin6_addr;
    uint sin6_scope_id;
}
struct ICMPV6_ECHO_REPLY_LH
{
    IPV6_ADDRESS_EX Address;
    uint Status;
    uint RoundTripTime;
}
struct ARP_SEND_REPLY
{
    uint DestAddress;
    uint SrcAddress;
}
struct TCP_RESERVE_PORT_RANGE
{
    ushort UpperRange;
    ushort LowerRange;
}
struct IP_ADAPTER_INDEX_MAP
{
    uint Index;
    wchar[128] Name;
}
struct IP_INTERFACE_INFO
{
    int NumAdapters;
    IP_ADAPTER_INDEX_MAP[1] Adapter;
}
struct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS
{
    uint NumAdapters;
    uint[1] Address;
}
struct IP_ADAPTER_ORDER_MAP
{
    uint NumAdapters;
    uint[1] AdapterOrder;
}
struct IP_MCAST_COUNTER_INFO
{
    ulong InMcastOctets;
    ulong OutMcastOctets;
    ulong InMcastPkts;
    ulong OutMcastPkts;
}
alias IF_ACCESS_TYPE = int;
enum : int
{
    IF_ACCESS_LOOPBACK             = 0x00000001,
    IF_ACCESS_BROADCAST            = 0x00000002,
    IF_ACCESS_POINT_TO_POINT       = 0x00000003,
    IF_ACCESS_POINTTOPOINT         = 0x00000003,
    IF_ACCESS_POINT_TO_MULTI_POINT = 0x00000004,
    IF_ACCESS_POINTTOMULTIPOINT    = 0x00000004,
}

alias INTERNAL_IF_OPER_STATUS = int;
enum : int
{
    IF_OPER_STATUS_NON_OPERATIONAL = 0x00000000,
    IF_OPER_STATUS_UNREACHABLE     = 0x00000001,
    IF_OPER_STATUS_DISCONNECTED    = 0x00000002,
    IF_OPER_STATUS_CONNECTING      = 0x00000003,
    IF_OPER_STATUS_CONNECTED       = 0x00000004,
    IF_OPER_STATUS_OPERATIONAL     = 0x00000005,
}

struct MIB_OPAQUE_QUERY
{
    uint dwVarId;
    uint[1] rgdwVarIndex;
}
struct MIB_IFNUMBER
{
    uint dwValue;
}
struct MIB_IFROW
{
    wchar[256] wszName;
    uint dwIndex;
    uint dwType;
    uint dwMtu;
    uint dwSpeed;
    uint dwPhysAddrLen;
    ubyte[8] bPhysAddr;
    uint dwAdminStatus;
    INTERNAL_IF_OPER_STATUS dwOperStatus;
    uint dwLastChange;
    uint dwInOctets;
    uint dwInUcastPkts;
    uint dwInNUcastPkts;
    uint dwInDiscards;
    uint dwInErrors;
    uint dwInUnknownProtos;
    uint dwOutOctets;
    uint dwOutUcastPkts;
    uint dwOutNUcastPkts;
    uint dwOutDiscards;
    uint dwOutErrors;
    uint dwOutQLen;
    uint dwDescrLen;
    ubyte[256] bDescr;
}
struct MIB_IFTABLE
{
    uint dwNumEntries;
    MIB_IFROW[1] table;
}
struct MIB_IPADDRROW_XP
{
    uint dwAddr;
    uint dwIndex;
    uint dwMask;
    uint dwBCastAddr;
    uint dwReasmSize;
    ushort unused1;
    ushort wType;
}
struct MIB_IPADDRROW_W2K
{
    uint dwAddr;
    uint dwIndex;
    uint dwMask;
    uint dwBCastAddr;
    uint dwReasmSize;
    ushort unused1;
    ushort unused2;
}
struct MIB_IPADDRTABLE
{
    uint dwNumEntries;
    MIB_IPADDRROW_XP[1] table;
}
struct MIB_IPFORWARDNUMBER
{
    uint dwValue;
}
alias MIB_IPFORWARD_TYPE = int;
enum : int
{
    MIB_IPROUTE_TYPE_OTHER    = 0x00000001,
    MIB_IPROUTE_TYPE_INVALID  = 0x00000002,
    MIB_IPROUTE_TYPE_DIRECT   = 0x00000003,
    MIB_IPROUTE_TYPE_INDIRECT = 0x00000004,
}

struct MIB_IPFORWARDROW
{
    uint dwForwardDest;
    uint dwForwardMask;
    uint dwForwardPolicy;
    uint dwForwardNextHop;
    uint dwForwardIfIndex;
    union
    {
        uint dwForwardType;
        MIB_IPFORWARD_TYPE ForwardType;
    }
    union
    {
        uint dwForwardProto;
        NL_ROUTE_PROTOCOL ForwardProto;
    }
    uint dwForwardAge;
    uint dwForwardNextHopAS;
    uint dwForwardMetric1;
    uint dwForwardMetric2;
    uint dwForwardMetric3;
    uint dwForwardMetric4;
    uint dwForwardMetric5;
}
struct MIB_IPFORWARDTABLE
{
    uint dwNumEntries;
    MIB_IPFORWARDROW[1] table;
}
alias MIB_IPNET_TYPE = int;
enum : int
{
    MIB_IPNET_TYPE_OTHER   = 0x00000001,
    MIB_IPNET_TYPE_INVALID = 0x00000002,
    MIB_IPNET_TYPE_DYNAMIC = 0x00000003,
    MIB_IPNET_TYPE_STATIC  = 0x00000004,
}

struct MIB_IPNETROW_LH
{
    uint dwIndex;
    uint dwPhysAddrLen;
    ubyte[8] bPhysAddr;
    uint dwAddr;
    union
    {
        uint dwType;
        MIB_IPNET_TYPE Type;
    }
}
struct MIB_IPNETROW_W2K
{
    uint dwIndex;
    uint dwPhysAddrLen;
    ubyte[8] bPhysAddr;
    uint dwAddr;
    uint dwType;
}
struct MIB_IPNETTABLE
{
    uint dwNumEntries;
    MIB_IPNETROW_LH[1] table;
}
alias MIB_IPSTATS_FORWARDING = int;
enum : int
{
    MIB_IP_FORWARDING     = 0x00000001,
    MIB_IP_NOT_FORWARDING = 0x00000002,
}

struct MIB_IPSTATS_LH
{
    union
    {
        uint dwForwarding;
        MIB_IPSTATS_FORWARDING Forwarding;
    }
    uint dwDefaultTTL;
    uint dwInReceives;
    uint dwInHdrErrors;
    uint dwInAddrErrors;
    uint dwForwDatagrams;
    uint dwInUnknownProtos;
    uint dwInDiscards;
    uint dwInDelivers;
    uint dwOutRequests;
    uint dwRoutingDiscards;
    uint dwOutDiscards;
    uint dwOutNoRoutes;
    uint dwReasmTimeout;
    uint dwReasmReqds;
    uint dwReasmOks;
    uint dwReasmFails;
    uint dwFragOks;
    uint dwFragFails;
    uint dwFragCreates;
    uint dwNumIf;
    uint dwNumAddr;
    uint dwNumRoutes;
}
struct MIB_IPSTATS_W2K
{
    uint dwForwarding;
    uint dwDefaultTTL;
    uint dwInReceives;
    uint dwInHdrErrors;
    uint dwInAddrErrors;
    uint dwForwDatagrams;
    uint dwInUnknownProtos;
    uint dwInDiscards;
    uint dwInDelivers;
    uint dwOutRequests;
    uint dwRoutingDiscards;
    uint dwOutDiscards;
    uint dwOutNoRoutes;
    uint dwReasmTimeout;
    uint dwReasmReqds;
    uint dwReasmOks;
    uint dwReasmFails;
    uint dwFragOks;
    uint dwFragFails;
    uint dwFragCreates;
    uint dwNumIf;
    uint dwNumAddr;
    uint dwNumRoutes;
}
struct MIBICMPSTATS
{
    uint dwMsgs;
    uint dwErrors;
    uint dwDestUnreachs;
    uint dwTimeExcds;
    uint dwParmProbs;
    uint dwSrcQuenchs;
    uint dwRedirects;
    uint dwEchos;
    uint dwEchoReps;
    uint dwTimestamps;
    uint dwTimestampReps;
    uint dwAddrMasks;
    uint dwAddrMaskReps;
}
struct MIBICMPINFO
{
    MIBICMPSTATS icmpInStats;
    MIBICMPSTATS icmpOutStats;
}
struct MIB_ICMP
{
    MIBICMPINFO stats;
}
struct MIBICMPSTATS_EX_XPSP1
{
    uint dwMsgs;
    uint dwErrors;
    uint[256] rgdwTypeCount;
}
struct MIB_ICMP_EX_XPSP1
{
    MIBICMPSTATS_EX_XPSP1 icmpInStats;
    MIBICMPSTATS_EX_XPSP1 icmpOutStats;
}
alias ICMP6_TYPE = int;
enum : int
{
    ICMP6_DST_UNREACH          = 0x00000001,
    ICMP6_PACKET_TOO_BIG       = 0x00000002,
    ICMP6_TIME_EXCEEDED        = 0x00000003,
    ICMP6_PARAM_PROB           = 0x00000004,
    ICMP6_ECHO_REQUEST         = 0x00000080,
    ICMP6_ECHO_REPLY           = 0x00000081,
    ICMP6_MEMBERSHIP_QUERY     = 0x00000082,
    ICMP6_MEMBERSHIP_REPORT    = 0x00000083,
    ICMP6_MEMBERSHIP_REDUCTION = 0x00000084,
    ND_ROUTER_SOLICIT          = 0x00000085,
    ND_ROUTER_ADVERT           = 0x00000086,
    ND_NEIGHBOR_SOLICIT        = 0x00000087,
    ND_NEIGHBOR_ADVERT         = 0x00000088,
    ND_REDIRECT                = 0x00000089,
    ICMP6_V2_MEMBERSHIP_REPORT = 0x0000008f,
}

alias ICMP4_TYPE = int;
enum : int
{
    ICMP4_ECHO_REPLY        = 0x00000000,
    ICMP4_DST_UNREACH       = 0x00000003,
    ICMP4_SOURCE_QUENCH     = 0x00000004,
    ICMP4_REDIRECT          = 0x00000005,
    ICMP4_ECHO_REQUEST      = 0x00000008,
    ICMP4_ROUTER_ADVERT     = 0x00000009,
    ICMP4_ROUTER_SOLICIT    = 0x0000000a,
    ICMP4_TIME_EXCEEDED     = 0x0000000b,
    ICMP4_PARAM_PROB        = 0x0000000c,
    ICMP4_TIMESTAMP_REQUEST = 0x0000000d,
    ICMP4_TIMESTAMP_REPLY   = 0x0000000e,
    ICMP4_MASK_REQUEST      = 0x00000011,
    ICMP4_MASK_REPLY        = 0x00000012,
}

struct MIB_IPMCAST_OIF_XP
{
    uint dwOutIfIndex;
    uint dwNextHopAddr;
    uint dwReserved;
    uint dwReserved1;
}
struct MIB_IPMCAST_OIF_W2K
{
    uint dwOutIfIndex;
    uint dwNextHopAddr;
    void* pvReserved;
    uint dwReserved;
}
struct MIB_IPMCAST_MFE
{
    uint dwGroup;
    uint dwSource;
    uint dwSrcMask;
    uint dwUpStrmNgbr;
    uint dwInIfIndex;
    uint dwInIfProtocol;
    uint dwRouteProtocol;
    uint dwRouteNetwork;
    uint dwRouteMask;
    uint ulUpTime;
    uint ulExpiryTime;
    uint ulTimeOut;
    uint ulNumOutIf;
    uint fFlags;
    uint dwReserved;
    MIB_IPMCAST_OIF_XP[1] rgmioOutInfo;
}
struct MIB_MFE_TABLE
{
    uint dwNumEntries;
    MIB_IPMCAST_MFE[1] table;
}
struct MIB_IPMCAST_OIF_STATS_LH
{
    uint dwOutIfIndex;
    uint dwNextHopAddr;
    uint dwDialContext;
    uint ulTtlTooLow;
    uint ulFragNeeded;
    uint ulOutPackets;
    uint ulOutDiscards;
}
struct MIB_IPMCAST_OIF_STATS_W2K
{
    uint dwOutIfIndex;
    uint dwNextHopAddr;
    void* pvDialContext;
    uint ulTtlTooLow;
    uint ulFragNeeded;
    uint ulOutPackets;
    uint ulOutDiscards;
}
struct MIB_IPMCAST_MFE_STATS
{
    uint dwGroup;
    uint dwSource;
    uint dwSrcMask;
    uint dwUpStrmNgbr;
    uint dwInIfIndex;
    uint dwInIfProtocol;
    uint dwRouteProtocol;
    uint dwRouteNetwork;
    uint dwRouteMask;
    uint ulUpTime;
    uint ulExpiryTime;
    uint ulNumOutIf;
    uint ulInPkts;
    uint ulInOctets;
    uint ulPktsDifferentIf;
    uint ulQueueOverflow;
    MIB_IPMCAST_OIF_STATS_LH[1] rgmiosOutStats;
}
struct MIB_MFE_STATS_TABLE
{
    uint dwNumEntries;
    MIB_IPMCAST_MFE_STATS[1] table;
}
struct MIB_IPMCAST_MFE_STATS_EX_XP
{
    uint dwGroup;
    uint dwSource;
    uint dwSrcMask;
    uint dwUpStrmNgbr;
    uint dwInIfIndex;
    uint dwInIfProtocol;
    uint dwRouteProtocol;
    uint dwRouteNetwork;
    uint dwRouteMask;
    uint ulUpTime;
    uint ulExpiryTime;
    uint ulNumOutIf;
    uint ulInPkts;
    uint ulInOctets;
    uint ulPktsDifferentIf;
    uint ulQueueOverflow;
    uint ulUninitMfe;
    uint ulNegativeMfe;
    uint ulInDiscards;
    uint ulInHdrErrors;
    uint ulTotalOutPackets;
    MIB_IPMCAST_OIF_STATS_LH[1] rgmiosOutStats;
}
struct MIB_MFE_STATS_TABLE_EX_XP
{
    uint dwNumEntries;
    MIB_IPMCAST_MFE_STATS_EX_XP*[1] table;
}
struct MIB_IPMCAST_GLOBAL
{
    uint dwEnable;
}
struct MIB_IPMCAST_IF_ENTRY
{
    uint dwIfIndex;
    uint dwTtl;
    uint dwProtocol;
    uint dwRateLimit;
    uint ulInMcastOctets;
    uint ulOutMcastOctets;
}
struct MIB_IPMCAST_IF_TABLE
{
    uint dwNumEntries;
    MIB_IPMCAST_IF_ENTRY[1] table;
}
alias MIB_TCP_STATE = int;
enum : int
{
    MIB_TCP_STATE_CLOSED     = 0x00000001,
    MIB_TCP_STATE_LISTEN     = 0x00000002,
    MIB_TCP_STATE_SYN_SENT   = 0x00000003,
    MIB_TCP_STATE_SYN_RCVD   = 0x00000004,
    MIB_TCP_STATE_ESTAB      = 0x00000005,
    MIB_TCP_STATE_FIN_WAIT1  = 0x00000006,
    MIB_TCP_STATE_FIN_WAIT2  = 0x00000007,
    MIB_TCP_STATE_CLOSE_WAIT = 0x00000008,
    MIB_TCP_STATE_CLOSING    = 0x00000009,
    MIB_TCP_STATE_LAST_ACK   = 0x0000000a,
    MIB_TCP_STATE_TIME_WAIT  = 0x0000000b,
    MIB_TCP_STATE_DELETE_TCB = 0x0000000c,
    MIB_TCP_STATE_RESERVED   = 0x00000064,
}

alias TCP_CONNECTION_OFFLOAD_STATE = int;
enum : int
{
    TcpConnectionOffloadStateInHost     = 0x00000000,
    TcpConnectionOffloadStateOffloading = 0x00000001,
    TcpConnectionOffloadStateOffloaded  = 0x00000002,
    TcpConnectionOffloadStateUploading  = 0x00000003,
    TcpConnectionOffloadStateMax        = 0x00000004,
}

struct MIB_TCPROW_LH
{
    union
    {
        uint dwState;
        MIB_TCP_STATE State;
    }
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwRemoteAddr;
    uint dwRemotePort;
}
struct MIB_TCPROW_W2K
{
    uint dwState;
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwRemoteAddr;
    uint dwRemotePort;
}
struct MIB_TCPTABLE
{
    uint dwNumEntries;
    MIB_TCPROW_LH[1] table;
}
struct MIB_TCPROW2
{
    uint dwState;
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwRemoteAddr;
    uint dwRemotePort;
    uint dwOwningPid;
    TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
}
struct MIB_TCPTABLE2
{
    uint dwNumEntries;
    MIB_TCPROW2[1] table;
}
struct MIB_TCPROW_OWNER_PID
{
    uint dwState;
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwRemoteAddr;
    uint dwRemotePort;
    uint dwOwningPid;
}
struct MIB_TCPTABLE_OWNER_PID
{
    uint dwNumEntries;
    MIB_TCPROW_OWNER_PID[1] table;
}
struct MIB_TCPROW_OWNER_MODULE
{
    uint dwState;
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwRemoteAddr;
    uint dwRemotePort;
    uint dwOwningPid;
    long liCreateTimestamp;
    ulong[16] OwningModuleInfo;
}
struct MIB_TCPTABLE_OWNER_MODULE
{
    uint dwNumEntries;
    MIB_TCPROW_OWNER_MODULE[1] table;
}
struct MIB_TCP6ROW
{
    MIB_TCP_STATE State;
    IN6_ADDR LocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    IN6_ADDR RemoteAddr;
    uint dwRemoteScopeId;
    uint dwRemotePort;
}
struct MIB_TCP6TABLE
{
    uint dwNumEntries;
    MIB_TCP6ROW[1] table;
}
struct MIB_TCP6ROW2
{
    IN6_ADDR LocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    IN6_ADDR RemoteAddr;
    uint dwRemoteScopeId;
    uint dwRemotePort;
    MIB_TCP_STATE State;
    uint dwOwningPid;
    TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
}
struct MIB_TCP6TABLE2
{
    uint dwNumEntries;
    MIB_TCP6ROW2[1] table;
}
struct MIB_TCP6ROW_OWNER_PID
{
    ubyte[16] ucLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    ubyte[16] ucRemoteAddr;
    uint dwRemoteScopeId;
    uint dwRemotePort;
    uint dwState;
    uint dwOwningPid;
}
struct MIB_TCP6TABLE_OWNER_PID
{
    uint dwNumEntries;
    MIB_TCP6ROW_OWNER_PID[1] table;
}
struct MIB_TCP6ROW_OWNER_MODULE
{
    ubyte[16] ucLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    ubyte[16] ucRemoteAddr;
    uint dwRemoteScopeId;
    uint dwRemotePort;
    uint dwState;
    uint dwOwningPid;
    long liCreateTimestamp;
    ulong[16] OwningModuleInfo;
}
struct MIB_TCP6TABLE_OWNER_MODULE
{
    uint dwNumEntries;
    MIB_TCP6ROW_OWNER_MODULE[1] table;
}
alias TCP_RTO_ALGORITHM = int;
enum : int
{
    TcpRtoAlgorithmOther    = 0x00000001,
    TcpRtoAlgorithmConstant = 0x00000002,
    TcpRtoAlgorithmRsre     = 0x00000003,
    TcpRtoAlgorithmVanj     = 0x00000004,
    MIB_TCP_RTO_OTHER       = 0x00000001,
    MIB_TCP_RTO_CONSTANT    = 0x00000002,
    MIB_TCP_RTO_RSRE        = 0x00000003,
    MIB_TCP_RTO_VANJ        = 0x00000004,
}

struct MIB_TCPSTATS_LH
{
    union
    {
        uint dwRtoAlgorithm;
        TCP_RTO_ALGORITHM RtoAlgorithm;
    }
    uint dwRtoMin;
    uint dwRtoMax;
    uint dwMaxConn;
    uint dwActiveOpens;
    uint dwPassiveOpens;
    uint dwAttemptFails;
    uint dwEstabResets;
    uint dwCurrEstab;
    uint dwInSegs;
    uint dwOutSegs;
    uint dwRetransSegs;
    uint dwInErrs;
    uint dwOutRsts;
    uint dwNumConns;
}
struct MIB_TCPSTATS_W2K
{
    uint dwRtoAlgorithm;
    uint dwRtoMin;
    uint dwRtoMax;
    uint dwMaxConn;
    uint dwActiveOpens;
    uint dwPassiveOpens;
    uint dwAttemptFails;
    uint dwEstabResets;
    uint dwCurrEstab;
    uint dwInSegs;
    uint dwOutSegs;
    uint dwRetransSegs;
    uint dwInErrs;
    uint dwOutRsts;
    uint dwNumConns;
}
struct MIB_TCPSTATS2
{
    TCP_RTO_ALGORITHM RtoAlgorithm;
    uint dwRtoMin;
    uint dwRtoMax;
    uint dwMaxConn;
    uint dwActiveOpens;
    uint dwPassiveOpens;
    uint dwAttemptFails;
    uint dwEstabResets;
    uint dwCurrEstab;
    ulong dw64InSegs;
    ulong dw64OutSegs;
    uint dwRetransSegs;
    uint dwInErrs;
    uint dwOutRsts;
    uint dwNumConns;
}
struct MIB_UDPROW
{
    uint dwLocalAddr;
    uint dwLocalPort;
}
struct MIB_UDPTABLE
{
    uint dwNumEntries;
    MIB_UDPROW[1] table;
}
struct MIB_UDPROW_OWNER_PID
{
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwOwningPid;
}
struct MIB_UDPTABLE_OWNER_PID
{
    uint dwNumEntries;
    MIB_UDPROW_OWNER_PID[1] table;
}
struct MIB_UDPROW_OWNER_MODULE
{
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwOwningPid;
    long liCreateTimestamp;
    union
    {
        struct
        {
            int _bitfield0;
        }
        int dwFlags;
    }
    ulong[16] OwningModuleInfo;
}
struct MIB_UDPTABLE_OWNER_MODULE
{
    uint dwNumEntries;
    MIB_UDPROW_OWNER_MODULE[1] table;
}
struct MIB_UDPROW2
{
    uint dwLocalAddr;
    uint dwLocalPort;
    uint dwOwningPid;
    long liCreateTimestamp;
    union
    {
        struct
        {
            int _bitfield0;
        }
        int dwFlags;
    }
    ulong[16] OwningModuleInfo;
    uint dwRemoteAddr;
    uint dwRemotePort;
}
struct MIB_UDPTABLE2
{
    uint dwNumEntries;
    MIB_UDPROW2[1] table;
}
struct MIB_UDP6ROW
{
    IN6_ADDR dwLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
}
struct MIB_UDP6TABLE
{
    uint dwNumEntries;
    MIB_UDP6ROW[1] table;
}
struct MIB_UDP6ROW_OWNER_PID
{
    ubyte[16] ucLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    uint dwOwningPid;
}
struct MIB_UDP6TABLE_OWNER_PID
{
    uint dwNumEntries;
    MIB_UDP6ROW_OWNER_PID[1] table;
}
struct MIB_UDP6ROW_OWNER_MODULE
{
    ubyte[16] ucLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    uint dwOwningPid;
    long liCreateTimestamp;
    union
    {
        struct
        {
            int _bitfield0;
        }
        int dwFlags;
    }
    ulong[16] OwningModuleInfo;
}
struct MIB_UDP6TABLE_OWNER_MODULE
{
    uint dwNumEntries;
    MIB_UDP6ROW_OWNER_MODULE[1] table;
}
struct MIB_UDP6ROW2
{
    ubyte[16] ucLocalAddr;
    uint dwLocalScopeId;
    uint dwLocalPort;
    uint dwOwningPid;
    long liCreateTimestamp;
    union
    {
        struct
        {
            int _bitfield0;
        }
        int dwFlags;
    }
    ulong[16] OwningModuleInfo;
    ubyte[16] ucRemoteAddr;
    uint dwRemoteScopeId;
    uint dwRemotePort;
}
struct MIB_UDP6TABLE2
{
    uint dwNumEntries;
    MIB_UDP6ROW2[1] table;
}
struct MIB_UDPSTATS
{
    uint dwInDatagrams;
    uint dwNoPorts;
    uint dwInErrors;
    uint dwOutDatagrams;
    uint dwNumAddrs;
}
struct MIB_UDPSTATS2
{
    ulong dw64InDatagrams;
    uint dwNoPorts;
    uint dwInErrors;
    ulong dw64OutDatagrams;
    uint dwNumAddrs;
}
alias TCP_TABLE_CLASS = int;
enum : int
{
    TCP_TABLE_BASIC_LISTENER           = 0x00000000,
    TCP_TABLE_BASIC_CONNECTIONS        = 0x00000001,
    TCP_TABLE_BASIC_ALL                = 0x00000002,
    TCP_TABLE_OWNER_PID_LISTENER       = 0x00000003,
    TCP_TABLE_OWNER_PID_CONNECTIONS    = 0x00000004,
    TCP_TABLE_OWNER_PID_ALL            = 0x00000005,
    TCP_TABLE_OWNER_MODULE_LISTENER    = 0x00000006,
    TCP_TABLE_OWNER_MODULE_CONNECTIONS = 0x00000007,
    TCP_TABLE_OWNER_MODULE_ALL         = 0x00000008,
}

alias UDP_TABLE_CLASS = int;
enum : int
{
    UDP_TABLE_BASIC        = 0x00000000,
    UDP_TABLE_OWNER_PID    = 0x00000001,
    UDP_TABLE_OWNER_MODULE = 0x00000002,
}

alias TCPIP_OWNER_MODULE_INFO_CLASS = int;
enum : int
{
    TCPIP_OWNER_MODULE_INFO_BASIC = 0x00000000,
}

struct TCPIP_OWNER_MODULE_BASIC_INFO
{
    PWSTR pModuleName;
    PWSTR pModulePath;
}
struct MIB_IPMCAST_BOUNDARY
{
    uint dwIfIndex;
    uint dwGroupAddress;
    uint dwGroupMask;
    uint dwStatus;
}
struct MIB_IPMCAST_BOUNDARY_TABLE
{
    uint dwNumEntries;
    MIB_IPMCAST_BOUNDARY[1] table;
}
struct MIB_BOUNDARYROW
{
    uint dwGroupAddress;
    uint dwGroupMask;
}
struct MIB_MCAST_LIMIT_ROW
{
    uint dwTtl;
    uint dwRateLimit;
}
struct MIB_IPMCAST_SCOPE
{
    uint dwGroupAddress;
    uint dwGroupMask;
    ushort[256] snNameBuffer;
    uint dwStatus;
}
struct MIB_IPDESTROW
{
    MIB_IPFORWARDROW ForwardRow;
    uint dwForwardPreference;
    uint dwForwardViewSet;
}
struct MIB_IPDESTTABLE
{
    uint dwNumEntries;
    MIB_IPDESTROW[1] table;
}
struct MIB_BEST_IF
{
    uint dwDestAddr;
    uint dwIfIndex;
}
struct MIB_PROXYARP
{
    uint dwAddress;
    uint dwMask;
    uint dwIfIndex;
}
struct MIB_IFSTATUS
{
    uint dwIfIndex;
    uint dwAdminStatus;
    uint dwOperationalStatus;
    BOOL bMHbeatActive;
    BOOL bMHbeatAlive;
}
struct MIB_ROUTESTATE
{
    BOOL bRoutesSetToStack;
}
struct MIB_OPAQUE_INFO
{
    uint dwId;
    union
    {
        ulong ullAlign;
        ubyte[1] rgbyData;
    }
}
struct IP_ADDRESS_STRING
{
    CHAR[16] String;
}
struct IP_ADDR_STRING
{
    IP_ADDR_STRING* Next;
    IP_ADDRESS_STRING IpAddress;
    IP_ADDRESS_STRING IpMask;
    uint Context;
}
struct IP_ADAPTER_INFO
{
    IP_ADAPTER_INFO* Next;
    uint ComboIndex;
    CHAR[260] AdapterName;
    CHAR[132] Description;
    uint AddressLength;
    ubyte[8] Address;
    uint Index;
    uint Type;
    uint DhcpEnabled;
    IP_ADDR_STRING* CurrentIpAddress;
    IP_ADDR_STRING IpAddressList;
    IP_ADDR_STRING GatewayList;
    IP_ADDR_STRING DhcpServer;
    BOOL HaveWins;
    IP_ADDR_STRING PrimaryWinsServer;
    IP_ADDR_STRING SecondaryWinsServer;
    long LeaseObtained;
    long LeaseExpires;
}
struct IP_ADAPTER_UNICAST_ADDRESS_LH
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Flags;
        }
    }
    IP_ADAPTER_UNICAST_ADDRESS_LH* Next;
    SOCKET_ADDRESS Address;
    NL_PREFIX_ORIGIN PrefixOrigin;
    NL_SUFFIX_ORIGIN SuffixOrigin;
    NL_DAD_STATE DadState;
    uint ValidLifetime;
    uint PreferredLifetime;
    uint LeaseLifetime;
    ubyte OnLinkPrefixLength;
}
struct IP_ADAPTER_UNICAST_ADDRESS_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Flags;
        }
    }
    IP_ADAPTER_UNICAST_ADDRESS_XP* Next;
    SOCKET_ADDRESS Address;
    NL_PREFIX_ORIGIN PrefixOrigin;
    NL_SUFFIX_ORIGIN SuffixOrigin;
    NL_DAD_STATE DadState;
    uint ValidLifetime;
    uint PreferredLifetime;
    uint LeaseLifetime;
}
struct IP_ADAPTER_ANYCAST_ADDRESS_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Flags;
        }
    }
    IP_ADAPTER_ANYCAST_ADDRESS_XP* Next;
    SOCKET_ADDRESS Address;
}
struct IP_ADAPTER_MULTICAST_ADDRESS_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Flags;
        }
    }
    IP_ADAPTER_MULTICAST_ADDRESS_XP* Next;
    SOCKET_ADDRESS Address;
}
struct IP_ADAPTER_DNS_SERVER_ADDRESS_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Reserved;
        }
    }
    IP_ADAPTER_DNS_SERVER_ADDRESS_XP* Next;
    SOCKET_ADDRESS Address;
}
struct IP_ADAPTER_WINS_SERVER_ADDRESS_LH
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Reserved;
        }
    }
    IP_ADAPTER_WINS_SERVER_ADDRESS_LH* Next;
    SOCKET_ADDRESS Address;
}
struct IP_ADAPTER_GATEWAY_ADDRESS_LH
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Reserved;
        }
    }
    IP_ADAPTER_GATEWAY_ADDRESS_LH* Next;
    SOCKET_ADDRESS Address;
}
struct IP_ADAPTER_PREFIX_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint Flags;
        }
    }
    IP_ADAPTER_PREFIX_XP* Next;
    SOCKET_ADDRESS Address;
    uint PrefixLength;
}
struct IP_ADAPTER_DNS_SUFFIX
{
    IP_ADAPTER_DNS_SUFFIX* Next;
    wchar[256] String;
}
struct IP_ADAPTER_ADDRESSES_LH
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint IfIndex;
        }
    }
    IP_ADAPTER_ADDRESSES_LH* Next;
    PSTR AdapterName;
    IP_ADAPTER_UNICAST_ADDRESS_LH* FirstUnicastAddress;
    IP_ADAPTER_ANYCAST_ADDRESS_XP* FirstAnycastAddress;
    IP_ADAPTER_MULTICAST_ADDRESS_XP* FirstMulticastAddress;
    IP_ADAPTER_DNS_SERVER_ADDRESS_XP* FirstDnsServerAddress;
    PWSTR DnsSuffix;
    PWSTR Description;
    PWSTR FriendlyName;
    ubyte[8] PhysicalAddress;
    uint PhysicalAddressLength;
    union
    {
        uint Flags;
        struct
        {
            uint _bitfield0;
        }
    }
    uint Mtu;
    uint IfType;
    IF_OPER_STATUS OperStatus;
    uint Ipv6IfIndex;
    uint[16] ZoneIndices;
    IP_ADAPTER_PREFIX_XP* FirstPrefix;
    ulong TransmitLinkSpeed;
    ulong ReceiveLinkSpeed;
    IP_ADAPTER_WINS_SERVER_ADDRESS_LH* FirstWinsServerAddress;
    IP_ADAPTER_GATEWAY_ADDRESS_LH* FirstGatewayAddress;
    uint Ipv4Metric;
    uint Ipv6Metric;
    NET_LUID_LH Luid;
    SOCKET_ADDRESS Dhcpv4Server;
    uint CompartmentId;
    GUID NetworkGuid;
    NET_IF_CONNECTION_TYPE ConnectionType;
    TUNNEL_TYPE TunnelType;
    SOCKET_ADDRESS Dhcpv6Server;
    ubyte[130] Dhcpv6ClientDuid;
    uint Dhcpv6ClientDuidLength;
    uint Dhcpv6Iaid;
    IP_ADAPTER_DNS_SUFFIX* FirstDnsSuffix;
}
struct IP_ADAPTER_ADDRESSES_XP
{
    union
    {
        ulong Alignment;
        struct
        {
            uint Length;
            uint IfIndex;
        }
    }
    IP_ADAPTER_ADDRESSES_XP* Next;
    PSTR AdapterName;
    IP_ADAPTER_UNICAST_ADDRESS_XP* FirstUnicastAddress;
    IP_ADAPTER_ANYCAST_ADDRESS_XP* FirstAnycastAddress;
    IP_ADAPTER_MULTICAST_ADDRESS_XP* FirstMulticastAddress;
    IP_ADAPTER_DNS_SERVER_ADDRESS_XP* FirstDnsServerAddress;
    PWSTR DnsSuffix;
    PWSTR Description;
    PWSTR FriendlyName;
    ubyte[8] PhysicalAddress;
    uint PhysicalAddressLength;
    uint Flags;
    uint Mtu;
    uint IfType;
    IF_OPER_STATUS OperStatus;
    uint Ipv6IfIndex;
    uint[16] ZoneIndices;
    IP_ADAPTER_PREFIX_XP* FirstPrefix;
}
struct IP_PER_ADAPTER_INFO_W2KSP1
{
    uint AutoconfigEnabled;
    uint AutoconfigActive;
    IP_ADDR_STRING* CurrentDnsServer;
    IP_ADDR_STRING DnsServerList;
}
struct FIXED_INFO_W2KSP1
{
    CHAR[132] HostName;
    CHAR[132] DomainName;
    IP_ADDR_STRING* CurrentDnsServer;
    IP_ADDR_STRING DnsServerList;
    uint NodeType;
    CHAR[260] ScopeId;
    uint EnableRouting;
    uint EnableProxy;
    uint EnableDns;
}
struct IP_INTERFACE_NAME_INFO_W2KSP1
{
    uint Index;
    uint MediaType;
    ubyte ConnectionType;
    ubyte AccessType;
    GUID DeviceGuid;
    GUID InterfaceGuid;
}
alias TCP_ESTATS_TYPE = int;
enum : int
{
    TcpConnectionEstatsSynOpts   = 0x00000000,
    TcpConnectionEstatsData      = 0x00000001,
    TcpConnectionEstatsSndCong   = 0x00000002,
    TcpConnectionEstatsPath      = 0x00000003,
    TcpConnectionEstatsSendBuff  = 0x00000004,
    TcpConnectionEstatsRec       = 0x00000005,
    TcpConnectionEstatsObsRec    = 0x00000006,
    TcpConnectionEstatsBandwidth = 0x00000007,
    TcpConnectionEstatsFineRtt   = 0x00000008,
    TcpConnectionEstatsMaximum   = 0x00000009,
}

alias TCP_BOOLEAN_OPTIONAL = int;
enum : int
{
    TcpBoolOptDisabled  = 0x00000000,
    TcpBoolOptEnabled   = 0x00000001,
    TcpBoolOptUnchanged = 0xffffffff,
}

struct TCP_ESTATS_SYN_OPTS_ROS_v0
{
    BOOLEAN ActiveOpen;
    uint MssRcvd;
    uint MssSent;
}
alias TCP_SOFT_ERROR = int;
enum : int
{
    TcpErrorNone              = 0x00000000,
    TcpErrorBelowDataWindow   = 0x00000001,
    TcpErrorAboveDataWindow   = 0x00000002,
    TcpErrorBelowAckWindow    = 0x00000003,
    TcpErrorAboveAckWindow    = 0x00000004,
    TcpErrorBelowTsWindow     = 0x00000005,
    TcpErrorAboveTsWindow     = 0x00000006,
    TcpErrorDataChecksumError = 0x00000007,
    TcpErrorDataLengthError   = 0x00000008,
    TcpErrorMaxSoftError      = 0x00000009,
}

struct TCP_ESTATS_DATA_ROD_v0
{
    ulong DataBytesOut;
    ulong DataSegsOut;
    ulong DataBytesIn;
    ulong DataSegsIn;
    ulong SegsOut;
    ulong SegsIn;
    uint SoftErrors;
    uint SoftErrorReason;
    uint SndUna;
    uint SndNxt;
    uint SndMax;
    ulong ThruBytesAcked;
    uint RcvNxt;
    ulong ThruBytesReceived;
}
struct TCP_ESTATS_DATA_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_SND_CONG_ROD_v0
{
    uint SndLimTransRwin;
    uint SndLimTimeRwin;
    ulong SndLimBytesRwin;
    uint SndLimTransCwnd;
    uint SndLimTimeCwnd;
    ulong SndLimBytesCwnd;
    uint SndLimTransSnd;
    uint SndLimTimeSnd;
    ulong SndLimBytesSnd;
    uint SlowStart;
    uint CongAvoid;
    uint OtherReductions;
    uint CurCwnd;
    uint MaxSsCwnd;
    uint MaxCaCwnd;
    uint CurSsthresh;
    uint MaxSsthresh;
    uint MinSsthresh;
}
struct TCP_ESTATS_SND_CONG_ROS_v0
{
    uint LimCwnd;
}
struct TCP_ESTATS_SND_CONG_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_PATH_ROD_v0
{
    uint FastRetran;
    uint Timeouts;
    uint SubsequentTimeouts;
    uint CurTimeoutCount;
    uint AbruptTimeouts;
    uint PktsRetrans;
    uint BytesRetrans;
    uint DupAcksIn;
    uint SacksRcvd;
    uint SackBlocksRcvd;
    uint CongSignals;
    uint PreCongSumCwnd;
    uint PreCongSumRtt;
    uint PostCongSumRtt;
    uint PostCongCountRtt;
    uint EcnSignals;
    uint EceRcvd;
    uint SendStall;
    uint QuenchRcvd;
    uint RetranThresh;
    uint SndDupAckEpisodes;
    uint SumBytesReordered;
    uint NonRecovDa;
    uint NonRecovDaEpisodes;
    uint AckAfterFr;
    uint DsackDups;
    uint SampleRtt;
    uint SmoothedRtt;
    uint RttVar;
    uint MaxRtt;
    uint MinRtt;
    uint SumRtt;
    uint CountRtt;
    uint CurRto;
    uint MaxRto;
    uint MinRto;
    uint CurMss;
    uint MaxMss;
    uint MinMss;
    uint SpuriousRtoDetections;
}
struct TCP_ESTATS_PATH_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_SEND_BUFF_ROD_v0
{
    ulong CurRetxQueue;
    ulong MaxRetxQueue;
    ulong CurAppWQueue;
    ulong MaxAppWQueue;
}
struct TCP_ESTATS_SEND_BUFF_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_REC_ROD_v0
{
    uint CurRwinSent;
    uint MaxRwinSent;
    uint MinRwinSent;
    uint LimRwin;
    uint DupAckEpisodes;
    uint DupAcksOut;
    uint CeRcvd;
    uint EcnSent;
    uint EcnNoncesRcvd;
    uint CurReasmQueue;
    uint MaxReasmQueue;
    ulong CurAppRQueue;
    ulong MaxAppRQueue;
    ubyte WinScaleSent;
}
struct TCP_ESTATS_REC_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_OBS_REC_ROD_v0
{
    uint CurRwinRcvd;
    uint MaxRwinRcvd;
    uint MinRwinRcvd;
    ubyte WinScaleRcvd;
}
struct TCP_ESTATS_OBS_REC_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_BANDWIDTH_RW_v0
{
    TCP_BOOLEAN_OPTIONAL EnableCollectionOutbound;
    TCP_BOOLEAN_OPTIONAL EnableCollectionInbound;
}
struct TCP_ESTATS_BANDWIDTH_ROD_v0
{
    ulong OutboundBandwidth;
    ulong InboundBandwidth;
    ulong OutboundInstability;
    ulong InboundInstability;
    BOOLEAN OutboundBandwidthPeaked;
    BOOLEAN InboundBandwidthPeaked;
}
struct TCP_ESTATS_FINE_RTT_RW_v0
{
    BOOLEAN EnableCollection;
}
struct TCP_ESTATS_FINE_RTT_ROD_v0
{
    uint RttVar;
    uint MaxRtt;
    uint MinRtt;
    uint SumRtt;
}
struct INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES
{
    BOOLEAN PtpV2OverUdpIPv4EventMessageReceive;
    BOOLEAN PtpV2OverUdpIPv4AllMessageReceive;
    BOOLEAN PtpV2OverUdpIPv4EventMessageTransmit;
    BOOLEAN PtpV2OverUdpIPv4AllMessageTransmit;
    BOOLEAN PtpV2OverUdpIPv6EventMessageReceive;
    BOOLEAN PtpV2OverUdpIPv6AllMessageReceive;
    BOOLEAN PtpV2OverUdpIPv6EventMessageTransmit;
    BOOLEAN PtpV2OverUdpIPv6AllMessageTransmit;
    BOOLEAN AllReceive;
    BOOLEAN AllTransmit;
    BOOLEAN TaggedTransmit;
}
struct INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES
{
    BOOLEAN AllReceive;
    BOOLEAN AllTransmit;
    BOOLEAN TaggedTransmit;
}
struct INTERFACE_TIMESTAMP_CAPABILITIES
{
    ulong HardwareClockFrequencyHz;
    BOOLEAN SupportsCrossTimestamp;
    INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES HardwareCapabilities;
    INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES SoftwareCapabilities;
}
struct INTERFACE_HARDWARE_CROSSTIMESTAMP
{
    ulong SystemTimestamp1;
    ulong HardwareClockTimestamp;
    ulong SystemTimestamp2;
}
alias PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK = void function(void*);
alias NET_ADDRESS_FORMAT = int;
enum : int
{
    NET_ADDRESS_FORMAT_UNSPECIFIED = 0x00000000,
    NET_ADDRESS_DNS_NAME           = 0x00000001,
    NET_ADDRESS_IPV4               = 0x00000002,
    NET_ADDRESS_IPV6               = 0x00000003,
}

struct NET_ADDRESS_INFO
{
    NET_ADDRESS_FORMAT Format;
    union
    {
        struct _NamedAddress_e__Struct
        {
            wchar[256] Address;
            wchar[6] Port;
        }
        SOCKADDR_IN Ipv4Address;
        SOCKADDR_IN6 Ipv6Address;
        SOCKADDR IpAddress;
    }
}
alias MIB_NOTIFICATION_TYPE = int;
enum : int
{
    MibParameterNotification = 0x00000000,
    MibAddInstance           = 0x00000001,
    MibDeleteInstance        = 0x00000002,
    MibInitialNotification   = 0x00000003,
}

struct MIB_IF_ROW2
{
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    GUID InterfaceGuid;
    wchar[257] Alias;
    wchar[257] Description;
    uint PhysicalAddressLength;
    ubyte[32] PhysicalAddress;
    ubyte[32] PermanentPhysicalAddress;
    uint Mtu;
    uint Type;
    TUNNEL_TYPE TunnelType;
    NDIS_MEDIUM MediaType;
    NDIS_PHYSICAL_MEDIUM PhysicalMediumType;
    NET_IF_ACCESS_TYPE AccessType;
    NET_IF_DIRECTION_TYPE DirectionType;
    struct _InterfaceAndOperStatusFlags_e__Struct
    {
        ubyte _bitfield0;
    }
    IF_OPER_STATUS OperStatus;
    NET_IF_ADMIN_STATUS AdminStatus;
    NET_IF_MEDIA_CONNECT_STATE MediaConnectState;
    GUID NetworkGuid;
    NET_IF_CONNECTION_TYPE ConnectionType;
    ulong TransmitLinkSpeed;
    ulong ReceiveLinkSpeed;
    ulong InOctets;
    ulong InUcastPkts;
    ulong InNUcastPkts;
    ulong InDiscards;
    ulong InErrors;
    ulong InUnknownProtos;
    ulong InUcastOctets;
    ulong InMulticastOctets;
    ulong InBroadcastOctets;
    ulong OutOctets;
    ulong OutUcastPkts;
    ulong OutNUcastPkts;
    ulong OutDiscards;
    ulong OutErrors;
    ulong OutUcastOctets;
    ulong OutMulticastOctets;
    ulong OutBroadcastOctets;
    ulong OutQLen;
}
struct MIB_IF_TABLE2
{
    uint NumEntries;
    MIB_IF_ROW2[1] Table;
}
alias MIB_IF_ENTRY_LEVEL = int;
enum : int
{
    MibIfEntryNormal                  = 0x00000000,
    MibIfEntryNormalWithoutStatistics = 0x00000002,
}

alias MIB_IF_TABLE_LEVEL = int;
enum : int
{
    MibIfTableNormal                  = 0x00000000,
    MibIfTableRaw                     = 0x00000001,
    MibIfTableNormalWithoutStatistics = 0x00000002,
}

struct MIB_IPINTERFACE_ROW
{
    ADDRESS_FAMILY Family;
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    uint MaxReassemblySize;
    ulong InterfaceIdentifier;
    uint MinRouterAdvertisementInterval;
    uint MaxRouterAdvertisementInterval;
    BOOLEAN AdvertisingEnabled;
    BOOLEAN ForwardingEnabled;
    BOOLEAN WeakHostSend;
    BOOLEAN WeakHostReceive;
    BOOLEAN UseAutomaticMetric;
    BOOLEAN UseNeighborUnreachabilityDetection;
    BOOLEAN ManagedAddressConfigurationSupported;
    BOOLEAN OtherStatefulConfigurationSupported;
    BOOLEAN AdvertiseDefaultRoute;
    NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryBehavior;
    uint DadTransmits;
    uint BaseReachableTime;
    uint RetransmitTime;
    uint PathMtuDiscoveryTimeout;
    NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalAddressBehavior;
    uint LinkLocalAddressTimeout;
    uint[16] ZoneIndices;
    uint SitePrefixLength;
    uint Metric;
    uint NlMtu;
    BOOLEAN Connected;
    BOOLEAN SupportsWakeUpPatterns;
    BOOLEAN SupportsNeighborDiscovery;
    BOOLEAN SupportsRouterDiscovery;
    uint ReachableTime;
    NL_INTERFACE_OFFLOAD_ROD TransmitOffload;
    NL_INTERFACE_OFFLOAD_ROD ReceiveOffload;
    BOOLEAN DisableDefaultRoutes;
}
struct MIB_IPINTERFACE_TABLE
{
    uint NumEntries;
    MIB_IPINTERFACE_ROW[1] Table;
}
struct MIB_IFSTACK_ROW
{
    uint HigherLayerInterfaceIndex;
    uint LowerLayerInterfaceIndex;
}
struct MIB_INVERTEDIFSTACK_ROW
{
    uint LowerLayerInterfaceIndex;
    uint HigherLayerInterfaceIndex;
}
struct MIB_IFSTACK_TABLE
{
    uint NumEntries;
    MIB_IFSTACK_ROW[1] Table;
}
struct MIB_INVERTEDIFSTACK_TABLE
{
    uint NumEntries;
    MIB_INVERTEDIFSTACK_ROW[1] Table;
}
alias PIPINTERFACE_CHANGE_CALLBACK = void function(void*, MIB_IPINTERFACE_ROW*, MIB_NOTIFICATION_TYPE);
struct MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES
{
    NL_BANDWIDTH_INFORMATION InboundBandwidthInformation;
    NL_BANDWIDTH_INFORMATION OutboundBandwidthInformation;
}
struct MIB_UNICASTIPADDRESS_ROW
{
    SOCKADDR_INET Address;
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    NL_PREFIX_ORIGIN PrefixOrigin;
    NL_SUFFIX_ORIGIN SuffixOrigin;
    uint ValidLifetime;
    uint PreferredLifetime;
    ubyte OnLinkPrefixLength;
    BOOLEAN SkipAsSource;
    NL_DAD_STATE DadState;
    SCOPE_ID ScopeId;
    long CreationTimeStamp;
}
struct MIB_UNICASTIPADDRESS_TABLE
{
    uint NumEntries;
    MIB_UNICASTIPADDRESS_ROW[1] Table;
}
alias PUNICAST_IPADDRESS_CHANGE_CALLBACK = void function(void*, MIB_UNICASTIPADDRESS_ROW*, MIB_NOTIFICATION_TYPE);
alias PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK = void function(void*, MIB_UNICASTIPADDRESS_TABLE*);
struct MIB_ANYCASTIPADDRESS_ROW
{
    SOCKADDR_INET Address;
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    SCOPE_ID ScopeId;
}
struct MIB_ANYCASTIPADDRESS_TABLE
{
    uint NumEntries;
    MIB_ANYCASTIPADDRESS_ROW[1] Table;
}
struct MIB_MULTICASTIPADDRESS_ROW
{
    SOCKADDR_INET Address;
    uint InterfaceIndex;
    NET_LUID_LH InterfaceLuid;
    SCOPE_ID ScopeId;
}
struct MIB_MULTICASTIPADDRESS_TABLE
{
    uint NumEntries;
    MIB_MULTICASTIPADDRESS_ROW[1] Table;
}
struct IP_ADDRESS_PREFIX
{
    SOCKADDR_INET Prefix;
    ubyte PrefixLength;
}
struct MIB_IPFORWARD_ROW2
{
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    IP_ADDRESS_PREFIX DestinationPrefix;
    SOCKADDR_INET NextHop;
    ubyte SitePrefixLength;
    uint ValidLifetime;
    uint PreferredLifetime;
    uint Metric;
    NL_ROUTE_PROTOCOL Protocol;
    BOOLEAN Loopback;
    BOOLEAN AutoconfigureAddress;
    BOOLEAN Publish;
    BOOLEAN Immortal;
    uint Age;
    NL_ROUTE_ORIGIN Origin;
}
struct MIB_IPFORWARD_TABLE2
{
    uint NumEntries;
    MIB_IPFORWARD_ROW2[1] Table;
}
alias PIPFORWARD_CHANGE_CALLBACK = void function(void*, MIB_IPFORWARD_ROW2*, MIB_NOTIFICATION_TYPE);
struct MIB_IPPATH_ROW
{
    SOCKADDR_INET Source;
    SOCKADDR_INET Destination;
    NET_LUID_LH InterfaceLuid;
    uint InterfaceIndex;
    SOCKADDR_INET CurrentNextHop;
    uint PathMtu;
    uint RttMean;
    uint RttDeviation;
    union
    {
        uint LastReachable;
        uint LastUnreachable;
    }
    BOOLEAN IsReachable;
    ulong LinkTransmitSpeed;
    ulong LinkReceiveSpeed;
}
struct MIB_IPPATH_TABLE
{
    uint NumEntries;
    MIB_IPPATH_ROW[1] Table;
}
struct MIB_IPNET_ROW2
{
    SOCKADDR_INET Address;
    uint InterfaceIndex;
    NET_LUID_LH InterfaceLuid;
    ubyte[32] PhysicalAddress;
    uint PhysicalAddressLength;
    NL_NEIGHBOR_STATE State;
    union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte Flags;
    }
    union _ReachabilityTime_e__Union
    {
        uint LastReachable;
        uint LastUnreachable;
    }
}
struct MIB_IPNET_TABLE2
{
    uint NumEntries;
    MIB_IPNET_ROW2[1] Table;
}
alias PTEREDO_PORT_CHANGE_CALLBACK = void function(void*, ushort, MIB_NOTIFICATION_TYPE);
struct DNS_SETTINGS
{
    uint Version;
    ulong Flags;
    PWSTR Hostname;
    PWSTR Domain;
    PWSTR SearchList;
}
struct DNS_SETTINGS2
{
    uint Version;
    ulong Flags;
    PWSTR Hostname;
    PWSTR Domain;
    PWSTR SearchList;
    ulong SettingFlags;
}
struct DNS_DOH_SERVER_SETTINGS
{
    PWSTR Template;
    ulong Flags;
}
alias DNS_SERVER_PROPERTY_TYPE = int;
enum : int
{
    DnsServerInvalidProperty = 0x00000000,
    DnsServerDohProperty     = 0x00000001,
}

union DNS_SERVER_PROPERTY_TYPES
{
    DNS_DOH_SERVER_SETTINGS* DohSettings;
}
struct DNS_SERVER_PROPERTY
{
    uint Version;
    uint ServerIndex;
    DNS_SERVER_PROPERTY_TYPE Type;
    DNS_SERVER_PROPERTY_TYPES Property;
}
struct DNS_INTERFACE_SETTINGS
{
    uint Version;
    ulong Flags;
    PWSTR Domain;
    PWSTR NameServer;
    PWSTR SearchList;
    uint RegistrationEnabled;
    uint RegisterAdapterName;
    uint EnableLLMNR;
    uint QueryAdapterName;
    PWSTR ProfileNameServer;
}
struct DNS_INTERFACE_SETTINGS_EX
{
    DNS_INTERFACE_SETTINGS SettingsV1;
    uint DisableUnconstrainedQueries;
    PWSTR SupplementalSearchList;
}
struct DNS_INTERFACE_SETTINGS3
{
    uint Version;
    ulong Flags;
    PWSTR Domain;
    PWSTR NameServer;
    PWSTR SearchList;
    uint RegistrationEnabled;
    uint RegisterAdapterName;
    uint EnableLLMNR;
    uint QueryAdapterName;
    PWSTR ProfileNameServer;
    uint DisableUnconstrainedQueries;
    PWSTR SupplementalSearchList;
    uint cServerProperties;
    DNS_SERVER_PROPERTY* ServerProperties;
    uint cProfileServerProperties;
    DNS_SERVER_PROPERTY* ProfileServerProperties;
}
struct DNS_INTERFACE_SETTINGS4
{
    uint Version;
    ulong Flags;
    PWSTR Domain;
    PWSTR NameServer;
    PWSTR SearchList;
    uint RegistrationEnabled;
    uint RegisterAdapterName;
    uint EnableLLMNR;
    uint QueryAdapterName;
    PWSTR ProfileNameServer;
    uint DisableUnconstrainedQueries;
    PWSTR SupplementalSearchList;
    uint cServerProperties;
    DNS_SERVER_PROPERTY* ServerProperties;
    uint cProfileServerProperties;
    DNS_SERVER_PROPERTY* ProfileServerProperties;
    uint EncryptedDnsAdapterFlags;
}
alias PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK = void function(void*, NL_NETWORK_CONNECTIVITY_HINT);
alias GLOBAL_FILTER = int;
enum : int
{
    GF_FRAGMENTS  = 0x00000002,
    GF_STRONGHOST = 0x00000008,
    GF_FRAGCACHE  = 0x00000009,
}

alias PFFORWARD_ACTION = int;
enum : int
{
    PF_ACTION_FORWARD = 0x00000000,
    PF_ACTION_DROP    = 0x00000001,
}

alias PFADDRESSTYPE = int;
enum : int
{
    PF_IPV4 = 0x00000000,
    PF_IPV6 = 0x00000001,
}

struct PF_FILTER_DESCRIPTOR
{
    uint dwFilterFlags;
    uint dwRule;
    PFADDRESSTYPE pfatType;
    ubyte* SrcAddr;
    ubyte* SrcMask;
    ubyte* DstAddr;
    ubyte* DstMask;
    uint dwProtocol;
    uint fLateBound;
    ushort wSrcPort;
    ushort wDstPort;
    ushort wSrcPortHighRange;
    ushort wDstPortHighRange;
}
struct PF_FILTER_STATS
{
    uint dwNumPacketsFiltered;
    PF_FILTER_DESCRIPTOR info;
}
struct PF_INTERFACE_STATS
{
    void* pvDriverContext;
    uint dwFlags;
    uint dwInDrops;
    uint dwOutDrops;
    PFFORWARD_ACTION eaInAction;
    PFFORWARD_ACTION eaOutAction;
    uint dwNumInFilters;
    uint dwNumOutFilters;
    uint dwFrag;
    uint dwSpoof;
    uint dwReserved1;
    uint dwReserved2;
    long liSYN;
    long liTotalLogged;
    uint dwLostLogEntries;
    PF_FILTER_STATS[1] FilterInfo;
}
struct PF_LATEBIND_INFO
{
    ubyte* SrcAddr;
    ubyte* DstAddr;
    ubyte* Mask;
}
alias PFFRAMETYPE = int;
enum : int
{
    PFFT_FILTER = 0x00000001,
    PFFT_FRAG   = 0x00000002,
    PFFT_SPOOF  = 0x00000003,
}

struct PFLOGFRAME
{
    long Timestamp;
    PFFRAMETYPE pfeTypeOfFrame;
    uint dwTotalSizeUsed;
    uint dwFilterRule;
    ushort wSizeOfAdditionalData;
    ushort wSizeOfIpHeader;
    uint dwInterfaceName;
    uint dwIPIndex;
    ubyte[1] bPacketData;
}
