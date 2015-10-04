require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ja (japanese)" do
  include AvailableLanguagesHelper

  use_language_code "ja"
  use_language :"Japanese"

  pending "ja (japanese) is broken at the moment."

  # In english: Can you help me?
  # assert_that_language_with "元気ですか。"
end
