#encoding: utf-8
module CarrierWave
  module Uploader
    module Proxy
      def copy_from(uploader)
        if file.blank?
          file = ::CarrierWave::Storage::Qiniu::File.new(self, uploader.store_path(self.filename))  
        else
          file.copy_from uploader
        end
      end
    end
  end
end
