#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/sdl3"

class Player
  attr_accessor :x, :y, :vx, :vy, :width, :height

  def initialize(x, y)
    @x = x
    @y = y
    @vx = 0
    @vy = 0
    @width = 40
    @height = 40
    @speed = 300
    @gravity = 800
    @jump_force = -400
    @on_ground = false
  end

  def update(dt, keys)
    @vx = 0
    @vx = -@speed if keys[:left]
    @vx = @speed if keys[:right]

    @vy += @gravity * dt

    if keys[:jump] && @on_ground
      @vy = @jump_force
      @on_ground = false
    end

    @x += @vx * dt
    @y += @vy * dt

    @x = [[@x, 0].max, 800 - @width].min

    if @y >= 560 - @height
      @y = 560 - @height
      @vy = 0
      @on_ground = true
    end
  end

  def draw(renderer)
    renderer.draw_color = [100, 200, 255, 255]
    renderer.fill_rect(@x, @y, @width, @height)
  end
end

SDL3.init(SDL3::INIT_VIDEO)

SDL3::Window.open("Simple Game", 800, 600) do |window|
  SDL3::Renderer.create(window) do |renderer|
    running = true
    player = Player.new(380, 400)
    keys = { left: false, right: false, jump: false }
    last_time = SDL3::Raw.SDL_GetTicks / 1000.0

    while running
      current_time = SDL3::Raw.SDL_GetTicks / 1000.0
      dt = current_time - last_time
      last_time = current_time

      SDL3::Event.each do |event|
        case event.type
        when SDL3::Raw::SDL_EVENT_QUIT
          running = false
        when SDL3::Raw::SDL_EVENT_KEY_DOWN
          running = false if event.scancode == SDL3::Raw::SDL_SCANCODE_ESCAPE
          keys[:left] = true if event.scancode == SDL3::Raw::SDL_SCANCODE_LEFT ||
                                event.scancode == SDL3::Raw::SDL_SCANCODE_A
          keys[:right] = true if event.scancode == SDL3::Raw::SDL_SCANCODE_RIGHT ||
                                 event.scancode == SDL3::Raw::SDL_SCANCODE_D
          keys[:jump] = true if event.scancode == SDL3::Raw::SDL_SCANCODE_SPACE ||
                                event.scancode == SDL3::Raw::SDL_SCANCODE_UP ||
                                event.scancode == SDL3::Raw::SDL_SCANCODE_W
        when SDL3::Raw::SDL_EVENT_KEY_UP
          keys[:left] = false if event.scancode == SDL3::Raw::SDL_SCANCODE_LEFT ||
                                 event.scancode == SDL3::Raw::SDL_SCANCODE_A
          keys[:right] = false if event.scancode == SDL3::Raw::SDL_SCANCODE_RIGHT ||
                                  event.scancode == SDL3::Raw::SDL_SCANCODE_D
          keys[:jump] = false if event.scancode == SDL3::Raw::SDL_SCANCODE_SPACE ||
                                 event.scancode == SDL3::Raw::SDL_SCANCODE_UP ||
                                 event.scancode == SDL3::Raw::SDL_SCANCODE_W
        end
      end

      player.update(dt, keys)

      renderer.draw_color = [30, 30, 50, 255]
      renderer.clear

      renderer.draw_color = [80, 80, 80, 255]
      renderer.fill_rect(0, 560, 800, 40)

      player.draw(renderer)

      renderer.present

      SDL3::Raw.SDL_Delay(1)
    end
  end
end

SDL3.quit
