require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "no (norwegian)" do
  include AvailableLanguagesHelper

  use_language_code "no"
  use_language :"Norwegian"

  # Can you help me?
  assert_that_language_with "Kan du hjelpe meg?"
end
