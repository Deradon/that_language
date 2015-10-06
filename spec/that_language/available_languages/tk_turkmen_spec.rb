require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "tk (turkmen)" do
  include AvailableLanguagesHelper

  use_language_code "tk"
  use_language :"Turkmen"

  # Better late than never.
  assert_that_language_with "Hiçden giç ýagşy."
end
