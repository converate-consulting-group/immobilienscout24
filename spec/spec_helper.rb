require 'pry'
require 'vcr'
require 'json_spec'
require 'immobilienscout24'

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.include JsonSpec::Helpers
  config.extend IntegrationSupport
end



