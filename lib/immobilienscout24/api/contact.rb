module Immobilienscout24
  module Api

    # Methods for the Contact API
    #
    # Per default the client will use the current user (`me`).
    # If you want to use an other user then you have to provide
    # the id in the options hash.
    #
    # @example
    #   client.contact(663515214, user: immoscout_user_id)
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Contact
    module Contact

      # Get a list of all contacts
      #
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 respons
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Contact/GETALL
      # @example
      #   client.contacts
      def contacts(options = {})
        get contact_endpoint("/contact", options)
      end

      def contact(id)
        get contact_endpoint("/contact/#{id}")
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
