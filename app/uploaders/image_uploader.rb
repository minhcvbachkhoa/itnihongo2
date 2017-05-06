class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  #version :small_size do
  #  process :resize_to_limit => [80, 80]
  #end

  #version :smaller_size do
  #  process :resize_to_limit => [50, 50]
  #end

  version :large_size do
    process :resize_to_limit => [700, 700]
  end

  version :larger_size do
    process :resize_to_limit => [1000, 1000]
  end
end
