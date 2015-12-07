module ThatLanguage
  class Configuration
    def wordlist_path
      @wordlist_path ||= File.absolute_path(
        File.join(File.dirname(__FILE__), '../../wordlists/10k/')
      )
    end

    def wordlist_path=(path)
      @wordlist_path = path
    end
  end
end
