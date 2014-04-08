require 'delegate'

module Immobilienscout24
  module Api
    module Request

      class Base < SimpleDelegator

        def initialize(request)
          super(request)
        end

        def configure(method, path, request_data = {}, request_options = {})
          # implement
        end

      end

    end
  end
end
