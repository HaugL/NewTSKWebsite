class RemoveSourcColumnsFromProducts < ActiveRecord::Migration
  def up
  	remove_column :products, :source_id
  	remove_column :products, :source_notes
  end

  def down
  	add_column :products, :source_id, :integer
  	add_column :products, :source_notes, :text
  end
end
