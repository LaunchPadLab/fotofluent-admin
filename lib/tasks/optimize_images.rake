namespace :images do
  desc 'Optimize image urls with imageoptim'
  task optimize: :environment do
    Word.in_batches(of: 15).each_record do |word|
      url = "https://img.gs/#{ENV['IMAGE_OPTIM_USERNAME']}/1600x900,fit/#{word.image}"
      HTTParty.get(url)
    end
    puts "images optimized to 1920 x 1080"
  end
end
