require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "my (burmese)" do
  include AvailableLanguagesHelper

  use_language_code "my"
  use_language :"Burmese"

  # Do you speak English?
  assert_that_language_with "သင် အင်္ဂလိပ်လို ပြောသလား?"
end
