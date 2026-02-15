# frozen_string_literal: true

module SDL3
  class Event
    attr_reader :raw

    def initialize(raw_event)
      @raw = raw_event
    end

    def type
      @raw[:type]
    end

    def timestamp
      @raw[:common][:timestamp]
    end

    def self.poll
      event = Raw::SDL_Event.new
      return nil unless Raw.SDL_PollEvent(event)

      wrap(event)
    end

    def self.wait(timeout = nil)
      event = Raw::SDL_Event.new
      result = if timeout
                 Raw.SDL_WaitEventTimeout(event, timeout)
               else
                 Raw.SDL_WaitEvent(event)
               end
      return nil unless result

      wrap(event)
    end

    def self.each
      return enum_for(:each) unless block_given?

      while (event = poll)
        yield event
      end
    end

    def self.pump
      Raw.SDL_PumpEvents
    end

    def self.push(event)
      Raw.SDL_PushEvent(event.raw)
    end

    def self.wrap(raw_event)
      case raw_event[:type]
      when Raw::SDL_EVENT_QUIT
        QuitEvent.new(raw_event)
      when Raw::SDL_EVENT_KEY_DOWN, Raw::SDL_EVENT_KEY_UP
        KeyboardEvent.new(raw_event)
      when Raw::SDL_EVENT_MOUSE_MOTION
        MouseMotionEvent.new(raw_event)
      when Raw::SDL_EVENT_MOUSE_BUTTON_DOWN, Raw::SDL_EVENT_MOUSE_BUTTON_UP
        MouseButtonEvent.new(raw_event)
      when Raw::SDL_EVENT_MOUSE_WHEEL
        MouseWheelEvent.new(raw_event)
      when Raw::SDL_EVENT_WINDOW_CLOSE_REQUESTED,
           Raw::SDL_EVENT_WINDOW_RESIZED,
           Raw::SDL_EVENT_WINDOW_MOVED,
           Raw::SDL_EVENT_WINDOW_SHOWN,
           Raw::SDL_EVENT_WINDOW_HIDDEN,
           Raw::SDL_EVENT_WINDOW_EXPOSED,
           Raw::SDL_EVENT_WINDOW_MINIMIZED,
           Raw::SDL_EVENT_WINDOW_MAXIMIZED,
           Raw::SDL_EVENT_WINDOW_RESTORED,
           Raw::SDL_EVENT_WINDOW_FOCUS_GAINED,
           Raw::SDL_EVENT_WINDOW_FOCUS_LOST
        WindowEvent.new(raw_event)
      else
        new(raw_event)
      end
    end

    def quit?
      type == Raw::SDL_EVENT_QUIT
    end

    def key_down?
      type == Raw::SDL_EVENT_KEY_DOWN
    end

    def key_up?
      type == Raw::SDL_EVENT_KEY_UP
    end

    def mouse_motion?
      type == Raw::SDL_EVENT_MOUSE_MOTION
    end

    def mouse_button_down?
      type == Raw::SDL_EVENT_MOUSE_BUTTON_DOWN
    end

    def mouse_button_up?
      type == Raw::SDL_EVENT_MOUSE_BUTTON_UP
    end
  end

  class QuitEvent < Event
  end

  class KeyboardEvent < Event
    def window_id
      @raw[:key][:windowID]
    end

    def scancode
      @raw[:key][:scancode]
    end

    def key
      @raw[:key][:key]
    end

    def mod
      @raw[:key][:mod]
    end

    def down?
      @raw[:key][:down]
    end

    def up?
      !down?
    end

    def repeat?
      @raw[:key][:repeat]
    end
  end

  class MouseMotionEvent < Event
    def window_id
      @raw[:motion][:windowID]
    end

    def x
      @raw[:motion][:x]
    end

    def y
      @raw[:motion][:y]
    end

    def xrel
      @raw[:motion][:xrel]
    end

    def yrel
      @raw[:motion][:yrel]
    end

    def state
      @raw[:motion][:state]
    end
  end

  class MouseButtonEvent < Event
    def window_id
      @raw[:button][:windowID]
    end

    def button
      @raw[:button][:button]
    end

    def down?
      @raw[:button][:down]
    end

    def up?
      !down?
    end

    def clicks
      @raw[:button][:clicks]
    end

    def x
      @raw[:button][:x]
    end

    def y
      @raw[:button][:y]
    end
  end

  class MouseWheelEvent < Event
    def window_id
      @raw[:wheel][:windowID]
    end

    def x
      @raw[:wheel][:x]
    end

    def y
      @raw[:wheel][:y]
    end

    def direction
      @raw[:wheel][:direction]
    end
  end

  class WindowEvent < Event
    def window_id
      @raw[:window][:windowID]
    end

    def data1
      @raw[:window][:data1]
    end

    def data2
      @raw[:window][:data2]
    end

    def close_requested?
      type == Raw::SDL_EVENT_WINDOW_CLOSE_REQUESTED
    end

    def resized?
      type == Raw::SDL_EVENT_WINDOW_RESIZED
    end

    def moved?
      type == Raw::SDL_EVENT_WINDOW_MOVED
    end
  end
end
