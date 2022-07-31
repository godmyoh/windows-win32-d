module windows.win32.ui.interactioncontext;

import windows.win32.foundation : HRESULT;
import windows.win32.ui.input.pointer : POINTER_INFO;
import windows.win32.ui.windowsandmessaging : POINTER_INPUT_TYPE;

version (Windows):
extern (Windows):

alias HINTERACTIONCONTEXT = void*;
alias INTERACTION_ID = int;
enum : int
{
    INTERACTION_ID_NONE          = 0x00000000,
    INTERACTION_ID_MANIPULATION  = 0x00000001,
    INTERACTION_ID_TAP           = 0x00000002,
    INTERACTION_ID_SECONDARY_TAP = 0x00000003,
    INTERACTION_ID_HOLD          = 0x00000004,
    INTERACTION_ID_DRAG          = 0x00000005,
    INTERACTION_ID_CROSS_SLIDE   = 0x00000006,
    INTERACTION_ID_MAX           = 0xffffffff,
}

alias INTERACTION_FLAGS = uint;
enum : uint
{
    INTERACTION_FLAG_NONE    = 0x00000000,
    INTERACTION_FLAG_BEGIN   = 0x00000001,
    INTERACTION_FLAG_END     = 0x00000002,
    INTERACTION_FLAG_CANCEL  = 0x00000004,
    INTERACTION_FLAG_INERTIA = 0x00000008,
    INTERACTION_FLAG_MAX     = 0xffffffff,
}

alias INTERACTION_CONFIGURATION_FLAGS = uint;
enum : uint
{
    INTERACTION_CONFIGURATION_FLAG_NONE                                 = 0x00000000,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION                         = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X           = 0x00000002,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y           = 0x00000004,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION                = 0x00000008,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING                 = 0x00000010,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA     = 0x00000020,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA        = 0x00000040,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA         = 0x00000080,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X                 = 0x00000100,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y                 = 0x00000200,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT                   = 0x00000400,
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_MULTIPLE_FINGER_PANNING = 0x00000800,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE                          = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL               = 0x00000002,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT                   = 0x00000004,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP               = 0x00000008,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE                = 0x00000010,
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT                    = 0x00000020,
    INTERACTION_CONFIGURATION_FLAG_TAP                                  = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE                           = 0x00000002,
    INTERACTION_CONFIGURATION_FLAG_TAP_MULTIPLE_FINGER                  = 0x00000004,
    INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP                        = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_HOLD                                 = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE                           = 0x00000002,
    INTERACTION_CONFIGURATION_FLAG_HOLD_MULTIPLE_FINGER                 = 0x00000004,
    INTERACTION_CONFIGURATION_FLAG_DRAG                                 = 0x00000001,
    INTERACTION_CONFIGURATION_FLAG_MAX                                  = 0xffffffff,
}

alias INERTIA_PARAMETER = int;
enum : int
{
    INERTIA_PARAMETER_TRANSLATION_DECELERATION = 0x00000001,
    INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT = 0x00000002,
    INERTIA_PARAMETER_ROTATION_DECELERATION    = 0x00000003,
    INERTIA_PARAMETER_ROTATION_ANGLE           = 0x00000004,
    INERTIA_PARAMETER_EXPANSION_DECELERATION   = 0x00000005,
    INERTIA_PARAMETER_EXPANSION_EXPANSION      = 0x00000006,
    INERTIA_PARAMETER_MAX                      = 0xffffffff,
}

alias INTERACTION_STATE = int;
enum : int
{
    INTERACTION_STATE_IDLE                = 0x00000000,
    INTERACTION_STATE_IN_INTERACTION      = 0x00000001,
    INTERACTION_STATE_POSSIBLE_DOUBLE_TAP = 0x00000002,
    INTERACTION_STATE_MAX                 = 0xffffffff,
}

alias INTERACTION_CONTEXT_PROPERTY = int;
enum : int
{
    INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS       = 0x00000001,
    INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK = 0x00000002,
    INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS         = 0x00000003,
    INTERACTION_CONTEXT_PROPERTY_MAX                     = 0xffffffff,
}

alias CROSS_SLIDE_THRESHOLD = int;
enum : int
{
    CROSS_SLIDE_THRESHOLD_SELECT_START     = 0x00000000,
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START = 0x00000001,
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END   = 0x00000002,
    CROSS_SLIDE_THRESHOLD_REARRANGE_START  = 0x00000003,
    CROSS_SLIDE_THRESHOLD_COUNT            = 0x00000004,
    CROSS_SLIDE_THRESHOLD_MAX              = 0xffffffff,
}

