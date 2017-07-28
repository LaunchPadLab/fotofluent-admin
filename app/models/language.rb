class Language < ApplicationRecord
  mount_uploader :flag, FlagUploader
  has_many :translations, dependent: :destroy
  has_many :words, through: :translations
end
