class ChangeSpellingToWord < ActiveRecord::Migration[5.1]
  def change
    rename_column :translations, :foreign_spelling, :foreign_word
  end
end
