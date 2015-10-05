require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "kn (kannada)" do
  include AvailableLanguagesHelper

  use_language_code "kn"
  use_language :"Kannada"

  # Do you speak Kannada?
  assert_that_language_with "ನೀವು ಕನ್ನಡ ಮಾತಾಡ್ತೀರಾ?"
end
