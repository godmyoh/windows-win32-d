module windows.win32.networking.ldap;

import windows.win32.foundation : BOOLEAN, CHAR, HANDLE, PSTR, PWSTR, WIN32_ERROR;
import windows.win32.security.authentication.identity : SecPkgContext_IssuerListInfoEx;
import windows.win32.security.cryptography : CERT_CONTEXT;

version (Windows):
extern (Windows):

LDAP* ldap_openW(const(wchar)* HostName, uint PortNumber);
LDAP* ldap_openA(const(char)* HostName, uint PortNumber);
LDAP* ldap_initW(const(wchar)* HostName, uint PortNumber);
LDAP* ldap_initA(const(char)* HostName, uint PortNumber);
LDAP* ldap_sslinitW(PWSTR HostName, uint PortNumber, int secure);
LDAP* ldap_sslinitA(PSTR HostName, uint PortNumber, int secure);
uint ldap_connect(LDAP* ld, LDAP_TIMEVAL* timeout);
LDAP* ldap_open(PSTR HostName, uint PortNumber);
LDAP* ldap_init(PSTR HostName, uint PortNumber);
LDAP* ldap_sslinit(PSTR HostName, uint PortNumber, int secure);
LDAP* cldap_openW(PWSTR HostName, uint PortNumber);
LDAP* cldap_openA(PSTR HostName, uint PortNumber);
LDAP* cldap_open(PSTR HostName, uint PortNumber);
uint ldap_unbind(LDAP* ld);
uint ldap_unbind_s(LDAP* ld);
uint ldap_get_option(LDAP* ld, int option, void* outvalue);
uint ldap_get_optionW(LDAP* ld, int option, void* outvalue);
uint ldap_set_option(LDAP* ld, int option, const(void)* invalue);
uint ldap_set_optionW(LDAP* ld, int option, const(void)* invalue);
uint ldap_simple_bindW(LDAP* ld, PWSTR dn, PWSTR passwd);
uint ldap_simple_bindA(LDAP* ld, PSTR dn, PSTR passwd);
uint ldap_simple_bind_sW(LDAP* ld, PWSTR dn, PWSTR passwd);
uint ldap_simple_bind_sA(LDAP* ld, PSTR dn, PSTR passwd);
uint ldap_bindW(LDAP* ld, PWSTR dn, PWSTR cred, uint method);
uint ldap_bindA(LDAP* ld, PSTR dn, PSTR cred, uint method);
uint ldap_bind_sW(LDAP* ld, PWSTR dn, PWSTR cred, uint method);
uint ldap_bind_sA(LDAP* ld, PSTR dn, PSTR cred, uint method);
int ldap_sasl_bindA(LDAP* ExternalHandle, const(char)* DistName, const(char)* AuthMechanism, const(LDAP_BERVAL)* cred, LDAPControlA** ServerCtrls, LDAPControlA** ClientCtrls, int* MessageNumber);
int ldap_sasl_bindW(LDAP* ExternalHandle, const(wchar)* DistName, const(wchar)* AuthMechanism, const(LDAP_BERVAL)* cred, LDAPControlW** ServerCtrls, LDAPControlW** ClientCtrls, int* MessageNumber);
int ldap_sasl_bind_sA(LDAP* ExternalHandle, const(char)* DistName, const(char)* AuthMechanism, const(LDAP_BERVAL)* cred, LDAPControlA** ServerCtrls, LDAPControlA** ClientCtrls, LDAP_BERVAL** ServerData);
int ldap_sasl_bind_sW(LDAP* ExternalHandle, const(wchar)* DistName, const(wchar)* AuthMechanism, const(LDAP_BERVAL)* cred, LDAPControlW** ServerCtrls, LDAPControlW** ClientCtrls, LDAP_BERVAL** ServerData);
uint ldap_simple_bind(LDAP* ld, const(char)* dn, const(char)* passwd);
uint ldap_simple_bind_s(LDAP* ld, const(char)* dn, const(char)* passwd);
uint ldap_bind(LDAP* ld, const(char)* dn, const(char)* cred, uint method);
uint ldap_bind_s(LDAP* ld, const(char)* dn, const(char)* cred, uint method);
uint ldap_searchW(LDAP* ld, const(wchar)* base, uint scope_, const(wchar)* filter, ushort** attrs, uint attrsonly);
uint ldap_searchA(LDAP* ld, const(char)* base, uint scope_, const(char)* filter, byte** attrs, uint attrsonly);
uint ldap_search_sW(LDAP* ld, const(wchar)* base, uint scope_, const(wchar)* filter, ushort** attrs, uint attrsonly, LDAPMessage** res);
uint ldap_search_sA(LDAP* ld, const(char)* base, uint scope_, const(char)* filter, byte** attrs, uint attrsonly, LDAPMessage** res);
uint ldap_search_stW(LDAP* ld, const(wchar)* base, uint scope_, const(wchar)* filter, ushort** attrs, uint attrsonly, LDAP_TIMEVAL* timeout, LDAPMessage** res);
uint ldap_search_stA(LDAP* ld, const(char)* base, uint scope_, const(char)* filter, byte** attrs, uint attrsonly, LDAP_TIMEVAL* timeout, LDAPMessage** res);
uint ldap_search_extW(LDAP* ld, const(wchar)* base, uint scope_, const(wchar)* filter, ushort** attrs, uint attrsonly, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint TimeLimit, uint SizeLimit, uint* MessageNumber);
uint ldap_search_extA(LDAP* ld, const(char)* base, uint scope_, const(char)* filter, byte** attrs, uint attrsonly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint TimeLimit, uint SizeLimit, uint* MessageNumber);
uint ldap_search_ext_sW(LDAP* ld, const(wchar)* base, uint scope_, const(wchar)* filter, ushort** attrs, uint attrsonly, LDAPControlW** ServerControls, LDAPControlW** ClientControls, LDAP_TIMEVAL* timeout, uint SizeLimit, LDAPMessage** res);
uint ldap_search_ext_sA(LDAP* ld, const(char)* base, uint scope_, const(char)* filter, byte** attrs, uint attrsonly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, LDAP_TIMEVAL* timeout, uint SizeLimit, LDAPMessage** res);
uint ldap_search(LDAP* ld, PSTR base, uint scope_, PSTR filter, byte** attrs, uint attrsonly);
uint ldap_search_s(LDAP* ld, PSTR base, uint scope_, PSTR filter, byte** attrs, uint attrsonly, LDAPMessage** res);
uint ldap_search_st(LDAP* ld, PSTR base, uint scope_, PSTR filter, byte** attrs, uint attrsonly, LDAP_TIMEVAL* timeout, LDAPMessage** res);
uint ldap_search_ext(LDAP* ld, PSTR base, uint scope_, PSTR filter, byte** attrs, uint attrsonly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint TimeLimit, uint SizeLimit, uint* MessageNumber);
uint ldap_search_ext_s(LDAP* ld, PSTR base, uint scope_, PSTR filter, byte** attrs, uint attrsonly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, LDAP_TIMEVAL* timeout, uint SizeLimit, LDAPMessage** res);
uint ldap_check_filterW(LDAP* ld, PWSTR SearchFilter);
uint ldap_check_filterA(LDAP* ld, PSTR SearchFilter);
uint ldap_modifyW(LDAP* ld, PWSTR dn, LDAPModW** mods);
uint ldap_modifyA(LDAP* ld, PSTR dn, LDAPModA** mods);
uint ldap_modify_sW(LDAP* ld, PWSTR dn, LDAPModW** mods);
uint ldap_modify_sA(LDAP* ld, PSTR dn, LDAPModA** mods);
uint ldap_modify_extW(LDAP* ld, const(wchar)* dn, LDAPModW** mods, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_modify_extA(LDAP* ld, const(char)* dn, LDAPModA** mods, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_modify_ext_sW(LDAP* ld, const(wchar)* dn, LDAPModW** mods, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_modify_ext_sA(LDAP* ld, const(char)* dn, LDAPModA** mods, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_modify(LDAP* ld, PSTR dn, LDAPModA** mods);
uint ldap_modify_s(LDAP* ld, PSTR dn, LDAPModA** mods);
uint ldap_modify_ext(LDAP* ld, const(char)* dn, LDAPModA** mods, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_modify_ext_s(LDAP* ld, const(char)* dn, LDAPModA** mods, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_modrdn2W(LDAP* ExternalHandle, const(wchar)* DistinguishedName, const(wchar)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdn2A(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdnW(LDAP* ExternalHandle, const(wchar)* DistinguishedName, const(wchar)* NewDistinguishedName);
uint ldap_modrdnA(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName);
uint ldap_modrdn2_sW(LDAP* ExternalHandle, const(wchar)* DistinguishedName, const(wchar)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdn2_sA(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdn_sW(LDAP* ExternalHandle, const(wchar)* DistinguishedName, const(wchar)* NewDistinguishedName);
uint ldap_modrdn_sA(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName);
uint ldap_modrdn2(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdn(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName);
uint ldap_modrdn2_s(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName, int DeleteOldRdn);
uint ldap_modrdn_s(LDAP* ExternalHandle, const(char)* DistinguishedName, const(char)* NewDistinguishedName);
uint ldap_rename_extW(LDAP* ld, const(wchar)* dn, const(wchar)* NewRDN, const(wchar)* NewParent, int DeleteOldRdn, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_rename_extA(LDAP* ld, const(char)* dn, const(char)* NewRDN, const(char)* NewParent, int DeleteOldRdn, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_rename_ext_sW(LDAP* ld, const(wchar)* dn, const(wchar)* NewRDN, const(wchar)* NewParent, int DeleteOldRdn, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_rename_ext_sA(LDAP* ld, const(char)* dn, const(char)* NewRDN, const(char)* NewParent, int DeleteOldRdn, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_rename_ext(LDAP* ld, const(char)* dn, const(char)* NewRDN, const(char)* NewParent, int DeleteOldRdn, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_rename_ext_s(LDAP* ld, const(char)* dn, const(char)* NewRDN, const(char)* NewParent, int DeleteOldRdn, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_addW(LDAP* ld, PWSTR dn, LDAPModW** attrs);
uint ldap_addA(LDAP* ld, PSTR dn, LDAPModA** attrs);
uint ldap_add_sW(LDAP* ld, PWSTR dn, LDAPModW** attrs);
uint ldap_add_sA(LDAP* ld, PSTR dn, LDAPModA** attrs);
uint ldap_add_extW(LDAP* ld, const(wchar)* dn, LDAPModW** attrs, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_add_extA(LDAP* ld, const(char)* dn, LDAPModA** attrs, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_add_ext_sW(LDAP* ld, const(wchar)* dn, LDAPModW** attrs, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_add_ext_sA(LDAP* ld, const(char)* dn, LDAPModA** attrs, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_add(LDAP* ld, PSTR dn, LDAPModA** attrs);
uint ldap_add_s(LDAP* ld, PSTR dn, LDAPModA** attrs);
uint ldap_add_ext(LDAP* ld, const(char)* dn, LDAPModA** attrs, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_add_ext_s(LDAP* ld, const(char)* dn, LDAPModA** attrs, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_compareW(LDAP* ld, const(wchar)* dn, const(wchar)* attr, PWSTR value);
uint ldap_compareA(LDAP* ld, const(char)* dn, const(char)* attr, PSTR value);
uint ldap_compare_sW(LDAP* ld, const(wchar)* dn, const(wchar)* attr, PWSTR value);
uint ldap_compare_sA(LDAP* ld, const(char)* dn, const(char)* attr, PSTR value);
uint ldap_compare(LDAP* ld, const(char)* dn, const(char)* attr, PSTR value);
uint ldap_compare_s(LDAP* ld, const(char)* dn, const(char)* attr, PSTR value);
uint ldap_compare_extW(LDAP* ld, const(wchar)* dn, const(wchar)* Attr, const(wchar)* Value, LDAP_BERVAL* Data, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_compare_extA(LDAP* ld, const(char)* dn, const(char)* Attr, const(char)* Value, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_compare_ext_sW(LDAP* ld, const(wchar)* dn, const(wchar)* Attr, const(wchar)* Value, LDAP_BERVAL* Data, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_compare_ext_sA(LDAP* ld, const(char)* dn, const(char)* Attr, const(char)* Value, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_compare_ext(LDAP* ld, const(char)* dn, const(char)* Attr, const(char)* Value, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_compare_ext_s(LDAP* ld, const(char)* dn, const(char)* Attr, const(char)* Value, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_deleteW(LDAP* ld, const(wchar)* dn);
uint ldap_deleteA(LDAP* ld, const(char)* dn);
uint ldap_delete_sW(LDAP* ld, const(wchar)* dn);
uint ldap_delete_sA(LDAP* ld, const(char)* dn);
uint ldap_delete_extW(LDAP* ld, const(wchar)* dn, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_delete_extA(LDAP* ld, const(char)* dn, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_delete_ext_sW(LDAP* ld, const(wchar)* dn, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_delete_ext_sA(LDAP* ld, const(char)* dn, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_delete(LDAP* ld, PSTR dn);
uint ldap_delete_s(LDAP* ld, PSTR dn);
uint ldap_delete_ext(LDAP* ld, const(char)* dn, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_delete_ext_s(LDAP* ld, const(char)* dn, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
uint ldap_abandon(LDAP* ld, uint msgid);
uint ldap_result(LDAP* ld, uint msgid, uint all, LDAP_TIMEVAL* timeout, LDAPMessage** res);
uint ldap_msgfree(LDAPMessage* res);
uint ldap_result2error(LDAP* ld, LDAPMessage* res, uint freeit);
uint ldap_parse_resultW(LDAP* Connection, LDAPMessage* ResultMessage, uint* ReturnCode, PWSTR* MatchedDNs, PWSTR* ErrorMessage, ushort*** Referrals, LDAPControlW*** ServerControls, BOOLEAN Freeit);
uint ldap_parse_resultA(LDAP* Connection, LDAPMessage* ResultMessage, uint* ReturnCode, PSTR* MatchedDNs, PSTR* ErrorMessage, byte*** Referrals, LDAPControlA*** ServerControls, BOOLEAN Freeit);
uint ldap_parse_extended_resultA(LDAP* Connection, LDAPMessage* ResultMessage, PSTR* ResultOID, LDAP_BERVAL** ResultData, BOOLEAN Freeit);
uint ldap_parse_extended_resultW(LDAP* Connection, LDAPMessage* ResultMessage, PWSTR* ResultOID, LDAP_BERVAL** ResultData, BOOLEAN Freeit);
uint ldap_controls_freeA(LDAPControlA** Controls);
uint ldap_control_freeA(LDAPControlA* Controls);
uint ldap_controls_freeW(LDAPControlW** Control);
uint ldap_control_freeW(LDAPControlW* Control);
uint ldap_free_controlsW(LDAPControlW** Controls);
uint ldap_free_controlsA(LDAPControlA** Controls);
uint ldap_parse_result(LDAP* Connection, LDAPMessage* ResultMessage, uint* ReturnCode, PSTR* MatchedDNs, PSTR* ErrorMessage, PSTR** Referrals, LDAPControlA*** ServerControls, BOOLEAN Freeit);
uint ldap_controls_free(LDAPControlA** Controls);
uint ldap_control_free(LDAPControlA* Control);
uint ldap_free_controls(LDAPControlA** Controls);
PWSTR ldap_err2stringW(uint err);
PSTR ldap_err2stringA(uint err);
PSTR ldap_err2string(uint err);
void ldap_perror(LDAP* ld, const(char)* msg);
LDAPMessage* ldap_first_entry(LDAP* ld, LDAPMessage* res);
LDAPMessage* ldap_next_entry(LDAP* ld, LDAPMessage* entry);
uint ldap_count_entries(LDAP* ld, LDAPMessage* res);
PWSTR ldap_first_attributeW(LDAP* ld, LDAPMessage* entry, BerElement** ptr);
PSTR ldap_first_attributeA(LDAP* ld, LDAPMessage* entry, BerElement** ptr);
PSTR ldap_first_attribute(LDAP* ld, LDAPMessage* entry, BerElement** ptr);
PWSTR ldap_next_attributeW(LDAP* ld, LDAPMessage* entry, BerElement* ptr);
PSTR ldap_next_attributeA(LDAP* ld, LDAPMessage* entry, BerElement* ptr);
PSTR ldap_next_attribute(LDAP* ld, LDAPMessage* entry, BerElement* ptr);
PWSTR* ldap_get_valuesW(LDAP* ld, LDAPMessage* entry, const(wchar)* attr);
PSTR* ldap_get_valuesA(LDAP* ld, LDAPMessage* entry, const(char)* attr);
PSTR* ldap_get_values(LDAP* ld, LDAPMessage* entry, const(char)* attr);
LDAP_BERVAL** ldap_get_values_lenW(LDAP* ExternalHandle, LDAPMessage* Message, const(wchar)* attr);
LDAP_BERVAL** ldap_get_values_lenA(LDAP* ExternalHandle, LDAPMessage* Message, const(char)* attr);
LDAP_BERVAL** ldap_get_values_len(LDAP* ExternalHandle, LDAPMessage* Message, const(char)* attr);
uint ldap_count_valuesW(PWSTR* vals);
uint ldap_count_valuesA(PSTR* vals);
uint ldap_count_values(PSTR* vals);
uint ldap_count_values_len(LDAP_BERVAL** vals);
uint ldap_value_freeW(PWSTR* vals);
uint ldap_value_freeA(PSTR* vals);
uint ldap_value_free(PSTR* vals);
uint ldap_value_free_len(LDAP_BERVAL** vals);
PWSTR ldap_get_dnW(LDAP* ld, LDAPMessage* entry);
PSTR ldap_get_dnA(LDAP* ld, LDAPMessage* entry);
PSTR ldap_get_dn(LDAP* ld, LDAPMessage* entry);
PWSTR* ldap_explode_dnW(const(wchar)* dn, uint notypes);
PSTR* ldap_explode_dnA(const(char)* dn, uint notypes);
PSTR* ldap_explode_dn(const(char)* dn, uint notypes);
PWSTR ldap_dn2ufnW(const(wchar)* dn);
PSTR ldap_dn2ufnA(const(char)* dn);
PSTR ldap_dn2ufn(const(char)* dn);
void ldap_memfreeW(PWSTR Block);
void ldap_memfreeA(PSTR Block);
void ber_bvfree(LDAP_BERVAL* bv);
void ldap_memfree(PSTR Block);
uint ldap_ufn2dnW(const(wchar)* ufn, PWSTR* pDn);
uint ldap_ufn2dnA(const(char)* ufn, PSTR* pDn);
uint ldap_ufn2dn(const(char)* ufn, PSTR* pDn);
uint ldap_startup(LDAP_VERSION_INFO* version_, HANDLE* Instance);
uint ldap_cleanup(HANDLE hInstance);
uint ldap_escape_filter_elementW(PSTR sourceFilterElement, uint sourceLength, PWSTR destFilterElement, uint destLength);
uint ldap_escape_filter_elementA(PSTR sourceFilterElement, uint sourceLength, PSTR destFilterElement, uint destLength);
uint ldap_escape_filter_element(PSTR sourceFilterElement, uint sourceLength, PSTR destFilterElement, uint destLength);
uint ldap_set_dbg_flags(uint NewFlags);
void ldap_set_dbg_routine(DBGPRINT DebugPrintRoutine);
int LdapUTF8ToUnicode(const(char)* lpSrcStr, int cchSrc, PWSTR lpDestStr, int cchDest);
int LdapUnicodeToUTF8(const(wchar)* lpSrcStr, int cchSrc, PSTR lpDestStr, int cchDest);
uint ldap_create_sort_controlA(LDAP* ExternalHandle, LDAPSortKeyA** SortKeys, ubyte IsCritical, LDAPControlA** Control);
uint ldap_create_sort_controlW(LDAP* ExternalHandle, LDAPSortKeyW** SortKeys, ubyte IsCritical, LDAPControlW** Control);
uint ldap_parse_sort_controlA(LDAP* ExternalHandle, LDAPControlA** Control, uint* Result, PSTR* Attribute);
uint ldap_parse_sort_controlW(LDAP* ExternalHandle, LDAPControlW** Control, uint* Result, PWSTR* Attribute);
uint ldap_create_sort_control(LDAP* ExternalHandle, LDAPSortKeyA** SortKeys, ubyte IsCritical, LDAPControlA** Control);
uint ldap_parse_sort_control(LDAP* ExternalHandle, LDAPControlA** Control, uint* Result, PSTR* Attribute);
uint ldap_encode_sort_controlW(LDAP* ExternalHandle, LDAPSortKeyW** SortKeys, LDAPControlW* Control, BOOLEAN Criticality);
uint ldap_encode_sort_controlA(LDAP* ExternalHandle, LDAPSortKeyA** SortKeys, LDAPControlA* Control, BOOLEAN Criticality);
uint ldap_create_page_controlW(LDAP* ExternalHandle, uint PageSize, LDAP_BERVAL* Cookie, ubyte IsCritical, LDAPControlW** Control);
uint ldap_create_page_controlA(LDAP* ExternalHandle, uint PageSize, LDAP_BERVAL* Cookie, ubyte IsCritical, LDAPControlA** Control);
uint ldap_parse_page_controlW(LDAP* ExternalHandle, LDAPControlW** ServerControls, uint* TotalCount, LDAP_BERVAL** Cookie);
uint ldap_parse_page_controlA(LDAP* ExternalHandle, LDAPControlA** ServerControls, uint* TotalCount, LDAP_BERVAL** Cookie);
uint ldap_create_page_control(LDAP* ExternalHandle, uint PageSize, LDAP_BERVAL* Cookie, ubyte IsCritical, LDAPControlA** Control);
uint ldap_parse_page_control(LDAP* ExternalHandle, LDAPControlA** ServerControls, uint* TotalCount, LDAP_BERVAL** Cookie);
PLDAPSearch ldap_search_init_pageW(LDAP* ExternalHandle, const(wchar)* DistinguishedName, uint ScopeOfSearch, const(wchar)* SearchFilter, ushort** AttributeList, uint AttributesOnly, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint PageTimeLimit, uint TotalSizeLimit, LDAPSortKeyW** SortKeys);
PLDAPSearch ldap_search_init_pageA(LDAP* ExternalHandle, const(char)* DistinguishedName, uint ScopeOfSearch, const(char)* SearchFilter, byte** AttributeList, uint AttributesOnly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint PageTimeLimit, uint TotalSizeLimit, LDAPSortKeyA** SortKeys);
PLDAPSearch ldap_search_init_page(LDAP* ExternalHandle, const(char)* DistinguishedName, uint ScopeOfSearch, const(char)* SearchFilter, byte** AttributeList, uint AttributesOnly, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint PageTimeLimit, uint TotalSizeLimit, LDAPSortKeyA** SortKeys);
uint ldap_get_next_page(LDAP* ExternalHandle, PLDAPSearch SearchHandle, uint PageSize, uint* MessageNumber);
uint ldap_get_next_page_s(LDAP* ExternalHandle, PLDAPSearch SearchHandle, LDAP_TIMEVAL* timeout, uint PageSize, uint* TotalCount, LDAPMessage** Results);
uint ldap_get_paged_count(LDAP* ExternalHandle, PLDAPSearch SearchBlock, uint* TotalCount, LDAPMessage* Results);
uint ldap_search_abandon_page(LDAP* ExternalHandle, PLDAPSearch SearchBlock);
int ldap_create_vlv_controlW(LDAP* ExternalHandle, LDAPVLVInfo* VlvInfo, ubyte IsCritical, LDAPControlW** Control);
int ldap_create_vlv_controlA(LDAP* ExternalHandle, LDAPVLVInfo* VlvInfo, ubyte IsCritical, LDAPControlA** Control);
int ldap_parse_vlv_controlW(LDAP* ExternalHandle, LDAPControlW** Control, uint* TargetPos, uint* ListCount, LDAP_BERVAL** Context, int* ErrCode);
int ldap_parse_vlv_controlA(LDAP* ExternalHandle, LDAPControlA** Control, uint* TargetPos, uint* ListCount, LDAP_BERVAL** Context, int* ErrCode);
uint ldap_start_tls_sW(LDAP* ExternalHandle, uint* ServerReturnValue, LDAPMessage** result, LDAPControlW** ServerControls, LDAPControlW** ClientControls);
uint ldap_start_tls_sA(LDAP* ExternalHandle, uint* ServerReturnValue, LDAPMessage** result, LDAPControlA** ServerControls, LDAPControlA** ClientControls);
BOOLEAN ldap_stop_tls_s(LDAP* ExternalHandle);
LDAPMessage* ldap_first_reference(LDAP* ld, LDAPMessage* res);
LDAPMessage* ldap_next_reference(LDAP* ld, LDAPMessage* entry);
uint ldap_count_references(LDAP* ld, LDAPMessage* res);
uint ldap_parse_referenceW(LDAP* Connection, LDAPMessage* ResultMessage, PWSTR** Referrals);
uint ldap_parse_referenceA(LDAP* Connection, LDAPMessage* ResultMessage, PSTR** Referrals);
uint ldap_parse_reference(LDAP* Connection, LDAPMessage* ResultMessage, PSTR** Referrals);
uint ldap_extended_operationW(LDAP* ld, const(wchar)* Oid, LDAP_BERVAL* Data, LDAPControlW** ServerControls, LDAPControlW** ClientControls, uint* MessageNumber);
uint ldap_extended_operationA(LDAP* ld, const(char)* Oid, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_extended_operation_sA(LDAP* ExternalHandle, PSTR Oid, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls, PSTR* ReturnedOid, LDAP_BERVAL** ReturnedData);
uint ldap_extended_operation_sW(LDAP* ExternalHandle, PWSTR Oid, LDAP_BERVAL* Data, LDAPControlW** ServerControls, LDAPControlW** ClientControls, PWSTR* ReturnedOid, LDAP_BERVAL** ReturnedData);
uint ldap_extended_operation(LDAP* ld, const(char)* Oid, LDAP_BERVAL* Data, LDAPControlA** ServerControls, LDAPControlA** ClientControls, uint* MessageNumber);
uint ldap_close_extended_op(LDAP* ld, uint MessageNumber);
uint LdapGetLastError();
WIN32_ERROR LdapMapErrorToWin32(uint LdapError);
LDAP* ldap_conn_from_msg(LDAP* PrimaryConn, LDAPMessage* res);
BerElement* ber_init(LDAP_BERVAL* pBerVal);
void ber_free(BerElement* pBerElement, int fbuf);
void ber_bvecfree(LDAP_BERVAL** pBerVal);
LDAP_BERVAL* ber_bvdup(LDAP_BERVAL* pBerVal);
BerElement* ber_alloc_t(int options);
uint ber_skip_tag(BerElement* pBerElement, uint* pLen);
uint ber_peek_tag(BerElement* pBerElement, uint* pLen);
uint ber_first_element(BerElement* pBerElement, uint* pLen, CHAR** ppOpaque);
uint ber_next_element(BerElement* pBerElement, uint* pLen, PSTR opaque);
int ber_flatten(BerElement* pBerElement, LDAP_BERVAL** pBerVal);
int ber_printf(BerElement* pBerElement, PSTR fmt);
uint ber_scanf(BerElement* pBerElement, PSTR fmt);
enum LBER_ERROR = 0xffffffffffffffff;
enum LBER_DEFAULT = 0xffffffffffffffff;
enum LDAP_UNICODE = 0x00000001;
enum LDAP_PORT = 0x00000185;
enum LDAP_SSL_PORT = 0x0000027c;
enum LDAP_GC_PORT = 0x00000cc4;
enum LDAP_SSL_GC_PORT = 0x00000cc5;
enum LDAP_VERSION1 = 0x00000001;
enum LDAP_VERSION2 = 0x00000002;
enum LDAP_VERSION3 = 0x00000003;
enum LDAP_VERSION = 0x00000002;
enum LDAP_BIND_CMD = 0x00000060;
enum LDAP_UNBIND_CMD = 0x00000042;
enum LDAP_SEARCH_CMD = 0x00000063;
enum LDAP_MODIFY_CMD = 0x00000066;
enum LDAP_ADD_CMD = 0x00000068;
enum LDAP_DELETE_CMD = 0x0000004a;
enum LDAP_MODRDN_CMD = 0x0000006c;
enum LDAP_COMPARE_CMD = 0x0000006e;
enum LDAP_ABANDON_CMD = 0x00000050;
enum LDAP_SESSION_CMD = 0x00000071;
enum LDAP_EXTENDED_CMD = 0x00000077;
enum LDAP_RES_BIND = 0x00000061;
enum LDAP_RES_SEARCH_ENTRY = 0x00000064;
enum LDAP_RES_SEARCH_RESULT = 0x00000065;
enum LDAP_RES_MODIFY = 0x00000067;
enum LDAP_RES_ADD = 0x00000069;
enum LDAP_RES_DELETE = 0x0000006b;
enum LDAP_RES_MODRDN = 0x0000006d;
enum LDAP_RES_COMPARE = 0x0000006f;
enum LDAP_RES_SESSION = 0x00000072;
enum LDAP_RES_REFERRAL = 0x00000073;
enum LDAP_RES_EXTENDED = 0x00000078;
enum LDAP_RES_ANY = 0xffffffffffffffff;
enum LDAP_INVALID_CMD = 0x000000ff;
enum LDAP_INVALID_RES = 0x000000ff;
enum LDAP_AUTH_SIMPLE = 0x00000080;
enum LDAP_AUTH_SASL = 0x00000083;
enum LDAP_AUTH_OTHERKIND = 0x00000086;
enum LDAP_FILTER_AND = 0x000000a0;
enum LDAP_FILTER_OR = 0x000000a1;
enum LDAP_FILTER_NOT = 0x000000a2;
enum LDAP_FILTER_EQUALITY = 0x000000a3;
enum LDAP_FILTER_SUBSTRINGS = 0x000000a4;
enum LDAP_FILTER_GE = 0x000000a5;
enum LDAP_FILTER_LE = 0x000000a6;
enum LDAP_FILTER_PRESENT = 0x00000087;
enum LDAP_FILTER_APPROX = 0x000000a8;
enum LDAP_FILTER_EXTENSIBLE = 0x000000a9;
enum LDAP_SUBSTRING_INITIAL = 0x00000080;
enum LDAP_SUBSTRING_ANY = 0x00000081;
enum LDAP_SUBSTRING_FINAL = 0x00000082;
enum LDAP_DEREF_NEVER = 0x00000000;
enum LDAP_DEREF_SEARCHING = 0x00000001;
enum LDAP_DEREF_FINDING = 0x00000002;
enum LDAP_DEREF_ALWAYS = 0x00000003;
enum LDAP_NO_LIMIT = 0x00000000;
enum LDAP_OPT_DNS = 0x00000001;
enum LDAP_OPT_CHASE_REFERRALS = 0x00000002;
enum LDAP_OPT_RETURN_REFS = 0x00000004;
enum LDAP_CONTROL_REFERRALS_W = "1.2.840.113556.1.4.616";
enum LDAP_CONTROL_REFERRALS = "1.2.840.113556.1.4.616";
enum LDAP_MOD_ADD = 0x00000000;
enum LDAP_MOD_DELETE = 0x00000001;
enum LDAP_MOD_REPLACE = 0x00000002;
enum LDAP_MOD_BVALUES = 0x00000080;
enum LDAP_OPT_API_INFO = 0x00000000;
enum LDAP_OPT_DESC = 0x00000001;
enum LDAP_OPT_DEREF = 0x00000002;
enum LDAP_OPT_SIZELIMIT = 0x00000003;
enum LDAP_OPT_TIMELIMIT = 0x00000004;
enum LDAP_OPT_THREAD_FN_PTRS = 0x00000005;
enum LDAP_OPT_REBIND_FN = 0x00000006;
enum LDAP_OPT_REBIND_ARG = 0x00000007;
enum LDAP_OPT_REFERRALS = 0x00000008;
enum LDAP_OPT_RESTART = 0x00000009;
enum LDAP_OPT_SSL = 0x0000000a;
enum LDAP_OPT_IO_FN_PTRS = 0x0000000b;
enum LDAP_OPT_CACHE_FN_PTRS = 0x0000000d;
enum LDAP_OPT_CACHE_STRATEGY = 0x0000000e;
enum LDAP_OPT_CACHE_ENABLE = 0x0000000f;
enum LDAP_OPT_REFERRAL_HOP_LIMIT = 0x00000010;
enum LDAP_OPT_PROTOCOL_VERSION = 0x00000011;
enum LDAP_OPT_VERSION = 0x00000011;
enum LDAP_OPT_API_FEATURE_INFO = 0x00000015;
enum LDAP_OPT_HOST_NAME = 0x00000030;
enum LDAP_OPT_ERROR_NUMBER = 0x00000031;
enum LDAP_OPT_ERROR_STRING = 0x00000032;
enum LDAP_OPT_SERVER_ERROR = 0x00000033;
enum LDAP_OPT_SERVER_EXT_ERROR = 0x00000034;
enum LDAP_OPT_HOST_REACHABLE = 0x0000003e;
enum LDAP_OPT_PING_KEEP_ALIVE = 0x00000036;
enum LDAP_OPT_PING_WAIT_TIME = 0x00000037;
enum LDAP_OPT_PING_LIMIT = 0x00000038;
enum LDAP_OPT_DNSDOMAIN_NAME = 0x0000003b;
enum LDAP_OPT_GETDSNAME_FLAGS = 0x0000003d;
enum LDAP_OPT_PROMPT_CREDENTIALS = 0x0000003f;
enum LDAP_OPT_AUTO_RECONNECT = 0x00000091;
enum LDAP_OPT_SSPI_FLAGS = 0x00000092;
enum LDAP_OPT_SSL_INFO = 0x00000093;
enum LDAP_OPT_TLS = 0x0000000a;
enum LDAP_OPT_TLS_INFO = 0x00000093;
enum LDAP_OPT_SIGN = 0x00000095;
enum LDAP_OPT_ENCRYPT = 0x00000096;
enum LDAP_OPT_SASL_METHOD = 0x00000097;
enum LDAP_OPT_AREC_EXCLUSIVE = 0x00000098;
enum LDAP_OPT_SECURITY_CONTEXT = 0x00000099;
enum LDAP_OPT_ROOTDSE_CACHE = 0x0000009a;
enum LDAP_OPT_TCP_KEEPALIVE = 0x00000040;
enum LDAP_OPT_FAST_CONCURRENT_BIND = 0x00000041;
enum LDAP_OPT_SEND_TIMEOUT = 0x00000042;
enum LDAP_OPT_SCH_FLAGS = 0x00000043;
enum LDAP_OPT_SOCKET_BIND_ADDRESSES = 0x00000044;
enum LDAP_OPT_CLDAP_TIMEOUT = 0x00000045;
enum LDAP_OPT_CLDAP_TRIES = 0x00000046;
enum LDAP_CHASE_SUBORDINATE_REFERRALS = 0x00000020;
enum LDAP_CHASE_EXTERNAL_REFERRALS = 0x00000040;
enum LDAP_SCOPE_BASE = 0x00000000;
enum LDAP_SCOPE_ONELEVEL = 0x00000001;
enum LDAP_SCOPE_SUBTREE = 0x00000002;
enum LDAP_MSG_ONE = 0x00000000;
enum LDAP_MSG_ALL = 0x00000001;
enum LDAP_MSG_RECEIVED = 0x00000002;
enum LBER_USE_DER = 0x00000001;
enum LBER_USE_INDEFINITE_LEN = 0x00000002;
enum LBER_TRANSLATE_STRINGS = 0x00000004;
enum LAPI_MAJOR_VER1 = 0x00000001;
enum LAPI_MINOR_VER1 = 0x00000001;
enum LDAP_API_INFO_VERSION = 0x00000001;
enum LDAP_API_VERSION = 0x000007d4;
enum LDAP_VERSION_MIN = 0x00000002;
enum LDAP_VERSION_MAX = 0x00000003;
enum LDAP_VENDOR_NAME = "Microsoft Corporation.";
enum LDAP_VENDOR_NAME_W = "Microsoft Corporation.";
enum LDAP_VENDOR_VERSION = 0x000001fe;
enum LDAP_FEATURE_INFO_VERSION = 0x00000001;
enum LDAP_SERVER_SORT_OID = "1.2.840.113556.1.4.473";
enum LDAP_SERVER_SORT_OID_W = "1.2.840.113556.1.4.473";
enum LDAP_SERVER_RESP_SORT_OID = "1.2.840.113556.1.4.474";
enum LDAP_SERVER_RESP_SORT_OID_W = "1.2.840.113556.1.4.474";
enum LDAP_PAGED_RESULT_OID_STRING = "1.2.840.113556.1.4.319";
enum LDAP_PAGED_RESULT_OID_STRING_W = "1.2.840.113556.1.4.319";
enum LDAP_CONTROL_VLVREQUEST = "2.16.840.1.113730.3.4.9";
enum LDAP_CONTROL_VLVREQUEST_W = "2.16.840.1.113730.3.4.9";
enum LDAP_CONTROL_VLVRESPONSE = "2.16.840.1.113730.3.4.10";
enum LDAP_CONTROL_VLVRESPONSE_W = "2.16.840.1.113730.3.4.10";
enum LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 0x000003e9;
enum LDAP_VLVINFO_VERSION = 0x00000001;
enum LDAP_START_TLS_OID = "1.3.6.1.4.1.1466.20037";
enum LDAP_START_TLS_OID_W = "1.3.6.1.4.1.1466.20037";
enum LDAP_TTL_EXTENDED_OP_OID = "1.3.6.1.4.1.1466.101.119.1";
enum LDAP_TTL_EXTENDED_OP_OID_W = "1.3.6.1.4.1.1466.101.119.1";
enum LDAP_OPT_REFERRAL_CALLBACK = 0x00000070;
enum LDAP_OPT_CLIENT_CERTIFICATE = 0x00000080;
enum LDAP_OPT_SERVER_CERTIFICATE = 0x00000081;
enum LDAP_OPT_REF_DEREF_CONN_PER_MSG = 0x00000094;
enum LDAP_SERVER_FORCE_UPDATE_OID = "1.2.840.113556.1.4.1974";
enum LDAP_SERVER_FORCE_UPDATE_OID_W = "1.2.840.113556.1.4.1974";
enum LDAP_SERVER_PERMISSIVE_MODIFY_OID = "1.2.840.113556.1.4.1413";
enum LDAP_SERVER_PERMISSIVE_MODIFY_OID_W = "1.2.840.113556.1.4.1413";
enum LDAP_SERVER_SHOW_DELETED_OID = "1.2.840.113556.1.4.417";
enum LDAP_SERVER_SHOW_DELETED_OID_W = "1.2.840.113556.1.4.417";
enum LDAP_SERVER_SHOW_RECYCLED_OID = "1.2.840.113556.1.4.2064";
enum LDAP_SERVER_SHOW_RECYCLED_OID_W = "1.2.840.113556.1.4.2064";
enum LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID = "1.2.840.113556.1.4.2211";
enum LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID_W = "1.2.840.113556.1.4.2211";
enum LDAP_SERVER_SEARCH_HINTS_OID = "1.2.840.113556.1.4.2206";
enum LDAP_SERVER_SEARCH_HINTS_OID_W = "1.2.840.113556.1.4.2206";
enum LDAP_SEARCH_HINT_INDEX_ONLY_OID = "1.2.840.113556.1.4.2207";
enum LDAP_SEARCH_HINT_INDEX_ONLY_OID_W = "1.2.840.113556.1.4.2207";
enum LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID = "1.2.840.113556.1.4.2210";
enum LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID_W = "1.2.840.113556.1.4.2210";
enum LDAP_SEARCH_HINT_REQUIRED_INDEX_OID = "1.2.840.113556.1.4.2306";
enum LDAP_SEARCH_HINT_REQUIRED_INDEX_OID_W = "1.2.840.113556.1.4.2306";
enum LDAP_SERVER_UPDATE_STATS_OID = "1.2.840.113556.1.4.2205";
enum LDAP_SERVER_UPDATE_STATS_OID_W = "1.2.840.113556.1.4.2205";
enum LDAP_UPDATE_STATS_USN_OID = "1.2.840.113556.1.4.2208";
enum LDAP_UPDATE_STATS_USN_OID_W = "1.2.840.113556.1.4.2208";
enum LDAP_UPDATE_STATS_INVOCATIONID_OID = "1.2.840.113556.1.4.2209";
enum LDAP_UPDATE_STATS_INVOCATIONID_OID_W = "1.2.840.113556.1.4.2209";
enum LDAP_SERVER_GET_STATS_OID = "1.2.840.113556.1.4.970";
enum LDAP_SERVER_GET_STATS_OID_W = "1.2.840.113556.1.4.970";
enum LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID = "1.2.840.113556.1.4.2065";
enum LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID_W = "1.2.840.113556.1.4.2065";
enum LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID = "1.2.840.113556.1.4.2066";
enum LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID_W = "1.2.840.113556.1.4.2066";
enum LDAP_SERVER_POLICY_HINTS_OID = "1.2.840.113556.1.4.2239";
enum LDAP_SERVER_POLICY_HINTS_OID_W = "1.2.840.113556.1.4.2239";
enum LDAP_SERVER_RANGE_OPTION_OID = "1.2.840.113556.1.4.802";
enum LDAP_SERVER_RANGE_OPTION_OID_W = "1.2.840.113556.1.4.802";
enum LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID = "1.2.840.113556.1.4.521";
enum LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID_W = "1.2.840.113556.1.4.521";
enum LDAP_SERVER_NOTIFICATION_OID = "1.2.840.113556.1.4.528";
enum LDAP_SERVER_NOTIFICATION_OID_W = "1.2.840.113556.1.4.528";
enum LDAP_SERVER_SHUTDOWN_NOTIFY_OID = "1.2.840.113556.1.4.1907";
enum LDAP_SERVER_SHUTDOWN_NOTIFY_OID_W = "1.2.840.113556.1.4.1907";
enum LDAP_SERVER_LAZY_COMMIT_OID = "1.2.840.113556.1.4.619";
enum LDAP_SERVER_LAZY_COMMIT_OID_W = "1.2.840.113556.1.4.619";
enum LDAP_SERVER_SD_FLAGS_OID = "1.2.840.113556.1.4.801";
enum LDAP_SERVER_SD_FLAGS_OID_W = "1.2.840.113556.1.4.801";
enum LDAP_SERVER_TREE_DELETE_EX_OID = "1.2.840.113556.1.4.2204";
enum LDAP_SERVER_TREE_DELETE_EX_OID_W = "1.2.840.113556.1.4.2204";
enum LDAP_SERVER_TREE_DELETE_OID = "1.2.840.113556.1.4.805";
enum LDAP_SERVER_TREE_DELETE_OID_W = "1.2.840.113556.1.4.805";
enum LDAP_SERVER_ASQ_OID = "1.2.840.113556.1.4.1504";
enum LDAP_SERVER_ASQ_OID_W = "1.2.840.113556.1.4.1504";
enum LDAP_SERVER_DIRSYNC_OID = "1.2.840.113556.1.4.841";
enum LDAP_SERVER_DIRSYNC_OID_W = "1.2.840.113556.1.4.841";
enum LDAP_SERVER_DIRSYNC_EX_OID = "1.2.840.113556.1.4.2090";
enum LDAP_SERVER_DIRSYNC_EX_OID_W = "1.2.840.113556.1.4.2090";
enum LDAP_SERVER_EXTENDED_DN_OID = "1.2.840.113556.1.4.529";
enum LDAP_SERVER_EXTENDED_DN_OID_W = "1.2.840.113556.1.4.529";
enum LDAP_SERVER_VERIFY_NAME_OID = "1.2.840.113556.1.4.1338";
enum LDAP_SERVER_VERIFY_NAME_OID_W = "1.2.840.113556.1.4.1338";
enum LDAP_SERVER_DOMAIN_SCOPE_OID = "1.2.840.113556.1.4.1339";
enum LDAP_SERVER_DOMAIN_SCOPE_OID_W = "1.2.840.113556.1.4.1339";
enum LDAP_SERVER_SEARCH_OPTIONS_OID = "1.2.840.113556.1.4.1340";
enum LDAP_SERVER_SEARCH_OPTIONS_OID_W = "1.2.840.113556.1.4.1340";
enum SERVER_SEARCH_FLAG_DOMAIN_SCOPE = 0x00000001;
enum SERVER_SEARCH_FLAG_PHANTOM_ROOT = 0x00000002;
enum LDAP_SERVER_QUOTA_CONTROL_OID = "1.2.840.113556.1.4.1852";
enum LDAP_SERVER_QUOTA_CONTROL_OID_W = "1.2.840.113556.1.4.1852";
enum LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID = "1.2.840.113556.1.4.1948";
enum LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID_W = "1.2.840.113556.1.4.1948";
enum LDAP_SERVER_DN_INPUT_OID = "1.2.840.113556.1.4.2026";
enum LDAP_SERVER_DN_INPUT_OID_W = "1.2.840.113556.1.4.2026";
enum LDAP_SERVER_SET_OWNER_OID = "1.2.840.113556.1.4.2255";
enum LDAP_SERVER_SET_OWNER_OID_W = "1.2.840.113556.1.4.2255";
enum LDAP_SERVER_BYPASS_QUOTA_OID = "1.2.840.113556.1.4.2256";
enum LDAP_SERVER_BYPASS_QUOTA_OID_W = "1.2.840.113556.1.4.2256";
enum LDAP_SERVER_LINK_TTL_OID = "1.2.840.113556.1.4.2309";
enum LDAP_SERVER_LINK_TTL_OID_W = "1.2.840.113556.1.4.2309";
enum LDAP_OPATT_BECOME_DOM_MASTER = "becomeDomainMaster";
enum LDAP_OPATT_BECOME_DOM_MASTER_W = "becomeDomainMaster";
enum LDAP_OPATT_BECOME_RID_MASTER = "becomeRidMaster";
enum LDAP_OPATT_BECOME_RID_MASTER_W = "becomeRidMaster";
enum LDAP_OPATT_BECOME_SCHEMA_MASTER = "becomeSchemaMaster";
enum LDAP_OPATT_BECOME_SCHEMA_MASTER_W = "becomeSchemaMaster";
enum LDAP_OPATT_RECALC_HIERARCHY = "recalcHierarchy";
enum LDAP_OPATT_RECALC_HIERARCHY_W = "recalcHierarchy";
enum LDAP_OPATT_SCHEMA_UPDATE_NOW = "schemaUpdateNow";
enum LDAP_OPATT_SCHEMA_UPDATE_NOW_W = "schemaUpdateNow";
enum LDAP_OPATT_BECOME_PDC = "becomePdc";
enum LDAP_OPATT_BECOME_PDC_W = "becomePdc";
enum LDAP_OPATT_FIXUP_INHERITANCE = "fixupInheritance";
enum LDAP_OPATT_FIXUP_INHERITANCE_W = "fixupInheritance";
enum LDAP_OPATT_INVALIDATE_RID_POOL = "invalidateRidPool";
enum LDAP_OPATT_INVALIDATE_RID_POOL_W = "invalidateRidPool";
enum LDAP_OPATT_ABANDON_REPL = "abandonReplication";
enum LDAP_OPATT_ABANDON_REPL_W = "abandonReplication";
enum LDAP_OPATT_DO_GARBAGE_COLLECTION = "doGarbageCollection";
enum LDAP_OPATT_DO_GARBAGE_COLLECTION_W = "doGarbageCollection";
enum LDAP_OPATT_SUBSCHEMA_SUBENTRY = "subschemaSubentry";
enum LDAP_OPATT_SUBSCHEMA_SUBENTRY_W = "subschemaSubentry";
enum LDAP_OPATT_CURRENT_TIME = "currentTime";
enum LDAP_OPATT_CURRENT_TIME_W = "currentTime";
enum LDAP_OPATT_SERVER_NAME = "serverName";
enum LDAP_OPATT_SERVER_NAME_W = "serverName";
enum LDAP_OPATT_NAMING_CONTEXTS = "namingContexts";
enum LDAP_OPATT_NAMING_CONTEXTS_W = "namingContexts";
enum LDAP_OPATT_DEFAULT_NAMING_CONTEXT = "defaultNamingContext";
enum LDAP_OPATT_DEFAULT_NAMING_CONTEXT_W = "defaultNamingContext";
enum LDAP_OPATT_SUPPORTED_CONTROL = "supportedControl";
enum LDAP_OPATT_SUPPORTED_CONTROL_W = "supportedControl";
enum LDAP_OPATT_HIGHEST_COMMITTED_USN = "highestCommitedUSN";
enum LDAP_OPATT_HIGHEST_COMMITTED_USN_W = "highestCommitedUSN";
enum LDAP_OPATT_SUPPORTED_LDAP_VERSION = "supportedLDAPVersion";
enum LDAP_OPATT_SUPPORTED_LDAP_VERSION_W = "supportedLDAPVersion";
enum LDAP_OPATT_SUPPORTED_LDAP_POLICIES = "supportedLDAPPolicies";
enum LDAP_OPATT_SUPPORTED_LDAP_POLICIES_W = "supportedLDAPPolicies";
enum LDAP_OPATT_SCHEMA_NAMING_CONTEXT = "schemaNamingContext";
enum LDAP_OPATT_SCHEMA_NAMING_CONTEXT_W = "schemaNamingContext";
enum LDAP_OPATT_CONFIG_NAMING_CONTEXT = "configurationNamingContext";
enum LDAP_OPATT_CONFIG_NAMING_CONTEXT_W = "configurationNamingContext";
enum LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT = "rootDomainNamingContext";
enum LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT_W = "rootDomainNamingContext";
enum LDAP_OPATT_SUPPORTED_SASL_MECHANISM = "supportedSASLMechanisms";
enum LDAP_OPATT_SUPPORTED_SASL_MECHANISM_W = "supportedSASLMechanisms";
enum LDAP_OPATT_DNS_HOST_NAME = "dnsHostName";
enum LDAP_OPATT_DNS_HOST_NAME_W = "dnsHostName";
enum LDAP_OPATT_LDAP_SERVICE_NAME = "ldapServiceName";
enum LDAP_OPATT_LDAP_SERVICE_NAME_W = "ldapServiceName";
enum LDAP_OPATT_DS_SERVICE_NAME = "dsServiceName";
enum LDAP_OPATT_DS_SERVICE_NAME_W = "dsServiceName";
enum LDAP_OPATT_SUPPORTED_CAPABILITIES = "supportedCapabilities";
enum LDAP_OPATT_SUPPORTED_CAPABILITIES_W = "supportedCapabilities";
enum LDAP_CAP_ACTIVE_DIRECTORY_OID = "1.2.840.113556.1.4.800";
enum LDAP_CAP_ACTIVE_DIRECTORY_OID_W = "1.2.840.113556.1.4.800";
enum LDAP_CAP_ACTIVE_DIRECTORY_V51_OID = "1.2.840.113556.1.4.1670";
enum LDAP_CAP_ACTIVE_DIRECTORY_V51_OID_W = "1.2.840.113556.1.4.1670";
enum LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID = "1.2.840.113556.1.4.1791";
enum LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID_W = "1.2.840.113556.1.4.1791";
enum LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID = "1.2.840.113556.1.4.1851";
enum LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID_W = "1.2.840.113556.1.4.1851";
enum LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID = "1.2.840.113556.1.4.1920";
enum LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID_W = "1.2.840.113556.1.4.1920";
enum LDAP_CAP_ACTIVE_DIRECTORY_V60_OID = "1.2.840.113556.1.4.1935";
enum LDAP_CAP_ACTIVE_DIRECTORY_V60_OID_W = "1.2.840.113556.1.4.1935";
enum LDAP_CAP_ACTIVE_DIRECTORY_V61_OID = "1.2.840.113556.1.4.1935";
enum LDAP_CAP_ACTIVE_DIRECTORY_V61_OID_W = "1.2.840.113556.1.4.1935";
enum LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID = "1.2.840.113556.1.4.2080";
enum LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID_W = "1.2.840.113556.1.4.2080";
enum LDAP_CAP_ACTIVE_DIRECTORY_W8_OID = "1.2.840.113556.1.4.2237";
enum LDAP_CAP_ACTIVE_DIRECTORY_W8_OID_W = "1.2.840.113556.1.4.2237";
enum LDAP_MATCHING_RULE_BIT_AND = "1.2.840.113556.1.4.803";
enum LDAP_MATCHING_RULE_BIT_AND_W = "1.2.840.113556.1.4.803";
enum LDAP_MATCHING_RULE_BIT_OR = "1.2.840.113556.1.4.804";
enum LDAP_MATCHING_RULE_BIT_OR_W = "1.2.840.113556.1.4.804";
enum LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION = "1.2.840.113556.1.4.1941";
enum LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION_W = "1.2.840.113556.1.4.1941";
enum LDAP_MATCHING_RULE_DN_BINARY_COMPLEX = "1.2.840.113556.1.4.2253";
enum LDAP_MATCHING_RULE_DN_BINARY_COMPLEX_W = "1.2.840.113556.1.4.2253";
enum LDAP_SERVER_FAST_BIND_OID = "1.2.840.113556.1.4.1781";
enum LDAP_SERVER_FAST_BIND_OID_W = "1.2.840.113556.1.4.1781";
enum LDAP_SERVER_WHO_AM_I_OID = "1.3.6.1.4.1.4203.1.11.3";
enum LDAP_SERVER_WHO_AM_I_OID_W = "1.3.6.1.4.1.4203.1.11.3";
enum LDAP_SERVER_BATCH_REQUEST_OID = "1.2.840.113556.1.4.2212";
enum LDAP_SERVER_BATCH_REQUEST_OID_W = "1.2.840.113556.1.4.2212";
enum LDAP_DIRSYNC_OBJECT_SECURITY = 0x00000001;
enum LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER = 0x00000800;
enum LDAP_DIRSYNC_PUBLIC_DATA_ONLY = 0x00002000;
enum LDAP_DIRSYNC_INCREMENTAL_VALUES = 0x80000000;
enum LDAP_DIRSYNC_ROPAS_DATA_ONLY = 0x40000000;
enum LDAP_POLICYHINT_APPLY_FULLPWDPOLICY = 0x00000001;
alias PLDAPSearch = long;
alias LDAP_RETCODE = int;
enum : int
{
    LDAP_SUCCESS                    = 0x00000000,
    LDAP_OPERATIONS_ERROR           = 0x00000001,
    LDAP_PROTOCOL_ERROR             = 0x00000002,
    LDAP_TIMELIMIT_EXCEEDED         = 0x00000003,
    LDAP_SIZELIMIT_EXCEEDED         = 0x00000004,
    LDAP_COMPARE_FALSE              = 0x00000005,
    LDAP_COMPARE_TRUE               = 0x00000006,
    LDAP_AUTH_METHOD_NOT_SUPPORTED  = 0x00000007,
    LDAP_STRONG_AUTH_REQUIRED       = 0x00000008,
    LDAP_REFERRAL_V2                = 0x00000009,
    LDAP_PARTIAL_RESULTS            = 0x00000009,
    LDAP_REFERRAL                   = 0x0000000a,
    LDAP_ADMIN_LIMIT_EXCEEDED       = 0x0000000b,
    LDAP_UNAVAILABLE_CRIT_EXTENSION = 0x0000000c,
    LDAP_CONFIDENTIALITY_REQUIRED   = 0x0000000d,
    LDAP_SASL_BIND_IN_PROGRESS      = 0x0000000e,
    LDAP_NO_SUCH_ATTRIBUTE          = 0x00000010,
    LDAP_UNDEFINED_TYPE             = 0x00000011,
    LDAP_INAPPROPRIATE_MATCHING     = 0x00000012,
    LDAP_CONSTRAINT_VIOLATION       = 0x00000013,
    LDAP_ATTRIBUTE_OR_VALUE_EXISTS  = 0x00000014,
    LDAP_INVALID_SYNTAX             = 0x00000015,
    LDAP_NO_SUCH_OBJECT             = 0x00000020,
    LDAP_ALIAS_PROBLEM              = 0x00000021,
    LDAP_INVALID_DN_SYNTAX          = 0x00000022,
    LDAP_IS_LEAF                    = 0x00000023,
    LDAP_ALIAS_DEREF_PROBLEM        = 0x00000024,
    LDAP_INAPPROPRIATE_AUTH         = 0x00000030,
    LDAP_INVALID_CREDENTIALS        = 0x00000031,
    LDAP_INSUFFICIENT_RIGHTS        = 0x00000032,
    LDAP_BUSY                       = 0x00000033,
    LDAP_UNAVAILABLE                = 0x00000034,
    LDAP_UNWILLING_TO_PERFORM       = 0x00000035,
    LDAP_LOOP_DETECT                = 0x00000036,
    LDAP_SORT_CONTROL_MISSING       = 0x0000003c,
    LDAP_OFFSET_RANGE_ERROR         = 0x0000003d,
    LDAP_NAMING_VIOLATION           = 0x00000040,
    LDAP_OBJECT_CLASS_VIOLATION     = 0x00000041,
    LDAP_NOT_ALLOWED_ON_NONLEAF     = 0x00000042,
    LDAP_NOT_ALLOWED_ON_RDN         = 0x00000043,
    LDAP_ALREADY_EXISTS             = 0x00000044,
    LDAP_NO_OBJECT_CLASS_MODS       = 0x00000045,
    LDAP_RESULTS_TOO_LARGE          = 0x00000046,
    LDAP_AFFECTS_MULTIPLE_DSAS      = 0x00000047,
    LDAP_VIRTUAL_LIST_VIEW_ERROR    = 0x0000004c,
    LDAP_OTHER                      = 0x00000050,
    LDAP_SERVER_DOWN                = 0x00000051,
    LDAP_LOCAL_ERROR                = 0x00000052,
    LDAP_ENCODING_ERROR             = 0x00000053,
    LDAP_DECODING_ERROR             = 0x00000054,
    LDAP_TIMEOUT                    = 0x00000055,
    LDAP_AUTH_UNKNOWN               = 0x00000056,
    LDAP_FILTER_ERROR               = 0x00000057,
    LDAP_USER_CANCELLED             = 0x00000058,
    LDAP_PARAM_ERROR                = 0x00000059,
    LDAP_NO_MEMORY                  = 0x0000005a,
    LDAP_CONNECT_ERROR              = 0x0000005b,
    LDAP_NOT_SUPPORTED              = 0x0000005c,
    LDAP_NO_RESULTS_RETURNED        = 0x0000005e,
    LDAP_CONTROL_NOT_FOUND          = 0x0000005d,
    LDAP_MORE_RESULTS_TO_RETURN     = 0x0000005f,
    LDAP_CLIENT_LOOP                = 0x00000060,
    LDAP_REFERRAL_LIMIT_EXCEEDED    = 0x00000061,
}

struct LDAP
{
    struct ld_sb
    {
        ulong sb_sd;
        ubyte[41] Reserved1;
        ulong sb_naddr;
        ubyte[24] Reserved2;
    }
    PSTR ld_host;
    uint ld_version;
    ubyte ld_lberoptions;
    uint ld_deref;
    uint ld_timelimit;
    uint ld_sizelimit;
    uint ld_errno;
    PSTR ld_matched;
    PSTR ld_error;
    uint ld_msgid;
    ubyte[25] Reserved3;
    uint ld_cldaptries;
    uint ld_cldaptimeout;
    uint ld_refhoplimit;
    uint ld_options;
}
struct LDAP_TIMEVAL
{
    int tv_sec;
    int tv_usec;
}
struct LDAP_BERVAL
{
    uint bv_len;
    PSTR bv_val;
}
struct LDAPMessage
{
    uint lm_msgid;
    uint lm_msgtype;
    void* lm_ber;
    LDAPMessage* lm_chain;
    LDAPMessage* lm_next;
    uint lm_time;
    LDAP* Connection;
    void* Request;
    uint lm_returncode;
    ushort lm_referral;
    BOOLEAN lm_chased;
    BOOLEAN lm_eom;
    BOOLEAN ConnectionReferenced;
}
struct LDAPControlA
{
    PSTR ldctl_oid;
    LDAP_BERVAL ldctl_value;
    BOOLEAN ldctl_iscritical;
}
struct LDAPControlW
{
    PWSTR ldctl_oid;
    LDAP_BERVAL ldctl_value;
    BOOLEAN ldctl_iscritical;
}
struct LDAPModW
{
    uint mod_op;
    PWSTR mod_type;
    union mod_vals
    {
        PWSTR* modv_strvals;
        LDAP_BERVAL** modv_bvals;
    }
}
struct LDAPModA
{
    uint mod_op;
    PSTR mod_type;
    union mod_vals
    {
        PSTR* modv_strvals;
        LDAP_BERVAL** modv_bvals;
    }
}
struct BerElement
{
    PSTR opaque;
}
struct LDAP_VERSION_INFO
{
    uint lv_size;
    uint lv_major;
    uint lv_minor;
}
struct LDAPAPIInfoA
{
    int ldapai_info_version;
    int ldapai_api_version;
    int ldapai_protocol_version;
    byte** ldapai_extensions;
    PSTR ldapai_vendor_name;
    int ldapai_vendor_version;
}
struct LDAPAPIInfoW
{
    int ldapai_info_version;
    int ldapai_api_version;
    int ldapai_protocol_version;
    PWSTR* ldapai_extensions;
    PWSTR ldapai_vendor_name;
    int ldapai_vendor_version;
}
struct LDAPAPIFeatureInfoA
{
    int ldapaif_info_version;
    PSTR ldapaif_name;
    int ldapaif_version;
}
struct LDAPAPIFeatureInfoW
{
    int ldapaif_info_version;
    PWSTR ldapaif_name;
    int ldapaif_version;
}
alias DBGPRINT = uint function(const(char)* Format);
struct LDAPSortKeyW
{
    PWSTR sk_attrtype;
    PWSTR sk_matchruleoid;
    BOOLEAN sk_reverseorder;
}
struct LDAPSortKeyA
{
    PSTR sk_attrtype;
    PSTR sk_matchruleoid;
    BOOLEAN sk_reverseorder;
}
struct LDAPVLVInfo
{
    int ldvlv_version;
    uint ldvlv_before_count;
    uint ldvlv_after_count;
    uint ldvlv_offset;
    uint ldvlv_count;
    LDAP_BERVAL* ldvlv_attrvalue;
    LDAP_BERVAL* ldvlv_context;
    void* ldvlv_extradata;
}
alias QUERYFORCONNECTION = uint function(LDAP* PrimaryConnection, LDAP* ReferralFromConnection, PWSTR NewDN, PSTR HostName, uint PortNumber, void* SecAuthIdentity, void* CurrentUserToken, LDAP** ConnectionToUse);
alias NOTIFYOFNEWCONNECTION = BOOLEAN function(LDAP* PrimaryConnection, LDAP* ReferralFromConnection, PWSTR NewDN, PSTR HostName, LDAP* NewConnection, uint PortNumber, void* SecAuthIdentity, void* CurrentUser, uint ErrorCodeFromBind);
alias DEREFERENCECONNECTION = uint function(LDAP* PrimaryConnection, LDAP* ConnectionToDereference);
struct LDAP_REFERRAL_CALLBACK
{
    uint SizeOfCallbacks;
    QUERYFORCONNECTION QueryForConnection;
    NOTIFYOFNEWCONNECTION NotifyRoutine;
    DEREFERENCECONNECTION DereferenceRoutine;
}
alias QUERYCLIENTCERT = BOOLEAN function(LDAP* Connection, SecPkgContext_IssuerListInfoEx* trusted_CAs, CERT_CONTEXT** ppCertificate);
alias VERIFYSERVERCERT = BOOLEAN function(LDAP* Connection, CERT_CONTEXT** pServerCert);
