# frozen_string_literal: true

require "test_helper"

class TestHighLevelSensor < Minitest::Test
  def test_standard_gravity_constant
    assert_in_delta 9.80665, SDL3::Sensor::STANDARD_GRAVITY, 0.00001
  end

  def test_type_constants
    assert_equal :SDL_SENSOR_INVALID, SDL3::Sensor::TYPE_INVALID
    assert_equal :SDL_SENSOR_UNKNOWN, SDL3::Sensor::TYPE_UNKNOWN
    assert_equal :SDL_SENSOR_ACCEL, SDL3::Sensor::TYPE_ACCEL
    assert_equal :SDL_SENSOR_GYRO, SDL3::Sensor::TYPE_GYRO
    assert_equal :SDL_SENSOR_ACCEL_L, SDL3::Sensor::TYPE_ACCEL_L
    assert_equal :SDL_SENSOR_GYRO_L, SDL3::Sensor::TYPE_GYRO_L
    assert_equal :SDL_SENSOR_ACCEL_R, SDL3::Sensor::TYPE_ACCEL_R
    assert_equal :SDL_SENSOR_GYRO_R, SDL3::Sensor::TYPE_GYRO_R
  end

  def test_list_returns_array
    SDL3.init(SDL3::INIT_SENSOR)
    result = SDL3::Sensor.list
    assert_kind_of Array, result
    SDL3.quit
  end

  def test_update_all
    SDL3.init(SDL3::INIT_SENSOR)
    SDL3::Sensor.update_all
    SDL3.quit
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Sensor, :list
    assert_respond_to SDL3::Sensor, :name_for_id
    assert_respond_to SDL3::Sensor, :type_for_id
    assert_respond_to SDL3::Sensor, :non_portable_type_for_id
    assert_respond_to SDL3::Sensor, :update_all
    assert_respond_to SDL3::Sensor, :open
  end

  def test_instance_responds_to_methods
    assert SDL3::Sensor.instance_methods.include?(:id)
    assert SDL3::Sensor.instance_methods.include?(:name)
    assert SDL3::Sensor.instance_methods.include?(:type)
    assert SDL3::Sensor.instance_methods.include?(:non_portable_type)
    assert SDL3::Sensor.instance_methods.include?(:properties)
    assert SDL3::Sensor.instance_methods.include?(:data)
    assert SDL3::Sensor.instance_methods.include?(:close)
    assert SDL3::Sensor.instance_methods.include?(:to_ptr)
  end
end
