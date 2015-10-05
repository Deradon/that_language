require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ps (pashto)" do
  include AvailableLanguagesHelper

  use_language_code "ps"
  use_language :"Pashto"

  # Do you speak Pashto?
  assert_that_language_with "ايا ته په پښتو خبرې کولى شې؟"
end
