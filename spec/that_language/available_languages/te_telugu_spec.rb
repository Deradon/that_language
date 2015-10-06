require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "te (telugu)" do
  include AvailableLanguagesHelper

  use_language_code "te"
  use_language :"Telugu"

  # How do you say ... in Telugu?
  assert_that_language_with "... ని తెలుగులో ఎలా చెపుతారు ?"
end
