module DetectLanguage
  class ResultSet
    def initialize(words_count)
      @words_count = words_count
    end

    def for(key)
      lookup[key]
    end

    # FIXME: Refactor ...
    def winner
      winner = nil
      max_value = -1
      results.each do |r|
        if r.value > max_value
          max_value = r.value
          winner = r
        end
      end
      winner.words_count = @words_count
      winner.total_value = total_value
      winner
    end

    def results
      lookup.values
    end

  private

    def total_value
      results.inject(0) { |sum, result| sum += result.value }
    end

    def lookup
     @lookup ||= Hash.new { |h, l| h[l] = Result.new(locale: l) }
    end
  end
end
