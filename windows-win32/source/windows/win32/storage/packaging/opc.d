module windows.win32.storage.packaging.opc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.security.cryptography_ : CERT_CONTEXT;
import windows.win32.system.com_ : IStream, IUnknown, IUri;

version (Windows):
extern (Windows):

enum OPC_E_NONCONFORMING_URI = 0xffffffff80510001;
enum OPC_E_RELATIVE_URI_REQUIRED = 0xffffffff80510002;
enum OPC_E_RELATIONSHIP_URI_REQUIRED = 0xffffffff80510003;
enum OPC_E_PART_CANNOT_BE_DIRECTORY = 0xffffffff80510004;
enum OPC_E_UNEXPECTED_CONTENT_TYPE = 0xffffffff80510005;
enum OPC_E_INVALID_CONTENT_TYPE_XML = 0xffffffff80510006;
enum OPC_E_MISSING_CONTENT_TYPES = 0xffffffff80510007;
enum OPC_E_NONCONFORMING_CONTENT_TYPES_XML = 0xffffffff80510008;
enum OPC_E_NONCONFORMING_RELS_XML = 0xffffffff80510009;
enum OPC_E_INVALID_RELS_XML = 0xffffffff8051000a;
enum OPC_E_DUPLICATE_PART = 0xffffffff8051000b;
enum OPC_E_INVALID_OVERRIDE_PART_NAME = 0xffffffff8051000c;
enum OPC_E_DUPLICATE_OVERRIDE_PART = 0xffffffff8051000d;
enum OPC_E_INVALID_DEFAULT_EXTENSION = 0xffffffff8051000e;
enum OPC_E_DUPLICATE_DEFAULT_EXTENSION = 0xffffffff8051000f;
enum OPC_E_INVALID_RELATIONSHIP_ID = 0xffffffff80510010;
enum OPC_E_INVALID_RELATIONSHIP_TYPE = 0xffffffff80510011;
enum OPC_E_INVALID_RELATIONSHIP_TARGET = 0xffffffff80510012;
enum OPC_E_DUPLICATE_RELATIONSHIP = 0xffffffff80510013;
enum OPC_E_CONFLICTING_SETTINGS = 0xffffffff80510014;
enum OPC_E_DUPLICATE_PIECE = 0xffffffff80510015;
enum OPC_E_INVALID_PIECE = 0xffffffff80510016;
enum OPC_E_MISSING_PIECE = 0xffffffff80510017;
enum OPC_E_NO_SUCH_PART = 0xffffffff80510018;
enum OPC_E_DS_SIGNATURE_CORRUPT = 0xffffffff80510019;
enum OPC_E_DS_DIGEST_VALUE_ERROR = 0xffffffff8051001a;
enum OPC_E_DS_DUPLICATE_SIGNATURE_ORIGIN_RELATIONSHIP = 0xffffffff8051001b;
enum OPC_E_DS_INVALID_SIGNATURE_ORIGIN_RELATIONSHIP = 0xffffffff8051001c;
enum OPC_E_DS_INVALID_CERTIFICATE_RELATIONSHIP = 0xffffffff8051001d;
enum OPC_E_DS_EXTERNAL_SIGNATURE = 0xffffffff8051001e;
enum OPC_E_DS_MISSING_SIGNATURE_ORIGIN_PART = 0xffffffff8051001f;
enum OPC_E_DS_MISSING_SIGNATURE_PART = 0xffffffff80510020;
enum OPC_E_DS_INVALID_RELATIONSHIP_TRANSFORM_XML = 0xffffffff80510021;
enum OPC_E_DS_INVALID_CANONICALIZATION_METHOD = 0xffffffff80510022;
enum OPC_E_DS_INVALID_RELATIONSHIPS_SIGNING_OPTION = 0xffffffff80510023;
enum OPC_E_DS_INVALID_OPC_SIGNATURE_TIME_FORMAT = 0xffffffff80510024;
enum OPC_E_DS_PACKAGE_REFERENCE_URI_RESERVED = 0xffffffff80510025;
enum OPC_E_DS_MISSING_SIGNATURE_PROPERTIES_ELEMENT = 0xffffffff80510026;
enum OPC_E_DS_MISSING_SIGNATURE_PROPERTY_ELEMENT = 0xffffffff80510027;
enum OPC_E_DS_DUPLICATE_SIGNATURE_PROPERTY_ELEMENT = 0xffffffff80510028;
enum OPC_E_DS_MISSING_SIGNATURE_TIME_PROPERTY = 0xffffffff80510029;
enum OPC_E_DS_INVALID_SIGNATURE_XML = 0xffffffff8051002a;
enum OPC_E_DS_INVALID_SIGNATURE_COUNT = 0xffffffff8051002b;
enum OPC_E_DS_MISSING_SIGNATURE_ALGORITHM = 0xffffffff8051002c;
enum OPC_E_DS_DUPLICATE_PACKAGE_OBJECT_REFERENCES = 0xffffffff8051002d;
enum OPC_E_DS_MISSING_PACKAGE_OBJECT_REFERENCE = 0xffffffff8051002e;
enum OPC_E_DS_EXTERNAL_SIGNATURE_REFERENCE = 0xffffffff8051002f;
enum OPC_E_DS_REFERENCE_MISSING_CONTENT_TYPE = 0xffffffff80510030;
enum OPC_E_DS_MULTIPLE_RELATIONSHIP_TRANSFORMS = 0xffffffff80510031;
enum OPC_E_DS_MISSING_CANONICALIZATION_TRANSFORM = 0xffffffff80510032;
enum OPC_E_MC_UNEXPECTED_ELEMENT = 0xffffffff80510033;
enum OPC_E_MC_UNEXPECTED_REQUIRES_ATTR = 0xffffffff80510034;
enum OPC_E_MC_MISSING_REQUIRES_ATTR = 0xffffffff80510035;
enum OPC_E_MC_UNEXPECTED_ATTR = 0xffffffff80510036;
enum OPC_E_MC_INVALID_PREFIX_LIST = 0xffffffff80510037;
enum OPC_E_MC_INVALID_QNAME_LIST = 0xffffffff80510038;
enum OPC_E_MC_NESTED_ALTERNATE_CONTENT = 0xffffffff80510039;
enum OPC_E_MC_UNEXPECTED_CHOICE = 0xffffffff8051003a;
enum OPC_E_MC_MISSING_CHOICE = 0xffffffff8051003b;
enum OPC_E_MC_INVALID_ENUM_TYPE = 0xffffffff8051003c;
enum OPC_E_MC_UNKNOWN_NAMESPACE = 0xffffffff8051003e;
enum OPC_E_MC_UNKNOWN_PREFIX = 0xffffffff8051003f;
enum OPC_E_MC_INVALID_ATTRIBUTES_ON_IGNORABLE_ELEMENT = 0xffffffff80510040;
enum OPC_E_MC_INVALID_XMLNS_ATTRIBUTE = 0xffffffff80510041;
enum OPC_E_INVALID_XML_ENCODING = 0xffffffff80510042;
enum OPC_E_DS_SIGNATURE_REFERENCE_MISSING_URI = 0xffffffff80510043;
enum OPC_E_INVALID_CONTENT_TYPE = 0xffffffff80510044;
enum OPC_E_DS_SIGNATURE_PROPERTY_MISSING_TARGET = 0xffffffff80510045;
enum OPC_E_DS_SIGNATURE_METHOD_NOT_SET = 0xffffffff80510046;
enum OPC_E_DS_DEFAULT_DIGEST_METHOD_NOT_SET = 0xffffffff80510047;
enum OPC_E_NO_SUCH_RELATIONSHIP = 0xffffffff80510048;
enum OPC_E_MC_MULTIPLE_FALLBACK_ELEMENTS = 0xffffffff80510049;
enum OPC_E_MC_INCONSISTENT_PROCESS_CONTENT = 0xffffffff8051004a;
enum OPC_E_MC_INCONSISTENT_PRESERVE_ATTRIBUTES = 0xffffffff8051004b;
enum OPC_E_MC_INCONSISTENT_PRESERVE_ELEMENTS = 0xffffffff8051004c;
enum OPC_E_INVALID_RELATIONSHIP_TARGET_MODE = 0xffffffff8051004d;
enum OPC_E_COULD_NOT_RECOVER = 0xffffffff8051004e;
enum OPC_E_UNSUPPORTED_PACKAGE = 0xffffffff8051004f;
enum OPC_E_ENUM_COLLECTION_CHANGED = 0xffffffff80510050;
enum OPC_E_ENUM_CANNOT_MOVE_NEXT = 0xffffffff80510051;
enum OPC_E_ENUM_CANNOT_MOVE_PREVIOUS = 0xffffffff80510052;
enum OPC_E_ENUM_INVALID_POSITION = 0xffffffff80510053;
enum OPC_E_DS_SIGNATURE_ORIGIN_EXISTS = 0xffffffff80510054;
enum OPC_E_DS_UNSIGNED_PACKAGE = 0xffffffff80510055;
enum OPC_E_DS_MISSING_CERTIFICATE_PART = 0xffffffff80510056;
enum OPC_E_NO_SUCH_SETTINGS = 0xffffffff80510057;
enum OPC_E_ZIP_INCORRECT_DATA_SIZE = 0xffffffff80511001;
enum OPC_E_ZIP_CORRUPTED_ARCHIVE = 0xffffffff80511002;
enum OPC_E_ZIP_COMPRESSION_FAILED = 0xffffffff80511003;
enum OPC_E_ZIP_DECOMPRESSION_FAILED = 0xffffffff80511004;
enum OPC_E_ZIP_INCONSISTENT_FILEITEM = 0xffffffff80511005;
enum OPC_E_ZIP_INCONSISTENT_DIRECTORY = 0xffffffff80511006;
enum OPC_E_ZIP_MISSING_DATA_DESCRIPTOR = 0xffffffff80511007;
enum OPC_E_ZIP_UNSUPPORTEDARCHIVE = 0xffffffff80511008;
enum OPC_E_ZIP_CENTRAL_DIRECTORY_TOO_LARGE = 0xffffffff80511009;
enum OPC_E_ZIP_NAME_TOO_LARGE = 0xffffffff8051100a;
enum OPC_E_ZIP_DUPLICATE_NAME = 0xffffffff8051100b;
enum OPC_E_ZIP_COMMENT_TOO_LARGE = 0xffffffff8051100c;
enum OPC_E_ZIP_EXTRA_FIELDS_TOO_LARGE = 0xffffffff8051100d;
enum OPC_E_ZIP_FILE_HEADER_TOO_LARGE = 0xffffffff8051100e;
enum OPC_E_ZIP_MISSING_END_OF_CENTRAL_DIRECTORY = 0xffffffff8051100f;
enum OPC_E_ZIP_REQUIRES_64_BIT = 0xffffffff80511010;
enum CLSID_OpcFactory = GUID(0x6b2d6ba0, 0x9f3e, 0x4f27, [0x92, 0xb, 0x31, 0x3c, 0xc4, 0x26, 0xa3, 0x9e]);
struct OpcFactory
{
}
enum IID_IOpcUri = GUID(0xbc9c1b9b, 0xd62c, 0x49eb, [0xae, 0xf0, 0x3b, 0x4e, 0xb, 0x28, 0xeb, 0xed]);
interface IOpcUri : IUri
{
    HRESULT GetRelationshipsPartUri(IOpcPartUri*);
    HRESULT GetRelativeUri(IOpcPartUri, IUri*);
    HRESULT CombinePartUri(IUri, IOpcPartUri*);
}
enum IID_IOpcPartUri = GUID(0x7d3babe7, 0x88b2, 0x46ba, [0x85, 0xcb, 0x42, 0x3, 0xcb, 0x1, 0x6c, 0x87]);
interface IOpcPartUri : IOpcUri
{
    HRESULT ComparePartUri(IOpcPartUri, int*);
    HRESULT GetSourceUri(IOpcUri*);
    HRESULT IsRelationshipsPartUri(BOOL*);
}
alias OPC_URI_TARGET_MODE = int;
enum : int
{
    OPC_URI_TARGET_MODE_INTERNAL = 0x00000000,
    OPC_URI_TARGET_MODE_EXTERNAL = 0x00000001,
}

