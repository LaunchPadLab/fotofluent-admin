class AddLanguageKeyToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :language_key, :string
    add_index :languages, :language_key
  end
end
