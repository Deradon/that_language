require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "nn (norwegian nynorsk)" do
  include AvailableLanguagesHelper

  use_language_code "nn"
  use_language :"Norwegian Nynorsk"

  # WhatLanguageTest
  assert_that_language_with "Hvilket språk er dette?"
end
