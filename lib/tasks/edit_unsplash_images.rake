namespace :words do
  desc 'Remove cropping query strings from word image attr'
  task remove_crop: :environment do
    Word.unsplash.each do |word|
      match = /\?dpr/ =~ word.image
      if match
        word.update(image: word.image[0..(match - 1)])
        puts "word updated"
      end
    end
    puts "crop query strings removed from unsplash images!"
  end
end

