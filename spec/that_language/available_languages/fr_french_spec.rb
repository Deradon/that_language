require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "fr (french)" do
  include AvailableLanguagesHelper
  use_language_code "fr"

  # WhatLanguageTest
  assert_that_language_with "Bonjour, je m'appelle Sandrine. Voila mon chat."
end
