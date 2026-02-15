# frozen_string_literal: true

require "test_helper"

class TestHighLevelJoystick < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_JOYSTICK)
  end

  def teardown
    SDL3.quit
  end

  def test_hat_constants
    assert_equal SDL3::Raw::SDL_HAT_CENTERED, SDL3::Joystick::HAT_CENTERED
    assert_equal SDL3::Raw::SDL_HAT_UP, SDL3::Joystick::HAT_UP
    assert_equal SDL3::Raw::SDL_HAT_RIGHT, SDL3::Joystick::HAT_RIGHT
    assert_equal SDL3::Raw::SDL_HAT_DOWN, SDL3::Joystick::HAT_DOWN
    assert_equal SDL3::Raw::SDL_HAT_LEFT, SDL3::Joystick::HAT_LEFT
  end

  def test_available_returns_boolean
    result = SDL3::Joystick.available?
    assert_includes [true, false], result
  end

  def test_list_returns_array
    result = SDL3::Joystick.list
    assert_kind_of Array, result
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Joystick, :available?
    assert_respond_to SDL3::Joystick, :list
    assert_respond_to SDL3::Joystick, :name_for_id
    assert_respond_to SDL3::Joystick, :type_for_id
    assert_respond_to SDL3::Joystick, :open
  end

  def test_instance_methods_defined
    assert SDL3::Joystick.instance_methods.include?(:id)
    assert SDL3::Joystick.instance_methods.include?(:name)
    assert SDL3::Joystick.instance_methods.include?(:path)
    assert SDL3::Joystick.instance_methods.include?(:type)
    assert SDL3::Joystick.instance_methods.include?(:vendor)
    assert SDL3::Joystick.instance_methods.include?(:product)
    assert SDL3::Joystick.instance_methods.include?(:connected?)
    assert SDL3::Joystick.instance_methods.include?(:num_axes)
    assert SDL3::Joystick.instance_methods.include?(:num_buttons)
    assert SDL3::Joystick.instance_methods.include?(:num_hats)
    assert SDL3::Joystick.instance_methods.include?(:axis)
    assert SDL3::Joystick.instance_methods.include?(:button)
    assert SDL3::Joystick.instance_methods.include?(:hat)
    assert SDL3::Joystick.instance_methods.include?(:rumble)
    assert SDL3::Joystick.instance_methods.include?(:close)
  end
end
