# frozen_string_literal: true

module SDL3
  module Raw
    SDL_TouchDeviceType = enum :SDL_TOUCH_DEVICE_INVALID, -1,
                               :SDL_TOUCH_DEVICE_DIRECT, 0,
                               :SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE, 1,
                               :SDL_TOUCH_DEVICE_INDIRECT_RELATIVE, 2

    class SDL_Finger < FFI::Struct
      layout :id, :SDL_FingerID,
             :x, :float,
             :y, :float,
             :pressure, :float
    end

    attach_function :SDL_GetTouchDevices, [:pointer], :pointer
    attach_function :SDL_GetTouchDeviceName, [:SDL_TouchID], :string
    attach_function :SDL_GetTouchDeviceType, [:SDL_TouchID], SDL_TouchDeviceType
    attach_function :SDL_GetTouchFingers, [:SDL_TouchID, :pointer], :pointer
  end
end
