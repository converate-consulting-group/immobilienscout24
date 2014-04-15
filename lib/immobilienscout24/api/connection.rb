module Immobilienscout24
  module Api
    module Connection

      def connection
        connection = ::Faraday::Connection.new(configuration.faraday_connection) do |builder|
          builder.request  :oauth, oauth_credentials
          builder.request  :multipart
          builder.request  :url_encoded

          if configuration.logging?
            builder.response(*configuration.faraday_logger)
          end

          builder.response :follow_redirects

          unless request_options[:raw_response]
            builder.response :mashify
            builder.response :xml, content_type: /\bxml$/
            builder.response :json, content_type: /\bjson$/
          end

          builder.adapter configuration.faraday_adapter

          configuration.build_extension.call(builder, request_options)
        end

        connection
      end

    end
  end
end
