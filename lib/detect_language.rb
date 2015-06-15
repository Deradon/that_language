require "detect_language/version"

require "detect_language/configuration"
require "detect_language/store"

module DetectLanguage
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    alias_method :config, :configuration
  end
end
