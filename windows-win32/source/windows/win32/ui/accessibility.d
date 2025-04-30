module windows.win32.ui.accessibility;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HMODULE, HRESULT, HWND, LPARAM, LRESULT, POINT, PSTR, PWSTR, RECT, WPARAM;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.variant : VARIANT;
import windows.win32.ui.windowsandmessaging : HMENU, POINTER_INPUT_TYPE;

version (Windows):
extern (Windows):

alias STICKYKEYS_FLAGS = uint;
enum : uint
{
    SKF_STICKYKEYSON    = 0x00000001,
    SKF_AVAILABLE       = 0x00000002,
    SKF_HOTKEYACTIVE    = 0x00000004,
    SKF_CONFIRMHOTKEY   = 0x00000008,
    SKF_HOTKEYSOUND     = 0x00000010,
    SKF_INDICATOR       = 0x00000020,
    SKF_AUDIBLEFEEDBACK = 0x00000040,
    SKF_TRISTATE        = 0x00000080,
    SKF_TWOKEYSOFF      = 0x00000100,
    SKF_LALTLATCHED     = 0x10000000,
    SKF_LCTLLATCHED     = 0x04000000,
    SKF_LSHIFTLATCHED   = 0x01000000,
    SKF_RALTLATCHED     = 0x20000000,
    SKF_RCTLLATCHED     = 0x08000000,
    SKF_RSHIFTLATCHED   = 0x02000000,
    SKF_LWINLATCHED     = 0x40000000,
    SKF_RWINLATCHED     = 0x80000000,
    SKF_LALTLOCKED      = 0x00100000,
    SKF_LCTLLOCKED      = 0x00040000,
    SKF_LSHIFTLOCKED    = 0x00010000,
    SKF_RALTLOCKED      = 0x00200000,
    SKF_RCTLLOCKED      = 0x00080000,
    SKF_RSHIFTLOCKED    = 0x00020000,
    SKF_LWINLOCKED      = 0x00400000,
    SKF_RWINLOCKED      = 0x00800000,
}

alias SOUNDSENTRY_FLAGS = uint;
enum : uint
{
    SSF_SOUNDSENTRYON = 0x00000001,
    SSF_AVAILABLE     = 0x00000002,
    SSF_INDICATOR     = 0x00000004,
}

alias ACC_UTILITY_STATE_FLAGS = uint;
enum : uint
{
    ANRUS_ON_SCREEN_KEYBOARD_ACTIVE    = 0x00000001,
    ANRUS_TOUCH_MODIFICATION_ACTIVE    = 0x00000002,
    ANRUS_PRIORITY_AUDIO_ACTIVE        = 0x00000004,
    ANRUS_PRIORITY_AUDIO_ACTIVE_NODUCK = 0x00000008,
}

alias SOUND_SENTRY_GRAPHICS_EFFECT = uint;
enum : uint
{
    SSGF_DISPLAY = 0x00000003,
    SSGF_NONE    = 0x00000000,
}

alias SERIALKEYS_FLAGS = uint;
enum : uint
{
    SERKF_AVAILABLE    = 0x00000002,
    SERKF_INDICATOR    = 0x00000004,
    SERKF_SERIALKEYSON = 0x00000001,
}

alias HIGHCONTRASTW_FLAGS = uint;
enum : uint
{
    HCF_HIGHCONTRASTON       = 0x00000001,
    HCF_AVAILABLE            = 0x00000002,
    HCF_HOTKEYACTIVE         = 0x00000004,
    HCF_CONFIRMHOTKEY        = 0x00000008,
    HCF_HOTKEYSOUND          = 0x00000010,
    HCF_INDICATOR            = 0x00000020,
    HCF_HOTKEYAVAILABLE      = 0x00000040,
    HCF_OPTION_NOTHEMECHANGE = 0x00001000,
}

alias SOUNDSENTRY_TEXT_EFFECT = uint;
enum : uint
{
    SSTF_BORDER  = 0x00000002,
    SSTF_CHARS   = 0x00000001,
    SSTF_DISPLAY = 0x00000003,
    SSTF_NONE    = 0x00000000,
}

alias SOUNDSENTRY_WINDOWS_EFFECT = uint;
enum : uint
{
    SSWF_CUSTOM  = 0x00000004,
    SSWF_DISPLAY = 0x00000003,
    SSWF_NONE    = 0x00000000,
    SSWF_TITLE   = 0x00000001,
    SSWF_WINDOW  = 0x00000002,
}

alias UIA_PATTERN_ID = int;
enum : int
{
    UIA_InvokePatternId            = 0x00002710,
    UIA_SelectionPatternId         = 0x00002711,
    UIA_ValuePatternId             = 0x00002712,
    UIA_RangeValuePatternId        = 0x00002713,
    UIA_ScrollPatternId            = 0x00002714,
    UIA_ExpandCollapsePatternId    = 0x00002715,
    UIA_GridPatternId              = 0x00002716,
    UIA_GridItemPatternId          = 0x00002717,
    UIA_MultipleViewPatternId      = 0x00002718,
    UIA_WindowPatternId            = 0x00002719,
    UIA_SelectionItemPatternId     = 0x0000271a,
    UIA_DockPatternId              = 0x0000271b,
    UIA_TablePatternId             = 0x0000271c,
    UIA_TableItemPatternId         = 0x0000271d,
    UIA_TextPatternId              = 0x0000271e,
    UIA_TogglePatternId            = 0x0000271f,
    UIA_TransformPatternId         = 0x00002720,
    UIA_ScrollItemPatternId        = 0x00002721,
    UIA_LegacyIAccessiblePatternId = 0x00002722,
    UIA_ItemContainerPatternId     = 0x00002723,
    UIA_VirtualizedItemPatternId   = 0x00002724,
    UIA_SynchronizedInputPatternId = 0x00002725,
    UIA_ObjectModelPatternId       = 0x00002726,
    UIA_AnnotationPatternId        = 0x00002727,
    UIA_TextPattern2Id             = 0x00002728,
    UIA_StylesPatternId            = 0x00002729,
    UIA_SpreadsheetPatternId       = 0x0000272a,
    UIA_SpreadsheetItemPatternId   = 0x0000272b,
    UIA_TransformPattern2Id        = 0x0000272c,
    UIA_TextChildPatternId         = 0x0000272d,
    UIA_DragPatternId              = 0x0000272e,
    UIA_DropTargetPatternId        = 0x0000272f,
    UIA_TextEditPatternId          = 0x00002730,
    UIA_CustomNavigationPatternId  = 0x00002731,
    UIA_SelectionPattern2Id        = 0x00002732,
}

alias UIA_EVENT_ID = int;
enum : int
{
    UIA_ToolTipOpenedEventId                             = 0x00004e20,
    UIA_ToolTipClosedEventId                             = 0x00004e21,
    UIA_StructureChangedEventId                          = 0x00004e22,
    UIA_MenuOpenedEventId                                = 0x00004e23,
    UIA_AutomationPropertyChangedEventId                 = 0x00004e24,
    UIA_AutomationFocusChangedEventId                    = 0x00004e25,
    UIA_AsyncContentLoadedEventId                        = 0x00004e26,
    UIA_MenuClosedEventId                                = 0x00004e27,
    UIA_LayoutInvalidatedEventId                         = 0x00004e28,
    UIA_Invoke_InvokedEventId                            = 0x00004e29,
    UIA_SelectionItem_ElementAddedToSelectionEventId     = 0x00004e2a,
    UIA_SelectionItem_ElementRemovedFromSelectionEventId = 0x00004e2b,
    UIA_SelectionItem_ElementSelectedEventId             = 0x00004e2c,
    UIA_Selection_InvalidatedEventId                     = 0x00004e2d,
    UIA_Text_TextSelectionChangedEventId                 = 0x00004e2e,
    UIA_Text_TextChangedEventId                          = 0x00004e2f,
    UIA_Window_WindowOpenedEventId                       = 0x00004e30,
    UIA_Window_WindowClosedEventId                       = 0x00004e31,
    UIA_MenuModeStartEventId                             = 0x00004e32,
    UIA_MenuModeEndEventId                               = 0x00004e33,
    UIA_InputReachedTargetEventId                        = 0x00004e34,
    UIA_InputReachedOtherElementEventId                  = 0x00004e35,
    UIA_InputDiscardedEventId                            = 0x00004e36,
    UIA_SystemAlertEventId                               = 0x00004e37,
    UIA_LiveRegionChangedEventId                         = 0x00004e38,
    UIA_HostedFragmentRootsInvalidatedEventId            = 0x00004e39,
    UIA_Drag_DragStartEventId                            = 0x00004e3a,
    UIA_Drag_DragCancelEventId                           = 0x00004e3b,
    UIA_Drag_DragCompleteEventId                         = 0x00004e3c,
    UIA_DropTarget_DragEnterEventId                      = 0x00004e3d,
    UIA_DropTarget_DragLeaveEventId                      = 0x00004e3e,
    UIA_DropTarget_DroppedEventId                        = 0x00004e3f,
    UIA_TextEdit_TextChangedEventId                      = 0x00004e40,
    UIA_TextEdit_ConversionTargetChangedEventId          = 0x00004e41,
    UIA_ChangesEventId                                   = 0x00004e42,
    UIA_NotificationEventId                              = 0x00004e43,
    UIA_ActiveTextPositionChangedEventId                 = 0x00004e44,
}

alias UIA_PROPERTY_ID = int;
enum : int
{
    UIA_RuntimeIdPropertyId                           = 0x00007530,
    UIA_BoundingRectanglePropertyId                   = 0x00007531,
    UIA_ProcessIdPropertyId                           = 0x00007532,
    UIA_ControlTypePropertyId                         = 0x00007533,
    UIA_LocalizedControlTypePropertyId                = 0x00007534,
    UIA_NamePropertyId                                = 0x00007535,
    UIA_AcceleratorKeyPropertyId                      = 0x00007536,
    UIA_AccessKeyPropertyId                           = 0x00007537,
    UIA_HasKeyboardFocusPropertyId                    = 0x00007538,
    UIA_IsKeyboardFocusablePropertyId                 = 0x00007539,
    UIA_IsEnabledPropertyId                           = 0x0000753a,
    UIA_AutomationIdPropertyId                        = 0x0000753b,
    UIA_ClassNamePropertyId                           = 0x0000753c,
    UIA_HelpTextPropertyId                            = 0x0000753d,
    UIA_ClickablePointPropertyId                      = 0x0000753e,
    UIA_CulturePropertyId                             = 0x0000753f,
    UIA_IsControlElementPropertyId                    = 0x00007540,
    UIA_IsContentElementPropertyId                    = 0x00007541,
    UIA_LabeledByPropertyId                           = 0x00007542,
    UIA_IsPasswordPropertyId                          = 0x00007543,
    UIA_NativeWindowHandlePropertyId                  = 0x00007544,
    UIA_ItemTypePropertyId                            = 0x00007545,
    UIA_IsOffscreenPropertyId                         = 0x00007546,
    UIA_OrientationPropertyId                         = 0x00007547,
    UIA_FrameworkIdPropertyId                         = 0x00007548,
    UIA_IsRequiredForFormPropertyId                   = 0x00007549,
    UIA_ItemStatusPropertyId                          = 0x0000754a,
    UIA_IsDockPatternAvailablePropertyId              = 0x0000754b,
    UIA_IsExpandCollapsePatternAvailablePropertyId    = 0x0000754c,
    UIA_IsGridItemPatternAvailablePropertyId          = 0x0000754d,
    UIA_IsGridPatternAvailablePropertyId              = 0x0000754e,
    UIA_IsInvokePatternAvailablePropertyId            = 0x0000754f,
    UIA_IsMultipleViewPatternAvailablePropertyId      = 0x00007550,
    UIA_IsRangeValuePatternAvailablePropertyId        = 0x00007551,
    UIA_IsScrollPatternAvailablePropertyId            = 0x00007552,
    UIA_IsScrollItemPatternAvailablePropertyId        = 0x00007553,
    UIA_IsSelectionItemPatternAvailablePropertyId     = 0x00007554,
    UIA_IsSelectionPatternAvailablePropertyId         = 0x00007555,
    UIA_IsTablePatternAvailablePropertyId             = 0x00007556,
    UIA_IsTableItemPatternAvailablePropertyId         = 0x00007557,
    UIA_IsTextPatternAvailablePropertyId              = 0x00007558,
    UIA_IsTogglePatternAvailablePropertyId            = 0x00007559,
    UIA_IsTransformPatternAvailablePropertyId         = 0x0000755a,
    UIA_IsValuePatternAvailablePropertyId             = 0x0000755b,
    UIA_IsWindowPatternAvailablePropertyId            = 0x0000755c,
    UIA_ValueValuePropertyId                          = 0x0000755d,
    UIA_ValueIsReadOnlyPropertyId                     = 0x0000755e,
    UIA_RangeValueValuePropertyId                     = 0x0000755f,
    UIA_RangeValueIsReadOnlyPropertyId                = 0x00007560,
    UIA_RangeValueMinimumPropertyId                   = 0x00007561,
    UIA_RangeValueMaximumPropertyId                   = 0x00007562,
    UIA_RangeValueLargeChangePropertyId               = 0x00007563,
    UIA_RangeValueSmallChangePropertyId               = 0x00007564,
    UIA_ScrollHorizontalScrollPercentPropertyId       = 0x00007565,
    UIA_ScrollHorizontalViewSizePropertyId            = 0x00007566,
    UIA_ScrollVerticalScrollPercentPropertyId         = 0x00007567,
    UIA_ScrollVerticalViewSizePropertyId              = 0x00007568,
    UIA_ScrollHorizontallyScrollablePropertyId        = 0x00007569,
    UIA_ScrollVerticallyScrollablePropertyId          = 0x0000756a,
    UIA_SelectionSelectionPropertyId                  = 0x0000756b,
    UIA_SelectionCanSelectMultiplePropertyId          = 0x0000756c,
    UIA_SelectionIsSelectionRequiredPropertyId        = 0x0000756d,
    UIA_GridRowCountPropertyId                        = 0x0000756e,
    UIA_GridColumnCountPropertyId                     = 0x0000756f,
    UIA_GridItemRowPropertyId                         = 0x00007570,
    UIA_GridItemColumnPropertyId                      = 0x00007571,
    UIA_GridItemRowSpanPropertyId                     = 0x00007572,
    UIA_GridItemColumnSpanPropertyId                  = 0x00007573,
    UIA_GridItemContainingGridPropertyId              = 0x00007574,
    UIA_DockDockPositionPropertyId                    = 0x00007575,
    UIA_ExpandCollapseExpandCollapseStatePropertyId   = 0x00007576,
    UIA_MultipleViewCurrentViewPropertyId             = 0x00007577,
    UIA_MultipleViewSupportedViewsPropertyId          = 0x00007578,
    UIA_WindowCanMaximizePropertyId                   = 0x00007579,
    UIA_WindowCanMinimizePropertyId                   = 0x0000757a,
    UIA_WindowWindowVisualStatePropertyId             = 0x0000757b,
    UIA_WindowWindowInteractionStatePropertyId        = 0x0000757c,
    UIA_WindowIsModalPropertyId                       = 0x0000757d,
    UIA_WindowIsTopmostPropertyId                     = 0x0000757e,
    UIA_SelectionItemIsSelectedPropertyId             = 0x0000757f,
    UIA_SelectionItemSelectionContainerPropertyId     = 0x00007580,
    UIA_TableRowHeadersPropertyId                     = 0x00007581,
    UIA_TableColumnHeadersPropertyId                  = 0x00007582,
    UIA_TableRowOrColumnMajorPropertyId               = 0x00007583,
    UIA_TableItemRowHeaderItemsPropertyId             = 0x00007584,
    UIA_TableItemColumnHeaderItemsPropertyId          = 0x00007585,
    UIA_ToggleToggleStatePropertyId                   = 0x00007586,
    UIA_TransformCanMovePropertyId                    = 0x00007587,
    UIA_TransformCanResizePropertyId                  = 0x00007588,
    UIA_TransformCanRotatePropertyId                  = 0x00007589,
    UIA_IsLegacyIAccessiblePatternAvailablePropertyId = 0x0000758a,
    UIA_LegacyIAccessibleChildIdPropertyId            = 0x0000758b,
    UIA_LegacyIAccessibleNamePropertyId               = 0x0000758c,
    UIA_LegacyIAccessibleValuePropertyId              = 0x0000758d,
    UIA_LegacyIAccessibleDescriptionPropertyId        = 0x0000758e,
    UIA_LegacyIAccessibleRolePropertyId               = 0x0000758f,
    UIA_LegacyIAccessibleStatePropertyId              = 0x00007590,
    UIA_LegacyIAccessibleHelpPropertyId               = 0x00007591,
    UIA_LegacyIAccessibleKeyboardShortcutPropertyId   = 0x00007592,
    UIA_LegacyIAccessibleSelectionPropertyId          = 0x00007593,
    UIA_LegacyIAccessibleDefaultActionPropertyId      = 0x00007594,
    UIA_AriaRolePropertyId                            = 0x00007595,
    UIA_AriaPropertiesPropertyId                      = 0x00007596,
    UIA_IsDataValidForFormPropertyId                  = 0x00007597,
    UIA_ControllerForPropertyId                       = 0x00007598,
    UIA_DescribedByPropertyId                         = 0x00007599,
    UIA_FlowsToPropertyId                             = 0x0000759a,
    UIA_ProviderDescriptionPropertyId                 = 0x0000759b,
    UIA_IsItemContainerPatternAvailablePropertyId     = 0x0000759c,
    UIA_IsVirtualizedItemPatternAvailablePropertyId   = 0x0000759d,
    UIA_IsSynchronizedInputPatternAvailablePropertyId = 0x0000759e,
    UIA_OptimizeForVisualContentPropertyId            = 0x0000759f,
    UIA_IsObjectModelPatternAvailablePropertyId       = 0x000075a0,
    UIA_AnnotationAnnotationTypeIdPropertyId          = 0x000075a1,
    UIA_AnnotationAnnotationTypeNamePropertyId        = 0x000075a2,
    UIA_AnnotationAuthorPropertyId                    = 0x000075a3,
    UIA_AnnotationDateTimePropertyId                  = 0x000075a4,
    UIA_AnnotationTargetPropertyId                    = 0x000075a5,
    UIA_IsAnnotationPatternAvailablePropertyId        = 0x000075a6,
    UIA_IsTextPattern2AvailablePropertyId             = 0x000075a7,
    UIA_StylesStyleIdPropertyId                       = 0x000075a8,
    UIA_StylesStyleNamePropertyId                     = 0x000075a9,
    UIA_StylesFillColorPropertyId                     = 0x000075aa,
    UIA_StylesFillPatternStylePropertyId              = 0x000075ab,
    UIA_StylesShapePropertyId                         = 0x000075ac,
    UIA_StylesFillPatternColorPropertyId              = 0x000075ad,
    UIA_StylesExtendedPropertiesPropertyId            = 0x000075ae,
    UIA_IsStylesPatternAvailablePropertyId            = 0x000075af,
    UIA_IsSpreadsheetPatternAvailablePropertyId       = 0x000075b0,
    UIA_SpreadsheetItemFormulaPropertyId              = 0x000075b1,
    UIA_SpreadsheetItemAnnotationObjectsPropertyId    = 0x000075b2,
    UIA_SpreadsheetItemAnnotationTypesPropertyId      = 0x000075b3,
    UIA_IsSpreadsheetItemPatternAvailablePropertyId   = 0x000075b4,
    UIA_Transform2CanZoomPropertyId                   = 0x000075b5,
    UIA_IsTransformPattern2AvailablePropertyId        = 0x000075b6,
    UIA_LiveSettingPropertyId                         = 0x000075b7,
    UIA_IsTextChildPatternAvailablePropertyId         = 0x000075b8,
    UIA_IsDragPatternAvailablePropertyId              = 0x000075b9,
    UIA_DragIsGrabbedPropertyId                       = 0x000075ba,
    UIA_DragDropEffectPropertyId                      = 0x000075bb,
    UIA_DragDropEffectsPropertyId                     = 0x000075bc,
    UIA_IsDropTargetPatternAvailablePropertyId        = 0x000075bd,
    UIA_DropTargetDropTargetEffectPropertyId          = 0x000075be,
    UIA_DropTargetDropTargetEffectsPropertyId         = 0x000075bf,
    UIA_DragGrabbedItemsPropertyId                    = 0x000075c0,
    UIA_Transform2ZoomLevelPropertyId                 = 0x000075c1,
    UIA_Transform2ZoomMinimumPropertyId               = 0x000075c2,
    UIA_Transform2ZoomMaximumPropertyId               = 0x000075c3,
    UIA_FlowsFromPropertyId                           = 0x000075c4,
    UIA_IsTextEditPatternAvailablePropertyId          = 0x000075c5,
    UIA_IsPeripheralPropertyId                        = 0x000075c6,
    UIA_IsCustomNavigationPatternAvailablePropertyId  = 0x000075c7,
    UIA_PositionInSetPropertyId                       = 0x000075c8,
    UIA_SizeOfSetPropertyId                           = 0x000075c9,
    UIA_LevelPropertyId                               = 0x000075ca,
    UIA_AnnotationTypesPropertyId                     = 0x000075cb,
    UIA_AnnotationObjectsPropertyId                   = 0x000075cc,
    UIA_LandmarkTypePropertyId                        = 0x000075cd,
    UIA_LocalizedLandmarkTypePropertyId               = 0x000075ce,
    UIA_FullDescriptionPropertyId                     = 0x000075cf,
    UIA_FillColorPropertyId                           = 0x000075d0,
    UIA_OutlineColorPropertyId                        = 0x000075d1,
    UIA_FillTypePropertyId                            = 0x000075d2,
    UIA_VisualEffectsPropertyId                       = 0x000075d3,
    UIA_OutlineThicknessPropertyId                    = 0x000075d4,
    UIA_CenterPointPropertyId                         = 0x000075d5,
    UIA_RotationPropertyId                            = 0x000075d6,
    UIA_SizePropertyId                                = 0x000075d7,
    UIA_IsSelectionPattern2AvailablePropertyId        = 0x000075d8,
    UIA_Selection2FirstSelectedItemPropertyId         = 0x000075d9,
    UIA_Selection2LastSelectedItemPropertyId          = 0x000075da,
    UIA_Selection2CurrentSelectedItemPropertyId       = 0x000075db,
    UIA_Selection2ItemCountPropertyId                 = 0x000075dc,
    UIA_HeadingLevelPropertyId                        = 0x000075dd,
    UIA_IsDialogPropertyId                            = 0x000075de,
}

alias UIA_TEXTATTRIBUTE_ID = int;
enum : int
{
    UIA_AnimationStyleAttributeId          = 0x00009c40,
    UIA_BackgroundColorAttributeId         = 0x00009c41,
    UIA_BulletStyleAttributeId             = 0x00009c42,
    UIA_CapStyleAttributeId                = 0x00009c43,
    UIA_CultureAttributeId                 = 0x00009c44,
    UIA_FontNameAttributeId                = 0x00009c45,
    UIA_FontSizeAttributeId                = 0x00009c46,
    UIA_FontWeightAttributeId              = 0x00009c47,
    UIA_ForegroundColorAttributeId         = 0x00009c48,
    UIA_HorizontalTextAlignmentAttributeId = 0x00009c49,
    UIA_IndentationFirstLineAttributeId    = 0x00009c4a,
    UIA_IndentationLeadingAttributeId      = 0x00009c4b,
    UIA_IndentationTrailingAttributeId     = 0x00009c4c,
    UIA_IsHiddenAttributeId                = 0x00009c4d,
    UIA_IsItalicAttributeId                = 0x00009c4e,
    UIA_IsReadOnlyAttributeId              = 0x00009c4f,
    UIA_IsSubscriptAttributeId             = 0x00009c50,
    UIA_IsSuperscriptAttributeId           = 0x00009c51,
    UIA_MarginBottomAttributeId            = 0x00009c52,
    UIA_MarginLeadingAttributeId           = 0x00009c53,
    UIA_MarginTopAttributeId               = 0x00009c54,
    UIA_MarginTrailingAttributeId          = 0x00009c55,
    UIA_OutlineStylesAttributeId           = 0x00009c56,
    UIA_OverlineColorAttributeId           = 0x00009c57,
    UIA_OverlineStyleAttributeId           = 0x00009c58,
    UIA_StrikethroughColorAttributeId      = 0x00009c59,
    UIA_StrikethroughStyleAttributeId      = 0x00009c5a,
    UIA_TabsAttributeId                    = 0x00009c5b,
    UIA_TextFlowDirectionsAttributeId      = 0x00009c5c,
    UIA_UnderlineColorAttributeId          = 0x00009c5d,
    UIA_UnderlineStyleAttributeId          = 0x00009c5e,
    UIA_AnnotationTypesAttributeId         = 0x00009c5f,
    UIA_AnnotationObjectsAttributeId       = 0x00009c60,
    UIA_StyleNameAttributeId               = 0x00009c61,
    UIA_StyleIdAttributeId                 = 0x00009c62,
    UIA_LinkAttributeId                    = 0x00009c63,
    UIA_IsActiveAttributeId                = 0x00009c64,
    UIA_SelectionActiveEndAttributeId      = 0x00009c65,
    UIA_CaretPositionAttributeId           = 0x00009c66,
    UIA_CaretBidiModeAttributeId           = 0x00009c67,
    UIA_LineSpacingAttributeId             = 0x00009c68,
    UIA_BeforeParagraphSpacingAttributeId  = 0x00009c69,
    UIA_AfterParagraphSpacingAttributeId   = 0x00009c6a,
    UIA_SayAsInterpretAsAttributeId        = 0x00009c6b,
}

alias UIA_CONTROLTYPE_ID = int;
enum : int
{
    UIA_ButtonControlTypeId       = 0x0000c350,
    UIA_CalendarControlTypeId     = 0x0000c351,
    UIA_CheckBoxControlTypeId     = 0x0000c352,
    UIA_ComboBoxControlTypeId     = 0x0000c353,
    UIA_EditControlTypeId         = 0x0000c354,
    UIA_HyperlinkControlTypeId    = 0x0000c355,
    UIA_ImageControlTypeId        = 0x0000c356,
    UIA_ListItemControlTypeId     = 0x0000c357,
    UIA_ListControlTypeId         = 0x0000c358,
    UIA_MenuControlTypeId         = 0x0000c359,
    UIA_MenuBarControlTypeId      = 0x0000c35a,
    UIA_MenuItemControlTypeId     = 0x0000c35b,
    UIA_ProgressBarControlTypeId  = 0x0000c35c,
    UIA_RadioButtonControlTypeId  = 0x0000c35d,
    UIA_ScrollBarControlTypeId    = 0x0000c35e,
    UIA_SliderControlTypeId       = 0x0000c35f,
    UIA_SpinnerControlTypeId      = 0x0000c360,
    UIA_StatusBarControlTypeId    = 0x0000c361,
    UIA_TabControlTypeId          = 0x0000c362,
    UIA_TabItemControlTypeId      = 0x0000c363,
    UIA_TextControlTypeId         = 0x0000c364,
    UIA_ToolBarControlTypeId      = 0x0000c365,
    UIA_ToolTipControlTypeId      = 0x0000c366,
    UIA_TreeControlTypeId         = 0x0000c367,
    UIA_TreeItemControlTypeId     = 0x0000c368,
    UIA_CustomControlTypeId       = 0x0000c369,
    UIA_GroupControlTypeId        = 0x0000c36a,
    UIA_ThumbControlTypeId        = 0x0000c36b,
    UIA_DataGridControlTypeId     = 0x0000c36c,
    UIA_DataItemControlTypeId     = 0x0000c36d,
    UIA_DocumentControlTypeId     = 0x0000c36e,
    UIA_SplitButtonControlTypeId  = 0x0000c36f,
    UIA_WindowControlTypeId       = 0x0000c370,
    UIA_PaneControlTypeId         = 0x0000c371,
    UIA_HeaderControlTypeId       = 0x0000c372,
    UIA_HeaderItemControlTypeId   = 0x0000c373,
    UIA_TableControlTypeId        = 0x0000c374,
    UIA_TitleBarControlTypeId     = 0x0000c375,
    UIA_SeparatorControlTypeId    = 0x0000c376,
    UIA_SemanticZoomControlTypeId = 0x0000c377,
    UIA_AppBarControlTypeId       = 0x0000c378,
}

alias UIA_ANNOTATIONTYPE = int;
enum : int
{
    AnnotationType_Unknown                = 0x0000ea60,
    AnnotationType_SpellingError          = 0x0000ea61,
    AnnotationType_GrammarError           = 0x0000ea62,
    AnnotationType_Comment                = 0x0000ea63,
    AnnotationType_FormulaError           = 0x0000ea64,
    AnnotationType_TrackChanges           = 0x0000ea65,
    AnnotationType_Header                 = 0x0000ea66,
    AnnotationType_Footer                 = 0x0000ea67,
    AnnotationType_Highlighted            = 0x0000ea68,
    AnnotationType_Endnote                = 0x0000ea69,
    AnnotationType_Footnote               = 0x0000ea6a,
    AnnotationType_InsertionChange        = 0x0000ea6b,
    AnnotationType_DeletionChange         = 0x0000ea6c,
    AnnotationType_MoveChange             = 0x0000ea6d,
    AnnotationType_FormatChange           = 0x0000ea6e,
    AnnotationType_UnsyncedChange         = 0x0000ea6f,
    AnnotationType_EditingLockedChange    = 0x0000ea70,
    AnnotationType_ExternalChange         = 0x0000ea71,
    AnnotationType_ConflictingChange      = 0x0000ea72,
    AnnotationType_Author                 = 0x0000ea73,
    AnnotationType_AdvancedProofingIssue  = 0x0000ea74,
    AnnotationType_DataValidationError    = 0x0000ea75,
    AnnotationType_CircularReferenceError = 0x0000ea76,
    AnnotationType_Mathematics            = 0x0000ea77,
    AnnotationType_Sensitive              = 0x0000ea78,
}

alias UIA_STYLE_ID = int;
enum : int
{
    StyleId_Custom       = 0x00011170,
    StyleId_Heading1     = 0x00011171,
    StyleId_Heading2     = 0x00011172,
    StyleId_Heading3     = 0x00011173,
    StyleId_Heading4     = 0x00011174,
    StyleId_Heading5     = 0x00011175,
    StyleId_Heading6     = 0x00011176,
    StyleId_Heading7     = 0x00011177,
    StyleId_Heading8     = 0x00011178,
    StyleId_Heading9     = 0x00011179,
    StyleId_Title        = 0x0001117a,
    StyleId_Subtitle     = 0x0001117b,
    StyleId_Normal       = 0x0001117c,
    StyleId_Emphasis     = 0x0001117d,
    StyleId_Quote        = 0x0001117e,
    StyleId_BulletedList = 0x0001117f,
    StyleId_NumberedList = 0x00011180,
}

alias UIA_LANDMARKTYPE_ID = int;
enum : int
{
    UIA_CustomLandmarkTypeId     = 0x00013880,
    UIA_FormLandmarkTypeId       = 0x00013881,
    UIA_MainLandmarkTypeId       = 0x00013882,
    UIA_NavigationLandmarkTypeId = 0x00013883,
    UIA_SearchLandmarkTypeId     = 0x00013884,
}

alias UIA_HEADINGLEVEL_ID = int;
enum : int
{
    HeadingLevel_None = 0x000138b2,
    HeadingLevel1     = 0x000138b3,
    HeadingLevel2     = 0x000138b4,
    HeadingLevel3     = 0x000138b5,
    HeadingLevel4     = 0x000138b6,
    HeadingLevel5     = 0x000138b7,
    HeadingLevel6     = 0x000138b8,
    HeadingLevel7     = 0x000138b9,
    HeadingLevel8     = 0x000138ba,
    HeadingLevel9     = 0x000138bb,
}

alias UIA_CHANGE_ID = int;
enum : int
{
    UIA_SummaryChangeId = 0x00015f90,
}

alias UIA_METADATA_ID = int;
enum : int
{
    UIA_SayAsInterpretAsMetadataId = 0x000186a0,
}

