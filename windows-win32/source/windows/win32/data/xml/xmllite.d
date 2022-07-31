module windows.win32.data.xml.xmllite;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.system.com_ : IMalloc, IUnknown;

version (Windows):
extern (Windows):

alias XmlNodeType = int;
enum : int
{
    XmlNodeType_None                  = 0x00000000,
    XmlNodeType_Element               = 0x00000001,
    XmlNodeType_Attribute             = 0x00000002,
    XmlNodeType_Text                  = 0x00000003,
    XmlNodeType_CDATA                 = 0x00000004,
    XmlNodeType_ProcessingInstruction = 0x00000007,
    XmlNodeType_Comment               = 0x00000008,
    XmlNodeType_DocumentType          = 0x0000000a,
    XmlNodeType_Whitespace            = 0x0000000d,
    XmlNodeType_EndElement            = 0x0000000f,
    XmlNodeType_XmlDeclaration        = 0x00000011,
    _XmlNodeType_Last                 = 0x00000011,
}

alias XmlConformanceLevel = int;
enum : int
{
    XmlConformanceLevel_Auto     = 0x00000000,
    XmlConformanceLevel_Fragment = 0x00000001,
    XmlConformanceLevel_Document = 0x00000002,
    _XmlConformanceLevel_Last    = 0x00000002,
}

alias DtdProcessing = int;
enum : int
{
    DtdProcessing_Prohibit = 0x00000000,
    DtdProcessing_Parse    = 0x00000001,
    _DtdProcessing_Last    = 0x00000001,
}

alias XmlReadState = int;
enum : int
{
    XmlReadState_Initial     = 0x00000000,
    XmlReadState_Interactive = 0x00000001,
    XmlReadState_Error       = 0x00000002,
    XmlReadState_EndOfFile   = 0x00000003,
    XmlReadState_Closed      = 0x00000004,
}

alias XmlReaderProperty = int;
enum : int
{
    XmlReaderProperty_MultiLanguage      = 0x00000000,
    XmlReaderProperty_ConformanceLevel   = 0x00000001,
    XmlReaderProperty_RandomAccess       = 0x00000002,
    XmlReaderProperty_XmlResolver        = 0x00000003,
    XmlReaderProperty_DtdProcessing      = 0x00000004,
    XmlReaderProperty_ReadState          = 0x00000005,
    XmlReaderProperty_MaxElementDepth    = 0x00000006,
    XmlReaderProperty_MaxEntityExpansion = 0x00000007,
    _XmlReaderProperty_Last              = 0x00000007,
}

