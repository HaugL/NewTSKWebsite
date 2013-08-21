class RefactorProductsTableForPreOrders < ActiveRecord::Migration
  def up
  	remove_column :products, :quantity
  	remove_column :products, :unit_id
  	remove_column :products, :price_per_unit
  	add_column :products, :order_by_day, :string
  	add_column :products, :pick_up_day, :string
  	add_column :products, :unit, :string
  	add_column :products, :price, :decimal
  end

  def down
  	add_column :products, :quantity, :decimal
  	add_column :products, :unit_id, :integer
  	remove_column :products, :order_by_day
  	remove_column :products, :pick_up_day
    remove_column :products, :unit
  	remove_column :products, :price
  end
end
