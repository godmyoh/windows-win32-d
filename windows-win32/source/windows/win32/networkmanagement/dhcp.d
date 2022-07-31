module windows.win32.networkmanagement.dhcp;

import windows.win32.foundation : BOOL, BOOLEAN, PSTR, PWSTR;

version (Windows):
extern (Windows):

void Dhcpv6CApiInitialize(uint*);
void Dhcpv6CApiCleanup();
uint Dhcpv6RequestParams(BOOL, void*, PWSTR, DHCPV6CAPI_CLASSID*, DHCPV6CAPI_PARAMS_ARRAY, ubyte*, uint*);
uint Dhcpv6RequestPrefix(PWSTR, DHCPV6CAPI_CLASSID*, DHCPV6PrefixLeaseInformation*, uint*);
uint Dhcpv6RenewPrefix(PWSTR, DHCPV6CAPI_CLASSID*, DHCPV6PrefixLeaseInformation*, uint*, uint);
uint Dhcpv6ReleasePrefix(PWSTR, DHCPV6CAPI_CLASSID*, DHCPV6PrefixLeaseInformation*);
uint DhcpCApiInitialize(uint*);
void DhcpCApiCleanup();
uint DhcpRequestParams(uint, void*, PWSTR, DHCPCAPI_CLASSID*, DHCPCAPI_PARAMS_ARRAY, DHCPCAPI_PARAMS_ARRAY, ubyte*, uint*, PWSTR);
uint DhcpUndoRequestParams(uint, void*, PWSTR, PWSTR);
uint DhcpRegisterParamChange(uint, void*, PWSTR, DHCPCAPI_CLASSID*, DHCPCAPI_PARAMS_ARRAY, void*);
uint DhcpDeRegisterParamChange(uint, void*, void*);
uint DhcpRemoveDNSRegistrations();
uint DhcpGetOriginalSubnetMask(const(wchar)*, uint*);
uint DhcpAddFilterV4(const(wchar)*, DHCP_FILTER_ADD_INFO*, BOOL);
uint DhcpDeleteFilterV4(const(wchar)*, DHCP_ADDR_PATTERN*);
uint DhcpSetFilterV4(const(wchar)*, DHCP_FILTER_GLOBAL_INFO*);
uint DhcpGetFilterV4(const(wchar)*, DHCP_FILTER_GLOBAL_INFO*);
uint DhcpEnumFilterV4(const(wchar)*, DHCP_ADDR_PATTERN*, uint, DHCP_FILTER_LIST_TYPE, DHCP_FILTER_ENUM_INFO**, uint*, uint*);
uint DhcpCreateSubnet(const(wchar)*, uint, const(DHCP_SUBNET_INFO)*);
uint DhcpSetSubnetInfo(const(wchar)*, uint, const(DHCP_SUBNET_INFO)*);
uint DhcpGetSubnetInfo(const(wchar)*, uint, DHCP_SUBNET_INFO**);
uint DhcpEnumSubnets(const(wchar)*, uint*, uint, DHCP_IP_ARRAY**, uint*, uint*);
uint DhcpAddSubnetElement(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA)*);
uint DhcpEnumSubnetElements(const(wchar)*, uint, DHCP_SUBNET_ELEMENT_TYPE, uint*, uint, DHCP_SUBNET_ELEMENT_INFO_ARRAY**, uint*, uint*);
uint DhcpRemoveSubnetElement(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA)*, DHCP_FORCE_FLAG);
uint DhcpDeleteSubnet(const(wchar)*, uint, DHCP_FORCE_FLAG);
uint DhcpCreateOption(const(wchar)*, uint, const(DHCP_OPTION)*);
uint DhcpSetOptionInfo(const(wchar)*, uint, const(DHCP_OPTION)*);
uint DhcpGetOptionInfo(const(wchar)*, uint, DHCP_OPTION**);
uint DhcpEnumOptions(const(wchar)*, uint*, uint, DHCP_OPTION_ARRAY**, uint*, uint*);
uint DhcpRemoveOption(const(wchar)*, uint);
uint DhcpSetOptionValue(const(wchar)*, uint, const(DHCP_OPTION_SCOPE_INFO)*, const(DHCP_OPTION_DATA)*);
uint DhcpSetOptionValues(const(wchar)*, const(DHCP_OPTION_SCOPE_INFO)*, const(DHCP_OPTION_VALUE_ARRAY)*);
uint DhcpGetOptionValue(const(wchar)*, uint, const(DHCP_OPTION_SCOPE_INFO)*, DHCP_OPTION_VALUE**);
uint DhcpEnumOptionValues(const(wchar)*, const(DHCP_OPTION_SCOPE_INFO)*, uint*, uint, DHCP_OPTION_VALUE_ARRAY**, uint*, uint*);
uint DhcpRemoveOptionValue(const(wchar)*, uint, const(DHCP_OPTION_SCOPE_INFO)*);
uint DhcpCreateClientInfoVQ(const(wchar)*, const(DHCP_CLIENT_INFO_VQ)*);
uint DhcpSetClientInfoVQ(const(wchar)*, const(DHCP_CLIENT_INFO_VQ)*);
uint DhcpGetClientInfoVQ(const(wchar)*, const(DHCP_SEARCH_INFO)*, DHCP_CLIENT_INFO_VQ**);
uint DhcpEnumSubnetClientsVQ(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_ARRAY_VQ**, uint*, uint*);
uint DhcpEnumSubnetClientsFilterStatusInfo(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY**, uint*, uint*);
uint DhcpCreateClientInfo(const(wchar)*, const(DHCP_CLIENT_INFO)*);
uint DhcpSetClientInfo(const(wchar)*, const(DHCP_CLIENT_INFO)*);
uint DhcpGetClientInfo(const(wchar)*, const(DHCP_SEARCH_INFO)*, DHCP_CLIENT_INFO**);
uint DhcpDeleteClientInfo(const(wchar)*, const(DHCP_SEARCH_INFO)*);
uint DhcpEnumSubnetClients(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_ARRAY**, uint*, uint*);
uint DhcpGetClientOptions(const(wchar)*, uint, uint, DHCP_OPTION_LIST**);
uint DhcpGetMibInfo(const(wchar)*, DHCP_MIB_INFO**);
uint DhcpServerSetConfig(const(wchar)*, uint, DHCP_SERVER_CONFIG_INFO*);
uint DhcpServerGetConfig(const(wchar)*, DHCP_SERVER_CONFIG_INFO**);
uint DhcpScanDatabase(const(wchar)*, uint, uint, DHCP_SCAN_LIST**);
void DhcpRpcFreeMemory(void*);
uint DhcpGetVersion(PWSTR, uint*, uint*);
uint DhcpAddSubnetElementV4(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA_V4)*);
uint DhcpEnumSubnetElementsV4(const(wchar)*, uint, DHCP_SUBNET_ELEMENT_TYPE, uint*, uint, DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4**, uint*, uint*);
uint DhcpRemoveSubnetElementV4(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA_V4)*, DHCP_FORCE_FLAG);
uint DhcpCreateClientInfoV4(const(wchar)*, const(DHCP_CLIENT_INFO_V4)*);
uint DhcpSetClientInfoV4(const(wchar)*, const(DHCP_CLIENT_INFO_V4)*);
uint DhcpGetClientInfoV4(const(wchar)*, const(DHCP_SEARCH_INFO)*, DHCP_CLIENT_INFO_V4**);
uint DhcpEnumSubnetClientsV4(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_ARRAY_V4**, uint*, uint*);
uint DhcpServerSetConfigV4(const(wchar)*, uint, DHCP_SERVER_CONFIG_INFO_V4*);
uint DhcpServerGetConfigV4(const(wchar)*, DHCP_SERVER_CONFIG_INFO_V4**);
uint DhcpSetSuperScopeV4(const(wchar)*, const(uint), const(wchar)*, const(BOOL));
uint DhcpDeleteSuperScopeV4(const(wchar)*, const(wchar)*);
uint DhcpGetSuperScopeInfoV4(const(wchar)*, DHCP_SUPER_SCOPE_TABLE**);
uint DhcpEnumSubnetClientsV5(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_ARRAY_V5**, uint*, uint*);
uint DhcpCreateOptionV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION*);
uint DhcpSetOptionInfoV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION*);
uint DhcpGetOptionInfoV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION**);
uint DhcpEnumOptionsV5(PWSTR, uint, PWSTR, PWSTR, uint*, uint, DHCP_OPTION_ARRAY**, uint*, uint*);
uint DhcpRemoveOptionV5(PWSTR, uint, uint, PWSTR, PWSTR);
uint DhcpSetOptionValueV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_DATA*);
uint DhcpSetOptionValuesV5(PWSTR, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_VALUE_ARRAY*);
uint DhcpGetOptionValueV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_VALUE**);
uint DhcpGetOptionValueV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO6*, DHCP_OPTION_VALUE**);
uint DhcpEnumOptionValuesV5(PWSTR, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, uint*, uint, DHCP_OPTION_VALUE_ARRAY**, uint*, uint*);
uint DhcpRemoveOptionValueV5(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*);
uint DhcpCreateClass(PWSTR, uint, DHCP_CLASS_INFO*);
uint DhcpModifyClass(PWSTR, uint, DHCP_CLASS_INFO*);
uint DhcpDeleteClass(PWSTR, uint, PWSTR);
uint DhcpGetClassInfo(PWSTR, uint, DHCP_CLASS_INFO*, DHCP_CLASS_INFO**);
uint DhcpEnumClasses(PWSTR, uint, uint*, uint, DHCP_CLASS_INFO_ARRAY**, uint*, uint*);
uint DhcpGetAllOptions(PWSTR, uint, DHCP_ALL_OPTIONS**);
uint DhcpGetAllOptionsV6(PWSTR, uint, DHCP_ALL_OPTIONS**);
uint DhcpGetAllOptionValues(PWSTR, uint, DHCP_OPTION_SCOPE_INFO*, DHCP_ALL_OPTION_VALUES**);
uint DhcpGetAllOptionValuesV6(PWSTR, uint, DHCP_OPTION_SCOPE_INFO6*, DHCP_ALL_OPTION_VALUES**);
uint DhcpEnumServers(uint, void*, DHCPDS_SERVERS**, void*, void*);
uint DhcpAddServer(uint, void*, DHCPDS_SERVER*, void*, void*);
uint DhcpDeleteServer(uint, void*, DHCPDS_SERVER*, void*, void*);
uint DhcpGetServerBindingInfo(const(wchar)*, uint, DHCP_BIND_ELEMENT_ARRAY**);
uint DhcpSetServerBindingInfo(const(wchar)*, uint, DHCP_BIND_ELEMENT_ARRAY*);
uint DhcpAddSubnetElementV5(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA_V5)*);
uint DhcpEnumSubnetElementsV5(const(wchar)*, uint, DHCP_SUBNET_ELEMENT_TYPE, uint*, uint, DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5**, uint*, uint*);
uint DhcpRemoveSubnetElementV5(const(wchar)*, uint, const(DHCP_SUBNET_ELEMENT_DATA_V5)*, DHCP_FORCE_FLAG);
uint DhcpV4EnumSubnetReservations(const(wchar)*, uint, uint*, uint, DHCP_RESERVATION_INFO_ARRAY**, uint*, uint*);
uint DhcpCreateOptionV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION*);
uint DhcpRemoveOptionV6(PWSTR, uint, uint, PWSTR, PWSTR);
uint DhcpEnumOptionsV6(PWSTR, uint, PWSTR, PWSTR, uint*, uint, DHCP_OPTION_ARRAY**, uint*, uint*);
uint DhcpRemoveOptionValueV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO6*);
uint DhcpGetOptionInfoV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION**);
uint DhcpSetOptionInfoV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION*);
uint DhcpSetOptionValueV6(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO6*, DHCP_OPTION_DATA*);
uint DhcpGetSubnetInfoVQ(const(wchar)*, uint, DHCP_SUBNET_INFO_VQ**);
uint DhcpCreateSubnetVQ(const(wchar)*, uint, const(DHCP_SUBNET_INFO_VQ)*);
uint DhcpSetSubnetInfoVQ(const(wchar)*, uint, const(DHCP_SUBNET_INFO_VQ)*);
uint DhcpEnumOptionValuesV6(const(wchar)*, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO6*, uint*, uint, DHCP_OPTION_VALUE_ARRAY**, uint*, uint*);
uint DhcpDsInit();
void DhcpDsCleanup();
uint DhcpSetThreadOptions(uint, void*);
uint DhcpGetThreadOptions(uint*, void*);
uint DhcpServerQueryAttribute(PWSTR, uint, uint, DHCP_ATTRIB**);
uint DhcpServerQueryAttributes(PWSTR, uint, uint, uint*, DHCP_ATTRIB_ARRAY**);
uint DhcpServerRedoAuthorization(PWSTR, uint);
uint DhcpAuditLogSetParams(PWSTR, uint, PWSTR, uint, uint, uint);
uint DhcpAuditLogGetParams(PWSTR, uint, PWSTR*, uint*, uint*, uint*);
uint DhcpServerQueryDnsRegCredentials(PWSTR, uint, PWSTR, uint, PWSTR);
uint DhcpServerSetDnsRegCredentials(PWSTR, PWSTR, PWSTR, PWSTR);
uint DhcpServerSetDnsRegCredentialsV5(PWSTR, PWSTR, PWSTR, PWSTR);
uint DhcpServerBackupDatabase(PWSTR, PWSTR);
uint DhcpServerRestoreDatabase(PWSTR, PWSTR);
uint DhcpServerSetConfigVQ(const(wchar)*, uint, DHCP_SERVER_CONFIG_INFO_VQ*);
uint DhcpServerGetConfigVQ(const(wchar)*, DHCP_SERVER_CONFIG_INFO_VQ**);
uint DhcpGetServerSpecificStrings(const(wchar)*, DHCP_SERVER_SPECIFIC_STRINGS**);
void DhcpServerAuditlogParamsFree(DHCP_SERVER_CONFIG_INFO_VQ*);
uint DhcpCreateSubnetV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_SUBNET_INFO_V6*);
uint DhcpDeleteSubnetV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_FORCE_FLAG);
uint DhcpEnumSubnetsV6(const(wchar)*, uint*, uint, DHCPV6_IP_ARRAY**, uint*, uint*);
uint DhcpAddSubnetElementV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_SUBNET_ELEMENT_DATA_V6*);
uint DhcpRemoveSubnetElementV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_SUBNET_ELEMENT_DATA_V6*, DHCP_FORCE_FLAG);
uint DhcpEnumSubnetElementsV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_SUBNET_ELEMENT_TYPE_V6, uint*, uint, DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6**, uint*, uint*);
uint DhcpGetSubnetInfoV6(PWSTR, DHCP_IPV6_ADDRESS, DHCP_SUBNET_INFO_V6**);
uint DhcpEnumSubnetClientsV6(const(wchar)*, DHCP_IPV6_ADDRESS, DHCP_IPV6_ADDRESS*, uint, DHCP_CLIENT_INFO_ARRAY_V6**, uint*, uint*);
uint DhcpServerGetConfigV6(const(wchar)*, DHCP_OPTION_SCOPE_INFO6*, DHCP_SERVER_CONFIG_INFO_V6**);
uint DhcpServerSetConfigV6(const(wchar)*, DHCP_OPTION_SCOPE_INFO6*, uint, DHCP_SERVER_CONFIG_INFO_V6*);
uint DhcpSetSubnetInfoV6(const(wchar)*, DHCP_IPV6_ADDRESS, DHCP_SUBNET_INFO_V6*);
uint DhcpGetMibInfoV6(const(wchar)*, DHCP_MIB_INFO_V6**);
uint DhcpGetServerBindingInfoV6(const(wchar)*, uint, DHCPV6_BIND_ELEMENT_ARRAY**);
uint DhcpSetServerBindingInfoV6(const(wchar)*, uint, DHCPV6_BIND_ELEMENT_ARRAY*);
uint DhcpSetClientInfoV6(const(wchar)*, const(DHCP_CLIENT_INFO_V6)*);
uint DhcpGetClientInfoV6(const(wchar)*, const(DHCP_SEARCH_INFO_V6)*, DHCP_CLIENT_INFO_V6**);
uint DhcpDeleteClientInfoV6(const(wchar)*, const(DHCP_SEARCH_INFO_V6)*);
uint DhcpCreateClassV6(PWSTR, uint, DHCP_CLASS_INFO_V6*);
uint DhcpModifyClassV6(PWSTR, uint, DHCP_CLASS_INFO_V6*);
uint DhcpDeleteClassV6(PWSTR, uint, PWSTR);
uint DhcpEnumClassesV6(PWSTR, uint, uint*, uint, DHCP_CLASS_INFO_ARRAY_V6**, uint*, uint*);
uint DhcpSetSubnetDelayOffer(PWSTR, uint, ushort);
uint DhcpGetSubnetDelayOffer(PWSTR, uint, ushort*);
uint DhcpGetMibInfoV5(const(wchar)*, DHCP_MIB_INFO_V5**);
uint DhcpAddSecurityGroup(PWSTR);
uint DhcpV4GetOptionValue(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_VALUE**);
uint DhcpV4SetOptionValue(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_DATA*);
uint DhcpV4SetOptionValues(PWSTR, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*, DHCP_OPTION_VALUE_ARRAY*);
uint DhcpV4RemoveOptionValue(PWSTR, uint, uint, PWSTR, PWSTR, DHCP_OPTION_SCOPE_INFO*);
uint DhcpV4GetAllOptionValues(PWSTR, uint, DHCP_OPTION_SCOPE_INFO*, DHCP_ALL_OPTION_VALUES_PB**);
uint DhcpV4FailoverCreateRelationship(PWSTR, DHCP_FAILOVER_RELATIONSHIP*);
uint DhcpV4FailoverSetRelationship(PWSTR, uint, DHCP_FAILOVER_RELATIONSHIP*);
uint DhcpV4FailoverDeleteRelationship(PWSTR, PWSTR);
uint DhcpV4FailoverGetRelationship(PWSTR, PWSTR, DHCP_FAILOVER_RELATIONSHIP**);
uint DhcpV4FailoverEnumRelationship(PWSTR, uint*, uint, DHCP_FAILOVER_RELATIONSHIP_ARRAY**, uint*, uint*);
uint DhcpV4FailoverAddScopeToRelationship(PWSTR, DHCP_FAILOVER_RELATIONSHIP*);
uint DhcpV4FailoverDeleteScopeFromRelationship(PWSTR, DHCP_FAILOVER_RELATIONSHIP*);
uint DhcpV4FailoverGetScopeRelationship(PWSTR, uint, DHCP_FAILOVER_RELATIONSHIP**);
uint DhcpV4FailoverGetScopeStatistics(PWSTR, uint, DHCP_FAILOVER_STATISTICS**);
uint DhcpV4FailoverGetClientInfo(PWSTR, const(DHCP_SEARCH_INFO)*, DHCPV4_FAILOVER_CLIENT_INFO**);
uint DhcpV4FailoverGetSystemTime(PWSTR, uint*, uint*);
uint DhcpV4FailoverGetAddressStatus(PWSTR, uint, uint*);
uint DhcpV4FailoverTriggerAddrAllocation(PWSTR, PWSTR);
uint DhcpHlprCreateV4Policy(PWSTR, BOOL, uint, uint, DHCP_POL_LOGIC_OPER, PWSTR, BOOL, DHCP_POLICY**);
uint DhcpHlprCreateV4PolicyEx(PWSTR, BOOL, uint, uint, DHCP_POL_LOGIC_OPER, PWSTR, BOOL, DHCP_POLICY_EX**);
uint DhcpHlprAddV4PolicyExpr(DHCP_POLICY*, uint, DHCP_POL_LOGIC_OPER, uint*);
uint DhcpHlprAddV4PolicyCondition(DHCP_POLICY*, uint, DHCP_POL_ATTR_TYPE, uint, uint, PWSTR, DHCP_POL_COMPARATOR, ubyte*, uint, uint*);
uint DhcpHlprAddV4PolicyRange(DHCP_POLICY*, DHCP_IP_RANGE*);
uint DhcpHlprResetV4PolicyExpr(DHCP_POLICY*);
uint DhcpHlprModifyV4PolicyExpr(DHCP_POLICY*, DHCP_POL_LOGIC_OPER);
void DhcpHlprFreeV4Policy(DHCP_POLICY*);
void DhcpHlprFreeV4PolicyArray(DHCP_POLICY_ARRAY*);
void DhcpHlprFreeV4PolicyEx(DHCP_POLICY_EX*);
void DhcpHlprFreeV4PolicyExArray(DHCP_POLICY_EX_ARRAY*);
void DhcpHlprFreeV4DhcpProperty(DHCP_PROPERTY*);
void DhcpHlprFreeV4DhcpPropertyArray(DHCP_PROPERTY_ARRAY*);
DHCP_PROPERTY* DhcpHlprFindV4DhcpProperty(DHCP_PROPERTY_ARRAY*, DHCP_PROPERTY_ID, DHCP_PROPERTY_TYPE);
BOOL DhcpHlprIsV4PolicySingleUC(DHCP_POLICY*);
uint DhcpV4QueryPolicyEnforcement(PWSTR, BOOL, uint, BOOL*);
uint DhcpV4SetPolicyEnforcement(PWSTR, BOOL, uint, BOOL);
BOOL DhcpHlprIsV4PolicyWellFormed(DHCP_POLICY*);
uint DhcpHlprIsV4PolicyValid(DHCP_POLICY*);
uint DhcpV4CreatePolicy(PWSTR, DHCP_POLICY*);
uint DhcpV4GetPolicy(PWSTR, BOOL, uint, PWSTR, DHCP_POLICY**);
uint DhcpV4SetPolicy(PWSTR, uint, BOOL, uint, PWSTR, DHCP_POLICY*);
uint DhcpV4DeletePolicy(PWSTR, BOOL, uint, PWSTR);
uint DhcpV4EnumPolicies(PWSTR, uint*, uint, BOOL, uint, DHCP_POLICY_ARRAY**, uint*, uint*);
uint DhcpV4AddPolicyRange(PWSTR, uint, PWSTR, DHCP_IP_RANGE*);
uint DhcpV4RemovePolicyRange(PWSTR, uint, PWSTR, DHCP_IP_RANGE*);
uint DhcpV6SetStatelessStoreParams(PWSTR, BOOL, DHCP_IPV6_ADDRESS, uint, DHCPV6_STATELESS_PARAMS*);
uint DhcpV6GetStatelessStoreParams(PWSTR, BOOL, DHCP_IPV6_ADDRESS, DHCPV6_STATELESS_PARAMS**);
uint DhcpV6GetStatelessStatistics(PWSTR, DHCPV6_STATELESS_STATS**);
uint DhcpV4CreateClientInfo(const(wchar)*, const(DHCP_CLIENT_INFO_PB)*);
uint DhcpV4EnumSubnetClients(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_PB_ARRAY**, uint*, uint*);
uint DhcpV4GetClientInfo(const(wchar)*, const(DHCP_SEARCH_INFO)*, DHCP_CLIENT_INFO_PB**);
uint DhcpV6CreateClientInfo(const(wchar)*, const(DHCP_CLIENT_INFO_V6)*);
uint DhcpV4GetFreeIPAddress(PWSTR, uint, uint, uint, uint, DHCP_IP_ARRAY**);
uint DhcpV6GetFreeIPAddress(PWSTR, DHCP_IPV6_ADDRESS, DHCP_IPV6_ADDRESS, DHCP_IPV6_ADDRESS, uint, DHCPV6_IP_ARRAY**);
uint DhcpV4CreateClientInfoEx(const(wchar)*, const(DHCP_CLIENT_INFO_EX)*);
uint DhcpV4EnumSubnetClientsEx(const(wchar)*, uint, uint*, uint, DHCP_CLIENT_INFO_EX_ARRAY**, uint*, uint*);
uint DhcpV4GetClientInfoEx(const(wchar)*, const(DHCP_SEARCH_INFO)*, DHCP_CLIENT_INFO_EX**);
uint DhcpV4CreatePolicyEx(PWSTR, DHCP_POLICY_EX*);
uint DhcpV4GetPolicyEx(PWSTR, BOOL, uint, PWSTR, DHCP_POLICY_EX**);
uint DhcpV4SetPolicyEx(PWSTR, uint, BOOL, uint, PWSTR, DHCP_POLICY_EX*);
uint DhcpV4EnumPoliciesEx(PWSTR, uint*, uint, BOOL, uint, DHCP_POLICY_EX_ARRAY**, uint*, uint*);
enum OPTION_PAD = 0x00000000;
enum OPTION_SUBNET_MASK = 0x00000001;
enum OPTION_TIME_OFFSET = 0x00000002;
enum OPTION_ROUTER_ADDRESS = 0x00000003;
enum OPTION_TIME_SERVERS = 0x00000004;
enum OPTION_IEN116_NAME_SERVERS = 0x00000005;
enum OPTION_DOMAIN_NAME_SERVERS = 0x00000006;
enum OPTION_LOG_SERVERS = 0x00000007;
enum OPTION_COOKIE_SERVERS = 0x00000008;
enum OPTION_LPR_SERVERS = 0x00000009;
enum OPTION_IMPRESS_SERVERS = 0x0000000a;
enum OPTION_RLP_SERVERS = 0x0000000b;
enum OPTION_HOST_NAME = 0x0000000c;
enum OPTION_BOOT_FILE_SIZE = 0x0000000d;
enum OPTION_MERIT_DUMP_FILE = 0x0000000e;
enum OPTION_DOMAIN_NAME = 0x0000000f;
enum OPTION_SWAP_SERVER = 0x00000010;
enum OPTION_ROOT_DISK = 0x00000011;
enum OPTION_EXTENSIONS_PATH = 0x00000012;
enum OPTION_BE_A_ROUTER = 0x00000013;
enum OPTION_NON_LOCAL_SOURCE_ROUTING = 0x00000014;
enum OPTION_POLICY_FILTER_FOR_NLSR = 0x00000015;
enum OPTION_MAX_REASSEMBLY_SIZE = 0x00000016;
enum OPTION_DEFAULT_TTL = 0x00000017;
enum OPTION_PMTU_AGING_TIMEOUT = 0x00000018;
enum OPTION_PMTU_PLATEAU_TABLE = 0x00000019;
enum OPTION_MTU = 0x0000001a;
enum OPTION_ALL_SUBNETS_MTU = 0x0000001b;
enum OPTION_BROADCAST_ADDRESS = 0x0000001c;
enum OPTION_PERFORM_MASK_DISCOVERY = 0x0000001d;
enum OPTION_BE_A_MASK_SUPPLIER = 0x0000001e;
enum OPTION_PERFORM_ROUTER_DISCOVERY = 0x0000001f;
enum OPTION_ROUTER_SOLICITATION_ADDR = 0x00000020;
enum OPTION_STATIC_ROUTES = 0x00000021;
enum OPTION_TRAILERS = 0x00000022;
enum OPTION_ARP_CACHE_TIMEOUT = 0x00000023;
enum OPTION_ETHERNET_ENCAPSULATION = 0x00000024;
enum OPTION_TTL = 0x00000025;
enum OPTION_KEEP_ALIVE_INTERVAL = 0x00000026;
enum OPTION_KEEP_ALIVE_DATA_SIZE = 0x00000027;
enum OPTION_NETWORK_INFO_SERVICE_DOM = 0x00000028;
enum OPTION_NETWORK_INFO_SERVERS = 0x00000029;
enum OPTION_NETWORK_TIME_SERVERS = 0x0000002a;
enum OPTION_VENDOR_SPEC_INFO = 0x0000002b;
enum OPTION_NETBIOS_NAME_SERVER = 0x0000002c;
enum OPTION_NETBIOS_DATAGRAM_SERVER = 0x0000002d;
enum OPTION_NETBIOS_NODE_TYPE = 0x0000002e;
enum OPTION_NETBIOS_SCOPE_OPTION = 0x0000002f;
enum OPTION_XWINDOW_FONT_SERVER = 0x00000030;
enum OPTION_XWINDOW_DISPLAY_MANAGER = 0x00000031;
enum OPTION_REQUESTED_ADDRESS = 0x00000032;
enum OPTION_LEASE_TIME = 0x00000033;
enum OPTION_OK_TO_OVERLAY = 0x00000034;
enum OPTION_MESSAGE_TYPE = 0x00000035;
enum OPTION_SERVER_IDENTIFIER = 0x00000036;
enum OPTION_PARAMETER_REQUEST_LIST = 0x00000037;
enum OPTION_MESSAGE = 0x00000038;
enum OPTION_MESSAGE_LENGTH = 0x00000039;
enum OPTION_RENEWAL_TIME = 0x0000003a;
enum OPTION_REBIND_TIME = 0x0000003b;
enum OPTION_CLIENT_CLASS_INFO = 0x0000003c;
enum OPTION_CLIENT_ID = 0x0000003d;
enum OPTION_TFTP_SERVER_NAME = 0x00000042;
enum OPTION_BOOTFILE_NAME = 0x00000043;
enum OPTION_MSFT_IE_PROXY = 0x000000fc;
enum OPTION_END = 0x000000ff;
enum DHCPCAPI_REQUEST_PERSISTENT = 0x00000001;
enum DHCPCAPI_REQUEST_SYNCHRONOUS = 0x00000002;
enum DHCPCAPI_REQUEST_ASYNCHRONOUS = 0x00000004;
enum DHCPCAPI_REQUEST_CANCEL = 0x00000008;
enum DHCPCAPI_REQUEST_MASK = 0x0000000f;
enum DHCPCAPI_REGISTER_HANDLE_EVENT = 0x00000001;
enum DHCPCAPI_DEREGISTER_HANDLE_EVENT = 0x00000001;
enum ERROR_DHCP_REGISTRY_INIT_FAILED = 0x00004e20;
enum ERROR_DHCP_DATABASE_INIT_FAILED = 0x00004e21;
enum ERROR_DHCP_RPC_INIT_FAILED = 0x00004e22;
enum ERROR_DHCP_NETWORK_INIT_FAILED = 0x00004e23;
enum ERROR_DHCP_SUBNET_EXITS = 0x00004e24;
enum ERROR_DHCP_SUBNET_NOT_PRESENT = 0x00004e25;
enum ERROR_DHCP_PRIMARY_NOT_FOUND = 0x00004e26;
enum ERROR_DHCP_ELEMENT_CANT_REMOVE = 0x00004e27;
enum ERROR_DHCP_OPTION_EXITS = 0x00004e29;
enum ERROR_DHCP_OPTION_NOT_PRESENT = 0x00004e2a;
enum ERROR_DHCP_ADDRESS_NOT_AVAILABLE = 0x00004e2b;
enum ERROR_DHCP_RANGE_FULL = 0x00004e2c;
enum ERROR_DHCP_JET_ERROR = 0x00004e2d;
enum ERROR_DHCP_CLIENT_EXISTS = 0x00004e2e;
enum ERROR_DHCP_INVALID_DHCP_MESSAGE = 0x00004e2f;
enum ERROR_DHCP_INVALID_DHCP_CLIENT = 0x00004e30;
enum ERROR_DHCP_SERVICE_PAUSED = 0x00004e31;
enum ERROR_DHCP_NOT_RESERVED_CLIENT = 0x00004e32;
enum ERROR_DHCP_RESERVED_CLIENT = 0x00004e33;
enum ERROR_DHCP_RANGE_TOO_SMALL = 0x00004e34;
enum ERROR_DHCP_IPRANGE_EXITS = 0x00004e35;
enum ERROR_DHCP_RESERVEDIP_EXITS = 0x00004e36;
enum ERROR_DHCP_INVALID_RANGE = 0x00004e37;
enum ERROR_DHCP_RANGE_EXTENDED = 0x00004e38;
enum ERROR_EXTEND_TOO_SMALL = 0x00004e39;
enum WARNING_EXTENDED_LESS = 0x00004e3a;
enum ERROR_DHCP_JET_CONV_REQUIRED = 0x00004e3b;
enum ERROR_SERVER_INVALID_BOOT_FILE_TABLE = 0x00004e3c;
enum ERROR_SERVER_UNKNOWN_BOOT_FILE_NAME = 0x00004e3d;
enum ERROR_DHCP_SUPER_SCOPE_NAME_TOO_LONG = 0x00004e3e;
enum ERROR_DHCP_IP_ADDRESS_IN_USE = 0x00004e40;
enum ERROR_DHCP_LOG_FILE_PATH_TOO_LONG = 0x00004e41;
enum ERROR_DHCP_UNSUPPORTED_CLIENT = 0x00004e42;
enum ERROR_DHCP_JET97_CONV_REQUIRED = 0x00004e44;
enum ERROR_DHCP_ROGUE_INIT_FAILED = 0x00004e45;
enum ERROR_DHCP_ROGUE_SAMSHUTDOWN = 0x00004e46;
enum ERROR_DHCP_ROGUE_NOT_AUTHORIZED = 0x00004e47;
enum ERROR_DHCP_ROGUE_DS_UNREACHABLE = 0x00004e48;
enum ERROR_DHCP_ROGUE_DS_CONFLICT = 0x00004e49;
enum ERROR_DHCP_ROGUE_NOT_OUR_ENTERPRISE = 0x00004e4a;
enum ERROR_DHCP_ROGUE_STANDALONE_IN_DS = 0x00004e4b;
enum ERROR_DHCP_CLASS_NOT_FOUND = 0x00004e4c;
enum ERROR_DHCP_CLASS_ALREADY_EXISTS = 0x00004e4d;
enum ERROR_DHCP_SCOPE_NAME_TOO_LONG = 0x00004e4e;
enum ERROR_DHCP_DEFAULT_SCOPE_EXITS = 0x00004e4f;
enum ERROR_DHCP_CANT_CHANGE_ATTRIBUTE = 0x00004e50;
enum ERROR_DHCP_IPRANGE_CONV_ILLEGAL = 0x00004e51;
enum ERROR_DHCP_NETWORK_CHANGED = 0x00004e52;
enum ERROR_DHCP_CANNOT_MODIFY_BINDINGS = 0x00004e53;
enum ERROR_DHCP_SUBNET_EXISTS = 0x00004e54;
enum ERROR_DHCP_MSCOPE_EXISTS = 0x00004e55;
enum ERROR_MSCOPE_RANGE_TOO_SMALL = 0x00004e56;
enum ERROR_DHCP_EXEMPTION_EXISTS = 0x00004e57;
enum ERROR_DHCP_EXEMPTION_NOT_PRESENT = 0x00004e58;
enum ERROR_DHCP_INVALID_PARAMETER_OPTION32 = 0x00004e59;
enum ERROR_DDS_NO_DS_AVAILABLE = 0x00004e66;
enum ERROR_DDS_NO_DHCP_ROOT = 0x00004e67;
enum ERROR_DDS_UNEXPECTED_ERROR = 0x00004e68;
enum ERROR_DDS_TOO_MANY_ERRORS = 0x00004e69;
enum ERROR_DDS_DHCP_SERVER_NOT_FOUND = 0x00004e6a;
enum ERROR_DDS_OPTION_ALREADY_EXISTS = 0x00004e6b;
enum ERROR_DDS_OPTION_DOES_NOT_EXIST = 0x00004e6c;
enum ERROR_DDS_CLASS_EXISTS = 0x00004e6d;
enum ERROR_DDS_CLASS_DOES_NOT_EXIST = 0x00004e6e;
enum ERROR_DDS_SERVER_ALREADY_EXISTS = 0x00004e6f;
enum ERROR_DDS_SERVER_DOES_NOT_EXIST = 0x00004e70;
enum ERROR_DDS_SERVER_ADDRESS_MISMATCH = 0x00004e71;
enum ERROR_DDS_SUBNET_EXISTS = 0x00004e72;
enum ERROR_DDS_SUBNET_HAS_DIFF_SSCOPE = 0x00004e73;
enum ERROR_DDS_SUBNET_NOT_PRESENT = 0x00004e74;
enum ERROR_DDS_RESERVATION_NOT_PRESENT = 0x00004e75;
enum ERROR_DDS_RESERVATION_CONFLICT = 0x00004e76;
enum ERROR_DDS_POSSIBLE_RANGE_CONFLICT = 0x00004e77;
enum ERROR_DDS_RANGE_DOES_NOT_EXIST = 0x00004e78;
enum ERROR_DHCP_DELETE_BUILTIN_CLASS = 0x00004e79;
enum ERROR_DHCP_INVALID_SUBNET_PREFIX = 0x00004e7b;
enum ERROR_DHCP_INVALID_DELAY = 0x00004e7c;
enum ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS = 0x00004e7d;
enum ERROR_DHCP_LINKLAYER_ADDRESS_RESERVATION_EXISTS = 0x00004e7e;
enum ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST = 0x00004e7f;
enum ERROR_DHCP_HARDWARE_ADDRESS_TYPE_ALREADY_EXEMPT = 0x00004e85;
enum ERROR_DHCP_UNDEFINED_HARDWARE_ADDRESS_TYPE = 0x00004e86;
enum ERROR_DHCP_OPTION_TYPE_MISMATCH = 0x00004e87;
enum ERROR_DHCP_POLICY_BAD_PARENT_EXPR = 0x00004e88;
enum ERROR_DHCP_POLICY_EXISTS = 0x00004e89;
enum ERROR_DHCP_POLICY_RANGE_EXISTS = 0x00004e8a;
enum ERROR_DHCP_POLICY_RANGE_BAD = 0x00004e8b;
enum ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY = 0x00004e8c;
enum ERROR_DHCP_INVALID_POLICY_EXPRESSION = 0x00004e8d;
enum ERROR_DHCP_INVALID_PROCESSING_ORDER = 0x00004e8e;
enum ERROR_DHCP_POLICY_NOT_FOUND = 0x00004e8f;
enum ERROR_SCOPE_RANGE_POLICY_RANGE_CONFLICT = 0x00004e90;
enum ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP = 0x00004e91;
enum ERROR_DHCP_FO_RELATIONSHIP_EXISTS = 0x00004e92;
enum ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST = 0x00004e93;
enum ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP = 0x00004e94;
enum ERROR_DHCP_FO_RELATION_IS_SECONDARY = 0x00004e95;
enum ERROR_DHCP_FO_NOT_SUPPORTED = 0x00004e96;
enum ERROR_DHCP_FO_TIME_OUT_OF_SYNC = 0x00004e97;
enum ERROR_DHCP_FO_STATE_NOT_NORMAL = 0x00004e98;
enum ERROR_DHCP_NO_ADMIN_PERMISSION = 0x00004e99;
enum ERROR_DHCP_SERVER_NOT_REACHABLE = 0x00004e9a;
enum ERROR_DHCP_SERVER_NOT_RUNNING = 0x00004e9b;
enum ERROR_DHCP_SERVER_NAME_NOT_RESOLVED = 0x00004e9c;
enum ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG = 0x00004e9d;
enum ERROR_DHCP_REACHED_END_OF_SELECTION = 0x00004e9e;
enum ERROR_DHCP_FO_ADDSCOPE_LEASES_NOT_SYNCED = 0x00004e9f;
enum ERROR_DHCP_FO_MAX_RELATIONSHIPS = 0x00004ea0;
enum ERROR_DHCP_FO_IPRANGE_TYPE_CONV_ILLEGAL = 0x00004ea1;
enum ERROR_DHCP_FO_MAX_ADD_SCOPES = 0x00004ea2;
enum ERROR_DHCP_FO_BOOT_NOT_SUPPORTED = 0x00004ea3;
enum ERROR_DHCP_FO_RANGE_PART_OF_REL = 0x00004ea4;
enum ERROR_DHCP_FO_SCOPE_SYNC_IN_PROGRESS = 0x00004ea5;
enum ERROR_DHCP_FO_FEATURE_NOT_SUPPORTED = 0x00004ea6;
enum ERROR_DHCP_POLICY_FQDN_RANGE_UNSUPPORTED = 0x00004ea7;
enum ERROR_DHCP_POLICY_FQDN_OPTION_UNSUPPORTED = 0x00004ea8;
enum ERROR_DHCP_POLICY_EDIT_FQDN_UNSUPPORTED = 0x00004ea9;
enum ERROR_DHCP_NAP_NOT_SUPPORTED = 0x00004eaa;
enum ERROR_LAST_DHCP_SERVER_ERROR = 0x00004eab;
enum DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE = 0x00000001;
enum MAX_PATTERN_LENGTH = 0x000000ff;
enum MAC_ADDRESS_LENGTH = 0x00000006;
enum HWTYPE_ETHERNET_10MB = 0x00000001;
enum FILTER_STATUS_NONE = 0x00000001;
enum FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST = 0x00000002;
enum FILTER_STATUS_FULL_MATCH_IN_DENY_LIST = 0x00000004;
enum FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST = 0x00000008;
enum FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST = 0x00000010;
enum Set_APIProtocolSupport = 0x00000001;
enum Set_DatabaseName = 0x00000002;
enum Set_DatabasePath = 0x00000004;
enum Set_BackupPath = 0x00000008;
enum Set_BackupInterval = 0x00000010;
enum Set_DatabaseLoggingFlag = 0x00000020;
enum Set_RestoreFlag = 0x00000040;
enum Set_DatabaseCleanupInterval = 0x00000080;
enum Set_DebugFlag = 0x00000100;
enum Set_PingRetries = 0x00000200;
enum Set_BootFileTable = 0x00000400;
enum Set_AuditLogState = 0x00000800;
enum Set_QuarantineON = 0x00001000;
enum Set_QuarantineDefFail = 0x00002000;
enum CLIENT_TYPE_UNSPECIFIED = 0x00000000;
enum CLIENT_TYPE_DHCP = 0x00000001;
enum CLIENT_TYPE_BOOTP = 0x00000002;
enum CLIENT_TYPE_RESERVATION_FLAG = 0x00000004;
enum CLIENT_TYPE_NONE = 0x00000064;
enum Set_UnicastFlag = 0x00000001;
enum Set_RapidCommitFlag = 0x00000002;
enum Set_PreferredLifetime = 0x00000004;
enum Set_ValidLifetime = 0x00000008;
enum Set_T1 = 0x00000010;
enum Set_T2 = 0x00000020;
enum Set_PreferredLifetimeIATA = 0x00000040;
enum Set_ValidLifetimeIATA = 0x00000080;
enum V5_ADDRESS_STATE_OFFERED = 0x00000000;
enum V5_ADDRESS_STATE_ACTIVE = 0x00000001;
enum V5_ADDRESS_STATE_DECLINED = 0x00000002;
enum V5_ADDRESS_STATE_DOOM = 0x00000003;
enum V5_ADDRESS_BIT_DELETED = 0x00000080;
enum V5_ADDRESS_BIT_UNREGISTERED = 0x00000040;
enum V5_ADDRESS_BIT_BOTH_REC = 0x00000020;
enum V5_ADDRESS_EX_BIT_DISABLE_PTR_RR = 0x00000001;
enum DNS_FLAG_ENABLED = 0x00000001;
enum DNS_FLAG_UPDATE_DOWNLEVEL = 0x00000002;
enum DNS_FLAG_CLEANUP_EXPIRED = 0x00000004;
enum DNS_FLAG_UPDATE_BOTH_ALWAYS = 0x00000010;
enum DNS_FLAG_UPDATE_DHCID = 0x00000020;
enum DNS_FLAG_DISABLE_PTR_UPDATE = 0x00000040;
enum DNS_FLAG_HAS_DNS_SUFFIX = 0x00000080;
enum DHCP_OPT_ENUM_IGNORE_VENDOR = 0x00000001;
enum DHCP_OPT_ENUM_USE_CLASSNAME = 0x00000002;
enum DHCP_FLAGS_DONT_ACCESS_DS = 0x00000001;
enum DHCP_FLAGS_DONT_DO_RPC = 0x00000002;
enum DHCP_FLAGS_OPTION_IS_VENDOR = 0x00000003;
enum DHCP_ATTRIB_BOOL_IS_ROGUE = 0x00000001;
enum DHCP_ATTRIB_BOOL_IS_DYNBOOTP = 0x00000002;
enum DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC = 0x00000003;
enum DHCP_ATTRIB_BOOL_IS_BINDING_AWARE = 0x00000004;
enum DHCP_ATTRIB_BOOL_IS_ADMIN = 0x00000005;
enum DHCP_ATTRIB_ULONG_RESTORE_STATUS = 0x00000006;
enum DHCP_ATTRIB_TYPE_BOOL = 0x00000001;
enum DHCP_ATTRIB_TYPE_ULONG = 0x00000002;
enum DHCP_ENDPOINT_FLAG_CANT_MODIFY = 0x00000001;
enum QUARANTIN_OPTION_BASE = 0x0000a8d4;
enum QUARANTINE_SCOPE_QUARPROFILE_OPTION = 0x0000a8d5;
enum QUARANTINE_CONFIG_OPTION = 0x0000a8d6;
enum ADDRESS_TYPE_IANA = 0x00000000;
enum ADDRESS_TYPE_IATA = 0x00000001;
enum DHCP_MIN_DELAY = 0x00000000;
enum DHCP_MAX_DELAY = 0x000003e8;
enum DHCP_FAILOVER_DELETE_SCOPES = 0x00000001;
enum DHCP_FAILOVER_MAX_NUM_ADD_SCOPES = 0x00000190;
enum DHCP_FAILOVER_MAX_NUM_REL = 0x0000001f;
enum MCLT = 0x00000001;
enum SAFEPERIOD = 0x00000002;
enum CHANGESTATE = 0x00000004;
enum PERCENTAGE = 0x00000008;
enum MODE = 0x00000010;
enum PREVSTATE = 0x00000020;
enum SHAREDSECRET = 0x00000040;
enum DHCP_CALLOUT_LIST_KEY = "System\\CurrentControlSet\\Services\\DHCPServer\\Parameters";
enum DHCP_CALLOUT_LIST_VALUE = "CalloutDlls";
enum DHCP_CALLOUT_ENTRY_POINT = "DhcpServerCalloutEntry";
enum DHCP_CONTROL_START = 0x00000001;
enum DHCP_CONTROL_STOP = 0x00000002;
enum DHCP_CONTROL_PAUSE = 0x00000003;
enum DHCP_CONTROL_CONTINUE = 0x00000004;
enum DHCP_DROP_DUPLICATE = 0x00000001;
enum DHCP_DROP_NOMEM = 0x00000002;
enum DHCP_DROP_INTERNAL_ERROR = 0x00000003;
enum DHCP_DROP_TIMEOUT = 0x00000004;
enum DHCP_DROP_UNAUTH = 0x00000005;
enum DHCP_DROP_PAUSED = 0x00000006;
enum DHCP_DROP_NO_SUBNETS = 0x00000007;
enum DHCP_DROP_INVALID = 0x00000008;
enum DHCP_DROP_WRONG_SERVER = 0x00000009;
enum DHCP_DROP_NOADDRESS = 0x0000000a;
enum DHCP_DROP_PROCESSED = 0x0000000b;
enum DHCP_DROP_GEN_FAILURE = 0x00000100;
enum DHCP_SEND_PACKET = 0x10000000;
enum DHCP_PROB_CONFLICT = 0x20000001;
enum DHCP_PROB_DECLINE = 0x20000002;
enum DHCP_PROB_RELEASE = 0x20000003;
enum DHCP_PROB_NACKED = 0x20000004;
enum DHCP_GIVE_ADDRESS_NEW = 0x30000001;
enum DHCP_GIVE_ADDRESS_OLD = 0x30000002;
enum DHCP_CLIENT_BOOTP = 0x30000003;
enum DHCP_CLIENT_DHCP = 0x30000004;
enum DHCPV6_OPTION_CLIENTID = 0x00000001;
enum DHCPV6_OPTION_SERVERID = 0x00000002;
enum DHCPV6_OPTION_IA_NA = 0x00000003;
enum DHCPV6_OPTION_IA_TA = 0x00000004;
enum DHCPV6_OPTION_ORO = 0x00000006;
enum DHCPV6_OPTION_PREFERENCE = 0x00000007;
enum DHCPV6_OPTION_UNICAST = 0x0000000c;
enum DHCPV6_OPTION_RAPID_COMMIT = 0x0000000e;
enum DHCPV6_OPTION_USER_CLASS = 0x0000000f;
enum DHCPV6_OPTION_VENDOR_CLASS = 0x00000010;
enum DHCPV6_OPTION_VENDOR_OPTS = 0x00000011;
enum DHCPV6_OPTION_RECONF_MSG = 0x00000013;
enum DHCPV6_OPTION_SIP_SERVERS_NAMES = 0x00000015;
enum DHCPV6_OPTION_SIP_SERVERS_ADDRS = 0x00000016;
enum DHCPV6_OPTION_DNS_SERVERS = 0x00000017;
enum DHCPV6_OPTION_DOMAIN_LIST = 0x00000018;
enum DHCPV6_OPTION_IA_PD = 0x00000019;
enum DHCPV6_OPTION_NIS_SERVERS = 0x0000001b;
enum DHCPV6_OPTION_NISP_SERVERS = 0x0000001c;
enum DHCPV6_OPTION_NIS_DOMAIN_NAME = 0x0000001d;
enum DHCPV6_OPTION_NISP_DOMAIN_NAME = 0x0000001e;
struct DHCPV6CAPI_PARAMS
{
    uint Flags;
    uint OptionId;
    BOOL IsVendor;
    ubyte* Data;
    uint nBytesData;
}
struct DHCPV6CAPI_PARAMS_ARRAY
{
    uint nParams;
    DHCPV6CAPI_PARAMS* Params;
}
struct DHCPV6CAPI_CLASSID
{
    uint Flags;
    ubyte* Data;
    uint nBytesData;
}
alias StatusCode = int;
enum : int
{
    STATUS_NO_ERROR            = 0x00000000,
    STATUS_UNSPECIFIED_FAILURE = 0x00000001,
    STATUS_NO_BINDING          = 0x00000003,
    STATUS_NOPREFIX_AVAIL      = 0x00000006,
}

