require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "pa (panjabi)" do
  include AvailableLanguagesHelper

  use_language_code "pa"
  use_language :"Panjabi"

  # Please speak more slowly
  assert_that_language_with "ਤੁਸੀਂ ਕਿਰਪਾ ਕਰਕੇ ਹੌਲੀ ਬੋਲੋ ਜੀ"
end
