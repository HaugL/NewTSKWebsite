class ConvertDaysInProductsToIntegers < ActiveRecord::Migration
  def up
  	remove_column :products, :order_by_day
  	remove_column :products, :pick_up_day
  	add_column :products, :order_by_day, :integer
  	add_column :products, :pick_up_day, :integer
  end

  def down
  end
end
