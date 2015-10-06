require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "xh (xhosa)" do
  include AvailableLanguagesHelper

  use_language_code "xh"
  use_language :"Xhosa"

  # Do you speak English?
  assert_that_language_with "Uyakwazi ukuthetha isiNgesi?"
end
