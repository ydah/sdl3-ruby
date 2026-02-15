# frozen_string_literal: true

module SDL3
  module Raw
    SDL_BUTTON_LEFT = 1
    SDL_BUTTON_MIDDLE = 2
    SDL_BUTTON_RIGHT = 3
    SDL_BUTTON_X1 = 4
    SDL_BUTTON_X2 = 5

    SDL_BUTTON_LMASK = 1 << (SDL_BUTTON_LEFT - 1)
    SDL_BUTTON_MMASK = 1 << (SDL_BUTTON_MIDDLE - 1)
    SDL_BUTTON_RMASK = 1 << (SDL_BUTTON_RIGHT - 1)
    SDL_BUTTON_X1MASK = 1 << (SDL_BUTTON_X1 - 1)
    SDL_BUTTON_X2MASK = 1 << (SDL_BUTTON_X2 - 1)

    SDL_SystemCursor = enum :SDL_SYSTEM_CURSOR_DEFAULT, 0,
                            :SDL_SYSTEM_CURSOR_TEXT, 1,
                            :SDL_SYSTEM_CURSOR_WAIT, 2,
                            :SDL_SYSTEM_CURSOR_CROSSHAIR, 3,
                            :SDL_SYSTEM_CURSOR_PROGRESS, 4,
                            :SDL_SYSTEM_CURSOR_NWSE_RESIZE, 5,
                            :SDL_SYSTEM_CURSOR_NESW_RESIZE, 6,
                            :SDL_SYSTEM_CURSOR_EW_RESIZE, 7,
                            :SDL_SYSTEM_CURSOR_NS_RESIZE, 8,
                            :SDL_SYSTEM_CURSOR_MOVE, 9,
                            :SDL_SYSTEM_CURSOR_NOT_ALLOWED, 10,
                            :SDL_SYSTEM_CURSOR_POINTER, 11,
                            :SDL_SYSTEM_CURSOR_NW_RESIZE, 12,
                            :SDL_SYSTEM_CURSOR_N_RESIZE, 13,
                            :SDL_SYSTEM_CURSOR_NE_RESIZE, 14,
                            :SDL_SYSTEM_CURSOR_E_RESIZE, 15,
                            :SDL_SYSTEM_CURSOR_SE_RESIZE, 16,
                            :SDL_SYSTEM_CURSOR_S_RESIZE, 17,
                            :SDL_SYSTEM_CURSOR_SW_RESIZE, 18,
                            :SDL_SYSTEM_CURSOR_W_RESIZE, 19,
                            :SDL_SYSTEM_CURSOR_COUNT, 20

    SDL_MouseWheelDirection = enum :SDL_MOUSEWHEEL_NORMAL, 0,
                                   :SDL_MOUSEWHEEL_FLIPPED, 1

    class SDL_CursorFrameInfo < FFI::Struct
      layout :surface, :pointer,
             :duration, :uint32
    end

    callback :SDL_MouseMotionTransformCallback, %i[pointer uint64 pointer SDL_MouseID pointer pointer], :void

    attach_function :SDL_HasMouse, [], :bool
    attach_function :SDL_GetMice, [:pointer], :pointer
    attach_function :SDL_GetMouseNameForID, [:SDL_MouseID], :string
    attach_function :SDL_GetMouseFocus, [], :pointer
    attach_function :SDL_GetMouseState, %i[pointer pointer], :uint32
    attach_function :SDL_GetGlobalMouseState, %i[pointer pointer], :uint32
    attach_function :SDL_GetRelativeMouseState, %i[pointer pointer], :uint32
    attach_function :SDL_WarpMouseInWindow, %i[pointer float float], :void
    attach_function :SDL_WarpMouseGlobal, %i[float float], :bool
    attach_function :SDL_SetWindowRelativeMouseMode, %i[pointer bool], :bool
    attach_function :SDL_GetWindowRelativeMouseMode, [:pointer], :bool
    attach_function :SDL_CaptureMouse, [:bool], :bool
    attach_function :SDL_CreateCursor, %i[pointer pointer int int int int], :pointer
    attach_function :SDL_CreateColorCursor, [SDL_Surface.ptr, :int, :int], :pointer
    begin
      attach_function :SDL_CreateAnimatedCursor, [SDL_CursorFrameInfo.ptr, :int, :int, :int], :pointer
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_CreateSystemCursor, [SDL_SystemCursor], :pointer
    begin
      attach_function :SDL_SetRelativeMouseTransform, [:SDL_MouseMotionTransformCallback, :pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_SetCursor, [:pointer], :bool
    attach_function :SDL_GetCursor, [], :pointer
    attach_function :SDL_GetDefaultCursor, [], :pointer
    attach_function :SDL_DestroyCursor, [:pointer], :void
    attach_function :SDL_ShowCursor, [], :bool
    attach_function :SDL_HideCursor, [], :bool
    attach_function :SDL_CursorVisible, [], :bool
  end
end
