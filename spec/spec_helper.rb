require 'pry'
require 'yaml'
require 'vcr'
require 'hashie'
require 'json_spec'
require 'immobilienscout24'

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.include JsonSpec::Helpers
  config.include EstateSupport
  config.extend IntegrationSupport
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(File.join(fixture_path, file))
end

def mashify_fixture(file)
  Hashie::Mash.new(JSON.parse(fixture(file)))
end
