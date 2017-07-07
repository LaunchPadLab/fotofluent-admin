json.extract! word, :id, :word, :image, :grouping, :pronunciation, :created_at, :updated_at, :translations
json.url word_url(word, format: :json)
