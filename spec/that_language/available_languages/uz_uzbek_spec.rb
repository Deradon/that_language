require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "uz (Uzbek)" do
  include AvailableLanguagesHelper

  use_language_code "uz"
  use_language :"Uzbek"

  # Do you speak Uzbek?
  assert_that_language_with "O'zbek tilida gapirasizmi?"
end