struct DHCPV6Prefix
{
    ubyte[16] prefix;
    uint prefixLength;
    uint preferredLifeTime;
    uint validLifeTime;
    StatusCode status;
}
struct DHCPV6PrefixLeaseInformation
{
    uint nPrefixes;
    DHCPV6Prefix* prefixArray;
    uint iaid;
    long T1;
    long T2;
    long MaxLeaseExpirationTime;
    long LastRenewalTime;
    StatusCode status;
    ubyte* ServerId;
    uint ServerIdLen;
}
struct DHCPAPI_PARAMS
{
    uint Flags;
    uint OptionId;
    BOOL IsVendor;
    ubyte* Data;
    uint nBytesData;
}
struct DHCPCAPI_PARAMS_ARRAY
{
    uint nParams;
    DHCPAPI_PARAMS* Params;
}
struct DHCPCAPI_CLASSID
{
    uint Flags;
    ubyte* Data;
    uint nBytesData;
}
struct DHCP_SERVER_OPTIONS
{
    ubyte* MessageType;
    uint* SubnetMask;
    uint* RequestedAddress;
    uint* RequestLeaseTime;
    ubyte* OverlayFields;
    uint* RouterAddress;
    uint* Server;
    ubyte* ParameterRequestList;
    uint ParameterRequestListLength;
    PSTR MachineName;
    uint MachineNameLength;
    ubyte ClientHardwareAddressType;
    ubyte ClientHardwareAddressLength;
    ubyte* ClientHardwareAddress;
    PSTR ClassIdentifier;
    uint ClassIdentifierLength;
    ubyte* VendorClass;
    uint VendorClassLength;
    uint DNSFlags;
    uint DNSNameLength;
    ubyte* DNSName;
    BOOLEAN DSDomainNameRequested;
    PSTR DSDomainName;
    uint DSDomainNameLen;
    uint* ScopeId;
}
alias LPDHCP_CONTROL = uint function(uint, void*);
alias LPDHCP_NEWPKT = uint function(ubyte**, uint*, uint, void*, void**, int*);
alias LPDHCP_DROP_SEND = uint function(ubyte**, uint*, uint, uint, void*, void*);
alias LPDHCP_PROB = uint function(ubyte*, uint, uint, uint, uint, void*, void*);
alias LPDHCP_GIVE_ADDRESS = uint function(ubyte*, uint, uint, uint, uint, uint, uint, void*, void*);
alias LPDHCP_HANDLE_OPTIONS = uint function(ubyte*, uint, void*, void*, DHCP_SERVER_OPTIONS*);
alias LPDHCP_DELETE_CLIENT = uint function(uint, ubyte*, uint, uint, uint);
struct DHCP_CALLOUT_TABLE
{
    LPDHCP_CONTROL DhcpControlHook;
    LPDHCP_NEWPKT DhcpNewPktHook;
    LPDHCP_DROP_SEND DhcpPktDropHook;
    LPDHCP_DROP_SEND DhcpPktSendHook;
    LPDHCP_PROB DhcpAddressDelHook;
    LPDHCP_GIVE_ADDRESS DhcpAddressOfferHook;
    LPDHCP_HANDLE_OPTIONS DhcpHandleOptionsHook;
    LPDHCP_DELETE_CLIENT DhcpDeleteClientHook;
    void* DhcpExtensionHook;
    void* DhcpReservedHook;
}
alias LPDHCP_ENTRY_POINT_FUNC = uint function(PWSTR, uint, DHCP_CALLOUT_TABLE*);
struct DATE_TIME
{
    uint dwLowDateTime;
    uint dwHighDateTime;
}
struct DHCP_IP_RANGE
{
    uint StartAddress;
    uint EndAddress;
}
struct DHCP_BINARY_DATA
{
    uint DataLength;
    ubyte* Data;
}
struct DHCP_HOST_INFO
{
    uint IpAddress;
    PWSTR NetBiosName;
    PWSTR HostName;
}
alias DHCP_FORCE_FLAG = int;
enum : int
{
    DhcpFullForce     = 0x00000000,
    DhcpNoForce       = 0x00000001,
    DhcpFailoverForce = 0x00000002,
}

