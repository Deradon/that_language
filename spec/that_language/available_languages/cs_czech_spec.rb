require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "cs (czech)" do
  include AvailableLanguagesHelper

  use_language_code "cs"
  use_language :"Czech"

  # In english: Can you help me?
  assert_that_language_with "Můžeš mi pomoci?"
end
