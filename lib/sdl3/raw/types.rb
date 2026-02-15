# frozen_string_literal: true

module SDL3
  module Raw
    typedef :uint32, :SDL_WindowID
    typedef :uint32, :SDL_AudioDeviceID
    typedef :uint32, :SDL_JoystickID
    typedef :uint32, :SDL_GamepadID
    typedef :uint32, :SDL_SensorID
    typedef :uint32, :SDL_CameraID
    typedef :uint32, :SDL_PropertiesID
    typedef :uint64, :SDL_TouchID
    typedef :uint64, :SDL_FingerID
    typedef :uint32, :SDL_MouseID
    typedef :uint32, :SDL_KeyboardID
    typedef :uint32, :SDL_PenID
    typedef :uint32, :SDL_TimerID
    typedef :uint32, :SDL_Keycode
    typedef :uint32, :SDL_Scancode
  end
end
