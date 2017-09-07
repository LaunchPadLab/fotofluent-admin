class Word < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  include PgSearch
  after_destroy :delete_photo
  has_many :translations, inverse_of: :word, dependent: :destroy
  has_many :languages, through: :translations
  accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true
  scope :not_unsplash, -> { where.not('image LIKE ?', '%unsplash%') }
  pg_search_scope :search_by_word, :against => [:word, :grouping],  using: {
      tsearch: {
        prefix: true
      }
    }
  paginates_per 10

  def delete_photo
    remove_photo!
  end

  def optimized_image
    return image unless photo.url.present?
    photo.try(:optimized).try(:url)
  end
end
