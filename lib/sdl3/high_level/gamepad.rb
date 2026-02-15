# frozen_string_literal: true

module SDL3
  class Gamepad
    attr_reader :ptr

    def initialize(instance_id)
      @ptr = Raw.SDL_OpenGamepad(instance_id)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_CloseGamepad(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(instance_id)
      gamepad = new(instance_id)
      return gamepad unless block_given?

      begin
        yield gamepad
      ensure
        gamepad.close
      end
    end

    def self.available?
      Raw.SDL_HasGamepad
    end

    def self.list
      count_ptr = FFI::MemoryPointer.new(:int)
      gamepads_ptr = Raw.SDL_GetGamepads(count_ptr)
      return [] if gamepads_ptr.null?

      count = count_ptr.read_int
      gamepads_ptr.read_array_of_uint32(count)
    end

    def self.name_for_id(instance_id)
      Raw.SDL_GetGamepadNameForID(instance_id)
    end

    def self.type_for_id(instance_id)
      Raw.SDL_GetGamepadTypeForID(instance_id)
    end

    def self.is_gamepad?(joystick_id)
      Raw.SDL_IsGamepad(joystick_id)
    end

    def self.add_mapping(mapping)
      Raw.SDL_AddGamepadMapping(mapping)
    end

    def self.add_mappings_from_file(file)
      Raw.SDL_AddGamepadMappingsFromFile(file)
    end

    def close
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseGamepad(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetGamepadID(@ptr)
    end

    def name
      Raw.SDL_GetGamepadName(@ptr)
    end

    def path
      Raw.SDL_GetGamepadPath(@ptr)
    end

    def type
      Raw.SDL_GetGamepadType(@ptr)
    end

    def real_type
      Raw.SDL_GetRealGamepadType(@ptr)
    end

    def vendor
      Raw.SDL_GetGamepadVendor(@ptr)
    end

    def product
      Raw.SDL_GetGamepadProduct(@ptr)
    end

    def product_version
      Raw.SDL_GetGamepadProductVersion(@ptr)
    end

    def firmware_version
      Raw.SDL_GetGamepadFirmwareVersion(@ptr)
    end

    def serial
      Raw.SDL_GetGamepadSerial(@ptr)
    end

    def connected?
      Raw.SDL_GamepadConnected(@ptr)
    end

    def joystick
      ptr = Raw.SDL_GetGamepadJoystick(@ptr)
      return nil if ptr.null?

      ptr
    end

    def axis(axis_id)
      Raw.SDL_GetGamepadAxis(@ptr, axis_id)
    end

    def button(button_id)
      Raw.SDL_GetGamepadButton(@ptr, button_id)
    end

    def button?(button_id)
      Raw.SDL_GetGamepadButton(@ptr, button_id)
    end

    def has_axis?(axis_id)
      Raw.SDL_GamepadHasAxis(@ptr, axis_id)
    end

    def has_button?(button_id)
      Raw.SDL_GamepadHasButton(@ptr, button_id)
    end

    def rumble(low_frequency, high_frequency, duration_ms)
      Raw.SDL_RumbleGamepad(@ptr, low_frequency, high_frequency, duration_ms)
    end

    def rumble_triggers(left, right, duration_ms)
      Raw.SDL_RumbleGamepadTriggers(@ptr, left, right, duration_ms)
    end

    def set_led(red, green, blue)
      Raw.SDL_SetGamepadLED(@ptr, red, green, blue)
    end

    def player_index
      Raw.SDL_GetGamepadPlayerIndex(@ptr)
    end

    def player_index=(index)
      Raw.SDL_SetGamepadPlayerIndex(@ptr, index)
    end

    def connection_state
      Raw.SDL_GetGamepadConnectionState(@ptr)
    end

    def num_touchpads
      Raw.SDL_GetNumGamepadTouchpads(@ptr)
    end

    def has_sensor?(sensor_type)
      Raw.SDL_GamepadHasSensor(@ptr, sensor_type)
    end

    def set_sensor_enabled(sensor_type, enabled)
      Raw.SDL_SetGamepadSensorEnabled(@ptr, sensor_type, enabled)
    end

    def sensor_enabled?(sensor_type)
      Raw.SDL_GamepadSensorEnabled(@ptr, sensor_type)
    end

    def mapping
      Raw.SDL_GetGamepadMapping(@ptr)
    end

    def to_ptr
      @ptr
    end
  end
end
