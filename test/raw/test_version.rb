# frozen_string_literal: true

require "test_helper"

class TestRawVersion < Minitest::Test
  def test_get_version
    result = SDL3::Raw.SDL_GetVersion
    assert_kind_of Integer, result
    assert result > 0
  end

  def test_get_revision
    result = SDL3::Raw.SDL_GetRevision
    assert_kind_of String, result
  end

  def test_version_is_sdl3
    version = SDL3::Raw.SDL_GetVersion
    major = version / 1_000_000
    assert_equal 3, major
  end

  def test_version_components
    version = SDL3::Raw.SDL_GetVersion
    major = version / 1_000_000
    minor = (version / 1_000) % 1_000
    patch = version % 1_000
    assert major >= 3
    assert minor >= 0
    assert patch >= 0
  end
end
