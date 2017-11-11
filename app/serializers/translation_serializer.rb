class TranslationSerializer < ActiveModel::Serializer
  attributes  :id, :foreign_word
  belongs_to :language
  belongs_to :word
end
