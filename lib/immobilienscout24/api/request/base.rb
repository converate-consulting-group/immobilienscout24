require 'delegate'

module Immobilienscout24
  module Api
    module Request

      class Base

        attr_reader :request
        attr_reader :configuration

        def initialize(request, configuration = {})
          @request = request
          @configuration = configuration
        end

        def serialized_data(data)
          raise NotImplementedError
        end

        def content_type
          raise NotImplementedError
        end

        def configure
          set_accept_header

          return configure_multipart_request if multipart?

          set_content_type

          return configure_get_request if get?
          configure_post_request
        end

        def set_accept_header
          request.headers['Accept'] = content_type
        end

        def set_content_type
          request.headers['Content-Type'] = "#{content_type};charset=UTF-8"
        end

        def configure_multipart_request
          request.path = path
          request.body = prepared_multipart_data
          request
        end

        def configure_get_request
          request.url(path, request_data)
          request
        end

        def configure_post_request
          request.path = path
          if raw_request?
            request.body = request_data
          else
            request.body = serialized_data(request_data) unless request_data.nil?
          end

          request
        end

        def path
          configuration[:path]
        end

        def multipart?
          !!request_options[:multipart]
        end

        def raw_request?
          !!request_options[:raw_request]
        end

        def request_data
          configuration[:request_data]
        end

        def request_options
          configuration[:request_options]
        end

        def request_method
          configuration[:method]
        end

        def get?
          request_method == :get
        end

        def prepared_multipart_data
          request_data.inject({}) do |memo, (key, value)|
            if !value.is_a?(Faraday::UploadIO)
              io_value  = StringIO.new(serialized_data(value))
              memo[key] = Faraday::UploadIO.new(io_value, content_type, "#{key}.json")
            else
              memo[key] = value
            end
            memo
          end
        end

      end

    end
  end
end
