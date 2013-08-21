class RefactorOrderDetailsForPreOrders < ActiveRecord::Migration
  def up
  	add_column :order_details, :order_placement_date, :date
  	add_column :order_details, :order_pickup_date, :date
  end

  def down
  end
end
