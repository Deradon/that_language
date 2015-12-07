require "that_language/version"

require "that_language/configuration"
require "that_language/detect"
require "that_language/iso_639"
require "that_language/lookup_context"
require "that_language/result"
require "that_language/result_set"
require "that_language/store"

module ThatLanguage
  class << self
    def configuration
      @configuration ||= Configuration.new
    end
    alias_method :config, :configuration

    def language(text)
      detect_context.language(text)
    end

    def language_code(text)
      detect_context.language_code(text)
    end

    def detect(text)
      detect_context.detect(text)
    end

    def details(text)
      detect_context.details(text)
    end

    def available_languages
      @available_languages ||= available_language_codes.map do |language_code|
        Iso639[language_code]
      end.sort
    end

    def available_language_codes
      @available_language_codes ||= lookup_context.language_codes
    end

    def monkeypatch(klass)
      klass.class_eval do
        define_method(:language_code) { ThatLanguage.language_code(self.to_s) }
      end
    end

  private

    def detect_context
      @detect_context ||= Detect.new(lookup_context)
    end

    def lookup_context
      @lookup_context ||= LookupContext.from_wordlist_path(
        configuration.wordlist_path
      )
    end
  end
end
