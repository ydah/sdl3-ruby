# frozen_string_literal: true

require "test_helper"

class TestRawPixels < Minitest::Test
  def test_pixel_format_constants_defined
    assert SDL3::Raw::SDL_PIXELFORMAT_UNKNOWN
    assert SDL3::Raw::SDL_PIXELFORMAT_RGBA8888
    assert SDL3::Raw::SDL_PIXELFORMAT_ARGB8888
    assert SDL3::Raw::SDL_PIXELFORMAT_RGB24
  end

  def test_common_pixel_format_values
    assert_equal 0x00000000, SDL3::Raw::SDL_PIXELFORMAT_UNKNOWN
    assert_kind_of Integer, SDL3::Raw::SDL_PIXELFORMAT_RGBA8888
    assert_kind_of Integer, SDL3::Raw::SDL_PIXELFORMAT_ARGB8888
    assert_kind_of Integer, SDL3::Raw::SDL_PIXELFORMAT_RGB24
  end

  def test_sdl_color_struct
    color = SDL3::Raw::SDL_Color.new
    color[:r] = 255
    color[:g] = 128
    color[:b] = 64
    color[:a] = 255
    assert_equal 255, color[:r]
    assert_equal 128, color[:g]
    assert_equal 64, color[:b]
    assert_equal 255, color[:a]
  end

  def test_sdl_fcolor_struct
    color = SDL3::Raw::SDL_FColor.new
    color[:r] = 1.0
    color[:g] = 0.5
    color[:b] = 0.25
    color[:a] = 1.0
    assert_in_delta 1.0, color[:r], 0.001
    assert_in_delta 0.5, color[:g], 0.001
    assert_in_delta 0.25, color[:b], 0.001
    assert_in_delta 1.0, color[:a], 0.001
  end

  def test_get_pixel_format_name
    name = SDL3::Raw.SDL_GetPixelFormatName(SDL3::Raw::SDL_PIXELFORMAT_RGBA8888)
    assert_kind_of String, name
    assert_includes name, "RGBA8888"
  end

  def test_get_pixel_format_name_unknown
    name = SDL3::Raw.SDL_GetPixelFormatName(SDL3::Raw::SDL_PIXELFORMAT_UNKNOWN)
    assert_kind_of String, name
  end

  def test_colorspace_enum_defined
    assert SDL3::Raw::SDL_Colorspace
  end

  def test_pixel_type_enum_defined
    assert SDL3::Raw::SDL_PixelType
  end

  def test_pixel_format_details_struct
    details = SDL3::Raw.SDL_GetPixelFormatDetails(SDL3::Raw::SDL_PIXELFORMAT_RGBA8888)
    refute details.null?
    assert_equal SDL3::Raw::SDL_PIXELFORMAT_RGBA8888, details[:format]
    assert details[:bits_per_pixel] > 0
    assert details[:bytes_per_pixel] > 0
  end
end
