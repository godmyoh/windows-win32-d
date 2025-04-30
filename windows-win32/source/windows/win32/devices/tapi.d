module windows.win32.devices.tapi;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, HANDLE, HINSTANCE, HRESULT, HWND, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL, WPARAM;
import windows.win32.media.directshow : ALLOCATOR_PROPERTIES;
import windows.win32.media.mediafoundation : AM_MEDIA_TYPE;
import windows.win32.system.addressbook : IAddrBook, IMAPITable, IMessage, SPropTagArray, SPropValue;
import windows.win32.system.com : CY, IDispatch, IEnumUnknown, IStream, IUnknown;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

int lineAccept(uint hCall, const(char)* lpsUserUserInfo, uint dwSize);
int lineAddProvider(const(char)* lpszProviderFilename, HWND hwndOwner, uint* lpdwPermanentProviderID);
int lineAddProviderA(const(char)* lpszProviderFilename, HWND hwndOwner, uint* lpdwPermanentProviderID);
int lineAddProviderW(const(wchar)* lpszProviderFilename, HWND hwndOwner, uint* lpdwPermanentProviderID);
int lineAddToConference(uint hConfCall, uint hConsultCall);
int lineAgentSpecific(uint hLine, uint dwAddressID, uint dwAgentExtensionIDIndex, void* lpParams, uint dwSize);
int lineAnswer(uint hCall, const(char)* lpsUserUserInfo, uint dwSize);
int lineBlindTransfer(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineBlindTransferA(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineBlindTransferW(uint hCall, const(wchar)* lpszDestAddressW, uint dwCountryCode);
int lineClose(uint hLine);
int lineCompleteCall(uint hCall, uint* lpdwCompletionID, uint dwCompletionMode, uint dwMessageID);
int lineCompleteTransfer(uint hCall, uint hConsultCall, uint* lphConfCall, uint dwTransferMode);
int lineConfigDialog(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass);
int lineConfigDialogA(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass);
int lineConfigDialogW(uint dwDeviceID, HWND hwndOwner, const(wchar)* lpszDeviceClass);
int lineConfigDialogEdit(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass, const(void)* lpDeviceConfigIn, uint dwSize, VARSTRING* lpDeviceConfigOut);
int lineConfigDialogEditA(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass, const(void)* lpDeviceConfigIn, uint dwSize, VARSTRING* lpDeviceConfigOut);
int lineConfigDialogEditW(uint dwDeviceID, HWND hwndOwner, const(wchar)* lpszDeviceClass, const(void)* lpDeviceConfigIn, uint dwSize, VARSTRING* lpDeviceConfigOut);
int lineConfigProvider(HWND hwndOwner, uint dwPermanentProviderID);
int lineCreateAgentW(uint hLine, const(wchar)* lpszAgentID, const(wchar)* lpszAgentPIN, uint* lphAgent);
int lineCreateAgentA(uint hLine, const(char)* lpszAgentID, const(char)* lpszAgentPIN, uint* lphAgent);
int lineCreateAgentSessionW(uint hLine, uint hAgent, const(wchar)* lpszAgentPIN, uint dwWorkingAddressID, GUID* lpGroupID, uint* lphAgentSession);
int lineCreateAgentSessionA(uint hLine, uint hAgent, const(char)* lpszAgentPIN, uint dwWorkingAddressID, GUID* lpGroupID, uint* lphAgentSession);
int lineDeallocateCall(uint hCall);
int lineDevSpecific(uint hLine, uint dwAddressID, uint hCall, void* lpParams, uint dwSize);
int lineDevSpecificFeature(uint hLine, uint dwFeature, void* lpParams, uint dwSize);
int lineDial(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineDialA(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineDialW(uint hCall, const(wchar)* lpszDestAddress, uint dwCountryCode);
int lineDrop(uint hCall, const(char)* lpsUserUserInfo, uint dwSize);
int lineForward(uint hLine, uint bAllAddresses, uint dwAddressID, const(LINEFORWARDLIST)* lpForwardList, uint dwNumRingsNoAnswer, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineForwardA(uint hLine, uint bAllAddresses, uint dwAddressID, const(LINEFORWARDLIST)* lpForwardList, uint dwNumRingsNoAnswer, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineForwardW(uint hLine, uint bAllAddresses, uint dwAddressID, const(LINEFORWARDLIST)* lpForwardList, uint dwNumRingsNoAnswer, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineGatherDigits(uint hCall, uint dwDigitModes, PSTR lpsDigits, uint dwNumDigits, const(char)* lpszTerminationDigits, uint dwFirstDigitTimeout, uint dwInterDigitTimeout);
int lineGatherDigitsA(uint hCall, uint dwDigitModes, PSTR lpsDigits, uint dwNumDigits, const(char)* lpszTerminationDigits, uint dwFirstDigitTimeout, uint dwInterDigitTimeout);
int lineGatherDigitsW(uint hCall, uint dwDigitModes, PWSTR lpsDigits, uint dwNumDigits, const(wchar)* lpszTerminationDigits, uint dwFirstDigitTimeout, uint dwInterDigitTimeout);
int lineGenerateDigits(uint hCall, uint dwDigitMode, const(char)* lpszDigits, uint dwDuration);
int lineGenerateDigitsA(uint hCall, uint dwDigitMode, const(char)* lpszDigits, uint dwDuration);
int lineGenerateDigitsW(uint hCall, uint dwDigitMode, const(wchar)* lpszDigits, uint dwDuration);
int lineGenerateTone(uint hCall, uint dwToneMode, uint dwDuration, uint dwNumTones, const(LINEGENERATETONE)* lpTones);
int lineGetAddressCaps(uint hLineApp, uint dwDeviceID, uint dwAddressID, uint dwAPIVersion, uint dwExtVersion, LINEADDRESSCAPS* lpAddressCaps);
int lineGetAddressCapsA(uint hLineApp, uint dwDeviceID, uint dwAddressID, uint dwAPIVersion, uint dwExtVersion, LINEADDRESSCAPS* lpAddressCaps);
int lineGetAddressCapsW(uint hLineApp, uint dwDeviceID, uint dwAddressID, uint dwAPIVersion, uint dwExtVersion, LINEADDRESSCAPS* lpAddressCaps);
int lineGetAddressID(uint hLine, uint* lpdwAddressID, uint dwAddressMode, const(char)* lpsAddress, uint dwSize);
int lineGetAddressIDA(uint hLine, uint* lpdwAddressID, uint dwAddressMode, const(char)* lpsAddress, uint dwSize);
int lineGetAddressIDW(uint hLine, uint* lpdwAddressID, uint dwAddressMode, const(wchar)* lpsAddress, uint dwSize);
int lineGetAddressStatus(uint hLine, uint dwAddressID, LINEADDRESSSTATUS* lpAddressStatus);
int lineGetAddressStatusA(uint hLine, uint dwAddressID, LINEADDRESSSTATUS* lpAddressStatus);
int lineGetAddressStatusW(uint hLine, uint dwAddressID, LINEADDRESSSTATUS* lpAddressStatus);
int lineGetAgentActivityListA(uint hLine, uint dwAddressID, LINEAGENTACTIVITYLIST* lpAgentActivityList);
int lineGetAgentActivityListW(uint hLine, uint dwAddressID, LINEAGENTACTIVITYLIST* lpAgentActivityList);
int lineGetAgentCapsA(uint hLineApp, uint dwDeviceID, uint dwAddressID, uint dwAppAPIVersion, LINEAGENTCAPS* lpAgentCaps);
int lineGetAgentCapsW(uint hLineApp, uint dwDeviceID, uint dwAddressID, uint dwAppAPIVersion, LINEAGENTCAPS* lpAgentCaps);
int lineGetAgentGroupListA(uint hLine, uint dwAddressID, LINEAGENTGROUPLIST* lpAgentGroupList);
int lineGetAgentGroupListW(uint hLine, uint dwAddressID, LINEAGENTGROUPLIST* lpAgentGroupList);
int lineGetAgentInfo(uint hLine, uint hAgent, LINEAGENTINFO* lpAgentInfo);
int lineGetAgentSessionInfo(uint hLine, uint hAgentSession, LINEAGENTSESSIONINFO* lpAgentSessionInfo);
int lineGetAgentSessionList(uint hLine, uint hAgent, LINEAGENTSESSIONLIST* lpAgentSessionList);
int lineGetAgentStatusA(uint hLine, uint dwAddressID, LINEAGENTSTATUS* lpAgentStatus);
int lineGetAgentStatusW(uint hLine, uint dwAddressID, LINEAGENTSTATUS* lpAgentStatus);
int lineGetAppPriority(const(char)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, VARSTRING* lpExtensionName, uint* lpdwPriority);
int lineGetAppPriorityA(const(char)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, VARSTRING* lpExtensionName, uint* lpdwPriority);
int lineGetAppPriorityW(const(wchar)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, VARSTRING* lpExtensionName, uint* lpdwPriority);
int lineGetCallInfo(uint hCall, LINECALLINFO* lpCallInfo);
int lineGetCallInfoA(uint hCall, LINECALLINFO* lpCallInfo);
int lineGetCallInfoW(uint hCall, LINECALLINFO* lpCallInfo);
int lineGetCallStatus(uint hCall, LINECALLSTATUS* lpCallStatus);
int lineGetConfRelatedCalls(uint hCall, LINECALLLIST* lpCallList);
int lineGetCountry(uint dwCountryID, uint dwAPIVersion, LINECOUNTRYLIST* lpLineCountryList);
int lineGetCountryA(uint dwCountryID, uint dwAPIVersion, LINECOUNTRYLIST* lpLineCountryList);
int lineGetCountryW(uint dwCountryID, uint dwAPIVersion, LINECOUNTRYLIST* lpLineCountryList);
int lineGetDevCaps(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, LINEDEVCAPS* lpLineDevCaps);
int lineGetDevCapsA(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, LINEDEVCAPS* lpLineDevCaps);
int lineGetDevCapsW(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, LINEDEVCAPS* lpLineDevCaps);
int lineGetDevConfig(uint dwDeviceID, VARSTRING* lpDeviceConfig, const(char)* lpszDeviceClass);
int lineGetDevConfigA(uint dwDeviceID, VARSTRING* lpDeviceConfig, const(char)* lpszDeviceClass);
int lineGetDevConfigW(uint dwDeviceID, VARSTRING* lpDeviceConfig, const(wchar)* lpszDeviceClass);
int lineGetGroupListA(uint hLine, LINEAGENTGROUPLIST* lpGroupList);
int lineGetGroupListW(uint hLine, LINEAGENTGROUPLIST* lpGroupList);
int lineGetIcon(uint dwDeviceID, const(char)* lpszDeviceClass, HICON* lphIcon);
int lineGetIconA(uint dwDeviceID, const(char)* lpszDeviceClass, HICON* lphIcon);
int lineGetIconW(uint dwDeviceID, const(wchar)* lpszDeviceClass, HICON* lphIcon);
int lineGetID(uint hLine, uint dwAddressID, uint hCall, uint dwSelect, VARSTRING* lpDeviceID, const(char)* lpszDeviceClass);
int lineGetIDA(uint hLine, uint dwAddressID, uint hCall, uint dwSelect, VARSTRING* lpDeviceID, const(char)* lpszDeviceClass);
int lineGetIDW(uint hLine, uint dwAddressID, uint hCall, uint dwSelect, VARSTRING* lpDeviceID, const(wchar)* lpszDeviceClass);
int lineGetLineDevStatus(uint hLine, LINEDEVSTATUS* lpLineDevStatus);
int lineGetLineDevStatusA(uint hLine, LINEDEVSTATUS* lpLineDevStatus);
int lineGetLineDevStatusW(uint hLine, LINEDEVSTATUS* lpLineDevStatus);
int lineGetMessage(uint hLineApp, LINEMESSAGE* lpMessage, uint dwTimeout);
int lineGetNewCalls(uint hLine, uint dwAddressID, uint dwSelect, LINECALLLIST* lpCallList);
int lineGetNumRings(uint hLine, uint dwAddressID, uint* lpdwNumRings);
int lineGetProviderList(uint dwAPIVersion, LINEPROVIDERLIST* lpProviderList);
int lineGetProviderListA(uint dwAPIVersion, LINEPROVIDERLIST* lpProviderList);
int lineGetProviderListW(uint dwAPIVersion, LINEPROVIDERLIST* lpProviderList);
int lineGetProxyStatus(uint hLineApp, uint dwDeviceID, uint dwAppAPIVersion, LINEPROXYREQUESTLIST* lpLineProxyReqestList);
int lineGetQueueInfo(uint hLine, uint dwQueueID, LINEQUEUEINFO* lpLineQueueInfo);
int lineGetQueueListA(uint hLine, GUID* lpGroupID, LINEQUEUELIST* lpQueueList);
int lineGetQueueListW(uint hLine, GUID* lpGroupID, LINEQUEUELIST* lpQueueList);
int lineGetRequest(uint hLineApp, uint dwRequestMode, void* lpRequestBuffer);
int lineGetRequestA(uint hLineApp, uint dwRequestMode, void* lpRequestBuffer);
int lineGetRequestW(uint hLineApp, uint dwRequestMode, void* lpRequestBuffer);
int lineGetStatusMessages(uint hLine, uint* lpdwLineStates, uint* lpdwAddressStates);
int lineGetTranslateCaps(uint hLineApp, uint dwAPIVersion, LINETRANSLATECAPS* lpTranslateCaps);
int lineGetTranslateCapsA(uint hLineApp, uint dwAPIVersion, LINETRANSLATECAPS* lpTranslateCaps);
int lineGetTranslateCapsW(uint hLineApp, uint dwAPIVersion, LINETRANSLATECAPS* lpTranslateCaps);
int lineHandoff(uint hCall, const(char)* lpszFileName, uint dwMediaMode);
int lineHandoffA(uint hCall, const(char)* lpszFileName, uint dwMediaMode);
int lineHandoffW(uint hCall, const(wchar)* lpszFileName, uint dwMediaMode);
int lineHold(uint hCall);
int lineInitialize(uint* lphLineApp, HINSTANCE hInstance, LINECALLBACK lpfnCallback, const(char)* lpszAppName, uint* lpdwNumDevs);
int lineInitializeExA(uint* lphLineApp, HINSTANCE hInstance, LINECALLBACK lpfnCallback, const(char)* lpszFriendlyAppName, uint* lpdwNumDevs, uint* lpdwAPIVersion, LINEINITIALIZEEXPARAMS* lpLineInitializeExParams);
int lineInitializeExW(uint* lphLineApp, HINSTANCE hInstance, LINECALLBACK lpfnCallback, const(wchar)* lpszFriendlyAppName, uint* lpdwNumDevs, uint* lpdwAPIVersion, LINEINITIALIZEEXPARAMS* lpLineInitializeExParams);
int lineMakeCall(uint hLine, uint* lphCall, const(char)* lpszDestAddress, uint dwCountryCode, const(LINECALLPARAMS)* lpCallParams);
int lineMakeCallA(uint hLine, uint* lphCall, const(char)* lpszDestAddress, uint dwCountryCode, const(LINECALLPARAMS)* lpCallParams);
int lineMakeCallW(uint hLine, uint* lphCall, const(wchar)* lpszDestAddress, uint dwCountryCode, const(LINECALLPARAMS)* lpCallParams);
int lineMonitorDigits(uint hCall, uint dwDigitModes);
int lineMonitorMedia(uint hCall, uint dwMediaModes);
int lineMonitorTones(uint hCall, const(LINEMONITORTONE)* lpToneList, uint dwNumEntries);
int lineNegotiateAPIVersion(uint hLineApp, uint dwDeviceID, uint dwAPILowVersion, uint dwAPIHighVersion, uint* lpdwAPIVersion, LINEEXTENSIONID* lpExtensionID);
int lineNegotiateExtVersion(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtLowVersion, uint dwExtHighVersion, uint* lpdwExtVersion);
int lineOpen(uint hLineApp, uint dwDeviceID, uint* lphLine, uint dwAPIVersion, uint dwExtVersion, ulong dwCallbackInstance, uint dwPrivileges, uint dwMediaModes, const(LINECALLPARAMS)* lpCallParams);
int lineOpenA(uint hLineApp, uint dwDeviceID, uint* lphLine, uint dwAPIVersion, uint dwExtVersion, ulong dwCallbackInstance, uint dwPrivileges, uint dwMediaModes, const(LINECALLPARAMS)* lpCallParams);
int lineOpenW(uint hLineApp, uint dwDeviceID, uint* lphLine, uint dwAPIVersion, uint dwExtVersion, ulong dwCallbackInstance, uint dwPrivileges, uint dwMediaModes, const(LINECALLPARAMS)* lpCallParams);
int linePark(uint hCall, uint dwParkMode, const(char)* lpszDirAddress, VARSTRING* lpNonDirAddress);
int lineParkA(uint hCall, uint dwParkMode, const(char)* lpszDirAddress, VARSTRING* lpNonDirAddress);
int lineParkW(uint hCall, uint dwParkMode, const(wchar)* lpszDirAddress, VARSTRING* lpNonDirAddress);
int linePickup(uint hLine, uint dwAddressID, uint* lphCall, const(char)* lpszDestAddress, const(char)* lpszGroupID);
int linePickupA(uint hLine, uint dwAddressID, uint* lphCall, const(char)* lpszDestAddress, const(char)* lpszGroupID);
int linePickupW(uint hLine, uint dwAddressID, uint* lphCall, const(wchar)* lpszDestAddress, const(wchar)* lpszGroupID);
int linePrepareAddToConference(uint hConfCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int linePrepareAddToConferenceA(uint hConfCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int linePrepareAddToConferenceW(uint hConfCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineProxyMessage(uint hLine, uint hCall, uint dwMsg, uint dwParam1, uint dwParam2, uint dwParam3);
int lineProxyResponse(uint hLine, LINEPROXYREQUEST* lpProxyRequest, uint dwResult);
int lineRedirect(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineRedirectA(uint hCall, const(char)* lpszDestAddress, uint dwCountryCode);
int lineRedirectW(uint hCall, const(wchar)* lpszDestAddress, uint dwCountryCode);
int lineRegisterRequestRecipient(uint hLineApp, uint dwRegistrationInstance, uint dwRequestMode, uint bEnable);
int lineReleaseUserUserInfo(uint hCall);
int lineRemoveFromConference(uint hCall);
int lineRemoveProvider(uint dwPermanentProviderID, HWND hwndOwner);
int lineSecureCall(uint hCall);
int lineSendUserUserInfo(uint hCall, const(char)* lpsUserUserInfo, uint dwSize);
int lineSetAgentActivity(uint hLine, uint dwAddressID, uint dwActivityID);
int lineSetAgentGroup(uint hLine, uint dwAddressID, LINEAGENTGROUPLIST* lpAgentGroupList);
int lineSetAgentMeasurementPeriod(uint hLine, uint hAgent, uint dwMeasurementPeriod);
int lineSetAgentSessionState(uint hLine, uint hAgentSession, uint dwAgentSessionState, uint dwNextAgentSessionState);
int lineSetAgentStateEx(uint hLine, uint hAgent, uint dwAgentState, uint dwNextAgentState);
int lineSetAgentState(uint hLine, uint dwAddressID, uint dwAgentState, uint dwNextAgentState);
int lineSetAppPriority(const(char)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, const(char)* lpszExtensionName, uint dwPriority);
int lineSetAppPriorityA(const(char)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, const(char)* lpszExtensionName, uint dwPriority);
int lineSetAppPriorityW(const(wchar)* lpszAppFilename, uint dwMediaMode, LINEEXTENSIONID* lpExtensionID, uint dwRequestMode, const(wchar)* lpszExtensionName, uint dwPriority);
int lineSetAppSpecific(uint hCall, uint dwAppSpecific);
int lineSetCallData(uint hCall, void* lpCallData, uint dwSize);
int lineSetCallParams(uint hCall, uint dwBearerMode, uint dwMinRate, uint dwMaxRate, const(LINEDIALPARAMS)* lpDialParams);
int lineSetCallPrivilege(uint hCall, uint dwCallPrivilege);
int lineSetCallQualityOfService(uint hCall, void* lpSendingFlowspec, uint dwSendingFlowspecSize, void* lpReceivingFlowspec, uint dwReceivingFlowspecSize);
int lineSetCallTreatment(uint hCall, uint dwTreatment);
int lineSetCurrentLocation(uint hLineApp, uint dwLocation);
int lineSetDevConfig(uint dwDeviceID, const(void)* lpDeviceConfig, uint dwSize, const(char)* lpszDeviceClass);
int lineSetDevConfigA(uint dwDeviceID, const(void)* lpDeviceConfig, uint dwSize, const(char)* lpszDeviceClass);
int lineSetDevConfigW(uint dwDeviceID, const(void)* lpDeviceConfig, uint dwSize, const(wchar)* lpszDeviceClass);
int lineSetLineDevStatus(uint hLine, uint dwStatusToChange, uint fStatus);
int lineSetMediaControl(uint hLine, uint dwAddressID, uint hCall, uint dwSelect, const(LINEMEDIACONTROLDIGIT)* lpDigitList, uint dwDigitNumEntries, const(LINEMEDIACONTROLMEDIA)* lpMediaList, uint dwMediaNumEntries, const(LINEMEDIACONTROLTONE)* lpToneList, uint dwToneNumEntries, const(LINEMEDIACONTROLCALLSTATE)* lpCallStateList, uint dwCallStateNumEntries);
int lineSetMediaMode(uint hCall, uint dwMediaModes);
int lineSetQueueMeasurementPeriod(uint hLine, uint dwQueueID, uint dwMeasurementPeriod);
int lineSetNumRings(uint hLine, uint dwAddressID, uint dwNumRings);
int lineSetStatusMessages(uint hLine, uint dwLineStates, uint dwAddressStates);
int lineSetTerminal(uint hLine, uint dwAddressID, uint hCall, uint dwSelect, uint dwTerminalModes, uint dwTerminalID, uint bEnable);
int lineSetTollList(uint hLineApp, uint dwDeviceID, const(char)* lpszAddressIn, uint dwTollListOption);
int lineSetTollListA(uint hLineApp, uint dwDeviceID, const(char)* lpszAddressIn, uint dwTollListOption);
int lineSetTollListW(uint hLineApp, uint dwDeviceID, const(wchar)* lpszAddressInW, uint dwTollListOption);
int lineSetupConference(uint hCall, uint hLine, uint* lphConfCall, uint* lphConsultCall, uint dwNumParties, const(LINECALLPARAMS)* lpCallParams);
int lineSetupConferenceA(uint hCall, uint hLine, uint* lphConfCall, uint* lphConsultCall, uint dwNumParties, const(LINECALLPARAMS)* lpCallParams);
int lineSetupConferenceW(uint hCall, uint hLine, uint* lphConfCall, uint* lphConsultCall, uint dwNumParties, const(LINECALLPARAMS)* lpCallParams);
int lineSetupTransfer(uint hCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineSetupTransferA(uint hCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineSetupTransferW(uint hCall, uint* lphConsultCall, const(LINECALLPARAMS)* lpCallParams);
int lineShutdown(uint hLineApp);
int lineSwapHold(uint hActiveCall, uint hHeldCall);
int lineTranslateAddress(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, const(char)* lpszAddressIn, uint dwCard, uint dwTranslateOptions, LINETRANSLATEOUTPUT* lpTranslateOutput);
int lineTranslateAddressA(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, const(char)* lpszAddressIn, uint dwCard, uint dwTranslateOptions, LINETRANSLATEOUTPUT* lpTranslateOutput);
int lineTranslateAddressW(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, const(wchar)* lpszAddressIn, uint dwCard, uint dwTranslateOptions, LINETRANSLATEOUTPUT* lpTranslateOutput);
int lineTranslateDialog(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, HWND hwndOwner, const(char)* lpszAddressIn);
int lineTranslateDialogA(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, HWND hwndOwner, const(char)* lpszAddressIn);
int lineTranslateDialogW(uint hLineApp, uint dwDeviceID, uint dwAPIVersion, HWND hwndOwner, const(wchar)* lpszAddressIn);
int lineUncompleteCall(uint hLine, uint dwCompletionID);
int lineUnhold(uint hCall);
int lineUnpark(uint hLine, uint dwAddressID, uint* lphCall, const(char)* lpszDestAddress);
int lineUnparkA(uint hLine, uint dwAddressID, uint* lphCall, const(char)* lpszDestAddress);
int lineUnparkW(uint hLine, uint dwAddressID, uint* lphCall, const(wchar)* lpszDestAddress);
int phoneClose(uint hPhone);
int phoneConfigDialog(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass);
int phoneConfigDialogA(uint dwDeviceID, HWND hwndOwner, const(char)* lpszDeviceClass);
int phoneConfigDialogW(uint dwDeviceID, HWND hwndOwner, const(wchar)* lpszDeviceClass);
int phoneDevSpecific(uint hPhone, void* lpParams, uint dwSize);
int phoneGetButtonInfo(uint hPhone, uint dwButtonLampID, PHONEBUTTONINFO* lpButtonInfo);
int phoneGetButtonInfoA(uint hPhone, uint dwButtonLampID, PHONEBUTTONINFO* lpButtonInfo);
int phoneGetButtonInfoW(uint hPhone, uint dwButtonLampID, PHONEBUTTONINFO* lpButtonInfo);
int phoneGetData(uint hPhone, uint dwDataID, void* lpData, uint dwSize);
int phoneGetDevCaps(uint hPhoneApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, PHONECAPS* lpPhoneCaps);
int phoneGetDevCapsA(uint hPhoneApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, PHONECAPS* lpPhoneCaps);
int phoneGetDevCapsW(uint hPhoneApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtVersion, PHONECAPS* lpPhoneCaps);
int phoneGetDisplay(uint hPhone, VARSTRING* lpDisplay);
int phoneGetGain(uint hPhone, uint dwHookSwitchDev, uint* lpdwGain);
int phoneGetHookSwitch(uint hPhone, uint* lpdwHookSwitchDevs);
int phoneGetIcon(uint dwDeviceID, const(char)* lpszDeviceClass, HICON* lphIcon);
int phoneGetIconA(uint dwDeviceID, const(char)* lpszDeviceClass, HICON* lphIcon);
int phoneGetIconW(uint dwDeviceID, const(wchar)* lpszDeviceClass, HICON* lphIcon);
int phoneGetID(uint hPhone, VARSTRING* lpDeviceID, const(char)* lpszDeviceClass);
int phoneGetIDA(uint hPhone, VARSTRING* lpDeviceID, const(char)* lpszDeviceClass);
int phoneGetIDW(uint hPhone, VARSTRING* lpDeviceID, const(wchar)* lpszDeviceClass);
int phoneGetLamp(uint hPhone, uint dwButtonLampID, uint* lpdwLampMode);
int phoneGetMessage(uint hPhoneApp, PHONEMESSAGE* lpMessage, uint dwTimeout);
int phoneGetRing(uint hPhone, uint* lpdwRingMode, uint* lpdwVolume);
int phoneGetStatus(uint hPhone, PHONESTATUS* lpPhoneStatus);
int phoneGetStatusA(uint hPhone, PHONESTATUS* lpPhoneStatus);
int phoneGetStatusW(uint hPhone, PHONESTATUS* lpPhoneStatus);
int phoneGetStatusMessages(uint hPhone, uint* lpdwPhoneStates, uint* lpdwButtonModes, uint* lpdwButtonStates);
int phoneGetVolume(uint hPhone, uint dwHookSwitchDev, uint* lpdwVolume);
int phoneInitialize(uint* lphPhoneApp, HINSTANCE hInstance, PHONECALLBACK lpfnCallback, const(char)* lpszAppName, uint* lpdwNumDevs);
int phoneInitializeExA(uint* lphPhoneApp, HINSTANCE hInstance, PHONECALLBACK lpfnCallback, const(char)* lpszFriendlyAppName, uint* lpdwNumDevs, uint* lpdwAPIVersion, PHONEINITIALIZEEXPARAMS* lpPhoneInitializeExParams);
int phoneInitializeExW(uint* lphPhoneApp, HINSTANCE hInstance, PHONECALLBACK lpfnCallback, const(wchar)* lpszFriendlyAppName, uint* lpdwNumDevs, uint* lpdwAPIVersion, PHONEINITIALIZEEXPARAMS* lpPhoneInitializeExParams);
int phoneNegotiateAPIVersion(uint hPhoneApp, uint dwDeviceID, uint dwAPILowVersion, uint dwAPIHighVersion, uint* lpdwAPIVersion, PHONEEXTENSIONID* lpExtensionID);
int phoneNegotiateExtVersion(uint hPhoneApp, uint dwDeviceID, uint dwAPIVersion, uint dwExtLowVersion, uint dwExtHighVersion, uint* lpdwExtVersion);
int phoneOpen(uint hPhoneApp, uint dwDeviceID, uint* lphPhone, uint dwAPIVersion, uint dwExtVersion, ulong dwCallbackInstance, uint dwPrivilege);
int phoneSetButtonInfo(uint hPhone, uint dwButtonLampID, const(PHONEBUTTONINFO)* lpButtonInfo);
int phoneSetButtonInfoA(uint hPhone, uint dwButtonLampID, const(PHONEBUTTONINFO)* lpButtonInfo);
int phoneSetButtonInfoW(uint hPhone, uint dwButtonLampID, const(PHONEBUTTONINFO)* lpButtonInfo);
int phoneSetData(uint hPhone, uint dwDataID, const(void)* lpData, uint dwSize);
int phoneSetDisplay(uint hPhone, uint dwRow, uint dwColumn, const(char)* lpsDisplay, uint dwSize);
int phoneSetGain(uint hPhone, uint dwHookSwitchDev, uint dwGain);
int phoneSetHookSwitch(uint hPhone, uint dwHookSwitchDevs, uint dwHookSwitchMode);
int phoneSetLamp(uint hPhone, uint dwButtonLampID, uint dwLampMode);
int phoneSetRing(uint hPhone, uint dwRingMode, uint dwVolume);
int phoneSetStatusMessages(uint hPhone, uint dwPhoneStates, uint dwButtonModes, uint dwButtonStates);
int phoneSetVolume(uint hPhone, uint dwHookSwitchDev, uint dwVolume);
int phoneShutdown(uint hPhoneApp);
int tapiGetLocationInfo(PSTR lpszCountryCode, PSTR lpszCityCode);
int tapiGetLocationInfoA(PSTR lpszCountryCode, PSTR lpszCityCode);
int tapiGetLocationInfoW(PWSTR lpszCountryCodeW, PWSTR lpszCityCodeW);
int tapiRequestDrop(HWND hwnd, WPARAM wRequestID);
int tapiRequestMakeCall(const(char)* lpszDestAddress, const(char)* lpszAppName, const(char)* lpszCalledParty, const(char)* lpszComment);
int tapiRequestMakeCallA(const(char)* lpszDestAddress, const(char)* lpszAppName, const(char)* lpszCalledParty, const(char)* lpszComment);
int tapiRequestMakeCallW(const(wchar)* lpszDestAddress, const(wchar)* lpszAppName, const(wchar)* lpszCalledParty, const(wchar)* lpszComment);
int tapiRequestMediaCall(HWND hwnd, WPARAM wRequestID, const(char)* lpszDeviceClass, const(char)* lpDeviceID, uint dwSize, uint dwSecure, const(char)* lpszDestAddress, const(char)* lpszAppName, const(char)* lpszCalledParty, const(char)* lpszComment);
int tapiRequestMediaCallA(HWND hwnd, WPARAM wRequestID, const(char)* lpszDeviceClass, const(char)* lpDeviceID, uint dwSize, uint dwSecure, const(char)* lpszDestAddress, const(char)* lpszAppName, const(char)* lpszCalledParty, const(char)* lpszComment);
int tapiRequestMediaCallW(HWND hwnd, WPARAM wRequestID, const(wchar)* lpszDeviceClass, const(wchar)* lpDeviceID, uint dwSize, uint dwSecure, const(wchar)* lpszDestAddress, const(wchar)* lpszAppName, const(wchar)* lpszCalledParty, const(wchar)* lpszComment);
HRESULT OpenTnefStream(void* lpvSupport, IStream lpStream, byte* lpszStreamName, uint ulFlags, IMessage lpMessage, ushort wKeyVal, ITnef* lppTNEF);
HRESULT OpenTnefStreamEx(void* lpvSupport, IStream lpStream, byte* lpszStreamName, uint ulFlags, IMessage lpMessage, ushort wKeyVal, IAddrBook lpAdressBook, ITnef* lppTNEF);
HRESULT GetTnefStreamCodepage(IStream lpStream, uint* lpulCodepage, uint* lpulSubCodepage);
enum TAPI_CURRENT_VERSION = 0x00020002;
enum LINE_ADDRESSSTATE = 0x00000000;
enum LINE_CALLINFO = 0x00000001;
enum LINE_CALLSTATE = 0x00000002;
enum LINE_CLOSE = 0x00000003;
enum LINE_DEVSPECIFIC = 0x00000004;
enum LINE_DEVSPECIFICFEATURE = 0x00000005;
enum LINE_GATHERDIGITS = 0x00000006;
enum LINE_GENERATE = 0x00000007;
enum LINE_LINEDEVSTATE = 0x00000008;
enum LINE_MONITORDIGITS = 0x00000009;
enum LINE_MONITORMEDIA = 0x0000000a;
enum LINE_MONITORTONE = 0x0000000b;
enum LINE_REPLY = 0x0000000c;
enum LINE_REQUEST = 0x0000000d;
enum PHONE_BUTTON = 0x0000000e;
enum PHONE_CLOSE = 0x0000000f;
enum PHONE_DEVSPECIFIC = 0x00000010;
enum PHONE_REPLY = 0x00000011;
enum PHONE_STATE = 0x00000012;
enum LINE_CREATE = 0x00000013;
enum PHONE_CREATE = 0x00000014;
enum LINE_AGENTSPECIFIC = 0x00000015;
enum LINE_AGENTSTATUS = 0x00000016;
enum LINE_APPNEWCALL = 0x00000017;
enum LINE_PROXYREQUEST = 0x00000018;
enum LINE_REMOVE = 0x00000019;
enum PHONE_REMOVE = 0x0000001a;
enum LINE_AGENTSESSIONSTATUS = 0x0000001b;
enum LINE_QUEUESTATUS = 0x0000001c;
enum LINE_AGENTSTATUSEX = 0x0000001d;
enum LINE_GROUPSTATUS = 0x0000001e;
enum LINE_PROXYSTATUS = 0x0000001f;
enum LINE_APPNEWCALLHUB = 0x00000020;
enum LINE_CALLHUBCLOSE = 0x00000021;
enum LINE_DEVSPECIFICEX = 0x00000022;
enum INITIALIZE_NEGOTIATION = 0xffffffff;
enum LINEADDRCAPFLAGS_FWDNUMRINGS = 0x00000001;
enum LINEADDRCAPFLAGS_PICKUPGROUPID = 0x00000002;
enum LINEADDRCAPFLAGS_SECURE = 0x00000004;
enum LINEADDRCAPFLAGS_BLOCKIDDEFAULT = 0x00000008;
enum LINEADDRCAPFLAGS_BLOCKIDOVERRIDE = 0x00000010;
enum LINEADDRCAPFLAGS_DIALED = 0x00000020;
enum LINEADDRCAPFLAGS_ORIGOFFHOOK = 0x00000040;
enum LINEADDRCAPFLAGS_DESTOFFHOOK = 0x00000080;
enum LINEADDRCAPFLAGS_FWDCONSULT = 0x00000100;
enum LINEADDRCAPFLAGS_SETUPCONFNULL = 0x00000200;
enum LINEADDRCAPFLAGS_AUTORECONNECT = 0x00000400;
enum LINEADDRCAPFLAGS_COMPLETIONID = 0x00000800;
enum LINEADDRCAPFLAGS_TRANSFERHELD = 0x00001000;
enum LINEADDRCAPFLAGS_TRANSFERMAKE = 0x00002000;
enum LINEADDRCAPFLAGS_CONFERENCEHELD = 0x00004000;
enum LINEADDRCAPFLAGS_CONFERENCEMAKE = 0x00008000;
enum LINEADDRCAPFLAGS_PARTIALDIAL = 0x00010000;
enum LINEADDRCAPFLAGS_FWDSTATUSVALID = 0x00020000;
enum LINEADDRCAPFLAGS_FWDINTEXTADDR = 0x00040000;
enum LINEADDRCAPFLAGS_FWDBUSYNAADDR = 0x00080000;
enum LINEADDRCAPFLAGS_ACCEPTTOALERT = 0x00100000;
enum LINEADDRCAPFLAGS_CONFDROP = 0x00200000;
enum LINEADDRCAPFLAGS_PICKUPCALLWAIT = 0x00400000;
enum LINEADDRCAPFLAGS_PREDICTIVEDIALER = 0x00800000;
enum LINEADDRCAPFLAGS_QUEUE = 0x01000000;
enum LINEADDRCAPFLAGS_ROUTEPOINT = 0x02000000;
enum LINEADDRCAPFLAGS_HOLDMAKESNEW = 0x04000000;
enum LINEADDRCAPFLAGS_NOINTERNALCALLS = 0x08000000;
enum LINEADDRCAPFLAGS_NOEXTERNALCALLS = 0x10000000;
enum LINEADDRCAPFLAGS_SETCALLINGID = 0x20000000;
enum LINEADDRCAPFLAGS_ACDGROUP = 0x40000000;
enum LINEADDRCAPFLAGS_NOPSTNADDRESSTRANSLATION = 0x80000000;
enum LINEADDRESSMODE_ADDRESSID = 0x00000001;
enum LINEADDRESSMODE_DIALABLEADDR = 0x00000002;
enum LINEADDRESSSHARING_PRIVATE = 0x00000001;
enum LINEADDRESSSHARING_BRIDGEDEXCL = 0x00000002;
enum LINEADDRESSSHARING_BRIDGEDNEW = 0x00000004;
enum LINEADDRESSSHARING_BRIDGEDSHARED = 0x00000008;
enum LINEADDRESSSHARING_MONITORED = 0x00000010;
enum LINEADDRESSSTATE_OTHER = 0x00000001;
enum LINEADDRESSSTATE_DEVSPECIFIC = 0x00000002;
enum LINEADDRESSSTATE_INUSEZERO = 0x00000004;
enum LINEADDRESSSTATE_INUSEONE = 0x00000008;
enum LINEADDRESSSTATE_INUSEMANY = 0x00000010;
enum LINEADDRESSSTATE_NUMCALLS = 0x00000020;
enum LINEADDRESSSTATE_FORWARD = 0x00000040;
enum LINEADDRESSSTATE_TERMINALS = 0x00000080;
enum LINEADDRESSSTATE_CAPSCHANGE = 0x00000100;
enum LINEADDRESSTYPE_PHONENUMBER = 0x00000001;
enum LINEADDRESSTYPE_SDP = 0x00000002;
enum LINEADDRESSTYPE_EMAILNAME = 0x00000004;
enum LINEADDRESSTYPE_DOMAINNAME = 0x00000008;
enum LINEADDRESSTYPE_IPADDRESS = 0x00000010;
enum LINEADDRFEATURE_FORWARD = 0x00000001;
enum LINEADDRFEATURE_MAKECALL = 0x00000002;
enum LINEADDRFEATURE_PICKUP = 0x00000004;
enum LINEADDRFEATURE_SETMEDIACONTROL = 0x00000008;
enum LINEADDRFEATURE_SETTERMINAL = 0x00000010;
enum LINEADDRFEATURE_SETUPCONF = 0x00000020;
enum LINEADDRFEATURE_UNCOMPLETECALL = 0x00000040;
enum LINEADDRFEATURE_UNPARK = 0x00000080;
enum LINEADDRFEATURE_PICKUPHELD = 0x00000100;
enum LINEADDRFEATURE_PICKUPGROUP = 0x00000200;
enum LINEADDRFEATURE_PICKUPDIRECT = 0x00000400;
enum LINEADDRFEATURE_PICKUPWAITING = 0x00000800;
enum LINEADDRFEATURE_FORWARDFWD = 0x00001000;
enum LINEADDRFEATURE_FORWARDDND = 0x00002000;
enum LINEAGENTFEATURE_SETAGENTGROUP = 0x00000001;
enum LINEAGENTFEATURE_SETAGENTSTATE = 0x00000002;
enum LINEAGENTFEATURE_SETAGENTACTIVITY = 0x00000004;
enum LINEAGENTFEATURE_AGENTSPECIFIC = 0x00000008;
enum LINEAGENTFEATURE_GETAGENTACTIVITYLIST = 0x00000010;
enum LINEAGENTFEATURE_GETAGENTGROUP = 0x00000020;
enum LINEAGENTSTATE_LOGGEDOFF = 0x00000001;
enum LINEAGENTSTATE_NOTREADY = 0x00000002;
enum LINEAGENTSTATE_READY = 0x00000004;
enum LINEAGENTSTATE_BUSYACD = 0x00000008;
enum LINEAGENTSTATE_BUSYINCOMING = 0x00000010;
enum LINEAGENTSTATE_BUSYOUTBOUND = 0x00000020;
enum LINEAGENTSTATE_BUSYOTHER = 0x00000040;
enum LINEAGENTSTATE_WORKINGAFTERCALL = 0x00000080;
enum LINEAGENTSTATE_UNKNOWN = 0x00000100;
enum LINEAGENTSTATE_UNAVAIL = 0x00000200;
enum LINEAGENTSTATUS_GROUP = 0x00000001;
enum LINEAGENTSTATUS_STATE = 0x00000002;
enum LINEAGENTSTATUS_NEXTSTATE = 0x00000004;
enum LINEAGENTSTATUS_ACTIVITY = 0x00000008;
enum LINEAGENTSTATUS_ACTIVITYLIST = 0x00000010;
enum LINEAGENTSTATUS_GROUPLIST = 0x00000020;
enum LINEAGENTSTATUS_CAPSCHANGE = 0x00000040;
enum LINEAGENTSTATUS_VALIDSTATES = 0x00000080;
enum LINEAGENTSTATUS_VALIDNEXTSTATES = 0x00000100;
enum LINEAGENTSTATEEX_NOTREADY = 0x00000001;
enum LINEAGENTSTATEEX_READY = 0x00000002;
enum LINEAGENTSTATEEX_BUSYACD = 0x00000004;
enum LINEAGENTSTATEEX_BUSYINCOMING = 0x00000008;
enum LINEAGENTSTATEEX_BUSYOUTGOING = 0x00000010;
enum LINEAGENTSTATEEX_UNKNOWN = 0x00000020;
enum LINEAGENTSTATEEX_RELEASED = 0x00000040;
enum LINEAGENTSTATUSEX_NEWAGENT = 0x00000001;
enum LINEAGENTSTATUSEX_STATE = 0x00000002;
enum LINEAGENTSTATUSEX_UPDATEINFO = 0x00000004;
enum LINEAGENTSESSIONSTATE_NOTREADY = 0x00000001;
enum LINEAGENTSESSIONSTATE_READY = 0x00000002;
enum LINEAGENTSESSIONSTATE_BUSYONCALL = 0x00000004;
enum LINEAGENTSESSIONSTATE_BUSYWRAPUP = 0x00000008;
enum LINEAGENTSESSIONSTATE_ENDED = 0x00000010;
enum LINEAGENTSESSIONSTATE_RELEASED = 0x00000020;
enum LINEAGENTSESSIONSTATUS_NEWSESSION = 0x00000001;
enum LINEAGENTSESSIONSTATUS_STATE = 0x00000002;
enum LINEAGENTSESSIONSTATUS_UPDATEINFO = 0x00000004;
enum LINEQUEUESTATUS_UPDATEINFO = 0x00000001;
enum LINEQUEUESTATUS_NEWQUEUE = 0x00000002;
enum LINEQUEUESTATUS_QUEUEREMOVED = 0x00000004;
enum LINEGROUPSTATUS_NEWGROUP = 0x00000001;
enum LINEGROUPSTATUS_GROUPREMOVED = 0x00000002;
enum LINEPROXYSTATUS_OPEN = 0x00000001;
enum LINEPROXYSTATUS_CLOSE = 0x00000002;
enum LINEPROXYSTATUS_ALLOPENFORACD = 0x00000004;
enum LINEANSWERMODE_NONE = 0x00000001;
enum LINEANSWERMODE_DROP = 0x00000002;
enum LINEANSWERMODE_HOLD = 0x00000004;
enum LINEBEARERMODE_VOICE = 0x00000001;
enum LINEBEARERMODE_SPEECH = 0x00000002;
enum LINEBEARERMODE_MULTIUSE = 0x00000004;
enum LINEBEARERMODE_DATA = 0x00000008;
enum LINEBEARERMODE_ALTSPEECHDATA = 0x00000010;
enum LINEBEARERMODE_NONCALLSIGNALING = 0x00000020;
enum LINEBEARERMODE_PASSTHROUGH = 0x00000040;
enum LINEBEARERMODE_RESTRICTEDDATA = 0x00000080;
enum LINEBUSYMODE_STATION = 0x00000001;
enum LINEBUSYMODE_TRUNK = 0x00000002;
enum LINEBUSYMODE_UNKNOWN = 0x00000004;
enum LINEBUSYMODE_UNAVAIL = 0x00000008;
enum LINECALLCOMPLCOND_BUSY = 0x00000001;
enum LINECALLCOMPLCOND_NOANSWER = 0x00000002;
enum LINECALLCOMPLMODE_CAMPON = 0x00000001;
enum LINECALLCOMPLMODE_CALLBACK = 0x00000002;
enum LINECALLCOMPLMODE_INTRUDE = 0x00000004;
enum LINECALLCOMPLMODE_MESSAGE = 0x00000008;
enum LINECALLFEATURE_ACCEPT = 0x00000001;
enum LINECALLFEATURE_ADDTOCONF = 0x00000002;
enum LINECALLFEATURE_ANSWER = 0x00000004;
enum LINECALLFEATURE_BLINDTRANSFER = 0x00000008;
enum LINECALLFEATURE_COMPLETECALL = 0x00000010;
enum LINECALLFEATURE_COMPLETETRANSF = 0x00000020;
enum LINECALLFEATURE_DIAL = 0x00000040;
enum LINECALLFEATURE_DROP = 0x00000080;
enum LINECALLFEATURE_GATHERDIGITS = 0x00000100;
enum LINECALLFEATURE_GENERATEDIGITS = 0x00000200;
enum LINECALLFEATURE_GENERATETONE = 0x00000400;
enum LINECALLFEATURE_HOLD = 0x00000800;
enum LINECALLFEATURE_MONITORDIGITS = 0x00001000;
enum LINECALLFEATURE_MONITORMEDIA = 0x00002000;
enum LINECALLFEATURE_MONITORTONES = 0x00004000;
enum LINECALLFEATURE_PARK = 0x00008000;
enum LINECALLFEATURE_PREPAREADDCONF = 0x00010000;
enum LINECALLFEATURE_REDIRECT = 0x00020000;
enum LINECALLFEATURE_REMOVEFROMCONF = 0x00040000;
enum LINECALLFEATURE_SECURECALL = 0x00080000;
enum LINECALLFEATURE_SENDUSERUSER = 0x00100000;
enum LINECALLFEATURE_SETCALLPARAMS = 0x00200000;
enum LINECALLFEATURE_SETMEDIACONTROL = 0x00400000;
enum LINECALLFEATURE_SETTERMINAL = 0x00800000;
enum LINECALLFEATURE_SETUPCONF = 0x01000000;
enum LINECALLFEATURE_SETUPTRANSFER = 0x02000000;
enum LINECALLFEATURE_SWAPHOLD = 0x04000000;
enum LINECALLFEATURE_UNHOLD = 0x08000000;
enum LINECALLFEATURE_RELEASEUSERUSERINFO = 0x10000000;
enum LINECALLFEATURE_SETTREATMENT = 0x20000000;
enum LINECALLFEATURE_SETQOS = 0x40000000;
enum LINECALLFEATURE_SETCALLDATA = 0x80000000;
enum LINECALLFEATURE2_NOHOLDCONFERENCE = 0x00000001;
enum LINECALLFEATURE2_ONESTEPTRANSFER = 0x00000002;
enum LINECALLFEATURE2_COMPLCAMPON = 0x00000004;
enum LINECALLFEATURE2_COMPLCALLBACK = 0x00000008;
enum LINECALLFEATURE2_COMPLINTRUDE = 0x00000010;
enum LINECALLFEATURE2_COMPLMESSAGE = 0x00000020;
enum LINECALLFEATURE2_TRANSFERNORM = 0x00000040;
enum LINECALLFEATURE2_TRANSFERCONF = 0x00000080;
enum LINECALLFEATURE2_PARKDIRECT = 0x00000100;
enum LINECALLFEATURE2_PARKNONDIRECT = 0x00000200;
enum LINECALLHUBTRACKING_NONE = 0x00000000;
enum LINECALLHUBTRACKING_PROVIDERLEVEL = 0x00000001;
enum LINECALLHUBTRACKING_ALLCALLS = 0x00000002;
enum LINECALLINFOSTATE_OTHER = 0x00000001;
enum LINECALLINFOSTATE_DEVSPECIFIC = 0x00000002;
enum LINECALLINFOSTATE_BEARERMODE = 0x00000004;
enum LINECALLINFOSTATE_RATE = 0x00000008;
enum LINECALLINFOSTATE_MEDIAMODE = 0x00000010;
enum LINECALLINFOSTATE_APPSPECIFIC = 0x00000020;
enum LINECALLINFOSTATE_CALLID = 0x00000040;
enum LINECALLINFOSTATE_RELATEDCALLID = 0x00000080;
enum LINECALLINFOSTATE_ORIGIN = 0x00000100;
enum LINECALLINFOSTATE_REASON = 0x00000200;
enum LINECALLINFOSTATE_COMPLETIONID = 0x00000400;
enum LINECALLINFOSTATE_NUMOWNERINCR = 0x00000800;
enum LINECALLINFOSTATE_NUMOWNERDECR = 0x00001000;
enum LINECALLINFOSTATE_NUMMONITORS = 0x00002000;
enum LINECALLINFOSTATE_TRUNK = 0x00004000;
enum LINECALLINFOSTATE_CALLERID = 0x00008000;
enum LINECALLINFOSTATE_CALLEDID = 0x00010000;
enum LINECALLINFOSTATE_CONNECTEDID = 0x00020000;
enum LINECALLINFOSTATE_REDIRECTIONID = 0x00040000;
enum LINECALLINFOSTATE_REDIRECTINGID = 0x00080000;
enum LINECALLINFOSTATE_DISPLAY = 0x00100000;
enum LINECALLINFOSTATE_USERUSERINFO = 0x00200000;
enum LINECALLINFOSTATE_HIGHLEVELCOMP = 0x00400000;
enum LINECALLINFOSTATE_LOWLEVELCOMP = 0x00800000;
enum LINECALLINFOSTATE_CHARGINGINFO = 0x01000000;
enum LINECALLINFOSTATE_TERMINAL = 0x02000000;
enum LINECALLINFOSTATE_DIALPARAMS = 0x04000000;
enum LINECALLINFOSTATE_MONITORMODES = 0x08000000;
enum LINECALLINFOSTATE_TREATMENT = 0x10000000;
enum LINECALLINFOSTATE_QOS = 0x20000000;
enum LINECALLINFOSTATE_CALLDATA = 0x40000000;
enum LINECALLORIGIN_OUTBOUND = 0x00000001;
enum LINECALLORIGIN_INTERNAL = 0x00000002;
enum LINECALLORIGIN_EXTERNAL = 0x00000004;
enum LINECALLORIGIN_UNKNOWN = 0x00000010;
enum LINECALLORIGIN_UNAVAIL = 0x00000020;
enum LINECALLORIGIN_CONFERENCE = 0x00000040;
enum LINECALLORIGIN_INBOUND = 0x00000080;
enum LINECALLPARAMFLAGS_SECURE = 0x00000001;
enum LINECALLPARAMFLAGS_IDLE = 0x00000002;
enum LINECALLPARAMFLAGS_BLOCKID = 0x00000004;
enum LINECALLPARAMFLAGS_ORIGOFFHOOK = 0x00000008;
enum LINECALLPARAMFLAGS_DESTOFFHOOK = 0x00000010;
enum LINECALLPARAMFLAGS_NOHOLDCONFERENCE = 0x00000020;
enum LINECALLPARAMFLAGS_PREDICTIVEDIAL = 0x00000040;
enum LINECALLPARAMFLAGS_ONESTEPTRANSFER = 0x00000080;
enum LINECALLPARTYID_BLOCKED = 0x00000001;
enum LINECALLPARTYID_OUTOFAREA = 0x00000002;
enum LINECALLPARTYID_NAME = 0x00000004;
enum LINECALLPARTYID_ADDRESS = 0x00000008;
enum LINECALLPARTYID_PARTIAL = 0x00000010;
enum LINECALLPARTYID_UNKNOWN = 0x00000020;
enum LINECALLPARTYID_UNAVAIL = 0x00000040;
enum LINECALLPRIVILEGE_NONE = 0x00000001;
enum LINECALLPRIVILEGE_MONITOR = 0x00000002;
enum LINECALLPRIVILEGE_OWNER = 0x00000004;
enum LINECALLREASON_DIRECT = 0x00000001;
enum LINECALLREASON_FWDBUSY = 0x00000002;
enum LINECALLREASON_FWDNOANSWER = 0x00000004;
enum LINECALLREASON_FWDUNCOND = 0x00000008;
enum LINECALLREASON_PICKUP = 0x00000010;
enum LINECALLREASON_UNPARK = 0x00000020;
enum LINECALLREASON_REDIRECT = 0x00000040;
enum LINECALLREASON_CALLCOMPLETION = 0x00000080;
enum LINECALLREASON_TRANSFER = 0x00000100;
enum LINECALLREASON_REMINDER = 0x00000200;
enum LINECALLREASON_UNKNOWN = 0x00000400;
enum LINECALLREASON_UNAVAIL = 0x00000800;
enum LINECALLREASON_INTRUDE = 0x00001000;
enum LINECALLREASON_PARKED = 0x00002000;
enum LINECALLREASON_CAMPEDON = 0x00004000;
enum LINECALLREASON_ROUTEREQUEST = 0x00008000;
enum LINECALLSELECT_LINE = 0x00000001;
enum LINECALLSELECT_ADDRESS = 0x00000002;
enum LINECALLSELECT_CALL = 0x00000004;
enum LINECALLSELECT_DEVICEID = 0x00000008;
enum LINECALLSELECT_CALLID = 0x00000010;
enum LINECALLSTATE_IDLE = 0x00000001;
enum LINECALLSTATE_OFFERING = 0x00000002;
enum LINECALLSTATE_ACCEPTED = 0x00000004;
enum LINECALLSTATE_DIALTONE = 0x00000008;
enum LINECALLSTATE_DIALING = 0x00000010;
enum LINECALLSTATE_RINGBACK = 0x00000020;
enum LINECALLSTATE_BUSY = 0x00000040;
enum LINECALLSTATE_SPECIALINFO = 0x00000080;
enum LINECALLSTATE_CONNECTED = 0x00000100;
enum LINECALLSTATE_PROCEEDING = 0x00000200;
enum LINECALLSTATE_ONHOLD = 0x00000400;
enum LINECALLSTATE_CONFERENCED = 0x00000800;
enum LINECALLSTATE_ONHOLDPENDCONF = 0x00001000;
enum LINECALLSTATE_ONHOLDPENDTRANSFER = 0x00002000;
enum LINECALLSTATE_DISCONNECTED = 0x00004000;
enum LINECALLSTATE_UNKNOWN = 0x00008000;
enum LINECALLTREATMENT_SILENCE = 0x00000001;
enum LINECALLTREATMENT_RINGBACK = 0x00000002;
enum LINECALLTREATMENT_BUSY = 0x00000003;
enum LINECALLTREATMENT_MUSIC = 0x00000004;
enum LINECARDOPTION_PREDEFINED = 0x00000001;
enum LINECARDOPTION_HIDDEN = 0x00000002;
enum LINECONNECTEDMODE_ACTIVE = 0x00000001;
enum LINECONNECTEDMODE_INACTIVE = 0x00000002;
enum LINECONNECTEDMODE_ACTIVEHELD = 0x00000004;
enum LINECONNECTEDMODE_INACTIVEHELD = 0x00000008;
enum LINECONNECTEDMODE_CONFIRMED = 0x00000010;
enum LINEDEVCAPFLAGS_CROSSADDRCONF = 0x00000001;
enum LINEDEVCAPFLAGS_HIGHLEVCOMP = 0x00000002;
enum LINEDEVCAPFLAGS_LOWLEVCOMP = 0x00000004;
enum LINEDEVCAPFLAGS_MEDIACONTROL = 0x00000008;
enum LINEDEVCAPFLAGS_MULTIPLEADDR = 0x00000010;
enum LINEDEVCAPFLAGS_CLOSEDROP = 0x00000020;
enum LINEDEVCAPFLAGS_DIALBILLING = 0x00000040;
enum LINEDEVCAPFLAGS_DIALQUIET = 0x00000080;
enum LINEDEVCAPFLAGS_DIALDIALTONE = 0x00000100;
enum LINEDEVCAPFLAGS_MSP = 0x00000200;
enum LINEDEVCAPFLAGS_CALLHUB = 0x00000400;
enum LINEDEVCAPFLAGS_CALLHUBTRACKING = 0x00000800;
enum LINEDEVCAPFLAGS_PRIVATEOBJECTS = 0x00001000;
enum LINEDEVCAPFLAGS_LOCAL = 0x00002000;
enum LINEDEVSTATE_OTHER = 0x00000001;
enum LINEDEVSTATE_RINGING = 0x00000002;
enum LINEDEVSTATE_CONNECTED = 0x00000004;
enum LINEDEVSTATE_DISCONNECTED = 0x00000008;
enum LINEDEVSTATE_MSGWAITON = 0x00000010;
enum LINEDEVSTATE_MSGWAITOFF = 0x00000020;
enum LINEDEVSTATE_INSERVICE = 0x00000040;
enum LINEDEVSTATE_OUTOFSERVICE = 0x00000080;
enum LINEDEVSTATE_MAINTENANCE = 0x00000100;
enum LINEDEVSTATE_OPEN = 0x00000200;
enum LINEDEVSTATE_CLOSE = 0x00000400;
enum LINEDEVSTATE_NUMCALLS = 0x00000800;
enum LINEDEVSTATE_NUMCOMPLETIONS = 0x00001000;
enum LINEDEVSTATE_TERMINALS = 0x00002000;
enum LINEDEVSTATE_ROAMMODE = 0x00004000;
enum LINEDEVSTATE_BATTERY = 0x00008000;
enum LINEDEVSTATE_SIGNAL = 0x00010000;
enum LINEDEVSTATE_DEVSPECIFIC = 0x00020000;
enum LINEDEVSTATE_REINIT = 0x00040000;
enum LINEDEVSTATE_LOCK = 0x00080000;
enum LINEDEVSTATE_CAPSCHANGE = 0x00100000;
enum LINEDEVSTATE_CONFIGCHANGE = 0x00200000;
enum LINEDEVSTATE_TRANSLATECHANGE = 0x00400000;
enum LINEDEVSTATE_COMPLCANCEL = 0x00800000;
enum LINEDEVSTATE_REMOVED = 0x01000000;
enum LINEDEVSTATUSFLAGS_CONNECTED = 0x00000001;
enum LINEDEVSTATUSFLAGS_MSGWAIT = 0x00000002;
enum LINEDEVSTATUSFLAGS_INSERVICE = 0x00000004;
enum LINEDEVSTATUSFLAGS_LOCKED = 0x00000008;
enum LINEDIALTONEMODE_NORMAL = 0x00000001;
enum LINEDIALTONEMODE_SPECIAL = 0x00000002;
enum LINEDIALTONEMODE_INTERNAL = 0x00000004;
enum LINEDIALTONEMODE_EXTERNAL = 0x00000008;
enum LINEDIALTONEMODE_UNKNOWN = 0x00000010;
enum LINEDIALTONEMODE_UNAVAIL = 0x00000020;
enum LINEDIGITMODE_PULSE = 0x00000001;
enum LINEDIGITMODE_DTMF = 0x00000002;
enum LINEDIGITMODE_DTMFEND = 0x00000004;
enum LINEDISCONNECTMODE_NORMAL = 0x00000001;
enum LINEDISCONNECTMODE_UNKNOWN = 0x00000002;
enum LINEDISCONNECTMODE_REJECT = 0x00000004;
enum LINEDISCONNECTMODE_PICKUP = 0x00000008;
enum LINEDISCONNECTMODE_FORWARDED = 0x00000010;
enum LINEDISCONNECTMODE_BUSY = 0x00000020;
enum LINEDISCONNECTMODE_NOANSWER = 0x00000040;
enum LINEDISCONNECTMODE_BADADDRESS = 0x00000080;
enum LINEDISCONNECTMODE_UNREACHABLE = 0x00000100;
enum LINEDISCONNECTMODE_CONGESTION = 0x00000200;
enum LINEDISCONNECTMODE_INCOMPATIBLE = 0x00000400;
enum LINEDISCONNECTMODE_UNAVAIL = 0x00000800;
enum LINEDISCONNECTMODE_NODIALTONE = 0x00001000;
enum LINEDISCONNECTMODE_NUMBERCHANGED = 0x00002000;
enum LINEDISCONNECTMODE_OUTOFORDER = 0x00004000;
enum LINEDISCONNECTMODE_TEMPFAILURE = 0x00008000;
enum LINEDISCONNECTMODE_QOSUNAVAIL = 0x00010000;
enum LINEDISCONNECTMODE_BLOCKED = 0x00020000;
enum LINEDISCONNECTMODE_DONOTDISTURB = 0x00040000;
enum LINEDISCONNECTMODE_CANCELLED = 0x00080000;
enum LINEDISCONNECTMODE_DESTINATIONBARRED = 0x00100000;
enum LINEDISCONNECTMODE_FDNRESTRICT = 0x00200000;
enum LINEERR_ALLOCATED = 0x80000001;
enum LINEERR_BADDEVICEID = 0x80000002;
enum LINEERR_BEARERMODEUNAVAIL = 0x80000003;
enum LINEERR_CALLUNAVAIL = 0x80000005;
enum LINEERR_COMPLETIONOVERRUN = 0x80000006;
enum LINEERR_CONFERENCEFULL = 0x80000007;
enum LINEERR_DIALBILLING = 0x80000008;
enum LINEERR_DIALDIALTONE = 0x80000009;
enum LINEERR_DIALPROMPT = 0x8000000a;
enum LINEERR_DIALQUIET = 0x8000000b;
enum LINEERR_INCOMPATIBLEAPIVERSION = 0x8000000c;
enum LINEERR_INCOMPATIBLEEXTVERSION = 0x8000000d;
enum LINEERR_INIFILECORRUPT = 0x8000000e;
enum LINEERR_INUSE = 0x8000000f;
enum LINEERR_INVALADDRESS = 0x80000010;
enum LINEERR_INVALADDRESSID = 0x80000011;
enum LINEERR_INVALADDRESSMODE = 0x80000012;
enum LINEERR_INVALADDRESSSTATE = 0x80000013;
enum LINEERR_INVALAPPHANDLE = 0x80000014;
enum LINEERR_INVALAPPNAME = 0x80000015;
enum LINEERR_INVALBEARERMODE = 0x80000016;
enum LINEERR_INVALCALLCOMPLMODE = 0x80000017;
enum LINEERR_INVALCALLHANDLE = 0x80000018;
enum LINEERR_INVALCALLPARAMS = 0x80000019;
enum LINEERR_INVALCALLPRIVILEGE = 0x8000001a;
enum LINEERR_INVALCALLSELECT = 0x8000001b;
enum LINEERR_INVALCALLSTATE = 0x8000001c;
enum LINEERR_INVALCALLSTATELIST = 0x8000001d;
enum LINEERR_INVALCARD = 0x8000001e;
enum LINEERR_INVALCOMPLETIONID = 0x8000001f;
enum LINEERR_INVALCONFCALLHANDLE = 0x80000020;
enum LINEERR_INVALCONSULTCALLHANDLE = 0x80000021;
enum LINEERR_INVALCOUNTRYCODE = 0x80000022;
enum LINEERR_INVALDEVICECLASS = 0x80000023;
enum LINEERR_INVALDEVICEHANDLE = 0x80000024;
enum LINEERR_INVALDIALPARAMS = 0x80000025;
enum LINEERR_INVALDIGITLIST = 0x80000026;
enum LINEERR_INVALDIGITMODE = 0x80000027;
enum LINEERR_INVALDIGITS = 0x80000028;
enum LINEERR_INVALEXTVERSION = 0x80000029;
enum LINEERR_INVALGROUPID = 0x8000002a;
enum LINEERR_INVALLINEHANDLE = 0x8000002b;
enum LINEERR_INVALLINESTATE = 0x8000002c;
enum LINEERR_INVALLOCATION = 0x8000002d;
enum LINEERR_INVALMEDIALIST = 0x8000002e;
enum LINEERR_INVALMEDIAMODE = 0x8000002f;
enum LINEERR_INVALMESSAGEID = 0x80000030;
enum LINEERR_INVALPARAM = 0x80000032;
enum LINEERR_INVALPARKID = 0x80000033;
enum LINEERR_INVALPARKMODE = 0x80000034;
enum LINEERR_INVALPOINTER = 0x80000035;
enum LINEERR_INVALPRIVSELECT = 0x80000036;
enum LINEERR_INVALRATE = 0x80000037;
enum LINEERR_INVALREQUESTMODE = 0x80000038;
enum LINEERR_INVALTERMINALID = 0x80000039;
enum LINEERR_INVALTERMINALMODE = 0x8000003a;
enum LINEERR_INVALTIMEOUT = 0x8000003b;
enum LINEERR_INVALTONE = 0x8000003c;
enum LINEERR_INVALTONELIST = 0x8000003d;
enum LINEERR_INVALTONEMODE = 0x8000003e;
enum LINEERR_INVALTRANSFERMODE = 0x8000003f;
enum LINEERR_LINEMAPPERFAILED = 0x80000040;
enum LINEERR_NOCONFERENCE = 0x80000041;
enum LINEERR_NODEVICE = 0x80000042;
enum LINEERR_NODRIVER = 0x80000043;
enum LINEERR_NOMEM = 0x80000044;
enum LINEERR_NOREQUEST = 0x80000045;
enum LINEERR_NOTOWNER = 0x80000046;
enum LINEERR_NOTREGISTERED = 0x80000047;
enum LINEERR_OPERATIONFAILED = 0x80000048;
enum LINEERR_OPERATIONUNAVAIL = 0x80000049;
enum LINEERR_RATEUNAVAIL = 0x8000004a;
enum LINEERR_RESOURCEUNAVAIL = 0x8000004b;
enum LINEERR_REQUESTOVERRUN = 0x8000004c;
enum LINEERR_STRUCTURETOOSMALL = 0x8000004d;
enum LINEERR_TARGETNOTFOUND = 0x8000004e;
enum LINEERR_TARGETSELF = 0x8000004f;
enum LINEERR_UNINITIALIZED = 0x80000050;
enum LINEERR_USERUSERINFOTOOBIG = 0x80000051;
enum LINEERR_REINIT = 0x80000052;
enum LINEERR_ADDRESSBLOCKED = 0x80000053;
enum LINEERR_BILLINGREJECTED = 0x80000054;
enum LINEERR_INVALFEATURE = 0x80000055;
enum LINEERR_NOMULTIPLEINSTANCE = 0x80000056;
enum LINEERR_INVALAGENTID = 0x80000057;
enum LINEERR_INVALAGENTGROUP = 0x80000058;
enum LINEERR_INVALPASSWORD = 0x80000059;
enum LINEERR_INVALAGENTSTATE = 0x8000005a;
enum LINEERR_INVALAGENTACTIVITY = 0x8000005b;
enum LINEERR_DIALVOICEDETECT = 0x8000005c;
enum LINEERR_USERCANCELLED = 0x8000005d;
enum LINEERR_INVALADDRESSTYPE = 0x8000005e;
enum LINEERR_INVALAGENTSESSIONSTATE = 0x8000005f;
enum LINEERR_DISCONNECTED = 0x80000060;
enum LINEERR_SERVICE_NOT_RUNNING = 0x80000061;
enum LINEFEATURE_DEVSPECIFIC = 0x00000001;
enum LINEFEATURE_DEVSPECIFICFEAT = 0x00000002;
enum LINEFEATURE_FORWARD = 0x00000004;
enum LINEFEATURE_MAKECALL = 0x00000008;
enum LINEFEATURE_SETMEDIACONTROL = 0x00000010;
enum LINEFEATURE_SETTERMINAL = 0x00000020;
enum LINEFEATURE_SETDEVSTATUS = 0x00000040;
enum LINEFEATURE_FORWARDFWD = 0x00000080;
enum LINEFEATURE_FORWARDDND = 0x00000100;
enum LINEFORWARDMODE_UNCOND = 0x00000001;
enum LINEFORWARDMODE_UNCONDINTERNAL = 0x00000002;
enum LINEFORWARDMODE_UNCONDEXTERNAL = 0x00000004;
enum LINEFORWARDMODE_UNCONDSPECIFIC = 0x00000008;
enum LINEFORWARDMODE_BUSY = 0x00000010;
enum LINEFORWARDMODE_BUSYINTERNAL = 0x00000020;
enum LINEFORWARDMODE_BUSYEXTERNAL = 0x00000040;
enum LINEFORWARDMODE_BUSYSPECIFIC = 0x00000080;
enum LINEFORWARDMODE_NOANSW = 0x00000100;
enum LINEFORWARDMODE_NOANSWINTERNAL = 0x00000200;
enum LINEFORWARDMODE_NOANSWEXTERNAL = 0x00000400;
enum LINEFORWARDMODE_NOANSWSPECIFIC = 0x00000800;
enum LINEFORWARDMODE_BUSYNA = 0x00001000;
enum LINEFORWARDMODE_BUSYNAINTERNAL = 0x00002000;
enum LINEFORWARDMODE_BUSYNAEXTERNAL = 0x00004000;
enum LINEFORWARDMODE_BUSYNASPECIFIC = 0x00008000;
enum LINEFORWARDMODE_UNKNOWN = 0x00010000;
enum LINEFORWARDMODE_UNAVAIL = 0x00020000;
enum LINEGATHERTERM_BUFFERFULL = 0x00000001;
enum LINEGATHERTERM_TERMDIGIT = 0x00000002;
enum LINEGATHERTERM_FIRSTTIMEOUT = 0x00000004;
enum LINEGATHERTERM_INTERTIMEOUT = 0x00000008;
enum LINEGATHERTERM_CANCEL = 0x00000010;
enum LINEGENERATETERM_DONE = 0x00000001;
enum LINEGENERATETERM_CANCEL = 0x00000002;
enum LINEINITIALIZEEXOPTION_USEHIDDENWINDOW = 0x00000001;
enum LINEINITIALIZEEXOPTION_USEEVENT = 0x00000002;
enum LINEINITIALIZEEXOPTION_USECOMPLETIONPORT = 0x00000003;
enum LINEINITIALIZEEXOPTION_CALLHUBTRACKING = 0x80000000;
enum LINELOCATIONOPTION_PULSEDIAL = 0x00000001;
enum LINEMAPPER = 0xffffffff;
enum LINEMEDIACONTROL_NONE = 0x00000001;
enum LINEMEDIACONTROL_START = 0x00000002;
enum LINEMEDIACONTROL_RESET = 0x00000004;
enum LINEMEDIACONTROL_PAUSE = 0x00000008;
enum LINEMEDIACONTROL_RESUME = 0x00000010;
enum LINEMEDIACONTROL_RATEUP = 0x00000020;
enum LINEMEDIACONTROL_RATEDOWN = 0x00000040;
enum LINEMEDIACONTROL_RATENORMAL = 0x00000080;
enum LINEMEDIACONTROL_VOLUMEUP = 0x00000100;
enum LINEMEDIACONTROL_VOLUMEDOWN = 0x00000200;
enum LINEMEDIACONTROL_VOLUMENORMAL = 0x00000400;
enum LINEMEDIAMODE_UNKNOWN = 0x00000002;
enum LINEMEDIAMODE_INTERACTIVEVOICE = 0x00000004;
enum LINEMEDIAMODE_AUTOMATEDVOICE = 0x00000008;
enum LINEMEDIAMODE_DATAMODEM = 0x00000010;
enum LINEMEDIAMODE_G3FAX = 0x00000020;
enum LINEMEDIAMODE_TDD = 0x00000040;
enum LINEMEDIAMODE_G4FAX = 0x00000080;
enum LINEMEDIAMODE_DIGITALDATA = 0x00000100;
enum LINEMEDIAMODE_TELETEX = 0x00000200;
enum LINEMEDIAMODE_VIDEOTEX = 0x00000400;
enum LINEMEDIAMODE_TELEX = 0x00000800;
enum LINEMEDIAMODE_MIXED = 0x00001000;
enum LINEMEDIAMODE_ADSI = 0x00002000;
enum LINEMEDIAMODE_VOICEVIEW = 0x00004000;
enum LINEMEDIAMODE_VIDEO = 0x00008000;
enum LAST_LINEMEDIAMODE = 0x00008000;
enum LINEOFFERINGMODE_ACTIVE = 0x00000001;
enum LINEOFFERINGMODE_INACTIVE = 0x00000002;
enum LINEOPENOPTION_SINGLEADDRESS = 0x80000000;
enum LINEOPENOPTION_PROXY = 0x40000000;
enum LINEPARKMODE_DIRECTED = 0x00000001;
enum LINEPARKMODE_NONDIRECTED = 0x00000002;
enum LINEPROXYREQUEST_SETAGENTGROUP = 0x00000001;
enum LINEPROXYREQUEST_SETAGENTSTATE = 0x00000002;
enum LINEPROXYREQUEST_SETAGENTACTIVITY = 0x00000003;
enum LINEPROXYREQUEST_GETAGENTCAPS = 0x00000004;
enum LINEPROXYREQUEST_GETAGENTSTATUS = 0x00000005;
enum LINEPROXYREQUEST_AGENTSPECIFIC = 0x00000006;
enum LINEPROXYREQUEST_GETAGENTACTIVITYLIST = 0x00000007;
enum LINEPROXYREQUEST_GETAGENTGROUPLIST = 0x00000008;
enum LINEPROXYREQUEST_CREATEAGENT = 0x00000009;
enum LINEPROXYREQUEST_SETAGENTMEASUREMENTPERIOD = 0x0000000a;
enum LINEPROXYREQUEST_GETAGENTINFO = 0x0000000b;
enum LINEPROXYREQUEST_CREATEAGENTSESSION = 0x0000000c;
enum LINEPROXYREQUEST_GETAGENTSESSIONLIST = 0x0000000d;
enum LINEPROXYREQUEST_SETAGENTSESSIONSTATE = 0x0000000e;
enum LINEPROXYREQUEST_GETAGENTSESSIONINFO = 0x0000000f;
enum LINEPROXYREQUEST_GETQUEUELIST = 0x00000010;
enum LINEPROXYREQUEST_SETQUEUEMEASUREMENTPERIOD = 0x00000011;
enum LINEPROXYREQUEST_GETQUEUEINFO = 0x00000012;
enum LINEPROXYREQUEST_GETGROUPLIST = 0x00000013;
enum LINEPROXYREQUEST_SETAGENTSTATEEX = 0x00000014;
enum LINEREMOVEFROMCONF_NONE = 0x00000001;
enum LINEREMOVEFROMCONF_LAST = 0x00000002;
enum LINEREMOVEFROMCONF_ANY = 0x00000003;
enum LINEREQUESTMODE_MAKECALL = 0x00000001;
enum LINEREQUESTMODE_MEDIACALL = 0x00000002;
enum LINEREQUESTMODE_DROP = 0x00000004;
enum LAST_LINEREQUESTMODE = 0x00000002;
enum LINEROAMMODE_UNKNOWN = 0x00000001;
enum LINEROAMMODE_UNAVAIL = 0x00000002;
enum LINEROAMMODE_HOME = 0x00000004;
enum LINEROAMMODE_ROAMA = 0x00000008;
enum LINEROAMMODE_ROAMB = 0x00000010;
enum LINESPECIALINFO_NOCIRCUIT = 0x00000001;
enum LINESPECIALINFO_CUSTIRREG = 0x00000002;
enum LINESPECIALINFO_REORDER = 0x00000004;
enum LINESPECIALINFO_UNKNOWN = 0x00000008;
enum LINESPECIALINFO_UNAVAIL = 0x00000010;
enum LINETERMDEV_PHONE = 0x00000001;
enum LINETERMDEV_HEADSET = 0x00000002;
enum LINETERMDEV_SPEAKER = 0x00000004;
enum LINETERMMODE_BUTTONS = 0x00000001;
enum LINETERMMODE_LAMPS = 0x00000002;
enum LINETERMMODE_DISPLAY = 0x00000004;
enum LINETERMMODE_RINGER = 0x00000008;
enum LINETERMMODE_HOOKSWITCH = 0x00000010;
enum LINETERMMODE_MEDIATOLINE = 0x00000020;
enum LINETERMMODE_MEDIAFROMLINE = 0x00000040;
enum LINETERMMODE_MEDIABIDIRECT = 0x00000080;
enum LINETERMSHARING_PRIVATE = 0x00000001;
enum LINETERMSHARING_SHAREDEXCL = 0x00000002;
enum LINETERMSHARING_SHAREDCONF = 0x00000004;
enum LINETOLLLISTOPTION_ADD = 0x00000001;
enum LINETOLLLISTOPTION_REMOVE = 0x00000002;
enum LINETONEMODE_CUSTOM = 0x00000001;
enum LINETONEMODE_RINGBACK = 0x00000002;
enum LINETONEMODE_BUSY = 0x00000004;
enum LINETONEMODE_BEEP = 0x00000008;
enum LINETONEMODE_BILLING = 0x00000010;
enum LINETRANSFERMODE_TRANSFER = 0x00000001;
enum LINETRANSFERMODE_CONFERENCE = 0x00000002;
enum LINETRANSLATEOPTION_CARDOVERRIDE = 0x00000001;
enum LINETRANSLATEOPTION_CANCELCALLWAITING = 0x00000002;
enum LINETRANSLATEOPTION_FORCELOCAL = 0x00000004;
enum LINETRANSLATEOPTION_FORCELD = 0x00000008;
enum LINETRANSLATERESULT_CANONICAL = 0x00000001;
enum LINETRANSLATERESULT_INTERNATIONAL = 0x00000002;
enum LINETRANSLATERESULT_LONGDISTANCE = 0x00000004;
enum LINETRANSLATERESULT_LOCAL = 0x00000008;
enum LINETRANSLATERESULT_INTOLLLIST = 0x00000010;
enum LINETRANSLATERESULT_NOTINTOLLLIST = 0x00000020;
enum LINETRANSLATERESULT_DIALBILLING = 0x00000040;
enum LINETRANSLATERESULT_DIALQUIET = 0x00000080;
enum LINETRANSLATERESULT_DIALDIALTONE = 0x00000100;
enum LINETRANSLATERESULT_DIALPROMPT = 0x00000200;
enum LINETRANSLATERESULT_VOICEDETECT = 0x00000400;
enum LINETRANSLATERESULT_NOTRANSLATION = 0x00000800;
enum PHONEBUTTONFUNCTION_UNKNOWN = 0x00000000;
enum PHONEBUTTONFUNCTION_CONFERENCE = 0x00000001;
enum PHONEBUTTONFUNCTION_TRANSFER = 0x00000002;
enum PHONEBUTTONFUNCTION_DROP = 0x00000003;
enum PHONEBUTTONFUNCTION_HOLD = 0x00000004;
enum PHONEBUTTONFUNCTION_RECALL = 0x00000005;
enum PHONEBUTTONFUNCTION_DISCONNECT = 0x00000006;
enum PHONEBUTTONFUNCTION_CONNECT = 0x00000007;
enum PHONEBUTTONFUNCTION_MSGWAITON = 0x00000008;
enum PHONEBUTTONFUNCTION_MSGWAITOFF = 0x00000009;
enum PHONEBUTTONFUNCTION_SELECTRING = 0x0000000a;
enum PHONEBUTTONFUNCTION_ABBREVDIAL = 0x0000000b;
enum PHONEBUTTONFUNCTION_FORWARD = 0x0000000c;
enum PHONEBUTTONFUNCTION_PICKUP = 0x0000000d;
enum PHONEBUTTONFUNCTION_RINGAGAIN = 0x0000000e;
enum PHONEBUTTONFUNCTION_PARK = 0x0000000f;
enum PHONEBUTTONFUNCTION_REJECT = 0x00000010;
enum PHONEBUTTONFUNCTION_REDIRECT = 0x00000011;
enum PHONEBUTTONFUNCTION_MUTE = 0x00000012;
enum PHONEBUTTONFUNCTION_VOLUMEUP = 0x00000013;
enum PHONEBUTTONFUNCTION_VOLUMEDOWN = 0x00000014;
enum PHONEBUTTONFUNCTION_SPEAKERON = 0x00000015;
enum PHONEBUTTONFUNCTION_SPEAKEROFF = 0x00000016;
enum PHONEBUTTONFUNCTION_FLASH = 0x00000017;
enum PHONEBUTTONFUNCTION_DATAON = 0x00000018;
enum PHONEBUTTONFUNCTION_DATAOFF = 0x00000019;
enum PHONEBUTTONFUNCTION_DONOTDISTURB = 0x0000001a;
enum PHONEBUTTONFUNCTION_INTERCOM = 0x0000001b;
enum PHONEBUTTONFUNCTION_BRIDGEDAPP = 0x0000001c;
enum PHONEBUTTONFUNCTION_BUSY = 0x0000001d;
enum PHONEBUTTONFUNCTION_CALLAPP = 0x0000001e;
enum PHONEBUTTONFUNCTION_DATETIME = 0x0000001f;
enum PHONEBUTTONFUNCTION_DIRECTORY = 0x00000020;
enum PHONEBUTTONFUNCTION_COVER = 0x00000021;
enum PHONEBUTTONFUNCTION_CALLID = 0x00000022;
enum PHONEBUTTONFUNCTION_LASTNUM = 0x00000023;
enum PHONEBUTTONFUNCTION_NIGHTSRV = 0x00000024;
enum PHONEBUTTONFUNCTION_SENDCALLS = 0x00000025;
enum PHONEBUTTONFUNCTION_MSGINDICATOR = 0x00000026;
enum PHONEBUTTONFUNCTION_REPDIAL = 0x00000027;
enum PHONEBUTTONFUNCTION_SETREPDIAL = 0x00000028;
enum PHONEBUTTONFUNCTION_SYSTEMSPEED = 0x00000029;
enum PHONEBUTTONFUNCTION_STATIONSPEED = 0x0000002a;
enum PHONEBUTTONFUNCTION_CAMPON = 0x0000002b;
enum PHONEBUTTONFUNCTION_SAVEREPEAT = 0x0000002c;
enum PHONEBUTTONFUNCTION_QUEUECALL = 0x0000002d;
enum PHONEBUTTONFUNCTION_NONE = 0x0000002e;
enum PHONEBUTTONFUNCTION_SEND = 0x0000002f;
enum PHONEBUTTONMODE_DUMMY = 0x00000001;
enum PHONEBUTTONMODE_CALL = 0x00000002;
enum PHONEBUTTONMODE_FEATURE = 0x00000004;
enum PHONEBUTTONMODE_KEYPAD = 0x00000008;
enum PHONEBUTTONMODE_LOCAL = 0x00000010;
enum PHONEBUTTONMODE_DISPLAY = 0x00000020;
enum PHONEBUTTONSTATE_UP = 0x00000001;
enum PHONEBUTTONSTATE_DOWN = 0x00000002;
enum PHONEBUTTONSTATE_UNKNOWN = 0x00000004;
enum PHONEBUTTONSTATE_UNAVAIL = 0x00000008;
enum PHONEERR_ALLOCATED = 0x90000001;
enum PHONEERR_BADDEVICEID = 0x90000002;
enum PHONEERR_INCOMPATIBLEAPIVERSION = 0x90000003;
enum PHONEERR_INCOMPATIBLEEXTVERSION = 0x90000004;
enum PHONEERR_INIFILECORRUPT = 0x90000005;
enum PHONEERR_INUSE = 0x90000006;
enum PHONEERR_INVALAPPHANDLE = 0x90000007;
enum PHONEERR_INVALAPPNAME = 0x90000008;
enum PHONEERR_INVALBUTTONLAMPID = 0x90000009;
enum PHONEERR_INVALBUTTONMODE = 0x9000000a;
enum PHONEERR_INVALBUTTONSTATE = 0x9000000b;
enum PHONEERR_INVALDATAID = 0x9000000c;
enum PHONEERR_INVALDEVICECLASS = 0x9000000d;
enum PHONEERR_INVALEXTVERSION = 0x9000000e;
enum PHONEERR_INVALHOOKSWITCHDEV = 0x9000000f;
enum PHONEERR_INVALHOOKSWITCHMODE = 0x90000010;
enum PHONEERR_INVALLAMPMODE = 0x90000011;
enum PHONEERR_INVALPARAM = 0x90000012;
enum PHONEERR_INVALPHONEHANDLE = 0x90000013;
enum PHONEERR_INVALPHONESTATE = 0x90000014;
enum PHONEERR_INVALPOINTER = 0x90000015;
enum PHONEERR_INVALPRIVILEGE = 0x90000016;
enum PHONEERR_INVALRINGMODE = 0x90000017;
enum PHONEERR_NODEVICE = 0x90000018;
enum PHONEERR_NODRIVER = 0x90000019;
enum PHONEERR_NOMEM = 0x9000001a;
enum PHONEERR_NOTOWNER = 0x9000001b;
enum PHONEERR_OPERATIONFAILED = 0x9000001c;
enum PHONEERR_OPERATIONUNAVAIL = 0x9000001d;
enum PHONEERR_RESOURCEUNAVAIL = 0x9000001f;
enum PHONEERR_REQUESTOVERRUN = 0x90000020;
enum PHONEERR_STRUCTURETOOSMALL = 0x90000021;
enum PHONEERR_UNINITIALIZED = 0x90000022;
enum PHONEERR_REINIT = 0x90000023;
enum PHONEERR_DISCONNECTED = 0x90000024;
enum PHONEERR_SERVICE_NOT_RUNNING = 0x90000025;
enum PHONEFEATURE_GETBUTTONINFO = 0x00000001;
enum PHONEFEATURE_GETDATA = 0x00000002;
enum PHONEFEATURE_GETDISPLAY = 0x00000004;
enum PHONEFEATURE_GETGAINHANDSET = 0x00000008;
enum PHONEFEATURE_GETGAINSPEAKER = 0x00000010;
enum PHONEFEATURE_GETGAINHEADSET = 0x00000020;
enum PHONEFEATURE_GETHOOKSWITCHHANDSET = 0x00000040;
enum PHONEFEATURE_GETHOOKSWITCHSPEAKER = 0x00000080;
enum PHONEFEATURE_GETHOOKSWITCHHEADSET = 0x00000100;
enum PHONEFEATURE_GETLAMP = 0x00000200;
enum PHONEFEATURE_GETRING = 0x00000400;
enum PHONEFEATURE_GETVOLUMEHANDSET = 0x00000800;
enum PHONEFEATURE_GETVOLUMESPEAKER = 0x00001000;
enum PHONEFEATURE_GETVOLUMEHEADSET = 0x00002000;
enum PHONEFEATURE_SETBUTTONINFO = 0x00004000;
enum PHONEFEATURE_SETDATA = 0x00008000;
enum PHONEFEATURE_SETDISPLAY = 0x00010000;
enum PHONEFEATURE_SETGAINHANDSET = 0x00020000;
enum PHONEFEATURE_SETGAINSPEAKER = 0x00040000;
enum PHONEFEATURE_SETGAINHEADSET = 0x00080000;
enum PHONEFEATURE_SETHOOKSWITCHHANDSET = 0x00100000;
enum PHONEFEATURE_SETHOOKSWITCHSPEAKER = 0x00200000;
enum PHONEFEATURE_SETHOOKSWITCHHEADSET = 0x00400000;
enum PHONEFEATURE_SETLAMP = 0x00800000;
enum PHONEFEATURE_SETRING = 0x01000000;
enum PHONEFEATURE_SETVOLUMEHANDSET = 0x02000000;
enum PHONEFEATURE_SETVOLUMESPEAKER = 0x04000000;
enum PHONEFEATURE_SETVOLUMEHEADSET = 0x08000000;
enum PHONEFEATURE_GENERICPHONE = 0x10000000;
enum PHONEHOOKSWITCHDEV_HANDSET = 0x00000001;
enum PHONEHOOKSWITCHDEV_SPEAKER = 0x00000002;
enum PHONEHOOKSWITCHDEV_HEADSET = 0x00000004;
enum PHONEHOOKSWITCHMODE_ONHOOK = 0x00000001;
enum PHONEHOOKSWITCHMODE_MIC = 0x00000002;
enum PHONEHOOKSWITCHMODE_SPEAKER = 0x00000004;
enum PHONEHOOKSWITCHMODE_MICSPEAKER = 0x00000008;
enum PHONEHOOKSWITCHMODE_UNKNOWN = 0x00000010;
enum PHONEINITIALIZEEXOPTION_USEHIDDENWINDOW = 0x00000001;
enum PHONEINITIALIZEEXOPTION_USEEVENT = 0x00000002;
enum PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT = 0x00000003;
enum PHONELAMPMODE_DUMMY = 0x00000001;
enum PHONELAMPMODE_OFF = 0x00000002;
enum PHONELAMPMODE_STEADY = 0x00000004;
enum PHONELAMPMODE_WINK = 0x00000008;
enum PHONELAMPMODE_FLASH = 0x00000010;
enum PHONELAMPMODE_FLUTTER = 0x00000020;
enum PHONELAMPMODE_BROKENFLUTTER = 0x00000040;
enum PHONELAMPMODE_UNKNOWN = 0x00000080;
enum PHONEPRIVILEGE_MONITOR = 0x00000001;
enum PHONEPRIVILEGE_OWNER = 0x00000002;
enum PHONESTATE_OTHER = 0x00000001;
enum PHONESTATE_CONNECTED = 0x00000002;
enum PHONESTATE_DISCONNECTED = 0x00000004;
enum PHONESTATE_OWNER = 0x00000008;
enum PHONESTATE_MONITORS = 0x00000010;
enum PHONESTATE_DISPLAY = 0x00000020;
enum PHONESTATE_LAMP = 0x00000040;
enum PHONESTATE_RINGMODE = 0x00000080;
enum PHONESTATE_RINGVOLUME = 0x00000100;
enum PHONESTATE_HANDSETHOOKSWITCH = 0x00000200;
enum PHONESTATE_HANDSETVOLUME = 0x00000400;
enum PHONESTATE_HANDSETGAIN = 0x00000800;
enum PHONESTATE_SPEAKERHOOKSWITCH = 0x00001000;
enum PHONESTATE_SPEAKERVOLUME = 0x00002000;
enum PHONESTATE_SPEAKERGAIN = 0x00004000;
enum PHONESTATE_HEADSETHOOKSWITCH = 0x00008000;
enum PHONESTATE_HEADSETVOLUME = 0x00010000;
enum PHONESTATE_HEADSETGAIN = 0x00020000;
enum PHONESTATE_SUSPEND = 0x00040000;
enum PHONESTATE_RESUME = 0x00080000;
enum PHONESTATE_DEVSPECIFIC = 0x00100000;
enum PHONESTATE_REINIT = 0x00200000;
enum PHONESTATE_CAPSCHANGE = 0x00400000;
enum PHONESTATE_REMOVED = 0x00800000;
enum PHONESTATUSFLAGS_CONNECTED = 0x00000001;
enum PHONESTATUSFLAGS_SUSPENDED = 0x00000002;
enum STRINGFORMAT_ASCII = 0x00000001;
enum STRINGFORMAT_DBCS = 0x00000002;
enum STRINGFORMAT_UNICODE = 0x00000003;
enum STRINGFORMAT_BINARY = 0x00000004;
enum TAPI_REPLY = 0x00000463;
enum TAPIERR_CONNECTED = 0x00000000;
enum TAPIERR_DROPPED = 0xffffffffffffffff;
enum TAPIERR_NOREQUESTRECIPIENT = 0xfffffffffffffffe;
enum TAPIERR_REQUESTQUEUEFULL = 0xfffffffffffffffd;
enum TAPIERR_INVALDESTADDRESS = 0xfffffffffffffffc;
enum TAPIERR_INVALWINDOWHANDLE = 0xfffffffffffffffb;
enum TAPIERR_INVALDEVICECLASS = 0xfffffffffffffffa;
enum TAPIERR_INVALDEVICEID = 0xfffffffffffffff9;
enum TAPIERR_DEVICECLASSUNAVAIL = 0xfffffffffffffff8;
enum TAPIERR_DEVICEIDUNAVAIL = 0xfffffffffffffff7;
enum TAPIERR_DEVICEINUSE = 0xfffffffffffffff6;
enum TAPIERR_DESTBUSY = 0xfffffffffffffff5;
enum TAPIERR_DESTNOANSWER = 0xfffffffffffffff4;
enum TAPIERR_DESTUNAVAIL = 0xfffffffffffffff3;
enum TAPIERR_UNKNOWNWINHANDLE = 0xfffffffffffffff2;
enum TAPIERR_UNKNOWNREQUESTID = 0xfffffffffffffff1;
enum TAPIERR_REQUESTFAILED = 0xfffffffffffffff0;
enum TAPIERR_REQUESTCANCELLED = 0xffffffffffffffef;
enum TAPIERR_INVALPOINTER = 0xffffffffffffffee;
enum TAPIERR_NOTADMIN = 0xffffffffffffffed;
enum TAPIERR_MMCWRITELOCKED = 0xffffffffffffffec;
enum TAPIERR_PROVIDERALREADYINSTALLED = 0xffffffffffffffeb;
enum TAPIERR_SCP_ALREADY_EXISTS = 0xffffffffffffffea;
enum TAPIERR_SCP_DOES_NOT_EXIST = 0xffffffffffffffe9;
enum TAPIMAXDESTADDRESSSIZE = 0x00000050;
enum TAPIMAXAPPNAMESIZE = 0x00000028;
enum TAPIMAXCALLEDPARTYSIZE = 0x00000028;
enum TAPIMAXCOMMENTSIZE = 0x00000050;
enum TAPIMAXDEVICECLASSSIZE = 0x00000028;
enum TAPIMAXDEVICEIDSIZE = 0x00000028;
enum INTERFACEMASK = 0x00ff0000;
enum DISPIDMASK = 0x0000ffff;
enum IDISPTAPI = 0x00010000;
enum IDISPTAPICALLCENTER = 0x00020000;
enum IDISPCALLINFO = 0x00010000;
enum IDISPBASICCALLCONTROL = 0x00020000;
enum IDISPLEGACYCALLMEDIACONTROL = 0x00030000;
enum IDISPAGGREGATEDMSPCALLOBJ = 0x00040000;
enum IDISPADDRESS = 0x00010000;
enum IDISPADDRESSCAPABILITIES = 0x00020000;
enum IDISPMEDIASUPPORT = 0x00030000;
enum IDISPADDRESSTRANSLATION = 0x00040000;
enum IDISPLEGACYADDRESSMEDIACONTROL = 0x00050000;
enum IDISPAGGREGATEDMSPADDRESSOBJ = 0x00060000;
enum IDISPPHONE = 0x00010000;
enum IDISPAPC = 0x00020000;
enum IDISPMULTITRACK = 0x00010000;
enum IDISPMEDIACONTROL = 0x00020000;
enum IDISPMEDIARECORD = 0x00030000;
enum IDISPMEDIAPLAYBACK = 0x00040000;
enum IDISPFILETRACK = 0x00010000;
enum TAPIMEDIATYPE_AUDIO = 0x00000008;
enum TAPIMEDIATYPE_VIDEO = 0x00008000;
enum TAPIMEDIATYPE_DATAMODEM = 0x00000010;
enum TAPIMEDIATYPE_G3FAX = 0x00000020;
enum TAPIMEDIATYPE_MULTITRACK = 0x00010000;
enum TSPI_MESSAGE_BASE = 0x000001f4;
enum LINETSPIOPTION_NONREENTRANT = 0x00000001;
enum TUISPIDLL_OBJECT_LINEID = 0x00000001;
enum TUISPIDLL_OBJECT_PHONEID = 0x00000002;
enum TUISPIDLL_OBJECT_PROVIDERID = 0x00000003;
enum TUISPIDLL_OBJECT_DIALOGINSTANCE = 0x00000004;
enum PRIVATEOBJECT_NONE = 0x00000001;
enum PRIVATEOBJECT_CALLID = 0x00000002;
enum PRIVATEOBJECT_LINE = 0x00000003;
enum PRIVATEOBJECT_CALL = 0x00000004;
enum PRIVATEOBJECT_PHONE = 0x00000005;
enum PRIVATEOBJECT_ADDRESS = 0x00000006;
enum LINEQOSREQUESTTYPE_SERVICELEVEL = 0x00000001;
enum LINEQOSSERVICELEVEL_NEEDED = 0x00000001;
enum LINEQOSSERVICELEVEL_IFAVAILABLE = 0x00000002;
enum LINEQOSSERVICELEVEL_BESTEFFORT = 0x00000003;
enum LINEEQOSINFO_NOQOS = 0x00000001;
enum LINEEQOSINFO_ADMISSIONFAILURE = 0x00000002;
enum LINEEQOSINFO_POLICYFAILURE = 0x00000003;
enum LINEEQOSINFO_GENERICERROR = 0x00000004;
enum TSPI_PROC_BASE = 0x000001f4;
enum TSPI_LINEACCEPT = 0x000001f4;
enum TSPI_LINEADDTOCONFERENCE = 0x000001f5;
enum TSPI_LINEANSWER = 0x000001f6;
enum TSPI_LINEBLINDTRANSFER = 0x000001f7;
enum TSPI_LINECLOSE = 0x000001f8;
enum TSPI_LINECLOSECALL = 0x000001f9;
enum TSPI_LINECOMPLETECALL = 0x000001fa;
enum TSPI_LINECOMPLETETRANSFER = 0x000001fb;
enum TSPI_LINECONDITIONALMEDIADETECTION = 0x000001fc;
enum TSPI_LINECONFIGDIALOG = 0x000001fd;
enum TSPI_LINEDEVSPECIFIC = 0x000001fe;
enum TSPI_LINEDEVSPECIFICFEATURE = 0x000001ff;
enum TSPI_LINEDIAL = 0x00000200;
enum TSPI_LINEDROP = 0x00000201;
enum TSPI_LINEFORWARD = 0x00000202;
enum TSPI_LINEGATHERDIGITS = 0x00000203;
enum TSPI_LINEGENERATEDIGITS = 0x00000204;
enum TSPI_LINEGENERATETONE = 0x00000205;
enum TSPI_LINEGETADDRESSCAPS = 0x00000206;
enum TSPI_LINEGETADDRESSID = 0x00000207;
enum TSPI_LINEGETADDRESSSTATUS = 0x00000208;
enum TSPI_LINEGETCALLADDRESSID = 0x00000209;
enum TSPI_LINEGETCALLINFO = 0x0000020a;
enum TSPI_LINEGETCALLSTATUS = 0x0000020b;
enum TSPI_LINEGETDEVCAPS = 0x0000020c;
enum TSPI_LINEGETDEVCONFIG = 0x0000020d;
enum TSPI_LINEGETEXTENSIONID = 0x0000020e;
enum TSPI_LINEGETICON = 0x0000020f;
enum TSPI_LINEGETID = 0x00000210;
enum TSPI_LINEGETLINEDEVSTATUS = 0x00000211;
enum TSPI_LINEGETNUMADDRESSIDS = 0x00000212;
enum TSPI_LINEHOLD = 0x00000213;
enum TSPI_LINEMAKECALL = 0x00000214;
enum TSPI_LINEMONITORDIGITS = 0x00000215;
enum TSPI_LINEMONITORMEDIA = 0x00000216;
enum TSPI_LINEMONITORTONES = 0x00000217;
enum TSPI_LINENEGOTIATEEXTVERSION = 0x00000218;
enum TSPI_LINENEGOTIATETSPIVERSION = 0x00000219;
enum TSPI_LINEOPEN = 0x0000021a;
enum TSPI_LINEPARK = 0x0000021b;
enum TSPI_LINEPICKUP = 0x0000021c;
enum TSPI_LINEPREPAREADDTOCONFERENCE = 0x0000021d;
enum TSPI_LINEREDIRECT = 0x0000021e;
enum TSPI_LINEREMOVEFROMCONFERENCE = 0x0000021f;
enum TSPI_LINESECURECALL = 0x00000220;
enum TSPI_LINESELECTEXTVERSION = 0x00000221;
enum TSPI_LINESENDUSERUSERINFO = 0x00000222;
enum TSPI_LINESETAPPSPECIFIC = 0x00000223;
enum TSPI_LINESETCALLPARAMS = 0x00000224;
enum TSPI_LINESETDEFAULTMEDIADETECTION = 0x00000225;
enum TSPI_LINESETDEVCONFIG = 0x00000226;
enum TSPI_LINESETMEDIACONTROL = 0x00000227;
enum TSPI_LINESETMEDIAMODE = 0x00000228;
enum TSPI_LINESETSTATUSMESSAGES = 0x00000229;
enum TSPI_LINESETTERMINAL = 0x0000022a;
enum TSPI_LINESETUPCONFERENCE = 0x0000022b;
enum TSPI_LINESETUPTRANSFER = 0x0000022c;
enum TSPI_LINESWAPHOLD = 0x0000022d;
enum TSPI_LINEUNCOMPLETECALL = 0x0000022e;
enum TSPI_LINEUNHOLD = 0x0000022f;
enum TSPI_LINEUNPARK = 0x00000230;
enum TSPI_PHONECLOSE = 0x00000231;
enum TSPI_PHONECONFIGDIALOG = 0x00000232;
enum TSPI_PHONEDEVSPECIFIC = 0x00000233;
enum TSPI_PHONEGETBUTTONINFO = 0x00000234;
enum TSPI_PHONEGETDATA = 0x00000235;
enum TSPI_PHONEGETDEVCAPS = 0x00000236;
enum TSPI_PHONEGETDISPLAY = 0x00000237;
enum TSPI_PHONEGETEXTENSIONID = 0x00000238;
enum TSPI_PHONEGETGAIN = 0x00000239;
enum TSPI_PHONEGETHOOKSWITCH = 0x0000023a;
enum TSPI_PHONEGETICON = 0x0000023b;
enum TSPI_PHONEGETID = 0x0000023c;
enum TSPI_PHONEGETLAMP = 0x0000023d;
enum TSPI_PHONEGETRING = 0x0000023e;
enum TSPI_PHONEGETSTATUS = 0x0000023f;
enum TSPI_PHONEGETVOLUME = 0x00000240;
enum TSPI_PHONENEGOTIATEEXTVERSION = 0x00000241;
enum TSPI_PHONENEGOTIATETSPIVERSION = 0x00000242;
enum TSPI_PHONEOPEN = 0x00000243;
enum TSPI_PHONESELECTEXTVERSION = 0x00000244;
enum TSPI_PHONESETBUTTONINFO = 0x00000245;
enum TSPI_PHONESETDATA = 0x00000246;
enum TSPI_PHONESETDISPLAY = 0x00000247;
enum TSPI_PHONESETGAIN = 0x00000248;
enum TSPI_PHONESETHOOKSWITCH = 0x00000249;
enum TSPI_PHONESETLAMP = 0x0000024a;
enum TSPI_PHONESETRING = 0x0000024b;
enum TSPI_PHONESETSTATUSMESSAGES = 0x0000024c;
enum TSPI_PHONESETVOLUME = 0x0000024d;
enum TSPI_PROVIDERCONFIG = 0x0000024e;
enum TSPI_PROVIDERINIT = 0x0000024f;
enum TSPI_PROVIDERINSTALL = 0x00000250;
enum TSPI_PROVIDERREMOVE = 0x00000251;
enum TSPI_PROVIDERSHUTDOWN = 0x00000252;
enum TSPI_PROVIDERENUMDEVICES = 0x00000253;
enum TSPI_LINEDROPONCLOSE = 0x00000254;
enum TSPI_LINEDROPNOOWNER = 0x00000255;
enum TSPI_PROVIDERCREATELINEDEVICE = 0x00000256;
enum TSPI_PROVIDERCREATEPHONEDEVICE = 0x00000257;
enum TSPI_LINESETCURRENTLOCATION = 0x00000258;
enum TSPI_LINECONFIGDIALOGEDIT = 0x00000259;
enum TSPI_LINERELEASEUSERUSERINFO = 0x0000025a;
enum TSPI_LINEGETCALLID = 0x0000025b;
enum TSPI_LINEGETCALLHUBTRACKING = 0x0000025c;
enum TSPI_LINESETCALLHUBTRACKING = 0x0000025d;
enum TSPI_LINERECEIVEMSPDATA = 0x0000025e;
enum TSPI_LINEMSPIDENTIFY = 0x0000025f;
enum TSPI_LINECREATEMSPINSTANCE = 0x00000260;
enum TSPI_LINECLOSEMSPINSTANCE = 0x00000261;
enum IDISPDIROBJECT = 0x00010000;
enum IDISPDIROBJCONFERENCE = 0x00020000;
enum IDISPDIROBJUSER = 0x00030000;
enum IDISPDIRECTORY = 0x00010000;
enum IDISPILSCONFIG = 0x00020000;
enum RENDBIND_AUTHENTICATE = 0x00000001;
enum RENDBIND_DEFAULTDOMAINNAME = 0x00000002;
enum RENDBIND_DEFAULTUSERNAME = 0x00000004;
enum RENDBIND_DEFAULTPASSWORD = 0x00000008;
enum RENDBIND_DEFAULTCREDENTIALS = 0x0000000e;
enum STRM_INITIAL = 0x00000000;
enum STRM_TERMINALSELECTED = 0x00000001;
enum STRM_CONFIGURED = 0x00000002;
enum STRM_RUNNING = 0x00000004;
enum STRM_PAUSED = 0x00000008;
enum STRM_STOPPED = 0x00000010;
enum TAPI_E_NOTENOUGHMEMORY = 0xffffffff80040001;
enum TAPI_E_NOITEMS = 0xffffffff80040002;
enum TAPI_E_NOTSUPPORTED = 0xffffffff80040003;
enum TAPI_E_INVALIDMEDIATYPE = 0xffffffff80040004;
enum TAPI_E_OPERATIONFAILED = 0xffffffff80040005;
enum TAPI_E_ALLOCATED = 0xffffffff80040006;
enum TAPI_E_CALLUNAVAIL = 0xffffffff80040007;
enum TAPI_E_COMPLETIONOVERRUN = 0xffffffff80040008;
enum TAPI_E_CONFERENCEFULL = 0xffffffff80040009;
enum TAPI_E_DIALMODIFIERNOTSUPPORTED = 0xffffffff8004000a;
enum TAPI_E_INUSE = 0xffffffff8004000b;
enum TAPI_E_INVALADDRESS = 0xffffffff8004000c;
enum TAPI_E_INVALADDRESSSTATE = 0xffffffff8004000d;
enum TAPI_E_INVALCALLPARAMS = 0xffffffff8004000e;
enum TAPI_E_INVALCALLPRIVILEGE = 0xffffffff8004000f;
enum TAPI_E_INVALCALLSTATE = 0xffffffff80040010;
enum TAPI_E_INVALCARD = 0xffffffff80040011;
enum TAPI_E_INVALCOMPLETIONID = 0xffffffff80040012;
enum TAPI_E_INVALCOUNTRYCODE = 0xffffffff80040013;
enum TAPI_E_INVALDEVICECLASS = 0xffffffff80040014;
enum TAPI_E_INVALDIALPARAMS = 0xffffffff80040015;
enum TAPI_E_INVALDIGITS = 0xffffffff80040016;
enum TAPI_E_INVALGROUPID = 0xffffffff80040017;
enum TAPI_E_INVALLOCATION = 0xffffffff80040018;
enum TAPI_E_INVALMESSAGEID = 0xffffffff80040019;
enum TAPI_E_INVALPARKID = 0xffffffff8004001a;
enum TAPI_E_INVALRATE = 0xffffffff8004001b;
enum TAPI_E_INVALTIMEOUT = 0xffffffff8004001c;
enum TAPI_E_INVALTONE = 0xffffffff8004001d;
enum TAPI_E_INVALLIST = 0xffffffff8004001e;
enum TAPI_E_INVALMODE = 0xffffffff8004001f;
enum TAPI_E_NOCONFERENCE = 0xffffffff80040020;
enum TAPI_E_NODEVICE = 0xffffffff80040021;
enum TAPI_E_NOREQUEST = 0xffffffff80040022;
enum TAPI_E_NOTOWNER = 0xffffffff80040023;
enum TAPI_E_NOTREGISTERED = 0xffffffff80040024;
enum TAPI_E_REQUESTOVERRUN = 0xffffffff80040025;
enum TAPI_E_TARGETNOTFOUND = 0xffffffff80040026;
enum TAPI_E_TARGETSELF = 0xffffffff80040027;
enum TAPI_E_USERUSERINFOTOOBIG = 0xffffffff80040028;
enum TAPI_E_REINIT = 0xffffffff80040029;
enum TAPI_E_ADDRESSBLOCKED = 0xffffffff8004002a;
enum TAPI_E_BILLINGREJECTED = 0xffffffff8004002b;
enum TAPI_E_INVALFEATURE = 0xffffffff8004002c;
enum TAPI_E_INVALBUTTONLAMPID = 0xffffffff8004002d;
enum TAPI_E_INVALBUTTONSTATE = 0xffffffff8004002e;
enum TAPI_E_INVALDATAID = 0xffffffff8004002f;
enum TAPI_E_INVALHOOKSWITCHDEV = 0xffffffff80040030;
enum TAPI_E_DROPPED = 0xffffffff80040031;
enum TAPI_E_NOREQUESTRECIPIENT = 0xffffffff80040032;
enum TAPI_E_REQUESTQUEUEFULL = 0xffffffff80040033;
enum TAPI_E_DESTBUSY = 0xffffffff80040034;
enum TAPI_E_DESTNOANSWER = 0xffffffff80040035;
enum TAPI_E_DESTUNAVAIL = 0xffffffff80040036;
enum TAPI_E_REQUESTFAILED = 0xffffffff80040037;
enum TAPI_E_REQUESTCANCELLED = 0xffffffff80040038;
enum TAPI_E_INVALPRIVILEGE = 0xffffffff80040039;
enum TAPI_E_INVALIDDIRECTION = 0xffffffff8004003a;
enum TAPI_E_INVALIDTERMINAL = 0xffffffff8004003b;
enum TAPI_E_INVALIDTERMINALCLASS = 0xffffffff8004003c;
enum TAPI_E_NODRIVER = 0xffffffff8004003d;
enum TAPI_E_MAXSTREAMS = 0xffffffff8004003e;
enum TAPI_E_NOTERMINALSELECTED = 0xffffffff8004003f;
enum TAPI_E_TERMINALINUSE = 0xffffffff80040040;
enum TAPI_E_NOTSTOPPED = 0xffffffff80040041;
enum TAPI_E_MAXTERMINALS = 0xffffffff80040042;
enum TAPI_E_INVALIDSTREAM = 0xffffffff80040043;
enum TAPI_E_TIMEOUT = 0xffffffff80040044;
enum TAPI_E_CALLCENTER_GROUP_REMOVED = 0xffffffff80040045;
enum TAPI_E_CALLCENTER_QUEUE_REMOVED = 0xffffffff80040046;
enum TAPI_E_CALLCENTER_NO_AGENT_ID = 0xffffffff80040047;
enum TAPI_E_CALLCENTER_INVALAGENTID = 0xffffffff80040048;
enum TAPI_E_CALLCENTER_INVALAGENTGROUP = 0xffffffff80040049;
enum TAPI_E_CALLCENTER_INVALPASSWORD = 0xffffffff8004004a;
enum TAPI_E_CALLCENTER_INVALAGENTSTATE = 0xffffffff8004004b;
enum TAPI_E_CALLCENTER_INVALAGENTACTIVITY = 0xffffffff8004004c;
enum TAPI_E_REGISTRY_SETTING_CORRUPT = 0xffffffff8004004d;
enum TAPI_E_TERMINAL_PEER = 0xffffffff8004004e;
enum TAPI_E_PEER_NOT_SET = 0xffffffff8004004f;
enum TAPI_E_NOEVENT = 0xffffffff80040050;
enum TAPI_E_INVALADDRESSTYPE = 0xffffffff80040051;
enum TAPI_E_RESOURCEUNAVAIL = 0xffffffff80040052;
enum TAPI_E_PHONENOTOPEN = 0xffffffff80040053;
enum TAPI_E_CALLNOTSELECTED = 0xffffffff80040054;
enum TAPI_E_WRONGEVENT = 0xffffffff80040055;
enum TAPI_E_NOFORMAT = 0xffffffff80040056;
enum TAPI_E_INVALIDSTREAMSTATE = 0xffffffff80040057;
enum TAPI_E_WRONG_STATE = 0xffffffff80040058;
enum TAPI_E_NOT_INITIALIZED = 0xffffffff80040059;
enum TAPI_E_SERVICE_NOT_RUNNING = 0xffffffff8004005a;
enum OPENTNEFSTREAM = "OpenTnefStream";
enum OPENTNEFSTREAMEX = "OpenTnefStreamEx";
enum GETTNEFSTREAMCODEPAGE = "GetTnefStreamCodePage";
enum cbDisplayName = 0x00000029;
enum cbEmailName = 0x0000000b;
enum cbSeverName = 0x0000000c;
enum cbTYPE = 0x00000010;
enum cbMaxIdData = 0x000000c8;
enum prioLow = 0x00000003;
enum prioNorm = 0x00000002;
enum prioHigh = 0x00000001;
enum atypNull = 0x00000000;
enum atypFile = 0x00000001;
enum atypOle = 0x00000002;
enum atypPicture = 0x00000003;
enum atypMax = 0x00000004;
alias HDRVCALL = void*;
alias HDRVLINE = void*;
alias HDRVPHONE = void*;
alias HDRVMSPLINE = void*;
alias HDRVDIALOGINSTANCE = void*;
alias HTAPICALL = void*;
alias HTAPILINE = void*;
alias HTAPIPHONE = void*;
alias HPROVIDER = void*;
alias LINECALLBACK = void function(uint hDevice, uint dwMessage, ulong dwInstance, ulong dwParam1, ulong dwParam2, ulong dwParam3);
alias PHONECALLBACK = void function(uint hDevice, uint dwMessage, ulong dwInstance, ulong dwParam1, ulong dwParam2, ulong dwParam3);
struct LINEADDRESSCAPS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwLineDeviceID;
    uint dwAddressSize;
    uint dwAddressOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwAddressSharing;
    uint dwAddressStates;
    uint dwCallInfoStates;
    uint dwCallerIDFlags;
    uint dwCalledIDFlags;
    uint dwConnectedIDFlags;
    uint dwRedirectionIDFlags;
    uint dwRedirectingIDFlags;
    uint dwCallStates;
    uint dwDialToneModes;
    uint dwBusyModes;
    uint dwSpecialInfo;
    uint dwDisconnectModes;
    uint dwMaxNumActiveCalls;
    uint dwMaxNumOnHoldCalls;
    uint dwMaxNumOnHoldPendingCalls;
    uint dwMaxNumConference;
    uint dwMaxNumTransConf;
    uint dwAddrCapFlags;
    uint dwCallFeatures;
    uint dwRemoveFromConfCaps;
    uint dwRemoveFromConfState;
    uint dwTransferModes;
    uint dwParkModes;
    uint dwForwardModes;
    uint dwMaxForwardEntries;
    uint dwMaxSpecificEntries;
    uint dwMinFwdNumRings;
    uint dwMaxFwdNumRings;
    uint dwMaxCallCompletions;
    uint dwCallCompletionConds;
    uint dwCallCompletionModes;
    uint dwNumCompletionMessages;
    uint dwCompletionMsgTextEntrySize;
    uint dwCompletionMsgTextSize;
    uint dwCompletionMsgTextOffset;
    uint dwAddressFeatures;
    uint dwPredictiveAutoTransferStates;
    uint dwNumCallTreatments;
    uint dwCallTreatmentListSize;
    uint dwCallTreatmentListOffset;
    uint dwDeviceClassesSize;
    uint dwDeviceClassesOffset;
    uint dwMaxCallDataSize;
    uint dwCallFeatures2;
    uint dwMaxNoAnswerTimeout;
    uint dwConnectedModes;
    uint dwOfferingModes;
    uint dwAvailableMediaModes;
}
struct LINEADDRESSSTATUS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumInUse;
    uint dwNumActiveCalls;
    uint dwNumOnHoldCalls;
    uint dwNumOnHoldPendCalls;
    uint dwAddressFeatures;
    uint dwNumRingsNoAnswer;
    uint dwForwardNumEntries;
    uint dwForwardSize;
    uint dwForwardOffset;
    uint dwTerminalModesSize;
    uint dwTerminalModesOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
}
struct LINEAGENTACTIVITYENTRY
{
    align (1):
    uint dwID;
    uint dwNameSize;
    uint dwNameOffset;
}
struct LINEAGENTACTIVITYLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEAGENTCAPS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwAgentHandlerInfoSize;
    uint dwAgentHandlerInfoOffset;
    uint dwCapsVersion;
    uint dwFeatures;
    uint dwStates;
    uint dwNextStates;
    uint dwMaxNumGroupEntries;
    uint dwAgentStatusMessages;
    uint dwNumAgentExtensionIDs;
    uint dwAgentExtensionIDListSize;
    uint dwAgentExtensionIDListOffset;
    GUID ProxyGUID;
}
struct LINEAGENTGROUPENTRY
{
    align (1):
    struct GroupID
    {
        align (1):
        uint dwGroupID1;
        uint dwGroupID2;
        uint dwGroupID3;
        uint dwGroupID4;
    }
    uint dwNameSize;
    uint dwNameOffset;
}
struct LINEAGENTGROUPLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEAGENTSTATUS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwGroupListSize;
    uint dwGroupListOffset;
    uint dwState;
    uint dwNextState;
    uint dwActivityID;
    uint dwActivitySize;
    uint dwActivityOffset;
    uint dwAgentFeatures;
    uint dwValidStates;
    uint dwValidNextStates;
}
struct LINEAPPINFO
{
    align (1):
    uint dwMachineNameSize;
    uint dwMachineNameOffset;
    uint dwUserNameSize;
    uint dwUserNameOffset;
    uint dwModuleFilenameSize;
    uint dwModuleFilenameOffset;
    uint dwFriendlyNameSize;
    uint dwFriendlyNameOffset;
    uint dwMediaModes;
    uint dwAddressID;
}
struct LINEAGENTENTRY
{
    align (1):
    uint hAgent;
    uint dwNameSize;
    uint dwNameOffset;
    uint dwIDSize;
    uint dwIDOffset;
    uint dwPINSize;
    uint dwPINOffset;
}
struct LINEAGENTLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEAGENTINFO
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwAgentState;
    uint dwNextAgentState;
    uint dwMeasurementPeriod;
    CY cyOverallCallRate;
    uint dwNumberOfACDCalls;
    uint dwNumberOfIncomingCalls;
    uint dwNumberOfOutgoingCalls;
    uint dwTotalACDTalkTime;
    uint dwTotalACDCallTime;
    uint dwTotalACDWrapUpTime;
}
struct LINEAGENTSESSIONENTRY
{
    align (1):
    uint hAgentSession;
    uint hAgent;
    GUID GroupID;
    uint dwWorkingAddressID;
}
struct LINEAGENTSESSIONLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEAGENTSESSIONINFO
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwAgentSessionState;
    uint dwNextAgentSessionState;
    double dateSessionStartTime;
    uint dwSessionDuration;
    uint dwNumberOfCalls;
    uint dwTotalTalkTime;
    uint dwAverageTalkTime;
    uint dwTotalCallTime;
    uint dwAverageCallTime;
    uint dwTotalWrapUpTime;
    uint dwAverageWrapUpTime;
    CY cyACDCallRate;
    uint dwLongestTimeToAnswer;
    uint dwAverageTimeToAnswer;
}
struct LINEQUEUEENTRY
{
    align (1):
    uint dwQueueID;
    uint dwNameSize;
    uint dwNameOffset;
}
struct LINEQUEUELIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEQUEUEINFO
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwMeasurementPeriod;
    uint dwTotalCallsQueued;
    uint dwCurrentCallsQueued;
    uint dwTotalCallsAbandoned;
    uint dwTotalCallsFlowedIn;
    uint dwTotalCallsFlowedOut;
    uint dwLongestEverWaitTime;
    uint dwCurrentLongestWaitTime;
    uint dwAverageWaitTime;
    uint dwFinalDisposition;
}
struct LINEPROXYREQUESTLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumEntries;
    uint dwListSize;
    uint dwListOffset;
}
struct LINEDIALPARAMS
{
    align (1):
    uint dwDialPause;
    uint dwDialSpeed;
    uint dwDigitDuration;
    uint dwWaitForDialtone;
}
struct LINECALLINFO
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint hLine;
    uint dwLineDeviceID;
    uint dwAddressID;
    uint dwBearerMode;
    uint dwRate;
    uint dwMediaMode;
    uint dwAppSpecific;
    uint dwCallID;
    uint dwRelatedCallID;
    uint dwCallParamFlags;
    uint dwCallStates;
    uint dwMonitorDigitModes;
    uint dwMonitorMediaModes;
    LINEDIALPARAMS DialParams;
    uint dwOrigin;
    uint dwReason;
    uint dwCompletionID;
    uint dwNumOwners;
    uint dwNumMonitors;
    uint dwCountryCode;
    uint dwTrunk;
    uint dwCallerIDFlags;
    uint dwCallerIDSize;
    uint dwCallerIDOffset;
    uint dwCallerIDNameSize;
    uint dwCallerIDNameOffset;
    uint dwCalledIDFlags;
    uint dwCalledIDSize;
    uint dwCalledIDOffset;
    uint dwCalledIDNameSize;
    uint dwCalledIDNameOffset;
    uint dwConnectedIDFlags;
    uint dwConnectedIDSize;
    uint dwConnectedIDOffset;
    uint dwConnectedIDNameSize;
    uint dwConnectedIDNameOffset;
    uint dwRedirectionIDFlags;
    uint dwRedirectionIDSize;
    uint dwRedirectionIDOffset;
    uint dwRedirectionIDNameSize;
    uint dwRedirectionIDNameOffset;
    uint dwRedirectingIDFlags;
    uint dwRedirectingIDSize;
    uint dwRedirectingIDOffset;
    uint dwRedirectingIDNameSize;
    uint dwRedirectingIDNameOffset;
    uint dwAppNameSize;
    uint dwAppNameOffset;
    uint dwDisplayableAddressSize;
    uint dwDisplayableAddressOffset;
    uint dwCalledPartySize;
    uint dwCalledPartyOffset;
    uint dwCommentSize;
    uint dwCommentOffset;
    uint dwDisplaySize;
    uint dwDisplayOffset;
    uint dwUserUserInfoSize;
    uint dwUserUserInfoOffset;
    uint dwHighLevelCompSize;
    uint dwHighLevelCompOffset;
    uint dwLowLevelCompSize;
    uint dwLowLevelCompOffset;
    uint dwChargingInfoSize;
    uint dwChargingInfoOffset;
    uint dwTerminalModesSize;
    uint dwTerminalModesOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwCallTreatment;
    uint dwCallDataSize;
    uint dwCallDataOffset;
    uint dwSendingFlowspecSize;
    uint dwSendingFlowspecOffset;
    uint dwReceivingFlowspecSize;
    uint dwReceivingFlowspecOffset;
}
struct LINECALLLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwCallsNumEntries;
    uint dwCallsSize;
    uint dwCallsOffset;
}
struct LINECALLPARAMS
{
    align (1):
    uint dwTotalSize;
    uint dwBearerMode;
    uint dwMinRate;
    uint dwMaxRate;
    uint dwMediaMode;
    uint dwCallParamFlags;
    uint dwAddressMode;
    uint dwAddressID;
    LINEDIALPARAMS DialParams;
    uint dwOrigAddressSize;
    uint dwOrigAddressOffset;
    uint dwDisplayableAddressSize;
    uint dwDisplayableAddressOffset;
    uint dwCalledPartySize;
    uint dwCalledPartyOffset;
    uint dwCommentSize;
    uint dwCommentOffset;
    uint dwUserUserInfoSize;
    uint dwUserUserInfoOffset;
    uint dwHighLevelCompSize;
    uint dwHighLevelCompOffset;
    uint dwLowLevelCompSize;
    uint dwLowLevelCompOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwPredictiveAutoTransferStates;
    uint dwTargetAddressSize;
    uint dwTargetAddressOffset;
    uint dwSendingFlowspecSize;
    uint dwSendingFlowspecOffset;
    uint dwReceivingFlowspecSize;
    uint dwReceivingFlowspecOffset;
    uint dwDeviceClassSize;
    uint dwDeviceClassOffset;
    uint dwDeviceConfigSize;
    uint dwDeviceConfigOffset;
    uint dwCallDataSize;
    uint dwCallDataOffset;
    uint dwNoAnswerTimeout;
    uint dwCallingPartyIDSize;
    uint dwCallingPartyIDOffset;
}
struct LINECALLSTATUS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwCallState;
    uint dwCallStateMode;
    uint dwCallPrivilege;
    uint dwCallFeatures;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwCallFeatures2;
    SYSTEMTIME tStateEntryTime;
}
struct LINECALLTREATMENTENTRY
{
    align (1):
    uint dwCallTreatmentID;
    uint dwCallTreatmentNameSize;
    uint dwCallTreatmentNameOffset;
}
struct LINECARDENTRY
{
    align (1):
    uint dwPermanentCardID;
    uint dwCardNameSize;
    uint dwCardNameOffset;
    uint dwCardNumberDigits;
    uint dwSameAreaRuleSize;
    uint dwSameAreaRuleOffset;
    uint dwLongDistanceRuleSize;
    uint dwLongDistanceRuleOffset;
    uint dwInternationalRuleSize;
    uint dwInternationalRuleOffset;
    uint dwOptions;
}
struct LINECOUNTRYENTRY
{
    align (1):
    uint dwCountryID;
    uint dwCountryCode;
    uint dwNextCountryID;
    uint dwCountryNameSize;
    uint dwCountryNameOffset;
    uint dwSameAreaRuleSize;
    uint dwSameAreaRuleOffset;
    uint dwLongDistanceRuleSize;
    uint dwLongDistanceRuleOffset;
    uint dwInternationalRuleSize;
    uint dwInternationalRuleOffset;
}
struct LINECOUNTRYLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumCountries;
    uint dwCountryListSize;
    uint dwCountryListOffset;
}
struct LINEDEVCAPS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwProviderInfoSize;
    uint dwProviderInfoOffset;
    uint dwSwitchInfoSize;
    uint dwSwitchInfoOffset;
    uint dwPermanentLineID;
    uint dwLineNameSize;
    uint dwLineNameOffset;
    uint dwStringFormat;
    uint dwAddressModes;
    uint dwNumAddresses;
    uint dwBearerModes;
    uint dwMaxRate;
    uint dwMediaModes;
    uint dwGenerateToneModes;
    uint dwGenerateToneMaxNumFreq;
    uint dwGenerateDigitModes;
    uint dwMonitorToneMaxNumFreq;
    uint dwMonitorToneMaxNumEntries;
    uint dwMonitorDigitModes;
    uint dwGatherDigitsMinTimeout;
    uint dwGatherDigitsMaxTimeout;
    uint dwMedCtlDigitMaxListSize;
    uint dwMedCtlMediaMaxListSize;
    uint dwMedCtlToneMaxListSize;
    uint dwMedCtlCallStateMaxListSize;
    uint dwDevCapFlags;
    uint dwMaxNumActiveCalls;
    uint dwAnswerMode;
    uint dwRingModes;
    uint dwLineStates;
    uint dwUUIAcceptSize;
    uint dwUUIAnswerSize;
    uint dwUUIMakeCallSize;
    uint dwUUIDropSize;
    uint dwUUISendUserUserInfoSize;
    uint dwUUICallInfoSize;
    LINEDIALPARAMS MinDialParams;
    LINEDIALPARAMS MaxDialParams;
    LINEDIALPARAMS DefaultDialParams;
    uint dwNumTerminals;
    uint dwTerminalCapsSize;
    uint dwTerminalCapsOffset;
    uint dwTerminalTextEntrySize;
    uint dwTerminalTextSize;
    uint dwTerminalTextOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwLineFeatures;
    uint dwSettableDevStatus;
    uint dwDeviceClassesSize;
    uint dwDeviceClassesOffset;
    GUID PermanentLineGuid;
}
struct LINEDEVSTATUS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumOpens;
    uint dwOpenMediaModes;
    uint dwNumActiveCalls;
    uint dwNumOnHoldCalls;
    uint dwNumOnHoldPendCalls;
    uint dwLineFeatures;
    uint dwNumCallCompletions;
    uint dwRingMode;
    uint dwSignalLevel;
    uint dwBatteryLevel;
    uint dwRoamMode;
    uint dwDevStatusFlags;
    uint dwTerminalModesSize;
    uint dwTerminalModesOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwAvailableMediaModes;
    uint dwAppInfoSize;
    uint dwAppInfoOffset;
}
struct LINEEXTENSIONID
{
    align (1):
    uint dwExtensionID0;
    uint dwExtensionID1;
    uint dwExtensionID2;
    uint dwExtensionID3;
}
struct LINEFORWARD
{
    align (1):
    uint dwForwardMode;
    uint dwCallerAddressSize;
    uint dwCallerAddressOffset;
    uint dwDestCountryCode;
    uint dwDestAddressSize;
    uint dwDestAddressOffset;
}
struct LINEFORWARDLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNumEntries;
    LINEFORWARD[1] ForwardList;
}
struct LINEGENERATETONE
{
    align (1):
    uint dwFrequency;
    uint dwCadenceOn;
    uint dwCadenceOff;
    uint dwVolume;
}
struct LINEINITIALIZEEXPARAMS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwOptions;
    union Handles
    {
        align (1):
        HANDLE hEvent;
        HANDLE hCompletionPort;
    }
    uint dwCompletionKey;
}
struct LINELOCATIONENTRY
{
    align (1):
    uint dwPermanentLocationID;
    uint dwLocationNameSize;
    uint dwLocationNameOffset;
    uint dwCountryCode;
    uint dwCityCodeSize;
    uint dwCityCodeOffset;
    uint dwPreferredCardID;
    uint dwLocalAccessCodeSize;
    uint dwLocalAccessCodeOffset;
    uint dwLongDistanceAccessCodeSize;
    uint dwLongDistanceAccessCodeOffset;
    uint dwTollPrefixListSize;
    uint dwTollPrefixListOffset;
    uint dwCountryID;
    uint dwOptions;
    uint dwCancelCallWaitingSize;
    uint dwCancelCallWaitingOffset;
}
struct LINEMEDIACONTROLCALLSTATE
{
    align (1):
    uint dwCallStates;
    uint dwMediaControl;
}
struct LINEMEDIACONTROLDIGIT
{
    align (1):
    uint dwDigit;
    uint dwDigitModes;
    uint dwMediaControl;
}
struct LINEMEDIACONTROLMEDIA
{
    align (1):
    uint dwMediaModes;
    uint dwDuration;
    uint dwMediaControl;
}
struct LINEMEDIACONTROLTONE
{
    align (1):
    uint dwAppSpecific;
    uint dwDuration;
    uint dwFrequency1;
    uint dwFrequency2;
    uint dwFrequency3;
    uint dwMediaControl;
}
struct LINEMESSAGE
{
    align (1):
    uint hDevice;
    uint dwMessageID;
    ulong dwCallbackInstance;
    ulong dwParam1;
    ulong dwParam2;
    ulong dwParam3;
}
struct LINEMONITORTONE
{
    align (1):
    uint dwAppSpecific;
    uint dwDuration;
    uint dwFrequency1;
    uint dwFrequency2;
    uint dwFrequency3;
}
struct LINEPROVIDERENTRY
{
    align (1):
    uint dwPermanentProviderID;
    uint dwProviderFilenameSize;
    uint dwProviderFilenameOffset;
}
struct LINEPROVIDERLIST
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumProviders;
    uint dwProviderListSize;
    uint dwProviderListOffset;
}
struct LINEPROXYREQUEST
{
    align (1):
    uint dwSize;
    uint dwClientMachineNameSize;
    uint dwClientMachineNameOffset;
    uint dwClientUserNameSize;
    uint dwClientUserNameOffset;
    uint dwClientAppAPIVersion;
    uint dwRequestType;
    union
    {
        struct SetAgentGroup
        {
            align (1):
            uint dwAddressID;
            LINEAGENTGROUPLIST GroupList;
        }
        struct SetAgentState
        {
            align (1):
            uint dwAddressID;
            uint dwAgentState;
            uint dwNextAgentState;
        }
        struct SetAgentActivity
        {
            align (1):
            uint dwAddressID;
            uint dwActivityID;
        }
        struct GetAgentCaps
        {
            align (1):
            uint dwAddressID;
            LINEAGENTCAPS AgentCaps;
        }
        struct GetAgentStatus
        {
            align (1):
            uint dwAddressID;
            LINEAGENTSTATUS AgentStatus;
        }
        struct AgentSpecific
        {
            align (1):
            uint dwAddressID;
            uint dwAgentExtensionIDIndex;
            uint dwSize;
            ubyte[1] Params;
        }
        struct GetAgentActivityList
        {
            align (1):
            uint dwAddressID;
            LINEAGENTACTIVITYLIST ActivityList;
        }
        struct GetAgentGroupList
        {
            align (1):
            uint dwAddressID;
            LINEAGENTGROUPLIST GroupList;
        }
        struct CreateAgent
        {
            align (1):
            uint hAgent;
            uint dwAgentIDSize;
            uint dwAgentIDOffset;
            uint dwAgentPINSize;
            uint dwAgentPINOffset;
        }
        struct SetAgentStateEx
        {
            align (1):
            uint hAgent;
            uint dwAgentState;
            uint dwNextAgentState;
        }
        struct SetAgentMeasurementPeriod
        {
            align (1):
            uint hAgent;
            uint dwMeasurementPeriod;
        }
        struct GetAgentInfo
        {
            align (1):
            uint hAgent;
            LINEAGENTINFO AgentInfo;
        }
        struct CreateAgentSession
        {
            align (1):
            uint hAgentSession;
            uint dwAgentPINSize;
            uint dwAgentPINOffset;
            uint hAgent;
            GUID GroupID;
            uint dwWorkingAddressID;
        }
        struct GetAgentSessionList
        {
            align (1):
            uint hAgent;
            LINEAGENTSESSIONLIST SessionList;
        }
        struct GetAgentSessionInfo
        {
            align (1):
            uint hAgentSession;
            LINEAGENTSESSIONINFO SessionInfo;
        }
        struct SetAgentSessionState
        {
            align (1):
            uint hAgentSession;
            uint dwAgentSessionState;
            uint dwNextAgentSessionState;
        }
        struct GetQueueList
        {
            align (1):
            GUID GroupID;
            LINEQUEUELIST QueueList;
        }
        struct SetQueueMeasurementPeriod
        {
            align (1):
            uint dwQueueID;
            uint dwMeasurementPeriod;
        }
        struct GetQueueInfo
        {
            align (1):
            uint dwQueueID;
            LINEQUEUEINFO QueueInfo;
        }
        struct GetGroupList
        {
            LINEAGENTGROUPLIST GroupList;
        }
    }
}
struct LINEREQMAKECALL
{
    CHAR[80] szDestAddress;
    CHAR[40] szAppName;
    CHAR[40] szCalledParty;
    CHAR[80] szComment;
}
struct LINEREQMAKECALLW
{
    align (1):
    wchar[80] szDestAddress;
    wchar[40] szAppName;
    wchar[40] szCalledParty;
    wchar[80] szComment;
}
struct LINEREQMEDIACALL
{
    align (1):
    HWND hWnd;
    WPARAM wRequestID;
    CHAR[40] szDeviceClass;
    ubyte[40] ucDeviceID;
    uint dwSize;
    uint dwSecure;
    CHAR[80] szDestAddress;
    CHAR[40] szAppName;
    CHAR[40] szCalledParty;
    CHAR[80] szComment;
}
struct LINEREQMEDIACALLW
{
    align (1):
    HWND hWnd;
    WPARAM wRequestID;
    wchar[40] szDeviceClass;
    ubyte[40] ucDeviceID;
    uint dwSize;
    uint dwSecure;
    wchar[80] szDestAddress;
    wchar[40] szAppName;
    wchar[40] szCalledParty;
    wchar[80] szComment;
}
struct LINETERMCAPS
{
    align (1):
    uint dwTermDev;
    uint dwTermModes;
    uint dwTermSharing;
}
struct LINETRANSLATECAPS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwNumLocations;
    uint dwLocationListSize;
    uint dwLocationListOffset;
    uint dwCurrentLocationID;
    uint dwNumCards;
    uint dwCardListSize;
    uint dwCardListOffset;
    uint dwCurrentPreferredCardID;
}
struct LINETRANSLATEOUTPUT
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwDialableStringSize;
    uint dwDialableStringOffset;
    uint dwDisplayableStringSize;
    uint dwDisplayableStringOffset;
    uint dwCurrentCountry;
    uint dwDestCountry;
    uint dwTranslateResults;
}
struct PHONEBUTTONINFO
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwButtonMode;
    uint dwButtonFunction;
    uint dwButtonTextSize;
    uint dwButtonTextOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwButtonState;
}
struct PHONECAPS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwProviderInfoSize;
    uint dwProviderInfoOffset;
    uint dwPhoneInfoSize;
    uint dwPhoneInfoOffset;
    uint dwPermanentPhoneID;
    uint dwPhoneNameSize;
    uint dwPhoneNameOffset;
    uint dwStringFormat;
    uint dwPhoneStates;
    uint dwHookSwitchDevs;
    uint dwHandsetHookSwitchModes;
    uint dwSpeakerHookSwitchModes;
    uint dwHeadsetHookSwitchModes;
    uint dwVolumeFlags;
    uint dwGainFlags;
    uint dwDisplayNumRows;
    uint dwDisplayNumColumns;
    uint dwNumRingModes;
    uint dwNumButtonLamps;
    uint dwButtonModesSize;
    uint dwButtonModesOffset;
    uint dwButtonFunctionsSize;
    uint dwButtonFunctionsOffset;
    uint dwLampModesSize;
    uint dwLampModesOffset;
    uint dwNumSetData;
    uint dwSetDataSize;
    uint dwSetDataOffset;
    uint dwNumGetData;
    uint dwGetDataSize;
    uint dwGetDataOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwDeviceClassesSize;
    uint dwDeviceClassesOffset;
    uint dwPhoneFeatures;
    uint dwSettableHandsetHookSwitchModes;
    uint dwSettableSpeakerHookSwitchModes;
    uint dwSettableHeadsetHookSwitchModes;
    uint dwMonitoredHandsetHookSwitchModes;
    uint dwMonitoredSpeakerHookSwitchModes;
    uint dwMonitoredHeadsetHookSwitchModes;
    GUID PermanentPhoneGuid;
}
struct PHONEEXTENSIONID
{
    align (1):
    uint dwExtensionID0;
    uint dwExtensionID1;
    uint dwExtensionID2;
    uint dwExtensionID3;
}
struct PHONEINITIALIZEEXPARAMS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwOptions;
    union Handles
    {
        align (1):
        HANDLE hEvent;
        HANDLE hCompletionPort;
    }
    uint dwCompletionKey;
}
struct PHONEMESSAGE
{
    align (1):
    uint hDevice;
    uint dwMessageID;
    ulong dwCallbackInstance;
    ulong dwParam1;
    ulong dwParam2;
    ulong dwParam3;
}
struct PHONESTATUS
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwStatusFlags;
    uint dwNumOwners;
    uint dwNumMonitors;
    uint dwRingMode;
    uint dwRingVolume;
    uint dwHandsetHookSwitchMode;
    uint dwHandsetVolume;
    uint dwHandsetGain;
    uint dwSpeakerHookSwitchMode;
    uint dwSpeakerVolume;
    uint dwSpeakerGain;
    uint dwHeadsetHookSwitchMode;
    uint dwHeadsetVolume;
    uint dwHeadsetGain;
    uint dwDisplaySize;
    uint dwDisplayOffset;
    uint dwLampModesSize;
    uint dwLampModesOffset;
    uint dwOwnerNameSize;
    uint dwOwnerNameOffset;
    uint dwDevSpecificSize;
    uint dwDevSpecificOffset;
    uint dwPhoneFeatures;
}
struct VARSTRING
{
    align (1):
    uint dwTotalSize;
    uint dwNeededSize;
    uint dwUsedSize;
    uint dwStringFormat;
    uint dwStringSize;
    uint dwStringOffset;
}
alias ASYNC_COMPLETION = void function(uint dwRequestID, int lResult);
alias LINEEVENT = void function(HTAPILINE htLine, HTAPICALL htCall, uint dwMsg, ulong dwParam1, ulong dwParam2, ulong dwParam3);
alias PHONEEVENT = void function(HTAPIPHONE htPhone, uint dwMsg, ulong dwParam1, ulong dwParam2, ulong dwParam3);
alias TUISPIDLLCALLBACK = int function(ulong dwObjectID, uint dwObjectType, void* lpParams, uint dwSize);
struct TUISPICREATEDIALOGINSTANCEPARAMS
{
    uint dwRequestID;
    HDRVDIALOGINSTANCE hdDlgInst;
    uint htDlgInst;
    const(wchar)* lpszUIDLLName;
    void* lpParams;
    uint dwSize;
}
alias TAPI_TONEMODE = int;
enum : int
{
    TTM_RINGBACK = 0x00000002,
    TTM_BUSY     = 0x00000004,
    TTM_BEEP     = 0x00000008,
    TTM_BILLING  = 0x00000010,
}

