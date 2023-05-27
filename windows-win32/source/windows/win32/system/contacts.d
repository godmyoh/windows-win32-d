module windows.win32.system.contacts;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, PWSTR;
import windows.win32.system.com : IStream, IUnknown;

version (Windows):
extern (Windows):

enum CGD_DEFAULT = 0x00000000;
enum CGD_UNKNOWN_PROPERTY = 0x00000000;
enum CGD_STRING_PROPERTY = 0x00000001;
enum CGD_DATE_PROPERTY = 0x00000002;
enum CGD_BINARY_PROPERTY = 0x00000004;
enum CGD_ARRAY_NODE = 0x00000008;
enum CLSID_ContactAggregationManager = GUID(0x96c8ad95, 0xc199, 0x44de, [0xb3, 0x4e, 0xac, 0x33, 0xc4, 0x42, 0xdf, 0x39]);
enum CONTACTPROP_PUB_NOTES = "Notes";
enum CONTACTPROP_PUB_MAILER = "Mailer";
enum CONTACTPROP_PUB_PROGID = "ProgID";
enum CONTACTPROP_PUB_GENDER = "Gender";
enum CONTACTPROP_PUB_GENDER_UNSPECIFIED = "Unspecified";
enum CONTACTPROP_PUB_GENDER_MALE = "Male";
enum CONTACTPROP_PUB_GENDER_FEMALE = "Female";
enum CONTACTPROP_PUB_CREATIONDATE = "CreationDate";
enum CONTACTPROP_PUB_L1_CONTACTIDCOLLECTION = "ContactIDCollection";
enum CONTACTPROP_PUB_L2_CONTACTID = "/ContactID";
enum CONTACTPROP_PUB_L3_VALUE = "/Value";
enum CONTACTPROP_PUB_L1_NAMECOLLECTION = "NameCollection";
enum CONTACTPROP_PUB_L2_NAME = "/Name";
enum CONTACTPROP_PUB_L3_FORMATTEDNAME = "/FormattedName";
enum CONTACTPROP_PUB_L3_PHONETIC = "/Phonetic";
enum CONTACTPROP_PUB_L3_PREFIX = "/Prefix";
enum CONTACTPROP_PUB_L3_TITLE = "/Title";
enum CONTACTPROP_PUB_L3_GIVENNAME = "/GivenName";
enum CONTACTPROP_PUB_L3_FAMILYNAME = "/FamilyName";
enum CONTACTPROP_PUB_L3_MIDDLENAME = "/MiddleName";
enum CONTACTPROP_PUB_L3_GENERATION = "/Generation";
enum CONTACTPROP_PUB_L3_SUFFIX = "/Suffix";
enum CONTACTPROP_PUB_L3_NICKNAME = "/NickName";
enum CONTACTPROP_PUB_L1_POSITIONCOLLECTION = "PositionCollection";
enum CONTACTPROP_PUB_L2_POSITION = "/Position";
enum CONTACTPROP_PUB_L3_ORGANIZATION = "/Organization";
enum CONTACTPROP_PUB_L3_COMPANY = "/Company";
enum CONTACTPROP_PUB_L3_DEPARTMENT = "/Department";
enum CONTACTPROP_PUB_L3_OFFICE = "/Office";
enum CONTACTPROP_PUB_L3_JOB_TITLE = "/JobTitle";
enum CONTACTPROP_PUB_L3_PROFESSION = "/Profession";
enum CONTACTPROP_PUB_L3_ROLE = "/Role";
enum CONTACTPROP_PUB_L1_PERSONCOLLECTION = "PersonCollection";
enum CONTACTPROP_PUB_L2_PERSON = "/Person";
enum CONTACTPROP_PUB_L3_PERSONID = "/PersonID";
enum CONTACTPROP_PUB_L1_DATECOLLECTION = "DateCollection";
enum CONTACTPROP_PUB_L2_DATE = "/Date";
enum CONTACTPROP_PUB_L1_EMAILADDRESSCOLLECTION = "EmailAddressCollection";
enum CONTACTPROP_PUB_L2_EMAILADDRESS = "/EmailAddress";
enum CONTACTPROP_PUB_L3_ADDRESS = "/Address";
enum CONTACTPROP_PUB_L3_TYPE = "/Type";
enum CONTACTPROP_PUB_L1_CERTIFICATECOLLECTION = "CertificateCollection";
enum CONTACTPROP_PUB_L2_CERTIFICATE = "/Certificate";
enum CONTACTPROP_PUB_L3_THUMBPRINT = "/ThumbPrint";
enum CONTACTPROP_PUB_L1_PHONENUMBERCOLLECTION = "PhoneNumberCollection";
enum CONTACTPROP_PUB_L2_PHONENUMBER = "/PhoneNumber";
enum CONTACTPROP_PUB_L3_NUMBER = "/Number";
enum CONTACTPROP_PUB_L3_ALTERNATE = "/Alternate";
enum CONTACTPROP_PUB_L1_PHYSICALADDRESSCOLLECTION = "PhysicalAddressCollection";
enum CONTACTPROP_PUB_L2_PHYSICALADDRESS = "/PhysicalAddress";
enum CONTACTPROP_PUB_L3_ADDRESSLABEL = "/AddressLabel";
enum CONTACTPROP_PUB_L3_STREET = "/Street";
enum CONTACTPROP_PUB_L3_LOCALITY = "/Locality";
enum CONTACTPROP_PUB_L3_REGION = "/Region";
enum CONTACTPROP_PUB_L3_POSTALCODE = "/PostalCode";
enum CONTACTPROP_PUB_L3_COUNTRY = "/Country";
enum CONTACTPROP_PUB_L3_POBOX = "/POBox";
enum CONTACTPROP_PUB_L3_EXTENDEDADDRESS = "/ExtendedAddress";
enum CONTACTPROP_PUB_L1_IMADDRESSCOLLECTION = "IMAddressCollection";
enum CONTACTPROP_PUB_L2_IMADDRESSENTRY = "/IMAddress";
enum CONTACTPROP_PUB_L3_PROTOCOL = "/Protocol";
enum CONTACTPROP_PUB_L1_URLCOLLECTION = "UrlCollection";
enum CONTACTPROP_PUB_L2_URL = "/Url";
enum CONTACTPROP_PUB_L1_PHOTOCOLLECTION = "PhotoCollection";
enum CONTACTPROP_PUB_L2_PHOTO = "/Photo";
enum CONTACTPROP_PUB_L3_URL = "/Url";
enum CONTACTLABEL_PUB_PREFERRED = "Preferred";
enum CONTACTLABEL_PUB_PERSONAL = "Personal";
enum CONTACTLABEL_PUB_BUSINESS = "Business";
enum CONTACTLABEL_PUB_OTHER = "Other";
enum CONTACTLABEL_PUB_VOICE = "Voice";
enum CONTACTLABEL_PUB_MOBILE = "Mobile";
enum CONTACTLABEL_PUB_PCS = "PCS";
enum CONTACTLABEL_PUB_CELLULAR = "Cellular";
enum CONTACTLABEL_PUB_CAR = "Car";
enum CONTACTLABEL_PUB_PAGER = "Pager";
enum CONTACTLABEL_PUB_TTY = "TTY";
enum CONTACTLABEL_PUB_FAX = "Fax";
enum CONTACTLABEL_PUB_VIDEO = "Video";
enum CONTACTLABEL_PUB_MODEM = "Modem";
enum CONTACTLABEL_PUB_BBS = "BBS";
enum CONTACTLABEL_PUB_ISDN = "ISDN";
enum CONTACTLABEL_PUB_AGENT = "Agent";
enum CONTACTLABEL_PUB_DOMESTIC = "Domestic";
enum CONTACTLABEL_PUB_INTERNATIONAL = "International";
enum CONTACTLABEL_PUB_POSTAL = "Postal";
enum CONTACTLABEL_PUB_PARCEL = "Parcel";
enum CONTACTLABEL_PUB_USERTILE = "UserTile";
enum CONTACTLABEL_PUB_LOGO = "Logo";
enum CONTACTLABEL_WAB_SPOUSE = "wab:Spouse";
enum CONTACTLABEL_WAB_CHILD = "wab:Child";
enum CONTACTLABEL_WAB_MANAGER = "wab:Manager";
enum CONTACTLABEL_WAB_ASSISTANT = "wab:Assistant";
enum CONTACTLABEL_WAB_BIRTHDAY = "wab:Birthday";
enum CONTACTLABEL_WAB_ANNIVERSARY = "wab:Anniversary";
enum CONTACTLABEL_WAB_SOCIALNETWORK = "wab:SocialNetwork";
enum CONTACTLABEL_WAB_SCHOOL = "wab:School";
enum CONTACTLABEL_WAB_WISHLIST = "wab:WishList";
enum IID_IContactManager = GUID(0xad553d98, 0xdeb1, 0x474a, [0x8e, 0x17, 0xfc, 0xc, 0x20, 0x75, 0xb7, 0x38]);
interface IContactManager : IUnknown
{
    HRESULT Initialize(const(wchar)*, const(wchar)*);
    HRESULT Load(const(wchar)*, IContact*);
    HRESULT MergeContactIDs(const(wchar)*, const(wchar)*);
    HRESULT GetMeContact(IContact*);
    HRESULT SetMeContact(IContact);
    HRESULT GetContactCollection(IContactCollection*);
}
enum IID_IContactCollection = GUID(0xb6afa338, 0xd779, 0x11d9, [0x8b, 0xde, 0xf6, 0x6b, 0xad, 0x1e, 0x3f, 0x3a]);
interface IContactCollection : IUnknown
{
    HRESULT Reset();
    HRESULT Next();
    HRESULT GetCurrent(IContact*);
}
enum IID_IContactProperties = GUID(0x70dd27dd, 0x5cbd, 0x46e8, [0xbe, 0xf0, 0x23, 0xb6, 0xb3, 0x46, 0x28, 0x8f]);
interface IContactProperties : IUnknown
{
    HRESULT GetString(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT GetDate(const(wchar)*, uint, FILETIME*);
    HRESULT GetBinary(const(wchar)*, uint, PWSTR, uint, uint*, IStream*);
    HRESULT GetLabels(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT SetString(const(wchar)*, uint, const(wchar)*);
    HRESULT SetDate(const(wchar)*, uint, FILETIME);
    HRESULT SetBinary(const(wchar)*, uint, const(wchar)*, IStream);
    HRESULT SetLabels(const(wchar)*, uint, uint, const(wchar)**);
    HRESULT CreateArrayNode(const(wchar)*, uint, BOOL, PWSTR, uint, uint*);
    HRESULT DeleteProperty(const(wchar)*, uint);
    HRESULT DeleteArrayNode(const(wchar)*, uint);
    HRESULT DeleteLabels(const(wchar)*, uint);
    HRESULT GetPropertyCollection(IContactPropertyCollection*, uint, const(wchar)*, uint, const(wchar)**, BOOL);
}
enum IID_IContact = GUID(0xf941b671, 0xbda7, 0x4f77, [0x88, 0x4a, 0xf4, 0x64, 0x62, 0xf2, 0x26, 0xa7]);
interface IContact : IUnknown
{
    HRESULT GetContactID(PWSTR, uint, uint*);
    HRESULT GetPath(PWSTR, uint, uint*);
    HRESULT CommitChanges(uint);
}
enum IID_IContactPropertyCollection = GUID(0xffd3adf8, 0xfa64, 0x4328, [0xb1, 0xb6, 0x2e, 0xd, 0xb5, 0x9, 0xcb, 0x3c]);
interface IContactPropertyCollection : IUnknown
{
    HRESULT Reset();
    HRESULT Next();
    HRESULT GetPropertyName(PWSTR, uint, uint*);
    HRESULT GetPropertyType(uint*);
    HRESULT GetPropertyVersion(uint*);
    HRESULT GetPropertyModificationDate(FILETIME*);
    HRESULT GetPropertyArrayElementID(PWSTR, uint, uint*);
}
enum CLSID_Contact = GUID(0x61b68808, 0x8eee, 0x4fd1, [0xac, 0xb8, 0x3d, 0x80, 0x4c, 0x8d, 0xb0, 0x56]);
struct Contact
{
}
enum CLSID_ContactManager = GUID(0x7165c8ab, 0xaf88, 0x42bd, [0x86, 0xfd, 0x53, 0x10, 0xb4, 0x28, 0x5a, 0x2]);
struct ContactManager
{
}
alias CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS = int;
enum : int
{
    CA_CREATE_LOCAL    = 0x00000000,
    CA_CREATE_EXTERNAL = 0x00000001,
}

alias CONTACT_AGGREGATION_COLLECTION_OPTIONS = int;
enum : int
{
    CACO_DEFAULT          = 0x00000000,
    CACO_INCLUDE_EXTERNAL = 0x00000001,
    CACO_EXTERNAL_ONLY    = 0x00000002,
}

struct CONTACT_AGGREGATION_BLOB
{
    uint dwCount;
    ubyte* lpb;
}
enum IID_IContactAggregationManager = GUID(0x1d865989, 0x4b1f, 0x4b60, [0x8f, 0x34, 0xc2, 0xad, 0x46, 0x8b, 0x2b, 0x50]);
interface IContactAggregationManager : IUnknown
{
    HRESULT GetVersionInfo(int*, int*);
    HRESULT CreateOrOpenGroup(const(wchar)*, CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, BOOL*, IContactAggregationGroup*);
    HRESULT CreateExternalContact(IContactAggregationContact*);
    HRESULT CreateServerPerson(IContactAggregationServerPerson*);
    HRESULT CreateServerContactLink(IContactAggregationLink*);
    HRESULT Flush();
    HRESULT OpenAggregateContact(const(wchar)*, IContactAggregationAggregate*);
    HRESULT OpenContact(const(wchar)*, IContactAggregationContact*);
    HRESULT OpenServerContactLink(const(wchar)*, IContactAggregationLink*);
    HRESULT OpenServerPerson(const(wchar)*, IContactAggregationServerPerson*);
    HRESULT get_Contacts(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationContactCollection*);
    HRESULT get_AggregateContacts(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationAggregateCollection*);
    HRESULT get_Groups(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*);
    HRESULT get_ServerPersons(IContactAggregationServerPersonCollection*);
    HRESULT get_ServerContactLinks(const(wchar)*, IContactAggregationLinkCollection*);
}
enum IID_IContactAggregationContact = GUID(0x1eb22e86, 0x4c86, 0x41f0, [0x9f, 0x9f, 0xc2, 0x51, 0xe9, 0xfd, 0xa6, 0xc3]);
interface IContactAggregationContact : IUnknown
{
    HRESULT Delete();
    HRESULT Save();
    HRESULT MoveToAggregate(const(wchar)*);
    HRESULT Unlink();
    HRESULT get_AccountId(PWSTR*);
    HRESULT put_AccountId(const(wchar)*);
    HRESULT get_AggregateId(PWSTR*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_IsMe(BOOL*);
    HRESULT get_IsExternal(BOOL*);
    HRESULT get_NetworkSourceId(uint*);
    HRESULT put_NetworkSourceId(uint);
    HRESULT get_NetworkSourceIdString(PWSTR*);
    HRESULT put_NetworkSourceIdString(const(wchar)*);
    HRESULT get_RemoteObjectId(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_RemoteObjectId(const(CONTACT_AGGREGATION_BLOB)*);
    HRESULT get_SyncIdentityHash(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_SyncIdentityHash(const(CONTACT_AGGREGATION_BLOB)*);
}
enum IID_IContactAggregationContactCollection = GUID(0x826e66fa, 0x81de, 0x43ca, [0xa6, 0xfb, 0x8c, 0x78, 0x5c, 0xd9, 0x96, 0xc6]);
interface IContactAggregationContactCollection : IUnknown
{
    HRESULT FindFirst(IContactAggregationContact*);
    HRESULT FindNext(IContactAggregationContact*);
    HRESULT FindFirstByIdentityHash(const(wchar)*, const(wchar)*, const(CONTACT_AGGREGATION_BLOB)*, IContactAggregationContact*);
    HRESULT get_Count(int*);
    HRESULT FindFirstByRemoteId(const(wchar)*, const(wchar)*, const(CONTACT_AGGREGATION_BLOB)*, IContactAggregationContact*);
}
enum IID_IContactAggregationAggregate = GUID(0x7ed1c814, 0xcd30, 0x43c8, [0x9b, 0x8d, 0x2e, 0x48, 0x9e, 0x53, 0xd5, 0x4b]);
interface IContactAggregationAggregate : IUnknown
{
    HRESULT Save();
    HRESULT GetComponentItems(IContactAggregationContactCollection*);
    HRESULT Link(const(wchar)*);
    HRESULT get_Groups(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*);
    HRESULT get_AntiLink(PWSTR*);
    HRESULT put_AntiLink(const(wchar)*);
    HRESULT get_FavoriteOrder(uint*);
    HRESULT put_FavoriteOrder(uint);
    HRESULT get_Id(PWSTR*);
}
enum IID_IContactAggregationAggregateCollection = GUID(0x2359f3a6, 0x3a68, 0x40af, [0x98, 0xdb, 0xf, 0x9e, 0xb1, 0x43, 0xc3, 0xbb]);
interface IContactAggregationAggregateCollection : IUnknown
{
    HRESULT FindFirst(IContactAggregationAggregate*);
    HRESULT FindFirstByAntiLinkId(const(wchar)*, IContactAggregationAggregate*);
    HRESULT FindNext(IContactAggregationAggregate*);
    HRESULT get_Count(int*);
}
enum IID_IContactAggregationGroup = GUID(0xc93c545f, 0x1284, 0x499b, [0x96, 0xaf, 0x7, 0x37, 0x2a, 0xf4, 0x73, 0xe0]);
interface IContactAggregationGroup : IUnknown
{
    HRESULT Delete();
    HRESULT Save();
    HRESULT Add(const(wchar)*);
    HRESULT Remove(const(wchar)*);
    HRESULT get_Members(IContactAggregationAggregateCollection*);
    HRESULT get_GlobalObjectId(GUID*);
    HRESULT put_GlobalObjectId(const(GUID)*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_Name(PWSTR*);
    HRESULT put_Name(const(wchar)*);
}
enum IID_IContactAggregationGroupCollection = GUID(0x20a19a9c, 0xd2f3, 0x4b83, [0x91, 0x43, 0xbe, 0xff, 0xd2, 0xcc, 0x22, 0x6d]);
interface IContactAggregationGroupCollection : IUnknown
{
    HRESULT FindFirst(IContactAggregationGroup*);
    HRESULT FindFirstByGlobalObjectId(const(GUID)*, IContactAggregationGroup*);
    HRESULT FindNext(IContactAggregationGroup*);
    HRESULT get_Count(uint*);
}
enum IID_IContactAggregationLink = GUID(0xb6813323, 0xa183, 0x4654, [0x86, 0x27, 0x79, 0xb3, 0xd, 0xe3, 0xa0, 0xec]);
interface IContactAggregationLink : IUnknown
{
    HRESULT Delete();
    HRESULT Save();
    HRESULT get_AccountId(PWSTR*);
    HRESULT put_AccountId(const(wchar)*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_IsLinkResolved(BOOL*);
    HRESULT put_IsLinkResolved(BOOL);
    HRESULT get_NetworkSourceIdString(PWSTR*);
    HRESULT put_NetworkSourceIdString(const(wchar)*);
    HRESULT get_RemoteObjectId(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_RemoteObjectId(const(CONTACT_AGGREGATION_BLOB)*);
    HRESULT get_ServerPerson(PWSTR*);
    HRESULT put_ServerPerson(const(wchar)*);
    HRESULT get_ServerPersonBaseline(PWSTR*);
    HRESULT put_ServerPersonBaseline(const(wchar)*);
    HRESULT get_SyncIdentityHash(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_SyncIdentityHash(const(CONTACT_AGGREGATION_BLOB)*);
}
enum IID_IContactAggregationLinkCollection = GUID(0xf8bc0e93, 0xfb55, 0x4f28, [0xb9, 0xfa, 0xb1, 0xc2, 0x74, 0x15, 0x32, 0x92]);
interface IContactAggregationLinkCollection : IUnknown
{
    HRESULT FindFirst(IContactAggregationLink*);
    HRESULT FindFirstByRemoteId(const(wchar)*, const(wchar)*, const(CONTACT_AGGREGATION_BLOB)*, IContactAggregationLink*);
    HRESULT FindNext(IContactAggregationLink*);
    HRESULT get_Count(uint*);
}
enum IID_IContactAggregationServerPerson = GUID(0x7fdc3d4b, 0x1b82, 0x4334, [0x85, 0xc5, 0x25, 0x18, 0x4e, 0xe5, 0xa5, 0xf2]);
interface IContactAggregationServerPerson : IUnknown
{
    HRESULT Delete();
    HRESULT Save();
    HRESULT get_AggregateId(PWSTR*);
    HRESULT put_AggregateId(const(wchar)*);
    HRESULT get_AntiLink(PWSTR*);
    HRESULT put_AntiLink(const(wchar)*);
    HRESULT get_AntiLinkBaseline(PWSTR*);
    HRESULT put_AntiLinkBaseline(const(wchar)*);
    HRESULT get_FavoriteOrder(uint*);
    HRESULT put_FavoriteOrder(uint);
    HRESULT get_FavoriteOrderBaseline(uint*);
    HRESULT put_FavoriteOrderBaseline(uint);
    HRESULT get_Groups(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_Groups(const(CONTACT_AGGREGATION_BLOB)*);
    HRESULT get_GroupsBaseline(CONTACT_AGGREGATION_BLOB**);
    HRESULT put_GroupsBaseline(const(CONTACT_AGGREGATION_BLOB)*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_IsTombstone(BOOL*);
    HRESULT put_IsTombstone(BOOL);
    HRESULT get_LinkedAggregateId(PWSTR*);
    HRESULT put_LinkedAggregateId(const(wchar)*);
    HRESULT get_ObjectId(PWSTR*);
    HRESULT put_ObjectId(const(wchar)*);
}
enum IID_IContactAggregationServerPersonCollection = GUID(0x4f730a4a, 0x6604, 0x47b6, [0xa9, 0x87, 0x66, 0x9e, 0xcf, 0x1e, 0x57, 0x51]);
interface IContactAggregationServerPersonCollection : IUnknown
{
    HRESULT FindFirst(IContactAggregationServerPerson*);
    HRESULT FindFirstByServerId(const(wchar)*, IContactAggregationServerPerson*);
    HRESULT FindFirstByAggregateId(const(wchar)*, IContactAggregationServerPerson*);
    HRESULT FindFirstByLinkedAggregateId(const(wchar)*, IContactAggregationServerPerson*);
    HRESULT FindNext(IContactAggregationServerPerson*);
    HRESULT get_Count(uint*);
}
