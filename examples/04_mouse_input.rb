#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/sdl3"

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Mouse Input", 800, 600) do |window|
  SDL3::Renderer.create(window) do |renderer|
    running = true
    circles = []

    while running
      SDL3::Event.each do |event|
        case event.type
        when SDL3::Raw::SDL_EVENT_QUIT
          running = false
        when SDL3::Raw::SDL_EVENT_KEY_DOWN
          running = false if event.scancode == SDL3::Raw::SDL_SCANCODE_ESCAPE
          circles.clear if event.scancode == SDL3::Raw::SDL_SCANCODE_C
        when SDL3::Raw::SDL_EVENT_MOUSE_BUTTON_DOWN
          circles << {
            x: event.x,
            y: event.y,
            r: rand(128..255),
            g: rand(128..255),
            b: rand(128..255)
          }
        end
      end

      renderer.draw_color = [10, 10, 20, 255]
      renderer.clear

      circles.each do |circle|
        renderer.draw_color = [circle[:r], circle[:g], circle[:b], 255]
        renderer.fill_rect(circle[:x] - 10, circle[:y] - 10, 20, 20)
      end

      mouse_x_ptr = FFI::MemoryPointer.new(:float)
      mouse_y_ptr = FFI::MemoryPointer.new(:float)
      SDL3::Raw.SDL_GetMouseState(mouse_x_ptr, mouse_y_ptr)
      mouse_x = mouse_x_ptr.read_float
      mouse_y = mouse_y_ptr.read_float

      renderer.draw_color = [255, 255, 255, 255]
      renderer.draw_rect(mouse_x - 5, mouse_y - 5, 10, 10)

      renderer.present

      SDL3::Raw.SDL_Delay(16)
    end
  end
end

SDL3.quit