struct DWORD_DWORD
{
    uint DWord1;
    uint DWord2;
}
alias DHCP_SUBNET_STATE = int;
enum : int
{
    DhcpSubnetEnabled          = 0x00000000,
    DhcpSubnetDisabled         = 0x00000001,
    DhcpSubnetEnabledSwitched  = 0x00000002,
    DhcpSubnetDisabledSwitched = 0x00000003,
    DhcpSubnetInvalidState     = 0x00000004,
}

struct DHCP_SUBNET_INFO
{
    uint SubnetAddress;
    uint SubnetMask;
    PWSTR SubnetName;
    PWSTR SubnetComment;
    DHCP_HOST_INFO PrimaryHost;
    DHCP_SUBNET_STATE SubnetState;
}
struct DHCP_SUBNET_INFO_VQ
{
    uint SubnetAddress;
    uint SubnetMask;
    PWSTR SubnetName;
    PWSTR SubnetComment;
    DHCP_HOST_INFO PrimaryHost;
    DHCP_SUBNET_STATE SubnetState;
    uint QuarantineOn;
    uint Reserved1;
    uint Reserved2;
    long Reserved3;
    long Reserved4;
}
struct DHCP_IP_ARRAY
{
    uint NumElements;
    uint* Elements;
}
struct DHCP_IP_CLUSTER
{
    uint ClusterAddress;
    uint ClusterMask;
}
struct DHCP_IP_RESERVATION
{
    uint ReservedIpAddress;
    DHCP_BINARY_DATA* ReservedForClient;
}
alias DHCP_SUBNET_ELEMENT_TYPE = int;
enum : int
{
    DhcpIpRanges          = 0x00000000,
    DhcpSecondaryHosts    = 0x00000001,
    DhcpReservedIps       = 0x00000002,
    DhcpExcludedIpRanges  = 0x00000003,
    DhcpIpUsedClusters    = 0x00000004,
    DhcpIpRangesDhcpOnly  = 0x00000005,
    DhcpIpRangesDhcpBootp = 0x00000006,
    DhcpIpRangesBootpOnly = 0x00000007,
}