alias TAPI_GATHERTERM = int;
enum : int
{
    TGT_BUFFERFULL   = 0x00000001,
    TGT_TERMDIGIT    = 0x00000002,
    TGT_FIRSTTIMEOUT = 0x00000004,
    TGT_INTERTIMEOUT = 0x00000008,
    TGT_CANCEL       = 0x00000010,
}

struct TAPI_CUSTOMTONE
{
    uint dwFrequency;
    uint dwCadenceOn;
    uint dwCadenceOff;
    uint dwVolume;
}
struct TAPI_DETECTTONE
{
    uint dwAppSpecific;
    uint dwDuration;
    uint dwFrequency1;
    uint dwFrequency2;
    uint dwFrequency3;
}
alias ADDRESS_EVENT = int;
enum : int
{
    AE_STATE          = 0x00000000,
    AE_CAPSCHANGE     = 0x00000001,
    AE_RINGING        = 0x00000002,
    AE_CONFIGCHANGE   = 0x00000003,
    AE_FORWARD        = 0x00000004,
    AE_NEWTERMINAL    = 0x00000005,
    AE_REMOVETERMINAL = 0x00000006,
    AE_MSGWAITON      = 0x00000007,
    AE_MSGWAITOFF     = 0x00000008,
    AE_LASTITEM       = 0x00000008,
}