alias OPC_COMPRESSION_OPTIONS = int;
enum : int
{
    OPC_COMPRESSION_NONE      = 0xffffffff,
    OPC_COMPRESSION_NORMAL    = 0x00000000,
    OPC_COMPRESSION_MAXIMUM   = 0x00000001,
    OPC_COMPRESSION_FAST      = 0x00000002,
    OPC_COMPRESSION_SUPERFAST = 0x00000003,
}

alias OPC_STREAM_IO_MODE = int;
enum : int
{
    OPC_STREAM_IO_READ  = 0x00000001,
    OPC_STREAM_IO_WRITE = 0x00000002,
}

alias OPC_READ_FLAGS = uint;
enum : uint
{
    OPC_READ_DEFAULT     = 0x00000000,
    OPC_VALIDATE_ON_LOAD = 0x00000001,
    OPC_CACHE_ON_ACCESS  = 0x00000002,
}

alias OPC_WRITE_FLAGS = uint;
enum : uint
{
    OPC_WRITE_DEFAULT     = 0x00000000,
    OPC_WRITE_FORCE_ZIP32 = 0x00000001,
}

alias OPC_SIGNATURE_VALIDATION_RESULT = int;
enum : int
{
    OPC_SIGNATURE_VALID   = 0x00000000,
    OPC_SIGNATURE_INVALID = 0xffffffff,
}

