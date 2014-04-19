module Immobilienscout24
  module Api

    # Methods for the Attachment API
    #
    # For all methods you must provide the immoscout estate id in the options hash.
    #
    # @example
    #   client.attachment(663515214, estate: estate_id)
    #
    # Per default the client will use the current user (`me`).
    # If you want to use an other user then you have to provide
    # the id in the options hash.
    #
    # @example
    #   client.attachment(663515214, estate: estate_id, user: immoscout_user_id)
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment
    module Attachment

      # Get a list of all attachments
      #
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment/GETALL
      # @example
      #   client.attachments(estate: 62412598)
      def attachments(options = {})
        get attachment_endpoint("/attachment", options)
      end

      # Get an attachment by id
      #
      # @param id [String, Integer] Attachment id
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment/GETbyID
      # @example
      #   client.attachment(663515214, estate: 62412598)
      def attachment(id, options = {})
        get attachment_endpoint("/attachment/#{id}", options)
      end

      # Create an attachment
      #
      # @param metadata [Hash] Object that contains the information about the attachment (title etc.)
      # @param attachment [String, Hash, Array, Attachment, File] Contains the file information
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment/POST
      # @example
      #   client.create_attachment(matadata, 'path/to/attachment.jpg', estate: 62412598)
      def create_attachment(metadata, attachment, options = {})
        attachment = ::Immobilienscout24::Helper::Attachment.new(attachment)
        multipart  = {metadata: metadata, attachment: attachment.build}

        with_request_options(multipart: true) do |client|
          client.post attachment_endpoint("/attachment", options), multipart
        end
      end

      # Update an attachment
      #
      # @param id [String, Integer] Attachment id
      # @param attachment [Hash] Attachment meta data to be updated (title etc.). You can't upload a new file.
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment/PUTbyID
      # @example
      #   client.update_attachment(663515214, attachment, estate: 62412598)
      def update_attachment(id, attachment, options = {})
        put attachment_endpoint("/attachment/#{id}", options), attachment
      end

      # Delete an attachment
      #
      # @param id [String, Integer] Attachment id
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment/DELETEbyID
      # @example
      #   client.delete_attachment(663515214, estate: 62412598)
      def delete_attachment(id, options = {})
        delete attachment_endpoint("/attachment/#{id}", options)
      end

      # -- endpoint

      # Generates the attachment endpoint
      #
      # @param resource [String, Integer] In most cases the id of the attachment
      # @param options [Hash] Additional options
      # @return [String] The url to the attachment resource
      def attachment_endpoint(resource, options = {})
        estate = options.fetch(:estate)
        estate_attachment_endpoint(estate, resource, options)
      end

      def estate_attachment_endpoint(estate, resource, options = {})
        [real_estate_endpoint("/realestate/#{estate}", options), resource].join
      end

    end
  end
end
