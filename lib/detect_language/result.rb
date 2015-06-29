module DetectLanguage
  class Result
    attr_reader :locale, :value, :hit_count
    attr_accessor :words_count, :total_value

    def initialize(locale:)
      @locale = locale
      @value = 0.0
      @hit_count = 0
      @words_count = 0
      @total_value = 0.0
    end

    def add(value)
      return @value unless value > 0

      @hit_count += 1
      @value += value
    end

    def score
      percentage * hit_ratio
    end

    def hit_ratio
      @hit_count.to_f / @words_count
    end

    def percentage
      @value / @total_value
    end

    def <=>(other)
      score <=> other.score
    end

    def <(other)
      score < other.score
    end

    def >(other)
      score > other.score
    end
  end
end
