class AddGroupingToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :grouping, :string
    add_column :words, :pronunciation, :string
  end
end
