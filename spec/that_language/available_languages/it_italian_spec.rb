require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "it (italian)" do
  include AvailableLanguagesHelper
  use_language_code "it"

  # WhatLanguageTest
  assert_that_language_with <<-TEXT
    Roma, capitale dell'impero romano, è stata per secoli il centro politico
    e culturale della civiltà occidentale.
  TEXT
end
