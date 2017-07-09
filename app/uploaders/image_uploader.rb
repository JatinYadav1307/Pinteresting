# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::Compatibility::Paperclip
  include CarrierWave::MiniMagick
  process resize_to_fill: [600, 600]
  process convert: 'png'


  version :medium do
    process :resize_to_fill => [400, 400]
  end
  
  version :thumb do
    process :resize_to_fit => [150, 150]
  end     

  CarrierWave.configure do |config|
    config.dropbox_app_key = "gym1z8iddsk0ug0"
    config.dropbox_app_secret = "a8cy9934ao5u3vj"
    config.dropbox_access_token = "jgmsy528lmitnbya"
    config.dropbox_access_token_secret = "dpwjt9a8wg3i3l2"
    config.dropbox_user_id = "203020788"
    config.dropbox_access_type = "auto"
  end

  # Choose what kind of storage to use for this uploader:
  storage :dropbox
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
