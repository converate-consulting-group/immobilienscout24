module Immobilienscout24
  module Api
    module Request

      class Json < Base

        def configure(method, path, request_data = {}, request_options = {})
          self.headers['Content-Type'] = "application/json; charset=utf-8"

          case method
          when :get
            self.url(path, request_data)
          when :post, :put, :delete
            self.path = path

            if request_options.fetch(:raw_data)
              self.body = request_data
            else
              self.body = request_data.to_json unless request_data.empty?
            end
          end

          self
        end

      end

    end
  end
end
