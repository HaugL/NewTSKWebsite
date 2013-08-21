class AddSourceToProduct < ActiveRecord::Migration
  def up
  	add_column :products, :source_id, :integer
  	add_column :products, :source_notes, :text
  end

  def down
  	remove_column :products, :source_id
  end
end