struct DHCP_SUBNET_ELEMENT_DATA
{
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
    union DHCP_SUBNET_ELEMENT_UNION
    {
        DHCP_IP_RANGE* IpRange;
        DHCP_HOST_INFO* SecondaryHost;
        DHCP_IP_RESERVATION* ReservedIp;
        DHCP_IP_RANGE* ExcludeIpRange;
        DHCP_IP_CLUSTER* IpUsedCluster;
    }
}
union DHCP_SUBNET_ELEMENT_UNION
{
}
struct DHCP_SUBNET_ELEMENT_INFO_ARRAY
{
    uint NumElements;
    DHCP_SUBNET_ELEMENT_DATA* Elements;
}
struct DHCP_IPV6_ADDRESS
{
    ulong HighOrderBits;
    ulong LowOrderBits;
}
alias DHCP_FILTER_LIST_TYPE = int;
enum : int
{
    Deny    = 0x00000000,
    Allow   = 0x00000001,
}

struct DHCP_ADDR_PATTERN
{
    BOOL MatchHWType;
    ubyte HWType;
    BOOL IsWildcard;
    ubyte Length;
    ubyte[255] Pattern;
}
struct DHCP_FILTER_ADD_INFO
{
    DHCP_ADDR_PATTERN AddrPatt;
    PWSTR Comment;
    DHCP_FILTER_LIST_TYPE ListType;
}
struct DHCP_FILTER_GLOBAL_INFO
{
    BOOL EnforceAllowList;
    BOOL EnforceDenyList;
}
struct DHCP_FILTER_RECORD
{
    DHCP_ADDR_PATTERN AddrPatt;
    PWSTR Comment;
}
struct DHCP_FILTER_ENUM_INFO
{
    uint NumElements;
    DHCP_FILTER_RECORD* pEnumRecords;
}
alias DHCP_OPTION_DATA_TYPE = int;
enum : int
{
    DhcpByteOption             = 0x00000000,
    DhcpWordOption             = 0x00000001,
    DhcpDWordOption            = 0x00000002,
    DhcpDWordDWordOption       = 0x00000003,
    DhcpIpAddressOption        = 0x00000004,
    DhcpStringDataOption       = 0x00000005,
    DhcpBinaryDataOption       = 0x00000006,
    DhcpEncapsulatedDataOption = 0x00000007,
    DhcpIpv6AddressOption      = 0x00000008,
}

