require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "gu (gujarati)" do
  include AvailableLanguagesHelper

  use_language_code "gu"
  use_language :"Gujarati"

  # Do you speak Gujarati?
  assert_that_language_with "શું તમે ગુજરાતી બોલો છો?"
end
