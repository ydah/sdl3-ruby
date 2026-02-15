# frozen_string_literal: true

module SDL3
  class Timer
    attr_reader :id

    def initialize(interval_ms, &callback)
      raise ArgumentError, "block required" unless callback

      @callback = callback
      @prevent_gc = proc do |userdata, timer_id, interval|
        @callback.call(timer_id, interval)
      end
      @id = Raw.SDL_AddTimer(interval_ms, @prevent_gc, nil)
      raise Error, Raw.SDL_GetError if @id.zero?
    end

    def self.create(interval_ms, &callback)
      timer = new(interval_ms, &callback)
      return timer unless block_given?

      begin
        yield timer
      ensure
        timer.remove
      end
    end

    def self.create_ns(interval_ns, &callback)
      raise ArgumentError, "block required" unless callback

      timer = allocate
      timer.instance_variable_set(:@callback, callback)
      prevent_gc = proc do |userdata, timer_id, interval|
        callback.call(timer_id, interval)
      end
      timer.instance_variable_set(:@prevent_gc, prevent_gc)
      timer_id = Raw.SDL_AddTimerNS(interval_ns, prevent_gc, nil)
      raise Error, Raw.SDL_GetError if timer_id.zero?

      timer.instance_variable_set(:@id, timer_id)

      return timer unless block_given?

      begin
        yield timer
      ensure
        timer.remove
      end
    end

    def remove
      return false if @id.zero?

      result = Raw.SDL_RemoveTimer(@id)
      @id = 0 if result
      result
    end

    def self.ticks
      Raw.SDL_GetTicks
    end

    def self.ticks_ns
      Raw.SDL_GetTicksNS
    end

    def self.performance_counter
      Raw.SDL_GetPerformanceCounter
    end

    def self.performance_frequency
      Raw.SDL_GetPerformanceFrequency
    end

    def self.delay(ms)
      Raw.SDL_Delay(ms)
    end

    def self.delay_ns(ns)
      Raw.SDL_DelayNS(ns)
    end

    def self.delay_precise(ns)
      Raw.SDL_DelayPrecise(ns)
    end
  end
end