alias CROSS_SLIDE_FLAGS = uint;
enum : uint
{
    CROSS_SLIDE_FLAGS_NONE       = 0x00000000,
    CROSS_SLIDE_FLAGS_SELECT     = 0x00000001,
    CROSS_SLIDE_FLAGS_SPEED_BUMP = 0x00000002,
    CROSS_SLIDE_FLAGS_REARRANGE  = 0x00000004,
    CROSS_SLIDE_FLAGS_MAX        = 0xffffffff,
}

alias MOUSE_WHEEL_PARAMETER = int;
enum : int
{
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X = 0x00000001,
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y = 0x00000002,
    MOUSE_WHEEL_PARAMETER_DELTA_SCALE        = 0x00000003,
    MOUSE_WHEEL_PARAMETER_DELTA_ROTATION     = 0x00000004,
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X = 0x00000005,
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y = 0x00000006,
    MOUSE_WHEEL_PARAMETER_MAX                = 0xffffffff,
}

alias TAP_PARAMETER = int;
enum : int
{
    TAP_PARAMETER_MIN_CONTACT_COUNT = 0x00000000,
    TAP_PARAMETER_MAX_CONTACT_COUNT = 0x00000001,
    TAP_PARAMETER_MAX               = 0xffffffff,
}

alias HOLD_PARAMETER = int;
enum : int
{
    HOLD_PARAMETER_MIN_CONTACT_COUNT     = 0x00000000,
    HOLD_PARAMETER_MAX_CONTACT_COUNT     = 0x00000001,
    HOLD_PARAMETER_THRESHOLD_RADIUS      = 0x00000002,
    HOLD_PARAMETER_THRESHOLD_START_DELAY = 0x00000003,
    HOLD_PARAMETER_MAX                   = 0xffffffff,
}

alias TRANSLATION_PARAMETER = int;
enum : int
{
    TRANSLATION_PARAMETER_MIN_CONTACT_COUNT = 0x00000000,
    TRANSLATION_PARAMETER_MAX_CONTACT_COUNT = 0x00000001,
    TRANSLATION_PARAMETER_MAX               = 0xffffffff,
}

alias MANIPULATION_RAILS_STATE = int;
enum : int
{
    MANIPULATION_RAILS_STATE_UNDECIDED = 0x00000000,
    MANIPULATION_RAILS_STATE_FREE      = 0x00000001,
    MANIPULATION_RAILS_STATE_RAILED    = 0x00000002,
    MANIPULATION_RAILS_STATE_MAX       = 0xffffffff,
}

