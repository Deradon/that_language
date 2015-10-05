require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "mg (malagasy)" do
  include AvailableLanguagesHelper

  use_language_code "mg"
  use_language :"Malagasy"

  # Do you speak Malagasy?
  assert_that_language_with "Mahay miteny malagasy ve ianao?"
end
