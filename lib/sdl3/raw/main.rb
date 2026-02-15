# frozen_string_literal: true

module SDL3
  module Raw
    callback :SDL_main_func, %i[int pointer], :int
    callback :SDL_AppInit_func, %i[pointer int pointer], :int
    callback :SDL_AppIterate_func, [:pointer], :int
    callback :SDL_AppEvent_func, %i[pointer pointer], :int
    callback :SDL_AppQuit_func, %i[pointer int], :void

    attach_function :SDL_SetMainReady, [], :void
    attach_function :SDL_RunApp, %i[int pointer SDL_main_func pointer], :int
    attach_function :SDL_EnterAppMainCallbacks, %i[int pointer SDL_AppInit_func SDL_AppIterate_func SDL_AppEvent_func SDL_AppQuit_func], :int

    begin
      attach_function :SDL_RegisterApp, %i[string uint32 pointer], :bool
      attach_function :SDL_UnregisterApp, [], :void
      attach_function :SDL_GDKSuspendComplete, [], :void
    rescue FFI::NotFoundError
      # Platform-specific entry-point hooks may be unavailable.
    end
  end
end