LRESULT LresultFromObject(const(GUID)* riid, WPARAM wParam, IUnknown punk);
HRESULT ObjectFromLresult(LRESULT lResult, const(GUID)* riid, WPARAM wParam, void** ppvObject);
HRESULT WindowFromAccessibleObject(IAccessible param0, HWND* phwnd);
HRESULT AccessibleObjectFromWindow(HWND hwnd, uint dwId, const(GUID)* riid, void** ppvObject);
HRESULT AccessibleObjectFromEvent(HWND hwnd, uint dwId, uint dwChildId, IAccessible* ppacc, VARIANT* pvarChild);
HRESULT AccessibleObjectFromPoint(POINT ptScreen, IAccessible* ppacc, VARIANT* pvarChild);
HRESULT AccessibleChildren(IAccessible paccContainer, int iChildStart, int cChildren, VARIANT* rgvarChildren, int* pcObtained);
uint GetRoleTextA(uint lRole, PSTR lpszRole, uint cchRoleMax);
uint GetRoleTextW(uint lRole, PWSTR lpszRole, uint cchRoleMax);
uint GetStateTextA(uint lStateBit, PSTR lpszState, uint cchState);
uint GetStateTextW(uint lStateBit, PWSTR lpszState, uint cchState);
void GetOleaccVersionInfo(uint* pVer, uint* pBuild);
HRESULT CreateStdAccessibleObject(HWND hwnd, int idObject, const(GUID)* riid, void** ppvObject);
HRESULT CreateStdAccessibleProxyA(HWND hwnd, const(char)* pClassName, int idObject, const(GUID)* riid, void** ppvObject);
HRESULT CreateStdAccessibleProxyW(HWND hwnd, const(wchar)* pClassName, int idObject, const(GUID)* riid, void** ppvObject);
HRESULT AccSetRunningUtilityState(HWND hwndApp, uint dwUtilityStateMask, ACC_UTILITY_STATE_FLAGS dwUtilityState);
HRESULT AccNotifyTouchInteraction(HWND hwndApp, HWND hwndTarget, POINT ptTarget);
BOOL UiaGetErrorDescription(BSTR* pDescription);
HRESULT UiaHUiaNodeFromVariant(VARIANT* pvar, HUIANODE* phnode);
HRESULT UiaHPatternObjectFromVariant(VARIANT* pvar, HUIAPATTERNOBJECT* phobj);
HRESULT UiaHTextRangeFromVariant(VARIANT* pvar, HUIATEXTRANGE* phtextrange);
BOOL UiaNodeRelease(HUIANODE hnode);
HRESULT UiaGetPropertyValue(HUIANODE hnode, int propertyId, VARIANT* pValue);
HRESULT UiaGetPatternProvider(HUIANODE hnode, int patternId, HUIAPATTERNOBJECT* phobj);
HRESULT UiaGetRuntimeId(HUIANODE hnode, SAFEARRAY** pruntimeId);
HRESULT UiaSetFocus(HUIANODE hnode);
HRESULT UiaNavigate(HUIANODE hnode, NavigateDirection direction, UiaCondition* pCondition, UiaCacheRequest* pRequest, SAFEARRAY** ppRequestedData, BSTR* ppTreeStructure);
HRESULT UiaGetUpdatedCache(HUIANODE hnode, UiaCacheRequest* pRequest, NormalizeState normalizeState, UiaCondition* pNormalizeCondition, SAFEARRAY** ppRequestedData, BSTR* ppTreeStructure);
HRESULT UiaFind(HUIANODE hnode, UiaFindParams* pParams, UiaCacheRequest* pRequest, SAFEARRAY** ppRequestedData, SAFEARRAY** ppOffsets, SAFEARRAY** ppTreeStructures);
HRESULT UiaNodeFromPoint(double x, double y, UiaCacheRequest* pRequest, SAFEARRAY** ppRequestedData, BSTR* ppTreeStructure);
HRESULT UiaNodeFromFocus(UiaCacheRequest* pRequest, SAFEARRAY** ppRequestedData, BSTR* ppTreeStructure);
HRESULT UiaNodeFromHandle(HWND hwnd, HUIANODE* phnode);
HRESULT UiaNodeFromProvider(IRawElementProviderSimple pProvider, HUIANODE* phnode);
HRESULT UiaGetRootNode(HUIANODE* phnode);
void UiaRegisterProviderCallback(UiaProviderCallback* pCallback);
int UiaLookupId(AutomationIdentifierType type, const(GUID)* pGuid);
HRESULT UiaGetReservedNotSupportedValue(IUnknown* punkNotSupportedValue);
HRESULT UiaGetReservedMixedAttributeValue(IUnknown* punkMixedAttributeValue);
BOOL UiaClientsAreListening();
HRESULT UiaRaiseAutomationPropertyChangedEvent(IRawElementProviderSimple pProvider, UIA_PROPERTY_ID id, VARIANT oldValue, VARIANT newValue);
HRESULT UiaRaiseAutomationEvent(IRawElementProviderSimple pProvider, UIA_EVENT_ID id);
HRESULT UiaRaiseStructureChangedEvent(IRawElementProviderSimple pProvider, StructureChangeType structureChangeType, int* pRuntimeId, int cRuntimeIdLen);
HRESULT UiaRaiseAsyncContentLoadedEvent(IRawElementProviderSimple pProvider, AsyncContentLoadedState asyncContentLoadedState, double percentComplete);
HRESULT UiaRaiseTextEditTextChangedEvent(IRawElementProviderSimple pProvider, TextEditChangeType textEditChangeType, SAFEARRAY* pChangedData);
HRESULT UiaRaiseChangesEvent(IRawElementProviderSimple pProvider, int eventIdCount, UiaChangeInfo* pUiaChanges);
HRESULT UiaRaiseNotificationEvent(IRawElementProviderSimple provider, NotificationKind notificationKind, NotificationProcessing notificationProcessing, BSTR displayString, BSTR activityId);
HRESULT UiaRaiseActiveTextPositionChangedEvent(IRawElementProviderSimple provider, ITextRangeProvider textRange);
HRESULT UiaAddEvent(HUIANODE hnode, int eventId, UiaEventCallback* pCallback, TreeScope scope_, int* pProperties, int cProperties, UiaCacheRequest* pRequest, HUIAEVENT* phEvent);
HRESULT UiaRemoveEvent(HUIAEVENT hEvent);
HRESULT UiaEventAddWindow(HUIAEVENT hEvent, HWND hwnd);
HRESULT UiaEventRemoveWindow(HUIAEVENT hEvent, HWND hwnd);
HRESULT DockPattern_SetDockPosition(HUIAPATTERNOBJECT hobj, DockPosition dockPosition);
HRESULT ExpandCollapsePattern_Collapse(HUIAPATTERNOBJECT hobj);
HRESULT ExpandCollapsePattern_Expand(HUIAPATTERNOBJECT hobj);
HRESULT GridPattern_GetItem(HUIAPATTERNOBJECT hobj, int row, int column, HUIANODE* pResult);
HRESULT InvokePattern_Invoke(HUIAPATTERNOBJECT hobj);
HRESULT MultipleViewPattern_GetViewName(HUIAPATTERNOBJECT hobj, int viewId, BSTR* ppStr);
HRESULT MultipleViewPattern_SetCurrentView(HUIAPATTERNOBJECT hobj, int viewId);
HRESULT RangeValuePattern_SetValue(HUIAPATTERNOBJECT hobj, double val);
HRESULT ScrollItemPattern_ScrollIntoView(HUIAPATTERNOBJECT hobj);
HRESULT ScrollPattern_Scroll(HUIAPATTERNOBJECT hobj, ScrollAmount horizontalAmount, ScrollAmount verticalAmount);
HRESULT ScrollPattern_SetScrollPercent(HUIAPATTERNOBJECT hobj, double horizontalPercent, double verticalPercent);
HRESULT SelectionItemPattern_AddToSelection(HUIAPATTERNOBJECT hobj);
HRESULT SelectionItemPattern_RemoveFromSelection(HUIAPATTERNOBJECT hobj);
HRESULT SelectionItemPattern_Select(HUIAPATTERNOBJECT hobj);
HRESULT TogglePattern_Toggle(HUIAPATTERNOBJECT hobj);
HRESULT TransformPattern_Move(HUIAPATTERNOBJECT hobj, double x, double y);
HRESULT TransformPattern_Resize(HUIAPATTERNOBJECT hobj, double width, double height);
HRESULT TransformPattern_Rotate(HUIAPATTERNOBJECT hobj, double degrees);
HRESULT ValuePattern_SetValue(HUIAPATTERNOBJECT hobj, const(wchar)* pVal);
HRESULT WindowPattern_Close(HUIAPATTERNOBJECT hobj);
HRESULT WindowPattern_SetWindowVisualState(HUIAPATTERNOBJECT hobj, WindowVisualState state);
HRESULT WindowPattern_WaitForInputIdle(HUIAPATTERNOBJECT hobj, int milliseconds, BOOL* pResult);
HRESULT TextPattern_GetSelection(HUIAPATTERNOBJECT hobj, SAFEARRAY** pRetVal);
HRESULT TextPattern_GetVisibleRanges(HUIAPATTERNOBJECT hobj, SAFEARRAY** pRetVal);
HRESULT TextPattern_RangeFromChild(HUIAPATTERNOBJECT hobj, HUIANODE hnodeChild, HUIATEXTRANGE* pRetVal);
HRESULT TextPattern_RangeFromPoint(HUIAPATTERNOBJECT hobj, UiaPoint point, HUIATEXTRANGE* pRetVal);
HRESULT TextPattern_get_DocumentRange(HUIAPATTERNOBJECT hobj, HUIATEXTRANGE* pRetVal);
HRESULT TextPattern_get_SupportedTextSelection(HUIAPATTERNOBJECT hobj, SupportedTextSelection* pRetVal);
HRESULT TextRange_Clone(HUIATEXTRANGE hobj, HUIATEXTRANGE* pRetVal);
HRESULT TextRange_Compare(HUIATEXTRANGE hobj, HUIATEXTRANGE range, BOOL* pRetVal);
HRESULT TextRange_CompareEndpoints(HUIATEXTRANGE hobj, TextPatternRangeEndpoint endpoint, HUIATEXTRANGE targetRange, TextPatternRangeEndpoint targetEndpoint, int* pRetVal);
HRESULT TextRange_ExpandToEnclosingUnit(HUIATEXTRANGE hobj, TextUnit unit);
HRESULT TextRange_GetAttributeValue(HUIATEXTRANGE hobj, int attributeId, VARIANT* pRetVal);
HRESULT TextRange_FindAttribute(HUIATEXTRANGE hobj, int attributeId, VARIANT val, BOOL backward, HUIATEXTRANGE* pRetVal);
HRESULT TextRange_FindText(HUIATEXTRANGE hobj, BSTR text, BOOL backward, BOOL ignoreCase, HUIATEXTRANGE* pRetVal);
HRESULT TextRange_GetBoundingRectangles(HUIATEXTRANGE hobj, SAFEARRAY** pRetVal);
HRESULT TextRange_GetEnclosingElement(HUIATEXTRANGE hobj, HUIANODE* pRetVal);
HRESULT TextRange_GetText(HUIATEXTRANGE hobj, int maxLength, BSTR* pRetVal);
HRESULT TextRange_Move(HUIATEXTRANGE hobj, TextUnit unit, int count, int* pRetVal);
HRESULT TextRange_MoveEndpointByUnit(HUIATEXTRANGE hobj, TextPatternRangeEndpoint endpoint, TextUnit unit, int count, int* pRetVal);
HRESULT TextRange_MoveEndpointByRange(HUIATEXTRANGE hobj, TextPatternRangeEndpoint endpoint, HUIATEXTRANGE targetRange, TextPatternRangeEndpoint targetEndpoint);
HRESULT TextRange_Select(HUIATEXTRANGE hobj);
HRESULT TextRange_AddToSelection(HUIATEXTRANGE hobj);
HRESULT TextRange_RemoveFromSelection(HUIATEXTRANGE hobj);
HRESULT TextRange_ScrollIntoView(HUIATEXTRANGE hobj, BOOL alignToTop);
HRESULT TextRange_GetChildren(HUIATEXTRANGE hobj, SAFEARRAY** pRetVal);
HRESULT ItemContainerPattern_FindItemByProperty(HUIAPATTERNOBJECT hobj, HUIANODE hnodeStartAfter, int propertyId, VARIANT value, HUIANODE* pFound);
HRESULT LegacyIAccessiblePattern_Select(HUIAPATTERNOBJECT hobj, int flagsSelect);
HRESULT LegacyIAccessiblePattern_DoDefaultAction(HUIAPATTERNOBJECT hobj);
HRESULT LegacyIAccessiblePattern_SetValue(HUIAPATTERNOBJECT hobj, const(wchar)* szValue);
HRESULT LegacyIAccessiblePattern_GetIAccessible(HUIAPATTERNOBJECT hobj, IAccessible* pAccessible);
HRESULT SynchronizedInputPattern_StartListening(HUIAPATTERNOBJECT hobj, SynchronizedInputType inputType);
HRESULT SynchronizedInputPattern_Cancel(HUIAPATTERNOBJECT hobj);
HRESULT VirtualizedItemPattern_Realize(HUIAPATTERNOBJECT hobj);
BOOL UiaPatternRelease(HUIAPATTERNOBJECT hobj);
BOOL UiaTextRangeRelease(HUIATEXTRANGE hobj);
LRESULT UiaReturnRawElementProvider(HWND hwnd, WPARAM wParam, LPARAM lParam, IRawElementProviderSimple el);
HRESULT UiaHostProviderFromHwnd(HWND hwnd, IRawElementProviderSimple* ppProvider);
HRESULT UiaProviderForNonClient(HWND hwnd, int idObject, int idChild, IRawElementProviderSimple* ppProvider);
HRESULT UiaIAccessibleFromProvider(IRawElementProviderSimple pProvider, uint dwFlags, IAccessible* ppAccessible, VARIANT* pvarChild);
HRESULT UiaProviderFromIAccessible(IAccessible pAccessible, int idChild, uint dwFlags, IRawElementProviderSimple* ppProvider);
HRESULT UiaDisconnectAllProviders();
HRESULT UiaDisconnectProvider(IRawElementProviderSimple pProvider);
BOOL UiaHasServerSideProvider(HWND hwnd);
BOOL RegisterPointerInputTarget(HWND hwnd, POINTER_INPUT_TYPE pointerType);
BOOL UnregisterPointerInputTarget(HWND hwnd, POINTER_INPUT_TYPE pointerType);
BOOL RegisterPointerInputTargetEx(HWND hwnd, POINTER_INPUT_TYPE pointerType, BOOL fObserve);
BOOL UnregisterPointerInputTargetEx(HWND hwnd, POINTER_INPUT_TYPE pointerType);
void NotifyWinEvent(uint event, HWND hwnd, int idObject, int idChild);
HWINEVENTHOOK SetWinEventHook(uint eventMin, uint eventMax, HMODULE hmodWinEventProc, WINEVENTPROC pfnWinEventProc, uint idProcess, uint idThread, uint dwFlags);
BOOL IsWinEventHookInstalled(uint event);
BOOL UnhookWinEvent(HWINEVENTHOOK hWinEventHook);
enum LIBID_Accessibility = GUID(0x1ea4dbf0, 0x3c3b, 0x11cf, [0x81, 0xc, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum CLSID_AccPropServices = GUID(0xb5f8350b, 0x548, 0x48b1, [0xa6, 0xee, 0x88, 0xbd, 0x0, 0xb4, 0xa5, 0xe7]);
enum IIS_IsOleaccProxy = GUID(0x902697fa, 0x80e4, 0x4560, [0x80, 0x2a, 0xa1, 0x3f, 0x22, 0xa6, 0x47, 0x9]);
enum IIS_ControlAccessible = GUID(0x38c682a6, 0x9731, 0x43f2, [0x9f, 0xae, 0xe9, 0x1, 0xe6, 0x41, 0xb1, 0x1]);
enum ANRUS_PRIORITY_AUDIO_DYNAMIC_DUCK = 0x00000010;
enum MSAA_MENU_SIG = 0xffffffffaa0df00d;
enum PROPID_ACC_NAME = GUID(0x608d3df8, 0x8128, 0x4aa7, [0xa4, 0x28, 0xf5, 0x5e, 0x49, 0x26, 0x72, 0x91]);
enum PROPID_ACC_VALUE = GUID(0x123fe443, 0x211a, 0x4615, [0x95, 0x27, 0xc4, 0x5a, 0x7e, 0x93, 0x71, 0x7a]);
enum PROPID_ACC_DESCRIPTION = GUID(0x4d48dfe4, 0xbd3f, 0x491f, [0xa6, 0x48, 0x49, 0x2d, 0x6f, 0x20, 0xc5, 0x88]);
enum PROPID_ACC_ROLE = GUID(0xcb905ff2, 0x7bd1, 0x4c05, [0xb3, 0xc8, 0xe6, 0xc2, 0x41, 0x36, 0x4d, 0x70]);
enum PROPID_ACC_STATE = GUID(0xa8d4d5b0, 0xa21, 0x42d0, [0xa5, 0xc0, 0x51, 0x4e, 0x98, 0x4f, 0x45, 0x7b]);
enum PROPID_ACC_HELP = GUID(0xc831e11f, 0x44db, 0x4a99, [0x97, 0x68, 0xcb, 0x8f, 0x97, 0x8b, 0x72, 0x31]);
enum PROPID_ACC_KEYBOARDSHORTCUT = GUID(0x7d9bceee, 0x7d1e, 0x4979, [0x93, 0x82, 0x51, 0x80, 0xf4, 0x17, 0x2c, 0x34]);
enum PROPID_ACC_DEFAULTACTION = GUID(0x180c072b, 0xc27f, 0x43c7, [0x99, 0x22, 0xf6, 0x35, 0x62, 0xa4, 0x63, 0x2b]);
enum PROPID_ACC_HELPTOPIC = GUID(0x787d1379, 0x8ede, 0x440b, [0x8a, 0xec, 0x11, 0xf7, 0xbf, 0x90, 0x30, 0xb3]);
enum PROPID_ACC_FOCUS = GUID(0x6eb335df, 0x1c29, 0x4127, [0xb1, 0x2c, 0xde, 0xe9, 0xfd, 0x15, 0x7f, 0x2b]);
enum PROPID_ACC_SELECTION = GUID(0xb99d073c, 0xd731, 0x405b, [0x90, 0x61, 0xd9, 0x5e, 0x8f, 0x84, 0x29, 0x84]);
enum PROPID_ACC_PARENT = GUID(0x474c22b6, 0xffc2, 0x467a, [0xb1, 0xb5, 0xe9, 0x58, 0xb4, 0x65, 0x73, 0x30]);
enum PROPID_ACC_NAV_UP = GUID(0x16e1a2b, 0x1a4e, 0x4767, [0x86, 0x12, 0x33, 0x86, 0xf6, 0x69, 0x35, 0xec]);
enum PROPID_ACC_NAV_DOWN = GUID(0x31670ed, 0x3cdf, 0x48d2, [0x96, 0x13, 0x13, 0x8f, 0x2d, 0xd8, 0xa6, 0x68]);
enum PROPID_ACC_NAV_LEFT = GUID(0x228086cb, 0x82f1, 0x4a39, [0x87, 0x5, 0xdc, 0xdc, 0xf, 0xff, 0x92, 0xf5]);
enum PROPID_ACC_NAV_RIGHT = GUID(0xcd211d9f, 0xe1cb, 0x4fe5, [0xa7, 0x7c, 0x92, 0xb, 0x88, 0x4d, 0x9, 0x5b]);
enum PROPID_ACC_NAV_PREV = GUID(0x776d3891, 0xc73b, 0x4480, [0xb3, 0xf6, 0x7, 0x6a, 0x16, 0xa1, 0x5a, 0xf6]);
enum PROPID_ACC_NAV_NEXT = GUID(0x1cdc5455, 0x8cd9, 0x4c92, [0xa3, 0x71, 0x39, 0x39, 0xa2, 0xfe, 0x3e, 0xee]);
enum PROPID_ACC_NAV_FIRSTCHILD = GUID(0xcfd02558, 0x557b, 0x4c67, [0x84, 0xf9, 0x2a, 0x9, 0xfc, 0xe4, 0x7, 0x49]);
enum PROPID_ACC_NAV_LASTCHILD = GUID(0x302ecaa5, 0x48d5, 0x4f8d, [0xb6, 0x71, 0x1a, 0x8d, 0x20, 0xa7, 0x78, 0x32]);
enum PROPID_ACC_ROLEMAP = GUID(0xf79acda2, 0x140d, 0x4fe6, [0x89, 0x14, 0x20, 0x84, 0x76, 0x32, 0x82, 0x69]);
enum PROPID_ACC_VALUEMAP = GUID(0xda1c3d79, 0xfc5c, 0x420e, [0xb3, 0x99, 0x9d, 0x15, 0x33, 0x54, 0x9e, 0x75]);
enum PROPID_ACC_STATEMAP = GUID(0x43946c5e, 0xac0, 0x4042, [0xb5, 0x25, 0x7, 0xbb, 0xdb, 0xe1, 0x7f, 0xa7]);
enum PROPID_ACC_DESCRIPTIONMAP = GUID(0x1ff1435f, 0x8a14, 0x477b, [0xb2, 0x26, 0xa0, 0xab, 0xe2, 0x79, 0x97, 0x5d]);
enum PROPID_ACC_DODEFAULTACTION = GUID(0x1ba09523, 0x2e3b, 0x49a6, [0xa0, 0x59, 0x59, 0x68, 0x2a, 0x3c, 0x48, 0xfd]);
enum DISPID_ACC_PARENT = 0xffffffffffffec78;
enum DISPID_ACC_CHILDCOUNT = 0xffffffffffffec77;
enum DISPID_ACC_CHILD = 0xffffffffffffec76;
enum DISPID_ACC_NAME = 0xffffffffffffec75;
enum DISPID_ACC_VALUE = 0xffffffffffffec74;
enum DISPID_ACC_DESCRIPTION = 0xffffffffffffec73;
enum DISPID_ACC_ROLE = 0xffffffffffffec72;
enum DISPID_ACC_STATE = 0xffffffffffffec71;
enum DISPID_ACC_HELP = 0xffffffffffffec70;
enum DISPID_ACC_HELPTOPIC = 0xffffffffffffec6f;
enum DISPID_ACC_KEYBOARDSHORTCUT = 0xffffffffffffec6e;
enum DISPID_ACC_FOCUS = 0xffffffffffffec6d;
enum DISPID_ACC_SELECTION = 0xffffffffffffec6c;
enum DISPID_ACC_DEFAULTACTION = 0xffffffffffffec6b;
enum DISPID_ACC_SELECT = 0xffffffffffffec6a;
enum DISPID_ACC_LOCATION = 0xffffffffffffec69;
enum DISPID_ACC_NAVIGATE = 0xffffffffffffec68;
enum DISPID_ACC_HITTEST = 0xffffffffffffec67;
enum DISPID_ACC_DODEFAULTACTION = 0xffffffffffffec66;
enum NAVDIR_MIN = 0x00000000;
enum NAVDIR_UP = 0x00000001;
enum NAVDIR_DOWN = 0x00000002;
enum NAVDIR_LEFT = 0x00000003;
enum NAVDIR_RIGHT = 0x00000004;
enum NAVDIR_NEXT = 0x00000005;
enum NAVDIR_PREVIOUS = 0x00000006;
enum NAVDIR_FIRSTCHILD = 0x00000007;
enum NAVDIR_LASTCHILD = 0x00000008;
enum NAVDIR_MAX = 0x00000009;
enum SELFLAG_NONE = 0x00000000;
enum SELFLAG_TAKEFOCUS = 0x00000001;
enum SELFLAG_TAKESELECTION = 0x00000002;
enum SELFLAG_EXTENDSELECTION = 0x00000004;
enum SELFLAG_ADDSELECTION = 0x00000008;
enum SELFLAG_REMOVESELECTION = 0x00000010;
enum SELFLAG_VALID = 0x0000001f;
enum STATE_SYSTEM_NORMAL = 0x00000000;
enum STATE_SYSTEM_HASPOPUP = 0x40000000;
enum ROLE_SYSTEM_TITLEBAR = 0x00000001;
enum ROLE_SYSTEM_MENUBAR = 0x00000002;
enum ROLE_SYSTEM_SCROLLBAR = 0x00000003;
enum ROLE_SYSTEM_GRIP = 0x00000004;
enum ROLE_SYSTEM_SOUND = 0x00000005;
enum ROLE_SYSTEM_CURSOR = 0x00000006;
enum ROLE_SYSTEM_CARET = 0x00000007;
enum ROLE_SYSTEM_ALERT = 0x00000008;
enum ROLE_SYSTEM_WINDOW = 0x00000009;
enum ROLE_SYSTEM_CLIENT = 0x0000000a;
enum ROLE_SYSTEM_MENUPOPUP = 0x0000000b;
enum ROLE_SYSTEM_MENUITEM = 0x0000000c;
enum ROLE_SYSTEM_TOOLTIP = 0x0000000d;
enum ROLE_SYSTEM_APPLICATION = 0x0000000e;
enum ROLE_SYSTEM_DOCUMENT = 0x0000000f;
enum ROLE_SYSTEM_PANE = 0x00000010;
enum ROLE_SYSTEM_CHART = 0x00000011;
enum ROLE_SYSTEM_DIALOG = 0x00000012;
enum ROLE_SYSTEM_BORDER = 0x00000013;
enum ROLE_SYSTEM_GROUPING = 0x00000014;
enum ROLE_SYSTEM_SEPARATOR = 0x00000015;
enum ROLE_SYSTEM_TOOLBAR = 0x00000016;
enum ROLE_SYSTEM_STATUSBAR = 0x00000017;
enum ROLE_SYSTEM_TABLE = 0x00000018;
enum ROLE_SYSTEM_COLUMNHEADER = 0x00000019;
enum ROLE_SYSTEM_ROWHEADER = 0x0000001a;
enum ROLE_SYSTEM_COLUMN = 0x0000001b;
enum ROLE_SYSTEM_ROW = 0x0000001c;
enum ROLE_SYSTEM_CELL = 0x0000001d;
enum ROLE_SYSTEM_LINK = 0x0000001e;
enum ROLE_SYSTEM_HELPBALLOON = 0x0000001f;
enum ROLE_SYSTEM_CHARACTER = 0x00000020;
enum ROLE_SYSTEM_LIST = 0x00000021;
enum ROLE_SYSTEM_LISTITEM = 0x00000022;
enum ROLE_SYSTEM_OUTLINE = 0x00000023;
enum ROLE_SYSTEM_OUTLINEITEM = 0x00000024;
enum ROLE_SYSTEM_PAGETAB = 0x00000025;
enum ROLE_SYSTEM_PROPERTYPAGE = 0x00000026;
enum ROLE_SYSTEM_INDICATOR = 0x00000027;
enum ROLE_SYSTEM_GRAPHIC = 0x00000028;
enum ROLE_SYSTEM_STATICTEXT = 0x00000029;
enum ROLE_SYSTEM_TEXT = 0x0000002a;
enum ROLE_SYSTEM_PUSHBUTTON = 0x0000002b;
enum ROLE_SYSTEM_CHECKBUTTON = 0x0000002c;
enum ROLE_SYSTEM_RADIOBUTTON = 0x0000002d;
enum ROLE_SYSTEM_COMBOBOX = 0x0000002e;
enum ROLE_SYSTEM_DROPLIST = 0x0000002f;
enum ROLE_SYSTEM_PROGRESSBAR = 0x00000030;
enum ROLE_SYSTEM_DIAL = 0x00000031;
enum ROLE_SYSTEM_HOTKEYFIELD = 0x00000032;
enum ROLE_SYSTEM_SLIDER = 0x00000033;
enum ROLE_SYSTEM_SPINBUTTON = 0x00000034;
enum ROLE_SYSTEM_DIAGRAM = 0x00000035;
enum ROLE_SYSTEM_ANIMATION = 0x00000036;
enum ROLE_SYSTEM_EQUATION = 0x00000037;
enum ROLE_SYSTEM_BUTTONDROPDOWN = 0x00000038;
enum ROLE_SYSTEM_BUTTONMENU = 0x00000039;
enum ROLE_SYSTEM_BUTTONDROPDOWNGRID = 0x0000003a;
enum ROLE_SYSTEM_WHITESPACE = 0x0000003b;
enum ROLE_SYSTEM_PAGETABLIST = 0x0000003c;
enum ROLE_SYSTEM_CLOCK = 0x0000003d;
enum ROLE_SYSTEM_SPLITBUTTON = 0x0000003e;
enum ROLE_SYSTEM_IPADDRESS = 0x0000003f;
enum ROLE_SYSTEM_OUTLINEBUTTON = 0x00000040;
enum UIA_E_ELEMENTNOTENABLED = 0x80040200;
enum UIA_E_ELEMENTNOTAVAILABLE = 0x80040201;
enum UIA_E_NOCLICKABLEPOINT = 0x80040202;
enum UIA_E_PROXYASSEMBLYNOTLOADED = 0x80040203;
enum UIA_E_NOTSUPPORTED = 0x80040204;
enum UIA_E_INVALIDOPERATION = 0x80131509;
enum UIA_E_TIMEOUT = 0x80131505;
enum UiaAppendRuntimeId = 0x00000003;
enum UiaRootObjectId = 0xffffffffffffffe7;
enum RuntimeId_Property_GUID = GUID(0xa39eebfa, 0x7fba, 0x4c89, [0xb4, 0xd4, 0xb9, 0x9e, 0x2d, 0xe7, 0xd1, 0x60]);
enum BoundingRectangle_Property_GUID = GUID(0x7bbfe8b2, 0x3bfc, 0x48dd, [0xb7, 0x29, 0xc7, 0x94, 0xb8, 0x46, 0xe9, 0xa1]);
enum ProcessId_Property_GUID = GUID(0x40499998, 0x9c31, 0x4245, [0xa4, 0x3, 0x87, 0x32, 0xe, 0x59, 0xea, 0xf6]);
enum ControlType_Property_GUID = GUID(0xca774fea, 0x28ac, 0x4bc2, [0x94, 0xca, 0xac, 0xec, 0x6d, 0x6c, 0x10, 0xa3]);
enum LocalizedControlType_Property_GUID = GUID(0x8763404f, 0xa1bd, 0x452a, [0x89, 0xc4, 0x3f, 0x1, 0xd3, 0x83, 0x38, 0x6]);
enum Name_Property_GUID = GUID(0xc3a6921b, 0x4a99, 0x44f1, [0xbc, 0xa6, 0x61, 0x18, 0x70, 0x52, 0xc4, 0x31]);
enum AcceleratorKey_Property_GUID = GUID(0x514865df, 0x2557, 0x4cb9, [0xae, 0xed, 0x6c, 0xed, 0x8, 0x4c, 0xe5, 0x2c]);
enum AccessKey_Property_GUID = GUID(0x6827b12, 0xa7f9, 0x4a15, [0x91, 0x7c, 0xff, 0xa5, 0xad, 0x3e, 0xb0, 0xa7]);
enum HasKeyboardFocus_Property_GUID = GUID(0xcf8afd39, 0x3f46, 0x4800, [0x96, 0x56, 0xb2, 0xbf, 0x12, 0x52, 0x99, 0x5]);
enum IsKeyboardFocusable_Property_GUID = GUID(0xf7b8552a, 0x859, 0x4b37, [0xb9, 0xcb, 0x51, 0xe7, 0x20, 0x92, 0xf2, 0x9f]);
enum IsEnabled_Property_GUID = GUID(0x2109427f, 0xda60, 0x4fed, [0xbf, 0x1b, 0x26, 0x4b, 0xdc, 0xe6, 0xeb, 0x3a]);
enum AutomationId_Property_GUID = GUID(0xc82c0500, 0xb60e, 0x4310, [0xa2, 0x67, 0x30, 0x3c, 0x53, 0x1f, 0x8e, 0xe5]);
enum ClassName_Property_GUID = GUID(0x157b7215, 0x894f, 0x4b65, [0x84, 0xe2, 0xaa, 0xc0, 0xda, 0x8, 0xb1, 0x6b]);
enum HelpText_Property_GUID = GUID(0x8555685, 0x977, 0x45c7, [0xa7, 0xa6, 0xab, 0xaf, 0x56, 0x84, 0x12, 0x1a]);
enum ClickablePoint_Property_GUID = GUID(0x196903b, 0xb203, 0x4818, [0xa9, 0xf3, 0xf0, 0x8e, 0x67, 0x5f, 0x23, 0x41]);
enum Culture_Property_GUID = GUID(0xe2d74f27, 0x3d79, 0x4dc2, [0xb8, 0x8b, 0x30, 0x44, 0x96, 0x3a, 0x8a, 0xfb]);
enum IsControlElement_Property_GUID = GUID(0x95f35085, 0xabcc, 0x4afd, [0xa5, 0xf4, 0xdb, 0xb4, 0x6c, 0x23, 0xf, 0xdb]);
enum IsContentElement_Property_GUID = GUID(0x4bda64a8, 0xf5d8, 0x480b, [0x81, 0x55, 0xef, 0x2e, 0x89, 0xad, 0xb6, 0x72]);
enum LabeledBy_Property_GUID = GUID(0xe5b8924b, 0xfc8a, 0x4a35, [0x80, 0x31, 0xcf, 0x78, 0xac, 0x43, 0xe5, 0x5e]);
enum IsPassword_Property_GUID = GUID(0xe8482eb1, 0x687c, 0x497b, [0xbe, 0xbc, 0x3, 0xbe, 0x53, 0xec, 0x14, 0x54]);
enum NewNativeWindowHandle_Property_GUID = GUID(0x5196b33b, 0x380a, 0x4982, [0x95, 0xe1, 0x91, 0xf3, 0xef, 0x60, 0xe0, 0x24]);
enum ItemType_Property_GUID = GUID(0xcdda434d, 0x6222, 0x413b, [0xa6, 0x8a, 0x32, 0x5d, 0xd1, 0xd4, 0xf, 0x39]);
enum IsOffscreen_Property_GUID = GUID(0x3c3d160, 0xdb79, 0x42db, [0xa2, 0xef, 0x1c, 0x23, 0x1e, 0xed, 0xe5, 0x7]);
enum Orientation_Property_GUID = GUID(0xa01eee62, 0x3884, 0x4415, [0x88, 0x7e, 0x67, 0x8e, 0xc2, 0x1e, 0x39, 0xba]);
enum FrameworkId_Property_GUID = GUID(0xdbfd9900, 0x7e1a, 0x4f58, [0xb6, 0x1b, 0x70, 0x63, 0x12, 0xf, 0x77, 0x3b]);
enum IsRequiredForForm_Property_GUID = GUID(0x4f5f43cf, 0x59fb, 0x4bde, [0xa2, 0x70, 0x60, 0x2e, 0x5e, 0x11, 0x41, 0xe9]);
enum ItemStatus_Property_GUID = GUID(0x51de0321, 0x3973, 0x43e7, [0x89, 0x13, 0xb, 0x8, 0xe8, 0x13, 0xc3, 0x7f]);
enum AriaRole_Property_GUID = GUID(0xdd207b95, 0xbe4a, 0x4e0d, [0xb7, 0x27, 0x63, 0xac, 0xe9, 0x4b, 0x69, 0x16]);
enum AriaProperties_Property_GUID = GUID(0x4213678c, 0xe025, 0x4922, [0xbe, 0xb5, 0xe4, 0x3b, 0xa0, 0x8e, 0x62, 0x21]);
enum IsDataValidForForm_Property_GUID = GUID(0x445ac684, 0xc3fc, 0x4dd9, [0xac, 0xf8, 0x84, 0x5a, 0x57, 0x92, 0x96, 0xba]);
enum ControllerFor_Property_GUID = GUID(0x51124c8a, 0xa5d2, 0x4f13, [0x9b, 0xe6, 0x7f, 0xa8, 0xba, 0x9d, 0x3a, 0x90]);
enum DescribedBy_Property_GUID = GUID(0x7c5865b8, 0x9992, 0x40fd, [0x8d, 0xb0, 0x6b, 0xf1, 0xd3, 0x17, 0xf9, 0x98]);
enum FlowsTo_Property_GUID = GUID(0xe4f33d20, 0x559a, 0x47fb, [0xa8, 0x30, 0xf9, 0xcb, 0x4f, 0xf1, 0xa7, 0xa]);
enum ProviderDescription_Property_GUID = GUID(0xdca5708a, 0xc16b, 0x4cd9, [0xb8, 0x89, 0xbe, 0xb1, 0x6a, 0x80, 0x49, 0x4]);
enum OptimizeForVisualContent_Property_GUID = GUID(0x6a852250, 0xc75a, 0x4e5d, [0xb8, 0x58, 0xe3, 0x81, 0xb0, 0xf7, 0x88, 0x61]);
enum IsDockPatternAvailable_Property_GUID = GUID(0x2600a4c4, 0x2ff8, 0x4c96, [0xae, 0x31, 0x8f, 0xe6, 0x19, 0xa1, 0x3c, 0x6c]);
enum IsExpandCollapsePatternAvailable_Property_GUID = GUID(0x929d3806, 0x5287, 0x4725, [0xaa, 0x16, 0x22, 0x2a, 0xfc, 0x63, 0xd5, 0x95]);
enum IsGridItemPatternAvailable_Property_GUID = GUID(0x5a43e524, 0xf9a2, 0x4b12, [0x84, 0xc8, 0xb4, 0x8a, 0x3e, 0xfe, 0xdd, 0x34]);
enum IsGridPatternAvailable_Property_GUID = GUID(0x5622c26c, 0xf0ef, 0x4f3b, [0x97, 0xcb, 0x71, 0x4c, 0x8, 0x68, 0x58, 0x8b]);
enum IsInvokePatternAvailable_Property_GUID = GUID(0x4e725738, 0x8364, 0x4679, [0xaa, 0x6c, 0xf3, 0xf4, 0x19, 0x31, 0xf7, 0x50]);
enum IsMultipleViewPatternAvailable_Property_GUID = GUID(0xff0a31eb, 0x8e25, 0x469d, [0x8d, 0x6e, 0xe7, 0x71, 0xa2, 0x7c, 0x1b, 0x90]);
enum IsRangeValuePatternAvailable_Property_GUID = GUID(0xfda4244a, 0xeb4d, 0x43ff, [0xb5, 0xad, 0xed, 0x36, 0xd3, 0x73, 0xec, 0x4c]);
enum IsScrollPatternAvailable_Property_GUID = GUID(0x3ebb7b4a, 0x828a, 0x4b57, [0x9d, 0x22, 0x2f, 0xea, 0x16, 0x32, 0xed, 0xd]);
enum IsScrollItemPatternAvailable_Property_GUID = GUID(0x1cad1a05, 0x927, 0x4b76, [0x97, 0xe1, 0xf, 0xcd, 0xb2, 0x9, 0xb9, 0x8a]);
enum IsSelectionItemPatternAvailable_Property_GUID = GUID(0x8becd62d, 0xbc3, 0x4109, [0xbe, 0xe2, 0x8e, 0x67, 0x15, 0x29, 0xe, 0x68]);
enum IsSelectionPatternAvailable_Property_GUID = GUID(0xf588acbe, 0xc769, 0x4838, [0x9a, 0x60, 0x26, 0x86, 0xdc, 0x11, 0x88, 0xc4]);
enum IsTablePatternAvailable_Property_GUID = GUID(0xcb83575f, 0x45c2, 0x4048, [0x9c, 0x76, 0x15, 0x97, 0x15, 0xa1, 0x39, 0xdf]);
enum IsTableItemPatternAvailable_Property_GUID = GUID(0xeb36b40d, 0x8ea4, 0x489b, [0xa0, 0x13, 0xe6, 0xd, 0x59, 0x51, 0xfe, 0x34]);
enum IsTextPatternAvailable_Property_GUID = GUID(0xfbe2d69d, 0xaff6, 0x4a45, [0x82, 0xe2, 0xfc, 0x92, 0xa8, 0x2f, 0x59, 0x17]);
enum IsTogglePatternAvailable_Property_GUID = GUID(0x78686d53, 0xfcd0, 0x4b83, [0x9b, 0x78, 0x58, 0x32, 0xce, 0x63, 0xbb, 0x5b]);
enum IsTransformPatternAvailable_Property_GUID = GUID(0xa7f78804, 0xd68b, 0x4077, [0xa5, 0xc6, 0x7a, 0x5e, 0xa1, 0xac, 0x31, 0xc5]);
enum IsValuePatternAvailable_Property_GUID = GUID(0xb5020a7, 0x2119, 0x473b, [0xbe, 0x37, 0x5c, 0xeb, 0x98, 0xbb, 0xfb, 0x22]);
enum IsWindowPatternAvailable_Property_GUID = GUID(0xe7a57bb1, 0x5888, 0x4155, [0x98, 0xdc, 0xb4, 0x22, 0xfd, 0x57, 0xf2, 0xbc]);
enum IsLegacyIAccessiblePatternAvailable_Property_GUID = GUID(0xd8ebd0c7, 0x929a, 0x4ee7, [0x8d, 0x3a, 0xd3, 0xd9, 0x44, 0x13, 0x2, 0x7b]);
enum IsItemContainerPatternAvailable_Property_GUID = GUID(0x624b5ca7, 0xfe40, 0x4957, [0xa0, 0x19, 0x20, 0xc4, 0xcf, 0x11, 0x92, 0xf]);
enum IsVirtualizedItemPatternAvailable_Property_GUID = GUID(0x302cb151, 0x2ac8, 0x45d6, [0x97, 0x7b, 0xd2, 0xb3, 0xa5, 0xa5, 0x3f, 0x20]);
enum IsSynchronizedInputPatternAvailable_Property_GUID = GUID(0x75d69cc5, 0xd2bf, 0x4943, [0x87, 0x6e, 0xb4, 0x5b, 0x62, 0xa6, 0xcc, 0x66]);
enum IsObjectModelPatternAvailable_Property_GUID = GUID(0x6b21d89b, 0x2841, 0x412f, [0x8e, 0xf2, 0x15, 0xca, 0x95, 0x23, 0x18, 0xba]);
enum IsAnnotationPatternAvailable_Property_GUID = GUID(0xb5b3238, 0x6d5c, 0x41b6, [0xbc, 0xc4, 0x5e, 0x80, 0x7f, 0x65, 0x51, 0xc4]);
enum IsTextPattern2Available_Property_GUID = GUID(0x41cf921d, 0xe3f1, 0x4b22, [0x9c, 0x81, 0xe1, 0xc3, 0xed, 0x33, 0x1c, 0x22]);
enum IsTextEditPatternAvailable_Property_GUID = GUID(0x7843425c, 0x8b32, 0x484c, [0x9a, 0xb5, 0xe3, 0x20, 0x5, 0x71, 0xff, 0xda]);
enum IsCustomNavigationPatternAvailable_Property_GUID = GUID(0x8f8e80d4, 0x2351, 0x48e0, [0x87, 0x4a, 0x54, 0xaa, 0x73, 0x13, 0x88, 0x9a]);
enum IsStylesPatternAvailable_Property_GUID = GUID(0x27f353d3, 0x459c, 0x4b59, [0xa4, 0x90, 0x50, 0x61, 0x1d, 0xac, 0xaf, 0xb5]);
enum IsSpreadsheetPatternAvailable_Property_GUID = GUID(0x6ff43732, 0xe4b4, 0x4555, [0x97, 0xbc, 0xec, 0xdb, 0xbc, 0x4d, 0x18, 0x88]);
enum IsSpreadsheetItemPatternAvailable_Property_GUID = GUID(0x9fe79b2a, 0x2f94, 0x43fd, [0x99, 0x6b, 0x54, 0x9e, 0x31, 0x6f, 0x4a, 0xcd]);
enum IsTransformPattern2Available_Property_GUID = GUID(0x25980b4b, 0xbe04, 0x4710, [0xab, 0x4a, 0xfd, 0xa3, 0x1d, 0xbd, 0x28, 0x95]);
enum IsTextChildPatternAvailable_Property_GUID = GUID(0x559e65df, 0x30ff, 0x43b5, [0xb5, 0xed, 0x5b, 0x28, 0x3b, 0x80, 0xc7, 0xe9]);
enum IsDragPatternAvailable_Property_GUID = GUID(0xe997a7b7, 0x1d39, 0x4ca7, [0xbe, 0xf, 0x27, 0x7f, 0xcf, 0x56, 0x5, 0xcc]);
enum IsDropTargetPatternAvailable_Property_GUID = GUID(0x686b62e, 0x8e19, 0x4aaf, [0x87, 0x3d, 0x38, 0x4f, 0x6d, 0x3b, 0x92, 0xbe]);
enum IsStructuredMarkupPatternAvailable_Property_GUID = GUID(0xb0d4c196, 0x2c0b, 0x489c, [0xb1, 0x65, 0xa4, 0x5, 0x92, 0x8c, 0x6f, 0x3d]);
enum IsPeripheral_Property_GUID = GUID(0xda758276, 0x7ed5, 0x49d4, [0x8e, 0x68, 0xec, 0xc9, 0xa2, 0xd3, 0x0, 0xdd]);
enum PositionInSet_Property_GUID = GUID(0x33d1dc54, 0x641e, 0x4d76, [0xa6, 0xb1, 0x13, 0xf3, 0x41, 0xc1, 0xf8, 0x96]);
enum SizeOfSet_Property_GUID = GUID(0x1600d33c, 0x3b9f, 0x4369, [0x94, 0x31, 0xaa, 0x29, 0x3f, 0x34, 0x4c, 0xf1]);
enum Level_Property_GUID = GUID(0x242ac529, 0xcd36, 0x400f, [0xaa, 0xd9, 0x78, 0x76, 0xef, 0x3a, 0xf6, 0x27]);
enum AnnotationTypes_Property_GUID = GUID(0x64b71f76, 0x53c4, 0x4696, [0xa2, 0x19, 0x20, 0xe9, 0x40, 0xc9, 0xa1, 0x76]);
enum AnnotationObjects_Property_GUID = GUID(0x310910c8, 0x7c6e, 0x4f20, [0xbe, 0xcd, 0x4a, 0xaf, 0x6d, 0x19, 0x11, 0x56]);
enum LandmarkType_Property_GUID = GUID(0x454045f2, 0x6f61, 0x49f7, [0xa4, 0xf8, 0xb5, 0xf0, 0xcf, 0x82, 0xda, 0x1e]);
enum LocalizedLandmarkType_Property_GUID = GUID(0x7ac81980, 0xeafb, 0x4fb2, [0xbf, 0x91, 0xf4, 0x85, 0xbe, 0xf5, 0xe8, 0xe1]);
enum FullDescription_Property_GUID = GUID(0xd4450ff, 0x6aef, 0x4f33, [0x95, 0xdd, 0x7b, 0xef, 0xa7, 0x2a, 0x43, 0x91]);
enum Value_Value_Property_GUID = GUID(0xe95f5e64, 0x269f, 0x4a85, [0xba, 0x99, 0x40, 0x92, 0xc3, 0xea, 0x29, 0x86]);
enum Value_IsReadOnly_Property_GUID = GUID(0xeb090f30, 0xe24c, 0x4799, [0xa7, 0x5, 0xd, 0x24, 0x7b, 0xc0, 0x37, 0xf8]);
enum RangeValue_Value_Property_GUID = GUID(0x131f5d98, 0xc50c, 0x489d, [0xab, 0xe5, 0xae, 0x22, 0x8, 0x98, 0xc5, 0xf7]);
enum RangeValue_IsReadOnly_Property_GUID = GUID(0x25fa1055, 0xdebf, 0x4373, [0xa7, 0x9e, 0x1f, 0x1a, 0x19, 0x8, 0xd3, 0xc4]);
enum RangeValue_Minimum_Property_GUID = GUID(0x78cbd3b2, 0x684d, 0x4860, [0xaf, 0x93, 0xd1, 0xf9, 0x5c, 0xb0, 0x22, 0xfd]);
enum RangeValue_Maximum_Property_GUID = GUID(0x19319914, 0xf979, 0x4b35, [0xa1, 0xa6, 0xd3, 0x7e, 0x5, 0x43, 0x34, 0x73]);
enum RangeValue_LargeChange_Property_GUID = GUID(0xa1f96325, 0x3a3d, 0x4b44, [0x8e, 0x1f, 0x4a, 0x46, 0xd9, 0x84, 0x40, 0x19]);
enum RangeValue_SmallChange_Property_GUID = GUID(0x81c2c457, 0x3941, 0x4107, [0x99, 0x75, 0x13, 0x97, 0x60, 0xf7, 0xc0, 0x72]);
enum Scroll_HorizontalScrollPercent_Property_GUID = GUID(0xc7c13c0e, 0xeb21, 0x47ff, [0xac, 0xc4, 0xb5, 0xa3, 0x35, 0xf, 0x51, 0x91]);
enum Scroll_HorizontalViewSize_Property_GUID = GUID(0x70c2e5d4, 0xfcb0, 0x4713, [0xa9, 0xaa, 0xaf, 0x92, 0xff, 0x79, 0xe4, 0xcd]);
enum Scroll_VerticalScrollPercent_Property_GUID = GUID(0x6c8d7099, 0xb2a8, 0x4948, [0xbf, 0xf7, 0x3c, 0xf9, 0x5, 0x8b, 0xfe, 0xfb]);
enum Scroll_VerticalViewSize_Property_GUID = GUID(0xde6a2e22, 0xd8c7, 0x40c5, [0x83, 0xba, 0xe5, 0xf6, 0x81, 0xd5, 0x31, 0x8]);
enum Scroll_HorizontallyScrollable_Property_GUID = GUID(0x8b925147, 0x28cd, 0x49ae, [0xbd, 0x63, 0xf4, 0x41, 0x18, 0xd2, 0xe7, 0x19]);
enum Scroll_VerticallyScrollable_Property_GUID = GUID(0x89164798, 0x68, 0x4315, [0xb8, 0x9a, 0x1e, 0x7c, 0xfb, 0xbc, 0x3d, 0xfc]);
enum Selection_Selection_Property_GUID = GUID(0xaa6dc2a2, 0xe2b, 0x4d38, [0x96, 0xd5, 0x34, 0xe4, 0x70, 0xb8, 0x18, 0x53]);
enum Selection_CanSelectMultiple_Property_GUID = GUID(0x49d73da5, 0xc883, 0x4500, [0x88, 0x3d, 0x8f, 0xcf, 0x8d, 0xaf, 0x6c, 0xbe]);
enum Selection_IsSelectionRequired_Property_GUID = GUID(0xb1ae4422, 0x63fe, 0x44e7, [0xa5, 0xa5, 0xa7, 0x38, 0xc8, 0x29, 0xb1, 0x9a]);
enum Grid_RowCount_Property_GUID = GUID(0x2a9505bf, 0xc2eb, 0x4fb6, [0xb3, 0x56, 0x82, 0x45, 0xae, 0x53, 0x70, 0x3e]);
enum Grid_ColumnCount_Property_GUID = GUID(0xfe96f375, 0x44aa, 0x4536, [0xac, 0x7a, 0x2a, 0x75, 0xd7, 0x1a, 0x3e, 0xfc]);
enum GridItem_Row_Property_GUID = GUID(0x6223972a, 0xc945, 0x4563, [0x93, 0x29, 0xfd, 0xc9, 0x74, 0xaf, 0x25, 0x53]);
enum GridItem_Column_Property_GUID = GUID(0xc774c15c, 0x62c0, 0x4519, [0x8b, 0xdc, 0x47, 0xbe, 0x57, 0x3c, 0x8a, 0xd5]);
enum GridItem_RowSpan_Property_GUID = GUID(0x4582291c, 0x466b, 0x4e93, [0x8e, 0x83, 0x3d, 0x17, 0x15, 0xec, 0xc, 0x5e]);
enum GridItem_ColumnSpan_Property_GUID = GUID(0x583ea3f5, 0x86d0, 0x4b08, [0xa6, 0xec, 0x2c, 0x54, 0x63, 0xff, 0xc1, 0x9]);
enum GridItem_Parent_Property_GUID = GUID(0x9d912252, 0xb97f, 0x4ecc, [0x85, 0x10, 0xea, 0xe, 0x33, 0x42, 0x7c, 0x72]);
enum Dock_DockPosition_Property_GUID = GUID(0x6d67f02e, 0xc0b0, 0x4b10, [0xb5, 0xb9, 0x18, 0xd6, 0xec, 0xf9, 0x87, 0x60]);
enum ExpandCollapse_ExpandCollapseState_Property_GUID = GUID(0x275a4c48, 0x85a7, 0x4f69, [0xab, 0xa0, 0xaf, 0x15, 0x76, 0x10, 0x0, 0x2b]);
enum MultipleView_CurrentView_Property_GUID = GUID(0x7a81a67a, 0xb94f, 0x4875, [0x91, 0x8b, 0x65, 0xc8, 0xd2, 0xf9, 0x98, 0xe5]);
enum MultipleView_SupportedViews_Property_GUID = GUID(0x8d5db9fd, 0xce3c, 0x4ae7, [0xb7, 0x88, 0x40, 0xa, 0x3c, 0x64, 0x55, 0x47]);
enum Window_CanMaximize_Property_GUID = GUID(0x64fff53f, 0x635d, 0x41c1, [0x95, 0xc, 0xcb, 0x5a, 0xdf, 0xbe, 0x28, 0xe3]);
enum Window_CanMinimize_Property_GUID = GUID(0xb73b4625, 0x5988, 0x4b97, [0xb4, 0xc2, 0xa6, 0xfe, 0x6e, 0x78, 0xc8, 0xc6]);
enum Window_WindowVisualState_Property_GUID = GUID(0x4ab7905f, 0xe860, 0x453e, [0xa3, 0xa, 0xf6, 0x43, 0x1e, 0x5d, 0xaa, 0xd5]);
enum Window_WindowInteractionState_Property_GUID = GUID(0x4fed26a4, 0x455, 0x4fa2, [0xb2, 0x1c, 0xc4, 0xda, 0x2d, 0xb1, 0xff, 0x9c]);
enum Window_IsModal_Property_GUID = GUID(0xff4e6892, 0x37b9, 0x4fca, [0x85, 0x32, 0xff, 0xe6, 0x74, 0xec, 0xfe, 0xed]);
enum Window_IsTopmost_Property_GUID = GUID(0xef7d85d3, 0x937, 0x4962, [0x92, 0x41, 0xb6, 0x23, 0x45, 0xf2, 0x40, 0x41]);
enum SelectionItem_IsSelected_Property_GUID = GUID(0xf122835f, 0xcd5f, 0x43df, [0xb7, 0x9d, 0x4b, 0x84, 0x9e, 0x9e, 0x60, 0x20]);
enum SelectionItem_SelectionContainer_Property_GUID = GUID(0xa4365b6e, 0x9c1e, 0x4b63, [0x8b, 0x53, 0xc2, 0x42, 0x1d, 0xd1, 0xe8, 0xfb]);
enum Table_RowHeaders_Property_GUID = GUID(0xd9e35b87, 0x6eb8, 0x4562, [0xaa, 0xc6, 0xa8, 0xa9, 0x7, 0x52, 0x36, 0xa8]);
enum Table_ColumnHeaders_Property_GUID = GUID(0xaff1d72b, 0x968d, 0x42b1, [0xb4, 0x59, 0x15, 0xb, 0x29, 0x9d, 0xa6, 0x64]);
enum Table_RowOrColumnMajor_Property_GUID = GUID(0x83be75c3, 0x29fe, 0x4a30, [0x85, 0xe1, 0x2a, 0x62, 0x77, 0xfd, 0x10, 0x6e]);
enum TableItem_RowHeaderItems_Property_GUID = GUID(0xb3f853a0, 0x574, 0x4cd8, [0xbc, 0xd7, 0xed, 0x59, 0x23, 0x57, 0x2d, 0x97]);
enum TableItem_ColumnHeaderItems_Property_GUID = GUID(0x967a56a3, 0x74b6, 0x431e, [0x8d, 0xe6, 0x99, 0xc4, 0x11, 0x3, 0x1c, 0x58]);
enum Toggle_ToggleState_Property_GUID = GUID(0xb23cdc52, 0x22c2, 0x4c6c, [0x9d, 0xed, 0xf5, 0xc4, 0x22, 0x47, 0x9e, 0xde]);
enum Transform_CanMove_Property_GUID = GUID(0x1b75824d, 0x208b, 0x4fdf, [0xbc, 0xcd, 0xf1, 0xf4, 0xe5, 0x74, 0x1f, 0x4f]);
enum Transform_CanResize_Property_GUID = GUID(0xbb98dca5, 0x4c1a, 0x41d4, [0xa4, 0xf6, 0xeb, 0xc1, 0x28, 0x64, 0x41, 0x80]);
enum Transform_CanRotate_Property_GUID = GUID(0x10079b48, 0x3849, 0x476f, [0xac, 0x96, 0x44, 0xa9, 0x5c, 0x84, 0x40, 0xd9]);
enum LegacyIAccessible_ChildId_Property_GUID = GUID(0x9a191b5d, 0x9ef2, 0x4787, [0xa4, 0x59, 0xdc, 0xde, 0x88, 0x5d, 0xd4, 0xe8]);
enum LegacyIAccessible_Name_Property_GUID = GUID(0xcaeb063d, 0x40ae, 0x4869, [0xaa, 0x5a, 0x1b, 0x8e, 0x5d, 0x66, 0x67, 0x39]);
enum LegacyIAccessible_Value_Property_GUID = GUID(0xb5c5b0b6, 0x8217, 0x4a77, [0x97, 0xa5, 0x19, 0xa, 0x85, 0xed, 0x1, 0x56]);
enum LegacyIAccessible_Description_Property_GUID = GUID(0x46448418, 0x7d70, 0x4ea9, [0x9d, 0x27, 0xb7, 0xe7, 0x75, 0xcf, 0x2a, 0xd7]);
enum LegacyIAccessible_Role_Property_GUID = GUID(0x6856e59f, 0xcbaf, 0x4e31, [0x93, 0xe8, 0xbc, 0xbf, 0x6f, 0x7e, 0x49, 0x1c]);
enum LegacyIAccessible_State_Property_GUID = GUID(0xdf985854, 0x2281, 0x4340, [0xab, 0x9c, 0xc6, 0xe, 0x2c, 0x58, 0x3, 0xf6]);
enum LegacyIAccessible_Help_Property_GUID = GUID(0x94402352, 0x161c, 0x4b77, [0xa9, 0x8d, 0xa8, 0x72, 0xcc, 0x33, 0x94, 0x7a]);
enum LegacyIAccessible_KeyboardShortcut_Property_GUID = GUID(0x8f6909ac, 0xb8, 0x4259, [0xa4, 0x1c, 0x96, 0x62, 0x66, 0xd4, 0x3a, 0x8a]);
enum LegacyIAccessible_Selection_Property_GUID = GUID(0x8aa8b1e0, 0x891, 0x40cc, [0x8b, 0x6, 0x90, 0xd7, 0xd4, 0x16, 0x62, 0x19]);
enum LegacyIAccessible_DefaultAction_Property_GUID = GUID(0x3b331729, 0xeaad, 0x4502, [0xb8, 0x5f, 0x92, 0x61, 0x56, 0x22, 0x91, 0x3c]);
enum Annotation_AnnotationTypeId_Property_GUID = GUID(0x20ae484f, 0x69ef, 0x4c48, [0x8f, 0x5b, 0xc4, 0x93, 0x8b, 0x20, 0x6a, 0xc7]);
enum Annotation_AnnotationTypeName_Property_GUID = GUID(0x9b818892, 0x5ac9, 0x4af9, [0xaa, 0x96, 0xf5, 0x8a, 0x77, 0xb0, 0x58, 0xe3]);
enum Annotation_Author_Property_GUID = GUID(0x7a528462, 0x9c5c, 0x4a03, [0xa9, 0x74, 0x8b, 0x30, 0x7a, 0x99, 0x37, 0xf2]);
enum Annotation_DateTime_Property_GUID = GUID(0x99b5ca5d, 0x1acf, 0x414b, [0xa4, 0xd0, 0x6b, 0x35, 0xb, 0x4, 0x75, 0x78]);
enum Annotation_Target_Property_GUID = GUID(0xb71b302d, 0x2104, 0x44ad, [0x9c, 0x5c, 0x9, 0x2b, 0x49, 0x7, 0xd7, 0xf]);
enum Styles_StyleId_Property_GUID = GUID(0xda82852f, 0x3817, 0x4233, [0x82, 0xaf, 0x2, 0x27, 0x9e, 0x72, 0xcc, 0x77]);
enum Styles_StyleName_Property_GUID = GUID(0x1c12b035, 0x5d1, 0x4f55, [0x9e, 0x8e, 0x14, 0x89, 0xf3, 0xff, 0x55, 0xd]);
enum Styles_FillColor_Property_GUID = GUID(0x63eff97a, 0xa1c5, 0x4b1d, [0x84, 0xeb, 0xb7, 0x65, 0xf2, 0xed, 0xd6, 0x32]);
enum Styles_FillPatternStyle_Property_GUID = GUID(0x81cf651f, 0x482b, 0x4451, [0xa3, 0xa, 0xe1, 0x54, 0x5e, 0x55, 0x4f, 0xb8]);
enum Styles_Shape_Property_GUID = GUID(0xc71a23f8, 0x778c, 0x400d, [0x84, 0x58, 0x3b, 0x54, 0x3e, 0x52, 0x69, 0x84]);
enum Styles_FillPatternColor_Property_GUID = GUID(0x939a59fe, 0x8fbd, 0x4e75, [0xa2, 0x71, 0xac, 0x45, 0x95, 0x19, 0x51, 0x63]);
enum Styles_ExtendedProperties_Property_GUID = GUID(0xf451cda0, 0xba0a, 0x4681, [0xb0, 0xb0, 0xd, 0xbd, 0xb5, 0x3e, 0x58, 0xf3]);
enum SpreadsheetItem_Formula_Property_GUID = GUID(0xe602e47d, 0x1b47, 0x4bea, [0x87, 0xcf, 0x3b, 0xb, 0xb, 0x5c, 0x15, 0xb6]);
enum SpreadsheetItem_AnnotationObjects_Property_GUID = GUID(0xa3194c38, 0xc9bc, 0x4604, [0x93, 0x96, 0xae, 0x3f, 0x9f, 0x45, 0x7f, 0x7b]);
enum SpreadsheetItem_AnnotationTypes_Property_GUID = GUID(0xc70c51d0, 0xd602, 0x4b45, [0xaf, 0xbc, 0xb4, 0x71, 0x2b, 0x96, 0xd7, 0x2b]);
enum Transform2_CanZoom_Property_GUID = GUID(0xf357e890, 0xa756, 0x4359, [0x9c, 0xa6, 0x86, 0x70, 0x2b, 0xf8, 0xf3, 0x81]);
enum LiveSetting_Property_GUID = GUID(0xc12bcd8e, 0x2a8e, 0x4950, [0x8a, 0xe7, 0x36, 0x25, 0x11, 0x1d, 0x58, 0xeb]);
enum Drag_IsGrabbed_Property_GUID = GUID(0x45f206f3, 0x75cc, 0x4cca, [0xa9, 0xb9, 0xfc, 0xdf, 0xb9, 0x82, 0xd8, 0xa2]);
enum Drag_GrabbedItems_Property_GUID = GUID(0x77c1562c, 0x7b86, 0x4b21, [0x9e, 0xd7, 0x3c, 0xef, 0xda, 0x6f, 0x4c, 0x43]);
enum Drag_DropEffect_Property_GUID = GUID(0x646f2779, 0x48d3, 0x4b23, [0x89, 0x2, 0x4b, 0xf1, 0x0, 0x0, 0x5d, 0xf3]);
enum Drag_DropEffects_Property_GUID = GUID(0xf5d61156, 0x7ce6, 0x49be, [0xa8, 0x36, 0x92, 0x69, 0xdc, 0xec, 0x92, 0xf]);
enum DropTarget_DropTargetEffect_Property_GUID = GUID(0x8bb75975, 0xa0ca, 0x4981, [0xb8, 0x18, 0x87, 0xfc, 0x66, 0xe9, 0x50, 0x9d]);
enum DropTarget_DropTargetEffects_Property_GUID = GUID(0xbc1dd4ed, 0xcb89, 0x45f1, [0xa5, 0x92, 0xe0, 0x3b, 0x8, 0xae, 0x79, 0xf]);
enum Transform2_ZoomLevel_Property_GUID = GUID(0xeee29f1a, 0xf4a2, 0x4b5b, [0xac, 0x65, 0x95, 0xcf, 0x93, 0x28, 0x33, 0x87]);
enum Transform2_ZoomMinimum_Property_GUID = GUID(0x742ccc16, 0x4ad1, 0x4e07, [0x96, 0xfe, 0xb1, 0x22, 0xc6, 0xe6, 0xb2, 0x2b]);
enum Transform2_ZoomMaximum_Property_GUID = GUID(0x42ab6b77, 0xceb0, 0x4eca, [0xb8, 0x2a, 0x6c, 0xfa, 0x5f, 0xa1, 0xfc, 0x8]);
enum FlowsFrom_Property_GUID = GUID(0x5c6844f, 0x19de, 0x48f8, [0x95, 0xfa, 0x88, 0xd, 0x5b, 0xf, 0xd6, 0x15]);
enum FillColor_Property_GUID = GUID(0x6e0ec4d0, 0xe2a8, 0x4a56, [0x9d, 0xe7, 0x95, 0x33, 0x89, 0x93, 0x3b, 0x39]);
enum OutlineColor_Property_GUID = GUID(0xc395d6c0, 0x4b55, 0x4762, [0xa0, 0x73, 0xfd, 0x30, 0x3a, 0x63, 0x4f, 0x52]);
enum FillType_Property_GUID = GUID(0xc6fc74e4, 0x8cb9, 0x429c, [0xa9, 0xe1, 0x9b, 0xc4, 0xac, 0x37, 0x2b, 0x62]);
enum VisualEffects_Property_GUID = GUID(0xe61a8565, 0xaad9, 0x46d7, [0x9e, 0x70, 0x4e, 0x8a, 0x84, 0x20, 0xd4, 0x20]);
enum OutlineThickness_Property_GUID = GUID(0x13e67cc7, 0xdac2, 0x4888, [0xbd, 0xd3, 0x37, 0x5c, 0x62, 0xfa, 0x96, 0x18]);
enum CenterPoint_Property_GUID = GUID(0xcb00c08, 0x540c, 0x4edb, [0x94, 0x45, 0x26, 0x35, 0x9e, 0xa6, 0x97, 0x85]);
enum Rotation_Property_GUID = GUID(0x767cdc7d, 0xaec0, 0x4110, [0xad, 0x32, 0x30, 0xed, 0xd4, 0x3, 0x49, 0x2e]);
enum Size_Property_GUID = GUID(0x2b5f761d, 0xf885, 0x4404, [0x97, 0x3f, 0x9b, 0x1d, 0x98, 0xe3, 0x6d, 0x8f]);
enum ToolTipOpened_Event_GUID = GUID(0x3f4b97ff, 0x2edc, 0x451d, [0xbc, 0xa4, 0x95, 0xa3, 0x18, 0x8d, 0x5b, 0x3]);
enum ToolTipClosed_Event_GUID = GUID(0x276d71ef, 0x24a9, 0x49b6, [0x8e, 0x97, 0xda, 0x98, 0xb4, 0x1, 0xbb, 0xcd]);
enum StructureChanged_Event_GUID = GUID(0x59977961, 0x3edd, 0x4b11, [0xb1, 0x3b, 0x67, 0x6b, 0x2a, 0x2a, 0x6c, 0xa9]);
enum MenuOpened_Event_GUID = GUID(0xebe2e945, 0x66ca, 0x4ed1, [0x9f, 0xf8, 0x2a, 0xd7, 0xdf, 0xa, 0x1b, 0x8]);
enum AutomationPropertyChanged_Event_GUID = GUID(0x2527fba1, 0x8d7a, 0x4630, [0xa4, 0xcc, 0xe6, 0x63, 0x15, 0x94, 0x2f, 0x52]);
enum AutomationFocusChanged_Event_GUID = GUID(0xb68a1f17, 0xf60d, 0x41a7, [0xa3, 0xcc, 0xb0, 0x52, 0x92, 0x15, 0x5f, 0xe0]);
enum ActiveTextPositionChanged_Event_GUID = GUID(0xa5c09e9c, 0xc77d, 0x4f25, [0xb4, 0x91, 0xe5, 0xbb, 0x70, 0x17, 0xcb, 0xd4]);
enum AsyncContentLoaded_Event_GUID = GUID(0x5fdee11c, 0xd2fa, 0x4fb9, [0x90, 0x4e, 0x5c, 0xbe, 0xe8, 0x94, 0xd5, 0xef]);
enum MenuClosed_Event_GUID = GUID(0x3cf1266e, 0x1582, 0x4041, [0xac, 0xd7, 0x88, 0xa3, 0x5a, 0x96, 0x52, 0x97]);
enum LayoutInvalidated_Event_GUID = GUID(0xed7d6544, 0xa6bd, 0x4595, [0x9b, 0xae, 0x3d, 0x28, 0x94, 0x6c, 0xc7, 0x15]);
enum Invoke_Invoked_Event_GUID = GUID(0xdfd699f0, 0xc915, 0x49dd, [0xb4, 0x22, 0xdd, 0xe7, 0x85, 0xc3, 0xd2, 0x4b]);
enum SelectionItem_ElementAddedToSelectionEvent_Event_GUID = GUID(0x3c822dd1, 0xc407, 0x4dba, [0x91, 0xdd, 0x79, 0xd4, 0xae, 0xd0, 0xae, 0xc6]);
enum SelectionItem_ElementRemovedFromSelectionEvent_Event_GUID = GUID(0x97fa8a9, 0x7079, 0x41af, [0x8b, 0x9c, 0x9, 0x34, 0xd8, 0x30, 0x5e, 0x5c]);
enum SelectionItem_ElementSelectedEvent_Event_GUID = GUID(0xb9c7dbfb, 0x4ebe, 0x4532, [0xaa, 0xf4, 0x0, 0x8c, 0xf6, 0x47, 0x23, 0x3c]);
enum Selection_InvalidatedEvent_Event_GUID = GUID(0xcac14904, 0x16b4, 0x4b53, [0x8e, 0x47, 0x4c, 0xb1, 0xdf, 0x26, 0x7b, 0xb7]);
enum Text_TextSelectionChangedEvent_Event_GUID = GUID(0x918edaa1, 0x71b3, 0x49ae, [0x97, 0x41, 0x79, 0xbe, 0xb8, 0xd3, 0x58, 0xf3]);
enum Text_TextChangedEvent_Event_GUID = GUID(0x4a342082, 0xf483, 0x48c4, [0xac, 0x11, 0xa8, 0x4b, 0x43, 0x5e, 0x2a, 0x84]);
enum Window_WindowOpened_Event_GUID = GUID(0xd3e81d06, 0xde45, 0x4f2f, [0x96, 0x33, 0xde, 0x9e, 0x2, 0xfb, 0x65, 0xaf]);
enum Window_WindowClosed_Event_GUID = GUID(0xedf141f8, 0xfa67, 0x4e22, [0xbb, 0xf7, 0x94, 0x4e, 0x5, 0x73, 0x5e, 0xe2]);
enum MenuModeStart_Event_GUID = GUID(0x18d7c631, 0x166a, 0x4ac9, [0xae, 0x3b, 0xef, 0x4b, 0x54, 0x20, 0xe6, 0x81]);
enum MenuModeEnd_Event_GUID = GUID(0x9ecd4c9f, 0x80dd, 0x47b8, [0x82, 0x67, 0x5a, 0xec, 0x6, 0xbb, 0x2c, 0xff]);
enum InputReachedTarget_Event_GUID = GUID(0x93ed549a, 0x549, 0x40f0, [0xbe, 0xdb, 0x28, 0xe4, 0x4f, 0x7d, 0xe2, 0xa3]);
enum InputReachedOtherElement_Event_GUID = GUID(0xed201d8a, 0x4e6c, 0x415e, [0xa8, 0x74, 0x24, 0x60, 0xc9, 0xb6, 0x6b, 0xa8]);
enum InputDiscarded_Event_GUID = GUID(0x7f36c367, 0x7b18, 0x417c, [0x97, 0xe3, 0x9d, 0x58, 0xdd, 0xc9, 0x44, 0xab]);
enum SystemAlert_Event_GUID = GUID(0xd271545d, 0x7a3a, 0x47a7, [0x84, 0x74, 0x81, 0xd2, 0x9a, 0x24, 0x51, 0xc9]);
enum LiveRegionChanged_Event_GUID = GUID(0x102d5e90, 0xe6a9, 0x41b6, [0xb1, 0xc5, 0xa9, 0xb1, 0x92, 0x9d, 0x95, 0x10]);
enum HostedFragmentRootsInvalidated_Event_GUID = GUID(0xe6bdb03e, 0x921, 0x4ec5, [0x8d, 0xcf, 0xea, 0xe8, 0x77, 0xb0, 0x42, 0x6b]);
enum Drag_DragStart_Event_GUID = GUID(0x883a480b, 0x3aa9, 0x429d, [0x95, 0xe4, 0xd9, 0xc8, 0xd0, 0x11, 0xf0, 0xdd]);
enum Drag_DragCancel_Event_GUID = GUID(0xc3ede6fa, 0x3451, 0x4e0f, [0x9e, 0x71, 0xdf, 0x9c, 0x28, 0xa, 0x46, 0x57]);
enum Drag_DragComplete_Event_GUID = GUID(0x38e96188, 0xef1f, 0x463e, [0x91, 0xca, 0x3a, 0x77, 0x92, 0xc2, 0x9c, 0xaf]);
enum DropTarget_DragEnter_Event_GUID = GUID(0xaad9319b, 0x32c, 0x4a88, [0x96, 0x1d, 0x1c, 0xf5, 0x79, 0x58, 0x1e, 0x34]);
enum DropTarget_DragLeave_Event_GUID = GUID(0xf82eb15, 0x24a2, 0x4988, [0x92, 0x17, 0xde, 0x16, 0x2a, 0xee, 0x27, 0x2b]);
enum DropTarget_Dropped_Event_GUID = GUID(0x622cead8, 0x1edb, 0x4a3d, [0xab, 0xbc, 0xbe, 0x22, 0x11, 0xff, 0x68, 0xb5]);
enum StructuredMarkup_CompositionComplete_Event_GUID = GUID(0xc48a3c17, 0x677a, 0x4047, [0xa6, 0x8d, 0xfc, 0x12, 0x57, 0x52, 0x8a, 0xef]);
enum StructuredMarkup_Deleted_Event_GUID = GUID(0xf9d0a020, 0xe1c1, 0x4ecf, [0xb9, 0xaa, 0x52, 0xef, 0xde, 0x7e, 0x41, 0xe1]);
enum StructuredMarkup_SelectionChanged_Event_GUID = GUID(0xa7c815f7, 0xff9f, 0x41c7, [0xa3, 0xa7, 0xab, 0x6c, 0xbf, 0xdb, 0x49, 0x3]);
enum Invoke_Pattern_GUID = GUID(0xd976c2fc, 0x66ea, 0x4a6e, [0xb2, 0x8f, 0xc2, 0x4c, 0x75, 0x46, 0xad, 0x37]);
enum Selection_Pattern_GUID = GUID(0x66e3b7e8, 0xd821, 0x4d25, [0x87, 0x61, 0x43, 0x5d, 0x2c, 0x8b, 0x25, 0x3f]);
enum Value_Pattern_GUID = GUID(0x17faad9e, 0xc877, 0x475b, [0xb9, 0x33, 0x77, 0x33, 0x27, 0x79, 0xb6, 0x37]);
enum RangeValue_Pattern_GUID = GUID(0x18b00d87, 0xb1c9, 0x476a, [0xbf, 0xbd, 0x5f, 0xb, 0xdb, 0x92, 0x6f, 0x63]);
enum Scroll_Pattern_GUID = GUID(0x895fa4b4, 0x759d, 0x4c50, [0x8e, 0x15, 0x3, 0x46, 0x6, 0x72, 0x0, 0x3c]);
enum ExpandCollapse_Pattern_GUID = GUID(0xae05efa2, 0xf9d1, 0x428a, [0x83, 0x4c, 0x53, 0xa5, 0xc5, 0x2f, 0x9b, 0x8b]);
enum Grid_Pattern_GUID = GUID(0x260a2ccb, 0x93a8, 0x4e44, [0xa4, 0xc1, 0x3d, 0xf3, 0x97, 0xf2, 0xb0, 0x2b]);
enum GridItem_Pattern_GUID = GUID(0xf2d5c877, 0xa462, 0x4957, [0xa2, 0xa5, 0x2c, 0x96, 0xb3, 0x3, 0xbc, 0x63]);
enum MultipleView_Pattern_GUID = GUID(0x547a6ae4, 0x113f, 0x47c4, [0x85, 0xf, 0xdb, 0x4d, 0xfa, 0x46, 0x6b, 0x1d]);
enum Window_Pattern_GUID = GUID(0x27901735, 0xc760, 0x4994, [0xad, 0x11, 0x59, 0x19, 0xe6, 0x6, 0xb1, 0x10]);
enum SelectionItem_Pattern_GUID = GUID(0x9bc64eeb, 0x87c7, 0x4b28, [0x94, 0xbb, 0x4d, 0x9f, 0xa4, 0x37, 0xb6, 0xef]);
enum Dock_Pattern_GUID = GUID(0x9cbaa846, 0x83c8, 0x428d, [0x82, 0x7f, 0x7e, 0x60, 0x63, 0xfe, 0x6, 0x20]);
enum Table_Pattern_GUID = GUID(0xc415218e, 0xa028, 0x461e, [0xaa, 0x92, 0x8f, 0x92, 0x5c, 0xf7, 0x93, 0x51]);
enum TableItem_Pattern_GUID = GUID(0xdf1343bd, 0x1888, 0x4a29, [0xa5, 0xc, 0xb9, 0x2e, 0x6d, 0xe3, 0x7f, 0x6f]);
enum Text_Pattern_GUID = GUID(0x8615f05d, 0x7de5, 0x44fd, [0xa6, 0x79, 0x2c, 0xa4, 0xb4, 0x60, 0x33, 0xa8]);
enum Toggle_Pattern_GUID = GUID(0xb419760, 0xe2f4, 0x43ff, [0x8c, 0x5f, 0x94, 0x57, 0xc8, 0x2b, 0x56, 0xe9]);
enum Transform_Pattern_GUID = GUID(0x24b46fdb, 0x587e, 0x49f1, [0x9c, 0x4a, 0xd8, 0xe9, 0x8b, 0x66, 0x4b, 0x7b]);
enum ScrollItem_Pattern_GUID = GUID(0x4591d005, 0xa803, 0x4d5c, [0xb4, 0xd5, 0x8d, 0x28, 0x0, 0xf9, 0x6, 0xa7]);
enum LegacyIAccessible_Pattern_GUID = GUID(0x54cc0a9f, 0x3395, 0x48af, [0xba, 0x8d, 0x73, 0xf8, 0x56, 0x90, 0xf3, 0xe0]);
enum ItemContainer_Pattern_GUID = GUID(0x3d13da0f, 0x8b9a, 0x4a99, [0x85, 0xfa, 0xc5, 0xc9, 0xa6, 0x9f, 0x1e, 0xd4]);
enum VirtualizedItem_Pattern_GUID = GUID(0xf510173e, 0x2e71, 0x45e9, [0xa6, 0xe5, 0x62, 0xf6, 0xed, 0x82, 0x89, 0xd5]);
enum SynchronizedInput_Pattern_GUID = GUID(0x5c288a6, 0xc47b, 0x488b, [0xb6, 0x53, 0x33, 0x97, 0x7a, 0x55, 0x1b, 0x8b]);
enum ObjectModel_Pattern_GUID = GUID(0x3e04acfe, 0x8fc, 0x47ec, [0x96, 0xbc, 0x35, 0x3f, 0xa3, 0xb3, 0x4a, 0xa7]);
enum Annotation_Pattern_GUID = GUID(0xf6c72ad7, 0x356c, 0x4850, [0x92, 0x91, 0x31, 0x6f, 0x60, 0x8a, 0x8c, 0x84]);
enum Text_Pattern2_GUID = GUID(0x498479a2, 0x5b22, 0x448d, [0xb6, 0xe4, 0x64, 0x74, 0x90, 0x86, 0x6, 0x98]);
enum TextEdit_Pattern_GUID = GUID(0x69f3ff89, 0x5af9, 0x4c75, [0x93, 0x40, 0xf2, 0xde, 0x29, 0x2e, 0x45, 0x91]);
enum CustomNavigation_Pattern_GUID = GUID(0xafea938a, 0x621e, 0x4054, [0xbb, 0x2c, 0x2f, 0x46, 0x11, 0x4d, 0xac, 0x3f]);
enum Styles_Pattern_GUID = GUID(0x1ae62655, 0xda72, 0x4d60, [0xa1, 0x53, 0xe5, 0xaa, 0x69, 0x88, 0xe3, 0xbf]);
enum Spreadsheet_Pattern_GUID = GUID(0x6a5b24c9, 0x9d1e, 0x4b85, [0x9e, 0x44, 0xc0, 0x2e, 0x31, 0x69, 0xb1, 0xb]);
enum SpreadsheetItem_Pattern_GUID = GUID(0x32cf83ff, 0xf1a8, 0x4a8c, [0x86, 0x58, 0xd4, 0x7b, 0xa7, 0x4e, 0x20, 0xba]);
enum Tranform_Pattern2_GUID = GUID(0x8afcfd07, 0xa369, 0x44de, [0x98, 0x8b, 0x2f, 0x7f, 0xf4, 0x9f, 0xb8, 0xa8]);
enum TextChild_Pattern_GUID = GUID(0x7533cab7, 0x3bfe, 0x41ef, [0x9e, 0x85, 0xe2, 0x63, 0x8c, 0xbe, 0x16, 0x9e]);
enum Drag_Pattern_GUID = GUID(0xc0bee21f, 0xccb3, 0x4fed, [0x99, 0x5b, 0x11, 0x4f, 0x6e, 0x3d, 0x27, 0x28]);
enum DropTarget_Pattern_GUID = GUID(0xbcbec56, 0xbd34, 0x4b7b, [0x9f, 0xd5, 0x26, 0x59, 0x90, 0x5e, 0xa3, 0xdc]);
enum StructuredMarkup_Pattern_GUID = GUID(0xabbd0878, 0x8665, 0x4f5c, [0x94, 0xfc, 0x36, 0xe7, 0xd8, 0xbb, 0x70, 0x6b]);
enum Button_Control_GUID = GUID(0x5a78e369, 0xc6a1, 0x4f33, [0xa9, 0xd7, 0x79, 0xf2, 0xd, 0xc, 0x78, 0x8e]);
enum Calendar_Control_GUID = GUID(0x8913eb88, 0xe5, 0x46bc, [0x8e, 0x4e, 0x14, 0xa7, 0x86, 0xe1, 0x65, 0xa1]);
enum CheckBox_Control_GUID = GUID(0xfb50f922, 0xa3db, 0x49c0, [0x8b, 0xc3, 0x6, 0xda, 0xd5, 0x57, 0x78, 0xe2]);
enum ComboBox_Control_GUID = GUID(0x54cb426c, 0x2f33, 0x4fff, [0xaa, 0xa1, 0xae, 0xf6, 0xd, 0xac, 0x5d, 0xeb]);
enum Edit_Control_GUID = GUID(0x6504a5c8, 0x2c86, 0x4f87, [0xae, 0x7b, 0x1a, 0xbd, 0xdc, 0x81, 0xc, 0xf9]);
enum Hyperlink_Control_GUID = GUID(0x8a56022c, 0xb00d, 0x4d15, [0x8f, 0xf0, 0x5b, 0x6b, 0x26, 0x6e, 0x5e, 0x2]);
enum Image_Control_GUID = GUID(0x2d3736e4, 0x6b16, 0x4c57, [0xa9, 0x62, 0xf9, 0x32, 0x60, 0xa7, 0x52, 0x43]);
enum ListItem_Control_GUID = GUID(0x7b3717f2, 0x44d1, 0x4a58, [0x98, 0xa8, 0xf1, 0x2a, 0x9b, 0x8f, 0x78, 0xe2]);
enum List_Control_GUID = GUID(0x9b149ee1, 0x7cca, 0x4cfc, [0x9a, 0xf1, 0xca, 0xc7, 0xbd, 0xdd, 0x30, 0x31]);
enum Menu_Control_GUID = GUID(0x2e9b1440, 0xea8, 0x41fd, [0xb3, 0x74, 0xc1, 0xea, 0x6f, 0x50, 0x3c, 0xd1]);
enum MenuBar_Control_GUID = GUID(0xcc384250, 0xe7b, 0x4ae8, [0x95, 0xae, 0xa0, 0x8f, 0x26, 0x1b, 0x52, 0xee]);
enum MenuItem_Control_GUID = GUID(0xf45225d3, 0xd0a0, 0x49d8, [0x98, 0x34, 0x9a, 0x0, 0xd, 0x2a, 0xed, 0xdc]);
enum ProgressBar_Control_GUID = GUID(0x228c9f86, 0xc36c, 0x47bb, [0x9f, 0xb6, 0xa5, 0x83, 0x4b, 0xfc, 0x53, 0xa4]);
enum RadioButton_Control_GUID = GUID(0x3bdb49db, 0xfe2c, 0x4483, [0xb3, 0xe1, 0xe5, 0x7f, 0x21, 0x94, 0x40, 0xc6]);
enum ScrollBar_Control_GUID = GUID(0xdaf34b36, 0x5065, 0x4946, [0xb2, 0x2f, 0x92, 0x59, 0x5f, 0xc0, 0x75, 0x1a]);
enum Slider_Control_GUID = GUID(0xb033c24b, 0x3b35, 0x4cea, [0xb6, 0x9, 0x76, 0x36, 0x82, 0xfa, 0x66, 0xb]);
enum Spinner_Control_GUID = GUID(0x60cc4b38, 0x3cb1, 0x4161, [0xb4, 0x42, 0xc6, 0xb7, 0x26, 0xc1, 0x78, 0x25]);
enum StatusBar_Control_GUID = GUID(0xd45e7d1b, 0x5873, 0x475f, [0x95, 0xa4, 0x4, 0x33, 0xe1, 0xf1, 0xb0, 0xa]);
enum Tab_Control_GUID = GUID(0x38cd1f2d, 0x337a, 0x4bd2, [0xa5, 0xe3, 0xad, 0xb4, 0x69, 0xe3, 0xb, 0xd3]);
enum TabItem_Control_GUID = GUID(0x2c6a634f, 0x921b, 0x4e6e, [0xb2, 0x6e, 0x8, 0xfc, 0xb0, 0x79, 0x8f, 0x4c]);
enum Text_Control_GUID = GUID(0xae9772dc, 0xd331, 0x4f09, [0xbe, 0x20, 0x7e, 0x6d, 0xfa, 0xf0, 0x7b, 0xa]);
enum ToolBar_Control_GUID = GUID(0x8f06b751, 0xe182, 0x4e98, [0x88, 0x93, 0x22, 0x84, 0x54, 0x3a, 0x7d, 0xce]);
enum ToolTip_Control_GUID = GUID(0x5ddc6d1, 0x2137, 0x4768, [0x98, 0xea, 0x73, 0xf5, 0x2f, 0x71, 0x34, 0xf3]);
enum Tree_Control_GUID = GUID(0x7561349c, 0xd241, 0x43f4, [0x99, 0x8, 0xb5, 0xf0, 0x91, 0xbe, 0xe6, 0x11]);
enum TreeItem_Control_GUID = GUID(0x62c9feb9, 0x8ffc, 0x4878, [0xa3, 0xa4, 0x96, 0xb0, 0x30, 0x31, 0x5c, 0x18]);
enum Custom_Control_GUID = GUID(0xf29ea0c3, 0xadb7, 0x430a, [0xba, 0x90, 0xe5, 0x2c, 0x73, 0x13, 0xe6, 0xed]);
enum Group_Control_GUID = GUID(0xad50aa1c, 0xe8c8, 0x4774, [0xae, 0x1b, 0xdd, 0x86, 0xdf, 0xb, 0x3b, 0xdc]);
enum Thumb_Control_GUID = GUID(0x701ca877, 0xe310, 0x4dd6, [0xb6, 0x44, 0x79, 0x7e, 0x4f, 0xae, 0xa2, 0x13]);
enum DataGrid_Control_GUID = GUID(0x84b783af, 0xd103, 0x4b0a, [0x84, 0x15, 0xe7, 0x39, 0x42, 0x41, 0xf, 0x4b]);
enum DataItem_Control_GUID = GUID(0xa0177842, 0xd94f, 0x42a5, [0x81, 0x4b, 0x60, 0x68, 0xad, 0xdc, 0x8d, 0xa5]);
enum Document_Control_GUID = GUID(0x3cd6bb6f, 0x6f08, 0x4562, [0xb2, 0x29, 0xe4, 0xe2, 0xfc, 0x7a, 0x9e, 0xb4]);
enum SplitButton_Control_GUID = GUID(0x7011f01f, 0x4ace, 0x4901, [0xb4, 0x61, 0x92, 0xa, 0x6f, 0x1c, 0xa6, 0x50]);
enum Window_Control_GUID = GUID(0xe13a7242, 0xf462, 0x4f4d, [0xae, 0xc1, 0x53, 0xb2, 0x8d, 0x6c, 0x32, 0x90]);
enum Pane_Control_GUID = GUID(0x5c2b3f5b, 0x9182, 0x42a3, [0x8d, 0xec, 0x8c, 0x4, 0xc1, 0xee, 0x63, 0x4d]);
enum Header_Control_GUID = GUID(0x5b90cbce, 0x78fb, 0x4614, [0x82, 0xb6, 0x55, 0x4d, 0x74, 0x71, 0x8e, 0x67]);
enum HeaderItem_Control_GUID = GUID(0xe6bc12cb, 0x7c8e, 0x49cf, [0xb1, 0x68, 0x4a, 0x93, 0xa3, 0x2b, 0xeb, 0xb0]);
enum Table_Control_GUID = GUID(0x773bfa0e, 0x5bc4, 0x4deb, [0x92, 0x1b, 0xde, 0x7b, 0x32, 0x6, 0x22, 0x9e]);
enum TitleBar_Control_GUID = GUID(0x98aa55bf, 0x3bb0, 0x4b65, [0x83, 0x6e, 0x2e, 0xa3, 0xd, 0xbc, 0x17, 0x1f]);
enum Separator_Control_GUID = GUID(0x8767eba3, 0x2a63, 0x4ab0, [0xac, 0x8d, 0xaa, 0x50, 0xe2, 0x3d, 0xe9, 0x78]);
enum SemanticZoom_Control_GUID = GUID(0x5fd34a43, 0x61e, 0x42c8, [0xb5, 0x89, 0x9d, 0xcc, 0xf7, 0x4b, 0xc4, 0x3a]);
enum AppBar_Control_GUID = GUID(0x6114908d, 0xcc02, 0x4d37, [0x87, 0x5b, 0xb5, 0x30, 0xc7, 0x13, 0x95, 0x54]);
enum Text_AnimationStyle_Attribute_GUID = GUID(0x628209f0, 0x7c9a, 0x4d57, [0xbe, 0x64, 0x1f, 0x18, 0x36, 0x57, 0x1f, 0xf5]);
enum Text_BackgroundColor_Attribute_GUID = GUID(0xfdc49a07, 0x583d, 0x4f17, [0xad, 0x27, 0x77, 0xfc, 0x83, 0x2a, 0x3c, 0xb]);
enum Text_BulletStyle_Attribute_GUID = GUID(0xc1097c90, 0xd5c4, 0x4237, [0x97, 0x81, 0x3b, 0xec, 0x8b, 0xa5, 0x4e, 0x48]);
enum Text_CapStyle_Attribute_GUID = GUID(0xfb059c50, 0x92cc, 0x49a5, [0xba, 0x8f, 0xa, 0xa8, 0x72, 0xbb, 0xa2, 0xf3]);
enum Text_Culture_Attribute_GUID = GUID(0xc2025af9, 0xa42d, 0x4ced, [0xa1, 0xfb, 0xc6, 0x74, 0x63, 0x15, 0x22, 0x2e]);
enum Text_FontName_Attribute_GUID = GUID(0x64e63ba8, 0xf2e5, 0x476e, [0xa4, 0x77, 0x17, 0x34, 0xfe, 0xaa, 0xf7, 0x26]);
enum Text_FontSize_Attribute_GUID = GUID(0xdc5eeeff, 0x506, 0x4673, [0x93, 0xf2, 0x37, 0x7e, 0x4a, 0x8e, 0x1, 0xf1]);
enum Text_FontWeight_Attribute_GUID = GUID(0x6fc02359, 0xb316, 0x4f5f, [0xb4, 0x1, 0xf1, 0xce, 0x55, 0x74, 0x18, 0x53]);
enum Text_ForegroundColor_Attribute_GUID = GUID(0x72d1c95d, 0x5e60, 0x471a, [0x96, 0xb1, 0x6c, 0x1b, 0x3b, 0x77, 0xa4, 0x36]);
enum Text_HorizontalTextAlignment_Attribute_GUID = GUID(0x4ea6161, 0xfba3, 0x477a, [0x95, 0x2a, 0xbb, 0x32, 0x6d, 0x2, 0x6a, 0x5b]);
enum Text_IndentationFirstLine_Attribute_GUID = GUID(0x206f9ad5, 0xc1d3, 0x424a, [0x81, 0x82, 0x6d, 0xa9, 0xa7, 0xf3, 0xd6, 0x32]);
enum Text_IndentationLeading_Attribute_GUID = GUID(0x5cf66bac, 0x2d45, 0x4a4b, [0xb6, 0xc9, 0xf7, 0x22, 0x1d, 0x28, 0x15, 0xb0]);
enum Text_IndentationTrailing_Attribute_GUID = GUID(0x97ff6c0f, 0x1ce4, 0x408a, [0xb6, 0x7b, 0x94, 0xd8, 0x3e, 0xb6, 0x9b, 0xf2]);
enum Text_IsHidden_Attribute_GUID = GUID(0x360182fb, 0xbdd7, 0x47f6, [0xab, 0x69, 0x19, 0xe3, 0x3f, 0x8a, 0x33, 0x44]);
enum Text_IsItalic_Attribute_GUID = GUID(0xfce12a56, 0x1336, 0x4a34, [0x96, 0x63, 0x1b, 0xab, 0x47, 0x23, 0x93, 0x20]);
enum Text_IsReadOnly_Attribute_GUID = GUID(0xa738156b, 0xca3e, 0x495e, [0x95, 0x14, 0x83, 0x3c, 0x44, 0xf, 0xeb, 0x11]);
enum Text_IsSubscript_Attribute_GUID = GUID(0xf0ead858, 0x8f53, 0x413c, [0x87, 0x3f, 0x1a, 0x7d, 0x7f, 0x5e, 0xd, 0xe4]);
enum Text_IsSuperscript_Attribute_GUID = GUID(0xda706ee4, 0xb3aa, 0x4645, [0xa4, 0x1f, 0xcd, 0x25, 0x15, 0x7d, 0xea, 0x76]);
enum Text_MarginBottom_Attribute_GUID = GUID(0x7ee593c4, 0x72b4, 0x4cac, [0x92, 0x71, 0x3e, 0xd2, 0x4b, 0xe, 0x4d, 0x42]);
enum Text_MarginLeading_Attribute_GUID = GUID(0x9e9242d0, 0x5ed0, 0x4900, [0x8e, 0x8a, 0xee, 0xcc, 0x3, 0x83, 0x5a, 0xfc]);
enum Text_MarginTop_Attribute_GUID = GUID(0x683d936f, 0xc9b9, 0x4a9a, [0xb3, 0xd9, 0xd2, 0xd, 0x33, 0x31, 0x1e, 0x2a]);
enum Text_MarginTrailing_Attribute_GUID = GUID(0xaf522f98, 0x999d, 0x40af, [0xa5, 0xb2, 0x1, 0x69, 0xd0, 0x34, 0x20, 0x2]);
enum Text_OutlineStyles_Attribute_GUID = GUID(0x5b675b27, 0xdb89, 0x46fe, [0x97, 0xc, 0x61, 0x4d, 0x52, 0x3b, 0xb9, 0x7d]);
enum Text_OverlineColor_Attribute_GUID = GUID(0x83ab383a, 0xfd43, 0x40da, [0xab, 0x3e, 0xec, 0xf8, 0x16, 0x5c, 0xbb, 0x6d]);
enum Text_OverlineStyle_Attribute_GUID = GUID(0xa234d66, 0x617e, 0x427f, [0x87, 0x1d, 0xe1, 0xff, 0x1e, 0xc, 0x21, 0x3f]);
enum Text_StrikethroughColor_Attribute_GUID = GUID(0xbfe15a18, 0x8c41, 0x4c5a, [0x9a, 0xb, 0x4, 0xaf, 0xe, 0x7, 0xf4, 0x87]);
enum Text_StrikethroughStyle_Attribute_GUID = GUID(0x72913ef1, 0xda00, 0x4f01, [0x89, 0x9c, 0xac, 0x5a, 0x85, 0x77, 0xa3, 0x7]);
enum Text_Tabs_Attribute_GUID = GUID(0x2e68d00b, 0x92fe, 0x42d8, [0x89, 0x9a, 0xa7, 0x84, 0xaa, 0x44, 0x54, 0xa1]);
enum Text_TextFlowDirections_Attribute_GUID = GUID(0x8bdf8739, 0xf420, 0x423e, [0xaf, 0x77, 0x20, 0xa5, 0xd9, 0x73, 0xa9, 0x7]);
enum Text_UnderlineColor_Attribute_GUID = GUID(0xbfa12c73, 0xfde2, 0x4473, [0xbf, 0x64, 0x10, 0x36, 0xd6, 0xaa, 0xf, 0x45]);
enum Text_UnderlineStyle_Attribute_GUID = GUID(0x5f3b21c0, 0xede4, 0x44bd, [0x9c, 0x36, 0x38, 0x53, 0x3, 0x8c, 0xbf, 0xeb]);
enum Text_AnnotationTypes_Attribute_GUID = GUID(0xad2eb431, 0xee4e, 0x4be1, [0xa7, 0xba, 0x55, 0x59, 0x15, 0x5a, 0x73, 0xef]);
enum Text_AnnotationObjects_Attribute_GUID = GUID(0xff41cf68, 0xe7ab, 0x40b9, [0x8c, 0x72, 0x72, 0xa8, 0xed, 0x94, 0x1, 0x7d]);
enum Text_StyleName_Attribute_GUID = GUID(0x22c9e091, 0x4d66, 0x45d8, [0xa8, 0x28, 0x73, 0x7b, 0xab, 0x4c, 0x98, 0xa7]);
enum Text_StyleId_Attribute_GUID = GUID(0x14c300de, 0xc32b, 0x449b, [0xab, 0x7c, 0xb0, 0xe0, 0x78, 0x9a, 0xea, 0x5d]);
enum Text_Link_Attribute_GUID = GUID(0xb38ef51d, 0x9e8d, 0x4e46, [0x91, 0x44, 0x56, 0xeb, 0xe1, 0x77, 0x32, 0x9b]);
enum Text_IsActive_Attribute_GUID = GUID(0xf5a4e533, 0xe1b8, 0x436b, [0x93, 0x5d, 0xb5, 0x7a, 0xa3, 0xf5, 0x58, 0xc4]);
enum Text_SelectionActiveEnd_Attribute_GUID = GUID(0x1f668cc3, 0x9bbf, 0x416b, [0xb0, 0xa2, 0xf8, 0x9f, 0x86, 0xf6, 0x61, 0x2c]);
enum Text_CaretPosition_Attribute_GUID = GUID(0xb227b131, 0x9889, 0x4752, [0xa9, 0x1b, 0x73, 0x3e, 0xfd, 0xc5, 0xc5, 0xa0]);
enum Text_CaretBidiMode_Attribute_GUID = GUID(0x929ee7a6, 0x51d3, 0x4715, [0x96, 0xdc, 0xb6, 0x94, 0xfa, 0x24, 0xa1, 0x68]);
enum Text_BeforeParagraphSpacing_Attribute_GUID = GUID(0xbe7b0ab1, 0xc822, 0x4a24, [0x85, 0xe9, 0xc8, 0xf2, 0x65, 0xf, 0xc7, 0x9c]);
enum Text_AfterParagraphSpacing_Attribute_GUID = GUID(0x588cbb38, 0xe62f, 0x497c, [0xb5, 0xd1, 0xcc, 0xdf, 0xe, 0xe8, 0x23, 0xd8]);
enum Text_LineSpacing_Attribute_GUID = GUID(0x63ff70ae, 0xd943, 0x4b47, [0x8a, 0xb7, 0xa7, 0xa0, 0x33, 0xd3, 0x21, 0x4b]);
enum Text_BeforeSpacing_Attribute_GUID = GUID(0xbe7b0ab1, 0xc822, 0x4a24, [0x85, 0xe9, 0xc8, 0xf2, 0x65, 0xf, 0xc7, 0x9c]);
enum Text_AfterSpacing_Attribute_GUID = GUID(0x588cbb38, 0xe62f, 0x497c, [0xb5, 0xd1, 0xcc, 0xdf, 0xe, 0xe8, 0x23, 0xd8]);
enum Text_SayAsInterpretAs_Attribute_GUID = GUID(0xb38ad6ac, 0xeee1, 0x4b6e, [0x88, 0xcc, 0x1, 0x4c, 0xef, 0xa9, 0x3f, 0xcb]);
enum TextEdit_TextChanged_Event_GUID = GUID(0x120b0308, 0xec22, 0x4eb8, [0x9c, 0x98, 0x98, 0x67, 0xcd, 0xa1, 0xb1, 0x65]);
enum TextEdit_ConversionTargetChanged_Event_GUID = GUID(0x3388c183, 0xed4f, 0x4c8b, [0x9b, 0xaa, 0x36, 0x4d, 0x51, 0xd8, 0x84, 0x7f]);
enum Changes_Event_GUID = GUID(0x7df26714, 0x614f, 0x4e05, [0x94, 0x88, 0x71, 0x6c, 0x5b, 0xa1, 0x94, 0x36]);
enum Annotation_Custom_GUID = GUID(0x9ec82750, 0x3931, 0x4952, [0x85, 0xbc, 0x1d, 0xbf, 0xf7, 0x8a, 0x43, 0xe3]);
enum Annotation_SpellingError_GUID = GUID(0xae85567e, 0x9ece, 0x423f, [0x81, 0xb7, 0x96, 0xc4, 0x3d, 0x53, 0xe5, 0xe]);
enum Annotation_GrammarError_GUID = GUID(0x757a048d, 0x4518, 0x41c6, [0x85, 0x4c, 0xdc, 0x0, 0x9b, 0x7c, 0xfb, 0x53]);
enum Annotation_Comment_GUID = GUID(0xfd2fda30, 0x26b3, 0x4c06, [0x8b, 0xc7, 0x98, 0xf1, 0x53, 0x2e, 0x46, 0xfd]);
enum Annotation_FormulaError_GUID = GUID(0x95611982, 0xcab, 0x46d5, [0xa2, 0xf0, 0xe3, 0xd, 0x19, 0x5, 0xf8, 0xbf]);
enum Annotation_TrackChanges_GUID = GUID(0x21e6e888, 0xdc14, 0x4016, [0xac, 0x27, 0x19, 0x5, 0x53, 0xc8, 0xc4, 0x70]);
enum Annotation_Header_GUID = GUID(0x867b409b, 0xb216, 0x4472, [0xa2, 0x19, 0x52, 0x5e, 0x31, 0x6, 0x81, 0xf8]);
enum Annotation_Footer_GUID = GUID(0xcceab046, 0x1833, 0x47aa, [0x80, 0x80, 0x70, 0x1e, 0xd0, 0xb0, 0xc8, 0x32]);
enum Annotation_Highlighted_GUID = GUID(0x757c884e, 0x8083, 0x4081, [0x8b, 0x9c, 0xe8, 0x7f, 0x50, 0x72, 0xf0, 0xe4]);
enum Annotation_Endnote_GUID = GUID(0x7565725c, 0x2d99, 0x4839, [0x96, 0xd, 0x33, 0xd3, 0xb8, 0x66, 0xab, 0xa5]);
enum Annotation_Footnote_GUID = GUID(0x3de10e21, 0x4125, 0x42db, [0x86, 0x20, 0xbe, 0x80, 0x83, 0x8, 0x6, 0x24]);
enum Annotation_InsertionChange_GUID = GUID(0xdbeb3a6, 0xdf15, 0x4164, [0xa3, 0xc0, 0xe2, 0x1a, 0x8c, 0xe9, 0x31, 0xc4]);
enum Annotation_DeletionChange_GUID = GUID(0xbe3d5b05, 0x951d, 0x42e7, [0x90, 0x1d, 0xad, 0xc8, 0xc2, 0xcf, 0x34, 0xd0]);
enum Annotation_MoveChange_GUID = GUID(0x9da587eb, 0x23e5, 0x4490, [0xb3, 0x85, 0x1a, 0x22, 0xdd, 0xc8, 0xb1, 0x87]);
enum Annotation_FormatChange_GUID = GUID(0xeb247345, 0xd4f1, 0x41ce, [0x8e, 0x52, 0xf7, 0x9b, 0x69, 0x63, 0x5e, 0x48]);
enum Annotation_UnsyncedChange_GUID = GUID(0x1851116a, 0xe47, 0x4b30, [0x8c, 0xb5, 0xd7, 0xda, 0xe4, 0xfb, 0xcd, 0x1b]);
enum Annotation_EditingLockedChange_GUID = GUID(0xc31f3e1c, 0x7423, 0x4dac, [0x83, 0x48, 0x41, 0xf0, 0x99, 0xff, 0x6f, 0x64]);
enum Annotation_ExternalChange_GUID = GUID(0x75a05b31, 0x5f11, 0x42fd, [0x88, 0x7d, 0xdf, 0xa0, 0x10, 0xdb, 0x23, 0x92]);
enum Annotation_ConflictingChange_GUID = GUID(0x98af8802, 0x517c, 0x459f, [0xaf, 0x13, 0x1, 0x6d, 0x3f, 0xab, 0x87, 0x7e]);
enum Annotation_Author_GUID = GUID(0xf161d3a7, 0xf81b, 0x4128, [0xb1, 0x7f, 0x71, 0xf6, 0x90, 0x91, 0x45, 0x20]);
enum Annotation_AdvancedProofingIssue_GUID = GUID(0xdac7b72c, 0xc0f2, 0x4b84, [0xb9, 0xd, 0x5f, 0xaf, 0xc0, 0xf0, 0xef, 0x1c]);
enum Annotation_DataValidationError_GUID = GUID(0xc8649fa8, 0x9775, 0x437e, [0xad, 0x46, 0xe7, 0x9, 0xd9, 0x3c, 0x23, 0x43]);
enum Annotation_CircularReferenceError_GUID = GUID(0x25bd9cf4, 0x1745, 0x4659, [0xba, 0x67, 0x72, 0x7f, 0x3, 0x18, 0xc6, 0x16]);
enum Annotation_Mathematics_GUID = GUID(0xeaab634b, 0x26d0, 0x40c1, [0x80, 0x73, 0x57, 0xca, 0x1c, 0x63, 0x3c, 0x9b]);
enum Annotation_Sensitive_GUID = GUID(0x37f4c04f, 0xf12, 0x4464, [0x92, 0x9c, 0x82, 0x8f, 0xd1, 0x52, 0x92, 0xe3]);
enum Changes_Summary_GUID = GUID(0x313d65a6, 0xe60f, 0x4d62, [0x98, 0x61, 0x55, 0xaf, 0xd7, 0x28, 0xd2, 0x7]);
enum StyleId_Custom_GUID = GUID(0xef2edd3e, 0xa999, 0x4b7c, [0xa3, 0x78, 0x9, 0xbb, 0xd5, 0x2a, 0x35, 0x16]);
enum StyleId_Heading1_GUID = GUID(0x7f7e8f69, 0x6866, 0x4621, [0x93, 0xc, 0x9a, 0x5d, 0xc, 0xa5, 0x96, 0x1c]);
enum StyleId_Heading2_GUID = GUID(0xbaa9b241, 0x5c69, 0x469d, [0x85, 0xad, 0x47, 0x47, 0x37, 0xb5, 0x2b, 0x14]);
enum StyleId_Heading3_GUID = GUID(0xbf8be9d2, 0xd8b8, 0x4ec5, [0x8c, 0x52, 0x9c, 0xfb, 0xd, 0x3, 0x59, 0x70]);
enum StyleId_Heading4_GUID = GUID(0x8436ffc0, 0x9578, 0x45fc, [0x83, 0xa4, 0xff, 0x40, 0x5, 0x33, 0x15, 0xdd]);
enum StyleId_Heading5_GUID = GUID(0x909f424d, 0xdbf, 0x406e, [0x97, 0xbb, 0x4e, 0x77, 0x3d, 0x97, 0x98, 0xf7]);
enum StyleId_Heading6_GUID = GUID(0x89d23459, 0x5d5b, 0x4824, [0xa4, 0x20, 0x11, 0xd3, 0xed, 0x82, 0xe4, 0xf]);
enum StyleId_Heading7_GUID = GUID(0xa3790473, 0xe9ae, 0x422d, [0xb8, 0xe3, 0x3b, 0x67, 0x5c, 0x61, 0x81, 0xa4]);
enum StyleId_Heading8_GUID = GUID(0x2bc14145, 0xa40c, 0x4881, [0x84, 0xae, 0xf2, 0x23, 0x56, 0x85, 0x38, 0xc]);
enum StyleId_Heading9_GUID = GUID(0xc70d9133, 0xbb2a, 0x43d3, [0x8a, 0xc6, 0x33, 0x65, 0x78, 0x84, 0xb0, 0xf0]);
enum StyleId_Title_GUID = GUID(0x15d8201a, 0xffcf, 0x481f, [0xb0, 0xa1, 0x30, 0xb6, 0x3b, 0xe9, 0x8f, 0x7]);
enum StyleId_Subtitle_GUID = GUID(0xb5d9fc17, 0x5d6f, 0x4420, [0xb4, 0x39, 0x7c, 0xb1, 0x9a, 0xd4, 0x34, 0xe2]);
enum StyleId_Normal_GUID = GUID(0xcd14d429, 0xe45e, 0x4475, [0xa1, 0xc5, 0x7f, 0x9e, 0x6b, 0xe9, 0x6e, 0xba]);
enum StyleId_Emphasis_GUID = GUID(0xca6e7dbe, 0x355e, 0x4820, [0x95, 0xa0, 0x92, 0x5f, 0x4, 0x1d, 0x34, 0x70]);
enum StyleId_Quote_GUID = GUID(0x5d1c21ea, 0x8195, 0x4f6c, [0x87, 0xea, 0x5d, 0xab, 0xec, 0xe6, 0x4c, 0x1d]);
enum StyleId_BulletedList_GUID = GUID(0x5963ed64, 0x6426, 0x4632, [0x8c, 0xaf, 0xa3, 0x2a, 0xd4, 0x2, 0xd9, 0x1a]);
enum StyleId_NumberedList_GUID = GUID(0x1e96dbd5, 0x64c3, 0x43d0, [0xb1, 0xee, 0xb5, 0x3b, 0x6, 0xe3, 0xed, 0xdf]);
enum Notification_Event_GUID = GUID(0x72c5a2f7, 0x9788, 0x480f, [0xb8, 0xeb, 0x4d, 0xee, 0x0, 0xf6, 0x18, 0x6f]);
enum SID_IsUIAutomationObject = GUID(0xb96fdb85, 0x7204, 0x4724, [0x84, 0x2b, 0xc7, 0x5, 0x9d, 0xed, 0xb9, 0xd0]);
enum SID_ControlElementProvider = GUID(0xf4791d68, 0xe254, 0x4ba3, [0x9a, 0x53, 0x26, 0xa5, 0xc5, 0x49, 0x79, 0x46]);
enum IsSelectionPattern2Available_Property_GUID = GUID(0x490806fb, 0x6e89, 0x4a47, [0x83, 0x19, 0xd2, 0x66, 0xe5, 0x11, 0xf0, 0x21]);
enum Selection2_FirstSelectedItem_Property_GUID = GUID(0xcc24ea67, 0x369c, 0x4e55, [0x9f, 0xf7, 0x38, 0xda, 0x69, 0x54, 0xc, 0x29]);
enum Selection2_LastSelectedItem_Property_GUID = GUID(0xcf7bda90, 0x2d83, 0x49f8, [0x86, 0xc, 0x9c, 0xe3, 0x94, 0xcf, 0x89, 0xb4]);
enum Selection2_CurrentSelectedItem_Property_GUID = GUID(0x34257c26, 0x83b5, 0x41a6, [0x93, 0x9c, 0xae, 0x84, 0x1c, 0x13, 0x62, 0x36]);
enum Selection2_ItemCount_Property_GUID = GUID(0xbb49eb9f, 0x456d, 0x4048, [0xb5, 0x91, 0x9c, 0x20, 0x26, 0xb8, 0x46, 0x36]);
enum Selection_Pattern2_GUID = GUID(0xfba25cab, 0xab98, 0x49f7, [0xa7, 0xdc, 0xfe, 0x53, 0x9d, 0xc1, 0x5b, 0xe7]);
enum HeadingLevel_Property_GUID = GUID(0x29084272, 0xaaaf, 0x4a30, [0x87, 0x96, 0x3c, 0x12, 0xf6, 0x2b, 0x6b, 0xbb]);
enum IsDialog_Property_GUID = GUID(0x9d0dfb9b, 0x8436, 0x4501, [0xbb, 0xbb, 0xe5, 0x34, 0xa4, 0xfb, 0x3b, 0x3f]);
enum UIA_IAFP_DEFAULT = 0x00000000;
enum UIA_IAFP_UNWRAP_BRIDGE = 0x00000001;
enum UIA_PFIA_DEFAULT = 0x00000000;
enum UIA_PFIA_UNWRAP_BRIDGE = 0x00000001;
enum UIA_ScrollPatternNoScroll = -1.000000;
alias HWINEVENTHOOK = void*;
alias HUIANODE = void*;
alias HUIAPATTERNOBJECT = void*;
alias HUIATEXTRANGE = void*;
alias HUIAEVENT = void*;
alias LPFNLRESULTFROMOBJECT = LRESULT function(const(GUID)* riid, WPARAM wParam, IUnknown punk);
alias LPFNOBJECTFROMLRESULT = HRESULT function(LRESULT lResult, const(GUID)* riid, WPARAM wParam, void** ppvObject);
alias LPFNACCESSIBLEOBJECTFROMWINDOW = HRESULT function(HWND hwnd, uint dwId, const(GUID)* riid, void** ppvObject);
alias LPFNACCESSIBLEOBJECTFROMPOINT = HRESULT function(POINT ptScreen, IAccessible* ppacc, VARIANT* pvarChild);
alias LPFNCREATESTDACCESSIBLEOBJECT = HRESULT function(HWND hwnd, int idObject, const(GUID)* riid, void** ppvObject);
alias LPFNACCESSIBLECHILDREN = HRESULT function(IAccessible paccContainer, int iChildStart, int cChildren, VARIANT* rgvarChildren, int* pcObtained);
struct MSAAMENUINFO
{
    uint dwMSAASignature;
    uint cchWText;
    PWSTR pszWText;
}
enum IID_IAccessible = GUID(0x618736e0, 0x3c3d, 0x11cf, [0x81, 0xc, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
interface IAccessible : IDispatch
{
    HRESULT get_accParent(IDispatch* ppdispParent);
    HRESULT get_accChildCount(int* pcountChildren);
    HRESULT get_accChild(VARIANT varChild, IDispatch* ppdispChild);
    HRESULT get_accName(VARIANT varChild, BSTR* pszName);
    HRESULT get_accValue(VARIANT varChild, BSTR* pszValue);
    HRESULT get_accDescription(VARIANT varChild, BSTR* pszDescription);
    HRESULT get_accRole(VARIANT varChild, VARIANT* pvarRole);
    HRESULT get_accState(VARIANT varChild, VARIANT* pvarState);
    HRESULT get_accHelp(VARIANT varChild, BSTR* pszHelp);
    HRESULT get_accHelpTopic(BSTR* pszHelpFile, VARIANT varChild, int* pidTopic);
    HRESULT get_accKeyboardShortcut(VARIANT varChild, BSTR* pszKeyboardShortcut);
    HRESULT get_accFocus(VARIANT* pvarChild);
    HRESULT get_accSelection(VARIANT* pvarChildren);
    HRESULT get_accDefaultAction(VARIANT varChild, BSTR* pszDefaultAction);
    HRESULT accSelect(int flagsSelect, VARIANT varChild);
    HRESULT accLocation(int* pxLeft, int* pyTop, int* pcxWidth, int* pcyHeight, VARIANT varChild);
    HRESULT accNavigate(int navDir, VARIANT varStart, VARIANT* pvarEndUpAt);
    HRESULT accHitTest(int xLeft, int yTop, VARIANT* pvarChild);
    HRESULT accDoDefaultAction(VARIANT varChild);
    HRESULT put_accName(VARIANT varChild, BSTR szName);
    HRESULT put_accValue(VARIANT varChild, BSTR szValue);
}
enum IID_IAccessibleHandler = GUID(0x3022430, 0xabc4, 0x11d0, [0xbd, 0xe2, 0x0, 0xaa, 0x0, 0x1a, 0x19, 0x53]);
interface IAccessibleHandler : IUnknown
{
    HRESULT AccessibleObjectFromID(int hwnd, int lObjectID, IAccessible* pIAccessible);
}
enum IID_IAccessibleWindowlessSite = GUID(0xbf3abd9c, 0x76da, 0x4389, [0x9e, 0xb6, 0x14, 0x27, 0xd2, 0x5a, 0xba, 0xb7]);
interface IAccessibleWindowlessSite : IUnknown
{
    HRESULT AcquireObjectIdRange(int rangeSize, IAccessibleHandler pRangeOwner, int* pRangeBase);
    HRESULT ReleaseObjectIdRange(int rangeBase, IAccessibleHandler pRangeOwner);
    HRESULT QueryObjectIdRanges(IAccessibleHandler pRangesOwner, SAFEARRAY** psaRanges);
    HRESULT GetParentAccessible(IAccessible* ppParent);
}
alias AnnoScope = int;
enum : int
{
    ANNO_THIS      = 0x00000000,
    ANNO_CONTAINER = 0x00000001,
}

enum IID_IAccIdentity = GUID(0x7852b78d, 0x1cfd, 0x41c1, [0xa6, 0x15, 0x9c, 0xc, 0x85, 0x96, 0xb, 0x5f]);
interface IAccIdentity : IUnknown
{
    HRESULT GetIdentityString(uint dwIDChild, ubyte** ppIDString, uint* pdwIDStringLen);
}
enum IID_IAccPropServer = GUID(0x76c0dbbb, 0x15e0, 0x4e7b, [0xb6, 0x1b, 0x20, 0xee, 0xea, 0x20, 0x1, 0xe0]);
interface IAccPropServer : IUnknown
{
    HRESULT GetPropValue(const(ubyte)* pIDString, uint dwIDStringLen, GUID idProp, VARIANT* pvarValue, BOOL* pfHasProp);
}
enum IID_IAccPropServices = GUID(0x6e26e776, 0x4f0, 0x495d, [0x80, 0xe4, 0x33, 0x30, 0x35, 0x2e, 0x31, 0x69]);
interface IAccPropServices : IUnknown
{
    HRESULT SetPropValue(const(ubyte)* pIDString, uint dwIDStringLen, GUID idProp, VARIANT var);
    HRESULT SetPropServer(const(ubyte)* pIDString, uint dwIDStringLen, const(GUID)* paProps, int cProps, IAccPropServer pServer, AnnoScope annoScope);
    HRESULT ClearProps(const(ubyte)* pIDString, uint dwIDStringLen, const(GUID)* paProps, int cProps);
    HRESULT SetHwndProp(HWND hwnd, uint idObject, uint idChild, GUID idProp, VARIANT var);
    HRESULT SetHwndPropStr(HWND hwnd, uint idObject, uint idChild, GUID idProp, const(wchar)* str);
    HRESULT SetHwndPropServer(HWND hwnd, uint idObject, uint idChild, const(GUID)* paProps, int cProps, IAccPropServer pServer, AnnoScope annoScope);
    HRESULT ClearHwndProps(HWND hwnd, uint idObject, uint idChild, const(GUID)* paProps, int cProps);
    HRESULT ComposeHwndIdentityString(HWND hwnd, uint idObject, uint idChild, ubyte** ppIDString, uint* pdwIDStringLen);
    HRESULT DecomposeHwndIdentityString(const(ubyte)* pIDString, uint dwIDStringLen, HWND* phwnd, uint* pidObject, uint* pidChild);
    HRESULT SetHmenuProp(HMENU hmenu, uint idChild, GUID idProp, VARIANT var);
    HRESULT SetHmenuPropStr(HMENU hmenu, uint idChild, GUID idProp, const(wchar)* str);
    HRESULT SetHmenuPropServer(HMENU hmenu, uint idChild, const(GUID)* paProps, int cProps, IAccPropServer pServer, AnnoScope annoScope);
    HRESULT ClearHmenuProps(HMENU hmenu, uint idChild, const(GUID)* paProps, int cProps);
    HRESULT ComposeHmenuIdentityString(HMENU hmenu, uint idChild, ubyte** ppIDString, uint* pdwIDStringLen);
    HRESULT DecomposeHmenuIdentityString(const(ubyte)* pIDString, uint dwIDStringLen, HMENU* phmenu, uint* pidChild);
}
enum CLSID_CAccPropServices = GUID(0xb5f8350b, 0x548, 0x48b1, [0xa6, 0xee, 0x88, 0xbd, 0x0, 0xb4, 0xa5, 0xe7]);
struct CAccPropServices
{
}
alias NavigateDirection = int;
enum : int
{
    NavigateDirection_Parent          = 0x00000000,
    NavigateDirection_NextSibling     = 0x00000001,
    NavigateDirection_PreviousSibling = 0x00000002,
    NavigateDirection_FirstChild      = 0x00000003,
    NavigateDirection_LastChild       = 0x00000004,
}

alias ProviderOptions = int;
enum : int
{
    ProviderOptions_ClientSideProvider     = 0x00000001,
    ProviderOptions_ServerSideProvider     = 0x00000002,
    ProviderOptions_NonClientAreaProvider  = 0x00000004,
    ProviderOptions_OverrideProvider       = 0x00000008,
    ProviderOptions_ProviderOwnsSetFocus   = 0x00000010,
    ProviderOptions_UseComThreading        = 0x00000020,
    ProviderOptions_RefuseNonClientSupport = 0x00000040,
    ProviderOptions_HasNativeIAccessible   = 0x00000080,
    ProviderOptions_UseClientCoordinates   = 0x00000100,
}

alias StructureChangeType = int;
enum : int
{
    StructureChangeType_ChildAdded          = 0x00000000,
    StructureChangeType_ChildRemoved        = 0x00000001,
    StructureChangeType_ChildrenInvalidated = 0x00000002,
    StructureChangeType_ChildrenBulkAdded   = 0x00000003,
    StructureChangeType_ChildrenBulkRemoved = 0x00000004,
    StructureChangeType_ChildrenReordered   = 0x00000005,
}

alias TextEditChangeType = int;
enum : int
{
    TextEditChangeType_None                 = 0x00000000,
    TextEditChangeType_AutoCorrect          = 0x00000001,
    TextEditChangeType_Composition          = 0x00000002,
    TextEditChangeType_CompositionFinalized = 0x00000003,
    TextEditChangeType_AutoComplete         = 0x00000004,
}

alias OrientationType = int;
enum : int
{
    OrientationType_None       = 0x00000000,
    OrientationType_Horizontal = 0x00000001,
    OrientationType_Vertical   = 0x00000002,
}

alias DockPosition = int;
enum : int
{
    DockPosition_Top    = 0x00000000,
    DockPosition_Left   = 0x00000001,
    DockPosition_Bottom = 0x00000002,
    DockPosition_Right  = 0x00000003,
    DockPosition_Fill   = 0x00000004,
    DockPosition_None   = 0x00000005,
}

alias ExpandCollapseState = int;
enum : int
{
    ExpandCollapseState_Collapsed         = 0x00000000,
    ExpandCollapseState_Expanded          = 0x00000001,
    ExpandCollapseState_PartiallyExpanded = 0x00000002,
    ExpandCollapseState_LeafNode          = 0x00000003,
}

alias ScrollAmount = int;
enum : int
{
    ScrollAmount_LargeDecrement = 0x00000000,
    ScrollAmount_SmallDecrement = 0x00000001,
    ScrollAmount_NoAmount       = 0x00000002,
    ScrollAmount_LargeIncrement = 0x00000003,
    ScrollAmount_SmallIncrement = 0x00000004,
}

alias RowOrColumnMajor = int;
enum : int
{
    RowOrColumnMajor_RowMajor      = 0x00000000,
    RowOrColumnMajor_ColumnMajor   = 0x00000001,
    RowOrColumnMajor_Indeterminate = 0x00000002,
}

alias ToggleState = int;
enum : int
{
    ToggleState_Off           = 0x00000000,
    ToggleState_On            = 0x00000001,
    ToggleState_Indeterminate = 0x00000002,
}

alias WindowVisualState = int;
enum : int
{
    WindowVisualState_Normal    = 0x00000000,
    WindowVisualState_Maximized = 0x00000001,
    WindowVisualState_Minimized = 0x00000002,
}

alias SynchronizedInputType = int;
enum : int
{
    SynchronizedInputType_KeyUp          = 0x00000001,
    SynchronizedInputType_KeyDown        = 0x00000002,
    SynchronizedInputType_LeftMouseUp    = 0x00000004,
    SynchronizedInputType_LeftMouseDown  = 0x00000008,
    SynchronizedInputType_RightMouseUp   = 0x00000010,
    SynchronizedInputType_RightMouseDown = 0x00000020,
}

alias WindowInteractionState = int;
enum : int
{
    WindowInteractionState_Running                 = 0x00000000,
    WindowInteractionState_Closing                 = 0x00000001,
    WindowInteractionState_ReadyForUserInteraction = 0x00000002,
    WindowInteractionState_BlockedByModalWindow    = 0x00000003,
    WindowInteractionState_NotResponding           = 0x00000004,
}

alias SayAsInterpretAs = int;
enum : int
{
    SayAsInterpretAs_None                       = 0x00000000,
    SayAsInterpretAs_Spell                      = 0x00000001,
    SayAsInterpretAs_Cardinal                   = 0x00000002,
    SayAsInterpretAs_Ordinal                    = 0x00000003,
    SayAsInterpretAs_Number                     = 0x00000004,
    SayAsInterpretAs_Date                       = 0x00000005,
    SayAsInterpretAs_Time                       = 0x00000006,
    SayAsInterpretAs_Telephone                  = 0x00000007,
    SayAsInterpretAs_Currency                   = 0x00000008,
    SayAsInterpretAs_Net                        = 0x00000009,
    SayAsInterpretAs_Url                        = 0x0000000a,
    SayAsInterpretAs_Address                    = 0x0000000b,
    SayAsInterpretAs_Alphanumeric               = 0x0000000c,
    SayAsInterpretAs_Name                       = 0x0000000d,
    SayAsInterpretAs_Media                      = 0x0000000e,
    SayAsInterpretAs_Date_MonthDayYear          = 0x0000000f,
    SayAsInterpretAs_Date_DayMonthYear          = 0x00000010,
    SayAsInterpretAs_Date_YearMonthDay          = 0x00000011,
    SayAsInterpretAs_Date_YearMonth             = 0x00000012,
    SayAsInterpretAs_Date_MonthYear             = 0x00000013,
    SayAsInterpretAs_Date_DayMonth              = 0x00000014,
    SayAsInterpretAs_Date_MonthDay              = 0x00000015,
    SayAsInterpretAs_Date_Year                  = 0x00000016,
    SayAsInterpretAs_Time_HoursMinutesSeconds12 = 0x00000017,
    SayAsInterpretAs_Time_HoursMinutes12        = 0x00000018,
    SayAsInterpretAs_Time_HoursMinutesSeconds24 = 0x00000019,
    SayAsInterpretAs_Time_HoursMinutes24        = 0x0000001a,
}

alias TextUnit = int;
enum : int
{
    TextUnit_Character = 0x00000000,
    TextUnit_Format    = 0x00000001,
    TextUnit_Word      = 0x00000002,
    TextUnit_Line      = 0x00000003,
    TextUnit_Paragraph = 0x00000004,
    TextUnit_Page      = 0x00000005,
    TextUnit_Document  = 0x00000006,
}

alias TextPatternRangeEndpoint = int;
enum : int
{
    TextPatternRangeEndpoint_Start = 0x00000000,
    TextPatternRangeEndpoint_End   = 0x00000001,
}

alias SupportedTextSelection = int;
enum : int
{
    SupportedTextSelection_None     = 0x00000000,
    SupportedTextSelection_Single   = 0x00000001,
    SupportedTextSelection_Multiple = 0x00000002,
}

alias LiveSetting = int;
enum : int
{
    Off       = 0x00000000,
    Polite    = 0x00000001,
    Assertive = 0x00000002,
}

alias ActiveEnd = int;
enum : int
{
    ActiveEnd_None  = 0x00000000,
    ActiveEnd_Start = 0x00000001,
    ActiveEnd_End   = 0x00000002,
}

alias CaretPosition = int;
enum : int
{
    CaretPosition_Unknown         = 0x00000000,
    CaretPosition_EndOfLine       = 0x00000001,
    CaretPosition_BeginningOfLine = 0x00000002,
}

alias CaretBidiMode = int;
enum : int
{
    CaretBidiMode_LTR = 0x00000000,
    CaretBidiMode_RTL = 0x00000001,
}

alias ZoomUnit = int;
enum : int
{
    ZoomUnit_NoAmount       = 0x00000000,
    ZoomUnit_LargeDecrement = 0x00000001,
    ZoomUnit_SmallDecrement = 0x00000002,
    ZoomUnit_LargeIncrement = 0x00000003,
    ZoomUnit_SmallIncrement = 0x00000004,
}

alias AnimationStyle = int;
enum : int
{
    AnimationStyle_None               = 0x00000000,
    AnimationStyle_LasVegasLights     = 0x00000001,
    AnimationStyle_BlinkingBackground = 0x00000002,
    AnimationStyle_SparkleText        = 0x00000003,
    AnimationStyle_MarchingBlackAnts  = 0x00000004,
    AnimationStyle_MarchingRedAnts    = 0x00000005,
    AnimationStyle_Shimmer            = 0x00000006,
    AnimationStyle_Other              = 0xffffffff,
}

alias BulletStyle = int;
enum : int
{
    BulletStyle_None               = 0x00000000,
    BulletStyle_HollowRoundBullet  = 0x00000001,
    BulletStyle_FilledRoundBullet  = 0x00000002,
    BulletStyle_HollowSquareBullet = 0x00000003,
    BulletStyle_FilledSquareBullet = 0x00000004,
    BulletStyle_DashBullet         = 0x00000005,
    BulletStyle_Other              = 0xffffffff,
}

alias CapStyle = int;
enum : int
{
    CapStyle_None          = 0x00000000,
    CapStyle_SmallCap      = 0x00000001,
    CapStyle_AllCap        = 0x00000002,
    CapStyle_AllPetiteCaps = 0x00000003,
    CapStyle_PetiteCaps    = 0x00000004,
    CapStyle_Unicase       = 0x00000005,
    CapStyle_Titling       = 0x00000006,
    CapStyle_Other         = 0xffffffff,
}

alias FillType = int;
enum : int
{
    FillType_None     = 0x00000000,
    FillType_Color    = 0x00000001,
    FillType_Gradient = 0x00000002,
    FillType_Picture  = 0x00000003,
    FillType_Pattern  = 0x00000004,
}

alias FlowDirections = int;
enum : int
{
    FlowDirections_Default     = 0x00000000,
    FlowDirections_RightToLeft = 0x00000001,
    FlowDirections_BottomToTop = 0x00000002,
    FlowDirections_Vertical    = 0x00000004,
}

alias HorizontalTextAlignment = int;
enum : int
{
    HorizontalTextAlignment_Left      = 0x00000000,
    HorizontalTextAlignment_Centered  = 0x00000001,
    HorizontalTextAlignment_Right     = 0x00000002,
    HorizontalTextAlignment_Justified = 0x00000003,
}

alias OutlineStyles = int;
enum : int
{
    OutlineStyles_None     = 0x00000000,
    OutlineStyles_Outline  = 0x00000001,
    OutlineStyles_Shadow   = 0x00000002,
    OutlineStyles_Engraved = 0x00000004,
    OutlineStyles_Embossed = 0x00000008,
}

alias TextDecorationLineStyle = int;
enum : int
{
    TextDecorationLineStyle_None            = 0x00000000,
    TextDecorationLineStyle_Single          = 0x00000001,
    TextDecorationLineStyle_WordsOnly       = 0x00000002,
    TextDecorationLineStyle_Double          = 0x00000003,
    TextDecorationLineStyle_Dot             = 0x00000004,
    TextDecorationLineStyle_Dash            = 0x00000005,
    TextDecorationLineStyle_DashDot         = 0x00000006,
    TextDecorationLineStyle_DashDotDot      = 0x00000007,
    TextDecorationLineStyle_Wavy            = 0x00000008,
    TextDecorationLineStyle_ThickSingle     = 0x00000009,
    TextDecorationLineStyle_DoubleWavy      = 0x0000000b,
    TextDecorationLineStyle_ThickWavy       = 0x0000000c,
    TextDecorationLineStyle_LongDash        = 0x0000000d,
    TextDecorationLineStyle_ThickDash       = 0x0000000e,
    TextDecorationLineStyle_ThickDashDot    = 0x0000000f,
    TextDecorationLineStyle_ThickDashDotDot = 0x00000010,
    TextDecorationLineStyle_ThickDot        = 0x00000011,
    TextDecorationLineStyle_ThickLongDash   = 0x00000012,
    TextDecorationLineStyle_Other           = 0xffffffff,
}

alias VisualEffects = int;
enum : int
{
    VisualEffects_None       = 0x00000000,
    VisualEffects_Shadow     = 0x00000001,
    VisualEffects_Reflection = 0x00000002,
    VisualEffects_Glow       = 0x00000004,
    VisualEffects_SoftEdges  = 0x00000008,
    VisualEffects_Bevel      = 0x00000010,
}

alias NotificationProcessing = int;
enum : int
{
    NotificationProcessing_ImportantAll          = 0x00000000,
    NotificationProcessing_ImportantMostRecent   = 0x00000001,
    NotificationProcessing_All                   = 0x00000002,
    NotificationProcessing_MostRecent            = 0x00000003,
    NotificationProcessing_CurrentThenMostRecent = 0x00000004,
}

alias NotificationKind = int;
enum : int
{
    NotificationKind_ItemAdded       = 0x00000000,
    NotificationKind_ItemRemoved     = 0x00000001,
    NotificationKind_ActionCompleted = 0x00000002,
    NotificationKind_ActionAborted   = 0x00000003,
    NotificationKind_Other           = 0x00000004,
}

struct UiaRect
{
    double left;
    double top;
    double width;
    double height;
}
struct UiaPoint
{
    double x;
    double y;
}
struct UiaChangeInfo
{
    int uiaId;
    VARIANT payload;
    VARIANT extraInfo;
}
alias UIAutomationType = int;
enum : int
{
    UIAutomationType_Int             = 0x00000001,
    UIAutomationType_Bool            = 0x00000002,
    UIAutomationType_String          = 0x00000003,
    UIAutomationType_Double          = 0x00000004,
    UIAutomationType_Point           = 0x00000005,
    UIAutomationType_Rect            = 0x00000006,
    UIAutomationType_Element         = 0x00000007,
    UIAutomationType_Array           = 0x00010000,
    UIAutomationType_Out             = 0x00020000,
    UIAutomationType_IntArray        = 0x00010001,
    UIAutomationType_BoolArray       = 0x00010002,
    UIAutomationType_StringArray     = 0x00010003,
    UIAutomationType_DoubleArray     = 0x00010004,
    UIAutomationType_PointArray      = 0x00010005,
    UIAutomationType_RectArray       = 0x00010006,
    UIAutomationType_ElementArray    = 0x00010007,
    UIAutomationType_OutInt          = 0x00020001,
    UIAutomationType_OutBool         = 0x00020002,
    UIAutomationType_OutString       = 0x00020003,
    UIAutomationType_OutDouble       = 0x00020004,
    UIAutomationType_OutPoint        = 0x00020005,
    UIAutomationType_OutRect         = 0x00020006,
    UIAutomationType_OutElement      = 0x00020007,
    UIAutomationType_OutIntArray     = 0x00030001,
    UIAutomationType_OutBoolArray    = 0x00030002,
    UIAutomationType_OutStringArray  = 0x00030003,
    UIAutomationType_OutDoubleArray  = 0x00030004,
    UIAutomationType_OutPointArray   = 0x00030005,
    UIAutomationType_OutRectArray    = 0x00030006,
    UIAutomationType_OutElementArray = 0x00030007,
}

struct UIAutomationParameter
{
    UIAutomationType type;
    void* pData;
}
struct UIAutomationPropertyInfo
{
    GUID guid;
    const(wchar)* pProgrammaticName;
    UIAutomationType type;
}
struct UIAutomationEventInfo
{
    GUID guid;
    const(wchar)* pProgrammaticName;
}
struct UIAutomationMethodInfo
{
    const(wchar)* pProgrammaticName;
    BOOL doSetFocus;
    uint cInParameters;
    uint cOutParameters;
    UIAutomationType* pParameterTypes;
    const(wchar)** pParameterNames;
}
struct UIAutomationPatternInfo
{
    GUID guid;
    const(wchar)* pProgrammaticName;
    GUID providerInterfaceId;
    GUID clientInterfaceId;
    uint cProperties;
    UIAutomationPropertyInfo* pProperties;
    uint cMethods;
    UIAutomationMethodInfo* pMethods;
    uint cEvents;
    UIAutomationEventInfo* pEvents;
    IUIAutomationPatternHandler pPatternHandler;
}
enum IID_IRawElementProviderSimple = GUID(0xd6dd68d1, 0x86fd, 0x4332, [0x86, 0x66, 0x9a, 0xbe, 0xde, 0xa2, 0xd2, 0x4c]);
interface IRawElementProviderSimple : IUnknown
{
    HRESULT get_ProviderOptions(ProviderOptions* pRetVal);
    HRESULT GetPatternProvider(UIA_PATTERN_ID patternId, IUnknown* pRetVal);
    HRESULT GetPropertyValue(UIA_PROPERTY_ID propertyId, VARIANT* pRetVal);
    HRESULT get_HostRawElementProvider(IRawElementProviderSimple* pRetVal);
}
enum IID_IAccessibleEx = GUID(0xf8b80ada, 0x2c44, 0x48d0, [0x89, 0xbe, 0x5f, 0xf2, 0x3c, 0x9c, 0xd8, 0x75]);
interface IAccessibleEx : IUnknown
{
    HRESULT GetObjectForChild(int idChild, IAccessibleEx* pRetVal);
    HRESULT GetIAccessiblePair(IAccessible* ppAcc, int* pidChild);
    HRESULT GetRuntimeId(SAFEARRAY** pRetVal);
    HRESULT ConvertReturnedElement(IRawElementProviderSimple pIn, IAccessibleEx* ppRetValOut);
}
enum IID_IRawElementProviderSimple2 = GUID(0xa0a839a9, 0x8da1, 0x4a82, [0x80, 0x6a, 0x8e, 0xd, 0x44, 0xe7, 0x9f, 0x56]);
interface IRawElementProviderSimple2 : IRawElementProviderSimple
{
    HRESULT ShowContextMenu();
}
enum IID_IRawElementProviderSimple3 = GUID(0xfcf5d820, 0xd7ec, 0x4613, [0xbd, 0xf6, 0x42, 0xa8, 0x4c, 0xe7, 0xda, 0xaf]);
interface IRawElementProviderSimple3 : IRawElementProviderSimple2
{
    HRESULT GetMetadataValue(int targetId, UIA_METADATA_ID metadataId, VARIANT* returnVal);
}
enum IID_IRawElementProviderFragmentRoot = GUID(0x620ce2a5, 0xab8f, 0x40a9, [0x86, 0xcb, 0xde, 0x3c, 0x75, 0x59, 0x9b, 0x58]);
interface IRawElementProviderFragmentRoot : IUnknown
{
    HRESULT ElementProviderFromPoint(double x, double y, IRawElementProviderFragment* pRetVal);
    HRESULT GetFocus(IRawElementProviderFragment* pRetVal);
}
enum IID_IRawElementProviderFragment = GUID(0xf7063da8, 0x8359, 0x439c, [0x92, 0x97, 0xbb, 0xc5, 0x29, 0x9a, 0x7d, 0x87]);
interface IRawElementProviderFragment : IUnknown
{
    HRESULT Navigate(NavigateDirection direction, IRawElementProviderFragment* pRetVal);
    HRESULT GetRuntimeId(SAFEARRAY** pRetVal);
    HRESULT get_BoundingRectangle(UiaRect* pRetVal);
    HRESULT GetEmbeddedFragmentRoots(SAFEARRAY** pRetVal);
    HRESULT SetFocus();
    HRESULT get_FragmentRoot(IRawElementProviderFragmentRoot* pRetVal);
}
enum IID_IRawElementProviderAdviseEvents = GUID(0xa407b27b, 0xf6d, 0x4427, [0x92, 0x92, 0x47, 0x3c, 0x7b, 0xf9, 0x32, 0x58]);
interface IRawElementProviderAdviseEvents : IUnknown
{
    HRESULT AdviseEventAdded(UIA_EVENT_ID eventId, SAFEARRAY* propertyIDs);
    HRESULT AdviseEventRemoved(UIA_EVENT_ID eventId, SAFEARRAY* propertyIDs);
}
enum IID_IRawElementProviderHwndOverride = GUID(0x1d5df27c, 0x8947, 0x4425, [0xb8, 0xd9, 0x79, 0x78, 0x7b, 0xb4, 0x60, 0xb8]);
interface IRawElementProviderHwndOverride : IUnknown
{
    HRESULT GetOverrideProviderForHwnd(HWND hwnd, IRawElementProviderSimple* pRetVal);
}
enum IID_IProxyProviderWinEventSink = GUID(0x4fd82b78, 0xa43e, 0x46ac, [0x98, 0x3, 0xa, 0x69, 0x69, 0xc7, 0xc1, 0x83]);
interface IProxyProviderWinEventSink : IUnknown
{
    HRESULT AddAutomationPropertyChangedEvent(IRawElementProviderSimple pProvider, UIA_PROPERTY_ID id, VARIANT newValue);
    HRESULT AddAutomationEvent(IRawElementProviderSimple pProvider, UIA_EVENT_ID id);
    HRESULT AddStructureChangedEvent(IRawElementProviderSimple pProvider, StructureChangeType structureChangeType, SAFEARRAY* runtimeId);
}
enum IID_IProxyProviderWinEventHandler = GUID(0x89592ad4, 0xf4e0, 0x43d5, [0xa3, 0xb6, 0xba, 0xd7, 0xe1, 0x11, 0xb4, 0x35]);
interface IProxyProviderWinEventHandler : IUnknown
{
    HRESULT RespondToWinEvent(uint idWinEvent, HWND hwnd, int idObject, int idChild, IProxyProviderWinEventSink pSink);
}
enum IID_IRawElementProviderWindowlessSite = GUID(0xa2a93cc, 0xbfad, 0x42ac, [0x9b, 0x2e, 0x9, 0x91, 0xfb, 0xd, 0x3e, 0xa0]);
interface IRawElementProviderWindowlessSite : IUnknown
{
    HRESULT GetAdjacentFragment(NavigateDirection direction, IRawElementProviderFragment* ppParent);
    HRESULT GetRuntimeIdPrefix(SAFEARRAY** pRetVal);
}
enum IID_IAccessibleHostingElementProviders = GUID(0x33ac331b, 0x943e, 0x4020, [0xb2, 0x95, 0xdb, 0x37, 0x78, 0x49, 0x74, 0xa3]);
interface IAccessibleHostingElementProviders : IUnknown
{
    HRESULT GetEmbeddedFragmentRoots(SAFEARRAY** pRetVal);
    HRESULT GetObjectIdForProvider(IRawElementProviderSimple pProvider, int* pidObject);
}
enum IID_IRawElementProviderHostingAccessibles = GUID(0x24be0b07, 0xd37d, 0x487a, [0x98, 0xcf, 0xa1, 0x3e, 0xd4, 0x65, 0xe9, 0xb3]);
interface IRawElementProviderHostingAccessibles : IUnknown
{
    HRESULT GetEmbeddedAccessibles(SAFEARRAY** pRetVal);
}
enum IID_IDockProvider = GUID(0x159bc72c, 0x4ad3, 0x485e, [0x96, 0x37, 0xd7, 0x5, 0x2e, 0xdf, 0x1, 0x46]);
interface IDockProvider : IUnknown
{
    HRESULT SetDockPosition(DockPosition dockPosition);
    HRESULT get_DockPosition(DockPosition* pRetVal);
}
enum IID_IExpandCollapseProvider = GUID(0xd847d3a5, 0xcab0, 0x4a98, [0x8c, 0x32, 0xec, 0xb4, 0x5c, 0x59, 0xad, 0x24]);
interface IExpandCollapseProvider : IUnknown
{
    HRESULT Expand();
    HRESULT Collapse();
    HRESULT get_ExpandCollapseState(ExpandCollapseState* pRetVal);
}
enum IID_IGridProvider = GUID(0xb17d6187, 0x907, 0x464b, [0xa1, 0x68, 0xe, 0xf1, 0x7a, 0x15, 0x72, 0xb1]);
interface IGridProvider : IUnknown
{
    HRESULT GetItem(int row, int column, IRawElementProviderSimple* pRetVal);
    HRESULT get_RowCount(int* pRetVal);
    HRESULT get_ColumnCount(int* pRetVal);
}
enum IID_IGridItemProvider = GUID(0xd02541f1, 0xfb81, 0x4d64, [0xae, 0x32, 0xf5, 0x20, 0xf8, 0xa6, 0xdb, 0xd1]);
interface IGridItemProvider : IUnknown
{
    HRESULT get_Row(int* pRetVal);
    HRESULT get_Column(int* pRetVal);
    HRESULT get_RowSpan(int* pRetVal);
    HRESULT get_ColumnSpan(int* pRetVal);
    HRESULT get_ContainingGrid(IRawElementProviderSimple* pRetVal);
}
enum IID_IInvokeProvider = GUID(0x54fcb24b, 0xe18e, 0x47a2, [0xb4, 0xd3, 0xec, 0xcb, 0xe7, 0x75, 0x99, 0xa2]);
interface IInvokeProvider : IUnknown
{
    HRESULT Invoke();
}
enum IID_IMultipleViewProvider = GUID(0x6278cab1, 0xb556, 0x4a1a, [0xb4, 0xe0, 0x41, 0x8a, 0xcc, 0x52, 0x32, 0x1]);
interface IMultipleViewProvider : IUnknown
{
    HRESULT GetViewName(int viewId, BSTR* pRetVal);
    HRESULT SetCurrentView(int viewId);
    HRESULT get_CurrentView(int* pRetVal);
    HRESULT GetSupportedViews(SAFEARRAY** pRetVal);
}
enum IID_IRangeValueProvider = GUID(0x36dc7aef, 0x33e6, 0x4691, [0xaf, 0xe1, 0x2b, 0xe7, 0x27, 0x4b, 0x3d, 0x33]);
interface IRangeValueProvider : IUnknown
{
    HRESULT SetValue(double val);
    HRESULT get_Value(double* pRetVal);
    HRESULT get_IsReadOnly(BOOL* pRetVal);
    HRESULT get_Maximum(double* pRetVal);
    HRESULT get_Minimum(double* pRetVal);
    HRESULT get_LargeChange(double* pRetVal);
    HRESULT get_SmallChange(double* pRetVal);
}
enum IID_IScrollItemProvider = GUID(0x2360c714, 0x4bf1, 0x4b26, [0xba, 0x65, 0x9b, 0x21, 0x31, 0x61, 0x27, 0xeb]);
interface IScrollItemProvider : IUnknown
{
    HRESULT ScrollIntoView();
}
enum IID_ISelectionProvider = GUID(0xfb8b03af, 0x3bdf, 0x48d4, [0xbd, 0x36, 0x1a, 0x65, 0x79, 0x3b, 0xe1, 0x68]);
interface ISelectionProvider : IUnknown
{
    HRESULT GetSelection(SAFEARRAY** pRetVal);
    HRESULT get_CanSelectMultiple(BOOL* pRetVal);
    HRESULT get_IsSelectionRequired(BOOL* pRetVal);
}
enum IID_ISelectionProvider2 = GUID(0x14f68475, 0xee1c, 0x44f6, [0xa8, 0x69, 0xd2, 0x39, 0x38, 0x1f, 0xf, 0xe7]);
interface ISelectionProvider2 : ISelectionProvider
{
    HRESULT get_FirstSelectedItem(IRawElementProviderSimple* retVal);
    HRESULT get_LastSelectedItem(IRawElementProviderSimple* retVal);
    HRESULT get_CurrentSelectedItem(IRawElementProviderSimple* retVal);
    HRESULT get_ItemCount(int* retVal);
}
enum IID_IScrollProvider = GUID(0xb38b8077, 0x1fc3, 0x42a5, [0x8c, 0xae, 0xd4, 0xc, 0x22, 0x15, 0x5, 0x5a]);
interface IScrollProvider : IUnknown
{
    HRESULT Scroll(ScrollAmount horizontalAmount, ScrollAmount verticalAmount);
    HRESULT SetScrollPercent(double horizontalPercent, double verticalPercent);
    HRESULT get_HorizontalScrollPercent(double* pRetVal);
    HRESULT get_VerticalScrollPercent(double* pRetVal);
    HRESULT get_HorizontalViewSize(double* pRetVal);
    HRESULT get_VerticalViewSize(double* pRetVal);
    HRESULT get_HorizontallyScrollable(BOOL* pRetVal);
    HRESULT get_VerticallyScrollable(BOOL* pRetVal);
}
enum IID_ISelectionItemProvider = GUID(0x2acad808, 0xb2d4, 0x452d, [0xa4, 0x7, 0x91, 0xff, 0x1a, 0xd1, 0x67, 0xb2]);
interface ISelectionItemProvider : IUnknown
{
    HRESULT Select();
    HRESULT AddToSelection();
    HRESULT RemoveFromSelection();
    HRESULT get_IsSelected(BOOL* pRetVal);
    HRESULT get_SelectionContainer(IRawElementProviderSimple* pRetVal);
}
enum IID_ISynchronizedInputProvider = GUID(0x29db1a06, 0x2ce, 0x4cf7, [0x9b, 0x42, 0x56, 0x5d, 0x4f, 0xab, 0x20, 0xee]);
interface ISynchronizedInputProvider : IUnknown
{
    HRESULT StartListening(SynchronizedInputType inputType);
    HRESULT Cancel();
}
enum IID_ITableProvider = GUID(0x9c860395, 0x97b3, 0x490a, [0xb5, 0x2a, 0x85, 0x8c, 0xc2, 0x2a, 0xf1, 0x66]);
interface ITableProvider : IUnknown
{
    HRESULT GetRowHeaders(SAFEARRAY** pRetVal);
    HRESULT GetColumnHeaders(SAFEARRAY** pRetVal);
    HRESULT get_RowOrColumnMajor(RowOrColumnMajor* pRetVal);
}
enum IID_ITableItemProvider = GUID(0xb9734fa6, 0x771f, 0x4d78, [0x9c, 0x90, 0x25, 0x17, 0x99, 0x93, 0x49, 0xcd]);
interface ITableItemProvider : IUnknown
{
    HRESULT GetRowHeaderItems(SAFEARRAY** pRetVal);
    HRESULT GetColumnHeaderItems(SAFEARRAY** pRetVal);
}
enum IID_IToggleProvider = GUID(0x56d00bd0, 0xc4f4, 0x433c, [0xa8, 0x36, 0x1a, 0x52, 0xa5, 0x7e, 0x8, 0x92]);
interface IToggleProvider : IUnknown
{
    HRESULT Toggle();
    HRESULT get_ToggleState(ToggleState* pRetVal);
}
enum IID_ITransformProvider = GUID(0x6829ddc4, 0x4f91, 0x4ffa, [0xb8, 0x6f, 0xbd, 0x3e, 0x29, 0x87, 0xcb, 0x4c]);
interface ITransformProvider : IUnknown
{
    HRESULT Move(double x, double y);
    HRESULT Resize(double width, double height);
    HRESULT Rotate(double degrees);
    HRESULT get_CanMove(BOOL* pRetVal);
    HRESULT get_CanResize(BOOL* pRetVal);
    HRESULT get_CanRotate(BOOL* pRetVal);
}
enum IID_IValueProvider = GUID(0xc7935180, 0x6fb3, 0x4201, [0xb1, 0x74, 0x7d, 0xf7, 0x3a, 0xdb, 0xf6, 0x4a]);
interface IValueProvider : IUnknown
{
    HRESULT SetValue(const(wchar)* val);
    HRESULT get_Value(BSTR* pRetVal);
    HRESULT get_IsReadOnly(BOOL* pRetVal);
}
enum IID_IWindowProvider = GUID(0x987df77b, 0xdb06, 0x4d77, [0x8f, 0x8a, 0x86, 0xa9, 0xc3, 0xbb, 0x90, 0xb9]);
interface IWindowProvider : IUnknown
{
    HRESULT SetVisualState(WindowVisualState state);
    HRESULT Close();
    HRESULT WaitForInputIdle(int milliseconds, BOOL* pRetVal);
    HRESULT get_CanMaximize(BOOL* pRetVal);
    HRESULT get_CanMinimize(BOOL* pRetVal);
    HRESULT get_IsModal(BOOL* pRetVal);
    HRESULT get_WindowVisualState(WindowVisualState* pRetVal);
    HRESULT get_WindowInteractionState(WindowInteractionState* pRetVal);
    HRESULT get_IsTopmost(BOOL* pRetVal);
}
enum IID_ILegacyIAccessibleProvider = GUID(0xe44c3566, 0x915d, 0x4070, [0x99, 0xc6, 0x4, 0x7b, 0xff, 0x5a, 0x8, 0xf5]);
interface ILegacyIAccessibleProvider : IUnknown
{
    HRESULT Select(int flagsSelect);
    HRESULT DoDefaultAction();
    HRESULT SetValue(const(wchar)* szValue);
    HRESULT GetIAccessible(IAccessible* ppAccessible);
    HRESULT get_ChildId(int* pRetVal);
    HRESULT get_Name(BSTR* pszName);
    HRESULT get_Value(BSTR* pszValue);
    HRESULT get_Description(BSTR* pszDescription);
    HRESULT get_Role(uint* pdwRole);
    HRESULT get_State(uint* pdwState);
    HRESULT get_Help(BSTR* pszHelp);
    HRESULT get_KeyboardShortcut(BSTR* pszKeyboardShortcut);
    HRESULT GetSelection(SAFEARRAY** pvarSelectedChildren);
    HRESULT get_DefaultAction(BSTR* pszDefaultAction);
}
enum IID_IItemContainerProvider = GUID(0xe747770b, 0x39ce, 0x4382, [0xab, 0x30, 0xd8, 0xfb, 0x3f, 0x33, 0x6f, 0x24]);
interface IItemContainerProvider : IUnknown
{
    HRESULT FindItemByProperty(IRawElementProviderSimple pStartAfter, UIA_PROPERTY_ID propertyId, VARIANT value, IRawElementProviderSimple* pFound);
}
enum IID_IVirtualizedItemProvider = GUID(0xcb98b665, 0x2d35, 0x4fac, [0xad, 0x35, 0xf3, 0xc6, 0xd, 0xc, 0xb, 0x8b]);
interface IVirtualizedItemProvider : IUnknown
{
    HRESULT Realize();
}
enum IID_IObjectModelProvider = GUID(0x3ad86ebd, 0xf5ef, 0x483d, [0xbb, 0x18, 0xb1, 0x4, 0x2a, 0x47, 0x5d, 0x64]);
interface IObjectModelProvider : IUnknown
{
    HRESULT GetUnderlyingObjectModel(IUnknown* ppUnknown);
}
enum IID_IAnnotationProvider = GUID(0xf95c7e80, 0xbd63, 0x4601, [0x97, 0x82, 0x44, 0x5e, 0xbf, 0xf0, 0x11, 0xfc]);
interface IAnnotationProvider : IUnknown
{
    HRESULT get_AnnotationTypeId(UIA_ANNOTATIONTYPE* retVal);
    HRESULT get_AnnotationTypeName(BSTR* retVal);
    HRESULT get_Author(BSTR* retVal);
    HRESULT get_DateTime(BSTR* retVal);
    HRESULT get_Target(IRawElementProviderSimple* retVal);
}
enum IID_IStylesProvider = GUID(0x19b6b649, 0xf5d7, 0x4a6d, [0xbd, 0xcb, 0x12, 0x92, 0x52, 0xbe, 0x58, 0x8a]);
interface IStylesProvider : IUnknown
{
    HRESULT get_StyleId(UIA_STYLE_ID* retVal);
    HRESULT get_StyleName(BSTR* retVal);
    HRESULT get_FillColor(int* retVal);
    HRESULT get_FillPatternStyle(BSTR* retVal);
    HRESULT get_Shape(BSTR* retVal);
    HRESULT get_FillPatternColor(int* retVal);
    HRESULT get_ExtendedProperties(BSTR* retVal);
}
enum IID_ISpreadsheetProvider = GUID(0x6f6b5d35, 0x5525, 0x4f80, [0xb7, 0x58, 0x85, 0x47, 0x38, 0x32, 0xff, 0xc7]);
interface ISpreadsheetProvider : IUnknown
{
    HRESULT GetItemByName(const(wchar)* name, IRawElementProviderSimple* pRetVal);
}
enum IID_ISpreadsheetItemProvider = GUID(0xeaed4660, 0x7b3d, 0x4879, [0xa2, 0xe6, 0x36, 0x5c, 0xe6, 0x3, 0xf3, 0xd0]);
interface ISpreadsheetItemProvider : IUnknown
{
    HRESULT get_Formula(BSTR* pRetVal);
    HRESULT GetAnnotationObjects(SAFEARRAY** pRetVal);
    HRESULT GetAnnotationTypes(SAFEARRAY** pRetVal);
}
enum IID_ITransformProvider2 = GUID(0x4758742f, 0x7ac2, 0x460c, [0xbc, 0x48, 0x9, 0xfc, 0x9, 0x30, 0x8a, 0x93]);
interface ITransformProvider2 : ITransformProvider
{
    HRESULT Zoom(double zoom);
    HRESULT get_CanZoom(BOOL* pRetVal);
    HRESULT get_ZoomLevel(double* pRetVal);
    HRESULT get_ZoomMinimum(double* pRetVal);
    HRESULT get_ZoomMaximum(double* pRetVal);
    HRESULT ZoomByUnit(ZoomUnit zoomUnit);
}
enum IID_IDragProvider = GUID(0x6aa7bbbb, 0x7ff9, 0x497d, [0x90, 0x4f, 0xd2, 0xb, 0x89, 0x79, 0x29, 0xd8]);
interface IDragProvider : IUnknown
{
    HRESULT get_IsGrabbed(BOOL* pRetVal);
    HRESULT get_DropEffect(BSTR* pRetVal);
    HRESULT get_DropEffects(SAFEARRAY** pRetVal);
    HRESULT GetGrabbedItems(SAFEARRAY** pRetVal);
}
enum IID_IDropTargetProvider = GUID(0xbae82bfd, 0x358a, 0x481c, [0x85, 0xa0, 0xd8, 0xb4, 0xd9, 0xa, 0x5d, 0x61]);
interface IDropTargetProvider : IUnknown
{
    HRESULT get_DropTargetEffect(BSTR* pRetVal);
    HRESULT get_DropTargetEffects(SAFEARRAY** pRetVal);
}
enum IID_ITextRangeProvider = GUID(0x5347ad7b, 0xc355, 0x46f8, [0xaf, 0xf5, 0x90, 0x90, 0x33, 0x58, 0x2f, 0x63]);
interface ITextRangeProvider : IUnknown
{
    HRESULT Clone(ITextRangeProvider* pRetVal);
    HRESULT Compare(ITextRangeProvider range, BOOL* pRetVal);
    HRESULT CompareEndpoints(TextPatternRangeEndpoint endpoint, ITextRangeProvider targetRange, TextPatternRangeEndpoint targetEndpoint, int* pRetVal);
    HRESULT ExpandToEnclosingUnit(TextUnit unit);
    HRESULT FindAttribute(UIA_TEXTATTRIBUTE_ID attributeId, VARIANT val, BOOL backward, ITextRangeProvider* pRetVal);
    HRESULT FindText(BSTR text, BOOL backward, BOOL ignoreCase, ITextRangeProvider* pRetVal);
    HRESULT GetAttributeValue(UIA_TEXTATTRIBUTE_ID attributeId, VARIANT* pRetVal);
    HRESULT GetBoundingRectangles(SAFEARRAY** pRetVal);
    HRESULT GetEnclosingElement(IRawElementProviderSimple* pRetVal);
    HRESULT GetText(int maxLength, BSTR* pRetVal);
    HRESULT Move(TextUnit unit, int count, int* pRetVal);
    HRESULT MoveEndpointByUnit(TextPatternRangeEndpoint endpoint, TextUnit unit, int count, int* pRetVal);
    HRESULT MoveEndpointByRange(TextPatternRangeEndpoint endpoint, ITextRangeProvider targetRange, TextPatternRangeEndpoint targetEndpoint);
    HRESULT Select();
    HRESULT AddToSelection();
    HRESULT RemoveFromSelection();
    HRESULT ScrollIntoView(BOOL alignToTop);
    HRESULT GetChildren(SAFEARRAY** pRetVal);
}
enum IID_ITextProvider = GUID(0x3589c92c, 0x63f3, 0x4367, [0x99, 0xbb, 0xad, 0xa6, 0x53, 0xb7, 0x7c, 0xf2]);
interface ITextProvider : IUnknown
{
    HRESULT GetSelection(SAFEARRAY** pRetVal);
    HRESULT GetVisibleRanges(SAFEARRAY** pRetVal);
    HRESULT RangeFromChild(IRawElementProviderSimple childElement, ITextRangeProvider* pRetVal);
    HRESULT RangeFromPoint(UiaPoint point, ITextRangeProvider* pRetVal);
    HRESULT get_DocumentRange(ITextRangeProvider* pRetVal);
    HRESULT get_SupportedTextSelection(SupportedTextSelection* pRetVal);
}
enum IID_ITextProvider2 = GUID(0xdc5e6ed, 0x3e16, 0x4bf1, [0x8f, 0x9a, 0xa9, 0x79, 0x87, 0x8b, 0xc1, 0x95]);
interface ITextProvider2 : ITextProvider
{
    HRESULT RangeFromAnnotation(IRawElementProviderSimple annotationElement, ITextRangeProvider* pRetVal);
    HRESULT GetCaretRange(BOOL* isActive, ITextRangeProvider* pRetVal);
}
enum IID_ITextEditProvider = GUID(0xea3605b4, 0x3a05, 0x400e, [0xb5, 0xf9, 0x4e, 0x91, 0xb4, 0xf, 0x61, 0x76]);
interface ITextEditProvider : ITextProvider
{
    HRESULT GetActiveComposition(ITextRangeProvider* pRetVal);
    HRESULT GetConversionTarget(ITextRangeProvider* pRetVal);
}
enum IID_ITextRangeProvider2 = GUID(0x9bbce42c, 0x1921, 0x4f18, [0x89, 0xca, 0xdb, 0xa1, 0x91, 0xa, 0x3, 0x86]);
interface ITextRangeProvider2 : ITextRangeProvider
{
    HRESULT ShowContextMenu();
}
enum IID_ITextChildProvider = GUID(0x4c2de2b9, 0xc88f, 0x4f88, [0xa1, 0x11, 0xf1, 0xd3, 0x36, 0xb7, 0xd1, 0xa9]);
interface ITextChildProvider : IUnknown
{
    HRESULT get_TextContainer(IRawElementProviderSimple* pRetVal);
    HRESULT get_TextRange(ITextRangeProvider* pRetVal);
}
enum IID_ICustomNavigationProvider = GUID(0x2062a28a, 0x8c07, 0x4b94, [0x8e, 0x12, 0x70, 0x37, 0xc6, 0x22, 0xae, 0xb8]);
interface ICustomNavigationProvider : IUnknown
{
    HRESULT Navigate(NavigateDirection direction, IRawElementProviderSimple* pRetVal);
}
enum IID_IUIAutomationPatternInstance = GUID(0xc03a7fe4, 0x9431, 0x409f, [0xbe, 0xd8, 0xae, 0x7c, 0x22, 0x99, 0xbc, 0x8d]);
interface IUIAutomationPatternInstance : IUnknown
{
    HRESULT GetProperty(uint index, BOOL cached, UIAutomationType type, void* pPtr);
    HRESULT CallMethod(uint index, const(UIAutomationParameter)* pParams, uint cParams);
}
enum IID_IUIAutomationPatternHandler = GUID(0xd97022f3, 0xa947, 0x465e, [0x8b, 0x2a, 0xac, 0x43, 0x15, 0xfa, 0x54, 0xe8]);
interface IUIAutomationPatternHandler : IUnknown
{
    HRESULT CreateClientWrapper(IUIAutomationPatternInstance pPatternInstance, IUnknown* pClientWrapper);
    HRESULT Dispatch(IUnknown pTarget, uint index, const(UIAutomationParameter)* pParams, uint cParams);
}
enum IID_IUIAutomationRegistrar = GUID(0x8609c4ec, 0x4a1a, 0x4d88, [0xa3, 0x57, 0x5a, 0x66, 0xe0, 0x60, 0xe1, 0xcf]);
interface IUIAutomationRegistrar : IUnknown
{
    HRESULT RegisterProperty(const(UIAutomationPropertyInfo)* property, int* propertyId);
    HRESULT RegisterEvent(const(UIAutomationEventInfo)* event, int* eventId);
    HRESULT RegisterPattern(const(UIAutomationPatternInfo)* pattern, int* pPatternId, int* pPatternAvailablePropertyId, uint propertyIdCount, int* pPropertyIds, uint eventIdCount, int* pEventIds);
}
enum CLSID_CUIAutomationRegistrar = GUID(0x6e29fabf, 0x9977, 0x42d1, [0x8d, 0xe, 0xca, 0x7e, 0x61, 0xad, 0x87, 0xe6]);
struct CUIAutomationRegistrar
{
}
alias TreeScope = int;
enum : int
{
    TreeScope_None        = 0x00000000,
    TreeScope_Element     = 0x00000001,
    TreeScope_Children    = 0x00000002,
    TreeScope_Descendants = 0x00000004,
    TreeScope_Parent      = 0x00000008,
    TreeScope_Ancestors   = 0x00000010,
    TreeScope_Subtree     = 0x00000007,
}

alias PropertyConditionFlags = int;
enum : int
{
    PropertyConditionFlags_None           = 0x00000000,
    PropertyConditionFlags_IgnoreCase     = 0x00000001,
    PropertyConditionFlags_MatchSubstring = 0x00000002,
}

alias AutomationElementMode = int;
enum : int
{
    AutomationElementMode_None = 0x00000000,
    AutomationElementMode_Full = 0x00000001,
}

alias TreeTraversalOptions = int;
enum : int
{
    TreeTraversalOptions_Default          = 0x00000000,
    TreeTraversalOptions_PostOrder        = 0x00000001,
    TreeTraversalOptions_LastToFirstOrder = 0x00000002,
}

alias ConnectionRecoveryBehaviorOptions = int;
enum : int
{
    ConnectionRecoveryBehaviorOptions_Disabled = 0x00000000,
    ConnectionRecoveryBehaviorOptions_Enabled  = 0x00000001,
}

alias CoalesceEventsOptions = int;
enum : int
{
    CoalesceEventsOptions_Disabled = 0x00000000,
    CoalesceEventsOptions_Enabled  = 0x00000001,
}

struct ExtendedProperty
{
    BSTR PropertyName;
    BSTR PropertyValue;
}
enum IID_IUIAutomationElement = GUID(0xd22108aa, 0x8ac5, 0x49a5, [0x83, 0x7b, 0x37, 0xbb, 0xb3, 0xd7, 0x59, 0x1e]);
interface IUIAutomationElement : IUnknown
{
    HRESULT SetFocus();
    HRESULT GetRuntimeId(SAFEARRAY** runtimeId);
    HRESULT FindFirst(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationElement* found);
    HRESULT FindAll(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationElementArray* found);
    HRESULT FindFirstBuildCache(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* found);
    HRESULT FindAllBuildCache(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationCacheRequest cacheRequest, IUIAutomationElementArray* found);
    HRESULT BuildUpdatedCache(IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* updatedElement);
    HRESULT GetCurrentPropertyValue(UIA_PROPERTY_ID propertyId, VARIANT* retVal);
    HRESULT GetCurrentPropertyValueEx(UIA_PROPERTY_ID propertyId, BOOL ignoreDefaultValue, VARIANT* retVal);
    HRESULT GetCachedPropertyValue(UIA_PROPERTY_ID propertyId, VARIANT* retVal);
    HRESULT GetCachedPropertyValueEx(UIA_PROPERTY_ID propertyId, BOOL ignoreDefaultValue, VARIANT* retVal);
    HRESULT GetCurrentPatternAs(UIA_PATTERN_ID patternId, const(GUID)* riid, void** patternObject);
    HRESULT GetCachedPatternAs(UIA_PATTERN_ID patternId, const(GUID)* riid, void** patternObject);
    HRESULT GetCurrentPattern(UIA_PATTERN_ID patternId, IUnknown* patternObject);
    HRESULT GetCachedPattern(UIA_PATTERN_ID patternId, IUnknown* patternObject);
    HRESULT GetCachedParent(IUIAutomationElement* parent);
    HRESULT GetCachedChildren(IUIAutomationElementArray* children);
    HRESULT get_CurrentProcessId(int* retVal);
    HRESULT get_CurrentControlType(UIA_CONTROLTYPE_ID* retVal);
    HRESULT get_CurrentLocalizedControlType(BSTR* retVal);
    HRESULT get_CurrentName(BSTR* retVal);
    HRESULT get_CurrentAcceleratorKey(BSTR* retVal);
    HRESULT get_CurrentAccessKey(BSTR* retVal);
    HRESULT get_CurrentHasKeyboardFocus(BOOL* retVal);
    HRESULT get_CurrentIsKeyboardFocusable(BOOL* retVal);
    HRESULT get_CurrentIsEnabled(BOOL* retVal);
    HRESULT get_CurrentAutomationId(BSTR* retVal);
    HRESULT get_CurrentClassName(BSTR* retVal);
    HRESULT get_CurrentHelpText(BSTR* retVal);
    HRESULT get_CurrentCulture(int* retVal);
    HRESULT get_CurrentIsControlElement(BOOL* retVal);
    HRESULT get_CurrentIsContentElement(BOOL* retVal);
    HRESULT get_CurrentIsPassword(BOOL* retVal);
    HRESULT get_CurrentNativeWindowHandle(HWND* retVal);
    HRESULT get_CurrentItemType(BSTR* retVal);
    HRESULT get_CurrentIsOffscreen(BOOL* retVal);
    HRESULT get_CurrentOrientation(OrientationType* retVal);
    HRESULT get_CurrentFrameworkId(BSTR* retVal);
    HRESULT get_CurrentIsRequiredForForm(BOOL* retVal);
    HRESULT get_CurrentItemStatus(BSTR* retVal);
    HRESULT get_CurrentBoundingRectangle(RECT* retVal);
    HRESULT get_CurrentLabeledBy(IUIAutomationElement* retVal);
    HRESULT get_CurrentAriaRole(BSTR* retVal);
    HRESULT get_CurrentAriaProperties(BSTR* retVal);
    HRESULT get_CurrentIsDataValidForForm(BOOL* retVal);
    HRESULT get_CurrentControllerFor(IUIAutomationElementArray* retVal);
    HRESULT get_CurrentDescribedBy(IUIAutomationElementArray* retVal);
    HRESULT get_CurrentFlowsTo(IUIAutomationElementArray* retVal);
    HRESULT get_CurrentProviderDescription(BSTR* retVal);
    HRESULT get_CachedProcessId(int* retVal);
    HRESULT get_CachedControlType(UIA_CONTROLTYPE_ID* retVal);
    HRESULT get_CachedLocalizedControlType(BSTR* retVal);
    HRESULT get_CachedName(BSTR* retVal);
    HRESULT get_CachedAcceleratorKey(BSTR* retVal);
    HRESULT get_CachedAccessKey(BSTR* retVal);
    HRESULT get_CachedHasKeyboardFocus(BOOL* retVal);
    HRESULT get_CachedIsKeyboardFocusable(BOOL* retVal);
    HRESULT get_CachedIsEnabled(BOOL* retVal);
    HRESULT get_CachedAutomationId(BSTR* retVal);
    HRESULT get_CachedClassName(BSTR* retVal);
    HRESULT get_CachedHelpText(BSTR* retVal);
    HRESULT get_CachedCulture(int* retVal);
    HRESULT get_CachedIsControlElement(BOOL* retVal);
    HRESULT get_CachedIsContentElement(BOOL* retVal);
    HRESULT get_CachedIsPassword(BOOL* retVal);
    HRESULT get_CachedNativeWindowHandle(HWND* retVal);
    HRESULT get_CachedItemType(BSTR* retVal);
    HRESULT get_CachedIsOffscreen(BOOL* retVal);
    HRESULT get_CachedOrientation(OrientationType* retVal);
    HRESULT get_CachedFrameworkId(BSTR* retVal);
    HRESULT get_CachedIsRequiredForForm(BOOL* retVal);
    HRESULT get_CachedItemStatus(BSTR* retVal);
    HRESULT get_CachedBoundingRectangle(RECT* retVal);
    HRESULT get_CachedLabeledBy(IUIAutomationElement* retVal);
    HRESULT get_CachedAriaRole(BSTR* retVal);
    HRESULT get_CachedAriaProperties(BSTR* retVal);
    HRESULT get_CachedIsDataValidForForm(BOOL* retVal);
    HRESULT get_CachedControllerFor(IUIAutomationElementArray* retVal);
    HRESULT get_CachedDescribedBy(IUIAutomationElementArray* retVal);
    HRESULT get_CachedFlowsTo(IUIAutomationElementArray* retVal);
    HRESULT get_CachedProviderDescription(BSTR* retVal);
    HRESULT GetClickablePoint(POINT* clickable, BOOL* gotClickable);
}
enum IID_IUIAutomationElementArray = GUID(0x14314595, 0xb4bc, 0x4055, [0x95, 0xf2, 0x58, 0xf2, 0xe4, 0x2c, 0x98, 0x55]);
interface IUIAutomationElementArray : IUnknown
{
    HRESULT get_Length(int* length);
    HRESULT GetElement(int index, IUIAutomationElement* element);
}
enum IID_IUIAutomationCondition = GUID(0x352ffba8, 0x973, 0x437c, [0xa6, 0x1f, 0xf6, 0x4c, 0xaf, 0xd8, 0x1d, 0xf9]);
interface IUIAutomationCondition : IUnknown
{
}
enum IID_IUIAutomationBoolCondition = GUID(0x1b4e1f2e, 0x75eb, 0x4d0b, [0x89, 0x52, 0x5a, 0x69, 0x98, 0x8e, 0x23, 0x7]);
interface IUIAutomationBoolCondition : IUIAutomationCondition
{
    HRESULT get_BooleanValue(BOOL* boolVal);
}
enum IID_IUIAutomationPropertyCondition = GUID(0x99ebf2cb, 0x5578, 0x4267, [0x9a, 0xd4, 0xaf, 0xd6, 0xea, 0x77, 0xe9, 0x4b]);
interface IUIAutomationPropertyCondition : IUIAutomationCondition
{
    HRESULT get_PropertyId(UIA_PROPERTY_ID* propertyId);
    HRESULT get_PropertyValue(VARIANT* propertyValue);
    HRESULT get_PropertyConditionFlags(PropertyConditionFlags* flags);
}
enum IID_IUIAutomationAndCondition = GUID(0xa7d0af36, 0xb912, 0x45fe, [0x98, 0x55, 0x9, 0x1d, 0xdc, 0x17, 0x4a, 0xec]);
interface IUIAutomationAndCondition : IUIAutomationCondition
{
    HRESULT get_ChildCount(int* childCount);
    HRESULT GetChildrenAsNativeArray(IUIAutomationCondition** childArray, int* childArrayCount);
    HRESULT GetChildren(SAFEARRAY** childArray);
}
enum IID_IUIAutomationOrCondition = GUID(0x8753f032, 0x3db1, 0x47b5, [0xa1, 0xfc, 0x6e, 0x34, 0xa2, 0x66, 0xc7, 0x12]);
interface IUIAutomationOrCondition : IUIAutomationCondition
{
    HRESULT get_ChildCount(int* childCount);
    HRESULT GetChildrenAsNativeArray(IUIAutomationCondition** childArray, int* childArrayCount);
    HRESULT GetChildren(SAFEARRAY** childArray);
}
enum IID_IUIAutomationNotCondition = GUID(0xf528b657, 0x847b, 0x498c, [0x88, 0x96, 0xd5, 0x2b, 0x56, 0x54, 0x7, 0xa1]);
interface IUIAutomationNotCondition : IUIAutomationCondition
{
    HRESULT GetChild(IUIAutomationCondition* condition);
}
enum IID_IUIAutomationCacheRequest = GUID(0xb32a92b5, 0xbc25, 0x4078, [0x9c, 0x8, 0xd7, 0xee, 0x95, 0xc4, 0x8e, 0x3]);
interface IUIAutomationCacheRequest : IUnknown
{
    HRESULT AddProperty(UIA_PROPERTY_ID propertyId);
    HRESULT AddPattern(UIA_PATTERN_ID patternId);
    HRESULT Clone(IUIAutomationCacheRequest* clonedRequest);
    HRESULT get_TreeScope(TreeScope* scope_);
    HRESULT put_TreeScope(TreeScope scope_);
    HRESULT get_TreeFilter(IUIAutomationCondition* filter);
    HRESULT put_TreeFilter(IUIAutomationCondition filter);
    HRESULT get_AutomationElementMode(AutomationElementMode* mode);
    HRESULT put_AutomationElementMode(AutomationElementMode mode);
}
enum IID_IUIAutomationTreeWalker = GUID(0x4042c624, 0x389c, 0x4afc, [0xa6, 0x30, 0x9d, 0xf8, 0x54, 0xa5, 0x41, 0xfc]);
interface IUIAutomationTreeWalker : IUnknown
{
    HRESULT GetParentElement(IUIAutomationElement element, IUIAutomationElement* parent);
    HRESULT GetFirstChildElement(IUIAutomationElement element, IUIAutomationElement* first);
    HRESULT GetLastChildElement(IUIAutomationElement element, IUIAutomationElement* last);
    HRESULT GetNextSiblingElement(IUIAutomationElement element, IUIAutomationElement* next);
    HRESULT GetPreviousSiblingElement(IUIAutomationElement element, IUIAutomationElement* previous);
    HRESULT NormalizeElement(IUIAutomationElement element, IUIAutomationElement* normalized);
    HRESULT GetParentElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* parent);
    HRESULT GetFirstChildElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* first);
    HRESULT GetLastChildElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* last);
    HRESULT GetNextSiblingElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* next);
    HRESULT GetPreviousSiblingElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* previous);
    HRESULT NormalizeElementBuildCache(IUIAutomationElement element, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* normalized);
    HRESULT get_Condition(IUIAutomationCondition* condition);
}
enum IID_IUIAutomationEventHandler = GUID(0x146c3c17, 0xf12e, 0x4e22, [0x8c, 0x27, 0xf8, 0x94, 0xb9, 0xb7, 0x9c, 0x69]);
interface IUIAutomationEventHandler : IUnknown
{
    HRESULT HandleAutomationEvent(IUIAutomationElement sender, UIA_EVENT_ID eventId);
}
enum IID_IUIAutomationPropertyChangedEventHandler = GUID(0x40cd37d4, 0xc756, 0x4b0c, [0x8c, 0x6f, 0xbd, 0xdf, 0xee, 0xb1, 0x3b, 0x50]);
interface IUIAutomationPropertyChangedEventHandler : IUnknown
{
    HRESULT HandlePropertyChangedEvent(IUIAutomationElement sender, UIA_PROPERTY_ID propertyId, VARIANT newValue);
}
enum IID_IUIAutomationStructureChangedEventHandler = GUID(0xe81d1b4e, 0x11c5, 0x42f8, [0x97, 0x54, 0xe7, 0x3, 0x6c, 0x79, 0xf0, 0x54]);
interface IUIAutomationStructureChangedEventHandler : IUnknown
{
    HRESULT HandleStructureChangedEvent(IUIAutomationElement sender, StructureChangeType changeType, SAFEARRAY* runtimeId);
}
enum IID_IUIAutomationFocusChangedEventHandler = GUID(0xc270f6b5, 0x5c69, 0x4290, [0x97, 0x45, 0x7a, 0x7f, 0x97, 0x16, 0x94, 0x68]);
interface IUIAutomationFocusChangedEventHandler : IUnknown
{
    HRESULT HandleFocusChangedEvent(IUIAutomationElement sender);
}
enum IID_IUIAutomationTextEditTextChangedEventHandler = GUID(0x92faa680, 0xe704, 0x4156, [0x93, 0x1a, 0xe3, 0x2d, 0x5b, 0xb3, 0x8f, 0x3f]);
interface IUIAutomationTextEditTextChangedEventHandler : IUnknown
{
    HRESULT HandleTextEditTextChangedEvent(IUIAutomationElement sender, TextEditChangeType textEditChangeType, SAFEARRAY* eventStrings);
}
enum IID_IUIAutomationChangesEventHandler = GUID(0x58edca55, 0x2c3e, 0x4980, [0xb1, 0xb9, 0x56, 0xc1, 0x7f, 0x27, 0xa2, 0xa0]);
interface IUIAutomationChangesEventHandler : IUnknown
{
    HRESULT HandleChangesEvent(IUIAutomationElement sender, UiaChangeInfo* uiaChanges, int changesCount);
}
enum IID_IUIAutomationNotificationEventHandler = GUID(0xc7cb2637, 0xe6c2, 0x4d0c, [0x85, 0xde, 0x49, 0x48, 0xc0, 0x21, 0x75, 0xc7]);
interface IUIAutomationNotificationEventHandler : IUnknown
{
    HRESULT HandleNotificationEvent(IUIAutomationElement sender, NotificationKind notificationKind, NotificationProcessing notificationProcessing, BSTR displayString, BSTR activityId);
}
enum IID_IUIAutomationInvokePattern = GUID(0xfb377fbe, 0x8ea6, 0x46d5, [0x9c, 0x73, 0x64, 0x99, 0x64, 0x2d, 0x30, 0x59]);
interface IUIAutomationInvokePattern : IUnknown
{
    HRESULT Invoke();
}
enum IID_IUIAutomationDockPattern = GUID(0xfde5ef97, 0x1464, 0x48f6, [0x90, 0xbf, 0x43, 0xd0, 0x94, 0x8e, 0x86, 0xec]);
interface IUIAutomationDockPattern : IUnknown
{
    HRESULT SetDockPosition(DockPosition dockPos);
    HRESULT get_CurrentDockPosition(DockPosition* retVal);
    HRESULT get_CachedDockPosition(DockPosition* retVal);
}
enum IID_IUIAutomationExpandCollapsePattern = GUID(0x619be086, 0x1f4e, 0x4ee4, [0xba, 0xfa, 0x21, 0x1, 0x28, 0x73, 0x87, 0x30]);
interface IUIAutomationExpandCollapsePattern : IUnknown
{
    HRESULT Expand();
    HRESULT Collapse();
    HRESULT get_CurrentExpandCollapseState(ExpandCollapseState* retVal);
    HRESULT get_CachedExpandCollapseState(ExpandCollapseState* retVal);
}
enum IID_IUIAutomationGridPattern = GUID(0x414c3cdc, 0x856b, 0x4f5b, [0x85, 0x38, 0x31, 0x31, 0xc6, 0x30, 0x25, 0x50]);
interface IUIAutomationGridPattern : IUnknown
{
    HRESULT GetItem(int row, int column, IUIAutomationElement* element);
    HRESULT get_CurrentRowCount(int* retVal);
    HRESULT get_CurrentColumnCount(int* retVal);
    HRESULT get_CachedRowCount(int* retVal);
    HRESULT get_CachedColumnCount(int* retVal);
}
enum IID_IUIAutomationGridItemPattern = GUID(0x78f8ef57, 0x66c3, 0x4e09, [0xbd, 0x7c, 0xe7, 0x9b, 0x20, 0x4, 0x89, 0x4d]);
interface IUIAutomationGridItemPattern : IUnknown
{
    HRESULT get_CurrentContainingGrid(IUIAutomationElement* retVal);
    HRESULT get_CurrentRow(int* retVal);
    HRESULT get_CurrentColumn(int* retVal);
    HRESULT get_CurrentRowSpan(int* retVal);
    HRESULT get_CurrentColumnSpan(int* retVal);
    HRESULT get_CachedContainingGrid(IUIAutomationElement* retVal);
    HRESULT get_CachedRow(int* retVal);
    HRESULT get_CachedColumn(int* retVal);
    HRESULT get_CachedRowSpan(int* retVal);
    HRESULT get_CachedColumnSpan(int* retVal);
}
enum IID_IUIAutomationMultipleViewPattern = GUID(0x8d253c91, 0x1dc5, 0x4bb5, [0xb1, 0x8f, 0xad, 0xe1, 0x6f, 0xa4, 0x95, 0xe8]);
interface IUIAutomationMultipleViewPattern : IUnknown
{
    HRESULT GetViewName(int view, BSTR* name);
    HRESULT SetCurrentView(int view);
    HRESULT get_CurrentCurrentView(int* retVal);
    HRESULT GetCurrentSupportedViews(SAFEARRAY** retVal);
    HRESULT get_CachedCurrentView(int* retVal);
    HRESULT GetCachedSupportedViews(SAFEARRAY** retVal);
}
enum IID_IUIAutomationObjectModelPattern = GUID(0x71c284b3, 0xc14d, 0x4d14, [0x98, 0x1e, 0x19, 0x75, 0x1b, 0xd, 0x75, 0x6d]);
interface IUIAutomationObjectModelPattern : IUnknown
{
    HRESULT GetUnderlyingObjectModel(IUnknown* retVal);
}
enum IID_IUIAutomationRangeValuePattern = GUID(0x59213f4f, 0x7346, 0x49e5, [0xb1, 0x20, 0x80, 0x55, 0x59, 0x87, 0xa1, 0x48]);
interface IUIAutomationRangeValuePattern : IUnknown
{
    HRESULT SetValue(double val);
    HRESULT get_CurrentValue(double* retVal);
    HRESULT get_CurrentIsReadOnly(BOOL* retVal);
    HRESULT get_CurrentMaximum(double* retVal);
    HRESULT get_CurrentMinimum(double* retVal);
    HRESULT get_CurrentLargeChange(double* retVal);
    HRESULT get_CurrentSmallChange(double* retVal);
    HRESULT get_CachedValue(double* retVal);
    HRESULT get_CachedIsReadOnly(BOOL* retVal);
    HRESULT get_CachedMaximum(double* retVal);
    HRESULT get_CachedMinimum(double* retVal);
    HRESULT get_CachedLargeChange(double* retVal);
    HRESULT get_CachedSmallChange(double* retVal);
}
enum IID_IUIAutomationScrollPattern = GUID(0x88f4d42a, 0xe881, 0x459d, [0xa7, 0x7c, 0x73, 0xbb, 0xbb, 0x7e, 0x2, 0xdc]);
interface IUIAutomationScrollPattern : IUnknown
{
    HRESULT Scroll(ScrollAmount horizontalAmount, ScrollAmount verticalAmount);
    HRESULT SetScrollPercent(double horizontalPercent, double verticalPercent);
    HRESULT get_CurrentHorizontalScrollPercent(double* retVal);
    HRESULT get_CurrentVerticalScrollPercent(double* retVal);
    HRESULT get_CurrentHorizontalViewSize(double* retVal);
    HRESULT get_CurrentVerticalViewSize(double* retVal);
    HRESULT get_CurrentHorizontallyScrollable(BOOL* retVal);
    HRESULT get_CurrentVerticallyScrollable(BOOL* retVal);
    HRESULT get_CachedHorizontalScrollPercent(double* retVal);
    HRESULT get_CachedVerticalScrollPercent(double* retVal);
    HRESULT get_CachedHorizontalViewSize(double* retVal);
    HRESULT get_CachedVerticalViewSize(double* retVal);
    HRESULT get_CachedHorizontallyScrollable(BOOL* retVal);
    HRESULT get_CachedVerticallyScrollable(BOOL* retVal);
}
enum IID_IUIAutomationScrollItemPattern = GUID(0xb488300f, 0xd015, 0x4f19, [0x9c, 0x29, 0xbb, 0x59, 0x5e, 0x36, 0x45, 0xef]);
interface IUIAutomationScrollItemPattern : IUnknown
{
    HRESULT ScrollIntoView();
}
enum IID_IUIAutomationSelectionPattern = GUID(0x5ed5202e, 0xb2ac, 0x47a6, [0xb6, 0x38, 0x4b, 0xb, 0xf1, 0x40, 0xd7, 0x8e]);
interface IUIAutomationSelectionPattern : IUnknown
{
    HRESULT GetCurrentSelection(IUIAutomationElementArray* retVal);
    HRESULT get_CurrentCanSelectMultiple(BOOL* retVal);
    HRESULT get_CurrentIsSelectionRequired(BOOL* retVal);
    HRESULT GetCachedSelection(IUIAutomationElementArray* retVal);
    HRESULT get_CachedCanSelectMultiple(BOOL* retVal);
    HRESULT get_CachedIsSelectionRequired(BOOL* retVal);
}
enum IID_IUIAutomationSelectionPattern2 = GUID(0x532bfae, 0xc011, 0x4e32, [0xa3, 0x43, 0x6d, 0x64, 0x2d, 0x79, 0x85, 0x55]);
interface IUIAutomationSelectionPattern2 : IUIAutomationSelectionPattern
{
    HRESULT get_CurrentFirstSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CurrentLastSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CurrentCurrentSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CurrentItemCount(int* retVal);
    HRESULT get_CachedFirstSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CachedLastSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CachedCurrentSelectedItem(IUIAutomationElement* retVal);
    HRESULT get_CachedItemCount(int* retVal);
}
enum IID_IUIAutomationSelectionItemPattern = GUID(0xa8efa66a, 0xfda, 0x421a, [0x91, 0x94, 0x38, 0x2, 0x1f, 0x35, 0x78, 0xea]);
interface IUIAutomationSelectionItemPattern : IUnknown
{
    HRESULT Select();
    HRESULT AddToSelection();
    HRESULT RemoveFromSelection();
    HRESULT get_CurrentIsSelected(BOOL* retVal);
    HRESULT get_CurrentSelectionContainer(IUIAutomationElement* retVal);
    HRESULT get_CachedIsSelected(BOOL* retVal);
    HRESULT get_CachedSelectionContainer(IUIAutomationElement* retVal);
}
enum IID_IUIAutomationSynchronizedInputPattern = GUID(0x2233be0b, 0xafb7, 0x448b, [0x9f, 0xda, 0x3b, 0x37, 0x8a, 0xa5, 0xea, 0xe1]);
interface IUIAutomationSynchronizedInputPattern : IUnknown
{
    HRESULT StartListening(SynchronizedInputType inputType);
    HRESULT Cancel();
}
enum IID_IUIAutomationTablePattern = GUID(0x620e691c, 0xea96, 0x4710, [0xa8, 0x50, 0x75, 0x4b, 0x24, 0xce, 0x24, 0x17]);
interface IUIAutomationTablePattern : IUnknown
{
    HRESULT GetCurrentRowHeaders(IUIAutomationElementArray* retVal);
    HRESULT GetCurrentColumnHeaders(IUIAutomationElementArray* retVal);
    HRESULT get_CurrentRowOrColumnMajor(RowOrColumnMajor* retVal);
    HRESULT GetCachedRowHeaders(IUIAutomationElementArray* retVal);
    HRESULT GetCachedColumnHeaders(IUIAutomationElementArray* retVal);
    HRESULT get_CachedRowOrColumnMajor(RowOrColumnMajor* retVal);
}
enum IID_IUIAutomationTableItemPattern = GUID(0xb964eb3, 0xef2e, 0x4464, [0x9c, 0x79, 0x61, 0xd6, 0x17, 0x37, 0xa2, 0x7e]);
interface IUIAutomationTableItemPattern : IUnknown
{
    HRESULT GetCurrentRowHeaderItems(IUIAutomationElementArray* retVal);
    HRESULT GetCurrentColumnHeaderItems(IUIAutomationElementArray* retVal);
    HRESULT GetCachedRowHeaderItems(IUIAutomationElementArray* retVal);
    HRESULT GetCachedColumnHeaderItems(IUIAutomationElementArray* retVal);
}
enum IID_IUIAutomationTogglePattern = GUID(0x94cf8058, 0x9b8d, 0x4ab9, [0x8b, 0xfd, 0x4c, 0xd0, 0xa3, 0x3c, 0x8c, 0x70]);
interface IUIAutomationTogglePattern : IUnknown
{
    HRESULT Toggle();
    HRESULT get_CurrentToggleState(ToggleState* retVal);
    HRESULT get_CachedToggleState(ToggleState* retVal);
}
enum IID_IUIAutomationTransformPattern = GUID(0xa9b55844, 0xa55d, 0x4ef0, [0x92, 0x6d, 0x56, 0x9c, 0x16, 0xff, 0x89, 0xbb]);
interface IUIAutomationTransformPattern : IUnknown
{
    HRESULT Move(double x, double y);
    HRESULT Resize(double width, double height);
    HRESULT Rotate(double degrees);
    HRESULT get_CurrentCanMove(BOOL* retVal);
    HRESULT get_CurrentCanResize(BOOL* retVal);
    HRESULT get_CurrentCanRotate(BOOL* retVal);
    HRESULT get_CachedCanMove(BOOL* retVal);
    HRESULT get_CachedCanResize(BOOL* retVal);
    HRESULT get_CachedCanRotate(BOOL* retVal);
}
enum IID_IUIAutomationValuePattern = GUID(0xa94cd8b1, 0x844, 0x4cd6, [0x9d, 0x2d, 0x64, 0x5, 0x37, 0xab, 0x39, 0xe9]);
interface IUIAutomationValuePattern : IUnknown
{
    HRESULT SetValue(BSTR val);
    HRESULT get_CurrentValue(BSTR* retVal);
    HRESULT get_CurrentIsReadOnly(BOOL* retVal);
    HRESULT get_CachedValue(BSTR* retVal);
    HRESULT get_CachedIsReadOnly(BOOL* retVal);
}
enum IID_IUIAutomationWindowPattern = GUID(0xfaef453, 0x9208, 0x43ef, [0xbb, 0xb2, 0x3b, 0x48, 0x51, 0x77, 0x86, 0x4f]);
interface IUIAutomationWindowPattern : IUnknown
{
    HRESULT Close();
    HRESULT WaitForInputIdle(int milliseconds, BOOL* success);
    HRESULT SetWindowVisualState(WindowVisualState state);
    HRESULT get_CurrentCanMaximize(BOOL* retVal);
    HRESULT get_CurrentCanMinimize(BOOL* retVal);
    HRESULT get_CurrentIsModal(BOOL* retVal);
    HRESULT get_CurrentIsTopmost(BOOL* retVal);
    HRESULT get_CurrentWindowVisualState(WindowVisualState* retVal);
    HRESULT get_CurrentWindowInteractionState(WindowInteractionState* retVal);
    HRESULT get_CachedCanMaximize(BOOL* retVal);
    HRESULT get_CachedCanMinimize(BOOL* retVal);
    HRESULT get_CachedIsModal(BOOL* retVal);
    HRESULT get_CachedIsTopmost(BOOL* retVal);
    HRESULT get_CachedWindowVisualState(WindowVisualState* retVal);
    HRESULT get_CachedWindowInteractionState(WindowInteractionState* retVal);
}
enum IID_IUIAutomationTextRange = GUID(0xa543cc6a, 0xf4ae, 0x494b, [0x82, 0x39, 0xc8, 0x14, 0x48, 0x11, 0x87, 0xa8]);
interface IUIAutomationTextRange : IUnknown
{
    HRESULT Clone(IUIAutomationTextRange* clonedRange);
    HRESULT Compare(IUIAutomationTextRange range, BOOL* areSame);
    HRESULT CompareEndpoints(TextPatternRangeEndpoint srcEndPoint, IUIAutomationTextRange range, TextPatternRangeEndpoint targetEndPoint, int* compValue);
    HRESULT ExpandToEnclosingUnit(TextUnit textUnit);
    HRESULT FindAttribute(UIA_TEXTATTRIBUTE_ID attr, VARIANT val, BOOL backward, IUIAutomationTextRange* found);
    HRESULT FindText(BSTR text, BOOL backward, BOOL ignoreCase, IUIAutomationTextRange* found);
    HRESULT GetAttributeValue(UIA_TEXTATTRIBUTE_ID attr, VARIANT* value);
    HRESULT GetBoundingRectangles(SAFEARRAY** boundingRects);
    HRESULT GetEnclosingElement(IUIAutomationElement* enclosingElement);
    HRESULT GetText(int maxLength, BSTR* text);
    HRESULT Move(TextUnit unit, int count, int* moved);
    HRESULT MoveEndpointByUnit(TextPatternRangeEndpoint endpoint, TextUnit unit, int count, int* moved);
    HRESULT MoveEndpointByRange(TextPatternRangeEndpoint srcEndPoint, IUIAutomationTextRange range, TextPatternRangeEndpoint targetEndPoint);
    HRESULT Select();
    HRESULT AddToSelection();
    HRESULT RemoveFromSelection();
    HRESULT ScrollIntoView(BOOL alignToTop);
    HRESULT GetChildren(IUIAutomationElementArray* children);
}
enum IID_IUIAutomationTextRange2 = GUID(0xbb9b40e0, 0x5e04, 0x46bd, [0x9b, 0xe0, 0x4b, 0x60, 0x1b, 0x9a, 0xfa, 0xd4]);
interface IUIAutomationTextRange2 : IUIAutomationTextRange
{
    HRESULT ShowContextMenu();
}
enum IID_IUIAutomationTextRange3 = GUID(0x6a315d69, 0x5512, 0x4c2e, [0x85, 0xf0, 0x53, 0xfc, 0xe6, 0xdd, 0x4b, 0xc2]);
interface IUIAutomationTextRange3 : IUIAutomationTextRange2
{
    HRESULT GetEnclosingElementBuildCache(IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* enclosingElement);
    HRESULT GetChildrenBuildCache(IUIAutomationCacheRequest cacheRequest, IUIAutomationElementArray* children);
    HRESULT GetAttributeValues(const(UIA_TEXTATTRIBUTE_ID)* attributeIds, int attributeIdCount, SAFEARRAY** attributeValues);
}
enum IID_IUIAutomationTextRangeArray = GUID(0xce4ae76a, 0xe717, 0x4c98, [0x81, 0xea, 0x47, 0x37, 0x1d, 0x2, 0x8e, 0xb6]);
interface IUIAutomationTextRangeArray : IUnknown
{
    HRESULT get_Length(int* length);
    HRESULT GetElement(int index, IUIAutomationTextRange* element);
}
enum IID_IUIAutomationTextPattern = GUID(0x32eba289, 0x3583, 0x42c9, [0x9c, 0x59, 0x3b, 0x6d, 0x9a, 0x1e, 0x9b, 0x6a]);
interface IUIAutomationTextPattern : IUnknown
{
    HRESULT RangeFromPoint(POINT pt, IUIAutomationTextRange* range);
    HRESULT RangeFromChild(IUIAutomationElement child, IUIAutomationTextRange* range);
    HRESULT GetSelection(IUIAutomationTextRangeArray* ranges);
    HRESULT GetVisibleRanges(IUIAutomationTextRangeArray* ranges);
    HRESULT get_DocumentRange(IUIAutomationTextRange* range);
    HRESULT get_SupportedTextSelection(SupportedTextSelection* supportedTextSelection);
}
enum IID_IUIAutomationTextPattern2 = GUID(0x506a921a, 0xfcc9, 0x409f, [0xb2, 0x3b, 0x37, 0xeb, 0x74, 0x10, 0x68, 0x72]);
interface IUIAutomationTextPattern2 : IUIAutomationTextPattern
{
    HRESULT RangeFromAnnotation(IUIAutomationElement annotation, IUIAutomationTextRange* range);
    HRESULT GetCaretRange(BOOL* isActive, IUIAutomationTextRange* range);
}
enum IID_IUIAutomationTextEditPattern = GUID(0x17e21576, 0x996c, 0x4870, [0x99, 0xd9, 0xbf, 0xf3, 0x23, 0x38, 0xc, 0x6]);
interface IUIAutomationTextEditPattern : IUIAutomationTextPattern
{
    HRESULT GetActiveComposition(IUIAutomationTextRange* range);
    HRESULT GetConversionTarget(IUIAutomationTextRange* range);
}
enum IID_IUIAutomationCustomNavigationPattern = GUID(0x1ea217a, 0x1766, 0x47ed, [0xa6, 0xcc, 0xac, 0xf4, 0x92, 0x85, 0x4b, 0x1f]);
interface IUIAutomationCustomNavigationPattern : IUnknown
{
    HRESULT Navigate(NavigateDirection direction, IUIAutomationElement* pRetVal);
}
enum IID_IUIAutomationActiveTextPositionChangedEventHandler = GUID(0xf97933b0, 0x8dae, 0x4496, [0x89, 0x97, 0x5b, 0xa0, 0x15, 0xfe, 0xd, 0x82]);
interface IUIAutomationActiveTextPositionChangedEventHandler : IUnknown
{
    HRESULT HandleActiveTextPositionChangedEvent(IUIAutomationElement sender, IUIAutomationTextRange range);
}
enum IID_IUIAutomationLegacyIAccessiblePattern = GUID(0x828055ad, 0x355b, 0x4435, [0x86, 0xd5, 0x3b, 0x51, 0xc1, 0x4a, 0x9b, 0x1b]);
interface IUIAutomationLegacyIAccessiblePattern : IUnknown
{
    HRESULT Select(int flagsSelect);
    HRESULT DoDefaultAction();
    HRESULT SetValue(const(wchar)* szValue);
    HRESULT get_CurrentChildId(int* pRetVal);
    HRESULT get_CurrentName(BSTR* pszName);
    HRESULT get_CurrentValue(BSTR* pszValue);
    HRESULT get_CurrentDescription(BSTR* pszDescription);
    HRESULT get_CurrentRole(uint* pdwRole);
    HRESULT get_CurrentState(uint* pdwState);
    HRESULT get_CurrentHelp(BSTR* pszHelp);
    HRESULT get_CurrentKeyboardShortcut(BSTR* pszKeyboardShortcut);
    HRESULT GetCurrentSelection(IUIAutomationElementArray* pvarSelectedChildren);
    HRESULT get_CurrentDefaultAction(BSTR* pszDefaultAction);
    HRESULT get_CachedChildId(int* pRetVal);
    HRESULT get_CachedName(BSTR* pszName);
    HRESULT get_CachedValue(BSTR* pszValue);
    HRESULT get_CachedDescription(BSTR* pszDescription);
    HRESULT get_CachedRole(uint* pdwRole);
    HRESULT get_CachedState(uint* pdwState);
    HRESULT get_CachedHelp(BSTR* pszHelp);
    HRESULT get_CachedKeyboardShortcut(BSTR* pszKeyboardShortcut);
    HRESULT GetCachedSelection(IUIAutomationElementArray* pvarSelectedChildren);
    HRESULT get_CachedDefaultAction(BSTR* pszDefaultAction);
    HRESULT GetIAccessible(IAccessible* ppAccessible);
}
enum IID_IUIAutomationItemContainerPattern = GUID(0xc690fdb2, 0x27a8, 0x423c, [0x81, 0x2d, 0x42, 0x97, 0x73, 0xc9, 0x8, 0x4e]);
interface IUIAutomationItemContainerPattern : IUnknown
{
    HRESULT FindItemByProperty(IUIAutomationElement pStartAfter, UIA_PROPERTY_ID propertyId, VARIANT value, IUIAutomationElement* pFound);
}
enum IID_IUIAutomationVirtualizedItemPattern = GUID(0x6ba3d7a6, 0x4cf, 0x4f11, [0x87, 0x93, 0xa8, 0xd1, 0xcd, 0xe9, 0x96, 0x9f]);
interface IUIAutomationVirtualizedItemPattern : IUnknown
{
    HRESULT Realize();
}
enum IID_IUIAutomationAnnotationPattern = GUID(0x9a175b21, 0x339e, 0x41b1, [0x8e, 0x8b, 0x62, 0x3f, 0x6b, 0x68, 0x10, 0x98]);
interface IUIAutomationAnnotationPattern : IUnknown
{
    HRESULT get_CurrentAnnotationTypeId(UIA_ANNOTATIONTYPE* retVal);
    HRESULT get_CurrentAnnotationTypeName(BSTR* retVal);
    HRESULT get_CurrentAuthor(BSTR* retVal);
    HRESULT get_CurrentDateTime(BSTR* retVal);
    HRESULT get_CurrentTarget(IUIAutomationElement* retVal);
    HRESULT get_CachedAnnotationTypeId(UIA_ANNOTATIONTYPE* retVal);
    HRESULT get_CachedAnnotationTypeName(BSTR* retVal);
    HRESULT get_CachedAuthor(BSTR* retVal);
    HRESULT get_CachedDateTime(BSTR* retVal);
    HRESULT get_CachedTarget(IUIAutomationElement* retVal);
}
enum IID_IUIAutomationStylesPattern = GUID(0x85b5f0a2, 0xbd79, 0x484a, [0xad, 0x2b, 0x38, 0x8c, 0x98, 0x38, 0xd5, 0xfb]);
interface IUIAutomationStylesPattern : IUnknown
{
    HRESULT get_CurrentStyleId(UIA_STYLE_ID* retVal);
    HRESULT get_CurrentStyleName(BSTR* retVal);
    HRESULT get_CurrentFillColor(int* retVal);
    HRESULT get_CurrentFillPatternStyle(BSTR* retVal);
    HRESULT get_CurrentShape(BSTR* retVal);
    HRESULT get_CurrentFillPatternColor(int* retVal);
    HRESULT get_CurrentExtendedProperties(BSTR* retVal);
    HRESULT GetCurrentExtendedPropertiesAsArray(ExtendedProperty** propertyArray, int* propertyCount);
    HRESULT get_CachedStyleId(UIA_STYLE_ID* retVal);
    HRESULT get_CachedStyleName(BSTR* retVal);
    HRESULT get_CachedFillColor(int* retVal);
    HRESULT get_CachedFillPatternStyle(BSTR* retVal);
    HRESULT get_CachedShape(BSTR* retVal);
    HRESULT get_CachedFillPatternColor(int* retVal);
    HRESULT get_CachedExtendedProperties(BSTR* retVal);
    HRESULT GetCachedExtendedPropertiesAsArray(ExtendedProperty** propertyArray, int* propertyCount);
}
enum IID_IUIAutomationSpreadsheetPattern = GUID(0x7517a7c8, 0xfaae, 0x4de9, [0x9f, 0x8, 0x29, 0xb9, 0x1e, 0x85, 0x95, 0xc1]);
interface IUIAutomationSpreadsheetPattern : IUnknown
{
    HRESULT GetItemByName(BSTR name, IUIAutomationElement* element);
}
enum IID_IUIAutomationSpreadsheetItemPattern = GUID(0x7d4fb86c, 0x8d34, 0x40e1, [0x8e, 0x83, 0x62, 0xc1, 0x52, 0x4, 0xe3, 0x35]);
interface IUIAutomationSpreadsheetItemPattern : IUnknown
{
    HRESULT get_CurrentFormula(BSTR* retVal);
    HRESULT GetCurrentAnnotationObjects(IUIAutomationElementArray* retVal);
    HRESULT GetCurrentAnnotationTypes(SAFEARRAY** retVal);
    HRESULT get_CachedFormula(BSTR* retVal);
    HRESULT GetCachedAnnotationObjects(IUIAutomationElementArray* retVal);
    HRESULT GetCachedAnnotationTypes(SAFEARRAY** retVal);
}
enum IID_IUIAutomationTransformPattern2 = GUID(0x6d74d017, 0x6ecb, 0x4381, [0xb3, 0x8b, 0x3c, 0x17, 0xa4, 0x8f, 0xf1, 0xc2]);
interface IUIAutomationTransformPattern2 : IUIAutomationTransformPattern
{
    HRESULT Zoom(double zoomValue);
    HRESULT ZoomByUnit(ZoomUnit zoomUnit);
    HRESULT get_CurrentCanZoom(BOOL* retVal);
    HRESULT get_CachedCanZoom(BOOL* retVal);
    HRESULT get_CurrentZoomLevel(double* retVal);
    HRESULT get_CachedZoomLevel(double* retVal);
    HRESULT get_CurrentZoomMinimum(double* retVal);
    HRESULT get_CachedZoomMinimum(double* retVal);
    HRESULT get_CurrentZoomMaximum(double* retVal);
    HRESULT get_CachedZoomMaximum(double* retVal);
}
enum IID_IUIAutomationTextChildPattern = GUID(0x6552b038, 0xae05, 0x40c8, [0xab, 0xfd, 0xaa, 0x8, 0x35, 0x2a, 0xab, 0x86]);
interface IUIAutomationTextChildPattern : IUnknown
{
    HRESULT get_TextContainer(IUIAutomationElement* container);
    HRESULT get_TextRange(IUIAutomationTextRange* range);
}
enum IID_IUIAutomationDragPattern = GUID(0x1dc7b570, 0x1f54, 0x4bad, [0xbc, 0xda, 0xd3, 0x6a, 0x72, 0x2f, 0xb7, 0xbd]);
interface IUIAutomationDragPattern : IUnknown
{
    HRESULT get_CurrentIsGrabbed(BOOL* retVal);
    HRESULT get_CachedIsGrabbed(BOOL* retVal);
    HRESULT get_CurrentDropEffect(BSTR* retVal);
    HRESULT get_CachedDropEffect(BSTR* retVal);
    HRESULT get_CurrentDropEffects(SAFEARRAY** retVal);
    HRESULT get_CachedDropEffects(SAFEARRAY** retVal);
    HRESULT GetCurrentGrabbedItems(IUIAutomationElementArray* retVal);
    HRESULT GetCachedGrabbedItems(IUIAutomationElementArray* retVal);
}
enum IID_IUIAutomationDropTargetPattern = GUID(0x69a095f7, 0xeee4, 0x430e, [0xa4, 0x6b, 0xfb, 0x73, 0xb1, 0xae, 0x39, 0xa5]);
interface IUIAutomationDropTargetPattern : IUnknown
{
    HRESULT get_CurrentDropTargetEffect(BSTR* retVal);
    HRESULT get_CachedDropTargetEffect(BSTR* retVal);
    HRESULT get_CurrentDropTargetEffects(SAFEARRAY** retVal);
    HRESULT get_CachedDropTargetEffects(SAFEARRAY** retVal);
}
enum IID_IUIAutomationElement2 = GUID(0x6749c683, 0xf70d, 0x4487, [0xa6, 0x98, 0x5f, 0x79, 0xd5, 0x52, 0x90, 0xd6]);
interface IUIAutomationElement2 : IUIAutomationElement
{
    HRESULT get_CurrentOptimizeForVisualContent(BOOL* retVal);
    HRESULT get_CachedOptimizeForVisualContent(BOOL* retVal);
    HRESULT get_CurrentLiveSetting(LiveSetting* retVal);
    HRESULT get_CachedLiveSetting(LiveSetting* retVal);
    HRESULT get_CurrentFlowsFrom(IUIAutomationElementArray* retVal);
    HRESULT get_CachedFlowsFrom(IUIAutomationElementArray* retVal);
}
enum IID_IUIAutomationElement3 = GUID(0x8471df34, 0xaee0, 0x4a01, [0xa7, 0xde, 0x7d, 0xb9, 0xaf, 0x12, 0xc2, 0x96]);
interface IUIAutomationElement3 : IUIAutomationElement2
{
    HRESULT ShowContextMenu();
    HRESULT get_CurrentIsPeripheral(BOOL* retVal);
    HRESULT get_CachedIsPeripheral(BOOL* retVal);
}
enum IID_IUIAutomationElement4 = GUID(0x3b6e233c, 0x52fb, 0x4063, [0xa4, 0xc9, 0x77, 0xc0, 0x75, 0xc2, 0xa0, 0x6b]);
interface IUIAutomationElement4 : IUIAutomationElement3
{
    HRESULT get_CurrentPositionInSet(int* retVal);
    HRESULT get_CurrentSizeOfSet(int* retVal);
    HRESULT get_CurrentLevel(int* retVal);
    HRESULT get_CurrentAnnotationTypes(SAFEARRAY** retVal);
    HRESULT get_CurrentAnnotationObjects(IUIAutomationElementArray* retVal);
    HRESULT get_CachedPositionInSet(int* retVal);
    HRESULT get_CachedSizeOfSet(int* retVal);
    HRESULT get_CachedLevel(int* retVal);
    HRESULT get_CachedAnnotationTypes(SAFEARRAY** retVal);
    HRESULT get_CachedAnnotationObjects(IUIAutomationElementArray* retVal);
}
enum IID_IUIAutomationElement5 = GUID(0x98141c1d, 0xd0e, 0x4175, [0xbb, 0xe2, 0x6b, 0xff, 0x45, 0x58, 0x42, 0xa7]);
interface IUIAutomationElement5 : IUIAutomationElement4
{
    HRESULT get_CurrentLandmarkType(UIA_LANDMARKTYPE_ID* retVal);
    HRESULT get_CurrentLocalizedLandmarkType(BSTR* retVal);
    HRESULT get_CachedLandmarkType(UIA_LANDMARKTYPE_ID* retVal);
    HRESULT get_CachedLocalizedLandmarkType(BSTR* retVal);
}
enum IID_IUIAutomationElement6 = GUID(0x4780d450, 0x8bca, 0x4977, [0xaf, 0xa5, 0xa4, 0xa5, 0x17, 0xf5, 0x55, 0xe3]);
interface IUIAutomationElement6 : IUIAutomationElement5
{
    HRESULT get_CurrentFullDescription(BSTR* retVal);
    HRESULT get_CachedFullDescription(BSTR* retVal);
}
enum IID_IUIAutomationElement7 = GUID(0x204e8572, 0xcfc3, 0x4c11, [0xb0, 0xc8, 0x7d, 0xa7, 0x42, 0x7, 0x50, 0xb7]);
interface IUIAutomationElement7 : IUIAutomationElement6
{
    HRESULT FindFirstWithOptions(TreeScope scope_, IUIAutomationCondition condition, TreeTraversalOptions traversalOptions, IUIAutomationElement root, IUIAutomationElement* found);
    HRESULT FindAllWithOptions(TreeScope scope_, IUIAutomationCondition condition, TreeTraversalOptions traversalOptions, IUIAutomationElement root, IUIAutomationElementArray* found);
    HRESULT FindFirstWithOptionsBuildCache(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationCacheRequest cacheRequest, TreeTraversalOptions traversalOptions, IUIAutomationElement root, IUIAutomationElement* found);
    HRESULT FindAllWithOptionsBuildCache(TreeScope scope_, IUIAutomationCondition condition, IUIAutomationCacheRequest cacheRequest, TreeTraversalOptions traversalOptions, IUIAutomationElement root, IUIAutomationElementArray* found);
    HRESULT GetCurrentMetadataValue(int targetId, UIA_METADATA_ID metadataId, VARIANT* returnVal);
}
enum IID_IUIAutomationElement8 = GUID(0x8c60217d, 0x5411, 0x4cde, [0xbc, 0xc0, 0x1c, 0xed, 0xa2, 0x23, 0x83, 0xc]);
interface IUIAutomationElement8 : IUIAutomationElement7
{
    HRESULT get_CurrentHeadingLevel(UIA_HEADINGLEVEL_ID* retVal);
    HRESULT get_CachedHeadingLevel(UIA_HEADINGLEVEL_ID* retVal);
}
enum IID_IUIAutomationElement9 = GUID(0x39325fac, 0x39d, 0x440e, [0xa3, 0xa3, 0x5e, 0xb8, 0x1a, 0x5c, 0xec, 0xc3]);
interface IUIAutomationElement9 : IUIAutomationElement8
{
    HRESULT get_CurrentIsDialog(BOOL* retVal);
    HRESULT get_CachedIsDialog(BOOL* retVal);
}
enum IID_IUIAutomationProxyFactory = GUID(0x85b94ecd, 0x849d, 0x42b6, [0xb9, 0x4d, 0xd6, 0xdb, 0x23, 0xfd, 0xf5, 0xa4]);
interface IUIAutomationProxyFactory : IUnknown
{
    HRESULT CreateProvider(HWND hwnd, int idObject, int idChild, IRawElementProviderSimple* provider);
    HRESULT get_ProxyFactoryId(BSTR* factoryId);
}
enum IID_IUIAutomationProxyFactoryEntry = GUID(0xd50e472e, 0xb64b, 0x490c, [0xbc, 0xa1, 0xd3, 0x6, 0x96, 0xf9, 0xf2, 0x89]);
interface IUIAutomationProxyFactoryEntry : IUnknown
{
    HRESULT get_ProxyFactory(IUIAutomationProxyFactory* factory);
    HRESULT get_ClassName(BSTR* className);
    HRESULT get_ImageName(BSTR* imageName);
    HRESULT get_AllowSubstringMatch(BOOL* allowSubstringMatch);
    HRESULT get_CanCheckBaseClass(BOOL* canCheckBaseClass);
    HRESULT get_NeedsAdviseEvents(BOOL* adviseEvents);
    HRESULT put_ClassName(const(wchar)* className);
    HRESULT put_ImageName(const(wchar)* imageName);
    HRESULT put_AllowSubstringMatch(BOOL allowSubstringMatch);
    HRESULT put_CanCheckBaseClass(BOOL canCheckBaseClass);
    HRESULT put_NeedsAdviseEvents(BOOL adviseEvents);
    HRESULT SetWinEventsForAutomationEvent(UIA_EVENT_ID eventId, UIA_PROPERTY_ID propertyId, SAFEARRAY* winEvents);
    HRESULT GetWinEventsForAutomationEvent(UIA_EVENT_ID eventId, UIA_PROPERTY_ID propertyId, SAFEARRAY** winEvents);
}
enum IID_IUIAutomationProxyFactoryMapping = GUID(0x9e31e18, 0x872d, 0x4873, [0x93, 0xd1, 0x1e, 0x54, 0x1e, 0xc1, 0x33, 0xfd]);
interface IUIAutomationProxyFactoryMapping : IUnknown
{
    HRESULT get_Count(uint* count);
    HRESULT GetTable(SAFEARRAY** table);
    HRESULT GetEntry(uint index, IUIAutomationProxyFactoryEntry* entry);
    HRESULT SetTable(SAFEARRAY* factoryList);
    HRESULT InsertEntries(uint before, SAFEARRAY* factoryList);
    HRESULT InsertEntry(uint before, IUIAutomationProxyFactoryEntry factory);
    HRESULT RemoveEntry(uint index);
    HRESULT ClearTable();
    HRESULT RestoreDefaultTable();
}
enum IID_IUIAutomationEventHandlerGroup = GUID(0xc9ee12f2, 0xc13b, 0x4408, [0x99, 0x7c, 0x63, 0x99, 0x14, 0x37, 0x7f, 0x4e]);
interface IUIAutomationEventHandlerGroup : IUnknown
{
    HRESULT AddActiveTextPositionChangedEventHandler(TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationActiveTextPositionChangedEventHandler handler);
    HRESULT AddAutomationEventHandler(UIA_EVENT_ID eventId, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationEventHandler handler);
    HRESULT AddChangesEventHandler(TreeScope scope_, int* changeTypes, int changesCount, IUIAutomationCacheRequest cacheRequest, IUIAutomationChangesEventHandler handler);
    HRESULT AddNotificationEventHandler(TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationNotificationEventHandler handler);
    HRESULT AddPropertyChangedEventHandler(TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationPropertyChangedEventHandler handler, UIA_PROPERTY_ID* propertyArray, int propertyCount);
    HRESULT AddStructureChangedEventHandler(TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationStructureChangedEventHandler handler);
    HRESULT AddTextEditTextChangedEventHandler(TreeScope scope_, TextEditChangeType textEditChangeType, IUIAutomationCacheRequest cacheRequest, IUIAutomationTextEditTextChangedEventHandler handler);
}
enum IID_IUIAutomation = GUID(0x30cbe57d, 0xd9d0, 0x452a, [0xab, 0x13, 0x7a, 0xc5, 0xac, 0x48, 0x25, 0xee]);
interface IUIAutomation : IUnknown
{
    HRESULT CompareElements(IUIAutomationElement el1, IUIAutomationElement el2, BOOL* areSame);
    HRESULT CompareRuntimeIds(SAFEARRAY* runtimeId1, SAFEARRAY* runtimeId2, BOOL* areSame);
    HRESULT GetRootElement(IUIAutomationElement* root);
    HRESULT ElementFromHandle(HWND hwnd, IUIAutomationElement* element);
    HRESULT ElementFromPoint(POINT pt, IUIAutomationElement* element);
    HRESULT GetFocusedElement(IUIAutomationElement* element);
    HRESULT GetRootElementBuildCache(IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* root);
    HRESULT ElementFromHandleBuildCache(HWND hwnd, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* element);
    HRESULT ElementFromPointBuildCache(POINT pt, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* element);
    HRESULT GetFocusedElementBuildCache(IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* element);
    HRESULT CreateTreeWalker(IUIAutomationCondition pCondition, IUIAutomationTreeWalker* walker);
    HRESULT get_ControlViewWalker(IUIAutomationTreeWalker* walker);
    HRESULT get_ContentViewWalker(IUIAutomationTreeWalker* walker);
    HRESULT get_RawViewWalker(IUIAutomationTreeWalker* walker);
    HRESULT get_RawViewCondition(IUIAutomationCondition* condition);
    HRESULT get_ControlViewCondition(IUIAutomationCondition* condition);
    HRESULT get_ContentViewCondition(IUIAutomationCondition* condition);
    HRESULT CreateCacheRequest(IUIAutomationCacheRequest* cacheRequest);
    HRESULT CreateTrueCondition(IUIAutomationCondition* newCondition);
    HRESULT CreateFalseCondition(IUIAutomationCondition* newCondition);
    HRESULT CreatePropertyCondition(UIA_PROPERTY_ID propertyId, VARIANT value, IUIAutomationCondition* newCondition);
    HRESULT CreatePropertyConditionEx(UIA_PROPERTY_ID propertyId, VARIANT value, PropertyConditionFlags flags, IUIAutomationCondition* newCondition);
    HRESULT CreateAndCondition(IUIAutomationCondition condition1, IUIAutomationCondition condition2, IUIAutomationCondition* newCondition);
    HRESULT CreateAndConditionFromArray(SAFEARRAY* conditions, IUIAutomationCondition* newCondition);
    HRESULT CreateAndConditionFromNativeArray(IUIAutomationCondition* conditions, int conditionCount, IUIAutomationCondition* newCondition);
    HRESULT CreateOrCondition(IUIAutomationCondition condition1, IUIAutomationCondition condition2, IUIAutomationCondition* newCondition);
    HRESULT CreateOrConditionFromArray(SAFEARRAY* conditions, IUIAutomationCondition* newCondition);
    HRESULT CreateOrConditionFromNativeArray(IUIAutomationCondition* conditions, int conditionCount, IUIAutomationCondition* newCondition);
    HRESULT CreateNotCondition(IUIAutomationCondition condition, IUIAutomationCondition* newCondition);
    HRESULT AddAutomationEventHandler(UIA_EVENT_ID eventId, IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationEventHandler handler);
    HRESULT RemoveAutomationEventHandler(UIA_EVENT_ID eventId, IUIAutomationElement element, IUIAutomationEventHandler handler);
    HRESULT AddPropertyChangedEventHandlerNativeArray(IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationPropertyChangedEventHandler handler, UIA_PROPERTY_ID* propertyArray, int propertyCount);
    HRESULT AddPropertyChangedEventHandler(IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationPropertyChangedEventHandler handler, SAFEARRAY* propertyArray);
    HRESULT RemovePropertyChangedEventHandler(IUIAutomationElement element, IUIAutomationPropertyChangedEventHandler handler);
    HRESULT AddStructureChangedEventHandler(IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationStructureChangedEventHandler handler);
    HRESULT RemoveStructureChangedEventHandler(IUIAutomationElement element, IUIAutomationStructureChangedEventHandler handler);
    HRESULT AddFocusChangedEventHandler(IUIAutomationCacheRequest cacheRequest, IUIAutomationFocusChangedEventHandler handler);
    HRESULT RemoveFocusChangedEventHandler(IUIAutomationFocusChangedEventHandler handler);
    HRESULT RemoveAllEventHandlers();
    HRESULT IntNativeArrayToSafeArray(int* array, int arrayCount, SAFEARRAY** safeArray);
    HRESULT IntSafeArrayToNativeArray(SAFEARRAY* intArray, int** array, int* arrayCount);
    HRESULT RectToVariant(RECT rc, VARIANT* var);
    HRESULT VariantToRect(VARIANT var, RECT* rc);
    HRESULT SafeArrayToRectNativeArray(SAFEARRAY* rects, RECT** rectArray, int* rectArrayCount);
    HRESULT CreateProxyFactoryEntry(IUIAutomationProxyFactory factory, IUIAutomationProxyFactoryEntry* factoryEntry);
    HRESULT get_ProxyFactoryMapping(IUIAutomationProxyFactoryMapping* factoryMapping);
    HRESULT GetPropertyProgrammaticName(UIA_PROPERTY_ID property, BSTR* name);
    HRESULT GetPatternProgrammaticName(UIA_PATTERN_ID pattern, BSTR* name);
    HRESULT PollForPotentialSupportedPatterns(IUIAutomationElement pElement, SAFEARRAY** patternIds, SAFEARRAY** patternNames);
    HRESULT PollForPotentialSupportedProperties(IUIAutomationElement pElement, SAFEARRAY** propertyIds, SAFEARRAY** propertyNames);
    HRESULT CheckNotSupported(VARIANT value, BOOL* isNotSupported);
    HRESULT get_ReservedNotSupportedValue(IUnknown* notSupportedValue);
    HRESULT get_ReservedMixedAttributeValue(IUnknown* mixedAttributeValue);
    HRESULT ElementFromIAccessible(IAccessible accessible, int childId, IUIAutomationElement* element);
    HRESULT ElementFromIAccessibleBuildCache(IAccessible accessible, int childId, IUIAutomationCacheRequest cacheRequest, IUIAutomationElement* element);
}
enum IID_IUIAutomation2 = GUID(0x34723aff, 0xc9d, 0x49d0, [0x98, 0x96, 0x7a, 0xb5, 0x2d, 0xf8, 0xcd, 0x8a]);
interface IUIAutomation2 : IUIAutomation
{
    HRESULT get_AutoSetFocus(BOOL* autoSetFocus);
    HRESULT put_AutoSetFocus(BOOL autoSetFocus);
    HRESULT get_ConnectionTimeout(uint* timeout);
    HRESULT put_ConnectionTimeout(uint timeout);
    HRESULT get_TransactionTimeout(uint* timeout);
    HRESULT put_TransactionTimeout(uint timeout);
}
enum IID_IUIAutomation3 = GUID(0x73d768da, 0x9b51, 0x4b89, [0x93, 0x6e, 0xc2, 0x9, 0x29, 0x9, 0x73, 0xe7]);
interface IUIAutomation3 : IUIAutomation2
{
    HRESULT AddTextEditTextChangedEventHandler(IUIAutomationElement element, TreeScope scope_, TextEditChangeType textEditChangeType, IUIAutomationCacheRequest cacheRequest, IUIAutomationTextEditTextChangedEventHandler handler);
    HRESULT RemoveTextEditTextChangedEventHandler(IUIAutomationElement element, IUIAutomationTextEditTextChangedEventHandler handler);
}
enum IID_IUIAutomation4 = GUID(0x1189c02a, 0x5f8, 0x4319, [0x8e, 0x21, 0xe8, 0x17, 0xe3, 0xdb, 0x28, 0x60]);
interface IUIAutomation4 : IUIAutomation3
{
    HRESULT AddChangesEventHandler(IUIAutomationElement element, TreeScope scope_, int* changeTypes, int changesCount, IUIAutomationCacheRequest pCacheRequest, IUIAutomationChangesEventHandler handler);
    HRESULT RemoveChangesEventHandler(IUIAutomationElement element, IUIAutomationChangesEventHandler handler);
}
enum IID_IUIAutomation5 = GUID(0x25f700c8, 0xd816, 0x4057, [0xa9, 0xdc, 0x3c, 0xbd, 0xee, 0x77, 0xe2, 0x56]);
interface IUIAutomation5 : IUIAutomation4
{
    HRESULT AddNotificationEventHandler(IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationNotificationEventHandler handler);
    HRESULT RemoveNotificationEventHandler(IUIAutomationElement element, IUIAutomationNotificationEventHandler handler);
}
enum IID_IUIAutomation6 = GUID(0xaae072da, 0x29e3, 0x413d, [0x87, 0xa7, 0x19, 0x2d, 0xbf, 0x81, 0xed, 0x10]);
interface IUIAutomation6 : IUIAutomation5
{
    HRESULT CreateEventHandlerGroup(IUIAutomationEventHandlerGroup* handlerGroup);
    HRESULT AddEventHandlerGroup(IUIAutomationElement element, IUIAutomationEventHandlerGroup handlerGroup);
    HRESULT RemoveEventHandlerGroup(IUIAutomationElement element, IUIAutomationEventHandlerGroup handlerGroup);
    HRESULT get_ConnectionRecoveryBehavior(ConnectionRecoveryBehaviorOptions* connectionRecoveryBehaviorOptions);
    HRESULT put_ConnectionRecoveryBehavior(ConnectionRecoveryBehaviorOptions connectionRecoveryBehaviorOptions);
    HRESULT get_CoalesceEvents(CoalesceEventsOptions* coalesceEventsOptions);
    HRESULT put_CoalesceEvents(CoalesceEventsOptions coalesceEventsOptions);
    HRESULT AddActiveTextPositionChangedEventHandler(IUIAutomationElement element, TreeScope scope_, IUIAutomationCacheRequest cacheRequest, IUIAutomationActiveTextPositionChangedEventHandler handler);
    HRESULT RemoveActiveTextPositionChangedEventHandler(IUIAutomationElement element, IUIAutomationActiveTextPositionChangedEventHandler handler);
}
enum CLSID_CUIAutomation = GUID(0xff48dba4, 0x60ef, 0x4201, [0xaa, 0x87, 0x54, 0x10, 0x3e, 0xef, 0x59, 0x4e]);
struct CUIAutomation
{
}
enum CLSID_CUIAutomation8 = GUID(0xe22ad333, 0xb25f, 0x460c, [0x83, 0xd0, 0x5, 0x81, 0x10, 0x73, 0x95, 0xc9]);
struct CUIAutomation8
{
}
alias ConditionType = int;
enum : int
{
    ConditionType_True     = 0x00000000,
    ConditionType_False    = 0x00000001,
    ConditionType_Property = 0x00000002,
    ConditionType_And      = 0x00000003,
    ConditionType_Or       = 0x00000004,
    ConditionType_Not      = 0x00000005,
}

