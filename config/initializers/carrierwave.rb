CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  elsif Rails.env.development?
    config.storage = :file
    config.enable_processing = true
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_KEY'],                # required
      :aws_secret_access_key  => ENV['S3_SECRET'],             # required
    }

    config.fog_public         = true
    config.fog_attributes     = {'Cache-Control'=>'max-age=315576000'}
    config.fog_directory      = ENV['S3_BUCKET_NAME']          # required
  end
end

