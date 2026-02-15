# frozen_string_literal: true

module SDL3
  module Raw
    SDL_LogCategory = enum :SDL_LOG_CATEGORY_APPLICATION, 0,
                           :SDL_LOG_CATEGORY_ERROR, 1,
                           :SDL_LOG_CATEGORY_ASSERT, 2,
                           :SDL_LOG_CATEGORY_SYSTEM, 3,
                           :SDL_LOG_CATEGORY_AUDIO, 4,
                           :SDL_LOG_CATEGORY_VIDEO, 5,
                           :SDL_LOG_CATEGORY_RENDER, 6,
                           :SDL_LOG_CATEGORY_INPUT, 7,
                           :SDL_LOG_CATEGORY_TEST, 8,
                           :SDL_LOG_CATEGORY_GPU, 9,
                           :SDL_LOG_CATEGORY_RESERVED2, 10,
                           :SDL_LOG_CATEGORY_RESERVED3, 11,
                           :SDL_LOG_CATEGORY_RESERVED4, 12,
                           :SDL_LOG_CATEGORY_RESERVED5, 13,
                           :SDL_LOG_CATEGORY_RESERVED6, 14,
                           :SDL_LOG_CATEGORY_RESERVED7, 15,
                           :SDL_LOG_CATEGORY_RESERVED8, 16,
                           :SDL_LOG_CATEGORY_RESERVED9, 17,
                           :SDL_LOG_CATEGORY_RESERVED10, 18,
                           :SDL_LOG_CATEGORY_CUSTOM, 19

    SDL_LogPriority = enum :SDL_LOG_PRIORITY_INVALID, 0,
                           :SDL_LOG_PRIORITY_TRACE, 1,
                           :SDL_LOG_PRIORITY_VERBOSE, 2,
                           :SDL_LOG_PRIORITY_DEBUG, 3,
                           :SDL_LOG_PRIORITY_INFO, 4,
                           :SDL_LOG_PRIORITY_WARN, 5,
                           :SDL_LOG_PRIORITY_ERROR, 6,
                           :SDL_LOG_PRIORITY_CRITICAL, 7,
                           :SDL_LOG_PRIORITY_COUNT, 8

    callback :SDL_LogOutputFunction, %i[pointer int int string], :void

    attach_function :SDL_SetLogPriorities, [SDL_LogPriority], :void
    attach_function :SDL_SetLogPriority, [SDL_LogCategory, SDL_LogPriority], :void
    attach_function :SDL_GetLogPriority, [SDL_LogCategory], SDL_LogPriority
    attach_function :SDL_ResetLogPriorities, [], :void
    attach_function :SDL_SetLogPriorityPrefix, [SDL_LogPriority, :string], :bool
    attach_function :SDL_Log, [:string, :varargs], :void
    attach_function :SDL_LogTrace, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogVerbose, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogDebug, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogInfo, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogWarn, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogError, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogCritical, [SDL_LogCategory, :string, :varargs], :void
    attach_function :SDL_LogMessage, [SDL_LogCategory, SDL_LogPriority, :string, :varargs], :void
    begin
      attach_function :SDL_LogMessageV, [:int, SDL_LogPriority, :string, :pointer], :void
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetDefaultLogOutputFunction, [], :pointer
    attach_function :SDL_GetLogOutputFunction, %i[pointer pointer], :void
    attach_function :SDL_SetLogOutputFunction, [:SDL_LogOutputFunction, :pointer], :void
  end
end
