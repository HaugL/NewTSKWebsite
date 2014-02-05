class RemoveOrderingDatesFromOrderDetails < ActiveRecord::Migration
  def up
  	remove_column :order_details, :order_placement_date
  	remove_column :order_details, :order_pickup_date
  end

  def down
  	add_column :order_details, :order_placement_date, :date
  	add_column :order_details, :order_pickup_date, :date
  end
end
