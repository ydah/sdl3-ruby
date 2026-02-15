# SDL3 Ruby [![Gem Version](https://badge.fury.io/rb/sdl3.svg)](https://badge.fury.io/rb/sdl3) [![CI](https://github.com/ydah/sdl3-ruby/actions/workflows/ci.yml/badge.svg)](https://github.com/ydah/sdl3-ruby/actions/workflows/ci.yml)

Ruby FFI bindings for [SDL3](https://www.libsdl.org/) (Simple DirectMedia Layer 3).

## Features

- Complete FFI bindings for SDL3
- Two-layer API design:
  - Low-level API (`SDL3::Raw`) - Direct 1:1 mapping to SDL3 C functions
  - High-level API (`SDL3`) - Idiomatic Ruby wrappers with automatic resource management
- No native compilation required (pure FFI)
- Cross-platform support (Linux, macOS, Windows)
- Compatible with CRuby, JRuby, and TruffleRuby

## Requirements

- Ruby >= 3.1.0
- SDL3 library installed on your system

### Installing SDL3

macOS (Homebrew):

```bash
brew install sdl3
```

Ubuntu/Debian:

```bash
# SDL3 may need to be built from source or installed from a PPA
# Check https://github.com/libsdl-org/SDL for instructions
```

Windows:

Download SDL3 from https://github.com/libsdl-org/SDL/releases and add to your PATH.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sdl3'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install sdl3
```

## Usage

### High-Level API

The high-level API provides idiomatic Ruby wrappers with automatic resource management:

```ruby
require 'sdl3'

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Hello SDL3!", 800, 600) do |window|
  SDL3::Renderer.create(window) do |renderer|
    running = true

    while running
      SDL3::Event.each do |event|
        running = false if event.quit?
      end

      renderer.draw_color = [30, 30, 30, 255]
      renderer.clear

      renderer.draw_color = [255, 100, 100, 255]
      renderer.fill_rect(100, 100, 50, 50)

      renderer.present

      SDL3::Raw.SDL_Delay(16)
    end
  end
end

SDL3.quit
```

### Low-Level API

For direct access to SDL3 functions, use the `SDL3::Raw` module:

```ruby
require 'sdl3'

SDL3::Raw.SDL_Init(SDL3::Raw::SDL_INIT_VIDEO)

window = SDL3::Raw.SDL_CreateWindow("Low-level Example", 800, 600, 0)
renderer = SDL3::Raw.SDL_CreateRenderer(window, nil)

# ... your code ...

SDL3::Raw.SDL_DestroyRenderer(renderer)
SDL3::Raw.SDL_DestroyWindow(window)
SDL3::Raw.SDL_Quit
```

### Keyboard and Mouse Input

```ruby
SDL3::Event.each do |event|
  case
  when event.quit?
    running = false
  when event.key_down?
    puts "Key pressed: #{event.key_scancode}"
  when event.mouse_button_down?
    puts "Mouse clicked at: #{event.mouse_x}, #{event.mouse_y}"
  end
end
```

### Gamepad Input

```ruby
SDL3.init(SDL3::INIT_VIDEO | SDL3::INIT_GAMEPAD)

if SDL3::Gamepad.available?
  gamepad_list = SDL3::Gamepad.list

  SDL3::Gamepad.open(gamepad_list.first) do |gamepad|
    puts "Gamepad: #{gamepad.name}"

    left_x = gamepad.axis(:SDL_GAMEPAD_AXIS_LEFTX)
    a_button = gamepad.button?(:SDL_GAMEPAD_BUTTON_SOUTH)

    gamepad.rumble(0xFFFF, 0xFFFF, 500)
  end
end
```

## API Coverage

This gem provides bindings for all SDL3 subsystems:

- Video - Window, display, and OpenGL/Vulkan/Metal context management
- Render - 2D hardware-accelerated rendering
- Audio - Audio playback and recording
- Input - Keyboard, mouse, joystick, gamepad, touch, pen, and sensor
- Events - Event handling
- Haptic - Force feedback
- GPU - Low-level GPU/3D rendering
- Timer - Timer and performance counter
- Filesystem - File and directory operations
- Clipboard - Clipboard access
- Camera - Camera capture
- HID - Human Interface Device access

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.

```bash
git clone https://github.com/ydah/sdl3-ruby.git
cd sdl3-ruby
bundle install
rake test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ydah/sdl3-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## See Also

- [SDL3 Documentation](https://wiki.libsdl.org/SDL3/)
- [SDL3 API Reference](https://wiki.libsdl.org/SDL3/APIByCategory)
- [Ruby FFI](https://github.com/ffi/ffi)
