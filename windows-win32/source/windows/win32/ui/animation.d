module windows.win32.ui.animation;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.graphics.directcomposition : IDCompositionAnimation;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum UI_ANIMATION_SECONDS_EVENTUALLY = 0xffffffffffffffff;
enum UI_ANIMATION_REPEAT_INDEFINITELY = 0xffffffffffffffff;
enum UI_ANIMATION_REPEAT_INDEFINITELY_CONCLUDE_AT_END = 0xffffffffffffffff;
enum UI_ANIMATION_REPEAT_INDEFINITELY_CONCLUDE_AT_START = 0xfffffffffffffffe;
enum UI_ANIMATION_SECONDS_INFINITE = 0xffffffffffffffff;
alias UI_ANIMATION_KEYFRAME = long;
enum CLSID_UIAnimationManager = GUID(0x4c1fc63a, 0x695c, 0x47e8, [0xa3, 0x39, 0x1a, 0x19, 0x4b, 0xe3, 0xd0, 0xb8]);
struct UIAnimationManager
{
}
enum CLSID_UIAnimationManager2 = GUID(0xd25d8842, 0x8884, 0x4a4a, [0xb3, 0x21, 0x9, 0x13, 0x14, 0x37, 0x9b, 0xdd]);
struct UIAnimationManager2
{
}
enum CLSID_UIAnimationTransitionLibrary = GUID(0x1d6322ad, 0xaa85, 0x4ef5, [0xa8, 0x28, 0x86, 0xd7, 0x10, 0x67, 0xd1, 0x45]);
struct UIAnimationTransitionLibrary
{
}
enum CLSID_UIAnimationTransitionLibrary2 = GUID(0x812f944a, 0xc5c8, 0x4cd9, [0xb0, 0xa6, 0xb3, 0xda, 0x80, 0x2f, 0x22, 0x8d]);
struct UIAnimationTransitionLibrary2
{
}
enum CLSID_UIAnimationTransitionFactory = GUID(0x8a9b1cdd, 0xfcd7, 0x419c, [0x8b, 0x44, 0x42, 0xfd, 0x17, 0xdb, 0x18, 0x87]);
struct UIAnimationTransitionFactory
{
}
enum CLSID_UIAnimationTransitionFactory2 = GUID(0x84302f97, 0x7f7b, 0x4040, [0xb1, 0x90, 0x72, 0xac, 0x9d, 0x18, 0xe4, 0x20]);
struct UIAnimationTransitionFactory2
{
}
enum CLSID_UIAnimationTimer = GUID(0xbfcd4a0c, 0x6b6, 0x4384, [0xb7, 0x68, 0xd, 0xaa, 0x79, 0x2c, 0x38, 0xe]);
struct UIAnimationTimer
{
}
alias UI_ANIMATION_UPDATE_RESULT = int;
enum : int
{
    UI_ANIMATION_UPDATE_NO_CHANGE         = 0x00000000,
    UI_ANIMATION_UPDATE_VARIABLES_CHANGED = 0x00000001,
}

alias UI_ANIMATION_MANAGER_STATUS = int;
enum : int
{
    UI_ANIMATION_MANAGER_IDLE = 0x00000000,
    UI_ANIMATION_MANAGER_BUSY = 0x00000001,
}

alias UI_ANIMATION_MODE = int;
enum : int
{
    UI_ANIMATION_MODE_DISABLED       = 0x00000000,
    UI_ANIMATION_MODE_SYSTEM_DEFAULT = 0x00000001,
    UI_ANIMATION_MODE_ENABLED        = 0x00000002,
}

alias UI_ANIMATION_REPEAT_MODE = int;
enum : int
{
    UI_ANIMATION_REPEAT_MODE_NORMAL    = 0x00000000,
    UI_ANIMATION_REPEAT_MODE_ALTERNATE = 0x00000001,
}

