CarrierWave.configure do |config|

  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')

  config.storage          = :aws
  config.aws_bucket       = ENV['S3_BUCKET']
  config.aws_acl          = 'public-read'

  config.aws_credentials  = {
    access_key_id:      ENV['S3_KEY_ID'],
    secret_access_key:  ENV['S3_SECRET_KEY'],
    region:             ENV['S3_BUCKET_REGION']
  }
end
