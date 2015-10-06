require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "zu (zulu)" do
  include AvailableLanguagesHelper

  use_language_code "zu"
  use_language :"Zulu"

  # Speak to me in Zulu
  assert_that_language_with "Ngicela ukhulume nami ngesiZulu"
end
