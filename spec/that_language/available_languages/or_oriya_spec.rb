require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "or (oriya)" do
  include AvailableLanguagesHelper

  use_language_code "or"
  use_language :"Oriya"

  # Do you speak Odia?
  assert_that_language_with "ଆପଣ ଓଡ଼ିଆ କୁହନ୍ତି କି?"
end
