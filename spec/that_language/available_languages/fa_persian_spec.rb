require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "fa (persian)" do
  include AvailableLanguagesHelper

  use_language_code "fa"
  use_language :"Persian"

  # WhatLanguageTest
  assert_that_language_with "وقتی مادرم به من آموخت که به آواز خواندن."
end
