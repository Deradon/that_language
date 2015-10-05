require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ku (kurdish)" do
  include AvailableLanguagesHelper

  use_language_code "ku"
  use_language :"Kurdish"

  # Do you speak Kurdish?
  assert_that_language_with "Kurdî qise dekeyt?"
end
