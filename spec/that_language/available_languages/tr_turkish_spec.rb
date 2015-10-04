require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "tr (turkish)" do
  include AvailableLanguagesHelper

  use_language_code "tr"
  use_language :"Turkish"

  # In english: Can you help me?
  assert_that_language_with "Bana yardım edebilir misiniz?"
end
