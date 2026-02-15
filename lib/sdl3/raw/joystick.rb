# frozen_string_literal: true

module SDL3
  module Raw
    SDL_JoystickType = enum :SDL_JOYSTICK_TYPE_UNKNOWN, 0,
                            :SDL_JOYSTICK_TYPE_GAMEPAD, 1,
                            :SDL_JOYSTICK_TYPE_WHEEL, 2,
                            :SDL_JOYSTICK_TYPE_ARCADE_STICK, 3,
                            :SDL_JOYSTICK_TYPE_FLIGHT_STICK, 4,
                            :SDL_JOYSTICK_TYPE_DANCE_PAD, 5,
                            :SDL_JOYSTICK_TYPE_GUITAR, 6,
                            :SDL_JOYSTICK_TYPE_DRUM_KIT, 7,
                            :SDL_JOYSTICK_TYPE_ARCADE_PAD, 8,
                            :SDL_JOYSTICK_TYPE_THROTTLE, 9,
                            :SDL_JOYSTICK_TYPE_COUNT, 10

    SDL_JoystickConnectionState = enum :SDL_JOYSTICK_CONNECTION_INVALID, -1,
                                       :SDL_JOYSTICK_CONNECTION_UNKNOWN, 0,
                                       :SDL_JOYSTICK_CONNECTION_WIRED, 1,
                                       :SDL_JOYSTICK_CONNECTION_WIRELESS, 2

    SDL_HAT_CENTERED = 0x00
    SDL_HAT_UP = 0x01
    SDL_HAT_RIGHT = 0x02
    SDL_HAT_DOWN = 0x04
    SDL_HAT_LEFT = 0x08
    SDL_HAT_RIGHTUP = SDL_HAT_RIGHT | SDL_HAT_UP
    SDL_HAT_RIGHTDOWN = SDL_HAT_RIGHT | SDL_HAT_DOWN
    SDL_HAT_LEFTUP = SDL_HAT_LEFT | SDL_HAT_UP
    SDL_HAT_LEFTDOWN = SDL_HAT_LEFT | SDL_HAT_DOWN

    attach_function :SDL_LockJoysticks, [], :void
    begin
      attach_function :SDL_TryLockJoysticks, [], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_UnlockJoysticks, [], :void
    attach_function :SDL_HasJoystick, [], :bool
    attach_function :SDL_GetJoysticks, [:pointer], :pointer
    attach_function :SDL_GetJoystickNameForID, [:SDL_JoystickID], :string
    attach_function :SDL_GetJoystickPathForID, [:SDL_JoystickID], :string
    attach_function :SDL_GetJoystickPlayerIndexForID, [:SDL_JoystickID], :int
    attach_function :SDL_GetJoystickGUIDForID, [:SDL_JoystickID], SDL_GUID.by_value
    attach_function :SDL_GetJoystickVendorForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetJoystickProductForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetJoystickProductVersionForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetJoystickTypeForID, [:SDL_JoystickID], SDL_JoystickType
    attach_function :SDL_OpenJoystick, [:SDL_JoystickID], :pointer
    attach_function :SDL_GetJoystickFromID, [:SDL_JoystickID], :pointer
    attach_function :SDL_GetJoystickFromPlayerIndex, [:int], :pointer
    attach_function :SDL_GetJoystickProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetJoystickName, [:pointer], :string
    attach_function :SDL_GetJoystickPath, [:pointer], :string
    attach_function :SDL_GetJoystickPlayerIndex, [:pointer], :int
    attach_function :SDL_SetJoystickPlayerIndex, %i[pointer int], :bool
    attach_function :SDL_GetJoystickGUID, [:pointer], SDL_GUID.by_value
    attach_function :SDL_GetJoystickVendor, [:pointer], :uint16
    attach_function :SDL_GetJoystickProduct, [:pointer], :uint16
    attach_function :SDL_GetJoystickProductVersion, [:pointer], :uint16
    attach_function :SDL_GetJoystickFirmwareVersion, [:pointer], :uint16
    attach_function :SDL_GetJoystickSerial, [:pointer], :string
    attach_function :SDL_GetJoystickType, [:pointer], SDL_JoystickType
    attach_function :SDL_GetJoystickID, [:pointer], :SDL_JoystickID
    attach_function :SDL_JoystickConnected, [:pointer], :bool
    attach_function :SDL_GetNumJoystickAxes, [:pointer], :int
    attach_function :SDL_GetNumJoystickBalls, [:pointer], :int
    attach_function :SDL_GetNumJoystickHats, [:pointer], :int
    attach_function :SDL_GetNumJoystickButtons, [:pointer], :int
    attach_function :SDL_SetJoystickEventsEnabled, [:bool], :void
    attach_function :SDL_JoystickEventsEnabled, [], :bool
    attach_function :SDL_UpdateJoysticks, [], :void
    attach_function :SDL_GetJoystickAxis, %i[pointer int], :int16
    attach_function :SDL_GetJoystickAxisInitialState, %i[pointer int pointer], :bool
    attach_function :SDL_GetJoystickBall, %i[pointer int pointer pointer], :bool
    attach_function :SDL_GetJoystickHat, %i[pointer int], :uint8
    attach_function :SDL_GetJoystickButton, %i[pointer int], :bool
    attach_function :SDL_RumbleJoystick, %i[pointer uint16 uint16 uint32], :bool
    attach_function :SDL_RumbleJoystickTriggers, %i[pointer uint16 uint16 uint32], :bool
    attach_function :SDL_SetJoystickLED, %i[pointer uint8 uint8 uint8], :bool
    attach_function :SDL_SendJoystickEffect, %i[pointer pointer int], :bool
    attach_function :SDL_CloseJoystick, [:pointer], :void
    attach_function :SDL_GetJoystickConnectionState, [:pointer], SDL_JoystickConnectionState
    attach_function :SDL_GetJoystickPowerInfo, %i[pointer pointer], :int32

    begin
      attach_function :SDL_AttachVirtualJoystick, [:pointer], :SDL_JoystickID
      attach_function :SDL_DetachVirtualJoystick, [:SDL_JoystickID], :bool
      attach_function :SDL_IsJoystickVirtual, [:SDL_JoystickID], :bool
      attach_function :SDL_SetJoystickVirtualAxis, %i[pointer int int16], :bool
      attach_function :SDL_SetJoystickVirtualBall, %i[pointer int int16 int16], :bool
      attach_function :SDL_SetJoystickVirtualButton, %i[pointer int bool], :bool
      attach_function :SDL_SetJoystickVirtualHat, %i[pointer int uint8], :bool
      attach_function :SDL_SetJoystickVirtualTouchpad, %i[pointer int int bool float float float], :bool
      attach_function :SDL_SendJoystickVirtualSensorData, %i[pointer int uint64 pointer int], :bool
      attach_function :SDL_GetJoystickGUIDInfo, [SDL_GUID.by_value, :pointer, :pointer, :pointer, :pointer], :void
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
  end
end
