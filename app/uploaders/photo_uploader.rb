class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

   def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "user.png"].compact.join('_'))
  end
end
