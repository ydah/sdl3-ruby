# frozen_string_literal: true

require "test_helper"

class TestRawCPUInfo < Minitest::Test
  def test_get_num_logical_cpu_cores
    result = SDL3::Raw.SDL_GetNumLogicalCPUCores
    assert_kind_of Integer, result
    assert result > 0
  end

  def test_get_cpu_cache_line_size
    result = SDL3::Raw.SDL_GetCPUCacheLineSize
    assert_kind_of Integer, result
    assert result >= 0
  end

  def test_has_alti_vec
    result = SDL3::Raw.SDL_HasAltiVec
    assert_includes [true, false], result
  end

  def test_has_mmx
    result = SDL3::Raw.SDL_HasMMX
    assert_includes [true, false], result
  end

  def test_has_sse
    result = SDL3::Raw.SDL_HasSSE
    assert_includes [true, false], result
  end

  def test_has_sse2
    result = SDL3::Raw.SDL_HasSSE2
    assert_includes [true, false], result
  end

  def test_has_sse3
    result = SDL3::Raw.SDL_HasSSE3
    assert_includes [true, false], result
  end

  def test_has_sse41
    result = SDL3::Raw.SDL_HasSSE41
    assert_includes [true, false], result
  end

  def test_has_sse42
    result = SDL3::Raw.SDL_HasSSE42
    assert_includes [true, false], result
  end

  def test_has_avx
    result = SDL3::Raw.SDL_HasAVX
    assert_includes [true, false], result
  end

  def test_has_avx2
    result = SDL3::Raw.SDL_HasAVX2
    assert_includes [true, false], result
  end

  def test_has_avx512f
    result = SDL3::Raw.SDL_HasAVX512F
    assert_includes [true, false], result
  end

  def test_has_neon
    result = SDL3::Raw.SDL_HasNEON
    assert_includes [true, false], result
  end

  def test_get_system_ram
    result = SDL3::Raw.SDL_GetSystemRAM
    assert_kind_of Integer, result
    assert result > 0
  end

  def test_get_simd_alignment
    result = SDL3::Raw.SDL_GetSIMDAlignment
    assert_kind_of Integer, result
    assert result > 0
  end
end
