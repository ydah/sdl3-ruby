# frozen_string_literal: true

module SDL3
  module Raw
    SDL_IOStatus = enum :SDL_IO_STATUS_READY, 0,
                        :SDL_IO_STATUS_ERROR, 1,
                        :SDL_IO_STATUS_EOF, 2,
                        :SDL_IO_STATUS_NOT_READY, 3,
                        :SDL_IO_STATUS_READONLY, 4,
                        :SDL_IO_STATUS_WRITEONLY, 5

    SDL_IOWhence = enum :SDL_IO_SEEK_SET, 0,
                        :SDL_IO_SEEK_CUR, 1,
                        :SDL_IO_SEEK_END, 2

    callback :SDL_IOStreamInterfaceSizeCallback, [:pointer], :int64
    callback :SDL_IOStreamInterfaceSeekCallback, %i[pointer int64 int], :int64
    callback :SDL_IOStreamInterfaceReadCallback, %i[pointer pointer size_t pointer], :size_t
    callback :SDL_IOStreamInterfaceWriteCallback, %i[pointer pointer size_t pointer], :size_t
    callback :SDL_IOStreamInterfaceFlushCallback, %i[pointer pointer], :bool
    callback :SDL_IOStreamInterfaceCloseCallback, [:pointer], :bool

    class SDL_IOStreamInterface < FFI::Struct
      layout :version, :uint32,
             :size, :SDL_IOStreamInterfaceSizeCallback,
             :seek, :SDL_IOStreamInterfaceSeekCallback,
             :read, :SDL_IOStreamInterfaceReadCallback,
             :write, :SDL_IOStreamInterfaceWriteCallback,
             :flush, :SDL_IOStreamInterfaceFlushCallback,
             :close, :SDL_IOStreamInterfaceCloseCallback
    end

    attach_function :SDL_IOFromFile, %i[string string], :pointer
    attach_function :SDL_IOFromMem, %i[pointer size_t], :pointer
    attach_function :SDL_IOFromConstMem, %i[pointer size_t], :pointer
    attach_function :SDL_IOFromDynamicMem, [], :pointer
    attach_function :SDL_OpenIO, [SDL_IOStreamInterface.ptr, :pointer], :pointer
    attach_function :SDL_CloseIO, [:pointer], :bool
    attach_function :SDL_GetIOProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetIOStatus, [:pointer], SDL_IOStatus
    attach_function :SDL_GetIOSize, [:pointer], :int64
    attach_function :SDL_SeekIO, [:pointer, :int64, SDL_IOWhence], :int64
    attach_function :SDL_TellIO, [:pointer], :int64
    attach_function :SDL_ReadIO, %i[pointer pointer size_t], :size_t
    attach_function :SDL_WriteIO, %i[pointer pointer size_t], :size_t
    attach_function :SDL_IOprintf, [:pointer, :string, :varargs], :size_t
    begin
      attach_function :SDL_IOvprintf, %i[pointer string pointer], :size_t
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_FlushIO, [:pointer], :bool
    attach_function :SDL_LoadFile_IO, %i[pointer pointer bool], :pointer
    attach_function :SDL_LoadFile, %i[string pointer], :pointer
    attach_function :SDL_SaveFile_IO, %i[pointer pointer size_t bool], :bool
    attach_function :SDL_SaveFile, %i[string pointer size_t], :bool

    attach_function :SDL_ReadU8, %i[pointer pointer], :bool
    attach_function :SDL_ReadS8, %i[pointer pointer], :bool
    attach_function :SDL_ReadU16LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS16LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadU16BE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS16BE, %i[pointer pointer], :bool
    attach_function :SDL_ReadU32LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS32LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadU32BE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS32BE, %i[pointer pointer], :bool
    attach_function :SDL_ReadU64LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS64LE, %i[pointer pointer], :bool
    attach_function :SDL_ReadU64BE, %i[pointer pointer], :bool
    attach_function :SDL_ReadS64BE, %i[pointer pointer], :bool

    attach_function :SDL_WriteU8, %i[pointer uint8], :bool
    attach_function :SDL_WriteS8, %i[pointer int8], :bool
    attach_function :SDL_WriteU16LE, %i[pointer uint16], :bool
    attach_function :SDL_WriteS16LE, %i[pointer int16], :bool
    attach_function :SDL_WriteU16BE, %i[pointer uint16], :bool
    attach_function :SDL_WriteS16BE, %i[pointer int16], :bool
    attach_function :SDL_WriteU32LE, %i[pointer uint32], :bool
    attach_function :SDL_WriteS32LE, %i[pointer int32], :bool
    attach_function :SDL_WriteU32BE, %i[pointer uint32], :bool
    attach_function :SDL_WriteS32BE, %i[pointer int32], :bool
    attach_function :SDL_WriteU64LE, %i[pointer uint64], :bool
    attach_function :SDL_WriteS64LE, %i[pointer int64], :bool
    attach_function :SDL_WriteU64BE, %i[pointer uint64], :bool
    attach_function :SDL_WriteS64BE, %i[pointer int64], :bool
  end
end
