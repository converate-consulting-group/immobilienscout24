module Immobilienscout24
  module Api
    module Request

      def get(path, request_data = {})
        request(:get, path, request_data)
      end

      def post(path, request_data = {})
        request(:post, path, request_data)
      end

      def put(path, request_data = {})
        request(:put, path, request_data)
      end

      def delete(path, request_data = {})
        request(:delete, path, request_data)
      end

      def request(method, path, request_data = {})
        response = connection(request_options).send(method) do |request|
          strategy = configuration.request_strategy.new(request)
          configured_request = strategy.configure(method, path, request_data, request_options)

          yield configured_request if block_given?
        end

        return response if request_options[:raw_response]

        response.body
      end

      def with_request_options(options = {})
        @request_options = request_option_defaults.merge(options)

        yield self
      ensure
        @request_options = {}
      end

      def request_options
        @request_options ||= {}
      end

      def request_option_defaults
        {raw_response: false, raw_request: false}
      end

    end
  end
end
