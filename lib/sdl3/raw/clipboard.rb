# frozen_string_literal: true

module SDL3
  module Raw
    callback :SDL_ClipboardDataCallback, %i[pointer string pointer], :pointer
    callback :SDL_ClipboardCleanupCallback, [:pointer], :void

    attach_function :SDL_SetClipboardText, [:string], :bool
    attach_function :SDL_GetClipboardText, [], :string
    attach_function :SDL_HasClipboardText, [], :bool
    attach_function :SDL_SetPrimarySelectionText, [:string], :bool
    attach_function :SDL_GetPrimarySelectionText, [], :string
    attach_function :SDL_HasPrimarySelectionText, [], :bool
    attach_function :SDL_SetClipboardData, [:SDL_ClipboardDataCallback, :SDL_ClipboardCleanupCallback, :pointer, :pointer, :size_t], :bool
    attach_function :SDL_ClearClipboardData, [], :bool
    attach_function :SDL_GetClipboardData, %i[string pointer], :pointer
    attach_function :SDL_HasClipboardData, [:string], :bool
    attach_function :SDL_GetClipboardMimeTypes, [:pointer], :pointer
  end
end
