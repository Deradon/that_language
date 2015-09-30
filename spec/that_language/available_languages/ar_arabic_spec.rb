require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ar (arabic)" do
  include AvailableLanguagesHelper
  use_language_code "ar"

  # WhatLanguageTest
  assert_that_language_with "اللغة التي هي هذه؟"
end
