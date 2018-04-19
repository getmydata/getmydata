class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  #after :remove, :clear_uploader

  def clear_uploader
    @file = @filename = @original_filename = @cache_id = @version = @storage = nil
    model.send(:write_attribute, mounted_as, nil)
  end
end
