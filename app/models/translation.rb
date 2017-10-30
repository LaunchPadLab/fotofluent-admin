class Translation < ApplicationRecord
  scope :from_unsplash, -> { includes(:word).where('words.image LIKE ?', '%unsplash.com%').references(:words) }
  scope :for_language, -> (lang) { includes(:language).where(languages: { tts_key: lang }) }
  scope :for_grouping, -> (group) { includes(:word).where(words: { grouping: group }) if group }
  belongs_to :word
  belongs_to :language
end
