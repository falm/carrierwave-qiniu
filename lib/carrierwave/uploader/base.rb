#encoding: utf-8
module CarrierWave
  module Uploader
    class Base
      def copy_from(uploader)
        if file.blank?
          file = ::CarrierWave::Storage::Qiniu::File.new(self, self.store_path(self.filename))
          file.copy_from uploader
        else
          file.copy_from uploader
        end
      end
    end
  end
end
