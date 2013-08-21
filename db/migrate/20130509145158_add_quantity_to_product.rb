class AddQuantityToProduct < ActiveRecord::Migration
  def up
  	add_column :products, :quantity, :decimal
  	change_column :order_details, :quantity, :decimal

  end

  def down
  	
  end
end
