module Immobilienscout24
  module Api
    module Request

      class Xml < Base
        def configure(method, path, request_data = {}, request_options = {})
          self.headers['Content-Type'] = "application/xml; charset=utf-8"

          case method
          when :get
            self.url(path, request_data)
          when :post, :put, :delete
            self.path = path
            if request_options[:raw_request]
              self.body = request_data
            else
              self.body = request_data.to_xml unless request_data.empty?
            end
          end

          self
        end
      end

    end
  end
end
