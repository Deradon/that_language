require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "pt (portuguese)" do
  include AvailableLanguagesHelper

  use_language_code "pt"
  use_language :"Portuguese"

  # WhatLanguageTest
  assert_that_language_with "Que linguagem é essa?"
end
