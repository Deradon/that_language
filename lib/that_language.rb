require "that_language/version"

require "that_language/configuration"
require "that_language/detect"
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

    def locale(text)
      detect.locale(text)
    end

    def details(text)
      detect.details(text)
    end

    def available_locales
      @available_locales ||= lookup_context.locales
    end

    def monkeypatch(klass)
      klass.class_eval do
        define_method(:locale) { ThatLanguage.locale(self.to_s) }
      end
    end

  private

    def detect
      @detect ||= Detect.new(lookup_context)
    end

    def lookup_context
      @lookup_context ||= LookupContext.from_wordlist_path(
        configuration.wordlist_path
      )
    end
  end
end