alias ADDRESS_STATE = int;
enum : int
{
    AS_INSERVICE    = 0x00000000,
    AS_OUTOFSERVICE = 0x00000001,
}

alias CALL_STATE = int;
enum : int
{
    CS_IDLE         = 0x00000000,
    CS_INPROGRESS   = 0x00000001,
    CS_CONNECTED    = 0x00000002,
    CS_DISCONNECTED = 0x00000003,
    CS_OFFERING     = 0x00000004,
    CS_HOLD         = 0x00000005,
    CS_QUEUED       = 0x00000006,
    CS_LASTITEM     = 0x00000006,
}

alias CALL_STATE_EVENT_CAUSE = int;
enum : int
{
    CEC_NONE                  = 0x00000000,
    CEC_DISCONNECT_NORMAL     = 0x00000001,
    CEC_DISCONNECT_BUSY       = 0x00000002,
    CEC_DISCONNECT_BADADDRESS = 0x00000003,
    CEC_DISCONNECT_NOANSWER   = 0x00000004,
    CEC_DISCONNECT_CANCELLED  = 0x00000005,
    CEC_DISCONNECT_REJECTED   = 0x00000006,
    CEC_DISCONNECT_FAILED     = 0x00000007,
    CEC_DISCONNECT_BLOCKED    = 0x00000008,
}

