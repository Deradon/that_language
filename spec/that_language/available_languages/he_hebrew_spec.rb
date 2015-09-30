require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "he (hebrew)" do
  include AvailableLanguagesHelper
  use_language_code "he"

  # WhatLanguageTest
  assert_that_language_with "באיזו שפה זה?"
end
