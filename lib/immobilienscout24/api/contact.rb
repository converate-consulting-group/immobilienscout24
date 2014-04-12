module Immobilienscout24
  module Api

    # Methods for the Contact API
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Contact
    module Contact

      def contacts(options = {})
        get contact_endpoint("/contact", options)
      end

      def create_contact(contact, options = {})
        post contact_endpoint("/contact", options), contact
      end

      def update_contact(id, contact, options = {})
        put contact_endpoint("/contact/#{id}", options), contact
      end

      # -- endpoint

      def contact_endpoint(resource, options = {})
        options = {user: "me"}.merge(options)
        user_contact_endpoint(options.fetch(:user), resource, options)
      end

      def user_contact_endpoint(user, resource, options = {})
        [user_endpoint("/user/#{user}"), resource].join
      end

    end

  end
end
