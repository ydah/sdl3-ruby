# frozen_string_literal: true

require "test_helper"

class TestRawLocale < Minitest::Test
  def test_get_preferred_locales
    count_ptr = FFI::MemoryPointer.new(:int)
    result = SDL3::Raw.SDL_GetPreferredLocales(count_ptr)
    assert result.null? || result.is_a?(FFI::Pointer)
  end

  def test_locale_struct_defined
    assert SDL3::Raw::SDL_Locale
    locale = SDL3::Raw::SDL_Locale.new
    assert locale.members.include?(:language)
    assert locale.members.include?(:country)
  end
end
