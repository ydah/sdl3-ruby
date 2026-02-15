# frozen_string_literal: true

module SDL3
  module Raw
    SDL_PropertyType = enum :SDL_PROPERTY_TYPE_INVALID, 0,
                            :SDL_PROPERTY_TYPE_POINTER, 1,
                            :SDL_PROPERTY_TYPE_STRING, 2,
                            :SDL_PROPERTY_TYPE_NUMBER, 3,
                            :SDL_PROPERTY_TYPE_FLOAT, 4,
                            :SDL_PROPERTY_TYPE_BOOLEAN, 5

    callback :SDL_CleanupPropertyCallback, %i[pointer pointer], :void
    callback :SDL_EnumeratePropertiesCallback, %i[pointer SDL_PropertiesID string], :void

    attach_function :SDL_GetGlobalProperties, [], :SDL_PropertiesID
    attach_function :SDL_CreateProperties, [], :SDL_PropertiesID
    attach_function :SDL_CopyProperties, %i[SDL_PropertiesID SDL_PropertiesID], :bool
    attach_function :SDL_LockProperties, [:SDL_PropertiesID], :bool
    attach_function :SDL_UnlockProperties, [:SDL_PropertiesID], :void
    attach_function :SDL_SetPointerPropertyWithCleanup,
                    [:SDL_PropertiesID, :string, :pointer, :SDL_CleanupPropertyCallback, :pointer], :bool
    attach_function :SDL_SetPointerProperty, %i[SDL_PropertiesID string pointer], :bool
    attach_function :SDL_SetStringProperty, %i[SDL_PropertiesID string string], :bool
    attach_function :SDL_SetNumberProperty, %i[SDL_PropertiesID string int64], :bool
    attach_function :SDL_SetFloatProperty, %i[SDL_PropertiesID string float], :bool
    attach_function :SDL_SetBooleanProperty, %i[SDL_PropertiesID string bool], :bool
    attach_function :SDL_HasProperty, %i[SDL_PropertiesID string], :bool
    attach_function :SDL_GetPropertyType, %i[SDL_PropertiesID string], SDL_PropertyType
    attach_function :SDL_GetPointerProperty, %i[SDL_PropertiesID string pointer], :pointer
    attach_function :SDL_GetStringProperty, %i[SDL_PropertiesID string string], :string
    attach_function :SDL_GetNumberProperty, %i[SDL_PropertiesID string int64], :int64
    attach_function :SDL_GetFloatProperty, %i[SDL_PropertiesID string float], :float
    attach_function :SDL_GetBooleanProperty, %i[SDL_PropertiesID string bool], :bool
    attach_function :SDL_ClearProperty, %i[SDL_PropertiesID string], :bool
    attach_function :SDL_EnumerateProperties,
                    [:SDL_PropertiesID, :SDL_EnumeratePropertiesCallback, :pointer], :bool
    attach_function :SDL_DestroyProperties, [:SDL_PropertiesID], :void
  end
end
