class Word < ApplicationRecord
  mount_uploader :image, ImageUploader
  include PgSearch
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

  def optimized_image
    return image_link unless image.url.present?
    image.try(:optimized).try(:url)
  end
end
