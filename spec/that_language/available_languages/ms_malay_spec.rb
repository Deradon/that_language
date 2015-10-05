require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ms (malay)" do
  include AvailableLanguagesHelper

  use_language_code "ms"
  use_language :"Malay"

  # Do you speak Malay?
  assert_that_language_with "Bolehkah anda bercakap bahasa Malaysia?"
end
