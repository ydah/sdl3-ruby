# frozen_string_literal: true

module SDL3
  module Raw
    SDL_STANDARD_GRAVITY = 9.80665

    SDL_SensorType = enum :SDL_SENSOR_INVALID, -1,
                          :SDL_SENSOR_UNKNOWN, 0,
                          :SDL_SENSOR_ACCEL, 1,
                          :SDL_SENSOR_GYRO, 2,
                          :SDL_SENSOR_ACCEL_L, 3,
                          :SDL_SENSOR_GYRO_L, 4,
                          :SDL_SENSOR_ACCEL_R, 5,
                          :SDL_SENSOR_GYRO_R, 6

    attach_function :SDL_GetSensors, [:pointer], :pointer
    attach_function :SDL_GetSensorNameForID, [:SDL_SensorID], :string
    attach_function :SDL_GetSensorTypeForID, [:SDL_SensorID], SDL_SensorType
    attach_function :SDL_GetSensorNonPortableTypeForID, [:SDL_SensorID], :int
    attach_function :SDL_OpenSensor, [:SDL_SensorID], :pointer
    attach_function :SDL_GetSensorFromID, [:SDL_SensorID], :pointer
    attach_function :SDL_GetSensorProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetSensorName, [:pointer], :string
    attach_function :SDL_GetSensorType, [:pointer], SDL_SensorType
    attach_function :SDL_GetSensorNonPortableType, [:pointer], :int
    attach_function :SDL_GetSensorID, [:pointer], :SDL_SensorID
    attach_function :SDL_GetSensorData, %i[pointer pointer int], :bool
    attach_function :SDL_CloseSensor, [:pointer], :void
    attach_function :SDL_UpdateSensors, [], :void
  end
end
