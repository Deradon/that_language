module ThatLanguage
  class ResultSet
    include Enumerable

    def initialize(words_count)
      @words_count = words_count
    end

    def for(key)
      lookup[key]
    end

    def winner
      results.max.tap { |r| r.winner!(second_score: results[1].score) }
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
        result.total_value = total_value
      end
    end

    def total_value
      _results.inject(0) { |sum, result| sum += result.value }
    end

    def lookup
      @lookup ||= Hash.new do |hash, language_code|
        hash[language_code] = Result.new(language_code: language_code)
      end
    end
  end
end
