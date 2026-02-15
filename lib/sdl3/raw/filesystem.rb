# frozen_string_literal: true

module SDL3
  module Raw
    SDL_Folder = enum :SDL_FOLDER_HOME, 0,
                      :SDL_FOLDER_DESKTOP, 1,
                      :SDL_FOLDER_DOCUMENTS, 2,
                      :SDL_FOLDER_DOWNLOADS, 3,
                      :SDL_FOLDER_MUSIC, 4,
                      :SDL_FOLDER_PICTURES, 5,
                      :SDL_FOLDER_PUBLICSHARE, 6,
                      :SDL_FOLDER_SAVEDGAMES, 7,
                      :SDL_FOLDER_SCREENSHOTS, 8,
                      :SDL_FOLDER_TEMPLATES, 9,
                      :SDL_FOLDER_VIDEOS, 10,
                      :SDL_FOLDER_COUNT, 11

    SDL_PathType = enum :SDL_PATHTYPE_NONE, 0,
                        :SDL_PATHTYPE_FILE, 1,
                        :SDL_PATHTYPE_DIRECTORY, 2,
                        :SDL_PATHTYPE_OTHER, 3

    SDL_GLOB_CASEINSENSITIVE = 1 << 0

    class SDL_PathInfo < FFI::Struct
      layout :type, SDL_PathType,
             :size, :uint64,
             :create_time, :int64,
             :modify_time, :int64,
             :access_time, :int64
    end

    callback :SDL_EnumerateDirectoryCallback, %i[pointer string string], :int

    attach_function :SDL_GetBasePath, [], :string
    attach_function :SDL_GetPrefPath, %i[string string], :string
    attach_function :SDL_GetUserFolder, [SDL_Folder], :string
    attach_function :SDL_CreateDirectory, [:string], :bool
    attach_function :SDL_EnumerateDirectory, [:string, :SDL_EnumerateDirectoryCallback, :pointer], :bool
    attach_function :SDL_RemovePath, [:string], :bool
    attach_function :SDL_RenamePath, %i[string string], :bool
    attach_function :SDL_CopyFile, %i[string string], :bool
    attach_function :SDL_GetPathInfo, [:string, SDL_PathInfo.ptr], :bool
    attach_function :SDL_GlobDirectory, %i[string string uint32 pointer], :pointer
    attach_function :SDL_GetCurrentDirectory, [], :string
  end
end
