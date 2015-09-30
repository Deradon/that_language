require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "pl (polish)" do
  include AvailableLanguagesHelper
  use_language_code "pl"

  # WhatLanguageTest
  assert_that_language_with "W jakim języku to jest?"
end
