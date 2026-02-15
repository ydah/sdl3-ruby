# frozen_string_literal: true

module SDL3
  class Surface
    attr_reader :ptr

    def initialize(width, height, format = Raw::SDL_PIXELFORMAT_RGBA8888)
      @ptr = Raw.SDL_CreateSurface(width, height, format)
      raise Error, Raw.SDL_GetError if @ptr.null?

      @owned = true
      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc do
        Raw.SDL_DestroySurface(prevented_ptr) unless prevented_ptr.null?
      end
    end

    def self.from_ptr(ptr, owned: true)
      surface = allocate
      surface.instance_variable_set(:@ptr, ptr)
      surface.instance_variable_set(:@owned, owned)
      ObjectSpace.define_finalizer(surface, releasing(ptr)) if owned
      surface
    end

    def self.load_bmp(file)
      ptr = Raw.SDL_LoadBMP(file)
      raise Error, Raw.SDL_GetError if ptr.null?

      from_ptr(ptr, owned: true)
    end

    def destroy
      return if @ptr.null?
      return unless @owned

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroySurface(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def width
      struct[:w]
    end

    def height
      struct[:h]
    end

    def size
      [width, height]
    end

    def pitch
      struct[:pitch]
    end

    def format
      struct[:format]
    end

    def pixels
      struct[:pixels]
    end

    def lock
      raise Error, Raw.SDL_GetError unless Raw.SDL_LockSurface(@ptr)

      true
    end

    def unlock
      Raw.SDL_UnlockSurface(@ptr)
    end

    def fill_rect(rect, color)
      rect_ptr = nil
      if rect
        rect_ptr = Raw::SDL_Rect.new
        rect_ptr[:x] = rect[0]
        rect_ptr[:y] = rect[1]
        rect_ptr[:w] = rect[2]
        rect_ptr[:h] = rect[3]
      end
      Raw.SDL_FillSurfaceRect(@ptr, rect_ptr, color)
    end

    def blit(src_surface, src_rect = nil, dst_rect = nil)
      src_rect_ptr = nil
      dst_rect_ptr = nil

      if src_rect
        src_rect_ptr = Raw::SDL_Rect.new
        src_rect_ptr[:x] = src_rect[0]
        src_rect_ptr[:y] = src_rect[1]
        src_rect_ptr[:w] = src_rect[2]
        src_rect_ptr[:h] = src_rect[3]
      end

      if dst_rect
        dst_rect_ptr = Raw::SDL_Rect.new
        dst_rect_ptr[:x] = dst_rect[0]
        dst_rect_ptr[:y] = dst_rect[1]
        dst_rect_ptr[:w] = dst_rect[2]
        dst_rect_ptr[:h] = dst_rect[3]
      end

      Raw.SDL_BlitSurface(src_surface.to_ptr, src_rect_ptr, @ptr, dst_rect_ptr)
    end

    def convert(format)
      ptr = Raw.SDL_ConvertSurface(@ptr, format)
      raise Error, Raw.SDL_GetError if ptr.null?

      Surface.from_ptr(ptr, owned: true)
    end

    def flip(mode)
      Raw.SDL_FlipSurface(@ptr, mode)
    end

    def duplicate
      ptr = Raw.SDL_DuplicateSurface(@ptr)
      raise Error, Raw.SDL_GetError if ptr.null?

      Surface.from_ptr(ptr, owned: true)
    end

    def to_ptr
      @ptr
    end

    private

    def struct
      @struct ||= Raw::SDL_Surface.new(@ptr)
    end
  end
end
