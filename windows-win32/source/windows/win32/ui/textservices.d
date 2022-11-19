module windows.win32.ui.textservices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, COLORREF, HANDLE, HRESULT, HWND, LPARAM, POINT, PWSTR, RECT, SIZE, WPARAM;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.system.com_ : FORMATETC, IDataObject, IEnumGUID, IEnumString, IEnumUnknown, IStream, IUnknown, VARIANT;
import windows.win32.ui.windowsandmessaging : HICON, MSG;

version (Windows):
extern (Windows):

BOOL DoMsCtfMonitor(uint, HANDLE);
HRESULT InitLocalMsCtfMonitor(uint);
HRESULT UninitLocalMsCtfMonitor();
enum GUID_PROP_TEXTOWNER = GUID(0xf1e2d520, 0x969, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_PROP_ATTRIBUTE = GUID(0x34b45670, 0x7526, 0x11d2, [0xa1, 0x47, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_PROP_LANGID = GUID(0x3280ce20, 0x8032, 0x11d2, [0xb6, 0x3, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_PROP_READING = GUID(0x5463f7c0, 0x8e31, 0x11d2, [0xbf, 0x46, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_PROP_COMPOSING = GUID(0xe12ac060, 0xaf15, 0x11d2, [0xaf, 0xc5, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_PROP_TKB_ALTERNATES = GUID(0x70b2a803, 0x968d, 0x462e, [0xb9, 0x3b, 0x21, 0x64, 0xc9, 0x15, 0x17, 0xf7]);
enum GUID_SYSTEM_FUNCTIONPROVIDER = GUID(0x9a698bb0, 0xf21, 0x11d3, [0x8d, 0xf1, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
enum GUID_APP_FUNCTIONPROVIDER = GUID(0x4caef01e, 0x12af, 0x4b0e, [0x9d, 0xb1, 0xa6, 0xec, 0x5b, 0x88, 0x12, 0x8]);
enum GUID_TFCAT_CATEGORY_OF_TIP = GUID(0x534c48c1, 0x607, 0x4098, [0xa5, 0x21, 0x4f, 0xc8, 0x99, 0xc7, 0x3e, 0x90]);
enum GUID_TFCAT_TIP_KEYBOARD = GUID(0x34745c63, 0xb2f0, 0x4784, [0x8b, 0x67, 0x5e, 0x12, 0xc8, 0x70, 0x1a, 0x31]);
enum GUID_TFCAT_TIP_SPEECH = GUID(0xb5a73cd1, 0x8355, 0x426b, [0xa1, 0x61, 0x25, 0x98, 0x8, 0xf2, 0x6b, 0x14]);
enum GUID_TFCAT_TIP_HANDWRITING = GUID(0x246ecb87, 0xc2f2, 0x4abe, [0x90, 0x5b, 0xc8, 0xb3, 0x8a, 0xdd, 0x2c, 0x43]);
enum GUID_TFCAT_PROP_AUDIODATA = GUID(0x9b7be3a9, 0xe8ab, 0x4d47, [0xa8, 0xfe, 0x25, 0x4f, 0xa4, 0x23, 0x43, 0x6d]);
enum GUID_TFCAT_PROP_INKDATA = GUID(0x7c6a82ae, 0xb0d7, 0x4f14, [0xa7, 0x45, 0x14, 0xf2, 0x8b, 0x0, 0x9d, 0x61]);
enum GUID_COMPARTMENT_SAPI_AUDIO = GUID(0x51af2086, 0xcc6b, 0x457d, [0xb5, 0xaa, 0x8b, 0x19, 0xdc, 0x29, 0xa, 0xb4]);
enum GUID_COMPARTMENT_KEYBOARD_DISABLED = GUID(0x71a5b253, 0x1951, 0x466b, [0x9f, 0xbc, 0x9c, 0x88, 0x8, 0xfa, 0x84, 0xf2]);
enum GUID_COMPARTMENT_KEYBOARD_OPENCLOSE = GUID(0x58273aad, 0x1bb, 0x4164, [0x95, 0xc6, 0x75, 0x5b, 0xa0, 0xb5, 0x16, 0x2d]);
enum GUID_COMPARTMENT_HANDWRITING_OPENCLOSE = GUID(0xf9ae2c6b, 0x1866, 0x4361, [0xaf, 0x72, 0x7a, 0xa3, 0x9, 0x48, 0x89, 0xe]);
enum GUID_COMPARTMENT_SPEECH_DISABLED = GUID(0x56c5c607, 0x703, 0x4e59, [0x8e, 0x52, 0xcb, 0xc8, 0x4e, 0x8b, 0xbe, 0x35]);
enum GUID_COMPARTMENT_SPEECH_OPENCLOSE = GUID(0x544d6a63, 0xe2e8, 0x4752, [0xbb, 0xd1, 0x0, 0x9, 0x60, 0xbc, 0xa0, 0x83]);
enum GUID_COMPARTMENT_SPEECH_GLOBALSTATE = GUID(0x2a54fe8e, 0xd08, 0x460c, [0xa7, 0x5d, 0x87, 0x3, 0x5f, 0xf4, 0x36, 0xc5]);
enum GUID_COMPARTMENT_CONVERSIONMODEBIAS = GUID(0x5497f516, 0xee91, 0x436e, [0xb9, 0x46, 0xaa, 0x2c, 0x5, 0xf1, 0xac, 0x5b]);
enum GUID_PROP_MODEBIAS = GUID(0x372e0716, 0x974f, 0x40ac, [0xa0, 0x88, 0x8, 0xcd, 0xc9, 0x2e, 0xbf, 0xbc]);
enum GUID_COMPARTMENT_KEYBOARD_INPUTMODE = GUID(0xb6592511, 0xbcee, 0x4122, [0xa7, 0xc4, 0x9, 0xf4, 0xb3, 0xfa, 0x43, 0x96]);
enum GUID_MODEBIAS_NONE = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum GUID_MODEBIAS_URLHISTORY = GUID(0x8b0e54d9, 0x63f2, 0x4c68, [0x84, 0xd4, 0x79, 0xae, 0xe7, 0xa5, 0x9f, 0x9]);
enum GUID_MODEBIAS_FILENAME = GUID(0xd7f707fe, 0x44c6, 0x4fca, [0x8e, 0x76, 0x86, 0xab, 0x50, 0xc7, 0x93, 0x1b]);
enum GUID_MODEBIAS_READING = GUID(0xe31643a3, 0x6466, 0x4cbf, [0x8d, 0x8b, 0xb, 0xd4, 0xd8, 0x54, 0x54, 0x61]);
enum GUID_MODEBIAS_DATETIME = GUID(0xf2bdb372, 0x7f61, 0x4039, [0x92, 0xef, 0x1c, 0x35, 0x59, 0x9f, 0x2, 0x22]);
enum GUID_MODEBIAS_NAME = GUID(0xfddc10f0, 0xd239, 0x49bf, [0xb8, 0xfc, 0x54, 0x10, 0xca, 0xaa, 0x42, 0x7e]);
enum GUID_MODEBIAS_CONVERSATION = GUID(0xf4ec104, 0x1790, 0x443b, [0x95, 0xf1, 0xe1, 0xf, 0x93, 0x9d, 0x65, 0x46]);
enum GUID_MODEBIAS_NUMERIC = GUID(0x4021766c, 0xe872, 0x48fd, [0x9c, 0xee, 0x4e, 0xc5, 0xc7, 0x5e, 0x16, 0xc3]);
enum GUID_MODEBIAS_HIRAGANA = GUID(0xd73d316e, 0x9b91, 0x46f1, [0xa2, 0x80, 0x31, 0x59, 0x7f, 0x52, 0xc6, 0x94]);
enum GUID_MODEBIAS_KATAKANA = GUID(0x2e0eeddd, 0x3a1a, 0x499e, [0x85, 0x43, 0x3c, 0x7e, 0xe7, 0x94, 0x98, 0x11]);
enum GUID_MODEBIAS_HANGUL = GUID(0x76ef0541, 0x23b3, 0x4d77, [0xa0, 0x74, 0x69, 0x18, 0x1, 0xcc, 0xea, 0x17]);
enum GUID_MODEBIAS_CHINESE = GUID(0x7add26de, 0x4328, 0x489b, [0x83, 0xae, 0x64, 0x93, 0x75, 0xc, 0xad, 0x5c]);
enum GUID_MODEBIAS_HALFWIDTHKATAKANA = GUID(0x5f6b63, 0x78d4, 0x41cc, [0x88, 0x59, 0x48, 0x5c, 0xa8, 0x21, 0xa7, 0x95]);
enum GUID_MODEBIAS_FULLWIDTHALPHANUMERIC = GUID(0x81489fb8, 0xb36a, 0x473d, [0x81, 0x46, 0xe4, 0xa2, 0x25, 0x8b, 0x24, 0xae]);
enum GUID_MODEBIAS_FULLWIDTHHANGUL = GUID(0xc01ae6c9, 0x45b5, 0x4fd0, [0x9c, 0xb1, 0x9f, 0x4c, 0xeb, 0xc3, 0x9f, 0xea]);
enum GUID_TFCAT_PROPSTYLE_STATIC = GUID(0x565fb8d8, 0x6bd4, 0x4ca1, [0xb2, 0x23, 0xf, 0x2c, 0xcb, 0x8f, 0x4f, 0x96]);
enum GUID_TFCAT_DISPLAYATTRIBUTEPROVIDER = GUID(0x46b8c80, 0x1647, 0x40f7, [0x9b, 0x21, 0xb9, 0x3b, 0x81, 0xaa, 0xbc, 0x1b]);
enum GUID_TFCAT_DISPLAYATTRIBUTEPROPERTY = GUID(0xb95f181b, 0xea4c, 0x4af1, [0x80, 0x56, 0x7c, 0x32, 0x1a, 0xbb, 0xb0, 0x91]);
enum GUID_COMPARTMENT_SPEECH_UI_STATUS = GUID(0xd92016f0, 0x9367, 0x4fe7, [0x9a, 0xbf, 0xbc, 0x59, 0xda, 0xcb, 0xe0, 0xe3]);
enum GUID_COMPARTMENT_EMPTYCONTEXT = GUID(0xd7487dbf, 0x804e, 0x41c5, [0x89, 0x4d, 0xad, 0x96, 0xfd, 0x4e, 0xea, 0x13]);
enum GUID_COMPARTMENT_TIPUISTATUS = GUID(0x148ca3ec, 0x366, 0x401c, [0x8d, 0x75, 0xed, 0x97, 0x8d, 0x85, 0xfb, 0xc9]);
enum GUID_COMPARTMENT_SPEECH_CFGMENU = GUID(0xfb6c5c2d, 0x4e83, 0x4bb6, [0x91, 0xa2, 0xe0, 0x19, 0xbf, 0xf6, 0x76, 0x2d]);
enum GUID_LBI_SAPILAYR_CFGMENUBUTTON = GUID(0xd02f24a1, 0x942d, 0x422e, [0x8d, 0x99, 0xb4, 0xf2, 0xad, 0xde, 0xe9, 0x99]);
enum GUID_TFCAT_TIPCAP_SECUREMODE = GUID(0x49d2f9ce, 0x1f5e, 0x11d7, [0xa6, 0xd3, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_TFCAT_TIPCAP_UIELEMENTENABLED = GUID(0x49d2f9cf, 0x1f5e, 0x11d7, [0xa6, 0xd3, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_TFCAT_TIPCAP_INPUTMODECOMPARTMENT = GUID(0xccf05dd7, 0x4a87, 0x11d7, [0xa6, 0xe2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_TFCAT_TIPCAP_COMLESS = GUID(0x364215d9, 0x75bc, 0x11d7, [0xa6, 0xef, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_TFCAT_TIPCAP_WOW16 = GUID(0x364215da, 0x75bc, 0x11d7, [0xa6, 0xef, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_TFCAT_TIPCAP_IMMERSIVESUPPORT = GUID(0x13a016df, 0x560b, 0x46cd, [0x94, 0x7a, 0x4c, 0x3a, 0xf1, 0xe0, 0xe3, 0x5d]);
enum GUID_TFCAT_TIPCAP_IMMERSIVEONLY = GUID(0x3a4259ac, 0x640d, 0x4ad4, [0x89, 0xf7, 0x1e, 0xb6, 0x7e, 0x7c, 0x4e, 0xe8]);
enum GUID_TFCAT_TIPCAP_LOCALSERVER = GUID(0x74769ee9, 0x4a66, 0x4f9d, [0x90, 0xd6, 0xbf, 0x8b, 0x7c, 0x3e, 0xb4, 0x61]);
enum GUID_TFCAT_TIPCAP_TSF3 = GUID(0x7dcb4af, 0x98de, 0x4548, [0xbe, 0xf7, 0x25, 0xbd, 0x45, 0x97, 0x9a, 0x1f]);
enum GUID_TFCAT_TIPCAP_DUALMODE = GUID(0x3af314a2, 0xd79f, 0x4b1b, [0x99, 0x92, 0x15, 0x8, 0x6d, 0x33, 0x9b, 0x5]);
enum GUID_TFCAT_TIPCAP_SYSTRAYSUPPORT = GUID(0x25504fb4, 0x7bab, 0x4bc1, [0x9c, 0x69, 0xcf, 0x81, 0x89, 0xf, 0xe, 0xf5]);
enum GUID_COMPARTMENT_KEYBOARD_INPUTMODE_CONVERSION = GUID(0xccf05dd8, 0x4a87, 0x11d7, [0xa6, 0xe2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_COMPARTMENT_KEYBOARD_INPUTMODE_SENTENCE = GUID(0xccf05dd9, 0x4a87, 0x11d7, [0xa6, 0xe2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_COMPARTMENT_TRANSITORYEXTENSION = GUID(0x8be347f5, 0xc7a0, 0x11d7, [0xb4, 0x8, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_COMPARTMENT_TRANSITORYEXTENSION_DOCUMENTMANAGER = GUID(0x8be347f7, 0xc7a0, 0x11d7, [0xb4, 0x8, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_COMPARTMENT_TRANSITORYEXTENSION_PARENT = GUID(0x8be347f8, 0xc7a0, 0x11d7, [0xb4, 0x8, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
enum GUID_COMPARTMENT_ENABLED_PROFILES_UPDATED = GUID(0x92c1fd48, 0xa9ae, 0x4a7c, [0xbe, 0x8, 0x43, 0x29, 0xe4, 0x72, 0x38, 0x17]);
enum GUID_TFCAT_TRANSITORYEXTENSIONUI = GUID(0x6302de22, 0xa5cf, 0x4b02, [0xbf, 0xe8, 0x4d, 0x72, 0xb2, 0xbe, 0xd3, 0xc6]);
enum GUID_LBI_INPUTMODE = GUID(0x2c77a81e, 0x41cc, 0x4178, [0xa3, 0xa7, 0x5f, 0x8a, 0x98, 0x75, 0x68, 0xe6]);
enum CLSID_TF_ThreadMgr = GUID(0x529a9e6b, 0x6587, 0x4f23, [0xab, 0x9e, 0x9c, 0x7d, 0x68, 0x3e, 0x3c, 0x50]);
enum CLSID_TF_LangBarMgr = GUID(0xebb08c45, 0x6c4a, 0x4fdc, [0xae, 0x53, 0x4e, 0xb8, 0xc4, 0xc7, 0xdb, 0x8e]);
enum CLSID_TF_DisplayAttributeMgr = GUID(0x3ce74de4, 0x53d3, 0x4d74, [0x8b, 0x83, 0x43, 0x1b, 0x38, 0x28, 0xba, 0x53]);
enum CLSID_TF_CategoryMgr = GUID(0xa4b544a1, 0x438d, 0x4b41, [0x93, 0x25, 0x86, 0x95, 0x23, 0xe2, 0xd6, 0xc7]);
enum CLSID_TF_InputProcessorProfiles = GUID(0x33c53a50, 0xf456, 0x4884, [0xb0, 0x49, 0x85, 0xfd, 0x64, 0x3e, 0xcf, 0xed]);
enum CLSID_TF_LangBarItemMgr = GUID(0xb9931692, 0xa2b3, 0x4fab, [0xbf, 0x33, 0x9e, 0xc6, 0xf9, 0xfb, 0x96, 0xac]);
enum CLSID_TF_ClassicLangBar = GUID(0x3318360c, 0x1afc, 0x4d09, [0xa8, 0x6b, 0x9f, 0x9c, 0xb6, 0xdc, 0xeb, 0x9c]);
enum CLSID_TF_TransitoryExtensionUIEntry = GUID(0xae6be008, 0x7fb, 0x400d, [0x8b, 0xeb, 0x33, 0x7a, 0x64, 0xf7, 0x5, 0x1f]);
enum CLSID_TsfServices = GUID(0x39aedc00, 0x6b60, 0x46db, [0x8d, 0x31, 0x36, 0x42, 0xbe, 0xe, 0x43, 0x73]);
enum TF_DEFAULT_SELECTION = 0xffffffffffffffff;
enum TS_DEFAULT_SELECTION = 0xffffffffffffffff;
enum GUID_TS_SERVICE_DATAOBJECT = GUID(0x6086fbb5, 0xe225, 0x46ce, [0xa7, 0x70, 0xc1, 0xbb, 0xd3, 0xe0, 0x5d, 0x7b]);
enum GUID_TS_SERVICE_ACCESSIBLE = GUID(0xf9786200, 0xa5bf, 0x4a0f, [0x8c, 0x24, 0xfb, 0x16, 0xf5, 0xd1, 0xaa, 0xbb]);
enum GUID_TS_SERVICE_ACTIVEX = GUID(0xea937a50, 0xc9a6, 0x4b7d, [0x89, 0x4a, 0x49, 0xd9, 0x9b, 0x78, 0x48, 0x34]);
enum TS_E_INVALIDPOS = 0xffffffff80040200;
enum TS_E_NOLOCK = 0xffffffff80040201;
enum TS_E_NOOBJECT = 0xffffffff80040202;
enum TS_E_NOSERVICE = 0xffffffff80040203;
enum TS_E_NOINTERFACE = 0xffffffff80040204;
enum TS_E_NOSELECTION = 0xffffffff80040205;
enum TS_E_NOLAYOUT = 0xffffffff80040206;
enum TS_E_INVALIDPOINT = 0xffffffff80040207;
enum TS_E_SYNCHRONOUS = 0xffffffff80040208;
enum TS_E_READONLY = 0xffffffff80040209;
enum TS_E_FORMAT = 0xffffffff8004020a;
enum TS_S_ASYNC = 0x00040300;
enum TS_AS_TEXT_CHANGE = 0x00000001;
enum TS_AS_SEL_CHANGE = 0x00000002;
enum TS_AS_LAYOUT_CHANGE = 0x00000004;
enum TS_AS_ATTR_CHANGE = 0x00000008;
enum TS_AS_STATUS_CHANGE = 0x00000010;
enum TS_LF_SYNC = 0x00000001;
enum TS_SD_READONLY = 0x00000001;
enum TS_SD_LOADING = 0x00000002;
enum TS_SD_RESERVED = 0x00000004;
enum TS_SD_TKBAUTOCORRECTENABLE = 0x00000008;
enum TS_SD_TKBPREDICTIONENABLE = 0x00000010;
enum TS_SD_UIINTEGRATIONENABLE = 0x00000020;
enum TS_SD_INPUTPANEMANUALDISPLAYENABLE = 0x00000040;
enum TS_SD_EMBEDDEDHANDWRITINGVIEW_ENABLED = 0x00000080;
enum TS_SD_EMBEDDEDHANDWRITINGVIEW_VISIBLE = 0x00000100;
enum TS_SS_DISJOINTSEL = 0x00000001;
enum TS_SS_REGIONS = 0x00000002;
enum TS_SS_TRANSITORY = 0x00000004;
enum TS_SS_NOHIDDENTEXT = 0x00000008;
enum TS_SS_TKBAUTOCORRECTENABLE = 0x00000010;
enum TS_SS_TKBPREDICTIONENABLE = 0x00000020;
enum TS_SS_UWPCONTROL = 0x00000040;
enum TS_IE_CORRECTION = 0x00000001;
enum TS_IE_COMPOSITION = 0x00000002;
enum TS_IAS_NOQUERY = 0x00000001;
enum TS_IAS_QUERYONLY = 0x00000002;
enum GXFPF_ROUND_NEAREST = 0x00000001;
enum GXFPF_NEAREST = 0x00000002;
enum TS_CHAR_EMBEDDED = 0x0000fffc;
enum TS_CHAR_REGION = 0x00000000;
enum TS_CHAR_REPLACEMENT = 0x0000fffd;
enum TS_ATTR_FIND_BACKWARDS = 0x00000001;
enum TS_ATTR_FIND_WANT_OFFSET = 0x00000002;
enum TS_ATTR_FIND_UPDATESTART = 0x00000004;
enum TS_ATTR_FIND_WANT_VALUE = 0x00000008;
enum TS_ATTR_FIND_WANT_END = 0x00000010;
enum TS_ATTR_FIND_HIDDEN = 0x00000020;
enum TS_VCOOKIE_NUL = 0xffffffff;
enum TS_SHIFT_COUNT_HIDDEN = 0x00000001;
enum TS_SHIFT_HALT_HIDDEN = 0x00000002;
enum TS_SHIFT_HALT_VISIBLE = 0x00000004;
enum TS_SHIFT_COUNT_ONLY = 0x00000008;
enum TS_GTA_HIDDEN = 0x00000001;
enum TS_GEA_HIDDEN = 0x00000001;
enum TF_E_LOCKED = 0xffffffff80040500;
enum TF_E_STACKFULL = 0xffffffff80040501;
enum TF_E_NOTOWNEDRANGE = 0xffffffff80040502;
enum TF_E_NOPROVIDER = 0xffffffff80040503;
enum TF_E_DISCONNECTED = 0xffffffff80040504;
enum TF_E_INVALIDVIEW = 0xffffffff80040505;
enum TF_E_ALREADY_EXISTS = 0xffffffff80040506;
enum TF_E_RANGE_NOT_COVERED = 0xffffffff80040507;
enum TF_E_COMPOSITION_REJECTED = 0xffffffff80040508;
enum TF_E_EMPTYCONTEXT = 0xffffffff80040509;
enum TF_E_INVALIDPOS = 0xffffffff80040200;
enum TF_E_NOLOCK = 0xffffffff80040201;
enum TF_E_NOOBJECT = 0xffffffff80040202;
enum TF_E_NOSERVICE = 0xffffffff80040203;
enum TF_E_NOINTERFACE = 0xffffffff80040204;
enum TF_E_NOSELECTION = 0xffffffff80040205;
enum TF_E_NOLAYOUT = 0xffffffff80040206;
enum TF_E_INVALIDPOINT = 0xffffffff80040207;
enum TF_E_SYNCHRONOUS = 0xffffffff80040208;
enum TF_E_READONLY = 0xffffffff80040209;
enum TF_E_FORMAT = 0xffffffff8004020a;
enum TF_S_ASYNC = 0x00040300;
enum TF_RCM_COMLESS = 0x00000001;
enum TF_RCM_VKEY = 0x00000002;
enum TF_RCM_HINT_READING_LENGTH = 0x00000004;
enum TF_RCM_HINT_COLLISION = 0x00000008;
enum TKB_ALTERNATES_STANDARD = 0x00000001;
enum TKB_ALTERNATES_FOR_AUTOCORRECTION = 0x00000002;
enum TKB_ALTERNATES_FOR_PREDICTION = 0x00000003;
enum TKB_ALTERNATES_AUTOCORRECTION_APPLIED = 0x00000004;
enum TF_TMAE_NOACTIVATETIP = 0x00000001;
enum TF_TMAE_SECUREMODE = 0x00000002;
enum TF_TMAE_UIELEMENTENABLEDONLY = 0x00000004;
enum TF_TMAE_COMLESS = 0x00000008;
enum TF_TMAE_WOW16 = 0x00000010;
enum TF_TMAE_NOACTIVATEKEYBOARDLAYOUT = 0x00000020;
enum TF_TMAE_CONSOLE = 0x00000040;
enum TF_TMF_NOACTIVATETIP = 0x00000001;
enum TF_TMF_SECUREMODE = 0x00000002;
enum TF_TMF_UIELEMENTENABLEDONLY = 0x00000004;
enum TF_TMF_COMLESS = 0x00000008;
enum TF_TMF_WOW16 = 0x00000010;
enum TF_TMF_CONSOLE = 0x00000040;
enum TF_TMF_IMMERSIVEMODE = 0x40000000;
enum TF_TMF_ACTIVATED = 0x80000000;
enum TF_MOD_ALT = 0x00000001;
enum TF_MOD_CONTROL = 0x00000002;
enum TF_MOD_SHIFT = 0x00000004;
enum TF_MOD_RALT = 0x00000008;
enum TF_MOD_RCONTROL = 0x00000010;
enum TF_MOD_RSHIFT = 0x00000020;
enum TF_MOD_LALT = 0x00000040;
enum TF_MOD_LCONTROL = 0x00000080;
enum TF_MOD_LSHIFT = 0x00000100;
enum TF_MOD_ON_KEYUP = 0x00000200;
enum TF_MOD_IGNORE_ALL_MODIFIER = 0x00000400;
enum TF_US_HIDETIPUI = 0x00000001;
enum TF_DISABLE_SPEECH = 0x00000001;
enum TF_DISABLE_DICTATION = 0x00000002;
enum TF_DISABLE_COMMANDING = 0x00000004;
enum TF_PROCESS_ATOM = "_CTF_PROCESS_ATOM_";
enum TF_ENABLE_PROCESS_ATOM = "_CTF_ENABLE_PROCESS_ATOM_";
enum TF_CLUIE_DOCUMENTMGR = 0x00000001;
enum TF_CLUIE_COUNT = 0x00000002;
enum TF_CLUIE_SELECTION = 0x00000004;
enum TF_CLUIE_STRING = 0x00000008;
enum TF_CLUIE_PAGEINDEX = 0x00000010;
enum TF_CLUIE_CURRENTPAGE = 0x00000020;
enum TF_RIUIE_CONTEXT = 0x00000001;
enum TF_RIUIE_STRING = 0x00000002;
enum TF_RIUIE_MAXREADINGSTRINGLENGTH = 0x00000004;
enum TF_RIUIE_ERRORINDEX = 0x00000008;
enum TF_RIUIE_VERTICALORDER = 0x00000010;
enum TF_CONVERSIONMODE_ALPHANUMERIC = 0x00000000;
enum TF_CONVERSIONMODE_NATIVE = 0x00000001;
enum TF_CONVERSIONMODE_KATAKANA = 0x00000002;
enum TF_CONVERSIONMODE_FULLSHAPE = 0x00000008;
enum TF_CONVERSIONMODE_ROMAN = 0x00000010;
enum TF_CONVERSIONMODE_CHARCODE = 0x00000020;
enum TF_CONVERSIONMODE_SOFTKEYBOARD = 0x00000080;
enum TF_CONVERSIONMODE_NOCONVERSION = 0x00000100;
enum TF_CONVERSIONMODE_EUDC = 0x00000200;
enum TF_CONVERSIONMODE_SYMBOL = 0x00000400;
enum TF_CONVERSIONMODE_FIXED = 0x00000800;
enum TF_SENTENCEMODE_NONE = 0x00000000;
enum TF_SENTENCEMODE_PLAURALCLAUSE = 0x00000001;
enum TF_SENTENCEMODE_SINGLECONVERT = 0x00000002;
enum TF_SENTENCEMODE_AUTOMATIC = 0x00000004;
enum TF_SENTENCEMODE_PHRASEPREDICT = 0x00000008;
enum TF_SENTENCEMODE_CONVERSATION = 0x00000010;
enum TF_TRANSITORYEXTENSION_NONE = 0x00000000;
enum TF_TRANSITORYEXTENSION_FLOATING = 0x00000001;
enum TF_TRANSITORYEXTENSION_ATSELECTION = 0x00000002;
enum TF_PROFILETYPE_INPUTPROCESSOR = 0x00000001;
enum TF_PROFILETYPE_KEYBOARDLAYOUT = 0x00000002;
enum TF_RIP_FLAG_FREEUNUSEDLIBRARIES = 0x00000001;
enum TF_IPP_FLAG_ACTIVE = 0x00000001;
enum TF_IPP_FLAG_ENABLED = 0x00000002;
enum TF_IPP_FLAG_SUBSTITUTEDBYINPUTPROCESSOR = 0x00000004;
enum TF_IPP_CAPS_DISABLEONTRANSITORY = 0x00000001;
enum TF_IPP_CAPS_SECUREMODESUPPORT = 0x00000002;
enum TF_IPP_CAPS_UIELEMENTENABLED = 0x00000004;
enum TF_IPP_CAPS_COMLESSSUPPORT = 0x00000008;
enum TF_IPP_CAPS_WOW16SUPPORT = 0x00000010;
enum TF_IPP_CAPS_IMMERSIVESUPPORT = 0x00010000;
enum TF_IPP_CAPS_SYSTRAYSUPPORT = 0x00020000;
enum TF_IPPMF_FORPROCESS = 0x10000000;
enum TF_IPPMF_FORSESSION = 0x20000000;
enum TF_IPPMF_FORSYSTEMALL = 0x40000000;
enum TF_IPPMF_ENABLEPROFILE = 0x00000001;
enum TF_IPPMF_DISABLEPROFILE = 0x00000002;
enum TF_IPPMF_DONTCARECURRENTINPUTLANGUAGE = 0x00000004;
enum TF_RP_HIDDENINSETTINGUI = 0x00000002;
enum TF_RP_LOCALPROCESS = 0x00000004;
enum TF_RP_LOCALTHREAD = 0x00000008;
enum TF_RP_SUBITEMINSETTINGUI = 0x00000010;
enum TF_URP_ALLPROFILES = 0x00000002;
enum TF_URP_LOCALPROCESS = 0x00000004;
enum TF_URP_LOCALTHREAD = 0x00000008;
enum TF_IPSINK_FLAG_ACTIVE = 0x00000001;
enum TF_INVALID_EDIT_COOKIE = 0x00000000;
enum TF_POPF_ALL = 0x00000001;
enum TF_SD_READONLY = 0x00000001;
enum TF_SD_LOADING = 0x00000002;
enum TF_SS_DISJOINTSEL = 0x00000001;
enum TF_SS_REGIONS = 0x00000002;
enum TF_SS_TRANSITORY = 0x00000004;
enum TF_SS_TKBAUTOCORRECTENABLE = 0x00000010;
enum TF_SS_TKBPREDICTIONENABLE = 0x00000020;
enum TF_CHAR_EMBEDDED = 0x0000fffc;
enum TF_HF_OBJECT = 0x00000001;
enum TF_TF_MOVESTART = 0x00000001;
enum TF_TF_IGNOREEND = 0x00000002;
enum TF_ST_CORRECTION = 0x00000001;
enum TF_IE_CORRECTION = 0x00000001;
enum TF_TU_CORRECTION = 0x00000001;
enum TF_INVALID_COOKIE = 0xffffffff;
enum TF_PROFILE_NEWPHONETIC = GUID(0xb2f9c502, 0x1742, 0x11d4, [0x97, 0x90, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_PHONETIC = GUID(0x761309de, 0x317a, 0x11d4, [0x9b, 0x5d, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_NEWCHANGJIE = GUID(0xf3ba907a, 0x6c7e, 0x11d4, [0x97, 0xfa, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_CHANGJIE = GUID(0x4bdf9f03, 0xc7d3, 0x11d4, [0xb2, 0xab, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_NEWQUICK = GUID(0xb883ba0, 0xc1c7, 0x11d4, [0x87, 0xf9, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_QUICK = GUID(0x6024b45f, 0x5c54, 0x11d4, [0xb9, 0x21, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_CANTONESE = GUID(0xaec109c, 0x7e96, 0x11d4, [0xb2, 0xef, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_PINYIN = GUID(0xf3ba9077, 0x6c7e, 0x11d4, [0x97, 0xfa, 0x0, 0x80, 0xc8, 0x82, 0x68, 0x7e]);
enum TF_PROFILE_SIMPLEFAST = GUID(0xfa550b04, 0x5ad7, 0x411f, [0xa5, 0xac, 0xca, 0x3, 0x8e, 0xc5, 0x15, 0xd7]);
enum TF_PROFILE_WUBI = GUID(0x82590c13, 0xf4dd, 0x44f4, [0xba, 0x1d, 0x86, 0x67, 0x24, 0x6f, 0xdf, 0x8e]);
enum TF_PROFILE_DAYI = GUID(0x37b2c25, 0x480c, 0x4d7f, [0xb0, 0x27, 0xd6, 0xca, 0x6b, 0x69, 0x78, 0x8a]);
enum TF_PROFILE_ARRAY = GUID(0xd38eff65, 0xaa46, 0x4fd5, [0x91, 0xa7, 0x67, 0x84, 0x5f, 0xb0, 0x2f, 0x5b]);
enum TF_PROFILE_YI = GUID(0x409c8376, 0x7b, 0x4357, [0xae, 0x8e, 0x26, 0x31, 0x6e, 0xe3, 0xfb, 0xd]);
enum TF_PROFILE_TIGRINYA = GUID(0x3cab88b7, 0xcc3e, 0x46a6, [0x97, 0x65, 0xb7, 0x72, 0xad, 0x77, 0x61, 0xff]);
enum TF_E_NOCONVERSION = 0xffffffff80040600;
enum TF_DICTATION_ON = 0x00000001;
enum TF_DICTATION_ENABLED = 0x00000002;
enum TF_COMMANDING_ENABLED = 0x00000004;
enum TF_COMMANDING_ON = 0x00000008;
enum TF_SPEECHUI_SHOWN = 0x00000010;
enum TF_SHOW_BALLOON = 0x00000001;
enum TF_DISABLE_BALLOON = 0x00000002;
enum TF_MENUREADY = 0x00000001;
enum TF_PROPUI_STATUS_SAVETOFILE = 0x00000001;
enum GUID_INTEGRATIONSTYLE_SEARCHBOX = GUID(0xe6d1bd11, 0x82f7, 0x4903, [0xae, 0x21, 0x1a, 0x63, 0x97, 0xcd, 0xe2, 0xeb]);
enum TKBL_UNDEFINED = 0x00000000;
enum TKBL_CLASSIC_TRADITIONAL_CHINESE_PHONETIC = 0x00000404;
enum TKBL_CLASSIC_TRADITIONAL_CHINESE_CHANGJIE = 0x0000f042;
enum TKBL_CLASSIC_TRADITIONAL_CHINESE_DAYI = 0x0000f043;
enum TKBL_OPT_JAPANESE_ABC = 0x00000411;
enum TKBL_OPT_KOREAN_HANGUL_2_BULSIK = 0x00000412;
enum TKBL_OPT_SIMPLIFIED_CHINESE_PINYIN = 0x00000804;
enum TKBL_OPT_TRADITIONAL_CHINESE_PHONETIC = 0x00000404;
enum TF_FLOATINGLANGBAR_WNDTITLEW = "TF_FloatingLangBar_WndTitle";
enum TF_FLOATINGLANGBAR_WNDTITLEA = "TF_FloatingLangBar_WndTitle";
enum TF_FLOATINGLANGBAR_WNDTITLE = "TF_FloatingLangBar_WndTitle";
enum TF_LBI_ICON = 0x00000001;
enum TF_LBI_TEXT = 0x00000002;
enum TF_LBI_TOOLTIP = 0x00000004;
enum TF_LBI_BITMAP = 0x00000008;
enum TF_LBI_BALLOON = 0x00000010;
enum TF_LBI_CUSTOMUI = 0x00000020;
enum TF_LBI_STATUS = 0x00010000;
enum TF_LBI_STYLE_HIDDENSTATUSCONTROL = 0x00000001;
enum TF_LBI_STYLE_SHOWNINTRAY = 0x00000002;
enum TF_LBI_STYLE_HIDEONNOOTHERITEMS = 0x00000004;
enum TF_LBI_STYLE_SHOWNINTRAYONLY = 0x00000008;
enum TF_LBI_STYLE_HIDDENBYDEFAULT = 0x00000010;
enum TF_LBI_STYLE_TEXTCOLORICON = 0x00000020;
enum TF_LBI_STYLE_BTN_BUTTON = 0x00010000;
enum TF_LBI_STYLE_BTN_MENU = 0x00020000;
enum TF_LBI_STYLE_BTN_TOGGLE = 0x00040000;
enum TF_LBI_STATUS_HIDDEN = 0x00000001;
enum TF_LBI_STATUS_DISABLED = 0x00000002;
enum TF_LBI_STATUS_BTN_TOGGLED = 0x00010000;
enum TF_LBI_BMPF_VERTICAL = 0x00000001;
enum TF_SFT_SHOWNORMAL = 0x00000001;
enum TF_SFT_DOCK = 0x00000002;
enum TF_SFT_MINIMIZED = 0x00000004;
enum TF_SFT_HIDDEN = 0x00000008;
enum TF_SFT_NOTRANSPARENCY = 0x00000010;
enum TF_SFT_LOWTRANSPARENCY = 0x00000020;
enum TF_SFT_HIGHTRANSPARENCY = 0x00000040;
enum TF_SFT_LABELS = 0x00000080;
enum TF_SFT_NOLABELS = 0x00000100;
enum TF_SFT_EXTRAICONSONMINIMIZED = 0x00000200;
enum TF_SFT_NOEXTRAICONSONMINIMIZED = 0x00000400;
enum TF_SFT_DESKBAND = 0x00000800;
enum TF_LBI_DESC_MAXLEN = 0x00000020;
enum TF_LBMENUF_CHECKED = 0x00000001;
enum TF_LBMENUF_SUBMENU = 0x00000002;
enum TF_LBMENUF_SEPARATOR = 0x00000004;
enum TF_LBMENUF_RADIOCHECKED = 0x00000008;
enum TF_LBMENUF_GRAYED = 0x00000010;
enum GUID_PROP_INPUTSCOPE = GUID(0x1713dd5a, 0x68e7, 0x4a5b, [0x9a, 0xf6, 0x59, 0x2a, 0x59, 0x5c, 0x77, 0x8d]);
enum DCM_FLAGS_TASKENG = 0x00000001;
enum DCM_FLAGS_CTFMON = 0x00000002;
enum DCM_FLAGS_LOCALTHREADTSF = 0x00000004;
enum ILMCM_CHECKLAYOUTANDTIPENABLED = 0x00000001;
enum ILMCM_LANGUAGEBAROFF = 0x00000002;
enum LIBID_MSAATEXTLib = GUID(0x150e2d7a, 0xdac1, 0x4582, [0x94, 0x7d, 0x2a, 0x8f, 0xd7, 0x8b, 0x82, 0xcd]);
enum TS_STRF_START = 0x00000000;
enum TS_STRF_MID = 0x00000001;
enum TS_STRF_END = 0x00000002;
enum TSATTRID_OTHERS = GUID(0xb3c32af9, 0x57d0, 0x46a9, [0xbc, 0xa8, 0xda, 0xc2, 0x38, 0xa1, 0x30, 0x57]);
enum TSATTRID_Font = GUID(0x573ea825, 0x749b, 0x4f8a, [0x9c, 0xfd, 0x21, 0xc3, 0x60, 0x5c, 0xa8, 0x28]);
enum TSATTRID_Font_FaceName = GUID(0xb536aeb6, 0x53b, 0x4eb8, [0xb6, 0x5a, 0x50, 0xda, 0x1e, 0x81, 0xe7, 0x2e]);
enum TSATTRID_Font_SizePts = GUID(0xc8493302, 0xa5e9, 0x456d, [0xaf, 0x4, 0x80, 0x5, 0xe4, 0x13, 0xf, 0x3]);
enum TSATTRID_Font_Style = GUID(0x68b2a77f, 0x6b0e, 0x4f28, [0x81, 0x77, 0x57, 0x1c, 0x2f, 0x3a, 0x42, 0xb1]);
enum TSATTRID_Font_Style_Bold = GUID(0x48813a43, 0x8a20, 0x4940, [0x8e, 0x58, 0x97, 0x82, 0x3f, 0x7b, 0x26, 0x8a]);
enum TSATTRID_Font_Style_Italic = GUID(0x8740682a, 0xa765, 0x48e1, [0xac, 0xfc, 0xd2, 0x22, 0x22, 0xb2, 0xf8, 0x10]);
enum TSATTRID_Font_Style_SmallCaps = GUID(0xfacb6bc6, 0x9100, 0x4cc6, [0xb9, 0x69, 0x11, 0xee, 0xa4, 0x5a, 0x86, 0xb4]);
enum TSATTRID_Font_Style_Capitalize = GUID(0x7d85a3ba, 0xb4fd, 0x43b3, [0xbe, 0xfc, 0x6b, 0x98, 0x5c, 0x84, 0x31, 0x41]);
enum TSATTRID_Font_Style_Uppercase = GUID(0x33a300e8, 0xe340, 0x4937, [0xb6, 0x97, 0x8f, 0x23, 0x40, 0x45, 0xcd, 0x9a]);
enum TSATTRID_Font_Style_Lowercase = GUID(0x76d8ccb5, 0xca7b, 0x4498, [0x8e, 0xe9, 0xd5, 0xc4, 0xf6, 0xf7, 0x4c, 0x60]);
enum TSATTRID_Font_Style_Animation = GUID(0xdcf73d22, 0xe029, 0x47b7, [0xbb, 0x36, 0xf2, 0x63, 0xa3, 0xd0, 0x4, 0xcc]);
enum TSATTRID_Font_Style_Animation_LasVegasLights = GUID(0xf40423d5, 0xf87, 0x4f8f, [0xba, 0xda, 0xe6, 0xd6, 0xc, 0x25, 0xe1, 0x52]);
enum TSATTRID_Font_Style_Animation_BlinkingBackground = GUID(0x86e5b104, 0x104, 0x4b10, [0xb5, 0x85, 0x0, 0xf2, 0x52, 0x75, 0x22, 0xb5]);
enum TSATTRID_Font_Style_Animation_SparkleText = GUID(0x533aad20, 0x962c, 0x4e9f, [0x8c, 0x9, 0xb4, 0x2e, 0xa4, 0x74, 0x97, 0x11]);
enum TSATTRID_Font_Style_Animation_MarchingBlackAnts = GUID(0x7644e067, 0xf186, 0x4902, [0xbf, 0xc6, 0xec, 0x81, 0x5a, 0xa2, 0xe, 0x9d]);
enum TSATTRID_Font_Style_Animation_MarchingRedAnts = GUID(0x78368dad, 0x50fb, 0x4c6f, [0x84, 0xb, 0xd4, 0x86, 0xbb, 0x6c, 0xf7, 0x81]);
enum TSATTRID_Font_Style_Animation_Shimmer = GUID(0x2ce31b58, 0x5293, 0x4c36, [0x88, 0x9, 0xbf, 0x8b, 0xb5, 0x1a, 0x27, 0xb3]);
enum TSATTRID_Font_Style_Animation_WipeDown = GUID(0x5872e874, 0x367b, 0x4803, [0xb1, 0x60, 0xc9, 0xf, 0xf6, 0x25, 0x69, 0xd0]);
enum TSATTRID_Font_Style_Animation_WipeRight = GUID(0xb855cbe3, 0x3d2c, 0x4600, [0xb1, 0xe9, 0xe1, 0xc9, 0xce, 0x2, 0xf8, 0x42]);
enum TSATTRID_Font_Style_Emboss = GUID(0xbd8ed742, 0x349e, 0x4e37, [0x82, 0xfb, 0x43, 0x79, 0x79, 0xcb, 0x53, 0xa7]);
enum TSATTRID_Font_Style_Engrave = GUID(0x9c3371de, 0x8332, 0x4897, [0xbe, 0x5d, 0x89, 0x23, 0x32, 0x23, 0x17, 0x9a]);
enum TSATTRID_Font_Style_Hidden = GUID(0xb1e28770, 0x881c, 0x475f, [0x86, 0x3f, 0x88, 0x7a, 0x64, 0x7b, 0x10, 0x90]);
enum TSATTRID_Font_Style_Kerning = GUID(0xcc26e1b4, 0x2f9a, 0x47c8, [0x8b, 0xff, 0xbf, 0x1e, 0xb7, 0xcc, 0xe0, 0xdd]);
enum TSATTRID_Font_Style_Outlined = GUID(0x10e6db31, 0xdb0d, 0x4ac6, [0xa7, 0xf5, 0x9c, 0x9c, 0xff, 0x6f, 0x2a, 0xb4]);
enum TSATTRID_Font_Style_Position = GUID(0x15cd26ab, 0xf2fb, 0x4062, [0xb5, 0xa6, 0x9a, 0x49, 0xe1, 0xa5, 0xcc, 0xb]);
enum TSATTRID_Font_Style_Protected = GUID(0x1c557cb2, 0x14cf, 0x4554, [0xa5, 0x74, 0xec, 0xb2, 0xf7, 0xe7, 0xef, 0xd4]);
enum TSATTRID_Font_Style_Shadow = GUID(0x5f686d2f, 0xc6cd, 0x4c56, [0x8a, 0x1a, 0x99, 0x4a, 0x4b, 0x97, 0x66, 0xbe]);
enum TSATTRID_Font_Style_Spacing = GUID(0x98c1200d, 0x8f06, 0x409a, [0x8e, 0x49, 0x6a, 0x55, 0x4b, 0xf7, 0xc1, 0x53]);
enum TSATTRID_Font_Style_Weight = GUID(0x12f3189c, 0x8bb0, 0x461b, [0xb1, 0xfa, 0xea, 0xf9, 0x7, 0x4, 0x7f, 0xe0]);
enum TSATTRID_Font_Style_Height = GUID(0x7e937477, 0x12e6, 0x458b, [0x92, 0x6a, 0x1f, 0xa4, 0x4e, 0xe8, 0xf3, 0x91]);
enum TSATTRID_Font_Style_Underline = GUID(0xc3c9c9f3, 0x7902, 0x444b, [0x9a, 0x7b, 0x48, 0xe7, 0xf, 0x4b, 0x50, 0xf7]);
enum TSATTRID_Font_Style_Underline_Single = GUID(0x1b6720e5, 0xf73, 0x4951, [0xa6, 0xb3, 0x6f, 0x19, 0xe4, 0x3c, 0x94, 0x61]);
enum TSATTRID_Font_Style_Underline_Double = GUID(0x74d24aa6, 0x1db3, 0x4c69, [0xa1, 0x76, 0x31, 0x12, 0xe, 0x75, 0x86, 0xd5]);
enum TSATTRID_Font_Style_Strikethrough = GUID(0xc562193, 0x2d08, 0x4668, [0x96, 0x1, 0xce, 0xd4, 0x13, 0x9, 0xd7, 0xaf]);
enum TSATTRID_Font_Style_Strikethrough_Single = GUID(0x75d736b6, 0x3c8f, 0x4b97, [0xab, 0x78, 0x18, 0x77, 0xcb, 0x99, 0xd, 0x31]);
enum TSATTRID_Font_Style_Strikethrough_Double = GUID(0x62489b31, 0xa3e7, 0x4f94, [0xac, 0x43, 0xeb, 0xaf, 0x8f, 0xcc, 0x7a, 0x9f]);
enum TSATTRID_Font_Style_Overline = GUID(0xe3989f4a, 0x992b, 0x4301, [0x8c, 0xe1, 0xa5, 0xb7, 0xc6, 0xd1, 0xf3, 0xc8]);
enum TSATTRID_Font_Style_Overline_Single = GUID(0x8440d94c, 0x51ce, 0x47b2, [0x8d, 0x4c, 0x15, 0x75, 0x1e, 0x5f, 0x72, 0x1b]);
enum TSATTRID_Font_Style_Overline_Double = GUID(0xdc46063a, 0xe115, 0x46e3, [0xbc, 0xd8, 0xca, 0x67, 0x72, 0xaa, 0x95, 0xb4]);
enum TSATTRID_Font_Style_Blink = GUID(0xbfb2c036, 0x7acf, 0x4532, [0xb7, 0x20, 0xb4, 0x16, 0xdd, 0x77, 0x65, 0xa8]);
enum TSATTRID_Font_Style_Subscript = GUID(0x5774fb84, 0x389b, 0x43bc, [0xa7, 0x4b, 0x15, 0x68, 0x34, 0x7c, 0xf0, 0xf4]);
enum TSATTRID_Font_Style_Superscript = GUID(0x2ea4993c, 0x563c, 0x49aa, [0x93, 0x72, 0xb, 0xef, 0x9, 0xa9, 0x25, 0x5b]);
enum TSATTRID_Font_Style_Color = GUID(0x857a7a37, 0xb8af, 0x4e9a, [0x81, 0xb4, 0xac, 0xf7, 0x0, 0xc8, 0x41, 0x1b]);
enum TSATTRID_Font_Style_BackgroundColor = GUID(0xb50eaa4e, 0x3091, 0x4468, [0x81, 0xdb, 0xd7, 0x9e, 0xa1, 0x90, 0xc7, 0xc7]);
enum TSATTRID_Text = GUID(0x7edb8e68, 0x81f9, 0x449d, [0xa1, 0x5a, 0x87, 0xa8, 0x38, 0x8f, 0xaa, 0xc0]);
enum TSATTRID_Text_VerticalWriting = GUID(0x6bba8195, 0x46f, 0x4ea9, [0xb3, 0x11, 0x97, 0xfd, 0x66, 0xc4, 0x27, 0x4b]);
enum TSATTRID_Text_RightToLeft = GUID(0xca666e71, 0x1b08, 0x453d, [0xbf, 0xdd, 0x28, 0xe0, 0x8c, 0x8a, 0xaf, 0x7a]);
enum TSATTRID_Text_Orientation = GUID(0x6bab707f, 0x8785, 0x4c39, [0x8b, 0x52, 0x96, 0xf8, 0x78, 0x30, 0x3f, 0xfb]);
enum TSATTRID_Text_Language = GUID(0xd8c04ef1, 0x5753, 0x4c25, [0x88, 0x87, 0x85, 0x44, 0x3f, 0xe5, 0xf8, 0x19]);
enum TSATTRID_Text_ReadOnly = GUID(0x85836617, 0xde32, 0x4afd, [0xa5, 0xf, 0xa2, 0xdb, 0x11, 0xe, 0x6e, 0x4d]);
enum TSATTRID_Text_EmbeddedObject = GUID(0x7edb8e68, 0x81f9, 0x449d, [0xa1, 0x5a, 0x87, 0xa8, 0x38, 0x8f, 0xaa, 0xc0]);
enum TSATTRID_Text_Alignment = GUID(0x139941e6, 0x1767, 0x456d, [0x93, 0x8e, 0x35, 0xba, 0x56, 0x8b, 0x5c, 0xd4]);
enum TSATTRID_Text_Alignment_Left = GUID(0x16ae95d3, 0x6361, 0x43a2, [0x84, 0x95, 0xd0, 0xf, 0x39, 0x7f, 0x16, 0x93]);
enum TSATTRID_Text_Alignment_Right = GUID(0xb36f0f98, 0x1b9e, 0x4360, [0x86, 0x16, 0x3, 0xfb, 0x8, 0xa7, 0x84, 0x56]);
enum TSATTRID_Text_Alignment_Center = GUID(0xa4a95c16, 0x53bf, 0x4d55, [0x8b, 0x87, 0x4b, 0xdd, 0x8d, 0x42, 0x75, 0xfc]);
enum TSATTRID_Text_Alignment_Justify = GUID(0xed350740, 0xa0f7, 0x42d3, [0x8e, 0xa8, 0xf8, 0x1b, 0x64, 0x88, 0xfa, 0xf0]);
enum TSATTRID_Text_Link = GUID(0x47cd9051, 0x3722, 0x4cd8, [0xb7, 0xc8, 0x4e, 0x17, 0xca, 0x17, 0x59, 0xf5]);
enum TSATTRID_Text_Hyphenation = GUID(0xdadf4525, 0x618e, 0x49eb, [0xb1, 0xa8, 0x3b, 0x68, 0xbd, 0x76, 0x48, 0xe3]);
enum TSATTRID_Text_Para = GUID(0x5edc5822, 0x99dc, 0x4dd6, [0xae, 0xc3, 0xb6, 0x2b, 0xaa, 0x5b, 0x2e, 0x7c]);
enum TSATTRID_Text_Para_FirstLineIndent = GUID(0x7c97a13, 0x7472, 0x4dd8, [0x90, 0xa9, 0x91, 0xe3, 0xd7, 0xe4, 0xf2, 0x9c]);
enum TSATTRID_Text_Para_LeftIndent = GUID(0xfb2848e9, 0x7471, 0x41c9, [0xb6, 0xb3, 0x8a, 0x14, 0x50, 0xe0, 0x18, 0x97]);
enum TSATTRID_Text_Para_RightIndent = GUID(0x2c7f26f9, 0xa5e2, 0x48da, [0xb9, 0x8a, 0x52, 0xc, 0xb1, 0x65, 0x13, 0xbf]);
enum TSATTRID_Text_Para_SpaceAfter = GUID(0x7b0a3f55, 0x22dc, 0x425f, [0xa4, 0x11, 0x93, 0xda, 0x1d, 0x8f, 0x9b, 0xaa]);
enum TSATTRID_Text_Para_SpaceBefore = GUID(0x8df98589, 0x194a, 0x4601, [0xb2, 0x51, 0x98, 0x65, 0xa3, 0xe9, 0x6, 0xdd]);
enum TSATTRID_Text_Para_LineSpacing = GUID(0x699b380d, 0x7f8c, 0x46d6, [0xa7, 0x3b, 0xdf, 0xe3, 0xd1, 0x53, 0x8d, 0xf3]);
enum TSATTRID_Text_Para_LineSpacing_Single = GUID(0xed350740, 0xa0f7, 0x42d3, [0x8e, 0xa8, 0xf8, 0x1b, 0x64, 0x88, 0xfa, 0xf0]);
enum TSATTRID_Text_Para_LineSpacing_OnePtFive = GUID(0x428a021, 0x397, 0x4b57, [0x9a, 0x17, 0x7, 0x95, 0x99, 0x4c, 0xd3, 0xc5]);
enum TSATTRID_Text_Para_LineSpacing_Double = GUID(0x82fb1805, 0xa6c4, 0x4231, [0xac, 0x12, 0x62, 0x60, 0xaf, 0x2a, 0xba, 0x28]);
enum TSATTRID_Text_Para_LineSpacing_AtLeast = GUID(0xadfedf31, 0x2d44, 0x4434, [0xa5, 0xff, 0x7f, 0x4c, 0x49, 0x90, 0xa9, 0x5]);
enum TSATTRID_Text_Para_LineSpacing_Exactly = GUID(0x3d45ad40, 0x23de, 0x48d7, [0xa6, 0xb3, 0x76, 0x54, 0x20, 0xc6, 0x20, 0xcc]);
enum TSATTRID_Text_Para_LineSpacing_Multiple = GUID(0x910f1e3c, 0xd6d0, 0x4f65, [0x8a, 0x3c, 0x42, 0xb4, 0xb3, 0x18, 0x68, 0xc5]);
enum TSATTRID_List = GUID(0x436d673b, 0x26f1, 0x4aee, [0x9e, 0x65, 0x8f, 0x83, 0xa4, 0xed, 0x48, 0x84]);
enum TSATTRID_List_LevelIndel = GUID(0x7f7cc899, 0x311f, 0x487b, [0xad, 0x5d, 0xe2, 0xa4, 0x59, 0xe1, 0x2d, 0x42]);
enum TSATTRID_List_Type = GUID(0xae3e665e, 0x4bce, 0x49e3, [0xa0, 0xfe, 0x2d, 0xb4, 0x7d, 0x3a, 0x17, 0xae]);
enum TSATTRID_List_Type_Bullet = GUID(0xbccd77c5, 0x4c4d, 0x4ce2, [0xb1, 0x2, 0x55, 0x9f, 0x3b, 0x2b, 0xfc, 0xea]);
enum TSATTRID_List_Type_Arabic = GUID(0x1338c5d6, 0x98a3, 0x4fa3, [0x9b, 0xd1, 0x7a, 0x60, 0xee, 0xf8, 0xe9, 0xe0]);
enum TSATTRID_List_Type_LowerLetter = GUID(0x96372285, 0xf3cf, 0x491e, [0xa9, 0x25, 0x38, 0x32, 0x34, 0x7f, 0xd2, 0x37]);
enum TSATTRID_List_Type_UpperLetter = GUID(0x7987b7cd, 0xce52, 0x428b, [0x9b, 0x95, 0xa3, 0x57, 0xf6, 0xf1, 0xc, 0x45]);
enum TSATTRID_List_Type_LowerRoman = GUID(0x90466262, 0x3980, 0x4b8e, [0x93, 0x68, 0x91, 0x8b, 0xd1, 0x21, 0x8a, 0x41]);
enum TSATTRID_List_Type_UpperRoman = GUID(0xf6ab552, 0x4a80, 0x467f, [0xb2, 0xf1, 0x12, 0x7e, 0x2a, 0xa3, 0xba, 0x9e]);
enum TSATTRID_App = GUID(0xa80f77df, 0x4237, 0x40e5, [0x84, 0x9c, 0xb5, 0xfa, 0x51, 0xc1, 0x3a, 0xc7]);
enum TSATTRID_App_IncorrectSpelling = GUID(0xf42de43c, 0xef12, 0x430d, [0x94, 0x4c, 0x9a, 0x8, 0x97, 0xa, 0x25, 0xd2]);
enum TSATTRID_App_IncorrectGrammar = GUID(0xbd54e398, 0xad03, 0x4b74, [0xb6, 0xb3, 0x5e, 0xdb, 0x19, 0x99, 0x63, 0x88]);
alias LANG_BAR_ITEM_ICON_MODE_FLAGS = uint;
enum : uint
{
    TF_DTLBI_NONE           = 0x00000000,
    TF_DTLBI_USEPROFILEICON = 0x00000001,
}

alias TEXT_STORE_TEXT_CHANGE_FLAGS = uint;
enum : uint
{
    TS_ST_NONE       = 0x00000000,
    TS_ST_CORRECTION = 0x00000001,
}

alias TEXT_STORE_CHANGE_FLAGS = uint;
enum : uint
{
    TS_TC_NONE       = 0x00000000,
    TS_TC_CORRECTION = 0x00000001,
}

alias INSERT_TEXT_AT_SELECTION_FLAGS = uint;
enum : uint
{
    TF_IAS_NOQUERY                = 0x00000001,
    TF_IAS_QUERYONLY              = 0x00000002,
    TF_IAS_NO_DEFAULT_COMPOSITION = 0x80000000,
}

alias ANCHOR_CHANGE_HISTORY_FLAGS = uint;
enum : uint
{
    TS_CH_PRECEDING_DEL = 0x00000001,
    TS_CH_FOLLOWING_DEL = 0x00000002,
}

alias TEXT_STORE_LOCK_FLAGS = uint;
enum : uint
{
    TS_LF_READ      = 0x00000002,
    TS_LF_READWRITE = 0x00000006,
}

alias GET_TEXT_AND_PROPERTY_UPDATES_FLAGS = uint;
enum : uint
{
    TF_GTP_NONE      = 0x00000000,
    TF_GTP_INCL_TEXT = 0x00000001,
}

alias TF_CONTEXT_EDIT_CONTEXT_FLAGS = uint;
enum : uint
{
    TF_ES_ASYNCDONTCARE = 0x00000000,
    TF_ES_SYNC          = 0x00000001,
    TF_ES_READ          = 0x00000002,
    TF_ES_READWRITE     = 0x00000006,
    TF_ES_ASYNC         = 0x00000008,
}

alias HKL = void*;
struct TS_STATUS
{
    uint dwDynamicFlags;
    uint dwStaticFlags;
}
struct TS_TEXTCHANGE
{
    int acpStart;
    int acpOldEnd;
    int acpNewEnd;
}
alias TsActiveSelEnd = int;
enum : int
{
    TS_AE_NONE  = 0x00000000,
    TS_AE_START = 0x00000001,
    TS_AE_END   = 0x00000002,
}

struct TS_SELECTIONSTYLE
{
    TsActiveSelEnd ase;
    BOOL fInterimChar;
}
struct TS_SELECTION_ACP
{
    int acpStart;
    int acpEnd;
    TS_SELECTIONSTYLE style;
}
struct TS_SELECTION_ANCHOR
{
    IAnchor paStart;
    IAnchor paEnd;
    TS_SELECTIONSTYLE style;
}
struct TS_ATTRVAL
{
    GUID idAttr;
    uint dwOverlapId;
    VARIANT varValue;
}
alias TsLayoutCode = int;
enum : int
{
    TS_LC_CREATE  = 0x00000000,
    TS_LC_CHANGE  = 0x00000001,
    TS_LC_DESTROY = 0x00000002,
}

alias TsRunType = int;
enum : int
{
    TS_RT_PLAIN  = 0x00000000,
    TS_RT_HIDDEN = 0x00000001,
    TS_RT_OPAQUE = 0x00000002,
}

struct TS_RUNINFO
{
    uint uCount;
    TsRunType type;
}
enum IID_ITextStoreACP = GUID(0x28888fe3, 0xc2a0, 0x483a, [0xa3, 0xea, 0x8c, 0xb1, 0xce, 0x51, 0xff, 0x3d]);
interface ITextStoreACP : IUnknown
{
    HRESULT AdviseSink(const(GUID)*, IUnknown, uint);
    HRESULT UnadviseSink(IUnknown);
    HRESULT RequestLock(uint, HRESULT*);
    HRESULT GetStatus(TS_STATUS*);
    HRESULT QueryInsert(int, int, uint, int*, int*);
    HRESULT GetSelection(uint, uint, TS_SELECTION_ACP*, uint*);
    HRESULT SetSelection(uint, const(TS_SELECTION_ACP)*);
    HRESULT GetText(int, int, PWSTR, uint, uint*, TS_RUNINFO*, uint, uint*, int*);
    HRESULT SetText(uint, int, int, const(wchar)*, uint, TS_TEXTCHANGE*);
    HRESULT GetFormattedText(int, int, IDataObject*);
    HRESULT GetEmbedded(int, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT QueryInsertEmbedded(const(GUID)*, const(FORMATETC)*, BOOL*);
    HRESULT InsertEmbedded(uint, int, int, IDataObject, TS_TEXTCHANGE*);
    HRESULT InsertTextAtSelection(uint, const(wchar)*, uint, int*, int*, TS_TEXTCHANGE*);
    HRESULT InsertEmbeddedAtSelection(uint, IDataObject, int*, int*, TS_TEXTCHANGE*);
    HRESULT RequestSupportedAttrs(uint, uint, const(GUID)*);
    HRESULT RequestAttrsAtPosition(int, uint, const(GUID)*, uint);
    HRESULT RequestAttrsTransitioningAtPosition(int, uint, const(GUID)*, uint);
    HRESULT FindNextAttrTransition(int, int, uint, const(GUID)*, uint, int*, BOOL*, int*);
    HRESULT RetrieveRequestedAttrs(uint, TS_ATTRVAL*, uint*);
    HRESULT GetEndACP(int*);
    HRESULT GetActiveView(uint*);
    HRESULT GetACPFromPoint(uint, const(POINT)*, uint, int*);
    HRESULT GetTextExt(uint, int, int, RECT*, BOOL*);
    HRESULT GetScreenExt(uint, RECT*);
    HRESULT GetWnd(uint, HWND*);
}
enum IID_ITextStoreACP2 = GUID(0xf86ad89f, 0x5fe4, 0x4b8d, [0xbb, 0x9f, 0xef, 0x37, 0x97, 0xa8, 0x4f, 0x1f]);
interface ITextStoreACP2 : IUnknown
{
    HRESULT AdviseSink(const(GUID)*, IUnknown, uint);
    HRESULT UnadviseSink(IUnknown);
    HRESULT RequestLock(uint, HRESULT*);
    HRESULT GetStatus(TS_STATUS*);
    HRESULT QueryInsert(int, int, uint, int*, int*);
    HRESULT GetSelection(uint, uint, TS_SELECTION_ACP*, uint*);
    HRESULT SetSelection(uint, const(TS_SELECTION_ACP)*);
    HRESULT GetText(int, int, PWSTR, uint, uint*, TS_RUNINFO*, uint, uint*, int*);
    HRESULT SetText(uint, int, int, const(wchar)*, uint, TS_TEXTCHANGE*);
    HRESULT GetFormattedText(int, int, IDataObject*);
    HRESULT GetEmbedded(int, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT QueryInsertEmbedded(const(GUID)*, const(FORMATETC)*, BOOL*);
    HRESULT InsertEmbedded(uint, int, int, IDataObject, TS_TEXTCHANGE*);
    HRESULT InsertTextAtSelection(uint, const(wchar)*, uint, int*, int*, TS_TEXTCHANGE*);
    HRESULT InsertEmbeddedAtSelection(uint, IDataObject, int*, int*, TS_TEXTCHANGE*);
    HRESULT RequestSupportedAttrs(uint, uint, const(GUID)*);
    HRESULT RequestAttrsAtPosition(int, uint, const(GUID)*, uint);
    HRESULT RequestAttrsTransitioningAtPosition(int, uint, const(GUID)*, uint);
    HRESULT FindNextAttrTransition(int, int, uint, const(GUID)*, uint, int*, BOOL*, int*);
    HRESULT RetrieveRequestedAttrs(uint, TS_ATTRVAL*, uint*);
    HRESULT GetEndACP(int*);
    HRESULT GetActiveView(uint*);
    HRESULT GetACPFromPoint(uint, const(POINT)*, uint, int*);
    HRESULT GetTextExt(uint, int, int, RECT*, BOOL*);
    HRESULT GetScreenExt(uint, RECT*);
}
enum IID_ITextStoreACPSink = GUID(0x22d44c94, 0xa419, 0x4542, [0xa2, 0x72, 0xae, 0x26, 0x9, 0x3e, 0xce, 0xcf]);
interface ITextStoreACPSink : IUnknown
{
    HRESULT OnTextChange(TEXT_STORE_TEXT_CHANGE_FLAGS, const(TS_TEXTCHANGE)*);
    HRESULT OnSelectionChange();
    HRESULT OnLayoutChange(TsLayoutCode, uint);
    HRESULT OnStatusChange(uint);
    HRESULT OnAttrsChange(int, int, uint, const(GUID)*);
    HRESULT OnLockGranted(TEXT_STORE_LOCK_FLAGS);
    HRESULT OnStartEditTransaction();
    HRESULT OnEndEditTransaction();
}
alias TsGravity = int;
enum : int
{
    TS_GR_BACKWARD = 0x00000000,
    TS_GR_FORWARD  = 0x00000001,
}

alias TsShiftDir = int;
enum : int
{
    TS_SD_BACKWARD = 0x00000000,
    TS_SD_FORWARD  = 0x00000001,
}

enum IID_IAnchor = GUID(0xfeb7e34, 0x5a60, 0x4356, [0x8e, 0xf7, 0xab, 0xde, 0xc2, 0xff, 0x7c, 0xf8]);
interface IAnchor : IUnknown
{
    HRESULT SetGravity(TsGravity);
    HRESULT GetGravity(TsGravity*);
    HRESULT IsEqual(IAnchor, BOOL*);
    HRESULT Compare(IAnchor, int*);
    HRESULT Shift(uint, int, int*, IAnchor);
    HRESULT ShiftTo(IAnchor);
    HRESULT ShiftRegion(uint, TsShiftDir, BOOL*);
    HRESULT SetChangeHistoryMask(uint);
    HRESULT GetChangeHistory(ANCHOR_CHANGE_HISTORY_FLAGS*);
    HRESULT ClearChangeHistory();
    HRESULT Clone(IAnchor*);
}
enum IID_ITextStoreAnchor = GUID(0x9b2077b0, 0x5f18, 0x4dec, [0xbe, 0xe9, 0x3c, 0xc7, 0x22, 0xf5, 0xdf, 0xe0]);
interface ITextStoreAnchor : IUnknown
{
    HRESULT AdviseSink(const(GUID)*, IUnknown, uint);
    HRESULT UnadviseSink(IUnknown);
    HRESULT RequestLock(uint, HRESULT*);
    HRESULT GetStatus(TS_STATUS*);
    HRESULT QueryInsert(IAnchor, IAnchor, uint, IAnchor*, IAnchor*);
    HRESULT GetSelection(uint, uint, TS_SELECTION_ANCHOR*, uint*);
    HRESULT SetSelection(uint, const(TS_SELECTION_ANCHOR)*);
    HRESULT GetText(uint, IAnchor, IAnchor, PWSTR, uint, uint*, BOOL);
    HRESULT SetText(uint, IAnchor, IAnchor, const(wchar)*, uint);
    HRESULT GetFormattedText(IAnchor, IAnchor, IDataObject*);
    HRESULT GetEmbedded(uint, IAnchor, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT InsertEmbedded(uint, IAnchor, IAnchor, IDataObject);
    HRESULT RequestSupportedAttrs(uint, uint, const(GUID)*);
    HRESULT RequestAttrsAtPosition(IAnchor, uint, const(GUID)*, uint);
    HRESULT RequestAttrsTransitioningAtPosition(IAnchor, uint, const(GUID)*, uint);
    HRESULT FindNextAttrTransition(IAnchor, IAnchor, uint, const(GUID)*, uint, BOOL*, int*);
    HRESULT RetrieveRequestedAttrs(uint, TS_ATTRVAL*, uint*);
    HRESULT GetStart(IAnchor*);
    HRESULT GetEnd(IAnchor*);
    HRESULT GetActiveView(uint*);
    HRESULT GetAnchorFromPoint(uint, const(POINT)*, uint, IAnchor*);
    HRESULT GetTextExt(uint, IAnchor, IAnchor, RECT*, BOOL*);
    HRESULT GetScreenExt(uint, RECT*);
    HRESULT GetWnd(uint, HWND*);
    HRESULT QueryInsertEmbedded(const(GUID)*, const(FORMATETC)*, BOOL*);
    HRESULT InsertTextAtSelection(uint, const(wchar)*, uint, IAnchor*, IAnchor*);
    HRESULT InsertEmbeddedAtSelection(uint, IDataObject, IAnchor*, IAnchor*);
}
enum IID_ITextStoreAnchorSink = GUID(0xaa80e905, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITextStoreAnchorSink : IUnknown
{
    HRESULT OnTextChange(TEXT_STORE_CHANGE_FLAGS, IAnchor, IAnchor);
    HRESULT OnSelectionChange();
    HRESULT OnLayoutChange(TsLayoutCode, uint);
    HRESULT OnStatusChange(uint);
    HRESULT OnAttrsChange(IAnchor, IAnchor, uint, const(GUID)*);
    HRESULT OnLockGranted(TEXT_STORE_LOCK_FLAGS);
    HRESULT OnStartEditTransaction();
    HRESULT OnEndEditTransaction();
}
enum IID_ITfLangBarMgr = GUID(0x87955690, 0xe627, 0x11d2, [0x8d, 0xdb, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfLangBarMgr : IUnknown
{
    HRESULT AdviseEventSink(ITfLangBarEventSink, HWND, uint, uint*);
    HRESULT UnadviseEventSink(uint);
    HRESULT GetThreadMarshalInterface(uint, uint, const(GUID)*, IUnknown*);
    HRESULT GetThreadLangBarItemMgr(uint, ITfLangBarItemMgr*, uint*);
    HRESULT GetInputProcessorProfiles(uint, ITfInputProcessorProfiles*, uint*);
    HRESULT RestoreLastFocus(uint*, BOOL);
    HRESULT SetModalInput(ITfLangBarEventSink, uint, uint);
    HRESULT ShowFloating(uint);
    HRESULT GetShowFloatingStatus(uint*);
}
enum IID_ITfLangBarEventSink = GUID(0x18a4e900, 0xe0ae, 0x11d2, [0xaf, 0xdd, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfLangBarEventSink : IUnknown
{
    HRESULT OnSetFocus(uint);
    HRESULT OnThreadTerminate(uint);
    HRESULT OnThreadItemChange(uint);
    HRESULT OnModalInput(uint, uint, WPARAM, LPARAM);
    HRESULT ShowFloating(uint);
    HRESULT GetItemFloatingRect(uint, const(GUID)*, RECT*);
}
enum IID_ITfLangBarItemSink = GUID(0x57dbe1a0, 0xde25, 0x11d2, [0xaf, 0xdd, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfLangBarItemSink : IUnknown
{
    HRESULT OnUpdate(uint);
}
enum IID_IEnumTfLangBarItems = GUID(0x583f34d0, 0xde25, 0x11d2, [0xaf, 0xdd, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface IEnumTfLangBarItems : IUnknown
{
    HRESULT Clone(IEnumTfLangBarItems*);
    HRESULT Next(uint, ITfLangBarItem*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
struct TF_LANGBARITEMINFO
{
    GUID clsidService;
    GUID guidItem;
    uint dwStyle;
    uint ulSort;
    wchar[32] szDescription;
}
enum IID_ITfLangBarItemMgr = GUID(0xba468c55, 0x9956, 0x4fb1, [0xa5, 0x9d, 0x52, 0xa7, 0xdd, 0x7c, 0xc6, 0xaa]);
interface ITfLangBarItemMgr : IUnknown
{
    HRESULT EnumItems(IEnumTfLangBarItems*);
    HRESULT GetItem(const(GUID)*, ITfLangBarItem*);
    HRESULT AddItem(ITfLangBarItem);
    HRESULT RemoveItem(ITfLangBarItem);
    HRESULT AdviseItemSink(ITfLangBarItemSink, uint*, const(GUID)*);
    HRESULT UnadviseItemSink(uint);
    HRESULT GetItemFloatingRect(uint, const(GUID)*, RECT*);
    HRESULT GetItemsStatus(uint, const(GUID)*, uint*);
    HRESULT GetItemNum(uint*);
    HRESULT GetItems(uint, ITfLangBarItem*, TF_LANGBARITEMINFO*, uint*, uint*);
    HRESULT AdviseItemsSink(uint, ITfLangBarItemSink*, const(GUID)*, uint*);
    HRESULT UnadviseItemsSink(uint, uint*);
}
enum IID_ITfLangBarItem = GUID(0x73540d69, 0xedeb, 0x4ee9, [0x96, 0xc9, 0x23, 0xaa, 0x30, 0xb2, 0x59, 0x16]);
interface ITfLangBarItem : IUnknown
{
    HRESULT GetInfo(TF_LANGBARITEMINFO*);
    HRESULT GetStatus(uint*);
    HRESULT Show(BOOL);
    HRESULT GetTooltipString(BSTR*);
}
enum IID_ITfSystemLangBarItemSink = GUID(0x1449d9ab, 0x13cf, 0x4687, [0xaa, 0x3e, 0x8d, 0x8b, 0x18, 0x57, 0x43, 0x96]);
interface ITfSystemLangBarItemSink : IUnknown
{
    HRESULT InitMenu(ITfMenu);
    HRESULT OnMenuSelect(uint);
}
enum IID_ITfSystemLangBarItem = GUID(0x1e13e9ec, 0x6b33, 0x4d4a, [0xb5, 0xeb, 0x8a, 0x92, 0xf0, 0x29, 0xf3, 0x56]);
interface ITfSystemLangBarItem : IUnknown
{
    HRESULT SetIcon(HICON);
    HRESULT SetTooltipString(PWSTR, uint);
}
enum IID_ITfSystemLangBarItemText = GUID(0x5c4ce0e5, 0xba49, 0x4b52, [0xac, 0x6b, 0x3b, 0x39, 0x7b, 0x4f, 0x70, 0x1f]);
interface ITfSystemLangBarItemText : IUnknown
{
    HRESULT SetItemText(const(wchar)*, uint);
    HRESULT GetItemText(BSTR*);
}
enum IID_ITfSystemDeviceTypeLangBarItem = GUID(0x45672eb9, 0x9059, 0x46a2, [0x83, 0x8d, 0x45, 0x30, 0x35, 0x5f, 0x6a, 0x77]);
interface ITfSystemDeviceTypeLangBarItem : IUnknown
{
    HRESULT SetIconMode(LANG_BAR_ITEM_ICON_MODE_FLAGS);
    HRESULT GetIconMode(uint*);
}
alias TfLBIClick = int;
enum : int
{
    TF_LBI_CLK_RIGHT = 0x00000001,
    TF_LBI_CLK_LEFT  = 0x00000002,
}

enum IID_ITfLangBarItemButton = GUID(0x28c7f1d0, 0xde25, 0x11d2, [0xaf, 0xdd, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfLangBarItemButton : ITfLangBarItem
{
    HRESULT OnClick(TfLBIClick, POINT, const(RECT)*);
    HRESULT InitMenu(ITfMenu);
    HRESULT OnMenuSelect(uint);
    HRESULT GetIcon(HICON*);
    HRESULT GetText(BSTR*);
}
enum IID_ITfLangBarItemBitmapButton = GUID(0xa26a0525, 0x3fae, 0x4fa0, [0x89, 0xee, 0x88, 0xa9, 0x64, 0xf9, 0xf1, 0xb5]);
interface ITfLangBarItemBitmapButton : ITfLangBarItem
{
    HRESULT OnClick(TfLBIClick, POINT, const(RECT)*);
    HRESULT InitMenu(ITfMenu);
    HRESULT OnMenuSelect(uint);
    HRESULT GetPreferredSize(const(SIZE)*, SIZE*);
    HRESULT DrawBitmap(int, int, uint, HBITMAP*, HBITMAP*);
    HRESULT GetText(BSTR*);
}
enum IID_ITfLangBarItemBitmap = GUID(0x73830352, 0xd722, 0x4179, [0xad, 0xa5, 0xf0, 0x45, 0xc9, 0x8d, 0xf3, 0x55]);
interface ITfLangBarItemBitmap : ITfLangBarItem
{
    HRESULT OnClick(TfLBIClick, POINT, const(RECT)*);
    HRESULT GetPreferredSize(const(SIZE)*, SIZE*);
    HRESULT DrawBitmap(int, int, uint, HBITMAP*, HBITMAP*);
}
alias TfLBBalloonStyle = int;
enum : int
{
    TF_LB_BALLOON_RECO = 0x00000000,
    TF_LB_BALLOON_SHOW = 0x00000001,
    TF_LB_BALLOON_MISS = 0x00000002,
}

struct TF_LBBALLOONINFO
{
    TfLBBalloonStyle style;
    BSTR bstrText;
}
enum IID_ITfLangBarItemBalloon = GUID(0x1c2d285, 0xd3c7, 0x4b7b, [0xb5, 0xb5, 0xd9, 0x74, 0x11, 0xd0, 0xc2, 0x83]);
interface ITfLangBarItemBalloon : ITfLangBarItem
{
    HRESULT OnClick(TfLBIClick, POINT, const(RECT)*);
    HRESULT GetPreferredSize(const(SIZE)*, SIZE*);
    HRESULT GetBalloonInfo(TF_LBBALLOONINFO*);
}
enum IID_ITfMenu = GUID(0x6f8a98e4, 0xaaa0, 0x4f15, [0x8c, 0x5b, 0x7, 0xe0, 0xdf, 0xa, 0x3d, 0xd8]);
interface ITfMenu : IUnknown
{
    HRESULT AddMenuItem(uint, uint, HBITMAP, HBITMAP, const(wchar)*, uint, ITfMenu*);
}
struct TF_PERSISTENT_PROPERTY_HEADER_ACP
{
    GUID guidType;
    int ichStart;
    int cch;
    uint cb;
    uint dwPrivate;
    GUID clsidTIP;
}
struct TF_LANGUAGEPROFILE
{
    GUID clsid;
    ushort langid;
    GUID catid;
    BOOL fActive;
    GUID guidProfile;
}
alias TfAnchor = int;
enum : int
{
    TF_ANCHOR_START = 0x00000000,
    TF_ANCHOR_END   = 0x00000001,
}

enum IID_ITfThreadMgr = GUID(0xaa80e801, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfThreadMgr : IUnknown
{
    HRESULT Activate(uint*);
    HRESULT Deactivate();
    HRESULT CreateDocumentMgr(ITfDocumentMgr*);
    HRESULT EnumDocumentMgrs(IEnumTfDocumentMgrs*);
    HRESULT GetFocus(ITfDocumentMgr*);
    HRESULT SetFocus(ITfDocumentMgr);
    HRESULT AssociateFocus(HWND, ITfDocumentMgr, ITfDocumentMgr*);
    HRESULT IsThreadFocus(BOOL*);
    HRESULT GetFunctionProvider(const(GUID)*, ITfFunctionProvider*);
    HRESULT EnumFunctionProviders(IEnumTfFunctionProviders*);
    HRESULT GetGlobalCompartment(ITfCompartmentMgr*);
}
enum IID_ITfThreadMgrEx = GUID(0x3e90ade3, 0x7594, 0x4cb0, [0xbb, 0x58, 0x69, 0x62, 0x8f, 0x5f, 0x45, 0x8c]);
interface ITfThreadMgrEx : ITfThreadMgr
{
    HRESULT ActivateEx(uint*, uint);
    HRESULT GetActiveFlags(uint*);
}
enum IID_ITfThreadMgr2 = GUID(0xab198ef, 0x6477, 0x4ee8, [0x88, 0x12, 0x67, 0x80, 0xed, 0xb8, 0x2d, 0x5e]);
interface ITfThreadMgr2 : IUnknown
{
    HRESULT Activate(uint*);
    HRESULT Deactivate();
    HRESULT CreateDocumentMgr(ITfDocumentMgr*);
    HRESULT EnumDocumentMgrs(IEnumTfDocumentMgrs*);
    HRESULT GetFocus(ITfDocumentMgr*);
    HRESULT SetFocus(ITfDocumentMgr);
    HRESULT IsThreadFocus(BOOL*);
    HRESULT GetFunctionProvider(const(GUID)*, ITfFunctionProvider*);
    HRESULT EnumFunctionProviders(IEnumTfFunctionProviders*);
    HRESULT GetGlobalCompartment(ITfCompartmentMgr*);
    HRESULT ActivateEx(uint*, uint);
    HRESULT GetActiveFlags(uint*);
    HRESULT SuspendKeystrokeHandling();
    HRESULT ResumeKeystrokeHandling();
}
enum IID_ITfThreadMgrEventSink = GUID(0xaa80e80e, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfThreadMgrEventSink : IUnknown
{
    HRESULT OnInitDocumentMgr(ITfDocumentMgr);
    HRESULT OnUninitDocumentMgr(ITfDocumentMgr);
    HRESULT OnSetFocus(ITfDocumentMgr, ITfDocumentMgr);
    HRESULT OnPushContext(ITfContext);
    HRESULT OnPopContext(ITfContext);
}
enum IID_ITfConfigureSystemKeystrokeFeed = GUID(0xd2c969a, 0xbc9c, 0x437c, [0x84, 0xee, 0x95, 0x1c, 0x49, 0xb1, 0xa7, 0x64]);
interface ITfConfigureSystemKeystrokeFeed : IUnknown
{
    HRESULT DisableSystemKeystrokeFeed();
    HRESULT EnableSystemKeystrokeFeed();
}
enum IID_IEnumTfDocumentMgrs = GUID(0xaa80e808, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface IEnumTfDocumentMgrs : IUnknown
{
    HRESULT Clone(IEnumTfDocumentMgrs*);
    HRESULT Next(uint, ITfDocumentMgr*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfDocumentMgr = GUID(0xaa80e7f4, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfDocumentMgr : IUnknown
{
    HRESULT CreateContext(uint, uint, IUnknown, ITfContext*, uint*);
    HRESULT Push(ITfContext);
    HRESULT Pop(uint);
    HRESULT GetTop(ITfContext*);
    HRESULT GetBase(ITfContext*);
    HRESULT EnumContexts(IEnumTfContexts*);
}
enum IID_IEnumTfContexts = GUID(0x8f1a7ea6, 0x1654, 0x4502, [0xa8, 0x6e, 0xb2, 0x90, 0x23, 0x44, 0xd5, 0x7]);
interface IEnumTfContexts : IUnknown
{
    HRESULT Clone(IEnumTfContexts*);
    HRESULT Next(uint, ITfContext*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfCompositionView = GUID(0xd7540241, 0xf9a1, 0x4364, [0xbe, 0xfc, 0xdb, 0xcd, 0x2c, 0x43, 0x95, 0xb7]);
interface ITfCompositionView : IUnknown
{
    HRESULT GetOwnerClsid(GUID*);
    HRESULT GetRange(ITfRange*);
}
enum IID_IEnumITfCompositionView = GUID(0x5efd22ba, 0x7838, 0x46cb, [0x88, 0xe2, 0xca, 0xdb, 0x14, 0x12, 0x4f, 0x8f]);
interface IEnumITfCompositionView : IUnknown
{
    HRESULT Clone(IEnumITfCompositionView*);
    HRESULT Next(uint, ITfCompositionView*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfComposition = GUID(0x20168d64, 0x5a8f, 0x4a5a, [0xb7, 0xbd, 0xcf, 0xa2, 0x9f, 0x4d, 0xf, 0xd9]);
interface ITfComposition : IUnknown
{
    HRESULT GetRange(ITfRange*);
    HRESULT ShiftStart(uint, ITfRange);
    HRESULT ShiftEnd(uint, ITfRange);
    HRESULT EndComposition(uint);
}
enum IID_ITfCompositionSink = GUID(0xa781718c, 0x579a, 0x4b15, [0xa2, 0x80, 0x32, 0xb8, 0x57, 0x7a, 0xcc, 0x5e]);
interface ITfCompositionSink : IUnknown
{
    HRESULT OnCompositionTerminated(uint, ITfComposition);
}
enum IID_ITfContextComposition = GUID(0xd40c8aae, 0xac92, 0x4fc7, [0x9a, 0x11, 0xe, 0xe0, 0xe2, 0x3a, 0xa3, 0x9b]);
interface ITfContextComposition : IUnknown
{
    HRESULT StartComposition(uint, ITfRange, ITfCompositionSink, ITfComposition*);
    HRESULT EnumCompositions(IEnumITfCompositionView*);
    HRESULT FindComposition(uint, ITfRange, IEnumITfCompositionView*);
    HRESULT TakeOwnership(uint, ITfCompositionView, ITfCompositionSink, ITfComposition*);
}
enum IID_ITfContextOwnerCompositionServices = GUID(0x86462810, 0x593b, 0x4916, [0x97, 0x64, 0x19, 0xc0, 0x8e, 0x9c, 0xe1, 0x10]);
interface ITfContextOwnerCompositionServices : ITfContextComposition
{
    HRESULT TerminateComposition(ITfCompositionView);
}
enum IID_ITfContextOwnerCompositionSink = GUID(0x5f20aa40, 0xb57a, 0x4f34, [0x96, 0xab, 0x35, 0x76, 0xf3, 0x77, 0xcc, 0x79]);
interface ITfContextOwnerCompositionSink : IUnknown
{
    HRESULT OnStartComposition(ITfCompositionView, BOOL*);
    HRESULT OnUpdateComposition(ITfCompositionView, ITfRange);
    HRESULT OnEndComposition(ITfCompositionView);
}
enum IID_ITfContextView = GUID(0x2433bf8e, 0xf9b, 0x435c, [0xba, 0x2c, 0x18, 0x6, 0x11, 0x97, 0x8c, 0x30]);
interface ITfContextView : IUnknown
{
    HRESULT GetRangeFromPoint(uint, const(POINT)*, uint, ITfRange*);
    HRESULT GetTextExt(uint, ITfRange, RECT*, BOOL*);
    HRESULT GetScreenExt(RECT*);
    HRESULT GetWnd(HWND*);
}
enum IID_IEnumTfContextViews = GUID(0xf0c0f8dd, 0xcf38, 0x44e1, [0xbb, 0xf, 0x68, 0xcf, 0xd, 0x55, 0x1c, 0x78]);
interface IEnumTfContextViews : IUnknown
{
    HRESULT Clone(IEnumTfContextViews*);
    HRESULT Next(uint, ITfContextView*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
alias TfActiveSelEnd = int;
enum : int
{
    TF_AE_NONE  = 0x00000000,
    TF_AE_START = 0x00000001,
    TF_AE_END   = 0x00000002,
}

struct TF_SELECTIONSTYLE
{
    TfActiveSelEnd ase;
    BOOL fInterimChar;
}
struct TF_SELECTION
{
    ITfRange range;
    TF_SELECTIONSTYLE style;
}
enum IID_ITfContext = GUID(0xaa80e7fd, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfContext : IUnknown
{
    HRESULT RequestEditSession(uint, ITfEditSession, TF_CONTEXT_EDIT_CONTEXT_FLAGS, HRESULT*);
    HRESULT InWriteSession(uint, BOOL*);
    HRESULT GetSelection(uint, uint, uint, TF_SELECTION*, uint*);
    HRESULT SetSelection(uint, uint, const(TF_SELECTION)*);
    HRESULT GetStart(uint, ITfRange*);
    HRESULT GetEnd(uint, ITfRange*);
    HRESULT GetActiveView(ITfContextView*);
    HRESULT EnumViews(IEnumTfContextViews*);
    HRESULT GetStatus(TS_STATUS*);
    HRESULT GetProperty(const(GUID)*, ITfProperty*);
    HRESULT GetAppProperty(const(GUID)*, ITfReadOnlyProperty*);
    HRESULT TrackProperties(const(GUID)**, uint, const(GUID)**, uint, ITfReadOnlyProperty*);
    HRESULT EnumProperties(IEnumTfProperties*);
    HRESULT GetDocumentMgr(ITfDocumentMgr*);
    HRESULT CreateRangeBackup(uint, ITfRange, ITfRangeBackup*);
}
enum IID_ITfQueryEmbedded = GUID(0xfab9bdb, 0xd250, 0x4169, [0x84, 0xe5, 0x6b, 0xe1, 0x18, 0xfd, 0xd7, 0xa8]);
interface ITfQueryEmbedded : IUnknown
{
    HRESULT QueryInsertEmbedded(const(GUID)*, const(FORMATETC)*, BOOL*);
}
enum IID_ITfInsertAtSelection = GUID(0x55ce16ba, 0x3014, 0x41c1, [0x9c, 0xeb, 0xfa, 0xde, 0x14, 0x46, 0xac, 0x6c]);
interface ITfInsertAtSelection : IUnknown
{
    HRESULT InsertTextAtSelection(uint, INSERT_TEXT_AT_SELECTION_FLAGS, const(wchar)*, int, ITfRange*);
    HRESULT InsertEmbeddedAtSelection(uint, uint, IDataObject, ITfRange*);
}
enum IID_ITfCleanupContextSink = GUID(0x1689689, 0x7acb, 0x4e9b, [0xab, 0x7c, 0x7e, 0xa4, 0x6b, 0x12, 0xb5, 0x22]);
interface ITfCleanupContextSink : IUnknown
{
    HRESULT OnCleanupContext(uint, ITfContext);
}
enum IID_ITfCleanupContextDurationSink = GUID(0x45c35144, 0x154e, 0x4797, [0xbe, 0xd8, 0xd3, 0x3a, 0xe7, 0xbf, 0x87, 0x94]);
interface ITfCleanupContextDurationSink : IUnknown
{
    HRESULT OnStartCleanupContext();
    HRESULT OnEndCleanupContext();
}
enum IID_ITfReadOnlyProperty = GUID(0x17d49a3d, 0xf8b8, 0x4b2f, [0xb2, 0x54, 0x52, 0x31, 0x9d, 0xd6, 0x4c, 0x53]);
interface ITfReadOnlyProperty : IUnknown
{
    HRESULT GetType(GUID*);
    HRESULT EnumRanges(uint, IEnumTfRanges*, ITfRange);
    HRESULT GetValue(uint, ITfRange, VARIANT*);
    HRESULT GetContext(ITfContext*);
}
struct TF_PROPERTYVAL
{
    GUID guidId;
    VARIANT varValue;
}
enum IID_IEnumTfPropertyValue = GUID(0x8ed8981b, 0x7c10, 0x4d7d, [0x9f, 0xb3, 0xab, 0x72, 0xe9, 0xc7, 0x5f, 0x72]);
interface IEnumTfPropertyValue : IUnknown
{
    HRESULT Clone(IEnumTfPropertyValue*);
    HRESULT Next(uint, TF_PROPERTYVAL*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfMouseTracker = GUID(0x9d146cd, 0xa544, 0x4132, [0x92, 0x5b, 0x7a, 0xfa, 0x8e, 0xf3, 0x22, 0xd0]);
interface ITfMouseTracker : IUnknown
{
    HRESULT AdviseMouseSink(ITfRange, ITfMouseSink, uint*);
    HRESULT UnadviseMouseSink(uint);
}
enum IID_ITfMouseTrackerACP = GUID(0x3bdd78e2, 0xc16e, 0x47fd, [0xb8, 0x83, 0xce, 0x6f, 0xac, 0xc1, 0xa2, 0x8]);
interface ITfMouseTrackerACP : IUnknown
{
    HRESULT AdviseMouseSink(ITfRangeACP, ITfMouseSink, uint*);
    HRESULT UnadviseMouseSink(uint);
}
enum IID_ITfMouseSink = GUID(0xa1adaaa2, 0x3a24, 0x449d, [0xac, 0x96, 0x51, 0x83, 0xe7, 0xf5, 0xc2, 0x17]);
interface ITfMouseSink : IUnknown
{
    HRESULT OnMouseEvent(uint, uint, uint, BOOL*);
}
enum IID_ITfEditRecord = GUID(0x42d4d099, 0x7c1a, 0x4a89, [0xb8, 0x36, 0x6c, 0x6f, 0x22, 0x16, 0xd, 0xf0]);
interface ITfEditRecord : IUnknown
{
    HRESULT GetSelectionStatus(BOOL*);
    HRESULT GetTextAndPropertyUpdates(GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, const(GUID)**, uint, IEnumTfRanges*);
}
enum IID_ITfTextEditSink = GUID(0x8127d409, 0xccd3, 0x4683, [0x96, 0x7a, 0xb4, 0x3d, 0x5b, 0x48, 0x2b, 0xf7]);
interface ITfTextEditSink : IUnknown
{
    HRESULT OnEndEdit(ITfContext, uint, ITfEditRecord);
}
alias TfLayoutCode = int;
enum : int
{
    TF_LC_CREATE  = 0x00000000,
    TF_LC_CHANGE  = 0x00000001,
    TF_LC_DESTROY = 0x00000002,
}

enum IID_ITfTextLayoutSink = GUID(0x2af2d06a, 0xdd5b, 0x4927, [0xa0, 0xb4, 0x54, 0xf1, 0x9c, 0x91, 0xfa, 0xde]);
interface ITfTextLayoutSink : IUnknown
{
    HRESULT OnLayoutChange(ITfContext, TfLayoutCode, ITfContextView);
}
enum IID_ITfStatusSink = GUID(0x6b7d8d73, 0xb267, 0x4f69, [0xb3, 0x2e, 0x1c, 0xa3, 0x21, 0xce, 0x4f, 0x45]);
interface ITfStatusSink : IUnknown
{
    HRESULT OnStatusChange(ITfContext, uint);
}
enum IID_ITfEditTransactionSink = GUID(0x708fbf70, 0xb520, 0x416b, [0xb0, 0x6c, 0x2c, 0x41, 0xab, 0x44, 0xf8, 0xba]);
interface ITfEditTransactionSink : IUnknown
{
    HRESULT OnStartEditTransaction(ITfContext);
    HRESULT OnEndEditTransaction(ITfContext);
}
enum IID_ITfContextOwner = GUID(0xaa80e80c, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfContextOwner : IUnknown
{
    HRESULT GetACPFromPoint(const(POINT)*, uint, int*);
    HRESULT GetTextExt(int, int, RECT*, BOOL*);
    HRESULT GetScreenExt(RECT*);
    HRESULT GetStatus(TS_STATUS*);
    HRESULT GetWnd(HWND*);
    HRESULT GetAttribute(const(GUID)*, VARIANT*);
}
enum IID_ITfContextOwnerServices = GUID(0xb23eb630, 0x3e1c, 0x11d3, [0xa7, 0x45, 0x0, 0x50, 0x4, 0xa, 0xb4, 0x7]);
interface ITfContextOwnerServices : IUnknown
{
    HRESULT OnLayoutChange();
    HRESULT OnStatusChange(uint);
    HRESULT OnAttributeChange(const(GUID)*);
    HRESULT Serialize(ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream);
    HRESULT Unserialize(ITfProperty, const(TF_PERSISTENT_PROPERTY_HEADER_ACP)*, IStream, ITfPersistentPropertyLoaderACP);
    HRESULT ForceLoadProperty(ITfProperty);
    HRESULT CreateRange(int, int, ITfRangeACP*);
}
enum IID_ITfContextKeyEventSink = GUID(0x552ba5d, 0xc835, 0x4934, [0xbf, 0x50, 0x84, 0x6a, 0xaa, 0x67, 0x43, 0x2f]);
interface ITfContextKeyEventSink : IUnknown
{
    HRESULT OnKeyDown(WPARAM, LPARAM, BOOL*);
    HRESULT OnKeyUp(WPARAM, LPARAM, BOOL*);
    HRESULT OnTestKeyDown(WPARAM, LPARAM, BOOL*);
    HRESULT OnTestKeyUp(WPARAM, LPARAM, BOOL*);
}
enum IID_ITfEditSession = GUID(0xaa80e803, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfEditSession : IUnknown
{
    HRESULT DoEditSession(uint);
}
alias TfGravity = int;
enum : int
{
    TF_GRAVITY_BACKWARD = 0x00000000,
    TF_GRAVITY_FORWARD  = 0x00000001,
}

alias TfShiftDir = int;
enum : int
{
    TF_SD_BACKWARD = 0x00000000,
    TF_SD_FORWARD  = 0x00000001,
}

struct TF_HALTCOND
{
    ITfRange pHaltRange;
    TfAnchor aHaltPos;
    uint dwFlags;
}
enum IID_ITfRange = GUID(0xaa80e7ff, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfRange : IUnknown
{
    HRESULT GetText(uint, uint, PWSTR, uint, uint*);
    HRESULT SetText(uint, uint, const(wchar)*, int);
    HRESULT GetFormattedText(uint, IDataObject*);
    HRESULT GetEmbedded(uint, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT InsertEmbedded(uint, uint, IDataObject);
    HRESULT ShiftStart(uint, int, int*, const(TF_HALTCOND)*);
    HRESULT ShiftEnd(uint, int, int*, const(TF_HALTCOND)*);
    HRESULT ShiftStartToRange(uint, ITfRange, TfAnchor);
    HRESULT ShiftEndToRange(uint, ITfRange, TfAnchor);
    HRESULT ShiftStartRegion(uint, TfShiftDir, BOOL*);
    HRESULT ShiftEndRegion(uint, TfShiftDir, BOOL*);
    HRESULT IsEmpty(uint, BOOL*);
    HRESULT Collapse(uint, TfAnchor);
    HRESULT IsEqualStart(uint, ITfRange, TfAnchor, BOOL*);
    HRESULT IsEqualEnd(uint, ITfRange, TfAnchor, BOOL*);
    HRESULT CompareStart(uint, ITfRange, TfAnchor, int*);
    HRESULT CompareEnd(uint, ITfRange, TfAnchor, int*);
    HRESULT AdjustForInsert(uint, uint, BOOL*);
    HRESULT GetGravity(TfGravity*, TfGravity*);
    HRESULT SetGravity(uint, TfGravity, TfGravity);
    HRESULT Clone(ITfRange*);
    HRESULT GetContext(ITfContext*);
}
enum IID_ITfRangeACP = GUID(0x57a6296, 0x29b, 0x4154, [0xb7, 0x9a, 0xd, 0x46, 0x1d, 0x4e, 0xa9, 0x4c]);
interface ITfRangeACP : ITfRange
{
    HRESULT GetExtent(int*, int*);
    HRESULT SetExtent(int, int);
}
enum IID_ITextStoreACPServices = GUID(0xaa80e901, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITextStoreACPServices : IUnknown
{
    HRESULT Serialize(ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream);
    HRESULT Unserialize(ITfProperty, const(TF_PERSISTENT_PROPERTY_HEADER_ACP)*, IStream, ITfPersistentPropertyLoaderACP);
    HRESULT ForceLoadProperty(ITfProperty);
    HRESULT CreateRange(int, int, ITfRangeACP*);
}
enum IID_ITfRangeBackup = GUID(0x463a506d, 0x6992, 0x49d2, [0x9b, 0x88, 0x93, 0xd5, 0x5e, 0x70, 0xbb, 0x16]);
interface ITfRangeBackup : IUnknown
{
    HRESULT Restore(uint, ITfRange);
}
enum IID_ITfPropertyStore = GUID(0x6834b120, 0x88cb, 0x11d2, [0xbf, 0x45, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfPropertyStore : IUnknown
{
    HRESULT GetType(GUID*);
    HRESULT GetDataType(uint*);
    HRESULT GetData(VARIANT*);
    HRESULT OnTextUpdated(uint, ITfRange, BOOL*);
    HRESULT Shrink(ITfRange, BOOL*);
    HRESULT Divide(ITfRange, ITfRange, ITfPropertyStore*);
    HRESULT Clone(ITfPropertyStore*);
    HRESULT GetPropertyRangeCreator(GUID*);
    HRESULT Serialize(IStream, uint*);
}
enum IID_IEnumTfRanges = GUID(0xf99d3f40, 0x8e32, 0x11d2, [0xbf, 0x46, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface IEnumTfRanges : IUnknown
{
    HRESULT Clone(IEnumTfRanges*);
    HRESULT Next(uint, ITfRange*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfCreatePropertyStore = GUID(0x2463fbf0, 0xb0af, 0x11d2, [0xaf, 0xc5, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfCreatePropertyStore : IUnknown
{
    HRESULT IsStoreSerializable(const(GUID)*, ITfRange, ITfPropertyStore, BOOL*);
    HRESULT CreatePropertyStore(const(GUID)*, ITfRange, uint, IStream, ITfPropertyStore*);
}
enum IID_ITfPersistentPropertyLoaderACP = GUID(0x4ef89150, 0x807, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfPersistentPropertyLoaderACP : IUnknown
{
    HRESULT LoadProperty(const(TF_PERSISTENT_PROPERTY_HEADER_ACP)*, IStream*);
}
enum IID_ITfProperty = GUID(0xe2449660, 0x9542, 0x11d2, [0xbf, 0x46, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfProperty : ITfReadOnlyProperty
{
    HRESULT FindRange(uint, ITfRange, ITfRange*, TfAnchor);
    HRESULT SetValueStore(uint, ITfRange, ITfPropertyStore);
    HRESULT SetValue(uint, ITfRange, const(VARIANT)*);
    HRESULT Clear(uint, ITfRange);
}
enum IID_IEnumTfProperties = GUID(0x19188cb0, 0xaca9, 0x11d2, [0xaf, 0xc5, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface IEnumTfProperties : IUnknown
{
    HRESULT Clone(IEnumTfProperties*);
    HRESULT Next(uint, ITfProperty*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfCompartment = GUID(0xbb08f7a9, 0x607a, 0x4384, [0x86, 0x23, 0x5, 0x68, 0x92, 0xb6, 0x43, 0x71]);
interface ITfCompartment : IUnknown
{
    HRESULT SetValue(uint, const(VARIANT)*);
    HRESULT GetValue(VARIANT*);
}
enum IID_ITfCompartmentEventSink = GUID(0x743abd5f, 0xf26d, 0x48df, [0x8c, 0xc5, 0x23, 0x84, 0x92, 0x41, 0x9b, 0x64]);
interface ITfCompartmentEventSink : IUnknown
{
    HRESULT OnChange(const(GUID)*);
}
enum IID_ITfCompartmentMgr = GUID(0x7dcf57ac, 0x18ad, 0x438b, [0x82, 0x4d, 0x97, 0x9b, 0xff, 0xb7, 0x4b, 0x7c]);
interface ITfCompartmentMgr : IUnknown
{
    HRESULT GetCompartment(const(GUID)*, ITfCompartment*);
    HRESULT ClearCompartment(uint, const(GUID)*);
    HRESULT EnumCompartments(IEnumGUID*);
}
enum IID_ITfFunction = GUID(0xdb593490, 0x98f, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfFunction : IUnknown
{
    HRESULT GetDisplayName(BSTR*);
}
enum IID_ITfFunctionProvider = GUID(0x101d6610, 0x990, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfFunctionProvider : IUnknown
{
    HRESULT GetType(GUID*);
    HRESULT GetDescription(BSTR*);
    HRESULT GetFunction(const(GUID)*, const(GUID)*, IUnknown*);
}
enum IID_IEnumTfFunctionProviders = GUID(0xe4b24db0, 0x990, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface IEnumTfFunctionProviders : IUnknown
{
    HRESULT Clone(IEnumTfFunctionProviders*);
    HRESULT Next(uint, ITfFunctionProvider*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfInputProcessorProfiles = GUID(0x1f02b6c5, 0x7842, 0x4ee6, [0x8a, 0xb, 0x9a, 0x24, 0x18, 0x3a, 0x95, 0xca]);
interface ITfInputProcessorProfiles : IUnknown
{
    HRESULT Register(const(GUID)*);
    HRESULT Unregister(const(GUID)*);
    HRESULT AddLanguageProfile(const(GUID)*, ushort, const(GUID)*, const(wchar)*, uint, const(wchar)*, uint, uint);
    HRESULT RemoveLanguageProfile(const(GUID)*, ushort, const(GUID)*);
    HRESULT EnumInputProcessorInfo(IEnumGUID*);
    HRESULT GetDefaultLanguageProfile(ushort, const(GUID)*, GUID*, GUID*);
    HRESULT SetDefaultLanguageProfile(ushort, const(GUID)*, const(GUID)*);
    HRESULT ActivateLanguageProfile(const(GUID)*, ushort, const(GUID)*);
    HRESULT GetActiveLanguageProfile(const(GUID)*, ushort*, GUID*);
    HRESULT GetLanguageProfileDescription(const(GUID)*, ushort, const(GUID)*, BSTR*);
    HRESULT GetCurrentLanguage(ushort*);
    HRESULT ChangeCurrentLanguage(ushort);
    HRESULT GetLanguageList(ushort**, uint*);
    HRESULT EnumLanguageProfiles(ushort, IEnumTfLanguageProfiles*);
    HRESULT EnableLanguageProfile(const(GUID)*, ushort, const(GUID)*, BOOL);
    HRESULT IsEnabledLanguageProfile(const(GUID)*, ushort, const(GUID)*, BOOL*);
    HRESULT EnableLanguageProfileByDefault(const(GUID)*, ushort, const(GUID)*, BOOL);
    HRESULT SubstituteKeyboardLayout(const(GUID)*, ushort, const(GUID)*, HKL);
}
enum IID_ITfInputProcessorProfilesEx = GUID(0x892f230f, 0xfe00, 0x4a41, [0xa9, 0x8e, 0xfc, 0xd6, 0xde, 0xd, 0x35, 0xef]);
interface ITfInputProcessorProfilesEx : ITfInputProcessorProfiles
{
    HRESULT SetLanguageProfileDisplayName(const(GUID)*, ushort, const(GUID)*, const(wchar)*, uint, uint);
}
enum IID_ITfInputProcessorProfileSubstituteLayout = GUID(0x4fd67194, 0x1002, 0x4513, [0xbf, 0xf2, 0xc0, 0xdd, 0xf6, 0x25, 0x85, 0x52]);
interface ITfInputProcessorProfileSubstituteLayout : IUnknown
{
    HRESULT GetSubstituteKeyboardLayout(const(GUID)*, ushort, const(GUID)*, HKL*);
}
enum IID_ITfActiveLanguageProfileNotifySink = GUID(0xb246cb75, 0xa93e, 0x4652, [0xbf, 0x8c, 0xb3, 0xfe, 0xc, 0xfd, 0x7e, 0x57]);
interface ITfActiveLanguageProfileNotifySink : IUnknown
{
    HRESULT OnActivated(const(GUID)*, const(GUID)*, BOOL);
}
enum IID_IEnumTfLanguageProfiles = GUID(0x3d61bf11, 0xac5f, 0x42c8, [0xa4, 0xcb, 0x93, 0x1b, 0xcc, 0x28, 0xc7, 0x44]);
interface IEnumTfLanguageProfiles : IUnknown
{
    HRESULT Clone(IEnumTfLanguageProfiles*);
    HRESULT Next(uint, TF_LANGUAGEPROFILE*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfLanguageProfileNotifySink = GUID(0x43c9fe15, 0xf494, 0x4c17, [0x9d, 0xe2, 0xb8, 0xa4, 0xac, 0x35, 0xa, 0xa8]);
interface ITfLanguageProfileNotifySink : IUnknown
{
    HRESULT OnLanguageChange(ushort, BOOL*);
    HRESULT OnLanguageChanged();
}
struct TF_INPUTPROCESSORPROFILE
{
    uint dwProfileType;
    ushort langid;
    GUID clsid;
    GUID guidProfile;
    GUID catid;
    HKL hklSubstitute;
    uint dwCaps;
    HKL hkl;
    uint dwFlags;
}
enum IID_ITfInputProcessorProfileMgr = GUID(0x71c6e74c, 0xf28, 0x11d8, [0xa8, 0x2a, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfInputProcessorProfileMgr : IUnknown
{
    HRESULT ActivateProfile(uint, ushort, const(GUID)*, const(GUID)*, HKL, uint);
    HRESULT DeactivateProfile(uint, ushort, const(GUID)*, const(GUID)*, HKL, uint);
    HRESULT GetProfile(uint, ushort, const(GUID)*, const(GUID)*, HKL, TF_INPUTPROCESSORPROFILE*);
    HRESULT EnumProfiles(ushort, IEnumTfInputProcessorProfiles*);
    HRESULT ReleaseInputProcessor(const(GUID)*, uint);
    HRESULT RegisterProfile(const(GUID)*, ushort, const(GUID)*, const(wchar)*, uint, const(wchar)*, uint, uint, HKL, uint, BOOL, uint);
    HRESULT UnregisterProfile(const(GUID)*, ushort, const(GUID)*, uint);
    HRESULT GetActiveProfile(const(GUID)*, TF_INPUTPROCESSORPROFILE*);
}
enum IID_IEnumTfInputProcessorProfiles = GUID(0x71c6e74d, 0xf28, 0x11d8, [0xa8, 0x2a, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface IEnumTfInputProcessorProfiles : IUnknown
{
    HRESULT Clone(IEnumTfInputProcessorProfiles*);
    HRESULT Next(uint, TF_INPUTPROCESSORPROFILE*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfInputProcessorProfileActivationSink = GUID(0x71c6e74e, 0xf28, 0x11d8, [0xa8, 0x2a, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfInputProcessorProfileActivationSink : IUnknown
{
    HRESULT OnActivated(uint, ushort, const(GUID)*, const(GUID)*, const(GUID)*, HKL, uint);
}
struct TF_PRESERVEDKEY
{
    uint uVKey;
    uint uModifiers;
}
enum IID_ITfKeystrokeMgr = GUID(0xaa80e7f0, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfKeystrokeMgr : IUnknown
{
    HRESULT AdviseKeyEventSink(uint, ITfKeyEventSink, BOOL);
    HRESULT UnadviseKeyEventSink(uint);
    HRESULT GetForeground(GUID*);
    HRESULT TestKeyDown(WPARAM, LPARAM, BOOL*);
    HRESULT TestKeyUp(WPARAM, LPARAM, BOOL*);
    HRESULT KeyDown(WPARAM, LPARAM, BOOL*);
    HRESULT KeyUp(WPARAM, LPARAM, BOOL*);
    HRESULT GetPreservedKey(ITfContext, const(TF_PRESERVEDKEY)*, GUID*);
    HRESULT IsPreservedKey(const(GUID)*, const(TF_PRESERVEDKEY)*, BOOL*);
    HRESULT PreserveKey(uint, const(GUID)*, const(TF_PRESERVEDKEY)*, const(wchar)*, uint);
    HRESULT UnpreserveKey(const(GUID)*, const(TF_PRESERVEDKEY)*);
    HRESULT SetPreservedKeyDescription(const(GUID)*, const(wchar)*, uint);
    HRESULT GetPreservedKeyDescription(const(GUID)*, BSTR*);
    HRESULT SimulatePreservedKey(ITfContext, const(GUID)*, BOOL*);
}
enum IID_ITfKeyEventSink = GUID(0xaa80e7f5, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfKeyEventSink : IUnknown
{
    HRESULT OnSetFocus(BOOL);
    HRESULT OnTestKeyDown(ITfContext, WPARAM, LPARAM, BOOL*);
    HRESULT OnTestKeyUp(ITfContext, WPARAM, LPARAM, BOOL*);
    HRESULT OnKeyDown(ITfContext, WPARAM, LPARAM, BOOL*);
    HRESULT OnKeyUp(ITfContext, WPARAM, LPARAM, BOOL*);
    HRESULT OnPreservedKey(ITfContext, const(GUID)*, BOOL*);
}
enum IID_ITfKeyTraceEventSink = GUID(0x1cd4c13b, 0x1c36, 0x4191, [0xa7, 0xa, 0x7f, 0x3e, 0x61, 0x1f, 0x36, 0x7d]);
interface ITfKeyTraceEventSink : IUnknown
{
    HRESULT OnKeyTraceDown(WPARAM, LPARAM);
    HRESULT OnKeyTraceUp(WPARAM, LPARAM);
}
enum IID_ITfPreservedKeyNotifySink = GUID(0x6f77c993, 0xd2b1, 0x446e, [0x85, 0x3e, 0x59, 0x12, 0xef, 0xc8, 0xa2, 0x86]);
interface ITfPreservedKeyNotifySink : IUnknown
{
    HRESULT OnUpdated(const(TF_PRESERVEDKEY)*);
}
enum IID_ITfMessagePump = GUID(0x8f1b8ad8, 0xb6b, 0x4874, [0x90, 0xc5, 0xbd, 0x76, 0x1, 0x1e, 0x8f, 0x7c]);
interface ITfMessagePump : IUnknown
{
    HRESULT PeekMessageA(MSG*, HWND, uint, uint, uint, BOOL*);
    HRESULT GetMessageA(MSG*, HWND, uint, uint, BOOL*);
    HRESULT PeekMessageW(MSG*, HWND, uint, uint, uint, BOOL*);
    HRESULT GetMessageW(MSG*, HWND, uint, uint, BOOL*);
}
enum IID_ITfThreadFocusSink = GUID(0xc0f1db0c, 0x3a20, 0x405c, [0xa3, 0x3, 0x96, 0xb6, 0x1, 0xa, 0x88, 0x5f]);
interface ITfThreadFocusSink : IUnknown
{
    HRESULT OnSetThreadFocus();
    HRESULT OnKillThreadFocus();
}
enum IID_ITfTextInputProcessor = GUID(0xaa80e7f7, 0x2021, 0x11d2, [0x93, 0xe0, 0x0, 0x60, 0xb0, 0x67, 0xb8, 0x6e]);
interface ITfTextInputProcessor : IUnknown
{
    HRESULT Activate(ITfThreadMgr, uint);
    HRESULT Deactivate();
}
enum IID_ITfTextInputProcessorEx = GUID(0x6e4e2102, 0xf9cd, 0x433d, [0xb4, 0x96, 0x30, 0x3c, 0xe0, 0x3a, 0x65, 0x7]);
interface ITfTextInputProcessorEx : ITfTextInputProcessor
{
    HRESULT ActivateEx(ITfThreadMgr, uint, uint);
}
enum IID_ITfClientId = GUID(0xd60a7b49, 0x1b9f, 0x4be2, [0xb7, 0x2, 0x47, 0xe9, 0xdc, 0x5, 0xde, 0xc3]);
interface ITfClientId : IUnknown
{
    HRESULT GetClientId(const(GUID)*, uint*);
}
alias TF_DA_LINESTYLE = int;
enum : int
{
    TF_LS_NONE     = 0x00000000,
    TF_LS_SOLID    = 0x00000001,
    TF_LS_DOT      = 0x00000002,
    TF_LS_DASH     = 0x00000003,
    TF_LS_SQUIGGLE = 0x00000004,
}

alias TF_DA_COLORTYPE = int;
enum : int
{
    TF_CT_NONE     = 0x00000000,
    TF_CT_SYSCOLOR = 0x00000001,
    TF_CT_COLORREF = 0x00000002,
}

struct TF_DA_COLOR
{
    TF_DA_COLORTYPE type;
    union
    {
        int nIndex;
        COLORREF cr;
    }
}
alias TF_DA_ATTR_INFO = int;
enum : int
{
    TF_ATTR_INPUT               = 0x00000000,
    TF_ATTR_TARGET_CONVERTED    = 0x00000001,
    TF_ATTR_CONVERTED           = 0x00000002,
    TF_ATTR_TARGET_NOTCONVERTED = 0x00000003,
    TF_ATTR_INPUT_ERROR         = 0x00000004,
    TF_ATTR_FIXEDCONVERTED      = 0x00000005,
    TF_ATTR_OTHER               = 0xffffffff,
}

struct TF_DISPLAYATTRIBUTE
{
    TF_DA_COLOR crText;
    TF_DA_COLOR crBk;
    TF_DA_LINESTYLE lsStyle;
    BOOL fBoldLine;
    TF_DA_COLOR crLine;
    TF_DA_ATTR_INFO bAttr;
}
enum IID_ITfDisplayAttributeInfo = GUID(0x70528852, 0x2f26, 0x4aea, [0x8c, 0x96, 0x21, 0x51, 0x50, 0x57, 0x89, 0x32]);
interface ITfDisplayAttributeInfo : IUnknown
{
    HRESULT GetGUID(GUID*);
    HRESULT GetDescription(BSTR*);
    HRESULT GetAttributeInfo(TF_DISPLAYATTRIBUTE*);
    HRESULT SetAttributeInfo(const(TF_DISPLAYATTRIBUTE)*);
    HRESULT Reset();
}
enum IID_IEnumTfDisplayAttributeInfo = GUID(0x7cef04d7, 0xcb75, 0x4e80, [0xa7, 0xab, 0x5f, 0x5b, 0xc7, 0xd3, 0x32, 0xde]);
interface IEnumTfDisplayAttributeInfo : IUnknown
{
    HRESULT Clone(IEnumTfDisplayAttributeInfo*);
    HRESULT Next(uint, ITfDisplayAttributeInfo*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfDisplayAttributeProvider = GUID(0xfee47777, 0x163c, 0x4769, [0x99, 0x6a, 0x6e, 0x9c, 0x50, 0xad, 0x8f, 0x54]);
interface ITfDisplayAttributeProvider : IUnknown
{
    HRESULT EnumDisplayAttributeInfo(IEnumTfDisplayAttributeInfo*);
    HRESULT GetDisplayAttributeInfo(const(GUID)*, ITfDisplayAttributeInfo*);
}
enum IID_ITfDisplayAttributeMgr = GUID(0x8ded7393, 0x5db1, 0x475c, [0x9e, 0x71, 0xa3, 0x91, 0x11, 0xb0, 0xff, 0x67]);
interface ITfDisplayAttributeMgr : IUnknown
{
    HRESULT OnUpdateInfo();
    HRESULT EnumDisplayAttributeInfo(IEnumTfDisplayAttributeInfo*);
    HRESULT GetDisplayAttributeInfo(const(GUID)*, ITfDisplayAttributeInfo*, GUID*);
}
enum IID_ITfDisplayAttributeNotifySink = GUID(0xad56f402, 0xe162, 0x4f25, [0x90, 0x8f, 0x7d, 0x57, 0x7c, 0xf9, 0xbd, 0xa9]);
interface ITfDisplayAttributeNotifySink : IUnknown
{
    HRESULT OnUpdateInfo();
}
enum IID_ITfCategoryMgr = GUID(0xc3acefb5, 0xf69d, 0x4905, [0x93, 0x8f, 0xfc, 0xad, 0xcf, 0x4b, 0xe8, 0x30]);
interface ITfCategoryMgr : IUnknown
{
    HRESULT RegisterCategory(const(GUID)*, const(GUID)*, const(GUID)*);
    HRESULT UnregisterCategory(const(GUID)*, const(GUID)*, const(GUID)*);
    HRESULT EnumCategoriesInItem(const(GUID)*, IEnumGUID*);
    HRESULT EnumItemsInCategory(const(GUID)*, IEnumGUID*);
    HRESULT FindClosestCategory(const(GUID)*, GUID*, const(GUID)**, uint);
    HRESULT RegisterGUIDDescription(const(GUID)*, const(GUID)*, const(wchar)*, uint);
    HRESULT UnregisterGUIDDescription(const(GUID)*, const(GUID)*);
    HRESULT GetGUIDDescription(const(GUID)*, BSTR*);
    HRESULT RegisterGUIDDWORD(const(GUID)*, const(GUID)*, uint);
    HRESULT UnregisterGUIDDWORD(const(GUID)*, const(GUID)*);
    HRESULT GetGUIDDWORD(const(GUID)*, uint*);
    HRESULT RegisterGUID(const(GUID)*, uint*);
    HRESULT GetGUID(uint, GUID*);
    HRESULT IsEqualTfGuidAtom(uint, const(GUID)*, BOOL*);
}
enum IID_ITfSource = GUID(0x4ea48a35, 0x60ae, 0x446f, [0x8f, 0xd6, 0xe6, 0xa8, 0xd8, 0x24, 0x59, 0xf7]);
interface ITfSource : IUnknown
{
    HRESULT AdviseSink(const(GUID)*, IUnknown, uint*);
    HRESULT UnadviseSink(uint);
}
enum IID_ITfSourceSingle = GUID(0x73131f9c, 0x56a9, 0x49dd, [0xb0, 0xee, 0xd0, 0x46, 0x63, 0x3f, 0x75, 0x28]);
interface ITfSourceSingle : IUnknown
{
    HRESULT AdviseSingleSink(uint, const(GUID)*, IUnknown);
    HRESULT UnadviseSingleSink(uint, const(GUID)*);
}
enum IID_ITfUIElementMgr = GUID(0xea1ea135, 0x19df, 0x11d7, [0xa6, 0xd2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfUIElementMgr : IUnknown
{
    HRESULT BeginUIElement(ITfUIElement, BOOL*, uint*);
    HRESULT UpdateUIElement(uint);
    HRESULT EndUIElement(uint);
    HRESULT GetUIElement(uint, ITfUIElement*);
    HRESULT EnumUIElements(IEnumTfUIElements*);
}
enum IID_IEnumTfUIElements = GUID(0x887aa91e, 0xacba, 0x4931, [0x84, 0xda, 0x3c, 0x52, 0x8, 0xcf, 0x54, 0x3f]);
interface IEnumTfUIElements : IUnknown
{
    HRESULT Clone(IEnumTfUIElements*);
    HRESULT Next(uint, ITfUIElement*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfUIElementSink = GUID(0xea1ea136, 0x19df, 0x11d7, [0xa6, 0xd2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfUIElementSink : IUnknown
{
    HRESULT BeginUIElement(uint, BOOL*);
    HRESULT UpdateUIElement(uint);
    HRESULT EndUIElement(uint);
}
enum IID_ITfUIElement = GUID(0xea1ea137, 0x19df, 0x11d7, [0xa6, 0xd2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfUIElement : IUnknown
{
    HRESULT GetDescription(BSTR*);
    HRESULT GetGUID(GUID*);
    HRESULT Show(BOOL);
    HRESULT IsShown(BOOL*);
}
enum IID_ITfCandidateListUIElement = GUID(0xea1ea138, 0x19df, 0x11d7, [0xa6, 0xd2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfCandidateListUIElement : ITfUIElement
{
    HRESULT GetUpdatedFlags(uint*);
    HRESULT GetDocumentMgr(ITfDocumentMgr*);
    HRESULT GetCount(uint*);
    HRESULT GetSelection(uint*);
    HRESULT GetString(uint, BSTR*);
    HRESULT GetPageIndex(uint*, uint, uint*);
    HRESULT SetPageIndex(uint*, uint);
    HRESULT GetCurrentPage(uint*);
}
enum IID_ITfCandidateListUIElementBehavior = GUID(0x85fad185, 0x58ce, 0x497a, [0x94, 0x60, 0x35, 0x53, 0x66, 0xb6, 0x4b, 0x9a]);
interface ITfCandidateListUIElementBehavior : ITfCandidateListUIElement
{
    HRESULT SetSelection(uint);
    HRESULT Finalize();
    HRESULT Abort();
}
enum IID_ITfReadingInformationUIElement = GUID(0xea1ea139, 0x19df, 0x11d7, [0xa6, 0xd2, 0x0, 0x6, 0x5b, 0x84, 0x43, 0x5c]);
interface ITfReadingInformationUIElement : ITfUIElement
{
    HRESULT GetUpdatedFlags(uint*);
    HRESULT GetContext(ITfContext*);
    HRESULT GetString(BSTR*);
    HRESULT GetMaxReadingStringLength(uint*);
    HRESULT GetErrorIndex(uint*);
    HRESULT IsVerticalOrderPreferred(BOOL*);
}
enum IID_ITfTransitoryExtensionUIElement = GUID(0x858f956a, 0x972f, 0x42a2, [0xa2, 0xf2, 0x3, 0x21, 0xe1, 0xab, 0xe2, 0x9]);
interface ITfTransitoryExtensionUIElement : ITfUIElement
{
    HRESULT GetDocumentMgr(ITfDocumentMgr*);
}
enum IID_ITfTransitoryExtensionSink = GUID(0xa615096f, 0x1c57, 0x4813, [0x8a, 0x15, 0x55, 0xee, 0x6e, 0x5a, 0x83, 0x9c]);
interface ITfTransitoryExtensionSink : IUnknown
{
    HRESULT OnTransitoryExtensionUpdated(ITfContext, uint, ITfRange, ITfRange, BOOL*);
}
enum IID_ITfToolTipUIElement = GUID(0x52b18b5c, 0x555d, 0x46b2, [0xb0, 0xa, 0xfa, 0x68, 0x1, 0x44, 0xfb, 0xdb]);
interface ITfToolTipUIElement : ITfUIElement
{
    HRESULT GetString(BSTR*);
}
enum IID_ITfReverseConversionList = GUID(0x151d69f0, 0x86f4, 0x4674, [0xb7, 0x21, 0x56, 0x91, 0x1e, 0x79, 0x7f, 0x47]);
interface ITfReverseConversionList : IUnknown
{
    HRESULT GetLength(uint*);
    HRESULT GetString(uint, BSTR*);
}
enum IID_ITfReverseConversion = GUID(0xa415e162, 0x157d, 0x417d, [0x8a, 0x8c, 0xa, 0xb2, 0x6c, 0x7d, 0x27, 0x81]);
interface ITfReverseConversion : IUnknown
{
    HRESULT DoReverseConversion(const(wchar)*, ITfReverseConversionList*);
}
enum IID_ITfReverseConversionMgr = GUID(0xb643c236, 0xc493, 0x41b6, [0xab, 0xb3, 0x69, 0x24, 0x12, 0x77, 0x5c, 0xc4]);
interface ITfReverseConversionMgr : IUnknown
{
    HRESULT GetReverseConversion(ushort, const(GUID)*, uint, ITfReverseConversion*);
}
enum IID_ITfCandidateString = GUID(0x581f317e, 0xfd9d, 0x443f, [0xb9, 0x72, 0xed, 0x0, 0x46, 0x7c, 0x5d, 0x40]);
interface ITfCandidateString : IUnknown
{
    HRESULT GetString(BSTR*);
    HRESULT GetIndex(uint*);
}
enum IID_IEnumTfCandidates = GUID(0xdefb1926, 0x6c80, 0x4ce8, [0x87, 0xd4, 0xd6, 0xb7, 0x2b, 0x81, 0x2b, 0xde]);
interface IEnumTfCandidates : IUnknown
{
    HRESULT Clone(IEnumTfCandidates*);
    HRESULT Next(uint, ITfCandidateString*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
alias TfCandidateResult = int;
enum : int
{
    CAND_FINALIZED = 0x00000000,
    CAND_SELECTED  = 0x00000001,
    CAND_CANCELED  = 0x00000002,
}

enum IID_ITfCandidateList = GUID(0xa3ad50fb, 0x9bdb, 0x49e3, [0xa8, 0x43, 0x6c, 0x76, 0x52, 0xf, 0xbf, 0x5d]);
interface ITfCandidateList : IUnknown
{
    HRESULT EnumCandidates(IEnumTfCandidates*);
    HRESULT GetCandidate(uint, ITfCandidateString*);
    HRESULT GetCandidateNum(uint*);
    HRESULT SetResult(uint, TfCandidateResult);
}
enum IID_ITfFnReconversion = GUID(0x4cea93c0, 0xa58, 0x11d3, [0x8d, 0xf0, 0x0, 0x10, 0x5a, 0x27, 0x99, 0xb5]);
interface ITfFnReconversion : ITfFunction
{
    HRESULT QueryRange(ITfRange, ITfRange*, BOOL*);
    HRESULT GetReconversion(ITfRange, ITfCandidateList*);
    HRESULT Reconvert(ITfRange);
}
enum IID_ITfFnPlayBack = GUID(0xa3a416a4, 0xf64, 0x11d3, [0xb5, 0xb7, 0x0, 0xc0, 0x4f, 0xc3, 0x24, 0xa1]);
interface ITfFnPlayBack : ITfFunction
{
    HRESULT QueryRange(ITfRange, ITfRange*, BOOL*);
    HRESULT Play(ITfRange);
}
enum IID_ITfFnLangProfileUtil = GUID(0xa87a8574, 0xa6c1, 0x4e15, [0x99, 0xf0, 0x3d, 0x39, 0x65, 0xf5, 0x48, 0xeb]);
interface ITfFnLangProfileUtil : ITfFunction
{
    HRESULT RegisterActiveProfiles();
    HRESULT IsProfileAvailableForLang(ushort, BOOL*);
}
enum IID_ITfFnConfigure = GUID(0x88f567c6, 0x1757, 0x49f8, [0xa1, 0xb2, 0x89, 0x23, 0x4c, 0x1e, 0xef, 0xf9]);
interface ITfFnConfigure : ITfFunction
{
    HRESULT Show(HWND, ushort, const(GUID)*);
}
enum IID_ITfFnConfigureRegisterWord = GUID(0xbb95808a, 0x6d8f, 0x4bca, [0x84, 0x0, 0x53, 0x90, 0xb5, 0x86, 0xae, 0xdf]);
interface ITfFnConfigureRegisterWord : ITfFunction
{
    HRESULT Show(HWND, ushort, const(GUID)*, BSTR);
}
enum IID_ITfFnConfigureRegisterEudc = GUID(0xb5e26ff5, 0xd7ad, 0x4304, [0x91, 0x3f, 0x21, 0xa2, 0xed, 0x95, 0xa1, 0xb0]);
interface ITfFnConfigureRegisterEudc : ITfFunction
{
    HRESULT Show(HWND, ushort, const(GUID)*, BSTR);
}
enum IID_ITfFnShowHelp = GUID(0x5ab1d30c, 0x94d, 0x4c29, [0x8e, 0xa5, 0xb, 0xf5, 0x9b, 0xe8, 0x7b, 0xf3]);
interface ITfFnShowHelp : ITfFunction
{
    HRESULT Show(HWND);
}
enum IID_ITfFnBalloon = GUID(0x3bab89e4, 0x5fbe, 0x45f4, [0xa5, 0xbc, 0xdc, 0xa3, 0x6a, 0xd2, 0x25, 0xa8]);
interface ITfFnBalloon : IUnknown
{
    HRESULT UpdateBalloon(TfLBBalloonStyle, const(wchar)*, uint);
}
alias TfSapiObject = int;
enum : int
{
    GETIF_RESMGR           = 0x00000000,
    GETIF_RECOCONTEXT      = 0x00000001,
    GETIF_RECOGNIZER       = 0x00000002,
    GETIF_VOICE            = 0x00000003,
    GETIF_DICTGRAM         = 0x00000004,
    GETIF_RECOGNIZERNOINIT = 0x00000005,
}

enum IID_ITfFnGetSAPIObject = GUID(0x5c0ab7ea, 0x167d, 0x4f59, [0xbf, 0xb5, 0x46, 0x93, 0x75, 0x5e, 0x90, 0xca]);
interface ITfFnGetSAPIObject : ITfFunction
{
    HRESULT Get(TfSapiObject, IUnknown*);
}
enum IID_ITfFnPropertyUIStatus = GUID(0x2338ac6e, 0x2b9d, 0x44c0, [0xa7, 0x5e, 0xee, 0x64, 0xf2, 0x56, 0xb3, 0xbd]);
interface ITfFnPropertyUIStatus : ITfFunction
{
    HRESULT GetStatus(const(GUID)*, uint*);
    HRESULT SetStatus(const(GUID)*, uint);
}
enum IID_IEnumSpeechCommands = GUID(0x8c5dac4f, 0x83c, 0x4b85, [0xa4, 0xc9, 0x71, 0x74, 0x60, 0x48, 0xad, 0xca]);
interface IEnumSpeechCommands : IUnknown
{
    HRESULT Clone(IEnumSpeechCommands*);
    HRESULT Next(uint, ushort**, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ISpeechCommandProvider = GUID(0x38e09d4c, 0x586d, 0x435a, [0xb5, 0x92, 0xc8, 0xa8, 0x66, 0x91, 0xde, 0xc6]);
interface ISpeechCommandProvider : IUnknown
{
    HRESULT EnumSpeechCommands(ushort, IEnumSpeechCommands*);
    HRESULT ProcessCommand(const(wchar)*, uint, ushort);
}
enum IID_ITfFnCustomSpeechCommand = GUID(0xfca6c349, 0xa12f, 0x43a3, [0x8d, 0xd6, 0x5a, 0x5a, 0x42, 0x82, 0x57, 0x7b]);
interface ITfFnCustomSpeechCommand : ITfFunction
{
    HRESULT SetSpeechCommandProvider(IUnknown);
}
enum IID_ITfFnLMProcessor = GUID(0x7afbf8e7, 0xac4b, 0x4082, [0xb0, 0x58, 0x89, 0x8, 0x99, 0xd3, 0xa0, 0x10]);
interface ITfFnLMProcessor : ITfFunction
{
    HRESULT QueryRange(ITfRange, ITfRange*, BOOL*);
    HRESULT QueryLangID(ushort, BOOL*);
    HRESULT GetReconversion(ITfRange, ITfCandidateList*);
    HRESULT Reconvert(ITfRange);
    HRESULT QueryKey(BOOL, WPARAM, LPARAM, BOOL*);
    HRESULT InvokeKey(BOOL, WPARAM, LPARAM);
    HRESULT InvokeFunc(ITfContext, const(GUID)*);
}
enum IID_ITfFnLMInternal = GUID(0x4b825b1, 0xac9a, 0x4f7b, [0xb5, 0xad, 0xc7, 0x16, 0x8f, 0x1e, 0xe4, 0x45]);
interface ITfFnLMInternal : ITfFnLMProcessor
{
    HRESULT ProcessLattice(ITfRange);
}
struct TF_LMLATTELEMENT
{
    uint dwFrameStart;
    uint dwFrameLen;
    uint dwFlags;
    union
    {
        int iCost;
    }
    BSTR bstrText;
}
enum IID_IEnumTfLatticeElements = GUID(0x56988052, 0x47da, 0x4a05, [0x91, 0x1a, 0xe3, 0xd9, 0x41, 0xf1, 0x71, 0x45]);
interface IEnumTfLatticeElements : IUnknown
{
    HRESULT Clone(IEnumTfLatticeElements*);
    HRESULT Next(uint, TF_LMLATTELEMENT*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_ITfLMLattice = GUID(0xd4236675, 0xa5bf, 0x4570, [0x9d, 0x42, 0x5d, 0x6d, 0x7b, 0x2, 0xd5, 0x9b]);
interface ITfLMLattice : IUnknown
{
    HRESULT QueryType(const(GUID)*, BOOL*);
    HRESULT EnumLatticeElements(uint, const(GUID)*, IEnumTfLatticeElements*);
}
enum IID_ITfFnAdviseText = GUID(0x3527268b, 0x7d53, 0x4dd9, [0x92, 0xb7, 0x72, 0x96, 0xae, 0x46, 0x12, 0x49]);
interface ITfFnAdviseText : ITfFunction
{
    HRESULT OnTextUpdate(ITfRange, const(wchar)*, int);
    HRESULT OnLatticeUpdate(ITfRange, ITfLMLattice);
}
enum IID_ITfFnSearchCandidateProvider = GUID(0x87a2ad8f, 0xf27b, 0x4920, [0x85, 0x1, 0x67, 0x60, 0x22, 0x80, 0x17, 0x5d]);
interface ITfFnSearchCandidateProvider : ITfFunction
{
    HRESULT GetSearchCandidates(BSTR, BSTR, ITfCandidateList*);
    HRESULT SetResult(BSTR, BSTR, BSTR);
}
alias TfIntegratableCandidateListSelectionStyle = int;
enum : int
{
    STYLE_ACTIVE_SELECTION  = 0x00000000,
    STYLE_IMPLIED_SELECTION = 0x00000001,
}

enum IID_ITfIntegratableCandidateListUIElement = GUID(0xc7a6f54f, 0xb180, 0x416f, [0xb2, 0xbf, 0x7b, 0xf2, 0xe4, 0x68, 0x3d, 0x7b]);
interface ITfIntegratableCandidateListUIElement : IUnknown
{
    HRESULT SetIntegrationStyle(GUID);
    HRESULT GetSelectionStyle(TfIntegratableCandidateListSelectionStyle*);
    HRESULT OnKeyDown(WPARAM, LPARAM, BOOL*);
    HRESULT ShowCandidateNumbers(BOOL*);
    HRESULT FinalizeExactCompositionString();
}
alias TKBLayoutType = int;
enum : int
{
    TKBLT_UNDEFINED = 0x00000000,
    TKBLT_CLASSIC   = 0x00000001,
    TKBLT_OPTIMIZED = 0x00000002,
}

enum IID_ITfFnGetPreferredTouchKeyboardLayout = GUID(0x5f309a41, 0x590a, 0x4acc, [0xa9, 0x7f, 0xd8, 0xef, 0xff, 0x13, 0xfd, 0xfc]);
interface ITfFnGetPreferredTouchKeyboardLayout : ITfFunction
{
    HRESULT GetLayout(TKBLayoutType*, ushort*);
}
enum IID_ITfFnGetLinguisticAlternates = GUID(0xea163ce2, 0x7a65, 0x4506, [0x82, 0xa3, 0xc5, 0x28, 0x21, 0x5d, 0xa6, 0x4e]);
interface ITfFnGetLinguisticAlternates : ITfFunction
{
    HRESULT GetAlternates(ITfRange, ITfCandidateList*);
}
enum IID_IUIManagerEventSink = GUID(0xcd91d690, 0xa7e8, 0x4265, [0x9b, 0x38, 0x8b, 0xb3, 0xbb, 0xab, 0xa7, 0xde]);
interface IUIManagerEventSink : IUnknown
{
    HRESULT OnWindowOpening(RECT*);
    HRESULT OnWindowOpened(RECT*);
    HRESULT OnWindowUpdating(RECT*);
    HRESULT OnWindowUpdated(RECT*);
    HRESULT OnWindowClosing();
    HRESULT OnWindowClosed();
}
alias InputScope = int;
enum : int
{
    IS_DEFAULT                       = 0x00000000,
    IS_URL                           = 0x00000001,
    IS_FILE_FULLFILEPATH             = 0x00000002,
    IS_FILE_FILENAME                 = 0x00000003,
    IS_EMAIL_USERNAME                = 0x00000004,
    IS_EMAIL_SMTPEMAILADDRESS        = 0x00000005,
    IS_LOGINNAME                     = 0x00000006,
    IS_PERSONALNAME_FULLNAME         = 0x00000007,
    IS_PERSONALNAME_PREFIX           = 0x00000008,
    IS_PERSONALNAME_GIVENNAME        = 0x00000009,
    IS_PERSONALNAME_MIDDLENAME       = 0x0000000a,
    IS_PERSONALNAME_SURNAME          = 0x0000000b,
    IS_PERSONALNAME_SUFFIX           = 0x0000000c,
    IS_ADDRESS_FULLPOSTALADDRESS     = 0x0000000d,
    IS_ADDRESS_POSTALCODE            = 0x0000000e,
    IS_ADDRESS_STREET                = 0x0000000f,
    IS_ADDRESS_STATEORPROVINCE       = 0x00000010,
    IS_ADDRESS_CITY                  = 0x00000011,
    IS_ADDRESS_COUNTRYNAME           = 0x00000012,
    IS_ADDRESS_COUNTRYSHORTNAME      = 0x00000013,
    IS_CURRENCY_AMOUNTANDSYMBOL      = 0x00000014,
    IS_CURRENCY_AMOUNT               = 0x00000015,
    IS_DATE_FULLDATE                 = 0x00000016,
    IS_DATE_MONTH                    = 0x00000017,
    IS_DATE_DAY                      = 0x00000018,
    IS_DATE_YEAR                     = 0x00000019,
    IS_DATE_MONTHNAME                = 0x0000001a,
    IS_DATE_DAYNAME                  = 0x0000001b,
    IS_DIGITS                        = 0x0000001c,
    IS_NUMBER                        = 0x0000001d,
    IS_ONECHAR                       = 0x0000001e,
    IS_PASSWORD                      = 0x0000001f,
    IS_TELEPHONE_FULLTELEPHONENUMBER = 0x00000020,
    IS_TELEPHONE_COUNTRYCODE         = 0x00000021,
    IS_TELEPHONE_AREACODE            = 0x00000022,
    IS_TELEPHONE_LOCALNUMBER         = 0x00000023,
    IS_TIME_FULLTIME                 = 0x00000024,
    IS_TIME_HOUR                     = 0x00000025,
    IS_TIME_MINORSEC                 = 0x00000026,
    IS_NUMBER_FULLWIDTH              = 0x00000027,
    IS_ALPHANUMERIC_HALFWIDTH        = 0x00000028,
    IS_ALPHANUMERIC_FULLWIDTH        = 0x00000029,
    IS_CURRENCY_CHINESE              = 0x0000002a,
    IS_BOPOMOFO                      = 0x0000002b,
    IS_HIRAGANA                      = 0x0000002c,
    IS_KATAKANA_HALFWIDTH            = 0x0000002d,
    IS_KATAKANA_FULLWIDTH            = 0x0000002e,
    IS_HANJA                         = 0x0000002f,
    IS_HANGUL_HALFWIDTH              = 0x00000030,
    IS_HANGUL_FULLWIDTH              = 0x00000031,
    IS_SEARCH                        = 0x00000032,
    IS_FORMULA                       = 0x00000033,
    IS_SEARCH_INCREMENTAL            = 0x00000034,
    IS_CHINESE_HALFWIDTH             = 0x00000035,
    IS_CHINESE_FULLWIDTH             = 0x00000036,
    IS_NATIVE_SCRIPT                 = 0x00000037,
    IS_YOMI                          = 0x00000038,
    IS_TEXT                          = 0x00000039,
    IS_CHAT                          = 0x0000003a,
    IS_NAME_OR_PHONENUMBER           = 0x0000003b,
    IS_EMAILNAME_OR_ADDRESS          = 0x0000003c,
    IS_PRIVATE                       = 0x0000003d,
    IS_MAPS                          = 0x0000003e,
    IS_NUMERIC_PASSWORD              = 0x0000003f,
    IS_NUMERIC_PIN                   = 0x00000040,
    IS_ALPHANUMERIC_PIN              = 0x00000041,
    IS_ALPHANUMERIC_PIN_SET          = 0x00000042,
    IS_FORMULA_NUMBER                = 0x00000043,
    IS_CHAT_WITHOUT_EMOJI            = 0x00000044,
    IS_PHRASELIST                    = 0xffffffff,
    IS_REGULAREXPRESSION             = 0xfffffffe,
    IS_SRGS                          = 0xfffffffd,
    IS_XML                           = 0xfffffffc,
    IS_ENUMSTRING                    = 0xfffffffb,
}

enum IID_ITfInputScope = GUID(0xfde1eaee, 0x6924, 0x4cdf, [0x91, 0xe7, 0xda, 0x38, 0xcf, 0xf5, 0x55, 0x9d]);
interface ITfInputScope : IUnknown
{
    HRESULT GetInputScopes(InputScope**, uint*);
    HRESULT GetPhrase(BSTR**, uint*);
    HRESULT GetRegularExpression(BSTR*);
    HRESULT GetSRGS(BSTR*);
    HRESULT GetXML(BSTR*);
}
enum IID_ITfInputScope2 = GUID(0x5731eaa0, 0x6bc2, 0x4681, [0xa5, 0x32, 0x92, 0xfb, 0xb7, 0x4d, 0x7c, 0x41]);
interface ITfInputScope2 : ITfInputScope
{
    HRESULT EnumWordList(IEnumString*);
}
enum CLSID_MSAAControl = GUID(0x8cd963f, 0x7a3e, 0x4f5c, [0x9b, 0xd8, 0xd6, 0x92, 0xbb, 0x4, 0x3c, 0x5b]);
struct MSAAControl
{
}
enum CLSID_AccStore = GUID(0x5440837f, 0x4bff, 0x4ae5, [0xa1, 0xb1, 0x77, 0x22, 0xec, 0xc6, 0x33, 0x2a]);
struct AccStore
{
}
enum CLSID_AccDictionary = GUID(0x6572ee16, 0x5fe5, 0x4331, [0xbb, 0x6d, 0x76, 0xa4, 0x9c, 0x56, 0xe4, 0x23]);
struct AccDictionary
{
}
enum CLSID_AccServerDocMgr = GUID(0x6089a37e, 0xeb8a, 0x482d, [0xbd, 0x6f, 0xf9, 0xf4, 0x69, 0x4, 0xd1, 0x6d]);
struct AccServerDocMgr
{
}
enum CLSID_AccClientDocMgr = GUID(0xfc48cc30, 0x4f3e, 0x4fa1, [0x80, 0x3b, 0xad, 0xe, 0x19, 0x6a, 0x83, 0xb1]);
struct AccClientDocMgr
{
}
enum CLSID_DocWrap = GUID(0xbf426f7e, 0x7a5e, 0x44d6, [0x83, 0xc, 0xa3, 0x90, 0xea, 0x94, 0x62, 0xa3]);
struct DocWrap
{
}
enum IID_ITfMSAAControl = GUID(0xb5f8fb3b, 0x393f, 0x4f7c, [0x84, 0xcb, 0x50, 0x49, 0x24, 0xc2, 0x70, 0x5a]);
interface ITfMSAAControl : IUnknown
{
    HRESULT SystemEnableMSAA();
    HRESULT SystemDisableMSAA();
}
enum IID_IInternalDocWrap = GUID(0xe1aa6466, 0x9db4, 0x40ba, [0xbe, 0x3, 0x77, 0xc3, 0x8e, 0x8e, 0x60, 0xb2]);
interface IInternalDocWrap : IUnknown
{
    HRESULT NotifyRevoke();
}
enum IID_ITextStoreACPEx = GUID(0xa2de3bc2, 0x3d8e, 0x11d3, [0x81, 0xa9, 0xf7, 0x53, 0xfb, 0xe6, 0x1a, 0x0]);
interface ITextStoreACPEx : IUnknown
{
    HRESULT ScrollToRect(int, int, RECT, uint);
}
enum IID_ITextStoreAnchorEx = GUID(0xa2de3bc1, 0x3d8e, 0x11d3, [0x81, 0xa9, 0xf7, 0x53, 0xfb, 0xe6, 0x1a, 0x0]);
interface ITextStoreAnchorEx : IUnknown
{
    HRESULT ScrollToRect(IAnchor, IAnchor, RECT, uint);
}
enum IID_ITextStoreACPSinkEx = GUID(0x2bdf9464, 0x41e2, 0x43e3, [0x95, 0xc, 0xa6, 0x86, 0x5b, 0xa2, 0x5c, 0xd4]);
interface ITextStoreACPSinkEx : ITextStoreACPSink
{
    HRESULT OnDisconnect();
}
enum IID_ITextStoreSinkAnchorEx = GUID(0x25642426, 0x28d, 0x4474, [0x97, 0x7b, 0x11, 0x1b, 0xb1, 0x14, 0xfe, 0x3e]);
interface ITextStoreSinkAnchorEx : ITextStoreAnchorSink
{
    HRESULT OnDisconnect();
}
enum IID_IAccDictionary = GUID(0x1dc4cb5f, 0xd737, 0x474d, [0xad, 0xe9, 0x5c, 0xcf, 0xc9, 0xbc, 0x1c, 0xc9]);
interface IAccDictionary : IUnknown
{
    HRESULT GetLocalizedString(const(GUID)*, uint, BSTR*, uint*);
    HRESULT GetParentTerm(const(GUID)*, GUID*);
    HRESULT GetMnemonicString(const(GUID)*, BSTR*);
    HRESULT LookupMnemonicTerm(BSTR, GUID*);
    HRESULT ConvertValueToString(const(GUID)*, uint, VARIANT, BSTR*, uint*);
}
enum IID_IVersionInfo = GUID(0x401518ec, 0xdb00, 0x4611, [0x9b, 0x29, 0x2a, 0xe, 0x4b, 0x9a, 0xfa, 0x85]);
interface IVersionInfo : IUnknown
{
    HRESULT GetSubcomponentCount(uint, uint*);
    HRESULT GetImplementationID(uint, GUID*);
    HRESULT GetBuildVersion(uint, uint*, uint*);
    HRESULT GetComponentDescription(uint, BSTR*);
    HRESULT GetInstanceDescription(uint, BSTR*);
}
enum IID_ICoCreateLocally = GUID(0x3de00aa, 0xf272, 0x41e3, [0x99, 0xcb, 0x3, 0xc5, 0xe8, 0x11, 0x4e, 0xa0]);
interface ICoCreateLocally : IUnknown
{
    HRESULT CoCreateLocally(const(GUID)*, uint, const(GUID)*, IUnknown*, const(GUID)*, IUnknown, VARIANT);
}
enum IID_ICoCreatedLocally = GUID(0xa53eb6c, 0x1908, 0x4742, [0x8c, 0xff, 0x2c, 0xee, 0x2e, 0x93, 0xf9, 0x4c]);
interface ICoCreatedLocally : IUnknown
{
    HRESULT LocalInit(IUnknown, const(GUID)*, IUnknown, VARIANT);
}
enum IID_IAccStore = GUID(0xe2cd4a63, 0x2b72, 0x4d48, [0xb7, 0x39, 0x95, 0xe4, 0x76, 0x51, 0x95, 0xba]);
interface IAccStore : IUnknown
{
    HRESULT Register(const(GUID)*, IUnknown);
    HRESULT Unregister(IUnknown);
    HRESULT GetDocuments(IEnumUnknown*);
    HRESULT LookupByHWND(HWND, const(GUID)*, IUnknown*);
    HRESULT LookupByPoint(POINT, const(GUID)*, IUnknown*);
    HRESULT OnDocumentFocus(IUnknown);
    HRESULT GetFocused(const(GUID)*, IUnknown*);
}
enum IID_IAccServerDocMgr = GUID(0xad7c73cf, 0x6dd5, 0x4855, [0xab, 0xc2, 0xb0, 0x4b, 0xad, 0x5b, 0x91, 0x53]);
interface IAccServerDocMgr : IUnknown
{
    HRESULT NewDocument(const(GUID)*, IUnknown);
    HRESULT RevokeDocument(IUnknown);
    HRESULT OnDocumentFocus(IUnknown);
}
enum IID_IAccClientDocMgr = GUID(0x4c896039, 0x7b6d, 0x49e6, [0xa8, 0xc1, 0x45, 0x11, 0x6a, 0x98, 0x29, 0x2b]);
interface IAccClientDocMgr : IUnknown
{
    HRESULT GetDocuments(IEnumUnknown*);
    HRESULT LookupByHWND(HWND, const(GUID)*, IUnknown*);
    HRESULT LookupByPoint(POINT, const(GUID)*, IUnknown*);
    HRESULT GetFocused(const(GUID)*, IUnknown*);
}
enum IID_IDocWrap = GUID(0xdcd285fe, 0xbe0, 0x43bd, [0x99, 0xc9, 0xaa, 0xae, 0xc5, 0x13, 0xc5, 0x55]);
interface IDocWrap : IUnknown
{
    HRESULT SetDoc(const(GUID)*, IUnknown);
    HRESULT GetWrappedDoc(const(GUID)*, IUnknown*);
}
enum IID_IClonableWrapper = GUID(0xb33e75ff, 0xe84c, 0x4dca, [0xa2, 0x5c, 0x33, 0xb8, 0xdc, 0x0, 0x33, 0x74]);
interface IClonableWrapper : IUnknown
{
    HRESULT CloneNewWrapper(const(GUID)*, void**);
}
enum IID_ITfSpeechUIServer = GUID(0x90e9a944, 0x9244, 0x489f, [0xa7, 0x8f, 0xde, 0x67, 0xaf, 0xc0, 0x13, 0xa7]);
interface ITfSpeechUIServer : IUnknown
{
    HRESULT Initialize();
    HRESULT ShowUI(BOOL);
    HRESULT UpdateBalloon(TfLBBalloonStyle, const(wchar)*, uint);
}
