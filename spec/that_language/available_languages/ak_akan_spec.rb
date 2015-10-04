require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ak (akan)" do
  include AvailableLanguagesHelper

  use_language_code "ak"
  use_language :"Akan"

  # All human beings are born free and equal in dignity and rights.
  # They are endowed with reason and conscience and should act towards
  # one another in a spirit of brotherhood.
  assert_that_language_with <<-TEXT
    Wɔɑwo ɑdesɑmmɑ nyinɑɑ sɛ nnipɑ ɑ wɔwɔ ɑhofɑdi.
    Wɔn nyinɑɑ wɔ nidi ne kyɛfɑ koro.
    Wɔwɔ ɑdwene ne ɑhonim, nɑ ɛsɛ sɛ wobu wɔn ho wɔn ho sɛ ɑnuɑnom.
  TEXT
end
