# frozen_string_literal: true

require "test_helper"

class TestHighLevelTimer < Minitest::Test
  def test_ticks_returns_integer
    result = SDL3::Timer.ticks
    assert_kind_of Integer, result
  end

  def test_ticks_ns_returns_integer
    result = SDL3::Timer.ticks_ns
    assert_kind_of Integer, result
  end

  def test_performance_counter_returns_integer
    result = SDL3::Timer.performance_counter
    assert_kind_of Integer, result
  end

  def test_performance_frequency_returns_positive_integer
    result = SDL3::Timer.performance_frequency
    assert_kind_of Integer, result
    assert result > 0
  end

  def test_ticks_increases
    t1 = SDL3::Timer.ticks
    SDL3::Timer.delay(10)
    t2 = SDL3::Timer.ticks
    assert t2 >= t1
  end

  def test_delay
    start = SDL3::Timer.ticks
    SDL3::Timer.delay(50)
    elapsed = SDL3::Timer.ticks - start
    assert elapsed >= 40
  end

  def test_delay_ns
    start = SDL3::Timer.ticks_ns
    SDL3::Timer.delay_ns(10_000_000)
    elapsed = SDL3::Timer.ticks_ns - start
    assert elapsed >= 5_000_000
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::Timer, :ticks
    assert_respond_to SDL3::Timer, :ticks_ns
    assert_respond_to SDL3::Timer, :performance_counter
    assert_respond_to SDL3::Timer, :performance_frequency
    assert_respond_to SDL3::Timer, :delay
    assert_respond_to SDL3::Timer, :delay_ns
    assert_respond_to SDL3::Timer, :delay_precise
    assert_respond_to SDL3::Timer, :create
    assert_respond_to SDL3::Timer, :create_ns
  end

  def test_performance_counter_increases
    c1 = SDL3::Timer.performance_counter
    SDL3::Timer.delay(1)
    c2 = SDL3::Timer.performance_counter
    assert c2 > c1
  end
end
