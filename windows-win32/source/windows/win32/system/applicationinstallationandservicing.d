module windows.win32.system.applicationinstallationandservicing;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, LARGE_INTEGER, PSTR, PWSTR, ULARGE_INTEGER;
import windows.win32.security.cryptography_ : CERT_CONTEXT;
import windows.win32.system.com_ : IDispatch, IStream, IUnknown, SAFEARRAY;
import windows.win32.system.registry : HKEY;
import windows.win32.system.windowsprogramming : ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;

version (Windows):
extern (Windows):

uint MsiCloseHandle(MSIHANDLE);
uint MsiCloseAllHandles();
INSTALLUILEVEL MsiSetInternalUI(INSTALLUILEVEL, HWND*);
INSTALLUI_HANDLERA MsiSetExternalUIA(INSTALLUI_HANDLERA, uint, void*);
INSTALLUI_HANDLERW MsiSetExternalUIW(INSTALLUI_HANDLERW, uint, void*);
uint MsiSetExternalUIRecord(PINSTALLUI_HANDLER_RECORD, uint, void*, PINSTALLUI_HANDLER_RECORD);
uint MsiEnableLogA(INSTALLOGMODE, const(char)*, uint);
uint MsiEnableLogW(INSTALLOGMODE, const(wchar)*, uint);
INSTALLSTATE MsiQueryProductStateA(const(char)*);
INSTALLSTATE MsiQueryProductStateW(const(wchar)*);
uint MsiGetProductInfoA(const(char)*, const(char)*, PSTR, uint*);
uint MsiGetProductInfoW(const(wchar)*, const(wchar)*, PWSTR, uint*);
uint MsiGetProductInfoExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, const(char)*, PSTR, uint*);
uint MsiGetProductInfoExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, const(wchar)*, PWSTR, uint*);
uint MsiInstallProductA(const(char)*, const(char)*);
uint MsiInstallProductW(const(wchar)*, const(wchar)*);
uint MsiConfigureProductA(const(char)*, INSTALLLEVEL, INSTALLSTATE);
uint MsiConfigureProductW(const(wchar)*, INSTALLLEVEL, INSTALLSTATE);
uint MsiConfigureProductExA(const(char)*, INSTALLLEVEL, INSTALLSTATE, const(char)*);
uint MsiConfigureProductExW(const(wchar)*, INSTALLLEVEL, INSTALLSTATE, const(wchar)*);
uint MsiReinstallProductA(const(char)*, REINSTALLMODE);
uint MsiReinstallProductW(const(wchar)*, REINSTALLMODE);
uint MsiAdvertiseProductExA(const(char)*, const(char)*, const(char)*, ushort, uint, uint);
uint MsiAdvertiseProductExW(const(wchar)*, const(wchar)*, const(wchar)*, ushort, uint, uint);
uint MsiAdvertiseProductA(const(char)*, const(char)*, const(char)*, ushort);
uint MsiAdvertiseProductW(const(wchar)*, const(wchar)*, const(wchar)*, ushort);
uint MsiProcessAdvertiseScriptA(const(char)*, const(char)*, HKEY, BOOL, BOOL);
uint MsiProcessAdvertiseScriptW(const(wchar)*, const(wchar)*, HKEY, BOOL, BOOL);
uint MsiAdvertiseScriptA(const(char)*, uint, HKEY*, BOOL);
uint MsiAdvertiseScriptW(const(wchar)*, uint, HKEY*, BOOL);
uint MsiGetProductInfoFromScriptA(const(char)*, PSTR, ushort*, uint*, PSTR, uint*, PSTR, uint*);
uint MsiGetProductInfoFromScriptW(const(wchar)*, PWSTR, ushort*, uint*, PWSTR, uint*, PWSTR, uint*);
uint MsiGetProductCodeA(const(char)*, PSTR);
uint MsiGetProductCodeW(const(wchar)*, PWSTR);
USERINFOSTATE MsiGetUserInfoA(const(char)*, PSTR, uint*, PSTR, uint*, PSTR, uint*);
USERINFOSTATE MsiGetUserInfoW(const(wchar)*, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*);
uint MsiCollectUserInfoA(const(char)*);
uint MsiCollectUserInfoW(const(wchar)*);
uint MsiApplyPatchA(const(char)*, const(char)*, INSTALLTYPE, const(char)*);
uint MsiApplyPatchW(const(wchar)*, const(wchar)*, INSTALLTYPE, const(wchar)*);
uint MsiGetPatchInfoA(const(char)*, const(char)*, PSTR, uint*);
uint MsiGetPatchInfoW(const(wchar)*, const(wchar)*, PWSTR, uint*);
uint MsiEnumPatchesA(const(char)*, uint, PSTR, PSTR, uint*);
uint MsiEnumPatchesW(const(wchar)*, uint, PWSTR, PWSTR, uint*);
uint MsiRemovePatchesA(const(char)*, const(char)*, INSTALLTYPE, const(char)*);
uint MsiRemovePatchesW(const(wchar)*, const(wchar)*, INSTALLTYPE, const(wchar)*);
uint MsiExtractPatchXMLDataA(const(char)*, uint, PSTR, uint*);
uint MsiExtractPatchXMLDataW(const(wchar)*, uint, PWSTR, uint*);
uint MsiGetPatchInfoExA(const(char)*, const(char)*, const(char)*, MSIINSTALLCONTEXT, const(char)*, PSTR, uint*);
uint MsiGetPatchInfoExW(const(wchar)*, const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, const(wchar)*, PWSTR, uint*);
uint MsiApplyMultiplePatchesA(const(char)*, const(char)*, const(char)*);
uint MsiApplyMultiplePatchesW(const(wchar)*, const(wchar)*, const(wchar)*);
uint MsiDeterminePatchSequenceA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, MSIPATCHSEQUENCEINFOA*);
uint MsiDeterminePatchSequenceW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, MSIPATCHSEQUENCEINFOW*);
uint MsiDetermineApplicablePatchesA(const(char)*, uint, MSIPATCHSEQUENCEINFOA*);
uint MsiDetermineApplicablePatchesW(const(wchar)*, uint, MSIPATCHSEQUENCEINFOW*);
uint MsiEnumPatchesExA(const(char)*, const(char)*, uint, uint, uint, PSTR, PSTR, MSIINSTALLCONTEXT*, PSTR, uint*);
uint MsiEnumPatchesExW(const(wchar)*, const(wchar)*, uint, uint, uint, PWSTR, PWSTR, MSIINSTALLCONTEXT*, PWSTR, uint*);
INSTALLSTATE MsiQueryFeatureStateA(const(char)*, const(char)*);
INSTALLSTATE MsiQueryFeatureStateW(const(wchar)*, const(wchar)*);
uint MsiQueryFeatureStateExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, const(char)*, INSTALLSTATE*);
uint MsiQueryFeatureStateExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, const(wchar)*, INSTALLSTATE*);
INSTALLSTATE MsiUseFeatureA(const(char)*, const(char)*);
INSTALLSTATE MsiUseFeatureW(const(wchar)*, const(wchar)*);
INSTALLSTATE MsiUseFeatureExA(const(char)*, const(char)*, uint, uint);
INSTALLSTATE MsiUseFeatureExW(const(wchar)*, const(wchar)*, uint, uint);
uint MsiGetFeatureUsageA(const(char)*, const(char)*, uint*, ushort*);
uint MsiGetFeatureUsageW(const(wchar)*, const(wchar)*, uint*, ushort*);
uint MsiConfigureFeatureA(const(char)*, const(char)*, INSTALLSTATE);
uint MsiConfigureFeatureW(const(wchar)*, const(wchar)*, INSTALLSTATE);
uint MsiReinstallFeatureA(const(char)*, const(char)*, REINSTALLMODE);
uint MsiReinstallFeatureW(const(wchar)*, const(wchar)*, REINSTALLMODE);
uint MsiProvideComponentA(const(char)*, const(char)*, const(char)*, INSTALLMODE, PSTR, uint*);
uint MsiProvideComponentW(const(wchar)*, const(wchar)*, const(wchar)*, INSTALLMODE, PWSTR, uint*);
uint MsiProvideQualifiedComponentA(const(char)*, const(char)*, INSTALLMODE, PSTR, uint*);
uint MsiProvideQualifiedComponentW(const(wchar)*, const(wchar)*, INSTALLMODE, PWSTR, uint*);
uint MsiProvideQualifiedComponentExA(const(char)*, const(char)*, INSTALLMODE, const(char)*, uint, uint, PSTR, uint*);
uint MsiProvideQualifiedComponentExW(const(wchar)*, const(wchar)*, INSTALLMODE, const(wchar)*, uint, uint, PWSTR, uint*);
INSTALLSTATE MsiGetComponentPathA(const(char)*, const(char)*, PSTR, uint*);
INSTALLSTATE MsiGetComponentPathW(const(wchar)*, const(wchar)*, PWSTR, uint*);
INSTALLSTATE MsiGetComponentPathExA(const(char)*, const(char)*, const(char)*, MSIINSTALLCONTEXT, PSTR, uint*);
INSTALLSTATE MsiGetComponentPathExW(const(wchar)*, const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, PWSTR, uint*);
uint MsiProvideAssemblyA(const(char)*, const(char)*, INSTALLMODE, MSIASSEMBLYINFO, PSTR, uint*);
uint MsiProvideAssemblyW(const(wchar)*, const(wchar)*, INSTALLMODE, MSIASSEMBLYINFO, PWSTR, uint*);
uint MsiQueryComponentStateA(const(char)*, const(char)*, MSIINSTALLCONTEXT, const(char)*, INSTALLSTATE*);
uint MsiQueryComponentStateW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, const(wchar)*, INSTALLSTATE*);
uint MsiEnumProductsA(uint, PSTR);
uint MsiEnumProductsW(uint, PWSTR);
uint MsiEnumProductsExA(const(char)*, const(char)*, uint, uint, PSTR, MSIINSTALLCONTEXT*, PSTR, uint*);
uint MsiEnumProductsExW(const(wchar)*, const(wchar)*, uint, uint, PWSTR, MSIINSTALLCONTEXT*, PWSTR, uint*);
uint MsiEnumRelatedProductsA(const(char)*, uint, uint, PSTR);
uint MsiEnumRelatedProductsW(const(wchar)*, uint, uint, PWSTR);
uint MsiEnumFeaturesA(const(char)*, uint, PSTR, PSTR);
uint MsiEnumFeaturesW(const(wchar)*, uint, PWSTR, PWSTR);
uint MsiEnumComponentsA(uint, PSTR);
uint MsiEnumComponentsW(uint, PWSTR);
uint MsiEnumComponentsExA(const(char)*, uint, uint, PSTR, MSIINSTALLCONTEXT*, PSTR, uint*);
uint MsiEnumComponentsExW(const(wchar)*, uint, uint, PWSTR, MSIINSTALLCONTEXT*, PWSTR, uint*);
uint MsiEnumClientsA(const(char)*, uint, PSTR);
uint MsiEnumClientsW(const(wchar)*, uint, PWSTR);
uint MsiEnumClientsExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, PSTR, MSIINSTALLCONTEXT*, PSTR, uint*);
uint MsiEnumClientsExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, PWSTR, MSIINSTALLCONTEXT*, PWSTR, uint*);
uint MsiEnumComponentQualifiersA(const(char)*, uint, PSTR, uint*, PSTR, uint*);
uint MsiEnumComponentQualifiersW(const(wchar)*, uint, PWSTR, uint*, PWSTR, uint*);
uint MsiOpenProductA(const(char)*, MSIHANDLE*);
uint MsiOpenProductW(const(wchar)*, MSIHANDLE*);
uint MsiOpenPackageA(const(char)*, MSIHANDLE*);
uint MsiOpenPackageW(const(wchar)*, MSIHANDLE*);
uint MsiOpenPackageExA(const(char)*, uint, MSIHANDLE*);
uint MsiOpenPackageExW(const(wchar)*, uint, MSIHANDLE*);
uint MsiGetPatchFileListA(const(char)*, const(char)*, uint*, MSIHANDLE**);
uint MsiGetPatchFileListW(const(wchar)*, const(wchar)*, uint*, MSIHANDLE**);
uint MsiGetProductPropertyA(MSIHANDLE, const(char)*, PSTR, uint*);
uint MsiGetProductPropertyW(MSIHANDLE, const(wchar)*, PWSTR, uint*);
uint MsiVerifyPackageA(const(char)*);
uint MsiVerifyPackageW(const(wchar)*);
uint MsiGetFeatureInfoA(MSIHANDLE, const(char)*, uint*, PSTR, uint*, PSTR, uint*);
uint MsiGetFeatureInfoW(MSIHANDLE, const(wchar)*, uint*, PWSTR, uint*, PWSTR, uint*);
uint MsiInstallMissingComponentA(const(char)*, const(char)*, INSTALLSTATE);
uint MsiInstallMissingComponentW(const(wchar)*, const(wchar)*, INSTALLSTATE);
uint MsiInstallMissingFileA(const(char)*, const(char)*);
uint MsiInstallMissingFileW(const(wchar)*, const(wchar)*);
INSTALLSTATE MsiLocateComponentA(const(char)*, PSTR, uint*);
INSTALLSTATE MsiLocateComponentW(const(wchar)*, PWSTR, uint*);
uint MsiSourceListClearAllA(const(char)*, const(char)*, uint);
uint MsiSourceListClearAllW(const(wchar)*, const(wchar)*, uint);
uint MsiSourceListAddSourceA(const(char)*, const(char)*, uint, const(char)*);
uint MsiSourceListAddSourceW(const(wchar)*, const(wchar)*, uint, const(wchar)*);
uint MsiSourceListForceResolutionA(const(char)*, const(char)*, uint);
uint MsiSourceListForceResolutionW(const(wchar)*, const(wchar)*, uint);
uint MsiSourceListAddSourceExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, const(char)*, uint);
uint MsiSourceListAddSourceExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, const(wchar)*, uint);
uint MsiSourceListAddMediaDiskA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, uint, const(char)*, const(char)*);
uint MsiSourceListAddMediaDiskW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, uint, const(wchar)*, const(wchar)*);
uint MsiSourceListClearSourceA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, const(char)*);
uint MsiSourceListClearSourceW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, const(wchar)*);
uint MsiSourceListClearMediaDiskA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, uint);
uint MsiSourceListClearMediaDiskW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, uint);
uint MsiSourceListClearAllExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint);
uint MsiSourceListClearAllExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint);
uint MsiSourceListForceResolutionExA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint);
uint MsiSourceListForceResolutionExW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint);
uint MsiSourceListSetInfoA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, const(char)*, const(char)*);
uint MsiSourceListSetInfoW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, const(wchar)*, const(wchar)*);
uint MsiSourceListGetInfoA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, const(char)*, PSTR, uint*);
uint MsiSourceListGetInfoW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, const(wchar)*, PWSTR, uint*);
uint MsiSourceListEnumSourcesA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, uint, PSTR, uint*);
uint MsiSourceListEnumSourcesW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, uint, PWSTR, uint*);
uint MsiSourceListEnumMediaDisksA(const(char)*, const(char)*, MSIINSTALLCONTEXT, uint, uint, uint*, PSTR, uint*, PSTR, uint*);
uint MsiSourceListEnumMediaDisksW(const(wchar)*, const(wchar)*, MSIINSTALLCONTEXT, uint, uint, uint*, PWSTR, uint*, PWSTR, uint*);
uint MsiGetFileVersionA(const(char)*, PSTR, uint*, PSTR, uint*);
uint MsiGetFileVersionW(const(wchar)*, PWSTR, uint*, PWSTR, uint*);
uint MsiGetFileHashA(const(char)*, uint, MSIFILEHASHINFO*);
uint MsiGetFileHashW(const(wchar)*, uint, MSIFILEHASHINFO*);
HRESULT MsiGetFileSignatureInformationA(const(char)*, uint, CERT_CONTEXT**, ubyte*, uint*);
HRESULT MsiGetFileSignatureInformationW(const(wchar)*, uint, CERT_CONTEXT**, ubyte*, uint*);
uint MsiGetShortcutTargetA(const(char)*, PSTR, PSTR, PSTR);
uint MsiGetShortcutTargetW(const(wchar)*, PWSTR, PWSTR, PWSTR);
uint MsiIsProductElevatedA(const(char)*, BOOL*);
uint MsiIsProductElevatedW(const(wchar)*, BOOL*);
uint MsiNotifySidChangeA(const(char)*, const(char)*);
uint MsiNotifySidChangeW(const(wchar)*, const(wchar)*);
uint MsiBeginTransactionA(const(char)*, uint, MSIHANDLE*, HANDLE*);
uint MsiBeginTransactionW(const(wchar)*, uint, MSIHANDLE*, HANDLE*);
uint MsiEndTransaction(MSITRANSACTIONSTATE);
uint MsiJoinTransaction(MSIHANDLE, uint, HANDLE*);
uint MsiDatabaseOpenViewA(MSIHANDLE, const(char)*, MSIHANDLE*);
uint MsiDatabaseOpenViewW(MSIHANDLE, const(wchar)*, MSIHANDLE*);
MSIDBERROR MsiViewGetErrorA(MSIHANDLE, PSTR, uint*);
MSIDBERROR MsiViewGetErrorW(MSIHANDLE, PWSTR, uint*);
uint MsiViewExecute(MSIHANDLE, MSIHANDLE);
uint MsiViewFetch(MSIHANDLE, MSIHANDLE*);
uint MsiViewModify(MSIHANDLE, MSIMODIFY, MSIHANDLE);
uint MsiViewGetColumnInfo(MSIHANDLE, MSICOLINFO, MSIHANDLE*);
uint MsiViewClose(MSIHANDLE);
uint MsiDatabaseGetPrimaryKeysA(MSIHANDLE, const(char)*, MSIHANDLE*);
uint MsiDatabaseGetPrimaryKeysW(MSIHANDLE, const(wchar)*, MSIHANDLE*);
MSICONDITION MsiDatabaseIsTablePersistentA(MSIHANDLE, const(char)*);
MSICONDITION MsiDatabaseIsTablePersistentW(MSIHANDLE, const(wchar)*);
uint MsiGetSummaryInformationA(MSIHANDLE, const(char)*, uint, MSIHANDLE*);
uint MsiGetSummaryInformationW(MSIHANDLE, const(wchar)*, uint, MSIHANDLE*);
uint MsiSummaryInfoGetPropertyCount(MSIHANDLE, uint*);
uint MsiSummaryInfoSetPropertyA(MSIHANDLE, uint, uint, int, FILETIME*, const(char)*);
uint MsiSummaryInfoSetPropertyW(MSIHANDLE, uint, uint, int, FILETIME*, const(wchar)*);
uint MsiSummaryInfoGetPropertyA(MSIHANDLE, uint, uint*, int*, FILETIME*, PSTR, uint*);
uint MsiSummaryInfoGetPropertyW(MSIHANDLE, uint, uint*, int*, FILETIME*, PWSTR, uint*);
uint MsiSummaryInfoPersist(MSIHANDLE);
uint MsiOpenDatabaseA(const(char)*, const(char)*, MSIHANDLE*);
uint MsiOpenDatabaseW(const(wchar)*, const(wchar)*, MSIHANDLE*);
uint MsiDatabaseImportA(MSIHANDLE, const(char)*, const(char)*);
uint MsiDatabaseImportW(MSIHANDLE, const(wchar)*, const(wchar)*);
uint MsiDatabaseExportA(MSIHANDLE, const(char)*, const(char)*, const(char)*);
uint MsiDatabaseExportW(MSIHANDLE, const(wchar)*, const(wchar)*, const(wchar)*);
uint MsiDatabaseMergeA(MSIHANDLE, MSIHANDLE, const(char)*);
uint MsiDatabaseMergeW(MSIHANDLE, MSIHANDLE, const(wchar)*);
uint MsiDatabaseGenerateTransformA(MSIHANDLE, MSIHANDLE, const(char)*, int, int);
uint MsiDatabaseGenerateTransformW(MSIHANDLE, MSIHANDLE, const(wchar)*, int, int);
uint MsiDatabaseApplyTransformA(MSIHANDLE, const(char)*, MSITRANSFORM_ERROR);
uint MsiDatabaseApplyTransformW(MSIHANDLE, const(wchar)*, MSITRANSFORM_ERROR);
uint MsiCreateTransformSummaryInfoA(MSIHANDLE, MSIHANDLE, const(char)*, MSITRANSFORM_ERROR, MSITRANSFORM_VALIDATE);
uint MsiCreateTransformSummaryInfoW(MSIHANDLE, MSIHANDLE, const(wchar)*, MSITRANSFORM_ERROR, MSITRANSFORM_VALIDATE);
uint MsiDatabaseCommit(MSIHANDLE);
MSIDBSTATE MsiGetDatabaseState(MSIHANDLE);
MSIHANDLE MsiCreateRecord(uint);
BOOL MsiRecordIsNull(MSIHANDLE, uint);
uint MsiRecordDataSize(MSIHANDLE, uint);
uint MsiRecordSetInteger(MSIHANDLE, uint, int);
uint MsiRecordSetStringA(MSIHANDLE, uint, const(char)*);
uint MsiRecordSetStringW(MSIHANDLE, uint, const(wchar)*);
int MsiRecordGetInteger(MSIHANDLE, uint);
uint MsiRecordGetStringA(MSIHANDLE, uint, PSTR, uint*);
uint MsiRecordGetStringW(MSIHANDLE, uint, PWSTR, uint*);
uint MsiRecordGetFieldCount(MSIHANDLE);
uint MsiRecordSetStreamA(MSIHANDLE, uint, const(char)*);
uint MsiRecordSetStreamW(MSIHANDLE, uint, const(wchar)*);
uint MsiRecordReadStream(MSIHANDLE, uint, PSTR, uint*);
uint MsiRecordClearData(MSIHANDLE);
MSIHANDLE MsiGetActiveDatabase(MSIHANDLE);
uint MsiSetPropertyA(MSIHANDLE, const(char)*, const(char)*);
uint MsiSetPropertyW(MSIHANDLE, const(wchar)*, const(wchar)*);
uint MsiGetPropertyA(MSIHANDLE, const(char)*, PSTR, uint*);
uint MsiGetPropertyW(MSIHANDLE, const(wchar)*, PWSTR, uint*);
ushort MsiGetLanguage(MSIHANDLE);
BOOL MsiGetMode(MSIHANDLE, MSIRUNMODE);
uint MsiSetMode(MSIHANDLE, MSIRUNMODE, BOOL);
uint MsiFormatRecordA(MSIHANDLE, MSIHANDLE, PSTR, uint*);
uint MsiFormatRecordW(MSIHANDLE, MSIHANDLE, PWSTR, uint*);
uint MsiDoActionA(MSIHANDLE, const(char)*);
uint MsiDoActionW(MSIHANDLE, const(wchar)*);
uint MsiSequenceA(MSIHANDLE, const(char)*, int);
uint MsiSequenceW(MSIHANDLE, const(wchar)*, int);
int MsiProcessMessage(MSIHANDLE, INSTALLMESSAGE, MSIHANDLE);
MSICONDITION MsiEvaluateConditionA(MSIHANDLE, const(char)*);
MSICONDITION MsiEvaluateConditionW(MSIHANDLE, const(wchar)*);
uint MsiGetFeatureStateA(MSIHANDLE, const(char)*, INSTALLSTATE*, INSTALLSTATE*);
uint MsiGetFeatureStateW(MSIHANDLE, const(wchar)*, INSTALLSTATE*, INSTALLSTATE*);
uint MsiSetFeatureStateA(MSIHANDLE, const(char)*, INSTALLSTATE);
uint MsiSetFeatureStateW(MSIHANDLE, const(wchar)*, INSTALLSTATE);
uint MsiSetFeatureAttributesA(MSIHANDLE, const(char)*, uint);
uint MsiSetFeatureAttributesW(MSIHANDLE, const(wchar)*, uint);
uint MsiGetComponentStateA(MSIHANDLE, const(char)*, INSTALLSTATE*, INSTALLSTATE*);
uint MsiGetComponentStateW(MSIHANDLE, const(wchar)*, INSTALLSTATE*, INSTALLSTATE*);
uint MsiSetComponentStateA(MSIHANDLE, const(char)*, INSTALLSTATE);
uint MsiSetComponentStateW(MSIHANDLE, const(wchar)*, INSTALLSTATE);
uint MsiGetFeatureCostA(MSIHANDLE, const(char)*, MSICOSTTREE, INSTALLSTATE, int*);
uint MsiGetFeatureCostW(MSIHANDLE, const(wchar)*, MSICOSTTREE, INSTALLSTATE, int*);
uint MsiEnumComponentCostsA(MSIHANDLE, const(char)*, uint, INSTALLSTATE, PSTR, uint*, int*, int*);
uint MsiEnumComponentCostsW(MSIHANDLE, const(wchar)*, uint, INSTALLSTATE, PWSTR, uint*, int*, int*);
uint MsiSetInstallLevel(MSIHANDLE, int);
uint MsiGetFeatureValidStatesA(MSIHANDLE, const(char)*, uint*);
uint MsiGetFeatureValidStatesW(MSIHANDLE, const(wchar)*, uint*);
uint MsiGetSourcePathA(MSIHANDLE, const(char)*, PSTR, uint*);
uint MsiGetSourcePathW(MSIHANDLE, const(wchar)*, PWSTR, uint*);
uint MsiGetTargetPathA(MSIHANDLE, const(char)*, PSTR, uint*);
uint MsiGetTargetPathW(MSIHANDLE, const(wchar)*, PWSTR, uint*);
uint MsiSetTargetPathA(MSIHANDLE, const(char)*, const(char)*);
uint MsiSetTargetPathW(MSIHANDLE, const(wchar)*, const(wchar)*);
uint MsiVerifyDiskSpace(MSIHANDLE);
uint MsiEnableUIPreview(MSIHANDLE, MSIHANDLE*);
uint MsiPreviewDialogA(MSIHANDLE, const(char)*);
uint MsiPreviewDialogW(MSIHANDLE, const(wchar)*);
uint MsiPreviewBillboardA(MSIHANDLE, const(char)*, const(char)*);
uint MsiPreviewBillboardW(MSIHANDLE, const(wchar)*, const(wchar)*);
MSIHANDLE MsiGetLastErrorRecord();
BOOL SfcGetNextProtectedFile(HANDLE, PROTECTED_FILE_DATA*);
BOOL SfcIsFileProtected(HANDLE, const(wchar)*);
BOOL SfcIsKeyProtected(HKEY, const(wchar)*, uint);
BOOL SfpVerifyFile(const(char)*, PSTR, uint);
BOOL CreatePatchFileA(const(char)*, const(char)*, const(char)*, uint, PATCH_OPTION_DATA*);
BOOL CreatePatchFileW(const(wchar)*, const(wchar)*, const(wchar)*, uint, PATCH_OPTION_DATA*);
BOOL CreatePatchFileByHandles(HANDLE, HANDLE, HANDLE, uint, PATCH_OPTION_DATA*);
BOOL CreatePatchFileExA(uint, PATCH_OLD_FILE_INFO_A*, const(char)*, const(char)*, uint, PATCH_OPTION_DATA*, PPATCH_PROGRESS_CALLBACK, void*);
BOOL CreatePatchFileExW(uint, PATCH_OLD_FILE_INFO_W*, const(wchar)*, const(wchar)*, uint, PATCH_OPTION_DATA*, PPATCH_PROGRESS_CALLBACK, void*);
BOOL CreatePatchFileByHandlesEx(uint, PATCH_OLD_FILE_INFO_H*, HANDLE, HANDLE, uint, PATCH_OPTION_DATA*, PPATCH_PROGRESS_CALLBACK, void*);
BOOL ExtractPatchHeaderToFileA(const(char)*, const(char)*);
BOOL ExtractPatchHeaderToFileW(const(wchar)*, const(wchar)*);
BOOL ExtractPatchHeaderToFileByHandles(HANDLE, HANDLE);
BOOL TestApplyPatchToFileA(const(char)*, const(char)*, uint);
BOOL TestApplyPatchToFileW(const(wchar)*, const(wchar)*, uint);
BOOL TestApplyPatchToFileByHandles(HANDLE, HANDLE, uint);
BOOL TestApplyPatchToFileByBuffers(ubyte*, uint, ubyte*, uint, uint*, uint);
BOOL ApplyPatchToFileA(const(char)*, const(char)*, const(char)*, uint);
BOOL ApplyPatchToFileW(const(wchar)*, const(wchar)*, const(wchar)*, uint);
BOOL ApplyPatchToFileByHandles(HANDLE, HANDLE, HANDLE, uint);
BOOL ApplyPatchToFileExA(const(char)*, const(char)*, const(char)*, uint, PPATCH_PROGRESS_CALLBACK, void*);
BOOL ApplyPatchToFileExW(const(wchar)*, const(wchar)*, const(wchar)*, uint, PPATCH_PROGRESS_CALLBACK, void*);
BOOL ApplyPatchToFileByHandlesEx(HANDLE, HANDLE, HANDLE, uint, PPATCH_PROGRESS_CALLBACK, void*);
BOOL ApplyPatchToFileByBuffers(ubyte*, uint, ubyte*, uint, ubyte**, uint, uint*, FILETIME*, uint, PPATCH_PROGRESS_CALLBACK, void*);
BOOL GetFilePatchSignatureA(const(char)*, uint, void*, uint, PATCH_IGNORE_RANGE*, uint, PATCH_RETAIN_RANGE*, uint, PSTR);
BOOL GetFilePatchSignatureW(const(wchar)*, uint, void*, uint, PATCH_IGNORE_RANGE*, uint, PATCH_RETAIN_RANGE*, uint, PWSTR);
BOOL GetFilePatchSignatureByHandle(HANDLE, uint, void*, uint, PATCH_IGNORE_RANGE*, uint, PATCH_RETAIN_RANGE*, uint, PSTR);
BOOL GetFilePatchSignatureByBuffer(ubyte*, uint, uint, void*, uint, PATCH_IGNORE_RANGE*, uint, PATCH_RETAIN_RANGE*, uint, PSTR);
int NormalizeFileForPatchSignature(void*, uint, uint, PATCH_OPTION_DATA*, uint, uint, uint, PATCH_IGNORE_RANGE*, uint, PATCH_RETAIN_RANGE*);
BOOL GetDeltaInfoB(DELTA_INPUT, DELTA_HEADER_INFO*);
BOOL GetDeltaInfoA(const(char)*, DELTA_HEADER_INFO*);
BOOL GetDeltaInfoW(const(wchar)*, DELTA_HEADER_INFO*);
BOOL ApplyDeltaGetReverseB(long, DELTA_INPUT, DELTA_INPUT, const(FILETIME)*, DELTA_OUTPUT*, DELTA_OUTPUT*);
BOOL ApplyDeltaB(long, DELTA_INPUT, DELTA_INPUT, DELTA_OUTPUT*);
BOOL ApplyDeltaProvidedB(long, DELTA_INPUT, DELTA_INPUT, void*, ulong);
BOOL ApplyDeltaA(long, const(char)*, const(char)*, const(char)*);
BOOL ApplyDeltaW(long, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL CreateDeltaB(long, long, long, DELTA_INPUT, DELTA_INPUT, DELTA_INPUT, DELTA_INPUT, DELTA_INPUT, const(FILETIME)*, uint, DELTA_OUTPUT*);
BOOL CreateDeltaA(long, long, long, const(char)*, const(char)*, const(char)*, const(char)*, DELTA_INPUT, const(FILETIME)*, uint, const(char)*);
BOOL CreateDeltaW(long, long, long, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, DELTA_INPUT, const(FILETIME)*, uint, const(wchar)*);
BOOL GetDeltaSignatureB(long, uint, DELTA_INPUT, DELTA_HASH*);
BOOL GetDeltaSignatureA(long, uint, const(char)*, DELTA_HASH*);
BOOL GetDeltaSignatureW(long, uint, const(wchar)*, DELTA_HASH*);
BOOL DeltaNormalizeProvidedB(long, long, DELTA_INPUT, void*, ulong);
BOOL DeltaFree(void*);
HANDLE CreateActCtxA(ACTCTXA*);
HANDLE CreateActCtxW(ACTCTXW*);
void AddRefActCtx(HANDLE);
void ReleaseActCtx(HANDLE);
BOOL ZombifyActCtx(HANDLE);
BOOL ActivateActCtx(HANDLE, ulong*);
BOOL DeactivateActCtx(uint, ulong);
BOOL GetCurrentActCtx(HANDLE*);
BOOL FindActCtxSectionStringA(uint, const(GUID)*, uint, const(char)*, ACTCTX_SECTION_KEYED_DATA*);
BOOL FindActCtxSectionStringW(uint, const(GUID)*, uint, const(wchar)*, ACTCTX_SECTION_KEYED_DATA*);
BOOL FindActCtxSectionGuid(uint, const(GUID)*, uint, const(GUID)*, ACTCTX_SECTION_KEYED_DATA*);
BOOL QueryActCtxW(uint, HANDLE, void*, uint, void*, ulong, ulong*);
BOOL QueryActCtxSettingsW(uint, HANDLE, const(wchar)*, const(wchar)*, PWSTR, ulong, ulong*);
enum UIALL = 0x00008000;
enum LOGTOKEN_TYPE_MASK = 0x00000003;
enum LOGTOKEN_UNSPECIFIED = 0x00000000;
enum LOGTOKEN_NO_LOG = 0x00000001;
enum LOGTOKEN_SETUPAPI_APPLOG = 0x00000002;
enum LOGTOKEN_SETUPAPI_DEVLOG = 0x00000003;
enum TXTLOG_SETUPAPI_DEVLOG = 0x00000001;
enum TXTLOG_SETUPAPI_CMDLINE = 0x00000002;
enum TXTLOG_SETUPAPI_BITS = 0x00000003;
enum TXTLOG_ERROR = 0x00000001;
enum TXTLOG_WARNING = 0x00000002;
enum TXTLOG_SYSTEM_STATE_CHANGE = 0x00000003;
enum TXTLOG_SUMMARY = 0x00000004;
enum TXTLOG_DETAILS = 0x00000005;
enum TXTLOG_VERBOSE = 0x00000006;
enum TXTLOG_VERY_VERBOSE = 0x00000007;
enum TXTLOG_RESERVED_FLAGS = 0x0000fff0;
enum TXTLOG_TIMESTAMP = 0x00010000;
enum TXTLOG_DEPTH_INCR = 0x00020000;
enum TXTLOG_DEPTH_DECR = 0x00040000;
enum TXTLOG_TAB_1 = 0x00080000;
enum TXTLOG_FLUSH_FILE = 0x00100000;
enum TXTLOG_DEVINST = 0x00000001;
enum TXTLOG_INF = 0x00000002;
enum TXTLOG_FILEQ = 0x00000004;
enum TXTLOG_COPYFILES = 0x00000008;
enum TXTLOG_SIGVERIF = 0x00000020;
enum TXTLOG_BACKUP = 0x00000080;
enum TXTLOG_UI = 0x00000100;
enum TXTLOG_UTIL = 0x00000200;
enum TXTLOG_INFDB = 0x00000400;
enum TXTLOG_DRVSETUP = 0x00400000;
enum TXTLOG_POLICY = 0x00800000;
enum TXTLOG_NEWDEV = 0x01000000;
enum TXTLOG_UMPNPMGR = 0x02000000;
enum TXTLOG_DRIVER_STORE = 0x04000000;
enum TXTLOG_SETUP = 0x08000000;
enum TXTLOG_CMI = 0x10000000;
enum TXTLOG_DEVMGR = 0x20000000;
enum TXTLOG_INSTALLER = 0x40000000;
enum TXTLOG_VENDOR = 0x80000000;
enum CLSID_EvalCom2 = GUID(0x6e5e1910, 0x8053, 0x4660, [0xb7, 0x95, 0x6b, 0x61, 0x2e, 0x29, 0xbc, 0x58]);
enum _WIN32_MSM = 0x00000064;
enum LIBID_MsmMergeTypeLib = GUID(0xadda82f, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
enum CLSID_MsmMerge2 = GUID(0xf94985d5, 0x29f9, 0x4743, [0x98, 0x5, 0x99, 0xbc, 0x3f, 0x35, 0xb6, 0x78]);
enum _WIN32_MSI = 0x000001f4;
enum MAX_GUID_CHARS = 0x00000026;
enum MAX_FEATURE_CHARS = 0x00000026;
enum INSTALLPROPERTY_PACKAGENAME = "PackageName";
enum INSTALLPROPERTY_TRANSFORMS = "Transforms";
enum INSTALLPROPERTY_LANGUAGE = "Language";
enum INSTALLPROPERTY_PRODUCTNAME = "ProductName";
enum INSTALLPROPERTY_ASSIGNMENTTYPE = "AssignmentType";
enum INSTALLPROPERTY_INSTANCETYPE = "InstanceType";
enum INSTALLPROPERTY_AUTHORIZED_LUA_APP = "AuthorizedLUAApp";
enum INSTALLPROPERTY_PACKAGECODE = "PackageCode";
enum INSTALLPROPERTY_VERSION = "Version";
enum INSTALLPROPERTY_PRODUCTICON = "ProductIcon";
enum INSTALLPROPERTY_INSTALLEDPRODUCTNAME = "InstalledProductName";
enum INSTALLPROPERTY_VERSIONSTRING = "VersionString";
enum INSTALLPROPERTY_HELPLINK = "HelpLink";
enum INSTALLPROPERTY_HELPTELEPHONE = "HelpTelephone";
enum INSTALLPROPERTY_INSTALLLOCATION = "InstallLocation";
enum INSTALLPROPERTY_INSTALLSOURCE = "InstallSource";
enum INSTALLPROPERTY_INSTALLDATE = "InstallDate";
enum INSTALLPROPERTY_PUBLISHER = "Publisher";
enum INSTALLPROPERTY_LOCALPACKAGE = "LocalPackage";
enum INSTALLPROPERTY_URLINFOABOUT = "URLInfoAbout";
enum INSTALLPROPERTY_URLUPDATEINFO = "URLUpdateInfo";
enum INSTALLPROPERTY_VERSIONMINOR = "VersionMinor";
enum INSTALLPROPERTY_VERSIONMAJOR = "VersionMajor";
enum INSTALLPROPERTY_PRODUCTID = "ProductID";
enum INSTALLPROPERTY_REGCOMPANY = "RegCompany";
enum INSTALLPROPERTY_REGOWNER = "RegOwner";
enum INSTALLPROPERTY_INSTALLEDLANGUAGE = "InstalledLanguage";
enum INSTALLPROPERTY_UNINSTALLABLE = "Uninstallable";
enum INSTALLPROPERTY_PRODUCTSTATE = "State";
enum INSTALLPROPERTY_PATCHSTATE = "State";
enum INSTALLPROPERTY_PATCHTYPE = "PatchType";
enum INSTALLPROPERTY_LUAENABLED = "LUAEnabled";
enum INSTALLPROPERTY_DISPLAYNAME = "DisplayName";
enum INSTALLPROPERTY_MOREINFOURL = "MoreInfoURL";
enum INSTALLPROPERTY_LASTUSEDSOURCE = "LastUsedSource";
enum INSTALLPROPERTY_LASTUSEDTYPE = "LastUsedType";
enum INSTALLPROPERTY_MEDIAPACKAGEPATH = "MediaPackagePath";
enum INSTALLPROPERTY_DISKPROMPT = "DiskPrompt";
enum MSI_INVALID_HASH_IS_FATAL = 0x00000001;
enum ERROR_ROLLBACK_DISABLED = 0x00000675;
enum MSI_NULL_INTEGER = 0x80000000;
enum INSTALLMESSAGE_TYPEMASK = 0xffffffffff000000;
enum STREAM_FORMAT_COMPLIB_MODULE = 0x00000000;
enum STREAM_FORMAT_COMPLIB_MANIFEST = 0x00000001;
enum STREAM_FORMAT_WIN32_MODULE = 0x00000002;
enum STREAM_FORMAT_WIN32_MANIFEST = 0x00000004;
enum IASSEMBLYCACHEITEM_COMMIT_FLAG_REFRESH = 0x00000001;
enum ASSEMBLYINFO_FLAG_INSTALLED = 0x00000001;
enum ASSEMBLYINFO_FLAG_PAYLOADRESIDENT = 0x00000002;
enum IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_INSTALLED = 0x00000001;
enum IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_REFRESHED = 0x00000002;
enum IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_ALREADY_INSTALLED = 0x00000003;
enum FUSION_REFCOUNT_UNINSTALL_SUBKEY_GUID = GUID(0x8cedc215, 0xac4b, 0x488b, [0x93, 0xc0, 0xa5, 0xa, 0x49, 0xcb, 0x2f, 0xb8]);
enum FUSION_REFCOUNT_FILEPATH_GUID = GUID(0xb02f9d65, 0xfb77, 0x4f7a, [0xaf, 0xa5, 0xb3, 0x91, 0x30, 0x9f, 0x11, 0xc9]);
enum FUSION_REFCOUNT_OPAQUE_STRING_GUID = GUID(0x2ec93463, 0xb0c3, 0x45e1, [0x83, 0x64, 0x32, 0x7e, 0x96, 0xae, 0xa8, 0x56]);
enum SFC_DISABLE_NORMAL = 0x00000000;
enum SFC_DISABLE_ASK = 0x00000001;
enum SFC_DISABLE_ONCE = 0x00000002;
enum SFC_DISABLE_SETUP = 0x00000003;
enum SFC_DISABLE_NOPOPUPS = 0x00000004;
enum SFC_SCAN_NORMAL = 0x00000000;
enum SFC_SCAN_ALWAYS = 0x00000001;
enum SFC_SCAN_ONCE = 0x00000002;
enum SFC_SCAN_IMMEDIATE = 0x00000003;
enum SFC_QUOTA_DEFAULT = 0x00000032;
enum SFC_IDLE_TRIGGER = "WFP_IDLE_TRIGGER";
enum IPROPNAME_PRODUCTNAME = "ProductName";
enum IPROPNAME_PRODUCTCODE = "ProductCode";
enum IPROPNAME_PRODUCTVERSION = "ProductVersion";
enum IPROPNAME_INSTALLLANGUAGE = "ProductLanguage";
enum IPROPNAME_MANUFACTURER = "Manufacturer";
enum IPROPNAME_UPGRADECODE = "UpgradeCode";
enum IPROPNAME_PIDTEMPLATE = "PIDTemplate";
enum IPROPNAME_DISKPROMPT = "DiskPrompt";
enum IPROPNAME_LEFTUNIT = "LeftUnit";
enum IPROPNAME_ADMIN_PROPERTIES = "AdminProperties";
enum IPROPNAME_DEFAULTUIFONT = "DefaultUIFont";
enum IPROPNAME_ALLOWEDPROPERTIES = "SecureCustomProperties";
enum IPROPNAME_ENABLEUSERCONTROL = "EnableUserControl";
enum IPROPNAME_HIDDEN_PROPERTIES = "MsiHiddenProperties";
enum IPROPNAME_USERNAME = "USERNAME";
enum IPROPNAME_COMPANYNAME = "COMPANYNAME";
enum IPROPNAME_PIDKEY = "PIDKEY";
enum IPROPNAME_PATCH = "PATCH";
enum IPROPNAME_MSIPATCHREMOVE = "MSIPATCHREMOVE";
enum IPROPNAME_TARGETDIR = "TARGETDIR";
enum IPROPNAME_ACTION = "ACTION";
enum IPROPNAME_LIMITUI = "LIMITUI";
enum IPROPNAME_LOGACTION = "LOGACTION";
enum IPROPNAME_ALLUSERS = "ALLUSERS";
enum IPROPNAME_INSTALLLEVEL = "INSTALLLEVEL";
enum IPROPNAME_REBOOT = "REBOOT";
enum IPROPNAME_REBOOTPROMPT = "REBOOTPROMPT";
enum IPROPNAME_EXECUTEMODE = "EXECUTEMODE";
enum IPROPVALUE_EXECUTEMODE_NONE = "NONE";
enum IPROPVALUE_EXECUTEMODE_SCRIPT = "SCRIPT";
enum IPROPNAME_EXECUTEACTION = "EXECUTEACTION";
enum IPROPNAME_SOURCELIST = "SOURCELIST";
enum IPROPNAME_ROOTDRIVE = "ROOTDRIVE";
enum IPROPNAME_TRANSFORMS = "TRANSFORMS";
enum IPROPNAME_TRANSFORMSATSOURCE = "TRANSFORMSATSOURCE";
enum IPROPNAME_TRANSFORMSSECURE = "TRANSFORMSSECURE";
enum IPROPNAME_SEQUENCE = "SEQUENCE";
enum IPROPNAME_SHORTFILENAMES = "SHORTFILENAMES";
enum IPROPNAME_PRIMARYFOLDER = "PRIMARYFOLDER";
enum IPROPNAME_AFTERREBOOT = "AFTERREBOOT";
enum IPROPNAME_NOCOMPANYNAME = "NOCOMPANYNAME";
enum IPROPNAME_NOUSERNAME = "NOUSERNAME";
enum IPROPNAME_DISABLEROLLBACK = "DISABLEROLLBACK";
enum IPROPNAME_AVAILABLEFREEREG = "AVAILABLEFREEREG";
enum IPROPNAME_DISABLEADVTSHORTCUTS = "DISABLEADVTSHORTCUTS";
enum IPROPNAME_PATCHNEWPACKAGECODE = "PATCHNEWPACKAGECODE";
enum IPROPNAME_PATCHNEWSUMMARYSUBJECT = "PATCHNEWSUMMARYSUBJECT";
enum IPROPNAME_PATCHNEWSUMMARYCOMMENTS = "PATCHNEWSUMMARYCOMMENTS";
enum IPROPNAME_PRODUCTLANGUAGE = "PRODUCTLANGUAGE";
enum IPROPNAME_CHECKCRCS = "MSICHECKCRCS";
enum IPROPNAME_MSINODISABLEMEDIA = "MSINODISABLEMEDIA";
enum IPROPNAME_CARRYINGNDP = "CARRYINGNDP";
enum IPROPVALUE__CARRYINGNDP_URTREINSTALL = "URTREINSTALL";
enum IPROPVALUE__CARRYINGNDP_URTUPGRADE = "URTUPGRADE";
enum IPROPNAME_ENFORCE_UPGRADE_COMPONENT_RULES = "MSIENFORCEUPGRADECOMPONENTRULES";
enum IPROPNAME_MSINEWINSTANCE = "MSINEWINSTANCE";
enum IPROPNAME_MSIINSTANCEGUID = "MSIINSTANCEGUID";
enum IPROPNAME_MSIPACKAGEDOWNLOADLOCALCOPY = "MSIPACKAGEDOWNLOADLOCALCOPY";
enum IPROPNAME_MSIPATCHDOWNLOADLOCALCOPY = "MSIPATCHDOWNLOADLOCALCOPY";
enum IPROPNAME_MSIDISABLELUAPATCHING = "MSIDISABLELUAPATCHING";
enum IPROPNAME_MSILOGGINGMODE = "MsiLogging";
enum IPROPNAME_MSILOGFILELOCATION = "MsiLogFileLocation";
enum IPROPNAME_MSI_RM_CONTROL = "MSIRESTARTMANAGERCONTROL";
enum IPROPVALUE_MSI_RM_CONTROL_DISABLE = "Disable";
enum IPROPVALUE_MSI_RM_CONTROL_DISABLESHUTDOWN = "DisableShutdown";
enum IPROPNAME_MSI_RM_SESSION_KEY = "MsiRestartManagerSessionKey";
enum IPROPNAME_MSI_REBOOT_PENDING = "MsiSystemRebootPending";
enum IPROPNAME_MSI_RM_SHUTDOWN = "MSIRMSHUTDOWN";
enum IPROPNAME_MSI_RM_DISABLE_RESTART = "MSIDISABLERMRESTART";
enum IPROPNAME_MSI_UAC_DEPLOYMENT_COMPLIANT = "MSIDEPLOYMENTCOMPLIANT";
enum IPROPNAME_MSI_USE_REAL_ADMIN_DETECTION = "MSIUSEREALADMINDETECTION";
enum IPROPNAME_MSI_UNINSTALL_SUPERSEDED_COMPONENTS = "MSIUNINSTALLSUPERSEDEDCOMPONENTS";
enum IPROPNAME_MSIDISABLEEEUI = "MSIDISABLEEEUI";
enum IPROPNAME_MSI_FASTINSTALL = "MSIFASTINSTALL";
enum IPROPNAME_INSTALLPERUSER = "MSIINSTALLPERUSER";
enum IPROPNAME_INTERNALINSTALLEDPERUSER = "MSIINTERNALINSTALLEDPERUSER";
enum IPROPNAME_ARPAUTHORIZEDCDFPREFIX = "ARPAUTHORIZEDCDFPREFIX";
enum IPROPNAME_ARPCOMMENTS = "ARPCOMMENTS";
enum IPROPNAME_ARPCONTACT = "ARPCONTACT";
enum IPROPNAME_ARPHELPLINK = "ARPHELPLINK";
enum IPROPNAME_ARPHELPTELEPHONE = "ARPHELPTELEPHONE";
enum IPROPNAME_ARPINSTALLLOCATION = "ARPINSTALLLOCATION";
enum IPROPNAME_ARPNOMODIFY = "ARPNOMODIFY";
enum IPROPNAME_ARPNOREMOVE = "ARPNOREMOVE";
enum IPROPNAME_ARPNOREPAIR = "ARPNOREPAIR";
enum IPROPNAME_ARPREADME = "ARPREADME";
enum IPROPNAME_ARPSIZE = "ARPSIZE";
enum IPROPNAME_ARPSYSTEMCOMPONENT = "ARPSYSTEMCOMPONENT";
enum IPROPNAME_ARPURLINFOABOUT = "ARPURLINFOABOUT";
enum IPROPNAME_ARPURLUPDATEINFO = "ARPURLUPDATEINFO";
enum IPROPNAME_ARPPRODUCTICON = "ARPPRODUCTICON";
enum IPROPNAME_ARPSETTINGSIDENTIFIER = "MSIARPSETTINGSIDENTIFIER";
enum IPROPNAME_ARPSHIMFLAGS = "SHIMFLAGS";
enum IPROPNAME_ARPSHIMVERSIONNT = "SHIMVERSIONNT";
enum IPROPNAME_ARPSHIMSERVICEPACKLEVEL = "SHIMSERVICEPACKLEVEL";
enum IPROPNAME_INSTALLED = "Installed";
enum IPROPNAME_PRODUCTSTATE = "ProductState";
enum IPROPNAME_PRESELECTED = "Preselected";
enum IPROPNAME_RESUME = "RESUME";
enum IPROPNAME_UPDATESTARTED = "UpdateStarted";
enum IPROPNAME_PRODUCTID = "ProductID";
enum IPROPNAME_OUTOFDISKSPACE = "OutOfDiskSpace";
enum IPROPNAME_OUTOFNORBDISKSPACE = "OutOfNoRbDiskSpace";
enum IPROPNAME_COSTINGCOMPLETE = "CostingComplete";
enum IPROPNAME_SOURCEDIR = "SourceDir";
enum IPROPNAME_REPLACEDINUSEFILES = "ReplacedInUseFiles";
enum IPROPNAME_PRIMARYFOLDER_PATH = "PrimaryVolumePath";
enum IPROPNAME_PRIMARYFOLDER_SPACEAVAILABLE = "PrimaryVolumeSpaceAvailable";
enum IPROPNAME_PRIMARYFOLDER_SPACEREQUIRED = "PrimaryVolumeSpaceRequired";
enum IPROPNAME_PRIMARYFOLDER_SPACEREMAINING = "PrimaryVolumeSpaceRemaining";
enum IPROPNAME_ISADMINPACKAGE = "IsAdminPackage";
enum IPROPNAME_ROLLBACKDISABLED = "RollbackDisabled";
enum IPROPNAME_RESTRICTEDUSERCONTROL = "RestrictedUserControl";
enum IPROPNAME_SOURCERESONLY = "MsiUISourceResOnly";
enum IPROPNAME_HIDECANCEL = "MsiUIHideCancel";
enum IPROPNAME_PROGRESSONLY = "MsiUIProgressOnly";
enum IPROPNAME_UACONLY = "MsiUIUACOnly";
enum IPROPNAME_TIME = "Time";
enum IPROPNAME_DATE = "Date";
enum IPROPNAME_DATETIME = "DateTime";
enum IPROPNAME_ARM = "Arm";
enum IPROPNAME_ARM64 = "Arm64";
enum IPROPNAME_INTEL = "Intel";
enum IPROPNAME_TEMPLATE_AMD64 = "AMD64";
enum IPROPNAME_TEMPLATE_X64 = "x64";
enum IPROPNAME_MSIAMD64 = "MsiAMD64";
enum IPROPNAME_MSIX64 = "Msix64";
enum IPROPNAME_INTEL64 = "Intel64";
enum IPROPNAME_IA64 = "IA64";
enum IPROPNAME_TEXTHEIGHT = "TextHeight";
enum IPROPNAME_TEXTINTERNALLEADING = "TextInternalLeading";
enum IPROPNAME_SCREENX = "ScreenX";
enum IPROPNAME_SCREENY = "ScreenY";
enum IPROPNAME_CAPTIONHEIGHT = "CaptionHeight";
enum IPROPNAME_BORDERTOP = "BorderTop";
enum IPROPNAME_BORDERSIDE = "BorderSide";
enum IPROPNAME_COLORBITS = "ColorBits";
enum IPROPNAME_PHYSICALMEMORY = "PhysicalMemory";
enum IPROPNAME_VIRTUALMEMORY = "VirtualMemory";
enum IPROPNAME_TEXTHEIGHT_CORRECTION = "TextHeightCorrection";
enum IPROPNAME_MSITABLETPC = "MsiTabletPC";
enum IPROPNAME_VERSIONNT = "VersionNT";
enum IPROPNAME_VERSION9X = "Version9X";
enum IPROPNAME_VERSIONNT64 = "VersionNT64";
enum IPROPNAME_WINDOWSBUILD = "WindowsBuild";
enum IPROPNAME_SERVICEPACKLEVEL = "ServicePackLevel";
enum IPROPNAME_SERVICEPACKLEVELMINOR = "ServicePackLevelMinor";
enum IPROPNAME_SHAREDWINDOWS = "SharedWindows";
enum IPROPNAME_COMPUTERNAME = "ComputerName";
enum IPROPNAME_SHELLADVTSUPPORT = "ShellAdvtSupport";
enum IPROPNAME_OLEADVTSUPPORT = "OLEAdvtSupport";
enum IPROPNAME_SYSTEMLANGUAGEID = "SystemLanguageID";
enum IPROPNAME_TTCSUPPORT = "TTCSupport";
enum IPROPNAME_TERMSERVER = "TerminalServer";
enum IPROPNAME_REMOTEADMINTS = "RemoteAdminTS";
enum IPROPNAME_REDIRECTEDDLLSUPPORT = "RedirectedDllSupport";
enum IPROPNAME_NTPRODUCTTYPE = "MsiNTProductType";
enum IPROPNAME_NTSUITEBACKOFFICE = "MsiNTSuiteBackOffice";
enum IPROPNAME_NTSUITEDATACENTER = "MsiNTSuiteDataCenter";
enum IPROPNAME_NTSUITEENTERPRISE = "MsiNTSuiteEnterprise";
enum IPROPNAME_NTSUITESMALLBUSINESS = "MsiNTSuiteSmallBusiness";
enum IPROPNAME_NTSUITESMALLBUSINESSRESTRICTED = "MsiNTSuiteSmallBusinessRestricted";
enum IPROPNAME_NTSUITEPERSONAL = "MsiNTSuitePersonal";
enum IPROPNAME_NTSUITEWEBSERVER = "MsiNTSuiteWebServer";
enum IPROPNAME_NETASSEMBLYSUPPORT = "MsiNetAssemblySupport";
enum IPROPNAME_WIN32ASSEMBLYSUPPORT = "MsiWin32AssemblySupport";
enum IPROPNAME_LOGONUSER = "LogonUser";
enum IPROPNAME_USERSID = "UserSID";
enum IPROPNAME_ADMINUSER = "AdminUser";
enum IPROPNAME_USERLANGUAGEID = "UserLanguageID";
enum IPROPNAME_PRIVILEGED = "Privileged";
enum IPROPNAME_RUNNINGELEVATED = "MsiRunningElevated";
enum IPROPNAME_TRUEADMINUSER = "MsiTrueAdminUser";
enum IPROPNAME_WINDOWS_FOLDER = "WindowsFolder";
enum IPROPNAME_SYSTEM_FOLDER = "SystemFolder";
enum IPROPNAME_SYSTEM16_FOLDER = "System16Folder";
enum IPROPNAME_WINDOWS_VOLUME = "WindowsVolume";
enum IPROPNAME_TEMP_FOLDER = "TempFolder";
enum IPROPNAME_PROGRAMFILES_FOLDER = "ProgramFilesFolder";
enum IPROPNAME_COMMONFILES_FOLDER = "CommonFilesFolder";
enum IPROPNAME_SYSTEM64_FOLDER = "System64Folder";
enum IPROPNAME_PROGRAMFILES64_FOLDER = "ProgramFiles64Folder";
enum IPROPNAME_COMMONFILES64_FOLDER = "CommonFiles64Folder";
enum IPROPNAME_STARTMENU_FOLDER = "StartMenuFolder";
enum IPROPNAME_PROGRAMMENU_FOLDER = "ProgramMenuFolder";
enum IPROPNAME_STARTUP_FOLDER = "StartupFolder";
enum IPROPNAME_NETHOOD_FOLDER = "NetHoodFolder";
enum IPROPNAME_PERSONAL_FOLDER = "PersonalFolder";
enum IPROPNAME_SENDTO_FOLDER = "SendToFolder";
enum IPROPNAME_DESKTOP_FOLDER = "DesktopFolder";
enum IPROPNAME_TEMPLATE_FOLDER = "TemplateFolder";
enum IPROPNAME_FONTS_FOLDER = "FontsFolder";
enum IPROPNAME_FAVORITES_FOLDER = "FavoritesFolder";
enum IPROPNAME_RECENT_FOLDER = "RecentFolder";
enum IPROPNAME_APPDATA_FOLDER = "AppDataFolder";
enum IPROPNAME_PRINTHOOD_FOLDER = "PrintHoodFolder";
enum IPROPNAME_ADMINTOOLS_FOLDER = "AdminToolsFolder";
enum IPROPNAME_COMMONAPPDATA_FOLDER = "CommonAppDataFolder";
enum IPROPNAME_LOCALAPPDATA_FOLDER = "LocalAppDataFolder";
enum IPROPNAME_MYPICTURES_FOLDER = "MyPicturesFolder";
enum IPROPNAME_FEATUREADDLOCAL = "ADDLOCAL";
enum IPROPNAME_FEATUREADDSOURCE = "ADDSOURCE";
enum IPROPNAME_FEATUREADDDEFAULT = "ADDDEFAULT";
enum IPROPNAME_FEATUREREMOVE = "REMOVE";
enum IPROPNAME_FEATUREADVERTISE = "ADVERTISE";
enum IPROPVALUE_FEATURE_ALL = "ALL";
enum IPROPNAME_COMPONENTADDLOCAL = "COMPADDLOCAL";
enum IPROPNAME_COMPONENTADDSOURCE = "COMPADDSOURCE";
enum IPROPNAME_COMPONENTADDDEFAULT = "COMPADDDEFAULT";
enum IPROPNAME_FILEADDLOCAL = "FILEADDLOCAL";
enum IPROPNAME_FILEADDSOURCE = "FILEADDSOURCE";
enum IPROPNAME_FILEADDDEFAULT = "FILEADDDEFAULT";
enum IPROPNAME_REINSTALL = "REINSTALL";
enum IPROPNAME_REINSTALLMODE = "REINSTALLMODE";
enum IPROPNAME_PROMPTROLLBACKCOST = "PROMPTROLLBACKCOST";
enum IPROPVALUE_RBCOST_PROMPT = "P";
enum IPROPVALUE_RBCOST_SILENT = "D";
enum IPROPVALUE_RBCOST_FAIL = "F";
enum IPROPNAME_CUSTOMACTIONDATA = "CustomActionData";
enum IACTIONNAME_INSTALL = "INSTALL";
enum IACTIONNAME_ADVERTISE = "ADVERTISE";
enum IACTIONNAME_ADMIN = "ADMIN";
enum IACTIONNAME_SEQUENCE = "SEQUENCE";
enum IACTIONNAME_COLLECTUSERINFO = "CollectUserInfo";
enum IACTIONNAME_FIRSTRUN = "FirstRun";
enum PID_TITLE = 0x00000002;
enum PID_SUBJECT = 0x00000003;
enum PID_AUTHOR = 0x00000004;
enum PID_KEYWORDS = 0x00000005;
enum PID_COMMENTS = 0x00000006;
enum PID_TEMPLATE = 0x00000007;
enum PID_LASTAUTHOR = 0x00000008;
enum PID_REVNUMBER = 0x00000009;
enum PID_EDITTIME = 0x0000000a;
enum PID_LASTPRINTED = 0x0000000b;
enum PID_CREATE_DTM = 0x0000000c;
enum PID_LASTSAVE_DTM = 0x0000000d;
enum PID_PAGECOUNT = 0x0000000e;
enum PID_WORDCOUNT = 0x0000000f;
enum PID_CHARCOUNT = 0x00000010;
enum PID_THUMBNAIL = 0x00000011;
enum PID_APPNAME = 0x00000012;
enum PID_MSIVERSION = 0x0000000e;
enum PID_MSISOURCE = 0x0000000f;
enum PID_MSIRESTRICT = 0x00000010;
enum PATCH_OPTION_USE_BEST = 0x00000000;
enum PATCH_OPTION_USE_LZX_BEST = 0x00000003;
enum PATCH_OPTION_USE_LZX_A = 0x00000001;
enum PATCH_OPTION_USE_LZX_B = 0x00000002;
enum PATCH_OPTION_USE_LZX_LARGE = 0x00000004;
enum PATCH_OPTION_NO_BINDFIX = 0x00010000;
enum PATCH_OPTION_NO_LOCKFIX = 0x00020000;
enum PATCH_OPTION_NO_REBASE = 0x00040000;
enum PATCH_OPTION_FAIL_IF_SAME_FILE = 0x00080000;
enum PATCH_OPTION_FAIL_IF_BIGGER = 0x00100000;
enum PATCH_OPTION_NO_CHECKSUM = 0x00200000;
enum PATCH_OPTION_NO_RESTIMEFIX = 0x00400000;
enum PATCH_OPTION_NO_TIMESTAMP = 0x00800000;
enum PATCH_OPTION_SIGNATURE_MD5 = 0x01000000;
enum PATCH_OPTION_INTERLEAVE_FILES = 0x40000000;
enum PATCH_OPTION_RESERVED1 = 0x80000000;
enum PATCH_OPTION_VALID_FLAGS = 0xc0ff0007;
enum PATCH_SYMBOL_NO_IMAGEHLP = 0x00000001;
enum PATCH_SYMBOL_NO_FAILURES = 0x00000002;
enum PATCH_SYMBOL_UNDECORATED_TOO = 0x00000004;
enum PATCH_SYMBOL_RESERVED1 = 0x80000000;
enum PATCH_TRANSFORM_PE_RESOURCE_2 = 0x00000100;
enum PATCH_TRANSFORM_PE_IRELOC_2 = 0x00000200;
enum APPLY_OPTION_FAIL_IF_EXACT = 0x00000001;
enum APPLY_OPTION_FAIL_IF_CLOSE = 0x00000002;
enum APPLY_OPTION_TEST_ONLY = 0x00000004;
enum APPLY_OPTION_VALID_FLAGS = 0x00000007;
enum ERROR_PATCH_ENCODE_FAILURE = 0xc00e3101;
enum ERROR_PATCH_INVALID_OPTIONS = 0xc00e3102;
enum ERROR_PATCH_SAME_FILE = 0xc00e3103;
enum ERROR_PATCH_RETAIN_RANGES_DIFFER = 0xc00e3104;
enum ERROR_PATCH_BIGGER_THAN_COMPRESSED = 0xc00e3105;
enum ERROR_PATCH_IMAGEHLP_FAILURE = 0xc00e3106;
enum ERROR_PATCH_DECODE_FAILURE = 0xc00e4101;
enum ERROR_PATCH_CORRUPT = 0xc00e4102;
enum ERROR_PATCH_NEWER_FORMAT = 0xc00e4103;
enum ERROR_PATCH_WRONG_FILE = 0xc00e4104;
enum ERROR_PATCH_NOT_NECESSARY = 0xc00e4105;
enum ERROR_PATCH_NOT_AVAILABLE = 0xc00e4106;
enum ERROR_PCW_BASE = 0xc00e5101;
enum ERROR_PCW_PCP_DOESNT_EXIST = 0xc00e5101;
enum ERROR_PCW_PCP_BAD_FORMAT = 0xc00e5102;
enum ERROR_PCW_CANT_CREATE_TEMP_FOLDER = 0xc00e5103;
enum ERROR_PCW_MISSING_PATCH_PATH = 0xc00e5104;
enum ERROR_PCW_CANT_OVERWRITE_PATCH = 0xc00e5105;
enum ERROR_PCW_CANT_CREATE_PATCH_FILE = 0xc00e5106;
enum ERROR_PCW_MISSING_PATCH_GUID = 0xc00e5107;
enum ERROR_PCW_BAD_PATCH_GUID = 0xc00e5108;
enum ERROR_PCW_BAD_GUIDS_TO_REPLACE = 0xc00e5109;
enum ERROR_PCW_BAD_TARGET_PRODUCT_CODE_LIST = 0xc00e510a;
enum ERROR_PCW_NO_UPGRADED_IMAGES_TO_PATCH = 0xc00e510b;
enum ERROR_PCW_BAD_API_PATCHING_SYMBOL_FLAGS = 0xc00e510d;
enum ERROR_PCW_OODS_COPYING_MSI = 0xc00e510e;
enum ERROR_PCW_UPGRADED_IMAGE_NAME_TOO_LONG = 0xc00e510f;
enum ERROR_PCW_BAD_UPGRADED_IMAGE_NAME = 0xc00e5110;
enum ERROR_PCW_DUP_UPGRADED_IMAGE_NAME = 0xc00e5111;
enum ERROR_PCW_UPGRADED_IMAGE_PATH_TOO_LONG = 0xc00e5112;
enum ERROR_PCW_UPGRADED_IMAGE_PATH_EMPTY = 0xc00e5113;
enum ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_EXIST = 0xc00e5114;
enum ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_MSI = 0xc00e5115;
enum ERROR_PCW_UPGRADED_IMAGE_COMPRESSED = 0xc00e5116;
enum ERROR_PCW_TARGET_IMAGE_NAME_TOO_LONG = 0xc00e5117;
enum ERROR_PCW_BAD_TARGET_IMAGE_NAME = 0xc00e5118;
enum ERROR_PCW_DUP_TARGET_IMAGE_NAME = 0xc00e5119;
enum ERROR_PCW_TARGET_IMAGE_PATH_TOO_LONG = 0xc00e511a;
enum ERROR_PCW_TARGET_IMAGE_PATH_EMPTY = 0xc00e511b;
enum ERROR_PCW_TARGET_IMAGE_PATH_NOT_EXIST = 0xc00e511c;
enum ERROR_PCW_TARGET_IMAGE_PATH_NOT_MSI = 0xc00e511d;
enum ERROR_PCW_TARGET_IMAGE_COMPRESSED = 0xc00e511e;
enum ERROR_PCW_TARGET_BAD_PROD_VALIDATE = 0xc00e511f;
enum ERROR_PCW_TARGET_BAD_PROD_CODE_VAL = 0xc00e5120;
enum ERROR_PCW_UPGRADED_MISSING_SRC_FILES = 0xc00e5121;
enum ERROR_PCW_TARGET_MISSING_SRC_FILES = 0xc00e5122;
enum ERROR_PCW_IMAGE_FAMILY_NAME_TOO_LONG = 0xc00e5123;
enum ERROR_PCW_BAD_IMAGE_FAMILY_NAME = 0xc00e5124;
enum ERROR_PCW_DUP_IMAGE_FAMILY_NAME = 0xc00e5125;
enum ERROR_PCW_BAD_IMAGE_FAMILY_SRC_PROP = 0xc00e5126;
enum ERROR_PCW_UFILEDATA_LONG_FILE_TABLE_KEY = 0xc00e5127;
enum ERROR_PCW_UFILEDATA_BLANK_FILE_TABLE_KEY = 0xc00e5128;
enum ERROR_PCW_UFILEDATA_MISSING_FILE_TABLE_KEY = 0xc00e5129;
enum ERROR_PCW_EXTFILE_LONG_FILE_TABLE_KEY = 0xc00e512a;
enum ERROR_PCW_EXTFILE_BLANK_FILE_TABLE_KEY = 0xc00e512b;
enum ERROR_PCW_EXTFILE_BAD_FAMILY_FIELD = 0xc00e512c;
enum ERROR_PCW_EXTFILE_LONG_PATH_TO_FILE = 0xc00e512d;
enum ERROR_PCW_EXTFILE_BLANK_PATH_TO_FILE = 0xc00e512e;
enum ERROR_PCW_EXTFILE_MISSING_FILE = 0xc00e512f;
enum ERROR_PCW_BAD_FILE_SEQUENCE_START = 0xc00e513a;
enum ERROR_PCW_CANT_COPY_FILE_TO_TEMP_FOLDER = 0xc00e513b;
enum ERROR_PCW_CANT_CREATE_ONE_PATCH_FILE = 0xc00e513c;
enum ERROR_PCW_BAD_IMAGE_FAMILY_DISKID = 0xc00e513d;
enum ERROR_PCW_BAD_IMAGE_FAMILY_FILESEQSTART = 0xc00e513e;
enum ERROR_PCW_BAD_UPGRADED_IMAGE_FAMILY = 0xc00e513f;
enum ERROR_PCW_BAD_TARGET_IMAGE_UPGRADED = 0xc00e5140;
enum ERROR_PCW_DUP_TARGET_IMAGE_PACKCODE = 0xc00e5141;
enum ERROR_PCW_UFILEDATA_BAD_UPGRADED_FIELD = 0xc00e5142;
enum ERROR_PCW_MISMATCHED_PRODUCT_CODES = 0xc00e5143;
enum ERROR_PCW_MISMATCHED_PRODUCT_VERSIONS = 0xc00e5144;
enum ERROR_PCW_CANNOT_WRITE_DDF = 0xc00e5145;
enum ERROR_PCW_CANNOT_RUN_MAKECAB = 0xc00e5146;
enum ERROR_PCW_WRITE_SUMMARY_PROPERTIES = 0xc00e514b;
enum ERROR_PCW_TFILEDATA_LONG_FILE_TABLE_KEY = 0xc00e514c;
enum ERROR_PCW_TFILEDATA_BLANK_FILE_TABLE_KEY = 0xc00e514d;
enum ERROR_PCW_TFILEDATA_MISSING_FILE_TABLE_KEY = 0xc00e514e;
enum ERROR_PCW_TFILEDATA_BAD_TARGET_FIELD = 0xc00e514f;
enum ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_TOO_LONG = 0xc00e5150;
enum ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_EXIST = 0xc00e5151;
enum ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_MSI = 0xc00e5152;
enum ERROR_PCW_DUP_UPGRADED_IMAGE_PACKCODE = 0xc00e5153;
enum ERROR_PCW_UFILEIGNORE_BAD_UPGRADED_FIELD = 0xc00e5154;
enum ERROR_PCW_UFILEIGNORE_LONG_FILE_TABLE_KEY = 0xc00e5155;
enum ERROR_PCW_UFILEIGNORE_BLANK_FILE_TABLE_KEY = 0xc00e5156;
enum ERROR_PCW_UFILEIGNORE_BAD_FILE_TABLE_KEY = 0xc00e5157;
enum ERROR_PCW_FAMILY_RANGE_NAME_TOO_LONG = 0xc00e5158;
enum ERROR_PCW_BAD_FAMILY_RANGE_NAME = 0xc00e5159;
enum ERROR_PCW_FAMILY_RANGE_LONG_FILE_TABLE_KEY = 0xc00e515a;
enum ERROR_PCW_FAMILY_RANGE_BLANK_FILE_TABLE_KEY = 0xc00e515b;
enum ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_OFFSETS = 0xc00e515c;
enum ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_OFFSETS = 0xc00e515d;
enum ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_OFFSETS = 0xc00e515e;
enum ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_LENGTHS = 0xc00e515f;
enum ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_LENGTHS = 0xc00e5160;
enum ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_LENGTHS = 0xc00e5161;
enum ERROR_PCW_FAMILY_RANGE_COUNT_MISMATCH = 0xc00e5162;
enum ERROR_PCW_EXTFILE_LONG_IGNORE_OFFSETS = 0xc00e5163;
enum ERROR_PCW_EXTFILE_BAD_IGNORE_OFFSETS = 0xc00e5164;
enum ERROR_PCW_EXTFILE_LONG_IGNORE_LENGTHS = 0xc00e5165;
enum ERROR_PCW_EXTFILE_BAD_IGNORE_LENGTHS = 0xc00e5166;
enum ERROR_PCW_EXTFILE_IGNORE_COUNT_MISMATCH = 0xc00e5167;
enum ERROR_PCW_EXTFILE_LONG_RETAIN_OFFSETS = 0xc00e5168;
enum ERROR_PCW_EXTFILE_BAD_RETAIN_OFFSETS = 0xc00e5169;
enum ERROR_PCW_TFILEDATA_LONG_IGNORE_OFFSETS = 0xc00e516b;
enum ERROR_PCW_TFILEDATA_BAD_IGNORE_OFFSETS = 0xc00e516c;
enum ERROR_PCW_TFILEDATA_LONG_IGNORE_LENGTHS = 0xc00e516d;
enum ERROR_PCW_TFILEDATA_BAD_IGNORE_LENGTHS = 0xc00e516e;
enum ERROR_PCW_TFILEDATA_IGNORE_COUNT_MISMATCH = 0xc00e516f;
enum ERROR_PCW_TFILEDATA_LONG_RETAIN_OFFSETS = 0xc00e5170;
enum ERROR_PCW_TFILEDATA_BAD_RETAIN_OFFSETS = 0xc00e5171;
enum ERROR_PCW_CANT_GENERATE_TRANSFORM = 0xc00e5173;
enum ERROR_PCW_CANT_CREATE_SUMMARY_INFO = 0xc00e5174;
enum ERROR_PCW_CANT_GENERATE_TRANSFORM_POUND = 0xc00e5175;
enum ERROR_PCW_CANT_CREATE_SUMMARY_INFO_POUND = 0xc00e5176;
enum ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_CODE = 0xc00e5177;
enum ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_VERSION = 0xc00e5178;
enum ERROR_PCW_BAD_UPGRADED_IMAGE_UPGRADE_CODE = 0xc00e5179;
enum ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_CODE = 0xc00e517a;
enum ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_VERSION = 0xc00e517b;
enum ERROR_PCW_BAD_TARGET_IMAGE_UPGRADE_CODE = 0xc00e517c;
enum ERROR_PCW_MATCHED_PRODUCT_VERSIONS = 0xc00e517d;
enum ERROR_PCW_OBSOLETION_WITH_SEQUENCE_DATA = 0xc00e517e;
enum ERROR_PCW_OBSOLETION_WITH_MSI30 = 0xc00e517f;
enum ERROR_PCW_OBSOLETION_WITH_PATCHSEQUENCE = 0xc00e5180;
enum ERROR_PCW_CANNOT_CREATE_TABLE = 0xc00e5181;
enum ERROR_PCW_CANT_GENERATE_SEQUENCEINFO_MAJORUPGD = 0xc00e5182;
enum ERROR_PCW_MAJOR_UPGD_WITHOUT_SEQUENCING = 0xc00e5183;
enum ERROR_PCW_BAD_PRODUCTVERSION_VALIDATION = 0xc00e5184;
enum ERROR_PCW_BAD_TRANSFORMSET = 0xc00e5185;
enum ERROR_PCW_BAD_TGT_UPD_IMAGES = 0xc00e5186;
enum ERROR_PCW_BAD_SUPERCEDENCE = 0xc00e5187;
enum ERROR_PCW_BAD_SEQUENCE = 0xc00e5188;
enum ERROR_PCW_BAD_TARGET = 0xc00e5189;
enum ERROR_PCW_NULL_PATCHFAMILY = 0xc00e518a;
enum ERROR_PCW_NULL_SEQUENCE_NUMBER = 0xc00e518b;
enum ERROR_PCW_BAD_VERSION_STRING = 0xc00e518c;
enum ERROR_PCW_BAD_MAJOR_VERSION = 0xc00e518d;
enum ERROR_PCW_SEQUENCING_BAD_TARGET = 0xc00e518e;
enum ERROR_PCW_PATCHMETADATA_PROP_NOT_SET = 0xc00e518f;
enum ERROR_PCW_INVALID_PATCHMETADATA_PROP = 0xc00e5190;
enum ERROR_PCW_INVALID_SUPERCEDENCE = 0xc00e5191;
enum ERROR_PCW_DUPLICATE_SEQUENCE_RECORD = 0xc00e5192;
enum ERROR_PCW_WRONG_PATCHMETADATA_STRD_PROP = 0xc00e5193;
enum ERROR_PCW_INVALID_PARAMETER = 0xc00e5194;
enum ERROR_PCW_CREATEFILE_LOG_FAILED = 0xc00e5195;
enum ERROR_PCW_INVALID_LOG_LEVEL = 0xc00e5196;
enum ERROR_PCW_INVALID_UI_LEVEL = 0xc00e5197;
enum ERROR_PCW_ERROR_WRITING_TO_LOG = 0xc00e5198;
enum ERROR_PCW_OUT_OF_MEMORY = 0xc00e5199;
enum ERROR_PCW_UNKNOWN_ERROR = 0xc00e519a;
enum ERROR_PCW_UNKNOWN_INFO = 0xc00e519b;
enum ERROR_PCW_UNKNOWN_WARN = 0xc00e519c;
enum ERROR_PCW_OPEN_VIEW = 0xc00e519d;
enum ERROR_PCW_EXECUTE_VIEW = 0xc00e519e;
enum ERROR_PCW_VIEW_FETCH = 0xc00e519f;
enum ERROR_PCW_FAILED_EXPAND_PATH = 0xc00e51a0;
enum ERROR_PCW_INTERNAL_ERROR = 0xc00e5201;
enum ERROR_PCW_INVALID_PCP_PROPERTY = 0xc00e5202;
enum ERROR_PCW_INVALID_PCP_TARGETIMAGES = 0xc00e5203;
enum ERROR_PCW_LAX_VALIDATION_FLAGS = 0xc00e5204;
enum ERROR_PCW_FAILED_CREATE_TRANSFORM = 0xc00e5205;
enum ERROR_PCW_CANT_DELETE_TEMP_FOLDER = 0xc00e5206;
enum ERROR_PCW_MISSING_DIRECTORY_TABLE = 0xc00e5207;
enum ERROR_PCW_INVALID_SUPERSEDENCE_VALUE = 0xc00e5208;
enum ERROR_PCW_INVALID_PATCH_TYPE_SEQUENCING = 0xc00e5209;
enum ERROR_PCW_CANT_READ_FILE = 0xc00e520a;
enum ERROR_PCW_TARGET_WRONG_PRODUCT_VERSION_COMP = 0xc00e520b;
enum ERROR_PCW_INVALID_PCP_UPGRADEDFILESTOIGNORE = 0xc00e520c;
enum ERROR_PCW_INVALID_PCP_UPGRADEDIMAGES = 0xc00e520d;
enum ERROR_PCW_INVALID_PCP_EXTERNALFILES = 0xc00e520e;
enum ERROR_PCW_INVALID_PCP_IMAGEFAMILIES = 0xc00e520f;
enum ERROR_PCW_INVALID_PCP_PATCHSEQUENCE = 0xc00e5210;
enum ERROR_PCW_INVALID_PCP_TARGETFILES_OPTIONALDATA = 0xc00e5211;
enum ERROR_PCW_INVALID_PCP_UPGRADEDFILES_OPTIONALDATA = 0xc00e5212;
enum ERROR_PCW_MISSING_PATCHMETADATA = 0xc00e5213;
enum ERROR_PCW_IMAGE_PATH_NOT_EXIST = 0xc00e5214;
enum ERROR_PCW_INVALID_RANGE_ELEMENT = 0xc00e5215;
enum ERROR_PCW_INVALID_MAJOR_VERSION = 0xc00e5216;
enum ERROR_PCW_INVALID_PCP_PROPERTIES = 0xc00e5217;
enum ERROR_PCW_INVALID_PCP_FAMILYFILERANGES = 0xc00e5218;
enum INFO_BASE = 0xc00f5101;
enum INFO_PASSED_MAIN_CONTROL = 0xc00f5101;
enum INFO_ENTERING_PHASE_I_VALIDATION = 0xc00f5102;
enum INFO_ENTERING_PHASE_I = 0xc00f5103;
enum INFO_PCP_PATH = 0xc00f5104;
enum INFO_TEMP_DIR = 0xc00f5105;
enum INFO_SET_OPTIONS = 0xc00f5106;
enum INFO_PROPERTY = 0xc00f5107;
enum INFO_ENTERING_PHASE_II = 0xc00f5108;
enum INFO_ENTERING_PHASE_III = 0xc00f5109;
enum INFO_ENTERING_PHASE_IV = 0xc00f510a;
enum INFO_ENTERING_PHASE_V = 0xc00f510b;
enum INFO_GENERATING_METADATA = 0xc00f5111;
enum INFO_TEMP_DIR_CLEANUP = 0xc00f5112;
enum INFO_PATCHCACHE_FILEINFO_FAILURE = 0xc00f5113;
enum INFO_PATCHCACHE_PCI_READFAILURE = 0xc00f5114;
enum INFO_PATCHCACHE_PCI_WRITEFAILURE = 0xc00f5115;
enum INFO_USING_USER_MSI_FOR_PATCH_TABLES = 0xc00f5116;
enum INFO_SUCCESSFUL_PATCH_CREATION = 0xc00f5117;
enum WARN_BASE = 0xc0105101;
enum WARN_MAJOR_UPGRADE_PATCH = 0xc0105101;
enum WARN_SEQUENCE_DATA_GENERATION_DISABLED = 0xc0105102;
enum WARN_SEQUENCE_DATA_SUPERSEDENCE_IGNORED = 0xc0105103;
enum WARN_IMPROPER_TRANSFORM_VALIDATION = 0xc0105104;
enum WARN_PCW_MISMATCHED_PRODUCT_CODES = 0xc0105105;
enum WARN_PCW_MISMATCHED_PRODUCT_VERSIONS = 0xc0105106;
enum WARN_INVALID_TRANSFORM_VALIDATION = 0xc0105107;
enum WARN_BAD_MAJOR_VERSION = 0xc0105108;
enum WARN_FILE_VERSION_DOWNREV = 0xc0105109;
enum WARN_EQUAL_FILE_VERSION = 0xc010510a;
enum WARN_PATCHPROPERTYNOTSET = 0xc010510b;
enum WARN_OBSOLETION_WITH_SEQUENCE_DATA = 0xc0105112;
enum WARN_OBSOLETION_WITH_MSI30 = 0xc0105111;
enum WARN_OBSOLETION_WITH_PATCHSEQUENCE = 0xc0105113;
enum DELTA_MAX_HASH_SIZE = 0x00000020;
enum cchMaxInteger = 0x0000000c;
enum LOGNONE = 0x00000000;
enum LOGINFO = 0x00000001;
enum LOGWARN = 0x00000002;
enum LOGERR = 0x00000004;
enum LOGPERFMESSAGES = 0x00000008;
enum LOGALL = 0x0000000f;
enum UINONE = 0x00000000;
enum UILOGBITS = 0x0000000f;
enum DEFAULT_MINIMUM_REQUIRED_MSI_VERSION = 0x00000064;
enum DEFAULT_FILE_SEQUENCE_START = 0x00000002;
enum DEFAULT_DISK_ID = 0x00000002;
alias MSIASSEMBLYINFO = uint;
enum : uint
{
    MSIASSEMBLYINFO_NETASSEMBLY   = 0x00000000,
    MSIASSEMBLYINFO_WIN32ASSEMBLY = 0x00000001,
}

alias IASSEMBLYCACHE_UNINSTALL_DISPOSITION = uint;
enum : uint
{
    IASSEMBLYCACHE_UNINSTALL_DISPOSITION_UNINSTALLED         = 0x00000001,
    IASSEMBLYCACHE_UNINSTALL_DISPOSITION_STILL_IN_USE        = 0x00000002,
    IASSEMBLYCACHE_UNINSTALL_DISPOSITION_ALREADY_UNINSTALLED = 0x00000003,
    IASSEMBLYCACHE_UNINSTALL_DISPOSITION_DELETE_PENDING      = 0x00000004,
}

alias QUERYASMINFO_FLAGS = uint;
enum : uint
{
    QUERYASMINFO_FLAG_VALIDATE = 0x00000001,
}

alias MSIHANDLE = uint;
alias RESULTTYPES = int;
enum : int
{
    ieUnknown = 0x00000000,
    ieError   = 0x00000001,
    ieWarning = 0x00000002,
    ieInfo    = 0x00000003,
}

alias STATUSTYPES = int;
enum : int
{
    ieStatusGetCUB       = 0x00000000,
    ieStatusICECount     = 0x00000001,
    ieStatusMerge        = 0x00000002,
    ieStatusSummaryInfo  = 0x00000003,
    ieStatusCreateEngine = 0x00000004,
    ieStatusStarting     = 0x00000005,
    ieStatusRunICE       = 0x00000006,
    ieStatusShutdown     = 0x00000007,
    ieStatusSuccess      = 0x00000008,
    ieStatusFail         = 0x00000009,
    ieStatusCancel       = 0x0000000a,
}

alias LPDISPLAYVAL = BOOL function(void*, RESULTTYPES, const(wchar)*, const(wchar)*, const(wchar)*);
alias LPEVALCOMCALLBACK = BOOL function(STATUSTYPES, const(wchar)*, void*);
enum IID_IValidate = GUID(0xe482e5c6, 0xe31e, 0x4143, [0xa2, 0xe6, 0xdb, 0xc3, 0xd8, 0xe4, 0xb8, 0xd3]);
interface IValidate : IUnknown
{
    HRESULT OpenDatabase(const(wchar)*);
    HRESULT OpenCUB(const(wchar)*);
    HRESULT CloseDatabase();
    HRESULT CloseCUB();
    HRESULT SetDisplay(LPDISPLAYVAL, void*);
    HRESULT SetStatus(LPEVALCOMCALLBACK, void*);
    HRESULT Validate(const(wchar)*);
}
enum CLSID_MsmMerge = GUID(0xadda830, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
struct MsmMerge
{
}
alias msmErrorType = int;
enum : int
{
    msmErrorLanguageUnsupported = 0x00000001,
    msmErrorLanguageFailed      = 0x00000002,
    msmErrorExclusion           = 0x00000003,
    msmErrorTableMerge          = 0x00000004,
    msmErrorResequenceMerge     = 0x00000005,
    msmErrorFileCreate          = 0x00000006,
    msmErrorDirCreate           = 0x00000007,
    msmErrorFeatureRequired     = 0x00000008,
}

enum IID_IEnumMsmString = GUID(0xadda826, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IEnumMsmString : IUnknown
{
    HRESULT Next(uint, BSTR*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumMsmString*);
}
enum IID_IMsmStrings = GUID(0xadda827, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmStrings : IDispatch
{
    HRESULT get_Item(int, BSTR*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IMsmError = GUID(0xadda828, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmError : IDispatch
{
    HRESULT get_Type(msmErrorType*);
    HRESULT get_Path(BSTR*);
    HRESULT get_Language(short*);
    HRESULT get_DatabaseTable(BSTR*);
    HRESULT get_DatabaseKeys(IMsmStrings*);
    HRESULT get_ModuleTable(BSTR*);
    HRESULT get_ModuleKeys(IMsmStrings*);
}
enum IID_IEnumMsmError = GUID(0xadda829, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IEnumMsmError : IUnknown
{
    HRESULT Next(uint, IMsmError*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumMsmError*);
}
enum IID_IMsmErrors = GUID(0xadda82a, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmErrors : IDispatch
{
    HRESULT get_Item(int, IMsmError*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IMsmDependency = GUID(0xadda82b, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmDependency : IDispatch
{
    HRESULT get_Module(BSTR*);
    HRESULT get_Language(short*);
    HRESULT get_Version(BSTR*);
}
enum IID_IEnumMsmDependency = GUID(0xadda82c, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IEnumMsmDependency : IUnknown
{
    HRESULT Next(uint, IMsmDependency*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumMsmDependency*);
}
enum IID_IMsmDependencies = GUID(0xadda82d, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmDependencies : IDispatch
{
    HRESULT get_Item(int, IMsmDependency*);
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IMsmMerge = GUID(0xadda82e, 0x2c26, 0x11d2, [0xad, 0x65, 0x0, 0xa0, 0xc9, 0xaf, 0x11, 0xa6]);
interface IMsmMerge : IDispatch
{
    HRESULT OpenDatabase(const(BSTR));
    HRESULT OpenModule(const(BSTR), const(short));
    HRESULT CloseDatabase(const(short));
    HRESULT CloseModule();
    HRESULT OpenLog(const(BSTR));
    HRESULT CloseLog();
    HRESULT Log(const(BSTR));
    HRESULT get_Errors(IMsmErrors*);
    HRESULT get_Dependencies(IMsmDependencies*);
    HRESULT Merge(const(BSTR), const(BSTR));
    HRESULT Connect(const(BSTR));
    HRESULT ExtractCAB(const(BSTR));
    HRESULT ExtractFiles(const(BSTR));
}
enum IID_IMsmGetFiles = GUID(0x7041ae26, 0x2d78, 0x11d2, [0x88, 0x8a, 0x0, 0xa0, 0xc9, 0x81, 0xb0, 0x15]);
interface IMsmGetFiles : IDispatch
{
    HRESULT get_ModuleFiles(IMsmStrings*);
}
struct PMSIHANDLE
{
    MSIHANDLE m_h;
}
alias INSTALLMESSAGE = int;
enum : int
{
    INSTALLMESSAGE_FATALEXIT      = 0x00000000,
    INSTALLMESSAGE_ERROR          = 0x01000000,
    INSTALLMESSAGE_WARNING        = 0x02000000,
    INSTALLMESSAGE_USER           = 0x03000000,
    INSTALLMESSAGE_INFO           = 0x04000000,
    INSTALLMESSAGE_FILESINUSE     = 0x05000000,
    INSTALLMESSAGE_RESOLVESOURCE  = 0x06000000,
    INSTALLMESSAGE_OUTOFDISKSPACE = 0x07000000,
    INSTALLMESSAGE_ACTIONSTART    = 0x08000000,
    INSTALLMESSAGE_ACTIONDATA     = 0x09000000,
    INSTALLMESSAGE_PROGRESS       = 0x0a000000,
    INSTALLMESSAGE_COMMONDATA     = 0x0b000000,
    INSTALLMESSAGE_INITIALIZE     = 0x0c000000,
    INSTALLMESSAGE_TERMINATE      = 0x0d000000,
    INSTALLMESSAGE_SHOWDIALOG     = 0x0e000000,
    INSTALLMESSAGE_PERFORMANCE    = 0x0f000000,
    INSTALLMESSAGE_RMFILESINUSE   = 0x19000000,
    INSTALLMESSAGE_INSTALLSTART   = 0x1a000000,
    INSTALLMESSAGE_INSTALLEND     = 0x1b000000,
}

alias INSTALLUI_HANDLERA = int function(void*, uint, const(char)*);
alias INSTALLUI_HANDLERW = int function(void*, uint, const(wchar)*);
alias PINSTALLUI_HANDLER_RECORD = int function(void*, uint, MSIHANDLE);
alias INSTALLUILEVEL = int;
enum : int
{
    INSTALLUILEVEL_NOCHANGE      = 0x00000000,
    INSTALLUILEVEL_DEFAULT       = 0x00000001,
    INSTALLUILEVEL_NONE          = 0x00000002,
    INSTALLUILEVEL_BASIC         = 0x00000003,
    INSTALLUILEVEL_REDUCED       = 0x00000004,
    INSTALLUILEVEL_FULL          = 0x00000005,
    INSTALLUILEVEL_ENDDIALOG     = 0x00000080,
    INSTALLUILEVEL_PROGRESSONLY  = 0x00000040,
    INSTALLUILEVEL_HIDECANCEL    = 0x00000020,
    INSTALLUILEVEL_SOURCERESONLY = 0x00000100,
    INSTALLUILEVEL_UACONLY       = 0x00000200,
}

alias INSTALLSTATE = int;
enum : int
{
    INSTALLSTATE_NOTUSED      = 0xfffffff9,
    INSTALLSTATE_BADCONFIG    = 0xfffffffa,
    INSTALLSTATE_INCOMPLETE   = 0xfffffffb,
    INSTALLSTATE_SOURCEABSENT = 0xfffffffc,
    INSTALLSTATE_MOREDATA     = 0xfffffffd,
    INSTALLSTATE_INVALIDARG   = 0xfffffffe,
    INSTALLSTATE_UNKNOWN      = 0xffffffff,
    INSTALLSTATE_BROKEN       = 0x00000000,
    INSTALLSTATE_ADVERTISED   = 0x00000001,
    INSTALLSTATE_REMOVED      = 0x00000001,
    INSTALLSTATE_ABSENT       = 0x00000002,
    INSTALLSTATE_LOCAL        = 0x00000003,
    INSTALLSTATE_SOURCE       = 0x00000004,
    INSTALLSTATE_DEFAULT      = 0x00000005,
}

alias USERINFOSTATE = int;
enum : int
{
    USERINFOSTATE_MOREDATA   = 0xfffffffd,
    USERINFOSTATE_INVALIDARG = 0xfffffffe,
    USERINFOSTATE_UNKNOWN    = 0xffffffff,
    USERINFOSTATE_ABSENT     = 0x00000000,
    USERINFOSTATE_PRESENT    = 0x00000001,
}

alias INSTALLLEVEL = int;
enum : int
{
    INSTALLLEVEL_DEFAULT = 0x00000000,
    INSTALLLEVEL_MINIMUM = 0x00000001,
    INSTALLLEVEL_MAXIMUM = 0x0000ffff,
}

alias REINSTALLMODE = int;
enum : int
{
    REINSTALLMODE_REPAIR           = 0x00000001,
    REINSTALLMODE_FILEMISSING      = 0x00000002,
    REINSTALLMODE_FILEOLDERVERSION = 0x00000004,
    REINSTALLMODE_FILEEQUALVERSION = 0x00000008,
    REINSTALLMODE_FILEEXACT        = 0x00000010,
    REINSTALLMODE_FILEVERIFY       = 0x00000020,
    REINSTALLMODE_FILEREPLACE      = 0x00000040,
    REINSTALLMODE_MACHINEDATA      = 0x00000080,
    REINSTALLMODE_USERDATA         = 0x00000100,
    REINSTALLMODE_SHORTCUT         = 0x00000200,
    REINSTALLMODE_PACKAGE          = 0x00000400,
}

alias INSTALLOGMODE = int;
enum : int
{
    INSTALLLOGMODE_FATALEXIT      = 0x00000001,
    INSTALLLOGMODE_ERROR          = 0x00000002,
    INSTALLLOGMODE_WARNING        = 0x00000004,
    INSTALLLOGMODE_USER           = 0x00000008,
    INSTALLLOGMODE_INFO           = 0x00000010,
    INSTALLLOGMODE_RESOLVESOURCE  = 0x00000040,
    INSTALLLOGMODE_OUTOFDISKSPACE = 0x00000080,
    INSTALLLOGMODE_ACTIONSTART    = 0x00000100,
    INSTALLLOGMODE_ACTIONDATA     = 0x00000200,
    INSTALLLOGMODE_COMMONDATA     = 0x00000800,
    INSTALLLOGMODE_PROPERTYDUMP   = 0x00000400,
    INSTALLLOGMODE_VERBOSE        = 0x00001000,
    INSTALLLOGMODE_EXTRADEBUG     = 0x00002000,
    INSTALLLOGMODE_LOGONLYONERROR = 0x00004000,
    INSTALLLOGMODE_LOGPERFORMANCE = 0x00008000,
    INSTALLLOGMODE_PROGRESS       = 0x00000400,
    INSTALLLOGMODE_INITIALIZE     = 0x00001000,
    INSTALLLOGMODE_TERMINATE      = 0x00002000,
    INSTALLLOGMODE_SHOWDIALOG     = 0x00004000,
    INSTALLLOGMODE_FILESINUSE     = 0x00000020,
    INSTALLLOGMODE_RMFILESINUSE   = 0x02000000,
    INSTALLLOGMODE_INSTALLSTART   = 0x04000000,
    INSTALLLOGMODE_INSTALLEND     = 0x08000000,
}

alias INSTALLLOGATTRIBUTES = int;
enum : int
{
    INSTALLLOGATTRIBUTES_APPEND        = 0x00000001,
    INSTALLLOGATTRIBUTES_FLUSHEACHLINE = 0x00000002,
}

alias INSTALLFEATUREATTRIBUTE = int;
enum : int
{
    INSTALLFEATUREATTRIBUTE_FAVORLOCAL             = 0x00000001,
    INSTALLFEATUREATTRIBUTE_FAVORSOURCE            = 0x00000002,
    INSTALLFEATUREATTRIBUTE_FOLLOWPARENT           = 0x00000004,
    INSTALLFEATUREATTRIBUTE_FAVORADVERTISE         = 0x00000008,
    INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE      = 0x00000010,
    INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE = 0x00000020,
}

alias INSTALLMODE = int;
enum : int
{
    INSTALLMODE_NODETECTION_ANY    = 0xfffffffc,
    INSTALLMODE_NOSOURCERESOLUTION = 0xfffffffd,
    INSTALLMODE_NODETECTION        = 0xfffffffe,
    INSTALLMODE_EXISTING           = 0xffffffff,
    INSTALLMODE_DEFAULT            = 0x00000000,
}

alias MSIPATCHSTATE = int;
enum : int
{
    MSIPATCHSTATE_INVALID    = 0x00000000,
    MSIPATCHSTATE_APPLIED    = 0x00000001,
    MSIPATCHSTATE_SUPERSEDED = 0x00000002,
    MSIPATCHSTATE_OBSOLETED  = 0x00000004,
    MSIPATCHSTATE_REGISTERED = 0x00000008,
    MSIPATCHSTATE_ALL        = 0x0000000f,
}

alias MSIINSTALLCONTEXT = int;
enum : int
{
    MSIINSTALLCONTEXT_FIRSTVISIBLE   = 0x00000000,
    MSIINSTALLCONTEXT_NONE           = 0x00000000,
    MSIINSTALLCONTEXT_USERMANAGED    = 0x00000001,
    MSIINSTALLCONTEXT_USERUNMANAGED  = 0x00000002,
    MSIINSTALLCONTEXT_MACHINE        = 0x00000004,
    MSIINSTALLCONTEXT_ALL            = 0x00000007,
    MSIINSTALLCONTEXT_ALLUSERMANAGED = 0x00000008,
}

alias MSIPATCHDATATYPE = int;
enum : int
{
    MSIPATCH_DATATYPE_PATCHFILE = 0x00000000,
    MSIPATCH_DATATYPE_XMLPATH   = 0x00000001,
    MSIPATCH_DATATYPE_XMLBLOB   = 0x00000002,
}

struct MSIPATCHSEQUENCEINFOA
{
    const(char)* szPatchData;
    MSIPATCHDATATYPE ePatchDataType;
    uint dwOrder;
    uint uStatus;
}
struct MSIPATCHSEQUENCEINFOW
{
    const(wchar)* szPatchData;
    MSIPATCHDATATYPE ePatchDataType;
    uint dwOrder;
    uint uStatus;
}
alias SCRIPTFLAGS = int;
enum : int
{
    SCRIPTFLAGS_CACHEINFO                = 0x00000001,
    SCRIPTFLAGS_SHORTCUTS                = 0x00000004,
    SCRIPTFLAGS_MACHINEASSIGN            = 0x00000008,
    SCRIPTFLAGS_REGDATA_CNFGINFO         = 0x00000020,
    SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST = 0x00000040,
    SCRIPTFLAGS_REGDATA_CLASSINFO        = 0x00000080,
    SCRIPTFLAGS_REGDATA_EXTENSIONINFO    = 0x00000100,
    SCRIPTFLAGS_REGDATA_APPINFO          = 0x00000180,
    SCRIPTFLAGS_REGDATA                  = 0x000001a0,
}

alias ADVERTISEFLAGS = int;
enum : int
{
    ADVERTISEFLAGS_MACHINEASSIGN = 0x00000000,
    ADVERTISEFLAGS_USERASSIGN    = 0x00000001,
}

alias INSTALLTYPE = int;
enum : int
{
    INSTALLTYPE_DEFAULT         = 0x00000000,
    INSTALLTYPE_NETWORK_IMAGE   = 0x00000001,
    INSTALLTYPE_SINGLE_INSTANCE = 0x00000002,
}

struct MSIFILEHASHINFO
{
    uint dwFileHashInfoSize;
    uint[4] dwData;
}
alias MSIARCHITECTUREFLAGS = int;
enum : int
{
    MSIARCHITECTUREFLAGS_X86   = 0x00000001,
    MSIARCHITECTUREFLAGS_IA64  = 0x00000002,
    MSIARCHITECTUREFLAGS_AMD64 = 0x00000004,
    MSIARCHITECTUREFLAGS_ARM   = 0x00000008,
}

alias MSIOPENPACKAGEFLAGS = int;
enum : int
{
    MSIOPENPACKAGEFLAGS_IGNOREMACHINESTATE = 0x00000001,
}

alias MSIADVERTISEOPTIONFLAGS = int;
enum : int
{
    MSIADVERTISEOPTIONFLAGS_INSTANCE = 0x00000001,
}

alias MSISOURCETYPE = int;
enum : int
{
    MSISOURCETYPE_UNKNOWN = 0x00000000,
    MSISOURCETYPE_NETWORK = 0x00000001,
    MSISOURCETYPE_URL     = 0x00000002,
    MSISOURCETYPE_MEDIA   = 0x00000004,
}

alias MSICODE = int;
enum : int
{
    MSICODE_PRODUCT = 0x00000000,
    MSICODE_PATCH   = 0x40000000,
}

alias MSITRANSACTION = int;
enum : int
{
    MSITRANSACTION_CHAIN_EMBEDDEDUI         = 0x00000001,
    MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI = 0x00000002,
}

alias MSITRANSACTIONSTATE = uint;
enum : uint
{
    MSITRANSACTIONSTATE_ROLLBACK = 0x00000000,
    MSITRANSACTIONSTATE_COMMIT   = 0x00000001,
}

alias MSIDBSTATE = int;
enum : int
{
    MSIDBSTATE_ERROR = 0xffffffff,
    MSIDBSTATE_READ  = 0x00000000,
    MSIDBSTATE_WRITE = 0x00000001,
}

alias MSIMODIFY = int;
enum : int
{
    MSIMODIFY_SEEK             = 0xffffffff,
    MSIMODIFY_REFRESH          = 0x00000000,
    MSIMODIFY_INSERT           = 0x00000001,
    MSIMODIFY_UPDATE           = 0x00000002,
    MSIMODIFY_ASSIGN           = 0x00000003,
    MSIMODIFY_REPLACE          = 0x00000004,
    MSIMODIFY_MERGE            = 0x00000005,
    MSIMODIFY_DELETE           = 0x00000006,
    MSIMODIFY_INSERT_TEMPORARY = 0x00000007,
    MSIMODIFY_VALIDATE         = 0x00000008,
    MSIMODIFY_VALIDATE_NEW     = 0x00000009,
    MSIMODIFY_VALIDATE_FIELD   = 0x0000000a,
    MSIMODIFY_VALIDATE_DELETE  = 0x0000000b,
}

alias MSICOLINFO = int;
enum : int
{
    MSICOLINFO_NAMES = 0x00000000,
    MSICOLINFO_TYPES = 0x00000001,
}

alias MSICONDITION = int;
enum : int
{
    MSICONDITION_FALSE = 0x00000000,
    MSICONDITION_TRUE  = 0x00000001,
    MSICONDITION_NONE  = 0x00000002,
    MSICONDITION_ERROR = 0x00000003,
}

alias MSICOSTTREE = int;
enum : int
{
    MSICOSTTREE_SELFONLY = 0x00000000,
    MSICOSTTREE_CHILDREN = 0x00000001,
    MSICOSTTREE_PARENTS  = 0x00000002,
    MSICOSTTREE_RESERVED = 0x00000003,
}

alias MSIDBERROR = int;
enum : int
{
    MSIDBERROR_INVALIDARG        = 0xfffffffd,
    MSIDBERROR_MOREDATA          = 0xfffffffe,
    MSIDBERROR_FUNCTIONERROR     = 0xffffffff,
    MSIDBERROR_NOERROR           = 0x00000000,
    MSIDBERROR_DUPLICATEKEY      = 0x00000001,
    MSIDBERROR_REQUIRED          = 0x00000002,
    MSIDBERROR_BADLINK           = 0x00000003,
    MSIDBERROR_OVERFLOW          = 0x00000004,
    MSIDBERROR_UNDERFLOW         = 0x00000005,
    MSIDBERROR_NOTINSET          = 0x00000006,
    MSIDBERROR_BADVERSION        = 0x00000007,
    MSIDBERROR_BADCASE           = 0x00000008,
    MSIDBERROR_BADGUID           = 0x00000009,
    MSIDBERROR_BADWILDCARD       = 0x0000000a,
    MSIDBERROR_BADIDENTIFIER     = 0x0000000b,
    MSIDBERROR_BADLANGUAGE       = 0x0000000c,
    MSIDBERROR_BADFILENAME       = 0x0000000d,
    MSIDBERROR_BADPATH           = 0x0000000e,
    MSIDBERROR_BADCONDITION      = 0x0000000f,
    MSIDBERROR_BADFORMATTED      = 0x00000010,
    MSIDBERROR_BADTEMPLATE       = 0x00000011,
    MSIDBERROR_BADDEFAULTDIR     = 0x00000012,
    MSIDBERROR_BADREGPATH        = 0x00000013,
    MSIDBERROR_BADCUSTOMSOURCE   = 0x00000014,
    MSIDBERROR_BADPROPERTY       = 0x00000015,
    MSIDBERROR_MISSINGDATA       = 0x00000016,
    MSIDBERROR_BADCATEGORY       = 0x00000017,
    MSIDBERROR_BADKEYTABLE       = 0x00000018,
    MSIDBERROR_BADMAXMINVALUES   = 0x00000019,
    MSIDBERROR_BADCABINET        = 0x0000001a,
    MSIDBERROR_BADSHORTCUT       = 0x0000001b,
    MSIDBERROR_STRINGOVERFLOW    = 0x0000001c,
    MSIDBERROR_BADLOCALIZEATTRIB = 0x0000001d,
}

alias MSIRUNMODE = int;
enum : int
{
    MSIRUNMODE_ADMIN            = 0x00000000,
    MSIRUNMODE_ADVERTISE        = 0x00000001,
    MSIRUNMODE_MAINTENANCE      = 0x00000002,
    MSIRUNMODE_ROLLBACKENABLED  = 0x00000003,
    MSIRUNMODE_LOGENABLED       = 0x00000004,
    MSIRUNMODE_OPERATIONS       = 0x00000005,
    MSIRUNMODE_REBOOTATEND      = 0x00000006,
    MSIRUNMODE_REBOOTNOW        = 0x00000007,
    MSIRUNMODE_CABINET          = 0x00000008,
    MSIRUNMODE_SOURCESHORTNAMES = 0x00000009,
    MSIRUNMODE_TARGETSHORTNAMES = 0x0000000a,
    MSIRUNMODE_RESERVED11       = 0x0000000b,
    MSIRUNMODE_WINDOWS9X        = 0x0000000c,
    MSIRUNMODE_ZAWENABLED       = 0x0000000d,
    MSIRUNMODE_RESERVED14       = 0x0000000e,
    MSIRUNMODE_RESERVED15       = 0x0000000f,
    MSIRUNMODE_SCHEDULED        = 0x00000010,
    MSIRUNMODE_ROLLBACK         = 0x00000011,
    MSIRUNMODE_COMMIT           = 0x00000012,
}

alias MSITRANSFORM_ERROR = int;
enum : int
{
    MSITRANSFORM_ERROR_ADDEXISTINGROW   = 0x00000001,
    MSITRANSFORM_ERROR_DELMISSINGROW    = 0x00000002,
    MSITRANSFORM_ERROR_ADDEXISTINGTABLE = 0x00000004,
    MSITRANSFORM_ERROR_DELMISSINGTABLE  = 0x00000008,
    MSITRANSFORM_ERROR_UPDATEMISSINGROW = 0x00000010,
    MSITRANSFORM_ERROR_CHANGECODEPAGE   = 0x00000020,
    MSITRANSFORM_ERROR_VIEWTRANSFORM    = 0x00000100,
    MSITRANSFORM_ERROR_NONE             = 0x00000000,
}

alias MSITRANSFORM_VALIDATE = int;
enum : int
{
    MSITRANSFORM_VALIDATE_LANGUAGE                   = 0x00000001,
    MSITRANSFORM_VALIDATE_PRODUCT                    = 0x00000002,
    MSITRANSFORM_VALIDATE_PLATFORM                   = 0x00000004,
    MSITRANSFORM_VALIDATE_MAJORVERSION               = 0x00000008,
    MSITRANSFORM_VALIDATE_MINORVERSION               = 0x00000010,
    MSITRANSFORM_VALIDATE_UPDATEVERSION              = 0x00000020,
    MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION         = 0x00000040,
    MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION    = 0x00000080,
    MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION        = 0x00000100,
    MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION = 0x00000200,
    MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION      = 0x00000400,
    MSITRANSFORM_VALIDATE_UPGRADECODE                = 0x00000800,
}

struct ASSEMBLY_INFO
{
    uint cbAssemblyInfo;
    uint dwAssemblyFlags;
    ULARGE_INTEGER uliAssemblySizeInKB;
    PWSTR pszCurrentAssemblyPathBuf;
    uint cchBuf;
}
struct FUSION_INSTALL_REFERENCE
{
    uint cbSize;
    uint dwFlags;
    GUID guidScheme;
    const(wchar)* szIdentifier;
    const(wchar)* szNonCannonicalData;
}
alias ASM_NAME = int;
enum : int
{
    ASM_NAME_PUBLIC_KEY            = 0x00000000,
    ASM_NAME_PUBLIC_KEY_TOKEN      = 0x00000001,
    ASM_NAME_HASH_VALUE            = 0x00000002,
    ASM_NAME_NAME                  = 0x00000003,
    ASM_NAME_MAJOR_VERSION         = 0x00000004,
    ASM_NAME_MINOR_VERSION         = 0x00000005,
    ASM_NAME_BUILD_NUMBER          = 0x00000006,
    ASM_NAME_REVISION_NUMBER       = 0x00000007,
    ASM_NAME_CULTURE               = 0x00000008,
    ASM_NAME_PROCESSOR_ID_ARRAY    = 0x00000009,
    ASM_NAME_OSINFO_ARRAY          = 0x0000000a,
    ASM_NAME_HASH_ALGID            = 0x0000000b,
    ASM_NAME_ALIAS                 = 0x0000000c,
    ASM_NAME_CODEBASE_URL          = 0x0000000d,
    ASM_NAME_CODEBASE_LASTMOD      = 0x0000000e,
    ASM_NAME_NULL_PUBLIC_KEY       = 0x0000000f,
    ASM_NAME_NULL_PUBLIC_KEY_TOKEN = 0x00000010,
    ASM_NAME_CUSTOM                = 0x00000011,
    ASM_NAME_NULL_CUSTOM           = 0x00000012,
    ASM_NAME_MVID                  = 0x00000013,
    ASM_NAME_MAX_PARAMS            = 0x00000014,
}

alias ASM_BIND_FLAGS = uint;
enum : uint
{
    ASM_BINDF_FORCE_CACHE_INSTALL = 0x00000001,
    ASM_BINDF_RFS_INTEGRITY_CHECK = 0x00000002,
    ASM_BINDF_RFS_MODULE_CHECK    = 0x00000004,
    ASM_BINDF_BINPATH_PROBE_ONLY  = 0x00000008,
    ASM_BINDF_SHARED_BINPATH_HINT = 0x00000010,
    ASM_BINDF_PARENT_ASM_HINT     = 0x00000020,
}

alias ASM_DISPLAY_FLAGS = int;
enum : int
{
    ASM_DISPLAYF_VERSION               = 0x00000001,
    ASM_DISPLAYF_CULTURE               = 0x00000002,
    ASM_DISPLAYF_PUBLIC_KEY_TOKEN      = 0x00000004,
    ASM_DISPLAYF_PUBLIC_KEY            = 0x00000008,
    ASM_DISPLAYF_CUSTOM                = 0x00000010,
    ASM_DISPLAYF_PROCESSORARCHITECTURE = 0x00000020,
    ASM_DISPLAYF_LANGUAGEID            = 0x00000040,
}

alias ASM_CMP_FLAGS = int;
enum : int
{
    ASM_CMPF_NAME             = 0x00000001,
    ASM_CMPF_MAJOR_VERSION    = 0x00000002,
    ASM_CMPF_MINOR_VERSION    = 0x00000004,
    ASM_CMPF_BUILD_NUMBER     = 0x00000008,
    ASM_CMPF_REVISION_NUMBER  = 0x00000010,
    ASM_CMPF_PUBLIC_KEY_TOKEN = 0x00000020,
    ASM_CMPF_CULTURE          = 0x00000040,
    ASM_CMPF_CUSTOM           = 0x00000080,
    ASM_CMPF_ALL              = 0x000000ff,
    ASM_CMPF_DEFAULT          = 0x00000100,
}

enum IID_IAssemblyName = GUID(0xcd193bc0, 0xb4bc, 0x11d2, [0x98, 0x33, 0x0, 0xc0, 0x4f, 0xc3, 0x1d, 0x2e]);
interface IAssemblyName : IUnknown
{
    HRESULT SetProperty(uint, void*, uint);
    HRESULT GetProperty(uint, void*, uint*);
    HRESULT Finalize();
    HRESULT GetDisplayName(PWSTR, uint*, uint);
    HRESULT Reserved(const(GUID)*, IUnknown, IUnknown, const(wchar)*, long, void*, uint, void**);
    HRESULT GetName(uint*, PWSTR);
    HRESULT GetVersion(uint*, uint*);
    HRESULT IsEqual(IAssemblyName, uint);
    HRESULT Clone(IAssemblyName*);
}
enum IID_IAssemblyCacheItem = GUID(0x9e3aaeb4, 0xd1cd, 0x11d2, [0xba, 0xb9, 0x0, 0xc0, 0x4f, 0x8e, 0xce, 0xae]);
interface IAssemblyCacheItem : IUnknown
{
    HRESULT CreateStream(uint, const(wchar)*, uint, uint, IStream*, ULARGE_INTEGER*);
    HRESULT Commit(uint, uint*);
    HRESULT AbortItem();
}
enum IID_IAssemblyCache = GUID(0xe707dcde, 0xd1cd, 0x11d2, [0xba, 0xb9, 0x0, 0xc0, 0x4f, 0x8e, 0xce, 0xae]);
interface IAssemblyCache : IUnknown
{
    HRESULT UninstallAssembly(uint, const(wchar)*, FUSION_INSTALL_REFERENCE*, IASSEMBLYCACHE_UNINSTALL_DISPOSITION*);
    HRESULT QueryAssemblyInfo(QUERYASMINFO_FLAGS, const(wchar)*, ASSEMBLY_INFO*);
    HRESULT CreateAssemblyCacheItem(uint, void*, IAssemblyCacheItem*, const(wchar)*);
    HRESULT Reserved(IUnknown*);
    HRESULT InstallAssembly(uint, const(wchar)*, FUSION_INSTALL_REFERENCE*);
}
alias CREATE_ASM_NAME_OBJ_FLAGS = int;
enum : int
{
    CANOF_PARSE_DISPLAY_NAME = 0x00000001,
    CANOF_SET_DEFAULT_VALUES = 0x00000002,
}

struct PROTECTED_FILE_DATA
{
    wchar[260] FileName;
    uint FileNumber;
}
alias msidbControlAttributes = int;
enum : int
{
    msidbControlAttributesVisible         = 0x00000001,
    msidbControlAttributesEnabled         = 0x00000002,
    msidbControlAttributesSunken          = 0x00000004,
    msidbControlAttributesIndirect        = 0x00000008,
    msidbControlAttributesInteger         = 0x00000010,
    msidbControlAttributesRTLRO           = 0x00000020,
    msidbControlAttributesRightAligned    = 0x00000040,
    msidbControlAttributesLeftScroll      = 0x00000080,
    msidbControlAttributesBiDi            = 0x000000e0,
    msidbControlAttributesTransparent     = 0x00010000,
    msidbControlAttributesNoPrefix        = 0x00020000,
    msidbControlAttributesNoWrap          = 0x00040000,
    msidbControlAttributesFormatSize      = 0x00080000,
    msidbControlAttributesUsersLanguage   = 0x00100000,
    msidbControlAttributesMultiline       = 0x00010000,
    msidbControlAttributesPasswordInput   = 0x00200000,
    msidbControlAttributesProgress95      = 0x00010000,
    msidbControlAttributesRemovableVolume = 0x00010000,
    msidbControlAttributesFixedVolume     = 0x00020000,
    msidbControlAttributesRemoteVolume    = 0x00040000,
    msidbControlAttributesCDROMVolume     = 0x00080000,
    msidbControlAttributesRAMDiskVolume   = 0x00100000,
    msidbControlAttributesFloppyVolume    = 0x00200000,
    msidbControlShowRollbackCost          = 0x00400000,
    msidbControlAttributesSorted          = 0x00010000,
    msidbControlAttributesComboList       = 0x00020000,
    msidbControlAttributesImageHandle     = 0x00010000,
    msidbControlAttributesPushLike        = 0x00020000,
    msidbControlAttributesBitmap          = 0x00040000,
    msidbControlAttributesIcon            = 0x00080000,
    msidbControlAttributesFixedSize       = 0x00100000,
    msidbControlAttributesIconSize16      = 0x00200000,
    msidbControlAttributesIconSize32      = 0x00400000,
    msidbControlAttributesIconSize48      = 0x00600000,
    msidbControlAttributesElevationShield = 0x00800000,
    msidbControlAttributesHasBorder       = 0x01000000,
}

alias msidbLocatorType = int;
enum : int
{
    msidbLocatorTypeDirectory = 0x00000000,
    msidbLocatorTypeFileName  = 0x00000001,
    msidbLocatorTypeRawValue  = 0x00000002,
    msidbLocatorType64bit     = 0x00000010,
}

alias msidbComponentAttributes = int;
enum : int
{
    msidbComponentAttributesLocalOnly                 = 0x00000000,
    msidbComponentAttributesSourceOnly                = 0x00000001,
    msidbComponentAttributesOptional                  = 0x00000002,
    msidbComponentAttributesRegistryKeyPath           = 0x00000004,
    msidbComponentAttributesSharedDllRefCount         = 0x00000008,
    msidbComponentAttributesPermanent                 = 0x00000010,
    msidbComponentAttributesODBCDataSource            = 0x00000020,
    msidbComponentAttributesTransitive                = 0x00000040,
    msidbComponentAttributesNeverOverwrite            = 0x00000080,
    msidbComponentAttributes64bit                     = 0x00000100,
    msidbComponentAttributesDisableRegistryReflection = 0x00000200,
    msidbComponentAttributesUninstallOnSupersedence   = 0x00000400,
    msidbComponentAttributesShared                    = 0x00000800,
}

alias msidbAssemblyAttributes = int;
enum : int
{
    msidbAssemblyAttributesURT   = 0x00000000,
    msidbAssemblyAttributesWin32 = 0x00000001,
}

alias msidbCustomActionType = int;
enum : int
{
    msidbCustomActionTypeDll            = 0x00000001,
    msidbCustomActionTypeExe            = 0x00000002,
    msidbCustomActionTypeTextData       = 0x00000003,
    msidbCustomActionTypeJScript        = 0x00000005,
    msidbCustomActionTypeVBScript       = 0x00000006,
    msidbCustomActionTypeInstall        = 0x00000007,
    msidbCustomActionTypeBinaryData     = 0x00000000,
    msidbCustomActionTypeSourceFile     = 0x00000010,
    msidbCustomActionTypeDirectory      = 0x00000020,
    msidbCustomActionTypeProperty       = 0x00000030,
    msidbCustomActionTypeContinue       = 0x00000040,
    msidbCustomActionTypeAsync          = 0x00000080,
    msidbCustomActionTypeFirstSequence  = 0x00000100,
    msidbCustomActionTypeOncePerProcess = 0x00000200,
    msidbCustomActionTypeClientRepeat   = 0x00000300,
    msidbCustomActionTypeInScript       = 0x00000400,
    msidbCustomActionTypeRollback       = 0x00000100,
    msidbCustomActionTypeCommit         = 0x00000200,
    msidbCustomActionTypeNoImpersonate  = 0x00000800,
    msidbCustomActionTypeTSAware        = 0x00004000,
    msidbCustomActionType64BitScript    = 0x00001000,
    msidbCustomActionTypeHideTarget     = 0x00002000,
    msidbCustomActionTypePatchUninstall = 0x00008000,
}

alias msidbDialogAttributes = int;
enum : int
{
    msidbDialogAttributesVisible          = 0x00000001,
    msidbDialogAttributesModal            = 0x00000002,
    msidbDialogAttributesMinimize         = 0x00000004,
    msidbDialogAttributesSysModal         = 0x00000008,
    msidbDialogAttributesKeepModeless     = 0x00000010,
    msidbDialogAttributesTrackDiskSpace   = 0x00000020,
    msidbDialogAttributesUseCustomPalette = 0x00000040,
    msidbDialogAttributesRTLRO            = 0x00000080,
    msidbDialogAttributesRightAligned     = 0x00000100,
    msidbDialogAttributesLeftScroll       = 0x00000200,
    msidbDialogAttributesBiDi             = 0x00000380,
    msidbDialogAttributesError            = 0x00010000,
}

alias msidbFeatureAttributes = int;
enum : int
{
    msidbFeatureAttributesFavorLocal             = 0x00000000,
    msidbFeatureAttributesFavorSource            = 0x00000001,
    msidbFeatureAttributesFollowParent           = 0x00000002,
    msidbFeatureAttributesFavorAdvertise         = 0x00000004,
    msidbFeatureAttributesDisallowAdvertise      = 0x00000008,
    msidbFeatureAttributesUIDisallowAbsent       = 0x00000010,
    msidbFeatureAttributesNoUnsupportedAdvertise = 0x00000020,
}

alias msidbFileAttributes = int;
enum : int
{
    msidbFileAttributesReadOnly      = 0x00000001,
    msidbFileAttributesHidden        = 0x00000002,
    msidbFileAttributesSystem        = 0x00000004,
    msidbFileAttributesReserved0     = 0x00000008,
    msidbFileAttributesIsolatedComp  = 0x00000010,
    msidbFileAttributesReserved1     = 0x00000040,
    msidbFileAttributesReserved2     = 0x00000080,
    msidbFileAttributesReserved3     = 0x00000100,
    msidbFileAttributesVital         = 0x00000200,
    msidbFileAttributesChecksum      = 0x00000400,
    msidbFileAttributesPatchAdded    = 0x00001000,
    msidbFileAttributesNoncompressed = 0x00002000,
    msidbFileAttributesCompressed    = 0x00004000,
    msidbFileAttributesReserved4     = 0x00008000,
}

alias msidbIniFileAction = int;
enum : int
{
    msidbIniFileActionAddLine    = 0x00000000,
    msidbIniFileActionCreateLine = 0x00000001,
    msidbIniFileActionRemoveLine = 0x00000002,
    msidbIniFileActionAddTag     = 0x00000003,
    msidbIniFileActionRemoveTag  = 0x00000004,
}

alias msidbMoveFileOptions = int;
enum : int
{
    msidbMoveFileOptionsMove = 0x00000001,
}

alias msidbODBCDataSourceRegistration = int;
enum : int
{
    msidbODBCDataSourceRegistrationPerMachine = 0x00000000,
    msidbODBCDataSourceRegistrationPerUser    = 0x00000001,
}

alias msidbClassAttributes = int;
enum : int
{
    msidbClassAttributesRelativePath = 0x00000001,
}

alias msidbPatchAttributes = int;
enum : int
{
    msidbPatchAttributesNonVital = 0x00000001,
}

alias msidbRegistryRoot = int;
enum : int
{
    msidbRegistryRootClassesRoot  = 0x00000000,
    msidbRegistryRootCurrentUser  = 0x00000001,
    msidbRegistryRootLocalMachine = 0x00000002,
    msidbRegistryRootUsers        = 0x00000003,
}

alias msidbRemoveFileInstallMode = int;
enum : int
{
    msidbRemoveFileInstallModeOnInstall = 0x00000001,
    msidbRemoveFileInstallModeOnRemove  = 0x00000002,
    msidbRemoveFileInstallModeOnBoth    = 0x00000003,
}

alias msidbServiceControlEvent = int;
enum : int
{
    msidbServiceControlEventStart           = 0x00000001,
    msidbServiceControlEventStop            = 0x00000002,
    msidbServiceControlEventDelete          = 0x00000008,
    msidbServiceControlEventUninstallStart  = 0x00000010,
    msidbServiceControlEventUninstallStop   = 0x00000020,
    msidbServiceControlEventUninstallDelete = 0x00000080,
}

alias msidbServiceConfigEvent = int;
enum : int
{
    msidbServiceConfigEventInstall   = 0x00000001,
    msidbServiceConfigEventUninstall = 0x00000002,
    msidbServiceConfigEventReinstall = 0x00000004,
}

alias msidbServiceInstallErrorControl = int;
enum : int
{
    msidbServiceInstallErrorControlVital = 0x00008000,
}

alias msidbTextStyleStyleBits = int;
enum : int
{
    msidbTextStyleStyleBitsBold      = 0x00000001,
    msidbTextStyleStyleBitsItalic    = 0x00000002,
    msidbTextStyleStyleBitsUnderline = 0x00000004,
    msidbTextStyleStyleBitsStrike    = 0x00000008,
}

alias msidbUpgradeAttributes = int;
enum : int
{
    msidbUpgradeAttributesMigrateFeatures     = 0x00000001,
    msidbUpgradeAttributesOnlyDetect          = 0x00000002,
    msidbUpgradeAttributesIgnoreRemoveFailure = 0x00000004,
    msidbUpgradeAttributesVersionMinInclusive = 0x00000100,
    msidbUpgradeAttributesVersionMaxInclusive = 0x00000200,
    msidbUpgradeAttributesLanguagesExclusive  = 0x00000400,
}

alias msidbEmbeddedUIAttributes = int;
enum : int
{
    msidbEmbeddedUI           = 0x00000001,
    msidbEmbeddedHandlesBasic = 0x00000002,
}

alias msidbSumInfoSourceType = int;
enum : int
{
    msidbSumInfoSourceTypeSFN        = 0x00000001,
    msidbSumInfoSourceTypeCompressed = 0x00000002,
    msidbSumInfoSourceTypeAdminImage = 0x00000004,
    msidbSumInfoSourceTypeLUAPackage = 0x00000008,
}

alias msirbRebootType = int;
enum : int
{
    msirbRebootImmediate = 0x00000001,
    msirbRebootDeferred  = 0x00000002,
}

alias msirbRebootReason = int;
enum : int
{
    msirbRebootUndeterminedReason   = 0x00000000,
    msirbRebootInUseFilesReason     = 0x00000001,
    msirbRebootScheduleRebootReason = 0x00000002,
    msirbRebootForceRebootReason    = 0x00000003,
    msirbRebootCustomActionReason   = 0x00000004,
}

alias msifiFastInstallBits = int;
enum : int
{
    msifiFastInstallNoSR         = 0x00000001,
    msifiFastInstallQuickCosting = 0x00000002,
    msifiFastInstallLessPrgMsg   = 0x00000004,
}

enum CLSID_PMSvc = GUID(0xb9e511fc, 0xe364, 0x497a, [0xa1, 0x21, 0xb7, 0xb3, 0x61, 0x2c, 0xed, 0xce]);
struct PMSvc
{
}
alias TILE_TEMPLATE_TYPE = int;
enum : int
{
    TILE_TEMPLATE_INVALID               = 0x00000000,
    TILE_TEMPLATE_FLIP                  = 0x00000005,
    TILE_TEMPLATE_DEEPLINK              = 0x0000000d,
    TILE_TEMPLATE_CYCLE                 = 0x0000000e,
    TILE_TEMPLATE_METROCOUNT            = 0x00000001,
    TILE_TEMPLATE_AGILESTORE            = 0x00000002,
    TILE_TEMPLATE_GAMES                 = 0x00000003,
    TILE_TEMPLATE_CALENDAR              = 0x00000004,
    TILE_TEMPLATE_MUSICVIDEO            = 0x00000007,
    TILE_TEMPLATE_PEOPLE                = 0x0000000a,
    TILE_TEMPLATE_CONTACT               = 0x0000000b,
    TILE_TEMPLATE_GROUP                 = 0x0000000c,
    TILE_TEMPLATE_DEFAULT               = 0x0000000f,
    TILE_TEMPLATE_BADGE                 = 0x00000010,
    TILE_TEMPLATE_BLOCK                 = 0x00000011,
    TILE_TEMPLATE_TEXT01                = 0x00000012,
    TILE_TEMPLATE_TEXT02                = 0x00000013,
    TILE_TEMPLATE_TEXT03                = 0x00000014,
    TILE_TEMPLATE_TEXT04                = 0x00000015,
    TILE_TEMPLATE_TEXT05                = 0x00000016,
    TILE_TEMPLATE_TEXT06                = 0x00000017,
    TILE_TEMPLATE_TEXT07                = 0x00000018,
    TILE_TEMPLATE_TEXT08                = 0x00000019,
    TILE_TEMPLATE_TEXT09                = 0x0000001a,
    TILE_TEMPLATE_TEXT10                = 0x0000001b,
    TILE_TEMPLATE_TEXT11                = 0x0000001c,
    TILE_TEMPLATE_IMAGE                 = 0x0000001d,
    TILE_TEMPLATE_IMAGECOLLECTION       = 0x0000001e,
    TILE_TEMPLATE_IMAGEANDTEXT01        = 0x0000001f,
    TILE_TEMPLATE_IMAGEANDTEXT02        = 0x00000020,
    TILE_TEMPLATE_BLOCKANDTEXT01        = 0x00000021,
    TILE_TEMPLATE_BLOCKANDTEXT02        = 0x00000022,
    TILE_TEMPLATE_PEEKIMAGEANDTEXT01    = 0x00000023,
    TILE_TEMPLATE_PEEKIMAGEANDTEXT02    = 0x00000024,
    TILE_TEMPLATE_PEEKIMAGEANDTEXT03    = 0x00000025,
    TILE_TEMPLATE_PEEKIMAGEANDTEXT04    = 0x00000026,
    TILE_TEMPLATE_PEEKIMAGE01           = 0x00000027,
    TILE_TEMPLATE_PEEKIMAGE02           = 0x00000028,
    TILE_TEMPLATE_PEEKIMAGE03           = 0x00000029,
    TILE_TEMPLATE_PEEKIMAGE04           = 0x0000002a,
    TILE_TEMPLATE_PEEKIMAGE05           = 0x0000002b,
    TILE_TEMPLATE_PEEKIMAGE06           = 0x0000002c,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION01 = 0x0000002d,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION02 = 0x0000002e,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION03 = 0x0000002f,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION04 = 0x00000030,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION05 = 0x00000031,
    TILE_TEMPLATE_PEEKIMAGECOLLECTION06 = 0x00000032,
    TILE_TEMPLATE_SMALLIMAGEANDTEXT01   = 0x00000033,
    TILE_TEMPLATE_SMALLIMAGEANDTEXT02   = 0x00000034,
    TILE_TEMPLATE_SMALLIMAGEANDTEXT03   = 0x00000035,
    TILE_TEMPLATE_SMALLIMAGEANDTEXT04   = 0x00000036,
    TILE_TEMPLATE_SMALLIMAGEANDTEXT05   = 0x00000037,
    TILE_TEMPLATE_METROCOUNTQUEUE       = 0x00000038,
    TILE_TEMPLATE_SEARCH                = 0x00000039,
    TILE_TEMPLATE_TILEFLYOUT01          = 0x0000003a,
    TILE_TEMPLATE_FOLDER                = 0x0000003b,
    TILE_TEMPLATE_ALL                   = 0x00000064,
}

alias PM_APP_GENRE = int;
enum : int
{
    PM_APP_GENRE_GAMES   = 0x00000000,
    PM_APP_GENRE_OTHER   = 0x00000001,
    PM_APP_GENRE_INVALID = 0x00000002,
}

alias PM_APPLICATION_INSTALL_TYPE = int;
enum : int
{
    PM_APPLICATION_INSTALL_NORMAL     = 0x00000000,
    PM_APPLICATION_INSTALL_IN_ROM     = 0x00000001,
    PM_APPLICATION_INSTALL_PA         = 0x00000002,
    PM_APPLICATION_INSTALL_DEBUG      = 0x00000003,
    PM_APPLICATION_INSTALL_ENTERPRISE = 0x00000004,
    PM_APPLICATION_INSTALL_INVALID    = 0x00000005,
}

alias PM_APPLICATION_STATE = int;
enum : int
{
    PM_APPLICATION_STATE_MIN                   = 0x00000000,
    PM_APPLICATION_STATE_INSTALLED             = 0x00000001,
    PM_APPLICATION_STATE_INSTALLING            = 0x00000002,
    PM_APPLICATION_STATE_UPDATING              = 0x00000003,
    PM_APPLICATION_STATE_UNINSTALLING          = 0x00000004,
    PM_APPLICATION_STATE_LICENSE_UPDATING      = 0x00000005,
    PM_APPLICATION_STATE_MOVING                = 0x00000006,
    PM_APPLICATION_STATE_DISABLED_SD_CARD      = 0x00000007,
    PM_APPLICATION_STATE_DISABLED_ENTERPRISE   = 0x00000008,
    PM_APPLICATION_STATE_DISABLED_BACKING_UP   = 0x00000009,
    PM_APPLICATION_STATE_DISABLED_MDIL_BINDING = 0x0000000a,
    PM_APPLICATION_STATE_MAX                   = 0x0000000a,
    PM_APPLICATION_STATE_INVALID               = 0x0000000b,
}

alias PM_APPLICATION_HUBTYPE = int;
enum : int
{
    PM_APPLICATION_HUBTYPE_NONMUSIC = 0x00000000,
    PM_APPLICATION_HUBTYPE_MUSIC    = 0x00000001,
    PM_APPLICATION_HUBTYPE_INVALID  = 0x00000002,
}

alias PM_TILE_HUBTYPE = int;
enum : int
{
    PM_TILE_HUBTYPE_MUSIC      = 0x00000001,
    PM_TILE_HUBTYPE_MOSETTINGS = 0x10000000,
    PM_TILE_HUBTYPE_GAMES      = 0x20000000,
    PM_TILE_HUBTYPE_APPLIST    = 0x40000000,
    PM_TILE_HUBTYPE_STARTMENU  = 0x80000000,
    PM_TILE_HUBTYPE_LOCKSCREEN = 0x01000000,
    PM_TILE_HUBTYPE_KIDZONE    = 0x02000000,
    PM_TILE_HUBTYPE_CACHED     = 0x04000000,
    PM_TILE_HUBTYPE_INVALID    = 0x04000001,
}

alias PM_STARTTILE_TYPE = int;
enum : int
{
    PM_STARTTILE_TYPE_PRIMARY        = 0x00000001,
    PM_STARTTILE_TYPE_SECONDARY      = 0x00000002,
    PM_STARTTILE_TYPE_APPLIST        = 0x00000003,
    PM_STARTTILE_TYPE_APPLISTPRIMARY = 0x00000004,
    PM_STARTTILE_TYPE_INVALID        = 0x00000005,
}

alias PM_TASK_TYPE = int;
enum : int
{
    PM_TASK_TYPE_NORMAL                 = 0x00000000,
    PM_TASK_TYPE_DEFAULT                = 0x00000001,
    PM_TASK_TYPE_SETTINGS               = 0x00000002,
    PM_TASK_TYPE_BACKGROUNDSERVICEAGENT = 0x00000003,
    PM_TASK_TYPE_BACKGROUNDWORKER       = 0x00000004,
    PM_TASK_TYPE_INVALID                = 0x00000005,
}

alias PACKMAN_RUNTIME = int;
enum : int
{
    PACKMAN_RUNTIME_NATIVE            = 0x00000001,
    PACKMAN_RUNTIME_SILVERLIGHTMOBILE = 0x00000002,
    PACKMAN_RUNTIME_XNA               = 0x00000003,
    PACKMAN_RUNTIME_MODERN_NATIVE     = 0x00000004,
    PACKMAN_RUNTIME_JUPITER           = 0x00000005,
    PACKMAN_RUNTIME_INVALID           = 0x00000006,
}

alias PM_ACTIVATION_POLICY = int;
enum : int
{
    PM_ACTIVATION_POLICY_RESUME                   = 0x00000000,
    PM_ACTIVATION_POLICY_RESUMESAMEPARAMS         = 0x00000001,
    PM_ACTIVATION_POLICY_REPLACE                  = 0x00000002,
    PM_ACTIVATION_POLICY_REPLACESAMEPARAMS        = 0x00000003,
    PM_ACTIVATION_POLICY_MULTISESSION             = 0x00000004,
    PM_ACTIVATION_POLICY_REPLACE_IGNOREFOREGROUND = 0x00000005,
    PM_ACTIVATION_POLICY_UNKNOWN                  = 0x00000006,
    PM_ACTIVATION_POLICY_INVALID                  = 0x00000007,
}

alias PM_TASK_TRANSITION = int;
enum : int
{
    PM_TASK_TRANSITION_DEFAULT     = 0x00000000,
    PM_TASK_TRANSITION_NONE        = 0x00000001,
    PM_TASK_TRANSITION_TURNSTILE   = 0x00000002,
    PM_TASK_TRANSITION_SLIDE       = 0x00000003,
    PM_TASK_TRANSITION_SWIVEL      = 0x00000004,
    PM_TASK_TRANSITION_READERBOARD = 0x00000005,
    PM_TASK_TRANSITION_CUSTOM      = 0x00000006,
    PM_TASK_TRANSITION_INVALID     = 0x00000007,
}

alias PM_ENUM_APP_FILTER = int;
enum : int
{
    PM_APP_FILTER_ALL                = 0x00000000,
    PM_APP_FILTER_VISIBLE            = 0x00000001,
    PM_APP_FILTER_GENRE              = 0x00000002,
    PM_APP_FILTER_NONGAMES           = 0x00000003,
    PM_APP_FILTER_HUBTYPE            = 0x00000004,
    PM_APP_FILTER_PINABLEONKIDZONE   = 0x00000005,
    PM_APP_FILTER_ALL_INCLUDE_MODERN = 0x00000006,
    PM_APP_FILTER_FRAMEWORK          = 0x00000007,
    PM_APP_FILTER_MAX                = 0x00000008,
}

alias PM_ENUM_TILE_FILTER = int;
enum : int
{
    PM_TILE_FILTER_APPLIST = 0x00000008,
    PM_TILE_FILTER_PINNED  = 0x00000009,
    PM_TILE_FILTER_HUBTYPE = 0x0000000a,
    PM_TILE_FILTER_APP_ALL = 0x0000000b,
    PM_TILE_FILTER_MAX     = 0x0000000c,
}

alias PM_ENUM_TASK_FILTER = int;
enum : int
{
    PM_TASK_FILTER_APP_ALL          = 0x0000000c,
    PM_TASK_FILTER_TASK_TYPE        = 0x0000000d,
    PM_TASK_FILTER_DEHYD_SUPRESSING = 0x0000000e,
    PM_TASK_FILTER_APP_TASK_TYPE    = 0x0000000f,
    PM_TASK_FILTER_BGEXECUTION      = 0x00000010,
    PM_TASK_FILTER_MAX              = 0x00000011,
}

alias PM_ENUM_EXTENSION_FILTER = int;
enum : int
{
    PM_ENUM_EXTENSION_FILTER_BY_CONSUMER             = 0x00000011,
    PM_ENUM_EXTENSION_FILTER_APPCONNECT              = 0x00000011,
    PM_ENUM_EXTENSION_FILTER_PROTOCOL_ALL            = 0x00000012,
    PM_ENUM_EXTENSION_FILTER_FTASSOC_FILETYPE_ALL    = 0x00000013,
    PM_ENUM_EXTENSION_FILTER_FTASSOC_CONTENTTYPE_ALL = 0x00000014,
    PM_ENUM_EXTENSION_FILTER_FTASSOC_APPLICATION_ALL = 0x00000015,
    PM_ENUM_EXTENSION_FILTER_SHARETARGET_ALL         = 0x00000016,
    PM_ENUM_EXTENSION_FILTER_FILEOPENPICKER_ALL      = 0x00000017,
    PM_ENUM_EXTENSION_FILTER_FILESAVEPICKER_ALL      = 0x00000018,
    PM_ENUM_EXTENSION_FILTER_CACHEDFILEUPDATER_ALL   = 0x00000019,
    PM_ENUM_EXTENSION_FILTER_MAX                     = 0x0000001a,
}

alias PM_ENUM_BSA_FILTER = int;
enum : int
{
    PM_ENUM_BSA_FILTER_ALL                 = 0x0000001a,
    PM_ENUM_BSA_FILTER_BY_TASKID           = 0x0000001b,
    PM_ENUM_BSA_FILTER_BY_PRODUCTID        = 0x0000001c,
    PM_ENUM_BSA_FILTER_BY_PERIODIC         = 0x0000001d,
    PM_ENUM_BSA_FILTER_BY_ALL_LAUNCHONBOOT = 0x0000001e,
    PM_ENUM_BSA_FILTER_MAX                 = 0x0000001f,
}

alias PM_ENUM_BW_FILTER = int;
enum : int
{
    PM_ENUM_BW_FILTER_BOOTWORKER_ALL = 0x0000001f,
    PM_ENUM_BW_FILTER_BY_TASKID      = 0x00000020,
    PM_ENUM_BW_FILTER_MAX            = 0x00000021,
}

struct _tagAPPTASKTYPE
{
    GUID ProductID;
    PM_TASK_TYPE TaskType;
}
struct PM_EXTENSIONCONSUMER
{
    GUID ConsumerPID;
    BSTR ExtensionID;
}
struct PM_BSATASKID
{
    GUID ProductID;
    BSTR TaskID;
}
struct PM_BWTASKID
{
    GUID ProductID;
    BSTR TaskID;
}
struct PM_ENUM_FILTER
{
    int FilterType;
    union _FilterParameter_e__Union
    {
        int Dummy;
        PM_APP_GENRE Genre;
        PM_APPLICATION_HUBTYPE AppHubType;
        PM_TILE_HUBTYPE HubType;
        PM_TASK_TYPE Tasktype;
        GUID TaskProductID;
        GUID TileProductID;
        _tagAPPTASKTYPE AppTaskType;
        PM_EXTENSIONCONSUMER Consumer;
        PM_BSATASKID BSATask;
        GUID BSAProductID;
        PM_BWTASKID BWTask;
        BSTR ProtocolName;
        BSTR FileType;
        BSTR ContentType;
        GUID AppSupportedFileExtPID;
        BSTR ShareTargetFileType;
    }
}
alias PM_LIVETILE_RECURRENCE_TYPE = int;
enum : int
{
    PM_LIVETILE_RECURRENCE_TYPE_INSTANT  = 0x00000000,
    PM_LIVETILE_RECURRENCE_TYPE_ONETIME  = 0x00000001,
    PM_LIVETILE_RECURRENCE_TYPE_INTERVAL = 0x00000002,
    PM_LIVETILE_RECURRENCE_TYPE_MAX      = 0x00000002,
}

alias PM_TILE_SIZE = int;
enum : int
{
    PM_TILE_SIZE_SMALL         = 0x00000000,
    PM_TILE_SIZE_MEDIUM        = 0x00000001,
    PM_TILE_SIZE_LARGE         = 0x00000002,
    PM_TILE_SIZE_SQUARE310X310 = 0x00000003,
    PM_TILE_SIZE_TALL150X310   = 0x00000004,
    PM_TILE_SIZE_INVALID       = 0x00000005,
}

alias PM_LOGO_SIZE = int;
enum : int
{
    PM_LOGO_SIZE_SMALL   = 0x00000000,
    PM_LOGO_SIZE_MEDIUM  = 0x00000001,
    PM_LOGO_SIZE_LARGE   = 0x00000002,
    PM_LOGO_SIZE_INVALID = 0x00000003,
}

struct PM_STARTAPPBLOB
{
    uint cbSize;
    GUID ProductID;
    BSTR AppTitle;
    BSTR IconPath;
    BOOL IsUninstallable;
    PM_APPLICATION_INSTALL_TYPE AppInstallType;
    GUID InstanceID;
    PM_APPLICATION_STATE State;
    BOOL IsModern;
    BOOL IsModernLightUp;
    ushort LightUpSupportMask;
}
struct PM_INVOCATIONINFO
{
    BSTR URIBaseOrAUMID;
    BSTR URIFragmentOrArgs;
}
struct PM_STARTTILEBLOB
{
    uint cbSize;
    GUID ProductID;
    BSTR TileID;
    TILE_TEMPLATE_TYPE TemplateType;
    uint[32] HubPosition;
    uint HubVisibilityBitmask;
    BOOL IsDefault;
    PM_STARTTILE_TYPE TileType;
    ubyte* pbPropBlob;
    uint cbPropBlob;
    BOOL IsRestoring;
    BOOL IsModern;
    PM_INVOCATIONINFO InvocationInfo;
}
struct PM_INSTALLINFO
{
    GUID ProductID;
    BSTR PackagePath;
    GUID InstanceID;
    ubyte* pbLicense;
    uint cbLicense;
    BOOL IsUninstallDisabled;
    uint DeploymentOptions;
    GUID OfferID;
    BSTR MarketplaceAppVersion;
}
struct PM_UPDATEINFO_LEGACY
{
    GUID ProductID;
    BSTR PackagePath;
    GUID InstanceID;
    ubyte* pbLicense;
    uint cbLicense;
    BSTR MarketplaceAppVersion;
}
struct PM_UPDATEINFO
{
    GUID ProductID;
    BSTR PackagePath;
    GUID InstanceID;
    ubyte* pbLicense;
    uint cbLicense;
    BSTR MarketplaceAppVersion;
    uint DeploymentOptions;
}
enum IID_IPMApplicationInfo = GUID(0x50afb58a, 0x438c, 0x4088, [0x97, 0x89, 0xf8, 0xc4, 0x89, 0x98, 0x29, 0xc7]);
interface IPMApplicationInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_InstanceID(GUID*);
    HRESULT get_OfferID(GUID*);
    HRESULT get_DefaultTask(BSTR*);
    HRESULT get_AppTitle(BSTR*);
    HRESULT get_IconPath(BSTR*);
    HRESULT get_NotificationState(BOOL*);
    HRESULT get_AppInstallType(PM_APPLICATION_INSTALL_TYPE*);
    HRESULT get_State(PM_APPLICATION_STATE*);
    HRESULT get_IsRevoked(BOOL*);
    HRESULT get_UpdateAvailable(BOOL*);
    HRESULT get_InstallDate(FILETIME*);
    HRESULT get_IsUninstallable(BOOL*);
    HRESULT get_IsThemable(BOOL*);
    HRESULT get_IsTrial(BOOL*);
    HRESULT get_InstallPath(BSTR*);
    HRESULT get_DataRoot(BSTR*);
    HRESULT get_Genre(PM_APP_GENRE*);
    HRESULT get_Publisher(BSTR*);
    HRESULT get_Author(BSTR*);
    HRESULT get_Description(BSTR*);
    HRESULT get_Version(BSTR*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
    HRESULT get_AppPlatMajorVersion(ubyte*);
    HRESULT get_AppPlatMinorVersion(ubyte*);
    HRESULT get_PublisherID(GUID*);
    HRESULT get_IsMultiCore(BOOL*);
    HRESULT get_SID(BSTR*);
    HRESULT get_AppPlatMajorVersionLightUp(ubyte*);
    HRESULT get_AppPlatMinorVersionLightUp(ubyte*);
    HRESULT set_UpdateAvailable(BOOL);
    HRESULT set_NotificationState(BOOL);
    HRESULT set_IconPath(BSTR);
    HRESULT set_UninstallableState(BOOL);
    HRESULT get_IsPinableOnKidZone(BOOL*);
    HRESULT get_IsOriginallyPreInstalled(BOOL*);
    HRESULT get_IsInstallOnSD(BOOL*);
    HRESULT get_IsOptoutOnSD(BOOL*);
    HRESULT get_IsOptoutBackupRestore(BOOL*);
    HRESULT set_EnterpriseDisabled(BOOL);
    HRESULT set_EnterpriseUninstallable(BOOL);
    HRESULT get_EnterpriseDisabled(BOOL*);
    HRESULT get_EnterpriseUninstallable(BOOL*);
    HRESULT get_IsVisibleOnAppList(BOOL*);
    HRESULT get_IsInboxApp(BOOL*);
    HRESULT get_StorageID(GUID*);
    HRESULT get_StartAppBlob(PM_STARTAPPBLOB*);
    HRESULT get_IsMovable(BOOL*);
    HRESULT get_DeploymentAppEnumerationHubFilter(PM_TILE_HUBTYPE*);
    HRESULT get_ModifiedDate(FILETIME*);
    HRESULT get_IsOriginallyRestored(BOOL*);
    HRESULT get_ShouldDeferMdilBind(BOOL*);
    HRESULT get_IsFullyPreInstall(BOOL*);
    HRESULT set_IsMdilMaintenanceNeeded(BOOL);
    HRESULT set_Title(BSTR);
}
enum IID_IPMTilePropertyInfo = GUID(0x6c2b8017, 0x1efa, 0x42a7, [0x86, 0xc0, 0x6d, 0x4b, 0x64, 0xb, 0xf5, 0x28]);
interface IPMTilePropertyInfo : IUnknown
{
    HRESULT get_PropertyID(uint*);
    HRESULT get_PropertyValue(BSTR*);
    HRESULT set_Property(BSTR);
}
enum IID_IPMTilePropertyEnumerator = GUID(0xcc4cd629, 0x9047, 0x4250, [0xaa, 0xc8, 0x93, 0xe, 0x47, 0x81, 0x24, 0x21]);
interface IPMTilePropertyEnumerator : IUnknown
{
    HRESULT get_Next(IPMTilePropertyInfo*);
}
enum IID_IPMTileInfo = GUID(0xd1604833, 0x2b08, 0x4001, [0x82, 0xcd, 0x18, 0x3a, 0xd7, 0x34, 0xf7, 0x52]);
interface IPMTileInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_TileID(BSTR*);
    HRESULT get_TemplateType(TILE_TEMPLATE_TYPE*);
    HRESULT get_HubPinnedState(PM_TILE_HUBTYPE, BOOL*);
    HRESULT get_HubPosition(PM_TILE_HUBTYPE, uint*);
    HRESULT get_IsNotified(BOOL*);
    HRESULT get_IsDefault(BOOL*);
    HRESULT get_TaskID(BSTR*);
    HRESULT get_TileType(PM_STARTTILE_TYPE*);
    HRESULT get_IsThemable(BOOL*);
    HRESULT get_PropertyById(uint, IPMTilePropertyInfo*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
    HRESULT get_PropertyEnum(IPMTilePropertyEnumerator*);
    HRESULT get_HubTileSize(PM_TILE_HUBTYPE, PM_TILE_SIZE*);
    HRESULT set_HubPosition(PM_TILE_HUBTYPE, uint);
    HRESULT set_NotifiedState(BOOL);
    HRESULT set_HubPinnedState(PM_TILE_HUBTYPE, BOOL);
    HRESULT set_HubTileSize(PM_TILE_HUBTYPE, PM_TILE_SIZE);
    HRESULT set_InvocationInfo(BSTR, BSTR);
    HRESULT get_StartTileBlob(PM_STARTTILEBLOB*);
    HRESULT get_IsRestoring(BOOL*);
    HRESULT get_IsAutoRestoreDisabled(BOOL*);
    HRESULT set_IsRestoring(BOOL);
    HRESULT set_IsAutoRestoreDisabled(BOOL);
}
enum IID_IPMTileInfoEnumerator = GUID(0xded83065, 0xe462, 0x4b2c, [0xac, 0xb5, 0xe3, 0x9c, 0xea, 0x61, 0xc8, 0x74]);
interface IPMTileInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMTileInfo*);
}
enum IID_IPMApplicationInfoEnumerator = GUID(0xec42a96, 0x4d46, 0x4dc6, [0xa3, 0xd9, 0xa7, 0xac, 0xaa, 0xc0, 0xf5, 0xfa]);
interface IPMApplicationInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMApplicationInfo*);
}
enum IID_IPMLiveTileJobInfo = GUID(0x6009a81f, 0x4710, 0x4697, [0xb5, 0xf6, 0x22, 0x8, 0xf6, 0x5, 0x7b, 0x8e]);
interface IPMLiveTileJobInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_TileID(BSTR*);
    HRESULT get_NextSchedule(FILETIME*);
    HRESULT set_NextSchedule(FILETIME);
    HRESULT get_StartSchedule(FILETIME*);
    HRESULT set_StartSchedule(FILETIME);
    HRESULT get_IntervalDuration(uint*);
    HRESULT set_IntervalDuration(uint);
    HRESULT get_RunForever(BOOL*);
    HRESULT set_RunForever(BOOL);
    HRESULT get_MaxRunCount(uint*);
    HRESULT set_MaxRunCount(uint);
    HRESULT get_RunCount(uint*);
    HRESULT set_RunCount(uint);
    HRESULT get_RecurrenceType(uint*);
    HRESULT set_RecurrenceType(uint);
    HRESULT get_TileXML(ubyte**, uint*);
    HRESULT set_TileXML(ubyte*, uint);
    HRESULT get_UrlXML(ubyte**, uint*);
    HRESULT set_UrlXML(ubyte*, uint);
    HRESULT get_AttemptCount(uint*);
    HRESULT set_AttemptCount(uint);
    HRESULT get_DownloadState(uint*);
    HRESULT set_DownloadState(uint);
}
enum IID_IPMLiveTileJobInfoEnumerator = GUID(0xbc042582, 0x9415, 0x4f36, [0x9f, 0x99, 0x6, 0xf1, 0x4, 0xc0, 0x7c, 0x3]);
interface IPMLiveTileJobInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMLiveTileJobInfo*);
}
enum IID_IPMDeploymentManager = GUID(0x35f785fa, 0x1979, 0x4a8b, [0xbc, 0x8f, 0xfd, 0x70, 0xeb, 0xd, 0x15, 0x44]);
interface IPMDeploymentManager : IUnknown
{
    HRESULT ReportDownloadBegin(GUID);
    HRESULT ReportDownloadProgress(GUID, ushort);
    HRESULT ReportDownloadComplete(GUID, HRESULT);
    HRESULT BeginInstall(PM_INSTALLINFO*);
    HRESULT BeginUpdate(PM_UPDATEINFO*);
    HRESULT BeginDeployPackage(PM_INSTALLINFO*);
    HRESULT BeginUpdateDeployedPackageLegacy(PM_UPDATEINFO_LEGACY*);
    HRESULT BeginUninstall(GUID);
    HRESULT BeginEnterpriseAppInstall(PM_INSTALLINFO*);
    HRESULT BeginEnterpriseAppUpdate(PM_UPDATEINFO*);
    HRESULT BeginUpdateLicense(GUID, GUID, ubyte*, uint);
    HRESULT GetLicenseChallenge(BSTR, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*);
    HRESULT GetLicenseChallengeByProductID(GUID, ubyte**, uint*);
    HRESULT GetLicenseChallengeByProductID2(GUID, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*, ubyte**, uint*);
    HRESULT RevokeLicense(GUID);
    HRESULT RebindMdilBinaries(GUID, SAFEARRAY*);
    HRESULT RebindAllMdilBinaries(GUID, GUID);
    HRESULT RegenerateXbf(GUID, SAFEARRAY*);
    HRESULT GenerateXbfForCurrentLocale(GUID);
    HRESULT BeginProvision(GUID, BSTR);
    HRESULT BeginDeprovision(GUID);
    HRESULT ReindexSQLCEDatabases(GUID);
    HRESULT SetApplicationsNeedMaintenance(uint, uint*);
    HRESULT UpdateChamberProfile(GUID);
    HRESULT EnterprisePolicyIsApplicationAllowed(GUID, const(wchar)*, BOOL*);
    HRESULT BeginUpdateDeployedPackage(PM_UPDATEINFO*);
    HRESULT ReportRestoreCancelled(GUID);
    HRESULT ResolveResourceString(const(wchar)*, BSTR*);
    HRESULT UpdateCapabilitiesForModernApps();
    HRESULT ReportDownloadStatusUpdate(GUID);
    HRESULT BeginUninstallWithOptions(GUID, uint);
    HRESULT BindDeferredMdilBinaries();
    HRESULT GenerateXamlLightupXbfForCurrentLocale(BSTR);
    HRESULT AddLicenseForAppx(GUID, ubyte*, uint, ubyte*, uint);
    HRESULT FixJunctionsForAppsOnSDCard();
}
enum IID_IPMEnumerationManager = GUID(0x698d57c2, 0x292d, 0x4cf3, [0xb7, 0x3c, 0xd9, 0x5a, 0x69, 0x22, 0xed, 0x9a]);
interface IPMEnumerationManager : IUnknown
{
    HRESULT get_AllApplications(IPMApplicationInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_AllTiles(IPMTileInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_AllTasks(IPMTaskInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_AllExtensions(IPMExtensionInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_AllBackgroundServiceAgents(IPMBackgroundServiceAgentInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_AllBackgroundWorkers(IPMBackgroundWorkerInfoEnumerator*, PM_ENUM_FILTER);
    HRESULT get_ApplicationInfo(GUID, IPMApplicationInfo*);
    HRESULT get_TileInfo(GUID, BSTR, IPMTileInfo*);
    HRESULT get_TaskInfo(GUID, BSTR, IPMTaskInfo*);
    HRESULT get_TaskInfoEx(GUID, const(wchar)*, IPMTaskInfo*);
    HRESULT get_BackgroundServiceAgentInfo(uint, IPMBackgroundServiceAgentInfo*);
    HRESULT get_AllLiveTileJobs(IPMLiveTileJobInfoEnumerator*);
    HRESULT get_LiveTileJob(GUID, BSTR, PM_LIVETILE_RECURRENCE_TYPE, IPMLiveTileJobInfo*);
    HRESULT get_ApplicationInfoExternal(GUID, IPMApplicationInfo*);
    HRESULT get_FileHandlerGenericLogo(BSTR, PM_LOGO_SIZE, BSTR*);
    HRESULT get_ApplicationInfoFromAccessClaims(BSTR, BSTR, IPMApplicationInfo*);
    HRESULT get_StartTileEnumeratorBlob(PM_ENUM_FILTER, uint*, PM_STARTTILEBLOB**);
    HRESULT get_StartAppEnumeratorBlob(PM_ENUM_FILTER, uint*, PM_STARTAPPBLOB**);
}
enum IID_IPMTaskInfo = GUID(0xbf1d8c33, 0x1bf5, 0x4ee0, [0xb5, 0x49, 0x6b, 0x9d, 0xd3, 0x83, 0x49, 0x42]);
interface IPMTaskInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_TaskID(BSTR*);
    HRESULT get_NavigationPage(BSTR*);
    HRESULT get_TaskTransition(PM_TASK_TRANSITION*);
    HRESULT get_RuntimeType(PACKMAN_RUNTIME*);
    HRESULT get_ActivationPolicy(PM_ACTIVATION_POLICY*);
    HRESULT get_TaskType(PM_TASK_TYPE*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
    HRESULT get_ImagePath(BSTR*);
    HRESULT get_ImageParams(BSTR*);
    HRESULT get_InstallRootFolder(BSTR*);
    HRESULT get_DataRootFolder(BSTR*);
    HRESULT get_IsSingleInstanceHost(BOOL*);
    HRESULT get_IsInteropEnabled(BOOL*);
    HRESULT get_ApplicationState(PM_APPLICATION_STATE*);
    HRESULT get_InstallType(PM_APPLICATION_INSTALL_TYPE*);
    HRESULT get_Version(ubyte*, ubyte*);
    HRESULT get_BitsPerPixel(ushort*);
    HRESULT get_SuppressesDehydration(BOOL*);
    HRESULT get_BackgroundExecutionAbilities(BSTR*);
    HRESULT get_IsOptedForExtendedMem(BOOL*);
}
enum IID_IPMTaskInfoEnumerator = GUID(0x630b0f8, 0xbbc, 0x4821, [0xbe, 0x74, 0xc7, 0x99, 0x51, 0x66, 0xed, 0x2a]);
interface IPMTaskInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMTaskInfo*);
}
enum IID_IPMExtensionInfo = GUID(0x49acde79, 0x9788, 0x4d0a, [0x8a, 0xa0, 0x17, 0x46, 0xaf, 0xdb, 0x9e, 0x9d]);
interface IPMExtensionInfo : IUnknown
{
    HRESULT get_SupplierPID(GUID*);
    HRESULT get_SupplierTaskID(BSTR*);
    HRESULT get_Title(BSTR*);
    HRESULT get_IconPath(BSTR*);
    HRESULT get_ExtraFile(BSTR*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
}
enum IID_IPMExtensionFileExtensionInfo = GUID(0x6b87cb6c, 0xb88, 0x4989, [0xa4, 0xec, 0x3, 0x37, 0x14, 0xf7, 0x10, 0xd4]);
interface IPMExtensionFileExtensionInfo : IUnknown
{
    HRESULT get_Name(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT get_Logo(PM_LOGO_SIZE, BSTR*);
    HRESULT get_ContentType(BSTR, BSTR*);
    HRESULT get_FileType(BSTR, BSTR*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
    HRESULT get_AllFileTypes(uint*, BSTR**);
}
enum IID_IPMExtensionProtocolInfo = GUID(0x1e3fa036, 0x51eb, 0x4453, [0xba, 0xff, 0xb8, 0xd8, 0xe4, 0xb4, 0x6c, 0x8e]);
interface IPMExtensionProtocolInfo : IUnknown
{
    HRESULT get_Protocol(BSTR*);
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
}
enum IID_IPMExtensionShareTargetInfo = GUID(0x5471f48b, 0xc65c, 0x4656, [0x8c, 0x70, 0x24, 0x2e, 0x31, 0x19, 0x5f, 0xea]);
interface IPMExtensionShareTargetInfo : IUnknown
{
    HRESULT get_AllFileTypes(uint*, BSTR**);
    HRESULT get_AllDataFormats(uint*, BSTR**);
    HRESULT get_SupportsAllFileTypes(BOOL*);
}
enum IID_IPMExtensionContractInfo = GUID(0xe5666373, 0x7ba1, 0x467c, [0xb8, 0x19, 0xb1, 0x75, 0xdb, 0x1c, 0x29, 0x5b]);
interface IPMExtensionContractInfo : IUnknown
{
    HRESULT get_InvocationInfo(BSTR*, BSTR*);
}
enum IID_IPMExtensionFileOpenPickerInfo = GUID(0x6dc91d25, 0x9606, 0x420c, [0x9a, 0x78, 0xe0, 0x34, 0xa3, 0x41, 0x83, 0x45]);
interface IPMExtensionFileOpenPickerInfo : IUnknown
{
    HRESULT get_AllFileTypes(uint*, BSTR**);
    HRESULT get_SupportsAllFileTypes(BOOL*);
}
enum IID_IPMExtensionFileSavePickerInfo = GUID(0x38005cba, 0xf81a, 0x493e, [0xa0, 0xf8, 0x92, 0x2c, 0x86, 0x80, 0xda, 0x43]);
interface IPMExtensionFileSavePickerInfo : IUnknown
{
    HRESULT get_AllFileTypes(uint*, BSTR**);
    HRESULT get_SupportsAllFileTypes(BOOL*);
}
enum IID_IPMExtensionCachedFileUpdaterInfo = GUID(0xe2d77509, 0x4e58, 0x4ba9, [0xaf, 0x7e, 0xb6, 0x42, 0xe3, 0x70, 0xe1, 0xb0]);
interface IPMExtensionCachedFileUpdaterInfo : IUnknown
{
    HRESULT get_SupportsUpdates(BOOL*);
}
enum IID_IPMExtensionInfoEnumerator = GUID(0x403b9e82, 0x1171, 0x4573, [0x8e, 0x6f, 0x6f, 0x33, 0xf3, 0x9b, 0x83, 0xdd]);
interface IPMExtensionInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMExtensionInfo*);
}
enum IID_IPMBackgroundServiceAgentInfo = GUID(0x3a8b46da, 0x928c, 0x4879, [0x99, 0x8c, 0x9, 0xdc, 0x96, 0xf3, 0xd4, 0x90]);
interface IPMBackgroundServiceAgentInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_TaskID(BSTR*);
    HRESULT get_BSAID(uint*);
    HRESULT get_BGSpecifier(BSTR*);
    HRESULT get_BGName(BSTR*);
    HRESULT get_BGSource(BSTR*);
    HRESULT get_BGType(BSTR*);
    HRESULT get_IsPeriodic(BOOL*);
    HRESULT get_IsScheduled(BOOL*);
    HRESULT get_IsScheduleAllowed(BOOL*);
    HRESULT get_Description(BSTR*);
    HRESULT get_IsLaunchOnBoot(BOOL*);
    HRESULT set_IsScheduled(BOOL);
    HRESULT set_IsScheduleAllowed(BOOL);
}
enum IID_IPMBackgroundWorkerInfo = GUID(0x7dd4531b, 0xd3bf, 0x4b6b, [0x94, 0xf3, 0x69, 0xc0, 0x98, 0xb1, 0x49, 0x7d]);
interface IPMBackgroundWorkerInfo : IUnknown
{
    HRESULT get_ProductID(GUID*);
    HRESULT get_TaskID(BSTR*);
    HRESULT get_BGName(BSTR*);
    HRESULT get_MaxStartupLatency(uint*);
    HRESULT get_ExpectedRuntime(uint*);
    HRESULT get_IsBootWorker(BOOL*);
}
enum IID_IPMBackgroundServiceAgentInfoEnumerator = GUID(0x18eb2072, 0xab56, 0x43b3, [0x87, 0x2c, 0xbe, 0xaf, 0xb7, 0xa6, 0xb3, 0x91]);
interface IPMBackgroundServiceAgentInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMBackgroundServiceAgentInfo*);
}
enum IID_IPMBackgroundWorkerInfoEnumerator = GUID(0x87f479f8, 0x90d8, 0x4ec7, [0x92, 0xb9, 0x72, 0x78, 0x7e, 0x2f, 0x63, 0x6b]);
interface IPMBackgroundWorkerInfoEnumerator : IUnknown
{
    HRESULT get_Next(IPMBackgroundWorkerInfo*);
}
alias PPATCH_PROGRESS_CALLBACK = BOOL function(void*, uint, uint);
alias PPATCH_SYMLOAD_CALLBACK = BOOL function(uint, const(char)*, uint, uint, uint, uint, uint, void*);
struct PATCH_IGNORE_RANGE
{
    uint OffsetInOldFile;
    uint LengthInBytes;
}
struct PATCH_RETAIN_RANGE
{
    uint OffsetInOldFile;
    uint LengthInBytes;
    uint OffsetInNewFile;
}
struct PATCH_OLD_FILE_INFO_A
{
    uint SizeOfThisStruct;
    const(char)* OldFileName;
    uint IgnoreRangeCount;
    PATCH_IGNORE_RANGE* IgnoreRangeArray;
    uint RetainRangeCount;
    PATCH_RETAIN_RANGE* RetainRangeArray;
}
struct PATCH_OLD_FILE_INFO_W
{
    uint SizeOfThisStruct;
    const(wchar)* OldFileName;
    uint IgnoreRangeCount;
    PATCH_IGNORE_RANGE* IgnoreRangeArray;
    uint RetainRangeCount;
    PATCH_RETAIN_RANGE* RetainRangeArray;
}
struct PATCH_OLD_FILE_INFO_H
{
    uint SizeOfThisStruct;
    HANDLE OldFileHandle;
    uint IgnoreRangeCount;
    PATCH_IGNORE_RANGE* IgnoreRangeArray;
    uint RetainRangeCount;
    PATCH_RETAIN_RANGE* RetainRangeArray;
}
struct PATCH_OLD_FILE_INFO
{
    uint SizeOfThisStruct;
    union
    {
        const(char)* OldFileNameA;
        const(wchar)* OldFileNameW;
        HANDLE OldFileHandle;
    }
    uint IgnoreRangeCount;
    PATCH_IGNORE_RANGE* IgnoreRangeArray;
    uint RetainRangeCount;
    PATCH_RETAIN_RANGE* RetainRangeArray;
}
struct PATCH_INTERLEAVE_MAP
{
    uint CountRanges;
    struct
    {
        uint OldOffset;
        uint OldLength;
        uint NewLength;
    }
}
struct PATCH_OPTION_DATA
{
    uint SizeOfThisStruct;
    uint SymbolOptionFlags;
    const(char)* NewFileSymbolPath;
    PSTR* OldFileSymbolPathArray;
    uint ExtendedOptionFlags;
    PPATCH_SYMLOAD_CALLBACK SymLoadCallback;
    void* SymLoadContext;
    PATCH_INTERLEAVE_MAP** InterleaveMapArray;
    uint MaxLzxWindowSize;
}
struct DELTA_INPUT
{
    union
    {
        const(void)* lpcStart;
        void* lpStart;
    }
    ulong uSize;
    BOOL Editable;
}
struct DELTA_OUTPUT
{
    void* lpStart;
    ulong uSize;
}
struct DELTA_HASH
{
    uint HashSize;
    ubyte[32] HashValue;
}
struct DELTA_HEADER_INFO
{
    long FileTypeSet;
    long FileType;
    long Flags;
    ulong TargetSize;
    FILETIME TargetFileTime;
    uint TargetHashAlgId;
    DELTA_HASH TargetHash;
}
struct ACTIVATION_CONTEXT_QUERY_INDEX
{
    uint ulAssemblyIndex;
    uint ulFileIndexInAssembly;
}
struct ASSEMBLY_FILE_DETAILED_INFORMATION
{
    uint ulFlags;
    uint ulFilenameLength;
    uint ulPathLength;
    const(wchar)* lpFileName;
    const(wchar)* lpFilePath;
}
struct ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION
{
    uint ulFlags;
    uint ulEncodedAssemblyIdentityLength;
    uint ulManifestPathType;
    uint ulManifestPathLength;
    LARGE_INTEGER liManifestLastWriteTime;
    uint ulPolicyPathType;
    uint ulPolicyPathLength;
    LARGE_INTEGER liPolicyLastWriteTime;
    uint ulMetadataSatelliteRosterIndex;
    uint ulManifestVersionMajor;
    uint ulManifestVersionMinor;
    uint ulPolicyVersionMajor;
    uint ulPolicyVersionMinor;
    uint ulAssemblyDirectoryNameLength;
    const(wchar)* lpAssemblyEncodedAssemblyIdentity;
    const(wchar)* lpAssemblyManifestPath;
    const(wchar)* lpAssemblyPolicyPath;
    const(wchar)* lpAssemblyDirectoryName;
    uint ulFileCount;
}
alias ACTCTX_REQUESTED_RUN_LEVEL = int;
enum : int
{
    ACTCTX_RUN_LEVEL_UNSPECIFIED       = 0x00000000,
    ACTCTX_RUN_LEVEL_AS_INVOKER        = 0x00000001,
    ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE = 0x00000002,
    ACTCTX_RUN_LEVEL_REQUIRE_ADMIN     = 0x00000003,
    ACTCTX_RUN_LEVEL_NUMBERS           = 0x00000004,
}

struct ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION
{
    uint ulFlags;
    ACTCTX_REQUESTED_RUN_LEVEL RunLevel;
    uint UiAccess;
}
alias ACTCTX_COMPATIBILITY_ELEMENT_TYPE = int;
enum : int
{
    ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN          = 0x00000000,
    ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS               = 0x00000001,
    ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION       = 0x00000002,
    ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MAXVERSIONTESTED = 0x00000003,
}

struct COMPATIBILITY_CONTEXT_ELEMENT
{
    GUID Id;
    ACTCTX_COMPATIBILITY_ELEMENT_TYPE Type;
    ulong MaxVersionTested;
}
struct ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION
{
    uint ElementCount;
    COMPATIBILITY_CONTEXT_ELEMENT[1] Elements;
}
struct ACTIVATION_CONTEXT_DETAILED_INFORMATION
{
    uint dwFlags;
    uint ulFormatVersion;
    uint ulAssemblyCount;
    uint ulRootManifestPathType;
    uint ulRootManifestPathChars;
    uint ulRootConfigurationPathType;
    uint ulRootConfigurationPathChars;
    uint ulAppDirPathType;
    uint ulAppDirPathChars;
    const(wchar)* lpRootManifestPath;
    const(wchar)* lpRootConfigurationPath;
    const(wchar)* lpAppDirPath;
}
struct ACTCTXA
{
    uint cbSize;
    uint dwFlags;
    const(char)* lpSource;
    ushort wProcessorArchitecture;
    ushort wLangId;
    const(char)* lpAssemblyDirectory;
    const(char)* lpResourceName;
    const(char)* lpApplicationName;
    HINSTANCE hModule;
}
struct ACTCTXW
{
    uint cbSize;
    uint dwFlags;
    const(wchar)* lpSource;
    ushort wProcessorArchitecture;
    ushort wLangId;
    const(wchar)* lpAssemblyDirectory;
    const(wchar)* lpResourceName;
    const(wchar)* lpApplicationName;
    HINSTANCE hModule;
}
struct ACTCTX_SECTION_KEYED_DATA
{
    uint cbSize;
    uint ulDataFormatVersion;
    void* lpData;
    uint ulLength;
    void* lpSectionGlobalData;
    uint ulSectionGlobalDataLength;
    void* lpSectionBase;
    uint ulSectionTotalLength;
    HANDLE hActCtx;
    uint ulAssemblyRosterIndex;
    uint ulFlags;
    ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA AssemblyMetadata;
}