enum IID_IUIAnimationManager = GUID(0x9169896c, 0xac8d, 0x4e7d, [0x94, 0xe5, 0x67, 0xfa, 0x4d, 0xc2, 0xf2, 0xe8]);
interface IUIAnimationManager : IUnknown
{
    HRESULT CreateAnimationVariable(double, IUIAnimationVariable*);
    HRESULT ScheduleTransition(IUIAnimationVariable, IUIAnimationTransition, double);
    HRESULT CreateStoryboard(IUIAnimationStoryboard*);
    HRESULT FinishAllStoryboards(double);
    HRESULT AbandonAllStoryboards();
    HRESULT Update(double, UI_ANIMATION_UPDATE_RESULT*);
    HRESULT GetVariableFromTag(IUnknown, uint, IUIAnimationVariable*);
    HRESULT GetStoryboardFromTag(IUnknown, uint, IUIAnimationStoryboard*);
    HRESULT GetStatus(UI_ANIMATION_MANAGER_STATUS*);
    HRESULT SetAnimationMode(UI_ANIMATION_MODE);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT SetManagerEventHandler(IUIAnimationManagerEventHandler);
    HRESULT SetCancelPriorityComparison(IUIAnimationPriorityComparison);
    HRESULT SetTrimPriorityComparison(IUIAnimationPriorityComparison);
    HRESULT SetCompressPriorityComparison(IUIAnimationPriorityComparison);
    HRESULT SetConcludePriorityComparison(IUIAnimationPriorityComparison);
    HRESULT SetDefaultLongestAcceptableDelay(double);
    HRESULT Shutdown();
}
alias UI_ANIMATION_ROUNDING_MODE = int;
enum : int
{
    UI_ANIMATION_ROUNDING_NEAREST = 0x00000000,
    UI_ANIMATION_ROUNDING_FLOOR   = 0x00000001,
    UI_ANIMATION_ROUNDING_CEILING = 0x00000002,
}

enum IID_IUIAnimationVariable = GUID(0x8ceeb155, 0x2849, 0x4ce5, [0x94, 0x48, 0x91, 0xff, 0x70, 0xe1, 0xe4, 0xd9]);
interface IUIAnimationVariable : IUnknown
{
    HRESULT GetValue(double*);
    HRESULT GetFinalValue(double*);
    HRESULT GetPreviousValue(double*);
    HRESULT GetIntegerValue(int*);
    HRESULT GetFinalIntegerValue(int*);
    HRESULT GetPreviousIntegerValue(int*);
    HRESULT GetCurrentStoryboard(IUIAnimationStoryboard*);
    HRESULT SetLowerBound(double);
    HRESULT SetUpperBound(double);
    HRESULT SetRoundingMode(UI_ANIMATION_ROUNDING_MODE);
    HRESULT SetTag(IUnknown, uint);
    HRESULT GetTag(IUnknown*, uint*);
    HRESULT SetVariableChangeHandler(IUIAnimationVariableChangeHandler);
    HRESULT SetVariableIntegerChangeHandler(IUIAnimationVariableIntegerChangeHandler);
}
alias UI_ANIMATION_STORYBOARD_STATUS = int;
enum : int
{
    UI_ANIMATION_STORYBOARD_BUILDING              = 0x00000000,
    UI_ANIMATION_STORYBOARD_SCHEDULED             = 0x00000001,
    UI_ANIMATION_STORYBOARD_CANCELLED             = 0x00000002,
    UI_ANIMATION_STORYBOARD_PLAYING               = 0x00000003,
    UI_ANIMATION_STORYBOARD_TRUNCATED             = 0x00000004,
    UI_ANIMATION_STORYBOARD_FINISHED              = 0x00000005,
    UI_ANIMATION_STORYBOARD_READY                 = 0x00000006,
    UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY = 0x00000007,
}

alias UI_ANIMATION_SCHEDULING_RESULT = int;
enum : int
{
    UI_ANIMATION_SCHEDULING_UNEXPECTED_FAILURE    = 0x00000000,
    UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY = 0x00000001,
    UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED     = 0x00000002,
    UI_ANIMATION_SCHEDULING_SUCCEEDED             = 0x00000003,
    UI_ANIMATION_SCHEDULING_DEFERRED              = 0x00000004,
}

