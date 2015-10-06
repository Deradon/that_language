require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ug (uyghur)" do
  include AvailableLanguagesHelper

  use_language_code "ug"
  use_language :"Uyghur"

  # Can we learn German together?
  assert_that_language_with "بىز نېمىسچىنى بىللە ئۆگەنسەك بولامدۇ؟"
end
