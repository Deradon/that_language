require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "uk (ukrainian)" do
  include AvailableLanguagesHelper

  use_language_code "uk"
  use_language :"Ukrainian"

  # How do you say ... in Ukrainian?
  assert_that_language_with "Як сказати українською ...?"
end
