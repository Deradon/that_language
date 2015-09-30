require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "en (english)" do
  include AvailableLanguagesHelper
  use_language_code "en"

  # WhatLanguageTest
  assert_that_language_with "This is a test"
end
