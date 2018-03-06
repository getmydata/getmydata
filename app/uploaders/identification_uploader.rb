class IdentificationUploader < CarrierWave::Uploader::Base
  include Cloudinary: :CarrierWave

end