struct DHCP_OPTION_DATA_ELEMENT
{
    DHCP_OPTION_DATA_TYPE OptionType;
    union DHCP_OPTION_ELEMENT_UNION
    {
        ubyte ByteOption;
        ushort WordOption;
        uint DWordOption;
        DWORD_DWORD DWordDWordOption;
        uint IpAddressOption;
        PWSTR StringDataOption;
        DHCP_BINARY_DATA BinaryDataOption;
        DHCP_BINARY_DATA EncapsulatedDataOption;
        PWSTR Ipv6AddressDataOption;
    }
}
union DHCP_OPTION_ELEMENT_UNION
{
}
struct DHCP_OPTION_DATA
{
    uint NumElements;
    DHCP_OPTION_DATA_ELEMENT* Elements;
}
alias DHCP_OPTION_TYPE = int;
enum : int
{
    DhcpUnaryElementTypeOption = 0x00000000,
    DhcpArrayTypeOption        = 0x00000001,
}

struct DHCP_OPTION
{
    uint OptionID;
    PWSTR OptionName;
    PWSTR OptionComment;
    DHCP_OPTION_DATA DefaultValue;
    DHCP_OPTION_TYPE OptionType;
}
struct DHCP_OPTION_ARRAY
{
    uint NumElements;
    DHCP_OPTION* Options;
}
struct DHCP_OPTION_VALUE
{
    uint OptionID;
    DHCP_OPTION_DATA Value;
}
struct DHCP_OPTION_VALUE_ARRAY
{
    uint NumElements;
    DHCP_OPTION_VALUE* Values;
}
alias DHCP_OPTION_SCOPE_TYPE = int;
enum : int
{
    DhcpDefaultOptions  = 0x00000000,
    DhcpGlobalOptions   = 0x00000001,
    DhcpSubnetOptions   = 0x00000002,
    DhcpReservedOptions = 0x00000003,
    DhcpMScopeOptions   = 0x00000004,
}

