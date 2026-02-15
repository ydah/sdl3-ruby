# frozen_string_literal: true

require "test_helper"

class TestRawAssert < Minitest::Test
  def test_assert_state_enum_defined
    assert SDL3::Raw::SDL_AssertState
  end

  def test_assert_state_values
    assert_equal 0, SDL3::Raw::SDL_AssertState[:SDL_ASSERTION_RETRY]
    assert_equal 1, SDL3::Raw::SDL_AssertState[:SDL_ASSERTION_BREAK]
    assert_equal 2, SDL3::Raw::SDL_AssertState[:SDL_ASSERTION_ABORT]
    assert_equal 3, SDL3::Raw::SDL_AssertState[:SDL_ASSERTION_IGNORE]
    assert_equal 4, SDL3::Raw::SDL_AssertState[:SDL_ASSERTION_ALWAYS_IGNORE]
  end

  def test_assert_data_struct_defined
    assert SDL3::Raw::SDL_AssertData
  end

  def test_assert_data_struct_layout
    data = SDL3::Raw::SDL_AssertData.new
    assert_respond_to data, :[]
    assert data.members.include?(:always_ignore)
    assert data.members.include?(:trigger_count)
    assert data.members.include?(:condition)
    assert data.members.include?(:filename)
    assert data.members.include?(:linenum)
    assert data.members.include?(:function)
    assert data.members.include?(:next)
  end

  def test_get_assertion_report
    report = SDL3::Raw.SDL_GetAssertionReport
    assert_kind_of FFI::Pointer, report
  end

  def test_reset_assertion_report
    SDL3::Raw.SDL_ResetAssertionReport
  end

  def test_get_default_assertion_handler
    handler = SDL3::Raw.SDL_GetDefaultAssertionHandler
    refute_nil handler
  end
end
