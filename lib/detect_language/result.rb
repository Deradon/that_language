require 'json'

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

    # TODO: spec
    def winner!(second_score:)
      @second_score = second_score
    end

    # TODO: spec
    def winner?
      !@second_score.nil?
    end

    # TODO: spec
    def confidence
      factor = 1 - (@second_score / score)
      factor * hit_ratio
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
      return 0.0 if @words_count == 0

      @hit_count.to_f / @words_count
    end

    def percentage
      return 0.0 if @total_value == 0

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

    def to_h
      {
        locale: locale,
        value: value,
        score: score,
        percentage: percentage,
        hit_ratio: hit_ratio,
        hit_count: hit_count,
        words_count: words_count
      }
    end

    def to_json
      to_h.to_json
    end
  end
end