enum IID_IUIAnimationStoryboard = GUID(0xa8ff128f, 0x9bf9, 0x4af1, [0x9e, 0x67, 0xe5, 0xe4, 0x10, 0xde, 0xfb, 0x84]);
interface IUIAnimationStoryboard : IUnknown
{
    HRESULT AddTransition(IUIAnimationVariable, IUIAnimationTransition);
    HRESULT AddKeyframeAtOffset(UI_ANIMATION_KEYFRAME, double, UI_ANIMATION_KEYFRAME*);
    HRESULT AddKeyframeAfterTransition(IUIAnimationTransition, UI_ANIMATION_KEYFRAME*);
    HRESULT AddTransitionAtKeyframe(IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME);
    HRESULT AddTransitionBetweenKeyframes(IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME);
    HRESULT RepeatBetweenKeyframes(UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, int);
    HRESULT HoldVariable(IUIAnimationVariable);
    HRESULT SetLongestAcceptableDelay(double);
    HRESULT Schedule(double, UI_ANIMATION_SCHEDULING_RESULT*);
    HRESULT Conclude();
    HRESULT Finish(double);
    HRESULT Abandon();
    HRESULT SetTag(IUnknown, uint);
    HRESULT GetTag(IUnknown*, uint*);
    HRESULT GetStatus(UI_ANIMATION_STORYBOARD_STATUS*);
    HRESULT GetElapsedTime(double*);
    HRESULT SetStoryboardEventHandler(IUIAnimationStoryboardEventHandler);
}
enum IID_IUIAnimationTransition = GUID(0xdc6ce252, 0xf731, 0x41cf, [0xb6, 0x10, 0x61, 0x4b, 0x6c, 0xa0, 0x49, 0xad]);
interface IUIAnimationTransition : IUnknown
{
    HRESULT SetInitialValue(double);
    HRESULT SetInitialVelocity(double);
    HRESULT IsDurationKnown();
    HRESULT GetDuration(double*);
}
enum IID_IUIAnimationManagerEventHandler = GUID(0x783321ed, 0x78a3, 0x4366, [0xb5, 0x74, 0x6a, 0xf6, 0x7, 0xa6, 0x47, 0x88]);
interface IUIAnimationManagerEventHandler : IUnknown
{
    HRESULT OnManagerStatusChanged(UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS);
}
enum IID_IUIAnimationVariableChangeHandler = GUID(0x6358b7ba, 0x87d2, 0x42d5, [0xbf, 0x71, 0x82, 0xe9, 0x19, 0xdd, 0x58, 0x62]);
interface IUIAnimationVariableChangeHandler : IUnknown
{
    HRESULT OnValueChanged(IUIAnimationStoryboard, IUIAnimationVariable, double, double);
}
enum IID_IUIAnimationVariableIntegerChangeHandler = GUID(0xbb3e1550, 0x356e, 0x44b0, [0x99, 0xda, 0x85, 0xac, 0x60, 0x17, 0x86, 0x5e]);
interface IUIAnimationVariableIntegerChangeHandler : IUnknown
{
    HRESULT OnIntegerValueChanged(IUIAnimationStoryboard, IUIAnimationVariable, int, int);
}
enum IID_IUIAnimationStoryboardEventHandler = GUID(0x3d5c9008, 0xec7c, 0x4364, [0x9f, 0x8a, 0x9a, 0xf3, 0xc5, 0x8c, 0xba, 0xe6]);
interface IUIAnimationStoryboardEventHandler : IUnknown
{
    HRESULT OnStoryboardStatusChanged(IUIAnimationStoryboard, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS);
    HRESULT OnStoryboardUpdated(IUIAnimationStoryboard);
}
alias UI_ANIMATION_PRIORITY_EFFECT = int;
enum : int
{
    UI_ANIMATION_PRIORITY_EFFECT_FAILURE = 0x00000000,
    UI_ANIMATION_PRIORITY_EFFECT_DELAY   = 0x00000001,
}

