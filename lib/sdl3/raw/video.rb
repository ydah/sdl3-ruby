# frozen_string_literal: true

module SDL3
  module Raw
    typedef :uint32, :SDL_DisplayID

    SDL_SystemTheme = enum :SDL_SYSTEM_THEME_UNKNOWN, 0,
                           :SDL_SYSTEM_THEME_LIGHT, 1,
                           :SDL_SYSTEM_THEME_DARK, 2

    SDL_DisplayOrientation = enum :SDL_ORIENTATION_UNKNOWN, 0,
                                  :SDL_ORIENTATION_LANDSCAPE, 1,
                                  :SDL_ORIENTATION_LANDSCAPE_FLIPPED, 2,
                                  :SDL_ORIENTATION_PORTRAIT, 3,
                                  :SDL_ORIENTATION_PORTRAIT_FLIPPED, 4

    SDL_ProgressState = enum :SDL_PROGRESS_STATE_INVALID, -1,
                             :SDL_PROGRESS_STATE_NONE, 0,
                             :SDL_PROGRESS_STATE_INDETERMINATE, 1,
                             :SDL_PROGRESS_STATE_NORMAL, 2,
                             :SDL_PROGRESS_STATE_PAUSED, 3,
                             :SDL_PROGRESS_STATE_ERROR, 4

    SDL_WINDOW_FULLSCREEN = 0x0000000000000001
    SDL_WINDOW_OPENGL = 0x0000000000000002
    SDL_WINDOW_OCCLUDED = 0x0000000000000004
    SDL_WINDOW_HIDDEN = 0x0000000000000008
    SDL_WINDOW_BORDERLESS = 0x0000000000000010
    SDL_WINDOW_RESIZABLE = 0x0000000000000020
    SDL_WINDOW_MINIMIZED = 0x0000000000000040
    SDL_WINDOW_MAXIMIZED = 0x0000000000000080
    SDL_WINDOW_MOUSE_GRABBED = 0x0000000000000100
    SDL_WINDOW_INPUT_FOCUS = 0x0000000000000200
    SDL_WINDOW_MOUSE_FOCUS = 0x0000000000000400
    SDL_WINDOW_EXTERNAL = 0x0000000000000800
    SDL_WINDOW_MODAL = 0x0000000000001000
    SDL_WINDOW_HIGH_PIXEL_DENSITY = 0x0000000000002000
    SDL_WINDOW_MOUSE_CAPTURE = 0x0000000000004000
    SDL_WINDOW_MOUSE_RELATIVE_MODE = 0x0000000000008000
    SDL_WINDOW_ALWAYS_ON_TOP = 0x0000000000010000
    SDL_WINDOW_UTILITY = 0x0000000000020000
    SDL_WINDOW_TOOLTIP = 0x0000000000040000
    SDL_WINDOW_POPUP_MENU = 0x0000000000080000
    SDL_WINDOW_KEYBOARD_GRABBED = 0x0000000000100000
    SDL_WINDOW_VULKAN = 0x0000000010000000
    SDL_WINDOW_METAL = 0x0000000020000000
    SDL_WINDOW_TRANSPARENT = 0x0000000040000000
    SDL_WINDOW_NOT_FOCUSABLE = 0x0000000080000000

    SDL_FlashOperation = enum :SDL_FLASH_CANCEL, 0,
                              :SDL_FLASH_BRIEFLY, 1,
                              :SDL_FLASH_UNTIL_FOCUSED, 2

    class SDL_DisplayMode < FFI::Struct
      layout :displayID, :SDL_DisplayID,
             :format, :uint32,
             :w, :int,
             :h, :int,
             :pixel_density, :float,
             :refresh_rate, :float,
             :refresh_rate_numerator, :int,
             :refresh_rate_denominator, :int,
             :internal, :pointer
    end

    attach_function :SDL_GetNumVideoDrivers, [], :int
    attach_function :SDL_GetVideoDriver, [:int], :string
    attach_function :SDL_GetCurrentVideoDriver, [], :string
    attach_function :SDL_GetSystemTheme, [], SDL_SystemTheme
    attach_function :SDL_GetDisplays, [:pointer], :pointer
    attach_function :SDL_GetPrimaryDisplay, [], :SDL_DisplayID
    attach_function :SDL_GetDisplayProperties, [:SDL_DisplayID], :SDL_PropertiesID
    attach_function :SDL_GetDisplayName, [:SDL_DisplayID], :string
    attach_function :SDL_GetDisplayBounds, [:SDL_DisplayID, SDL_Rect.ptr], :bool
    attach_function :SDL_GetDisplayUsableBounds, [:SDL_DisplayID, SDL_Rect.ptr], :bool
    begin
      attach_function :SDL_GetNaturalDisplayOrientation, [:SDL_DisplayID], SDL_DisplayOrientation
      attach_function :SDL_GetCurrentDisplayOrientation, [:SDL_DisplayID], SDL_DisplayOrientation
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetDisplayContentScale, [:SDL_DisplayID], :float
    attach_function :SDL_GetFullscreenDisplayModes, [:SDL_DisplayID, :pointer], :pointer
    attach_function :SDL_GetClosestFullscreenDisplayMode, [:SDL_DisplayID, :int, :int, :float, :bool, SDL_DisplayMode.ptr], :bool
    attach_function :SDL_GetDesktopDisplayMode, [:SDL_DisplayID], SDL_DisplayMode.ptr
    attach_function :SDL_GetCurrentDisplayMode, [:SDL_DisplayID], SDL_DisplayMode.ptr
    begin
      attach_function :SDL_GetDisplayForPoint, [SDL_Point.ptr], :SDL_DisplayID
      attach_function :SDL_GetDisplayForRect, [SDL_Rect.ptr], :SDL_DisplayID
      attach_function :SDL_GetDisplayForWindow, [:pointer], :SDL_DisplayID
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end

    attach_function :SDL_CreateWindow, [:string, :int, :int, :uint64], :pointer
    attach_function :SDL_CreatePopupWindow, [:pointer, :int, :int, :int, :int, :uint64], :pointer
    attach_function :SDL_CreateWindowWithProperties, [:SDL_PropertiesID], :pointer
    attach_function :SDL_GetWindowID, [:pointer], :SDL_WindowID
    attach_function :SDL_GetWindowFromID, [:SDL_WindowID], :pointer
    attach_function :SDL_GetWindowParent, [:pointer], :pointer
    attach_function :SDL_GetWindowProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetWindowFlags, [:pointer], :uint64
    attach_function :SDL_SetWindowTitle, %i[pointer string], :bool
    attach_function :SDL_GetWindowTitle, [:pointer], :string
    attach_function :SDL_SetWindowIcon, %i[pointer pointer], :bool
    attach_function :SDL_SetWindowPosition, %i[pointer int int], :bool
    attach_function :SDL_GetWindowPosition, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetWindowSize, %i[pointer int int], :bool
    attach_function :SDL_GetWindowSize, %i[pointer pointer pointer], :bool
    begin
      attach_function :SDL_GetWindowPixelDensity, [:pointer], :float
      attach_function :SDL_GetWindowDisplayScale, [:pointer], :float
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetWindowSafeArea, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_SetWindowAspectRatio, %i[pointer float float], :bool
    attach_function :SDL_GetWindowAspectRatio, %i[pointer pointer pointer], :bool
    attach_function :SDL_GetWindowBordersSize, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_GetWindowSizeInPixels, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetWindowMinimumSize, %i[pointer int int], :bool
    attach_function :SDL_GetWindowMinimumSize, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetWindowMaximumSize, %i[pointer int int], :bool
    attach_function :SDL_GetWindowMaximumSize, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetWindowBordered, %i[pointer bool], :bool
    attach_function :SDL_SetWindowResizable, %i[pointer bool], :bool
    attach_function :SDL_SetWindowAlwaysOnTop, %i[pointer bool], :bool
    attach_function :SDL_ShowWindow, [:pointer], :bool
    attach_function :SDL_HideWindow, [:pointer], :bool
    attach_function :SDL_RaiseWindow, [:pointer], :bool
    attach_function :SDL_MaximizeWindow, [:pointer], :bool
    attach_function :SDL_MinimizeWindow, [:pointer], :bool
    attach_function :SDL_RestoreWindow, [:pointer], :bool
    attach_function :SDL_SetWindowFullscreen, %i[pointer bool], :bool
    begin
      attach_function :SDL_SetWindowFullscreenMode, [:pointer, SDL_DisplayMode.ptr], :bool
      attach_function :SDL_GetWindowFullscreenMode, [:pointer], SDL_DisplayMode.ptr
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_SyncWindow, [:pointer], :bool
    attach_function :SDL_WindowHasSurface, [:pointer], :bool
    attach_function :SDL_GetWindowSurface, [:pointer], :pointer
    attach_function :SDL_SetWindowSurfaceVSync, %i[pointer int], :bool
    attach_function :SDL_GetWindowSurfaceVSync, %i[pointer pointer], :bool
    attach_function :SDL_UpdateWindowSurface, [:pointer], :bool
    attach_function :SDL_UpdateWindowSurfaceRects, [:pointer, SDL_Rect.ptr, :int], :bool
    attach_function :SDL_DestroyWindowSurface, [:pointer], :bool
    attach_function :SDL_SetWindowKeyboardGrab, %i[pointer bool], :bool
    attach_function :SDL_SetWindowMouseGrab, %i[pointer bool], :bool
    attach_function :SDL_GetWindowKeyboardGrab, [:pointer], :bool
    attach_function :SDL_GetWindowMouseGrab, [:pointer], :bool
    attach_function :SDL_GetGrabbedWindow, [], :pointer
    attach_function :SDL_SetWindowMouseRect, [:pointer, SDL_Rect.ptr], :bool
    attach_function :SDL_GetWindowMouseRect, [:pointer], SDL_Rect.ptr
    attach_function :SDL_SetWindowOpacity, %i[pointer float], :bool
    attach_function :SDL_GetWindowOpacity, [:pointer], :float
    attach_function :SDL_SetWindowParent, %i[pointer pointer], :bool
    attach_function :SDL_SetWindowModal, %i[pointer bool], :bool
    attach_function :SDL_SetWindowFocusable, %i[pointer bool], :bool
    begin
      attach_function :SDL_SetWindowFillDocument, %i[pointer bool], :bool
      attach_function :SDL_GetWindowICCProfile, %i[pointer pointer], :pointer
      attach_function :SDL_GetWindowPixelFormat, [:pointer], :uint32
      attach_function :SDL_GetWindows, [:pointer], :pointer
      attach_function :SDL_SetWindowHitTest, %i[pointer pointer pointer], :bool
      attach_function :SDL_SetWindowShape, %i[pointer pointer], :bool
      attach_function :SDL_SetWindowProgressState, [:pointer, SDL_ProgressState], :bool
      attach_function :SDL_GetWindowProgressState, [:pointer], SDL_ProgressState
      attach_function :SDL_SetWindowProgressValue, %i[pointer float], :bool
      attach_function :SDL_GetWindowProgressValue, [:pointer], :float
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_ShowWindowSystemMenu, %i[pointer int int], :bool
    attach_function :SDL_FlashWindow, [:pointer, SDL_FlashOperation], :bool
    attach_function :SDL_DestroyWindow, [:pointer], :void
    attach_function :SDL_ScreenSaverEnabled, [], :bool
    attach_function :SDL_EnableScreenSaver, [], :bool
    attach_function :SDL_DisableScreenSaver, [], :bool

    attach_function :SDL_GL_LoadLibrary, [:string], :bool
    attach_function :SDL_GL_GetProcAddress, [:string], :pointer
    attach_function :SDL_GL_UnloadLibrary, [], :void
    attach_function :SDL_GL_ExtensionSupported, [:string], :bool
    attach_function :SDL_GL_ResetAttributes, [], :void
    attach_function :SDL_GL_SetAttribute, %i[int int], :bool
    attach_function :SDL_GL_GetAttribute, %i[int pointer], :bool
    attach_function :SDL_GL_CreateContext, [:pointer], :pointer
    attach_function :SDL_GL_MakeCurrent, %i[pointer pointer], :bool
    attach_function :SDL_GL_GetCurrentWindow, [], :pointer
    attach_function :SDL_GL_GetCurrentContext, [], :pointer
    attach_function :SDL_GL_SetSwapInterval, [:int], :bool
    attach_function :SDL_GL_GetSwapInterval, [:pointer], :bool
    attach_function :SDL_GL_SwapWindow, [:pointer], :bool
    attach_function :SDL_GL_DestroyContext, [:pointer], :bool

    begin
      attach_function :SDL_EGL_GetProcAddress, [:string], :pointer
      attach_function :SDL_EGL_GetCurrentDisplay, [], :pointer
      attach_function :SDL_EGL_GetCurrentConfig, [], :pointer
      attach_function :SDL_EGL_GetWindowSurface, [:pointer], :pointer
      attach_function :SDL_EGL_SetAttributeCallbacks, %i[pointer pointer pointer pointer], :void
    rescue FFI::NotFoundError
      # EGL entry points can be unavailable depending on SDL build options.
    end
  end
end
