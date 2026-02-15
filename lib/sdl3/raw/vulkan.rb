# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_Vulkan_LoadLibrary, [:string], :bool
    attach_function :SDL_Vulkan_GetVkGetInstanceProcAddr, [], :pointer
    attach_function :SDL_Vulkan_UnloadLibrary, [], :void
    attach_function :SDL_Vulkan_GetInstanceExtensions, [:pointer], :pointer
    attach_function :SDL_Vulkan_CreateSurface, %i[pointer pointer pointer pointer], :bool
    attach_function :SDL_Vulkan_DestroySurface, %i[pointer pointer pointer], :void
    attach_function :SDL_Vulkan_GetPresentationSupport, %i[pointer pointer uint32], :bool
  end
end
