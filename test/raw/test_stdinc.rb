# frozen_string_literal: true

require "test_helper"

class TestRawStdinc < Minitest::Test
  def test_typedefs_defined
    assert SDL3::Raw.find_type(:Sint8)
    assert SDL3::Raw.find_type(:Uint8)
    assert SDL3::Raw.find_type(:Sint16)
    assert SDL3::Raw.find_type(:Uint16)
    assert SDL3::Raw.find_type(:Sint32)
    assert SDL3::Raw.find_type(:Uint32)
    assert SDL3::Raw.find_type(:Sint64)
    assert SDL3::Raw.find_type(:Uint64)
  end

  def test_malloc_and_free
    ptr = SDL3::Raw.SDL_malloc(1024)
    refute_nil ptr
    refute ptr.null?
    SDL3::Raw.SDL_free(ptr)
  end

  def test_calloc_and_free
    ptr = SDL3::Raw.SDL_calloc(10, 4)
    refute_nil ptr
    refute ptr.null?
    SDL3::Raw.SDL_free(ptr)
  end

  def test_strlen
    assert_equal 5, SDL3::Raw.SDL_strlen("hello")
    assert_equal 0, SDL3::Raw.SDL_strlen("")
  end

  def test_strcmp
    assert_equal 0, SDL3::Raw.SDL_strcmp("abc", "abc")
    assert SDL3::Raw.SDL_strcmp("abc", "abd") < 0
    assert SDL3::Raw.SDL_strcmp("abd", "abc") > 0
  end

  def test_strcasecmp
    assert_equal 0, SDL3::Raw.SDL_strcasecmp("ABC", "abc")
    assert_equal 0, SDL3::Raw.SDL_strcasecmp("Hello", "hello")
  end

  def test_atoi
    assert_equal 123, SDL3::Raw.SDL_atoi("123")
    assert_equal(-456, SDL3::Raw.SDL_atoi("-456"))
    assert_equal 0, SDL3::Raw.SDL_atoi("abc")
  end

  def test_atof
    assert_in_delta 3.14, SDL3::Raw.SDL_atof("3.14"), 0.001
  end

  def test_abs
    assert_equal 5, SDL3::Raw.SDL_abs(5)
    assert_equal 5, SDL3::Raw.SDL_abs(-5)
    assert_equal 0, SDL3::Raw.SDL_abs(0)
  end

  def test_isdigit
    assert SDL3::Raw.SDL_isdigit("0".ord) != 0
    assert SDL3::Raw.SDL_isdigit("9".ord) != 0
    assert_equal 0, SDL3::Raw.SDL_isdigit("a".ord)
  end

  def test_isalpha
    assert SDL3::Raw.SDL_isalpha("a".ord) != 0
    assert SDL3::Raw.SDL_isalpha("Z".ord) != 0
    assert_equal 0, SDL3::Raw.SDL_isalpha("1".ord)
  end

  def test_toupper
    assert_equal "A".ord, SDL3::Raw.SDL_toupper("a".ord)
    assert_equal "Z".ord, SDL3::Raw.SDL_toupper("z".ord)
  end

  def test_tolower
    assert_equal "a".ord, SDL3::Raw.SDL_tolower("A".ord)
    assert_equal "z".ord, SDL3::Raw.SDL_tolower("Z".ord)
  end

  def test_math_functions
    assert_in_delta 0.0, SDL3::Raw.SDL_sin(0.0), 0.0001
    assert_in_delta 1.0, SDL3::Raw.SDL_cos(0.0), 0.0001
    assert_in_delta 2.0, SDL3::Raw.SDL_sqrt(4.0), 0.0001
    assert_in_delta 8.0, SDL3::Raw.SDL_pow(2.0, 3.0), 0.0001
  end

  def test_floor_ceil
    assert_in_delta 3.0, SDL3::Raw.SDL_floor(3.7), 0.0001
    assert_in_delta 4.0, SDL3::Raw.SDL_ceil(3.2), 0.0001
  end

  def test_crc32
    data = "hello"
    ptr = FFI::MemoryPointer.from_string(data)
    result = SDL3::Raw.SDL_crc32(0, ptr, data.length)
    assert_kind_of Integer, result
  end
end
