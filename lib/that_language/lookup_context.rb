module ThatLanguage
  class LookupContext
    def initialize(lookup_hash)
      @lookup_hash = lookup_hash
    end

    class << self
      def from_wordlist_path(wordlist_path)
        if File.file?(wordlist_path)
          from_file(wordlist_path)
        elsif File.directory?(wordlist_path)
          from_directory(wordlist_path)
        else
          raise ArgumentError # TODO: spec
        end
      end

      private

      def from_file(wordlist_path)
        store = Store.new(wordlist_path)
        new(store.to_h)
      end

      # TODO: spec with multiple files
      def from_directory(wordlist_path)
        entries = Dir.new(wordlist_path).entries.map { |entry| File.join(wordlist_path, entry) }
        files = entries.select { |entry| File.file?(entry) }

        lookup_contexts = files.map { |file| from_file(file) }

        lookup_context = lookup_contexts.shift
        lookup_contexts.each do |other_lookup_context|
          lookup_context = lookup_context.merge(other_lookup_context)
        end

        lookup_context
      end
    end

    def language_codes
      @language_codes ||= lookup_hash[:language_codes]
    end

    # TODO: This code is ugly. Refactor me :(
    def normalized(word)
      h = self[word]
      max = h.values.max

      return h if max == 0.0

      h.each do |word, value|
        h[word] = value / max
      end

      h
    end

    # TODO: We could add memoization, but this will increase memory usage a lot
    def [](word)
      h = {}
      language_codes.each do |language_code|
        h[language_code] = lookup_hash[language_code][word] || DEFAULT_VALUE
      end
      h
    end

    # NOTE: This code is ugly. Refactor me :(
    def merge(other_lookup_context)
      new_lookup_hash = lookup_hash.dup
      new_lookup_hash[:language_codes] |= other_lookup_context.language_codes

      other_lookup_context.language_codes.each do |language_code|
        new_lookup_hash[language_code] ||= {}
        new_lookup_hash[language_code].merge!(other_lookup_context.lookup_hash[language_code])
      end

      LookupContext.new(new_lookup_hash)
    end

  protected

    DEFAULT_VALUE = 0.0

    attr_reader :lookup_hash
  end
end
