# frozen_string_literal: true

module SDL3
  module Raw
    SDL_PowerState = enum :SDL_POWERSTATE_ERROR, -1,
                          :SDL_POWERSTATE_UNKNOWN, 0,
                          :SDL_POWERSTATE_ON_BATTERY, 1,
                          :SDL_POWERSTATE_NO_BATTERY, 2,
                          :SDL_POWERSTATE_CHARGING, 3,
                          :SDL_POWERSTATE_CHARGED, 4

    attach_function :SDL_GetPowerInfo, %i[pointer pointer], SDL_PowerState
  end
end
