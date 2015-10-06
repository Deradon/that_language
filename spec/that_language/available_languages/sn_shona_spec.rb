require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "sn (shona)" do
  include AvailableLanguagesHelper

  use_language_code "sn"
  use_language :"Shona"

  # Please speak more slowly
  assert_that_language_with "Ndinokumbirawo kuti musakurumidze kutaura"
end
