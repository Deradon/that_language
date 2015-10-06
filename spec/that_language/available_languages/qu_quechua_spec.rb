require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "qu (Quechua)" do
  include AvailableLanguagesHelper

  use_language_code "qu"
  use_language :"Quechua"

  # How do you say ... in Quechua?
  assert_that_language_with "¿Imaynataq munan chay runasimipi?"
end
