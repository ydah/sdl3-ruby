# frozen_string_literal: true

require "test_helper"

class TestRawTimer < Minitest::Test
  def test_get_ticks
    result = SDL3::Raw.SDL_GetTicks
    assert_kind_of Integer, result
  end

  def test_get_ticks_ns
    result = SDL3::Raw.SDL_GetTicksNS
    assert_kind_of Integer, result
  end

  def test_get_performance_counter
    result = SDL3::Raw.SDL_GetPerformanceCounter
    assert_kind_of Integer, result
  end

  def test_get_performance_frequency
    result = SDL3::Raw.SDL_GetPerformanceFrequency
    assert_kind_of Integer, result
    assert result > 0
  end

  def test_delay
    start = SDL3::Raw.SDL_GetTicks
    SDL3::Raw.SDL_Delay(50)
    elapsed = SDL3::Raw.SDL_GetTicks - start
    assert elapsed >= 40
  end

  def test_delay_ns
    start = SDL3::Raw.SDL_GetTicksNS
    SDL3::Raw.SDL_DelayNS(10_000_000)
    elapsed = SDL3::Raw.SDL_GetTicksNS - start
    assert elapsed >= 5_000_000
  end

  def test_ticks_increases_over_time
    t1 = SDL3::Raw.SDL_GetTicks
    SDL3::Raw.SDL_Delay(10)
    t2 = SDL3::Raw.SDL_GetTicks
    assert t2 >= t1
  end

  def test_performance_counter_increases
    c1 = SDL3::Raw.SDL_GetPerformanceCounter
    SDL3::Raw.SDL_Delay(1)
    c2 = SDL3::Raw.SDL_GetPerformanceCounter
    assert c2 > c1
  end

  def test_timer_callback_defined
    assert SDL3::Raw.respond_to?(:SDL_AddTimer)
    assert SDL3::Raw.respond_to?(:SDL_RemoveTimer)
  end
end
