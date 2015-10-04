require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "am (amharic)" do
  include AvailableLanguagesHelper

  use_language_code "am"
  use_language :"Amharic"

  # One language is never enough
  assert_that_language_with "አንድ ቋንቋ ብቻ በቂ አይደለም"
end
