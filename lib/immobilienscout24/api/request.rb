module Immobilienscout24
  module Api
    module Request

      def get(path, request_data = nil, &block)
        request(:get, path, request_data, &block)
      end

      def post(path, request_data = nil, &block)
        request(:post, path, request_data, &block)
      end

      def put(path, request_data = nil, &block)
        request(:put, path, request_data, &block)
      end

      def delete(path, request_data = nil, &block)
        request(:delete, path, request_data, &block)
      end

      def request(method, path, request_data = nil, &block)
        response = connection(request_options).send(method) do |request|
          request_config = {method: method, path: path, request_data: request_data, request_options: request_options}
          strategy = configuration.request_strategy.new(request, request_config)
          configured_request = strategy.configure

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
