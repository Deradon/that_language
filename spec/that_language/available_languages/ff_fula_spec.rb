require 'spec_helper'
require 'support/available_languages_helper'

describe ThatLanguage, "ff (Fula)" do
  include AvailableLanguagesHelper

  use_language_code "ff"
  use_language :"Fula"

  # All human beings are born free and equal in dignity and rights.
  # They are endowed with reason and conscience and should act towards
  # one another in a spirit of brotherhood.
  assert_that_language_with <<-TEXT
    Innama aadeeji fof poti, ndimɗidi e jibinannde to bannge hakkeeji.
    Eɓe ngoodi miijo e hakkilantaagal ete eɓe poti huufo ndirde
    e nder ɓ iynguyummaagu.
  TEXT
end
