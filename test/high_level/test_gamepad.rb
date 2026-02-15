# frozen_string_literal: true

require "test_helper"

class TestHighLevelGamepad < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_GAMEPAD)
  end

  def teardown
    SDL3.quit
  end

  def test_button_enum_defined_in_raw
    assert SDL3::Raw::SDL_GamepadButton
    assert_equal 0, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_SOUTH]
    assert_equal 1, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_EAST]
    assert_equal 2, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_WEST]
    assert_equal 3, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_NORTH]
    assert_equal 11, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_DPAD_UP]
    assert_equal 12, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_DPAD_DOWN]
    assert_equal 13, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_DPAD_LEFT]
    assert_equal 14, SDL3::Raw::SDL_GamepadButton[:SDL_GAMEPAD_BUTTON_DPAD_RIGHT]
  end

  def test_axis_enum_defined_in_raw
    assert SDL3::Raw::SDL_GamepadAxis
    assert_equal 0, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_LEFTX]
    assert_equal 1, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_LEFTY]
    assert_equal 2, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_RIGHTX]
    assert_equal 3, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_RIGHTY]
    assert_equal 4, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_LEFT_TRIGGER]
    assert_equal 5, SDL3::Raw::SDL_GamepadAxis[:SDL_GAMEPAD_AXIS_RIGHT_TRIGGER]
  end

  def test_available_returns_boolean
    result = SDL3::Gamepad.available?
    assert_includes [true, false], result
  end

  def test_list_returns_array
    result = SDL3::Gamepad.list
    assert_kind_of Array, result
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Gamepad, :available?
    assert_respond_to SDL3::Gamepad, :list
    assert_respond_to SDL3::Gamepad, :name_for_id
    assert_respond_to SDL3::Gamepad, :open
  end

  def test_instance_methods_defined
    assert SDL3::Gamepad.instance_methods.include?(:id)
    assert SDL3::Gamepad.instance_methods.include?(:name)
    assert SDL3::Gamepad.instance_methods.include?(:connected?)
    assert SDL3::Gamepad.instance_methods.include?(:button)
    assert SDL3::Gamepad.instance_methods.include?(:axis)
    assert SDL3::Gamepad.instance_methods.include?(:rumble)
    assert SDL3::Gamepad.instance_methods.include?(:close)
  end

  def test_gamepad_type_enum_defined_in_raw
    assert SDL3::Raw::SDL_GamepadType
    assert_equal 0, SDL3::Raw::SDL_GamepadType[:SDL_GAMEPAD_TYPE_UNKNOWN]
    assert_equal 1, SDL3::Raw::SDL_GamepadType[:SDL_GAMEPAD_TYPE_STANDARD]
  end
end
