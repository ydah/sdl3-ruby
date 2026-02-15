# frozen_string_literal: true

module SDL3
  module Raw
    callback :SDL_StorageInterfaceCloseCallback, [:pointer], :bool
    callback :SDL_StorageInterfaceReadyCallback, [:pointer], :bool
    callback :SDL_StorageInterfaceEnumerateCallback, [:pointer, :string, :SDL_EnumerateDirectoryCallback, :pointer], :bool
    callback :SDL_StorageInterfaceInfoCallback, [:pointer, :string, SDL_PathInfo.ptr], :bool
    callback :SDL_StorageInterfaceReadFileCallback, %i[pointer string pointer uint64], :bool
    callback :SDL_StorageInterfaceWriteFileCallback, %i[pointer string pointer uint64], :bool
    callback :SDL_StorageInterfaceMkdirCallback, %i[pointer string], :bool
    callback :SDL_StorageInterfaceRemoveCallback, %i[pointer string], :bool
    callback :SDL_StorageInterfaceRenameCallback, %i[pointer string string], :bool
    callback :SDL_StorageInterfaceCopyCallback, %i[pointer string string], :bool
    callback :SDL_StorageInterfaceSpaceRemainingCallback, [:pointer], :uint64

    class SDL_StorageInterface < FFI::Struct
      layout :version, :uint32,
             :close, :SDL_StorageInterfaceCloseCallback,
             :ready, :SDL_StorageInterfaceReadyCallback,
             :enumerate, :SDL_StorageInterfaceEnumerateCallback,
             :info, :SDL_StorageInterfaceInfoCallback,
             :read_file, :SDL_StorageInterfaceReadFileCallback,
             :write_file, :SDL_StorageInterfaceWriteFileCallback,
             :mkdir, :SDL_StorageInterfaceMkdirCallback,
             :remove, :SDL_StorageInterfaceRemoveCallback,
             :rename, :SDL_StorageInterfaceRenameCallback,
             :copy, :SDL_StorageInterfaceCopyCallback,
             :space_remaining, :SDL_StorageInterfaceSpaceRemainingCallback
    end

    attach_function :SDL_OpenTitleStorage, %i[string SDL_PropertiesID], :pointer
    attach_function :SDL_OpenUserStorage, %i[string string SDL_PropertiesID], :pointer
    attach_function :SDL_OpenFileStorage, [:string], :pointer
    attach_function :SDL_OpenStorage, [SDL_StorageInterface.ptr, :pointer], :pointer
    attach_function :SDL_CloseStorage, [:pointer], :bool
    attach_function :SDL_StorageReady, [:pointer], :bool
    attach_function :SDL_GetStorageFileSize, %i[pointer string pointer], :bool
    attach_function :SDL_ReadStorageFile, %i[pointer string pointer uint64], :bool
    attach_function :SDL_WriteStorageFile, %i[pointer string pointer uint64], :bool
    attach_function :SDL_CreateStorageDirectory, %i[pointer string], :bool
    attach_function :SDL_EnumerateStorageDirectory, [:pointer, :string, :SDL_EnumerateDirectoryCallback, :pointer], :bool
    attach_function :SDL_RemoveStoragePath, %i[pointer string], :bool
    attach_function :SDL_RenameStoragePath, %i[pointer string string], :bool
    attach_function :SDL_CopyStorageFile, %i[pointer string string], :bool
    attach_function :SDL_GetStoragePathInfo, [:pointer, :string, SDL_PathInfo.ptr], :bool
    attach_function :SDL_GetStorageSpaceRemaining, [:pointer], :uint64
    attach_function :SDL_GlobStorageDirectory, %i[pointer string string uint32 pointer], :pointer
  end
end
