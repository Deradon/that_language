require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "su (sundanese)" do
  include AvailableLanguagesHelper

  use_language_code "su"
  use_language :"Sundanese"

  # How do you say ... in Sundanese?
  assert_that_language_with "Kumaha nyarios .... ku basa Sunda?"
end
