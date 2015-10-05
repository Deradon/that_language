require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "om (oromo)" do
  include AvailableLanguagesHelper

  use_language_code "om"
  use_language :"Oromo"

  # I can speak it.
  assert_that_language_with "isa dubbachu nandanda'a"
end
