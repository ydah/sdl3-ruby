# frozen_string_literal: true

module SDL3
  module Raw
    SDL_TrayEntryFlags = enum :SDL_TRAYENTRY_BUTTON, 0x00000001,
                              :SDL_TRAYENTRY_CHECKBOX, 0x00000002,
                              :SDL_TRAYENTRY_SUBMENU, 0x00000004,
                              :SDL_TRAYENTRY_DISABLED, 0x80000000,
                              :SDL_TRAYENTRY_CHECKED, 0x40000000

    callback :SDL_TrayCallback, %i[pointer pointer], :void

    begin
      attach_function :SDL_CreateTray, %i[pointer string], :pointer
      attach_function :SDL_CreateTrayWithProperties, [:SDL_PropertiesID], :pointer
      attach_function :SDL_SetTrayIcon, %i[pointer pointer], :void
      attach_function :SDL_SetTrayTooltip, %i[pointer string], :void
      attach_function :SDL_CreateTrayMenu, [:pointer], :pointer
      attach_function :SDL_CreateTraySubmenu, [:pointer], :pointer
      attach_function :SDL_GetTrayMenu, [:pointer], :pointer
      attach_function :SDL_GetTraySubmenu, [:pointer], :pointer
      attach_function :SDL_GetTrayEntries, %i[pointer pointer], :pointer
      attach_function :SDL_RemoveTrayEntry, [:pointer], :void
      attach_function :SDL_InsertTrayEntryAt, %i[pointer int string uint32], :pointer
      attach_function :SDL_SetTrayEntryLabel, %i[pointer string], :void
      attach_function :SDL_GetTrayEntryLabel, [:pointer], :string
      attach_function :SDL_SetTrayEntryChecked, %i[pointer bool], :void
      attach_function :SDL_GetTrayEntryChecked, [:pointer], :bool
      attach_function :SDL_SetTrayEntryEnabled, %i[pointer bool], :void
      attach_function :SDL_GetTrayEntryEnabled, [:pointer], :bool
      attach_function :SDL_SetTrayEntryCallback, [:pointer, :SDL_TrayCallback, :pointer], :void
      attach_function :SDL_ClickTrayEntry, [:pointer], :void
      attach_function :SDL_UpdateTrays, [], :void
      attach_function :SDL_DestroyTray, [:pointer], :void
      attach_function :SDL_GetTrayEntryParent, [:pointer], :pointer
      attach_function :SDL_GetTrayMenuParentEntry, [:pointer], :pointer
      attach_function :SDL_GetTrayMenuParentTray, [:pointer], :pointer
    rescue FFI::NotFoundError
      # Tray API may not be available in all SDL3 versions
    end
  end
end
