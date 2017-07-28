class AddFlagToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :flag, :text
  end
end
