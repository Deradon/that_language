require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ht (haitian)" do
  include AvailableLanguagesHelper

  use_language_code "ht"
  use_language :"Haitian"

  # Do you speak (English/ Creole)?
  assert_that_language_with "es'ke ou pale engle/kreyol"
end
