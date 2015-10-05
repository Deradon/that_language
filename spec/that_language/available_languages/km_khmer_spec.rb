require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "km (khmer)" do
  include AvailableLanguagesHelper

  use_language_code "km"
  use_language :"Khmer"

  # Do you speak Khmer?
  assert_that_language_with "អ្នក​ចេះ​និយាយ​ភាសា​ខ្មែរ​ទេ?"
end
