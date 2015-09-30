require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "sv (swedish)" do
  include AvailableLanguagesHelper
  use_language_code "sv"

  # WhatLanguageTest
  assert_that_language_with "Vilket språk är detta?"
end
