# frozen_string_literal: true

require "rbconfig"

module SDL3
  module LibraryLoader
    LIBRARY_NAMES = {
      "linux" => ["libSDL3.so.0", "libSDL3.so"],
      "darwin" => ["libSDL3.dylib", "SDL3.framework/SDL3"],
      "mingw" => ["SDL3.dll"],
      "mswin" => ["SDL3.dll"]
    }.freeze

    SEARCH_PATHS = {
      "linux" => ["/usr/lib", "/usr/local/lib", "/usr/lib/x86_64-linux-gnu"],
      "darwin" => ["/opt/homebrew/lib", "/usr/local/lib", "/Library/Frameworks"],
      "mingw" => [],
      "mswin" => []
    }.freeze

    class << self
      def library_name
        platform = detect_platform
        names = LIBRARY_NAMES[platform]
        raise LoadError, "Unsupported platform: #{platform}" unless names

        names.each do |name|
          return name if library_available?(name)
        end

        paths = SEARCH_PATHS[platform] || []
        paths.each do |path|
          names.each do |name|
            full_path = File.join(path, name)
            return full_path if library_available?(full_path)
          end
        end

        raise LoadError, "Could not find SDL3 library. Tried: #{names.join(", ")}"
      end

      private

      def detect_platform
        case RbConfig::CONFIG["host_os"]
        when /linux/i then "linux"
        when /darwin/i then "darwin"
        when /mingw/i then "mingw"
        when /mswin/i then "mswin"
        else "unknown"
        end
      end

      def library_available?(name)
        require "ffi"
        FFI::DynamicLibrary.open(name, FFI::DynamicLibrary::RTLD_LAZY)
        true
      rescue LoadError
        false
      end
    end
  end
end
