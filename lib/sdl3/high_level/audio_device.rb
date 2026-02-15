# frozen_string_literal: true

module SDL3
  class AudioDevice
    attr_reader :id

    def initialize(device_id, spec = nil)
      @id = Raw.SDL_OpenAudioDevice(device_id, spec)
      raise AudioError, Raw.SDL_GetError if @id.zero?

      ObjectSpace.define_finalizer(self, self.class.releasing(@id))
    end

    def self.releasing(id)
      prevented_id = id
      proc { Raw.SDL_CloseAudioDevice(prevented_id) unless prevented_id.zero? }
    end

    def self.open(device_id, spec = nil)
      device = new(device_id, spec)
      return device unless block_given?

      begin
        yield device
      ensure
        device.close
      end
    end

    def self.playback_devices
      count_ptr = FFI::MemoryPointer.new(:int)
      devices_ptr = Raw.SDL_GetAudioPlaybackDevices(count_ptr)
      return [] if devices_ptr.null?

      count = count_ptr.read_int
      devices_ptr.read_array_of_uint32(count)
    end

    def self.recording_devices
      count_ptr = FFI::MemoryPointer.new(:int)
      devices_ptr = Raw.SDL_GetAudioRecordingDevices(count_ptr)
      return [] if devices_ptr.null?

      count = count_ptr.read_int
      devices_ptr.read_array_of_uint32(count)
    end

    def self.device_name(device_id)
      Raw.SDL_GetAudioDeviceName(device_id)
    end

    def close
      return if @id.zero?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_CloseAudioDevice(@id)
      @id = 0
    end

    def name
      Raw.SDL_GetAudioDeviceName(@id)
    end

    def pause
      Raw.SDL_PauseAudioDevice(@id)
    end

    def resume
      Raw.SDL_ResumeAudioDevice(@id)
    end

    def paused?
      Raw.SDL_AudioDevicePaused(@id)
    end

    def gain
      Raw.SDL_GetAudioDeviceGain(@id)
    end

    def gain=(value)
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_SetAudioDeviceGain(@id, value)

      value
    end

    def physical?
      Raw.SDL_IsAudioDevicePhysical(@id)
    end

    def playback?
      Raw.SDL_IsAudioDevicePlayback(@id)
    end
  end

  class AudioStream
    attr_reader :ptr

    def initialize(src_spec, dst_spec)
      @ptr = Raw.SDL_CreateAudioStream(src_spec, dst_spec)
      raise AudioError, Raw.SDL_GetError if @ptr.null?

      ObjectSpace.define_finalizer(self, self.class.releasing(@ptr))
    end

    def self.releasing(ptr)
      prevented_ptr = ptr
      proc { Raw.SDL_DestroyAudioStream(prevented_ptr) unless prevented_ptr.null? }
    end

    def self.open(src_spec, dst_spec)
      stream = new(src_spec, dst_spec)
      return stream unless block_given?

      begin
        yield stream
      ensure
        stream.destroy
      end
    end

    def destroy
      return if @ptr.null?

      ObjectSpace.undefine_finalizer(self)
      Raw.SDL_DestroyAudioStream(@ptr)
      @ptr = FFI::Pointer::NULL
    end

    def bind(device)
      device_id = device.is_a?(AudioDevice) ? device.id : device
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_BindAudioStream(device_id, @ptr)

      true
    end

    def unbind
      Raw.SDL_UnbindAudioStream(@ptr)
    end

    def put(data, length)
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_PutAudioStreamData(@ptr, data, length)

      true
    end

    def get(buffer, length)
      Raw.SDL_GetAudioStreamData(@ptr, buffer, length)
    end

    def available
      Raw.SDL_GetAudioStreamAvailable(@ptr)
    end

    def queued
      Raw.SDL_GetAudioStreamQueued(@ptr)
    end

    def flush
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_FlushAudioStream(@ptr)

      true
    end

    def clear
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_ClearAudioStream(@ptr)

      true
    end

    def frequency_ratio
      Raw.SDL_GetAudioStreamFrequencyRatio(@ptr)
    end

    def frequency_ratio=(value)
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_SetAudioStreamFrequencyRatio(@ptr, value)

      value
    end

    def gain
      Raw.SDL_GetAudioStreamGain(@ptr)
    end

    def gain=(value)
      raise AudioError, Raw.SDL_GetError unless Raw.SDL_SetAudioStreamGain(@ptr, value)

      value
    end

    def lock
      Raw.SDL_LockAudioStream(@ptr)
    end

    def unlock
      Raw.SDL_UnlockAudioStream(@ptr)
    end

    def to_ptr
      @ptr
    end
  end
end
