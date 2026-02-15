# frozen_string_literal: true

module SDL3
  module Raw
    attach_function :SDL_CreateProcess, %i[pointer bool], :pointer
    attach_function :SDL_CreateProcessWithProperties, [:SDL_PropertiesID], :pointer
    attach_function :SDL_GetProcessProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_ReadProcess, %i[pointer pointer pointer], :pointer
    attach_function :SDL_GetProcessInput, [:pointer], :pointer
    attach_function :SDL_GetProcessOutput, [:pointer], :pointer
    attach_function :SDL_KillProcess, %i[pointer bool], :bool
    attach_function :SDL_WaitProcess, %i[pointer bool pointer], :bool
    attach_function :SDL_DestroyProcess, [:pointer], :void
  end
end
