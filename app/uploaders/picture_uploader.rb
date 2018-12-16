# frozen_string_literal: true

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  cloudinary_transformation transformation:
    { width: 640, height: 480, crop: :limit }
end
