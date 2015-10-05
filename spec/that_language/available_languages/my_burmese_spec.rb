require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "my (burmese)" do
  include AvailableLanguagesHelper

  use_language_code "my"
  use_language :"Burmese"

  # Do you speak Burmese?
  assert_that_language_with "ဗမာစကား ေြဟတတ်သလား။"
end