struct UiaCondition
{
    ConditionType ConditionType_;
}
struct UiaPropertyCondition
{
    ConditionType ConditionType_;
    UIA_PROPERTY_ID PropertyId;
    VARIANT Value;
    PropertyConditionFlags Flags;
}
struct UiaAndOrCondition
{
    ConditionType ConditionType_;
    UiaCondition** ppConditions;
    int cConditions;
}
struct UiaNotCondition
{
    ConditionType ConditionType_;
    UiaCondition* pCondition;
}
struct UiaCacheRequest
{
    UiaCondition* pViewCondition;
    TreeScope Scope;
    int* pProperties;
    int cProperties;
    int* pPatterns;
    int cPatterns;
    AutomationElementMode automationElementMode;
}
alias NormalizeState = int;
enum : int
{
    NormalizeState_None   = 0x00000000,
    NormalizeState_View   = 0x00000001,
    NormalizeState_Custom = 0x00000002,
}

struct UiaFindParams
{
    int MaxDepth;
    BOOL FindFirst;
    BOOL ExcludeRoot;
    UiaCondition* pFindCondition;
}
alias ProviderType = int;
enum : int
{
    ProviderType_BaseHwnd      = 0x00000000,
    ProviderType_Proxy         = 0x00000001,
    ProviderType_NonClientArea = 0x00000002,
}

