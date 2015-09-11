module DetectLanguage
  class ResultSet
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
      @lookup ||= Hash.new { |h, l| h[l] = Result.new(locale: l) }
    end
  end
end
