#encoding: utf-8
module CarrierWave

  class SanitizedFile

    attr_accessor :copy_from_path

  end

  module Uploader
    module Cache

      alias_method :old_cache!, :cache!
      #
      # alias_method :old_sanitized_file, :sanitized_file
      #
      # def sanitized_file
      #   if file.kind_of? CarrierWave::Storage::Qiniu::File
      #     old_sanitized_file
      #     # file
      #   else
      #     old_sanitized_file
      #   end
      # end


      def cache!(new_file = sanitized_file)
        puts new_file.class

        old_cache! new_file

        if new_file.kind_of? CarrierWave::Storage::Qiniu::File

          @file.copy_from_path = new_file.path

        elsif new_file.kind_of? CarrierWave::Uploader::Base

          @file.copy_from_path = new_file.file.path

        end

      end
    end


    class Base
      def copy_from(uploader)
        if file.blank?
          store!(uploader.file)
          file.copy_from uploader.path
        elsif file.respond_to? :copy_from
          file.copy_from uploader.path
        end
      end

      def copy_to(uploader)
        file.copy_to(uploader.path) if file.respond_to? :copy_to
      end
    end
  end
end