alias UiaProviderCallback = SAFEARRAY* function(HWND hwnd, ProviderType providerType);
alias AutomationIdentifierType = int;
enum : int
{
    AutomationIdentifierType_Property      = 0x00000000,
    AutomationIdentifierType_Pattern       = 0x00000001,
    AutomationIdentifierType_Event         = 0x00000002,
    AutomationIdentifierType_ControlType   = 0x00000003,
    AutomationIdentifierType_TextAttribute = 0x00000004,
    AutomationIdentifierType_LandmarkType  = 0x00000005,
    AutomationIdentifierType_Annotation    = 0x00000006,
    AutomationIdentifierType_Changes       = 0x00000007,
    AutomationIdentifierType_Style         = 0x00000008,
}

alias EventArgsType = int;
enum : int
{
    EventArgsType_Simple                    = 0x00000000,
    EventArgsType_PropertyChanged           = 0x00000001,
    EventArgsType_StructureChanged          = 0x00000002,
    EventArgsType_AsyncContentLoaded        = 0x00000003,
    EventArgsType_WindowClosed              = 0x00000004,
    EventArgsType_TextEditTextChanged       = 0x00000005,
    EventArgsType_Changes                   = 0x00000006,
    EventArgsType_Notification              = 0x00000007,
    EventArgsType_ActiveTextPositionChanged = 0x00000008,
    EventArgsType_StructuredMarkup          = 0x00000009,
}

