if Rails.env.staging? || Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        aws_region:            ENV.fetch('AWS_REGION') # Required
  }
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/"
    config.fog_directory = ENV.fetch('S3_BUCKET_NAME')
    config.fog_attributes = {'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

end

