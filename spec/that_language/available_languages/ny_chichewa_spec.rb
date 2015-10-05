require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ny (chichewa)" do
  include AvailableLanguagesHelper

  use_language_code "ny"
  use_language :"Chichewa"

  # The lion runs away from people.
  assert_that_language_with "Mikango iku thawa munthu"
end
