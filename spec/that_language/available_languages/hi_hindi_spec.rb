require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "hi (hindi)" do
  include AvailableLanguagesHelper

  use_language_code "hi"
  use_language :"Hindi"

  # Can you help me?
  assert_that_language_with "क्या आप मेरी मदद कर सकते हैं ।"
end
