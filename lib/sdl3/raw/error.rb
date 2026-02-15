# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_SetError, [:string], :bool
    begin
      attach_function :SDL_SetErrorV, [:string, :pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_OutOfMemory, [], :bool
    attach_function :SDL_GetError, [], :string
    attach_function :SDL_ClearError, [], :bool
  end
end
