#encoding: utf-8
module CarrierWave
  module Uploader
    class Base
      def copy_from(uploader)
        if file.blank?
          file = self.store!(uploader.file)
          file.copy_from uploader
        elsif file.respond_to? :copy_from
          file.copy_from uploader
        end
      end

      def copy_to(uploader)
        file.copy_to(uploader.path) if file.respond_to? :copy_to
      end
    end
  end
end
