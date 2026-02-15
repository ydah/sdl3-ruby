# frozen_string_literal: true

module SDL3
  module Raw
    typedef :int, :SDL_SpinLock

    class SDL_AtomicInt < FFI::Struct
      layout :value, :int
    end

    class SDL_AtomicU32 < FFI::Struct
      layout :value, :uint32
    end

    attach_function :SDL_TryLockSpinlock, [:pointer], :bool
    attach_function :SDL_LockSpinlock, [:pointer], :void
    attach_function :SDL_UnlockSpinlock, [:pointer], :void

    attach_function :SDL_MemoryBarrierReleaseFunction, [], :void
    attach_function :SDL_MemoryBarrierAcquireFunction, [], :void

    attach_function :SDL_CompareAndSwapAtomicInt, [SDL_AtomicInt.ptr, :int, :int], :bool
    attach_function :SDL_SetAtomicInt, [SDL_AtomicInt.ptr, :int], :int
    attach_function :SDL_GetAtomicInt, [SDL_AtomicInt.ptr], :int
    attach_function :SDL_AddAtomicInt, [SDL_AtomicInt.ptr, :int], :int

    attach_function :SDL_CompareAndSwapAtomicU32, [SDL_AtomicU32.ptr, :uint32, :uint32], :bool
    attach_function :SDL_SetAtomicU32, [SDL_AtomicU32.ptr, :uint32], :uint32
    attach_function :SDL_GetAtomicU32, [SDL_AtomicU32.ptr], :uint32
    begin
      attach_function :SDL_AddAtomicU32, [SDL_AtomicU32.ptr, :int], :uint32
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end

    attach_function :SDL_CompareAndSwapAtomicPointer, %i[pointer pointer pointer], :bool
    attach_function :SDL_SetAtomicPointer, %i[pointer pointer], :pointer
    attach_function :SDL_GetAtomicPointer, [:pointer], :pointer
  end
end
