#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/sdl3"

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Hello SDL3!", 800, 600) do |window|
  running = true

  while running
    SDL3::Event.each do |event|
      running = false if event.quit?
    end

    surface = window.surface
    surface.fill_rect(nil, 0xFF6B8E23)
    window.update_surface

    SDL3::Raw.SDL_Delay(16)
  end
end

SDL3.quit
