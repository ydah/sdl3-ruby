# frozen_string_literal: true

module SDL3
  class GPUDevice
    attr_reader :ptr

    def initialize(shader_formats, debug_mode = false, name = nil)
      @ptr = Raw.SDL_CreateGPUDevice(shader_formats, debug_mode, name)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_DestroyGPUDevice(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.create(shader_formats, debug_mode: false, name: nil)
      device = new(shader_formats, debug_mode, name)
      return device unless block_given?

      begin
        yield device
      ensure
        device.destroy
      end
    end

    def self.create_with_properties(properties_id)
      ptr = Raw.SDL_CreateGPUDeviceWithProperties(properties_id)
      raise Error, Raw.SDL_GetError if ptr.null?

      device = allocate
      device.instance_variable_set(:@ptr, ptr)
      ObjectSpace.define_finalizer(device, releasing(ptr))
      device
    end

    def self.num_drivers
      Raw.SDL_GetNumGPUDrivers
    end

    def self.driver(index)
      Raw.SDL_GetGPUDriver(index)
    end

    def self.supports_shader_formats?(formats, name = nil)
      Raw.SDL_GPUSupportsShaderFormats(formats, name)
    end

    def self.supports_properties?(properties_id)
      Raw.SDL_GPUSupportsProperties(properties_id)
    end

    def destroy
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroyGPUDevice(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def driver
      Raw.SDL_GetGPUDeviceDriver(@ptr)
    end

    def shader_formats
      Raw.SDL_GetGPUShaderFormats(@ptr)
    end

    def create_compute_pipeline(create_info)
      Raw.SDL_CreateGPUComputePipeline(@ptr, create_info)
    end

    def create_graphics_pipeline(create_info)
      Raw.SDL_CreateGPUGraphicsPipeline(@ptr, create_info)
    end

    def create_sampler(create_info)
      Raw.SDL_CreateGPUSampler(@ptr, create_info)
    end

    def create_shader(create_info)
      Raw.SDL_CreateGPUShader(@ptr, create_info)
    end

    def create_texture(create_info)
      Raw.SDL_CreateGPUTexture(@ptr, create_info)
    end

    def create_buffer(create_info)
      Raw.SDL_CreateGPUBuffer(@ptr, create_info)
    end

    def create_transfer_buffer(create_info)
      Raw.SDL_CreateGPUTransferBuffer(@ptr, create_info)
    end

    def release_texture(texture)
      Raw.SDL_ReleaseGPUTexture(@ptr, texture)
    end

    def release_sampler(sampler)
      Raw.SDL_ReleaseGPUSampler(@ptr, sampler)
    end

    def release_buffer(buffer)
      Raw.SDL_ReleaseGPUBuffer(@ptr, buffer)
    end

    def release_transfer_buffer(transfer_buffer)
      Raw.SDL_ReleaseGPUTransferBuffer(@ptr, transfer_buffer)
    end

    def release_compute_pipeline(pipeline)
      Raw.SDL_ReleaseGPUComputePipeline(@ptr, pipeline)
    end

    def release_shader(shader)
      Raw.SDL_ReleaseGPUShader(@ptr, shader)
    end

    def release_graphics_pipeline(pipeline)
      Raw.SDL_ReleaseGPUGraphicsPipeline(@ptr, pipeline)
    end

    def acquire_command_buffer
      Raw.SDL_AcquireGPUCommandBuffer(@ptr)
    end

    def claim_window(window)
      Raw.SDL_ClaimWindowForGPUDevice(@ptr, window.to_ptr)
    end

    def release_window(window)
      Raw.SDL_ReleaseWindowFromGPUDevice(@ptr, window.to_ptr)
    end

    def set_swapchain_parameters(window, composition, present_mode)
      Raw.SDL_SetGPUSwapchainParameters(@ptr, window.to_ptr, composition, present_mode)
    end

    def set_allowed_frames_in_flight(count)
      Raw.SDL_SetGPUAllowedFramesInFlight(@ptr, count)
    end

    def swapchain_texture_format(window)
      Raw.SDL_GetGPUSwapchainTextureFormat(@ptr, window.to_ptr)
    end

    def wait_for_idle
      Raw.SDL_WaitForGPUIdle(@ptr)
    end

    def wait_for_fences(wait_all, fences)
      fences_ptr = FFI::MemoryPointer.new(:pointer, fences.size)
      fences.each_with_index { |f, i| fences_ptr.put_pointer(i * FFI::Pointer.size, f) }
      Raw.SDL_WaitForGPUFences(@ptr, wait_all, fences_ptr, fences.size)
    end

    def query_fence(fence)
      Raw.SDL_QueryGPUFence(@ptr, fence)
    end

    def release_fence(fence)
      Raw.SDL_ReleaseGPUFence(@ptr, fence)
    end

    def texture_supports_format?(format, type, usage)
      Raw.SDL_GPUTextureSupportsFormat(@ptr, format, type, usage)
    end

    def texture_supports_sample_count?(format, sample_count)
      Raw.SDL_GPUTextureSupportsSampleCount(@ptr, format, sample_count)
    end

    def to_ptr
      @ptr
    end
  end

  module GPU
    class << self
      def texture_format_texel_block_size(format)
        Raw.SDL_GPUTextureFormatTexelBlockSize(format)
      end

      def calculate_texture_format_size(format, width, height, depth)
        Raw.SDL_CalculateGPUTextureFormatSize(format, width, height, depth)
      end
    end
  end
end