alias XmlError = int;
enum : int
{
    MX_E_MX                     = 0xc00cee00,
    MX_E_INPUTEND               = 0xc00cee01,
    MX_E_ENCODING               = 0xc00cee02,
    MX_E_ENCODINGSWITCH         = 0xc00cee03,
    MX_E_ENCODINGSIGNATURE      = 0xc00cee04,
    WC_E_WC                     = 0xc00cee20,
    WC_E_WHITESPACE             = 0xc00cee21,
    WC_E_SEMICOLON              = 0xc00cee22,
    WC_E_GREATERTHAN            = 0xc00cee23,
    WC_E_QUOTE                  = 0xc00cee24,
    WC_E_EQUAL                  = 0xc00cee25,
    WC_E_LESSTHAN               = 0xc00cee26,
    WC_E_HEXDIGIT               = 0xc00cee27,
    WC_E_DIGIT                  = 0xc00cee28,
    WC_E_LEFTBRACKET            = 0xc00cee29,
    WC_E_LEFTPAREN              = 0xc00cee2a,
    WC_E_XMLCHARACTER           = 0xc00cee2b,
    WC_E_NAMECHARACTER          = 0xc00cee2c,
    WC_E_SYNTAX                 = 0xc00cee2d,
    WC_E_CDSECT                 = 0xc00cee2e,
    WC_E_COMMENT                = 0xc00cee2f,
    WC_E_CONDSECT               = 0xc00cee30,
    WC_E_DECLATTLIST            = 0xc00cee31,
    WC_E_DECLDOCTYPE            = 0xc00cee32,
    WC_E_DECLELEMENT            = 0xc00cee33,
    WC_E_DECLENTITY             = 0xc00cee34,
    WC_E_DECLNOTATION           = 0xc00cee35,
    WC_E_NDATA                  = 0xc00cee36,
    WC_E_PUBLIC                 = 0xc00cee37,
    WC_E_SYSTEM                 = 0xc00cee38,
    WC_E_NAME                   = 0xc00cee39,
    WC_E_ROOTELEMENT            = 0xc00cee3a,
    WC_E_ELEMENTMATCH           = 0xc00cee3b,
    WC_E_UNIQUEATTRIBUTE        = 0xc00cee3c,
    WC_E_TEXTXMLDECL            = 0xc00cee3d,
    WC_E_LEADINGXML             = 0xc00cee3e,
    WC_E_TEXTDECL               = 0xc00cee3f,
    WC_E_XMLDECL                = 0xc00cee40,
    WC_E_ENCNAME                = 0xc00cee41,
    WC_E_PUBLICID               = 0xc00cee42,
    WC_E_PESINTERNALSUBSET      = 0xc00cee43,
    WC_E_PESBETWEENDECLS        = 0xc00cee44,
    WC_E_NORECURSION            = 0xc00cee45,
    WC_E_ENTITYCONTENT          = 0xc00cee46,
    WC_E_UNDECLAREDENTITY       = 0xc00cee47,
    WC_E_PARSEDENTITY           = 0xc00cee48,
    WC_E_NOEXTERNALENTITYREF    = 0xc00cee49,
    WC_E_PI                     = 0xc00cee4a,
    WC_E_SYSTEMID               = 0xc00cee4b,
    WC_E_QUESTIONMARK           = 0xc00cee4c,
    WC_E_CDSECTEND              = 0xc00cee4d,
    WC_E_MOREDATA               = 0xc00cee4e,
    WC_E_DTDPROHIBITED          = 0xc00cee4f,
    WC_E_INVALIDXMLSPACE        = 0xc00cee50,
    NC_E_NC                     = 0xc00cee60,
    NC_E_QNAMECHARACTER         = 0xc00cee61,
    NC_E_QNAMECOLON             = 0xc00cee62,
    NC_E_NAMECOLON              = 0xc00cee63,
    NC_E_DECLAREDPREFIX         = 0xc00cee64,
    NC_E_UNDECLAREDPREFIX       = 0xc00cee65,
    NC_E_EMPTYURI               = 0xc00cee66,
    NC_E_XMLPREFIXRESERVED      = 0xc00cee67,
    NC_E_XMLNSPREFIXRESERVED    = 0xc00cee68,
    NC_E_XMLURIRESERVED         = 0xc00cee69,
    NC_E_XMLNSURIRESERVED       = 0xc00cee6a,
    SC_E_SC                     = 0xc00cee80,
    SC_E_MAXELEMENTDEPTH        = 0xc00cee81,
    SC_E_MAXENTITYEXPANSION     = 0xc00cee82,
    WR_E_WR                     = 0xc00cef00,
    WR_E_NONWHITESPACE          = 0xc00cef01,
    WR_E_NSPREFIXDECLARED       = 0xc00cef02,
    WR_E_NSPREFIXWITHEMPTYNSURI = 0xc00cef03,
    WR_E_DUPLICATEATTRIBUTE     = 0xc00cef04,
    WR_E_XMLNSPREFIXDECLARATION = 0xc00cef05,
    WR_E_XMLPREFIXDECLARATION   = 0xc00cef06,
    WR_E_XMLURIDECLARATION      = 0xc00cef07,
    WR_E_XMLNSURIDECLARATION    = 0xc00cef08,
    WR_E_NAMESPACEUNDECLARED    = 0xc00cef09,
    WR_E_INVALIDXMLSPACE        = 0xc00cef0a,
    WR_E_INVALIDACTION          = 0xc00cef0b,
    WR_E_INVALIDSURROGATEPAIR   = 0xc00cef0c,
    XML_E_INVALID_DECIMAL       = 0xc00ce01d,
    XML_E_INVALID_HEXIDECIMAL   = 0xc00ce01e,
    XML_E_INVALID_UNICODE       = 0xc00ce01f,
    XML_E_INVALIDENCODING       = 0xc00ce06e,
}

alias XmlStandalone = int;
enum : int
{
    XmlStandalone_Omit  = 0x00000000,
    XmlStandalone_Yes   = 0x00000001,
    XmlStandalone_No    = 0x00000002,
    _XmlStandalone_Last = 0x00000002,
}

alias XmlWriterProperty = int;
enum : int
{
    XmlWriterProperty_MultiLanguage       = 0x00000000,
    XmlWriterProperty_Indent              = 0x00000001,
    XmlWriterProperty_ByteOrderMark       = 0x00000002,
    XmlWriterProperty_OmitXmlDeclaration  = 0x00000003,
    XmlWriterProperty_ConformanceLevel    = 0x00000004,
    XmlWriterProperty_CompactEmptyElement = 0x00000005,
    _XmlWriterProperty_Last               = 0x00000005,
}

