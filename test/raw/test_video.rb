# frozen_string_literal: true

require "test_helper"

class TestRawVideo < Minitest::Test
  def setup
    SDL3::Raw.SDL_Init(SDL3::Raw::SDL_INIT_VIDEO)
  end

  def teardown
    SDL3::Raw.SDL_Quit
  end

  def test_window_flags_defined
    assert SDL3::Raw::SDL_WINDOW_FULLSCREEN
    assert SDL3::Raw::SDL_WINDOW_HIDDEN
    assert SDL3::Raw::SDL_WINDOW_BORDERLESS
    assert SDL3::Raw::SDL_WINDOW_RESIZABLE
    assert SDL3::Raw::SDL_WINDOW_MINIMIZED
    assert SDL3::Raw::SDL_WINDOW_MAXIMIZED
  end

  def test_get_num_video_drivers
    result = SDL3::Raw.SDL_GetNumVideoDrivers
    assert_kind_of Integer, result
    assert result >= 0
  end

  def test_get_video_driver
    num = SDL3::Raw.SDL_GetNumVideoDrivers
    if num > 0
      driver = SDL3::Raw.SDL_GetVideoDriver(0)
      assert_kind_of String, driver
    end
  end

  def test_get_current_video_driver
    driver = SDL3::Raw.SDL_GetCurrentVideoDriver
    assert driver.nil? || driver.is_a?(String)
  end

  def test_get_displays
    count_ptr = FFI::MemoryPointer.new(:int)
    displays = SDL3::Raw.SDL_GetDisplays(count_ptr)
    assert displays.null? || displays.is_a?(FFI::Pointer)
  end

  def test_create_window
    window = SDL3::Raw.SDL_CreateWindow("Test Window", 640, 480, 0)
    refute window.null?
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_create_window_with_flags
    window = SDL3::Raw.SDL_CreateWindow("Test", 100, 100, SDL3::Raw::SDL_WINDOW_HIDDEN)
    refute window.null?
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_get_window_id
    window = SDL3::Raw.SDL_CreateWindow("Test", 100, 100, SDL3::Raw::SDL_WINDOW_HIDDEN)
    id = SDL3::Raw.SDL_GetWindowID(window)
    assert_kind_of Integer, id
    assert id > 0
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_get_window_title
    window = SDL3::Raw.SDL_CreateWindow("My Title", 100, 100, SDL3::Raw::SDL_WINDOW_HIDDEN)
    title = SDL3::Raw.SDL_GetWindowTitle(window)
    assert_equal "My Title", title
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_set_window_title
    window = SDL3::Raw.SDL_CreateWindow("Old Title", 100, 100, SDL3::Raw::SDL_WINDOW_HIDDEN)
    SDL3::Raw.SDL_SetWindowTitle(window, "New Title")
    title = SDL3::Raw.SDL_GetWindowTitle(window)
    assert_equal "New Title", title
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_get_window_size
    window = SDL3::Raw.SDL_CreateWindow("Test", 640, 480, SDL3::Raw::SDL_WINDOW_HIDDEN)
    w_ptr = FFI::MemoryPointer.new(:int)
    h_ptr = FFI::MemoryPointer.new(:int)
    SDL3::Raw.SDL_GetWindowSize(window, w_ptr, h_ptr)
    assert_equal 640, w_ptr.read_int
    assert_equal 480, h_ptr.read_int
    SDL3::Raw.SDL_DestroyWindow(window)
  end

  def test_get_window_position
    window = SDL3::Raw.SDL_CreateWindow("Test", 100, 100, SDL3::Raw::SDL_WINDOW_HIDDEN)
    x_ptr = FFI::MemoryPointer.new(:int)
    y_ptr = FFI::MemoryPointer.new(:int)
    SDL3::Raw.SDL_GetWindowPosition(window, x_ptr, y_ptr)
    assert_kind_of Integer, x_ptr.read_int
    assert_kind_of Integer, y_ptr.read_int
    SDL3::Raw.SDL_DestroyWindow(window)
  end
end
