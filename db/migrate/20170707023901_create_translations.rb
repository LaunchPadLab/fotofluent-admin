class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :foreign_spelling
      t.string :foreign_pronunciation
      t.references :word, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
