# frozen_string_literal: true

require "test_helper"

class TestRawRect < Minitest::Test
  def test_sdl_point_struct
    point = SDL3::Raw::SDL_Point.new
    point[:x] = 10
    point[:y] = 20
    assert_equal 10, point[:x]
    assert_equal 20, point[:y]
  end

  def test_sdl_fpoint_struct
    point = SDL3::Raw::SDL_FPoint.new
    point[:x] = 10.5
    point[:y] = 20.5
    assert_in_delta 10.5, point[:x], 0.001
    assert_in_delta 20.5, point[:y], 0.001
  end

  def test_sdl_rect_struct
    rect = SDL3::Raw::SDL_Rect.new
    rect[:x] = 10
    rect[:y] = 20
    rect[:w] = 100
    rect[:h] = 200
    assert_equal 10, rect[:x]
    assert_equal 20, rect[:y]
    assert_equal 100, rect[:w]
    assert_equal 200, rect[:h]
  end

  def test_sdl_frect_struct
    rect = SDL3::Raw::SDL_FRect.new
    rect[:x] = 10.5
    rect[:y] = 20.5
    rect[:w] = 100.5
    rect[:h] = 200.5
    assert_in_delta 10.5, rect[:x], 0.001
    assert_in_delta 20.5, rect[:y], 0.001
    assert_in_delta 100.5, rect[:w], 0.001
    assert_in_delta 200.5, rect[:h], 0.001
  end

  def test_has_rect_intersection
    rect1 = SDL3::Raw::SDL_Rect.new
    rect1[:x] = 0
    rect1[:y] = 0
    rect1[:w] = 100
    rect1[:h] = 100

    rect2 = SDL3::Raw::SDL_Rect.new
    rect2[:x] = 50
    rect2[:y] = 50
    rect2[:w] = 100
    rect2[:h] = 100

    assert SDL3::Raw.SDL_HasRectIntersection(rect1, rect2)
  end

  def test_no_rect_intersection
    rect1 = SDL3::Raw::SDL_Rect.new
    rect1[:x] = 0
    rect1[:y] = 0
    rect1[:w] = 100
    rect1[:h] = 100

    rect2 = SDL3::Raw::SDL_Rect.new
    rect2[:x] = 200
    rect2[:y] = 200
    rect2[:w] = 100
    rect2[:h] = 100

    refute SDL3::Raw.SDL_HasRectIntersection(rect1, rect2)
  end

  def test_get_rect_intersection
    rect1 = SDL3::Raw::SDL_Rect.new
    rect1[:x] = 0
    rect1[:y] = 0
    rect1[:w] = 100
    rect1[:h] = 100

    rect2 = SDL3::Raw::SDL_Rect.new
    rect2[:x] = 50
    rect2[:y] = 50
    rect2[:w] = 100
    rect2[:h] = 100

    result = SDL3::Raw::SDL_Rect.new
    assert SDL3::Raw.SDL_GetRectIntersection(rect1, rect2, result)
    assert_equal 50, result[:x]
    assert_equal 50, result[:y]
    assert_equal 50, result[:w]
    assert_equal 50, result[:h]
  end

  def test_get_rect_union
    rect1 = SDL3::Raw::SDL_Rect.new
    rect1[:x] = 0
    rect1[:y] = 0
    rect1[:w] = 50
    rect1[:h] = 50

    rect2 = SDL3::Raw::SDL_Rect.new
    rect2[:x] = 50
    rect2[:y] = 50
    rect2[:w] = 50
    rect2[:h] = 50

    result = SDL3::Raw::SDL_Rect.new
    assert SDL3::Raw.SDL_GetRectUnion(rect1, rect2, result)
    assert_equal 0, result[:x]
    assert_equal 0, result[:y]
    assert_equal 100, result[:w]
    assert_equal 100, result[:h]
  end
end
