require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ne (nepali)" do
  include AvailableLanguagesHelper

  use_language_code "ne"
  use_language :"Nepali"

  # How do you say ... in Nepali?
  assert_that_language_with "तपाइले नेपालीमा .... लाइ कसरी भन्नुहुन्छ?"
end
