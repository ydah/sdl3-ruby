# frozen_string_literal: true

require "test_helper"

class TestSDL3 < Minitest::Test
  def test_version
    refute_nil SDL3::VERSION
  end

  def test_init_constants
    assert_equal 0x00000010, SDL3::INIT_AUDIO
    assert_equal 0x00000020, SDL3::INIT_VIDEO
    assert_equal 0x00000200, SDL3::INIT_JOYSTICK
    assert_equal 0x00001000, SDL3::INIT_HAPTIC
    assert_equal 0x00002000, SDL3::INIT_GAMEPAD
    assert_equal 0x00004000, SDL3::INIT_EVENTS
    assert_equal 0x00008000, SDL3::INIT_SENSOR
    assert_equal 0x00010000, SDL3::INIT_CAMERA
  end

  def test_init_and_quit
    assert SDL3.init(SDL3::INIT_EVENTS)
    SDL3.quit
  end

  def test_was_init
    SDL3.init(SDL3::INIT_EVENTS)
    assert_equal SDL3::INIT_EVENTS, SDL3.was_init(SDL3::INIT_EVENTS)
    SDL3.quit
  end

  def test_error_methods
    SDL3.clear_error
    assert_kind_of String, SDL3.error
  end
end
