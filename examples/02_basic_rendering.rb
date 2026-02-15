#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/sdl3"

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Basic Rendering", 800, 600) do |window|
  SDL3::Renderer.create(window) do |renderer|
    running = true
    x = 100
    y = 100
    dx = 2
    dy = 2

    while running
      SDL3::Event.each do |event|
        running = false if event.quit?
      end

      renderer.draw_color = [30, 30, 30, 255]
      renderer.clear

      renderer.draw_color = [255, 100, 100, 255]
      renderer.fill_rect(x, y, 50, 50)

      renderer.draw_color = [100, 255, 100, 255]
      renderer.draw_rect(200, 200, 100, 100)

      renderer.draw_color = [100, 100, 255, 255]
      renderer.draw_line(400, 100, 600, 300)

      x += dx
      y += dy
      dx = -dx if x <= 0 || x >= 750
      dy = -dy if y <= 0 || y >= 550

      renderer.present

      SDL3::Raw.SDL_Delay(16)
    end
  end
end

SDL3.quit