alias CALL_MEDIA_EVENT = int;
enum : int
{
    CME_NEW_STREAM      = 0x00000000,
    CME_STREAM_FAIL     = 0x00000001,
    CME_TERMINAL_FAIL   = 0x00000002,
    CME_STREAM_NOT_USED = 0x00000003,
    CME_STREAM_ACTIVE   = 0x00000004,
    CME_STREAM_INACTIVE = 0x00000005,
    CME_LASTITEM        = 0x00000005,
}

alias CALL_MEDIA_EVENT_CAUSE = int;
enum : int
{
    CMC_UNKNOWN            = 0x00000000,
    CMC_BAD_DEVICE         = 0x00000001,
    CMC_CONNECT_FAIL       = 0x00000002,
    CMC_LOCAL_REQUEST      = 0x00000003,
    CMC_REMOTE_REQUEST     = 0x00000004,
    CMC_MEDIA_TIMEOUT      = 0x00000005,
    CMC_MEDIA_RECOVERED    = 0x00000006,
    CMC_QUALITY_OF_SERVICE = 0x00000007,
}

alias DISCONNECT_CODE = int;
enum : int
{
    DC_NORMAL   = 0x00000000,
    DC_NOANSWER = 0x00000001,
    DC_REJECTED = 0x00000002,
}

