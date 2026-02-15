# frozen_string_literal: true

require "test_helper"

class TestHighLevelAudioDevice < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_AUDIO)
  end

  def teardown
    SDL3.quit
  end

  def test_get_playback_devices
    devices = SDL3::AudioDevice.playback_devices
    assert_kind_of Array, devices
  end

  def test_get_recording_devices
    devices = SDL3::AudioDevice.recording_devices
    assert_kind_of Array, devices
  end

  def test_class_responds_to_methods
    assert_respond_to SDL3::AudioDevice, :playback_devices
    assert_respond_to SDL3::AudioDevice, :recording_devices
    assert_respond_to SDL3::AudioDevice, :device_name
    assert_respond_to SDL3::AudioDevice, :open
  end

  def test_instance_methods_defined
    assert SDL3::AudioDevice.instance_methods.include?(:id)
    assert SDL3::AudioDevice.instance_methods.include?(:name)
    assert SDL3::AudioDevice.instance_methods.include?(:pause)
    assert SDL3::AudioDevice.instance_methods.include?(:resume)
    assert SDL3::AudioDevice.instance_methods.include?(:close)
    assert SDL3::AudioDevice.instance_methods.include?(:paused?)
    assert SDL3::AudioDevice.instance_methods.include?(:gain)
    assert SDL3::AudioDevice.instance_methods.include?(:gain=)
  end

  def test_audio_stream_class_defined
    assert SDL3::AudioStream
  end

  def test_audio_stream_responds_to_open
    assert_respond_to SDL3::AudioStream, :open
  end

  def test_audio_stream_instance_methods_defined
    assert SDL3::AudioStream.instance_methods.include?(:destroy)
    assert SDL3::AudioStream.instance_methods.include?(:bind)
    assert SDL3::AudioStream.instance_methods.include?(:unbind)
    assert SDL3::AudioStream.instance_methods.include?(:put)
    assert SDL3::AudioStream.instance_methods.include?(:get)
    assert SDL3::AudioStream.instance_methods.include?(:available)
    assert SDL3::AudioStream.instance_methods.include?(:flush)
    assert SDL3::AudioStream.instance_methods.include?(:clear)
  end
end
