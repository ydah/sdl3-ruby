# frozen_string_literal: true

module SDL3
  module Raw
    class SDL_Locale < FFI::Struct
      layout :language, :string,
             :country, :string
    end

    attach_function :SDL_GetPreferredLocales, [:pointer], :pointer
  end
end
