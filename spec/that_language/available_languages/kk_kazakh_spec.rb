require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "kk (Kazakh)" do
  include AvailableLanguagesHelper

  use_language_code "kk"
  use_language :"Kazakh"

  # Do you speak Kazakh?
  assert_that_language_with "Қазақша сөйлейсіз бе?"
end
