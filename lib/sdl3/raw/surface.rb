# frozen_string_literal: true

module SDL3
  module Raw
    SDL_SURFACE_PREALLOCATED = 0x00000001
    SDL_SURFACE_LOCK_NEEDED = 0x00000002
    SDL_SURFACE_LOCKED = 0x00000004
    SDL_SURFACE_SIMD_ALIGNED = 0x00000008

    SDL_ScaleMode = enum :SDL_SCALEMODE_NEAREST, 0,
                         :SDL_SCALEMODE_LINEAR, 1

    SDL_FlipMode = enum :SDL_FLIP_NONE, 0,
                        :SDL_FLIP_HORIZONTAL, 1,
                        :SDL_FLIP_VERTICAL, 2

    class SDL_Surface < FFI::Struct
      layout :flags, :uint32,
             :format, :uint32,
             :w, :int,
             :h, :int,
             :pitch, :int,
             :pixels, :pointer,
             :refcount, :int,
             :reserved, :pointer
    end

    attach_function :SDL_CreateSurface, %i[int int uint32], :pointer
    attach_function :SDL_CreateSurfaceFrom, %i[int int uint32 pointer int], :pointer
    attach_function :SDL_DestroySurface, [:pointer], :void
    attach_function :SDL_GetSurfaceProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_SetSurfaceColorspace, %i[pointer uint32], :bool
    attach_function :SDL_GetSurfaceColorspace, [:pointer], :uint32
    attach_function :SDL_CreateSurfacePalette, [:pointer], :pointer
    attach_function :SDL_SetSurfacePalette, %i[pointer pointer], :bool
    attach_function :SDL_GetSurfacePalette, [:pointer], :pointer
    attach_function :SDL_AddSurfaceAlternateImage, %i[pointer pointer], :bool
    attach_function :SDL_SurfaceHasAlternateImages, [:pointer], :bool
    attach_function :SDL_GetSurfaceImages, %i[pointer pointer], :pointer
    attach_function :SDL_RemoveSurfaceAlternateImages, [:pointer], :void
    attach_function :SDL_LockSurface, [:pointer], :bool
    attach_function :SDL_UnlockSurface, [:pointer], :void
    attach_function :SDL_SetSurfaceRLE, %i[pointer bool], :bool
    attach_function :SDL_SurfaceHasRLE, [:pointer], :bool
    attach_function :SDL_SetSurfaceColorKey, %i[pointer bool uint32], :bool
    attach_function :SDL_SurfaceHasColorKey, [:pointer], :bool
    attach_function :SDL_GetSurfaceColorKey, %i[pointer pointer], :bool
    attach_function :SDL_SetSurfaceColorMod, %i[pointer uint8 uint8 uint8], :bool
    attach_function :SDL_GetSurfaceColorMod, %i[pointer pointer pointer pointer], :bool
    attach_function :SDL_SetSurfaceAlphaMod, %i[pointer uint8], :bool
    attach_function :SDL_GetSurfaceAlphaMod, %i[pointer pointer], :bool
    attach_function :SDL_SetSurfaceBlendMode, %i[pointer uint32], :bool
    attach_function :SDL_GetSurfaceBlendMode, %i[pointer pointer], :bool
    attach_function :SDL_SetSurfaceClipRect, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_GetSurfaceClipRect, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_FlipSurface, [:pointer, SDL_FlipMode], :bool
    attach_function :SDL_DuplicateSurface, [:pointer], :pointer
    attach_function :SDL_ScaleSurface, [:pointer, :int, :int, SDL_ScaleMode], :pointer
    attach_function :SDL_ConvertSurface, %i[pointer uint32], :pointer
    attach_function :SDL_ConvertSurfaceAndColorspace, [:pointer, :uint32, :pointer, :uint32, :SDL_PropertiesID], :pointer
    attach_function :SDL_PremultiplySurfaceAlpha, %i[pointer bool], :bool
    begin
      attach_function :SDL_ConvertPixels, %i[int int uint32 pointer int uint32 pointer int], :bool
      attach_function :SDL_ConvertPixelsAndColorspace, %i[int int uint32 uint32 SDL_PropertiesID pointer int uint32 uint32 SDL_PropertiesID pointer int], :bool
      attach_function :SDL_PremultiplyAlpha, %i[int int uint32 pointer int uint32 pointer int bool], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_ClearSurface, %i[pointer float float float float], :bool
    attach_function :SDL_FillSurfaceRect, [:pointer, SDL_Rect.ptr, :uint32], :bool
    attach_function :SDL_FillSurfaceRects, [:pointer, SDL_Rect.ptr, :int, :uint32], :bool
    attach_function :SDL_BlitSurface, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_BlitSurfaceUnchecked, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_BlitSurfaceScaled, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr, SDL_ScaleMode], :bool
    attach_function :SDL_BlitSurfaceUncheckedScaled, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr, SDL_ScaleMode], :bool
    attach_function :SDL_BlitSurfaceTiled, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_BlitSurfaceTiledWithScale, [:pointer, SDL_Rect.ptr, :float, SDL_ScaleMode, :pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_BlitSurface9Grid, [:pointer, SDL_Rect.ptr, :int, :int, :int, :int, :float, SDL_ScaleMode, :pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_MapSurfaceRGB, %i[pointer uint8 uint8 uint8], :uint32
    attach_function :SDL_MapSurfaceRGBA, %i[pointer uint8 uint8 uint8 uint8], :uint32
    attach_function :SDL_ReadSurfacePixel, %i[pointer int int pointer pointer pointer pointer], :bool
    attach_function :SDL_ReadSurfacePixelFloat, %i[pointer int int pointer pointer pointer pointer], :bool
    attach_function :SDL_WriteSurfacePixel, %i[pointer int int uint8 uint8 uint8 uint8], :bool
    attach_function :SDL_WriteSurfacePixelFloat, %i[pointer int int float float float float], :bool
    attach_function :SDL_LoadBMP_IO, %i[pointer bool], :pointer
    attach_function :SDL_LoadBMP, [:string], :pointer
    begin
      attach_function :SDL_LoadSurface_IO, %i[pointer bool], :pointer
      attach_function :SDL_LoadSurface, [:string], :pointer
      attach_function :SDL_LoadPNG_IO, %i[pointer bool], :pointer
      attach_function :SDL_LoadPNG, [:string], :pointer
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_SaveBMP_IO, %i[pointer pointer bool], :bool
    attach_function :SDL_SaveBMP, %i[pointer string], :bool
    begin
      attach_function :SDL_SavePNG_IO, %i[pointer pointer bool], :bool
      attach_function :SDL_SavePNG, %i[pointer string], :bool
      attach_function :SDL_RotateSurface, %i[pointer float], :pointer
      attach_function :SDL_StretchSurface, [:pointer, SDL_Rect.ptr, :pointer, SDL_Rect.ptr, SDL_ScaleMode], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
  end
end
