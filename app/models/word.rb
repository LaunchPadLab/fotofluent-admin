class Word < ApplicationRecord
  has_many :translations, inverse_of: :word, dependent: :destroy
  has_many :languages, through: :translations
  accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true
end
