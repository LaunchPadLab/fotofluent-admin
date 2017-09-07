json.extract! word, :id, :word, :image, :image_link, :grouping, :pronunciation, :created_at, :updated_at, :translations
json.url word_url(word, format: :json)
