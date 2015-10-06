require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "th (thai)" do
  include AvailableLanguagesHelper

  use_language_code "th"
  use_language :"Thai"

  # How do you say ... in Thai?
  assert_that_language_with "ภาษาไทย ... พูดว่าอย่างไร"
end
