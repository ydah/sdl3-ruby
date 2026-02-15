# frozen_string_literal: true

module SDL3
  module Raw
    SDL_HintPriority = enum :SDL_HINT_DEFAULT, 0,
                            :SDL_HINT_NORMAL, 1,
                            :SDL_HINT_OVERRIDE, 2

    callback :SDL_HintCallback, %i[pointer string string string], :void

    attach_function :SDL_SetHintWithPriority, [:string, :string, SDL_HintPriority], :bool
    attach_function :SDL_SetHint, %i[string string], :bool
    attach_function :SDL_ResetHint, [:string], :bool
    attach_function :SDL_ResetHints, [], :void
    attach_function :SDL_GetHint, [:string], :string
    attach_function :SDL_GetHintBoolean, [:string, :bool], :bool
    attach_function :SDL_AddHintCallback, [:string, :SDL_HintCallback, :pointer], :bool
    attach_function :SDL_RemoveHintCallback, [:string, :SDL_HintCallback, :pointer], :void
  end
end
