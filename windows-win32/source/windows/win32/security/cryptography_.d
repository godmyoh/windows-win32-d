module windows.win32.security.cryptography_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, NTSTATUS, PSID, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.security_ : NCRYPT_DESCRIPTOR_HANDLE, NCRYPT_STREAM_HANDLE, OBJECT_SECURITY_INFORMATION;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;
import windows.win32.system.registry : HKEY, REG_VALUE_TYPE;

version (Windows):
extern (Windows):

alias BCRYPT_OPERATION = uint;
enum : uint
{
    BCRYPT_CIPHER_OPERATION                = 0x00000001,
    BCRYPT_HASH_OPERATION                  = 0x00000002,
    BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 0x00000004,
    BCRYPT_SECRET_AGREEMENT_OPERATION      = 0x00000008,
    BCRYPT_SIGNATURE_OPERATION             = 0x00000010,
    BCRYPT_RNG_OPERATION                   = 0x00000020,
}

alias NCRYPT_OPERATION = uint;
enum : uint
{
    NCRYPT_CIPHER_OPERATION                = 0x00000001,
    NCRYPT_HASH_OPERATION                  = 0x00000002,
    NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 0x00000004,
    NCRYPT_SECRET_AGREEMENT_OPERATION      = 0x00000008,
    NCRYPT_SIGNATURE_OPERATION             = 0x00000010,
}

alias CERT_FIND_FLAGS = uint;
enum : uint
{
    CERT_FIND_ANY                         = 0x00000000,
    CERT_FIND_CERT_ID                     = 0x00100000,
    CERT_FIND_CTL_USAGE                   = 0x000a0000,
    CERT_FIND_ENHKEY_USAGE                = 0x000a0000,
    CERT_FIND_EXISTING                    = 0x000d0000,
    CERT_FIND_HASH                        = 0x00010000,
    CERT_FIND_HAS_PRIVATE_KEY             = 0x00150000,
    CERT_FIND_ISSUER_ATTR                 = 0x00030004,
    CERT_FIND_ISSUER_NAME                 = 0x00020004,
    CERT_FIND_ISSUER_OF                   = 0x000c0000,
    CERT_FIND_ISSUER_STR                  = 0x00080004,
    CERT_FIND_KEY_IDENTIFIER              = 0x000f0000,
    CERT_FIND_KEY_SPEC                    = 0x00090000,
    CERT_FIND_MD5_HASH                    = 0x00040000,
    CERT_FIND_PROPERTY                    = 0x00050000,
    CERT_FIND_PUBLIC_KEY                  = 0x00060000,
    CERT_FIND_SHA1_HASH                   = 0x00010000,
    CERT_FIND_SIGNATURE_HASH              = 0x000e0000,
    CERT_FIND_SUBJECT_ATTR                = 0x00030007,
    CERT_FIND_SUBJECT_CERT                = 0x000b0000,
    CERT_FIND_SUBJECT_NAME                = 0x00020007,
    CERT_FIND_SUBJECT_STR                 = 0x00080007,
    CERT_FIND_CROSS_CERT_DIST_POINTS      = 0x00110000,
    CERT_FIND_PUBKEY_MD5_HASH             = 0x00120000,
    CERT_FIND_SUBJECT_STR_A               = 0x00070007,
    CERT_FIND_SUBJECT_STR_W               = 0x00080007,
    CERT_FIND_ISSUER_STR_A                = 0x00070004,
    CERT_FIND_ISSUER_STR_W                = 0x00080004,
    CERT_FIND_SUBJECT_INFO_ACCESS         = 0x00130000,
    CERT_FIND_HASH_STR                    = 0x00140000,
    CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG  = 0x00000001,
    CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG  = 0x00000002,
    CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG = 0x00000004,
    CERT_FIND_NO_ENHKEY_USAGE_FLAG        = 0x00000008,
    CERT_FIND_OR_ENHKEY_USAGE_FLAG        = 0x00000010,
    CERT_FIND_VALID_ENHKEY_USAGE_FLAG     = 0x00000020,
    CERT_FIND_OPTIONAL_CTL_USAGE_FLAG     = 0x00000001,
    CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG     = 0x00000002,
    CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG    = 0x00000004,
    CERT_FIND_NO_CTL_USAGE_FLAG           = 0x00000008,
    CERT_FIND_OR_CTL_USAGE_FLAG           = 0x00000010,
    CERT_FIND_VALID_CTL_USAGE_FLAG        = 0x00000020,
}

alias CERT_QUERY_OBJECT_TYPE = uint;
enum : uint
{
    CERT_QUERY_OBJECT_FILE = 0x00000001,
    CERT_QUERY_OBJECT_BLOB = 0x00000002,
}

alias CERT_QUERY_CONTENT_TYPE = uint;
enum : uint
{
    CERT_QUERY_CONTENT_CERT               = 0x00000001,
    CERT_QUERY_CONTENT_CTL                = 0x00000002,
    CERT_QUERY_CONTENT_CRL                = 0x00000003,
    CERT_QUERY_CONTENT_SERIALIZED_STORE   = 0x00000004,
    CERT_QUERY_CONTENT_SERIALIZED_CERT    = 0x00000005,
    CERT_QUERY_CONTENT_SERIALIZED_CTL     = 0x00000006,
    CERT_QUERY_CONTENT_SERIALIZED_CRL     = 0x00000007,
    CERT_QUERY_CONTENT_PKCS7_SIGNED       = 0x00000008,
    CERT_QUERY_CONTENT_PKCS7_UNSIGNED     = 0x00000009,
    CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED = 0x0000000a,
    CERT_QUERY_CONTENT_PKCS10             = 0x0000000b,
    CERT_QUERY_CONTENT_PFX                = 0x0000000c,
    CERT_QUERY_CONTENT_CERT_PAIR          = 0x0000000d,
    CERT_QUERY_CONTENT_PFX_AND_LOAD       = 0x0000000e,
}

alias CERT_QUERY_CONTENT_TYPE_FLAGS = uint;
enum : uint
{
    CERT_QUERY_CONTENT_FLAG_CERT               = 0x00000002,
    CERT_QUERY_CONTENT_FLAG_CTL                = 0x00000004,
    CERT_QUERY_CONTENT_FLAG_CRL                = 0x00000008,
    CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE   = 0x00000010,
    CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT    = 0x00000020,
    CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL     = 0x00000040,
    CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL     = 0x00000080,
    CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED       = 0x00000100,
    CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED     = 0x00000200,
    CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED = 0x00000400,
    CERT_QUERY_CONTENT_FLAG_PKCS10             = 0x00000800,
    CERT_QUERY_CONTENT_FLAG_PFX                = 0x00001000,
    CERT_QUERY_CONTENT_FLAG_CERT_PAIR          = 0x00002000,
    CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD       = 0x00004000,
    CERT_QUERY_CONTENT_FLAG_ALL                = 0x00003ffe,
    CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT    = 0x00000332,
}

alias CERT_QUERY_FORMAT_TYPE = uint;
enum : uint
{
    CERT_QUERY_FORMAT_BINARY                = 0x00000001,
    CERT_QUERY_FORMAT_BASE64_ENCODED        = 0x00000002,
    CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED = 0x00000003,
}

alias CERT_QUERY_FORMAT_TYPE_FLAGS = uint;
enum : uint
{
    CERT_QUERY_FORMAT_FLAG_BINARY                = 0x00000002,
    CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED        = 0x00000004,
    CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED = 0x00000008,
    CERT_QUERY_FORMAT_FLAG_ALL                   = 0x0000000e,
}

alias CERT_QUERY_ENCODING_TYPE = uint;
enum : uint
{
    X509_ASN_ENCODING   = 0x00000001,
    PKCS_7_ASN_ENCODING = 0x00010000,
}

alias CERT_RDN_ATTR_VALUE_TYPE = uint;
enum : uint
{
    CERT_RDN_ANY_TYPE         = 0x00000000,
    CERT_RDN_NUMERIC_STRING   = 0x00000003,
    CERT_RDN_PRINTABLE_STRING = 0x00000004,
    CERT_RDN_T61_STRING       = 0x00000005,
    CERT_RDN_VIDEOTEX_STRING  = 0x00000006,
    CERT_RDN_IA5_STRING       = 0x00000007,
    CERT_RDN_GRAPHIC_STRING   = 0x00000008,
    CERT_RDN_ISO646_STRING    = 0x00000009,
    CERT_RDN_GENERAL_STRING   = 0x0000000a,
    CERT_RDN_INT4_STRING      = 0x0000000b,
    CERT_RDN_UNICODE_STRING   = 0x0000000c,
    CERT_RDN_BMP_STRING       = 0x0000000c,
    CERT_RDN_ENCODED_BLOB     = 0x00000001,
    CERT_RDN_OCTET_STRING     = 0x00000002,
    CERT_RDN_TELETEX_STRING   = 0x00000005,
    CERT_RDN_UNIVERSAL_STRING = 0x0000000b,
    CERT_RDN_UTF8_STRING      = 0x0000000d,
    CERT_RDN_VISIBLE_STRING   = 0x00000009,
}

alias CERT_STRING_TYPE = uint;
enum : uint
{
    CERT_SIMPLE_NAME_STR = 0x00000001,
    CERT_OID_NAME_STR    = 0x00000002,
    CERT_X500_NAME_STR   = 0x00000003,
}

alias BCRYPT_TABLE = uint;
enum : uint
{
    CRYPT_LOCAL  = 0x00000001,
    CRYPT_DOMAIN = 0x00000002,
}

alias CERT_KEY_SPEC = uint;
enum : uint
{
    AT_KEYEXCHANGE       = 0x00000001,
    AT_SIGNATURE         = 0x00000002,
    CERT_NCRYPT_KEY_SPEC = 0xffffffff,
}

alias BCRYPT_INTERFACE = uint;
enum : uint
{
    BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 0x00000003,
    BCRYPT_CIPHER_INTERFACE                = 0x00000001,
    BCRYPT_HASH_INTERFACE                  = 0x00000002,
    BCRYPT_RNG_INTERFACE                   = 0x00000006,
    BCRYPT_SECRET_AGREEMENT_INTERFACE      = 0x00000004,
    BCRYPT_SIGNATURE_INTERFACE             = 0x00000005,
    NCRYPT_KEY_STORAGE_INTERFACE           = 0x00010001,
    NCRYPT_SCHANNEL_INTERFACE              = 0x00010002,
    NCRYPT_SCHANNEL_SIGNATURE_INTERFACE    = 0x00010003,
}

alias NCRYPT_FLAGS = uint;
enum : uint
{
    BCRYPT_PAD_NONE                       = 0x00000001,
    BCRYPT_PAD_OAEP                       = 0x00000004,
    BCRYPT_PAD_PKCS1                      = 0x00000002,
    BCRYPT_PAD_PSS                        = 0x00000008,
    NCRYPT_SILENT_FLAG                    = 0x00000040,
    NCRYPT_NO_PADDING_FLAG                = 0x00000001,
    NCRYPT_PAD_OAEP_FLAG                  = 0x00000004,
    NCRYPT_PAD_PKCS1_FLAG                 = 0x00000002,
    NCRYPT_REGISTER_NOTIFY_FLAG           = 0x00000001,
    NCRYPT_UNREGISTER_NOTIFY_FLAG         = 0x00000002,
    NCRYPT_MACHINE_KEY_FLAG               = 0x00000020,
    NCRYPT_UNPROTECT_NO_DECRYPT           = 0x00000001,
    NCRYPT_OVERWRITE_KEY_FLAG             = 0x00000080,
    NCRYPT_NO_KEY_VALIDATION              = 0x00000008,
    NCRYPT_WRITE_KEY_TO_LEGACY_STORE_FLAG = 0x00000200,
    NCRYPT_PAD_PSS_FLAG                   = 0x00000008,
    NCRYPT_PERSIST_FLAG                   = 0x80000000,
    NCRYPT_PERSIST_ONLY_FLAG              = 0x40000000,
}

alias CRYPT_STRING = uint;
enum : uint
{
    CRYPT_STRING_BASE64HEADER        = 0x00000000,
    CRYPT_STRING_BASE64              = 0x00000001,
    CRYPT_STRING_BINARY              = 0x00000002,
    CRYPT_STRING_BASE64REQUESTHEADER = 0x00000003,
    CRYPT_STRING_HEX                 = 0x00000004,
    CRYPT_STRING_HEXASCII            = 0x00000005,
    CRYPT_STRING_BASE64X509CRLHEADER = 0x00000009,
    CRYPT_STRING_HEXADDR             = 0x0000000a,
    CRYPT_STRING_HEXASCIIADDR        = 0x0000000b,
    CRYPT_STRING_HEXRAW              = 0x0000000c,
    CRYPT_STRING_STRICT              = 0x20000000,
    CRYPT_STRING_BASE64_ANY          = 0x00000006,
    CRYPT_STRING_ANY                 = 0x00000007,
    CRYPT_STRING_HEX_ANY             = 0x00000008,
}

alias CRYPT_IMPORT_PUBLIC_KEY_FLAGS = uint;
enum : uint
{
    CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG    = 0x80000000,
    CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG = 0x40000000,
}

alias CRYPT_XML_FLAGS = uint;
enum : uint
{
    CRYPT_XML_FLAG_DISABLE_EXTENSIONS = 0x10000000,
    CRYPT_XML_FLAG_NO_SERIALIZE       = 0x80000000,
    CRYPT_XML_SIGN_ADD_KEYVALUE       = 0x00000001,
}

alias CRYPT_ENCODE_OBJECT_FLAGS = uint;
enum : uint
{
    CRYPT_ENCODE_ALLOC_FLAG                            = 0x00008000,
    CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG                  = 0x00020000,
    CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG  = 0x40000000,
    CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG  = 0x80000000,
    CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG = 0x20000000,
}

alias CRYPT_OBJECT_LOCATOR_RELEASE_REASON = uint;
enum : uint
{
    CRYPT_OBJECT_LOCATOR_RELEASE_SYSTEM_SHUTDOWN = 0x00000001,
    CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP    = 0x00000002,
    CRYPT_OBJECT_LOCATOR_RELEASE_PROCESS_EXIT    = 0x00000003,
    CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD      = 0x00000004,
}

alias CRYPT_ACQUIRE_FLAGS = uint;
enum : uint
{
    CRYPT_ACQUIRE_CACHE_FLAG         = 0x00000001,
    CRYPT_ACQUIRE_COMPARE_KEY_FLAG   = 0x00000004,
    CRYPT_ACQUIRE_NO_HEALING         = 0x00000008,
    CRYPT_ACQUIRE_SILENT_FLAG        = 0x00000040,
    CRYPT_ACQUIRE_USE_PROV_INFO_FLAG = 0x00000002,
}

alias CRYPT_GET_URL_FLAGS = uint;
enum : uint
{
    CRYPT_GET_URL_FROM_PROPERTY         = 0x00000001,
    CRYPT_GET_URL_FROM_EXTENSION        = 0x00000002,
    CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE = 0x00000004,
    CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE   = 0x00000008,
}

alias CERT_STORE_SAVE_AS = uint;
enum : uint
{
    CERT_STORE_SAVE_AS_PKCS7 = 0x00000002,
    CERT_STORE_SAVE_AS_STORE = 0x00000001,
}

alias BCRYPT_QUERY_PROVIDER_MODE = uint;
enum : uint
{
    CRYPT_ANY = 0x00000004,
    CRYPT_UM  = 0x00000001,
    CRYPT_KM  = 0x00000002,
    CRYPT_MM  = 0x00000003,
}

alias CERT_FIND_CHAIN_IN_STORE_FLAGS = uint;
enum : uint
{
    CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG    = 0x00000001,
    CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG  = 0x00000002,
    CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG     = 0x00008000,
    CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG = 0x00000004,
    CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG  = 0x00000008,
    CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG         = 0x00004000,
}

alias CERT_CONTROL_STORE_FLAGS = uint;
enum : uint
{
    CERT_STORE_CTRL_COMMIT_FORCE_FLAG             = 0x00000001,
    CERT_STORE_CTRL_COMMIT_CLEAR_FLAG             = 0x00000002,
    CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG = 0x00000001,
}

alias BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS = uint;
enum : uint
{
    BCRYPT_ALG_HANDLE_HMAC_FLAG = 0x00000008,
    BCRYPT_PROV_DISPATCH        = 0x00000001,
    BCRYPT_HASH_REUSABLE_FLAG   = 0x00000020,
}

alias CERT_STORE_SAVE_TO = uint;
enum : uint
{
    CERT_STORE_SAVE_TO_FILE       = 0x00000001,
    CERT_STORE_SAVE_TO_FILENAME   = 0x00000004,
    CERT_STORE_SAVE_TO_FILENAME_A = 0x00000003,
    CERT_STORE_SAVE_TO_FILENAME_W = 0x00000004,
    CERT_STORE_SAVE_TO_MEMORY     = 0x00000002,
}

alias CRYPT_SET_PROV_PARAM_ID = uint;
enum : uint
{
    PP_CLIENT_HWND            = 0x00000001,
    PP_DELETEKEY              = 0x00000018,
    PP_KEYEXCHANGE_ALG        = 0x0000000e,
    PP_KEYEXCHANGE_PIN        = 0x00000020,
    PP_KEYEXCHANGE_KEYSIZE    = 0x0000000c,
    PP_KEYSET_SEC_DESCR       = 0x00000008,
    PP_PIN_PROMPT_STRING      = 0x0000002c,
    PP_ROOT_CERTSTORE         = 0x0000002e,
    PP_SIGNATURE_ALG          = 0x0000000f,
    PP_SIGNATURE_PIN          = 0x00000021,
    PP_SIGNATURE_KEYSIZE      = 0x0000000d,
    PP_UI_PROMPT              = 0x00000015,
    PP_USE_HARDWARE_RNG       = 0x00000026,
    PP_USER_CERTSTORE         = 0x0000002a,
    PP_SECURE_KEYEXCHANGE_PIN = 0x0000002f,
    PP_SECURE_SIGNATURE_PIN   = 0x00000030,
    PP_SMARTCARD_READER       = 0x0000002b,
}

alias CRYPT_KEY_PARAM_ID = uint;
enum : uint
{
    KP_ALGID         = 0x00000007,
    KP_CERTIFICATE   = 0x0000001a,
    KP_PERMISSIONS   = 0x00000006,
    KP_SALT          = 0x00000002,
    KP_SALT_EX       = 0x0000000a,
    KP_BLOCKLEN      = 0x00000008,
    KP_GET_USE_COUNT = 0x0000002a,
    KP_KEYLEN        = 0x00000009,
}

alias CRYPT_KEY_FLAGS = uint;
enum : uint
{
    CRYPT_EXPORTABLE                   = 0x00000001,
    CRYPT_USER_PROTECTED               = 0x00000002,
    CRYPT_ARCHIVABLE                   = 0x00004000,
    CRYPT_CREATE_IV                    = 0x00000200,
    CRYPT_CREATE_SALT                  = 0x00000004,
    CRYPT_DATA_KEY                     = 0x00000800,
    CRYPT_FORCE_KEY_PROTECTION_HIGH    = 0x00008000,
    CRYPT_KEK                          = 0x00000400,
    CRYPT_INITIATOR                    = 0x00000040,
    CRYPT_NO_SALT                      = 0x00000010,
    CRYPT_ONLINE                       = 0x00000080,
    CRYPT_PREGEN                       = 0x00000040,
    CRYPT_RECIPIENT                    = 0x00000010,
    CRYPT_SF                           = 0x00000100,
    CRYPT_SGCKEY                       = 0x00002000,
    CRYPT_VOLATILE                     = 0x00001000,
    CRYPT_MACHINE_KEYSET               = 0x00000020,
    CRYPT_USER_KEYSET                  = 0x00001000,
    PKCS12_PREFER_CNG_KSP              = 0x00000100,
    PKCS12_ALWAYS_CNG_KSP              = 0x00000200,
    PKCS12_ALLOW_OVERWRITE_KEY         = 0x00004000,
    PKCS12_NO_PERSIST_KEY              = 0x00008000,
    PKCS12_INCLUDE_EXTENDED_PROPERTIES = 0x00000010,
    CRYPT_OAEP                         = 0x00000040,
    CRYPT_BLOB_VER3                    = 0x00000080,
    CRYPT_DESTROYKEY                   = 0x00000004,
    CRYPT_SSL2_FALLBACK                = 0x00000002,
    CRYPT_Y_ONLY                       = 0x00000001,
    CRYPT_IPSEC_HMAC_KEY               = 0x00000100,
    CERT_SET_KEY_PROV_HANDLE_PROP_ID   = 0x00000001,
    CERT_SET_KEY_CONTEXT_PROP_ID       = 0x00000001,
}

alias CRYPT_MSG_TYPE = uint;
enum : uint
{
    CMSG_DATA                 = 0x00000001,
    CMSG_SIGNED               = 0x00000002,
    CMSG_ENVELOPED            = 0x00000003,
    CMSG_SIGNED_AND_ENVELOPED = 0x00000004,
    CMSG_HASHED               = 0x00000005,
}

alias CERT_OPEN_STORE_FLAGS = uint;
enum : uint
{
    CERT_STORE_BACKUP_RESTORE_FLAG              = 0x00000800,
    CERT_STORE_CREATE_NEW_FLAG                  = 0x00002000,
    CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG = 0x00000004,
    CERT_STORE_DELETE_FLAG                      = 0x00000010,
    CERT_STORE_ENUM_ARCHIVED_FLAG               = 0x00000200,
    CERT_STORE_MAXIMUM_ALLOWED_FLAG             = 0x00001000,
    CERT_STORE_NO_CRYPT_RELEASE_FLAG            = 0x00000001,
    CERT_STORE_OPEN_EXISTING_FLAG               = 0x00004000,
    CERT_STORE_READONLY_FLAG                    = 0x00008000,
    CERT_STORE_SET_LOCALIZED_NAME_FLAG          = 0x00000002,
    CERT_STORE_SHARE_CONTEXT_FLAG               = 0x00000080,
    CERT_STORE_UPDATE_KEYID_FLAG                = 0x00000400,
}

alias CRYPT_DEFAULT_CONTEXT_FLAGS = uint;
enum : uint
{
    CRYPT_DEFAULT_CONTEXT_AUTO_RELEASE_FLAG = 0x00000001,
    CRYPT_DEFAULT_CONTEXT_PROCESS_FLAG      = 0x00000002,
}

alias CRYPT_VERIFY_CERT_FLAGS = uint;
enum : uint
{
    CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG          = 0x00000001,
    CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG    = 0x00000002,
    CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG = 0x00000004,
}

alias CRYPT_SET_HASH_PARAM = uint;
enum : uint
{
    HP_HMAC_INFO = 0x00000005,
    HP_HASHVAL   = 0x00000002,
}

alias CERT_SYSTEM_STORE_FLAGS = uint;
enum : uint
{
    CERT_SYSTEM_STORE_LOCATION_MASK = 0x00ff0000,
    CERT_SYSTEM_STORE_RELOCATE_FLAG = 0x80000000,
}

alias CERT_CREATE_SELFSIGN_FLAGS = uint;
enum : uint
{
    CERT_CREATE_SELFSIGN_NO_KEY_INFO = 0x00000002,
    CERT_CREATE_SELFSIGN_NO_SIGN     = 0x00000001,
}

alias CRYPT_DEFAULT_CONTEXT_TYPE = uint;
enum : uint
{
    CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID       = 0x00000001,
    CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID = 0x00000002,
}

alias BCRYPT_RESOLVE_PROVIDERS_FLAGS = uint;
enum : uint
{
    CRYPT_ALL_FUNCTIONS = 0x00000001,
    CRYPT_ALL_PROVIDERS = 0x00000002,
}

alias CERT_FIND_TYPE = uint;
enum : uint
{
    CTL_FIND_ANY             = 0x00000000,
    CTL_FIND_SHA1_HASH       = 0x00000001,
    CTL_FIND_MD5_HASH        = 0x00000002,
    CTL_FIND_USAGE           = 0x00000003,
    CTL_FIND_SAME_USAGE_FLAG = 0x00000001,
    CTL_FIND_EXISTING        = 0x00000005,
    CTL_FIND_SUBJECT         = 0x00000004,
}

alias CRYPT_FIND_FLAGS = uint;
enum : uint
{
    CRYPT_FIND_USER_KEYSET_FLAG    = 0x00000001,
    CRYPT_FIND_MACHINE_KEYSET_FLAG = 0x00000002,
    CRYPT_FIND_SILENT_KEYSET_FLAG  = 0x00000040,
}

alias CRYPT_IMAGE_REF_FLAGS = uint;
enum : uint
{
    CRYPT_MIN_DEPENDENCIES = 0x00000001,
    CRYPT_PROCESS_ISOLATE  = 0x00010000,
}

alias CERT_REVOCATION_STATUS_REASON = uint;
enum : uint
{
    CRL_REASON_UNSPECIFIED            = 0x00000000,
    CRL_REASON_KEY_COMPROMISE         = 0x00000001,
    CRL_REASON_CA_COMPROMISE          = 0x00000002,
    CRL_REASON_AFFILIATION_CHANGED    = 0x00000003,
    CRL_REASON_SUPERSEDED             = 0x00000004,
    CRL_REASON_CESSATION_OF_OPERATION = 0x00000005,
    CRL_REASON_CERTIFICATE_HOLD       = 0x00000006,
    CRL_REASON_REMOVE_FROM_CRL        = 0x00000008,
}

alias CERT_ROOT_PROGRAM_FLAGS = uint;
enum : uint
{
    CERT_ROOT_PROGRAM_FLAG_LSC          = 0x00000040,
    CERT_ROOT_PROGRAM_FLAG_ORG          = 0x00000080,
    CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO = 0x00000020,
}

alias CRYPT_XML_KEY_VALUE_TYPE = uint;
enum : uint
{
    CRYPT_XML_KEY_VALUE_TYPE_DSA    = 0x00000001,
    CRYPT_XML_KEY_VALUE_TYPE_RSA    = 0x00000002,
    CRYPT_XML_KEY_VALUE_TYPE_ECDSA  = 0x00000003,
    CRYPT_XML_KEY_VALUE_TYPE_CUSTOM = 0x00000004,
}

alias CERT_LOGOTYPE_CHOICE = uint;
enum : uint
{
    CERT_LOGOTYPE_NO_IMAGE_RESOLUTION_CHOICE         = 0x00000000,
    CERT_LOGOTYPE_BITS_IMAGE_RESOLUTION_CHOICE       = 0x00000001,
    CERT_LOGOTYPE_TABLE_SIZE_IMAGE_RESOLUTION_CHOICE = 0x00000002,
}

alias CMSG_KEY_AGREE_OPTION = uint;
enum : uint
{
    CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE = 0x00000001,
    CMSG_KEY_AGREE_STATIC_KEY_CHOICE    = 0x00000002,
}

alias CERT_LOGOTYPE_OPTION = uint;
enum : uint
{
    CERT_LOGOTYPE_DIRECT_INFO_CHOICE   = 0x00000001,
    CERT_LOGOTYPE_INDIRECT_INFO_CHOICE = 0x00000002,
}

alias CERT_STORE_PROV_FLAGS = uint;
enum : uint
{
    CERT_STORE_PROV_EXTERNAL_FLAG        = 0x00000001,
    CERT_STORE_PROV_DELETED_FLAG         = 0x00000002,
    CERT_STORE_PROV_NO_PERSIST_FLAG      = 0x00000004,
    CERT_STORE_PROV_SYSTEM_STORE_FLAG    = 0x00000008,
    CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG = 0x00000010,
}

alias CMSG_KEY_AGREE_ORIGINATOR = uint;
enum : uint
{
    CMSG_KEY_AGREE_ORIGINATOR_CERT       = 0x00000001,
    CMSG_KEY_AGREE_ORIGINATOR_PUBLIC_KEY = 0x00000002,
}

alias CRYPT_CONTEXT_CONFIG_FLAGS = uint;
enum : uint
{
    CRYPT_EXCLUSIVE = 0x00000001,
    CRYPT_OVERRIDE  = 0x00010000,
}

alias BCRYPT_DSA_MAGIC = uint;
enum : uint
{
    BCRYPT_DSA_PUBLIC_MAGIC  = 0x42505344,
    BCRYPT_DSA_PRIVATE_MAGIC = 0x56505344,
}

alias CRYPT_XML_X509DATA_TYPE = uint;
enum : uint
{
    CRYPT_XML_X509DATA_TYPE_ISSUER_SERIAL = 0x00000001,
    CRYPT_XML_X509DATA_TYPE_SKI           = 0x00000002,
    CRYPT_XML_X509DATA_TYPE_SUBJECT_NAME  = 0x00000003,
    CRYPT_XML_X509DATA_TYPE_CERTIFICATE   = 0x00000004,
    CRYPT_XML_X509DATA_TYPE_CRL           = 0x00000005,
    CRYPT_XML_X509DATA_TYPE_CUSTOM        = 0x00000006,
}

alias CERT_BIOMETRIC_DATA_TYPE = uint;
enum : uint
{
    CERT_BIOMETRIC_PREDEFINED_DATA_CHOICE = 0x00000001,
    CERT_BIOMETRIC_OID_DATA_CHOICE        = 0x00000002,
}

alias CERT_CHAIN_POLICY_FLAGS = uint;
enum : uint
{
    CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG             = 0x00000001,
    CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG         = 0x00000002,
    CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG            = 0x00000004,
    CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS        = 0x00000007,
    CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG  = 0x00000008,
    CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG                  = 0x00000010,
    CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG                = 0x00000020,
    CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG               = 0x00000040,
    CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG             = 0x00000080,
    CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG            = 0x00000100,
    CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG     = 0x00000200,
    CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG             = 0x00000400,
    CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG           = 0x00000800,
    CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS           = 0x00000f00,
    CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG                    = 0x00008000,
    CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG                    = 0x00004000,
    CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG = 0x00002000,
    CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG                 = 0x00001000,
}

alias CERT_STRONG_SIGN_FLAGS = uint;
enum : uint
{
    CERT_STRONG_SIGN_ENABLE_CRL_CHECK  = 0x00000001,
    CERT_STRONG_SIGN_ENABLE_OCSP_CHECK = 0x00000002,
}

alias CERT_LOGOTYPE_IMAGE_INFO_TYPE = uint;
enum : uint
{
    CERT_LOGOTYPE_GRAY_SCALE_IMAGE_INFO_CHOICE = 0x00000001,
    CERT_LOGOTYPE_COLOR_IMAGE_INFO_CHOICE      = 0x00000002,
}

alias CRYPT_XML_STATUS_INFO_STATUS = uint;
enum : uint
{
    CRYPT_XML_STATUS_INTERNAL_REFERENCE = 0x00000001,
    CRYPT_XML_STATUS_KEY_AVAILABLE      = 0x00000002,
    CRYPT_XML_STATUS_DIGESTING          = 0x00000004,
    CRYPT_XML_STATUS_DIGEST_VALID       = 0x00000008,
    CRYPT_XML_STATUS_SIGNATURE_VALID    = 0x00010000,
    CRYPT_XML_STATUS_OPENED_TO_ENCODE   = 0x80000000,
}

alias CRYPT_XML_TRANSFORM_FLAGS = uint;
enum : uint
{
    CRYPT_XML_TRANSFORM_ON_STREAM        = 0x00000001,
    CRYPT_XML_TRANSFORM_ON_NODESET       = 0x00000002,
    CRYPT_XML_TRANSFORM_URI_QUERY_STRING = 0x00000003,
}

alias CRYPT_XML_GROUP_ID = uint;
enum : uint
{
    CRYPT_XML_GROUP_ID_HASH = 0x00000001,
    CRYPT_XML_GROUP_ID_SIGN = 0x00000002,
}

alias CERT_SELECT_CRITERIA_TYPE = uint;
enum : uint
{
    CERT_SELECT_BY_ENHKEY_USAGE      = 0x00000001,
    CERT_SELECT_BY_KEY_USAGE         = 0x00000002,
    CERT_SELECT_BY_POLICY_OID        = 0x00000003,
    CERT_SELECT_BY_PROV_NAME         = 0x00000004,
    CERT_SELECT_BY_EXTENSION         = 0x00000005,
    CERT_SELECT_BY_SUBJECT_HOST_NAME = 0x00000006,
    CERT_SELECT_BY_ISSUER_ATTR       = 0x00000007,
    CERT_SELECT_BY_SUBJECT_ATTR      = 0x00000008,
    CERT_SELECT_BY_ISSUER_NAME       = 0x00000009,
    CERT_SELECT_BY_PUBLIC_KEY        = 0x0000000a,
    CERT_SELECT_BY_TLS_SIGNATURES    = 0x0000000b,
}

alias BCRYPT_RSAKEY_BLOB_MAGIC = uint;
enum : uint
{
    BCRYPT_RSAPUBLIC_MAGIC      = 0x31415352,
    BCRYPT_RSAPRIVATE_MAGIC     = 0x32415352,
    BCRYPT_RSAFULLPRIVATE_MAGIC = 0x33415352,
}

alias CRYPT_XML_KEYINFO_TYPE = uint;
enum : uint
{
    CRYPT_XML_KEYINFO_TYPE_KEYNAME   = 0x00000001,
    CRYPT_XML_KEYINFO_TYPE_KEYVALUE  = 0x00000002,
    CRYPT_XML_KEYINFO_TYPE_RETRIEVAL = 0x00000003,
    CRYPT_XML_KEYINFO_TYPE_X509DATA  = 0x00000004,
    CRYPT_XML_KEYINFO_TYPE_CUSTOM    = 0x00000005,
}

alias CRYPT_TIMESTAMP_VERSION = uint;
enum : uint
{
    TIMESTAMP_VERSION = 0x00000001,
}

alias CERT_ID_OPTION = uint;
enum : uint
{
    CERT_ID_ISSUER_SERIAL_NUMBER = 0x00000001,
    CERT_ID_KEY_IDENTIFIER       = 0x00000002,
    CERT_ID_SHA1_HASH            = 0x00000003,
}

alias HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE = uint;
enum : uint
{
    AUTHTYPE_CLIENT = 0x00000001,
    AUTHTYPE_SERVER = 0x00000002,
}

alias BCRYPT_DH_KEY_BLOB_MAGIC = uint;
enum : uint
{
    BCRYPT_DH_PUBLIC_MAGIC  = 0x42504844,
    BCRYPT_DH_PRIVATE_MAGIC = 0x56504844,
}

alias CRYPT_XML_STATUS_ERROR_STATUS = uint;
enum : uint
{
    CRYPT_XML_STATUS_ERROR_NOT_RESOLVED            = 0x00000001,
    CRYPT_XML_STATUS_ERROR_DIGEST_INVALID          = 0x00000002,
    CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_ALGORITHM = 0x00000005,
    CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_TRANSFORM = 0x00000008,
    CRYPT_XML_STATUS_ERROR_SIGNATURE_INVALID       = 0x00010000,
    CRYPT_XML_STATUS_ERROR_KEYINFO_NOT_PARSED      = 0x00020000,
}

alias CRYPT_TIMESTAMP_RESPONSE_STATUS = uint;
enum : uint
{
    TIMESTAMP_STATUS_GRANTED            = 0x00000000,
    TIMESTAMP_STATUS_GRANTED_WITH_MODS  = 0x00000001,
    TIMESTAMP_STATUS_REJECTED           = 0x00000002,
    TIMESTAMP_STATUS_WAITING            = 0x00000003,
    TIMESTAMP_STATUS_REVOCATION_WARNING = 0x00000004,
    TIMESTAMP_STATUS_REVOKED            = 0x00000005,
}

alias NCRYPT_ALGORITHM_NAME_CLASS = uint;
enum : uint
{
    NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 0x00000003,
    NCRYPT_SECRET_AGREEMENT_INTERFACE      = 0x00000004,
    NCRYPT_SIGNATURE_INTERFACE             = 0x00000005,
}

BOOL CryptAcquireContextA(ulong*, const(char)*, const(char)*, uint, uint);
BOOL CryptAcquireContextW(ulong*, const(wchar)*, const(wchar)*, uint, uint);
BOOL CryptReleaseContext(ulong, uint);
BOOL CryptGenKey(ulong, uint, CRYPT_KEY_FLAGS, ulong*);
BOOL CryptDeriveKey(ulong, uint, ulong, uint, ulong*);
BOOL CryptDestroyKey(ulong);
BOOL CryptSetKeyParam(ulong, CRYPT_KEY_PARAM_ID, const(ubyte)*, uint);
BOOL CryptGetKeyParam(ulong, CRYPT_KEY_PARAM_ID, ubyte*, uint*, uint);
BOOL CryptSetHashParam(ulong, CRYPT_SET_HASH_PARAM, const(ubyte)*, uint);
BOOL CryptGetHashParam(ulong, uint, ubyte*, uint*, uint);
BOOL CryptSetProvParam(ulong, CRYPT_SET_PROV_PARAM_ID, const(ubyte)*, uint);
BOOL CryptGetProvParam(ulong, uint, ubyte*, uint*, uint);
BOOL CryptGenRandom(ulong, uint, ubyte*);
BOOL CryptGetUserKey(ulong, uint, ulong*);
BOOL CryptExportKey(ulong, ulong, uint, CRYPT_KEY_FLAGS, ubyte*, uint*);
BOOL CryptImportKey(ulong, const(ubyte)*, uint, ulong, CRYPT_KEY_FLAGS, ulong*);
BOOL CryptEncrypt(ulong, ulong, BOOL, uint, ubyte*, uint*, uint);
BOOL CryptDecrypt(ulong, ulong, BOOL, uint, ubyte*, uint*);
BOOL CryptCreateHash(ulong, uint, ulong, uint, ulong*);
BOOL CryptHashData(ulong, const(ubyte)*, uint, uint);
BOOL CryptHashSessionKey(ulong, ulong, uint);
BOOL CryptDestroyHash(ulong);
BOOL CryptSignHashA(ulong, uint, const(char)*, uint, ubyte*, uint*);
BOOL CryptSignHashW(ulong, uint, const(wchar)*, uint, ubyte*, uint*);
BOOL CryptVerifySignatureA(ulong, const(ubyte)*, uint, ulong, const(char)*, uint);
BOOL CryptVerifySignatureW(ulong, const(ubyte)*, uint, ulong, const(wchar)*, uint);
BOOL CryptSetProviderA(const(char)*, uint);
BOOL CryptSetProviderW(const(wchar)*, uint);
BOOL CryptSetProviderExA(const(char)*, uint, uint*, uint);
BOOL CryptSetProviderExW(const(wchar)*, uint, uint*, uint);
BOOL CryptGetDefaultProviderA(uint, uint*, uint, PSTR, uint*);
BOOL CryptGetDefaultProviderW(uint, uint*, uint, PWSTR, uint*);
BOOL CryptEnumProviderTypesA(uint, uint*, uint, uint*, PSTR, uint*);
BOOL CryptEnumProviderTypesW(uint, uint*, uint, uint*, PWSTR, uint*);
BOOL CryptEnumProvidersA(uint, uint*, uint, uint*, PSTR, uint*);
BOOL CryptEnumProvidersW(uint, uint*, uint, uint*, PWSTR, uint*);
BOOL CryptContextAddRef(ulong, uint*, uint);
BOOL CryptDuplicateKey(ulong, uint*, uint, ulong*);
BOOL CryptDuplicateHash(ulong, uint*, uint, ulong*);
NTSTATUS BCryptOpenAlgorithmProvider(BCRYPT_ALG_HANDLE*, const(wchar)*, const(wchar)*, BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS);
NTSTATUS BCryptEnumAlgorithms(BCRYPT_OPERATION, uint*, BCRYPT_ALGORITHM_IDENTIFIER**, uint);
NTSTATUS BCryptEnumProviders(const(wchar)*, uint*, BCRYPT_PROVIDER_NAME**, uint);
NTSTATUS BCryptGetProperty(BCRYPT_HANDLE, const(wchar)*, ubyte*, uint, uint*, uint);
NTSTATUS BCryptSetProperty(BCRYPT_HANDLE, const(wchar)*, ubyte*, uint, uint);
NTSTATUS BCryptCloseAlgorithmProvider(BCRYPT_ALG_HANDLE, uint);
void BCryptFreeBuffer(void*);
NTSTATUS BCryptGenerateSymmetricKey(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE*, ubyte*, uint, ubyte*, uint, uint);
NTSTATUS BCryptGenerateKeyPair(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE*, uint, uint);
NTSTATUS BCryptEncrypt(BCRYPT_KEY_HANDLE, ubyte*, uint, void*, ubyte*, uint, ubyte*, uint, uint*, NCRYPT_FLAGS);
NTSTATUS BCryptDecrypt(BCRYPT_KEY_HANDLE, ubyte*, uint, void*, ubyte*, uint, ubyte*, uint, uint*, NCRYPT_FLAGS);
NTSTATUS BCryptExportKey(BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE, const(wchar)*, ubyte*, uint, uint*, uint);
NTSTATUS BCryptImportKey(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, const(wchar)*, BCRYPT_KEY_HANDLE*, ubyte*, uint, ubyte*, uint, uint);
NTSTATUS BCryptImportKeyPair(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, const(wchar)*, BCRYPT_KEY_HANDLE*, ubyte*, uint, uint);
NTSTATUS BCryptDuplicateKey(BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE*, ubyte*, uint, uint);
NTSTATUS BCryptFinalizeKeyPair(BCRYPT_KEY_HANDLE, uint);
NTSTATUS BCryptDestroyKey(BCRYPT_KEY_HANDLE);
NTSTATUS BCryptDestroySecret(BCRYPT_SECRET_HANDLE);
NTSTATUS BCryptSignHash(BCRYPT_KEY_HANDLE, void*, ubyte*, uint, ubyte*, uint, uint*, NCRYPT_FLAGS);
NTSTATUS BCryptVerifySignature(BCRYPT_KEY_HANDLE, void*, ubyte*, uint, ubyte*, uint, NCRYPT_FLAGS);
NTSTATUS BCryptSecretAgreement(BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE, BCRYPT_SECRET_HANDLE*, uint);
NTSTATUS BCryptDeriveKey(BCRYPT_SECRET_HANDLE, const(wchar)*, BCryptBufferDesc*, ubyte*, uint, uint*, uint);
NTSTATUS BCryptKeyDerivation(BCRYPT_KEY_HANDLE, BCryptBufferDesc*, ubyte*, uint, uint*, uint);
NTSTATUS BCryptCreateHash(BCRYPT_ALG_HANDLE, BCRYPT_HASH_HANDLE*, ubyte*, uint, ubyte*, uint, uint);
NTSTATUS BCryptHashData(BCRYPT_HASH_HANDLE, ubyte*, uint, uint);
NTSTATUS BCryptFinishHash(BCRYPT_HASH_HANDLE, ubyte*, uint, uint);
NTSTATUS BCryptCreateMultiHash(BCRYPT_ALG_HANDLE, BCRYPT_HASH_HANDLE*, uint, ubyte*, uint, ubyte*, uint, uint);
NTSTATUS BCryptProcessMultiOperations(BCRYPT_HANDLE, BCRYPT_MULTI_OPERATION_TYPE, void*, uint, uint);
NTSTATUS BCryptDuplicateHash(BCRYPT_HASH_HANDLE, BCRYPT_HASH_HANDLE*, ubyte*, uint, uint);
NTSTATUS BCryptDestroyHash(BCRYPT_HASH_HANDLE);
NTSTATUS BCryptHash(BCRYPT_ALG_HANDLE, ubyte*, uint, ubyte*, uint, ubyte*, uint);
NTSTATUS BCryptGenRandom(BCRYPT_ALG_HANDLE, ubyte*, uint, uint);
NTSTATUS BCryptDeriveKeyCapi(BCRYPT_HASH_HANDLE, BCRYPT_ALG_HANDLE, ubyte*, uint, uint);
NTSTATUS BCryptDeriveKeyPBKDF2(BCRYPT_ALG_HANDLE, ubyte*, uint, ubyte*, uint, ulong, ubyte*, uint, uint);
NTSTATUS BCryptQueryProviderRegistration(const(wchar)*, BCRYPT_QUERY_PROVIDER_MODE, BCRYPT_INTERFACE, uint*, CRYPT_PROVIDER_REG**);
NTSTATUS BCryptEnumRegisteredProviders(uint*, CRYPT_PROVIDERS**);
NTSTATUS BCryptCreateContext(BCRYPT_TABLE, const(wchar)*, CRYPT_CONTEXT_CONFIG*);
NTSTATUS BCryptDeleteContext(BCRYPT_TABLE, const(wchar)*);
NTSTATUS BCryptEnumContexts(BCRYPT_TABLE, uint*, CRYPT_CONTEXTS**);
NTSTATUS BCryptConfigureContext(BCRYPT_TABLE, const(wchar)*, CRYPT_CONTEXT_CONFIG*);
NTSTATUS BCryptQueryContextConfiguration(BCRYPT_TABLE, const(wchar)*, uint*, CRYPT_CONTEXT_CONFIG**);
NTSTATUS BCryptAddContextFunction(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, uint);
NTSTATUS BCryptRemoveContextFunction(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*);
NTSTATUS BCryptEnumContextFunctions(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, uint*, CRYPT_CONTEXT_FUNCTIONS**);
NTSTATUS BCryptConfigureContextFunction(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, CRYPT_CONTEXT_FUNCTION_CONFIG*);
NTSTATUS BCryptQueryContextFunctionConfiguration(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, uint*, CRYPT_CONTEXT_FUNCTION_CONFIG**);
NTSTATUS BCryptEnumContextFunctionProviders(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, uint*, CRYPT_CONTEXT_FUNCTION_PROVIDERS**);
NTSTATUS BCryptSetContextFunctionProperty(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, const(wchar)*, uint, ubyte*);
NTSTATUS BCryptQueryContextFunctionProperty(BCRYPT_TABLE, const(wchar)*, BCRYPT_INTERFACE, const(wchar)*, const(wchar)*, uint*, ubyte**);
NTSTATUS BCryptRegisterConfigChangeNotify(HANDLE*);
NTSTATUS BCryptUnregisterConfigChangeNotify(HANDLE);
NTSTATUS BCryptResolveProviders(const(wchar)*, uint, const(wchar)*, const(wchar)*, BCRYPT_QUERY_PROVIDER_MODE, BCRYPT_RESOLVE_PROVIDERS_FLAGS, uint*, CRYPT_PROVIDER_REFS**);
NTSTATUS BCryptGetFipsAlgorithmMode(ubyte*);
HRESULT NCryptOpenStorageProvider(NCRYPT_PROV_HANDLE*, const(wchar)*, uint);
HRESULT NCryptEnumAlgorithms(NCRYPT_PROV_HANDLE, NCRYPT_OPERATION, uint*, NCryptAlgorithmName**, uint);
HRESULT NCryptIsAlgSupported(NCRYPT_PROV_HANDLE, const(wchar)*, uint);
HRESULT NCryptEnumKeys(NCRYPT_PROV_HANDLE, const(wchar)*, NCryptKeyName**, void**, NCRYPT_FLAGS);
HRESULT NCryptEnumStorageProviders(uint*, NCryptProviderName**, uint);
HRESULT NCryptFreeBuffer(void*);
HRESULT NCryptOpenKey(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE*, const(wchar)*, CERT_KEY_SPEC, NCRYPT_FLAGS);
HRESULT NCryptCreatePersistedKey(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE*, const(wchar)*, const(wchar)*, CERT_KEY_SPEC, NCRYPT_FLAGS);
HRESULT NCryptGetProperty(NCRYPT_HANDLE, const(wchar)*, ubyte*, uint, uint*, OBJECT_SECURITY_INFORMATION);
HRESULT NCryptSetProperty(NCRYPT_HANDLE, const(wchar)*, ubyte*, uint, NCRYPT_FLAGS);
HRESULT NCryptFinalizeKey(NCRYPT_KEY_HANDLE, NCRYPT_FLAGS);
HRESULT NCryptEncrypt(NCRYPT_KEY_HANDLE, ubyte*, uint, void*, ubyte*, uint, uint*, NCRYPT_FLAGS);
HRESULT NCryptDecrypt(NCRYPT_KEY_HANDLE, ubyte*, uint, void*, ubyte*, uint, uint*, NCRYPT_FLAGS);
HRESULT NCryptImportKey(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, const(wchar)*, BCryptBufferDesc*, NCRYPT_KEY_HANDLE*, ubyte*, uint, NCRYPT_FLAGS);
HRESULT NCryptExportKey(NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, const(wchar)*, BCryptBufferDesc*, ubyte*, uint, uint*, NCRYPT_FLAGS);
HRESULT NCryptSignHash(NCRYPT_KEY_HANDLE, void*, ubyte*, uint, ubyte*, uint, uint*, NCRYPT_FLAGS);
HRESULT NCryptVerifySignature(NCRYPT_KEY_HANDLE, void*, ubyte*, uint, ubyte*, uint, NCRYPT_FLAGS);
HRESULT NCryptDeleteKey(NCRYPT_KEY_HANDLE, uint);
HRESULT NCryptFreeObject(NCRYPT_HANDLE);
BOOL NCryptIsKeyHandle(NCRYPT_KEY_HANDLE);
HRESULT NCryptTranslateHandle(NCRYPT_PROV_HANDLE*, NCRYPT_KEY_HANDLE*, ulong, ulong, CERT_KEY_SPEC, uint);
HRESULT NCryptNotifyChangeKey(NCRYPT_PROV_HANDLE, HANDLE*, NCRYPT_FLAGS);
HRESULT NCryptSecretAgreement(NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_SECRET_HANDLE*, NCRYPT_FLAGS);
HRESULT NCryptDeriveKey(NCRYPT_SECRET_HANDLE, const(wchar)*, BCryptBufferDesc*, ubyte*, uint, uint*, uint);
HRESULT NCryptKeyDerivation(NCRYPT_KEY_HANDLE, BCryptBufferDesc*, ubyte*, uint, uint*, uint);
HRESULT NCryptCreateClaim(NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, uint, BCryptBufferDesc*, ubyte*, uint, uint*, uint);
HRESULT NCryptVerifyClaim(NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, uint, BCryptBufferDesc*, ubyte*, uint, BCryptBufferDesc*, uint);
BOOL CryptFormatObject(CERT_QUERY_ENCODING_TYPE, uint, uint, void*, const(char)*, const(ubyte)*, uint, void*, uint*);
BOOL CryptEncodeObjectEx(CERT_QUERY_ENCODING_TYPE, const(char)*, const(void)*, CRYPT_ENCODE_OBJECT_FLAGS, CRYPT_ENCODE_PARA*, void*, uint*);
BOOL CryptEncodeObject(CERT_QUERY_ENCODING_TYPE, const(char)*, const(void)*, ubyte*, uint*);
BOOL CryptDecodeObjectEx(CERT_QUERY_ENCODING_TYPE, const(char)*, const(ubyte)*, uint, uint, CRYPT_DECODE_PARA*, void*, uint*);
BOOL CryptDecodeObject(CERT_QUERY_ENCODING_TYPE, const(char)*, const(ubyte)*, uint, uint, void*, uint*);
BOOL CryptInstallOIDFunctionAddress(HINSTANCE, uint, const(char)*, uint, const(CRYPT_OID_FUNC_ENTRY)*, uint);
void* CryptInitOIDFunctionSet(const(char)*, uint);
BOOL CryptGetOIDFunctionAddress(void*, uint, const(char)*, uint, void**, void**);
BOOL CryptGetDefaultOIDDllList(void*, uint, PWSTR, uint*);
BOOL CryptGetDefaultOIDFunctionAddress(void*, uint, const(wchar)*, uint, void**, void**);
BOOL CryptFreeOIDFunctionAddress(void*, uint);
BOOL CryptRegisterOIDFunction(uint, const(char)*, const(char)*, const(wchar)*, const(char)*);
BOOL CryptUnregisterOIDFunction(uint, const(char)*, const(char)*);
BOOL CryptRegisterDefaultOIDFunction(uint, const(char)*, uint, const(wchar)*);
BOOL CryptUnregisterDefaultOIDFunction(uint, const(char)*, const(wchar)*);
BOOL CryptSetOIDFunctionValue(uint, const(char)*, const(char)*, const(wchar)*, REG_VALUE_TYPE, const(ubyte)*, uint);
BOOL CryptGetOIDFunctionValue(uint, const(char)*, const(char)*, const(wchar)*, uint*, ubyte*, uint*);
BOOL CryptEnumOIDFunction(uint, const(char)*, const(char)*, uint, void*, PFN_CRYPT_ENUM_OID_FUNC);
CRYPT_OID_INFO* CryptFindOIDInfo(uint, void*, uint);
BOOL CryptRegisterOIDInfo(CRYPT_OID_INFO*, uint);
BOOL CryptUnregisterOIDInfo(CRYPT_OID_INFO*);
BOOL CryptEnumOIDInfo(uint, uint, void*, PFN_CRYPT_ENUM_OID_INFO);
PWSTR CryptFindLocalizedName(const(wchar)*);
void* CryptMsgOpenToEncode(uint, uint, CRYPT_MSG_TYPE, const(void)*, PSTR, CMSG_STREAM_INFO*);
uint CryptMsgCalculateEncodedLength(uint, uint, uint, const(void)*, PSTR, uint);
void* CryptMsgOpenToDecode(uint, uint, uint, HCRYPTPROV_LEGACY, CERT_INFO*, CMSG_STREAM_INFO*);
void* CryptMsgDuplicate(void*);
BOOL CryptMsgClose(void*);
BOOL CryptMsgUpdate(void*, const(ubyte)*, uint, BOOL);
BOOL CryptMsgGetParam(void*, uint, uint, void*, uint*);
BOOL CryptMsgControl(void*, uint, uint, const(void)*);
BOOL CryptMsgVerifyCountersignatureEncoded(HCRYPTPROV_LEGACY, uint, ubyte*, uint, ubyte*, uint, CERT_INFO*);
BOOL CryptMsgVerifyCountersignatureEncodedEx(HCRYPTPROV_LEGACY, uint, ubyte*, uint, ubyte*, uint, uint, void*, uint, void*);
BOOL CryptMsgCountersign(void*, uint, uint, CMSG_SIGNER_ENCODE_INFO*);
BOOL CryptMsgCountersignEncoded(uint, ubyte*, uint, uint, CMSG_SIGNER_ENCODE_INFO*, ubyte*, uint*);
HCERTSTORE CertOpenStore(const(char)*, CERT_QUERY_ENCODING_TYPE, HCRYPTPROV_LEGACY, CERT_OPEN_STORE_FLAGS, const(void)*);
HCERTSTORE CertDuplicateStore(HCERTSTORE);
BOOL CertSaveStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, CERT_STORE_SAVE_AS, CERT_STORE_SAVE_TO, void*, uint);
BOOL CertCloseStore(HCERTSTORE, uint);
CERT_CONTEXT* CertGetSubjectCertificateFromStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, CERT_INFO*);
CERT_CONTEXT* CertEnumCertificatesInStore(HCERTSTORE, const(CERT_CONTEXT)*);
CERT_CONTEXT* CertFindCertificateInStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, uint, CERT_FIND_FLAGS, const(void)*, const(CERT_CONTEXT)*);
CERT_CONTEXT* CertGetIssuerCertificateFromStore(HCERTSTORE, const(CERT_CONTEXT)*, const(CERT_CONTEXT)*, uint*);
BOOL CertVerifySubjectCertificateContext(const(CERT_CONTEXT)*, const(CERT_CONTEXT)*, uint*);
CERT_CONTEXT* CertDuplicateCertificateContext(const(CERT_CONTEXT)*);
CERT_CONTEXT* CertCreateCertificateContext(CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint);
BOOL CertFreeCertificateContext(const(CERT_CONTEXT)*);
BOOL CertSetCertificateContextProperty(const(CERT_CONTEXT)*, uint, uint, const(void)*);
BOOL CertGetCertificateContextProperty(const(CERT_CONTEXT)*, uint, void*, uint*);
uint CertEnumCertificateContextProperties(const(CERT_CONTEXT)*, uint);
BOOL CertCreateCTLEntryFromCertificateContextProperties(const(CERT_CONTEXT)*, uint, CRYPT_ATTRIBUTE*, uint, void*, CTL_ENTRY*, uint*);
BOOL CertSetCertificateContextPropertiesFromCTLEntry(const(CERT_CONTEXT)*, CTL_ENTRY*, uint);
CRL_CONTEXT* CertGetCRLFromStore(HCERTSTORE, const(CERT_CONTEXT)*, CRL_CONTEXT*, uint*);
CRL_CONTEXT* CertEnumCRLsInStore(HCERTSTORE, CRL_CONTEXT*);
CRL_CONTEXT* CertFindCRLInStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, uint, uint, const(void)*, CRL_CONTEXT*);
CRL_CONTEXT* CertDuplicateCRLContext(CRL_CONTEXT*);
CRL_CONTEXT* CertCreateCRLContext(CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint);
BOOL CertFreeCRLContext(CRL_CONTEXT*);
BOOL CertSetCRLContextProperty(CRL_CONTEXT*, uint, uint, const(void)*);
BOOL CertGetCRLContextProperty(CRL_CONTEXT*, uint, void*, uint*);
uint CertEnumCRLContextProperties(CRL_CONTEXT*, uint);
BOOL CertFindCertificateInCRL(const(CERT_CONTEXT)*, CRL_CONTEXT*, uint, void*, CRL_ENTRY**);
BOOL CertIsValidCRLForCertificate(const(CERT_CONTEXT)*, CRL_CONTEXT*, uint, void*);
BOOL CertAddEncodedCertificateToStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, uint, CERT_CONTEXT**);
BOOL CertAddCertificateContextToStore(HCERTSTORE, const(CERT_CONTEXT)*, uint, CERT_CONTEXT**);
BOOL CertAddSerializedElementToStore(HCERTSTORE, const(ubyte)*, uint, uint, uint, uint, uint*, const(void)**);
BOOL CertDeleteCertificateFromStore(const(CERT_CONTEXT)*);
BOOL CertAddEncodedCRLToStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, uint, CRL_CONTEXT**);
BOOL CertAddCRLContextToStore(HCERTSTORE, CRL_CONTEXT*, uint, CRL_CONTEXT**);
BOOL CertDeleteCRLFromStore(CRL_CONTEXT*);
BOOL CertSerializeCertificateStoreElement(const(CERT_CONTEXT)*, uint, ubyte*, uint*);
BOOL CertSerializeCRLStoreElement(CRL_CONTEXT*, uint, ubyte*, uint*);
CTL_CONTEXT* CertDuplicateCTLContext(CTL_CONTEXT*);
CTL_CONTEXT* CertCreateCTLContext(uint, const(ubyte)*, uint);
BOOL CertFreeCTLContext(CTL_CONTEXT*);
BOOL CertSetCTLContextProperty(CTL_CONTEXT*, uint, uint, const(void)*);
BOOL CertGetCTLContextProperty(CTL_CONTEXT*, uint, void*, uint*);
uint CertEnumCTLContextProperties(CTL_CONTEXT*, uint);
CTL_CONTEXT* CertEnumCTLsInStore(HCERTSTORE, CTL_CONTEXT*);
CTL_ENTRY* CertFindSubjectInCTL(uint, uint, void*, CTL_CONTEXT*, uint);
CTL_CONTEXT* CertFindCTLInStore(HCERTSTORE, uint, uint, CERT_FIND_TYPE, const(void)*, CTL_CONTEXT*);
BOOL CertAddEncodedCTLToStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, uint, CTL_CONTEXT**);
BOOL CertAddCTLContextToStore(HCERTSTORE, CTL_CONTEXT*, uint, CTL_CONTEXT**);
BOOL CertSerializeCTLStoreElement(CTL_CONTEXT*, uint, ubyte*, uint*);
BOOL CertDeleteCTLFromStore(CTL_CONTEXT*);
BOOL CertAddCertificateLinkToStore(HCERTSTORE, const(CERT_CONTEXT)*, uint, CERT_CONTEXT**);
BOOL CertAddCRLLinkToStore(HCERTSTORE, CRL_CONTEXT*, uint, CRL_CONTEXT**);
BOOL CertAddCTLLinkToStore(HCERTSTORE, CTL_CONTEXT*, uint, CTL_CONTEXT**);
BOOL CertAddStoreToCollection(HCERTSTORE, HCERTSTORE, uint, uint);
void CertRemoveStoreFromCollection(HCERTSTORE, HCERTSTORE);
BOOL CertControlStore(HCERTSTORE, CERT_CONTROL_STORE_FLAGS, uint, const(void)*);
BOOL CertSetStoreProperty(HCERTSTORE, uint, uint, const(void)*);
BOOL CertGetStoreProperty(HCERTSTORE, uint, void*, uint*);
void* CertCreateContext(uint, uint, const(ubyte)*, uint, uint, CERT_CREATE_CONTEXT_PARA*);
BOOL CertRegisterSystemStore(const(void)*, uint, CERT_SYSTEM_STORE_INFO*, void*);
BOOL CertRegisterPhysicalStore(const(void)*, uint, const(wchar)*, CERT_PHYSICAL_STORE_INFO*, void*);
BOOL CertUnregisterSystemStore(const(void)*, uint);
BOOL CertUnregisterPhysicalStore(const(void)*, uint, const(wchar)*);
BOOL CertEnumSystemStoreLocation(uint, void*, PFN_CERT_ENUM_SYSTEM_STORE_LOCATION);
BOOL CertEnumSystemStore(uint, void*, void*, PFN_CERT_ENUM_SYSTEM_STORE);
BOOL CertEnumPhysicalStore(const(void)*, uint, void*, PFN_CERT_ENUM_PHYSICAL_STORE);
BOOL CertGetEnhancedKeyUsage(const(CERT_CONTEXT)*, uint, CTL_USAGE*, uint*);
BOOL CertSetEnhancedKeyUsage(const(CERT_CONTEXT)*, CTL_USAGE*);
BOOL CertAddEnhancedKeyUsageIdentifier(const(CERT_CONTEXT)*, const(char)*);
BOOL CertRemoveEnhancedKeyUsageIdentifier(const(CERT_CONTEXT)*, const(char)*);
BOOL CertGetValidUsages(uint, CERT_CONTEXT**, int*, PSTR*, uint*);
BOOL CryptMsgGetAndVerifySigner(void*, uint, HCERTSTORE*, uint, CERT_CONTEXT**, uint*);
BOOL CryptMsgSignCTL(uint, ubyte*, uint, CMSG_SIGNED_ENCODE_INFO*, uint, ubyte*, uint*);
BOOL CryptMsgEncodeAndSignCTL(uint, CTL_INFO*, CMSG_SIGNED_ENCODE_INFO*, uint, ubyte*, uint*);
BOOL CertFindSubjectInSortedCTL(CRYPT_INTEGER_BLOB*, CTL_CONTEXT*, uint, void*, CRYPT_INTEGER_BLOB*);
BOOL CertEnumSubjectInSortedCTL(CTL_CONTEXT*, void**, CRYPT_INTEGER_BLOB*, CRYPT_INTEGER_BLOB*);
BOOL CertVerifyCTLUsage(uint, uint, void*, CTL_USAGE*, uint, CTL_VERIFY_USAGE_PARA*, CTL_VERIFY_USAGE_STATUS*);
BOOL CertVerifyRevocation(uint, uint, uint, void**, uint, CERT_REVOCATION_PARA*, CERT_REVOCATION_STATUS*);
BOOL CertCompareIntegerBlob(CRYPT_INTEGER_BLOB*, CRYPT_INTEGER_BLOB*);
BOOL CertCompareCertificate(CERT_QUERY_ENCODING_TYPE, CERT_INFO*, CERT_INFO*);
BOOL CertCompareCertificateName(CERT_QUERY_ENCODING_TYPE, CRYPT_INTEGER_BLOB*, CRYPT_INTEGER_BLOB*);
BOOL CertIsRDNAttrsInCertificateName(CERT_QUERY_ENCODING_TYPE, uint, CRYPT_INTEGER_BLOB*, CERT_RDN*);
BOOL CertComparePublicKeyInfo(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, CERT_PUBLIC_KEY_INFO*);
uint CertGetPublicKeyLength(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*);
BOOL CryptVerifyCertificateSignature(HCRYPTPROV_LEGACY, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, CERT_PUBLIC_KEY_INFO*);
BOOL CryptVerifyCertificateSignatureEx(HCRYPTPROV_LEGACY, CERT_QUERY_ENCODING_TYPE, uint, void*, uint, void*, CRYPT_VERIFY_CERT_FLAGS, void*);
BOOL CertIsStrongHashToSign(CERT_STRONG_SIGN_PARA*, const(wchar)*, const(CERT_CONTEXT)*);
BOOL CryptHashToBeSigned(HCRYPTPROV_LEGACY, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptHashCertificate(HCRYPTPROV_LEGACY, uint, uint, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptHashCertificate2(const(wchar)*, uint, void*, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptSignCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, uint, CERT_QUERY_ENCODING_TYPE, const(ubyte)*, uint, CRYPT_ALGORITHM_IDENTIFIER*, const(void)*, ubyte*, uint*);
BOOL CryptSignAndEncodeCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, CERT_KEY_SPEC, CERT_QUERY_ENCODING_TYPE, const(char)*, const(void)*, CRYPT_ALGORITHM_IDENTIFIER*, const(void)*, ubyte*, uint*);
int CertVerifyTimeValidity(FILETIME*, CERT_INFO*);
int CertVerifyCRLTimeValidity(FILETIME*, CRL_INFO*);
BOOL CertVerifyValidityNesting(CERT_INFO*, CERT_INFO*);
BOOL CertVerifyCRLRevocation(CERT_QUERY_ENCODING_TYPE, CERT_INFO*, uint, CRL_INFO**);
PSTR CertAlgIdToOID(uint);
uint CertOIDToAlgId(const(char)*);
CERT_EXTENSION* CertFindExtension(const(char)*, uint, CERT_EXTENSION*);
CRYPT_ATTRIBUTE* CertFindAttribute(const(char)*, uint, CRYPT_ATTRIBUTE*);
CERT_RDN_ATTR* CertFindRDNAttr(const(char)*, CERT_NAME_INFO*);
BOOL CertGetIntendedKeyUsage(CERT_QUERY_ENCODING_TYPE, CERT_INFO*, ubyte*, uint);
BOOL CryptInstallDefaultContext(ulong, CRYPT_DEFAULT_CONTEXT_TYPE, const(void)*, CRYPT_DEFAULT_CONTEXT_FLAGS, void*, void**);
BOOL CryptUninstallDefaultContext(void*, uint, void*);
BOOL CryptExportPublicKeyInfo(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, uint, CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, uint*);
BOOL CryptExportPublicKeyInfoEx(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, uint, CERT_QUERY_ENCODING_TYPE, PSTR, uint, void*, CERT_PUBLIC_KEY_INFO*, uint*);
BOOL CryptExportPublicKeyInfoFromBCryptKeyHandle(BCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, uint, void*, CERT_PUBLIC_KEY_INFO*, uint*);
BOOL CryptImportPublicKeyInfo(ulong, CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, ulong*);
BOOL CryptImportPublicKeyInfoEx(ulong, CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, uint, uint, void*, ulong*);
BOOL CryptImportPublicKeyInfoEx2(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, CRYPT_IMPORT_PUBLIC_KEY_FLAGS, void*, BCRYPT_KEY_HANDLE*);
BOOL CryptAcquireCertificatePrivateKey(const(CERT_CONTEXT)*, CRYPT_ACQUIRE_FLAGS, void*, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE*, CERT_KEY_SPEC*, BOOL*);
BOOL CryptFindCertificateKeyProvInfo(const(CERT_CONTEXT)*, CRYPT_FIND_FLAGS, void*);
BOOL CryptImportPKCS8(CRYPT_PKCS8_IMPORT_PARAMS, CRYPT_KEY_FLAGS, ulong*, void*);
BOOL CryptExportPKCS8(ulong, uint, PSTR, uint, void*, ubyte*, uint*);
BOOL CryptHashPublicKeyInfo(HCRYPTPROV_LEGACY, uint, uint, CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, ubyte*, uint*);
uint CertRDNValueToStrA(uint, CRYPT_INTEGER_BLOB*, PSTR, uint);
uint CertRDNValueToStrW(uint, CRYPT_INTEGER_BLOB*, PWSTR, uint);
uint CertNameToStrA(CERT_QUERY_ENCODING_TYPE, CRYPT_INTEGER_BLOB*, CERT_STRING_TYPE, PSTR, uint);
uint CertNameToStrW(CERT_QUERY_ENCODING_TYPE, CRYPT_INTEGER_BLOB*, CERT_STRING_TYPE, PWSTR, uint);
BOOL CertStrToNameA(CERT_QUERY_ENCODING_TYPE, const(char)*, CERT_STRING_TYPE, void*, ubyte*, uint*, PSTR*);
BOOL CertStrToNameW(CERT_QUERY_ENCODING_TYPE, const(wchar)*, CERT_STRING_TYPE, void*, ubyte*, uint*, PWSTR*);
uint CertGetNameStringA(const(CERT_CONTEXT)*, uint, uint, void*, PSTR, uint);
uint CertGetNameStringW(const(CERT_CONTEXT)*, uint, uint, void*, PWSTR, uint);
BOOL CryptSignMessage(CRYPT_SIGN_MESSAGE_PARA*, BOOL, uint, const(ubyte)**, uint*, ubyte*, uint*);
BOOL CryptVerifyMessageSignature(CRYPT_VERIFY_MESSAGE_PARA*, uint, const(ubyte)*, uint, ubyte*, uint*, CERT_CONTEXT**);
int CryptGetMessageSignerCount(uint, const(ubyte)*, uint);
HCERTSTORE CryptGetMessageCertificates(uint, HCRYPTPROV_LEGACY, uint, const(ubyte)*, uint);
BOOL CryptVerifyDetachedMessageSignature(CRYPT_VERIFY_MESSAGE_PARA*, uint, const(ubyte)*, uint, uint, const(ubyte)**, uint*, CERT_CONTEXT**);
BOOL CryptEncryptMessage(CRYPT_ENCRYPT_MESSAGE_PARA*, uint, CERT_CONTEXT**, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptDecryptMessage(CRYPT_DECRYPT_MESSAGE_PARA*, const(ubyte)*, uint, ubyte*, uint*, CERT_CONTEXT**);
BOOL CryptSignAndEncryptMessage(CRYPT_SIGN_MESSAGE_PARA*, CRYPT_ENCRYPT_MESSAGE_PARA*, uint, CERT_CONTEXT**, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptDecryptAndVerifyMessageSignature(CRYPT_DECRYPT_MESSAGE_PARA*, CRYPT_VERIFY_MESSAGE_PARA*, uint, const(ubyte)*, uint, ubyte*, uint*, CERT_CONTEXT**, CERT_CONTEXT**);
BOOL CryptDecodeMessage(uint, CRYPT_DECRYPT_MESSAGE_PARA*, CRYPT_VERIFY_MESSAGE_PARA*, uint, const(ubyte)*, uint, uint, uint*, uint*, ubyte*, uint*, CERT_CONTEXT**, CERT_CONTEXT**);
BOOL CryptHashMessage(CRYPT_HASH_MESSAGE_PARA*, BOOL, uint, const(ubyte)**, uint*, ubyte*, uint*, ubyte*, uint*);
BOOL CryptVerifyMessageHash(CRYPT_HASH_MESSAGE_PARA*, ubyte*, uint, ubyte*, uint*, ubyte*, uint*);
BOOL CryptVerifyDetachedMessageHash(CRYPT_HASH_MESSAGE_PARA*, ubyte*, uint, uint, const(ubyte)**, uint*, ubyte*, uint*);
BOOL CryptSignMessageWithKey(CRYPT_KEY_SIGN_MESSAGE_PARA*, const(ubyte)*, uint, ubyte*, uint*);
BOOL CryptVerifyMessageSignatureWithKey(CRYPT_KEY_VERIFY_MESSAGE_PARA*, CERT_PUBLIC_KEY_INFO*, const(ubyte)*, uint, ubyte*, uint*);
HCERTSTORE CertOpenSystemStoreA(HCRYPTPROV_LEGACY, const(char)*);
HCERTSTORE CertOpenSystemStoreW(HCRYPTPROV_LEGACY, const(wchar)*);
BOOL CertAddEncodedCertificateToSystemStoreA(const(char)*, const(ubyte)*, uint);
BOOL CertAddEncodedCertificateToSystemStoreW(const(wchar)*, const(ubyte)*, uint);
HRESULT FindCertsByIssuer(CERT_CHAIN*, uint*, uint*, ubyte*, uint, const(wchar)*, uint);
BOOL CryptQueryObject(CERT_QUERY_OBJECT_TYPE, const(void)*, CERT_QUERY_CONTENT_TYPE_FLAGS, CERT_QUERY_FORMAT_TYPE_FLAGS, uint, CERT_QUERY_ENCODING_TYPE*, CERT_QUERY_CONTENT_TYPE*, CERT_QUERY_FORMAT_TYPE*, HCERTSTORE*, void**, const(void)**);
void* CryptMemAlloc(uint);
void* CryptMemRealloc(void*, uint);
void CryptMemFree(void*);
BOOL CryptCreateAsyncHandle(uint, HCRYPTASYNC*);
BOOL CryptSetAsyncParam(HCRYPTASYNC, PSTR, void*, PFN_CRYPT_ASYNC_PARAM_FREE_FUNC);
BOOL CryptGetAsyncParam(HCRYPTASYNC, PSTR, void**, PFN_CRYPT_ASYNC_PARAM_FREE_FUNC*);
BOOL CryptCloseAsyncHandle(HCRYPTASYNC);
BOOL CryptRetrieveObjectByUrlA(const(char)*, const(char)*, uint, uint, void**, HCRYPTASYNC, CRYPT_CREDENTIALS*, void*, CRYPT_RETRIEVE_AUX_INFO*);
BOOL CryptRetrieveObjectByUrlW(const(wchar)*, const(char)*, uint, uint, void**, HCRYPTASYNC, CRYPT_CREDENTIALS*, void*, CRYPT_RETRIEVE_AUX_INFO*);
BOOL CryptInstallCancelRetrieval(PFN_CRYPT_CANCEL_RETRIEVAL, const(void)*, uint, void*);
BOOL CryptUninstallCancelRetrieval(uint, void*);
BOOL CryptGetObjectUrl(const(char)*, void*, CRYPT_GET_URL_FLAGS, CRYPT_URL_ARRAY*, uint*, CRYPT_URL_INFO*, uint*, void*);
CERT_CONTEXT* CertCreateSelfSignCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, CRYPT_INTEGER_BLOB*, CERT_CREATE_SELFSIGN_FLAGS, CRYPT_KEY_PROV_INFO*, CRYPT_ALGORITHM_IDENTIFIER*, SYSTEMTIME*, SYSTEMTIME*, CERT_EXTENSIONS*);
BOOL CryptGetKeyIdentifierProperty(const(CRYPT_INTEGER_BLOB)*, uint, uint, const(wchar)*, void*, void*, uint*);
BOOL CryptSetKeyIdentifierProperty(const(CRYPT_INTEGER_BLOB)*, uint, uint, const(wchar)*, void*, const(void)*);
BOOL CryptEnumKeyIdentifierProperties(const(CRYPT_INTEGER_BLOB)*, uint, uint, const(wchar)*, void*, void*, PFN_CRYPT_ENUM_KEYID_PROP);
BOOL CryptCreateKeyIdentifierFromCSP(CERT_QUERY_ENCODING_TYPE, const(char)*, const(PUBLICKEYSTRUC)*, uint, uint, void*, ubyte*, uint*);
BOOL CertCreateCertificateChainEngine(CERT_CHAIN_ENGINE_CONFIG*, HCERTCHAINENGINE*);
void CertFreeCertificateChainEngine(HCERTCHAINENGINE);
BOOL CertResyncCertificateChainEngine(HCERTCHAINENGINE);
BOOL CertGetCertificateChain(HCERTCHAINENGINE, const(CERT_CONTEXT)*, FILETIME*, HCERTSTORE, CERT_CHAIN_PARA*, uint, void*, CERT_CHAIN_CONTEXT**);
void CertFreeCertificateChain(CERT_CHAIN_CONTEXT*);
CERT_CHAIN_CONTEXT* CertDuplicateCertificateChain(CERT_CHAIN_CONTEXT*);
CERT_CHAIN_CONTEXT* CertFindChainInStore(HCERTSTORE, CERT_QUERY_ENCODING_TYPE, CERT_FIND_CHAIN_IN_STORE_FLAGS, uint, const(void)*, CERT_CHAIN_CONTEXT*);
BOOL CertVerifyCertificateChainPolicy(const(char)*, CERT_CHAIN_CONTEXT*, CERT_CHAIN_POLICY_PARA*, CERT_CHAIN_POLICY_STATUS*);
BOOL CryptStringToBinaryA(const(char)*, uint, CRYPT_STRING, ubyte*, uint*, uint*, uint*);
BOOL CryptStringToBinaryW(const(wchar)*, uint, CRYPT_STRING, ubyte*, uint*, uint*, uint*);
BOOL CryptBinaryToStringA(const(ubyte)*, uint, CRYPT_STRING, PSTR, uint*);
BOOL CryptBinaryToStringW(const(ubyte)*, uint, CRYPT_STRING, PWSTR, uint*);
HCERTSTORE PFXImportCertStore(CRYPT_INTEGER_BLOB*, const(wchar)*, CRYPT_KEY_FLAGS);
BOOL PFXIsPFXBlob(CRYPT_INTEGER_BLOB*);
BOOL PFXVerifyPassword(CRYPT_INTEGER_BLOB*, const(wchar)*, uint);
BOOL PFXExportCertStoreEx(HCERTSTORE, CRYPT_INTEGER_BLOB*, const(wchar)*, void*, uint);
BOOL PFXExportCertStore(HCERTSTORE, CRYPT_INTEGER_BLOB*, const(wchar)*, uint);
void* CertOpenServerOcspResponse(CERT_CHAIN_CONTEXT*, uint, CERT_SERVER_OCSP_RESPONSE_OPEN_PARA*);
void CertAddRefServerOcspResponse(void*);
void CertCloseServerOcspResponse(void*, uint);
CERT_SERVER_OCSP_RESPONSE_CONTEXT* CertGetServerOcspResponseContext(void*, uint, void*);
void CertAddRefServerOcspResponseContext(CERT_SERVER_OCSP_RESPONSE_CONTEXT*);
void CertFreeServerOcspResponseContext(CERT_SERVER_OCSP_RESPONSE_CONTEXT*);
BOOL CertRetrieveLogoOrBiometricInfo(const(CERT_CONTEXT)*, const(char)*, uint, uint, uint, void*, ubyte**, uint*, PWSTR*);
BOOL CertSelectCertificateChains(const(GUID)*, uint, CERT_SELECT_CHAIN_PARA*, uint, CERT_SELECT_CRITERIA*, HCERTSTORE, uint*, CERT_CHAIN_CONTEXT***);
void CertFreeCertificateChainList(CERT_CHAIN_CONTEXT**);
BOOL CryptRetrieveTimeStamp(const(wchar)*, uint, uint, const(char)*, const(CRYPT_TIMESTAMP_PARA)*, const(ubyte)*, uint, CRYPT_TIMESTAMP_CONTEXT**, CERT_CONTEXT**, HCERTSTORE*);
BOOL CryptVerifyTimeStampSignature(const(ubyte)*, uint, const(ubyte)*, uint, HCERTSTORE, CRYPT_TIMESTAMP_CONTEXT**, CERT_CONTEXT**, HCERTSTORE*);
BOOL CertIsWeakHash(uint, const(wchar)*, uint, CERT_CHAIN_CONTEXT*, FILETIME*, const(wchar)*);
BOOL CryptProtectData(CRYPT_INTEGER_BLOB*, const(wchar)*, CRYPT_INTEGER_BLOB*, void*, CRYPTPROTECT_PROMPTSTRUCT*, uint, CRYPT_INTEGER_BLOB*);
BOOL CryptUnprotectData(CRYPT_INTEGER_BLOB*, PWSTR*, CRYPT_INTEGER_BLOB*, void*, CRYPTPROTECT_PROMPTSTRUCT*, uint, CRYPT_INTEGER_BLOB*);
BOOL CryptUpdateProtectedState(PSID, const(wchar)*, uint, uint*, uint*);
BOOL CryptProtectMemory(void*, uint, uint);
BOOL CryptUnprotectMemory(void*, uint, uint);
HRESULT NCryptRegisterProtectionDescriptorName(const(wchar)*, const(wchar)*, uint);
HRESULT NCryptQueryProtectionDescriptorName(const(wchar)*, PWSTR, ulong*, uint);
HRESULT NCryptCreateProtectionDescriptor(const(wchar)*, uint, NCRYPT_DESCRIPTOR_HANDLE*);
HRESULT NCryptCloseProtectionDescriptor(NCRYPT_DESCRIPTOR_HANDLE);
HRESULT NCryptGetProtectionDescriptorInfo(NCRYPT_DESCRIPTOR_HANDLE, const(NCRYPT_ALLOC_PARA)*, uint, void**);
HRESULT NCryptProtectSecret(NCRYPT_DESCRIPTOR_HANDLE, uint, const(ubyte)*, uint, const(NCRYPT_ALLOC_PARA)*, HWND, ubyte**, uint*);
HRESULT NCryptUnprotectSecret(NCRYPT_DESCRIPTOR_HANDLE*, NCRYPT_FLAGS, const(ubyte)*, uint, const(NCRYPT_ALLOC_PARA)*, HWND, ubyte**, uint*);
HRESULT NCryptStreamOpenToProtect(NCRYPT_DESCRIPTOR_HANDLE, uint, HWND, NCRYPT_PROTECT_STREAM_INFO*, NCRYPT_STREAM_HANDLE*);
HRESULT NCryptStreamOpenToUnprotect(NCRYPT_PROTECT_STREAM_INFO*, uint, HWND, NCRYPT_STREAM_HANDLE*);
HRESULT NCryptStreamOpenToUnprotectEx(NCRYPT_PROTECT_STREAM_INFO_EX*, uint, HWND, NCRYPT_STREAM_HANDLE*);
HRESULT NCryptStreamUpdate(NCRYPT_STREAM_HANDLE, const(ubyte)*, ulong, BOOL);
HRESULT NCryptStreamClose(NCRYPT_STREAM_HANDLE);
HRESULT CryptXmlClose(void*);
HRESULT CryptXmlGetTransforms(const(CRYPT_XML_TRANSFORM_CHAIN_CONFIG)**);
HRESULT CryptXmlOpenToEncode(const(CRYPT_XML_TRANSFORM_CHAIN_CONFIG)*, CRYPT_XML_FLAGS, const(wchar)*, const(CRYPT_XML_PROPERTY)*, uint, const(CRYPT_XML_BLOB)*, void**);
HRESULT CryptXmlOpenToDecode(const(CRYPT_XML_TRANSFORM_CHAIN_CONFIG)*, CRYPT_XML_FLAGS, const(CRYPT_XML_PROPERTY)*, uint, const(CRYPT_XML_BLOB)*, void**);
HRESULT CryptXmlAddObject(void*, uint, const(CRYPT_XML_PROPERTY)*, uint, const(CRYPT_XML_BLOB)*, const(CRYPT_XML_OBJECT)**);
HRESULT CryptXmlCreateReference(void*, uint, const(wchar)*, const(wchar)*, const(wchar)*, const(CRYPT_XML_ALGORITHM)*, uint, const(CRYPT_XML_ALGORITHM)*, void**);
HRESULT CryptXmlDigestReference(void*, uint, CRYPT_XML_DATA_PROVIDER*);
HRESULT CryptXmlSetHMACSecret(void*, const(ubyte)*, uint);
HRESULT CryptXmlSign(void*, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, CERT_KEY_SPEC, CRYPT_XML_FLAGS, CRYPT_XML_KEYINFO_SPEC, const(void)*, const(CRYPT_XML_ALGORITHM)*, const(CRYPT_XML_ALGORITHM)*);
HRESULT CryptXmlImportPublicKey(CRYPT_XML_FLAGS, const(CRYPT_XML_KEY_VALUE)*, BCRYPT_KEY_HANDLE*);
HRESULT CryptXmlVerifySignature(void*, BCRYPT_KEY_HANDLE, CRYPT_XML_FLAGS);
HRESULT CryptXmlGetDocContext(void*, const(CRYPT_XML_DOC_CTXT)**);
HRESULT CryptXmlGetSignature(void*, const(CRYPT_XML_SIGNATURE)**);
HRESULT CryptXmlGetReference(void*, const(CRYPT_XML_REFERENCE)**);
HRESULT CryptXmlGetStatus(void*, CRYPT_XML_STATUS*);
HRESULT CryptXmlEncode(void*, CRYPT_XML_CHARSET, const(CRYPT_XML_PROPERTY)*, uint, void*, PFN_CRYPT_XML_WRITE_CALLBACK);
HRESULT CryptXmlGetAlgorithmInfo(const(CRYPT_XML_ALGORITHM)*, CRYPT_XML_FLAGS, CRYPT_XML_ALGORITHM_INFO**);
CRYPT_XML_ALGORITHM_INFO* CryptXmlFindAlgorithmInfo(uint, const(void)*, uint, uint);
HRESULT CryptXmlEnumAlgorithmInfo(uint, uint, void*, PFN_CRYPT_XML_ENUM_ALG_INFO);
HRESULT GetToken(uint, POLICY_ELEMENT*, GENERIC_XML_TOKEN**, INFORMATIONCARD_CRYPTO_HANDLE**);
HRESULT ManageCardSpace();
HRESULT ImportInformationCard(const(wchar)*);
HRESULT Encrypt(INFORMATIONCARD_CRYPTO_HANDLE*, BOOL, uint, ubyte*, uint*, ubyte**);
HRESULT Decrypt(INFORMATIONCARD_CRYPTO_HANDLE*, BOOL, uint, ubyte*, uint*, ubyte**);
HRESULT SignHash(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, const(wchar)*, uint*, ubyte**);
HRESULT VerifyHash(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, const(wchar)*, uint, ubyte*, BOOL*);
HRESULT GetCryptoTransform(INFORMATIONCARD_CRYPTO_HANDLE*, uint, PaddingMode, uint, Direction, uint, ubyte*, INFORMATIONCARD_CRYPTO_HANDLE**);
HRESULT GetKeyedHash(INFORMATIONCARD_CRYPTO_HANDLE*, INFORMATIONCARD_CRYPTO_HANDLE**);
HRESULT TransformBlock(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, uint*, ubyte**);
HRESULT TransformFinalBlock(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, uint*, ubyte**);
HRESULT HashCore(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*);
HRESULT HashFinal(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, uint*, ubyte**);
BOOL FreeToken(GENERIC_XML_TOKEN*);
HRESULT CloseCryptoHandle(INFORMATIONCARD_CRYPTO_HANDLE*);
HRESULT GenerateDerivedKey(INFORMATIONCARD_CRYPTO_HANDLE*, uint, ubyte*, uint, ubyte*, uint, uint, const(wchar)*, uint*, ubyte**);
HRESULT GetBrowserToken(uint, void*, uint*, ubyte**);
enum CERT_COMPARE_SHIFT = 0x00000010;
enum BCRYPT_OBJECT_ALIGNMENT = 0x00000010;
enum BCRYPT_KDF_HASH = "HASH";
enum BCRYPT_KDF_HMAC = "HMAC";
enum BCRYPT_KDF_TLS_PRF = "TLS_PRF";
enum BCRYPT_KDF_SP80056A_CONCAT = "SP800_56A_CONCAT";
enum BCRYPT_KDF_RAW_SECRET = "TRUNCATE";
enum BCRYPT_KDF_HKDF = "HKDF";
enum KDF_HASH_ALGORITHM = 0x00000000;
enum KDF_SECRET_PREPEND = 0x00000001;
enum KDF_SECRET_APPEND = 0x00000002;
enum KDF_HMAC_KEY = 0x00000003;
enum KDF_TLS_PRF_LABEL = 0x00000004;
enum KDF_TLS_PRF_SEED = 0x00000005;
enum KDF_SECRET_HANDLE = 0x00000006;
enum KDF_TLS_PRF_PROTOCOL = 0x00000007;
enum KDF_ALGORITHMID = 0x00000008;
enum KDF_PARTYUINFO = 0x00000009;
enum KDF_PARTYVINFO = 0x0000000a;
enum KDF_SUPPPUBINFO = 0x0000000b;
enum KDF_SUPPPRIVINFO = 0x0000000c;
enum KDF_LABEL = 0x0000000d;
enum KDF_CONTEXT = 0x0000000e;
enum KDF_SALT = 0x0000000f;
enum KDF_ITERATION_COUNT = 0x00000010;
enum KDF_GENERIC_PARAMETER = 0x00000011;
enum KDF_KEYBITLENGTH = 0x00000012;
enum KDF_HKDF_SALT = 0x00000013;
enum KDF_HKDF_INFO = 0x00000014;
enum KDF_USE_SECRET_AS_HMAC_KEY_FLAG = 0x00000001;
enum BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION = 0x00000001;
enum BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG = 0x00000001;
enum BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG = 0x00000002;
enum BCRYPT_OPAQUE_KEY_BLOB = "OpaqueKeyBlob";
enum BCRYPT_KEY_DATA_BLOB = "KeyDataBlob";
enum BCRYPT_AES_WRAP_KEY_BLOB = "Rfc3565KeyWrapBlob";
enum BCRYPT_OBJECT_LENGTH = "ObjectLength";
enum BCRYPT_ALGORITHM_NAME = "AlgorithmName";
enum BCRYPT_PROVIDER_HANDLE = "ProviderHandle";
enum BCRYPT_CHAINING_MODE = "ChainingMode";
enum BCRYPT_BLOCK_LENGTH = "BlockLength";
enum BCRYPT_KEY_LENGTH = "KeyLength";
enum BCRYPT_KEY_OBJECT_LENGTH = "KeyObjectLength";
enum BCRYPT_KEY_STRENGTH = "KeyStrength";
enum BCRYPT_KEY_LENGTHS = "KeyLengths";
enum BCRYPT_BLOCK_SIZE_LIST = "BlockSizeList";
enum BCRYPT_EFFECTIVE_KEY_LENGTH = "EffectiveKeyLength";
enum BCRYPT_HASH_LENGTH = "HashDigestLength";
enum BCRYPT_HASH_OID_LIST = "HashOIDList";
enum BCRYPT_PADDING_SCHEMES = "PaddingSchemes";
enum BCRYPT_SIGNATURE_LENGTH = "SignatureLength";
enum BCRYPT_HASH_BLOCK_LENGTH = "HashBlockLength";
enum BCRYPT_AUTH_TAG_LENGTH = "AuthTagLength";
enum BCRYPT_PRIMITIVE_TYPE = "PrimitiveType";
enum BCRYPT_IS_KEYED_HASH = "IsKeyedHash";
enum BCRYPT_IS_REUSABLE_HASH = "IsReusableHash";
enum BCRYPT_MESSAGE_BLOCK_LENGTH = "MessageBlockLength";
enum BCRYPT_PUBLIC_KEY_LENGTH = "PublicKeyLength";
enum BCRYPT_PCP_PLATFORM_TYPE_PROPERTY = "PCP_PLATFORM_TYPE";
enum BCRYPT_PCP_PROVIDER_VERSION_PROPERTY = "PCP_PROVIDER_VERSION";
enum BCRYPT_MULTI_OBJECT_LENGTH = "MultiObjectLength";
enum BCRYPT_IS_IFX_TPM_WEAK_KEY = "IsIfxTpmWeakKey";
enum BCRYPT_HKDF_HASH_ALGORITHM = "HkdfHashAlgorithm";
enum BCRYPT_HKDF_SALT_AND_FINALIZE = "HkdfSaltAndFinalize";
enum BCRYPT_HKDF_PRK_AND_FINALIZE = "HkdfPrkAndFinalize";
enum BCRYPT_INITIALIZATION_VECTOR = "IV";
enum BCRYPT_CHAIN_MODE_NA = "ChainingModeN/A";
enum BCRYPT_CHAIN_MODE_CBC = "ChainingModeCBC";
enum BCRYPT_CHAIN_MODE_ECB = "ChainingModeECB";
enum BCRYPT_CHAIN_MODE_CFB = "ChainingModeCFB";
enum BCRYPT_CHAIN_MODE_CCM = "ChainingModeCCM";
enum BCRYPT_CHAIN_MODE_GCM = "ChainingModeGCM";
enum BCRYPT_SUPPORTED_PAD_ROUTER = 0x00000001;
enum BCRYPT_SUPPORTED_PAD_PKCS1_ENC = 0x00000002;
enum BCRYPT_SUPPORTED_PAD_PKCS1_SIG = 0x00000004;
enum BCRYPT_SUPPORTED_PAD_OAEP = 0x00000008;
enum BCRYPT_SUPPORTED_PAD_PSS = 0x00000010;
enum BCRYPT_BLOCK_PADDING = 0x00000001;
enum BCRYPT_GENERATE_IV = 0x00000020;
enum BCRYPT_PAD_PKCS1_OPTIONAL_HASH_OID = 0x00000010;
enum BCRYPTBUFFER_VERSION = 0x00000000;
enum BCRYPT_PUBLIC_KEY_BLOB = "PUBLICBLOB";
enum BCRYPT_PRIVATE_KEY_BLOB = "PRIVATEBLOB";
enum BCRYPT_RSAPUBLIC_BLOB = "RSAPUBLICBLOB";
enum BCRYPT_RSAPRIVATE_BLOB = "RSAPRIVATEBLOB";
enum LEGACY_RSAPUBLIC_BLOB = "CAPIPUBLICBLOB";
enum LEGACY_RSAPRIVATE_BLOB = "CAPIPRIVATEBLOB";
enum BCRYPT_RSAFULLPRIVATE_BLOB = "RSAFULLPRIVATEBLOB";
enum BCRYPT_GLOBAL_PARAMETERS = "SecretAgreementParam";
enum BCRYPT_PRIVATE_KEY = "PrivKeyVal";
enum BCRYPT_ECCPUBLIC_BLOB = "ECCPUBLICBLOB";
enum BCRYPT_ECCPRIVATE_BLOB = "ECCPRIVATEBLOB";
enum BCRYPT_ECCFULLPUBLIC_BLOB = "ECCFULLPUBLICBLOB";
enum BCRYPT_ECCFULLPRIVATE_BLOB = "ECCFULLPRIVATEBLOB";
enum SSL_ECCPUBLIC_BLOB = "SSLECCPUBLICBLOB";
enum BCRYPT_ECDH_PUBLIC_P256_MAGIC = 0x314b4345;
enum BCRYPT_ECDH_PRIVATE_P256_MAGIC = 0x324b4345;
enum BCRYPT_ECDH_PUBLIC_P384_MAGIC = 0x334b4345;
enum BCRYPT_ECDH_PRIVATE_P384_MAGIC = 0x344b4345;
enum BCRYPT_ECDH_PUBLIC_P521_MAGIC = 0x354b4345;
enum BCRYPT_ECDH_PRIVATE_P521_MAGIC = 0x364b4345;
enum BCRYPT_ECDH_PUBLIC_GENERIC_MAGIC = 0x504b4345;
enum BCRYPT_ECDH_PRIVATE_GENERIC_MAGIC = 0x564b4345;
enum BCRYPT_ECDSA_PUBLIC_P256_MAGIC = 0x31534345;
enum BCRYPT_ECDSA_PRIVATE_P256_MAGIC = 0x32534345;
enum BCRYPT_ECDSA_PUBLIC_P384_MAGIC = 0x33534345;
enum BCRYPT_ECDSA_PRIVATE_P384_MAGIC = 0x34534345;
enum BCRYPT_ECDSA_PUBLIC_P521_MAGIC = 0x35534345;
enum BCRYPT_ECDSA_PRIVATE_P521_MAGIC = 0x36534345;
enum BCRYPT_ECDSA_PUBLIC_GENERIC_MAGIC = 0x50444345;
enum BCRYPT_ECDSA_PRIVATE_GENERIC_MAGIC = 0x56444345;
enum BCRYPT_ECC_FULLKEY_BLOB_V1 = 0x00000001;
enum BCRYPT_DH_PUBLIC_BLOB = "DHPUBLICBLOB";
enum BCRYPT_DH_PRIVATE_BLOB = "DHPRIVATEBLOB";
enum LEGACY_DH_PUBLIC_BLOB = "CAPIDHPUBLICBLOB";
enum LEGACY_DH_PRIVATE_BLOB = "CAPIDHPRIVATEBLOB";
enum BCRYPT_DH_PARAMETERS = "DHParameters";
enum BCRYPT_DH_PARAMETERS_MAGIC = 0x4d504844;
enum BCRYPT_DSA_PUBLIC_BLOB = "DSAPUBLICBLOB";
enum BCRYPT_DSA_PRIVATE_BLOB = "DSAPRIVATEBLOB";
enum LEGACY_DSA_PUBLIC_BLOB = "CAPIDSAPUBLICBLOB";
enum LEGACY_DSA_PRIVATE_BLOB = "CAPIDSAPRIVATEBLOB";
enum LEGACY_DSA_V2_PUBLIC_BLOB = "V2CAPIDSAPUBLICBLOB";
enum LEGACY_DSA_V2_PRIVATE_BLOB = "V2CAPIDSAPRIVATEBLOB";
enum BCRYPT_DSA_PUBLIC_MAGIC_V2 = 0x32425044;
enum BCRYPT_DSA_PRIVATE_MAGIC_V2 = 0x32565044;
enum BCRYPT_KEY_DATA_BLOB_MAGIC = 0x4d42444b;
enum BCRYPT_KEY_DATA_BLOB_VERSION1 = 0x00000001;
enum BCRYPT_DSA_PARAMETERS = "DSAParameters";
enum BCRYPT_DSA_PARAMETERS_MAGIC = 0x4d505344;
enum BCRYPT_DSA_PARAMETERS_MAGIC_V2 = 0x324d5044;
enum BCRYPT_ECC_PARAMETERS = "ECCParameters";
enum BCRYPT_ECC_CURVE_NAME = "ECCCurveName";
enum BCRYPT_ECC_CURVE_NAME_LIST = "ECCCurveNameList";
enum BCRYPT_ECC_PARAMETERS_MAGIC = 0x50434345;
enum BCRYPT_ECC_CURVE_BRAINPOOLP160R1 = "brainpoolP160r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP160T1 = "brainpoolP160t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP192R1 = "brainpoolP192r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP192T1 = "brainpoolP192t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP224R1 = "brainpoolP224r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP224T1 = "brainpoolP224t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP256R1 = "brainpoolP256r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP256T1 = "brainpoolP256t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP320R1 = "brainpoolP320r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP320T1 = "brainpoolP320t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP384R1 = "brainpoolP384r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP384T1 = "brainpoolP384t1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP512R1 = "brainpoolP512r1";
enum BCRYPT_ECC_CURVE_BRAINPOOLP512T1 = "brainpoolP512t1";
enum BCRYPT_ECC_CURVE_25519 = "curve25519";
enum BCRYPT_ECC_CURVE_EC192WAPI = "ec192wapi";
enum BCRYPT_ECC_CURVE_NISTP192 = "nistP192";
enum BCRYPT_ECC_CURVE_NISTP224 = "nistP224";
enum BCRYPT_ECC_CURVE_NISTP256 = "nistP256";
enum BCRYPT_ECC_CURVE_NISTP384 = "nistP384";
enum BCRYPT_ECC_CURVE_NISTP521 = "nistP521";
enum BCRYPT_ECC_CURVE_NUMSP256T1 = "numsP256t1";
enum BCRYPT_ECC_CURVE_NUMSP384T1 = "numsP384t1";
enum BCRYPT_ECC_CURVE_NUMSP512T1 = "numsP512t1";
enum BCRYPT_ECC_CURVE_SECP160K1 = "secP160k1";
enum BCRYPT_ECC_CURVE_SECP160R1 = "secP160r1";
enum BCRYPT_ECC_CURVE_SECP160R2 = "secP160r2";
enum BCRYPT_ECC_CURVE_SECP192K1 = "secP192k1";
enum BCRYPT_ECC_CURVE_SECP192R1 = "secP192r1";
enum BCRYPT_ECC_CURVE_SECP224K1 = "secP224k1";
enum BCRYPT_ECC_CURVE_SECP224R1 = "secP224r1";
enum BCRYPT_ECC_CURVE_SECP256K1 = "secP256k1";
enum BCRYPT_ECC_CURVE_SECP256R1 = "secP256r1";
enum BCRYPT_ECC_CURVE_SECP384R1 = "secP384r1";
enum BCRYPT_ECC_CURVE_SECP521R1 = "secP521r1";
enum BCRYPT_ECC_CURVE_WTLS7 = "wtls7";
enum BCRYPT_ECC_CURVE_WTLS9 = "wtls9";
enum BCRYPT_ECC_CURVE_WTLS12 = "wtls12";
enum BCRYPT_ECC_CURVE_X962P192V1 = "x962P192v1";
enum BCRYPT_ECC_CURVE_X962P192V2 = "x962P192v2";
enum BCRYPT_ECC_CURVE_X962P192V3 = "x962P192v3";
enum BCRYPT_ECC_CURVE_X962P239V1 = "x962P239v1";
enum BCRYPT_ECC_CURVE_X962P239V2 = "x962P239v2";
enum BCRYPT_ECC_CURVE_X962P239V3 = "x962P239v3";
enum BCRYPT_ECC_CURVE_X962P256V1 = "x962P256v1";
enum MS_PRIMITIVE_PROVIDER = "Microsoft Primitive Provider";
enum MS_PLATFORM_CRYPTO_PROVIDER = "Microsoft Platform Crypto Provider";
enum BCRYPT_RSA_ALGORITHM = "RSA";
enum BCRYPT_RSA_SIGN_ALGORITHM = "RSA_SIGN";
enum BCRYPT_DH_ALGORITHM = "DH";
enum BCRYPT_DSA_ALGORITHM = "DSA";
enum BCRYPT_RC2_ALGORITHM = "RC2";
enum BCRYPT_RC4_ALGORITHM = "RC4";
enum BCRYPT_AES_ALGORITHM = "AES";
enum BCRYPT_DES_ALGORITHM = "DES";
enum BCRYPT_DESX_ALGORITHM = "DESX";
enum BCRYPT_3DES_ALGORITHM = "3DES";
enum BCRYPT_3DES_112_ALGORITHM = "3DES_112";
enum BCRYPT_MD2_ALGORITHM = "MD2";
enum BCRYPT_MD4_ALGORITHM = "MD4";
enum BCRYPT_MD5_ALGORITHM = "MD5";
enum BCRYPT_SHA1_ALGORITHM = "SHA1";
enum BCRYPT_SHA256_ALGORITHM = "SHA256";
enum BCRYPT_SHA384_ALGORITHM = "SHA384";
enum BCRYPT_SHA512_ALGORITHM = "SHA512";
enum BCRYPT_AES_GMAC_ALGORITHM = "AES-GMAC";
enum BCRYPT_AES_CMAC_ALGORITHM = "AES-CMAC";
enum BCRYPT_ECDSA_P256_ALGORITHM = "ECDSA_P256";
enum BCRYPT_ECDSA_P384_ALGORITHM = "ECDSA_P384";
enum BCRYPT_ECDSA_P521_ALGORITHM = "ECDSA_P521";
enum BCRYPT_ECDH_P256_ALGORITHM = "ECDH_P256";
enum BCRYPT_ECDH_P384_ALGORITHM = "ECDH_P384";
enum BCRYPT_ECDH_P521_ALGORITHM = "ECDH_P521";
enum BCRYPT_RNG_ALGORITHM = "RNG";
enum BCRYPT_RNG_FIPS186_DSA_ALGORITHM = "FIPS186DSARNG";
enum BCRYPT_RNG_DUAL_EC_ALGORITHM = "DUALECRNG";
enum BCRYPT_SP800108_CTR_HMAC_ALGORITHM = "SP800_108_CTR_HMAC";
enum BCRYPT_SP80056A_CONCAT_ALGORITHM = "SP800_56A_CONCAT";
enum BCRYPT_PBKDF2_ALGORITHM = "PBKDF2";
enum BCRYPT_CAPI_KDF_ALGORITHM = "CAPI_KDF";
enum BCRYPT_TLS1_1_KDF_ALGORITHM = "TLS1_1_KDF";
enum BCRYPT_TLS1_2_KDF_ALGORITHM = "TLS1_2_KDF";
enum BCRYPT_ECDSA_ALGORITHM = "ECDSA";
enum BCRYPT_ECDH_ALGORITHM = "ECDH";
enum BCRYPT_XTS_AES_ALGORITHM = "XTS-AES";
enum BCRYPT_HKDF_ALGORITHM = "HKDF";
enum BCRYPT_CHACHA20_POLY1305_ALGORITHM = "CHACHA20_POLY1305";
enum BCRYPT_KEY_DERIVATION_INTERFACE = 0x00000007;
enum BCRYPT_MD2_ALG_HANDLE = 0x00000001;
enum BCRYPT_MD4_ALG_HANDLE = 0x00000011;
enum BCRYPT_MD5_ALG_HANDLE = 0x00000021;
enum BCRYPT_SHA1_ALG_HANDLE = 0x00000031;
enum BCRYPT_SHA256_ALG_HANDLE = 0x00000041;
enum BCRYPT_SHA384_ALG_HANDLE = 0x00000051;
enum BCRYPT_SHA512_ALG_HANDLE = 0x00000061;
enum BCRYPT_RC4_ALG_HANDLE = 0x00000071;
enum BCRYPT_RNG_ALG_HANDLE = 0x00000081;
enum BCRYPT_HMAC_MD5_ALG_HANDLE = 0x00000091;
enum BCRYPT_HMAC_SHA1_ALG_HANDLE = 0x000000a1;
enum BCRYPT_HMAC_SHA256_ALG_HANDLE = 0x000000b1;
enum BCRYPT_HMAC_SHA384_ALG_HANDLE = 0x000000c1;
enum BCRYPT_HMAC_SHA512_ALG_HANDLE = 0x000000d1;
enum BCRYPT_RSA_ALG_HANDLE = 0x000000e1;
enum BCRYPT_ECDSA_ALG_HANDLE = 0x000000f1;
enum BCRYPT_AES_CMAC_ALG_HANDLE = 0x00000101;
enum BCRYPT_AES_GMAC_ALG_HANDLE = 0x00000111;
enum BCRYPT_HMAC_MD2_ALG_HANDLE = 0x00000121;
enum BCRYPT_HMAC_MD4_ALG_HANDLE = 0x00000131;
enum BCRYPT_3DES_CBC_ALG_HANDLE = 0x00000141;
enum BCRYPT_3DES_ECB_ALG_HANDLE = 0x00000151;
enum BCRYPT_3DES_CFB_ALG_HANDLE = 0x00000161;
enum BCRYPT_3DES_112_CBC_ALG_HANDLE = 0x00000171;
enum BCRYPT_3DES_112_ECB_ALG_HANDLE = 0x00000181;
enum BCRYPT_3DES_112_CFB_ALG_HANDLE = 0x00000191;
enum BCRYPT_AES_CBC_ALG_HANDLE = 0x000001a1;
enum BCRYPT_AES_ECB_ALG_HANDLE = 0x000001b1;
enum BCRYPT_AES_CFB_ALG_HANDLE = 0x000001c1;
enum BCRYPT_AES_CCM_ALG_HANDLE = 0x000001d1;
enum BCRYPT_AES_GCM_ALG_HANDLE = 0x000001e1;
enum BCRYPT_DES_CBC_ALG_HANDLE = 0x000001f1;
enum BCRYPT_DES_ECB_ALG_HANDLE = 0x00000201;
enum BCRYPT_DES_CFB_ALG_HANDLE = 0x00000211;
enum BCRYPT_DESX_CBC_ALG_HANDLE = 0x00000221;
enum BCRYPT_DESX_ECB_ALG_HANDLE = 0x00000231;
enum BCRYPT_DESX_CFB_ALG_HANDLE = 0x00000241;
enum BCRYPT_RC2_CBC_ALG_HANDLE = 0x00000251;
enum BCRYPT_RC2_ECB_ALG_HANDLE = 0x00000261;
enum BCRYPT_RC2_CFB_ALG_HANDLE = 0x00000271;
enum BCRYPT_DH_ALG_HANDLE = 0x00000281;
enum BCRYPT_ECDH_ALG_HANDLE = 0x00000291;
enum BCRYPT_ECDH_P256_ALG_HANDLE = 0x000002a1;
enum BCRYPT_ECDH_P384_ALG_HANDLE = 0x000002b1;
enum BCRYPT_ECDH_P521_ALG_HANDLE = 0x000002c1;
enum BCRYPT_DSA_ALG_HANDLE = 0x000002d1;
enum BCRYPT_ECDSA_P256_ALG_HANDLE = 0x000002e1;
enum BCRYPT_ECDSA_P384_ALG_HANDLE = 0x000002f1;
enum BCRYPT_ECDSA_P521_ALG_HANDLE = 0x00000301;
enum BCRYPT_RSA_SIGN_ALG_HANDLE = 0x00000311;
enum BCRYPT_CAPI_KDF_ALG_HANDLE = 0x00000321;
enum BCRYPT_PBKDF2_ALG_HANDLE = 0x00000331;
enum BCRYPT_SP800108_CTR_HMAC_ALG_HANDLE = 0x00000341;
enum BCRYPT_SP80056A_CONCAT_ALG_HANDLE = 0x00000351;
enum BCRYPT_TLS1_1_KDF_ALG_HANDLE = 0x00000361;
enum BCRYPT_TLS1_2_KDF_ALG_HANDLE = 0x00000371;
enum BCRYPT_XTS_AES_ALG_HANDLE = 0x00000381;
enum BCRYPT_HKDF_ALG_HANDLE = 0x00000391;
enum BCRYPT_CHACHA20_POLY1305_ALG_HANDLE = 0x000003a1;
enum BCRYPT_CAPI_AES_FLAG = 0x00000010;
enum BCRYPT_MULTI_FLAG = 0x00000040;
enum BCRYPT_TLS_CBC_HMAC_VERIFY_FLAG = 0x00000004;
enum BCRYPT_BUFFERS_LOCKED_FLAG = 0x00000040;
enum BCRYPT_EXTENDED_KEYSIZE = 0x00000080;
enum BCRYPT_ENABLE_INCOMPATIBLE_FIPS_CHECKS = 0x00000100;
enum BCRYPT_KEY_DERIVATION_OPERATION = 0x00000040;
enum BCRYPT_PUBLIC_KEY_FLAG = 0x00000001;
enum BCRYPT_PRIVATE_KEY_FLAG = 0x00000002;
enum BCRYPT_NO_KEY_VALIDATION = 0x00000008;
enum BCRYPT_KEY_VALIDATION_RANGE = 0x00000010;
enum BCRYPT_KEY_VALIDATION_RANGE_AND_ORDER = 0x00000018;
enum BCRYPT_KEY_VALIDATION_REGENERATE = 0x00000020;
enum BCRYPT_RNG_USE_ENTROPY_IN_BUFFER = 0x00000001;
enum BCRYPT_USE_SYSTEM_PREFERRED_RNG = 0x00000002;
enum BCRYPT_HASH_INTERFACE_MAJORVERSION_2 = 0x00000002;
enum CRYPT_OVERWRITE = 0x00000001;
enum CRYPT_PRIORITY_TOP = 0x00000000;
enum CRYPT_PRIORITY_BOTTOM = 0xffffffff;
enum CRYPT_DEFAULT_CONTEXT = "Default";
enum wszXMLNS_DIGSIG = "http://www.w3.org/2000/09/xmldsig#";
enum wszXMLNS_DIGSIG_SignatureProperties = "http://www.w3.org/2000/09/xmldsig#SignatureProperties";
enum wszXMLNS_DIGSIG_Id = "Id";
enum wszURI_XMLNS_DIGSIG_BASE64 = "http://www.w3.org/2000/09/xmldsig#base64";
enum wszURI_XMLNS_DIGSIG_SHA1 = "http://www.w3.org/2000/09/xmldsig#sha1";
enum wszURI_XMLNS_DIGSIG_SHA256 = "http://www.w3.org/2001/04/xmlenc#sha256";
enum wszURI_XMLNS_DIGSIG_SHA384 = "http://www.w3.org/2001/04/xmldsig-more#sha384";
enum wszURI_XMLNS_DIGSIG_SHA512 = "http://www.w3.org/2001/04/xmlenc#sha512";
enum wszURI_XMLNS_DIGSIG_RSA_SHA1 = "http://www.w3.org/2000/09/xmldsig#rsa-sha1";
enum wszURI_XMLNS_DIGSIG_DSA_SHA1 = "http://www.w3.org/2000/09/xmldsig#dsa-sha1";
enum wszURI_XMLNS_DIGSIG_RSA_SHA256 = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";
enum wszURI_XMLNS_DIGSIG_RSA_SHA384 = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha384";
enum wszURI_XMLNS_DIGSIG_RSA_SHA512 = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha512";
enum wszURI_XMLNS_DIGSIG_ECDSA_SHA1 = "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1";
enum wszURI_XMLNS_DIGSIG_ECDSA_SHA256 = "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256";
enum wszURI_XMLNS_DIGSIG_ECDSA_SHA384 = "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384";
enum wszURI_XMLNS_DIGSIG_ECDSA_SHA512 = "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512";
enum wszURI_XMLNS_DIGSIG_HMAC_SHA1 = "http://www.w3.org/2000/09/xmldsig#hmac-sha1";
enum wszURI_XMLNS_DIGSIG_HMAC_SHA256 = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha256";
enum wszURI_XMLNS_DIGSIG_HMAC_SHA384 = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha384";
enum wszURI_XMLNS_DIGSIG_HMAC_SHA512 = "http://www.w3.org/2001/04/xmldsig-more#hmac-sha512";
enum wszURI_CANONICALIZATION_C14N = "http://www.w3.org/TR/2001/REC-xml-c14n-20010315";
enum wszURI_CANONICALIZATION_C14NC = "http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments";
enum wszURI_CANONICALIZATION_EXSLUSIVE_C14N = "http://www.w3.org/2001/10/xml-exc-c14n#";
enum wszURI_CANONICALIZATION_EXSLUSIVE_C14NC = "http://www.w3.org/2001/10/xml-exc-c14n#WithComments";
enum wszURI_TRANSFORM_XPATH = "http://www.w3.org/TR/1999/REC-xpath-19991116";
enum wszURI_XMLNS_TRANSFORM_BASE64 = "http://www.w3.org/2000/09/xmldsig#base64";
enum wszURI_XMLNS_TRANSFORM_ENVELOPED = "http://www.w3.org/2000/09/xmldsig#enveloped-signature";
enum CRYPT_XML_BLOB_MAX = 0x7ffffff8;
enum CRYPT_XML_ID_MAX = 0x00000100;
enum CRYPT_XML_SIGNATURES_MAX = 0x00000010;
enum CRYPT_XML_TRANSFORM_MAX = 0x00000010;
enum CRYPT_XML_SIGNATURE_VALUE_MAX = 0x00000800;
enum CRYPT_XML_DIGEST_VALUE_MAX = 0x00000080;
enum CRYPT_XML_OBJECTS_MAX = 0x00000100;
enum CRYPT_XML_REFERENCES_MAX = 0x00007ff8;
enum CRYPT_XML_E_BASE = 0xffffffff80092100;
enum CRYPT_XML_E_LARGE = 0xffffffff80092101;
enum CRYPT_XML_E_TOO_MANY_TRANSFORMS = 0xffffffff80092102;
enum CRYPT_XML_E_ENCODING = 0xffffffff80092103;
enum CRYPT_XML_E_ALGORITHM = 0xffffffff80092104;
enum CRYPT_XML_E_TRANSFORM = 0xffffffff80092105;
enum CRYPT_XML_E_HANDLE = 0xffffffff80092106;
enum CRYPT_XML_E_OPERATION = 0xffffffff80092107;
enum CRYPT_XML_E_UNRESOLVED_REFERENCE = 0xffffffff80092108;
enum CRYPT_XML_E_INVALID_DIGEST = 0xffffffff80092109;
enum CRYPT_XML_E_INVALID_SIGNATURE = 0xffffffff8009210a;
enum CRYPT_XML_E_HASH_FAILED = 0xffffffff8009210b;
enum CRYPT_XML_E_SIGN_FAILED = 0xffffffff8009210c;
enum CRYPT_XML_E_VERIFY_FAILED = 0xffffffff8009210d;
enum CRYPT_XML_E_TOO_MANY_SIGNATURES = 0xffffffff8009210e;
enum CRYPT_XML_E_INVALID_KEYVALUE = 0xffffffff8009210f;
enum CRYPT_XML_E_UNEXPECTED_XML = 0xffffffff80092110;
enum CRYPT_XML_E_SIGNER = 0xffffffff80092111;
enum CRYPT_XML_E_NON_UNIQUE_ID = 0xffffffff80092112;
enum CRYPT_XML_E_LAST = 0xffffffff80092112;
enum CRYPT_XML_FLAG_ALWAYS_RETURN_ENCODED_OBJECT = 0x40000000;
enum CRYPT_XML_FLAG_ENFORCE_ID_NCNAME_FORMAT = 0x20000000;
enum CRYPT_XML_FLAG_ENFORCE_ID_NAME_FORMAT = 0x08000000;
enum CRYPT_XML_FLAG_ECDSA_DSIG11 = 0x04000000;
enum CRYPT_XML_STATUS_NO_ERROR = 0x00000000;
enum CRYPT_XML_FLAG_ADD_OBJECT_CREATE_COPY = 0x00000001;
enum CRYPT_XML_FLAG_CREATE_REFERENCE_AS_OBJECT = 0x00000001;
enum CRYPT_XML_DIGEST_REFERENCE_DATA_TRANSFORMED = 0x00000001;
enum CRYPT_XML_ALGORITHM_INFO_FIND_BY_URI = 0x00000001;
enum CRYPT_XML_ALGORITHM_INFO_FIND_BY_NAME = 0x00000002;
enum CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_ALGID = 0x00000003;
enum CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_SIGN_ALGID = 0x00000004;
enum szFORCE_KEY_PROTECTION = "ForceKeyProtection";
enum dwFORCE_KEY_PROTECTION_DISABLED = 0x00000000;
enum dwFORCE_KEY_PROTECTION_USER_SELECT = 0x00000001;
enum dwFORCE_KEY_PROTECTION_HIGH = 0x00000002;
enum CRYPTPROTECT_PROMPT_ON_UNPROTECT = 0x00000001;
enum CRYPTPROTECT_PROMPT_ON_PROTECT = 0x00000002;
enum CRYPTPROTECT_PROMPT_RESERVED = 0x00000004;
enum CRYPTPROTECT_PROMPT_STRONG = 0x00000008;
enum CRYPTPROTECT_PROMPT_REQUIRE_STRONG = 0x00000010;
enum CRYPTPROTECT_UI_FORBIDDEN = 0x00000001;
enum CRYPTPROTECT_LOCAL_MACHINE = 0x00000004;
enum CRYPTPROTECT_CRED_SYNC = 0x00000008;
enum CRYPTPROTECT_AUDIT = 0x00000010;
enum CRYPTPROTECT_NO_RECOVERY = 0x00000020;
enum CRYPTPROTECT_VERIFY_PROTECTION = 0x00000040;
enum CRYPTPROTECT_CRED_REGENERATE = 0x00000080;
enum CRYPTPROTECT_FIRST_RESERVED_FLAGVAL = 0x0fffffff;
enum CRYPTPROTECT_LAST_RESERVED_FLAGVAL = 0xffffffff;
enum CRYPTPROTECTMEMORY_BLOCK_SIZE = 0x00000010;
enum CRYPTPROTECTMEMORY_SAME_PROCESS = 0x00000000;
enum CRYPTPROTECTMEMORY_CROSS_PROCESS = 0x00000001;
enum CRYPTPROTECTMEMORY_SAME_LOGON = 0x00000002;
enum NCRYPT_MAX_KEY_NAME_LENGTH = 0x00000200;
enum NCRYPT_MAX_ALG_ID_LENGTH = 0x00000200;
enum MS_KEY_STORAGE_PROVIDER = "Microsoft Software Key Storage Provider";
enum MS_SMART_CARD_KEY_STORAGE_PROVIDER = "Microsoft Smart Card Key Storage Provider";
enum MS_PLATFORM_KEY_STORAGE_PROVIDER = "Microsoft Platform Crypto Provider";
enum MS_NGC_KEY_STORAGE_PROVIDER = "Microsoft Passport Key Storage Provider";
enum TPM_RSA_SRK_SEAL_KEY = "MICROSOFT_PCP_KSP_RSA_SEAL_KEY_3BD1C4BF-004E-4E2F-8A4D-0BF633DCB074";
enum NCRYPT_RSA_ALGORITHM = "RSA";
enum NCRYPT_RSA_SIGN_ALGORITHM = "RSA_SIGN";
enum NCRYPT_DH_ALGORITHM = "DH";
enum NCRYPT_DSA_ALGORITHM = "DSA";
enum NCRYPT_MD2_ALGORITHM = "MD2";
enum NCRYPT_MD4_ALGORITHM = "MD4";
enum NCRYPT_MD5_ALGORITHM = "MD5";
enum NCRYPT_SHA1_ALGORITHM = "SHA1";
enum NCRYPT_SHA256_ALGORITHM = "SHA256";
enum NCRYPT_SHA384_ALGORITHM = "SHA384";
enum NCRYPT_SHA512_ALGORITHM = "SHA512";
enum NCRYPT_ECDSA_P256_ALGORITHM = "ECDSA_P256";
enum NCRYPT_ECDSA_P384_ALGORITHM = "ECDSA_P384";
enum NCRYPT_ECDSA_P521_ALGORITHM = "ECDSA_P521";
enum NCRYPT_ECDH_P256_ALGORITHM = "ECDH_P256";
enum NCRYPT_ECDH_P384_ALGORITHM = "ECDH_P384";
enum NCRYPT_ECDH_P521_ALGORITHM = "ECDH_P521";
enum NCRYPT_AES_ALGORITHM = "AES";
enum NCRYPT_RC2_ALGORITHM = "RC2";
enum NCRYPT_3DES_ALGORITHM = "3DES";
enum NCRYPT_DES_ALGORITHM = "DES";
enum NCRYPT_DESX_ALGORITHM = "DESX";
enum NCRYPT_3DES_112_ALGORITHM = "3DES_112";
enum NCRYPT_SP800108_CTR_HMAC_ALGORITHM = "SP800_108_CTR_HMAC";
enum NCRYPT_SP80056A_CONCAT_ALGORITHM = "SP800_56A_CONCAT";
enum NCRYPT_PBKDF2_ALGORITHM = "PBKDF2";
enum NCRYPT_CAPI_KDF_ALGORITHM = "CAPI_KDF";
enum NCRYPT_ECDSA_ALGORITHM = "ECDSA";
enum NCRYPT_ECDH_ALGORITHM = "ECDH";
enum NCRYPT_KEY_STORAGE_ALGORITHM = "KEY_STORAGE";
enum NCRYPT_HMAC_SHA256_ALGORITHM = "HMAC-SHA256";
enum NCRYPT_KEY_DERIVATION_INTERFACE = 0x00000007;
enum NCRYPT_KEY_PROTECTION_INTERFACE = 0x00010004;
enum NCRYPT_RSA_ALGORITHM_GROUP = "RSA";
enum NCRYPT_DH_ALGORITHM_GROUP = "DH";
enum NCRYPT_DSA_ALGORITHM_GROUP = "DSA";
enum NCRYPT_ECDSA_ALGORITHM_GROUP = "ECDSA";
enum NCRYPT_ECDH_ALGORITHM_GROUP = "ECDH";
enum NCRYPT_AES_ALGORITHM_GROUP = "AES";
enum NCRYPT_RC2_ALGORITHM_GROUP = "RC2";
enum NCRYPT_DES_ALGORITHM_GROUP = "DES";
enum NCRYPT_KEY_DERIVATION_GROUP = "KEY_DERIVATION";
enum NCRYPTBUFFER_VERSION = 0x00000000;
enum NCRYPTBUFFER_EMPTY = 0x00000000;
enum NCRYPTBUFFER_DATA = 0x00000001;
enum NCRYPTBUFFER_PROTECTION_DESCRIPTOR_STRING = 0x00000003;
enum NCRYPTBUFFER_PROTECTION_FLAGS = 0x00000004;
enum NCRYPTBUFFER_SSL_CLIENT_RANDOM = 0x00000014;
enum NCRYPTBUFFER_SSL_SERVER_RANDOM = 0x00000015;
enum NCRYPTBUFFER_SSL_HIGHEST_VERSION = 0x00000016;
enum NCRYPTBUFFER_SSL_CLEAR_KEY = 0x00000017;
enum NCRYPTBUFFER_SSL_KEY_ARG_DATA = 0x00000018;
enum NCRYPTBUFFER_SSL_SESSION_HASH = 0x00000019;
enum NCRYPTBUFFER_PKCS_OID = 0x00000028;
enum NCRYPTBUFFER_PKCS_ALG_OID = 0x00000029;
enum NCRYPTBUFFER_PKCS_ALG_PARAM = 0x0000002a;
enum NCRYPTBUFFER_PKCS_ALG_ID = 0x0000002b;
enum NCRYPTBUFFER_PKCS_ATTRS = 0x0000002c;
enum NCRYPTBUFFER_PKCS_KEY_NAME = 0x0000002d;
enum NCRYPTBUFFER_PKCS_SECRET = 0x0000002e;
enum NCRYPTBUFFER_CERT_BLOB = 0x0000002f;
enum NCRYPTBUFFER_CLAIM_IDBINDING_NONCE = 0x00000030;
enum NCRYPTBUFFER_CLAIM_KEYATTESTATION_NONCE = 0x00000031;
enum NCRYPTBUFFER_KEY_PROPERTY_FLAGS = 0x00000032;
enum NCRYPTBUFFER_ATTESTATIONSTATEMENT_BLOB = 0x00000033;
enum NCRYPTBUFFER_ATTESTATION_CLAIM_TYPE = 0x00000034;
enum NCRYPTBUFFER_ATTESTATION_CLAIM_CHALLENGE_REQUIRED = 0x00000035;
enum NCRYPTBUFFER_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS = 0x00000036;
enum NCRYPTBUFFER_ECC_CURVE_NAME = 0x0000003c;
enum NCRYPTBUFFER_ECC_PARAMETERS = 0x0000003d;
enum NCRYPTBUFFER_TPM_SEAL_PASSWORD = 0x00000046;
enum NCRYPTBUFFER_TPM_SEAL_POLICYINFO = 0x00000047;
enum NCRYPTBUFFER_TPM_SEAL_TICKET = 0x00000048;
enum NCRYPTBUFFER_TPM_SEAL_NO_DA_PROTECTION = 0x00000049;
enum NCRYPTBUFFER_TPM_PLATFORM_CLAIM_PCR_MASK = 0x00000050;
enum NCRYPTBUFFER_TPM_PLATFORM_CLAIM_NONCE = 0x00000051;
enum NCRYPTBUFFER_TPM_PLATFORM_CLAIM_STATIC_CREATE = 0x00000052;
enum NCRYPT_CIPHER_NO_PADDING_FLAG = 0x00000000;
enum NCRYPT_CIPHER_BLOCK_PADDING_FLAG = 0x00000001;
enum NCRYPT_CIPHER_OTHER_PADDING_FLAG = 0x00000002;
enum NCRYPT_PLATFORM_ATTEST_MAGIC = 0x44504150;
enum NCRYPT_KEY_ATTEST_MAGIC = 0x4450414b;
enum NCRYPT_CLAIM_AUTHORITY_ONLY = 0x00000001;
enum NCRYPT_CLAIM_SUBJECT_ONLY = 0x00000002;
enum NCRYPT_CLAIM_WEB_AUTH_SUBJECT_ONLY = 0x00000102;
enum NCRYPT_CLAIM_AUTHORITY_AND_SUBJECT = 0x00000003;
enum NCRYPT_CLAIM_VSM_KEY_ATTESTATION_STATEMENT = 0x00000004;
enum NCRYPT_CLAIM_UNKNOWN = 0x00001000;
enum NCRYPT_CLAIM_PLATFORM = 0x00010000;
enum NCRYPT_ISOLATED_KEY_FLAG_CREATED_IN_ISOLATION = 0x00000001;
enum NCRYPT_ISOLATED_KEY_FLAG_IMPORT_ONLY = 0x00000002;
enum NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_V0 = 0x00000000;
enum NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_CURRENT_VERSION = 0x00000000;
enum NCRYPT_VSM_KEY_ATTESTATION_STATEMENT_V0 = 0x00000000;
enum NCRYPT_VSM_KEY_ATTESTATION_STATEMENT_CURRENT_VERSION = 0x00000000;
enum NCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS_V0 = 0x00000000;
enum NCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS_CURRENT_VERSION = 0x00000000;
enum NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_V0 = 0x00000000;
enum NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_CURRENT_VERSION = 0x00000000;
enum NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_V0 = 0x00000000;
enum NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_CURRENT_VERSION = 0x00000000;
enum NCRYPT_PAD_CIPHER_FLAG = 0x00000010;
enum NCRYPT_ATTESTATION_FLAG = 0x00000020;
enum NCRYPT_SEALING_FLAG = 0x00000100;
enum NCRYPT_DO_NOT_FINALIZE_FLAG = 0x00000400;
enum NCRYPT_EXPORT_LEGACY_FLAG = 0x00000800;
enum NCRYPT_IGNORE_DEVICE_STATE_FLAG = 0x00001000;
enum NCRYPT_TREAT_NIST_AS_GENERIC_ECC_FLAG = 0x00002000;
enum NCRYPT_NO_CACHED_PASSWORD = 0x00004000;
enum NCRYPT_PROTECT_TO_LOCAL_SYSTEM = 0x00008000;
enum NCRYPT_PREFER_VIRTUAL_ISOLATION_FLAG = 0x00010000;
enum NCRYPT_USE_VIRTUAL_ISOLATION_FLAG = 0x00020000;
enum NCRYPT_USE_PER_BOOT_KEY_FLAG = 0x00040000;
enum NCRYPT_KEY_DERIVATION_OPERATION = 0x00000040;
enum NCRYPT_AUTHORITY_KEY_FLAG = 0x00000100;
enum NCRYPT_NAME_PROPERTY = "Name";
enum NCRYPT_UNIQUE_NAME_PROPERTY = "Unique Name";
enum NCRYPT_ALGORITHM_PROPERTY = "Algorithm Name";
enum NCRYPT_LENGTH_PROPERTY = "Length";
enum NCRYPT_LENGTHS_PROPERTY = "Lengths";
enum NCRYPT_BLOCK_LENGTH_PROPERTY = "Block Length";
enum NCRYPT_PUBLIC_LENGTH_PROPERTY = "PublicKeyLength";
enum NCRYPT_SIGNATURE_LENGTH_PROPERTY = "SignatureLength";
enum NCRYPT_CHAINING_MODE_PROPERTY = "Chaining Mode";
enum NCRYPT_AUTH_TAG_LENGTH = "AuthTagLength";
enum NCRYPT_UI_POLICY_PROPERTY = "UI Policy";
enum NCRYPT_EXPORT_POLICY_PROPERTY = "Export Policy";
enum NCRYPT_WINDOW_HANDLE_PROPERTY = "HWND Handle";
enum NCRYPT_USE_CONTEXT_PROPERTY = "Use Context";
enum NCRYPT_IMPL_TYPE_PROPERTY = "Impl Type";
enum NCRYPT_KEY_USAGE_PROPERTY = "Key Usage";
enum NCRYPT_KEY_TYPE_PROPERTY = "Key Type";
enum NCRYPT_VERSION_PROPERTY = "Version";
enum NCRYPT_SECURITY_DESCR_SUPPORT_PROPERTY = "Security Descr Support";
enum NCRYPT_SECURITY_DESCR_PROPERTY = "Security Descr";
enum NCRYPT_USE_COUNT_ENABLED_PROPERTY = "Enabled Use Count";
enum NCRYPT_USE_COUNT_PROPERTY = "Use Count";
enum NCRYPT_LAST_MODIFIED_PROPERTY = "Modified";
enum NCRYPT_MAX_NAME_LENGTH_PROPERTY = "Max Name Length";
enum NCRYPT_ALGORITHM_GROUP_PROPERTY = "Algorithm Group";
enum NCRYPT_DH_PARAMETERS_PROPERTY = "DHParameters";
enum NCRYPT_ECC_PARAMETERS_PROPERTY = "ECCParameters";
enum NCRYPT_ECC_CURVE_NAME_PROPERTY = "ECCCurveName";
enum NCRYPT_ECC_CURVE_NAME_LIST_PROPERTY = "ECCCurveNameList";
enum NCRYPT_USE_VIRTUAL_ISOLATION_PROPERTY = "Virtual Iso";
enum NCRYPT_USE_PER_BOOT_KEY_PROPERTY = "Per Boot Key";
enum NCRYPT_PROVIDER_HANDLE_PROPERTY = "Provider Handle";
enum NCRYPT_PIN_PROPERTY = "SmartCardPin";
enum NCRYPT_READER_PROPERTY = "SmartCardReader";
enum NCRYPT_SMARTCARD_GUID_PROPERTY = "SmartCardGuid";
enum NCRYPT_CERTIFICATE_PROPERTY = "SmartCardKeyCertificate";
enum NCRYPT_PIN_PROMPT_PROPERTY = "SmartCardPinPrompt";
enum NCRYPT_USER_CERTSTORE_PROPERTY = "SmartCardUserCertStore";
enum NCRYPT_ROOT_CERTSTORE_PROPERTY = "SmartcardRootCertStore";
enum NCRYPT_SECURE_PIN_PROPERTY = "SmartCardSecurePin";
enum NCRYPT_ASSOCIATED_ECDH_KEY = "SmartCardAssociatedECDHKey";
enum NCRYPT_SCARD_PIN_ID = "SmartCardPinId";
enum NCRYPT_SCARD_PIN_INFO = "SmartCardPinInfo";
enum NCRYPT_READER_ICON_PROPERTY = "SmartCardReaderIcon";
enum NCRYPT_KDF_SECRET_VALUE = "KDFKeySecret";
enum NCRYPT_DISMISS_UI_TIMEOUT_SEC_PROPERTY = "SmartCardDismissUITimeoutSeconds";
enum NCRYPT_PCP_PLATFORM_TYPE_PROPERTY = "PCP_PLATFORM_TYPE";
enum NCRYPT_PCP_PROVIDER_VERSION_PROPERTY = "PCP_PROVIDER_VERSION";
enum NCRYPT_PCP_EKPUB_PROPERTY = "PCP_EKPUB";
enum NCRYPT_PCP_EKCERT_PROPERTY = "PCP_EKCERT";
enum NCRYPT_PCP_EKNVCERT_PROPERTY = "PCP_EKNVCERT";
enum NCRYPT_PCP_RSA_EKPUB_PROPERTY = "PCP_RSA_EKPUB";
enum NCRYPT_PCP_RSA_EKCERT_PROPERTY = "PCP_RSA_EKCERT";
enum NCRYPT_PCP_RSA_EKNVCERT_PROPERTY = "PCP_RSA_EKNVCERT";
enum NCRYPT_PCP_ECC_EKPUB_PROPERTY = "PCP_ECC_EKPUB";
enum NCRYPT_PCP_ECC_EKCERT_PROPERTY = "PCP_ECC_EKCERT";
enum NCRYPT_PCP_ECC_EKNVCERT_PROPERTY = "PCP_ECC_EKNVCERT";
enum NCRYPT_PCP_SRKPUB_PROPERTY = "PCP_SRKPUB";
enum NCRYPT_PCP_PCRTABLE_PROPERTY = "PCP_PCRTABLE";
enum NCRYPT_PCP_CHANGEPASSWORD_PROPERTY = "PCP_CHANGEPASSWORD";
enum NCRYPT_PCP_PASSWORD_REQUIRED_PROPERTY = "PCP_PASSWORD_REQUIRED";
enum NCRYPT_PCP_USAGEAUTH_PROPERTY = "PCP_USAGEAUTH";
enum NCRYPT_PCP_MIGRATIONPASSWORD_PROPERTY = "PCP_MIGRATIONPASSWORD";
enum NCRYPT_PCP_EXPORT_ALLOWED_PROPERTY = "PCP_EXPORT_ALLOWED";
enum NCRYPT_PCP_STORAGEPARENT_PROPERTY = "PCP_STORAGEPARENT";
enum NCRYPT_PCP_PROVIDERHANDLE_PROPERTY = "PCP_PROVIDERMHANDLE";
enum NCRYPT_PCP_PLATFORMHANDLE_PROPERTY = "PCP_PLATFORMHANDLE";
enum NCRYPT_PCP_PLATFORM_BINDING_PCRMASK_PROPERTY = "PCP_PLATFORM_BINDING_PCRMASK";
enum NCRYPT_PCP_PLATFORM_BINDING_PCRDIGESTLIST_PROPERTY = "PCP_PLATFORM_BINDING_PCRDIGESTLIST";
enum NCRYPT_PCP_PLATFORM_BINDING_PCRDIGEST_PROPERTY = "PCP_PLATFORM_BINDING_PCRDIGEST";
enum NCRYPT_PCP_KEY_USAGE_POLICY_PROPERTY = "PCP_KEY_USAGE_POLICY";
enum NCRYPT_PCP_RSA_SCHEME_PROPERTY = "PCP_RSA_SCHEME";
enum NCRYPT_PCP_TPM12_IDBINDING_PROPERTY = "PCP_TPM12_IDBINDING";
enum NCRYPT_PCP_TPM12_IDBINDING_DYNAMIC_PROPERTY = "PCP_TPM12_IDBINDING_DYNAMIC";
enum NCRYPT_PCP_TPM12_IDACTIVATION_PROPERTY = "PCP_TPM12_IDACTIVATION";
enum NCRYPT_PCP_KEYATTESTATION_PROPERTY = "PCP_TPM12_KEYATTESTATION";
enum NCRYPT_PCP_ALTERNATE_KEY_STORAGE_LOCATION_PROPERTY = "PCP_ALTERNATE_KEY_STORAGE_LOCATION";
enum NCRYPT_PCP_PLATFORM_BINDING_PCRALGID_PROPERTY = "PCP_PLATFORM_BINDING_PCRALGID";
enum NCRYPT_PCP_HMAC_AUTH_POLICYREF = "PCP_HMAC_AUTH_POLICYREF";
enum NCRYPT_PCP_HMAC_AUTH_POLICYINFO = "PCP_HMAC_AUTH_POLICYINFO";
enum NCRYPT_PCP_HMAC_AUTH_NONCE = "PCP_HMAC_AUTH_NONCE";
enum NCRYPT_PCP_HMAC_AUTH_SIGNATURE = "PCP_HMAC_AUTH_SIGNATURE";
enum NCRYPT_PCP_HMAC_AUTH_TICKET = "PCP_HMAC_AUTH_TICKET";
enum NCRYPT_PCP_NO_DA_PROTECTION_PROPERTY = "PCP_NO_DA_PROTECTION";
enum NCRYPT_PCP_TPM_MANUFACTURER_ID_PROPERTY = "PCP_TPM_MANUFACTURER_ID";
enum NCRYPT_PCP_TPM_FW_VERSION_PROPERTY = "PCP_TPM_FW_VERSION";
enum NCRYPT_PCP_TPM2BNAME_PROPERTY = "PCP_TPM2BNAME";
enum NCRYPT_PCP_TPM_VERSION_PROPERTY = "PCP_TPM_VERSION";
enum NCRYPT_PCP_RAW_POLICYDIGEST_PROPERTY = "PCP_RAW_POLICYDIGEST";
enum NCRYPT_PCP_KEY_CREATIONHASH_PROPERTY = "PCP_KEY_CREATIONHASH";
enum NCRYPT_PCP_KEY_CREATIONTICKET_PROPERTY = "PCP_KEY_CREATIONTICKET";
enum NCRYPT_PCP_RSA_SCHEME_HASH_ALG_PROPERTY = "PCP_RSA_SCHEME_HASH_ALG";
enum NCRYPT_PCP_TPM_IFX_RSA_KEYGEN_PROHIBITED_PROPERTY = "PCP_TPM_IFX_RSA_KEYGEN_PROHIBITED";
enum NCRYPT_PCP_TPM_IFX_RSA_KEYGEN_VULNERABILITY_PROPERTY = "PCP_TPM_IFX_RSA_KEYGEN_VULNERABILITY";
enum IFX_RSA_KEYGEN_VUL_NOT_AFFECTED = 0x00000000;
enum IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_1 = 0x00000001;
enum IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_2 = 0x00000002;
enum NCRYPT_PCP_SESSIONID_PROPERTY = "PCP_SESSIONID";
enum NCRYPT_PCP_PSS_SALT_SIZE_PROPERTY = "PSS Salt Size";
enum NCRYPT_TPM_PSS_SALT_SIZE_UNKNOWN = 0x00000000;
enum NCRYPT_TPM_PSS_SALT_SIZE_MAXIMUM = 0x00000001;
enum NCRYPT_TPM_PSS_SALT_SIZE_HASHSIZE = 0x00000002;
enum NCRYPT_PCP_INTERMEDIATE_CA_EKCERT_PROPERTY = "PCP_INTERMEDIATE_CA_EKCERT";
enum NCRYPT_PCP_PCRTABLE_ALGORITHM_PROPERTY = "PCP_PCRTABLE_ALGORITHM";
enum NCRYPT_PCP_SYMMETRIC_KEYBITS_PROPERTY = "PCP_SYMMETRIC_KEYBITS";
enum NCRYPT_TPM_PAD_PSS_IGNORE_SALT = 0x00000020;
enum NCRYPT_TPM12_PROVIDER = 0x00010000;
enum NCRYPT_PCP_SIGNATURE_KEY = 0x00000001;
enum NCRYPT_PCP_ENCRYPTION_KEY = 0x00000002;
enum NCRYPT_PCP_STORAGE_KEY = 0x00000004;
enum NCRYPT_PCP_IDENTITY_KEY = 0x00000008;
enum NCRYPT_PCP_HMACVERIFICATION_KEY = 0x00000010;
enum NCRYPT_SCARD_NGC_KEY_NAME = "SmartCardNgcKeyName";
enum NCRYPT_INITIALIZATION_VECTOR = "IV";
enum NCRYPT_CHANGEPASSWORD_PROPERTY = "PCP_CHANGEPASSWORD";
enum NCRYPT_ALTERNATE_KEY_STORAGE_LOCATION_PROPERTY = "PCP_ALTERNATE_KEY_STORAGE_LOCATION";
enum NCRYPT_KEY_ACCESS_POLICY_PROPERTY = "Key Access Policy";
enum NCRYPT_MAX_PROPERTY_NAME = 0x00000040;
enum NCRYPT_MAX_PROPERTY_DATA = 0x00100000;
enum NCRYPT_ALLOW_EXPORT_FLAG = 0x00000001;
enum NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG = 0x00000002;
enum NCRYPT_ALLOW_ARCHIVING_FLAG = 0x00000004;
enum NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG = 0x00000008;
enum NCRYPT_IMPL_HARDWARE_FLAG = 0x00000001;
enum NCRYPT_IMPL_SOFTWARE_FLAG = 0x00000002;
enum NCRYPT_IMPL_REMOVABLE_FLAG = 0x00000008;
enum NCRYPT_IMPL_HARDWARE_RNG_FLAG = 0x00000010;
enum NCRYPT_IMPL_VIRTUAL_ISOLATION_FLAG = 0x00000020;
enum NCRYPT_ALLOW_DECRYPT_FLAG = 0x00000001;
enum NCRYPT_ALLOW_SIGNING_FLAG = 0x00000002;
enum NCRYPT_ALLOW_KEY_AGREEMENT_FLAG = 0x00000004;
enum NCRYPT_ALLOW_KEY_IMPORT_FLAG = 0x00000008;
enum NCRYPT_ALLOW_ALL_USAGES = 0x00ffffff;
enum NCRYPT_UI_PROTECT_KEY_FLAG = 0x00000001;
enum NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG = 0x00000002;
enum NCRYPT_UI_FINGERPRINT_PROTECTION_FLAG = 0x00000004;
enum NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG = 0x00000008;
enum NCRYPT_PIN_CACHE_FREE_APPLICATION_TICKET_PROPERTY = "PinCacheFreeApplicationTicket";
enum NCRYPT_PIN_CACHE_FLAGS_PROPERTY = "PinCacheFlags";
enum NCRYPT_PIN_CACHE_DISABLE_DPL_FLAG = 0x00000001;
enum NCRYPT_PIN_CACHE_APPLICATION_TICKET_PROPERTY = "PinCacheApplicationTicket";
enum NCRYPT_PIN_CACHE_APPLICATION_IMAGE_PROPERTY = "PinCacheApplicationImage";
enum NCRYPT_PIN_CACHE_APPLICATION_STATUS_PROPERTY = "PinCacheApplicationStatus";
enum NCRYPT_PIN_CACHE_PIN_PROPERTY = "PinCachePin";
enum NCRYPT_PIN_CACHE_IS_GESTURE_REQUIRED_PROPERTY = "PinCacheIsGestureRequired";
enum NCRYPT_PIN_CACHE_REQUIRE_GESTURE_FLAG = 0x00000001;
enum NCRYPT_PIN_CACHE_APPLICATION_TICKET_BYTE_LENGTH = 0x0000005a;
enum NCRYPT_PIN_CACHE_CLEAR_PROPERTY = "PinCacheClear";
enum NCRYPT_PIN_CACHE_CLEAR_FOR_CALLING_PROCESS_OPTION = 0x00000001;
enum NCRYPT_KEY_ACCESS_POLICY_VERSION = 0x00000001;
enum NCRYPT_ALLOW_SILENT_KEY_ACCESS = 0x00000001;
enum NCRYPT_CIPHER_KEY_BLOB_MAGIC = 0x52485043;
enum NCRYPT_KDF_KEY_BLOB_MAGIC = 0x3146444b;
enum NCRYPT_PROTECTED_KEY_BLOB_MAGIC = 0x4b545250;
enum NCRYPT_CIPHER_KEY_BLOB = "CipherKeyBlob";
enum NCRYPT_KDF_KEY_BLOB = "KDFKeyBlob";
enum NCRYPT_PROTECTED_KEY_BLOB = "ProtectedKeyBlob";
enum NCRYPT_TPM_LOADABLE_KEY_BLOB = "PcpTpmProtectedKeyBlob";
enum NCRYPT_TPM_LOADABLE_KEY_BLOB_MAGIC = 0x4d54504b;
enum NCRYPT_PKCS7_ENVELOPE_BLOB = "PKCS7_ENVELOPE";
enum NCRYPT_PKCS8_PRIVATE_KEY_BLOB = "PKCS8_PRIVATEKEY";
enum NCRYPT_OPAQUETRANSPORT_BLOB = "OpaqueTransport";
enum NCRYPT_ISOLATED_KEY_ENVELOPE_BLOB = "ISOLATED_KEY_ENVELOPE";
enum NCRYPT_DESCR_DELIMITER_OR = "OR";
enum NCRYPT_DESCR_DELIMITER_AND = "AND";
enum NCRYPT_DESCR_EQUAL = "=";
enum MS_KEY_PROTECTION_PROVIDER = "Microsoft Key Protection Provider";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_SID = "SID";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_LOCAL = "LOCAL";
enum NCRYPT_KEY_PROTECTION_LOCAL_LOGON = "logon";
enum NCRYPT_KEY_PROTECTION_LOCAL_USER = "user";
enum NCRYPT_KEY_PROTECTION_LOCAL_MACHINE = "machine";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_SDDL = "SDDL";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_WEBCREDENTIALS = "WEBCREDENTIALS";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_LOCKEDCREDENTIALS = "LOCKEDCREDENTIALS";
enum NCRYPT_KEY_PROTECTION_ALGORITHM_CERTIFICATE = "CERTIFICATE";
enum NCRYPT_KEY_PROTECTION_CERT_HASHID = "HashId";
enum NCRYPT_KEY_PROTECTION_CERT_CERTBLOB = "CertBlob";
enum NCRYPT_NAMED_DESCRIPTOR_FLAG = 0x00000001;
enum NCRYPT_PROTECTION_INFO_TYPE_DESCRIPTOR_STRING = 0x00000001;
enum ALG_CLASS_ANY = 0x00000000;
enum ALG_CLASS_SIGNATURE = 0x00002000;
enum ALG_CLASS_MSG_ENCRYPT = 0x00004000;
enum ALG_CLASS_DATA_ENCRYPT = 0x00006000;
enum ALG_CLASS_HASH = 0x00008000;
enum ALG_CLASS_KEY_EXCHANGE = 0x0000a000;
enum ALG_CLASS_ALL = 0x0000e000;
enum ALG_TYPE_ANY = 0x00000000;
enum ALG_TYPE_DSS = 0x00000200;
enum ALG_TYPE_RSA = 0x00000400;
enum ALG_TYPE_BLOCK = 0x00000600;
enum ALG_TYPE_STREAM = 0x00000800;
enum ALG_TYPE_DH = 0x00000a00;
enum ALG_TYPE_SECURECHANNEL = 0x00000c00;
enum ALG_TYPE_ECDH = 0x00000e00;
enum ALG_TYPE_THIRDPARTY = 0x00001000;
enum ALG_SID_ANY = 0x00000000;
enum ALG_SID_THIRDPARTY_ANY = 0x00000000;
enum ALG_SID_RSA_ANY = 0x00000000;
enum ALG_SID_RSA_PKCS = 0x00000001;
enum ALG_SID_RSA_MSATWORK = 0x00000002;
enum ALG_SID_RSA_ENTRUST = 0x00000003;
enum ALG_SID_RSA_PGP = 0x00000004;
enum ALG_SID_DSS_ANY = 0x00000000;
enum ALG_SID_DSS_PKCS = 0x00000001;
enum ALG_SID_DSS_DMS = 0x00000002;
enum ALG_SID_ECDSA = 0x00000003;
enum ALG_SID_DES = 0x00000001;
enum ALG_SID_3DES = 0x00000003;
enum ALG_SID_DESX = 0x00000004;
enum ALG_SID_IDEA = 0x00000005;
enum ALG_SID_CAST = 0x00000006;
enum ALG_SID_SAFERSK64 = 0x00000007;
enum ALG_SID_SAFERSK128 = 0x00000008;
enum ALG_SID_3DES_112 = 0x00000009;
enum ALG_SID_CYLINK_MEK = 0x0000000c;
enum ALG_SID_RC5 = 0x0000000d;
enum ALG_SID_AES_128 = 0x0000000e;
enum ALG_SID_AES_192 = 0x0000000f;
enum ALG_SID_AES_256 = 0x00000010;
enum ALG_SID_AES = 0x00000011;
enum ALG_SID_SKIPJACK = 0x0000000a;
enum ALG_SID_TEK = 0x0000000b;
enum CRYPT_MODE_CBCI = 0x00000006;
enum CRYPT_MODE_CFBP = 0x00000007;
enum CRYPT_MODE_OFBP = 0x00000008;
enum CRYPT_MODE_CBCOFM = 0x00000009;
enum CRYPT_MODE_CBCOFMI = 0x0000000a;
enum ALG_SID_RC2 = 0x00000002;
enum ALG_SID_RC4 = 0x00000001;
enum ALG_SID_SEAL = 0x00000002;
enum ALG_SID_DH_SANDF = 0x00000001;
enum ALG_SID_DH_EPHEM = 0x00000002;
enum ALG_SID_AGREED_KEY_ANY = 0x00000003;
enum ALG_SID_KEA = 0x00000004;
enum ALG_SID_ECDH = 0x00000005;
enum ALG_SID_ECDH_EPHEM = 0x00000006;
enum ALG_SID_MD2 = 0x00000001;
enum ALG_SID_MD4 = 0x00000002;
enum ALG_SID_MD5 = 0x00000003;
enum ALG_SID_SHA = 0x00000004;
enum ALG_SID_SHA1 = 0x00000004;
enum ALG_SID_MAC = 0x00000005;
enum ALG_SID_RIPEMD = 0x00000006;
enum ALG_SID_RIPEMD160 = 0x00000007;
enum ALG_SID_SSL3SHAMD5 = 0x00000008;
enum ALG_SID_HMAC = 0x00000009;
enum ALG_SID_TLS1PRF = 0x0000000a;
enum ALG_SID_HASH_REPLACE_OWF = 0x0000000b;
enum ALG_SID_SHA_256 = 0x0000000c;
enum ALG_SID_SHA_384 = 0x0000000d;
enum ALG_SID_SHA_512 = 0x0000000e;
enum ALG_SID_SSL3_MASTER = 0x00000001;
enum ALG_SID_SCHANNEL_MASTER_HASH = 0x00000002;
enum ALG_SID_SCHANNEL_MAC_KEY = 0x00000003;
enum ALG_SID_PCT1_MASTER = 0x00000004;
enum ALG_SID_SSL2_MASTER = 0x00000005;
enum ALG_SID_TLS1_MASTER = 0x00000006;
enum ALG_SID_SCHANNEL_ENC_KEY = 0x00000007;
enum ALG_SID_ECMQV = 0x00000001;
enum ALG_SID_EXAMPLE = 0x00000050;
enum SIGNATURE_RESOURCE_NUMBER = 0x0000029a;
enum CRYPT_VERIFYCONTEXT = 0xf0000000;
enum CRYPT_NEWKEYSET = 0x00000008;
enum CRYPT_DELETEKEYSET = 0x00000010;
enum CRYPT_SILENT = 0x00000040;
enum CRYPT_DEFAULT_CONTAINER_OPTIONAL = 0x00000080;
enum CRYPT_UPDATE_KEY = 0x00000008;
enum CRYPT_USER_PROTECTED_STRONG = 0x00100000;
enum RSA1024BIT_KEY = 0x04000000;
enum CRYPT_SERVER = 0x00000400;
enum KEY_LENGTH_MASK = 0xffff0000;
enum CRYPT_DECRYPT_RSA_NO_PADDING_CHECK = 0x00000020;
enum CRYPT_SECRETDIGEST = 0x00000001;
enum CRYPT_OWF_REPL_LM_HASH = 0x00000001;
enum CRYPT_LITTLE_ENDIAN = 0x00000001;
enum CRYPT_NOHASHOID = 0x00000001;
enum CRYPT_TYPE2_FORMAT = 0x00000002;
enum CRYPT_X931_FORMAT = 0x00000004;
enum CRYPT_MACHINE_DEFAULT = 0x00000001;
enum CRYPT_USER_DEFAULT = 0x00000002;
enum CRYPT_DELETE_DEFAULT = 0x00000004;
enum SIMPLEBLOB = 0x00000001;
enum PUBLICKEYBLOB = 0x00000006;
enum PRIVATEKEYBLOB = 0x00000007;
enum PLAINTEXTKEYBLOB = 0x00000008;
enum OPAQUEKEYBLOB = 0x00000009;
enum PUBLICKEYBLOBEX = 0x0000000a;
enum SYMMETRICWRAPKEYBLOB = 0x0000000b;
enum KEYSTATEBLOB = 0x0000000c;
enum CRYPT_USERDATA = 0x00000001;
enum KP_IV = 0x00000001;
enum KP_PADDING = 0x00000003;
enum KP_MODE = 0x00000004;
enum KP_MODE_BITS = 0x00000005;
enum KP_P = 0x0000000b;
enum KP_G = 0x0000000c;
enum KP_Q = 0x0000000d;
enum KP_X = 0x0000000e;
enum KP_Y = 0x0000000f;
enum KP_RA = 0x00000010;
enum KP_RB = 0x00000011;
enum KP_INFO = 0x00000012;
enum KP_EFFECTIVE_KEYLEN = 0x00000013;
enum KP_SCHANNEL_ALG = 0x00000014;
enum KP_CLIENT_RANDOM = 0x00000015;
enum KP_SERVER_RANDOM = 0x00000016;
enum KP_RP = 0x00000017;
enum KP_PRECOMP_MD5 = 0x00000018;
enum KP_PRECOMP_SHA = 0x00000019;
enum KP_CLEAR_KEY = 0x0000001b;
enum KP_PUB_EX_LEN = 0x0000001c;
enum KP_PUB_EX_VAL = 0x0000001d;
enum KP_KEYVAL = 0x0000001e;
enum KP_ADMIN_PIN = 0x0000001f;
enum KP_KEYEXCHANGE_PIN = 0x00000020;
enum KP_SIGNATURE_PIN = 0x00000021;
enum KP_PREHASH = 0x00000022;
enum KP_ROUNDS = 0x00000023;
enum KP_OAEP_PARAMS = 0x00000024;
enum KP_CMS_KEY_INFO = 0x00000025;
enum KP_CMS_DH_KEY_INFO = 0x00000026;
enum KP_PUB_PARAMS = 0x00000027;
enum KP_VERIFY_PARAMS = 0x00000028;
enum KP_HIGHEST_VERSION = 0x00000029;
enum KP_PIN_ID = 0x0000002b;
enum KP_PIN_INFO = 0x0000002c;
enum PKCS5_PADDING = 0x00000001;
enum RANDOM_PADDING = 0x00000002;
enum ZERO_PADDING = 0x00000003;
enum CRYPT_MODE_CBC = 0x00000001;
enum CRYPT_MODE_ECB = 0x00000002;
enum CRYPT_MODE_OFB = 0x00000003;
enum CRYPT_MODE_CFB = 0x00000004;
enum CRYPT_MODE_CTS = 0x00000005;
enum CRYPT_ENCRYPT = 0x00000001;
enum CRYPT_DECRYPT = 0x00000002;
enum CRYPT_EXPORT = 0x00000004;
enum CRYPT_READ = 0x00000008;
enum CRYPT_WRITE = 0x00000010;
enum CRYPT_MAC = 0x00000020;
enum CRYPT_EXPORT_KEY = 0x00000040;
enum CRYPT_IMPORT_KEY = 0x00000080;
enum CRYPT_ARCHIVE = 0x00000100;
enum HP_ALGID = 0x00000001;
enum HP_HASHSIZE = 0x00000004;
enum HP_TLS1PRF_LABEL = 0x00000006;
enum HP_TLS1PRF_SEED = 0x00000007;
enum CRYPT_FAILED = 0x00000000;
enum CRYPT_SUCCEED = 0x00000001;
enum PP_ENUMALGS = 0x00000001;
enum PP_ENUMCONTAINERS = 0x00000002;
enum PP_IMPTYPE = 0x00000003;
enum PP_NAME = 0x00000004;
enum PP_VERSION = 0x00000005;
enum PP_CONTAINER = 0x00000006;
enum PP_CHANGE_PASSWORD = 0x00000007;
enum PP_CERTCHAIN = 0x00000009;
enum PP_KEY_TYPE_SUBTYPE = 0x0000000a;
enum PP_PROVTYPE = 0x00000010;
enum PP_KEYSTORAGE = 0x00000011;
enum PP_APPLI_CERT = 0x00000012;
enum PP_SYM_KEYSIZE = 0x00000013;
enum PP_SESSION_KEYSIZE = 0x00000014;
enum PP_ENUMALGS_EX = 0x00000016;
enum PP_ENUMMANDROOTS = 0x00000019;
enum PP_ENUMELECTROOTS = 0x0000001a;
enum PP_KEYSET_TYPE = 0x0000001b;
enum PP_ADMIN_PIN = 0x0000001f;
enum PP_SIG_KEYSIZE_INC = 0x00000022;
enum PP_KEYX_KEYSIZE_INC = 0x00000023;
enum PP_UNIQUE_CONTAINER = 0x00000024;
enum PP_SGC_INFO = 0x00000025;
enum PP_KEYSPEC = 0x00000027;
enum PP_ENUMEX_SIGNING_PROT = 0x00000028;
enum PP_CRYPT_COUNT_KEY_USE = 0x00000029;
enum PP_SMARTCARD_GUID = 0x0000002d;
enum PP_SMARTCARD_READER_ICON = 0x0000002f;
enum CRYPT_FIRST = 0x00000001;
enum CRYPT_NEXT = 0x00000002;
enum CRYPT_SGC_ENUM = 0x00000004;
enum CRYPT_IMPL_HARDWARE = 0x00000001;
enum CRYPT_IMPL_SOFTWARE = 0x00000002;
enum CRYPT_IMPL_MIXED = 0x00000003;
enum CRYPT_IMPL_UNKNOWN = 0x00000004;
enum CRYPT_IMPL_REMOVABLE = 0x00000008;
enum CRYPT_SEC_DESCR = 0x00000001;
enum CRYPT_PSTORE = 0x00000002;
enum CRYPT_UI_PROMPT = 0x00000004;
enum CRYPT_FLAG_PCT1 = 0x00000001;
enum CRYPT_FLAG_SSL2 = 0x00000002;
enum CRYPT_FLAG_SSL3 = 0x00000004;
enum CRYPT_FLAG_TLS1 = 0x00000008;
enum CRYPT_FLAG_IPSEC = 0x00000010;
enum CRYPT_FLAG_SIGNING = 0x00000020;
enum CRYPT_SGC = 0x00000001;
enum CRYPT_FASTSGC = 0x00000002;
enum PP_CONTEXT_INFO = 0x0000000b;
enum PP_DISMISS_PIN_UI_SEC = 0x00000031;
enum PROV_RSA_FULL = 0x00000001;
enum PROV_RSA_SIG = 0x00000002;
enum PROV_DSS = 0x00000003;
enum PROV_FORTEZZA = 0x00000004;
enum PROV_MS_EXCHANGE = 0x00000005;
enum PROV_SSL = 0x00000006;
enum PROV_RSA_SCHANNEL = 0x0000000c;
enum PROV_DSS_DH = 0x0000000d;
enum PROV_EC_ECDSA_SIG = 0x0000000e;
enum PROV_EC_ECNRA_SIG = 0x0000000f;
enum PROV_EC_ECDSA_FULL = 0x00000010;
enum PROV_EC_ECNRA_FULL = 0x00000011;
enum PROV_DH_SCHANNEL = 0x00000012;
enum PROV_SPYRUS_LYNKS = 0x00000014;
enum PROV_RNG = 0x00000015;
enum PROV_INTEL_SEC = 0x00000016;
enum PROV_REPLACE_OWF = 0x00000017;
enum PROV_RSA_AES = 0x00000018;
enum PROV_STT_MER = 0x00000007;
enum PROV_STT_ACQ = 0x00000008;
enum PROV_STT_BRND = 0x00000009;
enum PROV_STT_ROOT = 0x0000000a;
enum PROV_STT_ISS = 0x0000000b;
enum MS_DEF_PROV_A = "Microsoft Base Cryptographic Provider v1.0";
enum MS_DEF_PROV_W = "Microsoft Base Cryptographic Provider v1.0";
enum MS_DEF_PROV = "Microsoft Base Cryptographic Provider v1.0";
enum MS_ENHANCED_PROV_A = "Microsoft Enhanced Cryptographic Provider v1.0";
enum MS_ENHANCED_PROV_W = "Microsoft Enhanced Cryptographic Provider v1.0";
enum MS_ENHANCED_PROV = "Microsoft Enhanced Cryptographic Provider v1.0";
enum MS_STRONG_PROV_A = "Microsoft Strong Cryptographic Provider";
enum MS_STRONG_PROV_W = "Microsoft Strong Cryptographic Provider";
enum MS_STRONG_PROV = "Microsoft Strong Cryptographic Provider";
enum MS_DEF_RSA_SIG_PROV_A = "Microsoft RSA Signature Cryptographic Provider";
enum MS_DEF_RSA_SIG_PROV_W = "Microsoft RSA Signature Cryptographic Provider";
enum MS_DEF_RSA_SIG_PROV = "Microsoft RSA Signature Cryptographic Provider";
enum MS_DEF_RSA_SCHANNEL_PROV_A = "Microsoft RSA SChannel Cryptographic Provider";
enum MS_DEF_RSA_SCHANNEL_PROV_W = "Microsoft RSA SChannel Cryptographic Provider";
enum MS_DEF_RSA_SCHANNEL_PROV = "Microsoft RSA SChannel Cryptographic Provider";
enum MS_DEF_DSS_PROV_A = "Microsoft Base DSS Cryptographic Provider";
enum MS_DEF_DSS_PROV_W = "Microsoft Base DSS Cryptographic Provider";
enum MS_DEF_DSS_PROV = "Microsoft Base DSS Cryptographic Provider";
enum MS_DEF_DSS_DH_PROV_A = "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider";
enum MS_DEF_DSS_DH_PROV_W = "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider";
enum MS_DEF_DSS_DH_PROV = "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider";
enum MS_ENH_DSS_DH_PROV_A = "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider";
enum MS_ENH_DSS_DH_PROV_W = "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider";
enum MS_ENH_DSS_DH_PROV = "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider";
enum MS_DEF_DH_SCHANNEL_PROV_A = "Microsoft DH SChannel Cryptographic Provider";
enum MS_DEF_DH_SCHANNEL_PROV_W = "Microsoft DH SChannel Cryptographic Provider";
enum MS_DEF_DH_SCHANNEL_PROV = "Microsoft DH SChannel Cryptographic Provider";
enum MS_SCARD_PROV_A = "Microsoft Base Smart Card Crypto Provider";
enum MS_SCARD_PROV_W = "Microsoft Base Smart Card Crypto Provider";
enum MS_SCARD_PROV = "Microsoft Base Smart Card Crypto Provider";
enum MS_ENH_RSA_AES_PROV_A = "Microsoft Enhanced RSA and AES Cryptographic Provider";
enum MS_ENH_RSA_AES_PROV_W = "Microsoft Enhanced RSA and AES Cryptographic Provider";
enum MS_ENH_RSA_AES_PROV_XP_A = "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)";
enum MS_ENH_RSA_AES_PROV_XP_W = "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)";
enum MS_ENH_RSA_AES_PROV_XP = "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)";
enum MS_ENH_RSA_AES_PROV = "Microsoft Enhanced RSA and AES Cryptographic Provider";
enum MAXUIDLEN = 0x00000040;
enum EXPO_OFFLOAD_REG_VALUE = "ExpoOffload";
enum EXPO_OFFLOAD_FUNC_NAME = "OffloadModExpo";
enum szKEY_CRYPTOAPI_PRIVATE_KEY_OPTIONS = "Software\\Policies\\Microsoft\\Cryptography";
enum szKEY_CACHE_ENABLED = "CachePrivateKeys";
enum szKEY_CACHE_SECONDS = "PrivateKeyLifetimeSeconds";
enum szPRIV_KEY_CACHE_MAX_ITEMS = "PrivKeyCacheMaxItems";
enum cPRIV_KEY_CACHE_MAX_ITEMS_DEFAULT = 0x00000014;
enum szPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS = "PrivKeyCachePurgeIntervalSeconds";
enum cPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS_DEFAULT = 0x00015180;
enum CUR_BLOB_VERSION = 0x00000002;
enum SCHANNEL_MAC_KEY = 0x00000000;
enum SCHANNEL_ENC_KEY = 0x00000001;
enum INTERNATIONAL_USAGE = 0x00000001;
enum szOID_RSA = "1.2.840.113549";
enum szOID_PKCS = "1.2.840.113549.1";
enum szOID_RSA_HASH = "1.2.840.113549.2";
enum szOID_RSA_ENCRYPT = "1.2.840.113549.3";
enum szOID_PKCS_1 = "1.2.840.113549.1.1";
enum szOID_PKCS_2 = "1.2.840.113549.1.2";
enum szOID_PKCS_3 = "1.2.840.113549.1.3";
enum szOID_PKCS_4 = "1.2.840.113549.1.4";
enum szOID_PKCS_5 = "1.2.840.113549.1.5";
enum szOID_PKCS_6 = "1.2.840.113549.1.6";
enum szOID_PKCS_7 = "1.2.840.113549.1.7";
enum szOID_PKCS_8 = "1.2.840.113549.1.8";
enum szOID_PKCS_9 = "1.2.840.113549.1.9";
enum szOID_PKCS_10 = "1.2.840.113549.1.10";
enum szOID_PKCS_12 = "1.2.840.113549.1.12";
enum szOID_RSA_RSA = "1.2.840.113549.1.1.1";
enum szOID_RSA_MD2RSA = "1.2.840.113549.1.1.2";
enum szOID_RSA_MD4RSA = "1.2.840.113549.1.1.3";
enum szOID_RSA_MD5RSA = "1.2.840.113549.1.1.4";
enum szOID_RSA_SHA1RSA = "1.2.840.113549.1.1.5";
enum szOID_RSA_SETOAEP_RSA = "1.2.840.113549.1.1.6";
enum szOID_RSAES_OAEP = "1.2.840.113549.1.1.7";
enum szOID_RSA_MGF1 = "1.2.840.113549.1.1.8";
enum szOID_RSA_PSPECIFIED = "1.2.840.113549.1.1.9";
enum szOID_RSA_SSA_PSS = "1.2.840.113549.1.1.10";
enum szOID_RSA_SHA256RSA = "1.2.840.113549.1.1.11";
enum szOID_RSA_SHA384RSA = "1.2.840.113549.1.1.12";
enum szOID_RSA_SHA512RSA = "1.2.840.113549.1.1.13";
enum szOID_RSA_DH = "1.2.840.113549.1.3.1";
enum szOID_RSA_data = "1.2.840.113549.1.7.1";
enum szOID_RSA_signedData = "1.2.840.113549.1.7.2";
enum szOID_RSA_envelopedData = "1.2.840.113549.1.7.3";
enum szOID_RSA_signEnvData = "1.2.840.113549.1.7.4";
enum szOID_RSA_digestedData = "1.2.840.113549.1.7.5";
enum szOID_RSA_hashedData = "1.2.840.113549.1.7.5";
enum szOID_RSA_encryptedData = "1.2.840.113549.1.7.6";
enum szOID_RSA_emailAddr = "1.2.840.113549.1.9.1";
enum szOID_RSA_unstructName = "1.2.840.113549.1.9.2";
enum szOID_RSA_contentType = "1.2.840.113549.1.9.3";
enum szOID_RSA_messageDigest = "1.2.840.113549.1.9.4";
enum szOID_RSA_signingTime = "1.2.840.113549.1.9.5";
enum szOID_RSA_counterSign = "1.2.840.113549.1.9.6";
enum szOID_RSA_challengePwd = "1.2.840.113549.1.9.7";
enum szOID_RSA_unstructAddr = "1.2.840.113549.1.9.8";
enum szOID_RSA_extCertAttrs = "1.2.840.113549.1.9.9";
enum szOID_RSA_certExtensions = "1.2.840.113549.1.9.14";
enum szOID_RSA_SMIMECapabilities = "1.2.840.113549.1.9.15";
enum szOID_RSA_preferSignedData = "1.2.840.113549.1.9.15.1";
enum szOID_TIMESTAMP_TOKEN = "1.2.840.113549.1.9.16.1.4";
enum szOID_RFC3161_counterSign = "1.3.6.1.4.1.311.3.3.1";
enum szOID_RSA_SMIMEalg = "1.2.840.113549.1.9.16.3";
enum szOID_RSA_SMIMEalgESDH = "1.2.840.113549.1.9.16.3.5";
enum szOID_RSA_SMIMEalgCMS3DESwrap = "1.2.840.113549.1.9.16.3.6";
enum szOID_RSA_SMIMEalgCMSRC2wrap = "1.2.840.113549.1.9.16.3.7";
enum szOID_RSA_MD2 = "1.2.840.113549.2.2";
enum szOID_RSA_MD4 = "1.2.840.113549.2.4";
enum szOID_RSA_MD5 = "1.2.840.113549.2.5";
enum szOID_RSA_RC2CBC = "1.2.840.113549.3.2";
enum szOID_RSA_RC4 = "1.2.840.113549.3.4";
enum szOID_RSA_DES_EDE3_CBC = "1.2.840.113549.3.7";
enum szOID_RSA_RC5_CBCPad = "1.2.840.113549.3.9";
enum szOID_ANSI_X942 = "1.2.840.10046";
enum szOID_ANSI_X942_DH = "1.2.840.10046.2.1";
enum szOID_X957 = "1.2.840.10040";
enum szOID_X957_DSA = "1.2.840.10040.4.1";
enum szOID_X957_SHA1DSA = "1.2.840.10040.4.3";
enum szOID_ECC_PUBLIC_KEY = "1.2.840.10045.2.1";
enum szOID_ECC_CURVE_P256 = "1.2.840.10045.3.1.7";
enum szOID_ECC_CURVE_P384 = "1.3.132.0.34";
enum szOID_ECC_CURVE_P521 = "1.3.132.0.35";
enum szOID_ECC_CURVE_BRAINPOOLP160R1 = "1.3.36.3.3.2.8.1.1.1";
enum szOID_ECC_CURVE_BRAINPOOLP160T1 = "1.3.36.3.3.2.8.1.1.2";
enum szOID_ECC_CURVE_BRAINPOOLP192R1 = "1.3.36.3.3.2.8.1.1.3";
enum szOID_ECC_CURVE_BRAINPOOLP192T1 = "1.3.36.3.3.2.8.1.1.4";
enum szOID_ECC_CURVE_BRAINPOOLP224R1 = "1.3.36.3.3.2.8.1.1.5";
enum szOID_ECC_CURVE_BRAINPOOLP224T1 = "1.3.36.3.3.2.8.1.1.6";
enum szOID_ECC_CURVE_BRAINPOOLP256R1 = "1.3.36.3.3.2.8.1.1.7";
enum szOID_ECC_CURVE_BRAINPOOLP256T1 = "1.3.36.3.3.2.8.1.1.8";
enum szOID_ECC_CURVE_BRAINPOOLP320R1 = "1.3.36.3.3.2.8.1.1.9";
enum szOID_ECC_CURVE_BRAINPOOLP320T1 = "1.3.36.3.3.2.8.1.1.10";
enum szOID_ECC_CURVE_BRAINPOOLP384R1 = "1.3.36.3.3.2.8.1.1.11";
enum szOID_ECC_CURVE_BRAINPOOLP384T1 = "1.3.36.3.3.2.8.1.1.12";
enum szOID_ECC_CURVE_BRAINPOOLP512R1 = "1.3.36.3.3.2.8.1.1.13";
enum szOID_ECC_CURVE_BRAINPOOLP512T1 = "1.3.36.3.3.2.8.1.1.14";
enum szOID_ECC_CURVE_EC192WAPI = "1.2.156.11235.1.1.2.1";
enum szOID_CN_ECDSA_SHA256 = "1.2.156.11235.1.1.1";
enum szOID_ECC_CURVE_NISTP192 = "1.2.840.10045.3.1.1";
enum szOID_ECC_CURVE_NISTP224 = "1.3.132.0.33";
enum szOID_ECC_CURVE_NISTP256 = "1.2.840.10045.3.1.7";
enum szOID_ECC_CURVE_NISTP384 = "1.3.132.0.34";
enum szOID_ECC_CURVE_NISTP521 = "1.3.132.0.35";
enum szOID_ECC_CURVE_SECP160K1 = "1.3.132.0.9";
enum szOID_ECC_CURVE_SECP160R1 = "1.3.132.0.8";
enum szOID_ECC_CURVE_SECP160R2 = "1.3.132.0.30";
enum szOID_ECC_CURVE_SECP192K1 = "1.3.132.0.31";
enum szOID_ECC_CURVE_SECP192R1 = "1.2.840.10045.3.1.1";
enum szOID_ECC_CURVE_SECP224K1 = "1.3.132.0.32";
enum szOID_ECC_CURVE_SECP224R1 = "1.3.132.0.33";
enum szOID_ECC_CURVE_SECP256K1 = "1.3.132.0.10";
enum szOID_ECC_CURVE_SECP256R1 = "1.2.840.10045.3.1.7";
enum szOID_ECC_CURVE_SECP384R1 = "1.3.132.0.34";
enum szOID_ECC_CURVE_SECP521R1 = "1.3.132.0.35";
enum szOID_ECC_CURVE_WTLS7 = "1.3.132.0.30";
enum szOID_ECC_CURVE_WTLS9 = "2.23.43.1.4.9";
enum szOID_ECC_CURVE_WTLS12 = "1.3.132.0.33";
enum szOID_ECC_CURVE_X962P192V1 = "1.2.840.10045.3.1.1";
enum szOID_ECC_CURVE_X962P192V2 = "1.2.840.10045.3.1.2";
enum szOID_ECC_CURVE_X962P192V3 = "1.2.840.10045.3.1.3";
enum szOID_ECC_CURVE_X962P239V1 = "1.2.840.10045.3.1.4";
enum szOID_ECC_CURVE_X962P239V2 = "1.2.840.10045.3.1.5";
enum szOID_ECC_CURVE_X962P239V3 = "1.2.840.10045.3.1.6";
enum szOID_ECC_CURVE_X962P256V1 = "1.2.840.10045.3.1.7";
enum szOID_ECDSA_SHA1 = "1.2.840.10045.4.1";
enum szOID_ECDSA_SPECIFIED = "1.2.840.10045.4.3";
enum szOID_ECDSA_SHA256 = "1.2.840.10045.4.3.2";
enum szOID_ECDSA_SHA384 = "1.2.840.10045.4.3.3";
enum szOID_ECDSA_SHA512 = "1.2.840.10045.4.3.4";
enum szOID_NIST_AES128_CBC = "2.16.840.1.101.3.4.1.2";
enum szOID_NIST_AES192_CBC = "2.16.840.1.101.3.4.1.22";
enum szOID_NIST_AES256_CBC = "2.16.840.1.101.3.4.1.42";
enum szOID_NIST_AES128_WRAP = "2.16.840.1.101.3.4.1.5";
enum szOID_NIST_AES192_WRAP = "2.16.840.1.101.3.4.1.25";
enum szOID_NIST_AES256_WRAP = "2.16.840.1.101.3.4.1.45";
enum szOID_DH_SINGLE_PASS_STDDH_SHA1_KDF = "1.3.133.16.840.63.0.2";
enum szOID_DH_SINGLE_PASS_STDDH_SHA256_KDF = "1.3.132.1.11.1";
enum szOID_DH_SINGLE_PASS_STDDH_SHA384_KDF = "1.3.132.1.11.2";
enum szOID_DS = "2.5";
enum szOID_DSALG = "2.5.8";
enum szOID_DSALG_CRPT = "2.5.8.1";
enum szOID_DSALG_HASH = "2.5.8.2";
enum szOID_DSALG_SIGN = "2.5.8.3";
enum szOID_DSALG_RSA = "2.5.8.1.1";
enum szOID_OIW = "1.3.14";
enum szOID_OIWSEC = "1.3.14.3.2";
enum szOID_OIWSEC_md4RSA = "1.3.14.3.2.2";
enum szOID_OIWSEC_md5RSA = "1.3.14.3.2.3";
enum szOID_OIWSEC_md4RSA2 = "1.3.14.3.2.4";
enum szOID_OIWSEC_desECB = "1.3.14.3.2.6";
enum szOID_OIWSEC_desCBC = "1.3.14.3.2.7";
enum szOID_OIWSEC_desOFB = "1.3.14.3.2.8";
enum szOID_OIWSEC_desCFB = "1.3.14.3.2.9";
enum szOID_OIWSEC_desMAC = "1.3.14.3.2.10";
enum szOID_OIWSEC_rsaSign = "1.3.14.3.2.11";
enum szOID_OIWSEC_dsa = "1.3.14.3.2.12";
enum szOID_OIWSEC_shaDSA = "1.3.14.3.2.13";
enum szOID_OIWSEC_mdc2RSA = "1.3.14.3.2.14";
enum szOID_OIWSEC_shaRSA = "1.3.14.3.2.15";
enum szOID_OIWSEC_dhCommMod = "1.3.14.3.2.16";
enum szOID_OIWSEC_desEDE = "1.3.14.3.2.17";
enum szOID_OIWSEC_sha = "1.3.14.3.2.18";
enum szOID_OIWSEC_mdc2 = "1.3.14.3.2.19";
enum szOID_OIWSEC_dsaComm = "1.3.14.3.2.20";
enum szOID_OIWSEC_dsaCommSHA = "1.3.14.3.2.21";
enum szOID_OIWSEC_rsaXchg = "1.3.14.3.2.22";
enum szOID_OIWSEC_keyHashSeal = "1.3.14.3.2.23";
enum szOID_OIWSEC_md2RSASign = "1.3.14.3.2.24";
enum szOID_OIWSEC_md5RSASign = "1.3.14.3.2.25";
enum szOID_OIWSEC_sha1 = "1.3.14.3.2.26";
enum szOID_OIWSEC_dsaSHA1 = "1.3.14.3.2.27";
enum szOID_OIWSEC_dsaCommSHA1 = "1.3.14.3.2.28";
enum szOID_OIWSEC_sha1RSASign = "1.3.14.3.2.29";
enum szOID_OIWDIR = "1.3.14.7.2";
enum szOID_OIWDIR_CRPT = "1.3.14.7.2.1";
enum szOID_OIWDIR_HASH = "1.3.14.7.2.2";
enum szOID_OIWDIR_SIGN = "1.3.14.7.2.3";
enum szOID_OIWDIR_md2 = "1.3.14.7.2.2.1";
enum szOID_OIWDIR_md2RSA = "1.3.14.7.2.3.1";
enum szOID_INFOSEC = "2.16.840.1.101.2.1";
enum szOID_INFOSEC_sdnsSignature = "2.16.840.1.101.2.1.1.1";
enum szOID_INFOSEC_mosaicSignature = "2.16.840.1.101.2.1.1.2";
enum szOID_INFOSEC_sdnsConfidentiality = "2.16.840.1.101.2.1.1.3";
enum szOID_INFOSEC_mosaicConfidentiality = "2.16.840.1.101.2.1.1.4";
enum szOID_INFOSEC_sdnsIntegrity = "2.16.840.1.101.2.1.1.5";
enum szOID_INFOSEC_mosaicIntegrity = "2.16.840.1.101.2.1.1.6";
enum szOID_INFOSEC_sdnsTokenProtection = "2.16.840.1.101.2.1.1.7";
enum szOID_INFOSEC_mosaicTokenProtection = "2.16.840.1.101.2.1.1.8";
enum szOID_INFOSEC_sdnsKeyManagement = "2.16.840.1.101.2.1.1.9";
enum szOID_INFOSEC_mosaicKeyManagement = "2.16.840.1.101.2.1.1.10";
enum szOID_INFOSEC_sdnsKMandSig = "2.16.840.1.101.2.1.1.11";
enum szOID_INFOSEC_mosaicKMandSig = "2.16.840.1.101.2.1.1.12";
enum szOID_INFOSEC_SuiteASignature = "2.16.840.1.101.2.1.1.13";
enum szOID_INFOSEC_SuiteAConfidentiality = "2.16.840.1.101.2.1.1.14";
enum szOID_INFOSEC_SuiteAIntegrity = "2.16.840.1.101.2.1.1.15";
enum szOID_INFOSEC_SuiteATokenProtection = "2.16.840.1.101.2.1.1.16";
enum szOID_INFOSEC_SuiteAKeyManagement = "2.16.840.1.101.2.1.1.17";
enum szOID_INFOSEC_SuiteAKMandSig = "2.16.840.1.101.2.1.1.18";
enum szOID_INFOSEC_mosaicUpdatedSig = "2.16.840.1.101.2.1.1.19";
enum szOID_INFOSEC_mosaicKMandUpdSig = "2.16.840.1.101.2.1.1.20";
enum szOID_INFOSEC_mosaicUpdatedInteg = "2.16.840.1.101.2.1.1.21";
enum szOID_NIST_sha256 = "2.16.840.1.101.3.4.2.1";
enum szOID_NIST_sha384 = "2.16.840.1.101.3.4.2.2";
enum szOID_NIST_sha512 = "2.16.840.1.101.3.4.2.3";
enum szOID_COMMON_NAME = "2.5.4.3";
enum szOID_SUR_NAME = "2.5.4.4";
enum szOID_DEVICE_SERIAL_NUMBER = "2.5.4.5";
enum szOID_COUNTRY_NAME = "2.5.4.6";
enum szOID_LOCALITY_NAME = "2.5.4.7";
enum szOID_STATE_OR_PROVINCE_NAME = "2.5.4.8";
enum szOID_STREET_ADDRESS = "2.5.4.9";
enum szOID_ORGANIZATION_NAME = "2.5.4.10";
enum szOID_ORGANIZATIONAL_UNIT_NAME = "2.5.4.11";
enum szOID_TITLE = "2.5.4.12";
enum szOID_DESCRIPTION = "2.5.4.13";
enum szOID_SEARCH_GUIDE = "2.5.4.14";
enum szOID_BUSINESS_CATEGORY = "2.5.4.15";
enum szOID_POSTAL_ADDRESS = "2.5.4.16";
enum szOID_POSTAL_CODE = "2.5.4.17";
enum szOID_POST_OFFICE_BOX = "2.5.4.18";
enum szOID_PHYSICAL_DELIVERY_OFFICE_NAME = "2.5.4.19";
enum szOID_TELEPHONE_NUMBER = "2.5.4.20";
enum szOID_TELEX_NUMBER = "2.5.4.21";
enum szOID_TELETEXT_TERMINAL_IDENTIFIER = "2.5.4.22";
enum szOID_FACSIMILE_TELEPHONE_NUMBER = "2.5.4.23";
enum szOID_X21_ADDRESS = "2.5.4.24";
enum szOID_INTERNATIONAL_ISDN_NUMBER = "2.5.4.25";
enum szOID_REGISTERED_ADDRESS = "2.5.4.26";
enum szOID_DESTINATION_INDICATOR = "2.5.4.27";
enum szOID_PREFERRED_DELIVERY_METHOD = "2.5.4.28";
enum szOID_PRESENTATION_ADDRESS = "2.5.4.29";
enum szOID_SUPPORTED_APPLICATION_CONTEXT = "2.5.4.30";
enum szOID_MEMBER = "2.5.4.31";
enum szOID_OWNER = "2.5.4.32";
enum szOID_ROLE_OCCUPANT = "2.5.4.33";
enum szOID_SEE_ALSO = "2.5.4.34";
enum szOID_USER_PASSWORD = "2.5.4.35";
enum szOID_USER_CERTIFICATE = "2.5.4.36";
enum szOID_CA_CERTIFICATE = "2.5.4.37";
enum szOID_AUTHORITY_REVOCATION_LIST = "2.5.4.38";
enum szOID_CERTIFICATE_REVOCATION_LIST = "2.5.4.39";
enum szOID_CROSS_CERTIFICATE_PAIR = "2.5.4.40";
enum szOID_GIVEN_NAME = "2.5.4.42";
enum szOID_INITIALS = "2.5.4.43";
enum szOID_DN_QUALIFIER = "2.5.4.46";
enum szOID_DOMAIN_COMPONENT = "0.9.2342.19200300.100.1.25";
enum szOID_PKCS_12_FRIENDLY_NAME_ATTR = "1.2.840.113549.1.9.20";
enum szOID_PKCS_12_LOCAL_KEY_ID = "1.2.840.113549.1.9.21";
enum szOID_PKCS_12_KEY_PROVIDER_NAME_ATTR = "1.3.6.1.4.1.311.17.1";
enum szOID_LOCAL_MACHINE_KEYSET = "1.3.6.1.4.1.311.17.2";
enum szOID_PKCS_12_EXTENDED_ATTRIBUTES = "1.3.6.1.4.1.311.17.3";
enum szOID_PKCS_12_PROTECTED_PASSWORD_SECRET_BAG_TYPE_ID = "1.3.6.1.4.1.311.17.4";
enum szOID_KEYID_RDN = "1.3.6.1.4.1.311.10.7.1";
enum szOID_EV_RDN_LOCALE = "1.3.6.1.4.1.311.60.2.1.1";
enum szOID_EV_RDN_STATE_OR_PROVINCE = "1.3.6.1.4.1.311.60.2.1.2";
enum szOID_EV_RDN_COUNTRY = "1.3.6.1.4.1.311.60.2.1.3";
enum CERT_RDN_TYPE_MASK = 0x000000ff;
enum CERT_RDN_FLAGS_MASK = 0xff000000;
enum CERT_RDN_ENABLE_T61_UNICODE_FLAG = 0x80000000;
enum CERT_RDN_ENABLE_UTF8_UNICODE_FLAG = 0x20000000;
enum CERT_RDN_FORCE_UTF8_UNICODE_FLAG = 0x10000000;
enum CERT_RDN_DISABLE_CHECK_TYPE_FLAG = 0x40000000;
enum CERT_RDN_DISABLE_IE4_UTF8_FLAG = 0x01000000;
enum CERT_RDN_ENABLE_PUNYCODE_FLAG = 0x02000000;
enum CERT_RSA_PUBLIC_KEY_OBJID = "1.2.840.113549.1.1.1";
enum CERT_DEFAULT_OID_PUBLIC_KEY_SIGN = "1.2.840.113549.1.1.1";
enum CERT_DEFAULT_OID_PUBLIC_KEY_XCHG = "1.2.840.113549.1.1.1";
enum CRYPT_ECC_PRIVATE_KEY_INFO_v1 = 0x00000001;
enum CERT_V1 = 0x00000000;
enum CERT_V2 = 0x00000001;
enum CERT_V3 = 0x00000002;
enum CERT_INFO_VERSION_FLAG = 0x00000001;
enum CERT_INFO_SERIAL_NUMBER_FLAG = 0x00000002;
enum CERT_INFO_SIGNATURE_ALGORITHM_FLAG = 0x00000003;
enum CERT_INFO_ISSUER_FLAG = 0x00000004;
enum CERT_INFO_NOT_BEFORE_FLAG = 0x00000005;
enum CERT_INFO_NOT_AFTER_FLAG = 0x00000006;
enum CERT_INFO_SUBJECT_FLAG = 0x00000007;
enum CERT_INFO_SUBJECT_PUBLIC_KEY_INFO_FLAG = 0x00000008;
enum CERT_INFO_ISSUER_UNIQUE_ID_FLAG = 0x00000009;
enum CERT_INFO_SUBJECT_UNIQUE_ID_FLAG = 0x0000000a;
enum CERT_INFO_EXTENSION_FLAG = 0x0000000b;
enum CRL_V1 = 0x00000000;
enum CRL_V2 = 0x00000001;
enum CERT_BUNDLE_CERTIFICATE = 0x00000000;
enum CERT_BUNDLE_CRL = 0x00000001;
enum CERT_REQUEST_V1 = 0x00000000;
enum CERT_KEYGEN_REQUEST_V1 = 0x00000000;
enum CTL_V1 = 0x00000000;
enum CERT_ENCODING_TYPE_MASK = 0x0000ffff;
enum CMSG_ENCODING_TYPE_MASK = 0xffff0000;
enum CRYPT_ASN_ENCODING = 0x00000001;
enum CRYPT_NDR_ENCODING = 0x00000002;
enum X509_NDR_ENCODING = 0x00000002;
enum PKCS_7_NDR_ENCODING = 0x00020000;
enum CRYPT_FORMAT_STR_MULTI_LINE = 0x00000001;
enum CRYPT_FORMAT_STR_NO_HEX = 0x00000010;
enum CRYPT_FORMAT_SIMPLE = 0x00000001;
enum CRYPT_FORMAT_X509 = 0x00000002;
enum CRYPT_FORMAT_OID = 0x00000004;
enum CRYPT_FORMAT_RDN_SEMICOLON = 0x00000100;
enum CRYPT_FORMAT_RDN_CRLF = 0x00000200;
enum CRYPT_FORMAT_RDN_UNQUOTE = 0x00000400;
enum CRYPT_FORMAT_RDN_REVERSE = 0x00000800;
enum CRYPT_FORMAT_COMMA = 0x00001000;
enum CRYPT_FORMAT_SEMICOLON = 0x00000100;
enum CRYPT_FORMAT_CRLF = 0x00000200;
enum CRYPT_ENCODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG = 0x00000008;
enum CRYPT_UNICODE_NAME_ENCODE_FORCE_UTF8_UNICODE_FLAG = 0x10000000;
enum CRYPT_SORTED_CTL_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x00010000;
enum CRYPT_ENCODE_ENABLE_UTF8PERCENT_FLAG = 0x00040000;
enum CRYPT_DECODE_NOCOPY_FLAG = 0x00000001;
enum CRYPT_DECODE_TO_BE_SIGNED_FLAG = 0x00000002;
enum CRYPT_DECODE_SHARE_OID_STRING_FLAG = 0x00000004;
enum CRYPT_DECODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG = 0x00000008;
enum CRYPT_DECODE_ALLOC_FLAG = 0x00008000;
enum CRYPT_UNICODE_NAME_DECODE_DISABLE_IE4_UTF8_FLAG = 0x01000000;
enum CRYPT_DECODE_ENABLE_PUNYCODE_FLAG = 0x02000000;
enum CRYPT_DECODE_ENABLE_UTF8PERCENT_FLAG = 0x04000000;
enum CRYPT_ENCODE_DECODE_NONE = 0x00000000;
enum X509_CERT = 0x00000001;
enum X509_CERT_TO_BE_SIGNED = 0x00000002;
enum X509_CERT_CRL_TO_BE_SIGNED = 0x00000003;
enum X509_CERT_REQUEST_TO_BE_SIGNED = 0x00000004;
enum X509_EXTENSIONS = 0x00000005;
enum X509_NAME_VALUE = 0x00000006;
enum X509_NAME = 0x00000007;
enum X509_PUBLIC_KEY_INFO = 0x00000008;
enum X509_AUTHORITY_KEY_ID = 0x00000009;
enum X509_KEY_ATTRIBUTES = 0x0000000a;
enum X509_KEY_USAGE_RESTRICTION = 0x0000000b;
enum X509_ALTERNATE_NAME = 0x0000000c;
enum X509_BASIC_CONSTRAINTS = 0x0000000d;
enum X509_KEY_USAGE = 0x0000000e;
enum X509_BASIC_CONSTRAINTS2 = 0x0000000f;
enum X509_CERT_POLICIES = 0x00000010;
enum PKCS_UTC_TIME = 0x00000011;
enum PKCS_TIME_REQUEST = 0x00000012;
enum RSA_CSP_PUBLICKEYBLOB = 0x00000013;
enum X509_UNICODE_NAME = 0x00000014;
enum X509_KEYGEN_REQUEST_TO_BE_SIGNED = 0x00000015;
enum PKCS_ATTRIBUTE = 0x00000016;
enum PKCS_CONTENT_INFO_SEQUENCE_OF_ANY = 0x00000017;
enum X509_UNICODE_NAME_VALUE = 0x00000018;
enum X509_ANY_STRING = 0x00000006;
enum X509_UNICODE_ANY_STRING = 0x00000018;
enum X509_OCTET_STRING = 0x00000019;
enum X509_BITS = 0x0000001a;
enum X509_INTEGER = 0x0000001b;
enum X509_MULTI_BYTE_INTEGER = 0x0000001c;
enum X509_ENUMERATED = 0x0000001d;
enum X509_CHOICE_OF_TIME = 0x0000001e;
enum X509_AUTHORITY_KEY_ID2 = 0x0000001f;
enum X509_AUTHORITY_INFO_ACCESS = 0x00000020;
enum X509_SUBJECT_INFO_ACCESS = 0x00000020;
enum X509_CRL_REASON_CODE = 0x0000001d;
enum PKCS_CONTENT_INFO = 0x00000021;
enum X509_SEQUENCE_OF_ANY = 0x00000022;
enum X509_CRL_DIST_POINTS = 0x00000023;
enum X509_ENHANCED_KEY_USAGE = 0x00000024;
enum PKCS_CTL = 0x00000025;
enum X509_MULTI_BYTE_UINT = 0x00000026;
enum X509_DSS_PUBLICKEY = 0x00000026;
enum X509_DSS_PARAMETERS = 0x00000027;
enum X509_DSS_SIGNATURE = 0x00000028;
enum PKCS_RC2_CBC_PARAMETERS = 0x00000029;
enum PKCS_SMIME_CAPABILITIES = 0x0000002a;
enum X509_QC_STATEMENTS_EXT = 0x0000002a;
enum PKCS_RSA_PRIVATE_KEY = 0x0000002b;
enum PKCS_PRIVATE_KEY_INFO = 0x0000002c;
enum PKCS_ENCRYPTED_PRIVATE_KEY_INFO = 0x0000002d;
enum X509_PKIX_POLICY_QUALIFIER_USERNOTICE = 0x0000002e;
enum X509_DH_PUBLICKEY = 0x00000026;
enum X509_DH_PARAMETERS = 0x0000002f;
enum PKCS_ATTRIBUTES = 0x00000030;
enum PKCS_SORTED_CTL = 0x00000031;
enum X509_ECC_SIGNATURE = 0x0000002f;
enum X942_DH_PARAMETERS = 0x00000032;
enum X509_BITS_WITHOUT_TRAILING_ZEROES = 0x00000033;
enum X942_OTHER_INFO = 0x00000034;
enum X509_CERT_PAIR = 0x00000035;
enum X509_ISSUING_DIST_POINT = 0x00000036;
enum X509_NAME_CONSTRAINTS = 0x00000037;
enum X509_POLICY_MAPPINGS = 0x00000038;
enum X509_POLICY_CONSTRAINTS = 0x00000039;
enum X509_CROSS_CERT_DIST_POINTS = 0x0000003a;
enum CMC_DATA = 0x0000003b;
enum CMC_RESPONSE = 0x0000003c;
enum CMC_STATUS = 0x0000003d;
enum CMC_ADD_EXTENSIONS = 0x0000003e;
enum CMC_ADD_ATTRIBUTES = 0x0000003f;
enum X509_CERTIFICATE_TEMPLATE = 0x00000040;
enum OCSP_SIGNED_REQUEST = 0x00000041;
enum OCSP_REQUEST = 0x00000042;
enum OCSP_RESPONSE = 0x00000043;
enum OCSP_BASIC_SIGNED_RESPONSE = 0x00000044;
enum OCSP_BASIC_RESPONSE = 0x00000045;
enum X509_LOGOTYPE_EXT = 0x00000046;
enum X509_BIOMETRIC_EXT = 0x00000047;
enum CNG_RSA_PUBLIC_KEY_BLOB = 0x00000048;
enum X509_OBJECT_IDENTIFIER = 0x00000049;
enum X509_ALGORITHM_IDENTIFIER = 0x0000004a;
enum PKCS_RSA_SSA_PSS_PARAMETERS = 0x0000004b;
enum PKCS_RSAES_OAEP_PARAMETERS = 0x0000004c;
enum ECC_CMS_SHARED_INFO = 0x0000004d;
enum TIMESTAMP_REQUEST = 0x0000004e;
enum TIMESTAMP_RESPONSE = 0x0000004f;
enum TIMESTAMP_INFO = 0x00000050;
enum X509_CERT_BUNDLE = 0x00000051;
enum X509_ECC_PRIVATE_KEY = 0x00000052;
enum CNG_RSA_PRIVATE_KEY_BLOB = 0x00000053;
enum X509_SUBJECT_DIR_ATTRS = 0x00000054;
enum X509_ECC_PARAMETERS = 0x00000055;
enum PKCS7_SIGNER_INFO = 0x000001f4;
enum CMS_SIGNER_INFO = 0x000001f5;
enum szOID_AUTHORITY_KEY_IDENTIFIER = "2.5.29.1";
enum szOID_KEY_ATTRIBUTES = "2.5.29.2";
enum szOID_CERT_POLICIES_95 = "2.5.29.3";
enum szOID_KEY_USAGE_RESTRICTION = "2.5.29.4";
enum szOID_SUBJECT_ALT_NAME = "2.5.29.7";
enum szOID_ISSUER_ALT_NAME = "2.5.29.8";
enum szOID_BASIC_CONSTRAINTS = "2.5.29.10";
enum szOID_KEY_USAGE = "2.5.29.15";
enum szOID_PRIVATEKEY_USAGE_PERIOD = "2.5.29.16";
enum szOID_BASIC_CONSTRAINTS2 = "2.5.29.19";
enum szOID_CERT_POLICIES = "2.5.29.32";
enum szOID_ANY_CERT_POLICY = "2.5.29.32.0";
enum szOID_INHIBIT_ANY_POLICY = "2.5.29.54";
enum szOID_AUTHORITY_KEY_IDENTIFIER2 = "2.5.29.35";
enum szOID_SUBJECT_KEY_IDENTIFIER = "2.5.29.14";
enum szOID_SUBJECT_ALT_NAME2 = "2.5.29.17";
enum szOID_ISSUER_ALT_NAME2 = "2.5.29.18";
enum szOID_CRL_REASON_CODE = "2.5.29.21";
enum szOID_REASON_CODE_HOLD = "2.5.29.23";
enum szOID_CRL_DIST_POINTS = "2.5.29.31";
enum szOID_ENHANCED_KEY_USAGE = "2.5.29.37";
enum szOID_ANY_ENHANCED_KEY_USAGE = "2.5.29.37.0";
enum szOID_CRL_NUMBER = "2.5.29.20";
enum szOID_DELTA_CRL_INDICATOR = "2.5.29.27";
enum szOID_ISSUING_DIST_POINT = "2.5.29.28";
enum szOID_FRESHEST_CRL = "2.5.29.46";
enum szOID_NAME_CONSTRAINTS = "2.5.29.30";
enum szOID_POLICY_MAPPINGS = "2.5.29.33";
enum szOID_LEGACY_POLICY_MAPPINGS = "2.5.29.5";
enum szOID_POLICY_CONSTRAINTS = "2.5.29.36";
enum szOID_RENEWAL_CERTIFICATE = "1.3.6.1.4.1.311.13.1";
enum szOID_ENROLLMENT_NAME_VALUE_PAIR = "1.3.6.1.4.1.311.13.2.1";
enum szOID_ENROLLMENT_CSP_PROVIDER = "1.3.6.1.4.1.311.13.2.2";
enum szOID_OS_VERSION = "1.3.6.1.4.1.311.13.2.3";
enum szOID_ENROLLMENT_AGENT = "1.3.6.1.4.1.311.20.2.1";
enum szOID_PKIX = "1.3.6.1.5.5.7";
enum szOID_PKIX_PE = "1.3.6.1.5.5.7.1";
enum szOID_AUTHORITY_INFO_ACCESS = "1.3.6.1.5.5.7.1.1";
enum szOID_SUBJECT_INFO_ACCESS = "1.3.6.1.5.5.7.1.11";
enum szOID_BIOMETRIC_EXT = "1.3.6.1.5.5.7.1.2";
enum szOID_QC_STATEMENTS_EXT = "1.3.6.1.5.5.7.1.3";
enum szOID_LOGOTYPE_EXT = "1.3.6.1.5.5.7.1.12";
enum szOID_TLS_FEATURES_EXT = "1.3.6.1.5.5.7.1.24";
enum szOID_CERT_EXTENSIONS = "1.3.6.1.4.1.311.2.1.14";
enum szOID_NEXT_UPDATE_LOCATION = "1.3.6.1.4.1.311.10.2";
enum szOID_REMOVE_CERTIFICATE = "1.3.6.1.4.1.311.10.8.1";
enum szOID_CROSS_CERT_DIST_POINTS = "1.3.6.1.4.1.311.10.9.1";
enum szOID_CTL = "1.3.6.1.4.1.311.10.1";
enum szOID_SORTED_CTL = "1.3.6.1.4.1.311.10.1.1";
enum szOID_SERIALIZED = "1.3.6.1.4.1.311.10.3.3.1";
enum szOID_NT_PRINCIPAL_NAME = "1.3.6.1.4.1.311.20.2.3";
enum szOID_INTERNATIONALIZED_EMAIL_ADDRESS = "1.3.6.1.4.1.311.20.2.4";
enum szOID_PRODUCT_UPDATE = "1.3.6.1.4.1.311.31.1";
enum szOID_ANY_APPLICATION_POLICY = "1.3.6.1.4.1.311.10.12.1";
enum szOID_AUTO_ENROLL_CTL_USAGE = "1.3.6.1.4.1.311.20.1";
enum szOID_ENROLL_CERTTYPE_EXTENSION = "1.3.6.1.4.1.311.20.2";
enum szOID_CERT_MANIFOLD = "1.3.6.1.4.1.311.20.3";
enum szOID_CERTSRV_CA_VERSION = "1.3.6.1.4.1.311.21.1";
enum szOID_CERTSRV_PREVIOUS_CERT_HASH = "1.3.6.1.4.1.311.21.2";
enum szOID_CRL_VIRTUAL_BASE = "1.3.6.1.4.1.311.21.3";
enum szOID_CRL_NEXT_PUBLISH = "1.3.6.1.4.1.311.21.4";
enum szOID_KP_CA_EXCHANGE = "1.3.6.1.4.1.311.21.5";
enum szOID_KP_PRIVACY_CA = "1.3.6.1.4.1.311.21.36";
enum szOID_KP_KEY_RECOVERY_AGENT = "1.3.6.1.4.1.311.21.6";
enum szOID_CERTIFICATE_TEMPLATE = "1.3.6.1.4.1.311.21.7";
enum szOID_ENTERPRISE_OID_ROOT = "1.3.6.1.4.1.311.21.8";
enum szOID_RDN_DUMMY_SIGNER = "1.3.6.1.4.1.311.21.9";
enum szOID_APPLICATION_CERT_POLICIES = "1.3.6.1.4.1.311.21.10";
enum szOID_APPLICATION_POLICY_MAPPINGS = "1.3.6.1.4.1.311.21.11";
enum szOID_APPLICATION_POLICY_CONSTRAINTS = "1.3.6.1.4.1.311.21.12";
enum szOID_ARCHIVED_KEY_ATTR = "1.3.6.1.4.1.311.21.13";
enum szOID_CRL_SELF_CDP = "1.3.6.1.4.1.311.21.14";
enum szOID_REQUIRE_CERT_CHAIN_POLICY = "1.3.6.1.4.1.311.21.15";
enum szOID_ARCHIVED_KEY_CERT_HASH = "1.3.6.1.4.1.311.21.16";
enum szOID_ISSUED_CERT_HASH = "1.3.6.1.4.1.311.21.17";
enum szOID_DS_EMAIL_REPLICATION = "1.3.6.1.4.1.311.21.19";
enum szOID_REQUEST_CLIENT_INFO = "1.3.6.1.4.1.311.21.20";
enum szOID_ENCRYPTED_KEY_HASH = "1.3.6.1.4.1.311.21.21";
enum szOID_CERTSRV_CROSSCA_VERSION = "1.3.6.1.4.1.311.21.22";
enum szOID_NTDS_REPLICATION = "1.3.6.1.4.1.311.25.1";
enum szOID_SUBJECT_DIR_ATTRS = "2.5.29.9";
enum szOID_PKIX_KP = "1.3.6.1.5.5.7.3";
enum szOID_PKIX_KP_SERVER_AUTH = "1.3.6.1.5.5.7.3.1";
enum szOID_PKIX_KP_CLIENT_AUTH = "1.3.6.1.5.5.7.3.2";
enum szOID_PKIX_KP_CODE_SIGNING = "1.3.6.1.5.5.7.3.3";
enum szOID_PKIX_KP_EMAIL_PROTECTION = "1.3.6.1.5.5.7.3.4";
enum szOID_PKIX_KP_IPSEC_END_SYSTEM = "1.3.6.1.5.5.7.3.5";
enum szOID_PKIX_KP_IPSEC_TUNNEL = "1.3.6.1.5.5.7.3.6";
enum szOID_PKIX_KP_IPSEC_USER = "1.3.6.1.5.5.7.3.7";
enum szOID_PKIX_KP_TIMESTAMP_SIGNING = "1.3.6.1.5.5.7.3.8";
enum szOID_PKIX_KP_OCSP_SIGNING = "1.3.6.1.5.5.7.3.9";
enum szOID_PKIX_OCSP_NOCHECK = "1.3.6.1.5.5.7.48.1.5";
enum szOID_PKIX_OCSP_NONCE = "1.3.6.1.5.5.7.48.1.2";
enum szOID_IPSEC_KP_IKE_INTERMEDIATE = "1.3.6.1.5.5.8.2.2";
enum szOID_PKINIT_KP_KDC = "1.3.6.1.5.2.3.5";
enum szOID_KP_CTL_USAGE_SIGNING = "1.3.6.1.4.1.311.10.3.1";
enum szOID_KP_TIME_STAMP_SIGNING = "1.3.6.1.4.1.311.10.3.2";
enum szOID_SERVER_GATED_CRYPTO = "1.3.6.1.4.1.311.10.3.3";
enum szOID_SGC_NETSCAPE = "2.16.840.1.113730.4.1";
enum szOID_KP_EFS = "1.3.6.1.4.1.311.10.3.4";
enum szOID_EFS_RECOVERY = "1.3.6.1.4.1.311.10.3.4.1";
enum szOID_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.5";
enum szOID_ATTEST_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.5.1";
enum szOID_NT5_CRYPTO = "1.3.6.1.4.1.311.10.3.6";
enum szOID_OEM_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.7";
enum szOID_EMBEDDED_NT_CRYPTO = "1.3.6.1.4.1.311.10.3.8";
enum szOID_ROOT_LIST_SIGNER = "1.3.6.1.4.1.311.10.3.9";
enum szOID_KP_QUALIFIED_SUBORDINATION = "1.3.6.1.4.1.311.10.3.10";
enum szOID_KP_KEY_RECOVERY = "1.3.6.1.4.1.311.10.3.11";
enum szOID_KP_DOCUMENT_SIGNING = "1.3.6.1.4.1.311.10.3.12";
enum szOID_KP_LIFETIME_SIGNING = "1.3.6.1.4.1.311.10.3.13";
enum szOID_KP_MOBILE_DEVICE_SOFTWARE = "1.3.6.1.4.1.311.10.3.14";
enum szOID_KP_SMART_DISPLAY = "1.3.6.1.4.1.311.10.3.15";
enum szOID_KP_CSP_SIGNATURE = "1.3.6.1.4.1.311.10.3.16";
enum szOID_KP_FLIGHT_SIGNING = "1.3.6.1.4.1.311.10.3.27";
enum szOID_PLATFORM_MANIFEST_BINARY_ID = "1.3.6.1.4.1.311.10.3.28";
enum szOID_DRM = "1.3.6.1.4.1.311.10.5.1";
enum szOID_DRM_INDIVIDUALIZATION = "1.3.6.1.4.1.311.10.5.2";
enum szOID_LICENSES = "1.3.6.1.4.1.311.10.6.1";
enum szOID_LICENSE_SERVER = "1.3.6.1.4.1.311.10.6.2";
enum szOID_KP_SMARTCARD_LOGON = "1.3.6.1.4.1.311.20.2.2";
enum szOID_KP_KERNEL_MODE_CODE_SIGNING = "1.3.6.1.4.1.311.61.1.1";
enum szOID_KP_KERNEL_MODE_TRUSTED_BOOT_SIGNING = "1.3.6.1.4.1.311.61.4.1";
enum szOID_REVOKED_LIST_SIGNER = "1.3.6.1.4.1.311.10.3.19";
enum szOID_WINDOWS_KITS_SIGNER = "1.3.6.1.4.1.311.10.3.20";
enum szOID_WINDOWS_RT_SIGNER = "1.3.6.1.4.1.311.10.3.21";
enum szOID_PROTECTED_PROCESS_LIGHT_SIGNER = "1.3.6.1.4.1.311.10.3.22";
enum szOID_WINDOWS_TCB_SIGNER = "1.3.6.1.4.1.311.10.3.23";
enum szOID_PROTECTED_PROCESS_SIGNER = "1.3.6.1.4.1.311.10.3.24";
enum szOID_WINDOWS_THIRD_PARTY_COMPONENT_SIGNER = "1.3.6.1.4.1.311.10.3.25";
enum szOID_WINDOWS_SOFTWARE_EXTENSION_SIGNER = "1.3.6.1.4.1.311.10.3.26";
enum szOID_DISALLOWED_LIST = "1.3.6.1.4.1.311.10.3.30";
enum szOID_PIN_RULES_SIGNER = "1.3.6.1.4.1.311.10.3.31";
enum szOID_PIN_RULES_CTL = "1.3.6.1.4.1.311.10.3.32";
enum szOID_PIN_RULES_EXT = "1.3.6.1.4.1.311.10.3.33";
enum szOID_PIN_RULES_DOMAIN_NAME = "1.3.6.1.4.1.311.10.3.34";
enum szOID_PIN_RULES_LOG_END_DATE_EXT = "1.3.6.1.4.1.311.10.3.35";
enum szOID_IUM_SIGNING = "1.3.6.1.4.1.311.10.3.37";
enum szOID_EV_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.39";
enum szOID_BIOMETRIC_SIGNING = "1.3.6.1.4.1.311.10.3.41";
enum szOID_ENCLAVE_SIGNING = "1.3.6.1.4.1.311.10.3.42";
enum szOID_SYNC_ROOT_CTL_EXT = "1.3.6.1.4.1.311.10.3.50";
enum szOID_HPKP_DOMAIN_NAME_CTL = "1.3.6.1.4.1.311.10.3.60";
enum szOID_HPKP_HEADER_VALUE_CTL = "1.3.6.1.4.1.311.10.3.61";
enum szOID_KP_KERNEL_MODE_HAL_EXTENSION_SIGNING = "1.3.6.1.4.1.311.61.5.1";
enum szOID_WINDOWS_STORE_SIGNER = "1.3.6.1.4.1.311.76.3.1";
enum szOID_DYNAMIC_CODE_GEN_SIGNER = "1.3.6.1.4.1.311.76.5.1";
enum szOID_MICROSOFT_PUBLISHER_SIGNER = "1.3.6.1.4.1.311.76.8.1";
enum szOID_YESNO_TRUST_ATTR = "1.3.6.1.4.1.311.10.4.1";
enum szOID_SITE_PIN_RULES_INDEX_ATTR = "1.3.6.1.4.1.311.10.4.2";
enum szOID_SITE_PIN_RULES_FLAGS_ATTR = "1.3.6.1.4.1.311.10.4.3";
enum SITE_PIN_RULES_ALL_SUBDOMAINS_FLAG = 0x00000001;
enum szOID_PKIX_POLICY_QUALIFIER_CPS = "1.3.6.1.5.5.7.2.1";
enum szOID_PKIX_POLICY_QUALIFIER_USERNOTICE = "1.3.6.1.5.5.7.2.2";
enum szOID_ROOT_PROGRAM_FLAGS = "1.3.6.1.4.1.311.60.1.1";
enum CERT_ROOT_PROGRAM_FLAG_OU = 0x00000010;
enum CERT_ROOT_PROGRAM_FLAG_ADDRESS = 0x00000008;
enum szOID_CERT_POLICIES_95_QUALIFIER1 = "2.16.840.1.113733.1.7.1.1";
enum szOID_RDN_TPM_MANUFACTURER = "2.23.133.2.1";
enum szOID_RDN_TPM_MODEL = "2.23.133.2.2";
enum szOID_RDN_TPM_VERSION = "2.23.133.2.3";
enum szOID_RDN_TCG_PLATFORM_MANUFACTURER = "2.23.133.2.4";
enum szOID_RDN_TCG_PLATFORM_MODEL = "2.23.133.2.5";
enum szOID_RDN_TCG_PLATFORM_VERSION = "2.23.133.2.6";
enum szOID_CT_CERT_SCTLIST = "1.3.6.1.4.1.11129.2.4.2";
enum szOID_ENROLL_EK_INFO = "1.3.6.1.4.1.311.21.23";
enum szOID_ENROLL_AIK_INFO = "1.3.6.1.4.1.311.21.39";
enum szOID_ENROLL_ATTESTATION_STATEMENT = "1.3.6.1.4.1.311.21.24";
enum szOID_ENROLL_KSP_NAME = "1.3.6.1.4.1.311.21.25";
enum szOID_ENROLL_EKPUB_CHALLENGE = "1.3.6.1.4.1.311.21.26";
enum szOID_ENROLL_CAXCHGCERT_HASH = "1.3.6.1.4.1.311.21.27";
enum szOID_ENROLL_ATTESTATION_CHALLENGE = "1.3.6.1.4.1.311.21.28";
enum szOID_ENROLL_ENCRYPTION_ALGORITHM = "1.3.6.1.4.1.311.21.29";
enum szOID_KP_TPM_EK_CERTIFICATE = "2.23.133.8.1";
enum szOID_KP_TPM_PLATFORM_CERTIFICATE = "2.23.133.8.2";
enum szOID_KP_TPM_AIK_CERTIFICATE = "2.23.133.8.3";
enum szOID_ENROLL_EKVERIFYKEY = "1.3.6.1.4.1.311.21.30";
enum szOID_ENROLL_EKVERIFYCERT = "1.3.6.1.4.1.311.21.31";
enum szOID_ENROLL_EKVERIFYCREDS = "1.3.6.1.4.1.311.21.32";
enum szOID_ENROLL_SCEP_ERROR = "1.3.6.1.4.1.311.21.33";
enum szOID_ENROLL_SCEP_SERVER_STATE = "1.3.6.1.4.1.311.21.34";
enum szOID_ENROLL_SCEP_CHALLENGE_ANSWER = "1.3.6.1.4.1.311.21.35";
enum szOID_ENROLL_SCEP_CLIENT_REQUEST = "1.3.6.1.4.1.311.21.37";
enum szOID_ENROLL_SCEP_SERVER_MESSAGE = "1.3.6.1.4.1.311.21.38";
enum szOID_ENROLL_SCEP_SERVER_SECRET = "1.3.6.1.4.1.311.21.40";
enum szOID_ENROLL_KEY_AFFINITY = "1.3.6.1.4.1.311.21.41";
enum szOID_ENROLL_SCEP_SIGNER_HASH = "1.3.6.1.4.1.311.21.42";
enum szOID_ENROLL_EK_CA_KEYID = "1.3.6.1.4.1.311.21.43";
enum szOID_ATTR_SUPPORTED_ALGORITHMS = "2.5.4.52";
enum szOID_ATTR_TPM_SPECIFICATION = "2.23.133.2.16";
enum szOID_ATTR_PLATFORM_SPECIFICATION = "2.23.133.2.17";
enum szOID_ATTR_TPM_SECURITY_ASSERTIONS = "2.23.133.2.18";
enum CERT_UNICODE_RDN_ERR_INDEX_MASK = 0x000003ff;
enum CERT_UNICODE_RDN_ERR_INDEX_SHIFT = 0x00000016;
enum CERT_UNICODE_ATTR_ERR_INDEX_MASK = 0x0000003f;
enum CERT_UNICODE_ATTR_ERR_INDEX_SHIFT = 0x00000010;
enum CERT_UNICODE_VALUE_ERR_INDEX_MASK = 0x0000ffff;
enum CERT_UNICODE_VALUE_ERR_INDEX_SHIFT = 0x00000000;
enum CERT_DIGITAL_SIGNATURE_KEY_USAGE = 0x00000080;
enum CERT_NON_REPUDIATION_KEY_USAGE = 0x00000040;
enum CERT_KEY_ENCIPHERMENT_KEY_USAGE = 0x00000020;
enum CERT_DATA_ENCIPHERMENT_KEY_USAGE = 0x00000010;
enum CERT_KEY_AGREEMENT_KEY_USAGE = 0x00000008;
enum CERT_KEY_CERT_SIGN_KEY_USAGE = 0x00000004;
enum CERT_OFFLINE_CRL_SIGN_KEY_USAGE = 0x00000002;
enum CERT_CRL_SIGN_KEY_USAGE = 0x00000002;
enum CERT_ENCIPHER_ONLY_KEY_USAGE = 0x00000001;
enum CERT_DECIPHER_ONLY_KEY_USAGE = 0x00000080;
enum CERT_ALT_NAME_X400_ADDRESS = 0x00000004;
enum CERT_ALT_NAME_EDI_PARTY_NAME = 0x00000006;
enum CERT_ALT_NAME_ENTRY_ERR_INDEX_MASK = 0x000000ff;
enum CERT_ALT_NAME_ENTRY_ERR_INDEX_SHIFT = 0x00000010;
enum CERT_ALT_NAME_VALUE_ERR_INDEX_MASK = 0x0000ffff;
enum CERT_ALT_NAME_VALUE_ERR_INDEX_SHIFT = 0x00000000;
enum CERT_CA_SUBJECT_FLAG = 0x00000080;
enum CERT_END_ENTITY_SUBJECT_FLAG = 0x00000040;
enum szOID_PKIX_ACC_DESCR = "1.3.6.1.5.5.7.48";
enum szOID_PKIX_OCSP = "1.3.6.1.5.5.7.48.1";
enum szOID_PKIX_CA_ISSUERS = "1.3.6.1.5.5.7.48.2";
enum szOID_PKIX_TIME_STAMPING = "1.3.6.1.5.5.7.48.3";
enum szOID_PKIX_CA_REPOSITORY = "1.3.6.1.5.5.7.48.5";
enum CRL_REASON_PRIVILEGE_WITHDRAWN = 0x00000009;
enum CRL_REASON_AA_COMPROMISE = 0x0000000a;
enum CRL_DIST_POINT_NO_NAME = 0x00000000;
enum CRL_DIST_POINT_FULL_NAME = 0x00000001;
enum CRL_DIST_POINT_ISSUER_RDN_NAME = 0x00000002;
enum CRL_REASON_UNUSED_FLAG = 0x00000080;
enum CRL_REASON_KEY_COMPROMISE_FLAG = 0x00000040;
enum CRL_REASON_CA_COMPROMISE_FLAG = 0x00000020;
enum CRL_REASON_AFFILIATION_CHANGED_FLAG = 0x00000010;
enum CRL_REASON_SUPERSEDED_FLAG = 0x00000008;
enum CRL_REASON_CESSATION_OF_OPERATION_FLAG = 0x00000004;
enum CRL_REASON_CERTIFICATE_HOLD_FLAG = 0x00000002;
enum CRL_REASON_PRIVILEGE_WITHDRAWN_FLAG = 0x00000001;
enum CRL_REASON_AA_COMPROMISE_FLAG = 0x00000080;
enum CRL_DIST_POINT_ERR_INDEX_MASK = 0x0000007f;
enum CRL_DIST_POINT_ERR_INDEX_SHIFT = 0x00000018;
enum CRL_DIST_POINT_ERR_CRL_ISSUER_BIT = 0xffffffff80000000;
enum CROSS_CERT_DIST_POINT_ERR_INDEX_MASK = 0x000000ff;
enum CROSS_CERT_DIST_POINT_ERR_INDEX_SHIFT = 0x00000018;
enum CERT_EXCLUDED_SUBTREE_BIT = 0xffffffff80000000;
enum SORTED_CTL_EXT_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x00000001;
enum CERT_DSS_R_LEN = 0x00000014;
enum CERT_DSS_S_LEN = 0x00000014;
enum CRYPT_X942_COUNTER_BYTE_LENGTH = 0x00000004;
enum CRYPT_X942_KEY_LENGTH_BYTE_LENGTH = 0x00000004;
enum CRYPT_ECC_CMS_SHARED_INFO_SUPPPUBINFO_BYTE_LENGTH = 0x00000004;
enum CRYPT_RC2_40BIT_VERSION = 0x000000a0;
enum CRYPT_RC2_56BIT_VERSION = 0x00000034;
enum CRYPT_RC2_64BIT_VERSION = 0x00000078;
enum CRYPT_RC2_128BIT_VERSION = 0x0000003a;
enum szOID_QC_EU_COMPLIANCE = "0.4.0.1862.1.1";
enum szOID_QC_SSCD = "0.4.0.1862.1.4";
enum PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC = 0x00000001;
enum szOID_VERISIGN_PRIVATE_6_9 = "2.16.840.1.113733.1.6.9";
enum szOID_VERISIGN_ONSITE_JURISDICTION_HASH = "2.16.840.1.113733.1.6.11";
enum szOID_VERISIGN_BITSTRING_6_13 = "2.16.840.1.113733.1.6.13";
enum szOID_VERISIGN_ISS_STRONG_CRYPTO = "2.16.840.1.113733.1.8.1";
enum szOIDVerisign_MessageType = "2.16.840.1.113733.1.9.2";
enum szOIDVerisign_PkiStatus = "2.16.840.1.113733.1.9.3";
enum szOIDVerisign_FailInfo = "2.16.840.1.113733.1.9.4";
enum szOIDVerisign_SenderNonce = "2.16.840.1.113733.1.9.5";
enum szOIDVerisign_RecipientNonce = "2.16.840.1.113733.1.9.6";
enum szOIDVerisign_TransactionID = "2.16.840.1.113733.1.9.7";
enum szOID_NETSCAPE = "2.16.840.1.113730";
enum szOID_NETSCAPE_CERT_EXTENSION = "2.16.840.1.113730.1";
enum szOID_NETSCAPE_CERT_TYPE = "2.16.840.1.113730.1.1";
enum szOID_NETSCAPE_BASE_URL = "2.16.840.1.113730.1.2";
enum szOID_NETSCAPE_REVOCATION_URL = "2.16.840.1.113730.1.3";
enum szOID_NETSCAPE_CA_REVOCATION_URL = "2.16.840.1.113730.1.4";
enum szOID_NETSCAPE_CERT_RENEWAL_URL = "2.16.840.1.113730.1.7";
enum szOID_NETSCAPE_CA_POLICY_URL = "2.16.840.1.113730.1.8";
enum szOID_NETSCAPE_SSL_SERVER_NAME = "2.16.840.1.113730.1.12";
enum szOID_NETSCAPE_COMMENT = "2.16.840.1.113730.1.13";
enum szOID_NETSCAPE_DATA_TYPE = "2.16.840.1.113730.2";
enum szOID_NETSCAPE_CERT_SEQUENCE = "2.16.840.1.113730.2.5";
enum NETSCAPE_SSL_CLIENT_AUTH_CERT_TYPE = 0x00000080;
enum NETSCAPE_SSL_SERVER_AUTH_CERT_TYPE = 0x00000040;
enum NETSCAPE_SMIME_CERT_TYPE = 0x00000020;
enum NETSCAPE_SIGN_CERT_TYPE = 0x00000010;
enum NETSCAPE_SSL_CA_CERT_TYPE = 0x00000004;
enum NETSCAPE_SMIME_CA_CERT_TYPE = 0x00000002;
enum NETSCAPE_SIGN_CA_CERT_TYPE = 0x00000001;
enum szOID_CT_PKI_DATA = "1.3.6.1.5.5.7.12.2";
enum szOID_CT_PKI_RESPONSE = "1.3.6.1.5.5.7.12.3";
enum szOID_PKIX_NO_SIGNATURE = "1.3.6.1.5.5.7.6.2";
enum szOID_CMC = "1.3.6.1.5.5.7.7";
enum szOID_CMC_STATUS_INFO = "1.3.6.1.5.5.7.7.1";
enum szOID_CMC_IDENTIFICATION = "1.3.6.1.5.5.7.7.2";
enum szOID_CMC_IDENTITY_PROOF = "1.3.6.1.5.5.7.7.3";
enum szOID_CMC_DATA_RETURN = "1.3.6.1.5.5.7.7.4";
enum szOID_CMC_TRANSACTION_ID = "1.3.6.1.5.5.7.7.5";
enum szOID_CMC_SENDER_NONCE = "1.3.6.1.5.5.7.7.6";
enum szOID_CMC_RECIPIENT_NONCE = "1.3.6.1.5.5.7.7.7";
enum szOID_CMC_ADD_EXTENSIONS = "1.3.6.1.5.5.7.7.8";
enum szOID_CMC_ENCRYPTED_POP = "1.3.6.1.5.5.7.7.9";
enum szOID_CMC_DECRYPTED_POP = "1.3.6.1.5.5.7.7.10";
enum szOID_CMC_LRA_POP_WITNESS = "1.3.6.1.5.5.7.7.11";
enum szOID_CMC_GET_CERT = "1.3.6.1.5.5.7.7.15";
enum szOID_CMC_GET_CRL = "1.3.6.1.5.5.7.7.16";
enum szOID_CMC_REVOKE_REQUEST = "1.3.6.1.5.5.7.7.17";
enum szOID_CMC_REG_INFO = "1.3.6.1.5.5.7.7.18";
enum szOID_CMC_RESPONSE_INFO = "1.3.6.1.5.5.7.7.19";
enum szOID_CMC_QUERY_PENDING = "1.3.6.1.5.5.7.7.21";
enum szOID_CMC_ID_POP_LINK_RANDOM = "1.3.6.1.5.5.7.7.22";
enum szOID_CMC_ID_POP_LINK_WITNESS = "1.3.6.1.5.5.7.7.23";
enum szOID_CMC_ID_CONFIRM_CERT_ACCEPTANCE = "1.3.6.1.5.5.7.7.24";
enum szOID_CMC_ADD_ATTRIBUTES = "1.3.6.1.4.1.311.10.10.1";
enum CMC_TAGGED_CERT_REQUEST_CHOICE = 0x00000001;
enum CMC_OTHER_INFO_NO_CHOICE = 0x00000000;
enum CMC_OTHER_INFO_FAIL_CHOICE = 0x00000001;
enum CMC_OTHER_INFO_PEND_CHOICE = 0x00000002;
enum CMC_STATUS_SUCCESS = 0x00000000;
enum CMC_STATUS_FAILED = 0x00000002;
enum CMC_STATUS_PENDING = 0x00000003;
enum CMC_STATUS_NO_SUPPORT = 0x00000004;
enum CMC_STATUS_CONFIRM_REQUIRED = 0x00000005;
enum CMC_FAIL_BAD_ALG = 0x00000000;
enum CMC_FAIL_BAD_MESSAGE_CHECK = 0x00000001;
enum CMC_FAIL_BAD_REQUEST = 0x00000002;
enum CMC_FAIL_BAD_TIME = 0x00000003;
enum CMC_FAIL_BAD_CERT_ID = 0x00000004;
enum CMC_FAIL_UNSUPORTED_EXT = 0x00000005;
enum CMC_FAIL_MUST_ARCHIVE_KEYS = 0x00000006;
enum CMC_FAIL_BAD_IDENTITY = 0x00000007;
enum CMC_FAIL_POP_REQUIRED = 0x00000008;
enum CMC_FAIL_POP_FAILED = 0x00000009;
enum CMC_FAIL_NO_KEY_REUSE = 0x0000000a;
enum CMC_FAIL_INTERNAL_CA_ERROR = 0x0000000b;
enum CMC_FAIL_TRY_LATER = 0x0000000c;
enum szOID_LOYALTY_OTHER_LOGOTYPE = "1.3.6.1.5.5.7.20.1";
enum szOID_BACKGROUND_OTHER_LOGOTYPE = "1.3.6.1.5.5.7.20.2";
enum CERT_BIOMETRIC_PICTURE_TYPE = 0x00000000;
enum CERT_BIOMETRIC_SIGNATURE_TYPE = 0x00000001;
enum OCSP_REQUEST_V1 = 0x00000000;
enum OCSP_SUCCESSFUL_RESPONSE = 0x00000000;
enum OCSP_MALFORMED_REQUEST_RESPONSE = 0x00000001;
enum OCSP_INTERNAL_ERROR_RESPONSE = 0x00000002;
enum OCSP_TRY_LATER_RESPONSE = 0x00000003;
enum OCSP_SIG_REQUIRED_RESPONSE = 0x00000005;
enum OCSP_UNAUTHORIZED_RESPONSE = 0x00000006;
enum szOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE = "1.3.6.1.5.5.7.48.1.1";
enum OCSP_BASIC_GOOD_CERT_STATUS = 0x00000000;
enum OCSP_BASIC_REVOKED_CERT_STATUS = 0x00000001;
enum OCSP_BASIC_UNKNOWN_CERT_STATUS = 0x00000002;
enum OCSP_BASIC_RESPONSE_V1 = 0x00000000;
enum OCSP_BASIC_BY_NAME_RESPONDER_ID = 0x00000001;
enum OCSP_BASIC_BY_KEY_RESPONDER_ID = 0x00000002;
enum CRYPT_OID_ENCODE_OBJECT_FUNC = "CryptDllEncodeObject";
enum CRYPT_OID_DECODE_OBJECT_FUNC = "CryptDllDecodeObject";
enum CRYPT_OID_ENCODE_OBJECT_EX_FUNC = "CryptDllEncodeObjectEx";
enum CRYPT_OID_DECODE_OBJECT_EX_FUNC = "CryptDllDecodeObjectEx";
enum CRYPT_OID_CREATE_COM_OBJECT_FUNC = "CryptDllCreateCOMObject";
enum CRYPT_OID_VERIFY_REVOCATION_FUNC = "CertDllVerifyRevocation";
enum CRYPT_OID_VERIFY_CTL_USAGE_FUNC = "CertDllVerifyCTLUsage";
enum CRYPT_OID_FORMAT_OBJECT_FUNC = "CryptDllFormatObject";
enum CRYPT_OID_FIND_OID_INFO_FUNC = "CryptDllFindOIDInfo";
enum CRYPT_OID_FIND_LOCALIZED_NAME_FUNC = "CryptDllFindLocalizedName";
enum CRYPT_OID_REGPATH = "Software\\Microsoft\\Cryptography\\OID";
enum CRYPT_OID_REG_ENCODING_TYPE_PREFIX = "EncodingType ";
enum CRYPT_OID_REG_DLL_VALUE_NAME = "Dll";
enum CRYPT_OID_REG_FUNC_NAME_VALUE_NAME = "FuncName";
enum CRYPT_OID_REG_FUNC_NAME_VALUE_NAME_A = "FuncName";
enum CRYPT_OID_REG_FLAGS_VALUE_NAME = "CryptFlags";
enum CRYPT_DEFAULT_OID = "DEFAULT";
enum CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG = 0x00000001;
enum CRYPT_GET_INSTALLED_OID_FUNC_FLAG = 0x00000001;
enum CRYPT_REGISTER_FIRST_INDEX = 0x00000000;
enum CRYPT_REGISTER_LAST_INDEX = 0xffffffff;
enum CRYPT_MATCH_ANY_ENCODING_TYPE = 0xffffffff;
enum CALG_OID_INFO_CNG_ONLY = 0xffffffff;
enum CALG_OID_INFO_PARAMETERS = 0xfffffffe;
enum CRYPT_OID_INFO_HASH_PARAMETERS_ALGORITHM = "CryptOIDInfoHashParameters";
enum CRYPT_OID_INFO_ECC_PARAMETERS_ALGORITHM = "CryptOIDInfoECCParameters";
enum CRYPT_OID_INFO_MGF1_PARAMETERS_ALGORITHM = "CryptOIDInfoMgf1Parameters";
enum CRYPT_OID_INFO_NO_SIGN_ALGORITHM = "CryptOIDInfoNoSign";
enum CRYPT_OID_INFO_OAEP_PARAMETERS_ALGORITHM = "CryptOIDInfoOAEPParameters";
enum CRYPT_OID_INFO_ECC_WRAP_PARAMETERS_ALGORITHM = "CryptOIDInfoECCWrapParameters";
enum CRYPT_OID_INFO_NO_PARAMETERS_ALGORITHM = "CryptOIDInfoNoParameters";
enum CRYPT_HASH_ALG_OID_GROUP_ID = 0x00000001;
enum CRYPT_ENCRYPT_ALG_OID_GROUP_ID = 0x00000002;
enum CRYPT_PUBKEY_ALG_OID_GROUP_ID = 0x00000003;
enum CRYPT_SIGN_ALG_OID_GROUP_ID = 0x00000004;
enum CRYPT_RDN_ATTR_OID_GROUP_ID = 0x00000005;
enum CRYPT_EXT_OR_ATTR_OID_GROUP_ID = 0x00000006;
enum CRYPT_ENHKEY_USAGE_OID_GROUP_ID = 0x00000007;
enum CRYPT_POLICY_OID_GROUP_ID = 0x00000008;
enum CRYPT_TEMPLATE_OID_GROUP_ID = 0x00000009;
enum CRYPT_KDF_OID_GROUP_ID = 0x0000000a;
enum CRYPT_LAST_OID_GROUP_ID = 0x0000000a;
enum CRYPT_FIRST_ALG_OID_GROUP_ID = 0x00000001;
enum CRYPT_LAST_ALG_OID_GROUP_ID = 0x00000004;
enum CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG = 0x00000001;
enum CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG = 0x00000002;
enum CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG = 0x00000004;
enum CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG = 0x80000000;
enum CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG = 0x40000000;
enum CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG = 0x20000000;
enum CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG = 0x10000000;
enum CRYPT_OID_INFO_OID_KEY = 0x00000001;
enum CRYPT_OID_INFO_NAME_KEY = 0x00000002;
enum CRYPT_OID_INFO_ALGID_KEY = 0x00000003;
enum CRYPT_OID_INFO_SIGN_KEY = 0x00000004;
enum CRYPT_OID_INFO_CNG_ALGID_KEY = 0x00000005;
enum CRYPT_OID_INFO_CNG_SIGN_KEY = 0x00000006;
enum CRYPT_OID_INFO_OID_KEY_FLAGS_MASK = 0xffff0000;
enum CRYPT_OID_DISABLE_SEARCH_DS_FLAG = 0x80000000;
enum CRYPT_OID_PREFER_CNG_ALGID_FLAG = 0x40000000;
enum CRYPT_OID_INFO_OID_GROUP_BIT_LEN_MASK = 0x0fff0000;
enum CRYPT_OID_INFO_OID_GROUP_BIT_LEN_SHIFT = 0x00000010;
enum CRYPT_INSTALL_OID_INFO_BEFORE_FLAG = 0x00000001;
enum CRYPT_LOCALIZED_NAME_ENCODING_TYPE = 0x00000000;
enum CRYPT_LOCALIZED_NAME_OID = "LocalizedNames";
enum CERT_STRONG_SIGN_ECDSA_ALGORITHM = "ECDSA";
enum CERT_STRONG_SIGN_SERIALIZED_INFO_CHOICE = 0x00000001;
enum CERT_STRONG_SIGN_OID_INFO_CHOICE = 0x00000002;
enum szOID_CERT_STRONG_SIGN_OS_PREFIX = "1.3.6.1.4.1.311.72.1.";
enum szOID_CERT_STRONG_SIGN_OS_1 = "1.3.6.1.4.1.311.72.1.1";
enum szOID_CERT_STRONG_SIGN_OS_CURRENT = "1.3.6.1.4.1.311.72.1.1";
enum szOID_CERT_STRONG_KEY_OS_PREFIX = "1.3.6.1.4.1.311.72.2.";
enum szOID_CERT_STRONG_KEY_OS_1 = "1.3.6.1.4.1.311.72.2.1";
enum szOID_CERT_STRONG_KEY_OS_CURRENT = "1.3.6.1.4.1.311.72.2.1";
enum szOID_PKCS_7_DATA = "1.2.840.113549.1.7.1";
enum szOID_PKCS_7_SIGNED = "1.2.840.113549.1.7.2";
enum szOID_PKCS_7_ENVELOPED = "1.2.840.113549.1.7.3";
enum szOID_PKCS_7_SIGNEDANDENVELOPED = "1.2.840.113549.1.7.4";
enum szOID_PKCS_7_DIGESTED = "1.2.840.113549.1.7.5";
enum szOID_PKCS_7_ENCRYPTED = "1.2.840.113549.1.7.6";
enum szOID_PKCS_9_CONTENT_TYPE = "1.2.840.113549.1.9.3";
enum szOID_PKCS_9_MESSAGE_DIGEST = "1.2.840.113549.1.9.4";
enum CMSG_ENCRYPTED = 0x00000006;
enum CMSG_MAIL_LIST_HANDLE_KEY_CHOICE = 0x00000001;
enum CMSG_KEY_TRANS_RECIPIENT = 0x00000001;
enum CMSG_KEY_AGREE_RECIPIENT = 0x00000002;
enum CMSG_MAIL_LIST_RECIPIENT = 0x00000003;
enum CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG = 0x80000000;
enum CMSG_RC4_NO_SALT_FLAG = 0x40000000;
enum CMSG_INDEFINITE_LENGTH = 0xffffffff;
enum CMSG_BARE_CONTENT_FLAG = 0x00000001;
enum CMSG_LENGTH_ONLY_FLAG = 0x00000002;
enum CMSG_DETACHED_FLAG = 0x00000004;
enum CMSG_AUTHENTICATED_ATTRIBUTES_FLAG = 0x00000008;
enum CMSG_CONTENTS_OCTETS_FLAG = 0x00000010;
enum CMSG_MAX_LENGTH_FLAG = 0x00000020;
enum CMSG_CMS_ENCAPSULATED_CONTENT_FLAG = 0x00000040;
enum CMSG_SIGNED_DATA_NO_SIGN_FLAG = 0x00000080;
enum CMSG_CRYPT_RELEASE_CONTEXT_FLAG = 0x00008000;
enum CMSG_TYPE_PARAM = 0x00000001;
enum CMSG_CONTENT_PARAM = 0x00000002;
enum CMSG_BARE_CONTENT_PARAM = 0x00000003;
enum CMSG_INNER_CONTENT_TYPE_PARAM = 0x00000004;
enum CMSG_SIGNER_COUNT_PARAM = 0x00000005;
enum CMSG_SIGNER_INFO_PARAM = 0x00000006;
enum CMSG_SIGNER_CERT_INFO_PARAM = 0x00000007;
enum CMSG_SIGNER_HASH_ALGORITHM_PARAM = 0x00000008;
enum CMSG_SIGNER_AUTH_ATTR_PARAM = 0x00000009;
enum CMSG_SIGNER_UNAUTH_ATTR_PARAM = 0x0000000a;
enum CMSG_CERT_COUNT_PARAM = 0x0000000b;
enum CMSG_CERT_PARAM = 0x0000000c;
enum CMSG_CRL_COUNT_PARAM = 0x0000000d;
enum CMSG_CRL_PARAM = 0x0000000e;
enum CMSG_ENVELOPE_ALGORITHM_PARAM = 0x0000000f;
enum CMSG_RECIPIENT_COUNT_PARAM = 0x00000011;
enum CMSG_RECIPIENT_INDEX_PARAM = 0x00000012;
enum CMSG_RECIPIENT_INFO_PARAM = 0x00000013;
enum CMSG_HASH_ALGORITHM_PARAM = 0x00000014;
enum CMSG_HASH_DATA_PARAM = 0x00000015;
enum CMSG_COMPUTED_HASH_PARAM = 0x00000016;
enum CMSG_ENCRYPT_PARAM = 0x0000001a;
enum CMSG_ENCRYPTED_DIGEST = 0x0000001b;
enum CMSG_ENCODED_SIGNER = 0x0000001c;
enum CMSG_ENCODED_MESSAGE = 0x0000001d;
enum CMSG_VERSION_PARAM = 0x0000001e;
enum CMSG_ATTR_CERT_COUNT_PARAM = 0x0000001f;
enum CMSG_ATTR_CERT_PARAM = 0x00000020;
enum CMSG_CMS_RECIPIENT_COUNT_PARAM = 0x00000021;
enum CMSG_CMS_RECIPIENT_INDEX_PARAM = 0x00000022;
enum CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM = 0x00000023;
enum CMSG_CMS_RECIPIENT_INFO_PARAM = 0x00000024;
enum CMSG_UNPROTECTED_ATTR_PARAM = 0x00000025;
enum CMSG_SIGNER_CERT_ID_PARAM = 0x00000026;
enum CMSG_CMS_SIGNER_INFO_PARAM = 0x00000027;
enum CMSG_SIGNED_DATA_V1 = 0x00000001;
enum CMSG_SIGNED_DATA_V3 = 0x00000003;
enum CMSG_SIGNED_DATA_PKCS_1_5_VERSION = 0x00000001;
enum CMSG_SIGNED_DATA_CMS_VERSION = 0x00000003;
enum CMSG_SIGNER_INFO_V1 = 0x00000001;
enum CMSG_SIGNER_INFO_V3 = 0x00000003;
enum CMSG_SIGNER_INFO_PKCS_1_5_VERSION = 0x00000001;
enum CMSG_SIGNER_INFO_CMS_VERSION = 0x00000003;
enum CMSG_HASHED_DATA_V0 = 0x00000000;
enum CMSG_HASHED_DATA_V2 = 0x00000002;
enum CMSG_HASHED_DATA_PKCS_1_5_VERSION = 0x00000000;
enum CMSG_HASHED_DATA_CMS_VERSION = 0x00000002;
enum CMSG_ENVELOPED_DATA_V0 = 0x00000000;
enum CMSG_ENVELOPED_DATA_V2 = 0x00000002;
enum CMSG_ENVELOPED_DATA_PKCS_1_5_VERSION = 0x00000000;
enum CMSG_ENVELOPED_DATA_CMS_VERSION = 0x00000002;
enum CMSG_ENVELOPED_RECIPIENT_V0 = 0x00000000;
enum CMSG_ENVELOPED_RECIPIENT_V2 = 0x00000002;
enum CMSG_ENVELOPED_RECIPIENT_V3 = 0x00000003;
enum CMSG_ENVELOPED_RECIPIENT_V4 = 0x00000004;
enum CMSG_KEY_TRANS_PKCS_1_5_VERSION = 0x00000000;
enum CMSG_KEY_TRANS_CMS_VERSION = 0x00000002;
enum CMSG_KEY_AGREE_VERSION = 0x00000003;
enum CMSG_MAIL_LIST_VERSION = 0x00000004;
enum CMSG_CTRL_VERIFY_SIGNATURE = 0x00000001;
enum CMSG_CTRL_DECRYPT = 0x00000002;
enum CMSG_CTRL_VERIFY_HASH = 0x00000005;
enum CMSG_CTRL_ADD_SIGNER = 0x00000006;
enum CMSG_CTRL_DEL_SIGNER = 0x00000007;
enum CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR = 0x00000008;
enum CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR = 0x00000009;
enum CMSG_CTRL_ADD_CERT = 0x0000000a;
enum CMSG_CTRL_DEL_CERT = 0x0000000b;
enum CMSG_CTRL_ADD_CRL = 0x0000000c;
enum CMSG_CTRL_DEL_CRL = 0x0000000d;
enum CMSG_CTRL_ADD_ATTR_CERT = 0x0000000e;
enum CMSG_CTRL_DEL_ATTR_CERT = 0x0000000f;
enum CMSG_CTRL_KEY_TRANS_DECRYPT = 0x00000010;
enum CMSG_CTRL_KEY_AGREE_DECRYPT = 0x00000011;
enum CMSG_CTRL_MAIL_LIST_DECRYPT = 0x00000012;
enum CMSG_CTRL_VERIFY_SIGNATURE_EX = 0x00000013;
enum CMSG_CTRL_ADD_CMS_SIGNER_INFO = 0x00000014;
enum CMSG_CTRL_ENABLE_STRONG_SIGNATURE = 0x00000015;
enum CMSG_VERIFY_SIGNER_PUBKEY = 0x00000001;
enum CMSG_VERIFY_SIGNER_CERT = 0x00000002;
enum CMSG_VERIFY_SIGNER_CHAIN = 0x00000003;
enum CMSG_VERIFY_SIGNER_NULL = 0x00000004;
enum CMSG_VERIFY_COUNTER_SIGN_ENABLE_STRONG_FLAG = 0x00000001;
enum CMSG_OID_GEN_ENCRYPT_KEY_FUNC = "CryptMsgDllGenEncryptKey";
enum CMSG_OID_EXPORT_ENCRYPT_KEY_FUNC = "CryptMsgDllExportEncryptKey";
enum CMSG_OID_IMPORT_ENCRYPT_KEY_FUNC = "CryptMsgDllImportEncryptKey";
enum CMSG_DEFAULT_INSTALLABLE_FUNC_OID = 0x00000001;
enum CMSG_CONTENT_ENCRYPT_PAD_ENCODED_LEN_FLAG = 0x00000001;
enum CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG = 0x00000001;
enum CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG = 0x00000002;
enum CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG = 0x00008000;
enum CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllGenContentEncryptKey";
enum CMSG_OID_CAPI1_GEN_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllGenContentEncryptKey";
enum CMSG_OID_CNG_GEN_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllCNGGenContentEncryptKey";
enum CMSG_KEY_TRANS_ENCRYPT_FREE_PARA_FLAG = 0x00000001;
enum CMSG_KEY_TRANS_ENCRYPT_FREE_OBJID_FLAG = 0x00000002;
enum CMSG_OID_EXPORT_KEY_TRANS_FUNC = "CryptMsgDllExportKeyTrans";
enum CMSG_OID_CAPI1_EXPORT_KEY_TRANS_FUNC = "CryptMsgDllExportKeyTrans";
enum CMSG_OID_CNG_EXPORT_KEY_TRANS_FUNC = "CryptMsgDllCNGExportKeyTrans";
enum CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG = 0x00000001;
enum CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG = 0x00000002;
enum CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG = 0x00000004;
enum CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG = 0x00000008;
enum CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG = 0x00000010;
enum CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG = 0x00000020;
enum CMSG_OID_EXPORT_KEY_AGREE_FUNC = "CryptMsgDllExportKeyAgree";
enum CMSG_OID_CAPI1_EXPORT_KEY_AGREE_FUNC = "CryptMsgDllExportKeyAgree";
enum CMSG_OID_CNG_EXPORT_KEY_AGREE_FUNC = "CryptMsgDllCNGExportKeyAgree";
enum CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG = 0x00000001;
enum CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG = 0x00000002;
enum CMSG_OID_EXPORT_MAIL_LIST_FUNC = "CryptMsgDllExportMailList";
enum CMSG_OID_CAPI1_EXPORT_MAIL_LIST_FUNC = "CryptMsgDllExportMailList";
enum CMSG_OID_IMPORT_KEY_TRANS_FUNC = "CryptMsgDllImportKeyTrans";
enum CMSG_OID_CAPI1_IMPORT_KEY_TRANS_FUNC = "CryptMsgDllImportKeyTrans";
enum CMSG_OID_IMPORT_KEY_AGREE_FUNC = "CryptMsgDllImportKeyAgree";
enum CMSG_OID_CAPI1_IMPORT_KEY_AGREE_FUNC = "CryptMsgDllImportKeyAgree";
enum CMSG_OID_IMPORT_MAIL_LIST_FUNC = "CryptMsgDllImportMailList";
enum CMSG_OID_CAPI1_IMPORT_MAIL_LIST_FUNC = "CryptMsgDllImportMailList";
enum CMSG_OID_CNG_IMPORT_KEY_TRANS_FUNC = "CryptMsgDllCNGImportKeyTrans";
enum CMSG_OID_CNG_IMPORT_KEY_AGREE_FUNC = "CryptMsgDllCNGImportKeyAgree";
enum CMSG_OID_CNG_IMPORT_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllCNGImportContentEncryptKey";
enum CERT_KEY_PROV_HANDLE_PROP_ID = 0x00000001;
enum CERT_KEY_PROV_INFO_PROP_ID = 0x00000002;
enum CERT_SHA1_HASH_PROP_ID = 0x00000003;
enum CERT_MD5_HASH_PROP_ID = 0x00000004;
enum CERT_HASH_PROP_ID = 0x00000003;
enum CERT_KEY_CONTEXT_PROP_ID = 0x00000005;
enum CERT_KEY_SPEC_PROP_ID = 0x00000006;
enum CERT_IE30_RESERVED_PROP_ID = 0x00000007;
enum CERT_PUBKEY_HASH_RESERVED_PROP_ID = 0x00000008;
enum CERT_ENHKEY_USAGE_PROP_ID = 0x00000009;
enum CERT_CTL_USAGE_PROP_ID = 0x00000009;
enum CERT_NEXT_UPDATE_LOCATION_PROP_ID = 0x0000000a;
enum CERT_FRIENDLY_NAME_PROP_ID = 0x0000000b;
enum CERT_PVK_FILE_PROP_ID = 0x0000000c;
enum CERT_DESCRIPTION_PROP_ID = 0x0000000d;
enum CERT_ACCESS_STATE_PROP_ID = 0x0000000e;
enum CERT_SIGNATURE_HASH_PROP_ID = 0x0000000f;
enum CERT_SMART_CARD_DATA_PROP_ID = 0x00000010;
enum CERT_EFS_PROP_ID = 0x00000011;
enum CERT_FORTEZZA_DATA_PROP_ID = 0x00000012;
enum CERT_ARCHIVED_PROP_ID = 0x00000013;
enum CERT_KEY_IDENTIFIER_PROP_ID = 0x00000014;
enum CERT_AUTO_ENROLL_PROP_ID = 0x00000015;
enum CERT_PUBKEY_ALG_PARA_PROP_ID = 0x00000016;
enum CERT_CROSS_CERT_DIST_POINTS_PROP_ID = 0x00000017;
enum CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID = 0x00000018;
enum CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID = 0x00000019;
enum CERT_ENROLLMENT_PROP_ID = 0x0000001a;
enum CERT_DATE_STAMP_PROP_ID = 0x0000001b;
enum CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 0x0000001c;
enum CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 0x0000001d;
enum CERT_EXTENDED_ERROR_INFO_PROP_ID = 0x0000001e;
enum CERT_RENEWAL_PROP_ID = 0x00000040;
enum CERT_ARCHIVED_KEY_HASH_PROP_ID = 0x00000041;
enum CERT_AUTO_ENROLL_RETRY_PROP_ID = 0x00000042;
enum CERT_AIA_URL_RETRIEVED_PROP_ID = 0x00000043;
enum CERT_AUTHORITY_INFO_ACCESS_PROP_ID = 0x00000044;
enum CERT_BACKED_UP_PROP_ID = 0x00000045;
enum CERT_OCSP_RESPONSE_PROP_ID = 0x00000046;
enum CERT_REQUEST_ORIGINATOR_PROP_ID = 0x00000047;
enum CERT_SOURCE_LOCATION_PROP_ID = 0x00000048;
enum CERT_SOURCE_URL_PROP_ID = 0x00000049;
enum CERT_NEW_KEY_PROP_ID = 0x0000004a;
enum CERT_OCSP_CACHE_PREFIX_PROP_ID = 0x0000004b;
enum CERT_SMART_CARD_ROOT_INFO_PROP_ID = 0x0000004c;
enum CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID = 0x0000004d;
enum CERT_NCRYPT_KEY_HANDLE_PROP_ID = 0x0000004e;
enum CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID = 0x0000004f;
enum CERT_SUBJECT_INFO_ACCESS_PROP_ID = 0x00000050;
enum CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 0x00000051;
enum CERT_CA_DISABLE_CRL_PROP_ID = 0x00000052;
enum CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID = 0x00000053;
enum CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID = 0x00000054;
enum CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 0x00000055;
enum CERT_SUBJECT_DISABLE_CRL_PROP_ID = 0x00000056;
enum CERT_CEP_PROP_ID = 0x00000057;
enum CERT_SIGN_HASH_CNG_ALG_PROP_ID = 0x00000059;
enum CERT_SCARD_PIN_ID_PROP_ID = 0x0000005a;
enum CERT_SCARD_PIN_INFO_PROP_ID = 0x0000005b;
enum CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID = 0x0000005c;
enum CERT_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 0x0000005d;
enum CERT_ISSUER_PUB_KEY_BIT_LENGTH_PROP_ID = 0x0000005e;
enum CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG_PROP_ID = 0x0000005f;
enum CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 0x00000060;
enum CERT_NO_EXPIRE_NOTIFICATION_PROP_ID = 0x00000061;
enum CERT_AUTH_ROOT_SHA256_HASH_PROP_ID = 0x00000062;
enum CERT_NCRYPT_KEY_HANDLE_TRANSFER_PROP_ID = 0x00000063;
enum CERT_HCRYPTPROV_TRANSFER_PROP_ID = 0x00000064;
enum CERT_SMART_CARD_READER_PROP_ID = 0x00000065;
enum CERT_SEND_AS_TRUSTED_ISSUER_PROP_ID = 0x00000066;
enum CERT_KEY_REPAIR_ATTEMPTED_PROP_ID = 0x00000067;
enum CERT_DISALLOWED_FILETIME_PROP_ID = 0x00000068;
enum CERT_ROOT_PROGRAM_CHAIN_POLICIES_PROP_ID = 0x00000069;
enum CERT_SMART_CARD_READER_NON_REMOVABLE_PROP_ID = 0x0000006a;
enum CERT_SHA256_HASH_PROP_ID = 0x0000006b;
enum CERT_SCEP_SERVER_CERTS_PROP_ID = 0x0000006c;
enum CERT_SCEP_RA_SIGNATURE_CERT_PROP_ID = 0x0000006d;
enum CERT_SCEP_RA_ENCRYPTION_CERT_PROP_ID = 0x0000006e;
enum CERT_SCEP_CA_CERT_PROP_ID = 0x0000006f;
enum CERT_SCEP_SIGNER_CERT_PROP_ID = 0x00000070;
enum CERT_SCEP_NONCE_PROP_ID = 0x00000071;
enum CERT_SCEP_ENCRYPT_HASH_CNG_ALG_PROP_ID = 0x00000072;
enum CERT_SCEP_FLAGS_PROP_ID = 0x00000073;
enum CERT_SCEP_GUID_PROP_ID = 0x00000074;
enum CERT_SERIALIZABLE_KEY_CONTEXT_PROP_ID = 0x00000075;
enum CERT_ISOLATED_KEY_PROP_ID = 0x00000076;
enum CERT_SERIAL_CHAIN_PROP_ID = 0x00000077;
enum CERT_KEY_CLASSIFICATION_PROP_ID = 0x00000078;
enum CERT_OCSP_MUST_STAPLE_PROP_ID = 0x00000079;
enum CERT_DISALLOWED_ENHKEY_USAGE_PROP_ID = 0x0000007a;
enum CERT_NONCOMPLIANT_ROOT_URL_PROP_ID = 0x0000007b;
enum CERT_PIN_SHA256_HASH_PROP_ID = 0x0000007c;
enum CERT_CLR_DELETE_KEY_PROP_ID = 0x0000007d;
enum CERT_NOT_BEFORE_FILETIME_PROP_ID = 0x0000007e;
enum CERT_NOT_BEFORE_ENHKEY_USAGE_PROP_ID = 0x0000007f;
enum CERT_FIRST_RESERVED_PROP_ID = 0x00000080;
enum CERT_LAST_RESERVED_PROP_ID = 0x00007fff;
enum CERT_FIRST_USER_PROP_ID = 0x00008000;
enum CERT_LAST_USER_PROP_ID = 0x0000ffff;
enum szOID_CERT_PROP_ID_PREFIX = "1.3.6.1.4.1.311.10.11.";
enum szOID_CERT_KEY_IDENTIFIER_PROP_ID = "1.3.6.1.4.1.311.10.11.20";
enum szOID_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.28";
enum szOID_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.29";
enum szOID_CERT_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.4";
enum szOID_CERT_SIGNATURE_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.15";
enum szOID_DISALLOWED_HASH = "1.3.6.1.4.1.311.10.11.15";
enum szOID_CERT_DISALLOWED_FILETIME_PROP_ID = "1.3.6.1.4.1.311.10.11.104";
enum CERT_ACCESS_STATE_WRITE_PERSIST_FLAG = 0x00000001;
enum CERT_ACCESS_STATE_SYSTEM_STORE_FLAG = 0x00000002;
enum CERT_ACCESS_STATE_LM_SYSTEM_STORE_FLAG = 0x00000004;
enum CERT_ACCESS_STATE_GP_SYSTEM_STORE_FLAG = 0x00000008;
enum CERT_ACCESS_STATE_SHARED_USER_FLAG = 0x00000010;
enum szOID_ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION = "1.3.6.1.4.1.311.60.3.1";
enum szOID_ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION = "1.3.6.1.4.1.311.60.3.2";
enum szOID_ROOT_PROGRAM_NO_OCSP_FAILOVER_TO_CRL = "1.3.6.1.4.1.311.60.3.3";
enum CERT_STORE_PROV_MSG = 0x00000001;
enum CERT_STORE_PROV_MEMORY = 0x00000002;
enum CERT_STORE_PROV_FILE = 0x00000003;
enum CERT_STORE_PROV_REG = 0x00000004;
enum CERT_STORE_PROV_PKCS7 = 0x00000005;
enum CERT_STORE_PROV_SERIALIZED = 0x00000006;
enum CERT_STORE_PROV_FILENAME_A = 0x00000007;
enum CERT_STORE_PROV_FILENAME_W = 0x00000008;
enum CERT_STORE_PROV_FILENAME = 0x00000008;
enum CERT_STORE_PROV_SYSTEM_A = 0x00000009;
enum CERT_STORE_PROV_SYSTEM_W = 0x0000000a;
enum CERT_STORE_PROV_SYSTEM = 0x0000000a;
enum CERT_STORE_PROV_COLLECTION = 0x0000000b;
enum CERT_STORE_PROV_SYSTEM_REGISTRY_A = 0x0000000c;
enum CERT_STORE_PROV_SYSTEM_REGISTRY_W = 0x0000000d;
enum CERT_STORE_PROV_SYSTEM_REGISTRY = 0x0000000d;
enum CERT_STORE_PROV_PHYSICAL_W = 0x0000000e;
enum CERT_STORE_PROV_PHYSICAL = 0x0000000e;
enum CERT_STORE_PROV_SMART_CARD_W = 0x0000000f;
enum CERT_STORE_PROV_SMART_CARD = 0x0000000f;
enum CERT_STORE_PROV_LDAP_W = 0x00000010;
enum CERT_STORE_PROV_LDAP = 0x00000010;
enum CERT_STORE_PROV_PKCS12 = 0x00000011;
enum sz_CERT_STORE_PROV_MEMORY = "Memory";
enum sz_CERT_STORE_PROV_FILENAME_W = "File";
enum sz_CERT_STORE_PROV_FILENAME = "File";
enum sz_CERT_STORE_PROV_SYSTEM_W = "System";
enum sz_CERT_STORE_PROV_SYSTEM = "System";
enum sz_CERT_STORE_PROV_PKCS7 = "PKCS7";
enum sz_CERT_STORE_PROV_PKCS12 = "PKCS12";
enum sz_CERT_STORE_PROV_SERIALIZED = "Serialized";
enum sz_CERT_STORE_PROV_COLLECTION = "Collection";
enum sz_CERT_STORE_PROV_SYSTEM_REGISTRY_W = "SystemRegistry";
enum sz_CERT_STORE_PROV_SYSTEM_REGISTRY = "SystemRegistry";
enum sz_CERT_STORE_PROV_PHYSICAL_W = "Physical";
enum sz_CERT_STORE_PROV_PHYSICAL = "Physical";
enum sz_CERT_STORE_PROV_SMART_CARD_W = "SmartCard";
enum sz_CERT_STORE_PROV_SMART_CARD = "SmartCard";
enum sz_CERT_STORE_PROV_LDAP_W = "Ldap";
enum sz_CERT_STORE_PROV_LDAP = "Ldap";
enum CERT_STORE_SIGNATURE_FLAG = 0x00000001;
enum CERT_STORE_TIME_VALIDITY_FLAG = 0x00000002;
enum CERT_STORE_REVOCATION_FLAG = 0x00000004;
enum CERT_STORE_NO_CRL_FLAG = 0x00010000;
enum CERT_STORE_NO_ISSUER_FLAG = 0x00020000;
enum CERT_STORE_BASE_CRL_FLAG = 0x00000100;
enum CERT_STORE_DELTA_CRL_FLAG = 0x00000200;
enum CERT_STORE_UNSAFE_PHYSICAL_FLAG = 0x00000020;
enum CERT_STORE_SHARE_STORE_FLAG = 0x00000040;
enum CERT_STORE_MANIFOLD_FLAG = 0x00000100;
enum CERT_SYSTEM_STORE_MASK = 0xffff0000;
enum CERT_SYSTEM_STORE_UNPROTECTED_FLAG = 0x40000000;
enum CERT_SYSTEM_STORE_DEFER_READ_FLAG = 0x20000000;
enum CERT_SYSTEM_STORE_LOCATION_SHIFT = 0x00000010;
enum CERT_SYSTEM_STORE_CURRENT_USER_ID = 0x00000001;
enum CERT_SYSTEM_STORE_LOCAL_MACHINE_ID = 0x00000002;
enum CERT_SYSTEM_STORE_CURRENT_SERVICE_ID = 0x00000004;
enum CERT_SYSTEM_STORE_SERVICES_ID = 0x00000005;
enum CERT_SYSTEM_STORE_USERS_ID = 0x00000006;
enum CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY_ID = 0x00000007;
enum CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY_ID = 0x00000008;
enum CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE_ID = 0x00000009;
enum CERT_SYSTEM_STORE_LOCAL_MACHINE_WCOS_ID = 0x0000000a;
enum CERT_GROUP_POLICY_SYSTEM_STORE_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates";
enum CERT_EFSBLOB_VALUE_NAME = "EFSBlob";
enum CERT_PROT_ROOT_FLAGS_VALUE_NAME = "Flags";
enum CERT_PROT_ROOT_DISABLE_CURRENT_USER_FLAG = 0x00000001;
enum CERT_PROT_ROOT_INHIBIT_ADD_AT_INIT_FLAG = 0x00000002;
enum CERT_PROT_ROOT_INHIBIT_PURGE_LM_FLAG = 0x00000004;
enum CERT_PROT_ROOT_DISABLE_LM_AUTH_FLAG = 0x00000008;
enum CERT_PROT_ROOT_ONLY_LM_GPT_FLAG = 0x00000008;
enum CERT_PROT_ROOT_DISABLE_NT_AUTH_REQUIRED_FLAG = 0x00000010;
enum CERT_PROT_ROOT_DISABLE_NOT_DEFINED_NAME_CONSTRAINT_FLAG = 0x00000020;
enum CERT_PROT_ROOT_DISABLE_PEER_TRUST = 0x00010000;
enum CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME = "PeerUsages";
enum CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME_A = "PeerUsages";
enum CERT_LOCAL_MACHINE_SYSTEM_STORE_REGPATH = "Software\\Microsoft\\SystemCertificates";
enum CERT_TRUST_PUB_AUTHENTICODE_FLAGS_VALUE_NAME = "AuthenticodeFlags";
enum CERT_TRUST_PUB_ALLOW_TRUST_MASK = 0x00000003;
enum CERT_TRUST_PUB_ALLOW_END_USER_TRUST = 0x00000000;
enum CERT_TRUST_PUB_ALLOW_MACHINE_ADMIN_TRUST = 0x00000001;
enum CERT_TRUST_PUB_ALLOW_ENTERPRISE_ADMIN_TRUST = 0x00000002;
enum CERT_TRUST_PUB_CHECK_PUBLISHER_REV_FLAG = 0x00000100;
enum CERT_TRUST_PUB_CHECK_TIMESTAMP_REV_FLAG = 0x00000200;
enum CERT_OCM_SUBCOMPONENTS_LOCAL_MACHINE_REGPATH = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\OC Manager\\Subcomponents";
enum CERT_OCM_SUBCOMPONENTS_ROOT_AUTO_UPDATE_VALUE_NAME = "RootAutoUpdate";
enum CERT_DISABLE_ROOT_AUTO_UPDATE_VALUE_NAME = "DisableRootAutoUpdate";
enum CERT_ENABLE_DISALLOWED_CERT_AUTO_UPDATE_VALUE_NAME = "EnableDisallowedCertAutoUpdate";
enum CERT_DISABLE_PIN_RULES_AUTO_UPDATE_VALUE_NAME = "DisablePinRulesAutoUpdate";
enum CERT_AUTO_UPDATE_ROOT_DIR_URL_VALUE_NAME = "RootDirUrl";
enum CERT_AUTO_UPDATE_SYNC_FROM_DIR_URL_VALUE_NAME = "SyncFromDirUrl";
enum CERT_AUTH_ROOT_AUTO_UPDATE_ROOT_DIR_URL_VALUE_NAME = "RootDirUrl";
enum CERT_AUTH_ROOT_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME = "SyncDeltaTime";
enum CERT_AUTH_ROOT_AUTO_UPDATE_FLAGS_VALUE_NAME = "Flags";
enum CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_UNTRUSTED_ROOT_LOGGING_FLAG = 0x00000001;
enum CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_PARTIAL_CHAIN_LOGGING_FLAG = 0x00000002;
enum CERT_AUTO_UPDATE_DISABLE_RANDOM_QUERY_STRING_FLAG = 0x00000004;
enum CERT_AUTH_ROOT_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME = "LastSyncTime";
enum CERT_AUTH_ROOT_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME = "EncodedCtl";
enum CERT_AUTH_ROOT_CTL_FILENAME = "authroot.stl";
enum CERT_AUTH_ROOT_CTL_FILENAME_A = "authroot.stl";
enum CERT_AUTH_ROOT_CAB_FILENAME = "authrootstl.cab";
enum CERT_AUTH_ROOT_SEQ_FILENAME = "authrootseq.txt";
enum CERT_AUTH_ROOT_CERT_EXT = ".crt";
enum CERT_DISALLOWED_CERT_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME = "DisallowedCertSyncDeltaTime";
enum CERT_DISALLOWED_CERT_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME = "DisallowedCertLastSyncTime";
enum CERT_DISALLOWED_CERT_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME = "DisallowedCertEncodedCtl";
enum CERT_DISALLOWED_CERT_CTL_FILENAME = "disallowedcert.stl";
enum CERT_DISALLOWED_CERT_CTL_FILENAME_A = "disallowedcert.stl";
enum CERT_DISALLOWED_CERT_CAB_FILENAME = "disallowedcertstl.cab";
enum CERT_DISALLOWED_CERT_AUTO_UPDATE_LIST_IDENTIFIER = "DisallowedCert_AutoUpdate_1";
enum CERT_PIN_RULES_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME = "PinRulesSyncDeltaTime";
enum CERT_PIN_RULES_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME = "PinRulesLastSyncTime";
enum CERT_PIN_RULES_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME = "PinRulesEncodedCtl";
enum CERT_PIN_RULES_CTL_FILENAME = "pinrules.stl";
enum CERT_PIN_RULES_CTL_FILENAME_A = "pinrules.stl";
enum CERT_PIN_RULES_CAB_FILENAME = "pinrulesstl.cab";
enum CERT_PIN_RULES_AUTO_UPDATE_LIST_IDENTIFIER = "PinRules_AutoUpdate_1";
enum CERT_REGISTRY_STORE_REMOTE_FLAG = 0x00010000;
enum CERT_REGISTRY_STORE_SERIALIZED_FLAG = 0x00020000;
enum CERT_REGISTRY_STORE_CLIENT_GPT_FLAG = 0x80000000;
enum CERT_REGISTRY_STORE_LM_GPT_FLAG = 0x01000000;
enum CERT_REGISTRY_STORE_ROAMING_FLAG = 0x00040000;
enum CERT_REGISTRY_STORE_MY_IE_DIRTY_FLAG = 0x00080000;
enum CERT_REGISTRY_STORE_EXTERNAL_FLAG = 0x00100000;
enum CERT_IE_DIRTY_FLAGS_REGPATH = "Software\\Microsoft\\Cryptography\\IEDirtyFlags";
enum CERT_FILE_STORE_COMMIT_ENABLE_FLAG = 0x00010000;
enum CERT_LDAP_STORE_SIGN_FLAG = 0x00010000;
enum CERT_LDAP_STORE_AREC_EXCLUSIVE_FLAG = 0x00020000;
enum CERT_LDAP_STORE_OPENED_FLAG = 0x00040000;
enum CERT_LDAP_STORE_UNBIND_FLAG = 0x00080000;
enum CRYPT_OID_OPEN_STORE_PROV_FUNC = "CertDllOpenStoreProv";
enum CERT_STORE_PROV_GP_SYSTEM_STORE_FLAG = 0x00000020;
enum CERT_STORE_PROV_SHARED_USER_FLAG = 0x00000040;
enum CERT_STORE_PROV_CLOSE_FUNC = 0x00000000;
enum CERT_STORE_PROV_READ_CERT_FUNC = 0x00000001;
enum CERT_STORE_PROV_WRITE_CERT_FUNC = 0x00000002;
enum CERT_STORE_PROV_DELETE_CERT_FUNC = 0x00000003;
enum CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC = 0x00000004;
enum CERT_STORE_PROV_READ_CRL_FUNC = 0x00000005;
enum CERT_STORE_PROV_WRITE_CRL_FUNC = 0x00000006;
enum CERT_STORE_PROV_DELETE_CRL_FUNC = 0x00000007;
enum CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC = 0x00000008;
enum CERT_STORE_PROV_READ_CTL_FUNC = 0x00000009;
enum CERT_STORE_PROV_WRITE_CTL_FUNC = 0x0000000a;
enum CERT_STORE_PROV_DELETE_CTL_FUNC = 0x0000000b;
enum CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC = 0x0000000c;
enum CERT_STORE_PROV_CONTROL_FUNC = 0x0000000d;
enum CERT_STORE_PROV_FIND_CERT_FUNC = 0x0000000e;
enum CERT_STORE_PROV_FREE_FIND_CERT_FUNC = 0x0000000f;
enum CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC = 0x00000010;
enum CERT_STORE_PROV_FIND_CRL_FUNC = 0x00000011;
enum CERT_STORE_PROV_FREE_FIND_CRL_FUNC = 0x00000012;
enum CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC = 0x00000013;
enum CERT_STORE_PROV_FIND_CTL_FUNC = 0x00000014;
enum CERT_STORE_PROV_FREE_FIND_CTL_FUNC = 0x00000015;
enum CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC = 0x00000016;
enum CERT_STORE_PROV_WRITE_ADD_FLAG = 0x00000001;
enum CERT_STORE_SAVE_AS_PKCS12 = 0x00000003;
enum CERT_CLOSE_STORE_FORCE_FLAG = 0x00000001;
enum CERT_CLOSE_STORE_CHECK_FLAG = 0x00000002;
enum CERT_COMPARE_MASK = 0x0000ffff;
enum CERT_COMPARE_ANY = 0x00000000;
enum CERT_COMPARE_SHA1_HASH = 0x00000001;
enum CERT_COMPARE_NAME = 0x00000002;
enum CERT_COMPARE_ATTR = 0x00000003;
enum CERT_COMPARE_MD5_HASH = 0x00000004;
enum CERT_COMPARE_PROPERTY = 0x00000005;
enum CERT_COMPARE_PUBLIC_KEY = 0x00000006;
enum CERT_COMPARE_HASH = 0x00000001;
enum CERT_COMPARE_NAME_STR_A = 0x00000007;
enum CERT_COMPARE_NAME_STR_W = 0x00000008;
enum CERT_COMPARE_KEY_SPEC = 0x00000009;
enum CERT_COMPARE_ENHKEY_USAGE = 0x0000000a;
enum CERT_COMPARE_CTL_USAGE = 0x0000000a;
enum CERT_COMPARE_SUBJECT_CERT = 0x0000000b;
enum CERT_COMPARE_ISSUER_OF = 0x0000000c;
enum CERT_COMPARE_EXISTING = 0x0000000d;
enum CERT_COMPARE_SIGNATURE_HASH = 0x0000000e;
enum CERT_COMPARE_KEY_IDENTIFIER = 0x0000000f;
enum CERT_COMPARE_CERT_ID = 0x00000010;
enum CERT_COMPARE_CROSS_CERT_DIST_POINTS = 0x00000011;
enum CERT_COMPARE_PUBKEY_MD5_HASH = 0x00000012;
enum CERT_COMPARE_SUBJECT_INFO_ACCESS = 0x00000013;
enum CERT_COMPARE_HASH_STR = 0x00000014;
enum CERT_COMPARE_HAS_PRIVATE_KEY = 0x00000015;
enum CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG = 0x80000000;
enum CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG = 0x40000000;
enum CTL_ENTRY_FROM_PROP_CHAIN_FLAG = 0x00000001;
enum CRL_FIND_ANY = 0x00000000;
enum CRL_FIND_ISSUED_BY = 0x00000001;
enum CRL_FIND_EXISTING = 0x00000002;
enum CRL_FIND_ISSUED_FOR = 0x00000003;
enum CRL_FIND_ISSUED_BY_AKI_FLAG = 0x00000001;
enum CRL_FIND_ISSUED_BY_SIGNATURE_FLAG = 0x00000002;
enum CRL_FIND_ISSUED_BY_DELTA_FLAG = 0x00000004;
enum CRL_FIND_ISSUED_BY_BASE_FLAG = 0x00000008;
enum CRL_FIND_ISSUED_FOR_SET_STRONG_PROPERTIES_FLAG = 0x00000010;
enum CERT_STORE_ADD_NEW = 0x00000001;
enum CERT_STORE_ADD_USE_EXISTING = 0x00000002;
enum CERT_STORE_ADD_REPLACE_EXISTING = 0x00000003;
enum CERT_STORE_ADD_ALWAYS = 0x00000004;
enum CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES = 0x00000005;
enum CERT_STORE_ADD_NEWER = 0x00000006;
enum CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES = 0x00000007;
enum CERT_STORE_CERTIFICATE_CONTEXT = 0x00000001;
enum CERT_STORE_CRL_CONTEXT = 0x00000002;
enum CERT_STORE_CTL_CONTEXT = 0x00000003;
enum CTL_ANY_SUBJECT_TYPE = 0x00000001;
enum CTL_CERT_SUBJECT_TYPE = 0x00000002;
enum CTL_FIND_NO_LIST_ID_CBDATA = 0xffffffff;
enum CERT_STORE_CTRL_RESYNC = 0x00000001;
enum CERT_STORE_CTRL_NOTIFY_CHANGE = 0x00000002;
enum CERT_STORE_CTRL_COMMIT = 0x00000003;
enum CERT_STORE_CTRL_AUTO_RESYNC = 0x00000004;
enum CERT_STORE_CTRL_CANCEL_NOTIFY = 0x00000005;
enum CERT_STORE_LOCALIZED_NAME_PROP_ID = 0x00001000;
enum CERT_CREATE_CONTEXT_NOCOPY_FLAG = 0x00000001;
enum CERT_CREATE_CONTEXT_SORTED_FLAG = 0x00000002;
enum CERT_CREATE_CONTEXT_NO_HCRYPTMSG_FLAG = 0x00000004;
enum CERT_CREATE_CONTEXT_NO_ENTRY_FLAG = 0x00000008;
enum CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG = 0x00000001;
enum CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG = 0x00000002;
enum CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG = 0x00000004;
enum CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG = 0x00000008;
enum CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG = 0x00000001;
enum CERT_PHYSICAL_STORE_DEFAULT_NAME = ".Default";
enum CERT_PHYSICAL_STORE_GROUP_POLICY_NAME = ".GroupPolicy";
enum CERT_PHYSICAL_STORE_LOCAL_MACHINE_NAME = ".LocalMachine";
enum CERT_PHYSICAL_STORE_DS_USER_CERTIFICATE_NAME = ".UserCertificate";
enum CERT_PHYSICAL_STORE_LOCAL_MACHINE_GROUP_POLICY_NAME = ".LocalMachineGroupPolicy";
enum CERT_PHYSICAL_STORE_ENTERPRISE_NAME = ".Enterprise";
enum CERT_PHYSICAL_STORE_AUTH_ROOT_NAME = ".AuthRoot";
enum CERT_PHYSICAL_STORE_SMART_CARD_NAME = ".SmartCard";
enum CRYPT_OID_OPEN_SYSTEM_STORE_PROV_FUNC = "CertDllOpenSystemStoreProv";
enum CRYPT_OID_REGISTER_SYSTEM_STORE_FUNC = "CertDllRegisterSystemStore";
enum CRYPT_OID_UNREGISTER_SYSTEM_STORE_FUNC = "CertDllUnregisterSystemStore";
enum CRYPT_OID_ENUM_SYSTEM_STORE_FUNC = "CertDllEnumSystemStore";
enum CRYPT_OID_REGISTER_PHYSICAL_STORE_FUNC = "CertDllRegisterPhysicalStore";
enum CRYPT_OID_UNREGISTER_PHYSICAL_STORE_FUNC = "CertDllUnregisterPhysicalStore";
enum CRYPT_OID_ENUM_PHYSICAL_STORE_FUNC = "CertDllEnumPhysicalStore";
enum CRYPT_OID_SYSTEM_STORE_LOCATION_VALUE_NAME = "SystemStoreLocation";
enum CMSG_TRUSTED_SIGNER_FLAG = 0x00000001;
enum CMSG_SIGNER_ONLY_FLAG = 0x00000002;
enum CMSG_USE_SIGNER_INDEX_FLAG = 0x00000004;
enum CMSG_CMS_ENCAPSULATED_CTL_FLAG = 0x00008000;
enum CMSG_ENCODE_SORTED_CTL_FLAG = 0x00000001;
enum CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x00000002;
enum CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG = 0x00000001;
enum CERT_VERIFY_TRUSTED_SIGNERS_FLAG = 0x00000002;
enum CERT_VERIFY_NO_TIME_CHECK_FLAG = 0x00000004;
enum CERT_VERIFY_ALLOW_MORE_USAGE_FLAG = 0x00000008;
enum CERT_VERIFY_UPDATED_CTL_FLAG = 0x00000001;
enum CERT_CONTEXT_REVOCATION_TYPE = 0x00000001;
enum CERT_VERIFY_REV_CHAIN_FLAG = 0x00000001;
enum CERT_VERIFY_CACHE_ONLY_BASED_REVOCATION = 0x00000002;
enum CERT_VERIFY_REV_ACCUMULATIVE_TIMEOUT_FLAG = 0x00000004;
enum CERT_VERIFY_REV_SERVER_OCSP_FLAG = 0x00000008;
enum CERT_VERIFY_REV_NO_OCSP_FAILOVER_TO_CRL_FLAG = 0x00000010;
enum CERT_VERIFY_REV_SERVER_OCSP_WIRE_ONLY_FLAG = 0x00000020;
enum CERT_UNICODE_IS_RDN_ATTRS_FLAG = 0x00000001;
enum CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG = 0x00000002;
enum CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB = 0x00000001;
enum CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT = 0x00000002;
enum CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL = 0x00000003;
enum CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE = 0x00000004;
enum CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY = 0x00000001;
enum CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT = 0x00000002;
enum CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN = 0x00000003;
enum CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL = 0x00000004;
enum CRYPT_VERIFY_CERT_SIGN_CHECK_WEAK_HASH_FLAG = 0x00000008;
enum CRYPT_OID_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC = "CryptDllExtractEncodedSignatureParameters";
enum CRYPT_OID_SIGN_AND_ENCODE_HASH_FUNC = "CryptDllSignAndEncodeHash";
enum CRYPT_OID_VERIFY_ENCODED_SIGNATURE_FUNC = "CryptDllVerifyEncodedSignature";
enum CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FUNC = "CryptDllExportPublicKeyInfoEx";
enum CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC = "CryptDllExportPublicKeyInfoEx2";
enum CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC = "CryptDllExportPublicKeyInfoFromBCryptKeyHandle";
enum CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_FUNC = "CryptDllImportPublicKeyInfoEx";
enum CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC = "CryptDllImportPublicKeyInfoEx2";
enum CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG = 0x00000080;
enum CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK = 0x00070000;
enum CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG = 0x00010000;
enum CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG = 0x00020000;
enum CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG = 0x00040000;
enum CRYPT_OID_IMPORT_PRIVATE_KEY_INFO_FUNC = "CryptDllImportPrivateKeyInfoEx";
enum CRYPT_OID_EXPORT_PRIVATE_KEY_INFO_FUNC = "CryptDllExportPrivateKeyInfoEx";
enum CRYPT_DELETE_KEYSET = 0x00000010;
enum CERT_XML_NAME_STR = 0x00000004;
enum CERT_NAME_STR_SEMICOLON_FLAG = 0x40000000;
enum CERT_NAME_STR_NO_PLUS_FLAG = 0x20000000;
enum CERT_NAME_STR_NO_QUOTING_FLAG = 0x10000000;
enum CERT_NAME_STR_CRLF_FLAG = 0x08000000;
enum CERT_NAME_STR_COMMA_FLAG = 0x04000000;
enum CERT_NAME_STR_REVERSE_FLAG = 0x02000000;
enum CERT_NAME_STR_FORWARD_FLAG = 0x01000000;
enum CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG = 0x00010000;
enum CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG = 0x00020000;
enum CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG = 0x00040000;
enum CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG = 0x00080000;
enum CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG = 0x00100000;
enum CERT_NAME_STR_ENABLE_PUNYCODE_FLAG = 0x00200000;
enum CERT_NAME_EMAIL_TYPE = 0x00000001;
enum CERT_NAME_RDN_TYPE = 0x00000002;
enum CERT_NAME_ATTR_TYPE = 0x00000003;
enum CERT_NAME_SIMPLE_DISPLAY_TYPE = 0x00000004;
enum CERT_NAME_FRIENDLY_DISPLAY_TYPE = 0x00000005;
enum CERT_NAME_DNS_TYPE = 0x00000006;
enum CERT_NAME_URL_TYPE = 0x00000007;
enum CERT_NAME_UPN_TYPE = 0x00000008;
enum CERT_NAME_ISSUER_FLAG = 0x00000001;
enum CERT_NAME_DISABLE_IE4_UTF8_FLAG = 0x00010000;
enum CERT_NAME_SEARCH_ALL_NAMES_FLAG = 0x00000002;
enum CRYPT_MESSAGE_BARE_CONTENT_OUT_FLAG = 0x00000001;
enum CRYPT_MESSAGE_ENCAPSULATED_CONTENT_OUT_FLAG = 0x00000002;
enum CRYPT_MESSAGE_KEYID_SIGNER_FLAG = 0x00000004;
enum CRYPT_MESSAGE_SILENT_KEYSET_FLAG = 0x00000040;
enum CRYPT_MESSAGE_KEYID_RECIPIENT_FLAG = 0x00000004;
enum CREDENTIAL_OID_PASSWORD_CREDENTIALS_A = 0x00000001;
enum CREDENTIAL_OID_PASSWORD_CREDENTIALS_W = 0x00000002;
enum CREDENTIAL_OID_PASSWORD_CREDENTIALS = 0x00000002;
enum SCHEME_OID_RETRIEVE_ENCODED_OBJECT_FUNC = "SchemeDllRetrieveEncodedObject";
enum SCHEME_OID_RETRIEVE_ENCODED_OBJECTW_FUNC = "SchemeDllRetrieveEncodedObjectW";
enum CONTEXT_OID_CREATE_OBJECT_CONTEXT_FUNC = "ContextDllCreateObjectContext";
enum CONTEXT_OID_CERTIFICATE = 0x00000001;
enum CONTEXT_OID_CRL = 0x00000002;
enum CONTEXT_OID_CTL = 0x00000003;
enum CONTEXT_OID_PKCS7 = 0x00000004;
enum CONTEXT_OID_CAPI2_ANY = 0x00000005;
enum CONTEXT_OID_OCSP_RESP = 0x00000006;
enum CRYPT_RETRIEVE_MULTIPLE_OBJECTS = 0x00000001;
enum CRYPT_CACHE_ONLY_RETRIEVAL = 0x00000002;
enum CRYPT_WIRE_ONLY_RETRIEVAL = 0x00000004;
enum CRYPT_DONT_CACHE_RESULT = 0x00000008;
enum CRYPT_ASYNC_RETRIEVAL = 0x00000010;
enum CRYPT_STICKY_CACHE_RETRIEVAL = 0x00001000;
enum CRYPT_LDAP_SCOPE_BASE_ONLY_RETRIEVAL = 0x00002000;
enum CRYPT_OFFLINE_CHECK_RETRIEVAL = 0x00004000;
enum CRYPT_LDAP_INSERT_ENTRY_ATTRIBUTE = 0x00008000;
enum CRYPT_LDAP_SIGN_RETRIEVAL = 0x00010000;
enum CRYPT_NO_AUTH_RETRIEVAL = 0x00020000;
enum CRYPT_LDAP_AREC_EXCLUSIVE_RETRIEVAL = 0x00040000;
enum CRYPT_AIA_RETRIEVAL = 0x00080000;
enum CRYPT_HTTP_POST_RETRIEVAL = 0x00100000;
enum CRYPT_PROXY_CACHE_RETRIEVAL = 0x00200000;
enum CRYPT_NOT_MODIFIED_RETRIEVAL = 0x00400000;
enum CRYPT_ENABLE_SSL_REVOCATION_RETRIEVAL = 0x00800000;
enum CRYPT_RANDOM_QUERY_STRING_RETRIEVAL = 0x04000000;
enum CRYPT_ENABLE_FILE_RETRIEVAL = 0x08000000;
enum CRYPT_CREATE_NEW_FLUSH_ENTRY = 0x10000000;
enum CRYPT_VERIFY_CONTEXT_SIGNATURE = 0x00000020;
enum CRYPT_VERIFY_DATA_HASH = 0x00000040;
enum CRYPT_KEEP_TIME_VALID = 0x00000080;
enum CRYPT_DONT_VERIFY_SIGNATURE = 0x00000100;
enum CRYPT_DONT_CHECK_TIME_VALIDITY = 0x00000200;
enum CRYPT_CHECK_FRESHNESS_TIME_VALIDITY = 0x00000400;
enum CRYPT_ACCUMULATIVE_TIMEOUT = 0x00000800;
enum CRYPT_OCSP_ONLY_RETRIEVAL = 0x01000000;
enum CRYPT_NO_OCSP_FAILOVER_TO_CRL_RETRIEVAL = 0x02000000;
enum CRYPTNET_URL_CACHE_PRE_FETCH_NONE = 0x00000000;
enum CRYPTNET_URL_CACHE_PRE_FETCH_BLOB = 0x00000001;
enum CRYPTNET_URL_CACHE_PRE_FETCH_CRL = 0x00000002;
enum CRYPTNET_URL_CACHE_PRE_FETCH_OCSP = 0x00000003;
enum CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB = 0x00000005;
enum CRYPTNET_URL_CACHE_PRE_FETCH_DISALLOWED_CERT_CAB = 0x00000006;
enum CRYPTNET_URL_CACHE_PRE_FETCH_PIN_RULES_CAB = 0x00000007;
enum CRYPTNET_URL_CACHE_DEFAULT_FLUSH = 0x00000000;
enum CRYPTNET_URL_CACHE_DISABLE_FLUSH = 0xffffffff;
enum CRYPTNET_URL_CACHE_RESPONSE_NONE = 0x00000000;
enum CRYPTNET_URL_CACHE_RESPONSE_HTTP = 0x00000001;
enum CRYPTNET_URL_CACHE_RESPONSE_VALIDATED = 0x00008000;
enum CRYPT_RETRIEVE_MAX_ERROR_CONTENT_LENGTH = 0x00001000;
enum CRYPT_PARAM_ASYNC_RETRIEVAL_COMPLETION = 0x00000001;
enum CRYPT_PARAM_CANCEL_ASYNC_RETRIEVAL = 0x00000002;
enum URL_OID_GET_OBJECT_URL_FUNC = "UrlDllGetObjectUrl";
enum URL_OID_CERTIFICATE_ISSUER = 0x00000001;
enum URL_OID_CERTIFICATE_CRL_DIST_POINT = 0x00000002;
enum URL_OID_CTL_ISSUER = 0x00000003;
enum URL_OID_CTL_NEXT_UPDATE = 0x00000004;
enum URL_OID_CRL_ISSUER = 0x00000005;
enum URL_OID_CERTIFICATE_FRESHEST_CRL = 0x00000006;
enum URL_OID_CRL_FRESHEST_CRL = 0x00000007;
enum URL_OID_CROSS_CERT_DIST_POINT = 0x00000008;
enum URL_OID_CERTIFICATE_OCSP = 0x00000009;
enum URL_OID_CERTIFICATE_OCSP_AND_CRL_DIST_POINT = 0x0000000a;
enum URL_OID_CERTIFICATE_CRL_DIST_POINT_AND_OCSP = 0x0000000b;
enum URL_OID_CROSS_CERT_SUBJECT_INFO_ACCESS = 0x0000000c;
enum URL_OID_CERTIFICATE_ONLY_OCSP = 0x0000000d;
enum TIME_VALID_OID_GET_OBJECT_FUNC = "TimeValidDllGetObject";
enum TIME_VALID_OID_GET_CTL = 0x00000001;
enum TIME_VALID_OID_GET_CRL = 0x00000002;
enum TIME_VALID_OID_GET_CRL_FROM_CERT = 0x00000003;
enum TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CERT = 0x00000004;
enum TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CRL = 0x00000005;
enum TIME_VALID_OID_FLUSH_OBJECT_FUNC = "TimeValidDllFlushObject";
enum TIME_VALID_OID_FLUSH_CTL = 0x00000001;
enum TIME_VALID_OID_FLUSH_CRL = 0x00000002;
enum TIME_VALID_OID_FLUSH_CRL_FROM_CERT = 0x00000003;
enum TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CERT = 0x00000004;
enum TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CRL = 0x00000005;
enum CRYPT_KEYID_MACHINE_FLAG = 0x00000020;
enum CRYPT_KEYID_ALLOC_FLAG = 0x00008000;
enum CRYPT_KEYID_DELETE_FLAG = 0x00000010;
enum CRYPT_KEYID_SET_NEW_FLAG = 0x00002000;
enum CERT_CHAIN_CONFIG_REGPATH = "Software\\Microsoft\\Cryptography\\OID\\EncodingType 0\\CertDllCreateCertificateChainEngine\\Config";
enum CERT_CHAIN_MAX_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME = "MaxUrlRetrievalByteCount";
enum CERT_CHAIN_CACHE_RESYNC_FILETIME_VALUE_NAME = "ChainCacheResyncFiletime";
enum CERT_CHAIN_DISABLE_MANDATORY_BASIC_CONSTRAINTS_VALUE_NAME = "DisableMandatoryBasicConstraints";
enum CERT_CHAIN_DISABLE_CA_NAME_CONSTRAINTS_VALUE_NAME = "DisableCANameConstraints";
enum CERT_CHAIN_DISABLE_UNSUPPORTED_CRITICAL_EXTENSIONS_VALUE_NAME = "DisableUnsupportedCriticalExtensions";
enum CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_VALUE_NAME = "MaxAIAUrlCountInCert";
enum CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_DEFAULT = 0x00000005;
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_VALUE_NAME = "MaxAIAUrlRetrievalCountPerChain";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_DEFAULT = 0x00000003;
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME = "MaxAIAUrlRetrievalByteCount";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_DEFAULT = 0x000186a0;
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_VALUE_NAME = "MaxAIAUrlRetrievalCertCount";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_DEFAULT = 0x0000000a;
enum CERT_CHAIN_OCSP_VALIDITY_SECONDS_VALUE_NAME = "OcspValiditySeconds";
enum CERT_CHAIN_DISABLE_SERIAL_CHAIN_VALUE_NAME = "DisableSerialChain";
enum CERT_CHAIN_SERIAL_CHAIN_LOG_FILE_NAME_VALUE_NAME = "SerialChainLogFileName";
enum CERT_CHAIN_DISABLE_SYNC_WITH_SSL_TIME_VALUE_NAME = "DisableSyncWithSslTime";
enum CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_VALUE_NAME = "MaxSslTimeUpdatedEventCount";
enum CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DEFAULT = 0x00000005;
enum CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DISABLE = 0xffffffff;
enum CERT_CHAIN_SSL_HANDSHAKE_LOG_FILE_NAME_VALUE_NAME = "SslHandshakeLogFileName";
enum CERT_CHAIN_ENABLE_WEAK_SIGNATURE_FLAGS_VALUE_NAME = "EnableWeakSignatureFlags";
enum CERT_CHAIN_ENABLE_MD2_MD4_FLAG = 0x00000001;
enum CERT_CHAIN_ENABLE_WEAK_RSA_ROOT_FLAG = 0x00000002;
enum CERT_CHAIN_ENABLE_WEAK_LOGGING_FLAG = 0x00000004;
enum CERT_CHAIN_ENABLE_ONLY_WEAK_LOGGING_FLAG = 0x00000008;
enum CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_VALUE_NAME = "MinRsaPubKeyBitLength";
enum CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DEFAULT = 0x000003ff;
enum CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DISABLE = 0xffffffff;
enum CERT_CHAIN_WEAK_RSA_PUB_KEY_TIME_VALUE_NAME = "WeakRsaPubKeyTime";
enum CERT_CHAIN_WEAK_SIGNATURE_LOG_DIR_VALUE_NAME = "WeakSignatureLogDir";
enum CERT_CHAIN_DEFAULT_CONFIG_SUBDIR = "Default";
enum CERT_CHAIN_WEAK_PREFIX_NAME = "Weak";
enum CERT_CHAIN_WEAK_THIRD_PARTY_CONFIG_NAME = "ThirdParty";
enum CERT_CHAIN_WEAK_ALL_CONFIG_NAME = "All";
enum CERT_CHAIN_WEAK_FLAGS_NAME = "Flags";
enum CERT_CHAIN_WEAK_HYGIENE_NAME = "Hygiene";
enum CERT_CHAIN_WEAK_AFTER_TIME_NAME = "AfterTime";
enum CERT_CHAIN_WEAK_FILE_HASH_AFTER_TIME_NAME = "FileHashAfterTime";
enum CERT_CHAIN_WEAK_TIMESTAMP_HASH_AFTER_TIME_NAME = "TimestampHashAfterTime";
enum CERT_CHAIN_WEAK_MIN_BIT_LENGTH_NAME = "MinBitLength";
enum CERT_CHAIN_WEAK_SHA256_ALLOW_NAME = "Sha256Allow";
enum CERT_CHAIN_MIN_PUB_KEY_BIT_LENGTH_DISABLE = 0xffffffff;
enum CERT_CHAIN_ENABLE_WEAK_SETTINGS_FLAG = 0x80000000;
enum CERT_CHAIN_DISABLE_ECC_PARA_FLAG = 0x00000010;
enum CERT_CHAIN_DISABLE_ALL_EKU_WEAK_FLAG = 0x00010000;
enum CERT_CHAIN_ENABLE_ALL_EKU_HYGIENE_FLAG = 0x00020000;
enum CERT_CHAIN_DISABLE_OPT_IN_SERVER_AUTH_WEAK_FLAG = 0x00040000;
enum CERT_CHAIN_DISABLE_SERVER_AUTH_WEAK_FLAG = 0x00100000;
enum CERT_CHAIN_ENABLE_SERVER_AUTH_HYGIENE_FLAG = 0x00200000;
enum CERT_CHAIN_DISABLE_CODE_SIGNING_WEAK_FLAG = 0x00400000;
enum CERT_CHAIN_DISABLE_MOTW_CODE_SIGNING_WEAK_FLAG = 0x00800000;
enum CERT_CHAIN_ENABLE_CODE_SIGNING_HYGIENE_FLAG = 0x01000000;
enum CERT_CHAIN_ENABLE_MOTW_CODE_SIGNING_HYGIENE_FLAG = 0x02000000;
enum CERT_CHAIN_DISABLE_TIMESTAMP_WEAK_FLAG = 0x04000000;
enum CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_WEAK_FLAG = 0x08000000;
enum CERT_CHAIN_ENABLE_TIMESTAMP_HYGIENE_FLAG = 0x10000000;
enum CERT_CHAIN_ENABLE_MOTW_TIMESTAMP_HYGIENE_FLAG = 0x20000000;
enum CERT_CHAIN_MOTW_IGNORE_AFTER_TIME_WEAK_FLAG = 0x40000000;
enum CERT_CHAIN_DISABLE_FILE_HASH_WEAK_FLAG = 0x00001000;
enum CERT_CHAIN_DISABLE_MOTW_FILE_HASH_WEAK_FLAG = 0x00002000;
enum CERT_CHAIN_DISABLE_TIMESTAMP_HASH_WEAK_FLAG = 0x00004000;
enum CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_HASH_WEAK_FLAG = 0x00008000;
enum CERT_CHAIN_OPT_IN_WEAK_FLAGS = 0x00040000;
enum CERT_CHAIN_AUTO_CURRENT_USER = 0x00000001;
enum CERT_CHAIN_AUTO_LOCAL_MACHINE = 0x00000002;
enum CERT_CHAIN_AUTO_IMPERSONATED = 0x00000003;
enum CERT_CHAIN_AUTO_PROCESS_INFO = 0x00000004;
enum CERT_CHAIN_AUTO_PINRULE_INFO = 0x00000005;
enum CERT_CHAIN_AUTO_NETWORK_INFO = 0x00000006;
enum CERT_CHAIN_AUTO_SERIAL_LOCAL_MACHINE = 0x00000007;
enum CERT_CHAIN_AUTO_HPKP_RULE_INFO = 0x00000008;
enum CERT_CHAIN_AUTO_FLAGS_VALUE_NAME = "AutoFlags";
enum CERT_CHAIN_AUTO_FLUSH_DISABLE_FLAG = 0x00000001;
enum CERT_CHAIN_AUTO_LOG_CREATE_FLAG = 0x00000002;
enum CERT_CHAIN_AUTO_LOG_FREE_FLAG = 0x00000004;
enum CERT_CHAIN_AUTO_LOG_FLUSH_FLAG = 0x00000008;
enum CERT_CHAIN_AUTO_FLUSH_FIRST_DELTA_SECONDS_VALUE_NAME = "AutoFlushFirstDeltaSeconds";
enum CERT_CHAIN_AUTO_FLUSH_NEXT_DELTA_SECONDS_VALUE_NAME = "AutoFlushNextDeltaSeconds";
enum CERT_CHAIN_AUTO_LOG_FILE_NAME_VALUE_NAME = "AutoLogFileName";
enum CERT_CHAIN_DISABLE_AUTO_FLUSH_PROCESS_NAME_LIST_VALUE_NAME = "DisableAutoFlushProcessNameList";
enum CERT_SRV_OCSP_RESP_MIN_VALIDITY_SECONDS_VALUE_NAME = "SrvOcspRespMinValiditySeconds";
enum CERT_SRV_OCSP_RESP_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "SrvOcspRespUrlRetrievalTimeoutMilliseconds";
enum CERT_SRV_OCSP_RESP_MAX_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "SrvOcspRespMaxBeforeNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MIN_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "SrvOcspRespMinBeforeNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MIN_AFTER_NEXT_UPDATE_SECONDS_VALUE_NAME = "SrvOcspRespMinAfterNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MIN_SYNC_CERT_FILE_SECONDS_VALUE_NAME = "SrvOcspRespMinSyncCertFileSeconds";
enum CERT_SRV_OCSP_RESP_MIN_SYNC_CERT_FILE_SECONDS_DEFAULT = 0x00000005;
enum CERT_SRV_OCSP_RESP_MAX_SYNC_CERT_FILE_SECONDS_VALUE_NAME = "SrvOcspRespMaxSyncCertFileSeconds";
enum CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_VALUE_NAME = "CryptnetMaxCachedOcspPerCrlCount";
enum CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_DEFAULT = 0x000001f4;
enum CRYPTNET_OCSP_AFTER_CRL_DISABLE = 0xffffffff;
enum CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_VALUE_NAME = "CryptnetDefaultFlushExemptSeconds";
enum CRYPTNET_PRE_FETCH_MIN_MAX_AGE_SECONDS_VALUE_NAME = "CryptnetPreFetchMinMaxAgeSeconds";
enum CRYPTNET_PRE_FETCH_MAX_MAX_AGE_SECONDS_VALUE_NAME = "CryptnetPreFetchMaxMaxAgeSeconds";
enum CRYPTNET_PRE_FETCH_MIN_OCSP_VALIDITY_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMinOcspValidityPeriodSeconds";
enum CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchAfterPublishPreFetchDivisor";
enum CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_DEFAULT = 0x0000000a;
enum CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchBeforeNextUpdatePreFetchDivisor";
enum CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 0x00000014;
enum CRYPTNET_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMinBeforeNextUpdatePreFetchSeconds";
enum CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchValidityPeriodAfterNextUpdatePreFetchDivisor";
enum CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 0x0000000a;
enum CRYPTNET_PRE_FETCH_MAX_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMaxAfterNextUpdatePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMinAfterNextUpdatePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_AFTER_CURRENT_TIME_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchAfterCurrentTimePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_TRIGGER_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchTriggerPeriodSeconds";
enum CRYPTNET_PRE_FETCH_TRIGGER_DISABLE = 0xffffffff;
enum CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_VALUE_NAME = "CryptnetPreFetchScanAfterTriggerDelaySeconds";
enum CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_DEFAULT = 0x0000003c;
enum CRYPTNET_PRE_FETCH_RETRIEVAL_TIMEOUT_SECONDS_VALUE_NAME = "CryptnetPreFetchRetrievalTimeoutSeconds";
enum CRYPTNET_CRL_PRE_FETCH_PROCESS_NAME_LIST_VALUE_NAME = "ProcessNameList";
enum CRYPTNET_CRL_PRE_FETCH_URL_LIST_VALUE_NAME = "PreFetchUrlList";
enum CRYPTNET_CRL_PRE_FETCH_DISABLE_INFORMATION_EVENTS_VALUE_NAME = "DisableInformationEvents";
enum CRYPTNET_CRL_PRE_FETCH_LOG_FILE_NAME_VALUE_NAME = "LogFileName";
enum CRYPTNET_CRL_PRE_FETCH_TIMEOUT_SECONDS_VALUE_NAME = "TimeoutSeconds";
enum CRYPTNET_CRL_PRE_FETCH_MAX_AGE_SECONDS_VALUE_NAME = "MaxAgeSeconds";
enum CRYPTNET_CRL_PRE_FETCH_PUBLISH_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "PublishBeforeNextUpdateSeconds";
enum CRYPTNET_CRL_PRE_FETCH_PUBLISH_RANDOM_INTERVAL_SECONDS_VALUE_NAME = "PublishRandomIntervalSeconds";
enum CRYPTNET_CRL_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "MinBeforeNextUpdateSeconds";
enum CRYPTNET_CRL_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_SECONDS_VALUE_NAME = "MinAfterNextUpdateSeconds";
enum CERT_CHAIN_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "ChainUrlRetrievalTimeoutMilliseconds";
enum CERT_CHAIN_REV_ACCUMULATIVE_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "ChainRevAccumulativeUrlRetrievalTimeoutMilliseconds";
enum CERT_RETR_BEHAVIOR_INET_AUTH_VALUE_NAME = "EnableInetUnknownAuth";
enum CERT_RETR_BEHAVIOR_INET_STATUS_VALUE_NAME = "EnableInetLocal";
enum CERT_RETR_BEHAVIOR_FILE_VALUE_NAME = "AllowFileUrlScheme";
enum CERT_RETR_BEHAVIOR_LDAP_VALUE_NAME = "DisableLDAPSignAndEncrypt";
enum CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_VALUE_NAME = "CryptnetCachedOcspSwitchToCrlCount";
enum CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_DEFAULT = 0x00000032;
enum CRYPTNET_CRL_BEFORE_OCSP_ENABLE = 0xffffffff;
enum CERT_CHAIN_DISABLE_AIA_URL_RETRIEVAL_VALUE_NAME = "DisableAIAUrlRetrieval";
enum CERT_CHAIN_OPTIONS_VALUE_NAME = "Options";
enum CERT_CHAIN_OPTION_DISABLE_AIA_URL_RETRIEVAL = 0x00000002;
enum CERT_CHAIN_OPTION_ENABLE_SIA_URL_RETRIEVAL = 0x00000004;
enum CERT_CHAIN_CROSS_CERT_DOWNLOAD_INTERVAL_HOURS_VALUE_NAME = "CrossCertDownloadIntervalHours";
enum CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_VALUE_NAME = "CRLValidityExtensionPeriod";
enum CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_DEFAULT = 0x0000000c;
enum CERT_CHAIN_CACHE_END_CERT = 0x00000001;
enum CERT_CHAIN_THREAD_STORE_SYNC = 0x00000002;
enum CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL = 0x00000004;
enum CERT_CHAIN_USE_LOCAL_MACHINE_STORE = 0x00000008;
enum CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE = 0x00000010;
enum CERT_CHAIN_ENABLE_SHARE_STORE = 0x00000020;
enum CERT_CHAIN_EXCLUSIVE_ENABLE_CA_FLAG = 0x00000001;
enum CERT_TRUST_NO_ERROR = 0x00000000;
enum CERT_TRUST_IS_NOT_TIME_VALID = 0x00000001;
enum CERT_TRUST_IS_NOT_TIME_NESTED = 0x00000002;
enum CERT_TRUST_IS_REVOKED = 0x00000004;
enum CERT_TRUST_IS_NOT_SIGNATURE_VALID = 0x00000008;
enum CERT_TRUST_IS_NOT_VALID_FOR_USAGE = 0x00000010;
enum CERT_TRUST_IS_UNTRUSTED_ROOT = 0x00000020;
enum CERT_TRUST_REVOCATION_STATUS_UNKNOWN = 0x00000040;
enum CERT_TRUST_IS_CYCLIC = 0x00000080;
enum CERT_TRUST_INVALID_EXTENSION = 0x00000100;
enum CERT_TRUST_INVALID_POLICY_CONSTRAINTS = 0x00000200;
enum CERT_TRUST_INVALID_BASIC_CONSTRAINTS = 0x00000400;
enum CERT_TRUST_INVALID_NAME_CONSTRAINTS = 0x00000800;
enum CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT = 0x00001000;
enum CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT = 0x00002000;
enum CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT = 0x00004000;
enum CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT = 0x00008000;
enum CERT_TRUST_IS_OFFLINE_REVOCATION = 0x01000000;
enum CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY = 0x02000000;
enum CERT_TRUST_IS_EXPLICIT_DISTRUST = 0x04000000;
enum CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT = 0x08000000;
enum CERT_TRUST_HAS_WEAK_SIGNATURE = 0x00100000;
enum CERT_TRUST_HAS_WEAK_HYGIENE = 0x00200000;
enum CERT_TRUST_IS_PARTIAL_CHAIN = 0x00010000;
enum CERT_TRUST_CTL_IS_NOT_TIME_VALID = 0x00020000;
enum CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID = 0x00040000;
enum CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE = 0x00080000;
enum CERT_TRUST_HAS_EXACT_MATCH_ISSUER = 0x00000001;
enum CERT_TRUST_HAS_KEY_MATCH_ISSUER = 0x00000002;
enum CERT_TRUST_HAS_NAME_MATCH_ISSUER = 0x00000004;
enum CERT_TRUST_IS_SELF_SIGNED = 0x00000008;
enum CERT_TRUST_AUTO_UPDATE_CA_REVOCATION = 0x00000010;
enum CERT_TRUST_AUTO_UPDATE_END_REVOCATION = 0x00000020;
enum CERT_TRUST_NO_OCSP_FAILOVER_TO_CRL = 0x00000040;
enum CERT_TRUST_IS_KEY_ROLLOVER = 0x00000080;
enum CERT_TRUST_SSL_HANDSHAKE_OCSP = 0x00040000;
enum CERT_TRUST_SSL_TIME_VALID_OCSP = 0x00080000;
enum CERT_TRUST_SSL_RECONNECT_OCSP = 0x00100000;
enum CERT_TRUST_HAS_PREFERRED_ISSUER = 0x00000100;
enum CERT_TRUST_HAS_ISSUANCE_CHAIN_POLICY = 0x00000200;
enum CERT_TRUST_HAS_VALID_NAME_CONSTRAINTS = 0x00000400;
enum CERT_TRUST_IS_PEER_TRUSTED = 0x00000800;
enum CERT_TRUST_HAS_CRL_VALIDITY_EXTENDED = 0x00001000;
enum CERT_TRUST_IS_FROM_EXCLUSIVE_TRUST_STORE = 0x00002000;
enum CERT_TRUST_IS_CA_TRUSTED = 0x00004000;
enum CERT_TRUST_HAS_AUTO_UPDATE_WEAK_SIGNATURE = 0x00008000;
enum CERT_TRUST_HAS_ALLOW_WEAK_SIGNATURE = 0x00020000;
enum CERT_TRUST_IS_COMPLEX_CHAIN = 0x00010000;
enum CERT_TRUST_SSL_TIME_VALID = 0x01000000;
enum CERT_TRUST_NO_TIME_CHECK = 0x02000000;
enum USAGE_MATCH_TYPE_AND = 0x00000000;
enum USAGE_MATCH_TYPE_OR = 0x00000001;
enum CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG = 0x00000001;
enum CERT_CHAIN_REVOCATION_CHECK_END_CERT = 0x10000000;
enum CERT_CHAIN_REVOCATION_CHECK_CHAIN = 0x20000000;
enum CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x40000000;
enum CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY = 0x80000000;
enum CERT_CHAIN_REVOCATION_ACCUMULATIVE_TIMEOUT = 0x08000000;
enum CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT = 0x04000000;
enum CERT_CHAIN_DISABLE_PASS1_QUALITY_FILTERING = 0x00000040;
enum CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS = 0x00000080;
enum CERT_CHAIN_DISABLE_AUTH_ROOT_AUTO_UPDATE = 0x00000100;
enum CERT_CHAIN_TIMESTAMP_TIME = 0x00000200;
enum CERT_CHAIN_ENABLE_PEER_TRUST = 0x00000400;
enum CERT_CHAIN_DISABLE_MY_PEER_TRUST = 0x00000800;
enum CERT_CHAIN_DISABLE_MD2_MD4 = 0x00001000;
enum CERT_CHAIN_DISABLE_AIA = 0x00002000;
enum CERT_CHAIN_HAS_MOTW = 0x00004000;
enum CERT_CHAIN_ONLY_ADDITIONAL_AND_AUTH_ROOT = 0x00008000;
enum CERT_CHAIN_OPT_IN_WEAK_SIGNATURE = 0x00010000;
enum REVOCATION_OID_CRL_REVOCATION = 0x00000001;
enum CERT_CHAIN_FIND_BY_ISSUER = 0x00000001;
enum CERT_CHAIN_POLICY_IGNORE_WEAK_SIGNATURE_FLAG = 0x08000000;
enum CRYPT_OID_VERIFY_CERTIFICATE_CHAIN_POLICY_FUNC = "CertDllVerifyCertificateChainPolicy";
enum CERT_CHAIN_POLICY_BASE = 0x00000001;
enum CERT_CHAIN_POLICY_AUTHENTICODE = 0x00000002;
enum CERT_CHAIN_POLICY_AUTHENTICODE_TS = 0x00000003;
enum CERT_CHAIN_POLICY_SSL = 0x00000004;
enum CERT_CHAIN_POLICY_BASIC_CONSTRAINTS = 0x00000005;
enum CERT_CHAIN_POLICY_NT_AUTH = 0x00000006;
enum CERT_CHAIN_POLICY_MICROSOFT_ROOT = 0x00000007;
enum CERT_CHAIN_POLICY_EV = 0x00000008;
enum CERT_CHAIN_POLICY_SSL_F12 = 0x00000009;
enum CERT_CHAIN_POLICY_SSL_HPKP_HEADER = 0x0000000a;
enum CERT_CHAIN_POLICY_THIRD_PARTY_ROOT = 0x0000000b;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN = 0x0000000c;
enum BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_CA_FLAG = 0x80000000;
enum BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_END_ENTITY_FLAG = 0x40000000;
enum MICROSOFT_ROOT_CERT_CHAIN_POLICY_ENABLE_TEST_ROOT_FLAG = 0x00010000;
enum MICROSOFT_ROOT_CERT_CHAIN_POLICY_CHECK_APPLICATION_ROOT_FLAG = 0x00020000;
enum MICROSOFT_ROOT_CERT_CHAIN_POLICY_DISABLE_FLIGHT_ROOT_FLAG = 0x00040000;
enum SSL_F12_ERROR_TEXT_LENGTH = 0x00000100;
enum CERT_CHAIN_POLICY_SSL_F12_SUCCESS_LEVEL = 0x00000000;
enum CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL = 0x00000001;
enum CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL = 0x00000002;
enum CERT_CHAIN_POLICY_SSL_F12_NONE_CATEGORY = 0x00000000;
enum CERT_CHAIN_POLICY_SSL_F12_WEAK_CRYPTO_CATEGORY = 0x00000001;
enum CERT_CHAIN_POLICY_SSL_F12_ROOT_PROGRAM_CATEGORY = 0x00000002;
enum SSL_HPKP_PKP_HEADER_INDEX = 0x00000000;
enum SSL_HPKP_PKP_RO_HEADER_INDEX = 0x00000001;
enum SSL_HPKP_HEADER_COUNT = 0x00000002;
enum SSL_KEY_PIN_ERROR_TEXT_LENGTH = 0x00000200;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_ERROR = 0xfffffffffffffffe;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_ERROR = 0xffffffffffffffff;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN_SUCCESS = 0x00000000;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_WARNING = 0x00000001;
enum CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_WARNING = 0x00000002;
enum CRYPT_STRING_BASE64URI = 0x0000000d;
enum CRYPT_STRING_ENCODEMASK = 0x000000ff;
enum CRYPT_STRING_RESERVED100 = 0x00000100;
enum CRYPT_STRING_RESERVED200 = 0x00000200;
enum CRYPT_STRING_PERCENTESCAPE = 0x08000000;
enum CRYPT_STRING_HASHDATA = 0x10000000;
enum CRYPT_STRING_NOCRLF = 0x40000000;
enum CRYPT_STRING_NOCR = 0x80000000;
enum szOID_PKCS_12_PbeIds = "1.2.840.113549.1.12.1";
enum szOID_PKCS_12_pbeWithSHA1And128BitRC4 = "1.2.840.113549.1.12.1.1";
enum szOID_PKCS_12_pbeWithSHA1And40BitRC4 = "1.2.840.113549.1.12.1.2";
enum szOID_PKCS_12_pbeWithSHA1And3KeyTripleDES = "1.2.840.113549.1.12.1.3";
enum szOID_PKCS_12_pbeWithSHA1And2KeyTripleDES = "1.2.840.113549.1.12.1.4";
enum szOID_PKCS_12_pbeWithSHA1And128BitRC2 = "1.2.840.113549.1.12.1.5";
enum szOID_PKCS_12_pbeWithSHA1And40BitRC2 = "1.2.840.113549.1.12.1.6";
enum szOID_PKCS_5_PBKDF2 = "1.2.840.113549.1.5.12";
enum szOID_PKCS_5_PBES2 = "1.2.840.113549.1.5.13";
enum PKCS12_IMPORT_SILENT = 0x00000040;
enum PKCS12_ONLY_CERTIFICATES = 0x00000400;
enum PKCS12_ONLY_NOT_ENCRYPTED_CERTIFICATES = 0x00000800;
enum PKCS12_VIRTUAL_ISOLATION_KEY = 0x00010000;
enum PKCS12_IMPORT_RESERVED_MASK = 0xffff0000;
enum PKCS12_ONLY_CERTIFICATES_PROVIDER_TYPE = 0x00000000;
enum PKCS12_ONLY_CERTIFICATES_PROVIDER_NAME = "PfxProvider";
enum PKCS12_ONLY_CERTIFICATES_CONTAINER_NAME = "PfxContainer";
enum REPORT_NO_PRIVATE_KEY = 0x00000001;
enum REPORT_NOT_ABLE_TO_EXPORT_PRIVATE_KEY = 0x00000002;
enum EXPORT_PRIVATE_KEYS = 0x00000004;
enum PKCS12_PROTECT_TO_DOMAIN_SIDS = 0x00000020;
enum PKCS12_EXPORT_SILENT = 0x00000040;
enum PKCS12_EXPORT_PBES2_PARAMS = 0x00000080;
enum PKCS12_DISABLE_ENCRYPT_CERTIFICATES = 0x00000100;
enum PKCS12_ENCRYPT_CERTIFICATES = 0x00000200;
enum PKCS12_EXPORT_ECC_CURVE_PARAMETERS = 0x00001000;
enum PKCS12_EXPORT_ECC_CURVE_OID = 0x00002000;
enum PKCS12_EXPORT_RESERVED_MASK = 0xffff0000;
enum PKCS12_PBKDF2_ID_HMAC_SHA1 = "1.2.840.113549.2.7";
enum PKCS12_PBKDF2_ID_HMAC_SHA256 = "1.2.840.113549.2.9";
enum PKCS12_PBKDF2_ID_HMAC_SHA384 = "1.2.840.113549.2.10";
enum PKCS12_PBKDF2_ID_HMAC_SHA512 = "1.2.840.113549.2.11";
enum PKCS12_PBES2_ALG_AES256_SHA256 = "AES256-SHA256";
enum PKCS12_CONFIG_REGPATH = "Software\\Microsoft\\Windows\\CurrentVersion\\PFX";
enum PKCS12_ENCRYPT_CERTIFICATES_VALUE_NAME = "EncryptCertificates";
enum CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_READ_FLAG = 0x00000001;
enum CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_WRITE_FLAG = 0x00000002;
enum CERT_SERVER_OCSP_RESPONSE_ASYNC_FLAG = 0x00000001;
enum CERT_RETRIEVE_ISSUER_LOGO = 0x00000001;
enum CERT_RETRIEVE_SUBJECT_LOGO = 0x00000002;
enum CERT_RETRIEVE_COMMUNITY_LOGO = 0x00000003;
enum CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE = 0x000003e8;
enum CERT_SELECT_MAX_PARA = 0x000001f4;
enum CERT_SELECT_BY_ISSUER_DISPLAYNAME = 0x0000000c;
enum CERT_SELECT_BY_FRIENDLYNAME = 0x0000000d;
enum CERT_SELECT_BY_THUMBPRINT = 0x0000000e;
enum CERT_SELECT_ALLOW_EXPIRED = 0x00000001;
enum CERT_SELECT_TRUSTED_ROOT = 0x00000002;
enum CERT_SELECT_DISALLOW_SELFSIGNED = 0x00000004;
enum CERT_SELECT_HAS_PRIVATE_KEY = 0x00000008;
enum CERT_SELECT_HAS_KEY_FOR_SIGNATURE = 0x00000010;
enum CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE = 0x00000020;
enum CERT_SELECT_HARDWARE_ONLY = 0x00000040;
enum CERT_SELECT_ALLOW_DUPLICATES = 0x00000080;
enum CERT_SELECT_IGNORE_AUTOSELECT = 0x00000100;
enum TIMESTAMP_FAILURE_BAD_ALG = 0x00000000;
enum TIMESTAMP_FAILURE_BAD_REQUEST = 0x00000002;
enum TIMESTAMP_FAILURE_BAD_FORMAT = 0x00000005;
enum TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE = 0x0000000e;
enum TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED = 0x0000000f;
enum TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED = 0x00000010;
enum TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE = 0x00000011;
enum TIMESTAMP_FAILURE_SYSTEM_FAILURE = 0x00000019;
enum TIMESTAMP_DONT_HASH_DATA = 0x00000001;
enum TIMESTAMP_VERIFY_CONTEXT_SIGNATURE = 0x00000020;
enum TIMESTAMP_NO_AUTH_RETRIEVAL = 0x00020000;
enum CRYPT_OBJECT_LOCATOR_SPN_NAME_TYPE = 0x00000001;
enum CRYPT_OBJECT_LOCATOR_LAST_RESERVED_NAME_TYPE = 0x00000020;
enum CRYPT_OBJECT_LOCATOR_FIRST_RESERVED_USER_NAME_TYPE = 0x00000021;
enum CRYPT_OBJECT_LOCATOR_LAST_RESERVED_USER_NAME_TYPE = 0x0000ffff;
enum SSL_OBJECT_LOCATOR_PFX_FUNC = "SslObjectLocatorInitializePfx";
enum SSL_OBJECT_LOCATOR_ISSUER_LIST_FUNC = "SslObjectLocatorInitializeIssuerList";
enum SSL_OBJECT_LOCATOR_CERT_VALIDATION_CONFIG_FUNC = "SslObjectLocatorInitializeCertValidationConfig";
enum CERT_FILE_HASH_USE_TYPE = 0x00000001;
enum CERT_TIMESTAMP_HASH_USE_TYPE = 0x00000002;
enum RECIPIENTPOLICYV1 = 0x00000001;
enum RECIPIENTPOLICYV2 = 0x00000002;
enum E_ICARD_COMMUNICATION = 0xffffffffc0050100;
enum E_ICARD_DATA_ACCESS = 0xffffffffc0050101;
enum E_ICARD_EXPORT = 0xffffffffc0050102;
enum E_ICARD_IDENTITY = 0xffffffffc0050103;
enum E_ICARD_IMPORT = 0xffffffffc0050104;
enum E_ICARD_ARGUMENT = 0xffffffffc0050105;
enum E_ICARD_REQUEST = 0xffffffffc0050106;
enum E_ICARD_INFORMATIONCARD = 0xffffffffc0050107;
enum E_ICARD_STOREKEY = 0xffffffffc0050108;
enum E_ICARD_LOGOVALIDATION = 0xffffffffc0050109;
enum E_ICARD_PASSWORDVALIDATION = 0xffffffffc005010a;
enum E_ICARD_POLICY = 0xffffffffc005010b;
enum E_ICARD_PROCESSDIED = 0xffffffffc005010c;
enum E_ICARD_SERVICEBUSY = 0xffffffffc005010d;
enum E_ICARD_SERVICE = 0xffffffffc005010e;
enum E_ICARD_SHUTTINGDOWN = 0xffffffffc005010f;
enum E_ICARD_TOKENCREATION = 0xffffffffc0050110;
enum E_ICARD_TRUSTEXCHANGE = 0xffffffffc0050111;
enum E_ICARD_UNTRUSTED = 0xffffffffc0050112;
enum E_ICARD_USERCANCELLED = 0xffffffffc0050113;
enum E_ICARD_STORE_IMPORT = 0xffffffffc0050114;
enum E_ICARD_FAIL = 0xffffffffc0050115;
enum E_ICARD_UI_INITIALIZATION = 0xffffffffc005011a;
enum E_ICARD_REFRESH_REQUIRED = 0xffffffffc0050180;
enum E_ICARD_MISSING_APPLIESTO = 0xffffffffc0050181;
enum E_ICARD_INVALID_PROOF_KEY = 0xffffffffc0050182;
enum E_ICARD_UNKNOWN_REFERENCE = 0xffffffffc0050183;
enum E_ICARD_FAILED_REQUIRED_CLAIMS = 0xffffffffc0050184;
enum AUDIT_CARD_WRITTEN = 0x40050200;
enum AUDIT_CARD_DELETE = 0x40050201;
enum AUDIT_CARD_IMPORT = 0x40050202;
enum AUDIT_STORE_IMPORT = 0x40050203;
enum AUDIT_STORE_EXPORT = 0x40050204;
enum AUDIT_STORE_DELETE = 0x40050205;
enum AUDIT_SERVICE_IDLE_STOP = 0x40050206;
alias HCRYPTASYNC = void*;
alias HCERTCHAINENGINE = void*;
alias BCRYPT_ALG_HANDLE = long;
alias BCRYPT_KEY_HANDLE = long;
alias BCRYPT_HASH_HANDLE = long;
alias BCRYPT_SECRET_HANDLE = long;
alias BCRYPT_HANDLE = long;
alias NCRYPT_HANDLE = ulong;
alias NCRYPT_PROV_HANDLE = ulong;
alias NCRYPT_KEY_HANDLE = ulong;
alias NCRYPT_HASH_HANDLE = ulong;
alias NCRYPT_SECRET_HANDLE = ulong;
alias HCRYPTPROV_LEGACY = void*;
alias HCRYPTPROV_OR_NCRYPT_KEY_HANDLE = void*;
alias HCERTSTORE = void*;
alias HCERTSTOREPROV = void*;
struct CMS_KEY_INFO
{
    uint dwVersion;
    uint Algid;
    ubyte* pbOID;
    uint cbOID;
}
struct HMAC_INFO
{
    uint HashAlgid;
    ubyte* pbInnerString;
    uint cbInnerString;
    ubyte* pbOuterString;
    uint cbOuterString;
}
struct SCHANNEL_ALG
{
    uint dwUse;
    uint Algid;
    uint cBits;
    uint dwFlags;
    uint dwReserved;
}
struct PROV_ENUMALGS
{
    uint aiAlgid;
    uint dwBitLen;
    uint dwNameLen;
    CHAR[20] szName;
}
struct PROV_ENUMALGS_EX
{
    uint aiAlgid;
    uint dwDefaultLen;
    uint dwMinLen;
    uint dwMaxLen;
    uint dwProtocols;
    uint dwNameLen;
    CHAR[20] szName;
    uint dwLongNameLen;
    CHAR[40] szLongName;
}
struct PUBLICKEYSTRUC
{
    ubyte bType;
    ubyte bVersion;
    ushort reserved;
    uint aiKeyAlg;
}
struct RSAPUBKEY
{
    uint magic;
    uint bitlen;
    uint pubexp;
}
struct PUBKEY
{
    uint magic;
    uint bitlen;
}
struct DSSSEED
{
    uint counter;
    ubyte[20] seed;
}
struct PUBKEYVER3
{
    uint magic;
    uint bitlenP;
    uint bitlenQ;
    uint bitlenJ;
    DSSSEED DSSSeed;
}
struct PRIVKEYVER3
{
    uint magic;
    uint bitlenP;
    uint bitlenQ;
    uint bitlenJ;
    uint bitlenX;
    DSSSEED DSSSeed;
}
struct KEY_TYPE_SUBTYPE
{
    uint dwKeySpec;
    GUID Type;
    GUID Subtype;
}
struct CERT_FORTEZZA_DATA_PROP
{
    ubyte[8] SerialNumber;
    int CertIndex;
    ubyte[36] CertLabel;
}
struct CRYPT_RC4_KEY_STATE
{
    ubyte[16] Key;
    ubyte[256] SBox;
    ubyte i;
    ubyte j;
}
struct CRYPT_DES_KEY_STATE
{
    ubyte[8] Key;
    ubyte[8] IV;
    ubyte[8] Feedback;
}
struct CRYPT_3DES_KEY_STATE
{
    ubyte[24] Key;
    ubyte[8] IV;
    ubyte[8] Feedback;
}
struct CRYPT_AES_128_KEY_STATE
{
    ubyte[16] Key;
    ubyte[16] IV;
    ubyte[176] EncryptionState;
    ubyte[176] DecryptionState;
    ubyte[16] Feedback;
}
struct CRYPT_AES_256_KEY_STATE
{
    ubyte[32] Key;
    ubyte[16] IV;
    ubyte[240] EncryptionState;
    ubyte[240] DecryptionState;
    ubyte[16] Feedback;
}
struct CRYPT_INTEGER_BLOB
{
    uint cbData;
    ubyte* pbData;
}
struct CMS_DH_KEY_INFO
{
    uint dwVersion;
    uint Algid;
    PSTR pszContentEncObjId;
    CRYPT_INTEGER_BLOB PubInfo;
    void* pReserved;
}
struct BCRYPT_KEY_LENGTHS_STRUCT
{
    uint dwMinLength;
    uint dwMaxLength;
    uint dwIncrement;
}
struct BCRYPT_OID
{
    uint cbOID;
    ubyte* pbOID;
}
struct BCRYPT_OID_LIST
{
    uint dwOIDCount;
    BCRYPT_OID* pOIDs;
}
struct BCRYPT_PKCS1_PADDING_INFO
{
    const(wchar)* pszAlgId;
}
struct BCRYPT_PSS_PADDING_INFO
{
    const(wchar)* pszAlgId;
    uint cbSalt;
}
struct BCRYPT_OAEP_PADDING_INFO
{
    const(wchar)* pszAlgId;
    ubyte* pbLabel;
    uint cbLabel;
}
struct BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO
{
    uint cbSize;
    uint dwInfoVersion;
    ubyte* pbNonce;
    uint cbNonce;
    ubyte* pbAuthData;
    uint cbAuthData;
    ubyte* pbTag;
    uint cbTag;
    ubyte* pbMacContext;
    uint cbMacContext;
    uint cbAAD;
    ulong cbData;
    uint dwFlags;
}
struct BCryptBuffer
{
    uint cbBuffer;
    uint BufferType;
    void* pvBuffer;
}
struct BCryptBufferDesc
{
    uint ulVersion;
    uint cBuffers;
    BCryptBuffer* pBuffers;
}
struct BCRYPT_KEY_BLOB
{
    uint Magic;
}
struct BCRYPT_RSAKEY_BLOB
{
    BCRYPT_RSAKEY_BLOB_MAGIC Magic;
    uint BitLength;
    uint cbPublicExp;
    uint cbModulus;
    uint cbPrime1;
    uint cbPrime2;
}
struct BCRYPT_ECCKEY_BLOB
{
    uint dwMagic;
    uint cbKey;
}
struct SSL_ECCKEY_BLOB
{
    uint dwCurveType;
    uint cbKey;
}
alias ECC_CURVE_TYPE_ENUM = int;
enum : int
{
    BCRYPT_ECC_PRIME_SHORT_WEIERSTRASS_CURVE = 0x00000001,
    BCRYPT_ECC_PRIME_TWISTED_EDWARDS_CURVE   = 0x00000002,
    BCRYPT_ECC_PRIME_MONTGOMERY_CURVE        = 0x00000003,
}

alias ECC_CURVE_ALG_ID_ENUM = int;
enum : int
{
    BCRYPT_NO_CURVE_GENERATION_ALG_ID = 0x00000000,
}

struct BCRYPT_ECCFULLKEY_BLOB
{
    uint dwMagic;
    uint dwVersion;
    ECC_CURVE_TYPE_ENUM dwCurveType;
    ECC_CURVE_ALG_ID_ENUM dwCurveGenerationAlgId;
    uint cbFieldLength;
    uint cbSubgroupOrder;
    uint cbCofactor;
    uint cbSeed;
}
struct BCRYPT_DH_KEY_BLOB
{
    BCRYPT_DH_KEY_BLOB_MAGIC dwMagic;
    uint cbKey;
}
struct BCRYPT_DH_PARAMETER_HEADER
{
    uint cbLength;
    uint dwMagic;
    uint cbKeyLength;
}
struct BCRYPT_DSA_KEY_BLOB
{
    BCRYPT_DSA_MAGIC dwMagic;
    uint cbKey;
    ubyte[4] Count;
    ubyte[20] Seed;
    ubyte[20] q;
}
alias HASHALGORITHM_ENUM = int;
enum : int
{
    DSA_HASH_ALGORITHM_SHA1   = 0x00000000,
    DSA_HASH_ALGORITHM_SHA256 = 0x00000001,
    DSA_HASH_ALGORITHM_SHA512 = 0x00000002,
}

alias DSAFIPSVERSION_ENUM = int;
enum : int
{
    DSA_FIPS186_2 = 0x00000000,
    DSA_FIPS186_3 = 0x00000001,
}

struct BCRYPT_DSA_KEY_BLOB_V2
{
    BCRYPT_DSA_MAGIC dwMagic;
    uint cbKey;
    HASHALGORITHM_ENUM hashAlgorithm;
    DSAFIPSVERSION_ENUM standardVersion;
    uint cbSeedLength;
    uint cbGroupSize;
    ubyte[4] Count;
}
struct BCRYPT_KEY_DATA_BLOB_HEADER
{
    uint dwMagic;
    uint dwVersion;
    uint cbKeyData;
}
struct BCRYPT_DSA_PARAMETER_HEADER
{
    uint cbLength;
    uint dwMagic;
    uint cbKeyLength;
    ubyte[4] Count;
    ubyte[20] Seed;
    ubyte[20] q;
}
struct BCRYPT_DSA_PARAMETER_HEADER_V2
{
    uint cbLength;
    uint dwMagic;
    uint cbKeyLength;
    HASHALGORITHM_ENUM hashAlgorithm;
    DSAFIPSVERSION_ENUM standardVersion;
    uint cbSeedLength;
    uint cbGroupSize;
    ubyte[4] Count;
}
struct BCRYPT_ECC_CURVE_NAMES
{
    uint dwEccCurveNames;
    PWSTR* pEccCurveNames;
}
alias BCRYPT_HASH_OPERATION_TYPE = int;
enum : int
{
    BCRYPT_HASH_OPERATION_HASH_DATA   = 0x00000001,
    BCRYPT_HASH_OPERATION_FINISH_HASH = 0x00000002,
}

struct BCRYPT_MULTI_HASH_OPERATION
{
    uint iHash;
    BCRYPT_HASH_OPERATION_TYPE hashOperation;
    ubyte* pbBuffer;
    uint cbBuffer;
}
alias BCRYPT_MULTI_OPERATION_TYPE = int;
enum : int
{
    BCRYPT_OPERATION_TYPE_HASH = 0x00000001,
}

struct BCRYPT_MULTI_OBJECT_LENGTH_STRUCT
{
    uint cbPerObject;
    uint cbPerElement;
}
struct BCRYPT_ALGORITHM_IDENTIFIER
{
    PWSTR pszName;
    uint dwClass;
    uint dwFlags;
}
struct BCRYPT_PROVIDER_NAME
{
    PWSTR pszProviderName;
}
struct BCRYPT_INTERFACE_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
}
struct CRYPT_INTERFACE_REG
{
    BCRYPT_INTERFACE dwInterface;
    BCRYPT_TABLE dwFlags;
    uint cFunctions;
    PWSTR* rgpszFunctions;
}
struct CRYPT_IMAGE_REG
{
    PWSTR pszImage;
    uint cInterfaces;
    CRYPT_INTERFACE_REG** rgpInterfaces;
}
struct CRYPT_PROVIDER_REG
{
    uint cAliases;
    PWSTR* rgpszAliases;
    CRYPT_IMAGE_REG* pUM;
    CRYPT_IMAGE_REG* pKM;
}
struct CRYPT_PROVIDERS
{
    uint cProviders;
    PWSTR* rgpszProviders;
}
struct CRYPT_CONTEXT_CONFIG
{
    CRYPT_CONTEXT_CONFIG_FLAGS dwFlags;
    uint dwReserved;
}
struct CRYPT_CONTEXT_FUNCTION_CONFIG
{
    uint dwFlags;
    uint dwReserved;
}
struct CRYPT_CONTEXTS
{
    uint cContexts;
    PWSTR* rgpszContexts;
}
struct CRYPT_CONTEXT_FUNCTIONS
{
    uint cFunctions;
    PWSTR* rgpszFunctions;
}
struct CRYPT_CONTEXT_FUNCTION_PROVIDERS
{
    uint cProviders;
    PWSTR* rgpszProviders;
}
struct CRYPT_PROPERTY_REF
{
    PWSTR pszProperty;
    uint cbValue;
    ubyte* pbValue;
}
struct CRYPT_IMAGE_REF
{
    PWSTR pszImage;
    CRYPT_IMAGE_REF_FLAGS dwFlags;
}
struct CRYPT_PROVIDER_REF
{
    uint dwInterface;
    PWSTR pszFunction;
    PWSTR pszProvider;
    uint cProperties;
    CRYPT_PROPERTY_REF** rgpProperties;
    CRYPT_IMAGE_REF* pUM;
    CRYPT_IMAGE_REF* pKM;
}
struct CRYPT_PROVIDER_REFS
{
    uint cProviders;
    CRYPT_PROVIDER_REF** rgpProviders;
}
alias PFN_NCRYPT_ALLOC = void* function(ulong);
alias PFN_NCRYPT_FREE = void function(void*);
struct NCRYPT_ALLOC_PARA
{
    uint cbSize;
    PFN_NCRYPT_ALLOC pfnAlloc;
    PFN_NCRYPT_FREE pfnFree;
}
struct NCRYPT_CIPHER_PADDING_INFO
{
    uint cbSize;
    uint dwFlags;
    ubyte* pbIV;
    uint cbIV;
    ubyte* pbOtherInfo;
    uint cbOtherInfo;
}
struct NCRYPT_PLATFORM_ATTEST_PADDING_INFO
{
    uint magic;
    uint pcrMask;
}
struct NCRYPT_KEY_ATTEST_PADDING_INFO
{
    uint magic;
    ubyte* pbKeyBlob;
    uint cbKeyBlob;
    ubyte* pbKeyAuth;
    uint cbKeyAuth;
}
struct NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES
{
    uint Version;
    uint Flags;
    uint cbPublicKeyBlob;
}
struct NCRYPT_VSM_KEY_ATTESTATION_STATEMENT
{
    uint Magic;
    uint Version;
    uint cbSignature;
    uint cbReport;
    uint cbAttributes;
}
struct NCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS
{
    uint Version;
    ulong TrustletId;
    uint MinSvn;
    uint FlagsMask;
    uint FlagsExpected;
    uint _bitfield0;
}
struct NCRYPT_EXPORTED_ISOLATED_KEY_HEADER
{
    uint Version;
    uint KeyUsage;
    uint _bitfield0;
    uint cbAlgName;
    uint cbNonce;
    uint cbAuthTag;
    uint cbWrappingKey;
    uint cbIsolatedKey;
}
struct NCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE
{
    NCRYPT_EXPORTED_ISOLATED_KEY_HEADER Header;
}
struct NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT
{
    uint Magic;
    uint Version;
    uint HeaderSize;
    uint cbCertifyInfo;
    uint cbSignature;
    uint cbTpmPublic;
}
struct NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT
{
    uint Magic;
    uint Version;
    uint pcrAlg;
    uint cbSignature;
    uint cbQuote;
    uint cbPcrs;
}
struct NCryptAlgorithmName
{
    PWSTR pszName;
    NCRYPT_ALGORITHM_NAME_CLASS dwClass;
    NCRYPT_OPERATION dwAlgOperations;
    uint dwFlags;
}
struct NCryptKeyName
{
    PWSTR pszName;
    PWSTR pszAlgid;
    CERT_KEY_SPEC dwLegacyKeySpec;
    uint dwFlags;
}
struct NCryptProviderName
{
    PWSTR pszName;
    PWSTR pszComment;
}
struct NCRYPT_UI_POLICY
{
    uint dwVersion;
    uint dwFlags;
    const(wchar)* pszCreationTitle;
    const(wchar)* pszFriendlyName;
    const(wchar)* pszDescription;
}
struct NCRYPT_KEY_ACCESS_POLICY_BLOB
{
    uint dwVersion;
    uint dwPolicyFlags;
    uint cbUserSid;
    uint cbApplicationSid;
}
struct NCRYPT_SUPPORTED_LENGTHS
{
    uint dwMinLength;
    uint dwMaxLength;
    uint dwIncrement;
    uint dwDefaultLength;
}
struct NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO
{
    uint dwVersion;
    int iExpiration;
    ubyte[32] pabNonce;
    ubyte[32] pabPolicyRef;
    ubyte[32] pabHMAC;
}
struct NCRYPT_PCP_TPM_FW_VERSION_INFO
{
    ushort major1;
    ushort major2;
    ushort minor1;
    ushort minor2;
}
struct NCRYPT_PCP_RAW_POLICYDIGEST_INFO
{
    uint dwVersion;
    uint cbDigest;
}
struct NCRYPT_KEY_BLOB_HEADER
{
    uint cbSize;
    uint dwMagic;
    uint cbAlgName;
    uint cbKeyData;
}
struct NCRYPT_TPM_LOADABLE_KEY_BLOB_HEADER
{
    uint magic;
    uint cbHeader;
    uint cbPublic;
    uint cbPrivate;
    uint cbName;
}
struct CRYPT_BIT_BLOB
{
    uint cbData;
    ubyte* pbData;
    uint cUnusedBits;
}
struct CRYPT_ALGORITHM_IDENTIFIER
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Parameters;
}
struct CRYPT_OBJID_TABLE
{
    uint dwAlgId;
    const(char)* pszObjId;
}
struct CRYPT_HASH_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_INTEGER_BLOB Hash;
}
struct CERT_EXTENSION
{
    PSTR pszObjId;
    BOOL fCritical;
    CRYPT_INTEGER_BLOB Value;
}
struct CRYPT_ATTRIBUTE_TYPE_VALUE
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Value;
}
struct CRYPT_ATTRIBUTE
{
    PSTR pszObjId;
    uint cValue;
    CRYPT_INTEGER_BLOB* rgValue;
}
struct CRYPT_ATTRIBUTES
{
    uint cAttr;
    CRYPT_ATTRIBUTE* rgAttr;
}
struct CERT_RDN_ATTR
{
    PSTR pszObjId;
    CERT_RDN_ATTR_VALUE_TYPE dwValueType;
    CRYPT_INTEGER_BLOB Value;
}
struct CERT_RDN
{
    uint cRDNAttr;
    CERT_RDN_ATTR* rgRDNAttr;
}
struct CERT_NAME_INFO
{
    uint cRDN;
    CERT_RDN* rgRDN;
}
struct CERT_NAME_VALUE
{
    uint dwValueType;
    CRYPT_INTEGER_BLOB Value;
}
struct CERT_PUBLIC_KEY_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER Algorithm;
    CRYPT_BIT_BLOB PublicKey;
}
struct CRYPT_ECC_PRIVATE_KEY_INFO
{
    uint dwVersion;
    CRYPT_INTEGER_BLOB PrivateKey;
    PSTR szCurveOid;
    CRYPT_BIT_BLOB PublicKey;
}
struct CRYPT_PRIVATE_KEY_INFO
{
    uint Version;
    CRYPT_ALGORITHM_IDENTIFIER Algorithm;
    CRYPT_INTEGER_BLOB PrivateKey;
    CRYPT_ATTRIBUTES* pAttributes;
}
struct CRYPT_ENCRYPTED_PRIVATE_KEY_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER EncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedPrivateKey;
}
alias PCRYPT_DECRYPT_PRIVATE_KEY_FUNC = BOOL function(CRYPT_ALGORITHM_IDENTIFIER, CRYPT_INTEGER_BLOB, ubyte*, uint*, void*);
alias PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC = BOOL function(CRYPT_ALGORITHM_IDENTIFIER*, CRYPT_INTEGER_BLOB*, ubyte*, uint*, void*);
alias PCRYPT_RESOLVE_HCRYPTPROV_FUNC = BOOL function(CRYPT_PRIVATE_KEY_INFO*, ulong*, void*);
struct CRYPT_PKCS8_IMPORT_PARAMS
{
    CRYPT_INTEGER_BLOB PrivateKey;
    PCRYPT_RESOLVE_HCRYPTPROV_FUNC pResolvehCryptProvFunc;
    void* pVoidResolveFunc;
    PCRYPT_DECRYPT_PRIVATE_KEY_FUNC pDecryptPrivateKeyFunc;
    void* pVoidDecryptFunc;
}
struct CRYPT_PKCS8_EXPORT_PARAMS
{
    ulong hCryptProv;
    uint dwKeySpec;
    PSTR pszPrivateKeyObjId;
    PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC pEncryptPrivateKeyFunc;
    void* pVoidEncryptFunc;
}
struct CERT_INFO
{
    uint dwVersion;
    CRYPT_INTEGER_BLOB SerialNumber;
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CRYPT_INTEGER_BLOB Issuer;
    FILETIME NotBefore;
    FILETIME NotAfter;
    CRYPT_INTEGER_BLOB Subject;
    CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
    CRYPT_BIT_BLOB IssuerUniqueId;
    CRYPT_BIT_BLOB SubjectUniqueId;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CRL_ENTRY
{
    CRYPT_INTEGER_BLOB SerialNumber;
    FILETIME RevocationDate;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CRL_INFO
{
    uint dwVersion;
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CRYPT_INTEGER_BLOB Issuer;
    FILETIME ThisUpdate;
    FILETIME NextUpdate;
    uint cCRLEntry;
    CRL_ENTRY* rgCRLEntry;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CERT_OR_CRL_BLOB
{
    uint dwChoice;
    uint cbEncoded;
    ubyte* pbEncoded;
}
struct CERT_OR_CRL_BUNDLE
{
    uint cItem;
    CERT_OR_CRL_BLOB* rgItem;
}
struct CERT_REQUEST_INFO
{
    uint dwVersion;
    CRYPT_INTEGER_BLOB Subject;
    CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
    uint cAttribute;
    CRYPT_ATTRIBUTE* rgAttribute;
}
struct CERT_KEYGEN_REQUEST_INFO
{
    uint dwVersion;
    CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
    PWSTR pwszChallengeString;
}
struct CERT_SIGNED_CONTENT_INFO
{
    CRYPT_INTEGER_BLOB ToBeSigned;
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CRYPT_BIT_BLOB Signature;
}
struct CTL_USAGE
{
    uint cUsageIdentifier;
    PSTR* rgpszUsageIdentifier;
}
struct CTL_ENTRY
{
    CRYPT_INTEGER_BLOB SubjectIdentifier;
    uint cAttribute;
    CRYPT_ATTRIBUTE* rgAttribute;
}
struct CTL_INFO
{
    uint dwVersion;
    CTL_USAGE SubjectUsage;
    CRYPT_INTEGER_BLOB ListIdentifier;
    CRYPT_INTEGER_BLOB SequenceNumber;
    FILETIME ThisUpdate;
    FILETIME NextUpdate;
    CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm;
    uint cCTLEntry;
    CTL_ENTRY* rgCTLEntry;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CRYPT_TIME_STAMP_REQUEST_INFO
{
    PSTR pszTimeStampAlgorithm;
    PSTR pszContentType;
    CRYPT_INTEGER_BLOB Content;
    uint cAttribute;
    CRYPT_ATTRIBUTE* rgAttribute;
}
struct CRYPT_ENROLLMENT_NAME_VALUE_PAIR
{
    PWSTR pwszName;
    PWSTR pwszValue;
}
struct CRYPT_CSP_PROVIDER
{
    uint dwKeySpec;
    PWSTR pwszProviderName;
    CRYPT_BIT_BLOB Signature;
}
alias PFN_CRYPT_ALLOC = void* function(ulong);
alias PFN_CRYPT_FREE = void function(void*);
struct CRYPT_ENCODE_PARA
{
    uint cbSize;
    PFN_CRYPT_ALLOC pfnAlloc;
    PFN_CRYPT_FREE pfnFree;
}
struct CRYPT_DECODE_PARA
{
    uint cbSize;
    PFN_CRYPT_ALLOC pfnAlloc;
    PFN_CRYPT_FREE pfnFree;
}
struct CERT_EXTENSIONS
{
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CERT_AUTHORITY_KEY_ID_INFO
{
    CRYPT_INTEGER_BLOB KeyId;
    CRYPT_INTEGER_BLOB CertIssuer;
    CRYPT_INTEGER_BLOB CertSerialNumber;
}
struct CERT_PRIVATE_KEY_VALIDITY
{
    FILETIME NotBefore;
    FILETIME NotAfter;
}
struct CERT_KEY_ATTRIBUTES_INFO
{
    CRYPT_INTEGER_BLOB KeyId;
    CRYPT_BIT_BLOB IntendedKeyUsage;
    CERT_PRIVATE_KEY_VALIDITY* pPrivateKeyUsagePeriod;
}
struct CERT_POLICY_ID
{
    uint cCertPolicyElementId;
    PSTR* rgpszCertPolicyElementId;
}
struct CERT_KEY_USAGE_RESTRICTION_INFO
{
    uint cCertPolicyId;
    CERT_POLICY_ID* rgCertPolicyId;
    CRYPT_BIT_BLOB RestrictedKeyUsage;
}
struct CERT_OTHER_NAME
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Value;
}
struct CERT_ALT_NAME_ENTRY
{
    uint dwAltNameChoice;
    union
    {
        CERT_OTHER_NAME* pOtherName;
        PWSTR pwszRfc822Name;
        PWSTR pwszDNSName;
        CRYPT_INTEGER_BLOB DirectoryName;
        PWSTR pwszURL;
        CRYPT_INTEGER_BLOB IPAddress;
        PSTR pszRegisteredID;
    }
}
struct CERT_ALT_NAME_INFO
{
    uint cAltEntry;
    CERT_ALT_NAME_ENTRY* rgAltEntry;
}
struct CERT_BASIC_CONSTRAINTS_INFO
{
    CRYPT_BIT_BLOB SubjectType;
    BOOL fPathLenConstraint;
    uint dwPathLenConstraint;
    uint cSubtreesConstraint;
    CRYPT_INTEGER_BLOB* rgSubtreesConstraint;
}
struct CERT_BASIC_CONSTRAINTS2_INFO
{
    BOOL fCA;
    BOOL fPathLenConstraint;
    uint dwPathLenConstraint;
}
struct CERT_POLICY_QUALIFIER_INFO
{
    PSTR pszPolicyQualifierId;
    CRYPT_INTEGER_BLOB Qualifier;
}
struct CERT_POLICY_INFO
{
    PSTR pszPolicyIdentifier;
    uint cPolicyQualifier;
    CERT_POLICY_QUALIFIER_INFO* rgPolicyQualifier;
}
struct CERT_POLICIES_INFO
{
    uint cPolicyInfo;
    CERT_POLICY_INFO* rgPolicyInfo;
}
struct CERT_POLICY_QUALIFIER_NOTICE_REFERENCE
{
    PSTR pszOrganization;
    uint cNoticeNumbers;
    int* rgNoticeNumbers;
}
struct CERT_POLICY_QUALIFIER_USER_NOTICE
{
    CERT_POLICY_QUALIFIER_NOTICE_REFERENCE* pNoticeReference;
    PWSTR pszDisplayText;
}
struct CPS_URLS
{
    PWSTR pszURL;
    CRYPT_ALGORITHM_IDENTIFIER* pAlgorithm;
    CRYPT_INTEGER_BLOB* pDigest;
}
struct CERT_POLICY95_QUALIFIER1
{
    PWSTR pszPracticesReference;
    PSTR pszNoticeIdentifier;
    PSTR pszNSINoticeIdentifier;
    uint cCPSURLs;
    CPS_URLS* rgCPSURLs;
}
struct CERT_POLICY_MAPPING
{
    PSTR pszIssuerDomainPolicy;
    PSTR pszSubjectDomainPolicy;
}
struct CERT_POLICY_MAPPINGS_INFO
{
    uint cPolicyMapping;
    CERT_POLICY_MAPPING* rgPolicyMapping;
}
struct CERT_POLICY_CONSTRAINTS_INFO
{
    BOOL fRequireExplicitPolicy;
    uint dwRequireExplicitPolicySkipCerts;
    BOOL fInhibitPolicyMapping;
    uint dwInhibitPolicyMappingSkipCerts;
}
struct CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY
{
    PSTR pszObjId;
    uint cValue;
    CRYPT_INTEGER_BLOB* rgValue;
}
struct CRYPT_CONTENT_INFO
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Content;
}
struct CRYPT_SEQUENCE_OF_ANY
{
    uint cValue;
    CRYPT_INTEGER_BLOB* rgValue;
}
struct CERT_AUTHORITY_KEY_ID2_INFO
{
    CRYPT_INTEGER_BLOB KeyId;
    CERT_ALT_NAME_INFO AuthorityCertIssuer;
    CRYPT_INTEGER_BLOB AuthorityCertSerialNumber;
}
struct CERT_ACCESS_DESCRIPTION
{
    PSTR pszAccessMethod;
    CERT_ALT_NAME_ENTRY AccessLocation;
}
struct CERT_AUTHORITY_INFO_ACCESS
{
    uint cAccDescr;
    CERT_ACCESS_DESCRIPTION* rgAccDescr;
}
struct CRL_DIST_POINT_NAME
{
    uint dwDistPointNameChoice;
    union
    {
        CERT_ALT_NAME_INFO FullName;
    }
}
struct CRL_DIST_POINT
{
    CRL_DIST_POINT_NAME DistPointName;
    CRYPT_BIT_BLOB ReasonFlags;
    CERT_ALT_NAME_INFO CRLIssuer;
}
struct CRL_DIST_POINTS_INFO
{
    uint cDistPoint;
    CRL_DIST_POINT* rgDistPoint;
}
struct CROSS_CERT_DIST_POINTS_INFO
{
    uint dwSyncDeltaTime;
    uint cDistPoint;
    CERT_ALT_NAME_INFO* rgDistPoint;
}
struct CERT_PAIR
{
    CRYPT_INTEGER_BLOB Forward;
    CRYPT_INTEGER_BLOB Reverse;
}
struct CRL_ISSUING_DIST_POINT
{
    CRL_DIST_POINT_NAME DistPointName;
    BOOL fOnlyContainsUserCerts;
    BOOL fOnlyContainsCACerts;
    CRYPT_BIT_BLOB OnlySomeReasonFlags;
    BOOL fIndirectCRL;
}
struct CERT_GENERAL_SUBTREE
{
    CERT_ALT_NAME_ENTRY Base;
    uint dwMinimum;
    BOOL fMaximum;
    uint dwMaximum;
}
struct CERT_NAME_CONSTRAINTS_INFO
{
    uint cPermittedSubtree;
    CERT_GENERAL_SUBTREE* rgPermittedSubtree;
    uint cExcludedSubtree;
    CERT_GENERAL_SUBTREE* rgExcludedSubtree;
}
struct CERT_DSS_PARAMETERS
{
    CRYPT_INTEGER_BLOB p;
    CRYPT_INTEGER_BLOB q;
    CRYPT_INTEGER_BLOB g;
}
struct CERT_DH_PARAMETERS
{
    CRYPT_INTEGER_BLOB p;
    CRYPT_INTEGER_BLOB g;
}
struct CERT_ECC_SIGNATURE
{
    CRYPT_INTEGER_BLOB r;
    CRYPT_INTEGER_BLOB s;
}
struct CERT_X942_DH_VALIDATION_PARAMS
{
    CRYPT_BIT_BLOB seed;
    uint pgenCounter;
}
struct CERT_X942_DH_PARAMETERS
{
    CRYPT_INTEGER_BLOB p;
    CRYPT_INTEGER_BLOB g;
    CRYPT_INTEGER_BLOB q;
    CRYPT_INTEGER_BLOB j;
    CERT_X942_DH_VALIDATION_PARAMS* pValidationParams;
}
struct CRYPT_X942_OTHER_INFO
{
    PSTR pszContentEncryptionObjId;
    ubyte[4] rgbCounter;
    ubyte[4] rgbKeyLength;
    CRYPT_INTEGER_BLOB PubInfo;
}
struct CRYPT_ECC_CMS_SHARED_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER Algorithm;
    CRYPT_INTEGER_BLOB EntityUInfo;
    ubyte[4] rgbSuppPubInfo;
}
struct CRYPT_RC2_CBC_PARAMETERS
{
    uint dwVersion;
    BOOL fIV;
    ubyte[8] rgbIV;
}
struct CRYPT_SMIME_CAPABILITY
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Parameters;
}
struct CRYPT_SMIME_CAPABILITIES
{
    uint cCapability;
    CRYPT_SMIME_CAPABILITY* rgCapability;
}
struct CERT_QC_STATEMENT
{
    PSTR pszStatementId;
    CRYPT_INTEGER_BLOB StatementInfo;
}
struct CERT_QC_STATEMENTS_EXT_INFO
{
    uint cStatement;
    CERT_QC_STATEMENT* rgStatement;
}
struct CRYPT_MASK_GEN_ALGORITHM
{
    PSTR pszObjId;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
}
struct CRYPT_RSA_SSA_PSS_PARAMETERS
{
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_MASK_GEN_ALGORITHM MaskGenAlgorithm;
    uint dwSaltLength;
    uint dwTrailerField;
}
struct CRYPT_PSOURCE_ALGORITHM
{
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB EncodingParameters;
}
struct CRYPT_RSAES_OAEP_PARAMETERS
{
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_MASK_GEN_ALGORITHM MaskGenAlgorithm;
    CRYPT_PSOURCE_ALGORITHM PSourceAlgorithm;
}
struct CMC_TAGGED_ATTRIBUTE
{
    uint dwBodyPartID;
    CRYPT_ATTRIBUTE Attribute;
}
struct CMC_TAGGED_CERT_REQUEST
{
    uint dwBodyPartID;
    CRYPT_INTEGER_BLOB SignedCertRequest;
}
struct CMC_TAGGED_REQUEST
{
    uint dwTaggedRequestChoice;
    union
    {
        CMC_TAGGED_CERT_REQUEST* pTaggedCertRequest;
    }
}
struct CMC_TAGGED_CONTENT_INFO
{
    uint dwBodyPartID;
    CRYPT_INTEGER_BLOB EncodedContentInfo;
}
struct CMC_TAGGED_OTHER_MSG
{
    uint dwBodyPartID;
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Value;
}
struct CMC_DATA_INFO
{
    uint cTaggedAttribute;
    CMC_TAGGED_ATTRIBUTE* rgTaggedAttribute;
    uint cTaggedRequest;
    CMC_TAGGED_REQUEST* rgTaggedRequest;
    uint cTaggedContentInfo;
    CMC_TAGGED_CONTENT_INFO* rgTaggedContentInfo;
    uint cTaggedOtherMsg;
    CMC_TAGGED_OTHER_MSG* rgTaggedOtherMsg;
}
struct CMC_RESPONSE_INFO
{
    uint cTaggedAttribute;
    CMC_TAGGED_ATTRIBUTE* rgTaggedAttribute;
    uint cTaggedContentInfo;
    CMC_TAGGED_CONTENT_INFO* rgTaggedContentInfo;
    uint cTaggedOtherMsg;
    CMC_TAGGED_OTHER_MSG* rgTaggedOtherMsg;
}
struct CMC_PEND_INFO
{
    CRYPT_INTEGER_BLOB PendToken;
    FILETIME PendTime;
}
struct CMC_STATUS_INFO
{
    uint dwStatus;
    uint cBodyList;
    uint* rgdwBodyList;
    PWSTR pwszStatusString;
    uint dwOtherInfoChoice;
    union
    {
        uint dwFailInfo;
        CMC_PEND_INFO* pPendInfo;
    }
}
struct CMC_ADD_EXTENSIONS_INFO
{
    uint dwCmcDataReference;
    uint cCertReference;
    uint* rgdwCertReference;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CMC_ADD_ATTRIBUTES_INFO
{
    uint dwCmcDataReference;
    uint cCertReference;
    uint* rgdwCertReference;
    uint cAttribute;
    CRYPT_ATTRIBUTE* rgAttribute;
}
struct CERT_TEMPLATE_EXT
{
    PSTR pszObjId;
    uint dwMajorVersion;
    BOOL fMinorVersion;
    uint dwMinorVersion;
}
struct CERT_HASHED_URL
{
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_INTEGER_BLOB Hash;
    PWSTR pwszUrl;
}
struct CERT_LOGOTYPE_DETAILS
{
    PWSTR pwszMimeType;
    uint cHashedUrl;
    CERT_HASHED_URL* rgHashedUrl;
}
struct CERT_LOGOTYPE_REFERENCE
{
    uint cHashedUrl;
    CERT_HASHED_URL* rgHashedUrl;
}
struct CERT_LOGOTYPE_IMAGE_INFO
{
    CERT_LOGOTYPE_IMAGE_INFO_TYPE dwLogotypeImageInfoChoice;
    uint dwFileSize;
    uint dwXSize;
    uint dwYSize;
    CERT_LOGOTYPE_CHOICE dwLogotypeImageResolutionChoice;
    union
    {
        uint dwNumBits;
        uint dwTableSize;
    }
    PWSTR pwszLanguage;
}
struct CERT_LOGOTYPE_IMAGE
{
    CERT_LOGOTYPE_DETAILS LogotypeDetails;
    CERT_LOGOTYPE_IMAGE_INFO* pLogotypeImageInfo;
}
struct CERT_LOGOTYPE_AUDIO_INFO
{
    uint dwFileSize;
    uint dwPlayTime;
    uint dwChannels;
    uint dwSampleRate;
    PWSTR pwszLanguage;
}
struct CERT_LOGOTYPE_AUDIO
{
    CERT_LOGOTYPE_DETAILS LogotypeDetails;
    CERT_LOGOTYPE_AUDIO_INFO* pLogotypeAudioInfo;
}
struct CERT_LOGOTYPE_DATA
{
    uint cLogotypeImage;
    CERT_LOGOTYPE_IMAGE* rgLogotypeImage;
    uint cLogotypeAudio;
    CERT_LOGOTYPE_AUDIO* rgLogotypeAudio;
}
struct CERT_LOGOTYPE_INFO
{
    CERT_LOGOTYPE_OPTION dwLogotypeInfoChoice;
    union
    {
        CERT_LOGOTYPE_DATA* pLogotypeDirectInfo;
        CERT_LOGOTYPE_REFERENCE* pLogotypeIndirectInfo;
    }
}
struct CERT_OTHER_LOGOTYPE_INFO
{
    PSTR pszObjId;
    CERT_LOGOTYPE_INFO LogotypeInfo;
}
struct CERT_LOGOTYPE_EXT_INFO
{
    uint cCommunityLogo;
    CERT_LOGOTYPE_INFO* rgCommunityLogo;
    CERT_LOGOTYPE_INFO* pIssuerLogo;
    CERT_LOGOTYPE_INFO* pSubjectLogo;
    uint cOtherLogo;
    CERT_OTHER_LOGOTYPE_INFO* rgOtherLogo;
}
struct CERT_BIOMETRIC_DATA
{
    CERT_BIOMETRIC_DATA_TYPE dwTypeOfBiometricDataChoice;
    union
    {
        uint dwPredefined;
        PSTR pszObjId;
    }
    CERT_HASHED_URL HashedUrl;
}
struct CERT_BIOMETRIC_EXT_INFO
{
    uint cBiometricData;
    CERT_BIOMETRIC_DATA* rgBiometricData;
}
struct OCSP_SIGNATURE_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CRYPT_BIT_BLOB Signature;
    uint cCertEncoded;
    CRYPT_INTEGER_BLOB* rgCertEncoded;
}
struct OCSP_SIGNED_REQUEST_INFO
{
    CRYPT_INTEGER_BLOB ToBeSigned;
    OCSP_SIGNATURE_INFO* pOptionalSignatureInfo;
}
struct OCSP_CERT_ID
{
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_INTEGER_BLOB IssuerNameHash;
    CRYPT_INTEGER_BLOB IssuerKeyHash;
    CRYPT_INTEGER_BLOB SerialNumber;
}
struct OCSP_REQUEST_ENTRY
{
    OCSP_CERT_ID CertId;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct OCSP_REQUEST_INFO
{
    uint dwVersion;
    CERT_ALT_NAME_ENTRY* pRequestorName;
    uint cRequestEntry;
    OCSP_REQUEST_ENTRY* rgRequestEntry;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct OCSP_RESPONSE_INFO
{
    uint dwStatus;
    PSTR pszObjId;
    CRYPT_INTEGER_BLOB Value;
}
struct OCSP_BASIC_SIGNED_RESPONSE_INFO
{
    CRYPT_INTEGER_BLOB ToBeSigned;
    OCSP_SIGNATURE_INFO SignatureInfo;
}
struct OCSP_BASIC_REVOKED_INFO
{
    FILETIME RevocationDate;
    CERT_REVOCATION_STATUS_REASON dwCrlReasonCode;
}
struct OCSP_BASIC_RESPONSE_ENTRY
{
    OCSP_CERT_ID CertId;
    uint dwCertStatus;
    union
    {
        OCSP_BASIC_REVOKED_INFO* pRevokedInfo;
    }
    FILETIME ThisUpdate;
    FILETIME NextUpdate;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct OCSP_BASIC_RESPONSE_INFO
{
    uint dwVersion;
    uint dwResponderIdChoice;
    union
    {
        CRYPT_INTEGER_BLOB ByNameResponderId;
        CRYPT_INTEGER_BLOB ByKeyResponderId;
    }
    FILETIME ProducedAt;
    uint cResponseEntry;
    OCSP_BASIC_RESPONSE_ENTRY* rgResponseEntry;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CERT_SUPPORTED_ALGORITHM_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER Algorithm;
    CRYPT_BIT_BLOB IntendedKeyUsage;
    CERT_POLICIES_INFO IntendedCertPolicies;
}
struct CERT_TPM_SPECIFICATION_INFO
{
    PWSTR pwszFamily;
    uint dwLevel;
    uint dwRevision;
}
struct CRYPT_OID_FUNC_ENTRY
{
    const(char)* pszOID;
    void* pvFuncAddr;
}
alias PFN_CRYPT_ENUM_OID_FUNC = BOOL function(uint, const(char)*, const(char)*, uint, const(uint)*, const(wchar)**, const(ubyte)**, const(uint)*, void*);
struct CRYPT_OID_INFO
{
    uint cbSize;
    const(char)* pszOID;
    const(wchar)* pwszName;
    uint dwGroupId;
    union
    {
        uint dwValue;
        uint Algid;
        uint dwLength;
    }
    CRYPT_INTEGER_BLOB ExtraInfo;
}
alias PFN_CRYPT_ENUM_OID_INFO = BOOL function(CRYPT_OID_INFO*, void*);
struct CERT_STRONG_SIGN_SERIALIZED_INFO
{
    CERT_STRONG_SIGN_FLAGS dwFlags;
    PWSTR pwszCNGSignHashAlgids;
    PWSTR pwszCNGPubKeyMinBitLengths;
}
struct CERT_STRONG_SIGN_PARA
{
    uint cbSize;
    uint dwInfoChoice;
    union
    {
        void* pvInfo;
        CERT_STRONG_SIGN_SERIALIZED_INFO* pSerializedInfo;
        PSTR pszOID;
    }
}
struct CERT_ISSUER_SERIAL_NUMBER
{
    CRYPT_INTEGER_BLOB Issuer;
    CRYPT_INTEGER_BLOB SerialNumber;
}
struct CERT_ID
{
    CERT_ID_OPTION dwIdChoice;
    union
    {
        CERT_ISSUER_SERIAL_NUMBER IssuerSerialNumber;
        CRYPT_INTEGER_BLOB KeyId;
        CRYPT_INTEGER_BLOB HashId;
    }
}
struct CMSG_SIGNER_ENCODE_INFO
{
    uint cbSize;
    CERT_INFO* pCertInfo;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    uint dwKeySpec;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    uint cAuthAttr;
    CRYPT_ATTRIBUTE* rgAuthAttr;
    uint cUnauthAttr;
    CRYPT_ATTRIBUTE* rgUnauthAttr;
}
struct CMSG_SIGNED_ENCODE_INFO
{
    uint cbSize;
    uint cSigners;
    CMSG_SIGNER_ENCODE_INFO* rgSigners;
    uint cCertEncoded;
    CRYPT_INTEGER_BLOB* rgCertEncoded;
    uint cCrlEncoded;
    CRYPT_INTEGER_BLOB* rgCrlEncoded;
}
struct CMSG_ENVELOPED_ENCODE_INFO
{
    uint cbSize;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    void* pvEncryptionAuxInfo;
    uint cRecipients;
    CERT_INFO** rgpRecipients;
}
struct CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO
{
    uint cbSize;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    void* pvKeyEncryptionAuxInfo;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_BIT_BLOB RecipientPublicKey;
    CERT_ID RecipientId;
}
struct CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO
{
    uint cbSize;
    CRYPT_BIT_BLOB RecipientPublicKey;
    CERT_ID RecipientId;
    FILETIME Date;
    CRYPT_ATTRIBUTE_TYPE_VALUE* pOtherAttr;
}
struct CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO
{
    uint cbSize;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    void* pvKeyEncryptionAuxInfo;
    CRYPT_ALGORITHM_IDENTIFIER KeyWrapAlgorithm;
    void* pvKeyWrapAuxInfo;
    HCRYPTPROV_LEGACY hCryptProv;
    uint dwKeySpec;
    CMSG_KEY_AGREE_OPTION dwKeyChoice;
    union
    {
        CRYPT_ALGORITHM_IDENTIFIER* pEphemeralAlgorithm;
        CERT_ID* pSenderId;
    }
    CRYPT_INTEGER_BLOB UserKeyingMaterial;
    uint cRecipientEncryptedKeys;
    CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO** rgpRecipientEncryptedKeys;
}
struct CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO
{
    uint cbSize;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    void* pvKeyEncryptionAuxInfo;
    ulong hCryptProv;
    uint dwKeyChoice;
    union
    {
        ulong hKeyEncryptionKey;
        void* pvKeyEncryptionKey;
    }
    CRYPT_INTEGER_BLOB KeyId;
    FILETIME Date;
    CRYPT_ATTRIBUTE_TYPE_VALUE* pOtherAttr;
}
struct CMSG_RECIPIENT_ENCODE_INFO
{
    uint dwRecipientChoice;
    union
    {
        CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO* pKeyTrans;
        CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO* pKeyAgree;
        CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO* pMailList;
    }
}
struct CMSG_RC2_AUX_INFO
{
    uint cbSize;
    uint dwBitLen;
}
struct CMSG_SP3_COMPATIBLE_AUX_INFO
{
    uint cbSize;
    uint dwFlags;
}
struct CMSG_RC4_AUX_INFO
{
    uint cbSize;
    uint dwBitLen;
}
struct CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO
{
    uint cbSize;
    CMSG_SIGNED_ENCODE_INFO SignedInfo;
    CMSG_ENVELOPED_ENCODE_INFO EnvelopedInfo;
}
struct CMSG_HASHED_ENCODE_INFO
{
    uint cbSize;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
}
struct CMSG_ENCRYPTED_ENCODE_INFO
{
    uint cbSize;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    void* pvEncryptionAuxInfo;
}
alias PFN_CMSG_STREAM_OUTPUT = BOOL function(const(void)*, ubyte*, uint, BOOL);
struct CMSG_STREAM_INFO
{
    uint cbContent;
    PFN_CMSG_STREAM_OUTPUT pfnStreamOutput;
    void* pvArg;
}
struct CMSG_SIGNER_INFO
{
    uint dwVersion;
    CRYPT_INTEGER_BLOB Issuer;
    CRYPT_INTEGER_BLOB SerialNumber;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedHash;
    CRYPT_ATTRIBUTES AuthAttrs;
    CRYPT_ATTRIBUTES UnauthAttrs;
}
struct CMSG_CMS_SIGNER_INFO
{
    uint dwVersion;
    CERT_ID SignerId;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedHash;
    CRYPT_ATTRIBUTES AuthAttrs;
    CRYPT_ATTRIBUTES UnauthAttrs;
}
struct CMSG_KEY_TRANS_RECIPIENT_INFO
{
    uint dwVersion;
    CERT_ID RecipientId;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedKey;
}
struct CMSG_RECIPIENT_ENCRYPTED_KEY_INFO
{
    CERT_ID RecipientId;
    CRYPT_INTEGER_BLOB EncryptedKey;
    FILETIME Date;
    CRYPT_ATTRIBUTE_TYPE_VALUE* pOtherAttr;
}
struct CMSG_KEY_AGREE_RECIPIENT_INFO
{
    uint dwVersion;
    CMSG_KEY_AGREE_ORIGINATOR dwOriginatorChoice;
    union
    {
        CERT_ID OriginatorCertId;
        CERT_PUBLIC_KEY_INFO OriginatorPublicKeyInfo;
    }
    CRYPT_INTEGER_BLOB UserKeyingMaterial;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    uint cRecipientEncryptedKeys;
    CMSG_RECIPIENT_ENCRYPTED_KEY_INFO** rgpRecipientEncryptedKeys;
}
struct CMSG_MAIL_LIST_RECIPIENT_INFO
{
    uint dwVersion;
    CRYPT_INTEGER_BLOB KeyId;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedKey;
    FILETIME Date;
    CRYPT_ATTRIBUTE_TYPE_VALUE* pOtherAttr;
}
struct CMSG_CMS_RECIPIENT_INFO
{
    uint dwRecipientChoice;
    union
    {
        CMSG_KEY_TRANS_RECIPIENT_INFO* pKeyTrans;
        CMSG_KEY_AGREE_RECIPIENT_INFO* pKeyAgree;
        CMSG_MAIL_LIST_RECIPIENT_INFO* pMailList;
    }
}
struct CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA
{
    uint cbSize;
    HCRYPTPROV_LEGACY hCryptProv;
    uint dwSignerIndex;
    uint dwSignerType;
    void* pvSigner;
}
struct CMSG_CTRL_DECRYPT_PARA
{
    uint cbSize;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    uint dwKeySpec;
    uint dwRecipientIndex;
}
struct CMSG_CTRL_KEY_TRANS_DECRYPT_PARA
{
    uint cbSize;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    uint dwKeySpec;
    CMSG_KEY_TRANS_RECIPIENT_INFO* pKeyTrans;
    uint dwRecipientIndex;
}
struct CMSG_CTRL_KEY_AGREE_DECRYPT_PARA
{
    uint cbSize;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    uint dwKeySpec;
    CMSG_KEY_AGREE_RECIPIENT_INFO* pKeyAgree;
    uint dwRecipientIndex;
    uint dwRecipientEncryptedKeyIndex;
    CRYPT_BIT_BLOB OriginatorPublicKey;
}
struct CMSG_CTRL_MAIL_LIST_DECRYPT_PARA
{
    uint cbSize;
    ulong hCryptProv;
    CMSG_MAIL_LIST_RECIPIENT_INFO* pMailList;
    uint dwRecipientIndex;
    uint dwKeyChoice;
    union
    {
        ulong hKeyEncryptionKey;
        void* pvKeyEncryptionKey;
    }
}
struct CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA
{
    uint cbSize;
    uint dwSignerIndex;
    CRYPT_INTEGER_BLOB blob;
}
struct CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA
{
    uint cbSize;
    uint dwSignerIndex;
    uint dwUnauthAttrIndex;
}
alias PFN_CMSG_ALLOC = void* function(ulong);
alias PFN_CMSG_FREE = void function(void*);
alias PFN_CMSG_GEN_ENCRYPT_KEY = BOOL function(ulong*, CRYPT_ALGORITHM_IDENTIFIER*, void*, CERT_PUBLIC_KEY_INFO*, PFN_CMSG_ALLOC, ulong*, ubyte**, uint*);
alias PFN_CMSG_EXPORT_ENCRYPT_KEY = BOOL function(ulong, ulong, CERT_PUBLIC_KEY_INFO*, ubyte*, uint*);
alias PFN_CMSG_IMPORT_ENCRYPT_KEY = BOOL function(ulong, uint, CRYPT_ALGORITHM_IDENTIFIER*, CRYPT_ALGORITHM_IDENTIFIER*, ubyte*, uint, ulong*);
struct CMSG_CONTENT_ENCRYPT_INFO
{
    uint cbSize;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    void* pvEncryptionAuxInfo;
    uint cRecipients;
    CMSG_RECIPIENT_ENCODE_INFO* rgCmsRecipients;
    PFN_CMSG_ALLOC pfnAlloc;
    PFN_CMSG_FREE pfnFree;
    uint dwEncryptFlags;
    union
    {
        ulong hContentEncryptKey;
        BCRYPT_KEY_HANDLE hCNGContentEncryptKey;
    }
    uint dwFlags;
    BOOL fCNG;
    ubyte* pbCNGContentEncryptKeyObject;
    ubyte* pbContentEncryptKey;
    uint cbContentEncryptKey;
}
alias PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY = BOOL function(CMSG_CONTENT_ENCRYPT_INFO*, uint, void*);
struct CMSG_KEY_TRANS_ENCRYPT_INFO
{
    uint cbSize;
    uint dwRecipientIndex;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedKey;
    uint dwFlags;
}
alias PFN_CMSG_EXPORT_KEY_TRANS = BOOL function(CMSG_CONTENT_ENCRYPT_INFO*, CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO*, CMSG_KEY_TRANS_ENCRYPT_INFO*, uint, void*);
struct CMSG_KEY_AGREE_KEY_ENCRYPT_INFO
{
    uint cbSize;
    CRYPT_INTEGER_BLOB EncryptedKey;
}
struct CMSG_KEY_AGREE_ENCRYPT_INFO
{
    uint cbSize;
    uint dwRecipientIndex;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB UserKeyingMaterial;
    CMSG_KEY_AGREE_ORIGINATOR dwOriginatorChoice;
    union
    {
        CERT_ID OriginatorCertId;
        CERT_PUBLIC_KEY_INFO OriginatorPublicKeyInfo;
    }
    uint cKeyAgreeKeyEncryptInfo;
    CMSG_KEY_AGREE_KEY_ENCRYPT_INFO** rgpKeyAgreeKeyEncryptInfo;
    uint dwFlags;
}
alias PFN_CMSG_EXPORT_KEY_AGREE = BOOL function(CMSG_CONTENT_ENCRYPT_INFO*, CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO*, CMSG_KEY_AGREE_ENCRYPT_INFO*, uint, void*);
struct CMSG_MAIL_LIST_ENCRYPT_INFO
{
    uint cbSize;
    uint dwRecipientIndex;
    CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
    CRYPT_INTEGER_BLOB EncryptedKey;
    uint dwFlags;
}
alias PFN_CMSG_EXPORT_MAIL_LIST = BOOL function(CMSG_CONTENT_ENCRYPT_INFO*, CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO*, CMSG_MAIL_LIST_ENCRYPT_INFO*, uint, void*);
alias PFN_CMSG_IMPORT_KEY_TRANS = BOOL function(CRYPT_ALGORITHM_IDENTIFIER*, CMSG_CTRL_KEY_TRANS_DECRYPT_PARA*, uint, void*, ulong*);
alias PFN_CMSG_IMPORT_KEY_AGREE = BOOL function(CRYPT_ALGORITHM_IDENTIFIER*, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA*, uint, void*, ulong*);
alias PFN_CMSG_IMPORT_MAIL_LIST = BOOL function(CRYPT_ALGORITHM_IDENTIFIER*, CMSG_CTRL_MAIL_LIST_DECRYPT_PARA*, uint, void*, ulong*);
struct CMSG_CNG_CONTENT_DECRYPT_INFO
{
    uint cbSize;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    PFN_CMSG_ALLOC pfnAlloc;
    PFN_CMSG_FREE pfnFree;
    NCRYPT_KEY_HANDLE hNCryptKey;
    ubyte* pbContentEncryptKey;
    uint cbContentEncryptKey;
    BCRYPT_KEY_HANDLE hCNGContentEncryptKey;
    ubyte* pbCNGContentEncryptKeyObject;
}
alias PFN_CMSG_CNG_IMPORT_KEY_TRANS = BOOL function(CMSG_CNG_CONTENT_DECRYPT_INFO*, CMSG_CTRL_KEY_TRANS_DECRYPT_PARA*, uint, void*);
alias PFN_CMSG_CNG_IMPORT_KEY_AGREE = BOOL function(CMSG_CNG_CONTENT_DECRYPT_INFO*, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA*, uint, void*);
alias PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY = BOOL function(CMSG_CNG_CONTENT_DECRYPT_INFO*, uint, void*);
struct CERT_CONTEXT
{
    CERT_QUERY_ENCODING_TYPE dwCertEncodingType;
    ubyte* pbCertEncoded;
    uint cbCertEncoded;
    CERT_INFO* pCertInfo;
    HCERTSTORE hCertStore;
}
struct CRL_CONTEXT
{
    CERT_QUERY_ENCODING_TYPE dwCertEncodingType;
    ubyte* pbCrlEncoded;
    uint cbCrlEncoded;
    CRL_INFO* pCrlInfo;
    HCERTSTORE hCertStore;
}
struct CTL_CONTEXT
{
    uint dwMsgAndCertEncodingType;
    ubyte* pbCtlEncoded;
    uint cbCtlEncoded;
    CTL_INFO* pCtlInfo;
    HCERTSTORE hCertStore;
    void* hCryptMsg;
    ubyte* pbCtlContent;
    uint cbCtlContent;
}
alias CertKeyType = uint;
enum : uint
{
    KeyTypeOther             = 0x00000000,
    KeyTypeVirtualSmartCard  = 0x00000001,
    KeyTypePhysicalSmartCard = 0x00000002,
    KeyTypePassport          = 0x00000003,
    KeyTypePassportRemote    = 0x00000004,
    KeyTypePassportSmartCard = 0x00000005,
    KeyTypeHardware          = 0x00000006,
    KeyTypeSoftware          = 0x00000007,
    KeyTypeSelfSigned        = 0x00000008,
}

struct CRYPT_KEY_PROV_PARAM
{
    uint dwParam;
    ubyte* pbData;
    uint cbData;
    uint dwFlags;
}
struct CRYPT_KEY_PROV_INFO
{
    PWSTR pwszContainerName;
    PWSTR pwszProvName;
    uint dwProvType;
    CRYPT_KEY_FLAGS dwFlags;
    uint cProvParam;
    CRYPT_KEY_PROV_PARAM* rgProvParam;
    uint dwKeySpec;
}
struct CERT_KEY_CONTEXT
{
    uint cbSize;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    uint dwKeySpec;
}
struct ROOT_INFO_LUID
{
    uint LowPart;
    int HighPart;
}
struct CRYPT_SMART_CARD_ROOT_INFO
{
    ubyte[16] rgbCardID;
    ROOT_INFO_LUID luid;
}
struct CERT_SYSTEM_STORE_RELOCATE_PARA
{
    union
    {
        HKEY hKeyBase;
        void* pvBase;
    }
    union
    {
        void* pvSystemStore;
        const(char)* pszSystemStore;
        const(wchar)* pwszSystemStore;
    }
}
struct CERT_REGISTRY_STORE_CLIENT_GPT_PARA
{
    HKEY hKeyBase;
    PWSTR pwszRegPath;
}
struct CERT_REGISTRY_STORE_ROAMING_PARA
{
    HKEY hKey;
    PWSTR pwszStoreDirectory;
}
struct CERT_LDAP_STORE_OPENED_PARA
{
    void* pvLdapSessionHandle;
    const(wchar)* pwszLdapUrl;
}
struct CERT_STORE_PROV_INFO
{
    uint cbSize;
    uint cStoreProvFunc;
    void** rgpvStoreProvFunc;
    HCERTSTOREPROV hStoreProv;
    CERT_STORE_PROV_FLAGS dwStoreProvFlags;
    void* hStoreProvFuncAddr2;
}
alias PFN_CERT_DLL_OPEN_STORE_PROV_FUNC = BOOL function(const(char)*, CERT_QUERY_ENCODING_TYPE, HCRYPTPROV_LEGACY, CERT_OPEN_STORE_FLAGS, const(void)*, HCERTSTORE, CERT_STORE_PROV_INFO*);
alias PFN_CERT_STORE_PROV_CLOSE = void function(HCERTSTOREPROV, uint);
alias PFN_CERT_STORE_PROV_READ_CERT = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, uint, CERT_CONTEXT**);
alias PFN_CERT_STORE_PROV_WRITE_CERT = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, uint);
alias PFN_CERT_STORE_PROV_DELETE_CERT = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, uint);
alias PFN_CERT_STORE_PROV_SET_CERT_PROPERTY = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, uint, uint, const(void)*);
alias PFN_CERT_STORE_PROV_READ_CRL = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, uint, CRL_CONTEXT**);
alias PFN_CERT_STORE_PROV_WRITE_CRL = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, uint);
alias PFN_CERT_STORE_PROV_DELETE_CRL = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, uint);
alias PFN_CERT_STORE_PROV_SET_CRL_PROPERTY = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, uint, uint, const(void)*);
alias PFN_CERT_STORE_PROV_READ_CTL = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, uint, CTL_CONTEXT**);
alias PFN_CERT_STORE_PROV_WRITE_CTL = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, uint);
alias PFN_CERT_STORE_PROV_DELETE_CTL = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, uint);
alias PFN_CERT_STORE_PROV_SET_CTL_PROPERTY = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, uint, uint, const(void)*);
alias PFN_CERT_STORE_PROV_CONTROL = BOOL function(HCERTSTOREPROV, uint, uint, const(void)*);
struct CERT_STORE_PROV_FIND_INFO
{
    uint cbSize;
    uint dwMsgAndCertEncodingType;
    uint dwFindFlags;
    uint dwFindType;
    const(void)* pvFindPara;
}
alias PFN_CERT_STORE_PROV_FIND_CERT = BOOL function(HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO*, const(CERT_CONTEXT)*, uint, void**, CERT_CONTEXT**);
alias PFN_CERT_STORE_PROV_FREE_FIND_CERT = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, void*, uint);
alias PFN_CERT_STORE_PROV_GET_CERT_PROPERTY = BOOL function(HCERTSTOREPROV, const(CERT_CONTEXT)*, uint, uint, void*, uint*);
alias PFN_CERT_STORE_PROV_FIND_CRL = BOOL function(HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO*, CRL_CONTEXT*, uint, void**, CRL_CONTEXT**);
alias PFN_CERT_STORE_PROV_FREE_FIND_CRL = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, void*, uint);
alias PFN_CERT_STORE_PROV_GET_CRL_PROPERTY = BOOL function(HCERTSTOREPROV, CRL_CONTEXT*, uint, uint, void*, uint*);
alias PFN_CERT_STORE_PROV_FIND_CTL = BOOL function(HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO*, CTL_CONTEXT*, uint, void**, CTL_CONTEXT**);
alias PFN_CERT_STORE_PROV_FREE_FIND_CTL = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, void*, uint);
alias PFN_CERT_STORE_PROV_GET_CTL_PROPERTY = BOOL function(HCERTSTOREPROV, CTL_CONTEXT*, uint, uint, void*, uint*);
struct CRL_FIND_ISSUED_FOR_PARA
{
    const(CERT_CONTEXT)* pSubjectCert;
    const(CERT_CONTEXT)* pIssuerCert;
}
struct CTL_ANY_SUBJECT_INFO
{
    CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm;
    CRYPT_INTEGER_BLOB SubjectIdentifier;
}
struct CTL_FIND_USAGE_PARA
{
    uint cbSize;
    CTL_USAGE SubjectUsage;
    CRYPT_INTEGER_BLOB ListIdentifier;
    CERT_INFO* pSigner;
}
struct CTL_FIND_SUBJECT_PARA
{
    uint cbSize;
    CTL_FIND_USAGE_PARA* pUsagePara;
    uint dwSubjectType;
    void* pvSubject;
}
alias PFN_CERT_CREATE_CONTEXT_SORT_FUNC = BOOL function(uint, uint, uint, void*);
struct CERT_CREATE_CONTEXT_PARA
{
    uint cbSize;
    PFN_CRYPT_FREE pfnFree;
    void* pvFree;
    PFN_CERT_CREATE_CONTEXT_SORT_FUNC pfnSort;
    void* pvSort;
}
struct CERT_SYSTEM_STORE_INFO
{
    uint cbSize;
}
struct CERT_PHYSICAL_STORE_INFO
{
    uint cbSize;
    PSTR pszOpenStoreProvider;
    uint dwOpenEncodingType;
    uint dwOpenFlags;
    CRYPT_INTEGER_BLOB OpenParameters;
    uint dwFlags;
    uint dwPriority;
}
alias PFN_CERT_ENUM_SYSTEM_STORE_LOCATION = BOOL function(const(wchar)*, uint, void*, void*);
alias PFN_CERT_ENUM_SYSTEM_STORE = BOOL function(const(void)*, CERT_SYSTEM_STORE_FLAGS, CERT_SYSTEM_STORE_INFO*, void*, void*);
alias PFN_CERT_ENUM_PHYSICAL_STORE = BOOL function(const(void)*, uint, const(wchar)*, CERT_PHYSICAL_STORE_INFO*, void*, void*);
struct CTL_VERIFY_USAGE_PARA
{
    uint cbSize;
    CRYPT_INTEGER_BLOB ListIdentifier;
    uint cCtlStore;
    HCERTSTORE* rghCtlStore;
    uint cSignerStore;
    HCERTSTORE* rghSignerStore;
}
struct CTL_VERIFY_USAGE_STATUS
{
    uint cbSize;
    uint dwError;
    uint dwFlags;
    CTL_CONTEXT** ppCtl;
    uint dwCtlEntryIndex;
    CERT_CONTEXT** ppSigner;
    uint dwSignerIndex;
}
struct CERT_REVOCATION_CRL_INFO
{
    uint cbSize;
    CRL_CONTEXT* pBaseCrlContext;
    CRL_CONTEXT* pDeltaCrlContext;
    CRL_ENTRY* pCrlEntry;
    BOOL fDeltaCrlEntry;
}
struct CERT_REVOCATION_PARA
{
    uint cbSize;
    const(CERT_CONTEXT)* pIssuerCert;
    uint cCertStore;
    HCERTSTORE* rgCertStore;
    HCERTSTORE hCrlStore;
    FILETIME* pftTimeToUse;
}
struct CERT_REVOCATION_STATUS
{
    uint cbSize;
    uint dwIndex;
    uint dwError;
    CERT_REVOCATION_STATUS_REASON dwReason;
    BOOL fHasFreshnessTime;
    uint dwFreshnessTime;
}
struct CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO
{
    CRYPT_INTEGER_BLOB CertSignHashCNGAlgPropData;
    CRYPT_INTEGER_BLOB CertIssuerPubKeyBitLengthPropData;
}
struct CRYPT_VERIFY_CERT_SIGN_WEAK_HASH_INFO
{
    uint cCNGHashAlgid;
    PWSTR* rgpwszCNGHashAlgid;
    uint dwWeakIndex;
}
alias PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC = BOOL function(CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER*, void**, PWSTR*);
alias PFN_CRYPT_SIGN_AND_ENCODE_HASH_FUNC = BOOL function(NCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER*, void*, const(wchar)*, const(wchar)*, ubyte*, uint, ubyte*, uint*);
alias PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC = BOOL function(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, CRYPT_ALGORITHM_IDENTIFIER*, void*, const(wchar)*, const(wchar)*, ubyte*, uint, ubyte*, uint);
struct CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA
{
    uint cOID;
    PSTR* rgpszOID;
}
alias PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC = BOOL function(NCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, uint, void*, CERT_PUBLIC_KEY_INFO*, uint*);
alias PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC = BOOL function(BCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, uint, void*, CERT_PUBLIC_KEY_INFO*, uint*);
alias PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC = BOOL function(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO*, uint, void*, BCRYPT_KEY_HANDLE*);
alias PFN_IMPORT_PRIV_KEY_FUNC = BOOL function(ulong, CRYPT_PRIVATE_KEY_INFO*, uint, void*);
alias PFN_EXPORT_PRIV_KEY_FUNC = BOOL function(ulong, uint, PSTR, uint, void*, CRYPT_PRIVATE_KEY_INFO*, uint*);
alias PFN_CRYPT_GET_SIGNER_CERTIFICATE = CERT_CONTEXT* function(void*, CERT_QUERY_ENCODING_TYPE, CERT_INFO*, HCERTSTORE);
struct CRYPT_SIGN_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgEncodingType;
    const(CERT_CONTEXT)* pSigningCert;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    uint cMsgCert;
    CERT_CONTEXT** rgpMsgCert;
    uint cMsgCrl;
    CRL_CONTEXT** rgpMsgCrl;
    uint cAuthAttr;
    CRYPT_ATTRIBUTE* rgAuthAttr;
    uint cUnauthAttr;
    CRYPT_ATTRIBUTE* rgUnauthAttr;
    uint dwFlags;
    uint dwInnerContentType;
}
struct CRYPT_VERIFY_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgAndCertEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    PFN_CRYPT_GET_SIGNER_CERTIFICATE pfnGetSignerCertificate;
    void* pvGetArg;
}
struct CRYPT_ENCRYPT_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    void* pvEncryptionAuxInfo;
    uint dwFlags;
    uint dwInnerContentType;
}
struct CRYPT_DECRYPT_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgAndCertEncodingType;
    uint cCertStore;
    HCERTSTORE* rghCertStore;
}
struct CRYPT_HASH_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
}
struct CRYPT_KEY_SIGN_MESSAGE_PARA
{
    uint cbSize;
    CERT_QUERY_ENCODING_TYPE dwMsgAndCertEncodingType;
    union
    {
        ulong hCryptProv;
        NCRYPT_KEY_HANDLE hNCryptKey;
    }
    CERT_KEY_SPEC dwKeySpec;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    CRYPT_ALGORITHM_IDENTIFIER PubKeyAlgorithm;
}
struct CRYPT_KEY_VERIFY_MESSAGE_PARA
{
    uint cbSize;
    uint dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
}
struct CERT_CHAIN
{
    uint cCerts;
    CRYPT_INTEGER_BLOB* certs;
    CRYPT_KEY_PROV_INFO keyLocatorInfo;
}
alias PFN_CRYPT_ASYNC_PARAM_FREE_FUNC = void function(PSTR, void*);
struct CRYPT_BLOB_ARRAY
{
    uint cBlob;
    CRYPT_INTEGER_BLOB* rgBlob;
}
struct CRYPT_CREDENTIALS
{
    uint cbSize;
    const(char)* pszCredentialsOid;
    void* pvCredentials;
}
struct CRYPT_PASSWORD_CREDENTIALSA
{
    uint cbSize;
    PSTR pszUsername;
    PSTR pszPassword;
}
struct CRYPT_PASSWORD_CREDENTIALSW
{
    uint cbSize;
    PWSTR pszUsername;
    PWSTR pszPassword;
}
alias PFN_FREE_ENCODED_OBJECT_FUNC = void function(const(char)*, CRYPT_BLOB_ARRAY*, void*);
struct CRYPTNET_URL_CACHE_PRE_FETCH_INFO
{
    uint cbSize;
    uint dwObjectType;
    uint dwError;
    uint dwReserved;
    FILETIME ThisUpdateTime;
    FILETIME NextUpdateTime;
    FILETIME PublishTime;
}
struct CRYPTNET_URL_CACHE_FLUSH_INFO
{
    uint cbSize;
    uint dwExemptSeconds;
    FILETIME ExpireTime;
}
struct CRYPTNET_URL_CACHE_RESPONSE_INFO
{
    uint cbSize;
    ushort wResponseType;
    ushort wResponseFlags;
    FILETIME LastModifiedTime;
    uint dwMaxAge;
    const(wchar)* pwszETag;
    uint dwProxyId;
}
struct CRYPT_RETRIEVE_AUX_INFO
{
    uint cbSize;
    FILETIME* pLastSyncTime;
    uint dwMaxUrlRetrievalByteCount;
    CRYPTNET_URL_CACHE_PRE_FETCH_INFO* pPreFetchInfo;
    CRYPTNET_URL_CACHE_FLUSH_INFO* pFlushInfo;
    CRYPTNET_URL_CACHE_RESPONSE_INFO** ppResponseInfo;
    PWSTR pwszCacheFileNamePrefix;
    FILETIME* pftCacheResync;
    BOOL fProxyCacheRetrieval;
    uint dwHttpStatusCode;
    PWSTR* ppwszErrorResponseHeaders;
    CRYPT_INTEGER_BLOB** ppErrorContentBlob;
}
alias PFN_CRYPT_CANCEL_RETRIEVAL = BOOL function(uint, void*);
alias PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC = void function(void*, uint, const(char)*, PSTR, void*);
struct CRYPT_ASYNC_RETRIEVAL_COMPLETION
{
    PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC pfnCompletion;
    void* pvCompletion;
}
alias PFN_CANCEL_ASYNC_RETRIEVAL_FUNC = BOOL function(HCRYPTASYNC);
struct CRYPT_URL_ARRAY
{
    uint cUrl;
    PWSTR* rgwszUrl;
}
struct CRYPT_URL_INFO
{
    uint cbSize;
    uint dwSyncDeltaTime;
    uint cGroup;
    uint* rgcGroupEntry;
}
struct CERT_CRL_CONTEXT_PAIR
{
    const(CERT_CONTEXT)* pCertContext;
    CRL_CONTEXT* pCrlContext;
}
struct CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO
{
    uint cbSize;
    int iDeltaCrlIndicator;
    FILETIME* pftCacheResync;
    FILETIME* pLastSyncTime;
    FILETIME* pMaxAgeTime;
    CERT_REVOCATION_CHAIN_PARA* pChainPara;
    CRYPT_INTEGER_BLOB* pDeltaCrlIndicator;
}
alias PFN_CRYPT_ENUM_KEYID_PROP = BOOL function(const(CRYPT_INTEGER_BLOB)*, uint, void*, void*, uint, uint*, void**, uint*);
struct CERT_CHAIN_ENGINE_CONFIG
{
    uint cbSize;
    HCERTSTORE hRestrictedRoot;
    HCERTSTORE hRestrictedTrust;
    HCERTSTORE hRestrictedOther;
    uint cAdditionalStore;
    HCERTSTORE* rghAdditionalStore;
    uint dwFlags;
    uint dwUrlRetrievalTimeout;
    uint MaximumCachedCertificates;
    uint CycleDetectionModulus;
    HCERTSTORE hExclusiveRoot;
    HCERTSTORE hExclusiveTrustedPeople;
    uint dwExclusiveFlags;
}
struct CERT_TRUST_STATUS
{
    uint dwErrorStatus;
    uint dwInfoStatus;
}
struct CERT_REVOCATION_INFO
{
    uint cbSize;
    uint dwRevocationResult;
    const(char)* pszRevocationOid;
    void* pvOidSpecificInfo;
    BOOL fHasFreshnessTime;
    uint dwFreshnessTime;
    CERT_REVOCATION_CRL_INFO* pCrlInfo;
}
struct CERT_TRUST_LIST_INFO
{
    uint cbSize;
    CTL_ENTRY* pCtlEntry;
    CTL_CONTEXT* pCtlContext;
}
struct CERT_CHAIN_ELEMENT
{
    uint cbSize;
    const(CERT_CONTEXT)* pCertContext;
    CERT_TRUST_STATUS TrustStatus;
    CERT_REVOCATION_INFO* pRevocationInfo;
    CTL_USAGE* pIssuanceUsage;
    CTL_USAGE* pApplicationUsage;
    const(wchar)* pwszExtendedErrorInfo;
}
struct CERT_SIMPLE_CHAIN
{
    uint cbSize;
    CERT_TRUST_STATUS TrustStatus;
    uint cElement;
    CERT_CHAIN_ELEMENT** rgpElement;
    CERT_TRUST_LIST_INFO* pTrustListInfo;
    BOOL fHasRevocationFreshnessTime;
    uint dwRevocationFreshnessTime;
}
struct CERT_CHAIN_CONTEXT
{
    uint cbSize;
    CERT_TRUST_STATUS TrustStatus;
    uint cChain;
    CERT_SIMPLE_CHAIN** rgpChain;
    uint cLowerQualityChainContext;
    CERT_CHAIN_CONTEXT** rgpLowerQualityChainContext;
    BOOL fHasRevocationFreshnessTime;
    uint dwRevocationFreshnessTime;
    uint dwCreateFlags;
    GUID ChainId;
}
struct CERT_USAGE_MATCH
{
    uint dwType;
    CTL_USAGE Usage;
}
struct CTL_USAGE_MATCH
{
    uint dwType;
    CTL_USAGE Usage;
}
struct CERT_CHAIN_PARA
{
    uint cbSize;
    CERT_USAGE_MATCH RequestedUsage;
}
struct CERT_REVOCATION_CHAIN_PARA
{
    uint cbSize;
    HCERTCHAINENGINE hChainEngine;
    HCERTSTORE hAdditionalStore;
    uint dwChainFlags;
    uint dwUrlRetrievalTimeout;
    FILETIME* pftCurrentTime;
    FILETIME* pftCacheResync;
    uint cbMaxUrlRetrievalByteCount;
}
struct CRL_REVOCATION_INFO
{
    CRL_ENTRY* pCrlEntry;
    CRL_CONTEXT* pCrlContext;
    CERT_CHAIN_CONTEXT* pCrlIssuerChain;
}
alias PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK = BOOL function(const(CERT_CONTEXT)*, void*);
struct CERT_CHAIN_FIND_BY_ISSUER_PARA
{
    uint cbSize;
    const(char)* pszUsageIdentifier;
    uint dwKeySpec;
    uint dwAcquirePrivateKeyFlags;
    uint cIssuer;
    CRYPT_INTEGER_BLOB* rgIssuer;
    PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK pfnFindCallback;
    void* pvFindArg;
}
struct CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    CERT_CHAIN_POLICY_FLAGS dwFlags;
    void* pvExtraPolicyPara;
}
struct CERT_CHAIN_POLICY_STATUS
{
    uint cbSize;
    uint dwError;
    int lChainIndex;
    int lElementIndex;
    void* pvExtraPolicyStatus;
}
struct AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    uint dwRegPolicySettings;
    CMSG_SIGNER_INFO* pSignerInfo;
}
struct AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS
{
    uint cbSize;
    BOOL fCommercial;
}
struct AUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    uint dwRegPolicySettings;
    BOOL fCommercial;
}
struct HTTPSPolicyCallbackData
{
    union
    {
        uint cbStruct;
        uint cbSize;
    }
    HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE dwAuthType;
    uint fdwChecks;
    PWSTR pwszServerName;
}
struct EV_EXTRA_CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    CERT_ROOT_PROGRAM_FLAGS dwRootProgramQualifierFlags;
}
struct EV_EXTRA_CERT_CHAIN_POLICY_STATUS
{
    uint cbSize;
    uint dwQualifiers;
    uint dwIssuanceUsageIndex;
}
struct SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS
{
    uint cbSize;
    uint dwErrorLevel;
    uint dwErrorCategory;
    uint dwReserved;
    wchar[256] wszErrorText;
}
struct SSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    uint dwReserved;
    PWSTR pwszServerName;
    PSTR[2] rgpszHpkpValue;
}
struct SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_PARA
{
    uint cbSize;
    uint dwReserved;
    const(wchar)* pwszServerName;
}
struct SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS
{
    uint cbSize;
    int lError;
    wchar[512] wszErrorText;
}
struct CRYPT_PKCS12_PBE_PARAMS
{
    int iIterations;
    uint cbSalt;
}
struct PKCS12_PBES2_EXPORT_PARAMS
{
    uint dwSize;
    void* hNcryptDescriptor;
    PWSTR pwszPbes2Alg;
}
struct CERT_SERVER_OCSP_RESPONSE_CONTEXT
{
    uint cbSize;
    ubyte* pbEncodedOcspResponse;
    uint cbEncodedOcspResponse;
}
alias PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK = void function(CERT_CHAIN_CONTEXT*, CERT_SERVER_OCSP_RESPONSE_CONTEXT*, CRL_CONTEXT*, CRL_CONTEXT*, void*, uint);
struct CERT_SERVER_OCSP_RESPONSE_OPEN_PARA
{
    uint cbSize;
    uint dwFlags;
    uint* pcbUsedSize;
    PWSTR pwszOcspDirectory;
    PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK pfnUpdateCallback;
    void* pvUpdateCallbackArg;
}
struct CERT_SELECT_CHAIN_PARA
{
    HCERTCHAINENGINE hChainEngine;
    FILETIME* pTime;
    HCERTSTORE hAdditionalStore;
    CERT_CHAIN_PARA* pChainPara;
    uint dwFlags;
}
struct CERT_SELECT_CRITERIA
{
    CERT_SELECT_CRITERIA_TYPE dwType;
    uint cPara;
    void** ppPara;
}
struct CRYPT_TIMESTAMP_REQUEST
{
    CRYPT_TIMESTAMP_VERSION dwVersion;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_INTEGER_BLOB HashedMessage;
    PSTR pszTSAPolicyId;
    CRYPT_INTEGER_BLOB Nonce;
    BOOL fCertReq;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CRYPT_TIMESTAMP_RESPONSE
{
    CRYPT_TIMESTAMP_RESPONSE_STATUS dwStatus;
    uint cFreeText;
    PWSTR* rgFreeText;
    CRYPT_BIT_BLOB FailureInfo;
    CRYPT_INTEGER_BLOB ContentInfo;
}
struct CRYPT_TIMESTAMP_ACCURACY
{
    uint dwSeconds;
    uint dwMillis;
    uint dwMicros;
}
struct CRYPT_TIMESTAMP_INFO
{
    uint dwVersion;
    PSTR pszTSAPolicyId;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_INTEGER_BLOB HashedMessage;
    CRYPT_INTEGER_BLOB SerialNumber;
    FILETIME ftTime;
    CRYPT_TIMESTAMP_ACCURACY* pvAccuracy;
    BOOL fOrdering;
    CRYPT_INTEGER_BLOB Nonce;
    CRYPT_INTEGER_BLOB Tsa;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
struct CRYPT_TIMESTAMP_CONTEXT
{
    uint cbEncoded;
    ubyte* pbEncoded;
    CRYPT_TIMESTAMP_INFO* pTimeStamp;
}
struct CRYPT_TIMESTAMP_PARA
{
    const(char)* pszTSAPolicyId;
    BOOL fRequestCerts;
    CRYPT_INTEGER_BLOB Nonce;
    uint cExtension;
    CERT_EXTENSION* rgExtension;
}
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH = BOOL function(void*, CRYPT_INTEGER_BLOB**, uint);
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET = BOOL function(void*, CRYPT_INTEGER_BLOB*, uint, CRYPT_INTEGER_BLOB*, ubyte**, uint*, PWSTR*, CRYPT_INTEGER_BLOB**);
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE = void function(CRYPT_OBJECT_LOCATOR_RELEASE_REASON, void*);
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD = void function(void*, const(wchar)*);
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE = void function(void*, ubyte*);
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER = void function(void*, CRYPT_INTEGER_BLOB*);
struct CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE
{
    uint cbSize;
    PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET pfnGet;
    PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE pfnRelease;
    PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD pfnFreePassword;
    PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE pfnFree;
    PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER pfnFreeIdentifier;
}
alias PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE = BOOL function(PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH, void*, uint*, CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE**, void**);
alias PFN_CERT_IS_WEAK_HASH = BOOL function(uint, const(wchar)*, uint, CERT_CHAIN_CONTEXT*, FILETIME*, const(wchar)*);
struct CRYPTPROTECT_PROMPTSTRUCT
{
    uint cbSize;
    uint dwPromptFlags;
    HWND hwndApp;
    const(wchar)* szPrompt;
}
alias PFNCryptStreamOutputCallback = HRESULT function(void*, const(ubyte)*, ulong, BOOL);
struct NCRYPT_PROTECT_STREAM_INFO
{
    PFNCryptStreamOutputCallback pfnStreamOutput;
    void* pvCallbackCtxt;
}
alias PFNCryptStreamOutputCallbackEx = HRESULT function(void*, const(ubyte)*, ulong, NCRYPT_DESCRIPTOR_HANDLE, BOOL);
struct NCRYPT_PROTECT_STREAM_INFO_EX
{
    PFNCryptStreamOutputCallbackEx pfnStreamOutput;
    void* pvCallbackCtxt;
}
alias CRYPT_XML_CHARSET = int;
enum : int
{
    CRYPT_XML_CHARSET_AUTO    = 0x00000000,
    CRYPT_XML_CHARSET_UTF8    = 0x00000001,
    CRYPT_XML_CHARSET_UTF16LE = 0x00000002,
    CRYPT_XML_CHARSET_UTF16BE = 0x00000003,
}

struct CRYPT_XML_BLOB
{
    CRYPT_XML_CHARSET dwCharset;
    uint cbData;
    ubyte* pbData;
}
struct CRYPT_XML_DATA_BLOB
{
    uint cbData;
    ubyte* pbData;
}
alias CRYPT_XML_PROPERTY_ID = int;
enum : int
{
    CRYPT_XML_PROPERTY_MAX_HEAP_SIZE      = 0x00000001,
    CRYPT_XML_PROPERTY_SIGNATURE_LOCATION = 0x00000002,
    CRYPT_XML_PROPERTY_MAX_SIGNATURES     = 0x00000003,
    CRYPT_XML_PROPERTY_DOC_DECLARATION    = 0x00000004,
    CRYPT_XML_PROPERTY_XML_OUTPUT_CHARSET = 0x00000005,
}

struct CRYPT_XML_PROPERTY
{
    CRYPT_XML_PROPERTY_ID dwPropId;
    const(void)* pvValue;
    uint cbValue;
}
alias PFN_CRYPT_XML_WRITE_CALLBACK = HRESULT function(void*, const(ubyte)*, uint);
alias PFN_CRYPT_XML_DATA_PROVIDER_READ = HRESULT function(void*, ubyte*, uint, uint*);
alias PFN_CRYPT_XML_DATA_PROVIDER_CLOSE = HRESULT function(void*);
struct CRYPT_XML_DATA_PROVIDER
{
    void* pvCallbackState;
    uint cbBufferSize;
    PFN_CRYPT_XML_DATA_PROVIDER_READ pfnRead;
    PFN_CRYPT_XML_DATA_PROVIDER_CLOSE pfnClose;
}
alias PFN_CRYPT_XML_CREATE_TRANSFORM = HRESULT function(const(CRYPT_XML_ALGORITHM)*, CRYPT_XML_DATA_PROVIDER*, CRYPT_XML_DATA_PROVIDER*);
struct CRYPT_XML_STATUS
{
    uint cbSize;
    CRYPT_XML_STATUS_ERROR_STATUS dwErrorStatus;
    CRYPT_XML_STATUS_INFO_STATUS dwInfoStatus;
}
struct CRYPT_XML_ALGORITHM
{
    uint cbSize;
    const(wchar)* wszAlgorithm;
    CRYPT_XML_BLOB Encoded;
}
struct CRYPT_XML_TRANSFORM_INFO
{
    uint cbSize;
    const(wchar)* wszAlgorithm;
    uint cbBufferSize;
    CRYPT_XML_TRANSFORM_FLAGS dwFlags;
    PFN_CRYPT_XML_CREATE_TRANSFORM pfnCreateTransform;
}
struct CRYPT_XML_TRANSFORM_CHAIN_CONFIG
{
    uint cbSize;
    uint cTransformInfo;
    CRYPT_XML_TRANSFORM_INFO** rgpTransformInfo;
}
struct CRYPT_XML_KEY_DSA_KEY_VALUE
{
    CRYPT_XML_DATA_BLOB P;
    CRYPT_XML_DATA_BLOB Q;
    CRYPT_XML_DATA_BLOB G;
    CRYPT_XML_DATA_BLOB Y;
    CRYPT_XML_DATA_BLOB J;
    CRYPT_XML_DATA_BLOB Seed;
    CRYPT_XML_DATA_BLOB Counter;
}
struct CRYPT_XML_KEY_ECDSA_KEY_VALUE
{
    const(wchar)* wszNamedCurve;
    CRYPT_XML_DATA_BLOB X;
    CRYPT_XML_DATA_BLOB Y;
    CRYPT_XML_BLOB ExplicitPara;
}
struct CRYPT_XML_KEY_RSA_KEY_VALUE
{
    CRYPT_XML_DATA_BLOB Modulus;
    CRYPT_XML_DATA_BLOB Exponent;
}
struct CRYPT_XML_KEY_VALUE
{
    CRYPT_XML_KEY_VALUE_TYPE dwType;
    union
    {
        CRYPT_XML_KEY_DSA_KEY_VALUE DSAKeyValue;
        CRYPT_XML_KEY_RSA_KEY_VALUE RSAKeyValue;
        CRYPT_XML_KEY_ECDSA_KEY_VALUE ECDSAKeyValue;
        CRYPT_XML_BLOB Custom;
    }
}
struct CRYPT_XML_ISSUER_SERIAL
{
    const(wchar)* wszIssuer;
    const(wchar)* wszSerial;
}
struct CRYPT_XML_X509DATA_ITEM
{
    CRYPT_XML_X509DATA_TYPE dwType;
    union
    {
        CRYPT_XML_ISSUER_SERIAL IssuerSerial;
        CRYPT_XML_DATA_BLOB SKI;
        const(wchar)* wszSubjectName;
        CRYPT_XML_DATA_BLOB Certificate;
        CRYPT_XML_DATA_BLOB CRL;
        CRYPT_XML_BLOB Custom;
    }
}
struct CRYPT_XML_X509DATA
{
    uint cX509Data;
    CRYPT_XML_X509DATA_ITEM* rgX509Data;
}
struct CRYPT_XML_KEY_INFO_ITEM
{
    CRYPT_XML_KEYINFO_TYPE dwType;
    union
    {
        const(wchar)* wszKeyName;
        CRYPT_XML_KEY_VALUE KeyValue;
        CRYPT_XML_BLOB RetrievalMethod;
        CRYPT_XML_X509DATA X509Data;
        CRYPT_XML_BLOB Custom;
    }
}
struct CRYPT_XML_KEY_INFO
{
    uint cbSize;
    const(wchar)* wszId;
    uint cKeyInfo;
    CRYPT_XML_KEY_INFO_ITEM* rgKeyInfo;
    BCRYPT_KEY_HANDLE hVerifyKey;
}
struct CRYPT_XML_REFERENCE
{
    uint cbSize;
    void* hReference;
    const(wchar)* wszId;
    const(wchar)* wszUri;
    const(wchar)* wszType;
    CRYPT_XML_ALGORITHM DigestMethod;
    CRYPT_INTEGER_BLOB DigestValue;
    uint cTransform;
    CRYPT_XML_ALGORITHM* rgTransform;
}
struct CRYPT_XML_REFERENCES
{
    uint cReference;
    CRYPT_XML_REFERENCE** rgpReference;
}
struct CRYPT_XML_SIGNED_INFO
{
    uint cbSize;
    const(wchar)* wszId;
    CRYPT_XML_ALGORITHM Canonicalization;
    CRYPT_XML_ALGORITHM SignatureMethod;
    uint cReference;
    CRYPT_XML_REFERENCE** rgpReference;
    CRYPT_XML_BLOB Encoded;
}
struct CRYPT_XML_OBJECT
{
    uint cbSize;
    void* hObject;
    const(wchar)* wszId;
    const(wchar)* wszMimeType;
    const(wchar)* wszEncoding;
    CRYPT_XML_REFERENCES Manifest;
    CRYPT_XML_BLOB Encoded;
}
struct CRYPT_XML_SIGNATURE
{
    uint cbSize;
    void* hSignature;
    const(wchar)* wszId;
    CRYPT_XML_SIGNED_INFO SignedInfo;
    CRYPT_INTEGER_BLOB SignatureValue;
    CRYPT_XML_KEY_INFO* pKeyInfo;
    uint cObject;
    CRYPT_XML_OBJECT** rgpObject;
}
struct CRYPT_XML_DOC_CTXT
{
    uint cbSize;
    void* hDocCtxt;
    CRYPT_XML_TRANSFORM_CHAIN_CONFIG* pTransformsConfig;
    uint cSignature;
    CRYPT_XML_SIGNATURE** rgpSignature;
}
struct CRYPT_XML_KEYINFO_PARAM
{
    const(wchar)* wszId;
    const(wchar)* wszKeyName;
    CRYPT_INTEGER_BLOB SKI;
    const(wchar)* wszSubjectName;
    uint cCertificate;
    CRYPT_INTEGER_BLOB* rgCertificate;
    uint cCRL;
    CRYPT_INTEGER_BLOB* rgCRL;
}
alias CRYPT_XML_KEYINFO_SPEC = int;
enum : int
{
    CRYPT_XML_KEYINFO_SPEC_NONE    = 0x00000000,
    CRYPT_XML_KEYINFO_SPEC_ENCODED = 0x00000001,
    CRYPT_XML_KEYINFO_SPEC_PARAM   = 0x00000002,
}

struct CRYPT_XML_ALGORITHM_INFO
{
    uint cbSize;
    PWSTR wszAlgorithmURI;
    PWSTR wszName;
    CRYPT_XML_GROUP_ID dwGroupId;
    PWSTR wszCNGAlgid;
    PWSTR wszCNGExtraAlgid;
    uint dwSignFlags;
    uint dwVerifyFlags;
    void* pvPaddingInfo;
    void* pvExtraInfo;
}
alias PFN_CRYPT_XML_ENUM_ALG_INFO = BOOL function(const(CRYPT_XML_ALGORITHM_INFO)*, void*);
alias CryptXmlDllGetInterface = HRESULT function(uint, const(CRYPT_XML_ALGORITHM_INFO)*, CRYPT_XML_CRYPTOGRAPHIC_INTERFACE*);
alias CryptXmlDllEncodeAlgorithm = HRESULT function(const(CRYPT_XML_ALGORITHM_INFO)*, CRYPT_XML_CHARSET, void*, PFN_CRYPT_XML_WRITE_CALLBACK);
alias CryptXmlDllCreateDigest = HRESULT function(const(CRYPT_XML_ALGORITHM)*, uint*, void**);
alias CryptXmlDllDigestData = HRESULT function(void*, const(ubyte)*, uint);
alias CryptXmlDllFinalizeDigest = HRESULT function(void*, ubyte*, uint);
alias CryptXmlDllCloseDigest = HRESULT function(void*);
alias CryptXmlDllSignData = HRESULT function(const(CRYPT_XML_ALGORITHM)*, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, uint, const(ubyte)*, uint, ubyte*, uint, uint*);
alias CryptXmlDllVerifySignature = HRESULT function(const(CRYPT_XML_ALGORITHM)*, BCRYPT_KEY_HANDLE, const(ubyte)*, uint, const(ubyte)*, uint);
alias CryptXmlDllGetAlgorithmInfo = HRESULT function(const(CRYPT_XML_ALGORITHM)*, CRYPT_XML_ALGORITHM_INFO**);
struct CRYPT_XML_CRYPTOGRAPHIC_INTERFACE
{
    uint cbSize;
    CryptXmlDllEncodeAlgorithm fpCryptXmlEncodeAlgorithm;
    CryptXmlDllCreateDigest fpCryptXmlCreateDigest;
    CryptXmlDllDigestData fpCryptXmlDigestData;
    CryptXmlDllFinalizeDigest fpCryptXmlFinalizeDigest;
    CryptXmlDllCloseDigest fpCryptXmlCloseDigest;
    CryptXmlDllSignData fpCryptXmlSignData;
    CryptXmlDllVerifySignature fpCryptXmlVerifySignature;
    CryptXmlDllGetAlgorithmInfo fpCryptXmlGetAlgorithmInfo;
}
alias CryptXmlDllEncodeKeyValue = HRESULT function(NCRYPT_KEY_HANDLE, CRYPT_XML_CHARSET, void*, PFN_CRYPT_XML_WRITE_CALLBACK);
alias CryptXmlDllCreateKey = HRESULT function(const(CRYPT_XML_BLOB)*, BCRYPT_KEY_HANDLE*);
alias HandleType = int;
enum : int
{
    Asymmetric = 0x00000001,
    Symmetric  = 0x00000002,
    Transform  = 0x00000003,
    Hash       = 0x00000004,
}

alias PaddingMode = int;
enum : int
{
    None     = 0x00000001,
    PKCS7    = 0x00000002,
    Zeros    = 0x00000003,
    ANSIX923 = 0x00000004,
    ISO10126 = 0x00000005,
}

alias Direction = int;
enum : int
{
    DirectionEncrypt = 0x00000001,
    DirectionDecrypt = 0x00000002,
}

struct INFORMATIONCARD_ASYMMETRIC_CRYPTO_PARAMETERS
{
    int keySize;
    PWSTR keyExchangeAlgorithm;
    PWSTR signatureAlgorithm;
}
struct INFORMATIONCARD_SYMMETRIC_CRYPTO_PARAMETERS
{
    int keySize;
    int blockSize;
    int feedbackSize;
}
struct INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS
{
    int inputBlockSize;
    int outputBlockSize;
    BOOL canTransformMultipleBlocks;
    BOOL canReuseTransform;
}
struct INFORMATIONCARD_HASH_CRYPTO_PARAMETERS
{
    int hashSize;
    INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS transform;
}
struct INFORMATIONCARD_CRYPTO_HANDLE
{
    HandleType type;
    long expiration;
    void* cryptoParameters;
}
struct GENERIC_XML_TOKEN
{
    align (1):
    FILETIME createDate;
    FILETIME expiryDate;
    PWSTR xmlToken;
    PWSTR internalTokenReference;
    PWSTR externalTokenReference;
}
struct POLICY_ELEMENT
{
    const(wchar)* targetEndpointAddress;
    const(wchar)* issuerEndpointAddress;
    const(wchar)* issuedTokenParameters;
    const(wchar)* privacyNoticeLink;
    uint privacyNoticeVersion;
    BOOL useManagedPresentation;
}
struct ENDPOINTADDRESS
{
    const(wchar)* serviceUrl;
    const(wchar)* policyUrl;
    CRYPT_INTEGER_BLOB rawCertificate;
}
struct ENDPOINTADDRESS2
{
    const(wchar)* serviceUrl;
    const(wchar)* policyUrl;
    uint identityType;
    void* identityBytes;
}
struct CERTIFICATE_CHAIN_BLOB
{
    uint certCount;
    CRYPT_INTEGER_BLOB* rawCertificates;
}
struct CLAIMLIST
{
    uint count;
    PWSTR* claims;
}
struct RECIPIENTPOLICY
{
    ENDPOINTADDRESS recipient;
    ENDPOINTADDRESS issuer;
    const(wchar)* tokenType;
    CLAIMLIST requiredClaims;
    CLAIMLIST optionalClaims;
    const(wchar)* privacyUrl;
    uint privacyVersion;
}
struct RECIPIENTPOLICY2
{
    ENDPOINTADDRESS2 recipient;
    ENDPOINTADDRESS2 issuer;
    const(wchar)* tokenType;
    CLAIMLIST requiredClaims;
    CLAIMLIST optionalClaims;
    const(wchar)* privacyUrl;
    uint privacyVersion;
}
enum CLSID_CCertSrvSetupKeyInformation = GUID(0x38373906, 0x5433, 0x4633, [0xb0, 0xfb, 0x29, 0xb7, 0xe7, 0x82, 0x62, 0xe1]);
struct CCertSrvSetupKeyInformation
{
}
enum CLSID_CCertSrvSetup = GUID(0x961f180f, 0xf55c, 0x413d, [0xa9, 0xb3, 0x7d, 0x2a, 0xf4, 0xd8, 0xe4, 0x2f]);
struct CCertSrvSetup
{
}
enum CLSID_CMSCEPSetup = GUID(0xaa4f5c02, 0x8e7c, 0x49c4, [0x94, 0xfa, 0x67, 0xa5, 0xcc, 0x5e, 0xad, 0xb4]);
struct CMSCEPSetup
{
}
enum CLSID_CCertificateEnrollmentServerSetup = GUID(0x9902f3bc, 0x88af, 0x4cf8, [0xae, 0x62, 0x71, 0x40, 0x53, 0x15, 0x52, 0xb6]);
struct CCertificateEnrollmentServerSetup
{
}
enum CLSID_CCertificateEnrollmentPolicyServerSetup = GUID(0xafe2fa32, 0x41b1, 0x459d, [0xa5, 0xde, 0x49, 0xad, 0xd8, 0xa7, 0x21, 0x82]);
struct CCertificateEnrollmentPolicyServerSetup
{
}
enum IID_ICertSrvSetupKeyInformation = GUID(0x6ba73778, 0x36da, 0x4c39, [0x8a, 0x85, 0xbc, 0xfa, 0x7d, 0x0, 0x7, 0x93]);
interface ICertSrvSetupKeyInformation : IDispatch
{
    HRESULT get_ProviderName(BSTR*);
    HRESULT put_ProviderName(const(BSTR));
    HRESULT get_Length(int*);
    HRESULT put_Length(int);
    HRESULT get_Existing(VARIANT_BOOL*);
    HRESULT put_Existing(VARIANT_BOOL);
    HRESULT get_ContainerName(BSTR*);
    HRESULT put_ContainerName(const(BSTR));
    HRESULT get_HashAlgorithm(BSTR*);
    HRESULT put_HashAlgorithm(const(BSTR));
    HRESULT get_ExistingCACertificate(VARIANT*);
    HRESULT put_ExistingCACertificate(VARIANT);
}
enum IID_ICertSrvSetupKeyInformationCollection = GUID(0xe65c8b00, 0xe58f, 0x41f9, [0xa9, 0xec, 0xa2, 0x8d, 0x74, 0x27, 0xc8, 0x44]);
interface ICertSrvSetupKeyInformationCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get_Count(int*);
    HRESULT Add(ICertSrvSetupKeyInformation);
}
alias CASetupProperty = int;
enum : int
{
    ENUM_SETUPPROP_INVALID            = 0xffffffff,
    ENUM_SETUPPROP_CATYPE             = 0x00000000,
    ENUM_SETUPPROP_CAKEYINFORMATION   = 0x00000001,
    ENUM_SETUPPROP_INTERACTIVE        = 0x00000002,
    ENUM_SETUPPROP_CANAME             = 0x00000003,
    ENUM_SETUPPROP_CADSSUFFIX         = 0x00000004,
    ENUM_SETUPPROP_VALIDITYPERIOD     = 0x00000005,
    ENUM_SETUPPROP_VALIDITYPERIODUNIT = 0x00000006,
    ENUM_SETUPPROP_EXPIRATIONDATE     = 0x00000007,
    ENUM_SETUPPROP_PRESERVEDATABASE   = 0x00000008,
    ENUM_SETUPPROP_DATABASEDIRECTORY  = 0x00000009,
    ENUM_SETUPPROP_LOGDIRECTORY       = 0x0000000a,
    ENUM_SETUPPROP_SHAREDFOLDER       = 0x0000000b,
    ENUM_SETUPPROP_PARENTCAMACHINE    = 0x0000000c,
    ENUM_SETUPPROP_PARENTCANAME       = 0x0000000d,
    ENUM_SETUPPROP_REQUESTFILE        = 0x0000000e,
    ENUM_SETUPPROP_WEBCAMACHINE       = 0x0000000f,
    ENUM_SETUPPROP_WEBCANAME          = 0x00000010,
}

enum IID_ICertSrvSetup = GUID(0xb760a1bb, 0x4784, 0x44c0, [0x8f, 0x12, 0x55, 0x5f, 0x7, 0x80, 0xff, 0x25]);
interface ICertSrvSetup : IDispatch
{
    HRESULT get_CAErrorId(int*);
    HRESULT get_CAErrorString(BSTR*);
    HRESULT InitializeDefaults(VARIANT_BOOL, VARIANT_BOOL);
    HRESULT GetCASetupProperty(CASetupProperty, VARIANT*);
    HRESULT SetCASetupProperty(CASetupProperty, VARIANT*);
    HRESULT IsPropertyEditable(CASetupProperty, VARIANT_BOOL*);
    HRESULT GetSupportedCATypes(VARIANT*);
    HRESULT GetProviderNameList(VARIANT*);
    HRESULT GetKeyLengthList(const(BSTR), VARIANT*);
    HRESULT GetHashAlgorithmList(const(BSTR), VARIANT*);
    HRESULT GetPrivateKeyContainerList(const(BSTR), VARIANT*);
    HRESULT GetExistingCACertificates(ICertSrvSetupKeyInformationCollection*);
    HRESULT CAImportPFX(const(BSTR), const(BSTR), VARIANT_BOOL, ICertSrvSetupKeyInformation*);
    HRESULT SetCADistinguishedName(const(BSTR), VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL);
    HRESULT SetDatabaseInformation(const(BSTR), const(BSTR), const(BSTR), VARIANT_BOOL);
    HRESULT SetParentCAInformation(const(BSTR));
    HRESULT SetWebCAInformation(const(BSTR));
    HRESULT Install();
    HRESULT PreUnInstall(VARIANT_BOOL);
    HRESULT PostUnInstall();
}
alias MSCEPSetupProperty = int;
enum : int
{
    ENUM_CEPSETUPPROP_USELOCALSYSTEM         = 0x00000000,
    ENUM_CEPSETUPPROP_USECHALLENGE           = 0x00000001,
    ENUM_CEPSETUPPROP_RANAME_CN              = 0x00000002,
    ENUM_CEPSETUPPROP_RANAME_EMAIL           = 0x00000003,
    ENUM_CEPSETUPPROP_RANAME_COMPANY         = 0x00000004,
    ENUM_CEPSETUPPROP_RANAME_DEPT            = 0x00000005,
    ENUM_CEPSETUPPROP_RANAME_CITY            = 0x00000006,
    ENUM_CEPSETUPPROP_RANAME_STATE           = 0x00000007,
    ENUM_CEPSETUPPROP_RANAME_COUNTRY         = 0x00000008,
    ENUM_CEPSETUPPROP_SIGNINGKEYINFORMATION  = 0x00000009,
    ENUM_CEPSETUPPROP_EXCHANGEKEYINFORMATION = 0x0000000a,
    ENUM_CEPSETUPPROP_CAINFORMATION          = 0x0000000b,
    ENUM_CEPSETUPPROP_MSCEPURL               = 0x0000000c,
    ENUM_CEPSETUPPROP_CHALLENGEURL           = 0x0000000d,
}

enum IID_IMSCEPSetup = GUID(0x4f7761bb, 0x9f3b, 0x4592, [0x9e, 0xe0, 0x9a, 0x73, 0x25, 0x9c, 0x31, 0x3e]);
interface IMSCEPSetup : IDispatch
{
    HRESULT get_MSCEPErrorId(int*);
    HRESULT get_MSCEPErrorString(BSTR*);
    HRESULT InitializeDefaults();
    HRESULT GetMSCEPSetupProperty(MSCEPSetupProperty, VARIANT*);
    HRESULT SetMSCEPSetupProperty(MSCEPSetupProperty, VARIANT*);
    HRESULT SetAccountInformation(const(BSTR), const(BSTR));
    HRESULT IsMSCEPStoreEmpty(VARIANT_BOOL*);
    HRESULT GetProviderNameList(VARIANT_BOOL, VARIANT*);
    HRESULT GetKeyLengthList(VARIANT_BOOL, const(BSTR), VARIANT*);
    HRESULT Install();
    HRESULT PreUnInstall();
    HRESULT PostUnInstall();
}
alias CESSetupProperty = int;
enum : int
{
    ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY = 0x00000000,
    ENUM_CESSETUPPROP_CACONFIG               = 0x00000001,
    ENUM_CESSETUPPROP_AUTHENTICATION         = 0x00000002,
    ENUM_CESSETUPPROP_SSLCERTHASH            = 0x00000003,
    ENUM_CESSETUPPROP_URL                    = 0x00000004,
    ENUM_CESSETUPPROP_RENEWALONLY            = 0x00000005,
    ENUM_CESSETUPPROP_ALLOW_KEYBASED_RENEWAL = 0x00000006,
}

enum IID_ICertificateEnrollmentServerSetup = GUID(0x70027fdb, 0x9dd9, 0x4921, [0x89, 0x44, 0xb3, 0x5c, 0xb3, 0x1b, 0xd2, 0xec]);
interface ICertificateEnrollmentServerSetup : IDispatch
{
    HRESULT get_ErrorString(BSTR*);
    HRESULT InitializeInstallDefaults();
    HRESULT GetProperty(CESSetupProperty, VARIANT*);
    HRESULT SetProperty(CESSetupProperty, VARIANT*);
    HRESULT SetApplicationPoolCredentials(const(BSTR), const(BSTR));
    HRESULT Install();
    HRESULT UnInstall(VARIANT*, VARIANT*);
}
alias CEPSetupProperty = int;
enum : int
{
    ENUM_CEPSETUPPROP_AUTHENTICATION   = 0x00000000,
    ENUM_CEPSETUPPROP_SSLCERTHASH      = 0x00000001,
    ENUM_CEPSETUPPROP_URL              = 0x00000002,
    ENUM_CEPSETUPPROP_KEYBASED_RENEWAL = 0x00000003,
}

enum IID_ICertificateEnrollmentPolicyServerSetup = GUID(0x859252cc, 0x238c, 0x4a88, [0xb8, 0xfd, 0xa3, 0x7e, 0x7d, 0x4, 0xe6, 0x8b]);
interface ICertificateEnrollmentPolicyServerSetup : IDispatch
{
    HRESULT get_ErrorString(BSTR*);
    HRESULT InitializeInstallDefaults();
    HRESULT GetProperty(CEPSetupProperty, VARIANT*);
    HRESULT SetProperty(CEPSetupProperty, VARIANT*);
    HRESULT Install();
    HRESULT UnInstall(VARIANT*);
}