alias AsyncContentLoadedState = int;
enum : int
{
    AsyncContentLoadedState_Beginning = 0x00000000,
    AsyncContentLoadedState_Progress  = 0x00000001,
    AsyncContentLoadedState_Completed = 0x00000002,
}

struct UiaEventArgs
{
    EventArgsType Type;
    int EventId;
}
struct UiaPropertyChangedEventArgs
{
    EventArgsType Type;
    UIA_EVENT_ID EventId;
    int PropertyId;
    VARIANT OldValue;
    VARIANT NewValue;
}
struct UiaStructureChangedEventArgs
{
    EventArgsType Type;
    int EventId;
    StructureChangeType StructureChangeType_;
    int* pRuntimeId;
    int cRuntimeIdLen;
}
struct UiaTextEditTextChangedEventArgs
{
    EventArgsType Type;
    int EventId;
    TextEditChangeType TextEditChangeType_;
    SAFEARRAY* pTextChange;
}
struct UiaChangesEventArgs
{
    EventArgsType Type;
    int EventId;
    int EventIdCount;
    UiaChangeInfo* pUiaChanges;
}
struct UiaAsyncContentLoadedEventArgs
{
    EventArgsType Type;
    int EventId;
    AsyncContentLoadedState AsyncContentLoadedState_;
    double PercentComplete;
}
struct UiaWindowClosedEventArgs
{
    EventArgsType Type;
    int EventId;
    int* pRuntimeId;
    int cRuntimeIdLen;
}
alias UiaEventCallback = void function(UiaEventArgs* pArgs, SAFEARRAY* pRequestedData, BSTR pTreeStructure);
// [Not Found] IID_IRicheditWindowlessAccessibility
interface IRicheditWindowlessAccessibility : IUnknown
{
    HRESULT CreateProvider(IRawElementProviderWindowlessSite pSite, IRawElementProviderSimple* ppProvider);
}
// [Not Found] IID_IRichEditUiaInformation
interface IRichEditUiaInformation : IUnknown
{
    HRESULT GetBoundaryRectangle(UiaRect* pUiaRect);
    HRESULT IsVisible();
}
struct SERIALKEYSA
{
    uint cbSize;
    SERIALKEYS_FLAGS dwFlags;
    PSTR lpszActivePort;
    PSTR lpszPort;
    uint iBaudRate;
    uint iPortState;
    uint iActive;
}
struct SERIALKEYSW
{
    uint cbSize;
    SERIALKEYS_FLAGS dwFlags;
    PWSTR lpszActivePort;
    PWSTR lpszPort;
    uint iBaudRate;
    uint iPortState;
    uint iActive;
}
struct HIGHCONTRASTA
{
    uint cbSize;
    HIGHCONTRASTW_FLAGS dwFlags;
    PSTR lpszDefaultScheme;
}
struct HIGHCONTRASTW
{
    uint cbSize;
    HIGHCONTRASTW_FLAGS dwFlags;
    PWSTR lpszDefaultScheme;
}
struct FILTERKEYS
{
    uint cbSize;
    uint dwFlags;
    uint iWaitMSec;
    uint iDelayMSec;
    uint iRepeatMSec;
    uint iBounceMSec;
}
struct STICKYKEYS
{
    uint cbSize;
    STICKYKEYS_FLAGS dwFlags;
}
struct MOUSEKEYS
{
    uint cbSize;
    uint dwFlags;
    uint iMaxSpeed;
    uint iTimeToMaxSpeed;
    uint iCtrlSpeed;
    uint dwReserved1;
    uint dwReserved2;
}
struct ACCESSTIMEOUT
{
    uint cbSize;
    uint dwFlags;
    uint iTimeOutMSec;
}
struct SOUNDSENTRYA
{
    uint cbSize;
    SOUNDSENTRY_FLAGS dwFlags;
    SOUNDSENTRY_TEXT_EFFECT iFSTextEffect;
    uint iFSTextEffectMSec;
    uint iFSTextEffectColorBits;
    SOUND_SENTRY_GRAPHICS_EFFECT iFSGrafEffect;
    uint iFSGrafEffectMSec;
    uint iFSGrafEffectColor;
    SOUNDSENTRY_WINDOWS_EFFECT iWindowsEffect;
    uint iWindowsEffectMSec;
    PSTR lpszWindowsEffectDLL;
    uint iWindowsEffectOrdinal;
}
struct SOUNDSENTRYW
{
    uint cbSize;
    SOUNDSENTRY_FLAGS dwFlags;
    SOUNDSENTRY_TEXT_EFFECT iFSTextEffect;
    uint iFSTextEffectMSec;
    uint iFSTextEffectColorBits;
    SOUND_SENTRY_GRAPHICS_EFFECT iFSGrafEffect;
    uint iFSGrafEffectMSec;
    uint iFSGrafEffectColor;
    SOUNDSENTRY_WINDOWS_EFFECT iWindowsEffect;
    uint iWindowsEffectMSec;
    PWSTR lpszWindowsEffectDLL;
    uint iWindowsEffectOrdinal;
}
struct TOGGLEKEYS
{
    uint cbSize;
    uint dwFlags;
}
alias WINEVENTPROC = void function(HWINEVENTHOOK hWinEventHook, uint event, HWND hwnd, int idObject, int idChild, uint idEventThread, uint dwmsEventTime);
