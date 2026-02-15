# frozen_string_literal: true

module SDL3
  module Raw
    SDL_AsyncIOTaskType = enum :SDL_ASYNCIO_TASK_READ, 0,
                               :SDL_ASYNCIO_TASK_WRITE,
                               :SDL_ASYNCIO_TASK_CLOSE

    SDL_AsyncIOResult = enum :SDL_ASYNCIO_COMPLETE, 0,
                             :SDL_ASYNCIO_FAILURE,
                             :SDL_ASYNCIO_CANCELED

    class SDL_AsyncIOOutcome < FFI::Struct
      layout :asyncio, :pointer,
             :type, SDL_AsyncIOTaskType,
             :result, SDL_AsyncIOResult,
             :buffer, :pointer,
             :offset, :uint64,
             :bytes_requested, :uint64,
             :bytes_transferred, :uint64,
             :userdata, :pointer
    end

    attach_function :SDL_AsyncIOFromFile, %i[string string], :pointer
    attach_function :SDL_GetAsyncIOSize, [:pointer], :int64
    attach_function :SDL_ReadAsyncIO, %i[pointer pointer uint64 uint64 pointer pointer], :bool
    attach_function :SDL_WriteAsyncIO, %i[pointer pointer uint64 uint64 pointer pointer], :bool
    attach_function :SDL_CloseAsyncIO, %i[pointer bool pointer pointer], :bool
    attach_function :SDL_CreateAsyncIOQueue, [], :pointer
    attach_function :SDL_DestroyAsyncIOQueue, [:pointer], :void
    attach_function :SDL_GetAsyncIOResult, [:pointer, SDL_AsyncIOOutcome.ptr], :bool
    attach_function :SDL_WaitAsyncIOResult, [:pointer, SDL_AsyncIOOutcome.ptr, :int32], :bool
    attach_function :SDL_SignalAsyncIOQueue, [:pointer], :void
    attach_function :SDL_LoadFileAsync, %i[string pointer pointer], :bool
  end
end
