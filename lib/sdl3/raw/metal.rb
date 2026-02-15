# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_Metal_CreateView, [:pointer], :pointer
    attach_function :SDL_Metal_DestroyView, [:pointer], :void
    attach_function :SDL_Metal_GetLayer, [:pointer], :pointer
  end
end
