require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "br (breton)" do
  include AvailableLanguagesHelper
  use_language_code "br"

  assert_that_language_with "Trugarez vras."
end