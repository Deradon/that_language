require "detect_language/version"

require "detect_language/configuration"
require "detect_language/detect"
require "detect_language/lookup_context"
require "detect_language/result"
require "detect_language/result_set"
require "detect_language/store"

module DetectLanguage
  class << self
    def configuration
      @configuration ||= Configuration.new
    end
    alias_method :config, :configuration

    def details(text)
      detect.details(text)
    end

    def language(text)
      detect.language(text)
    end

    def detect
      @detect ||= Detect.new(lookup_context)
    end

    def lookup_context
      @lookup_context ||= LookupContext.from_wordlist_path(
configuration.wordlist_path)
    end

    def monkeypatch(klass)
      klass.class_eval do
        define_method(:language) { DetectLanguage.language(self.to_s) }
      end
    end
  end
end
