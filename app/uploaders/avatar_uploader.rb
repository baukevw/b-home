class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :web do
    process resize_to_fit: [500, 500]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def filename
    rename_file if original_filename
  end

  protected

  ##
  # Rename file to improve security
  def rename_file
    existing = model.send(:"#{mounted_as}_identifier")
    # reuse the existing file name from the model if present.
    # otherwise, generate a new one (and cache it in an instance variable)
    @generated_filename ||= if existing.present?
                              existing
                            else
                              "#{sha1_for file}-#{SecureRandom.hex(4)}.png"
                            end
  end

  ##
  # Create hexdigest (hash) for uploaded file
  # Digest is based on the file, not filename
  def sha1_for(file)
    Digest::SHA1.hexdigest file.read
  end
end
