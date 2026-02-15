# frozen_string_literal: true

require "test_helper"

class TestHighLevelRenderer < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_VIDEO)
    @window = SDL3::Window.new("Test", 640, 480, SDL3::Window::HIDDEN)
  end

  def teardown
    @window.destroy
    SDL3.quit
  end

  def test_create_renderer
    renderer = SDL3::Renderer.new(@window)
    refute renderer.ptr.null?
    renderer.destroy
  end

  def test_create_with_block
    yielded = false
    SDL3::Renderer.create(@window) do |renderer|
      yielded = true
      refute renderer.ptr.null?
    end
    assert yielded
  end

  def test_create_without_block
    renderer = SDL3::Renderer.create(@window)
    refute renderer.ptr.null?
    renderer.destroy
  end

  def test_renderer_responds_to_drawing_methods
    renderer = SDL3::Renderer.new(@window)
    assert_respond_to renderer, :clear
    assert_respond_to renderer, :present
    assert_respond_to renderer, :draw_color=
    assert_respond_to renderer, :draw_point
    assert_respond_to renderer, :draw_line
    assert_respond_to renderer, :draw_rect
    assert_respond_to renderer, :fill_rect
    renderer.destroy
  end

  def test_set_draw_color
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 0, 0, 255]
    renderer.destroy
  end

  def test_get_draw_color
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 128, 64, 200]
    color = renderer.draw_color
    assert_kind_of Array, color
    assert_equal 4, color.length
    renderer.destroy
  end

  def test_clear
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [0, 0, 0, 255]
    result = renderer.clear
    assert result
    renderer.destroy
  end

  def test_present
    renderer = SDL3::Renderer.new(@window)
    renderer.clear
    result = renderer.present
    assert result
    renderer.destroy
  end

  def test_draw_point
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 255, 255, 255]
    renderer.draw_point(100, 100)
    renderer.destroy
  end

  def test_draw_line
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 255, 255, 255]
    renderer.draw_line(0, 0, 100, 100)
    renderer.destroy
  end

  def test_draw_rect
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 255, 255, 255]
    renderer.draw_rect(10, 10, 100, 100)
    renderer.destroy
  end

  def test_fill_rect
    renderer = SDL3::Renderer.new(@window)
    renderer.draw_color = [255, 0, 0, 255]
    renderer.fill_rect(10, 10, 100, 100)
    renderer.destroy
  end

  def test_scale
    renderer = SDL3::Renderer.new(@window)
    scale = renderer.scale
    assert_kind_of Array, scale
    assert_equal 2, scale.length
    renderer.destroy
  end

  def test_destroy_renderer
    renderer = SDL3::Renderer.new(@window)
    renderer.destroy
    assert renderer.ptr.null?
  end

  def test_to_ptr
    renderer = SDL3::Renderer.new(@window)
    assert_kind_of FFI::Pointer, renderer.to_ptr
    renderer.destroy
  end

  def test_copy_responds
    renderer = SDL3::Renderer.new(@window)
    assert_respond_to renderer, :copy
    assert_respond_to renderer, :copy_ex
    renderer.destroy
  end
end
