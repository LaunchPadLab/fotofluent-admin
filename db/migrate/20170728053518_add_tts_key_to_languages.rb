class AddTtsKeyToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :tts_key, :string
  end
end
