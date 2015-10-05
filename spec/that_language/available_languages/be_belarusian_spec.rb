require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "be (belarusian)" do
  include AvailableLanguagesHelper

  use_language_code "be"
  use_language :"Belarusian"

  # Do you speak Belarusian?
  assert_that_language_with "Ці размаўляеце па-беларуску?"
end
