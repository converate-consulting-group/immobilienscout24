module Immobilienscout24
  module Api
    module Connection

      def connection(options = {})
        options = {raw_response: false}.merge(options)

        connection = ::Faraday::Connection.new(configuration.faraday_connection) do |builder|
          builder.request  :oauth, oauth_credentials
          builder.request  :url_encoded
          builder.response(*configuration.faraday_logger) unless configuration.disable_logging
          builder.response :raise_error
          builder.response :follow_redirects

          unless options[:raw_response]
            builder.response :mashify
            builder.response :xml, content_type: /\bxml$/
            builder.response :json, content_type: /\bjson$/
          end

          builder.use :instrumentation
          builder.adapter configuration.faraday_adapter
        end

        connection
      end

    end
  end
end
