module windows.win32.networking.clustering;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, FILETIME, HANDLE, HRESULT, NTSTATUS, PWSTR, SYSTEMTIME;
import windows.win32.graphics.gdi : HFONT;
import windows.win32.security : OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, SC_HANDLE, SECURITY_ATTRIBUTES, SECURITY_DESCRIPTOR_RELATIVE;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

struct CLUSPROP_RESOURCE_CLASS_INFO
{
    CLUSPROP_VALUE Base;
    CLUS_RESOURCE_CLASS_INFO Base2;
}
struct CLUSTER_SHARED_VOLUME_RENAME_INPUT
{
    CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME Base;
    CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME Base2;
}
struct CLUSTER_SHARED_VOLUME_RENAME_GUID_INPUT
{
    CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME Base;
    CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME Base2;
}
struct CLUSPROP_PARTITION_INFO
{
    CLUSPROP_VALUE Base;
    CLUS_PARTITION_INFO Base2;
}
struct CLUSPROP_PARTITION_INFO_EX
{
    CLUSPROP_VALUE Base;
    CLUS_PARTITION_INFO_EX Base2;
}
struct CLUSPROP_PARTITION_INFO_EX2
{
    CLUSPROP_PARTITION_INFO_EX Base;
    CLUS_PARTITION_INFO_EX2 Base2;
}
struct CLUSPROP_FTSET_INFO
{
    CLUSPROP_VALUE Base;
    CLUS_FTSET_INFO Base2;
}
struct CLUSPROP_SCSI_ADDRESS
{
    CLUSPROP_VALUE Base;
    CLUS_SCSI_ADDRESS Base2;
}
CLUSAPI_REASON_HANDLER* ClusapiSetReasonHandler(CLUSAPI_REASON_HANDLER*);
uint GetNodeClusterState(const(wchar)*, uint*);
HCLUSTER OpenCluster(const(wchar)*);
HCLUSTER OpenClusterEx(const(wchar)*, uint, uint*);
BOOL CloseCluster(HCLUSTER);
uint SetClusterName(HCLUSTER, const(wchar)*);
uint SetClusterNameEx(HCLUSTER, const(wchar)*, const(wchar)*);
uint GetClusterInformation(HCLUSTER, PWSTR, uint*, CLUSTERVERSIONINFO*);
uint GetClusterQuorumResource(HCLUSTER, PWSTR, uint*, PWSTR, uint*, uint*);
uint SetClusterQuorumResource(HRESOURCE, const(wchar)*, uint);
uint SetClusterQuorumResourceEx(HRESOURCE, const(wchar)*, uint, const(wchar)*);
uint BackupClusterDatabase(HCLUSTER, const(wchar)*);
uint RestoreClusterDatabase(const(wchar)*, BOOL, const(wchar)*);
uint SetClusterNetworkPriorityOrder(HCLUSTER, uint, HNETWORK*);
uint SetClusterServiceAccountPassword(const(wchar)*, const(wchar)*, uint, CLUSTER_SET_PASSWORD_STATUS*, uint*);
uint ClusterControl(HCLUSTER, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterControlEx(HCLUSTER, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterUpgradeFunctionalLevel(HCLUSTER, BOOL, PCLUSTER_UPGRADE_PROGRESS_CALLBACK, void*);
HCHANGE CreateClusterNotifyPortV2(HCHANGE, HCLUSTER, NOTIFY_FILTER_AND_TYPE*, uint, ulong);
uint RegisterClusterNotifyV2(HCHANGE, NOTIFY_FILTER_AND_TYPE, HANDLE, ulong);
uint GetNotifyEventHandle(HCHANGE, HANDLE*);
uint GetClusterNotifyV2(HCHANGE, ulong*, NOTIFY_FILTER_AND_TYPE*, ubyte*, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, uint);
HCHANGE CreateClusterNotifyPort(HCHANGE, HCLUSTER, uint, ulong);
uint RegisterClusterNotify(HCHANGE, uint, HANDLE, ulong);
uint GetClusterNotify(HCHANGE, ulong*, uint*, PWSTR, uint*, uint);
BOOL CloseClusterNotifyPort(HCHANGE);
HCLUSENUM ClusterOpenEnum(HCLUSTER, uint);
uint ClusterGetEnumCount(HCLUSENUM);
uint ClusterEnum(HCLUSENUM, uint, uint*, PWSTR, uint*);
uint ClusterCloseEnum(HCLUSENUM);
HCLUSENUMEX ClusterOpenEnumEx(HCLUSTER, uint, void*);
uint ClusterGetEnumCountEx(HCLUSENUMEX);
uint ClusterEnumEx(HCLUSENUMEX, uint, CLUSTER_ENUM_ITEM*, uint*);
uint ClusterCloseEnumEx(HCLUSENUMEX);
HGROUPSET CreateClusterGroupSet(HCLUSTER, const(wchar)*);
HGROUPSET OpenClusterGroupSet(HCLUSTER, const(wchar)*);
BOOL CloseClusterGroupSet(HGROUPSET);
uint DeleteClusterGroupSet(HGROUPSET);
uint DeleteClusterGroupSetEx(HGROUPSET, const(wchar)*);
uint ClusterAddGroupToGroupSet(HGROUPSET, HGROUP);
uint ClusterAddGroupToGroupSetWithDomains(HGROUPSET, HGROUP, uint, uint);
uint ClusterAddGroupToGroupSetWithDomainsEx(HGROUPSET, HGROUP, uint, uint, const(wchar)*);
uint ClusterRemoveGroupFromGroupSet(HGROUP);
uint ClusterRemoveGroupFromGroupSetEx(HGROUP, const(wchar)*);
uint ClusterGroupSetControl(HGROUPSET, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterGroupSetControlEx(HGROUPSET, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint AddClusterGroupDependency(HGROUP, HGROUP);
uint AddClusterGroupDependencyEx(HGROUP, HGROUP, const(wchar)*);
uint SetGroupDependencyExpression(HGROUP, const(wchar)*);
uint SetGroupDependencyExpressionEx(HGROUP, const(wchar)*, const(wchar)*);
uint RemoveClusterGroupDependency(HGROUP, HGROUP);
uint RemoveClusterGroupDependencyEx(HGROUP, HGROUP, const(wchar)*);
uint AddClusterGroupSetDependency(HGROUPSET, HGROUPSET);
uint AddClusterGroupSetDependencyEx(HGROUPSET, HGROUPSET, const(wchar)*);
uint SetClusterGroupSetDependencyExpression(HGROUPSET, const(wchar)*);
uint SetClusterGroupSetDependencyExpressionEx(HGROUPSET, const(wchar)*, const(wchar)*);
uint RemoveClusterGroupSetDependency(HGROUPSET, HGROUPSET);
uint RemoveClusterGroupSetDependencyEx(HGROUPSET, HGROUPSET, const(wchar)*);
uint AddClusterGroupToGroupSetDependency(HGROUP, HGROUPSET);
uint AddClusterGroupToGroupSetDependencyEx(HGROUP, HGROUPSET, const(wchar)*);
uint RemoveClusterGroupToGroupSetDependency(HGROUP, HGROUPSET);
uint RemoveClusterGroupToGroupSetDependencyEx(HGROUP, HGROUPSET, const(wchar)*);
HGROUPSETENUM ClusterGroupSetOpenEnum(HCLUSTER);
uint ClusterGroupSetGetEnumCount(HGROUPSETENUM);
uint ClusterGroupSetEnum(HGROUPSETENUM, uint, PWSTR, uint*);
uint ClusterGroupSetCloseEnum(HGROUPSETENUM);
uint AddCrossClusterGroupSetDependency(HGROUPSET, const(wchar)*, const(wchar)*);
uint RemoveCrossClusterGroupSetDependency(HGROUPSET, const(wchar)*, const(wchar)*);
HGROUPSET CreateClusterAvailabilitySet(HCLUSTER, const(wchar)*, CLUSTER_AVAILABILITY_SET_CONFIG*);
uint ClusterNodeReplacement(HCLUSTER, const(wchar)*, const(wchar)*);
uint ClusterCreateAffinityRule(HCLUSTER, const(wchar)*, CLUS_AFFINITY_RULE_TYPE);
uint ClusterRemoveAffinityRule(HCLUSTER, const(wchar)*);
uint ClusterAddGroupToAffinityRule(HCLUSTER, const(wchar)*, HGROUP);
uint ClusterRemoveGroupFromAffinityRule(HCLUSTER, const(wchar)*, HGROUP);
uint ClusterAffinityRuleControl(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*);
HNODE OpenClusterNode(HCLUSTER, const(wchar)*);
HNODE OpenClusterNodeEx(HCLUSTER, const(wchar)*, uint, uint*);
HNODE OpenClusterNodeById(HCLUSTER, uint);
BOOL CloseClusterNode(HNODE);
CLUSTER_NODE_STATE GetClusterNodeState(HNODE);
uint GetClusterNodeId(HNODE, PWSTR, uint*);
HCLUSTER GetClusterFromNode(HNODE);
uint PauseClusterNode(HNODE);
uint ResumeClusterNode(HNODE);
uint EvictClusterNode(HNODE);
HNETINTERFACEENUM ClusterNetInterfaceOpenEnum(HCLUSTER, const(wchar)*, const(wchar)*);
uint ClusterNetInterfaceEnum(HNETINTERFACEENUM, uint, PWSTR, uint*);
uint ClusterNetInterfaceCloseEnum(HNETINTERFACEENUM);
HNODEENUM ClusterNodeOpenEnum(HNODE, uint);
HNODEENUMEX ClusterNodeOpenEnumEx(HNODE, uint, void*);
uint ClusterNodeGetEnumCountEx(HNODEENUMEX);
uint ClusterNodeEnumEx(HNODEENUMEX, uint, CLUSTER_ENUM_ITEM*, uint*);
uint ClusterNodeCloseEnumEx(HNODEENUMEX);
uint ClusterNodeGetEnumCount(HNODEENUM);
uint ClusterNodeCloseEnum(HNODEENUM);
uint ClusterNodeEnum(HNODEENUM, uint, uint*, PWSTR, uint*);
uint EvictClusterNodeEx(HNODE, uint, HRESULT*);
uint EvictClusterNodeEx2(HNODE, uint, HRESULT*, const(wchar)*);
HKEY GetClusterResourceTypeKey(HCLUSTER, const(wchar)*, uint);
HGROUP CreateClusterGroup(HCLUSTER, const(wchar)*);
HGROUP OpenClusterGroup(HCLUSTER, const(wchar)*);
HGROUP OpenClusterGroupEx(HCLUSTER, const(wchar)*, uint, uint*);
uint PauseClusterNodeEx(HNODE, BOOL, uint, HNODE);
uint PauseClusterNodeEx2(HNODE, BOOL, uint, HNODE, const(wchar)*);
uint ResumeClusterNodeEx(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, uint);
uint ResumeClusterNodeEx2(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, uint, const(wchar)*);
HGROUP CreateClusterGroupEx(HCLUSTER, const(wchar)*, CLUSTER_CREATE_GROUP_INFO*);
HGROUPENUMEX ClusterGroupOpenEnumEx(HCLUSTER, const(wchar)*, uint, const(wchar)*, uint, uint);
uint ClusterGroupGetEnumCountEx(HGROUPENUMEX);
uint ClusterGroupEnumEx(HGROUPENUMEX, uint, CLUSTER_GROUP_ENUM_ITEM*, uint*);
uint ClusterGroupCloseEnumEx(HGROUPENUMEX);
HRESENUMEX ClusterResourceOpenEnumEx(HCLUSTER, const(wchar)*, uint, const(wchar)*, uint, uint);
uint ClusterResourceGetEnumCountEx(HRESENUMEX);
uint ClusterResourceEnumEx(HRESENUMEX, uint, CLUSTER_RESOURCE_ENUM_ITEM*, uint*);
uint ClusterResourceCloseEnumEx(HRESENUMEX);
uint OnlineClusterGroupEx(HGROUP, HNODE, uint, ubyte*, uint);
uint OfflineClusterGroupEx(HGROUP, uint, ubyte*, uint);
uint OnlineClusterGroupEx2(HGROUP, HNODE, uint, ubyte*, uint, const(wchar)*);
uint OfflineClusterGroupEx2(HGROUP, uint, ubyte*, uint, const(wchar)*);
uint OnlineClusterResourceEx(HRESOURCE, uint, ubyte*, uint);
uint OnlineClusterResourceEx2(HRESOURCE, uint, ubyte*, uint, const(wchar)*);
uint OfflineClusterResourceEx(HRESOURCE, uint, ubyte*, uint);
uint OfflineClusterResourceEx2(HRESOURCE, uint, ubyte*, uint, const(wchar)*);
uint MoveClusterGroupEx(HGROUP, HNODE, uint, ubyte*, uint);
uint MoveClusterGroupEx2(HGROUP, HNODE, uint, ubyte*, uint, const(wchar)*);
uint CancelClusterGroupOperation(HGROUP, uint);
uint RestartClusterResource(HRESOURCE, uint);
uint RestartClusterResourceEx(HRESOURCE, uint, const(wchar)*);
BOOL CloseClusterGroup(HGROUP);
HCLUSTER GetClusterFromGroup(HGROUP);
CLUSTER_GROUP_STATE GetClusterGroupState(HGROUP, PWSTR, uint*);
uint SetClusterGroupName(HGROUP, const(wchar)*);
uint SetClusterGroupNodeList(HGROUP, uint, HNODE*);
uint SetClusterGroupNameEx(HGROUP, const(wchar)*, const(wchar)*);
uint SetClusterGroupNodeListEx(HGROUP, uint, HNODE*, const(wchar)*);
uint OnlineClusterGroup(HGROUP, HNODE);
uint MoveClusterGroup(HGROUP, HNODE);
uint OfflineClusterGroup(HGROUP);
uint DeleteClusterGroup(HGROUP);
uint DestroyClusterGroup(HGROUP);
uint DeleteClusterGroupEx(HGROUP, const(wchar)*);
uint DestroyClusterGroupEx(HGROUP, const(wchar)*);
HGROUPENUM ClusterGroupOpenEnum(HGROUP, uint);
uint ClusterGroupGetEnumCount(HGROUPENUM);
uint ClusterGroupEnum(HGROUPENUM, uint, uint*, PWSTR, uint*);
uint ClusterGroupCloseEnum(HGROUPENUM);
HRESOURCE CreateClusterResource(HGROUP, const(wchar)*, const(wchar)*, uint);
HRESOURCE CreateClusterResourceEx(HGROUP, const(wchar)*, const(wchar)*, uint, const(wchar)*);
HRESOURCE OpenClusterResource(HCLUSTER, const(wchar)*);
HRESOURCE OpenClusterResourceEx(HCLUSTER, const(wchar)*, uint, uint*);
BOOL CloseClusterResource(HRESOURCE);
HCLUSTER GetClusterFromResource(HRESOURCE);
uint DeleteClusterResource(HRESOURCE);
uint DeleteClusterResourceEx(HRESOURCE, const(wchar)*);
CLUSTER_RESOURCE_STATE GetClusterResourceState(HRESOURCE, PWSTR, uint*, PWSTR, uint*);
uint SetClusterResourceName(HRESOURCE, const(wchar)*);
uint SetClusterResourceNameEx(HRESOURCE, const(wchar)*, const(wchar)*);
uint FailClusterResource(HRESOURCE);
uint FailClusterResourceEx(HRESOURCE, const(wchar)*);
uint OnlineClusterResource(HRESOURCE);
uint OfflineClusterResource(HRESOURCE);
uint ChangeClusterResourceGroup(HRESOURCE, HGROUP);
uint ChangeClusterResourceGroupEx(HRESOURCE, HGROUP, ulong);
uint ChangeClusterResourceGroupEx2(HRESOURCE, HGROUP, ulong, const(wchar)*);
uint AddClusterResourceNode(HRESOURCE, HNODE);
uint RemoveClusterResourceNode(HRESOURCE, HNODE);
uint AddClusterResourceNodeEx(HRESOURCE, HNODE, const(wchar)*);
uint RemoveClusterResourceNodeEx(HRESOURCE, HNODE, const(wchar)*);
uint AddClusterResourceDependency(HRESOURCE, HRESOURCE);
uint RemoveClusterResourceDependency(HRESOURCE, HRESOURCE);
uint AddClusterResourceDependencyEx(HRESOURCE, HRESOURCE, const(wchar)*);
uint RemoveClusterResourceDependencyEx(HRESOURCE, HRESOURCE, const(wchar)*);
uint SetClusterResourceDependencyExpression(HRESOURCE, const(wchar)*);
uint GetClusterResourceDependencyExpression(HRESOURCE, PWSTR, uint*);
uint AddResourceToClusterSharedVolumes(HRESOURCE);
uint RemoveResourceFromClusterSharedVolumes(HRESOURCE);
uint IsFileOnClusterSharedVolume(const(wchar)*, BOOL*);
uint ClusterSharedVolumeSetSnapshotState(GUID, const(wchar)*, CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE);
BOOL CanResourceBeDependent(HRESOURCE, HRESOURCE);
uint ClusterResourceControl(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterResourceControlAsUser(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterResourceTypeControl(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterResourceTypeControlAsUser(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterGroupControl(HGROUP, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterResourceControlEx(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterResourceControlAsUserEx(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterResourceTypeControlEx(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterResourceTypeControlAsUserEx(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterGroupControlEx(HGROUP, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
uint ClusterNodeControl(HNODE, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterNodeControlEx(HNODE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
BOOL GetClusterResourceNetworkName(HRESOURCE, PWSTR, uint*);
HRESENUM ClusterResourceOpenEnum(HRESOURCE, uint);
uint ClusterResourceGetEnumCount(HRESENUM);
uint ClusterResourceEnum(HRESENUM, uint, uint*, PWSTR, uint*);
uint ClusterResourceCloseEnum(HRESENUM);
uint CreateClusterResourceType(HCLUSTER, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
uint DeleteClusterResourceType(HCLUSTER, const(wchar)*);
uint CreateClusterResourceTypeEx(HCLUSTER, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, const(wchar)*);
uint DeleteClusterResourceTypeEx(HCLUSTER, const(wchar)*, const(wchar)*);
HRESTYPEENUM ClusterResourceTypeOpenEnum(HCLUSTER, const(wchar)*, uint);
uint ClusterResourceTypeGetEnumCount(HRESTYPEENUM);
uint ClusterResourceTypeEnum(HRESTYPEENUM, uint, uint*, PWSTR, uint*);
uint ClusterResourceTypeCloseEnum(HRESTYPEENUM);
HNETWORK OpenClusterNetwork(HCLUSTER, const(wchar)*);
HNETWORK OpenClusterNetworkEx(HCLUSTER, const(wchar)*, uint, uint*);
BOOL CloseClusterNetwork(HNETWORK);
HCLUSTER GetClusterFromNetwork(HNETWORK);
HNETWORKENUM ClusterNetworkOpenEnum(HNETWORK, uint);
uint ClusterNetworkGetEnumCount(HNETWORKENUM);
uint ClusterNetworkEnum(HNETWORKENUM, uint, uint*, PWSTR, uint*);
uint ClusterNetworkCloseEnum(HNETWORKENUM);
CLUSTER_NETWORK_STATE GetClusterNetworkState(HNETWORK);
uint SetClusterNetworkName(HNETWORK, const(wchar)*);
uint SetClusterNetworkNameEx(HNETWORK, const(wchar)*, const(wchar)*);
uint GetClusterNetworkId(HNETWORK, PWSTR, uint*);
uint ClusterNetworkControl(HNETWORK, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterNetworkControlEx(HNETWORK, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
HNETINTERFACE OpenClusterNetInterface(HCLUSTER, const(wchar)*);
HNETINTERFACE OpenClusterNetInterfaceEx(HCLUSTER, const(wchar)*, uint, uint*);
uint GetClusterNetInterface(HCLUSTER, const(wchar)*, const(wchar)*, PWSTR, uint*);
BOOL CloseClusterNetInterface(HNETINTERFACE);
HCLUSTER GetClusterFromNetInterface(HNETINTERFACE);
CLUSTER_NETINTERFACE_STATE GetClusterNetInterfaceState(HNETINTERFACE);
uint ClusterNetInterfaceControl(HNETINTERFACE, HNODE, uint, void*, uint, void*, uint, uint*);
uint ClusterNetInterfaceControlEx(HNETINTERFACE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
HKEY GetClusterKey(HCLUSTER, uint);
HKEY GetClusterGroupKey(HGROUP, uint);
HKEY GetClusterResourceKey(HRESOURCE, uint);
HKEY GetClusterNodeKey(HNODE, uint);
HKEY GetClusterNetworkKey(HNETWORK, uint);
HKEY GetClusterNetInterfaceKey(HNETINTERFACE, uint);
int ClusterRegCreateKey(HKEY, const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, HKEY*, uint*);
int ClusterRegCreateKeyEx(HKEY, const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, HKEY*, uint*, const(wchar)*);
int ClusterRegOpenKey(HKEY, const(wchar)*, uint, HKEY*);
int ClusterRegDeleteKey(HKEY, const(wchar)*);
int ClusterRegDeleteKeyEx(HKEY, const(wchar)*, const(wchar)*);
int ClusterRegCloseKey(HKEY);
int ClusterRegEnumKey(HKEY, uint, PWSTR, uint*, FILETIME*);
uint ClusterRegSetValue(HKEY, const(wchar)*, uint, const(ubyte)*, uint);
uint ClusterRegDeleteValue(HKEY, const(wchar)*);
uint ClusterRegSetValueEx(HKEY, const(wchar)*, uint, const(ubyte)*, uint, const(wchar)*);
uint ClusterRegDeleteValueEx(HKEY, const(wchar)*, const(wchar)*);
int ClusterRegQueryValue(HKEY, const(wchar)*, uint*, ubyte*, uint*);
uint ClusterRegEnumValue(HKEY, uint, PWSTR, uint*, uint*, ubyte*, uint*);
int ClusterRegQueryInfoKey(HKEY, uint*, uint*, uint*, uint*, uint*, uint*, FILETIME*);
int ClusterRegGetKeySecurity(HKEY, uint, PSECURITY_DESCRIPTOR, uint*);
int ClusterRegSetKeySecurity(HKEY, uint, PSECURITY_DESCRIPTOR);
int ClusterRegSetKeySecurityEx(HKEY, OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, const(wchar)*);
int ClusterRegSyncDatabase(HCLUSTER, uint);
int ClusterRegCreateBatch(HKEY, HREGBATCH*);
int ClusterRegBatchAddCommand(HREGBATCH, CLUSTER_REG_COMMAND, const(wchar)*, uint, const(void)*, uint);
int ClusterRegCloseBatch(HREGBATCH, BOOL, int*);
int ClusterRegCloseBatchEx(HREGBATCH, uint, int*);
int ClusterRegBatchReadCommand(HREGBATCHNOTIFICATION, CLUSTER_BATCH_COMMAND*);
int ClusterRegBatchCloseNotification(HREGBATCHNOTIFICATION);
int ClusterRegCreateBatchNotifyPort(HKEY, HREGBATCHPORT*);
int ClusterRegCloseBatchNotifyPort(HREGBATCHPORT);
int ClusterRegGetBatchNotification(HREGBATCHPORT, HREGBATCHNOTIFICATION*);
int ClusterRegCreateReadBatch(HKEY, HREGREADBATCH*);
int ClusterRegReadBatchAddCommand(HREGREADBATCH, const(wchar)*, const(wchar)*);
int ClusterRegCloseReadBatch(HREGREADBATCH, HREGREADBATCHREPLY*);
int ClusterRegCloseReadBatchEx(HREGREADBATCH, uint, HREGREADBATCHREPLY*);
int ClusterRegReadBatchReplyNextCommand(HREGREADBATCHREPLY, CLUSTER_READ_BATCH_COMMAND*);
int ClusterRegCloseReadBatchReply(HREGREADBATCHREPLY);
uint ClusterSetAccountAccess(HCLUSTER, const(wchar)*, uint, uint);
HCLUSTER CreateCluster(CREATE_CLUSTER_CONFIG*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
uint CreateClusterNameAccount(HCLUSTER, CREATE_CLUSTER_NAME_ACCOUNT*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
uint RemoveClusterNameAccount(HCLUSTER, BOOL);
uint DetermineCNOResTypeFromNodelist(uint, const(wchar)**, CLUSTER_MGMT_POINT_RESTYPE*);
uint DetermineCNOResTypeFromCluster(HCLUSTER, CLUSTER_MGMT_POINT_RESTYPE*);
uint DetermineClusterCloudTypeFromNodelist(uint, const(wchar)**, CLUSTER_CLOUD_TYPE*);
uint DetermineClusterCloudTypeFromCluster(HCLUSTER, CLUSTER_CLOUD_TYPE*);
uint GetNodeCloudTypeDW(const(wchar)*, uint*);
uint RegisterClusterResourceTypeNotifyV2(HCHANGE, HCLUSTER, long, const(wchar)*, ulong);
HNODE AddClusterNode(HCLUSTER, const(wchar)*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
uint AddClusterStorageNode(HCLUSTER, const(wchar)*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*, const(wchar)*, const(wchar)*);
HNODE AddClusterNodeEx(HCLUSTER, const(wchar)*, uint, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
uint RemoveClusterStorageNode(HCLUSTER, const(wchar)*, uint, uint);
uint DestroyCluster(HCLUSTER, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*, BOOL);
uint InitializeClusterHealthFault(CLUSTER_HEALTH_FAULT*);
uint InitializeClusterHealthFaultArray(CLUSTER_HEALTH_FAULT_ARRAY*);
uint FreeClusterHealthFault(CLUSTER_HEALTH_FAULT*);
uint FreeClusterHealthFaultArray(CLUSTER_HEALTH_FAULT_ARRAY*);
uint ClusGetClusterHealthFaults(HCLUSTER, CLUSTER_HEALTH_FAULT_ARRAY*, uint);
uint ClusRemoveClusterHealthFault(HCLUSTER, const(wchar)*, uint);
uint ClusAddClusterHealthFault(HCLUSTER, CLUSTER_HEALTH_FAULT*, uint);
uint ResUtilStartResourceService(const(wchar)*, SC_HANDLE*);
uint ResUtilVerifyResourceService(const(wchar)*);
uint ResUtilStopResourceService(const(wchar)*);
uint ResUtilVerifyService(SC_HANDLE);
uint ResUtilStopService(SC_HANDLE);
uint ResUtilCreateDirectoryTree(const(wchar)*);
BOOL ResUtilIsPathValid(const(wchar)*);
uint ResUtilEnumProperties(const(RESUTIL_PROPERTY_ITEM)*, PWSTR, uint, uint*, uint*);
uint ResUtilEnumPrivateProperties(HKEY, PWSTR, uint, uint*, uint*);
uint ResUtilGetProperties(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
uint ResUtilGetAllProperties(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
uint ResUtilGetPrivateProperties(HKEY, void*, uint, uint*, uint*);
uint ResUtilGetPropertySize(HKEY, const(RESUTIL_PROPERTY_ITEM)*, uint*, uint*);
uint ResUtilGetProperty(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void**, uint*);
uint ResUtilVerifyPropertyTable(const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, ubyte*);
uint ResUtilSetPropertyTable(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, ubyte*);
uint ResUtilSetPropertyTableEx(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, BOOL, ubyte*);
uint ResUtilSetPropertyParameterBlock(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, const(ubyte)*, const(void)*, uint, ubyte*);
uint ResUtilSetPropertyParameterBlockEx(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, const(ubyte)*, const(void)*, uint, BOOL, ubyte*);
uint ResUtilSetUnknownProperties(HKEY, const(RESUTIL_PROPERTY_ITEM)*, const(void)*, uint);
uint ResUtilGetPropertiesToParameterBlock(HKEY, const(RESUTIL_PROPERTY_ITEM)*, ubyte*, BOOL, PWSTR*);
uint ResUtilPropertyListFromParameterBlock(const(RESUTIL_PROPERTY_ITEM)*, void*, uint*, const(ubyte)*, uint*, uint*);
uint ResUtilDupParameterBlock(ubyte*, const(ubyte)*, const(RESUTIL_PROPERTY_ITEM)*);
void ResUtilFreeParameterBlock(ubyte*, const(ubyte)*, const(RESUTIL_PROPERTY_ITEM)*);
uint ResUtilAddUnknownProperties(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
uint ResUtilSetPrivatePropertyList(HKEY, const(void)*, uint);
uint ResUtilVerifyPrivatePropertyList(const(void)*, uint);
PWSTR ResUtilDupString(const(wchar)*);
uint ResUtilGetBinaryValue(HKEY, const(wchar)*, ubyte**, uint*);
PWSTR ResUtilGetSzValue(HKEY, const(wchar)*);
uint ResUtilGetDwordValue(HKEY, const(wchar)*, uint*, uint);
uint ResUtilGetQwordValue(HKEY, const(wchar)*, ulong*, ulong);
uint ResUtilSetBinaryValue(HKEY, const(wchar)*, const(ubyte)*, uint, ubyte**, uint*);
uint ResUtilSetSzValue(HKEY, const(wchar)*, const(wchar)*, PWSTR*);
uint ResUtilSetExpandSzValue(HKEY, const(wchar)*, const(wchar)*, PWSTR*);
uint ResUtilSetMultiSzValue(HKEY, const(wchar)*, const(wchar)*, uint, PWSTR*, uint*);
uint ResUtilSetDwordValue(HKEY, const(wchar)*, uint, uint*);
uint ResUtilSetQwordValue(HKEY, const(wchar)*, ulong, ulong*);
uint ResUtilSetValueEx(HKEY, const(wchar)*, uint, const(ubyte)*, uint, uint);
uint ResUtilGetBinaryProperty(ubyte**, uint*, const(CLUSPROP_BINARY)*, const(ubyte)*, uint, ubyte**, uint*);
uint ResUtilGetSzProperty(PWSTR*, const(CLUSPROP_SZ)*, const(wchar)*, ubyte**, uint*);
uint ResUtilGetMultiSzProperty(PWSTR*, uint*, const(CLUSPROP_SZ)*, const(wchar)*, uint, ubyte**, uint*);
uint ResUtilGetDwordProperty(uint*, const(CLUSPROP_DWORD)*, uint, uint, uint, ubyte**, uint*);
uint ResUtilGetLongProperty(int*, const(CLUSPROP_LONG)*, int, int, int, ubyte**, uint*);
uint ResUtilGetFileTimeProperty(FILETIME*, const(CLUSPROP_FILETIME)*, FILETIME, FILETIME, FILETIME, ubyte**, uint*);
void* ResUtilGetEnvironmentWithNetName(HRESOURCE);
uint ResUtilFreeEnvironment(void*);
PWSTR ResUtilExpandEnvironmentStrings(const(wchar)*);
uint ResUtilSetResourceServiceEnvironment(const(wchar)*, HRESOURCE, PLOG_EVENT_ROUTINE, long);
uint ResUtilRemoveResourceServiceEnvironment(const(wchar)*, PLOG_EVENT_ROUTINE, long);
uint ResUtilSetResourceServiceStartParameters(const(wchar)*, SC_HANDLE, SC_HANDLE*, PLOG_EVENT_ROUTINE, long);
uint ResUtilFindSzProperty(const(void)*, uint, const(wchar)*, PWSTR*);
uint ResUtilFindExpandSzProperty(const(void)*, uint, const(wchar)*, PWSTR*);
uint ResUtilFindExpandedSzProperty(const(void)*, uint, const(wchar)*, PWSTR*);
uint ResUtilFindDwordProperty(const(void)*, uint, const(wchar)*, uint*);
uint ResUtilFindBinaryProperty(const(void)*, uint, const(wchar)*, ubyte**, uint*);
uint ResUtilFindMultiSzProperty(const(void)*, uint, const(wchar)*, PWSTR*, uint*);
uint ResUtilFindLongProperty(const(void)*, uint, const(wchar)*, int*);
uint ResUtilFindULargeIntegerProperty(const(void)*, uint, const(wchar)*, ulong*);
uint ResUtilFindFileTimeProperty(const(void)*, uint, const(wchar)*, FILETIME*);
uint ClusWorkerCreate(CLUS_WORKER*, PWORKER_START_ROUTINE, void*);
BOOL ClusWorkerCheckTerminate(CLUS_WORKER*);
void ClusWorkerTerminate(CLUS_WORKER*);
uint ClusWorkerTerminateEx(CLUS_WORKER*, uint, BOOL);
uint ClusWorkersTerminate(CLUS_WORKER**, const(ulong), uint, BOOL);
BOOL ResUtilResourcesEqual(HRESOURCE, HRESOURCE);
BOOL ResUtilResourceTypesEqual(const(wchar)*, HRESOURCE);
BOOL ResUtilIsResourceClassEqual(CLUS_RESOURCE_CLASS_INFO*, HRESOURCE);
uint ResUtilEnumResources(HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK, void*);
uint ResUtilEnumResourcesEx(HCLUSTER, HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK_EX, void*);
HRESOURCE ResUtilGetResourceDependency(HANDLE, const(wchar)*);
HRESOURCE ResUtilGetResourceDependencyByName(HCLUSTER, HANDLE, const(wchar)*, BOOL);
HRESOURCE ResUtilGetResourceDependencyByClass(HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO*, BOOL);
HRESOURCE ResUtilGetResourceNameDependency(const(wchar)*, const(wchar)*);
uint ResUtilGetResourceDependentIPAddressProps(HRESOURCE, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*);
uint ResUtilFindDependentDiskResourceDriveLetter(HCLUSTER, HRESOURCE, PWSTR, uint*);
uint ResUtilTerminateServiceProcessFromResDll(uint, BOOL, uint*, PLOG_EVENT_ROUTINE, long);
uint ResUtilGetPropertyFormats(const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
uint ResUtilGetCoreClusterResources(HCLUSTER, HRESOURCE*, HRESOURCE*, HRESOURCE*);
uint ResUtilGetResourceName(HRESOURCE, PWSTR, uint*);
CLUSTER_ROLE_STATE ResUtilGetClusterRoleState(HCLUSTER, CLUSTER_ROLE);
BOOL ClusterIsPathOnSharedVolume(const(wchar)*);
BOOL ClusterGetVolumePathName(const(wchar)*, PWSTR, uint);
BOOL ClusterGetVolumeNameForVolumeMountPoint(const(wchar)*, PWSTR, uint);
uint ClusterPrepareSharedVolumeForBackup(const(wchar)*, PWSTR, uint*, PWSTR, uint*);
uint ClusterClearBackupStateForSharedVolume(const(wchar)*);
uint ResUtilSetResourceServiceStartParametersEx(const(wchar)*, SC_HANDLE, SC_HANDLE*, uint, PLOG_EVENT_ROUTINE, long);
uint ResUtilEnumResourcesEx2(HCLUSTER, HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK_EX, void*, uint);
HRESOURCE ResUtilGetResourceDependencyEx(HANDLE, const(wchar)*, uint);
HRESOURCE ResUtilGetResourceDependencyByNameEx(HCLUSTER, HANDLE, const(wchar)*, BOOL, uint);
HRESOURCE ResUtilGetResourceDependencyByClassEx(HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO*, BOOL, uint);
HRESOURCE ResUtilGetResourceNameDependencyEx(const(wchar)*, const(wchar)*, uint);
uint ResUtilGetCoreClusterResourcesEx(HCLUSTER, HRESOURCE*, HRESOURCE*, uint);
HCLUSCRYPTPROVIDER OpenClusterCryptProvider(const(wchar)*, byte*, uint, uint);
HCLUSCRYPTPROVIDER OpenClusterCryptProviderEx(const(wchar)*, const(wchar)*, byte*, uint, uint);
uint CloseClusterCryptProvider(HCLUSCRYPTPROVIDER);
uint ClusterEncrypt(HCLUSCRYPTPROVIDER, ubyte*, uint, ubyte**, uint*);
uint ClusterDecrypt(HCLUSCRYPTPROVIDER, ubyte*, uint, ubyte**, uint*);
uint FreeClusterCrypt(void*);
uint ResUtilVerifyShutdownSafe(uint, uint, uint*);
BOOL ResUtilPaxosComparer(const(PaxosTagCStruct)*, const(PaxosTagCStruct)*);
BOOL ResUtilLeftPaxosIsLessThanRight(const(PaxosTagCStruct)*, const(PaxosTagCStruct)*);
uint ResUtilsDeleteKeyTree(HKEY, const(wchar)*, BOOL);
uint ResUtilGroupsEqual(HGROUP, HGROUP, BOOL*);
uint ResUtilEnumGroups(HCLUSTER, HGROUP, LPGROUP_CALLBACK_EX, void*);
uint ResUtilEnumGroupsEx(HCLUSTER, HGROUP, CLUSGROUP_TYPE, LPGROUP_CALLBACK_EX, void*);
uint ResUtilDupGroup(HGROUP, HGROUP*);
uint ResUtilGetClusterGroupType(HGROUP, CLUSGROUP_TYPE*);
HGROUP ResUtilGetCoreGroup(HCLUSTER);
uint ResUtilResourceDepEnum(HRESOURCE, uint, LPRESOURCE_CALLBACK_EX, void*);
uint ResUtilDupResource(HRESOURCE, HRESOURCE*);
uint ResUtilGetClusterId(HCLUSTER, GUID*);
uint ResUtilNodeEnum(HCLUSTER, LPNODE_CALLBACK, void*);
uint RegisterAppInstance(HANDLE, GUID*, BOOL);
uint RegisterAppInstanceVersion(GUID*, ulong, ulong);
uint QueryAppInstanceVersion(GUID*, ulong*, ulong*, NTSTATUS*);
uint ResetAllAppInstanceVersions();
uint SetAppInstanceCsvFlags(HANDLE, uint, uint);
enum CLUSTER_VERSION_FLAG_MIXED_MODE = 0x00000001;
enum CLUSTER_VERSION_UNKNOWN = 0xffffffff;
enum NT4_MAJOR_VERSION = 0x00000001;
enum NT4SP4_MAJOR_VERSION = 0x00000002;
enum NT5_MAJOR_VERSION = 0x00000003;
enum NT51_MAJOR_VERSION = 0x00000004;
enum NT6_MAJOR_VERSION = 0x00000005;
enum NT7_MAJOR_VERSION = 0x00000006;
enum NT8_MAJOR_VERSION = 0x00000007;
enum NT9_MAJOR_VERSION = 0x00000008;
enum NT10_MAJOR_VERSION = 0x00000009;
enum NT11_MAJOR_VERSION = 0x0000000a;
enum NT12_MAJOR_VERSION = 0x0000000b;
enum NT13_MAJOR_VERSION = 0x0000000c;
enum WS2016_TP4_UPGRADE_VERSION = 0x00000006;
enum WS2016_TP5_UPGRADE_VERSION = 0x00000007;
enum WS2016_RTM_UPGRADE_VERSION = 0x00000008;
enum RS3_UPGRADE_VERSION = 0x00000001;
enum RS4_UPGRADE_VERSION = 0x00000002;
enum RS5_UPGRADE_VERSION = 0x00000003;
enum NINETEEN_H1_UPGRADE_VERSION = 0x00000001;
enum NINETEEN_H2_UPGRADE_VERSION = 0x00000002;
enum MN_UPGRADE_VERSION = 0x00000003;
enum FE_UPGRADE_VERSION = 0x00000004;
enum CA_UPGRADE_VERSION = 0x00000001;
enum NI_UPGRADE_VERSION = 0x00000002;
enum HCI_UPGRADE_BIT = 0x00008000;
enum CLUSREG_NAME_MIXED_MODE = "MixedMode";
enum CLUSAPI_VERSION_SERVER2008 = 0x00000600;
enum CLUSAPI_VERSION_SERVER2008R2 = 0x00000700;
enum CLUSAPI_VERSION_WINDOWS8 = 0x00000701;
enum CLUSAPI_VERSION_WINDOWSBLUE = 0x00000702;
enum CLUSAPI_VERSION_WINTHRESHOLD = 0x00000703;
enum CLUSAPI_VERSION_RS3 = 0x00000a00;
enum CLUSAPI_VERSION_NI = 0x00000a0c;
enum CLUSAPI_VERSION = 0x00000a0c;
enum CREATE_CLUSTER_VERSION = 0x00000600;
enum CREATE_CLUSTER_MAJOR_VERSION_MASK = 0xffffff00;
enum MAX_CLUSTERNAME_LENGTH = 0x0000003f;
enum CLUSTER_INSTALLED = 0x00000001;
enum CLUSTER_CONFIGURED = 0x00000002;
enum CLUSTER_RUNNING = 0x00000010;
enum CLUS_HYBRID_QUORUM = 0x00000400;
enum CLUS_NODE_MAJORITY_QUORUM = 0x00000000;
enum CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1 = 0x00000001;
enum CLUSREG_DATABASE_SYNC_WRITE_TO_ALL_NODES = 0x00000001;
enum CLUSREG_DATABASE_ISOLATE_READ = 0x00000002;
enum CLUSTER_ENUM_ITEM_VERSION_1 = 0x00000001;
enum CLUSTER_ENUM_ITEM_VERSION = 0x00000001;
enum CLUSTER_CREATE_GROUP_INFO_VERSION_1 = 0x00000001;
enum CLUSTER_CREATE_GROUP_INFO_VERSION = 0x00000001;
enum GROUPSET_READY_SETTING_DELAY = 0x00000001;
enum GROUPSET_READY_SETTING_ONLINE = 0x00000002;
enum GROUPSET_READY_SETTING_OS_HEARTBEAT = 0x00000003;
enum GROUPSET_READY_SETTING_APPLICATION_READY = 0x00000004;
enum CLUS_GRP_MOVE_ALLOWED = 0x00000000;
enum CLUS_GRP_MOVE_LOCKED = 0x00000001;
enum CLUSAPI_READ_ACCESS = 0x00000001;
enum CLUSAPI_CHANGE_ACCESS = 0x00000002;
enum CLUSAPI_NO_ACCESS = 0x00000004;
enum CLUSTER_SET_ACCESS_TYPE_ALLOWED = 0x00000000;
enum CLUSTER_SET_ACCESS_TYPE_DENIED = 0x00000001;
enum CLUSTER_DELETE_ACCESS_CONTROL_ENTRY = 0x00000002;
enum CLUSGROUPSET_STATUS_GROUPS_PENDING = 0x0000000000000001;
enum CLUSGROUPSET_STATUS_GROUPS_ONLINE = 0x0000000000000002;
enum CLUSGROUPSET_STATUS_OS_HEARTBEAT = 0x0000000000000004;
enum CLUSGROUPSET_STATUS_APPLICATION_READY = 0x0000000000000008;
enum CLUSTER_AVAILABILITY_SET_CONFIG_V1 = 0x00000001;
enum CLUSTER_GROUP_ENUM_ITEM_VERSION_1 = 0x00000001;
enum CLUSTER_GROUP_ENUM_ITEM_VERSION = 0x00000001;
enum CLUSTER_RESOURCE_ENUM_ITEM_VERSION_1 = 0x00000001;
enum CLUSTER_RESOURCE_ENUM_ITEM_VERSION = 0x00000001;
enum CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR = 0x00000001;
enum CLUSAPI_NODE_AVOID_PLACEMENT = 0x00000002;
enum CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE = 0x00000004;
enum CLUSAPI_NODE_RESUME_FAILBACK_STORAGE = 0x00000001;
enum CLUSAPI_NODE_RESUME_FAILBACK_VMS = 0x00000002;
enum CLUSAPI_NODE_RESUME_FAILBACK_PINNED_VMS_ONLY = 0x00000004;
enum CLUSGRP_STATUS_LOCKED_MODE = 0x0000000000000001;
enum CLUSGRP_STATUS_PREEMPTED = 0x0000000000000002;
enum CLUSGRP_STATUS_WAITING_IN_QUEUE_FOR_MOVE = 0x0000000000000004;
enum CLUSGRP_STATUS_PHYSICAL_RESOURCES_LACKING = 0x0000000000000008;
enum CLUSGRP_STATUS_WAITING_TO_START = 0x0000000000000010;
enum CLUSGRP_STATUS_EMBEDDED_FAILURE = 0x0000000000000020;
enum CLUSGRP_STATUS_OFFLINE_DUE_TO_ANTIAFFINITY_CONFLICT = 0x0000000000000040;
enum CLUSGRP_STATUS_NETWORK_FAILURE = 0x0000000000000080;
enum CLUSGRP_STATUS_UNMONITORED = 0x0000000000000100;
enum CLUSGRP_STATUS_OS_HEARTBEAT = 0x0000000000000200;
enum CLUSGRP_STATUS_APPLICATION_READY = 0x0000000000000400;
enum CLUSGRP_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 0x0000000000000800;
enum CLUSGRP_STATUS_WAITING_FOR_DEPENDENCIES = 0x0000000000001000;
enum CLUSRES_STATUS_LOCKED_MODE = 0x0000000000000001;
enum CLUSRES_STATUS_EMBEDDED_FAILURE = 0x0000000000000002;
enum CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_CPU = 0x0000000000000004;
enum CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_MEMORY = 0x0000000000000008;
enum CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_GENERIC_RESOURCES = 0x0000000000000010;
enum CLUSRES_STATUS_NETWORK_FAILURE = 0x0000000000000020;
enum CLUSRES_STATUS_UNMONITORED = 0x0000000000000040;
enum CLUSRES_STATUS_OS_HEARTBEAT = 0x0000000000000080;
enum CLUSRES_STATUS_APPLICATION_READY = 0x0000000000000100;
enum CLUSRES_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 0x0000000000000200;
enum CLUSAPI_GROUP_ONLINE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUSAPI_GROUP_ONLINE_SYNCHRONOUS = 0x00000002;
enum CLUSAPI_GROUP_ONLINE_BEST_POSSIBLE_NODE = 0x00000004;
enum CLUSAPI_GROUP_ONLINE_IGNORE_AFFINITY_RULE = 0x00000008;
enum CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUSAPI_RESOURCE_ONLINE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUSAPI_RESOURCE_ONLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 0x00000002;
enum CLUSAPI_RESOURCE_ONLINE_NECESSARY_FOR_QUORUM = 0x00000004;
enum CLUSAPI_RESOURCE_ONLINE_BEST_POSSIBLE_NODE = 0x00000008;
enum CLUSAPI_RESOURCE_ONLINE_IGNORE_AFFINITY_RULE = 0x00000020;
enum CLUSAPI_RESOURCE_OFFLINE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUSAPI_RESOURCE_OFFLINE_FORCE_WITH_TERMINATION = 0x00000002;
enum CLUSAPI_RESOURCE_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 0x00000004;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_NONE = 0x00000000;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_UNKNOWN = 0x00000001;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_MOVING = 0x00000002;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_USER_REQUESTED = 0x00000004;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_DELETED = 0x00000008;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_RESTARTED = 0x00000010;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_PREEMPTED = 0x00000020;
enum CLUSAPI_RESOURCE_OFFLINE_REASON_SHUTTING_DOWN = 0x00000040;
enum CLUSAPI_GROUP_MOVE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUSAPI_GROUP_MOVE_RETURN_TO_SOURCE_NODE_ON_ERROR = 0x00000002;
enum CLUSAPI_GROUP_MOVE_QUEUE_ENABLED = 0x00000004;
enum CLUSAPI_GROUP_MOVE_HIGH_PRIORITY_START = 0x00000008;
enum CLUSAPI_GROUP_MOVE_FAILBACK = 0x00000010;
enum CLUSAPI_GROUP_MOVE_IGNORE_AFFINITY_RULE = 0x00000020;
enum CLUSAPI_CHANGE_RESOURCE_GROUP_FORCE_MOVE_TO_CSV = 0x0000000000000001;
enum CLUSAPI_VALID_CHANGE_RESOURCE_GROUP_FLAGS = 0x0000000000000001;
enum GROUP_FAILURE_INFO_VERSION_1 = 0x00000001;
enum RESOURCE_FAILURE_INFO_VERSION_1 = 0x00000001;
enum CLUS_ACCESS_ANY = 0x00000000;
enum CLUS_ACCESS_READ = 0x00000001;
enum CLUS_ACCESS_WRITE = 0x00000002;
enum CLUS_NO_MODIFY = 0x00000000;
enum CLUS_MODIFY = 0x00000001;
enum CLUS_NOT_GLOBAL = 0x00000000;
enum CLUS_GLOBAL = 0x00000001;
enum CLUSCTL_ACCESS_SHIFT = 0x00000000;
enum CLUSCTL_FUNCTION_SHIFT = 0x00000002;
enum CLCTL_INTERNAL_SHIFT = 0x00000014;
enum CLCTL_USER_SHIFT = 0x00000015;
enum CLCTL_MODIFY_SHIFT = 0x00000016;
enum CLCTL_GLOBAL_SHIFT = 0x00000017;
enum CLUSCTL_OBJECT_SHIFT = 0x00000018;
enum CLUSCTL_CONTROL_CODE_MASK = 0x003fffff;
enum CLUSCTL_OBJECT_MASK = 0x000000ff;
enum CLUSCTL_ACCESS_MODE_MASK = 0x00000003;
enum CLCTL_CLUSTER_BASE = 0x00000000;
enum BitLockerEnabled = 0x00000001;
enum BitLockerDecrypted = 0x00000004;
enum BitlockerEncrypted = 0x00000008;
enum BitLockerDecrypting = 0x00000010;
enum BitlockerEncrypting = 0x00000020;
enum BitLockerPaused = 0x00000040;
enum BitLockerStopped = 0x00000080;
enum RedirectedIOReasonUserRequest = 0x0000000000000001;
enum RedirectedIOReasonUnsafeFileSystemFilter = 0x0000000000000002;
enum RedirectedIOReasonUnsafeVolumeFilter = 0x0000000000000004;
enum RedirectedIOReasonFileSystemTiering = 0x0000000000000008;
enum RedirectedIOReasonBitLockerInitializing = 0x0000000000000010;
enum RedirectedIOReasonReFs = 0x0000000000000020;
enum RedirectedIOReasonMax = 0x8000000000000000;
enum VolumeRedirectedIOReasonNoDiskConnectivity = 0x0000000000000001;
enum VolumeRedirectedIOReasonStorageSpaceNotAttached = 0x0000000000000002;
enum VolumeRedirectedIOReasonVolumeReplicationEnabled = 0x0000000000000004;
enum VolumeRedirectedIOReasonMax = 0x8000000000000000;
enum MAX_OBJECTID = 0x00000040;
enum MAX_CO_PASSWORD_LENGTH = 0x00000010;
enum GUID_PRESENT = 0x00000001;
enum CREATEDC_PRESENT = 0x00000002;
enum MAX_CO_PASSWORD_LENGTHEX = 0x0000007f;
enum MAX_CO_PASSWORD_STORAGEEX = 0x00000080;
enum MAX_CREATINGDC_LENGTH = 0x00000100;
enum DNS_LENGTH = 0x00000040;
enum MAINTENANCE_MODE_V2_SIG = 0xabbaf00f;
enum NNLEN = 0x00000050;
enum CLUS_RESTYPE_NAME_GENAPP = "Generic Application";
enum CLUS_RESTYPE_NAME_GENSVC = "Generic Service";
enum CLUS_RESTYPE_NAME_GENSCRIPT = "Generic Script";
enum CLUS_RESTYPE_NAME_IPADDR = "IP Address";
enum CLUS_RESTYPE_NAME_NETNAME = "Network Name";
enum CLUS_RESTYPE_NAME_DNN = "Distributed Network Name";
enum CLUS_RESTYPE_NAME_FILESHR = "File Share";
enum CLUS_RESTYPE_NAME_PRTSPLR = "Print Spooler";
enum CLUS_RESTYPE_NAME_IPV6_NATIVE = "IPv6 Address";
enum CLUS_RESTYPE_NAME_IPV6_TUNNEL = "IPv6 Tunnel Address";
enum CLUS_RESTYPE_NAME_VSSTASK = "Volume Shadow Copy Service Task";
enum CLUS_RESTYPE_NAME_WINS = "WINS Service";
enum CLUS_RESTYPE_NAME_DHCP = "DHCP Service";
enum CLUS_RESTYPE_NAME_MSMQ = "Microsoft Message Queue Server";
enum CLUS_RESTYPE_NAME_NEW_MSMQ = "MSMQ";
enum CLUS_RESTYPE_NAME_MSMQ_TRIGGER = "MSMQTriggers";
enum CLUS_RESTYPE_NAME_MSDTC = "Distributed Transaction Coordinator";
enum CLUS_RESTYPE_NAME_NFS = "NFS Share";
enum CLUS_RESTYPE_NAME_NETWORK_FILE_SYSTEM = "Network File System";
enum CLUS_RESTYPE_NAME_ISNS = "Microsoft iSNS";
enum CLUS_RESTYPE_NAME_HARDDISK = "Physical Disk";
enum CLUS_RESTYPE_NAME_PHYS_DISK = "Physical Disk";
enum CLUS_RESTYPE_NAME_FSWITNESS = "File Share Witness";
enum CLUS_RESTYPE_NAME_FILESERVER = "File Server";
enum CLUS_RESTYPE_NAME_SODAFILESERVER = "Scale Out File Server";
enum CLUS_RESTYPE_NAME_DFS = "Distributed File System";
enum CLUS_RESTYPE_NAME_DFSR = "DFS Replicated Folder";
enum CLUS_RESTYPE_NAME_VM = "Virtual Machine";
enum CLUS_RESTYPE_NAME_VM_CONFIG = "Virtual Machine Configuration";
enum CLUS_RESTYPE_NAME_ISCSITARGET = "iSCSI Target Server";
enum CLUS_RESTYPE_NAME_STORAGE_POOL = "Storage Pool";
enum CLUS_RESTYPE_NAME_TASKSCHEDULER = "Task Scheduler";
enum CLUS_RESTYPE_NAME_VMREPLICA_BROKER = "Virtual Machine Replication Broker";
enum CLUS_RESTYPE_NAME_VMREPLICA_COORDINATOR = "Virtual Machine Replication Coordinator";
enum CLUS_RESTYPE_NAME_NFS_V2 = "Network File System";
enum CLUS_RESTYPE_NAME_NFS_MSNS = "NFS Multi Server Namespace";
enum CLUS_RESTYPE_NAME_CAU = "ClusterAwareUpdatingResource";
enum CLUS_RESTYPE_NAME_NV_PROVIDER_ADDRESS = "Provider Address";
enum CLUS_RESTYPE_NAME_NAT = "Nat";
enum CLUS_RESTYPE_NAME_STORAGE_POLICIES = "Storage Policies";
enum CLUS_RESTYPE_NAME_STORQOS = "Storage QoS Policy Manager";
enum CLUS_RESTYPE_NAME_HEALTH_SERVICE = "Health Service";
enum CLUS_RESTYPE_NAME_VM_WMI = "Virtual Machine Cluster WMI";
enum CLUS_RESTYPE_NAME_SDDC_MANAGEMENT = "SDDC Management";
enum CLUS_RESTYPE_NAME_HCSVM = "HCS Virtual Machine";
enum CLUS_RESTYPE_NAME_VIRTUAL_IPV4 = "Disjoint IPv4 Address";
enum CLUS_RESTYPE_NAME_VIRTUAL_IPV6 = "Disjoint IPv6 Address";
enum CLUS_RESTYPE_NAME_CLOUD_WITNESS = "Cloud Witness";
enum CLUS_RESTYPE_NAME_STORAGE_REPLICA = "Storage Replica";
enum CLUS_RESTYPE_NAME_CROSS_CLUSTER = "Cross Cluster Dependency Orchestrator";
enum CLUS_RESTYPE_NAME_SCALEOUT_MASTER = "Scaleout Master";
enum CLUS_RESTYPE_NAME_SCALEOUT_WORKER = "Scaleout Worker";
enum CLUS_RESTYPE_NAME_CONTAINER = "Container";
enum CLUS_RES_NAME_SCALEOUT_MASTER = "Scaleout Master";
enum CLUS_RES_NAME_SCALEOUT_WORKER = "Scaleout Worker";
enum CLUSREG_NAME_CLUS_DESC = "Description";
enum CLUSREG_NAME_CLUS_SD = "Security Descriptor";
enum CLUSREG_NAME_CLUS_DEFAULT_NETWORK_ROLE = "DefaultNetworkRole";
enum CLUSREG_NAME_QUORUM_ARBITRATION_TIMEOUT = "QuorumArbitrationTimeMax";
enum CLUSTER_HANG_TIMEOUT_KEYNAME = "ClusSvcHangTimeout";
enum CLUSTER_HANG_RECOVERY_ACTION_KEYNAME = "HangRecoveryAction";
enum CLUSTER_CSA_VSS_STATE = "BackupInProgress";
enum CLUSTER_REQUEST_REPLY_TIMEOUT = "RequestReplyTimeout";
enum CLUSTER_WITNESS_FAILED_RESTART_INTERVAL = "WitnessRestartInterval";
enum CLUSTER_WITNESS_DATABASE_WRITE_TIMEOUT = "WitnessDatabaseWriteTimeout";
enum CLUSTER_ADD_EVICT_DELAY = "AddEvictDelay";
enum CLUSREG_NAME_FIXQUORUM = "FixQuorum";
enum CLUSREG_NAME_PREVENTQUORUM = "PreventQuorum";
enum CLUSREG_NAME_IGNORE_PERSISTENT_STATE = "IgnorePersistentStateOnStartup";
enum CLUSTER_SHARED_VOLUMES_ROOT = "SharedVolumesRoot";
enum ENABLE_CLUSTER_SHARED_VOLUMES = "EnableSharedVolumes";
enum CLUSTER_SHARED_VOLUME_VSS_WRITER_OPERATION_TIMEOUT = "SharedVolumeVssWriterOperationTimeout";
enum USE_CLIENT_ACCESS_NETWORKS_FOR_CSV = "UseClientAccessNetworksForSharedVolumes";
enum CLUSTER_CSV_COMPATIBLE_FILTERS = "SharedVolumeCompatibleFilters";
enum CLUSTER_CSV_INCOMPATIBLE_FILTERS = "SharedVolumeIncompatibleFilters";
enum CLUSTER_GROUP_WAIT_DELAY = "ClusterGroupWaitDelay";
enum MINIMUM_PREEMPTOR_PRIORITY = "MinimumPreemptorPriority";
enum MINIMUM_NEVER_PREEMPT_PRIORITY = "MinimumNeverPreemptPriority";
enum CLUSTER_ENFORCED_ANTIAFFINITY = "ClusterEnforcedAntiaffinity";
enum CLUSREG_NAME_SHUTDOWN_TIMEOUT_MINUTES = "ShutdownTimeoutInMinutes";
enum CLUSREG_NAME_CSV_MDS_SD = "SharedVolumeSecurityDescriptor";
enum CLUSREG_NAME_FAILOVER_MOVE_MIGRATION_TYPE = "FailoverMoveMigrationType";
enum CLUSREG_NAME_CSV_BLOCK_CACHE = "BlockCacheSize";
enum CLUSREG_NAME_ROUTE_HISTORY_LENGTH = "RouteHistoryLength";
enum CLUSREG_NAME_LAST_RECENT_EVENTS_RESET_TIME = "RecentEventsResetTime";
enum CLUSREG_NAME_DRAIN_ON_SHUTDOWN = "DrainOnShutdown";
enum CLUSREG_NAME_NETFT_IPSEC_ENABLED = "NetftIPSecEnabled";
enum CLUSREG_NAME_WITNESS_DYNAMIC_WEIGHT = "WitnessDynamicWeight";
enum CLUSREG_NAME_MESSAGE_BUFFER_LENGTH = "MessageBufferLength";
enum CLUSREG_NAME_DATABASE_READ_WRITE_MODE = "DatabaseReadWriteMode";
enum CLUSREG_NAME_FUNCTIONAL_LEVEL = "ClusterFunctionalLevel";
enum CLUSREG_NAME_UPGRADE_VERSION = "ClusterUpgradeVersion";
enum CLUSREG_NAME_RESILIENCY_LEVEL = "ResiliencyLevel";
enum CLUSREG_NAME_RESILIENCY_DEFAULT_SECONDS = "ResiliencyDefaultPeriod";
enum CLUSREG_NAME_QUARANTINE_THRESHOLD = "QuarantineThreshold";
enum CLUSREG_NAME_QUARANTINE_DURATION = "QuarantineDuration";
enum CLUSTER_S2D_ENABLED = "S2DEnabled";
enum CLUSTER_S2D_BUS_TYPES = "S2DBusTypes";
enum CLUSTER_S2D_CACHE_PAGE_SIZE_KBYTES = "S2DCachePageSizeKBytes";
enum CLUSTER_S2D_OPTIMIZATIONS = "S2DOptimizations";
enum CLUSTER_S2D_IO_LATENCY_THRESHOLD = "S2DIOLatencyThreshold";
enum CLUSTER_S2D_CACHE_DESIRED_STATE = "S2DCacheDesiredState";
enum CLUSTER_S2D_CACHE_METADATA_RESERVE = "S2DCacheMetadataReserveBytes";
enum CLUSTER_S2D_CACHE_FLASH_RESERVE_PERCENT = "S2DCacheFlashReservePercent";
enum CLUSTER_S2D_CACHE_BEHAVIOR_FLAGS = "S2DCacheBehavior";
enum CLUSTER_NAME_PREFERRED_SITE = "PreferredSite";
enum CLUSTER_NAME_AUTO_BALANCER_MODE = "AutoBalancerMode";
enum CLUSTER_NAME_AUTO_BALANCER_LEVEL = "AutoBalancerLevel";
enum CLUSREG_NAME_GROUP_DEPENDENCY_TIMEOUT = "GroupDependencyTimeout";
enum CLUSREG_NAME_PLACEMENT_OPTIONS = "PlacementOptions";
enum CLUSREG_NAME_ENABLED_EVENT_LOGS = "EnabledEventLogs";
enum CLUSREG_NAME_SAME_SUBNET_DELAY = "SameSubnetDelay";
enum CLUSREG_NAME_CROSS_SUBNET_DELAY = "CrossSubnetDelay";
enum CLUSREG_NAME_CROSS_SITE_DELAY = "CrossSiteDelay";
enum CLUSREG_NAME_SAME_SUBNET_THRESHOLD = "SameSubnetThreshold";
enum CLUSREG_NAME_CROSS_SUBNET_THRESHOLD = "CrossSubnetThreshold";
enum CLUSREG_NAME_CROSS_SITE_THRESHOLD = "CrossSiteThreshold";
enum CLUSREG_NAME_PLUMB_ALL_CROSS_SUBNET_ROUTES = "PlumbAllCrossSubnetRoutes";
enum CLUSREG_NAME_NODE_NAME = "NodeName";
enum CLUSREG_NAME_NODE_HIGHEST_VERSION = "NodeHighestVersion";
enum CLUSREG_NAME_NODE_LOWEST_VERSION = "NodeLowestVersion";
enum CLUSREG_NAME_NODE_DESC = "Description";
enum CLUSREG_NAME_NODE_MAJOR_VERSION = "MajorVersion";
enum CLUSREG_NAME_NODE_MINOR_VERSION = "MinorVersion";
enum CLUSREG_NAME_NODE_BUILD_NUMBER = "BuildNumber";
enum CLUSREG_NAME_NODE_CSDVERSION = "CSDVersion";
enum CLUSREG_NAME_NODE_WEIGHT = "NodeWeight";
enum CLUSREG_NAME_NODE_DYNAMIC_WEIGHT = "DynamicWeight";
enum CLUSREG_NAME_NODE_IS_PRIMARY = "IsPrimary";
enum CLUSREG_NAME_NODE_DRAIN_STATUS = "NodeDrainStatus";
enum CLUSREG_NAME_NODE_DRAIN_TARGET = "NodeDrainTarget";
enum CLUSREG_NAME_NODE_NEEDS_PQ = "NeedsPreventQuorum";
enum CLUSREG_NAME_NODE_FDID = "FaultDomainId";
enum CLUSREG_NAME_NODE_STATUS_INFO = "StatusInformation";
enum CLUSREG_NAME_NODE_FAULT_DOMAIN = "FaultDomain";
enum CLUSREG_NAME_NODE_MODEL = "Model";
enum CLUSREG_NAME_NODE_SERIALNUMBER = "SerialNumber";
enum CLUSREG_NAME_NODE_MANUFACTURER = "Manufacturer";
enum CLUSREG_NAME_NODE_UNIQUEID = "UniqueID";
enum CLUSREG_NAME_GRP_NAME = "Name";
enum CLUSREG_NAME_GRP_TYPE = "GroupType";
enum CLUSREG_NAME_GRP_DESC = "Description";
enum CLUSREG_NAME_GRP_PERSISTENT_STATE = "PersistentState";
enum CLUSREG_NAME_GRP_FAILBACK_TYPE = "AutoFailbackType";
enum CLUSREG_NAME_GRP_FAILBACK_WIN_START = "FailbackWindowStart";
enum CLUSREG_NAME_GRP_FAILBACK_WIN_END = "FailbackWindowEnd";
enum CLUSREG_NAME_GRP_FAILOVER_THRESHOLD = "FailoverThreshold";
enum CLUSREG_NAME_GRP_FAILOVER_PERIOD = "FailoverPeriod";
enum CLUSREG_NAME_GRP_PRIORITY = "Priority";
enum CLUSREG_NAME_GRP_DEFAULT_OWNER = "DefaultOwner";
enum CLUSREG_NAME_GRP_STATUS_INFORMATION = "StatusInformation";
enum CLUSREG_NAME_GRP_ANTI_AFFINITY_CLASS_NAME = "AntiAffinityClassNames";
enum CLUSREG_NAME_GRP_START_DELAY = "GroupStartDelay";
enum CLUSREG_NAME_GRP_CCF_EPOCH = "CCFEpoch";
enum CLUSREG_NAME_GRP_CCF_EPOCH_HIGH = "CCFEpochHigh";
enum CLUSREG_NAME_GRP_RESILIENCY_PERIOD = "ResiliencyPeriod";
enum CLUSREG_NAME_GRP_PREFERRED_SITE = "PreferredSite";
enum CLUSREG_NAME_GRP_COLD_START_SETTING = "ColdStartSetting";
enum CLUSREG_NAME_GRP_FAULT_DOMAIN = "FaultDomain";
enum CLUSREG_NAME_GRP_UPDATE_DOMAIN = "UpdateDomain";
enum CLUSREG_NAME_GRP_PLACEMENT_OPTIONS = "PlacementOptions";
enum CLUSREG_NAME_GRP_LOCK_MOVE = "LockedFromMoving";
enum CLUSREG_NAME_RES_NAME = "Name";
enum CLUSREG_NAME_RES_TYPE = "Type";
enum CLUSREG_NAME_RES_DESC = "Description";
enum CLUSREG_NAME_RES_SEPARATE_MONITOR = "SeparateMonitor";
enum CLUSREG_NAME_RES_PERSISTENT_STATE = "PersistentState";
enum CLUSREG_NAME_RES_LOOKS_ALIVE = "LooksAlivePollInterval";
enum CLUSREG_NAME_RES_IS_ALIVE = "IsAlivePollInterval";
enum CLUSREG_NAME_RES_RESTART_ACTION = "RestartAction";
enum CLUSREG_NAME_RES_RESTART_THRESHOLD = "RestartThreshold";
enum CLUSREG_NAME_RES_RESTART_PERIOD = "RestartPeriod";
enum CLUSREG_NAME_RES_RESTART_DELAY = "RestartDelay";
enum CLUSREG_NAME_RES_RETRY_PERIOD_ON_FAILURE = "RetryPeriodOnFailure";
enum CLUSREG_NAME_RES_EMBEDDED_FAILURE_ACTION = "EmbeddedFailureAction";
enum CLUSREG_NAME_RES_PENDING_TIMEOUT = "PendingTimeout";
enum CLUSREG_NAME_RES_DEADLOCK_TIMEOUT = "DeadlockTimeout";
enum CLUSREG_NAME_RES_MONITOR_PID = "MonitorProcessId";
enum CLUSREG_NAME_RES_STATUS_INFORMATION = "StatusInformation";
enum CLUSREG_NAME_RES_LAST_OPERATION_STATUS_CODE = "LastOperationStatusCode";
enum CLUSREG_NAME_RES_DATA1 = "ResourceSpecificData1";
enum CLUSREG_NAME_RES_DATA2 = "ResourceSpecificData2";
enum CLUSREG_NAME_RES_STATUS = "ResourceSpecificStatus";
enum CLUSREG_NAME_RESTYPE_NAME = "Name";
enum CLUSREG_NAME_RESTYPE_DESC = "Description";
enum CLUSREG_NAME_RESTYPE_DLL_NAME = "DllName";
enum CLUSREG_NAME_RESTYPE_ADMIN_EXTENSIONS = "AdminExtensions";
enum CLUSREG_NAME_RESTYPE_LOOKS_ALIVE = "LooksAlivePollInterval";
enum CLUSREG_NAME_RESTYPE_IS_ALIVE = "IsAlivePollInterval";
enum CLUSREG_NAME_RESTYPE_PENDING_TIMEOUT = "PendingTimeout";
enum CLUSREG_NAME_RESTYPE_DEADLOCK_TIMEOUT = "DeadlockTimeout";
enum CLUSREG_NAME_RESTYPE_DUMP_POLICY = "DumpPolicy";
enum CLUSREG_NAME_RESTYPE_DUMP_LOG_QUERY = "DumpLogQuery";
enum CLUSREG_NAME_RESTYPE_DUMP_SERVICES = "DumpServices";
enum CLUSREG_NAME_RESTYPE_ENABLED_EVENT_LOGS = "EnabledEventLogs";
enum CLUSREG_NAME_RESTYPE_MAX_MONITORS = "MaximumMonitors";
enum CLUSREG_NAME_RESTYPE_WPR_START_AFTER = "WprStartAfter";
enum CLUSREG_NAME_RESTYPE_WPR_PROFILES = "WprProfiles";
enum CLUSREG_NAME_NET_NAME = "Name";
enum CLUSREG_NAME_NET_IPV6_ADDRESSES = "IPv6Addresses";
enum CLUSREG_NAME_NET_IPV6_PREFIXLENGTHS = "IPv6PrefixLengths";
enum CLUSREG_NAME_NET_IPV4_ADDRESSES = "IPv4Addresses";
enum CLUSREG_NAME_NET_IPV4_PREFIXLENGTHS = "IPv4PrefixLengths";
enum CLUSREG_NAME_NET_ADDRESS = "Address";
enum CLUSREG_NAME_NET_ADDRESS_MASK = "AddressMask";
enum CLUSREG_NAME_NET_DESC = "Description";
enum CLUSREG_NAME_NET_ROLE = "Role";
enum CLUSREG_NAME_NET_SPEED = "LinkSpeed";
enum CLUSREG_NAME_NET_RDMA_CAPABLE = "RdmaCapable";
enum CLUSREG_NAME_NET_RSS_CAPABLE = "RssCapable";
enum CLUSREG_NAME_NET_METRIC = "Metric";
enum CLUSREG_NAME_NET_AUTOMETRIC = "AutoMetric";
enum CLUSREG_NAME_NETIFACE_NAME = "Name";
enum CLUSREG_NAME_NETIFACE_NODE = "Node";
enum CLUSREG_NAME_NETIFACE_NETWORK = "Network";
enum CLUSREG_NAME_NETIFACE_ADAPTER_NAME = "Adapter";
enum CLUSREG_NAME_NETIFACE_ADAPTER_ID = "AdapterId";
enum CLUSREG_NAME_NETIFACE_DHCP_ENABLED = "DhcpEnabled";
enum CLUSREG_NAME_NETIFACE_IPV6_ADDRESSES = "IPv6Addresses";
enum CLUSREG_NAME_NETIFACE_IPV4_ADDRESSES = "IPv4Addresses";
enum CLUSREG_NAME_NETIFACE_ADDRESS = "Address";
enum CLUSREG_NAME_NETIFACE_DESC = "Description";
enum CLUSREG_NAME_GROUPSET_NAME = "Name";
enum CLUSREG_NAME_GROUPSET_STARTUP_SETTING = "StartupSetting";
enum CLUSREG_NAME_GROUPSET_STARTUP_COUNT = "StartupCount";
enum CLUSREG_NAME_GROUPSET_STARTUP_DELAY = "StartupDelay";
enum CLUSREG_NAME_GROUPSET_IS_GLOBAL = "IsGlobal";
enum CLUSREG_NAME_GROUPSET_STATUS_INFORMATION = "StatusInformation";
enum CLUSREG_NAME_GROUPSET_IS_AVAILABILITY_SET = "IsAvailabilitySet";
enum CLUSREG_NAME_GROUPSET_UPDATE_DOMAINS = "UpdateDomains";
enum CLUSREG_NAME_GROUPSET_FAULT_DOMAINS = "FaultDomains";
enum CLUSREG_NAME_GROUPSET_RESERVE_NODE = "ReserveSpareNode";
enum CLUSREG_NAME_GROUPSET_AVAILABILITY_SET_INDEX_TO_NODE_MAPPING = "NodeDomainInfo";
enum CLUSREG_NAME_AFFINITYRULE_NAME = "Name";
enum CLUSREG_NAME_AFFINITYRULE_TYPE = "RuleType";
enum CLUSREG_NAME_AFFINITYRULE_GROUPS = "Groups";
enum CLUSREG_NAME_AFFINITYRULE_ENABLED = "Enabled";
enum CLUSREG_NAME_START_MEMORY = "StartMemory";
enum CLUSREG_NAME_VIRTUAL_NUMA_COUNT = "VirtualNumaCount";
enum CLUSREG_NAME_DDA_DEVICE_ALLOCATIONS = "DdaDeviceAllocations";
enum CLUSREG_NAME_GPUP_DEVICE_ALLOCATIONS = "GpupDeviceAllocations";
enum CLUSREG_NAME_PHYSDISK_DISKIDTYPE = "DiskIdType";
enum CLUSREG_NAME_PHYSDISK_DISKSIGNATURE = "DiskSignature";
enum CLUSREG_NAME_PHYSDISK_DISKIDGUID = "DiskIdGuid";
enum CLUSREG_NAME_PHYSDISK_DISKRUNCHKDSK = "DiskRunChkDsk";
enum CLUSREG_NAME_PHYSDISK_DISKUNIQUEIDS = "DiskUniqueIds";
enum CLUSREG_NAME_PHYSDISK_DISKVOLUMEINFO = "DiskVolumeInfo";
enum CLUSREG_NAME_PHYSDISK_DISKARBTYPE = "DiskArbType";
enum CLUSREG_NAME_PHYSDISK_DISKARBINTERVAL = "DiskArbInterval";
enum CLUSREG_NAME_PHYSDISK_DISKPATH = "DiskPath";
enum CLUSREG_NAME_PHYSDISK_DISKRELOAD = "DiskReload";
enum CLUSREG_NAME_PHYSDISK_MAINTMODE = "MaintenanceMode";
enum CLUSREG_NAME_PHYSDISK_DISKIODELAY = "MaxIoLatency";
enum CLUSREG_NAME_PHYSDISK_MIGRATEFIXUP = "MigrateDriveLetters";
enum CLUSREG_NAME_PHYSDISK_CSVWRITETHROUGH = "CsvEnforceWriteThrough";
enum CLUSREG_NAME_PHYSDISK_CSVBLOCKCACHE = "EnableBlockCache";
enum CLUSREG_NAME_PHYSDISK_FASTONLINEARBITRATE = "FastOnlineArbitrate";
enum CLUSREG_NAME_PHYSDISK_SPACEIDGUID = "VirtualDiskId";
enum CLUSREG_NAME_STORAGESPACE_POOLIDGUID = "PoolId";
enum CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTDIFFAREASIZE = "SnapshotDiffSize";
enum CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTAGELIMIT = "SnapshotAgeLimit";
enum CLUSREG_NAME_PHYSDISK_DISKGUID = "DiskGuid";
enum CLUSREG_NAME_PHYSDISK_VOLSNAPACTIVATETIMEOUT = "VolsnapActivateTimeout";
enum CLUSREG_NAME_PHYSDISK_DISKRECOVERYACTION = "DiskRecoveryAction";
enum CLUSREG_NAME_STORAGESPACE_NAME = "VirtualDiskName";
enum CLUSREG_NAME_STORAGESPACE_DESCRIPTION = "VirtualDiskDescription";
enum CLUSREG_NAME_STORAGESPACE_HEALTH = "VirtualDiskHealth";
enum CLUSREG_NAME_STORAGESPACE_STATE = "VirtualDiskState";
enum CLUSREG_NAME_STORAGESPACE_PROVISIONING = "VirtualDiskProvisioning";
enum CLUSREG_NAME_STORAGESPACE_RESILIENCYTYPE = "VirtualDiskResiliencyType";
enum CLUSREG_NAME_STORAGESPACE_RESILIENCYCOLUMNS = "VirtualDiskResiliencyColumns";
enum CLUSREG_NAME_STORAGESPACE_RESILIENCYINTERLEAVE = "VirtualDiskResiliencyInterleave";
enum CLUSREG_NAME_GENAPP_COMMAND_LINE = "CommandLine";
enum CLUSREG_NAME_GENAPP_CURRENT_DIRECTORY = "CurrentDirectory";
enum CLUSREG_NAME_GENAPP_USE_NETWORK_NAME = "UseNetworkName";
enum CLUSREG_NAME_GENSCRIPT_SCRIPT_FILEPATH = "ScriptFilepath";
enum CLUSREG_NAME_GENSVC_SERVICE_NAME = "ServiceName";
enum CLUSREG_NAME_GENSVC_STARTUP_PARAMS = "StartupParameters";
enum CLUSREG_NAME_GENSVC_USE_NETWORK_NAME = "UseNetworkName";
enum CLUSREG_NAME_IPADDR_NETWORK = "Network";
enum CLUSREG_NAME_IPADDR_ADDRESS = "Address";
enum CLUSREG_NAME_IPADDR_SUBNET_MASK = "SubnetMask";
enum CLUSREG_NAME_IPADDR_ENABLE_NETBIOS = "EnableNetBIOS";
enum CLUSREG_NAME_IPADDR_OVERRIDE_ADDRMATCH = "OverrideAddressMatch";
enum CLUSREG_NAME_IPADDR_ENABLE_DHCP = "EnableDhcp";
enum CLUSREG_NAME_IPADDR_LEASE_OBTAINED_TIME = "LeaseObtainedTime";
enum CLUSREG_NAME_IPADDR_LEASE_TERMINATES_TIME = "LeaseExpiresTime";
enum CLUSREG_NAME_IPADDR_T1 = "T1";
enum CLUSREG_NAME_IPADDR_T2 = "T2";
enum CLUSREG_NAME_IPADDR_DHCP_SERVER = "DhcpServer";
enum CLUSREG_NAME_IPADDR_DHCP_ADDRESS = "DhcpAddress";
enum CLUSREG_NAME_IPADDR_DHCP_SUBNET_MASK = "DhcpSubnetMask";
enum CLUSREG_NAME_IPADDR_SHARED_NETNAME = "SharedNetname";
enum CLUSREG_NAME_IPADDR_PROBE_PORT = "ProbePort";
enum CLUSREG_NAME_IPADDR_PROBE_FAILURE_THRESHOLD = "ProbeFailureThreshold";
enum CLUSREG_NAME_IPV6_NATIVE_NETWORK = "Network";
enum CLUSREG_NAME_IPV6_NATIVE_ADDRESS = "Address";
enum CLUSREG_NAME_IPV6_NATIVE_PREFIX_LENGTH = "PrefixLength";
enum CLUSREG_NAME_IPV6_TUNNEL_ADDRESS = "Address";
enum CLUSREG_NAME_IPV6_TUNNEL_TUNNELTYPE = "TunnelType";
enum CLUSREG_NAME_NETNAME_NAME = "Name";
enum CLUSREG_NAME_NETNAME_CREATING_DC = "CreatingDC";
enum CLUSREG_NAME_NETNAME_OBJECT_ID = "ObjectGUID";
enum CLUSREG_NAME_NETNAME_DNS_NAME = "DnsName";
enum CLUSREG_NAME_NETNAME_REMAP_PIPE_NAMES = "RemapPipeNames";
enum CLUSREG_NAME_NETNAME_RESOURCE_DATA = "ResourceData";
enum CLUSREG_NAME_NETNAME_STATUS_NETBIOS = "StatusNetBIOS";
enum CLUSREG_NAME_NETNAME_STATUS_DNS = "StatusDNS";
enum CLUSREG_NAME_NETNAME_STATUS_KERBEROS = "StatusKerberos";
enum CLUSREG_NAME_NETNAME_VCO_CONTAINER = "VcoContainer";
enum CLUSREG_NAME_NETNAME_LAST_DNS_UPDATE = "LastDNSUpdateTime";
enum CLUSREG_NAME_NETNAME_CONTAINERGUID = "CryptoContainerGUID";
enum CLUSREG_NAME_NETNAME_HOST_TTL = "HostRecordTTL";
enum CLUSREG_NAME_NETNAME_PUBLISH_PTR = "PublishPTRRecords";
enum CLUSREG_NAME_NETNAME_REMOVEVCO_ONDELETE = "DeleteVcoOnResCleanup";
enum CLUSREG_NAME_NETNAME_REGISTER_ALL_IP = "RegisterAllProvidersIP";
enum CLUSREG_KEYNAME_OBJECTGUIDS = "ObjectGUIDs";
enum CLUSREG_NAME_NETNAME_EXCLUDE_NETWORKS = "ExcludeNetworks";
enum CLUSREG_NAME_NETNAME_ALIASES = "Aliases";
enum CLUSREG_NAME_NETNAME_IN_USE_NETWORKS = "InUseNetworks";
enum CLUSREG_NAME_NETNAME_DNS_SUFFIX = "DnsSuffix";
enum CLUSREG_NAME_NETNAME_AD_AWARE = "ADAware";
enum CLUSREG_NAME_NETNAME_DNN_DISABLE_CLONES = "DisableClones";
enum CLUSREG_NAME_PRTSPOOL_DEFAULT_SPOOL_DIR = "DefaultSpoolDirectory";
enum CLUSREG_NAME_PRTSPOOL_TIMEOUT = "JobCompletionTimeout";
enum CLUSREG_NAME_FILESHR_SERVER_NAME = "ServerName";
enum CLUSREG_NAME_FILESHR_SHARE_NAME = "ShareName";
enum CLUSREG_NAME_FILESHR_PATH = "Path";
enum CLUSREG_NAME_FILESHR_REMARK = "Remark";
enum CLUSREG_NAME_FILESHR_MAX_USERS = "MaxUsers";
enum CLUSREG_NAME_FILESHR_SD = "Security Descriptor";
enum CLUSREG_NAME_FILESHR_SHARE_SUBDIRS = "ShareSubDirs";
enum CLUSREG_NAME_FILESHR_HIDE_SUBDIR_SHARES = "HideSubDirShares";
enum CLUSREG_NAME_FILESHR_IS_DFS_ROOT = "IsDfsRoot";
enum CLUSREG_NAME_FILESHR_SHARE_FLAGS = "ShareFlags";
enum CLUSREG_NAME_FILESHR_CA_TIMEOUT = "CATimeout";
enum CLUSREG_NAME_FILESHR_QOS_FLOWSCOPE = "QosFlowScope";
enum CLUSREG_NAME_FILESHR_QOS_POLICYID = "QosPolicyId";
enum CLUSREG_NAME_DHCP_DATABASE_PATH = "DatabasePath";
enum CLUSREG_NAME_DHCP_BACKUP_PATH = "BackupPath";
enum CLUSREG_NAME_LOG_FILE_PATH = "LogFilePath";
enum CLUSREG_NAME_WINS_DATABASE_PATH = "DatabasePath";
enum CLUSREG_NAME_WINS_BACKUP_PATH = "BackupPath";
enum CLUSREG_NAME_VSSTASK_CURRENTDIRECTORY = "CurrentDirectory";
enum CLUSREG_NAME_VSSTASK_APPNAME = "ApplicationName";
enum CLUSREG_NAME_VSSTASK_APPPARAMS = "ApplicationParams";
enum CLUSREG_NAME_VSSTASK_TRIGGERARRAY = "TriggerArray";
enum CLUSREG_NAME_FSWITNESS_SHARE_PATH = "SharePath";
enum CLUSREG_NAME_FSWITNESS_ARB_DELAY = "ArbitrationDelay";
enum CLUSREG_NAME_FSWITNESS_IMPERSONATE_CNO = "ImpersonateCNO";
enum CLUSREG_NAME_STORAGESPACE_POOLNAME = "Name";
enum CLUSREG_NAME_STORAGESPACE_POOLDESC = "Description";
enum CLUSREG_NAME_STORAGESPACE_POOLDRIVEIDS = "DriveIds";
enum CLUSREG_NAME_STORAGESPACE_POOLHEALTH = "Health";
enum CLUSREG_NAME_STORAGESPACE_POOLSTATE = "State";
enum CLUSREG_NAME_STORAGESPACE_POOLTOTALCAPACITY = "TotalCapacity";
enum CLUSREG_NAME_STORAGESPACE_POOLCONSUMEDCAPACITY = "ConsumedCapacity";
enum CLUSREG_NAME_STORAGESPACE_POOLARBITRATE = "Arbitrate";
enum CLUSREG_NAME_STORAGESPACE_POOLREEVALTIMEOUT = "ReEvaluatePlacementTimeout";
enum CLUSREG_NAME_STORAGESPACE_POOLQUORUMSHARE = "PoolQuorumShare";
enum CLUSREG_NAME_STORAGESPACE_POOLQUORUMUSERACCOUNT = "PoolQuorumUserAccount";
enum CLUSREG_NAME_SOFS_SMBASYMMETRYMODE = "SmbAsymmetryMode";
enum CLUSREG_NAME_VIP_PREFIX_LENGTH = "PrefixLength";
enum CLUSREG_NAME_VIP_ADAPTER_NAME = "AdapterName";
enum CLUSREG_NAME_VIP_ADDRESS = "Address";
enum CLUSREG_NAME_VIP_VSID = "VSID";
enum CLUSREG_NAME_VIP_RDID = "RDID";
enum CLUSREG_NAME_CLOUDWITNESS_PRIMARY_TOKEN = "PrimaryToken";
enum CLUSREG_NAME_CLOUDWITNESS_PRIMARY_KEY = "PrimaryKey";
enum CLUSREG_NAME_CLOUDWITNESS_ACCOUNT_NAME = "AccountName";
enum CLUSREG_NAME_CLOUDWITNESS_ENDPOINT_INFO = "EndpointInfo";
enum CLUSREG_NAME_CLOUDWITNESS_CONTAINER_NAME = "ContainerName";
enum CLOUD_WITNESS_CONTAINER_NAME = "msft-cloud-witness";
enum CLUS_NAME_RES_TYPE_SOURCE_RESID = "SourceResourceId";
enum CLUS_NAME_RES_TYPE_TARGET_RESID = "TargetResourceId";
enum CLUS_NAME_RES_TYPE_SOURCE_VOLUMES = "SourceVolumes";
enum CLUS_NAME_RES_TYPE_TARGET_VOLUMES = "TargetVolumes";
enum CLUS_NAME_RES_TYPE_DATA_RESID = "DataResourceId";
enum CLUS_NAME_RES_TYPE_LOG_RESID = "LogResourceId";
enum CLUS_NAME_RES_TYPE_LOG_VOLUME = "LogVolume";
enum CLUS_NAME_RES_TYPE_REPLICATION_GROUPID = "ReplicationGroupId";
enum CLUS_NAME_RES_TYPE_CLUSTER_GROUPID = "ClusterGroupId";
enum CLUS_NAME_RES_TYPE_REPLICATION_GROUP_TYPE = "ReplicationClusterGroupType";
enum CLUS_NAME_RES_TYPE_MINIMUM_LOG_SIZE = "MinimumLogSizeInBytes";
enum CLUS_NAME_RES_TYPE_UNIT_LOG_SIZE_CHANGE = "UnitOfLogSizeChangeInBytes";
enum CLUS_NAME_RES_TYPE_LOG_MULTIPLE = "LogSizeMultiple";
enum SR_REPLICATED_PARTITION_DISALLOW_MULTINODE_IO = 0x00000001;
enum CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_ADD_VOLUME_INFO = 0x00000001;
enum CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_FILTER_BY_POOL = 0x00000002;
enum CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_INCLUDE_NON_SHARED_DISKS = 0x00000004;
enum STARTUP_ROUTINE = "Startup";
enum CLRES_VERSION_V1_00 = 0x00000100;
enum STARTUP_EX_ROUTINE = "StartupEx";
enum CLRES_VERSION_V2_00 = 0x00000200;
enum CLRES_VERSION_V3_00 = 0x00000300;
enum CLRES_VERSION_V4_00 = 0x00000400;
enum CLUSCTL_GET_OPERATION_CONTEXT_PARAMS_VERSION_1 = 0x00000001;
enum CLUSRES_NAME_GET_OPERATION_CONTEXT_FLAGS = "Flags";
enum CLUSRESDLL_STATUS_OFFLINE_BUSY = 0x00000001;
enum CLUSRESDLL_STATUS_OFFLINE_SOURCE_THROTTLED = 0x00000002;
enum CLUSRESDLL_STATUS_OFFLINE_DESTINATION_THROTTLED = 0x00000004;
enum CLUSRESDLL_STATUS_OFFLINE_DESTINATION_REJECTED = 0x00000008;
enum CLUSRESDLL_STATUS_INSUFFICIENT_MEMORY = 0x00000010;
enum CLUSRESDLL_STATUS_INSUFFICIENT_PROCESSOR = 0x00000020;
enum CLUSRESDLL_STATUS_INSUFFICIENT_OTHER_RESOURCES = 0x00000040;
enum CLUSRESDLL_STATUS_INVALID_PARAMETERS = 0x00000080;
enum CLUSRESDLL_STATUS_NETWORK_NOT_AVAILABLE = 0x00000100;
enum CLUSRESDLL_STATUS_DO_NOT_COLLECT_WER_REPORT = 0x40000000;
enum CLUSRESDLL_STATUS_DUMP_NOW = 0x80000000;
enum CLUS_RESDLL_OPEN_RECOVER_MONITOR_STATE = 0x00000001;
enum CLUS_RESDLL_ONLINE_RECOVER_MONITOR_STATE = 0x00000001;
enum CLUS_RESDLL_ONLINE_IGNORE_RESOURCE_STATUS = 0x00000002;
enum CLUS_RESDLL_ONLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 0x00000004;
enum CLUS_RESDLL_ONLINE_RESTORE_ONLINE_STATE = 0x00000008;
enum CLUS_RESDLL_ONLINE_IGNORE_NETWORK_CONNECTIVITY = 0x00000010;
enum CLUS_RESDLL_OFFLINE_IGNORE_RESOURCE_STATUS = 0x00000001;
enum CLUS_RESDLL_OFFLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 0x00000002;
enum CLUS_RESDLL_OFFLINE_QUEUE_ENABLED = 0x00000004;
enum CLUS_RESDLL_OFFLINE_RETURNING_TO_SOURCE_NODE_BECAUSE_OF_ERROR = 0x00000008;
enum CLUS_RESDLL_OFFLINE_DUE_TO_EMBEDDED_FAILURE = 0x00000010;
enum CLUS_RESDLL_OFFLINE_IGNORE_NETWORK_CONNECTIVITY = 0x00000020;
enum CLUS_RESDLL_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 0x00000040;
enum CLUS_RESDLL_OPEN_DONT_DELETE_TEMP_DISK = 0x00000002;
enum RESTYPE_MONITOR_SHUTTING_DOWN_NODE_STOP = 0x00000001;
enum RESTYPE_MONITOR_SHUTTING_DOWN_CLUSSVC_CRASH = 0x00000002;
enum RESUTIL_PROPITEM_READ_ONLY = 0x00000001;
enum RESUTIL_PROPITEM_REQUIRED = 0x00000002;
enum RESUTIL_PROPITEM_SIGNED = 0x00000004;
enum RESUTIL_PROPITEM_IN_MEMORY = 0x00000008;
enum LOCKED_MODE_FLAGS_DONT_REMOVE_FROM_MOVE_QUEUE = 0x00000001;
enum CLUSRES_DISABLE_WPR_WATCHDOG_FOR_ONLINE_CALLS = 0x00000001;
enum CLUSRES_DISABLE_WPR_WATCHDOG_FOR_OFFLINE_CALLS = 0x00000002;
enum CLUSTER_HEALTH_FAULT_PROPERTY_NAME = "ClusterHealth";
enum CLUSTER_HEALTH_FAULT_ARGS = 0x00000007;
enum CLUSTER_HEALTH_FAULT_ID = 0x00000000;
enum CLUSTER_HEALTH_FAULT_ERRORTYPE = 0x00000001;
enum CLUSTER_HEALTH_FAULT_ERRORCODE = 0x00000002;
enum CLUSTER_HEALTH_FAULT_DESCRIPTION = 0x00000003;
enum CLUSTER_HEALTH_FAULT_PROVIDER = 0x00000004;
enum CLUSTER_HEALTH_FAULT_FLAGS = 0x00000005;
enum CLUSTER_HEALTH_FAULT_RESERVED = 0x00000006;
enum CLUSTER_HEALTH_FAULT_ID_LABEL = "Id";
enum CLUSTER_HEALTH_FAULT_ERRORTYPE_LABEL = "ErrorType";
enum CLUSTER_HEALTH_FAULT_ERRORCODE_LABEL = "ErrorCode";
enum CLUSTER_HEALTH_FAULT_DESCRIPTION_LABEL = "Description";
enum CLUSTER_HEALTH_FAULT_PROVIDER_LABEL = "Provider";
enum CLUSTER_HEALTH_FAULT_FLAGS_LABEL = "Flags";
enum CLUSTER_HEALTH_FAULT_RESERVED_LABEL = "Reserved";
enum CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND = 0x00000001;
enum SET_APPINSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR = 0x00000001;
alias HCHANGE = void*;
alias HCLUSCRYPTPROVIDER = void*;
alias HCLUSENUM = void*;
alias HCLUSENUMEX = void*;
alias HCLUSTER = void*;
alias HGROUP = void*;
alias HGROUPENUM = void*;
alias HGROUPENUMEX = void*;
alias HGROUPSET = void*;
alias HGROUPSETENUM = void*;
alias HNETINTERFACE = void*;
alias HNETINTERFACEENUM = void*;
alias HNETWORK = void*;
alias HNETWORKENUM = void*;
alias HNODE = void*;
alias HNODEENUM = void*;
alias HNODEENUMEX = void*;
alias HREGBATCH = void*;
alias HREGBATCHNOTIFICATION = void*;
alias HREGBATCHPORT = void*;
alias HREGREADBATCH = void*;
alias HREGREADBATCHREPLY = void*;
alias HRESENUM = void*;
alias HRESENUMEX = void*;
alias HRESOURCE = void*;
alias HRESTYPEENUM = void*;
alias CLUSTER_QUORUM_TYPE = int;
enum : int
{
    OperationalQuorum = 0x00000000,
    ModifyQuorum      = 0x00000001,
}

struct CLUSTERVERSIONINFO_NT4
{
    uint dwVersionInfoSize;
    ushort MajorVersion;
    ushort MinorVersion;
    ushort BuildNumber;
    wchar[64] szVendorId;
    wchar[64] szCSDVersion;
}
struct CLUSTERVERSIONINFO
{
    uint dwVersionInfoSize;
    ushort MajorVersion;
    ushort MinorVersion;
    ushort BuildNumber;
    wchar[64] szVendorId;
    wchar[64] szCSDVersion;
    uint dwClusterHighestVersion;
    uint dwClusterLowestVersion;
    uint dwFlags;
    uint dwReserved;
}
struct CLUS_STARTING_PARAMS
{
    uint dwSize;
    BOOL bForm;
    BOOL bFirst;
}
alias NODE_CLUSTER_STATE = int;
enum : int
{
    ClusterStateNotInstalled  = 0x00000000,
    ClusterStateNotConfigured = 0x00000001,
    ClusterStateNotRunning    = 0x00000003,
    ClusterStateRunning       = 0x00000013,
}

alias CLUSTER_RESOURCE_STATE_CHANGE_REASON = int;
enum : int
{
    eResourceStateChangeReasonUnknown    = 0x00000000,
    eResourceStateChangeReasonMove       = 0x00000001,
    eResourceStateChangeReasonFailover   = 0x00000002,
    eResourceStateChangeReasonFailedMove = 0x00000003,
    eResourceStateChangeReasonShutdown   = 0x00000004,
    eResourceStateChangeReasonRundown    = 0x00000005,
}

alias CLUSTER_REG_COMMAND = int;
enum : int
{
    CLUSREG_COMMAND_NONE              = 0x00000000,
    CLUSREG_SET_VALUE                 = 0x00000001,
    CLUSREG_CREATE_KEY                = 0x00000002,
    CLUSREG_DELETE_KEY                = 0x00000003,
    CLUSREG_DELETE_VALUE              = 0x00000004,
    CLUSREG_SET_KEY_SECURITY          = 0x00000005,
    CLUSREG_VALUE_DELETED             = 0x00000006,
    CLUSREG_READ_KEY                  = 0x00000007,
    CLUSREG_READ_VALUE                = 0x00000008,
    CLUSREG_READ_ERROR                = 0x00000009,
    CLUSREG_CONTROL_COMMAND           = 0x0000000a,
    CLUSREG_CONDITION_EXISTS          = 0x0000000b,
    CLUSREG_CONDITION_NOT_EXISTS      = 0x0000000c,
    CLUSREG_CONDITION_IS_EQUAL        = 0x0000000d,
    CLUSREG_CONDITION_IS_NOT_EQUAL    = 0x0000000e,
    CLUSREG_CONDITION_IS_GREATER_THAN = 0x0000000f,
    CLUSREG_CONDITION_IS_LESS_THAN    = 0x00000010,
    CLUSREG_CONDITION_KEY_EXISTS      = 0x00000011,
    CLUSREG_CONDITION_KEY_NOT_EXISTS  = 0x00000012,
    CLUSREG_LAST_COMMAND              = 0x00000013,
}

struct CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT
{
    uint dwSize;
    uint dwVersion;
    CLUSTER_RESOURCE_STATE_CHANGE_REASON eReason;
}
struct CLUSTER_BATCH_COMMAND
{
    CLUSTER_REG_COMMAND Command;
    uint dwOptions;
    const(wchar)* wzName;
    const(ubyte)* lpData;
    uint cbData;
}
struct CLUSTER_READ_BATCH_COMMAND
{
    CLUSTER_REG_COMMAND Command;
    uint dwOptions;
    const(wchar)* wzSubkeyName;
    const(wchar)* wzValueName;
    const(ubyte)* lpData;
    uint cbData;
}
struct CLUSTER_ENUM_ITEM
{
    uint dwVersion;
    uint dwType;
    uint cbId;
    PWSTR lpszId;
    uint cbName;
    PWSTR lpszName;
}
alias CLUSGROUP_TYPE = int;
enum : int
{
    ClusGroupTypeCoreCluster              = 0x00000001,
    ClusGroupTypeAvailableStorage         = 0x00000002,
    ClusGroupTypeTemporary                = 0x00000003,
    ClusGroupTypeSharedVolume             = 0x00000004,
    ClusGroupTypeStoragePool              = 0x00000005,
    ClusGroupTypeFileServer               = 0x00000064,
    ClusGroupTypePrintServer              = 0x00000065,
    ClusGroupTypeDhcpServer               = 0x00000066,
    ClusGroupTypeDtc                      = 0x00000067,
    ClusGroupTypeMsmq                     = 0x00000068,
    ClusGroupTypeWins                     = 0x00000069,
    ClusGroupTypeStandAloneDfs            = 0x0000006a,
    ClusGroupTypeGenericApplication       = 0x0000006b,
    ClusGroupTypeGenericService           = 0x0000006c,
    ClusGroupTypeGenericScript            = 0x0000006d,
    ClusGroupTypeIScsiNameService         = 0x0000006e,
    ClusGroupTypeVirtualMachine           = 0x0000006f,
    ClusGroupTypeTsSessionBroker          = 0x00000070,
    ClusGroupTypeIScsiTarget              = 0x00000071,
    ClusGroupTypeScaleoutFileServer       = 0x00000072,
    ClusGroupTypeVMReplicaBroker          = 0x00000073,
    ClusGroupTypeTaskScheduler            = 0x00000074,
    ClusGroupTypeClusterUpdateAgent       = 0x00000075,
    ClusGroupTypeScaleoutCluster          = 0x00000076,
    ClusGroupTypeStorageReplica           = 0x00000077,
    ClusGroupTypeVMReplicaCoordinator     = 0x00000078,
    ClusGroupTypeCrossClusterOrchestrator = 0x00000079,
    ClusGroupTypeInfrastructureFileServer = 0x0000007a,
    ClusGroupTypeCoreSddc                 = 0x0000007b,
    ClusGroupTypeUnknown                  = 0x0000270f,
}

struct CLUSTER_CREATE_GROUP_INFO
{
    uint dwVersion;
    CLUSGROUP_TYPE groupType;
}
alias CLUSTER_MGMT_POINT_TYPE = int;
enum : int
{
    CLUSTER_MGMT_POINT_TYPE_NONE     = 0x00000000,
    CLUSTER_MGMT_POINT_TYPE_CNO      = 0x00000001,
    CLUSTER_MGMT_POINT_TYPE_DNS_ONLY = 0x00000002,
    CLUSTER_MGMT_POINT_TYPE_CNO_ONLY = 0x00000003,
}

alias CLUSTER_MGMT_POINT_RESTYPE = int;
enum : int
{
    CLUSTER_MGMT_POINT_RESTYPE_AUTO = 0x00000000,
    CLUSTER_MGMT_POINT_RESTYPE_SNN  = 0x00000001,
    CLUSTER_MGMT_POINT_RESTYPE_DNN  = 0x00000002,
}

alias CLUSTER_CLOUD_TYPE = int;
enum : int
{
    CLUSTER_CLOUD_TYPE_NONE    = 0x00000000,
    CLUSTER_CLOUD_TYPE_AZURE   = 0x00000001,
    CLUSTER_CLOUD_TYPE_MIXED   = 0x00000080,
    CLUSTER_CLOUD_TYPE_UNKNOWN = 0xffffffff,
}

alias CLUS_GROUP_START_SETTING = int;
enum : int
{
    CLUS_GROUP_START_ALWAYS  = 0x00000000,
    CLUS_GROUP_DO_NOT_START  = 0x00000001,
    CLUS_GROUP_START_ALLOWED = 0x00000002,
}

alias CLUS_AFFINITY_RULE_TYPE = int;
enum : int
{
    CLUS_AFFINITY_RULE_NONE                   = 0x00000000,
    CLUS_AFFINITY_RULE_SAME_FAULT_DOMAIN      = 0x00000001,
    CLUS_AFFINITY_RULE_SAME_NODE              = 0x00000002,
    CLUS_AFFINITY_RULE_DIFFERENT_FAULT_DOMAIN = 0x00000003,
    CLUS_AFFINITY_RULE_DIFFERENT_NODE         = 0x00000004,
    CLUS_AFFINITY_RULE_MIN                    = 0x00000000,
    CLUS_AFFINITY_RULE_MAX                    = 0x00000004,
}

alias CLUSTER_QUORUM_VALUE = int;
enum : int
{
    CLUSTER_QUORUM_MAINTAINED = 0x00000000,
    CLUSTER_QUORUM_LOST       = 0x00000001,
}

struct CLUSTER_VALIDATE_PATH
{
    wchar[1] szPath;
}
struct CLUSTER_VALIDATE_DIRECTORY
{
    wchar[1] szPath;
}
struct CLUSTER_VALIDATE_NETNAME
{
    wchar[1] szNetworkName;
}
struct CLUSTER_VALIDATE_CSV_FILENAME
{
    wchar[1] szFileName;
}
struct CLUSTER_SET_PASSWORD_STATUS
{
    uint NodeId;
    BOOLEAN SetAttempted;
    uint ReturnStatus;
}
struct CLUSTER_IP_ENTRY
{
    const(wchar)* lpszIpAddress;
    uint dwPrefixLength;
}
struct CREATE_CLUSTER_CONFIG
{
    uint dwVersion;
    const(wchar)* lpszClusterName;
    uint cNodes;
    const(wchar)** ppszNodeNames;
    uint cIpEntries;
    CLUSTER_IP_ENTRY* pIpEntries;
    BOOLEAN fEmptyCluster;
    CLUSTER_MGMT_POINT_TYPE managementPointType;
    CLUSTER_MGMT_POINT_RESTYPE managementPointResType;
}
struct CREATE_CLUSTER_NAME_ACCOUNT
{
    uint dwVersion;
    const(wchar)* lpszClusterName;
    uint dwFlags;
    const(wchar)* pszUserName;
    const(wchar)* pszPassword;
    const(wchar)* pszDomain;
    CLUSTER_MGMT_POINT_TYPE managementPointType;
    CLUSTER_MGMT_POINT_RESTYPE managementPointResType;
    BOOLEAN bUpgradeVCOs;
}
alias PCLUSAPI_PFN_REASON_HANDLER = BOOL function(void*, HCLUSTER, PWSTR, uint*);
struct CLUSAPI_REASON_HANDLER
{
    void* lpParameter;
    PCLUSAPI_PFN_REASON_HANDLER pfnHandler;
}
alias PCLUSAPI_SET_REASON_HANDLER = CLUSAPI_REASON_HANDLER* function(CLUSAPI_REASON_HANDLER*);
alias PCLUSAPI_GET_NODE_CLUSTER_STATE = uint function(const(wchar)*, uint*);
alias PCLUSAPI_OPEN_CLUSTER = HCLUSTER function(const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_EX = HCLUSTER function(const(wchar)*, uint, uint*);
alias PCLUSAPI_CLOSE_CLUSTER = BOOL function(HCLUSTER);
alias PCLUSAPI_SetClusterName = uint function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_NAME_EX = uint function(HCLUSTER, const(wchar)*, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_INFORMATION = uint function(HCLUSTER, PWSTR, uint*, CLUSTERVERSIONINFO*);
alias PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE = uint function(HCLUSTER, PWSTR, uint*, PWSTR, uint*, uint*);
alias PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE = uint function(HRESOURCE, const(wchar)*, uint);
alias PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX = uint function(HRESOURCE, const(wchar)*, uint, const(wchar)*);
alias PCLUSAPI_BACKUP_CLUSTER_DATABASE = uint function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_RESTORE_CLUSTER_DATABASE = uint function(const(wchar)*, BOOL, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER = uint function(HCLUSTER, uint, HNETWORK*);
alias PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD = uint function(const(wchar)*, const(wchar)*, uint, CLUSTER_SET_PASSWORD_STATUS*, uint*);
alias PCLUSAPI_CLUSTER_CONTROL = uint function(HCLUSTER, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_CONTROL_EX = uint function(HCLUSTER, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias CLUSTER_UPGRADE_PHASE = int;
enum : int
{
    ClusterUpgradePhaseInitialize              = 0x00000001,
    ClusterUpgradePhaseValidatingUpgrade       = 0x00000002,
    ClusterUpgradePhaseUpgradingComponents     = 0x00000003,
    ClusterUpgradePhaseInstallingNewComponents = 0x00000004,
    ClusterUpgradePhaseUpgradeComplete         = 0x00000005,
}

alias PCLUSTER_UPGRADE_PROGRESS_CALLBACK = BOOL function(void*, CLUSTER_UPGRADE_PHASE);
alias PCLUSAPI_CLUSTER_UPGRADE = uint function(HCLUSTER, BOOL, PCLUSTER_UPGRADE_PROGRESS_CALLBACK, void*);
alias CLUSTER_CHANGE = int;
enum : int
{
    CLUSTER_CHANGE_NODE_STATE             = 0x00000001,
    CLUSTER_CHANGE_NODE_DELETED           = 0x00000002,
    CLUSTER_CHANGE_NODE_ADDED             = 0x00000004,
    CLUSTER_CHANGE_NODE_PROPERTY          = 0x00000008,
    CLUSTER_CHANGE_REGISTRY_NAME          = 0x00000010,
    CLUSTER_CHANGE_REGISTRY_ATTRIBUTES    = 0x00000020,
    CLUSTER_CHANGE_REGISTRY_VALUE         = 0x00000040,
    CLUSTER_CHANGE_REGISTRY_SUBTREE       = 0x00000080,
    CLUSTER_CHANGE_RESOURCE_STATE         = 0x00000100,
    CLUSTER_CHANGE_RESOURCE_DELETED       = 0x00000200,
    CLUSTER_CHANGE_RESOURCE_ADDED         = 0x00000400,
    CLUSTER_CHANGE_RESOURCE_PROPERTY      = 0x00000800,
    CLUSTER_CHANGE_GROUP_STATE            = 0x00001000,
    CLUSTER_CHANGE_GROUP_DELETED          = 0x00002000,
    CLUSTER_CHANGE_GROUP_ADDED            = 0x00004000,
    CLUSTER_CHANGE_GROUP_PROPERTY         = 0x00008000,
    CLUSTER_CHANGE_RESOURCE_TYPE_DELETED  = 0x00010000,
    CLUSTER_CHANGE_RESOURCE_TYPE_ADDED    = 0x00020000,
    CLUSTER_CHANGE_RESOURCE_TYPE_PROPERTY = 0x00040000,
    CLUSTER_CHANGE_CLUSTER_RECONNECT      = 0x00080000,
    CLUSTER_CHANGE_NETWORK_STATE          = 0x00100000,
    CLUSTER_CHANGE_NETWORK_DELETED        = 0x00200000,
    CLUSTER_CHANGE_NETWORK_ADDED          = 0x00400000,
    CLUSTER_CHANGE_NETWORK_PROPERTY       = 0x00800000,
    CLUSTER_CHANGE_NETINTERFACE_STATE     = 0x01000000,
    CLUSTER_CHANGE_NETINTERFACE_DELETED   = 0x02000000,
    CLUSTER_CHANGE_NETINTERFACE_ADDED     = 0x04000000,
    CLUSTER_CHANGE_NETINTERFACE_PROPERTY  = 0x08000000,
    CLUSTER_CHANGE_QUORUM_STATE           = 0x10000000,
    CLUSTER_CHANGE_CLUSTER_STATE          = 0x20000000,
    CLUSTER_CHANGE_CLUSTER_PROPERTY       = 0x40000000,
    CLUSTER_CHANGE_HANDLE_CLOSE           = 0x80000000,
    CLUSTER_CHANGE_ALL                    = 0xffffffff,
}

alias CLUSTER_NOTIFICATIONS_VERSION = int;
enum : int
{
    CLUSTER_NOTIFICATIONS_V1 = 0x00000001,
    CLUSTER_NOTIFICATIONS_V2 = 0x00000002,
}

alias CLUSTER_CHANGE_CLUSTER_V2 = int;
enum : int
{
    CLUSTER_CHANGE_CLUSTER_RECONNECT_V2           = 0x00000001,
    CLUSTER_CHANGE_CLUSTER_STATE_V2               = 0x00000002,
    CLUSTER_CHANGE_CLUSTER_GROUP_ADDED_V2         = 0x00000004,
    CLUSTER_CHANGE_CLUSTER_HANDLE_CLOSE_V2        = 0x00000008,
    CLUSTER_CHANGE_CLUSTER_NETWORK_ADDED_V2       = 0x00000010,
    CLUSTER_CHANGE_CLUSTER_NODE_ADDED_V2          = 0x00000020,
    CLUSTER_CHANGE_CLUSTER_RESOURCE_TYPE_ADDED_V2 = 0x00000040,
    CLUSTER_CHANGE_CLUSTER_COMMON_PROPERTY_V2     = 0x00000080,
    CLUSTER_CHANGE_CLUSTER_PRIVATE_PROPERTY_V2    = 0x00000100,
    CLUSTER_CHANGE_CLUSTER_LOST_NOTIFICATIONS_V2  = 0x00000200,
    CLUSTER_CHANGE_CLUSTER_RENAME_V2              = 0x00000400,
    CLUSTER_CHANGE_CLUSTER_MEMBERSHIP_V2          = 0x00000800,
    CLUSTER_CHANGE_CLUSTER_UPGRADED_V2            = 0x00001000,
    CLUSTER_CHANGE_CLUSTER_ALL_V2                 = 0x00001fff,
}

alias CLUSTER_CHANGE_GROUP_V2 = int;
enum : int
{
    CLUSTER_CHANGE_GROUP_DELETED_V2          = 0x00000001,
    CLUSTER_CHANGE_GROUP_COMMON_PROPERTY_V2  = 0x00000002,
    CLUSTER_CHANGE_GROUP_PRIVATE_PROPERTY_V2 = 0x00000004,
    CLUSTER_CHANGE_GROUP_STATE_V2            = 0x00000008,
    CLUSTER_CHANGE_GROUP_OWNER_NODE_V2       = 0x00000010,
    CLUSTER_CHANGE_GROUP_PREFERRED_OWNERS_V2 = 0x00000020,
    CLUSTER_CHANGE_GROUP_RESOURCE_ADDED_V2   = 0x00000040,
    CLUSTER_CHANGE_GROUP_RESOURCE_GAINED_V2  = 0x00000080,
    CLUSTER_CHANGE_GROUP_RESOURCE_LOST_V2    = 0x00000100,
    CLUSTER_CHANGE_GROUP_HANDLE_CLOSE_V2     = 0x00000200,
    CLUSTER_CHANGE_GROUP_ALL_V2              = 0x000003ff,
}

alias CLUSTER_CHANGE_GROUPSET_V2 = int;
enum : int
{
    CLUSTER_CHANGE_GROUPSET_DELETED_v2          = 0x00000001,
    CLUSTER_CHANGE_GROUPSET_COMMON_PROPERTY_V2  = 0x00000002,
    CLUSTER_CHANGE_GROUPSET_PRIVATE_PROPERTY_V2 = 0x00000004,
    CLUSTER_CHANGE_GROUPSET_STATE_V2            = 0x00000008,
    CLUSTER_CHANGE_GROUPSET_GROUP_ADDED         = 0x00000010,
    CLUSTER_CHANGE_GROUPSET_GROUP_REMOVED       = 0x00000020,
    CLUSTER_CHANGE_GROUPSET_DEPENDENCIES_V2     = 0x00000040,
    CLUSTER_CHANGE_GROUPSET_DEPENDENTS_V2       = 0x00000080,
    CLUSTER_CHANGE_GROUPSET_HANDLE_CLOSE_v2     = 0x00000100,
    CLUSTER_CHANGE_GROUPSET_ALL_V2              = 0x000001ff,
}

alias CLUSTER_CHANGE_RESOURCE_V2 = int;
enum : int
{
    CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2  = 0x00000001,
    CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2 = 0x00000002,
    CLUSTER_CHANGE_RESOURCE_STATE_V2            = 0x00000004,
    CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2      = 0x00000008,
    CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2     = 0x00000010,
    CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2       = 0x00000020,
    CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2  = 0x00000040,
    CLUSTER_CHANGE_RESOURCE_DELETED_V2          = 0x00000080,
    CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2     = 0x00000100,
    CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2     = 0x00000200,
    CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2   = 0x00000400,
    CLUSTER_CHANGE_RESOURCE_ALL_V2              = 0x000007ff,
}

alias CLUSTER_CHANGE_RESOURCE_TYPE_V2 = int;
enum : int
{
    CLUSTER_CHANGE_RESOURCE_TYPE_DELETED_V2          = 0x00000001,
    CLUSTER_CHANGE_RESOURCE_TYPE_COMMON_PROPERTY_V2  = 0x00000002,
    CLUSTER_CHANGE_RESOURCE_TYPE_PRIVATE_PROPERTY_V2 = 0x00000004,
    CLUSTER_CHANGE_RESOURCE_TYPE_POSSIBLE_OWNERS_V2  = 0x00000008,
    CLUSTER_CHANGE_RESOURCE_TYPE_DLL_UPGRADED_V2     = 0x00000010,
    CLUSTER_RESOURCE_TYPE_SPECIFIC_V2                = 0x00000020,
    CLUSTER_CHANGE_RESOURCE_TYPE_ALL_V2              = 0x0000003f,
}

alias CLUSTER_CHANGE_NETINTERFACE_V2 = int;
enum : int
{
    CLUSTER_CHANGE_NETINTERFACE_DELETED_V2          = 0x00000001,
    CLUSTER_CHANGE_NETINTERFACE_COMMON_PROPERTY_V2  = 0x00000002,
    CLUSTER_CHANGE_NETINTERFACE_PRIVATE_PROPERTY_V2 = 0x00000004,
    CLUSTER_CHANGE_NETINTERFACE_STATE_V2            = 0x00000008,
    CLUSTER_CHANGE_NETINTERFACE_HANDLE_CLOSE_V2     = 0x00000010,
    CLUSTER_CHANGE_NETINTERFACE_ALL_V2              = 0x0000001f,
}

alias CLUSTER_CHANGE_NETWORK_V2 = int;
enum : int
{
    CLUSTER_CHANGE_NETWORK_DELETED_V2          = 0x00000001,
    CLUSTER_CHANGE_NETWORK_COMMON_PROPERTY_V2  = 0x00000002,
    CLUSTER_CHANGE_NETWORK_PRIVATE_PROPERTY_V2 = 0x00000004,
    CLUSTER_CHANGE_NETWORK_STATE_V2            = 0x00000008,
    CLUSTER_CHANGE_NETWORK_HANDLE_CLOSE_V2     = 0x00000010,
    CLUSTER_CHANGE_NETWORK_ALL_V2              = 0x0000001f,
}

alias CLUSTER_CHANGE_NODE_V2 = int;
enum : int
{
    CLUSTER_CHANGE_NODE_NETINTERFACE_ADDED_V2 = 0x00000001,
    CLUSTER_CHANGE_NODE_DELETED_V2            = 0x00000002,
    CLUSTER_CHANGE_NODE_COMMON_PROPERTY_V2    = 0x00000004,
    CLUSTER_CHANGE_NODE_PRIVATE_PROPERTY_V2   = 0x00000008,
    CLUSTER_CHANGE_NODE_STATE_V2              = 0x00000010,
    CLUSTER_CHANGE_NODE_GROUP_GAINED_V2       = 0x00000020,
    CLUSTER_CHANGE_NODE_GROUP_LOST_V2         = 0x00000040,
    CLUSTER_CHANGE_NODE_HANDLE_CLOSE_V2       = 0x00000080,
    CLUSTER_CHANGE_NODE_ALL_V2                = 0x000000ff,
}

alias CLUSTER_CHANGE_REGISTRY_V2 = int;
enum : int
{
    CLUSTER_CHANGE_REGISTRY_ATTRIBUTES_V2   = 0x00000001,
    CLUSTER_CHANGE_REGISTRY_NAME_V2         = 0x00000002,
    CLUSTER_CHANGE_REGISTRY_SUBTREE_V2      = 0x00000004,
    CLUSTER_CHANGE_REGISTRY_VALUE_V2        = 0x00000008,
    CLUSTER_CHANGE_REGISTRY_HANDLE_CLOSE_V2 = 0x00000010,
    CLUSTER_CHANGE_REGISTRY_ALL_V2          = 0x0000001f,
}

alias CLUSTER_CHANGE_QUORUM_V2 = int;
enum : int
{
    CLUSTER_CHANGE_QUORUM_STATE_V2 = 0x00000001,
    CLUSTER_CHANGE_QUORUM_ALL_V2   = 0x00000001,
}

alias CLUSTER_CHANGE_SHARED_VOLUME_V2 = int;
enum : int
{
    CLUSTER_CHANGE_SHARED_VOLUME_STATE_V2   = 0x00000001,
    CLUSTER_CHANGE_SHARED_VOLUME_ADDED_V2   = 0x00000002,
    CLUSTER_CHANGE_SHARED_VOLUME_REMOVED_V2 = 0x00000004,
    CLUSTER_CHANGE_SHARED_VOLUME_ALL_V2     = 0x00000007,
}

alias CLUSTER_CHANGE_SPACEPORT_V2 = int;
enum : int
{
    CLUSTER_CHANGE_SPACEPORT_CUSTOM_PNP_V2 = 0x00000001,
}

alias CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 = int;
enum : int
{
    CLUSTER_CHANGE_UPGRADE_NODE_PREPARE    = 0x00000001,
    CLUSTER_CHANGE_UPGRADE_NODE_COMMIT     = 0x00000002,
    CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT = 0x00000004,
    CLUSTER_CHANGE_UPGRADE_ALL             = 0x00000007,
}

alias CLUSTER_OBJECT_TYPE = int;
enum : int
{
    CLUSTER_OBJECT_TYPE_NONE              = 0x00000000,
    CLUSTER_OBJECT_TYPE_CLUSTER           = 0x00000001,
    CLUSTER_OBJECT_TYPE_GROUP             = 0x00000002,
    CLUSTER_OBJECT_TYPE_RESOURCE          = 0x00000003,
    CLUSTER_OBJECT_TYPE_RESOURCE_TYPE     = 0x00000004,
    CLUSTER_OBJECT_TYPE_NETWORK_INTERFACE = 0x00000005,
    CLUSTER_OBJECT_TYPE_NETWORK           = 0x00000006,
    CLUSTER_OBJECT_TYPE_NODE              = 0x00000007,
    CLUSTER_OBJECT_TYPE_REGISTRY          = 0x00000008,
    CLUSTER_OBJECT_TYPE_QUORUM            = 0x00000009,
    CLUSTER_OBJECT_TYPE_SHARED_VOLUME     = 0x0000000a,
    CLUSTER_OBJECT_TYPE_GROUPSET          = 0x0000000d,
    CLUSTER_OBJECT_TYPE_AFFINITYRULE      = 0x00000010,
    CLUSTER_OBJECT_TYPE_FAULTDOMAIN       = 0x00000011,
}

alias CLUSTERSET_OBJECT_TYPE = int;
enum : int
{
    CLUSTERSET_OBJECT_TYPE_NONE     = 0x00000000,
    CLUSTERSET_OBJECT_TYPE_MEMBER   = 0x00000001,
    CLUSTERSET_OBJECT_TYPE_WORKLOAD = 0x00000002,
    CLUSTERSET_OBJECT_TYPE_DATABASE = 0x00000003,
}

struct NOTIFY_FILTER_AND_TYPE
{
    uint dwObjectType;
    long FilterFlags;
}
struct CLUSTER_MEMBERSHIP_INFO
{
    BOOL HasQuorum;
    uint UpnodesSize;
    ubyte[1] Upnodes;
}
alias PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 = HCHANGE function(HCHANGE, HCLUSTER, NOTIFY_FILTER_AND_TYPE*, uint, ulong);
alias PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 = uint function(HCHANGE, NOTIFY_FILTER_AND_TYPE, HANDLE, ulong);
alias PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 = uint function(HCHANGE, HANDLE*);
alias PCLUSAPI_GET_CLUSTER_NOTIFY_V2 = uint function(HCHANGE, ulong*, NOTIFY_FILTER_AND_TYPE*, ubyte*, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*, uint);
alias PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT = HCHANGE function(HCHANGE, HCLUSTER, uint, ulong);
alias PCLUSAPI_REGISTER_CLUSTER_NOTIFY = uint function(HCHANGE, uint, HANDLE, ulong);
alias PCLUSAPI_GET_CLUSTER_NOTIFY = uint function(HCHANGE, ulong*, uint*, PWSTR, uint*, uint);
alias PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT = BOOL function(HCHANGE);
alias CLUSTER_ENUM = int;
enum : int
{
    CLUSTER_ENUM_NODE                   = 0x00000001,
    CLUSTER_ENUM_RESTYPE                = 0x00000002,
    CLUSTER_ENUM_RESOURCE               = 0x00000004,
    CLUSTER_ENUM_GROUP                  = 0x00000008,
    CLUSTER_ENUM_NETWORK                = 0x00000010,
    CLUSTER_ENUM_NETINTERFACE           = 0x00000020,
    CLUSTER_ENUM_SHARED_VOLUME_GROUP    = 0x20000000,
    CLUSTER_ENUM_SHARED_VOLUME_RESOURCE = 0x40000000,
    CLUSTER_ENUM_INTERNAL_NETWORK       = 0x80000000,
    CLUSTER_ENUM_ALL                    = 0x0000003f,
}

alias PCLUSAPI_CLUSTER_OPEN_ENUM = HCLUSENUM function(HCLUSTER, uint);
alias PCLUSAPI_CLUSTER_GET_ENUM_COUNT = uint function(HCLUSENUM);
alias PCLUSAPI_CLUSTER_ENUM = uint function(HCLUSENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_CLOSE_ENUM = uint function(HCLUSENUM);
alias PCLUSAPI_CLUSTER_OPEN_ENUM_EX = HCLUSENUMEX function(HCLUSTER, uint, void*);
alias PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX = uint function(HCLUSENUMEX);
alias PCLUSAPI_CLUSTER_ENUM_EX = uint function(HCLUSENUMEX, uint, CLUSTER_ENUM_ITEM*, uint*);
alias PCLUSAPI_CLUSTER_CLOSE_ENUM_EX = uint function(HCLUSENUMEX);
alias PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET = HGROUPSET function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_GROUP_GROUPSET = HGROUPSET function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_CLOSE_CLUSTER_GROUP_GROUPSET = BOOL function(HGROUPSET);
alias PCLUSAPI_DELETE_CLUSTER_GROUP_GROUPSET = uint function(HGROUPSET);
alias PCLUSAPI_DELETE_CLUSTER_GROUP_GROUPSET_EX = uint function(HGROUPSET, const(wchar)*);
alias PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET = uint function(HGROUPSET, HGROUP);
alias PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUPSET_WITH_DOMAINS_EX = uint function(HGROUPSET, HGROUP, uint, uint, const(wchar)*);
alias PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET = uint function(HGROUPSET);
alias PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX = uint function(HGROUPSET, const(wchar)*);
alias PCLUSAPI_CLUSTER_GROUP_GROUPSET_CONTROL = uint function(HGROUPSET, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_GROUP_GROUPSET_CONTROL_EX = uint function(HGROUPSET, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY = uint function(HGROUP, HGROUP);
alias PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX = uint function(HGROUP, HGROUP, const(wchar)*);
alias PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION = uint function(HGROUP, const(wchar)*);
alias PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION_EX = uint function(HGROUP, const(wchar)*, const(wchar)*);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_DEPENDENCY = uint function(HGROUP, HGROUP);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_DEPENDENCY_EX = uint function(HGROUP, HGROUP, const(wchar)*);
alias PCLUSAPI_ADD_CLUSTER_GROUP_GROUPSET_DEPENDENCY = uint function(HGROUPSET, HGROUPSET);
alias PCLUSAPI_ADD_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EX = uint function(HGROUPSET, HGROUPSET, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EXPRESSION = uint function(HGROUPSET, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EXPRESSION_EX = uint function(HGROUPSET, const(wchar)*, const(wchar)*);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_GROUPSET_DEPENDENCY = uint function(HGROUPSET, HGROUPSET);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EX = uint function(HGROUPSET, HGROUPSET, const(wchar)*);
alias PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = uint function(HGROUP, HGROUPSET);
alias PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY_EX = uint function(HGROUP, HGROUPSET, const(wchar)*);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = uint function(HGROUP, HGROUPSET);
alias PCLUSAPI_REMOVE_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY_EX = uint function(HGROUP, HGROUPSET, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET = HCLUSTER function(HGROUPSET);
alias PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY = uint function(HGROUPSET, const(wchar)*, const(wchar)*);
alias PCLUSAPI_REMOVE_CROSS_CLUSTER_GROUPSET_DEPENDENCY = uint function(HGROUPSET, const(wchar)*, const(wchar)*);
struct CLUSTER_AVAILABILITY_SET_CONFIG
{
    uint dwVersion;
    uint dwUpdateDomains;
    uint dwFaultDomains;
    BOOL bReserveSpareNode;
}
alias PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET = HGROUPSET function(HCLUSTER, const(wchar)*, CLUSTER_AVAILABILITY_SET_CONFIG*);
alias PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE = uint function(HCLUSTER, const(wchar)*, CLUS_AFFINITY_RULE_TYPE);
alias PCLUSAPI_CLUSTER_REMOVE_AFFINITY_RULE = uint function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE = uint function(HCLUSTER, const(wchar)*, HGROUP);
alias PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_AFFINITY_RULE = uint function(HCLUSTER, const(wchar)*, HGROUP);
alias PCLUSAPI_CLUSTER_AFFINITY_RULE_CONTROL = uint function(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*);
alias CLUSTER_NODE_ENUM = int;
enum : int
{
    CLUSTER_NODE_ENUM_NETINTERFACES    = 0x00000001,
    CLUSTER_NODE_ENUM_GROUPS           = 0x00000002,
    CLUSTER_NODE_ENUM_PREFERRED_GROUPS = 0x00000004,
    CLUSTER_NODE_ENUM_ALL              = 0x00000003,
}

alias CLUSTER_NODE_STATE = int;
enum : int
{
    ClusterNodeStateUnknown = 0xffffffff,
    ClusterNodeUp           = 0x00000000,
    ClusterNodeDown         = 0x00000001,
    ClusterNodePaused       = 0x00000002,
    ClusterNodeJoining      = 0x00000003,
}

alias CLUSTER_STORAGENODE_STATE = int;
enum : int
{
    ClusterStorageNodeStateUnknown = 0x00000000,
    ClusterStorageNodeUp           = 0x00000001,
    ClusterStorageNodeDown         = 0x00000002,
    ClusterStorageNodePaused       = 0x00000003,
    ClusterStorageNodeStarting     = 0x00000004,
    ClusterStorageNodeStopping     = 0x00000005,
}

alias CLUSTER_NODE_DRAIN_STATUS = int;
enum : int
{
    NodeDrainStatusNotInitiated = 0x00000000,
    NodeDrainStatusInProgress   = 0x00000001,
    NodeDrainStatusCompleted    = 0x00000002,
    NodeDrainStatusFailed       = 0x00000003,
    ClusterNodeDrainStatusCount = 0x00000004,
}

alias CLUSTER_NODE_STATUS = int;
enum : int
{
    NodeStatusNormal          = 0x00000000,
    NodeStatusIsolated        = 0x00000001,
    NodeStatusQuarantined     = 0x00000002,
    NodeStatusDrainInProgress = 0x00000004,
    NodeStatusDrainCompleted  = 0x00000008,
    NodeStatusDrainFailed     = 0x00000010,
    NodeStatusAvoidPlacement  = 0x00000020,
    NodeStatusMax             = 0x00000033,
}

alias PCLUSAPI_OPEN_CLUSTER_NODE = HNODE function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_NODE_EX = HNODE function(HCLUSTER, const(wchar)*, uint, uint*);
alias PCLUSAPI_OPEN_NODE_BY_ID = HNODE function(HCLUSTER, uint);
alias PCLUSAPI_CLOSE_CLUSTER_NODE = BOOL function(HNODE);
alias PCLUSAPI_GET_CLUSTER_NODE_STATE = CLUSTER_NODE_STATE function(HNODE);
alias PCLUSAPI_GET_CLUSTER_NODE_ID = uint function(HNODE, PWSTR, uint*);
alias PCLUSAPI_GET_CLUSTER_FROM_NODE = HCLUSTER function(HNODE);
alias PCLUSAPI_PAUSE_CLUSTER_NODE = uint function(HNODE);
alias PCLUSAPI_RESUME_CLUSTER_NODE = uint function(HNODE);
alias PCLUSAPI_EVICT_CLUSTER_NODE = uint function(HNODE);
alias PCLUSAPI_CLUSTER_NODE_OPEN_ENUM = HNODEENUM function(HNODE, uint);
alias PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX = HNODEENUMEX function(HNODE, uint, void*);
alias PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT_EX = uint function(HNODEENUMEX);
alias PCLUSAPI_CLUSTER_NODE_ENUM_EX = uint function(HNODEENUMEX, uint, CLUSTER_ENUM_ITEM*, uint*);
alias PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM_EX = uint function(HNODEENUMEX);
alias PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT = uint function(HNODEENUM);
alias PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM = uint function(HNODEENUM);
alias PCLUSAPI_CLUSTER_NODE_ENUM = uint function(HNODEENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_EVICT_CLUSTER_NODE_EX = uint function(HNODE, uint, HRESULT*);
alias PCLUSAPI_EVICT_CLUSTER_NODE_EX2 = uint function(HNODE, uint, HRESULT*, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_RESOURCE_TYPE_KEY = HKEY function(HCLUSTER, const(wchar)*, uint);
alias CLUSTER_GROUP_ENUM = int;
enum : int
{
    CLUSTER_GROUP_ENUM_CONTAINS = 0x00000001,
    CLUSTER_GROUP_ENUM_NODES    = 0x00000002,
    CLUSTER_GROUP_ENUM_ALL      = 0x00000003,
}

alias CLUSTER_GROUP_STATE = int;
enum : int
{
    ClusterGroupStateUnknown  = 0xffffffff,
    ClusterGroupOnline        = 0x00000000,
    ClusterGroupOffline       = 0x00000001,
    ClusterGroupFailed        = 0x00000002,
    ClusterGroupPartialOnline = 0x00000003,
    ClusterGroupPending       = 0x00000004,
}

alias CLUSTER_GROUP_PRIORITY = int;
enum : int
{
    PriorityDisabled = 0x00000000,
    PriorityLow      = 0x000003e8,
    PriorityMedium   = 0x000007d0,
    PriorityHigh     = 0x00000bb8,
}

alias CLUSTER_GROUP_AUTOFAILBACK_TYPE = int;
enum : int
{
    ClusterGroupPreventFailback   = 0x00000000,
    ClusterGroupAllowFailback     = 0x00000001,
    ClusterGroupFailbackTypeCount = 0x00000002,
}

struct CLUSTER_GROUP_ENUM_ITEM
{
    uint dwVersion;
    uint cbId;
    PWSTR lpszId;
    uint cbName;
    PWSTR lpszName;
    CLUSTER_GROUP_STATE state;
    uint cbOwnerNode;
    PWSTR lpszOwnerNode;
    uint dwFlags;
    uint cbProperties;
    void* pProperties;
    uint cbRoProperties;
    void* pRoProperties;
}
struct CLUSTER_RESOURCE_ENUM_ITEM
{
    uint dwVersion;
    uint cbId;
    PWSTR lpszId;
    uint cbName;
    PWSTR lpszName;
    uint cbOwnerGroupName;
    PWSTR lpszOwnerGroupName;
    uint cbOwnerGroupId;
    PWSTR lpszOwnerGroupId;
    uint cbProperties;
    void* pProperties;
    uint cbRoProperties;
    void* pRoProperties;
}
alias PCLUSAPI_CREATE_CLUSTER_GROUP = HGROUP function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_GROUP = HGROUP function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_GROUP_EX = HGROUP function(HCLUSTER, const(wchar)*, uint, uint*);
alias PCLUSAPI_PAUSE_CLUSTER_NODE_EX = uint function(HNODE, BOOL, uint, HNODE);
alias PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 = uint function(HNODE, BOOL, uint, HNODE, const(wchar)*);
alias CLUSTER_NODE_RESUME_FAILBACK_TYPE = int;
enum : int
{
    DoNotFailbackGroups                = 0x00000000,
    FailbackGroupsImmediately          = 0x00000001,
    FailbackGroupsPerPolicy            = 0x00000002,
    ClusterNodeResumeFailbackTypeCount = 0x00000003,
}

alias PCLUSAPI_RESUME_CLUSTER_NODE_EX = uint function(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, uint);
alias PCLUSAPI_RESUME_CLUSTER_NODE_EX2 = uint function(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, uint, const(wchar)*);
alias PCLUSAPI_CREATE_CLUSTER_GROUPEX = HGROUP function(HCLUSTER, const(wchar)*, CLUSTER_CREATE_GROUP_INFO*);
alias PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM_EX = HGROUPENUMEX function(HCLUSTER, const(wchar)*, uint, const(wchar)*, uint, uint);
alias PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT_EX = uint function(HGROUPENUMEX);
alias PCLUSAPI_CLUSTER_GROUP_ENUM_EX = uint function(HGROUPENUMEX, uint, CLUSTER_GROUP_ENUM_ITEM*, uint*);
alias PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX = uint function(HGROUPENUMEX);
alias PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX = HRESENUMEX function(HCLUSTER, const(wchar)*, uint, const(wchar)*, uint, uint);
alias PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT_EX = uint function(HRESENUMEX);
alias PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX = uint function(HRESENUMEX, uint, CLUSTER_RESOURCE_ENUM_ITEM*, uint*);
alias PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM_EX = uint function(HRESENUMEX);
alias PCLUSAPI_RESTART_CLUSTER_RESOURCE = uint function(HRESOURCE, uint);
alias PCLUSAPI_RESTART_CLUSTER_RESOURCE_EX = uint function(HRESOURCE, uint);
alias PCLUSAPI_CLOSE_CLUSTER_GROUP = BOOL function(HGROUP);
alias PCLUSAPI_GET_CLUSTER_FROM_GROUP = HCLUSTER function(HGROUP);
alias PCLUSAPI_GET_CLUSTER_GROUP_STATE = CLUSTER_GROUP_STATE function(HGROUP, PWSTR, uint*);
alias PCLUSAPI_SET_CLUSTER_GROUP_NAME = uint function(HGROUP, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST = uint function(HGROUP, uint, HNODE*);
alias PCLUSAPI_SET_CLUSTER_GROUP_NAME_EX = uint function(HGROUP, const(wchar)*, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX = uint function(HGROUP, uint, HNODE*, const(wchar)*);
alias PCLUSAPI_ONLINE_CLUSTER_GROUP = uint function(HGROUP, HNODE);
alias PCLUSAPI_MOVE_CLUSTER_GROUP = uint function(HGROUP, HNODE);
alias PCLUSAPI_OFFLINE_CLUSTER_GROUP = uint function(HGROUP);
alias PCLUSAPI_DELETE_CLUSTER_GROUP = uint function(HGROUP);
alias PCLUSAPI_DESTROY_CLUSTER_GROUP = uint function(HGROUP);
alias PCLUSAPI_DELETE_CLUSTER_GROUP_EX = uint function(HGROUP, const(wchar)*);
alias PCLUSAPI_DESTROY_CLUSTER_GROUP_EX = uint function(HGROUP, const(wchar)*);
alias PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM = HGROUPENUM function(HGROUP, uint);
alias PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT = uint function(HGROUPENUM);
alias PCLUSAPI_CLUSTER_GROUP_ENUM = uint function(HGROUPENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM = uint function(HGROUPENUM);
alias CLUSTER_RESOURCE_STATE = int;
enum : int
{
    ClusterResourceStateUnknown   = 0xffffffff,
    ClusterResourceInherited      = 0x00000000,
    ClusterResourceInitializing   = 0x00000001,
    ClusterResourceOnline         = 0x00000002,
    ClusterResourceOffline        = 0x00000003,
    ClusterResourceFailed         = 0x00000004,
    ClusterResourcePending        = 0x00000080,
    ClusterResourceOnlinePending  = 0x00000081,
    ClusterResourceOfflinePending = 0x00000082,
}

alias CLUSTER_RESOURCE_RESTART_ACTION = int;
enum : int
{
    ClusterResourceDontRestart        = 0x00000000,
    ClusterResourceRestartNoNotify    = 0x00000001,
    ClusterResourceRestartNotify      = 0x00000002,
    ClusterResourceRestartActionCount = 0x00000003,
}

alias CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION = int;
enum : int
{
    ClusterResourceEmbeddedFailureActionNone    = 0x00000000,
    ClusterResourceEmbeddedFailureActionLogOnly = 0x00000001,
    ClusterResourceEmbeddedFailureActionRecover = 0x00000002,
}

alias CLUSTER_RESOURCE_CREATE_FLAGS = int;
enum : int
{
    CLUSTER_RESOURCE_DEFAULT_MONITOR  = 0x00000000,
    CLUSTER_RESOURCE_SEPARATE_MONITOR = 0x00000001,
    CLUSTER_RESOURCE_VALID_FLAGS      = 0x00000001,
}

alias CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE = int;
enum : int
{
    ClusterSharedVolumeSnapshotStateUnknown = 0x00000000,
    ClusterSharedVolumePrepareForHWSnapshot = 0x00000001,
    ClusterSharedVolumeHWSnapshotCompleted  = 0x00000002,
    ClusterSharedVolumePrepareForFreeze     = 0x00000003,
}

alias PCLUSAPI_CREATE_CLUSTER_RESOURCE = HRESOURCE function(HGROUP, const(wchar)*, const(wchar)*, uint);
alias PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX = HRESOURCE function(HGROUP, const(wchar)*, const(wchar)*, uint, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_RESOURCE = HRESOURCE function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX = HRESOURCE function(HCLUSTER, const(wchar)*, uint, uint*);
alias PCLUSAPI_CLOSE_CLUSTER_RESOURCE = BOOL function(HRESOURCE);
alias PCLUSAPI_GET_CLUSTER_FROM_RESOURCE = HCLUSTER function(HRESOURCE);
alias PCLUSAPI_DELETE_CLUSTER_RESOURCE = uint function(HRESOURCE);
alias PCLUSAPI_DELETE_CLUSTER_RESOURCE_EX = uint function(HRESOURCE, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_RESOURCE_STATE = CLUSTER_RESOURCE_STATE function(HRESOURCE, PWSTR, uint*, PWSTR, uint*);
alias PCLUSAPI_SET_CLUSTER_RESOURCE_NAME = uint function(HRESOURCE, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_RESOURCE_NAME_EX = uint function(HRESOURCE, const(wchar)*, const(wchar)*);
alias PCLUSAPI_FAIL_CLUSTER_RESOURCE = uint function(HRESOURCE);
alias PCLUSAPI_FAIL_CLUSTER_RESOURCE_EX = uint function(HRESOURCE, const(wchar)*);
alias PCLUSAPI_ONLINE_CLUSTER_RESOURCE = uint function(HRESOURCE);
alias PCLUSAPI_OFFLINE_CLUSTER_RESOURCE = uint function(HRESOURCE);
alias PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP = uint function(HRESOURCE, HGROUP);
alias PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX = uint function(HRESOURCE, HGROUP, ulong);
alias PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 = uint function(HRESOURCE, HGROUP, ulong, const(wchar)*);
alias PCLUSAPI_ADD_CLUSTER_RESOURCE_NODE = uint function(HRESOURCE, HNODE);
alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE = uint function(HRESOURCE, HNODE);
alias PCLUSAPI_ADD_CLUSTER_RESOURCE_NODE_EX = uint function(HRESOURCE, HNODE, const(wchar)*);
alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE_EX = uint function(HRESOURCE, HNODE, const(wchar)*);
alias PCLUSAPI_ADD_CLUSTER_RESOURCE_DEPENDENCY = uint function(HRESOURCE, HRESOURCE);
alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY = uint function(HRESOURCE, HRESOURCE);
alias PCLUSAPI_ADD_CLUSTER_RESOURCE_DEPENDENCY_EX = uint function(HRESOURCE, HRESOURCE, const(wchar)*);
alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY_EX = uint function(HRESOURCE, HRESOURCE, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = uint function(HRESOURCE, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = uint function(HRESOURCE, PWSTR, uint*);
alias PCLUSAPI_ADD_RESOURCE_TO_CLUSTER_SHARED_VOLUMES = uint function(HRESOURCE);
alias PCLUSAPI_REMOVE_RESOURCE_FROM_CLUSTER_SHARED_VOLUMES = uint function(HRESOURCE);
alias PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME = uint function(const(wchar)*, BOOL*);
alias PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE = uint function(GUID, const(wchar)*, CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE);
alias PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT = BOOL function(HRESOURCE, HRESOURCE);
alias PCLUSAPI_CLUSTER_RESOURCE_CONTROL = uint function(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL = uint function(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_GROUP_CONTROL = uint function(HGROUP, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_RESOURCE_CONTROL_EX = uint function(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_RESOURCE_CONTROL_AS_USER_EX = uint function(HRESOURCE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_EX = uint function(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX = uint function(HCLUSTER, const(wchar)*, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_GROUP_CONTROL_EX = uint function(HGROUP, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_NODE_CONTROL = uint function(HNODE, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_NODE_CONTROL_EX = uint function(HNODE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME = BOOL function(HRESOURCE, PWSTR, uint*);
alias CLUSTER_PROPERTY_TYPE = int;
enum : int
{
    CLUSPROP_TYPE_UNKNOWN                      = 0xffffffff,
    CLUSPROP_TYPE_ENDMARK                      = 0x00000000,
    CLUSPROP_TYPE_LIST_VALUE                   = 0x00000001,
    CLUSPROP_TYPE_RESCLASS                     = 0x00000002,
    CLUSPROP_TYPE_RESERVED1                    = 0x00000003,
    CLUSPROP_TYPE_NAME                         = 0x00000004,
    CLUSPROP_TYPE_SIGNATURE                    = 0x00000005,
    CLUSPROP_TYPE_SCSI_ADDRESS                 = 0x00000006,
    CLUSPROP_TYPE_DISK_NUMBER                  = 0x00000007,
    CLUSPROP_TYPE_PARTITION_INFO               = 0x00000008,
    CLUSPROP_TYPE_FTSET_INFO                   = 0x00000009,
    CLUSPROP_TYPE_DISK_SERIALNUMBER            = 0x0000000a,
    CLUSPROP_TYPE_DISK_GUID                    = 0x0000000b,
    CLUSPROP_TYPE_DISK_SIZE                    = 0x0000000c,
    CLUSPROP_TYPE_PARTITION_INFO_EX            = 0x0000000d,
    CLUSPROP_TYPE_PARTITION_INFO_EX2           = 0x0000000e,
    CLUSPROP_TYPE_STORAGE_DEVICE_ID_DESCRIPTOR = 0x0000000f,
    CLUSPROP_TYPE_USER                         = 0x00008000,
}

alias CLUSTER_PROPERTY_FORMAT = int;
enum : int
{
    CLUSPROP_FORMAT_UNKNOWN             = 0x00000000,
    CLUSPROP_FORMAT_BINARY              = 0x00000001,
    CLUSPROP_FORMAT_DWORD               = 0x00000002,
    CLUSPROP_FORMAT_SZ                  = 0x00000003,
    CLUSPROP_FORMAT_EXPAND_SZ           = 0x00000004,
    CLUSPROP_FORMAT_MULTI_SZ            = 0x00000005,
    CLUSPROP_FORMAT_ULARGE_INTEGER      = 0x00000006,
    CLUSPROP_FORMAT_LONG                = 0x00000007,
    CLUSPROP_FORMAT_EXPANDED_SZ         = 0x00000008,
    CLUSPROP_FORMAT_SECURITY_DESCRIPTOR = 0x00000009,
    CLUSPROP_FORMAT_LARGE_INTEGER       = 0x0000000a,
    CLUSPROP_FORMAT_WORD                = 0x0000000b,
    CLUSPROP_FORMAT_FILETIME            = 0x0000000c,
    CLUSPROP_FORMAT_VALUE_LIST          = 0x0000000d,
    CLUSPROP_FORMAT_PROPERTY_LIST       = 0x0000000e,
    CLUSPROP_FORMAT_USER                = 0x00008000,
}

alias CLUSTER_PROPERTY_SYNTAX = uint;
enum : uint
{
    CLUSPROP_SYNTAX_ENDMARK                        = 0x00000000,
    CLUSPROP_SYNTAX_NAME                           = 0x00040003,
    CLUSPROP_SYNTAX_RESCLASS                       = 0x00020002,
    CLUSPROP_SYNTAX_LIST_VALUE_SZ                  = 0x00010003,
    CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ           = 0x00010004,
    CLUSPROP_SYNTAX_LIST_VALUE_DWORD               = 0x00010002,
    CLUSPROP_SYNTAX_LIST_VALUE_BINARY              = 0x00010001,
    CLUSPROP_SYNTAX_LIST_VALUE_MULTI_SZ            = 0x00010005,
    CLUSPROP_SYNTAX_LIST_VALUE_LONG                = 0x00010007,
    CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ         = 0x00010008,
    CLUSPROP_SYNTAX_LIST_VALUE_SECURITY_DESCRIPTOR = 0x00010009,
    CLUSPROP_SYNTAX_LIST_VALUE_LARGE_INTEGER       = 0x0001000a,
    CLUSPROP_SYNTAX_LIST_VALUE_ULARGE_INTEGER      = 0x00010006,
    CLUSPROP_SYNTAX_LIST_VALUE_WORD                = 0x0001000b,
    CLUSPROP_SYNTAX_LIST_VALUE_PROPERTY_LIST       = 0x0001000e,
    CLUSPROP_SYNTAX_LIST_VALUE_FILETIME            = 0x0001000c,
    CLUSPROP_SYNTAX_DISK_SIGNATURE                 = 0x00050002,
    CLUSPROP_SYNTAX_SCSI_ADDRESS                   = 0x00060002,
    CLUSPROP_SYNTAX_DISK_NUMBER                    = 0x00070002,
    CLUSPROP_SYNTAX_PARTITION_INFO                 = 0x00080001,
    CLUSPROP_SYNTAX_FTSET_INFO                     = 0x00090001,
    CLUSPROP_SYNTAX_DISK_SERIALNUMBER              = 0x000a0003,
    CLUSPROP_SYNTAX_DISK_GUID                      = 0x000b0003,
    CLUSPROP_SYNTAX_DISK_SIZE                      = 0x000c0006,
    CLUSPROP_SYNTAX_PARTITION_INFO_EX              = 0x000d0001,
    CLUSPROP_SYNTAX_PARTITION_INFO_EX2             = 0x000e0001,
    CLUSPROP_SYNTAX_STORAGE_DEVICE_ID_DESCRIPTOR   = 0x000f0001,
}

struct GROUP_FAILURE_INFO
{
    uint dwFailoverAttemptsRemaining;
    uint dwFailoverPeriodRemaining;
}
struct GROUP_FAILURE_INFO_BUFFER
{
    uint dwVersion;
    GROUP_FAILURE_INFO Info;
}
struct RESOURCE_FAILURE_INFO
{
    uint dwRestartAttemptsRemaining;
    uint dwRestartPeriodRemaining;
}
struct RESOURCE_FAILURE_INFO_BUFFER
{
    uint dwVersion;
    RESOURCE_FAILURE_INFO Info;
}
struct RESOURCE_TERMINAL_FAILURE_INFO_BUFFER
{
    BOOL isTerminalFailure;
    uint restartPeriodRemaining;
}
alias CLUSTER_CONTROL_OBJECT = int;
enum : int
{
    CLUS_OBJECT_INVALID       = 0x00000000,
    CLUS_OBJECT_RESOURCE      = 0x00000001,
    CLUS_OBJECT_RESOURCE_TYPE = 0x00000002,
    CLUS_OBJECT_GROUP         = 0x00000003,
    CLUS_OBJECT_NODE          = 0x00000004,
    CLUS_OBJECT_NETWORK       = 0x00000005,
    CLUS_OBJECT_NETINTERFACE  = 0x00000006,
    CLUS_OBJECT_CLUSTER       = 0x00000007,
    CLUS_OBJECT_GROUPSET      = 0x00000008,
    CLUS_OBJECT_AFFINITYRULE  = 0x00000009,
    CLUS_OBJECT_USER          = 0x00000080,
}

alias CLCTL_CODES = int;
enum : int
{
    CLCTL_UNKNOWN                                                   = 0x00000000,
    CLCTL_GET_CHARACTERISTICS                                       = 0x00000005,
    CLCTL_GET_FLAGS                                                 = 0x00000009,
    CLCTL_GET_CLASS_INFO                                            = 0x0000000d,
    CLCTL_GET_REQUIRED_DEPENDENCIES                                 = 0x00000011,
    CLCTL_GET_ARB_TIMEOUT                                           = 0x00000015,
    CLCTL_GET_FAILURE_INFO                                          = 0x00000019,
    CLCTL_GET_NAME                                                  = 0x00000029,
    CLCTL_GET_RESOURCE_TYPE                                         = 0x0000002d,
    CLCTL_GET_NODE                                                  = 0x00000031,
    CLCTL_GET_NETWORK                                               = 0x00000035,
    CLCTL_GET_ID                                                    = 0x00000039,
    CLCTL_GET_FQDN                                                  = 0x0000003d,
    CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME                          = 0x00000041,
    CLCTL_CHECK_VOTER_EVICT                                         = 0x00000045,
    CLCTL_CHECK_VOTER_DOWN                                          = 0x00000049,
    CLCTL_SHUTDOWN                                                  = 0x0000004d,
    CLCTL_ENUM_COMMON_PROPERTIES                                    = 0x00000051,
    CLCTL_GET_RO_COMMON_PROPERTIES                                  = 0x00000055,
    CLCTL_GET_COMMON_PROPERTIES                                     = 0x00000059,
    CLCTL_SET_COMMON_PROPERTIES                                     = 0x0040005e,
    CLCTL_VALIDATE_COMMON_PROPERTIES                                = 0x00000061,
    CLCTL_GET_COMMON_PROPERTY_FMTS                                  = 0x00000065,
    CLCTL_GET_COMMON_RESOURCE_PROPERTY_FMTS                         = 0x00000069,
    CLCTL_CHECK_VOTER_EVICT_WITNESS                                 = 0x0000006d,
    CLCTL_CHECK_VOTER_DOWN_WITNESS                                  = 0x00000071,
    CLCTL_ENUM_PRIVATE_PROPERTIES                                   = 0x00000079,
    CLCTL_GET_RO_PRIVATE_PROPERTIES                                 = 0x0000007d,
    CLCTL_GET_PRIVATE_PROPERTIES                                    = 0x00000081,
    CLCTL_SET_PRIVATE_PROPERTIES                                    = 0x00400086,
    CLCTL_VALIDATE_PRIVATE_PROPERTIES                               = 0x00000089,
    CLCTL_GET_PRIVATE_PROPERTY_FMTS                                 = 0x0000008d,
    CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS                        = 0x00000091,
    CLCTL_ADD_REGISTRY_CHECKPOINT                                   = 0x004000a2,
    CLCTL_DELETE_REGISTRY_CHECKPOINT                                = 0x004000a6,
    CLCTL_GET_REGISTRY_CHECKPOINTS                                  = 0x000000a9,
    CLCTL_ADD_CRYPTO_CHECKPOINT                                     = 0x004000ae,
    CLCTL_DELETE_CRYPTO_CHECKPOINT                                  = 0x004000b2,
    CLCTL_GET_CRYPTO_CHECKPOINTS                                    = 0x000000b5,
    CLCTL_RESOURCE_UPGRADE_DLL                                      = 0x004000ba,
    CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT                             = 0x004000be,
    CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT                             = 0x004000c2,
    CLCTL_GET_LOADBAL_PROCESS_LIST                                  = 0x000000c9,
    CLCTL_SET_ACCOUNT_ACCESS                                        = 0x004000f2,
    CLCTL_GET_NETWORK_NAME                                          = 0x00000169,
    CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN                          = 0x0000016d,
    CLCTL_NETNAME_REGISTER_DNS_RECORDS                              = 0x00000172,
    CLCTL_GET_DNS_NAME                                              = 0x00000175,
    CLCTL_NETNAME_SET_PWD_INFO                                      = 0x0000017a,
    CLCTL_NETNAME_DELETE_CO                                         = 0x0000017e,
    CLCTL_NETNAME_VALIDATE_VCO                                      = 0x00000181,
    CLCTL_NETNAME_RESET_VCO                                         = 0x00000185,
    CLCTL_NETNAME_REPAIR_VCO                                        = 0x0000018d,
    CLCTL_STORAGE_GET_DISK_INFO                                     = 0x00000191,
    CLCTL_STORAGE_GET_AVAILABLE_DISKS                               = 0x00000195,
    CLCTL_STORAGE_IS_PATH_VALID                                     = 0x00000199,
    CLCTL_STORAGE_SYNC_CLUSDISK_DB                                  = 0x0040019e,
    CLCTL_STORAGE_GET_DISK_NUMBER_INFO                              = 0x000001a1,
    CLCTL_QUERY_DELETE                                              = 0x000001b9,
    CLCTL_IPADDRESS_RENEW_LEASE                                     = 0x004001be,
    CLCTL_IPADDRESS_RELEASE_LEASE                                   = 0x004001c2,
    CLCTL_QUERY_MAINTENANCE_MODE                                    = 0x000001e1,
    CLCTL_SET_MAINTENANCE_MODE                                      = 0x004001e6,
    CLCTL_STORAGE_SET_DRIVELETTER                                   = 0x004001ea,
    CLCTL_STORAGE_GET_DRIVELETTERS                                  = 0x000001ed,
    CLCTL_STORAGE_GET_DISK_INFO_EX                                  = 0x000001f1,
    CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX                            = 0x000001f5,
    CLCTL_STORAGE_GET_DISK_INFO_EX2                                 = 0x000001f9,
    CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT                           = 0x000001fd,
    CLCTL_STORAGE_REMAP_DRIVELETTER                                 = 0x00000201,
    CLCTL_STORAGE_GET_DISKID                                        = 0x00000205,
    CLCTL_STORAGE_IS_CLUSTERABLE                                    = 0x00000209,
    CLCTL_STORAGE_REMOVE_VM_OWNERSHIP                               = 0x0040020e,
    CLCTL_STORAGE_GET_MOUNTPOINTS                                   = 0x00000211,
    CLCTL_STORAGE_GET_DIRTY                                         = 0x00000219,
    CLCTL_STORAGE_GET_SHARED_VOLUME_INFO                            = 0x00000225,
    CLCTL_STORAGE_IS_CSV_FILE                                       = 0x00000229,
    CLCTL_STORAGE_GET_RESOURCEID                                    = 0x0000022d,
    CLCTL_VALIDATE_PATH                                             = 0x00000231,
    CLCTL_VALIDATE_NETNAME                                          = 0x00000235,
    CLCTL_VALIDATE_DIRECTORY                                        = 0x00000239,
    CLCTL_BATCH_BLOCK_KEY                                           = 0x0000023e,
    CLCTL_BATCH_UNBLOCK_KEY                                         = 0x00000241,
    CLCTL_FILESERVER_SHARE_ADD                                      = 0x00400246,
    CLCTL_FILESERVER_SHARE_DEL                                      = 0x0040024a,
    CLCTL_FILESERVER_SHARE_MODIFY                                   = 0x0040024e,
    CLCTL_FILESERVER_SHARE_REPORT                                   = 0x00000251,
    CLCTL_NETNAME_GET_OU_FOR_VCO                                    = 0x0040026e,
    CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO                             = 0x0040028a,
    CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO                            = 0x0040028e,
    CLCTL_GET_SHARED_VOLUME_ID                                      = 0x00000291,
    CLCTL_SET_CSV_MAINTENANCE_MODE                                  = 0x00400296,
    CLCTL_SET_SHARED_VOLUME_BACKUP_MODE                             = 0x0040029a,
    CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES                 = 0x0000029d,
    CLCTL_STORAGE_GET_SHARED_VOLUME_STATES                          = 0x004002a2,
    CLCTL_STORAGE_IS_SHARED_VOLUME                                  = 0x000002a5,
    CLCTL_GET_CLUSDB_TIMESTAMP                                      = 0x000002a9,
    CLCTL_RW_MODIFY_NOOP                                            = 0x004002ae,
    CLCTL_IS_QUORUM_BLOCKED                                         = 0x000002b1,
    CLCTL_POOL_GET_DRIVE_INFO                                       = 0x000002b5,
    CLCTL_GET_GUM_LOCK_OWNER                                        = 0x000002b9,
    CLCTL_GET_STUCK_NODES                                           = 0x000002bd,
    CLCTL_INJECT_GEM_FAULT                                          = 0x000002c1,
    CLCTL_INTRODUCE_GEM_REPAIR_DELAY                                = 0x000002c5,
    CLCTL_SEND_DUMMY_GEM_MESSAGES                                   = 0x000002c9,
    CLCTL_BLOCK_GEM_SEND_RECV                                       = 0x000002cd,
    CLCTL_GET_GEMID_VECTOR                                          = 0x000002d1,
    CLCTL_ADD_CRYPTO_CHECKPOINT_EX                                  = 0x004002d6,
    CLCTL_GROUP_GET_LAST_MOVE_TIME                                  = 0x000002d9,
    CLCTL_SET_STORAGE_CONFIGURATION                                 = 0x004002e2,
    CLCTL_GET_STORAGE_CONFIGURATION                                 = 0x000002e5,
    CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES                             = 0x000002e9,
    CLCTL_REMOVE_NODE                                               = 0x004002ee,
    CLCTL_IS_FEATURE_INSTALLED                                      = 0x000002f1,
    CLCTL_IS_S2D_FEATURE_SUPPORTED                                  = 0x000002f5,
    CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO                            = 0x000002f9,
    CLCTL_STORAGE_GET_CLUSBFLT_PATHS                                = 0x000002fd,
    CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO                             = 0x00000301,
    CLCTL_CLEAR_NODE_CONNECTION_INFO                                = 0x00400306,
    CLCTL_SET_DNS_DOMAIN                                            = 0x0040030a,
    CTCTL_GET_ROUTESTATUS_BASIC                                     = 0x0000030d,
    CTCTL_GET_ROUTESTATUS_EXTENDED                                  = 0x00000311,
    CTCTL_GET_FAULT_DOMAIN_STATE                                    = 0x00000315,
    CLCTL_NETNAME_SET_PWD_INFOEX                                    = 0x0000031a,
    CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT                       = 0x00001fe1,
    CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS          = 0x000020e1,
    CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN                       = 0x004020e6,
    CLCTL_RESOURCE_PREPARE_UPGRADE                                  = 0x004020ea,
    CLCTL_RESOURCE_UPGRADE_COMPLETED                                = 0x004020ee,
    CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 0x000020f1,
    CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY                         = 0x004020f6,
    CLCTL_REPLICATION_ADD_REPLICATION_GROUP                         = 0x00002142,
    CLCTL_REPLICATION_GET_LOG_INFO                                  = 0x00002145,
    CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS                         = 0x00002149,
    CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS                 = 0x0000214d,
    CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS                 = 0x00002151,
    CLCTL_REPLICATION_GET_REPLICATED_DISKS                          = 0x00002155,
    CLCTL_REPLICATION_GET_REPLICA_VOLUMES                           = 0x00002159,
    CLCTL_REPLICATION_GET_LOG_VOLUME                                = 0x0000215d,
    CLCTL_REPLICATION_GET_RESOURCE_GROUP                            = 0x00002161,
    CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO                 = 0x00002165,
    CLCTL_GET_STATE_CHANGE_TIME                                     = 0x00002d5d,
    CLCTL_SET_CLUSTER_S2D_ENABLED                                   = 0x00402d62,
    CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES              = 0x00402d6e,
    CLCTL_GROUPSET_GET_GROUPS                                       = 0x00002d71,
    CLCTL_GROUPSET_GET_PROVIDER_GROUPS                              = 0x00002d75,
    CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS                           = 0x00002d79,
    CLCTL_GROUP_GET_PROVIDER_GROUPS                                 = 0x00002d7d,
    CLCTL_GROUP_GET_PROVIDER_GROUPSETS                              = 0x00002d81,
    CLCTL_GROUP_SET_CCF_FROM_MASTER                                 = 0x00402d86,
    CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER                            = 0x00002d89,
    CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER                            = 0x00402d8e,
    CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED                        = 0x00402d92,
    CLCTL_SCALEOUT_COMMAND                                          = 0x00402d96,
    CLCTL_SCALEOUT_CONTROL                                          = 0x00402d9a,
    CLCTL_SCALEOUT_GET_CLUSTERS                                     = 0x00402d9d,
    CLCTL_RELOAD_AUTOLOGGER_CONFIG                                  = 0x00002dd2,
    CLCTL_STORAGE_RENAME_SHARED_VOLUME                              = 0x00002dd6,
    CLCTL_STORAGE_RENAME_SHARED_VOLUME_GUID                         = 0x00002dda,
    CLCTL_ENUM_AFFINITY_RULE_NAMES                                  = 0x00002ddd,
    CLCTL_GET_NODES_IN_FD                                           = 0x00002de1,
    CLCTL_FORCE_DB_FLUSH                                            = 0x00402de6,
    CLCTL_DELETE                                                    = 0x00500006,
    CLCTL_INSTALL_NODE                                              = 0x0050000a,
    CLCTL_EVICT_NODE                                                = 0x0050000e,
    CLCTL_ADD_DEPENDENCY                                            = 0x00500012,
    CLCTL_REMOVE_DEPENDENCY                                         = 0x00500016,
    CLCTL_ADD_OWNER                                                 = 0x0050001a,
    CLCTL_REMOVE_OWNER                                              = 0x0050001e,
    CLCTL_SET_NAME                                                  = 0x00500026,
    CLCTL_CLUSTER_NAME_CHANGED                                      = 0x0050002a,
    CLCTL_CLUSTER_VERSION_CHANGED                                   = 0x0050002e,
    CLCTL_FIXUP_ON_UPGRADE                                          = 0x00500032,
    CLCTL_STARTING_PHASE1                                           = 0x00500036,
    CLCTL_STARTING_PHASE2                                           = 0x0050003a,
    CLCTL_HOLD_IO                                                   = 0x0050003e,
    CLCTL_RESUME_IO                                                 = 0x00500042,
    CLCTL_FORCE_QUORUM                                              = 0x00500046,
    CLCTL_INITIALIZE                                                = 0x0050004a,
    CLCTL_STATE_CHANGE_REASON                                       = 0x0050004e,
    CLCTL_PROVIDER_STATE_CHANGE                                     = 0x00500052,
    CLCTL_LEAVING_GROUP                                             = 0x00500056,
    CLCTL_JOINING_GROUP                                             = 0x0050005a,
    CLCTL_FSWITNESS_GET_EPOCH_INFO                                  = 0x0010005d,
    CLCTL_FSWITNESS_SET_EPOCH_INFO                                  = 0x00500062,
    CLCTL_FSWITNESS_RELEASE_LOCK                                    = 0x00500066,
    CLCTL_NETNAME_CREDS_NOTIFYCAM                                   = 0x0050006a,
    CLCTL_NOTIFY_QUORUM_STATUS                                      = 0x0050007e,
    CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN                              = 0x00100081,
    CLCTL_UNDELETE                                                  = 0x00500086,
    CLCTL_GET_OPERATION_CONTEXT                                     = 0x001020e9,
    CLCTL_NOTIFY_OWNER_CHANGE                                       = 0x00502122,
    CLCTL_VALIDATE_CHANGE_GROUP                                     = 0x00102125,
    CLCTL_CHECK_DRAIN_VETO                                          = 0x0010212d,
    CLCTL_NOTIFY_DRAIN_COMPLETE                                     = 0x00102131,
}

alias CLUSCTL_RESOURCE_CODES = int;
enum : int
{
    CLUSCTL_RESOURCE_UNKNOWN                                   = 0x01000000,
    CLUSCTL_RESOURCE_GET_CHARACTERISTICS                       = 0x01000005,
    CLUSCTL_RESOURCE_GET_FLAGS                                 = 0x01000009,
    CLUSCTL_RESOURCE_GET_CLASS_INFO                            = 0x0100000d,
    CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES                 = 0x01000011,
    CLUSCTL_RESOURCE_GET_NAME                                  = 0x01000029,
    CLUSCTL_RESOURCE_GET_ID                                    = 0x01000039,
    CLUSCTL_RESOURCE_GET_RESOURCE_TYPE                         = 0x0100002d,
    CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES                    = 0x01000051,
    CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES                  = 0x01000055,
    CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES                     = 0x01000059,
    CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES                     = 0x0140005e,
    CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES                = 0x01000061,
    CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS                  = 0x01000065,
    CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES                   = 0x01000079,
    CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES                 = 0x0100007d,
    CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES                    = 0x01000081,
    CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES                    = 0x01400086,
    CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES               = 0x01000089,
    CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS                 = 0x0100008d,
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT                   = 0x014000a2,
    CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT                = 0x014000a6,
    CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS                  = 0x010000a9,
    CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT                     = 0x014000ae,
    CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT                  = 0x014000b2,
    CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX                  = 0x014002d6,
    CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS                    = 0x010000b5,
    CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST                  = 0x010000c9,
    CLUSCTL_RESOURCE_GET_NETWORK_NAME                          = 0x01000169,
    CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN          = 0x0100016d,
    CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO                      = 0x0100017a,
    CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFOEX                    = 0x0100031a,
    CLUSCTL_RESOURCE_NETNAME_DELETE_CO                         = 0x0100017e,
    CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO                      = 0x01000181,
    CLUSCTL_RESOURCE_NETNAME_RESET_VCO                         = 0x01000185,
    CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO                        = 0x0100018d,
    CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS              = 0x01000172,
    CLUSCTL_RESOURCE_GET_DNS_NAME                              = 0x01000175,
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO                     = 0x01000191,
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO              = 0x010001a1,
    CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID                     = 0x01000199,
    CLUSCTL_RESOURCE_QUERY_DELETE                              = 0x010001b9,
    CLUSCTL_RESOURCE_UPGRADE_DLL                               = 0x014000ba,
    CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE                     = 0x014001be,
    CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE                   = 0x014001c2,
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT             = 0x014000be,
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT             = 0x014000c2,
    CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE                    = 0x010001e1,
    CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE                      = 0x014001e6,
    CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER                   = 0x014001ea,
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX                  = 0x010001f1,
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2                 = 0x010001f9,
    CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS                   = 0x01000211,
    CLUSCTL_RESOURCE_STORAGE_GET_DIRTY                         = 0x01000219,
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_INFO            = 0x01000225,
    CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE                  = 0x01400296,
    CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO             = 0x0140028a,
    CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO            = 0x0140028e,
    CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE             = 0x0140029a,
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES = 0x0100029d,
    CLUSCTL_RESOURCE_GET_FAILURE_INFO                          = 0x01000019,
    CLUSCTL_RESOURCE_STORAGE_GET_DISKID                        = 0x01000205,
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES          = 0x014002a2,
    CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME                  = 0x010002a5,
    CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED                         = 0x010002b1,
    CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO                       = 0x010002b5,
    CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN             = 0x0100016d,
    CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO                         = 0x0100017a,
    CLUSCTL_RESOURCE_RLUA_SET_PWD_INFOEX                       = 0x0100031a,
    CLUSCTL_RESOURCE_DELETE                                    = 0x01500006,
    CLUSCTL_RESOURCE_UNDELETE                                  = 0x01500086,
    CLUSCTL_RESOURCE_INSTALL_NODE                              = 0x0150000a,
    CLUSCTL_RESOURCE_EVICT_NODE                                = 0x0150000e,
    CLUSCTL_RESOURCE_ADD_DEPENDENCY                            = 0x01500012,
    CLUSCTL_RESOURCE_REMOVE_DEPENDENCY                         = 0x01500016,
    CLUSCTL_RESOURCE_ADD_OWNER                                 = 0x0150001a,
    CLUSCTL_RESOURCE_REMOVE_OWNER                              = 0x0150001e,
    CLUSCTL_RESOURCE_SET_NAME                                  = 0x01500026,
    CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED                      = 0x0150002a,
    CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED                   = 0x0150002e,
    CLUSCTL_RESOURCE_FORCE_QUORUM                              = 0x01500046,
    CLUSCTL_RESOURCE_INITIALIZE                                = 0x0150004a,
    CLUSCTL_RESOURCE_STATE_CHANGE_REASON                       = 0x0150004e,
    CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE                     = 0x01500052,
    CLUSCTL_RESOURCE_LEAVING_GROUP                             = 0x01500056,
    CLUSCTL_RESOURCE_JOINING_GROUP                             = 0x0150005a,
    CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO                  = 0x0110005d,
    CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO                  = 0x01500062,
    CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK                    = 0x01500066,
    CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM                   = 0x0150006a,
    CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT                     = 0x011020e9,
    CLUSCTL_RESOURCE_RW_MODIFY_NOOP                            = 0x014002ae,
    CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS                      = 0x0150007e,
    CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE                       = 0x01502122,
    CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP                     = 0x01102125,
    CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME              = 0x01002dd6,
    CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME_GUID         = 0x01002dda,
    CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN                = 0x014020e6,
    CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY                  = 0x014020f6,
    CLUSCTL_RESOURCE_PREPARE_UPGRADE                           = 0x014020ea,
    CLUSCTL_RESOURCE_UPGRADE_COMPLETED                         = 0x014020ee,
    CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME                     = 0x01002d5d,
    CLUSCTL_RESOURCE_GET_INFRASTRUCTURE_SOFS_BUFFER            = 0x01002d89,
    CLUSCTL_RESOURCE_SET_INFRASTRUCTURE_SOFS_BUFFER            = 0x01402d8e,
    CLUSCTL_RESOURCE_SCALEOUT_COMMAND                          = 0x01402d96,
    CLUSCTL_RESOURCE_SCALEOUT_CONTROL                          = 0x01402d9a,
    CLUSCTL_RESOURCE_SCALEOUT_GET_CLUSTERS                     = 0x01402d9d,
    CLUSCTL_RESOURCE_CHECK_DRAIN_VETO                          = 0x0110212d,
    CLUSCTL_RESOURCE_NOTIFY_DRAIN_COMPLETE                     = 0x01102131,
    CLUSCTL_RESOURCE_GET_NODES_IN_FD                           = 0x01002de1,
}

alias CLUSCTL_RESOURCE_TYPE_CODES = int;
enum : int
{
    CLUSCTL_RESOURCE_TYPE_UNKNOWN                                     = 0x02000000,
    CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS                         = 0x02000005,
    CLUSCTL_RESOURCE_TYPE_GET_FLAGS                                   = 0x02000009,
    CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO                              = 0x0200000d,
    CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES                   = 0x02000011,
    CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT                             = 0x02000015,
    CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES                      = 0x02000051,
    CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES                    = 0x02000055,
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES                       = 0x02000059,
    CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES                  = 0x02000061,
    CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES                       = 0x0240005e,
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS                    = 0x02000065,
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS           = 0x02000069,
    CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES                     = 0x02000079,
    CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES                   = 0x0200007d,
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES                      = 0x02000081,
    CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES                      = 0x02400086,
    CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES                 = 0x02000089,
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS                   = 0x0200008d,
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS          = 0x02000091,
    CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS                    = 0x020000a9,
    CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS                      = 0x020000b5,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS                 = 0x02000195,
    CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB                    = 0x0240019e,
    CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME                    = 0x02000235,
    CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO                      = 0x0240026e,
    CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH                       = 0x02000231,
    CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY                  = 0x02000239,
    CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH                    = 0x02000231,
    CLUSCTL_RESOURCE_TYPE_QUERY_DELETE                                = 0x020001b9,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS                    = 0x020001ed,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX              = 0x020001f5,
    CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER                   = 0x02000201,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID                          = 0x02000205,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID                      = 0x0200022d,
    CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE                      = 0x02000209,
    CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP                 = 0x0240020e,
    CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CSV_FILE                         = 0x01000229,
    CLUSCTL_RESOURCE_TYPE_WITNESS_VALIDATE_PATH                       = 0x02000231,
    CLUSCTL_RESOURCE_TYPE_INSTALL_NODE                                = 0x0250000a,
    CLUSCTL_RESOURCE_TYPE_EVICT_NODE                                  = 0x0250000e,
    CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED                     = 0x0250002e,
    CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE                            = 0x02500032,
    CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1                             = 0x02500036,
    CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2                             = 0x0250003a,
    CLUSCTL_RESOURCE_TYPE_HOLD_IO                                     = 0x0250003e,
    CLUSCTL_RESOURCE_TYPE_RESUME_IO                                   = 0x02500042,
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT         = 0x02001fe1,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS           = 0x02002149,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS   = 0x0200214d,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS   = 0x02002151,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS            = 0x02002155,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES             = 0x02002159,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME                  = 0x0200215d,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP              = 0x02002161,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO   = 0x02002165,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO                    = 0x02002145,
    CLUSCTL_RESOURCE_TYPE_REPLICATION_ADD_REPLICATION_GROUP           = 0x02002142,
    CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS          = 0x020020e1,
    CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 0x020020f1,
    CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE                             = 0x024020ea,
    CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED                           = 0x024020ee,
    CLUSCTL_RESOURCE_TYPE_NOTIFY_MONITOR_SHUTTING_DOWN                = 0x02100081,
    CLUSCTL_RESOURCE_TYPE_CHECK_DRAIN_VETO                            = 0x0210212d,
    CLUSCTL_RESOURCE_TYPE_NOTIFY_DRAIN_COMPLETE                       = 0x02102131,
}

alias CLUSCTL_GROUP_CODES = int;
enum : int
{
    CLUSCTL_GROUP_UNKNOWN                     = 0x03000000,
    CLUSCTL_GROUP_GET_CHARACTERISTICS         = 0x03000005,
    CLUSCTL_GROUP_GET_FLAGS                   = 0x03000009,
    CLUSCTL_GROUP_GET_NAME                    = 0x03000029,
    CLUSCTL_GROUP_GET_ID                      = 0x03000039,
    CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES      = 0x03000051,
    CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES    = 0x03000055,
    CLUSCTL_GROUP_GET_COMMON_PROPERTIES       = 0x03000059,
    CLUSCTL_GROUP_SET_COMMON_PROPERTIES       = 0x0340005e,
    CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES  = 0x03000061,
    CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES     = 0x03000079,
    CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES   = 0x0300007d,
    CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES      = 0x03000081,
    CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES      = 0x03400086,
    CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES = 0x03000089,
    CLUSCTL_GROUP_QUERY_DELETE                = 0x030001b9,
    CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS    = 0x03000065,
    CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS   = 0x0300008d,
    CLUSCTL_GROUP_GET_FAILURE_INFO            = 0x03000019,
    CLUSCTL_GROUP_GET_LAST_MOVE_TIME          = 0x030002d9,
    CLUSCTL_GROUP_SET_CCF_FROM_MASTER         = 0x03402d86,
}

alias CLUSCTL_NODE_CODES = int;
enum : int
{
    CLUSCTL_NODE_UNKNOWN                          = 0x04000000,
    CLUSCTL_NODE_GET_CHARACTERISTICS              = 0x04000005,
    CLUSCTL_NODE_GET_FLAGS                        = 0x04000009,
    CLUSCTL_NODE_GET_NAME                         = 0x04000029,
    CLUSCTL_NODE_GET_ID                           = 0x04000039,
    CLUSCTL_NODE_ENUM_COMMON_PROPERTIES           = 0x04000051,
    CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES         = 0x04000055,
    CLUSCTL_NODE_GET_COMMON_PROPERTIES            = 0x04000059,
    CLUSCTL_NODE_SET_COMMON_PROPERTIES            = 0x0440005e,
    CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES       = 0x04000061,
    CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES          = 0x04000079,
    CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES        = 0x0400007d,
    CLUSCTL_NODE_GET_PRIVATE_PROPERTIES           = 0x04000081,
    CLUSCTL_NODE_SET_PRIVATE_PROPERTIES           = 0x04400086,
    CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES      = 0x04000089,
    CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS         = 0x04000065,
    CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS        = 0x0400008d,
    CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME = 0x04000041,
    CLUSCTL_NODE_GET_STUCK_NODES                  = 0x040002bd,
    CLUSCTL_NODE_INJECT_GEM_FAULT                 = 0x040002c1,
    CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY       = 0x040002c5,
    CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES          = 0x040002c9,
    CLUSCTL_NODE_BLOCK_GEM_SEND_RECV              = 0x040002cd,
    CLUSCTL_NODE_GET_GEMID_VECTOR                 = 0x040002d1,
}

alias CLUSCTL_NETWORK_CODES = int;
enum : int
{
    CLUSCTL_NETWORK_UNKNOWN                     = 0x05000000,
    CLUSCTL_NETWORK_GET_CHARACTERISTICS         = 0x05000005,
    CLUSCTL_NETWORK_GET_FLAGS                   = 0x05000009,
    CLUSCTL_NETWORK_GET_NAME                    = 0x05000029,
    CLUSCTL_NETWORK_GET_ID                      = 0x05000039,
    CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES      = 0x05000051,
    CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES    = 0x05000055,
    CLUSCTL_NETWORK_GET_COMMON_PROPERTIES       = 0x05000059,
    CLUSCTL_NETWORK_SET_COMMON_PROPERTIES       = 0x0540005e,
    CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES  = 0x05000061,
    CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES     = 0x05000079,
    CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES   = 0x0500007d,
    CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES      = 0x05000081,
    CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES      = 0x05400086,
    CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES = 0x05000089,
    CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS    = 0x05000065,
    CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS   = 0x0500008d,
}

alias CLUSCTL_NETINTERFACE_CODES = int;
enum : int
{
    CLUSCTL_NETINTERFACE_UNKNOWN                     = 0x06000000,
    CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS         = 0x06000005,
    CLUSCTL_NETINTERFACE_GET_FLAGS                   = 0x06000009,
    CLUSCTL_NETINTERFACE_GET_NAME                    = 0x06000029,
    CLUSCTL_NETINTERFACE_GET_ID                      = 0x06000039,
    CLUSCTL_NETINTERFACE_GET_NODE                    = 0x06000031,
    CLUSCTL_NETINTERFACE_GET_NETWORK                 = 0x06000035,
    CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES      = 0x06000051,
    CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES    = 0x06000055,
    CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES       = 0x06000059,
    CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES       = 0x0640005e,
    CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES  = 0x06000061,
    CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES     = 0x06000079,
    CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES   = 0x0600007d,
    CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES      = 0x06000081,
    CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES      = 0x06400086,
    CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES = 0x06000089,
    CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS    = 0x06000065,
    CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS   = 0x0600008d,
}

alias CLUSCTL_CLUSTER_CODES = int;
enum : int
{
    CLUSCTL_CLUSTER_UNKNOWN                                      = 0x07000000,
    CLUSCTL_CLUSTER_GET_FQDN                                     = 0x0700003d,
    CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION                    = 0x074002e2,
    CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION                    = 0x070002e5,
    CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES                = 0x070002e9,
    CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES                       = 0x07000051,
    CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES                     = 0x07000055,
    CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES                        = 0x07000059,
    CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES                        = 0x0740005e,
    CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES                   = 0x07000061,
    CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES                      = 0x07000079,
    CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES                    = 0x0700007d,
    CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES                       = 0x07000081,
    CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES                       = 0x07400086,
    CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES                  = 0x07000089,
    CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS                     = 0x07000065,
    CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS                    = 0x0700008d,
    CLUSCTL_CLUSTER_CHECK_VOTER_EVICT                            = 0x07000045,
    CLUSCTL_CLUSTER_CHECK_VOTER_DOWN                             = 0x07000049,
    CLUSCTL_CLUSTER_SHUTDOWN                                     = 0x0700004d,
    CLUSCTL_CLUSTER_BATCH_BLOCK_KEY                              = 0x0700023e,
    CLUSCTL_CLUSTER_BATCH_UNBLOCK_KEY                            = 0x07000241,
    CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID                         = 0x07000291,
    CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP                         = 0x070002a9,
    CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER                           = 0x070002b9,
    CLUSCTL_CLUSTER_REMOVE_NODE                                  = 0x074002ee,
    CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS                           = 0x074000f2,
    CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO                   = 0x07400306,
    CLUSCTL_CLUSTER_SET_DNS_DOMAIN                               = 0x0740030a,
    CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED                      = 0x07402d62,
    CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES = 0x07402d6e,
    CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME                 = 0x07002dd6,
    CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME_GUID            = 0x07002dda,
    CLUSCTL_CLUSTER_RELOAD_AUTOLOGGER_CONFIG                     = 0x07002dd2,
    CLUSCTL_CLUSTER_ENUM_AFFINITY_RULE_NAMES                     = 0x07002ddd,
    CLUSCTL_CLUSTER_GET_NODES_IN_FD                              = 0x07002de1,
    CLUSCTL_CLUSTER_FORCE_FLUSH_DB                               = 0x07402de6,
    CLUSCTL_CLUSTER_GET_CLMUSR_TOKEN                             = 0x0700016d,
    CLUSCTL_CLUSTER_CHECK_VOTER_EVICT_WITNESS                    = 0x0700006d,
    CLUSCTL_CLUSTER_CHECK_VOTER_DOWN_WITNESS                     = 0x07000071,
}

alias CLUSCTL_GROUPSET_CODES = int;
enum : int
{
    CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES    = 0x08000059,
    CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES = 0x08000055,
    CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES    = 0x0840005e,
    CLUSCTL_GROUPSET_GET_GROUPS               = 0x08002d71,
    CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS      = 0x08002d75,
    CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS   = 0x08002d79,
    CLUSCTL_GROUP_GET_PROVIDER_GROUPS         = 0x08002d7d,
    CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS      = 0x08002d81,
    CLUSCTL_GROUPSET_GET_ID                   = 0x08000039,
}

alias CLUSCTL_AFFINITYRULE_CODES = int;
enum : int
{
    CLUSCTL_AFFINITYRULE_GET_COMMON_PROPERTIES    = 0x09000059,
    CLUSCTL_AFFINITYRULE_GET_RO_COMMON_PROPERTIES = 0x09000055,
    CLUSCTL_AFFINITYRULE_SET_COMMON_PROPERTIES    = 0x0940005e,
    CLUSCTL_AFFINITYRULE_GET_ID                   = 0x09000039,
    CLUSCTL_AFFINITYRULE_GET_GROUPNAMES           = 0x09002d71,
}

alias CLUSTER_RESOURCE_CLASS = int;
enum : int
{
    CLUS_RESCLASS_UNKNOWN = 0x00000000,
    CLUS_RESCLASS_STORAGE = 0x00000001,
    CLUS_RESCLASS_NETWORK = 0x00000002,
    CLUS_RESCLASS_USER    = 0x00008000,
}

alias CLUS_RESSUBCLASS = int;
enum : int
{
    CLUS_RESSUBCLASS_SHARED = 0x80000000,
}

alias CLUS_RESSUBCLASS_STORAGE = int;
enum : int
{
    CLUS_RESSUBCLASS_STORAGE_SHARED_BUS  = 0x80000000,
    CLUS_RESSUBCLASS_STORAGE_DISK        = 0x40000000,
    CLUS_RESSUBCLASS_STORAGE_REPLICATION = 0x10000000,
}

alias CLUS_RESSUBCLASS_NETWORK = int;
enum : int
{
    CLUS_RESSUBCLASS_NETWORK_INTERNET_PROTOCOL = 0x80000000,
}

alias CLUS_CHARACTERISTICS = int;
enum : int
{
    CLUS_CHAR_UNKNOWN                        = 0x00000000,
    CLUS_CHAR_QUORUM                         = 0x00000001,
    CLUS_CHAR_DELETE_REQUIRES_ALL_NODES      = 0x00000002,
    CLUS_CHAR_LOCAL_QUORUM                   = 0x00000004,
    CLUS_CHAR_LOCAL_QUORUM_DEBUG             = 0x00000008,
    CLUS_CHAR_REQUIRES_STATE_CHANGE_REASON   = 0x00000010,
    CLUS_CHAR_BROADCAST_DELETE               = 0x00000020,
    CLUS_CHAR_SINGLE_CLUSTER_INSTANCE        = 0x00000040,
    CLUS_CHAR_SINGLE_GROUP_INSTANCE          = 0x00000080,
    CLUS_CHAR_COEXIST_IN_SHARED_VOLUME_GROUP = 0x00000100,
    CLUS_CHAR_PLACEMENT_DATA                 = 0x00000200,
    CLUS_CHAR_MONITOR_DETACH                 = 0x00000400,
    CLUS_CHAR_MONITOR_REATTACH               = 0x00000800,
    CLUS_CHAR_OPERATION_CONTEXT              = 0x00001000,
    CLUS_CHAR_CLONES                         = 0x00002000,
    CLUS_CHAR_NOT_PREEMPTABLE                = 0x00004000,
    CLUS_CHAR_NOTIFY_NEW_OWNER               = 0x00008000,
    CLUS_CHAR_SUPPORTS_UNMONITORED_STATE     = 0x00010000,
    CLUS_CHAR_INFRASTRUCTURE                 = 0x00020000,
    CLUS_CHAR_VETO_DRAIN                     = 0x00040000,
    CLUS_CHAR_DRAIN_LOCAL_OFFLINE            = 0x00080000,
}

alias CLUS_FLAGS = int;
enum : int
{
    CLUS_FLAG_CORE = 0x00000001,
}

union CLUSPROP_SYNTAX
{
    uint dw;
    struct
    {
        ushort wFormat;
        ushort wType;
    }
}
struct CLUSPROP_VALUE
{
    CLUSPROP_SYNTAX Syntax;
    uint cbLength;
}
struct CLUSPROP_BINARY
{
    CLUSPROP_VALUE Base;
    ubyte[1] rgb;
}
struct CLUSPROP_WORD
{
    CLUSPROP_VALUE Base;
    ushort w;
}
struct CLUSPROP_DWORD
{
    CLUSPROP_VALUE Base;
    uint dw;
}
struct CLUSPROP_LONG
{
    CLUSPROP_VALUE Base;
    int l;
}
struct CLUSPROP_SZ
{
    CLUSPROP_VALUE Base;
    wchar[1] sz;
}
struct CLUSPROP_ULARGE_INTEGER
{
    CLUSPROP_VALUE Base;
    ulong li;
}
struct CLUSPROP_LARGE_INTEGER
{
    CLUSPROP_VALUE Base;
    long li;
}
struct CLUSPROP_SECURITY_DESCRIPTOR
{
    CLUSPROP_VALUE Base;
    union
    {
        SECURITY_DESCRIPTOR_RELATIVE sd;
        ubyte[1] rgbSecurityDescriptor;
    }
}
struct CLUSPROP_FILETIME
{
    CLUSPROP_VALUE Base;
    FILETIME ft;
}
struct CLUS_RESOURCE_CLASS_INFO
{
    union
    {
        struct
        {
            union
            {
                uint dw;
                CLUSTER_RESOURCE_CLASS rc;
            }
            uint SubClass;
        }
        ulong li;
    }
}
struct CLUSPROP_RESOURCE_CLASS
{
    CLUSPROP_VALUE Base;
    CLUSTER_RESOURCE_CLASS rc;
}
union CLUSPROP_REQUIRED_DEPENDENCY
{
    CLUSPROP_VALUE Value;
    CLUSPROP_RESOURCE_CLASS ResClass;
    CLUSPROP_SZ ResTypeName;
}
alias CLUSPROP_PIFLAGS = int;
enum : int
{
    CLUSPROP_PIFLAG_STICKY             = 0x00000001,
    CLUSPROP_PIFLAG_REMOVABLE          = 0x00000002,
    CLUSPROP_PIFLAG_USABLE             = 0x00000004,
    CLUSPROP_PIFLAG_DEFAULT_QUORUM     = 0x00000008,
    CLUSPROP_PIFLAG_USABLE_FOR_CSV     = 0x00000010,
    CLUSPROP_PIFLAG_ENCRYPTION_ENABLED = 0x00000020,
    CLUSPROP_PIFLAG_RAW                = 0x00000040,
    CLUSPROP_PIFLAG_UNKNOWN            = 0x80000000,
}

struct CLUS_FORCE_QUORUM_INFO
{
    uint dwSize;
    uint dwNodeBitMask;
    uint dwMaxNumberofNodes;
    wchar[1] multiszNodeList;
}
struct CLUS_PARTITION_INFO
{
    uint dwFlags;
    wchar[260] szDeviceName;
    wchar[260] szVolumeLabel;
    uint dwSerialNumber;
    uint rgdwMaximumComponentLength;
    uint dwFileSystemFlags;
    wchar[32] szFileSystem;
}
struct CLUS_PARTITION_INFO_EX
{
    uint dwFlags;
    wchar[260] szDeviceName;
    wchar[260] szVolumeLabel;
    uint dwSerialNumber;
    uint rgdwMaximumComponentLength;
    uint dwFileSystemFlags;
    wchar[32] szFileSystem;
    ulong TotalSizeInBytes;
    ulong FreeSizeInBytes;
    uint DeviceNumber;
    uint PartitionNumber;
    GUID VolumeGuid;
}
struct CLUS_PARTITION_INFO_EX2
{
    GUID GptPartitionId;
    wchar[260] szPartitionName;
    uint EncryptionFlags;
}
alias CLUSTER_CSV_VOLUME_FAULT_STATE = int;
enum : int
{
    VolumeStateNoFaults      = 0x00000000,
    VolumeStateNoDirectIO    = 0x00000001,
    VolumeStateNoAccess      = 0x00000002,
    VolumeStateInMaintenance = 0x00000004,
    VolumeStateDismounted    = 0x00000008,
}

alias CLUSTER_SHARED_VOLUME_BACKUP_STATE = int;
enum : int
{
    VolumeBackupNone       = 0x00000000,
    VolumeBackupInProgress = 0x00000001,
}

struct CLUS_CSV_VOLUME_INFO
{
    ulong VolumeOffset;
    uint PartitionNumber;
    CLUSTER_CSV_VOLUME_FAULT_STATE FaultState;
    CLUSTER_SHARED_VOLUME_BACKUP_STATE BackupState;
    wchar[260] szVolumeFriendlyName;
    wchar[50] szVolumeName;
}
struct CLUS_CSV_VOLUME_NAME
{
    long VolumeOffset;
    wchar[260] szVolumeName;
    wchar[263] szRootPath;
}
alias CLUSTER_SHARED_VOLUME_STATE = int;
enum : int
{
    SharedVolumeStateUnavailable            = 0x00000000,
    SharedVolumeStatePaused                 = 0x00000001,
    SharedVolumeStateActive                 = 0x00000002,
    SharedVolumeStateActiveRedirected       = 0x00000003,
    SharedVolumeStateActiveVolumeRedirected = 0x00000004,
}

struct CLUSTER_SHARED_VOLUME_STATE_INFO
{
    wchar[260] szVolumeName;
    wchar[260] szNodeName;
    CLUSTER_SHARED_VOLUME_STATE VolumeState;
}
struct CLUSTER_SHARED_VOLUME_STATE_INFO_EX
{
    wchar[260] szVolumeName;
    wchar[260] szNodeName;
    CLUSTER_SHARED_VOLUME_STATE VolumeState;
    wchar[260] szVolumeFriendlyName;
    ulong RedirectedIOReason;
    ulong VolumeRedirectedIOReason;
}
alias CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE = int;
enum : int
{
    ClusterSharedVolumeRenameInputTypeNone         = 0x00000000,
    ClusterSharedVolumeRenameInputTypeVolumeOffset = 0x00000001,
    ClusterSharedVolumeRenameInputTypeVolumeId     = 0x00000002,
    ClusterSharedVolumeRenameInputTypeVolumeName   = 0x00000003,
    ClusterSharedVolumeRenameInputTypeVolumeGuid   = 0x00000004,
}

struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME
{
    CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE InputType;
    union
    {
        ulong VolumeOffset;
        wchar[260] VolumeId;
        wchar[260] VolumeName;
        wchar[50] VolumeGuid;
    }
}
struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME
{
    wchar[260] NewVolumeName;
}
struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME
{
    wchar[260] NewVolumeName;
    wchar[50] NewVolumeGuid;
}
struct CLUS_CHKDSK_INFO
{
    uint PartitionNumber;
    uint ChkdskState;
    uint FileIdCount;
    ulong[1] FileIdList;
}
struct CLUS_DISK_NUMBER_INFO
{
    uint DiskNumber;
    uint BytesPerSector;
}
struct CLUS_SHARED_VOLUME_BACKUP_MODE
{
    CLUSTER_SHARED_VOLUME_BACKUP_STATE BackupState;
    uint DelayTimerInSecs;
    wchar[260] VolumeName;
}
struct CLUS_FTSET_INFO
{
    uint dwRootSignature;
    uint dwFtType;
}
struct CLUS_SCSI_ADDRESS
{
    union
    {
        struct
        {
            ubyte PortNumber;
            ubyte PathId;
            ubyte TargetId;
            ubyte Lun;
        }
        uint dw;
    }
}
struct CLUS_NETNAME_VS_TOKEN_INFO
{
    uint ProcessID;
    uint DesiredAccess;
    BOOL InheritHandle;
}
struct CLUS_NETNAME_PWD_INFO
{
    uint Flags;
    wchar[16] Password;
    wchar[258] CreatingDC;
    wchar[64] ObjectGuid;
}
struct CLUS_NETNAME_PWD_INFOEX
{
    uint Flags;
    wchar[128] Password;
    wchar[258] CreatingDC;
    wchar[64] ObjectGuid;
}
struct CLUS_DNN_LEADER_STATUS
{
    BOOL IsOnline;
    BOOL IsFileServerPresent;
}
struct CLUS_DNN_SODAFS_CLONE_STATUS
{
    uint NodeId;
    CLUSTER_RESOURCE_STATE Status;
}
struct CLUS_NETNAME_IP_INFO_ENTRY
{
    uint NodeId;
    uint AddressSize;
    ubyte[1] Address;
}
struct CLUS_NETNAME_IP_INFO_FOR_MULTICHANNEL
{
    wchar[64] szName;
    uint NumEntries;
    CLUS_NETNAME_IP_INFO_ENTRY[1] IpInfo;
}
struct CLUS_MAINTENANCE_MODE_INFO
{
    BOOL InMaintenance;
}
struct CLUS_CSV_MAINTENANCE_MODE_INFO
{
    BOOL InMaintenance;
    wchar[260] VolumeName;
}
alias MAINTENANCE_MODE_TYPE_ENUM = int;
enum : int
{
    MaintenanceModeTypeDisableIsAliveCheck = 0x00000001,
    MaintenanceModeTypeOfflineResource     = 0x00000002,
    MaintenanceModeTypeUnclusterResource   = 0x00000003,
}

struct CLUS_MAINTENANCE_MODE_INFOEX
{
    BOOL InMaintenance;
    MAINTENANCE_MODE_TYPE_ENUM MaintainenceModeType;
    CLUSTER_RESOURCE_STATE InternalState;
    uint Signature;
}
struct CLUS_SET_MAINTENANCE_MODE_INPUT
{
    BOOL InMaintenance;
    uint ExtraParameterSize;
    ubyte[1] ExtraParameter;
}
struct CLUS_STORAGE_SET_DRIVELETTER
{
    uint PartitionNumber;
    uint DriveLetterMask;
}
struct CLUS_STORAGE_GET_AVAILABLE_DRIVELETTERS
{
    uint AvailDrivelettersMask;
}
struct CLUS_STORAGE_REMAP_DRIVELETTER
{
    uint CurrentDriveLetterMask;
    uint TargetDriveLetterMask;
}
struct CLUS_PROVIDER_STATE_CHANGE_INFO
{
    uint dwSize;
    CLUSTER_RESOURCE_STATE resourceState;
    wchar[1] szProviderId;
}
struct CLUS_CREATE_INFRASTRUCTURE_FILESERVER_INPUT
{
    wchar[16] FileServerName;
}
struct CLUS_CREATE_INFRASTRUCTURE_FILESERVER_OUTPUT
{
    wchar[260] FileServerName;
}
struct CLUSPROP_LIST
{
    uint nPropertyCount;
    CLUSPROP_SZ PropertyName;
}
alias CLUSPROP_IPADDR_ENABLENETBIOS = int;
enum : int
{
    CLUSPROP_IPADDR_ENABLENETBIOS_DISABLED  = 0x00000000,
    CLUSPROP_IPADDR_ENABLENETBIOS_ENABLED   = 0x00000001,
    CLUSPROP_IPADDR_ENABLENETBIOS_TRACK_NIC = 0x00000002,
}

alias FILESHARE_CHANGE_ENUM = int;
enum : int
{
    FILESHARE_CHANGE_NONE   = 0x00000000,
    FILESHARE_CHANGE_ADD    = 0x00000001,
    FILESHARE_CHANGE_DEL    = 0x00000002,
    FILESHARE_CHANGE_MODIFY = 0x00000003,
}

struct FILESHARE_CHANGE
{
    FILESHARE_CHANGE_ENUM Change;
    wchar[84] ShareName;
}
struct FILESHARE_CHANGE_LIST
{
    uint NumEntries;
    FILESHARE_CHANGE[1] ChangeEntry;
}
struct CLUSCTL_GROUP_GET_LAST_MOVE_TIME_OUTPUT
{
    ulong GetTickCount64;
    SYSTEMTIME GetSystemTime;
    uint NodeId;
}
union CLUSPROP_BUFFER_HELPER
{
    ubyte* pb;
    ushort* pw;
    uint* pdw;
    int* pl;
    PWSTR psz;
    CLUSPROP_LIST* pList;
    CLUSPROP_SYNTAX* pSyntax;
    CLUSPROP_SZ* pName;
    CLUSPROP_VALUE* pValue;
    CLUSPROP_BINARY* pBinaryValue;
    CLUSPROP_WORD* pWordValue;
    CLUSPROP_DWORD* pDwordValue;
    CLUSPROP_LONG* pLongValue;
    CLUSPROP_ULARGE_INTEGER* pULargeIntegerValue;
    CLUSPROP_LARGE_INTEGER* pLargeIntegerValue;
    CLUSPROP_SZ* pStringValue;
    CLUSPROP_SZ* pMultiSzValue;
    CLUSPROP_SECURITY_DESCRIPTOR* pSecurityDescriptor;
    CLUSPROP_RESOURCE_CLASS* pResourceClassValue;
    CLUSPROP_RESOURCE_CLASS_INFO* pResourceClassInfoValue;
    CLUSPROP_DWORD* pDiskSignatureValue;
    CLUSPROP_SCSI_ADDRESS* pScsiAddressValue;
    CLUSPROP_DWORD* pDiskNumberValue;
    CLUSPROP_PARTITION_INFO* pPartitionInfoValue;
    CLUSPROP_REQUIRED_DEPENDENCY* pRequiredDependencyValue;
    CLUSPROP_PARTITION_INFO_EX* pPartitionInfoValueEx;
    CLUSPROP_PARTITION_INFO_EX2* pPartitionInfoValueEx2;
    CLUSPROP_FILETIME* pFileTimeValue;
}
alias CLUSTER_RESOURCE_ENUM = int;
enum : int
{
    CLUSTER_RESOURCE_ENUM_DEPENDS  = 0x00000001,
    CLUSTER_RESOURCE_ENUM_PROVIDES = 0x00000002,
    CLUSTER_RESOURCE_ENUM_NODES    = 0x00000004,
    CLUSTER_RESOURCE_ENUM_ALL      = 0x00000007,
}

alias CLUSTER_RESOURCE_TYPE_ENUM = int;
enum : int
{
    CLUSTER_RESOURCE_TYPE_ENUM_NODES     = 0x00000001,
    CLUSTER_RESOURCE_TYPE_ENUM_RESOURCES = 0x00000002,
    CLUSTER_RESOURCE_TYPE_ENUM_ALL       = 0x00000003,
}

alias PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM = HRESENUM function(HRESOURCE, uint);
alias PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT = uint function(HRESENUM);
alias PCLUSAPI_CLUSTER_RESOURCE_ENUM = uint function(HRESENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM = uint function(HRESENUM);
alias PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE = uint function(HCLUSTER, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
alias PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE = uint function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX = uint function(HCLUSTER, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, const(wchar)*);
alias PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX = uint function(HCLUSTER, const(wchar)*, const(wchar)*);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM = HRESTYPEENUM function(HCLUSTER, const(wchar)*, uint);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT = uint function(HRESTYPEENUM);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_ENUM = uint function(HRESTYPEENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CLOSE_ENUM = uint function(HRESTYPEENUM);
alias CLUSTER_NETWORK_ENUM = int;
enum : int
{
    CLUSTER_NETWORK_ENUM_NETINTERFACES = 0x00000001,
    CLUSTER_NETWORK_ENUM_ALL           = 0x00000001,
}

alias CLUSTER_NETWORK_STATE = int;
enum : int
{
    ClusterNetworkStateUnknown = 0xffffffff,
    ClusterNetworkUnavailable  = 0x00000000,
    ClusterNetworkDown         = 0x00000001,
    ClusterNetworkPartitioned  = 0x00000002,
    ClusterNetworkUp           = 0x00000003,
}

alias CLUSTER_NETWORK_ROLE = int;
enum : int
{
    ClusterNetworkRoleNone              = 0x00000000,
    ClusterNetworkRoleInternalUse       = 0x00000001,
    ClusterNetworkRoleClientAccess      = 0x00000002,
    ClusterNetworkRoleInternalAndClient = 0x00000003,
}

alias PCLUSAPI_OPEN_CLUSTER_NETWORK = HNETWORK function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_NETWORK_EX = HNETWORK function(HCLUSTER, const(wchar)*, uint, uint*);
alias PCLUSAPI_CLOSE_CLUSTER_NETWORK = BOOL function(HNETWORK);
alias PCLUSAPI_GET_CLUSTER_FROM_NETWORK = HCLUSTER function(HNETWORK);
alias PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM = HNETWORKENUM function(HNETWORK, uint);
alias PCLUSAPI_CLUSTER_NETWORK_GET_ENUM_COUNT = uint function(HNETWORKENUM);
alias PCLUSAPI_CLUSTER_NETWORK_ENUM = uint function(HNETWORKENUM, uint, uint*, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_NETWORK_CLOSE_ENUM = uint function(HNETWORKENUM);
alias PCLUSAPI_GET_CLUSTER_NETWORK_STATE = CLUSTER_NETWORK_STATE function(HNETWORK);
alias PCLUSAPI_SET_CLUSTER_NETWORK_NAME = uint function(HNETWORK, const(wchar)*);
alias PCLUSAPI_SET_CLUSTER_NETWORK_NAME_EX = uint function(HNETWORK, const(wchar)*, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_NETWORK_ID = uint function(HNETWORK, PWSTR, uint*);
alias PCLUSAPI_CLUSTER_NETWORK_CONTROL = uint function(HNETWORK, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_NETWORK_CONTROL_EX = uint function(HNETWORK, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias CLUSTER_NETINTERFACE_STATE = int;
enum : int
{
    ClusterNetInterfaceStateUnknown = 0xffffffff,
    ClusterNetInterfaceUnavailable  = 0x00000000,
    ClusterNetInterfaceFailed       = 0x00000001,
    ClusterNetInterfaceUnreachable  = 0x00000002,
    ClusterNetInterfaceUp           = 0x00000003,
}

alias PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE = HNETINTERFACE function(HCLUSTER, const(wchar)*);
alias PCLUSAPI_OPEN_CLUSTER_NETINTERFACE_EX = HNETINTERFACE function(HCLUSTER, const(wchar)*, uint, uint*);
alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE = uint function(HCLUSTER, const(wchar)*, const(wchar)*, PWSTR, uint*);
alias PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE = BOOL function(HNETINTERFACE);
alias PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE = HCLUSTER function(HNETINTERFACE);
alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE = CLUSTER_NETINTERFACE_STATE function(HNETINTERFACE);
alias PCLUSAPI_CLUSTER_NET_INTERFACE_CONTROL = uint function(HNETINTERFACE, HNODE, uint, void*, uint, void*, uint, uint*);
alias PCLUSAPI_CLUSTER_NET_INTERFACE_CONTROL_EX = uint function(HNETINTERFACE, HNODE, uint, void*, uint, void*, uint, uint*, const(wchar)*);
alias PCLUSAPI_GET_CLUSTER_KEY = HKEY function(HCLUSTER, uint);
alias PCLUSAPI_GET_CLUSTER_GROUP_KEY = HKEY function(HGROUP, uint);
alias PCLUSAPI_GET_CLUSTER_RESOURCE_KEY = HKEY function(HRESOURCE, uint);
alias PCLUSAPI_GET_CLUSTER_NODE_KEY = HKEY function(HNODE, uint);
alias PCLUSAPI_GET_CLUSTER_NETWORK_KEY = HKEY function(HNETWORK, uint);
alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY = HKEY function(HNETINTERFACE, uint);
alias PCLUSAPI_CLUSTER_REG_CREATE_KEY = int function(HKEY, const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, HKEY*, uint*);
alias PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX = int function(HKEY, const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, HKEY*, uint*, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_OPEN_KEY = int function(HKEY, const(wchar)*, uint, HKEY*);
alias PCLUSAPI_CLUSTER_REG_DELETE_KEY = int function(HKEY, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX = int function(HKEY, const(wchar)*, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_CLOSE_KEY = int function(HKEY);
alias PCLUSAPI_CLUSTER_REG_ENUM_KEY = int function(HKEY, uint, PWSTR, uint*, FILETIME*);
alias PCLUSAPI_CLUSTER_REG_SET_VALUE = uint function(HKEY, const(wchar)*, uint, const(ubyte)*, uint);
alias PCLUSAPI_CLUSTER_REG_DELETE_VALUE = uint function(HKEY, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_SET_VALUE_EX = uint function(HKEY, const(wchar)*, uint, const(ubyte)*, uint, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_DELETE_VALUE_EX = uint function(HKEY, const(wchar)*, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_QUERY_VALUE = int function(HKEY, const(wchar)*, uint*, ubyte*, uint*);
alias PCLUSAPI_CLUSTER_REG_ENUM_VALUE = uint function(HKEY, uint, PWSTR, uint*, uint*, ubyte*, uint*);
alias PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY = int function(HKEY, uint*, uint*, uint*, uint*, uint*, uint*, FILETIME*);
alias PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY = int function(HKEY, uint, PSECURITY_DESCRIPTOR, uint*);
alias PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY = int function(HKEY, uint, PSECURITY_DESCRIPTOR);
alias PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX = int function(HKEY, uint, PSECURITY_DESCRIPTOR, const(wchar)*);
alias PCLUSAPI_CLUSTER_REG_SYNC_DATABASE = int function(HCLUSTER, uint);
alias PCLUSAPI_CLUSTER_REG_CREATE_BATCH = int function(HKEY, HREGBATCH*);
alias PCLUSTER_REG_BATCH_ADD_COMMAND = int function(HREGBATCH, CLUSTER_REG_COMMAND, PWSTR, uint, const(void)*, uint);
alias PCLUSTER_REG_CLOSE_BATCH = int function(HREGBATCH, BOOL, int*);
alias PCLUSTER_REG_BATCH_READ_COMMAND = int function(HREGBATCHNOTIFICATION, CLUSTER_BATCH_COMMAND*);
alias PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION = int function(HREGBATCHNOTIFICATION);
alias PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT = int function(HKEY, HREGBATCHPORT*);
alias PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT = int function(HREGBATCHPORT);
alias PCLUSTER_REG_GET_BATCH_NOTIFICATION = int function(HREGBATCHPORT, HREGBATCHNOTIFICATION*);
alias PCLUSTER_REG_CREATE_READ_BATCH = int function(HKEY, HREGREADBATCH*);
alias PCLUSTER_REG_READ_BATCH_ADD_COMMAND = int function(HREGREADBATCH, const(wchar)*, const(wchar)*);
alias PCLUSTER_REG_CLOSE_READ_BATCH = int function(HREGREADBATCH, HREGREADBATCHREPLY*);
alias PCLUSTER_REG_CLOSE_READ_BATCH_EX = int function(HREGREADBATCH, uint, HREGREADBATCHREPLY*);
alias PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND = int function(HREGREADBATCHREPLY, CLUSTER_READ_BATCH_COMMAND*);
alias PCLUSTER_REG_CLOSE_READ_BATCH_REPLY = int function(HREGREADBATCHREPLY);
alias PCLUSTER_SET_ACCOUNT_ACCESS = uint function(HCLUSTER, const(wchar)*, uint, uint);
alias CLUSTER_SETUP_PHASE = int;
enum : int
{
    ClusterSetupPhaseInitialize                 = 0x00000001,
    ClusterSetupPhaseValidateNodeState          = 0x00000064,
    ClusterSetupPhaseValidateNetft              = 0x00000066,
    ClusterSetupPhaseValidateClusDisk           = 0x00000067,
    ClusterSetupPhaseConfigureClusSvc           = 0x00000068,
    ClusterSetupPhaseStartingClusSvc            = 0x00000069,
    ClusterSetupPhaseQueryClusterNameAccount    = 0x0000006a,
    ClusterSetupPhaseValidateClusterNameAccount = 0x0000006b,
    ClusterSetupPhaseCreateClusterAccount       = 0x0000006c,
    ClusterSetupPhaseConfigureClusterAccount    = 0x0000006d,
    ClusterSetupPhaseFormingCluster             = 0x000000c8,
    ClusterSetupPhaseAddClusterProperties       = 0x000000c9,
    ClusterSetupPhaseCreateResourceTypes        = 0x000000ca,
    ClusterSetupPhaseCreateGroups               = 0x000000cb,
    ClusterSetupPhaseCreateIPAddressResources   = 0x000000cc,
    ClusterSetupPhaseCreateNetworkName          = 0x000000cd,
    ClusterSetupPhaseClusterGroupOnline         = 0x000000ce,
    ClusterSetupPhaseGettingCurrentMembership   = 0x0000012c,
    ClusterSetupPhaseAddNodeToCluster           = 0x0000012d,
    ClusterSetupPhaseNodeUp                     = 0x0000012e,
    ClusterSetupPhaseMoveGroup                  = 0x00000190,
    ClusterSetupPhaseDeleteGroup                = 0x00000191,
    ClusterSetupPhaseCleanupCOs                 = 0x00000192,
    ClusterSetupPhaseOfflineGroup               = 0x00000193,
    ClusterSetupPhaseEvictNode                  = 0x00000194,
    ClusterSetupPhaseCleanupNode                = 0x00000195,
    ClusterSetupPhaseCoreGroupCleanup           = 0x00000196,
    ClusterSetupPhaseFailureCleanup             = 0x000003e7,
}

alias CLUSTER_SETUP_PHASE_TYPE = int;
enum : int
{
    ClusterSetupPhaseStart    = 0x00000001,
    ClusterSetupPhaseContinue = 0x00000002,
    ClusterSetupPhaseEnd      = 0x00000003,
    ClusterSetupPhaseReport   = 0x00000004,
}

alias CLUSTER_SETUP_PHASE_SEVERITY = int;
enum : int
{
    ClusterSetupPhaseInformational = 0x00000001,
    ClusterSetupPhaseWarning       = 0x00000002,
    ClusterSetupPhaseFatal         = 0x00000003,
}

alias PCLUSTER_SETUP_PROGRESS_CALLBACK = BOOL function(void*, CLUSTER_SETUP_PHASE, CLUSTER_SETUP_PHASE_TYPE, CLUSTER_SETUP_PHASE_SEVERITY, uint, const(wchar)*, uint);
alias PCLUSAPI_CREATE_CLUSTER = HCLUSTER function(CREATE_CLUSTER_CONFIG*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
alias PCLUSAPI_CREATE_CLUSTER_CNOLESS = HCLUSTER function(CREATE_CLUSTER_CONFIG*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
alias PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT = uint function(HCLUSTER, CREATE_CLUSTER_NAME_ACCOUNT*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
alias PCLUSAPI_REMOVE_CLUSTER_NAME_ACCOUNT = uint function(HCLUSTER);
alias PCLUSAPI_ADD_CLUSTER_NODE = HNODE function(HCLUSTER, const(wchar)*, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
alias PCLUSAPI_ADD_CLUSTER_NODE_EX = HNODE function(HCLUSTER, const(wchar)*, uint, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*);
alias PCLUSAPI_DESTROY_CLUSTER = uint function(HCLUSTER, PCLUSTER_SETUP_PROGRESS_CALLBACK, void*, BOOL);
alias PLACEMENT_OPTIONS = int;
enum : int
{
    PLACEMENT_OPTIONS_MIN_VALUE                                                   = 0x00000000,
    PLACEMENT_OPTIONS_DEFAULT_PLACEMENT_OPTIONS                                   = 0x00000000,
    PLACEMENT_OPTIONS_DISABLE_CSV_VM_DEPENDENCY                                   = 0x00000001,
    PLACEMENT_OPTIONS_CONSIDER_OFFLINE_VMS                                        = 0x00000002,
    PLACEMENT_OPTIONS_DONT_USE_MEMORY                                             = 0x00000004,
    PLACEMENT_OPTIONS_DONT_USE_CPU                                                = 0x00000008,
    PLACEMENT_OPTIONS_DONT_USE_LOCAL_TEMP_DISK                                    = 0x00000010,
    PLACEMENT_OPTIONS_DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK                     = 0x00000020,
    PLACEMENT_OPTIONS_SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE                 = 0x00000040,
    PLACEMENT_OPTIONS_DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK     = 0x00000080,
    PLACEMENT_OPTIONS_SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE = 0x00000100,
    PLACEMENT_OPTIONS_AVAILABILITY_SET_DOMAIN_AFFINITY                            = 0x00000200,
    PLACEMENT_OPTIONS_ALL                                                         = 0x000003ff,
}

alias GRP_PLACEMENT_OPTIONS = int;
enum : int
{
    GRP_PLACEMENT_OPTIONS_MIN_VALUE             = 0x00000000,
    GRP_PLACEMENT_OPTIONS_DEFAULT               = 0x00000000,
    GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING = 0x00000001,
    GRP_PLACEMENT_OPTIONS_ALL                   = 0x00000001,
}

struct SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO
{
    ulong PartitionOffset;
    uint Capabilities;
}
struct SR_RESOURCE_TYPE_REPLICATED_PARTITION_ARRAY
{
    uint Count;
    SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO[1] PartitionArray;
}
alias SR_REPLICATED_DISK_TYPE = int;
enum : int
{
    SrReplicatedDiskTypeNone                = 0x00000000,
    SrReplicatedDiskTypeSource              = 0x00000001,
    SrReplicatedDiskTypeLogSource           = 0x00000002,
    SrReplicatedDiskTypeDestination         = 0x00000003,
    SrReplicatedDiskTypeLogDestination      = 0x00000004,
    SrReplicatedDiskTypeNotInParthership    = 0x00000005,
    SrReplicatedDiskTypeLogNotInParthership = 0x00000006,
    SrReplicatedDiskTypeOther               = 0x00000007,
}

alias SR_DISK_REPLICATION_ELIGIBLE = int;
enum : int
{
    SrDiskReplicationEligibleNone                    = 0x00000000,
    SrDiskReplicationEligibleYes                     = 0x00000001,
    SrDiskReplicationEligibleOffline                 = 0x00000002,
    SrDiskReplicationEligibleNotGpt                  = 0x00000003,
    SrDiskReplicationEligiblePartitionLayoutMismatch = 0x00000004,
    SrDiskReplicationEligibleInsufficientFreeSpace   = 0x00000005,
    SrDiskReplicationEligibleNotInSameSite           = 0x00000006,
    SrDiskReplicationEligibleInSameSite              = 0x00000007,
    SrDiskReplicationEligibleFileSystemNotSupported  = 0x00000008,
    SrDiskReplicationEligibleAlreadyInReplication    = 0x00000009,
    SrDiskReplicationEligibleSameAsSpecifiedDisk     = 0x0000000a,
    SrDiskReplicationEligibleOther                   = 0x0000270f,
}

struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_LOGDISKS
{
    GUID DataDiskGuid;
    BOOLEAN IncludeOfflineDisks;
}
struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_TARGET_DATADISKS
{
    GUID SourceDataDiskGuid;
    GUID TargetReplicationGroupGuid;
    BOOLEAN SkipConnectivityCheck;
    BOOLEAN IncludeOfflineDisks;
}
struct SR_RESOURCE_TYPE_QUERY_ELIGIBLE_SOURCE_DATADISKS
{
    GUID DataDiskGuid;
    BOOLEAN IncludeAvailableStoargeDisks;
}
struct SR_RESOURCE_TYPE_DISK_INFO
{
    SR_DISK_REPLICATION_ELIGIBLE Reason;
    GUID DiskGuid;
}
struct SR_RESOURCE_TYPE_ELIGIBLE_DISKS_RESULT
{
    ushort Count;
    SR_RESOURCE_TYPE_DISK_INFO[1] DiskInfo;
}
struct SR_RESOURCE_TYPE_REPLICATED_DISK
{
    SR_REPLICATED_DISK_TYPE Type;
    GUID ClusterDiskResourceGuid;
    GUID ReplicationGroupId;
    wchar[260] ReplicationGroupName;
}
struct SR_RESOURCE_TYPE_REPLICATED_DISKS_RESULT
{
    ushort Count;
    SR_RESOURCE_TYPE_REPLICATED_DISK[1] ReplicatedDisks;
}
struct SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP
{
    wchar[260] ReplicationGroupName;
    wchar[260] Description;
    wchar[260] LogPath;
    ulong MaxLogSizeInBytes;
    ushort LogType;
    uint ReplicationMode;
    uint MinimumPartnersInSync;
    BOOLEAN EnableWriteConsistency;
    BOOLEAN EnableEncryption;
    BOOLEAN EnableCompression;
    wchar[260] CertificateThumbprint;
    uint VolumeNameCount;
    wchar[260] VolumeNames;
}
struct SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP_RESULT
{
    uint Result;
    wchar[260] ErrorString;
}
struct CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INPUT
{
    uint dwFlags;
    GUID guidPoolFilter;
}
struct RESOURCE_STATUS
{
    CLUSTER_RESOURCE_STATE ResourceState;
    uint CheckPoint;
    uint WaitHint;
    HANDLE EventHandle;
}
struct NodeUtilizationInfoElement
{
    ulong Id;
    ulong AvailableMemory;
    ulong AvailableMemoryAfterReclamation;
}
struct ResourceUtilizationInfoElement
{
    ulong PhysicalNumaId;
    ulong CurrentMemory;
}
alias VM_RESDLL_CONTEXT = int;
enum : int
{
    VmResdllContextTurnOff       = 0x00000000,
    VmResdllContextSave          = 0x00000001,
    VmResdllContextShutdown      = 0x00000002,
    VmResdllContextShutdownForce = 0x00000003,
    VmResdllContextLiveMigration = 0x00000004,
}

alias RESDLL_CONTEXT_OPERATION_TYPE = int;
enum : int
{
    ResdllContextOperationTypeFailback                   = 0x00000000,
    ResdllContextOperationTypeDrain                      = 0x00000001,
    ResdllContextOperationTypeDrainFailure               = 0x00000002,
    ResdllContextOperationTypeEmbeddedFailure            = 0x00000003,
    ResdllContextOperationTypePreemption                 = 0x00000004,
    ResdllContextOperationTypeNetworkDisconnect          = 0x00000005,
    ResdllContextOperationTypeNetworkDisconnectMoveRetry = 0x00000006,
}

struct GET_OPERATION_CONTEXT_PARAMS
{
    uint Size;
    uint Version;
    RESDLL_CONTEXT_OPERATION_TYPE Type;
    uint Priority;
}
struct RESOURCE_STATUS_EX
{
    CLUSTER_RESOURCE_STATE ResourceState;
    uint CheckPoint;
    HANDLE EventHandle;
    uint ApplicationSpecificErrorCode;
    uint Flags;
    uint WaitHint;
}
alias PSET_RESOURCE_STATUS_ROUTINE_EX = uint function(long, RESOURCE_STATUS_EX*);
alias PSET_RESOURCE_STATUS_ROUTINE = uint function(long, RESOURCE_STATUS*);
alias PQUORUM_RESOURCE_LOST = void function(long);
alias LOG_LEVEL = int;
enum : int
{
    LOG_INFORMATION = 0x00000000,
    LOG_WARNING     = 0x00000001,
    LOG_ERROR       = 0x00000002,
    LOG_SEVERE      = 0x00000003,
}

alias PLOG_EVENT_ROUTINE = void function(long, LOG_LEVEL, const(wchar)*);
alias POPEN_ROUTINE = void* function(const(wchar)*, HKEY, long);
alias PCLOSE_ROUTINE = void function(void*);
alias PONLINE_ROUTINE = uint function(void*, HANDLE*);
alias POFFLINE_ROUTINE = uint function(void*);
alias PTERMINATE_ROUTINE = void function(void*);
alias PIS_ALIVE_ROUTINE = BOOL function(void*);
alias PLOOKS_ALIVE_ROUTINE = BOOL function(void*);
alias PARBITRATE_ROUTINE = uint function(void*, PQUORUM_RESOURCE_LOST);
alias PRELEASE_ROUTINE = uint function(void*);
alias PRESOURCE_CONTROL_ROUTINE = uint function(void*, uint, void*, uint, void*, uint, uint*);
alias PRESOURCE_TYPE_CONTROL_ROUTINE = uint function(const(wchar)*, uint, void*, uint, void*, uint, uint*);
alias POPEN_V2_ROUTINE = void* function(const(wchar)*, HKEY, long, uint);
alias PONLINE_V2_ROUTINE = uint function(void*, HANDLE*, uint, ubyte*, uint, uint);
alias POFFLINE_V2_ROUTINE = uint function(void*, const(wchar)*, uint, ubyte*, uint, uint);
alias PCANCEL_ROUTINE = uint function(void*, uint);
alias PBEGIN_RESCALL_ROUTINE = uint function(void*, uint, void*, uint, void*, uint, uint*, long, BOOL*);
alias PBEGIN_RESTYPECALL_ROUTINE = uint function(const(wchar)*, uint, void*, uint, void*, uint, uint*, long, BOOL*);
alias RESOURCE_EXIT_STATE = int;
enum : int
{
    ResourceExitStateContinue  = 0x00000000,
    ResourceExitStateTerminate = 0x00000001,
    ResourceExitStateMax       = 0x00000002,
}

alias PBEGIN_RESCALL_AS_USER_ROUTINE = uint function(void*, HANDLE, uint, void*, uint, void*, uint, uint*, long, BOOL*);
alias PBEGIN_RESTYPECALL_AS_USER_ROUTINE = uint function(const(wchar)*, HANDLE, uint, void*, uint, void*, uint, uint*, long, BOOL*);
struct CLRES_V1_FUNCTIONS
{
    POPEN_ROUTINE Open;
    PCLOSE_ROUTINE Close;
    PONLINE_ROUTINE Online;
    POFFLINE_ROUTINE Offline;
    PTERMINATE_ROUTINE Terminate;
    PLOOKS_ALIVE_ROUTINE LooksAlive;
    PIS_ALIVE_ROUTINE IsAlive;
    PARBITRATE_ROUTINE Arbitrate;
    PRELEASE_ROUTINE Release;
    PRESOURCE_CONTROL_ROUTINE ResourceControl;
    PRESOURCE_TYPE_CONTROL_ROUTINE ResourceTypeControl;
}
struct CLRES_V2_FUNCTIONS
{
    POPEN_V2_ROUTINE Open;
    PCLOSE_ROUTINE Close;
    PONLINE_V2_ROUTINE Online;
    POFFLINE_V2_ROUTINE Offline;
    PTERMINATE_ROUTINE Terminate;
    PLOOKS_ALIVE_ROUTINE LooksAlive;
    PIS_ALIVE_ROUTINE IsAlive;
    PARBITRATE_ROUTINE Arbitrate;
    PRELEASE_ROUTINE Release;
    PRESOURCE_CONTROL_ROUTINE ResourceControl;
    PRESOURCE_TYPE_CONTROL_ROUTINE ResourceTypeControl;
    PCANCEL_ROUTINE Cancel;
}
struct CLRES_V3_FUNCTIONS
{
    POPEN_V2_ROUTINE Open;
    PCLOSE_ROUTINE Close;
    PONLINE_V2_ROUTINE Online;
    POFFLINE_V2_ROUTINE Offline;
    PTERMINATE_ROUTINE Terminate;
    PLOOKS_ALIVE_ROUTINE LooksAlive;
    PIS_ALIVE_ROUTINE IsAlive;
    PARBITRATE_ROUTINE Arbitrate;
    PRELEASE_ROUTINE Release;
    PBEGIN_RESCALL_ROUTINE BeginResourceControl;
    PBEGIN_RESTYPECALL_ROUTINE BeginResourceTypeControl;
    PCANCEL_ROUTINE Cancel;
}
struct CLRES_V4_FUNCTIONS
{
    POPEN_V2_ROUTINE Open;
    PCLOSE_ROUTINE Close;
    PONLINE_V2_ROUTINE Online;
    POFFLINE_V2_ROUTINE Offline;
    PTERMINATE_ROUTINE Terminate;
    PLOOKS_ALIVE_ROUTINE LooksAlive;
    PIS_ALIVE_ROUTINE IsAlive;
    PARBITRATE_ROUTINE Arbitrate;
    PRELEASE_ROUTINE Release;
    PBEGIN_RESCALL_ROUTINE BeginResourceControl;
    PBEGIN_RESTYPECALL_ROUTINE BeginResourceTypeControl;
    PCANCEL_ROUTINE Cancel;
    PBEGIN_RESCALL_AS_USER_ROUTINE BeginResourceControlAsUser;
    PBEGIN_RESTYPECALL_AS_USER_ROUTINE BeginResourceTypeControlAsUser;
}
struct CLRES_FUNCTION_TABLE
{
    uint TableSize;
    uint Version;
    union
    {
        CLRES_V1_FUNCTIONS V1Functions;
        CLRES_V2_FUNCTIONS V2Functions;
        CLRES_V3_FUNCTIONS V3Functions;
        CLRES_V4_FUNCTIONS V4Functions;
    }
}
struct RESUTIL_LARGEINT_DATA
{
    long Default;
    long Minimum;
    long Maximum;
}
struct RESUTIL_ULARGEINT_DATA
{
    ulong Default;
    ulong Minimum;
    ulong Maximum;
}
struct RESUTIL_FILETIME_DATA
{
    FILETIME Default;
    FILETIME Minimum;
    FILETIME Maximum;
}
struct RESUTIL_PROPERTY_ITEM
{
    PWSTR Name;
    PWSTR KeyName;
    uint Format;
    union
    {
        ulong DefaultPtr;
        uint Default;
        void* lpDefault;
        RESUTIL_LARGEINT_DATA* LargeIntData;
        RESUTIL_ULARGEINT_DATA* ULargeIntData;
        RESUTIL_FILETIME_DATA* FileTimeData;
    }
    uint Minimum;
    uint Maximum;
    uint Flags;
    uint Offset;
}
alias PSTARTUP_ROUTINE = uint function(const(wchar)*, uint, uint, PSET_RESOURCE_STATUS_ROUTINE, PLOG_EVENT_ROUTINE, CLRES_FUNCTION_TABLE**);
alias FAILURE_TYPE = int;
enum : int
{
    FAILURE_TYPE_GENERAL      = 0x00000000,
    FAILURE_TYPE_EMBEDDED     = 0x00000001,
    FAILURE_TYPE_NETWORK_LOSS = 0x00000002,
}

alias CLUSTER_RESOURCE_APPLICATION_STATE = int;
enum : int
{
    ClusterResourceApplicationStateUnknown = 0x00000001,
    ClusterResourceApplicationOSHeartBeat  = 0x00000002,
    ClusterResourceApplicationReady        = 0x00000003,
}

alias PSET_RESOURCE_LOCKED_MODE_ROUTINE = uint function(long, BOOL, uint);
alias PSIGNAL_FAILURE_ROUTINE = uint function(long, FAILURE_TYPE, uint);
alias PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE = uint function(long, ubyte*, uint);
alias PEND_CONTROL_CALL = uint function(const(long), uint);
alias PEND_TYPE_CONTROL_CALL = uint function(const(long), uint);
alias PEXTEND_RES_CONTROL_CALL = uint function(const(long), uint);
alias PEXTEND_RES_TYPE_CONTROL_CALL = uint function(const(long), uint);
alias PRAISE_RES_TYPE_NOTIFICATION = uint function(const(wchar)*, const(ubyte)*, uint);
alias PCHANGE_RESOURCE_PROCESS_FOR_DUMPS = uint function(long, const(wchar)*, uint, BOOL);
alias PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS = uint function(const(wchar)*, const(wchar)*, uint, BOOL);
alias PSET_INTERNAL_STATE = uint function(long, CLUSTER_RESOURCE_APPLICATION_STATE, BOOL);
alias PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE = uint function(long, BOOL, uint, uint);
alias PREQUEST_DUMP_ROUTINE = uint function(long, BOOL, uint);
alias PSET_RESOURCE_WPR_POLICY_ROUTINE = uint function(long, uint);
alias PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE = uint function(long, ulong);
struct CLRES_CALLBACK_FUNCTION_TABLE
{
    PLOG_EVENT_ROUTINE LogEvent;
    PSET_RESOURCE_STATUS_ROUTINE_EX SetResourceStatusEx;
    PSET_RESOURCE_LOCKED_MODE_ROUTINE SetResourceLockedMode;
    PSIGNAL_FAILURE_ROUTINE SignalFailure;
    PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE SetResourceInMemoryNodeLocalProperties;
    PEND_CONTROL_CALL EndControlCall;
    PEND_TYPE_CONTROL_CALL EndTypeControlCall;
    PEXTEND_RES_CONTROL_CALL ExtendControlCall;
    PEXTEND_RES_TYPE_CONTROL_CALL ExtendTypeControlCall;
    PRAISE_RES_TYPE_NOTIFICATION RaiseResTypeNotification;
    PCHANGE_RESOURCE_PROCESS_FOR_DUMPS ChangeResourceProcessForDumps;
    PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS ChangeResTypeProcessForDumps;
    PSET_INTERNAL_STATE SetInternalState;
    PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE SetResourceLockedModeEx;
    PREQUEST_DUMP_ROUTINE RequestDump;
    PSET_RESOURCE_WPR_POLICY_ROUTINE SetResourceWprPolicy;
    PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE ArmWprWatchdogForCurrentResourceCall;
}
alias PSTARTUP_EX_ROUTINE = uint function(const(wchar)*, uint, uint, CLRES_CALLBACK_FUNCTION_TABLE*, CLRES_FUNCTION_TABLE**);
alias RESOURCE_MONITOR_STATE = int;
enum : int
{
    RmonInitializing         = 0x00000000,
    RmonIdle                 = 0x00000001,
    RmonStartingResource     = 0x00000002,
    RmonInitializingResource = 0x00000003,
    RmonOnlineResource       = 0x00000004,
    RmonOfflineResource      = 0x00000005,
    RmonShutdownResource     = 0x00000006,
    RmonDeletingResource     = 0x00000007,
    RmonIsAlivePoll          = 0x00000008,
    RmonLooksAlivePoll       = 0x00000009,
    RmonArbitrateResource    = 0x0000000a,
    RmonReleaseResource      = 0x0000000b,
    RmonResourceControl      = 0x0000000c,
    RmonResourceTypeControl  = 0x0000000d,
    RmonTerminateResource    = 0x0000000e,
    RmonDeadlocked           = 0x0000000f,
}

struct MONITOR_STATE
{
    long LastUpdate;
    RESOURCE_MONITOR_STATE State;
    HANDLE ActiveResource;
    BOOL ResmonStop;
}
struct POST_UPGRADE_VERSION_INFO
{
    uint newMajorVersion;
    uint newUpgradeVersion;
    uint oldMajorVersion;
    uint oldUpgradeVersion;
    uint reserved;
}
struct CLUSTER_HEALTH_FAULT
{
    PWSTR Id;
    uint ErrorType;
    uint ErrorCode;
    PWSTR Description;
    PWSTR Provider;
    uint Flags;
    uint Reserved;
}
struct CLUSTER_HEALTH_FAULT_ARRAY
{
    uint numFaults;
    CLUSTER_HEALTH_FAULT* faults;
}
alias PRESUTIL_START_RESOURCE_SERVICE = uint function(const(wchar)*, SC_HANDLE*);
alias PRESUTIL_VERIFY_RESOURCE_SERVICE = uint function(const(wchar)*);
alias PRESUTIL_STOP_RESOURCE_SERVICE = uint function(const(wchar)*);
alias PRESUTIL_VERIFY_SERVICE = uint function(SC_HANDLE);
alias PRESUTIL_STOP_SERVICE = uint function(SC_HANDLE);
alias PRESUTIL_CREATE_DIRECTORY_TREE = uint function(const(wchar)*);
alias PRESUTIL_IS_PATH_VALID = BOOL function(const(wchar)*);
alias PRESUTIL_ENUM_PROPERTIES = uint function(const(RESUTIL_PROPERTY_ITEM)*, PWSTR, uint, uint*, uint*);
alias PRESUTIL_ENUM_PRIVATE_PROPERTIES = uint function(HKEY, PWSTR, uint, uint*, uint*);
alias PRESUTIL_GET_PROPERTIES = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
alias PRESUTIL_GET_ALL_PROPERTIES = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
alias PRESUTIL_GET_PRIVATE_PROPERTIES = uint function(HKEY, void*, uint, uint*, uint*);
alias PRESUTIL_GET_PROPERTY_SIZE = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, uint*, uint*);
alias PRESUTIL_GET_PROPERTY = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void**, uint*);
alias PRESUTIL_VERIFY_PROPERTY_TABLE = uint function(const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, ubyte*);
alias PRESUTIL_SET_PROPERTY_TABLE = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, ubyte*);
alias PRESUTIL_SET_PROPERTY_TABLE_EX = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, BOOL, const(void)*, uint, BOOL, ubyte*);
alias PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, const(ubyte)*, const(void)*, uint, ubyte*);
alias PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK_EX = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, const(ubyte)*, const(void)*, uint, BOOL, ubyte*);
alias PRESUTIL_SET_UNKNOWN_PROPERTIES = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, const(void)*, uint);
alias PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, ubyte*, BOOL, PWSTR*);
alias PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK = uint function(const(RESUTIL_PROPERTY_ITEM)*, void*, uint*, const(ubyte)*, uint*, uint*);
alias PRESUTIL_DUP_PARAMETER_BLOCK = uint function(ubyte*, const(ubyte)*, const(RESUTIL_PROPERTY_ITEM)*);
alias PRESUTIL_FREE_PARAMETER_BLOCK = void function(ubyte*, const(ubyte)*, const(RESUTIL_PROPERTY_ITEM)*);
alias PRESUTIL_ADD_UNKNOWN_PROPERTIES = uint function(HKEY, const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
alias PRESUTIL_SET_PRIVATE_PROPERTY_LIST = uint function(HKEY, const(void)*, uint);
alias PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST = uint function(const(void)*, uint);
alias PRESUTIL_DUP_STRING = PWSTR function(const(wchar)*);
alias PRESUTIL_GET_BINARY_VALUE = uint function(HKEY, const(wchar)*, ubyte**, uint*);
alias PRESUTIL_GET_SZ_VALUE = PWSTR function(HKEY, const(wchar)*);
alias PRESUTIL_GET_EXPAND_SZ_VALUE = PWSTR function(HKEY, const(wchar)*, BOOL);
alias PRESUTIL_GET_DWORD_VALUE = uint function(HKEY, const(wchar)*, uint*, uint);
alias PRESUTIL_GET_QWORD_VALUE = uint function(HKEY, const(wchar)*, ulong*, ulong);
alias PRESUTIL_SET_BINARY_VALUE = uint function(HKEY, const(wchar)*, const(ubyte)*, uint, ubyte**, uint*);
alias PRESUTIL_SET_SZ_VALUE = uint function(HKEY, const(wchar)*, const(wchar)*, PWSTR*);
alias PRESUTIL_SET_EXPAND_SZ_VALUE = uint function(HKEY, const(wchar)*, const(wchar)*, PWSTR*);
alias PRESUTIL_SET_MULTI_SZ_VALUE = uint function(HKEY, const(wchar)*, const(wchar)*, uint, PWSTR*, uint*);
alias PRESUTIL_SET_DWORD_VALUE = uint function(HKEY, const(wchar)*, uint, uint*);
alias PRESUTIL_SET_QWORD_VALUE = uint function(HKEY, const(wchar)*, ulong, ulong*);
alias PRESUTIL_GET_BINARY_PROPERTY = uint function(ubyte**, uint*, const(CLUSPROP_BINARY)*, const(ubyte)*, uint, ubyte**, uint*);
alias PRESUTIL_GET_SZ_PROPERTY = uint function(PWSTR*, const(CLUSPROP_SZ)*, const(wchar)*, ubyte**, uint*);
alias PRESUTIL_GET_MULTI_SZ_PROPERTY = uint function(PWSTR*, uint*, const(CLUSPROP_SZ)*, const(wchar)*, uint, ubyte**, uint*);
alias PRESUTIL_GET_DWORD_PROPERTY = uint function(uint*, const(CLUSPROP_DWORD)*, uint, uint, uint, ubyte**, uint*);
alias PRESUTIL_GET_LONG_PROPERTY = uint function(int*, const(CLUSPROP_LONG)*, int, int, int, ubyte**, uint*);
alias PRESUTIL_GET_FILETIME_PROPERTY = uint function(FILETIME*, const(CLUSPROP_FILETIME)*, FILETIME, FILETIME, FILETIME, ubyte**, uint*);
alias PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME = void* function(HRESOURCE);
alias PRESUTIL_FREE_ENVIRONMENT = uint function(void*);
alias PRESUTIL_EXPAND_ENVIRONMENT_STRINGS = PWSTR function(const(wchar)*);
alias PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT = uint function(const(wchar)*, HRESOURCE, PLOG_EVENT_ROUTINE, long);
alias PRESUTIL_REMOVE_RESOURCE_SERVICE_ENVIRONMENT = uint function(const(wchar)*, PLOG_EVENT_ROUTINE, long);
alias PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS = uint function(const(wchar)*, SC_HANDLE, SC_HANDLE*, PLOG_EVENT_ROUTINE, long);
alias PRESUTIL_FIND_SZ_PROPERTY = uint function(const(void)*, uint, const(wchar)*, PWSTR*);
alias PRESUTIL_FIND_EXPAND_SZ_PROPERTY = uint function(const(void)*, uint, const(wchar)*, PWSTR*);
alias PRESUTIL_FIND_EXPANDED_SZ_PROPERTY = uint function(const(void)*, uint, const(wchar)*, PWSTR*);
alias PRESUTIL_FIND_DWORD_PROPERTY = uint function(const(void)*, uint, const(wchar)*, uint*);
alias PRESUTIL_FIND_BINARY_PROPERTY = uint function(const(void)*, uint, const(wchar)*, ubyte**, uint*);
alias PRESUTIL_FIND_MULTI_SZ_PROPERTY = uint function(const(void)*, uint, const(wchar)*, PWSTR*, uint*);
alias PRESUTIL_FIND_LONG_PROPERTY = uint function(const(void)*, uint, const(wchar)*, int*);
alias PRESUTIL_FIND_ULARGEINTEGER_PROPERTY = uint function(const(void)*, uint, const(wchar)*, ulong*);
alias PRESUTIL_FIND_FILETIME_PROPERTY = uint function(const(void)*, uint, const(wchar)*, FILETIME*);
struct CLUS_WORKER
{
    HANDLE hThread;
    BOOL Terminate;
}
alias PWORKER_START_ROUTINE = uint function(CLUS_WORKER*, void*);
alias PCLUSAPI_CLUS_WORKER_CREATE = uint function(CLUS_WORKER*, PWORKER_START_ROUTINE, void*);
alias PCLUSAPIClusWorkerCheckTerminate = BOOL function(CLUS_WORKER*);
alias PCLUSAPI_CLUS_WORKER_TERMINATE = void function(CLUS_WORKER*);
alias LPRESOURCE_CALLBACK = uint function(HRESOURCE, HRESOURCE, void*);
alias LPRESOURCE_CALLBACK_EX = uint function(HCLUSTER, HRESOURCE, HRESOURCE, void*);
alias LPGROUP_CALLBACK_EX = uint function(HCLUSTER, HGROUP, HGROUP, void*);
alias LPNODE_CALLBACK = uint function(HCLUSTER, HNODE, CLUSTER_NODE_STATE, void*);
alias PRESUTIL_RESOURCES_EQUAL = BOOL function(HRESOURCE, HRESOURCE);
alias PRESUTIL_RESOURCE_TYPES_EQUAL = BOOL function(const(wchar)*, HRESOURCE);
alias PRESUTIL_IS_RESOURCE_CLASS_EQUAL = BOOL function(CLUS_RESOURCE_CLASS_INFO*, HRESOURCE);
alias PRESUTIL_ENUM_RESOURCES = uint function(HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK, void*);
alias PRESUTIL_ENUM_RESOURCES_EX = uint function(HCLUSTER, HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK_EX, void*);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY = HRESOURCE function(HANDLE, const(wchar)*);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME = HRESOURCE function(HCLUSTER, HANDLE, const(wchar)*, BOOL);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS = HRESOURCE function(HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO*, BOOL);
alias PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY = HRESOURCE function(const(wchar)*, const(wchar)*);
alias PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS = uint function(HRESOURCE, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*);
alias PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER = uint function(HCLUSTER, HRESOURCE, PWSTR, uint*);
alias PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL = uint function(uint, BOOL, uint*, PLOG_EVENT_ROUTINE, long);
alias PRESUTIL_GET_PROPERTY_FORMATS = uint function(const(RESUTIL_PROPERTY_ITEM)*, void*, uint, uint*, uint*);
alias PRESUTIL_GET_CORE_CLUSTER_RESOURCES = uint function(HCLUSTER, HRESOURCE*, HRESOURCE*, HRESOURCE*);
alias PRESUTIL_GET_RESOURCE_NAME = uint function(HRESOURCE, PWSTR, uint*);
alias CLUSTER_ROLE = int;
enum : int
{
    ClusterRoleDHCP                        = 0x00000000,
    ClusterRoleDTC                         = 0x00000001,
    ClusterRoleFileServer                  = 0x00000002,
    ClusterRoleGenericApplication          = 0x00000003,
    ClusterRoleGenericScript               = 0x00000004,
    ClusterRoleGenericService              = 0x00000005,
    ClusterRoleISCSINameServer             = 0x00000006,
    ClusterRoleMSMQ                        = 0x00000007,
    ClusterRoleNFS                         = 0x00000008,
    ClusterRolePrintServer                 = 0x00000009,
    ClusterRoleStandAloneNamespaceServer   = 0x0000000a,
    ClusterRoleVolumeShadowCopyServiceTask = 0x0000000b,
    ClusterRoleWINS                        = 0x0000000c,
    ClusterRoleTaskScheduler               = 0x0000000d,
    ClusterRoleNetworkFileSystem           = 0x0000000e,
    ClusterRoleDFSReplicatedFolder         = 0x0000000f,
    ClusterRoleDistributedFileSystem       = 0x00000010,
    ClusterRoleDistributedNetworkName      = 0x00000011,
    ClusterRoleFileShare                   = 0x00000012,
    ClusterRoleFileShareWitness            = 0x00000013,
    ClusterRoleHardDisk                    = 0x00000014,
    ClusterRoleIPAddress                   = 0x00000015,
    ClusterRoleIPV6Address                 = 0x00000016,
    ClusterRoleIPV6TunnelAddress           = 0x00000017,
    ClusterRoleISCSITargetServer           = 0x00000018,
    ClusterRoleNetworkName                 = 0x00000019,
    ClusterRolePhysicalDisk                = 0x0000001a,
    ClusterRoleSODAFileServer              = 0x0000001b,
    ClusterRoleStoragePool                 = 0x0000001c,
    ClusterRoleVirtualMachine              = 0x0000001d,
    ClusterRoleVirtualMachineConfiguration = 0x0000001e,
    ClusterRoleVirtualMachineReplicaBroker = 0x0000001f,
}

alias CLUSTER_ROLE_STATE = int;
enum : int
{
    ClusterRoleUnknown     = 0xffffffff,
    ClusterRoleClustered   = 0x00000000,
    ClusterRoleUnclustered = 0x00000001,
}

alias PCLUSTER_IS_PATH_ON_SHARED_VOLUME = BOOL function(const(wchar)*);
alias PCLUSTER_GET_VOLUME_PATH_NAME = BOOL function(const(wchar)*, PWSTR, uint);
alias PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT = BOOL function(const(wchar)*, PWSTR, uint);
alias PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP = uint function(const(wchar)*, PWSTR, uint*, PWSTR, uint*);
alias PCLUSTER_CLEAR_BACKUP_STATE_FOR_SHARED_VOLUME = uint function(const(wchar)*);
alias PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX = uint function(const(wchar)*, SC_HANDLE, SC_HANDLE*, uint, PLOG_EVENT_ROUTINE, long);
alias PRESUTIL_ENUM_RESOURCES_EX2 = uint function(HCLUSTER, HRESOURCE, const(wchar)*, LPRESOURCE_CALLBACK_EX, void*, uint);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY_EX = HRESOURCE function(HANDLE, const(wchar)*, uint);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME_EX = HRESOURCE function(HCLUSTER, HANDLE, const(wchar)*, BOOL, uint);
alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX = HRESOURCE function(HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO*, BOOL, uint);
alias PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX = HRESOURCE function(const(wchar)*, const(wchar)*, uint);
alias PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX = uint function(HCLUSTER, HRESOURCE*, HRESOURCE*, HRESOURCE*, uint);
alias POPEN_CLUSTER_CRYPT_PROVIDER = HCLUSCRYPTPROVIDER function(const(wchar)*, byte*, uint, uint);
alias POPEN_CLUSTER_CRYPT_PROVIDEREX = HCLUSCRYPTPROVIDER function(const(wchar)*, const(wchar)*, byte*, uint, uint);
alias PCLOSE_CLUSTER_CRYPT_PROVIDER = uint function(HCLUSCRYPTPROVIDER);
alias PCLUSTER_ENCRYPT = uint function(HCLUSCRYPTPROVIDER, ubyte*, uint, ubyte**, uint*);
alias PCLUSTER_DECRYPT = uint function(HCLUSCRYPTPROVIDER, ubyte*, uint, ubyte**, uint*);
alias PFREE_CLUSTER_CRYPT = uint function(void*);
alias PRES_UTIL_VERIFY_SHUTDOWN_SAFE = uint function(uint, uint, uint*);
struct PaxosTagCStruct
{
    ulong __padding__PaxosTagVtable;
    ulong __padding__NextEpochVtable;
    ulong __padding__NextEpoch_DateTimeVtable;
    ulong NextEpoch_DateTime_ticks;
    int NextEpoch_Value;
    uint __padding__BoundryNextEpoch;
    ulong __padding__EpochVtable;
    ulong __padding__Epoch_DateTimeVtable;
    ulong Epoch_DateTime_ticks;
    int Epoch_Value;
    uint __padding__BoundryEpoch;
    int Sequence;
    uint __padding__BoundrySequence;
}
struct WitnessTagUpdateHelper
{
    int Version;
    PaxosTagCStruct paxosToSet;
    PaxosTagCStruct paxosToValidate;
}
struct WitnessTagHelper
{
    int Version;
    PaxosTagCStruct paxosToValidate;
}
alias PREGISTER_APPINSTANCE = uint function(HANDLE, GUID*, BOOL);
alias PREGISTER_APPINSTANCE_VERSION = uint function(GUID*, ulong, ulong);
alias PQUERY_APPINSTANCE_VERSION = uint function(GUID*, ulong*, ulong*, NTSTATUS*);
alias PRESET_ALL_APPINSTANCE_VERSIONS = uint function();
alias SET_APP_INSTANCE_CSV_FLAGS = uint function(HANDLE, uint, uint);
alias CLUADMEX_OBJECT_TYPE = int;
enum : int
{
    CLUADMEX_OT_NONE         = 0x00000000,
    CLUADMEX_OT_CLUSTER      = 0x00000001,
    CLUADMEX_OT_NODE         = 0x00000002,
    CLUADMEX_OT_GROUP        = 0x00000003,
    CLUADMEX_OT_RESOURCE     = 0x00000004,
    CLUADMEX_OT_RESOURCETYPE = 0x00000005,
    CLUADMEX_OT_NETWORK      = 0x00000006,
    CLUADMEX_OT_NETINTERFACE = 0x00000007,
}

enum IID_IGetClusterUIInfo = GUID(0x97dede50, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterUIInfo : IUnknown
{
    HRESULT GetClusterName(BSTR, int*);
    uint GetLocale();
    HFONT GetFont();
    HICON GetIcon();
}
enum IID_IGetClusterDataInfo = GUID(0x97dede51, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterDataInfo : IUnknown
{
    HRESULT GetClusterName(BSTR, int*);
    HCLUSTER GetClusterHandle();
    int GetObjectCount();
}
enum IID_IGetClusterObjectInfo = GUID(0x97dede52, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterObjectInfo : IUnknown
{
    HRESULT GetObjectName(int, BSTR, int*);
    CLUADMEX_OBJECT_TYPE GetObjectType(int);
}
enum IID_IGetClusterNodeInfo = GUID(0x97dede53, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterNodeInfo : IUnknown
{
    HNODE GetNodeHandle(int);
}
enum IID_IGetClusterGroupInfo = GUID(0x97dede54, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterGroupInfo : IUnknown
{
    HGROUP GetGroupHandle(int);
}
enum IID_IGetClusterResourceInfo = GUID(0x97dede55, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterResourceInfo : IUnknown
{
    HRESOURCE GetResourceHandle(int);
    HRESULT GetResourceTypeName(int, BSTR, int*);
    BOOL GetResourceNetworkName(int, BSTR, uint*);
}
enum IID_IGetClusterNetworkInfo = GUID(0x97dede56, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterNetworkInfo : IUnknown
{
    HNETWORK GetNetworkHandle(int);
}
enum IID_IGetClusterNetInterfaceInfo = GUID(0x97dede57, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IGetClusterNetInterfaceInfo : IUnknown
{
    HNETINTERFACE GetNetInterfaceHandle(int);
}
enum IID_IWCPropertySheetCallback = GUID(0x97dede60, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWCPropertySheetCallback : IUnknown
{
    HRESULT AddPropertySheetPage(int*);
}
enum IID_IWEExtendPropertySheet = GUID(0x97dede61, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWEExtendPropertySheet : IUnknown
{
    HRESULT CreatePropertySheetPages(IUnknown, IWCPropertySheetCallback);
}
enum IID_IWCWizardCallback = GUID(0x97dede62, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWCWizardCallback : IUnknown
{
    HRESULT AddWizardPage(int*);
    HRESULT EnableNext(int*, BOOL);
}
enum IID_IWEExtendWizard = GUID(0x97dede63, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWEExtendWizard : IUnknown
{
    HRESULT CreateWizardPages(IUnknown, IWCWizardCallback);
}
enum IID_IWCContextMenuCallback = GUID(0x97dede64, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWCContextMenuCallback : IUnknown
{
    HRESULT AddExtensionMenuItem(BSTR, BSTR, uint, uint, uint);
}
enum IID_IWEExtendContextMenu = GUID(0x97dede65, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWEExtendContextMenu : IUnknown
{
    HRESULT AddContextMenuItems(IUnknown, IWCContextMenuCallback);
}
enum IID_IWEInvokeCommand = GUID(0x97dede66, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWEInvokeCommand : IUnknown
{
    HRESULT InvokeCommand(uint, IUnknown);
}
enum IID_IWCWizard97Callback = GUID(0x97dede67, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWCWizard97Callback : IUnknown
{
    HRESULT AddWizard97Page(int*);
    HRESULT EnableNext(int*, BOOL);
}
enum IID_IWEExtendWizard97 = GUID(0x97dede68, 0xfc6b, 0x11cf, [0xb5, 0xf5, 0x0, 0xa0, 0xc9, 0xa, 0xb5, 0x5]);
interface IWEExtendWizard97 : IUnknown
{
    HRESULT CreateWizard97Pages(IUnknown, IWCWizard97Callback);
}
enum CLSID_ClusApplication = GUID(0xf2e606e5, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusApplication
{
}
enum CLSID_Cluster = GUID(0xf2e606e3, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct Cluster
{
}
enum CLSID_ClusVersion = GUID(0xf2e60715, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusVersion
{
}
enum CLSID_ClusResType = GUID(0xf2e6070f, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResType
{
}
enum CLSID_ClusProperty = GUID(0xf2e606fd, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusProperty
{
}
enum CLSID_ClusProperties = GUID(0xf2e606ff, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusProperties
{
}
enum CLSID_DomainNames = GUID(0xf2e606e1, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct DomainNames
{
}
enum CLSID_ClusNetwork = GUID(0xf2e606f1, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNetwork
{
}
enum CLSID_ClusNetInterface = GUID(0xf2e606ed, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNetInterface
{
}
enum CLSID_ClusNetInterfaces = GUID(0xf2e606ef, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNetInterfaces
{
}
enum CLSID_ClusResDependencies = GUID(0xf2e60703, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResDependencies
{
}
enum CLSID_ClusResGroupResources = GUID(0xf2e606e9, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResGroupResources
{
}
enum CLSID_ClusResTypeResources = GUID(0xf2e60713, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResTypeResources
{
}
enum CLSID_ClusResGroupPreferredOwnerNodes = GUID(0xf2e606e7, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResGroupPreferredOwnerNodes
{
}
enum CLSID_ClusResPossibleOwnerNodes = GUID(0xf2e6070d, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResPossibleOwnerNodes
{
}
enum CLSID_ClusNetworks = GUID(0xf2e606f3, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNetworks
{
}
enum CLSID_ClusNetworkNetInterfaces = GUID(0xf2e606f5, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNetworkNetInterfaces
{
}
enum CLSID_ClusNodeNetInterfaces = GUID(0xf2e606fb, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNodeNetInterfaces
{
}
enum CLSID_ClusRefObject = GUID(0xf2e60701, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusRefObject
{
}
enum CLSID_ClusterNames = GUID(0xf2e606eb, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusterNames
{
}
enum CLSID_ClusNode = GUID(0xf2e606f7, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNode
{
}
enum CLSID_ClusNodes = GUID(0xf2e606f9, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusNodes
{
}
enum CLSID_ClusResGroup = GUID(0xf2e60705, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResGroup
{
}
enum CLSID_ClusResGroups = GUID(0xf2e60707, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResGroups
{
}
enum CLSID_ClusResource = GUID(0xf2e60709, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResource
{
}
enum CLSID_ClusResources = GUID(0xf2e6070b, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResources
{
}
enum CLSID_ClusResTypes = GUID(0xf2e60711, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResTypes
{
}
enum CLSID_ClusResTypePossibleOwnerNodes = GUID(0xf2e60717, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResTypePossibleOwnerNodes
{
}
enum CLSID_ClusPropertyValue = GUID(0xf2e60719, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusPropertyValue
{
}
enum CLSID_ClusPropertyValues = GUID(0xf2e6071b, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusPropertyValues
{
}
enum CLSID_ClusPropertyValueData = GUID(0xf2e6071d, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusPropertyValueData
{
}
enum CLSID_ClusPartition = GUID(0xf2e6071f, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusPartition
{
}
enum CLSID_ClusPartitionEx = GUID(0x53d51d26, 0xb51b, 0x4a79, [0xb2, 0xc3, 0x50, 0x48, 0xd9, 0x3a, 0x98, 0xfc]);
struct ClusPartitionEx
{
}
enum CLSID_ClusPartitions = GUID(0xf2e60721, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusPartitions
{
}
enum CLSID_ClusDisk = GUID(0xf2e60723, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusDisk
{
}
enum CLSID_ClusDisks = GUID(0xf2e60725, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusDisks
{
}
enum CLSID_ClusScsiAddress = GUID(0xf2e60727, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusScsiAddress
{
}
enum CLSID_ClusRegistryKeys = GUID(0xf2e60729, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusRegistryKeys
{
}
enum CLSID_ClusCryptoKeys = GUID(0xf2e6072b, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusCryptoKeys
{
}
enum CLSID_ClusResDependents = GUID(0xf2e6072d, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
struct ClusResDependents
{
}
enum IID_ISClusApplication = GUID(0xf2e606e6, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusApplication : IDispatch
{
    HRESULT get_DomainNames(ISDomainNames*);
    HRESULT get_ClusterNames(BSTR, ISClusterNames*);
    HRESULT OpenCluster(BSTR, ISCluster*);
}
enum IID_ISDomainNames = GUID(0xf2e606e2, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISDomainNames : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, BSTR*);
}
enum IID_ISClusterNames = GUID(0xf2e606ec, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusterNames : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, BSTR*);
    HRESULT get_DomainName(BSTR*);
}
enum IID_ISClusRefObject = GUID(0xf2e60702, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusRefObject : IDispatch
{
    HRESULT get_Handle(ulong*);
}
enum IID_ISClusVersion = GUID(0xf2e60716, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusVersion : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
    HRESULT get_BuildNumber(short*);
    HRESULT get_VendorId(BSTR*);
    HRESULT get_CSDVersion(BSTR*);
    HRESULT get_ClusterHighestVersion(int*);
    HRESULT get_ClusterLowestVersion(int*);
    HRESULT get_Flags(int*);
    HRESULT get_MixedVersion(VARIANT*);
}
enum IID_ISCluster = GUID(0xf2e606e4, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISCluster : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Handle(ulong*);
    HRESULT Open(BSTR);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Version(ISClusVersion*);
    HRESULT put_QuorumResource(ISClusResource);
    HRESULT get_QuorumResource(ISClusResource*);
    HRESULT get_QuorumLogSize(int*);
    HRESULT put_QuorumLogSize(int);
    HRESULT get_QuorumPath(BSTR*);
    HRESULT put_QuorumPath(BSTR);
    HRESULT get_Nodes(ISClusNodes*);
    HRESULT get_ResourceGroups(ISClusResGroups*);
    HRESULT get_Resources(ISClusResources*);
    HRESULT get_ResourceTypes(ISClusResTypes*);
    HRESULT get_Networks(ISClusNetworks*);
    HRESULT get_NetInterfaces(ISClusNetInterfaces*);
}
enum IID_ISClusNode = GUID(0xf2e606f8, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNode : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Name(BSTR*);
    HRESULT get_Handle(ulong*);
    HRESULT get_NodeID(BSTR*);
    HRESULT get_State(CLUSTER_NODE_STATE*);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Evict();
    HRESULT get_ResourceGroups(ISClusResGroups*);
    HRESULT get_Cluster(ISCluster*);
    HRESULT get_NetInterfaces(ISClusNodeNetInterfaces*);
}
enum IID_ISClusNodes = GUID(0xf2e606fa, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNodes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNode*);
}
enum IID_ISClusNetwork = GUID(0xf2e606f2, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNetwork : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Handle(ulong*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_NetworkID(BSTR*);
    HRESULT get_State(CLUSTER_NETWORK_STATE*);
    HRESULT get_NetInterfaces(ISClusNetworkNetInterfaces*);
    HRESULT get_Cluster(ISCluster*);
}
enum IID_ISClusNetworks = GUID(0xf2e606f4, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNetworks : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNetwork*);
}
enum IID_ISClusNetInterface = GUID(0xf2e606ee, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNetInterface : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Name(BSTR*);
    HRESULT get_Handle(ulong*);
    HRESULT get_State(CLUSTER_NETINTERFACE_STATE*);
    HRESULT get_Cluster(ISCluster*);
}
enum IID_ISClusNetInterfaces = GUID(0xf2e606f0, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNetInterfaces : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNetInterface*);
}
enum IID_ISClusNodeNetInterfaces = GUID(0xf2e606fc, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNodeNetInterfaces : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNetInterface*);
}
enum IID_ISClusNetworkNetInterfaces = GUID(0xf2e606f6, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusNetworkNetInterfaces : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNetInterface*);
}
enum IID_ISClusResGroup = GUID(0xf2e60706, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResGroup : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Handle(ulong*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_State(CLUSTER_GROUP_STATE*);
    HRESULT get_OwnerNode(ISClusNode*);
    HRESULT get_Resources(ISClusResGroupResources*);
    HRESULT get_PreferredOwnerNodes(ISClusResGroupPreferredOwnerNodes*);
    HRESULT Delete();
    HRESULT Online(VARIANT, VARIANT, VARIANT*);
    HRESULT Move(VARIANT, VARIANT, VARIANT*);
    HRESULT Offline(VARIANT, VARIANT*);
    HRESULT get_Cluster(ISCluster*);
}
enum IID_ISClusResGroups = GUID(0xf2e60708, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResGroups : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResGroup*);
    HRESULT CreateItem(BSTR, ISClusResGroup*);
    HRESULT DeleteItem(VARIANT);
}
enum IID_ISClusResource = GUID(0xf2e6070a, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResource : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Handle(ulong*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_State(CLUSTER_RESOURCE_STATE*);
    HRESULT get_CoreFlag(CLUS_FLAGS*);
    HRESULT BecomeQuorumResource(BSTR, int);
    HRESULT Delete();
    HRESULT Fail();
    HRESULT Online(int, VARIANT*);
    HRESULT Offline(int, VARIANT*);
    HRESULT ChangeResourceGroup(ISClusResGroup);
    HRESULT AddResourceNode(ISClusNode);
    HRESULT RemoveResourceNode(ISClusNode);
    HRESULT CanResourceBeDependent(ISClusResource, VARIANT*);
    HRESULT get_PossibleOwnerNodes(ISClusResPossibleOwnerNodes*);
    HRESULT get_Dependencies(ISClusResDependencies*);
    HRESULT get_Dependents(ISClusResDependents*);
    HRESULT get_Group(ISClusResGroup*);
    HRESULT get_OwnerNode(ISClusNode*);
    HRESULT get_Cluster(ISCluster*);
    HRESULT get_ClassInfo(CLUSTER_RESOURCE_CLASS*);
    HRESULT get_Disk(ISClusDisk*);
    HRESULT get_RegistryKeys(ISClusRegistryKeys*);
    HRESULT get_CryptoKeys(ISClusCryptoKeys*);
    HRESULT get_TypeName(BSTR*);
    HRESULT get_Type(ISClusResType*);
    HRESULT get_MaintenanceMode(BOOL*);
    HRESULT put_MaintenanceMode(BOOL);
}
enum IID_ISClusResDependencies = GUID(0xf2e60704, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResDependencies : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResource*);
    HRESULT CreateItem(BSTR, BSTR, CLUSTER_RESOURCE_CREATE_FLAGS, ISClusResource*);
    HRESULT DeleteItem(VARIANT);
    HRESULT AddItem(ISClusResource);
    HRESULT RemoveItem(VARIANT);
}
enum IID_ISClusResGroupResources = GUID(0xf2e606ea, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResGroupResources : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResource*);
    HRESULT CreateItem(BSTR, BSTR, CLUSTER_RESOURCE_CREATE_FLAGS, ISClusResource*);
    HRESULT DeleteItem(VARIANT);
}
enum IID_ISClusResTypeResources = GUID(0xf2e60714, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResTypeResources : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResource*);
    HRESULT CreateItem(BSTR, BSTR, CLUSTER_RESOURCE_CREATE_FLAGS, ISClusResource*);
    HRESULT DeleteItem(VARIANT);
}
enum IID_ISClusResources = GUID(0xf2e6070c, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResources : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResource*);
    HRESULT CreateItem(BSTR, BSTR, BSTR, CLUSTER_RESOURCE_CREATE_FLAGS, ISClusResource*);
    HRESULT DeleteItem(VARIANT);
}
enum IID_ISClusResGroupPreferredOwnerNodes = GUID(0xf2e606e8, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResGroupPreferredOwnerNodes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNode*);
    HRESULT InsertItem(ISClusNode, int);
    HRESULT RemoveItem(VARIANT);
    HRESULT get_Modified(VARIANT*);
    HRESULT SaveChanges();
    HRESULT AddItem(ISClusNode);
}
enum IID_ISClusResPossibleOwnerNodes = GUID(0xf2e6070e, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResPossibleOwnerNodes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNode*);
    HRESULT AddItem(ISClusNode);
    HRESULT RemoveItem(VARIANT);
    HRESULT get_Modified(VARIANT*);
}
enum IID_ISClusResTypePossibleOwnerNodes = GUID(0xf2e60718, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResTypePossibleOwnerNodes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusNode*);
}
enum IID_ISClusResType = GUID(0xf2e60710, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResType : IDispatch
{
    HRESULT get_CommonProperties(ISClusProperties*);
    HRESULT get_PrivateProperties(ISClusProperties*);
    HRESULT get_CommonROProperties(ISClusProperties*);
    HRESULT get_PrivateROProperties(ISClusProperties*);
    HRESULT get_Name(BSTR*);
    HRESULT Delete();
    HRESULT get_Cluster(ISCluster*);
    HRESULT get_Resources(ISClusResTypeResources*);
    HRESULT get_PossibleOwnerNodes(ISClusResTypePossibleOwnerNodes*);
    HRESULT get_AvailableDisks(ISClusDisks*);
}
enum IID_ISClusResTypes = GUID(0xf2e60712, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResTypes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResType*);
    HRESULT CreateItem(BSTR, BSTR, BSTR, int, int, ISClusResType*);
    HRESULT DeleteItem(VARIANT);
}
enum IID_ISClusProperty = GUID(0xf2e606fe, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusProperty : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Length(int*);
    HRESULT get_ValueCount(int*);
    HRESULT get_Values(ISClusPropertyValues*);
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT);
    HRESULT get_Type(CLUSTER_PROPERTY_TYPE*);
    HRESULT put_Type(CLUSTER_PROPERTY_TYPE);
    HRESULT get_Format(CLUSTER_PROPERTY_FORMAT*);
    HRESULT put_Format(CLUSTER_PROPERTY_FORMAT);
    HRESULT get_ReadOnly(VARIANT*);
    HRESULT get_Private(VARIANT*);
    HRESULT get_Common(VARIANT*);
    HRESULT get_Modified(VARIANT*);
    HRESULT UseDefaultValue();
}
enum IID_ISClusPropertyValue = GUID(0xf2e6071a, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusPropertyValue : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT);
    HRESULT get_Type(CLUSTER_PROPERTY_TYPE*);
    HRESULT put_Type(CLUSTER_PROPERTY_TYPE);
    HRESULT get_Format(CLUSTER_PROPERTY_FORMAT*);
    HRESULT put_Format(CLUSTER_PROPERTY_FORMAT);
    HRESULT get_Length(int*);
    HRESULT get_DataCount(int*);
    HRESULT get_Data(ISClusPropertyValueData*);
}
enum IID_ISClusPropertyValues = GUID(0xf2e6071c, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusPropertyValues : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, ISClusPropertyValue*);
    HRESULT CreateItem(BSTR, VARIANT, ISClusPropertyValue*);
    HRESULT RemoveItem(VARIANT);
}
enum IID_ISClusProperties = GUID(0xf2e60700, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusProperties : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusProperty*);
    HRESULT CreateItem(BSTR, VARIANT, ISClusProperty*);
    HRESULT UseDefaultValue(VARIANT);
    HRESULT SaveChanges(VARIANT*);
    HRESULT get_ReadOnly(VARIANT*);
    HRESULT get_Private(VARIANT*);
    HRESULT get_Common(VARIANT*);
    HRESULT get_Modified(VARIANT*);
}
enum IID_ISClusPropertyValueData = GUID(0xf2e6071e, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusPropertyValueData : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, VARIANT*);
    HRESULT CreateItem(VARIANT, VARIANT*);
    HRESULT RemoveItem(VARIANT);
}
enum IID_ISClusPartition = GUID(0xf2e60720, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusPartition : IDispatch
{
    HRESULT get_Flags(int*);
    HRESULT get_DeviceName(BSTR*);
    HRESULT get_VolumeLabel(BSTR*);
    HRESULT get_SerialNumber(int*);
    HRESULT get_MaximumComponentLength(int*);
    HRESULT get_FileSystemFlags(int*);
    HRESULT get_FileSystem(BSTR*);
}
enum IID_ISClusPartitionEx = GUID(0x8802d4fe, 0xb32e, 0x4ad1, [0x9d, 0xbd, 0x64, 0xf1, 0x8e, 0x11, 0x66, 0xce]);
interface ISClusPartitionEx : ISClusPartition
{
    HRESULT get_TotalSize(int*);
    HRESULT get_FreeSpace(int*);
    HRESULT get_DeviceNumber(int*);
    HRESULT get_PartitionNumber(int*);
    HRESULT get_VolumeGuid(BSTR*);
}
enum IID_ISClusPartitions = GUID(0xf2e60722, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusPartitions : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, ISClusPartition*);
}
enum IID_ISClusDisk = GUID(0xf2e60724, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusDisk : IDispatch
{
    HRESULT get_Signature(int*);
    HRESULT get_ScsiAddress(ISClusScsiAddress*);
    HRESULT get_DiskNumber(int*);
    HRESULT get_Partitions(ISClusPartitions*);
}
enum IID_ISClusDisks = GUID(0xf2e60726, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusDisks : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(VARIANT, ISClusDisk*);
}
enum IID_ISClusScsiAddress = GUID(0xf2e60728, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusScsiAddress : IDispatch
{
    HRESULT get_PortNumber(VARIANT*);
    HRESULT get_PathId(VARIANT*);
    HRESULT get_TargetId(VARIANT*);
    HRESULT get_Lun(VARIANT*);
}
enum IID_ISClusRegistryKeys = GUID(0xf2e6072a, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusRegistryKeys : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, BSTR*);
    HRESULT AddItem(BSTR);
    HRESULT RemoveItem(VARIANT);
}
enum IID_ISClusCryptoKeys = GUID(0xf2e6072c, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusCryptoKeys : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, BSTR*);
    HRESULT AddItem(BSTR);
    HRESULT RemoveItem(VARIANT);
}
enum IID_ISClusResDependents = GUID(0xf2e6072e, 0x2631, 0x11d1, [0x89, 0xf1, 0x0, 0xa0, 0xc9, 0xd, 0x6, 0x1e]);
interface ISClusResDependents : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Refresh();
    HRESULT get_Item(VARIANT, ISClusResource*);
    HRESULT CreateItem(BSTR, BSTR, CLUSTER_RESOURCE_CREATE_FLAGS, ISClusResource*);
    HRESULT DeleteItem(VARIANT);
    HRESULT AddItem(ISClusResource);
    HRESULT RemoveItem(VARIANT);
}