enum IID_IUIAnimationPriorityComparison = GUID(0x83fa9b74, 0x5f86, 0x4618, [0xbc, 0x6a, 0xa2, 0xfa, 0xc1, 0x9b, 0x3f, 0x44]);
interface IUIAnimationPriorityComparison : IUnknown
{
    HRESULT HasPriority(IUIAnimationStoryboard, IUIAnimationStoryboard, UI_ANIMATION_PRIORITY_EFFECT);
}
alias UI_ANIMATION_SLOPE = int;
enum : int
{
    UI_ANIMATION_SLOPE_INCREASING = 0x00000000,
    UI_ANIMATION_SLOPE_DECREASING = 0x00000001,
}

enum IID_IUIAnimationTransitionLibrary = GUID(0xca5a14b1, 0xd24f, 0x48b8, [0x8f, 0xe4, 0xc7, 0x81, 0x69, 0xba, 0x95, 0x4e]);
interface IUIAnimationTransitionLibrary : IUnknown
{
    HRESULT CreateInstantaneousTransition(double, IUIAnimationTransition*);
    HRESULT CreateConstantTransition(double, IUIAnimationTransition*);
    HRESULT CreateDiscreteTransition(double, double, double, IUIAnimationTransition*);
    HRESULT CreateLinearTransition(double, double, IUIAnimationTransition*);
    HRESULT CreateLinearTransitionFromSpeed(double, double, IUIAnimationTransition*);
    HRESULT CreateSinusoidalTransitionFromVelocity(double, double, IUIAnimationTransition*);
    HRESULT CreateSinusoidalTransitionFromRange(double, double, double, double, UI_ANIMATION_SLOPE, IUIAnimationTransition*);
    HRESULT CreateAccelerateDecelerateTransition(double, double, double, double, IUIAnimationTransition*);
    HRESULT CreateReversalTransition(double, IUIAnimationTransition*);
    HRESULT CreateCubicTransition(double, double, double, IUIAnimationTransition*);
    HRESULT CreateSmoothStopTransition(double, double, IUIAnimationTransition*);
    HRESULT CreateParabolicTransitionFromAcceleration(double, double, double, IUIAnimationTransition*);
}
alias UI_ANIMATION_DEPENDENCIES = uint;
enum : uint
{
    UI_ANIMATION_DEPENDENCY_NONE                = 0x00000000,
    UI_ANIMATION_DEPENDENCY_INTERMEDIATE_VALUES = 0x00000001,
    UI_ANIMATION_DEPENDENCY_FINAL_VALUE         = 0x00000002,
    UI_ANIMATION_DEPENDENCY_FINAL_VELOCITY      = 0x00000004,
    UI_ANIMATION_DEPENDENCY_DURATION            = 0x00000008,
}

enum IID_IUIAnimationInterpolator = GUID(0x7815cbba, 0xddf7, 0x478c, [0xa4, 0x6c, 0x7b, 0x6c, 0x73, 0x8b, 0x79, 0x78]);
interface IUIAnimationInterpolator : IUnknown
{
    HRESULT SetInitialValueAndVelocity(double, double);
    HRESULT SetDuration(double);
    HRESULT GetDuration(double*);
    HRESULT GetFinalValue(double*);
    HRESULT InterpolateValue(double, double*);
    HRESULT InterpolateVelocity(double, double*);
    HRESULT GetDependencies(UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*);
}
enum IID_IUIAnimationTransitionFactory = GUID(0xfcd91e03, 0x3e3b, 0x45ad, [0xbb, 0xb1, 0x6d, 0xfc, 0x81, 0x53, 0x74, 0x3d]);
interface IUIAnimationTransitionFactory : IUnknown
{
    HRESULT CreateTransition(IUIAnimationInterpolator, IUIAnimationTransition*);
}
alias UI_ANIMATION_IDLE_BEHAVIOR = int;
enum : int
{
    UI_ANIMATION_IDLE_BEHAVIOR_CONTINUE = 0x00000000,
    UI_ANIMATION_IDLE_BEHAVIOR_DISABLE  = 0x00000001,
}

