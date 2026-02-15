# frozen_string_literal: true

module SDL3
  class Window
    attr_reader :ptr

    FULLSCREEN = Raw::SDL_WINDOW_FULLSCREEN
    OPENGL = Raw::SDL_WINDOW_OPENGL
    HIDDEN = Raw::SDL_WINDOW_HIDDEN
    BORDERLESS = Raw::SDL_WINDOW_BORDERLESS
    RESIZABLE = Raw::SDL_WINDOW_RESIZABLE
    MINIMIZED = Raw::SDL_WINDOW_MINIMIZED
    MAXIMIZED = Raw::SDL_WINDOW_MAXIMIZED
    VULKAN = Raw::SDL_WINDOW_VULKAN
    METAL = Raw::SDL_WINDOW_METAL

    def initialize(title, width, height, flags = 0)
      @ptr = Raw.SDL_CreateWindow(title, width, height, flags)
      raise Error, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_DestroyWindow(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(title, width, height, flags = 0)
      window = new(title, width, height, flags)
      return window unless block_given?

      begin
        yield window
      ensure
        window.destroy
      end
    end

    def destroy
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroyWindow(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def id
      Raw.SDL_GetWindowID(@ptr)
    end

    def title
      Raw.SDL_GetWindowTitle(@ptr)
    end

    def title=(value)
      Raw.SDL_SetWindowTitle(@ptr, value)
    end

    def size
      w = FFI::MemoryPointer.new(:int)
      h = FFI::MemoryPointer.new(:int)
      Raw.SDL_GetWindowSize(@ptr, w, h)
      [w.read_int, h.read_int]
    end

    def size=(dimensions)
      Raw.SDL_SetWindowSize(@ptr, dimensions[0], dimensions[1])
    end

    def width
      size[0]
    end

    def height
      size[1]
    end

    def position
      x = FFI::MemoryPointer.new(:int)
      y = FFI::MemoryPointer.new(:int)
      Raw.SDL_GetWindowPosition(@ptr, x, y)
      [x.read_int, y.read_int]
    end

    def position=(coords)
      Raw.SDL_SetWindowPosition(@ptr, coords[0], coords[1])
    end

    def show
      Raw.SDL_ShowWindow(@ptr)
    end

    def hide
      Raw.SDL_HideWindow(@ptr)
    end

    def raise_window
      Raw.SDL_RaiseWindow(@ptr)
    end

    def maximize
      Raw.SDL_MaximizeWindow(@ptr)
    end

    def minimize
      Raw.SDL_MinimizeWindow(@ptr)
    end

    def restore
      Raw.SDL_RestoreWindow(@ptr)
    end

    def fullscreen=(enabled)
      Raw.SDL_SetWindowFullscreen(@ptr, enabled)
    end

    def bordered=(enabled)
      Raw.SDL_SetWindowBordered(@ptr, enabled)
    end

    def resizable=(enabled)
      Raw.SDL_SetWindowResizable(@ptr, enabled)
    end

    def opacity
      Raw.SDL_GetWindowOpacity(@ptr)
    end

    def opacity=(value)
      Raw.SDL_SetWindowOpacity(@ptr, value)
    end

    def surface
      ptr = Raw.SDL_GetWindowSurface(@ptr)
      raise Error, Raw.SDL_GetError if ptr.null?

      Surface.from_ptr(ptr, owned: false)
    end

    def update_surface
      raise Error, Raw.SDL_GetError unless Raw.SDL_UpdateWindowSurface(@ptr)

      true
    end

    def to_ptr
      @ptr
    end
  end
end
