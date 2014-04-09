module Immobilienscout24
  module Api
    module User

      def user(id)
        get user_endpoint("/user/#{id}")
      end

      def current_user
        user("me")
      end

      def user_endpoint(resource)
        "api/offer/#{configuration.api_version}#{resource}"
      end

    end
  end
end
