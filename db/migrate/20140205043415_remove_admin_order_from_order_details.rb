class RemoveAdminOrderFromOrderDetails < ActiveRecord::Migration
  def up
  	remove_column :order_details, :admin_order_id
  end

  def down
  	add_column :order_details, :admin_order_id, :integer
  end
end
