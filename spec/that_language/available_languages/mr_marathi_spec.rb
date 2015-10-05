require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "mr (marathi)" do
  include AvailableLanguagesHelper

  use_language_code "mr"
  use_language :"Marathi"

  # Do you speak Marathi?
  assert_that_language_with "तुम्हाला मराठी येते का?"
end
