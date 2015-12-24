# encoding: utf-8

module CarrierWave
  module Uploader
    module Proxy

      def copy(uploader)
        file.copy(uploader) if file.respond_to?(:copy)
      end

    end # Proxy
  end # Uploader
end # CarrierWave
