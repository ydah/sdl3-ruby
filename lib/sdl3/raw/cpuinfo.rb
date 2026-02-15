# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_GetNumLogicalCPUCores, [], :int
    attach_function :SDL_GetCPUCacheLineSize, [], :int
    attach_function :SDL_HasAltiVec, [], :bool
    attach_function :SDL_HasMMX, [], :bool
    attach_function :SDL_HasSSE, [], :bool
    attach_function :SDL_HasSSE2, [], :bool
    attach_function :SDL_HasSSE3, [], :bool
    attach_function :SDL_HasSSE41, [], :bool
    attach_function :SDL_HasSSE42, [], :bool
    attach_function :SDL_HasAVX, [], :bool
    attach_function :SDL_HasAVX2, [], :bool
    attach_function :SDL_HasAVX512F, [], :bool
    attach_function :SDL_HasARMSIMD, [], :bool
    attach_function :SDL_HasNEON, [], :bool
    attach_function :SDL_HasLSX, [], :bool
    attach_function :SDL_HasLASX, [], :bool
    attach_function :SDL_GetSystemRAM, [], :int
    begin
      attach_function :SDL_GetSystemPageSize, [], :int
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetSIMDAlignment, [], :size_t
  end
end
