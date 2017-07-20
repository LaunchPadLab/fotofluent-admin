class Word < ApplicationRecord
  has_many :translations, inverse_of: :word, dependent: :destroy
  has_many :languages, through: :translations
  accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true
  scope :unsplash, -> { where('image LIKE ?', '%unsplash%') }
  pg_search_scope :search_by_word, :against => :word,  using: {
      tsearch: {
        prefix: true
      }
    }
  paginates_per 10
end
