require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ta (Tamil)" do
  include AvailableLanguagesHelper

  use_language_code "ta"
  use_language :"Tamil"

  # How do you say ... in Tamil? (formal)
  assert_that_language_with "அத ... தமிழ்ழ எப்படி சொல்லுவீங்க? "

  # How do you say ... in Tamil? (informal)
  assert_that_language_with "அதை ... தமிழில் எப்படி சொல்லுவீர்கள்?"
end
