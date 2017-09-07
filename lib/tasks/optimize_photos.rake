namespace :photos do
  desc 'Upload smaller, optimized image files to S3 from image link'
  task optimize: :environment do
    Word.in_batches(of: 10).each_record do |word|
      word.remote_photo_url = word.image
      word.save
    end
    puts "images optimized to 1920 x 1080 files"
  end
end
