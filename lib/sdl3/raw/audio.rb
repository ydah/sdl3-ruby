# frozen_string_literal: true

module SDL3
  module Raw
    SDL_AUDIO_MASK_BITSIZE = 0xFF
    SDL_AUDIO_MASK_FLOAT = 1 << 8
    SDL_AUDIO_MASK_BIG_ENDIAN = 1 << 12
    SDL_AUDIO_MASK_SIGNED = 1 << 15

    SDL_AUDIO_U8 = 0x0008
    SDL_AUDIO_S8 = 0x8008
    SDL_AUDIO_S16LE = 0x8010
    SDL_AUDIO_S16BE = 0x9010
    SDL_AUDIO_S32LE = 0x8020
    SDL_AUDIO_S32BE = 0x9020
    SDL_AUDIO_F32LE = 0x8120
    SDL_AUDIO_F32BE = 0x9120

    SDL_AUDIO_S16 = SDL_AUDIO_S16LE
    SDL_AUDIO_S32 = SDL_AUDIO_S32LE
    SDL_AUDIO_F32 = SDL_AUDIO_F32LE

    class SDL_AudioSpec < FFI::Struct
      layout :format, :uint16,
             :channels, :int,
             :freq, :int
    end

    attach_function :SDL_GetNumAudioDrivers, [], :int
    attach_function :SDL_GetAudioDriver, [:int], :string
    attach_function :SDL_GetCurrentAudioDriver, [], :string
    attach_function :SDL_GetAudioPlaybackDevices, [:pointer], :pointer
    attach_function :SDL_GetAudioRecordingDevices, [:pointer], :pointer
    attach_function :SDL_GetAudioDeviceName, [:SDL_AudioDeviceID], :string
    attach_function :SDL_GetAudioDeviceFormat, [:SDL_AudioDeviceID, SDL_AudioSpec.ptr, :pointer], :bool
    attach_function :SDL_GetAudioDeviceChannelMap, [:SDL_AudioDeviceID, :pointer], :pointer
    attach_function :SDL_OpenAudioDevice, [:SDL_AudioDeviceID, SDL_AudioSpec.ptr], :SDL_AudioDeviceID
    attach_function :SDL_IsAudioDevicePhysical, [:SDL_AudioDeviceID], :bool
    attach_function :SDL_IsAudioDevicePlayback, [:SDL_AudioDeviceID], :bool
    attach_function :SDL_PauseAudioDevice, [:SDL_AudioDeviceID], :bool
    attach_function :SDL_ResumeAudioDevice, [:SDL_AudioDeviceID], :bool
    attach_function :SDL_AudioDevicePaused, [:SDL_AudioDeviceID], :bool
    attach_function :SDL_GetAudioDeviceGain, [:SDL_AudioDeviceID], :float
    attach_function :SDL_SetAudioDeviceGain, [:SDL_AudioDeviceID, :float], :bool
    attach_function :SDL_CloseAudioDevice, [:SDL_AudioDeviceID], :void
    attach_function :SDL_BindAudioStreams, [:SDL_AudioDeviceID, :pointer, :int], :bool
    attach_function :SDL_BindAudioStream, [:SDL_AudioDeviceID, :pointer], :bool
    attach_function :SDL_UnbindAudioStreams, %i[pointer int], :void
    attach_function :SDL_UnbindAudioStream, [:pointer], :void
    attach_function :SDL_GetAudioStreamDevice, [:pointer], :SDL_AudioDeviceID
    attach_function :SDL_CreateAudioStream, [SDL_AudioSpec.ptr, SDL_AudioSpec.ptr], :pointer
    attach_function :SDL_GetAudioStreamProperties, [:pointer], :SDL_PropertiesID
    attach_function :SDL_GetAudioStreamFormat, [:pointer, SDL_AudioSpec.ptr, SDL_AudioSpec.ptr], :bool
    attach_function :SDL_SetAudioStreamFormat, [:pointer, SDL_AudioSpec.ptr, SDL_AudioSpec.ptr], :bool
    attach_function :SDL_GetAudioStreamFrequencyRatio, [:pointer], :float
    attach_function :SDL_SetAudioStreamFrequencyRatio, %i[pointer float], :bool
    attach_function :SDL_GetAudioStreamGain, [:pointer], :float
    attach_function :SDL_SetAudioStreamGain, %i[pointer float], :bool
    attach_function :SDL_GetAudioStreamInputChannelMap, %i[pointer pointer], :pointer
    attach_function :SDL_GetAudioStreamOutputChannelMap, %i[pointer pointer], :pointer
    attach_function :SDL_SetAudioStreamInputChannelMap, %i[pointer pointer int], :bool
    attach_function :SDL_SetAudioStreamOutputChannelMap, %i[pointer pointer int], :bool
    attach_function :SDL_PutAudioStreamData, %i[pointer pointer int], :bool
    begin
      callback :SDL_AudioStreamDataCompleteCallback, %i[pointer pointer int], :void
      attach_function :SDL_PutAudioStreamDataNoCopy, %i[pointer pointer int SDL_AudioStreamDataCompleteCallback pointer], :bool
      attach_function :SDL_PutAudioStreamPlanarData, %i[pointer pointer int int], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetAudioStreamData, %i[pointer pointer int], :int
    attach_function :SDL_GetAudioStreamAvailable, [:pointer], :int
    attach_function :SDL_GetAudioStreamQueued, [:pointer], :int
    attach_function :SDL_FlushAudioStream, [:pointer], :bool
    attach_function :SDL_ClearAudioStream, [:pointer], :bool
    attach_function :SDL_PauseAudioStreamDevice, [:pointer], :bool
    attach_function :SDL_ResumeAudioStreamDevice, [:pointer], :bool
    attach_function :SDL_AudioStreamDevicePaused, [:pointer], :bool
    attach_function :SDL_LockAudioStream, [:pointer], :bool
    attach_function :SDL_UnlockAudioStream, [:pointer], :bool
    callback :SDL_AudioStreamCallback, %i[pointer pointer int int], :void
    attach_function :SDL_SetAudioStreamGetCallback, [:pointer, :SDL_AudioStreamCallback, :pointer], :bool
    attach_function :SDL_SetAudioStreamPutCallback, [:pointer, :SDL_AudioStreamCallback, :pointer], :bool
    attach_function :SDL_DestroyAudioStream, [:pointer], :void
    attach_function :SDL_OpenAudioDeviceStream, [:SDL_AudioDeviceID, SDL_AudioSpec.ptr, :SDL_AudioStreamCallback, :pointer], :pointer
    callback :SDL_AudioPostmixCallback, [:pointer, SDL_AudioSpec.ptr, :pointer, :int], :void
    attach_function :SDL_SetAudioPostmixCallback, [:SDL_AudioDeviceID, :SDL_AudioPostmixCallback, :pointer], :bool
    attach_function :SDL_LoadWAV_IO, [:pointer, :bool, SDL_AudioSpec.ptr, :pointer, :pointer], :bool
    attach_function :SDL_LoadWAV, [:string, SDL_AudioSpec.ptr, :pointer, :pointer], :bool
    attach_function :SDL_MixAudio, %i[pointer pointer pointer uint16 int float], :bool
    attach_function :SDL_ConvertAudioSamples, [SDL_AudioSpec.ptr, :pointer, :int, SDL_AudioSpec.ptr, :pointer, :pointer], :bool
    attach_function :SDL_GetAudioFormatName, [:uint16], :string
    attach_function :SDL_GetSilenceValueForFormat, [:uint16], :int
  end
end
