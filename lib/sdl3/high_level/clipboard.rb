# frozen_string_literal: true

module SDL3
  module Clipboard
    class << self
      def text
        Raw.SDL_GetClipboardText
      end

      def text=(value)
        Raw.SDL_SetClipboardText(value)
      end

      def has_text?
        Raw.SDL_HasClipboardText
      end

      def primary_selection_text
        Raw.SDL_GetPrimarySelectionText
      end

      def primary_selection_text=(value)
        Raw.SDL_SetPrimarySelectionText(value)
      end

      def has_primary_selection_text?
        Raw.SDL_HasPrimarySelectionText
      end

      def clear
        Raw.SDL_ClearClipboardData
      end

      def has_data?(mime_type)
        Raw.SDL_HasClipboardData(mime_type)
      end

      def data(mime_type)
        size_ptr = FFI::MemoryPointer.new(:size_t)
        data_ptr = Raw.SDL_GetClipboardData(mime_type, size_ptr)
        return nil if data_ptr.null?

        size = size_ptr.read(:size_t)
        data_ptr.read_bytes(size)
      end

      def mime_types
        count_ptr = FFI::MemoryPointer.new(:size_t)
        types_ptr = Raw.SDL_GetClipboardMimeTypes(count_ptr)
        return [] if types_ptr.null?

        count = count_ptr.read(:size_t)
        count.times.map do |i|
          types_ptr.get_pointer(i * FFI::Pointer.size).read_string
        end
      end
    end
  end
end
