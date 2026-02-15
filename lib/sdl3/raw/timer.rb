# frozen_string_literal: true

module SDL3
  module Raw
    callback :SDL_TimerCallback, %i[pointer SDL_TimerID uint32], :uint32
    callback :SDL_NSTimerCallback, %i[pointer SDL_TimerID uint64], :uint64

    attach_function :SDL_GetTicks, [], :uint64
    attach_function :SDL_GetTicksNS, [], :uint64
    attach_function :SDL_GetPerformanceCounter, [], :uint64
    attach_function :SDL_GetPerformanceFrequency, [], :uint64
    attach_function :SDL_Delay, [:uint32], :void
    attach_function :SDL_DelayNS, [:uint64], :void
    attach_function :SDL_DelayPrecise, [:uint64], :void
    attach_function :SDL_AddTimer, [:uint32, :SDL_TimerCallback, :pointer], :SDL_TimerID
    attach_function :SDL_AddTimerNS, [:uint64, :SDL_NSTimerCallback, :pointer], :SDL_TimerID
    attach_function :SDL_RemoveTimer, [:SDL_TimerID], :bool
  end
end
