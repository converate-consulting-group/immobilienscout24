module Immobilienscout24
  module Api
    module Request

      class Xml < Base

        def content_type
          "application/xml"
        end

        def serialized_data(data)
          data.to_xml
        end

      end

    end
  end
end
