# frozen_string_literal: true

require "test_helper"

class TestHighLevelGPU < Minitest::Test
  def test_gpu_device_class_exists
    assert SDL3::GPUDevice
  end

  def test_gpu_module_exists
    assert SDL3::GPU
  end

  def test_num_drivers_returns_integer
    result = SDL3::GPUDevice.num_drivers
    assert_kind_of Integer, result
    assert result >= 0
  end

  def test_driver_with_valid_index
    num = SDL3::GPUDevice.num_drivers
    if num > 0
      driver = SDL3::GPUDevice.driver(0)
      assert_kind_of String, driver
    end
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::GPUDevice, :num_drivers
    assert_respond_to SDL3::GPUDevice, :driver
    assert_respond_to SDL3::GPUDevice, :supports_shader_formats?
    assert_respond_to SDL3::GPUDevice, :supports_properties?
    assert_respond_to SDL3::GPUDevice, :create
    assert_respond_to SDL3::GPUDevice, :create_with_properties
  end

  def test_gpu_module_responds_to_methods
    assert_respond_to SDL3::GPU, :texture_format_texel_block_size
    assert_respond_to SDL3::GPU, :calculate_texture_format_size
  end

  def test_texture_format_texel_block_size
    result = SDL3::GPU.texture_format_texel_block_size(:SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM)
    assert_kind_of Integer, result
    assert_equal 4, result
  end

  def test_calculate_texture_format_size
    result = SDL3::GPU.calculate_texture_format_size(:SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM, 64, 64, 1)
    assert_kind_of Integer, result
    assert_equal 64 * 64 * 4, result
  end

  def test_supports_shader_formats
    result = SDL3::GPUDevice.supports_shader_formats?(0x00000002, nil)
    assert_includes [true, false], result
  end
end
