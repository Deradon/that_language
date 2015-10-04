require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "nl (dutch)" do
  include AvailableLanguagesHelper

  use_language_code "nl"
  use_language :"Dutch"

  # WhatLanguageTest
  assert_that_language_with "Als hadden geweest is, is hebben te laat."
end
