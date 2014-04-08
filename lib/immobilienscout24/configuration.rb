module Immobilienscout24
  class Configuration

    attr_accessor :consumer_key
    attr_accessor :consumer_secret
    attr_accessor :content_type
    attr_accessor :faraday_connection
    attr_accessor :faraday_adapter
    attr_accessor :faraday_logger
    attr_accessor :sandbox
    attr_accessor :live_url
    attr_accessor :sandbox_url
    attr_accessor :disable_logging
    attr_accessor :api_version

    def faraday_connection
      @faraday_connection ||= {url: api_url}
    end

    def faraday_adapter
      @faraday_adapter ||= :net_http
    end

    def faraday_logger
      @faraday_logger ||= [:logger]
    end

    def request_strategy
      @request_strategy ||= Immobilienscout24::Api::Request::Json
    end

    def api_url
      return sandbox_url if sandbox
      live_url
    end

    def live_url
      @live_url ||= 'https://rest.immobilienscout24.de/restapi'
    end

    def sandbox_url
      @sandbox_url ||= 'http://rest.sandbox-immobilienscout24.de/restapi'
    end

    def api_version
      @api_version ||= "v1.0"
    end

  end
end