enum IID_IUIAnimationTimer = GUID(0x6b0efad1, 0xa053, 0x41d6, [0x90, 0x85, 0x33, 0xa6, 0x89, 0x14, 0x46, 0x65]);
interface IUIAnimationTimer : IUnknown
{
    HRESULT SetTimerUpdateHandler(IUIAnimationTimerUpdateHandler, UI_ANIMATION_IDLE_BEHAVIOR);
    HRESULT SetTimerEventHandler(IUIAnimationTimerEventHandler);
    HRESULT Enable();
    HRESULT Disable();
    HRESULT IsEnabled();
    HRESULT GetTime(double*);
    HRESULT SetFrameRateThreshold(uint);
}
enum IID_IUIAnimationTimerUpdateHandler = GUID(0x195509b7, 0x5d5e, 0x4e3e, [0xb2, 0x78, 0xee, 0x37, 0x59, 0xb3, 0x67, 0xad]);
interface IUIAnimationTimerUpdateHandler : IUnknown
{
    HRESULT OnUpdate(double, UI_ANIMATION_UPDATE_RESULT*);
    HRESULT SetTimerClientEventHandler(IUIAnimationTimerClientEventHandler);
    HRESULT ClearTimerClientEventHandler();
}
alias UI_ANIMATION_TIMER_CLIENT_STATUS = int;
enum : int
{
    UI_ANIMATION_TIMER_CLIENT_IDLE = 0x00000000,
    UI_ANIMATION_TIMER_CLIENT_BUSY = 0x00000001,
}

