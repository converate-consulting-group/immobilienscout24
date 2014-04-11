module Immobilienscout24
  module Api
    module User

      def user(id)
        get user_endpoint("/user/#{id}")
      end

      def current_user
        user("me")
      end

      # -- endpoint

      def user_endpoint(resource)
        ["api/offer/#{api_version}", resource].join
      end

    end
  end
end