alias TERMINAL_STATE = int;
enum : int
{
    TS_INUSE    = 0x00000000,
    TS_NOTINUSE = 0x00000001,
}

alias TERMINAL_DIRECTION = int;
enum : int
{
    TD_CAPTURE          = 0x00000000,
    TD_RENDER           = 0x00000001,
    TD_BIDIRECTIONAL    = 0x00000002,
    TD_MULTITRACK_MIXED = 0x00000003,
    TD_NONE             = 0x00000004,
}

alias TERMINAL_TYPE = int;
enum : int
{
    TT_STATIC  = 0x00000000,
    TT_DYNAMIC = 0x00000001,
}

alias CALL_PRIVILEGE = int;
enum : int
{
    CP_OWNER   = 0x00000000,
    CP_MONITOR = 0x00000001,
}

alias TAPI_EVENT = int;
enum : int
{
    TE_TAPIOBJECT         = 0x00000001,
    TE_ADDRESS            = 0x00000002,
    TE_CALLNOTIFICATION   = 0x00000004,
    TE_CALLSTATE          = 0x00000008,
    TE_CALLMEDIA          = 0x00000010,
    TE_CALLHUB            = 0x00000020,
    TE_CALLINFOCHANGE     = 0x00000040,
    TE_PRIVATE            = 0x00000080,
    TE_REQUEST            = 0x00000100,
    TE_AGENT              = 0x00000200,
    TE_AGENTSESSION       = 0x00000400,
    TE_QOSEVENT           = 0x00000800,
    TE_AGENTHANDLER       = 0x00001000,
    TE_ACDGROUP           = 0x00002000,
    TE_QUEUE              = 0x00004000,
    TE_DIGITEVENT         = 0x00008000,
    TE_GENERATEEVENT      = 0x00010000,
    TE_ASRTERMINAL        = 0x00020000,
    TE_TTSTERMINAL        = 0x00040000,
    TE_FILETERMINAL       = 0x00080000,
    TE_TONETERMINAL       = 0x00100000,
    TE_PHONEEVENT         = 0x00200000,
    TE_TONEEVENT          = 0x00400000,
    TE_GATHERDIGITS       = 0x00800000,
    TE_ADDRESSDEVSPECIFIC = 0x01000000,
    TE_PHONEDEVSPECIFIC   = 0x02000000,
}

alias CALL_NOTIFICATION_EVENT = int;
enum : int
{
    CNE_OWNER    = 0x00000000,
    CNE_MONITOR  = 0x00000001,
    CNE_LASTITEM = 0x00000001,
}

alias CALLHUB_EVENT = int;
enum : int
{
    CHE_CALLJOIN    = 0x00000000,
    CHE_CALLLEAVE   = 0x00000001,
    CHE_CALLHUBNEW  = 0x00000002,
    CHE_CALLHUBIDLE = 0x00000003,
    CHE_LASTITEM    = 0x00000003,
}

alias CALLHUB_STATE = int;
enum : int
{
    CHS_ACTIVE = 0x00000000,
    CHS_IDLE   = 0x00000001,
}

alias TAPIOBJECT_EVENT = int;
enum : int
{
    TE_ADDRESSCREATE   = 0x00000000,
    TE_ADDRESSREMOVE   = 0x00000001,
    TE_REINIT          = 0x00000002,
    TE_TRANSLATECHANGE = 0x00000003,
    TE_ADDRESSCLOSE    = 0x00000004,
    TE_PHONECREATE     = 0x00000005,
    TE_PHONEREMOVE     = 0x00000006,
}

alias TAPI_OBJECT_TYPE = int;
enum : int
{
    TOT_NONE     = 0x00000000,
    TOT_TAPI     = 0x00000001,
    TOT_ADDRESS  = 0x00000002,
    TOT_TERMINAL = 0x00000003,
    TOT_CALL     = 0x00000004,
    TOT_CALLHUB  = 0x00000005,
    TOT_PHONE    = 0x00000006,
}

alias QOS_SERVICE_LEVEL = int;
enum : int
{
    QSL_NEEDED       = 0x00000001,
    QSL_IF_AVAILABLE = 0x00000002,
    QSL_BEST_EFFORT  = 0x00000003,
}

alias QOS_EVENT = int;
enum : int
{
    QE_NOQOS            = 0x00000001,
    QE_ADMISSIONFAILURE = 0x00000002,
    QE_POLICYFAILURE    = 0x00000003,
    QE_GENERICERROR     = 0x00000004,
    QE_LASTITEM         = 0x00000004,
}

alias CALLINFOCHANGE_CAUSE = int;
enum : int
{
    CIC_OTHER         = 0x00000000,
    CIC_DEVSPECIFIC   = 0x00000001,
    CIC_BEARERMODE    = 0x00000002,
    CIC_RATE          = 0x00000003,
    CIC_APPSPECIFIC   = 0x00000004,
    CIC_CALLID        = 0x00000005,
    CIC_RELATEDCALLID = 0x00000006,
    CIC_ORIGIN        = 0x00000007,
    CIC_REASON        = 0x00000008,
    CIC_COMPLETIONID  = 0x00000009,
    CIC_NUMOWNERINCR  = 0x0000000a,
    CIC_NUMOWNERDECR  = 0x0000000b,
    CIC_NUMMONITORS   = 0x0000000c,
    CIC_TRUNK         = 0x0000000d,
    CIC_CALLERID      = 0x0000000e,
    CIC_CALLEDID      = 0x0000000f,
    CIC_CONNECTEDID   = 0x00000010,
    CIC_REDIRECTIONID = 0x00000011,
    CIC_REDIRECTINGID = 0x00000012,
    CIC_USERUSERINFO  = 0x00000013,
    CIC_HIGHLEVELCOMP = 0x00000014,
    CIC_LOWLEVELCOMP  = 0x00000015,
    CIC_CHARGINGINFO  = 0x00000016,
    CIC_TREATMENT     = 0x00000017,
    CIC_CALLDATA      = 0x00000018,
    CIC_PRIVILEGE     = 0x00000019,
    CIC_MEDIATYPE     = 0x0000001a,
    CIC_LASTITEM      = 0x0000001a,
}

alias CALLINFO_LONG = int;
enum : int
{
    CIL_MEDIATYPESAVAILABLE      = 0x00000000,
    CIL_BEARERMODE               = 0x00000001,
    CIL_CALLERIDADDRESSTYPE      = 0x00000002,
    CIL_CALLEDIDADDRESSTYPE      = 0x00000003,
    CIL_CONNECTEDIDADDRESSTYPE   = 0x00000004,
    CIL_REDIRECTIONIDADDRESSTYPE = 0x00000005,
    CIL_REDIRECTINGIDADDRESSTYPE = 0x00000006,
    CIL_ORIGIN                   = 0x00000007,
    CIL_REASON                   = 0x00000008,
    CIL_APPSPECIFIC              = 0x00000009,
    CIL_CALLPARAMSFLAGS          = 0x0000000a,
    CIL_CALLTREATMENT            = 0x0000000b,
    CIL_MINRATE                  = 0x0000000c,
    CIL_MAXRATE                  = 0x0000000d,
    CIL_COUNTRYCODE              = 0x0000000e,
    CIL_CALLID                   = 0x0000000f,
    CIL_RELATEDCALLID            = 0x00000010,
    CIL_COMPLETIONID             = 0x00000011,
    CIL_NUMBEROFOWNERS           = 0x00000012,
    CIL_NUMBEROFMONITORS         = 0x00000013,
    CIL_TRUNK                    = 0x00000014,
    CIL_RATE                     = 0x00000015,
    CIL_GENERATEDIGITDURATION    = 0x00000016,
    CIL_MONITORDIGITMODES        = 0x00000017,
    CIL_MONITORMEDIAMODES        = 0x00000018,
}

