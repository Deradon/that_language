require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ko (korean)" do
  include AvailableLanguagesHelper

  use_language_code "ko"
  use_language :"Korean"

  # WhatLanguageTest
  assert_that_language_with "이 어떤 언어인가?"
end
