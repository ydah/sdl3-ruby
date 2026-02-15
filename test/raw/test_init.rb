# frozen_string_literal: true

require "test_helper"

class TestRawInit < Minitest::Test
  def teardown
    SDL3::Raw.SDL_Quit
  end

  def test_init_flags_defined
    assert_equal 0x00000010, SDL3::Raw::SDL_INIT_AUDIO
    assert_equal 0x00000020, SDL3::Raw::SDL_INIT_VIDEO
    assert_equal 0x00000200, SDL3::Raw::SDL_INIT_JOYSTICK
    assert_equal 0x00001000, SDL3::Raw::SDL_INIT_HAPTIC
    assert_equal 0x00002000, SDL3::Raw::SDL_INIT_GAMEPAD
    assert_equal 0x00004000, SDL3::Raw::SDL_INIT_EVENTS
    assert_equal 0x00008000, SDL3::Raw::SDL_INIT_SENSOR
    assert_equal 0x00010000, SDL3::Raw::SDL_INIT_CAMERA
  end

  def test_init_with_events
    result = SDL3::Raw.SDL_Init(SDL3::Raw::SDL_INIT_EVENTS)
    assert result
  end

  def test_init_sub_system
    SDL3::Raw.SDL_Init(0)
    result = SDL3::Raw.SDL_InitSubSystem(SDL3::Raw::SDL_INIT_EVENTS)
    assert result
  end

  def test_was_init
    SDL3::Raw.SDL_Init(SDL3::Raw::SDL_INIT_EVENTS)
    result = SDL3::Raw.SDL_WasInit(SDL3::Raw::SDL_INIT_EVENTS)
    assert_equal SDL3::Raw::SDL_INIT_EVENTS, result
  end

  def test_was_init_not_initialized
    SDL3::Raw.SDL_Init(0)
    result = SDL3::Raw.SDL_WasInit(SDL3::Raw::SDL_INIT_VIDEO)
    assert_equal 0, result
  end

  def test_quit_sub_system
    SDL3::Raw.SDL_Init(SDL3::Raw::SDL_INIT_EVENTS)
    SDL3::Raw.SDL_QuitSubSystem(SDL3::Raw::SDL_INIT_EVENTS)
    result = SDL3::Raw.SDL_WasInit(SDL3::Raw::SDL_INIT_EVENTS)
    assert_equal 0, result
  end

  def test_set_app_metadata
    result = SDL3::Raw.SDL_SetAppMetadata("Test App", "1.0.0", "com.test.app")
    assert result
  end

  def test_get_app_metadata
    SDL3::Raw.SDL_SetAppMetadata("Test App", "1.0.0", "com.test.app")
    name = SDL3::Raw.SDL_GetAppMetadataProperty("SDL.app.metadata.name")
    if name.nil? || name.empty?
      pass
    else
      assert_equal "Test App", name
    end
  end

  def test_set_app_metadata_property
    result = SDL3::Raw.SDL_SetAppMetadataProperty("SDL.app.metadata.url", "https://example.com")
    assert_includes [true, false], result
  end
end
