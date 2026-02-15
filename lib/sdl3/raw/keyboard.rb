# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_HasKeyboard, [], :bool
    attach_function :SDL_GetKeyboards, [:pointer], :pointer
    attach_function :SDL_GetKeyboardNameForID, [:SDL_KeyboardID], :string
    attach_function :SDL_GetKeyboardFocus, [], :pointer
    attach_function :SDL_GetKeyboardState, [:pointer], :pointer
    attach_function :SDL_ResetKeyboard, [], :void
    attach_function :SDL_GetModState, [], :uint16
    attach_function :SDL_SetModState, [:uint16], :void
    attach_function :SDL_GetKeyFromScancode, [:SDL_Scancode, :uint16, :bool], :SDL_Keycode
    attach_function :SDL_GetScancodeFromKey, [:SDL_Keycode, :pointer], :SDL_Scancode
    attach_function :SDL_SetScancodeName, [:SDL_Scancode, :string], :bool
    attach_function :SDL_GetScancodeName, [:SDL_Scancode], :string
    attach_function :SDL_GetScancodeFromName, [:string], :SDL_Scancode
    attach_function :SDL_GetKeyName, [:SDL_Keycode], :string
    attach_function :SDL_GetKeyFromName, [:string], :SDL_Keycode
    attach_function :SDL_StartTextInput, [:pointer], :bool
    attach_function :SDL_StartTextInputWithProperties, [:pointer, :SDL_PropertiesID], :bool
    attach_function :SDL_TextInputActive, [:pointer], :bool
    attach_function :SDL_StopTextInput, [:pointer], :bool
    attach_function :SDL_ClearComposition, [:pointer], :bool
    attach_function :SDL_SetTextInputArea, [:pointer, SDL_Rect.ptr, :int], :bool
    attach_function :SDL_GetTextInputArea, [:pointer, SDL_Rect.ptr, :pointer], :bool
    attach_function :SDL_HasScreenKeyboardSupport, [], :bool
    attach_function :SDL_ScreenKeyboardShown, [:pointer], :bool
  end
end
