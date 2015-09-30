require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "el (greek)" do
  include AvailableLanguagesHelper
  use_language_code "el"

  # WhatLanguageTest
  assert_that_language_with "Ποια γλώσσα είναι αυτή;"
end
