# frozen_string_literal: true

require "test_helper"

class TestRawSystem < Minitest::Test
  def test_sandbox_enum_defined
    assert SDL3::Raw::SDL_Sandbox
  end

  def test_sandbox_enum_values
    assert_equal 0, SDL3::Raw::SDL_Sandbox[:SDL_SANDBOX_NONE]
    assert_equal 1, SDL3::Raw::SDL_Sandbox[:SDL_SANDBOX_UNKNOWN_CONTAINER]
    assert_equal 2, SDL3::Raw::SDL_Sandbox[:SDL_SANDBOX_FLATPAK]
    assert_equal 3, SDL3::Raw::SDL_Sandbox[:SDL_SANDBOX_SNAP]
    assert_equal 4, SDL3::Raw::SDL_Sandbox[:SDL_SANDBOX_MACOS]
  end

  def test_is_tablet
    result = SDL3::Raw.SDL_IsTablet
    assert_includes [true, false], result
  end

  def test_is_tv
    result = SDL3::Raw.SDL_IsTV
    assert_includes [true, false], result
  end

  def test_get_sandbox
    result = SDL3::Raw.SDL_GetSandbox
    assert_kind_of Symbol, result
  end
end
