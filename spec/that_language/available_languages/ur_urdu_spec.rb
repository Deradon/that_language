require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ur (urdu)" do
  include AvailableLanguagesHelper

  use_language_code "ur"
  use_language :"Urdu"

  # How do you say ... in Urdu?
  assert_that_language_with "آپ ۔۔۔ كو اردو ميں كيا كہتے ہيں"
end
