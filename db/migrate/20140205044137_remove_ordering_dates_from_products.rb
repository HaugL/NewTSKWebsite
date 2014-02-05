class RemoveOrderingDatesFromProducts < ActiveRecord::Migration
  def up
  	remove_column :products, :order_by_day
  	remove_column :products, :pick_up_day
  end

  def down
  	add_column :products, :order_by_day, :date
  	add_column :products, :pick_up_day, :date
  end
end
