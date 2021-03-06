module ThatLanguage
  class Detect
    WORD_REGEX = /(\p{Word}+)/
    START_WITH_DIGIT_REGEX = /^\d.*/

    attr_reader :lookup_context

    def initialize(lookup_context)
      @lookup_context = lookup_context
    end

    def language(text)
      detect(text).language
    end

    def language_code(text)
      detect(text).language_code
    end

    def detect(text)
      details(text).winner
    end

    def details(text)
      words = words_for(text)

      result_set = ResultSet.new(words.length)

      words.each do |word|
        word_result = lookup_context.normalized(word)
        word_result.each do |language_code, value|
          next unless value > 0

          result_set.for(language_code).add(value)
        end
      end

      result_set
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
