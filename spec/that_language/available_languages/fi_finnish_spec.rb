require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "fi (finnish)" do
  include AvailableLanguagesHelper
  use_language_code "fi"

  # WhatLanguageTest
  assert_that_language_with "Mitä kieltä tämä on?"
end
