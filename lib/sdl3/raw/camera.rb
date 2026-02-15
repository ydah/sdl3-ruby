# frozen_string_literal: true

module SDL3
  module Raw
    SDL_CameraPosition = enum :SDL_CAMERA_POSITION_UNKNOWN, 0,
                              :SDL_CAMERA_POSITION_FRONT_FACING, 1,
                              :SDL_CAMERA_POSITION_BACK_FACING, 2

    class SDL_CameraSpec < FFI::Struct
      layout :format, :uint32,
             :colorspace, :uint32,
             :width, :int,
             :height, :int,
             :framerate_numerator, :int,
             :framerate_denominator, :int
    end

    begin
      attach_function :SDL_GetNumCameraDrivers, [], :int
      attach_function :SDL_GetCameraDriver, [:int], :string
      attach_function :SDL_GetCurrentCameraDriver, [], :string
      attach_function :SDL_GetCameras, [:pointer], :pointer
      attach_function :SDL_GetCameraSupportedFormats, [:SDL_CameraID, :pointer], :pointer
      attach_function :SDL_GetCameraName, [:SDL_CameraID], :string
      attach_function :SDL_GetCameraPosition, [:SDL_CameraID], SDL_CameraPosition
      attach_function :SDL_OpenCamera, [:SDL_CameraID, SDL_CameraSpec.ptr], :pointer
      attach_function :SDL_GetCameraPermissionState, [:pointer], :int
      attach_function :SDL_GetCameraID, [:pointer], :SDL_CameraID
      attach_function :SDL_GetCameraProperties, [:pointer], :SDL_PropertiesID
      attach_function :SDL_GetCameraFormat, [:pointer, SDL_CameraSpec.ptr], :bool
      attach_function :SDL_AcquireCameraFrame, %i[pointer pointer], :pointer
      attach_function :SDL_ReleaseCameraFrame, [:pointer, :pointer], :void
      attach_function :SDL_CloseCamera, [:pointer], :void
    rescue FFI::NotFoundError
      # Camera API may not be available in all SDL3 versions
    end
  end
end
