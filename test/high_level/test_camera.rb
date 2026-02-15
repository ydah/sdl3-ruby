# frozen_string_literal: true

require "test_helper"

class TestHighLevelCamera < Minitest::Test
  def test_position_constants
    assert_equal :SDL_CAMERA_POSITION_UNKNOWN, SDL3::Camera::POSITION_UNKNOWN
    assert_equal :SDL_CAMERA_POSITION_FRONT_FACING, SDL3::Camera::POSITION_FRONT_FACING
    assert_equal :SDL_CAMERA_POSITION_BACK_FACING, SDL3::Camera::POSITION_BACK_FACING
  end

  def test_num_drivers
    SDL3.init(SDL3::INIT_CAMERA)
    result = SDL3::Camera.num_drivers
    assert_kind_of Integer, result
    assert result >= 0
    SDL3.quit
  end

  def test_current_driver
    SDL3.init(SDL3::INIT_CAMERA)
    result = SDL3::Camera.current_driver
    assert result.nil? || result.is_a?(String)
    SDL3.quit
  end

  def test_list_returns_array
    SDL3.init(SDL3::INIT_CAMERA)
    result = SDL3::Camera.list
    assert_kind_of Array, result
    SDL3.quit
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Camera, :num_drivers
    assert_respond_to SDL3::Camera, :driver
    assert_respond_to SDL3::Camera, :current_driver
    assert_respond_to SDL3::Camera, :list
    assert_respond_to SDL3::Camera, :name_for_id
    assert_respond_to SDL3::Camera, :position_for_id
    assert_respond_to SDL3::Camera, :supported_formats
    assert_respond_to SDL3::Camera, :open
  end

  def test_driver_with_valid_index
    SDL3.init(SDL3::INIT_CAMERA)
    num = SDL3::Camera.num_drivers
    if num > 0
      driver = SDL3::Camera.driver(0)
      assert_kind_of String, driver
    end
    SDL3.quit
  end
end
