require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "yo (yoruba)" do
  include AvailableLanguagesHelper

  use_language_code "yo"
  use_language :"Yoruba"

  # How do you say ... in Yoruba?
  assert_that_language_with "Bawo ni o se le sọ …... ni Yorùbá"
end
