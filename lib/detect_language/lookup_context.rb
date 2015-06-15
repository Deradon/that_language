module DetectLanguage
  class LookupContext
    def initialize(lookup_hash)
      @lookup_hash = lookup_hash
    end

    def self.from_wordlist_path(wordlist_path)
      store = Store.new(wordlist_path)
      new(store.to_h)
    end

    def locales
      @locales ||= lookup_hash[:locales]
    end

    def [](word)
      h = {}
      locales.each do |locale|
        h[locale] = lookup_hash[locale][word] || DEFAULT_VALUE
      end
      h
    end

  private

    DEFAULT_VALUE = 0.0

    attr_reader :lookup_hash
  end
end
