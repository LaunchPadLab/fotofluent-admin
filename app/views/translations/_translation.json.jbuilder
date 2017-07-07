json.extract! translation, :id, :foreign_word, :foreign_pronunciation, :word_id, :language_id, :created_at, :updated_at, :language, :word
json.url translation_url(translation, format: :json)
