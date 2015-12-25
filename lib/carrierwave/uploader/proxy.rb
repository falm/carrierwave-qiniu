#encoding: utf-8
module CarrierWave
  module Uploader
    module Proxy
      def copy_from(uploader)
        file.copy_from uploader 
      end
    end
  end
end
