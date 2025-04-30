module windows.win32.devices.alljoyn;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

HANDLE AllJoynConnectToBus(const(wchar)* connectionSpec);
BOOL AllJoynCloseBusHandle(HANDLE busHandle);
BOOL AllJoynSendToBus(HANDLE connectedBusHandle, const(void)* buffer, uint bytesToWrite, uint* bytesTransferred, void* reserved);
BOOL AllJoynReceiveFromBus(HANDLE connectedBusHandle, void* buffer, uint bytesToRead, uint* bytesTransferred, void* reserved);
BOOL AllJoynEventSelect(HANDLE connectedBusHandle, HANDLE eventHandle, uint eventTypes);
BOOL AllJoynEnumEvents(HANDLE connectedBusHandle, HANDLE eventToReset, uint* eventTypes);
HANDLE AllJoynCreateBus(uint outBufferSize, uint inBufferSize, SECURITY_ATTRIBUTES* lpSecurityAttributes);
uint AllJoynAcceptBusConnection(HANDLE serverBusHandle, HANDLE abortEvent);
int alljoyn_unity_deferred_callbacks_process();
void alljoyn_unity_set_deferred_callback_mainthread_only(int mainthread_only);
PSTR QCC_StatusText(QStatus status);
alljoyn_msgarg alljoyn_msgarg_create();
alljoyn_msgarg alljoyn_msgarg_create_and_set(const(char)* signature);
void alljoyn_msgarg_destroy(alljoyn_msgarg arg);
alljoyn_msgarg alljoyn_msgarg_array_create(ulong size);
alljoyn_msgarg alljoyn_msgarg_array_element(alljoyn_msgarg arg, ulong index);
QStatus alljoyn_msgarg_set(alljoyn_msgarg arg, const(char)* signature);
QStatus alljoyn_msgarg_get(alljoyn_msgarg arg, const(char)* signature);
alljoyn_msgarg alljoyn_msgarg_copy(const(alljoyn_msgarg) source);
void alljoyn_msgarg_clone(alljoyn_msgarg destination, const(alljoyn_msgarg) source);
int alljoyn_msgarg_equal(alljoyn_msgarg lhv, alljoyn_msgarg rhv);
QStatus alljoyn_msgarg_array_set(alljoyn_msgarg args, ulong* numArgs, const(char)* signature);
QStatus alljoyn_msgarg_array_get(const(alljoyn_msgarg) args, ulong numArgs, const(char)* signature);
ulong alljoyn_msgarg_tostring(alljoyn_msgarg arg, PSTR str, ulong buf, ulong indent);
ulong alljoyn_msgarg_array_tostring(const(alljoyn_msgarg) args, ulong numArgs, PSTR str, ulong buf, ulong indent);
ulong alljoyn_msgarg_signature(alljoyn_msgarg arg, PSTR str, ulong buf);
ulong alljoyn_msgarg_array_signature(alljoyn_msgarg values, ulong numValues, PSTR str, ulong buf);
int alljoyn_msgarg_hassignature(alljoyn_msgarg arg, const(char)* signature);
QStatus alljoyn_msgarg_getdictelement(alljoyn_msgarg arg, const(char)* elemSig);
alljoyn_typeid alljoyn_msgarg_gettype(alljoyn_msgarg arg);
void alljoyn_msgarg_clear(alljoyn_msgarg arg);
void alljoyn_msgarg_stabilize(alljoyn_msgarg arg);
QStatus alljoyn_msgarg_array_set_offset(alljoyn_msgarg args, ulong argOffset, ulong* numArgs, const(char)* signature);
QStatus alljoyn_msgarg_set_and_stabilize(alljoyn_msgarg arg, const(char)* signature);
QStatus alljoyn_msgarg_set_uint8(alljoyn_msgarg arg, ubyte y);
QStatus alljoyn_msgarg_set_bool(alljoyn_msgarg arg, int b);
QStatus alljoyn_msgarg_set_int16(alljoyn_msgarg arg, short n);
QStatus alljoyn_msgarg_set_uint16(alljoyn_msgarg arg, ushort q);
QStatus alljoyn_msgarg_set_int32(alljoyn_msgarg arg, int i);
QStatus alljoyn_msgarg_set_uint32(alljoyn_msgarg arg, uint u);
QStatus alljoyn_msgarg_set_int64(alljoyn_msgarg arg, long x);
QStatus alljoyn_msgarg_set_uint64(alljoyn_msgarg arg, ulong t);
QStatus alljoyn_msgarg_set_double(alljoyn_msgarg arg, double d);
QStatus alljoyn_msgarg_set_string(alljoyn_msgarg arg, const(char)* s);
QStatus alljoyn_msgarg_set_objectpath(alljoyn_msgarg arg, const(char)* o);
QStatus alljoyn_msgarg_set_signature(alljoyn_msgarg arg, const(char)* g);
QStatus alljoyn_msgarg_get_uint8(const(alljoyn_msgarg) arg, ubyte* y);
QStatus alljoyn_msgarg_get_bool(const(alljoyn_msgarg) arg, int* b);
QStatus alljoyn_msgarg_get_int16(const(alljoyn_msgarg) arg, short* n);
QStatus alljoyn_msgarg_get_uint16(const(alljoyn_msgarg) arg, ushort* q);
QStatus alljoyn_msgarg_get_int32(const(alljoyn_msgarg) arg, int* i);
QStatus alljoyn_msgarg_get_uint32(const(alljoyn_msgarg) arg, uint* u);
QStatus alljoyn_msgarg_get_int64(const(alljoyn_msgarg) arg, long* x);
QStatus alljoyn_msgarg_get_uint64(const(alljoyn_msgarg) arg, ulong* t);
QStatus alljoyn_msgarg_get_double(const(alljoyn_msgarg) arg, double* d);
QStatus alljoyn_msgarg_get_string(const(alljoyn_msgarg) arg, byte** s);
QStatus alljoyn_msgarg_get_objectpath(const(alljoyn_msgarg) arg, byte** o);
QStatus alljoyn_msgarg_get_signature(const(alljoyn_msgarg) arg, byte** g);
QStatus alljoyn_msgarg_get_variant(const(alljoyn_msgarg) arg, alljoyn_msgarg v);
QStatus alljoyn_msgarg_set_uint8_array(alljoyn_msgarg arg, ulong length, ubyte* ay);
QStatus alljoyn_msgarg_set_bool_array(alljoyn_msgarg arg, ulong length, int* ab);
QStatus alljoyn_msgarg_set_int16_array(alljoyn_msgarg arg, ulong length, short* an);
QStatus alljoyn_msgarg_set_uint16_array(alljoyn_msgarg arg, ulong length, ushort* aq);
QStatus alljoyn_msgarg_set_int32_array(alljoyn_msgarg arg, ulong length, int* ai);
QStatus alljoyn_msgarg_set_uint32_array(alljoyn_msgarg arg, ulong length, uint* au);
QStatus alljoyn_msgarg_set_int64_array(alljoyn_msgarg arg, ulong length, long* ax);
QStatus alljoyn_msgarg_set_uint64_array(alljoyn_msgarg arg, ulong length, ulong* at);
QStatus alljoyn_msgarg_set_double_array(alljoyn_msgarg arg, ulong length, double* ad);
QStatus alljoyn_msgarg_set_string_array(alljoyn_msgarg arg, ulong length, const(byte)** as);
QStatus alljoyn_msgarg_set_objectpath_array(alljoyn_msgarg arg, ulong length, const(byte)** ao);
QStatus alljoyn_msgarg_set_signature_array(alljoyn_msgarg arg, ulong length, const(byte)** ag);
QStatus alljoyn_msgarg_get_uint8_array(const(alljoyn_msgarg) arg, ulong* length, ubyte* ay);
QStatus alljoyn_msgarg_get_bool_array(const(alljoyn_msgarg) arg, ulong* length, int* ab);
QStatus alljoyn_msgarg_get_int16_array(const(alljoyn_msgarg) arg, ulong* length, short* an);
QStatus alljoyn_msgarg_get_uint16_array(const(alljoyn_msgarg) arg, ulong* length, ushort* aq);
QStatus alljoyn_msgarg_get_int32_array(const(alljoyn_msgarg) arg, ulong* length, int* ai);
QStatus alljoyn_msgarg_get_uint32_array(const(alljoyn_msgarg) arg, ulong* length, uint* au);
QStatus alljoyn_msgarg_get_int64_array(const(alljoyn_msgarg) arg, ulong* length, long* ax);
QStatus alljoyn_msgarg_get_uint64_array(const(alljoyn_msgarg) arg, ulong* length, ulong* at);
QStatus alljoyn_msgarg_get_double_array(const(alljoyn_msgarg) arg, ulong* length, double* ad);
QStatus alljoyn_msgarg_get_variant_array(const(alljoyn_msgarg) arg, const(char)* signature, ulong* length, alljoyn_msgarg* av);
ulong alljoyn_msgarg_get_array_numberofelements(const(alljoyn_msgarg) arg);
void alljoyn_msgarg_get_array_element(const(alljoyn_msgarg) arg, ulong index, alljoyn_msgarg* element);
PSTR alljoyn_msgarg_get_array_elementsignature(const(alljoyn_msgarg) arg, ulong index);
alljoyn_msgarg alljoyn_msgarg_getkey(alljoyn_msgarg arg);
alljoyn_msgarg alljoyn_msgarg_getvalue(alljoyn_msgarg arg);
QStatus alljoyn_msgarg_setdictentry(alljoyn_msgarg arg, alljoyn_msgarg key, alljoyn_msgarg value);
QStatus alljoyn_msgarg_setstruct(alljoyn_msgarg arg, alljoyn_msgarg struct_members, ulong num_members);
ulong alljoyn_msgarg_getnummembers(alljoyn_msgarg arg);
alljoyn_msgarg alljoyn_msgarg_getmember(alljoyn_msgarg arg, ulong index);
alljoyn_aboutdata alljoyn_aboutdata_create_empty();
alljoyn_aboutdata alljoyn_aboutdata_create(const(char)* defaultLanguage);
alljoyn_aboutdata alljoyn_aboutdata_create_full(const(alljoyn_msgarg) arg, const(char)* language);
void alljoyn_aboutdata_destroy(alljoyn_aboutdata data);
QStatus alljoyn_aboutdata_createfromxml(alljoyn_aboutdata data, const(char)* aboutDataXml);
ubyte alljoyn_aboutdata_isvalid(alljoyn_aboutdata data, const(char)* language);
QStatus alljoyn_aboutdata_createfrommsgarg(alljoyn_aboutdata data, const(alljoyn_msgarg) arg, const(char)* language);
QStatus alljoyn_aboutdata_setappid(alljoyn_aboutdata data, const(ubyte)* appId, const(ulong) num);
QStatus alljoyn_aboutdata_setappid_fromstring(alljoyn_aboutdata data, const(char)* appId);
QStatus alljoyn_aboutdata_getappid(alljoyn_aboutdata data, ubyte** appId, ulong* num);
QStatus alljoyn_aboutdata_setdefaultlanguage(alljoyn_aboutdata data, const(char)* defaultLanguage);
QStatus alljoyn_aboutdata_getdefaultlanguage(alljoyn_aboutdata data, byte** defaultLanguage);
QStatus alljoyn_aboutdata_setdevicename(alljoyn_aboutdata data, const(char)* deviceName, const(char)* language);
QStatus alljoyn_aboutdata_getdevicename(alljoyn_aboutdata data, byte** deviceName, const(char)* language);
QStatus alljoyn_aboutdata_setdeviceid(alljoyn_aboutdata data, const(char)* deviceId);
QStatus alljoyn_aboutdata_getdeviceid(alljoyn_aboutdata data, byte** deviceId);
QStatus alljoyn_aboutdata_setappname(alljoyn_aboutdata data, const(char)* appName, const(char)* language);
QStatus alljoyn_aboutdata_getappname(alljoyn_aboutdata data, byte** appName, const(char)* language);
QStatus alljoyn_aboutdata_setmanufacturer(alljoyn_aboutdata data, const(char)* manufacturer, const(char)* language);
QStatus alljoyn_aboutdata_getmanufacturer(alljoyn_aboutdata data, byte** manufacturer, const(char)* language);
QStatus alljoyn_aboutdata_setmodelnumber(alljoyn_aboutdata data, const(char)* modelNumber);
QStatus alljoyn_aboutdata_getmodelnumber(alljoyn_aboutdata data, byte** modelNumber);
QStatus alljoyn_aboutdata_setsupportedlanguage(alljoyn_aboutdata data, const(char)* language);
ulong alljoyn_aboutdata_getsupportedlanguages(alljoyn_aboutdata data, const(byte)** languageTags, ulong num);
QStatus alljoyn_aboutdata_setdescription(alljoyn_aboutdata data, const(char)* description, const(char)* language);
QStatus alljoyn_aboutdata_getdescription(alljoyn_aboutdata data, byte** description, const(char)* language);
QStatus alljoyn_aboutdata_setdateofmanufacture(alljoyn_aboutdata data, const(char)* dateOfManufacture);
QStatus alljoyn_aboutdata_getdateofmanufacture(alljoyn_aboutdata data, byte** dateOfManufacture);
QStatus alljoyn_aboutdata_setsoftwareversion(alljoyn_aboutdata data, const(char)* softwareVersion);
QStatus alljoyn_aboutdata_getsoftwareversion(alljoyn_aboutdata data, byte** softwareVersion);
QStatus alljoyn_aboutdata_getajsoftwareversion(alljoyn_aboutdata data, byte** ajSoftwareVersion);
QStatus alljoyn_aboutdata_sethardwareversion(alljoyn_aboutdata data, const(char)* hardwareVersion);
QStatus alljoyn_aboutdata_gethardwareversion(alljoyn_aboutdata data, byte** hardwareVersion);
QStatus alljoyn_aboutdata_setsupporturl(alljoyn_aboutdata data, const(char)* supportUrl);
QStatus alljoyn_aboutdata_getsupporturl(alljoyn_aboutdata data, byte** supportUrl);
QStatus alljoyn_aboutdata_setfield(alljoyn_aboutdata data, const(char)* name, alljoyn_msgarg value, const(char)* language);
QStatus alljoyn_aboutdata_getfield(alljoyn_aboutdata data, const(char)* name, alljoyn_msgarg* value, const(char)* language);
ulong alljoyn_aboutdata_getfields(alljoyn_aboutdata data, const(byte)** fields, ulong num_fields);
QStatus alljoyn_aboutdata_getaboutdata(alljoyn_aboutdata data, alljoyn_msgarg msgArg, const(char)* language);
QStatus alljoyn_aboutdata_getannouncedaboutdata(alljoyn_aboutdata data, alljoyn_msgarg msgArg);
ubyte alljoyn_aboutdata_isfieldrequired(alljoyn_aboutdata data, const(char)* fieldName);
ubyte alljoyn_aboutdata_isfieldannounced(alljoyn_aboutdata data, const(char)* fieldName);
ubyte alljoyn_aboutdata_isfieldlocalized(alljoyn_aboutdata data, const(char)* fieldName);
PSTR alljoyn_aboutdata_getfieldsignature(alljoyn_aboutdata data, const(char)* fieldName);
alljoyn_abouticon alljoyn_abouticon_create();
void alljoyn_abouticon_destroy(alljoyn_abouticon icon);
void alljoyn_abouticon_getcontent(alljoyn_abouticon icon, const(ubyte)** data, ulong* size);
QStatus alljoyn_abouticon_setcontent(alljoyn_abouticon icon, const(char)* type, ubyte* data, ulong csize, ubyte ownsData);
void alljoyn_abouticon_geturl(alljoyn_abouticon icon, const(byte)** type, const(byte)** url);
QStatus alljoyn_abouticon_seturl(alljoyn_abouticon icon, const(char)* type, const(char)* url);
void alljoyn_abouticon_clear(alljoyn_abouticon icon);
QStatus alljoyn_abouticon_setcontent_frommsgarg(alljoyn_abouticon icon, const(alljoyn_msgarg) arg);
ushort alljoyn_permissionconfigurator_getdefaultclaimcapabilities();
QStatus alljoyn_permissionconfigurator_getapplicationstate(const(alljoyn_permissionconfigurator) configurator, alljoyn_applicationstate* state);
QStatus alljoyn_permissionconfigurator_setapplicationstate(alljoyn_permissionconfigurator configurator, alljoyn_applicationstate state);
QStatus alljoyn_permissionconfigurator_getpublickey(alljoyn_permissionconfigurator configurator, byte** publicKey);
void alljoyn_permissionconfigurator_publickey_destroy(byte* publicKey);
QStatus alljoyn_permissionconfigurator_getmanifesttemplate(alljoyn_permissionconfigurator configurator, byte** manifestTemplateXml);
void alljoyn_permissionconfigurator_manifesttemplate_destroy(byte* manifestTemplateXml);
QStatus alljoyn_permissionconfigurator_setmanifesttemplatefromxml(alljoyn_permissionconfigurator configurator, byte* manifestTemplateXml);
QStatus alljoyn_permissionconfigurator_getclaimcapabilities(const(alljoyn_permissionconfigurator) configurator, ushort* claimCapabilities);
QStatus alljoyn_permissionconfigurator_setclaimcapabilities(alljoyn_permissionconfigurator configurator, ushort claimCapabilities);
QStatus alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo(const(alljoyn_permissionconfigurator) configurator, ushort* additionalInfo);
QStatus alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo(alljoyn_permissionconfigurator configurator, ushort additionalInfo);
QStatus alljoyn_permissionconfigurator_reset(alljoyn_permissionconfigurator configurator);
QStatus alljoyn_permissionconfigurator_claim(alljoyn_permissionconfigurator configurator, byte* caKey, byte* identityCertificateChain, const(ubyte)* groupId, ulong groupSize, byte* groupAuthority, byte** manifestsXmls, ulong manifestsCount);
QStatus alljoyn_permissionconfigurator_updateidentity(alljoyn_permissionconfigurator configurator, byte* identityCertificateChain, byte** manifestsXmls, ulong manifestsCount);
QStatus alljoyn_permissionconfigurator_getidentity(alljoyn_permissionconfigurator configurator, byte** identityCertificateChain);
void alljoyn_permissionconfigurator_certificatechain_destroy(byte* certificateChain);
QStatus alljoyn_permissionconfigurator_getmanifests(alljoyn_permissionconfigurator configurator, alljoyn_manifestarray* manifestArray);
void alljoyn_permissionconfigurator_manifestarray_cleanup(alljoyn_manifestarray* manifestArray);
QStatus alljoyn_permissionconfigurator_installmanifests(alljoyn_permissionconfigurator configurator, byte** manifestsXmls, ulong manifestsCount, int append);
QStatus alljoyn_permissionconfigurator_getidentitycertificateid(alljoyn_permissionconfigurator configurator, alljoyn_certificateid* certificateId);
void alljoyn_permissionconfigurator_certificateid_cleanup(alljoyn_certificateid* certificateId);
QStatus alljoyn_permissionconfigurator_updatepolicy(alljoyn_permissionconfigurator configurator, byte* policyXml);
QStatus alljoyn_permissionconfigurator_getpolicy(alljoyn_permissionconfigurator configurator, byte** policyXml);
QStatus alljoyn_permissionconfigurator_getdefaultpolicy(alljoyn_permissionconfigurator configurator, byte** policyXml);
void alljoyn_permissionconfigurator_policy_destroy(byte* policyXml);
QStatus alljoyn_permissionconfigurator_resetpolicy(alljoyn_permissionconfigurator configurator);
QStatus alljoyn_permissionconfigurator_getmembershipsummaries(alljoyn_permissionconfigurator configurator, alljoyn_certificateidarray* certificateIds);
void alljoyn_permissionconfigurator_certificateidarray_cleanup(alljoyn_certificateidarray* certificateIdArray);
QStatus alljoyn_permissionconfigurator_installmembership(alljoyn_permissionconfigurator configurator, byte* membershipCertificateChain);
QStatus alljoyn_permissionconfigurator_removemembership(alljoyn_permissionconfigurator configurator, const(ubyte)* serial, ulong serialLen, byte* issuerPublicKey, const(ubyte)* issuerAki, ulong issuerAkiLen);
QStatus alljoyn_permissionconfigurator_startmanagement(alljoyn_permissionconfigurator configurator);
QStatus alljoyn_permissionconfigurator_endmanagement(alljoyn_permissionconfigurator configurator);
alljoyn_applicationstatelistener alljoyn_applicationstatelistener_create(const(alljoyn_applicationstatelistener_callbacks)* callbacks, void* context);
void alljoyn_applicationstatelistener_destroy(alljoyn_applicationstatelistener listener);
alljoyn_keystorelistener alljoyn_keystorelistener_create(const(alljoyn_keystorelistener_callbacks)* callbacks, const(void)* context);
alljoyn_keystorelistener alljoyn_keystorelistener_with_synchronization_create(const(alljoyn_keystorelistener_with_synchronization_callbacks)* callbacks, void* context);
void alljoyn_keystorelistener_destroy(alljoyn_keystorelistener listener);
QStatus alljoyn_keystorelistener_putkeys(alljoyn_keystorelistener listener, alljoyn_keystore keyStore, const(char)* source, const(char)* password);
QStatus alljoyn_keystorelistener_getkeys(alljoyn_keystorelistener listener, alljoyn_keystore keyStore, PSTR sink, ulong* sink_sz);
alljoyn_sessionopts alljoyn_sessionopts_create(ubyte traffic, int isMultipoint, ubyte proximity, ushort transports);
void alljoyn_sessionopts_destroy(alljoyn_sessionopts opts);
ubyte alljoyn_sessionopts_get_traffic(const(alljoyn_sessionopts) opts);
void alljoyn_sessionopts_set_traffic(alljoyn_sessionopts opts, ubyte traffic);
int alljoyn_sessionopts_get_multipoint(const(alljoyn_sessionopts) opts);
void alljoyn_sessionopts_set_multipoint(alljoyn_sessionopts opts, int isMultipoint);
ubyte alljoyn_sessionopts_get_proximity(const(alljoyn_sessionopts) opts);
void alljoyn_sessionopts_set_proximity(alljoyn_sessionopts opts, ubyte proximity);
ushort alljoyn_sessionopts_get_transports(const(alljoyn_sessionopts) opts);
void alljoyn_sessionopts_set_transports(alljoyn_sessionopts opts, ushort transports);
int alljoyn_sessionopts_iscompatible(const(alljoyn_sessionopts) one, const(alljoyn_sessionopts) other);
int alljoyn_sessionopts_cmp(const(alljoyn_sessionopts) one, const(alljoyn_sessionopts) other);
alljoyn_message alljoyn_message_create(alljoyn_busattachment bus);
void alljoyn_message_destroy(alljoyn_message msg);
int alljoyn_message_isbroadcastsignal(alljoyn_message msg);
int alljoyn_message_isglobalbroadcast(alljoyn_message msg);
int alljoyn_message_issessionless(alljoyn_message msg);
ubyte alljoyn_message_getflags(alljoyn_message msg);
int alljoyn_message_isexpired(alljoyn_message msg, uint* tillExpireMS);
int alljoyn_message_isunreliable(alljoyn_message msg);
int alljoyn_message_isencrypted(alljoyn_message msg);
PSTR alljoyn_message_getauthmechanism(alljoyn_message msg);
alljoyn_messagetype alljoyn_message_gettype(alljoyn_message msg);
void alljoyn_message_getargs(alljoyn_message msg, ulong* numArgs, alljoyn_msgarg* args);
alljoyn_msgarg alljoyn_message_getarg(alljoyn_message msg, ulong argN);
QStatus alljoyn_message_parseargs(alljoyn_message msg, const(char)* signature);
uint alljoyn_message_getcallserial(alljoyn_message msg);
PSTR alljoyn_message_getsignature(alljoyn_message msg);
PSTR alljoyn_message_getobjectpath(alljoyn_message msg);
PSTR alljoyn_message_getinterface(alljoyn_message msg);
PSTR alljoyn_message_getmembername(alljoyn_message msg);
uint alljoyn_message_getreplyserial(alljoyn_message msg);
PSTR alljoyn_message_getsender(alljoyn_message msg);
PSTR alljoyn_message_getreceiveendpointname(alljoyn_message msg);
PSTR alljoyn_message_getdestination(alljoyn_message msg);
uint alljoyn_message_getcompressiontoken(alljoyn_message msg);
uint alljoyn_message_getsessionid(alljoyn_message msg);
PSTR alljoyn_message_geterrorname(alljoyn_message msg, PSTR errorMessage, ulong* errorMessage_size);
ulong alljoyn_message_tostring(alljoyn_message msg, PSTR str, ulong buf);
ulong alljoyn_message_description(alljoyn_message msg, PSTR str, ulong buf);
uint alljoyn_message_gettimestamp(alljoyn_message msg);
int alljoyn_message_eql(const(alljoyn_message) one, const(alljoyn_message) other);
void alljoyn_message_setendianess(const(byte) endian);
QStatus alljoyn_authlistener_requestcredentialsresponse(alljoyn_authlistener listener, void* authContext, int accept, alljoyn_credentials credentials);
QStatus alljoyn_authlistener_verifycredentialsresponse(alljoyn_authlistener listener, void* authContext, int accept);
alljoyn_authlistener alljoyn_authlistener_create(const(alljoyn_authlistener_callbacks)* callbacks, const(void)* context);
alljoyn_authlistener alljoyn_authlistenerasync_create(const(alljoyn_authlistenerasync_callbacks)* callbacks, const(void)* context);
void alljoyn_authlistener_destroy(alljoyn_authlistener listener);
void alljoyn_authlistenerasync_destroy(alljoyn_authlistener listener);
QStatus alljoyn_authlistener_setsharedsecret(alljoyn_authlistener listener, const(ubyte)* sharedSecret, ulong sharedSecretSize);
alljoyn_credentials alljoyn_credentials_create();
void alljoyn_credentials_destroy(alljoyn_credentials cred);
int alljoyn_credentials_isset(const(alljoyn_credentials) cred, ushort creds);
void alljoyn_credentials_setpassword(alljoyn_credentials cred, const(char)* pwd);
void alljoyn_credentials_setusername(alljoyn_credentials cred, const(char)* userName);
void alljoyn_credentials_setcertchain(alljoyn_credentials cred, const(char)* certChain);
void alljoyn_credentials_setprivatekey(alljoyn_credentials cred, const(char)* pk);
void alljoyn_credentials_setlogonentry(alljoyn_credentials cred, const(char)* logonEntry);
void alljoyn_credentials_setexpiration(alljoyn_credentials cred, uint expiration);
PSTR alljoyn_credentials_getpassword(const(alljoyn_credentials) cred);
PSTR alljoyn_credentials_getusername(const(alljoyn_credentials) cred);
PSTR alljoyn_credentials_getcertchain(const(alljoyn_credentials) cred);
PSTR alljoyn_credentials_getprivateKey(const(alljoyn_credentials) cred);
PSTR alljoyn_credentials_getlogonentry(const(alljoyn_credentials) cred);
uint alljoyn_credentials_getexpiration(const(alljoyn_credentials) cred);
void alljoyn_credentials_clear(alljoyn_credentials cred);
alljoyn_buslistener alljoyn_buslistener_create(const(alljoyn_buslistener_callbacks)* callbacks, const(void)* context);
void alljoyn_buslistener_destroy(alljoyn_buslistener listener);
ulong alljoyn_interfacedescription_member_getannotationscount(alljoyn_interfacedescription_member member);
void alljoyn_interfacedescription_member_getannotationatindex(alljoyn_interfacedescription_member member, ulong index, PSTR name, ulong* name_size, PSTR value, ulong* value_size);
int alljoyn_interfacedescription_member_getannotation(alljoyn_interfacedescription_member member, const(char)* name, PSTR value, ulong* value_size);
ulong alljoyn_interfacedescription_member_getargannotationscount(alljoyn_interfacedescription_member member, const(char)* argName);
void alljoyn_interfacedescription_member_getargannotationatindex(alljoyn_interfacedescription_member member, const(char)* argName, ulong index, PSTR name, ulong* name_size, PSTR value, ulong* value_size);
int alljoyn_interfacedescription_member_getargannotation(alljoyn_interfacedescription_member member, const(char)* argName, const(char)* name, PSTR value, ulong* value_size);
ulong alljoyn_interfacedescription_property_getannotationscount(alljoyn_interfacedescription_property property);
void alljoyn_interfacedescription_property_getannotationatindex(alljoyn_interfacedescription_property property, ulong index, PSTR name, ulong* name_size, PSTR value, ulong* value_size);
int alljoyn_interfacedescription_property_getannotation(alljoyn_interfacedescription_property property, const(char)* name, PSTR value, ulong* value_size);
void alljoyn_interfacedescription_activate(alljoyn_interfacedescription iface);
QStatus alljoyn_interfacedescription_addannotation(alljoyn_interfacedescription iface, const(char)* name, const(char)* value);
int alljoyn_interfacedescription_getannotation(alljoyn_interfacedescription iface, const(char)* name, PSTR value, ulong* value_size);
ulong alljoyn_interfacedescription_getannotationscount(alljoyn_interfacedescription iface);
void alljoyn_interfacedescription_getannotationatindex(alljoyn_interfacedescription iface, ulong index, PSTR name, ulong* name_size, PSTR value, ulong* value_size);
int alljoyn_interfacedescription_getmember(const(alljoyn_interfacedescription) iface, const(char)* name, alljoyn_interfacedescription_member* member);
QStatus alljoyn_interfacedescription_addmember(alljoyn_interfacedescription iface, alljoyn_messagetype type, const(char)* name, const(char)* inputSig, const(char)* outSig, const(char)* argNames, ubyte annotation);
QStatus alljoyn_interfacedescription_addmemberannotation(alljoyn_interfacedescription iface, const(char)* member, const(char)* name, const(char)* value);
int alljoyn_interfacedescription_getmemberannotation(alljoyn_interfacedescription iface, const(char)* member, const(char)* name, PSTR value, ulong* value_size);
ulong alljoyn_interfacedescription_getmembers(const(alljoyn_interfacedescription) iface, alljoyn_interfacedescription_member* members, ulong numMembers);
int alljoyn_interfacedescription_hasmember(alljoyn_interfacedescription iface, const(char)* name, const(char)* inSig, const(char)* outSig);
QStatus alljoyn_interfacedescription_addmethod(alljoyn_interfacedescription iface, const(char)* name, const(char)* inputSig, const(char)* outSig, const(char)* argNames, ubyte annotation, const(char)* accessPerms);
int alljoyn_interfacedescription_getmethod(alljoyn_interfacedescription iface, const(char)* name, alljoyn_interfacedescription_member* member);
QStatus alljoyn_interfacedescription_addsignal(alljoyn_interfacedescription iface, const(char)* name, const(char)* sig, const(char)* argNames, ubyte annotation, const(char)* accessPerms);
int alljoyn_interfacedescription_getsignal(alljoyn_interfacedescription iface, const(char)* name, alljoyn_interfacedescription_member* member);
int alljoyn_interfacedescription_getproperty(const(alljoyn_interfacedescription) iface, const(char)* name, alljoyn_interfacedescription_property* property);
ulong alljoyn_interfacedescription_getproperties(const(alljoyn_interfacedescription) iface, alljoyn_interfacedescription_property* props, ulong numProps);
QStatus alljoyn_interfacedescription_addproperty(alljoyn_interfacedescription iface, const(char)* name, const(char)* signature, ubyte access);
QStatus alljoyn_interfacedescription_addpropertyannotation(alljoyn_interfacedescription iface, const(char)* property, const(char)* name, const(char)* value);
int alljoyn_interfacedescription_getpropertyannotation(alljoyn_interfacedescription iface, const(char)* property, const(char)* name, PSTR value, ulong* str_size);
int alljoyn_interfacedescription_hasproperty(const(alljoyn_interfacedescription) iface, const(char)* name);
int alljoyn_interfacedescription_hasproperties(const(alljoyn_interfacedescription) iface);
PSTR alljoyn_interfacedescription_getname(const(alljoyn_interfacedescription) iface);
ulong alljoyn_interfacedescription_introspect(const(alljoyn_interfacedescription) iface, PSTR str, ulong buf, ulong indent);
int alljoyn_interfacedescription_issecure(const(alljoyn_interfacedescription) iface);
alljoyn_interfacedescription_securitypolicy alljoyn_interfacedescription_getsecuritypolicy(const(alljoyn_interfacedescription) iface);
void alljoyn_interfacedescription_setdescriptionlanguage(alljoyn_interfacedescription iface, const(char)* language);
ulong alljoyn_interfacedescription_getdescriptionlanguages(const(alljoyn_interfacedescription) iface, const(byte)** languages, ulong size);
ulong alljoyn_interfacedescription_getdescriptionlanguages2(const(alljoyn_interfacedescription) iface, PSTR languages, ulong languagesSize);
void alljoyn_interfacedescription_setdescription(alljoyn_interfacedescription iface, const(char)* description);
QStatus alljoyn_interfacedescription_setdescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* description, const(char)* languageTag);
ulong alljoyn_interfacedescription_getdescriptionforlanguage(alljoyn_interfacedescription iface, PSTR description, ulong maxLanguageLength, const(char)* languageTag);
QStatus alljoyn_interfacedescription_setmemberdescription(alljoyn_interfacedescription iface, const(char)* member, const(char)* description);
QStatus alljoyn_interfacedescription_setmemberdescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* member, const(char)* description, const(char)* languageTag);
ulong alljoyn_interfacedescription_getmemberdescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* member, PSTR description, ulong maxLanguageLength, const(char)* languageTag);
QStatus alljoyn_interfacedescription_setargdescription(alljoyn_interfacedescription iface, const(char)* member, const(char)* argName, const(char)* description);
QStatus alljoyn_interfacedescription_setargdescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* member, const(char)* arg, const(char)* description, const(char)* languageTag);
ulong alljoyn_interfacedescription_getargdescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* member, const(char)* arg, PSTR description, ulong maxLanguageLength, const(char)* languageTag);
QStatus alljoyn_interfacedescription_setpropertydescription(alljoyn_interfacedescription iface, const(char)* name, const(char)* description);
QStatus alljoyn_interfacedescription_setpropertydescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* name, const(char)* description, const(char)* languageTag);
ulong alljoyn_interfacedescription_getpropertydescriptionforlanguage(alljoyn_interfacedescription iface, const(char)* property, PSTR description, ulong maxLanguageLength, const(char)* languageTag);
void alljoyn_interfacedescription_setdescriptiontranslationcallback(alljoyn_interfacedescription iface, alljoyn_interfacedescription_translation_callback_ptr translationCallback);
alljoyn_interfacedescription_translation_callback_ptr alljoyn_interfacedescription_getdescriptiontranslationcallback(const(alljoyn_interfacedescription) iface);
int alljoyn_interfacedescription_hasdescription(const(alljoyn_interfacedescription) iface);
QStatus alljoyn_interfacedescription_addargannotation(alljoyn_interfacedescription iface, const(char)* member, const(char)* argName, const(char)* name, const(char)* value);
int alljoyn_interfacedescription_getmemberargannotation(const(alljoyn_interfacedescription) iface, const(char)* member, const(char)* argName, const(char)* name, PSTR value, ulong* value_size);
int alljoyn_interfacedescription_eql(const(alljoyn_interfacedescription) one, const(alljoyn_interfacedescription) other);
int alljoyn_interfacedescription_member_eql(const(alljoyn_interfacedescription_member) one, const(alljoyn_interfacedescription_member) other);
int alljoyn_interfacedescription_property_eql(const(alljoyn_interfacedescription_property) one, const(alljoyn_interfacedescription_property) other);
alljoyn_busobject alljoyn_busobject_create(const(char)* path, int isPlaceholder, const(alljoyn_busobject_callbacks)* callbacks_in, const(void)* context_in);
void alljoyn_busobject_destroy(alljoyn_busobject bus);
PSTR alljoyn_busobject_getpath(alljoyn_busobject bus);
void alljoyn_busobject_emitpropertychanged(alljoyn_busobject bus, const(char)* ifcName, const(char)* propName, alljoyn_msgarg val, uint id);
void alljoyn_busobject_emitpropertieschanged(alljoyn_busobject bus, const(char)* ifcName, const(byte)** propNames, ulong numProps, uint id);
ulong alljoyn_busobject_getname(alljoyn_busobject bus, PSTR buffer, ulong bufferSz);
QStatus alljoyn_busobject_addinterface(alljoyn_busobject bus, const(alljoyn_interfacedescription) iface);
QStatus alljoyn_busobject_addmethodhandler(alljoyn_busobject bus, const(alljoyn_interfacedescription_member) member, alljoyn_messagereceiver_methodhandler_ptr handler, void* context);
QStatus alljoyn_busobject_addmethodhandlers(alljoyn_busobject bus, const(alljoyn_busobject_methodentry)* entries, ulong numEntries);
QStatus alljoyn_busobject_methodreply_args(alljoyn_busobject bus, alljoyn_message msg, const(alljoyn_msgarg) args, ulong numArgs);
QStatus alljoyn_busobject_methodreply_err(alljoyn_busobject bus, alljoyn_message msg, const(char)* error, const(char)* errorMessage);
QStatus alljoyn_busobject_methodreply_status(alljoyn_busobject bus, alljoyn_message msg, QStatus status);
alljoyn_busattachment alljoyn_busobject_getbusattachment(alljoyn_busobject bus);
QStatus alljoyn_busobject_signal(alljoyn_busobject bus, const(char)* destination, uint sessionId, const(alljoyn_interfacedescription_member) signal, const(alljoyn_msgarg) args, ulong numArgs, ushort timeToLive, ubyte flags, alljoyn_message msg);
QStatus alljoyn_busobject_cancelsessionlessmessage_serial(alljoyn_busobject bus, uint serialNumber);
QStatus alljoyn_busobject_cancelsessionlessmessage(alljoyn_busobject bus, const(alljoyn_message) msg);
int alljoyn_busobject_issecure(alljoyn_busobject bus);
ulong alljoyn_busobject_getannouncedinterfacenames(alljoyn_busobject bus, const(byte)** interfaces, ulong numInterfaces);
QStatus alljoyn_busobject_setannounceflag(alljoyn_busobject bus, const(alljoyn_interfacedescription) iface, alljoyn_about_announceflag isAnnounced);
QStatus alljoyn_busobject_addinterface_announced(alljoyn_busobject bus, const(alljoyn_interfacedescription) iface);
alljoyn_proxybusobject alljoyn_proxybusobject_create(alljoyn_busattachment bus, const(char)* service, const(char)* path, uint sessionId);
alljoyn_proxybusobject alljoyn_proxybusobject_create_secure(alljoyn_busattachment bus, const(char)* service, const(char)* path, uint sessionId);
void alljoyn_proxybusobject_destroy(alljoyn_proxybusobject proxyObj);
QStatus alljoyn_proxybusobject_addinterface(alljoyn_proxybusobject proxyObj, const(alljoyn_interfacedescription) iface);
QStatus alljoyn_proxybusobject_addinterface_by_name(alljoyn_proxybusobject proxyObj, const(char)* name);
ulong alljoyn_proxybusobject_getchildren(alljoyn_proxybusobject proxyObj, alljoyn_proxybusobject* children, ulong numChildren);
alljoyn_proxybusobject alljoyn_proxybusobject_getchild(alljoyn_proxybusobject proxyObj, const(char)* path);
QStatus alljoyn_proxybusobject_addchild(alljoyn_proxybusobject proxyObj, const(alljoyn_proxybusobject) child);
QStatus alljoyn_proxybusobject_removechild(alljoyn_proxybusobject proxyObj, const(char)* path);
QStatus alljoyn_proxybusobject_introspectremoteobject(alljoyn_proxybusobject proxyObj);
QStatus alljoyn_proxybusobject_introspectremoteobjectasync(alljoyn_proxybusobject proxyObj, alljoyn_proxybusobject_listener_introspectcb_ptr callback, void* context);
QStatus alljoyn_proxybusobject_getproperty(alljoyn_proxybusobject proxyObj, const(char)* iface, const(char)* property, alljoyn_msgarg value);
QStatus alljoyn_proxybusobject_getpropertyasync(alljoyn_proxybusobject proxyObj, const(char)* iface, const(char)* property, alljoyn_proxybusobject_listener_getpropertycb_ptr callback, uint timeout, void* context);
QStatus alljoyn_proxybusobject_getallproperties(alljoyn_proxybusobject proxyObj, const(char)* iface, alljoyn_msgarg values);
QStatus alljoyn_proxybusobject_getallpropertiesasync(alljoyn_proxybusobject proxyObj, const(char)* iface, alljoyn_proxybusobject_listener_getallpropertiescb_ptr callback, uint timeout, void* context);
QStatus alljoyn_proxybusobject_setproperty(alljoyn_proxybusobject proxyObj, const(char)* iface, const(char)* property, alljoyn_msgarg value);
QStatus alljoyn_proxybusobject_registerpropertieschangedlistener(alljoyn_proxybusobject proxyObj, const(char)* iface, const(byte)** properties, ulong numProperties, alljoyn_proxybusobject_listener_propertieschanged_ptr callback, void* context);
QStatus alljoyn_proxybusobject_unregisterpropertieschangedlistener(alljoyn_proxybusobject proxyObj, const(char)* iface, alljoyn_proxybusobject_listener_propertieschanged_ptr callback);
QStatus alljoyn_proxybusobject_setpropertyasync(alljoyn_proxybusobject proxyObj, const(char)* iface, const(char)* property, alljoyn_msgarg value, alljoyn_proxybusobject_listener_setpropertycb_ptr callback, uint timeout, void* context);
QStatus alljoyn_proxybusobject_methodcall(alljoyn_proxybusobject proxyObj, const(char)* ifaceName, const(char)* methodName, const(alljoyn_msgarg) args, ulong numArgs, alljoyn_message replyMsg, uint timeout, ubyte flags);
QStatus alljoyn_proxybusobject_methodcall_member(alljoyn_proxybusobject proxyObj, const(alljoyn_interfacedescription_member) method, const(alljoyn_msgarg) args, ulong numArgs, alljoyn_message replyMsg, uint timeout, ubyte flags);
QStatus alljoyn_proxybusobject_methodcall_noreply(alljoyn_proxybusobject proxyObj, const(char)* ifaceName, const(char)* methodName, const(alljoyn_msgarg) args, ulong numArgs, ubyte flags);
QStatus alljoyn_proxybusobject_methodcall_member_noreply(alljoyn_proxybusobject proxyObj, const(alljoyn_interfacedescription_member) method, const(alljoyn_msgarg) args, ulong numArgs, ubyte flags);
QStatus alljoyn_proxybusobject_methodcallasync(alljoyn_proxybusobject proxyObj, const(char)* ifaceName, const(char)* methodName, alljoyn_messagereceiver_replyhandler_ptr replyFunc, const(alljoyn_msgarg) args, ulong numArgs, void* context, uint timeout, ubyte flags);
QStatus alljoyn_proxybusobject_methodcallasync_member(alljoyn_proxybusobject proxyObj, const(alljoyn_interfacedescription_member) method, alljoyn_messagereceiver_replyhandler_ptr replyFunc, const(alljoyn_msgarg) args, ulong numArgs, void* context, uint timeout, ubyte flags);
QStatus alljoyn_proxybusobject_parsexml(alljoyn_proxybusobject proxyObj, const(char)* xml, const(char)* identifier);
QStatus alljoyn_proxybusobject_secureconnection(alljoyn_proxybusobject proxyObj, int forceAuth);
QStatus alljoyn_proxybusobject_secureconnectionasync(alljoyn_proxybusobject proxyObj, int forceAuth);
alljoyn_interfacedescription alljoyn_proxybusobject_getinterface(alljoyn_proxybusobject proxyObj, const(char)* iface);
ulong alljoyn_proxybusobject_getinterfaces(alljoyn_proxybusobject proxyObj, const(alljoyn_interfacedescription)* ifaces, ulong numIfaces);
PSTR alljoyn_proxybusobject_getpath(alljoyn_proxybusobject proxyObj);
PSTR alljoyn_proxybusobject_getservicename(alljoyn_proxybusobject proxyObj);
PSTR alljoyn_proxybusobject_getuniquename(alljoyn_proxybusobject proxyObj);
uint alljoyn_proxybusobject_getsessionid(alljoyn_proxybusobject proxyObj);
int alljoyn_proxybusobject_implementsinterface(alljoyn_proxybusobject proxyObj, const(char)* iface);
alljoyn_proxybusobject alljoyn_proxybusobject_copy(const(alljoyn_proxybusobject) source);
int alljoyn_proxybusobject_isvalid(alljoyn_proxybusobject proxyObj);
int alljoyn_proxybusobject_issecure(alljoyn_proxybusobject proxyObj);
void alljoyn_proxybusobject_enablepropertycaching(alljoyn_proxybusobject proxyObj);
alljoyn_permissionconfigurationlistener alljoyn_permissionconfigurationlistener_create(const(alljoyn_permissionconfigurationlistener_callbacks)* callbacks, const(void)* context);
void alljoyn_permissionconfigurationlistener_destroy(alljoyn_permissionconfigurationlistener listener);
alljoyn_sessionlistener alljoyn_sessionlistener_create(const(alljoyn_sessionlistener_callbacks)* callbacks, const(void)* context);
void alljoyn_sessionlistener_destroy(alljoyn_sessionlistener listener);
alljoyn_sessionportlistener alljoyn_sessionportlistener_create(const(alljoyn_sessionportlistener_callbacks)* callbacks, const(void)* context);
void alljoyn_sessionportlistener_destroy(alljoyn_sessionportlistener listener);
alljoyn_aboutlistener alljoyn_aboutlistener_create(const(alljoyn_aboutlistener_callback)* callback, const(void)* context);
void alljoyn_aboutlistener_destroy(alljoyn_aboutlistener listener);
alljoyn_busattachment alljoyn_busattachment_create(const(char)* applicationName, int allowRemoteMessages);
alljoyn_busattachment alljoyn_busattachment_create_concurrency(const(char)* applicationName, int allowRemoteMessages, uint concurrency);
void alljoyn_busattachment_destroy(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_start(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_stop(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_join(alljoyn_busattachment bus);
uint alljoyn_busattachment_getconcurrency(alljoyn_busattachment bus);
PSTR alljoyn_busattachment_getconnectspec(alljoyn_busattachment bus);
void alljoyn_busattachment_enableconcurrentcallbacks(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_createinterface(alljoyn_busattachment bus, const(char)* name, alljoyn_interfacedescription* iface);
QStatus alljoyn_busattachment_createinterface_secure(alljoyn_busattachment bus, const(char)* name, alljoyn_interfacedescription* iface, alljoyn_interfacedescription_securitypolicy secPolicy);
QStatus alljoyn_busattachment_connect(alljoyn_busattachment bus, const(char)* connectSpec);
void alljoyn_busattachment_registerbuslistener(alljoyn_busattachment bus, alljoyn_buslistener listener);
void alljoyn_busattachment_unregisterbuslistener(alljoyn_busattachment bus, alljoyn_buslistener listener);
QStatus alljoyn_busattachment_findadvertisedname(alljoyn_busattachment bus, const(char)* namePrefix);
QStatus alljoyn_busattachment_findadvertisednamebytransport(alljoyn_busattachment bus, const(char)* namePrefix, ushort transports);
QStatus alljoyn_busattachment_cancelfindadvertisedname(alljoyn_busattachment bus, const(char)* namePrefix);
QStatus alljoyn_busattachment_cancelfindadvertisednamebytransport(alljoyn_busattachment bus, const(char)* namePrefix, ushort transports);
QStatus alljoyn_busattachment_advertisename(alljoyn_busattachment bus, const(char)* name, ushort transports);
QStatus alljoyn_busattachment_canceladvertisename(alljoyn_busattachment bus, const(char)* name, ushort transports);
alljoyn_interfacedescription alljoyn_busattachment_getinterface(alljoyn_busattachment bus, const(char)* name);
QStatus alljoyn_busattachment_joinsession(alljoyn_busattachment bus, const(char)* sessionHost, ushort sessionPort, alljoyn_sessionlistener listener, uint* sessionId, alljoyn_sessionopts opts);
QStatus alljoyn_busattachment_joinsessionasync(alljoyn_busattachment bus, const(char)* sessionHost, ushort sessionPort, alljoyn_sessionlistener listener, const(alljoyn_sessionopts) opts, alljoyn_busattachment_joinsessioncb_ptr callback, void* context);
QStatus alljoyn_busattachment_registerbusobject(alljoyn_busattachment bus, alljoyn_busobject obj);
QStatus alljoyn_busattachment_registerbusobject_secure(alljoyn_busattachment bus, alljoyn_busobject obj);
void alljoyn_busattachment_unregisterbusobject(alljoyn_busattachment bus, alljoyn_busobject object);
QStatus alljoyn_busattachment_requestname(alljoyn_busattachment bus, const(char)* requestedName, uint flags);
QStatus alljoyn_busattachment_releasename(alljoyn_busattachment bus, const(char)* name);
QStatus alljoyn_busattachment_bindsessionport(alljoyn_busattachment bus, ushort* sessionPort, const(alljoyn_sessionopts) opts, alljoyn_sessionportlistener listener);
QStatus alljoyn_busattachment_unbindsessionport(alljoyn_busattachment bus, ushort sessionPort);
QStatus alljoyn_busattachment_enablepeersecurity(alljoyn_busattachment bus, const(char)* authMechanisms, alljoyn_authlistener listener, const(char)* keyStoreFileName, int isShared);
QStatus alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener(alljoyn_busattachment bus, const(char)* authMechanisms, alljoyn_authlistener authListener, const(char)* keyStoreFileName, int isShared, alljoyn_permissionconfigurationlistener permissionConfigurationListener);
int alljoyn_busattachment_ispeersecurityenabled(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_createinterfacesfromxml(alljoyn_busattachment bus, const(char)* xml);
ulong alljoyn_busattachment_getinterfaces(const(alljoyn_busattachment) bus, const(alljoyn_interfacedescription)* ifaces, ulong numIfaces);
QStatus alljoyn_busattachment_deleteinterface(alljoyn_busattachment bus, alljoyn_interfacedescription iface);
int alljoyn_busattachment_isstarted(alljoyn_busattachment bus);
int alljoyn_busattachment_isstopping(alljoyn_busattachment bus);
int alljoyn_busattachment_isconnected(const(alljoyn_busattachment) bus);
QStatus alljoyn_busattachment_disconnect(alljoyn_busattachment bus, const(char)* unused);
alljoyn_proxybusobject alljoyn_busattachment_getdbusproxyobj(alljoyn_busattachment bus);
alljoyn_proxybusobject alljoyn_busattachment_getalljoynproxyobj(alljoyn_busattachment bus);
alljoyn_proxybusobject alljoyn_busattachment_getalljoyndebugobj(alljoyn_busattachment bus);
PSTR alljoyn_busattachment_getuniquename(const(alljoyn_busattachment) bus);
PSTR alljoyn_busattachment_getglobalguidstring(const(alljoyn_busattachment) bus);
QStatus alljoyn_busattachment_registersignalhandler(alljoyn_busattachment bus, alljoyn_messagereceiver_signalhandler_ptr signal_handler, const(alljoyn_interfacedescription_member) member, const(char)* srcPath);
QStatus alljoyn_busattachment_registersignalhandlerwithrule(alljoyn_busattachment bus, alljoyn_messagereceiver_signalhandler_ptr signal_handler, const(alljoyn_interfacedescription_member) member, const(char)* matchRule);
QStatus alljoyn_busattachment_unregistersignalhandler(alljoyn_busattachment bus, alljoyn_messagereceiver_signalhandler_ptr signal_handler, const(alljoyn_interfacedescription_member) member, const(char)* srcPath);
QStatus alljoyn_busattachment_unregistersignalhandlerwithrule(alljoyn_busattachment bus, alljoyn_messagereceiver_signalhandler_ptr signal_handler, const(alljoyn_interfacedescription_member) member, const(char)* matchRule);
QStatus alljoyn_busattachment_unregisterallhandlers(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_registerkeystorelistener(alljoyn_busattachment bus, alljoyn_keystorelistener listener);
QStatus alljoyn_busattachment_reloadkeystore(alljoyn_busattachment bus);
void alljoyn_busattachment_clearkeystore(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_clearkeys(alljoyn_busattachment bus, const(char)* guid);
QStatus alljoyn_busattachment_setkeyexpiration(alljoyn_busattachment bus, const(char)* guid, uint timeout);
QStatus alljoyn_busattachment_getkeyexpiration(alljoyn_busattachment bus, const(char)* guid, uint* timeout);
QStatus alljoyn_busattachment_addlogonentry(alljoyn_busattachment bus, const(char)* authMechanism, const(char)* userName, const(char)* password);
QStatus alljoyn_busattachment_addmatch(alljoyn_busattachment bus, const(char)* rule);
QStatus alljoyn_busattachment_removematch(alljoyn_busattachment bus, const(char)* rule);
QStatus alljoyn_busattachment_setsessionlistener(alljoyn_busattachment bus, uint sessionId, alljoyn_sessionlistener listener);
QStatus alljoyn_busattachment_leavesession(alljoyn_busattachment bus, uint sessionId);
QStatus alljoyn_busattachment_secureconnection(alljoyn_busattachment bus, const(char)* name, int forceAuth);
QStatus alljoyn_busattachment_secureconnectionasync(alljoyn_busattachment bus, const(char)* name, int forceAuth);
QStatus alljoyn_busattachment_removesessionmember(alljoyn_busattachment bus, uint sessionId, const(char)* memberName);
QStatus alljoyn_busattachment_setlinktimeout(alljoyn_busattachment bus, uint sessionid, uint* linkTimeout);
QStatus alljoyn_busattachment_setlinktimeoutasync(alljoyn_busattachment bus, uint sessionid, uint linkTimeout, alljoyn_busattachment_setlinktimeoutcb_ptr callback, void* context);
QStatus alljoyn_busattachment_namehasowner(alljoyn_busattachment bus, const(char)* name, int* hasOwner);
QStatus alljoyn_busattachment_getpeerguid(alljoyn_busattachment bus, const(char)* name, PSTR guid, ulong* guidSz);
QStatus alljoyn_busattachment_setdaemondebug(alljoyn_busattachment bus, const(char)* module_, uint level);
uint alljoyn_busattachment_gettimestamp();
QStatus alljoyn_busattachment_ping(alljoyn_busattachment bus, const(char)* name, uint timeout);
void alljoyn_busattachment_registeraboutlistener(alljoyn_busattachment bus, alljoyn_aboutlistener aboutListener);
void alljoyn_busattachment_unregisteraboutlistener(alljoyn_busattachment bus, alljoyn_aboutlistener aboutListener);
void alljoyn_busattachment_unregisterallaboutlisteners(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_whoimplements_interfaces(alljoyn_busattachment bus, const(byte)** implementsInterfaces, ulong numberInterfaces);
QStatus alljoyn_busattachment_whoimplements_interface(alljoyn_busattachment bus, const(char)* implementsInterface);
QStatus alljoyn_busattachment_cancelwhoimplements_interfaces(alljoyn_busattachment bus, const(byte)** implementsInterfaces, ulong numberInterfaces);
QStatus alljoyn_busattachment_cancelwhoimplements_interface(alljoyn_busattachment bus, const(char)* implementsInterface);
alljoyn_permissionconfigurator alljoyn_busattachment_getpermissionconfigurator(alljoyn_busattachment bus);
QStatus alljoyn_busattachment_registerapplicationstatelistener(alljoyn_busattachment bus, alljoyn_applicationstatelistener listener);
QStatus alljoyn_busattachment_unregisterapplicationstatelistener(alljoyn_busattachment bus, alljoyn_applicationstatelistener listener);
QStatus alljoyn_busattachment_deletedefaultkeystore(const(char)* applicationName);
alljoyn_abouticonobj alljoyn_abouticonobj_create(alljoyn_busattachment bus, alljoyn_abouticon icon);
void alljoyn_abouticonobj_destroy(alljoyn_abouticonobj icon);
alljoyn_abouticonproxy alljoyn_abouticonproxy_create(alljoyn_busattachment bus, const(char)* busName, uint sessionId);
void alljoyn_abouticonproxy_destroy(alljoyn_abouticonproxy proxy);
QStatus alljoyn_abouticonproxy_geticon(alljoyn_abouticonproxy proxy, alljoyn_abouticon icon);
QStatus alljoyn_abouticonproxy_getversion(alljoyn_abouticonproxy proxy, ushort* version_);
alljoyn_aboutdatalistener alljoyn_aboutdatalistener_create(const(alljoyn_aboutdatalistener_callbacks)* callbacks, const(void)* context);
void alljoyn_aboutdatalistener_destroy(alljoyn_aboutdatalistener listener);
alljoyn_aboutobj alljoyn_aboutobj_create(alljoyn_busattachment bus, alljoyn_about_announceflag isAnnounced);
void alljoyn_aboutobj_destroy(alljoyn_aboutobj obj);
QStatus alljoyn_aboutobj_announce(alljoyn_aboutobj obj, ushort sessionPort, alljoyn_aboutdata aboutData);
QStatus alljoyn_aboutobj_announce_using_datalistener(alljoyn_aboutobj obj, ushort sessionPort, alljoyn_aboutdatalistener aboutListener);
QStatus alljoyn_aboutobj_unannounce(alljoyn_aboutobj obj);
alljoyn_aboutobjectdescription alljoyn_aboutobjectdescription_create();
alljoyn_aboutobjectdescription alljoyn_aboutobjectdescription_create_full(const(alljoyn_msgarg) arg);
QStatus alljoyn_aboutobjectdescription_createfrommsgarg(alljoyn_aboutobjectdescription description, const(alljoyn_msgarg) arg);
void alljoyn_aboutobjectdescription_destroy(alljoyn_aboutobjectdescription description);
ulong alljoyn_aboutobjectdescription_getpaths(alljoyn_aboutobjectdescription description, const(byte)** paths, ulong numPaths);
ulong alljoyn_aboutobjectdescription_getinterfaces(alljoyn_aboutobjectdescription description, const(char)* path, const(byte)** interfaces, ulong numInterfaces);
ulong alljoyn_aboutobjectdescription_getinterfacepaths(alljoyn_aboutobjectdescription description, const(char)* interfaceName, const(byte)** paths, ulong numPaths);
void alljoyn_aboutobjectdescription_clear(alljoyn_aboutobjectdescription description);
ubyte alljoyn_aboutobjectdescription_haspath(alljoyn_aboutobjectdescription description, const(char)* path);
ubyte alljoyn_aboutobjectdescription_hasinterface(alljoyn_aboutobjectdescription description, const(char)* interfaceName);
ubyte alljoyn_aboutobjectdescription_hasinterfaceatpath(alljoyn_aboutobjectdescription description, const(char)* path, const(char)* interfaceName);
QStatus alljoyn_aboutobjectdescription_getmsgarg(alljoyn_aboutobjectdescription description, alljoyn_msgarg msgArg);
alljoyn_aboutproxy alljoyn_aboutproxy_create(alljoyn_busattachment bus, const(char)* busName, uint sessionId);
void alljoyn_aboutproxy_destroy(alljoyn_aboutproxy proxy);
QStatus alljoyn_aboutproxy_getobjectdescription(alljoyn_aboutproxy proxy, alljoyn_msgarg objectDesc);
QStatus alljoyn_aboutproxy_getaboutdata(alljoyn_aboutproxy proxy, const(char)* language, alljoyn_msgarg data);
QStatus alljoyn_aboutproxy_getversion(alljoyn_aboutproxy proxy, ushort* version_);
alljoyn_pinglistener alljoyn_pinglistener_create(const(alljoyn_pinglistener_callback)* callback, const(void)* context);
void alljoyn_pinglistener_destroy(alljoyn_pinglistener listener);
alljoyn_autopinger alljoyn_autopinger_create(alljoyn_busattachment bus);
void alljoyn_autopinger_destroy(alljoyn_autopinger autopinger);
void alljoyn_autopinger_pause(alljoyn_autopinger autopinger);
void alljoyn_autopinger_resume(alljoyn_autopinger autopinger);
void alljoyn_autopinger_addpinggroup(alljoyn_autopinger autopinger, const(char)* group, alljoyn_pinglistener listener, uint pinginterval);
void alljoyn_autopinger_removepinggroup(alljoyn_autopinger autopinger, const(char)* group);
QStatus alljoyn_autopinger_setpinginterval(alljoyn_autopinger autopinger, const(char)* group, uint pinginterval);
QStatus alljoyn_autopinger_adddestination(alljoyn_autopinger autopinger, const(char)* group, const(char)* destination);
QStatus alljoyn_autopinger_removedestination(alljoyn_autopinger autopinger, const(char)* group, const(char)* destination, int removeall);
PSTR alljoyn_getversion();
PSTR alljoyn_getbuildinfo();
uint alljoyn_getnumericversion();
QStatus alljoyn_init();
QStatus alljoyn_shutdown();
QStatus alljoyn_routerinit();
QStatus alljoyn_routerinitwithconfig(byte* configXml);
QStatus alljoyn_routershutdown();
alljoyn_proxybusobject_ref alljoyn_proxybusobject_ref_create(alljoyn_proxybusobject proxy);
alljoyn_proxybusobject alljoyn_proxybusobject_ref_get(alljoyn_proxybusobject_ref ref_);
void alljoyn_proxybusobject_ref_incref(alljoyn_proxybusobject_ref ref_);
void alljoyn_proxybusobject_ref_decref(alljoyn_proxybusobject_ref ref_);
alljoyn_observerlistener alljoyn_observerlistener_create(const(alljoyn_observerlistener_callback)* callback, const(void)* context);
void alljoyn_observerlistener_destroy(alljoyn_observerlistener listener);
alljoyn_observer alljoyn_observer_create(alljoyn_busattachment bus, const(byte)** mandatoryInterfaces, ulong numMandatoryInterfaces);
void alljoyn_observer_destroy(alljoyn_observer observer);
void alljoyn_observer_registerlistener(alljoyn_observer observer, alljoyn_observerlistener listener, int triggerOnExisting);
void alljoyn_observer_unregisterlistener(alljoyn_observer observer, alljoyn_observerlistener listener);
void alljoyn_observer_unregisteralllisteners(alljoyn_observer observer);
alljoyn_proxybusobject_ref alljoyn_observer_get(alljoyn_observer observer, const(char)* uniqueBusName, const(char)* objectPath);
alljoyn_proxybusobject_ref alljoyn_observer_getfirst(alljoyn_observer observer);
alljoyn_proxybusobject_ref alljoyn_observer_getnext(alljoyn_observer observer, alljoyn_proxybusobject_ref proxyref);
QStatus alljoyn_passwordmanager_setcredentials(const(char)* authMechanism, const(char)* password);
ushort alljoyn_securityapplicationproxy_getpermissionmanagementsessionport();
alljoyn_securityapplicationproxy alljoyn_securityapplicationproxy_create(alljoyn_busattachment bus, byte* appBusName, uint sessionId);
void alljoyn_securityapplicationproxy_destroy(alljoyn_securityapplicationproxy proxy);
QStatus alljoyn_securityapplicationproxy_claim(alljoyn_securityapplicationproxy proxy, byte* caKey, byte* identityCertificateChain, const(ubyte)* groupId, ulong groupSize, byte* groupAuthority, byte** manifestsXmls, ulong manifestsCount);
QStatus alljoyn_securityapplicationproxy_getmanifesttemplate(alljoyn_securityapplicationproxy proxy, byte** manifestTemplateXml);
void alljoyn_securityapplicationproxy_manifesttemplate_destroy(byte* manifestTemplateXml);
QStatus alljoyn_securityapplicationproxy_getapplicationstate(alljoyn_securityapplicationproxy proxy, alljoyn_applicationstate* applicationState);
QStatus alljoyn_securityapplicationproxy_getclaimcapabilities(alljoyn_securityapplicationproxy proxy, ushort* capabilities);
QStatus alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo(alljoyn_securityapplicationproxy proxy, ushort* additionalInfo);
QStatus alljoyn_securityapplicationproxy_getpolicy(alljoyn_securityapplicationproxy proxy, byte** policyXml);
QStatus alljoyn_securityapplicationproxy_getdefaultpolicy(alljoyn_securityapplicationproxy proxy, byte** policyXml);
void alljoyn_securityapplicationproxy_policy_destroy(byte* policyXml);
QStatus alljoyn_securityapplicationproxy_updatepolicy(alljoyn_securityapplicationproxy proxy, byte* policyXml);
QStatus alljoyn_securityapplicationproxy_updateidentity(alljoyn_securityapplicationproxy proxy, byte* identityCertificateChain, byte** manifestsXmls, ulong manifestsCount);
QStatus alljoyn_securityapplicationproxy_installmembership(alljoyn_securityapplicationproxy proxy, byte* membershipCertificateChain);
QStatus alljoyn_securityapplicationproxy_reset(alljoyn_securityapplicationproxy proxy);
QStatus alljoyn_securityapplicationproxy_resetpolicy(alljoyn_securityapplicationproxy proxy);
QStatus alljoyn_securityapplicationproxy_startmanagement(alljoyn_securityapplicationproxy proxy);
QStatus alljoyn_securityapplicationproxy_endmanagement(alljoyn_securityapplicationproxy proxy);
QStatus alljoyn_securityapplicationproxy_geteccpublickey(alljoyn_securityapplicationproxy proxy, byte** eccPublicKey);
void alljoyn_securityapplicationproxy_eccpublickey_destroy(byte* eccPublicKey);
QStatus alljoyn_securityapplicationproxy_signmanifest(byte* unsignedManifestXml, byte* identityCertificatePem, byte* signingPrivateKeyPem, byte** signedManifestXml);
void alljoyn_securityapplicationproxy_manifest_destroy(byte* signedManifestXml);
QStatus alljoyn_securityapplicationproxy_computemanifestdigest(byte* unsignedManifestXml, byte* identityCertificatePem, ubyte** digest, ulong* digestSize);
void alljoyn_securityapplicationproxy_digest_destroy(ubyte* digest);
QStatus alljoyn_securityapplicationproxy_setmanifestsignature(byte* unsignedManifestXml, byte* identityCertificatePem, const(ubyte)* signature, ulong signatureSize, byte** signedManifestXml);
enum QCC_TRUE = 0x00000001;
enum QCC_FALSE = 0x00000000;
enum ALLJOYN_MESSAGE_FLAG_NO_REPLY_EXPECTED = 0x00000001;
enum ALLJOYN_MESSAGE_FLAG_AUTO_START = 0x00000002;
enum ALLJOYN_MESSAGE_FLAG_ALLOW_REMOTE_MSG = 0x00000004;
enum ALLJOYN_MESSAGE_FLAG_SESSIONLESS = 0x00000010;
enum ALLJOYN_MESSAGE_FLAG_GLOBAL_BROADCAST = 0x00000020;
enum ALLJOYN_MESSAGE_FLAG_ENCRYPTED = 0x00000080;
enum ALLJOYN_TRAFFIC_TYPE_MESSAGES = 0x00000001;
enum ALLJOYN_TRAFFIC_TYPE_RAW_UNRELIABLE = 0x00000002;
enum ALLJOYN_TRAFFIC_TYPE_RAW_RELIABLE = 0x00000004;
enum ALLJOYN_PROXIMITY_ANY = 0x000000ff;
enum ALLJOYN_PROXIMITY_PHYSICAL = 0x00000001;
enum ALLJOYN_PROXIMITY_NETWORK = 0x00000002;
enum ALLJOYN_NAMED_PIPE_CONNECT_SPEC = "npipe:";
enum ALLJOYN_READ_READY = 0x00000001;
enum ALLJOYN_WRITE_READY = 0x00000002;
enum ALLJOYN_DISCONNECTED = 0x00000004;
enum ALLJOYN_LITTLE_ENDIAN = 0x6c;
enum ALLJOYN_BIG_ENDIAN = 0x42;
enum ALLJOYN_MESSAGE_DEFAULT_TIMEOUT = 0x000061a8;
enum ALLJOYN_CRED_PASSWORD = 0x0001;
enum ALLJOYN_CRED_USER_NAME = 0x0002;
enum ALLJOYN_CRED_CERT_CHAIN = 0x0004;
enum ALLJOYN_CRED_PRIVATE_KEY = 0x0008;
enum ALLJOYN_CRED_LOGON_ENTRY = 0x0010;
enum ALLJOYN_CRED_EXPIRATION = 0x0020;
enum ALLJOYN_CRED_NEW_PASSWORD = 0x1001;
enum ALLJOYN_CRED_ONE_TIME_PWD = 0x2001;
enum ALLJOYN_PROP_ACCESS_READ = 0x01;
enum ALLJOYN_PROP_ACCESS_WRITE = 0x02;
enum ALLJOYN_PROP_ACCESS_RW = 0x03;
enum ALLJOYN_MEMBER_ANNOTATE_NO_REPLY = 0x01;
enum ALLJOYN_MEMBER_ANNOTATE_DEPRECATED = 0x02;
enum ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST = 0x04;
enum ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS = 0x08;
enum ALLJOYN_MEMBER_ANNOTATE_UNICAST = 0x10;
enum ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST = 0x20;
alias alljoyn_about_announceflag = int;
enum : int
{
    UNANNOUNCED = 0x00000000,
    ANNOUNCED   = 0x00000001,
}

alias QStatus = int;
enum : int
{
    ER_OK                                                               = 0x00000000,
    ER_FAIL                                                             = 0x00000001,
    ER_UTF_CONVERSION_FAILED                                            = 0x00000002,
    ER_BUFFER_TOO_SMALL                                                 = 0x00000003,
    ER_OS_ERROR                                                         = 0x00000004,
    ER_OUT_OF_MEMORY                                                    = 0x00000005,
    ER_SOCKET_BIND_ERROR                                                = 0x00000006,
    ER_INIT_FAILED                                                      = 0x00000007,
    ER_WOULDBLOCK                                                       = 0x00000008,
    ER_NOT_IMPLEMENTED                                                  = 0x00000009,
    ER_TIMEOUT                                                          = 0x0000000a,
    ER_SOCK_OTHER_END_CLOSED                                            = 0x0000000b,
    ER_BAD_ARG_1                                                        = 0x0000000c,
    ER_BAD_ARG_2                                                        = 0x0000000d,
    ER_BAD_ARG_3                                                        = 0x0000000e,
    ER_BAD_ARG_4                                                        = 0x0000000f,
    ER_BAD_ARG_5                                                        = 0x00000010,
    ER_BAD_ARG_6                                                        = 0x00000011,
    ER_BAD_ARG_7                                                        = 0x00000012,
    ER_BAD_ARG_8                                                        = 0x00000013,
    ER_INVALID_ADDRESS                                                  = 0x00000014,
    ER_INVALID_DATA                                                     = 0x00000015,
    ER_READ_ERROR                                                       = 0x00000016,
    ER_WRITE_ERROR                                                      = 0x00000017,
    ER_OPEN_FAILED                                                      = 0x00000018,
    ER_PARSE_ERROR                                                      = 0x00000019,
    ER_END_OF_DATA                                                      = 0x0000001a,
    ER_CONN_REFUSED                                                     = 0x0000001b,
    ER_BAD_ARG_COUNT                                                    = 0x0000001c,
    ER_WARNING                                                          = 0x0000001d,
    ER_EOF                                                              = 0x0000001e,
    ER_DEADLOCK                                                         = 0x0000001f,
    ER_COMMON_ERRORS                                                    = 0x00001000,
    ER_STOPPING_THREAD                                                  = 0x00001001,
    ER_ALERTED_THREAD                                                   = 0x00001002,
    ER_XML_MALFORMED                                                    = 0x00001003,
    ER_AUTH_FAIL                                                        = 0x00001004,
    ER_AUTH_USER_REJECT                                                 = 0x00001005,
    ER_NO_SUCH_ALARM                                                    = 0x00001006,
    ER_TIMER_FALLBEHIND                                                 = 0x00001007,
    ER_SSL_ERRORS                                                       = 0x00001008,
    ER_SSL_INIT                                                         = 0x00001009,
    ER_SSL_CONNECT                                                      = 0x0000100a,
    ER_SSL_VERIFY                                                       = 0x0000100b,
    ER_EXTERNAL_THREAD                                                  = 0x0000100c,
    ER_CRYPTO_ERROR                                                     = 0x0000100d,
    ER_CRYPTO_TRUNCATED                                                 = 0x0000100e,
    ER_CRYPTO_KEY_UNAVAILABLE                                           = 0x0000100f,
    ER_BAD_HOSTNAME                                                     = 0x00001010,
    ER_CRYPTO_KEY_UNUSABLE                                              = 0x00001011,
    ER_EMPTY_KEY_BLOB                                                   = 0x00001012,
    ER_CORRUPT_KEYBLOB                                                  = 0x00001013,
    ER_INVALID_KEY_ENCODING                                             = 0x00001014,
    ER_DEAD_THREAD                                                      = 0x00001015,
    ER_THREAD_RUNNING                                                   = 0x00001016,
    ER_THREAD_STOPPING                                                  = 0x00001017,
    ER_BAD_STRING_ENCODING                                              = 0x00001018,
    ER_CRYPTO_INSUFFICIENT_SECURITY                                     = 0x00001019,
    ER_CRYPTO_ILLEGAL_PARAMETERS                                        = 0x0000101a,
    ER_CRYPTO_HASH_UNINITIALIZED                                        = 0x0000101b,
    ER_THREAD_NO_WAIT                                                   = 0x0000101c,
    ER_TIMER_EXITING                                                    = 0x0000101d,
    ER_INVALID_GUID                                                     = 0x0000101e,
    ER_THREADPOOL_EXHAUSTED                                             = 0x0000101f,
    ER_THREADPOOL_STOPPING                                              = 0x00001020,
    ER_INVALID_STREAM                                                   = 0x00001021,
    ER_TIMER_FULL                                                       = 0x00001022,
    ER_IODISPATCH_STOPPING                                              = 0x00001023,
    ER_SLAP_INVALID_PACKET_LEN                                          = 0x00001024,
    ER_SLAP_HDR_CHECKSUM_ERROR                                          = 0x00001025,
    ER_SLAP_INVALID_PACKET_TYPE                                         = 0x00001026,
    ER_SLAP_LEN_MISMATCH                                                = 0x00001027,
    ER_SLAP_PACKET_TYPE_MISMATCH                                        = 0x00001028,
    ER_SLAP_CRC_ERROR                                                   = 0x00001029,
    ER_SLAP_ERROR                                                       = 0x0000102a,
    ER_SLAP_OTHER_END_CLOSED                                            = 0x0000102b,
    ER_TIMER_NOT_ALLOWED                                                = 0x0000102c,
    ER_NOT_CONN                                                         = 0x0000102d,
    ER_XML_CONVERTER_ERROR                                              = 0x00002000,
    ER_XML_INVALID_RULES_COUNT                                          = 0x00002001,
    ER_XML_INTERFACE_MEMBERS_MISSING                                    = 0x00002002,
    ER_XML_INVALID_MEMBER_TYPE                                          = 0x00002003,
    ER_XML_INVALID_MEMBER_ACTION                                        = 0x00002004,
    ER_XML_MEMBER_DENY_ACTION_WITH_OTHER                                = 0x00002005,
    ER_XML_INVALID_ANNOTATIONS_COUNT                                    = 0x00002006,
    ER_XML_INVALID_ELEMENT_NAME                                         = 0x00002007,
    ER_XML_INVALID_ATTRIBUTE_VALUE                                      = 0x00002008,
    ER_XML_INVALID_SECURITY_LEVEL_ANNOTATION_VALUE                      = 0x00002009,
    ER_XML_INVALID_ELEMENT_CHILDREN_COUNT                               = 0x0000200a,
    ER_XML_INVALID_POLICY_VERSION                                       = 0x0000200b,
    ER_XML_INVALID_POLICY_SERIAL_NUMBER                                 = 0x0000200c,
    ER_XML_INVALID_ACL_PEER_TYPE                                        = 0x0000200d,
    ER_XML_INVALID_ACL_PEER_CHILDREN_COUNT                              = 0x0000200e,
    ER_XML_ACL_ALL_TYPE_PEER_WITH_OTHERS                                = 0x0000200f,
    ER_XML_INVALID_ACL_PEER_PUBLIC_KEY                                  = 0x00002010,
    ER_XML_ACL_PEER_NOT_UNIQUE                                          = 0x00002011,
    ER_XML_ACL_PEER_PUBLIC_KEY_SET                                      = 0x00002012,
    ER_XML_ACLS_MISSING                                                 = 0x00002013,
    ER_XML_ACL_PEERS_MISSING                                            = 0x00002014,
    ER_XML_INVALID_OBJECT_PATH                                          = 0x00002015,
    ER_XML_INVALID_INTERFACE_NAME                                       = 0x00002016,
    ER_XML_INVALID_MEMBER_NAME                                          = 0x00002017,
    ER_XML_INVALID_MANIFEST_VERSION                                     = 0x00002018,
    ER_XML_INVALID_OID                                                  = 0x00002019,
    ER_XML_INVALID_BASE64                                               = 0x0000201a,
    ER_XML_INTERFACE_NAME_NOT_UNIQUE                                    = 0x0000201b,
    ER_XML_MEMBER_NAME_NOT_UNIQUE                                       = 0x0000201c,
    ER_XML_OBJECT_PATH_NOT_UNIQUE                                       = 0x0000201d,
    ER_XML_ANNOTATION_NOT_UNIQUE                                        = 0x0000201e,
    ER_NONE                                                             = 0x0000ffff,
    ER_BUS_ERRORS                                                       = 0x00009000,
    ER_BUS_READ_ERROR                                                   = 0x00009001,
    ER_BUS_WRITE_ERROR                                                  = 0x00009002,
    ER_BUS_BAD_VALUE_TYPE                                               = 0x00009003,
    ER_BUS_BAD_HEADER_FIELD                                             = 0x00009004,
    ER_BUS_BAD_SIGNATURE                                                = 0x00009005,
    ER_BUS_BAD_OBJ_PATH                                                 = 0x00009006,
    ER_BUS_BAD_MEMBER_NAME                                              = 0x00009007,
    ER_BUS_BAD_INTERFACE_NAME                                           = 0x00009008,
    ER_BUS_BAD_ERROR_NAME                                               = 0x00009009,
    ER_BUS_BAD_BUS_NAME                                                 = 0x0000900a,
    ER_BUS_NAME_TOO_LONG                                                = 0x0000900b,
    ER_BUS_BAD_LENGTH                                                   = 0x0000900c,
    ER_BUS_BAD_VALUE                                                    = 0x0000900d,
    ER_BUS_BAD_HDR_FLAGS                                                = 0x0000900e,
    ER_BUS_BAD_BODY_LEN                                                 = 0x0000900f,
    ER_BUS_BAD_HEADER_LEN                                               = 0x00009010,
    ER_BUS_UNKNOWN_SERIAL                                               = 0x00009011,
    ER_BUS_UNKNOWN_PATH                                                 = 0x00009012,
    ER_BUS_UNKNOWN_INTERFACE                                            = 0x00009013,
    ER_BUS_ESTABLISH_FAILED                                             = 0x00009014,
    ER_BUS_UNEXPECTED_SIGNATURE                                         = 0x00009015,
    ER_BUS_INTERFACE_MISSING                                            = 0x00009016,
    ER_BUS_PATH_MISSING                                                 = 0x00009017,
    ER_BUS_MEMBER_MISSING                                               = 0x00009018,
    ER_BUS_REPLY_SERIAL_MISSING                                         = 0x00009019,
    ER_BUS_ERROR_NAME_MISSING                                           = 0x0000901a,
    ER_BUS_INTERFACE_NO_SUCH_MEMBER                                     = 0x0000901b,
    ER_BUS_NO_SUCH_OBJECT                                               = 0x0000901c,
    ER_BUS_OBJECT_NO_SUCH_MEMBER                                        = 0x0000901d,
    ER_BUS_OBJECT_NO_SUCH_INTERFACE                                     = 0x0000901e,
    ER_BUS_NO_SUCH_INTERFACE                                            = 0x0000901f,
    ER_BUS_MEMBER_NO_SUCH_SIGNATURE                                     = 0x00009020,
    ER_BUS_NOT_NUL_TERMINATED                                           = 0x00009021,
    ER_BUS_NO_SUCH_PROPERTY                                             = 0x00009022,
    ER_BUS_SET_WRONG_SIGNATURE                                          = 0x00009023,
    ER_BUS_PROPERTY_VALUE_NOT_SET                                       = 0x00009024,
    ER_BUS_PROPERTY_ACCESS_DENIED                                       = 0x00009025,
    ER_BUS_NO_TRANSPORTS                                                = 0x00009026,
    ER_BUS_BAD_TRANSPORT_ARGS                                           = 0x00009027,
    ER_BUS_NO_ROUTE                                                     = 0x00009028,
    ER_BUS_NO_ENDPOINT                                                  = 0x00009029,
    ER_BUS_BAD_SEND_PARAMETER                                           = 0x0000902a,
    ER_BUS_UNMATCHED_REPLY_SERIAL                                       = 0x0000902b,
    ER_BUS_BAD_SENDER_ID                                                = 0x0000902c,
    ER_BUS_TRANSPORT_NOT_STARTED                                        = 0x0000902d,
    ER_BUS_EMPTY_MESSAGE                                                = 0x0000902e,
    ER_BUS_NOT_OWNER                                                    = 0x0000902f,
    ER_BUS_SET_PROPERTY_REJECTED                                        = 0x00009030,
    ER_BUS_CONNECT_FAILED                                               = 0x00009031,
    ER_BUS_REPLY_IS_ERROR_MESSAGE                                       = 0x00009032,
    ER_BUS_NOT_AUTHENTICATING                                           = 0x00009033,
    ER_BUS_NO_LISTENER                                                  = 0x00009034,
    ER_BUS_NOT_ALLOWED                                                  = 0x00009036,
    ER_BUS_WRITE_QUEUE_FULL                                             = 0x00009037,
    ER_BUS_ENDPOINT_CLOSING                                             = 0x00009038,
    ER_BUS_INTERFACE_MISMATCH                                           = 0x00009039,
    ER_BUS_MEMBER_ALREADY_EXISTS                                        = 0x0000903a,
    ER_BUS_PROPERTY_ALREADY_EXISTS                                      = 0x0000903b,
    ER_BUS_IFACE_ALREADY_EXISTS                                         = 0x0000903c,
    ER_BUS_ERROR_RESPONSE                                               = 0x0000903d,
    ER_BUS_BAD_XML                                                      = 0x0000903e,
    ER_BUS_BAD_CHILD_PATH                                               = 0x0000903f,
    ER_BUS_OBJ_ALREADY_EXISTS                                           = 0x00009040,
    ER_BUS_OBJ_NOT_FOUND                                                = 0x00009041,
    ER_BUS_CANNOT_EXPAND_MESSAGE                                        = 0x00009042,
    ER_BUS_NOT_COMPRESSED                                               = 0x00009043,
    ER_BUS_ALREADY_CONNECTED                                            = 0x00009044,
    ER_BUS_NOT_CONNECTED                                                = 0x00009045,
    ER_BUS_ALREADY_LISTENING                                            = 0x00009046,
    ER_BUS_KEY_UNAVAILABLE                                              = 0x00009047,
    ER_BUS_TRUNCATED                                                    = 0x00009048,
    ER_BUS_KEY_STORE_NOT_LOADED                                         = 0x00009049,
    ER_BUS_NO_AUTHENTICATION_MECHANISM                                  = 0x0000904a,
    ER_BUS_BUS_ALREADY_STARTED                                          = 0x0000904b,
    ER_BUS_BUS_NOT_STARTED                                              = 0x0000904c,
    ER_BUS_KEYBLOB_OP_INVALID                                           = 0x0000904d,
    ER_BUS_INVALID_HEADER_CHECKSUM                                      = 0x0000904e,
    ER_BUS_MESSAGE_NOT_ENCRYPTED                                        = 0x0000904f,
    ER_BUS_INVALID_HEADER_SERIAL                                        = 0x00009050,
    ER_BUS_TIME_TO_LIVE_EXPIRED                                         = 0x00009051,
    ER_BUS_HDR_EXPANSION_INVALID                                        = 0x00009052,
    ER_BUS_MISSING_COMPRESSION_TOKEN                                    = 0x00009053,
    ER_BUS_NO_PEER_GUID                                                 = 0x00009054,
    ER_BUS_MESSAGE_DECRYPTION_FAILED                                    = 0x00009055,
    ER_BUS_SECURITY_FATAL                                               = 0x00009056,
    ER_BUS_KEY_EXPIRED                                                  = 0x00009057,
    ER_BUS_CORRUPT_KEYSTORE                                             = 0x00009058,
    ER_BUS_NO_CALL_FOR_REPLY                                            = 0x00009059,
    ER_BUS_NOT_A_COMPLETE_TYPE                                          = 0x0000905a,
    ER_BUS_POLICY_VIOLATION                                             = 0x0000905b,
    ER_BUS_NO_SUCH_SERVICE                                              = 0x0000905c,
    ER_BUS_TRANSPORT_NOT_AVAILABLE                                      = 0x0000905d,
    ER_BUS_INVALID_AUTH_MECHANISM                                       = 0x0000905e,
    ER_BUS_KEYSTORE_VERSION_MISMATCH                                    = 0x0000905f,
    ER_BUS_BLOCKING_CALL_NOT_ALLOWED                                    = 0x00009060,
    ER_BUS_SIGNATURE_MISMATCH                                           = 0x00009061,
    ER_BUS_STOPPING                                                     = 0x00009062,
    ER_BUS_METHOD_CALL_ABORTED                                          = 0x00009063,
    ER_BUS_CANNOT_ADD_INTERFACE                                         = 0x00009064,
    ER_BUS_CANNOT_ADD_HANDLER                                           = 0x00009065,
    ER_BUS_KEYSTORE_NOT_LOADED                                          = 0x00009066,
    ER_BUS_NO_SUCH_HANDLE                                               = 0x0000906b,
    ER_BUS_HANDLES_NOT_ENABLED                                          = 0x0000906c,
    ER_BUS_HANDLES_MISMATCH                                             = 0x0000906d,
    ER_BUS_NO_SESSION                                                   = 0x0000906f,
    ER_BUS_ELEMENT_NOT_FOUND                                            = 0x00009070,
    ER_BUS_NOT_A_DICTIONARY                                             = 0x00009071,
    ER_BUS_WAIT_FAILED                                                  = 0x00009072,
    ER_BUS_BAD_SESSION_OPTS                                             = 0x00009074,
    ER_BUS_CONNECTION_REJECTED                                          = 0x00009075,
    ER_DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER                            = 0x00009076,
    ER_DBUS_REQUEST_NAME_REPLY_IN_QUEUE                                 = 0x00009077,
    ER_DBUS_REQUEST_NAME_REPLY_EXISTS                                   = 0x00009078,
    ER_DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER                            = 0x00009079,
    ER_DBUS_RELEASE_NAME_REPLY_RELEASED                                 = 0x0000907a,
    ER_DBUS_RELEASE_NAME_REPLY_NON_EXISTENT                             = 0x0000907b,
    ER_DBUS_RELEASE_NAME_REPLY_NOT_OWNER                                = 0x0000907c,
    ER_DBUS_START_REPLY_ALREADY_RUNNING                                 = 0x0000907e,
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_ALREADY_EXISTS                     = 0x00009080,
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_FAILED                             = 0x00009081,
    ER_ALLJOYN_JOINSESSION_REPLY_NO_SESSION                             = 0x00009083,
    ER_ALLJOYN_JOINSESSION_REPLY_UNREACHABLE                            = 0x00009084,
    ER_ALLJOYN_JOINSESSION_REPLY_CONNECT_FAILED                         = 0x00009085,
    ER_ALLJOYN_JOINSESSION_REPLY_REJECTED                               = 0x00009086,
    ER_ALLJOYN_JOINSESSION_REPLY_BAD_SESSION_OPTS                       = 0x00009087,
    ER_ALLJOYN_JOINSESSION_REPLY_FAILED                                 = 0x00009088,
    ER_ALLJOYN_LEAVESESSION_REPLY_NO_SESSION                            = 0x0000908a,
    ER_ALLJOYN_LEAVESESSION_REPLY_FAILED                                = 0x0000908b,
    ER_ALLJOYN_ADVERTISENAME_REPLY_TRANSPORT_NOT_AVAILABLE              = 0x0000908c,
    ER_ALLJOYN_ADVERTISENAME_REPLY_ALREADY_ADVERTISING                  = 0x0000908d,
    ER_ALLJOYN_ADVERTISENAME_REPLY_FAILED                               = 0x0000908e,
    ER_ALLJOYN_CANCELADVERTISENAME_REPLY_FAILED                         = 0x00009090,
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_TRANSPORT_NOT_AVAILABLE         = 0x00009091,
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_ALREADY_DISCOVERING             = 0x00009092,
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_FAILED                          = 0x00009093,
    ER_ALLJOYN_CANCELFINDADVERTISEDNAME_REPLY_FAILED                    = 0x00009095,
    ER_BUS_UNEXPECTED_DISPOSITION                                       = 0x00009096,
    ER_BUS_INTERFACE_ACTIVATED                                          = 0x00009097,
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_BAD_PORT                         = 0x00009098,
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_FAILED                           = 0x00009099,
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_INVALID_OPTS                       = 0x0000909a,
    ER_ALLJOYN_JOINSESSION_REPLY_ALREADY_JOINED                         = 0x0000909b,
    ER_BUS_SELF_CONNECT                                                 = 0x0000909c,
    ER_BUS_SECURITY_NOT_ENABLED                                         = 0x0000909d,
    ER_BUS_LISTENER_ALREADY_SET                                         = 0x0000909e,
    ER_BUS_PEER_AUTH_VERSION_MISMATCH                                   = 0x0000909f,
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NOT_SUPPORTED                       = 0x000090a0,
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NO_DEST_SUPPORT                     = 0x000090a1,
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_FAILED                              = 0x000090a2,
    ER_ALLJOYN_ACCESS_PERMISSION_WARNING                                = 0x000090a3,
    ER_ALLJOYN_ACCESS_PERMISSION_ERROR                                  = 0x000090a4,
    ER_BUS_DESTINATION_NOT_AUTHENTICATED                                = 0x000090a5,
    ER_BUS_ENDPOINT_REDIRECTED                                          = 0x000090a6,
    ER_BUS_AUTHENTICATION_PENDING                                       = 0x000090a7,
    ER_BUS_NOT_AUTHORIZED                                               = 0x000090a8,
    ER_PACKET_BUS_NO_SUCH_CHANNEL                                       = 0x000090a9,
    ER_PACKET_BAD_FORMAT                                                = 0x000090aa,
    ER_PACKET_CONNECT_TIMEOUT                                           = 0x000090ab,
    ER_PACKET_CHANNEL_FAIL                                              = 0x000090ac,
    ER_PACKET_TOO_LARGE                                                 = 0x000090ad,
    ER_PACKET_BAD_PARAMETER                                             = 0x000090ae,
    ER_PACKET_BAD_CRC                                                   = 0x000090af,
    ER_RENDEZVOUS_SERVER_DEACTIVATED_USER                               = 0x000090cb,
    ER_RENDEZVOUS_SERVER_UNKNOWN_USER                                   = 0x000090cc,
    ER_UNABLE_TO_CONNECT_TO_RENDEZVOUS_SERVER                           = 0x000090cd,
    ER_NOT_CONNECTED_TO_RENDEZVOUS_SERVER                               = 0x000090ce,
    ER_UNABLE_TO_SEND_MESSAGE_TO_RENDEZVOUS_SERVER                      = 0x000090cf,
    ER_INVALID_RENDEZVOUS_SERVER_INTERFACE_MESSAGE                      = 0x000090d0,
    ER_INVALID_PERSISTENT_CONNECTION_MESSAGE_RESPONSE                   = 0x000090d1,
    ER_INVALID_ON_DEMAND_CONNECTION_MESSAGE_RESPONSE                    = 0x000090d2,
    ER_INVALID_HTTP_METHOD_USED_FOR_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 0x000090d3,
    ER_RENDEZVOUS_SERVER_ERR500_INTERNAL_ERROR                          = 0x000090d4,
    ER_RENDEZVOUS_SERVER_ERR503_STATUS_UNAVAILABLE                      = 0x000090d5,
    ER_RENDEZVOUS_SERVER_ERR401_UNAUTHORIZED_REQUEST                    = 0x000090d6,
    ER_RENDEZVOUS_SERVER_UNRECOVERABLE_ERROR                            = 0x000090d7,
    ER_RENDEZVOUS_SERVER_ROOT_CERTIFICATE_UNINITIALIZED                 = 0x000090d8,
    ER_BUS_NO_SUCH_ANNOTATION                                           = 0x000090d9,
    ER_BUS_ANNOTATION_ALREADY_EXISTS                                    = 0x000090da,
    ER_SOCK_CLOSING                                                     = 0x000090db,
    ER_NO_SUCH_DEVICE                                                   = 0x000090dc,
    ER_P2P                                                              = 0x000090dd,
    ER_P2P_TIMEOUT                                                      = 0x000090de,
    ER_P2P_NOT_CONNECTED                                                = 0x000090df,
    ER_BAD_TRANSPORT_MASK                                               = 0x000090e0,
    ER_PROXIMITY_CONNECTION_ESTABLISH_FAIL                              = 0x000090e1,
    ER_PROXIMITY_NO_PEERS_FOUND                                         = 0x000090e2,
    ER_BUS_OBJECT_NOT_REGISTERED                                        = 0x000090e3,
    ER_P2P_DISABLED                                                     = 0x000090e4,
    ER_P2P_BUSY                                                         = 0x000090e5,
    ER_BUS_INCOMPATIBLE_DAEMON                                          = 0x000090e6,
    ER_P2P_NO_GO                                                        = 0x000090e7,
    ER_P2P_NO_STA                                                       = 0x000090e8,
    ER_P2P_FORBIDDEN                                                    = 0x000090e9,
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_FAILED                                = 0x000090ea,
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_UNSUPPORTED                           = 0x000090eb,
    ER_ALLJOYN_ONAPPRESUME_REPLY_FAILED                                 = 0x000090ec,
    ER_ALLJOYN_ONAPPRESUME_REPLY_UNSUPPORTED                            = 0x000090ed,
    ER_BUS_NO_SUCH_MESSAGE                                              = 0x000090ee,
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_NO_SESSION                     = 0x000090ef,
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_BINDER                           = 0x000090f0,
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_MULTIPOINT                       = 0x000090f1,
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_FOUND                            = 0x000090f2,
    ER_ALLJOYN_REMOVESESSIONMEMBER_INCOMPATIBLE_REMOTE_DAEMON           = 0x000090f3,
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_FAILED                         = 0x000090f4,
    ER_BUS_REMOVED_BY_BINDER                                            = 0x000090f5,
    ER_BUS_MATCH_RULE_NOT_FOUND                                         = 0x000090f6,
    ER_ALLJOYN_PING_FAILED                                              = 0x000090f7,
    ER_ALLJOYN_PING_REPLY_UNREACHABLE                                   = 0x000090f8,
    ER_UDP_MSG_TOO_LONG                                                 = 0x000090f9,
    ER_UDP_DEMUX_NO_ENDPOINT                                            = 0x000090fa,
    ER_UDP_NO_NETWORK                                                   = 0x000090fb,
    ER_UDP_UNEXPECTED_LENGTH                                            = 0x000090fc,
    ER_UDP_UNEXPECTED_FLOW                                              = 0x000090fd,
    ER_UDP_DISCONNECT                                                   = 0x000090fe,
    ER_UDP_NOT_IMPLEMENTED                                              = 0x000090ff,
    ER_UDP_NO_LISTENER                                                  = 0x00009100,
    ER_UDP_STOPPING                                                     = 0x00009101,
    ER_ARDP_BACKPRESSURE                                                = 0x00009102,
    ER_UDP_BACKPRESSURE                                                 = 0x00009103,
    ER_ARDP_INVALID_STATE                                               = 0x00009104,
    ER_ARDP_TTL_EXPIRED                                                 = 0x00009105,
    ER_ARDP_PERSIST_TIMEOUT                                             = 0x00009106,
    ER_ARDP_PROBE_TIMEOUT                                               = 0x00009107,
    ER_ARDP_REMOTE_CONNECTION_RESET                                     = 0x00009108,
    ER_UDP_BUSHELLO                                                     = 0x00009109,
    ER_UDP_MESSAGE                                                      = 0x0000910a,
    ER_UDP_INVALID                                                      = 0x0000910b,
    ER_UDP_UNSUPPORTED                                                  = 0x0000910c,
    ER_UDP_ENDPOINT_STALLED                                             = 0x0000910d,
    ER_ARDP_INVALID_RESPONSE                                            = 0x0000910e,
    ER_ARDP_INVALID_CONNECTION                                          = 0x0000910f,
    ER_UDP_LOCAL_DISCONNECT                                             = 0x00009110,
    ER_UDP_EARLY_EXIT                                                   = 0x00009111,
    ER_UDP_LOCAL_DISCONNECT_FAIL                                        = 0x00009112,
    ER_ARDP_DISCONNECTING                                               = 0x00009113,
    ER_ALLJOYN_PING_REPLY_INCOMPATIBLE_REMOTE_ROUTING_NODE              = 0x00009114,
    ER_ALLJOYN_PING_REPLY_TIMEOUT                                       = 0x00009115,
    ER_ALLJOYN_PING_REPLY_UNKNOWN_NAME                                  = 0x00009116,
    ER_ALLJOYN_PING_REPLY_FAILED                                        = 0x00009117,
    ER_TCP_MAX_UNTRUSTED                                                = 0x00009118,
    ER_ALLJOYN_PING_REPLY_IN_PROGRESS                                   = 0x00009119,
    ER_LANGUAGE_NOT_SUPPORTED                                           = 0x0000911a,
    ER_ABOUT_FIELD_ALREADY_SPECIFIED                                    = 0x0000911b,
    ER_UDP_NOT_DISCONNECTED                                             = 0x0000911c,
    ER_UDP_ENDPOINT_NOT_STARTED                                         = 0x0000911d,
    ER_UDP_ENDPOINT_REMOVED                                             = 0x0000911e,
    ER_ARDP_VERSION_NOT_SUPPORTED                                       = 0x0000911f,
    ER_CONNECTION_LIMIT_EXCEEDED                                        = 0x00009120,
    ER_ARDP_WRITE_BLOCKED                                               = 0x00009121,
    ER_PERMISSION_DENIED                                                = 0x00009122,
    ER_ABOUT_DEFAULT_LANGUAGE_NOT_SPECIFIED                             = 0x00009123,
    ER_ABOUT_SESSIONPORT_NOT_BOUND                                      = 0x00009124,
    ER_ABOUT_ABOUTDATA_MISSING_REQUIRED_FIELD                           = 0x00009125,
    ER_ABOUT_INVALID_ABOUTDATA_LISTENER                                 = 0x00009126,
    ER_BUS_PING_GROUP_NOT_FOUND                                         = 0x00009127,
    ER_BUS_REMOVED_BY_BINDER_SELF                                       = 0x00009128,
    ER_INVALID_CONFIG                                                   = 0x00009129,
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_VALUE                              = 0x0000912a,
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_APPID_SIZE                         = 0x0000912b,
    ER_BUS_TRANSPORT_ACCESS_DENIED                                      = 0x0000912c,
    ER_INVALID_CERTIFICATE                                              = 0x0000912d,
    ER_CERTIFICATE_NOT_FOUND                                            = 0x0000912e,
    ER_DUPLICATE_CERTIFICATE                                            = 0x0000912f,
    ER_UNKNOWN_CERTIFICATE                                              = 0x00009130,
    ER_MISSING_DIGEST_IN_CERTIFICATE                                    = 0x00009131,
    ER_DIGEST_MISMATCH                                                  = 0x00009132,
    ER_DUPLICATE_KEY                                                    = 0x00009133,
    ER_NO_COMMON_TRUST                                                  = 0x00009134,
    ER_MANIFEST_NOT_FOUND                                               = 0x00009135,
    ER_INVALID_CERT_CHAIN                                               = 0x00009136,
    ER_NO_TRUST_ANCHOR                                                  = 0x00009137,
    ER_INVALID_APPLICATION_STATE                                        = 0x00009138,
    ER_FEATURE_NOT_AVAILABLE                                            = 0x00009139,
    ER_KEY_STORE_ALREADY_INITIALIZED                                    = 0x0000913a,
    ER_KEY_STORE_ID_NOT_YET_SET                                         = 0x0000913b,
    ER_POLICY_NOT_NEWER                                                 = 0x0000913c,
    ER_MANIFEST_REJECTED                                                = 0x0000913d,
    ER_INVALID_CERTIFICATE_USAGE                                        = 0x0000913e,
    ER_INVALID_SIGNAL_EMISSION_TYPE                                     = 0x0000913f,
    ER_APPLICATION_STATE_LISTENER_ALREADY_EXISTS                        = 0x00009140,
    ER_APPLICATION_STATE_LISTENER_NO_SUCH_LISTENER                      = 0x00009141,
    ER_MANAGEMENT_ALREADY_STARTED                                       = 0x00009142,
    ER_MANAGEMENT_NOT_STARTED                                           = 0x00009143,
    ER_BUS_DESCRIPTION_ALREADY_EXISTS                                   = 0x00009144,
}

alias alljoyn_typeid = int;
enum : int
{
    ALLJOYN_INVALID          = 0x00000000,
    ALLJOYN_ARRAY            = 0x00000061,
    ALLJOYN_BOOLEAN          = 0x00000062,
    ALLJOYN_DOUBLE           = 0x00000064,
    ALLJOYN_DICT_ENTRY       = 0x00000065,
    ALLJOYN_SIGNATURE        = 0x00000067,
    ALLJOYN_HANDLE           = 0x00000068,
    ALLJOYN_INT32            = 0x00000069,
    ALLJOYN_INT16            = 0x0000006e,
    ALLJOYN_OBJECT_PATH      = 0x0000006f,
    ALLJOYN_UINT16           = 0x00000071,
    ALLJOYN_STRUCT           = 0x00000072,
    ALLJOYN_STRING           = 0x00000073,
    ALLJOYN_UINT64           = 0x00000074,
    ALLJOYN_UINT32           = 0x00000075,
    ALLJOYN_VARIANT          = 0x00000076,
    ALLJOYN_INT64            = 0x00000078,
    ALLJOYN_BYTE             = 0x00000079,
    ALLJOYN_STRUCT_OPEN      = 0x00000028,
    ALLJOYN_STRUCT_CLOSE     = 0x00000029,
    ALLJOYN_DICT_ENTRY_OPEN  = 0x0000007b,
    ALLJOYN_DICT_ENTRY_CLOSE = 0x0000007d,
    ALLJOYN_BOOLEAN_ARRAY    = 0x00006261,
    ALLJOYN_DOUBLE_ARRAY     = 0x00006461,
    ALLJOYN_INT32_ARRAY      = 0x00006961,
    ALLJOYN_INT16_ARRAY      = 0x00006e61,
    ALLJOYN_UINT16_ARRAY     = 0x00007161,
    ALLJOYN_UINT64_ARRAY     = 0x00007461,
    ALLJOYN_UINT32_ARRAY     = 0x00007561,
    ALLJOYN_INT64_ARRAY      = 0x00007861,
    ALLJOYN_BYTE_ARRAY       = 0x00007961,
    ALLJOYN_WILDCARD         = 0x0000002a,
}

alias alljoyn_applicationstate = int;
enum : int
{
    NOT_CLAIMABLE = 0x00000000,
    CLAIMABLE     = 0x00000001,
    CLAIMED       = 0x00000002,
    NEED_UPDATE   = 0x00000003,
}

alias alljoyn_claimcapability_masks = int;
enum : int
{
    CAPABLE_ECDHE_NULL  = 0x00000001,
    CAPABLE_ECDHE_ECDSA = 0x00000004,
    CAPABLE_ECDHE_SPEKE = 0x00000008,
}

alias alljoyn_claimcapabilityadditionalinfo_masks = int;
enum : int
{
    PASSWORD_GENERATED_BY_SECURITY_MANAGER = 0x00000001,
    PASSWORD_GENERATED_BY_APPLICATION      = 0x00000002,
}

struct alljoyn_certificateid
{
    ubyte* serial;
    ulong serialLen;
    byte* issuerPublicKey;
    ubyte* issuerAki;
    ulong issuerAkiLen;
}
struct alljoyn_certificateidarray
{
    ulong count;
    alljoyn_certificateid* ids;
}
struct alljoyn_manifestarray
{
    ulong count;
    byte** xmls;
}
alias alljoyn_applicationstatelistener_state_ptr = void function(byte* busName, byte* publicKey, alljoyn_applicationstate applicationState, void* context);
struct alljoyn_applicationstatelistener_callbacks
{
    alljoyn_applicationstatelistener_state_ptr state;
}
alias alljoyn_keystorelistener_loadrequest_ptr = QStatus function(const(void)* context, alljoyn_keystorelistener listener, alljoyn_keystore keyStore);
alias alljoyn_keystorelistener_storerequest_ptr = QStatus function(const(void)* context, alljoyn_keystorelistener listener, alljoyn_keystore keyStore);
alias alljoyn_keystorelistener_acquireexclusivelock_ptr = QStatus function(const(void)* context, alljoyn_keystorelistener listener);
alias alljoyn_keystorelistener_releaseexclusivelock_ptr = void function(const(void)* context, alljoyn_keystorelistener listener);
struct alljoyn_keystorelistener_callbacks
{
    alljoyn_keystorelistener_loadrequest_ptr load_request;
    alljoyn_keystorelistener_storerequest_ptr store_request;
}
struct alljoyn_keystorelistener_with_synchronization_callbacks
{
    alljoyn_keystorelistener_loadrequest_ptr load_request;
    alljoyn_keystorelistener_storerequest_ptr store_request;
    alljoyn_keystorelistener_acquireexclusivelock_ptr acquire_exclusive_lock;
    alljoyn_keystorelistener_releaseexclusivelock_ptr release_exclusive_lock;
}
alias alljoyn_messagetype = int;
enum : int
{
    ALLJOYN_MESSAGE_INVALID     = 0x00000000,
    ALLJOYN_MESSAGE_METHOD_CALL = 0x00000001,
    ALLJOYN_MESSAGE_METHOD_RET  = 0x00000002,
    ALLJOYN_MESSAGE_ERROR       = 0x00000003,
    ALLJOYN_MESSAGE_SIGNAL      = 0x00000004,
}

alias alljoyn_authlistener_requestcredentials_ptr = int function(const(void)* context, const(char)* authMechanism, const(char)* peerName, ushort authCount, const(char)* userName, ushort credMask, alljoyn_credentials credentials);
alias alljoyn_authlistener_requestcredentialsasync_ptr = QStatus function(const(void)* context, alljoyn_authlistener listener, const(char)* authMechanism, const(char)* peerName, ushort authCount, const(char)* userName, ushort credMask, void* authContext);
alias alljoyn_authlistener_verifycredentials_ptr = int function(const(void)* context, const(char)* authMechanism, const(char)* peerName, const(alljoyn_credentials) credentials);
alias alljoyn_authlistener_verifycredentialsasync_ptr = QStatus function(const(void)* context, alljoyn_authlistener listener, const(char)* authMechanism, const(char)* peerName, const(alljoyn_credentials) credentials, void* authContext);
alias alljoyn_authlistener_securityviolation_ptr = void function(const(void)* context, QStatus status, const(alljoyn_message) msg);
alias alljoyn_authlistener_authenticationcomplete_ptr = void function(const(void)* context, const(char)* authMechanism, const(char)* peerName, int success);
struct alljoyn_authlistener_callbacks
{
    alljoyn_authlistener_requestcredentials_ptr request_credentials;
    alljoyn_authlistener_verifycredentials_ptr verify_credentials;
    alljoyn_authlistener_securityviolation_ptr security_violation;
    alljoyn_authlistener_authenticationcomplete_ptr authentication_complete;
}
struct alljoyn_authlistenerasync_callbacks
{
    alljoyn_authlistener_requestcredentialsasync_ptr request_credentials;
    alljoyn_authlistener_verifycredentialsasync_ptr verify_credentials;
    alljoyn_authlistener_securityviolation_ptr security_violation;
    alljoyn_authlistener_authenticationcomplete_ptr authentication_complete;
}
alias alljoyn_buslistener_listener_registered_ptr = void function(const(void)* context, alljoyn_busattachment bus);
alias alljoyn_buslistener_listener_unregistered_ptr = void function(const(void)* context);
alias alljoyn_buslistener_found_advertised_name_ptr = void function(const(void)* context, const(char)* name, ushort transport, const(char)* namePrefix);
alias alljoyn_buslistener_lost_advertised_name_ptr = void function(const(void)* context, const(char)* name, ushort transport, const(char)* namePrefix);
alias alljoyn_buslistener_name_owner_changed_ptr = void function(const(void)* context, const(char)* busName, const(char)* previousOwner, const(char)* newOwner);
alias alljoyn_buslistener_bus_stopping_ptr = void function(const(void)* context);
alias alljoyn_buslistener_bus_disconnected_ptr = void function(const(void)* context);
alias alljoyn_buslistener_bus_prop_changed_ptr = void function(const(void)* context, const(char)* prop_name, alljoyn_msgarg prop_value);
struct alljoyn_buslistener_callbacks
{
    alljoyn_buslistener_listener_registered_ptr listener_registered;
    alljoyn_buslistener_listener_unregistered_ptr listener_unregistered;
    alljoyn_buslistener_found_advertised_name_ptr found_advertised_name;
    alljoyn_buslistener_lost_advertised_name_ptr lost_advertised_name;
    alljoyn_buslistener_name_owner_changed_ptr name_owner_changed;
    alljoyn_buslistener_bus_stopping_ptr bus_stopping;
    alljoyn_buslistener_bus_disconnected_ptr bus_disconnected;
    alljoyn_buslistener_bus_prop_changed_ptr property_changed;
}
alias alljoyn_interfacedescription_securitypolicy = int;
enum : int
{
    AJ_IFC_SECURITY_INHERIT  = 0x00000000,
    AJ_IFC_SECURITY_REQUIRED = 0x00000001,
    AJ_IFC_SECURITY_OFF      = 0x00000002,
}

struct alljoyn_interfacedescription_member
{
    alljoyn_interfacedescription iface;
    alljoyn_messagetype memberType;
    const(char)* name;
    const(char)* signature;
    const(char)* returnSignature;
    const(char)* argNames;
    const(void)* internal_member;
}
alias alljoyn_interfacedescription_translation_callback_ptr = PSTR function(const(char)* sourceLanguage, const(char)* targetLanguage, const(char)* sourceText);
struct alljoyn_interfacedescription_property
{
    const(char)* name;
    const(char)* signature;
    ubyte access;
    const(void)* internal_property;
}
alias alljoyn_messagereceiver_methodhandler_ptr = void function(alljoyn_busobject bus, const(alljoyn_interfacedescription_member)* member, alljoyn_message message);
alias alljoyn_messagereceiver_replyhandler_ptr = void function(alljoyn_message message, void* context);
alias alljoyn_messagereceiver_signalhandler_ptr = void function(const(alljoyn_interfacedescription_member)* member, const(char)* srcPath, alljoyn_message message);
alias alljoyn_busobject_prop_get_ptr = QStatus function(const(void)* context, const(char)* ifcName, const(char)* propName, alljoyn_msgarg val);
alias alljoyn_busobject_prop_set_ptr = QStatus function(const(void)* context, const(char)* ifcName, const(char)* propName, alljoyn_msgarg val);
alias alljoyn_busobject_object_registration_ptr = void function(const(void)* context);
struct alljoyn_busobject_callbacks
{
    alljoyn_busobject_prop_get_ptr property_get;
    alljoyn_busobject_prop_set_ptr property_set;
    alljoyn_busobject_object_registration_ptr object_registered;
    alljoyn_busobject_object_registration_ptr object_unregistered;
}
struct alljoyn_busobject_methodentry
{
    const(alljoyn_interfacedescription_member)* member;
    alljoyn_messagereceiver_methodhandler_ptr method_handler;
}
alias alljoyn_proxybusobject_listener_introspectcb_ptr = void function(QStatus status, alljoyn_proxybusobject obj, void* context);
alias alljoyn_proxybusobject_listener_getpropertycb_ptr = void function(QStatus status, alljoyn_proxybusobject obj, const(alljoyn_msgarg) value, void* context);
alias alljoyn_proxybusobject_listener_getallpropertiescb_ptr = void function(QStatus status, alljoyn_proxybusobject obj, const(alljoyn_msgarg) values, void* context);
alias alljoyn_proxybusobject_listener_setpropertycb_ptr = void function(QStatus status, alljoyn_proxybusobject obj, void* context);
alias alljoyn_proxybusobject_listener_propertieschanged_ptr = void function(alljoyn_proxybusobject obj, const(char)* ifaceName, const(alljoyn_msgarg) changed, const(alljoyn_msgarg) invalidated, void* context);
alias alljoyn_permissionconfigurationlistener_factoryreset_ptr = QStatus function(const(void)* context);
alias alljoyn_permissionconfigurationlistener_policychanged_ptr = void function(const(void)* context);
alias alljoyn_permissionconfigurationlistener_startmanagement_ptr = void function(const(void)* context);
alias alljoyn_permissionconfigurationlistener_endmanagement_ptr = void function(const(void)* context);
struct alljoyn_permissionconfigurationlistener_callbacks
{
    alljoyn_permissionconfigurationlistener_factoryreset_ptr factory_reset;
    alljoyn_permissionconfigurationlistener_policychanged_ptr policy_changed;
    alljoyn_permissionconfigurationlistener_startmanagement_ptr start_management;
    alljoyn_permissionconfigurationlistener_endmanagement_ptr end_management;
}
alias alljoyn_sessionlostreason = int;
enum : int
{
    ALLJOYN_SESSIONLOST_INVALID                    = 0x00000000,
    ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION    = 0x00000001,
    ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY = 0x00000002,
    ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER          = 0x00000003,
    ALLJOYN_SESSIONLOST_LINK_TIMEOUT               = 0x00000004,
    ALLJOYN_SESSIONLOST_REASON_OTHER               = 0x00000005,
}

alias alljoyn_sessionlistener_sessionlost_ptr = void function(const(void)* context, uint sessionId, alljoyn_sessionlostreason reason);
alias alljoyn_sessionlistener_sessionmemberadded_ptr = void function(const(void)* context, uint sessionId, const(char)* uniqueName);
alias alljoyn_sessionlistener_sessionmemberremoved_ptr = void function(const(void)* context, uint sessionId, const(char)* uniqueName);
struct alljoyn_sessionlistener_callbacks
{
    alljoyn_sessionlistener_sessionlost_ptr session_lost;
    alljoyn_sessionlistener_sessionmemberadded_ptr session_member_added;
    alljoyn_sessionlistener_sessionmemberremoved_ptr session_member_removed;
}
alias alljoyn_sessionportlistener_acceptsessionjoiner_ptr = int function(const(void)* context, ushort sessionPort, const(char)* joiner, const(alljoyn_sessionopts) opts);
alias alljoyn_sessionportlistener_sessionjoined_ptr = void function(const(void)* context, ushort sessionPort, uint id, const(char)* joiner);
struct alljoyn_sessionportlistener_callbacks
{
    alljoyn_sessionportlistener_acceptsessionjoiner_ptr accept_session_joiner;
    alljoyn_sessionportlistener_sessionjoined_ptr session_joined;
}
alias alljoyn_about_announced_ptr = void function(const(void)* context, const(char)* busName, ushort version_, ushort port, const(alljoyn_msgarg) objectDescriptionArg, const(alljoyn_msgarg) aboutDataArg);
struct alljoyn_aboutlistener_callback
{
    alljoyn_about_announced_ptr about_listener_announced;
}
alias alljoyn_busattachment_joinsessioncb_ptr = void function(QStatus status, uint sessionId, const(alljoyn_sessionopts) opts, void* context);
alias alljoyn_busattachment_setlinktimeoutcb_ptr = void function(QStatus status, uint timeout, void* context);
alias alljoyn_aboutdatalistener_getaboutdata_ptr = QStatus function(const(void)* context, alljoyn_msgarg msgArg, const(char)* language);
alias alljoyn_aboutdatalistener_getannouncedaboutdata_ptr = QStatus function(const(void)* context, alljoyn_msgarg msgArg);
struct alljoyn_aboutdatalistener_callbacks
{
    alljoyn_aboutdatalistener_getaboutdata_ptr about_datalistener_getaboutdata;
    alljoyn_aboutdatalistener_getannouncedaboutdata_ptr about_datalistener_getannouncedaboutdata;
}
alias alljoyn_autopinger_destination_lost_ptr = void function(const(void)* context, const(char)* group, const(char)* destination);
alias alljoyn_autopinger_destination_found_ptr = void function(const(void)* context, const(char)* group, const(char)* destination);
struct alljoyn_pinglistener_callback
{
    alljoyn_autopinger_destination_found_ptr destination_found;
    alljoyn_autopinger_destination_lost_ptr destination_lost;
}
alias alljoyn_observer_object_discovered_ptr = void function(const(void)* context, alljoyn_proxybusobject_ref proxyref);
alias alljoyn_observer_object_lost_ptr = void function(const(void)* context, alljoyn_proxybusobject_ref proxyref);
struct alljoyn_observerlistener_callback
{
    alljoyn_observer_object_discovered_ptr object_discovered;
    alljoyn_observer_object_lost_ptr object_lost;
}
alias alljoyn_aboutdata = long;
alias alljoyn_aboutdatalistener = long;
alias alljoyn_abouticon = long;
alias alljoyn_abouticonobj = long;
alias alljoyn_abouticonproxy = long;
alias alljoyn_aboutlistener = long;
alias alljoyn_aboutobj = long;
alias alljoyn_aboutobjectdescription = long;
alias alljoyn_aboutproxy = long;
alias alljoyn_applicationstatelistener = long;
alias alljoyn_authlistener = long;
alias alljoyn_autopinger = long;
alias alljoyn_busattachment = long;
alias alljoyn_buslistener = long;
alias alljoyn_busobject = long;
alias alljoyn_credentials = long;
alias alljoyn_interfacedescription = long;
alias alljoyn_keystore = long;
alias alljoyn_keystorelistener = long;
alias alljoyn_message = long;
alias alljoyn_msgarg = long;
alias alljoyn_observer = long;
alias alljoyn_observerlistener = long;
alias alljoyn_permissionconfigurationlistener = long;
alias alljoyn_permissionconfigurator = long;
alias alljoyn_pinglistener = long;
alias alljoyn_proxybusobject = long;
alias alljoyn_proxybusobject_ref = long;
alias alljoyn_securityapplicationproxy = long;
alias alljoyn_sessionlistener = long;
alias alljoyn_sessionopts = long;
alias alljoyn_sessionportlistener = long;
