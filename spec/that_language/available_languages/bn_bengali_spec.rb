require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "bn (bengali)" do
  include AvailableLanguagesHelper

  use_language_code "bn"
  use_language :"Bengali"

  # I eat rice.
  assert_that_language_with "আমি  একটি বই পড়ছি."
end
