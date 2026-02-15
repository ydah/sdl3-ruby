# frozen_string_literal: true

module SDL3
  module Raw
    class SDL_DialogFileFilter < FFI::Struct
      layout :name, :string,
             :pattern, :string
    end

    SDL_FileDialogType = enum :SDL_FILEDIALOG_OPENFILE, 0,
                              :SDL_FILEDIALOG_SAVEFILE, 1,
                              :SDL_FILEDIALOG_OPENFOLDER, 2

    callback :SDL_DialogFileCallback, %i[pointer pointer int], :void

    begin
      attach_function :SDL_ShowOpenFileDialog,
                      [:SDL_DialogFileCallback, :pointer, :pointer, SDL_DialogFileFilter.ptr, :int, :string, :bool],
                      :void
      attach_function :SDL_ShowSaveFileDialog,
                      [:SDL_DialogFileCallback, :pointer, :pointer, SDL_DialogFileFilter.ptr, :int, :string],
                      :void
      attach_function :SDL_ShowOpenFolderDialog,
                      [:SDL_DialogFileCallback, :pointer, :pointer, :string, :bool],
                      :void
      attach_function :SDL_ShowFileDialogWithProperties,
                      [SDL_FileDialogType, :SDL_DialogFileCallback, :pointer, :SDL_PropertiesID],
                      :void
    rescue FFI::NotFoundError
      # Dialog API may not be available in all SDL3 versions
    end
  end
end
