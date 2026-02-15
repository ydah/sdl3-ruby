# frozen_string_literal: true

require "test_helper"

class TestHighLevelSurface < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_VIDEO)
  end

  def teardown
    SDL3.quit
  end

  def test_create_surface
    surface = SDL3::Surface.new(100, 100)
    refute surface.ptr.null?
    surface.destroy
  end

  def test_surface_width
    surface = SDL3::Surface.new(200, 100)
    assert_equal 200, surface.width
    surface.destroy
  end

  def test_surface_height
    surface = SDL3::Surface.new(200, 100)
    assert_equal 100, surface.height
    surface.destroy
  end

  def test_surface_pitch
    surface = SDL3::Surface.new(100, 100)
    assert_kind_of Integer, surface.pitch
    assert surface.pitch > 0
    surface.destroy
  end

  def test_surface_format
    surface = SDL3::Surface.new(100, 100)
    format = surface.format
    assert_kind_of Integer, format
    surface.destroy
  end

  def test_destroy_surface
    surface = SDL3::Surface.new(100, 100)
    surface.destroy
    assert surface.ptr.null?
  end

  def test_to_ptr
    surface = SDL3::Surface.new(100, 100)
    assert_kind_of FFI::Pointer, surface.to_ptr
    surface.destroy
  end

  def test_fill_rect_with_array
    surface = SDL3::Surface.new(100, 100)
    surface.fill_rect([0, 0, 50, 50], 0xFF0000FF)
    surface.destroy
  end

  def test_fill_entire_surface
    surface = SDL3::Surface.new(100, 100)
    surface.fill_rect(nil, 0x00FF00FF)
    surface.destroy
  end

  def test_responds_to_methods
    surface = SDL3::Surface.new(100, 100)
    assert_respond_to surface, :width
    assert_respond_to surface, :height
    assert_respond_to surface, :pitch
    assert_respond_to surface, :format
    assert_respond_to surface, :fill_rect
    assert_respond_to surface, :blit
    assert_respond_to surface, :lock
    assert_respond_to surface, :unlock
    surface.destroy
  end

  def test_size
    surface = SDL3::Surface.new(320, 240)
    assert_equal [320, 240], surface.size
    surface.destroy
  end

  def test_from_ptr
    surface1 = SDL3::Surface.new(100, 100)
    surface2 = SDL3::Surface.from_ptr(surface1.to_ptr, owned: false)
    assert_equal surface1.width, surface2.width
    surface1.destroy
  end
end
