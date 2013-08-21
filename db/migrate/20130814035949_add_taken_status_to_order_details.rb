class AddTakenStatusToOrderDetails < ActiveRecord::Migration
  def change
  	add_column :order_details, :taken, :boolean, default: false
  end
end
