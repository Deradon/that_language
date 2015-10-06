require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "rn (kirundi)" do
  include AvailableLanguagesHelper

  use_language_code "rn"
  use_language :"Kirundi"

  # Do you speak English?
  assert_that_language_with "Uravuga icongereza?"
end
