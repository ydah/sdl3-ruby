# frozen_string_literal: true

module SDL3
  module Raw
    class SDL_GUID < FFI::Struct
      layout :data, [:uint8, 16]
    end

    attach_function :SDL_GUIDToString, [SDL_GUID, :pointer, :int], :void
    attach_function :SDL_StringToGUID, [:string], SDL_GUID.by_value
  end
end
