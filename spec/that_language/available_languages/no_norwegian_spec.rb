require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "no (norwegian)" do
  include AvailableLanguagesHelper
  use_language_code "no"

  # WhatLanguageTest
  assert_that_language_with "Hvilket språk er dette?"
end
