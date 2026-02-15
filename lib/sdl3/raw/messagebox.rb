# frozen_string_literal: true

module SDL3
  module Raw
    SDL_MESSAGEBOX_ERROR = 0x00000010
    SDL_MESSAGEBOX_WARNING = 0x00000020
    SDL_MESSAGEBOX_INFORMATION = 0x00000040
    SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080
    SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100

    SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001
    SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002

    SDL_MESSAGEBOX_COLOR_BACKGROUND = 0
    SDL_MESSAGEBOX_COLOR_TEXT = 1
    SDL_MESSAGEBOX_COLOR_BUTTON_BORDER = 2
    SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3
    SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED = 4
    SDL_MESSAGEBOX_COLOR_COUNT = 5

    class SDL_MessageBoxButtonData < FFI::Struct
      layout :flags, :uint32,
             :buttonID, :int,
             :text, :string
    end

    class SDL_MessageBoxColor < FFI::Struct
      layout :r, :uint8,
             :g, :uint8,
             :b, :uint8
    end

    class SDL_MessageBoxColorScheme < FFI::Struct
      layout :colors, [SDL_MessageBoxColor, SDL_MESSAGEBOX_COLOR_COUNT]
    end

    class SDL_MessageBoxData < FFI::Struct
      layout :flags, :uint32,
             :window, :pointer,
             :title, :string,
             :message, :string,
             :numbuttons, :int,
             :buttons, SDL_MessageBoxButtonData.ptr,
             :colorScheme, SDL_MessageBoxColorScheme.ptr
    end

    attach_function :SDL_ShowMessageBox, [SDL_MessageBoxData.ptr, :pointer], :bool
    attach_function :SDL_ShowSimpleMessageBox, %i[uint32 string string pointer], :bool
  end
end
