require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "rw (Kinyarwanda)" do
  include AvailableLanguagesHelper

  use_language_code "rw"
  use_language :"Kinyarwanda"

  # How do you say ... in Kinyarwanda?
  assert_that_language_with "Uvuga ngwiki ... mu Kinyarwanda?"
end
