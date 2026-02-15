# frozen_string_literal: true

module SDL3
  module Raw
    SDL_AssertState = enum :SDL_AssertState, [
      :SDL_ASSERTION_RETRY, 0,
      :SDL_ASSERTION_BREAK, 1,
      :SDL_ASSERTION_ABORT, 2,
      :SDL_ASSERTION_IGNORE, 3,
      :SDL_ASSERTION_ALWAYS_IGNORE, 4
    ]

    class SDL_AssertData < FFI::Struct
      layout :always_ignore, :bool,
             :trigger_count, :uint,
             :condition, :string,
             :filename, :string,
             :linenum, :int,
             :function, :string,
             :next, :pointer
    end

    callback :SDL_AssertionHandler, [:pointer, :pointer], :SDL_AssertState

    attach_function :SDL_ReportAssertion, [:pointer, :string, :string, :int], :SDL_AssertState
    attach_function :SDL_SetAssertionHandler, [:SDL_AssertionHandler, :pointer], :void
    attach_function :SDL_GetDefaultAssertionHandler, [], :SDL_AssertionHandler
    attach_function :SDL_GetAssertionHandler, [:pointer], :SDL_AssertionHandler
    attach_function :SDL_GetAssertionReport, [], :pointer
    attach_function :SDL_ResetAssertionReport, [], :void
  end
end
