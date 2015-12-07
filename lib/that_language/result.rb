require 'json'

module ThatLanguage
  class Result
    attr_reader :language_code, :value, :hit_count
    attr_accessor :words_count

    def initialize(language_code:)
      @language_code = language_code
      @value = 0.0
      @hit_count = 0
      @words_count = 0
    end

    def add(value)
      return @value unless value > 0

      @hit_count += 1
      @value += value
    end

    def confidence
      return 0 unless words_count > 0

      value / words_count
    end

    def hit_ratio
      return 0.0 if @words_count == 0

      @hit_count.to_f / @words_count
    end

    def <=>(other)
      value <=> other.value
    end

    def <(other)
      value < other.value
    end

    def >(other)
      value > other.value
    end

    def language
      Iso639[language_code]
    end

    def to_h
      {
        language: language,
        language_code: language_code,
        confidence: confidence,
        value: value,
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
