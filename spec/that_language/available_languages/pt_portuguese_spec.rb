require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "pt (portugese)" do
  include AvailableLanguagesHelper
  use_language_code "pt"

  # WhatLanguageTest
  assert_that_language_with "Que linguagem é essa?"
end
