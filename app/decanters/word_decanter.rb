class WordDecanter < Decanter::Base
  strict true
  input :word, :string
  input :image, :string
  input :photo, :string
  input :grouping, :string
  input :pronunciation, :string
  has_many :translations
end