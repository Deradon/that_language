require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "hu (hungarian)" do
  include AvailableLanguagesHelper

  use_language_code "hu"
  use_language :"Hungarian"

  # WhatLanguageTest
  assert_that_language_with "Milyen nyelv ez?"
end
