# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_GetPlatform, [], :string
  end
end
