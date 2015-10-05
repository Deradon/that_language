require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ha (hausa)" do
  include AvailableLanguagesHelper

  use_language_code "ha"
  use_language :"Hausa"

  # Do you speak Hausa?
  assert_that_language_with "Kana jin harshen Hausa?"
end
