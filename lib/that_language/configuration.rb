module ThatLanguage
  class Configuration
    attr_reader :wordlist_path

    def initialize
      @wordlist_path = File.absolute_path(
        File.join(File.dirname(__FILE__), '../../wordlists/wordlist-10k.pstore')
      )
    end
  end
end