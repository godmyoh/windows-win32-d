module windows.win32.globalization;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, HRESULT, HWND, LPARAM, PSTR, PWSTR, RECT, SIZE, SYSTEMTIME;
import windows.win32.graphics.gdi : ABC, AXESLISTA, AXESLISTW, ETO_OPTIONS, HDC, HFONT, NEWTEXTMETRICA, NEWTEXTMETRICW;
import windows.win32.system.com : IEnumString, IStream, IUnknown;

version (Windows):
extern (Windows):

alias FOLD_STRING_MAP_FLAGS = uint;
enum : uint
{
    MAP_COMPOSITE        = 0x00000040,
    MAP_EXPAND_LIGATURES = 0x00002000,
    MAP_FOLDCZONE        = 0x00000010,
    MAP_FOLDDIGITS       = 0x00000080,
    MAP_PRECOMPOSED      = 0x00000020,
}

alias ENUM_DATE_FORMATS_FLAGS = uint;
enum : uint
{
    DATE_SHORTDATE        = 0x00000001,
    DATE_LONGDATE         = 0x00000002,
    DATE_YEARMONTH        = 0x00000008,
    DATE_MONTHDAY         = 0x00000080,
    DATE_AUTOLAYOUT       = 0x00000040,
    DATE_LTRREADING       = 0x00000010,
    DATE_RTLREADING       = 0x00000020,
    DATE_USE_ALT_CALENDAR = 0x00000004,
}

alias TRANSLATE_CHARSET_INFO_FLAGS = uint;
enum : uint
{
    TCI_SRCCHARSET  = 0x00000001,
    TCI_SRCCODEPAGE = 0x00000002,
    TCI_SRCFONTSIG  = 0x00000003,
    TCI_SRCLOCALE   = 0x00001000,
}

alias TIME_FORMAT_FLAGS = uint;
enum : uint
{
    TIME_NOMINUTESORSECONDS = 0x00000001,
    TIME_NOSECONDS          = 0x00000002,
    TIME_NOTIMEMARKER       = 0x00000004,
    TIME_FORCE24HOURFORMAT  = 0x00000008,
}

alias ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS = uint;
enum : uint
{
    LGRPID_INSTALLED = 0x00000001,
    LGRPID_SUPPORTED = 0x00000002,
}

alias MULTI_BYTE_TO_WIDE_CHAR_FLAGS = uint;
enum : uint
{
    MB_COMPOSITE         = 0x00000002,
    MB_ERR_INVALID_CHARS = 0x00000008,
    MB_PRECOMPOSED       = 0x00000001,
    MB_USEGLYPHCHARS     = 0x00000004,
}

alias COMPARE_STRING_FLAGS = uint;
enum : uint
{
    LINGUISTIC_IGNORECASE      = 0x00000010,
    LINGUISTIC_IGNOREDIACRITIC = 0x00000020,
    NORM_IGNORECASE            = 0x00000001,
    NORM_IGNOREKANATYPE        = 0x00010000,
    NORM_IGNORENONSPACE        = 0x00000002,
    NORM_IGNORESYMBOLS         = 0x00000004,
    NORM_IGNOREWIDTH           = 0x00020000,
    NORM_LINGUISTIC_CASING     = 0x08000000,
    SORT_DIGITSASNUMBERS       = 0x00000008,
    SORT_STRINGSORT            = 0x00001000,
}

alias IS_VALID_LOCALE_FLAGS = uint;
enum : uint
{
    LCID_INSTALLED = 0x00000001,
    LCID_SUPPORTED = 0x00000002,
}

alias ENUM_SYSTEM_CODE_PAGES_FLAGS = uint;
enum : uint
{
    CP_INSTALLED = 0x00000001,
    CP_SUPPORTED = 0x00000002,
}

alias SCRIPT_IS_COMPLEX_FLAGS = uint;
enum : uint
{
    SIC_ASCIIDIGIT = 0x00000002,
    SIC_COMPLEX    = 0x00000001,
    SIC_NEUTRAL    = 0x00000004,
}

alias IS_TEXT_UNICODE_RESULT = uint;
enum : uint
{
    IS_TEXT_UNICODE_ASCII16            = 0x00000001,
    IS_TEXT_UNICODE_REVERSE_ASCII16    = 0x00000010,
    IS_TEXT_UNICODE_STATISTICS         = 0x00000002,
    IS_TEXT_UNICODE_REVERSE_STATISTICS = 0x00000020,
    IS_TEXT_UNICODE_CONTROLS           = 0x00000004,
    IS_TEXT_UNICODE_REVERSE_CONTROLS   = 0x00000040,
    IS_TEXT_UNICODE_SIGNATURE          = 0x00000008,
    IS_TEXT_UNICODE_REVERSE_SIGNATURE  = 0x00000080,
    IS_TEXT_UNICODE_ILLEGAL_CHARS      = 0x00000100,
    IS_TEXT_UNICODE_ODD_LENGTH         = 0x00000200,
    IS_TEXT_UNICODE_NULL_BYTES         = 0x00001000,
    IS_TEXT_UNICODE_UNICODE_MASK       = 0x0000000f,
    IS_TEXT_UNICODE_REVERSE_MASK       = 0x000000f0,
    IS_TEXT_UNICODE_NOT_UNICODE_MASK   = 0x00000f00,
    IS_TEXT_UNICODE_NOT_ASCII_MASK     = 0x0000f000,
}

alias COMPARESTRING_RESULT = int;
enum : int
{
    CSTR_LESS_THAN    = 0x00000001,
    CSTR_EQUAL        = 0x00000002,
    CSTR_GREATER_THAN = 0x00000003,
}

int GetTextCharset(HDC);
int GetTextCharsetInfo(HDC, FONTSIGNATURE*, uint);
BOOL TranslateCharsetInfo(uint*, CHARSETINFO*, TRANSLATE_CHARSET_INFO_FLAGS);
int GetDateFormatA(uint, uint, const(SYSTEMTIME)*, const(char)*, PSTR, int);
int GetDateFormatW(uint, uint, const(SYSTEMTIME)*, const(wchar)*, PWSTR, int);
int GetTimeFormatA(uint, uint, const(SYSTEMTIME)*, const(char)*, PSTR, int);
int GetTimeFormatW(uint, uint, const(SYSTEMTIME)*, const(wchar)*, PWSTR, int);
int GetTimeFormatEx(const(wchar)*, TIME_FORMAT_FLAGS, const(SYSTEMTIME)*, const(wchar)*, PWSTR, int);
int GetDateFormatEx(const(wchar)*, ENUM_DATE_FORMATS_FLAGS, const(SYSTEMTIME)*, const(wchar)*, PWSTR, int, const(wchar)*);
int GetDurationFormatEx(const(wchar)*, uint, const(SYSTEMTIME)*, ulong, const(wchar)*, PWSTR, int);
COMPARESTRING_RESULT CompareStringEx(const(wchar)*, COMPARE_STRING_FLAGS, const(wchar)*, int, const(wchar)*, int, NLSVERSIONINFO*, void*, LPARAM);
COMPARESTRING_RESULT CompareStringOrdinal(const(wchar)*, int, const(wchar)*, int, BOOL);
COMPARESTRING_RESULT CompareStringW(uint, uint, const(wchar)*, int, const(wchar)*, int);
int FoldStringW(FOLD_STRING_MAP_FLAGS, const(wchar)*, int, PWSTR, int);
BOOL GetStringTypeExW(uint, uint, const(wchar)*, int, ushort*);
BOOL GetStringTypeW(uint, const(wchar)*, int, ushort*);
int MultiByteToWideChar(uint, MULTI_BYTE_TO_WIDE_CHAR_FLAGS, const(char)*, int, PWSTR, int);
int WideCharToMultiByte(uint, uint, const(wchar)*, int, PSTR, int, const(char)*, int*);
BOOL IsValidCodePage(uint);
uint GetACP();
uint GetOEMCP();
BOOL GetCPInfo(uint, CPINFO*);
BOOL GetCPInfoExA(uint, uint, CPINFOEXA*);
BOOL GetCPInfoExW(uint, uint, CPINFOEXW*);
COMPARESTRING_RESULT CompareStringA(uint, uint, byte*, int, byte*, int);
int FindNLSString(uint, uint, const(wchar)*, int, const(wchar)*, int, int*);
int LCMapStringW(uint, uint, const(wchar)*, int, PWSTR, int);
int LCMapStringA(uint, uint, const(char)*, int, PSTR, int);
int GetLocaleInfoW(uint, uint, PWSTR, int);
int GetLocaleInfoA(uint, uint, PSTR, int);
BOOL SetLocaleInfoA(uint, uint, const(char)*);
BOOL SetLocaleInfoW(uint, uint, const(wchar)*);
int GetCalendarInfoA(uint, uint, uint, PSTR, int, uint*);
int GetCalendarInfoW(uint, uint, uint, PWSTR, int, uint*);
BOOL SetCalendarInfoA(uint, uint, uint, const(char)*);
BOOL SetCalendarInfoW(uint, uint, uint, const(wchar)*);
BOOL IsDBCSLeadByte(ubyte);
BOOL IsDBCSLeadByteEx(uint, ubyte);
uint LocaleNameToLCID(const(wchar)*, uint);
int LCIDToLocaleName(uint, PWSTR, int, uint);
int GetDurationFormat(uint, uint, const(SYSTEMTIME)*, ulong, const(wchar)*, PWSTR, int);
int GetNumberFormatA(uint, uint, const(char)*, const(NUMBERFMTA)*, PSTR, int);
int GetNumberFormatW(uint, uint, const(wchar)*, const(NUMBERFMTW)*, PWSTR, int);
int GetCurrencyFormatA(uint, uint, const(char)*, const(CURRENCYFMTA)*, PSTR, int);
int GetCurrencyFormatW(uint, uint, const(wchar)*, const(CURRENCYFMTW)*, PWSTR, int);
BOOL EnumCalendarInfoA(CALINFO_ENUMPROCA, uint, uint, uint);
BOOL EnumCalendarInfoW(CALINFO_ENUMPROCW, uint, uint, uint);
BOOL EnumCalendarInfoExA(CALINFO_ENUMPROCEXA, uint, uint, uint);
BOOL EnumCalendarInfoExW(CALINFO_ENUMPROCEXW, uint, uint, uint);
BOOL EnumTimeFormatsA(TIMEFMT_ENUMPROCA, uint, TIME_FORMAT_FLAGS);
BOOL EnumTimeFormatsW(TIMEFMT_ENUMPROCW, uint, TIME_FORMAT_FLAGS);
BOOL EnumDateFormatsA(DATEFMT_ENUMPROCA, uint, uint);
BOOL EnumDateFormatsW(DATEFMT_ENUMPROCW, uint, uint);
BOOL EnumDateFormatsExA(DATEFMT_ENUMPROCEXA, uint, uint);
BOOL EnumDateFormatsExW(DATEFMT_ENUMPROCEXW, uint, uint);
BOOL IsValidLanguageGroup(uint, ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS);
BOOL GetNLSVersion(uint, uint, NLSVERSIONINFO*);
BOOL IsValidLocale(uint, IS_VALID_LOCALE_FLAGS);
int GetGeoInfoA(int, uint, PSTR, int, ushort);
int GetGeoInfoW(int, uint, PWSTR, int, ushort);
int GetGeoInfoEx(PWSTR, uint, PWSTR, int);
BOOL EnumSystemGeoID(uint, int, GEO_ENUMPROC);
BOOL EnumSystemGeoNames(uint, GEO_ENUMNAMEPROC, LPARAM);
int GetUserGeoID(uint);
int GetUserDefaultGeoName(PWSTR, int);
BOOL SetUserGeoID(int);
BOOL SetUserGeoName(PWSTR);
uint ConvertDefaultLocale(uint);
ushort GetSystemDefaultUILanguage();
uint GetThreadLocale();
BOOL SetThreadLocale(uint);
ushort GetUserDefaultUILanguage();
ushort GetUserDefaultLangID();
ushort GetSystemDefaultLangID();
uint GetSystemDefaultLCID();
uint GetUserDefaultLCID();
ushort SetThreadUILanguage(ushort);
ushort GetThreadUILanguage();
BOOL GetProcessPreferredUILanguages(uint, uint*, PWSTR, uint*);
BOOL SetProcessPreferredUILanguages(uint, const(wchar)*, uint*);
BOOL GetUserPreferredUILanguages(uint, uint*, PWSTR, uint*);
BOOL GetSystemPreferredUILanguages(uint, uint*, PWSTR, uint*);
BOOL GetThreadPreferredUILanguages(uint, uint*, PWSTR, uint*);
BOOL SetThreadPreferredUILanguages(uint, const(wchar)*, uint*);
BOOL GetFileMUIInfo(uint, const(wchar)*, FILEMUIINFO*, uint*);
BOOL GetFileMUIPath(uint, const(wchar)*, PWSTR, uint*, PWSTR, uint*, ulong*);
BOOL GetUILanguageInfo(uint, const(wchar)*, PWSTR, uint*, uint*);
BOOL SetThreadPreferredUILanguages2(uint, const(wchar)*, uint*, HSAVEDUILANGUAGES*);
void RestoreThreadPreferredUILanguages(const(HSAVEDUILANGUAGES));
BOOL NotifyUILanguageChange(uint, const(wchar)*, const(wchar)*, uint, uint*);
BOOL GetStringTypeExA(uint, uint, const(char)*, int, ushort*);
BOOL GetStringTypeA(uint, uint, const(char)*, int, ushort*);
int FoldStringA(FOLD_STRING_MAP_FLAGS, const(char)*, int, PSTR, int);
BOOL EnumSystemLocalesA(LOCALE_ENUMPROCA, uint);
BOOL EnumSystemLocalesW(LOCALE_ENUMPROCW, uint);
BOOL EnumSystemLanguageGroupsA(LANGUAGEGROUP_ENUMPROCA, ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS, long);
BOOL EnumSystemLanguageGroupsW(LANGUAGEGROUP_ENUMPROCW, ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS, long);
BOOL EnumLanguageGroupLocalesA(LANGGROUPLOCALE_ENUMPROCA, uint, uint, long);
BOOL EnumLanguageGroupLocalesW(LANGGROUPLOCALE_ENUMPROCW, uint, uint, long);
BOOL EnumUILanguagesA(UILANGUAGE_ENUMPROCA, uint, long);
BOOL EnumUILanguagesW(UILANGUAGE_ENUMPROCW, uint, long);
BOOL EnumSystemCodePagesA(CODEPAGE_ENUMPROCA, ENUM_SYSTEM_CODE_PAGES_FLAGS);
BOOL EnumSystemCodePagesW(CODEPAGE_ENUMPROCW, ENUM_SYSTEM_CODE_PAGES_FLAGS);
int IdnToAscii(uint, const(wchar)*, int, PWSTR, int);
int IdnToUnicode(uint, const(wchar)*, int, PWSTR, int);
int IdnToNameprepUnicode(uint, const(wchar)*, int, PWSTR, int);
int NormalizeString(NORM_FORM, const(wchar)*, int, PWSTR, int);
BOOL IsNormalizedString(NORM_FORM, const(wchar)*, int);
BOOL VerifyScripts(uint, const(wchar)*, int, const(wchar)*, int);
int GetStringScripts(uint, const(wchar)*, int, PWSTR, int);
int GetLocaleInfoEx(const(wchar)*, uint, PWSTR, int);
int GetCalendarInfoEx(const(wchar)*, uint, const(wchar)*, uint, PWSTR, int, uint*);
int GetNumberFormatEx(const(wchar)*, uint, const(wchar)*, const(NUMBERFMTW)*, PWSTR, int);
int GetCurrencyFormatEx(const(wchar)*, uint, const(wchar)*, const(CURRENCYFMTW)*, PWSTR, int);
int GetUserDefaultLocaleName(PWSTR, int);
int GetSystemDefaultLocaleName(PWSTR, int);
BOOL IsNLSDefinedString(uint, uint, NLSVERSIONINFO*, const(wchar)*, int);
BOOL GetNLSVersionEx(uint, const(wchar)*, NLSVERSIONINFOEX*);
uint IsValidNLSVersion(uint, const(wchar)*, NLSVERSIONINFOEX*);
int FindNLSStringEx(const(wchar)*, uint, const(wchar)*, int, const(wchar)*, int, int*, NLSVERSIONINFO*, void*, LPARAM);
int LCMapStringEx(const(wchar)*, uint, const(wchar)*, int, PWSTR, int, NLSVERSIONINFO*, void*, LPARAM);
BOOL IsValidLocaleName(const(wchar)*);
BOOL EnumCalendarInfoExEx(CALINFO_ENUMPROCEXEX, const(wchar)*, uint, const(wchar)*, uint, LPARAM);
BOOL EnumDateFormatsExEx(DATEFMT_ENUMPROCEXEX, const(wchar)*, ENUM_DATE_FORMATS_FLAGS, LPARAM);
BOOL EnumTimeFormatsEx(TIMEFMT_ENUMPROCEX, const(wchar)*, uint, LPARAM);
BOOL EnumSystemLocalesEx(LOCALE_ENUMPROCEX, uint, LPARAM, void*);
int ResolveLocaleName(const(wchar)*, PWSTR, int);
HRESULT MappingGetServices(MAPPING_ENUM_OPTIONS*, MAPPING_SERVICE_INFO**, uint*);
HRESULT MappingFreeServices(MAPPING_SERVICE_INFO*);
HRESULT MappingRecognizeText(MAPPING_SERVICE_INFO*, const(wchar)*, uint, uint, MAPPING_OPTIONS*, MAPPING_PROPERTY_BAG*);
HRESULT MappingDoAction(MAPPING_PROPERTY_BAG*, uint, const(wchar)*);
HRESULT MappingFreePropertyBag(MAPPING_PROPERTY_BAG*);
HRESULT ScriptFreeCache(void**);
HRESULT ScriptItemize(const(wchar)*, int, int, const(SCRIPT_CONTROL)*, const(SCRIPT_STATE)*, SCRIPT_ITEM*, int*);
HRESULT ScriptLayout(int, const(ubyte)*, int*, int*);
HRESULT ScriptShape(HDC, void**, const(wchar)*, int, int, SCRIPT_ANALYSIS*, ushort*, ushort*, SCRIPT_VISATTR*, int*);
HRESULT ScriptPlace(HDC, void**, const(ushort)*, int, const(SCRIPT_VISATTR)*, SCRIPT_ANALYSIS*, int*, GOFFSET*, ABC*);
HRESULT ScriptTextOut(const(HDC), void**, int, int, uint, const(RECT)*, const(SCRIPT_ANALYSIS)*, const(wchar)*, int, const(ushort)*, int, const(int)*, const(int)*, const(GOFFSET)*);
HRESULT ScriptJustify(const(SCRIPT_VISATTR)*, const(int)*, int, int, int, int*);
HRESULT ScriptBreak(const(wchar)*, int, const(SCRIPT_ANALYSIS)*, SCRIPT_LOGATTR*);
HRESULT ScriptCPtoX(int, BOOL, int, int, const(ushort)*, const(SCRIPT_VISATTR)*, const(int)*, const(SCRIPT_ANALYSIS)*, int*);
HRESULT ScriptXtoCP(int, int, int, const(ushort)*, const(SCRIPT_VISATTR)*, const(int)*, const(SCRIPT_ANALYSIS)*, int*, int*);
HRESULT ScriptGetLogicalWidths(const(SCRIPT_ANALYSIS)*, int, int, const(int)*, const(ushort)*, const(SCRIPT_VISATTR)*, int*);
HRESULT ScriptApplyLogicalWidth(const(int)*, int, int, const(ushort)*, const(SCRIPT_VISATTR)*, const(int)*, const(SCRIPT_ANALYSIS)*, ABC*, int*);
HRESULT ScriptGetCMap(HDC, void**, const(wchar)*, int, uint, ushort*);
HRESULT ScriptGetGlyphABCWidth(HDC, void**, ushort, ABC*);
HRESULT ScriptGetProperties(const(SCRIPT_PROPERTIES)***, int*);
HRESULT ScriptGetFontProperties(HDC, void**, SCRIPT_FONTPROPERTIES*);
HRESULT ScriptCacheGetHeight(HDC, void**, int*);
HRESULT ScriptStringAnalyse(HDC, const(void)*, int, int, int, uint, int, SCRIPT_CONTROL*, SCRIPT_STATE*, const(int)*, SCRIPT_TABDEF*, const(ubyte)*, void**);
HRESULT ScriptStringFree(void**);
SIZE* ScriptString_pSize(void*);
int* ScriptString_pcOutChars(void*);
SCRIPT_LOGATTR* ScriptString_pLogAttr(void*);
HRESULT ScriptStringGetOrder(void*, uint*);
HRESULT ScriptStringCPtoX(void*, int, BOOL, int*);
HRESULT ScriptStringXtoCP(void*, int, int*, int*);
HRESULT ScriptStringGetLogicalWidths(void*, int*);
HRESULT ScriptStringValidate(void*);
HRESULT ScriptStringOut(void*, int, int, ETO_OPTIONS, const(RECT)*, int, int, BOOL);
HRESULT ScriptIsComplex(const(wchar)*, int, SCRIPT_IS_COMPLEX_FLAGS);
HRESULT ScriptRecordDigitSubstitution(uint, SCRIPT_DIGITSUBSTITUTE*);
HRESULT ScriptApplyDigitSubstitution(const(SCRIPT_DIGITSUBSTITUTE)*, SCRIPT_CONTROL*, SCRIPT_STATE*);
HRESULT ScriptShapeOpenType(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, int*, TEXTRANGE_PROPERTIES**, int, const(wchar)*, int, int, ushort*, SCRIPT_CHARPROP*, ushort*, SCRIPT_GLYPHPROP*, int*);
HRESULT ScriptPlaceOpenType(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, int*, TEXTRANGE_PROPERTIES**, int, const(wchar)*, ushort*, SCRIPT_CHARPROP*, int, const(ushort)*, const(SCRIPT_GLYPHPROP)*, int, int*, GOFFSET*, ABC*);
HRESULT ScriptItemizeOpenType(const(wchar)*, int, int, const(SCRIPT_CONTROL)*, const(SCRIPT_STATE)*, SCRIPT_ITEM*, uint*, int*);
HRESULT ScriptGetFontScriptTags(HDC, void**, SCRIPT_ANALYSIS*, int, uint*, int*);
HRESULT ScriptGetFontLanguageTags(HDC, void**, SCRIPT_ANALYSIS*, uint, int, uint*, int*);
HRESULT ScriptGetFontFeatureTags(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, int, uint*, int*);
HRESULT ScriptGetFontAlternateGlyphs(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, uint, ushort, int, ushort*, int*);
HRESULT ScriptSubstituteSingleGlyph(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, uint, int, ushort, ushort*);
HRESULT ScriptPositionSingleGlyph(HDC, void**, SCRIPT_ANALYSIS*, uint, uint, uint, int, ushort, int, GOFFSET, int*, GOFFSET*);
int utf8_nextCharSafeBody(const(ubyte)*, int*, int, int, byte);
int utf8_appendCharSafeBody(ubyte*, int, int, int, byte*);
int utf8_prevCharSafeBody(const(ubyte)*, int, int*, int, byte);
int utf8_back1SafeBody(const(ubyte)*, int, int);
void u_versionFromString(ubyte*, const(char)*);
void u_versionFromUString(ubyte*, const(ushort)*);
void u_versionToString(const(ubyte)*, PSTR);
void u_getVersion(ubyte*);
PSTR u_errorName(UErrorCode);
void utrace_setLevel(int);
int utrace_getLevel();
void utrace_setFunctions(const(void)*, UTraceEntry, UTraceExit, UTraceData);
void utrace_getFunctions(const(void)**, UTraceEntry*, UTraceExit*, UTraceData*);
int utrace_vformat(PSTR, int, int, const(char)*, byte*);
int utrace_format(PSTR, int, int, const(char)*);
PSTR utrace_functionName(int);
int u_shapeArabic(const(ushort)*, int, ushort*, int, uint, UErrorCode*);
int uscript_getCode(const(char)*, UScriptCode*, int, UErrorCode*);
PSTR uscript_getName(UScriptCode);
PSTR uscript_getShortName(UScriptCode);
UScriptCode uscript_getScript(int, UErrorCode*);
byte uscript_hasScript(int, UScriptCode);
int uscript_getScriptExtensions(int, UScriptCode*, int, UErrorCode*);
int uscript_getSampleString(UScriptCode, ushort*, int, UErrorCode*);
UScriptUsage uscript_getUsage(UScriptCode);
byte uscript_isRightToLeft(UScriptCode);
byte uscript_breaksBetweenLetters(UScriptCode);
byte uscript_isCased(UScriptCode);
int uiter_current32(UCharIterator*);
int uiter_next32(UCharIterator*);
int uiter_previous32(UCharIterator*);
uint uiter_getState(const(UCharIterator)*);
void uiter_setState(UCharIterator*, uint, UErrorCode*);
void uiter_setString(UCharIterator*, const(ushort)*, int);
void uiter_setUTF16BE(UCharIterator*, const(char)*, int);
void uiter_setUTF8(UCharIterator*, const(char)*, int);
void uenum_close(UEnumeration*);
int uenum_count(UEnumeration*, UErrorCode*);
ushort* uenum_unext(UEnumeration*, int*, UErrorCode*);
PSTR uenum_next(UEnumeration*, int*, UErrorCode*);
void uenum_reset(UEnumeration*, UErrorCode*);
UEnumeration* uenum_openUCharStringsEnumeration(const(ushort)**, int, UErrorCode*);
UEnumeration* uenum_openCharStringsEnumeration(const(byte)**, int, UErrorCode*);
PSTR uloc_getDefault();
void uloc_setDefault(const(char)*, UErrorCode*);
int uloc_getLanguage(const(char)*, PSTR, int, UErrorCode*);
int uloc_getScript(const(char)*, PSTR, int, UErrorCode*);
int uloc_getCountry(const(char)*, PSTR, int, UErrorCode*);
int uloc_getVariant(const(char)*, PSTR, int, UErrorCode*);
int uloc_getName(const(char)*, PSTR, int, UErrorCode*);
int uloc_canonicalize(const(char)*, PSTR, int, UErrorCode*);
PSTR uloc_getISO3Language(const(char)*);
PSTR uloc_getISO3Country(const(char)*);
uint uloc_getLCID(const(char)*);
int uloc_getDisplayLanguage(const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayScript(const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayCountry(const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayVariant(const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayKeyword(const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayKeywordValue(const(char)*, const(char)*, const(char)*, ushort*, int, UErrorCode*);
int uloc_getDisplayName(const(char)*, const(char)*, ushort*, int, UErrorCode*);
PSTR uloc_getAvailable(int);
int uloc_countAvailable();
UEnumeration* uloc_openAvailableByType(ULocAvailableType, UErrorCode*);
byte** uloc_getISOLanguages();
byte** uloc_getISOCountries();
int uloc_getParent(const(char)*, PSTR, int, UErrorCode*);
int uloc_getBaseName(const(char)*, PSTR, int, UErrorCode*);
UEnumeration* uloc_openKeywords(const(char)*, UErrorCode*);
int uloc_getKeywordValue(const(char)*, const(char)*, PSTR, int, UErrorCode*);
int uloc_setKeywordValue(const(char)*, const(char)*, PSTR, int, UErrorCode*);
byte uloc_isRightToLeft(const(char)*);
ULayoutType uloc_getCharacterOrientation(const(char)*, UErrorCode*);
ULayoutType uloc_getLineOrientation(const(char)*, UErrorCode*);
int uloc_acceptLanguageFromHTTP(PSTR, int, UAcceptResult*, const(char)*, UEnumeration*, UErrorCode*);
int uloc_acceptLanguage(PSTR, int, UAcceptResult*, const(byte)**, int, UEnumeration*, UErrorCode*);
int uloc_getLocaleForLCID(uint, PSTR, int, UErrorCode*);
int uloc_addLikelySubtags(const(char)*, PSTR, int, UErrorCode*);
int uloc_minimizeSubtags(const(char)*, PSTR, int, UErrorCode*);
int uloc_forLanguageTag(const(char)*, PSTR, int, int*, UErrorCode*);
int uloc_toLanguageTag(const(char)*, PSTR, int, byte, UErrorCode*);
PSTR uloc_toUnicodeLocaleKey(const(char)*);
PSTR uloc_toUnicodeLocaleType(const(char)*, const(char)*);
PSTR uloc_toLegacyKey(const(char)*);
PSTR uloc_toLegacyType(const(char)*, const(char)*);
UResourceBundle* ures_open(const(char)*, const(char)*, UErrorCode*);
UResourceBundle* ures_openDirect(const(char)*, const(char)*, UErrorCode*);
UResourceBundle* ures_openU(const(ushort)*, const(char)*, UErrorCode*);
void ures_close(UResourceBundle*);
void ures_getVersion(const(UResourceBundle)*, ubyte*);
PSTR ures_getLocaleByType(const(UResourceBundle)*, ULocDataLocaleType, UErrorCode*);
ushort* ures_getString(const(UResourceBundle)*, int*, UErrorCode*);
PSTR ures_getUTF8String(const(UResourceBundle)*, PSTR, int*, byte, UErrorCode*);
ubyte* ures_getBinary(const(UResourceBundle)*, int*, UErrorCode*);
int* ures_getIntVector(const(UResourceBundle)*, int*, UErrorCode*);
uint ures_getUInt(const(UResourceBundle)*, UErrorCode*);
int ures_getInt(const(UResourceBundle)*, UErrorCode*);
int ures_getSize(const(UResourceBundle)*);
UResType ures_getType(const(UResourceBundle)*);
PSTR ures_getKey(const(UResourceBundle)*);
void ures_resetIterator(UResourceBundle*);
byte ures_hasNext(const(UResourceBundle)*);
UResourceBundle* ures_getNextResource(UResourceBundle*, UResourceBundle*, UErrorCode*);
ushort* ures_getNextString(UResourceBundle*, int*, const(byte)**, UErrorCode*);
UResourceBundle* ures_getByIndex(const(UResourceBundle)*, int, UResourceBundle*, UErrorCode*);
ushort* ures_getStringByIndex(const(UResourceBundle)*, int, int*, UErrorCode*);
PSTR ures_getUTF8StringByIndex(const(UResourceBundle)*, int, PSTR, int*, byte, UErrorCode*);
UResourceBundle* ures_getByKey(const(UResourceBundle)*, const(char)*, UResourceBundle*, UErrorCode*);
ushort* ures_getStringByKey(const(UResourceBundle)*, const(char)*, int*, UErrorCode*);
PSTR ures_getUTF8StringByKey(const(UResourceBundle)*, const(char)*, PSTR, int*, byte, UErrorCode*);
UEnumeration* ures_openAvailableLocales(const(char)*, UErrorCode*);
ULocaleDisplayNames* uldn_open(const(char)*, UDialectHandling, UErrorCode*);
void uldn_close(ULocaleDisplayNames*);
PSTR uldn_getLocale(const(ULocaleDisplayNames)*);
UDialectHandling uldn_getDialectHandling(const(ULocaleDisplayNames)*);
int uldn_localeDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_languageDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_scriptDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_scriptCodeDisplayName(const(ULocaleDisplayNames)*, UScriptCode, ushort*, int, UErrorCode*);
int uldn_regionDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_variantDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_keyDisplayName(const(ULocaleDisplayNames)*, const(char)*, ushort*, int, UErrorCode*);
int uldn_keyValueDisplayName(const(ULocaleDisplayNames)*, const(char)*, const(char)*, ushort*, int, UErrorCode*);
ULocaleDisplayNames* uldn_openForContext(const(char)*, UDisplayContext*, int, UErrorCode*);
UDisplayContext uldn_getContext(const(ULocaleDisplayNames)*, UDisplayContextType, UErrorCode*);
int ucurr_forLocale(const(char)*, ushort*, int, UErrorCode*);
void* ucurr_register(const(ushort)*, const(char)*, UErrorCode*);
byte ucurr_unregister(void*, UErrorCode*);
ushort* ucurr_getName(const(ushort)*, const(char)*, UCurrNameStyle, byte*, int*, UErrorCode*);
ushort* ucurr_getPluralName(const(ushort)*, const(char)*, byte*, const(char)*, int*, UErrorCode*);
int ucurr_getDefaultFractionDigits(const(ushort)*, UErrorCode*);
int ucurr_getDefaultFractionDigitsForUsage(const(ushort)*, const(UCurrencyUsage), UErrorCode*);
double ucurr_getRoundingIncrement(const(ushort)*, UErrorCode*);
double ucurr_getRoundingIncrementForUsage(const(ushort)*, const(UCurrencyUsage), UErrorCode*);
UEnumeration* ucurr_openISOCurrencies(uint, UErrorCode*);
byte ucurr_isAvailable(const(ushort)*, double, double, UErrorCode*);
int ucurr_countCurrencies(const(char)*, double, UErrorCode*);
int ucurr_forLocaleAndDate(const(char)*, double, int, ushort*, int, UErrorCode*);
UEnumeration* ucurr_getKeywordValuesForLocale(const(char)*, const(char)*, byte, UErrorCode*);
int ucurr_getNumericCode(const(ushort)*);
uint ucpmap_get(const(UCPMap)*, int);
int ucpmap_getRange(const(UCPMap)*, int, UCPMapRangeOption, uint, UCPMapValueFilter*, const(void)*, uint*);
UCPTrie* ucptrie_openFromBinary(UCPTrieType, UCPTrieValueWidth, const(void)*, int, int*, UErrorCode*);
void ucptrie_close(UCPTrie*);
UCPTrieType ucptrie_getType(const(UCPTrie)*);
UCPTrieValueWidth ucptrie_getValueWidth(const(UCPTrie)*);
uint ucptrie_get(const(UCPTrie)*, int);
int ucptrie_getRange(const(UCPTrie)*, int, UCPMapRangeOption, uint, UCPMapValueFilter*, const(void)*, uint*);
int ucptrie_toBinary(const(UCPTrie)*, void*, int, UErrorCode*);
int ucptrie_internalSmallIndex(const(UCPTrie)*, int);
int ucptrie_internalSmallU8Index(const(UCPTrie)*, int, ubyte, ubyte);
int ucptrie_internalU8PrevIndex(const(UCPTrie)*, int, const(ubyte)*, const(ubyte)*);
UMutableCPTrie* umutablecptrie_open(uint, uint, UErrorCode*);
UMutableCPTrie* umutablecptrie_clone(const(UMutableCPTrie)*, UErrorCode*);
void umutablecptrie_close(UMutableCPTrie*);
UMutableCPTrie* umutablecptrie_fromUCPMap(const(UCPMap)*, UErrorCode*);
UMutableCPTrie* umutablecptrie_fromUCPTrie(const(UCPTrie)*, UErrorCode*);
uint umutablecptrie_get(const(UMutableCPTrie)*, int);
int umutablecptrie_getRange(const(UMutableCPTrie)*, int, UCPMapRangeOption, uint, UCPMapValueFilter*, const(void)*, uint*);
void umutablecptrie_set(UMutableCPTrie*, int, uint, UErrorCode*);
void umutablecptrie_setRange(UMutableCPTrie*, int, int, uint, UErrorCode*);
UCPTrie* umutablecptrie_buildImmutable(UMutableCPTrie*, UCPTrieType, UCPTrieValueWidth, UErrorCode*);
void UCNV_FROM_U_CALLBACK_STOP(const(void)*, UConverterFromUnicodeArgs*, const(ushort)*, int, int, UConverterCallbackReason, UErrorCode*);
void UCNV_TO_U_CALLBACK_STOP(const(void)*, UConverterToUnicodeArgs*, const(char)*, int, UConverterCallbackReason, UErrorCode*);
void UCNV_FROM_U_CALLBACK_SKIP(const(void)*, UConverterFromUnicodeArgs*, const(ushort)*, int, int, UConverterCallbackReason, UErrorCode*);
void UCNV_FROM_U_CALLBACK_SUBSTITUTE(const(void)*, UConverterFromUnicodeArgs*, const(ushort)*, int, int, UConverterCallbackReason, UErrorCode*);
void UCNV_FROM_U_CALLBACK_ESCAPE(const(void)*, UConverterFromUnicodeArgs*, const(ushort)*, int, int, UConverterCallbackReason, UErrorCode*);
void UCNV_TO_U_CALLBACK_SKIP(const(void)*, UConverterToUnicodeArgs*, const(char)*, int, UConverterCallbackReason, UErrorCode*);
void UCNV_TO_U_CALLBACK_SUBSTITUTE(const(void)*, UConverterToUnicodeArgs*, const(char)*, int, UConverterCallbackReason, UErrorCode*);
void UCNV_TO_U_CALLBACK_ESCAPE(const(void)*, UConverterToUnicodeArgs*, const(char)*, int, UConverterCallbackReason, UErrorCode*);
int ucnv_compareNames(const(char)*, const(char)*);
UConverter* ucnv_open(const(char)*, UErrorCode*);
UConverter* ucnv_openU(const(ushort)*, UErrorCode*);
UConverter* ucnv_openCCSID(int, UConverterPlatform, UErrorCode*);
UConverter* ucnv_openPackage(const(char)*, const(char)*, UErrorCode*);
UConverter* ucnv_safeClone(const(UConverter)*, void*, int*, UErrorCode*);
void ucnv_close(UConverter*);
void ucnv_getSubstChars(const(UConverter)*, PSTR, byte*, UErrorCode*);
void ucnv_setSubstChars(UConverter*, const(char)*, byte, UErrorCode*);
void ucnv_setSubstString(UConverter*, const(ushort)*, int, UErrorCode*);
void ucnv_getInvalidChars(const(UConverter)*, PSTR, byte*, UErrorCode*);
void ucnv_getInvalidUChars(const(UConverter)*, ushort*, byte*, UErrorCode*);
void ucnv_reset(UConverter*);
void ucnv_resetToUnicode(UConverter*);
void ucnv_resetFromUnicode(UConverter*);
byte ucnv_getMaxCharSize(const(UConverter)*);
byte ucnv_getMinCharSize(const(UConverter)*);
int ucnv_getDisplayName(const(UConverter)*, const(char)*, ushort*, int, UErrorCode*);
PSTR ucnv_getName(const(UConverter)*, UErrorCode*);
int ucnv_getCCSID(const(UConverter)*, UErrorCode*);
UConverterPlatform ucnv_getPlatform(const(UConverter)*, UErrorCode*);
UConverterType ucnv_getType(const(UConverter)*);
void ucnv_getStarters(const(UConverter)*, byte*, UErrorCode*);
void ucnv_getUnicodeSet(const(UConverter)*, USet*, UConverterUnicodeSet, UErrorCode*);
void ucnv_getToUCallBack(const(UConverter)*, UConverterToUCallback*, const(void)**);
void ucnv_getFromUCallBack(const(UConverter)*, UConverterFromUCallback*, const(void)**);
void ucnv_setToUCallBack(UConverter*, UConverterToUCallback, const(void)*, UConverterToUCallback*, const(void)**, UErrorCode*);
void ucnv_setFromUCallBack(UConverter*, UConverterFromUCallback, const(void)*, UConverterFromUCallback*, const(void)**, UErrorCode*);
void ucnv_fromUnicode(UConverter*, byte**, const(char)*, const(ushort)**, const(ushort)*, int*, byte, UErrorCode*);
void ucnv_toUnicode(UConverter*, ushort**, const(ushort)*, const(byte)**, const(char)*, int*, byte, UErrorCode*);
int ucnv_fromUChars(UConverter*, PSTR, int, const(ushort)*, int, UErrorCode*);
int ucnv_toUChars(UConverter*, ushort*, int, const(char)*, int, UErrorCode*);
int ucnv_getNextUChar(UConverter*, const(byte)**, const(char)*, UErrorCode*);
void ucnv_convertEx(UConverter*, UConverter*, byte**, const(char)*, const(byte)**, const(char)*, ushort*, ushort**, ushort**, const(ushort)*, byte, byte, UErrorCode*);
int ucnv_convert(const(char)*, const(char)*, PSTR, int, const(char)*, int, UErrorCode*);
int ucnv_toAlgorithmic(UConverterType, UConverter*, PSTR, int, const(char)*, int, UErrorCode*);
int ucnv_fromAlgorithmic(UConverter*, UConverterType, PSTR, int, const(char)*, int, UErrorCode*);
int ucnv_flushCache();
int ucnv_countAvailable();
PSTR ucnv_getAvailableName(int);
UEnumeration* ucnv_openAllNames(UErrorCode*);
ushort ucnv_countAliases(const(char)*, UErrorCode*);
PSTR ucnv_getAlias(const(char)*, ushort, UErrorCode*);
void ucnv_getAliases(const(char)*, const(byte)**, UErrorCode*);
UEnumeration* ucnv_openStandardNames(const(char)*, const(char)*, UErrorCode*);
ushort ucnv_countStandards();
PSTR ucnv_getStandard(ushort, UErrorCode*);
PSTR ucnv_getStandardName(const(char)*, const(char)*, UErrorCode*);
PSTR ucnv_getCanonicalName(const(char)*, const(char)*, UErrorCode*);
PSTR ucnv_getDefaultName();
void ucnv_setDefaultName(const(char)*);
void ucnv_fixFileSeparator(const(UConverter)*, ushort*, int);
byte ucnv_isAmbiguous(const(UConverter)*);
void ucnv_setFallback(UConverter*, byte);
byte ucnv_usesFallback(const(UConverter)*);
PSTR ucnv_detectUnicodeSignature(const(char)*, int, int*, UErrorCode*);
int ucnv_fromUCountPending(const(UConverter)*, UErrorCode*);
int ucnv_toUCountPending(const(UConverter)*, UErrorCode*);
byte ucnv_isFixedWidth(UConverter*, UErrorCode*);
void ucnv_cbFromUWriteBytes(UConverterFromUnicodeArgs*, const(char)*, int, int, UErrorCode*);
void ucnv_cbFromUWriteSub(UConverterFromUnicodeArgs*, int, UErrorCode*);
void ucnv_cbFromUWriteUChars(UConverterFromUnicodeArgs*, const(ushort)**, const(ushort)*, int, UErrorCode*);
void ucnv_cbToUWriteUChars(UConverterToUnicodeArgs*, const(ushort)*, int, int, UErrorCode*);
void ucnv_cbToUWriteSub(UConverterToUnicodeArgs*, int, UErrorCode*);
void u_init(UErrorCode*);
void u_cleanup();
void u_setMemoryFunctions(const(void)*, UMemAllocFn*, UMemReallocFn*, UMemFreeFn*, UErrorCode*);
UResourceBundle* u_catopen(const(char)*, const(char)*, UErrorCode*);
void u_catclose(UResourceBundle*);
ushort* u_catgets(UResourceBundle*, int, int, const(ushort)*, int*, UErrorCode*);
byte u_hasBinaryProperty(int, UProperty);
USet* u_getBinaryPropertySet(UProperty, UErrorCode*);
byte u_isUAlphabetic(int);
byte u_isULowercase(int);
byte u_isUUppercase(int);
byte u_isUWhiteSpace(int);
int u_getIntPropertyValue(int, UProperty);
int u_getIntPropertyMinValue(UProperty);
int u_getIntPropertyMaxValue(UProperty);
UCPMap* u_getIntPropertyMap(UProperty, UErrorCode*);
double u_getNumericValue(int);
byte u_islower(int);
byte u_isupper(int);
byte u_istitle(int);
byte u_isdigit(int);
byte u_isalpha(int);
byte u_isalnum(int);
byte u_isxdigit(int);
byte u_ispunct(int);
byte u_isgraph(int);
byte u_isblank(int);
byte u_isdefined(int);
byte u_isspace(int);
byte u_isJavaSpaceChar(int);
byte u_isWhitespace(int);
byte u_iscntrl(int);
byte u_isISOControl(int);
byte u_isprint(int);
byte u_isbase(int);
UCharDirection u_charDirection(int);
byte u_isMirrored(int);
int u_charMirror(int);
int u_getBidiPairedBracket(int);
byte u_charType(int);
void u_enumCharTypes(UCharEnumTypeRange*, const(void)*);
ubyte u_getCombiningClass(int);
int u_charDigitValue(int);
UBlockCode ublock_getCode(int);
int u_charName(int, UCharNameChoice, PSTR, int, UErrorCode*);
int u_charFromName(UCharNameChoice, const(char)*, UErrorCode*);
void u_enumCharNames(int, int, UEnumCharNamesFn*, void*, UCharNameChoice, UErrorCode*);
PSTR u_getPropertyName(UProperty, UPropertyNameChoice);
UProperty u_getPropertyEnum(const(char)*);
PSTR u_getPropertyValueName(UProperty, int, UPropertyNameChoice);
int u_getPropertyValueEnum(UProperty, const(char)*);
byte u_isIDStart(int);
byte u_isIDPart(int);
byte u_isIDIgnorable(int);
byte u_isJavaIDStart(int);
byte u_isJavaIDPart(int);
int u_tolower(int);
int u_toupper(int);
int u_totitle(int);
int u_foldCase(int, uint);
int u_digit(int, byte);
int u_forDigit(int, byte);
void u_charAge(int, ubyte*);
void u_getUnicodeVersion(ubyte*);
int u_getFC_NFKC_Closure(int, ushort*, int, UErrorCode*);
UBiDi* ubidi_open();
UBiDi* ubidi_openSized(int, int, UErrorCode*);
void ubidi_close(UBiDi*);
void ubidi_setInverse(UBiDi*, byte);
byte ubidi_isInverse(UBiDi*);
void ubidi_orderParagraphsLTR(UBiDi*, byte);
byte ubidi_isOrderParagraphsLTR(UBiDi*);
void ubidi_setReorderingMode(UBiDi*, UBiDiReorderingMode);
UBiDiReorderingMode ubidi_getReorderingMode(UBiDi*);
void ubidi_setReorderingOptions(UBiDi*, uint);
uint ubidi_getReorderingOptions(UBiDi*);
void ubidi_setContext(UBiDi*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
void ubidi_setPara(UBiDi*, const(ushort)*, int, ubyte, ubyte*, UErrorCode*);
void ubidi_setLine(const(UBiDi)*, int, int, UBiDi*, UErrorCode*);
UBiDiDirection ubidi_getDirection(const(UBiDi)*);
UBiDiDirection ubidi_getBaseDirection(const(ushort)*, int);
ushort* ubidi_getText(const(UBiDi)*);
int ubidi_getLength(const(UBiDi)*);
ubyte ubidi_getParaLevel(const(UBiDi)*);
int ubidi_countParagraphs(UBiDi*);
int ubidi_getParagraph(const(UBiDi)*, int, int*, int*, ubyte*, UErrorCode*);
void ubidi_getParagraphByIndex(const(UBiDi)*, int, int*, int*, ubyte*, UErrorCode*);
ubyte ubidi_getLevelAt(const(UBiDi)*, int);
ubyte* ubidi_getLevels(UBiDi*, UErrorCode*);
void ubidi_getLogicalRun(const(UBiDi)*, int, int*, ubyte*);
int ubidi_countRuns(UBiDi*, UErrorCode*);
UBiDiDirection ubidi_getVisualRun(UBiDi*, int, int*, int*);
int ubidi_getVisualIndex(UBiDi*, int, UErrorCode*);
int ubidi_getLogicalIndex(UBiDi*, int, UErrorCode*);
void ubidi_getLogicalMap(UBiDi*, int*, UErrorCode*);
void ubidi_getVisualMap(UBiDi*, int*, UErrorCode*);
void ubidi_reorderLogical(const(ubyte)*, int, int*);
void ubidi_reorderVisual(const(ubyte)*, int, int*);
void ubidi_invertMap(const(int)*, int*, int);
int ubidi_getProcessedLength(const(UBiDi)*);
int ubidi_getResultLength(const(UBiDi)*);
UCharDirection ubidi_getCustomizedClass(UBiDi*, int);
void ubidi_setClassCallback(UBiDi*, UBiDiClassCallback, const(void)*, UBiDiClassCallback*, const(void)**, UErrorCode*);
void ubidi_getClassCallback(UBiDi*, UBiDiClassCallback*, const(void)**);
int ubidi_writeReordered(UBiDi*, ushort*, int, ushort, UErrorCode*);
int ubidi_writeReverse(const(ushort)*, int, ushort*, int, ushort, UErrorCode*);
uint ubiditransform_transform(UBiDiTransform*, const(ushort)*, int, ushort*, int, ubyte, UBiDiOrder, ubyte, UBiDiOrder, UBiDiMirroring, uint, UErrorCode*);
UBiDiTransform* ubiditransform_open(UErrorCode*);
void ubiditransform_close(UBiDiTransform*);
UText* utext_close(UText*);
UText* utext_openUTF8(UText*, const(char)*, long, UErrorCode*);
UText* utext_openUChars(UText*, const(ushort)*, long, UErrorCode*);
UText* utext_clone(UText*, const(UText)*, byte, byte, UErrorCode*);
byte utext_equals(const(UText)*, const(UText)*);
long utext_nativeLength(UText*);
byte utext_isLengthExpensive(const(UText)*);
int utext_char32At(UText*, long);
int utext_current32(UText*);
int utext_next32(UText*);
int utext_previous32(UText*);
int utext_next32From(UText*, long);
int utext_previous32From(UText*, long);
long utext_getNativeIndex(const(UText)*);
void utext_setNativeIndex(UText*, long);
byte utext_moveIndex32(UText*, int);
long utext_getPreviousNativeIndex(UText*);
int utext_extract(UText*, long, long, ushort*, int, UErrorCode*);
byte utext_isWritable(const(UText)*);
byte utext_hasMetaData(const(UText)*);
int utext_replace(UText*, long, long, const(ushort)*, int, UErrorCode*);
void utext_copy(UText*, long, long, long, byte, UErrorCode*);
void utext_freeze(UText*);
UText* utext_setup(UText*, int, UErrorCode*);
USet* uset_openEmpty();
USet* uset_open(int, int);
USet* uset_openPattern(const(ushort)*, int, UErrorCode*);
USet* uset_openPatternOptions(const(ushort)*, int, uint, UErrorCode*);
void uset_close(USet*);
USet* uset_clone(const(USet)*);
byte uset_isFrozen(const(USet)*);
void uset_freeze(USet*);
USet* uset_cloneAsThawed(const(USet)*);
void uset_set(USet*, int, int);
int uset_applyPattern(USet*, const(ushort)*, int, uint, UErrorCode*);
void uset_applyIntPropertyValue(USet*, UProperty, int, UErrorCode*);
void uset_applyPropertyAlias(USet*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
byte uset_resemblesPattern(const(ushort)*, int, int);
int uset_toPattern(const(USet)*, ushort*, int, byte, UErrorCode*);
void uset_add(USet*, int);
void uset_addAll(USet*, const(USet)*);
void uset_addRange(USet*, int, int);
void uset_addString(USet*, const(ushort)*, int);
void uset_addAllCodePoints(USet*, const(ushort)*, int);
void uset_remove(USet*, int);
void uset_removeRange(USet*, int, int);
void uset_removeString(USet*, const(ushort)*, int);
void uset_removeAll(USet*, const(USet)*);
void uset_retain(USet*, int, int);
void uset_retainAll(USet*, const(USet)*);
void uset_compact(USet*);
void uset_complement(USet*);
void uset_complementAll(USet*, const(USet)*);
void uset_clear(USet*);
void uset_closeOver(USet*, int);
void uset_removeAllStrings(USet*);
byte uset_isEmpty(const(USet)*);
byte uset_contains(const(USet)*, int);
byte uset_containsRange(const(USet)*, int, int);
byte uset_containsString(const(USet)*, const(ushort)*, int);
int uset_indexOf(const(USet)*, int);
int uset_charAt(const(USet)*, int);
int uset_size(const(USet)*);
int uset_getItemCount(const(USet)*);
int uset_getItem(const(USet)*, int, int*, int*, ushort*, int, UErrorCode*);
byte uset_containsAll(const(USet)*, const(USet)*);
byte uset_containsAllCodePoints(const(USet)*, const(ushort)*, int);
byte uset_containsNone(const(USet)*, const(USet)*);
byte uset_containsSome(const(USet)*, const(USet)*);
int uset_span(const(USet)*, const(ushort)*, int, USetSpanCondition);
int uset_spanBack(const(USet)*, const(ushort)*, int, USetSpanCondition);
int uset_spanUTF8(const(USet)*, const(char)*, int, USetSpanCondition);
int uset_spanBackUTF8(const(USet)*, const(char)*, int, USetSpanCondition);
byte uset_equals(const(USet)*, const(USet)*);
int uset_serialize(const(USet)*, ushort*, int, UErrorCode*);
byte uset_getSerializedSet(USerializedSet*, const(ushort)*, int);
void uset_setSerializedToOne(USerializedSet*, int);
byte uset_serializedContains(const(USerializedSet)*, int);
int uset_getSerializedRangeCount(const(USerializedSet)*);
byte uset_getSerializedRange(const(USerializedSet)*, int, int*, int*);
UNormalizer2* unorm2_getNFCInstance(UErrorCode*);
UNormalizer2* unorm2_getNFDInstance(UErrorCode*);
UNormalizer2* unorm2_getNFKCInstance(UErrorCode*);
UNormalizer2* unorm2_getNFKDInstance(UErrorCode*);
UNormalizer2* unorm2_getNFKCCasefoldInstance(UErrorCode*);
UNormalizer2* unorm2_getInstance(const(char)*, const(char)*, UNormalization2Mode, UErrorCode*);
UNormalizer2* unorm2_openFiltered(const(UNormalizer2)*, const(USet)*, UErrorCode*);
void unorm2_close(UNormalizer2*);
int unorm2_normalize(const(UNormalizer2)*, const(ushort)*, int, ushort*, int, UErrorCode*);
int unorm2_normalizeSecondAndAppend(const(UNormalizer2)*, ushort*, int, int, const(ushort)*, int, UErrorCode*);
int unorm2_append(const(UNormalizer2)*, ushort*, int, int, const(ushort)*, int, UErrorCode*);
int unorm2_getDecomposition(const(UNormalizer2)*, int, ushort*, int, UErrorCode*);
int unorm2_getRawDecomposition(const(UNormalizer2)*, int, ushort*, int, UErrorCode*);
int unorm2_composePair(const(UNormalizer2)*, int, int);
ubyte unorm2_getCombiningClass(const(UNormalizer2)*, int);
byte unorm2_isNormalized(const(UNormalizer2)*, const(ushort)*, int, UErrorCode*);
UNormalizationCheckResult unorm2_quickCheck(const(UNormalizer2)*, const(ushort)*, int, UErrorCode*);
int unorm2_spanQuickCheckYes(const(UNormalizer2)*, const(ushort)*, int, UErrorCode*);
byte unorm2_hasBoundaryBefore(const(UNormalizer2)*, int);
byte unorm2_hasBoundaryAfter(const(UNormalizer2)*, int);
byte unorm2_isInert(const(UNormalizer2)*, int);
int unorm_compare(const(ushort)*, int, const(ushort)*, int, uint, UErrorCode*);
UConverterSelector* ucnvsel_open(const(byte)**, int, const(USet)*, const(UConverterUnicodeSet), UErrorCode*);
void ucnvsel_close(UConverterSelector*);
UConverterSelector* ucnvsel_openFromSerialized(const(void)*, int, UErrorCode*);
int ucnvsel_serialize(const(UConverterSelector)*, void*, int, UErrorCode*);
UEnumeration* ucnvsel_selectForString(const(UConverterSelector)*, const(ushort)*, int, UErrorCode*);
UEnumeration* ucnvsel_selectForUTF8(const(UConverterSelector)*, const(char)*, int, UErrorCode*);
void u_charsToUChars(const(char)*, ushort*, int);
void u_UCharsToChars(const(ushort)*, PSTR, int);
int u_strlen(const(ushort)*);
int u_countChar32(const(ushort)*, int);
byte u_strHasMoreChar32Than(const(ushort)*, int, int);
ushort* u_strcat(ushort*, const(ushort)*);
ushort* u_strncat(ushort*, const(ushort)*, int);
ushort* u_strstr(const(ushort)*, const(ushort)*);
ushort* u_strFindFirst(const(ushort)*, int, const(ushort)*, int);
ushort* u_strchr(const(ushort)*, ushort);
ushort* u_strchr32(const(ushort)*, int);
ushort* u_strrstr(const(ushort)*, const(ushort)*);
ushort* u_strFindLast(const(ushort)*, int, const(ushort)*, int);
ushort* u_strrchr(const(ushort)*, ushort);
ushort* u_strrchr32(const(ushort)*, int);
ushort* u_strpbrk(const(ushort)*, const(ushort)*);
int u_strcspn(const(ushort)*, const(ushort)*);
int u_strspn(const(ushort)*, const(ushort)*);
ushort* u_strtok_r(ushort*, const(ushort)*, ushort**);
int u_strcmp(const(ushort)*, const(ushort)*);
int u_strcmpCodePointOrder(const(ushort)*, const(ushort)*);
int u_strCompare(const(ushort)*, int, const(ushort)*, int, byte);
int u_strCompareIter(UCharIterator*, UCharIterator*, byte);
int u_strCaseCompare(const(ushort)*, int, const(ushort)*, int, uint, UErrorCode*);
int u_strncmp(const(ushort)*, const(ushort)*, int);
int u_strncmpCodePointOrder(const(ushort)*, const(ushort)*, int);
int u_strcasecmp(const(ushort)*, const(ushort)*, uint);
int u_strncasecmp(const(ushort)*, const(ushort)*, int, uint);
int u_memcasecmp(const(ushort)*, const(ushort)*, int, uint);
ushort* u_strcpy(ushort*, const(ushort)*);
ushort* u_strncpy(ushort*, const(ushort)*, int);
ushort* u_uastrcpy(ushort*, const(char)*);
ushort* u_uastrncpy(ushort*, const(char)*, int);
PSTR u_austrcpy(PSTR, const(ushort)*);
PSTR u_austrncpy(PSTR, const(ushort)*, int);
ushort* u_memcpy(ushort*, const(ushort)*, int);
ushort* u_memmove(ushort*, const(ushort)*, int);
ushort* u_memset(ushort*, ushort, int);
int u_memcmp(const(ushort)*, const(ushort)*, int);
int u_memcmpCodePointOrder(const(ushort)*, const(ushort)*, int);
ushort* u_memchr(const(ushort)*, ushort, int);
ushort* u_memchr32(const(ushort)*, int, int);
ushort* u_memrchr(const(ushort)*, ushort, int);
ushort* u_memrchr32(const(ushort)*, int, int);
int u_unescape(const(char)*, ushort*, int);
int u_unescapeAt(UNESCAPE_CHAR_AT, int*, int, void*);
int u_strToUpper(ushort*, int, const(ushort)*, int, const(char)*, UErrorCode*);
int u_strToLower(ushort*, int, const(ushort)*, int, const(char)*, UErrorCode*);
int u_strToTitle(ushort*, int, const(ushort)*, int, UBreakIterator*, const(char)*, UErrorCode*);
int u_strFoldCase(ushort*, int, const(ushort)*, int, uint, UErrorCode*);
PWSTR u_strToWCS(PWSTR, int, int*, const(ushort)*, int, UErrorCode*);
ushort* u_strFromWCS(ushort*, int, int*, const(wchar)*, int, UErrorCode*);
PSTR u_strToUTF8(PSTR, int, int*, const(ushort)*, int, UErrorCode*);
ushort* u_strFromUTF8(ushort*, int, int*, const(char)*, int, UErrorCode*);
PSTR u_strToUTF8WithSub(PSTR, int, int*, const(ushort)*, int, int, int*, UErrorCode*);
ushort* u_strFromUTF8WithSub(ushort*, int, int*, const(char)*, int, int, int*, UErrorCode*);
ushort* u_strFromUTF8Lenient(ushort*, int, int*, const(char)*, int, UErrorCode*);
int* u_strToUTF32(int*, int, int*, const(ushort)*, int, UErrorCode*);
ushort* u_strFromUTF32(ushort*, int, int*, const(int)*, int, UErrorCode*);
int* u_strToUTF32WithSub(int*, int, int*, const(ushort)*, int, int, int*, UErrorCode*);
ushort* u_strFromUTF32WithSub(ushort*, int, int*, const(int)*, int, int, int*, UErrorCode*);
PSTR u_strToJavaModifiedUTF8(PSTR, int, int*, const(ushort)*, int, UErrorCode*);
ushort* u_strFromJavaModifiedUTF8WithSub(ushort*, int, int*, const(char)*, int, int, int*, UErrorCode*);
UCaseMap* ucasemap_open(const(char)*, uint, UErrorCode*);
void ucasemap_close(UCaseMap*);
PSTR ucasemap_getLocale(const(UCaseMap)*);
uint ucasemap_getOptions(const(UCaseMap)*);
void ucasemap_setLocale(UCaseMap*, const(char)*, UErrorCode*);
void ucasemap_setOptions(UCaseMap*, uint, UErrorCode*);
UBreakIterator* ucasemap_getBreakIterator(const(UCaseMap)*);
void ucasemap_setBreakIterator(UCaseMap*, UBreakIterator*, UErrorCode*);
int ucasemap_toTitle(UCaseMap*, ushort*, int, const(ushort)*, int, UErrorCode*);
int ucasemap_utf8ToLower(const(UCaseMap)*, PSTR, int, const(char)*, int, UErrorCode*);
int ucasemap_utf8ToUpper(const(UCaseMap)*, PSTR, int, const(char)*, int, UErrorCode*);
int ucasemap_utf8ToTitle(UCaseMap*, PSTR, int, const(char)*, int, UErrorCode*);
int ucasemap_utf8FoldCase(const(UCaseMap)*, PSTR, int, const(char)*, int, UErrorCode*);
UStringPrepProfile* usprep_open(const(char)*, const(char)*, UErrorCode*);
UStringPrepProfile* usprep_openByType(UStringPrepProfileType, UErrorCode*);
void usprep_close(UStringPrepProfile*);
int usprep_prepare(const(UStringPrepProfile)*, const(ushort)*, int, ushort*, int, int, UParseError*, UErrorCode*);
UIDNA* uidna_openUTS46(uint, UErrorCode*);
void uidna_close(UIDNA*);
int uidna_labelToASCII(const(UIDNA)*, const(ushort)*, int, ushort*, int, UIDNAInfo*, UErrorCode*);
int uidna_labelToUnicode(const(UIDNA)*, const(ushort)*, int, ushort*, int, UIDNAInfo*, UErrorCode*);
int uidna_nameToASCII(const(UIDNA)*, const(ushort)*, int, ushort*, int, UIDNAInfo*, UErrorCode*);
int uidna_nameToUnicode(const(UIDNA)*, const(ushort)*, int, ushort*, int, UIDNAInfo*, UErrorCode*);
int uidna_labelToASCII_UTF8(const(UIDNA)*, const(char)*, int, PSTR, int, UIDNAInfo*, UErrorCode*);
int uidna_labelToUnicodeUTF8(const(UIDNA)*, const(char)*, int, PSTR, int, UIDNAInfo*, UErrorCode*);
int uidna_nameToASCII_UTF8(const(UIDNA)*, const(char)*, int, PSTR, int, UIDNAInfo*, UErrorCode*);
int uidna_nameToUnicodeUTF8(const(UIDNA)*, const(char)*, int, PSTR, int, UIDNAInfo*, UErrorCode*);
UBreakIterator* ubrk_open(UBreakIteratorType, const(char)*, const(ushort)*, int, UErrorCode*);
UBreakIterator* ubrk_openRules(const(ushort)*, int, const(ushort)*, int, UParseError*, UErrorCode*);
UBreakIterator* ubrk_openBinaryRules(const(ubyte)*, int, const(ushort)*, int, UErrorCode*);
UBreakIterator* ubrk_safeClone(const(UBreakIterator)*, void*, int*, UErrorCode*);
void ubrk_close(UBreakIterator*);
void ubrk_setText(UBreakIterator*, const(ushort)*, int, UErrorCode*);
void ubrk_setUText(UBreakIterator*, UText*, UErrorCode*);
int ubrk_current(const(UBreakIterator)*);
int ubrk_next(UBreakIterator*);
int ubrk_previous(UBreakIterator*);
int ubrk_first(UBreakIterator*);
int ubrk_last(UBreakIterator*);
int ubrk_preceding(UBreakIterator*, int);
int ubrk_following(UBreakIterator*, int);
PSTR ubrk_getAvailable(int);
int ubrk_countAvailable();
byte ubrk_isBoundary(UBreakIterator*, int);
int ubrk_getRuleStatus(UBreakIterator*);
int ubrk_getRuleStatusVec(UBreakIterator*, int*, int, UErrorCode*);
PSTR ubrk_getLocaleByType(const(UBreakIterator)*, ULocDataLocaleType, UErrorCode*);
void ubrk_refreshUText(UBreakIterator*, UText*, UErrorCode*);
int ubrk_getBinaryRules(UBreakIterator*, ubyte*, int, UErrorCode*);
void u_getDataVersion(ubyte*, UErrorCode*);
UEnumeration* ucal_openTimeZoneIDEnumeration(USystemTimeZoneType, const(char)*, const(int)*, UErrorCode*);
UEnumeration* ucal_openTimeZones(UErrorCode*);
UEnumeration* ucal_openCountryTimeZones(const(char)*, UErrorCode*);
int ucal_getDefaultTimeZone(ushort*, int, UErrorCode*);
void ucal_setDefaultTimeZone(const(ushort)*, UErrorCode*);
int ucal_getHostTimeZone(ushort*, int, UErrorCode*);
int ucal_getDSTSavings(const(ushort)*, UErrorCode*);
double ucal_getNow();
void** ucal_open(const(ushort)*, int, const(char)*, UCalendarType, UErrorCode*);
void ucal_close(void**);
void** ucal_clone(const(void)**, UErrorCode*);
void ucal_setTimeZone(void**, const(ushort)*, int, UErrorCode*);
int ucal_getTimeZoneID(const(void)**, ushort*, int, UErrorCode*);
int ucal_getTimeZoneDisplayName(const(void)**, UCalendarDisplayNameType, const(char)*, ushort*, int, UErrorCode*);
byte ucal_inDaylightTime(const(void)**, UErrorCode*);
void ucal_setGregorianChange(void**, double, UErrorCode*);
double ucal_getGregorianChange(const(void)**, UErrorCode*);
int ucal_getAttribute(const(void)**, UCalendarAttribute);
void ucal_setAttribute(void**, UCalendarAttribute, int);
PSTR ucal_getAvailable(int);
int ucal_countAvailable();
double ucal_getMillis(const(void)**, UErrorCode*);
void ucal_setMillis(void**, double, UErrorCode*);
void ucal_setDate(void**, int, int, int, UErrorCode*);
void ucal_setDateTime(void**, int, int, int, int, int, int, UErrorCode*);
byte ucal_equivalentTo(const(void)**, const(void)**);
void ucal_add(void**, UCalendarDateFields, int, UErrorCode*);
void ucal_roll(void**, UCalendarDateFields, int, UErrorCode*);
int ucal_get(const(void)**, UCalendarDateFields, UErrorCode*);
void ucal_set(void**, UCalendarDateFields, int);
byte ucal_isSet(const(void)**, UCalendarDateFields);
void ucal_clearField(void**, UCalendarDateFields);
void ucal_clear(void**);
int ucal_getLimit(const(void)**, UCalendarDateFields, UCalendarLimitType, UErrorCode*);
PSTR ucal_getLocaleByType(const(void)**, ULocDataLocaleType, UErrorCode*);
PSTR ucal_getTZDataVersion(UErrorCode*);
int ucal_getCanonicalTimeZoneID(const(ushort)*, int, ushort*, int, byte*, UErrorCode*);
PSTR ucal_getType(const(void)**, UErrorCode*);
UEnumeration* ucal_getKeywordValuesForLocale(const(char)*, const(char)*, byte, UErrorCode*);
UCalendarWeekdayType ucal_getDayOfWeekType(const(void)**, UCalendarDaysOfWeek, UErrorCode*);
int ucal_getWeekendTransition(const(void)**, UCalendarDaysOfWeek, UErrorCode*);
byte ucal_isWeekend(const(void)**, double, UErrorCode*);
int ucal_getFieldDifference(void**, double, UCalendarDateFields, UErrorCode*);
byte ucal_getTimeZoneTransitionDate(const(void)**, UTimeZoneTransitionType, double*, UErrorCode*);
int ucal_getWindowsTimeZoneID(const(ushort)*, int, ushort*, int, UErrorCode*);
int ucal_getTimeZoneIDForWindowsID(const(ushort)*, int, const(char)*, ushort*, int, UErrorCode*);
UCollator* ucol_open(const(char)*, UErrorCode*);
UCollator* ucol_openRules(const(ushort)*, int, UColAttributeValue, UColAttributeValue, UParseError*, UErrorCode*);
void ucol_getContractionsAndExpansions(const(UCollator)*, USet*, USet*, byte, UErrorCode*);
void ucol_close(UCollator*);
UCollationResult ucol_strcoll(const(UCollator)*, const(ushort)*, int, const(ushort)*, int);
UCollationResult ucol_strcollUTF8(const(UCollator)*, const(char)*, int, const(char)*, int, UErrorCode*);
byte ucol_greater(const(UCollator)*, const(ushort)*, int, const(ushort)*, int);
byte ucol_greaterOrEqual(const(UCollator)*, const(ushort)*, int, const(ushort)*, int);
byte ucol_equal(const(UCollator)*, const(ushort)*, int, const(ushort)*, int);
UCollationResult ucol_strcollIter(const(UCollator)*, UCharIterator*, UCharIterator*, UErrorCode*);
UColAttributeValue ucol_getStrength(const(UCollator)*);
void ucol_setStrength(UCollator*, UColAttributeValue);
int ucol_getReorderCodes(const(UCollator)*, int*, int, UErrorCode*);
void ucol_setReorderCodes(UCollator*, const(int)*, int, UErrorCode*);
int ucol_getEquivalentReorderCodes(int, int*, int, UErrorCode*);
int ucol_getDisplayName(const(char)*, const(char)*, ushort*, int, UErrorCode*);
PSTR ucol_getAvailable(int);
int ucol_countAvailable();
UEnumeration* ucol_openAvailableLocales(UErrorCode*);
UEnumeration* ucol_getKeywords(UErrorCode*);
UEnumeration* ucol_getKeywordValues(const(char)*, UErrorCode*);
UEnumeration* ucol_getKeywordValuesForLocale(const(char)*, const(char)*, byte, UErrorCode*);
int ucol_getFunctionalEquivalent(PSTR, int, const(char)*, const(char)*, byte*, UErrorCode*);
ushort* ucol_getRules(const(UCollator)*, int*);
int ucol_getSortKey(const(UCollator)*, const(ushort)*, int, ubyte*, int);
int ucol_nextSortKeyPart(const(UCollator)*, UCharIterator*, uint*, ubyte*, int, UErrorCode*);
int ucol_getBound(const(ubyte)*, int, UColBoundMode, uint, ubyte*, int, UErrorCode*);
void ucol_getVersion(const(UCollator)*, ubyte*);
void ucol_getUCAVersion(const(UCollator)*, ubyte*);
int ucol_mergeSortkeys(const(ubyte)*, int, const(ubyte)*, int, ubyte*, int);
void ucol_setAttribute(UCollator*, UColAttribute, UColAttributeValue, UErrorCode*);
UColAttributeValue ucol_getAttribute(const(UCollator)*, UColAttribute, UErrorCode*);
void ucol_setMaxVariable(UCollator*, UColReorderCode, UErrorCode*);
UColReorderCode ucol_getMaxVariable(const(UCollator)*);
uint ucol_getVariableTop(const(UCollator)*, UErrorCode*);
UCollator* ucol_safeClone(const(UCollator)*, void*, int*, UErrorCode*);
int ucol_getRulesEx(const(UCollator)*, UColRuleOption, ushort*, int);
PSTR ucol_getLocaleByType(const(UCollator)*, ULocDataLocaleType, UErrorCode*);
USet* ucol_getTailoredSet(const(UCollator)*, UErrorCode*);
int ucol_cloneBinary(const(UCollator)*, ubyte*, int, UErrorCode*);
UCollator* ucol_openBinary(const(ubyte)*, int, const(UCollator)*, UErrorCode*);
UCollationElements* ucol_openElements(const(UCollator)*, const(ushort)*, int, UErrorCode*);
int ucol_keyHashCode(const(ubyte)*, int);
void ucol_closeElements(UCollationElements*);
void ucol_reset(UCollationElements*);
int ucol_next(UCollationElements*, UErrorCode*);
int ucol_previous(UCollationElements*, UErrorCode*);
int ucol_getMaxExpansion(const(UCollationElements)*, int);
void ucol_setText(UCollationElements*, const(ushort)*, int, UErrorCode*);
int ucol_getOffset(const(UCollationElements)*);
void ucol_setOffset(UCollationElements*, int, UErrorCode*);
int ucol_primaryOrder(int);
int ucol_secondaryOrder(int);
int ucol_tertiaryOrder(int);
UCharsetDetector* ucsdet_open(UErrorCode*);
void ucsdet_close(UCharsetDetector*);
void ucsdet_setText(UCharsetDetector*, const(char)*, int, UErrorCode*);
void ucsdet_setDeclaredEncoding(UCharsetDetector*, const(char)*, int, UErrorCode*);
UCharsetMatch* ucsdet_detect(UCharsetDetector*, UErrorCode*);
UCharsetMatch** ucsdet_detectAll(UCharsetDetector*, int*, UErrorCode*);
PSTR ucsdet_getName(const(UCharsetMatch)*, UErrorCode*);
int ucsdet_getConfidence(const(UCharsetMatch)*, UErrorCode*);
PSTR ucsdet_getLanguage(const(UCharsetMatch)*, UErrorCode*);
int ucsdet_getUChars(const(UCharsetMatch)*, ushort*, int, UErrorCode*);
UEnumeration* ucsdet_getAllDetectableCharsets(const(UCharsetDetector)*, UErrorCode*);
byte ucsdet_isInputFilterEnabled(const(UCharsetDetector)*);
byte ucsdet_enableInputFilter(UCharsetDetector*, byte);
UFieldPositionIterator* ufieldpositer_open(UErrorCode*);
void ufieldpositer_close(UFieldPositionIterator*);
int ufieldpositer_next(UFieldPositionIterator*, int*, int*);
void** ufmt_open(UErrorCode*);
void ufmt_close(void**);
UFormattableType ufmt_getType(const(void)**, UErrorCode*);
byte ufmt_isNumeric(const(void)**);
double ufmt_getDate(const(void)**, UErrorCode*);
double ufmt_getDouble(void**, UErrorCode*);
int ufmt_getLong(void**, UErrorCode*);
long ufmt_getInt64(void**, UErrorCode*);
void* ufmt_getObject(const(void)**, UErrorCode*);
ushort* ufmt_getUChars(void**, int*, UErrorCode*);
int ufmt_getArrayLength(const(void)**, UErrorCode*);
void** ufmt_getArrayItemByIndex(void**, int, UErrorCode*);
PSTR ufmt_getDecNumChars(void**, int*, UErrorCode*);
UConstrainedFieldPosition* ucfpos_open(UErrorCode*);
void ucfpos_reset(UConstrainedFieldPosition*, UErrorCode*);
void ucfpos_close(UConstrainedFieldPosition*);
void ucfpos_constrainCategory(UConstrainedFieldPosition*, int, UErrorCode*);
void ucfpos_constrainField(UConstrainedFieldPosition*, int, int, UErrorCode*);
int ucfpos_getCategory(const(UConstrainedFieldPosition)*, UErrorCode*);
int ucfpos_getField(const(UConstrainedFieldPosition)*, UErrorCode*);
void ucfpos_getIndexes(const(UConstrainedFieldPosition)*, int*, int*, UErrorCode*);
long ucfpos_getInt64IterationContext(const(UConstrainedFieldPosition)*, UErrorCode*);
void ucfpos_setInt64IterationContext(UConstrainedFieldPosition*, long, UErrorCode*);
byte ucfpos_matchesField(const(UConstrainedFieldPosition)*, int, int, UErrorCode*);
void ucfpos_setState(UConstrainedFieldPosition*, int, int, int, int, UErrorCode*);
ushort* ufmtval_getString(const(UFormattedValue)*, int*, UErrorCode*);
byte ufmtval_nextPosition(const(UFormattedValue)*, UConstrainedFieldPosition*, UErrorCode*);
UDateIntervalFormat* udtitvfmt_open(const(char)*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
void udtitvfmt_close(UDateIntervalFormat*);
UFormattedDateInterval* udtitvfmt_openResult(UErrorCode*);
UFormattedValue* udtitvfmt_resultAsValue(const(UFormattedDateInterval)*, UErrorCode*);
void udtitvfmt_closeResult(UFormattedDateInterval*);
int udtitvfmt_format(const(UDateIntervalFormat)*, double, double, ushort*, int, UFieldPosition*, UErrorCode*);
UGenderInfo* ugender_getInstance(const(char)*, UErrorCode*);
UGender ugender_getListGender(const(UGenderInfo)*, const(UGender)*, int, UErrorCode*);
UListFormatter* ulistfmt_open(const(char)*, UErrorCode*);
UListFormatter* ulistfmt_openForType(const(char)*, UListFormatterType, UListFormatterWidth, UErrorCode*);
void ulistfmt_close(UListFormatter*);
UFormattedList* ulistfmt_openResult(UErrorCode*);
UFormattedValue* ulistfmt_resultAsValue(const(UFormattedList)*, UErrorCode*);
void ulistfmt_closeResult(UFormattedList*);
int ulistfmt_format(const(UListFormatter)*, const(ushort)**, const(int)*, int, ushort*, int, UErrorCode*);
void ulistfmt_formatStringsToResult(const(UListFormatter)*, const(ushort)**, const(int)*, int, UFormattedList*, UErrorCode*);
ULocaleData* ulocdata_open(const(char)*, UErrorCode*);
void ulocdata_close(ULocaleData*);
void ulocdata_setNoSubstitute(ULocaleData*, byte);
byte ulocdata_getNoSubstitute(ULocaleData*);
USet* ulocdata_getExemplarSet(ULocaleData*, USet*, uint, ULocaleDataExemplarSetType, UErrorCode*);
int ulocdata_getDelimiter(ULocaleData*, ULocaleDataDelimiterType, ushort*, int, UErrorCode*);
UMeasurementSystem ulocdata_getMeasurementSystem(const(char)*, UErrorCode*);
void ulocdata_getPaperSize(const(char)*, int*, int*, UErrorCode*);
void ulocdata_getCLDRVersion(ubyte*, UErrorCode*);
int ulocdata_getLocaleDisplayPattern(ULocaleData*, ushort*, int, UErrorCode*);
int ulocdata_getLocaleSeparator(ULocaleData*, ushort*, int, UErrorCode*);
int u_formatMessage(const(char)*, const(ushort)*, int, ushort*, int, UErrorCode*);
int u_vformatMessage(const(char)*, const(ushort)*, int, ushort*, int, byte*, UErrorCode*);
void u_parseMessage(const(char)*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
void u_vparseMessage(const(char)*, const(ushort)*, int, const(ushort)*, int, byte*, UErrorCode*);
int u_formatMessageWithError(const(char)*, const(ushort)*, int, ushort*, int, UParseError*, UErrorCode*);
int u_vformatMessageWithError(const(char)*, const(ushort)*, int, ushort*, int, UParseError*, byte*, UErrorCode*);
void u_parseMessageWithError(const(char)*, const(ushort)*, int, const(ushort)*, int, UParseError*, UErrorCode*);
void u_vparseMessageWithError(const(char)*, const(ushort)*, int, const(ushort)*, int, byte*, UParseError*, UErrorCode*);
void** umsg_open(const(ushort)*, int, const(char)*, UParseError*, UErrorCode*);
void umsg_close(void**);
void* umsg_clone(const(void)**, UErrorCode*);
void umsg_setLocale(void**, const(char)*);
PSTR umsg_getLocale(const(void)**);
void umsg_applyPattern(void**, const(ushort)*, int, UParseError*, UErrorCode*);
int umsg_toPattern(const(void)**, ushort*, int, UErrorCode*);
int umsg_format(const(void)**, ushort*, int, UErrorCode*);
int umsg_vformat(const(void)**, ushort*, int, byte*, UErrorCode*);
void umsg_parse(const(void)**, const(ushort)*, int, int*, UErrorCode*);
void umsg_vparse(const(void)**, const(ushort)*, int, int*, byte*, UErrorCode*);
int umsg_autoQuoteApostrophe(const(ushort)*, int, ushort*, int, UErrorCode*);
void** unum_open(UNumberFormatStyle, const(ushort)*, int, const(char)*, UParseError*, UErrorCode*);
void unum_close(void**);
void** unum_clone(const(void)**, UErrorCode*);
int unum_format(const(void)**, int, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_formatInt64(const(void)**, long, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_formatDouble(const(void)**, double, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_formatDoubleForFields(const(void)**, double, ushort*, int, UFieldPositionIterator*, UErrorCode*);
int unum_formatDecimal(const(void)**, const(char)*, int, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_formatDoubleCurrency(const(void)**, double, ushort*, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_formatUFormattable(const(void)**, const(void)**, ushort*, int, UFieldPosition*, UErrorCode*);
int unum_parse(const(void)**, const(ushort)*, int, int*, UErrorCode*);
long unum_parseInt64(const(void)**, const(ushort)*, int, int*, UErrorCode*);
double unum_parseDouble(const(void)**, const(ushort)*, int, int*, UErrorCode*);
int unum_parseDecimal(const(void)**, const(ushort)*, int, int*, PSTR, int, UErrorCode*);
double unum_parseDoubleCurrency(const(void)**, const(ushort)*, int, int*, ushort*, UErrorCode*);
void** unum_parseToUFormattable(const(void)**, void**, const(ushort)*, int, int*, UErrorCode*);
void unum_applyPattern(void**, byte, const(ushort)*, int, UParseError*, UErrorCode*);
PSTR unum_getAvailable(int);
int unum_countAvailable();
int unum_getAttribute(const(void)**, UNumberFormatAttribute);
void unum_setAttribute(void**, UNumberFormatAttribute, int);
double unum_getDoubleAttribute(const(void)**, UNumberFormatAttribute);
void unum_setDoubleAttribute(void**, UNumberFormatAttribute, double);
int unum_getTextAttribute(const(void)**, UNumberFormatTextAttribute, ushort*, int, UErrorCode*);
void unum_setTextAttribute(void**, UNumberFormatTextAttribute, const(ushort)*, int, UErrorCode*);
int unum_toPattern(const(void)**, byte, ushort*, int, UErrorCode*);
int unum_getSymbol(const(void)**, UNumberFormatSymbol, ushort*, int, UErrorCode*);
void unum_setSymbol(void**, UNumberFormatSymbol, const(ushort)*, int, UErrorCode*);
PSTR unum_getLocaleByType(const(void)**, ULocDataLocaleType, UErrorCode*);
void unum_setContext(void**, UDisplayContext, UErrorCode*);
UDisplayContext unum_getContext(const(void)**, UDisplayContextType, UErrorCode*);
UCalendarDateFields udat_toCalendarDateField(UDateFormatField);
void** udat_open(UDateFormatStyle, UDateFormatStyle, const(char)*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
void udat_close(void**);
byte udat_getBooleanAttribute(const(void)**, UDateFormatBooleanAttribute, UErrorCode*);
void udat_setBooleanAttribute(void**, UDateFormatBooleanAttribute, byte, UErrorCode*);
void** udat_clone(const(void)**, UErrorCode*);
int udat_format(const(void)**, double, ushort*, int, UFieldPosition*, UErrorCode*);
int udat_formatCalendar(const(void)**, void**, ushort*, int, UFieldPosition*, UErrorCode*);
int udat_formatForFields(const(void)**, double, ushort*, int, UFieldPositionIterator*, UErrorCode*);
int udat_formatCalendarForFields(const(void)**, void**, ushort*, int, UFieldPositionIterator*, UErrorCode*);
double udat_parse(const(void)**, const(ushort)*, int, int*, UErrorCode*);
void udat_parseCalendar(const(void)**, void**, const(ushort)*, int, int*, UErrorCode*);
byte udat_isLenient(const(void)**);
void udat_setLenient(void**, byte);
void** udat_getCalendar(const(void)**);
void udat_setCalendar(void**, const(void)**);
void** udat_getNumberFormat(const(void)**);
void** udat_getNumberFormatForField(const(void)**, ushort);
void udat_adoptNumberFormatForFields(void**, const(ushort)*, void**, UErrorCode*);
void udat_setNumberFormat(void**, const(void)**);
void udat_adoptNumberFormat(void**, void**);
PSTR udat_getAvailable(int);
int udat_countAvailable();
double udat_get2DigitYearStart(const(void)**, UErrorCode*);
void udat_set2DigitYearStart(void**, double, UErrorCode*);
int udat_toPattern(const(void)**, byte, ushort*, int, UErrorCode*);
void udat_applyPattern(void**, byte, const(ushort)*, int);
int udat_getSymbols(const(void)**, UDateFormatSymbolType, int, ushort*, int, UErrorCode*);
int udat_countSymbols(const(void)**, UDateFormatSymbolType);
void udat_setSymbols(void**, UDateFormatSymbolType, int, ushort*, int, UErrorCode*);
PSTR udat_getLocaleByType(const(void)**, ULocDataLocaleType, UErrorCode*);
void udat_setContext(void**, UDisplayContext, UErrorCode*);
UDisplayContext udat_getContext(const(void)**, UDisplayContextType, UErrorCode*);
void** udatpg_open(const(char)*, UErrorCode*);
void** udatpg_openEmpty(UErrorCode*);
void udatpg_close(void**);
void** udatpg_clone(const(void)**, UErrorCode*);
int udatpg_getBestPattern(void**, const(ushort)*, int, ushort*, int, UErrorCode*);
int udatpg_getBestPatternWithOptions(void**, const(ushort)*, int, UDateTimePatternMatchOptions, ushort*, int, UErrorCode*);
int udatpg_getSkeleton(void**, const(ushort)*, int, ushort*, int, UErrorCode*);
int udatpg_getBaseSkeleton(void**, const(ushort)*, int, ushort*, int, UErrorCode*);
UDateTimePatternConflict udatpg_addPattern(void**, const(ushort)*, int, byte, ushort*, int, int*, UErrorCode*);
void udatpg_setAppendItemFormat(void**, UDateTimePatternField, const(ushort)*, int);
ushort* udatpg_getAppendItemFormat(const(void)**, UDateTimePatternField, int*);
void udatpg_setAppendItemName(void**, UDateTimePatternField, const(ushort)*, int);
ushort* udatpg_getAppendItemName(const(void)**, UDateTimePatternField, int*);
int udatpg_getFieldDisplayName(const(void)**, UDateTimePatternField, UDateTimePGDisplayWidth, ushort*, int, UErrorCode*);
void udatpg_setDateTimeFormat(const(void)**, const(ushort)*, int);
ushort* udatpg_getDateTimeFormat(const(void)**, int*);
void udatpg_setDecimal(void**, const(ushort)*, int);
ushort* udatpg_getDecimal(const(void)**, int*);
int udatpg_replaceFieldTypes(void**, const(ushort)*, int, const(ushort)*, int, ushort*, int, UErrorCode*);
int udatpg_replaceFieldTypesWithOptions(void**, const(ushort)*, int, const(ushort)*, int, UDateTimePatternMatchOptions, ushort*, int, UErrorCode*);
UEnumeration* udatpg_openSkeletons(const(void)**, UErrorCode*);
UEnumeration* udatpg_openBaseSkeletons(const(void)**, UErrorCode*);
ushort* udatpg_getPatternForSkeleton(const(void)**, const(ushort)*, int, int*);
UNumberFormatter* unumf_openForSkeletonAndLocale(const(ushort)*, int, const(char)*, UErrorCode*);
UNumberFormatter* unumf_openForSkeletonAndLocaleWithError(const(ushort)*, int, const(char)*, UParseError*, UErrorCode*);
UFormattedNumber* unumf_openResult(UErrorCode*);
void unumf_formatInt(const(UNumberFormatter)*, long, UFormattedNumber*, UErrorCode*);
void unumf_formatDouble(const(UNumberFormatter)*, double, UFormattedNumber*, UErrorCode*);
void unumf_formatDecimal(const(UNumberFormatter)*, const(char)*, int, UFormattedNumber*, UErrorCode*);
UFormattedValue* unumf_resultAsValue(const(UFormattedNumber)*, UErrorCode*);
int unumf_resultToString(const(UFormattedNumber)*, ushort*, int, UErrorCode*);
byte unumf_resultNextFieldPosition(const(UFormattedNumber)*, UFieldPosition*, UErrorCode*);
void unumf_resultGetAllFieldPositions(const(UFormattedNumber)*, UFieldPositionIterator*, UErrorCode*);
void unumf_close(UNumberFormatter*);
void unumf_closeResult(UFormattedNumber*);
UNumberingSystem* unumsys_open(const(char)*, UErrorCode*);
UNumberingSystem* unumsys_openByName(const(char)*, UErrorCode*);
void unumsys_close(UNumberingSystem*);
UEnumeration* unumsys_openAvailableNames(UErrorCode*);
PSTR unumsys_getName(const(UNumberingSystem)*);
byte unumsys_isAlgorithmic(const(UNumberingSystem)*);
int unumsys_getRadix(const(UNumberingSystem)*);
int unumsys_getDescription(const(UNumberingSystem)*, ushort*, int, UErrorCode*);
UPluralRules* uplrules_open(const(char)*, UErrorCode*);
UPluralRules* uplrules_openForType(const(char)*, UPluralType, UErrorCode*);
void uplrules_close(UPluralRules*);
int uplrules_select(const(UPluralRules)*, double, ushort*, int, UErrorCode*);
int uplrules_selectFormatted(const(UPluralRules)*, const(UFormattedNumber)*, ushort*, int, UErrorCode*);
UEnumeration* uplrules_getKeywords(const(UPluralRules)*, UErrorCode*);
URegularExpression* uregex_open(const(ushort)*, int, uint, UParseError*, UErrorCode*);
URegularExpression* uregex_openUText(UText*, uint, UParseError*, UErrorCode*);
URegularExpression* uregex_openC(const(char)*, uint, UParseError*, UErrorCode*);
void uregex_close(URegularExpression*);
URegularExpression* uregex_clone(const(URegularExpression)*, UErrorCode*);
ushort* uregex_pattern(const(URegularExpression)*, int*, UErrorCode*);
UText* uregex_patternUText(const(URegularExpression)*, UErrorCode*);
int uregex_flags(const(URegularExpression)*, UErrorCode*);
void uregex_setText(URegularExpression*, const(ushort)*, int, UErrorCode*);
void uregex_setUText(URegularExpression*, UText*, UErrorCode*);
ushort* uregex_getText(URegularExpression*, int*, UErrorCode*);
UText* uregex_getUText(URegularExpression*, UText*, UErrorCode*);
void uregex_refreshUText(URegularExpression*, UText*, UErrorCode*);
byte uregex_matches(URegularExpression*, int, UErrorCode*);
byte uregex_matches64(URegularExpression*, long, UErrorCode*);
byte uregex_lookingAt(URegularExpression*, int, UErrorCode*);
byte uregex_lookingAt64(URegularExpression*, long, UErrorCode*);
byte uregex_find(URegularExpression*, int, UErrorCode*);
byte uregex_find64(URegularExpression*, long, UErrorCode*);
byte uregex_findNext(URegularExpression*, UErrorCode*);
int uregex_groupCount(URegularExpression*, UErrorCode*);
int uregex_groupNumberFromName(URegularExpression*, const(ushort)*, int, UErrorCode*);
int uregex_groupNumberFromCName(URegularExpression*, const(char)*, int, UErrorCode*);
int uregex_group(URegularExpression*, int, ushort*, int, UErrorCode*);
UText* uregex_groupUText(URegularExpression*, int, UText*, long*, UErrorCode*);
int uregex_start(URegularExpression*, int, UErrorCode*);
long uregex_start64(URegularExpression*, int, UErrorCode*);
int uregex_end(URegularExpression*, int, UErrorCode*);
long uregex_end64(URegularExpression*, int, UErrorCode*);
void uregex_reset(URegularExpression*, int, UErrorCode*);
void uregex_reset64(URegularExpression*, long, UErrorCode*);
void uregex_setRegion(URegularExpression*, int, int, UErrorCode*);
void uregex_setRegion64(URegularExpression*, long, long, UErrorCode*);
void uregex_setRegionAndStart(URegularExpression*, long, long, long, UErrorCode*);
int uregex_regionStart(const(URegularExpression)*, UErrorCode*);
long uregex_regionStart64(const(URegularExpression)*, UErrorCode*);
int uregex_regionEnd(const(URegularExpression)*, UErrorCode*);
long uregex_regionEnd64(const(URegularExpression)*, UErrorCode*);
byte uregex_hasTransparentBounds(const(URegularExpression)*, UErrorCode*);
void uregex_useTransparentBounds(URegularExpression*, byte, UErrorCode*);
byte uregex_hasAnchoringBounds(const(URegularExpression)*, UErrorCode*);
void uregex_useAnchoringBounds(URegularExpression*, byte, UErrorCode*);
byte uregex_hitEnd(const(URegularExpression)*, UErrorCode*);
byte uregex_requireEnd(const(URegularExpression)*, UErrorCode*);
int uregex_replaceAll(URegularExpression*, const(ushort)*, int, ushort*, int, UErrorCode*);
UText* uregex_replaceAllUText(URegularExpression*, UText*, UText*, UErrorCode*);
int uregex_replaceFirst(URegularExpression*, const(ushort)*, int, ushort*, int, UErrorCode*);
UText* uregex_replaceFirstUText(URegularExpression*, UText*, UText*, UErrorCode*);
int uregex_appendReplacement(URegularExpression*, const(ushort)*, int, ushort**, int*, UErrorCode*);
void uregex_appendReplacementUText(URegularExpression*, UText*, UText*, UErrorCode*);
int uregex_appendTail(URegularExpression*, ushort**, int*, UErrorCode*);
UText* uregex_appendTailUText(URegularExpression*, UText*, UErrorCode*);
int uregex_split(URegularExpression*, ushort*, int, int*, ushort**, int, UErrorCode*);
int uregex_splitUText(URegularExpression*, UText**, int, UErrorCode*);
void uregex_setTimeLimit(URegularExpression*, int, UErrorCode*);
int uregex_getTimeLimit(const(URegularExpression)*, UErrorCode*);
void uregex_setStackLimit(URegularExpression*, int, UErrorCode*);
int uregex_getStackLimit(const(URegularExpression)*, UErrorCode*);
void uregex_setMatchCallback(URegularExpression*, URegexMatchCallback, const(void)*, UErrorCode*);
void uregex_getMatchCallback(const(URegularExpression)*, URegexMatchCallback*, const(void)**, UErrorCode*);
void uregex_setFindProgressCallback(URegularExpression*, URegexFindProgressCallback, const(void)*, UErrorCode*);
void uregex_getFindProgressCallback(const(URegularExpression)*, URegexFindProgressCallback*, const(void)**, UErrorCode*);
URegion* uregion_getRegionFromCode(const(char)*, UErrorCode*);
URegion* uregion_getRegionFromNumericCode(int, UErrorCode*);
UEnumeration* uregion_getAvailable(URegionType, UErrorCode*);
byte uregion_areEqual(const(URegion)*, const(URegion)*);
URegion* uregion_getContainingRegion(const(URegion)*);
URegion* uregion_getContainingRegionOfType(const(URegion)*, URegionType);
UEnumeration* uregion_getContainedRegions(const(URegion)*, UErrorCode*);
UEnumeration* uregion_getContainedRegionsOfType(const(URegion)*, URegionType, UErrorCode*);
byte uregion_contains(const(URegion)*, const(URegion)*);
UEnumeration* uregion_getPreferredValues(const(URegion)*, UErrorCode*);
PSTR uregion_getRegionCode(const(URegion)*);
int uregion_getNumericCode(const(URegion)*);
URegionType uregion_getType(const(URegion)*);
URelativeDateTimeFormatter* ureldatefmt_open(const(char)*, void**, UDateRelativeDateTimeFormatterStyle, UDisplayContext, UErrorCode*);
void ureldatefmt_close(URelativeDateTimeFormatter*);
UFormattedRelativeDateTime* ureldatefmt_openResult(UErrorCode*);
UFormattedValue* ureldatefmt_resultAsValue(const(UFormattedRelativeDateTime)*, UErrorCode*);
void ureldatefmt_closeResult(UFormattedRelativeDateTime*);
int ureldatefmt_formatNumeric(const(URelativeDateTimeFormatter)*, double, URelativeDateTimeUnit, ushort*, int, UErrorCode*);
void ureldatefmt_formatNumericToResult(const(URelativeDateTimeFormatter)*, double, URelativeDateTimeUnit, UFormattedRelativeDateTime*, UErrorCode*);
int ureldatefmt_format(const(URelativeDateTimeFormatter)*, double, URelativeDateTimeUnit, ushort*, int, UErrorCode*);
void ureldatefmt_formatToResult(const(URelativeDateTimeFormatter)*, double, URelativeDateTimeUnit, UFormattedRelativeDateTime*, UErrorCode*);
int ureldatefmt_combineDateAndTime(const(URelativeDateTimeFormatter)*, const(ushort)*, int, const(ushort)*, int, ushort*, int, UErrorCode*);
UStringSearch* usearch_open(const(ushort)*, int, const(ushort)*, int, const(char)*, UBreakIterator*, UErrorCode*);
UStringSearch* usearch_openFromCollator(const(ushort)*, int, const(ushort)*, int, const(UCollator)*, UBreakIterator*, UErrorCode*);
void usearch_close(UStringSearch*);
void usearch_setOffset(UStringSearch*, int, UErrorCode*);
int usearch_getOffset(const(UStringSearch)*);
void usearch_setAttribute(UStringSearch*, USearchAttribute, USearchAttributeValue, UErrorCode*);
USearchAttributeValue usearch_getAttribute(const(UStringSearch)*, USearchAttribute);
int usearch_getMatchedStart(const(UStringSearch)*);
int usearch_getMatchedLength(const(UStringSearch)*);
int usearch_getMatchedText(const(UStringSearch)*, ushort*, int, UErrorCode*);
void usearch_setBreakIterator(UStringSearch*, UBreakIterator*, UErrorCode*);
UBreakIterator* usearch_getBreakIterator(const(UStringSearch)*);
void usearch_setText(UStringSearch*, const(ushort)*, int, UErrorCode*);
ushort* usearch_getText(const(UStringSearch)*, int*);
UCollator* usearch_getCollator(const(UStringSearch)*);
void usearch_setCollator(UStringSearch*, const(UCollator)*, UErrorCode*);
void usearch_setPattern(UStringSearch*, const(ushort)*, int, UErrorCode*);
ushort* usearch_getPattern(const(UStringSearch)*, int*);
int usearch_first(UStringSearch*, UErrorCode*);
int usearch_following(UStringSearch*, int, UErrorCode*);
int usearch_last(UStringSearch*, UErrorCode*);
int usearch_preceding(UStringSearch*, int, UErrorCode*);
int usearch_next(UStringSearch*, UErrorCode*);
int usearch_previous(UStringSearch*, UErrorCode*);
void usearch_reset(UStringSearch*);
USpoofChecker* uspoof_open(UErrorCode*);
USpoofChecker* uspoof_openFromSerialized(const(void)*, int, int*, UErrorCode*);
USpoofChecker* uspoof_openFromSource(const(char)*, int, const(char)*, int, int*, UParseError*, UErrorCode*);
void uspoof_close(USpoofChecker*);
USpoofChecker* uspoof_clone(const(USpoofChecker)*, UErrorCode*);
void uspoof_setChecks(USpoofChecker*, int, UErrorCode*);
int uspoof_getChecks(const(USpoofChecker)*, UErrorCode*);
void uspoof_setRestrictionLevel(USpoofChecker*, URestrictionLevel);
URestrictionLevel uspoof_getRestrictionLevel(const(USpoofChecker)*);
void uspoof_setAllowedLocales(USpoofChecker*, const(char)*, UErrorCode*);
PSTR uspoof_getAllowedLocales(USpoofChecker*, UErrorCode*);
void uspoof_setAllowedChars(USpoofChecker*, const(USet)*, UErrorCode*);
USet* uspoof_getAllowedChars(const(USpoofChecker)*, UErrorCode*);
int uspoof_check(const(USpoofChecker)*, const(ushort)*, int, int*, UErrorCode*);
int uspoof_checkUTF8(const(USpoofChecker)*, const(char)*, int, int*, UErrorCode*);
int uspoof_check2(const(USpoofChecker)*, const(ushort)*, int, USpoofCheckResult*, UErrorCode*);
int uspoof_check2UTF8(const(USpoofChecker)*, const(char)*, int, USpoofCheckResult*, UErrorCode*);
USpoofCheckResult* uspoof_openCheckResult(UErrorCode*);
void uspoof_closeCheckResult(USpoofCheckResult*);
int uspoof_getCheckResultChecks(const(USpoofCheckResult)*, UErrorCode*);
URestrictionLevel uspoof_getCheckResultRestrictionLevel(const(USpoofCheckResult)*, UErrorCode*);
USet* uspoof_getCheckResultNumerics(const(USpoofCheckResult)*, UErrorCode*);
int uspoof_areConfusable(const(USpoofChecker)*, const(ushort)*, int, const(ushort)*, int, UErrorCode*);
int uspoof_areConfusableUTF8(const(USpoofChecker)*, const(char)*, int, const(char)*, int, UErrorCode*);
int uspoof_getSkeleton(const(USpoofChecker)*, uint, const(ushort)*, int, ushort*, int, UErrorCode*);
int uspoof_getSkeletonUTF8(const(USpoofChecker)*, uint, const(char)*, int, PSTR, int, UErrorCode*);
USet* uspoof_getInclusionSet(UErrorCode*);
USet* uspoof_getRecommendedSet(UErrorCode*);
int uspoof_serialize(USpoofChecker*, void*, int, UErrorCode*);
long utmscale_getTimeScaleValue(UDateTimeScale, UTimeScaleValue, UErrorCode*);
long utmscale_fromInt64(long, UDateTimeScale, UErrorCode*);
long utmscale_toInt64(long, UDateTimeScale, UErrorCode*);
void** utrans_openU(const(ushort)*, int, UTransDirection, const(ushort)*, int, UParseError*, UErrorCode*);
void** utrans_openInverse(const(void)**, UErrorCode*);
void** utrans_clone(const(void)**, UErrorCode*);
void utrans_close(void**);
ushort* utrans_getUnicodeID(const(void)**, int*);
void utrans_register(void**, UErrorCode*);
void utrans_unregisterID(const(ushort)*, int);
void utrans_setFilter(void**, const(ushort)*, int, UErrorCode*);
int utrans_countAvailableIDs();
UEnumeration* utrans_openIDs(UErrorCode*);
void utrans_trans(const(void)**, void**, const(UReplaceableCallbacks)*, int, int*, UErrorCode*);
void utrans_transIncremental(const(void)**, void**, const(UReplaceableCallbacks)*, UTransPosition*, UErrorCode*);
void utrans_transUChars(const(void)**, ushort*, int*, int, int, int*, UErrorCode*);
void utrans_transIncrementalUChars(const(void)**, ushort*, int*, int, UTransPosition*, UErrorCode*);
int utrans_toRules(const(void)**, byte, ushort*, int, UErrorCode*);
USet* utrans_getSourceSet(const(void)**, byte, USet*, UErrorCode*);
HRESULT GetDistanceOfClosestLanguageInList(const(wchar)*, const(wchar)*, wchar, double*);
ubyte IsWellFormedTag(const(wchar)*);
int FindStringOrdinal(uint, const(wchar)*, int, const(wchar)*, int, BOOL);
int lstrcmpA(const(char)*, const(char)*);
int lstrcmpW(const(wchar)*, const(wchar)*);
int lstrcmpiA(const(char)*, const(char)*);
int lstrcmpiW(const(wchar)*, const(wchar)*);
PSTR lstrcpynA(PSTR, const(char)*, int);
PWSTR lstrcpynW(PWSTR, const(wchar)*, int);
PSTR lstrcpyA(PSTR, const(char)*);
PWSTR lstrcpyW(PWSTR, const(wchar)*);
PSTR lstrcatA(PSTR, const(char)*);
PWSTR lstrcatW(PWSTR, const(wchar)*);
int lstrlenA(const(char)*);
int lstrlenW(const(wchar)*);
BOOL IsTextUnicode(const(void)*, int, IS_TEXT_UNICODE_RESULT*);
enum ALL_SERVICE_TYPES = 0x00000000;
enum HIGHLEVEL_SERVICE_TYPES = 0x00000001;
enum LOWLEVEL_SERVICE_TYPES = 0x00000002;
enum ALL_SERVICES = 0x00000000;
enum ONLINE_SERVICES = 0x00000001;
enum OFFLINE_SERVICES = 0x00000002;
enum MAX_LEADBYTES = 0x0000000c;
enum MAX_DEFAULTCHAR = 0x00000002;
enum HIGH_SURROGATE_START = 0x0000d800;
enum HIGH_SURROGATE_END = 0x0000dbff;
enum LOW_SURROGATE_START = 0x0000dc00;
enum LOW_SURROGATE_END = 0x0000dfff;
enum WC_COMPOSITECHECK = 0x00000200;
enum WC_DISCARDNS = 0x00000010;
enum WC_SEPCHARS = 0x00000020;
enum WC_DEFAULTCHAR = 0x00000040;
enum WC_ERR_INVALID_CHARS = 0x00000080;
enum WC_NO_BEST_FIT_CHARS = 0x00000400;
enum CT_CTYPE1 = 0x00000001;
enum CT_CTYPE2 = 0x00000002;
enum CT_CTYPE3 = 0x00000004;
enum C1_UPPER = 0x00000001;
enum C1_LOWER = 0x00000002;
enum C1_DIGIT = 0x00000004;
enum C1_SPACE = 0x00000008;
enum C1_PUNCT = 0x00000010;
enum C1_CNTRL = 0x00000020;
enum C1_BLANK = 0x00000040;
enum C1_XDIGIT = 0x00000080;
enum C1_ALPHA = 0x00000100;
enum C1_DEFINED = 0x00000200;
enum C2_LEFTTORIGHT = 0x00000001;
enum C2_RIGHTTOLEFT = 0x00000002;
enum C2_EUROPENUMBER = 0x00000003;
enum C2_EUROPESEPARATOR = 0x00000004;
enum C2_EUROPETERMINATOR = 0x00000005;
enum C2_ARABICNUMBER = 0x00000006;
enum C2_COMMONSEPARATOR = 0x00000007;
enum C2_BLOCKSEPARATOR = 0x00000008;
enum C2_SEGMENTSEPARATOR = 0x00000009;
enum C2_WHITESPACE = 0x0000000a;
enum C2_OTHERNEUTRAL = 0x0000000b;
enum C2_NOTAPPLICABLE = 0x00000000;
enum C3_NONSPACING = 0x00000001;
enum C3_DIACRITIC = 0x00000002;
enum C3_VOWELMARK = 0x00000004;
enum C3_SYMBOL = 0x00000008;
enum C3_KATAKANA = 0x00000010;
enum C3_HIRAGANA = 0x00000020;
enum C3_HALFWIDTH = 0x00000040;
enum C3_FULLWIDTH = 0x00000080;
enum C3_IDEOGRAPH = 0x00000100;
enum C3_KASHIDA = 0x00000200;
enum C3_LEXICAL = 0x00000400;
enum C3_HIGHSURROGATE = 0x00000800;
enum C3_LOWSURROGATE = 0x00001000;
enum C3_ALPHA = 0x00008000;
enum C3_NOTAPPLICABLE = 0x00000000;
enum LCMAP_LOWERCASE = 0x00000100;
enum LCMAP_UPPERCASE = 0x00000200;
enum LCMAP_TITLECASE = 0x00000300;
enum LCMAP_SORTKEY = 0x00000400;
enum LCMAP_BYTEREV = 0x00000800;
enum LCMAP_HIRAGANA = 0x00100000;
enum LCMAP_KATAKANA = 0x00200000;
enum LCMAP_HALFWIDTH = 0x00400000;
enum LCMAP_FULLWIDTH = 0x00800000;
enum LCMAP_LINGUISTIC_CASING = 0x01000000;
enum LCMAP_SIMPLIFIED_CHINESE = 0x02000000;
enum LCMAP_TRADITIONAL_CHINESE = 0x04000000;
enum LCMAP_SORTHANDLE = 0x20000000;
enum LCMAP_HASH = 0x00040000;
enum FIND_STARTSWITH = 0x00100000;
enum FIND_ENDSWITH = 0x00200000;
enum FIND_FROMSTART = 0x00400000;
enum FIND_FROMEND = 0x00800000;
enum LCID_ALTERNATE_SORTS = 0x00000004;
enum LOCALE_ALL = 0x00000000;
enum LOCALE_WINDOWS = 0x00000001;
enum LOCALE_SUPPLEMENTAL = 0x00000002;
enum LOCALE_ALTERNATE_SORTS = 0x00000004;
enum LOCALE_REPLACEMENT = 0x00000008;
enum LOCALE_NEUTRALDATA = 0x00000010;
enum LOCALE_SPECIFICDATA = 0x00000020;
enum CP_ACP = 0x00000000;
enum CP_OEMCP = 0x00000001;
enum CP_MACCP = 0x00000002;
enum CP_THREAD_ACP = 0x00000003;
enum CP_SYMBOL = 0x0000002a;
enum CP_UTF7 = 0x0000fde8;
enum CP_UTF8 = 0x0000fde9;
enum CTRY_DEFAULT = 0x00000000;
enum CTRY_ALBANIA = 0x00000163;
enum CTRY_ALGERIA = 0x000000d5;
enum CTRY_ARGENTINA = 0x00000036;
enum CTRY_ARMENIA = 0x00000176;
enum CTRY_AUSTRALIA = 0x0000003d;
enum CTRY_AUSTRIA = 0x0000002b;
enum CTRY_AZERBAIJAN = 0x000003e2;
enum CTRY_BAHRAIN = 0x000003cd;
enum CTRY_BELARUS = 0x00000177;
enum CTRY_BELGIUM = 0x00000020;
enum CTRY_BELIZE = 0x000001f5;
enum CTRY_BOLIVIA = 0x0000024f;
enum CTRY_BRAZIL = 0x00000037;
enum CTRY_BRUNEI_DARUSSALAM = 0x000002a1;
enum CTRY_BULGARIA = 0x00000167;
enum CTRY_CANADA = 0x00000002;
enum CTRY_CARIBBEAN = 0x00000001;
enum CTRY_CHILE = 0x00000038;
enum CTRY_COLOMBIA = 0x00000039;
enum CTRY_COSTA_RICA = 0x000001fa;
enum CTRY_CROATIA = 0x00000181;
enum CTRY_CZECH = 0x000001a4;
enum CTRY_DENMARK = 0x0000002d;
enum CTRY_DOMINICAN_REPUBLIC = 0x00000001;
enum CTRY_ECUADOR = 0x00000251;
enum CTRY_EGYPT = 0x00000014;
enum CTRY_EL_SALVADOR = 0x000001f7;
enum CTRY_ESTONIA = 0x00000174;
enum CTRY_FAEROE_ISLANDS = 0x0000012a;
enum CTRY_FINLAND = 0x00000166;
enum CTRY_FRANCE = 0x00000021;
enum CTRY_GEORGIA = 0x000003e3;
enum CTRY_GERMANY = 0x00000031;
enum CTRY_GREECE = 0x0000001e;
enum CTRY_GUATEMALA = 0x000001f6;
enum CTRY_HONDURAS = 0x000001f8;
enum CTRY_HONG_KONG = 0x00000354;
enum CTRY_HUNGARY = 0x00000024;
enum CTRY_ICELAND = 0x00000162;
enum CTRY_INDIA = 0x0000005b;
enum CTRY_INDONESIA = 0x0000003e;
enum CTRY_IRAN = 0x000003d5;
enum CTRY_IRAQ = 0x000003c4;
enum CTRY_IRELAND = 0x00000161;
enum CTRY_ISRAEL = 0x000003cc;
enum CTRY_ITALY = 0x00000027;
enum CTRY_JAMAICA = 0x00000001;
enum CTRY_JAPAN = 0x00000051;
enum CTRY_JORDAN = 0x000003c2;
enum CTRY_KAZAKSTAN = 0x00000007;
enum CTRY_KENYA = 0x000000fe;
enum CTRY_KUWAIT = 0x000003c5;
enum CTRY_KYRGYZSTAN = 0x000003e4;
enum CTRY_LATVIA = 0x00000173;
enum CTRY_LEBANON = 0x000003c1;
enum CTRY_LIBYA = 0x000000da;
enum CTRY_LIECHTENSTEIN = 0x00000029;
enum CTRY_LITHUANIA = 0x00000172;
enum CTRY_LUXEMBOURG = 0x00000160;
enum CTRY_MACAU = 0x00000355;
enum CTRY_MACEDONIA = 0x00000185;
enum CTRY_MALAYSIA = 0x0000003c;
enum CTRY_MALDIVES = 0x000003c0;
enum CTRY_MEXICO = 0x00000034;
enum CTRY_MONACO = 0x00000021;
enum CTRY_MONGOLIA = 0x000003d0;
enum CTRY_MOROCCO = 0x000000d4;
enum CTRY_NETHERLANDS = 0x0000001f;
enum CTRY_NEW_ZEALAND = 0x00000040;
enum CTRY_NICARAGUA = 0x000001f9;
enum CTRY_NORWAY = 0x0000002f;
enum CTRY_OMAN = 0x000003c8;
enum CTRY_PAKISTAN = 0x0000005c;
enum CTRY_PANAMA = 0x000001fb;
enum CTRY_PARAGUAY = 0x00000253;
enum CTRY_PERU = 0x00000033;
enum CTRY_PHILIPPINES = 0x0000003f;
enum CTRY_POLAND = 0x00000030;
enum CTRY_PORTUGAL = 0x0000015f;
enum CTRY_PRCHINA = 0x00000056;
enum CTRY_PUERTO_RICO = 0x00000001;
enum CTRY_QATAR = 0x000003ce;
enum CTRY_ROMANIA = 0x00000028;
enum CTRY_RUSSIA = 0x00000007;
enum CTRY_SAUDI_ARABIA = 0x000003c6;
enum CTRY_SERBIA = 0x0000017d;
enum CTRY_SINGAPORE = 0x00000041;
enum CTRY_SLOVAK = 0x000001a5;
enum CTRY_SLOVENIA = 0x00000182;
enum CTRY_SOUTH_AFRICA = 0x0000001b;
enum CTRY_SOUTH_KOREA = 0x00000052;
enum CTRY_SPAIN = 0x00000022;
enum CTRY_SWEDEN = 0x0000002e;
enum CTRY_SWITZERLAND = 0x00000029;
enum CTRY_SYRIA = 0x000003c3;
enum CTRY_TAIWAN = 0x00000376;
enum CTRY_TATARSTAN = 0x00000007;
enum CTRY_THAILAND = 0x00000042;
enum CTRY_TRINIDAD_Y_TOBAGO = 0x00000001;
enum CTRY_TUNISIA = 0x000000d8;
enum CTRY_TURKEY = 0x0000005a;
enum CTRY_UAE = 0x000003cb;
enum CTRY_UKRAINE = 0x0000017c;
enum CTRY_UNITED_KINGDOM = 0x0000002c;
enum CTRY_UNITED_STATES = 0x00000001;
enum CTRY_URUGUAY = 0x00000256;
enum CTRY_UZBEKISTAN = 0x00000007;
enum CTRY_VENEZUELA = 0x0000003a;
enum CTRY_VIET_NAM = 0x00000054;
enum CTRY_YEMEN = 0x000003c7;
enum CTRY_ZIMBABWE = 0x00000107;
enum LOCALE_NOUSEROVERRIDE = 0x80000000;
enum LOCALE_USE_CP_ACP = 0x40000000;
enum LOCALE_RETURN_NUMBER = 0x20000000;
enum LOCALE_RETURN_GENITIVE_NAMES = 0x10000000;
enum LOCALE_ALLOW_NEUTRAL_NAMES = 0x08000000;
enum LOCALE_SLOCALIZEDDISPLAYNAME = 0x00000002;
enum LOCALE_SENGLISHDISPLAYNAME = 0x00000072;
enum LOCALE_SNATIVEDISPLAYNAME = 0x00000073;
enum LOCALE_SLOCALIZEDLANGUAGENAME = 0x0000006f;
enum LOCALE_SENGLISHLANGUAGENAME = 0x00001001;
enum LOCALE_SNATIVELANGUAGENAME = 0x00000004;
enum LOCALE_SLOCALIZEDCOUNTRYNAME = 0x00000006;
enum LOCALE_SENGLISHCOUNTRYNAME = 0x00001002;
enum LOCALE_SNATIVECOUNTRYNAME = 0x00000008;
enum LOCALE_IDIALINGCODE = 0x00000005;
enum LOCALE_SLIST = 0x0000000c;
enum LOCALE_IMEASURE = 0x0000000d;
enum LOCALE_SDECIMAL = 0x0000000e;
enum LOCALE_STHOUSAND = 0x0000000f;
enum LOCALE_SGROUPING = 0x00000010;
enum LOCALE_IDIGITS = 0x00000011;
enum LOCALE_ILZERO = 0x00000012;
enum LOCALE_INEGNUMBER = 0x00001010;
enum LOCALE_SNATIVEDIGITS = 0x00000013;
enum LOCALE_SCURRENCY = 0x00000014;
enum LOCALE_SINTLSYMBOL = 0x00000015;
enum LOCALE_SMONDECIMALSEP = 0x00000016;
enum LOCALE_SMONTHOUSANDSEP = 0x00000017;
enum LOCALE_SMONGROUPING = 0x00000018;
enum LOCALE_ICURRDIGITS = 0x00000019;
enum LOCALE_ICURRENCY = 0x0000001b;
enum LOCALE_INEGCURR = 0x0000001c;
enum LOCALE_SSHORTDATE = 0x0000001f;
enum LOCALE_SLONGDATE = 0x00000020;
enum LOCALE_STIMEFORMAT = 0x00001003;
enum LOCALE_SAM = 0x00000028;
enum LOCALE_SPM = 0x00000029;
enum LOCALE_ICALENDARTYPE = 0x00001009;
enum LOCALE_IOPTIONALCALENDAR = 0x0000100b;
enum LOCALE_IFIRSTDAYOFWEEK = 0x0000100c;
enum LOCALE_IFIRSTWEEKOFYEAR = 0x0000100d;
enum LOCALE_SDAYNAME1 = 0x0000002a;
enum LOCALE_SDAYNAME2 = 0x0000002b;
enum LOCALE_SDAYNAME3 = 0x0000002c;
enum LOCALE_SDAYNAME4 = 0x0000002d;
enum LOCALE_SDAYNAME5 = 0x0000002e;
enum LOCALE_SDAYNAME6 = 0x0000002f;
enum LOCALE_SDAYNAME7 = 0x00000030;
enum LOCALE_SABBREVDAYNAME1 = 0x00000031;
enum LOCALE_SABBREVDAYNAME2 = 0x00000032;
enum LOCALE_SABBREVDAYNAME3 = 0x00000033;
enum LOCALE_SABBREVDAYNAME4 = 0x00000034;
enum LOCALE_SABBREVDAYNAME5 = 0x00000035;
enum LOCALE_SABBREVDAYNAME6 = 0x00000036;
enum LOCALE_SABBREVDAYNAME7 = 0x00000037;
enum LOCALE_SMONTHNAME1 = 0x00000038;
enum LOCALE_SMONTHNAME2 = 0x00000039;
enum LOCALE_SMONTHNAME3 = 0x0000003a;
enum LOCALE_SMONTHNAME4 = 0x0000003b;
enum LOCALE_SMONTHNAME5 = 0x0000003c;
enum LOCALE_SMONTHNAME6 = 0x0000003d;
enum LOCALE_SMONTHNAME7 = 0x0000003e;
enum LOCALE_SMONTHNAME8 = 0x0000003f;
enum LOCALE_SMONTHNAME9 = 0x00000040;
enum LOCALE_SMONTHNAME10 = 0x00000041;
enum LOCALE_SMONTHNAME11 = 0x00000042;
enum LOCALE_SMONTHNAME12 = 0x00000043;
enum LOCALE_SMONTHNAME13 = 0x0000100e;
enum LOCALE_SABBREVMONTHNAME1 = 0x00000044;
enum LOCALE_SABBREVMONTHNAME2 = 0x00000045;
enum LOCALE_SABBREVMONTHNAME3 = 0x00000046;
enum LOCALE_SABBREVMONTHNAME4 = 0x00000047;
enum LOCALE_SABBREVMONTHNAME5 = 0x00000048;
enum LOCALE_SABBREVMONTHNAME6 = 0x00000049;
enum LOCALE_SABBREVMONTHNAME7 = 0x0000004a;
enum LOCALE_SABBREVMONTHNAME8 = 0x0000004b;
enum LOCALE_SABBREVMONTHNAME9 = 0x0000004c;
enum LOCALE_SABBREVMONTHNAME10 = 0x0000004d;
enum LOCALE_SABBREVMONTHNAME11 = 0x0000004e;
enum LOCALE_SABBREVMONTHNAME12 = 0x0000004f;
enum LOCALE_SABBREVMONTHNAME13 = 0x0000100f;
enum LOCALE_SPOSITIVESIGN = 0x00000050;
enum LOCALE_SNEGATIVESIGN = 0x00000051;
enum LOCALE_IPOSSIGNPOSN = 0x00000052;
enum LOCALE_INEGSIGNPOSN = 0x00000053;
enum LOCALE_IPOSSYMPRECEDES = 0x00000054;
enum LOCALE_IPOSSEPBYSPACE = 0x00000055;
enum LOCALE_INEGSYMPRECEDES = 0x00000056;
enum LOCALE_INEGSEPBYSPACE = 0x00000057;
enum LOCALE_FONTSIGNATURE = 0x00000058;
enum LOCALE_SISO639LANGNAME = 0x00000059;
enum LOCALE_SISO3166CTRYNAME = 0x0000005a;
enum LOCALE_IPAPERSIZE = 0x0000100a;
enum LOCALE_SENGCURRNAME = 0x00001007;
enum LOCALE_SNATIVECURRNAME = 0x00001008;
enum LOCALE_SYEARMONTH = 0x00001006;
enum LOCALE_SSORTNAME = 0x00001013;
enum LOCALE_IDIGITSUBSTITUTION = 0x00001014;
enum LOCALE_SNAME = 0x0000005c;
enum LOCALE_SDURATION = 0x0000005d;
enum LOCALE_SSHORTESTDAYNAME1 = 0x00000060;
enum LOCALE_SSHORTESTDAYNAME2 = 0x00000061;
enum LOCALE_SSHORTESTDAYNAME3 = 0x00000062;
enum LOCALE_SSHORTESTDAYNAME4 = 0x00000063;
enum LOCALE_SSHORTESTDAYNAME5 = 0x00000064;
enum LOCALE_SSHORTESTDAYNAME6 = 0x00000065;
enum LOCALE_SSHORTESTDAYNAME7 = 0x00000066;
enum LOCALE_SISO639LANGNAME2 = 0x00000067;
enum LOCALE_SISO3166CTRYNAME2 = 0x00000068;
enum LOCALE_SNAN = 0x00000069;
enum LOCALE_SPOSINFINITY = 0x0000006a;
enum LOCALE_SNEGINFINITY = 0x0000006b;
enum LOCALE_SSCRIPTS = 0x0000006c;
enum LOCALE_SPARENT = 0x0000006d;
enum LOCALE_SCONSOLEFALLBACKNAME = 0x0000006e;
enum LOCALE_IREADINGLAYOUT = 0x00000070;
enum LOCALE_INEUTRAL = 0x00000071;
enum LOCALE_INEGATIVEPERCENT = 0x00000074;
enum LOCALE_IPOSITIVEPERCENT = 0x00000075;
enum LOCALE_SPERCENT = 0x00000076;
enum LOCALE_SPERMILLE = 0x00000077;
enum LOCALE_SMONTHDAY = 0x00000078;
enum LOCALE_SSHORTTIME = 0x00000079;
enum LOCALE_SOPENTYPELANGUAGETAG = 0x0000007a;
enum LOCALE_SSORTLOCALE = 0x0000007b;
enum LOCALE_SRELATIVELONGDATE = 0x0000007c;
enum LOCALE_ICONSTRUCTEDLOCALE = 0x0000007d;
enum LOCALE_SSHORTESTAM = 0x0000007e;
enum LOCALE_SSHORTESTPM = 0x0000007f;
enum LOCALE_IUSEUTF8LEGACYACP = 0x00000666;
enum LOCALE_IUSEUTF8LEGACYOEMCP = 0x00000999;
enum LOCALE_IDEFAULTCODEPAGE = 0x0000000b;
enum LOCALE_IDEFAULTANSICODEPAGE = 0x00001004;
enum LOCALE_IDEFAULTMACCODEPAGE = 0x00001011;
enum LOCALE_IDEFAULTEBCDICCODEPAGE = 0x00001012;
enum LOCALE_ILANGUAGE = 0x00000001;
enum LOCALE_SABBREVLANGNAME = 0x00000003;
enum LOCALE_SABBREVCTRYNAME = 0x00000007;
enum LOCALE_IGEOID = 0x0000005b;
enum LOCALE_IDEFAULTLANGUAGE = 0x00000009;
enum LOCALE_IDEFAULTCOUNTRY = 0x0000000a;
enum LOCALE_IINTLCURRDIGITS = 0x0000001a;
enum LOCALE_SDATE = 0x0000001d;
enum LOCALE_STIME = 0x0000001e;
enum LOCALE_IDATE = 0x00000021;
enum LOCALE_ILDATE = 0x00000022;
enum LOCALE_ITIME = 0x00000023;
enum LOCALE_ITIMEMARKPOSN = 0x00001005;
enum LOCALE_ICENTURY = 0x00000024;
enum LOCALE_ITLZERO = 0x00000025;
enum LOCALE_IDAYLZERO = 0x00000026;
enum LOCALE_IMONLZERO = 0x00000027;
enum LOCALE_SKEYBOARDSTOINSTALL = 0x0000005e;
enum LOCALE_SLANGUAGE = 0x00000002;
enum LOCALE_SLANGDISPLAYNAME = 0x0000006f;
enum LOCALE_SENGLANGUAGE = 0x00001001;
enum LOCALE_SNATIVELANGNAME = 0x00000004;
enum LOCALE_SCOUNTRY = 0x00000006;
enum LOCALE_SENGCOUNTRY = 0x00001002;
enum LOCALE_SNATIVECTRYNAME = 0x00000008;
enum LOCALE_ICOUNTRY = 0x00000005;
enum LOCALE_S1159 = 0x00000028;
enum LOCALE_S2359 = 0x00000029;
enum CAL_NOUSEROVERRIDE = 0x80000000;
enum CAL_USE_CP_ACP = 0x40000000;
enum CAL_RETURN_NUMBER = 0x20000000;
enum CAL_RETURN_GENITIVE_NAMES = 0x10000000;
enum CAL_ICALINTVALUE = 0x00000001;
enum CAL_SCALNAME = 0x00000002;
enum CAL_IYEAROFFSETRANGE = 0x00000003;
enum CAL_SERASTRING = 0x00000004;
enum CAL_SSHORTDATE = 0x00000005;
enum CAL_SLONGDATE = 0x00000006;
enum CAL_SDAYNAME1 = 0x00000007;
enum CAL_SDAYNAME2 = 0x00000008;
enum CAL_SDAYNAME3 = 0x00000009;
enum CAL_SDAYNAME4 = 0x0000000a;
enum CAL_SDAYNAME5 = 0x0000000b;
enum CAL_SDAYNAME6 = 0x0000000c;
enum CAL_SDAYNAME7 = 0x0000000d;
enum CAL_SABBREVDAYNAME1 = 0x0000000e;
enum CAL_SABBREVDAYNAME2 = 0x0000000f;
enum CAL_SABBREVDAYNAME3 = 0x00000010;
enum CAL_SABBREVDAYNAME4 = 0x00000011;
enum CAL_SABBREVDAYNAME5 = 0x00000012;
enum CAL_SABBREVDAYNAME6 = 0x00000013;
enum CAL_SABBREVDAYNAME7 = 0x00000014;
enum CAL_SMONTHNAME1 = 0x00000015;
enum CAL_SMONTHNAME2 = 0x00000016;
enum CAL_SMONTHNAME3 = 0x00000017;
enum CAL_SMONTHNAME4 = 0x00000018;
enum CAL_SMONTHNAME5 = 0x00000019;
enum CAL_SMONTHNAME6 = 0x0000001a;
enum CAL_SMONTHNAME7 = 0x0000001b;
enum CAL_SMONTHNAME8 = 0x0000001c;
enum CAL_SMONTHNAME9 = 0x0000001d;
enum CAL_SMONTHNAME10 = 0x0000001e;
enum CAL_SMONTHNAME11 = 0x0000001f;
enum CAL_SMONTHNAME12 = 0x00000020;
enum CAL_SMONTHNAME13 = 0x00000021;
enum CAL_SABBREVMONTHNAME1 = 0x00000022;
enum CAL_SABBREVMONTHNAME2 = 0x00000023;
enum CAL_SABBREVMONTHNAME3 = 0x00000024;
enum CAL_SABBREVMONTHNAME4 = 0x00000025;
enum CAL_SABBREVMONTHNAME5 = 0x00000026;
enum CAL_SABBREVMONTHNAME6 = 0x00000027;
enum CAL_SABBREVMONTHNAME7 = 0x00000028;
enum CAL_SABBREVMONTHNAME8 = 0x00000029;
enum CAL_SABBREVMONTHNAME9 = 0x0000002a;
enum CAL_SABBREVMONTHNAME10 = 0x0000002b;
enum CAL_SABBREVMONTHNAME11 = 0x0000002c;
enum CAL_SABBREVMONTHNAME12 = 0x0000002d;
enum CAL_SABBREVMONTHNAME13 = 0x0000002e;
enum CAL_SYEARMONTH = 0x0000002f;
enum CAL_ITWODIGITYEARMAX = 0x00000030;
enum CAL_SSHORTESTDAYNAME1 = 0x00000031;
enum CAL_SSHORTESTDAYNAME2 = 0x00000032;
enum CAL_SSHORTESTDAYNAME3 = 0x00000033;
enum CAL_SSHORTESTDAYNAME4 = 0x00000034;
enum CAL_SSHORTESTDAYNAME5 = 0x00000035;
enum CAL_SSHORTESTDAYNAME6 = 0x00000036;
enum CAL_SSHORTESTDAYNAME7 = 0x00000037;
enum CAL_SMONTHDAY = 0x00000038;
enum CAL_SABBREVERASTRING = 0x00000039;
enum CAL_SRELATIVELONGDATE = 0x0000003a;
enum CAL_SENGLISHERANAME = 0x0000003b;
enum CAL_SENGLISHABBREVERANAME = 0x0000003c;
enum CAL_SJAPANESEERAFIRSTYEAR = 0x0000003d;
enum ENUM_ALL_CALENDARS = 0xffffffff;
enum CAL_GREGORIAN = 0x00000001;
enum CAL_GREGORIAN_US = 0x00000002;
enum CAL_JAPAN = 0x00000003;
enum CAL_TAIWAN = 0x00000004;
enum CAL_KOREA = 0x00000005;
enum CAL_HIJRI = 0x00000006;
enum CAL_THAI = 0x00000007;
enum CAL_HEBREW = 0x00000008;
enum CAL_GREGORIAN_ME_FRENCH = 0x00000009;
enum CAL_GREGORIAN_ARABIC = 0x0000000a;
enum CAL_GREGORIAN_XLIT_ENGLISH = 0x0000000b;
enum CAL_GREGORIAN_XLIT_FRENCH = 0x0000000c;
enum CAL_PERSIAN = 0x00000016;
enum CAL_UMALQURA = 0x00000017;
enum LGRPID_WESTERN_EUROPE = 0x00000001;
enum LGRPID_CENTRAL_EUROPE = 0x00000002;
enum LGRPID_BALTIC = 0x00000003;
enum LGRPID_GREEK = 0x00000004;
enum LGRPID_CYRILLIC = 0x00000005;
enum LGRPID_TURKIC = 0x00000006;
enum LGRPID_TURKISH = 0x00000006;
enum LGRPID_JAPANESE = 0x00000007;
enum LGRPID_KOREAN = 0x00000008;
enum LGRPID_TRADITIONAL_CHINESE = 0x00000009;
enum LGRPID_SIMPLIFIED_CHINESE = 0x0000000a;
enum LGRPID_THAI = 0x0000000b;
enum LGRPID_HEBREW = 0x0000000c;
enum LGRPID_ARABIC = 0x0000000d;
enum LGRPID_VIETNAMESE = 0x0000000e;
enum LGRPID_INDIC = 0x0000000f;
enum LGRPID_GEORGIAN = 0x00000010;
enum LGRPID_ARMENIAN = 0x00000011;
enum MUI_LANGUAGE_ID = 0x00000004;
enum MUI_LANGUAGE_NAME = 0x00000008;
enum MUI_MERGE_SYSTEM_FALLBACK = 0x00000010;
enum MUI_MERGE_USER_FALLBACK = 0x00000020;
enum MUI_THREAD_LANGUAGES = 0x00000040;
enum MUI_CONSOLE_FILTER = 0x00000100;
enum MUI_COMPLEX_SCRIPT_FILTER = 0x00000200;
enum MUI_RESET_FILTERS = 0x00000001;
enum MUI_USER_PREFERRED_UI_LANGUAGES = 0x00000010;
enum MUI_USE_INSTALLED_LANGUAGES = 0x00000020;
enum MUI_USE_SEARCH_ALL_LANGUAGES = 0x00000040;
enum MUI_LANG_NEUTRAL_PE_FILE = 0x00000100;
enum MUI_NON_LANG_NEUTRAL_FILE = 0x00000200;
enum MUI_MACHINE_LANGUAGE_SETTINGS = 0x00000400;
enum MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL = 0x00000001;
enum MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN = 0x00000002;
enum MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI = 0x00000004;
enum MUI_QUERY_TYPE = 0x00000001;
enum MUI_QUERY_CHECKSUM = 0x00000002;
enum MUI_QUERY_LANGUAGE_NAME = 0x00000004;
enum MUI_QUERY_RESOURCE_TYPES = 0x00000008;
enum MUI_FILEINFO_VERSION = 0x00000001;
enum MUI_FULL_LANGUAGE = 0x00000001;
enum MUI_PARTIAL_LANGUAGE = 0x00000002;
enum MUI_LIP_LANGUAGE = 0x00000004;
enum MUI_LANGUAGE_INSTALLED = 0x00000020;
enum MUI_LANGUAGE_LICENSED = 0x00000040;
enum GEOID_NOT_AVAILABLE = 0xffffffffffffffff;
enum SORTING_PARADIGM_NLS = 0x00000000;
enum SORTING_PARADIGM_ICU = 0x01000000;
enum IDN_ALLOW_UNASSIGNED = 0x00000001;
enum IDN_USE_STD3_ASCII_RULES = 0x00000002;
enum IDN_EMAIL_ADDRESS = 0x00000004;
enum IDN_RAW_PUNYCODE = 0x00000008;
enum VS_ALLOW_LATIN = 0x00000001;
enum GSS_ALLOW_INHERITED_COMMON = 0x00000001;
enum MUI_FORMAT_REG_COMPAT = 0x00000001;
enum MUI_FORMAT_INF_COMPAT = 0x00000002;
enum MUI_VERIFY_FILE_EXISTS = 0x00000004;
enum MUI_SKIP_STRING_CACHE = 0x00000008;
enum MUI_IMMUTABLE_LOOKUP = 0x00000010;
enum LOCALE_NAME_INVARIANT = "";
enum LOCALE_NAME_SYSTEM_DEFAULT = "!x-sys-default-locale";
enum MIN_SPELLING_NTDDI = 0x06020000;
enum SCRIPT_UNDEFINED = 0x00000000;
enum USP_E_SCRIPT_NOT_IN_FONT = 0xffffffff80040200;
enum SGCM_RTL = 0x00000001;
enum SSA_PASSWORD = 0x00000001;
enum SSA_TAB = 0x00000002;
enum SSA_CLIP = 0x00000004;
enum SSA_FIT = 0x00000008;
enum SSA_DZWG = 0x00000010;
enum SSA_FALLBACK = 0x00000020;
enum SSA_BREAK = 0x00000040;
enum SSA_GLYPHS = 0x00000080;
enum SSA_RTL = 0x00000100;
enum SSA_GCP = 0x00000200;
enum SSA_HOTKEY = 0x00000400;
enum SSA_METAFILE = 0x00000800;
enum SSA_LINK = 0x00001000;
enum SSA_HIDEHOTKEY = 0x00002000;
enum SSA_HOTKEYONLY = 0x00002400;
enum SSA_FULLMEASURE = 0x04000000;
enum SSA_LPKANSIFALLBACK = 0x08000000;
enum SSA_PIDX = 0x10000000;
enum SSA_LAYOUTRTL = 0x20000000;
enum SSA_DONTGLYPH = 0x40000000;
enum SSA_NOKASHIDA = 0x80000000;
enum SCRIPT_DIGITSUBSTITUTE_CONTEXT = 0x00000000;
enum SCRIPT_DIGITSUBSTITUTE_NONE = 0x00000001;
enum SCRIPT_DIGITSUBSTITUTE_NATIONAL = 0x00000002;
enum SCRIPT_DIGITSUBSTITUTE_TRADITIONAL = 0x00000003;
enum UNISCRIBE_OPENTYPE = 0x00000100;
enum SCRIPT_TAG_UNKNOWN = 0x00000000;
enum MUI_LANGUAGE_EXACT = 0x00000010;
enum NLS_CP_CPINFO = 0x10000000;
enum NLS_CP_MBTOWC = 0x40000000;
enum NLS_CP_WCTOMB = 0x80000000;
enum U_DISABLE_RENAMING = 0x00000001;
enum U_SHOW_CPLUSPLUS_API = 0x00000000;
enum U_DEFAULT_SHOW_DRAFT = 0x00000000;
enum U_HIDE_DRAFT_API = 0x00000001;
enum U_HIDE_DEPRECATED_API = 0x00000001;
enum U_HIDE_OBSOLETE_API = 0x00000001;
enum U_HIDE_INTERNAL_API = 0x00000001;
enum U_NO_DEFAULT_INCLUDE_UTF_HEADERS = 0x00000001;
enum U_DEBUG = 0x00000001;
enum UCLN_NO_AUTO_CLEANUP = 0x00000001;
enum U_OVERRIDE_CXX_ALLOCATION = 0x00000001;
enum U_ENABLE_TRACING = 0x00000000;
enum UCONFIG_ENABLE_PLUGINS = 0x00000000;
enum U_ENABLE_DYLOAD = 0x00000001;
enum U_CHECK_DYLOAD = 0x00000001;
enum U_HAVE_LIB_SUFFIX = 0x00000001;
enum U_LIB_SUFFIX_C_NAME_STRING = "";
enum UCONFIG_ONLY_COLLATION = 0x00000000;
enum UCONFIG_NO_BREAK_ITERATION = 0x00000001;
enum UCONFIG_NO_IDNA = 0x00000001;
enum UCONFIG_NO_FORMATTING = 0x00000001;
enum UCONFIG_NO_TRANSLITERATION = 0x00000001;
enum UCONFIG_NO_REGULAR_EXPRESSIONS = 0x00000001;
enum UCONFIG_NO_FILE_IO = 0x00000000;
enum UCONFIG_NO_CONVERSION = 0x00000000;
enum UCONFIG_NO_LEGACY_CONVERSION = 0x00000001;
enum UCONFIG_ONLY_HTML_CONVERSION = 0x00000000;
enum UCONFIG_NO_NORMALIZATION = 0x00000000;
enum UCONFIG_NO_COLLATION = 0x00000001;
enum UCONFIG_NO_SERVICE = 0x00000000;
enum UCONFIG_HAVE_PARSEALLINPUT = 0x00000001;
enum UCONFIG_NO_FILTERED_BREAK_ITERATION = 0x00000000;
enum U_PF_UNKNOWN = 0x00000000;
enum U_PF_WINDOWS = 0x000003e8;
enum U_PF_MINGW = 0x00000708;
enum U_PF_CYGWIN = 0x0000076c;
enum U_PF_HPUX = 0x00000834;
enum U_PF_SOLARIS = 0x00000a28;
enum U_PF_BSD = 0x00000bb8;
enum U_PF_AIX = 0x00000c1c;
enum U_PF_IRIX = 0x00000c80;
enum U_PF_DARWIN = 0x00000dac;
enum U_PF_IPHONE = 0x00000dde;
enum U_PF_QNX = 0x00000e74;
enum U_PF_LINUX = 0x00000fa0;
enum U_PF_BROWSER_NATIVE_CLIENT = 0x00000fb4;
enum U_PF_ANDROID = 0x00000fd2;
enum U_PF_FUCHSIA = 0x00001004;
enum U_PF_EMSCRIPTEN = 0x00001392;
enum U_PF_OS390 = 0x00002328;
enum U_PF_OS400 = 0x000024b8;
enum U_PLATFORM = 0x00000708;
enum U_PLATFORM_USES_ONLY_WIN32_API = 0x00000001;
enum U_PLATFORM_HAS_WIN32_API = 0x00000001;
enum U_PLATFORM_IMPLEMENTS_POSIX = 0x00000000;
enum U_PLATFORM_IS_LINUX_BASED = 0x00000001;
enum U_PLATFORM_IS_DARWIN_BASED = 0x00000001;
enum U_HAVE_STDINT_H = 0x00000001;
enum U_HAVE_INTTYPES_H = 0x00000001;
enum U_GCC_MAJOR_MINOR = 0x00000000;
enum U_IS_BIG_ENDIAN = 0x00000000;
enum U_HAVE_PLACEMENT_NEW = 0x00000000;
enum U_HAVE_DEBUG_LOCATION_NEW = 0x00000001;
enum U_CPLUSPLUS_VERSION = 0x00000000;
enum U_ASCII_FAMILY = 0x00000000;
enum U_EBCDIC_FAMILY = 0x00000001;
enum U_CHARSET_FAMILY = 0x00000001;
enum U_CHARSET_IS_UTF8 = 0x00000001;
enum U_HAVE_WCHAR_H = 0x00000000;
enum U_SIZEOF_WCHAR_T = 0x00000001;
enum U_HAVE_WCSCPY = 0x00000000;
enum U_HAVE_CHAR16_T = 0x00000001;
enum U_DEFINE_FALSE_AND_TRUE = 0x00000001;
enum U_SIZEOF_UCHAR = 0x00000002;
enum U_CHAR16_IS_TYPEDEF = 0x00000001;
enum U_SENTINEL = 0xffffffffffffffff;
enum U8_LEAD3_T1_BITS = " 00000000000000";
enum U8_LEAD4_T1_BITS = "\0\0\0\0\0\0\0\0\0\0\0\0";
enum U8_MAX_LENGTH = 0x00000004;
enum U16_MAX_LENGTH = 0x00000002;
enum U_HIDE_OBSOLETE_UTF_OLD_H = 0x00000000;
enum UTF_SIZE = 0x00000010;
enum UTF8_ERROR_VALUE_1 = 0x00000015;
enum UTF8_ERROR_VALUE_2 = 0x0000009f;
enum UTF_ERROR_VALUE = 0x0000ffff;
enum UTF8_MAX_CHAR_LENGTH = 0x00000004;
enum UTF16_MAX_CHAR_LENGTH = 0x00000002;
enum UTF32_MAX_CHAR_LENGTH = 0x00000001;
enum UTF_MAX_CHAR_LENGTH = 0x00000002;
enum U_COPYRIGHT_STRING_LENGTH = 0x00000080;
enum U_MAX_VERSION_LENGTH = 0x00000004;
enum U_MAX_VERSION_STRING_LENGTH = 0x00000014;
enum U_MILLIS_PER_SECOND = 0x000003e8;
enum U_MILLIS_PER_MINUTE = 0x0000ea60;
enum U_MILLIS_PER_HOUR = 0x0036ee80;
enum U_MILLIS_PER_DAY = 0x05265c00;
enum U_COMBINED_IMPLEMENTATION = 0x00000001;
enum U_SHAPE_LENGTH_GROW_SHRINK = 0x00000000;
enum U_SHAPE_LAMALEF_RESIZE = 0x00000000;
enum U_SHAPE_LENGTH_FIXED_SPACES_NEAR = 0x00000001;
enum U_SHAPE_LAMALEF_NEAR = 0x00000001;
enum U_SHAPE_LENGTH_FIXED_SPACES_AT_END = 0x00000002;
enum U_SHAPE_LAMALEF_END = 0x00000002;
enum U_SHAPE_LENGTH_FIXED_SPACES_AT_BEGINNING = 0x00000003;
enum U_SHAPE_LAMALEF_BEGIN = 0x00000003;
enum U_SHAPE_LAMALEF_AUTO = 0x00010000;
enum U_SHAPE_LENGTH_MASK = 0x00010003;
enum U_SHAPE_LAMALEF_MASK = 0x00010003;
enum U_SHAPE_TEXT_DIRECTION_LOGICAL = 0x00000000;
enum U_SHAPE_TEXT_DIRECTION_VISUAL_RTL = 0x00000000;
enum U_SHAPE_TEXT_DIRECTION_VISUAL_LTR = 0x00000004;
enum U_SHAPE_TEXT_DIRECTION_MASK = 0x00000004;
enum U_SHAPE_LETTERS_NOOP = 0x00000000;
enum U_SHAPE_LETTERS_SHAPE = 0x00000008;
enum U_SHAPE_LETTERS_UNSHAPE = 0x00000010;
enum U_SHAPE_LETTERS_SHAPE_TASHKEEL_ISOLATED = 0x00000018;
enum U_SHAPE_LETTERS_MASK = 0x00000018;
enum U_SHAPE_DIGITS_NOOP = 0x00000000;
enum U_SHAPE_DIGITS_EN2AN = 0x00000020;
enum U_SHAPE_DIGITS_AN2EN = 0x00000040;
enum U_SHAPE_DIGITS_ALEN2AN_INIT_LR = 0x00000060;
enum U_SHAPE_DIGITS_ALEN2AN_INIT_AL = 0x00000080;
enum U_SHAPE_DIGITS_RESERVED = 0x000000a0;
enum U_SHAPE_DIGITS_MASK = 0x000000e0;
enum U_SHAPE_DIGIT_TYPE_AN = 0x00000000;
enum U_SHAPE_DIGIT_TYPE_AN_EXTENDED = 0x00000100;
enum U_SHAPE_DIGIT_TYPE_RESERVED = 0x00000200;
enum U_SHAPE_DIGIT_TYPE_MASK = 0x00000300;
enum U_SHAPE_AGGREGATE_TASHKEEL = 0x00004000;
enum U_SHAPE_AGGREGATE_TASHKEEL_NOOP = 0x00000000;
enum U_SHAPE_AGGREGATE_TASHKEEL_MASK = 0x00004000;
enum U_SHAPE_PRESERVE_PRESENTATION = 0x00008000;
enum U_SHAPE_PRESERVE_PRESENTATION_NOOP = 0x00000000;
enum U_SHAPE_PRESERVE_PRESENTATION_MASK = 0x00008000;
enum U_SHAPE_SEEN_TWOCELL_NEAR = 0x00200000;
enum U_SHAPE_SEEN_MASK = 0x00700000;
enum U_SHAPE_YEHHAMZA_TWOCELL_NEAR = 0x01000000;
enum U_SHAPE_YEHHAMZA_MASK = 0x03800000;
enum U_SHAPE_TASHKEEL_BEGIN = 0x00040000;
enum U_SHAPE_TASHKEEL_END = 0x00060000;
enum U_SHAPE_TASHKEEL_RESIZE = 0x00080000;
enum U_SHAPE_TASHKEEL_REPLACE_BY_TATWEEL = 0x000c0000;
enum U_SHAPE_TASHKEEL_MASK = 0x000e0000;
enum U_SHAPE_SPACES_RELATIVE_TO_TEXT_BEGIN_END = 0x04000000;
enum U_SHAPE_SPACES_RELATIVE_TO_TEXT_MASK = 0x04000000;
enum U_SHAPE_TAIL_NEW_UNICODE = 0x08000000;
enum U_SHAPE_TAIL_TYPE_MASK = 0x08000000;
enum ULOC_CHINESE = "zh";
enum ULOC_ENGLISH = "en";
enum ULOC_FRENCH = "fr";
enum ULOC_GERMAN = "de";
enum ULOC_ITALIAN = "it";
enum ULOC_JAPANESE = "ja";
enum ULOC_KOREAN = "ko";
enum ULOC_SIMPLIFIED_CHINESE = "zh_CN";
enum ULOC_TRADITIONAL_CHINESE = "zh_TW";
enum ULOC_CANADA = "en_CA";
enum ULOC_CANADA_FRENCH = "fr_CA";
enum ULOC_CHINA = "zh_CN";
enum ULOC_PRC = "zh_CN";
enum ULOC_FRANCE = "fr_FR";
enum ULOC_GERMANY = "de_DE";
enum ULOC_ITALY = "it_IT";
enum ULOC_JAPAN = "ja_JP";
enum ULOC_KOREA = "ko_KR";
enum ULOC_TAIWAN = "zh_TW";
enum ULOC_UK = "en_GB";
enum ULOC_US = "en_US";
enum ULOC_LANG_CAPACITY = 0x0000000c;
enum ULOC_COUNTRY_CAPACITY = 0x00000004;
enum ULOC_FULLNAME_CAPACITY = 0x0000009d;
enum ULOC_SCRIPT_CAPACITY = 0x00000006;
enum ULOC_KEYWORDS_CAPACITY = 0x00000060;
enum ULOC_KEYWORD_AND_VALUES_CAPACITY = 0x00000064;
enum ULOC_KEYWORD_SEPARATOR_UNICODE = 0x00000040;
enum ULOC_KEYWORD_ASSIGN_UNICODE = 0x0000003d;
enum ULOC_KEYWORD_ITEM_SEPARATOR_UNICODE = 0x0000003b;
enum UCNV_SUB_STOP_ON_ILLEGAL = "i";
enum UCNV_SKIP_STOP_ON_ILLEGAL = "i";
enum UCNV_ESCAPE_JAVA = "J";
enum UCNV_ESCAPE_C = "C";
enum UCNV_ESCAPE_XML_DEC = "D";
enum UCNV_ESCAPE_XML_HEX = "X";
enum UCNV_ESCAPE_UNICODE = "U";
enum UCNV_ESCAPE_CSS2 = "S";
enum UCNV_MAX_CONVERTER_NAME_LENGTH = 0x0000003c;
enum UCNV_SI = 0x0000000f;
enum UCNV_SO = 0x0000000e;
enum UCNV_OPTION_SEP_STRING = ",";
enum UCNV_VALUE_SEP_STRING = "=";
enum UCNV_LOCALE_OPTION_STRING = ",locale=";
enum UCNV_VERSION_OPTION_STRING = ",version=";
enum UCNV_SWAP_LFNL_OPTION_STRING = ",swaplfnl";
enum U_FOLD_CASE_DEFAULT = 0x00000000;
enum U_FOLD_CASE_EXCLUDE_SPECIAL_I = 0x00000001;
enum U_TITLECASE_WHOLE_STRING = 0x00000020;
enum U_TITLECASE_SENTENCES = 0x00000040;
enum U_TITLECASE_NO_LOWERCASE = 0x00000100;
enum U_TITLECASE_NO_BREAK_ADJUSTMENT = 0x00000200;
enum U_TITLECASE_ADJUST_TO_CASED = 0x00000400;
enum U_EDITS_NO_RESET = 0x00002000;
enum U_OMIT_UNCHANGED_TEXT = 0x00004000;
enum U_COMPARE_CODE_POINT_ORDER = 0x00008000;
enum U_COMPARE_IGNORE_CASE = 0x00010000;
enum UNORM_INPUT_IS_FCD = 0x00020000;
enum UCHAR_MIN_VALUE = 0x00000000;
enum UCHAR_MAX_VALUE = 0x0010ffff;
enum UBIDI_DEFAULT_LTR = 0x000000fe;
enum UBIDI_DEFAULT_RTL = 0x000000ff;
enum UBIDI_MAX_EXPLICIT_LEVEL = 0x0000007d;
enum UBIDI_LEVEL_OVERRIDE = 0x00000080;
enum UBIDI_MAP_NOWHERE = 0xffffffffffffffff;
enum UBIDI_KEEP_BASE_COMBINING = 0x00000001;
enum UBIDI_DO_MIRRORING = 0x00000002;
enum UBIDI_INSERT_LRM_FOR_NUMERIC = 0x00000004;
enum UBIDI_REMOVE_BIDI_CONTROLS = 0x00000008;
enum UBIDI_OUTPUT_REVERSE = 0x00000010;
enum USPREP_DEFAULT = 0x00000000;
enum USPREP_ALLOW_UNASSIGNED = 0x00000001;
enum U_ICU_VERSION_BUNDLE = "icuver";
enum U_ICU_DATA_KEY = "DataVersion";
enum UCAL_UNKNOWN_ZONE_ID = "Etc/Unknown";
enum UDAT_YEAR = "y";
enum UDAT_QUARTER = "QQQQ";
enum UDAT_ABBR_QUARTER = "QQQ";
enum UDAT_YEAR_QUARTER = "yQQQQ";
enum UDAT_YEAR_ABBR_QUARTER = "yQQQ";
enum UDAT_MONTH = "MMMM";
enum UDAT_ABBR_MONTH = "MMM";
enum UDAT_NUM_MONTH = "M";
enum UDAT_YEAR_MONTH = "yMMMM";
enum UDAT_YEAR_ABBR_MONTH = "yMMM";
enum UDAT_YEAR_NUM_MONTH = "yM";
enum UDAT_DAY = "d";
enum UDAT_YEAR_MONTH_DAY = "yMMMMd";
enum UDAT_YEAR_ABBR_MONTH_DAY = "yMMMd";
enum UDAT_YEAR_NUM_MONTH_DAY = "yMd";
enum UDAT_WEEKDAY = "EEEE";
enum UDAT_ABBR_WEEKDAY = "E";
enum UDAT_YEAR_MONTH_WEEKDAY_DAY = "yMMMMEEEEd";
enum UDAT_YEAR_ABBR_MONTH_WEEKDAY_DAY = "yMMMEd";
enum UDAT_YEAR_NUM_MONTH_WEEKDAY_DAY = "yMEd";
enum UDAT_MONTH_DAY = "MMMMd";
enum UDAT_ABBR_MONTH_DAY = "MMMd";
enum UDAT_NUM_MONTH_DAY = "Md";
enum UDAT_MONTH_WEEKDAY_DAY = "MMMMEEEEd";
enum UDAT_ABBR_MONTH_WEEKDAY_DAY = "MMMEd";
enum UDAT_NUM_MONTH_WEEKDAY_DAY = "MEd";
enum UDAT_HOUR = "j";
enum UDAT_HOUR24 = "H";
enum UDAT_MINUTE = "m";
enum UDAT_HOUR_MINUTE = "jm";
enum UDAT_HOUR24_MINUTE = "Hm";
enum UDAT_SECOND = "s";
enum UDAT_HOUR_MINUTE_SECOND = "jms";
enum UDAT_HOUR24_MINUTE_SECOND = "Hms";
enum UDAT_MINUTE_SECOND = "ms";
enum UDAT_LOCATION_TZ = "VVVV";
enum UDAT_GENERIC_TZ = "vvvv";
enum UDAT_ABBR_GENERIC_TZ = "v";
enum UDAT_SPECIFIC_TZ = "zzzz";
enum UDAT_ABBR_SPECIFIC_TZ = "z";
enum UDAT_ABBR_UTC_TZ = "ZZZZ";
enum USEARCH_DONE = 0xffffffffffffffff;
enum U_HAVE_STD_STRING = 0x00000000;
enum UCONFIG_FORMAT_FASTPATHS_49 = 0x00000001;
enum U_PLATFORM_HAS_WINUWP_API = 0x00000000;
enum U_IOSTREAM_SOURCE = 0x00030c1f;
enum U_HAVE_RVALUE_REFERENCES = 0x00000001;
enum U_USING_ICU_NAMESPACE = 0x00000001;
enum U_ICUDATA_TYPE_LETTER = "e";
enum U_UNICODE_VERSION = "8.0";
enum CANITER_SKIP_ZEROES = 0x00000001;
enum NUMSYS_NAME_CAPACITY = 0x00000008;
enum U_HAVE_RBNF = 0x00000000;
enum MAX_MIMECP_NAME = 0x00000040;
enum MAX_MIMECSET_NAME = 0x00000032;
enum MAX_MIMEFACE_NAME = 0x00000020;
enum MAX_RFC1766_NAME = 0x00000006;
enum MAX_LOCALE_NAME = 0x00000020;
enum MAX_SCRIPT_NAME = 0x00000030;
enum CPIOD_PEEK = 0x40000000;
enum CPIOD_FORCE_PROMPT = 0xffffffff80000000;
enum UITER_UNKNOWN_INDEX = 0xfffffffffffffffe;
enum UCPTRIE_FAST_SHIFT = 0x00000006;
enum UCPTRIE_FAST_DATA_BLOCK_LENGTH = 0x00000040;
enum UCPTRIE_FAST_DATA_MASK = 0x0000003f;
enum UCPTRIE_SMALL_MAX = 0x00000fff;
enum UCPTRIE_ERROR_VALUE_NEG_DATA_OFFSET = 0x00000001;
enum UCPTRIE_HIGH_VALUE_NEG_DATA_OFFSET = 0x00000002;
enum UTEXT_PROVIDER_LENGTH_IS_EXPENSIVE = 0x00000001;
enum UTEXT_PROVIDER_STABLE_CHUNKS = 0x00000002;
enum UTEXT_PROVIDER_WRITABLE = 0x00000003;
enum UTEXT_PROVIDER_HAS_META_DATA = 0x00000004;
enum UTEXT_PROVIDER_OWNS_TEXT = 0x00000005;
enum UTEXT_MAGIC = 0x345ad82c;
enum USET_IGNORE_SPACE = 0x00000001;
enum USET_CASE_INSENSITIVE = 0x00000002;
enum USET_ADD_CASE_MAPPINGS = 0x00000004;
enum USET_SERIALIZED_STATIC_ARRAY_CAPACITY = 0x00000008;
enum U_PARSE_CONTEXT_LEN = 0x00000010;
enum UIDNA_DEFAULT = 0x00000000;
enum UIDNA_USE_STD3_RULES = 0x00000002;
enum UIDNA_CHECK_BIDI = 0x00000004;
enum UIDNA_CHECK_CONTEXTJ = 0x00000008;
enum UIDNA_NONTRANSITIONAL_TO_ASCII = 0x00000010;
enum UIDNA_NONTRANSITIONAL_TO_UNICODE = 0x00000020;
enum UIDNA_CHECK_CONTEXTO = 0x00000040;
enum UIDNA_ERROR_EMPTY_LABEL = 0x00000001;
enum UIDNA_ERROR_LABEL_TOO_LONG = 0x00000002;
enum UIDNA_ERROR_DOMAIN_NAME_TOO_LONG = 0x00000004;
enum UIDNA_ERROR_LEADING_HYPHEN = 0x00000008;
enum UIDNA_ERROR_TRAILING_HYPHEN = 0x00000010;
enum UIDNA_ERROR_HYPHEN_3_4 = 0x00000020;
enum UIDNA_ERROR_LEADING_COMBINING_MARK = 0x00000040;
enum UIDNA_ERROR_DISALLOWED = 0x00000080;
enum UIDNA_ERROR_PUNYCODE = 0x00000100;
enum UIDNA_ERROR_LABEL_HAS_DOT = 0x00000200;
enum UIDNA_ERROR_INVALID_ACE_LABEL = 0x00000400;
enum UIDNA_ERROR_BIDI = 0x00000800;
enum UIDNA_ERROR_CONTEXTJ = 0x00001000;
enum UIDNA_ERROR_CONTEXTO_PUNCTUATION = 0x00002000;
enum UIDNA_ERROR_CONTEXTO_DIGITS = 0x00004000;
enum ELS_GUID_LANGUAGE_DETECTION = GUID(0xcf7e00b1, 0x909b, 0x4d95, [0xa8, 0xf4, 0x61, 0x1f, 0x7c, 0x37, 0x77, 0x2]);
enum ELS_GUID_SCRIPT_DETECTION = GUID(0x2d64b439, 0x6caf, 0x4f6b, [0xb6, 0x88, 0xe5, 0xd0, 0xf4, 0xfa, 0xa7, 0xd7]);
enum ELS_GUID_TRANSLITERATION_HANT_TO_HANS = GUID(0xa3a8333b, 0xf4fc, 0x42f6, [0xa0, 0xc4, 0x4, 0x62, 0xfe, 0x73, 0x17, 0xcb]);
enum ELS_GUID_TRANSLITERATION_HANS_TO_HANT = GUID(0x3caccdc8, 0x5590, 0x42dc, [0x9a, 0x7b, 0xb5, 0xa6, 0xb5, 0xb3, 0xb6, 0x3b]);
enum ELS_GUID_TRANSLITERATION_MALAYALAM_TO_LATIN = GUID(0xd8b983b1, 0xf8bf, 0x4a2b, [0xbc, 0xd5, 0x5b, 0x5e, 0xa2, 0x6, 0x13, 0xe1]);
enum ELS_GUID_TRANSLITERATION_DEVANAGARI_TO_LATIN = GUID(0xc4a4dcfe, 0x2661, 0x4d02, [0x98, 0x35, 0xf4, 0x81, 0x87, 0x10, 0x98, 0x3]);
enum ELS_GUID_TRANSLITERATION_CYRILLIC_TO_LATIN = GUID(0x3dd12a98, 0x5afd, 0x4903, [0xa1, 0x3f, 0xe1, 0x7e, 0x6c, 0xb, 0xfe, 0x1]);
enum ELS_GUID_TRANSLITERATION_BENGALI_TO_LATIN = GUID(0xf4dfd825, 0x91a4, 0x489f, [0x85, 0x5e, 0x9a, 0xd9, 0xbe, 0xe5, 0x57, 0x27]);
enum ELS_GUID_TRANSLITERATION_HANGUL_DECOMPOSITION = GUID(0x4ba2a721, 0xe43d, 0x41b7, [0xb3, 0x30, 0x53, 0x6a, 0xe1, 0xe4, 0x88, 0x63]);
enum UMSGPAT_ARG_NAME_NOT_NUMBER = 0xffffffffffffffff;
enum UMSGPAT_ARG_NAME_NOT_VALID = 0xfffffffffffffffe;
alias HIMC = void*;
alias HIMCC = void*;
alias HSAVEDUILANGUAGES = void*;
alias UBiDi = long;
alias UBiDiTransform = long;
alias UBreakIterator = long;
alias UCaseMap = long;
alias UCharsetDetector = long;
alias UCharsetMatch = long;
alias UCollationElements = long;
alias UCollator = long;
alias UConstrainedFieldPosition = long;
alias UConverter = long;
alias UConverterSelector = long;
alias UCPMap = long;
alias UDateFormatSymbols = long;
alias UDateIntervalFormat = long;
alias UEnumeration = long;
alias UFieldPositionIterator = long;
alias UFormattedDateInterval = long;
alias UFormattedList = long;
alias UFormattedNumber = long;
alias UFormattedNumberRange = long;
alias UFormattedRelativeDateTime = long;
alias UFormattedValue = long;
alias UGenderInfo = long;
alias UHashtable = long;
alias UIDNA = long;
alias UListFormatter = long;
alias ULocaleData = long;
alias ULocaleDisplayNames = long;
alias UMutableCPTrie = long;
alias UNormalizer2 = long;
alias UNumberFormatter = long;
alias UNumberingSystem = long;
alias UPluralRules = long;
alias URegion = long;
alias URegularExpression = long;
alias URelativeDateTimeFormatter = long;
alias UResourceBundle = long;
alias USearch = long;
alias USet = long;
alias USpoofChecker = long;
alias USpoofCheckResult = long;
alias UStringPrepProfile = long;
alias UStringSearch = long;
struct FONTSIGNATURE
{
    uint[4] fsUsb;
    uint[2] fsCsb;
}
struct CHARSETINFO
{
    uint ciCharset;
    uint ciACP;
    FONTSIGNATURE fs;
}
struct LOCALESIGNATURE
{
    uint[4] lsUsb;
    uint[2] lsCsbDefault;
    uint[2] lsCsbSupported;
}
struct NEWTEXTMETRICEXA
{
    NEWTEXTMETRICA ntmTm;
    FONTSIGNATURE ntmFontSig;
}
struct NEWTEXTMETRICEXW
{
    NEWTEXTMETRICW ntmTm;
    FONTSIGNATURE ntmFontSig;
}
struct ENUMTEXTMETRICA
{
    NEWTEXTMETRICEXA etmNewTextMetricEx;
    AXESLISTA etmAxesList;
}
struct ENUMTEXTMETRICW
{
    NEWTEXTMETRICEXW etmNewTextMetricEx;
    AXESLISTW etmAxesList;
}
struct CPINFO
{
    uint MaxCharSize;
    ubyte[2] DefaultChar;
    ubyte[12] LeadByte;
}
struct CPINFOEXA
{
    uint MaxCharSize;
    ubyte[2] DefaultChar;
    ubyte[12] LeadByte;
    wchar UnicodeDefaultChar;
    uint CodePage;
    CHAR[260] CodePageName;
}
struct CPINFOEXW
{
    uint MaxCharSize;
    ubyte[2] DefaultChar;
    ubyte[12] LeadByte;
    wchar UnicodeDefaultChar;
    uint CodePage;
    wchar[260] CodePageName;
}
struct NUMBERFMTA
{
    uint NumDigits;
    uint LeadingZero;
    uint Grouping;
    PSTR lpDecimalSep;
    PSTR lpThousandSep;
    uint NegativeOrder;
}
struct NUMBERFMTW
{
    uint NumDigits;
    uint LeadingZero;
    uint Grouping;
    PWSTR lpDecimalSep;
    PWSTR lpThousandSep;
    uint NegativeOrder;
}
struct CURRENCYFMTA
{
    uint NumDigits;
    uint LeadingZero;
    uint Grouping;
    PSTR lpDecimalSep;
    PSTR lpThousandSep;
    uint NegativeOrder;
    uint PositiveOrder;
    PSTR lpCurrencySymbol;
}
struct CURRENCYFMTW
{
    uint NumDigits;
    uint LeadingZero;
    uint Grouping;
    PWSTR lpDecimalSep;
    PWSTR lpThousandSep;
    uint NegativeOrder;
    uint PositiveOrder;
    PWSTR lpCurrencySymbol;
}
alias SYSNLS_FUNCTION = int;
enum : int
{
    COMPARE_STRING = 0x00000001,
}

struct NLSVERSIONINFO
{
    uint dwNLSVersionInfoSize;
    uint dwNLSVersion;
    uint dwDefinedVersion;
    uint dwEffectiveId;
    GUID guidCustomVersion;
}
struct NLSVERSIONINFOEX
{
    uint dwNLSVersionInfoSize;
    uint dwNLSVersion;
    uint dwDefinedVersion;
    uint dwEffectiveId;
    GUID guidCustomVersion;
}
alias SYSGEOTYPE = int;
enum : int
{
    GEO_NATION            = 0x00000001,
    GEO_LATITUDE          = 0x00000002,
    GEO_LONGITUDE         = 0x00000003,
    GEO_ISO2              = 0x00000004,
    GEO_ISO3              = 0x00000005,
    GEO_RFC1766           = 0x00000006,
    GEO_LCID              = 0x00000007,
    GEO_FRIENDLYNAME      = 0x00000008,
    GEO_OFFICIALNAME      = 0x00000009,
    GEO_TIMEZONES         = 0x0000000a,
    GEO_OFFICIALLANGUAGES = 0x0000000b,
    GEO_ISO_UN_NUMBER     = 0x0000000c,
    GEO_PARENT            = 0x0000000d,
    GEO_DIALINGCODE       = 0x0000000e,
    GEO_CURRENCYCODE      = 0x0000000f,
    GEO_CURRENCYSYMBOL    = 0x00000010,
    GEO_NAME              = 0x00000011,
    GEO_ID                = 0x00000012,
}

alias SYSGEOCLASS = int;
enum : int
{
    GEOCLASS_NATION = 0x00000010,
    GEOCLASS_REGION = 0x0000000e,
    GEOCLASS_ALL    = 0x00000000,
}

alias LOCALE_ENUMPROCA = BOOL function(PSTR);
alias LOCALE_ENUMPROCW = BOOL function(PWSTR);
alias NORM_FORM = int;
enum : int
{
    NormalizationOther = 0x00000000,
    NormalizationC     = 0x00000001,
    NormalizationD     = 0x00000002,
    NormalizationKC    = 0x00000005,
    NormalizationKD    = 0x00000006,
}

alias LANGUAGEGROUP_ENUMPROCA = BOOL function(uint, PSTR, PSTR, uint, long);
alias LANGGROUPLOCALE_ENUMPROCA = BOOL function(uint, uint, PSTR, long);
alias UILANGUAGE_ENUMPROCA = BOOL function(PSTR, long);
alias CODEPAGE_ENUMPROCA = BOOL function(PSTR);
alias DATEFMT_ENUMPROCA = BOOL function(PSTR);
alias DATEFMT_ENUMPROCEXA = BOOL function(PSTR, uint);
alias TIMEFMT_ENUMPROCA = BOOL function(PSTR);
alias CALINFO_ENUMPROCA = BOOL function(PSTR);
alias CALINFO_ENUMPROCEXA = BOOL function(PSTR, uint);
alias LANGUAGEGROUP_ENUMPROCW = BOOL function(uint, PWSTR, PWSTR, uint, long);
alias LANGGROUPLOCALE_ENUMPROCW = BOOL function(uint, uint, PWSTR, long);
alias UILANGUAGE_ENUMPROCW = BOOL function(PWSTR, long);
alias CODEPAGE_ENUMPROCW = BOOL function(PWSTR);
alias DATEFMT_ENUMPROCW = BOOL function(PWSTR);
alias DATEFMT_ENUMPROCEXW = BOOL function(PWSTR, uint);
alias TIMEFMT_ENUMPROCW = BOOL function(PWSTR);
alias CALINFO_ENUMPROCW = BOOL function(PWSTR);
alias CALINFO_ENUMPROCEXW = BOOL function(PWSTR, uint);
alias GEO_ENUMPROC = BOOL function(int);
alias GEO_ENUMNAMEPROC = BOOL function(PWSTR, LPARAM);
struct FILEMUIINFO
{
    uint dwSize;
    uint dwVersion;
    uint dwFileType;
    ubyte[16] pChecksum;
    ubyte[16] pServiceChecksum;
    uint dwLanguageNameOffset;
    uint dwTypeIDMainSize;
    uint dwTypeIDMainOffset;
    uint dwTypeNameMainOffset;
    uint dwTypeIDMUISize;
    uint dwTypeIDMUIOffset;
    uint dwTypeNameMUIOffset;
    ubyte[8] abBuffer;
}
alias CALINFO_ENUMPROCEXEX = BOOL function(PWSTR, uint, PWSTR, LPARAM);
alias DATEFMT_ENUMPROCEXEX = BOOL function(PWSTR, uint, LPARAM);
alias TIMEFMT_ENUMPROCEX = BOOL function(PWSTR, LPARAM);
alias LOCALE_ENUMPROCEX = BOOL function(PWSTR, uint, LPARAM);
alias PFN_MAPPINGCALLBACKPROC = void function(MAPPING_PROPERTY_BAG*, void*, uint, HRESULT);
struct MAPPING_SERVICE_INFO
{
    ulong Size;
    PWSTR pszCopyright;
    ushort wMajorVersion;
    ushort wMinorVersion;
    ushort wBuildVersion;
    ushort wStepVersion;
    uint dwInputContentTypesCount;
    PWSTR* prgInputContentTypes;
    uint dwOutputContentTypesCount;
    PWSTR* prgOutputContentTypes;
    uint dwInputLanguagesCount;
    PWSTR* prgInputLanguages;
    uint dwOutputLanguagesCount;
    PWSTR* prgOutputLanguages;
    uint dwInputScriptsCount;
    PWSTR* prgInputScripts;
    uint dwOutputScriptsCount;
    PWSTR* prgOutputScripts;
    GUID guid;
    PWSTR pszCategory;
    PWSTR pszDescription;
    uint dwPrivateDataSize;
    void* pPrivateData;
    void* pContext;
    uint _bitfield0;
}
struct MAPPING_ENUM_OPTIONS
{
    ulong Size;
    PWSTR pszCategory;
    PWSTR pszInputLanguage;
    PWSTR pszOutputLanguage;
    PWSTR pszInputScript;
    PWSTR pszOutputScript;
    PWSTR pszInputContentType;
    PWSTR pszOutputContentType;
    GUID* pGuid;
    uint _bitfield0;
}
struct MAPPING_OPTIONS
{
    ulong Size;
    PWSTR pszInputLanguage;
    PWSTR pszOutputLanguage;
    PWSTR pszInputScript;
    PWSTR pszOutputScript;
    PWSTR pszInputContentType;
    PWSTR pszOutputContentType;
    PWSTR pszUILanguage;
    PFN_MAPPINGCALLBACKPROC pfnRecognizeCallback;
    void* pRecognizeCallerData;
    uint dwRecognizeCallerDataSize;
    PFN_MAPPINGCALLBACKPROC pfnActionCallback;
    void* pActionCallerData;
    uint dwActionCallerDataSize;
    uint dwServiceFlag;
    uint _bitfield0;
}
struct MAPPING_DATA_RANGE
{
    uint dwStartIndex;
    uint dwEndIndex;
    PWSTR pszDescription;
    uint dwDescriptionLength;
    void* pData;
    uint dwDataSize;
    PWSTR pszContentType;
    PWSTR* prgActionIds;
    uint dwActionsCount;
    PWSTR* prgActionDisplayNames;
}
struct MAPPING_PROPERTY_BAG
{
    ulong Size;
    MAPPING_DATA_RANGE* prgResultRanges;
    uint dwRangesCount;
    void* pServiceData;
    uint dwServiceDataSize;
    void* pCallerData;
    uint dwCallerDataSize;
    void* pContext;
}
alias WORDLIST_TYPE = int;
enum : int
{
    WORDLIST_TYPE_IGNORE      = 0x00000000,
    WORDLIST_TYPE_ADD         = 0x00000001,
    WORDLIST_TYPE_EXCLUDE     = 0x00000002,
    WORDLIST_TYPE_AUTOCORRECT = 0x00000003,
}

alias CORRECTIVE_ACTION = int;
enum : int
{
    CORRECTIVE_ACTION_NONE            = 0x00000000,
    CORRECTIVE_ACTION_GET_SUGGESTIONS = 0x00000001,
    CORRECTIVE_ACTION_REPLACE         = 0x00000002,
    CORRECTIVE_ACTION_DELETE          = 0x00000003,
}

enum IID_ISpellingError = GUID(0xb7c82d61, 0xfbe8, 0x4b47, [0x9b, 0x27, 0x6c, 0xd, 0x2e, 0xd, 0xe0, 0xa3]);
interface ISpellingError : IUnknown
{
    HRESULT get_StartIndex(uint*);
    HRESULT get_Length(uint*);
    HRESULT get_CorrectiveAction(CORRECTIVE_ACTION*);
    HRESULT get_Replacement(PWSTR*);
}
enum IID_IEnumSpellingError = GUID(0x803e3bd4, 0x2828, 0x4410, [0x82, 0x90, 0x41, 0x8d, 0x1d, 0x73, 0xc7, 0x62]);
interface IEnumSpellingError : IUnknown
{
    HRESULT Next(ISpellingError*);
}
enum IID_IOptionDescription = GUID(0x432e5f85, 0x35cf, 0x4606, [0xa8, 0x1, 0x6f, 0x70, 0x27, 0x7e, 0x1d, 0x7a]);
interface IOptionDescription : IUnknown
{
    HRESULT get_Id(PWSTR*);
    HRESULT get_Heading(PWSTR*);
    HRESULT get_Description(PWSTR*);
    HRESULT get_Labels(IEnumString*);
}
enum IID_ISpellCheckerChangedEventHandler = GUID(0xb83a5b0, 0x792f, 0x4eab, [0x97, 0x99, 0xac, 0xf5, 0x2c, 0x5e, 0xd0, 0x8a]);
interface ISpellCheckerChangedEventHandler : IUnknown
{
    HRESULT Invoke(ISpellChecker);
}
enum IID_ISpellChecker = GUID(0xb6fd0b71, 0xe2bc, 0x4653, [0x8d, 0x5, 0xf1, 0x97, 0xe4, 0x12, 0x77, 0xb]);
interface ISpellChecker : IUnknown
{
    HRESULT get_LanguageTag(PWSTR*);
    HRESULT Check(const(wchar)*, IEnumSpellingError*);
    HRESULT Suggest(const(wchar)*, IEnumString*);
    HRESULT Add(const(wchar)*);
    HRESULT Ignore(const(wchar)*);
    HRESULT AutoCorrect(const(wchar)*, const(wchar)*);
    HRESULT GetOptionValue(const(wchar)*, ubyte*);
    HRESULT get_OptionIds(IEnumString*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_LocalizedName(PWSTR*);
    HRESULT add_SpellCheckerChanged(ISpellCheckerChangedEventHandler, uint*);
    HRESULT remove_SpellCheckerChanged(uint);
    HRESULT GetOptionDescription(const(wchar)*, IOptionDescription*);
    HRESULT ComprehensiveCheck(const(wchar)*, IEnumSpellingError*);
}
enum IID_ISpellChecker2 = GUID(0xe7ed1c71, 0x87f7, 0x4378, [0xa8, 0x40, 0xc9, 0x20, 0xd, 0xac, 0xee, 0x47]);
interface ISpellChecker2 : ISpellChecker
{
    HRESULT Remove(const(wchar)*);
}
enum IID_ISpellCheckerFactory = GUID(0x8e018a9d, 0x2415, 0x4677, [0xbf, 0x8, 0x79, 0x4e, 0xa6, 0x1f, 0x94, 0xbb]);
interface ISpellCheckerFactory : IUnknown
{
    HRESULT get_SupportedLanguages(IEnumString*);
    HRESULT IsSupported(const(wchar)*, BOOL*);
    HRESULT CreateSpellChecker(const(wchar)*, ISpellChecker*);
}
enum IID_IUserDictionariesRegistrar = GUID(0xaa176b85, 0xe12, 0x4844, [0x8e, 0x1a, 0xee, 0xf1, 0xda, 0x77, 0xf5, 0x86]);
interface IUserDictionariesRegistrar : IUnknown
{
    HRESULT RegisterUserDictionary(const(wchar)*, const(wchar)*);
    HRESULT UnregisterUserDictionary(const(wchar)*, const(wchar)*);
}
enum CLSID_SpellCheckerFactory = GUID(0x7ab36653, 0x1796, 0x484b, [0xbd, 0xfa, 0xe7, 0x4f, 0x1d, 0xb7, 0xc1, 0xdc]);
struct SpellCheckerFactory
{
}
enum IID_ISpellCheckProvider = GUID(0x73e976e0, 0x8ed4, 0x4eb1, [0x80, 0xd7, 0x1b, 0xe0, 0xa1, 0x6b, 0xc, 0x38]);
interface ISpellCheckProvider : IUnknown
{
    HRESULT get_LanguageTag(PWSTR*);
    HRESULT Check(const(wchar)*, IEnumSpellingError*);
    HRESULT Suggest(const(wchar)*, IEnumString*);
    HRESULT GetOptionValue(const(wchar)*, ubyte*);
    HRESULT SetOptionValue(const(wchar)*, ubyte);
    HRESULT get_OptionIds(IEnumString*);
    HRESULT get_Id(PWSTR*);
    HRESULT get_LocalizedName(PWSTR*);
    HRESULT GetOptionDescription(const(wchar)*, IOptionDescription*);
    HRESULT InitializeWordlist(WORDLIST_TYPE, IEnumString);
}
enum IID_IComprehensiveSpellCheckProvider = GUID(0xc58f8de, 0x8e94, 0x479e, [0x97, 0x17, 0x70, 0xc4, 0x2c, 0x4a, 0xd2, 0xc3]);
interface IComprehensiveSpellCheckProvider : IUnknown
{
    HRESULT ComprehensiveCheck(const(wchar)*, IEnumSpellingError*);
}
enum IID_ISpellCheckProviderFactory = GUID(0x9f671e11, 0x77d6, 0x4c92, [0xae, 0xfb, 0x61, 0x52, 0x15, 0xe3, 0xa4, 0xbe]);
interface ISpellCheckProviderFactory : IUnknown
{
    HRESULT get_SupportedLanguages(IEnumString*);
    HRESULT IsSupported(const(wchar)*, BOOL*);
    HRESULT CreateSpellCheckProvider(const(wchar)*, ISpellCheckProvider*);
}
struct SCRIPT_CONTROL
{
    uint _bitfield0;
}
struct SCRIPT_STATE
{
    ushort _bitfield0;
}
struct SCRIPT_ANALYSIS
{
    ushort _bitfield0;
    SCRIPT_STATE s;
}
struct SCRIPT_ITEM
{
    int iCharPos;
    SCRIPT_ANALYSIS a;
}
alias SCRIPT_JUSTIFY = int;
enum : int
{
    SCRIPT_JUSTIFY_NONE           = 0x00000000,
    SCRIPT_JUSTIFY_ARABIC_BLANK   = 0x00000001,
    SCRIPT_JUSTIFY_CHARACTER      = 0x00000002,
    SCRIPT_JUSTIFY_RESERVED1      = 0x00000003,
    SCRIPT_JUSTIFY_BLANK          = 0x00000004,
    SCRIPT_JUSTIFY_RESERVED2      = 0x00000005,
    SCRIPT_JUSTIFY_RESERVED3      = 0x00000006,
    SCRIPT_JUSTIFY_ARABIC_NORMAL  = 0x00000007,
    SCRIPT_JUSTIFY_ARABIC_KASHIDA = 0x00000008,
    SCRIPT_JUSTIFY_ARABIC_ALEF    = 0x00000009,
    SCRIPT_JUSTIFY_ARABIC_HA      = 0x0000000a,
    SCRIPT_JUSTIFY_ARABIC_RA      = 0x0000000b,
    SCRIPT_JUSTIFY_ARABIC_BA      = 0x0000000c,
    SCRIPT_JUSTIFY_ARABIC_BARA    = 0x0000000d,
    SCRIPT_JUSTIFY_ARABIC_SEEN    = 0x0000000e,
    SCRIPT_JUSTIFY_ARABIC_SEEN_M  = 0x0000000f,
}

struct SCRIPT_VISATTR
{
    ushort _bitfield0;
}
struct GOFFSET
{
    int du;
    int dv;
}
struct SCRIPT_LOGATTR
{
    ubyte _bitfield0;
}
struct SCRIPT_PROPERTIES
{
    uint _bitfield1;
    uint _bitfield2;
}
struct SCRIPT_FONTPROPERTIES
{
    int cBytes;
    ushort wgBlank;
    ushort wgDefault;
    ushort wgInvalid;
    ushort wgKashida;
    int iKashidaWidth;
}
struct SCRIPT_TABDEF
{
    int cTabStops;
    int iScale;
    int* pTabStops;
    int iTabOrigin;
}
struct SCRIPT_DIGITSUBSTITUTE
{
    uint _bitfield1;
    uint _bitfield2;
    uint dwReserved;
}
struct OPENTYPE_FEATURE_RECORD
{
    uint tagFeature;
    int lParameter;
}
struct TEXTRANGE_PROPERTIES
{
    OPENTYPE_FEATURE_RECORD* potfRecords;
    int cotfRecords;
}
struct SCRIPT_CHARPROP
{
    ushort _bitfield0;
}
struct SCRIPT_GLYPHPROP
{
    SCRIPT_VISATTR sva;
    ushort reserved;
}
alias UErrorCode = int;
enum : int
{
    U_USING_FALLBACK_WARNING           = 0xffffff80,
    U_ERROR_WARNING_START              = 0xffffff80,
    U_USING_DEFAULT_WARNING            = 0xffffff81,
    U_SAFECLONE_ALLOCATED_WARNING      = 0xffffff82,
    U_STATE_OLD_WARNING                = 0xffffff83,
    U_STRING_NOT_TERMINATED_WARNING    = 0xffffff84,
    U_SORT_KEY_TOO_SHORT_WARNING       = 0xffffff85,
    U_AMBIGUOUS_ALIAS_WARNING          = 0xffffff86,
    U_DIFFERENT_UCA_VERSION            = 0xffffff87,
    U_PLUGIN_CHANGED_LEVEL_WARNING     = 0xffffff88,
    U_ZERO_ERROR                       = 0x00000000,
    U_ILLEGAL_ARGUMENT_ERROR           = 0x00000001,
    U_MISSING_RESOURCE_ERROR           = 0x00000002,
    U_INVALID_FORMAT_ERROR             = 0x00000003,
    U_FILE_ACCESS_ERROR                = 0x00000004,
    U_INTERNAL_PROGRAM_ERROR           = 0x00000005,
    U_MESSAGE_PARSE_ERROR              = 0x00000006,
    U_MEMORY_ALLOCATION_ERROR          = 0x00000007,
    U_INDEX_OUTOFBOUNDS_ERROR          = 0x00000008,
    U_PARSE_ERROR                      = 0x00000009,
    U_INVALID_CHAR_FOUND               = 0x0000000a,
    U_TRUNCATED_CHAR_FOUND             = 0x0000000b,
    U_ILLEGAL_CHAR_FOUND               = 0x0000000c,
    U_INVALID_TABLE_FORMAT             = 0x0000000d,
    U_INVALID_TABLE_FILE               = 0x0000000e,
    U_BUFFER_OVERFLOW_ERROR            = 0x0000000f,
    U_UNSUPPORTED_ERROR                = 0x00000010,
    U_RESOURCE_TYPE_MISMATCH           = 0x00000011,
    U_ILLEGAL_ESCAPE_SEQUENCE          = 0x00000012,
    U_UNSUPPORTED_ESCAPE_SEQUENCE      = 0x00000013,
    U_NO_SPACE_AVAILABLE               = 0x00000014,
    U_CE_NOT_FOUND_ERROR               = 0x00000015,
    U_PRIMARY_TOO_LONG_ERROR           = 0x00000016,
    U_STATE_TOO_OLD_ERROR              = 0x00000017,
    U_TOO_MANY_ALIASES_ERROR           = 0x00000018,
    U_ENUM_OUT_OF_SYNC_ERROR           = 0x00000019,
    U_INVARIANT_CONVERSION_ERROR       = 0x0000001a,
    U_INVALID_STATE_ERROR              = 0x0000001b,
    U_COLLATOR_VERSION_MISMATCH        = 0x0000001c,
    U_USELESS_COLLATOR_ERROR           = 0x0000001d,
    U_NO_WRITE_PERMISSION              = 0x0000001e,
    U_BAD_VARIABLE_DEFINITION          = 0x00010000,
    U_PARSE_ERROR_START                = 0x00010000,
    U_MALFORMED_RULE                   = 0x00010001,
    U_MALFORMED_SET                    = 0x00010002,
    U_MALFORMED_SYMBOL_REFERENCE       = 0x00010003,
    U_MALFORMED_UNICODE_ESCAPE         = 0x00010004,
    U_MALFORMED_VARIABLE_DEFINITION    = 0x00010005,
    U_MALFORMED_VARIABLE_REFERENCE     = 0x00010006,
    U_MISMATCHED_SEGMENT_DELIMITERS    = 0x00010007,
    U_MISPLACED_ANCHOR_START           = 0x00010008,
    U_MISPLACED_CURSOR_OFFSET          = 0x00010009,
    U_MISPLACED_QUANTIFIER             = 0x0001000a,
    U_MISSING_OPERATOR                 = 0x0001000b,
    U_MISSING_SEGMENT_CLOSE            = 0x0001000c,
    U_MULTIPLE_ANTE_CONTEXTS           = 0x0001000d,
    U_MULTIPLE_CURSORS                 = 0x0001000e,
    U_MULTIPLE_POST_CONTEXTS           = 0x0001000f,
    U_TRAILING_BACKSLASH               = 0x00010010,
    U_UNDEFINED_SEGMENT_REFERENCE      = 0x00010011,
    U_UNDEFINED_VARIABLE               = 0x00010012,
    U_UNQUOTED_SPECIAL                 = 0x00010013,
    U_UNTERMINATED_QUOTE               = 0x00010014,
    U_RULE_MASK_ERROR                  = 0x00010015,
    U_MISPLACED_COMPOUND_FILTER        = 0x00010016,
    U_MULTIPLE_COMPOUND_FILTERS        = 0x00010017,
    U_INVALID_RBT_SYNTAX               = 0x00010018,
    U_INVALID_PROPERTY_PATTERN         = 0x00010019,
    U_MALFORMED_PRAGMA                 = 0x0001001a,
    U_UNCLOSED_SEGMENT                 = 0x0001001b,
    U_ILLEGAL_CHAR_IN_SEGMENT          = 0x0001001c,
    U_VARIABLE_RANGE_EXHAUSTED         = 0x0001001d,
    U_VARIABLE_RANGE_OVERLAP           = 0x0001001e,
    U_ILLEGAL_CHARACTER                = 0x0001001f,
    U_INTERNAL_TRANSLITERATOR_ERROR    = 0x00010020,
    U_INVALID_ID                       = 0x00010021,
    U_INVALID_FUNCTION                 = 0x00010022,
    U_UNEXPECTED_TOKEN                 = 0x00010100,
    U_FMT_PARSE_ERROR_START            = 0x00010100,
    U_MULTIPLE_DECIMAL_SEPARATORS      = 0x00010101,
    U_MULTIPLE_DECIMAL_SEPERATORS      = 0x00010101,
    U_MULTIPLE_EXPONENTIAL_SYMBOLS     = 0x00010102,
    U_MALFORMED_EXPONENTIAL_PATTERN    = 0x00010103,
    U_MULTIPLE_PERCENT_SYMBOLS         = 0x00010104,
    U_MULTIPLE_PERMILL_SYMBOLS         = 0x00010105,
    U_MULTIPLE_PAD_SPECIFIERS          = 0x00010106,
    U_PATTERN_SYNTAX_ERROR             = 0x00010107,
    U_ILLEGAL_PAD_POSITION             = 0x00010108,
    U_UNMATCHED_BRACES                 = 0x00010109,
    U_UNSUPPORTED_PROPERTY             = 0x0001010a,
    U_UNSUPPORTED_ATTRIBUTE            = 0x0001010b,
    U_ARGUMENT_TYPE_MISMATCH           = 0x0001010c,
    U_DUPLICATE_KEYWORD                = 0x0001010d,
    U_UNDEFINED_KEYWORD                = 0x0001010e,
    U_DEFAULT_KEYWORD_MISSING          = 0x0001010f,
    U_DECIMAL_NUMBER_SYNTAX_ERROR      = 0x00010110,
    U_FORMAT_INEXACT_ERROR             = 0x00010111,
    U_NUMBER_ARG_OUTOFBOUNDS_ERROR     = 0x00010112,
    U_NUMBER_SKELETON_SYNTAX_ERROR     = 0x00010113,
    U_BRK_INTERNAL_ERROR               = 0x00010200,
    U_BRK_ERROR_START                  = 0x00010200,
    U_BRK_HEX_DIGITS_EXPECTED          = 0x00010201,
    U_BRK_SEMICOLON_EXPECTED           = 0x00010202,
    U_BRK_RULE_SYNTAX                  = 0x00010203,
    U_BRK_UNCLOSED_SET                 = 0x00010204,
    U_BRK_ASSIGN_ERROR                 = 0x00010205,
    U_BRK_VARIABLE_REDFINITION         = 0x00010206,
    U_BRK_MISMATCHED_PAREN             = 0x00010207,
    U_BRK_NEW_LINE_IN_QUOTED_STRING    = 0x00010208,
    U_BRK_UNDEFINED_VARIABLE           = 0x00010209,
    U_BRK_INIT_ERROR                   = 0x0001020a,
    U_BRK_RULE_EMPTY_SET               = 0x0001020b,
    U_BRK_UNRECOGNIZED_OPTION          = 0x0001020c,
    U_BRK_MALFORMED_RULE_TAG           = 0x0001020d,
    U_REGEX_INTERNAL_ERROR             = 0x00010300,
    U_REGEX_ERROR_START                = 0x00010300,
    U_REGEX_RULE_SYNTAX                = 0x00010301,
    U_REGEX_INVALID_STATE              = 0x00010302,
    U_REGEX_BAD_ESCAPE_SEQUENCE        = 0x00010303,
    U_REGEX_PROPERTY_SYNTAX            = 0x00010304,
    U_REGEX_UNIMPLEMENTED              = 0x00010305,
    U_REGEX_MISMATCHED_PAREN           = 0x00010306,
    U_REGEX_NUMBER_TOO_BIG             = 0x00010307,
    U_REGEX_BAD_INTERVAL               = 0x00010308,
    U_REGEX_MAX_LT_MIN                 = 0x00010309,
    U_REGEX_INVALID_BACK_REF           = 0x0001030a,
    U_REGEX_INVALID_FLAG               = 0x0001030b,
    U_REGEX_LOOK_BEHIND_LIMIT          = 0x0001030c,
    U_REGEX_SET_CONTAINS_STRING        = 0x0001030d,
    U_REGEX_MISSING_CLOSE_BRACKET      = 0x0001030f,
    U_REGEX_INVALID_RANGE              = 0x00010310,
    U_REGEX_STACK_OVERFLOW             = 0x00010311,
    U_REGEX_TIME_OUT                   = 0x00010312,
    U_REGEX_STOPPED_BY_CALLER          = 0x00010313,
    U_REGEX_PATTERN_TOO_BIG            = 0x00010314,
    U_REGEX_INVALID_CAPTURE_GROUP_NAME = 0x00010315,
    U_IDNA_PROHIBITED_ERROR            = 0x00010400,
    U_IDNA_ERROR_START                 = 0x00010400,
    U_IDNA_UNASSIGNED_ERROR            = 0x00010401,
    U_IDNA_CHECK_BIDI_ERROR            = 0x00010402,
    U_IDNA_STD3_ASCII_RULES_ERROR      = 0x00010403,
    U_IDNA_ACE_PREFIX_ERROR            = 0x00010404,
    U_IDNA_VERIFICATION_ERROR          = 0x00010405,
    U_IDNA_LABEL_TOO_LONG_ERROR        = 0x00010406,
    U_IDNA_ZERO_LENGTH_LABEL_ERROR     = 0x00010407,
    U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR  = 0x00010408,
    U_STRINGPREP_PROHIBITED_ERROR      = 0x00010400,
    U_STRINGPREP_UNASSIGNED_ERROR      = 0x00010401,
    U_STRINGPREP_CHECK_BIDI_ERROR      = 0x00010402,
    U_PLUGIN_ERROR_START               = 0x00010500,
    U_PLUGIN_TOO_HIGH                  = 0x00010500,
    U_PLUGIN_DIDNT_SET_LEVEL           = 0x00010501,
}

alias UTraceLevel = int;
enum : int
{
    UTRACE_OFF        = 0xffffffff,
    UTRACE_ERROR      = 0x00000000,
    UTRACE_WARNING    = 0x00000003,
    UTRACE_OPEN_CLOSE = 0x00000005,
    UTRACE_INFO       = 0x00000007,
    UTRACE_VERBOSE    = 0x00000009,
}

alias UTraceFunctionNumber = int;
enum : int
{
    UTRACE_FUNCTION_START              = 0x00000000,
    UTRACE_U_INIT                      = 0x00000000,
    UTRACE_U_CLEANUP                   = 0x00000001,
    UTRACE_CONVERSION_START            = 0x00001000,
    UTRACE_UCNV_OPEN                   = 0x00001000,
    UTRACE_UCNV_OPEN_PACKAGE           = 0x00001001,
    UTRACE_UCNV_OPEN_ALGORITHMIC       = 0x00001002,
    UTRACE_UCNV_CLONE                  = 0x00001003,
    UTRACE_UCNV_CLOSE                  = 0x00001004,
    UTRACE_UCNV_FLUSH_CACHE            = 0x00001005,
    UTRACE_UCNV_LOAD                   = 0x00001006,
    UTRACE_UCNV_UNLOAD                 = 0x00001007,
    UTRACE_COLLATION_START             = 0x00002000,
    UTRACE_UCOL_OPEN                   = 0x00002000,
    UTRACE_UCOL_CLOSE                  = 0x00002001,
    UTRACE_UCOL_STRCOLL                = 0x00002002,
    UTRACE_UCOL_GET_SORTKEY            = 0x00002003,
    UTRACE_UCOL_GETLOCALE              = 0x00002004,
    UTRACE_UCOL_NEXTSORTKEYPART        = 0x00002005,
    UTRACE_UCOL_STRCOLLITER            = 0x00002006,
    UTRACE_UCOL_OPEN_FROM_SHORT_STRING = 0x00002007,
    UTRACE_UCOL_STRCOLLUTF8            = 0x00002008,
    UTRACE_UDATA_START                 = 0x00003000,
    UTRACE_UDATA_RESOURCE              = 0x00003000,
    UTRACE_UDATA_BUNDLE                = 0x00003001,
    UTRACE_UDATA_DATA_FILE             = 0x00003002,
    UTRACE_UDATA_RES_FILE              = 0x00003003,
}

alias UTraceEntry = void function(const(void)*, int);
alias UTraceExit = void function(const(void)*, int, const(char)*, byte*);
alias UTraceData = void function(const(void)*, int, int, const(char)*, byte*);
alias UStringTrieResult = int;
enum : int
{
    USTRINGTRIE_NO_MATCH           = 0x00000000,
    USTRINGTRIE_NO_VALUE           = 0x00000001,
    USTRINGTRIE_FINAL_VALUE        = 0x00000002,
    USTRINGTRIE_INTERMEDIATE_VALUE = 0x00000003,
}

alias UScriptCode = int;
enum : int
{
    USCRIPT_INVALID_CODE                 = 0xffffffff,
    USCRIPT_COMMON                       = 0x00000000,
    USCRIPT_INHERITED                    = 0x00000001,
    USCRIPT_ARABIC                       = 0x00000002,
    USCRIPT_ARMENIAN                     = 0x00000003,
    USCRIPT_BENGALI                      = 0x00000004,
    USCRIPT_BOPOMOFO                     = 0x00000005,
    USCRIPT_CHEROKEE                     = 0x00000006,
    USCRIPT_COPTIC                       = 0x00000007,
    USCRIPT_CYRILLIC                     = 0x00000008,
    USCRIPT_DESERET                      = 0x00000009,
    USCRIPT_DEVANAGARI                   = 0x0000000a,
    USCRIPT_ETHIOPIC                     = 0x0000000b,
    USCRIPT_GEORGIAN                     = 0x0000000c,
    USCRIPT_GOTHIC                       = 0x0000000d,
    USCRIPT_GREEK                        = 0x0000000e,
    USCRIPT_GUJARATI                     = 0x0000000f,
    USCRIPT_GURMUKHI                     = 0x00000010,
    USCRIPT_HAN                          = 0x00000011,
    USCRIPT_HANGUL                       = 0x00000012,
    USCRIPT_HEBREW                       = 0x00000013,
    USCRIPT_HIRAGANA                     = 0x00000014,
    USCRIPT_KANNADA                      = 0x00000015,
    USCRIPT_KATAKANA                     = 0x00000016,
    USCRIPT_KHMER                        = 0x00000017,
    USCRIPT_LAO                          = 0x00000018,
    USCRIPT_LATIN                        = 0x00000019,
    USCRIPT_MALAYALAM                    = 0x0000001a,
    USCRIPT_MONGOLIAN                    = 0x0000001b,
    USCRIPT_MYANMAR                      = 0x0000001c,
    USCRIPT_OGHAM                        = 0x0000001d,
    USCRIPT_OLD_ITALIC                   = 0x0000001e,
    USCRIPT_ORIYA                        = 0x0000001f,
    USCRIPT_RUNIC                        = 0x00000020,
    USCRIPT_SINHALA                      = 0x00000021,
    USCRIPT_SYRIAC                       = 0x00000022,
    USCRIPT_TAMIL                        = 0x00000023,
    USCRIPT_TELUGU                       = 0x00000024,
    USCRIPT_THAANA                       = 0x00000025,
    USCRIPT_THAI                         = 0x00000026,
    USCRIPT_TIBETAN                      = 0x00000027,
    USCRIPT_CANADIAN_ABORIGINAL          = 0x00000028,
    USCRIPT_UCAS                         = 0x00000028,
    USCRIPT_YI                           = 0x00000029,
    USCRIPT_TAGALOG                      = 0x0000002a,
    USCRIPT_HANUNOO                      = 0x0000002b,
    USCRIPT_BUHID                        = 0x0000002c,
    USCRIPT_TAGBANWA                     = 0x0000002d,
    USCRIPT_BRAILLE                      = 0x0000002e,
    USCRIPT_CYPRIOT                      = 0x0000002f,
    USCRIPT_LIMBU                        = 0x00000030,
    USCRIPT_LINEAR_B                     = 0x00000031,
    USCRIPT_OSMANYA                      = 0x00000032,
    USCRIPT_SHAVIAN                      = 0x00000033,
    USCRIPT_TAI_LE                       = 0x00000034,
    USCRIPT_UGARITIC                     = 0x00000035,
    USCRIPT_KATAKANA_OR_HIRAGANA         = 0x00000036,
    USCRIPT_BUGINESE                     = 0x00000037,
    USCRIPT_GLAGOLITIC                   = 0x00000038,
    USCRIPT_KHAROSHTHI                   = 0x00000039,
    USCRIPT_SYLOTI_NAGRI                 = 0x0000003a,
    USCRIPT_NEW_TAI_LUE                  = 0x0000003b,
    USCRIPT_TIFINAGH                     = 0x0000003c,
    USCRIPT_OLD_PERSIAN                  = 0x0000003d,
    USCRIPT_BALINESE                     = 0x0000003e,
    USCRIPT_BATAK                        = 0x0000003f,
    USCRIPT_BLISSYMBOLS                  = 0x00000040,
    USCRIPT_BRAHMI                       = 0x00000041,
    USCRIPT_CHAM                         = 0x00000042,
    USCRIPT_CIRTH                        = 0x00000043,
    USCRIPT_OLD_CHURCH_SLAVONIC_CYRILLIC = 0x00000044,
    USCRIPT_DEMOTIC_EGYPTIAN             = 0x00000045,
    USCRIPT_HIERATIC_EGYPTIAN            = 0x00000046,
    USCRIPT_EGYPTIAN_HIEROGLYPHS         = 0x00000047,
    USCRIPT_KHUTSURI                     = 0x00000048,
    USCRIPT_SIMPLIFIED_HAN               = 0x00000049,
    USCRIPT_TRADITIONAL_HAN              = 0x0000004a,
    USCRIPT_PAHAWH_HMONG                 = 0x0000004b,
    USCRIPT_OLD_HUNGARIAN                = 0x0000004c,
    USCRIPT_HARAPPAN_INDUS               = 0x0000004d,
    USCRIPT_JAVANESE                     = 0x0000004e,
    USCRIPT_KAYAH_LI                     = 0x0000004f,
    USCRIPT_LATIN_FRAKTUR                = 0x00000050,
    USCRIPT_LATIN_GAELIC                 = 0x00000051,
    USCRIPT_LEPCHA                       = 0x00000052,
    USCRIPT_LINEAR_A                     = 0x00000053,
    USCRIPT_MANDAIC                      = 0x00000054,
    USCRIPT_MANDAEAN                     = 0x00000054,
    USCRIPT_MAYAN_HIEROGLYPHS            = 0x00000055,
    USCRIPT_MEROITIC_HIEROGLYPHS         = 0x00000056,
    USCRIPT_MEROITIC                     = 0x00000056,
    USCRIPT_NKO                          = 0x00000057,
    USCRIPT_ORKHON                       = 0x00000058,
    USCRIPT_OLD_PERMIC                   = 0x00000059,
    USCRIPT_PHAGS_PA                     = 0x0000005a,
    USCRIPT_PHOENICIAN                   = 0x0000005b,
    USCRIPT_MIAO                         = 0x0000005c,
    USCRIPT_PHONETIC_POLLARD             = 0x0000005c,
    USCRIPT_RONGORONGO                   = 0x0000005d,
    USCRIPT_SARATI                       = 0x0000005e,
    USCRIPT_ESTRANGELO_SYRIAC            = 0x0000005f,
    USCRIPT_WESTERN_SYRIAC               = 0x00000060,
    USCRIPT_EASTERN_SYRIAC               = 0x00000061,
    USCRIPT_TENGWAR                      = 0x00000062,
    USCRIPT_VAI                          = 0x00000063,
    USCRIPT_VISIBLE_SPEECH               = 0x00000064,
    USCRIPT_CUNEIFORM                    = 0x00000065,
    USCRIPT_UNWRITTEN_LANGUAGES          = 0x00000066,
    USCRIPT_UNKNOWN                      = 0x00000067,
    USCRIPT_CARIAN                       = 0x00000068,
    USCRIPT_JAPANESE                     = 0x00000069,
    USCRIPT_LANNA                        = 0x0000006a,
    USCRIPT_LYCIAN                       = 0x0000006b,
    USCRIPT_LYDIAN                       = 0x0000006c,
    USCRIPT_OL_CHIKI                     = 0x0000006d,
    USCRIPT_REJANG                       = 0x0000006e,
    USCRIPT_SAURASHTRA                   = 0x0000006f,
    USCRIPT_SIGN_WRITING                 = 0x00000070,
    USCRIPT_SUNDANESE                    = 0x00000071,
    USCRIPT_MOON                         = 0x00000072,
    USCRIPT_MEITEI_MAYEK                 = 0x00000073,
    USCRIPT_IMPERIAL_ARAMAIC             = 0x00000074,
    USCRIPT_AVESTAN                      = 0x00000075,
    USCRIPT_CHAKMA                       = 0x00000076,
    USCRIPT_KOREAN                       = 0x00000077,
    USCRIPT_KAITHI                       = 0x00000078,
    USCRIPT_MANICHAEAN                   = 0x00000079,
    USCRIPT_INSCRIPTIONAL_PAHLAVI        = 0x0000007a,
    USCRIPT_PSALTER_PAHLAVI              = 0x0000007b,
    USCRIPT_BOOK_PAHLAVI                 = 0x0000007c,
    USCRIPT_INSCRIPTIONAL_PARTHIAN       = 0x0000007d,
    USCRIPT_SAMARITAN                    = 0x0000007e,
    USCRIPT_TAI_VIET                     = 0x0000007f,
    USCRIPT_MATHEMATICAL_NOTATION        = 0x00000080,
    USCRIPT_SYMBOLS                      = 0x00000081,
    USCRIPT_BAMUM                        = 0x00000082,
    USCRIPT_LISU                         = 0x00000083,
    USCRIPT_NAKHI_GEBA                   = 0x00000084,
    USCRIPT_OLD_SOUTH_ARABIAN            = 0x00000085,
    USCRIPT_BASSA_VAH                    = 0x00000086,
    USCRIPT_DUPLOYAN                     = 0x00000087,
    USCRIPT_ELBASAN                      = 0x00000088,
    USCRIPT_GRANTHA                      = 0x00000089,
    USCRIPT_KPELLE                       = 0x0000008a,
    USCRIPT_LOMA                         = 0x0000008b,
    USCRIPT_MENDE                        = 0x0000008c,
    USCRIPT_MEROITIC_CURSIVE             = 0x0000008d,
    USCRIPT_OLD_NORTH_ARABIAN            = 0x0000008e,
    USCRIPT_NABATAEAN                    = 0x0000008f,
    USCRIPT_PALMYRENE                    = 0x00000090,
    USCRIPT_KHUDAWADI                    = 0x00000091,
    USCRIPT_SINDHI                       = 0x00000091,
    USCRIPT_WARANG_CITI                  = 0x00000092,
    USCRIPT_AFAKA                        = 0x00000093,
    USCRIPT_JURCHEN                      = 0x00000094,
    USCRIPT_MRO                          = 0x00000095,
    USCRIPT_NUSHU                        = 0x00000096,
    USCRIPT_SHARADA                      = 0x00000097,
    USCRIPT_SORA_SOMPENG                 = 0x00000098,
    USCRIPT_TAKRI                        = 0x00000099,
    USCRIPT_TANGUT                       = 0x0000009a,
    USCRIPT_WOLEAI                       = 0x0000009b,
    USCRIPT_ANATOLIAN_HIEROGLYPHS        = 0x0000009c,
    USCRIPT_KHOJKI                       = 0x0000009d,
    USCRIPT_TIRHUTA                      = 0x0000009e,
    USCRIPT_CAUCASIAN_ALBANIAN           = 0x0000009f,
    USCRIPT_MAHAJANI                     = 0x000000a0,
    USCRIPT_AHOM                         = 0x000000a1,
    USCRIPT_HATRAN                       = 0x000000a2,
    USCRIPT_MODI                         = 0x000000a3,
    USCRIPT_MULTANI                      = 0x000000a4,
    USCRIPT_PAU_CIN_HAU                  = 0x000000a5,
    USCRIPT_SIDDHAM                      = 0x000000a6,
    USCRIPT_ADLAM                        = 0x000000a7,
    USCRIPT_BHAIKSUKI                    = 0x000000a8,
    USCRIPT_MARCHEN                      = 0x000000a9,
    USCRIPT_NEWA                         = 0x000000aa,
    USCRIPT_OSAGE                        = 0x000000ab,
    USCRIPT_HAN_WITH_BOPOMOFO            = 0x000000ac,
    USCRIPT_JAMO                         = 0x000000ad,
    USCRIPT_SYMBOLS_EMOJI                = 0x000000ae,
    USCRIPT_MASARAM_GONDI                = 0x000000af,
    USCRIPT_SOYOMBO                      = 0x000000b0,
    USCRIPT_ZANABAZAR_SQUARE             = 0x000000b1,
    USCRIPT_DOGRA                        = 0x000000b2,
    USCRIPT_GUNJALA_GONDI                = 0x000000b3,
    USCRIPT_MAKASAR                      = 0x000000b4,
    USCRIPT_MEDEFAIDRIN                  = 0x000000b5,
    USCRIPT_HANIFI_ROHINGYA              = 0x000000b6,
    USCRIPT_SOGDIAN                      = 0x000000b7,
    USCRIPT_OLD_SOGDIAN                  = 0x000000b8,
    USCRIPT_ELYMAIC                      = 0x000000b9,
    USCRIPT_NYIAKENG_PUACHUE_HMONG       = 0x000000ba,
    USCRIPT_NANDINAGARI                  = 0x000000bb,
    USCRIPT_WANCHO                       = 0x000000bc,
    USCRIPT_CHORASMIAN                   = 0x000000bd,
    USCRIPT_DIVES_AKURU                  = 0x000000be,
    USCRIPT_KHITAN_SMALL_SCRIPT          = 0x000000bf,
    USCRIPT_YEZIDI                       = 0x000000c0,
}

alias UScriptUsage = int;
enum : int
{
    USCRIPT_USAGE_NOT_ENCODED  = 0x00000000,
    USCRIPT_USAGE_UNKNOWN      = 0x00000001,
    USCRIPT_USAGE_EXCLUDED     = 0x00000002,
    USCRIPT_USAGE_LIMITED_USE  = 0x00000003,
    USCRIPT_USAGE_ASPIRATIONAL = 0x00000004,
    USCRIPT_USAGE_RECOMMENDED  = 0x00000005,
}

struct UReplaceableCallbacks
{
    long length;
    long charAt;
    long char32At;
    long replace;
    long extract;
    long copy;
}
struct UFieldPosition
{
    int field;
    int beginIndex;
    int endIndex;
}
alias UCharIteratorOrigin = int;
enum : int
{
    UITER_START   = 0x00000000,
    UITER_CURRENT = 0x00000001,
    UITER_LIMIT   = 0x00000002,
    UITER_ZERO    = 0x00000003,
    UITER_LENGTH  = 0x00000004,
}

alias UCharIteratorGetIndex = int function(UCharIterator*, UCharIteratorOrigin);
alias UCharIteratorMove = int function(UCharIterator*, int, UCharIteratorOrigin);
alias UCharIteratorHasNext = byte function(UCharIterator*);
alias UCharIteratorHasPrevious = byte function(UCharIterator*);
alias UCharIteratorCurrent = int function(UCharIterator*);
alias UCharIteratorNext = int function(UCharIterator*);
alias UCharIteratorPrevious = int function(UCharIterator*);
alias UCharIteratorReserved = int function(UCharIterator*, int);
alias UCharIteratorGetState = uint function(const(UCharIterator)*);
alias UCharIteratorSetState = void function(UCharIterator*, uint, UErrorCode*);
struct UCharIterator
{
    const(void)* context;
    int length;
    int start;
    int index;
    int limit;
    int reservedField;
    UCharIteratorGetIndex getIndex;
    UCharIteratorMove move;
    UCharIteratorHasNext hasNext;
    UCharIteratorHasPrevious hasPrevious;
    UCharIteratorCurrent current;
    UCharIteratorNext next;
    UCharIteratorPrevious previous;
    UCharIteratorReserved reservedFn;
    UCharIteratorGetState getState;
    UCharIteratorSetState setState;
}
alias ULocDataLocaleType = int;
enum : int
{
    ULOC_ACTUAL_LOCALE = 0x00000000,
    ULOC_VALID_LOCALE  = 0x00000001,
}

alias ULocAvailableType = int;
enum : int
{
    ULOC_AVAILABLE_DEFAULT             = 0x00000000,
    ULOC_AVAILABLE_ONLY_LEGACY_ALIASES = 0x00000001,
    ULOC_AVAILABLE_WITH_LEGACY_ALIASES = 0x00000002,
}

alias ULayoutType = int;
enum : int
{
    ULOC_LAYOUT_LTR     = 0x00000000,
    ULOC_LAYOUT_RTL     = 0x00000001,
    ULOC_LAYOUT_TTB     = 0x00000002,
    ULOC_LAYOUT_BTT     = 0x00000003,
    ULOC_LAYOUT_UNKNOWN = 0x00000004,
}

alias UAcceptResult = int;
enum : int
{
    ULOC_ACCEPT_FAILED   = 0x00000000,
    ULOC_ACCEPT_VALID    = 0x00000001,
    ULOC_ACCEPT_FALLBACK = 0x00000002,
}

alias UResType = int;
enum : int
{
    URES_NONE       = 0xffffffff,
    URES_STRING     = 0x00000000,
    URES_BINARY     = 0x00000001,
    URES_TABLE      = 0x00000002,
    URES_ALIAS      = 0x00000003,
    URES_INT        = 0x00000007,
    URES_ARRAY      = 0x00000008,
    URES_INT_VECTOR = 0x0000000e,
}

alias UDisplayContextType = int;
enum : int
{
    UDISPCTX_TYPE_DIALECT_HANDLING    = 0x00000000,
    UDISPCTX_TYPE_CAPITALIZATION      = 0x00000001,
    UDISPCTX_TYPE_DISPLAY_LENGTH      = 0x00000002,
    UDISPCTX_TYPE_SUBSTITUTE_HANDLING = 0x00000003,
}

alias UDisplayContext = int;
enum : int
{
    UDISPCTX_STANDARD_NAMES                           = 0x00000000,
    UDISPCTX_DIALECT_NAMES                            = 0x00000001,
    UDISPCTX_CAPITALIZATION_NONE                      = 0x00000100,
    UDISPCTX_CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE    = 0x00000101,
    UDISPCTX_CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = 0x00000102,
    UDISPCTX_CAPITALIZATION_FOR_UI_LIST_OR_MENU       = 0x00000103,
    UDISPCTX_CAPITALIZATION_FOR_STANDALONE            = 0x00000104,
    UDISPCTX_LENGTH_FULL                              = 0x00000200,
    UDISPCTX_LENGTH_SHORT                             = 0x00000201,
    UDISPCTX_SUBSTITUTE                               = 0x00000300,
    UDISPCTX_NO_SUBSTITUTE                            = 0x00000301,
}

alias UDialectHandling = int;
enum : int
{
    ULDN_STANDARD_NAMES = 0x00000000,
    ULDN_DIALECT_NAMES  = 0x00000001,
}

alias UCurrencyUsage = int;
enum : int
{
    UCURR_USAGE_STANDARD = 0x00000000,
    UCURR_USAGE_CASH     = 0x00000001,
}

alias UCurrNameStyle = int;
enum : int
{
    UCURR_SYMBOL_NAME        = 0x00000000,
    UCURR_LONG_NAME          = 0x00000001,
    UCURR_NARROW_SYMBOL_NAME = 0x00000002,
}

alias UCurrCurrencyType = int;
enum : int
{
    UCURR_ALL            = 0x7fffffff,
    UCURR_COMMON         = 0x00000001,
    UCURR_UNCOMMON       = 0x00000002,
    UCURR_DEPRECATED     = 0x00000004,
    UCURR_NON_DEPRECATED = 0x00000008,
}

alias UCPMapRangeOption = int;
enum : int
{
    UCPMAP_RANGE_NORMAL                = 0x00000000,
    UCPMAP_RANGE_FIXED_LEAD_SURROGATES = 0x00000001,
    UCPMAP_RANGE_FIXED_ALL_SURROGATES  = 0x00000002,
}

alias UCPMapValueFilter = uint function(const(void)*, uint);
union UCPTrieData
{
    const(void)* ptr0;
    const(ushort)* ptr16;
    const(uint)* ptr32;
    const(ubyte)* ptr8;
}
struct UCPTrie
{
    const(ushort)* index;
    UCPTrieData data;
    int indexLength;
    int dataLength;
    int highStart;
    ushort shifted12HighStart;
    byte type;
    byte valueWidth;
    uint reserved32;
    ushort reserved16;
    ushort index3NullOffset;
    int dataNullOffset;
    uint nullValue;
}
alias UCPTrieType = int;
enum : int
{
    UCPTRIE_TYPE_ANY   = 0xffffffff,
    UCPTRIE_TYPE_FAST  = 0x00000000,
    UCPTRIE_TYPE_SMALL = 0x00000001,
}

alias UCPTrieValueWidth = int;
enum : int
{
    UCPTRIE_VALUE_BITS_ANY = 0xffffffff,
    UCPTRIE_VALUE_BITS_16  = 0x00000000,
    UCPTRIE_VALUE_BITS_32  = 0x00000001,
    UCPTRIE_VALUE_BITS_8   = 0x00000002,
}

alias UConverterCallbackReason = int;
enum : int
{
    UCNV_UNASSIGNED = 0x00000000,
    UCNV_ILLEGAL    = 0x00000001,
    UCNV_IRREGULAR  = 0x00000002,
    UCNV_RESET      = 0x00000003,
    UCNV_CLOSE      = 0x00000004,
    UCNV_CLONE      = 0x00000005,
}

struct UConverterFromUnicodeArgs
{
    ushort size;
    byte flush;
    UConverter* converter;
    const(ushort)* source;
    const(ushort)* sourceLimit;
    PSTR target;
    const(char)* targetLimit;
    int* offsets;
}
struct UConverterToUnicodeArgs
{
    ushort size;
    byte flush;
    UConverter* converter;
    const(char)* source;
    const(char)* sourceLimit;
    ushort* target;
    const(ushort)* targetLimit;
    int* offsets;
}
alias UConverterType = int;
enum : int
{
    UCNV_UNSUPPORTED_CONVERTER               = 0xffffffff,
    UCNV_SBCS                                = 0x00000000,
    UCNV_DBCS                                = 0x00000001,
    UCNV_MBCS                                = 0x00000002,
    UCNV_LATIN_1                             = 0x00000003,
    UCNV_UTF8                                = 0x00000004,
    UCNV_UTF16_BigEndian                     = 0x00000005,
    UCNV_UTF16_LittleEndian                  = 0x00000006,
    UCNV_UTF32_BigEndian                     = 0x00000007,
    UCNV_UTF32_LittleEndian                  = 0x00000008,
    UCNV_EBCDIC_STATEFUL                     = 0x00000009,
    UCNV_ISO_2022                            = 0x0000000a,
    UCNV_LMBCS_1                             = 0x0000000b,
    UCNV_LMBCS_2                             = 0x0000000c,
    UCNV_LMBCS_3                             = 0x0000000d,
    UCNV_LMBCS_4                             = 0x0000000e,
    UCNV_LMBCS_5                             = 0x0000000f,
    UCNV_LMBCS_6                             = 0x00000010,
    UCNV_LMBCS_8                             = 0x00000011,
    UCNV_LMBCS_11                            = 0x00000012,
    UCNV_LMBCS_16                            = 0x00000013,
    UCNV_LMBCS_17                            = 0x00000014,
    UCNV_LMBCS_18                            = 0x00000015,
    UCNV_LMBCS_19                            = 0x00000016,
    UCNV_LMBCS_LAST                          = 0x00000016,
    UCNV_HZ                                  = 0x00000017,
    UCNV_SCSU                                = 0x00000018,
    UCNV_ISCII                               = 0x00000019,
    UCNV_US_ASCII                            = 0x0000001a,
    UCNV_UTF7                                = 0x0000001b,
    UCNV_BOCU1                               = 0x0000001c,
    UCNV_UTF16                               = 0x0000001d,
    UCNV_UTF32                               = 0x0000001e,
    UCNV_CESU8                               = 0x0000001f,
    UCNV_IMAP_MAILBOX                        = 0x00000020,
    UCNV_COMPOUND_TEXT                       = 0x00000021,
    UCNV_NUMBER_OF_SUPPORTED_CONVERTER_TYPES = 0x00000022,
}

alias UConverterPlatform = int;
enum : int
{
    UCNV_UNKNOWN = 0xffffffff,
    UCNV_IBM     = 0x00000000,
}

alias UConverterToUCallback = void function(const(void)*, UConverterToUnicodeArgs*, const(char)*, int, UConverterCallbackReason, UErrorCode*);
alias UConverterFromUCallback = void function(const(void)*, UConverterFromUnicodeArgs*, const(ushort)*, int, int, UConverterCallbackReason, UErrorCode*);
alias UConverterUnicodeSet = int;
enum : int
{
    UCNV_ROUNDTRIP_SET              = 0x00000000,
    UCNV_ROUNDTRIP_AND_FALLBACK_SET = 0x00000001,
}

alias UMemAllocFn = void* function(const(void)*, ulong);
alias UMemReallocFn = void* function(const(void)*, void*, ulong);
alias UMemFreeFn = void function(const(void)*, void*);
alias UProperty = int;
enum : int
{
    UCHAR_ALPHABETIC                      = 0x00000000,
    UCHAR_BINARY_START                    = 0x00000000,
    UCHAR_ASCII_HEX_DIGIT                 = 0x00000001,
    UCHAR_BIDI_CONTROL                    = 0x00000002,
    UCHAR_BIDI_MIRRORED                   = 0x00000003,
    UCHAR_DASH                            = 0x00000004,
    UCHAR_DEFAULT_IGNORABLE_CODE_POINT    = 0x00000005,
    UCHAR_DEPRECATED                      = 0x00000006,
    UCHAR_DIACRITIC                       = 0x00000007,
    UCHAR_EXTENDER                        = 0x00000008,
    UCHAR_FULL_COMPOSITION_EXCLUSION      = 0x00000009,
    UCHAR_GRAPHEME_BASE                   = 0x0000000a,
    UCHAR_GRAPHEME_EXTEND                 = 0x0000000b,
    UCHAR_GRAPHEME_LINK                   = 0x0000000c,
    UCHAR_HEX_DIGIT                       = 0x0000000d,
    UCHAR_HYPHEN                          = 0x0000000e,
    UCHAR_ID_CONTINUE                     = 0x0000000f,
    UCHAR_ID_START                        = 0x00000010,
    UCHAR_IDEOGRAPHIC                     = 0x00000011,
    UCHAR_IDS_BINARY_OPERATOR             = 0x00000012,
    UCHAR_IDS_TRINARY_OPERATOR            = 0x00000013,
    UCHAR_JOIN_CONTROL                    = 0x00000014,
    UCHAR_LOGICAL_ORDER_EXCEPTION         = 0x00000015,
    UCHAR_LOWERCASE                       = 0x00000016,
    UCHAR_MATH                            = 0x00000017,
    UCHAR_NONCHARACTER_CODE_POINT         = 0x00000018,
    UCHAR_QUOTATION_MARK                  = 0x00000019,
    UCHAR_RADICAL                         = 0x0000001a,
    UCHAR_SOFT_DOTTED                     = 0x0000001b,
    UCHAR_TERMINAL_PUNCTUATION            = 0x0000001c,
    UCHAR_UNIFIED_IDEOGRAPH               = 0x0000001d,
    UCHAR_UPPERCASE                       = 0x0000001e,
    UCHAR_WHITE_SPACE                     = 0x0000001f,
    UCHAR_XID_CONTINUE                    = 0x00000020,
    UCHAR_XID_START                       = 0x00000021,
    UCHAR_CASE_SENSITIVE                  = 0x00000022,
    UCHAR_S_TERM                          = 0x00000023,
    UCHAR_VARIATION_SELECTOR              = 0x00000024,
    UCHAR_NFD_INERT                       = 0x00000025,
    UCHAR_NFKD_INERT                      = 0x00000026,
    UCHAR_NFC_INERT                       = 0x00000027,
    UCHAR_NFKC_INERT                      = 0x00000028,
    UCHAR_SEGMENT_STARTER                 = 0x00000029,
    UCHAR_PATTERN_SYNTAX                  = 0x0000002a,
    UCHAR_PATTERN_WHITE_SPACE             = 0x0000002b,
    UCHAR_POSIX_ALNUM                     = 0x0000002c,
    UCHAR_POSIX_BLANK                     = 0x0000002d,
    UCHAR_POSIX_GRAPH                     = 0x0000002e,
    UCHAR_POSIX_PRINT                     = 0x0000002f,
    UCHAR_POSIX_XDIGIT                    = 0x00000030,
    UCHAR_CASED                           = 0x00000031,
    UCHAR_CASE_IGNORABLE                  = 0x00000032,
    UCHAR_CHANGES_WHEN_LOWERCASED         = 0x00000033,
    UCHAR_CHANGES_WHEN_UPPERCASED         = 0x00000034,
    UCHAR_CHANGES_WHEN_TITLECASED         = 0x00000035,
    UCHAR_CHANGES_WHEN_CASEFOLDED         = 0x00000036,
    UCHAR_CHANGES_WHEN_CASEMAPPED         = 0x00000037,
    UCHAR_CHANGES_WHEN_NFKC_CASEFOLDED    = 0x00000038,
    UCHAR_EMOJI                           = 0x00000039,
    UCHAR_EMOJI_PRESENTATION              = 0x0000003a,
    UCHAR_EMOJI_MODIFIER                  = 0x0000003b,
    UCHAR_EMOJI_MODIFIER_BASE             = 0x0000003c,
    UCHAR_EMOJI_COMPONENT                 = 0x0000003d,
    UCHAR_REGIONAL_INDICATOR              = 0x0000003e,
    UCHAR_PREPENDED_CONCATENATION_MARK    = 0x0000003f,
    UCHAR_EXTENDED_PICTOGRAPHIC           = 0x00000040,
    UCHAR_BIDI_CLASS                      = 0x00001000,
    UCHAR_INT_START                       = 0x00001000,
    UCHAR_BLOCK                           = 0x00001001,
    UCHAR_CANONICAL_COMBINING_CLASS       = 0x00001002,
    UCHAR_DECOMPOSITION_TYPE              = 0x00001003,
    UCHAR_EAST_ASIAN_WIDTH                = 0x00001004,
    UCHAR_GENERAL_CATEGORY                = 0x00001005,
    UCHAR_JOINING_GROUP                   = 0x00001006,
    UCHAR_JOINING_TYPE                    = 0x00001007,
    UCHAR_LINE_BREAK                      = 0x00001008,
    UCHAR_NUMERIC_TYPE                    = 0x00001009,
    UCHAR_SCRIPT                          = 0x0000100a,
    UCHAR_HANGUL_SYLLABLE_TYPE            = 0x0000100b,
    UCHAR_NFD_QUICK_CHECK                 = 0x0000100c,
    UCHAR_NFKD_QUICK_CHECK                = 0x0000100d,
    UCHAR_NFC_QUICK_CHECK                 = 0x0000100e,
    UCHAR_NFKC_QUICK_CHECK                = 0x0000100f,
    UCHAR_LEAD_CANONICAL_COMBINING_CLASS  = 0x00001010,
    UCHAR_TRAIL_CANONICAL_COMBINING_CLASS = 0x00001011,
    UCHAR_GRAPHEME_CLUSTER_BREAK          = 0x00001012,
    UCHAR_SENTENCE_BREAK                  = 0x00001013,
    UCHAR_WORD_BREAK                      = 0x00001014,
    UCHAR_BIDI_PAIRED_BRACKET_TYPE        = 0x00001015,
    UCHAR_INDIC_POSITIONAL_CATEGORY       = 0x00001016,
    UCHAR_INDIC_SYLLABIC_CATEGORY         = 0x00001017,
    UCHAR_VERTICAL_ORIENTATION            = 0x00001018,
    UCHAR_GENERAL_CATEGORY_MASK           = 0x00002000,
    UCHAR_MASK_START                      = 0x00002000,
    UCHAR_NUMERIC_VALUE                   = 0x00003000,
    UCHAR_DOUBLE_START                    = 0x00003000,
    UCHAR_AGE                             = 0x00004000,
    UCHAR_STRING_START                    = 0x00004000,
    UCHAR_BIDI_MIRRORING_GLYPH            = 0x00004001,
    UCHAR_CASE_FOLDING                    = 0x00004002,
    UCHAR_LOWERCASE_MAPPING               = 0x00004004,
    UCHAR_NAME                            = 0x00004005,
    UCHAR_SIMPLE_CASE_FOLDING             = 0x00004006,
    UCHAR_SIMPLE_LOWERCASE_MAPPING        = 0x00004007,
    UCHAR_SIMPLE_TITLECASE_MAPPING        = 0x00004008,
    UCHAR_SIMPLE_UPPERCASE_MAPPING        = 0x00004009,
    UCHAR_TITLECASE_MAPPING               = 0x0000400a,
    UCHAR_UPPERCASE_MAPPING               = 0x0000400c,
    UCHAR_BIDI_PAIRED_BRACKET             = 0x0000400d,
    UCHAR_SCRIPT_EXTENSIONS               = 0x00007000,
    UCHAR_OTHER_PROPERTY_START            = 0x00007000,
    UCHAR_INVALID_CODE                    = 0xffffffff,
}

alias UCharCategory = int;
enum : int
{
    U_UNASSIGNED             = 0x00000000,
    U_GENERAL_OTHER_TYPES    = 0x00000000,
    U_UPPERCASE_LETTER       = 0x00000001,
    U_LOWERCASE_LETTER       = 0x00000002,
    U_TITLECASE_LETTER       = 0x00000003,
    U_MODIFIER_LETTER        = 0x00000004,
    U_OTHER_LETTER           = 0x00000005,
    U_NON_SPACING_MARK       = 0x00000006,
    U_ENCLOSING_MARK         = 0x00000007,
    U_COMBINING_SPACING_MARK = 0x00000008,
    U_DECIMAL_DIGIT_NUMBER   = 0x00000009,
    U_LETTER_NUMBER          = 0x0000000a,
    U_OTHER_NUMBER           = 0x0000000b,
    U_SPACE_SEPARATOR        = 0x0000000c,
    U_LINE_SEPARATOR         = 0x0000000d,
    U_PARAGRAPH_SEPARATOR    = 0x0000000e,
    U_CONTROL_CHAR           = 0x0000000f,
    U_FORMAT_CHAR            = 0x00000010,
    U_PRIVATE_USE_CHAR       = 0x00000011,
    U_SURROGATE              = 0x00000012,
    U_DASH_PUNCTUATION       = 0x00000013,
    U_START_PUNCTUATION      = 0x00000014,
    U_END_PUNCTUATION        = 0x00000015,
    U_CONNECTOR_PUNCTUATION  = 0x00000016,
    U_OTHER_PUNCTUATION      = 0x00000017,
    U_MATH_SYMBOL            = 0x00000018,
    U_CURRENCY_SYMBOL        = 0x00000019,
    U_MODIFIER_SYMBOL        = 0x0000001a,
    U_OTHER_SYMBOL           = 0x0000001b,
    U_INITIAL_PUNCTUATION    = 0x0000001c,
    U_FINAL_PUNCTUATION      = 0x0000001d,
    U_CHAR_CATEGORY_COUNT    = 0x0000001e,
}

alias UCharDirection = int;
enum : int
{
    U_LEFT_TO_RIGHT              = 0x00000000,
    U_RIGHT_TO_LEFT              = 0x00000001,
    U_EUROPEAN_NUMBER            = 0x00000002,
    U_EUROPEAN_NUMBER_SEPARATOR  = 0x00000003,
    U_EUROPEAN_NUMBER_TERMINATOR = 0x00000004,
    U_ARABIC_NUMBER              = 0x00000005,
    U_COMMON_NUMBER_SEPARATOR    = 0x00000006,
    U_BLOCK_SEPARATOR            = 0x00000007,
    U_SEGMENT_SEPARATOR          = 0x00000008,
    U_WHITE_SPACE_NEUTRAL        = 0x00000009,
    U_OTHER_NEUTRAL              = 0x0000000a,
    U_LEFT_TO_RIGHT_EMBEDDING    = 0x0000000b,
    U_LEFT_TO_RIGHT_OVERRIDE     = 0x0000000c,
    U_RIGHT_TO_LEFT_ARABIC       = 0x0000000d,
    U_RIGHT_TO_LEFT_EMBEDDING    = 0x0000000e,
    U_RIGHT_TO_LEFT_OVERRIDE     = 0x0000000f,
    U_POP_DIRECTIONAL_FORMAT     = 0x00000010,
    U_DIR_NON_SPACING_MARK       = 0x00000011,
    U_BOUNDARY_NEUTRAL           = 0x00000012,
    U_FIRST_STRONG_ISOLATE       = 0x00000013,
    U_LEFT_TO_RIGHT_ISOLATE      = 0x00000014,
    U_RIGHT_TO_LEFT_ISOLATE      = 0x00000015,
    U_POP_DIRECTIONAL_ISOLATE    = 0x00000016,
}

alias UBidiPairedBracketType = int;
enum : int
{
    U_BPT_NONE  = 0x00000000,
    U_BPT_OPEN  = 0x00000001,
    U_BPT_CLOSE = 0x00000002,
}

alias UBlockCode = int;
enum : int
{
    UBLOCK_NO_BLOCK                                       = 0x00000000,
    UBLOCK_BASIC_LATIN                                    = 0x00000001,
    UBLOCK_LATIN_1_SUPPLEMENT                             = 0x00000002,
    UBLOCK_LATIN_EXTENDED_A                               = 0x00000003,
    UBLOCK_LATIN_EXTENDED_B                               = 0x00000004,
    UBLOCK_IPA_EXTENSIONS                                 = 0x00000005,
    UBLOCK_SPACING_MODIFIER_LETTERS                       = 0x00000006,
    UBLOCK_COMBINING_DIACRITICAL_MARKS                    = 0x00000007,
    UBLOCK_GREEK                                          = 0x00000008,
    UBLOCK_CYRILLIC                                       = 0x00000009,
    UBLOCK_ARMENIAN                                       = 0x0000000a,
    UBLOCK_HEBREW                                         = 0x0000000b,
    UBLOCK_ARABIC                                         = 0x0000000c,
    UBLOCK_SYRIAC                                         = 0x0000000d,
    UBLOCK_THAANA                                         = 0x0000000e,
    UBLOCK_DEVANAGARI                                     = 0x0000000f,
    UBLOCK_BENGALI                                        = 0x00000010,
    UBLOCK_GURMUKHI                                       = 0x00000011,
    UBLOCK_GUJARATI                                       = 0x00000012,
    UBLOCK_ORIYA                                          = 0x00000013,
    UBLOCK_TAMIL                                          = 0x00000014,
    UBLOCK_TELUGU                                         = 0x00000015,
    UBLOCK_KANNADA                                        = 0x00000016,
    UBLOCK_MALAYALAM                                      = 0x00000017,
    UBLOCK_SINHALA                                        = 0x00000018,
    UBLOCK_THAI                                           = 0x00000019,
    UBLOCK_LAO                                            = 0x0000001a,
    UBLOCK_TIBETAN                                        = 0x0000001b,
    UBLOCK_MYANMAR                                        = 0x0000001c,
    UBLOCK_GEORGIAN                                       = 0x0000001d,
    UBLOCK_HANGUL_JAMO                                    = 0x0000001e,
    UBLOCK_ETHIOPIC                                       = 0x0000001f,
    UBLOCK_CHEROKEE                                       = 0x00000020,
    UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS          = 0x00000021,
    UBLOCK_OGHAM                                          = 0x00000022,
    UBLOCK_RUNIC                                          = 0x00000023,
    UBLOCK_KHMER                                          = 0x00000024,
    UBLOCK_MONGOLIAN                                      = 0x00000025,
    UBLOCK_LATIN_EXTENDED_ADDITIONAL                      = 0x00000026,
    UBLOCK_GREEK_EXTENDED                                 = 0x00000027,
    UBLOCK_GENERAL_PUNCTUATION                            = 0x00000028,
    UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS                    = 0x00000029,
    UBLOCK_CURRENCY_SYMBOLS                               = 0x0000002a,
    UBLOCK_COMBINING_MARKS_FOR_SYMBOLS                    = 0x0000002b,
    UBLOCK_LETTERLIKE_SYMBOLS                             = 0x0000002c,
    UBLOCK_NUMBER_FORMS                                   = 0x0000002d,
    UBLOCK_ARROWS                                         = 0x0000002e,
    UBLOCK_MATHEMATICAL_OPERATORS                         = 0x0000002f,
    UBLOCK_MISCELLANEOUS_TECHNICAL                        = 0x00000030,
    UBLOCK_CONTROL_PICTURES                               = 0x00000031,
    UBLOCK_OPTICAL_CHARACTER_RECOGNITION                  = 0x00000032,
    UBLOCK_ENCLOSED_ALPHANUMERICS                         = 0x00000033,
    UBLOCK_BOX_DRAWING                                    = 0x00000034,
    UBLOCK_BLOCK_ELEMENTS                                 = 0x00000035,
    UBLOCK_GEOMETRIC_SHAPES                               = 0x00000036,
    UBLOCK_MISCELLANEOUS_SYMBOLS                          = 0x00000037,
    UBLOCK_DINGBATS                                       = 0x00000038,
    UBLOCK_BRAILLE_PATTERNS                               = 0x00000039,
    UBLOCK_CJK_RADICALS_SUPPLEMENT                        = 0x0000003a,
    UBLOCK_KANGXI_RADICALS                                = 0x0000003b,
    UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS             = 0x0000003c,
    UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION                    = 0x0000003d,
    UBLOCK_HIRAGANA                                       = 0x0000003e,
    UBLOCK_KATAKANA                                       = 0x0000003f,
    UBLOCK_BOPOMOFO                                       = 0x00000040,
    UBLOCK_HANGUL_COMPATIBILITY_JAMO                      = 0x00000041,
    UBLOCK_KANBUN                                         = 0x00000042,
    UBLOCK_BOPOMOFO_EXTENDED                              = 0x00000043,
    UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS                = 0x00000044,
    UBLOCK_CJK_COMPATIBILITY                              = 0x00000045,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A             = 0x00000046,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS                         = 0x00000047,
    UBLOCK_YI_SYLLABLES                                   = 0x00000048,
    UBLOCK_YI_RADICALS                                    = 0x00000049,
    UBLOCK_HANGUL_SYLLABLES                               = 0x0000004a,
    UBLOCK_HIGH_SURROGATES                                = 0x0000004b,
    UBLOCK_HIGH_PRIVATE_USE_SURROGATES                    = 0x0000004c,
    UBLOCK_LOW_SURROGATES                                 = 0x0000004d,
    UBLOCK_PRIVATE_USE_AREA                               = 0x0000004e,
    UBLOCK_PRIVATE_USE                                    = 0x0000004e,
    UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS                   = 0x0000004f,
    UBLOCK_ALPHABETIC_PRESENTATION_FORMS                  = 0x00000050,
    UBLOCK_ARABIC_PRESENTATION_FORMS_A                    = 0x00000051,
    UBLOCK_COMBINING_HALF_MARKS                           = 0x00000052,
    UBLOCK_CJK_COMPATIBILITY_FORMS                        = 0x00000053,
    UBLOCK_SMALL_FORM_VARIANTS                            = 0x00000054,
    UBLOCK_ARABIC_PRESENTATION_FORMS_B                    = 0x00000055,
    UBLOCK_SPECIALS                                       = 0x00000056,
    UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS                  = 0x00000057,
    UBLOCK_OLD_ITALIC                                     = 0x00000058,
    UBLOCK_GOTHIC                                         = 0x00000059,
    UBLOCK_DESERET                                        = 0x0000005a,
    UBLOCK_BYZANTINE_MUSICAL_SYMBOLS                      = 0x0000005b,
    UBLOCK_MUSICAL_SYMBOLS                                = 0x0000005c,
    UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS              = 0x0000005d,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B             = 0x0000005e,
    UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT        = 0x0000005f,
    UBLOCK_TAGS                                           = 0x00000060,
    UBLOCK_CYRILLIC_SUPPLEMENT                            = 0x00000061,
    UBLOCK_CYRILLIC_SUPPLEMENTARY                         = 0x00000061,
    UBLOCK_TAGALOG                                        = 0x00000062,
    UBLOCK_HANUNOO                                        = 0x00000063,
    UBLOCK_BUHID                                          = 0x00000064,
    UBLOCK_TAGBANWA                                       = 0x00000065,
    UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A           = 0x00000066,
    UBLOCK_SUPPLEMENTAL_ARROWS_A                          = 0x00000067,
    UBLOCK_SUPPLEMENTAL_ARROWS_B                          = 0x00000068,
    UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B           = 0x00000069,
    UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS            = 0x0000006a,
    UBLOCK_KATAKANA_PHONETIC_EXTENSIONS                   = 0x0000006b,
    UBLOCK_VARIATION_SELECTORS                            = 0x0000006c,
    UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A               = 0x0000006d,
    UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B               = 0x0000006e,
    UBLOCK_LIMBU                                          = 0x0000006f,
    UBLOCK_TAI_LE                                         = 0x00000070,
    UBLOCK_KHMER_SYMBOLS                                  = 0x00000071,
    UBLOCK_PHONETIC_EXTENSIONS                            = 0x00000072,
    UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS               = 0x00000073,
    UBLOCK_YIJING_HEXAGRAM_SYMBOLS                        = 0x00000074,
    UBLOCK_LINEAR_B_SYLLABARY                             = 0x00000075,
    UBLOCK_LINEAR_B_IDEOGRAMS                             = 0x00000076,
    UBLOCK_AEGEAN_NUMBERS                                 = 0x00000077,
    UBLOCK_UGARITIC                                       = 0x00000078,
    UBLOCK_SHAVIAN                                        = 0x00000079,
    UBLOCK_OSMANYA                                        = 0x0000007a,
    UBLOCK_CYPRIOT_SYLLABARY                              = 0x0000007b,
    UBLOCK_TAI_XUAN_JING_SYMBOLS                          = 0x0000007c,
    UBLOCK_VARIATION_SELECTORS_SUPPLEMENT                 = 0x0000007d,
    UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION                 = 0x0000007e,
    UBLOCK_ANCIENT_GREEK_NUMBERS                          = 0x0000007f,
    UBLOCK_ARABIC_SUPPLEMENT                              = 0x00000080,
    UBLOCK_BUGINESE                                       = 0x00000081,
    UBLOCK_CJK_STROKES                                    = 0x00000082,
    UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT         = 0x00000083,
    UBLOCK_COPTIC                                         = 0x00000084,
    UBLOCK_ETHIOPIC_EXTENDED                              = 0x00000085,
    UBLOCK_ETHIOPIC_SUPPLEMENT                            = 0x00000086,
    UBLOCK_GEORGIAN_SUPPLEMENT                            = 0x00000087,
    UBLOCK_GLAGOLITIC                                     = 0x00000088,
    UBLOCK_KHAROSHTHI                                     = 0x00000089,
    UBLOCK_MODIFIER_TONE_LETTERS                          = 0x0000008a,
    UBLOCK_NEW_TAI_LUE                                    = 0x0000008b,
    UBLOCK_OLD_PERSIAN                                    = 0x0000008c,
    UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT                 = 0x0000008d,
    UBLOCK_SUPPLEMENTAL_PUNCTUATION                       = 0x0000008e,
    UBLOCK_SYLOTI_NAGRI                                   = 0x0000008f,
    UBLOCK_TIFINAGH                                       = 0x00000090,
    UBLOCK_VERTICAL_FORMS                                 = 0x00000091,
    UBLOCK_NKO                                            = 0x00000092,
    UBLOCK_BALINESE                                       = 0x00000093,
    UBLOCK_LATIN_EXTENDED_C                               = 0x00000094,
    UBLOCK_LATIN_EXTENDED_D                               = 0x00000095,
    UBLOCK_PHAGS_PA                                       = 0x00000096,
    UBLOCK_PHOENICIAN                                     = 0x00000097,
    UBLOCK_CUNEIFORM                                      = 0x00000098,
    UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION              = 0x00000099,
    UBLOCK_COUNTING_ROD_NUMERALS                          = 0x0000009a,
    UBLOCK_SUNDANESE                                      = 0x0000009b,
    UBLOCK_LEPCHA                                         = 0x0000009c,
    UBLOCK_OL_CHIKI                                       = 0x0000009d,
    UBLOCK_CYRILLIC_EXTENDED_A                            = 0x0000009e,
    UBLOCK_VAI                                            = 0x0000009f,
    UBLOCK_CYRILLIC_EXTENDED_B                            = 0x000000a0,
    UBLOCK_SAURASHTRA                                     = 0x000000a1,
    UBLOCK_KAYAH_LI                                       = 0x000000a2,
    UBLOCK_REJANG                                         = 0x000000a3,
    UBLOCK_CHAM                                           = 0x000000a4,
    UBLOCK_ANCIENT_SYMBOLS                                = 0x000000a5,
    UBLOCK_PHAISTOS_DISC                                  = 0x000000a6,
    UBLOCK_LYCIAN                                         = 0x000000a7,
    UBLOCK_CARIAN                                         = 0x000000a8,
    UBLOCK_LYDIAN                                         = 0x000000a9,
    UBLOCK_MAHJONG_TILES                                  = 0x000000aa,
    UBLOCK_DOMINO_TILES                                   = 0x000000ab,
    UBLOCK_SAMARITAN                                      = 0x000000ac,
    UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED = 0x000000ad,
    UBLOCK_TAI_THAM                                       = 0x000000ae,
    UBLOCK_VEDIC_EXTENSIONS                               = 0x000000af,
    UBLOCK_LISU                                           = 0x000000b0,
    UBLOCK_BAMUM                                          = 0x000000b1,
    UBLOCK_COMMON_INDIC_NUMBER_FORMS                      = 0x000000b2,
    UBLOCK_DEVANAGARI_EXTENDED                            = 0x000000b3,
    UBLOCK_HANGUL_JAMO_EXTENDED_A                         = 0x000000b4,
    UBLOCK_JAVANESE                                       = 0x000000b5,
    UBLOCK_MYANMAR_EXTENDED_A                             = 0x000000b6,
    UBLOCK_TAI_VIET                                       = 0x000000b7,
    UBLOCK_MEETEI_MAYEK                                   = 0x000000b8,
    UBLOCK_HANGUL_JAMO_EXTENDED_B                         = 0x000000b9,
    UBLOCK_IMPERIAL_ARAMAIC                               = 0x000000ba,
    UBLOCK_OLD_SOUTH_ARABIAN                              = 0x000000bb,
    UBLOCK_AVESTAN                                        = 0x000000bc,
    UBLOCK_INSCRIPTIONAL_PARTHIAN                         = 0x000000bd,
    UBLOCK_INSCRIPTIONAL_PAHLAVI                          = 0x000000be,
    UBLOCK_OLD_TURKIC                                     = 0x000000bf,
    UBLOCK_RUMI_NUMERAL_SYMBOLS                           = 0x000000c0,
    UBLOCK_KAITHI                                         = 0x000000c1,
    UBLOCK_EGYPTIAN_HIEROGLYPHS                           = 0x000000c2,
    UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT               = 0x000000c3,
    UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT                = 0x000000c4,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C             = 0x000000c5,
    UBLOCK_MANDAIC                                        = 0x000000c6,
    UBLOCK_BATAK                                          = 0x000000c7,
    UBLOCK_ETHIOPIC_EXTENDED_A                            = 0x000000c8,
    UBLOCK_BRAHMI                                         = 0x000000c9,
    UBLOCK_BAMUM_SUPPLEMENT                               = 0x000000ca,
    UBLOCK_KANA_SUPPLEMENT                                = 0x000000cb,
    UBLOCK_PLAYING_CARDS                                  = 0x000000cc,
    UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS          = 0x000000cd,
    UBLOCK_EMOTICONS                                      = 0x000000ce,
    UBLOCK_TRANSPORT_AND_MAP_SYMBOLS                      = 0x000000cf,
    UBLOCK_ALCHEMICAL_SYMBOLS                             = 0x000000d0,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D             = 0x000000d1,
    UBLOCK_ARABIC_EXTENDED_A                              = 0x000000d2,
    UBLOCK_ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS         = 0x000000d3,
    UBLOCK_CHAKMA                                         = 0x000000d4,
    UBLOCK_MEETEI_MAYEK_EXTENSIONS                        = 0x000000d5,
    UBLOCK_MEROITIC_CURSIVE                               = 0x000000d6,
    UBLOCK_MEROITIC_HIEROGLYPHS                           = 0x000000d7,
    UBLOCK_MIAO                                           = 0x000000d8,
    UBLOCK_SHARADA                                        = 0x000000d9,
    UBLOCK_SORA_SOMPENG                                   = 0x000000da,
    UBLOCK_SUNDANESE_SUPPLEMENT                           = 0x000000db,
    UBLOCK_TAKRI                                          = 0x000000dc,
    UBLOCK_BASSA_VAH                                      = 0x000000dd,
    UBLOCK_CAUCASIAN_ALBANIAN                             = 0x000000de,
    UBLOCK_COPTIC_EPACT_NUMBERS                           = 0x000000df,
    UBLOCK_COMBINING_DIACRITICAL_MARKS_EXTENDED           = 0x000000e0,
    UBLOCK_DUPLOYAN                                       = 0x000000e1,
    UBLOCK_ELBASAN                                        = 0x000000e2,
    UBLOCK_GEOMETRIC_SHAPES_EXTENDED                      = 0x000000e3,
    UBLOCK_GRANTHA                                        = 0x000000e4,
    UBLOCK_KHOJKI                                         = 0x000000e5,
    UBLOCK_KHUDAWADI                                      = 0x000000e6,
    UBLOCK_LATIN_EXTENDED_E                               = 0x000000e7,
    UBLOCK_LINEAR_A                                       = 0x000000e8,
    UBLOCK_MAHAJANI                                       = 0x000000e9,
    UBLOCK_MANICHAEAN                                     = 0x000000ea,
    UBLOCK_MENDE_KIKAKUI                                  = 0x000000eb,
    UBLOCK_MODI                                           = 0x000000ec,
    UBLOCK_MRO                                            = 0x000000ed,
    UBLOCK_MYANMAR_EXTENDED_B                             = 0x000000ee,
    UBLOCK_NABATAEAN                                      = 0x000000ef,
    UBLOCK_OLD_NORTH_ARABIAN                              = 0x000000f0,
    UBLOCK_OLD_PERMIC                                     = 0x000000f1,
    UBLOCK_ORNAMENTAL_DINGBATS                            = 0x000000f2,
    UBLOCK_PAHAWH_HMONG                                   = 0x000000f3,
    UBLOCK_PALMYRENE                                      = 0x000000f4,
    UBLOCK_PAU_CIN_HAU                                    = 0x000000f5,
    UBLOCK_PSALTER_PAHLAVI                                = 0x000000f6,
    UBLOCK_SHORTHAND_FORMAT_CONTROLS                      = 0x000000f7,
    UBLOCK_SIDDHAM                                        = 0x000000f8,
    UBLOCK_SINHALA_ARCHAIC_NUMBERS                        = 0x000000f9,
    UBLOCK_SUPPLEMENTAL_ARROWS_C                          = 0x000000fa,
    UBLOCK_TIRHUTA                                        = 0x000000fb,
    UBLOCK_WARANG_CITI                                    = 0x000000fc,
    UBLOCK_AHOM                                           = 0x000000fd,
    UBLOCK_ANATOLIAN_HIEROGLYPHS                          = 0x000000fe,
    UBLOCK_CHEROKEE_SUPPLEMENT                            = 0x000000ff,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E             = 0x00000100,
    UBLOCK_EARLY_DYNASTIC_CUNEIFORM                       = 0x00000101,
    UBLOCK_HATRAN                                         = 0x00000102,
    UBLOCK_MULTANI                                        = 0x00000103,
    UBLOCK_OLD_HUNGARIAN                                  = 0x00000104,
    UBLOCK_SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS           = 0x00000105,
    UBLOCK_SUTTON_SIGNWRITING                             = 0x00000106,
    UBLOCK_ADLAM                                          = 0x00000107,
    UBLOCK_BHAIKSUKI                                      = 0x00000108,
    UBLOCK_CYRILLIC_EXTENDED_C                            = 0x00000109,
    UBLOCK_GLAGOLITIC_SUPPLEMENT                          = 0x0000010a,
    UBLOCK_IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION            = 0x0000010b,
    UBLOCK_MARCHEN                                        = 0x0000010c,
    UBLOCK_MONGOLIAN_SUPPLEMENT                           = 0x0000010d,
    UBLOCK_NEWA                                           = 0x0000010e,
    UBLOCK_OSAGE                                          = 0x0000010f,
    UBLOCK_TANGUT                                         = 0x00000110,
    UBLOCK_TANGUT_COMPONENTS                              = 0x00000111,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_F             = 0x00000112,
    UBLOCK_KANA_EXTENDED_A                                = 0x00000113,
    UBLOCK_MASARAM_GONDI                                  = 0x00000114,
    UBLOCK_NUSHU                                          = 0x00000115,
    UBLOCK_SOYOMBO                                        = 0x00000116,
    UBLOCK_SYRIAC_SUPPLEMENT                              = 0x00000117,
    UBLOCK_ZANABAZAR_SQUARE                               = 0x00000118,
    UBLOCK_CHESS_SYMBOLS                                  = 0x00000119,
    UBLOCK_DOGRA                                          = 0x0000011a,
    UBLOCK_GEORGIAN_EXTENDED                              = 0x0000011b,
    UBLOCK_GUNJALA_GONDI                                  = 0x0000011c,
    UBLOCK_HANIFI_ROHINGYA                                = 0x0000011d,
    UBLOCK_INDIC_SIYAQ_NUMBERS                            = 0x0000011e,
    UBLOCK_MAKASAR                                        = 0x0000011f,
    UBLOCK_MAYAN_NUMERALS                                 = 0x00000120,
    UBLOCK_MEDEFAIDRIN                                    = 0x00000121,
    UBLOCK_OLD_SOGDIAN                                    = 0x00000122,
    UBLOCK_SOGDIAN                                        = 0x00000123,
    UBLOCK_EGYPTIAN_HIEROGLYPH_FORMAT_CONTROLS            = 0x00000124,
    UBLOCK_ELYMAIC                                        = 0x00000125,
    UBLOCK_NANDINAGARI                                    = 0x00000126,
    UBLOCK_NYIAKENG_PUACHUE_HMONG                         = 0x00000127,
    UBLOCK_OTTOMAN_SIYAQ_NUMBERS                          = 0x00000128,
    UBLOCK_SMALL_KANA_EXTENSION                           = 0x00000129,
    UBLOCK_SYMBOLS_AND_PICTOGRAPHS_EXTENDED_A             = 0x0000012a,
    UBLOCK_TAMIL_SUPPLEMENT                               = 0x0000012b,
    UBLOCK_WANCHO                                         = 0x0000012c,
    UBLOCK_CHORASMIAN                                     = 0x0000012d,
    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_G             = 0x0000012e,
    UBLOCK_DIVES_AKURU                                    = 0x0000012f,
    UBLOCK_KHITAN_SMALL_SCRIPT                            = 0x00000130,
    UBLOCK_LISU_SUPPLEMENT                                = 0x00000131,
    UBLOCK_SYMBOLS_FOR_LEGACY_COMPUTING                   = 0x00000132,
    UBLOCK_TANGUT_SUPPLEMENT                              = 0x00000133,
    UBLOCK_YEZIDI                                         = 0x00000134,
    UBLOCK_INVALID_CODE                                   = 0xffffffff,
}

alias UEastAsianWidth = int;
enum : int
{
    U_EA_NEUTRAL   = 0x00000000,
    U_EA_AMBIGUOUS = 0x00000001,
    U_EA_HALFWIDTH = 0x00000002,
    U_EA_FULLWIDTH = 0x00000003,
    U_EA_NARROW    = 0x00000004,
    U_EA_WIDE      = 0x00000005,
}

alias UCharNameChoice = int;
enum : int
{
    U_UNICODE_CHAR_NAME  = 0x00000000,
    U_EXTENDED_CHAR_NAME = 0x00000002,
    U_CHAR_NAME_ALIAS    = 0x00000003,
}

alias UPropertyNameChoice = int;
enum : int
{
    U_SHORT_PROPERTY_NAME = 0x00000000,
    U_LONG_PROPERTY_NAME  = 0x00000001,
}

alias UDecompositionType = int;
enum : int
{
    U_DT_NONE      = 0x00000000,
    U_DT_CANONICAL = 0x00000001,
    U_DT_COMPAT    = 0x00000002,
    U_DT_CIRCLE    = 0x00000003,
    U_DT_FINAL     = 0x00000004,
    U_DT_FONT      = 0x00000005,
    U_DT_FRACTION  = 0x00000006,
    U_DT_INITIAL   = 0x00000007,
    U_DT_ISOLATED  = 0x00000008,
    U_DT_MEDIAL    = 0x00000009,
    U_DT_NARROW    = 0x0000000a,
    U_DT_NOBREAK   = 0x0000000b,
    U_DT_SMALL     = 0x0000000c,
    U_DT_SQUARE    = 0x0000000d,
    U_DT_SUB       = 0x0000000e,
    U_DT_SUPER     = 0x0000000f,
    U_DT_VERTICAL  = 0x00000010,
    U_DT_WIDE      = 0x00000011,
}

alias UJoiningType = int;
enum : int
{
    U_JT_NON_JOINING   = 0x00000000,
    U_JT_JOIN_CAUSING  = 0x00000001,
    U_JT_DUAL_JOINING  = 0x00000002,
    U_JT_LEFT_JOINING  = 0x00000003,
    U_JT_RIGHT_JOINING = 0x00000004,
    U_JT_TRANSPARENT   = 0x00000005,
}

alias UJoiningGroup = int;
enum : int
{
    U_JG_NO_JOINING_GROUP         = 0x00000000,
    U_JG_AIN                      = 0x00000001,
    U_JG_ALAPH                    = 0x00000002,
    U_JG_ALEF                     = 0x00000003,
    U_JG_BEH                      = 0x00000004,
    U_JG_BETH                     = 0x00000005,
    U_JG_DAL                      = 0x00000006,
    U_JG_DALATH_RISH              = 0x00000007,
    U_JG_E                        = 0x00000008,
    U_JG_FEH                      = 0x00000009,
    U_JG_FINAL_SEMKATH            = 0x0000000a,
    U_JG_GAF                      = 0x0000000b,
    U_JG_GAMAL                    = 0x0000000c,
    U_JG_HAH                      = 0x0000000d,
    U_JG_TEH_MARBUTA_GOAL         = 0x0000000e,
    U_JG_HAMZA_ON_HEH_GOAL        = 0x0000000e,
    U_JG_HE                       = 0x0000000f,
    U_JG_HEH                      = 0x00000010,
    U_JG_HEH_GOAL                 = 0x00000011,
    U_JG_HETH                     = 0x00000012,
    U_JG_KAF                      = 0x00000013,
    U_JG_KAPH                     = 0x00000014,
    U_JG_KNOTTED_HEH              = 0x00000015,
    U_JG_LAM                      = 0x00000016,
    U_JG_LAMADH                   = 0x00000017,
    U_JG_MEEM                     = 0x00000018,
    U_JG_MIM                      = 0x00000019,
    U_JG_NOON                     = 0x0000001a,
    U_JG_NUN                      = 0x0000001b,
    U_JG_PE                       = 0x0000001c,
    U_JG_QAF                      = 0x0000001d,
    U_JG_QAPH                     = 0x0000001e,
    U_JG_REH                      = 0x0000001f,
    U_JG_REVERSED_PE              = 0x00000020,
    U_JG_SAD                      = 0x00000021,
    U_JG_SADHE                    = 0x00000022,
    U_JG_SEEN                     = 0x00000023,
    U_JG_SEMKATH                  = 0x00000024,
    U_JG_SHIN                     = 0x00000025,
    U_JG_SWASH_KAF                = 0x00000026,
    U_JG_SYRIAC_WAW               = 0x00000027,
    U_JG_TAH                      = 0x00000028,
    U_JG_TAW                      = 0x00000029,
    U_JG_TEH_MARBUTA              = 0x0000002a,
    U_JG_TETH                     = 0x0000002b,
    U_JG_WAW                      = 0x0000002c,
    U_JG_YEH                      = 0x0000002d,
    U_JG_YEH_BARREE               = 0x0000002e,
    U_JG_YEH_WITH_TAIL            = 0x0000002f,
    U_JG_YUDH                     = 0x00000030,
    U_JG_YUDH_HE                  = 0x00000031,
    U_JG_ZAIN                     = 0x00000032,
    U_JG_FE                       = 0x00000033,
    U_JG_KHAPH                    = 0x00000034,
    U_JG_ZHAIN                    = 0x00000035,
    U_JG_BURUSHASKI_YEH_BARREE    = 0x00000036,
    U_JG_FARSI_YEH                = 0x00000037,
    U_JG_NYA                      = 0x00000038,
    U_JG_ROHINGYA_YEH             = 0x00000039,
    U_JG_MANICHAEAN_ALEPH         = 0x0000003a,
    U_JG_MANICHAEAN_AYIN          = 0x0000003b,
    U_JG_MANICHAEAN_BETH          = 0x0000003c,
    U_JG_MANICHAEAN_DALETH        = 0x0000003d,
    U_JG_MANICHAEAN_DHAMEDH       = 0x0000003e,
    U_JG_MANICHAEAN_FIVE          = 0x0000003f,
    U_JG_MANICHAEAN_GIMEL         = 0x00000040,
    U_JG_MANICHAEAN_HETH          = 0x00000041,
    U_JG_MANICHAEAN_HUNDRED       = 0x00000042,
    U_JG_MANICHAEAN_KAPH          = 0x00000043,
    U_JG_MANICHAEAN_LAMEDH        = 0x00000044,
    U_JG_MANICHAEAN_MEM           = 0x00000045,
    U_JG_MANICHAEAN_NUN           = 0x00000046,
    U_JG_MANICHAEAN_ONE           = 0x00000047,
    U_JG_MANICHAEAN_PE            = 0x00000048,
    U_JG_MANICHAEAN_QOPH          = 0x00000049,
    U_JG_MANICHAEAN_RESH          = 0x0000004a,
    U_JG_MANICHAEAN_SADHE         = 0x0000004b,
    U_JG_MANICHAEAN_SAMEKH        = 0x0000004c,
    U_JG_MANICHAEAN_TAW           = 0x0000004d,
    U_JG_MANICHAEAN_TEN           = 0x0000004e,
    U_JG_MANICHAEAN_TETH          = 0x0000004f,
    U_JG_MANICHAEAN_THAMEDH       = 0x00000050,
    U_JG_MANICHAEAN_TWENTY        = 0x00000051,
    U_JG_MANICHAEAN_WAW           = 0x00000052,
    U_JG_MANICHAEAN_YODH          = 0x00000053,
    U_JG_MANICHAEAN_ZAYIN         = 0x00000054,
    U_JG_STRAIGHT_WAW             = 0x00000055,
    U_JG_AFRICAN_FEH              = 0x00000056,
    U_JG_AFRICAN_NOON             = 0x00000057,
    U_JG_AFRICAN_QAF              = 0x00000058,
    U_JG_MALAYALAM_BHA            = 0x00000059,
    U_JG_MALAYALAM_JA             = 0x0000005a,
    U_JG_MALAYALAM_LLA            = 0x0000005b,
    U_JG_MALAYALAM_LLLA           = 0x0000005c,
    U_JG_MALAYALAM_NGA            = 0x0000005d,
    U_JG_MALAYALAM_NNA            = 0x0000005e,
    U_JG_MALAYALAM_NNNA           = 0x0000005f,
    U_JG_MALAYALAM_NYA            = 0x00000060,
    U_JG_MALAYALAM_RA             = 0x00000061,
    U_JG_MALAYALAM_SSA            = 0x00000062,
    U_JG_MALAYALAM_TTA            = 0x00000063,
    U_JG_HANIFI_ROHINGYA_KINNA_YA = 0x00000064,
    U_JG_HANIFI_ROHINGYA_PA       = 0x00000065,
}

alias UGraphemeClusterBreak = int;
enum : int
{
    U_GCB_OTHER              = 0x00000000,
    U_GCB_CONTROL            = 0x00000001,
    U_GCB_CR                 = 0x00000002,
    U_GCB_EXTEND             = 0x00000003,
    U_GCB_L                  = 0x00000004,
    U_GCB_LF                 = 0x00000005,
    U_GCB_LV                 = 0x00000006,
    U_GCB_LVT                = 0x00000007,
    U_GCB_T                  = 0x00000008,
    U_GCB_V                  = 0x00000009,
    U_GCB_SPACING_MARK       = 0x0000000a,
    U_GCB_PREPEND            = 0x0000000b,
    U_GCB_REGIONAL_INDICATOR = 0x0000000c,
    U_GCB_E_BASE             = 0x0000000d,
    U_GCB_E_BASE_GAZ         = 0x0000000e,
    U_GCB_E_MODIFIER         = 0x0000000f,
    U_GCB_GLUE_AFTER_ZWJ     = 0x00000010,
    U_GCB_ZWJ                = 0x00000011,
}

alias UWordBreakValues = int;
enum : int
{
    U_WB_OTHER              = 0x00000000,
    U_WB_ALETTER            = 0x00000001,
    U_WB_FORMAT             = 0x00000002,
    U_WB_KATAKANA           = 0x00000003,
    U_WB_MIDLETTER          = 0x00000004,
    U_WB_MIDNUM             = 0x00000005,
    U_WB_NUMERIC            = 0x00000006,
    U_WB_EXTENDNUMLET       = 0x00000007,
    U_WB_CR                 = 0x00000008,
    U_WB_EXTEND             = 0x00000009,
    U_WB_LF                 = 0x0000000a,
    U_WB_MIDNUMLET          = 0x0000000b,
    U_WB_NEWLINE            = 0x0000000c,
    U_WB_REGIONAL_INDICATOR = 0x0000000d,
    U_WB_HEBREW_LETTER      = 0x0000000e,
    U_WB_SINGLE_QUOTE       = 0x0000000f,
    U_WB_DOUBLE_QUOTE       = 0x00000010,
    U_WB_E_BASE             = 0x00000011,
    U_WB_E_BASE_GAZ         = 0x00000012,
    U_WB_E_MODIFIER         = 0x00000013,
    U_WB_GLUE_AFTER_ZWJ     = 0x00000014,
    U_WB_ZWJ                = 0x00000015,
    U_WB_WSEGSPACE          = 0x00000016,
}

alias USentenceBreak = int;
enum : int
{
    U_SB_OTHER     = 0x00000000,
    U_SB_ATERM     = 0x00000001,
    U_SB_CLOSE     = 0x00000002,
    U_SB_FORMAT    = 0x00000003,
    U_SB_LOWER     = 0x00000004,
    U_SB_NUMERIC   = 0x00000005,
    U_SB_OLETTER   = 0x00000006,
    U_SB_SEP       = 0x00000007,
    U_SB_SP        = 0x00000008,
    U_SB_STERM     = 0x00000009,
    U_SB_UPPER     = 0x0000000a,
    U_SB_CR        = 0x0000000b,
    U_SB_EXTEND    = 0x0000000c,
    U_SB_LF        = 0x0000000d,
    U_SB_SCONTINUE = 0x0000000e,
}

alias ULineBreak = int;
enum : int
{
    U_LB_UNKNOWN                      = 0x00000000,
    U_LB_AMBIGUOUS                    = 0x00000001,
    U_LB_ALPHABETIC                   = 0x00000002,
    U_LB_BREAK_BOTH                   = 0x00000003,
    U_LB_BREAK_AFTER                  = 0x00000004,
    U_LB_BREAK_BEFORE                 = 0x00000005,
    U_LB_MANDATORY_BREAK              = 0x00000006,
    U_LB_CONTINGENT_BREAK             = 0x00000007,
    U_LB_CLOSE_PUNCTUATION            = 0x00000008,
    U_LB_COMBINING_MARK               = 0x00000009,
    U_LB_CARRIAGE_RETURN              = 0x0000000a,
    U_LB_EXCLAMATION                  = 0x0000000b,
    U_LB_GLUE                         = 0x0000000c,
    U_LB_HYPHEN                       = 0x0000000d,
    U_LB_IDEOGRAPHIC                  = 0x0000000e,
    U_LB_INSEPARABLE                  = 0x0000000f,
    U_LB_INSEPERABLE                  = 0x0000000f,
    U_LB_INFIX_NUMERIC                = 0x00000010,
    U_LB_LINE_FEED                    = 0x00000011,
    U_LB_NONSTARTER                   = 0x00000012,
    U_LB_NUMERIC                      = 0x00000013,
    U_LB_OPEN_PUNCTUATION             = 0x00000014,
    U_LB_POSTFIX_NUMERIC              = 0x00000015,
    U_LB_PREFIX_NUMERIC               = 0x00000016,
    U_LB_QUOTATION                    = 0x00000017,
    U_LB_COMPLEX_CONTEXT              = 0x00000018,
    U_LB_SURROGATE                    = 0x00000019,
    U_LB_SPACE                        = 0x0000001a,
    U_LB_BREAK_SYMBOLS                = 0x0000001b,
    U_LB_ZWSPACE                      = 0x0000001c,
    U_LB_NEXT_LINE                    = 0x0000001d,
    U_LB_WORD_JOINER                  = 0x0000001e,
    U_LB_H2                           = 0x0000001f,
    U_LB_H3                           = 0x00000020,
    U_LB_JL                           = 0x00000021,
    U_LB_JT                           = 0x00000022,
    U_LB_JV                           = 0x00000023,
    U_LB_CLOSE_PARENTHESIS            = 0x00000024,
    U_LB_CONDITIONAL_JAPANESE_STARTER = 0x00000025,
    U_LB_HEBREW_LETTER                = 0x00000026,
    U_LB_REGIONAL_INDICATOR           = 0x00000027,
    U_LB_E_BASE                       = 0x00000028,
    U_LB_E_MODIFIER                   = 0x00000029,
    U_LB_ZWJ                          = 0x0000002a,
}

alias UNumericType = int;
enum : int
{
    U_NT_NONE    = 0x00000000,
    U_NT_DECIMAL = 0x00000001,
    U_NT_DIGIT   = 0x00000002,
    U_NT_NUMERIC = 0x00000003,
}

alias UHangulSyllableType = int;
enum : int
{
    U_HST_NOT_APPLICABLE = 0x00000000,
    U_HST_LEADING_JAMO   = 0x00000001,
    U_HST_VOWEL_JAMO     = 0x00000002,
    U_HST_TRAILING_JAMO  = 0x00000003,
    U_HST_LV_SYLLABLE    = 0x00000004,
    U_HST_LVT_SYLLABLE   = 0x00000005,
}

alias UIndicPositionalCategory = int;
enum : int
{
    U_INPC_NA                       = 0x00000000,
    U_INPC_BOTTOM                   = 0x00000001,
    U_INPC_BOTTOM_AND_LEFT          = 0x00000002,
    U_INPC_BOTTOM_AND_RIGHT         = 0x00000003,
    U_INPC_LEFT                     = 0x00000004,
    U_INPC_LEFT_AND_RIGHT           = 0x00000005,
    U_INPC_OVERSTRUCK               = 0x00000006,
    U_INPC_RIGHT                    = 0x00000007,
    U_INPC_TOP                      = 0x00000008,
    U_INPC_TOP_AND_BOTTOM           = 0x00000009,
    U_INPC_TOP_AND_BOTTOM_AND_RIGHT = 0x0000000a,
    U_INPC_TOP_AND_LEFT             = 0x0000000b,
    U_INPC_TOP_AND_LEFT_AND_RIGHT   = 0x0000000c,
    U_INPC_TOP_AND_RIGHT            = 0x0000000d,
    U_INPC_VISUAL_ORDER_LEFT        = 0x0000000e,
    U_INPC_TOP_AND_BOTTOM_AND_LEFT  = 0x0000000f,
}

alias UIndicSyllabicCategory = int;
enum : int
{
    U_INSC_OTHER                       = 0x00000000,
    U_INSC_AVAGRAHA                    = 0x00000001,
    U_INSC_BINDU                       = 0x00000002,
    U_INSC_BRAHMI_JOINING_NUMBER       = 0x00000003,
    U_INSC_CANTILLATION_MARK           = 0x00000004,
    U_INSC_CONSONANT                   = 0x00000005,
    U_INSC_CONSONANT_DEAD              = 0x00000006,
    U_INSC_CONSONANT_FINAL             = 0x00000007,
    U_INSC_CONSONANT_HEAD_LETTER       = 0x00000008,
    U_INSC_CONSONANT_INITIAL_POSTFIXED = 0x00000009,
    U_INSC_CONSONANT_KILLER            = 0x0000000a,
    U_INSC_CONSONANT_MEDIAL            = 0x0000000b,
    U_INSC_CONSONANT_PLACEHOLDER       = 0x0000000c,
    U_INSC_CONSONANT_PRECEDING_REPHA   = 0x0000000d,
    U_INSC_CONSONANT_PREFIXED          = 0x0000000e,
    U_INSC_CONSONANT_SUBJOINED         = 0x0000000f,
    U_INSC_CONSONANT_SUCCEEDING_REPHA  = 0x00000010,
    U_INSC_CONSONANT_WITH_STACKER      = 0x00000011,
    U_INSC_GEMINATION_MARK             = 0x00000012,
    U_INSC_INVISIBLE_STACKER           = 0x00000013,
    U_INSC_JOINER                      = 0x00000014,
    U_INSC_MODIFYING_LETTER            = 0x00000015,
    U_INSC_NON_JOINER                  = 0x00000016,
    U_INSC_NUKTA                       = 0x00000017,
    U_INSC_NUMBER                      = 0x00000018,
    U_INSC_NUMBER_JOINER               = 0x00000019,
    U_INSC_PURE_KILLER                 = 0x0000001a,
    U_INSC_REGISTER_SHIFTER            = 0x0000001b,
    U_INSC_SYLLABLE_MODIFIER           = 0x0000001c,
    U_INSC_TONE_LETTER                 = 0x0000001d,
    U_INSC_TONE_MARK                   = 0x0000001e,
    U_INSC_VIRAMA                      = 0x0000001f,
    U_INSC_VISARGA                     = 0x00000020,
    U_INSC_VOWEL                       = 0x00000021,
    U_INSC_VOWEL_DEPENDENT             = 0x00000022,
    U_INSC_VOWEL_INDEPENDENT           = 0x00000023,
}

alias UVerticalOrientation = int;
enum : int
{
    U_VO_ROTATED             = 0x00000000,
    U_VO_TRANSFORMED_ROTATED = 0x00000001,
    U_VO_TRANSFORMED_UPRIGHT = 0x00000002,
    U_VO_UPRIGHT             = 0x00000003,
}

alias UCharEnumTypeRange = byte function(const(void)*, int, int, UCharCategory);
alias UEnumCharNamesFn = byte function(void*, int, UCharNameChoice, const(char)*, int);
alias UBiDiDirection = int;
enum : int
{
    UBIDI_LTR     = 0x00000000,
    UBIDI_RTL     = 0x00000001,
    UBIDI_MIXED   = 0x00000002,
    UBIDI_NEUTRAL = 0x00000003,
}

alias UBiDiReorderingMode = int;
enum : int
{
    UBIDI_REORDER_DEFAULT                     = 0x00000000,
    UBIDI_REORDER_NUMBERS_SPECIAL             = 0x00000001,
    UBIDI_REORDER_GROUP_NUMBERS_WITH_R        = 0x00000002,
    UBIDI_REORDER_RUNS_ONLY                   = 0x00000003,
    UBIDI_REORDER_INVERSE_NUMBERS_AS_L        = 0x00000004,
    UBIDI_REORDER_INVERSE_LIKE_DIRECT         = 0x00000005,
    UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL = 0x00000006,
}

alias UBiDiReorderingOption = int;
enum : int
{
    UBIDI_OPTION_DEFAULT         = 0x00000000,
    UBIDI_OPTION_INSERT_MARKS    = 0x00000001,
    UBIDI_OPTION_REMOVE_CONTROLS = 0x00000002,
    UBIDI_OPTION_STREAMING       = 0x00000004,
}

alias UBiDiClassCallback = UCharDirection function(const(void)*, int);
alias UBiDiOrder = int;
enum : int
{
    UBIDI_LOGICAL = 0x00000000,
    UBIDI_VISUAL  = 0x00000001,
}

alias UBiDiMirroring = int;
enum : int
{
    UBIDI_MIRRORING_OFF = 0x00000000,
    UBIDI_MIRRORING_ON  = 0x00000001,
}

alias UTextClone = UText* function(UText*, const(UText)*, byte, UErrorCode*);
alias UTextNativeLength = long function(UText*);
alias UTextAccess = byte function(UText*, long, byte);
alias UTextExtract = int function(UText*, long, long, ushort*, int, UErrorCode*);
alias UTextReplace = int function(UText*, long, long, const(ushort)*, int, UErrorCode*);
alias UTextCopy = void function(UText*, long, long, long, byte, UErrorCode*);
alias UTextMapOffsetToNative = long function(const(UText)*);
alias UTextMapNativeIndexToUTF16 = int function(const(UText)*, long);
alias UTextClose = void function(UText*);
struct UTextFuncs
{
    int tableSize;
    int reserved1;
    int reserved2;
    int reserved3;
    UTextClone clone;
    UTextNativeLength nativeLength;
    UTextAccess access;
    UTextExtract extract;
    UTextReplace replace;
    UTextCopy copy;
    UTextMapOffsetToNative mapOffsetToNative;
    UTextMapNativeIndexToUTF16 mapNativeIndexToUTF16;
    UTextClose close;
    UTextClose spare1;
    UTextClose spare2;
    UTextClose spare3;
}
struct UText
{
    uint magic;
    int flags;
    int providerProperties;
    int sizeOfStruct;
    long chunkNativeLimit;
    int extraSize;
    int nativeIndexingLimit;
    long chunkNativeStart;
    int chunkOffset;
    int chunkLength;
    const(ushort)* chunkContents;
    const(UTextFuncs)* pFuncs;
    void* pExtra;
    const(void)* context;
    const(void)* p;
    const(void)* q;
    const(void)* r;
    void* privP;
    long a;
    int b;
    int c;
    long privA;
    int privB;
    int privC;
}
alias USetSpanCondition = int;
enum : int
{
    USET_SPAN_NOT_CONTAINED = 0x00000000,
    USET_SPAN_CONTAINED     = 0x00000001,
    USET_SPAN_SIMPLE        = 0x00000002,
}

struct USerializedSet
{
    const(ushort)* array;
    int bmpLength;
    int length;
    ushort[8] staticArray;
}
alias UNormalization2Mode = int;
enum : int
{
    UNORM2_COMPOSE            = 0x00000000,
    UNORM2_DECOMPOSE          = 0x00000001,
    UNORM2_FCD                = 0x00000002,
    UNORM2_COMPOSE_CONTIGUOUS = 0x00000003,
}

alias UNormalizationCheckResult = int;
enum : int
{
    UNORM_NO    = 0x00000000,
    UNORM_YES   = 0x00000001,
    UNORM_MAYBE = 0x00000002,
}

alias UNormalizationMode = int;
enum : int
{
    UNORM_NONE       = 0x00000001,
    UNORM_NFD        = 0x00000002,
    UNORM_NFKD       = 0x00000003,
    UNORM_NFC        = 0x00000004,
    UNORM_DEFAULT    = 0x00000004,
    UNORM_NFKC       = 0x00000005,
    UNORM_FCD        = 0x00000006,
    UNORM_MODE_COUNT = 0x00000007,
}

alias UNESCAPE_CHAR_AT = ushort function(int, void*);
struct UParseError
{
    int line;
    int offset;
    ushort[16] preContext;
    ushort[16] postContext;
}
alias UStringPrepProfileType = int;
enum : int
{
    USPREP_RFC3491_NAMEPREP               = 0x00000000,
    USPREP_RFC3530_NFS4_CS_PREP           = 0x00000001,
    USPREP_RFC3530_NFS4_CS_PREP_CI        = 0x00000002,
    USPREP_RFC3530_NFS4_CIS_PREP          = 0x00000003,
    USPREP_RFC3530_NFS4_MIXED_PREP_PREFIX = 0x00000004,
    USPREP_RFC3530_NFS4_MIXED_PREP_SUFFIX = 0x00000005,
    USPREP_RFC3722_ISCSI                  = 0x00000006,
    USPREP_RFC3920_NODEPREP               = 0x00000007,
    USPREP_RFC3920_RESOURCEPREP           = 0x00000008,
    USPREP_RFC4011_MIB                    = 0x00000009,
    USPREP_RFC4013_SASLPREP               = 0x0000000a,
    USPREP_RFC4505_TRACE                  = 0x0000000b,
    USPREP_RFC4518_LDAP                   = 0x0000000c,
    USPREP_RFC4518_LDAP_CI                = 0x0000000d,
}

struct UIDNAInfo
{
    short size;
    byte isTransitionalDifferent;
    byte reservedB3;
    uint errors;
    int reservedI2;
    int reservedI3;
}
alias UBreakIteratorType = int;
enum : int
{
    UBRK_CHARACTER = 0x00000000,
    UBRK_WORD      = 0x00000001,
    UBRK_LINE      = 0x00000002,
    UBRK_SENTENCE  = 0x00000003,
}

alias UWordBreak = int;
enum : int
{
    UBRK_WORD_NONE         = 0x00000000,
    UBRK_WORD_NONE_LIMIT   = 0x00000064,
    UBRK_WORD_NUMBER       = 0x00000064,
    UBRK_WORD_NUMBER_LIMIT = 0x000000c8,
    UBRK_WORD_LETTER       = 0x000000c8,
    UBRK_WORD_LETTER_LIMIT = 0x0000012c,
    UBRK_WORD_KANA         = 0x0000012c,
    UBRK_WORD_KANA_LIMIT   = 0x00000190,
    UBRK_WORD_IDEO         = 0x00000190,
    UBRK_WORD_IDEO_LIMIT   = 0x000001f4,
}

alias ULineBreakTag = int;
enum : int
{
    UBRK_LINE_SOFT       = 0x00000000,
    UBRK_LINE_SOFT_LIMIT = 0x00000064,
    UBRK_LINE_HARD       = 0x00000064,
    UBRK_LINE_HARD_LIMIT = 0x000000c8,
}

alias USentenceBreakTag = int;
enum : int
{
    UBRK_SENTENCE_TERM       = 0x00000000,
    UBRK_SENTENCE_TERM_LIMIT = 0x00000064,
    UBRK_SENTENCE_SEP        = 0x00000064,
    UBRK_SENTENCE_SEP_LIMIT  = 0x000000c8,
}

alias UCalendarType = int;
enum : int
{
    UCAL_TRADITIONAL = 0x00000000,
    UCAL_DEFAULT     = 0x00000000,
    UCAL_GREGORIAN   = 0x00000001,
}

alias UCalendarDateFields = int;
enum : int
{
    UCAL_ERA                  = 0x00000000,
    UCAL_YEAR                 = 0x00000001,
    UCAL_MONTH                = 0x00000002,
    UCAL_WEEK_OF_YEAR         = 0x00000003,
    UCAL_WEEK_OF_MONTH        = 0x00000004,
    UCAL_DATE                 = 0x00000005,
    UCAL_DAY_OF_YEAR          = 0x00000006,
    UCAL_DAY_OF_WEEK          = 0x00000007,
    UCAL_DAY_OF_WEEK_IN_MONTH = 0x00000008,
    UCAL_AM_PM                = 0x00000009,
    UCAL_HOUR                 = 0x0000000a,
    UCAL_HOUR_OF_DAY          = 0x0000000b,
    UCAL_MINUTE               = 0x0000000c,
    UCAL_SECOND               = 0x0000000d,
    UCAL_MILLISECOND          = 0x0000000e,
    UCAL_ZONE_OFFSET          = 0x0000000f,
    UCAL_DST_OFFSET           = 0x00000010,
    UCAL_YEAR_WOY             = 0x00000011,
    UCAL_DOW_LOCAL            = 0x00000012,
    UCAL_EXTENDED_YEAR        = 0x00000013,
    UCAL_JULIAN_DAY           = 0x00000014,
    UCAL_MILLISECONDS_IN_DAY  = 0x00000015,
    UCAL_IS_LEAP_MONTH        = 0x00000016,
    UCAL_FIELD_COUNT          = 0x00000017,
    UCAL_DAY_OF_MONTH         = 0x00000005,
}

alias UCalendarDaysOfWeek = int;
enum : int
{
    UCAL_SUNDAY    = 0x00000001,
    UCAL_MONDAY    = 0x00000002,
    UCAL_TUESDAY   = 0x00000003,
    UCAL_WEDNESDAY = 0x00000004,
    UCAL_THURSDAY  = 0x00000005,
    UCAL_FRIDAY    = 0x00000006,
    UCAL_SATURDAY  = 0x00000007,
}

alias UCalendarMonths = int;
enum : int
{
    UCAL_JANUARY    = 0x00000000,
    UCAL_FEBRUARY   = 0x00000001,
    UCAL_MARCH      = 0x00000002,
    UCAL_APRIL      = 0x00000003,
    UCAL_MAY        = 0x00000004,
    UCAL_JUNE       = 0x00000005,
    UCAL_JULY       = 0x00000006,
    UCAL_AUGUST     = 0x00000007,
    UCAL_SEPTEMBER  = 0x00000008,
    UCAL_OCTOBER    = 0x00000009,
    UCAL_NOVEMBER   = 0x0000000a,
    UCAL_DECEMBER   = 0x0000000b,
    UCAL_UNDECIMBER = 0x0000000c,
}

alias UCalendarAMPMs = int;
enum : int
{
    UCAL_AM = 0x00000000,
    UCAL_PM = 0x00000001,
}

alias USystemTimeZoneType = int;
enum : int
{
    UCAL_ZONE_TYPE_ANY                = 0x00000000,
    UCAL_ZONE_TYPE_CANONICAL          = 0x00000001,
    UCAL_ZONE_TYPE_CANONICAL_LOCATION = 0x00000002,
}

alias UCalendarDisplayNameType = int;
enum : int
{
    UCAL_STANDARD       = 0x00000000,
    UCAL_SHORT_STANDARD = 0x00000001,
    UCAL_DST            = 0x00000002,
    UCAL_SHORT_DST      = 0x00000003,
}

alias UCalendarAttribute = int;
enum : int
{
    UCAL_LENIENT                    = 0x00000000,
    UCAL_FIRST_DAY_OF_WEEK          = 0x00000001,
    UCAL_MINIMAL_DAYS_IN_FIRST_WEEK = 0x00000002,
    UCAL_REPEATED_WALL_TIME         = 0x00000003,
    UCAL_SKIPPED_WALL_TIME          = 0x00000004,
}

alias UCalendarWallTimeOption = int;
enum : int
{
    UCAL_WALLTIME_LAST       = 0x00000000,
    UCAL_WALLTIME_FIRST      = 0x00000001,
    UCAL_WALLTIME_NEXT_VALID = 0x00000002,
}

alias UCalendarLimitType = int;
enum : int
{
    UCAL_MINIMUM          = 0x00000000,
    UCAL_MAXIMUM          = 0x00000001,
    UCAL_GREATEST_MINIMUM = 0x00000002,
    UCAL_LEAST_MAXIMUM    = 0x00000003,
    UCAL_ACTUAL_MINIMUM   = 0x00000004,
    UCAL_ACTUAL_MAXIMUM   = 0x00000005,
}

alias UCalendarWeekdayType = int;
enum : int
{
    UCAL_WEEKDAY       = 0x00000000,
    UCAL_WEEKEND       = 0x00000001,
    UCAL_WEEKEND_ONSET = 0x00000002,
    UCAL_WEEKEND_CEASE = 0x00000003,
}

alias UTimeZoneTransitionType = int;
enum : int
{
    UCAL_TZ_TRANSITION_NEXT               = 0x00000000,
    UCAL_TZ_TRANSITION_NEXT_INCLUSIVE     = 0x00000001,
    UCAL_TZ_TRANSITION_PREVIOUS           = 0x00000002,
    UCAL_TZ_TRANSITION_PREVIOUS_INCLUSIVE = 0x00000003,
}

alias UCollationResult = int;
enum : int
{
    UCOL_EQUAL   = 0x00000000,
    UCOL_GREATER = 0x00000001,
    UCOL_LESS    = 0xffffffff,
}

alias UColAttributeValue = int;
enum : int
{
    UCOL_DEFAULT           = 0xffffffff,
    UCOL_PRIMARY           = 0x00000000,
    UCOL_SECONDARY         = 0x00000001,
    UCOL_TERTIARY          = 0x00000002,
    UCOL_DEFAULT_STRENGTH  = 0x00000002,
    UCOL_CE_STRENGTH_LIMIT = 0x00000003,
    UCOL_QUATERNARY        = 0x00000003,
    UCOL_IDENTICAL         = 0x0000000f,
    UCOL_STRENGTH_LIMIT    = 0x00000010,
    UCOL_OFF               = 0x00000010,
    UCOL_ON                = 0x00000011,
    UCOL_SHIFTED           = 0x00000014,
    UCOL_NON_IGNORABLE     = 0x00000015,
    UCOL_LOWER_FIRST       = 0x00000018,
    UCOL_UPPER_FIRST       = 0x00000019,
}

alias UColReorderCode = int;
enum : int
{
    UCOL_REORDER_CODE_DEFAULT     = 0xffffffff,
    UCOL_REORDER_CODE_NONE        = 0x00000067,
    UCOL_REORDER_CODE_OTHERS      = 0x00000067,
    UCOL_REORDER_CODE_SPACE       = 0x00001000,
    UCOL_REORDER_CODE_FIRST       = 0x00001000,
    UCOL_REORDER_CODE_PUNCTUATION = 0x00001001,
    UCOL_REORDER_CODE_SYMBOL      = 0x00001002,
    UCOL_REORDER_CODE_CURRENCY    = 0x00001003,
    UCOL_REORDER_CODE_DIGIT       = 0x00001004,
}

alias UColAttribute = int;
enum : int
{
    UCOL_FRENCH_COLLATION   = 0x00000000,
    UCOL_ALTERNATE_HANDLING = 0x00000001,
    UCOL_CASE_FIRST         = 0x00000002,
    UCOL_CASE_LEVEL         = 0x00000003,
    UCOL_NORMALIZATION_MODE = 0x00000004,
    UCOL_DECOMPOSITION_MODE = 0x00000004,
    UCOL_STRENGTH           = 0x00000005,
    UCOL_NUMERIC_COLLATION  = 0x00000007,
    UCOL_ATTRIBUTE_COUNT    = 0x00000008,
}

alias UColRuleOption = int;
enum : int
{
    UCOL_TAILORING_ONLY = 0x00000000,
    UCOL_FULL_RULES     = 0x00000001,
}

alias UColBoundMode = int;
enum : int
{
    UCOL_BOUND_LOWER      = 0x00000000,
    UCOL_BOUND_UPPER      = 0x00000001,
    UCOL_BOUND_UPPER_LONG = 0x00000002,
}

alias UFormattableType = int;
enum : int
{
    UFMT_DATE   = 0x00000000,
    UFMT_DOUBLE = 0x00000001,
    UFMT_LONG   = 0x00000002,
    UFMT_STRING = 0x00000003,
    UFMT_ARRAY  = 0x00000004,
    UFMT_INT64  = 0x00000005,
    UFMT_OBJECT = 0x00000006,
}

alias UFieldCategory = int;
enum : int
{
    UFIELD_CATEGORY_UNDEFINED          = 0x00000000,
    UFIELD_CATEGORY_DATE               = 0x00000001,
    UFIELD_CATEGORY_NUMBER             = 0x00000002,
    UFIELD_CATEGORY_LIST               = 0x00000003,
    UFIELD_CATEGORY_RELATIVE_DATETIME  = 0x00000004,
    UFIELD_CATEGORY_DATE_INTERVAL      = 0x00000005,
    UFIELD_CATEGORY_LIST_SPAN          = 0x00001003,
    UFIELD_CATEGORY_DATE_INTERVAL_SPAN = 0x00001005,
}

alias UGender = int;
enum : int
{
    UGENDER_MALE   = 0x00000000,
    UGENDER_FEMALE = 0x00000001,
    UGENDER_OTHER  = 0x00000002,
}

alias UListFormatterField = int;
enum : int
{
    ULISTFMT_LITERAL_FIELD = 0x00000000,
    ULISTFMT_ELEMENT_FIELD = 0x00000001,
}

alias UListFormatterType = int;
enum : int
{
    ULISTFMT_TYPE_AND   = 0x00000000,
    ULISTFMT_TYPE_OR    = 0x00000001,
    ULISTFMT_TYPE_UNITS = 0x00000002,
}

alias UListFormatterWidth = int;
enum : int
{
    ULISTFMT_WIDTH_WIDE   = 0x00000000,
    ULISTFMT_WIDTH_SHORT  = 0x00000001,
    ULISTFMT_WIDTH_NARROW = 0x00000002,
}

alias ULocaleDataExemplarSetType = int;
enum : int
{
    ULOCDATA_ES_STANDARD    = 0x00000000,
    ULOCDATA_ES_AUXILIARY   = 0x00000001,
    ULOCDATA_ES_INDEX       = 0x00000002,
    ULOCDATA_ES_PUNCTUATION = 0x00000003,
}

alias ULocaleDataDelimiterType = int;
enum : int
{
    ULOCDATA_QUOTATION_START     = 0x00000000,
    ULOCDATA_QUOTATION_END       = 0x00000001,
    ULOCDATA_ALT_QUOTATION_START = 0x00000002,
    ULOCDATA_ALT_QUOTATION_END   = 0x00000003,
}

alias UMeasurementSystem = int;
enum : int
{
    UMS_SI  = 0x00000000,
    UMS_US  = 0x00000001,
    UMS_UK  = 0x00000002,
}

alias UNumberFormatStyle = int;
enum : int
{
    UNUM_PATTERN_DECIMAL       = 0x00000000,
    UNUM_DECIMAL               = 0x00000001,
    UNUM_CURRENCY              = 0x00000002,
    UNUM_PERCENT               = 0x00000003,
    UNUM_SCIENTIFIC            = 0x00000004,
    UNUM_SPELLOUT              = 0x00000005,
    UNUM_ORDINAL               = 0x00000006,
    UNUM_DURATION              = 0x00000007,
    UNUM_NUMBERING_SYSTEM      = 0x00000008,
    UNUM_PATTERN_RULEBASED     = 0x00000009,
    UNUM_CURRENCY_ISO          = 0x0000000a,
    UNUM_CURRENCY_PLURAL       = 0x0000000b,
    UNUM_CURRENCY_ACCOUNTING   = 0x0000000c,
    UNUM_CASH_CURRENCY         = 0x0000000d,
    UNUM_DECIMAL_COMPACT_SHORT = 0x0000000e,
    UNUM_DECIMAL_COMPACT_LONG  = 0x0000000f,
    UNUM_CURRENCY_STANDARD     = 0x00000010,
    UNUM_DEFAULT               = 0x00000001,
    UNUM_IGNORE                = 0x00000000,
}

alias UNumberFormatRoundingMode = int;
enum : int
{
    UNUM_ROUND_CEILING     = 0x00000000,
    UNUM_ROUND_FLOOR       = 0x00000001,
    UNUM_ROUND_DOWN        = 0x00000002,
    UNUM_ROUND_UP          = 0x00000003,
    UNUM_ROUND_HALFEVEN    = 0x00000004,
    UNUM_ROUND_HALFDOWN    = 0x00000005,
    UNUM_ROUND_HALFUP      = 0x00000006,
    UNUM_ROUND_UNNECESSARY = 0x00000007,
}

alias UNumberFormatPadPosition = int;
enum : int
{
    UNUM_PAD_BEFORE_PREFIX = 0x00000000,
    UNUM_PAD_AFTER_PREFIX  = 0x00000001,
    UNUM_PAD_BEFORE_SUFFIX = 0x00000002,
    UNUM_PAD_AFTER_SUFFIX  = 0x00000003,
}

alias UNumberCompactStyle = int;
enum : int
{
    UNUM_SHORT = 0x00000000,
    UNUM_LONG  = 0x00000001,
}

alias UCurrencySpacing = int;
enum : int
{
    UNUM_CURRENCY_MATCH             = 0x00000000,
    UNUM_CURRENCY_SURROUNDING_MATCH = 0x00000001,
    UNUM_CURRENCY_INSERT            = 0x00000002,
    UNUM_CURRENCY_SPACING_COUNT     = 0x00000003,
}

alias UNumberFormatFields = int;
enum : int
{
    UNUM_INTEGER_FIELD            = 0x00000000,
    UNUM_FRACTION_FIELD           = 0x00000001,
    UNUM_DECIMAL_SEPARATOR_FIELD  = 0x00000002,
    UNUM_EXPONENT_SYMBOL_FIELD    = 0x00000003,
    UNUM_EXPONENT_SIGN_FIELD      = 0x00000004,
    UNUM_EXPONENT_FIELD           = 0x00000005,
    UNUM_GROUPING_SEPARATOR_FIELD = 0x00000006,
    UNUM_CURRENCY_FIELD           = 0x00000007,
    UNUM_PERCENT_FIELD            = 0x00000008,
    UNUM_PERMILL_FIELD            = 0x00000009,
    UNUM_SIGN_FIELD               = 0x0000000a,
    UNUM_MEASURE_UNIT_FIELD       = 0x0000000b,
    UNUM_COMPACT_FIELD            = 0x0000000c,
}

alias UNumberFormatAttributeValue = int;
enum : int
{
    UNUM_FORMAT_ATTRIBUTE_VALUE_HIDDEN = 0x00000000,
}

alias UNumberFormatAttribute = int;
enum : int
{
    UNUM_PARSE_INT_ONLY                      = 0x00000000,
    UNUM_GROUPING_USED                       = 0x00000001,
    UNUM_DECIMAL_ALWAYS_SHOWN                = 0x00000002,
    UNUM_MAX_INTEGER_DIGITS                  = 0x00000003,
    UNUM_MIN_INTEGER_DIGITS                  = 0x00000004,
    UNUM_INTEGER_DIGITS                      = 0x00000005,
    UNUM_MAX_FRACTION_DIGITS                 = 0x00000006,
    UNUM_MIN_FRACTION_DIGITS                 = 0x00000007,
    UNUM_FRACTION_DIGITS                     = 0x00000008,
    UNUM_MULTIPLIER                          = 0x00000009,
    UNUM_GROUPING_SIZE                       = 0x0000000a,
    UNUM_ROUNDING_MODE                       = 0x0000000b,
    UNUM_ROUNDING_INCREMENT                  = 0x0000000c,
    UNUM_FORMAT_WIDTH                        = 0x0000000d,
    UNUM_PADDING_POSITION                    = 0x0000000e,
    UNUM_SECONDARY_GROUPING_SIZE             = 0x0000000f,
    UNUM_SIGNIFICANT_DIGITS_USED             = 0x00000010,
    UNUM_MIN_SIGNIFICANT_DIGITS              = 0x00000011,
    UNUM_MAX_SIGNIFICANT_DIGITS              = 0x00000012,
    UNUM_LENIENT_PARSE                       = 0x00000013,
    UNUM_PARSE_ALL_INPUT                     = 0x00000014,
    UNUM_SCALE                               = 0x00000015,
    UNUM_MINIMUM_GROUPING_DIGITS             = 0x00000016,
    UNUM_CURRENCY_USAGE                      = 0x00000017,
    UNUM_FORMAT_FAIL_IF_MORE_THAN_MAX_DIGITS = 0x00001000,
    UNUM_PARSE_NO_EXPONENT                   = 0x00001001,
    UNUM_PARSE_DECIMAL_MARK_REQUIRED         = 0x00001002,
    UNUM_PARSE_CASE_SENSITIVE                = 0x00001003,
    UNUM_SIGN_ALWAYS_SHOWN                   = 0x00001004,
}

alias UNumberFormatTextAttribute = int;
enum : int
{
    UNUM_POSITIVE_PREFIX   = 0x00000000,
    UNUM_POSITIVE_SUFFIX   = 0x00000001,
    UNUM_NEGATIVE_PREFIX   = 0x00000002,
    UNUM_NEGATIVE_SUFFIX   = 0x00000003,
    UNUM_PADDING_CHARACTER = 0x00000004,
    UNUM_CURRENCY_CODE     = 0x00000005,
    UNUM_DEFAULT_RULESET   = 0x00000006,
    UNUM_PUBLIC_RULESETS   = 0x00000007,
}

alias UNumberFormatSymbol = int;
enum : int
{
    UNUM_DECIMAL_SEPARATOR_SYMBOL           = 0x00000000,
    UNUM_GROUPING_SEPARATOR_SYMBOL          = 0x00000001,
    UNUM_PATTERN_SEPARATOR_SYMBOL           = 0x00000002,
    UNUM_PERCENT_SYMBOL                     = 0x00000003,
    UNUM_ZERO_DIGIT_SYMBOL                  = 0x00000004,
    UNUM_DIGIT_SYMBOL                       = 0x00000005,
    UNUM_MINUS_SIGN_SYMBOL                  = 0x00000006,
    UNUM_PLUS_SIGN_SYMBOL                   = 0x00000007,
    UNUM_CURRENCY_SYMBOL                    = 0x00000008,
    UNUM_INTL_CURRENCY_SYMBOL               = 0x00000009,
    UNUM_MONETARY_SEPARATOR_SYMBOL          = 0x0000000a,
    UNUM_EXPONENTIAL_SYMBOL                 = 0x0000000b,
    UNUM_PERMILL_SYMBOL                     = 0x0000000c,
    UNUM_PAD_ESCAPE_SYMBOL                  = 0x0000000d,
    UNUM_INFINITY_SYMBOL                    = 0x0000000e,
    UNUM_NAN_SYMBOL                         = 0x0000000f,
    UNUM_SIGNIFICANT_DIGIT_SYMBOL           = 0x00000010,
    UNUM_MONETARY_GROUPING_SEPARATOR_SYMBOL = 0x00000011,
    UNUM_ONE_DIGIT_SYMBOL                   = 0x00000012,
    UNUM_TWO_DIGIT_SYMBOL                   = 0x00000013,
    UNUM_THREE_DIGIT_SYMBOL                 = 0x00000014,
    UNUM_FOUR_DIGIT_SYMBOL                  = 0x00000015,
    UNUM_FIVE_DIGIT_SYMBOL                  = 0x00000016,
    UNUM_SIX_DIGIT_SYMBOL                   = 0x00000017,
    UNUM_SEVEN_DIGIT_SYMBOL                 = 0x00000018,
    UNUM_EIGHT_DIGIT_SYMBOL                 = 0x00000019,
    UNUM_NINE_DIGIT_SYMBOL                  = 0x0000001a,
    UNUM_EXPONENT_MULTIPLICATION_SYMBOL     = 0x0000001b,
}

alias UDateFormatStyle = int;
enum : int
{
    UDAT_FULL            = 0x00000000,
    UDAT_LONG            = 0x00000001,
    UDAT_MEDIUM          = 0x00000002,
    UDAT_SHORT           = 0x00000003,
    UDAT_DEFAULT         = 0x00000002,
    UDAT_RELATIVE        = 0x00000080,
    UDAT_FULL_RELATIVE   = 0x00000080,
    UDAT_LONG_RELATIVE   = 0x00000081,
    UDAT_MEDIUM_RELATIVE = 0x00000082,
    UDAT_SHORT_RELATIVE  = 0x00000083,
    UDAT_NONE            = 0xffffffff,
    UDAT_PATTERN         = 0xfffffffe,
}

alias UDateFormatField = int;
enum : int
{
    UDAT_ERA_FIELD                           = 0x00000000,
    UDAT_YEAR_FIELD                          = 0x00000001,
    UDAT_MONTH_FIELD                         = 0x00000002,
    UDAT_DATE_FIELD                          = 0x00000003,
    UDAT_HOUR_OF_DAY1_FIELD                  = 0x00000004,
    UDAT_HOUR_OF_DAY0_FIELD                  = 0x00000005,
    UDAT_MINUTE_FIELD                        = 0x00000006,
    UDAT_SECOND_FIELD                        = 0x00000007,
    UDAT_FRACTIONAL_SECOND_FIELD             = 0x00000008,
    UDAT_DAY_OF_WEEK_FIELD                   = 0x00000009,
    UDAT_DAY_OF_YEAR_FIELD                   = 0x0000000a,
    UDAT_DAY_OF_WEEK_IN_MONTH_FIELD          = 0x0000000b,
    UDAT_WEEK_OF_YEAR_FIELD                  = 0x0000000c,
    UDAT_WEEK_OF_MONTH_FIELD                 = 0x0000000d,
    UDAT_AM_PM_FIELD                         = 0x0000000e,
    UDAT_HOUR1_FIELD                         = 0x0000000f,
    UDAT_HOUR0_FIELD                         = 0x00000010,
    UDAT_TIMEZONE_FIELD                      = 0x00000011,
    UDAT_YEAR_WOY_FIELD                      = 0x00000012,
    UDAT_DOW_LOCAL_FIELD                     = 0x00000013,
    UDAT_EXTENDED_YEAR_FIELD                 = 0x00000014,
    UDAT_JULIAN_DAY_FIELD                    = 0x00000015,
    UDAT_MILLISECONDS_IN_DAY_FIELD           = 0x00000016,
    UDAT_TIMEZONE_RFC_FIELD                  = 0x00000017,
    UDAT_TIMEZONE_GENERIC_FIELD              = 0x00000018,
    UDAT_STANDALONE_DAY_FIELD                = 0x00000019,
    UDAT_STANDALONE_MONTH_FIELD              = 0x0000001a,
    UDAT_QUARTER_FIELD                       = 0x0000001b,
    UDAT_STANDALONE_QUARTER_FIELD            = 0x0000001c,
    UDAT_TIMEZONE_SPECIAL_FIELD              = 0x0000001d,
    UDAT_YEAR_NAME_FIELD                     = 0x0000001e,
    UDAT_TIMEZONE_LOCALIZED_GMT_OFFSET_FIELD = 0x0000001f,
    UDAT_TIMEZONE_ISO_FIELD                  = 0x00000020,
    UDAT_TIMEZONE_ISO_LOCAL_FIELD            = 0x00000021,
    UDAT_AM_PM_MIDNIGHT_NOON_FIELD           = 0x00000023,
    UDAT_FLEXIBLE_DAY_PERIOD_FIELD           = 0x00000024,
}

alias UDateFormatBooleanAttribute = int;
enum : int
{
    UDAT_PARSE_ALLOW_WHITESPACE            = 0x00000000,
    UDAT_PARSE_ALLOW_NUMERIC               = 0x00000001,
    UDAT_PARSE_PARTIAL_LITERAL_MATCH       = 0x00000002,
    UDAT_PARSE_MULTIPLE_PATTERNS_FOR_MATCH = 0x00000003,
    UDAT_BOOLEAN_ATTRIBUTE_COUNT           = 0x00000004,
}

alias UDateFormatSymbolType = int;
enum : int
{
    UDAT_ERAS                        = 0x00000000,
    UDAT_MONTHS                      = 0x00000001,
    UDAT_SHORT_MONTHS                = 0x00000002,
    UDAT_WEEKDAYS                    = 0x00000003,
    UDAT_SHORT_WEEKDAYS              = 0x00000004,
    UDAT_AM_PMS                      = 0x00000005,
    UDAT_LOCALIZED_CHARS             = 0x00000006,
    UDAT_ERA_NAMES                   = 0x00000007,
    UDAT_NARROW_MONTHS               = 0x00000008,
    UDAT_NARROW_WEEKDAYS             = 0x00000009,
    UDAT_STANDALONE_MONTHS           = 0x0000000a,
    UDAT_STANDALONE_SHORT_MONTHS     = 0x0000000b,
    UDAT_STANDALONE_NARROW_MONTHS    = 0x0000000c,
    UDAT_STANDALONE_WEEKDAYS         = 0x0000000d,
    UDAT_STANDALONE_SHORT_WEEKDAYS   = 0x0000000e,
    UDAT_STANDALONE_NARROW_WEEKDAYS  = 0x0000000f,
    UDAT_QUARTERS                    = 0x00000010,
    UDAT_SHORT_QUARTERS              = 0x00000011,
    UDAT_STANDALONE_QUARTERS         = 0x00000012,
    UDAT_STANDALONE_SHORT_QUARTERS   = 0x00000013,
    UDAT_SHORTER_WEEKDAYS            = 0x00000014,
    UDAT_STANDALONE_SHORTER_WEEKDAYS = 0x00000015,
    UDAT_CYCLIC_YEARS_WIDE           = 0x00000016,
    UDAT_CYCLIC_YEARS_ABBREVIATED    = 0x00000017,
    UDAT_CYCLIC_YEARS_NARROW         = 0x00000018,
    UDAT_ZODIAC_NAMES_WIDE           = 0x00000019,
    UDAT_ZODIAC_NAMES_ABBREVIATED    = 0x0000001a,
    UDAT_ZODIAC_NAMES_NARROW         = 0x0000001b,
}

alias UDateTimePatternField = int;
enum : int
{
    UDATPG_ERA_FIELD                  = 0x00000000,
    UDATPG_YEAR_FIELD                 = 0x00000001,
    UDATPG_QUARTER_FIELD              = 0x00000002,
    UDATPG_MONTH_FIELD                = 0x00000003,
    UDATPG_WEEK_OF_YEAR_FIELD         = 0x00000004,
    UDATPG_WEEK_OF_MONTH_FIELD        = 0x00000005,
    UDATPG_WEEKDAY_FIELD              = 0x00000006,
    UDATPG_DAY_OF_YEAR_FIELD          = 0x00000007,
    UDATPG_DAY_OF_WEEK_IN_MONTH_FIELD = 0x00000008,
    UDATPG_DAY_FIELD                  = 0x00000009,
    UDATPG_DAYPERIOD_FIELD            = 0x0000000a,
    UDATPG_HOUR_FIELD                 = 0x0000000b,
    UDATPG_MINUTE_FIELD               = 0x0000000c,
    UDATPG_SECOND_FIELD               = 0x0000000d,
    UDATPG_FRACTIONAL_SECOND_FIELD    = 0x0000000e,
    UDATPG_ZONE_FIELD                 = 0x0000000f,
    UDATPG_FIELD_COUNT                = 0x00000010,
}

alias UDateTimePGDisplayWidth = int;
enum : int
{
    UDATPG_WIDE        = 0x00000000,
    UDATPG_ABBREVIATED = 0x00000001,
    UDATPG_NARROW      = 0x00000002,
}

alias UDateTimePatternMatchOptions = int;
enum : int
{
    UDATPG_MATCH_NO_OPTIONS        = 0x00000000,
    UDATPG_MATCH_HOUR_FIELD_LENGTH = 0x00000800,
    UDATPG_MATCH_ALL_FIELDS_LENGTH = 0x0000ffff,
}

alias UDateTimePatternConflict = int;
enum : int
{
    UDATPG_NO_CONFLICT   = 0x00000000,
    UDATPG_BASE_CONFLICT = 0x00000001,
    UDATPG_CONFLICT      = 0x00000002,
}

alias UNumberUnitWidth = int;
enum : int
{
    UNUM_UNIT_WIDTH_NARROW    = 0x00000000,
    UNUM_UNIT_WIDTH_SHORT     = 0x00000001,
    UNUM_UNIT_WIDTH_FULL_NAME = 0x00000002,
    UNUM_UNIT_WIDTH_ISO_CODE  = 0x00000003,
    UNUM_UNIT_WIDTH_HIDDEN    = 0x00000004,
    UNUM_UNIT_WIDTH_COUNT     = 0x00000005,
}

alias UNumberGroupingStrategy = int;
enum : int
{
    UNUM_GROUPING_OFF        = 0x00000000,
    UNUM_GROUPING_MIN2       = 0x00000001,
    UNUM_GROUPING_AUTO       = 0x00000002,
    UNUM_GROUPING_ON_ALIGNED = 0x00000003,
    UNUM_GROUPING_THOUSANDS  = 0x00000004,
}

alias UNumberSignDisplay = int;
enum : int
{
    UNUM_SIGN_AUTO                   = 0x00000000,
    UNUM_SIGN_ALWAYS                 = 0x00000001,
    UNUM_SIGN_NEVER                  = 0x00000002,
    UNUM_SIGN_ACCOUNTING             = 0x00000003,
    UNUM_SIGN_ACCOUNTING_ALWAYS      = 0x00000004,
    UNUM_SIGN_EXCEPT_ZERO            = 0x00000005,
    UNUM_SIGN_ACCOUNTING_EXCEPT_ZERO = 0x00000006,
    UNUM_SIGN_COUNT                  = 0x00000007,
}

alias UNumberDecimalSeparatorDisplay = int;
enum : int
{
    UNUM_DECIMAL_SEPARATOR_AUTO   = 0x00000000,
    UNUM_DECIMAL_SEPARATOR_ALWAYS = 0x00000001,
    UNUM_DECIMAL_SEPARATOR_COUNT  = 0x00000002,
}

alias UNumberRangeCollapse = int;
enum : int
{
    UNUM_RANGE_COLLAPSE_AUTO = 0x00000000,
    UNUM_RANGE_COLLAPSE_NONE = 0x00000001,
    UNUM_RANGE_COLLAPSE_UNIT = 0x00000002,
    UNUM_RANGE_COLLAPSE_ALL  = 0x00000003,
}

alias UNumberRangeIdentityFallback = int;
enum : int
{
    UNUM_IDENTITY_FALLBACK_SINGLE_VALUE                  = 0x00000000,
    UNUM_IDENTITY_FALLBACK_APPROXIMATELY_OR_SINGLE_VALUE = 0x00000001,
    UNUM_IDENTITY_FALLBACK_APPROXIMATELY                 = 0x00000002,
    UNUM_IDENTITY_FALLBACK_RANGE                         = 0x00000003,
}

alias UNumberRangeIdentityResult = int;
enum : int
{
    UNUM_IDENTITY_RESULT_EQUAL_BEFORE_ROUNDING = 0x00000000,
    UNUM_IDENTITY_RESULT_EQUAL_AFTER_ROUNDING  = 0x00000001,
    UNUM_IDENTITY_RESULT_NOT_EQUAL             = 0x00000002,
}

alias UPluralType = int;
enum : int
{
    UPLURAL_TYPE_CARDINAL = 0x00000000,
    UPLURAL_TYPE_ORDINAL  = 0x00000001,
}

alias URegexpFlag = int;
enum : int
{
    UREGEX_CASE_INSENSITIVE         = 0x00000002,
    UREGEX_COMMENTS                 = 0x00000004,
    UREGEX_DOTALL                   = 0x00000020,
    UREGEX_LITERAL                  = 0x00000010,
    UREGEX_MULTILINE                = 0x00000008,
    UREGEX_UNIX_LINES               = 0x00000001,
    UREGEX_UWORD                    = 0x00000100,
    UREGEX_ERROR_ON_UNKNOWN_ESCAPES = 0x00000200,
}

alias URegexMatchCallback = byte function(const(void)*, int);
alias URegexFindProgressCallback = byte function(const(void)*, long);
alias URegionType = int;
enum : int
{
    URGN_UNKNOWN      = 0x00000000,
    URGN_TERRITORY    = 0x00000001,
    URGN_WORLD        = 0x00000002,
    URGN_CONTINENT    = 0x00000003,
    URGN_SUBCONTINENT = 0x00000004,
    URGN_GROUPING     = 0x00000005,
    URGN_DEPRECATED   = 0x00000006,
}

alias UDateRelativeDateTimeFormatterStyle = int;
enum : int
{
    UDAT_STYLE_LONG   = 0x00000000,
    UDAT_STYLE_SHORT  = 0x00000001,
    UDAT_STYLE_NARROW = 0x00000002,
}

alias URelativeDateTimeUnit = int;
enum : int
{
    UDAT_REL_UNIT_YEAR      = 0x00000000,
    UDAT_REL_UNIT_QUARTER   = 0x00000001,
    UDAT_REL_UNIT_MONTH     = 0x00000002,
    UDAT_REL_UNIT_WEEK      = 0x00000003,
    UDAT_REL_UNIT_DAY       = 0x00000004,
    UDAT_REL_UNIT_HOUR      = 0x00000005,
    UDAT_REL_UNIT_MINUTE    = 0x00000006,
    UDAT_REL_UNIT_SECOND    = 0x00000007,
    UDAT_REL_UNIT_SUNDAY    = 0x00000008,
    UDAT_REL_UNIT_MONDAY    = 0x00000009,
    UDAT_REL_UNIT_TUESDAY   = 0x0000000a,
    UDAT_REL_UNIT_WEDNESDAY = 0x0000000b,
    UDAT_REL_UNIT_THURSDAY  = 0x0000000c,
    UDAT_REL_UNIT_FRIDAY    = 0x0000000d,
    UDAT_REL_UNIT_SATURDAY  = 0x0000000e,
}

alias URelativeDateTimeFormatterField = int;
enum : int
{
    UDAT_REL_LITERAL_FIELD = 0x00000000,
    UDAT_REL_NUMERIC_FIELD = 0x00000001,
}

alias USearchAttribute = int;
enum : int
{
    USEARCH_OVERLAP            = 0x00000000,
    USEARCH_ELEMENT_COMPARISON = 0x00000002,
}

alias USearchAttributeValue = int;
enum : int
{
    USEARCH_DEFAULT                         = 0xffffffff,
    USEARCH_OFF                             = 0x00000000,
    USEARCH_ON                              = 0x00000001,
    USEARCH_STANDARD_ELEMENT_COMPARISON     = 0x00000002,
    USEARCH_PATTERN_BASE_WEIGHT_IS_WILDCARD = 0x00000003,
    USEARCH_ANY_BASE_WEIGHT_IS_WILDCARD     = 0x00000004,
}

alias USpoofChecks = int;
enum : int
{
    USPOOF_SINGLE_SCRIPT_CONFUSABLE = 0x00000001,
    USPOOF_MIXED_SCRIPT_CONFUSABLE  = 0x00000002,
    USPOOF_WHOLE_SCRIPT_CONFUSABLE  = 0x00000004,
    USPOOF_CONFUSABLE               = 0x00000007,
    USPOOF_RESTRICTION_LEVEL        = 0x00000010,
    USPOOF_INVISIBLE                = 0x00000020,
    USPOOF_CHAR_LIMIT               = 0x00000040,
    USPOOF_MIXED_NUMBERS            = 0x00000080,
    USPOOF_HIDDEN_OVERLAY           = 0x00000100,
    USPOOF_ALL_CHECKS               = 0x0000ffff,
    USPOOF_AUX_INFO                 = 0x40000000,
}

alias URestrictionLevel = int;
enum : int
{
    USPOOF_ASCII                     = 0x10000000,
    USPOOF_SINGLE_SCRIPT_RESTRICTIVE = 0x20000000,
    USPOOF_HIGHLY_RESTRICTIVE        = 0x30000000,
    USPOOF_MODERATELY_RESTRICTIVE    = 0x40000000,
    USPOOF_MINIMALLY_RESTRICTIVE     = 0x50000000,
    USPOOF_UNRESTRICTIVE             = 0x60000000,
    USPOOF_RESTRICTION_LEVEL_MASK    = 0x7f000000,
}

alias UDateTimeScale = int;
enum : int
{
    UDTS_JAVA_TIME              = 0x00000000,
    UDTS_UNIX_TIME              = 0x00000001,
    UDTS_ICU4C_TIME             = 0x00000002,
    UDTS_WINDOWS_FILE_TIME      = 0x00000003,
    UDTS_DOTNET_DATE_TIME       = 0x00000004,
    UDTS_MAC_OLD_TIME           = 0x00000005,
    UDTS_MAC_TIME               = 0x00000006,
    UDTS_EXCEL_TIME             = 0x00000007,
    UDTS_DB2_TIME               = 0x00000008,
    UDTS_UNIX_MICROSECONDS_TIME = 0x00000009,
}

alias UTimeScaleValue = int;
enum : int
{
    UTSV_UNITS_VALUE        = 0x00000000,
    UTSV_EPOCH_OFFSET_VALUE = 0x00000001,
    UTSV_FROM_MIN_VALUE     = 0x00000002,
    UTSV_FROM_MAX_VALUE     = 0x00000003,
    UTSV_TO_MIN_VALUE       = 0x00000004,
    UTSV_TO_MAX_VALUE       = 0x00000005,
}

alias UTransDirection = int;
enum : int
{
    UTRANS_FORWARD = 0x00000000,
    UTRANS_REVERSE = 0x00000001,
}

struct UTransPosition
{
    int contextStart;
    int contextLimit;
    int start;
    int limit;
}
alias UStringTrieBuildOption = int;
enum : int
{
    USTRINGTRIE_BUILD_FAST  = 0x00000000,
    USTRINGTRIE_BUILD_SMALL = 0x00000001,
}

alias UStringCaseMapper = int function(const(UCaseMap)*, ushort*, int, const(ushort)*, int, UErrorCode*);
alias UMessagePatternApostropheMode = int;
enum : int
{
    UMSGPAT_APOS_DOUBLE_OPTIONAL = 0x00000000,
    UMSGPAT_APOS_DOUBLE_REQUIRED = 0x00000001,
}

alias UMessagePatternPartType = int;
enum : int
{
    UMSGPAT_PART_TYPE_MSG_START      = 0x00000000,
    UMSGPAT_PART_TYPE_MSG_LIMIT      = 0x00000001,
    UMSGPAT_PART_TYPE_SKIP_SYNTAX    = 0x00000002,
    UMSGPAT_PART_TYPE_INSERT_CHAR    = 0x00000003,
    UMSGPAT_PART_TYPE_REPLACE_NUMBER = 0x00000004,
    UMSGPAT_PART_TYPE_ARG_START      = 0x00000005,
    UMSGPAT_PART_TYPE_ARG_LIMIT      = 0x00000006,
    UMSGPAT_PART_TYPE_ARG_NUMBER     = 0x00000007,
    UMSGPAT_PART_TYPE_ARG_NAME       = 0x00000008,
    UMSGPAT_PART_TYPE_ARG_TYPE       = 0x00000009,
    UMSGPAT_PART_TYPE_ARG_STYLE      = 0x0000000a,
    UMSGPAT_PART_TYPE_ARG_SELECTOR   = 0x0000000b,
    UMSGPAT_PART_TYPE_ARG_INT        = 0x0000000c,
    UMSGPAT_PART_TYPE_ARG_DOUBLE     = 0x0000000d,
}

alias UMessagePatternArgType = int;
enum : int
{
    UMSGPAT_ARG_TYPE_NONE          = 0x00000000,
    UMSGPAT_ARG_TYPE_SIMPLE        = 0x00000001,
    UMSGPAT_ARG_TYPE_CHOICE        = 0x00000002,
    UMSGPAT_ARG_TYPE_PLURAL        = 0x00000003,
    UMSGPAT_ARG_TYPE_SELECT        = 0x00000004,
    UMSGPAT_ARG_TYPE_SELECTORDINAL = 0x00000005,
}

alias UAlphabeticIndexLabelType = int;
enum : int
{
    U_ALPHAINDEX_NORMAL    = 0x00000000,
    U_ALPHAINDEX_UNDERFLOW = 0x00000001,
    U_ALPHAINDEX_INFLOW    = 0x00000002,
    U_ALPHAINDEX_OVERFLOW  = 0x00000003,
}

alias UTimeZoneNameType = int;
enum : int
{
    UTZNM_UNKNOWN           = 0x00000000,
    UTZNM_LONG_GENERIC      = 0x00000001,
    UTZNM_LONG_STANDARD     = 0x00000002,
    UTZNM_LONG_DAYLIGHT     = 0x00000004,
    UTZNM_SHORT_GENERIC     = 0x00000008,
    UTZNM_SHORT_STANDARD    = 0x00000010,
    UTZNM_SHORT_DAYLIGHT    = 0x00000020,
    UTZNM_EXEMPLAR_LOCATION = 0x00000040,
}

alias UTimeZoneFormatStyle = int;
enum : int
{
    UTZFMT_STYLE_GENERIC_LOCATION         = 0x00000000,
    UTZFMT_STYLE_GENERIC_LONG             = 0x00000001,
    UTZFMT_STYLE_GENERIC_SHORT            = 0x00000002,
    UTZFMT_STYLE_SPECIFIC_LONG            = 0x00000003,
    UTZFMT_STYLE_SPECIFIC_SHORT           = 0x00000004,
    UTZFMT_STYLE_LOCALIZED_GMT            = 0x00000005,
    UTZFMT_STYLE_LOCALIZED_GMT_SHORT      = 0x00000006,
    UTZFMT_STYLE_ISO_BASIC_SHORT          = 0x00000007,
    UTZFMT_STYLE_ISO_BASIC_LOCAL_SHORT    = 0x00000008,
    UTZFMT_STYLE_ISO_BASIC_FIXED          = 0x00000009,
    UTZFMT_STYLE_ISO_BASIC_LOCAL_FIXED    = 0x0000000a,
    UTZFMT_STYLE_ISO_BASIC_FULL           = 0x0000000b,
    UTZFMT_STYLE_ISO_BASIC_LOCAL_FULL     = 0x0000000c,
    UTZFMT_STYLE_ISO_EXTENDED_FIXED       = 0x0000000d,
    UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FIXED = 0x0000000e,
    UTZFMT_STYLE_ISO_EXTENDED_FULL        = 0x0000000f,
    UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FULL  = 0x00000010,
    UTZFMT_STYLE_ZONE_ID                  = 0x00000011,
    UTZFMT_STYLE_ZONE_ID_SHORT            = 0x00000012,
    UTZFMT_STYLE_EXEMPLAR_LOCATION        = 0x00000013,
}

alias UTimeZoneFormatGMTOffsetPatternType = int;
enum : int
{
    UTZFMT_PAT_POSITIVE_HM  = 0x00000000,
    UTZFMT_PAT_POSITIVE_HMS = 0x00000001,
    UTZFMT_PAT_NEGATIVE_HM  = 0x00000002,
    UTZFMT_PAT_NEGATIVE_HMS = 0x00000003,
    UTZFMT_PAT_POSITIVE_H   = 0x00000004,
    UTZFMT_PAT_NEGATIVE_H   = 0x00000005,
    UTZFMT_PAT_COUNT        = 0x00000006,
}

alias UTimeZoneFormatTimeType = int;
enum : int
{
    UTZFMT_TIME_TYPE_UNKNOWN  = 0x00000000,
    UTZFMT_TIME_TYPE_STANDARD = 0x00000001,
    UTZFMT_TIME_TYPE_DAYLIGHT = 0x00000002,
}

alias UTimeZoneFormatParseOption = int;
enum : int
{
    UTZFMT_PARSE_OPTION_NONE                      = 0x00000000,
    UTZFMT_PARSE_OPTION_ALL_STYLES                = 0x00000001,
    UTZFMT_PARSE_OPTION_TZ_DATABASE_ABBREVIATIONS = 0x00000002,
}

alias UMeasureFormatWidth = int;
enum : int
{
    UMEASFMT_WIDTH_WIDE    = 0x00000000,
    UMEASFMT_WIDTH_SHORT   = 0x00000001,
    UMEASFMT_WIDTH_NARROW  = 0x00000002,
    UMEASFMT_WIDTH_NUMERIC = 0x00000003,
    UMEASFMT_WIDTH_COUNT   = 0x00000004,
}

alias UDateRelativeUnit = int;
enum : int
{
    UDAT_RELATIVE_SECONDS    = 0x00000000,
    UDAT_RELATIVE_MINUTES    = 0x00000001,
    UDAT_RELATIVE_HOURS      = 0x00000002,
    UDAT_RELATIVE_DAYS       = 0x00000003,
    UDAT_RELATIVE_WEEKS      = 0x00000004,
    UDAT_RELATIVE_MONTHS     = 0x00000005,
    UDAT_RELATIVE_YEARS      = 0x00000006,
    UDAT_RELATIVE_UNIT_COUNT = 0x00000007,
}

alias UDateAbsoluteUnit = int;
enum : int
{
    UDAT_ABSOLUTE_SUNDAY     = 0x00000000,
    UDAT_ABSOLUTE_MONDAY     = 0x00000001,
    UDAT_ABSOLUTE_TUESDAY    = 0x00000002,
    UDAT_ABSOLUTE_WEDNESDAY  = 0x00000003,
    UDAT_ABSOLUTE_THURSDAY   = 0x00000004,
    UDAT_ABSOLUTE_FRIDAY     = 0x00000005,
    UDAT_ABSOLUTE_SATURDAY   = 0x00000006,
    UDAT_ABSOLUTE_DAY        = 0x00000007,
    UDAT_ABSOLUTE_WEEK       = 0x00000008,
    UDAT_ABSOLUTE_MONTH      = 0x00000009,
    UDAT_ABSOLUTE_YEAR       = 0x0000000a,
    UDAT_ABSOLUTE_NOW        = 0x0000000b,
    UDAT_ABSOLUTE_UNIT_COUNT = 0x0000000c,
}

alias UDateDirection = int;
enum : int
{
    UDAT_DIRECTION_LAST_2 = 0x00000000,
    UDAT_DIRECTION_LAST   = 0x00000001,
    UDAT_DIRECTION_THIS   = 0x00000002,
    UDAT_DIRECTION_NEXT   = 0x00000003,
    UDAT_DIRECTION_NEXT_2 = 0x00000004,
    UDAT_DIRECTION_PLAIN  = 0x00000005,
    UDAT_DIRECTION_COUNT  = 0x00000006,
}

enum IID_IMLangStringBufW = GUID(0xd24acd21, 0xba72, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangStringBufW : IUnknown
{
    HRESULT GetStatus(int*, int*);
    HRESULT LockBuf(int, int, ushort**, int*);
    HRESULT UnlockBuf(const(wchar)*, int, int);
    HRESULT Insert(int, int, int*);
    HRESULT Delete(int, int);
}
enum IID_IMLangStringBufA = GUID(0xd24acd23, 0xba72, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangStringBufA : IUnknown
{
    HRESULT GetStatus(int*, int*);
    HRESULT LockBuf(int, int, CHAR**, int*);
    HRESULT UnlockBuf(const(char)*, int, int);
    HRESULT Insert(int, int, int*);
    HRESULT Delete(int, int);
}
enum IID_IMLangString = GUID(0xc04d65ce, 0xb70d, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangString : IUnknown
{
    HRESULT Sync(BOOL);
    HRESULT GetLength(int*);
    HRESULT SetMLStr(int, int, IUnknown, int, int);
    HRESULT GetMLStr(int, int, IUnknown, uint, const(GUID)*, IUnknown*, int*, int*);
}
enum IID_IMLangStringWStr = GUID(0xc04d65d0, 0xb70d, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangStringWStr : IMLangString
{
    HRESULT SetWStr(int, int, const(wchar)*, int, int*, int*);
    HRESULT SetStrBufW(int, int, IMLangStringBufW, int*, int*);
    HRESULT GetWStr(int, int, PWSTR, int, int*, int*);
    HRESULT GetStrBufW(int, int, IMLangStringBufW*, int*);
    HRESULT LockWStr(int, int, int, int, PWSTR*, int*, int*);
    HRESULT UnlockWStr(const(wchar)*, int, int*, int*);
    HRESULT SetLocale(int, int, uint);
    HRESULT GetLocale(int, int, uint*, int*, int*);
}
enum IID_IMLangStringAStr = GUID(0xc04d65d2, 0xb70d, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangStringAStr : IMLangString
{
    HRESULT SetAStr(int, int, uint, const(char)*, int, int*, int*);
    HRESULT SetStrBufA(int, int, uint, IMLangStringBufA, int*, int*);
    HRESULT GetAStr(int, int, uint, uint*, PSTR, int, int*, int*);
    HRESULT GetStrBufA(int, int, uint*, IMLangStringBufA*, int*);
    HRESULT LockAStr(int, int, int, uint, int, uint*, PSTR*, int*, int*);
    HRESULT UnlockAStr(const(char)*, int, int*, int*);
    HRESULT SetLocale(int, int, uint);
    HRESULT GetLocale(int, int, uint*, int*, int*);
}
enum IID_IMLangLineBreakConsole = GUID(0xf5be2ee1, 0xbfd7, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangLineBreakConsole : IUnknown
{
    HRESULT BreakLineML(IMLangString, int, int, int, int, int*, int*);
    HRESULT BreakLineW(uint, const(wchar)*, int, int, int*, int*);
    HRESULT BreakLineA(uint, uint, const(char)*, int, int, int*, int*);
}
alias MIMECONTF = int;
enum : int
{
    MIMECONTF_MAILNEWS         = 0x00000001,
    MIMECONTF_BROWSER          = 0x00000002,
    MIMECONTF_MINIMAL          = 0x00000004,
    MIMECONTF_IMPORT           = 0x00000008,
    MIMECONTF_SAVABLE_MAILNEWS = 0x00000100,
    MIMECONTF_SAVABLE_BROWSER  = 0x00000200,
    MIMECONTF_EXPORT           = 0x00000400,
    MIMECONTF_PRIVCONVERTER    = 0x00010000,
    MIMECONTF_VALID            = 0x00020000,
    MIMECONTF_VALID_NLS        = 0x00040000,
    MIMECONTF_MIME_IE4         = 0x10000000,
    MIMECONTF_MIME_LATEST      = 0x20000000,
    MIMECONTF_MIME_REGISTRY    = 0x40000000,
}

struct MIMECPINFO
{
    uint dwFlags;
    uint uiCodePage;
    uint uiFamilyCodePage;
    wchar[64] wszDescription;
    wchar[50] wszWebCharset;
    wchar[50] wszHeaderCharset;
    wchar[50] wszBodyCharset;
    wchar[32] wszFixedWidthFont;
    wchar[32] wszProportionalFont;
    ubyte bGDICharset;
}
struct MIMECSETINFO
{
    uint uiCodePage;
    uint uiInternetEncoding;
    wchar[50] wszCharset;
}
enum IID_IEnumCodePage = GUID(0x275c23e3, 0x3747, 0x11d0, [0x9f, 0xea, 0x0, 0xaa, 0x0, 0x3f, 0x86, 0x46]);
interface IEnumCodePage : IUnknown
{
    HRESULT Clone(IEnumCodePage*);
    HRESULT Next(uint, MIMECPINFO*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
struct RFC1766INFO
{
    uint lcid;
    wchar[6] wszRfc1766;
    wchar[32] wszLocaleName;
}
enum IID_IEnumRfc1766 = GUID(0x3dc39d1d, 0xc030, 0x11d0, [0xb8, 0x1b, 0x0, 0xc0, 0x4f, 0xc9, 0xb3, 0x1f]);
interface IEnumRfc1766 : IUnknown
{
    HRESULT Clone(IEnumRfc1766*);
    HRESULT Next(uint, RFC1766INFO*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
alias SCRIPTCONTF = int;
enum : int
{
    sidDefault     = 0x00000000,
    sidMerge       = 0x00000001,
    sidAsciiSym    = 0x00000002,
    sidAsciiLatin  = 0x00000003,
    sidLatin       = 0x00000004,
    sidGreek       = 0x00000005,
    sidCyrillic    = 0x00000006,
    sidArmenian    = 0x00000007,
    sidHebrew      = 0x00000008,
    sidArabic      = 0x00000009,
    sidDevanagari  = 0x0000000a,
    sidBengali     = 0x0000000b,
    sidGurmukhi    = 0x0000000c,
    sidGujarati    = 0x0000000d,
    sidOriya       = 0x0000000e,
    sidTamil       = 0x0000000f,
    sidTelugu      = 0x00000010,
    sidKannada     = 0x00000011,
    sidMalayalam   = 0x00000012,
    sidThai        = 0x00000013,
    sidLao         = 0x00000014,
    sidTibetan     = 0x00000015,
    sidGeorgian    = 0x00000016,
    sidHangul      = 0x00000017,
    sidKana        = 0x00000018,
    sidBopomofo    = 0x00000019,
    sidHan         = 0x0000001a,
    sidEthiopic    = 0x0000001b,
    sidCanSyllabic = 0x0000001c,
    sidCherokee    = 0x0000001d,
    sidYi          = 0x0000001e,
    sidBraille     = 0x0000001f,
    sidRunic       = 0x00000020,
    sidOgham       = 0x00000021,
    sidSinhala     = 0x00000022,
    sidSyriac      = 0x00000023,
    sidBurmese     = 0x00000024,
    sidKhmer       = 0x00000025,
    sidThaana      = 0x00000026,
    sidMongolian   = 0x00000027,
    sidUserDefined = 0x00000028,
    sidLim         = 0x00000029,
    sidFEFirst     = 0x00000017,
    sidFELast      = 0x0000001a,
}

struct SCRIPTINFO
{
    ubyte ScriptId;
    uint uiCodePage;
    wchar[48] wszDescription;
    wchar[32] wszFixedWidthFont;
    wchar[32] wszProportionalFont;
}
enum IID_IEnumScript = GUID(0xae5f1430, 0x388b, 0x11d2, [0x83, 0x80, 0x0, 0xc0, 0x4f, 0x8f, 0x5d, 0xa1]);
interface IEnumScript : IUnknown
{
    HRESULT Clone(IEnumScript*);
    HRESULT Next(uint, SCRIPTINFO*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
alias MLCONVCHAR = int;
enum : int
{
    MLCONVCHARF_AUTODETECT     = 0x00000001,
    MLCONVCHARF_ENTITIZE       = 0x00000002,
    MLCONVCHARF_NCR_ENTITIZE   = 0x00000002,
    MLCONVCHARF_NAME_ENTITIZE  = 0x00000004,
    MLCONVCHARF_USEDEFCHAR     = 0x00000008,
    MLCONVCHARF_NOBESTFITCHARS = 0x00000010,
    MLCONVCHARF_DETECTJPN      = 0x00000020,
}

alias MLCP = int;
enum : int
{
    MLDETECTF_MAILNEWS           = 0x00000001,
    MLDETECTF_BROWSER            = 0x00000002,
    MLDETECTF_VALID              = 0x00000004,
    MLDETECTF_VALID_NLS          = 0x00000008,
    MLDETECTF_PRESERVE_ORDER     = 0x00000010,
    MLDETECTF_PREFERRED_ONLY     = 0x00000020,
    MLDETECTF_FILTER_SPECIALCHAR = 0x00000040,
    MLDETECTF_EURO_UTF8          = 0x00000080,
}

enum IID_IMLangConvertCharset = GUID(0xd66d6f98, 0xcdaa, 0x11d0, [0xb8, 0x22, 0x0, 0xc0, 0x4f, 0xc9, 0xb3, 0x1f]);
interface IMLangConvertCharset : IUnknown
{
    HRESULT Initialize(uint, uint, uint);
    HRESULT GetSourceCodePage(uint*);
    HRESULT GetDestinationCodePage(uint*);
    HRESULT GetProperty(uint*);
    HRESULT DoConversion(ubyte*, uint*, ubyte*, uint*);
    HRESULT DoConversionToUnicode(PSTR, uint*, PWSTR, uint*);
    HRESULT DoConversionFromUnicode(PWSTR, uint*, PSTR, uint*);
}
enum IID_IMultiLanguage = GUID(0x275c23e1, 0x3747, 0x11d0, [0x9f, 0xea, 0x0, 0xaa, 0x0, 0x3f, 0x86, 0x46]);
interface IMultiLanguage : IUnknown
{
    HRESULT GetNumberOfCodePageInfo(uint*);
    HRESULT GetCodePageInfo(uint, MIMECPINFO*);
    HRESULT GetFamilyCodePage(uint, uint*);
    HRESULT EnumCodePages(uint, IEnumCodePage*);
    HRESULT GetCharsetInfo(BSTR, MIMECSETINFO*);
    HRESULT IsConvertible(uint, uint);
    HRESULT ConvertString(uint*, uint, uint, ubyte*, uint*, ubyte*, uint*);
    HRESULT ConvertStringToUnicode(uint*, uint, PSTR, uint*, PWSTR, uint*);
    HRESULT ConvertStringFromUnicode(uint*, uint, PWSTR, uint*, PSTR, uint*);
    HRESULT ConvertStringReset();
    HRESULT GetRfc1766FromLcid(uint, BSTR*);
    HRESULT GetLcidFromRfc1766(uint*, BSTR);
    HRESULT EnumRfc1766(IEnumRfc1766*);
    HRESULT GetRfc1766Info(uint, RFC1766INFO*);
    HRESULT CreateConvertCharset(uint, uint, uint, IMLangConvertCharset*);
}
alias MLDETECTCP = int;
enum : int
{
    MLDETECTCP_NONE   = 0x00000000,
    MLDETECTCP_7BIT   = 0x00000001,
    MLDETECTCP_8BIT   = 0x00000002,
    MLDETECTCP_DBCS   = 0x00000004,
    MLDETECTCP_HTML   = 0x00000008,
    MLDETECTCP_NUMBER = 0x00000010,
}

struct DetectEncodingInfo
{
    uint nLangID;
    uint nCodePage;
    int nDocPercent;
    int nConfidence;
}
alias SCRIPTFONTCONTF = int;
enum : int
{
    SCRIPTCONTF_FIXED_FONT        = 0x00000001,
    SCRIPTCONTF_PROPORTIONAL_FONT = 0x00000002,
    SCRIPTCONTF_SCRIPT_USER       = 0x00010000,
    SCRIPTCONTF_SCRIPT_HIDE       = 0x00020000,
    SCRIPTCONTF_SCRIPT_SYSTEM     = 0x00040000,
}

struct SCRIPTFONTINFO
{
    long scripts;
    wchar[32] wszFont;
}
enum IID_IMultiLanguage2 = GUID(0xdccfc164, 0x2b38, 0x11d2, [0xb7, 0xec, 0x0, 0xc0, 0x4f, 0x8f, 0x5d, 0x9a]);
interface IMultiLanguage2 : IUnknown
{
    HRESULT GetNumberOfCodePageInfo(uint*);
    HRESULT GetCodePageInfo(uint, ushort, MIMECPINFO*);
    HRESULT GetFamilyCodePage(uint, uint*);
    HRESULT EnumCodePages(uint, ushort, IEnumCodePage*);
    HRESULT GetCharsetInfo(BSTR, MIMECSETINFO*);
    HRESULT IsConvertible(uint, uint);
    HRESULT ConvertString(uint*, uint, uint, ubyte*, uint*, ubyte*, uint*);
    HRESULT ConvertStringToUnicode(uint*, uint, PSTR, uint*, PWSTR, uint*);
    HRESULT ConvertStringFromUnicode(uint*, uint, PWSTR, uint*, PSTR, uint*);
    HRESULT ConvertStringReset();
    HRESULT GetRfc1766FromLcid(uint, BSTR*);
    HRESULT GetLcidFromRfc1766(uint*, BSTR);
    HRESULT EnumRfc1766(ushort, IEnumRfc1766*);
    HRESULT GetRfc1766Info(uint, ushort, RFC1766INFO*);
    HRESULT CreateConvertCharset(uint, uint, uint, IMLangConvertCharset*);
    HRESULT ConvertStringInIStream(uint*, uint, PWSTR, uint, uint, IStream, IStream);
    HRESULT ConvertStringToUnicodeEx(uint*, uint, PSTR, uint*, PWSTR, uint*, uint, PWSTR);
    HRESULT ConvertStringFromUnicodeEx(uint*, uint, PWSTR, uint*, PSTR, uint*, uint, PWSTR);
    HRESULT DetectCodepageInIStream(uint, uint, IStream, DetectEncodingInfo*, int*);
    HRESULT DetectInputCodepage(uint, uint, PSTR, int*, DetectEncodingInfo*, int*);
    HRESULT ValidateCodePage(uint, HWND);
    HRESULT GetCodePageDescription(uint, uint, PWSTR, int);
    HRESULT IsCodePageInstallable(uint);
    HRESULT SetMimeDBSource(MIMECONTF);
    HRESULT GetNumberOfScripts(uint*);
    HRESULT EnumScripts(uint, ushort, IEnumScript*);
    HRESULT ValidateCodePageEx(uint, HWND, uint);
}
enum IID_IMLangCodePages = GUID(0x359f3443, 0xbd4a, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangCodePages : IUnknown
{
    HRESULT GetCharCodePages(wchar, uint*);
    HRESULT GetStrCodePages(const(wchar)*, int, uint, uint*, int*);
    HRESULT CodePageToCodePages(uint, uint*);
    HRESULT CodePagesToCodePage(uint, uint, uint*);
}
enum IID_IMLangFontLink = GUID(0x359f3441, 0xbd4a, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
interface IMLangFontLink : IMLangCodePages
{
    HRESULT GetFontCodePages(HDC, HFONT, uint*);
    HRESULT MapFont(HDC, uint, HFONT, HFONT*);
    HRESULT ReleaseFont(HFONT);
    HRESULT ResetFontMapping();
}
struct UNICODERANGE
{
    wchar wcFrom;
    wchar wcTo;
}
enum IID_IMLangFontLink2 = GUID(0xdccfc162, 0x2b38, 0x11d2, [0xb7, 0xec, 0x0, 0xc0, 0x4f, 0x8f, 0x5d, 0x9a]);
interface IMLangFontLink2 : IMLangCodePages
{
    HRESULT GetFontCodePages(HDC, HFONT, uint*);
    HRESULT ReleaseFont(HFONT);
    HRESULT ResetFontMapping();
    HRESULT MapFont(HDC, uint, wchar, HFONT*);
    HRESULT GetFontUnicodeRanges(HDC, uint*, UNICODERANGE*);
    HRESULT GetScriptFontInfo(ubyte, uint, uint*, SCRIPTFONTINFO*);
    HRESULT CodePageToScriptID(uint, ubyte*);
}
enum IID_IMultiLanguage3 = GUID(0x4e5868ab, 0xb157, 0x4623, [0x9a, 0xcc, 0x6a, 0x1d, 0x9c, 0xae, 0xbe, 0x4]);
interface IMultiLanguage3 : IMultiLanguage2
{
    HRESULT DetectOutboundCodePage(uint, const(wchar)*, uint, const(uint)*, uint, uint*, uint*, const(wchar)*);
    HRESULT DetectOutboundCodePageInIStream(uint, IStream, const(uint)*, uint, uint*, uint*, const(wchar)*);
}
alias MLSTR_FLAGS = int;
enum : int
{
    MLSTR_READ  = 0x00000001,
    MLSTR_WRITE = 0x00000002,
}

enum CLSID_CMLangString = GUID(0xc04d65cf, 0xb70d, 0x11d0, [0xb1, 0x88, 0x0, 0xaa, 0x0, 0x38, 0xc9, 0x69]);
struct CMLangString
{
}
enum CLSID_CMLangConvertCharset = GUID(0xd66d6f99, 0xcdaa, 0x11d0, [0xb8, 0x22, 0x0, 0xc0, 0x4f, 0xc9, 0xb3, 0x1f]);
struct CMLangConvertCharset
{
}
enum CLSID_CMultiLanguage = GUID(0x275c23e2, 0x3747, 0x11d0, [0x9f, 0xea, 0x0, 0xaa, 0x0, 0x3f, 0x86, 0x46]);
struct CMultiLanguage
{
}
