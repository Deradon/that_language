# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'that_language/version'

Gem::Specification.new do |spec|
  spec.name          = "that_language"
  spec.version       = ThatLanguage::VERSION
  spec.authors       = ["Patrick Helm"]
  spec.email         = ["me@patrick-helm.de"]

  spec.summary       = %q{Detect language of given text}
  spec.description   = %q{Detects the language of a given text by scoring its words against per-language word-frequency lists. Ships with wordlists for 72 languages.}
  spec.homepage      = "https://github.com/Deradon/that_language"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "homepage_uri"          => spec.homepage,
    "source_code_uri"       => spec.homepage,
    "bug_tracker_uri"       => "#{spec.homepage}/issues",
    "rubygems_mfa_required" => "true"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # pstore stopped being a default gem in Ruby 4.0, so it must be declared
  # explicitly. The wordlists are PStore files; this is a runtime dependency.
  spec.add_dependency "pstore", "~> 0.2"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "rspec-its", "~> 2.0"
  spec.add_development_dependency "rubocop", "~> 1.88"
end
