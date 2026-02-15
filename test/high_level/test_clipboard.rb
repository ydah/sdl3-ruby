# frozen_string_literal: true

require "test_helper"

class TestHighLevelClipboard < Minitest::Test
  def setup
    SDL3.init(SDL3::INIT_VIDEO)
  end

  def teardown
    SDL3.quit
  end

  def test_module_responds_to_text
    assert_respond_to SDL3::Clipboard, :text
  end

  def test_module_responds_to_text_setter
    assert_respond_to SDL3::Clipboard, :text=
  end

  def test_module_responds_to_has_text
    assert_respond_to SDL3::Clipboard, :has_text?
  end

  def test_module_responds_to_primary_selection
    assert_respond_to SDL3::Clipboard, :primary_selection_text
    assert_respond_to SDL3::Clipboard, :primary_selection_text=
    assert_respond_to SDL3::Clipboard, :has_primary_selection_text?
  end

  def test_module_responds_to_clear
    assert_respond_to SDL3::Clipboard, :clear
  end

  def test_module_responds_to_data_methods
    assert_respond_to SDL3::Clipboard, :has_data?
    assert_respond_to SDL3::Clipboard, :data
    assert_respond_to SDL3::Clipboard, :mime_types
  end

  def test_has_text_returns_boolean
    result = SDL3::Clipboard.has_text?
    assert_includes [true, false], result
  end

  def test_has_primary_selection_text_returns_boolean
    result = SDL3::Clipboard.has_primary_selection_text?
    assert_includes [true, false], result
  end

  def test_mime_types_returns_array
    result = SDL3::Clipboard.mime_types
    assert_kind_of Array, result
  end

  def test_set_and_get_text
    test_text = "SDL3 Ruby Test #{Time.now.to_i}"
    SDL3::Clipboard.text = test_text
    assert SDL3::Clipboard.has_text?
    assert_equal test_text, SDL3::Clipboard.text
  end

  def test_clear_clipboard
    SDL3::Clipboard.text = "test"
    SDL3::Clipboard.clear
  end

  def test_has_data_returns_boolean
    result = SDL3::Clipboard.has_data?("text/plain")
    assert_includes [true, false], result
  end
end
