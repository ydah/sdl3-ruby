# frozen_string_literal: true

module SDL3
  module Raw
    SDL_TextureAccess = enum :SDL_TEXTUREACCESS_STATIC, 0,
                             :SDL_TEXTUREACCESS_STREAMING, 1,
                             :SDL_TEXTUREACCESS_TARGET, 2

    SDL_TextureAddressMode = enum :SDL_TEXTURE_ADDRESS_INVALID, -1,
                                  :SDL_TEXTURE_ADDRESS_AUTO, 0,
                                  :SDL_TEXTURE_ADDRESS_CLAMP, 1,
                                  :SDL_TEXTURE_ADDRESS_WRAP, 2

    SDL_RendererLogicalPresentation = enum :SDL_LOGICAL_PRESENTATION_DISABLED, 0,
                                           :SDL_LOGICAL_PRESENTATION_STRETCH, 1,
                                           :SDL_LOGICAL_PRESENTATION_LETTERBOX, 2,
                                           :SDL_LOGICAL_PRESENTATION_OVERSCAN, 3,
                                           :SDL_LOGICAL_PRESENTATION_INTEGER_SCALE, 4

    class SDL_Vertex < FFI::Struct
      layout :position, SDL_FPoint,
             :color, SDL_FColor,
             :tex_coord, SDL_FPoint
    end

    attach_function :SDL_GetNumRenderDrivers, [], :int
    attach_function :SDL_GetRenderDriver, [:int], :string
    begin
      attach_function :SDL_CreateWindowAndRenderer, %i[string int int uint64 pointer pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_CreateRenderer, %i[pointer string], :pointer
    attach_function :SDL_CreateRendererWithProperties, [:SDL_PropertiesID], :pointer
    begin
      attach_function :SDL_CreateGPURenderer, %i[pointer pointer], :pointer
      attach_function :SDL_GetGPURendererDevice, [:pointer], :pointer
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_CreateSoftwareRenderer, [SDL_Surface.ptr], :pointer
    attach_function :SDL_GetRenderer, [:pointer], :pointer
    attach_function :SDL_GetRenderWindow, [:pointer], :pointer
    attach_function :SDL_GetRendererName, [:pointer], :string
    attach_function :SDL_GetRendererProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetRenderOutputSize, %i[pointer pointer pointer], :bool
    attach_function :SDL_GetCurrentRenderOutputSize, %i[pointer pointer pointer], :bool
    attach_function :SDL_CreateTexture, %i[pointer uint32 int int int], :pointer
    attach_function :SDL_CreateTextureFromSurface, [:pointer, SDL_Surface.ptr], :pointer
    attach_function :SDL_CreateTextureWithProperties, [:pointer, :SDL_PropertiesID], :pointer
    attach_function :SDL_GetTextureProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetRendererFromTexture, [:pointer], :pointer
    attach_function :SDL_GetTextureSize, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetTextureColorMod, %i[pointer uint8 uint8 uint8], :bool
    attach_function :SDL_SetTextureColorModFloat, %i[pointer float float float], :bool
    attach_function :SDL_GetTextureColorMod, %i[pointer pointer pointer pointer], :bool
    attach_function :SDL_GetTextureColorModFloat, %i[pointer pointer pointer pointer], :bool
    attach_function :SDL_SetTextureAlphaMod, %i[pointer uint8], :bool
    attach_function :SDL_SetTextureAlphaModFloat, %i[pointer float], :bool
    attach_function :SDL_GetTextureAlphaMod, %i[pointer pointer], :bool
    attach_function :SDL_GetTextureAlphaModFloat, %i[pointer pointer], :bool
    attach_function :SDL_SetTextureBlendMode, %i[pointer uint32], :bool
    attach_function :SDL_GetTextureBlendMode, %i[pointer pointer], :bool
    attach_function :SDL_SetTextureScaleMode, [:pointer, SDL_ScaleMode], :bool
    attach_function :SDL_GetTextureScaleMode, [:pointer, :pointer], :bool
    begin
      attach_function :SDL_SetTexturePalette, %i[pointer pointer], :bool
      attach_function :SDL_GetTexturePalette, [:pointer], :pointer
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_UpdateTexture, [:pointer, SDL_Rect.ptr, :pointer, :int], :bool
    attach_function :SDL_UpdateYUVTexture, [:pointer, SDL_Rect.ptr, :pointer, :int, :pointer, :int, :pointer, :int], :bool
    attach_function :SDL_UpdateNVTexture, [:pointer, SDL_Rect.ptr, :pointer, :int, :pointer, :int], :bool
    attach_function :SDL_LockTexture, [:pointer, SDL_Rect.ptr, :pointer, :pointer], :bool
    attach_function :SDL_LockTextureToSurface, [:pointer, SDL_Rect.ptr, :pointer], :bool
    attach_function :SDL_UnlockTexture, [:pointer], :void
    attach_function :SDL_SetRenderTarget, %i[pointer pointer], :bool
    attach_function :SDL_GetRenderTarget, [:pointer], :pointer
    attach_function :SDL_SetRenderLogicalPresentation, [:pointer, :int, :int, SDL_RendererLogicalPresentation, SDL_ScaleMode], :bool
    attach_function :SDL_GetRenderLogicalPresentation, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_GetRenderLogicalPresentationRect, [:pointer, SDL_FRect.ptr], :bool
    attach_function :SDL_RenderCoordinatesFromWindow, %i[pointer float float pointer pointer], :bool
    attach_function :SDL_RenderCoordinatesToWindow, %i[pointer float float pointer pointer], :bool
    attach_function :SDL_ConvertEventToRenderCoordinates, %i[pointer pointer], :bool
    attach_function :SDL_SetRenderViewport, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRenderViewport, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_RenderViewportSet, [:pointer], :bool
    attach_function :SDL_GetRenderSafeArea, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_SetRenderClipRect, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRenderClipRect, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_RenderClipEnabled, [:pointer], :bool
    attach_function :SDL_SetRenderScale, %i[pointer float float], :bool
    attach_function :SDL_GetRenderScale, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetRenderDrawColor, %i[pointer uint8 uint8 uint8 uint8], :bool
    attach_function :SDL_SetRenderDrawColorFloat, %i[pointer float float float float], :bool
    attach_function :SDL_GetRenderDrawColor, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_GetRenderDrawColorFloat, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_SetRenderColorScale, %i[pointer float], :bool
    attach_function :SDL_GetRenderColorScale, %i[pointer pointer], :bool
    attach_function :SDL_SetRenderDrawBlendMode, %i[pointer uint32], :bool
    attach_function :SDL_GetRenderDrawBlendMode, %i[pointer pointer], :bool
    attach_function :SDL_RenderClear, [:pointer], :bool
    attach_function :SDL_RenderPoint, %i[pointer float float], :bool
    attach_function :SDL_RenderPoints, [:pointer, SDL_FPoint.ptr, :int], :bool
    attach_function :SDL_RenderLine, %i[pointer float float float float], :bool
    attach_function :SDL_RenderLines, [:pointer, SDL_FPoint.ptr, :int], :bool
    attach_function :SDL_RenderRect, [:pointer, SDL_FRect.ptr], :bool
    attach_function :SDL_RenderRects, [:pointer, SDL_FRect.ptr, :int], :bool
    attach_function :SDL_RenderFillRect, [:pointer, SDL_FRect.ptr], :bool
    attach_function :SDL_RenderFillRects, [:pointer, SDL_FRect.ptr, :int], :bool
    attach_function :SDL_RenderTexture, [:pointer, :pointer, SDL_FRect.ptr, SDL_FRect.ptr], :bool
    attach_function :SDL_RenderTextureRotated, [:pointer, :pointer, SDL_FRect.ptr, SDL_FRect.ptr, :double, SDL_FPoint.ptr, SDL_FlipMode], :bool
    begin
      attach_function :SDL_RenderTextureAffine, %i[pointer pointer pointer pointer pointer pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_RenderTextureTiled, [:pointer, :pointer, SDL_FRect.ptr, :float, SDL_FRect.ptr], :bool
    attach_function :SDL_RenderTexture9Grid, [:pointer, :pointer, SDL_FRect.ptr, :float, :float, :float, :float, :float, SDL_FRect.ptr], :bool
    begin
      attach_function :SDL_RenderTexture9GridTiled, %i[pointer pointer pointer float float float float float pointer float], :bool
      attach_function :SDL_SetRenderTextureAddressMode, [:pointer, SDL_TextureAddressMode, SDL_TextureAddressMode], :bool
      attach_function :SDL_GetRenderTextureAddressMode, %i[pointer pointer pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_RenderGeometry, [:pointer, :pointer, SDL_Vertex.ptr, :int, :pointer, :int], :bool
    attach_function :SDL_RenderGeometryRaw, [:pointer, :pointer, :pointer, :int, SDL_FColor.ptr, :int, :pointer, :int, :int, :pointer, :int, :int], :bool
    attach_function :SDL_RenderReadPixels, [:pointer, SDL_Rect.ptr], SDL_Surface.ptr
    attach_function :SDL_RenderPresent, [:pointer], :bool
    attach_function :SDL_DestroyTexture, [:pointer], :void
    attach_function :SDL_DestroyRenderer, [:pointer], :void
    attach_function :SDL_FlushRenderer, [:pointer], :bool
    attach_function :SDL_GetRenderMetalLayer, [:pointer], :pointer
    attach_function :SDL_GetRenderMetalCommandEncoder, [:pointer], :pointer
    attach_function :SDL_AddVulkanRenderSemaphores, %i[pointer uint32 int64 int64], :bool
    attach_function :SDL_SetRenderVSync, %i[pointer int], :bool
    attach_function :SDL_GetRenderVSync, %i[pointer pointer], :bool
    begin
      attach_function :SDL_RenderDebugText, %i[pointer float float string], :bool
      attach_function :SDL_RenderDebugTextFormat, [:pointer, :float, :float, :string, :varargs], :bool
      attach_function :SDL_SetDefaultTextureScaleMode, [:pointer, SDL_ScaleMode], :bool
      attach_function :SDL_GetDefaultTextureScaleMode, [:pointer, :pointer], :bool
      attach_function :SDL_CreateGPURenderState, %i[pointer pointer], :pointer
      attach_function :SDL_SetGPURenderStateFragmentUniforms, %i[pointer uint32 pointer uint32], :bool
      attach_function :SDL_SetGPURenderState, %i[pointer pointer], :bool
      attach_function :SDL_DestroyGPURenderState, [:pointer], :void
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
  end
end