alias CALLINFO_STRING = int;
enum : int
{
    CIS_CALLERIDNAME            = 0x00000000,
    CIS_CALLERIDNUMBER          = 0x00000001,
    CIS_CALLEDIDNAME            = 0x00000002,
    CIS_CALLEDIDNUMBER          = 0x00000003,
    CIS_CONNECTEDIDNAME         = 0x00000004,
    CIS_CONNECTEDIDNUMBER       = 0x00000005,
    CIS_REDIRECTIONIDNAME       = 0x00000006,
    CIS_REDIRECTIONIDNUMBER     = 0x00000007,
    CIS_REDIRECTINGIDNAME       = 0x00000008,
    CIS_REDIRECTINGIDNUMBER     = 0x00000009,
    CIS_CALLEDPARTYFRIENDLYNAME = 0x0000000a,
    CIS_COMMENT                 = 0x0000000b,
    CIS_DISPLAYABLEADDRESS      = 0x0000000c,
    CIS_CALLINGPARTYID          = 0x0000000d,
}

alias CALLINFO_BUFFER = int;
enum : int
{
    CIB_USERUSERINFO                 = 0x00000000,
    CIB_DEVSPECIFICBUFFER            = 0x00000001,
    CIB_CALLDATABUFFER               = 0x00000002,
    CIB_CHARGINGINFOBUFFER           = 0x00000003,
    CIB_HIGHLEVELCOMPATIBILITYBUFFER = 0x00000004,
    CIB_LOWLEVELCOMPATIBILITYBUFFER  = 0x00000005,
}

alias ADDRESS_CAPABILITY = int;
enum : int
{
    AC_ADDRESSTYPES                 = 0x00000000,
    AC_BEARERMODES                  = 0x00000001,
    AC_MAXACTIVECALLS               = 0x00000002,
    AC_MAXONHOLDCALLS               = 0x00000003,
    AC_MAXONHOLDPENDINGCALLS        = 0x00000004,
    AC_MAXNUMCONFERENCE             = 0x00000005,
    AC_MAXNUMTRANSCONF              = 0x00000006,
    AC_MONITORDIGITSUPPORT          = 0x00000007,
    AC_GENERATEDIGITSUPPORT         = 0x00000008,
    AC_GENERATETONEMODES            = 0x00000009,
    AC_GENERATETONEMAXNUMFREQ       = 0x0000000a,
    AC_MONITORTONEMAXNUMFREQ        = 0x0000000b,
    AC_MONITORTONEMAXNUMENTRIES     = 0x0000000c,
    AC_DEVCAPFLAGS                  = 0x0000000d,
    AC_ANSWERMODES                  = 0x0000000e,
    AC_LINEFEATURES                 = 0x0000000f,
    AC_SETTABLEDEVSTATUS            = 0x00000010,
    AC_PARKSUPPORT                  = 0x00000011,
    AC_CALLERIDSUPPORT              = 0x00000012,
    AC_CALLEDIDSUPPORT              = 0x00000013,
    AC_CONNECTEDIDSUPPORT           = 0x00000014,
    AC_REDIRECTIONIDSUPPORT         = 0x00000015,
    AC_REDIRECTINGIDSUPPORT         = 0x00000016,
    AC_ADDRESSCAPFLAGS              = 0x00000017,
    AC_CALLFEATURES1                = 0x00000018,
    AC_CALLFEATURES2                = 0x00000019,
    AC_REMOVEFROMCONFCAPS           = 0x0000001a,
    AC_REMOVEFROMCONFSTATE          = 0x0000001b,
    AC_TRANSFERMODES                = 0x0000001c,
    AC_ADDRESSFEATURES              = 0x0000001d,
    AC_PREDICTIVEAUTOTRANSFERSTATES = 0x0000001e,
    AC_MAXCALLDATASIZE              = 0x0000001f,
    AC_LINEID                       = 0x00000020,
    AC_ADDRESSID                    = 0x00000021,
    AC_FORWARDMODES                 = 0x00000022,
    AC_MAXFORWARDENTRIES            = 0x00000023,
    AC_MAXSPECIFICENTRIES           = 0x00000024,
    AC_MINFWDNUMRINGS               = 0x00000025,
    AC_MAXFWDNUMRINGS               = 0x00000026,
    AC_MAXCALLCOMPLETIONS           = 0x00000027,
    AC_CALLCOMPLETIONCONDITIONS     = 0x00000028,
    AC_CALLCOMPLETIONMODES          = 0x00000029,
    AC_PERMANENTDEVICEID            = 0x0000002a,
    AC_GATHERDIGITSMINTIMEOUT       = 0x0000002b,
    AC_GATHERDIGITSMAXTIMEOUT       = 0x0000002c,
    AC_GENERATEDIGITMINDURATION     = 0x0000002d,
    AC_GENERATEDIGITMAXDURATION     = 0x0000002e,
    AC_GENERATEDIGITDEFAULTDURATION = 0x0000002f,
}

alias ADDRESS_CAPABILITY_STRING = int;
enum : int
{
    ACS_PROTOCOL              = 0x00000000,
    ACS_ADDRESSDEVICESPECIFIC = 0x00000001,
    ACS_LINEDEVICESPECIFIC    = 0x00000002,
    ACS_PROVIDERSPECIFIC      = 0x00000003,
    ACS_SWITCHSPECIFIC        = 0x00000004,
    ACS_PERMANENTDEVICEGUID   = 0x00000005,
}

alias FULLDUPLEX_SUPPORT = int;
enum : int
{
    FDS_SUPPORTED    = 0x00000000,
    FDS_NOTSUPPORTED = 0x00000001,
    FDS_UNKNOWN      = 0x00000002,
}

alias FINISH_MODE = int;
enum : int
{
    FM_ASTRANSFER   = 0x00000000,
    FM_ASCONFERENCE = 0x00000001,
}

alias PHONE_PRIVILEGE = int;
enum : int
{
    PP_OWNER   = 0x00000000,
    PP_MONITOR = 0x00000001,
}

alias PHONE_HOOK_SWITCH_DEVICE = int;
enum : int
{
    PHSD_HANDSET      = 0x00000001,
    PHSD_SPEAKERPHONE = 0x00000002,
    PHSD_HEADSET      = 0x00000004,
}

alias PHONE_HOOK_SWITCH_STATE = int;
enum : int
{
    PHSS_ONHOOK               = 0x00000001,
    PHSS_OFFHOOK_MIC_ONLY     = 0x00000002,
    PHSS_OFFHOOK_SPEAKER_ONLY = 0x00000004,
    PHSS_OFFHOOK              = 0x00000008,
}

alias PHONE_LAMP_MODE = int;
enum : int
{
    LM_DUMMY         = 0x00000001,
    LM_OFF           = 0x00000002,
    LM_STEADY        = 0x00000004,
    LM_WINK          = 0x00000008,
    LM_FLASH         = 0x00000010,
    LM_FLUTTER       = 0x00000020,
    LM_BROKENFLUTTER = 0x00000040,
    LM_UNKNOWN       = 0x00000080,
}

alias PHONECAPS_LONG = int;
enum : int
{
    PCL_HOOKSWITCHES                = 0x00000000,
    PCL_HANDSETHOOKSWITCHMODES      = 0x00000001,
    PCL_HEADSETHOOKSWITCHMODES      = 0x00000002,
    PCL_SPEAKERPHONEHOOKSWITCHMODES = 0x00000003,
    PCL_DISPLAYNUMROWS              = 0x00000004,
    PCL_DISPLAYNUMCOLUMNS           = 0x00000005,
    PCL_NUMRINGMODES                = 0x00000006,
    PCL_NUMBUTTONLAMPS              = 0x00000007,
    PCL_GENERICPHONE                = 0x00000008,
}

alias PHONECAPS_STRING = int;
enum : int
{
    PCS_PHONENAME    = 0x00000000,
    PCS_PHONEINFO    = 0x00000001,
    PCS_PROVIDERINFO = 0x00000002,
}

alias PHONECAPS_BUFFER = int;
enum : int
{
    PCB_DEVSPECIFICBUFFER = 0x00000000,
}

alias PHONE_BUTTON_STATE = int;
enum : int
{
    PBS_UP      = 0x00000001,
    PBS_DOWN    = 0x00000002,
    PBS_UNKNOWN = 0x00000004,
    PBS_UNAVAIL = 0x00000008,
}

alias PHONE_BUTTON_MODE = int;
enum : int
{
    PBM_DUMMY   = 0x00000000,
    PBM_CALL    = 0x00000001,
    PBM_FEATURE = 0x00000002,
    PBM_KEYPAD  = 0x00000003,
    PBM_LOCAL   = 0x00000004,
    PBM_DISPLAY = 0x00000005,
}

alias PHONE_BUTTON_FUNCTION = int;
enum : int
{
    PBF_UNKNOWN      = 0x00000000,
    PBF_CONFERENCE   = 0x00000001,
    PBF_TRANSFER     = 0x00000002,
    PBF_DROP         = 0x00000003,
    PBF_HOLD         = 0x00000004,
    PBF_RECALL       = 0x00000005,
    PBF_DISCONNECT   = 0x00000006,
    PBF_CONNECT      = 0x00000007,
    PBF_MSGWAITON    = 0x00000008,
    PBF_MSGWAITOFF   = 0x00000009,
    PBF_SELECTRING   = 0x0000000a,
    PBF_ABBREVDIAL   = 0x0000000b,
    PBF_FORWARD      = 0x0000000c,
    PBF_PICKUP       = 0x0000000d,
    PBF_RINGAGAIN    = 0x0000000e,
    PBF_PARK         = 0x0000000f,
    PBF_REJECT       = 0x00000010,
    PBF_REDIRECT     = 0x00000011,
    PBF_MUTE         = 0x00000012,
    PBF_VOLUMEUP     = 0x00000013,
    PBF_VOLUMEDOWN   = 0x00000014,
    PBF_SPEAKERON    = 0x00000015,
    PBF_SPEAKEROFF   = 0x00000016,
    PBF_FLASH        = 0x00000017,
    PBF_DATAON       = 0x00000018,
    PBF_DATAOFF      = 0x00000019,
    PBF_DONOTDISTURB = 0x0000001a,
    PBF_INTERCOM     = 0x0000001b,
    PBF_BRIDGEDAPP   = 0x0000001c,
    PBF_BUSY         = 0x0000001d,
    PBF_CALLAPP      = 0x0000001e,
    PBF_DATETIME     = 0x0000001f,
    PBF_DIRECTORY    = 0x00000020,
    PBF_COVER        = 0x00000021,
    PBF_CALLID       = 0x00000022,
    PBF_LASTNUM      = 0x00000023,
    PBF_NIGHTSRV     = 0x00000024,
    PBF_SENDCALLS    = 0x00000025,
    PBF_MSGINDICATOR = 0x00000026,
    PBF_REPDIAL      = 0x00000027,
    PBF_SETREPDIAL   = 0x00000028,
    PBF_SYSTEMSPEED  = 0x00000029,
    PBF_STATIONSPEED = 0x0000002a,
    PBF_CAMPON       = 0x0000002b,
    PBF_SAVEREPEAT   = 0x0000002c,
    PBF_QUEUECALL    = 0x0000002d,
    PBF_NONE         = 0x0000002e,
    PBF_SEND         = 0x0000002f,
}

alias PHONE_TONE = int;
enum : int
{
    PT_KEYPADZERO       = 0x00000000,
    PT_KEYPADONE        = 0x00000001,
    PT_KEYPADTWO        = 0x00000002,
    PT_KEYPADTHREE      = 0x00000003,
    PT_KEYPADFOUR       = 0x00000004,
    PT_KEYPADFIVE       = 0x00000005,
    PT_KEYPADSIX        = 0x00000006,
    PT_KEYPADSEVEN      = 0x00000007,
    PT_KEYPADEIGHT      = 0x00000008,
    PT_KEYPADNINE       = 0x00000009,
    PT_KEYPADSTAR       = 0x0000000a,
    PT_KEYPADPOUND      = 0x0000000b,
    PT_KEYPADA          = 0x0000000c,
    PT_KEYPADB          = 0x0000000d,
    PT_KEYPADC          = 0x0000000e,
    PT_KEYPADD          = 0x0000000f,
    PT_NORMALDIALTONE   = 0x00000010,
    PT_EXTERNALDIALTONE = 0x00000011,
    PT_BUSY             = 0x00000012,
    PT_RINGBACK         = 0x00000013,
    PT_ERRORTONE        = 0x00000014,
    PT_SILENCE          = 0x00000015,
}

alias PHONE_EVENT = int;
enum : int
{
    PE_DISPLAY        = 0x00000000,
    PE_LAMPMODE       = 0x00000001,
    PE_RINGMODE       = 0x00000002,
    PE_RINGVOLUME     = 0x00000003,
    PE_HOOKSWITCH     = 0x00000004,
    PE_CAPSCHANGE     = 0x00000005,
    PE_BUTTON         = 0x00000006,
    PE_CLOSE          = 0x00000007,
    PE_NUMBERGATHERED = 0x00000008,
    PE_DIALING        = 0x00000009,
    PE_ANSWER         = 0x0000000a,
    PE_DISCONNECT     = 0x0000000b,
    PE_LASTITEM       = 0x0000000b,
}

