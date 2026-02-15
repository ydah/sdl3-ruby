# frozen_string_literal: true

require "test_helper"

class TestRawError < Minitest::Test
  def test_get_error_returns_string
    result = SDL3::Raw.SDL_GetError
    assert_kind_of String, result
  end

  def test_clear_error
    result = SDL3::Raw.SDL_ClearError
    assert result
  end

  def test_set_error
    result = SDL3::Raw.SDL_SetError("Test error message")
    refute result
    error = SDL3::Raw.SDL_GetError
    assert_includes error, "Test error message"
    SDL3::Raw.SDL_ClearError
  end

  def test_out_of_memory
    result = SDL3::Raw.SDL_OutOfMemory
    refute result
    SDL3::Raw.SDL_ClearError
  end

  def test_clear_error_clears_message
    SDL3::Raw.SDL_SetError("Some error")
    SDL3::Raw.SDL_ClearError
    error = SDL3::Raw.SDL_GetError
    assert_equal "", error
  end
end
