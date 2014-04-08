require "immobilienscout24/configuration"
require 'immobilienscout24/client'

module Immobilienscout24

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def client(options = {})
      Client.new(options)
    end

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    def respond_to?(method)
      client.respond_to?(method) || super
    end
  end

end

