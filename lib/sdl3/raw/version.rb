# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_GetVersion, [], :int
    attach_function :SDL_GetRevision, [], :string
  end
end
