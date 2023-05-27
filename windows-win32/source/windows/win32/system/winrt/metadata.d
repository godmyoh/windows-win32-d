module windows.win32.system.winrt.metadata;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.system.com : IStream, ITypeInfo, IUnknown;
import windows.win32.system.variant : VARIANT;
import windows.win32.system.winrt : HSTRING, ROPARAMIIDHANDLE;

version (Windows):
extern (Windows):

HRESULT MetaDataGetDispenser(const(GUID)*, const(GUID)*, void**);
HRESULT RoGetMetaDataFile(const(HSTRING), IMetaDataDispenserEx, HSTRING*, IMetaDataImport2*, uint*);
HRESULT RoParseTypeName(HSTRING, uint*, HSTRING**);
HRESULT RoResolveNamespace(const(HSTRING), const(HSTRING), const(uint), const(HSTRING)*, uint*, HSTRING**, uint*, HSTRING**);
HRESULT RoIsApiContractPresent(const(wchar)*, ushort, ushort, BOOL*);
HRESULT RoIsApiContractMajorVersionPresent(const(wchar)*, ushort, BOOL*);
/+ [UNSUPPORTED] HRESULT RoCreateNonAgilePropertySet(IPropertySet*);
+/
/+ [UNSUPPORTED] HRESULT RoCreatePropertySetSerializer(IPropertySetSerializer*);
+/
HRESULT RoGetParameterizedTypeInstanceIID(uint, const(wchar)**, const(IRoMetaDataLocator), GUID*, ROPARAMIIDHANDLE*);
void RoFreeParameterizedTypeExtra(ROPARAMIIDHANDLE);
PSTR RoParameterizedTypeExtraGetTypeSignature(ROPARAMIIDHANDLE);
enum INVALID_CONNECTION_ID = 0x00000000;
enum INVALID_TASK_ID = 0x00000000;
enum MAX_CONNECTION_NAME = 0x00000104;
enum MAIN_CLR_MODULE_NAME_W = "coreclr";
enum MAIN_CLR_MODULE_NAME_A = "coreclr";
enum MSCOREE_SHIM_W = "mscoree.dll";
enum MSCOREE_SHIM_A = "mscoree.dll";
enum COR_NATIVE_LINK_CUSTOM_VALUE = "COMPLUS_NativeLink";
enum COR_NATIVE_LINK_CUSTOM_VALUE_ANSI = "COMPLUS_NativeLink";
enum COR_NATIVE_LINK_CUSTOM_VALUE_CC = 0x00000012;
enum COR_BASE_SECURITY_ATTRIBUTE_CLASS = "System.Security.Permissions.SecurityAttribute";
enum COR_BASE_SECURITY_ATTRIBUTE_CLASS_ANSI = "System.Security.Permissions.SecurityAttribute";
enum COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE = "System.Security.SuppressUnmanagedCodeSecurityAttribute";
enum COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE_ANSI = "System.Security.SuppressUnmanagedCodeSecurityAttribute";
enum COR_UNVER_CODE_ATTRIBUTE = "System.Security.UnverifiableCodeAttribute";
enum COR_UNVER_CODE_ATTRIBUTE_ANSI = "System.Security.UnverifiableCodeAttribute";
enum COR_REQUIRES_SECOBJ_ATTRIBUTE = "System.Security.DynamicSecurityMethodAttribute";
enum COR_REQUIRES_SECOBJ_ATTRIBUTE_ANSI = "System.Security.DynamicSecurityMethodAttribute";
enum COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE = "System.Runtime.CompilerServices.DiscardableAttribute";
enum COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE_ASNI = "System.Runtime.CompilerServices.DiscardableAttribute";
enum COR_E_UNAUTHORIZEDACCESS = 0xffffffff80070005;
enum COR_E_ARGUMENT = 0xffffffff80070057;
enum COR_E_INVALIDCAST = 0xffffffff80004002;
enum COR_E_OUTOFMEMORY = 0xffffffff8007000e;
enum COR_E_NULLREFERENCE = 0xffffffff80004003;
enum COR_E_AMBIGUOUSMATCH = 0xffffffff8000211d;
enum COR_E_TARGETPARAMCOUNT = 0xffffffff8002000e;
enum COR_E_DIVIDEBYZERO = 0xffffffff80020012;
enum COR_E_BADIMAGEFORMAT = 0xffffffff8007000b;
enum FRAMEWORK_REGISTRY_KEY = "Software\\Microsoft\\.NETFramework";
enum FRAMEWORK_REGISTRY_KEY_W = "Software\\Microsoft\\.NETFramework";
enum USER_FRAMEWORK_REGISTRY_KEY = "Software\\Microsoft\\.NETFramework64";
enum USER_FRAMEWORK_REGISTRY_KEY_W = "Software\\Microsoft\\.NETFramework64";
enum COR_CTOR_METHOD_NAME = ".ctor";
enum COR_CTOR_METHOD_NAME_W = ".ctor";
enum COR_CCTOR_METHOD_NAME = ".cctor";
enum COR_CCTOR_METHOD_NAME_W = ".cctor";
enum COR_ENUM_FIELD_NAME = "value__";
enum COR_ENUM_FIELD_NAME_W = "value__";
enum COR_DELETED_NAME_A = "_Deleted";
enum COR_DELETED_NAME_W = "_Deleted";
enum COR_VTABLEGAP_NAME_A = "_VtblGap";
enum COR_VTABLEGAP_NAME_W = "_VtblGap";
enum INTEROP_DISPID_TYPE_W = "System.Runtime.InteropServices.DispIdAttribute";
enum INTEROP_DISPID_TYPE = "System.Runtime.InteropServices.DispIdAttribute";
enum INTEROP_INTERFACETYPE_TYPE_W = "System.Runtime.InteropServices.InterfaceTypeAttribute";
enum INTEROP_INTERFACETYPE_TYPE = "System.Runtime.InteropServices.InterfaceTypeAttribute";
enum INTEROP_CLASSINTERFACE_TYPE_W = "System.Runtime.InteropServices.ClassInterfaceAttribute";
enum INTEROP_CLASSINTERFACE_TYPE = "System.Runtime.InteropServices.ClassInterfaceAttribute";
enum INTEROP_COMVISIBLE_TYPE_W = "System.Runtime.InteropServices.ComVisibleAttribute";
enum INTEROP_COMVISIBLE_TYPE = "System.Runtime.InteropServices.ComVisibleAttribute";
enum INTEROP_COMREGISTERFUNCTION_TYPE_W = "System.Runtime.InteropServices.ComRegisterFunctionAttribute";
enum INTEROP_COMREGISTERFUNCTION_TYPE = "System.Runtime.InteropServices.ComRegisterFunctionAttribute";
enum INTEROP_COMUNREGISTERFUNCTION_TYPE_W = "System.Runtime.InteropServices.ComUnregisterFunctionAttribute";
enum INTEROP_COMUNREGISTERFUNCTION_TYPE = "System.Runtime.InteropServices.ComUnregisterFunctionAttribute";
enum INTEROP_IMPORTEDFROMTYPELIB_TYPE_W = "System.Runtime.InteropServices.ImportedFromTypeLibAttribute";
enum INTEROP_IMPORTEDFROMTYPELIB_TYPE = "System.Runtime.InteropServices.ImportedFromTypeLibAttribute";
enum INTEROP_PRIMARYINTEROPASSEMBLY_TYPE_W = "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute";
enum INTEROP_PRIMARYINTEROPASSEMBLY_TYPE = "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute";
enum INTEROP_IDISPATCHIMPL_TYPE_W = "System.Runtime.InteropServices.IDispatchImplAttribute";
enum INTEROP_IDISPATCHIMPL_TYPE = "System.Runtime.InteropServices.IDispatchImplAttribute";
enum INTEROP_COMSOURCEINTERFACES_TYPE_W = "System.Runtime.InteropServices.ComSourceInterfacesAttribute";
enum INTEROP_COMSOURCEINTERFACES_TYPE = "System.Runtime.InteropServices.ComSourceInterfacesAttribute";
enum INTEROP_COMDEFAULTINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComDefaultInterfaceAttribute";
enum INTEROP_COMDEFAULTINTERFACE_TYPE = "System.Runtime.InteropServices.ComDefaultInterfaceAttribute";
enum INTEROP_COMCONVERSIONLOSS_TYPE_W = "System.Runtime.InteropServices.ComConversionLossAttribute";
enum INTEROP_COMCONVERSIONLOSS_TYPE = "System.Runtime.InteropServices.ComConversionLossAttribute";
enum INTEROP_BESTFITMAPPING_TYPE_W = "System.Runtime.InteropServices.BestFitMappingAttribute";
enum INTEROP_BESTFITMAPPING_TYPE = "System.Runtime.InteropServices.BestFitMappingAttribute";
enum INTEROP_TYPELIBTYPE_TYPE_W = "System.Runtime.InteropServices.TypeLibTypeAttribute";
enum INTEROP_TYPELIBTYPE_TYPE = "System.Runtime.InteropServices.TypeLibTypeAttribute";
enum INTEROP_TYPELIBFUNC_TYPE_W = "System.Runtime.InteropServices.TypeLibFuncAttribute";
enum INTEROP_TYPELIBFUNC_TYPE = "System.Runtime.InteropServices.TypeLibFuncAttribute";
enum INTEROP_TYPELIBVAR_TYPE_W = "System.Runtime.InteropServices.TypeLibVarAttribute";
enum INTEROP_TYPELIBVAR_TYPE = "System.Runtime.InteropServices.TypeLibVarAttribute";
enum INTEROP_MARSHALAS_TYPE_W = "System.Runtime.InteropServices.MarshalAsAttribute";
enum INTEROP_MARSHALAS_TYPE = "System.Runtime.InteropServices.MarshalAsAttribute";
enum INTEROP_COMIMPORT_TYPE_W = "System.Runtime.InteropServices.ComImportAttribute";
enum INTEROP_COMIMPORT_TYPE = "System.Runtime.InteropServices.ComImportAttribute";
enum INTEROP_GUID_TYPE_W = "System.Runtime.InteropServices.GuidAttribute";
enum INTEROP_GUID_TYPE = "System.Runtime.InteropServices.GuidAttribute";
enum INTEROP_DEFAULTMEMBER_TYPE_W = "System.Reflection.DefaultMemberAttribute";
enum INTEROP_DEFAULTMEMBER_TYPE = "System.Reflection.DefaultMemberAttribute";
enum INTEROP_COMEMULATE_TYPE_W = "System.Runtime.InteropServices.ComEmulateAttribute";
enum INTEROP_COMEMULATE_TYPE = "System.Runtime.InteropServices.ComEmulateAttribute";
enum INTEROP_PRESERVESIG_TYPE_W = "System.Runtime.InteropServices.PreserveSigAttribure";
enum INTEROP_PRESERVESIG_TYPE = "System.Runtime.InteropServices.PreserveSigAttribure";
enum INTEROP_IN_TYPE_W = "System.Runtime.InteropServices.InAttribute";
enum INTEROP_IN_TYPE = "System.Runtime.InteropServices.InAttribute";
enum INTEROP_OUT_TYPE_W = "System.Runtime.InteropServices.OutAttribute";
enum INTEROP_OUT_TYPE = "System.Runtime.InteropServices.OutAttribute";
enum INTEROP_COMALIASNAME_TYPE_W = "System.Runtime.InteropServices.ComAliasNameAttribute";
enum INTEROP_COMALIASNAME_TYPE = "System.Runtime.InteropServices.ComAliasNameAttribute";
enum INTEROP_PARAMARRAY_TYPE_W = "System.ParamArrayAttribute";
enum INTEROP_PARAMARRAY_TYPE = "System.ParamArrayAttribute";
enum INTEROP_LCIDCONVERSION_TYPE_W = "System.Runtime.InteropServices.LCIDConversionAttribute";
enum INTEROP_LCIDCONVERSION_TYPE = "System.Runtime.InteropServices.LCIDConversionAttribute";
enum INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute";
enum INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE = "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute";
enum INTEROP_DECIMALVALUE_TYPE_W = "System.Runtime.CompilerServices.DecimalConstantAttribute";
enum INTEROP_DECIMALVALUE_TYPE = "System.Runtime.CompilerServices.DecimalConstantAttribute";
enum INTEROP_DATETIMEVALUE_TYPE_W = "System.Runtime.CompilerServices.DateTimeConstantAttribute";
enum INTEROP_DATETIMEVALUE_TYPE = "System.Runtime.CompilerServices.DateTimeConstantAttribute";
enum INTEROP_IUNKNOWNVALUE_TYPE_W = "System.Runtime.CompilerServices.IUnknownConstantAttribute";
enum INTEROP_IUNKNOWNVALUE_TYPE = "System.Runtime.CompilerServices.IUnknownConstantAttribute";
enum INTEROP_IDISPATCHVALUE_TYPE_W = "System.Runtime.CompilerServices.IDispatchConstantAttribute";
enum INTEROP_IDISPATCHVALUE_TYPE = "System.Runtime.CompilerServices.IDispatchConstantAttribute";
enum INTEROP_AUTOPROXY_TYPE_W = "System.Runtime.InteropServices.AutomationProxyAttribute";
enum INTEROP_AUTOPROXY_TYPE = "System.Runtime.InteropServices.AutomationProxyAttribute";
enum INTEROP_TYPELIBIMPORTCLASS_TYPE_W = "System.Runtime.InteropServices.TypeLibImportClassAttribute";
enum INTEROP_TYPELIBIMPORTCLASS_TYPE = "System.Runtime.InteropServices.TypeLibImportClassAttribute";
enum INTEROP_TYPELIBVERSION_TYPE_W = "System.Runtime.InteropServices.TypeLibVersionAttribute";
enum INTEROP_TYPELIBVERSION_TYPE = "System.Runtime.InteropServices.TypeLibVersionAttribute";
enum INTEROP_COMCOMPATIBLEVERSION_TYPE_W = "System.Runtime.InteropServices.ComCompatibleVersionAttribute";
enum INTEROP_COMCOMPATIBLEVERSION_TYPE = "System.Runtime.InteropServices.ComCompatibleVersionAttribute";
enum INTEROP_COMEVENTINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComEventInterfaceAttribute";
enum INTEROP_COMEVENTINTERFACE_TYPE = "System.Runtime.InteropServices.ComEventInterfaceAttribute";
enum INTEROP_COCLASS_TYPE_W = "System.Runtime.InteropServices.CoClassAttribute";
enum INTEROP_COCLASS_TYPE = "System.Runtime.InteropServices.CoClassAttribute";
enum INTEROP_SERIALIZABLE_TYPE_W = "System.SerializableAttribute";
enum INTEROP_SERIALIZABLE_TYPE = "System.SerializableAttribute";
enum INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE_W = "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute";
enum INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE = "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute";
enum FORWARD_INTEROP_STUB_METHOD_TYPE_W = "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute";
enum FORWARD_INTEROP_STUB_METHOD_TYPE = "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute";
enum FRIEND_ASSEMBLY_TYPE_W = "System.Runtime.CompilerServices.InternalsVisibleToAttribute";
enum FRIEND_ASSEMBLY_TYPE = "System.Runtime.CompilerServices.InternalsVisibleToAttribute";
enum FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE_W = "System.Runtime.CompilerServices.FriendAccessAllowedAttribute";
enum FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE = "System.Runtime.CompilerServices.FriendAccessAllowedAttribute";
enum SUBJECT_ASSEMBLY_TYPE_W = "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute";
enum SUBJECT_ASSEMBLY_TYPE = "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute";
enum DISABLED_PRIVATE_REFLECTION_TYPE_W = "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute";
enum DISABLED_PRIVATE_REFLECTION_TYPE = "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute";
enum DEFAULTDOMAIN_STA_TYPE_W = "System.STAThreadAttribute";
enum DEFAULTDOMAIN_STA_TYPE = "System.STAThreadAttribute";
enum DEFAULTDOMAIN_MTA_TYPE_W = "System.MTAThreadAttribute";
enum DEFAULTDOMAIN_MTA_TYPE = "System.MTAThreadAttribute";
enum DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE_W = "System.LoaderOptimizationAttribute";
enum DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE = "System.LoaderOptimizationAttribute";
enum NONVERSIONABLE_TYPE_W = "System.Runtime.Versioning.NonVersionableAttribute";
enum NONVERSIONABLE_TYPE = "System.Runtime.Versioning.NonVersionableAttribute";
enum COMPILATIONRELAXATIONS_TYPE_W = "System.Runtime.CompilerServices.CompilationRelaxationsAttribute";
enum COMPILATIONRELAXATIONS_TYPE = "System.Runtime.CompilerServices.CompilationRelaxationsAttribute";
enum RUNTIMECOMPATIBILITY_TYPE_W = "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute";
enum RUNTIMECOMPATIBILITY_TYPE = "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute";
enum DEFAULTDEPENDENCY_TYPE_W = "System.Runtime.CompilerServices.DefaultDependencyAttribute";
enum DEFAULTDEPENDENCY_TYPE = "System.Runtime.CompilerServices.DefaultDependencyAttribute";
enum DEPENDENCY_TYPE_W = "System.Runtime.CompilerServices.DependencyAttribute";
enum DEPENDENCY_TYPE = "System.Runtime.CompilerServices.DependencyAttribute";
enum TARGET_FRAMEWORK_TYPE_W = "System.Runtime.Versioning.TargetFrameworkAttribute";
enum TARGET_FRAMEWORK_TYPE = "System.Runtime.Versioning.TargetFrameworkAttribute";
enum ASSEMBLY_METADATA_TYPE_W = "System.Reflection.AssemblyMetadataAttribute";
enum ASSEMBLY_METADATA_TYPE = "System.Reflection.AssemblyMetadataAttribute";
enum CMOD_CALLCONV_NAMESPACE_OLD = "System.Runtime.InteropServices";
enum CMOD_CALLCONV_NAMESPACE = "System.Runtime.CompilerServices";
enum CMOD_CALLCONV_NAME_CDECL = "CallConvCdecl";
enum CMOD_CALLCONV_NAME_STDCALL = "CallConvStdcall";
enum CMOD_CALLCONV_NAME_THISCALL = "CallConvThiscall";
enum CMOD_CALLCONV_NAME_FASTCALL = "CallConvFastcall";
enum LIBID_ComPlusRuntime = GUID(0xbed7f4ea, 0x1a96, 0x11d2, [0x8f, 0x8, 0x0, 0xa0, 0xc9, 0xa6, 0x18, 0x6d]);
enum GUID_ExportedFromComPlus = GUID(0x90883f05, 0x3d28, 0x11d2, [0x8f, 0x17, 0x0, 0xa0, 0xc9, 0xa6, 0x18, 0x6d]);
enum GUID_ManagedName = GUID(0xf21f359, 0xab84, 0x41e8, [0x9a, 0x78, 0x36, 0xd1, 0x10, 0xe6, 0xd2, 0xf9]);
enum GUID_Function2Getter = GUID(0x54fc8f55, 0x38de, 0x4703, [0x9c, 0x4e, 0x25, 0x3, 0x51, 0x30, 0x2b, 0x1c]);
enum CLSID_CorMetaDataDispenserRuntime = GUID(0x1ec2de53, 0x75cc, 0x11d2, [0x97, 0x75, 0x0, 0xa0, 0xc9, 0xb4, 0xd5, 0xc]);
enum GUID_DispIdOverride = GUID(0xcd2bc5c9, 0xf452, 0x4326, [0xb7, 0x14, 0xf9, 0xc5, 0x39, 0xd4, 0xda, 0x58]);
enum GUID_ForceIEnumerable = GUID(0xb64784eb, 0xd8d4, 0x4d9b, [0x9a, 0xcd, 0xe, 0x30, 0x80, 0x64, 0x26, 0xf7]);
enum GUID_PropGetCA = GUID(0x2941ff83, 0x88d8, 0x4f73, [0xb6, 0xa9, 0xbd, 0xf8, 0x71, 0x2d, 0x0, 0xd]);
enum GUID_PropPutCA = GUID(0x29533527, 0x3683, 0x4364, [0xab, 0xc0, 0xdb, 0x1a, 0xdd, 0x82, 0x2f, 0xa2]);
enum CLSID_CLR_v1_MetaData = GUID(0x5023ca, 0x72b1, 0x11d3, [0x9f, 0xc4, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
enum CLSID_CLR_v2_MetaData = GUID(0xefea471a, 0x44fd, 0x4862, [0x92, 0x92, 0xc, 0x58, 0xd4, 0x6e, 0x1f, 0x3a]);
enum MetaDataCheckDuplicatesFor = GUID(0x30fe7be8, 0xd7d9, 0x11d2, [0x9f, 0x80, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
enum MetaDataRefToDefCheck = GUID(0xde3856f8, 0xd7d9, 0x11d2, [0x9f, 0x80, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
enum MetaDataNotificationForTokenMovement = GUID(0xe5d71a4c, 0xd7da, 0x11d2, [0x9f, 0x80, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
enum MetaDataSetUpdate = GUID(0x2eee315c, 0xd7db, 0x11d2, [0x9f, 0x80, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
enum MetaDataImportOption = GUID(0x79700f36, 0x4aac, 0x11d3, [0x84, 0xc3, 0x0, 0x90, 0x27, 0x86, 0x8c, 0xb1]);
enum MetaDataThreadSafetyOptions = GUID(0xf7559806, 0xf266, 0x42ea, [0x8c, 0x63, 0xa, 0xdb, 0x45, 0xe8, 0xb2, 0x34]);
enum MetaDataErrorIfEmitOutOfOrder = GUID(0x1547872d, 0xdc03, 0x11d2, [0x94, 0x20, 0x0, 0x0, 0xf8, 0x8, 0x34, 0x60]);
enum MetaDataGenerateTCEAdapters = GUID(0xdcc9de90, 0x4151, 0x11d3, [0x88, 0xd6, 0x0, 0x90, 0x27, 0x54, 0xc4, 0x3a]);
enum MetaDataTypeLibImportNamespace = GUID(0xf17ff889, 0x5a63, 0x11d3, [0x9f, 0xf2, 0x0, 0xc0, 0x4f, 0xf7, 0x43, 0x1a]);
enum MetaDataLinkerOptions = GUID(0x47e099b6, 0xae7c, 0x4797, [0x83, 0x17, 0xb4, 0x8a, 0xa6, 0x45, 0xb8, 0xf9]);
enum MetaDataRuntimeVersion = GUID(0x47e099b7, 0xae7c, 0x4797, [0x83, 0x17, 0xb4, 0x8a, 0xa6, 0x45, 0xb8, 0xf9]);
enum MetaDataMergerOptions = GUID(0x132d3a6e, 0xb35d, 0x464e, [0x95, 0x1a, 0x42, 0xef, 0xb9, 0xfb, 0x66, 0x1]);
enum MetaDataPreserveLocalRefs = GUID(0xa55c0354, 0xe91b, 0x468b, [0x86, 0x48, 0x7c, 0xc3, 0x10, 0x35, 0xd5, 0x33]);
enum DESCR_GROUP_METHODDEF = 0x00000000;
enum DESCR_GROUP_METHODIMPL = 0x00000001;
enum CLSID_Cor = GUID(0xbee00010, 0xee77, 0x11d0, [0xa0, 0x15, 0x0, 0xc0, 0x4f, 0xbb, 0xb8, 0x84]);
enum CLSID_CorMetaDataDispenser = GUID(0xe5cb7a31, 0x7512, 0x11d2, [0x89, 0xce, 0x0, 0x80, 0xc7, 0x92, 0xe5, 0xd8]);
enum CLSID_CorMetaDataDispenserReg = GUID(0x435755ff, 0x7397, 0x11d2, [0x97, 0x71, 0x0, 0xa0, 0xc9, 0xb4, 0xd5, 0xc]);
enum CLSID_CorMetaDataReg = GUID(0x87f3a1f5, 0x7397, 0x11d2, [0x97, 0x71, 0x0, 0xa0, 0xc9, 0xb4, 0xd5, 0xc]);
enum SIGN_MASK_ONEBYTE = 0xffffffffffffffc0;
enum SIGN_MASK_TWOBYTE = 0xffffffffffffe000;
enum SIGN_MASK_FOURBYTE = 0xfffffffff0000000;
struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL
{
    uint _bitfield1;
    uint _bitfield2;
    union
    {
        uint ClassToken;
        uint FilterOffset;
    }
}
alias COINITICOR = int;
enum : int
{
    COINITCOR_DEFAULT = 0x00000000,
}

alias COINITIEE = int;
enum : int
{
    COINITEE_DEFAULT = 0x00000000,
    COINITEE_DLL     = 0x00000001,
    COINITEE_MAIN    = 0x00000002,
}

alias COUNINITIEE = int;
enum : int
{
    COUNINITEE_DEFAULT = 0x00000000,
    COUNINITEE_DLL     = 0x00000001,
}

alias ReplacesGeneralNumericDefines = int;
enum : int
{
    IMAGE_DIRECTORY_ENTRY_COMHEADER = 0x0000000e,
}

alias CorTypeAttr = int;
enum : int
{
    tdVisibilityMask     = 0x00000007,
    tdNotPublic          = 0x00000000,
    tdPublic             = 0x00000001,
    tdNestedPublic       = 0x00000002,
    tdNestedPrivate      = 0x00000003,
    tdNestedFamily       = 0x00000004,
    tdNestedAssembly     = 0x00000005,
    tdNestedFamANDAssem  = 0x00000006,
    tdNestedFamORAssem   = 0x00000007,
    tdLayoutMask         = 0x00000018,
    tdAutoLayout         = 0x00000000,
    tdSequentialLayout   = 0x00000008,
    tdExplicitLayout     = 0x00000010,
    tdClassSemanticsMask = 0x00000020,
    tdClass              = 0x00000000,
    tdInterface          = 0x00000020,
    tdAbstract           = 0x00000080,
    tdSealed             = 0x00000100,
    tdSpecialName        = 0x00000400,
    tdImport             = 0x00001000,
    tdSerializable       = 0x00002000,
    tdWindowsRuntime     = 0x00004000,
    tdStringFormatMask   = 0x00030000,
    tdAnsiClass          = 0x00000000,
    tdUnicodeClass       = 0x00010000,
    tdAutoClass          = 0x00020000,
    tdCustomFormatClass  = 0x00030000,
    tdCustomFormatMask   = 0x00c00000,
    tdBeforeFieldInit    = 0x00100000,
    tdForwarder          = 0x00200000,
    tdReservedMask       = 0x00040800,
    tdRTSpecialName      = 0x00000800,
    tdHasSecurity        = 0x00040000,
}

alias CorMethodAttr = int;
enum : int
{
    mdMemberAccessMask      = 0x00000007,
    mdPrivateScope          = 0x00000000,
    mdPrivate               = 0x00000001,
    mdFamANDAssem           = 0x00000002,
    mdAssem                 = 0x00000003,
    mdFamily                = 0x00000004,
    mdFamORAssem            = 0x00000005,
    mdPublic                = 0x00000006,
    mdStatic                = 0x00000010,
    mdFinal                 = 0x00000020,
    mdVirtual               = 0x00000040,
    mdHideBySig             = 0x00000080,
    mdVtableLayoutMask      = 0x00000100,
    mdReuseSlot             = 0x00000000,
    mdNewSlot               = 0x00000100,
    mdCheckAccessOnOverride = 0x00000200,
    mdAbstract              = 0x00000400,
    mdSpecialName           = 0x00000800,
    mdPinvokeImpl           = 0x00002000,
    mdUnmanagedExport       = 0x00000008,
    mdReservedMask          = 0x0000d000,
    mdRTSpecialName         = 0x00001000,
    mdHasSecurity           = 0x00004000,
    mdRequireSecObject      = 0x00008000,
}

alias CorFieldAttr = int;
enum : int
{
    fdFieldAccessMask = 0x00000007,
    fdPrivateScope    = 0x00000000,
    fdPrivate         = 0x00000001,
    fdFamANDAssem     = 0x00000002,
    fdAssembly        = 0x00000003,
    fdFamily          = 0x00000004,
    fdFamORAssem      = 0x00000005,
    fdPublic          = 0x00000006,
    fdStatic          = 0x00000010,
    fdInitOnly        = 0x00000020,
    fdLiteral         = 0x00000040,
    fdNotSerialized   = 0x00000080,
    fdSpecialName     = 0x00000200,
    fdPinvokeImpl     = 0x00002000,
    fdReservedMask    = 0x00009500,
    fdRTSpecialName   = 0x00000400,
    fdHasFieldMarshal = 0x00001000,
    fdHasDefault      = 0x00008000,
    fdHasFieldRVA     = 0x00000100,
}

alias CorParamAttr = int;
enum : int
{
    pdIn              = 0x00000001,
    pdOut             = 0x00000002,
    pdOptional        = 0x00000010,
    pdReservedMask    = 0x0000f000,
    pdHasDefault      = 0x00001000,
    pdHasFieldMarshal = 0x00002000,
    pdUnused          = 0x0000cfe0,
}

alias CorPropertyAttr = int;
enum : int
{
    prSpecialName   = 0x00000200,
    prReservedMask  = 0x0000f400,
    prRTSpecialName = 0x00000400,
    prHasDefault    = 0x00001000,
    prUnused        = 0x0000e9ff,
}

alias CorEventAttr = int;
enum : int
{
    evSpecialName   = 0x00000200,
    evReservedMask  = 0x00000400,
    evRTSpecialName = 0x00000400,
}

alias CorMethodSemanticsAttr = int;
enum : int
{
    msSetter   = 0x00000001,
    msGetter   = 0x00000002,
    msOther    = 0x00000004,
    msAddOn    = 0x00000008,
    msRemoveOn = 0x00000010,
    msFire     = 0x00000020,
}

alias CorDeclSecurity = int;
enum : int
{
    dclActionMask        = 0x0000001f,
    dclActionNil         = 0x00000000,
    dclRequest           = 0x00000001,
    dclDemand            = 0x00000002,
    dclAssert            = 0x00000003,
    dclDeny              = 0x00000004,
    dclPermitOnly        = 0x00000005,
    dclLinktimeCheck     = 0x00000006,
    dclInheritanceCheck  = 0x00000007,
    dclRequestMinimum    = 0x00000008,
    dclRequestOptional   = 0x00000009,
    dclRequestRefuse     = 0x0000000a,
    dclPrejitGrant       = 0x0000000b,
    dclPrejitDenied      = 0x0000000c,
    dclNonCasDemand      = 0x0000000d,
    dclNonCasLinkDemand  = 0x0000000e,
    dclNonCasInheritance = 0x0000000f,
    dclMaximumValue      = 0x0000000f,
}

alias CorMethodImpl = int;
enum : int
{
    miCodeTypeMask        = 0x00000003,
    miIL                  = 0x00000000,
    miNative              = 0x00000001,
    miOPTIL               = 0x00000002,
    miRuntime             = 0x00000003,
    miManagedMask         = 0x00000004,
    miUnmanaged           = 0x00000004,
    miManaged             = 0x00000000,
    miForwardRef          = 0x00000010,
    miPreserveSig         = 0x00000080,
    miInternalCall        = 0x00001000,
    miSynchronized        = 0x00000020,
    miNoInlining          = 0x00000008,
    miAggressiveInlining  = 0x00000100,
    miNoOptimization      = 0x00000040,
    miSecurityMitigations = 0x00000400,
    miUserMask            = 0x000015fc,
    miMaxMethodImplVal    = 0x0000ffff,
}

alias CorPinvokeMap = int;
enum : int
{
    pmNoMangle                      = 0x00000001,
    pmCharSetMask                   = 0x00000006,
    pmCharSetNotSpec                = 0x00000000,
    pmCharSetAnsi                   = 0x00000002,
    pmCharSetUnicode                = 0x00000004,
    pmCharSetAuto                   = 0x00000006,
    pmBestFitUseAssem               = 0x00000000,
    pmBestFitEnabled                = 0x00000010,
    pmBestFitDisabled               = 0x00000020,
    pmBestFitMask                   = 0x00000030,
    pmThrowOnUnmappableCharUseAssem = 0x00000000,
    pmThrowOnUnmappableCharEnabled  = 0x00001000,
    pmThrowOnUnmappableCharDisabled = 0x00002000,
    pmThrowOnUnmappableCharMask     = 0x00003000,
    pmSupportsLastError             = 0x00000040,
    pmCallConvMask                  = 0x00000700,
    pmCallConvWinapi                = 0x00000100,
    pmCallConvCdecl                 = 0x00000200,
    pmCallConvStdcall               = 0x00000300,
    pmCallConvThiscall              = 0x00000400,
    pmCallConvFastcall              = 0x00000500,
    pmMaxValue                      = 0x0000ffff,
}

alias CorAssemblyFlags = int;
enum : int
{
    afPublicKey                  = 0x00000001,
    afPA_None                    = 0x00000000,
    afPA_MSIL                    = 0x00000010,
    afPA_x86                     = 0x00000020,
    afPA_IA64                    = 0x00000030,
    afPA_AMD64                   = 0x00000040,
    afPA_ARM                     = 0x00000050,
    afPA_NoPlatform              = 0x00000070,
    afPA_Specified               = 0x00000080,
    afPA_Mask                    = 0x00000070,
    afPA_FullMask                = 0x000000f0,
    afPA_Shift                   = 0x00000004,
    afEnableJITcompileTracking   = 0x00008000,
    afDisableJITcompileOptimizer = 0x00004000,
    afRetargetable               = 0x00000100,
    afContentType_Default        = 0x00000000,
    afContentType_WindowsRuntime = 0x00000200,
    afContentType_Mask           = 0x00000e00,
}

alias CorManifestResourceFlags = int;
enum : int
{
    mrVisibilityMask = 0x00000007,
    mrPublic         = 0x00000001,
    mrPrivate        = 0x00000002,
}

alias CorFileFlags = int;
enum : int
{
    ffContainsMetaData   = 0x00000000,
    ffContainsNoMetaData = 0x00000001,
}

alias CorPEKind = int;
enum : int
{
    peNot            = 0x00000000,
    peILonly         = 0x00000001,
    pe32BitRequired  = 0x00000002,
    pe32Plus         = 0x00000004,
    pe32Unmanaged    = 0x00000008,
    pe32BitPreferred = 0x00000010,
}

alias CorGenericParamAttr = int;
enum : int
{
    gpVarianceMask                   = 0x00000003,
    gpNonVariant                     = 0x00000000,
    gpCovariant                      = 0x00000001,
    gpContravariant                  = 0x00000002,
    gpSpecialConstraintMask          = 0x0000001c,
    gpNoSpecialConstraint            = 0x00000000,
    gpReferenceTypeConstraint        = 0x00000004,
    gpNotNullableValueTypeConstraint = 0x00000008,
    gpDefaultConstructorConstraint   = 0x00000010,
}

alias CorElementType = ubyte;
enum : ubyte
{
    ELEMENT_TYPE_END         = 0x00,
    ELEMENT_TYPE_VOID        = 0x01,
    ELEMENT_TYPE_BOOLEAN     = 0x02,
    ELEMENT_TYPE_CHAR        = 0x03,
    ELEMENT_TYPE_I1          = 0x04,
    ELEMENT_TYPE_U1          = 0x05,
    ELEMENT_TYPE_I2          = 0x06,
    ELEMENT_TYPE_U2          = 0x07,
    ELEMENT_TYPE_I4          = 0x08,
    ELEMENT_TYPE_U4          = 0x09,
    ELEMENT_TYPE_I8          = 0x0a,
    ELEMENT_TYPE_U8          = 0x0b,
    ELEMENT_TYPE_R4          = 0x0c,
    ELEMENT_TYPE_R8          = 0x0d,
    ELEMENT_TYPE_STRING      = 0x0e,
    ELEMENT_TYPE_PTR         = 0x0f,
    ELEMENT_TYPE_BYREF       = 0x10,
    ELEMENT_TYPE_VALUETYPE   = 0x11,
    ELEMENT_TYPE_CLASS       = 0x12,
    ELEMENT_TYPE_VAR         = 0x13,
    ELEMENT_TYPE_ARRAY       = 0x14,
    ELEMENT_TYPE_GENERICINST = 0x15,
    ELEMENT_TYPE_TYPEDBYREF  = 0x16,
    ELEMENT_TYPE_I           = 0x18,
    ELEMENT_TYPE_U           = 0x19,
    ELEMENT_TYPE_FNPTR       = 0x1b,
    ELEMENT_TYPE_OBJECT      = 0x1c,
    ELEMENT_TYPE_SZARRAY     = 0x1d,
    ELEMENT_TYPE_MVAR        = 0x1e,
    ELEMENT_TYPE_CMOD_REQD   = 0x1f,
    ELEMENT_TYPE_CMOD_OPT    = 0x20,
    ELEMENT_TYPE_INTERNAL    = 0x21,
    ELEMENT_TYPE_MAX         = 0x22,
    ELEMENT_TYPE_MODIFIER    = 0x40,
    ELEMENT_TYPE_SENTINEL    = 0x41,
    ELEMENT_TYPE_PINNED      = 0x45,
}

alias CorSerializationType = int;
enum : int
{
    SERIALIZATION_TYPE_UNDEFINED     = 0x00000000,
    SERIALIZATION_TYPE_BOOLEAN       = 0x00000002,
    SERIALIZATION_TYPE_CHAR          = 0x00000003,
    SERIALIZATION_TYPE_I1            = 0x00000004,
    SERIALIZATION_TYPE_U1            = 0x00000005,
    SERIALIZATION_TYPE_I2            = 0x00000006,
    SERIALIZATION_TYPE_U2            = 0x00000007,
    SERIALIZATION_TYPE_I4            = 0x00000008,
    SERIALIZATION_TYPE_U4            = 0x00000009,
    SERIALIZATION_TYPE_I8            = 0x0000000a,
    SERIALIZATION_TYPE_U8            = 0x0000000b,
    SERIALIZATION_TYPE_R4            = 0x0000000c,
    SERIALIZATION_TYPE_R8            = 0x0000000d,
    SERIALIZATION_TYPE_STRING        = 0x0000000e,
    SERIALIZATION_TYPE_SZARRAY       = 0x0000001d,
    SERIALIZATION_TYPE_TYPE          = 0x00000050,
    SERIALIZATION_TYPE_TAGGED_OBJECT = 0x00000051,
    SERIALIZATION_TYPE_FIELD         = 0x00000053,
    SERIALIZATION_TYPE_PROPERTY      = 0x00000054,
    SERIALIZATION_TYPE_ENUM          = 0x00000055,
}

alias CorCallingConvention = int;
enum : int
{
    IMAGE_CEE_CS_CALLCONV_DEFAULT      = 0x00000000,
    IMAGE_CEE_CS_CALLCONV_VARARG       = 0x00000005,
    IMAGE_CEE_CS_CALLCONV_FIELD        = 0x00000006,
    IMAGE_CEE_CS_CALLCONV_LOCAL_SIG    = 0x00000007,
    IMAGE_CEE_CS_CALLCONV_PROPERTY     = 0x00000008,
    IMAGE_CEE_CS_CALLCONV_UNMGD        = 0x00000009,
    IMAGE_CEE_CS_CALLCONV_GENERICINST  = 0x0000000a,
    IMAGE_CEE_CS_CALLCONV_NATIVEVARARG = 0x0000000b,
    IMAGE_CEE_CS_CALLCONV_MAX          = 0x0000000c,
    IMAGE_CEE_CS_CALLCONV_MASK         = 0x0000000f,
    IMAGE_CEE_CS_CALLCONV_HASTHIS      = 0x00000020,
    IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS = 0x00000040,
    IMAGE_CEE_CS_CALLCONV_GENERIC      = 0x00000010,
}

alias CorUnmanagedCallingConvention = int;
enum : int
{
    IMAGE_CEE_UNMANAGED_CALLCONV_C        = 0x00000001,
    IMAGE_CEE_UNMANAGED_CALLCONV_STDCALL  = 0x00000002,
    IMAGE_CEE_UNMANAGED_CALLCONV_THISCALL = 0x00000003,
    IMAGE_CEE_UNMANAGED_CALLCONV_FASTCALL = 0x00000004,
    IMAGE_CEE_CS_CALLCONV_C               = 0x00000001,
    IMAGE_CEE_CS_CALLCONV_STDCALL         = 0x00000002,
    IMAGE_CEE_CS_CALLCONV_THISCALL        = 0x00000003,
    IMAGE_CEE_CS_CALLCONV_FASTCALL        = 0x00000004,
}

alias CorArgType = int;
enum : int
{
    IMAGE_CEE_CS_END      = 0x00000000,
    IMAGE_CEE_CS_VOID     = 0x00000001,
    IMAGE_CEE_CS_I4       = 0x00000002,
    IMAGE_CEE_CS_I8       = 0x00000003,
    IMAGE_CEE_CS_R4       = 0x00000004,
    IMAGE_CEE_CS_R8       = 0x00000005,
    IMAGE_CEE_CS_PTR      = 0x00000006,
    IMAGE_CEE_CS_OBJECT   = 0x00000007,
    IMAGE_CEE_CS_STRUCT4  = 0x00000008,
    IMAGE_CEE_CS_STRUCT32 = 0x00000009,
    IMAGE_CEE_CS_BYVALUE  = 0x0000000a,
}

alias CorNativeType = int;
enum : int
{
    NATIVE_TYPE_END             = 0x00000000,
    NATIVE_TYPE_VOID            = 0x00000001,
    NATIVE_TYPE_BOOLEAN         = 0x00000002,
    NATIVE_TYPE_I1              = 0x00000003,
    NATIVE_TYPE_U1              = 0x00000004,
    NATIVE_TYPE_I2              = 0x00000005,
    NATIVE_TYPE_U2              = 0x00000006,
    NATIVE_TYPE_I4              = 0x00000007,
    NATIVE_TYPE_U4              = 0x00000008,
    NATIVE_TYPE_I8              = 0x00000009,
    NATIVE_TYPE_U8              = 0x0000000a,
    NATIVE_TYPE_R4              = 0x0000000b,
    NATIVE_TYPE_R8              = 0x0000000c,
    NATIVE_TYPE_SYSCHAR         = 0x0000000d,
    NATIVE_TYPE_VARIANT         = 0x0000000e,
    NATIVE_TYPE_CURRENCY        = 0x0000000f,
    NATIVE_TYPE_PTR             = 0x00000010,
    NATIVE_TYPE_DECIMAL         = 0x00000011,
    NATIVE_TYPE_DATE            = 0x00000012,
    NATIVE_TYPE_BSTR            = 0x00000013,
    NATIVE_TYPE_LPSTR           = 0x00000014,
    NATIVE_TYPE_LPWSTR          = 0x00000015,
    NATIVE_TYPE_LPTSTR          = 0x00000016,
    NATIVE_TYPE_FIXEDSYSSTRING  = 0x00000017,
    NATIVE_TYPE_OBJECTREF       = 0x00000018,
    NATIVE_TYPE_IUNKNOWN        = 0x00000019,
    NATIVE_TYPE_IDISPATCH       = 0x0000001a,
    NATIVE_TYPE_STRUCT          = 0x0000001b,
    NATIVE_TYPE_INTF            = 0x0000001c,
    NATIVE_TYPE_SAFEARRAY       = 0x0000001d,
    NATIVE_TYPE_FIXEDARRAY      = 0x0000001e,
    NATIVE_TYPE_INT             = 0x0000001f,
    NATIVE_TYPE_UINT            = 0x00000020,
    NATIVE_TYPE_NESTEDSTRUCT    = 0x00000021,
    NATIVE_TYPE_BYVALSTR        = 0x00000022,
    NATIVE_TYPE_ANSIBSTR        = 0x00000023,
    NATIVE_TYPE_TBSTR           = 0x00000024,
    NATIVE_TYPE_VARIANTBOOL     = 0x00000025,
    NATIVE_TYPE_FUNC            = 0x00000026,
    NATIVE_TYPE_ASANY           = 0x00000028,
    NATIVE_TYPE_ARRAY           = 0x0000002a,
    NATIVE_TYPE_LPSTRUCT        = 0x0000002b,
    NATIVE_TYPE_CUSTOMMARSHALER = 0x0000002c,
    NATIVE_TYPE_ERROR           = 0x0000002d,
    NATIVE_TYPE_IINSPECTABLE    = 0x0000002e,
    NATIVE_TYPE_HSTRING         = 0x0000002f,
    NATIVE_TYPE_LPUTF8STR       = 0x00000030,
    NATIVE_TYPE_MAX             = 0x00000050,
}

alias CorILMethodSect = int;
enum : int
{
    CorILMethod_Sect_Reserved   = 0x00000000,
    CorILMethod_Sect_EHTable    = 0x00000001,
    CorILMethod_Sect_OptILTable = 0x00000002,
    CorILMethod_Sect_KindMask   = 0x0000003f,
    CorILMethod_Sect_FatFormat  = 0x00000040,
    CorILMethod_Sect_MoreSects  = 0x00000080,
}

struct IMAGE_COR_ILMETHOD_SECT_SMALL
{
    ubyte Kind;
    ubyte DataSize;
}
struct IMAGE_COR_ILMETHOD_SECT_FAT
{
    uint _bitfield0;
}
alias CorExceptionFlag = int;
enum : int
{
    COR_ILEXCEPTION_CLAUSE_NONE       = 0x00000000,
    COR_ILEXCEPTION_CLAUSE_OFFSETLEN  = 0x00000000,
    COR_ILEXCEPTION_CLAUSE_DEPRECATED = 0x00000000,
    COR_ILEXCEPTION_CLAUSE_FILTER     = 0x00000001,
    COR_ILEXCEPTION_CLAUSE_FINALLY    = 0x00000002,
    COR_ILEXCEPTION_CLAUSE_FAULT      = 0x00000004,
    COR_ILEXCEPTION_CLAUSE_DUPLICATED = 0x00000008,
}

struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT
{
    CorExceptionFlag Flags;
    uint TryOffset;
    uint TryLength;
    uint HandlerOffset;
    uint HandlerLength;
    union
    {
        uint ClassToken;
        uint FilterOffset;
    }
}
struct IMAGE_COR_ILMETHOD_SECT_EH_FAT
{
    IMAGE_COR_ILMETHOD_SECT_FAT SectFat;
    IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT[1] Clauses;
}
/+ [CONFLICTED] struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL
{
    int _bitfield1;
    uint _bitfield2;
    union
    {
        uint ClassToken;
        uint FilterOffset;
    }
}
+/
struct IMAGE_COR_ILMETHOD_SECT_EH_SMALL
{
    IMAGE_COR_ILMETHOD_SECT_SMALL SectSmall;
    ushort Reserved;
    IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL[1] Clauses;
}
union IMAGE_COR_ILMETHOD_SECT_EH
{
    IMAGE_COR_ILMETHOD_SECT_EH_SMALL Small;
    IMAGE_COR_ILMETHOD_SECT_EH_FAT Fat;
}
alias CorILMethodFlags = int;
enum : int
{
    CorILMethod_InitLocals   = 0x00000010,
    CorILMethod_MoreSects    = 0x00000008,
    CorILMethod_CompressedIL = 0x00000040,
    CorILMethod_FormatShift  = 0x00000003,
    CorILMethod_FormatMask   = 0x00000007,
    CorILMethod_TinyFormat   = 0x00000002,
    CorILMethod_SmallFormat  = 0x00000000,
    CorILMethod_FatFormat    = 0x00000003,
    CorILMethod_TinyFormat1  = 0x00000006,
}

struct IMAGE_COR_ILMETHOD_TINY
{
    ubyte Flags_CodeSize;
}
struct IMAGE_COR_ILMETHOD_FAT
{
    uint _bitfield0;
    uint CodeSize;
    uint LocalVarSigTok;
}
union IMAGE_COR_ILMETHOD
{
    IMAGE_COR_ILMETHOD_TINY Tiny;
    IMAGE_COR_ILMETHOD_FAT Fat;
}
struct IMAGE_COR_VTABLEFIXUP
{
    uint RVA;
    ushort Count;
    ushort Type;
}
alias CorCheckDuplicatesFor = int;
enum : int
{
    MDDupAll                    = 0xffffffff,
    MDDupENC                    = 0xffffffff,
    MDNoDupChecks               = 0x00000000,
    MDDupTypeDef                = 0x00000001,
    MDDupInterfaceImpl          = 0x00000002,
    MDDupMethodDef              = 0x00000004,
    MDDupTypeRef                = 0x00000008,
    MDDupMemberRef              = 0x00000010,
    MDDupCustomAttribute        = 0x00000020,
    MDDupParamDef               = 0x00000040,
    MDDupPermission             = 0x00000080,
    MDDupProperty               = 0x00000100,
    MDDupEvent                  = 0x00000200,
    MDDupFieldDef               = 0x00000400,
    MDDupSignature              = 0x00000800,
    MDDupModuleRef              = 0x00001000,
    MDDupTypeSpec               = 0x00002000,
    MDDupImplMap                = 0x00004000,
    MDDupAssemblyRef            = 0x00008000,
    MDDupFile                   = 0x00010000,
    MDDupExportedType           = 0x00020000,
    MDDupManifestResource       = 0x00040000,
    MDDupGenericParam           = 0x00080000,
    MDDupMethodSpec             = 0x00100000,
    MDDupGenericParamConstraint = 0x00200000,
    MDDupAssembly               = 0x10000000,
    MDDupDefault                = 0x00102818,
}

alias CorRefToDefCheck = int;
enum : int
{
    MDRefToDefDefault = 0x00000003,
    MDRefToDefAll     = 0xffffffff,
    MDRefToDefNone    = 0x00000000,
    MDTypeRefToDef    = 0x00000001,
    MDMemberRefToDef  = 0x00000002,
}

alias CorNotificationForTokenMovement = int;
enum : int
{
    MDNotifyDefault         = 0x0000000f,
    MDNotifyAll             = 0xffffffff,
    MDNotifyNone            = 0x00000000,
    MDNotifyMethodDef       = 0x00000001,
    MDNotifyMemberRef       = 0x00000002,
    MDNotifyFieldDef        = 0x00000004,
    MDNotifyTypeRef         = 0x00000008,
    MDNotifyTypeDef         = 0x00000010,
    MDNotifyParamDef        = 0x00000020,
    MDNotifyInterfaceImpl   = 0x00000040,
    MDNotifyProperty        = 0x00000080,
    MDNotifyEvent           = 0x00000100,
    MDNotifySignature       = 0x00000200,
    MDNotifyTypeSpec        = 0x00000400,
    MDNotifyCustomAttribute = 0x00000800,
    MDNotifySecurityValue   = 0x00001000,
    MDNotifyPermission      = 0x00002000,
    MDNotifyModuleRef       = 0x00004000,
    MDNotifyNameSpace       = 0x00008000,
    MDNotifyAssemblyRef     = 0x01000000,
    MDNotifyFile            = 0x02000000,
    MDNotifyExportedType    = 0x04000000,
    MDNotifyResource        = 0x08000000,
}

alias CorSetENC = int;
enum : int
{
    MDSetENCOn          = 0x00000001,
    MDSetENCOff         = 0x00000002,
    MDUpdateENC         = 0x00000001,
    MDUpdateFull        = 0x00000002,
    MDUpdateExtension   = 0x00000003,
    MDUpdateIncremental = 0x00000004,
    MDUpdateDelta       = 0x00000005,
    MDUpdateMask        = 0x00000007,
}

alias CorErrorIfEmitOutOfOrder = int;
enum : int
{
    MDErrorOutOfOrderDefault = 0x00000000,
    MDErrorOutOfOrderNone    = 0x00000000,
    MDErrorOutOfOrderAll     = 0xffffffff,
    MDMethodOutOfOrder       = 0x00000001,
    MDFieldOutOfOrder        = 0x00000002,
    MDParamOutOfOrder        = 0x00000004,
    MDPropertyOutOfOrder     = 0x00000008,
    MDEventOutOfOrder        = 0x00000010,
}

alias CorImportOptions = int;
enum : int
{
    MDImportOptionDefault             = 0x00000000,
    MDImportOptionAll                 = 0xffffffff,
    MDImportOptionAllTypeDefs         = 0x00000001,
    MDImportOptionAllMethodDefs       = 0x00000002,
    MDImportOptionAllFieldDefs        = 0x00000004,
    MDImportOptionAllProperties       = 0x00000008,
    MDImportOptionAllEvents           = 0x00000010,
    MDImportOptionAllCustomAttributes = 0x00000020,
    MDImportOptionAllExportedTypes    = 0x00000040,
}

alias CorThreadSafetyOptions = int;
enum : int
{
    MDThreadSafetyDefault = 0x00000000,
    MDThreadSafetyOff     = 0x00000000,
    MDThreadSafetyOn      = 0x00000001,
}

alias CorLinkerOptions = int;
enum : int
{
    MDAssembly  = 0x00000000,
    MDNetModule = 0x00000001,
}

alias MergeFlags = int;
enum : int
{
    MergeFlagsNone     = 0x00000000,
    MergeManifest      = 0x00000001,
    DropMemberRefCAs   = 0x00000002,
    NoDupCheck         = 0x00000004,
    MergeExportedTypes = 0x00000008,
}

alias CorLocalRefPreservation = int;
enum : int
{
    MDPreserveLocalRefsNone  = 0x00000000,
    MDPreserveLocalTypeRef   = 0x00000001,
    MDPreserveLocalMemberRef = 0x00000002,
}

struct COR_FIELD_OFFSET
{
    uint ridOfField;
    uint ulOffset;
}
alias CorTokenType = int;
enum : int
{
    mdtModule                 = 0x00000000,
    mdtTypeRef                = 0x01000000,
    mdtTypeDef                = 0x02000000,
    mdtFieldDef               = 0x04000000,
    mdtMethodDef              = 0x06000000,
    mdtParamDef               = 0x08000000,
    mdtInterfaceImpl          = 0x09000000,
    mdtMemberRef              = 0x0a000000,
    mdtCustomAttribute        = 0x0c000000,
    mdtPermission             = 0x0e000000,
    mdtSignature              = 0x11000000,
    mdtEvent                  = 0x14000000,
    mdtProperty               = 0x17000000,
    mdtMethodImpl             = 0x19000000,
    mdtModuleRef              = 0x1a000000,
    mdtTypeSpec               = 0x1b000000,
    mdtAssembly               = 0x20000000,
    mdtAssemblyRef            = 0x23000000,
    mdtFile                   = 0x26000000,
    mdtExportedType           = 0x27000000,
    mdtManifestResource       = 0x28000000,
    mdtGenericParam           = 0x2a000000,
    mdtMethodSpec             = 0x2b000000,
    mdtGenericParamConstraint = 0x2c000000,
    mdtString                 = 0x70000000,
    mdtName                   = 0x71000000,
    mdtBaseType               = 0x72000000,
}

alias CorOpenFlags = int;
enum : int
{
    ofRead           = 0x00000000,
    ofWrite          = 0x00000001,
    ofReadWriteMask  = 0x00000001,
    ofCopyMemory     = 0x00000002,
    ofReadOnly       = 0x00000010,
    ofTakeOwnership  = 0x00000020,
    ofNoTypeLib      = 0x00000080,
    ofNoTransform    = 0x00001000,
    ofCheckIntegrity = 0x00000800,
    ofReserved1      = 0x00000100,
    ofReserved2      = 0x00000200,
    ofReserved3      = 0x00000400,
    ofReserved       = 0xffffe740,
}

alias CorFileMapping = int;
enum : int
{
    fmFlat            = 0x00000000,
    fmExecutableImage = 0x00000001,
}

alias CorAttributeTargets = int;
enum : int
{
    catAssembly         = 0x00000001,
    catModule           = 0x00000002,
    catClass            = 0x00000004,
    catStruct           = 0x00000008,
    catEnum             = 0x00000010,
    catConstructor      = 0x00000020,
    catMethod           = 0x00000040,
    catProperty         = 0x00000080,
    catField            = 0x00000100,
    catEvent            = 0x00000200,
    catInterface        = 0x00000400,
    catParameter        = 0x00000800,
    catDelegate         = 0x00001000,
    catGenericParameter = 0x00004000,
    catAll              = 0x00005fff,
    catClassMembers     = 0x000017fc,
}

alias CompilationRelaxationsEnum = int;
enum : int
{
    CompilationRelaxations_NoStringInterning = 0x00000008,
}

alias NGenHintEnum = int;
enum : int
{
    NGenDefault = 0x00000000,
    NGenEager   = 0x00000001,
    NGenLazy    = 0x00000002,
    NGenNever   = 0x00000003,
}

alias LoadHintEnum = int;
enum : int
{
    LoadDefault   = 0x00000000,
    LoadAlways    = 0x00000001,
    LoadSometimes = 0x00000002,
    LoadNever     = 0x00000003,
}

alias CorSaveSize = int;
enum : int
{
    cssAccurate            = 0x00000000,
    cssQuick               = 0x00000001,
    cssDiscardTransientCAs = 0x00000002,
}

alias NativeTypeArrayFlags = int;
enum : int
{
    ntaSizeParamIndexSpecified = 0x00000001,
    ntaReserved                = 0x0000fffe,
}

struct COR_SECATTR
{
    uint tkCtor;
    const(void)* pCustomAttribute;
    uint cbCustomAttribute;
}
enum IID_IMetaDataError = GUID(0xb81ff171, 0x20f3, 0x11d2, [0x8d, 0xcc, 0x0, 0xa0, 0xc9, 0xb0, 0x9c, 0x19]);
interface IMetaDataError : IUnknown
{
    HRESULT OnError(HRESULT, uint);
}
enum IID_IMapToken = GUID(0x6a3ea8b, 0x225, 0x11d1, [0xbf, 0x72, 0x0, 0xc0, 0x4f, 0xc3, 0x1e, 0x12]);
interface IMapToken : IUnknown
{
    HRESULT Map(uint, uint);
}
enum IID_IMetaDataDispenser = GUID(0x809c652e, 0x7396, 0x11d2, [0x97, 0x71, 0x0, 0xa0, 0xc9, 0xb4, 0xd5, 0xc]);
interface IMetaDataDispenser : IUnknown
{
    HRESULT DefineScope(const(GUID)*, uint, const(GUID)*, IUnknown*);
    HRESULT OpenScope(const(wchar)*, uint, const(GUID)*, IUnknown*);
    HRESULT OpenScopeOnMemory(const(void)*, uint, uint, const(GUID)*, IUnknown*);
}
enum IID_IMetaDataEmit = GUID(0xba3fee4c, 0xecb9, 0x4e41, [0x83, 0xb7, 0x18, 0x3f, 0xa4, 0x1c, 0xd8, 0x59]);
interface IMetaDataEmit : IUnknown
{
    HRESULT SetModuleProps(const(wchar)*);
    HRESULT Save(const(wchar)*, uint);
    HRESULT SaveToStream(IStream, uint);
    HRESULT GetSaveSize(CorSaveSize, uint*);
    HRESULT DefineTypeDef(const(wchar)*, uint, uint, uint*, uint*);
    HRESULT DefineNestedType(const(wchar)*, uint, uint, uint*, uint, uint*);
    HRESULT SetHandler(IUnknown);
    HRESULT DefineMethod(uint, const(wchar)*, uint, ubyte*, uint, uint, uint, uint*);
    HRESULT DefineMethodImpl(uint, uint, uint);
    HRESULT DefineTypeRefByName(uint, const(wchar)*, uint*);
    HRESULT DefineImportType(IMetaDataAssemblyImport, const(void)*, uint, IMetaDataImport, uint, IMetaDataAssemblyEmit, uint*);
    HRESULT DefineMemberRef(uint, const(wchar)*, ubyte*, uint, uint*);
    HRESULT DefineImportMember(IMetaDataAssemblyImport, const(void)*, uint, IMetaDataImport, uint, IMetaDataAssemblyEmit, uint, uint*);
    HRESULT DefineEvent(uint, const(wchar)*, uint, uint, uint, uint, uint, uint*, uint*);
    HRESULT SetClassLayout(uint, uint, COR_FIELD_OFFSET*, uint);
    HRESULT DeleteClassLayout(uint);
    HRESULT SetFieldMarshal(uint, ubyte*, uint);
    HRESULT DeleteFieldMarshal(uint);
    HRESULT DefinePermissionSet(uint, uint, const(void)*, uint, uint*);
    HRESULT SetRVA(uint, uint);
    HRESULT GetTokenFromSig(ubyte*, uint, uint*);
    HRESULT DefineModuleRef(const(wchar)*, uint*);
    HRESULT SetParent(uint, uint);
    HRESULT GetTokenFromTypeSpec(ubyte*, uint, uint*);
    HRESULT SaveToMemory(void*, uint);
    HRESULT DefineUserString(const(wchar)*, uint, uint*);
    HRESULT DeleteToken(uint);
    HRESULT SetMethodProps(uint, uint, uint, uint);
    HRESULT SetTypeDefProps(uint, uint, uint, uint*);
    HRESULT SetEventProps(uint, uint, uint, uint, uint, uint, uint*);
    HRESULT SetPermissionSetProps(uint, uint, const(void)*, uint, uint*);
    HRESULT DefinePinvokeMap(uint, uint, const(wchar)*, uint);
    HRESULT SetPinvokeMap(uint, uint, const(wchar)*, uint);
    HRESULT DeletePinvokeMap(uint);
    HRESULT DefineCustomAttribute(uint, uint, const(void)*, uint, uint*);
    HRESULT SetCustomAttributeValue(uint, const(void)*, uint);
    HRESULT DefineField(uint, const(wchar)*, uint, ubyte*, uint, uint, const(void)*, uint, uint*);
    HRESULT DefineProperty(uint, const(wchar)*, uint, ubyte*, uint, uint, const(void)*, uint, uint, uint, uint*, uint*);
    HRESULT DefineParam(uint, uint, const(wchar)*, uint, uint, const(void)*, uint, uint*);
    HRESULT SetFieldProps(uint, uint, uint, const(void)*, uint);
    HRESULT SetPropertyProps(uint, uint, uint, const(void)*, uint, uint, uint, uint*);
    HRESULT SetParamProps(uint, const(wchar)*, uint, uint, const(void)*, uint);
    HRESULT DefineSecurityAttributeSet(uint, COR_SECATTR*, uint, uint*);
    HRESULT ApplyEditAndContinue(IUnknown);
    HRESULT TranslateSigWithScope(IMetaDataAssemblyImport, const(void)*, uint, IMetaDataImport, ubyte*, uint, IMetaDataAssemblyEmit, IMetaDataEmit, ubyte*, uint, uint*);
    HRESULT SetMethodImplFlags(uint, uint);
    HRESULT SetFieldRVA(uint, uint);
    HRESULT Merge(IMetaDataImport, IMapToken, IUnknown);
    HRESULT MergeEnd();
}
enum IID_IMetaDataEmit2 = GUID(0xf5dd9950, 0xf693, 0x42e6, [0x83, 0xe, 0x7b, 0x83, 0x3e, 0x81, 0x46, 0xa9]);
interface IMetaDataEmit2 : IMetaDataEmit
{
    HRESULT DefineMethodSpec(uint, ubyte*, uint, uint*);
    HRESULT GetDeltaSaveSize(CorSaveSize, uint*);
    HRESULT SaveDelta(const(wchar)*, uint);
    HRESULT SaveDeltaToStream(IStream, uint);
    HRESULT SaveDeltaToMemory(void*, uint);
    HRESULT DefineGenericParam(uint, uint, uint, const(wchar)*, uint, uint*, uint*);
    HRESULT SetGenericParamProps(uint, uint, const(wchar)*, uint, uint*);
    HRESULT ResetENCLog();
}
enum IID_IMetaDataImport = GUID(0x7dac8207, 0xd3ae, 0x4c75, [0x9b, 0x67, 0x92, 0x80, 0x1a, 0x49, 0x7d, 0x44]);
interface IMetaDataImport : IUnknown
{
    void CloseEnum(void*);
    HRESULT CountEnum(void*, uint*);
    HRESULT ResetEnum(void*, uint);
    HRESULT EnumTypeDefs(void**, uint*, uint, uint*);
    HRESULT EnumInterfaceImpls(void**, uint, uint*, uint, uint*);
    HRESULT EnumTypeRefs(void**, uint*, uint, uint*);
    HRESULT FindTypeDefByName(const(wchar)*, uint, uint*);
    HRESULT GetScopeProps(PWSTR, uint, uint*, GUID*);
    HRESULT GetModuleFromScope(uint*);
    HRESULT GetTypeDefProps(uint, PWSTR, uint, uint*, uint*, uint*);
    HRESULT GetInterfaceImplProps(uint, uint*, uint*);
    HRESULT GetTypeRefProps(uint, uint*, PWSTR, uint, uint*);
    HRESULT ResolveTypeRef(uint, const(GUID)*, IUnknown*, uint*);
    HRESULT EnumMembers(void**, uint, uint*, uint, uint*);
    HRESULT EnumMembersWithName(void**, uint, const(wchar)*, uint*, uint, uint*);
    HRESULT EnumMethods(void**, uint, uint*, uint, uint*);
    HRESULT EnumMethodsWithName(void**, uint, const(wchar)*, uint*, uint, uint*);
    HRESULT EnumFields(void**, uint, uint*, uint, uint*);
    HRESULT EnumFieldsWithName(void**, uint, const(wchar)*, uint*, uint, uint*);
    HRESULT EnumParams(void**, uint, uint*, uint, uint*);
    HRESULT EnumMemberRefs(void**, uint, uint*, uint, uint*);
    HRESULT EnumMethodImpls(void**, uint, uint*, uint*, uint, uint*);
    HRESULT EnumPermissionSets(void**, uint, uint, uint*, uint, uint*);
    HRESULT FindMember(uint, const(wchar)*, ubyte*, uint, uint*);
    HRESULT FindMethod(uint, const(wchar)*, ubyte*, uint, uint*);
    HRESULT FindField(uint, const(wchar)*, ubyte*, uint, uint*);
    HRESULT FindMemberRef(uint, const(wchar)*, ubyte*, uint, uint*);
    HRESULT GetMethodProps(uint, uint*, PWSTR, uint, uint*, uint*, ubyte**, uint*, uint*, uint*);
    HRESULT GetMemberRefProps(uint, uint*, PWSTR, uint, uint*, ubyte**, uint*);
    HRESULT EnumProperties(void**, uint, uint*, uint, uint*);
    HRESULT EnumEvents(void**, uint, uint*, uint, uint*);
    HRESULT GetEventProps(uint, uint*, const(wchar)*, uint, uint*, uint*, uint*, uint*, uint*, uint*, uint*, uint, uint*);
    HRESULT EnumMethodSemantics(void**, uint, uint*, uint, uint*);
    HRESULT GetMethodSemantics(uint, uint, uint*);
    HRESULT GetClassLayout(uint, uint*, COR_FIELD_OFFSET*, uint, uint*, uint*);
    HRESULT GetFieldMarshal(uint, ubyte**, uint*);
    HRESULT GetRVA(uint, uint*, uint*);
    HRESULT GetPermissionSetProps(uint, uint*, const(void)**, uint*);
    HRESULT GetSigFromToken(uint, ubyte**, uint*);
    HRESULT GetModuleRefProps(uint, PWSTR, uint, uint*);
    HRESULT EnumModuleRefs(void**, uint*, uint, uint*);
    HRESULT GetTypeSpecFromToken(uint, ubyte**, uint*);
    HRESULT GetNameFromToken(uint, byte**);
    HRESULT EnumUnresolvedMethods(void**, uint*, uint, uint*);
    HRESULT GetUserString(uint, PWSTR, uint, uint*);
    HRESULT GetPinvokeMap(uint, uint*, PWSTR, uint, uint*, uint*);
    HRESULT EnumSignatures(void**, uint*, uint, uint*);
    HRESULT EnumTypeSpecs(void**, uint*, uint, uint*);
    HRESULT EnumUserStrings(void**, uint*, uint, uint*);
    HRESULT GetParamForMethodIndex(uint, uint, uint*);
    HRESULT EnumCustomAttributes(void**, uint, uint, uint*, uint, uint*);
    HRESULT GetCustomAttributeProps(uint, uint*, uint*, const(void)**, uint*);
    HRESULT FindTypeRef(uint, const(wchar)*, uint*);
    HRESULT GetMemberProps(uint, uint*, PWSTR, uint, uint*, uint*, ubyte**, uint*, uint*, uint*, uint*, void**, uint*);
    HRESULT GetFieldProps(uint, uint*, PWSTR, uint, uint*, uint*, ubyte**, uint*, uint*, void**, uint*);
    HRESULT GetPropertyProps(uint, uint*, const(wchar)*, uint, uint*, uint*, ubyte**, uint*, uint*, void**, uint*, uint*, uint*, uint*, uint, uint*);
    HRESULT GetParamProps(uint, uint*, uint*, PWSTR, uint, uint*, uint*, uint*, void**, uint*);
    HRESULT GetCustomAttributeByName(uint, const(wchar)*, const(void)**, uint*);
    BOOL IsValidToken(uint);
    HRESULT GetNestedClassProps(uint, uint*);
    HRESULT GetNativeCallConvFromSig(const(void)*, uint, uint*);
    HRESULT IsGlobal(uint, int*);
}
enum IID_IMetaDataImport2 = GUID(0xfce5efa0, 0x8bba, 0x4f8e, [0xa0, 0x36, 0x8f, 0x20, 0x22, 0xb0, 0x84, 0x66]);
interface IMetaDataImport2 : IMetaDataImport
{
    HRESULT EnumGenericParams(void**, uint, uint*, uint, uint*);
    HRESULT GetGenericParamProps(uint, uint*, uint*, uint*, uint*, PWSTR, uint, uint*);
    HRESULT GetMethodSpecProps(uint, uint*, ubyte**, uint*);
    HRESULT EnumGenericParamConstraints(void**, uint, uint*, uint, uint*);
    HRESULT GetGenericParamConstraintProps(uint, uint*, uint*);
    HRESULT GetPEKind(uint*, uint*);
    HRESULT GetVersionString(PWSTR, uint, uint*);
    HRESULT EnumMethodSpecs(void**, uint, uint*, uint, uint*);
}
enum IID_IMetaDataFilter = GUID(0xd0e80dd1, 0x12d4, 0x11d3, [0xb3, 0x9d, 0x0, 0xc0, 0x4f, 0xf8, 0x17, 0x95]);
interface IMetaDataFilter : IUnknown
{
    HRESULT UnmarkAll();
    HRESULT MarkToken(uint);
    HRESULT IsTokenMarked(uint, BOOL*);
}
enum IID_IHostFilter = GUID(0xd0e80dd3, 0x12d4, 0x11d3, [0xb3, 0x9d, 0x0, 0xc0, 0x4f, 0xf8, 0x17, 0x95]);
interface IHostFilter : IUnknown
{
    HRESULT MarkToken(uint);
}
struct OSINFO
{
    uint dwOSPlatformId;
    uint dwOSMajorVersion;
    uint dwOSMinorVersion;
}
struct ASSEMBLYMETADATA
{
    ushort usMajorVersion;
    ushort usMinorVersion;
    ushort usBuildNumber;
    ushort usRevisionNumber;
    PWSTR szLocale;
    uint cbLocale;
    uint* rProcessor;
    uint ulProcessor;
    OSINFO* rOS;
    uint ulOS;
}
enum IID_IMetaDataAssemblyEmit = GUID(0x211ef15b, 0x5317, 0x4438, [0xb1, 0x96, 0xde, 0xc8, 0x7b, 0x88, 0x76, 0x93]);
interface IMetaDataAssemblyEmit : IUnknown
{
    HRESULT DefineAssembly(const(void)*, uint, uint, const(wchar)*, const(ASSEMBLYMETADATA)*, uint, uint*);
    HRESULT DefineAssemblyRef(const(void)*, uint, const(wchar)*, const(ASSEMBLYMETADATA)*, const(void)*, uint, uint, uint*);
    HRESULT DefineFile(const(wchar)*, const(void)*, uint, uint, uint*);
    HRESULT DefineExportedType(const(wchar)*, uint, uint, uint, uint*);
    HRESULT DefineManifestResource(const(wchar)*, uint, uint, uint, uint*);
    HRESULT SetAssemblyProps(uint, const(void)*, uint, uint, const(wchar)*, const(ASSEMBLYMETADATA)*, uint);
    HRESULT SetAssemblyRefProps(uint, const(void)*, uint, const(wchar)*, const(ASSEMBLYMETADATA)*, const(void)*, uint, uint);
    HRESULT SetFileProps(uint, const(void)*, uint, uint);
    HRESULT SetExportedTypeProps(uint, uint, uint, uint);
    HRESULT SetManifestResourceProps(uint, uint, uint, uint);
}
enum IID_IMetaDataAssemblyImport = GUID(0xee62470b, 0xe94b, 0x424e, [0x9b, 0x7c, 0x2f, 0x0, 0xc9, 0x24, 0x9f, 0x93]);
interface IMetaDataAssemblyImport : IUnknown
{
    HRESULT GetAssemblyProps(uint, const(void)**, uint*, uint*, PWSTR, uint, uint*, ASSEMBLYMETADATA*, uint*);
    HRESULT GetAssemblyRefProps(uint, const(void)**, uint*, PWSTR, uint, uint*, ASSEMBLYMETADATA*, const(void)**, uint*, uint*);
    HRESULT GetFileProps(uint, PWSTR, uint, uint*, const(void)**, uint*, uint*);
    HRESULT GetExportedTypeProps(uint, PWSTR, uint, uint*, uint*, uint*, uint*);
    HRESULT GetManifestResourceProps(uint, PWSTR, uint, uint*, uint*, uint*, uint*);
    HRESULT EnumAssemblyRefs(void**, uint*, uint, uint*);
    HRESULT EnumFiles(void**, uint*, uint, uint*);
    HRESULT EnumExportedTypes(void**, uint*, uint, uint*);
    HRESULT EnumManifestResources(void**, uint*, uint, uint*);
    HRESULT GetAssemblyFromScope(uint*);
    HRESULT FindExportedTypeByName(const(wchar)*, uint, uint*);
    HRESULT FindManifestResourceByName(const(wchar)*, uint*);
    void CloseEnum(void*);
    HRESULT FindAssembliesByName(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown*, uint, uint*);
}
alias CorValidatorModuleType = int;
enum : int
{
    ValidatorModuleTypeInvalid = 0x00000000,
    ValidatorModuleTypeMin     = 0x00000001,
    ValidatorModuleTypePE      = 0x00000001,
    ValidatorModuleTypeObj     = 0x00000002,
    ValidatorModuleTypeEnc     = 0x00000003,
    ValidatorModuleTypeIncr    = 0x00000004,
    ValidatorModuleTypeMax     = 0x00000004,
}

enum IID_IMetaDataValidate = GUID(0x4709c9c6, 0x81ff, 0x11d3, [0x9f, 0xc7, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
interface IMetaDataValidate : IUnknown
{
    HRESULT ValidatorInit(uint, IUnknown);
    HRESULT ValidateMetaData();
}
enum IID_IMetaDataDispenserEx = GUID(0x31bcfce2, 0xdafb, 0x11d2, [0x9f, 0x81, 0x0, 0xc0, 0x4f, 0x79, 0xa0, 0xa3]);
interface IMetaDataDispenserEx : IMetaDataDispenser
{
    HRESULT SetOption(const(GUID)*, const(VARIANT)*);
    HRESULT GetOption(const(GUID)*, VARIANT*);
    HRESULT OpenScopeOnITypeInfo(ITypeInfo, uint, const(GUID)*, IUnknown*);
    HRESULT GetCORSystemDirectory(PWSTR, uint, uint*);
    HRESULT FindAssembly(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint*);
    HRESULT FindAssemblyModule(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint, uint*);
}
alias CorRegFlags = int;
enum : int
{
    regNoCopy  = 0x00000001,
    regConfig  = 0x00000002,
    regHasRefs = 0x00000004,
}

struct CVStruct
{
    short Major;
    short Minor;
    short Sub;
    short Build;
}
alias CeeSectionAttr = long;
enum : long
{
    sdNone      = 0x0000000000000000,
    sdReadOnly  = 0x0000000040000040,
    sdReadWrite = 0x00000000c0000040,
    sdExecute   = 0x0000000060000020,
}

alias CeeSectionRelocType = int;
enum : int
{
    srRelocAbsolute       = 0x00000000,
    srRelocHighLow        = 0x00000003,
    srRelocHighAdj        = 0x00000004,
    srRelocMapToken       = 0x00000005,
    srRelocRelative       = 0x00000006,
    srRelocFilePos        = 0x00000007,
    srRelocCodeRelative   = 0x00000008,
    srRelocIA64Imm64      = 0x00000009,
    srRelocDir64          = 0x0000000a,
    srRelocIA64PcRel25    = 0x0000000b,
    srRelocIA64PcRel64    = 0x0000000c,
    srRelocAbsoluteTagged = 0x0000000d,
    srRelocSentinel       = 0x0000000e,
    srNoBaseReloc         = 0x00004000,
    srRelocPtr            = 0x00008000,
    srRelocAbsolutePtr    = 0x00008000,
    srRelocHighLowPtr     = 0x00008003,
    srRelocRelativePtr    = 0x00008006,
    srRelocIA64Imm64Ptr   = 0x00008009,
    srRelocDir64Ptr       = 0x0000800a,
}

union CeeSectionRelocExtra
{
    ushort highAdj;
}
enum IID_ICeeGen = GUID(0x7ed1bdff, 0x8e36, 0x11d2, [0x9c, 0x56, 0x0, 0xa0, 0xc9, 0xb7, 0xcc, 0x45]);
interface ICeeGen : IUnknown
{
    HRESULT EmitString(PWSTR, uint*);
    HRESULT GetString(uint, PWSTR*);
    HRESULT AllocateMethodBuffer(uint, ubyte**, uint*);
    HRESULT GetMethodBuffer(uint, ubyte**);
    HRESULT GetIMapTokenIface(IUnknown*);
    HRESULT GenerateCeeFile();
    HRESULT GetIlSection(void**);
    HRESULT GetStringSection(void**);
    HRESULT AddSectionReloc(void*, uint, void*, CeeSectionRelocType);
    HRESULT GetSectionCreate(const(char)*, uint, void**);
    HRESULT GetSectionDataLen(void*, uint*);
    HRESULT GetSectionBlock(void*, uint, uint, void**);
    HRESULT TruncateSection(void*, uint);
    HRESULT GenerateCeeMemoryImage(void**);
    HRESULT ComputePointer(void*, uint, ubyte**);
}
enum IID_IMetaDataTables = GUID(0xd8f579ab, 0x402d, 0x4b8e, [0x82, 0xd9, 0x5d, 0x63, 0xb1, 0x6, 0x5c, 0x68]);
interface IMetaDataTables : IUnknown
{
    HRESULT GetStringHeapSize(uint*);
    HRESULT GetBlobHeapSize(uint*);
    HRESULT GetGuidHeapSize(uint*);
    HRESULT GetUserStringHeapSize(uint*);
    HRESULT GetNumTables(uint*);
    HRESULT GetTableIndex(uint, uint*);
    HRESULT GetTableInfo(uint, uint*, uint*, uint*, uint*, const(byte)**);
    HRESULT GetColumnInfo(uint, uint, uint*, uint*, uint*, const(byte)**);
    HRESULT GetCodedTokenInfo(uint, uint*, uint**, const(byte)**);
    HRESULT GetRow(uint, uint, void**);
    HRESULT GetColumn(uint, uint, uint, uint*);
    HRESULT GetString(uint, const(byte)**);
    HRESULT GetBlob(uint, uint*, const(void)**);
    HRESULT GetGuid(uint, const(GUID)**);
    HRESULT GetUserString(uint, uint*, const(void)**);
    HRESULT GetNextString(uint, uint*);
    HRESULT GetNextBlob(uint, uint*);
    HRESULT GetNextGuid(uint, uint*);
    HRESULT GetNextUserString(uint, uint*);
}
enum IID_IMetaDataTables2 = GUID(0xbadb5f70, 0x58da, 0x43a9, [0xa1, 0xc6, 0xd7, 0x48, 0x19, 0xf1, 0x9b, 0x15]);
interface IMetaDataTables2 : IMetaDataTables
{
    HRESULT GetMetaDataStorage(const(void)**, uint*);
    HRESULT GetMetaDataStreamInfo(uint, const(byte)**, const(void)**, uint*);
}
enum IID_IMetaDataInfo = GUID(0x7998ea64, 0x7f95, 0x48b8, [0x86, 0xfc, 0x17, 0xca, 0xf4, 0x8b, 0xf5, 0xcb]);
interface IMetaDataInfo : IUnknown
{
    HRESULT GetFileMapping(const(void)**, ulong*, uint*);
}
enum IID_IMetaDataWinMDImport = GUID(0x969ea0c5, 0x964e, 0x411b, [0xa8, 0x7, 0xb0, 0xf3, 0xc2, 0xdf, 0xcb, 0xd4]);
interface IMetaDataWinMDImport : IUnknown
{
    HRESULT GetUntransformedTypeRefProps(uint, uint*, PWSTR, uint, uint*);
}
struct COR_NATIVE_LINK
{
    align (1):
    ubyte m_linkType;
    ubyte m_flags;
    uint m_entryPoint;
}
alias CorNativeLinkType = int;
enum : int
{
    nltNone     = 0x00000001,
    nltAnsi     = 0x00000002,
    nltUnicode  = 0x00000003,
    nltAuto     = 0x00000004,
    nltOle      = 0x00000005,
    nltMaxValue = 0x00000007,
}

alias CorNativeLinkFlags = int;
enum : int
{
    nlfNone      = 0x00000000,
    nlfLastError = 0x00000001,
    nlfNoMangle  = 0x00000002,
    nlfMaxValue  = 0x00000003,
}

// [Not Found] IID_IRoSimpleMetaDataBuilder
interface IRoSimpleMetaDataBuilder
{
    HRESULT SetWinRtInterface(GUID);
    HRESULT SetDelegate(GUID);
    HRESULT SetInterfaceGroupSimpleDefault(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT SetInterfaceGroupParameterizedDefault(const(wchar)*, uint, const(wchar)**);
    HRESULT SetRuntimeClassSimpleDefault(const(wchar)*, const(wchar)*, const(GUID)*);
    HRESULT SetRuntimeClassParameterizedDefault(const(wchar)*, uint, const(wchar)**);
    HRESULT SetStruct(const(wchar)*, uint, const(wchar)**);
    HRESULT SetEnum(const(wchar)*, const(wchar)*);
    HRESULT SetParameterizedInterface(GUID, uint);
    HRESULT SetParameterizedDelegate(GUID, uint);
}
// [Not Found] IID_IRoMetaDataLocator
interface IRoMetaDataLocator
{
    HRESULT Locate(const(wchar)*, IRoSimpleMetaDataBuilder);
}