alias OPC_CANONICALIZATION_METHOD = int;
enum : int
{
    OPC_CANONICALIZATION_NONE               = 0x00000000,
    OPC_CANONICALIZATION_C14N               = 0x00000001,
    OPC_CANONICALIZATION_C14N_WITH_COMMENTS = 0x00000002,
}

alias OPC_RELATIONSHIP_SELECTOR = int;
enum : int
{
    OPC_RELATIONSHIP_SELECT_BY_ID   = 0x00000000,
    OPC_RELATIONSHIP_SELECT_BY_TYPE = 0x00000001,
}

alias OPC_RELATIONSHIPS_SIGNING_OPTION = int;
enum : int
{
    OPC_RELATIONSHIP_SIGN_USING_SELECTORS = 0x00000000,
    OPC_RELATIONSHIP_SIGN_PART            = 0x00000001,
}

alias OPC_CERTIFICATE_EMBEDDING_OPTION = int;
enum : int
{
    OPC_CERTIFICATE_IN_CERTIFICATE_PART = 0x00000000,
    OPC_CERTIFICATE_IN_SIGNATURE_PART   = 0x00000001,
    OPC_CERTIFICATE_NOT_EMBEDDED        = 0x00000002,
}

alias OPC_SIGNATURE_TIME_FORMAT = int;
enum : int
{
    OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS = 0x00000000,
    OPC_SIGNATURE_TIME_FORMAT_SECONDS      = 0x00000001,
    OPC_SIGNATURE_TIME_FORMAT_MINUTES      = 0x00000002,
    OPC_SIGNATURE_TIME_FORMAT_DAYS         = 0x00000003,
    OPC_SIGNATURE_TIME_FORMAT_MONTHS       = 0x00000004,
    OPC_SIGNATURE_TIME_FORMAT_YEARS        = 0x00000005,
}

