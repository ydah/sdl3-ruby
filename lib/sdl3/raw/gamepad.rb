# frozen_string_literal: true

module SDL3
  module Raw
    SDL_GamepadType = enum :SDL_GAMEPAD_TYPE_UNKNOWN, 0,
                           :SDL_GAMEPAD_TYPE_STANDARD, 1,
                           :SDL_GAMEPAD_TYPE_XBOX360, 2,
                           :SDL_GAMEPAD_TYPE_XBOXONE, 3,
                           :SDL_GAMEPAD_TYPE_PS3, 4,
                           :SDL_GAMEPAD_TYPE_PS4, 5,
                           :SDL_GAMEPAD_TYPE_PS5, 6,
                           :SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO, 7,
                           :SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT, 8,
                           :SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT, 9,
                           :SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR, 10,
                           :SDL_GAMEPAD_TYPE_COUNT, 11

    SDL_GamepadButton = enum :SDL_GAMEPAD_BUTTON_INVALID, -1,
                             :SDL_GAMEPAD_BUTTON_SOUTH, 0,
                             :SDL_GAMEPAD_BUTTON_EAST, 1,
                             :SDL_GAMEPAD_BUTTON_WEST, 2,
                             :SDL_GAMEPAD_BUTTON_NORTH, 3,
                             :SDL_GAMEPAD_BUTTON_BACK, 4,
                             :SDL_GAMEPAD_BUTTON_GUIDE, 5,
                             :SDL_GAMEPAD_BUTTON_START, 6,
                             :SDL_GAMEPAD_BUTTON_LEFT_STICK, 7,
                             :SDL_GAMEPAD_BUTTON_RIGHT_STICK, 8,
                             :SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, 9,
                             :SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, 10,
                             :SDL_GAMEPAD_BUTTON_DPAD_UP, 11,
                             :SDL_GAMEPAD_BUTTON_DPAD_DOWN, 12,
                             :SDL_GAMEPAD_BUTTON_DPAD_LEFT, 13,
                             :SDL_GAMEPAD_BUTTON_DPAD_RIGHT, 14,
                             :SDL_GAMEPAD_BUTTON_MISC1, 15,
                             :SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1, 16,
                             :SDL_GAMEPAD_BUTTON_LEFT_PADDLE1, 17,
                             :SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2, 18,
                             :SDL_GAMEPAD_BUTTON_LEFT_PADDLE2, 19,
                             :SDL_GAMEPAD_BUTTON_TOUCHPAD, 20,
                             :SDL_GAMEPAD_BUTTON_MISC2, 21,
                             :SDL_GAMEPAD_BUTTON_MISC3, 22,
                             :SDL_GAMEPAD_BUTTON_MISC4, 23,
                             :SDL_GAMEPAD_BUTTON_MISC5, 24,
                             :SDL_GAMEPAD_BUTTON_MISC6, 25,
                             :SDL_GAMEPAD_BUTTON_COUNT, 26

    SDL_GamepadAxis = enum :SDL_GAMEPAD_AXIS_INVALID, -1,
                           :SDL_GAMEPAD_AXIS_LEFTX, 0,
                           :SDL_GAMEPAD_AXIS_LEFTY, 1,
                           :SDL_GAMEPAD_AXIS_RIGHTX, 2,
                           :SDL_GAMEPAD_AXIS_RIGHTY, 3,
                           :SDL_GAMEPAD_AXIS_LEFT_TRIGGER, 4,
                           :SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, 5,
                           :SDL_GAMEPAD_AXIS_COUNT, 6

    SDL_GamepadBindingType = enum :SDL_GAMEPAD_BINDTYPE_NONE, 0,
                                  :SDL_GAMEPAD_BINDTYPE_BUTTON, 1,
                                  :SDL_GAMEPAD_BINDTYPE_AXIS, 2,
                                  :SDL_GAMEPAD_BINDTYPE_HAT, 3

    attach_function :SDL_AddGamepadMapping, [:string], :int
    attach_function :SDL_AddGamepadMappingsFromIO, %i[pointer bool], :int
    attach_function :SDL_AddGamepadMappingsFromFile, [:string], :int
    attach_function :SDL_ReloadGamepadMappings, [], :bool
    attach_function :SDL_GetGamepadMappings, [:pointer], :pointer
    attach_function :SDL_GetGamepadMappingForGUID, [SDL_GUID.by_value], :string
    attach_function :SDL_GetGamepadMapping, [:pointer], :string
    attach_function :SDL_SetGamepadMapping, %i[SDL_JoystickID string], :bool
    attach_function :SDL_HasGamepad, [], :bool
    attach_function :SDL_GetGamepads, [:pointer], :pointer
    attach_function :SDL_IsGamepad, [:SDL_JoystickID], :bool
    attach_function :SDL_GetGamepadNameForID, [:SDL_JoystickID], :string
    attach_function :SDL_GetGamepadPathForID, [:SDL_JoystickID], :string
    attach_function :SDL_GetGamepadPlayerIndexForID, [:SDL_JoystickID], :int
    attach_function :SDL_GetGamepadGUIDForID, [:SDL_JoystickID], SDL_GUID.by_value
    attach_function :SDL_GetGamepadVendorForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetGamepadProductForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetGamepadProductVersionForID, [:SDL_JoystickID], :uint16
    attach_function :SDL_GetGamepadTypeForID, [:SDL_JoystickID], SDL_GamepadType
    attach_function :SDL_GetRealGamepadTypeForID, [:SDL_JoystickID], SDL_GamepadType
    attach_function :SDL_GetGamepadMappingForID, [:SDL_JoystickID], :string
    attach_function :SDL_OpenGamepad, [:SDL_JoystickID], :pointer
    attach_function :SDL_GetGamepadFromID, [:SDL_JoystickID], :pointer
    attach_function :SDL_GetGamepadFromPlayerIndex, [:int], :pointer
    attach_function :SDL_GetGamepadProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetGamepadID, [:pointer], :SDL_JoystickID
    attach_function :SDL_GetGamepadName, [:pointer], :string
    attach_function :SDL_GetGamepadPath, [:pointer], :string
    attach_function :SDL_GetGamepadType, [:pointer], SDL_GamepadType
    attach_function :SDL_GetRealGamepadType, [:pointer], SDL_GamepadType
    attach_function :SDL_GetGamepadPlayerIndex, [:pointer], :int
    attach_function :SDL_SetGamepadPlayerIndex, %i[pointer int], :bool
    attach_function :SDL_GetGamepadVendor, [:pointer], :uint16
    attach_function :SDL_GetGamepadProduct, [:pointer], :uint16
    attach_function :SDL_GetGamepadProductVersion, [:pointer], :uint16
    attach_function :SDL_GetGamepadFirmwareVersion, [:pointer], :uint16
    attach_function :SDL_GetGamepadSerial, [:pointer], :string
    attach_function :SDL_GetGamepadSteamHandle, [:pointer], :uint64
    attach_function :SDL_GetGamepadConnectionState, [:pointer], SDL_JoystickConnectionState
    attach_function :SDL_GetGamepadPowerInfo, %i[pointer pointer], :int32
    attach_function :SDL_GamepadConnected, [:pointer], :bool
    attach_function :SDL_GetGamepadJoystick, [:pointer], :pointer
    attach_function :SDL_SetGamepadEventsEnabled, [:bool], :void
    attach_function :SDL_GamepadEventsEnabled, [], :bool
    attach_function :SDL_GetGamepadBindings, %i[pointer pointer], :pointer
    attach_function :SDL_UpdateGamepads, [], :void
    attach_function :SDL_GetGamepadTypeFromString, [:string], SDL_GamepadType
    attach_function :SDL_GetGamepadStringForType, [SDL_GamepadType], :string
    attach_function :SDL_GetGamepadAxisFromString, [:string], SDL_GamepadAxis
    attach_function :SDL_GetGamepadStringForAxis, [SDL_GamepadAxis], :string
    attach_function :SDL_GamepadHasAxis, [:pointer, SDL_GamepadAxis], :bool
    attach_function :SDL_GetGamepadAxis, [:pointer, SDL_GamepadAxis], :int16
    attach_function :SDL_GetGamepadButtonFromString, [:string], SDL_GamepadButton
    attach_function :SDL_GetGamepadStringForButton, [SDL_GamepadButton], :string
    attach_function :SDL_GamepadHasButton, [:pointer, SDL_GamepadButton], :bool
    attach_function :SDL_GetGamepadButton, [:pointer, SDL_GamepadButton], :bool
    attach_function :SDL_GetGamepadButtonLabelForType, [SDL_GamepadType, SDL_GamepadButton], :int32
    attach_function :SDL_GetGamepadButtonLabel, [:pointer, SDL_GamepadButton], :int32
    attach_function :SDL_GetNumGamepadTouchpads, [:pointer], :int
    attach_function :SDL_GetNumGamepadTouchpadFingers, %i[pointer int], :int
    attach_function :SDL_GetGamepadTouchpadFinger, %i[pointer int int pointer pointer pointer pointer], :bool
    attach_function :SDL_GamepadHasSensor, %i[pointer int], :bool
    attach_function :SDL_SetGamepadSensorEnabled, %i[pointer int bool], :bool
    attach_function :SDL_GamepadSensorEnabled, %i[pointer int], :bool
    attach_function :SDL_GetGamepadSensorDataRate, %i[pointer int], :float
    attach_function :SDL_GetGamepadSensorData, %i[pointer int pointer int], :bool
    attach_function :SDL_RumbleGamepad, %i[pointer uint16 uint16 uint32], :bool
    attach_function :SDL_RumbleGamepadTriggers, %i[pointer uint16 uint16 uint32], :bool
    attach_function :SDL_SetGamepadLED, %i[pointer uint8 uint8 uint8], :bool
    attach_function :SDL_SendGamepadEffect, %i[pointer pointer int], :bool
    attach_function :SDL_CloseGamepad, [:pointer], :void
    attach_function :SDL_GetGamepadAppleSFSymbolsNameForButton, [:pointer, SDL_GamepadButton], :string
    attach_function :SDL_GetGamepadAppleSFSymbolsNameForAxis, [:pointer, SDL_GamepadAxis], :string
  end
end