enum IID_IXmlReader = GUID(0x7279fc81, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
interface IXmlReader : IUnknown
{
    HRESULT SetInput(IUnknown);
    HRESULT GetProperty(uint, long*);
    HRESULT SetProperty(uint, long);
    HRESULT Read(XmlNodeType*);
    HRESULT GetNodeType(XmlNodeType*);
    HRESULT MoveToFirstAttribute();
    HRESULT MoveToNextAttribute();
    HRESULT MoveToAttributeByName(const(wchar)*, const(wchar)*);
    HRESULT MoveToElement();
    HRESULT GetQualifiedName(PWSTR*, uint*);
    HRESULT GetNamespaceUri(PWSTR*, uint*);
    HRESULT GetLocalName(PWSTR*, uint*);
    HRESULT GetPrefix(PWSTR*, uint*);
    HRESULT GetValue(PWSTR*, uint*);
    HRESULT ReadValueChunk(PWSTR, uint, uint*);
    HRESULT GetBaseUri(PWSTR*, uint*);
    BOOL IsDefault();
    BOOL IsEmptyElement();
    HRESULT GetLineNumber(uint*);
    HRESULT GetLinePosition(uint*);
    HRESULT GetAttributeCount(uint*);
    HRESULT GetDepth(uint*);
    BOOL IsEOF();
}
enum IID_IXmlResolver = GUID(0x7279fc82, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
interface IXmlResolver : IUnknown
{
    HRESULT ResolveUri(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown*);
}
enum IID_IXmlWriter = GUID(0x7279fc88, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
interface IXmlWriter : IUnknown
{
    HRESULT SetOutput(IUnknown);
    HRESULT GetProperty(uint, long*);
    HRESULT SetProperty(uint, long);
    HRESULT WriteAttributes(IXmlReader, BOOL);
    HRESULT WriteAttributeString(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT WriteCData(const(wchar)*);
    HRESULT WriteCharEntity(wchar);
    HRESULT WriteChars(const(wchar)*, uint);
    HRESULT WriteComment(const(wchar)*);
    HRESULT WriteDocType(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT WriteElementString(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT WriteEndDocument();
    HRESULT WriteEndElement();
    HRESULT WriteEntityRef(const(wchar)*);
    HRESULT WriteFullEndElement();
    HRESULT WriteName(const(wchar)*);
    HRESULT WriteNmToken(const(wchar)*);
    HRESULT WriteNode(IXmlReader, BOOL);
    HRESULT WriteNodeShallow(IXmlReader, BOOL);
    HRESULT WriteProcessingInstruction(const(wchar)*, const(wchar)*);
    HRESULT WriteQualifiedName(const(wchar)*, const(wchar)*);
    HRESULT WriteRaw(const(wchar)*);
    HRESULT WriteRawChars(const(wchar)*, uint);
    HRESULT WriteStartDocument(XmlStandalone);
    HRESULT WriteStartElement(const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT WriteString(const(wchar)*);
    HRESULT WriteSurrogateCharEntity(wchar, wchar);
    HRESULT WriteWhitespace(const(wchar)*);
    HRESULT Flush();
}
enum IID_IXmlWriterLite = GUID(0x862494c6, 0x1310, 0x4aad, [0xb3, 0xcd, 0x2d, 0xbe, 0xeb, 0xf6, 0x70, 0xd3]);
interface IXmlWriterLite : IUnknown
{
    HRESULT SetOutput(IUnknown);
    HRESULT GetProperty(uint, long*);
    HRESULT SetProperty(uint, long);
    HRESULT WriteAttributes(IXmlReader, BOOL);
    HRESULT WriteAttributeString(const(wchar)*, uint, const(wchar)*, uint);
    HRESULT WriteCData(const(wchar)*);
    HRESULT WriteCharEntity(wchar);
    HRESULT WriteChars(const(wchar)*, uint);
    HRESULT WriteComment(const(wchar)*);
    HRESULT WriteDocType(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT WriteElementString(const(wchar)*, uint, const(wchar)*);
    HRESULT WriteEndDocument();
    HRESULT WriteEndElement(const(wchar)*, uint);
    HRESULT WriteEntityRef(const(wchar)*);
    HRESULT WriteFullEndElement(const(wchar)*, uint);
    HRESULT WriteName(const(wchar)*);
    HRESULT WriteNmToken(const(wchar)*);
    HRESULT WriteNode(IXmlReader, BOOL);
    HRESULT WriteNodeShallow(IXmlReader, BOOL);
    HRESULT WriteProcessingInstruction(const(wchar)*, const(wchar)*);
    HRESULT WriteRaw(const(wchar)*);
    HRESULT WriteRawChars(const(wchar)*, uint);
    HRESULT WriteStartDocument(XmlStandalone);
    HRESULT WriteStartElement(const(wchar)*, uint);
    HRESULT WriteString(const(wchar)*);
    HRESULT WriteSurrogateCharEntity(wchar, wchar);
    HRESULT WriteWhitespace(const(wchar)*);
    HRESULT Flush();
}
HRESULT CreateXmlReader(const(GUID)*, void**, IMalloc);
HRESULT CreateXmlReaderInputWithEncodingCodePage(IUnknown, IMalloc, uint, BOOL, const(wchar)*, IUnknown*);
HRESULT CreateXmlReaderInputWithEncodingName(IUnknown, IMalloc, const(wchar)*, BOOL, const(wchar)*, IUnknown*);
HRESULT CreateXmlWriter(const(GUID)*, void**, IMalloc);
HRESULT CreateXmlWriterOutputWithEncodingCodePage(IUnknown, IMalloc, uint, IUnknown*);
HRESULT CreateXmlWriterOutputWithEncodingName(IUnknown, IMalloc, const(wchar)*, IUnknown*);
enum _IID_IXmlReader = GUID(0x7279fc81, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
enum _IID_IXmlWriter = GUID(0x7279fc88, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
enum _IID_IXmlResolver = GUID(0x7279fc82, 0x709d, 0x4095, [0xb6, 0x3d, 0x69, 0xfe, 0x4b, 0xd, 0x90, 0x30]);
