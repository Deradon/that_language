module DetectLanguage
  class Detect
    WORD_REGEX = /(\p{Word}+)/
    START_WITH_DIGIT_REGEX = /^\d.*/

    attr_reader :lookup_context

    def initialize(lookup_context)
      @lookup_context = lookup_context
    end

    def details(text)
      words = words_for(text)

      result_set = ResultSet.new(words.length)

      words.each do |word|
        word_result = lookup_context[word]
        word_result.each { |locale, value| result_set.for(locale).add(value) }
      end

      result_set
    end

    def language(text)
      details(text).winner
    end

  private

    def words_for(text)
      text
        .scan(WORD_REGEX)
        .flatten
        .reject { |w| w =~ START_WITH_DIGIT_REGEX }
    end
  end
end