struct MANIPULATION_TRANSFORM
{
    float translationX;
    float translationY;
    float scale;
    float expansion;
    float rotation;
}
struct MANIPULATION_VELOCITY
{
    float velocityX;
    float velocityY;
    float velocityExpansion;
    float velocityAngular;
}
struct INTERACTION_ARGUMENTS_MANIPULATION
{
    MANIPULATION_TRANSFORM delta;
    MANIPULATION_TRANSFORM cumulative;
    MANIPULATION_VELOCITY velocity;
    MANIPULATION_RAILS_STATE railsState;
}
struct INTERACTION_ARGUMENTS_TAP
{
    uint count;
}
struct INTERACTION_ARGUMENTS_CROSS_SLIDE
{
    CROSS_SLIDE_FLAGS flags;
}
struct INTERACTION_CONTEXT_OUTPUT
{
    INTERACTION_ID interactionId;
    INTERACTION_FLAGS interactionFlags;
    POINTER_INPUT_TYPE inputType;
    float x;
    float y;
    union _arguments_e__Union
    {
        INTERACTION_ARGUMENTS_MANIPULATION manipulation;
        INTERACTION_ARGUMENTS_TAP tap;
        INTERACTION_ARGUMENTS_CROSS_SLIDE crossSlide;
    }
}
struct INTERACTION_CONTEXT_OUTPUT2
{
    INTERACTION_ID interactionId;
    INTERACTION_FLAGS interactionFlags;
    POINTER_INPUT_TYPE inputType;
    uint contactCount;
    uint currentContactCount;
    float x;
    float y;
    union _arguments_e__Union
    {
        INTERACTION_ARGUMENTS_MANIPULATION manipulation;
        INTERACTION_ARGUMENTS_TAP tap;
        INTERACTION_ARGUMENTS_CROSS_SLIDE crossSlide;
    }
}
struct INTERACTION_CONTEXT_CONFIGURATION
{
    INTERACTION_ID interactionId;
    INTERACTION_CONFIGURATION_FLAGS enable;
}
struct CROSS_SLIDE_PARAMETER
{
    CROSS_SLIDE_THRESHOLD threshold;
    float distance;
}
alias INTERACTION_CONTEXT_OUTPUT_CALLBACK = void function(void*, const(INTERACTION_CONTEXT_OUTPUT)*);
alias INTERACTION_CONTEXT_OUTPUT_CALLBACK2 = void function(void*, const(INTERACTION_CONTEXT_OUTPUT2)*);
HRESULT CreateInteractionContext(HINTERACTIONCONTEXT*);
HRESULT DestroyInteractionContext(HINTERACTIONCONTEXT);
HRESULT RegisterOutputCallbackInteractionContext(HINTERACTIONCONTEXT, INTERACTION_CONTEXT_OUTPUT_CALLBACK, void*);
HRESULT RegisterOutputCallbackInteractionContext2(HINTERACTIONCONTEXT, INTERACTION_CONTEXT_OUTPUT_CALLBACK2, void*);
HRESULT SetInteractionConfigurationInteractionContext(HINTERACTIONCONTEXT, uint, const(INTERACTION_CONTEXT_CONFIGURATION)*);
HRESULT GetInteractionConfigurationInteractionContext(HINTERACTIONCONTEXT, uint, INTERACTION_CONTEXT_CONFIGURATION*);
HRESULT SetPropertyInteractionContext(HINTERACTIONCONTEXT, INTERACTION_CONTEXT_PROPERTY, uint);
HRESULT GetPropertyInteractionContext(HINTERACTIONCONTEXT, INTERACTION_CONTEXT_PROPERTY, uint*);
HRESULT SetInertiaParameterInteractionContext(HINTERACTIONCONTEXT, INERTIA_PARAMETER, float);
HRESULT GetInertiaParameterInteractionContext(HINTERACTIONCONTEXT, INERTIA_PARAMETER, float*);
HRESULT SetCrossSlideParametersInteractionContext(HINTERACTIONCONTEXT, uint, CROSS_SLIDE_PARAMETER*);
HRESULT GetCrossSlideParameterInteractionContext(HINTERACTIONCONTEXT, CROSS_SLIDE_THRESHOLD, float*);
HRESULT SetTapParameterInteractionContext(HINTERACTIONCONTEXT, TAP_PARAMETER, float);
HRESULT GetTapParameterInteractionContext(HINTERACTIONCONTEXT, TAP_PARAMETER, float*);
HRESULT SetHoldParameterInteractionContext(HINTERACTIONCONTEXT, HOLD_PARAMETER, float);
HRESULT GetHoldParameterInteractionContext(HINTERACTIONCONTEXT, HOLD_PARAMETER, float*);
HRESULT SetTranslationParameterInteractionContext(HINTERACTIONCONTEXT, TRANSLATION_PARAMETER, float);
HRESULT GetTranslationParameterInteractionContext(HINTERACTIONCONTEXT, TRANSLATION_PARAMETER, float*);
HRESULT SetMouseWheelParameterInteractionContext(HINTERACTIONCONTEXT, MOUSE_WHEEL_PARAMETER, float);
HRESULT GetMouseWheelParameterInteractionContext(HINTERACTIONCONTEXT, MOUSE_WHEEL_PARAMETER, float*);
HRESULT ResetInteractionContext(HINTERACTIONCONTEXT);
HRESULT GetStateInteractionContext(HINTERACTIONCONTEXT, const(POINTER_INFO)*, INTERACTION_STATE*);
HRESULT AddPointerInteractionContext(HINTERACTIONCONTEXT, uint);
HRESULT RemovePointerInteractionContext(HINTERACTIONCONTEXT, uint);
HRESULT ProcessPointerFramesInteractionContext(HINTERACTIONCONTEXT, uint, uint, const(POINTER_INFO)*);
HRESULT BufferPointerPacketsInteractionContext(HINTERACTIONCONTEXT, uint, const(POINTER_INFO)*);
HRESULT ProcessBufferedPacketsInteractionContext(HINTERACTIONCONTEXT);
HRESULT ProcessInertiaInteractionContext(HINTERACTIONCONTEXT);
HRESULT StopInteractionContext(HINTERACTIONCONTEXT);
HRESULT SetPivotInteractionContext(HINTERACTIONCONTEXT, float, float, float);
