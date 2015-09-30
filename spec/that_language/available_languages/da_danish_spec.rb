require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "da (danish)" do
  include AvailableLanguagesHelper
  use_language_code "da"

  # WhatLanguageTest
  assert_that_language_with <<-TEXT
    Dansk er et nord-germansk sprog af den østnordiske (kontinentale) gruppe,
    der tales af ca. seks millioner mennesker."
  TEXT
end
