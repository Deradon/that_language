module ThatLanguage
  class ResultSet
    include Enumerable

    # TODO: Handle no result in a better way (NullObject anyone?)
    NO_RESULT = Result.new(language_code: nil)

    def initialize(words_count)
      @words_count = words_count
    end

    def for(key)
      lookup[key]
    end

    def winner
      results.max || NO_RESULT
    end

    def results
      finalize_results

      _results.sort.reverse
    end

    def each(&block)
      results.each(&block)
    end

    def to_h
      {
        results: results.map(&:to_h)
      }
    end

    def to_json
      to_h.to_json
    end

  private

    def _results
      lookup.values
    end

    def finalize_results
      _results.each do |result|
        result.words_count = @words_count
      end
    end

    def lookup
      @lookup ||= Hash.new do |hash, language_code|
        hash[language_code] = Result.new(language_code: language_code)
      end
    end
  end
end
