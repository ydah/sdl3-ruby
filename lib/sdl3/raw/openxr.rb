# frozen_string_literal: true

module SDL3
  module Raw
    typedef :uint64, :XrSession
    typedef :uint64, :XrSwapchain
    typedef :int, :XrResult

    begin
      attach_function :SDL_CreateGPUXRSession, %i[pointer pointer pointer], :XrResult
      attach_function :SDL_GetGPUXRSwapchainFormats, %i[pointer XrSession pointer], :pointer
      attach_function :SDL_CreateGPUXRSwapchain, %i[pointer XrSession pointer int pointer pointer], :XrResult
      attach_function :SDL_DestroyGPUXRSwapchain, %i[pointer XrSwapchain pointer], :XrResult
      attach_function :SDL_OpenXR_LoadLibrary, [], :bool
      attach_function :SDL_OpenXR_UnloadLibrary, [], :void
      attach_function :SDL_OpenXR_GetXrGetInstanceProcAddr, [], :pointer
    rescue FFI::NotFoundError
      # OpenXR APIs are only available on recent SDL builds.
    end
  end
end
