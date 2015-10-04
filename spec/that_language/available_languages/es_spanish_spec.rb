require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "es (spanish)" do
  include AvailableLanguagesHelper

  use_language_code "es"
  use_language :"Spanish"

  # WhatLanguageTest
  assert_that_language_with <<-TEXT
    La palabra mezquita se usa en español para referirse a todo tipo
    de edificios dedicados.
  TEXT
end
