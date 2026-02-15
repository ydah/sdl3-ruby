# frozen_string_literal: true

module SDL3
  class Camera
    attr_reader :ptr

    POSITION_UNKNOWN = :SDL_CAMERA_POSITION_UNKNOWN
    POSITION_FRONT_FACING = :SDL_CAMERA_POSITION_FRONT_FACING
    POSITION_BACK_FACING = :SDL_CAMERA_POSITION_BACK_FACING

    def initialize(camera_id, spec = nil)
      @ptr = Raw.SDL_OpenCamera(camera_id, spec)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_CloseCamera(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(camera_id, spec = nil)
      camera = new(camera_id, spec)
      return camera unless block_given?

      begin
        yield camera
      ensure
        camera.close
      end
    end

    def self.num_drivers
      Raw.SDL_GetNumCameraDrivers
    end

    def self.driver(index)
      Raw.SDL_GetCameraDriver(index)
    end

    def self.current_driver
      Raw.SDL_GetCurrentCameraDriver
    end

    def self.list
      count_ptr = FFI::MemoryPointer.new(:int)
      cameras_ptr = Raw.SDL_GetCameras(count_ptr)
      return [] if cameras_ptr.null?

      count = count_ptr.read_int
      cameras_ptr.read_array_of_uint32(count)
    end

    def self.name_for_id(camera_id)
      Raw.SDL_GetCameraName(camera_id)
    end

    def self.position_for_id(camera_id)
      Raw.SDL_GetCameraPosition(camera_id)
    end

    def self.supported_formats(camera_id)
      count_ptr = FFI::MemoryPointer.new(:int)
      formats_ptr = Raw.SDL_GetCameraSupportedFormats(camera_id, count_ptr)
      return [] if formats_ptr.null?

      count = count_ptr.read_int
      count.times.map do |i|
        spec_ptr = formats_ptr.get_pointer(i * FFI::Pointer.size)
        Raw::SDL_CameraSpec.new(spec_ptr)
      end
    end

    def close
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseCamera(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetCameraID(@ptr)
    end

    def properties
      Raw.SDL_GetCameraProperties(@ptr)
    end

    def permission_state
      Raw.SDL_GetCameraPermissionState(@ptr)
    end

    def format
      spec = Raw::SDL_CameraSpec.new
      return nil unless Raw.SDL_GetCameraFormat(@ptr, spec)

      spec
    end

    def acquire_frame
      timestamp_ptr = FFI::MemoryPointer.new(:uint64)
      surface_ptr = Raw.SDL_AcquireCameraFrame(@ptr, timestamp_ptr)
      return nil if surface_ptr.null?

      [surface_ptr, timestamp_ptr.read_uint64]
    end

    def release_frame(surface_ptr)
      Raw.SDL_ReleaseCameraFrame(@ptr, surface_ptr)
    end

    def to_ptr
      @ptr
    end
  end
end
