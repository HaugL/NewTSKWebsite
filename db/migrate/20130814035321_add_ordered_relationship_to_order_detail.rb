class AddOrderedRelationshipToOrderDetail < ActiveRecord::Migration
  def up
  	add_column :order_details, :ordered, :boolean, default: false
  	add_column :order_details, :admin_order_id, :integer
  end

  def down
  	remove_column :order_details, :ordered
  	remove_column :order_details, :admin_order_id
  end
end
