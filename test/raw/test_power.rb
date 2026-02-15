# frozen_string_literal: true

require "test_helper"

class TestRawPower < Minitest::Test
  def test_power_state_enum_defined
    assert SDL3::Raw::SDL_PowerState
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_ERROR]
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_UNKNOWN]
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_ON_BATTERY]
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_NO_BATTERY]
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_CHARGING]
    assert SDL3::Raw::SDL_PowerState[:SDL_POWERSTATE_CHARGED]
  end

  def test_get_power_info
    seconds_ptr = FFI::MemoryPointer.new(:int)
    percent_ptr = FFI::MemoryPointer.new(:int)
    state = SDL3::Raw.SDL_GetPowerInfo(seconds_ptr, percent_ptr)
    assert_kind_of Symbol, state
  end

  def test_get_power_info_returns_valid_state
    seconds_ptr = FFI::MemoryPointer.new(:int)
    percent_ptr = FFI::MemoryPointer.new(:int)
    state = SDL3::Raw.SDL_GetPowerInfo(seconds_ptr, percent_ptr)
    valid_states = %i[
      SDL_POWERSTATE_ERROR
      SDL_POWERSTATE_UNKNOWN
      SDL_POWERSTATE_ON_BATTERY
      SDL_POWERSTATE_NO_BATTERY
      SDL_POWERSTATE_CHARGING
      SDL_POWERSTATE_CHARGED
    ]
    assert_includes valid_states, state
  end

  def test_get_power_info_with_nil_pointers
    state = SDL3::Raw.SDL_GetPowerInfo(nil, nil)
    assert_kind_of Symbol, state
  end
end