enum IID_IUIAnimationTimerClientEventHandler = GUID(0xbedb4db6, 0x94fa, 0x4bfb, [0xa4, 0x7f, 0xef, 0x2d, 0x9e, 0x40, 0x8c, 0x25]);
interface IUIAnimationTimerClientEventHandler : IUnknown
{
    HRESULT OnTimerClientStatusChanged(UI_ANIMATION_TIMER_CLIENT_STATUS, UI_ANIMATION_TIMER_CLIENT_STATUS);
}
enum IID_IUIAnimationTimerEventHandler = GUID(0x274a7dea, 0xd771, 0x4095, [0xab, 0xbd, 0x8d, 0xf7, 0xab, 0xd2, 0x3c, 0xe3]);
interface IUIAnimationTimerEventHandler : IUnknown
{
    HRESULT OnPreUpdate();
    HRESULT OnPostUpdate();
    HRESULT OnRenderingTooSlow(uint);
}
enum IID_IUIAnimationManager2 = GUID(0xd8b6f7d4, 0x4109, 0x4d3f, [0xac, 0xee, 0x87, 0x99, 0x26, 0x96, 0x8c, 0xb1]);
interface IUIAnimationManager2 : IUnknown
{
    HRESULT CreateAnimationVectorVariable(const(double)*, uint, IUIAnimationVariable2*);
    HRESULT CreateAnimationVariable(double, IUIAnimationVariable2*);
    HRESULT ScheduleTransition(IUIAnimationVariable2, IUIAnimationTransition2, double);
    HRESULT CreateStoryboard(IUIAnimationStoryboard2*);
    HRESULT FinishAllStoryboards(double);
    HRESULT AbandonAllStoryboards();
    HRESULT Update(double, UI_ANIMATION_UPDATE_RESULT*);
    HRESULT GetVariableFromTag(IUnknown, uint, IUIAnimationVariable2*);
    HRESULT GetStoryboardFromTag(IUnknown, uint, IUIAnimationStoryboard2*);
    HRESULT EstimateNextEventTime(double*);
    HRESULT GetStatus(UI_ANIMATION_MANAGER_STATUS*);
    HRESULT SetAnimationMode(UI_ANIMATION_MODE);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT SetManagerEventHandler(IUIAnimationManagerEventHandler2, BOOL);
    HRESULT SetCancelPriorityComparison(IUIAnimationPriorityComparison2);
    HRESULT SetTrimPriorityComparison(IUIAnimationPriorityComparison2);
    HRESULT SetCompressPriorityComparison(IUIAnimationPriorityComparison2);
    HRESULT SetConcludePriorityComparison(IUIAnimationPriorityComparison2);
    HRESULT SetDefaultLongestAcceptableDelay(double);
    HRESULT Shutdown();
}
enum IID_IUIAnimationVariable2 = GUID(0x4914b304, 0x96ab, 0x44d9, [0x9e, 0x77, 0xd5, 0x10, 0x9b, 0x7e, 0x74, 0x66]);
interface IUIAnimationVariable2 : IUnknown
{
    HRESULT GetDimension(uint*);
    HRESULT GetValue(double*);
    HRESULT GetVectorValue(double*, uint);
    HRESULT GetCurve(IDCompositionAnimation);
    HRESULT GetVectorCurve(IDCompositionAnimation*, uint);
    HRESULT GetFinalValue(double*);
    HRESULT GetFinalVectorValue(double*, uint);
    HRESULT GetPreviousValue(double*);
    HRESULT GetPreviousVectorValue(double*, uint);
    HRESULT GetIntegerValue(int*);
    HRESULT GetIntegerVectorValue(int*, uint);
    HRESULT GetFinalIntegerValue(int*);
    HRESULT GetFinalIntegerVectorValue(int*, uint);
    HRESULT GetPreviousIntegerValue(int*);
    HRESULT GetPreviousIntegerVectorValue(int*, uint);
    HRESULT GetCurrentStoryboard(IUIAnimationStoryboard2*);
    HRESULT SetLowerBound(double);
    HRESULT SetLowerBoundVector(const(double)*, uint);
    HRESULT SetUpperBound(double);
    HRESULT SetUpperBoundVector(const(double)*, uint);
    HRESULT SetRoundingMode(UI_ANIMATION_ROUNDING_MODE);
    HRESULT SetTag(IUnknown, uint);
    HRESULT GetTag(IUnknown*, uint*);
    HRESULT SetVariableChangeHandler(IUIAnimationVariableChangeHandler2, BOOL);
    HRESULT SetVariableIntegerChangeHandler(IUIAnimationVariableIntegerChangeHandler2, BOOL);
    HRESULT SetVariableCurveChangeHandler(IUIAnimationVariableCurveChangeHandler2);
}
enum IID_IUIAnimationTransition2 = GUID(0x62ff9123, 0xa85a, 0x4e9b, [0xa2, 0x18, 0x43, 0x5a, 0x93, 0xe2, 0x68, 0xfd]);
interface IUIAnimationTransition2 : IUnknown
{
    HRESULT GetDimension(uint*);
    HRESULT SetInitialValue(double);
    HRESULT SetInitialVectorValue(const(double)*, uint);
    HRESULT SetInitialVelocity(double);
    HRESULT SetInitialVectorVelocity(const(double)*, uint);
    HRESULT IsDurationKnown();
    HRESULT GetDuration(double*);
}
enum IID_IUIAnimationManagerEventHandler2 = GUID(0xf6e022ba, 0xbff3, 0x42ec, [0x90, 0x33, 0xe0, 0x73, 0xf3, 0x3e, 0x83, 0xc3]);
interface IUIAnimationManagerEventHandler2 : IUnknown
{
    HRESULT OnManagerStatusChanged(UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS);
}
enum IID_IUIAnimationVariableChangeHandler2 = GUID(0x63acc8d2, 0x6eae, 0x4bb0, [0xb8, 0x79, 0x58, 0x6d, 0xd8, 0xcf, 0xbe, 0x42]);
interface IUIAnimationVariableChangeHandler2 : IUnknown
{
    HRESULT OnValueChanged(IUIAnimationStoryboard2, IUIAnimationVariable2, double*, double*, uint);
}
enum IID_IUIAnimationVariableIntegerChangeHandler2 = GUID(0x829b6cf1, 0x4f3a, 0x4412, [0xae, 0x9, 0xb2, 0x43, 0xeb, 0x4c, 0x6b, 0x58]);
interface IUIAnimationVariableIntegerChangeHandler2 : IUnknown
{
    HRESULT OnIntegerValueChanged(IUIAnimationStoryboard2, IUIAnimationVariable2, int*, int*, uint);
}
enum IID_IUIAnimationVariableCurveChangeHandler2 = GUID(0x72895e91, 0x145, 0x4c21, [0x91, 0x92, 0x5a, 0xab, 0x40, 0xed, 0xdf, 0x80]);
interface IUIAnimationVariableCurveChangeHandler2 : IUnknown
{
    HRESULT OnCurveChanged(IUIAnimationVariable2);
}
enum IID_IUIAnimationStoryboardEventHandler2 = GUID(0xbac5f55a, 0xba7c, 0x414c, [0xb5, 0x99, 0xfb, 0xf8, 0x50, 0xf5, 0x53, 0xc6]);
interface IUIAnimationStoryboardEventHandler2 : IUnknown
{
    HRESULT OnStoryboardStatusChanged(IUIAnimationStoryboard2, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS);
    HRESULT OnStoryboardUpdated(IUIAnimationStoryboard2);
}
enum IID_IUIAnimationLoopIterationChangeHandler2 = GUID(0x2d3b15a4, 0x4762, 0x47ab, [0xa0, 0x30, 0xb2, 0x32, 0x21, 0xdf, 0x3a, 0xe0]);
interface IUIAnimationLoopIterationChangeHandler2 : IUnknown
{
    HRESULT OnLoopIterationChanged(IUIAnimationStoryboard2, ulong, uint, uint);
}
enum IID_IUIAnimationPriorityComparison2 = GUID(0x5b6d7a37, 0x4621, 0x467c, [0x8b, 0x5, 0x70, 0x13, 0x1d, 0xe6, 0x2d, 0xdb]);
interface IUIAnimationPriorityComparison2 : IUnknown
{
    HRESULT HasPriority(IUIAnimationStoryboard2, IUIAnimationStoryboard2, UI_ANIMATION_PRIORITY_EFFECT);
}
enum IID_IUIAnimationTransitionLibrary2 = GUID(0x3cfae53, 0x9580, 0x4ee3, [0xb3, 0x63, 0x2e, 0xce, 0x51, 0xb4, 0xaf, 0x6a]);
interface IUIAnimationTransitionLibrary2 : IUnknown
{
    HRESULT CreateInstantaneousTransition(double, IUIAnimationTransition2*);
    HRESULT CreateInstantaneousVectorTransition(const(double)*, uint, IUIAnimationTransition2*);
    HRESULT CreateConstantTransition(double, IUIAnimationTransition2*);
    HRESULT CreateDiscreteTransition(double, double, double, IUIAnimationTransition2*);
    HRESULT CreateDiscreteVectorTransition(double, const(double)*, uint, double, IUIAnimationTransition2*);
    HRESULT CreateLinearTransition(double, double, IUIAnimationTransition2*);
    HRESULT CreateLinearVectorTransition(double, const(double)*, uint, IUIAnimationTransition2*);
    HRESULT CreateLinearTransitionFromSpeed(double, double, IUIAnimationTransition2*);
    HRESULT CreateLinearVectorTransitionFromSpeed(double, const(double)*, uint, IUIAnimationTransition2*);
    HRESULT CreateSinusoidalTransitionFromVelocity(double, double, IUIAnimationTransition2*);
    HRESULT CreateSinusoidalTransitionFromRange(double, double, double, double, UI_ANIMATION_SLOPE, IUIAnimationTransition2*);
    HRESULT CreateAccelerateDecelerateTransition(double, double, double, double, IUIAnimationTransition2*);
    HRESULT CreateReversalTransition(double, IUIAnimationTransition2*);
    HRESULT CreateCubicTransition(double, double, double, IUIAnimationTransition2*);
    HRESULT CreateCubicVectorTransition(double, const(double)*, const(double)*, uint, IUIAnimationTransition2*);
    HRESULT CreateSmoothStopTransition(double, double, IUIAnimationTransition2*);
    HRESULT CreateParabolicTransitionFromAcceleration(double, double, double, IUIAnimationTransition2*);
    HRESULT CreateCubicBezierLinearTransition(double, double, double, double, double, double, IUIAnimationTransition2*);
    HRESULT CreateCubicBezierLinearVectorTransition(double, const(double)*, uint, double, double, double, double, IUIAnimationTransition2*);
}
enum IID_IUIAnimationPrimitiveInterpolation = GUID(0xbab20d63, 0x4361, 0x45da, [0xa2, 0x4f, 0xab, 0x85, 0x8, 0x84, 0x6b, 0x5b]);
interface IUIAnimationPrimitiveInterpolation : IUnknown
{
    HRESULT AddCubic(uint, double, float, float, float, float);
    HRESULT AddSinusoidal(uint, double, float, float, float, float);
}
enum IID_IUIAnimationInterpolator2 = GUID(0xea76aff8, 0xea22, 0x4a23, [0xa0, 0xef, 0xa6, 0xa9, 0x66, 0x70, 0x35, 0x18]);
interface IUIAnimationInterpolator2 : IUnknown
{
    HRESULT GetDimension(uint*);
    HRESULT SetInitialValueAndVelocity(double*, double*, uint);
    HRESULT SetDuration(double);
    HRESULT GetDuration(double*);
    HRESULT GetFinalValue(double*, uint);
    HRESULT InterpolateValue(double, double*, uint);
    HRESULT InterpolateVelocity(double, double*, uint);
    HRESULT GetPrimitiveInterpolation(IUIAnimationPrimitiveInterpolation, uint);
    HRESULT GetDependencies(UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*);
}
enum IID_IUIAnimationTransitionFactory2 = GUID(0x937d4916, 0xc1a6, 0x42d5, [0x88, 0xd8, 0x30, 0x34, 0x4d, 0x6e, 0xfe, 0x31]);
interface IUIAnimationTransitionFactory2 : IUnknown
{
    HRESULT CreateTransition(IUIAnimationInterpolator2, IUIAnimationTransition2*);
}
enum IID_IUIAnimationStoryboard2 = GUID(0xae289cd2, 0x12d4, 0x4945, [0x94, 0x19, 0x9e, 0x41, 0xbe, 0x3, 0x4d, 0xf2]);
interface IUIAnimationStoryboard2 : IUnknown
{
    HRESULT AddTransition(IUIAnimationVariable2, IUIAnimationTransition2);
    HRESULT AddKeyframeAtOffset(UI_ANIMATION_KEYFRAME, double, UI_ANIMATION_KEYFRAME*);
    HRESULT AddKeyframeAfterTransition(IUIAnimationTransition2, UI_ANIMATION_KEYFRAME*);
    HRESULT AddTransitionAtKeyframe(IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME);
    HRESULT AddTransitionBetweenKeyframes(IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME);
    HRESULT RepeatBetweenKeyframes(UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, double, UI_ANIMATION_REPEAT_MODE, IUIAnimationLoopIterationChangeHandler2, ulong, BOOL);
    HRESULT HoldVariable(IUIAnimationVariable2);
    HRESULT SetLongestAcceptableDelay(double);
    HRESULT SetSkipDuration(double);
    HRESULT Schedule(double, UI_ANIMATION_SCHEDULING_RESULT*);
    HRESULT Conclude();
    HRESULT Finish(double);
    HRESULT Abandon();
    HRESULT SetTag(IUnknown, uint);
    HRESULT GetTag(IUnknown*, uint*);
    HRESULT GetStatus(UI_ANIMATION_STORYBOARD_STATUS*);
    HRESULT GetElapsedTime(double*);
    HRESULT SetStoryboardEventHandler(IUIAnimationStoryboardEventHandler2, BOOL, BOOL);
}
