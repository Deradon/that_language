require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "so (Somali)" do
  include AvailableLanguagesHelper

  use_language_code "so"
  use_language :"Somali"

  # How do you say ... in Somali?
  assert_that_language_with "Maxaa af soomali lagu yiraahdaa ... ?"
end
