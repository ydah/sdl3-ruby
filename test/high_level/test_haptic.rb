# frozen_string_literal: true

require "test_helper"

class TestHighLevelHaptic < Minitest::Test
  def test_constants_defined
    assert_equal SDL3::Raw::SDL_HAPTIC_CONSTANT, SDL3::Haptic::CONSTANT
    assert_equal SDL3::Raw::SDL_HAPTIC_SINE, SDL3::Haptic::SINE
    assert_equal SDL3::Raw::SDL_HAPTIC_SQUARE, SDL3::Haptic::SQUARE
    assert_equal SDL3::Raw::SDL_HAPTIC_TRIANGLE, SDL3::Haptic::TRIANGLE
    assert_equal SDL3::Raw::SDL_HAPTIC_SAWTOOTHUP, SDL3::Haptic::SAWTOOTHUP
    assert_equal SDL3::Raw::SDL_HAPTIC_SAWTOOTHDOWN, SDL3::Haptic::SAWTOOTHDOWN
    assert_equal SDL3::Raw::SDL_HAPTIC_RAMP, SDL3::Haptic::RAMP
    assert_equal SDL3::Raw::SDL_HAPTIC_SPRING, SDL3::Haptic::SPRING
    assert_equal SDL3::Raw::SDL_HAPTIC_DAMPER, SDL3::Haptic::DAMPER
    assert_equal SDL3::Raw::SDL_HAPTIC_INERTIA, SDL3::Haptic::INERTIA
    assert_equal SDL3::Raw::SDL_HAPTIC_FRICTION, SDL3::Haptic::FRICTION
    assert_equal SDL3::Raw::SDL_HAPTIC_LEFTRIGHT, SDL3::Haptic::LEFTRIGHT
    assert_equal SDL3::Raw::SDL_HAPTIC_CUSTOM, SDL3::Haptic::CUSTOM
  end

  def test_direction_constants
    assert_equal SDL3::Raw::SDL_HAPTIC_POLAR, SDL3::Haptic::POLAR
    assert_equal SDL3::Raw::SDL_HAPTIC_CARTESIAN, SDL3::Haptic::CARTESIAN
    assert_equal SDL3::Raw::SDL_HAPTIC_SPHERICAL, SDL3::Haptic::SPHERICAL
    assert_equal SDL3::Raw::SDL_HAPTIC_STEERING_AXIS, SDL3::Haptic::STEERING_AXIS
  end

  def test_infinity_constant
    assert_equal SDL3::Raw::SDL_HAPTIC_INFINITY, SDL3::Haptic::INFINITY
  end

  def test_list_returns_array
    SDL3.init(SDL3::INIT_HAPTIC)
    result = SDL3::Haptic.list
    assert_kind_of Array, result
    SDL3.quit
  end

  def test_mouse_haptic_returns_boolean
    SDL3.init(SDL3::INIT_HAPTIC)
    result = SDL3::Haptic.mouse_haptic?
    assert_includes [true, false], result
    SDL3.quit
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Haptic, :list
    assert_respond_to SDL3::Haptic, :name_for_id
    assert_respond_to SDL3::Haptic, :mouse_haptic?
    assert_respond_to SDL3::Haptic, :joystick_haptic?
    assert_respond_to SDL3::Haptic, :open
    assert_respond_to SDL3::Haptic, :open_from_mouse
    assert_respond_to SDL3::Haptic, :open_from_joystick
  end
end
