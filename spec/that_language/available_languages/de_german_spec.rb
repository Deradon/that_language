require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "de (german)" do
  include AvailableLanguagesHelper
  use_language_code "de"

  # WhatLanguageTest
  assert_that_language_with "Welche Sprache ist das?"
end
