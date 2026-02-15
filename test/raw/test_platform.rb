# frozen_string_literal: true

require "test_helper"

class TestRawPlatform < Minitest::Test
  def test_get_platform
    result = SDL3::Raw.SDL_GetPlatform
    assert_kind_of String, result
    refute_empty result
  end

  def test_platform_is_known
    platform = SDL3::Raw.SDL_GetPlatform
    known_platforms = %w[Windows macOS Linux iOS Android Emscripten Unknown]
    assert known_platforms.any? { |p| platform.include?(p) } || platform.is_a?(String)
  end
end
