require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "zh (chinese)" do
  include AvailableLanguagesHelper

  use_language_code "zh"
  use_language :"Chinese"

  pending "zh (chinese) is broken at the moment."

  # FIXME: One of these should turn green :(
  # In english: Can you help me?
  # assert_that_language_with "你肯帮助我吗？"
  # assert_that_language_with "Ni3 ken3 bang1 zhu4 wo3 ma?"
end
