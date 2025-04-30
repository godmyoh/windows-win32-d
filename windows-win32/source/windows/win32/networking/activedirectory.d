module windows.win32.networking.activedirectory;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, LPARAM, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL, WPARAM;
import windows.win32.networking.winsock : SOCKET_ADDRESS;
import windows.win32.security : PSECURITY_DESCRIPTOR, PSID;
import windows.win32.security.authentication.identity : LSA_FOREST_TRUST_INFORMATION;
import windows.win32.system.com : DISPPARAMS, EXCEPINFO, IDataObject, IDispatch, IPersist, ITypeInfo, IUnknown;
import windows.win32.system.com.structuredstorage : IPropertyBag;
import windows.win32.system.ole : IEnumVARIANT;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.controls : LPFNSVADDPROPSHEETPAGE;
import windows.win32.ui.shell : BFFCALLBACK;
import windows.win32.ui.windowsandmessaging : DLGPROC, HICON;

version (Windows):
extern (Windows):

HRESULT ADsGetObject(const(wchar)* lpszPathName, const(GUID)* riid, void** ppObject);
HRESULT ADsBuildEnumerator(IADsContainer pADsContainer, IEnumVARIANT* ppEnumVariant);
HRESULT ADsFreeEnumerator(IEnumVARIANT pEnumVariant);
HRESULT ADsEnumerateNext(IEnumVARIANT pEnumVariant, uint cElements, VARIANT* pvar, uint* pcElementsFetched);
HRESULT ADsBuildVarArrayStr(PWSTR* lppPathNames, uint dwPathNames, VARIANT* pVar);
HRESULT ADsBuildVarArrayInt(uint* lpdwObjectTypes, uint dwObjectTypes, VARIANT* pVar);
HRESULT ADsOpenObject(const(wchar)* lpszPathName, const(wchar)* lpszUserName, const(wchar)* lpszPassword, ADS_AUTHENTICATION_ENUM dwReserved, const(GUID)* riid, void** ppObject);
HRESULT ADsGetLastError(uint* lpError, PWSTR lpErrorBuf, uint dwErrorBufLen, PWSTR lpNameBuf, uint dwNameBufLen);
void ADsSetLastError(uint dwErr, const(wchar)* pszError, const(wchar)* pszProvider);
void* AllocADsMem(uint cb);
BOOL FreeADsMem(void* pMem);
void* ReallocADsMem(void* pOldMem, uint cbOld, uint cbNew);
PWSTR AllocADsStr(const(wchar)* pStr);
BOOL FreeADsStr(PWSTR pStr);
BOOL ReallocADsStr(PWSTR* ppStr, PWSTR pStr);
HRESULT ADsEncodeBinaryData(ubyte* pbSrcData, uint dwSrcLen, PWSTR* ppszDestData);
HRESULT ADsDecodeBinaryData(const(wchar)* szSrcData, ubyte** ppbDestData, uint* pdwDestLen);
HRESULT PropVariantToAdsType(VARIANT* pVariant, uint dwNumVariant, ADSVALUE** ppAdsValues, uint* pdwNumValues);
HRESULT AdsTypeToPropVariant(ADSVALUE* pAdsValues, uint dwNumValues, VARIANT* pVariant);
void AdsFreeAdsValues(ADSVALUE* pAdsValues, uint dwNumValues);
HRESULT BinarySDToSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor, VARIANT* pVarsec, const(wchar)* pszServerName, const(wchar)* userName, const(wchar)* passWord, uint dwFlags);
HRESULT SecurityDescriptorToBinarySD(VARIANT vVarSecDes, PSECURITY_DESCRIPTOR* ppSecurityDescriptor, uint* pdwSDLength, const(wchar)* pszServerName, const(wchar)* userName, const(wchar)* passWord, uint dwFlags);
int DsBrowseForContainerW(DSBROWSEINFOW* pInfo);
int DsBrowseForContainerA(DSBROWSEINFOA* pInfo);
HICON DsGetIcon(uint dwFlags, const(wchar)* pszObjectClass, int cxImage, int cyImage);
HRESULT DsGetFriendlyClassName(const(wchar)* pszObjectClass, PWSTR pszBuffer, uint cchBuffer);
HRESULT ADsPropCreateNotifyObj(IDataObject pAppThdDataObj, PWSTR pwzADsObjName, HWND* phNotifyObj);
BOOL ADsPropGetInitInfo(HWND hNotifyObj, ADSPROPINITPARAMS* pInitParams);
BOOL ADsPropSetHwndWithTitle(HWND hNotifyObj, HWND hPage, byte* ptzTitle);
BOOL ADsPropSetHwnd(HWND hNotifyObj, HWND hPage);
BOOL ADsPropCheckIfWritable(const(wchar)* pwzAttr, const(ADS_ATTR_INFO)* pWritableAttrs);
BOOL ADsPropSendErrorMessage(HWND hNotifyObj, ADSPROPERROR* pError);
BOOL ADsPropShowErrorDialog(HWND hNotifyObj, HWND hPage);
uint DsMakeSpnW(const(wchar)* ServiceClass, const(wchar)* ServiceName, const(wchar)* InstanceName, ushort InstancePort, const(wchar)* Referrer, uint* pcSpnLength, PWSTR pszSpn);
uint DsMakeSpnA(const(char)* ServiceClass, const(char)* ServiceName, const(char)* InstanceName, ushort InstancePort, const(char)* Referrer, uint* pcSpnLength, PSTR pszSpn);
uint DsCrackSpnA(const(char)* pszSpn, uint* pcServiceClass, PSTR ServiceClass, uint* pcServiceName, PSTR ServiceName, uint* pcInstanceName, PSTR InstanceName, ushort* pInstancePort);
uint DsCrackSpnW(const(wchar)* pszSpn, uint* pcServiceClass, PWSTR ServiceClass, uint* pcServiceName, PWSTR ServiceName, uint* pcInstanceName, PWSTR InstanceName, ushort* pInstancePort);
uint DsQuoteRdnValueW(uint cUnquotedRdnValueLength, const(wchar)* psUnquotedRdnValue, uint* pcQuotedRdnValueLength, PWSTR psQuotedRdnValue);
uint DsQuoteRdnValueA(uint cUnquotedRdnValueLength, const(char)* psUnquotedRdnValue, uint* pcQuotedRdnValueLength, PSTR psQuotedRdnValue);
uint DsUnquoteRdnValueW(uint cQuotedRdnValueLength, const(wchar)* psQuotedRdnValue, uint* pcUnquotedRdnValueLength, PWSTR psUnquotedRdnValue);
uint DsUnquoteRdnValueA(uint cQuotedRdnValueLength, const(char)* psQuotedRdnValue, uint* pcUnquotedRdnValueLength, PSTR psUnquotedRdnValue);
uint DsGetRdnW(PWSTR* ppDN, uint* pcDN, PWSTR* ppKey, uint* pcKey, PWSTR* ppVal, uint* pcVal);
BOOL DsCrackUnquotedMangledRdnW(const(wchar)* pszRDN, uint cchRDN, GUID* pGuid, DS_MANGLE_FOR* peDsMangleFor);
BOOL DsCrackUnquotedMangledRdnA(const(char)* pszRDN, uint cchRDN, GUID* pGuid, DS_MANGLE_FOR* peDsMangleFor);
BOOL DsIsMangledRdnValueW(const(wchar)* pszRdn, uint cRdn, DS_MANGLE_FOR eDsMangleForDesired);
BOOL DsIsMangledRdnValueA(const(char)* pszRdn, uint cRdn, DS_MANGLE_FOR eDsMangleForDesired);
BOOL DsIsMangledDnA(const(char)* pszDn, DS_MANGLE_FOR eDsMangleFor);
BOOL DsIsMangledDnW(const(wchar)* pszDn, DS_MANGLE_FOR eDsMangleFor);
uint DsCrackSpn2A(const(char)* pszSpn, uint cSpn, uint* pcServiceClass, PSTR ServiceClass, uint* pcServiceName, PSTR ServiceName, uint* pcInstanceName, PSTR InstanceName, ushort* pInstancePort);
uint DsCrackSpn2W(const(wchar)* pszSpn, uint cSpn, uint* pcServiceClass, PWSTR ServiceClass, uint* pcServiceName, PWSTR ServiceName, uint* pcInstanceName, PWSTR InstanceName, ushort* pInstancePort);
uint DsCrackSpn3W(const(wchar)* pszSpn, uint cSpn, uint* pcHostName, PWSTR HostName, uint* pcInstanceName, PWSTR InstanceName, ushort* pPortNumber, uint* pcDomainName, PWSTR DomainName, uint* pcRealmName, PWSTR RealmName);
uint DsCrackSpn4W(const(wchar)* pszSpn, uint cSpn, uint* pcHostName, PWSTR HostName, uint* pcInstanceName, PWSTR InstanceName, uint* pcPortName, PWSTR PortName, uint* pcDomainName, PWSTR DomainName, uint* pcRealmName, PWSTR RealmName);
uint DsBindW(const(wchar)* DomainControllerName, const(wchar)* DnsDomainName, HANDLE* phDS);
uint DsBindA(const(char)* DomainControllerName, const(char)* DnsDomainName, HANDLE* phDS);
uint DsBindWithCredW(const(wchar)* DomainControllerName, const(wchar)* DnsDomainName, void* AuthIdentity, HANDLE* phDS);
uint DsBindWithCredA(const(char)* DomainControllerName, const(char)* DnsDomainName, void* AuthIdentity, HANDLE* phDS);
uint DsBindWithSpnW(const(wchar)* DomainControllerName, const(wchar)* DnsDomainName, void* AuthIdentity, const(wchar)* ServicePrincipalName, HANDLE* phDS);
uint DsBindWithSpnA(const(char)* DomainControllerName, const(char)* DnsDomainName, void* AuthIdentity, const(char)* ServicePrincipalName, HANDLE* phDS);
uint DsBindWithSpnExW(const(wchar)* DomainControllerName, const(wchar)* DnsDomainName, void* AuthIdentity, const(wchar)* ServicePrincipalName, uint BindFlags, HANDLE* phDS);
uint DsBindWithSpnExA(const(char)* DomainControllerName, const(char)* DnsDomainName, void* AuthIdentity, const(char)* ServicePrincipalName, uint BindFlags, HANDLE* phDS);
uint DsBindByInstanceW(const(wchar)* ServerName, const(wchar)* Annotation, GUID* InstanceGuid, const(wchar)* DnsDomainName, void* AuthIdentity, const(wchar)* ServicePrincipalName, uint BindFlags, HANDLE* phDS);
uint DsBindByInstanceA(const(char)* ServerName, const(char)* Annotation, GUID* InstanceGuid, const(char)* DnsDomainName, void* AuthIdentity, const(char)* ServicePrincipalName, uint BindFlags, HANDLE* phDS);
uint DsBindToISTGW(const(wchar)* SiteName, HANDLE* phDS);
uint DsBindToISTGA(const(char)* SiteName, HANDLE* phDS);
uint DsBindingSetTimeout(HANDLE hDS, uint cTimeoutSecs);
uint DsUnBindW(HANDLE* phDS);
uint DsUnBindA(HANDLE* phDS);
uint DsMakePasswordCredentialsW(const(wchar)* User, const(wchar)* Domain, const(wchar)* Password, void** pAuthIdentity);
uint DsMakePasswordCredentialsA(const(char)* User, const(char)* Domain, const(char)* Password, void** pAuthIdentity);
void DsFreePasswordCredentials(void* AuthIdentity);
uint DsCrackNamesW(HANDLE hDS, DS_NAME_FLAGS flags, DS_NAME_FORMAT formatOffered, DS_NAME_FORMAT formatDesired, uint cNames, const(wchar)** rpNames, DS_NAME_RESULTW** ppResult);
uint DsCrackNamesA(HANDLE hDS, DS_NAME_FLAGS flags, DS_NAME_FORMAT formatOffered, DS_NAME_FORMAT formatDesired, uint cNames, const(char)** rpNames, DS_NAME_RESULTA** ppResult);
void DsFreeNameResultW(DS_NAME_RESULTW* pResult);
void DsFreeNameResultA(DS_NAME_RESULTA* pResult);
uint DsGetSpnA(DS_SPN_NAME_TYPE ServiceType, const(char)* ServiceClass, const(char)* ServiceName, ushort InstancePort, ushort cInstanceNames, const(char)** pInstanceNames, const(ushort)* pInstancePorts, uint* pcSpn, PSTR** prpszSpn);
uint DsGetSpnW(DS_SPN_NAME_TYPE ServiceType, const(wchar)* ServiceClass, const(wchar)* ServiceName, ushort InstancePort, ushort cInstanceNames, const(wchar)** pInstanceNames, const(ushort)* pInstancePorts, uint* pcSpn, PWSTR** prpszSpn);
void DsFreeSpnArrayA(uint cSpn, PSTR* rpszSpn);
void DsFreeSpnArrayW(uint cSpn, PWSTR* rpszSpn);
uint DsWriteAccountSpnA(HANDLE hDS, DS_SPN_WRITE_OP Operation, const(char)* pszAccount, uint cSpn, const(char)** rpszSpn);
uint DsWriteAccountSpnW(HANDLE hDS, DS_SPN_WRITE_OP Operation, const(wchar)* pszAccount, uint cSpn, const(wchar)** rpszSpn);
uint DsClientMakeSpnForTargetServerW(const(wchar)* ServiceClass, const(wchar)* ServiceName, uint* pcSpnLength, PWSTR pszSpn);
uint DsClientMakeSpnForTargetServerA(const(char)* ServiceClass, const(char)* ServiceName, uint* pcSpnLength, PSTR pszSpn);
uint DsServerRegisterSpnA(DS_SPN_WRITE_OP Operation, const(char)* ServiceClass, const(char)* UserObjectDN);
uint DsServerRegisterSpnW(DS_SPN_WRITE_OP Operation, const(wchar)* ServiceClass, const(wchar)* UserObjectDN);
uint DsReplicaSyncA(HANDLE hDS, const(char)* NameContext, const(GUID)* pUuidDsaSrc, uint Options);
uint DsReplicaSyncW(HANDLE hDS, const(wchar)* NameContext, const(GUID)* pUuidDsaSrc, uint Options);
uint DsReplicaAddA(HANDLE hDS, const(char)* NameContext, const(char)* SourceDsaDn, const(char)* TransportDn, const(char)* SourceDsaAddress, const(SCHEDULE)* pSchedule, uint Options);
uint DsReplicaAddW(HANDLE hDS, const(wchar)* NameContext, const(wchar)* SourceDsaDn, const(wchar)* TransportDn, const(wchar)* SourceDsaAddress, const(SCHEDULE)* pSchedule, uint Options);
uint DsReplicaDelA(HANDLE hDS, const(char)* NameContext, const(char)* DsaSrc, uint Options);
uint DsReplicaDelW(HANDLE hDS, const(wchar)* NameContext, const(wchar)* DsaSrc, uint Options);
uint DsReplicaModifyA(HANDLE hDS, const(char)* NameContext, const(GUID)* pUuidSourceDsa, const(char)* TransportDn, const(char)* SourceDsaAddress, const(SCHEDULE)* pSchedule, uint ReplicaFlags, uint ModifyFields, uint Options);
uint DsReplicaModifyW(HANDLE hDS, const(wchar)* NameContext, const(GUID)* pUuidSourceDsa, const(wchar)* TransportDn, const(wchar)* SourceDsaAddress, const(SCHEDULE)* pSchedule, uint ReplicaFlags, uint ModifyFields, uint Options);
uint DsReplicaUpdateRefsA(HANDLE hDS, const(char)* NameContext, const(char)* DsaDest, const(GUID)* pUuidDsaDest, uint Options);
uint DsReplicaUpdateRefsW(HANDLE hDS, const(wchar)* NameContext, const(wchar)* DsaDest, const(GUID)* pUuidDsaDest, uint Options);
uint DsReplicaSyncAllA(HANDLE hDS, const(char)* pszNameContext, uint ulFlags, long pFnCallBack, void* pCallbackData, DS_REPSYNCALL_ERRINFOA*** pErrors);
uint DsReplicaSyncAllW(HANDLE hDS, const(wchar)* pszNameContext, uint ulFlags, long pFnCallBack, void* pCallbackData, DS_REPSYNCALL_ERRINFOW*** pErrors);
uint DsRemoveDsServerW(HANDLE hDs, PWSTR ServerDN, PWSTR DomainDN, BOOL* fLastDcInDomain, BOOL fCommit);
uint DsRemoveDsServerA(HANDLE hDs, PSTR ServerDN, PSTR DomainDN, BOOL* fLastDcInDomain, BOOL fCommit);
uint DsRemoveDsDomainW(HANDLE hDs, PWSTR DomainDN);
uint DsRemoveDsDomainA(HANDLE hDs, PSTR DomainDN);
uint DsListSitesA(HANDLE hDs, DS_NAME_RESULTA** ppSites);
uint DsListSitesW(HANDLE hDs, DS_NAME_RESULTW** ppSites);
uint DsListServersInSiteA(HANDLE hDs, const(char)* site, DS_NAME_RESULTA** ppServers);
uint DsListServersInSiteW(HANDLE hDs, const(wchar)* site, DS_NAME_RESULTW** ppServers);
uint DsListDomainsInSiteA(HANDLE hDs, const(char)* site, DS_NAME_RESULTA** ppDomains);
uint DsListDomainsInSiteW(HANDLE hDs, const(wchar)* site, DS_NAME_RESULTW** ppDomains);
uint DsListServersForDomainInSiteA(HANDLE hDs, const(char)* domain, const(char)* site, DS_NAME_RESULTA** ppServers);
uint DsListServersForDomainInSiteW(HANDLE hDs, const(wchar)* domain, const(wchar)* site, DS_NAME_RESULTW** ppServers);
uint DsListInfoForServerA(HANDLE hDs, const(char)* server, DS_NAME_RESULTA** ppInfo);
uint DsListInfoForServerW(HANDLE hDs, const(wchar)* server, DS_NAME_RESULTW** ppInfo);
uint DsListRolesA(HANDLE hDs, DS_NAME_RESULTA** ppRoles);
uint DsListRolesW(HANDLE hDs, DS_NAME_RESULTW** ppRoles);
uint DsQuerySitesByCostW(HANDLE hDS, PWSTR pwszFromSite, PWSTR* rgwszToSites, uint cToSites, uint dwFlags, DS_SITE_COST_INFO** prgSiteInfo);
uint DsQuerySitesByCostA(HANDLE hDS, PSTR pszFromSite, PSTR* rgszToSites, uint cToSites, uint dwFlags, DS_SITE_COST_INFO** prgSiteInfo);
void DsQuerySitesFree(DS_SITE_COST_INFO* rgSiteInfo);
uint DsMapSchemaGuidsA(HANDLE hDs, uint cGuids, GUID* rGuids, DS_SCHEMA_GUID_MAPA** ppGuidMap);
void DsFreeSchemaGuidMapA(DS_SCHEMA_GUID_MAPA* pGuidMap);
uint DsMapSchemaGuidsW(HANDLE hDs, uint cGuids, GUID* rGuids, DS_SCHEMA_GUID_MAPW** ppGuidMap);
void DsFreeSchemaGuidMapW(DS_SCHEMA_GUID_MAPW* pGuidMap);
uint DsGetDomainControllerInfoA(HANDLE hDs, const(char)* DomainName, uint InfoLevel, uint* pcOut, void** ppInfo);
uint DsGetDomainControllerInfoW(HANDLE hDs, const(wchar)* DomainName, uint InfoLevel, uint* pcOut, void** ppInfo);
void DsFreeDomainControllerInfoA(uint InfoLevel, uint cInfo, void* pInfo);
void DsFreeDomainControllerInfoW(uint InfoLevel, uint cInfo, void* pInfo);
uint DsReplicaConsistencyCheck(HANDLE hDS, DS_KCC_TASKID TaskID, uint dwFlags);
uint DsReplicaVerifyObjectsW(HANDLE hDS, const(wchar)* NameContext, const(GUID)* pUuidDsaSrc, uint ulOptions);
uint DsReplicaVerifyObjectsA(HANDLE hDS, const(char)* NameContext, const(GUID)* pUuidDsaSrc, uint ulOptions);
uint DsReplicaGetInfoW(HANDLE hDS, DS_REPL_INFO_TYPE InfoType, const(wchar)* pszObject, GUID* puuidForSourceDsaObjGuid, void** ppInfo);
uint DsReplicaGetInfo2W(HANDLE hDS, DS_REPL_INFO_TYPE InfoType, const(wchar)* pszObject, GUID* puuidForSourceDsaObjGuid, const(wchar)* pszAttributeName, const(wchar)* pszValue, uint dwFlags, uint dwEnumerationContext, void** ppInfo);
void DsReplicaFreeInfo(DS_REPL_INFO_TYPE InfoType, void* pInfo);
uint DsAddSidHistoryW(HANDLE hDS, uint Flags, const(wchar)* SrcDomain, const(wchar)* SrcPrincipal, const(wchar)* SrcDomainController, void* SrcDomainCreds, const(wchar)* DstDomain, const(wchar)* DstPrincipal);
uint DsAddSidHistoryA(HANDLE hDS, uint Flags, const(char)* SrcDomain, const(char)* SrcPrincipal, const(char)* SrcDomainController, void* SrcDomainCreds, const(char)* DstDomain, const(char)* DstPrincipal);
uint DsInheritSecurityIdentityW(HANDLE hDS, uint Flags, const(wchar)* SrcPrincipal, const(wchar)* DstPrincipal);
uint DsInheritSecurityIdentityA(HANDLE hDS, uint Flags, const(char)* SrcPrincipal, const(char)* DstPrincipal);
uint DsRoleGetPrimaryDomainInformation(const(wchar)* lpServer, DSROLE_PRIMARY_DOMAIN_INFO_LEVEL InfoLevel, ubyte** Buffer);
void DsRoleFreeMemory(void* Buffer);
uint DsGetDcNameA(const(char)* ComputerName, const(char)* DomainName, GUID* DomainGuid, const(char)* SiteName, uint Flags, DOMAIN_CONTROLLER_INFOA** DomainControllerInfo);
uint DsGetDcNameW(const(wchar)* ComputerName, const(wchar)* DomainName, GUID* DomainGuid, const(wchar)* SiteName, uint Flags, DOMAIN_CONTROLLER_INFOW** DomainControllerInfo);
uint DsGetSiteNameA(const(char)* ComputerName, PSTR* SiteName);
uint DsGetSiteNameW(const(wchar)* ComputerName, PWSTR* SiteName);
uint DsValidateSubnetNameW(const(wchar)* SubnetName);
uint DsValidateSubnetNameA(const(char)* SubnetName);
uint DsAddressToSiteNamesW(const(wchar)* ComputerName, uint EntryCount, SOCKET_ADDRESS* SocketAddresses, PWSTR** SiteNames);
uint DsAddressToSiteNamesA(const(char)* ComputerName, uint EntryCount, SOCKET_ADDRESS* SocketAddresses, PSTR** SiteNames);
uint DsAddressToSiteNamesExW(const(wchar)* ComputerName, uint EntryCount, SOCKET_ADDRESS* SocketAddresses, PWSTR** SiteNames, PWSTR** SubnetNames);
uint DsAddressToSiteNamesExA(const(char)* ComputerName, uint EntryCount, SOCKET_ADDRESS* SocketAddresses, PSTR** SiteNames, PSTR** SubnetNames);
uint DsEnumerateDomainTrustsW(PWSTR ServerName, uint Flags, DS_DOMAIN_TRUSTSW** Domains, uint* DomainCount);
uint DsEnumerateDomainTrustsA(PSTR ServerName, uint Flags, DS_DOMAIN_TRUSTSA** Domains, uint* DomainCount);
uint DsGetForestTrustInformationW(const(wchar)* ServerName, const(wchar)* TrustedDomainName, uint Flags, LSA_FOREST_TRUST_INFORMATION** ForestTrustInfo);
uint DsMergeForestTrustInformationW(const(wchar)* DomainName, LSA_FOREST_TRUST_INFORMATION* NewForestTrustInfo, LSA_FOREST_TRUST_INFORMATION* OldForestTrustInfo, LSA_FOREST_TRUST_INFORMATION** MergedForestTrustInfo);
uint DsGetDcSiteCoverageW(const(wchar)* ServerName, uint* EntryCount, PWSTR** SiteNames);
uint DsGetDcSiteCoverageA(const(char)* ServerName, uint* EntryCount, PSTR** SiteNames);
uint DsDeregisterDnsHostRecordsW(PWSTR ServerName, PWSTR DnsDomainName, GUID* DomainGuid, GUID* DsaGuid, PWSTR DnsHostName);
uint DsDeregisterDnsHostRecordsA(PSTR ServerName, PSTR DnsDomainName, GUID* DomainGuid, GUID* DsaGuid, PSTR DnsHostName);
uint DsGetDcOpenW(const(wchar)* DnsName, uint OptionFlags, const(wchar)* SiteName, GUID* DomainGuid, const(wchar)* DnsForestName, uint DcFlags, HANDLE* RetGetDcContext);
uint DsGetDcOpenA(const(char)* DnsName, uint OptionFlags, const(char)* SiteName, GUID* DomainGuid, const(char)* DnsForestName, uint DcFlags, HANDLE* RetGetDcContext);
uint DsGetDcNextW(HANDLE GetDcContextHandle, uint* SockAddressCount, SOCKET_ADDRESS** SockAddresses, PWSTR* DnsHostName);
uint DsGetDcNextA(HANDLE GetDcContextHandle, uint* SockAddressCount, SOCKET_ADDRESS** SockAddresses, PSTR* DnsHostName);
void DsGetDcCloseW(HANDLE GetDcContextHandle);
enum WM_ADSPROP_NOTIFY_PAGEINIT = 0x0000084d;
enum WM_ADSPROP_NOTIFY_PAGEHWND = 0x0000084e;
enum WM_ADSPROP_NOTIFY_CHANGE = 0x0000084f;
enum WM_ADSPROP_NOTIFY_APPLY = 0x00000850;
enum WM_ADSPROP_NOTIFY_SETFOCUS = 0x00000851;
enum WM_ADSPROP_NOTIFY_FOREGROUND = 0x00000852;
enum WM_ADSPROP_NOTIFY_EXIT = 0x00000853;
enum WM_ADSPROP_NOTIFY_ERROR = 0x00000856;
enum CLSID_CommonQuery = GUID(0x83bc5ec0, 0x6f2a, 0x11d0, [0xa1, 0xc4, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum QUERYFORM_CHANGESFORMLIST = 0x0000000000000001;
enum QUERYFORM_CHANGESOPTFORMLIST = 0x0000000000000002;
enum CQFF_NOGLOBALPAGES = 0x00000001;
enum CQFF_ISOPTIONAL = 0x00000002;
enum CQPM_INITIALIZE = 0x00000001;
enum CQPM_RELEASE = 0x00000002;
enum CQPM_ENABLE = 0x00000003;
enum CQPM_GETPARAMETERS = 0x00000005;
enum CQPM_CLEARFORM = 0x00000006;
enum CQPM_PERSIST = 0x00000007;
enum CQPM_HELP = 0x00000008;
enum CQPM_SETDEFAULTPARAMETERS = 0x00000009;
enum CQPM_HANDLERSPECIFIC = 0x10000000;
enum OQWF_OKCANCEL = 0x00000001;
enum OQWF_DEFAULTFORM = 0x00000002;
enum OQWF_SINGLESELECT = 0x00000004;
enum OQWF_LOADQUERY = 0x00000008;
enum OQWF_REMOVESCOPES = 0x00000010;
enum OQWF_REMOVEFORMS = 0x00000020;
enum OQWF_ISSUEONOPEN = 0x00000040;
enum OQWF_SHOWOPTIONAL = 0x00000080;
enum OQWF_SAVEQUERYONOK = 0x00000200;
enum OQWF_HIDEMENUS = 0x00000400;
enum OQWF_HIDESEARCHUI = 0x00000800;
enum OQWF_PARAMISPROPERTYBAG = 0x80000000;
enum CLSID_DsAdminCreateObj = GUID(0xe301a009, 0xf901, 0x11d2, [0x82, 0xb9, 0x0, 0xc0, 0x4f, 0x68, 0x92, 0x8b]);
enum DSA_NEWOBJ_CTX_PRECOMMIT = 0x00000001;
enum DSA_NEWOBJ_CTX_COMMIT = 0x00000002;
enum DSA_NEWOBJ_CTX_POSTCOMMIT = 0x00000003;
enum DSA_NEWOBJ_CTX_CLEANUP = 0x00000004;
enum DSA_NOTIFY_DEL = 0x00000001;
enum DSA_NOTIFY_REN = 0x00000002;
enum DSA_NOTIFY_MOV = 0x00000004;
enum DSA_NOTIFY_PROP = 0x00000008;
enum DSA_NOTIFY_FLAG_ADDITIONAL_DATA = 0x00000002;
enum DSA_NOTIFY_FLAG_FORCE_ADDITIONAL_DATA = 0x00000001;
enum CLSID_MicrosoftDS = GUID(0xfe1290f0, 0xcfbd, 0x11cf, [0xa3, 0x30, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsPropertyPages = GUID(0xd45d530, 0x764b, 0x11d0, [0xa1, 0xca, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsDomainTreeBrowser = GUID(0x1698790a, 0xe2b4, 0x11d0, [0xb0, 0xb1, 0x0, 0xc0, 0x4f, 0xd8, 0xdc, 0xa6]);
enum CLSID_DsDisplaySpecifier = GUID(0x1ab4a8c0, 0x6a0b, 0x11d2, [0xad, 0x49, 0x0, 0xc0, 0x4f, 0xa3, 0x1a, 0x86]);
enum CLSID_DsFolderProperties = GUID(0x9e51e0d0, 0x6e0f, 0x11d2, [0x96, 0x1, 0x0, 0xc0, 0x4f, 0xa3, 0x1a, 0x86]);
enum DSOBJECT_ISCONTAINER = 0x00000001;
enum DSOBJECT_READONLYPAGES = 0x80000000;
enum DSPROVIDER_UNUSED_0 = 0x00000001;
enum DSPROVIDER_UNUSED_1 = 0x00000002;
enum DSPROVIDER_UNUSED_2 = 0x00000004;
enum DSPROVIDER_UNUSED_3 = 0x00000008;
enum DSPROVIDER_ADVANCED = 0x00000010;
enum DSPROVIDER_AD_LDS = 0x00000020;
enum CFSTR_DSOBJECTNAMES = "DsObjectNames";
enum CFSTR_DS_DISPLAY_SPEC_OPTIONS = "DsDisplaySpecOptions";
enum CFSTR_DSDISPLAYSPECOPTIONS = "DsDisplaySpecOptions";
enum DS_PROP_SHELL_PREFIX = "shell";
enum DS_PROP_ADMIN_PREFIX = "admin";
enum DSDSOF_HASUSERANDSERVERINFO = 0x00000001;
enum DSDSOF_SIMPLEAUTHENTICATE = 0x00000002;
enum DSDSOF_DONTSIGNSEAL = 0x00000004;
enum DSDSOF_DSAVAILABLE = 0x40000000;
enum CFSTR_DSPROPERTYPAGEINFO = "DsPropPageInfo";
enum DSPROP_ATTRCHANGED_MSG = "DsPropAttrChanged";
enum DBDTF_RETURNFQDN = 0x00000001;
enum DBDTF_RETURNMIXEDDOMAINS = 0x00000002;
enum DBDTF_RETURNEXTERNAL = 0x00000004;
enum DBDTF_RETURNINBOUND = 0x00000008;
enum DBDTF_RETURNINOUTBOUND = 0x00000010;
enum DSSSF_SIMPLEAUTHENTICATE = 0x00000001;
enum DSSSF_DONTSIGNSEAL = 0x00000002;
enum DSSSF_DSAVAILABLE = 0x80000000;
enum DSGIF_ISNORMAL = 0x00000000;
enum DSGIF_ISOPEN = 0x00000001;
enum DSGIF_ISDISABLED = 0x00000002;
enum DSGIF_ISMASK = 0x0000000f;
enum DSGIF_GETDEFAULTICON = 0x00000010;
enum DSGIF_DEFAULTISCONTAINER = 0x00000020;
enum DSICCF_IGNORETREATASLEAF = 0x00000001;
enum DSECAF_NOTLISTED = 0x00000001;
enum DSCCIF_HASWIZARDDIALOG = 0x00000001;
enum DSCCIF_HASWIZARDPRIMARYPAGE = 0x00000002;
enum DSBI_NOBUTTONS = 0x00000001;
enum DSBI_NOLINES = 0x00000002;
enum DSBI_NOLINESATROOT = 0x00000004;
enum DSBI_CHECKBOXES = 0x00000100;
enum DSBI_NOROOT = 0x00010000;
enum DSBI_INCLUDEHIDDEN = 0x00020000;
enum DSBI_EXPANDONOPEN = 0x00040000;
enum DSBI_ENTIREDIRECTORY = 0x00090000;
enum DSBI_RETURN_FORMAT = 0x00100000;
enum DSBI_HASCREDENTIALS = 0x00200000;
enum DSBI_IGNORETREATASLEAF = 0x00400000;
enum DSBI_SIMPLEAUTHENTICATE = 0x00800000;
enum DSBI_RETURNOBJECTCLASS = 0x01000000;
enum DSBI_DONTSIGNSEAL = 0x02000000;
enum DSB_MAX_DISPLAYNAME_CHARS = 0x00000040;
enum DSBF_STATE = 0x00000001;
enum DSBF_ICONLOCATION = 0x00000002;
enum DSBF_DISPLAYNAME = 0x00000004;
enum DSBS_CHECKED = 0x00000001;
enum DSBS_HIDDEN = 0x00000002;
enum DSBS_ROOT = 0x00000004;
enum DSBM_QUERYINSERTW = 0x00000064;
enum DSBM_QUERYINSERTA = 0x00000065;
enum DSBM_QUERYINSERT = 0x00000064;
enum DSBM_CHANGEIMAGESTATE = 0x00000066;
enum DSBM_HELP = 0x00000067;
enum DSBM_CONTEXTMENU = 0x00000068;
enum DSBID_BANNER = 0x00000100;
enum DSBID_CONTAINERLIST = 0x00000101;
enum DS_FORCE_REDISCOVERY = 0x00000001;
enum DS_DIRECTORY_SERVICE_REQUIRED = 0x00000010;
enum DS_DIRECTORY_SERVICE_PREFERRED = 0x00000020;
enum DS_GC_SERVER_REQUIRED = 0x00000040;
enum DS_PDC_REQUIRED = 0x00000080;
enum DS_BACKGROUND_ONLY = 0x00000100;
enum DS_IP_REQUIRED = 0x00000200;
enum DS_KDC_REQUIRED = 0x00000400;
enum DS_TIMESERV_REQUIRED = 0x00000800;
enum DS_WRITABLE_REQUIRED = 0x00001000;
enum DS_GOOD_TIMESERV_PREFERRED = 0x00002000;
enum DS_AVOID_SELF = 0x00004000;
enum DS_ONLY_LDAP_NEEDED = 0x00008000;
enum DS_IS_FLAT_NAME = 0x00010000;
enum DS_IS_DNS_NAME = 0x00020000;
enum DS_TRY_NEXTCLOSEST_SITE = 0x00040000;
enum DS_DIRECTORY_SERVICE_6_REQUIRED = 0x00080000;
enum DS_WEB_SERVICE_REQUIRED = 0x00100000;
enum DS_DIRECTORY_SERVICE_8_REQUIRED = 0x00200000;
enum DS_DIRECTORY_SERVICE_9_REQUIRED = 0x00400000;
enum DS_DIRECTORY_SERVICE_10_REQUIRED = 0x00800000;
enum DS_KEY_LIST_SUPPORT_REQUIRED = 0x01000000;
enum DS_RETURN_DNS_NAME = 0x40000000;
enum DS_RETURN_FLAT_NAME = 0x80000000;
enum DS_PDC_FLAG = 0x00000001;
enum DS_GC_FLAG = 0x00000004;
enum DS_LDAP_FLAG = 0x00000008;
enum DS_DS_FLAG = 0x00000010;
enum DS_KDC_FLAG = 0x00000020;
enum DS_TIMESERV_FLAG = 0x00000040;
enum DS_CLOSEST_FLAG = 0x00000080;
enum DS_WRITABLE_FLAG = 0x00000100;
enum DS_GOOD_TIMESERV_FLAG = 0x00000200;
enum DS_NDNC_FLAG = 0x00000400;
enum DS_SELECT_SECRET_DOMAIN_6_FLAG = 0x00000800;
enum DS_FULL_SECRET_DOMAIN_6_FLAG = 0x00001000;
enum DS_WS_FLAG = 0x00002000;
enum DS_DS_8_FLAG = 0x00004000;
enum DS_DS_9_FLAG = 0x00008000;
enum DS_DS_10_FLAG = 0x00010000;
enum DS_KEY_LIST_FLAG = 0x00020000;
enum DS_PING_FLAGS = 0x000fffff;
enum DS_DNS_CONTROLLER_FLAG = 0x20000000;
enum DS_DNS_DOMAIN_FLAG = 0x40000000;
enum DS_DNS_FOREST_FLAG = 0x80000000;
enum DS_DOMAIN_IN_FOREST = 0x00000001;
enum DS_DOMAIN_DIRECT_OUTBOUND = 0x00000002;
enum DS_DOMAIN_TREE_ROOT = 0x00000004;
enum DS_DOMAIN_PRIMARY = 0x00000008;
enum DS_DOMAIN_NATIVE_MODE = 0x00000010;
enum DS_DOMAIN_DIRECT_INBOUND = 0x00000020;
enum DS_GFTI_UPDATE_TDO = 0x00000001;
enum DS_GFTI_VALID_FLAGS = 0x00000001;
enum DS_ONLY_DO_SITE_NAME = 0x00000001;
enum DS_NOTIFY_AFTER_SITE_RECORDS = 0x00000002;
enum CLSID_DsQuery = GUID(0x8a23e65e, 0x31c2, 0x11d0, [0x89, 0x1c, 0x0, 0xa0, 0x24, 0xab, 0x2d, 0xbb]);
enum CLSID_DsFindObjects = GUID(0x83ee3fe1, 0x57d9, 0x11d0, [0xb9, 0x32, 0x0, 0xa0, 0x24, 0xab, 0x2d, 0xbb]);
enum CLSID_DsFindPeople = GUID(0x83ee3fe2, 0x57d9, 0x11d0, [0xb9, 0x32, 0x0, 0xa0, 0x24, 0xab, 0x2d, 0xbb]);
enum CLSID_DsFindPrinter = GUID(0xb577f070, 0x7ee2, 0x11d0, [0x91, 0x3f, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsFindComputer = GUID(0x16006700, 0x87ad, 0x11d0, [0x91, 0x40, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsFindVolume = GUID(0xc1b3cbf1, 0x886a, 0x11d0, [0x91, 0x40, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsFindContainer = GUID(0xc1b3cbf2, 0x886a, 0x11d0, [0x91, 0x40, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
enum CLSID_DsFindAdvanced = GUID(0x83ee3fe3, 0x57d9, 0x11d0, [0xb9, 0x32, 0x0, 0xa0, 0x24, 0xab, 0x2d, 0xbb]);
enum CLSID_DsFindDomainController = GUID(0x538c7b7e, 0xd25e, 0x11d0, [0x97, 0x42, 0x0, 0xa0, 0xc9, 0x6, 0xaf, 0x45]);
enum CLSID_DsFindWriteableDomainController = GUID(0x7cbef079, 0xaa84, 0x444b, [0xbc, 0x70, 0x68, 0xe4, 0x12, 0x83, 0xea, 0xbc]);
enum CLSID_DsFindFrsMembers = GUID(0x94ce4b18, 0xb3d3, 0x11d1, [0xb9, 0xb4, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0xb0]);
enum DSQPF_NOSAVE = 0x00000001;
enum DSQPF_SAVELOCATION = 0x00000002;
enum DSQPF_SHOWHIDDENOBJECTS = 0x00000004;
enum DSQPF_ENABLEADMINFEATURES = 0x00000008;
enum DSQPF_ENABLEADVANCEDFEATURES = 0x00000010;
enum DSQPF_HASCREDENTIALS = 0x00000020;
enum DSQPF_NOCHOOSECOLUMNS = 0x00000040;
enum CFSTR_DSQUERYPARAMS = "DsQueryParameters";
enum CFSTR_DSQUERYSCOPE = "DsQueryScope";
enum DSQPM_GETCLASSLIST = 0x10000000;
enum DSQPM_HELPTOPICS = 0x10000001;
enum DSROLE_PRIMARY_DS_RUNNING = 0x00000001;
enum DSROLE_PRIMARY_DS_MIXED_MODE = 0x00000002;
enum DSROLE_UPGRADE_IN_PROGRESS = 0x00000004;
enum DSROLE_PRIMARY_DS_READONLY = 0x00000008;
enum DSROLE_PRIMARY_DOMAIN_GUID_PRESENT = 0x01000000;
enum ADS_ATTR_CLEAR = 0x00000001;
enum ADS_ATTR_UPDATE = 0x00000002;
enum ADS_ATTR_APPEND = 0x00000003;
enum ADS_ATTR_DELETE = 0x00000004;
enum ADS_EXT_MINEXTDISPID = 0x00000001;
enum ADS_EXT_MAXEXTDISPID = 0x00ffffff;
enum ADS_EXT_INITCREDENTIALS = 0x00000001;
enum ADS_EXT_INITIALIZE_COMPLETE = 0x00000002;
enum DS_BEHAVIOR_WIN2000 = 0x00000000;
enum DS_BEHAVIOR_WIN2003_WITH_MIXED_DOMAINS = 0x00000001;
enum DS_BEHAVIOR_WIN2003 = 0x00000002;
enum DS_BEHAVIOR_WIN2008 = 0x00000003;
enum DS_BEHAVIOR_WIN2008R2 = 0x00000004;
enum DS_BEHAVIOR_WIN2012 = 0x00000005;
enum DS_BEHAVIOR_WIN2012R2 = 0x00000006;
enum DS_BEHAVIOR_WIN2016 = 0x00000007;
enum DS_BEHAVIOR_LONGHORN = 0x00000003;
enum DS_BEHAVIOR_WIN7 = 0x00000004;
enum DS_BEHAVIOR_WIN8 = 0x00000005;
enum DS_BEHAVIOR_WINBLUE = 0x00000006;
enum DS_BEHAVIOR_WINTHRESHOLD = 0x00000007;
enum DS_SYNCED_EVENT_NAME = "NTDSInitialSyncsCompleted";
enum DS_SYNCED_EVENT_NAME_W = "NTDSInitialSyncsCompleted";
enum ACTRL_DS_OPEN = 0x00000000;
enum ACTRL_DS_CREATE_CHILD = 0x00000001;
enum ACTRL_DS_DELETE_CHILD = 0x00000002;
enum ACTRL_DS_LIST = 0x00000004;
enum ACTRL_DS_SELF = 0x00000008;
enum ACTRL_DS_READ_PROP = 0x00000010;
enum ACTRL_DS_WRITE_PROP = 0x00000020;
enum ACTRL_DS_DELETE_TREE = 0x00000040;
enum ACTRL_DS_LIST_OBJECT = 0x00000080;
enum ACTRL_DS_CONTROL_ACCESS = 0x00000100;
enum NTDSAPI_BIND_ALLOW_DELEGATION = 0x00000001;
enum NTDSAPI_BIND_FIND_BINDING = 0x00000002;
enum NTDSAPI_BIND_FORCE_KERBEROS = 0x00000004;
enum DS_REPSYNC_ASYNCHRONOUS_OPERATION = 0x00000001;
enum DS_REPSYNC_WRITEABLE = 0x00000002;
enum DS_REPSYNC_PERIODIC = 0x00000004;
enum DS_REPSYNC_INTERSITE_MESSAGING = 0x00000008;
enum DS_REPSYNC_FULL = 0x00000020;
enum DS_REPSYNC_URGENT = 0x00000040;
enum DS_REPSYNC_NO_DISCARD = 0x00000080;
enum DS_REPSYNC_FORCE = 0x00000100;
enum DS_REPSYNC_ADD_REFERENCE = 0x00000200;
enum DS_REPSYNC_NEVER_COMPLETED = 0x00000400;
enum DS_REPSYNC_TWO_WAY = 0x00000800;
enum DS_REPSYNC_NEVER_NOTIFY = 0x00001000;
enum DS_REPSYNC_INITIAL = 0x00002000;
enum DS_REPSYNC_USE_COMPRESSION = 0x00004000;
enum DS_REPSYNC_ABANDONED = 0x00008000;
enum DS_REPSYNC_SELECT_SECRETS = 0x00008000;
enum DS_REPSYNC_INITIAL_IN_PROGRESS = 0x00010000;
enum DS_REPSYNC_PARTIAL_ATTRIBUTE_SET = 0x00020000;
enum DS_REPSYNC_REQUEUE = 0x00040000;
enum DS_REPSYNC_NOTIFICATION = 0x00080000;
enum DS_REPSYNC_ASYNCHRONOUS_REPLICA = 0x00100000;
enum DS_REPSYNC_CRITICAL = 0x00200000;
enum DS_REPSYNC_FULL_IN_PROGRESS = 0x00400000;
enum DS_REPSYNC_PREEMPTED = 0x00800000;
enum DS_REPSYNC_NONGC_RO_REPLICA = 0x01000000;
enum DS_REPADD_ASYNCHRONOUS_OPERATION = 0x00000001;
enum DS_REPADD_WRITEABLE = 0x00000002;
enum DS_REPADD_INITIAL = 0x00000004;
enum DS_REPADD_PERIODIC = 0x00000008;
enum DS_REPADD_INTERSITE_MESSAGING = 0x00000010;
enum DS_REPADD_ASYNCHRONOUS_REPLICA = 0x00000020;
enum DS_REPADD_DISABLE_NOTIFICATION = 0x00000040;
enum DS_REPADD_DISABLE_PERIODIC = 0x00000080;
enum DS_REPADD_USE_COMPRESSION = 0x00000100;
enum DS_REPADD_NEVER_NOTIFY = 0x00000200;
enum DS_REPADD_TWO_WAY = 0x00000400;
enum DS_REPADD_CRITICAL = 0x00000800;
enum DS_REPADD_SELECT_SECRETS = 0x00001000;
enum DS_REPADD_NONGC_RO_REPLICA = 0x01000000;
enum DS_REPDEL_ASYNCHRONOUS_OPERATION = 0x00000001;
enum DS_REPDEL_WRITEABLE = 0x00000002;
enum DS_REPDEL_INTERSITE_MESSAGING = 0x00000004;
enum DS_REPDEL_IGNORE_ERRORS = 0x00000008;
enum DS_REPDEL_LOCAL_ONLY = 0x00000010;
enum DS_REPDEL_NO_SOURCE = 0x00000020;
enum DS_REPDEL_REF_OK = 0x00000040;
enum DS_REPMOD_ASYNCHRONOUS_OPERATION = 0x00000001;
enum DS_REPMOD_WRITEABLE = 0x00000002;
enum DS_REPMOD_UPDATE_FLAGS = 0x00000001;
enum DS_REPMOD_UPDATE_INSTANCE = 0x00000002;
enum DS_REPMOD_UPDATE_ADDRESS = 0x00000002;
enum DS_REPMOD_UPDATE_SCHEDULE = 0x00000004;
enum DS_REPMOD_UPDATE_RESULT = 0x00000008;
enum DS_REPMOD_UPDATE_TRANSPORT = 0x00000010;
enum DS_REPUPD_ASYNCHRONOUS_OPERATION = 0x00000001;
enum DS_REPUPD_WRITEABLE = 0x00000002;
enum DS_REPUPD_ADD_REFERENCE = 0x00000004;
enum DS_REPUPD_DELETE_REFERENCE = 0x00000008;
enum DS_REPUPD_REFERENCE_GCSPN = 0x00000010;
enum DS_INSTANCETYPE_IS_NC_HEAD = 0x00000001;
enum DS_INSTANCETYPE_NC_IS_WRITEABLE = 0x00000004;
enum DS_INSTANCETYPE_NC_COMING = 0x00000010;
enum DS_INSTANCETYPE_NC_GOING = 0x00000020;
enum NTDSDSA_OPT_IS_GC = 0x00000001;
enum NTDSDSA_OPT_DISABLE_INBOUND_REPL = 0x00000002;
enum NTDSDSA_OPT_DISABLE_OUTBOUND_REPL = 0x00000004;
enum NTDSDSA_OPT_DISABLE_NTDSCONN_XLATE = 0x00000008;
enum NTDSDSA_OPT_DISABLE_SPN_REGISTRATION = 0x00000010;
enum NTDSDSA_OPT_GENERATE_OWN_TOPO = 0x00000020;
enum NTDSDSA_OPT_BLOCK_RPC = 0x00000040;
enum NTDSCONN_OPT_IS_GENERATED = 0x00000001;
enum NTDSCONN_OPT_TWOWAY_SYNC = 0x00000002;
enum NTDSCONN_OPT_OVERRIDE_NOTIFY_DEFAULT = 0x00000004;
enum NTDSCONN_OPT_USE_NOTIFY = 0x00000008;
enum NTDSCONN_OPT_DISABLE_INTERSITE_COMPRESSION = 0x00000010;
enum NTDSCONN_OPT_USER_OWNED_SCHEDULE = 0x00000020;
enum NTDSCONN_OPT_RODC_TOPOLOGY = 0x00000040;
enum NTDSCONN_KCC_NO_REASON = 0x00000000;
enum NTDSCONN_KCC_GC_TOPOLOGY = 0x00000001;
enum NTDSCONN_KCC_RING_TOPOLOGY = 0x00000002;
enum NTDSCONN_KCC_MINIMIZE_HOPS_TOPOLOGY = 0x00000004;
enum NTDSCONN_KCC_STALE_SERVERS_TOPOLOGY = 0x00000008;
enum NTDSCONN_KCC_OSCILLATING_CONNECTION_TOPOLOGY = 0x00000010;
enum NTDSCONN_KCC_INTERSITE_GC_TOPOLOGY = 0x00000020;
enum NTDSCONN_KCC_INTERSITE_TOPOLOGY = 0x00000040;
enum NTDSCONN_KCC_SERVER_FAILOVER_TOPOLOGY = 0x00000080;
enum NTDSCONN_KCC_SITE_FAILOVER_TOPOLOGY = 0x00000100;
enum NTDSCONN_KCC_REDUNDANT_SERVER_TOPOLOGY = 0x00000200;
enum FRSCONN_PRIORITY_MASK = 0x70000000;
enum FRSCONN_MAX_PRIORITY = 0x00000008;
enum NTDSCONN_OPT_IGNORE_SCHEDULE_MASK = 0x80000000;
enum NTDSSETTINGS_OPT_IS_AUTO_TOPOLOGY_DISABLED = 0x00000001;
enum NTDSSETTINGS_OPT_IS_TOPL_CLEANUP_DISABLED = 0x00000002;
enum NTDSSETTINGS_OPT_IS_TOPL_MIN_HOPS_DISABLED = 0x00000004;
enum NTDSSETTINGS_OPT_IS_TOPL_DETECT_STALE_DISABLED = 0x00000008;
enum NTDSSETTINGS_OPT_IS_INTER_SITE_AUTO_TOPOLOGY_DISABLED = 0x00000010;
enum NTDSSETTINGS_OPT_IS_GROUP_CACHING_ENABLED = 0x00000020;
enum NTDSSETTINGS_OPT_FORCE_KCC_WHISTLER_BEHAVIOR = 0x00000040;
enum NTDSSETTINGS_OPT_FORCE_KCC_W2K_ELECTION = 0x00000080;
enum NTDSSETTINGS_OPT_IS_RAND_BH_SELECTION_DISABLED = 0x00000100;
enum NTDSSETTINGS_OPT_IS_SCHEDULE_HASHING_ENABLED = 0x00000200;
enum NTDSSETTINGS_OPT_IS_REDUNDANT_SERVER_TOPOLOGY_ENABLED = 0x00000400;
enum NTDSSETTINGS_OPT_W2K3_IGNORE_SCHEDULES = 0x00000800;
enum NTDSSETTINGS_OPT_W2K3_BRIDGES_REQUIRED = 0x00001000;
enum NTDSSETTINGS_DEFAULT_SERVER_REDUNDANCY = 0x00000002;
enum NTDSTRANSPORT_OPT_IGNORE_SCHEDULES = 0x00000001;
enum NTDSTRANSPORT_OPT_BRIDGES_REQUIRED = 0x00000002;
enum NTDSSITECONN_OPT_USE_NOTIFY = 0x00000001;
enum NTDSSITECONN_OPT_TWOWAY_SYNC = 0x00000002;
enum NTDSSITECONN_OPT_DISABLE_COMPRESSION = 0x00000004;
enum NTDSSITELINK_OPT_USE_NOTIFY = 0x00000001;
enum NTDSSITELINK_OPT_TWOWAY_SYNC = 0x00000002;
enum NTDSSITELINK_OPT_DISABLE_COMPRESSION = 0x00000004;
enum GUID_USERS_CONTAINER_A = "a9d1ca15768811d1aded00c04fd8d5cd";
enum GUID_COMPUTRS_CONTAINER_A = "aa312825768811d1aded00c04fd8d5cd";
enum GUID_SYSTEMS_CONTAINER_A = "ab1d30f3768811d1aded00c04fd8d5cd";
enum GUID_DOMAIN_CONTROLLERS_CONTAINER_A = "a361b2ffffd211d1aa4b00c04fd7d83a";
enum GUID_INFRASTRUCTURE_CONTAINER_A = "2fbac1870ade11d297c400c04fd8d5cd";
enum GUID_DELETED_OBJECTS_CONTAINER_A = "18e2ea80684f11d2b9aa00c04f79f805";
enum GUID_LOSTANDFOUND_CONTAINER_A = "ab8153b7768811d1aded00c04fd8d5cd";
enum GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_A = "22b70c67d56e4efb91e9300fca3dc1aa";
enum GUID_PROGRAM_DATA_CONTAINER_A = "09460c08ae1e4a4ea0f64aee7daa1e5a";
enum GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_A = "f4be92a4c777485e878e9421d53087db";
enum GUID_NTDS_QUOTAS_CONTAINER_A = "6227f0af1fc2410d8e3bb10615bb5b0f";
enum GUID_USERS_CONTAINER_W = "a9d1ca15768811d1aded00c04fd8d5cd";
enum GUID_COMPUTRS_CONTAINER_W = "aa312825768811d1aded00c04fd8d5cd";
enum GUID_SYSTEMS_CONTAINER_W = "ab1d30f3768811d1aded00c04fd8d5cd";
enum GUID_DOMAIN_CONTROLLERS_CONTAINER_W = "a361b2ffffd211d1aa4b00c04fd7d83a";
enum GUID_INFRASTRUCTURE_CONTAINER_W = "2fbac1870ade11d297c400c04fd8d5cd";
enum GUID_DELETED_OBJECTS_CONTAINER_W = "18e2ea80684f11d2b9aa00c04f79f805";
enum GUID_LOSTANDFOUND_CONTAINER_W = "ab8153b7768811d1aded00c04fd8d5cd";
enum GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_W = "22b70c67d56e4efb91e9300fca3dc1aa";
enum GUID_PROGRAM_DATA_CONTAINER_W = "09460c08ae1e4a4ea0f64aee7daa1e5a";
enum GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_W = "f4be92a4c777485e878e9421d53087db";
enum GUID_NTDS_QUOTAS_CONTAINER_W = "6227f0af1fc2410d8e3bb10615bb5b0f";
enum GUID_MANAGED_SERVICE_ACCOUNTS_CONTAINER_W = "1EB93889E40C45DF9F0C64D23BBB6237";
enum GUID_KEYS_CONTAINER_W = "683A24E2E8164BD3AF86AC3C2CF3F981";
enum DS_REPSYNCALL_NO_OPTIONS = 0x00000000;
enum DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE = 0x00000001;
enum DS_REPSYNCALL_SYNC_ADJACENT_SERVERS_ONLY = 0x00000002;
enum DS_REPSYNCALL_ID_SERVERS_BY_DN = 0x00000004;
enum DS_REPSYNCALL_DO_NOT_SYNC = 0x00000008;
enum DS_REPSYNCALL_SKIP_INITIAL_CHECK = 0x00000010;
enum DS_REPSYNCALL_PUSH_CHANGES_OUTWARD = 0x00000020;
enum DS_REPSYNCALL_CROSS_SITE_BOUNDARIES = 0x00000040;
enum DS_LIST_DSA_OBJECT_FOR_SERVER = 0x00000000;
enum DS_LIST_DNS_HOST_NAME_FOR_SERVER = 0x00000001;
enum DS_LIST_ACCOUNT_OBJECT_FOR_SERVER = 0x00000002;
enum DS_ROLE_SCHEMA_OWNER = 0x00000000;
enum DS_ROLE_DOMAIN_OWNER = 0x00000001;
enum DS_ROLE_PDC_OWNER = 0x00000002;
enum DS_ROLE_RID_OWNER = 0x00000003;
enum DS_ROLE_INFRASTRUCTURE_OWNER = 0x00000004;
enum DS_SCHEMA_GUID_NOT_FOUND = 0x00000000;
enum DS_SCHEMA_GUID_ATTR = 0x00000001;
enum DS_SCHEMA_GUID_ATTR_SET = 0x00000002;
enum DS_SCHEMA_GUID_CLASS = 0x00000003;
enum DS_SCHEMA_GUID_CONTROL_RIGHT = 0x00000004;
enum DS_KCC_FLAG_ASYNC_OP = 0x00000001;
enum DS_KCC_FLAG_DAMPED = 0x00000002;
enum DS_EXIST_ADVISORY_MODE = 0x00000001;
enum DS_REPL_INFO_FLAG_IMPROVE_LINKED_ATTRS = 0x00000001;
enum DS_REPL_NBR_WRITEABLE = 0x00000010;
enum DS_REPL_NBR_SYNC_ON_STARTUP = 0x00000020;
enum DS_REPL_NBR_DO_SCHEDULED_SYNCS = 0x00000040;
enum DS_REPL_NBR_USE_ASYNC_INTERSITE_TRANSPORT = 0x00000080;
enum DS_REPL_NBR_TWO_WAY_SYNC = 0x00000200;
enum DS_REPL_NBR_NONGC_RO_REPLICA = 0x00000400;
enum DS_REPL_NBR_RETURN_OBJECT_PARENTS = 0x00000800;
enum DS_REPL_NBR_SELECT_SECRETS = 0x00001000;
enum DS_REPL_NBR_FULL_SYNC_IN_PROGRESS = 0x00010000;
enum DS_REPL_NBR_FULL_SYNC_NEXT_PACKET = 0x00020000;
enum DS_REPL_NBR_GCSPN = 0x00100000;
enum DS_REPL_NBR_NEVER_SYNCED = 0x00200000;
enum DS_REPL_NBR_PREEMPTED = 0x01000000;
enum DS_REPL_NBR_IGNORE_CHANGE_NOTIFICATIONS = 0x04000000;
enum DS_REPL_NBR_DISABLE_SCHEDULED_SYNC = 0x08000000;
enum DS_REPL_NBR_COMPRESS_CHANGES = 0x10000000;
enum DS_REPL_NBR_NO_CHANGE_NOTIFICATIONS = 0x20000000;
enum DS_REPL_NBR_PARTIAL_ATTRIBUTE_SET = 0x40000000;
enum ADAM_SCP_SITE_NAME_STRING = "site:";
enum ADAM_SCP_SITE_NAME_STRING_W = "site:";
enum ADAM_SCP_PARTITION_STRING = "partition:";
enum ADAM_SCP_PARTITION_STRING_W = "partition:";
enum ADAM_SCP_INSTANCE_NAME_STRING = "instance:";
enum ADAM_SCP_INSTANCE_NAME_STRING_W = "instance:";
enum ADAM_SCP_FSMO_STRING = "fsmo:";
enum ADAM_SCP_FSMO_STRING_W = "fsmo:";
enum ADAM_SCP_FSMO_NAMING_STRING = "naming";
enum ADAM_SCP_FSMO_NAMING_STRING_W = "naming";
enum ADAM_SCP_FSMO_SCHEMA_STRING = "schema";
enum ADAM_SCP_FSMO_SCHEMA_STRING_W = "schema";
enum ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE_PASS_THROUGH = 0x00000000;
enum ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE = 0x00000001;
enum ADAM_REPL_AUTHENTICATION_MODE_MUTUAL_AUTH_REQUIRED = 0x00000002;
enum FLAG_FOREST_OPTIONAL_FEATURE = 0x00000001;
enum FLAG_DOMAIN_OPTIONAL_FEATURE = 0x00000002;
enum FLAG_DISABLABLE_OPTIONAL_FEATURE = 0x00000004;
enum FLAG_SERVER_OPTIONAL_FEATURE = 0x00000008;
enum GUID_RECYCLE_BIN_OPTIONAL_FEATURE_A = "d8dc6d76d0ac5e44f3b9a7f9b6744f2a";
enum GUID_RECYCLE_BIN_OPTIONAL_FEATURE_W = "d8dc6d76d0ac5e44f3b9a7f9b6744f2a";
enum GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_A = "73e843ece8cc4046b4ab07ffe4ab5bcd";
enum GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_W = "73e843ece8cc4046b4ab07ffe4ab5bcd";
enum CFSTR_DSOP_DS_SELECTION_LIST = "CFSTR_DSOP_DS_SELECTION_LIST";
enum DSOP_SCOPE_TYPE_TARGET_COMPUTER = 0x00000001;
enum DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN = 0x00000002;
enum DSOP_SCOPE_TYPE_DOWNLEVEL_JOINED_DOMAIN = 0x00000004;
enum DSOP_SCOPE_TYPE_ENTERPRISE_DOMAIN = 0x00000008;
enum DSOP_SCOPE_TYPE_GLOBAL_CATALOG = 0x00000010;
enum DSOP_SCOPE_TYPE_EXTERNAL_UPLEVEL_DOMAIN = 0x00000020;
enum DSOP_SCOPE_TYPE_EXTERNAL_DOWNLEVEL_DOMAIN = 0x00000040;
enum DSOP_SCOPE_TYPE_WORKGROUP = 0x00000080;
enum DSOP_SCOPE_TYPE_USER_ENTERED_UPLEVEL_SCOPE = 0x00000100;
enum DSOP_SCOPE_TYPE_USER_ENTERED_DOWNLEVEL_SCOPE = 0x00000200;
enum DSOP_SCOPE_FLAG_STARTING_SCOPE = 0x00000001;
enum DSOP_SCOPE_FLAG_WANT_PROVIDER_WINNT = 0x00000002;
enum DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP = 0x00000004;
enum DSOP_SCOPE_FLAG_WANT_PROVIDER_GC = 0x00000008;
enum DSOP_SCOPE_FLAG_WANT_SID_PATH = 0x00000010;
enum DSOP_SCOPE_FLAG_WANT_DOWNLEVEL_BUILTIN_PATH = 0x00000020;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_USERS = 0x00000040;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_GROUPS = 0x00000080;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_COMPUTERS = 0x00000100;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_CONTACTS = 0x00000200;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_SERVICE_ACCOUNTS = 0x00000400;
enum DSOP_SCOPE_FLAG_DEFAULT_FILTER_PASSWORDSETTINGS_OBJECTS = 0x00000800;
enum DSOP_FILTER_INCLUDE_ADVANCED_VIEW = 0x00000001;
enum DSOP_FILTER_USERS = 0x00000002;
enum DSOP_FILTER_BUILTIN_GROUPS = 0x00000004;
enum DSOP_FILTER_WELL_KNOWN_PRINCIPALS = 0x00000008;
enum DSOP_FILTER_UNIVERSAL_GROUPS_DL = 0x00000010;
enum DSOP_FILTER_UNIVERSAL_GROUPS_SE = 0x00000020;
enum DSOP_FILTER_GLOBAL_GROUPS_DL = 0x00000040;
enum DSOP_FILTER_GLOBAL_GROUPS_SE = 0x00000080;
enum DSOP_FILTER_DOMAIN_LOCAL_GROUPS_DL = 0x00000100;
enum DSOP_FILTER_DOMAIN_LOCAL_GROUPS_SE = 0x00000200;
enum DSOP_FILTER_CONTACTS = 0x00000400;
enum DSOP_FILTER_COMPUTERS = 0x00000800;
enum DSOP_FILTER_SERVICE_ACCOUNTS = 0x00001000;
enum DSOP_FILTER_PASSWORDSETTINGS_OBJECTS = 0x00002000;
enum DSOP_DOWNLEVEL_FILTER_USERS = 0x80000001;
enum DSOP_DOWNLEVEL_FILTER_LOCAL_GROUPS = 0x80000002;
enum DSOP_DOWNLEVEL_FILTER_GLOBAL_GROUPS = 0x80000004;
enum DSOP_DOWNLEVEL_FILTER_COMPUTERS = 0x80000008;
enum DSOP_DOWNLEVEL_FILTER_WORLD = 0x80000010;
enum DSOP_DOWNLEVEL_FILTER_AUTHENTICATED_USER = 0x80000020;
enum DSOP_DOWNLEVEL_FILTER_ANONYMOUS = 0x80000040;
enum DSOP_DOWNLEVEL_FILTER_BATCH = 0x80000080;
enum DSOP_DOWNLEVEL_FILTER_CREATOR_OWNER = 0x80000100;
enum DSOP_DOWNLEVEL_FILTER_CREATOR_GROUP = 0x80000200;
enum DSOP_DOWNLEVEL_FILTER_DIALUP = 0x80000400;
enum DSOP_DOWNLEVEL_FILTER_INTERACTIVE = 0x80000800;
enum DSOP_DOWNLEVEL_FILTER_NETWORK = 0x80001000;
enum DSOP_DOWNLEVEL_FILTER_SERVICE = 0x80002000;
enum DSOP_DOWNLEVEL_FILTER_SYSTEM = 0x80004000;
enum DSOP_DOWNLEVEL_FILTER_EXCLUDE_BUILTIN_GROUPS = 0x80008000;
enum DSOP_DOWNLEVEL_FILTER_TERMINAL_SERVER = 0x80010000;
enum DSOP_DOWNLEVEL_FILTER_ALL_WELLKNOWN_SIDS = 0x80020000;
enum DSOP_DOWNLEVEL_FILTER_LOCAL_SERVICE = 0x80040000;
enum DSOP_DOWNLEVEL_FILTER_NETWORK_SERVICE = 0x80080000;
enum DSOP_DOWNLEVEL_FILTER_REMOTE_LOGON = 0x80100000;
enum DSOP_DOWNLEVEL_FILTER_INTERNET_USER = 0x80200000;
enum DSOP_DOWNLEVEL_FILTER_OWNER_RIGHTS = 0x80400000;
enum DSOP_DOWNLEVEL_FILTER_SERVICES = 0x80800000;
enum DSOP_DOWNLEVEL_FILTER_LOCAL_LOGON = 0x81000000;
enum DSOP_DOWNLEVEL_FILTER_THIS_ORG_CERT = 0x82000000;
enum DSOP_DOWNLEVEL_FILTER_IIS_APP_POOL = 0x84000000;
enum DSOP_DOWNLEVEL_FILTER_ALL_APP_PACKAGES = 0x88000000;
enum DSOP_DOWNLEVEL_FILTER_LOCAL_ACCOUNTS = 0x90000000;
enum DSOP_FLAG_MULTISELECT = 0x00000001;
enum DSOP_FLAG_SKIP_TARGET_COMPUTER_DC_CHECK = 0x00000002;
enum SCHEDULE_INTERVAL = 0x00000000;
enum SCHEDULE_BANDWIDTH = 0x00000001;
enum SCHEDULE_PRIORITY = 0x00000002;
enum FACILITY_NTDSB = 0x00000800;
enum FACILITY_BACKUP = 0x000007ff;
enum FACILITY_SYSTEM = 0x00000000;
enum hrNone = 0x00000000;
enum hrNyi = 0xffffffffc0000001;
enum hrInvalidParam = 0xffffffffc7ff0001;
enum hrError = 0xffffffffc7ff0002;
enum hrInvalidHandle = 0xffffffffc7ff0003;
enum hrRestoreInProgress = 0xffffffffc7ff0004;
enum hrAlreadyOpen = 0xffffffffc7ff0005;
enum hrInvalidRecips = 0xffffffffc7ff0006;
enum hrCouldNotConnect = 0xffffffffc7ff0007;
enum hrRestoreMapExists = 0xffffffffc7ff0008;
enum hrIncrementalBackupDisabled = 0xffffffffc7ff0009;
enum hrLogFileNotFound = 0xffffffffc7ff000a;
enum hrCircularLogging = 0xffffffffc7ff000b;
enum hrNoFullRestore = 0xffffffffc7ff000c;
enum hrCommunicationError = 0xffffffffc7ff000d;
enum hrFullBackupNotTaken = 0xffffffffc7ff000e;
enum hrMissingExpiryToken = 0xffffffffc7ff000f;
enum hrUnknownExpiryTokenFormat = 0xffffffffc7ff0010;
enum hrContentsExpired = 0xffffffffc7ff0011;
enum hrFileClose = 0xffffffffc8000066;
enum hrOutOfThreads = 0xffffffffc8000067;
enum hrTooManyIO = 0xffffffffc8000069;
enum hrBFNotSynchronous = 0xffffffff880000c8;
enum hrBFPageNotFound = 0xffffffff880000c9;
enum hrBFInUse = 0xffffffffc80000ca;
enum hrPMRecDeleted = 0xffffffffc800012e;
enum hrRemainingVersions = 0xffffffff88000141;
enum hrFLDKeyTooBig = 0xffffffff88000190;
enum hrFLDTooManySegments = 0xffffffffc8000191;
enum hrFLDNullKey = 0xffffffff88000192;
enum hrLogFileCorrupt = 0xffffffffc80001f5;
enum hrNoBackupDirectory = 0xffffffffc80001f7;
enum hrBackupDirectoryNotEmpty = 0xffffffffc80001f8;
enum hrBackupInProgress = 0xffffffffc80001f9;
enum hrMissingPreviousLogFile = 0xffffffffc80001fd;
enum hrLogWriteFail = 0xffffffffc80001fe;
enum hrBadLogVersion = 0xffffffffc8000202;
enum hrInvalidLogSequence = 0xffffffffc8000203;
enum hrLoggingDisabled = 0xffffffffc8000204;
enum hrLogBufferTooSmall = 0xffffffffc8000205;
enum hrLogSequenceEnd = 0xffffffffc8000207;
enum hrNoBackup = 0xffffffffc8000208;
enum hrInvalidBackupSequence = 0xffffffffc8000209;
enum hrBackupNotAllowedYet = 0xffffffffc800020b;
enum hrDeleteBackupFileFail = 0xffffffffc800020c;
enum hrMakeBackupDirectoryFail = 0xffffffffc800020d;
enum hrInvalidBackup = 0xffffffffc800020e;
enum hrRecoveredWithErrors = 0xffffffffc800020f;
enum hrMissingLogFile = 0xffffffffc8000210;
enum hrLogDiskFull = 0xffffffffc8000211;
enum hrBadLogSignature = 0xffffffffc8000212;
enum hrBadDbSignature = 0xffffffffc8000213;
enum hrBadCheckpointSignature = 0xffffffffc8000214;
enum hrCheckpointCorrupt = 0xffffffffc8000215;
enum hrDatabaseInconsistent = 0xffffffffc8000226;
enum hrConsistentTimeMismatch = 0xffffffffc8000227;
enum hrPatchFileMismatch = 0xffffffffc8000228;
enum hrRestoreLogTooLow = 0xffffffffc8000229;
enum hrRestoreLogTooHigh = 0xffffffffc800022a;
enum hrGivenLogFileHasBadSignature = 0xffffffffc800022b;
enum hrGivenLogFileIsNotContiguous = 0xffffffffc800022c;
enum hrMissingRestoreLogFiles = 0xffffffffc800022d;
enum hrExistingLogFileHasBadSignature = 0xffffffff8800022e;
enum hrExistingLogFileIsNotContiguous = 0xffffffff8800022f;
enum hrMissingFullBackup = 0xffffffffc8000230;
enum hrBadBackupDatabaseSize = 0xffffffffc8000231;
enum hrTermInProgress = 0xffffffffc80003e8;
enum hrFeatureNotAvailable = 0xffffffffc80003e9;
enum hrInvalidName = 0xffffffffc80003ea;
enum hrInvalidParameter = 0xffffffffc80003eb;
enum hrColumnNull = 0xffffffff880003ec;
enum hrBufferTruncated = 0xffffffff880003ee;
enum hrDatabaseAttached = 0xffffffff880003ef;
enum hrInvalidDatabaseId = 0xffffffffc80003f2;
enum hrOutOfMemory = 0xffffffffc80003f3;
enum hrOutOfDatabaseSpace = 0xffffffffc80003f4;
enum hrOutOfCursors = 0xffffffffc80003f5;
enum hrOutOfBuffers = 0xffffffffc80003f6;
enum hrTooManyIndexes = 0xffffffffc80003f7;
enum hrTooManyKeys = 0xffffffffc80003f8;
enum hrRecordDeleted = 0xffffffffc80003f9;
enum hrReadVerifyFailure = 0xffffffffc80003fa;
enum hrOutOfFileHandles = 0xffffffffc80003fc;
enum hrDiskIO = 0xffffffffc80003fe;
enum hrInvalidPath = 0xffffffffc80003ff;
enum hrRecordTooBig = 0xffffffffc8000402;
enum hrTooManyOpenDatabases = 0xffffffffc8000403;
enum hrInvalidDatabase = 0xffffffffc8000404;
enum hrNotInitialized = 0xffffffffc8000405;
enum hrAlreadyInitialized = 0xffffffffc8000406;
enum hrFileAccessDenied = 0xffffffffc8000408;
enum hrBufferTooSmall = 0xffffffffc800040e;
enum hrSeekNotEqual = 0xffffffff8800040f;
enum hrTooManyColumns = 0xffffffffc8000410;
enum hrContainerNotEmpty = 0xffffffffc8000413;
enum hrInvalidFilename = 0xffffffffc8000414;
enum hrInvalidBookmark = 0xffffffffc8000415;
enum hrColumnInUse = 0xffffffffc8000416;
enum hrInvalidBufferSize = 0xffffffffc8000417;
enum hrColumnNotUpdatable = 0xffffffffc8000418;
enum hrIndexInUse = 0xffffffffc800041b;
enum hrNullKeyDisallowed = 0xffffffffc800041d;
enum hrNotInTransaction = 0xffffffffc800041e;
enum hrNoIdleActivity = 0xffffffff88000422;
enum hrTooManyActiveUsers = 0xffffffffc8000423;
enum hrInvalidCountry = 0xffffffffc8000425;
enum hrInvalidLanguageId = 0xffffffffc8000426;
enum hrInvalidCodePage = 0xffffffffc8000427;
enum hrNoWriteLock = 0xffffffff8800042b;
enum hrColumnSetNull = 0xffffffff8800042c;
enum hrVersionStoreOutOfMemory = 0xffffffffc800042d;
enum hrCurrencyStackOutOfMemory = 0xffffffffc800042e;
enum hrOutOfSessions = 0xffffffffc800044d;
enum hrWriteConflict = 0xffffffffc800044e;
enum hrTransTooDeep = 0xffffffffc800044f;
enum hrInvalidSesid = 0xffffffffc8000450;
enum hrSessionWriteConflict = 0xffffffffc8000453;
enum hrInTransaction = 0xffffffffc8000454;
enum hrDatabaseDuplicate = 0xffffffffc80004b1;
enum hrDatabaseInUse = 0xffffffffc80004b2;
enum hrDatabaseNotFound = 0xffffffffc80004b3;
enum hrDatabaseInvalidName = 0xffffffffc80004b4;
enum hrDatabaseInvalidPages = 0xffffffffc80004b5;
enum hrDatabaseCorrupted = 0xffffffffc80004b6;
enum hrDatabaseLocked = 0xffffffffc80004b7;
enum hrTableEmpty = 0xffffffff88000515;
enum hrTableLocked = 0xffffffffc8000516;
enum hrTableDuplicate = 0xffffffffc8000517;
enum hrTableInUse = 0xffffffffc8000518;
enum hrObjectNotFound = 0xffffffffc8000519;
enum hrCannotRename = 0xffffffffc800051a;
enum hrDensityInvalid = 0xffffffffc800051b;
enum hrTableNotEmpty = 0xffffffffc800051c;
enum hrInvalidTableId = 0xffffffffc800051e;
enum hrTooManyOpenTables = 0xffffffffc800051f;
enum hrIllegalOperation = 0xffffffffc8000520;
enum hrObjectDuplicate = 0xffffffffc8000522;
enum hrInvalidObject = 0xffffffffc8000524;
enum hrIndexCantBuild = 0xffffffffc8000579;
enum hrIndexHasPrimary = 0xffffffffc800057a;
enum hrIndexDuplicate = 0xffffffffc800057b;
enum hrIndexNotFound = 0xffffffffc800057c;
enum hrIndexMustStay = 0xffffffffc800057d;
enum hrIndexInvalidDef = 0xffffffffc800057e;
enum hrIndexHasClustered = 0xffffffffc8000580;
enum hrCreateIndexFailed = 0xffffffff88000581;
enum hrTooManyOpenIndexes = 0xffffffffc8000582;
enum hrColumnLong = 0xffffffffc80005dd;
enum hrColumnDoesNotFit = 0xffffffffc80005df;
enum hrNullInvalid = 0xffffffffc80005e0;
enum hrColumnIndexed = 0xffffffffc80005e1;
enum hrColumnTooBig = 0xffffffffc80005e2;
enum hrColumnNotFound = 0xffffffffc80005e3;
enum hrColumnDuplicate = 0xffffffffc80005e4;
enum hrColumn2ndSysMaint = 0xffffffffc80005e6;
enum hrInvalidColumnType = 0xffffffffc80005e7;
enum hrColumnMaxTruncated = 0xffffffff880005e8;
enum hrColumnCannotIndex = 0xffffffffc80005e9;
enum hrTaggedNotNULL = 0xffffffffc80005ea;
enum hrNoCurrentIndex = 0xffffffffc80005eb;
enum hrKeyIsMade = 0xffffffffc80005ec;
enum hrBadColumnId = 0xffffffffc80005ed;
enum hrBadItagSequence = 0xffffffffc80005ee;
enum hrCannotBeTagged = 0xffffffffc80005f1;
enum hrRecordNotFound = 0xffffffffc8000641;
enum hrNoCurrentRecord = 0xffffffffc8000643;
enum hrRecordClusteredChanged = 0xffffffffc8000644;
enum hrKeyDuplicate = 0xffffffffc8000645;
enum hrAlreadyPrepared = 0xffffffffc8000647;
enum hrKeyNotMade = 0xffffffffc8000648;
enum hrUpdateNotPrepared = 0xffffffffc8000649;
enum hrwrnDataHasChanged = 0xffffffff8800064a;
enum hrerrDataHasChanged = 0xffffffffc800064b;
enum hrKeyChanged = 0xffffffff88000652;
enum hrTooManySorts = 0xffffffffc80006a5;
enum hrInvalidOnSort = 0xffffffffc80006a6;
enum hrTempFileOpenError = 0xffffffffc800070b;
enum hrTooManyAttachedDatabases = 0xffffffffc800070d;
enum hrDiskFull = 0xffffffffc8000710;
enum hrPermissionDenied = 0xffffffffc8000711;
enum hrFileNotFound = 0xffffffffc8000713;
enum hrFileOpenReadOnly = 0xffffffff88000715;
enum hrAfterInitialization = 0xffffffffc800073a;
enum hrLogCorrupted = 0xffffffffc800073c;
enum hrInvalidOperation = 0xffffffffc8000772;
enum hrAccessDenied = 0xffffffffc8000773;
enum CLSID_DsObjectPicker = GUID(0x17d6ccd8, 0x3b7b, 0x11d2, [0xb9, 0xe0, 0x0, 0xc0, 0x4f, 0xd8, 0xdb, 0xf7]);
struct CQFORM
{
    uint cbStruct;
    uint dwFlags;
    GUID clsid;
    HICON hIcon;
    const(wchar)* pszTitle;
}
alias LPCQADDFORMSPROC = HRESULT function(LPARAM lParam, CQFORM* pForm);
alias LPCQADDPAGESPROC = HRESULT function(LPARAM lParam, const(GUID)* clsidForm, CQPAGE* pPage);
alias LPCQPAGEPROC = HRESULT function(CQPAGE* pPage, HWND hwnd, uint uMsg, WPARAM wParam, LPARAM lParam);
struct CQPAGE
{
    uint cbStruct;
    uint dwFlags;
    LPCQPAGEPROC pPageProc;
    HINSTANCE hInstance;
    int idPageName;
    int idPageTemplate;
    DLGPROC pDlgProc;
    LPARAM lParam;
}
enum IID_IQueryForm = GUID(0x8cfcee30, 0x39bd, 0x11d0, [0xb8, 0xd1, 0x0, 0xa0, 0x24, 0xab, 0x2d, 0xbb]);
interface IQueryForm : IUnknown
{
    HRESULT Initialize(HKEY hkForm);
    HRESULT AddForms(LPCQADDFORMSPROC pAddFormsProc, LPARAM lParam);
    HRESULT AddPages(LPCQADDPAGESPROC pAddPagesProc, LPARAM lParam);
}
enum IID_IPersistQuery = GUID(0x1a3114b8, 0xa62e, 0x11d0, [0xa6, 0xc5, 0x0, 0xa0, 0xc9, 0x6, 0xaf, 0x45]);
interface IPersistQuery : IPersist
{
    HRESULT WriteString(const(wchar)* pSection, const(wchar)* pValueName, const(wchar)* pValue);
    HRESULT ReadString(const(wchar)* pSection, const(wchar)* pValueName, PWSTR pBuffer, int cchBuffer);
    HRESULT WriteInt(const(wchar)* pSection, const(wchar)* pValueName, int value);
    HRESULT ReadInt(const(wchar)* pSection, const(wchar)* pValueName, int* pValue);
    HRESULT WriteStruct(const(wchar)* pSection, const(wchar)* pValueName, void* pStruct, uint cbStruct);
    HRESULT ReadStruct(const(wchar)* pSection, const(wchar)* pValueName, void* pStruct, uint cbStruct);
    HRESULT Clear();
}
struct OPENQUERYWINDOW
{
    uint cbStruct;
    uint dwFlags;
    GUID clsidHandler;
    void* pHandlerParameters;
    GUID clsidDefaultForm;
    IPersistQuery pPersistQuery;
    union
    {
        void* pFormParameters;
        IPropertyBag ppbFormParameters;
    }
}
enum IID_ICommonQuery = GUID(0xab50dec0, 0x6f1d, 0x11d0, [0xa1, 0xc4, 0x0, 0xaa, 0x0, 0xc1, 0x6e, 0x65]);
interface ICommonQuery : IUnknown
{
    HRESULT OpenQueryWindow(HWND hwndParent, OPENQUERYWINDOW* pQueryWnd, IDataObject* ppDataObject);
}
alias ADSTYPE = int;
enum : int
{
    ADSTYPE_INVALID                = 0x00000000,
    ADSTYPE_DN_STRING              = 0x00000001,
    ADSTYPE_CASE_EXACT_STRING      = 0x00000002,
    ADSTYPE_CASE_IGNORE_STRING     = 0x00000003,
    ADSTYPE_PRINTABLE_STRING       = 0x00000004,
    ADSTYPE_NUMERIC_STRING         = 0x00000005,
    ADSTYPE_BOOLEAN                = 0x00000006,
    ADSTYPE_INTEGER                = 0x00000007,
    ADSTYPE_OCTET_STRING           = 0x00000008,
    ADSTYPE_UTC_TIME               = 0x00000009,
    ADSTYPE_LARGE_INTEGER          = 0x0000000a,
    ADSTYPE_PROV_SPECIFIC          = 0x0000000b,
    ADSTYPE_OBJECT_CLASS           = 0x0000000c,
    ADSTYPE_CASEIGNORE_LIST        = 0x0000000d,
    ADSTYPE_OCTET_LIST             = 0x0000000e,
    ADSTYPE_PATH                   = 0x0000000f,
    ADSTYPE_POSTALADDRESS          = 0x00000010,
    ADSTYPE_TIMESTAMP              = 0x00000011,
    ADSTYPE_BACKLINK               = 0x00000012,
    ADSTYPE_TYPEDNAME              = 0x00000013,
    ADSTYPE_HOLD                   = 0x00000014,
    ADSTYPE_NETADDRESS             = 0x00000015,
    ADSTYPE_REPLICAPOINTER         = 0x00000016,
    ADSTYPE_FAXNUMBER              = 0x00000017,
    ADSTYPE_EMAIL                  = 0x00000018,
    ADSTYPE_NT_SECURITY_DESCRIPTOR = 0x00000019,
    ADSTYPE_UNKNOWN                = 0x0000001a,
    ADSTYPE_DN_WITH_BINARY         = 0x0000001b,
    ADSTYPE_DN_WITH_STRING         = 0x0000001c,
}

struct ADS_OCTET_STRING
{
    uint dwLength;
    ubyte* lpValue;
}
struct ADS_NT_SECURITY_DESCRIPTOR
{
    uint dwLength;
    ubyte* lpValue;
}
struct ADS_PROV_SPECIFIC
{
    uint dwLength;
    ubyte* lpValue;
}
struct ADS_CASEIGNORE_LIST
{
    ADS_CASEIGNORE_LIST* Next;
    PWSTR String;
}
struct ADS_OCTET_LIST
{
    ADS_OCTET_LIST* Next;
    uint Length;
    ubyte* Data;
}
struct ADS_PATH
{
    uint Type;
    PWSTR VolumeName;
    PWSTR Path;
}
struct ADS_POSTALADDRESS
{
    PWSTR[6] PostalAddress;
}
struct ADS_TIMESTAMP
{
    uint WholeSeconds;
    uint EventID;
}
struct ADS_BACKLINK
{
    uint RemoteID;
    PWSTR ObjectName;
}
struct ADS_TYPEDNAME
{
    PWSTR ObjectName;
    uint Level;
    uint Interval;
}
struct ADS_HOLD
{
    PWSTR ObjectName;
    uint Amount;
}
struct ADS_NETADDRESS
{
    uint AddressType;
    uint AddressLength;
    ubyte* Address;
}
struct ADS_REPLICAPOINTER
{
    PWSTR ServerName;
    uint ReplicaType;
    uint ReplicaNumber;
    uint Count;
    ADS_NETADDRESS* ReplicaAddressHints;
}
struct ADS_FAXNUMBER
{
    PWSTR TelephoneNumber;
    uint NumberOfBits;
    ubyte* Parameters;
}
struct ADS_EMAIL
{
    PWSTR Address;
    uint Type;
}
struct ADS_DN_WITH_BINARY
{
    uint dwLength;
    ubyte* lpBinaryValue;
    PWSTR pszDNString;
}
struct ADS_DN_WITH_STRING
{
    PWSTR pszStringValue;
    PWSTR pszDNString;
}
struct ADSVALUE
{
    ADSTYPE dwType;
    union
    {
        ushort* DNString;
        ushort* CaseExactString;
        ushort* CaseIgnoreString;
        ushort* PrintableString;
        ushort* NumericString;
        uint Boolean;
        uint Integer;
        ADS_OCTET_STRING OctetString;
        SYSTEMTIME UTCTime;
        long LargeInteger;
        ushort* ClassName;
        ADS_PROV_SPECIFIC ProviderSpecific;
        ADS_CASEIGNORE_LIST* pCaseIgnoreList;
        ADS_OCTET_LIST* pOctetList;
        ADS_PATH* pPath;
        ADS_POSTALADDRESS* pPostalAddress;
        ADS_TIMESTAMP Timestamp;
        ADS_BACKLINK BackLink;
        ADS_TYPEDNAME* pTypedName;
        ADS_HOLD Hold;
        ADS_NETADDRESS* pNetAddress;
        ADS_REPLICAPOINTER* pReplicaPointer;
        ADS_FAXNUMBER* pFaxNumber;
        ADS_EMAIL Email;
        ADS_NT_SECURITY_DESCRIPTOR SecurityDescriptor;
        ADS_DN_WITH_BINARY* pDNWithBinary;
        ADS_DN_WITH_STRING* pDNWithString;
    }
}
struct ADS_ATTR_INFO
{
    PWSTR pszAttrName;
    uint dwControlCode;
    ADSTYPE dwADsType;
    ADSVALUE* pADsValues;
    uint dwNumValues;
}
alias ADS_AUTHENTICATION_ENUM = uint;
enum : uint
{
    ADS_SECURE_AUTHENTICATION = 0x00000001,
    ADS_USE_ENCRYPTION        = 0x00000002,
    ADS_USE_SSL               = 0x00000002,
    ADS_READONLY_SERVER       = 0x00000004,
    ADS_PROMPT_CREDENTIALS    = 0x00000008,
    ADS_NO_AUTHENTICATION     = 0x00000010,
    ADS_FAST_BIND             = 0x00000020,
    ADS_USE_SIGNING           = 0x00000040,
    ADS_USE_SEALING           = 0x00000080,
    ADS_USE_DELEGATION        = 0x00000100,
    ADS_SERVER_BIND           = 0x00000200,
    ADS_NO_REFERRAL_CHASING   = 0x00000400,
    ADS_AUTH_RESERVED         = 0x80000000,
}

struct ADS_OBJECT_INFO
{
    PWSTR pszRDN;
    PWSTR pszObjectDN;
    PWSTR pszParentDN;
    PWSTR pszSchemaDN;
    PWSTR pszClassName;
}
alias ADS_STATUSENUM = int;
enum : int
{
    ADS_STATUS_S_OK                    = 0x00000000,
    ADS_STATUS_INVALID_SEARCHPREF      = 0x00000001,
    ADS_STATUS_INVALID_SEARCHPREFVALUE = 0x00000002,
}

alias ADS_DEREFENUM = int;
enum : int
{
    ADS_DEREF_NEVER     = 0x00000000,
    ADS_DEREF_SEARCHING = 0x00000001,
    ADS_DEREF_FINDING   = 0x00000002,
    ADS_DEREF_ALWAYS    = 0x00000003,
}

alias ADS_SCOPEENUM = int;
enum : int
{
    ADS_SCOPE_BASE     = 0x00000000,
    ADS_SCOPE_ONELEVEL = 0x00000001,
    ADS_SCOPE_SUBTREE  = 0x00000002,
}

alias ADS_PREFERENCES_ENUM = int;
enum : int
{
    ADSIPROP_ASYNCHRONOUS     = 0x00000000,
    ADSIPROP_DEREF_ALIASES    = 0x00000001,
    ADSIPROP_SIZE_LIMIT       = 0x00000002,
    ADSIPROP_TIME_LIMIT       = 0x00000003,
    ADSIPROP_ATTRIBTYPES_ONLY = 0x00000004,
    ADSIPROP_SEARCH_SCOPE     = 0x00000005,
    ADSIPROP_TIMEOUT          = 0x00000006,
    ADSIPROP_PAGESIZE         = 0x00000007,
    ADSIPROP_PAGED_TIME_LIMIT = 0x00000008,
    ADSIPROP_CHASE_REFERRALS  = 0x00000009,
    ADSIPROP_SORT_ON          = 0x0000000a,
    ADSIPROP_CACHE_RESULTS    = 0x0000000b,
    ADSIPROP_ADSIFLAG         = 0x0000000c,
}

alias ADSI_DIALECT_ENUM = int;
enum : int
{
    ADSI_DIALECT_LDAP = 0x00000000,
    ADSI_DIALECT_SQL  = 0x00000001,
}

alias ADS_CHASE_REFERRALS_ENUM = int;
enum : int
{
    ADS_CHASE_REFERRALS_NEVER       = 0x00000000,
    ADS_CHASE_REFERRALS_SUBORDINATE = 0x00000020,
    ADS_CHASE_REFERRALS_EXTERNAL    = 0x00000040,
    ADS_CHASE_REFERRALS_ALWAYS      = 0x00000060,
}

alias ADS_SEARCHPREF_ENUM = int;
enum : int
{
    ADS_SEARCHPREF_ASYNCHRONOUS     = 0x00000000,
    ADS_SEARCHPREF_DEREF_ALIASES    = 0x00000001,
    ADS_SEARCHPREF_SIZE_LIMIT       = 0x00000002,
    ADS_SEARCHPREF_TIME_LIMIT       = 0x00000003,
    ADS_SEARCHPREF_ATTRIBTYPES_ONLY = 0x00000004,
    ADS_SEARCHPREF_SEARCH_SCOPE     = 0x00000005,
    ADS_SEARCHPREF_TIMEOUT          = 0x00000006,
    ADS_SEARCHPREF_PAGESIZE         = 0x00000007,
    ADS_SEARCHPREF_PAGED_TIME_LIMIT = 0x00000008,
    ADS_SEARCHPREF_CHASE_REFERRALS  = 0x00000009,
    ADS_SEARCHPREF_SORT_ON          = 0x0000000a,
    ADS_SEARCHPREF_CACHE_RESULTS    = 0x0000000b,
    ADS_SEARCHPREF_DIRSYNC          = 0x0000000c,
    ADS_SEARCHPREF_TOMBSTONE        = 0x0000000d,
    ADS_SEARCHPREF_VLV              = 0x0000000e,
    ADS_SEARCHPREF_ATTRIBUTE_QUERY  = 0x0000000f,
    ADS_SEARCHPREF_SECURITY_MASK    = 0x00000010,
    ADS_SEARCHPREF_DIRSYNC_FLAG     = 0x00000011,
    ADS_SEARCHPREF_EXTENDED_DN      = 0x00000012,
}

alias ADS_PASSWORD_ENCODING_ENUM = int;
enum : int
{
    ADS_PASSWORD_ENCODE_REQUIRE_SSL = 0x00000000,
    ADS_PASSWORD_ENCODE_CLEAR       = 0x00000001,
}

struct ADS_SEARCHPREF_INFO
{
    ADS_SEARCHPREF_ENUM dwSearchPref;
    ADSVALUE vValue;
    ADS_STATUSENUM dwStatus;
}
struct ADS_SEARCH_COLUMN
{
    PWSTR pszAttrName;
    ADSTYPE dwADsType;
    ADSVALUE* pADsValues;
    uint dwNumValues;
    HANDLE hReserved;
}
struct ADS_ATTR_DEF
{
    PWSTR pszAttrName;
    ADSTYPE dwADsType;
    uint dwMinRange;
    uint dwMaxRange;
    BOOL fMultiValued;
}
struct ADS_CLASS_DEF
{
    PWSTR pszClassName;
    uint dwMandatoryAttrs;
    PWSTR* ppszMandatoryAttrs;
    uint optionalAttrs;
    PWSTR** ppszOptionalAttrs;
    uint dwNamingAttrs;
    PWSTR** ppszNamingAttrs;
    uint dwSuperClasses;
    PWSTR** ppszSuperClasses;
    BOOL fIsContainer;
}
struct ADS_SORTKEY
{
    PWSTR pszAttrType;
    PWSTR pszReserved;
    BOOLEAN fReverseorder;
}
struct ADS_VLV
{
    uint dwBeforeCount;
    uint dwAfterCount;
    uint dwOffset;
    uint dwContentCount;
    PWSTR pszTarget;
    uint dwContextIDLength;
    ubyte* lpContextID;
}
alias ADS_PROPERTY_OPERATION_ENUM = int;
enum : int
{
    ADS_PROPERTY_CLEAR  = 0x00000001,
    ADS_PROPERTY_UPDATE = 0x00000002,
    ADS_PROPERTY_APPEND = 0x00000003,
    ADS_PROPERTY_DELETE = 0x00000004,
}

alias ADS_SYSTEMFLAG_ENUM = int;
enum : int
{
    ADS_SYSTEMFLAG_DISALLOW_DELETE           = 0x80000000,
    ADS_SYSTEMFLAG_CONFIG_ALLOW_RENAME       = 0x40000000,
    ADS_SYSTEMFLAG_CONFIG_ALLOW_MOVE         = 0x20000000,
    ADS_SYSTEMFLAG_CONFIG_ALLOW_LIMITED_MOVE = 0x10000000,
    ADS_SYSTEMFLAG_DOMAIN_DISALLOW_RENAME    = 0x08000000,
    ADS_SYSTEMFLAG_DOMAIN_DISALLOW_MOVE      = 0x04000000,
    ADS_SYSTEMFLAG_CR_NTDS_NC                = 0x00000001,
    ADS_SYSTEMFLAG_CR_NTDS_DOMAIN            = 0x00000002,
    ADS_SYSTEMFLAG_ATTR_NOT_REPLICATED       = 0x00000001,
    ADS_SYSTEMFLAG_ATTR_IS_CONSTRUCTED       = 0x00000004,
}

alias ADS_GROUP_TYPE_ENUM = int;
enum : int
{
    ADS_GROUP_TYPE_GLOBAL_GROUP       = 0x00000002,
    ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP = 0x00000004,
    ADS_GROUP_TYPE_LOCAL_GROUP        = 0x00000004,
    ADS_GROUP_TYPE_UNIVERSAL_GROUP    = 0x00000008,
    ADS_GROUP_TYPE_SECURITY_ENABLED   = 0x80000000,
}

alias ADS_USER_FLAG_ENUM = int;
enum : int
{
    ADS_UF_SCRIPT                                 = 0x00000001,
    ADS_UF_ACCOUNTDISABLE                         = 0x00000002,
    ADS_UF_HOMEDIR_REQUIRED                       = 0x00000008,
    ADS_UF_LOCKOUT                                = 0x00000010,
    ADS_UF_PASSWD_NOTREQD                         = 0x00000020,
    ADS_UF_PASSWD_CANT_CHANGE                     = 0x00000040,
    ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED        = 0x00000080,
    ADS_UF_TEMP_DUPLICATE_ACCOUNT                 = 0x00000100,
    ADS_UF_NORMAL_ACCOUNT                         = 0x00000200,
    ADS_UF_INTERDOMAIN_TRUST_ACCOUNT              = 0x00000800,
    ADS_UF_WORKSTATION_TRUST_ACCOUNT              = 0x00001000,
    ADS_UF_SERVER_TRUST_ACCOUNT                   = 0x00002000,
    ADS_UF_DONT_EXPIRE_PASSWD                     = 0x00010000,
    ADS_UF_MNS_LOGON_ACCOUNT                      = 0x00020000,
    ADS_UF_SMARTCARD_REQUIRED                     = 0x00040000,
    ADS_UF_TRUSTED_FOR_DELEGATION                 = 0x00080000,
    ADS_UF_NOT_DELEGATED                          = 0x00100000,
    ADS_UF_USE_DES_KEY_ONLY                       = 0x00200000,
    ADS_UF_DONT_REQUIRE_PREAUTH                   = 0x00400000,
    ADS_UF_PASSWORD_EXPIRED                       = 0x00800000,
    ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x01000000,
}

alias ADS_RIGHTS_ENUM = int;
enum : int
{
    ADS_RIGHT_DELETE                 = 0x00010000,
    ADS_RIGHT_READ_CONTROL           = 0x00020000,
    ADS_RIGHT_WRITE_DAC              = 0x00040000,
    ADS_RIGHT_WRITE_OWNER            = 0x00080000,
    ADS_RIGHT_SYNCHRONIZE            = 0x00100000,
    ADS_RIGHT_ACCESS_SYSTEM_SECURITY = 0x01000000,
    ADS_RIGHT_GENERIC_READ           = 0x80000000,
    ADS_RIGHT_GENERIC_WRITE          = 0x40000000,
    ADS_RIGHT_GENERIC_EXECUTE        = 0x20000000,
    ADS_RIGHT_GENERIC_ALL            = 0x10000000,
    ADS_RIGHT_DS_CREATE_CHILD        = 0x00000001,
    ADS_RIGHT_DS_DELETE_CHILD        = 0x00000002,
    ADS_RIGHT_ACTRL_DS_LIST          = 0x00000004,
    ADS_RIGHT_DS_SELF                = 0x00000008,
    ADS_RIGHT_DS_READ_PROP           = 0x00000010,
    ADS_RIGHT_DS_WRITE_PROP          = 0x00000020,
    ADS_RIGHT_DS_DELETE_TREE         = 0x00000040,
    ADS_RIGHT_DS_LIST_OBJECT         = 0x00000080,
    ADS_RIGHT_DS_CONTROL_ACCESS      = 0x00000100,
}

alias ADS_ACETYPE_ENUM = int;
enum : int
{
    ADS_ACETYPE_ACCESS_ALLOWED                 = 0x00000000,
    ADS_ACETYPE_ACCESS_DENIED                  = 0x00000001,
    ADS_ACETYPE_SYSTEM_AUDIT                   = 0x00000002,
    ADS_ACETYPE_ACCESS_ALLOWED_OBJECT          = 0x00000005,
    ADS_ACETYPE_ACCESS_DENIED_OBJECT           = 0x00000006,
    ADS_ACETYPE_SYSTEM_AUDIT_OBJECT            = 0x00000007,
    ADS_ACETYPE_SYSTEM_ALARM_OBJECT            = 0x00000008,
    ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK        = 0x00000009,
    ADS_ACETYPE_ACCESS_DENIED_CALLBACK         = 0x0000000a,
    ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK_OBJECT = 0x0000000b,
    ADS_ACETYPE_ACCESS_DENIED_CALLBACK_OBJECT  = 0x0000000c,
    ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK          = 0x0000000d,
    ADS_ACETYPE_SYSTEM_ALARM_CALLBACK          = 0x0000000e,
    ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK_OBJECT   = 0x0000000f,
    ADS_ACETYPE_SYSTEM_ALARM_CALLBACK_OBJECT   = 0x00000010,
}

alias ADS_ACEFLAG_ENUM = int;
enum : int
{
    ADS_ACEFLAG_INHERIT_ACE              = 0x00000002,
    ADS_ACEFLAG_NO_PROPAGATE_INHERIT_ACE = 0x00000004,
    ADS_ACEFLAG_INHERIT_ONLY_ACE         = 0x00000008,
    ADS_ACEFLAG_INHERITED_ACE            = 0x00000010,
    ADS_ACEFLAG_VALID_INHERIT_FLAGS      = 0x0000001f,
    ADS_ACEFLAG_SUCCESSFUL_ACCESS        = 0x00000040,
    ADS_ACEFLAG_FAILED_ACCESS            = 0x00000080,
}

alias ADS_FLAGTYPE_ENUM = int;
enum : int
{
    ADS_FLAG_OBJECT_TYPE_PRESENT           = 0x00000001,
    ADS_FLAG_INHERITED_OBJECT_TYPE_PRESENT = 0x00000002,
}

alias ADS_SD_CONTROL_ENUM = int;
enum : int
{
    ADS_SD_CONTROL_SE_OWNER_DEFAULTED       = 0x00000001,
    ADS_SD_CONTROL_SE_GROUP_DEFAULTED       = 0x00000002,
    ADS_SD_CONTROL_SE_DACL_PRESENT          = 0x00000004,
    ADS_SD_CONTROL_SE_DACL_DEFAULTED        = 0x00000008,
    ADS_SD_CONTROL_SE_SACL_PRESENT          = 0x00000010,
    ADS_SD_CONTROL_SE_SACL_DEFAULTED        = 0x00000020,
    ADS_SD_CONTROL_SE_DACL_AUTO_INHERIT_REQ = 0x00000100,
    ADS_SD_CONTROL_SE_SACL_AUTO_INHERIT_REQ = 0x00000200,
    ADS_SD_CONTROL_SE_DACL_AUTO_INHERITED   = 0x00000400,
    ADS_SD_CONTROL_SE_SACL_AUTO_INHERITED   = 0x00000800,
    ADS_SD_CONTROL_SE_DACL_PROTECTED        = 0x00001000,
    ADS_SD_CONTROL_SE_SACL_PROTECTED        = 0x00002000,
    ADS_SD_CONTROL_SE_SELF_RELATIVE         = 0x00008000,
}

alias ADS_SD_REVISION_ENUM = int;
enum : int
{
    ADS_SD_REVISION_DS = 0x00000004,
}

alias ADS_NAME_TYPE_ENUM = int;
enum : int
{
    ADS_NAME_TYPE_1779                    = 0x00000001,
    ADS_NAME_TYPE_CANONICAL               = 0x00000002,
    ADS_NAME_TYPE_NT4                     = 0x00000003,
    ADS_NAME_TYPE_DISPLAY                 = 0x00000004,
    ADS_NAME_TYPE_DOMAIN_SIMPLE           = 0x00000005,
    ADS_NAME_TYPE_ENTERPRISE_SIMPLE       = 0x00000006,
    ADS_NAME_TYPE_GUID                    = 0x00000007,
    ADS_NAME_TYPE_UNKNOWN                 = 0x00000008,
    ADS_NAME_TYPE_USER_PRINCIPAL_NAME     = 0x00000009,
    ADS_NAME_TYPE_CANONICAL_EX            = 0x0000000a,
    ADS_NAME_TYPE_SERVICE_PRINCIPAL_NAME  = 0x0000000b,
    ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME = 0x0000000c,
}

alias ADS_NAME_INITTYPE_ENUM = int;
enum : int
{
    ADS_NAME_INITTYPE_DOMAIN = 0x00000001,
    ADS_NAME_INITTYPE_SERVER = 0x00000002,
    ADS_NAME_INITTYPE_GC     = 0x00000003,
}

alias ADS_OPTION_ENUM = int;
enum : int
{
    ADS_OPTION_SERVERNAME                = 0x00000000,
    ADS_OPTION_REFERRALS                 = 0x00000001,
    ADS_OPTION_PAGE_SIZE                 = 0x00000002,
    ADS_OPTION_SECURITY_MASK             = 0x00000003,
    ADS_OPTION_MUTUAL_AUTH_STATUS        = 0x00000004,
    ADS_OPTION_QUOTA                     = 0x00000005,
    ADS_OPTION_PASSWORD_PORTNUMBER       = 0x00000006,
    ADS_OPTION_PASSWORD_METHOD           = 0x00000007,
    ADS_OPTION_ACCUMULATIVE_MODIFICATION = 0x00000008,
    ADS_OPTION_SKIP_SID_LOOKUP           = 0x00000009,
}

alias ADS_SECURITY_INFO_ENUM = int;
enum : int
{
    ADS_SECURITY_INFO_OWNER = 0x00000001,
    ADS_SECURITY_INFO_GROUP = 0x00000002,
    ADS_SECURITY_INFO_DACL  = 0x00000004,
    ADS_SECURITY_INFO_SACL  = 0x00000008,
}

alias ADS_SETTYPE_ENUM = int;
enum : int
{
    ADS_SETTYPE_FULL     = 0x00000001,
    ADS_SETTYPE_PROVIDER = 0x00000002,
    ADS_SETTYPE_SERVER   = 0x00000003,
    ADS_SETTYPE_DN       = 0x00000004,
}

alias ADS_FORMAT_ENUM = int;
enum : int
{
    ADS_FORMAT_WINDOWS           = 0x00000001,
    ADS_FORMAT_WINDOWS_NO_SERVER = 0x00000002,
    ADS_FORMAT_WINDOWS_DN        = 0x00000003,
    ADS_FORMAT_WINDOWS_PARENT    = 0x00000004,
    ADS_FORMAT_X500              = 0x00000005,
    ADS_FORMAT_X500_NO_SERVER    = 0x00000006,
    ADS_FORMAT_X500_DN           = 0x00000007,
    ADS_FORMAT_X500_PARENT       = 0x00000008,
    ADS_FORMAT_SERVER            = 0x00000009,
    ADS_FORMAT_PROVIDER          = 0x0000000a,
    ADS_FORMAT_LEAF              = 0x0000000b,
}

alias ADS_DISPLAY_ENUM = int;
enum : int
{
    ADS_DISPLAY_FULL       = 0x00000001,
    ADS_DISPLAY_VALUE_ONLY = 0x00000002,
}

alias ADS_ESCAPE_MODE_ENUM = int;
enum : int
{
    ADS_ESCAPEDMODE_DEFAULT = 0x00000001,
    ADS_ESCAPEDMODE_ON      = 0x00000002,
    ADS_ESCAPEDMODE_OFF     = 0x00000003,
    ADS_ESCAPEDMODE_OFF_EX  = 0x00000004,
}

alias ADS_PATHTYPE_ENUM = int;
enum : int
{
    ADS_PATH_FILE      = 0x00000001,
    ADS_PATH_FILESHARE = 0x00000002,
    ADS_PATH_REGISTRY  = 0x00000003,
}

alias ADS_SD_FORMAT_ENUM = int;
enum : int
{
    ADS_SD_FORMAT_IID       = 0x00000001,
    ADS_SD_FORMAT_RAW       = 0x00000002,
    ADS_SD_FORMAT_HEXSTRING = 0x00000003,
}

enum IID_IADs = GUID(0xfd8256d0, 0xfd15, 0x11ce, [0xab, 0xc4, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADs : IDispatch
{
    HRESULT get_Name(BSTR* retval);
    HRESULT get_Class(BSTR* retval);
    HRESULT get_GUID(BSTR* retval);
    HRESULT get_ADsPath(BSTR* retval);
    HRESULT get_Parent(BSTR* retval);
    HRESULT get_Schema(BSTR* retval);
    HRESULT GetInfo();
    HRESULT SetInfo();
    HRESULT Get(BSTR bstrName, VARIANT* pvProp);
    HRESULT Put(BSTR bstrName, VARIANT vProp);
    HRESULT GetEx(BSTR bstrName, VARIANT* pvProp);
    HRESULT PutEx(int lnControlCode, BSTR bstrName, VARIANT vProp);
    HRESULT GetInfoEx(VARIANT vProperties, int lnReserved);
}
enum IID_IADsContainer = GUID(0x1677d0, 0xfd16, 0x11ce, [0xab, 0xc4, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsContainer : IDispatch
{
    HRESULT get_Count(int* retval);
    HRESULT get__NewEnum(IUnknown* retval);
    HRESULT get_Filter(VARIANT* pVar);
    HRESULT put_Filter(VARIANT Var);
    HRESULT get_Hints(VARIANT* pvFilter);
    HRESULT put_Hints(VARIANT vHints);
    HRESULT GetObject(BSTR ClassName, BSTR RelativeName, IDispatch* ppObject);
    HRESULT Create(BSTR ClassName, BSTR RelativeName, IDispatch* ppObject);
    HRESULT Delete(BSTR bstrClassName, BSTR bstrRelativeName);
    HRESULT CopyHere(BSTR SourceName, BSTR NewName, IDispatch* ppObject);
    HRESULT MoveHere(BSTR SourceName, BSTR NewName, IDispatch* ppObject);
}
enum IID_IADsCollection = GUID(0x72b945e0, 0x253b, 0x11cf, [0xa9, 0x88, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown* ppEnumerator);
    HRESULT Add(BSTR bstrName, VARIANT vItem);
    HRESULT Remove(BSTR bstrItemToBeRemoved);
    HRESULT GetObject(BSTR bstrName, VARIANT* pvItem);
}
enum IID_IADsMembers = GUID(0x451a0030, 0x72ec, 0x11cf, [0xb0, 0x3b, 0x0, 0xaa, 0x0, 0x6e, 0x9, 0x75]);
interface IADsMembers : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get__NewEnum(IUnknown* ppEnumerator);
    HRESULT get_Filter(VARIANT* pvFilter);
    HRESULT put_Filter(VARIANT pvFilter);
}
enum IID_IADsPropertyList = GUID(0xc6f602b6, 0x8f69, 0x11d0, [0x85, 0x28, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsPropertyList : IDispatch
{
    HRESULT get_PropertyCount(int* plCount);
    HRESULT Next(VARIANT* pVariant);
    HRESULT Skip(int cElements);
    HRESULT Reset();
    HRESULT Item(VARIANT varIndex, VARIANT* pVariant);
    HRESULT GetPropertyItem(BSTR bstrName, int lnADsType, VARIANT* pVariant);
    HRESULT PutPropertyItem(VARIANT varData);
    HRESULT ResetPropertyItem(VARIANT varEntry);
    HRESULT PurgePropertyList();
}
enum IID_IADsPropertyEntry = GUID(0x5792c8e, 0x941f, 0x11d0, [0x85, 0x29, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsPropertyEntry : IDispatch
{
    HRESULT Clear();
    HRESULT get_Name(BSTR* retval);
    HRESULT put_Name(BSTR bstrName);
    HRESULT get_ADsType(int* retval);
    HRESULT put_ADsType(int lnADsType);
    HRESULT get_ControlCode(int* retval);
    HRESULT put_ControlCode(int lnControlCode);
    HRESULT get_Values(VARIANT* retval);
    HRESULT put_Values(VARIANT vValues);
}
enum CLSID_PropertyEntry = GUID(0x72d3edc2, 0xa4c4, 0x11d0, [0x85, 0x33, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct PropertyEntry
{
}
enum IID_IADsPropertyValue = GUID(0x79fa9ad0, 0xa97c, 0x11d0, [0x85, 0x34, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsPropertyValue : IDispatch
{
    HRESULT Clear();
    HRESULT get_ADsType(int* retval);
    HRESULT put_ADsType(int lnADsType);
    HRESULT get_DNString(BSTR* retval);
    HRESULT put_DNString(BSTR bstrDNString);
    HRESULT get_CaseExactString(BSTR* retval);
    HRESULT put_CaseExactString(BSTR bstrCaseExactString);
    HRESULT get_CaseIgnoreString(BSTR* retval);
    HRESULT put_CaseIgnoreString(BSTR bstrCaseIgnoreString);
    HRESULT get_PrintableString(BSTR* retval);
    HRESULT put_PrintableString(BSTR bstrPrintableString);
    HRESULT get_NumericString(BSTR* retval);
    HRESULT put_NumericString(BSTR bstrNumericString);
    HRESULT get_Boolean(int* retval);
    HRESULT put_Boolean(int lnBoolean);
    HRESULT get_Integer(int* retval);
    HRESULT put_Integer(int lnInteger);
    HRESULT get_OctetString(VARIANT* retval);
    HRESULT put_OctetString(VARIANT vOctetString);
    HRESULT get_SecurityDescriptor(IDispatch* retval);
    HRESULT put_SecurityDescriptor(IDispatch pSecurityDescriptor);
    HRESULT get_LargeInteger(IDispatch* retval);
    HRESULT put_LargeInteger(IDispatch pLargeInteger);
    HRESULT get_UTCTime(double* retval);
    HRESULT put_UTCTime(double daUTCTime);
}
enum IID_IADsPropertyValue2 = GUID(0x306e831c, 0x5bc7, 0x11d1, [0xa3, 0xb8, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsPropertyValue2 : IDispatch
{
    HRESULT GetObjectProperty(int* lnADsType, VARIANT* pvProp);
    HRESULT PutObjectProperty(int lnADsType, VARIANT vProp);
}
enum CLSID_PropertyValue = GUID(0x7b9e38b0, 0xa97c, 0x11d0, [0x85, 0x34, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct PropertyValue
{
}
enum IID_IPrivateDispatch = GUID(0x86ab4bbe, 0x65f6, 0x11d1, [0x8c, 0x13, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IPrivateDispatch : IUnknown
{
    HRESULT ADSIInitializeDispatchManager(int dwExtensionId);
    HRESULT ADSIGetTypeInfoCount(uint* pctinfo);
    HRESULT ADSIGetTypeInfo(uint itinfo, uint lcid, ITypeInfo* pptinfo);
    HRESULT ADSIGetIDsOfNames(const(GUID)* riid, ushort** rgszNames, uint cNames, uint lcid, int* rgdispid);
    HRESULT ADSIInvoke(int dispidMember, const(GUID)* riid, uint lcid, ushort wFlags, DISPPARAMS* pdispparams, VARIANT* pvarResult, EXCEPINFO* pexcepinfo, uint* puArgErr);
}
enum IID_IPrivateUnknown = GUID(0x89126bab, 0x6ead, 0x11d1, [0x8c, 0x18, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IPrivateUnknown : IUnknown
{
    HRESULT ADSIInitializeObject(BSTR lpszUserName, BSTR lpszPassword, int lnReserved);
    HRESULT ADSIReleaseObject();
}
enum IID_IADsExtension = GUID(0x3d35553c, 0xd2b0, 0x11d1, [0xb1, 0x7b, 0x0, 0x0, 0xf8, 0x75, 0x93, 0xa0]);
interface IADsExtension : IUnknown
{
    HRESULT Operate(uint dwCode, VARIANT varData1, VARIANT varData2, VARIANT varData3);
    HRESULT PrivateGetIDsOfNames(const(GUID)* riid, ushort** rgszNames, uint cNames, uint lcid, int* rgDispid);
    HRESULT PrivateInvoke(int dispidMember, const(GUID)* riid, uint lcid, ushort wFlags, DISPPARAMS* pdispparams, VARIANT* pvarResult, EXCEPINFO* pexcepinfo, uint* puArgErr);
}
enum IID_IADsDeleteOps = GUID(0xb2bd0902, 0x8878, 0x11d1, [0x8c, 0x21, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsDeleteOps : IDispatch
{
    HRESULT DeleteObject(int lnFlags);
}
enum IID_IADsNamespaces = GUID(0x28b96ba0, 0xb330, 0x11cf, [0xa9, 0xad, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsNamespaces : IADs
{
    HRESULT get_DefaultContainer(BSTR* retval);
    HRESULT put_DefaultContainer(BSTR bstrDefaultContainer);
}
enum IID_IADsClass = GUID(0xc8f93dd0, 0x4ae0, 0x11cf, [0x9e, 0x73, 0x0, 0xaa, 0x0, 0x4a, 0x56, 0x91]);
interface IADsClass : IADs
{
    HRESULT get_PrimaryInterface(BSTR* retval);
    HRESULT get_CLSID(BSTR* retval);
    HRESULT put_CLSID(BSTR bstrCLSID);
    HRESULT get_OID(BSTR* retval);
    HRESULT put_OID(BSTR bstrOID);
    HRESULT get_Abstract(VARIANT_BOOL* retval);
    HRESULT put_Abstract(VARIANT_BOOL fAbstract);
    HRESULT get_Auxiliary(VARIANT_BOOL* retval);
    HRESULT put_Auxiliary(VARIANT_BOOL fAuxiliary);
    HRESULT get_MandatoryProperties(VARIANT* retval);
    HRESULT put_MandatoryProperties(VARIANT vMandatoryProperties);
    HRESULT get_OptionalProperties(VARIANT* retval);
    HRESULT put_OptionalProperties(VARIANT vOptionalProperties);
    HRESULT get_NamingProperties(VARIANT* retval);
    HRESULT put_NamingProperties(VARIANT vNamingProperties);
    HRESULT get_DerivedFrom(VARIANT* retval);
    HRESULT put_DerivedFrom(VARIANT vDerivedFrom);
    HRESULT get_AuxDerivedFrom(VARIANT* retval);
    HRESULT put_AuxDerivedFrom(VARIANT vAuxDerivedFrom);
    HRESULT get_PossibleSuperiors(VARIANT* retval);
    HRESULT put_PossibleSuperiors(VARIANT vPossibleSuperiors);
    HRESULT get_Containment(VARIANT* retval);
    HRESULT put_Containment(VARIANT vContainment);
    HRESULT get_Container(VARIANT_BOOL* retval);
    HRESULT put_Container(VARIANT_BOOL fContainer);
    HRESULT get_HelpFileName(BSTR* retval);
    HRESULT put_HelpFileName(BSTR bstrHelpFileName);
    HRESULT get_HelpFileContext(int* retval);
    HRESULT put_HelpFileContext(int lnHelpFileContext);
    HRESULT Qualifiers(IADsCollection* ppQualifiers);
}
enum IID_IADsProperty = GUID(0xc8f93dd3, 0x4ae0, 0x11cf, [0x9e, 0x73, 0x0, 0xaa, 0x0, 0x4a, 0x56, 0x91]);
interface IADsProperty : IADs
{
    HRESULT get_OID(BSTR* retval);
    HRESULT put_OID(BSTR bstrOID);
    HRESULT get_Syntax(BSTR* retval);
    HRESULT put_Syntax(BSTR bstrSyntax);
    HRESULT get_MaxRange(int* retval);
    HRESULT put_MaxRange(int lnMaxRange);
    HRESULT get_MinRange(int* retval);
    HRESULT put_MinRange(int lnMinRange);
    HRESULT get_MultiValued(VARIANT_BOOL* retval);
    HRESULT put_MultiValued(VARIANT_BOOL fMultiValued);
    HRESULT Qualifiers(IADsCollection* ppQualifiers);
}
enum IID_IADsSyntax = GUID(0xc8f93dd2, 0x4ae0, 0x11cf, [0x9e, 0x73, 0x0, 0xaa, 0x0, 0x4a, 0x56, 0x91]);
interface IADsSyntax : IADs
{
    HRESULT get_OleAutoDataType(int* retval);
    HRESULT put_OleAutoDataType(int lnOleAutoDataType);
}
enum IID_IADsLocality = GUID(0xa05e03a2, 0xeffe, 0x11cf, [0x8a, 0xbc, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsLocality : IADs
{
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_LocalityName(BSTR* retval);
    HRESULT put_LocalityName(BSTR bstrLocalityName);
    HRESULT get_PostalAddress(BSTR* retval);
    HRESULT put_PostalAddress(BSTR bstrPostalAddress);
    HRESULT get_SeeAlso(VARIANT* retval);
    HRESULT put_SeeAlso(VARIANT vSeeAlso);
}
enum IID_IADsO = GUID(0xa1cd2dc6, 0xeffe, 0x11cf, [0x8a, 0xbc, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsO : IADs
{
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_LocalityName(BSTR* retval);
    HRESULT put_LocalityName(BSTR bstrLocalityName);
    HRESULT get_PostalAddress(BSTR* retval);
    HRESULT put_PostalAddress(BSTR bstrPostalAddress);
    HRESULT get_TelephoneNumber(BSTR* retval);
    HRESULT put_TelephoneNumber(BSTR bstrTelephoneNumber);
    HRESULT get_FaxNumber(BSTR* retval);
    HRESULT put_FaxNumber(BSTR bstrFaxNumber);
    HRESULT get_SeeAlso(VARIANT* retval);
    HRESULT put_SeeAlso(VARIANT vSeeAlso);
}
enum IID_IADsOU = GUID(0xa2f733b8, 0xeffe, 0x11cf, [0x8a, 0xbc, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsOU : IADs
{
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_LocalityName(BSTR* retval);
    HRESULT put_LocalityName(BSTR bstrLocalityName);
    HRESULT get_PostalAddress(BSTR* retval);
    HRESULT put_PostalAddress(BSTR bstrPostalAddress);
    HRESULT get_TelephoneNumber(BSTR* retval);
    HRESULT put_TelephoneNumber(BSTR bstrTelephoneNumber);
    HRESULT get_FaxNumber(BSTR* retval);
    HRESULT put_FaxNumber(BSTR bstrFaxNumber);
    HRESULT get_SeeAlso(VARIANT* retval);
    HRESULT put_SeeAlso(VARIANT vSeeAlso);
    HRESULT get_BusinessCategory(BSTR* retval);
    HRESULT put_BusinessCategory(BSTR bstrBusinessCategory);
}
enum IID_IADsDomain = GUID(0xe4c220, 0xfd16, 0x11ce, [0xab, 0xc4, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsDomain : IADs
{
    HRESULT get_IsWorkgroup(VARIANT_BOOL* retval);
    HRESULT get_MinPasswordLength(int* retval);
    HRESULT put_MinPasswordLength(int lnMinPasswordLength);
    HRESULT get_MinPasswordAge(int* retval);
    HRESULT put_MinPasswordAge(int lnMinPasswordAge);
    HRESULT get_MaxPasswordAge(int* retval);
    HRESULT put_MaxPasswordAge(int lnMaxPasswordAge);
    HRESULT get_MaxBadPasswordsAllowed(int* retval);
    HRESULT put_MaxBadPasswordsAllowed(int lnMaxBadPasswordsAllowed);
    HRESULT get_PasswordHistoryLength(int* retval);
    HRESULT put_PasswordHistoryLength(int lnPasswordHistoryLength);
    HRESULT get_PasswordAttributes(int* retval);
    HRESULT put_PasswordAttributes(int lnPasswordAttributes);
    HRESULT get_AutoUnlockInterval(int* retval);
    HRESULT put_AutoUnlockInterval(int lnAutoUnlockInterval);
    HRESULT get_LockoutObservationInterval(int* retval);
    HRESULT put_LockoutObservationInterval(int lnLockoutObservationInterval);
}
enum IID_IADsComputer = GUID(0xefe3cc70, 0x1d9f, 0x11cf, [0xb1, 0xf3, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsComputer : IADs
{
    HRESULT get_ComputerID(BSTR* retval);
    HRESULT get_Site(BSTR* retval);
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_Location(BSTR* retval);
    HRESULT put_Location(BSTR bstrLocation);
    HRESULT get_PrimaryUser(BSTR* retval);
    HRESULT put_PrimaryUser(BSTR bstrPrimaryUser);
    HRESULT get_Owner(BSTR* retval);
    HRESULT put_Owner(BSTR bstrOwner);
    HRESULT get_Division(BSTR* retval);
    HRESULT put_Division(BSTR bstrDivision);
    HRESULT get_Department(BSTR* retval);
    HRESULT put_Department(BSTR bstrDepartment);
    HRESULT get_Role(BSTR* retval);
    HRESULT put_Role(BSTR bstrRole);
    HRESULT get_OperatingSystem(BSTR* retval);
    HRESULT put_OperatingSystem(BSTR bstrOperatingSystem);
    HRESULT get_OperatingSystemVersion(BSTR* retval);
    HRESULT put_OperatingSystemVersion(BSTR bstrOperatingSystemVersion);
    HRESULT get_Model(BSTR* retval);
    HRESULT put_Model(BSTR bstrModel);
    HRESULT get_Processor(BSTR* retval);
    HRESULT put_Processor(BSTR bstrProcessor);
    HRESULT get_ProcessorCount(BSTR* retval);
    HRESULT put_ProcessorCount(BSTR bstrProcessorCount);
    HRESULT get_MemorySize(BSTR* retval);
    HRESULT put_MemorySize(BSTR bstrMemorySize);
    HRESULT get_StorageCapacity(BSTR* retval);
    HRESULT put_StorageCapacity(BSTR bstrStorageCapacity);
    HRESULT get_NetAddresses(VARIANT* retval);
    HRESULT put_NetAddresses(VARIANT vNetAddresses);
}
enum IID_IADsComputerOperations = GUID(0xef497680, 0x1d9f, 0x11cf, [0xb1, 0xf3, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsComputerOperations : IADs
{
    HRESULT Status(IDispatch* ppObject);
    HRESULT Shutdown(VARIANT_BOOL bReboot);
}
enum IID_IADsGroup = GUID(0x27636b00, 0x410f, 0x11cf, [0xb1, 0xff, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsGroup : IADs
{
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT Members(IADsMembers* ppMembers);
    HRESULT IsMember(BSTR bstrMember, VARIANT_BOOL* bMember);
    HRESULT Add(BSTR bstrNewItem);
    HRESULT Remove(BSTR bstrItemToBeRemoved);
}
enum IID_IADsUser = GUID(0x3e37e320, 0x17e2, 0x11cf, [0xab, 0xc4, 0x2, 0x60, 0x8c, 0x9e, 0x75, 0x53]);
interface IADsUser : IADs
{
    HRESULT get_BadLoginAddress(BSTR* retval);
    HRESULT get_BadLoginCount(int* retval);
    HRESULT get_LastLogin(double* retval);
    HRESULT get_LastLogoff(double* retval);
    HRESULT get_LastFailedLogin(double* retval);
    HRESULT get_PasswordLastChanged(double* retval);
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_Division(BSTR* retval);
    HRESULT put_Division(BSTR bstrDivision);
    HRESULT get_Department(BSTR* retval);
    HRESULT put_Department(BSTR bstrDepartment);
    HRESULT get_EmployeeID(BSTR* retval);
    HRESULT put_EmployeeID(BSTR bstrEmployeeID);
    HRESULT get_FullName(BSTR* retval);
    HRESULT put_FullName(BSTR bstrFullName);
    HRESULT get_FirstName(BSTR* retval);
    HRESULT put_FirstName(BSTR bstrFirstName);
    HRESULT get_LastName(BSTR* retval);
    HRESULT put_LastName(BSTR bstrLastName);
    HRESULT get_OtherName(BSTR* retval);
    HRESULT put_OtherName(BSTR bstrOtherName);
    HRESULT get_NamePrefix(BSTR* retval);
    HRESULT put_NamePrefix(BSTR bstrNamePrefix);
    HRESULT get_NameSuffix(BSTR* retval);
    HRESULT put_NameSuffix(BSTR bstrNameSuffix);
    HRESULT get_Title(BSTR* retval);
    HRESULT put_Title(BSTR bstrTitle);
    HRESULT get_Manager(BSTR* retval);
    HRESULT put_Manager(BSTR bstrManager);
    HRESULT get_TelephoneHome(VARIANT* retval);
    HRESULT put_TelephoneHome(VARIANT vTelephoneHome);
    HRESULT get_TelephoneMobile(VARIANT* retval);
    HRESULT put_TelephoneMobile(VARIANT vTelephoneMobile);
    HRESULT get_TelephoneNumber(VARIANT* retval);
    HRESULT put_TelephoneNumber(VARIANT vTelephoneNumber);
    HRESULT get_TelephonePager(VARIANT* retval);
    HRESULT put_TelephonePager(VARIANT vTelephonePager);
    HRESULT get_FaxNumber(VARIANT* retval);
    HRESULT put_FaxNumber(VARIANT vFaxNumber);
    HRESULT get_OfficeLocations(VARIANT* retval);
    HRESULT put_OfficeLocations(VARIANT vOfficeLocations);
    HRESULT get_PostalAddresses(VARIANT* retval);
    HRESULT put_PostalAddresses(VARIANT vPostalAddresses);
    HRESULT get_PostalCodes(VARIANT* retval);
    HRESULT put_PostalCodes(VARIANT vPostalCodes);
    HRESULT get_SeeAlso(VARIANT* retval);
    HRESULT put_SeeAlso(VARIANT vSeeAlso);
    HRESULT get_AccountDisabled(VARIANT_BOOL* retval);
    HRESULT put_AccountDisabled(VARIANT_BOOL fAccountDisabled);
    HRESULT get_AccountExpirationDate(double* retval);
    HRESULT put_AccountExpirationDate(double daAccountExpirationDate);
    HRESULT get_GraceLoginsAllowed(int* retval);
    HRESULT put_GraceLoginsAllowed(int lnGraceLoginsAllowed);
    HRESULT get_GraceLoginsRemaining(int* retval);
    HRESULT put_GraceLoginsRemaining(int lnGraceLoginsRemaining);
    HRESULT get_IsAccountLocked(VARIANT_BOOL* retval);
    HRESULT put_IsAccountLocked(VARIANT_BOOL fIsAccountLocked);
    HRESULT get_LoginHours(VARIANT* retval);
    HRESULT put_LoginHours(VARIANT vLoginHours);
    HRESULT get_LoginWorkstations(VARIANT* retval);
    HRESULT put_LoginWorkstations(VARIANT vLoginWorkstations);
    HRESULT get_MaxLogins(int* retval);
    HRESULT put_MaxLogins(int lnMaxLogins);
    HRESULT get_MaxStorage(int* retval);
    HRESULT put_MaxStorage(int lnMaxStorage);
    HRESULT get_PasswordExpirationDate(double* retval);
    HRESULT put_PasswordExpirationDate(double daPasswordExpirationDate);
    HRESULT get_PasswordMinimumLength(int* retval);
    HRESULT put_PasswordMinimumLength(int lnPasswordMinimumLength);
    HRESULT get_PasswordRequired(VARIANT_BOOL* retval);
    HRESULT put_PasswordRequired(VARIANT_BOOL fPasswordRequired);
    HRESULT get_RequireUniquePassword(VARIANT_BOOL* retval);
    HRESULT put_RequireUniquePassword(VARIANT_BOOL fRequireUniquePassword);
    HRESULT get_EmailAddress(BSTR* retval);
    HRESULT put_EmailAddress(BSTR bstrEmailAddress);
    HRESULT get_HomeDirectory(BSTR* retval);
    HRESULT put_HomeDirectory(BSTR bstrHomeDirectory);
    HRESULT get_Languages(VARIANT* retval);
    HRESULT put_Languages(VARIANT vLanguages);
    HRESULT get_Profile(BSTR* retval);
    HRESULT put_Profile(BSTR bstrProfile);
    HRESULT get_LoginScript(BSTR* retval);
    HRESULT put_LoginScript(BSTR bstrLoginScript);
    HRESULT get_Picture(VARIANT* retval);
    HRESULT put_Picture(VARIANT vPicture);
    HRESULT get_HomePage(BSTR* retval);
    HRESULT put_HomePage(BSTR bstrHomePage);
    HRESULT Groups(IADsMembers* ppGroups);
    HRESULT SetPassword(BSTR NewPassword);
    HRESULT ChangePassword(BSTR bstrOldPassword, BSTR bstrNewPassword);
}
enum IID_IADsPrintQueue = GUID(0xb15160d0, 0x1226, 0x11cf, [0xa9, 0x85, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsPrintQueue : IADs
{
    HRESULT get_PrinterPath(BSTR* retval);
    HRESULT put_PrinterPath(BSTR bstrPrinterPath);
    HRESULT get_Model(BSTR* retval);
    HRESULT put_Model(BSTR bstrModel);
    HRESULT get_Datatype(BSTR* retval);
    HRESULT put_Datatype(BSTR bstrDatatype);
    HRESULT get_PrintProcessor(BSTR* retval);
    HRESULT put_PrintProcessor(BSTR bstrPrintProcessor);
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_Location(BSTR* retval);
    HRESULT put_Location(BSTR bstrLocation);
    HRESULT get_StartTime(double* retval);
    HRESULT put_StartTime(double daStartTime);
    HRESULT get_UntilTime(double* retval);
    HRESULT put_UntilTime(double daUntilTime);
    HRESULT get_DefaultJobPriority(int* retval);
    HRESULT put_DefaultJobPriority(int lnDefaultJobPriority);
    HRESULT get_Priority(int* retval);
    HRESULT put_Priority(int lnPriority);
    HRESULT get_BannerPage(BSTR* retval);
    HRESULT put_BannerPage(BSTR bstrBannerPage);
    HRESULT get_PrintDevices(VARIANT* retval);
    HRESULT put_PrintDevices(VARIANT vPrintDevices);
    HRESULT get_NetAddresses(VARIANT* retval);
    HRESULT put_NetAddresses(VARIANT vNetAddresses);
}
enum IID_IADsPrintQueueOperations = GUID(0x124be5c0, 0x156e, 0x11cf, [0xa9, 0x86, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsPrintQueueOperations : IADs
{
    HRESULT get_Status(int* retval);
    HRESULT PrintJobs(IADsCollection* pObject);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Purge();
}
enum IID_IADsPrintJob = GUID(0x32fb6780, 0x1ed0, 0x11cf, [0xa9, 0x88, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsPrintJob : IADs
{
    HRESULT get_HostPrintQueue(BSTR* retval);
    HRESULT get_User(BSTR* retval);
    HRESULT get_UserPath(BSTR* retval);
    HRESULT get_TimeSubmitted(double* retval);
    HRESULT get_TotalPages(int* retval);
    HRESULT get_Size(int* retval);
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_Priority(int* retval);
    HRESULT put_Priority(int lnPriority);
    HRESULT get_StartTime(double* retval);
    HRESULT put_StartTime(double daStartTime);
    HRESULT get_UntilTime(double* retval);
    HRESULT put_UntilTime(double daUntilTime);
    HRESULT get_Notify(BSTR* retval);
    HRESULT put_Notify(BSTR bstrNotify);
    HRESULT get_NotifyPath(BSTR* retval);
    HRESULT put_NotifyPath(BSTR bstrNotifyPath);
}
enum IID_IADsPrintJobOperations = GUID(0x9a52db30, 0x1ecf, 0x11cf, [0xa9, 0x88, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsPrintJobOperations : IADs
{
    HRESULT get_Status(int* retval);
    HRESULT get_TimeElapsed(int* retval);
    HRESULT get_PagesPrinted(int* retval);
    HRESULT get_Position(int* retval);
    HRESULT put_Position(int lnPosition);
    HRESULT Pause();
    HRESULT Resume();
}
enum IID_IADsService = GUID(0x68af66e0, 0x31ca, 0x11cf, [0xa9, 0x8a, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsService : IADs
{
    HRESULT get_HostComputer(BSTR* retval);
    HRESULT put_HostComputer(BSTR bstrHostComputer);
    HRESULT get_DisplayName(BSTR* retval);
    HRESULT put_DisplayName(BSTR bstrDisplayName);
    HRESULT get_Version(BSTR* retval);
    HRESULT put_Version(BSTR bstrVersion);
    HRESULT get_ServiceType(int* retval);
    HRESULT put_ServiceType(int lnServiceType);
    HRESULT get_StartType(int* retval);
    HRESULT put_StartType(int lnStartType);
    HRESULT get_Path(BSTR* retval);
    HRESULT put_Path(BSTR bstrPath);
    HRESULT get_StartupParameters(BSTR* retval);
    HRESULT put_StartupParameters(BSTR bstrStartupParameters);
    HRESULT get_ErrorControl(int* retval);
    HRESULT put_ErrorControl(int lnErrorControl);
    HRESULT get_LoadOrderGroup(BSTR* retval);
    HRESULT put_LoadOrderGroup(BSTR bstrLoadOrderGroup);
    HRESULT get_ServiceAccountName(BSTR* retval);
    HRESULT put_ServiceAccountName(BSTR bstrServiceAccountName);
    HRESULT get_ServiceAccountPath(BSTR* retval);
    HRESULT put_ServiceAccountPath(BSTR bstrServiceAccountPath);
    HRESULT get_Dependencies(VARIANT* retval);
    HRESULT put_Dependencies(VARIANT vDependencies);
}
enum IID_IADsServiceOperations = GUID(0x5d7b33f0, 0x31ca, 0x11cf, [0xa9, 0x8a, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsServiceOperations : IADs
{
    HRESULT get_Status(int* retval);
    HRESULT Start();
    HRESULT Stop();
    HRESULT Pause();
    HRESULT Continue();
    HRESULT SetPassword(BSTR bstrNewPassword);
}
enum IID_IADsFileService = GUID(0xa89d1900, 0x31ca, 0x11cf, [0xa9, 0x8a, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsFileService : IADsService
{
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_MaxUserCount(int* retval);
    HRESULT put_MaxUserCount(int lnMaxUserCount);
}
enum IID_IADsFileServiceOperations = GUID(0xa02ded10, 0x31ca, 0x11cf, [0xa9, 0x8a, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsFileServiceOperations : IADsServiceOperations
{
    HRESULT Sessions(IADsCollection* ppSessions);
    HRESULT Resources(IADsCollection* ppResources);
}
enum IID_IADsFileShare = GUID(0xeb6dcaf0, 0x4b83, 0x11cf, [0xa9, 0x95, 0x0, 0xaa, 0x0, 0x6b, 0xc1, 0x49]);
interface IADsFileShare : IADs
{
    HRESULT get_CurrentUserCount(int* retval);
    HRESULT get_Description(BSTR* retval);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_HostComputer(BSTR* retval);
    HRESULT put_HostComputer(BSTR bstrHostComputer);
    HRESULT get_Path(BSTR* retval);
    HRESULT put_Path(BSTR bstrPath);
    HRESULT get_MaxUserCount(int* retval);
    HRESULT put_MaxUserCount(int lnMaxUserCount);
}
enum IID_IADsSession = GUID(0x398b7da0, 0x4aab, 0x11cf, [0xae, 0x2c, 0x0, 0xaa, 0x0, 0x6e, 0xbf, 0xb9]);
interface IADsSession : IADs
{
    HRESULT get_User(BSTR* retval);
    HRESULT get_UserPath(BSTR* retval);
    HRESULT get_Computer(BSTR* retval);
    HRESULT get_ComputerPath(BSTR* retval);
    HRESULT get_ConnectTime(int* retval);
    HRESULT get_IdleTime(int* retval);
}
enum IID_IADsResource = GUID(0x34a05b20, 0x4aab, 0x11cf, [0xae, 0x2c, 0x0, 0xaa, 0x0, 0x6e, 0xbf, 0xb9]);
interface IADsResource : IADs
{
    HRESULT get_User(BSTR* retval);
    HRESULT get_UserPath(BSTR* retval);
    HRESULT get_Path(BSTR* retval);
    HRESULT get_LockCount(int* retval);
}
enum IID_IADsOpenDSObject = GUID(0xddf2891e, 0xf9c, 0x11d0, [0x8a, 0xd4, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsOpenDSObject : IDispatch
{
    HRESULT OpenDSObject(BSTR lpszDNName, BSTR lpszUserName, BSTR lpszPassword, int lnReserved, IDispatch* ppOleDsObj);
}
enum IID_IDirectoryObject = GUID(0xe798de2c, 0x22e4, 0x11d0, [0x84, 0xfe, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IDirectoryObject : IUnknown
{
    HRESULT GetObjectInformation(ADS_OBJECT_INFO** ppObjInfo);
    HRESULT GetObjectAttributes(PWSTR* pAttributeNames, uint dwNumberAttributes, ADS_ATTR_INFO** ppAttributeEntries, uint* pdwNumAttributesReturned);
    HRESULT SetObjectAttributes(ADS_ATTR_INFO* pAttributeEntries, uint dwNumAttributes, uint* pdwNumAttributesModified);
    HRESULT CreateDSObject(PWSTR pszRDNName, ADS_ATTR_INFO* pAttributeEntries, uint dwNumAttributes, IDispatch* ppObject);
    HRESULT DeleteDSObject(PWSTR pszRDNName);
}
enum IID_IDirectorySearch = GUID(0x109ba8ec, 0x92f0, 0x11d0, [0xa7, 0x90, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8]);
interface IDirectorySearch : IUnknown
{
    HRESULT SetSearchPreference(ADS_SEARCHPREF_INFO* pSearchPrefs, uint dwNumPrefs);
    HRESULT ExecuteSearch(PWSTR pszSearchFilter, PWSTR* pAttributeNames, uint dwNumberAttributes, ADS_SEARCH_HANDLE* phSearchResult);
    HRESULT AbandonSearch(ADS_SEARCH_HANDLE phSearchResult);
    HRESULT GetFirstRow(ADS_SEARCH_HANDLE hSearchResult);
    HRESULT GetNextRow(ADS_SEARCH_HANDLE hSearchResult);
    HRESULT GetPreviousRow(ADS_SEARCH_HANDLE hSearchResult);
    HRESULT GetNextColumnName(ADS_SEARCH_HANDLE hSearchHandle, PWSTR* ppszColumnName);
    HRESULT GetColumn(ADS_SEARCH_HANDLE hSearchResult, PWSTR szColumnName, ADS_SEARCH_COLUMN* pSearchColumn);
    HRESULT FreeColumn(ADS_SEARCH_COLUMN* pSearchColumn);
    HRESULT CloseSearchHandle(ADS_SEARCH_HANDLE hSearchResult);
}
enum IID_IDirectorySchemaMgmt = GUID(0x75db3b9c, 0xa4d8, 0x11d0, [0xa7, 0x9c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8]);
interface IDirectorySchemaMgmt : IUnknown
{
    HRESULT EnumAttributes(PWSTR* ppszAttrNames, uint dwNumAttributes, ADS_ATTR_DEF** ppAttrDefinition, uint* pdwNumAttributes);
    HRESULT CreateAttributeDefinition(PWSTR pszAttributeName, ADS_ATTR_DEF* pAttributeDefinition);
    HRESULT WriteAttributeDefinition(PWSTR pszAttributeName, ADS_ATTR_DEF* pAttributeDefinition);
    HRESULT DeleteAttributeDefinition(PWSTR pszAttributeName);
    HRESULT EnumClasses(PWSTR* ppszClassNames, uint dwNumClasses, ADS_CLASS_DEF** ppClassDefinition, uint* pdwNumClasses);
    HRESULT WriteClassDefinition(PWSTR pszClassName, ADS_CLASS_DEF* pClassDefinition);
    HRESULT CreateClassDefinition(PWSTR pszClassName, ADS_CLASS_DEF* pClassDefinition);
    HRESULT DeleteClassDefinition(PWSTR pszClassName);
}
enum IID_IADsAggregatee = GUID(0x1346ce8c, 0x9039, 0x11d0, [0x85, 0x28, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsAggregatee : IUnknown
{
    HRESULT ConnectAsAggregatee(IUnknown pOuterUnknown);
    HRESULT DisconnectAsAggregatee();
    HRESULT RelinquishInterface(const(GUID)* riid);
    HRESULT RestoreInterface(const(GUID)* riid);
}
enum IID_IADsAggregator = GUID(0x52db5fb0, 0x941f, 0x11d0, [0x85, 0x29, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsAggregator : IUnknown
{
    HRESULT ConnectAsAggregator(IUnknown pAggregatee);
    HRESULT DisconnectAsAggregator();
}
enum IID_IADsAccessControlEntry = GUID(0xb4f3a14c, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsAccessControlEntry : IDispatch
{
    HRESULT get_AccessMask(int* retval);
    HRESULT put_AccessMask(int lnAccessMask);
    HRESULT get_AceType(int* retval);
    HRESULT put_AceType(int lnAceType);
    HRESULT get_AceFlags(int* retval);
    HRESULT put_AceFlags(int lnAceFlags);
    HRESULT get_Flags(int* retval);
    HRESULT put_Flags(int lnFlags);
    HRESULT get_ObjectType(BSTR* retval);
    HRESULT put_ObjectType(BSTR bstrObjectType);
    HRESULT get_InheritedObjectType(BSTR* retval);
    HRESULT put_InheritedObjectType(BSTR bstrInheritedObjectType);
    HRESULT get_Trustee(BSTR* retval);
    HRESULT put_Trustee(BSTR bstrTrustee);
}
enum CLSID_AccessControlEntry = GUID(0xb75ac000, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct AccessControlEntry
{
}
enum IID_IADsAccessControlList = GUID(0xb7ee91cc, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsAccessControlList : IDispatch
{
    HRESULT get_AclRevision(int* retval);
    HRESULT put_AclRevision(int lnAclRevision);
    HRESULT get_AceCount(int* retval);
    HRESULT put_AceCount(int lnAceCount);
    HRESULT AddAce(IDispatch pAccessControlEntry);
    HRESULT RemoveAce(IDispatch pAccessControlEntry);
    HRESULT CopyAccessList(IDispatch* ppAccessControlList);
    HRESULT get__NewEnum(IUnknown* retval);
}
enum CLSID_AccessControlList = GUID(0xb85ea052, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct AccessControlList
{
}
enum IID_IADsSecurityDescriptor = GUID(0xb8c787ca, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsSecurityDescriptor : IDispatch
{
    HRESULT get_Revision(int* retval);
    HRESULT put_Revision(int lnRevision);
    HRESULT get_Control(int* retval);
    HRESULT put_Control(int lnControl);
    HRESULT get_Owner(BSTR* retval);
    HRESULT put_Owner(BSTR bstrOwner);
    HRESULT get_OwnerDefaulted(VARIANT_BOOL* retval);
    HRESULT put_OwnerDefaulted(VARIANT_BOOL fOwnerDefaulted);
    HRESULT get_Group(BSTR* retval);
    HRESULT put_Group(BSTR bstrGroup);
    HRESULT get_GroupDefaulted(VARIANT_BOOL* retval);
    HRESULT put_GroupDefaulted(VARIANT_BOOL fGroupDefaulted);
    HRESULT get_DiscretionaryAcl(IDispatch* retval);
    HRESULT put_DiscretionaryAcl(IDispatch pDiscretionaryAcl);
    HRESULT get_DaclDefaulted(VARIANT_BOOL* retval);
    HRESULT put_DaclDefaulted(VARIANT_BOOL fDaclDefaulted);
    HRESULT get_SystemAcl(IDispatch* retval);
    HRESULT put_SystemAcl(IDispatch pSystemAcl);
    HRESULT get_SaclDefaulted(VARIANT_BOOL* retval);
    HRESULT put_SaclDefaulted(VARIANT_BOOL fSaclDefaulted);
    HRESULT CopySecurityDescriptor(IDispatch* ppSecurityDescriptor);
}
enum CLSID_SecurityDescriptor = GUID(0xb958f73c, 0x9bdd, 0x11d0, [0x85, 0x2c, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct SecurityDescriptor
{
}
enum IID_IADsLargeInteger = GUID(0x9068270b, 0x939, 0x11d1, [0x8b, 0xe1, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
interface IADsLargeInteger : IDispatch
{
    HRESULT get_HighPart(int* retval);
    HRESULT put_HighPart(int lnHighPart);
    HRESULT get_LowPart(int* retval);
    HRESULT put_LowPart(int lnLowPart);
}
enum CLSID_LargeInteger = GUID(0x927971f5, 0x939, 0x11d1, [0x8b, 0xe1, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x3]);
struct LargeInteger
{
}
enum IID_IADsNameTranslate = GUID(0xb1b272a3, 0x3625, 0x11d1, [0xa3, 0xa4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsNameTranslate : IDispatch
{
    HRESULT put_ChaseReferral(int lnChaseReferral);
    HRESULT Init(int lnSetType, BSTR bstrADsPath);
    HRESULT InitEx(int lnSetType, BSTR bstrADsPath, BSTR bstrUserID, BSTR bstrDomain, BSTR bstrPassword);
    HRESULT Set(int lnSetType, BSTR bstrADsPath);
    HRESULT Get(int lnFormatType, BSTR* pbstrADsPath);
    HRESULT SetEx(int lnFormatType, VARIANT pvar);
    HRESULT GetEx(int lnFormatType, VARIANT* pvar);
}
enum CLSID_NameTranslate = GUID(0x274fae1f, 0x3626, 0x11d1, [0xa3, 0xa4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct NameTranslate
{
}
enum IID_IADsCaseIgnoreList = GUID(0x7b66b533, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsCaseIgnoreList : IDispatch
{
    HRESULT get_CaseIgnoreList(VARIANT* retval);
    HRESULT put_CaseIgnoreList(VARIANT vCaseIgnoreList);
}
enum CLSID_CaseIgnoreList = GUID(0x15f88a55, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct CaseIgnoreList
{
}
enum IID_IADsFaxNumber = GUID(0xa910dea9, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsFaxNumber : IDispatch
{
    HRESULT get_TelephoneNumber(BSTR* retval);
    HRESULT put_TelephoneNumber(BSTR bstrTelephoneNumber);
    HRESULT get_Parameters(VARIANT* retval);
    HRESULT put_Parameters(VARIANT vParameters);
}
enum CLSID_FaxNumber = GUID(0xa5062215, 0x4681, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct FaxNumber
{
}
enum IID_IADsNetAddress = GUID(0xb21a50a9, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsNetAddress : IDispatch
{
    HRESULT get_AddressType(int* retval);
    HRESULT put_AddressType(int lnAddressType);
    HRESULT get_Address(VARIANT* retval);
    HRESULT put_Address(VARIANT vAddress);
}
enum CLSID_NetAddress = GUID(0xb0b71247, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct NetAddress
{
}
enum IID_IADsOctetList = GUID(0x7b28b80f, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsOctetList : IDispatch
{
    HRESULT get_OctetList(VARIANT* retval);
    HRESULT put_OctetList(VARIANT vOctetList);
}
enum CLSID_OctetList = GUID(0x1241400f, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct OctetList
{
}
enum IID_IADsEmail = GUID(0x97af011a, 0x478e, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsEmail : IDispatch
{
    HRESULT get_Type(int* retval);
    HRESULT put_Type(int lnType);
    HRESULT get_Address(BSTR* retval);
    HRESULT put_Address(BSTR bstrAddress);
}
enum CLSID_Email = GUID(0x8f92a857, 0x478e, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct Email
{
}
enum IID_IADsPath = GUID(0xb287fcd5, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsPath : IDispatch
{
    HRESULT get_Type(int* retval);
    HRESULT put_Type(int lnType);
    HRESULT get_VolumeName(BSTR* retval);
    HRESULT put_VolumeName(BSTR bstrVolumeName);
    HRESULT get_Path(BSTR* retval);
    HRESULT put_Path(BSTR bstrPath);
}
enum CLSID_Path = GUID(0xb2538919, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct Path
{
}
enum IID_IADsReplicaPointer = GUID(0xf60fb803, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsReplicaPointer : IDispatch
{
    HRESULT get_ServerName(BSTR* retval);
    HRESULT put_ServerName(BSTR bstrServerName);
    HRESULT get_ReplicaType(int* retval);
    HRESULT put_ReplicaType(int lnReplicaType);
    HRESULT get_ReplicaNumber(int* retval);
    HRESULT put_ReplicaNumber(int lnReplicaNumber);
    HRESULT get_Count(int* retval);
    HRESULT put_Count(int lnCount);
    HRESULT get_ReplicaAddressHints(VARIANT* retval);
    HRESULT put_ReplicaAddressHints(VARIANT vReplicaAddressHints);
}
enum CLSID_ReplicaPointer = GUID(0xf5d1badf, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct ReplicaPointer
{
}
enum IID_IADsAcl = GUID(0x8452d3ab, 0x869, 0x11d1, [0xa3, 0x77, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsAcl : IDispatch
{
    HRESULT get_ProtectedAttrName(BSTR* retval);
    HRESULT put_ProtectedAttrName(BSTR bstrProtectedAttrName);
    HRESULT get_SubjectName(BSTR* retval);
    HRESULT put_SubjectName(BSTR bstrSubjectName);
    HRESULT get_Privileges(int* retval);
    HRESULT put_Privileges(int lnPrivileges);
    HRESULT CopyAcl(IDispatch* ppAcl);
}
enum IID_IADsTimestamp = GUID(0xb2f5a901, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsTimestamp : IDispatch
{
    HRESULT get_WholeSeconds(int* retval);
    HRESULT put_WholeSeconds(int lnWholeSeconds);
    HRESULT get_EventID(int* retval);
    HRESULT put_EventID(int lnEventID);
}
enum CLSID_Timestamp = GUID(0xb2bed2eb, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct Timestamp
{
}
enum IID_IADsPostalAddress = GUID(0x7adecf29, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsPostalAddress : IDispatch
{
    HRESULT get_PostalAddress(VARIANT* retval);
    HRESULT put_PostalAddress(VARIANT vPostalAddress);
}
enum CLSID_PostalAddress = GUID(0xa75afcd, 0x4680, 0x11d1, [0xa3, 0xb4, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct PostalAddress
{
}
enum IID_IADsBackLink = GUID(0xfd1302bd, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsBackLink : IDispatch
{
    HRESULT get_RemoteID(int* retval);
    HRESULT put_RemoteID(int lnRemoteID);
    HRESULT get_ObjectName(BSTR* retval);
    HRESULT put_ObjectName(BSTR bstrObjectName);
}
enum CLSID_BackLink = GUID(0xfcbf906f, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct BackLink
{
}
enum IID_IADsTypedName = GUID(0xb371a349, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsTypedName : IDispatch
{
    HRESULT get_ObjectName(BSTR* retval);
    HRESULT put_ObjectName(BSTR bstrObjectName);
    HRESULT get_Level(int* retval);
    HRESULT put_Level(int lnLevel);
    HRESULT get_Interval(int* retval);
    HRESULT put_Interval(int lnInterval);
}
enum CLSID_TypedName = GUID(0xb33143cb, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct TypedName
{
}
enum IID_IADsHold = GUID(0xb3eb3b37, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsHold : IDispatch
{
    HRESULT get_ObjectName(BSTR* retval);
    HRESULT put_ObjectName(BSTR bstrObjectName);
    HRESULT get_Amount(int* retval);
    HRESULT put_Amount(int lnAmount);
}
enum CLSID_Hold = GUID(0xb3ad3e13, 0x4080, 0x11d1, [0xa3, 0xac, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct Hold
{
}
enum IID_IADsObjectOptions = GUID(0x46f14fda, 0x232b, 0x11d1, [0xa8, 0x8, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0xa8]);
interface IADsObjectOptions : IDispatch
{
    HRESULT GetOption(int lnOption, VARIANT* pvValue);
    HRESULT SetOption(int lnOption, VARIANT vValue);
}
enum IID_IADsPathname = GUID(0xd592aed4, 0xf420, 0x11d0, [0xa3, 0x6e, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
interface IADsPathname : IDispatch
{
    HRESULT Set(BSTR bstrADsPath, int lnSetType);
    HRESULT SetDisplayType(int lnDisplayType);
    HRESULT Retrieve(int lnFormatType, BSTR* pbstrADsPath);
    HRESULT GetNumElements(int* plnNumPathElements);
    HRESULT GetElement(int lnElementIndex, BSTR* pbstrElement);
    HRESULT AddLeafElement(BSTR bstrLeafElement);
    HRESULT RemoveLeafElement();
    HRESULT CopyPath(IDispatch* ppAdsPath);
    HRESULT GetEscapedElement(int lnReserved, BSTR bstrInStr, BSTR* pbstrOutStr);
    HRESULT get_EscapedMode(int* retval);
    HRESULT put_EscapedMode(int lnEscapedMode);
}
enum CLSID_Pathname = GUID(0x80d0d78, 0xf421, 0x11d0, [0xa3, 0x6e, 0x0, 0xc0, 0x4f, 0xb9, 0x50, 0xdc]);
struct Pathname
{
}
enum IID_IADsADSystemInfo = GUID(0x5bb11929, 0xafd1, 0x11d2, [0x9c, 0xb9, 0x0, 0x0, 0xf8, 0x7a, 0x36, 0x9e]);
interface IADsADSystemInfo : IDispatch
{
    HRESULT get_UserName(BSTR* retval);
    HRESULT get_ComputerName(BSTR* retval);
    HRESULT get_SiteName(BSTR* retval);
    HRESULT get_DomainShortName(BSTR* retval);
    HRESULT get_DomainDNSName(BSTR* retval);
    HRESULT get_ForestDNSName(BSTR* retval);
    HRESULT get_PDCRoleOwner(BSTR* retval);
    HRESULT get_SchemaRoleOwner(BSTR* retval);
    HRESULT get_IsNativeMode(VARIANT_BOOL* retval);
    HRESULT GetAnyDCName(BSTR* pszDCName);
    HRESULT GetDCSiteName(BSTR szServer, BSTR* pszSiteName);
    HRESULT RefreshSchemaCache();
    HRESULT GetTrees(VARIANT* pvTrees);
}
enum CLSID_ADSystemInfo = GUID(0x50b6327f, 0xafd1, 0x11d2, [0x9c, 0xb9, 0x0, 0x0, 0xf8, 0x7a, 0x36, 0x9e]);
struct ADSystemInfo
{
}
enum IID_IADsWinNTSystemInfo = GUID(0x6c6d65dc, 0xafd1, 0x11d2, [0x9c, 0xb9, 0x0, 0x0, 0xf8, 0x7a, 0x36, 0x9e]);
interface IADsWinNTSystemInfo : IDispatch
{
    HRESULT get_UserName(BSTR* retval);
    HRESULT get_ComputerName(BSTR* retval);
    HRESULT get_DomainName(BSTR* retval);
    HRESULT get_PDC(BSTR* retval);
}
enum CLSID_WinNTSystemInfo = GUID(0x66182ec4, 0xafd1, 0x11d2, [0x9c, 0xb9, 0x0, 0x0, 0xf8, 0x7a, 0x36, 0x9e]);
struct WinNTSystemInfo
{
}
enum IID_IADsDNWithBinary = GUID(0x7e99c0a2, 0xf935, 0x11d2, [0xba, 0x96, 0x0, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1]);
interface IADsDNWithBinary : IDispatch
{
    HRESULT get_BinaryValue(VARIANT* retval);
    HRESULT put_BinaryValue(VARIANT vBinaryValue);
    HRESULT get_DNString(BSTR* retval);
    HRESULT put_DNString(BSTR bstrDNString);
}
enum CLSID_DNWithBinary = GUID(0x7e99c0a3, 0xf935, 0x11d2, [0xba, 0x96, 0x0, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1]);
struct DNWithBinary
{
}
enum IID_IADsDNWithString = GUID(0x370df02e, 0xf934, 0x11d2, [0xba, 0x96, 0x0, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1]);
interface IADsDNWithString : IDispatch
{
    HRESULT get_StringValue(BSTR* retval);
    HRESULT put_StringValue(BSTR bstrStringValue);
    HRESULT get_DNString(BSTR* retval);
    HRESULT put_DNString(BSTR bstrDNString);
}
enum CLSID_DNWithString = GUID(0x334857cc, 0xf934, 0x11d2, [0xba, 0x96, 0x0, 0xc0, 0x4f, 0xb6, 0xd0, 0xd1]);
struct DNWithString
{
}
enum IID_IADsSecurityUtility = GUID(0xa63251b2, 0x5f21, 0x474b, [0xab, 0x52, 0x4a, 0x8e, 0xfa, 0xd1, 0x8, 0x95]);
interface IADsSecurityUtility : IDispatch
{
    HRESULT GetSecurityDescriptor(VARIANT varPath, int lPathFormat, int lFormat, VARIANT* pVariant);
    HRESULT SetSecurityDescriptor(VARIANT varPath, int lPathFormat, VARIANT varData, int lDataFormat);
    HRESULT ConvertSecurityDescriptor(VARIANT varSD, int lDataFormat, int lOutFormat, VARIANT* pResult);
    HRESULT get_SecurityMask(int* retval);
    HRESULT put_SecurityMask(int lnSecurityMask);
}
enum CLSID_ADsSecurityUtility = GUID(0xf270c64a, 0xffb8, 0x4ae4, [0x85, 0xfe, 0x3a, 0x75, 0xe5, 0x34, 0x79, 0x66]);
struct ADsSecurityUtility
{
}
struct DSOBJECT
{
    uint dwFlags;
    uint dwProviderFlags;
    uint offsetName;
    uint offsetClass;
}
struct DSOBJECTNAMES
{
    GUID clsidNamespace;
    uint cItems;
    DSOBJECT[1] aObjects;
}
struct DSDISPLAYSPECOPTIONS
{
    uint dwSize;
    uint dwFlags;
    uint offsetAttribPrefix;
    uint offsetUserName;
    uint offsetPassword;
    uint offsetServer;
    uint offsetServerConfigPath;
}
struct DSPROPERTYPAGEINFO
{
    uint offsetString;
}
struct DOMAINDESC
{
    PWSTR pszName;
    PWSTR pszPath;
    PWSTR pszNCName;
    PWSTR pszTrustParent;
    PWSTR pszObjectClass;
    uint ulFlags;
    BOOL fDownLevel;
    DOMAINDESC* pdChildList;
    DOMAINDESC* pdNextSibling;
}
struct DOMAIN_TREE
{
    uint dsSize;
    uint dwCount;
    DOMAINDESC[1] aDomains;
}
enum IID_IDsBrowseDomainTree = GUID(0x7cabcf1e, 0x78f5, 0x11d2, [0x96, 0xc, 0x0, 0xc0, 0x4f, 0xa3, 0x1a, 0x86]);
interface IDsBrowseDomainTree : IUnknown
{
    HRESULT BrowseTo(HWND hwndParent, PWSTR* ppszTargetPath, uint dwFlags);
    HRESULT GetDomains(DOMAIN_TREE** ppDomainTree, uint dwFlags);
    HRESULT FreeDomains(DOMAIN_TREE** ppDomainTree);
    HRESULT FlushCachedDomains();
    HRESULT SetComputer(const(wchar)* pszComputerName, const(wchar)* pszUserName, const(wchar)* pszPassword);
}
alias LPDSENUMATTRIBUTES = HRESULT function(LPARAM lParam, const(wchar)* pszAttributeName, const(wchar)* pszDisplayName, uint dwFlags);
struct DSCLASSCREATIONINFO
{
    uint dwFlags;
    GUID clsidWizardDialog;
    GUID clsidWizardPrimaryPage;
    uint cWizardExtensions;
    GUID[1] aWizardExtensions;
}
enum IID_IDsDisplaySpecifier = GUID(0x1ab4a8c0, 0x6a0b, 0x11d2, [0xad, 0x49, 0x0, 0xc0, 0x4f, 0xa3, 0x1a, 0x86]);
interface IDsDisplaySpecifier : IUnknown
{
    HRESULT SetServer(const(wchar)* pszServer, const(wchar)* pszUserName, const(wchar)* pszPassword, uint dwFlags);
    HRESULT SetLanguageID(ushort langid);
    HRESULT GetDisplaySpecifier(const(wchar)* pszObjectClass, const(GUID)* riid, void** ppv);
    HRESULT GetIconLocation(const(wchar)* pszObjectClass, uint dwFlags, PWSTR pszBuffer, int cchBuffer, int* presid);
    HICON GetIcon(const(wchar)* pszObjectClass, uint dwFlags, int cxIcon, int cyIcon);
    HRESULT GetFriendlyClassName(const(wchar)* pszObjectClass, PWSTR pszBuffer, int cchBuffer);
    HRESULT GetFriendlyAttributeName(const(wchar)* pszObjectClass, const(wchar)* pszAttributeName, PWSTR pszBuffer, uint cchBuffer);
    BOOL IsClassContainer(const(wchar)* pszObjectClass, const(wchar)* pszADsPath, uint dwFlags);
    HRESULT GetClassCreationInfo(const(wchar)* pszObjectClass, DSCLASSCREATIONINFO** ppdscci);
    HRESULT EnumClassAttributes(const(wchar)* pszObjectClass, LPDSENUMATTRIBUTES pcbEnum, LPARAM lParam);
    ADSTYPE GetAttributeADsType(const(wchar)* pszAttributeName);
}
struct DSBROWSEINFOW
{
    uint cbStruct;
    HWND hwndOwner;
    const(wchar)* pszCaption;
    const(wchar)* pszTitle;
    const(wchar)* pszRoot;
    PWSTR pszPath;
    uint cchPath;
    uint dwFlags;
    BFFCALLBACK pfnCallback;
    LPARAM lParam;
    uint dwReturnFormat;
    const(wchar)* pUserName;
    const(wchar)* pPassword;
    PWSTR pszObjectClass;
    uint cchObjectClass;
}
struct DSBROWSEINFOA
{
    uint cbStruct;
    HWND hwndOwner;
    const(char)* pszCaption;
    const(char)* pszTitle;
    const(wchar)* pszRoot;
    PWSTR pszPath;
    uint cchPath;
    uint dwFlags;
    BFFCALLBACK pfnCallback;
    LPARAM lParam;
    uint dwReturnFormat;
    const(wchar)* pUserName;
    const(wchar)* pPassword;
    PWSTR pszObjectClass;
    uint cchObjectClass;
}
struct DSBITEMW
{
    uint cbStruct;
    const(wchar)* pszADsPath;
    const(wchar)* pszClass;
    uint dwMask;
    uint dwState;
    uint dwStateMask;
    wchar[64] szDisplayName;
    wchar[260] szIconLocation;
    int iIconResID;
}
struct DSBITEMA
{
    uint cbStruct;
    const(wchar)* pszADsPath;
    const(wchar)* pszClass;
    uint dwMask;
    uint dwState;
    uint dwStateMask;
    CHAR[64] szDisplayName;
    CHAR[260] szIconLocation;
    int iIconResID;
}
struct DSOP_UPLEVEL_FILTER_FLAGS
{
    uint flBothModes;
    uint flMixedModeOnly;
    uint flNativeModeOnly;
}
struct DSOP_FILTER_FLAGS
{
    DSOP_UPLEVEL_FILTER_FLAGS Uplevel;
    uint flDownlevel;
}
struct DSOP_SCOPE_INIT_INFO
{
    uint cbSize;
    uint flType;
    uint flScope;
    DSOP_FILTER_FLAGS FilterFlags;
    const(wchar)* pwzDcName;
    const(wchar)* pwzADsPath;
    HRESULT hr;
}
struct DSOP_INIT_INFO
{
    uint cbSize;
    const(wchar)* pwzTargetComputer;
    uint cDsScopeInfos;
    DSOP_SCOPE_INIT_INFO* aDsScopeInfos;
    uint flOptions;
    uint cAttributesToFetch;
    const(wchar)** apwzAttributeNames;
}
struct DS_SELECTION
{
    PWSTR pwzName;
    PWSTR pwzADsPath;
    PWSTR pwzClass;
    PWSTR pwzUPN;
    VARIANT* pvarFetchedAttributes;
    uint flScopeType;
}
struct DS_SELECTION_LIST
{
    uint cItems;
    uint cFetchedAttributes;
    DS_SELECTION[1] aDsSelection;
}
enum IID_IDsObjectPicker = GUID(0xc87e64e, 0x3b7a, 0x11d2, [0xb9, 0xe0, 0x0, 0xc0, 0x4f, 0xd8, 0xdb, 0xf7]);
interface IDsObjectPicker : IUnknown
{
    HRESULT Initialize(DSOP_INIT_INFO* pInitInfo);
    HRESULT InvokeDialog(HWND hwndParent, IDataObject* ppdoSelections);
}
enum IID_IDsObjectPickerCredentials = GUID(0xe2d3ec9b, 0xd041, 0x445a, [0x8f, 0x16, 0x47, 0x48, 0xde, 0x8f, 0xb1, 0xcf]);
interface IDsObjectPickerCredentials : IDsObjectPicker
{
    HRESULT SetCredentials(const(wchar)* szUserName, const(wchar)* szPassword);
}
struct DSQUERYINITPARAMS
{
    uint cbStruct;
    uint dwFlags;
    PWSTR pDefaultScope;
    PWSTR pDefaultSaveLocation;
    PWSTR pUserName;
    PWSTR pPassword;
    PWSTR pServer;
}
struct DSCOLUMN
{
    uint dwFlags;
    int fmt;
    int cx;
    int idsName;
    int offsetProperty;
    uint dwReserved;
}
struct DSQUERYPARAMS
{
    uint cbStruct;
    uint dwFlags;
    HINSTANCE hInstance;
    int offsetQuery;
    int iColumns;
    uint dwReserved;
    DSCOLUMN[1] aColumns;
}
struct DSQUERYCLASSLIST
{
    uint cbStruct;
    int cClasses;
    uint[1] offsetClass;
}
enum IID_IDsAdminCreateObj = GUID(0x53554a38, 0xf902, 0x11d2, [0x82, 0xb9, 0x0, 0xc0, 0x4f, 0x68, 0x92, 0x8b]);
interface IDsAdminCreateObj : IUnknown
{
    HRESULT Initialize(IADsContainer pADsContainerObj, IADs pADsCopySource, const(wchar)* lpszClassName);
    HRESULT CreateModal(HWND hwndParent, IADs* ppADsObj);
}
enum IID_IDsAdminNewObj = GUID(0xf2573587, 0xe6fc, 0x11d2, [0x82, 0xaf, 0x0, 0xc0, 0x4f, 0x68, 0x92, 0x8b]);
interface IDsAdminNewObj : IUnknown
{
    HRESULT SetButtons(uint nCurrIndex, BOOL bValid);
    HRESULT GetPageCounts(int* pnTotal, int* pnStartIndex);
}
enum IID_IDsAdminNewObjPrimarySite = GUID(0xbe2b487e, 0xf904, 0x11d2, [0x82, 0xb9, 0x0, 0xc0, 0x4f, 0x68, 0x92, 0x8b]);
interface IDsAdminNewObjPrimarySite : IUnknown
{
    HRESULT CreateNew(const(wchar)* pszName);
    HRESULT Commit();
}
struct DSA_NEWOBJ_DISPINFO
{
    uint dwSize;
    HICON hObjClassIcon;
    PWSTR lpszWizTitle;
    PWSTR lpszContDisplayName;
}
enum IID_IDsAdminNewObjExt = GUID(0x6088eae2, 0xe7bf, 0x11d2, [0x82, 0xaf, 0x0, 0xc0, 0x4f, 0x68, 0x92, 0x8b]);
interface IDsAdminNewObjExt : IUnknown
{
    HRESULT Initialize(IADsContainer pADsContainerObj, IADs pADsCopySource, const(wchar)* lpszClassName, IDsAdminNewObj pDsAdminNewObj, DSA_NEWOBJ_DISPINFO* pDispInfo);
    HRESULT AddPages(LPFNSVADDPROPSHEETPAGE lpfnAddPage, LPARAM lParam);
    HRESULT SetObject(IADs pADsObj);
    HRESULT WriteData(HWND hWnd, uint uContext);
    HRESULT OnError(HWND hWnd, HRESULT hr, uint uContext);
    HRESULT GetSummaryInfo(BSTR* pBstrText);
}
enum IID_IDsAdminNotifyHandler = GUID(0xe4a2b8b3, 0x5a18, 0x11d2, [0x97, 0xc1, 0x0, 0xa0, 0xc9, 0xa0, 0x6d, 0x2d]);
interface IDsAdminNotifyHandler : IUnknown
{
    HRESULT Initialize(IDataObject pExtraInfo, uint* puEventFlags);
    HRESULT Begin(uint uEvent, IDataObject pArg1, IDataObject pArg2, uint* puFlags, BSTR* pBstr);
    HRESULT Notify(uint nItem, uint uFlags);
    HRESULT End();
}
struct ADSPROPINITPARAMS
{
    uint dwSize;
    uint dwFlags;
    HRESULT hr;
    IDirectoryObject pDsObj;
    PWSTR pwzCN;
    ADS_ATTR_INFO* pWritableAttrs;
}
struct ADSPROPERROR
{
    HWND hwndPage;
    PWSTR pszPageTitle;
    PWSTR pszObjPath;
    PWSTR pszObjClass;
    HRESULT hr;
    PWSTR pszError;
}
struct SCHEDULE_HEADER
{
    uint Type;
    uint Offset;
}
struct SCHEDULE
{
    uint Size;
    uint Bandwidth;
    uint NumberOfSchedules;
    SCHEDULE_HEADER[1] Schedules;
}
alias DS_MANGLE_FOR = int;
enum : int
{
    DS_MANGLE_UNKNOWN                      = 0x00000000,
    DS_MANGLE_OBJECT_RDN_FOR_DELETION      = 0x00000001,
    DS_MANGLE_OBJECT_RDN_FOR_NAME_CONFLICT = 0x00000002,
}

alias DS_NAME_FORMAT = int;
enum : int
{
    DS_UNKNOWN_NAME            = 0x00000000,
    DS_FQDN_1779_NAME          = 0x00000001,
    DS_NT4_ACCOUNT_NAME        = 0x00000002,
    DS_DISPLAY_NAME            = 0x00000003,
    DS_UNIQUE_ID_NAME          = 0x00000006,
    DS_CANONICAL_NAME          = 0x00000007,
    DS_USER_PRINCIPAL_NAME     = 0x00000008,
    DS_CANONICAL_NAME_EX       = 0x00000009,
    DS_SERVICE_PRINCIPAL_NAME  = 0x0000000a,
    DS_SID_OR_SID_HISTORY_NAME = 0x0000000b,
    DS_DNS_DOMAIN_NAME         = 0x0000000c,
}

alias DS_NAME_FLAGS = int;
enum : int
{
    DS_NAME_NO_FLAGS              = 0x00000000,
    DS_NAME_FLAG_SYNTACTICAL_ONLY = 0x00000001,
    DS_NAME_FLAG_EVAL_AT_DC       = 0x00000002,
    DS_NAME_FLAG_GCVERIFY         = 0x00000004,
    DS_NAME_FLAG_TRUST_REFERRAL   = 0x00000008,
}

alias DS_NAME_ERROR = int;
enum : int
{
    DS_NAME_NO_ERROR                     = 0x00000000,
    DS_NAME_ERROR_RESOLVING              = 0x00000001,
    DS_NAME_ERROR_NOT_FOUND              = 0x00000002,
    DS_NAME_ERROR_NOT_UNIQUE             = 0x00000003,
    DS_NAME_ERROR_NO_MAPPING             = 0x00000004,
    DS_NAME_ERROR_DOMAIN_ONLY            = 0x00000005,
    DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING = 0x00000006,
    DS_NAME_ERROR_TRUST_REFERRAL         = 0x00000007,
}

alias DS_SPN_NAME_TYPE = int;
enum : int
{
    DS_SPN_DNS_HOST  = 0x00000000,
    DS_SPN_DN_HOST   = 0x00000001,
    DS_SPN_NB_HOST   = 0x00000002,
    DS_SPN_DOMAIN    = 0x00000003,
    DS_SPN_NB_DOMAIN = 0x00000004,
    DS_SPN_SERVICE   = 0x00000005,
}

alias DS_SPN_WRITE_OP = int;
enum : int
{
    DS_SPN_ADD_SPN_OP     = 0x00000000,
    DS_SPN_REPLACE_SPN_OP = 0x00000001,
    DS_SPN_DELETE_SPN_OP  = 0x00000002,
}

struct DS_NAME_RESULT_ITEMA
{
    uint status;
    PSTR pDomain;
    PSTR pName;
}
struct DS_NAME_RESULTA
{
    uint cItems;
    DS_NAME_RESULT_ITEMA* rItems;
}
struct DS_NAME_RESULT_ITEMW
{
    uint status;
    PWSTR pDomain;
    PWSTR pName;
}
struct DS_NAME_RESULTW
{
    uint cItems;
    DS_NAME_RESULT_ITEMW* rItems;
}
alias DS_REPSYNCALL_ERROR = int;
enum : int
{
    DS_REPSYNCALL_WIN32_ERROR_CONTACTING_SERVER = 0x00000000,
    DS_REPSYNCALL_WIN32_ERROR_REPLICATING       = 0x00000001,
    DS_REPSYNCALL_SERVER_UNREACHABLE            = 0x00000002,
}

alias DS_REPSYNCALL_EVENT = int;
enum : int
{
    DS_REPSYNCALL_EVENT_ERROR          = 0x00000000,
    DS_REPSYNCALL_EVENT_SYNC_STARTED   = 0x00000001,
    DS_REPSYNCALL_EVENT_SYNC_COMPLETED = 0x00000002,
    DS_REPSYNCALL_EVENT_FINISHED       = 0x00000003,
}

struct DS_REPSYNCALL_SYNCA
{
    PSTR pszSrcId;
    PSTR pszDstId;
    PSTR pszNC;
    GUID* pguidSrc;
    GUID* pguidDst;
}
struct DS_REPSYNCALL_SYNCW
{
    PWSTR pszSrcId;
    PWSTR pszDstId;
    PWSTR pszNC;
    GUID* pguidSrc;
    GUID* pguidDst;
}
struct DS_REPSYNCALL_ERRINFOA
{
    PSTR pszSvrId;
    DS_REPSYNCALL_ERROR error;
    uint dwWin32Err;
    PSTR pszSrcId;
}
struct DS_REPSYNCALL_ERRINFOW
{
    PWSTR pszSvrId;
    DS_REPSYNCALL_ERROR error;
    uint dwWin32Err;
    PWSTR pszSrcId;
}
struct DS_REPSYNCALL_UPDATEA
{
    DS_REPSYNCALL_EVENT event;
    DS_REPSYNCALL_ERRINFOA* pErrInfo;
    DS_REPSYNCALL_SYNCA* pSync;
}
struct DS_REPSYNCALL_UPDATEW
{
    DS_REPSYNCALL_EVENT event;
    DS_REPSYNCALL_ERRINFOW* pErrInfo;
    DS_REPSYNCALL_SYNCW* pSync;
}
struct DS_SITE_COST_INFO
{
    uint errorCode;
    uint cost;
}
struct DS_SCHEMA_GUID_MAPA
{
    GUID guid;
    uint guidType;
    PSTR pName;
}
struct DS_SCHEMA_GUID_MAPW
{
    GUID guid;
    uint guidType;
    PWSTR pName;
}
struct DS_DOMAIN_CONTROLLER_INFO_1A
{
    PSTR NetbiosName;
    PSTR DnsHostName;
    PSTR SiteName;
    PSTR ComputerObjectName;
    PSTR ServerObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
}
struct DS_DOMAIN_CONTROLLER_INFO_1W
{
    PWSTR NetbiosName;
    PWSTR DnsHostName;
    PWSTR SiteName;
    PWSTR ComputerObjectName;
    PWSTR ServerObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
}
struct DS_DOMAIN_CONTROLLER_INFO_2A
{
    PSTR NetbiosName;
    PSTR DnsHostName;
    PSTR SiteName;
    PSTR SiteObjectName;
    PSTR ComputerObjectName;
    PSTR ServerObjectName;
    PSTR NtdsDsaObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
    BOOL fIsGc;
    GUID SiteObjectGuid;
    GUID ComputerObjectGuid;
    GUID ServerObjectGuid;
    GUID NtdsDsaObjectGuid;
}
struct DS_DOMAIN_CONTROLLER_INFO_2W
{
    PWSTR NetbiosName;
    PWSTR DnsHostName;
    PWSTR SiteName;
    PWSTR SiteObjectName;
    PWSTR ComputerObjectName;
    PWSTR ServerObjectName;
    PWSTR NtdsDsaObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
    BOOL fIsGc;
    GUID SiteObjectGuid;
    GUID ComputerObjectGuid;
    GUID ServerObjectGuid;
    GUID NtdsDsaObjectGuid;
}
struct DS_DOMAIN_CONTROLLER_INFO_3A
{
    PSTR NetbiosName;
    PSTR DnsHostName;
    PSTR SiteName;
    PSTR SiteObjectName;
    PSTR ComputerObjectName;
    PSTR ServerObjectName;
    PSTR NtdsDsaObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
    BOOL fIsGc;
    BOOL fIsRodc;
    GUID SiteObjectGuid;
    GUID ComputerObjectGuid;
    GUID ServerObjectGuid;
    GUID NtdsDsaObjectGuid;
}
struct DS_DOMAIN_CONTROLLER_INFO_3W
{
    PWSTR NetbiosName;
    PWSTR DnsHostName;
    PWSTR SiteName;
    PWSTR SiteObjectName;
    PWSTR ComputerObjectName;
    PWSTR ServerObjectName;
    PWSTR NtdsDsaObjectName;
    BOOL fIsPdc;
    BOOL fDsEnabled;
    BOOL fIsGc;
    BOOL fIsRodc;
    GUID SiteObjectGuid;
    GUID ComputerObjectGuid;
    GUID ServerObjectGuid;
    GUID NtdsDsaObjectGuid;
}
alias DS_KCC_TASKID = int;
enum : int
{
    DS_KCC_TASKID_UPDATE_TOPOLOGY = 0x00000000,
}

alias DS_REPL_INFO_TYPE = int;
enum : int
{
    DS_REPL_INFO_NEIGHBORS                   = 0x00000000,
    DS_REPL_INFO_CURSORS_FOR_NC              = 0x00000001,
    DS_REPL_INFO_METADATA_FOR_OBJ            = 0x00000002,
    DS_REPL_INFO_KCC_DSA_CONNECT_FAILURES    = 0x00000003,
    DS_REPL_INFO_KCC_DSA_LINK_FAILURES       = 0x00000004,
    DS_REPL_INFO_PENDING_OPS                 = 0x00000005,
    DS_REPL_INFO_METADATA_FOR_ATTR_VALUE     = 0x00000006,
    DS_REPL_INFO_CURSORS_2_FOR_NC            = 0x00000007,
    DS_REPL_INFO_CURSORS_3_FOR_NC            = 0x00000008,
    DS_REPL_INFO_METADATA_2_FOR_OBJ          = 0x00000009,
    DS_REPL_INFO_METADATA_2_FOR_ATTR_VALUE   = 0x0000000a,
    DS_REPL_INFO_METADATA_EXT_FOR_ATTR_VALUE = 0x0000000b,
    DS_REPL_INFO_TYPE_MAX                    = 0x0000000c,
}

struct DS_REPL_NEIGHBORW
{
    PWSTR pszNamingContext;
    PWSTR pszSourceDsaDN;
    PWSTR pszSourceDsaAddress;
    PWSTR pszAsyncIntersiteTransportDN;
    uint dwReplicaFlags;
    uint dwReserved;
    GUID uuidNamingContextObjGuid;
    GUID uuidSourceDsaObjGuid;
    GUID uuidSourceDsaInvocationID;
    GUID uuidAsyncIntersiteTransportObjGuid;
    long usnLastObjChangeSynced;
    long usnAttributeFilter;
    FILETIME ftimeLastSyncSuccess;
    FILETIME ftimeLastSyncAttempt;
    uint dwLastSyncResult;
    uint cNumConsecutiveSyncFailures;
}
struct DS_REPL_NEIGHBORW_BLOB
{
    uint oszNamingContext;
    uint oszSourceDsaDN;
    uint oszSourceDsaAddress;
    uint oszAsyncIntersiteTransportDN;
    uint dwReplicaFlags;
    uint dwReserved;
    GUID uuidNamingContextObjGuid;
    GUID uuidSourceDsaObjGuid;
    GUID uuidSourceDsaInvocationID;
    GUID uuidAsyncIntersiteTransportObjGuid;
    long usnLastObjChangeSynced;
    long usnAttributeFilter;
    FILETIME ftimeLastSyncSuccess;
    FILETIME ftimeLastSyncAttempt;
    uint dwLastSyncResult;
    uint cNumConsecutiveSyncFailures;
}
struct DS_REPL_NEIGHBORSW
{
    uint cNumNeighbors;
    uint dwReserved;
    DS_REPL_NEIGHBORW[1] rgNeighbor;
}
struct DS_REPL_CURSOR
{
    GUID uuidSourceDsaInvocationID;
    long usnAttributeFilter;
}
struct DS_REPL_CURSOR_2
{
    GUID uuidSourceDsaInvocationID;
    long usnAttributeFilter;
    FILETIME ftimeLastSyncSuccess;
}
struct DS_REPL_CURSOR_3W
{
    GUID uuidSourceDsaInvocationID;
    long usnAttributeFilter;
    FILETIME ftimeLastSyncSuccess;
    PWSTR pszSourceDsaDN;
}
struct DS_REPL_CURSOR_BLOB
{
    GUID uuidSourceDsaInvocationID;
    long usnAttributeFilter;
    FILETIME ftimeLastSyncSuccess;
    uint oszSourceDsaDN;
}
struct DS_REPL_CURSORS
{
    uint cNumCursors;
    uint dwReserved;
    DS_REPL_CURSOR[1] rgCursor;
}
struct DS_REPL_CURSORS_2
{
    uint cNumCursors;
    uint dwEnumerationContext;
    DS_REPL_CURSOR_2[1] rgCursor;
}
struct DS_REPL_CURSORS_3W
{
    uint cNumCursors;
    uint dwEnumerationContext;
    DS_REPL_CURSOR_3W[1] rgCursor;
}
struct DS_REPL_ATTR_META_DATA
{
    PWSTR pszAttributeName;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
}
struct DS_REPL_ATTR_META_DATA_2
{
    PWSTR pszAttributeName;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    PWSTR pszLastOriginatingDsaDN;
}
struct DS_REPL_ATTR_META_DATA_BLOB
{
    uint oszAttributeName;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    uint oszLastOriginatingDsaDN;
}
struct DS_REPL_OBJ_META_DATA
{
    uint cNumEntries;
    uint dwReserved;
    DS_REPL_ATTR_META_DATA[1] rgMetaData;
}
struct DS_REPL_OBJ_META_DATA_2
{
    uint cNumEntries;
    uint dwReserved;
    DS_REPL_ATTR_META_DATA_2[1] rgMetaData;
}
struct DS_REPL_KCC_DSA_FAILUREW
{
    PWSTR pszDsaDN;
    GUID uuidDsaObjGuid;
    FILETIME ftimeFirstFailure;
    uint cNumFailures;
    uint dwLastResult;
}
struct DS_REPL_KCC_DSA_FAILUREW_BLOB
{
    uint oszDsaDN;
    GUID uuidDsaObjGuid;
    FILETIME ftimeFirstFailure;
    uint cNumFailures;
    uint dwLastResult;
}
struct DS_REPL_KCC_DSA_FAILURESW
{
    uint cNumEntries;
    uint dwReserved;
    DS_REPL_KCC_DSA_FAILUREW[1] rgDsaFailure;
}
alias DS_REPL_OP_TYPE = int;
enum : int
{
    DS_REPL_OP_TYPE_SYNC        = 0x00000000,
    DS_REPL_OP_TYPE_ADD         = 0x00000001,
    DS_REPL_OP_TYPE_DELETE      = 0x00000002,
    DS_REPL_OP_TYPE_MODIFY      = 0x00000003,
    DS_REPL_OP_TYPE_UPDATE_REFS = 0x00000004,
}

struct DS_REPL_OPW
{
    FILETIME ftimeEnqueued;
    uint ulSerialNumber;
    uint ulPriority;
    DS_REPL_OP_TYPE OpType;
    uint ulOptions;
    PWSTR pszNamingContext;
    PWSTR pszDsaDN;
    PWSTR pszDsaAddress;
    GUID uuidNamingContextObjGuid;
    GUID uuidDsaObjGuid;
}
struct DS_REPL_OPW_BLOB
{
    FILETIME ftimeEnqueued;
    uint ulSerialNumber;
    uint ulPriority;
    DS_REPL_OP_TYPE OpType;
    uint ulOptions;
    uint oszNamingContext;
    uint oszDsaDN;
    uint oszDsaAddress;
    GUID uuidNamingContextObjGuid;
    GUID uuidDsaObjGuid;
}
struct DS_REPL_PENDING_OPSW
{
    FILETIME ftimeCurrentOpStarted;
    uint cNumPendingOps;
    DS_REPL_OPW[1] rgPendingOp;
}
struct DS_REPL_VALUE_META_DATA
{
    PWSTR pszAttributeName;
    PWSTR pszObjectDn;
    uint cbData;
    ubyte* pbData;
    FILETIME ftimeDeleted;
    FILETIME ftimeCreated;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
}
struct DS_REPL_VALUE_META_DATA_2
{
    PWSTR pszAttributeName;
    PWSTR pszObjectDn;
    uint cbData;
    ubyte* pbData;
    FILETIME ftimeDeleted;
    FILETIME ftimeCreated;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    PWSTR pszLastOriginatingDsaDN;
}
struct DS_REPL_VALUE_META_DATA_EXT
{
    PWSTR pszAttributeName;
    PWSTR pszObjectDn;
    uint cbData;
    ubyte* pbData;
    FILETIME ftimeDeleted;
    FILETIME ftimeCreated;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    PWSTR pszLastOriginatingDsaDN;
    uint dwUserIdentifier;
    uint dwPriorLinkState;
    uint dwCurrentLinkState;
}
struct DS_REPL_VALUE_META_DATA_BLOB
{
    uint oszAttributeName;
    uint oszObjectDn;
    uint cbData;
    uint obData;
    FILETIME ftimeDeleted;
    FILETIME ftimeCreated;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    uint oszLastOriginatingDsaDN;
}
struct DS_REPL_VALUE_META_DATA_BLOB_EXT
{
    uint oszAttributeName;
    uint oszObjectDn;
    uint cbData;
    uint obData;
    FILETIME ftimeDeleted;
    FILETIME ftimeCreated;
    uint dwVersion;
    FILETIME ftimeLastOriginatingChange;
    GUID uuidLastOriginatingDsaInvocationID;
    long usnOriginatingChange;
    long usnLocalChange;
    uint oszLastOriginatingDsaDN;
    uint dwUserIdentifier;
    uint dwPriorLinkState;
    uint dwCurrentLinkState;
}
struct DS_REPL_ATTR_VALUE_META_DATA
{
    uint cNumEntries;
    uint dwEnumerationContext;
    DS_REPL_VALUE_META_DATA[1] rgMetaData;
}
struct DS_REPL_ATTR_VALUE_META_DATA_2
{
    uint cNumEntries;
    uint dwEnumerationContext;
    DS_REPL_VALUE_META_DATA_2[1] rgMetaData;
}
struct DS_REPL_ATTR_VALUE_META_DATA_EXT
{
    uint cNumEntries;
    uint dwEnumerationContext;
    DS_REPL_VALUE_META_DATA_EXT[1] rgMetaData;
}
struct DS_REPL_QUEUE_STATISTICSW
{
    FILETIME ftimeCurrentOpStarted;
    uint cNumPendingOps;
    FILETIME ftimeOldestSync;
    FILETIME ftimeOldestAdd;
    FILETIME ftimeOldestMod;
    FILETIME ftimeOldestDel;
    FILETIME ftimeOldestUpdRefs;
}
alias DSROLE_MACHINE_ROLE = int;
enum : int
{
    DsRole_RoleStandaloneWorkstation   = 0x00000000,
    DsRole_RoleMemberWorkstation       = 0x00000001,
    DsRole_RoleStandaloneServer        = 0x00000002,
    DsRole_RoleMemberServer            = 0x00000003,
    DsRole_RoleBackupDomainController  = 0x00000004,
    DsRole_RolePrimaryDomainController = 0x00000005,
}

alias DSROLE_SERVER_STATE = int;
enum : int
{
    DsRoleServerUnknown = 0x00000000,
    DsRoleServerPrimary = 0x00000001,
    DsRoleServerBackup  = 0x00000002,
}

alias DSROLE_PRIMARY_DOMAIN_INFO_LEVEL = int;
enum : int
{
    DsRolePrimaryDomainInfoBasic = 0x00000001,
    DsRoleUpgradeStatus          = 0x00000002,
    DsRoleOperationState         = 0x00000003,
}

struct DSROLE_PRIMARY_DOMAIN_INFO_BASIC
{
    DSROLE_MACHINE_ROLE MachineRole;
    uint Flags;
    PWSTR DomainNameFlat;
    PWSTR DomainNameDns;
    PWSTR DomainForestName;
    GUID DomainGuid;
}
struct DSROLE_UPGRADE_STATUS_INFO
{
    uint OperationState;
    DSROLE_SERVER_STATE PreviousServerState;
}
alias DSROLE_OPERATION_STATE = int;
enum : int
{
    DsRoleOperationIdle       = 0x00000000,
    DsRoleOperationActive     = 0x00000001,
    DsRoleOperationNeedReboot = 0x00000002,
}

struct DSROLE_OPERATION_STATE_INFO
{
    DSROLE_OPERATION_STATE OperationState;
}
struct DOMAIN_CONTROLLER_INFOA
{
    PSTR DomainControllerName;
    PSTR DomainControllerAddress;
    uint DomainControllerAddressType;
    GUID DomainGuid;
    PSTR DomainName;
    PSTR DnsForestName;
    uint Flags;
    PSTR DcSiteName;
    PSTR ClientSiteName;
}
struct DOMAIN_CONTROLLER_INFOW
{
    PWSTR DomainControllerName;
    PWSTR DomainControllerAddress;
    uint DomainControllerAddressType;
    GUID DomainGuid;
    PWSTR DomainName;
    PWSTR DnsForestName;
    uint Flags;
    PWSTR DcSiteName;
    PWSTR ClientSiteName;
}
struct DS_DOMAIN_TRUSTSW
{
    PWSTR NetbiosDomainName;
    PWSTR DnsDomainName;
    uint Flags;
    uint ParentIndex;
    uint TrustType;
    uint TrustAttributes;
    PSID DomainSid;
    GUID DomainGuid;
}
struct DS_DOMAIN_TRUSTSA
{
    PSTR NetbiosDomainName;
    PSTR DnsDomainName;
    uint Flags;
    uint ParentIndex;
    uint TrustType;
    uint TrustAttributes;
    PSID DomainSid;
    GUID DomainGuid;
}
alias ADS_SEARCH_HANDLE = long;
