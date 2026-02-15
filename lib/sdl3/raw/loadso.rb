# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_LoadObject, [:string], :pointer
    attach_function :SDL_LoadFunction, %i[pointer string], :pointer
    attach_function :SDL_UnloadObject, [:pointer], :void
  end
end
