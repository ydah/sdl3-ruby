# frozen_string_literal: true

module SDL3
  module Raw
    class SDL_InitState < FFI::Struct
      layout :status, :int,
             :thread, :uint64,
             :reserved, :pointer
    end

    attach_function :SDL_CreateMutex, [], :pointer
    attach_function :SDL_LockMutex, [:pointer], :void
    attach_function :SDL_TryLockMutex, [:pointer], :bool
    attach_function :SDL_UnlockMutex, [:pointer], :void
    attach_function :SDL_DestroyMutex, [:pointer], :void

    attach_function :SDL_CreateRWLock, [], :pointer
    attach_function :SDL_LockRWLockForReading, [:pointer], :void
    attach_function :SDL_LockRWLockForWriting, [:pointer], :void
    attach_function :SDL_TryLockRWLockForReading, [:pointer], :bool
    attach_function :SDL_TryLockRWLockForWriting, [:pointer], :bool
    attach_function :SDL_UnlockRWLock, [:pointer], :void
    attach_function :SDL_DestroyRWLock, [:pointer], :void

    attach_function :SDL_CreateSemaphore, [:uint32], :pointer
    attach_function :SDL_DestroySemaphore, [:pointer], :void
    attach_function :SDL_WaitSemaphore, [:pointer], :void
    attach_function :SDL_TryWaitSemaphore, [:pointer], :bool
    attach_function :SDL_WaitSemaphoreTimeout, %i[pointer int32], :bool
    attach_function :SDL_SignalSemaphore, [:pointer], :void
    attach_function :SDL_GetSemaphoreValue, [:pointer], :uint32

    attach_function :SDL_CreateCondition, [], :pointer
    attach_function :SDL_DestroyCondition, [:pointer], :void
    attach_function :SDL_SignalCondition, [:pointer], :void
    attach_function :SDL_BroadcastCondition, [:pointer], :void
    attach_function :SDL_WaitCondition, %i[pointer pointer], :void
    attach_function :SDL_WaitConditionTimeout, %i[pointer pointer int32], :bool

    begin
      attach_function :SDL_ShouldInit, [SDL_InitState.ptr], :bool
      attach_function :SDL_ShouldQuit, [SDL_InitState.ptr], :bool
      attach_function :SDL_SetInitialized, [SDL_InitState.ptr, :bool], :void
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
  end
end
