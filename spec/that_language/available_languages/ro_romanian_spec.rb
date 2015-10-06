require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ro (romanian)" do
  include AvailableLanguagesHelper

  use_language_code "ro"
  use_language :"Romanian"

  # Do you speak (English/ Romanian)?
  assert_that_language_with "Vorbesti (engleza / romana)? / Vorbiti (engleza / romana)?"
end
