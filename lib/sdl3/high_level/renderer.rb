# frozen_string_literal: true

module SDL3
  class Renderer
    attr_reader :ptr

    def initialize(window, driver_name = nil)
      @ptr = Raw.SDL_CreateRenderer(window.to_ptr, driver_name)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_DestroyRenderer(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.create(window, driver_name = nil)
      renderer = new(window, driver_name)
      return renderer unless block_given?

      begin
        yield renderer
      ensure
        renderer.destroy
      end
    end

    def destroy
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroyRenderer(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def draw_color
      r = FFI::MemoryPointer.new(:uint8)
      g = FFI::MemoryPointer.new(:uint8)
      b = FFI::MemoryPointer.new(:uint8)
      a = FFI::MemoryPointer.new(:uint8)
      Raw.SDL_GetRenderDrawColor(@ptr, r, g, b, a)
      [r.read_uint8, g.read_uint8, b.read_uint8, a.read_uint8]
    end

    def draw_color=(color)
      r, g, b, a = color
      a ||= 255
      Raw.SDL_SetRenderDrawColor(@ptr, r, g, b, a)
    end

    def clear
      raise Error, Raw.SDL_GetError unless Raw.SDL_RenderClear(@ptr)

      true
    end

    def present
      raise Error, Raw.SDL_GetError unless Raw.SDL_RenderPresent(@ptr)

      true
    end

    def draw_point(x, y)
      Raw.SDL_RenderPoint(@ptr, x.to_f, y.to_f)
    end

    def draw_line(x1, y1, x2, y2)
      Raw.SDL_RenderLine(@ptr, x1.to_f, y1.to_f, x2.to_f, y2.to_f)
    end

    def draw_rect(x, y, w, h)
      rect = Raw::SDL_FRect.new
      rect[:x] = x.to_f
      rect[:y] = y.to_f
      rect[:w] = w.to_f
      rect[:h] = h.to_f
      Raw.SDL_RenderRect(@ptr, rect)
    end

    def fill_rect(x, y, w, h)
      rect = Raw::SDL_FRect.new
      rect[:x] = x.to_f
      rect[:y] = y.to_f
      rect[:w] = w.to_f
      rect[:h] = h.to_f
      Raw.SDL_RenderFillRect(@ptr, rect)
    end

    def copy(texture, src_rect = nil, dst_rect = nil)
      src = rect_to_frect(src_rect)
      dst = rect_to_frect(dst_rect)
      Raw.SDL_RenderTexture(@ptr, texture.to_ptr, src, dst)
    end

    def copy_ex(texture, src_rect, dst_rect, angle, center = nil, flip = :SDL_FLIP_NONE)
      src = rect_to_frect(src_rect)
      dst = rect_to_frect(dst_rect)
      center_ptr = nil
      if center
        center_ptr = Raw::SDL_FPoint.new
        center_ptr[:x] = center[0].to_f
        center_ptr[:y] = center[1].to_f
      end
      Raw.SDL_RenderTextureRotated(@ptr, texture.to_ptr, src, dst, angle.to_f, center_ptr, flip)
    end

    def target=(texture)
      ptr = texture ? texture.to_ptr : nil
      Raw.SDL_SetRenderTarget(@ptr, ptr)
    end

    def logical_size=(dimensions)
      Raw.SDL_SetRenderLogicalPresentation(@ptr, dimensions[0], dimensions[1],
                                           :SDL_LOGICAL_PRESENTATION_LETTERBOX,
                                           :SDL_SCALEMODE_LINEAR)
    end

    def scale=(factors)
      Raw.SDL_SetRenderScale(@ptr, factors[0].to_f, factors[1].to_f)
    end

    def scale
      x = FFI::MemoryPointer.new(:float)
      y = FFI::MemoryPointer.new(:float)
      Raw.SDL_GetRenderScale(@ptr, x, y)
      [x.read_float, y.read_float]
    end

    def create_texture(format, access, width, height)
      Texture.new(self, format, access, width, height)
    end

    def create_texture_from_surface(surface)
      Texture.from_surface(self, surface)
    end

    def to_ptr
      @ptr
    end

    private

    def rect_to_frect(rect)
      return nil unless rect

      frect = Raw::SDL_FRect.new
      if rect.is_a?(Hash)
        frect[:x] = rect[:x].to_f
        frect[:y] = rect[:y].to_f
        frect[:w] = rect[:w].to_f
        frect[:h] = rect[:h].to_f
      else
        frect[:x] = rect[0].to_f
        frect[:y] = rect[1].to_f
        frect[:w] = rect[2].to_f
        frect[:h] = rect[3].to_f
      end
      frect
    end
  end
end
