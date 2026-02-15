# frozen_string_literal: true

module SDL3
  module Raw
    typedef :uint32, :SDL_HapticID

    SDL_HAPTIC_CONSTANT = 1 << 0
    SDL_HAPTIC_SINE = 1 << 1
    SDL_HAPTIC_SQUARE = 1 << 2
    SDL_HAPTIC_TRIANGLE = 1 << 3
    SDL_HAPTIC_SAWTOOTHUP = 1 << 4
    SDL_HAPTIC_SAWTOOTHDOWN = 1 << 5
    SDL_HAPTIC_RAMP = 1 << 6
    SDL_HAPTIC_SPRING = 1 << 7
    SDL_HAPTIC_DAMPER = 1 << 8
    SDL_HAPTIC_INERTIA = 1 << 9
    SDL_HAPTIC_FRICTION = 1 << 10
    SDL_HAPTIC_LEFTRIGHT = 1 << 11
    SDL_HAPTIC_RESERVED1 = 1 << 12
    SDL_HAPTIC_RESERVED2 = 1 << 13
    SDL_HAPTIC_RESERVED3 = 1 << 14
    SDL_HAPTIC_CUSTOM = 1 << 15
    SDL_HAPTIC_GAIN = 1 << 16
    SDL_HAPTIC_AUTOCENTER = 1 << 17
    SDL_HAPTIC_STATUS = 1 << 18
    SDL_HAPTIC_PAUSE = 1 << 19

    SDL_HAPTIC_POLAR = 0
    SDL_HAPTIC_CARTESIAN = 1
    SDL_HAPTIC_SPHERICAL = 2
    SDL_HAPTIC_STEERING_AXIS = 3

    SDL_HAPTIC_INFINITY = 4294967295

    class SDL_HapticDirection < FFI::Struct
      layout :type, :uint8,
             :dir, [:int32, 3]
    end

    class SDL_HapticConstant < FFI::Struct
      layout :type, :uint16,
             :direction, SDL_HapticDirection,
             :length, :uint32,
             :delay, :uint16,
             :button, :uint16,
             :interval, :uint16,
             :level, :int16,
             :attack_length, :uint16,
             :attack_level, :uint16,
             :fade_length, :uint16,
             :fade_level, :uint16
    end

    class SDL_HapticPeriodic < FFI::Struct
      layout :type, :uint16,
             :direction, SDL_HapticDirection,
             :length, :uint32,
             :delay, :uint16,
             :button, :uint16,
             :interval, :uint16,
             :period, :uint16,
             :magnitude, :int16,
             :offset, :int16,
             :phase, :uint16,
             :attack_length, :uint16,
             :attack_level, :uint16,
             :fade_length, :uint16,
             :fade_level, :uint16
    end

    class SDL_HapticCondition < FFI::Struct
      layout :type, :uint16,
             :direction, SDL_HapticDirection,
             :length, :uint32,
             :delay, :uint16,
             :button, :uint16,
             :interval, :uint16,
             :right_sat, [:uint16, 3],
             :left_sat, [:uint16, 3],
             :right_coeff, [:int16, 3],
             :left_coeff, [:int16, 3],
             :deadband, [:uint16, 3],
             :center, [:int16, 3]
    end

    class SDL_HapticRamp < FFI::Struct
      layout :type, :uint16,
             :direction, SDL_HapticDirection,
             :length, :uint32,
             :delay, :uint16,
             :button, :uint16,
             :interval, :uint16,
             :start, :int16,
             :end, :int16,
             :attack_length, :uint16,
             :attack_level, :uint16,
             :fade_length, :uint16,
             :fade_level, :uint16
    end

    class SDL_HapticLeftRight < FFI::Struct
      layout :type, :uint16,
             :length, :uint32,
             :large_magnitude, :uint16,
             :small_magnitude, :uint16
    end

    class SDL_HapticCustom < FFI::Struct
      layout :type, :uint16,
             :direction, SDL_HapticDirection,
             :length, :uint32,
             :delay, :uint16,
             :button, :uint16,
             :interval, :uint16,
             :channels, :uint8,
             :period, :uint16,
             :samples, :uint16,
             :data, :pointer,
             :attack_length, :uint16,
             :attack_level, :uint16,
             :fade_length, :uint16,
             :fade_level, :uint16
    end

    class SDL_HapticEffect < FFI::Union
      layout :type, :uint16,
             :constant, SDL_HapticConstant,
             :periodic, SDL_HapticPeriodic,
             :condition, SDL_HapticCondition,
             :ramp, SDL_HapticRamp,
             :leftright, SDL_HapticLeftRight,
             :custom, SDL_HapticCustom
    end

    attach_function :SDL_GetHaptics, [:pointer], :pointer
    attach_function :SDL_GetHapticNameForID, [:SDL_HapticID], :string
    attach_function :SDL_OpenHaptic, [:SDL_HapticID], :pointer
    attach_function :SDL_GetHapticFromID, [:SDL_HapticID], :pointer
    attach_function :SDL_GetHapticID, [:pointer], :SDL_HapticID
    attach_function :SDL_GetHapticName, [:pointer], :string
    attach_function :SDL_IsMouseHaptic, [], :bool
    attach_function :SDL_OpenHapticFromMouse, [], :pointer
    attach_function :SDL_IsJoystickHaptic, [:pointer], :bool
    attach_function :SDL_OpenHapticFromJoystick, [:pointer], :pointer
    attach_function :SDL_CloseHaptic, [:pointer], :void
    attach_function :SDL_GetMaxHapticEffects, [:pointer], :int
    attach_function :SDL_GetMaxHapticEffectsPlaying, [:pointer], :int
    attach_function :SDL_GetHapticFeatures, [:pointer], :uint32
    attach_function :SDL_GetNumHapticAxes, [:pointer], :int
    attach_function :SDL_HapticEffectSupported, [:pointer, SDL_HapticEffect.ptr], :bool
    attach_function :SDL_CreateHapticEffect, [:pointer, SDL_HapticEffect.ptr], :int
    attach_function :SDL_UpdateHapticEffect, [:pointer, :int, SDL_HapticEffect.ptr], :bool
    attach_function :SDL_RunHapticEffect, %i[pointer int uint32], :bool
    attach_function :SDL_StopHapticEffect, %i[pointer int], :bool
    attach_function :SDL_DestroyHapticEffect, %i[pointer int], :void
    attach_function :SDL_GetHapticEffectStatus, %i[pointer int], :bool
    attach_function :SDL_SetHapticGain, %i[pointer int], :bool
    attach_function :SDL_SetHapticAutocenter, %i[pointer int], :bool
    attach_function :SDL_PauseHaptic, [:pointer], :bool
    attach_function :SDL_ResumeHaptic, [:pointer], :bool
    attach_function :SDL_StopHapticEffects, [:pointer], :bool
    attach_function :SDL_HapticRumbleSupported, [:pointer], :bool
    attach_function :SDL_InitHapticRumble, [:pointer], :bool
    attach_function :SDL_PlayHapticRumble, %i[pointer float uint32], :bool
    attach_function :SDL_StopHapticRumble, [:pointer], :bool
  end
end
