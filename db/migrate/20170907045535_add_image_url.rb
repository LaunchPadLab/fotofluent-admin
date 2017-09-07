class AddImageUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :words, :image, :image_link
    add_column :words, :image, :text
  end
end
