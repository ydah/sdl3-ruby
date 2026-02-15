# frozen_string_literal: true

require "ffi"
require_relative "../library_loader"

module SDL3
  module Raw
    extend FFI::Library

    ffi_lib LibraryLoader.library_name
  end
end
