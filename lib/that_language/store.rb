require 'pstore'

module ThatLanguage
  class Store
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def to_h
      Hash.new.tap do |hash|
        within_pstore do
          # FIXME: Change `pstore[:locales]` to pstore[:language_codes]
          hash[:language_codes] = pstore[:locales]
          hash[:language_codes].each do |language_code|
            hash[language_code] = pstore[language_code]
          end
        end
      end
    end

    def exists?
      File.exists?(path)
    end

    private

    def pstore
      @pstore ||= PStore.new(path) if exists?
    end

    def within_pstore(&block)
      pstore.transaction(&block)
    end
  end
end
