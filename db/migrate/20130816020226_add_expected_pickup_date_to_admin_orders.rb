class AddExpectedPickupDateToAdminOrders < ActiveRecord::Migration
  def up
  	add_column :admin_orders, :expected_pickup_date, :date
  end
  def down
  	remove_column :admin_orders, :expected_pickup_date
  end
end
