class Word < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_word, :against => [:word, :grouping],  using: {
    tsearch: {
      prefix: true
    }
  }
  
  scope :not_unsplash, -> { where.not('image LIKE ?', '%unsplash%') }
  
  has_many :translations, inverse_of: :word, dependent: :destroy
  has_many :languages, through: :translations
  
  accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true
  before_save :set_word_image
  after_destroy :delete_photo
  
  # mount uploader must come AFTER before_save callback
  mount_uploader :photo, PhotoUploader
  
  paginates_per 10

  def delete_photo
    remove_photo!
  end

  def optimized_image
    photo.try(:optimized).try(:url)
  end

  def set_word_image
    use_image_link if self.image && self.image_changed?
  end

  def use_image_link
    self.remote_photo_url = self.image
  end
end
