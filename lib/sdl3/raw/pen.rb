# frozen_string_literal: true

module SDL3
  module Raw
    SDL_PEN_INPUT_DOWN = 1 << 0
    SDL_PEN_INPUT_BUTTON_1 = 1 << 1
    SDL_PEN_INPUT_BUTTON_2 = 1 << 2
    SDL_PEN_INPUT_BUTTON_3 = 1 << 3
    SDL_PEN_INPUT_BUTTON_4 = 1 << 4
    SDL_PEN_INPUT_BUTTON_5 = 1 << 5
    SDL_PEN_INPUT_ERASER_TIP = 1 << 30

    SDL_PenAxis = enum :SDL_PEN_AXIS_PRESSURE, 0,
                       :SDL_PEN_AXIS_XTILT, 1,
                       :SDL_PEN_AXIS_YTILT, 2,
                       :SDL_PEN_AXIS_DISTANCE, 3,
                       :SDL_PEN_AXIS_ROTATION, 4,
                       :SDL_PEN_AXIS_SLIDER, 5,
                       :SDL_PEN_AXIS_TANGENTIAL_PRESSURE, 6,
                       :SDL_PEN_AXIS_COUNT, 7

    SDL_PenDeviceType = enum :SDL_PEN_DEVICE_TYPE_INVALID, -1,
                             :SDL_PEN_DEVICE_TYPE_UNKNOWN, 0,
                             :SDL_PEN_DEVICE_TYPE_DIRECT, 1,
                             :SDL_PEN_DEVICE_TYPE_INDIRECT, 2

    begin
      attach_function :SDL_GetPens, [:pointer], :pointer
      attach_function :SDL_GetPenDeviceType, [:SDL_PenID], SDL_PenDeviceType
      attach_function :SDL_GetPenStatus, %i[SDL_PenID pointer pointer], :uint32
      attach_function :SDL_GetPenName, [:SDL_PenID], :string
      attach_function :SDL_PenConnected, [:SDL_PenID], :bool
      attach_function :SDL_GetPenCapabilities, %i[SDL_PenID pointer], :uint32
    rescue FFI::NotFoundError
      # Pen API may not be available in all SDL3 versions
    end
  end
end
