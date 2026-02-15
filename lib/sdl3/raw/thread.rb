# frozen_string_literal: true

module SDL3
  module Raw
    typedef :uint64, :SDL_ThreadID

    SDL_ThreadPriority = enum :SDL_THREAD_PRIORITY_LOW, 0,
                              :SDL_THREAD_PRIORITY_NORMAL, 1,
                              :SDL_THREAD_PRIORITY_HIGH, 2,
                              :SDL_THREAD_PRIORITY_TIME_CRITICAL, 3

    SDL_ThreadState = enum :SDL_THREAD_UNKNOWN, 0,
                           :SDL_THREAD_ALIVE, 1,
                           :SDL_THREAD_DETACHED, 2,
                           :SDL_THREAD_COMPLETE, 3

    callback :SDL_ThreadFunction, [:pointer], :int
    callback :SDL_TLSDestructorCallback, [:pointer], :void

    begin
      attach_function :SDL_CreateThread, [:SDL_ThreadFunction, :string, :pointer], :pointer
      attach_function :SDL_CreateThreadWithProperties, [:SDL_PropertiesID], :pointer
    rescue FFI::NotFoundError
      # Some SDL builds only export runtime thread creation entry points.
    end

    attach_function :SDL_CreateThreadRuntime, [:SDL_ThreadFunction, :string, :pointer, :pointer, :pointer], :pointer
    attach_function :SDL_CreateThreadWithPropertiesRuntime, [:SDL_PropertiesID, :pointer, :pointer], :pointer
    attach_function :SDL_GetThreadName, [:pointer], :string
    attach_function :SDL_GetCurrentThreadID, [], :SDL_ThreadID
    attach_function :SDL_GetThreadID, [:pointer], :SDL_ThreadID
    attach_function :SDL_SetCurrentThreadPriority, [SDL_ThreadPriority], :bool
    attach_function :SDL_WaitThread, %i[pointer pointer], :void
    attach_function :SDL_GetThreadState, [:pointer], SDL_ThreadState
    attach_function :SDL_DetachThread, [:pointer], :void
    attach_function :SDL_GetTLS, [:pointer], :pointer
    attach_function :SDL_SetTLS, [:pointer, :pointer, :SDL_TLSDestructorCallback], :bool
    attach_function :SDL_CleanupTLS, [], :void
  end
end
