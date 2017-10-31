class ChangeTtsKeyToLanguageCode < ActiveRecord::Migration[5.1]
  def change
    rename_column :languages, :tts_key, :language_code
  end
end