enum IID_ITTAPI = GUID(0xb1efc382, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITTAPI : IDispatch
{
    HRESULT Initialize();
    HRESULT Shutdown();
    HRESULT get_Addresses(VARIANT* pVariant);
    HRESULT EnumerateAddresses(IEnumAddress* ppEnumAddress);
    HRESULT RegisterCallNotifications(ITAddress pAddress, VARIANT_BOOL fMonitor, VARIANT_BOOL fOwner, int lMediaTypes, int lCallbackInstance, int* plRegister);
    HRESULT UnregisterNotifications(int lRegister);
    HRESULT get_CallHubs(VARIANT* pVariant);
    HRESULT EnumerateCallHubs(IEnumCallHub* ppEnumCallHub);
    HRESULT SetCallHubTracking(VARIANT pAddresses, VARIANT_BOOL bTracking);
    HRESULT EnumeratePrivateTAPIObjects(IEnumUnknown* ppEnumUnknown);
    HRESULT get_PrivateTAPIObjects(VARIANT* pVariant);
    HRESULT RegisterRequestRecipient(int lRegistrationInstance, int lRequestMode, VARIANT_BOOL fEnable);
    HRESULT SetAssistedTelephonyPriority(BSTR pAppFilename, VARIANT_BOOL fPriority);
    HRESULT SetApplicationPriority(BSTR pAppFilename, int lMediaType, VARIANT_BOOL fPriority);
    HRESULT put_EventFilter(int lFilterMask);
    HRESULT get_EventFilter(int* plFilterMask);
}
enum IID_ITTAPI2 = GUID(0x54fbdc8c, 0xd90f, 0x4dad, [0x96, 0x95, 0xb3, 0x73, 0x9, 0x7f, 0x9, 0x4b]);
interface ITTAPI2 : ITTAPI
{
    HRESULT get_Phones(VARIANT* pPhones);
    HRESULT EnumeratePhones(IEnumPhone* ppEnumPhone);
    HRESULT CreateEmptyCollectionObject(ITCollection2* ppCollection);
}
enum IID_ITMediaSupport = GUID(0xb1efc384, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITMediaSupport : IDispatch
{
    HRESULT get_MediaTypes(int* plMediaTypes);
    HRESULT QueryMediaType(int lMediaType, VARIANT_BOOL* pfSupport);
}
enum IID_ITPluggableTerminalClassInfo = GUID(0x41757f4a, 0xcf09, 0x4b34, [0xbc, 0x96, 0xa, 0x79, 0xd2, 0x39, 0x0, 0x76]);
interface ITPluggableTerminalClassInfo : IDispatch
{
    HRESULT get_Name(BSTR* pName);
    HRESULT get_Company(BSTR* pCompany);
    HRESULT get_Version(BSTR* pVersion);
    HRESULT get_TerminalClass(BSTR* pTerminalClass);
    HRESULT get_CLSID(BSTR* pCLSID);
    HRESULT get_Direction(TERMINAL_DIRECTION* pDirection);
    HRESULT get_MediaTypes(int* pMediaTypes);
}
enum IID_ITPluggableTerminalSuperclassInfo = GUID(0x6d54e42c, 0x4625, 0x4359, [0xa6, 0xf7, 0x63, 0x19, 0x99, 0x10, 0x7e, 0x5]);
interface ITPluggableTerminalSuperclassInfo : IDispatch
{
    HRESULT get_Name(BSTR* pName);
    HRESULT get_CLSID(BSTR* pCLSID);
}
enum IID_ITTerminalSupport = GUID(0xb1efc385, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITTerminalSupport : IDispatch
{
    HRESULT get_StaticTerminals(VARIANT* pVariant);
    HRESULT EnumerateStaticTerminals(IEnumTerminal* ppTerminalEnumerator);
    HRESULT get_DynamicTerminalClasses(VARIANT* pVariant);
    HRESULT EnumerateDynamicTerminalClasses(IEnumTerminalClass* ppTerminalClassEnumerator);
    HRESULT CreateTerminal(BSTR pTerminalClass, int lMediaType, TERMINAL_DIRECTION Direction, ITTerminal* ppTerminal);
    HRESULT GetDefaultStaticTerminal(int lMediaType, TERMINAL_DIRECTION Direction, ITTerminal* ppTerminal);
}
enum IID_ITTerminalSupport2 = GUID(0xf3eb39bc, 0x1b1f, 0x4e99, [0xa0, 0xc0, 0x56, 0x30, 0x5c, 0x4d, 0xd5, 0x91]);
interface ITTerminalSupport2 : ITTerminalSupport
{
    HRESULT get_PluggableSuperclasses(VARIANT* pVariant);
    HRESULT EnumeratePluggableSuperclasses(IEnumPluggableSuperclassInfo* ppSuperclassEnumerator);
    HRESULT get_PluggableTerminalClasses(BSTR bstrTerminalSuperclass, int lMediaType, VARIANT* pVariant);
    HRESULT EnumeratePluggableTerminalClasses(GUID iidTerminalSuperclass, int lMediaType, IEnumPluggableTerminalClassInfo* ppClassEnumerator);
}
enum IID_ITAddress = GUID(0xb1efc386, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITAddress : IDispatch
{
    HRESULT get_State(ADDRESS_STATE* pAddressState);
    HRESULT get_AddressName(BSTR* ppName);
    HRESULT get_ServiceProviderName(BSTR* ppName);
    HRESULT get_TAPIObject(ITTAPI* ppTapiObject);
    HRESULT CreateCall(BSTR pDestAddress, int lAddressType, int lMediaTypes, ITBasicCallControl* ppCall);
    HRESULT get_Calls(VARIANT* pVariant);
    HRESULT EnumerateCalls(IEnumCall* ppCallEnum);
    HRESULT get_DialableAddress(BSTR* pDialableAddress);
    HRESULT CreateForwardInfoObject(ITForwardInformation* ppForwardInfo);
    HRESULT Forward(ITForwardInformation pForwardInfo, ITBasicCallControl pCall);
    HRESULT get_CurrentForwardInfo(ITForwardInformation* ppForwardInfo);
    HRESULT put_MessageWaiting(VARIANT_BOOL fMessageWaiting);
    HRESULT get_MessageWaiting(VARIANT_BOOL* pfMessageWaiting);
    HRESULT put_DoNotDisturb(VARIANT_BOOL fDoNotDisturb);
    HRESULT get_DoNotDisturb(VARIANT_BOOL* pfDoNotDisturb);
}
enum IID_ITAddress2 = GUID(0xb0ae5d9b, 0xbe51, 0x46c9, [0xb0, 0xf7, 0xdf, 0xa8, 0xa2, 0x2a, 0x8b, 0xc4]);
interface ITAddress2 : ITAddress
{
    HRESULT get_Phones(VARIANT* pPhones);
    HRESULT EnumeratePhones(IEnumPhone* ppEnumPhone);
    HRESULT GetPhoneFromTerminal(ITTerminal pTerminal, ITPhone* ppPhone);
    HRESULT get_PreferredPhones(VARIANT* pPhones);
    HRESULT EnumeratePreferredPhones(IEnumPhone* ppEnumPhone);
    HRESULT get_EventFilter(TAPI_EVENT TapiEvent, int lSubEvent, VARIANT_BOOL* pEnable);
    HRESULT put_EventFilter(TAPI_EVENT TapiEvent, int lSubEvent, VARIANT_BOOL bEnable);
    HRESULT DeviceSpecific(ITCallInfo pCall, ubyte* pParams, uint dwSize);
    HRESULT DeviceSpecificVariant(ITCallInfo pCall, VARIANT varDevSpecificByteArray);
    HRESULT NegotiateExtVersion(int lLowVersion, int lHighVersion, int* plExtVersion);
}
enum IID_ITAddressCapabilities = GUID(0x8df232f5, 0x821b, 0x11d1, [0xbb, 0x5c, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITAddressCapabilities : IDispatch
{
    HRESULT get_AddressCapability(ADDRESS_CAPABILITY AddressCap, int* plCapability);
    HRESULT get_AddressCapabilityString(ADDRESS_CAPABILITY_STRING AddressCapString, BSTR* ppCapabilityString);
    HRESULT get_CallTreatments(VARIANT* pVariant);
    HRESULT EnumerateCallTreatments(IEnumBstr* ppEnumCallTreatment);
    HRESULT get_CompletionMessages(VARIANT* pVariant);
    HRESULT EnumerateCompletionMessages(IEnumBstr* ppEnumCompletionMessage);
    HRESULT get_DeviceClasses(VARIANT* pVariant);
    HRESULT EnumerateDeviceClasses(IEnumBstr* ppEnumDeviceClass);
}
enum IID_ITPhone = GUID(0x9d48db4, 0x10cc, 0x4388, [0x9d, 0xe7, 0xa8, 0x46, 0x56, 0x18, 0x97, 0x5a]);
interface ITPhone : IDispatch
{
    HRESULT Open(PHONE_PRIVILEGE Privilege);
    HRESULT Close();
    HRESULT get_Addresses(VARIANT* pAddresses);
    HRESULT EnumerateAddresses(IEnumAddress* ppEnumAddress);
    HRESULT get_PhoneCapsLong(PHONECAPS_LONG pclCap, int* plCapability);
    HRESULT get_PhoneCapsString(PHONECAPS_STRING pcsCap, BSTR* ppCapability);
    HRESULT get_Terminals(ITAddress pAddress, VARIANT* pTerminals);
    HRESULT EnumerateTerminals(ITAddress pAddress, IEnumTerminal* ppEnumTerminal);
    HRESULT get_ButtonMode(int lButtonID, PHONE_BUTTON_MODE* pButtonMode);
    HRESULT put_ButtonMode(int lButtonID, PHONE_BUTTON_MODE ButtonMode);
    HRESULT get_ButtonFunction(int lButtonID, PHONE_BUTTON_FUNCTION* pButtonFunction);
    HRESULT put_ButtonFunction(int lButtonID, PHONE_BUTTON_FUNCTION ButtonFunction);
    HRESULT get_ButtonText(int lButtonID, BSTR* ppButtonText);
    HRESULT put_ButtonText(int lButtonID, BSTR bstrButtonText);
    HRESULT get_ButtonState(int lButtonID, PHONE_BUTTON_STATE* pButtonState);
    HRESULT get_HookSwitchState(PHONE_HOOK_SWITCH_DEVICE HookSwitchDevice, PHONE_HOOK_SWITCH_STATE* pHookSwitchState);
    HRESULT put_HookSwitchState(PHONE_HOOK_SWITCH_DEVICE HookSwitchDevice, PHONE_HOOK_SWITCH_STATE HookSwitchState);
    HRESULT put_RingMode(int lRingMode);
    HRESULT get_RingMode(int* plRingMode);
    HRESULT put_RingVolume(int lRingVolume);
    HRESULT get_RingVolume(int* plRingVolume);
    HRESULT get_Privilege(PHONE_PRIVILEGE* pPrivilege);
    HRESULT GetPhoneCapsBuffer(PHONECAPS_BUFFER pcbCaps, uint* pdwSize, ubyte** ppPhoneCapsBuffer);
    HRESULT get_PhoneCapsBuffer(PHONECAPS_BUFFER pcbCaps, VARIANT* pVarBuffer);
    HRESULT get_LampMode(int lLampID, PHONE_LAMP_MODE* pLampMode);
    HRESULT put_LampMode(int lLampID, PHONE_LAMP_MODE LampMode);
    HRESULT get_Display(BSTR* pbstrDisplay);
    HRESULT SetDisplay(int lRow, int lColumn, BSTR bstrDisplay);
    HRESULT get_PreferredAddresses(VARIANT* pAddresses);
    HRESULT EnumeratePreferredAddresses(IEnumAddress* ppEnumAddress);
    HRESULT DeviceSpecific(ubyte* pParams, uint dwSize);
    HRESULT DeviceSpecificVariant(VARIANT varDevSpecificByteArray);
    HRESULT NegotiateExtVersion(int lLowVersion, int lHighVersion, int* plExtVersion);
}
enum IID_ITAutomatedPhoneControl = GUID(0x1ee1af0e, 0x6159, 0x4a61, [0xb7, 0x9b, 0x6a, 0x4b, 0xa3, 0xfc, 0x9d, 0xfc]);
interface ITAutomatedPhoneControl : IDispatch
{
    HRESULT StartTone(PHONE_TONE Tone, int lDuration);
    HRESULT StopTone();
    HRESULT get_Tone(PHONE_TONE* pTone);
    HRESULT StartRinger(int lRingMode, int lDuration);
    HRESULT StopRinger();
    HRESULT get_Ringer(VARIANT_BOOL* pfRinging);
    HRESULT put_PhoneHandlingEnabled(VARIANT_BOOL fEnabled);
    HRESULT get_PhoneHandlingEnabled(VARIANT_BOOL* pfEnabled);
    HRESULT put_AutoEndOfNumberTimeout(int lTimeout);
    HRESULT get_AutoEndOfNumberTimeout(int* plTimeout);
    HRESULT put_AutoDialtone(VARIANT_BOOL fEnabled);
    HRESULT get_AutoDialtone(VARIANT_BOOL* pfEnabled);
    HRESULT put_AutoStopTonesOnOnHook(VARIANT_BOOL fEnabled);
    HRESULT get_AutoStopTonesOnOnHook(VARIANT_BOOL* pfEnabled);
    HRESULT put_AutoStopRingOnOffHook(VARIANT_BOOL fEnabled);
    HRESULT get_AutoStopRingOnOffHook(VARIANT_BOOL* pfEnabled);
    HRESULT put_AutoKeypadTones(VARIANT_BOOL fEnabled);
    HRESULT get_AutoKeypadTones(VARIANT_BOOL* pfEnabled);
    HRESULT put_AutoKeypadTonesMinimumDuration(int lDuration);
    HRESULT get_AutoKeypadTonesMinimumDuration(int* plDuration);
    HRESULT put_AutoVolumeControl(VARIANT_BOOL fEnabled);
    HRESULT get_AutoVolumeControl(VARIANT_BOOL* fEnabled);
    HRESULT put_AutoVolumeControlStep(int lStepSize);
    HRESULT get_AutoVolumeControlStep(int* plStepSize);
    HRESULT put_AutoVolumeControlRepeatDelay(int lDelay);
    HRESULT get_AutoVolumeControlRepeatDelay(int* plDelay);
    HRESULT put_AutoVolumeControlRepeatPeriod(int lPeriod);
    HRESULT get_AutoVolumeControlRepeatPeriod(int* plPeriod);
    HRESULT SelectCall(ITCallInfo pCall, VARIANT_BOOL fSelectDefaultTerminals);
    HRESULT UnselectCall(ITCallInfo pCall);
    HRESULT EnumerateSelectedCalls(IEnumCall* ppCallEnum);
    HRESULT get_SelectedCalls(VARIANT* pVariant);
}
enum IID_ITBasicCallControl = GUID(0xb1efc389, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITBasicCallControl : IDispatch
{
    HRESULT Connect(VARIANT_BOOL fSync);
    HRESULT Answer();
    HRESULT Disconnect(DISCONNECT_CODE code);
    HRESULT Hold(VARIANT_BOOL fHold);
    HRESULT HandoffDirect(BSTR pApplicationName);
    HRESULT HandoffIndirect(int lMediaType);
    HRESULT Conference(ITBasicCallControl pCall, VARIANT_BOOL fSync);
    HRESULT Transfer(ITBasicCallControl pCall, VARIANT_BOOL fSync);
    HRESULT BlindTransfer(BSTR pDestAddress);
    HRESULT SwapHold(ITBasicCallControl pCall);
    HRESULT ParkDirect(BSTR pParkAddress);
    HRESULT ParkIndirect(BSTR* ppNonDirAddress);
    HRESULT Unpark();
    HRESULT SetQOS(int lMediaType, QOS_SERVICE_LEVEL ServiceLevel);
    HRESULT Pickup(BSTR pGroupID);
    HRESULT Dial(BSTR pDestAddress);
    HRESULT Finish(FINISH_MODE finishMode);
    HRESULT RemoveFromConference();
}
enum IID_ITCallInfo = GUID(0x350f85d1, 0x1227, 0x11d3, [0x83, 0xd4, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallInfo : IDispatch
{
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_CallState(CALL_STATE* pCallState);
    HRESULT get_Privilege(CALL_PRIVILEGE* pPrivilege);
    HRESULT get_CallHub(ITCallHub* ppCallHub);
    HRESULT get_CallInfoLong(CALLINFO_LONG CallInfoLong, int* plCallInfoLongVal);
    HRESULT put_CallInfoLong(CALLINFO_LONG CallInfoLong, int lCallInfoLongVal);
    HRESULT get_CallInfoString(CALLINFO_STRING CallInfoString, BSTR* ppCallInfoString);
    HRESULT put_CallInfoString(CALLINFO_STRING CallInfoString, BSTR pCallInfoString);
    HRESULT get_CallInfoBuffer(CALLINFO_BUFFER CallInfoBuffer, VARIANT* ppCallInfoBuffer);
    HRESULT put_CallInfoBuffer(CALLINFO_BUFFER CallInfoBuffer, VARIANT pCallInfoBuffer);
    HRESULT GetCallInfoBuffer(CALLINFO_BUFFER CallInfoBuffer, uint* pdwSize, ubyte** ppCallInfoBuffer);
    HRESULT SetCallInfoBuffer(CALLINFO_BUFFER CallInfoBuffer, uint dwSize, ubyte* pCallInfoBuffer);
    HRESULT ReleaseUserUserInfo();
}
enum IID_ITCallInfo2 = GUID(0x94d70ca6, 0x7ab0, 0x4daa, [0x81, 0xca, 0xb8, 0xf8, 0x64, 0x3f, 0xae, 0xc1]);
interface ITCallInfo2 : ITCallInfo
{
    HRESULT get_EventFilter(TAPI_EVENT TapiEvent, int lSubEvent, VARIANT_BOOL* pEnable);
    HRESULT put_EventFilter(TAPI_EVENT TapiEvent, int lSubEvent, VARIANT_BOOL bEnable);
}
enum IID_ITTerminal = GUID(0xb1efc38a, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITTerminal : IDispatch
{
    HRESULT get_Name(BSTR* ppName);
    HRESULT get_State(TERMINAL_STATE* pTerminalState);
    HRESULT get_TerminalType(TERMINAL_TYPE* pType);
    HRESULT get_TerminalClass(BSTR* ppTerminalClass);
    HRESULT get_MediaType(int* plMediaType);
    HRESULT get_Direction(TERMINAL_DIRECTION* pDirection);
}
enum IID_ITMultiTrackTerminal = GUID(0xfe040091, 0xade8, 0x4072, [0x95, 0xc9, 0xbf, 0x7d, 0xe8, 0xc5, 0x4b, 0x44]);
interface ITMultiTrackTerminal : IDispatch
{
    HRESULT get_TrackTerminals(VARIANT* pVariant);
    HRESULT EnumerateTrackTerminals(IEnumTerminal* ppEnumTerminal);
    HRESULT CreateTrackTerminal(int MediaType, TERMINAL_DIRECTION TerminalDirection, ITTerminal* ppTerminal);
    HRESULT get_MediaTypesInUse(int* plMediaTypesInUse);
    HRESULT get_DirectionsInUse(TERMINAL_DIRECTION* plDirectionsInUsed);
    HRESULT RemoveTrackTerminal(ITTerminal pTrackTerminalToRemove);
}
alias TERMINAL_MEDIA_STATE = int;
enum : int
{
    TMS_IDLE     = 0x00000000,
    TMS_ACTIVE   = 0x00000001,
    TMS_PAUSED   = 0x00000002,
    TMS_LASTITEM = 0x00000002,
}

alias FT_STATE_EVENT_CAUSE = int;
enum : int
{
    FTEC_NORMAL      = 0x00000000,
    FTEC_END_OF_FILE = 0x00000001,
    FTEC_READ_ERROR  = 0x00000002,
    FTEC_WRITE_ERROR = 0x00000003,
}

enum IID_ITFileTrack = GUID(0x31ca6ea9, 0xc08a, 0x4bea, [0x88, 0x11, 0x8e, 0x9c, 0x1b, 0xa3, 0xea, 0x3a]);
interface ITFileTrack : IDispatch
{
    HRESULT get_Format(AM_MEDIA_TYPE** ppmt);
    HRESULT put_Format(const(AM_MEDIA_TYPE)* pmt);
    HRESULT get_ControllingTerminal(ITTerminal* ppControllingTerminal);
    HRESULT get_AudioFormatForScripting(ITScriptableAudioFormat* ppAudioFormat);
    HRESULT put_AudioFormatForScripting(ITScriptableAudioFormat pAudioFormat);
    HRESULT get_EmptyAudioFormatForScripting(ITScriptableAudioFormat* ppAudioFormat);
}
enum IID_ITMediaPlayback = GUID(0x627e8ae6, 0xae4c, 0x4a69, [0xbb, 0x63, 0x2a, 0xd6, 0x25, 0x40, 0x4b, 0x77]);
interface ITMediaPlayback : IDispatch
{
    HRESULT put_PlayList(VARIANT PlayListVariant);
    HRESULT get_PlayList(VARIANT* pPlayListVariant);
}
enum IID_ITMediaRecord = GUID(0xf5dd4592, 0x5476, 0x4cc1, [0x9d, 0x4d, 0xfa, 0xd3, 0xee, 0xfe, 0x7d, 0xb2]);
interface ITMediaRecord : IDispatch
{
    HRESULT put_FileName(BSTR bstrFileName);
    HRESULT get_FileName(BSTR* pbstrFileName);
}
enum IID_ITMediaControl = GUID(0xc445dde8, 0x5199, 0x4bc7, [0x98, 0x7, 0x5f, 0xfb, 0x92, 0xe4, 0x2e, 0x9]);
interface ITMediaControl : IDispatch
{
    HRESULT Start();
    HRESULT Stop();
    HRESULT Pause();
    HRESULT get_MediaState(TERMINAL_MEDIA_STATE* pTerminalMediaState);
}
enum IID_ITBasicAudioTerminal = GUID(0xb1efc38d, 0x9355, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITBasicAudioTerminal : IDispatch
{
    HRESULT put_Volume(int lVolume);
    HRESULT get_Volume(int* plVolume);
    HRESULT put_Balance(int lBalance);
    HRESULT get_Balance(int* plBalance);
}
enum IID_ITStaticAudioTerminal = GUID(0xa86b7871, 0xd14c, 0x48e6, [0x92, 0x2e, 0xa8, 0xd1, 0x5f, 0x98, 0x48, 0x0]);
interface ITStaticAudioTerminal : IDispatch
{
    HRESULT get_WaveId(int* plWaveId);
}
enum IID_ITCallHub = GUID(0xa3c1544e, 0x5b92, 0x11d1, [0x8f, 0x4e, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallHub : IDispatch
{
    HRESULT Clear();
    HRESULT EnumerateCalls(IEnumCall* ppEnumCall);
    HRESULT get_Calls(VARIANT* pCalls);
    HRESULT get_NumCalls(int* plCalls);
    HRESULT get_State(CALLHUB_STATE* pState);
}
enum IID_ITLegacyAddressMediaControl = GUID(0xab493640, 0x4c0b, 0x11d2, [0xa0, 0x46, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITLegacyAddressMediaControl : IUnknown
{
    HRESULT GetID(BSTR pDeviceClass, uint* pdwSize, ubyte** ppDeviceID);
    HRESULT GetDevConfig(BSTR pDeviceClass, uint* pdwSize, ubyte** ppDeviceConfig);
    HRESULT SetDevConfig(BSTR pDeviceClass, uint dwSize, ubyte* pDeviceConfig);
}
enum IID_ITPrivateEvent = GUID(0xe269cd0, 0x10d4, 0x4121, [0x9c, 0x22, 0x9c, 0x85, 0xd6, 0x25, 0x65, 0xd]);
interface ITPrivateEvent : IDispatch
{
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_CallHub(ITCallHub* ppCallHub);
    HRESULT get_EventCode(int* plEventCode);
    HRESULT get_EventInterface(IDispatch* pEventInterface);
}
enum IID_ITLegacyAddressMediaControl2 = GUID(0xb0ee512b, 0xa531, 0x409e, [0x9d, 0xd9, 0x40, 0x99, 0xfe, 0x86, 0xc7, 0x38]);
interface ITLegacyAddressMediaControl2 : ITLegacyAddressMediaControl
{
    HRESULT ConfigDialog(HWND hwndOwner, BSTR pDeviceClass);
    HRESULT ConfigDialogEdit(HWND hwndOwner, BSTR pDeviceClass, uint dwSizeIn, ubyte* pDeviceConfigIn, uint* pdwSizeOut, ubyte** ppDeviceConfigOut);
}
enum IID_ITLegacyCallMediaControl = GUID(0xd624582f, 0xcc23, 0x4436, [0xb8, 0xa5, 0x47, 0xc6, 0x25, 0xc8, 0x4, 0x5d]);
interface ITLegacyCallMediaControl : IDispatch
{
    HRESULT DetectDigits(int DigitMode);
    HRESULT GenerateDigits(BSTR pDigits, int DigitMode);
    HRESULT GetID(BSTR pDeviceClass, uint* pdwSize, ubyte** ppDeviceID);
    HRESULT SetMediaType(int lMediaType);
    HRESULT MonitorMedia(int lMediaType);
}
enum IID_ITLegacyCallMediaControl2 = GUID(0x57ca332d, 0x7bc2, 0x44f1, [0xa6, 0xc, 0x93, 0x6f, 0xe8, 0xd7, 0xce, 0x73]);
interface ITLegacyCallMediaControl2 : ITLegacyCallMediaControl
{
    HRESULT GenerateDigits2(BSTR pDigits, int DigitMode, int lDuration);
    HRESULT GatherDigits(int DigitMode, int lNumDigits, BSTR pTerminationDigits, int lFirstDigitTimeout, int lInterDigitTimeout);
    HRESULT DetectTones(TAPI_DETECTTONE* pToneList, int lNumTones);
    HRESULT DetectTonesByCollection(ITCollection2 pDetectToneCollection);
    HRESULT GenerateTone(TAPI_TONEMODE ToneMode, int lDuration);
    HRESULT GenerateCustomTones(TAPI_CUSTOMTONE* pToneList, int lNumTones, int lDuration);
    HRESULT GenerateCustomTonesByCollection(ITCollection2 pCustomToneCollection, int lDuration);
    HRESULT CreateDetectToneObject(ITDetectTone* ppDetectTone);
    HRESULT CreateCustomToneObject(ITCustomTone* ppCustomTone);
    HRESULT GetIDAsVariant(BSTR bstrDeviceClass, VARIANT* pVarDeviceID);
}
enum IID_ITDetectTone = GUID(0x961f79bd, 0x3097, 0x49df, [0xa1, 0xd6, 0x90, 0x9b, 0x77, 0xe8, 0x9c, 0xa0]);
interface ITDetectTone : IDispatch
{
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT put_AppSpecific(int lAppSpecific);
    HRESULT get_Duration(int* plDuration);
    HRESULT put_Duration(int lDuration);
    HRESULT get_Frequency(int Index, int* plFrequency);
    HRESULT put_Frequency(int Index, int lFrequency);
}
enum IID_ITCustomTone = GUID(0x357ad764, 0xb3c6, 0x4b2a, [0x8f, 0xa5, 0x7, 0x22, 0x82, 0x7a, 0x92, 0x54]);
interface ITCustomTone : IDispatch
{
    HRESULT get_Frequency(int* plFrequency);
    HRESULT put_Frequency(int lFrequency);
    HRESULT get_CadenceOn(int* plCadenceOn);
    HRESULT put_CadenceOn(int CadenceOn);
    HRESULT get_CadenceOff(int* plCadenceOff);
    HRESULT put_CadenceOff(int lCadenceOff);
    HRESULT get_Volume(int* plVolume);
    HRESULT put_Volume(int lVolume);
}
enum IID_IEnumPhone = GUID(0xf15b7669, 0x4780, 0x4595, [0x8c, 0x89, 0xfb, 0x36, 0x9c, 0x8c, 0xf7, 0xaa]);
interface IEnumPhone : IUnknown
{
    HRESULT Next(uint celt, ITPhone* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumPhone* ppEnum);
}
enum IID_IEnumTerminal = GUID(0xae269cf4, 0x935e, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface IEnumTerminal : IUnknown
{
    HRESULT Next(uint celt, ITTerminal* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumTerminal* ppEnum);
}
enum IID_IEnumTerminalClass = GUID(0xae269cf5, 0x935e, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface IEnumTerminalClass : IUnknown
{
    HRESULT Next(uint celt, GUID* pElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumTerminalClass* ppEnum);
}
enum IID_IEnumCall = GUID(0xae269cf6, 0x935e, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface IEnumCall : IUnknown
{
    HRESULT Next(uint celt, ITCallInfo* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumCall* ppEnum);
}
enum IID_IEnumAddress = GUID(0x1666fca1, 0x9363, 0x11d0, [0x83, 0x5c, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface IEnumAddress : IUnknown
{
    HRESULT Next(uint celt, ITAddress* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumAddress* ppEnum);
}
enum IID_IEnumCallHub = GUID(0xa3c15450, 0x5b92, 0x11d1, [0x8f, 0x4e, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface IEnumCallHub : IUnknown
{
    HRESULT Next(uint celt, ITCallHub* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumCallHub* ppEnum);
}
enum IID_IEnumBstr = GUID(0x35372049, 0xbc6, 0x11d2, [0xa0, 0x33, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface IEnumBstr : IUnknown
{
    HRESULT Next(uint celt, BSTR* ppStrings, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumBstr* ppEnum);
}
enum IID_IEnumPluggableTerminalClassInfo = GUID(0x4567450c, 0xdbee, 0x4e3f, [0xaa, 0xf5, 0x37, 0xbf, 0x9e, 0xbf, 0x5e, 0x29]);
interface IEnumPluggableTerminalClassInfo : IUnknown
{
    HRESULT Next(uint celt, ITPluggableTerminalClassInfo* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumPluggableTerminalClassInfo* ppEnum);
}
enum IID_IEnumPluggableSuperclassInfo = GUID(0xe9586a80, 0x89e6, 0x4cff, [0x93, 0x1d, 0x47, 0x8d, 0x57, 0x51, 0xf4, 0xc0]);
interface IEnumPluggableSuperclassInfo : IUnknown
{
    HRESULT Next(uint celt, ITPluggableTerminalSuperclassInfo* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumPluggableSuperclassInfo* ppEnum);
}
enum IID_ITPhoneEvent = GUID(0x8f942dd8, 0x64ed, 0x4aaf, [0xa7, 0x7d, 0xb2, 0x3d, 0xb0, 0x83, 0x7e, 0xad]);
interface ITPhoneEvent : IDispatch
{
    HRESULT get_Phone(ITPhone* ppPhone);
    HRESULT get_Event(PHONE_EVENT* pEvent);
    HRESULT get_ButtonState(PHONE_BUTTON_STATE* pState);
    HRESULT get_HookSwitchState(PHONE_HOOK_SWITCH_STATE* pState);
    HRESULT get_HookSwitchDevice(PHONE_HOOK_SWITCH_DEVICE* pDevice);
    HRESULT get_RingMode(int* plRingMode);
    HRESULT get_ButtonLampId(int* plButtonLampId);
    HRESULT get_NumberGathered(BSTR* ppNumber);
    HRESULT get_Call(ITCallInfo* ppCallInfo);
}
enum IID_ITCallStateEvent = GUID(0x62f47097, 0x95c9, 0x11d0, [0x83, 0x5d, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITCallStateEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_State(CALL_STATE* pCallState);
    HRESULT get_Cause(CALL_STATE_EVENT_CAUSE* pCEC);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITPhoneDeviceSpecificEvent = GUID(0x63ffb2a6, 0x872b, 0x4cd3, [0xa5, 0x1, 0x32, 0x6e, 0x8f, 0xb4, 0xa, 0xf7]);
interface ITPhoneDeviceSpecificEvent : IDispatch
{
    HRESULT get_Phone(ITPhone* ppPhone);
    HRESULT get_lParam1(int* pParam1);
    HRESULT get_lParam2(int* pParam2);
    HRESULT get_lParam3(int* pParam3);
}
enum IID_ITCallMediaEvent = GUID(0xff36b87f, 0xec3a, 0x11d0, [0x8e, 0xe4, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallMediaEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_Event(CALL_MEDIA_EVENT* pCallMediaEvent);
    HRESULT get_Error(HRESULT* phrError);
    HRESULT get_Terminal(ITTerminal* ppTerminal);
    HRESULT get_Stream(ITStream* ppStream);
    HRESULT get_Cause(CALL_MEDIA_EVENT_CAUSE* pCause);
}
enum IID_ITDigitDetectionEvent = GUID(0x80d3bfac, 0x57d9, 0x11d2, [0xa0, 0x4a, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITDigitDetectionEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_Digit(ubyte* pucDigit);
    HRESULT get_DigitMode(int* pDigitMode);
    HRESULT get_TickCount(int* plTickCount);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITDigitGenerationEvent = GUID(0x80d3bfad, 0x57d9, 0x11d2, [0xa0, 0x4a, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITDigitGenerationEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_GenerationTermination(int* plGenerationTermination);
    HRESULT get_TickCount(int* plTickCount);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITDigitsGatheredEvent = GUID(0xe52ec4c1, 0xcba3, 0x441a, [0x9e, 0x6a, 0x93, 0xcb, 0x90, 0x9e, 0x97, 0x24]);
interface ITDigitsGatheredEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_Digits(BSTR* ppDigits);
    HRESULT get_GatherTermination(TAPI_GATHERTERM* pGatherTermination);
    HRESULT get_TickCount(int* plTickCount);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITToneDetectionEvent = GUID(0x407e0faf, 0xd047, 0x4753, [0xb0, 0xc6, 0x8e, 0x6, 0x3, 0x73, 0xfe, 0xcd]);
interface ITToneDetectionEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCallInfo);
    HRESULT get_AppSpecific(int* plAppSpecific);
    HRESULT get_TickCount(int* plTickCount);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITTAPIObjectEvent = GUID(0xf4854d48, 0x937a, 0x11d1, [0xbb, 0x58, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITTAPIObjectEvent : IDispatch
{
    HRESULT get_TAPIObject(ITTAPI* ppTAPIObject);
    HRESULT get_Event(TAPIOBJECT_EVENT* pEvent);
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITTAPIObjectEvent2 = GUID(0x359dda6e, 0x68ce, 0x4383, [0xbf, 0xb, 0x16, 0x91, 0x33, 0xc4, 0x1b, 0x46]);
interface ITTAPIObjectEvent2 : ITTAPIObjectEvent
{
    HRESULT get_Phone(ITPhone* ppPhone);
}
enum IID_ITTAPIEventNotification = GUID(0xeddb9426, 0x3b91, 0x11d1, [0x8f, 0x30, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITTAPIEventNotification : IUnknown
{
    HRESULT Event(TAPI_EVENT TapiEvent, IDispatch pEvent);
}
enum IID_ITCallHubEvent = GUID(0xa3c15451, 0x5b92, 0x11d1, [0x8f, 0x4e, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallHubEvent : IDispatch
{
    HRESULT get_Event(CALLHUB_EVENT* pEvent);
    HRESULT get_CallHub(ITCallHub* ppCallHub);
    HRESULT get_Call(ITCallInfo* ppCall);
}
enum IID_ITAddressEvent = GUID(0x831ce2d1, 0x83b5, 0x11d1, [0xbb, 0x5c, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITAddressEvent : IDispatch
{
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_Event(ADDRESS_EVENT* pEvent);
    HRESULT get_Terminal(ITTerminal* ppTerminal);
}
enum IID_ITAddressDeviceSpecificEvent = GUID(0x3acb216b, 0x40bd, 0x487a, [0x86, 0x72, 0x5c, 0xe7, 0x7b, 0xd7, 0xe3, 0xa3]);
interface ITAddressDeviceSpecificEvent : IDispatch
{
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_lParam1(int* pParam1);
    HRESULT get_lParam2(int* pParam2);
    HRESULT get_lParam3(int* pParam3);
}
enum IID_ITFileTerminalEvent = GUID(0xe4a7fbac, 0x8c17, 0x4427, [0x9f, 0x55, 0x9f, 0x58, 0x9a, 0xc8, 0xaf, 0x0]);
interface ITFileTerminalEvent : IDispatch
{
    HRESULT get_Terminal(ITTerminal* ppTerminal);
    HRESULT get_Track(ITFileTrack* ppTrackTerminal);
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_State(TERMINAL_MEDIA_STATE* pState);
    HRESULT get_Cause(FT_STATE_EVENT_CAUSE* pCause);
    HRESULT get_Error(HRESULT* phrErrorCode);
}
enum IID_ITTTSTerminalEvent = GUID(0xd964788f, 0x95a5, 0x461d, [0xab, 0xc, 0xb9, 0x90, 0xa, 0x6c, 0x27, 0x13]);
interface ITTTSTerminalEvent : IDispatch
{
    HRESULT get_Terminal(ITTerminal* ppTerminal);
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Error(HRESULT* phrErrorCode);
}
enum IID_ITASRTerminalEvent = GUID(0xee016a02, 0x4fa9, 0x467c, [0x93, 0x3f, 0x5a, 0x15, 0xb1, 0x23, 0x77, 0xd7]);
interface ITASRTerminalEvent : IDispatch
{
    HRESULT get_Terminal(ITTerminal* ppTerminal);
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Error(HRESULT* phrErrorCode);
}
enum IID_ITToneTerminalEvent = GUID(0xe6f56009, 0x611f, 0x4945, [0xbb, 0xd2, 0x2d, 0xc, 0xe5, 0x61, 0x20, 0x56]);
interface ITToneTerminalEvent : IDispatch
{
    HRESULT get_Terminal(ITTerminal* ppTerminal);
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Error(HRESULT* phrErrorCode);
}
enum IID_ITQOSEvent = GUID(0xcfa3357c, 0xad77, 0x11d1, [0xbb, 0x68, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITQOSEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Event(QOS_EVENT* pQosEvent);
    HRESULT get_MediaType(int* plMediaType);
}
enum IID_ITCallInfoChangeEvent = GUID(0x5d4b65f9, 0xe51c, 0x11d1, [0xa0, 0x2f, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallInfoChangeEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Cause(CALLINFOCHANGE_CAUSE* pCIC);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITRequest = GUID(0xac48ffdf, 0xf8c4, 0x11d1, [0xa0, 0x30, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITRequest : IDispatch
{
    HRESULT MakeCall(BSTR pDestAddress, BSTR pAppName, BSTR pCalledParty, BSTR pComment);
}
enum IID_ITRequestEvent = GUID(0xac48ffde, 0xf8c4, 0x11d1, [0xa0, 0x30, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITRequestEvent : IDispatch
{
    HRESULT get_RegistrationInstance(int* plRegistrationInstance);
    HRESULT get_RequestMode(int* plRequestMode);
    HRESULT get_DestAddress(BSTR* ppDestAddress);
    HRESULT get_AppName(BSTR* ppAppName);
    HRESULT get_CalledParty(BSTR* ppCalledParty);
    HRESULT get_Comment(BSTR* ppComment);
}
enum IID_ITCollection = GUID(0x5ec5acf2, 0x9c02, 0x11d0, [0x83, 0x62, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
interface ITCollection : IDispatch
{
    HRESULT get_Count(int* lCount);
    HRESULT get_Item(int Index, VARIANT* pVariant);
    HRESULT get__NewEnum(IUnknown* ppNewEnum);
}
enum IID_ITCollection2 = GUID(0xe6dddda5, 0xa6d3, 0x48ff, [0x87, 0x37, 0xd3, 0x2f, 0xc4, 0xd9, 0x54, 0x77]);
interface ITCollection2 : ITCollection
{
    HRESULT Add(int Index, VARIANT* pVariant);
    HRESULT Remove(int Index);
}
enum IID_ITForwardInformation = GUID(0x449f659e, 0x88a3, 0x11d1, [0xbb, 0x5d, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITForwardInformation : IDispatch
{
    HRESULT put_NumRingsNoAnswer(int lNumRings);
    HRESULT get_NumRingsNoAnswer(int* plNumRings);
    HRESULT SetForwardType(int ForwardType, BSTR pDestAddress, BSTR pCallerAddress);
    HRESULT get_ForwardTypeDestination(int ForwardType, BSTR* ppDestAddress);
    HRESULT get_ForwardTypeCaller(int Forwardtype, BSTR* ppCallerAddress);
    HRESULT GetForwardType(int ForwardType, BSTR* ppDestinationAddress, BSTR* ppCallerAddress);
    HRESULT Clear();
}
enum IID_ITForwardInformation2 = GUID(0x5229b4ed, 0xb260, 0x4382, [0x8e, 0x1a, 0x5d, 0xf3, 0xa8, 0xa4, 0xcc, 0xc0]);
interface ITForwardInformation2 : ITForwardInformation
{
    HRESULT SetForwardType2(int ForwardType, BSTR pDestAddress, int DestAddressType, BSTR pCallerAddress, int CallerAddressType);
    HRESULT GetForwardType2(int ForwardType, BSTR* ppDestinationAddress, int* pDestAddressType, BSTR* ppCallerAddress, int* pCallerAddressType);
    HRESULT get_ForwardTypeDestinationAddressType(int ForwardType, int* pDestAddressType);
    HRESULT get_ForwardTypeCallerAddressType(int Forwardtype, int* pCallerAddressType);
}
enum IID_ITAddressTranslation = GUID(0xc4d8f03, 0x8ddb, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAddressTranslation : IDispatch
{
    HRESULT TranslateAddress(BSTR pAddressToTranslate, int lCard, int lTranslateOptions, ITAddressTranslationInfo* ppTranslated);
    HRESULT TranslateDialog(long hwndOwner, BSTR pAddressIn);
    HRESULT EnumerateLocations(IEnumLocation* ppEnumLocation);
    HRESULT get_Locations(VARIANT* pVariant);
    HRESULT EnumerateCallingCards(IEnumCallingCard* ppEnumCallingCard);
    HRESULT get_CallingCards(VARIANT* pVariant);
}
enum IID_ITAddressTranslationInfo = GUID(0xafc15945, 0x8d40, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAddressTranslationInfo : IDispatch
{
    HRESULT get_DialableString(BSTR* ppDialableString);
    HRESULT get_DisplayableString(BSTR* ppDisplayableString);
    HRESULT get_CurrentCountryCode(int* CountryCode);
    HRESULT get_DestinationCountryCode(int* CountryCode);
    HRESULT get_TranslationResults(int* plResults);
}
enum IID_ITLocationInfo = GUID(0xc4d8eff, 0x8ddb, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITLocationInfo : IDispatch
{
    HRESULT get_PermanentLocationID(int* plLocationID);
    HRESULT get_CountryCode(int* plCountryCode);
    HRESULT get_CountryID(int* plCountryID);
    HRESULT get_Options(int* plOptions);
    HRESULT get_PreferredCardID(int* plCardID);
    HRESULT get_LocationName(BSTR* ppLocationName);
    HRESULT get_CityCode(BSTR* ppCode);
    HRESULT get_LocalAccessCode(BSTR* ppCode);
    HRESULT get_LongDistanceAccessCode(BSTR* ppCode);
    HRESULT get_TollPrefixList(BSTR* ppTollList);
    HRESULT get_CancelCallWaitingCode(BSTR* ppCode);
}
enum IID_IEnumLocation = GUID(0xc4d8f01, 0x8ddb, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumLocation : IUnknown
{
    HRESULT Next(uint celt, ITLocationInfo* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumLocation* ppEnum);
}
enum IID_ITCallingCard = GUID(0xc4d8f00, 0x8ddb, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITCallingCard : IDispatch
{
    HRESULT get_PermanentCardID(int* plCardID);
    HRESULT get_NumberOfDigits(int* plDigits);
    HRESULT get_Options(int* plOptions);
    HRESULT get_CardName(BSTR* ppCardName);
    HRESULT get_SameAreaDialingRule(BSTR* ppRule);
    HRESULT get_LongDistanceDialingRule(BSTR* ppRule);
    HRESULT get_InternationalDialingRule(BSTR* ppRule);
}
enum IID_IEnumCallingCard = GUID(0xc4d8f02, 0x8ddb, 0x11d1, [0xa0, 0x9e, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumCallingCard : IUnknown
{
    HRESULT Next(uint celt, ITCallingCard* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumCallingCard* ppEnum);
}
enum IID_ITCallNotificationEvent = GUID(0x895801df, 0x3dd6, 0x11d1, [0x8f, 0x30, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITCallNotificationEvent : IDispatch
{
    HRESULT get_Call(ITCallInfo* ppCall);
    HRESULT get_Event(CALL_NOTIFICATION_EVENT* pCallNotificationEvent);
    HRESULT get_CallbackInstance(int* plCallbackInstance);
}
enum IID_ITDispatchMapper = GUID(0xe9225295, 0xc759, 0x11d1, [0xa0, 0x2b, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITDispatchMapper : IDispatch
{
    HRESULT QueryDispatchInterface(BSTR pIID, IDispatch pInterfaceToMap, IDispatch* ppReturnedInterface);
}
enum IID_ITStreamControl = GUID(0xee3bd604, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITStreamControl : IDispatch
{
    HRESULT CreateStream(int lMediaType, TERMINAL_DIRECTION td, ITStream* ppStream);
    HRESULT RemoveStream(ITStream pStream);
    HRESULT EnumerateStreams(IEnumStream* ppEnumStream);
    HRESULT get_Streams(VARIANT* pVariant);
}
enum IID_ITStream = GUID(0xee3bd605, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITStream : IDispatch
{
    HRESULT get_MediaType(int* plMediaType);
    HRESULT get_Direction(TERMINAL_DIRECTION* pTD);
    HRESULT get_Name(BSTR* ppName);
    HRESULT StartStream();
    HRESULT PauseStream();
    HRESULT StopStream();
    HRESULT SelectTerminal(ITTerminal pTerminal);
    HRESULT UnselectTerminal(ITTerminal pTerminal);
    HRESULT EnumerateTerminals(IEnumTerminal* ppEnumTerminal);
    HRESULT get_Terminals(VARIANT* pTerminals);
}
enum IID_IEnumStream = GUID(0xee3bd606, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface IEnumStream : IUnknown
{
    HRESULT Next(uint celt, ITStream* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumStream* ppEnum);
}
enum IID_ITSubStreamControl = GUID(0xee3bd607, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITSubStreamControl : IDispatch
{
    HRESULT CreateSubStream(ITSubStream* ppSubStream);
    HRESULT RemoveSubStream(ITSubStream pSubStream);
    HRESULT EnumerateSubStreams(IEnumSubStream* ppEnumSubStream);
    HRESULT get_SubStreams(VARIANT* pVariant);
}
enum IID_ITSubStream = GUID(0xee3bd608, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITSubStream : IDispatch
{
    HRESULT StartSubStream();
    HRESULT PauseSubStream();
    HRESULT StopSubStream();
    HRESULT SelectTerminal(ITTerminal pTerminal);
    HRESULT UnselectTerminal(ITTerminal pTerminal);
    HRESULT EnumerateTerminals(IEnumTerminal* ppEnumTerminal);
    HRESULT get_Terminals(VARIANT* pTerminals);
    HRESULT get_Stream(ITStream* ppITStream);
}
enum IID_IEnumSubStream = GUID(0xee3bd609, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface IEnumSubStream : IUnknown
{
    HRESULT Next(uint celt, ITSubStream* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumSubStream* ppEnum);
}
enum IID_ITLegacyWaveSupport = GUID(0x207823ea, 0xe252, 0x11d2, [0xb7, 0x7e, 0x0, 0x80, 0xc7, 0x13, 0x53, 0x81]);
interface ITLegacyWaveSupport : IDispatch
{
    HRESULT IsFullDuplex(FULLDUPLEX_SUPPORT* pSupport);
}
enum IID_ITBasicCallControl2 = GUID(0x161a4a56, 0x1e99, 0x4b3f, [0xa4, 0x6a, 0x16, 0x8f, 0x38, 0xa5, 0xee, 0x4c]);
interface ITBasicCallControl2 : ITBasicCallControl
{
    HRESULT RequestTerminal(BSTR bstrTerminalClassGUID, int lMediaType, TERMINAL_DIRECTION Direction, ITTerminal* ppTerminal);
    HRESULT SelectTerminalOnCall(ITTerminal pTerminal);
    HRESULT UnselectTerminalOnCall(ITTerminal pTerminal);
}
enum IID_ITScriptableAudioFormat = GUID(0xb87658bd, 0x3c59, 0x4f64, [0xbe, 0x74, 0xae, 0xde, 0x3e, 0x86, 0xa8, 0x1e]);
interface ITScriptableAudioFormat : IDispatch
{
    HRESULT get_Channels(int* pVal);
    HRESULT put_Channels(const(int) nNewVal);
    HRESULT get_SamplesPerSec(int* pVal);
    HRESULT put_SamplesPerSec(const(int) nNewVal);
    HRESULT get_AvgBytesPerSec(int* pVal);
    HRESULT put_AvgBytesPerSec(const(int) nNewVal);
    HRESULT get_BlockAlign(int* pVal);
    HRESULT put_BlockAlign(const(int) nNewVal);
    HRESULT get_BitsPerSample(int* pVal);
    HRESULT put_BitsPerSample(const(int) nNewVal);
    HRESULT get_FormatTag(int* pVal);
    HRESULT put_FormatTag(const(int) nNewVal);
}
alias AGENT_EVENT = int;
enum : int
{
    AE_NOT_READY     = 0x00000000,
    AE_READY         = 0x00000001,
    AE_BUSY_ACD      = 0x00000002,
    AE_BUSY_INCOMING = 0x00000003,
    AE_BUSY_OUTGOING = 0x00000004,
    AE_UNKNOWN       = 0x00000005,
}

alias AGENT_STATE = int;
enum : int
{
    AS_NOT_READY     = 0x00000000,
    AS_READY         = 0x00000001,
    AS_BUSY_ACD      = 0x00000002,
    AS_BUSY_INCOMING = 0x00000003,
    AS_BUSY_OUTGOING = 0x00000004,
    AS_UNKNOWN       = 0x00000005,
}

alias AGENT_SESSION_EVENT = int;
enum : int
{
    ASE_NEW_SESSION = 0x00000000,
    ASE_NOT_READY   = 0x00000001,
    ASE_READY       = 0x00000002,
    ASE_BUSY        = 0x00000003,
    ASE_WRAPUP      = 0x00000004,
    ASE_END         = 0x00000005,
}

alias AGENT_SESSION_STATE = int;
enum : int
{
    ASST_NOT_READY     = 0x00000000,
    ASST_READY         = 0x00000001,
    ASST_BUSY_ON_CALL  = 0x00000002,
    ASST_BUSY_WRAPUP   = 0x00000003,
    ASST_SESSION_ENDED = 0x00000004,
}

alias AGENTHANDLER_EVENT = int;
enum : int
{
    AHE_NEW_AGENTHANDLER     = 0x00000000,
    AHE_AGENTHANDLER_REMOVED = 0x00000001,
}

alias ACDGROUP_EVENT = int;
enum : int
{
    ACDGE_NEW_GROUP     = 0x00000000,
    ACDGE_GROUP_REMOVED = 0x00000001,
}

alias ACDQUEUE_EVENT = int;
enum : int
{
    ACDQE_NEW_QUEUE     = 0x00000000,
    ACDQE_QUEUE_REMOVED = 0x00000001,
}

enum IID_ITAgent = GUID(0x5770ece5, 0x4b27, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgent : IDispatch
{
    HRESULT EnumerateAgentSessions(IEnumAgentSession* ppEnumAgentSession);
    HRESULT CreateSession(ITACDGroup pACDGroup, ITAddress pAddress, ITAgentSession* ppAgentSession);
    HRESULT CreateSessionWithPIN(ITACDGroup pACDGroup, ITAddress pAddress, BSTR pPIN, ITAgentSession* ppAgentSession);
    HRESULT get_ID(BSTR* ppID);
    HRESULT get_User(BSTR* ppUser);
    HRESULT put_State(AGENT_STATE AgentState);
    HRESULT get_State(AGENT_STATE* pAgentState);
    HRESULT put_MeasurementPeriod(int lPeriod);
    HRESULT get_MeasurementPeriod(int* plPeriod);
    HRESULT get_OverallCallRate(CY* pcyCallrate);
    HRESULT get_NumberOfACDCalls(int* plCalls);
    HRESULT get_NumberOfIncomingCalls(int* plCalls);
    HRESULT get_NumberOfOutgoingCalls(int* plCalls);
    HRESULT get_TotalACDTalkTime(int* plTalkTime);
    HRESULT get_TotalACDCallTime(int* plCallTime);
    HRESULT get_TotalWrapUpTime(int* plWrapUpTime);
    HRESULT get_AgentSessions(VARIANT* pVariant);
}
enum IID_ITAgentSession = GUID(0x5afc3147, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgentSession : IDispatch
{
    HRESULT get_Agent(ITAgent* ppAgent);
    HRESULT get_Address(ITAddress* ppAddress);
    HRESULT get_ACDGroup(ITACDGroup* ppACDGroup);
    HRESULT put_State(AGENT_SESSION_STATE SessionState);
    HRESULT get_State(AGENT_SESSION_STATE* pSessionState);
    HRESULT get_SessionStartTime(double* pdateSessionStart);
    HRESULT get_SessionDuration(int* plDuration);
    HRESULT get_NumberOfCalls(int* plCalls);
    HRESULT get_TotalTalkTime(int* plTalkTime);
    HRESULT get_AverageTalkTime(int* plTalkTime);
    HRESULT get_TotalCallTime(int* plCallTime);
    HRESULT get_AverageCallTime(int* plCallTime);
    HRESULT get_TotalWrapUpTime(int* plWrapUpTime);
    HRESULT get_AverageWrapUpTime(int* plWrapUpTime);
    HRESULT get_ACDCallRate(CY* pcyCallrate);
    HRESULT get_LongestTimeToAnswer(int* plAnswerTime);
    HRESULT get_AverageTimeToAnswer(int* plAnswerTime);
}
enum IID_ITACDGroup = GUID(0x5afc3148, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITACDGroup : IDispatch
{
    HRESULT get_Name(BSTR* ppName);
    HRESULT EnumerateQueues(IEnumQueue* ppEnumQueue);
    HRESULT get_Queues(VARIANT* pVariant);
}
enum IID_ITQueue = GUID(0x5afc3149, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITQueue : IDispatch
{
    HRESULT put_MeasurementPeriod(int lPeriod);
    HRESULT get_MeasurementPeriod(int* plPeriod);
    HRESULT get_TotalCallsQueued(int* plCalls);
    HRESULT get_CurrentCallsQueued(int* plCalls);
    HRESULT get_TotalCallsAbandoned(int* plCalls);
    HRESULT get_TotalCallsFlowedIn(int* plCalls);
    HRESULT get_TotalCallsFlowedOut(int* plCalls);
    HRESULT get_LongestEverWaitTime(int* plWaitTime);
    HRESULT get_CurrentLongestWaitTime(int* plWaitTime);
    HRESULT get_AverageWaitTime(int* plWaitTime);
    HRESULT get_FinalDisposition(int* plCalls);
    HRESULT get_Name(BSTR* ppName);
}
enum IID_ITAgentEvent = GUID(0x5afc314a, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgentEvent : IDispatch
{
    HRESULT get_Agent(ITAgent* ppAgent);
    HRESULT get_Event(AGENT_EVENT* pEvent);
}
enum IID_ITAgentSessionEvent = GUID(0x5afc314b, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgentSessionEvent : IDispatch
{
    HRESULT get_Session(ITAgentSession* ppSession);
    HRESULT get_Event(AGENT_SESSION_EVENT* pEvent);
}
enum IID_ITACDGroupEvent = GUID(0x297f3032, 0xbd11, 0x11d1, [0xa0, 0xa7, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITACDGroupEvent : IDispatch
{
    HRESULT get_Group(ITACDGroup* ppGroup);
    HRESULT get_Event(ACDGROUP_EVENT* pEvent);
}
enum IID_ITQueueEvent = GUID(0x297f3033, 0xbd11, 0x11d1, [0xa0, 0xa7, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITQueueEvent : IDispatch
{
    HRESULT get_Queue(ITQueue* ppQueue);
    HRESULT get_Event(ACDQUEUE_EVENT* pEvent);
}
enum IID_ITAgentHandlerEvent = GUID(0x297f3034, 0xbd11, 0x11d1, [0xa0, 0xa7, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgentHandlerEvent : IDispatch
{
    HRESULT get_AgentHandler(ITAgentHandler* ppAgentHandler);
    HRESULT get_Event(AGENTHANDLER_EVENT* pEvent);
}
enum IID_ITTAPICallCenter = GUID(0x5afc3154, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITTAPICallCenter : IDispatch
{
    HRESULT EnumerateAgentHandlers(IEnumAgentHandler* ppEnumHandler);
    HRESULT get_AgentHandlers(VARIANT* pVariant);
}
enum IID_ITAgentHandler = GUID(0x587e8c22, 0x9802, 0x11d1, [0xa0, 0xa4, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface ITAgentHandler : IDispatch
{
    HRESULT get_Name(BSTR* ppName);
    HRESULT CreateAgent(ITAgent* ppAgent);
    HRESULT CreateAgentWithID(BSTR pID, BSTR pPIN, ITAgent* ppAgent);
    HRESULT EnumerateACDGroups(IEnumACDGroup* ppEnumACDGroup);
    HRESULT EnumerateUsableAddresses(IEnumAddress* ppEnumAddress);
    HRESULT get_ACDGroups(VARIANT* pVariant);
    HRESULT get_UsableAddresses(VARIANT* pVariant);
}
enum IID_IEnumAgent = GUID(0x5afc314d, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumAgent : IUnknown
{
    HRESULT Next(uint celt, ITAgent* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumAgent* ppEnum);
}
enum IID_IEnumAgentSession = GUID(0x5afc314e, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumAgentSession : IUnknown
{
    HRESULT Next(uint celt, ITAgentSession* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumAgentSession* ppEnum);
}
enum IID_IEnumQueue = GUID(0x5afc3158, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumQueue : IUnknown
{
    HRESULT Next(uint celt, ITQueue* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumQueue* ppEnum);
}
enum IID_IEnumACDGroup = GUID(0x5afc3157, 0x4bcc, 0x11d1, [0xbf, 0x80, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumACDGroup : IUnknown
{
    HRESULT Next(uint celt, ITACDGroup* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumACDGroup* ppEnum);
}
enum IID_IEnumAgentHandler = GUID(0x587e8c28, 0x9802, 0x11d1, [0xa0, 0xa4, 0x0, 0x80, 0x5f, 0xc1, 0x47, 0xd3]);
interface IEnumAgentHandler : IUnknown
{
    HRESULT Next(uint celt, ITAgentHandler* ppElements, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumAgentHandler* ppEnum);
}
enum IID_ITAMMediaFormat = GUID(0x364eb00, 0x4a77, 0x11d1, [0xa6, 0x71, 0x0, 0x60, 0x97, 0xc9, 0xa2, 0xe8]);
interface ITAMMediaFormat : IUnknown
{
    HRESULT get_MediaFormat(AM_MEDIA_TYPE** ppmt);
    HRESULT put_MediaFormat(const(AM_MEDIA_TYPE)* pmt);
}
enum IID_ITAllocatorProperties = GUID(0xc1bc3c90, 0xbcfe, 0x11d1, [0x97, 0x45, 0x0, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0]);
interface ITAllocatorProperties : IUnknown
{
    HRESULT SetAllocatorProperties(ALLOCATOR_PROPERTIES* pAllocProperties);
    HRESULT GetAllocatorProperties(ALLOCATOR_PROPERTIES* pAllocProperties);
    HRESULT SetAllocateBuffers(BOOL bAllocBuffers);
    HRESULT GetAllocateBuffers(BOOL* pbAllocBuffers);
    HRESULT SetBufferSize(uint BufferSize);
    HRESULT GetBufferSize(uint* pBufferSize);
}
alias MSP_ADDRESS_EVENT = int;
enum : int
{
    ADDRESS_TERMINAL_AVAILABLE   = 0x00000000,
    ADDRESS_TERMINAL_UNAVAILABLE = 0x00000001,
}

alias MSP_CALL_EVENT = int;
enum : int
{
    CALL_NEW_STREAM      = 0x00000000,
    CALL_STREAM_FAIL     = 0x00000001,
    CALL_TERMINAL_FAIL   = 0x00000002,
    CALL_STREAM_NOT_USED = 0x00000003,
    CALL_STREAM_ACTIVE   = 0x00000004,
    CALL_STREAM_INACTIVE = 0x00000005,
}

alias MSP_CALL_EVENT_CAUSE = int;
enum : int
{
    CALL_CAUSE_UNKNOWN            = 0x00000000,
    CALL_CAUSE_BAD_DEVICE         = 0x00000001,
    CALL_CAUSE_CONNECT_FAIL       = 0x00000002,
    CALL_CAUSE_LOCAL_REQUEST      = 0x00000003,
    CALL_CAUSE_REMOTE_REQUEST     = 0x00000004,
    CALL_CAUSE_MEDIA_TIMEOUT      = 0x00000005,
    CALL_CAUSE_MEDIA_RECOVERED    = 0x00000006,
    CALL_CAUSE_QUALITY_OF_SERVICE = 0x00000007,
}

alias MSP_EVENT = int;
enum : int
{
    ME_ADDRESS_EVENT       = 0x00000000,
    ME_CALL_EVENT          = 0x00000001,
    ME_TSP_DATA            = 0x00000002,
    ME_PRIVATE_EVENT       = 0x00000003,
    ME_ASR_TERMINAL_EVENT  = 0x00000004,
    ME_TTS_TERMINAL_EVENT  = 0x00000005,
    ME_FILE_TERMINAL_EVENT = 0x00000006,
    ME_TONE_TERMINAL_EVENT = 0x00000007,
}

struct MSP_EVENT_INFO
{
    uint dwSize;
    MSP_EVENT Event;
    int* hCall;
    union
    {
        struct MSP_ADDRESS_EVENT_INFO
        {
            MSP_ADDRESS_EVENT Type;
            ITTerminal pTerminal;
        }
        struct MSP_CALL_EVENT_INFO
        {
            MSP_CALL_EVENT Type;
            MSP_CALL_EVENT_CAUSE Cause;
            ITStream pStream;
            ITTerminal pTerminal;
            HRESULT hrError;
        }
        struct MSP_TSP_DATA
        {
            uint dwBufferSize;
            ubyte[1] pBuffer;
        }
        struct MSP_PRIVATE_EVENT_INFO
        {
            IDispatch pEvent;
            int lEventCode;
        }
        struct MSP_FILE_TERMINAL_EVENT_INFO
        {
            ITTerminal pParentFileTerminal;
            ITFileTrack pFileTrack;
            TERMINAL_MEDIA_STATE TerminalMediaState;
            FT_STATE_EVENT_CAUSE ftecEventCause;
            HRESULT hrErrorCode;
        }
        struct MSP_ASR_TERMINAL_EVENT_INFO
        {
            ITTerminal pASRTerminal;
            HRESULT hrErrorCode;
        }
        struct MSP_TTS_TERMINAL_EVENT_INFO
        {
            ITTerminal pTTSTerminal;
            HRESULT hrErrorCode;
        }
        struct MSP_TONE_TERMINAL_EVENT_INFO
        {
            ITTerminal pToneTerminal;
            HRESULT hrErrorCode;
        }
    }
}
enum IID_ITPluggableTerminalEventSink = GUID(0x6e0887be, 0xba1a, 0x492e, [0xbd, 0x10, 0x40, 0x20, 0xec, 0x5e, 0x33, 0xe0]);
interface ITPluggableTerminalEventSink : IUnknown
{
    HRESULT FireEvent(const(MSP_EVENT_INFO)* pMspEventInfo);
}
enum IID_ITPluggableTerminalEventSinkRegistration = GUID(0xf7115709, 0xa216, 0x4957, [0xa7, 0x59, 0x6, 0xa, 0xb3, 0x2a, 0x90, 0xd1]);
interface ITPluggableTerminalEventSinkRegistration : IUnknown
{
    HRESULT RegisterSink(ITPluggableTerminalEventSink pEventSink);
    HRESULT UnregisterSink();
}
enum IID_ITMSPAddress = GUID(0xee3bd600, 0x3868, 0x11d2, [0xa0, 0x45, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
interface ITMSPAddress : IUnknown
{
    HRESULT Initialize(int* hEvent);
    HRESULT Shutdown();
    HRESULT CreateMSPCall(int* hCall, uint dwReserved, uint dwMediaType, IUnknown pOuterUnknown, IUnknown* ppStreamControl);
    HRESULT ShutdownMSPCall(IUnknown pStreamControl);
    HRESULT ReceiveTSPData(IUnknown pMSPCall, ubyte* pBuffer, uint dwSize);
    HRESULT GetEvent(uint* pdwSize, ubyte* pEventBuffer);
}
enum IID_ITTAPIDispatchEventNotification = GUID(0x9f34325b, 0x7e62, 0x11d2, [0x94, 0x57, 0x0, 0xc0, 0x4f, 0x8e, 0xc8, 0x88]);
interface ITTAPIDispatchEventNotification : IDispatch
{
}
enum CLSID_TAPI = GUID(0x21d6d48e, 0xa88b, 0x11d0, [0x83, 0xdd, 0x0, 0xaa, 0x0, 0x3c, 0xca, 0xbd]);
struct TAPI
{
}
enum CLSID_DispatchMapper = GUID(0xe9225296, 0xc759, 0x11d1, [0xa0, 0x2b, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
struct DispatchMapper
{
}
enum CLSID_RequestMakeCall = GUID(0xac48ffe0, 0xf8c4, 0x11d1, [0xa0, 0x30, 0x0, 0xc0, 0x4f, 0xb6, 0x80, 0x9f]);
struct RequestMakeCall
{
}
alias DIRECTORY_TYPE = int;
enum : int
{
    DT_NTDS = 0x00000001,
    DT_ILS  = 0x00000002,
}

alias DIRECTORY_OBJECT_TYPE = int;
enum : int
{
    OT_CONFERENCE = 0x00000001,
    OT_USER       = 0x00000002,
}

alias RND_ADVERTISING_SCOPE = int;
enum : int
{
    RAS_LOCAL  = 0x00000001,
    RAS_SITE   = 0x00000002,
    RAS_REGION = 0x00000003,
    RAS_WORLD  = 0x00000004,
}

enum IID_ITDirectoryObjectConference = GUID(0xf1029e5d, 0xcb5b, 0x11d0, [0x8d, 0x59, 0x0, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0]);
interface ITDirectoryObjectConference : IDispatch
{
    HRESULT get_Protocol(BSTR* ppProtocol);
    HRESULT get_Originator(BSTR* ppOriginator);
    HRESULT put_Originator(BSTR pOriginator);
    HRESULT get_AdvertisingScope(RND_ADVERTISING_SCOPE* pAdvertisingScope);
    HRESULT put_AdvertisingScope(RND_ADVERTISING_SCOPE AdvertisingScope);
    HRESULT get_Url(BSTR* ppUrl);
    HRESULT put_Url(BSTR pUrl);
    HRESULT get_Description(BSTR* ppDescription);
    HRESULT put_Description(BSTR pDescription);
    HRESULT get_IsEncrypted(VARIANT_BOOL* pfEncrypted);
    HRESULT put_IsEncrypted(VARIANT_BOOL fEncrypted);
    HRESULT get_StartTime(double* pDate);
    HRESULT put_StartTime(double Date);
    HRESULT get_StopTime(double* pDate);
    HRESULT put_StopTime(double Date);
}
enum IID_ITDirectoryObjectUser = GUID(0x34621d6f, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface ITDirectoryObjectUser : IDispatch
{
    HRESULT get_IPPhonePrimary(BSTR* ppName);
    HRESULT put_IPPhonePrimary(BSTR pName);
}
enum IID_IEnumDialableAddrs = GUID(0x34621d70, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface IEnumDialableAddrs : IUnknown
{
    HRESULT Next(uint celt, BSTR* ppElements, uint* pcFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumDialableAddrs* ppEnum);
}
enum IID_ITDirectoryObject = GUID(0x34621d6e, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface ITDirectoryObject : IDispatch
{
    HRESULT get_ObjectType(DIRECTORY_OBJECT_TYPE* pObjectType);
    HRESULT get_Name(BSTR* ppName);
    HRESULT put_Name(BSTR pName);
    HRESULT get_DialableAddrs(int dwAddressType, VARIANT* pVariant);
    HRESULT EnumerateDialableAddrs(uint dwAddressType, IEnumDialableAddrs* ppEnumDialableAddrs);
    HRESULT get_SecurityDescriptor(IDispatch* ppSecDes);
    HRESULT put_SecurityDescriptor(IDispatch pSecDes);
}
enum IID_IEnumDirectoryObject = GUID(0x6c9b64a, 0x306d, 0x11d1, [0x97, 0x74, 0x0, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0]);
interface IEnumDirectoryObject : IUnknown
{
    HRESULT Next(uint celt, ITDirectoryObject* pVal, uint* pcFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumDirectoryObject* ppEnum);
}
enum IID_ITILSConfig = GUID(0x34621d72, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface ITILSConfig : IDispatch
{
    HRESULT get_Port(int* pPort);
    HRESULT put_Port(int Port);
}
enum IID_ITDirectory = GUID(0x34621d6c, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface ITDirectory : IDispatch
{
    HRESULT get_DirectoryType(DIRECTORY_TYPE* pDirectoryType);
    HRESULT get_DisplayName(BSTR* pName);
    HRESULT get_IsDynamic(VARIANT_BOOL* pfDynamic);
    HRESULT get_DefaultObjectTTL(int* pTTL);
    HRESULT put_DefaultObjectTTL(int TTL);
    HRESULT EnableAutoRefresh(VARIANT_BOOL fEnable);
    HRESULT Connect(VARIANT_BOOL fSecure);
    HRESULT Bind(BSTR pDomainName, BSTR pUserName, BSTR pPassword, int lFlags);
    HRESULT AddDirectoryObject(ITDirectoryObject pDirectoryObject);
    HRESULT ModifyDirectoryObject(ITDirectoryObject pDirectoryObject);
    HRESULT RefreshDirectoryObject(ITDirectoryObject pDirectoryObject);
    HRESULT DeleteDirectoryObject(ITDirectoryObject pDirectoryObject);
    HRESULT get_DirectoryObjects(DIRECTORY_OBJECT_TYPE DirectoryObjectType, BSTR pName, VARIANT* pVariant);
    HRESULT EnumerateDirectoryObjects(DIRECTORY_OBJECT_TYPE DirectoryObjectType, BSTR pName, IEnumDirectoryObject* ppEnumObject);
}
enum IID_IEnumDirectory = GUID(0x34621d6d, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface IEnumDirectory : IUnknown
{
    HRESULT Next(uint celt, ITDirectory* ppElements, uint* pcFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumDirectory* ppEnum);
}
enum IID_ITRendezvous = GUID(0x34621d6b, 0x6cff, 0x11d1, [0xaf, 0xf7, 0x0, 0xc0, 0x4f, 0xc3, 0x1f, 0xee]);
interface ITRendezvous : IDispatch
{
    HRESULT get_DefaultDirectories(VARIANT* pVariant);
    HRESULT EnumerateDefaultDirectories(IEnumDirectory* ppEnumDirectory);
    HRESULT CreateDirectory(DIRECTORY_TYPE DirectoryType, BSTR pName, ITDirectory* ppDir);
    HRESULT CreateDirectoryObject(DIRECTORY_OBJECT_TYPE DirectoryObjectType, BSTR pName, ITDirectoryObject* ppDirectoryObject);
}
enum CLSID_Rendezvous = GUID(0xf1029e5b, 0xcb5b, 0x11d0, [0x8d, 0x59, 0x0, 0xc0, 0x4f, 0xd9, 0x1a, 0xc0]);
struct Rendezvous
{
}
enum IID_IMcastScope = GUID(0xdf0daef4, 0xa289, 0x11d1, [0x86, 0x97, 0x0, 0x60, 0x8, 0xb0, 0xe5, 0xd2]);
interface IMcastScope : IDispatch
{
    HRESULT get_ScopeID(int* pID);
    HRESULT get_ServerID(int* pID);
    HRESULT get_InterfaceID(int* pID);
    HRESULT get_ScopeDescription(BSTR* ppDescription);
    HRESULT get_TTL(int* pTTL);
}
enum IID_IMcastLeaseInfo = GUID(0xdf0daefd, 0xa289, 0x11d1, [0x86, 0x97, 0x0, 0x60, 0x8, 0xb0, 0xe5, 0xd2]);
interface IMcastLeaseInfo : IDispatch
{
    HRESULT get_RequestID(BSTR* ppRequestID);
    HRESULT get_LeaseStartTime(double* pTime);
    HRESULT put_LeaseStartTime(double time);
    HRESULT get_LeaseStopTime(double* pTime);
    HRESULT put_LeaseStopTime(double time);
    HRESULT get_AddressCount(int* pCount);
    HRESULT get_ServerAddress(BSTR* ppAddress);
    HRESULT get_TTL(int* pTTL);
    HRESULT get_Addresses(VARIANT* pVariant);
    HRESULT EnumerateAddresses(IEnumBstr* ppEnumAddresses);
}
enum IID_IEnumMcastScope = GUID(0xdf0daf09, 0xa289, 0x11d1, [0x86, 0x97, 0x0, 0x60, 0x8, 0xb0, 0xe5, 0xd2]);
interface IEnumMcastScope : IUnknown
{
    HRESULT Next(uint celt, IMcastScope* ppScopes, uint* pceltFetched);
    HRESULT Reset();
    HRESULT Skip(uint celt);
    HRESULT Clone(IEnumMcastScope* ppEnum);
}
enum IID_IMcastAddressAllocation = GUID(0xdf0daef1, 0xa289, 0x11d1, [0x86, 0x97, 0x0, 0x60, 0x8, 0xb0, 0xe5, 0xd2]);
interface IMcastAddressAllocation : IDispatch
{
    HRESULT get_Scopes(VARIANT* pVariant);
    HRESULT EnumerateScopes(IEnumMcastScope* ppEnumMcastScope);
    HRESULT RequestAddress(IMcastScope pScope, double LeaseStartTime, double LeaseStopTime, int NumAddresses, IMcastLeaseInfo* ppLeaseResponse);
    HRESULT RenewAddress(int lReserved, IMcastLeaseInfo pRenewRequest, IMcastLeaseInfo* ppRenewResponse);
    HRESULT ReleaseAddress(IMcastLeaseInfo pReleaseRequest);
    HRESULT CreateLeaseInfo(double LeaseStartTime, double LeaseStopTime, uint dwNumAddresses, PWSTR* ppAddresses, PWSTR pRequestID, PWSTR pServerAddress, IMcastLeaseInfo* ppReleaseRequest);
    HRESULT CreateLeaseInfoFromVariant(double LeaseStartTime, double LeaseStopTime, VARIANT vAddresses, BSTR pRequestID, BSTR pServerAddress, IMcastLeaseInfo* ppReleaseRequest);
}
enum CLSID_McastAddressAllocation = GUID(0xdf0daef2, 0xa289, 0x11d1, [0x86, 0x97, 0x0, 0x60, 0x8, 0xb0, 0xe5, 0xd2]);
struct McastAddressAllocation
{
}
struct STnefProblem
{
    uint ulComponent;
    uint ulAttribute;
    uint ulPropTag;
    int scode;
}
struct STnefProblemArray
{
    uint cProblem;
    STnefProblem[1] aProblem;
}
// [Not Found] IID_ITnef
interface ITnef : IUnknown
{
    HRESULT AddProps(uint ulFlags, uint ulElemID, void* lpvData, SPropTagArray* lpPropList);
    HRESULT ExtractProps(uint ulFlags, SPropTagArray* lpPropList, STnefProblemArray** lpProblems);
    HRESULT Finish(uint ulFlags, ushort* lpKey, STnefProblemArray** lpProblems);
    HRESULT OpenTaggedBody(IMessage lpMessage, uint ulFlags, IStream* lppStream);
    HRESULT SetProps(uint ulFlags, uint ulElemID, uint cValues, SPropValue* lpProps);
    HRESULT EncodeRecips(uint ulFlags, IMAPITable lpRecipientTable);
    HRESULT FinishComponent(uint ulFlags, uint ulComponentID, SPropTagArray* lpCustomPropList, SPropValue* lpCustomProps, SPropTagArray* lpPropList, STnefProblemArray** lpProblems);
}
alias LPOPENTNEFSTREAM = HRESULT function(void* lpvSupport, IStream lpStream, byte* lpszStreamName, uint ulFlags, IMessage lpMessage, ushort wKeyVal, ITnef* lppTNEF);
alias LPOPENTNEFSTREAMEX = HRESULT function(void* lpvSupport, IStream lpStream, byte* lpszStreamName, uint ulFlags, IMessage lpMessage, ushort wKeyVal, IAddrBook lpAdressBook, ITnef* lppTNEF);
alias LPGETTNEFSTREAMCODEPAGE = HRESULT function(IStream lpStream, uint* lpulCodepage, uint* lpulSubCodepage);
struct RENDDATA
{
    align (1):
    ushort atyp;
    uint ulPosition;
    ushort dxWidth;
    ushort dyHeight;
    uint dwFlags;
}
struct DTR
{
    align (1):
    ushort wYear;
    ushort wMonth;
    ushort wDay;
    ushort wHour;
    ushort wMinute;
    ushort wSecond;
    ushort wDayOfWeek;
}
struct TRP
{
    ushort trpid;
    ushort cbgrtrp;
    ushort cch;
    ushort cbRgb;
}
struct ADDRALIAS
{
    CHAR[41] rgchName;
    CHAR[11] rgchEName;
    CHAR[12] rgchSrvr;
    uint dibDetail;
    ushort type;
}
struct NSID
{
    uint dwSize;
    ubyte[16] uchType;
    uint xtype;
    int lTime;
    union address
    {
        ADDRALIAS alias_;
        CHAR[1] rgchInterNet;
    }
}
