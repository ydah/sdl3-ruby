# frozen_string_literal: true

module SDL3
  module Raw
    typedef :int64, :SDL_Time

    SDL_DateFormat = enum :SDL_DATE_FORMAT_YYYYMMDD, 0,
                          :SDL_DATE_FORMAT_DDMMYYYY, 1,
                          :SDL_DATE_FORMAT_MMDDYYYY, 2

    SDL_TimeFormat = enum :SDL_TIME_FORMAT_24HR, 0,
                          :SDL_TIME_FORMAT_12HR, 1

    class SDL_DateTime < FFI::Struct
      layout :year, :int,
             :month, :int,
             :day, :int,
             :hour, :int,
             :minute, :int,
             :second, :int,
             :nanosecond, :int,
             :day_of_week, :int,
             :utc_offset, :int
    end

    attach_function :SDL_GetDateTimeLocalePreferences, %i[pointer pointer], :bool
    attach_function :SDL_GetCurrentTime, [:pointer], :bool
    attach_function :SDL_TimeToDateTime, [:SDL_Time, SDL_DateTime.ptr, :bool], :bool
    attach_function :SDL_DateTimeToTime, [SDL_DateTime.ptr, :pointer], :bool
    attach_function :SDL_TimeToWindows, [:SDL_Time, :pointer, :pointer], :void
    attach_function :SDL_TimeFromWindows, %i[uint32 uint32], :SDL_Time
    attach_function :SDL_GetDaysInMonth, %i[int int], :int
    attach_function :SDL_GetDayOfYear, %i[int int int], :int
    attach_function :SDL_GetDayOfWeek, %i[int int int], :int
  end
end
