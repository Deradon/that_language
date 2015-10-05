require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "az (azerbaijani)" do
  include AvailableLanguagesHelper

  use_language_code "az"
  use_language :"Azerbaijani"

  # Do you speak Azerbaijani?
  assert_that_language_with "Siz Azərbaycanca danışırsınızmı?"
end
