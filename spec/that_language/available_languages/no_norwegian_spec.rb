require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "no (norwegian)" do
  include AvailableLanguagesHelper

  use_language_code "no"
  use_language :"Norwegian"

  # Do you speak Norwegian?
  assert_that_language_with "Snakkar du norsk?"
end
