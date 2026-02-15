# frozen_string_literal: true

module SDL3
  class Haptic
    attr_reader :ptr

    CONSTANT = Raw::SDL_HAPTIC_CONSTANT
    SINE = Raw::SDL_HAPTIC_SINE
    SQUARE = Raw::SDL_HAPTIC_SQUARE
    TRIANGLE = Raw::SDL_HAPTIC_TRIANGLE
    SAWTOOTHUP = Raw::SDL_HAPTIC_SAWTOOTHUP
    SAWTOOTHDOWN = Raw::SDL_HAPTIC_SAWTOOTHDOWN
    RAMP = Raw::SDL_HAPTIC_RAMP
    SPRING = Raw::SDL_HAPTIC_SPRING
    DAMPER = Raw::SDL_HAPTIC_DAMPER
    INERTIA = Raw::SDL_HAPTIC_INERTIA
    FRICTION = Raw::SDL_HAPTIC_FRICTION
    LEFTRIGHT = Raw::SDL_HAPTIC_LEFTRIGHT
    CUSTOM = Raw::SDL_HAPTIC_CUSTOM
    GAIN = Raw::SDL_HAPTIC_GAIN
    AUTOCENTER = Raw::SDL_HAPTIC_AUTOCENTER
    STATUS = Raw::SDL_HAPTIC_STATUS
    PAUSE = Raw::SDL_HAPTIC_PAUSE

    POLAR = Raw::SDL_HAPTIC_POLAR
    CARTESIAN = Raw::SDL_HAPTIC_CARTESIAN
    SPHERICAL = Raw::SDL_HAPTIC_SPHERICAL
    STEERING_AXIS = Raw::SDL_HAPTIC_STEERING_AXIS

    INFINITY = Raw::SDL_HAPTIC_INFINITY

    def initialize(haptic_id)
      @ptr = Raw.SDL_OpenHaptic(haptic_id)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_CloseHaptic(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(haptic_id)
      haptic = new(haptic_id)
      return haptic unless block_given?

      begin
        yield haptic
      ensure
        haptic.close
      end
    end

    def self.open_from_mouse
      ptr = Raw.SDL_OpenHapticFromMouse
      raise Error, Raw.SDL_GetError if ptr.null?

      haptic = allocate
      haptic.instance_variable_set(:@ptr, ptr)
      ObjectSpace.define_finalizer(haptic, releasing(ptr))

      return haptic unless block_given?

      begin
        yield haptic
      ensure
        haptic.close
      end
    end

    def self.open_from_joystick(joystick)
      ptr = Raw.SDL_OpenHapticFromJoystick(joystick.to_ptr)
      raise Error, Raw.SDL_GetError if ptr.null?

      haptic = allocate
      haptic.instance_variable_set(:@ptr, ptr)
      ObjectSpace.define_finalizer(haptic, releasing(ptr))

      return haptic unless block_given?

      begin
        yield haptic
      ensure
        haptic.close
      end
    end

    def self.list
      count_ptr = FFI::MemoryPointer.new(:int)
      haptics_ptr = Raw.SDL_GetHaptics(count_ptr)
      return [] if haptics_ptr.null?

      count = count_ptr.read_int
      haptics_ptr.read_array_of_uint32(count)
    end

    def self.name_for_id(haptic_id)
      Raw.SDL_GetHapticNameForID(haptic_id)
    end

    def self.mouse_haptic?
      Raw.SDL_IsMouseHaptic
    end

    def self.joystick_haptic?(joystick)
      Raw.SDL_IsJoystickHaptic(joystick.to_ptr)
    end

    def close
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseHaptic(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetHapticID(@ptr)
    end

    def name
      Raw.SDL_GetHapticName(@ptr)
    end

    def max_effects
      Raw.SDL_GetMaxHapticEffects(@ptr)
    end

    def max_effects_playing
      Raw.SDL_GetMaxHapticEffectsPlaying(@ptr)
    end

    def features
      Raw.SDL_GetHapticFeatures(@ptr)
    end

    def num_axes
      Raw.SDL_GetNumHapticAxes(@ptr)
    end

    def effect_supported?(effect)
      Raw.SDL_HapticEffectSupported(@ptr, effect)
    end

    def create_effect(effect)
      result = Raw.SDL_CreateHapticEffect(@ptr, effect)
      raise Error, Raw.SDL_GetError if result < 0

      result
    end

    def update_effect(effect_id, effect)
      Raw.SDL_UpdateHapticEffect(@ptr, effect_id, effect)
    end

    def run_effect(effect_id, iterations = 1)
      Raw.SDL_RunHapticEffect(@ptr, effect_id, iterations)
    end

    def stop_effect(effect_id)
      Raw.SDL_StopHapticEffect(@ptr, effect_id)
    end

    def destroy_effect(effect_id)
      Raw.SDL_DestroyHapticEffect(@ptr, effect_id)
    end

    def effect_status(effect_id)
      Raw.SDL_GetHapticEffectStatus(@ptr, effect_id)
    end

    def gain=(value)
      Raw.SDL_SetHapticGain(@ptr, value)
    end

    def autocenter=(value)
      Raw.SDL_SetHapticAutocenter(@ptr, value)
    end

    def pause
      Raw.SDL_PauseHaptic(@ptr)
    end

    def resume
      Raw.SDL_ResumeHaptic(@ptr)
    end

    def stop_all
      Raw.SDL_StopHapticEffects(@ptr)
    end

    def rumble_supported?
      Raw.SDL_HapticRumbleSupported(@ptr)
    end

    def init_rumble
      Raw.SDL_InitHapticRumble(@ptr)
    end

    def play_rumble(strength, duration_ms)
      Raw.SDL_PlayHapticRumble(@ptr, strength, duration_ms)
    end

    def stop_rumble
      Raw.SDL_StopHapticRumble(@ptr)
    end

    def to_ptr
      @ptr
    end
  end
end
