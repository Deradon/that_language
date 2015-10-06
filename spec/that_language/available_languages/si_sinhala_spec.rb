require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "si (sinhala)" do
  include AvailableLanguagesHelper

  use_language_code "si"
  use_language :"Sinhala"

  # How do you say ... in Sinhala?
  assert_that_language_with "කියන්නේ කොහොමද?"
end
