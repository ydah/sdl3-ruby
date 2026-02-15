# frozen_string_literal: true

module SDL3
  module Raw
    SDL_INIT_AUDIO = 0x00000010
    SDL_INIT_VIDEO = 0x00000020
    SDL_INIT_JOYSTICK = 0x00000200
    SDL_INIT_HAPTIC = 0x00001000
    SDL_INIT_GAMEPAD = 0x00002000
    SDL_INIT_EVENTS = 0x00004000
    SDL_INIT_SENSOR = 0x00008000
    SDL_INIT_CAMERA = 0x00010000

    callback :SDL_MainThreadCallback, %i[pointer], :void

    attach_function :SDL_Init, [:uint32], :bool
    attach_function :SDL_InitSubSystem, [:uint32], :bool
    attach_function :SDL_QuitSubSystem, [:uint32], :void
    attach_function :SDL_WasInit, [:uint32], :uint32
    attach_function :SDL_Quit, [], :void
    attach_function :SDL_IsMainThread, [], :bool
    attach_function :SDL_RunOnMainThread, [:SDL_MainThreadCallback, :pointer, :bool], :bool
    attach_function :SDL_SetAppMetadata, %i[string string string], :bool
    attach_function :SDL_SetAppMetadataProperty, %i[string string], :bool
    attach_function :SDL_GetAppMetadataProperty, [:string], :string
  end
end
