require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "kr (kanuri)" do
  include AvailableLanguagesHelper
  use_language_code "kr"

  assert_that_language_with "<TODO>"
end