enum IID_IOpcPackage = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x70]);
interface IOpcPackage : IUnknown
{
    HRESULT GetPartSet(IOpcPartSet*);
    HRESULT GetRelationshipSet(IOpcRelationshipSet*);
}
enum IID_IOpcPart = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x71]);
interface IOpcPart : IUnknown
{
    HRESULT GetRelationshipSet(IOpcRelationshipSet*);
    HRESULT GetContentStream(IStream*);
    HRESULT GetName(IOpcPartUri*);
    HRESULT GetContentType(PWSTR*);
    HRESULT GetCompressionOptions(OPC_COMPRESSION_OPTIONS*);
}
enum IID_IOpcRelationship = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x72]);
interface IOpcRelationship : IUnknown
{
    HRESULT GetId(PWSTR*);
    HRESULT GetRelationshipType(PWSTR*);
    HRESULT GetSourceUri(IOpcUri*);
    HRESULT GetTargetUri(IUri*);
    HRESULT GetTargetMode(OPC_URI_TARGET_MODE*);
}
enum IID_IOpcPartSet = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x73]);
interface IOpcPartSet : IUnknown
{
    HRESULT GetPart(IOpcPartUri, IOpcPart*);
    HRESULT CreatePart(IOpcPartUri, const(wchar)*, OPC_COMPRESSION_OPTIONS, IOpcPart*);
    HRESULT DeletePart(IOpcPartUri);
    HRESULT PartExists(IOpcPartUri, BOOL*);
    HRESULT GetEnumerator(IOpcPartEnumerator*);
}
enum IID_IOpcRelationshipSet = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x74]);
interface IOpcRelationshipSet : IUnknown
{
    HRESULT GetRelationship(const(wchar)*, IOpcRelationship*);
    HRESULT CreateRelationship(const(wchar)*, const(wchar)*, IUri, OPC_URI_TARGET_MODE, IOpcRelationship*);
    HRESULT DeleteRelationship(const(wchar)*);
    HRESULT RelationshipExists(const(wchar)*, BOOL*);
    HRESULT GetEnumerator(IOpcRelationshipEnumerator*);
    HRESULT GetEnumeratorForType(const(wchar)*, IOpcRelationshipEnumerator*);
    HRESULT GetRelationshipsContentStream(IStream*);
}
enum IID_IOpcPartEnumerator = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x75]);
interface IOpcPartEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcPart*);
    HRESULT Clone(IOpcPartEnumerator*);
}
enum IID_IOpcRelationshipEnumerator = GUID(0x42195949, 0x3b79, 0x4fc8, [0x89, 0xc6, 0xfc, 0x7f, 0xb9, 0x79, 0xee, 0x76]);
interface IOpcRelationshipEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcRelationship*);
    HRESULT Clone(IOpcRelationshipEnumerator*);
}
enum IID_IOpcSignaturePartReference = GUID(0xe24231ca, 0x59f4, 0x484e, [0xb6, 0x4b, 0x36, 0xee, 0xda, 0x36, 0x7, 0x2c]);
interface IOpcSignaturePartReference : IUnknown
{
    HRESULT GetPartName(IOpcPartUri*);
    HRESULT GetContentType(PWSTR*);
    HRESULT GetDigestMethod(PWSTR*);
    HRESULT GetDigestValue(ubyte**, uint*);
    HRESULT GetTransformMethod(OPC_CANONICALIZATION_METHOD*);
}
enum IID_IOpcSignatureRelationshipReference = GUID(0x57babac6, 0x9d4a, 0x4e50, [0x8b, 0x86, 0xe5, 0xd4, 0x5, 0x1e, 0xae, 0x7c]);
interface IOpcSignatureRelationshipReference : IUnknown
{
    HRESULT GetSourceUri(IOpcUri*);
    HRESULT GetDigestMethod(PWSTR*);
    HRESULT GetDigestValue(ubyte**, uint*);
    HRESULT GetTransformMethod(OPC_CANONICALIZATION_METHOD*);
    HRESULT GetRelationshipSigningOption(OPC_RELATIONSHIPS_SIGNING_OPTION*);
    HRESULT GetRelationshipSelectorEnumerator(IOpcRelationshipSelectorEnumerator*);
}
enum IID_IOpcRelationshipSelector = GUID(0xf8f26c7f, 0xb28f, 0x4899, [0x84, 0xc8, 0x5d, 0x56, 0x39, 0xed, 0xe7, 0x5f]);
interface IOpcRelationshipSelector : IUnknown
{
    HRESULT GetSelectorType(OPC_RELATIONSHIP_SELECTOR*);
    HRESULT GetSelectionCriterion(PWSTR*);
}
enum IID_IOpcSignatureReference = GUID(0x1b47005e, 0x3011, 0x4edc, [0xbe, 0x6f, 0xf, 0x65, 0xe5, 0xab, 0x3, 0x42]);
interface IOpcSignatureReference : IUnknown
{
    HRESULT GetId(PWSTR*);
    HRESULT GetUri(IUri*);
    HRESULT GetType(PWSTR*);
    HRESULT GetTransformMethod(OPC_CANONICALIZATION_METHOD*);
    HRESULT GetDigestMethod(PWSTR*);
    HRESULT GetDigestValue(ubyte**, uint*);
}
enum IID_IOpcSignatureCustomObject = GUID(0x5d77a19e, 0x62c1, 0x44e7, [0xbe, 0xcd, 0x45, 0xda, 0x5a, 0xe5, 0x1a, 0x56]);
interface IOpcSignatureCustomObject : IUnknown
{
    HRESULT GetXml(ubyte**, uint*);
}
enum IID_IOpcDigitalSignature = GUID(0x52ab21dd, 0x1cd0, 0x4949, [0xbc, 0x80, 0xc, 0x12, 0x32, 0xd0, 0xc, 0xb4]);
interface IOpcDigitalSignature : IUnknown
{
    HRESULT GetNamespaces(PWSTR**, PWSTR**, uint*);
    HRESULT GetSignatureId(PWSTR*);
    HRESULT GetSignaturePartName(IOpcPartUri*);
    HRESULT GetSignatureMethod(PWSTR*);
    HRESULT GetCanonicalizationMethod(OPC_CANONICALIZATION_METHOD*);
    HRESULT GetSignatureValue(ubyte**, uint*);
    HRESULT GetSignaturePartReferenceEnumerator(IOpcSignaturePartReferenceEnumerator*);
    HRESULT GetSignatureRelationshipReferenceEnumerator(IOpcSignatureRelationshipReferenceEnumerator*);
    HRESULT GetSigningTime(PWSTR*);
    HRESULT GetTimeFormat(OPC_SIGNATURE_TIME_FORMAT*);
    HRESULT GetPackageObjectReference(IOpcSignatureReference*);
    HRESULT GetCertificateEnumerator(IOpcCertificateEnumerator*);
    HRESULT GetCustomReferenceEnumerator(IOpcSignatureReferenceEnumerator*);
    HRESULT GetCustomObjectEnumerator(IOpcSignatureCustomObjectEnumerator*);
    HRESULT GetSignatureXml(ubyte**, uint*);
}
enum IID_IOpcSigningOptions = GUID(0x50d2d6a5, 0x7aeb, 0x46c0, [0xb2, 0x41, 0x43, 0xab, 0xe, 0x9b, 0x40, 0x7e]);
interface IOpcSigningOptions : IUnknown
{
    HRESULT GetSignatureId(PWSTR*);
    HRESULT SetSignatureId(const(wchar)*);
    HRESULT GetSignatureMethod(PWSTR*);
    HRESULT SetSignatureMethod(const(wchar)*);
    HRESULT GetDefaultDigestMethod(PWSTR*);
    HRESULT SetDefaultDigestMethod(const(wchar)*);
    HRESULT GetCertificateEmbeddingOption(OPC_CERTIFICATE_EMBEDDING_OPTION*);
    HRESULT SetCertificateEmbeddingOption(OPC_CERTIFICATE_EMBEDDING_OPTION);
    HRESULT GetTimeFormat(OPC_SIGNATURE_TIME_FORMAT*);
    HRESULT SetTimeFormat(OPC_SIGNATURE_TIME_FORMAT);
    HRESULT GetSignaturePartReferenceSet(IOpcSignaturePartReferenceSet*);
    HRESULT GetSignatureRelationshipReferenceSet(IOpcSignatureRelationshipReferenceSet*);
    HRESULT GetCustomObjectSet(IOpcSignatureCustomObjectSet*);
    HRESULT GetCustomReferenceSet(IOpcSignatureReferenceSet*);
    HRESULT GetCertificateSet(IOpcCertificateSet*);
    HRESULT GetSignaturePartName(IOpcPartUri*);
    HRESULT SetSignaturePartName(IOpcPartUri);
}
enum IID_IOpcDigitalSignatureManager = GUID(0xd5e62a0b, 0x696d, 0x462f, [0x94, 0xdf, 0x72, 0xe3, 0x3c, 0xef, 0x26, 0x59]);
interface IOpcDigitalSignatureManager : IUnknown
{
    HRESULT GetSignatureOriginPartName(IOpcPartUri*);
    HRESULT SetSignatureOriginPartName(IOpcPartUri);
    HRESULT GetSignatureEnumerator(IOpcDigitalSignatureEnumerator*);
    HRESULT RemoveSignature(IOpcPartUri);
    HRESULT CreateSigningOptions(IOpcSigningOptions*);
    HRESULT Validate(IOpcDigitalSignature, const(CERT_CONTEXT)*, OPC_SIGNATURE_VALIDATION_RESULT*);
    HRESULT Sign(const(CERT_CONTEXT)*, IOpcSigningOptions, IOpcDigitalSignature*);
    HRESULT ReplaceSignatureXml(IOpcPartUri, const(ubyte)*, uint, IOpcDigitalSignature*);
}
enum IID_IOpcSignaturePartReferenceEnumerator = GUID(0x80eb1561, 0x8c77, 0x49cf, [0x82, 0x66, 0x45, 0x9b, 0x35, 0x6e, 0xe9, 0x9a]);
interface IOpcSignaturePartReferenceEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcSignaturePartReference*);
    HRESULT Clone(IOpcSignaturePartReferenceEnumerator*);
}
enum IID_IOpcSignatureRelationshipReferenceEnumerator = GUID(0x773ba3e4, 0xf021, 0x48e4, [0xaa, 0x4, 0x98, 0x16, 0xdb, 0x5d, 0x34, 0x95]);
interface IOpcSignatureRelationshipReferenceEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcSignatureRelationshipReference*);
    HRESULT Clone(IOpcSignatureRelationshipReferenceEnumerator*);
}
enum IID_IOpcRelationshipSelectorEnumerator = GUID(0x5e50a181, 0xa91b, 0x48ac, [0x88, 0xd2, 0xbc, 0xa3, 0xd8, 0xf8, 0xc0, 0xb1]);
interface IOpcRelationshipSelectorEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcRelationshipSelector*);
    HRESULT Clone(IOpcRelationshipSelectorEnumerator*);
}
enum IID_IOpcSignatureReferenceEnumerator = GUID(0xcfa59a45, 0x28b1, 0x4868, [0x96, 0x9e, 0xfa, 0x80, 0x97, 0xfd, 0xc1, 0x2a]);
interface IOpcSignatureReferenceEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcSignatureReference*);
    HRESULT Clone(IOpcSignatureReferenceEnumerator*);
}
enum IID_IOpcSignatureCustomObjectEnumerator = GUID(0x5ee4fe1d, 0xe1b0, 0x4683, [0x80, 0x79, 0x7e, 0xa0, 0xfc, 0xf8, 0xb, 0x4c]);
interface IOpcSignatureCustomObjectEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcSignatureCustomObject*);
    HRESULT Clone(IOpcSignatureCustomObjectEnumerator*);
}
enum IID_IOpcCertificateEnumerator = GUID(0x85131937, 0x8f24, 0x421f, [0xb4, 0x39, 0x59, 0xab, 0x24, 0xd1, 0x40, 0xb8]);
interface IOpcCertificateEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(const(CERT_CONTEXT)**);
    HRESULT Clone(IOpcCertificateEnumerator*);
}
enum IID_IOpcDigitalSignatureEnumerator = GUID(0x967b6882, 0xba3, 0x4358, [0xb9, 0xe7, 0xb6, 0x4c, 0x75, 0x6, 0x3c, 0x5e]);
interface IOpcDigitalSignatureEnumerator : IUnknown
{
    HRESULT MoveNext(BOOL*);
    HRESULT MovePrevious(BOOL*);
    HRESULT GetCurrent(IOpcDigitalSignature*);
    HRESULT Clone(IOpcDigitalSignatureEnumerator*);
}
enum IID_IOpcSignaturePartReferenceSet = GUID(0x6c9fe28c, 0xecd9, 0x4b22, [0x9d, 0x36, 0x7f, 0xdd, 0xe6, 0x70, 0xfe, 0xc0]);
interface IOpcSignaturePartReferenceSet : IUnknown
{
    HRESULT Create(IOpcPartUri, const(wchar)*, OPC_CANONICALIZATION_METHOD, IOpcSignaturePartReference*);
    HRESULT Delete(IOpcSignaturePartReference);
    HRESULT GetEnumerator(IOpcSignaturePartReferenceEnumerator*);
}
enum IID_IOpcSignatureRelationshipReferenceSet = GUID(0x9f863ca5, 0x3631, 0x404c, [0x82, 0x8d, 0x80, 0x7e, 0x7, 0x15, 0x6, 0x9b]);
interface IOpcSignatureRelationshipReferenceSet : IUnknown
{
    HRESULT Create(IOpcUri, const(wchar)*, OPC_RELATIONSHIPS_SIGNING_OPTION, IOpcRelationshipSelectorSet, OPC_CANONICALIZATION_METHOD, IOpcSignatureRelationshipReference*);
    HRESULT CreateRelationshipSelectorSet(IOpcRelationshipSelectorSet*);
    HRESULT Delete(IOpcSignatureRelationshipReference);
    HRESULT GetEnumerator(IOpcSignatureRelationshipReferenceEnumerator*);
}
enum IID_IOpcRelationshipSelectorSet = GUID(0x6e34c269, 0xa4d3, 0x47c0, [0xb5, 0xc4, 0x87, 0xff, 0x2b, 0x3b, 0x61, 0x36]);
interface IOpcRelationshipSelectorSet : IUnknown
{
    HRESULT Create(OPC_RELATIONSHIP_SELECTOR, const(wchar)*, IOpcRelationshipSelector*);
    HRESULT Delete(IOpcRelationshipSelector);
    HRESULT GetEnumerator(IOpcRelationshipSelectorEnumerator*);
}
enum IID_IOpcSignatureReferenceSet = GUID(0xf3b02d31, 0xab12, 0x42dd, [0x9e, 0x2f, 0x2b, 0x16, 0x76, 0x1c, 0x3c, 0x1e]);
interface IOpcSignatureReferenceSet : IUnknown
{
    HRESULT Create(IUri, const(wchar)*, const(wchar)*, const(wchar)*, OPC_CANONICALIZATION_METHOD, IOpcSignatureReference*);
    HRESULT Delete(IOpcSignatureReference);
    HRESULT GetEnumerator(IOpcSignatureReferenceEnumerator*);
}
enum IID_IOpcSignatureCustomObjectSet = GUID(0x8f792ac5, 0x7947, 0x4e11, [0xbc, 0x3d, 0x26, 0x59, 0xff, 0x4, 0x6a, 0xe1]);
interface IOpcSignatureCustomObjectSet : IUnknown
{
    HRESULT Create(const(ubyte)*, uint, IOpcSignatureCustomObject*);
    HRESULT Delete(IOpcSignatureCustomObject);
    HRESULT GetEnumerator(IOpcSignatureCustomObjectEnumerator*);
}
enum IID_IOpcCertificateSet = GUID(0x56ea4325, 0x8e2d, 0x4167, [0xb1, 0xa4, 0xe4, 0x86, 0xd2, 0x4c, 0x8f, 0xa7]);
interface IOpcCertificateSet : IUnknown
{
    HRESULT Add(const(CERT_CONTEXT)*);
    HRESULT Remove(const(CERT_CONTEXT)*);
    HRESULT GetEnumerator(IOpcCertificateEnumerator*);
}
enum IID_IOpcFactory = GUID(0x6d0b4446, 0xcd73, 0x4ab3, [0x94, 0xf4, 0x8c, 0xcd, 0xf6, 0x11, 0x61, 0x54]);
interface IOpcFactory : IUnknown
{
    HRESULT CreatePackageRootUri(IOpcUri*);
    HRESULT CreatePartUri(const(wchar)*, IOpcPartUri*);
    HRESULT CreateStreamOnFile(const(wchar)*, OPC_STREAM_IO_MODE, SECURITY_ATTRIBUTES*, uint, IStream*);
    HRESULT CreatePackage(IOpcPackage*);
    HRESULT ReadPackageFromStream(IStream, OPC_READ_FLAGS, IOpcPackage*);
    HRESULT WritePackageToStream(IOpcPackage, OPC_WRITE_FLAGS, IStream);
    HRESULT CreateDigitalSignatureManager(IOpcPackage, IOpcDigitalSignatureManager*);
}
