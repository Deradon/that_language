require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "jv (javanese)" do
  include AvailableLanguagesHelper

  use_language_code "jv"
  use_language :"Javanese"

  # Do you speak Javanese? (formal)
  assert_that_language_with "Punạpạ panjenengan saged bạsạ Jạwi"

  # Do you speak Javanese? (informal)
  assert_that_language_with "Ạpạ kowé isạ bạsạ Jạwạ"
end
