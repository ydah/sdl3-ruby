# frozen_string_literal: true

require_relative "lib/sdl3/version"

Gem::Specification.new do |spec|
  spec.name = "sdl3"
  spec.version = SDL3::VERSION
  spec.authors = ["Yudai Takada"]
  spec.email = ["t.yudai92@gmail.com"]

  spec.summary = "Ruby FFI bindings for SDL3"
  spec.description = "Complete Ruby bindings for SDL3 multimedia library using FFI"
  spec.homepage = "https://github.com/ydah/sdl3-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi", "~> 1.15"
end