struct DHCP_RESERVED_SCOPE
{
    uint ReservedIpAddress;
    uint ReservedIpSubnetAddress;
}
struct DHCP_OPTION_SCOPE_INFO
{
    DHCP_OPTION_SCOPE_TYPE ScopeType;
    union _DHCP_OPTION_SCOPE_UNION
    {
        void* DefaultScopeInfo;
        void* GlobalScopeInfo;
        uint SubnetScopeInfo;
        DHCP_RESERVED_SCOPE ReservedScopeInfo;
        PWSTR MScopeInfo;
    }
}
alias DHCP_OPTION_SCOPE_TYPE6 = int;
enum : int
{
    DhcpDefaultOptions6  = 0x00000000,
    DhcpScopeOptions6    = 0x00000001,
    DhcpReservedOptions6 = 0x00000002,
    DhcpGlobalOptions6   = 0x00000003,
}

struct DHCP_RESERVED_SCOPE6
{
    DHCP_IPV6_ADDRESS ReservedIpAddress;
    DHCP_IPV6_ADDRESS ReservedIpSubnetAddress;
}
struct DHCP_OPTION_SCOPE_INFO6
{
    DHCP_OPTION_SCOPE_TYPE6 ScopeType;
    union DHCP_OPTION_SCOPE_UNION6
    {
        void* DefaultScopeInfo;
        DHCP_IPV6_ADDRESS SubnetScopeInfo;
        DHCP_RESERVED_SCOPE6 ReservedScopeInfo;
    }
}
union DHCP_OPTION_SCOPE_UNION6
{
}
struct DHCP_OPTION_LIST
{
    uint NumOptions;
    DHCP_OPTION_VALUE* Options;
}
struct DHCP_CLIENT_INFO
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
}
struct DHCP_CLIENT_INFO_ARRAY
{
    uint NumElements;
    DHCP_CLIENT_INFO** Clients;
}
alias QuarantineStatus = int;
enum : int
{
    NOQUARANTINE       = 0x00000000,
    RESTRICTEDACCESS   = 0x00000001,
    DROPPACKET         = 0x00000002,
    PROBATION          = 0x00000003,
    EXEMPT             = 0x00000004,
    DEFAULTQUARSETTING = 0x00000005,
    NOQUARINFO         = 0x00000006,
}

struct DHCP_CLIENT_INFO_VQ
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
}
struct DHCP_CLIENT_INFO_ARRAY_VQ
{
    uint NumElements;
    DHCP_CLIENT_INFO_VQ** Clients;
}
struct DHCP_CLIENT_FILTER_STATUS_INFO
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    uint FilterStatus;
}
struct DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY
{
    uint NumElements;
    DHCP_CLIENT_FILTER_STATUS_INFO** Clients;
}
struct DHCP_CLIENT_INFO_PB
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    uint FilterStatus;
    PWSTR PolicyName;
}
struct DHCP_CLIENT_INFO_PB_ARRAY
{
    uint NumElements;
    DHCP_CLIENT_INFO_PB** Clients;
}
alias DHCP_SEARCH_INFO_TYPE = int;
enum : int
{
    DhcpClientIpAddress       = 0x00000000,
    DhcpClientHardwareAddress = 0x00000001,
    DhcpClientName            = 0x00000002,
}

struct DHCP_SEARCH_INFO
{
    DHCP_SEARCH_INFO_TYPE SearchType;
    union DHCP_CLIENT_SEARCH_UNION
    {
        uint ClientIpAddress;
        DHCP_BINARY_DATA ClientHardwareAddress;
        PWSTR ClientName;
    }
}
union DHCP_CLIENT_SEARCH_UNION
{
}
alias DHCP_PROPERTY_TYPE = int;
enum : int
{
    DhcpPropTypeByte   = 0x00000000,
    DhcpPropTypeWord   = 0x00000001,
    DhcpPropTypeDword  = 0x00000002,
    DhcpPropTypeString = 0x00000003,
    DhcpPropTypeBinary = 0x00000004,
}

alias DHCP_PROPERTY_ID = int;
enum : int
{
    DhcpPropIdPolicyDnsSuffix      = 0x00000000,
    DhcpPropIdClientAddressStateEx = 0x00000001,
}

struct DHCP_PROPERTY
{
    DHCP_PROPERTY_ID ID;
    DHCP_PROPERTY_TYPE Type;
    union _DHCP_PROPERTY_VALUE_UNION
    {
        ubyte ByteValue;
        ushort WordValue;
        uint DWordValue;
        PWSTR StringValue;
        DHCP_BINARY_DATA BinaryValue;
    }
}
struct DHCP_PROPERTY_ARRAY
{
    uint NumElements;
    DHCP_PROPERTY* Elements;
}
struct DHCP_CLIENT_INFO_EX
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    uint FilterStatus;
    PWSTR PolicyName;
    DHCP_PROPERTY_ARRAY* Properties;
}
struct DHCP_CLIENT_INFO_EX_ARRAY
{
    uint NumElements;
    DHCP_CLIENT_INFO_EX** Clients;
}
struct SCOPE_MIB_INFO
{
    uint Subnet;
    uint NumAddressesInuse;
    uint NumAddressesFree;
    uint NumPendingOffers;
}
struct DHCP_MIB_INFO
{
    uint Discovers;
    uint Offers;
    uint Requests;
    uint Acks;
    uint Naks;
    uint Declines;
    uint Releases;
    DATE_TIME ServerStartTime;
    uint Scopes;
    SCOPE_MIB_INFO* ScopeInfo;
}
struct SCOPE_MIB_INFO_VQ
{
    uint Subnet;
    uint NumAddressesInuse;
    uint NumAddressesFree;
    uint NumPendingOffers;
    uint QtnNumLeases;
    uint QtnPctQtnLeases;
    uint QtnProbationLeases;
    uint QtnNonQtnLeases;
    uint QtnExemptLeases;
    uint QtnCapableClients;
}
struct DHCP_MIB_INFO_VQ
{
    uint Discovers;
    uint Offers;
    uint Requests;
    uint Acks;
    uint Naks;
    uint Declines;
    uint Releases;
    DATE_TIME ServerStartTime;
    uint QtnNumLeases;
    uint QtnPctQtnLeases;
    uint QtnProbationLeases;
    uint QtnNonQtnLeases;
    uint QtnExemptLeases;
    uint QtnCapableClients;
    uint QtnIASErrors;
    uint Scopes;
    SCOPE_MIB_INFO_VQ* ScopeInfo;
}
struct SCOPE_MIB_INFO_V5
{
    uint Subnet;
    uint NumAddressesInuse;
    uint NumAddressesFree;
    uint NumPendingOffers;
}
struct DHCP_MIB_INFO_V5
{
    uint Discovers;
    uint Offers;
    uint Requests;
    uint Acks;
    uint Naks;
    uint Declines;
    uint Releases;
    DATE_TIME ServerStartTime;
    uint QtnNumLeases;
    uint QtnPctQtnLeases;
    uint QtnProbationLeases;
    uint QtnNonQtnLeases;
    uint QtnExemptLeases;
    uint QtnCapableClients;
    uint QtnIASErrors;
    uint DelayedOffers;
    uint ScopesWithDelayedOffers;
    uint Scopes;
    SCOPE_MIB_INFO_V5* ScopeInfo;
}
struct DHCP_SERVER_CONFIG_INFO
{
    uint APIProtocolSupport;
    PWSTR DatabaseName;
    PWSTR DatabasePath;
    PWSTR BackupPath;
    uint BackupInterval;
    uint DatabaseLoggingFlag;
    uint RestoreFlag;
    uint DatabaseCleanupInterval;
    uint DebugFlag;
}
alias DHCP_SCAN_FLAG = int;
enum : int
{
    DhcpRegistryFix = 0x00000000,
    DhcpDatabaseFix = 0x00000001,
}

