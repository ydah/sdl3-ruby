# frozen_string_literal: true

require "test_helper"

class TestHighLevelWindow < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_VIDEO)
  end

  def teardown
    SDL3.quit
  end

  def test_window_constants
    assert_equal SDL3::Raw::SDL_WINDOW_FULLSCREEN, SDL3::Window::FULLSCREEN
    assert_equal SDL3::Raw::SDL_WINDOW_HIDDEN, SDL3::Window::HIDDEN
    assert_equal SDL3::Raw::SDL_WINDOW_BORDERLESS, SDL3::Window::BORDERLESS
    assert_equal SDL3::Raw::SDL_WINDOW_RESIZABLE, SDL3::Window::RESIZABLE
    assert_equal SDL3::Raw::SDL_WINDOW_MINIMIZED, SDL3::Window::MINIMIZED
    assert_equal SDL3::Raw::SDL_WINDOW_MAXIMIZED, SDL3::Window::MAXIMIZED
  end

  def test_create_window
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    refute window.ptr.null?
    window.destroy
  end

  def test_open_with_block
    yielded = false
    SDL3::Window.open("Test", 640, 480, SDL3::Window::HIDDEN) do |window|
      yielded = true
      refute window.ptr.null?
    end
    assert yielded
  end

  def test_open_without_block
    window = SDL3::Window.open("Test", 640, 480, SDL3::Window::HIDDEN)
    refute window.ptr.null?
    window.destroy
  end

  def test_window_id
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    id = window.id
    assert_kind_of Integer, id
    assert id > 0
    window.destroy
  end

  def test_window_title
    window = SDL3::Window.new("My Title", 640, 480, SDL3::Window::HIDDEN)
    assert_equal "My Title", window.title
    window.destroy
  end

  def test_set_window_title
    window = SDL3::Window.new("Old", 640, 480, SDL3::Window::HIDDEN)
    window.title = "New Title"
    assert_equal "New Title", window.title
    window.destroy
  end

  def test_window_size
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    size = window.size
    assert_equal [640, 480], size
    window.destroy
  end

  def test_window_width_and_height
    window = SDL3::Window.new("Test", 800, 600, SDL3::Window::HIDDEN)
    assert_equal 800, window.width
    assert_equal 600, window.height
    window.destroy
  end

  def test_set_window_size
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    window.size = [800, 600]
    window.destroy
  end

  def test_window_position
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    position = window.position
    assert_kind_of Array, position
    assert_equal 2, position.length
    window.destroy
  end

  def test_set_window_position
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    window.position = [100, 100]
    window.destroy
  end

  def test_window_opacity
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    opacity = window.opacity
    assert_kind_of Float, opacity
    window.destroy
  end

  def test_destroy_window
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    window.destroy
    assert window.ptr.null?
  end

  def test_to_ptr
    window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
    assert_kind_of FFI::Pointer, window.to_ptr
    window.destroy
  end

  def test_responds_to_methods
    window = SDL3::Window.new("Test", 100, 100, SDL3::Window::HIDDEN)
    assert_respond_to window, :show
    assert_respond_to window, :hide
    assert_respond_to window, :raise_window
    assert_respond_to window, :maximize
    assert_respond_to window, :minimize
    assert_respond_to window, :restore
    assert_respond_to window, :fullscreen=
    assert_respond_to window, :bordered=
    assert_respond_to window, :resizable=
    assert_respond_to window, :surface
    assert_respond_to window, :update_surface
    window.destroy
  end
end
