require 'faraday'
require 'faraday_middleware'
require "immobilienscout24/api"
require "Immobilienscout24/helper/attachment"

module Immobilienscout24
  class Client
    include Api

    attr_accessor :token
    attr_accessor :token_secret

    def initialize(options = {})
      @consumer = options[:consumer]

      @token = options[:token]
      @token_secret = options[:token_secret]
    end

    def consumer
      @consumer ||= {
        consumer_key: configuration.consumer_key,
        consumer_secret: configuration.consumer_secret
      }
    end

    def oauth_credentials
      {token: token, token_secret: token_secret}.merge(consumer)
    end

    def configuration
      Immobilienscout24.configuration
    end

    def api_version
      configuration.api_version
    end

  end
end
