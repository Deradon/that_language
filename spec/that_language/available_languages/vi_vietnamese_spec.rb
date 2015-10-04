require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "vi (vietnamese)" do
  include AvailableLanguagesHelper

  use_language_code "vi"
  use_language :"Vietnamese"

  # In english: Can you help me?
  assert_that_language_with "Tôi có thể giúp bạn điều gì?"
end
