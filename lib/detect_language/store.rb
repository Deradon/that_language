require 'pstore'

module DetectLanguage
  class Store
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def to_h
      Hash.new.tap do |hash|
        within_pstore do
          hash[:locales] = pstore[:locales]
          hash[:locales].each do |locale|
            hash[locale] = pstore[locale]
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
