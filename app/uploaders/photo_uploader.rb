class PhotoUploader < CarrierWave::Uploader::Base

include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

version :thumb do
  process :resize_to_fit => [100,100]
end

def extension_allowlist
  %w(jpg jpeg gif png)
end

end

