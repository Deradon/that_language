require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "as (assamese)" do
  include AvailableLanguagesHelper

  use_language_code "as"
  use_language :"Assamese"

  # Do you speak English?
  assert_that_language_with "আপুনি ইংৰাজি ভাষা কব পাৰেনে?"
end
