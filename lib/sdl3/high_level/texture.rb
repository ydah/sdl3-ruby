# frozen_string_literal: true

module SDL3
  class Texture
    attr_reader :ptr

    ACCESS_STATIC = :SDL_TEXTUREACCESS_STATIC
    ACCESS_STREAMING = :SDL_TEXTUREACCESS_STREAMING
    ACCESS_TARGET = :SDL_TEXTUREACCESS_TARGET

    def initialize(renderer, format, access, width, height)
      access_value = case access
                     when Symbol then Raw::SDL_TextureAccess[access]
                     when Integer then access
                     else access
                     end
      @ptr = Raw.SDL_CreateTexture(renderer.to_ptr, format, access_value, width, height)
      raise Error, Raw.SDL_GetError if @ptr.null?

      @owned = true
      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_DestroyTexture(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.from_surface(renderer, surface)
      ptr = Raw.SDL_CreateTextureFromSurface(renderer.to_ptr, surface.to_ptr)
      raise Error, Raw.SDL_GetError if ptr.null?

      texture = allocate
      texture.instance_variable_set(:@ptr, ptr)
      texture.instance_variable_set(:@owned, true)
      ObjectSpace.define_finalizer(texture, releasing(ptr))
      texture
    end

    def destroy
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroyTexture(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def size
      w = FFI::MemoryPointer.new(:float)
      h = FFI::MemoryPointer.new(:float)
      Raw.SDL_GetTextureSize(@ptr, w, h)
      [w.read_float.to_i, h.read_float.to_i]
    end

    def width
      size[0]
    end

    def height
      size[1]
    end

    def color_mod=(rgb)
      Raw.SDL_SetTextureColorMod(@ptr, rgb[0], rgb[1], rgb[2])
    end

    def color_mod
      r = FFI::MemoryPointer.new(:uint8)
      g = FFI::MemoryPointer.new(:uint8)
      b = FFI::MemoryPointer.new(:uint8)
      Raw.SDL_GetTextureColorMod(@ptr, r, g, b)
      [r.read_uint8, g.read_uint8, b.read_uint8]
    end

    def alpha_mod=(alpha)
      Raw.SDL_SetTextureAlphaMod(@ptr, alpha)
    end

    def alpha_mod
      a = FFI::MemoryPointer.new(:uint8)
      Raw.SDL_GetTextureAlphaMod(@ptr, a)
      a.read_uint8
    end

    def blend_mode=(mode)
      Raw.SDL_SetTextureBlendMode(@ptr, mode)
    end

    def blend_mode
      mode = FFI::MemoryPointer.new(:uint32)
      Raw.SDL_GetTextureBlendMode(@ptr, mode)
      mode.read_uint32
    end

    def update(rect, pixels, pitch)
      rect_ptr = nil
      if rect
        rect_ptr = Raw::SDL_Rect.new
        rect_ptr[:x] = rect[0]
        rect_ptr[:y] = rect[1]
        rect_ptr[:w] = rect[2]
        rect_ptr[:h] = rect[3]
      end
      Raw.SDL_UpdateTexture(@ptr, rect_ptr, pixels, pitch)
    end

    def to_ptr
      @ptr
    end
  end
end
