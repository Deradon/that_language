require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "tl (tagalog)" do
  include AvailableLanguagesHelper

  use_language_code "tl"
  use_language :"Tagalog"

  # How do you say ... in Tagalog?
  assert_that_language_with "Paano mo sabihin ang ... sa tagalog?"
end
