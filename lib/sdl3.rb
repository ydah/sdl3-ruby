# frozen_string_literal: true

require_relative "sdl3/version"
require_relative "sdl3/raw/base"
require_relative "sdl3/raw/types"
require_relative "sdl3/raw/stdinc"
require_relative "sdl3/raw/assert"
require_relative "sdl3/raw/bits"
require_relative "sdl3/raw/guid"
require_relative "sdl3/raw/init"
require_relative "sdl3/raw/main"
require_relative "sdl3/raw/error"
require_relative "sdl3/raw/rect"
require_relative "sdl3/raw/pixels"
require_relative "sdl3/raw/blendmode"
require_relative "sdl3/raw/hints"
require_relative "sdl3/raw/log"
require_relative "sdl3/raw/properties"
require_relative "sdl3/raw/video"
require_relative "sdl3/raw/surface"
require_relative "sdl3/raw/render"
require_relative "sdl3/raw/scancode"
require_relative "sdl3/raw/keycode"
require_relative "sdl3/raw/keyboard"
require_relative "sdl3/raw/mouse"
require_relative "sdl3/raw/joystick"
require_relative "sdl3/raw/gamepad"
require_relative "sdl3/raw/touch"
require_relative "sdl3/raw/pen"
require_relative "sdl3/raw/sensor"
require_relative "sdl3/raw/events"
require_relative "sdl3/raw/audio"
require_relative "sdl3/raw/haptic"
require_relative "sdl3/raw/timer"
require_relative "sdl3/raw/filesystem"
require_relative "sdl3/raw/clipboard"
require_relative "sdl3/raw/cpuinfo"
require_relative "sdl3/raw/endian"
require_relative "sdl3/raw/power"
require_relative "sdl3/raw/messagebox"
require_relative "sdl3/raw/locale"
require_relative "sdl3/raw/misc"
require_relative "sdl3/raw/platform"
require_relative "sdl3/raw/system"
require_relative "sdl3/raw/iostream"
require_relative "sdl3/raw/time"
require_relative "sdl3/raw/dialog"
require_relative "sdl3/raw/loadso"
require_relative "sdl3/raw/version"
require_relative "sdl3/raw/thread"
require_relative "sdl3/raw/mutex"
require_relative "sdl3/raw/atomic"
require_relative "sdl3/raw/camera"
require_relative "sdl3/raw/asyncio"
require_relative "sdl3/raw/vulkan"
require_relative "sdl3/raw/metal"
require_relative "sdl3/raw/storage"
require_relative "sdl3/raw/process"
require_relative "sdl3/raw/tray"
require_relative "sdl3/raw/gpu"
require_relative "sdl3/raw/openxr"
require_relative "sdl3/raw/hidapi"

require_relative "sdl3/high_level/surface"
require_relative "sdl3/high_level/window"
require_relative "sdl3/high_level/renderer"
require_relative "sdl3/high_level/texture"
require_relative "sdl3/high_level/event"
require_relative "sdl3/high_level/audio_device"
require_relative "sdl3/high_level/joystick"
require_relative "sdl3/high_level/gamepad"
require_relative "sdl3/high_level/haptic"
require_relative "sdl3/high_level/camera"
require_relative "sdl3/high_level/timer"
require_relative "sdl3/high_level/clipboard"
require_relative "sdl3/high_level/gpu"
require_relative "sdl3/high_level/sensor"

module SDL3
  class Error < StandardError; end
  class InitError < Error; end
  class WindowError < Error; end
  class RendererError < Error; end
  class AudioError < Error; end

  INIT_AUDIO = Raw::SDL_INIT_AUDIO
  INIT_VIDEO = Raw::SDL_INIT_VIDEO
  INIT_JOYSTICK = Raw::SDL_INIT_JOYSTICK
  INIT_HAPTIC = Raw::SDL_INIT_HAPTIC
  INIT_GAMEPAD = Raw::SDL_INIT_GAMEPAD
  INIT_EVENTS = Raw::SDL_INIT_EVENTS
  INIT_SENSOR = Raw::SDL_INIT_SENSOR
  INIT_CAMERA = Raw::SDL_INIT_CAMERA

  class << self
    def init(flags)
      raise InitError, Raw.SDL_GetError unless Raw.SDL_Init(flags)

      true
    end

    def init_sub_system(flags)
      raise InitError, Raw.SDL_GetError unless Raw.SDL_InitSubSystem(flags)

      true
    end

    def quit_sub_system(flags)
      Raw.SDL_QuitSubSystem(flags)
    end

    def was_init(flags)
      Raw.SDL_WasInit(flags)
    end

    def quit
      Raw.SDL_Quit
    end

    def error
      Raw.SDL_GetError
    end

    def clear_error
      Raw.SDL_ClearError
    end
  end
end
