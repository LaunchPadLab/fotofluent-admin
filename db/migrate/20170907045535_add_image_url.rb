class AddImageUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :photo, :text
  end
end
