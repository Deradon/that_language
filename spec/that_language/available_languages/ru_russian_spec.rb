require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ru (russian)" do
  include AvailableLanguagesHelper

  use_language_code "ru"
  use_language :"Russian"

  # WhatLanguageTest
  assert_that_language_with "Все новости в хронологическом порядке"
end