struct DHCP_SCAN_ITEM
{
    uint IpAddress;
    DHCP_SCAN_FLAG ScanFlag;
}
struct DHCP_SCAN_LIST
{
    uint NumScanItems;
    DHCP_SCAN_ITEM* ScanItems;
}
struct DHCP_CLASS_INFO
{
    PWSTR ClassName;
    PWSTR ClassComment;
    uint ClassDataLength;
    BOOL IsVendor;
    uint Flags;
    ubyte* ClassData;
}
struct DHCP_CLASS_INFO_ARRAY
{
    uint NumElements;
    DHCP_CLASS_INFO* Classes;
}
struct DHCP_CLASS_INFO_V6
{
    PWSTR ClassName;
    PWSTR ClassComment;
    uint ClassDataLength;
    BOOL IsVendor;
    uint EnterpriseNumber;
    uint Flags;
    ubyte* ClassData;
}
struct DHCP_CLASS_INFO_ARRAY_V6
{
    uint NumElements;
    DHCP_CLASS_INFO_V6* Classes;
}
struct DHCP_SERVER_SPECIFIC_STRINGS
{
    PWSTR DefaultVendorClassName;
    PWSTR DefaultUserClassName;
}
struct DHCP_IP_RESERVATION_V4
{
    uint ReservedIpAddress;
    DHCP_BINARY_DATA* ReservedForClient;
    ubyte bAllowedClientTypes;
}
struct DHCP_IP_RESERVATION_INFO
{
    uint ReservedIpAddress;
    DHCP_BINARY_DATA ReservedForClient;
    PWSTR ReservedClientName;
    PWSTR ReservedClientDesc;
    ubyte bAllowedClientTypes;
    ubyte fOptionsPresent;
}
struct DHCP_RESERVATION_INFO_ARRAY
{
    uint NumElements;
    DHCP_IP_RESERVATION_INFO** Elements;
}
struct DHCP_SUBNET_ELEMENT_DATA_V4
{
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
    union DHCP_SUBNET_ELEMENT_UNION_V4
    {
        DHCP_IP_RANGE* IpRange;
        DHCP_HOST_INFO* SecondaryHost;
        DHCP_IP_RESERVATION_V4* ReservedIp;
        DHCP_IP_RANGE* ExcludeIpRange;
        DHCP_IP_CLUSTER* IpUsedCluster;
    }
}
union DHCP_SUBNET_ELEMENT_UNION_V4
{
}
struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4
{
    uint NumElements;
    DHCP_SUBNET_ELEMENT_DATA_V4* Elements;
}
struct DHCP_CLIENT_INFO_V4
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
}
struct DHCP_CLIENT_INFO_ARRAY_V4
{
    uint NumElements;
    DHCP_CLIENT_INFO_V4** Clients;
}
struct DHCP_SERVER_CONFIG_INFO_V4
{
    uint APIProtocolSupport;
    PWSTR DatabaseName;
    PWSTR DatabasePath;
    PWSTR BackupPath;
    uint BackupInterval;
    uint DatabaseLoggingFlag;
    uint RestoreFlag;
    uint DatabaseCleanupInterval;
    uint DebugFlag;
    uint dwPingRetries;
    uint cbBootTableString;
    PWSTR wszBootTableString;
    BOOL fAuditLog;
}
struct DHCP_SERVER_CONFIG_INFO_VQ
{
    uint APIProtocolSupport;
    PWSTR DatabaseName;
    PWSTR DatabasePath;
    PWSTR BackupPath;
    uint BackupInterval;
    uint DatabaseLoggingFlag;
    uint RestoreFlag;
    uint DatabaseCleanupInterval;
    uint DebugFlag;
    uint dwPingRetries;
    uint cbBootTableString;
    PWSTR wszBootTableString;
    BOOL fAuditLog;
    BOOL QuarantineOn;
    uint QuarDefFail;
    BOOL QuarRuntimeStatus;
}
struct DHCP_SERVER_CONFIG_INFO_V6
{
    BOOL UnicastFlag;
    BOOL RapidCommitFlag;
    uint PreferredLifetime;
    uint ValidLifetime;
    uint T1;
    uint T2;
    uint PreferredLifetimeIATA;
    uint ValidLifetimeIATA;
    BOOL fAuditLog;
}
struct DHCP_SUPER_SCOPE_TABLE_ENTRY
{
    uint SubnetAddress;
    uint SuperScopeNumber;
    uint NextInSuperScope;
    PWSTR SuperScopeName;
}
struct DHCP_SUPER_SCOPE_TABLE
{
    uint cEntries;
    DHCP_SUPER_SCOPE_TABLE_ENTRY* pEntries;
}
struct DHCP_CLIENT_INFO_V5
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
}
struct DHCP_CLIENT_INFO_ARRAY_V5
{
    uint NumElements;
    DHCP_CLIENT_INFO_V5** Clients;
}
struct DHCP_ALL_OPTIONS
{
    uint Flags;
    DHCP_OPTION_ARRAY* NonVendorOptions;
    uint NumVendorOptions;
    struct
    {
        DHCP_OPTION Option;
        PWSTR VendorName;
        PWSTR ClassName;
    }
}
struct DHCP_ALL_OPTION_VALUES
{
    uint Flags;
    uint NumElements;
    struct
    {
        PWSTR ClassName;
        PWSTR VendorName;
        BOOL IsVendor;
        DHCP_OPTION_VALUE_ARRAY* OptionsArray;
    }
}
struct DHCP_ALL_OPTION_VALUES_PB
{
    uint Flags;
    uint NumElements;
    struct
    {
        PWSTR PolicyName;
        PWSTR VendorName;
        BOOL IsVendor;
        DHCP_OPTION_VALUE_ARRAY* OptionsArray;
    }
}
struct DHCPDS_SERVER
{
    uint Version;
    PWSTR ServerName;
    uint ServerAddress;
    uint Flags;
    uint State;
    PWSTR DsLocation;
    uint DsLocType;
}
struct DHCPDS_SERVERS
{
    uint Flags;
    uint NumElements;
    DHCPDS_SERVER* Servers;
}
struct DHCP_ATTRIB
{
    uint DhcpAttribId;
    uint DhcpAttribType;
    union
    {
        BOOL DhcpAttribBool;
        uint DhcpAttribUlong;
    }
}
struct DHCP_ATTRIB_ARRAY
{
    uint NumElements;
    DHCP_ATTRIB* DhcpAttribs;
}
struct DHCP_BOOTP_IP_RANGE
{
    uint StartAddress;
    uint EndAddress;
    uint BootpAllocated;
    uint MaxBootpAllowed;
}
struct DHCP_SUBNET_ELEMENT_DATA_V5
{
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
    union _DHCP_SUBNET_ELEMENT_UNION_V5
    {
        DHCP_BOOTP_IP_RANGE* IpRange;
        DHCP_HOST_INFO* SecondaryHost;
        DHCP_IP_RESERVATION_V4* ReservedIp;
        DHCP_IP_RANGE* ExcludeIpRange;
        DHCP_IP_CLUSTER* IpUsedCluster;
    }
}
struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5
{
    uint NumElements;
    DHCP_SUBNET_ELEMENT_DATA_V5* Elements;
}
struct DHCP_PERF_STATS
{
    uint dwNumPacketsReceived;
    uint dwNumPacketsDuplicate;
    uint dwNumPacketsExpired;
    uint dwNumMilliSecondsProcessed;
    uint dwNumPacketsInActiveQueue;
    uint dwNumPacketsInPingQueue;
    uint dwNumDiscoversReceived;
    uint dwNumOffersSent;
    uint dwNumRequestsReceived;
    uint dwNumInformsReceived;
    uint dwNumAcksSent;
    uint dwNumNacksSent;
    uint dwNumDeclinesReceived;
    uint dwNumReleasesReceived;
    uint dwNumDelayedOfferInQueue;
    uint dwNumPacketsProcessed;
    uint dwNumPacketsInQuarWaitingQueue;
    uint dwNumPacketsInQuarReadyQueue;
    uint dwNumPacketsInQuarDecisionQueue;
}
struct DHCP_BIND_ELEMENT
{
    uint Flags;
    BOOL fBoundToDHCPServer;
    uint AdapterPrimaryAddress;
    uint AdapterSubnetAddress;
    PWSTR IfDescription;
    uint IfIdSize;
    ubyte* IfId;
}
struct DHCP_BIND_ELEMENT_ARRAY
{
    uint NumElements;
    DHCP_BIND_ELEMENT* Elements;
}
struct DHCPV6_BIND_ELEMENT
{
    uint Flags;
    BOOL fBoundToDHCPServer;
    DHCP_IPV6_ADDRESS AdapterPrimaryAddress;
    DHCP_IPV6_ADDRESS AdapterSubnetAddress;
    PWSTR IfDescription;
    uint IpV6IfIndex;
    uint IfIdSize;
    ubyte* IfId;
}
struct DHCPV6_BIND_ELEMENT_ARRAY
{
    uint NumElements;
    DHCPV6_BIND_ELEMENT* Elements;
}
struct DHCP_IP_RANGE_V6
{
    DHCP_IPV6_ADDRESS StartAddress;
    DHCP_IPV6_ADDRESS EndAddress;
}
struct DHCP_HOST_INFO_V6
{
    DHCP_IPV6_ADDRESS IpAddress;
    PWSTR NetBiosName;
    PWSTR HostName;
}
struct DHCP_SUBNET_INFO_V6
{
    DHCP_IPV6_ADDRESS SubnetAddress;
    uint Prefix;
    ushort Preference;
    PWSTR SubnetName;
    PWSTR SubnetComment;
    uint State;
    uint ScopeId;
}
struct SCOPE_MIB_INFO_V6
{
    DHCP_IPV6_ADDRESS Subnet;
    ulong NumAddressesInuse;
    ulong NumAddressesFree;
    ulong NumPendingAdvertises;
}
struct DHCP_MIB_INFO_V6
{
    uint Solicits;
    uint Advertises;
    uint Requests;
    uint Renews;
    uint Rebinds;
    uint Replies;
    uint Confirms;
    uint Declines;
    uint Releases;
    uint Informs;
    DATE_TIME ServerStartTime;
    uint Scopes;
    SCOPE_MIB_INFO_V6* ScopeInfo;
}
struct DHCP_IP_RESERVATION_V6
{
    DHCP_IPV6_ADDRESS ReservedIpAddress;
    DHCP_BINARY_DATA* ReservedForClient;
    uint InterfaceId;
}
alias DHCP_SUBNET_ELEMENT_TYPE_V6 = int;
enum : int
{
    Dhcpv6IpRanges         = 0x00000000,
    Dhcpv6ReservedIps      = 0x00000001,
    Dhcpv6ExcludedIpRanges = 0x00000002,
}

