# frozen_string_literal: true

module SDL3
  class Joystick
    attr_reader :ptr

    HAT_CENTERED = Raw::SDL_HAT_CENTERED
    HAT_UP = Raw::SDL_HAT_UP
    HAT_RIGHT = Raw::SDL_HAT_RIGHT
    HAT_DOWN = Raw::SDL_HAT_DOWN
    HAT_LEFT = Raw::SDL_HAT_LEFT

    def initialize(instance_id)
      @ptr = Raw.SDL_OpenJoystick(instance_id)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_CloseJoystick(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(instance_id)
      joystick = new(instance_id)
      return joystick unless block_given?

      begin
        yield joystick
      ensure
        joystick.close
      end
    end

    def self.available?
      Raw.SDL_HasJoystick
    end

    def self.list
      count_ptr = FFI::MemoryPointer.new(:int)
      joysticks_ptr = Raw.SDL_GetJoysticks(count_ptr)
      return [] if joysticks_ptr.null?

      count = count_ptr.read_int
      joysticks_ptr.read_array_of_uint32(count)
    end

    def self.name_for_id(instance_id)
      Raw.SDL_GetJoystickNameForID(instance_id)
    end

    def self.type_for_id(instance_id)
      Raw.SDL_GetJoystickTypeForID(instance_id)
    end

    def close
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseJoystick(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetJoystickID(@ptr)
    end

    def name
      Raw.SDL_GetJoystickName(@ptr)
    end

    def path
      Raw.SDL_GetJoystickPath(@ptr)
    end

    def type
      Raw.SDL_GetJoystickType(@ptr)
    end

    def vendor
      Raw.SDL_GetJoystickVendor(@ptr)
    end

    def product
      Raw.SDL_GetJoystickProduct(@ptr)
    end

    def product_version
      Raw.SDL_GetJoystickProductVersion(@ptr)
    end

    def firmware_version
      Raw.SDL_GetJoystickFirmwareVersion(@ptr)
    end

    def serial
      Raw.SDL_GetJoystickSerial(@ptr)
    end

    def connected?
      Raw.SDL_JoystickConnected(@ptr)
    end

    def num_axes
      Raw.SDL_GetNumJoystickAxes(@ptr)
    end

    def num_balls
      Raw.SDL_GetNumJoystickBalls(@ptr)
    end

    def num_hats
      Raw.SDL_GetNumJoystickHats(@ptr)
    end

    def num_buttons
      Raw.SDL_GetNumJoystickButtons(@ptr)
    end

    def axis(index)
      Raw.SDL_GetJoystickAxis(@ptr, index)
    end

    def hat(index)
      Raw.SDL_GetJoystickHat(@ptr, index)
    end

    def button(index)
      Raw.SDL_GetJoystickButton(@ptr, index)
    end

    def button?(index)
      Raw.SDL_GetJoystickButton(@ptr, index)
    end

    def rumble(low_frequency, high_frequency, duration_ms)
      Raw.SDL_RumbleJoystick(@ptr, low_frequency, high_frequency, duration_ms)
    end

    def rumble_triggers(left, right, duration_ms)
      Raw.SDL_RumbleJoystickTriggers(@ptr, left, right, duration_ms)
    end

    def set_led(red, green, blue)
      Raw.SDL_SetJoystickLED(@ptr, red, green, blue)
    end

    def player_index
      Raw.SDL_GetJoystickPlayerIndex(@ptr)
    end

    def player_index=(index)
      Raw.SDL_SetJoystickPlayerIndex(@ptr, index)
    end

    def connection_state
      Raw.SDL_GetJoystickConnectionState(@ptr)
    end

    def to_ptr
      @ptr
    end
  end
end
