require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ro (romanian)" do
  include AvailableLanguagesHelper

  use_language_code "ro"
  use_language :"Romanian"

  # Go straight! then turn left!
  assert_that_language_with "Mergi drept inainte! Apoi o iei la dreapta!"
end
