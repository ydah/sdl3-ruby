# frozen_string_literal: true

require "test_helper"

class TestHighLevelEvent < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_EVENTS)
  end

  def teardown
    SDL3.quit
  end

  def test_event_type_constants_in_raw
    assert SDL3::Raw::SDL_EVENT_QUIT
    assert SDL3::Raw::SDL_EVENT_KEY_DOWN
    assert SDL3::Raw::SDL_EVENT_KEY_UP
    assert SDL3::Raw::SDL_EVENT_MOUSE_MOTION
    assert SDL3::Raw::SDL_EVENT_MOUSE_BUTTON_DOWN
    assert SDL3::Raw::SDL_EVENT_MOUSE_BUTTON_UP
  end

  def test_poll_returns_nil_when_no_events
    SDL3::Event.poll while SDL3::Event.poll
    result = SDL3::Event.poll
    assert_nil result
  end

  def test_push_and_poll_quit_event
    quit_event = SDL3::Raw::SDL_Event.new
    quit_event[:type] = SDL3::Raw::SDL_EVENT_QUIT
    SDL3::Raw.SDL_PushEvent(quit_event)

    event = SDL3::Event.poll
    refute_nil event
    assert_equal SDL3::Raw::SDL_EVENT_QUIT, event.type
  end

  def test_event_responds_to_methods
    assert_respond_to SDL3::Event, :poll
    assert_respond_to SDL3::Event, :wait
    assert_respond_to SDL3::Event, :push
    assert_respond_to SDL3::Event, :pump
  end

  def test_pump_events
    SDL3::Event.pump
  end

  def test_event_each
    assert_respond_to SDL3::Event, :each
  end

  def test_event_instance_responds_to_type
    quit_event = SDL3::Raw::SDL_Event.new
    quit_event[:type] = SDL3::Raw::SDL_EVENT_QUIT
    SDL3::Raw.SDL_PushEvent(quit_event)

    event = SDL3::Event.poll
    if event
      assert_respond_to event, :type
      assert_respond_to event, :raw
      assert_respond_to event, :timestamp
    end
  end

  def test_quit_event_class
    quit_event = SDL3::Raw::SDL_Event.new
    quit_event[:type] = SDL3::Raw::SDL_EVENT_QUIT
    SDL3::Raw.SDL_PushEvent(quit_event)

    event = SDL3::Event.poll
    refute_nil event
    assert_kind_of SDL3::QuitEvent, event
    assert event.quit?
  end

  def test_event_wrap
    event = SDL3::Raw::SDL_Event.new
    event[:type] = SDL3::Raw::SDL_EVENT_QUIT
    wrapped = SDL3::Event.wrap(event)
    assert_kind_of SDL3::QuitEvent, wrapped
  end
end
