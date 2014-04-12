module Immobilienscout24
  module Api
    module Request

      class Json < Base

        def content_type
          "application/json"
        end

        def serialized_data(data)
          data.to_json
        end

        def extension
          :json
        end

      end

    end
  end
end
