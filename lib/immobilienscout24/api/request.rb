module Immobilienscout24
  module Api
    module Request

      def get(path, request_data = {}, request_options = {})
        request(:get, path, request_data, request_options)
      end

      def post(path, request_data = {}, request_options = {})
        request(:post, path, request_data, request_options)
      end

      def put(path, request_data = {}, request_options = {})
        request(:put, path, request_data, request_options)
      end

      def delete(path, request_data = {}, request_options = {})
        request(:delete, path, request_data, request_options)
      end

      def request(method, path, request_data = {}, request_options = {})
        request_options = {raw: false, raw_data: false}.merge(request_options)

        response = connection(request_options).send(method) do |request|
          req = configuration.request_strategy.
            new(request).configure(method, path, request_data, request_options)

          yield req if block_given?
        end

        return response if request_options.fetch(:raw)

        response.body
      end


    end
  end
end
