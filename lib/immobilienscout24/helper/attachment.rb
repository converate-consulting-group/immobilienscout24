module Immobilienscout24
  module Helper

    # Basic helper for Immobilienscout24 attachments.
    # Will try to extract mime type and filename for you.
    #
    # This helper won't work for files without an file extension.
    # (e.g. 'my_picture' instead of 'my_picture.jpg')
    #
    # If you have files without an extension you can build this
    # helper class on your own:
    #
    # @example
    #
    #   Immobilienscout24::Helper::Attachment.new({
    #     file: 'path/to/file',
    #     content_type: 'image/jpeg',
    #     filename: 'estate.jpg',
    #     file_extension: '.jpg'
    #   })
    class Attachment

      attr_accessor :file
      attr_accessor :content_type
      attr_accessor :filename
      attr_accessor :file_extension

      def initialize(attachment)
        case attachment
        when Hash
          @file, @content_type = attachment[:file], attachment[:content_type]
          @filename, @file_extension = attachment[:filename], attachment[:file_extension]
        when Array
          @file, @content_type, @filename, @file_extension = attachment
        when String
          @file = attachment
        when File
          @file = attachment.path
        when Immobilienscout24::Helper::Attachment
          helper = attachment
          @file, @content_type, @filename = helper.build
          @file_extension = helper.file_extension
        end
      end

      def build
        [file, content_type, filename]
      end

      def file_extension
        @file_extension ||= File.extname(filename)
      end

      def filename
        @filname ||= File.basename(file)
      end

      def content_type
        @content_type ||= self.class.mime_types[file_extension]
      end

      def self.mime_types
        {
          ".jpg"  => "image/jpeg",
          ".jpeg" => "image/jpeg",
          ".gif"  => "image/gif",
          ".png"  => "image/png",
          ".pdf"  => "application/pdf"
        }
      end

    end

  end
end
