module DetectLanguage
  class Detect
    WORD_REGEX = /(\p{Word}+)/
    START_WITH_DIGIT_REGEX = /^\d.*/

    attr_reader :lookup_context

    def initialize(lookup_context)
      @lookup_context = lookup_context
    end

    # TODO: Move into a strategy
    def details(text)
      words = words_for(text)

      result = Hash.new
      lookup_context.locales.each do |locale|
        result[locale] = 0.0
      end

      matched = 0
      words.each do |word|
        word_result = lookup_context[word]
        word_result.each do |locale, value|
          result[locale] += value
        end
        matched += 1 if word_result.values.any? { |v| v > 0.0 }
      end

      result
    end

    def language(text)
      details(text).max { |a,b| a[1] <=> b[1] }.first
    end

  private

    def words_for(text)
      words = text
        .scan(WORD_REGEX)
        .flatten
        .reject { |w| w =~ START_WITH_DIGIT_REGEX }
    end
  end
end
