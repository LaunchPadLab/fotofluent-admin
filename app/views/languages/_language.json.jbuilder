json.extract! language, :id, :name, :language_key, :tts_key, :flag, :created_at, :updated_at, :translations
json.translations language.translations do |translation|
    json.partial! 'translations/translation', translation: translation
  end
json.url language_url(language, format: :json)
