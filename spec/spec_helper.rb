$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec/its'
require 'that_language'

RSpec.configure do |config|
  config.order = 'random'
end
