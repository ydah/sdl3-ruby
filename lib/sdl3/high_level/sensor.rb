# frozen_string_literal: true

module SDL3
  class Sensor
    attr_reader :ptr

    STANDARD_GRAVITY = Raw::SDL_STANDARD_GRAVITY

    TYPE_INVALID = :SDL_SENSOR_INVALID
    TYPE_UNKNOWN = :SDL_SENSOR_UNKNOWN
    TYPE_ACCEL = :SDL_SENSOR_ACCEL
    TYPE_GYRO = :SDL_SENSOR_GYRO
    TYPE_ACCEL_L = :SDL_SENSOR_ACCEL_L
    TYPE_GYRO_L = :SDL_SENSOR_GYRO_L
    TYPE_ACCEL_R = :SDL_SENSOR_ACCEL_R
    TYPE_GYRO_R = :SDL_SENSOR_GYRO_R

    def initialize(sensor_id)
      @ptr = Raw.SDL_OpenSensor(sensor_id)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_CloseSensor(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(sensor_id)
      sensor = new(sensor_id)
      return sensor unless block_given?

      begin
        yield sensor
      ensure
        sensor.close
      end
    end

    def self.list
      count_ptr = FFI::MemoryPointer.new(:int)
      sensors_ptr = Raw.SDL_GetSensors(count_ptr)
      return [] if sensors_ptr.null?

      count = count_ptr.read_int
      sensors_ptr.read_array_of_uint32(count)
    end

    def self.name_for_id(sensor_id)
      Raw.SDL_GetSensorNameForID(sensor_id)
    end

    def self.type_for_id(sensor_id)
      Raw.SDL_GetSensorTypeForID(sensor_id)
    end

    def self.non_portable_type_for_id(sensor_id)
      Raw.SDL_GetSensorNonPortableTypeForID(sensor_id)
    end

    def self.update_all
      Raw.SDL_UpdateSensors
    end

    def close
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseSensor(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetSensorID(@ptr)
    end

    def name
      Raw.SDL_GetSensorName(@ptr)
    end

    def type
      Raw.SDL_GetSensorType(@ptr)
    end

    def non_portable_type
      Raw.SDL_GetSensorNonPortableType(@ptr)
    end

    def properties
      Raw.SDL_GetSensorProperties(@ptr)
    end

    def data(num_values = 3)
      data_ptr = FFI::MemoryPointer.new(:float, num_values)
      return nil unless Raw.SDL_GetSensorData(@ptr, data_ptr, num_values)

      data_ptr.read_array_of_float(num_values)
    end

    def to_ptr
      @ptr
    end
  end
end