struct DHCP_SUBNET_ELEMENT_DATA_V6
{
    DHCP_SUBNET_ELEMENT_TYPE_V6 ElementType;
    union DHCP_SUBNET_ELEMENT_UNION_V6
    {
        DHCP_IP_RANGE_V6* IpRange;
        DHCP_IP_RESERVATION_V6* ReservedIp;
        DHCP_IP_RANGE_V6* ExcludeIpRange;
    }
}
union DHCP_SUBNET_ELEMENT_UNION_V6
{
}
struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6
{
    uint NumElements;
    DHCP_SUBNET_ELEMENT_DATA_V6* Elements;
}
struct DHCP_CLIENT_INFO_V6
{
    DHCP_IPV6_ADDRESS ClientIpAddress;
    DHCP_BINARY_DATA ClientDUID;
    uint AddressType;
    uint IAID;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientValidLeaseExpires;
    DATE_TIME ClientPrefLeaseExpires;
    DHCP_HOST_INFO_V6 OwnerHost;
}
struct DHCPV6_IP_ARRAY
{
    uint NumElements;
    DHCP_IPV6_ADDRESS* Elements;
}
struct DHCP_CLIENT_INFO_ARRAY_V6
{
    uint NumElements;
    DHCP_CLIENT_INFO_V6** Clients;
}
alias DHCP_SEARCH_INFO_TYPE_V6 = int;
enum : int
{
    Dhcpv6ClientIpAddress = 0x00000000,
    Dhcpv6ClientDUID      = 0x00000001,
    Dhcpv6ClientName      = 0x00000002,
}

struct DHCP_SEARCH_INFO_V6
{
    DHCP_SEARCH_INFO_TYPE_V6 SearchType;
    union _DHCP_CLIENT_SEARCH_UNION_V6
    {
        DHCP_IPV6_ADDRESS ClientIpAddress;
        DHCP_BINARY_DATA ClientDUID;
        PWSTR ClientName;
    }
}
alias DHCP_POL_ATTR_TYPE = int;
enum : int
{
    DhcpAttrHWAddr          = 0x00000000,
    DhcpAttrOption          = 0x00000001,
    DhcpAttrSubOption       = 0x00000002,
    DhcpAttrFqdn            = 0x00000003,
    DhcpAttrFqdnSingleLabel = 0x00000004,
}

alias DHCP_POL_COMPARATOR = int;
enum : int
{
    DhcpCompEqual        = 0x00000000,
    DhcpCompNotEqual     = 0x00000001,
    DhcpCompBeginsWith   = 0x00000002,
    DhcpCompNotBeginWith = 0x00000003,
    DhcpCompEndsWith     = 0x00000004,
    DhcpCompNotEndWith   = 0x00000005,
}

alias DHCP_POL_LOGIC_OPER = int;
enum : int
{
    DhcpLogicalOr  = 0x00000000,
    DhcpLogicalAnd = 0x00000001,
}

alias DHCP_POLICY_FIELDS_TO_UPDATE = int;
enum : int
{
    DhcpUpdatePolicyName      = 0x00000001,
    DhcpUpdatePolicyOrder     = 0x00000002,
    DhcpUpdatePolicyExpr      = 0x00000004,
    DhcpUpdatePolicyRanges    = 0x00000008,
    DhcpUpdatePolicyDescr     = 0x00000010,
    DhcpUpdatePolicyStatus    = 0x00000020,
    DhcpUpdatePolicyDnsSuffix = 0x00000040,
}

struct DHCP_POL_COND
{
    uint ParentExpr;
    DHCP_POL_ATTR_TYPE Type;
    uint OptionID;
    uint SubOptionID;
    PWSTR VendorName;
    DHCP_POL_COMPARATOR Operator;
    ubyte* Value;
    uint ValueLength;
}
struct DHCP_POL_COND_ARRAY
{
    uint NumElements;
    DHCP_POL_COND* Elements;
}
struct DHCP_POL_EXPR
{
    uint ParentExpr;
    DHCP_POL_LOGIC_OPER Operator;
}
struct DHCP_POL_EXPR_ARRAY
{
    uint NumElements;
    DHCP_POL_EXPR* Elements;
}
struct DHCP_IP_RANGE_ARRAY
{
    uint NumElements;
    DHCP_IP_RANGE* Elements;
}
struct DHCP_POLICY
{
    PWSTR PolicyName;
    BOOL IsGlobalPolicy;
    uint Subnet;
    uint ProcessingOrder;
    DHCP_POL_COND_ARRAY* Conditions;
    DHCP_POL_EXPR_ARRAY* Expressions;
    DHCP_IP_RANGE_ARRAY* Ranges;
    PWSTR Description;
    BOOL Enabled;
}
struct DHCP_POLICY_ARRAY
{
    uint NumElements;
    DHCP_POLICY* Elements;
}
struct DHCP_POLICY_EX
{
    PWSTR PolicyName;
    BOOL IsGlobalPolicy;
    uint Subnet;
    uint ProcessingOrder;
    DHCP_POL_COND_ARRAY* Conditions;
    DHCP_POL_EXPR_ARRAY* Expressions;
    DHCP_IP_RANGE_ARRAY* Ranges;
    PWSTR Description;
    BOOL Enabled;
    DHCP_PROPERTY_ARRAY* Properties;
}
struct DHCP_POLICY_EX_ARRAY
{
    uint NumElements;
    DHCP_POLICY_EX* Elements;
}
alias DHCPV6_STATELESS_PARAM_TYPE = int;
enum : int
{
    DhcpStatelessPurgeInterval = 0x00000001,
    DhcpStatelessStatus        = 0x00000002,
}

struct DHCPV6_STATELESS_PARAMS
{
    BOOL Status;
    uint PurgeInterval;
}
struct DHCPV6_STATELESS_SCOPE_STATS
{
    DHCP_IPV6_ADDRESS SubnetAddress;
    ulong NumStatelessClientsAdded;
    ulong NumStatelessClientsRemoved;
}
struct DHCPV6_STATELESS_STATS
{
    uint NumScopes;
    DHCPV6_STATELESS_SCOPE_STATS* ScopeStats;
}
alias DHCP_FAILOVER_MODE = int;
enum : int
{
    LoadBalance = 0x00000000,
    HotStandby  = 0x00000001,
}

alias DHCP_FAILOVER_SERVER = int;
enum : int
{
    PrimaryServer   = 0x00000000,
    SecondaryServer = 0x00000001,
}

alias FSM_STATE = int;
enum : int
{
    NO_STATE           = 0x00000000,
    INIT               = 0x00000001,
    STARTUP            = 0x00000002,
    NORMAL             = 0x00000003,
    COMMUNICATION_INT  = 0x00000004,
    PARTNER_DOWN       = 0x00000005,
    POTENTIAL_CONFLICT = 0x00000006,
    CONFLICT_DONE      = 0x00000007,
    RESOLUTION_INT     = 0x00000008,
    RECOVER            = 0x00000009,
    RECOVER_WAIT       = 0x0000000a,
    RECOVER_DONE       = 0x0000000b,
    PAUSED             = 0x0000000c,
    SHUTDOWN           = 0x0000000d,
}

struct DHCP_FAILOVER_RELATIONSHIP
{
    uint PrimaryServer;
    uint SecondaryServer;
    DHCP_FAILOVER_MODE Mode;
    DHCP_FAILOVER_SERVER ServerType;
    FSM_STATE State;
    FSM_STATE PrevState;
    uint Mclt;
    uint SafePeriod;
    PWSTR RelationshipName;
    PWSTR PrimaryServerName;
    PWSTR SecondaryServerName;
    DHCP_IP_ARRAY* pScopes;
    ubyte Percentage;
    PWSTR SharedSecret;
}
struct DHCP_FAILOVER_RELATIONSHIP_ARRAY
{
    uint NumElements;
    DHCP_FAILOVER_RELATIONSHIP* pRelationships;
}
struct DHCPV4_FAILOVER_CLIENT_INFO
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    uint SentPotExpTime;
    uint AckPotExpTime;
    uint RecvPotExpTime;
    uint StartTime;
    uint CltLastTransTime;
    uint LastBndUpdTime;
    uint BndMsgStatus;
    PWSTR PolicyName;
    ubyte Flags;
}
struct DHCPV4_FAILOVER_CLIENT_INFO_ARRAY
{
    uint NumElements;
    DHCPV4_FAILOVER_CLIENT_INFO** Clients;
}
struct DHCPV4_FAILOVER_CLIENT_INFO_EX
{
    uint ClientIpAddress;
    uint SubnetMask;
    DHCP_BINARY_DATA ClientHardwareAddress;
    PWSTR ClientName;
    PWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    ubyte bClientType;
    ubyte AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    uint SentPotExpTime;
    uint AckPotExpTime;
    uint RecvPotExpTime;
    uint StartTime;
    uint CltLastTransTime;
    uint LastBndUpdTime;
    uint BndMsgStatus;
    PWSTR PolicyName;
    ubyte Flags;
    uint AddressStateEx;
}
struct DHCP_FAILOVER_STATISTICS
{
    uint NumAddr;
    uint AddrFree;
    uint AddrInUse;
    uint PartnerAddrFree;
    uint ThisAddrFree;
    uint PartnerAddrInUse;
    uint ThisAddrInUse;
}
/+ [CONFLICTED] struct DHCP_SERVER_OPTIONS
{
    ubyte* MessageType;
    uint* SubnetMask;
    uint* RequestedAddress;
    uint* RequestLeaseTime;
    ubyte* OverlayFields;
    uint* RouterAddress;
    uint* Server;
    ubyte* ParameterRequestList;
    uint ParameterRequestListLength;
    PSTR MachineName;
    uint MachineNameLength;
    ubyte ClientHardwareAddressType;
    ubyte ClientHardwareAddressLength;
    ubyte* ClientHardwareAddress;
    PSTR ClassIdentifier;
    uint ClassIdentifierLength;
    ubyte* VendorClass;
    uint VendorClassLength;
    uint DNSFlags;
    uint DNSNameLength;
    ubyte* DNSName;
    BOOLEAN DSDomainNameRequested;
    PSTR DSDomainName;
    uint DSDomainNameLen;
    uint* ScopeId;
}
+/
