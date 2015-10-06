require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "sd (Sindhi)" do
  include AvailableLanguagesHelper

  use_language_code "sd"
  use_language :"Sindhi"

  # Do you understand me now?
  assert_that_language_with "توهان هاڻ منهنجي ڳالھ سمجهي؟"
end
