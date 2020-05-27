class PortfolioUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave if Rails.env.production?

  # Specify dimensions for images to resize to for appropriate display fit
  version :standard do
    process resize_to_fill: [400, 400, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  # Cloudinary will be utilized in production (Heroku) while local psql stored is utilized in development and testing environment.
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.cache_storage = :file
    end
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
