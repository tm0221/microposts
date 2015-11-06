class ImageUploader < CarrierWave::Uploader::Base  

  include CarrierWave::MiniMagick

  process :convert => 'jpg'

  version :thumb do
    process :resize_to_limit => [100, 100]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg)
  end

  def filename
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

end