module Immobilienscout24
  module Api

    # Methods for the Attachment API
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/attachment
    module Attachment

      def create_attachment(metadata, attachment, options = {})
        attachment = ::Immobilienscout24::Helper::Attachment.new(attachment).build
        multipart  = {metadata: metadata, attachment: Faraday::UploadIO.new(*attachment)}

        with_request_options(multipart: true) do |client|
          client.post attachment_endpoint("/attachment", options), multipart
        end
      end

      # -- endpoint

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
