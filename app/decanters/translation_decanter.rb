class TranslationDecanter < Decanter::Base
  strict true
  input :foreign_word, :string
  input :foreign_pronunciation, :string
  input :word_id, :integer
  input :language_id, :integer
end