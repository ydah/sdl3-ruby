#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/sdl3"

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Keyboard Input", 800, 600) do |window|
  SDL3::Renderer.create(window) do |renderer|
    running = true
    x = 375.0
    y = 275.0
    speed = 5.0

    while running
      SDL3::Event.each do |event|
        case event.type
        when SDL3::Raw::SDL_EVENT_QUIT
          running = false
        when SDL3::Raw::SDL_EVENT_KEY_DOWN
          case event.scancode
          when SDL3::Raw::SDL_SCANCODE_ESCAPE
            running = false
          when SDL3::Raw::SDL_SCANCODE_UP, SDL3::Raw::SDL_SCANCODE_W
            y -= speed
          when SDL3::Raw::SDL_SCANCODE_DOWN, SDL3::Raw::SDL_SCANCODE_S
            y += speed
          when SDL3::Raw::SDL_SCANCODE_LEFT, SDL3::Raw::SDL_SCANCODE_A
            x -= speed
          when SDL3::Raw::SDL_SCANCODE_RIGHT, SDL3::Raw::SDL_SCANCODE_D
            x += speed
          end
        end
      end

      x = [[x, 0].max, 750].min
      y = [[y, 0].max, 550].min

      renderer.draw_color = [20, 20, 40, 255]
      renderer.clear

      renderer.draw_color = [0, 200, 255, 255]
      renderer.fill_rect(x, y, 50, 50)

      renderer.present

      SDL3::Raw.SDL_Delay(16)
    end
  end
end

SDL3.quit
